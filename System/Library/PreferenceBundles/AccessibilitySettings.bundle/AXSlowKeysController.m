@interface AXSlowKeysController
- (BOOL)numericalPreferenceEnabled;
- (BOOL)userCanDisableNumericalPreference;
- (double)maximumValue;
- (double)minimumValue;
- (id)localizedFooterText;
- (id)localizedTitle;
- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3;
- (void)setNumericalPreferenceValueFromUser:(double)a3;
@end

@implementation AXSlowKeysController

- (double)maximumValue
{
  return kAXSSlowKeysAcceptanceDelayMaximum;
}

- (double)minimumValue
{
  return kAXSSlowKeysAcceptanceDelayMinimum;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
}

- (BOOL)numericalPreferenceEnabled
{
  return _AXSSlowKeysEnabled() != 0;
}

- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3
{
}

- (BOOL)userCanDisableNumericalPreference
{
  return 1;
}

- (id)localizedFooterText
{
  return settingsLocString(@"SLOW_KEYS_FOOTER", @"KeyboardsSettings");
}

- (id)localizedTitle
{
  return settingsLocString(@"SLOW_KEYS", @"KeyboardsSettings");
}

@end