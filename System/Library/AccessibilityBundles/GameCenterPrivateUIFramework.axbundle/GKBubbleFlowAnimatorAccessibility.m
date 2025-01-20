@interface GKBubbleFlowAnimatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_finishTransitionWithInfo:(id)a3;
@end

@implementation GKBubbleFlowAnimatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKBubbleFlowAnimator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_finishTransitionWithInfo:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKBubbleFlowAnimatorAccessibility;
  id v3 = a3;
  [(GKBubbleFlowAnimatorAccessibility *)&v5 _finishTransitionWithInfo:v3];
  int v4 = objc_msgSend(v3, "safeBoolForKey:", @"animated", v5.receiver, v5.super_class);

  if (v4) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __63__GKBubbleFlowAnimatorAccessibility__finishTransitionWithInfo___block_invoke()
{
}

@end