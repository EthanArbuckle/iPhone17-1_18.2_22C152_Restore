@interface CAMFilterStatusIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMFilterStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMFilterStatusIndicator";
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
  return accessibilityCameraKitLocalizedString(@"filter.button");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMFilterStatusIndicatorAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMFilterStatusIndicatorAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityValue
{
  if ([(CAMFilterStatusIndicatorAccessibility *)self safeBoolForKey:@"isOn"]) {
    v2 = @"on.state";
  }
  else {
    v2 = @"off.state";
  }
  objc_super v3 = accessibilityCameraUILocalizedString(v2);

  return v3;
}

@end