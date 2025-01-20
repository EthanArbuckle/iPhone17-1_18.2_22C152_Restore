@interface ASTMousePointerTimeoutController
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

@implementation ASTMousePointerTimeoutController

- (BOOL)numericalPreferenceEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchMousePointerTimeoutEnabled];

  return v3;
}

- (void)setNumericalPreferenceEnabledFromUser:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchMousePointerTimeoutEnabled:v3];
}

- (BOOL)userCanDisableNumericalPreference
{
  return 1;
}

- (double)maximumValue
{
  return kAXSAssistiveTouchMousePointerTimeoutMax;
}

- (double)minimumValue
{
  return kAXSAssistiveTouchMousePointerTimeoutMin;
}

- (double)numericalPreferenceValue
{
  v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchMousePointerTimeout];
  double v4 = v3;

  return v4;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchMousePointerTimeout:a3];
}

- (id)localizedFooterText
{
  return settingsLocString(@"MOUSE_POINTER_TIMEOUT_FOOTER", @"HandSettings");
}

- (id)localizedTitle
{
  return settingsLocString(@"MOUSE_POINTER_TIMEOUT", @"HandSettings");
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