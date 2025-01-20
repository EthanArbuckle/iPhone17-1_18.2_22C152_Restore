@interface UIFocusSystemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_prefersDeferralForFocusUpdateInContext:(id)a3;
@end

@implementation UIFocusSystemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIFocusSystem";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIFocusSystem", @"_prefersDeferralForFocusUpdateInContext:", "B", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)_prefersDeferralForFocusUpdateInContext:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)[location[0] nextFocusedView];
  char v5 = [v4 _accessibilityIsFKARunningForFocusItem];

  if (v5)
  {
    char v10 = _AXSFullKeyboardAccessFocusRingEnabled() == 0;
  }
  else
  {
    v6.receiver = v9;
    v6.super_class = (Class)UIFocusSystemAccessibility;
    char v10 = [(UIFocusSystemAccessibility *)&v6 _prefersDeferralForFocusUpdateInContext:location[0]];
  }
  int v7 = 1;
  objc_storeStrong(location, 0);
  return v10 & 1;
}

@end