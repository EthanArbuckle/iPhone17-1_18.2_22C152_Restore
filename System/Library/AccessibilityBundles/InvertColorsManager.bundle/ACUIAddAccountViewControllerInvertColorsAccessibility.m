@interface ACUIAddAccountViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_specifierForAOLAccount;
- (id)_specifierForiCloudAccount;
- (void)_accessibilityLoadInvertColors;
@end

@implementation ACUIAddAccountViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACUIAddAccountViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_specifierForAOLAccount
{
  v6.receiver = self;
  v6.super_class = (Class)ACUIAddAccountViewControllerInvertColorsAccessibility;
  v2 = [(ACUIAddAccountViewControllerInvertColorsAccessibility *)&v6 _specifierForAOLAccount];
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    v3 = [v2 propertyForKey:@"iconImage"];
    v4 = +[AXInvertColorsAppHelper invertImage:v3];

    [v2 setProperty:v4 forKey:@"iconImage"];
  }

  return v2;
}

- (id)_specifierForiCloudAccount
{
  v6.receiver = self;
  v6.super_class = (Class)ACUIAddAccountViewControllerInvertColorsAccessibility;
  v2 = [(ACUIAddAccountViewControllerInvertColorsAccessibility *)&v6 _specifierForiCloudAccount];
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    v3 = [v2 propertyForKey:@"iconImage"];
    v4 = +[AXInvertColorsAppHelper invertImage:v3];

    [v2 setProperty:v4 forKey:@"iconImage"];
  }

  return v2;
}

- (void)_accessibilityLoadInvertColors
{
}

@end