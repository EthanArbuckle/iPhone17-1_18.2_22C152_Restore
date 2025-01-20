@interface AVTAttributeValueViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)cleanupAfterTransition;
- (void)updateSelectedState:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation AVTAttributeValueViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTAttributeValueView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  objc_opt_class();
  v3 = [(AVTAttributeValueViewInvertColorsAccessibility *)self safeValueForKey:@"imageLayer"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = [(AVTAttributeValueViewInvertColorsAccessibility *)self safeValueForKey:@"transitionImageLayer"];
  v6 = __UIAccessibilityCastAsClass();

  +[AXInvertColorsAppHelper toggleInvertColors:v4];
  +[AXInvertColorsAppHelper toggleInvertColors:v6];
}

- (void)updateSelectedState:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AVTAttributeValueViewInvertColorsAccessibility;
  [(AVTAttributeValueViewInvertColorsAccessibility *)&v5 updateSelectedState:a3 animated:a4];
  [(AVTAttributeValueViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)cleanupAfterTransition
{
  v3.receiver = self;
  v3.super_class = (Class)AVTAttributeValueViewInvertColorsAccessibility;
  [(AVTAttributeValueViewInvertColorsAccessibility *)&v3 cleanupAfterTransition];
  [(AVTAttributeValueViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end