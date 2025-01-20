@interface CAMHDRStatusIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMHDRStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMHDRStatusIndicator";
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
  return accessibilityCameraUILocalizedString(@"HDR_MODE_BUTTON_LABEL");
}

- (id)accessibilityValue
{
  v2 = [(CAMHDRStatusIndicatorAccessibility *)self safeValueForKey:@"hdrMode"];
  unint64_t v3 = [v2 integerValue];

  if (v3 > 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = accessibilityCameraUILocalizedString(off_2650A0238[v3]);
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMHDRStatusIndicatorAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMHDRStatusIndicatorAccessibility *)&v3 accessibilityTraits];
}

@end