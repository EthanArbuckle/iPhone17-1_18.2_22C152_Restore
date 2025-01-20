@interface SCATDelayAfterInputPickerViewController
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

@implementation SCATDelayAfterInputPickerViewController

- (double)maximumValue
{
  return kAXSAssistiveTouchDelayAfterInputMax;
}

- (double)minimumValue
{
  return kAXSAssistiveTouchDelayAfterInputMin;
}

- (double)numericalPreferenceValue
{
  v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchDelayAfterInput];
  double v4 = v3;

  return v4;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchDelayAfterInput:a3];
}

- (BOOL)numericalPreferenceEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchDelayAfterInputEnabled];

  return v3;
}

- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchDelayAfterInputEnabled:v3];
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