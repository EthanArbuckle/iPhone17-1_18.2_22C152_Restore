@interface RKEntityInteractionAccessibilityWrapperAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)didFire;
@end

@implementation RKEntityInteractionAccessibilityWrapperAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RealityFoundation.RKEntityInteractionAccessibilityWrapper";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityFoundation.RKEntityInteractionAccessibilityWrapper", @"didFire", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityFoundation.RKEntityInteractionAccessibilityWrapper", @"accessibilityDescription", "@", 0);
}

- (void)didFire
{
  v4.receiver = self;
  v4.super_class = (Class)RKEntityInteractionAccessibilityWrapperAccessibility;
  [(RKEntityInteractionAccessibilityWrapperAccessibility *)&v4 didFire];
  id v3 = [(RKEntityInteractionAccessibilityWrapperAccessibility *)self safeStringForKey:@"accessibilityDescription"];
  [v3 _accessibilityEnumerateDelayedDescriptionsWithBlock:&__block_literal_global_0];
}

void __63__RKEntityInteractionAccessibilityWrapperAccessibility_didFire__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __63__RKEntityInteractionAccessibilityWrapperAccessibility_didFire__block_invoke_2()
{
  UIAccessibilitySpeakOrQueueIfNeeded();

  return AXPerformBlockOnMainThreadAfterDelay();
}

void __63__RKEntityInteractionAccessibilityWrapperAccessibility_didFire__block_invoke_3()
{
}

@end