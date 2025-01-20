@interface AXPointerControllerVoiceOverSpeakUnderPointerOptions
- (BOOL)numericalPreferenceEnabled;
- (BOOL)userCanDisableNumericalPreference;
- (double)maximumValue;
- (double)minimumValue;
- (double)numericalPreferenceValue;
- (double)stepAmount;
- (id)localizedTextForValue:(double)a3;
- (id)localizedTitle;
- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3;
- (void)setNumericalPreferenceValueFromUser:(double)a3;
@end

@implementation AXPointerControllerVoiceOverSpeakUnderPointerOptions

- (BOOL)numericalPreferenceEnabled
{
  return _AXSVoiceOverSpeakUnderPointerEnabled() != 0;
}

- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3
{
}

- (BOOL)userCanDisableNumericalPreference
{
  return 1;
}

- (double)maximumValue
{
  return kAXSVoiceOverSpeakUnderPointerDelayMaximum;
}

- (double)minimumValue
{
  return kAXSVoiceOverSpeakUnderPointerDelayMinimum;
}

- (double)numericalPreferenceValue
{
  _AXSVoiceOverSpeakUnderPointerDelay();
  return v2;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  float v3 = a3;
  __AXSVoiceOverSpeakUnderPointerSetDelay(self, a2, v3);
}

- (id)localizedTitle
{
  return settingsLocString(@"VoiceOverSpeakUnderPointer", @"Accessibility-hello");
}

- (double)stepAmount
{
  return 0.1;
}

- (id)localizedTextForValue:(double)a3
{
  float v3 = +[NSNumber numberWithDouble:a3];
  v4 = AXFormatNumberWithOptions();

  return v4;
}

@end