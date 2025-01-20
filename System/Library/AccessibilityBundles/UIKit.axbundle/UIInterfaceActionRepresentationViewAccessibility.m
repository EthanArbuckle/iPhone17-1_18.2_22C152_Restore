@interface UIInterfaceActionRepresentationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_showsFocusForFocusedView:(id)a3;
@end

@implementation UIInterfaceActionRepresentationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIInterfaceActionRepresentationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIInterfaceActionRepresentationView", @"_showsFocusForFocusedView:", "B", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)_showsFocusForFocusedView:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v6 = 0;
  v5.receiver = v8;
  v5.super_class = (Class)UIInterfaceActionRepresentationViewAccessibility;
  char v6 = [(UIInterfaceActionRepresentationViewAccessibility *)&v5 _showsFocusForFocusedView:location[0]];
  if ([(UIInterfaceActionRepresentationViewAccessibility *)v8 _accessibilityIsFKARunningForFocusItem])char v6 = 0; {
  char v4 = v6;
  }
  objc_storeStrong(location, 0);
  return v4 & 1;
}

@end