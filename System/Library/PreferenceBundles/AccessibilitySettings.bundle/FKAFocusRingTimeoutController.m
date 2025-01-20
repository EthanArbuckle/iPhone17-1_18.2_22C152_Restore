@interface FKAFocusRingTimeoutController
- (BOOL)numericalPreferenceEnabled;
- (BOOL)userCanDisableNumericalPreference;
- (double)maximumValue;
- (double)minimumValue;
- (double)numericalPreferenceValue;
- (double)stepAmount;
- (id)localizedFooterText;
- (id)localizedTextForValue:(double)a3;
- (id)localizedTitle;
- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3;
- (void)setNumericalPreferenceValueFromUser:(double)a3;
@end

@implementation FKAFocusRingTimeoutController

- (BOOL)numericalPreferenceEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 fullKeyboardAccessFocusRingTimeoutEnabled];

  return v3;
}

- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setFullKeyboardAccessFocusRingTimeoutEnabled:v3];
}

- (BOOL)userCanDisableNumericalPreference
{
  return 1;
}

- (double)maximumValue
{
  return kAXSFullKeyboardAccessFocusRingTimeoutMax;
}

- (double)minimumValue
{
  return kAXSFullKeyboardAccessFocusRingTimeoutMin;
}

- (double)numericalPreferenceValue
{
  v2 = +[AXSettings sharedInstance];
  [v2 fullKeyboardAccessFocusRingTimeout];
  double v4 = v3;

  return v4;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 setFullKeyboardAccessFocusRingTimeout:a3];
}

- (id)localizedFooterText
{
  return settingsLocString(@"FOCUS_RING_TIMEOUT_FOOTER", @"FullKeyboardAccessSettings");
}

- (id)localizedTitle
{
  return settingsLocString(@"FOCUS_RING_TIMEOUT", @"FullKeyboardAccessSettings");
}

- (double)stepAmount
{
  return 1.0;
}

- (id)localizedTextForValue:(double)a3
{
  return (id)AXFormatInteger();
}

@end