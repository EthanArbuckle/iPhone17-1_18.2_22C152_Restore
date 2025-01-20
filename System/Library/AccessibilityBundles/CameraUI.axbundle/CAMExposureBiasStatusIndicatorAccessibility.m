@interface CAMExposureBiasStatusIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMExposureBiasStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMExposureBiasStatusIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMExposureBiasStatusIndicator", @"isExposureValueVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMExposureBiasStatusIndicator", @"_exposureLabel", "@", 0);
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"exposure.button");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMExposureBiasStatusIndicatorAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMExposureBiasStatusIndicatorAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityValue
{
  if ([(CAMExposureBiasStatusIndicatorAccessibility *)self safeBoolForKey:@"isExposureValueVisible"])
  {
    objc_super v3 = [(CAMExposureBiasStatusIndicatorAccessibility *)self safeValueForKey:@"_exposureLabel"];
    v4 = [v3 accessibilityLabel];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CAMExposureBiasStatusIndicatorAccessibility;
    v4 = [(CAMExposureBiasStatusIndicatorAccessibility *)&v6 accessibilityValue];
  }

  return v4;
}

@end