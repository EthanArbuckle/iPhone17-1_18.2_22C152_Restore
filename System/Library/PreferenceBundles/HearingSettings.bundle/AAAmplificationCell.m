@interface AAAmplificationCell
+ (id)valueLabels;
- (AAAmplificationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation AAAmplificationCell

- (AAAmplificationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)AAAmplificationCell;
  v5 = [(HearingSettingsValueSliderCell *)&v13 initWithStyle:1 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = +[UIColor systemGrayColor];
    v7 = +[UIImage _systemImageNamed:@"speaker.fill"];
    v8 = [v7 imageWithTintColor:v6 renderingMode:1];

    v9 = +[UIImage _systemImageNamed:@"speaker.wave.3.fill"];
    v10 = [v9 imageWithTintColor:v6 renderingMode:1];

    v11 = [(HearingSettingsValueSliderCell *)v5 slider];
    [v11 setMinimumValueImage:v8];
    [v11 setMaximumValueImage:v10];
    [v11 setSegmentCount:1];
  }
  return v5;
}

+ (id)valueLabels
{
  return 0;
}

- (id)accessibilityLabel
{
  return (id)paLocString();
}

- (id)accessibilityValue
{
  [(HearingSettingsValueSliderCell *)self sliderValue];

  return (id)AXFormatFloatWithPercentage();
}

@end