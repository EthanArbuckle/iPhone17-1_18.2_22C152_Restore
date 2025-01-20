@interface UIAlertControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldPostScreenChangedOnPresentation;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation UIAlertControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIAlertController";
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
  [location[0] validateClass:@"UIAlertController" isKindOfClass:@"UIViewController"];
  objc_msgSend(location[0], "validateClass:");
  [location[0] validateClass:@"_UIAlertControllerView" hasProperty:@"_contentView" withType:"@"];
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  [location[0] validateClass:@"_UIAlertControllerPhoneTVMacView" hasInstanceVariable:@"_actionViews" withType:"NSMutableArray"];
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityShouldPostScreenChangedOnPresentation
{
  return 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIAlertControllerAccessibility;
  [(UIAlertControllerAccessibility *)&v9 viewDidAppear:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F811F0], 0);
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  v6 = __48__UIAlertControllerAccessibility_viewDidAppear___block_invoke;
  v7 = &unk_2650ADF18;
  v8 = v12;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong((id *)&v8, 0);
}

void __48__UIAlertControllerAccessibility_viewDidAppear___block_invoke(id *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15[2] = a1;
  v15[1] = a1;
  v15[0] = (id)[a1[4] safeValueForKey:@"view"];
  id v14 = (id)[v15[0] safeValueForKey:@"_contentView"];
  id location = (id)[(id)*MEMORY[0x263F1D020] _accessibilityResponderElement];
  id v9 = (id)[v15[0] accessibilityIdentifier];
  char v10 = [v9 isEqualToString:@"VO_USAGE_CONFIRMED_ALERT"];

  if (v10)
  {
    memset(__b, 0, sizeof(__b));
    id obj = (id)[v15[0] safeValueForKey:@"_actionViews"];
    uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
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
        id argument = *(id *)(__b[1] + 8 * v5);
        id v1 = (id)[argument accessibilityIdentifier];
        char v2 = [v1 isEqualToString:@"VO_USAGE_CONFIRMED_TUTORIAL_BUTTON"];

        if (v2) {
          break;
        }
        ++v5;
        if (v3 + 1 >= v6)
        {
          uint64_t v5 = 0;
          unint64_t v6 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
          if (!v6) {
            goto LABEL_10;
          }
        }
      }
      UIAccessibilityPostNotification(*MEMORY[0x263F812F8], argument);
    }
LABEL_10:
  }
  if (([location _accessibilityIsDescendantOfElement:v15[0]] & 1) == 0) {
    UIAccessibilityPostNotification(*MEMORY[0x263F812F8], v14);
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v15, 0);
}

@end