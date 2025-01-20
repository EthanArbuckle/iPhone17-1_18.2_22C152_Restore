@interface CKAppManagerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
@end

@implementation CKAppManagerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAppManagerViewController";
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

uint64_t __69__CKAppManagerViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) doneButtonTapped:0];
}

@end