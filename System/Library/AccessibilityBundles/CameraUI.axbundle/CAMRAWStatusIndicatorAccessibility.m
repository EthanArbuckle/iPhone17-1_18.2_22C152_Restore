@interface CAMRAWStatusIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMRAWStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMRAWStatusIndicator";
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
  return accessibilityCameraUIAzulCLocalizedString(@"RAW_MODE_BUTTON_LABEL");
}

- (id)accessibilityValue
{
  v2 = [(CAMRAWStatusIndicatorAccessibility *)self safeValueForKey:@"rawMode"];
  uint64_t v3 = [v2 integerValue];

  if (!v3)
  {
    v4 = @"RAW_MODE_BUTTON_VALUE_OFF";
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    v4 = @"RAW_MODE_BUTTON_VALUE_ON";
LABEL_5:
    v5 = accessibilityCameraUIAzulCLocalizedString(v4);
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMRAWStatusIndicatorAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMRAWStatusIndicatorAccessibility *)&v3 accessibilityTraits];
}

@end