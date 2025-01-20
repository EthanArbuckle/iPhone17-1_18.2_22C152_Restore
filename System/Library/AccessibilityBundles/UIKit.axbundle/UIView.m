@interface UIView
- (BOOL)_accessibilityUserTestingIsTypeOfButton:(void *)a1;
- (id)_accessibilitySecureTextForString:(uint64_t)a1;
- (uint64_t)_accessibilityTextAreaTraits;
@end

@implementation UIView

- (uint64_t)_accessibilityTextAreaTraits
{
  id v6 = a1;
  if (!a1) {
    return 0;
  }
  uint64_t v5 = 0;
  id location = (id)[v6 safeValueForKey:@"textInputTraits"];
  if (([location safeBoolForKey:@"isSecureTextEntry"] & 1) != 0
    && ([location safeBoolForKey:@"displaySecureTextUsingPlainText"] & 1) == 0)
  {
    v5 |= *MEMORY[0x263F813D8];
  }
  id v2 = (id)[v6 safeValueForKey:@"isEnabled"];
  char v3 = [v2 BOOLValue];

  if ((v3 & 1) == 0) {
    v5 |= *MEMORY[0x263F1CF20];
  }
  uint64_t v7 = v5;
  objc_storeStrong(&location, 0);
  return v7;
}

- (id)_accessibilitySecureTextForString:(uint64_t)a1
{
  uint64_t v10 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v10)
  {
    id v7 = (id)[objc_allocWithZone(MEMORY[0x263F089D8]) init];
    unint64_t v6 = [location length];
    for (unint64_t i = 0; i < v6; ++i)
      [v7 appendString:@"•"];
    id v4 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v7];
    [v4 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21868]];
    id v11 = v4;
    int v8 = 1;
    objc_storeStrong(&v4, 0);
    objc_storeStrong(&v7, 0);
  }
  else
  {
    id v11 = 0;
    int v8 = 1;
  }
  objc_storeStrong(&location, 0);
  id v2 = v11;

  return v2;
}

- (BOOL)_accessibilityUserTestingIsTypeOfButton:(void *)a1
{
  id v23 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v23)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    int v16 = 838860800;
    int v17 = 48;
    v18 = __Block_byref_object_copy__27;
    v19 = __Block_byref_object_dispose__27;
    id v20 = 0;
    uint64_t v7 = MEMORY[0x263EF8330];
    int v8 = -1073741824;
    int v9 = 0;
    uint64_t v10 = __75__UIView_AutomationAccessibility___accessibilityUserTestingIsTypeOfButton___block_invoke;
    id v11 = &unk_2650AEAA8;
    v12 = &v14;
    id v13 = (id)objc_msgSend(v23, "_accessibilityFindViewAncestor:startWithSelf:");
    if (v15[5])
    {
      uint64_t v6 = 0;
      uint64_t v6 = [(id)v15[5] indexOfObject:v23];
      uint64_t v5 = -1;
      if ([location isEqualToString:@"default"])
      {
        id v4 = (id)[v13 safeValueForKey:@"_defaultButton"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v5 = [v4 integerValue];
        }
        if (v5 == -1 && v6 == [(id)v15[5] count] - 1)
        {
          BOOL v24 = 1;
          int v21 = 1;
        }
        else
        {
          int v21 = 0;
        }
        objc_storeStrong(&v4, 0);
        if (v21) {
          goto LABEL_19;
        }
      }
      else if ([location isEqualToString:@"cancel"])
      {
        id v3 = (id)[v13 safeValueForKey:@"_cancelButton"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v5 = [v3 integerValue];
        }
        objc_storeStrong(&v3, 0);
      }
      BOOL v24 = v6 == v5;
      int v21 = 1;
    }
    else
    {
      BOOL v24 = 0;
      int v21 = 1;
    }
LABEL_19:
    objc_storeStrong(&v13, 0);
    _Block_object_dispose(&v14, 8);
    objc_storeStrong(&v20, 0);
    goto LABEL_20;
  }
  BOOL v24 = 0;
  int v21 = 1;
LABEL_20:
  objc_storeStrong(&location, 0);
  return v24;
}

uint64_t __75__UIView_AutomationAccessibility___accessibilityUserTestingIsTypeOfButton___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v3 = (id)[location[0] safeValueForKey:@"_buttons"];
    uint64_t v4 = *(void *)(a1[4] + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    char v10 = 1;
  }
  else
  {
    if ([location[0] accessibilityIsWindow]) {
      *a3 = 1;
    }
    char v10 = 0;
  }
  objc_storeStrong(location, 0);
  return v10 & 1;
}

@end