@interface SKUIScrollingSegmentedControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)scrollingSegmentedControllerCollectionViewDidLayoutSubviews:(id)a3;
@end

@implementation SKUIScrollingSegmentedControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIScrollingSegmentedController";
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
  v5 = [(SKUIScrollingSegmentedControllerAccessibility *)self valueForKey:@"_focusedViewControllerIndex"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  v9.receiver = self;
  v9.super_class = (Class)SKUIScrollingSegmentedControllerAccessibility;
  [(SKUIScrollingSegmentedControllerAccessibility *)&v9 scrollingSegmentedControllerCollectionViewDidLayoutSubviews:v4];

  v7 = [(SKUIScrollingSegmentedControllerAccessibility *)self valueForKey:@"_focusedViewControllerIndex"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  if (v6 != v8) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

@end