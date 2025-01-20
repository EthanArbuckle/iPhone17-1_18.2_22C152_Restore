@interface AXUIVoiceOverBrailleAlertIntervalController
- (BOOL)infiniteTimeEnabled;
- (BOOL)numericalPreferenceEnabled;
- (BOOL)supportsInfiniteTime;
- (BOOL)userCanDisableNumericalPreference;
- (double)maximumValue;
- (double)minimumValue;
- (double)numericalPreferenceValue;
- (double)stepAmount;
- (id)localizedFooterText;
- (id)localizedTitle;
- (int64_t)keyboardTypeForSpecifier:(id)a3;
- (void)setInfiniteTimeEnabled:(BOOL)a3;
- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3;
- (void)setNumericalPreferenceValueFromUser:(double)a3;
@end

@implementation AXUIVoiceOverBrailleAlertIntervalController

- (BOOL)numericalPreferenceEnabled
{
  v2 = [MEMORY[0x1E4F49458] sharedInstance];
  char v3 = [v2 voiceOverBrailleAlertsEnabled];

  return v3;
}

- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F49458] sharedInstance];
  [v4 setVoiceOverBrailleAlertsEnabled:v3];
}

- (BOOL)userCanDisableNumericalPreference
{
  return 1;
}

- (double)minimumValue
{
  return *MEMORY[0x1E4F485A0];
}

- (double)maximumValue
{
  return *MEMORY[0x1E4F48598];
}

- (double)numericalPreferenceValue
{
  v2 = [MEMORY[0x1E4F49458] sharedInstance];
  [v2 voiceOverBrailleAlertDisplayDuration];
  double v4 = v3;

  return v4;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v4 = [MEMORY[0x1E4F49458] sharedInstance];
  [v4 setVoiceOverBrailleAlertDisplayDuration:a3];
}

- (id)localizedFooterText
{
  return AXUILocalizedStringForKey(@"BRAILLE_DISPLAY_TIMEOUT_FOOTER_TEXT");
}

- (BOOL)infiniteTimeEnabled
{
  v2 = [MEMORY[0x1E4F49458] sharedInstance];
  char v3 = [v2 voiceOverBrailleAlertShowUntilDismissed];

  return v3;
}

- (void)setInfiniteTimeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F49458] sharedInstance];
  [v4 setVoiceOverBrailleAlertShowUntilDismissed:v3];
}

- (BOOL)supportsInfiniteTime
{
  return 1;
}

- (id)localizedTitle
{
  return AXUILocalizedStringForKey(@"BRAILLE_DISPLAY_TIMEOUT");
}

- (double)stepAmount
{
  return 0.5;
}

- (int64_t)keyboardTypeForSpecifier:(id)a3
{
  return 8;
}

@end