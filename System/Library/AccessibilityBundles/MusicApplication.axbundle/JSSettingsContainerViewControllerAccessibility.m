@interface JSSettingsContainerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
@end

@implementation JSSettingsContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.JSSettingsContainerViewController";
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
  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  id v2 = v4;
  AXPerformSafeBlock();

  return 1;
}

void __76__JSSettingsContainerViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

@end