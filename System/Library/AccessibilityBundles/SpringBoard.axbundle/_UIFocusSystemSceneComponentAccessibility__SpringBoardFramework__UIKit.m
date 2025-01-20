@interface _UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsFKARunningForFocusItem;
- (BOOL)_axIsSpringBoardMainSceneComponent;
- (BOOL)_axIsSystemApertureSceneComponent;
- (id)_axSpringBoardMainWindowScene;
- (id)focusItemsInRect:(CGRect)a3;
- (id)focusSystem;
@end

@implementation _UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit

- (id)focusSystem
{
  if ([(_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit *)self _accessibilityIsFKARunningForFocusItem]&& [(_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit *)self _axIsSystemApertureSceneComponent])
  {
    v3 = [(_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit *)self _axSpringBoardMainWindowScene];
    v4 = [v3 focusSystem];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit;
    v4 = [(_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit *)&v6 focusSystem];
  }

  return v4;
}

- (BOOL)_accessibilityIsFKARunningForFocusItem
{
  v2 = [(_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit *)self safeValueForKey:@"_windowScene"];
  char v3 = [v2 _accessibilityIsFKARunningForFocusItem];

  return v3;
}

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
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIFocusSystemSceneComponent", @"focusItemsInRect:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIFocusSystemSceneComponent", @"_windowScene", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIFocusSystemSceneComponent", @"focusSystem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScreen", @"_preferredFocusedWindowScene", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIApplicationAccessibility", @"_accessibilityActiveScenes", "@", 0);
}

- (id)focusItemsInRect:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit;
  v4 = -[_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit focusItemsInRect:](&v12, sel_focusItemsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if ([(_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit *)self _accessibilityIsFKARunningForFocusItem]&& [(_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit *)self _axIsSpringBoardMainSceneComponent])
  {
    v5 = [(id)*MEMORY[0x263F1D020] safeArrayForKey:@"_accessibilityActiveScenes"];
    objc_super v6 = [v5 axFirstObjectsUsingBlock:&__block_literal_global_7];

    v7 = [v6 _accessibilityTraversalWindows];
    v8 = [v7 reverseObjectEnumerator];
    v9 = [v8 allObjects];

    objc_msgSend(MEMORY[0x263EFF8C0], "axArrayWithPossiblyNilArrays:", 2, v4, v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v4;
  }

  return v10;
}

- (id)_axSpringBoardMainWindowScene
{
  v2 = [(id)*MEMORY[0x263F1D020] safeArrayForKey:@"_accessibilityActiveScenes"];
  id v3 = [v2 axFirstObjectsUsingBlock:&__block_literal_global_307];

  return v3;
}

- (BOOL)_axIsSpringBoardMainSceneComponent
{
  objc_opt_class();
  id v3 = [(_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit *)self safeValueForKey:@"_windowScene"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 _sceneIdentifier];
  LOBYTE(v3) = [v5 isEqualToString:@"com.apple.springboard"];

  return (char)v3;
}

- (BOOL)_axIsSystemApertureSceneComponent
{
  objc_opt_class();
  id v3 = [(_UIFocusSystemSceneComponentAccessibility__SpringBoardFramework__UIKit *)self safeValueForKey:@"_windowScene"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 _sceneIdentifier];
  LOBYTE(v3) = [v5 isEqualToString:@"SystemAperture"];

  return (char)v3;
}

@end