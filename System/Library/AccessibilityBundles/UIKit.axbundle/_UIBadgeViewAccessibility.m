@interface _UIBadgeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation _UIBadgeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIBadgeView";
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
  [location[0] validateClass:@"_UIBadgeView" hasInstanceVariable:@"_label" withType:"UILabel"];
  objc_storeStrong(location, 0);
}

- (id)accessibilityLabel
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = (id)[(_UIBadgeViewAccessibility *)self safeValueForKey:@"_label"];
  id v3 = (id)[v4[0] accessibilityLabel];
  objc_storeStrong(v4, 0);

  return v3;
}

@end