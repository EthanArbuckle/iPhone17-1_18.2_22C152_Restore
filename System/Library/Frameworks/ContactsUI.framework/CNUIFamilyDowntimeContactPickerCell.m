@interface CNUIFamilyDowntimeContactPickerCell
+ (id)reuseIdentifier;
- (CNUIFamilyDowntimeContactPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation CNUIFamilyDowntimeContactPickerCell

- (CNUIFamilyDowntimeContactPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CNUIFamilyDowntimeContactPickerCell;
  return [(CNUIFamilyDowntimeContactPickerCell *)&v5 initWithStyle:1 reuseIdentifier:a4];
}

+ (id)reuseIdentifier
{
  return @"CNUIFamilyDowntimeContactPickerCellIdentifier";
}

@end