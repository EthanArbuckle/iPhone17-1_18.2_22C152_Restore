@interface CAMIntensityButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMIntensityButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMIntensityButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"cam.intensity.button");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMIntensityButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMIntensityButtonAccessibility *)&v3 accessibilityTraits];
}

@end