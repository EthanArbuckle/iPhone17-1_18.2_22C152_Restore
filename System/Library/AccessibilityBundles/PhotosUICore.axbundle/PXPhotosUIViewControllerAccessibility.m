@interface PXPhotosUIViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
@end

@implementation PXPhotosUIViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPhotosUIViewController";
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
  return 1;
}

void __67__PXPhotosUIViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) safeValueForKey:@"presentingViewController"];
  v3 = __UIAccessibilitySafeClass();

  [v3 dismissViewControllerAnimated:1 completion:0];
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

@end