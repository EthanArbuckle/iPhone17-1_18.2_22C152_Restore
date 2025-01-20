@interface UITableViewCellContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityClearTableCellChildren;
- (void)_didRemoveSubview:(id)a3;
- (void)didAddSubview:(id)a3;
@end

@implementation UITableViewCellContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewCellContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UIView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"UITableViewCellContentView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_didRemoveSubview:", "v", "@", 0);
  objc_storeStrong(v5, obj);
}

- (void)_accessibilityClearTableCellChildren
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v24 = a1;
  if (a1)
  {
    char v22 = 0;
    objc_opt_class();
    id v9 = (id)[v24 _accessibilityAncestorIsKindOf:objc_opt_class()];
    id v21 = (id)__UIAccessibilityCastAsSafeCategory();

    id v20 = v21;
    objc_storeStrong(&v21, 0);
    id v23 = v20;
    BOOL v19 = 0;
    memset(__b, 0, sizeof(__b));
    id obj = (id)_UIAccessibilityFocusedElements();
    uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
    if (v8)
    {
      uint64_t v4 = *(void *)__b[2];
      uint64_t v5 = 0;
      unint64_t v6 = v8;
      while (1)
      {
        uint64_t v3 = v5;
        if (*(void *)__b[2] != v4) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(__b[1] + 8 * v5);
        v2 = v18;
        uint64_t v11 = MEMORY[0x263EF8330];
        int v12 = -1073741824;
        int v13 = 0;
        v14 = __79__UITableViewCellContentViewAccessibility__accessibilityClearTableCellChildren__block_invoke;
        v15 = &unk_2650AE790;
        id v16 = v23;
        id v1 = (id)[v2 _accessibilityFindAncestor:&v11 startWithSelf:0];
        BOOL v19 = v1 != 0;

        if (v19) {
          int v10 = 2;
        }
        else {
          int v10 = 0;
        }
        objc_storeStrong(&v16, 0);
        if (v10) {
          break;
        }
        ++v5;
        if (v3 + 1 >= v6)
        {
          uint64_t v5 = 0;
          unint64_t v6 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
          if (!v6) {
            break;
          }
        }
      }
    }

    if (!v19) {
      [v23 _accessibilityClearChildren];
    }
    objc_storeStrong(&v23, 0);
  }
}

BOOL __79__UITableViewCellContentViewAccessibility__accessibilityClearTableCellChildren__block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  BOOL v4 = location[0] == a1[4];
  objc_storeStrong(location, 0);
  return v4;
}

- (void)_didRemoveSubview:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewCellContentViewAccessibility;
  [(UITableViewCellContentViewAccessibility *)&v3 _didRemoveSubview:location[0]];
  -[UITableViewCellContentViewAccessibility _accessibilityClearTableCellChildren](v5);
  objc_storeStrong(location, 0);
}

- (void)didAddSubview:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewCellContentViewAccessibility;
  [(UITableViewCellContentViewAccessibility *)&v3 didAddSubview:location[0]];
  -[UITableViewCellContentViewAccessibility _accessibilityClearTableCellChildren](v5);
  objc_storeStrong(location, 0);
}

@end