@interface HKSPMultiLineSwitchCell
- (HKSPMultiLineSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation HKSPMultiLineSwitchCell

- (HKSPMultiLineSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)HKSPMultiLineSwitchCell;
  v5 = [(HKSPMultiLineSwitchCell *)&v9 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = [(HKSPMultiLineSwitchCell *)v5 textLabel];
  [v6 setNumberOfLines:0];

  v7 = [(HKSPMultiLineSwitchCell *)v5 textLabel];
  [v7 setAdjustsFontSizeToFitWidth:1];

  return v5;
}

@end