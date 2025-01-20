@interface UIViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsFKARunningForFocusItem;
- (BOOL)_accessibilityPresentedControllerModalizes;
- (BOOL)_accessibilityPresentsAsPopup;
- (BOOL)_accessibilityShouldPostScreenChangedOnPresentation;
- (BOOL)accessibilityPostScreenChangedForChildViewController:(id)a3 isAddition:(BOOL)a4;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (id)_accessibilitySpeakThisElementsAndStrings;
- (id)_accessibilitySpeakThisView;
- (id)_accessibilitySpeakThisViewController;
- (id)_accessibilitySpeakThisViews;
- (id)_accessibilityUserTestingViewControllerInfo;
- (id)_overridingPreferredFocusEnvironment;
- (uint64_t)_accessibilityDidLoadAccessibilityInformation;
- (uint64_t)_setAccessibilityDidLoadAccessibilityInformation:(uint64_t)result;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_presentViewController:(id)a3 modalSourceViewController:(id)a4 presentationController:(id)a5 animationController:(id)a6 interactionController:(id)a7 handoffData:(id)a8 completion:(id)a9;
- (void)_primitiveSetNavigationControllerContentInsetAdjustment:(UIEdgeInsets)a3;
- (void)_setNavigationControllerContentInsetAdjustment:(UIEdgeInsets)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4;
- (void)performSegueWithIdentifier:(id)a3 sender:(id)a4;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentViewController:(id)a3 withTransition:(int)a4 completion:(id)a5;
- (void)setAccessibilityLabel:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation UIViewControllerAccessibility

- (void)_accessibilityLoadAccessibilityInformation
{
  v10 = self;
  SEL v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)UIViewControllerAccessibility;
  [(UIViewControllerAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  id location = (id)[(UIViewControllerAccessibility *)v10 safeValueForKey:@"contentScrollView"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (id)[(UIViewControllerAccessibility *)v10 safeValueForKey:@"_navigationControllerContentInsetAdjustment"];
    [v6 UIEdgeInsetsValue];
    objc_msgSend(location, "_accessibilitySetNavigationControllerInset:", v2, v3, v4, v5);
  }
  objc_storeStrong(&location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIViewControllerAccessibility;
  [(UIViewControllerAccessibility *)&v8 viewDidAppear:a3];
  os_log_t oslog = (os_log_t)(id)AXLogUIA();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    double v4 = v11;
    unsigned __int8 v3 = _AXSAutomationEnabled();
    __os_log_helper_16_2_2_8_64_4_0((uint64_t)v12, (uint64_t)v4, v3);
    _os_log_debug_impl(&dword_2402B7000, oslog, type, "View did appear: %@ %d", v12, 0x12u);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (_AXSAutomationEnabled())
  {
    id argument = -[UIViewControllerAccessibility _accessibilityUserTestingViewControllerInfo](v11);
    [argument setObject:@"ViewDidAppear" forKeyedSubscript:@"event"];
    UIAccessibilityPostNotification(0xFA2u, argument);
    objc_storeStrong(&argument, 0);
  }
}

- (void)viewDidLoad
{
  double v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIViewControllerAccessibility;
  [(UIViewControllerAccessibility *)&v2 viewDidLoad];
  if ((-[UIViewControllerAccessibility _accessibilityDidLoadAccessibilityInformation]((uint64_t)v4) & 1) == 0)
  {
    [(UIViewControllerAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
    -[UIViewControllerAccessibility _setAccessibilityDidLoadAccessibilityInformation:]((uint64_t)v4);
  }
}

- (uint64_t)_setAccessibilityDidLoadAccessibilityInformation:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedBool();
  }
  return result;
}

- (uint64_t)_accessibilityDidLoadAccessibilityInformation
{
  if (a1) {
    char v2 = __UIAccessibilityGetAssociatedBool() & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIViewControllerAccessibility;
  [(UIViewControllerAccessibility *)&v8 viewDidDisappear:a3];
  os_log_t oslog = (os_log_t)(id)AXLogUIA();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    double v4 = v11;
    unsigned __int8 v3 = _AXSAutomationEnabled();
    __os_log_helper_16_2_2_8_64_4_0((uint64_t)v12, (uint64_t)v4, v3);
    _os_log_debug_impl(&dword_2402B7000, oslog, type, "View did disappear: %@ %d", v12, 0x12u);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (_AXSAutomationEnabled())
  {
    id argument = -[UIViewControllerAccessibility _accessibilityUserTestingViewControllerInfo](v11);
    [argument setObject:@"ViewDidDisappear" forKeyedSubscript:@"event"];
    UIAccessibilityPostNotification(0xFA2u, argument);
    objc_storeStrong(&argument, 0);
  }
}

+ (id)safeCategoryTargetClassName
{
  return @"UIViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v11 = location;
  id v10 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v8 = @"UIViewController";
  BOOL v9 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_existingTabBarItem", v9, 0);
  unsigned __int8 v3 = "i";
  id v6 = "@?";
  v7 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"presentViewController: withTransition: completion:", v9, "i", "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"dismissViewControllerWithTransition: completion:", v7, v3, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"presentingViewController", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"modalPresentationStyle", "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"popoverPresentationController", v9, 0);
  double v4 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"presentViewController: animated: completion:", v7, v9, "B", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"dismissViewControllerAnimated: completion:", v7, v4, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"performSegueWithIdentifier: sender:", v7, v9, v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"setEditing: animated:", v7, v4, v4, 0);
  double v5 = "{UIEdgeInsets=dddd}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_primitiveSetNavigationControllerContentInsetAdjustment:", v7, "{UIEdgeInsets=dddd}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_setNavigationControllerContentInsetAdjustment:", v7, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_presentViewController:modalSourceViewController:presentationController:animationController:interactionController:handoffData:completion:", v7, v9, v9, v9, v9, v9, v9, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"contentScrollView", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_overridingPreferredFocusEnvironment", v9, 0);
  objc_storeStrong(v11, v10);
}

- (BOOL)accessibilityPostScreenChangedForChildViewController:(id)a3 isAddition:(BOOL)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v5 = [location[0] _accessibilityShouldPostScreenChangedOnPresentation];
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)_accessibilityShouldPostScreenChangedOnPresentation
{
  return 1;
}

- (void)_primitiveSetNavigationControllerContentInsetAdjustment:(UIEdgeInsets)a3
{
  UIEdgeInsets v7 = a3;
  id v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)UIViewControllerAccessibility;
  -[UIViewControllerAccessibility _primitiveSetNavigationControllerContentInsetAdjustment:](&v4, sel__primitiveSetNavigationControllerContentInsetAdjustment_, a3.top, a3.left, a3.bottom, a3.right);
  id location = (id)[(UIViewControllerAccessibility *)v6 safeValueForKey:@"contentScrollView"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(location, "_accessibilitySetNavigationControllerInset:", v7.top, v7.left, v7.bottom, v7.right);
  }
  objc_storeStrong(&location, 0);
}

- (void)_setNavigationControllerContentInsetAdjustment:(UIEdgeInsets)a3
{
  UIEdgeInsets v7 = a3;
  id v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)UIViewControllerAccessibility;
  -[UIViewControllerAccessibility _setNavigationControllerContentInsetAdjustment:](&v4, sel__setNavigationControllerContentInsetAdjustment_, a3.top, a3.left, a3.bottom, a3.right);
  id location = (id)[(UIViewControllerAccessibility *)v6 safeValueForKey:@"contentScrollView"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(location, "_accessibilitySetNavigationControllerInset:", v7.top, v7.left, v7.bottom, v7.right);
  }
  objc_storeStrong(&location, 0);
}

- (void)setAccessibilityLabel:(id)a3
{
  UIEdgeInsets v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIViewControllerAccessibility;
  [(UIViewControllerAccessibility *)&v5 setAccessibilityLabel:location[0]];
  id v3 = (id)[(UIViewControllerAccessibility *)v7 safeValueForKey:@"_existingNavigationItem"];
  [v3 setAccessibilityLabel:location[0]];

  id v4 = (id)[(UIViewControllerAccessibility *)v7 safeValueForKey:@"_existingTabBarItem"];
  [v4 setAccessibilityLabel:location[0]];

  objc_storeStrong(location, 0);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v22 = a4;
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  id v20 = 0;
  if ([location[0] _accessibilityPresentsAsPopup]) {
    objc_storeStrong(&v20, (id)*MEMORY[0x263F21AB0]);
  }
  if ([(UIViewControllerAccessibility *)v24 accessibilityPostScreenChangedForChildViewController:location[0] isAddition:1])
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F81328], v20);
  }
  objc_initWeak(&v19, v24);
  objc_initWeak(&v18, location[0]);
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  v11 = __75__UIViewControllerAccessibility_presentViewController_animated_completion___block_invoke;
  v12 = &unk_2650AF978;
  objc_copyWeak(&v15, &v18);
  id v14 = v21;
  objc_copyWeak(&v16, &v19);
  id v13 = v20;
  id v17 = (id)MEMORY[0x2455E7040](&v8);
  v7.receiver = v24;
  v7.super_class = (Class)UIViewControllerAccessibility;
  [(UIViewControllerAccessibility *)&v7 presentViewController:location[0] animated:v22 completion:v17];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v13, 0);
  objc_destroyWeak(&v16);
  objc_storeStrong(&v14, 0);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v19);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __75__UIViewControllerAccessibility_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v4 = (id)[WeakRetained safeValueForKey:@"view"];
    [v4 setAccessibilityViewIsModal:1];
  }
  if (*(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  id v1 = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  char v9 = 0;
  char v7 = 0;
  LOBYTE(v3) = 0;
  if (objc_msgSend(v1, "accessibilityPostScreenChangedForChildViewController:isAddition:"))
  {
    id v10 = objc_loadWeakRetained((id *)(a1 + 48));
    char v9 = 1;
    id v8 = (id)[v10 view];
    char v7 = 1;
    int v3 = [v8 accessibilityElementsHidden] ^ 1;
  }
  if (v7) {

  }
  if (v9) {
  if (v3)
  }
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], *(id *)(a1 + 32));
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v6 = (id)[(UIViewControllerAccessibility *)v10 safeValueForKey:@"presentedViewController"];
  v5.receiver = v10;
  v5.super_class = (Class)UIViewControllerAccessibility;
  [(UIViewControllerAccessibility *)&v5 dismissViewControllerAnimated:v8 completion:location];
  id v4 = (id)[v6 safeValueForKey:@"view"];
  [v4 setAccessibilityViewIsModal:0];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(&location, 0);
}

- (void)presentViewController:(id)a3 withTransition:(int)a4 completion:(id)a5
{
  BOOL v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned int v20 = a4;
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  id v18 = 0;
  if ([location[0] _accessibilityPresentsAsPopup]) {
    objc_storeStrong(&v18, (id)*MEMORY[0x263F21AB0]);
  }
  if ([(UIViewControllerAccessibility *)v22 accessibilityPostScreenChangedForChildViewController:location[0] isAddition:1])
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F81328], v18);
  }
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  v11 = __81__UIViewControllerAccessibility_presentViewController_withTransition_completion___block_invoke;
  v12 = &unk_2650AF9A0;
  id v13 = location[0];
  id v16 = v19;
  id v14 = v22;
  id v15 = v18;
  id v17 = (id)MEMORY[0x2455E7040](&v8);
  v7.receiver = v22;
  v7.super_class = (Class)UIViewControllerAccessibility;
  [(UIViewControllerAccessibility *)&v7 presentViewController:location[0] withTransition:v20 completion:v17];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

void __81__UIViewControllerAccessibility_presentViewController_withTransition_completion___block_invoke(uint64_t a1)
{
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    id v1 = (id)[*(id *)(a1 + 32) safeValueForKey:@"view"];
    [v1 setAccessibilityViewIsModal:1];
  }
  if (*(void *)(a1 + 56)) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  if ([*(id *)(a1 + 40) accessibilityPostScreenChangedForChildViewController:*(void *)(a1 + 32) isAddition:1])UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], *(id *)(a1 + 48)); {
}
  }

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  v39 = self;
  SEL v38 = a2;
  unsigned int v37 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v14 = (id)[(UIViewControllerAccessibility *)v39 safeValueForKey:@"presentedViewController"];
  objc_initWeak(&from, v14);

  char v34 = 0;
  id v15 = objc_loadWeakRetained(&from);
  char v32 = 0;
  char v27 = 0;
  char v25 = 0;
  id v13 = (id)[v15 safeValueForKey:@"view"];
  char v12 = 1;
  if (([v13 accessibilityElementsHidden] & 1) == 0)
  {
    id v33 = objc_loadWeakRetained(&from);
    char v32 = 1;
    char v11 = 0;
    if (!v33)
    {
      char v31 = 0;
      objc_opt_class();
      id v30 = (id)__UIAccessibilityCastAsClass();
      id v29 = v30;
      objc_storeStrong(&v30, 0);
      id v28 = v29;
      char v27 = 1;
      id v26 = (id)[v29 view];
      char v25 = 1;
      char v11 = [v26 accessibilityElementsHidden];
    }
    char v12 = v11;
  }
  if (v25) {

  }
  if (v27) {
  if (v32)
  }

  char v34 = v12 & 1;
  int v9 = v39;
  id v10 = objc_loadWeakRetained(&from);
  char v8 = 0;
  if (-[UIViewControllerAccessibility accessibilityPostScreenChangedForChildViewController:isAddition:](v9, "accessibilityPostScreenChangedForChildViewController:isAddition:"))
  {
    char v8 = v34 ^ 1;
  }

  if (v8)
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F81328], 0);
    id v6 = v39;
    unsigned int v7 = v37;
    uint64_t v18 = MEMORY[0x263EF8330];
    int v19 = -1073741824;
    int v20 = 0;
    id v21 = __80__UIViewControllerAccessibility_dismissViewControllerWithTransition_completion___block_invoke;
    BOOL v22 = &unk_2650AF9C8;
    objc_copyWeak(&v24, &from);
    id v23 = location;
    v17.receiver = v6;
    v17.super_class = (Class)UIViewControllerAccessibility;
    [(UIViewControllerAccessibility *)&v17 dismissViewControllerWithTransition:v7 completion:&v18];
    objc_storeStrong(&v23, 0);
    objc_destroyWeak(&v24);
  }
  else
  {
    v16.receiver = v39;
    v16.super_class = (Class)UIViewControllerAccessibility;
    [(UIViewControllerAccessibility *)&v16 dismissViewControllerWithTransition:v37 completion:location];
    id v5 = objc_loadWeakRetained(&from);
    id v4 = (id)[v5 safeValueForKey:@"view"];
    [v4 setAccessibilityViewIsModal:0];
  }
  objc_destroyWeak(&from);
  objc_storeStrong(&location, 0);
}

uint64_t __80__UIViewControllerAccessibility_dismissViewControllerWithTransition_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = (id)[WeakRetained safeValueForKey:@"view"];
  [v2 setAccessibilityViewIsModal:0];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  uint64_t result = a1;
  if (*(void *)(a1 + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return result;
}

- (void)_presentViewController:(id)a3 modalSourceViewController:(id)a4 presentationController:(id)a5 animationController:(id)a6 interactionController:(id)a7 handoffData:(id)a8 completion:(id)a9
{
  unsigned int v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v35 = 0;
  objc_storeStrong(&v35, a4);
  id v34 = 0;
  objc_storeStrong(&v34, a5);
  id v33 = 0;
  objc_storeStrong(&v33, a6);
  id v32 = 0;
  objc_storeStrong(&v32, a7);
  id v31 = 0;
  objc_storeStrong(&v31, a8);
  id v30 = 0;
  objc_storeStrong(&v30, a9);
  if ([(UIViewControllerAccessibility *)v37 accessibilityPostScreenChangedForChildViewController:location[0] isAddition:0])
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F81328], 0);
  }
  objc_initWeak(&v29, v34);
  int v9 = v37;
  id v10 = location[0];
  id v11 = v35;
  id v12 = v34;
  id v13 = v33;
  id v14 = v32;
  id v15 = v31;
  uint64_t v22 = MEMORY[0x263EF8330];
  int v23 = -1073741824;
  int v24 = 0;
  char v25 = __170__UIViewControllerAccessibility__presentViewController_modalSourceViewController_presentationController_animationController_interactionController_handoffData_completion___block_invoke;
  id v26 = &unk_2650AF9F0;
  objc_copyWeak(&v28, &v29);
  id v27 = v30;
  v21.receiver = v9;
  v21.super_class = (Class)UIViewControllerAccessibility;
  [(UIViewControllerAccessibility *)&v21 _presentViewController:v10 modalSourceViewController:v11 presentationController:v12 animationController:v13 interactionController:v14 handoffData:v15 completion:&v22];
  objc_storeStrong(&v27, 0);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v29);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

uint64_t __170__UIViewControllerAccessibility__presentViewController_modalSourceViewController_presentationController_animationController_interactionController_handoffData_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v1 = (id)[WeakRetained safeValueForKey:@"_accessibilityModalizePresentationView"];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_super v17 = self;
  SEL v16 = a2;
  int64_t v15 = a3;
  if (a3 != 2 && v15 != 1) {
    goto LABEL_15;
  }
  id location = (id)[(UIViewControllerAccessibility *)v17 childViewControllers];
  memset(__b, 0, sizeof(__b));
  id obj = location;
  uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
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
      id v13 = *(id *)(__b[1] + 8 * v6);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v7) {
          goto LABEL_11;
        }
      }
    }
    char v18 = [v13 accessibilityScroll:v15] & 1;
    int v11 = 1;
  }
  else
  {
LABEL_11:
    int v11 = 0;
  }

  if (!v11) {
    int v11 = 0;
  }
  objc_storeStrong(&location, 0);
  if (!v11)
  {
LABEL_15:
    v10.receiver = v17;
    v10.super_class = (Class)UIViewControllerAccessibility;
    char v18 = [(UIViewControllerAccessibility *)&v10 accessibilityScroll:v15];
  }
  return v18 & 1;
}

- (void)performSegueWithIdentifier:(id)a3 sender:(id)a4
{
  char v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  UIAccessibilityPostNotification(*MEMORY[0x263F81328], 0);
  v5.receiver = v8;
  v5.super_class = (Class)UIViewControllerAccessibility;
  [(UIViewControllerAccessibility *)&v5 performSegueWithIdentifier:location[0] sender:v6];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  char v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  BOOL v5 = a4;
  v4.receiver = self;
  v4.super_class = (Class)UIViewControllerAccessibility;
  [(UIViewControllerAccessibility *)&v4 setEditing:a3 animated:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (BOOL)_accessibilityPresentsAsPopup
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UIViewControllerAccessibility *)self safeValueForKey:@"popoverPresentationController"];
  BOOL v3 = location[0] != 0;
  objc_storeStrong(location, 0);
  return v3;
}

- (id)_accessibilitySpeakThisViewController
{
  BOOL v6 = self;
  location[1] = (id)a2;
  id v4 = (id)[(UIViewControllerAccessibility *)self presentedViewController];
  location[0] = (id)[v4 _accessibilitySpeakThisViewController];

  if (!location[0]) {
    objc_storeStrong(location, v6);
  }
  id v3 = location[0];
  objc_storeStrong(location, 0);

  return v3;
}

- (id)_accessibilitySpeakThisViews
{
  v8[1] = *MEMORY[0x263EF8340];
  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = 0;
  id location = [(UIViewControllerAccessibility *)self _accessibilitySpeakThisView];
  if (location)
  {
    v8[0] = location;
    id v2 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    id v3 = v7[0];
    v7[0] = v2;
  }
  id v5 = v7[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v7, 0);

  return v5;
}

- (id)_accessibilitySpeakThisView
{
  return (id)[(UIViewControllerAccessibility *)self view];
}

- (id)_accessibilityUserTestingViewControllerInfo
{
  id v25 = a1;
  if (a1)
  {
    id v24 = (id)[MEMORY[0x263EFF9A0] dictionary];
    id v1 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v1);
    objc_msgSend(v24, "setObject:forKeyedSubscript:");

    id v2 = (id)[v25 title];
    BOOL v15 = v2 == 0;

    if (!v15)
    {
      id v13 = (id)[v25 title];
      objc_msgSend(v24, "setObject:forKeyedSubscript:");
    }
    char v22 = 0;
    objc_opt_class();
    id v12 = (id)[v25 safeValueForKey:@"_existingTabBarItem"];
    id v21 = (id)__UIAccessibilityCastAsClass();

    id v20 = v21;
    objc_storeStrong(&v21, 0);
    id v23 = v20;
    char v18 = 0;
    objc_opt_class();
    id v11 = (id)[v25 safeValueForKey:@"_existingNavigationItem"];
    id v17 = (id)__UIAccessibilityCastAsClass();

    id v16 = v17;
    objc_storeStrong(&v17, 0);
    id v19 = v16;
    id v3 = (id)[v16 title];
    BOOL v10 = v3 == 0;

    if (v10)
    {
      id v4 = (id)[v23 title];
      BOOL v8 = v4 == 0;

      if (!v8)
      {
        id v7 = (id)[v23 title];
        objc_msgSend(v24, "setObject:forKeyedSubscript:");
      }
    }
    else
    {
      id v9 = (id)[v19 title];
      objc_msgSend(v24, "setObject:forKeyedSubscript:");
    }
    id v26 = v24;
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
  }
  else
  {
    id v26 = 0;
  }
  id v5 = v26;

  return v5;
}

- (id)_accessibilitySpeakThisElementsAndStrings
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)[MEMORY[0x263EFF980] array];
  memset(__b, 0, sizeof(__b));
  id obj = [(UIViewControllerAccessibility *)v15 _accessibilitySpeakThisViews];
  uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0;
    unint64_t v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(id *)(__b[1] + 8 * v8);
      id v4 = v14[0];
      id v5 = (id)[v13 _accessibilitySpeakThisElementsAndStrings];
      objc_msgSend(v4, "addObjectsFromArray:");

      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0;
        unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  id v3 = v14[0];
  objc_storeStrong(v14, 0);

  return v3;
}

- (BOOL)_accessibilityIsFKARunningForFocusItem
{
  id v3 = (id)[(UIViewControllerAccessibility *)self view];
  char v4 = [v3 _accessibilityIsFKARunningForFocusItem];

  return v4 & 1;
}

- (id)_overridingPreferredFocusEnvironment
{
  char v18 = self;
  v17[1] = (id)a2;
  v16.receiver = self;
  v16.super_class = (Class)UIViewControllerAccessibility;
  v17[0] = [(UIViewControllerAccessibility *)&v16 _overridingPreferredFocusEnvironment];
  if (v17[0]
    && [(UIViewControllerAccessibility *)v18 _accessibilityIsFKARunningForFocusItem])
  {
    id v15 = (id)[(UIViewControllerAccessibility *)v18 presentedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v13 = 0;
      objc_opt_class();
      id v12 = (id)__UIAccessibilityCastAsClass();
      id v11 = v12;
      objc_storeStrong(&v12, 0);
      id v14 = v11;
      id v4 = (id)[v11 searchResultsController];
      id v5 = (id)[v4 view];
      char v9 = 0;
      char v7 = 0;
      char v6 = 0;
      if (v5)
      {
        id v10 = (id)[v14 searchResultsController];
        char v9 = 1;
        id v8 = (id)[v10 view];
        char v7 = 1;
        char v6 = [v8 isHidden];
      }
      if (v7) {

      }
      if (v9) {
      if (v6)
      }
        objc_storeStrong(v17, 0);
      objc_storeStrong(&v14, 0);
    }
    objc_storeStrong(&v15, 0);
  }
  id v3 = v17[0];
  objc_storeStrong(v17, 0);

  return v3;
}

- (BOOL)_accessibilityPresentedControllerModalizes
{
  return 0;
}

@end