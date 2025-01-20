@interface CKImageBalloonViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
- (void)_accessibilityLoadInvertColors;
- (void)clearFilters;
- (void)layoutSubviews;
@end

@implementation CKImageBalloonViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKImageBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  objc_opt_class();
  v3 = [(CKImageBalloonViewInvertColorsAccessibility *)self safeValueForKey:@"tailMask"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 layer];
  +[AXInvertColorsAppHelper toggleInvertColors:v5];
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CKImageBalloonViewInvertColorsAccessibility;
  [(CKImageBalloonViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(CKImageBalloonViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)clearFilters
{
  v3.receiver = self;
  v3.super_class = (Class)CKImageBalloonViewInvertColorsAccessibility;
  [(CKImageBalloonViewInvertColorsAccessibility *)&v3 clearFilters];
  [(CKImageBalloonViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
  [(CKImageBalloonViewInvertColorsAccessibility *)self setAccessibilityIgnoresInvertColors:0];
  [(CKImageBalloonViewInvertColorsAccessibility *)self setAccessibilityIgnoresInvertColors:1];
}

@end