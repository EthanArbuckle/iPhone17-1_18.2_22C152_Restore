@interface CAMProResStatusIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMProResStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMProResStatusIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMProResStatusIndicator", @"proResVideoMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMProResStatusIndicator", @"colorSpace", "q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  unint64_t v3 = [(CAMProResStatusIndicatorAccessibility *)self safeIntegerForKey:@"colorSpace"];
  if (v3 < 2)
  {
    v4 = @"pro.res.button.sdr";
    goto LABEL_7;
  }
  if (v3 == 2)
  {
    v4 = @"pro.res.button.hdr";
    goto LABEL_7;
  }
  if (v3 == 3)
  {
    v4 = @"pro.res.button.log";
LABEL_7:
    v5 = accessibilityCameraUILocalizedString(v4);
    goto LABEL_9;
  }
  v7.receiver = self;
  v7.super_class = (Class)CAMProResStatusIndicatorAccessibility;
  v5 = [(CAMProResStatusIndicatorAccessibility *)&v7 accessibilityLabel];
LABEL_9:

  return v5;
}

- (id)accessibilityValue
{
  if ([(CAMProResStatusIndicatorAccessibility *)self safeIntegerForKey:@"proResVideoMode"]) {
    v2 = @"on.state";
  }
  else {
    v2 = @"off.state";
  }
  unint64_t v3 = accessibilityCameraUILocalizedString(v2);

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMProResStatusIndicatorAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMProResStatusIndicatorAccessibility *)&v3 accessibilityTraits];
}

@end