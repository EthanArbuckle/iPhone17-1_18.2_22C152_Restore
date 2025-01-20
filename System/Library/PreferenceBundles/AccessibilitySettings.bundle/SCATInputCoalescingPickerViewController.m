@interface SCATInputCoalescingPickerViewController
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

@implementation SCATInputCoalescingPickerViewController

- (double)maximumValue
{
  double v2 = kAXSAssistiveTouchInputCoalescingDurationMax;
  v3 = +[AXSettings sharedInstance];
  [v3 switchControlAutoTapTimeout];
  double v5 = v4 - AXNumericalPreferenceDefaultStepAmount;

  if (v2 >= v5) {
    return v5;
  }
  else {
    return v2;
  }
}

- (double)minimumValue
{
  return kAXSAssistiveTouchInputCoalescingDurationMin;
}

- (double)numericalPreferenceValue
{
  double v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchInputCoalescingDuration];
  double v4 = v3;

  return v4;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchInputCoalescingDuration:a3];
}

- (BOOL)numericalPreferenceEnabled
{
  double v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchInputCoalescingEnabled];

  return v3;
}

- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchInputCoalescingEnabled:v3];
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