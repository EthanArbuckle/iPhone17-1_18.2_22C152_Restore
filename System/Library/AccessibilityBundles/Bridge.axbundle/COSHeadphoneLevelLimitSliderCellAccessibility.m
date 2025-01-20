@interface COSHeadphoneLevelLimitSliderCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation COSHeadphoneLevelLimitSliderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"COSHeadphoneLevelLimitSliderCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"COSHeadphoneLevelLimitSliderCell" isKindOfClass:@"PSControlTableCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSControlTableCell", @"controlValue", "@", 0);
}

- (id)accessibilityValue
{
  objc_opt_class();
  id v3 = [(COSHeadphoneLevelLimitSliderCellAccessibility *)self safeValueForKey:@"controlValue"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = NSString;
  v6 = accessibilityLocalizedString(@"decibel.value");
  v7 = objc_msgSend(v5, "stringWithFormat:", v6, v4);

  return v7;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"decibel.label");
}

@end