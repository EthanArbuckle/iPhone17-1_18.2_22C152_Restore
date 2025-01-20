@interface AABalanceSliderCell
+ (id)valueLabels;
- (AABalanceSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation AABalanceSliderCell

- (AABalanceSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AABalanceSliderCell;
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
  v2 = hearingLocString();
  v6[0] = v2;
  v3 = hearingLocString();
  v6[1] = v3;
  v4 = +[NSArray arrayWithObjects:v6 count:2];

  return v4;
}

- (id)accessibilityLabel
{
  return (id)paLocString();
}

- (id)accessibilityValue
{
  [(HearingSettingsValueSliderCell *)self sliderValue];
  double v3 = v2;
  v4 = paLocString();
  if (v3 > 0.5)
  {
    uint64_t v5 = paLocString();

    v4 = (void *)v5;
  }
  v6 = AXFormatFloatWithPercentage();
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6);

  return v7;
}

@end