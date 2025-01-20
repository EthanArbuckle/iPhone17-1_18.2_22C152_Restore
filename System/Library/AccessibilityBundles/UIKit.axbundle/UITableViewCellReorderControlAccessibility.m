@interface UITableViewCellReorderControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UITableViewCellReorderControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewCellReorderControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v13 = self;
  SEL v12 = a2;
  char v11 = 0;
  char v10 = 0;
  objc_opt_class();
  id v6 = (id)[(UITableViewCellReorderControlAccessibility *)v13 _accessibilityAncestorIsKindOf:objc_opt_class()];
  id v9 = (id)__UIAccessibilityCastAsSafeCategory();

  id v8 = v9;
  objc_storeStrong(&v9, 0);
  int v5 = -[UITableViewCellAccessibility _accessibilityClientIgnoresReorderControl]() ^ 1;

  char v11 = v5 & 1;
  if (v5)
  {
    id v7 = (id)[(UITableViewCellReorderControlAccessibility *)v13 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v7 showingDeleteConfirmation])
    {
      BOOL v14 = 0;
    }
    else
    {
      id v4 = (id)[(UITableViewCellReorderControlAccessibility *)v13 safeValueForKey:@"alpha"];
      [v4 floatValue];
      BOOL v14 = v2 > 0.0;
    }
    objc_storeStrong(&v7, 0);
  }
  else
  {
    return 0;
  }
  return v14;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8] | *MEMORY[0x263F81380];
}

- (id)accessibilityLabel
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v36[2] = self;
  v36[1] = (id)a2;
  v36[0] = (id)[(UITableViewCellReorderControlAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v33 = 0;
    objc_opt_class();
    id v32 = (id)__UIAccessibilityCastAsSafeCategory();
    id v31 = v32;
    objc_storeStrong(&v32, 0);
    id v34 = v31;
    id v30 = (id)[v31 _accessibilityRetrieveTableViewCellTextForReorderControl];
    if ([v30 length])
    {
      id v29 = v30;
      if ([v30 isAXAttributedString])
      {
        id v2 = (id)[v30 string];
        id v3 = v29;
        id v29 = v2;
      }
      v19 = NSString;
      id v20 = accessibilityLocalizedString(@"table.view.reorder.control.label");
      id v28 = (id)[v19 stringWithFormat:v29];

      uint64_t v26 = [v28 rangeOfString:v29];
      uint64_t v27 = v4;
      id v25 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v28];
      if ([v30 isAXAttributedString])
      {
        v24[0] = 0;
        v24[1] = 0;
        id v23 = (id)[v30 attributesAtIndex:0 effectiveRange:v24];
        memset(__b, 0, sizeof(__b));
        id obj = v23;
        uint64_t v18 = [obj countByEnumeratingWithState:__b objects:v38 count:16];
        if (v18)
        {
          uint64_t v14 = *(void *)__b[2];
          uint64_t v15 = 0;
          unint64_t v16 = v18;
          while (1)
          {
            uint64_t v13 = v15;
            if (*(void *)__b[2] != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void *)(__b[1] + 8 * v15);
            id v11 = v25;
            id v12 = (id)[v23 objectForKey:v22];
            objc_msgSend(v11, "setAttribute:forKey:withRange:");

            ++v15;
            if (v13 + 1 >= v16)
            {
              uint64_t v15 = 0;
              unint64_t v16 = [obj countByEnumeratingWithState:__b objects:v38 count:16];
              if (!v16) {
                break;
              }
            }
          }
        }

        objc_storeStrong(&v23, 0);
      }
      id v9 = (id)[v36[0] accessibilityLanguage];
      BOOL v10 = 0;
      if (v9) {
        BOOL v10 = v26 != 0x7FFFFFFFFFFFFFFFLL;
      }

      if (v10)
      {
        id v7 = v25;
        id v8 = (id)[v36[0] accessibilityLanguage];
        objc_msgSend(v7, "setAttribute:forKey:withRange:");
      }
      id v37 = v25;
      int v35 = 1;
      objc_storeStrong(&v25, 0);
      objc_storeStrong(&v28, 0);
      objc_storeStrong(&v29, 0);
    }
    else
    {
      id v37 = accessibilityLocalizedString(@"table.view.reorder.control");
      int v35 = 1;
    }
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v34, 0);
  }
  else
  {
    id v37 = 0;
    int v35 = 1;
  }
  objc_storeStrong(v36, 0);
  int v5 = v37;

  return v5;
}

@end