@interface AVVolumeButtonControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AVVolumeButtonControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVVolumeButtonControl";
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
  return accessibilityLocalizedString(@"volume.button");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AVVolumeButtonControlAccessibility;
  return *MEMORY[0x263F1CEE8] | [(AVVolumeButtonControlAccessibility *)&v3 accessibilityTraits];
}

@end