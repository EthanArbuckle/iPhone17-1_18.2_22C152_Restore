@interface SCATActionRepeatPickerViewController
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

@implementation SCATActionRepeatPickerViewController

- (double)maximumValue
{
  return kAXSAssistiveTouchActionRepeatIntervalMax;
}

- (double)minimumValue
{
  return kAXSAssistiveTouchActionRepeatIntervalMin;
}

- (double)numericalPreferenceValue
{
  v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchActionRepeatInterval];
  double v4 = v3;

  return v4;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchActionRepeatInterval:a3];
}

- (BOOL)numericalPreferenceEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchActionRepeatEnabled];

  return v3;
}

- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchActionRepeatEnabled:v3];
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