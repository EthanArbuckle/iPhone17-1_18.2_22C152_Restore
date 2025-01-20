@interface AAStrengthSliderCell
+ (id)valueLabels;
- (AAStrengthSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (double)sliderValue;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation AAStrengthSliderCell

- (AAStrengthSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AAStrengthSliderCell;
  v5 = [(HearingSettingsValueSliderCell *)&v9 initWithStyle:1 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(HearingSettingsValueSliderCell *)v5 slider];
    [v7 setLocksToSegment:1];
  }
  return v6;
}

- (double)sliderValue
{
  v8.receiver = self;
  v8.super_class = (Class)AAStrengthSliderCell;
  [(HearingSettingsValueSliderCell *)&v8 sliderValue];
  double v3 = v2;
  v4 = +[PASettings sharedInstance];
  v5 = [v4 personalMediaConfiguration];
  v6 = (char *)[v5 level];

  if ((unint64_t)(v6 - 1) <= 2) {
    return dbl_2FEC0[(void)(v6 - 1)];
  }
  return v3;
}

+ (id)valueLabels
{
  double v2 = paDescriptionForLevel();
  v7[0] = v2;
  double v3 = paDescriptionForLevel();
  v7[1] = v3;
  v4 = paDescriptionForLevel();
  v7[2] = v4;
  v5 = +[NSArray arrayWithObjects:v7 count:3];

  return v5;
}

- (id)accessibilityLabel
{
  return (id)paLocString();
}

- (id)accessibilityValue
{
  double v2 = +[PASettings sharedInstance];
  double v3 = [v2 personalMediaConfiguration];
  [v3 level];

  return (id)paDescriptionForLevel();
}

@end