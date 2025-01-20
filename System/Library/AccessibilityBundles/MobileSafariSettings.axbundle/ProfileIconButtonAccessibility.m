@interface ProfileIconButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation ProfileIconButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProfileIconButton";
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
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(ProfileIconButtonAccessibility *)self safeStringForKey:@"_iconName"];
  if ([v2 isEqualToString:@"ellipsis"])
  {
    objc_opt_class();
    v3 = __UIAccessibilityCastAsClass();
    v4 = [v3 imageView];
    v5 = [v4 accessibilityLabel];

    v6 = profileSymbolAccessibilityLabel(v5);
    v9 = profileSymbolAccessibilityLabel(v2);
    v7 = __UIAXStringForVariables();
  }
  else
  {
    v7 = profileSymbolAccessibilityLabel(v2);
  }

  return v7;
}

@end