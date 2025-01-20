@interface UIToolbarTextButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
- (id)accessibilityLabel;
@end

@implementation UIToolbarTextButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIToolbarTextButton";
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
  v3 = @"UINavigationButton";
  objc_msgSend(location[0], "validateClass:");
  [location[0] validateClass:@"UIToolbarTextButton" hasInstanceVariable:@"_title" withType:"NSString"];
  v4 = "@";
  [location[0] validateClass:@"UINavigationButton" hasInstanceMethod:@"title" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"image", v4, 0);
  objc_storeStrong(v6, obj);
}

- (id)accessibilityLabel
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v21 = self;
  v20[1] = (id)a2;
  id v2 = (id)[(UIToolbarTextButtonAccessibility *)self accessibilityUserDefinedLabel];
  BOOL v15 = v2 == 0;

  if (v15)
  {
    v20[0] = (id)[(UIToolbarTextButtonAccessibility *)v21 safeValueForKey:@"_title"];
    if (!v20[0])
    {
      v19.receiver = v21;
      v19.super_class = (Class)UIToolbarTextButtonAccessibility;
      id v3 = [(UIToolbarTextButtonAccessibility *)&v19 accessibilityLabel];
      id v4 = v20[0];
      v20[0] = v3;
    }
    if (!v20[0])
    {
      id location = (id)[(UIToolbarTextButtonAccessibility *)v21 safeValueForKey:@"subviews"];
      memset(__b, 0, sizeof(__b));
      id obj = location;
      uint64_t v14 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
      if (v14)
      {
        uint64_t v10 = *(void *)__b[2];
        uint64_t v11 = 0;
        unint64_t v12 = v14;
        while (1)
        {
          uint64_t v9 = v11;
          if (*(void *)__b[2] != v10) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(id *)(__b[1] + 8 * v11);
          if ([v17 isAccessibilityElement])
          {
            id v5 = (id)[v17 accessibilityLabel];
            id v6 = v20[0];
            v20[0] = v5;
          }
          if ([v20[0] length]) {
            break;
          }
          ++v11;
          if (v9 + 1 >= v12)
          {
            uint64_t v11 = 0;
            unint64_t v12 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
            if (!v12) {
              break;
            }
          }
        }
      }

      objc_storeStrong(&location, 0);
    }
    id v22 = v20[0];
    objc_storeStrong(v20, 0);
  }
  else
  {
    id v22 = (id)[(UIToolbarTextButtonAccessibility *)v21 accessibilityUserDefinedLabel];
  }
  v7 = v22;

  return v7;
}

- (BOOL)accessibilityElementsHidden
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v31 = self;
  v30[1] = (id)a2;
  char v29 = 0;
  objc_opt_class();
  id v28 = (id)__UIAccessibilityCastAsClass();
  id v27 = v28;
  objc_storeStrong(&v28, 0);
  v30[0] = v27;
  id v26 = (id)[v27 safeValueForKey:@"subviews"];
  memset(__b, 0, sizeof(__b));
  id obj = v26;
  uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v33 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v25 = *(id *)(__b[1] + 8 * v9);
      if ([v25 isAccessibilityElement])
      {
        NSClassFromString(&cfstr_Uinavigationbu.isa);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v32 = 0;
          int v17 = 1;
          goto LABEL_23;
        }
        char v22 = 0;
        objc_opt_class();
        id v6 = (id)[(UIToolbarTextButtonAccessibility *)v31 safeValueForKey:@"title"];
        id v21 = (id)__UIAccessibilityCastAsClass();

        if (v22) {
          abort();
        }
        id v20 = v21;
        objc_storeStrong(&v21, 0);
        id v23 = v20;
        char v18 = 0;
        if (!v20 || (BOOL v5 = 1, ![v23 length]))
        {
          id v19 = (id)[v25 safeValueForKey:@"image"];
          char v18 = 1;
          BOOL v5 = v19 != 0;
        }
        if (v18) {

        }
        if (v5)
        {
          BOOL v32 = 0;
          int v17 = 1;
        }
        else
        {
          int v17 = 0;
        }
        objc_storeStrong(&v23, 0);
        if (v17) {
          goto LABEL_23;
        }
      }
      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v33 count:16];
        if (!v10) {
          break;
        }
      }
    }
  }
  int v17 = 0;
LABEL_23:

  if (!v17)
  {
    char v15 = 0;
    objc_opt_class();
    id v4 = (id)[(UIToolbarTextButtonAccessibility *)v31 safeValueForKey:@"_title"];
    id v14 = (id)__UIAccessibilityCastAsClass();

    id v13 = v14;
    objc_storeStrong(&v14, 0);
    id v16 = v13;
    BOOL v3 = 1;
    if (v13) {
      BOOL v3 = [v16 length] == 0;
    }
    BOOL v32 = v3;
    int v17 = 1;
    objc_storeStrong(&v16, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(v30, 0);
  return v32;
}

@end