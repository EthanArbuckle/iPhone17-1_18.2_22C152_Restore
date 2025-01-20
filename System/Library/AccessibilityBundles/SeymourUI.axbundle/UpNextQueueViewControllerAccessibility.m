@interface UpNextQueueViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLayoutSubviews;
@end

@implementation UpNextQueueViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.UpNextQueueViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SeymourUI.UpNextQueueViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"view", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)UpNextQueueViewControllerAccessibility;
  [(UpNextQueueViewControllerAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(UpNextQueueViewControllerAccessibility *)self safeValueForKey:@"view"];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 subviews];
    v6 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &__block_literal_global_2);
    [v6 enumerateObjectsUsingBlock:&__block_literal_global_285];
    objc_opt_class();
    v7 = [v6 lastObject];
    v8 = __UIAccessibilityCastAsClass();

    [v8 setIsAccessibilityElement:1];
  }
}

uint64_t __84__UpNextQueueViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245660210](@"_UIGrabber");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __84__UpNextQueueViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  [v3 setIsAccessibilityElement:0];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UpNextQueueViewControllerAccessibility;
  [(UpNextQueueViewControllerAccessibility *)&v3 viewDidLayoutSubviews];
  [(UpNextQueueViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end