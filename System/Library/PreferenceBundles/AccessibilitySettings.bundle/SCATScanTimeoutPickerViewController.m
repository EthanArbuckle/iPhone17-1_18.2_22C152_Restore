@interface SCATScanTimeoutPickerViewController
- (BOOL)numericalPreferenceEnabled;
- (BOOL)userCanDisableNumericalPreference;
- (double)maximumValue;
- (double)minimumValue;
- (double)numericalPreferenceValue;
- (double)stepAmount;
- (id)localizedFooterText;
- (id)localizedTitle;
- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3;
- (void)setNumericalPreferenceValueFromUser:(double)a3;
@end

@implementation SCATScanTimeoutPickerViewController

- (BOOL)numericalPreferenceEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchScanTimeoutEnabled];

  return v3;
}

- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchScanTimeoutEnabled:v3];
}

- (BOOL)userCanDisableNumericalPreference
{
  return 1;
}

- (double)maximumValue
{
  return kAXSAssistiveTouchScanTimeoutMax;
}

- (double)minimumValue
{
  return kAXSAssistiveTouchScanTimeoutMin;
}

- (double)numericalPreferenceValue
{
  v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchScanTimeout];
  double v4 = v3;

  return v4;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchScanTimeout:a3];
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
  return 1.0;
}

@end