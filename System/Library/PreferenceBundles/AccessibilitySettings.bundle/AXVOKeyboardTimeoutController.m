@interface AXVOKeyboardTimeoutController
- (BOOL)userCanDisableNumericalPreference;
- (double)maximumValue;
- (double)minimumValue;
- (double)numericalPreferenceValue;
- (double)stepAmount;
- (id)localizedFooterText;
- (id)localizedTitle;
- (void)setNumericalPreferenceValueFromUser:(double)a3;
@end

@implementation AXVOKeyboardTimeoutController

- (BOOL)userCanDisableNumericalPreference
{
  return 0;
}

- (double)maximumValue
{
  return kAXSVoiceOverContinuousPathStartTimeoutMax;
}

- (double)minimumValue
{
  return kAXSVoiceOverContinuousPathStartTimeoutMin;
}

- (double)numericalPreferenceValue
{
  v2 = +[AXSettings sharedInstance];
  [v2 voiceOverContinuousPathKeyboardStartTimeout];
  double v4 = v3;

  return v4;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 setVoiceOverContinuousPathKeyboardStartTimeout:a3];
}

- (id)localizedFooterText
{
  return settingsLocString(@"KEYBOARD_TIMING_TIMEOUT_FOOTER", @"VoiceOverSettings");
}

- (id)localizedTitle
{
  return settingsLocString(@"KEYBOARD_TIMING_TIMEOUT", @"VoiceOverSettings");
}

- (double)stepAmount
{
  return 0.2;
}

@end