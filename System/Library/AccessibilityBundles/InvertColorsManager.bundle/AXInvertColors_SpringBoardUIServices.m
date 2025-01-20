@interface AXInvertColors_SpringBoardUIServices
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_SpringBoardUIServices

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUILegibilityLabel", @"legibilitySettings", "@", 0);
  [v3 validateClass:@"SBUIProudLockIconView"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBUIPasscodeLockViewFactory", @"_passcodeLockViewForStyle:withLightStyle:", "@", "i", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIProudLockIconView", @"_activeViewsForState:", "@", "q", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"SBPasscodeNumberPadButtonInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBUILegibilityLabelInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBUIPasscodeLockViewFactoryInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBUIProudLockIconViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end