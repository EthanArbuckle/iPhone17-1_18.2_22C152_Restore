@interface WGWidgetListViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_invokeBlockWithPlatterViewsVisibleInBounds:(id)a3;
@end

@implementation WGWidgetListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WGWidgetListViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WGWidgetListViewController", @"_invokeBlockWithPlatterViewsVisibleInBounds:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WGWidgetListViewController", @"_invokeBlockWithPlatterViewsVisibleInRect: block:", "v", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WGWidgetListViewController", @"_scrollViewIfLoaded", "@", 0);
}

- (void)_invokeBlockWithPlatterViewsVisibleInBounds:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    char v21 = 0;
    objc_opt_class();
    v5 = [(WGWidgetListViewControllerAccessibility *)self safeValueForKey:@"_scrollViewIfLoaded"];
    v6 = __UIAccessibilityCastAsClass();

    if (v6)
    {
      [v6 bounds];
      CGFloat x = v26.origin.x;
      CGFloat y = v26.origin.y;
      CGFloat width = v26.size.width;
      CGFloat height = v26.size.height;
      if (!CGRectIsEmpty(v26))
      {
        v27.origin.CGFloat x = x;
        v27.origin.CGFloat y = y;
        v27.size.CGFloat width = width;
        v27.size.CGFloat height = height;
        CGFloat v11 = CGRectGetHeight(v27) * -0.5;
        v28.origin.CGFloat x = x;
        v28.origin.CGFloat y = y;
        v28.size.CGFloat width = width;
        v28.size.CGFloat height = height;
        CGRect v29 = CGRectInset(v28, 0.0, v11);
        uint64_t v13 = MEMORY[0x263EF8330];
        uint64_t v14 = 3221225472;
        v15 = __87__WGWidgetListViewControllerAccessibility__invokeBlockWithPlatterViewsVisibleInBounds___block_invoke;
        v16 = &unk_265169230;
        v17 = self;
        CGRect v20 = v29;
        id v18 = v4;
        v19 = &v22;
        AXPerformSafeBlock();
      }
    }
  }
  if (!*((unsigned char *)v23 + 24))
  {
    v12.receiver = self;
    v12.super_class = (Class)WGWidgetListViewControllerAccessibility;
    [(WGWidgetListViewControllerAccessibility *)&v12 _invokeBlockWithPlatterViewsVisibleInBounds:v4];
  }
  _Block_object_dispose(&v22, 8);
}

uint64_t __87__WGWidgetListViewControllerAccessibility__invokeBlockWithPlatterViewsVisibleInBounds___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_invokeBlockWithPlatterViewsVisibleInRect:block:", *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

@end