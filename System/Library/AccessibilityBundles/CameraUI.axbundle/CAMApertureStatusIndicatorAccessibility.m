@interface CAMApertureStatusIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMApertureStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMApertureStatusIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"depth.button");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMApertureStatusIndicatorAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMApertureStatusIndicatorAccessibility *)&v3 accessibilityTraits];
}

@end