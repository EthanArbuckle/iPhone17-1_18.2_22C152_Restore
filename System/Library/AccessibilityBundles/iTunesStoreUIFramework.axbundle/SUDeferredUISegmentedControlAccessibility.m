@interface SUDeferredUISegmentedControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_commitDeferredInterfaceUpdates;
@end

@implementation SUDeferredUISegmentedControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUDeferredUISegmentedControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_commitDeferredInterfaceUpdates
{
  v2.receiver = self;
  v2.super_class = (Class)SUDeferredUISegmentedControlAccessibility;
  [(SUDeferredUISegmentedControlAccessibility *)&v2 _commitDeferredInterfaceUpdates];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end