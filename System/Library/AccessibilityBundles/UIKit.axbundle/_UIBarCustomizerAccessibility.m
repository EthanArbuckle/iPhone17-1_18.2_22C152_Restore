@interface _UIBarCustomizerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axContainerView;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)beginWithSession:(id)a3;
@end

@implementation _UIBarCustomizerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIBarCustomizer";
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
  id v5 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "@";
  v4 = @"_UIBarCustomizer";
  [location[0] validateClass:"@" hasInstanceMethod:"@" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"beginWithSession:", "v", v3, 0);
  objc_storeStrong(v6, v5);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v13 = self;
  SEL v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)_UIBarCustomizerAccessibility;
  [(_UIBarCustomizerAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, v13);
  id v3 = [(_UIBarCustomizerAccessibility *)v13 _axContainerView];
  [v3 setAccessibilityViewIsModal:1];

  id v2 = [(_UIBarCustomizerAccessibility *)v13 _axContainerView];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __75___UIBarCustomizerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8 = &unk_2650ADF60;
  objc_copyWeak(v9, &location);
  [v2 _setAccessibilityPerformEscapeBlock:&v4];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (id)_axContainerView
{
  v10[2] = self;
  v10[1] = (id)a2;
  char v9 = 0;
  objc_opt_class();
  id v8 = (id)__UIAccessibilityCastAsClass();
  id v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = v7;
  id v5 = (id)[v7 delegate];
  id v3 = v10[0];
  id v4 = (id)[v10[0] _activeSession];
  id v6 = (id)objc_msgSend(v5, "barCustomizer:containerViewForSession:", v3);

  objc_storeStrong(v10, 0);

  return v6;
}

- (void)beginWithSession:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)_UIBarCustomizerAccessibility;
  [(_UIBarCustomizerAccessibility *)&v5 beginWithSession:location[0]];
  [(_UIBarCustomizerAccessibility *)v7 _accessibilityLoadAccessibilityInformation];
  UIAccessibilityNotifications notification = *MEMORY[0x263F1CE68];
  id v4 = [(_UIBarCustomizerAccessibility *)v7 _axContainerView];
  UIAccessibilityPostNotification(notification, v4);

  objc_storeStrong(location, 0);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v37 = 0;
  objc_storeStrong(&v37, a4);
  char v35 = 0;
  objc_opt_class();
  id v34 = (id)__UIAccessibilityCastAsClass();
  id v33 = v34;
  objc_storeStrong(&v34, 0);
  id v36 = v33;
  unint64_t v32 = [v33 _dropIndex];
  v30.receiver = v39;
  v30.super_class = (Class)_UIBarCustomizerAccessibility;
  id v31 = [(_UIBarCustomizerAccessibility *)&v30 dropInteraction:location[0] sessionDidUpdate:v37];
  unint64_t v29 = [v36 _dropIndex];
  if (v32 != v29 && v29 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v32 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v32 = v29 - 1;
    }
    id v28 = (id)[v36 _visibleItems];
    if (v32 >= v29 || (unint64_t v18 = v32, v18 >= [v28 count]))
    {
      if (v29 < [v28 count])
      {
        char v22 = 0;
        objc_opt_class();
        id v11 = (id)[v28 objectAtIndex:v29];
        id v21 = (id)__UIAccessibilityCastAsClass();

        id v20 = v21;
        objc_storeStrong(&v21, 0);
        id v23 = v20;
        UIAccessibilityNotifications v7 = *MEMORY[0x263F1CDC8];
        id v6 = NSString;
        id v10 = (id)UIKitAccessibilityLocalizedString();
        id v9 = (id)[v23 name];
        id v8 = (id)objc_msgSend(v6, "localizedStringWithFormat:", v10, v9);
        UIAccessibilityPostNotification(v7, v8);

        objc_storeStrong(&v23, 0);
      }
    }
    else
    {
      char v26 = 0;
      objc_opt_class();
      id v17 = (id)[v28 objectAtIndex:v32];
      id v25 = (id)__UIAccessibilityCastAsClass();

      id v24 = v25;
      objc_storeStrong(&v25, 0);
      id v27 = v24;
      UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
      SEL v12 = NSString;
      id v16 = (id)UIKitAccessibilityLocalizedString();
      id v15 = (id)[v27 name];
      id v14 = (id)objc_msgSend(v12, "localizedStringWithFormat:", v16, v15);
      UIAccessibilityPostNotification(notification, v14);

      objc_storeStrong(&v27, 0);
    }
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21980]);
    objc_storeStrong(&v28, 0);
  }
  id v5 = v31;
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);

  return v5;
}

@end