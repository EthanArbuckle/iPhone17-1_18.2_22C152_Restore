@interface CAMVideoStabilizationStatusIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMVideoStabilizationStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMVideoStabilizationStatusIndicator";
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
  return accessibilityCameraUI2LocalizedString(@"Action_Mode");
}

- (id)accessibilityValue
{
  v2 = [(CAMVideoStabilizationStatusIndicatorAccessibility *)self safeValueForKey:@"videoStabilizationMode"];
  uint64_t v3 = [v2 integerValue];

  if (!v3)
  {
    v4 = @"Action_Mode_Off";
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    v4 = @"Action_Mode_On";
LABEL_5:
    v5 = accessibilityCameraUI2LocalizedString(v4);
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMVideoStabilizationStatusIndicatorAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMVideoStabilizationStatusIndicatorAccessibility *)&v3 accessibilityTraits];
}

@end