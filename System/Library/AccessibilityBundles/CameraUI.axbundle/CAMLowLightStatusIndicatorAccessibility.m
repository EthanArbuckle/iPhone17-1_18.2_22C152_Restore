@interface CAMLowLightStatusIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMLowLightStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMLowLightStatusIndicator";
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
  return accessibilityCameraUILocalizedString(@"lowlight.button");
}

- (id)accessibilityValue
{
  uint64_t v2 = [(CAMLowLightStatusIndicatorAccessibility *)self safeDoubleForKey:@"duration"];
  v3.n128_f64[0] = fmax(round(v3.n128_f64[0]), 1.0);

  return (id)MEMORY[0x270F0A0A8](v2, v3);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMLowLightStatusIndicatorAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMLowLightStatusIndicatorAccessibility *)&v3 accessibilityTraits];
}

@end