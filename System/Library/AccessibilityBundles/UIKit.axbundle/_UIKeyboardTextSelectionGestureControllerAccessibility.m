@interface _UIKeyboardTextSelectionGestureControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setPanGestureState:(int64_t)a3;
@end

@implementation _UIKeyboardTextSelectionGestureControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIKeyboardTextSelectionGestureController";
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
  v4 = "q";
  v3 = @"_UIKeyboardTextSelectionGestureController";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"panGestureState", v4, 0);
  objc_storeStrong(v6, obj);
}

- (void)setPanGestureState:(int64_t)a3
{
  v13 = self;
  SEL v12 = a2;
  int64_t v11 = a3;
  id v7 = (id)[(_UIKeyboardTextSelectionGestureControllerAccessibility *)self safeValueForKey:@"panGestureState"];
  uint64_t v8 = [v7 integerValue];

  uint64_t v10 = v8;
  v9.receiver = v13;
  v9.super_class = (Class)_UIKeyboardTextSelectionGestureControllerAccessibility;
  [(_UIKeyboardTextSelectionGestureControllerAccessibility *)&v9 setPanGestureState:v11];
  if (v11 != v10)
  {
    if (v10 || v11 != 1)
    {
      if (v10 == 1 || !v11)
      {
        UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
        id v4 = (id)accessibilityUIKitLocalizedString();
        UIAccessibilityPostNotification(v3, v4);
      }
    }
    else
    {
      UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
      id v6 = (id)accessibilityUIKitLocalizedString();
      UIAccessibilityPostNotification(notification, v6);
    }
  }
}

@end