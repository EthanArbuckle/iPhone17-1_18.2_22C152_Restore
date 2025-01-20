@interface SCATHoldDurationPickerViewController
- (BOOL)numericalPreferenceEnabled;
- (BOOL)userCanDisableNumericalPreference;
- (double)maximumValue;
- (double)minimumValue;
- (double)numericalPreferenceValue;
- (id)localizedFooterText;
- (id)localizedTitle;
- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3;
- (void)setNumericalPreferenceValueFromUser:(double)a3;
@end

@implementation SCATHoldDurationPickerViewController

- (double)maximumValue
{
  double v2 = kAXSAssistiveTouchInputHoldDurationMax;
  v3 = +[AXSettings sharedInstance];
  v4 = (char *)[v3 switchControlTapBehavior];

  if (v4 == (unsigned char *)&dword_0 + 1)
  {
    v5 = +[AXSettings sharedInstance];
    [v5 switchControlAutoTapTimeout];
    double v7 = v6 - AXNumericalPreferenceDefaultStepAmount;

    if (v2 >= v7) {
      return v7;
    }
  }
  return v2;
}

- (double)minimumValue
{
  return kAXSAssistiveTouchInputHoldDurationMin;
}

- (double)numericalPreferenceValue
{
  double v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchInputHoldDuration];
  double v4 = v3;

  return v4;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchInputHoldDuration:a3];
}

- (BOOL)numericalPreferenceEnabled
{
  double v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchInputHoldEnabled];

  return v3;
}

- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchInputHoldEnabled:v3];
}

- (BOOL)userCanDisableNumericalPreference
{
  return 1;
}

- (id)localizedFooterText
{
  return (id)AXParameterizedLocalizedString();
}

- (id)localizedTitle
{
  return (id)AXParameterizedLocalizedString();
}

@end