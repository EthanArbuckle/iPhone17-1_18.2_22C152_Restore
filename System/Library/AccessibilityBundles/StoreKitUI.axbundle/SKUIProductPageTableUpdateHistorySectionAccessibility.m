@interface SKUIProductPageTableUpdateHistorySectionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_reloadHeaderView;
@end

@implementation SKUIProductPageTableUpdateHistorySectionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIProductPageTableUpdateHistorySection";
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
  v2.super_class = (Class)SKUIProductPageTableUpdateHistorySectionAccessibility;
  [(SKUIProductPageTableUpdateHistorySectionAccessibility *)&v2 _reloadHeaderView];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __74__SKUIProductPageTableUpdateHistorySectionAccessibility__reloadHeaderView__block_invoke()
{
}

@end