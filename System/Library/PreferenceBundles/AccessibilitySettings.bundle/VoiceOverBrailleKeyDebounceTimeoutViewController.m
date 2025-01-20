@interface VoiceOverBrailleKeyDebounceTimeoutViewController
- (double)maximumValue;
- (double)minimumValue;
- (double)numericalPreferenceValue;
- (double)stepAmount;
- (id)localizedFooterText;
- (id)localizedTitle;
- (int64_t)keyboardTypeForSpecifier:(id)a3;
- (void)setNumericalPreferenceValueFromUser:(double)a3;
@end

@implementation VoiceOverBrailleKeyDebounceTimeoutViewController

- (double)minimumValue
{
  return kAXSVoiceOverBrailleKeyDebounceTimeoutMin;
}

- (double)maximumValue
{
  return kAXSVoiceOverBrailleKeyDebounceTimeoutMax;
}

- (int64_t)keyboardTypeForSpecifier:(id)a3
{
  return 8;
}

- (double)numericalPreferenceValue
{
  v2 = +[AXSettings sharedInstance];
  [v2 voiceOverBrailleKeyDebounceTimeout];
  double v4 = v3;

  return v4;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 setVoiceOverBrailleKeyDebounceTimeout:a3];
}

- (id)localizedTitle
{
  return settingsLocString(@"BRAILLE_DISPLAY_KEY_DEBOUNCE_TIMEOUT", @"VoiceOverBrailleOptions");
}

- (id)localizedFooterText
{
  return settingsLocString(@"BRAILLE_DISPLAY_KEY_DEBOUNCE_TIMEOUT_FOOTER_TEXT", @"VoiceOverBrailleOptions");
}

- (double)stepAmount
{
  return 0.1;
}

@end