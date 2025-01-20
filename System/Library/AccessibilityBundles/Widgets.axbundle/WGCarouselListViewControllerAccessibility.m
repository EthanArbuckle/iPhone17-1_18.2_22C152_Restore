@interface WGCarouselListViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (void)setFooterVisible:(BOOL)a3;
@end

@implementation WGCarouselListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WGCarouselListViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WGCarouselListViewController", @"setFooterVisible:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WGCarouselListViewController", @"isVisuallyRevealed", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WGCarouselListViewController", @"setVisuallyRevealed:", "v", "B", 0);
}

- (void)setFooterVisible:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WGCarouselListViewControllerAccessibility;
  [(WGCarouselListViewControllerAccessibility *)&v3 setFooterVisible:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A78]);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 == 4
    && ([(WGCarouselListViewControllerAccessibility *)self safeBoolForKey:@"isVisuallyRevealed"] & 1) == 0)
  {
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WGCarouselListViewControllerAccessibility;
    return [(WGCarouselListViewControllerAccessibility *)&v6 accessibilityScroll:a3];
  }
}

void __65__WGCarouselListViewControllerAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setVisuallyRevealed:1];
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE18];

  UIAccessibilityPostNotification(v1, 0);
}

@end