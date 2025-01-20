@interface _UIFocusSystemSceneComponentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsFKARunningForFocusItem;
- (id)focusItemsInRect:(CGRect)a3;
@end

@implementation _UIFocusSystemSceneComponentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIFocusSystemSceneComponent";
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
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"focusItemsInRect:", v4, "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_storeStrong(v6, obj);
}

- (BOOL)_accessibilityIsFKARunningForFocusItem
{
  id v3 = (id)[(_UIFocusSystemSceneComponentAccessibility *)self safeValueForKey:@"_windowScene"];
  char v4 = [v3 _accessibilityIsFKARunningForFocusItem];

  return v4 & 1;
}

- (id)focusItemsInRect:(CGRect)a3
{
  CGRect v26 = a3;
  v25 = self;
  SEL v24 = a2;
  if ([(_UIFocusSystemSceneComponentAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    char v21 = 0;
    objc_opt_class();
    id v11 = (id)[(_UIFocusSystemSceneComponentAccessibility *)v25 safeValueForKey:@"_windowScene"];
    id v20 = (id)__UIAccessibilityCastAsClass();

    id v19 = v20;
    objc_storeStrong(&v20, 0);
    id v22 = v19;
    id v8 = (id)[v19 _accessibilityTraversalWindows];
    id v7 = (id)[v8 reverseObjectEnumerator];
    id v18 = (id)[v7 allObjects];

    id v9 = (id)[v22 _sceneForKeyboardDisplay];
    id v17 = (id)[v9 _focusSystemSceneComponent];

    char v15 = 0;
    objc_opt_class();
    id v10 = (id)[v17 safeValueForKey:@"_windowScene"];
    id v14 = (id)__UIAccessibilityCastAsClass();

    id v13 = v14;
    objc_storeStrong(&v14, 0);
    id v16 = v13;
    id v6 = (id)[v13 _accessibilityTraversalWindows];
    id v5 = (id)[v6 reverseObjectEnumerator];
    id v12 = (id)[v5 allObjects];

    id v27 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "axArrayWithPossiblyNilArrays:", 2, v18, v12);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v22, 0);
  }
  else
  {
    v23.receiver = v25;
    v23.super_class = (Class)_UIFocusSystemSceneComponentAccessibility;
    id v27 = -[_UIFocusSystemSceneComponentAccessibility focusItemsInRect:](&v23, sel_focusItemsInRect_, v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  }
  id v3 = v27;

  return v3;
}

@end