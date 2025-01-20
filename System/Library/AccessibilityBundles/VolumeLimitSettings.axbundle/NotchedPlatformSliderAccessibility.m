@interface NotchedPlatformSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityUserDefinedValue;
- (id)accessibilityValue;
@end

@implementation NotchedPlatformSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VolumeLimitSettings.NotchedPlatformSlider";
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
  return accessibilityLocalizedString(@"volume.limit.slider");
}

- (id)accessibilityValue
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  [v2 value];
  v3 = AXFormatFloatWithPercentage();

  return v3;
}

- (id)accessibilityUserDefinedValue
{
  return 0;
}

@end