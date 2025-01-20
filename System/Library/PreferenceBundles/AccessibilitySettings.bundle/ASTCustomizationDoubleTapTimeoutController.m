@interface ASTCustomizationDoubleTapTimeoutController
- (double)maximumValue;
- (double)minimumValue;
- (double)numericalPreferenceValue;
- (double)stepAmount;
- (id)localizedFooterText;
- (id)localizedTitle;
- (void)setNumericalPreferenceValueFromUser:(double)a3;
@end

@implementation ASTCustomizationDoubleTapTimeoutController

- (double)minimumValue
{
  return 0.1;
}

- (double)maximumValue
{
  return 0.75;
}

- (double)numericalPreferenceValue
{
  v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchDoubleTapActionTimeout];
  double v4 = v3;

  return v4;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchDoubleTapActionTimeout:a3];
}

- (id)localizedFooterText
{
  return settingsLocString(@"DOUBLE_TAP_TIMEOUT_FOOTER", @"HandSettings");
}

- (id)localizedTitle
{
  return settingsLocString(@"DOUBLE_TAP_TIMEOUT", @"HandSettings");
}

- (double)stepAmount
{
  return 0.05;
}

@end