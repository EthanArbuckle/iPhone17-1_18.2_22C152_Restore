@interface UISplitKeyboardSupportAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axDescriptionForPoint:(double)a3 windowWidth:(double)a4 windowHeight:(double)a5;
- (id)_axLastLocationDescription;
- (void)_axSetLastLocationDescription:(uint64_t)a1;
- (void)translateDetected:(id)a3;
@end

@implementation UISplitKeyboardSupportAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISplitKeyboardSupport";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UISplitKeyboardSupport", @"translateDetected:", "v", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)_axLastLocationDescription
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &__UISplitKeyboardSupportAccessibility___axLastLocationDescription);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_axSetLastLocationDescription:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (void)translateDetected:(id)a3
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v20 = 0;
  objc_opt_class();
  id v19 = (id)__UIAccessibilityCastAsClass();
  id v18 = v19;
  objc_storeStrong(&v19, 0);
  id v21 = v18;
  v17.receiver = v23;
  v17.super_class = (Class)UISplitKeyboardSupportAccessibility;
  [(UISplitKeyboardSupportAccessibility *)&v17 translateDetected:location[0]];
  if ([MEMORY[0x263F1C738] isFloating])
  {
    if ([v21 state] == 1)
    {
      UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
      id v9 = accessibilityLocalizedString(@"keyboard.floating.begin.move");
      UIAccessibilityPostNotification(notification, v9);
    }
    else if ([v21 state] == 2)
    {
      id v16 = -[UISplitKeyboardSupportAccessibility _axLastLocationDescription](v23);
      id v15 = (id)[MEMORY[0x263F1C738] sharedInstance];
      id v14 = (id)[v15 window];
      [v14 bounds];
      CGRect v13 = v24;
      double Width = CGRectGetWidth(v24);
      double Height = CGRectGetHeight(v13);
      v7 = v23;
      [v15 bounds];
      AX_CGRectGetCenter();
      objc_msgSend(v15, "convertPoint:toView:", 0, v3, v4);
      id argument = [(UISplitKeyboardSupportAccessibility *)(uint64_t)v7 _axDescriptionForPoint:v6 windowWidth:Width windowHeight:Height];
      if (([v16 isEqualToString:argument] & 1) == 0)
      {
        UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
        -[UISplitKeyboardSupportAccessibility _axSetLastLocationDescription:]((uint64_t)v23, argument);
      }
      objc_storeStrong(&argument, 0);
      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v15, 0);
      objc_storeStrong(&v16, 0);
    }
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

- (id)_axDescriptionForPoint:(double)a3 windowWidth:(double)a4 windowHeight:(double)a5
{
  double v19 = a2;
  double v20 = a3;
  uint64_t v18 = a1;
  double v17 = a4;
  double v16 = a5;
  if (!a1)
  {
    id v21 = 0;
    goto LABEL_22;
  }
  id v15 = 0;
  if (v19 >= v17 / 3.0)
  {
    if (v19 <= 2.0 * v17 / 3.0)
    {
      if (v20 < v16 / 3.0)
      {
        id v10 = accessibilityLocalizedString(@"keyboard.floating.top");
        id v11 = v15;
        id v15 = v10;

        goto LABEL_21;
      }
      if (v20 <= 2.0 * v16 / 3.0) {
        id v7 = accessibilityLocalizedString(@"keyboard.floating.center");
      }
      else {
        id v7 = accessibilityLocalizedString(@"keyboard.floating.bottom");
      }
    }
    else
    {
      if (v20 < v16 / 3.0)
      {
        id v8 = accessibilityLocalizedString(@"keyboard.floating.top.right");
        id v9 = v15;
        id v15 = v8;

        goto LABEL_21;
      }
      if (v20 <= 2.0 * v16 / 3.0) {
        id v7 = accessibilityLocalizedString(@"keyboard.floating.right");
      }
      else {
        id v7 = accessibilityLocalizedString(@"keyboard.floating.bottom.right");
      }
    }
LABEL_19:
    id v12 = v15;
    id v15 = v7;

    goto LABEL_21;
  }
  if (v20 >= v16 / 3.0)
  {
    if (v20 <= 2.0 * v16 / 3.0) {
      id v7 = accessibilityLocalizedString(@"keyboard.floating.left");
    }
    else {
      id v7 = accessibilityLocalizedString(@"keyboard.floating.bottom.left");
    }
    goto LABEL_19;
  }
  id v5 = accessibilityLocalizedString(@"keyboard.floating.top.left");
  id v6 = v15;
  id v15 = v5;

LABEL_21:
  id v21 = v15;
  objc_storeStrong(&v15, 0);
LABEL_22:
  CGRect v13 = v21;

  return v13;
}

@end