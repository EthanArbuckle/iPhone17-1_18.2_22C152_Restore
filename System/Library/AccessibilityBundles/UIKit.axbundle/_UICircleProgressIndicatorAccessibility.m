@interface _UICircleProgressIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation _UICircleProgressIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UICircleProgressIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UICircleProgressIndicator";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"isIndeterminate", "B", 0);
  objc_storeStrong(v5, obj);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"circle.inprogress.indicator");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF68];
}

- (id)accessibilityValue
{
  id v4 = (id)[(_UICircleProgressIndicatorAccessibility *)self safeValueForKey:@"indeterminate"];
  char v5 = [v4 BOOLValue];

  if (v5)
  {
    id v7 = accessibilityLocalizedString(@"circle.inprogress.indeterminate");
  }
  else
  {
    id v3 = (id)[(_UICircleProgressIndicatorAccessibility *)self safeValueForKey:@"progress"];
    [v3 floatValue];

    id v7 = (id)AXFormatFloatWithPercentage();
  }

  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end