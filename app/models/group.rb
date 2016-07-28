# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Group < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :contact_email, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0 }
end

class Group < ActiveRecord::Base
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden  = true
    self.save
  end
end
