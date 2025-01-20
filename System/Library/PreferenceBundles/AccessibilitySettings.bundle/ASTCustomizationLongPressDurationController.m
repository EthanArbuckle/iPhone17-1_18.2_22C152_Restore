@interface ASTCustomizationLongPressDurationController
- (double)maximumValue;
- (double)minimumValue;
- (double)numericalPreferenceValue;
- (double)stepAmount;
- (id)localizedFooterText;
- (id)localizedTitle;
- (void)setNumericalPreferenceValueFromUser:(double)a3;
@end

@implementation ASTCustomizationLongPressDurationController

- (double)minimumValue
{
  return kAXSAssistiveTouchLongPressDurationMin;
}

- (double)maximumValue
{
  return kAXSAssistiveTouchLongPressDurationMax;
}

- (double)numericalPreferenceValue
{
  v2 = +[AXSettings sharedInstance];
  [v2 assistiveTouchLongPressActionDuration];
  double v4 = v3;

  return v4;
}

- (void)setNumericalPreferenceValueFromUser:(double)a3
{
  id v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchLongPressActionDuration:a3];
}

- (id)localizedFooterText
{
  return settingsLocString(@"LONG_PRESS_DURATION_FOOTER", @"HandSettings");
}

- (id)localizedTitle
{
  return settingsLocString(@"LONG_PRESS_DURATION", @"HandSettings");
}

- (double)stepAmount
{
  return 0.1;
}

@end