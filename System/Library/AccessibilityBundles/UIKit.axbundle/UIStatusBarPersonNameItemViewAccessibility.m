@interface UIStatusBarPersonNameItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation UIStatusBarPersonNameItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarPersonNameItemView";
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
  [location[0] validateClass:@"UIStatusBarPersonNameItemView" hasInstanceVariable:@"_personNameString" withType:"NSString"];
  objc_storeStrong(location, 0);
}

- (id)accessibilityLabel
{
  return (id)[(UIStatusBarPersonNameItemViewAccessibility *)self safeValueForKey:@"_personNameString", a2, self];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end