@interface UINavigationBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAllowOutOfBoundsHitTestAtPoint:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)_accessibilityHasLeftRightButtonCountChanged;
- (BOOL)_accessibilityHasStaticNavBarButtonChanged;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_accessibilityIncludeRoleInGroupNavigationOnly;
- (BOOL)_accessibilityIsGroupedParent;
- (BOOL)accessibilityPerformEscape;
- (BOOL)shouldGroupAccessibilityChildren;
- (NSArray)_accessibilityNavBarElements;
- (double)_accessibilityAllowedGeometryOverlap;
- (id)_accessibilityFauxBackButton;
- (id)_accessibilityFetchCachedNavBarElements;
- (id)_accessibilityLeftButtonElements;
- (id)_accessibilityRightButtonElements;
- (id)_accessibilityRoleDescription;
- (id)_accessibilityStaticBarButtonItem;
- (id)_accessibilityStaticBarButtonItemWithContents:(uint64_t)a1;
- (id)_axGetCachedStaticNavBarButton;
- (id)accessibilityElements;
- (id)accessibilityIdentifier;
- (int64_t)accessibilityContainerType;
- (uint64_t)_accessibilityHasTitleViewChanged;
- (unint64_t)_accessibilityAutomationType;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetFauxBackButton:(uint64_t)a1;
- (void)_accessibilitySetNavBarElements:(id)a3;
- (void)_accessibility_navigationBarContentsDidChange;
- (void)_axSetCachedStaticNavBarButton:(uint64_t)a1;
- (void)addSubview:(id)a3;
- (void)insertSubview:(id)a3 aboveSubview:(id)a4;
- (void)insertSubview:(id)a3 atIndex:(int64_t)a4;
- (void)insertSubview:(id)a3 belowSubview:(id)a4;
- (void)willRemoveSubview:(id)a3;
@end

@implementation UINavigationBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UINavigationBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v10 = location;
  id v9 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UINavigationBar";
  v8 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v5 = @"UINavigationItem";
  v7 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_wantsBackButtonIndicator", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"layoutSubviews", v8, 0);
  v3 = @"_UINavigationBarVisualProviderLegacyIOS";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "{CGPoint=dd}", 0);
  [location[0] validateClass:v3 hasInstanceVariable:@"_backIndicatorView" withType:"UIImageView"];
  [location[0] validateClass:v3 isKindOfClass:@"_UINavigationBarVisualProvider"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_backgroundView", v7, 0);
  [location[0] validateClass:v5 hasProperty:@"backAction" withType:v7];
  v6 = @"_UINavigationBarTitleControl";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"titleLabel", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"titleView", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UISearchBar", @"_cancelButtonPressed", v8, 0);
  objc_storeStrong(v10, v9);
}

- (NSArray)_accessibilityNavBarElements
{
  return (NSArray *)objc_getAssociatedObject(self, &__UINavigationBarAccessibility___accessibilityNavBarElements);
}

- (void)_accessibilitySetNavBarElements:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_accessibilityFauxBackButton
{
  return objc_getAssociatedObject(self, &__UINavigationBarAccessibility___accessibilityFauxBackButton);
}

- (void)_accessibilitySetFauxBackButton:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)_accessibilityAllowOutOfBoundsHitTestAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v17 = a3;
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v14 = 0;
  v13.receiver = v16;
  v13.super_class = (Class)UINavigationBarAccessibility;
  char v14 = -[UINavigationBarAccessibility _accessibilityAllowOutOfBoundsHitTestAtPoint:withEvent:](&v13, sel__accessibilityAllowOutOfBoundsHitTestAtPoint_withEvent_, location[0], v17.x, v17.y);
  if (!v14 && (AXDeviceHasHomeButton() & 1) == 0 && (AXDeviceIsPhone() & 1) != 0)
  {
    char v11 = 0;
    objc_opt_class();
    id v8 = (id)[(UINavigationBarAccessibility *)v16 safeValueForKey:@"_backgroundView"];
    id v10 = (id)__UIAccessibilityCastAsClass();

    id v9 = v10;
    objc_storeStrong(&v10, 0);
    id v12 = v9;
    -[UINavigationBarAccessibility convertPoint:toView:](v16, "convertPoint:toView:", v9, v17.x, v17.y);
    if (v17.y < 0.0 && (objc_msgSend(v12, "pointInside:withEvent:", location[0], v4, v5) & 1) != 0) {
      char v14 = 1;
    }
    objc_storeStrong(&v12, 0);
  }
  char v7 = v14;
  objc_storeStrong(location, 0);
  return v7 & 1;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  BOOL v6 = 1;
  id v2 = (id)[(UINavigationBarAccessibility *)self accessibilityUserDefinedShouldGroupChildren];
  BOOL v5 = v2 == 0;

  if (!v5)
  {
    id v4 = (id)[(UINavigationBarAccessibility *)self accessibilityUserDefinedShouldGroupChildren];
    BOOL v6 = [v4 BOOLValue] & 1;
  }
  return v6;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)_accessibilityIsGroupedParent
{
  char v7 = self;
  SEL v6 = a2;
  id v3 = [(UINavigationBarAccessibility *)self accessibilityElements];
  BOOL v4 = (unint64_t)[v3 count] > 2;

  if (!v4) {
    return 0;
  }
  v5.receiver = v7;
  v5.super_class = (Class)UINavigationBarAccessibility;
  return [(UINavigationBarAccessibility *)&v5 _accessibilityIsGroupedParent];
}

- (BOOL)_accessibilityIncludeRoleInGroupNavigationOnly
{
  return 1;
}

- (id)_accessibilityRoleDescription
{
  return (id)accessibilityUIKitLocalizedString();
}

- (id)accessibilityIdentifier
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  v51 = self;
  v50[1] = (id)a2;
  v49.receiver = self;
  v49.super_class = (Class)UINavigationBarAccessibility;
  v50[0] = [(UINavigationBarAccessibility *)&v49 accessibilityIdentifier];
  id location = (id)AXLogUIA();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v61, (uint64_t)v50[0], (uint64_t)v51);
    _os_log_debug_impl(&dword_2402B7000, (os_log_t)location, type, "NavBar: set identifier %@ %@", v61, 0x16u);
  }
  objc_storeStrong(&location, 0);
  if (v50[0])
  {
    id v52 = v50[0];
    int v46 = 1;
  }
  else
  {
    objc_opt_class();
    id v24 = (id)[(UINavigationBarAccessibility *)v51 topItem];
    id v45 = (id)__UIAccessibilityCastAsClass();

    id v44 = (id)AXLogUIA();
    os_log_type_t v43 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v60, (uint64_t)v45, (uint64_t)v51);
      _os_log_debug_impl(&dword_2402B7000, (os_log_t)v44, v43, "NavBar: top most item %@ %@", v60, 0x16u);
    }
    objc_storeStrong(&v44, 0);
    id v2 = (id)[v45 accessibilityIdentifier];
    id v3 = v50[0];
    v50[0] = v2;

    if ([v50[0] length])
    {
      id v42 = (id)AXLogUIA();
      os_log_type_t v41 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v59, (uint64_t)v50[0], (uint64_t)v51);
        _os_log_debug_impl(&dword_2402B7000, (os_log_t)v42, v41, "NavBar: top most nav item identifier %@ %@", v59, 0x16u);
      }
      objc_storeStrong(&v42, 0);
      id v52 = v50[0];
      int v46 = 1;
    }
    else
    {
      id v4 = (id)[v45 title];
      id v5 = v50[0];
      v50[0] = v4;

      if ([v50[0] length])
      {
        os_log_t oslog = (os_log_t)(id)AXLogUIA();
        os_log_type_t v39 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v58, (uint64_t)v50[0], (uint64_t)v51);
          _os_log_debug_impl(&dword_2402B7000, oslog, v39, "NavBar: top most nav item title %@ %@", v58, 0x16u);
        }
        objc_storeStrong((id *)&oslog, 0);
        id v52 = v50[0];
        int v46 = 1;
      }
      else
      {
        id v23 = (id)[v45 titleView];
        id v6 = (id)[v23 accessibilityLabel];
        id v7 = v50[0];
        v50[0] = v6;

        if ([v50[0] length])
        {
          os_log_t v38 = (os_log_t)(id)AXLogUIA();
          os_log_type_t v37 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v57, (uint64_t)v50[0], (uint64_t)v51);
            _os_log_debug_impl(&dword_2402B7000, v38, v37, "NavBar: top most titleView %@ %@", v57, 0x16u);
          }
          objc_storeStrong((id *)&v38, 0);
          id v52 = v50[0];
          int v46 = 1;
        }
        else
        {
          objc_opt_class();
          id v22 = (id)[(UINavigationBarAccessibility *)v51 delegate];
          id v36 = (id)__UIAccessibilityCastAsClass();

          if (!v36) {
            goto LABEL_42;
          }
          id v35 = (id)[v36 delegate];
          id v20 = (id)[v35 accessibilityIdentifier];
          BOOL v21 = [v20 length] == 0;

          if (v21)
          {
            id v32 = (id)[v36 navigationItem];
            id v18 = (id)[v45 accessibilityIdentifier];
            BOOL v19 = [v18 length] == 0;

            if (v19)
            {
              id obj = (id)[v32 title];
              if (obj)
              {
                os_log_t v28 = (os_log_t)(id)AXLogUIA();
                os_log_type_t v27 = OS_LOG_TYPE_DEBUG;
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                {
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v54, (uint64_t)v32, (uint64_t)obj);
                  _os_log_debug_impl(&dword_2402B7000, v28, v27, "NavBar: using title from navController:item %@ %@", v54, 0x16u);
                }
                objc_storeStrong((id *)&v28, 0);
                objc_storeStrong(v50, obj);
              }
              else
              {
                id v26 = (id)[v36 visibleViewController];
                if (!v26)
                {
                  id v26 = (id)[v36 topViewController];
                }
                id v8 = (id)[v45 accessibilityIdentifier];
                id v9 = v50[0];
                v50[0] = v8;

                if (![v50[0] length])
                {
                  id v10 = (objc_class *)objc_opt_class();
                  v16 = NSStringFromClass(v10);
                  v15 = [(NSString *)v16 componentsSeparatedByString:@"Controller"];
                  id v11 = [(NSArray *)v15 firstObject];
                  id v12 = v50[0];
                  v50[0] = v11;
                }
                os_log_t v25 = (os_log_t)(id)AXLogUIA();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  __os_log_helper_16_2_2_8_64_8_64((uint64_t)v53, (uint64_t)v26, (uint64_t)v50[0]);
                  _os_log_debug_impl(&dword_2402B7000, v25, OS_LOG_TYPE_DEBUG, "NavBar: viewController %@ %@", v53, 0x16u);
                }
                objc_storeStrong((id *)&v25, 0);
                objc_storeStrong(&v26, 0);
              }
              objc_storeStrong(&obj, 0);
              int v46 = 0;
            }
            else
            {
              os_log_t v31 = (os_log_t)(id)AXLogUIA();
              os_log_type_t v30 = OS_LOG_TYPE_DEBUG;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                id v17 = (id)[v45 accessibilityIdentifier];
                __os_log_helper_16_2_2_8_64_8_64((uint64_t)v55, (uint64_t)v32, (uint64_t)v17);
                _os_log_debug_impl(&dword_2402B7000, v31, v30, "NavBar: using identifier from navController:item %@ %@", v55, 0x16u);
              }
              objc_storeStrong((id *)&v31, 0);
              id v52 = (id)[v45 accessibilityIdentifier];
              int v46 = 1;
            }
            objc_storeStrong(&v32, 0);
          }
          else
          {
            os_log_t v34 = (os_log_t)(id)AXLogUIA();
            os_log_type_t v33 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v56, (uint64_t)v35, (uint64_t)v51);
              _os_log_debug_impl(&dword_2402B7000, v34, v33, "NavBar: navDelegate %@ %@", v56, 0x16u);
            }
            objc_storeStrong((id *)&v34, 0);
            id v52 = (id)[v35 accessibilityIdentifier];
            int v46 = 1;
          }
          objc_storeStrong(&v35, 0);
          if (!v46)
          {
LABEL_42:
            id v52 = v50[0];
            int v46 = 1;
          }
          objc_storeStrong(&v36, 0);
        }
      }
    }
    objc_storeStrong(&v45, 0);
  }
  objc_storeStrong(v50, 0);
  objc_super v13 = v52;

  return v13;
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v53 = self;
  v52[1] = (id)a2;
  v52[0] = self;
  id v51 = (id)objc_msgSend(v52[0], "_accessibility_contentsOfNavigationBar");
  id v28 = (id)[v51 topItem];
  id v50 = (id)[v28 searchController];

  if ([v50 isActive])
  {
    uint64_t v44 = MEMORY[0x263EF8330];
    int v45 = -1073741824;
    int v46 = 0;
    v47 = __58__UINavigationBarAccessibility_accessibilityPerformEscape__block_invoke;
    v48 = &unk_2650ADF18;
    id v49 = v50;
    AXPerformSafeBlock();
    char v54 = 1;
    int v43 = 1;
    objc_storeStrong(&v49, 0);
  }
  else
  {
    id v26 = (id)[v51 viewsRepresentingBackButton];
    char v41 = 0;
    char v39 = 0;
    char v37 = 0;
    char v35 = 0;
    char v27 = 1;
    if (![v26 count])
    {
      id v42 = (id)[v51 backBarButtonItem];
      char v41 = 1;
      char v25 = 0;
      if (v42)
      {
        id v40 = (id)[v51 backBarButtonItem];
        char v39 = 1;
        char v25 = 0;
        if (([v40 isHidden] & 1) == 0)
        {
          id v38 = (id)[v52[0] topItem];
          char v37 = 1;
          LOBYTE(v24) = 1;
          if (v38)
          {
            id v36 = (id)[v52[0] topItem];
            char v35 = 1;
            int v24 = [v36 hidesBackButton] ^ 1;
          }
          char v25 = v24;
        }
      }
      char v27 = v25;
    }
    if (v35) {

    }
    if (v37) {
    if (v39)
    }

    if (v41) {
    if (v27)
    }
    {
      objc_msgSend(v52[0], "_accessibility_triggerBackButton");
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
      char v54 = 1;
      int v43 = 1;
    }
    else
    {
      id v22 = (id)[v51 cancelBarButtonItems];
      BOOL v23 = [v22 count] == 0;

      if (v23)
      {
        memset(__b, 0, sizeof(__b));
        id v17 = (id)[v51 topItem];
        id obj = (id)[v17 leftBarButtonItems];

        uint64_t v19 = [obj countByEnumeratingWithState:__b objects:v56 count:16];
        if (v19)
        {
          uint64_t v14 = *(void *)__b[2];
          uint64_t v15 = 0;
          unint64_t v16 = v19;
          while (1)
          {
            uint64_t v13 = v15;
            if (*(void *)__b[2] != v14) {
              objc_enumerationMutation(obj);
            }
            id v34 = *(id *)(__b[1] + 8 * v15);
            id v10 = (id)[v34 view];
            uint64_t v12 = [v10 accessibilityTraits];
            uint64_t v11 = *MEMORY[0x263F81370];

            if ((v12 & v11) != 0) {
              break;
            }
            ++v15;
            if (v13 + 1 >= v16)
            {
              uint64_t v15 = 0;
              unint64_t v16 = [obj countByEnumeratingWithState:__b objects:v56 count:16];
              if (!v16) {
                goto LABEL_30;
              }
            }
          }
          objc_msgSend(v52[0], "_accessibility_triggerBarButtonItem:", v34);
          char v54 = 1;
          int v43 = 1;
        }
        else
        {
LABEL_30:
          int v43 = 0;
        }

        if (!v43)
        {
          id v32 = -[UINavigationBarAccessibility _accessibilityStaticBarButtonItemWithContents:]((uint64_t)v53, v51);
          uint64_t v2 = [v32 accessibilityTraits];
          if ((v2 & *MEMORY[0x263F81370]) != 0)
          {
            objc_msgSend(v52[0], "_accessibility_triggerBarButtonItem:", v32);
            char v54 = 1;
            int v43 = 1;
          }
          else
          {
            memset(v30, 0, sizeof(v30));
            id v8 = (id)[v52[0] items];
            uint64_t v9 = [v8 countByEnumeratingWithState:v30 objects:v55 count:16];
            if (v9)
            {
              uint64_t v5 = *(void *)v30[2];
              uint64_t v6 = 0;
              unint64_t v7 = v9;
              while (1)
              {
                uint64_t v4 = v6;
                if (*(void *)v30[2] != v5) {
                  objc_enumerationMutation(v8);
                }
                id v31 = *(id *)(v30[1] + 8 * v6);
                if ([v31 accessibilityPerformEscape]) {
                  break;
                }
                ++v6;
                if (v4 + 1 >= v7)
                {
                  uint64_t v6 = 0;
                  unint64_t v7 = [v8 countByEnumeratingWithState:v30 objects:v55 count:16];
                  if (!v7) {
                    goto LABEL_42;
                  }
                }
              }
              char v54 = 1;
              int v43 = 1;
            }
            else
            {
LABEL_42:
              int v43 = 0;
            }

            if (!v43)
            {
              v29.receiver = v53;
              v29.super_class = (Class)UINavigationBarAccessibility;
              char v54 = [(UINavigationBarAccessibility *)&v29 accessibilityPerformEscape];
              int v43 = 1;
            }
          }
          objc_storeStrong(&v32, 0);
        }
      }
      else
      {
        id v21 = (id)[v51 cancelBarButtonItems];
        id v20 = (id)[v21 firstObject];
        objc_msgSend(v52[0], "_accessibility_triggerBarButtonItem:");

        char v54 = 1;
        int v43 = 1;
      }
    }
  }
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(v52, 0);
  return v54 & 1;
}

void __58__UINavigationBarAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) searchBar];
  [v1 _cancelButtonPressed];
}

- (id)_accessibilityStaticBarButtonItemWithContents:(uint64_t)a1
{
  uint64_t v7 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v7)
  {
    id v4 = (id)[location staticBarButtonItem];
    if ([v4 isHidden]) {
      objc_storeStrong(&v4, 0);
    }
    id v8 = v4;
    int v5 = 1;
    objc_storeStrong(&v4, 0);
  }
  else
  {
    id v8 = 0;
    int v5 = 1;
  }
  objc_storeStrong(&location, 0);
  uint64_t v2 = v8;

  return v2;
}

- (id)accessibilityElements
{
  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = -[UINavigationBarAccessibility _accessibilityFetchCachedNavBarElements](self);
  id v2 = (id)[v6[0] axFilterObjectsUsingBlock:&__block_literal_global_26];
  id v3 = v6[0];
  v6[0] = v2;

  id v5 = (id)[v6[0] sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];
  objc_storeStrong(v6, 0);

  return v5;
}

- (id)_accessibilityFetchCachedNavBarElements
{
  uint64_t v189 = *MEMORY[0x263EF8340];
  id val = a1;
  if (a1)
  {
    v176.receiver = val;
    v176.super_class = (Class)UINavigationBarAccessibility;
    id v177 = objc_msgSendSuper2(&v176, sel_accessibilityElements);
    if (v177)
    {
      id v179 = v177;
      int v175 = 1;
    }
    else
    {
      if (-[UINavigationBarAccessibility _accessibilityHasLeftRightButtonCountChanged](val)
        || (-[UINavigationBarAccessibility _accessibilityHasTitleViewChanged](val) & 1) != 0
        || -[UINavigationBarAccessibility _accessibilityHasStaticNavBarButtonChanged](val))
      {
        os_log_t oslog = (os_log_t)(id)AXLogUIA();
        os_log_type_t type = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v188, (uint64_t)val);
          _os_log_impl(&dword_2402B7000, oslog, type, "Left/Right button count change for %@, resetting", v188, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        [val _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
      }
      id v172 = (id)[val _accessibilityValueForKey:*MEMORY[0x263F81490]];
      if ([v172 count]
        && [v172 indexOfObjectPassingTest:&__block_literal_global_413] == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v179 = v172;
        int v175 = 1;
      }
      else
      {
        [val _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
        id v1 = (id)[MEMORY[0x263EFF980] array];
        id v2 = v172;
        id v172 = v1;

        id v171 = val;
        id v170 = (id)objc_msgSend(v171, "_accessibility_contentsOfNavigationBar");
        id v169 = (id)[v170 viewsRepresentingBackButton];
        BOOL v168 = ([val _accessibilityViewIsVisible] & 1) != 0;
        char v167 = 0;
        id v88 = (id)[v170 topItem];
        id v87 = (id)[v88 searchController];
        char v165 = 0;
        char v163 = 0;
        char v86 = 0;
        if ([v87 isActive])
        {
          id v166 = (id)[v170 topItem];
          char v165 = 1;
          id v164 = (id)[v166 searchController];
          char v163 = 1;
          char v86 = [v164 hidesNavigationBarDuringPresentation];
        }
        char v167 = v86 & 1;
        if (v163) {

        }
        if (v165) {
        if ((v167 & 1) == 0)
        }
        {
          if ([v169 indexOfObjectPassingTest:&__block_literal_global_416] != 0x7FFFFFFFFFFFFFFFLL)
          {
            char v160 = 0;
            objc_opt_class();
            id v85 = (id)[v170 topItem];
            id v84 = (id)[v85 safeValueForKey:@"backAction"];
            id v159 = (id)__UIAccessibilityCastAsClass();

            id v158 = v159;
            objc_storeStrong(&v159, 0);
            id v161 = v158;
            id v83 = (id)[v170 backBarButtonItem];
            id v82 = (id)[v83 _accessibilityAXAttributedLabel];
            id v157 = trimWhitespaceToNil(v82);

            char v155 = 0;
            char v153 = 0;
            char v151 = 0;
            if (v157)
            {
              objc_storeStrong(&v157, v157);
            }
            else
            {
              id v156 = (id)[v170 backItem];
              char v155 = 1;
              id v154 = (id)[v156 backButtonTitle];
              char v153 = 1;
              id v152 = trimWhitespaceToNil(v154);
              char v151 = 1;
              objc_storeStrong(&v157, v152);
            }
            if (v151) {

            }
            if (v153) {
            if (v155)
            }

            char v149 = 0;
            char v147 = 0;
            char v145 = 0;
            if (v157)
            {
              objc_storeStrong(&v157, v157);
            }
            else
            {
              id v150 = (id)[v170 backItem];
              char v149 = 1;
              id v148 = (id)[v150 _accessibilityAXAttributedLabel];
              char v147 = 1;
              id v146 = trimWhitespaceToNil(v148);
              char v145 = 1;
              objc_storeStrong(&v157, v146);
            }
            if (v145) {

            }
            if (v147) {
            if (v149)
            }

            char v143 = 0;
            char v141 = 0;
            char v139 = 0;
            if (v157)
            {
              objc_storeStrong(&v157, v157);
            }
            else
            {
              id v144 = (id)[v170 backItem];
              char v143 = 1;
              id v142 = (id)[v144 title];
              char v141 = 1;
              id v140 = trimWhitespaceToNil(v142);
              char v139 = 1;
              objc_storeStrong(&v157, v140);
            }
            if (v139) {

            }
            if (v141) {
            if (v143)
            }

            memset(__b, 0, sizeof(__b));
            id v81 = (id)objc_msgSend(v171, "_accessibility_contentsOfNavigationBar");
            id v80 = (id)[v81 viewsRepresentingBackButton];

            uint64_t v79 = [v80 countByEnumeratingWithState:__b objects:v187 count:16];
            if (v79)
            {
              uint64_t v76 = *(void *)__b[2];
              uint64_t v77 = 0;
              unint64_t v78 = v79;
              while (1)
              {
                uint64_t v75 = v77;
                if (*(void *)__b[2] != v76) {
                  objc_enumerationMutation(v80);
                }
                id v138 = *(id *)(__b[1] + 8 * v77);
                char v135 = 0;
                char v133 = 0;
                if (v157)
                {
                  objc_storeStrong(&v157, v157);
                }
                else
                {
                  id v136 = (id)[v138 _accessibilityAXAttributedLabel];
                  char v135 = 1;
                  id v134 = trimWhitespaceToNil(v136);
                  char v133 = 1;
                  objc_storeStrong(&v157, v134);
                }
                if (v133) {

                }
                if (v135) {
                ++v77;
                }
                if (v75 + 1 >= v78)
                {
                  uint64_t v77 = 0;
                  unint64_t v78 = [v80 countByEnumeratingWithState:__b objects:v187 count:16];
                  if (!v78) {
                    break;
                  }
                }
              }
            }

            char v131 = 0;
            char v129 = 0;
            if (v157)
            {
              objc_storeStrong(&v157, v157);
            }
            else
            {
              id v132 = (id)[v161 accessibilityLabel];
              char v131 = 1;
              id v130 = trimWhitespaceToNil(v132);
              char v129 = 1;
              objc_storeStrong(&v157, v130);
            }
            if (v129) {

            }
            if (v131) {
            char v127 = 0;
            }
            if (v157)
            {
              objc_storeStrong(&v157, v157);
            }
            else
            {
              id v128 = accessibilityLocalizedString(@"uibutton.navbar.back.button.title");
              char v127 = 1;
              objc_storeStrong(&v157, v128);
            }
            if (v127) {

            }
            id v74 = (id)[val _accessibilityFauxBackButton];
            char v124 = 0;
            if (v74)
            {
              id v3 = v74;
            }
            else
            {
              v73 = [UIAccessibilityBackButtonElement alloc];
              id v125 = [(UIAccessibilityBackButtonElement *)v73 initWithAccessibilityContainer:v171];
              char v124 = 1;
              id v3 = v125;
            }
            id v126 = v3;
            if (v124) {

            }
            [v126 setAccessibilityContainer:val];
            -[UINavigationBarAccessibility _accessibilitySetFauxBackButton:]((uint64_t)val, v126);
            [v126 setAssociatedViews:v169];
            objc_initWeak(&from, val);
            id v72 = v126;
            uint64_t v117 = MEMORY[0x263EF8330];
            int v118 = -1073741824;
            int v119 = 0;
            v120 = __71__UINavigationBarAccessibility__accessibilityFetchCachedNavBarElements__block_invoke_3;
            v121 = &unk_2650AE230;
            objc_copyWeak(&v122, &from);
            [v72 _setAccessibilityFrameBlock:&v117];
            [v126 _accessibilitySetSortPriority:1];
            [v126 setAccessibilityLabel:v157];
            id v71 = (id)[v161 accessibilityIdentifier];
            objc_msgSend(v126, "setAccessibilityIdentifier:");

            id v70 = (id)[v170 backBarButtonItem];
            id v69 = (id)[v70 accessibilityUserInputLabels];
            objc_msgSend(v126, "setAccessibilityUserInputLabels:");

            [v126 setAccessibilityTraits:*MEMORY[0x263F1CEE8] | *MEMORY[0x263F81370]];
            id v68 = (id)[v170 backItem];
            id v67 = (id)[v68 accessibilityLanguage];
            objc_msgSend(v126, "setAccessibilityLanguage:");

            [v172 addObject:v126];
            objc_destroyWeak(&v122);
            objc_destroyWeak(&from);
            objc_storeStrong(&v126, 0);
            objc_storeStrong(&v157, 0);
            objc_storeStrong(&v161, 0);
          }
          id v116 = -[UINavigationBarAccessibility _accessibilityRightButtonElements](val);
          id v115 = -[UINavigationBarAccessibility _accessibilityLeftButtonElements](val);
          memset(v113, 0, sizeof(v113));
          v66 = (void *)MEMORY[0x263EFF8C0];
          id v65 = (id)[v170 largeTitleView];
          id v64 = (id)[v170 titleView];
          id v63 = (id)objc_msgSend(v66, "axArrayByIgnoringNilElementsWithCount:", 2, v65, v64);

          uint64_t v62 = [v63 countByEnumeratingWithState:v113 objects:v186 count:16];
          if (v62)
          {
            uint64_t v59 = *(void *)v113[2];
            uint64_t v60 = 0;
            unint64_t v61 = v62;
            while (1)
            {
              uint64_t v58 = v60;
              if (*(void *)v113[2] != v59) {
                objc_enumerationMutation(v63);
              }
              id v114 = *(id *)(v113[1] + 8 * v60);
              id v112 = v114;
              NSClassFromString(&cfstr_Uinavigationba_8.isa);
              if (objc_opt_isKindOfClass())
              {
                id v4 = (id)[v114 safeValueForKey:@"titleLabel"];
                BOOL v57 = v4 == 0;

                if (v57)
                {
                  id v5 = (id)[v114 safeValueForKey:@"titleView"];
                }
                else
                {
                  [v114 _accessibilityLoadAccessibilityInformation];
                  id v5 = (id)[v114 safeValueForKey:@"titleLabel"];
                }
                id v6 = v112;
                id v112 = v5;
              }
              if ([v112 _accessibilityViewIsVisible])
              {
                id v111 = (id)objc_opt_new();
                -[_UIAccessibilityNavigationViewInfo setNavigationBar:]((id *)v111, val);
                id v56 = (id)[v170 topItem];
                -[_UIAccessibilityNavigationViewInfo setNavigationItem:]((id *)v111, v56);

                objc_opt_class();
                id v55 = (id)__UIAccessibilityCastAsSafeCategory();
                [v55 _accessibilitySetNavigationViewInfo:v111];

                [v172 addObject:v112];
                [val _accessibilitySetRetainedValue:v112 forKey:@"AXTitleView"];
                objc_storeStrong(&v111, 0);
                int v175 = 0;
              }
              else
              {
                int v175 = 5;
              }
              objc_storeStrong(&v112, 0);
              ++v60;
              if (v58 + 1 >= v61)
              {
                uint64_t v60 = 0;
                unint64_t v61 = [v63 countByEnumeratingWithState:v113 objects:v186 count:16];
                if (!v61) {
                  break;
                }
              }
            }
          }

          id v54 = val;
          id v53 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v115, "count"));
          objc_msgSend(v54, "_accessibilitySetRetainedValue:forKey:");

          id v52 = val;
          id v51 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v116, "count"));
          objc_msgSend(v52, "_accessibilitySetRetainedValue:forKey:");

          id v110 = (id)[v170 cancelBarButtonItems];
          id v109 = (id)[v170 otherBarButtonItems];
          id v108 = -[UINavigationBarAccessibility _accessibilityStaticBarButtonItemWithContents:]((uint64_t)val, v170);
          id v107 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v108);
          id v106 = (id)[MEMORY[0x263EFF9C0] set];
          memset(v104, 0, sizeof(v104));
          id v49 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 5, v116, v115, v110, v109, v107);
          uint64_t v50 = [v49 countByEnumeratingWithState:v104 objects:v185 count:16];
          if (v50)
          {
            uint64_t v46 = *(void *)v104[2];
            uint64_t v47 = 0;
            unint64_t v48 = v50;
            while (1)
            {
              uint64_t v45 = v47;
              if (*(void *)v104[2] != v46) {
                objc_enumerationMutation(v49);
              }
              id v105 = *(id *)(v104[1] + 8 * v47);
              memset(v102, 0, sizeof(v102));
              id v43 = v105;
              uint64_t v44 = [v43 countByEnumeratingWithState:v102 objects:v184 count:16];
              if (v44)
              {
                uint64_t v40 = *(void *)v102[2];
                uint64_t v41 = 0;
                unint64_t v42 = v44;
                while (1)
                {
                  uint64_t v39 = v41;
                  if (*(void *)v102[2] != v40) {
                    objc_enumerationMutation(v43);
                  }
                  v103 = *(void **)(v102[1] + 8 * v41);
                  id v101 = (id)[v103 view];
                  char v38 = [v101 isAccessibilityElement];
                  char v98 = 0;
                  char v96 = 0;
                  if (v38 & 1) != 0 || ([v101 _accessibilityHasOrderedChildren])
                  {
                    id v183 = v101;
                    id v99 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v183 count:1];
                    char v98 = 1;
                    id v7 = v99;
                  }
                  else
                  {
                    id v97 = (id)[v101 _accessibleSubviews:1];
                    char v96 = 1;
                    id v7 = v97;
                  }
                  id v100 = v7;
                  if (v96) {

                  }
                  if (v98) {
                  if (v101
                  }
                    && ![v100 count]
                    && AXDoesRequestingClientDeserveAutomation())
                  {
                    id v182 = v101;
                    id v8 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v182 count:1];
                    id v9 = v100;
                    id v100 = v8;
                  }
                  if (![v100 count] && (objc_msgSend(v106, "containsObject:", v103) & 1) == 0)
                  {
                    if ([v116 containsObject:v103])
                    {
                      id v37 = val;
                      id v36 = (id)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(val, "_accessibilityIntegerValueForKey:", @"AXRightCount")- 1);
                      objc_msgSend(v37, "_accessibilitySetRetainedValue:forKey:");
                    }
                    else if ([v115 containsObject:v103])
                    {
                      id v35 = val;
                      id v34 = (id)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(val, "_accessibilityIntegerValueForKey:", @"AXLeftCount")- 1);
                      objc_msgSend(v35, "_accessibilitySetRetainedValue:forKey:");
                    }
                    [v106 addObject:v103];
                  }
                  memset(v94, 0, sizeof(v94));
                  id v32 = v100;
                  uint64_t v33 = [v32 countByEnumeratingWithState:v94 objects:v181 count:16];
                  if (v33)
                  {
                    uint64_t v29 = *(void *)v94[2];
                    uint64_t v30 = 0;
                    unint64_t v31 = v33;
                    while (1)
                    {
                      uint64_t v28 = v30;
                      if (*(void *)v94[2] != v29) {
                        objc_enumerationMutation(v32);
                      }
                      uint64_t v95 = *(void *)(v94[1] + 8 * v30);
                      if (([v172 containsObject:v95] & 1) == 0)
                      {
                        id v10 = (id)[v103 customView];
                        BOOL v27 = v10 != 0;

                        if (!v27)
                        {
                          id v93 = (id)objc_opt_new();
                          -[_UIAccessibilityNavigationViewInfo setBarButtonItem:]((id *)v93, v103);
                          id v26 = (id)[v170 topItem];
                          -[_UIAccessibilityNavigationViewInfo setNavigationItem:]((id *)v93, v26);

                          -[_UIAccessibilityNavigationViewInfo setIsCancelItem:]((uint64_t)v93, v105 == v110);
                          -[_UIAccessibilityNavigationViewInfo setNavigationBar:]((id *)v93, val);
                          char v25 = [v116 containsObject:v103];
                          -[_UIAccessibilityNavigationViewInfo setIsRightItem:]((uint64_t)v93, v25 & 1);
                          objc_opt_class();
                          id v24 = (id)__UIAccessibilityCastAsSafeCategory();
                          [v24 _accessibilitySetNavigationViewInfo:v93];

                          objc_storeStrong(&v93, 0);
                        }
                        [v172 addObject:v95];
                      }
                      ++v30;
                      if (v28 + 1 >= v31)
                      {
                        uint64_t v30 = 0;
                        unint64_t v31 = [v32 countByEnumeratingWithState:v94 objects:v181 count:16];
                        if (!v31) {
                          break;
                        }
                      }
                    }
                  }

                  objc_storeStrong(&v100, 0);
                  objc_storeStrong(&v101, 0);
                  ++v41;
                  if (v39 + 1 >= v42)
                  {
                    uint64_t v41 = 0;
                    unint64_t v42 = [v43 countByEnumeratingWithState:v102 objects:v184 count:16];
                    if (!v42) {
                      break;
                    }
                  }
                }
              }

              ++v47;
              if (v45 + 1 >= v48)
              {
                uint64_t v47 = 0;
                unint64_t v48 = [v49 countByEnumeratingWithState:v104 objects:v185 count:16];
                if (!v48) {
                  break;
                }
              }
            }
          }

          id v23 = val;
          id v22 = (id)[v108 view];
          -[UINavigationBarAccessibility _axSetCachedStaticNavBarButton:]((uint64_t)v23, v22);

          objc_storeStrong(&v106, 0);
          objc_storeStrong(&v107, 0);
          objc_storeStrong(&v108, 0);
          objc_storeStrong(&v109, 0);
          objc_storeStrong(&v110, 0);
          objc_storeStrong(&v115, 0);
          objc_storeStrong(&v116, 0);
        }
        memset(v91, 0, sizeof(v91));
        id v20 = (id)[val _accessibleSubviews:1];
        uint64_t v21 = [v20 countByEnumeratingWithState:v91 objects:v180 count:16];
        if (v21)
        {
          uint64_t v17 = *(void *)v91[2];
          uint64_t v18 = 0;
          unint64_t v19 = v21;
          while (1)
          {
            uint64_t v16 = v18;
            if (*(void *)v91[2] != v17) {
              objc_enumerationMutation(v20);
            }
            id v92 = *(id *)(v91[1] + 8 * v18);
            id v90 = 0;
            id v89 = v92;
            while (1)
            {
              BOOL v15 = 0;
              if (v89 != val) {
                BOOL v15 = v89 != 0;
              }
              if (!v15) {
                break;
              }
              if (([v172 containsObject:v89] & 1) != 0
                || ([v169 containsObject:v89] & 1) != 0)
              {
                objc_storeStrong(&v90, v89);
                break;
              }
              id v11 = (id)[v89 accessibilityContainer];
              id v12 = v89;
              id v89 = v11;
            }
            if (!v90) {
              [v172 addObject:v92];
            }
            objc_storeStrong(&v89, 0);
            objc_storeStrong(&v90, 0);
            ++v18;
            if (v16 + 1 >= v19)
            {
              uint64_t v18 = 0;
              unint64_t v19 = [v20 countByEnumeratingWithState:v91 objects:v180 count:16];
              if (!v19) {
                break;
              }
            }
          }
        }

        [val _accessibilitySortElementsUsingGeometry:v172];
        if (v168)
        {
          [val _accessibilitySetNavBarElements:v172];
          [val _accessibilitySetRetainedValue:v172 forKey:*MEMORY[0x263F81490]];
        }
        id v179 = v172;
        int v175 = 1;
        objc_storeStrong(&v169, 0);
        objc_storeStrong(&v170, 0);
        objc_storeStrong(&v171, 0);
      }
      objc_storeStrong(&v172, 0);
    }
    objc_storeStrong(&v177, 0);
  }
  else
  {
    id v179 = 0;
  }
  uint64_t v13 = v179;

  return v13;
}

uint64_t __53__UINavigationBarAccessibility_accessibilityElements__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [location[0] _accessibilityViewIsVisible] & 1;
  }
  else {
    char v4 = 1;
  }
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (double)_accessibilityAllowedGeometryOverlap
{
  return 20.0;
}

- (BOOL)_accessibilityHasLeftRightButtonCountChanged
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v24 = a1;
  if (a1)
  {
    uint64_t v23 = [v24 _accessibilityIntegerValueForKey:@"AXLeftCount"];
    uint64_t v22 = [v24 _accessibilityIntegerValueForKey:@"AXRightCount"];
    id v21 = -[UINavigationBarAccessibility _accessibilityLeftButtonElements](v24);
    id location = -[UINavigationBarAccessibility _accessibilityRightButtonElements](v24);
    uint64_t v19 = [v21 count];
    uint64_t v18 = [location count];
    memset(__b, 0, sizeof(__b));
    id v9 = (void *)MEMORY[0x263EFF8C0];
    id v11 = (id)[v21 allObjects];
    id v10 = (id)[location allObjects];
    id obj = (id)objc_msgSend(v9, "axArrayWithPossiblyNilArrays:", 2, v11, v10);

    uint64_t v13 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
    if (v13)
    {
      uint64_t v6 = *(void *)__b[2];
      uint64_t v7 = 0;
      unint64_t v8 = v13;
      while (1)
      {
        uint64_t v5 = v7;
        if (*(void *)__b[2] != v6) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(id *)(__b[1] + 8 * v7);
        id v3 = (id)[v17 view];
        char v14 = 0;
        BOOL v4 = 0;
        if (!v3)
        {
          id v15 = (id)[v17 customView];
          char v14 = 1;
          BOOL v4 = v15 == 0;
        }
        if (v14) {

        }
        if (v4)
        {
          if ([location containsObject:v17])
          {
            --v18;
          }
          else if ([v21 containsObject:v17])
          {
            --v19;
          }
        }
        ++v7;
        if (v5 + 1 >= v8)
        {
          uint64_t v7 = 0;
          unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
          if (!v8) {
            break;
          }
        }
      }
    }

    BOOL v2 = 1;
    if (v23 == v19) {
      BOOL v2 = v22 != v18;
    }
    BOOL v25 = v2;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v21, 0);
  }
  else
  {
    return 0;
  }
  return v25;
}

- (id)_accessibilityLeftButtonElements
{
  id v12 = a1;
  if (a1)
  {
    id v11 = v12;
    id v10 = (id)objc_msgSend(v11, "_accessibility_contentsOfNavigationBar");
    id v9 = (id)[MEMORY[0x263EFF9C0] set];
    id v3 = v9;
    id v5 = (id)[v10 topItem];
    id v4 = (id)[v5 leftBarButtonItem];
    objc_msgSend(v3, "axSafelyAddObject:");

    id v6 = v9;
    id v8 = (id)[v10 topItem];
    id v7 = (id)[v8 leftBarButtonItems];
    objc_msgSend(v6, "axSafelyAddObjectsFromArray:");

    id v13 = v9;
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
  }
  else
  {
    id v13 = 0;
  }
  id v1 = v13;

  return v1;
}

- (id)_accessibilityRightButtonElements
{
  id v12 = a1;
  if (a1)
  {
    id v11 = v12;
    id v10 = (id)objc_msgSend(v11, "_accessibility_contentsOfNavigationBar");
    id v9 = (id)[MEMORY[0x263EFF9C0] set];
    id v3 = v9;
    id v5 = (id)[v10 topItem];
    id v4 = (id)[v5 rightBarButtonItem];
    objc_msgSend(v3, "axSafelyAddObject:");

    id v6 = v9;
    id v8 = (id)[v10 topItem];
    id v7 = (id)[v8 rightBarButtonItems];
    objc_msgSend(v6, "axSafelyAddObjectsFromArray:");

    id v13 = v9;
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
  }
  else
  {
    id v13 = 0;
  }
  id v1 = v13;

  return v1;
}

- (uint64_t)_accessibilityHasTitleViewChanged
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v19 = a1;
  if (a1)
  {
    BOOL v18 = 0;
    id v17 = v19;
    id v16 = (id)objc_msgSend(v17, "_accessibility_contentsOfNavigationBar");
    id v15 = (id)[v19 _accessibilityValueForKey:@"AXTitleView"];
    id v8 = (void *)MEMORY[0x263EFF8C0];
    id v10 = (id)[v16 largeTitleView];
    id v9 = (id)[v16 titleView];
    id location = (id)objc_msgSend(v8, "axArrayByIgnoringNilElementsWithCount:", 2, v10, v9);

    if (!v15 || [location count])
    {
      memset(__b, 0, sizeof(__b));
      id obj = location;
      uint64_t v7 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
      if (v7)
      {
        uint64_t v3 = *(void *)__b[2];
        uint64_t v4 = 0;
        unint64_t v5 = v7;
        while (1)
        {
          uint64_t v2 = v4;
          if (*(void *)__b[2] != v3) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(id *)(__b[1] + 8 * v4);
          if ([v12 _accessibilityViewIsVisible]) {
            BOOL v18 = v12 != v15;
          }
          ++v4;
          if (v2 + 1 >= v5)
          {
            uint64_t v4 = 0;
            unint64_t v5 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
            if (!v5) {
              break;
            }
          }
        }
      }

      char v20 = v18;
      int v13 = 1;
    }
    else
    {
      char v20 = 1;
      int v13 = 1;
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
  }
  else
  {
    char v20 = 0;
  }
  return v20 & 1;
}

- (id)_axGetCachedStaticNavBarButton
{
  if (a1) {
    id v2 = (id)__UIAccessibilityGetAssociatedNonRetainedObject();
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_axSetCachedStaticNavBarButton:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedNonRetainedObject();
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)_accessibilityHasStaticNavBarButtonChanged
{
  if (a1)
  {
    id v4 = -[UINavigationBarAccessibility _axGetCachedStaticNavBarButton]((uint64_t)a1);
    id v3 = -[UINavigationBarAccessibility _accessibilityStaticBarButtonItem](a1);
    id v1 = (id)[v3 view];
    BOOL v6 = v4 != v1;
  }
  else
  {
    return 0;
  }
  return v6;
}

- (id)_accessibilityStaticBarButtonItem
{
  id v5 = a1;
  if (a1)
  {
    id v4 = v5;
    id v3 = (id)objc_msgSend(v4, "_accessibility_contentsOfNavigationBar");
    id v6 = -[UINavigationBarAccessibility _accessibilityStaticBarButtonItemWithContents:]((uint64_t)v5, v3);
    objc_storeStrong(&v3, 0);
    objc_storeStrong(&v4, 0);
  }
  else
  {
    id v6 = 0;
  }
  id v1 = v6;

  return v1;
}

- (unint64_t)_accessibilityAutomationType
{
  return 21;
}

uint64_t __71__UINavigationBarAccessibility__accessibilityFetchCachedNavBarElements__block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v4 = (id)[location[0] _accessibilityWindow];
  BOOL v7 = v4 != 0;

  if (v7)
  {
    char v9 = 0;
  }
  else
  {
    *a4 = 1;
    char v9 = 1;
  }
  objc_storeStrong(location, 0);
  return v9 & 1;
}

uint64_t __71__UINavigationBarAccessibility__accessibilityFetchCachedNavBarElements__block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v3 = [location[0] _accessibilityViewIsVisible];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

CGFloat __71__UINavigationBarAccessibility__accessibilityFetchCachedNavBarElements__block_invoke_3(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v30 = a1;
  uint64_t v29 = a1;
  memset(&v31, 0, sizeof(v31));
  CGRect v31 = *(CGRect *)*(void *)&MEMORY[0x263F001A0];
  memset(__b, 0, sizeof(__b));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v18 = (id)objc_msgSend(WeakRetained, "_accessibility_contentsOfNavigationBar");
  id obj = (id)[v18 viewsRepresentingBackButton];

  uint64_t v21 = [obj countByEnumeratingWithState:__b objects:v32 count:16];
  if (v21)
  {
    uint64_t v14 = *(void *)__b[2];
    uint64_t v15 = 0;
    unint64_t v16 = v21;
    while (1)
    {
      uint64_t v13 = v15;
      if (*(void *)__b[2] != v14) {
        objc_enumerationMutation(obj);
      }
      id v28 = *(id *)(__b[1] + 8 * v15);
      id v11 = v28;
      [v28 bounds];
      double v22 = v1;
      double v23 = v2;
      double v24 = v3;
      double v25 = v4;
      id v12 = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(v11, "convertRect:toView:", v22, v23, v24, v25);
      r2.origin.x = v5;
      r2.origin.y = v6;
      r2.size.width = v7;
      r2.size.height = v8;

      CGRect v31 = CGRectUnion(v31, r2);
      ++v15;
      if (v13 + 1 >= v16)
      {
        uint64_t v15 = 0;
        unint64_t v16 = [obj countByEnumeratingWithState:__b objects:v32 count:16];
        if (!v16) {
          break;
        }
      }
    }
  }

  id v10 = (UIView *)objc_loadWeakRetained((id *)(a1 + 32));
  CGRect v31 = UIAccessibilityConvertFrameToScreenCoordinates(v31, v10);

  return v31.origin.x;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v15 = self;
  SEL v14 = a2;
  v13.receiver = self;
  v13.super_class = (Class)UINavigationBarAccessibility;
  [(UINavigationBarAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  [(UINavigationBarAccessibility *)v15 _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
  id v8 = (id)[(UINavigationBarAccessibility *)v15 _accessibility_contentsOfNavigationBar];
  id v7 = (id)[v8 promptView];
  id v6 = (id)[(UINavigationBarAccessibility *)v15 accessibilityLanguage];
  objc_msgSend(v7, "setAccessibilityLanguage:");

  memset(__b, 0, sizeof(__b));
  id obj = (id)[(UINavigationBarAccessibility *)v15 items];
  uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v10)
  {
    uint64_t v3 = *(void *)__b[2];
    uint64_t v4 = 0;
    unint64_t v5 = v10;
    while (1)
    {
      uint64_t v2 = v4;
      if (*(void *)__b[2] != v3) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(id *)(__b[1] + 8 * v4);
      [v12 _accessibilityLoadAccessibilityInformation];
      ++v4;
      if (v2 + 1 >= v5)
      {
        uint64_t v4 = 0;
        unint64_t v5 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v5) {
          break;
        }
      }
    }
  }
}

- (void)addSubview:(id)a3
{
  unint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UINavigationBarAccessibility;
  [(UINavigationBarAccessibility *)&v3 addSubview:location[0]];
  [(UINavigationBarAccessibility *)v5 _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
  objc_storeStrong(location, 0);
}

- (void)willRemoveSubview:(id)a3
{
  unint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UINavigationBarAccessibility;
  [(UINavigationBarAccessibility *)&v3 willRemoveSubview:location[0]];
  [(UINavigationBarAccessibility *)v5 _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
  objc_storeStrong(location, 0);
}

- (void)insertSubview:(id)a3 belowSubview:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)UINavigationBarAccessibility;
  [(UINavigationBarAccessibility *)&v5 insertSubview:location[0] belowSubview:v6];
  [(UINavigationBarAccessibility *)v8 _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)insertSubview:(id)a3 aboveSubview:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)UINavigationBarAccessibility;
  [(UINavigationBarAccessibility *)&v5 insertSubview:location[0] aboveSubview:v6];
  [(UINavigationBarAccessibility *)v8 _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)insertSubview:(id)a3 atIndex:(int64_t)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)UINavigationBarAccessibility;
  [(UINavigationBarAccessibility *)&v5 insertSubview:location[0] atIndex:a4];
  [(UINavigationBarAccessibility *)v8 _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
  objc_storeStrong(location, 0);
}

- (void)_accessibility_navigationBarContentsDidChange
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v15 = self;
  SEL v14 = a2;
  v13.receiver = self;
  v13.super_class = (Class)UINavigationBarAccessibility;
  [(UINavigationBarAccessibility *)&v13 _accessibility_navigationBarContentsDidChange];
  id v9 = (id)[(UINavigationBarAccessibility *)v15 _accessibility_contentsOfNavigationBar];
  id v8 = (id)[v9 promptView];
  id v7 = (id)[(UINavigationBarAccessibility *)v15 accessibilityLanguage];
  objc_msgSend(v8, "setAccessibilityLanguage:");

  memset(__b, 0, 0x40uLL);
  id obj = [(UINavigationBarAccessibility *)v15 _accessibilityNavBarElements];
  uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v18 count:16];
  if (v11)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    unint64_t v6 = v11;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      void __b[8] = *(void *)(__b[1] + 8 * v5);
      objc_opt_class();
      id v2 = (id)__UIAccessibilityCastAsSafeCategory();
      [v2 _accessibilitySetNavigationViewInfo:0];

      ++v5;
      if (v3 + 1 >= v6)
      {
        uint64_t v5 = 0;
        unint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v18 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  [(UINavigationBarAccessibility *)v15 _accessibilitySetNavBarElements:0];
  [(UINavigationBarAccessibility *)v15 _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
  uint64_t v17 = (dispatch_once_t *)&_accessibility_navigationBarContentsDidChange_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_441);
  if (*v17 != -1) {
    dispatch_once(v17, location);
  }
  objc_storeStrong(&location, 0);
  [(id)_accessibility_navigationBarContentsDidChange_coalescer performCoalescedAsynchronously];
}

void __77__UINavigationBarAccessibility__accessibility_navigationBarContentsDidChange__block_invoke(uint64_t a1)
{
  id v1 = (id)objc_msgSend(MEMORY[0x263F22800], "mainQueueCoalescerWithBlock:", &__block_literal_global_444, a1, a1);
  id v2 = (void *)_accessibility_navigationBarContentsDidChange_coalescer;
  _accessibility_navigationBarContentsDidChange_coalescer = (uint64_t)v1;
}

void __77__UINavigationBarAccessibility__accessibility_navigationBarContentsDidChange__block_invoke_2()
{
}

- (void).cxx_destruct
{
}

Method __98__UINavigationBarAccessibility_UIViewAccessibilityAdditions___accessibilitySupportsActivateAction__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  Method result = class_getInstanceMethod(v0, sel_accessibilityActivate);
  __accessibilitySupportsActivateAction_categoryMethod = (uint64_t)result;
  return result;
}

@end