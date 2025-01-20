@interface UINavigationBarAccessibility_UIViewAccessibilityAdditions
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)__accessibilitySupportsActivateAction;
- (BOOL)_accessibilityIsNavigationView;
- (BOOL)_accessibilityIsTitleElement;
- (BOOL)_accessibilityServesAsFirstElement;
- (BOOL)_accessibilityUIViewCanPerformEscapeAction;
- (BOOL)_accessibilityUserTestingIsRightNavButton;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityPerformEscape;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityAXAttributedLabel;
- (id)_accessibilityNavigationViewInfo;
- (id)accessibilityLanguage;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetNavigationViewInfo:(id)a3;
@end

@implementation UINavigationBarAccessibility_UIViewAccessibilityAdditions

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityNavigationViewInfo
{
  return objc_getAssociatedObject(self, &__UINavigationBarAccessibility_UIViewAccessibilityAdditions___accessibilityNavigationViewInfo);
}

- (void)_accessibilitySetNavigationViewInfo:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityIsNavigationView
{
  if (a1)
  {
    id v1 = (id)[a1 _accessibilityNavigationViewInfo];
    BOOL v3 = v1 != 0;
  }
  else
  {
    return 0;
  }
  return v3;
}

- (id)_accessibilityAXAttributedLabel
{
  v29 = self;
  v28[1] = (id)a2;
  if (!-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self)) {
    goto LABEL_31;
  }
  v28[0] = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)v29 _accessibilityNavigationViewInfo];
  char v26 = 0;
  char v24 = 0;
  char v22 = 0;
  char v20 = 0;
  BOOL v15 = 0;
  if ([(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)v29 _accessibilityIsTitleElement])
  {
    id v27 = -[_UIAccessibilityNavigationViewInfo navigationItem]((uint64_t)v28[0]);
    char v26 = 1;
    id v25 = (id)[v27 _accessibilityAXAttributedLabel];
    char v24 = 1;
    BOOL v15 = 0;
    if (v25)
    {
      id v23 = -[_UIAccessibilityNavigationViewInfo navigationItem]((uint64_t)v28[0]);
      char v22 = 1;
      id v21 = (id)[v23 titleView];
      char v20 = 1;
      BOOL v15 = v21 == 0;
    }
  }
  if (v20) {

  }
  if (v22) {
  if (v24)
  }

  if (v26) {
  if (v15)
  }
  {
    id v14 = -[_UIAccessibilityNavigationViewInfo navigationItem]((uint64_t)v28[0]);
    id v30 = (id)[v14 _accessibilityAXAttributedLabel];

    int v19 = 1;
  }
  else
  {
    id v18 = (id)[(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)v29 _accessibilityPotentiallyAttributedValueForNonAttributedSelector:sel_accessibilityLabel attributedSelector:sel_accessibilityAttributedLabel];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v30 = (id)[objc_alloc(MEMORY[0x263F21660]) initWithCFAttributedString:v18];
      int v19 = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v30 = v18;
        int v19 = 1;
      }
      else
      {
        id v2 = -[_UIAccessibilityNavigationViewInfo barButtonItem]((uint64_t)v28[0]);
        BOOL v13 = v2 == 0;

        if (v13)
        {
          id v3 = -[_UIAccessibilityNavigationViewInfo navigationItem]((uint64_t)v28[0]);
          BOOL v10 = v3 == 0;

          if (v10) {
            goto LABEL_28;
          }
          id location = -[_UIAccessibilityNavigationViewInfo navigationItem]((uint64_t)v28[0]);
          id v4 = (id)[location _accessibilityAXAttributedLabel];
          BOOL v9 = v4 == 0;

          if (v9)
          {
            id v5 = (id)[location title];
            BOOL v8 = v5 == 0;

            if (v8)
            {
              int v19 = 0;
            }
            else
            {
              id v30 = (id)[location title];
              int v19 = 1;
            }
          }
          else
          {
            id v30 = (id)[location _accessibilityAXAttributedLabel];
            int v19 = 1;
          }
          objc_storeStrong(&location, 0);
          if (!v19) {
LABEL_28:
          }
            int v19 = 0;
        }
        else
        {
          id v12 = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)v29 _accessibilityNavigationViewInfo];
          id v11 = -[_UIAccessibilityNavigationViewInfo barButtonItem]((uint64_t)v12);
          id v30 = (id)-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityComputedLabelForNavigationBarWithAssociatedBarButtonItem:](v29, "_accessibilityComputedLabelForNavigationBarWithAssociatedBarButtonItem:");

          int v19 = 1;
        }
      }
    }
    objc_storeStrong(&v18, 0);
  }
  objc_storeStrong(v28, 0);
  if (!v19)
  {
LABEL_31:
    v16.receiver = v29;
    v16.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    id v30 = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)&v16 _accessibilityAXAttributedLabel];
  }
  v6 = v30;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  int v19 = self;
  v18[1] = (id)a2;
  if (-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self))
  {
    v18[0] = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)v19 _accessibilityNavigationViewInfo];
    uint64_t v17 = 0;
    id v2 = -[_UIAccessibilityNavigationViewInfo barButtonItem]((uint64_t)v18[0]);
    BOOL v12 = v2 == 0;

    if (v12)
    {
      id v16 = -[_UIAccessibilityNavigationViewInfo navigationItem]((uint64_t)v18[0]);
      id v10 = (id)[v16 title];
      BOOL v11 = [v10 length] == 0;

      if (v11)
      {
        id v3 = (id)[v16 titleView];
        BOOL v9 = v3 == 0;

        if (!v9)
        {
          id location = (id)[v16 titleView];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v17 |= *MEMORY[0x263F1CEE8];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v17 = *MEMORY[0x263F1CF00];
              id v7 = (id)[location gestureRecognizers];
              char v8 = 1;
              if (![v7 count]) {
                char v8 = [location isUserInteractionEnabled];
              }

              if (v8) {
                v17 |= *MEMORY[0x263F1CEE8];
              }
            }
            else
            {
              id v6 = location;
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v17 |= *MEMORY[0x263F1CF48] | *MEMORY[0x263F1CEF8];
              }
            }
          }
          objc_storeStrong(&location, 0);
        }
      }
      else
      {
        v17 |= *MEMORY[0x263F1CF48] | *MEMORY[0x263F1CEF8];
      }
      objc_storeStrong(&v16, 0);
    }
    else
    {
      v17 |= *MEMORY[0x263F1CEE8];
    }
    v14.receiver = v19;
    v14.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    unint64_t v4 = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)&v14 accessibilityTraits];
    unint64_t v20 = v4 | v17;
    objc_storeStrong(v18, 0);
  }
  else
  {
    v13.receiver = v19;
    v13.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    return [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)&v13 accessibilityTraits];
  }
  return v20;
}

- (BOOL)isAccessibilityElement
{
  int v19 = self;
  v18[1] = (id)a2;
  if (-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self))
  {
    v18[0] = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)v19 _accessibilityNavigationViewInfo];
    id v9 = -[_UIAccessibilityNavigationViewInfo navigationItem]((uint64_t)v18[0]);
    id v17 = (id)[v9 titleView];

    if (v17)
    {
      id location = (id)[v17 safeArrayForKey:@"gestureRecognizers"];
      uint64_t v15 = [location count];
      id v6 = (id)[v17 isAccessibilityUserDefinedElement];
      char v7 = [v6 BOOLValue];

      char v14 = v7 & 1;
      char v13 = [v17 safeBoolForKey:@"userInteractionEnabled"] & 1;
      char v12 = 0;
      objc_opt_class();
      char v8 = 1;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (char v8 = 1, (v14 & 1) == 0))
        {
          if (([v17 safeBoolForKey:@"isUserInteractionEnabled"] & 1) == 0
            || (char v8 = 1, (v14 & 1) == 0))
          {
            if (!v15 || (char v8 = 1, (v14 & 1) == 0))
            {
              char v5 = 0;
              if (v13) {
                char v5 = v14;
              }
              char v8 = v5;
            }
          }
        }
      }
      char v12 = v8;
      char v20 = v8 & 1;
      int v11 = 1;
      objc_storeStrong(&location, 0);
    }
    else
    {
      id v3 = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)v19 _accessibilityAXAttributedLabel];
      char v4 = 0;
      if ([v3 length]) {
        char v4 = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)v19 _accessibilityViewIsVisible];
      }
      char v20 = v4 & 1;

      int v11 = 1;
    }
    objc_storeStrong(&v17, 0);
    objc_storeStrong(v18, 0);
  }
  else
  {
    v10.receiver = v19;
    v10.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    char v20 = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)&v10 isAccessibilityElement];
  }
  return v20 & 1;
}

- (BOOL)accessibilityActivate
{
  objc_super v10 = self;
  location[1] = (id)a2;
  if (!-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self)) {
    goto LABEL_6;
  }
  location[0] = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)v10 _accessibilityNavigationViewInfo];
  id v2 = -[_UIAccessibilityNavigationViewInfo barButtonItem]((uint64_t)location[0]);
  BOOL v6 = v2 == 0;

  if (v6)
  {
    int v8 = 0;
  }
  else
  {
    id v5 = -[_UIAccessibilityNavigationViewInfo navigationBar]((uint64_t)location[0]);
    id v4 = -[_UIAccessibilityNavigationViewInfo barButtonItem]((uint64_t)location[0]);
    objc_msgSend(v5, "_accessibility_triggerBarButtonItem:");

    char v11 = 1;
    int v8 = 1;
  }
  objc_storeStrong(location, 0);
  if (!v8)
  {
LABEL_6:
    v7.receiver = v10;
    v7.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    char v11 = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)&v7 accessibilityActivate];
  }
  return v11 & 1;
}

- (BOOL)__accessibilitySupportsActivateAction
{
  int v8 = self;
  SEL v7 = a2;
  char v11 = (dispatch_once_t *)&__accessibilitySupportsActivateAction_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_504);
  if (*v11 != -1) {
    dispatch_once(v11, location);
  }
  objc_storeStrong(&location, 0);
  char v6 = 0;
  v5.receiver = v8;
  v5.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
  char v6 = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)&v5 __accessibilitySupportsActivateAction];
  if (v6)
  {
    id v4 = (id)[(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)v8 _accessibilityGetBlockForAttribute:17];
    id v2 = (objc_class *)objc_opt_class();
    BOOL v9 = class_getInstanceMethod(v2, sel_accessibilityActivate) != (Method)__accessibilitySupportsActivateAction_categoryMethod
      || v4
      || -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](v8);
    objc_storeStrong(&v4, 0);
  }
  else
  {
    return 0;
  }
  return v9;
}

- (BOOL)_accessibilityUIViewCanPerformEscapeAction
{
  objc_super v5 = self;
  location[1] = (id)a2;
  if (!-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self)
    || ((location[0] = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityNavigationViewInfo](v5, "_accessibilityNavigationViewInfo"), (-[_UIAccessibilityNavigationViewInfo isCancelItem]((uint64_t)location[0]) & 1) == 0)? (int v3 = 0): (v6 = 1, int v3 = 1), objc_storeStrong(location, 0), !v3))
  {
    char v6 = 0;
  }
  return v6 & 1;
}

- (BOOL)accessibilityPerformEscape
{
  char v6 = self;
  location[1] = (id)a2;
  if (!-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self)
    || ((location[0] = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityNavigationViewInfo](v6, "_accessibilityNavigationViewInfo"), (-[_UIAccessibilityNavigationViewInfo isCancelItem]((uint64_t)location[0]) & 1) == 0)? (int v4 = 0): (v7 = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)v6 accessibilityActivate], int v4 = 1), objc_storeStrong(location, 0), !v4))
  {
    v3.receiver = v6;
    v3.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    char v7 = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)&v3 accessibilityPerformEscape];
  }
  return v7 & 1;
}

- (BOOL)_accessibilityIsTitleElement
{
  objc_super v10 = self;
  location[1] = (id)a2;
  if (!-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self)) {
    goto LABEL_10;
  }
  location[0] = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)v10 _accessibilityNavigationViewInfo];
  id v3 = -[_UIAccessibilityNavigationViewInfo barButtonItem]((uint64_t)location[0]);
  char v7 = 0;
  BOOL v4 = 0;
  if (!v3)
  {
    id v8 = -[_UIAccessibilityNavigationViewInfo navigationItem]((uint64_t)location[0]);
    char v7 = 1;
    BOOL v4 = v8 != 0;
  }
  if (v7) {

  }
  if (v4)
  {
    char v11 = 1;
    int v6 = 1;
  }
  else
  {
    int v6 = 0;
  }
  objc_storeStrong(location, 0);
  if (!v6)
  {
LABEL_10:
    v5.receiver = v10;
    v5.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    char v11 = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)&v5 _accessibilityIsTitleElement];
  }
  return v11 & 1;
}

- (BOOL)_accessibilityServesAsFirstElement
{
  id v8 = self;
  SEL v7 = a2;
  if (-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self))
  {
    char v5 = 0;
    BOOL v3 = 0;
    if ([(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)v8 _accessibilityIsTitleElement])
    {
      id v6 = (id)[(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)v8 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uipopoverview.isa)];
      char v5 = 1;
      BOOL v3 = v6 != 0;
    }
    BOOL v9 = v3;
    if (v5) {
  }
    }
  else
  {
    v4.receiver = v8;
    v4.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    return [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)&v4 _accessibilityServesAsFirstElement];
  }
  return v9;
}

- (id)accessibilityLanguage
{
  SEL v7 = self;
  v6[1] = (id)a2;
  if (-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self))
  {
    v6[0] = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)v7 _accessibilityNavigationViewInfo];
    id v5 = -[_UIAccessibilityNavigationViewInfo navigationItem]((uint64_t)v6[0]);
    id v8 = (id)[v5 accessibilityLanguage];
    objc_storeStrong(&v5, 0);
    objc_storeStrong(v6, 0);
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    id v8 = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)&v4 accessibilityLanguage];
  }
  id v2 = v8;

  return v2;
}

- (BOOL)_accessibilityUserTestingIsRightNavButton
{
  id v6 = self;
  SEL v5 = a2;
  if (-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self))
  {
    id v3 = [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)v6 _accessibilityNavigationViewInfo];
    BOOL v7 = -[_UIAccessibilityNavigationViewInfo isRightItem]((uint64_t)v3) & 1;
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    return [(UINavigationBarAccessibility_UIViewAccessibilityAdditions *)&v4 _accessibilityUserTestingIsRightNavButton];
  }
  return v7;
}

@end