@interface _HTUIEvaluationViewControllerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsStateInBetween;
- (BOOL)_axIsStateInProgress;
- (double)_axProgress;
- (id)_axGuidanceTitle;
- (id)_axTapHearButton;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axBeforePlayingTones;
- (void)_axSetProgress:(double)a3;
- (void)_axSetupSubviews;
- (void)_axStopPlayingTones;
- (void)setupSubviews;
- (void)transitionToNextState;
- (void)updateProgressTo:(double)a3 immediately:(BOOL)a4;
@end

@implementation _HTUIEvaluationViewControllerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TtCC13HearingTestUI28HTUIEvaluationViewController4View";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (double)_axProgress
{
  MEMORY[0x270F0A440](self, &___HTUIEvaluationViewControllerViewAccessibility___axProgress);
  return result;
}

- (void)_axSetProgress:(double)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TtCC13HearingTestUI28HTUIEvaluationViewController4View", @"setupSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TtCC13HearingTestUI28HTUIEvaluationViewController4View", @"transitionToNextState", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TtCC13HearingTestUI28HTUIEvaluationViewController4View", @"updateProgressTo:immediately:", "v", "d", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TtCC13HearingTestUI28HTUIEvaluationViewController4View", @"didTapHear", "v", 0);
  [v3 validateClass:@"_TtCC13HearingTestUI28HTUIEvaluationViewController4View" hasSwiftFieldOfAnyClass:@"stageTitle"];
  [v3 validateClass:@"_TtCC13HearingTestUI28HTUIEvaluationViewController4View" hasSwiftFieldOfAnyClass:@"stageBody"];
  [v3 validateClass:@"_TtCC13HearingTestUI28HTUIEvaluationViewController4View" hasSwiftFieldOfAnyClass:@"guidanceTitle"];
  [v3 validateClass:@"_TtCC13HearingTestUI28HTUIEvaluationViewController4View" hasSwiftFieldOfAnyClass:@"completionLabel"];
  [v3 validateClass:@"_TtCC13HearingTestUI28HTUIEvaluationViewController4View" hasSwiftFieldOfAnyClass:@"tapHearButton"];
  [v3 validateClass:@"_TtCC13HearingTestUI28HTUIEvaluationViewController4View" hasSwiftField:@"state" withSwiftType:"State"];
  [v3 validateSwiftEnum:@"HearingTestUI.HTUIEvaluationViewController[class].View[class].State"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)_HTUIEvaluationViewControllerViewAccessibility;
  [(_HTUIEvaluationViewControllerViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(_HTUIEvaluationViewControllerViewAccessibility *)self _axSetupSubviews];
}

- (id)_axGuidanceTitle
{
  objc_super v3 = [(_HTUIEvaluationViewControllerViewAccessibility *)self safeSwiftValueForKey:@"stageTitle"];
  v4 = [(_HTUIEvaluationViewControllerViewAccessibility *)self safeSwiftValueForKey:@"stageBody"];
  v5 = accessibilityLocalizedString(@"HEARING_TEST_SESSION_GUIDANCE_TITLE");
  [(_HTUIEvaluationViewControllerViewAccessibility *)self _axProgress];
  if (v6 <= 0.0)
  {
    v8 = &stru_26F6C1428;
  }
  else
  {
    v7 = accessibilityLocalizedString(@"AX_HEARING_TEST_FINISHED_PERCENTAGE");
    [(_HTUIEvaluationViewControllerViewAccessibility *)self _axProgress];
    v12 = AXFormatFloatWithPercentage();
    AXCFormattedString();
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(v3, "text", v12);
  v13 = [v4 text];
  v10 = __UIAXStringForVariables();

  return v10;
}

- (id)_axTapHearButton
{
  return (id)[(_HTUIEvaluationViewControllerViewAccessibility *)self safeSwiftValueForKey:@"tapHearButton"];
}

- (BOOL)_axIsStateInBetween
{
  v2 = [(_HTUIEvaluationViewControllerViewAccessibility *)self safeSwiftValueForKey:@"state"];
  objc_super v3 = [v2 safeSwiftEnumCase];
  char v4 = [v3 isEqualToString:@"inBetween"];

  return v4;
}

- (BOOL)_axIsStateInProgress
{
  v2 = [(_HTUIEvaluationViewControllerViewAccessibility *)self safeSwiftValueForKey:@"state"];
  objc_super v3 = [v2 safeSwiftEnumCase];
  char v4 = [v3 isEqualToString:@"inProgress"];

  return v4;
}

- (id)accessibilityElements
{
  v9[1] = *MEMORY[0x263EF8340];
  if (![(_HTUIEvaluationViewControllerViewAccessibility *)self _axIsStateInProgress]) {
    goto LABEL_6;
  }
  objc_super v3 = [(_HTUIEvaluationViewControllerViewAccessibility *)self _axTapHearButton];
  char v4 = v3;
  if (!v3 || ([v3 alpha], v5 == 0.0) || objc_msgSend(v4, "isHidden"))
  {

LABEL_6:
    v8.receiver = self;
    v8.super_class = (Class)_HTUIEvaluationViewControllerViewAccessibility;
    double v6 = [(_HTUIEvaluationViewControllerViewAccessibility *)&v8 accessibilityElements];
    goto LABEL_7;
  }
  v9[0] = v4;
  double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

LABEL_7:

  return v6;
}

- (void)setupSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_HTUIEvaluationViewControllerViewAccessibility;
  [(_HTUIEvaluationViewControllerViewAccessibility *)&v3 setupSubviews];
  [(_HTUIEvaluationViewControllerViewAccessibility *)self _axSetupSubviews];
}

- (void)transitionToNextState
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2421AF000, a2, OS_LOG_TYPE_DEBUG, "transitionToNextState: %@", (uint8_t *)&v2, 0xCu);
}

- (void)updateProgressTo:(double)a3 immediately:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_HTUIEvaluationViewControllerViewAccessibility;
  -[_HTUIEvaluationViewControllerViewAccessibility updateProgressTo:immediately:](&v7, sel_updateProgressTo_immediately_, a4);
  double v6 = AXLogHearingTest();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_HTUIEvaluationViewControllerViewAccessibility updateProgressTo:immediately:](v6, a3);
  }

  [(_HTUIEvaluationViewControllerViewAccessibility *)self _axSetProgress:a3];
}

- (void)_axBeforePlayingTones
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Test: BeforePlayingTones, VO silent", v2, v3, v4, v5, v6);
}

- (void)_axStopPlayingTones
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Test: StopPlayingTones, VO will speak", v2, v3, v4, v5, v6);
}

- (void)_axSetupSubviews
{
  uint64_t v3 = [(_HTUIEvaluationViewControllerViewAccessibility *)self safeSwiftValueForKey:@"guidanceTitle"];
  [v3 setIsAccessibilityElement:0];
  uint64_t v4 = [(_HTUIEvaluationViewControllerViewAccessibility *)self _axTapHearButton];
  [v4 setAccessibilityLabel:&stru_26F6C1428];
  [v4 setAccessibilityTraits:*MEMORY[0x263F21A80]];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66___HTUIEvaluationViewControllerViewAccessibility__axSetupSubviews__block_invoke;
  v7[3] = &unk_265126D18;
  v7[4] = self;
  [v4 setAccessibilityActivateBlock:v7];
  uint64_t v5 = [(_HTUIEvaluationViewControllerViewAccessibility *)self safeSwiftValueForKey:@"completionLabel"];
  uint8_t v6 = accessibilityLocalizedString(@"HEARING_TEST_SESSION_DONE_TITLE");
  [v5 setAccessibilityLabel:v6];
}

- (void)updateProgressTo:(os_log_t)log immediately:(double)a2 .cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_2421AF000, log, OS_LOG_TYPE_DEBUG, "updateProgressToValue %f", (uint8_t *)&v2, 0xCu);
}

@end