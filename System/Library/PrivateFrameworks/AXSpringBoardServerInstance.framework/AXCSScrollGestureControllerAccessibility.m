@interface AXCSScrollGestureControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityForcedScrollingStrategy;
- (id)_accessibilitySavedScrollingStrategy;
- (void)_accessibilitySetForcedScrollingStrategy:(id)a3;
- (void)_accessibilitySetSavedScrollingStrategy:(id)a3;
- (void)accessibilitySetSystemDashBoardGesturesEnabled:(BOOL)a3;
- (void)setScrollingStrategy:(int64_t)a3;
@end

@implementation AXCSScrollGestureControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSScrollGestureController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSScrollGestureController", @"setScrollingStrategy:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSScrollGestureController", @"scrollingStrategy", "q", 0);
}

- (id)_accessibilitySavedScrollingStrategy
{
  return objc_getAssociatedObject(self, &__CSScrollGestureController___accessibilitySavedScrollingStrategy);
}

- (void)_accessibilitySetSavedScrollingStrategy:(id)a3
{
}

- (id)_accessibilityForcedScrollingStrategy
{
  return objc_getAssociatedObject(self, &__CSScrollGestureController___accessibilityForcedScrollingStrategy);
}

- (void)_accessibilitySetForcedScrollingStrategy:(id)a3
{
}

- (void)setScrollingStrategy:(int64_t)a3
{
  v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  [(AXCSScrollGestureControllerAccessibility *)self _accessibilitySetSavedScrollingStrategy:v5];

  v6 = [(AXCSScrollGestureControllerAccessibility *)self _accessibilityForcedScrollingStrategy];
  if (!v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)AXCSScrollGestureControllerAccessibility;
    [(AXCSScrollGestureControllerAccessibility *)&v7 setScrollingStrategy:a3];
  }
}

- (void)accessibilitySetSystemDashBoardGesturesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(AXCSScrollGestureControllerAccessibility *)self _accessibilitySavedScrollingStrategy];
  v6 = (void *)v5;
  if (v3)
  {
    [(AXCSScrollGestureControllerAccessibility *)self _accessibilitySetForcedScrollingStrategy:0];
    if (v6)
    {
      id v9 = v6;
      AXPerformSafeBlock();
    }
    [(AXCSScrollGestureControllerAccessibility *)self _accessibilitySetSavedScrollingStrategy:0];
  }
  else
  {
    if (!v5)
    {
      uint64_t v7 = [(AXCSScrollGestureControllerAccessibility *)self safeIntegerForKey:@"scrollingStrategy"];
      v8 = [NSNumber numberWithInteger:v7];
      [(AXCSScrollGestureControllerAccessibility *)self _accessibilitySetSavedScrollingStrategy:v8];
    }
    AXPerformSafeBlock();
    [(AXCSScrollGestureControllerAccessibility *)self _accessibilitySetForcedScrollingStrategy:&unk_26DB1FE90];
  }
}

id __91__AXCSScrollGestureControllerAccessibility_accessibilitySetSystemDashBoardGesturesEnabled___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) integerValue];
  v4.receiver = v1;
  v4.super_class = (Class)AXCSScrollGestureControllerAccessibility;
  return objc_msgSendSuper2(&v4, sel_setScrollingStrategy_, v2);
}

id __91__AXCSScrollGestureControllerAccessibility_accessibilitySetSystemDashBoardGesturesEnabled___block_invoke_2(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)AXCSScrollGestureControllerAccessibility;
  return objc_msgSendSuper2(&v2, sel_setScrollingStrategy_, 3);
}

@end