@interface UITextSelectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)automationElements;
- (void)showCommandsWithReplacements:(id)a3;
@end

@implementation UITextSelectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITextSelectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UITextSelectionView";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UITextSelectionView", @"showCommandsWithReplacements:", "v", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"menuInteraction", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UITextContextMenuInteraction", @"editMenuInteraction", v5, 0);
  v4 = @"UIEditMenuInteraction";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"activeEditMenuPresentation", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIEditMenuContentPresentation", @"currentListView", v5, 0);
  objc_storeStrong(v7, v6);
}

- (id)automationElements
{
  v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = (id)[(UITextSelectionViewAccessibility *)self safeValueForKey:@"m_rangeView"];
  id v5 = (id)objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 1, v4);

  return v5;
}

- (void)showCommandsWithReplacements:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21.receiver = v23;
  v21.super_class = (Class)UITextSelectionViewAccessibility;
  [(UITextSelectionViewAccessibility *)&v21 showCommandsWithReplacements:location[0]];
  id v20 = (id)[(UITextSelectionViewAccessibility *)v23 safeValueForKeyPath:@"menuInteraction.editMenuInteraction"];
  if ([v20 safeBoolForKey:@"isDisplayingMenu"])
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F81200], 0);
    char v3 = [(id)*MEMORY[0x263F1D020] _accessibilitySoftwareKeyboardActive];
    char v17 = 0;
    char v15 = 0;
    BOOL v10 = 0;
    if ((v3 & 1) == 0)
    {
      id v18 = (id)[MEMORY[0x263F1C738] activeInstance];
      char v17 = 1;
      id v16 = (id)[v18 inputDelegate];
      char v15 = 1;
      BOOL v10 = v16 != 0;
    }
    if (v15) {

    }
    if (v17) {
    if (v10)
    }
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        memset(__b, 0, sizeof(__b));
        id obj = location[0];
        uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v24 count:16];
        if (v9)
        {
          uint64_t v5 = *(void *)__b[2];
          uint64_t v6 = 0;
          unint64_t v7 = v9;
          while (1)
          {
            uint64_t v4 = v6;
            if (*(void *)__b[2] != v5) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void *)(__b[1] + 8 * v6);
            id v12 = (id)[location[0] objectForKey:v14];
            NSClassFromString(&cfstr_Uitextreplacem.isa);
            if (objc_opt_isKindOfClass())
            {
              id argument = (id)[v20 safeValueForKeyPath:@"activeEditMenuPresentation.currentListView"];
              if (argument) {
                UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], argument);
              }
              int v19 = 2;
              objc_storeStrong(&argument, 0);
            }
            else
            {
              int v19 = 0;
            }
            objc_storeStrong(&v12, 0);
            if (v19) {
              break;
            }
            ++v6;
            if (v4 + 1 >= v7)
            {
              uint64_t v6 = 0;
              unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v24 count:16];
              if (!v7) {
                goto LABEL_23;
              }
            }
          }
        }
        else
        {
LABEL_23:
          int v19 = 0;
        }
      }
    }
    int v19 = 0;
  }
  else
  {
    int v19 = 1;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

@end