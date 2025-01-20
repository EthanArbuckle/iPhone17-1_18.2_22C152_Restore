@interface SUUIScrollingSegmentedControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)scrollingSegmentedControllerCollectionViewDidLayoutSubviews:(id)a3;
@end

@implementation SUUIScrollingSegmentedControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIScrollingSegmentedController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)scrollingSegmentedControllerCollectionViewDidLayoutSubviews:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIScrollingSegmentedControllerAccessibility *)self valueForKey:@"_focusedViewControllerIndex"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  v9.receiver = self;
  v9.super_class = (Class)SUUIScrollingSegmentedControllerAccessibility;
  [(SUUIScrollingSegmentedControllerAccessibility *)&v9 scrollingSegmentedControllerCollectionViewDidLayoutSubviews:v4];

  v7 = [(SUUIScrollingSegmentedControllerAccessibility *)self valueForKey:@"_focusedViewControllerIndex"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  if (v6 != v8) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

@end