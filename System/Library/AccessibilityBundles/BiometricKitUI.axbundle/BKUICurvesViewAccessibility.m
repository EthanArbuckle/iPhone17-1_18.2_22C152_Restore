@interface BKUICurvesViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation BKUICurvesViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKUICurvesView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  if ([(BKUICurvesViewAccessibility *)self isHidden]) {
    return 0;
  }
  v4 = [(BKUICurvesViewAccessibility *)self isAccessibilityUserDefinedElement];

  if (!v4) {
    return 1;
  }
  v5 = [(BKUICurvesViewAccessibility *)self isAccessibilityUserDefinedElement];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"fingerprint.image");
}

- (id)accessibilityValue
{
  v3 = NSString;
  v4 = accessibilityLocalizedString(@"fingerprint.status");
  v5 = [(BKUICurvesViewAccessibility *)self safeValueForKey:@"_progress"];
  [v5 floatValue];
  char v6 = AXFormatFloatWithPercentage();
  v7 = objc_msgSend(v3, "stringWithFormat:", v4, v6);

  return v7;
}

@end