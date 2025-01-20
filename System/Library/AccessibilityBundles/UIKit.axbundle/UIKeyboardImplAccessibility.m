@interface UIKeyboardImplAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axShouldShowKeyboard;
- (BOOL)_shouldMinimizeForHardwareKeyboard;
- (UIKeyboardImplAccessibility)initWithFrame:(CGRect)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_accessibilityAnnounceHardwareKeyboardVisibilityChange:(BOOL)a3;
- (void)_axShowKeyboardIfHidden;
- (void)_showKeyboardIgnoringPolicyDelegate:(BOOL)a3;
- (void)dismissKeyboard;
- (void)hideKeyboard;
- (void)showKeyboardIfNeeded;
- (void)updateAutocorrectPrompt:(id)a3;
- (void)updateTextCandidateView;
@end

@implementation UIKeyboardImplAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardImpl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v13 = location;
  id v12 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = "{CGRect={CGPoint=dd}{CGSize=dd}}";
  v10 = @"UIKeyboardImpl";
  v6 = @"initWithFrame:";
  v9 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  [location[0] validateClass:v10 hasInstanceVariable:@"m_geometryDelegate" withType:"<UIKeyboardImplGeometryDelegate>"];
  v3 = @"UIKeyboardImplGeometryDelegate";
  objc_msgSend(location[0], "validateProtocol:hasRequiredInstanceMethod:");
  [location[0] validateProtocol:v3 hasRequiredInstanceMethod:@"isMinimized"];
  v5 = @"UIView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v10);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, v6, v9, v4, 0);
  v7 = "B";
  [location[0] validateClass:v10 hasInstanceMethod:@"showsCandidateBar" withFullSignature:0];
  v11 = "v";
  [location[0] validateClass:v10 hasInstanceMethod:@"showKeyboard" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"showKeyboardIfNeeded", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"hideKeyboard", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_showKeyboardIgnoringPolicyDelegate:", v11, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"candidateController", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_shouldMinimizeForHardwareKeyboard", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardCandidateController", @"activeViews", v9, 0);
  v8 = @"UIKeyboardInputModeController";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"suggestedInputModesForPreferredLanguages", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardInputMode", @"identifier", v9, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v10, @"sharedInstance", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"setInputModeFromPreferences", v11, 0);
  objc_storeStrong(v13, v12);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v27 = a3;
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if (([(UIKeyboardImplAccessibility *)v26 safeBoolForKey:@"showsCandidateBar"] & 1) == 0) {
    goto LABEL_6;
  }
  char v23 = 0;
  objc_opt_class();
  id v11 = (id)[(UIKeyboardImplAccessibility *)v26 safeValueForKey:@"candidateController"];
  id v10 = (id)[v11 safeValueForKey:@"activeViews"];
  id v22 = (id)__UIAccessibilityCastAsClass();

  id v21 = v22;
  objc_storeStrong(&v22, 0);
  id v24 = v21;
  char v19 = 0;
  objc_opt_class();
  id v9 = (id)[v24 firstObject];
  id v18 = (id)__UIAccessibilityCastAsClass();

  id v17 = v18;
  objc_storeStrong(&v18, 0);
  id v20 = v17;
  -[UIKeyboardImplAccessibility convertPoint:toView:](v26, "convertPoint:toView:", v17, v27.x, v27.y);
  double v14 = v4;
  double v15 = v5;
  id v16 = (id)objc_msgSend(v17, "_accessibilityHitTest:withEvent:", location[0], v4, v5);
  if ([v16 isAccessibilityElement])
  {
    id v28 = v16;
    int v13 = 1;
  }
  else
  {
    int v13 = 0;
  }
  id obj = 0;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v24, 0);
  if (!v13)
  {
LABEL_6:
    v12.receiver = v26;
    v12.super_class = (Class)UIKeyboardImplAccessibility;
    id v28 = -[UIKeyboardImplAccessibility _accessibilityHitTest:withEvent:](&v12, sel__accessibilityHitTest_withEvent_, location[0], v27.x, v27.y, obj);
    int v13 = 1;
  }
  objc_storeStrong(location, 0);
  v6 = v28;

  return v6;
}

- (UIKeyboardImplAccessibility)initWithFrame:(CGRect)a3
{
  CGRect v8 = a3;
  SEL v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardImplAccessibility;
  v7 = -[UIKeyboardImplAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v7, v7);
  [(UIKeyboardImplAccessibility *)v7 _accessibilityLoadAccessibilityInformation];
  double v4 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v4;
}

- (void)updateAutocorrectPrompt:(id)a3
{
  CGRect v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)UIKeyboardImplAccessibility;
  [(UIKeyboardImplAccessibility *)&v6 updateAutocorrectPrompt:location[0]];
  id v4 = (id)[location[0] candidate];
  id v3 = (id)[location[0] input];
  char v5 = objc_msgSend(v4, "isEqualToString:");

  if ((v5 & 1) == 0) {
    UIAccessibilityPostNotification(*MEMORY[0x263F81200], 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_showKeyboardIgnoringPolicyDelegate:(BOOL)a3
{
  id v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  id v3 = (id)[(id)*MEMORY[0x263F1D020] _accessibilityValueForKey:@"AXShowOnscreenKeyboardWithBraille"];
  LOBYTE(v4) = 0;
  if (v3) {
    int v4 = [(id)*MEMORY[0x263F1D020] _accessibilityBoolValueForKey:@"AXShowOnscreenKeyboardWithBraille"] ^ 1;
  }

  if ((v4 & 1) == 0)
  {
    id v7 = (id)[(UIKeyboardImplAccessibility *)v10 safeValueForKey:@"m_geometryDelegate"];
    char v6 = [v7 safeBoolForKey:@"isMinimized"] & 1;
    v5.receiver = v10;
    v5.super_class = (Class)UIKeyboardImplAccessibility;
    [(UIKeyboardImplAccessibility *)&v5 _showKeyboardIgnoringPolicyDelegate:v8];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    [(UIKeyboardImplAccessibility *)v10 _accessibilityAnnounceHardwareKeyboardVisibilityChange:v6 & 1];
    objc_storeStrong(&v7, 0);
  }
}

- (void)hideKeyboard
{
  id v7 = self;
  v6[1] = (id)a2;
  id v2 = (id)[(id)*MEMORY[0x263F1D020] _accessibilityValueForKey:@"AXShowOnscreenKeyboardWithBraille"];
  char v3 = 0;
  if (v2) {
    char v3 = [(id)*MEMORY[0x263F1D020] _accessibilityBoolValueForKey:@"AXShowOnscreenKeyboardWithBraille"];
  }

  if ((v3 & 1) == 0)
  {
    v6[0] = (id)[(UIKeyboardImplAccessibility *)v7 safeValueForKey:@"m_geometryDelegate"];
    char v5 = [v6[0] safeBoolForKey:@"isMinimized"] & 1;
    v4.receiver = v7;
    v4.super_class = (Class)UIKeyboardImplAccessibility;
    [(UIKeyboardImplAccessibility *)&v4 hideKeyboard];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    [(UIKeyboardImplAccessibility *)v7 _accessibilityAnnounceHardwareKeyboardVisibilityChange:v5 & 1];
    objc_storeStrong(v6, 0);
  }
}

- (void)dismissKeyboard
{
  char v5 = self;
  v4[1] = (id)a2;
  v4[0] = (id)[(UIKeyboardImplAccessibility *)self safeValueForKey:@"m_geometryDelegate"];
  char v3 = [v4[0] safeBoolForKey:@"isMinimized"] & 1;
  v2.receiver = v5;
  v2.super_class = (Class)UIKeyboardImplAccessibility;
  [(UIKeyboardImplAccessibility *)&v2 dismissKeyboard];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  [(UIKeyboardImplAccessibility *)v5 _accessibilityAnnounceHardwareKeyboardVisibilityChange:v3 & 1];
  objc_storeStrong(v4, 0);
}

- (void)_accessibilityAnnounceHardwareKeyboardVisibilityChange:(BOOL)a3
{
  id v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  id location = (id)[(UIKeyboardImplAccessibility *)self safeValueForKey:@"m_geometryDelegate"];
  if ([location safeBoolForKey:@"isActive"])
  {
    char v7 = [location safeBoolForKey:@"isMinimized"] & 1;
    if (!v7 || v9)
    {
      if ((v7 & 1) == 0 && v9)
      {
        UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
        id v4 = (id)accessibilityUIKitLocalizedString();
        UIAccessibilityPostNotification(v3, v4);
      }
    }
    else
    {
      UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
      id v6 = (id)accessibilityUIKitLocalizedString();
      UIAccessibilityPostNotification(notification, v6);
    }
  }
  objc_storeStrong(&location, 0);
}

- (void)updateTextCandidateView
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardImplAccessibility;
  [(UIKeyboardImplAccessibility *)&v2 updateTextCandidateView];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A08]);
}

- (void)showKeyboardIfNeeded
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardImplAccessibility;
  [(UIKeyboardImplAccessibility *)&v2 showKeyboardIfNeeded];
  if (-[UIKeyboardImplAccessibility _axShouldShowKeyboard]((uint64_t)v4)) {
    -[UIKeyboardImplAccessibility _axShowKeyboardIfHidden](v4);
  }
}

- (BOOL)_axShouldShowKeyboard
{
  return a1 && UIAccessibilityIsSwitchControlRunning();
}

- (void)_axShowKeyboardIfHidden
{
  id v4 = a1;
  if (a1)
  {
    id v1 = (id)[v4 safeValueForKey:@"m_geometryDelegate"];
    char v2 = [v1 safeBoolForKey:@"isMinimized"];

    if (v2)
    {
      id v3 = v4;
      AXPerformSafeBlock();
      objc_storeStrong(&v3, 0);
    }
  }
}

- (BOOL)_shouldMinimizeForHardwareKeyboard
{
  char v5 = self;
  SEL v4 = a2;
  if (-[UIKeyboardImplAccessibility _axShouldShowKeyboard]((uint64_t)self)) {
    return 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)UIKeyboardImplAccessibility;
  return [(UIKeyboardImplAccessibility *)&v3 _shouldMinimizeForHardwareKeyboard];
}

uint64_t __54__UIKeyboardImplAccessibility__axShowKeyboardIfHidden__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showKeyboard", a1, a1);
}

@end