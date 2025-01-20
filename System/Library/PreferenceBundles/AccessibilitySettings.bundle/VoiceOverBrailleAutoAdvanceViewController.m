@interface VoiceOverBrailleAutoAdvanceViewController
- (double)maximumValue;
- (double)minimumValue;
- (double)numericalPreferenceValue;
- (double)stepAmount;
- (id)activity;
- (id)localizedFooterText;
- (id)localizedTitle;
- (int64_t)keyboardTypeForSpecifier:(id)a3;
- (void)setNumericalPreferenceValueFromUser:(double)a3;
@end

@implementation VoiceOverBrailleAutoAdvanceViewController

- (id)activity
{
  v2 = [(VoiceOverBrailleAutoAdvanceViewController *)self specifier];
  v3 = [v2 propertyForKey:@"activity"];

  return v3;
}

- (double)minimumValue
{
  return kAXSVoiceOverBrailleAutoAdvanceDurationMin;
}

- (double)maximumValue
{
  return kAXSVoiceOverBrailleAutoAdvanceDurationMax;
}

- (int64_t)keyboardTypeForSpecifier:(id)a3
{
  return 8;
}

- (double)numericalPreferenceValue
{
  v3 = [(VoiceOverBrailleAutoAdvanceViewController *)self activity];
  v4 = [v3 brailleAutoAdvanceDuration];

  if (v4)
  {
    v5 = [(VoiceOverBrailleAutoAdvanceViewController *)self activity];
    v6 = [v5 brailleAutoAdvanceDuration];
    [v6 doubleValue];
    double v8 = v7;
  }
  else
  {
    v5 = +[AXSettings sharedInstance];
    [v5 voiceOverBrailleAutoAdvanceDuration];
    double v8 = v9;
  }

  return v8;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  v5 = [(VoiceOverBrailleAutoAdvanceViewController *)self activity];

  if (v5)
  {
    id v7 = +[NSNumber numberWithDouble:a3];
    v6 = [(VoiceOverBrailleAutoAdvanceViewController *)self activity];
    [v6 setBrailleAutoAdvanceDuration:v7];
  }
  else
  {
    id v7 = +[AXSettings sharedInstance];
    [v7 setVoiceOverBrailleAutoAdvanceDuration:a3];
  }
}

- (id)localizedTitle
{
  return settingsLocString(@"BRAILLE_DISPLAY_AUTO_ADVANCE", @"VoiceOverBrailleOptions");
}

- (id)localizedFooterText
{
  return settingsLocString(@"BRAILLE_DISPLAY_AUTO_ADVANCE_FOOTER_TEXT", @"VoiceOverBrailleOptions");
}

- (double)stepAmount
{
  return 0.1;
}

@end