@interface UIView(AutomationAccessibility)
- (uint64_t)_accessibilitySetUserTestingIsCancelButton:()AutomationAccessibility;
- (uint64_t)_accessibilitySetUserTestingIsDefaultButton:()AutomationAccessibility;
- (uint64_t)_accessibilitySetUserTestingIsDestructiveButton:()AutomationAccessibility;
- (uint64_t)_accessibilitySetUserTestingIsPreferredButton:()AutomationAccessibility;
- (uint64_t)_accessibilityUserTestingIsBackNavButton;
- (uint64_t)_accessibilityUserTestingIsCancelButton;
- (uint64_t)_accessibilityUserTestingIsDefaultButton;
- (uint64_t)_accessibilityUserTestingIsDestructiveButton;
- (uint64_t)_accessibilityUserTestingIsPreferredButton;
- (uint64_t)_accessibilityUserTestingIsRightNavButton;
@end

@implementation UIView(AutomationAccessibility)

- (uint64_t)_accessibilityUserTestingIsDefaultButton
{
  id v1 = (id)[a1 _accessibilityValueForKey:@"AXIsDefaultButton"];
  BOOL v3 = v1 == 0;

  if (v3) {
    char v5 = -[UIView _accessibilityUserTestingIsTypeOfButton:](a1, @"default");
  }
  else {
    char v5 = [a1 _accessibilityBoolValueForKey:@"AXIsDefaultButton"] & 1;
  }
  return v5 & 1;
}

- (uint64_t)_accessibilitySetUserTestingIsDefaultButton:()AutomationAccessibility
{
  return [a1 _accessibilitySetBoolValue:a3 & 1 forKey:@"AXIsDefaultButton"];
}

- (uint64_t)_accessibilitySetUserTestingIsCancelButton:()AutomationAccessibility
{
  return [a1 _accessibilitySetBoolValue:a3 & 1 forKey:@"AXIsCancelButton"];
}

- (uint64_t)_accessibilityUserTestingIsCancelButton
{
  id v1 = (id)[a1 _accessibilityValueForKey:@"AXIsCancelButton"];
  BOOL v3 = v1 == 0;

  if (v3) {
    char v5 = -[UIView _accessibilityUserTestingIsTypeOfButton:](a1, @"cancel");
  }
  else {
    char v5 = [a1 _accessibilityBoolValueForKey:@"AXIsCancelButton"] & 1;
  }
  return v5 & 1;
}

- (uint64_t)_accessibilityUserTestingIsDestructiveButton
{
  id v7 = a1;
  uint64_t v6 = a2;
  id v2 = (id)[a1 _accessibilityValueForKey:@"AXIsDestructiveButton"];
  BOOL v4 = v2 == 0;

  if (v4)
  {
    v5.receiver = v7;
    v5.super_class = (Class)&off_26F4ACC20;
    char v8 = objc_msgSendSuper2(&v5, sel__accessibilityUserTestingIsDestructiveButton) & 1;
  }
  else
  {
    char v8 = [v7 _accessibilityBoolValueForKey:@"AXIsDestructiveButton"] & 1;
  }
  return v8 & 1;
}

- (uint64_t)_accessibilitySetUserTestingIsDestructiveButton:()AutomationAccessibility
{
  return [a1 _accessibilitySetBoolValue:a3 & 1 forKey:@"AXIsDestructiveButton"];
}

- (uint64_t)_accessibilityUserTestingIsPreferredButton
{
  id v7 = a1;
  uint64_t v6 = a2;
  id v2 = (id)[a1 _accessibilityValueForKey:@"AXIsPreferredButton"];
  BOOL v4 = v2 == 0;

  if (v4)
  {
    v5.receiver = v7;
    v5.super_class = (Class)&off_26F4ACC20;
    char v8 = objc_msgSendSuper2(&v5, sel__accessibilityUserTestingIsPreferredButton) & 1;
  }
  else
  {
    char v8 = [v7 _accessibilityBoolValueForKey:@"AXIsPreferredButton"] & 1;
  }
  return v8 & 1;
}

- (uint64_t)_accessibilitySetUserTestingIsPreferredButton:()AutomationAccessibility
{
  return [a1 _accessibilitySetBoolValue:a3 & 1 forKey:@"AXIsPreferredButton"];
}

- (uint64_t)_accessibilityUserTestingIsBackNavButton
{
  id v23 = a1;
  uint64_t v22 = a2;
  if (([a1 isAccessibilityElement] & 1) != 0
    && ([v23 _accessibilityViewIsVisible] & 1) != 0)
  {
    if ([v23 _accessibilityIsFrameOutOfBounds])
    {
      char v24 = 0;
    }
    else
    {
      NSClassFromString(&cfstr_Uinavigationit_0.isa);
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (NSClassFromString(&cfstr_Uinavigationit_2.isa), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v10 = (id)[v23 safeValueForKey:@"_item"];
        id v2 = (id)[v10 safeValueForKey:@"_backButtonView"];
        char v24 = v23 == v2;
      }
      else
      {
        NSClassFromString(&cfstr_Uinavigationbu.isa);
        char v20 = 0;
        char isKindOfClass = 0;
        if (objc_opt_isKindOfClass())
        {
          id v21 = (id)[v23 superview];
          char v20 = 1;
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
        }
        if (v20) {

        }
        if (isKindOfClass)
        {
          id v8 = (id)[v23 superview];
          id v19 = (id)[v8 safeValueForKey:@"_visualProvider"];

          id v18 = 0;
          NSClassFromString(&cfstr_Uinavigationba_0.isa);
          if (objc_opt_isKindOfClass())
          {
            id v3 = (id)[v19 safeValueForKey:@"_leftViews"];
            id v4 = v18;
            id v18 = v3;
          }
          if (v18)
          {
            id location = (id)[v23 _accessibilityAncestorIsKindOf:objc_opt_class()];
            char v14 = 0;
            char v12 = 0;
            char v7 = 0;
            if ([v18 indexOfObjectIdenticalTo:v23] != 0x7FFFFFFFFFFFFFFFLL)
            {
              id v15 = (id)[location currentBackButton];
              char v14 = 1;
              char v6 = 1;
              if (v15 != v23)
              {
                id v13 = (id)[location topItem];
                char v12 = 1;
                char v6 = [v13 leftItemsSupplementBackButton];
              }
              char v7 = v6;
            }
            char v24 = v7 & 1;
            if (v12) {

            }
            if (v14) {
            int v17 = 1;
            }
            objc_storeStrong(&location, 0);
          }
          else
          {
            char v24 = 0;
            int v17 = 1;
          }
          objc_storeStrong(&v18, 0);
          objc_storeStrong(&v19, 0);
        }
        else
        {
          v11.receiver = v23;
          v11.super_class = (Class)&off_26F4ACC20;
          char v24 = objc_msgSendSuper2(&v11, sel__accessibilityUserTestingIsBackNavButton) & 1;
        }
      }
    }
  }
  else
  {
    char v24 = 0;
  }
  return v24 & 1;
}

- (uint64_t)_accessibilityUserTestingIsRightNavButton
{
  return 0;
}

@end