@interface CAMIntensityStatusIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMIntensityStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMIntensityStatusIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"intensity.button");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMIntensityStatusIndicatorAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMIntensityStatusIndicatorAccessibility *)&v3 accessibilityTraits];
}

@end