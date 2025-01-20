@interface InfiniteScrollViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateViews;
- (void)loadView;
@end

@implementation InfiniteScrollViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"InfiniteScrollViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"InfiniteScrollViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"InfiniteScrollViewController", @"scrollView", "@", 0);
}

- (void)_axAnnotateViews
{
  id v2 = [(InfiniteScrollViewControllerAccessibility *)self safeValueForKey:@"scrollView"];
  [v2 setIsAccessibilityOpaqueElementProvider:1];
  [v2 setAccessibilityContainerType:4];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)InfiniteScrollViewControllerAccessibility;
  [(InfiniteScrollViewControllerAccessibility *)&v3 loadView];
  [(InfiniteScrollViewControllerAccessibility *)self _axAnnotateViews];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)InfiniteScrollViewControllerAccessibility;
  [(InfiniteScrollViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(InfiniteScrollViewControllerAccessibility *)self _axAnnotateViews];
}

@end