@interface PSListControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHandleNavigationControllerDidEndTransition;
- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)highlightSpecifierWithID:(id)a3;
- (void)reloadSpecifierAtIndex:(int)a3 animated:(BOOL)a4;
@end

@implementation PSListControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSListController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSListController", @"highlightSpecifierWithID:", "v", "@", 0);
  [v3 validateClass:@"PSRootController"];
  [v3 validateClass:@"PSRootController" isKindOfClass:@"UINavigationController"];
}

- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PSListControllerAccessibility;
  v7 = [(PSListControllerAccessibility *)&v13 loadSpecifiersFromPlistName:v6 target:a4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__PSListControllerAccessibility_loadSpecifiersFromPlistName_target___block_invoke;
  v10[3] = &unk_265147310;
  id v11 = v6;
  v12 = self;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v10];

  return v7;
}

void __68__PSListControllerAccessibility_loadSpecifiersFromPlistName_target___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setProperty:v3 forKey:@"axStringsFileName"];
  id v5 = [*(id *)(a1 + 40) safeValueForKey:@"bundle"];
  [v4 setProperty:v5 forKey:@"axBundle"];
}

- (void)highlightSpecifierWithID:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PSListControllerAccessibility;
  [(PSListControllerAccessibility *)&v15 highlightSpecifierWithID:v4];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  objc_super v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  id v8 = v4;
  AXPerformSafeBlock();
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  id v6 = [v5 propertyForKey:*MEMORY[0x263F602B0]];

  LODWORD(v5) = *MEMORY[0x263F1CDC8];
  v7 = [v6 accessibilityValue];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v5, v7);
}

uint64_t __58__PSListControllerAccessibility_highlightSpecifierWithID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) specifierForID:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_accessibilityHandleNavigationControllerDidEndTransition
{
  v32[2] = *MEMORY[0x263EF8340];
  BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  if (IsVoiceOverRunning)
  {
    id v4 = [(id)*MEMORY[0x263F1D020] _accessibilityValueForKey:@"applicationDidBecomeActiveDate"];
    id v5 = [MEMORY[0x263EFF910] date];
    id v6 = v5;
    if (v4 && ([v5 timeIntervalSinceDate:v4], v7 <= 1.0))
    {
    }
    else
    {
      id v8 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v9 = [v8 bundleIdentifier];
      char v10 = [v9 isEqualToString:@"com.apple.Bridge"];

      if ((v10 & 1) == 0)
      {
        NSClassFromString(&cfstr_Uisplitviewcon.isa);
        uint64_t v11 = [(PSListControllerAccessibility *)self safeValueForKey:@"view"];
        if (!v11)
        {
LABEL_9:
          int v15 = 0;
LABEL_35:
          LOBYTE(IsVoiceOverRunning) = v15 != 0;
          return IsVoiceOverRunning;
        }
        v12 = (void *)v11;
        while (1)
        {
          objc_super v13 = [v12 safeValueForKey:@"_viewDelegate"];
          if (objc_opt_isKindOfClass()) {
            break;
          }
          uint64_t v14 = [v12 superview];

          v12 = (void *)v14;
          if (!v14) {
            goto LABEL_9;
          }
        }
        id v16 = v13;
        if ([v16 isCollapsed])
        {
          int v15 = 0;
LABEL_34:

          goto LABEL_35;
        }
        objc_opt_class();
        v17 = [(PSListControllerAccessibility *)self safeValueForKey:@"parentViewController"];
        v18 = __UIAccessibilityCastAsClass();

        v19 = [v18 navigationBar];
        v20 = [MEMORY[0x263F81198] defaultVoiceOverOptions];
        v21 = [v19 _accessibilityLeafDescendantsWithOptions:v20];
        v22 = [v21 firstObject];

        if (v22)
        {
LABEL_15:
          UIAccessibilityNotifications v23 = *MEMORY[0x263F1CE68];
          v32[0] = *MEMORY[0x263F21A78];
          v32[1] = v22;
          v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
          UIAccessibilityPostNotification(v23, v24);

          int v15 = 1;
          v25 = v22;
LABEL_32:

          goto LABEL_33;
        }
        v25 = [(PSListControllerAccessibility *)self safeValueForKey:@"_table"];
        if ([v25 _accessibilityHasOrderedChildren])
        {
          uint64_t v26 = [v25 accessibilityElementCount];
          if (v26 >= 1)
          {
            uint64_t v27 = v26;
            uint64_t v28 = 0;
            while (1)
            {
              v22 = [v25 accessibilityElementAtIndex:v28];
              if (v22)
              {
                do
                {
                  if (![v22 _accessibilityHasOrderedChildren]) {
                    break;
                  }
                  if ([v22 accessibilityElementCount] < 1) {
                    break;
                  }
                  uint64_t v29 = [v22 accessibilityElementAtIndex:0];

                  v22 = (void *)v29;
                }
                while (v29);
              }
              [v22 accessibilityFrame];
              if (v30 > 1.0) {
                break;
              }

              if (++v28 == v27) {
                goto LABEL_31;
              }
            }
LABEL_28:

            if (!v22)
            {
              int v15 = 0;
LABEL_33:

              goto LABEL_34;
            }
            goto LABEL_15;
          }
        }
        else
        {
          if ([v25 isAccessibilityOpaqueElementProvider])
          {
            v22 = [v25 _accessibilityFirstOpaqueElement];
            goto LABEL_28;
          }
          _AXAssert();
        }
LABEL_31:
        int v15 = 0;
        goto LABEL_32;
      }
    }
    LOBYTE(IsVoiceOverRunning) = 0;
  }
  return IsVoiceOverRunning;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    id v8 = [NSNumber numberWithBool:1];
    [(PSListControllerAccessibility *)self setValue:v8 forKey:@"_cachesCells"];
  }
  v11.receiver = self;
  v11.super_class = (Class)PSListControllerAccessibility;
  uint64_t v9 = [(PSListControllerAccessibility *)&v11 tableView:v6 cellForRowAtIndexPath:v7];

  return v9;
}

- (void)reloadSpecifierAtIndex:(int)a3 animated:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PSListControllerAccessibility;
  [(PSListControllerAccessibility *)&v6 reloadSpecifierAtIndex:*(void *)&a3 animated:a4];
  id v5 = [(PSListControllerAccessibility *)self safeValueForKey:@"_specifiers"];

  if (v5) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

@end