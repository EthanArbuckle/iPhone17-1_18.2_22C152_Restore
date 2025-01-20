@interface UIStackViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
@end

@implementation UIStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStackView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"UIStackView" isKindOfClass:@"UIView"];
  objc_storeStrong(location, 0);
}

- (BOOL)shouldGroupAccessibilityChildren
{
  BOOL v6 = 1;
  id v2 = (id)[(UIStackViewAccessibility *)self accessibilityUserDefinedShouldGroupChildren];
  BOOL v5 = v2 == 0;

  if (!v5)
  {
    id v4 = (id)[(UIStackViewAccessibility *)self accessibilityUserDefinedShouldGroupChildren];
    BOOL v6 = [v4 BOOLValue] & 1;
  }
  return v6;
}

@end