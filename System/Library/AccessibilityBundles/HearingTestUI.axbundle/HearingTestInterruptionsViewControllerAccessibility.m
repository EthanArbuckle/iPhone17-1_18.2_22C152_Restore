@interface HearingTestInterruptionsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (void)accessibilityPerformEscape;
@end

@implementation HearingTestInterruptionsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HearingTestUI.HearingTestInterruptionsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityPerformEscape
{
  v2 = AXLogHearingTest();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[HearingTestInterruptionsViewControllerAccessibility accessibilityPerformEscape](v2);
  }

  AXPerformSafeBlock();
  return 1;
}

uint64_t __81__HearingTestInterruptionsViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didTapEndTest];
}

- (void)accessibilityPerformEscape
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2421AF000, log, OS_LOG_TYPE_DEBUG, "Test Interruption: accessibilityPerformEscape", v1, 2u);
}

@end