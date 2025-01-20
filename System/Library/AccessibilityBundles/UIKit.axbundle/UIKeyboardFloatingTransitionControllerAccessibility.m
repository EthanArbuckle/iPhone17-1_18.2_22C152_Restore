@interface UIKeyboardFloatingTransitionControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_axAnnounceFloating:(uint64_t)a1;
- (void)finalizeTransition;
- (void)setProgress:(double)a3;
@end

@implementation UIKeyboardFloatingTransitionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardFloatingTransitionController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "d";
  v4 = @"UIKeyboardFloatingTransitionController";
  v5 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "d", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"progress", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"startedFromFloating", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"finalizeTransition", v5, 0);
  objc_storeStrong(v7, v6);
}

- (void)_axAnnounceFloating:(uint64_t)a1
{
  if (a1)
  {
    UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
    char v5 = 0;
    char v3 = 0;
    if (a2)
    {
      id v6 = accessibilityLocalizedString(@"keyboard.update.floating");
      char v5 = 1;
      UIAccessibilityPostNotification(notification, v6);
    }
    else
    {
      id v4 = accessibilityLocalizedString(@"keyboard.update.docked");
      char v3 = 1;
      UIAccessibilityPostNotification(notification, v4);
    }
    if (v3) {

    }
    if (v5) {
  }
    }
}

- (void)setProgress:(double)a3
{
  v14 = self;
  SEL v13 = a2;
  double v12 = a3;
  [(UIKeyboardFloatingTransitionControllerAccessibility *)self safeDoubleForKey:@"progress"];
  double v11 = v3;
  char v10 = [(UIKeyboardFloatingTransitionControllerAccessibility *)v14 safeBoolForKey:@"startedFromFloating"] & 1;
  char v9 = 0;
  if (v11 >= 0.5 || (char v7 = 1, (v10 & 1) == 0))
  {
    char v6 = 0;
    if (v11 >= 0.5) {
      char v6 = v10 ^ 1;
    }
    char v7 = v6;
  }
  char v9 = v7 & 1;
  v8.receiver = v14;
  v8.super_class = (Class)UIKeyboardFloatingTransitionControllerAccessibility;
  [(UIKeyboardFloatingTransitionControllerAccessibility *)&v8 setProgress:v12];
  if (v12 >= 0.5 || (char v5 = 1, (v10 & 1) == 0))
  {
    char v4 = 0;
    if (v12 >= 0.5) {
      char v4 = v10 ^ 1;
    }
    char v5 = v4;
  }
  if ((v9 & 1) != (v5 & 1)) {
    -[UIKeyboardFloatingTransitionControllerAccessibility _axAnnounceFloating:]((uint64_t)v14, v5 & 1);
  }
}

- (void)finalizeTransition
{
  char v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardFloatingTransitionControllerAccessibility;
  [(UIKeyboardFloatingTransitionControllerAccessibility *)&v4 finalizeTransition];
  -[UIKeyboardFloatingTransitionControllerAccessibility _axAnnounceFloating:]((uint64_t)v6, [MEMORY[0x263F1C738] isFloating] & 1);
  UIAccessibilityNotifications notification = *MEMORY[0x263F1CE18];
  id v3 = (id)[MEMORY[0x263F1C738] sharedInstance];
  UIAccessibilityPostNotification(notification, v3);
}

@end