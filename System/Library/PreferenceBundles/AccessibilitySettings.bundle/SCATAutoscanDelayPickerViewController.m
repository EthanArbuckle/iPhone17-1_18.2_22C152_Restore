@interface SCATAutoscanDelayPickerViewController
- (double)maximumValue;
- (double)minimumValue;
- (double)numericalPreferenceValue;
- (id)localizedTitle;
- (void)setNumericalPreferenceValueFromUser:(double)a3;
@end

@implementation SCATAutoscanDelayPickerViewController

- (double)maximumValue
{
  return kAXSAssistiveTouchStepIntervalMax;
}

- (double)minimumValue
{
  return kAXSAssistiveTouchStepIntervalMin;
}

- (double)numericalPreferenceValue
{
  v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchStepInterval];
  double v4 = v3;

  return v4;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchStepInterval:a3];
}

- (id)localizedTitle
{
  return (id)AXParameterizedLocalizedString();
}

@end