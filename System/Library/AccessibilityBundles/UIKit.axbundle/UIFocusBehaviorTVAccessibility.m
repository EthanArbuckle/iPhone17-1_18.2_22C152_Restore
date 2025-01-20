@interface UIFocusBehaviorTVAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)showsFocusRingForItem:(id)a3;
@end

@implementation UIFocusBehaviorTVAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIFocusBehavior_TV";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIFocusBehavior_TV", @"showsFocusRingForItem:", "B", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)showsFocusRingForItem:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v9 = 0;
  objc_opt_class();
  id v8 = (id)__UIAccessibilityCastAsClass();
  id v7 = v8;
  objc_storeStrong(&v8, 0);
  char v4 = [v7 _accessibilityDisplayFocusIndicatorForFocusEverywhereView];

  if (v4)
  {
    char v12 = 1;
  }
  else
  {
    v5.receiver = v11;
    v5.super_class = (Class)UIFocusBehaviorTVAccessibility;
    char v12 = [(UIFocusBehaviorTVAccessibility *)&v5 showsFocusRingForItem:location[0]];
  }
  int v6 = 1;
  objc_storeStrong(location, 0);
  return v12 & 1;
}

@end