@interface VoiceOverDoubleTapIntervalController
- (double)maximumValue;
- (double)minimumValue;
- (double)numericalPreferenceValue;
- (double)stepAmount;
- (id)localizedFooterText;
- (id)localizedTitle;
- (void)setNumericalPreferenceValueFromUser:(double)a3;
@end

@implementation VoiceOverDoubleTapIntervalController

- (double)minimumValue
{
  return kAXSVoiceOverDoubleTapIntervalMin;
}

- (double)maximumValue
{
  return kAXSVoiceOverDoubleTapIntervalMax;
}

- (double)numericalPreferenceValue
{
  v2 = +[AXSettings sharedInstance];
  [v2 voiceOverDoubleTapInterval];
  double v4 = v3;

  return v4;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 setVoiceOverDoubleTapInterval:a3];
}

- (id)localizedFooterText
{
  return settingsLocString(@"DOUBLE_TAP_INTERVAL_FOOTER_TEXT", @"VoiceOverSettings");
}

- (id)localizedTitle
{
  return settingsLocString(@"DOUBLE_TAP_INTERVAL_TITLE", @"VoiceOverSettings");
}

- (double)stepAmount
{
  return 0.05;
}

@end