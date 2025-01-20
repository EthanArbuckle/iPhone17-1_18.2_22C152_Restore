@interface AANoiseSuppressorSliderCell
+ (id)valueLabels;
- (AANoiseSuppressorSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation AANoiseSuppressorSliderCell

- (AANoiseSuppressorSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AANoiseSuppressorSliderCell;
  v5 = [(HearingSettingsValueSliderCell *)&v9 initWithStyle:1 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(HearingSettingsValueSliderCell *)v5 slider];
    [v7 setSnapsToSegment:1];
  }
  return v6;
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