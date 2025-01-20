@interface AXCallAudioRoutingDelayController
- (BOOL)numericalPreferenceEnabled;
- (BOOL)userCanDisableNumericalPreference;
- (double)maximumValue;
- (double)minimumValue;
- (double)numericalPreferenceValue;
- (double)stepAmount;
- (id)localizedPickerFooterText;
- (id)localizedTitle;
- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3;
- (void)setNumericalPreferenceValueFromUser:(double)a3;
@end

@implementation AXCallAudioRoutingDelayController

- (double)maximumValue
{
  return kAXSCallAudioRoutingAutoAnswerMax;
}

- (double)minimumValue
{
  return kAXSCallAudioRoutingAutoAnswerMin;
}

- (double)stepAmount
{
  return kAXSCallAudioRoutingAutoAnswerStep;
}

- (double)numericalPreferenceValue
{
  v2 = +[AXSettings sharedInstance];
  [v2 callAudioRoutingAutoAnswerDelay];
  double v4 = v3;

  return v4;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 setCallAudioRoutingAutoAnswerDelay:a3];
}

- (BOOL)numericalPreferenceEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 callAudioRoutingAutoAnswerEnabled];

  return v3;
}

- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setCallAudioRoutingAutoAnswerEnabled:v3];
}

- (BOOL)userCanDisableNumericalPreference
{
  return 1;
}

- (id)localizedTitle
{
  return settingsLocString(@"AutoAnswerSetting", @"CallAudioRoutingSettings");
}

- (id)localizedPickerFooterText
{
  return settingsLocString(@"AutoAnswerFooterText", @"CallAudioRoutingSettings");
}

@end