@interface MRUControlCenterViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)didSelectListState:(id)a3;
@end

@implementation MRUControlCenterViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUControlCenterViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)didSelectListState:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MRUControlCenterViewControllerAccessibility;
  [(MRUControlCenterViewControllerAccessibility *)&v3 didSelectListState:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __66__MRUControlCenterViewControllerAccessibility_didSelectListState___block_invoke()
{
}

@end