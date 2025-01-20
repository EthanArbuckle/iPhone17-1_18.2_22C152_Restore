@interface _UIFocusSystemKeyboardSceneComponentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)focusSystem;
@end

@implementation _UIFocusSystemKeyboardSceneComponentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIFocusSystemKeyboardSceneComponent";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIFocusSystemSceneComponent";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"_UIFocusSystemKeyboardSceneComponent");
  v4 = "@";
  [location[0] validateClass:@"_UIFocusSystemSceneComponent" hasInstanceMethod:@"focusSystem" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_windowScene", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIScreen", @"_preferredFocusedWindowScene", v4, 0);
  objc_storeStrong(v6, obj);
}

- (id)focusSystem
{
  v14 = self;
  v13[1] = (id)a2;
  if (([(_UIFocusSystemKeyboardSceneComponentAccessibility *)self _accessibilityIsFKARunningForFocusItem] & 1) == 0)goto LABEL_6; {
  char v12 = 0;
  }
  objc_opt_class();
  id v5 = (id)[(_UIFocusSystemKeyboardSceneComponentAccessibility *)v14 safeValueForKey:@"_windowScene"];
  id v11 = (id)__UIAccessibilityCastAsClass();

  id v10 = v11;
  objc_storeStrong(&v11, 0);
  v13[0] = v10;
  id v9 = (id)[v10 screen];
  id v8 = (id)[v9 safeValueForKey:@"_preferredFocusedWindowScene"];
  if (v8 == v13[0])
  {
    int v7 = 0;
  }
  else
  {
    id v15 = (id)[v8 focusSystem];
    int v7 = 1;
  }
  id obj = 0;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v13, 0);
  if (!v7)
  {
LABEL_6:
    v6.receiver = v14;
    v6.super_class = (Class)_UIFocusSystemKeyboardSceneComponentAccessibility;
    id v15 = [(_UIFocusSystemKeyboardSceneComponentAccessibility *)&v6 focusSystem];
  }
  v2 = v15;

  return v2;
}

@end