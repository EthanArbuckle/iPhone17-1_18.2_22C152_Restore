@interface BKUIPearlInstructionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axNavigationControllerParent;
- (void)setDetail:(id)a3;
@end

@implementation BKUIPearlInstructionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKUIPearlInstructionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlInstructionView", @"setDetail:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlInstructionView", @"instruction", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlInstructionView", @"instructionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlInstructionView", @"detailLabel", "@", 0);
  [v3 validateClass:@"BKUIPearlInstructionView" hasInstanceVariable:@"_detail" withType:"NSString"];
}

- (id)_axNavigationControllerParent
{
  v2 = [(BKUIPearlInstructionViewAccessibility *)self _accessibilityFindViewAncestor:&__block_literal_global_0 startWithSelf:0];
  id v3 = [v2 _accessibilityViewController];
  v4 = [v3 navigationController];

  return v4;
}

BOOL __70__BKUIPearlInstructionViewAccessibility__axNavigationControllerParent__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  id v3 = [v2 navigationController];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setDetail:(id)a3
{
  id v4 = a3;
  v5 = [(BKUIPearlInstructionViewAccessibility *)self safeStringForKey:@"_detail"];
  if ([v5 isEqualToString:v4])
  {
    v14.receiver = self;
    v14.super_class = (Class)BKUIPearlInstructionViewAccessibility;
    [(BKUIPearlInstructionViewAccessibility *)&v14 setDetail:v4];
  }
  else
  {
    uint64_t v6 = [v4 length];
    v14.receiver = self;
    v14.super_class = (Class)BKUIPearlInstructionViewAccessibility;
    [(BKUIPearlInstructionViewAccessibility *)&v14 setDetail:v4];
    if (v6)
    {
      v7 = [(BKUIPearlInstructionViewAccessibility *)self _axNavigationControllerParent];
      if ([v7 _isTransitioning])
      {
      }
      else
      {
        v8 = [(BKUIPearlInstructionViewAccessibility *)self safeUIViewForKey:@"detailLabel"];
        v9 = [v8 window];

        if (v9) {
          UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v4);
        }
      }
    }
  }
  uint64_t v10 = [(BKUIPearlInstructionViewAccessibility *)self safeStringForKey:@"instruction"];
  v11 = (void *)v10;
  if (!v4 && v5 && v10)
  {
    UIAccessibilityNotifications v12 = *MEMORY[0x263F1CE18];
    v13 = [(BKUIPearlInstructionViewAccessibility *)self safeUIViewForKey:@"instructionLabel"];
    UIAccessibilityPostNotification(v12, v13);
  }
}

@end