@interface UISearchDisplayControllerContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityObscuredScreenAllowsView:(id)a3;
- (id)_accessibilityObscuredScreenAllowedViews;
@end

@implementation UISearchDisplayControllerContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISearchDisplayControllerContainerView";
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
  objc_storeStrong(location, 0);
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v26[2] = self;
  v26[1] = (id)a2;
  id v18 = (id)[(UISearchDisplayControllerContainerViewAccessibility *)self superview];
  v26[0] = (id)[v18 subviews];

  id v25 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = v26[0];
  uint64_t v20 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
  if (v20)
  {
    uint64_t v15 = *(void *)__b[2];
    uint64_t v16 = 0;
    unint64_t v17 = v20;
    while (1)
    {
      uint64_t v14 = v16;
      if (*(void *)__b[2] != v15) {
        objc_enumerationMutation(obj);
      }
      id v24 = *(id *)(__b[1] + 8 * v16);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (!v25)
        {
          id v2 = (id)[MEMORY[0x263EFF980] arrayWithObject:v24];
          id v3 = v25;
          id v25 = v2;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id location = (id)[v24 subviews];
          memset(v21, 0, 0x40uLL);
          id v12 = location;
          uint64_t v13 = [v12 countByEnumeratingWithState:v21 objects:v27 count:16];
          if (v13)
          {
            uint64_t v9 = *(void *)v21[2];
            uint64_t v10 = 0;
            unint64_t v11 = v13;
            while (1)
            {
              uint64_t v8 = v10;
              if (*(void *)v21[2] != v9) {
                objc_enumerationMutation(v12);
              }
              v21[8] = *(void *)(v21[1] + 8 * v10);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && !v25)
              {
                id v4 = (id)[MEMORY[0x263EFF980] arrayWithObject:v24];
                id v5 = v25;
                id v25 = v4;
              }
              ++v10;
              if (v8 + 1 >= v11)
              {
                uint64_t v10 = 0;
                unint64_t v11 = [v12 countByEnumeratingWithState:v21 objects:v27 count:16];
                if (!v11) {
                  break;
                }
              }
            }
          }

          objc_storeStrong(&location, 0);
        }
      }
      ++v16;
      if (v14 + 1 >= v17)
      {
        uint64_t v16 = 0;
        unint64_t v17 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
        if (!v17) {
          break;
        }
      }
    }
  }

  id v7 = v25;
  objc_storeStrong(&v25, 0);
  objc_storeStrong(v26, 0);

  return v7;
}

- (BOOL)_accessibilityObscuredScreenAllowsView:(id)a3
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)[location[0] _accessibilityAncestorIsKindOf:objc_opt_class()];

  if (v4)
  {
    char v9 = 1;
  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)UISearchDisplayControllerContainerViewAccessibility;
    char v9 = [(UISearchDisplayControllerContainerViewAccessibility *)&v5 _accessibilityObscuredScreenAllowsView:location[0]];
  }
  int v6 = 1;
  objc_storeStrong(location, 0);
  return v9 & 1;
}

@end