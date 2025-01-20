@interface CAMPanoramaArrowViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMPanoramaArrowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMPanoramaArrowView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = [(CAMPanoramaArrowViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2455E18B0](@"CAMPanoramaView", a2)];
  v3 = [v2 safeValueForKey:@"_direction"];
  uint64_t v4 = [v3 integerValue];

  if (v4 == 1)
  {
    v5 = @"left.to.right";
    goto LABEL_5;
  }
  if (v4 == 2)
  {
    v5 = @"right.to.left";
LABEL_5:
    v6 = accessibilityCameraKitLocalizedString(v5);
    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end