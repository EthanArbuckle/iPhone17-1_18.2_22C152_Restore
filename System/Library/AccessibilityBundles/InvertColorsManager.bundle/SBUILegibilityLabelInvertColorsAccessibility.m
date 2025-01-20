@interface SBUILegibilityLabelInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation SBUILegibilityLabelInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUILegibilityLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  if (!_AXSInvertColorsEnabledGlobalCached()) {
    return 0;
  }
  v3 = [(SBUILegibilityLabelInvertColorsAccessibility *)self safeValueForKey:@"legibilitySettings"];
  v4 = __UIAccessibilitySafeClass();

  v5 = [v4 primaryColor];

  v6 = +[UIColor whiteColor];
  unsigned __int8 v7 = [v5 isEqual:v6];

  return v7;
}

@end