@interface UISwitchInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation UISwitchInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISwitch";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  v2 = [(UISwitchInvertColorsAccessibility *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] != (char *)&dword_4 + 1;

  return v3;
}

@end