@interface CAMDirectionalIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (int64_t)_accessibilityExpandedStatus;
- (unint64_t)accessibilityTraits;
- (void)_updateArrowShapeAnimated:(BOOL)a3;
@end

@implementation CAMDirectionalIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMDirectionalIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDirectionalIndicator", @"direction", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDirectionalIndicator", @"_updateArrowShapeAnimated:", "v", "B", 0);
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"camera.controls.button");
}

- (int64_t)_accessibilityExpandedStatus
{
  int64_t result = [(CAMDirectionalIndicatorAccessibility *)self safeIntegerForKey:@"direction"];
  if (!result) {
    return 2;
  }
  if (result != 1)
  {
    v4.receiver = self;
    v4.super_class = (Class)CAMDirectionalIndicatorAccessibility;
    return [(CAMDirectionalIndicatorAccessibility *)&v4 _accessibilityExpandedStatus];
  }
  return result;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMDirectionalIndicatorAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMDirectionalIndicatorAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_updateArrowShapeAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CAMDirectionalIndicatorAccessibility;
  [(CAMDirectionalIndicatorAccessibility *)&v4 _updateArrowShapeAnimated:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], self);
}

@end