@interface UISearchBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityDisplayFocusIndicatorForFocusEverywhereView;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_accessibilityUnfocusableViewCanBeFocusedForFocusEverywhere;
- (id)_accessibilityFuzzyHitTestElements;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilitySearchBarMaskView;
- (id)_accessibilitySubviews;
- (id)accessibilityLabel;
- (id)imageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_searchFieldBeginEditing;
- (void)_searchFieldEndEditing;
- (void)layoutSubviews;
@end

@implementation UISearchBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISearchBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  id v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UISearchBar";
  v6 = "@";
  [location[0] validateClass:"q" hasInstanceMethod:"Q" withFullSignature:0];
  v3 = "v";
  [location[0] validateClass:v4 hasInstanceMethod:@"_searchFieldBeginEditing" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_searchFieldEndEditing", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UISearchBarTextFieldAccessibility", @"_accessibilityEditingModeChanged", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_viewForChildViews", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_visualProvider", v6, 0);
  v5 = @"UIView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v4);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_viewControllerForAncestor", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UISearchBarVisualProviderBase", @"searchField", v6, 0);
  objc_storeStrong(v8, v7);
}

- (id)imageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4
{
  v22 = self;
  SEL v21 = a2;
  int64_t v20 = a3;
  location[1] = (id)a4;
  v18.receiver = self;
  v18.super_class = (Class)UISearchBarAccessibility;
  location[0] = [(UISearchBarAccessibility *)&v18 imageForSearchBarIcon:a3 state:a4];
  id v16 = (id)[location[0] accessibilityLabel];
  BOOL v17 = [v16 length] == 0;

  if (v17)
  {
    if (v20)
    {
      int64_t v5 = v20;
      char v4 = 1;
    }
    else
    {
      int64_t v5 = 0;
      char v4 = 0;
    }
    if ((v4 & 1) == 0)
    {
      switch(v5)
      {
        case 0:
          id v8 = location[0];
          id v9 = (id)accessibilityUIKitLocalizedString();
          objc_msgSend(v8, "setAccessibilityLabel:");

          break;
        case 1:
          id v10 = location[0];
          id v11 = (id)accessibilityUIKitLocalizedString();
          objc_msgSend(v10, "setAccessibilityLabel:");

          break;
        case 2:
          id v12 = location[0];
          id v13 = (id)accessibilityUIKitLocalizedString();
          objc_msgSend(v12, "setAccessibilityLabel:");

          break;
        case 3:
          id v14 = location[0];
          id v15 = (id)accessibilityUIKitLocalizedString();
          objc_msgSend(v14, "setAccessibilityLabel:");

          break;
        default:
          JUMPOUT(0);
      }
    }
  }
  id v23 = location[0];
  objc_storeStrong(location, 0);
  v6 = v23;

  return v6;
}

- (id)_accessibilitySearchBarMaskView
{
  id v4 = a1;
  if (a1)
  {
    id location = (id)[v4 safeValueForKey:@"_viewForChildViews"];
    if (location == v4) {
      objc_storeStrong(&location, 0);
    }
    id v5 = location;
    objc_storeStrong(&location, 0);
  }
  else
  {
    id v5 = 0;
  }
  v1 = v5;

  return v1;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)_accessibilityFuzzyHitTestElements
{
  id v4 = (id)[(UISearchBarAccessibility *)self safeValueForKey:@"subviews"];
  id v3 = (id)[v4 reverseObjectEnumerator];
  id v5 = (id)[v3 allObjects];

  return v5;
}

- (id)_accessibilitySubviews
{
  id v11 = self;
  v10[1] = (id)a2;
  v10[0] = 0;
  id location = -[UISearchBarAccessibility _accessibilitySearchBarMaskView](self);
  if (location)
  {
    id v2 = (id)[location _accessibilitySubviews];
    id v3 = v10[0];
    v10[0] = v2;
  }
  else
  {
    v8.receiver = v11;
    v8.super_class = (Class)UISearchBarAccessibility;
    id v4 = [(UISearchBarAccessibility *)&v8 _accessibilitySubviews];
    id v5 = v10[0];
    v10[0] = v4;
  }
  id v7 = v10[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v10, 0);

  return v7;
}

- (void)_searchFieldBeginEditing
{
  id v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)UISearchBarAccessibility;
  [(UISearchBarAccessibility *)&v5 _searchFieldBeginEditing];
  id v2 = (id)[(UISearchBarAccessibility *)v7 safeValueForKey:@"_visualProvider"];
  id v4 = (id)[v2 safeValueForKey:@"searchField"];

  NSClassFromString(&cfstr_Uisearchbartex_0.isa);
  if (objc_opt_isKindOfClass())
  {
    id v3 = v4;
    AXPerformSafeBlock();
    objc_storeStrong(&v3, 0);
  }
  objc_storeStrong(&v4, 0);
}

uint64_t __52__UISearchBarAccessibility__searchFieldBeginEditing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityEditingModeChanged", a1, a1);
}

- (void)_searchFieldEndEditing
{
  id v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)UISearchBarAccessibility;
  [(UISearchBarAccessibility *)&v5 _searchFieldEndEditing];
  id v2 = (id)[(UISearchBarAccessibility *)v7 safeValueForKey:@"_visualProvider"];
  id v4 = (id)[v2 safeValueForKey:@"searchField"];

  NSClassFromString(&cfstr_Uisearchbartex_0.isa);
  if (objc_opt_isKindOfClass())
  {
    id v3 = v4;
    AXPerformSafeBlock();
    objc_storeStrong(&v3, 0);
  }
  objc_storeStrong(&v4, 0);
}

uint64_t __50__UISearchBarAccessibility__searchFieldEndEditing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityEditingModeChanged", a1, a1);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v31 = a3;
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v28 = [(UISearchBarAccessibility *)v30 _accessibilityBoolValueForKey:@"AXInHitTestOverride"] & 1;
  char v21 = 0;
  char v8 = 0;
  if (!v28)
  {
    uint64_t v22 = MEMORY[0x263EF8330];
    int v23 = -1073741824;
    int v24 = 0;
    v25 = __60__UISearchBarAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v26 = &unk_2650AE580;
    v27 = v30;
    char v21 = 1;
    int64_t v20 = (id *)&v27;
    char v8 = ((uint64_t (*)(void))__60__UISearchBarAccessibility__accessibilityHitTest_withEvent___block_invoke)();
  }
  if (v8)
  {
    -[UISearchBarAccessibility _accessibilitySetBoolValue:forKey:](v30, "_accessibilitySetBoolValue:forKey:", 1);
    id v19 = (id)-[UISearchBarAccessibility accessibilityHitTest:withEvent:](v30, "accessibilityHitTest:withEvent:", location[0], v31.x, v31.y);
    [(UISearchBarAccessibility *)v30 _accessibilitySetBoolValue:0 forKey:@"AXInHitTestOverride"];
    id v32 = v19;
    int v18 = 1;
    objc_storeStrong(&v19, 0);
  }
  else
  {
    int v18 = 0;
  }
  if (v21) {
    objc_storeStrong(v20, 0);
  }
  if (!v18)
  {
    v16.receiver = v30;
    v16.super_class = (Class)UISearchBarAccessibility;
    id v17 = [(UISearchBarAccessibility *)&v16 _accessibilityHitTest:location[0] withEvent:v31];
    char v14 = 0;
    char v9 = 0;
    if (!v17
      || (id v6 = v17,
          id v15 = -[UISearchBarAccessibility _accessibilitySearchBarMaskView](v30),
          char v14 = 1,
          char v7 = 0,
          v6 == v15))
    {
      char v7 = 0;
      if ([location[0] _accessibilityAutomationHitTest])
      {
        char v13 = 0;
        objc_opt_class();
        id v12 = (id)__UIAccessibilityCastAsClass();
        id v11 = v12;
        objc_storeStrong(&v12, 0);
        id v10 = v11;
        char v9 = 1;
        char v7 = objc_msgSend(v11, "pointInside:withEvent:", location[0], v31.x, v31.y);
      }
    }
    if (v9) {

    }
    if (v14) {
    if (v7)
    }
      objc_storeStrong(&v17, v30);
    id v32 = v17;
    int v18 = 1;
    objc_storeStrong(&v17, 0);
  }
  objc_storeStrong(location, 0);
  id v4 = v32;

  return v4;
}

BOOL __60__UISearchBarAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  int v18 = (dispatch_once_t *)&MACancelDownloadErrorDomain_block_invoke_onceToken_0;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_31);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  IMP Implementation = 0;
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    id v12 = (id)AXLogCommon();
    char v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      os_log_type_t type = v11;
      char v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      id v4 = v8;
      id v10 = v4;
      id v2 = (objc_class *)objc_opt_class();
      char v7 = NSStringFromClass(v2);
      char v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)MACancelDownloadErrorDomain_block_invoke_BaseImplementation_0;
}

void __60__UISearchBarAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    MACancelDownloadErrorDomain_block_invoke_BaseImplementation_0 = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      char v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      id v3 = v7;
      char v9 = v3;
      id v2 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v2);
      char v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISearchBarAccessibility;
  [(UISearchBarAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (void)layoutSubviews
{
  char v10 = self;
  SEL v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)UISearchBarAccessibility;
  [(UISearchBarAccessibility *)&v8 layoutSubviews];
  char v7 = 0;
  objc_opt_class();
  id v4 = (id)[(UISearchBarAccessibility *)v10 safeValueForKey:@"_viewControllerForAncestor"];
  id v6 = (id)__UIAccessibilityCastAsClass();

  id v5 = v6;
  objc_storeStrong(&v6, 0);
  id v3 = (id)[v5 navigationController];
  id v2 = (id)[v3 navigationBar];
  objc_msgSend(v2, "_accessibility_navigationBarContentsDidChange");
}

- (id)accessibilityLabel
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UISearchBarAccessibility;
  return [(UISearchBarAccessibility *)&v3 accessibilityLabel];
}

- (BOOL)_accessibilityUnfocusableViewCanBeFocusedForFocusEverywhere
{
  return 1;
}

- (BOOL)_accessibilityDisplayFocusIndicatorForFocusEverywhereView
{
  return 1;
}

@end