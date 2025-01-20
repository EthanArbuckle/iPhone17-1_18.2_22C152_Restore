@interface CACDimmingDelayPickerViewController
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

@implementation CACDimmingDelayPickerViewController

- (double)maximumValue
{
  return 20.0;
}

- (double)minimumValue
{
  return 0.05;
}

- (double)numericalPreferenceValue
{
  v2 = +[CACPreferences sharedPreferences];
  [v2 overlayFadeDelay];
  double v4 = v3;

  return v4;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v4 = +[CACPreferences sharedPreferences];
  [v4 setOverlayFadeDelay:a3];
}

- (BOOL)numericalPreferenceEnabled
{
  v2 = +[CACPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 overlayFadingEnabled];

  return v3;
}

- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[CACPreferences sharedPreferences];
  [v4 setOverlayFadingEnabled:v3];
}

- (BOOL)userCanDisableNumericalPreference
{
  return 1;
}

- (id)localizedFooterText
{
  return settingsLocString(@"OVERLAY_FADE_DELAY_FOOTER", @"CommandAndControlSettings");
}

- (id)localizedTitle
{
  return settingsLocString(@"OVERLAY_FADE_DELAY_TITLE", @"CommandAndControlSettings");
}

@end