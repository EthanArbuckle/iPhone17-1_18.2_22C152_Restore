@interface UIResponderAccessibility
+ (BOOL)_isSerializableAccessibilityElement;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityFKAArrowKeysHandled;
- (id)_keyCommands;
@end

@implementation UIResponderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIResponder";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIResponder", @"_keyCommands", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)_accessibilityFKAArrowKeysHandled
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v29[2] = self;
  v29[1] = (id)a2;
  v29[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  char v27 = 0;
  objc_opt_class();
  id v26 = (id)__UIAccessibilityCastAsClass();
  id v25 = v26;
  objc_storeStrong(&v26, 0);
  id v28 = v25;
  while (v28)
  {
    id v24 = 0;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v2 = (id)[v28 safeArrayForKey:@"_keyCommands"];
    }
    else {
      id v2 = (id)[v28 _accessibilityKeyCommands];
    }
    id v3 = v24;
    id v24 = v2;

    memset(__b, 0, sizeof(__b));
    id obj = v24;
    uint64_t v21 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
    if (v21)
    {
      uint64_t v17 = *(void *)__b[2];
      uint64_t v18 = 0;
      unint64_t v19 = v21;
      while (1)
      {
        uint64_t v16 = v18;
        if (*(void *)__b[2] != v17) {
          objc_enumerationMutation(obj);
        }
        id v23 = *(id *)(__b[1] + 8 * v18);
        if (![v23 modifierFlags])
        {
          id v14 = (id)[v23 input];
          char v15 = [v14 isEqualToString:*MEMORY[0x263F1D3E8]];

          if (v15)
          {
            [v29[0] addObject:@"↑"];
          }
          else
          {
            id v12 = (id)[v23 input];
            char v13 = [v12 isEqualToString:*MEMORY[0x263F1D3C8]];

            if (v13)
            {
              [v29[0] addObject:@"↓"];
            }
            else
            {
              id v10 = (id)[v23 input];
              char v11 = [v10 isEqualToString:*MEMORY[0x263F1D3D8]];

              if (v11)
              {
                [v29[0] addObject:@"←"];
              }
              else
              {
                id v8 = (id)[v23 input];
                char v9 = [v8 isEqualToString:*MEMORY[0x263F1D3E0]];

                if (v9) {
                  [v29[0] addObject:@"→"];
                }
              }
            }
          }
        }
        ++v18;
        if (v16 + 1 >= v19)
        {
          uint64_t v18 = 0;
          unint64_t v19 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
          if (!v19) {
            break;
          }
        }
      }
    }

    id v4 = (id)[v28 nextResponder];
    id v5 = v28;
    id v28 = v4;

    objc_storeStrong(&v24, 0);
  }
  id v7 = v29[0];
  objc_storeStrong(&v28, 0);
  objc_storeStrong(v29, 0);

  return v7;
}

- (id)_keyCommands
{
  v22 = self;
  v21[1] = (id)a2;
  v20.receiver = self;
  v20.super_class = (Class)UIResponderAccessibility;
  v21[0] = [(UIResponderAccessibility *)&v20 _keyCommands];
  if (([(UIResponderAccessibility *)v22 _accessibilityIsFKARunningForFocusItem] & 1) == 0|| _AXSFullKeyboardAccessPassthroughModeEnabled())
  {
    goto LABEL_23;
  }
  id v19 = (id)[(id)*MEMORY[0x263F1D020] _accessibilityNativeFocusElement];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v16 = 0;
    objc_opt_class();
    id v6 = (id)[(id)*MEMORY[0x263F1D020] _accessibilityNativeFocusElement];
    id v15 = (id)__UIAccessibilityCastAsClass();

    id v14 = v15;
    objc_storeStrong(&v15, 0);
    id v17 = v14;
    if (([v14 isFirstResponder] & 1) == 0
      || (uint64_t v2 = [v17 accessibilityTraits], (v2 & (*MEMORY[0x263F21B68] | *MEMORY[0x263F21A30])) == 0))
    {
      char v12 = 0;
      if (v21[0])
      {
        objc_storeStrong(v21, v21[0]);
      }
      else
      {
        id v13 = (id)[MEMORY[0x263EFF8C0] array];
        char v12 = 1;
        objc_storeStrong(v21, v13);
      }
      if (v12) {

      }
      id v5 = (id)[(UIResponderAccessibility *)v22 _accessibilityKeyCommands];
      id v11 = (id)[v5 mutableCopy];

      [v11 enumerateObjectsUsingBlock:&__block_literal_global_29];
      if ([v11 count])
      {
        char v9 = 0;
        char v7 = 0;
        if ([(UIResponderAccessibility *)v22 _accessibilityKeyCommandsShouldOverrideKeyCommands])
        {
          id v10 = (id)[v11 arrayByAddingObjectsFromArray:v21[0]];
          char v9 = 1;
          objc_storeStrong(v21, v10);
        }
        else
        {
          id v8 = (id)[v21[0] arrayByAddingObjectsFromArray:v11];
          char v7 = 1;
          objc_storeStrong(v21, v8);
        }
        if (v7) {

        }
        if (v9) {
      }
        }
      objc_storeStrong(&v11, 0);
    }
    objc_storeStrong(&v17, 0);
    int v18 = 0;
  }
  else
  {
    id v23 = v21[0];
    int v18 = 1;
  }
  objc_storeStrong(&v19, 0);
  if (!v18)
  {
LABEL_23:
    id v23 = v21[0];
    int v18 = 1;
  }
  objc_storeStrong(v21, 0);
  id v3 = v23;

  return v3;
}

void __40__UIResponderAccessibility__keyCommands__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] setWantsPriorityOverSystemBehavior:1];
  objc_storeStrong(location, 0);
}

@end