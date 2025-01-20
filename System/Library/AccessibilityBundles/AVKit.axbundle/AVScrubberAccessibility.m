@interface AVScrubberAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (CGRect)accessibilityFrame;
@end

@implementation AVScrubberAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVScrubber";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVScrubber", @"continueTrackingWithTouch:withEvent:", "B", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UISlider", @"_accessibilityAnnounceNewValue", "v", 0);
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  v6.receiver = self;
  v6.super_class = (Class)AVScrubberAccessibility;
  [(AVScrubberAccessibility *)&v6 accessibilityFrame];
  if (v5 == 0.0) {
    double v5 = 5.0;
  }
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)AVScrubberAccessibility;
  BOOL v4 = [(AVScrubberAccessibility *)&v6 continueTrackingWithTouch:a3 withEvent:a4];
  AXPerformSafeBlock();
  return v4;
}

uint64_t __63__AVScrubberAccessibility_continueTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityAnnounceNewValue];
}

@end