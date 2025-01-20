@interface SUUIProductPageTableUpdateHistorySectionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_reloadHeaderView;
@end

@implementation SUUIProductPageTableUpdateHistorySectionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIProductPageTableUpdateHistorySection";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_reloadHeaderView
{
  v2.receiver = self;
  v2.super_class = (Class)SUUIProductPageTableUpdateHistorySectionAccessibility;
  [(SUUIProductPageTableUpdateHistorySectionAccessibility *)&v2 _reloadHeaderView];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __74__SUUIProductPageTableUpdateHistorySectionAccessibility__reloadHeaderView__block_invoke()
{
}

@end