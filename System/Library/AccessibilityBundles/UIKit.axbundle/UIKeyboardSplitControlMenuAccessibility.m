@interface UIKeyboardSplitControlMenuAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)updateSelectionWithPoint:(CGPoint)a3;
@end

@implementation UIKeyboardSplitControlMenuAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardSplitControlMenu";
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
  [location[0] validateClass:@"UIInputSwitcherTableView" isKindOfClass:@"UITableView"];
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"UIKeyboardSplitControlMenu" isKindOfClass:@"UIKeyboardMenuView"];
  objc_storeStrong(location, 0);
}

- (void)updateSelectionWithPoint:(CGPoint)a3
{
  CGPoint v18 = a3;
  v17 = self;
  v16[1] = (id)a2;
  char v15 = 0;
  objc_opt_class();
  id v8 = (id)[(UIKeyboardSplitControlMenuAccessibility *)v17 safeValueForKey:@"m_table"];
  id v14 = (id)__UIAccessibilityCastAsClass();

  id v13 = v14;
  objc_storeStrong(&v14, 0);
  v16[0] = v13;
  id v12 = (id)[v13 indexPathForSelectedRow];
  v11.receiver = v17;
  v11.super_class = (Class)UIKeyboardSplitControlMenuAccessibility;
  -[UIKeyboardSplitControlMenuAccessibility updateSelectionWithPoint:](&v11, sel_updateSelectionWithPoint_, v18.x, v18.y);
  id v10 = (id)[v16[0] indexPathForSelectedRow];
  if (v12 != v10 && ([v12 isEqual:v10] & 1) == 0)
  {
    if (v10)
    {
      id v9 = (id)[v16[0] cellForRowAtIndexPath:v10];
      if (v9)
      {
        UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
        id v5 = (id)[v9 textLabel];
        id v4 = (id)[v5 text];
        UIAccessibilityPostNotification(v3, v4);
      }
      objc_storeStrong(&v9, 0);
    }
    else
    {
      UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
      id v7 = accessibilityLocalizedString(@"keyboard.cancel");
      UIAccessibilityPostNotification(notification, v7);
    }
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v16, 0);
}

@end