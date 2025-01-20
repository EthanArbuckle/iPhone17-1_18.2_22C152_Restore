@interface SCATDwellTimePickerViewController
- (BOOL)userCanDisableNumericalPreference;
- (double)maximumValue;
- (double)minimumValue;
- (double)numericalPreferenceValue;
- (double)stepAmount;
- (id)localizedFooterText;
- (id)localizedTitle;
- (void)setNumericalPreferenceValueFromUser:(double)a3;
@end

@implementation SCATDwellTimePickerViewController

- (BOOL)userCanDisableNumericalPreference
{
  return 0;
}

- (double)maximumValue
{
  return kAXSSwitchControlDwellTimeMax;
}

- (double)minimumValue
{
  return kAXSSwitchControlDwellTimeMin;
}

- (double)numericalPreferenceValue
{
  v2 = +[AXSettings sharedInstance];
  [v2 switchControlDwellTime];
  double v4 = v3;

  return v4;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 setSwitchControlDwellTime:a3];
}

- (id)localizedFooterText
{
  return (id)AXParameterizedLocalizedString();
}

- (id)localizedTitle
{
  return (id)AXParameterizedLocalizedString();
}

- (double)stepAmount
{
  return 0.05;
}

@end