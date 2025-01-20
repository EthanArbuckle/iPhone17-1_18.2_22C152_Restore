@interface UIKeyboardAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityKeyboardIsContinuousPathAvailable;
- (BOOL)_accessibilityKeyboardIsContinuousPathTracking;
- (BOOL)_accessibilityKeyboardSupportsGestureMode;
- (BOOL)_accessibilityTriggerDictationFromPath:(id)a3;
- (BOOL)_axAdvanceInternationalKeyboard:(uint64_t)a1;
- (BOOL)_axAdvanceKeyboardPlane:(uint64_t)a1;
- (BOOL)_axAdvanceKeyboardSuggestion:(uint64_t)a1;
- (BOOL)_axCommitWord;
- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5;
- (BOOL)canBecomeFocused;
- (CGRect)_accessibilityDirectInteractionFrame;
- (CGRect)accessibilityFrame;
- (id)_accessibilityNativeFocusPreferredElement;
- (uint64_t)_accessibilitySwitchToGestureMode:(void *)a1;
- (uint64_t)_axDeleteByCharacter;
- (uint64_t)_axDeleteByWord;
- (uint64_t)_axEnterTextValue:(uint64_t)a1;
- (uint64_t)_axShift;
- (uint64_t)_axShiftLock;
- (unint64_t)_accessibilityAutomationType;
- (void)_voiceOverStatus:(id)a3;
- (void)activate;
- (void)deactivate;
- (void)dealloc;
- (void)dictationRecognitionFailed;
- (void)insertDictationResult:(id)a3;
@end

@implementation UIKeyboardAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboard";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v14 = location;
  id v13 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateProtocol:@"UITextInput_Internal" hasRequiredInstanceMethod:@"_deleteByWord"];
  v9 = "B";
  v7 = @"UIKeyboardImpl";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "B", 0);
  v8 = @"UIKeyboardLayoutStar";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v12 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKBKeyplaneView", @"viewForKey:", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKBRecentInputsView", @"collectionView", v12, 0);
  v3 = @"UIKeyboard";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  [location[0] validateClass:@"UIKBLinearCandidateView"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"candidateController", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardCandidateController", @"activeViews", v12, 0);
  v4 = @"_UIRemoteKeyboards";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v3, @"usesInputSystemUI", v9, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v4, @"sharedRemoteKeyboards", v12, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v4, @"enabled", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"keyboardWindow", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"keyboardVisible", v9, 0);
  v6 = @"UIInputWindowController";
  v5 = "{CGRect={CGPoint=dd}{CGSize=dd}}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"visibleInputViewFrame", v5, 0);
  [location[0] validateClass:@"UIRemoteKeyboardWindow"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"inputViewSet", v12, 0);
  v10 = @"UIInputViewSet";
  v11 = @"inputView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  [location[0] validateClass:v7 hasInstanceVariable:@"m_layout" withType:"UIKeyboardLayout"];
  [location[0] validateClass:v8 hasInstanceVariable:@"_typingStyleEstimator" withType:"UIKeyboardTypingStyleEstimator"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_allowContinuousPathUI", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardSceneDelegate", @"inputViews", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"isInputViewPlaceholder", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, v11, v12, 0);
  objc_storeStrong(v14, v13);
}

- (BOOL)_accessibilityKeyboardIsContinuousPathTracking
{
  id v5 = (id)[MEMORY[0x263F1C738] activeInstance];
  id v4 = (id)[v5 safeValueForKey:@"m_layout"];
  id v3 = (id)[v4 safeValueForKey:@"_typingStyleEstimator"];
  char v6 = [v3 _accessibilityKeyboardIsContinuousPathTracking];

  return v6 & 1;
}

- (unint64_t)_accessibilityAutomationType
{
  return 19;
}

- (BOOL)_accessibilityKeyboardIsContinuousPathAvailable
{
  id v4 = (id)[MEMORY[0x263F1C738] activeInstance];
  id v3 = (id)[v4 safeValueForKey:@"m_layout"];
  char v5 = [v3 safeBoolForKey:@"_allowContinuousPathUI"];

  return v5 & 1;
}

- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  v16 = self;
  SEL v15 = a2;
  unsigned int v14 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  unsigned int v12 = a5;
  if (v14 <= 0xA28)
  {
    uint64_t v6 = v14 - 2600;
    char v5 = 0;
  }
  else
  {
    uint64_t v6 = v14 - 2600;
    char v5 = 1;
  }
  if (v5)
  {
    v10.receiver = v16;
    v10.super_class = (Class)UIKeyboardAccessibility;
    char v17 = [(UIKeyboardAccessibility *)&v10 _iosAccessibilityPerformAction:v14 withValue:location fencePort:v12];
    int v11 = 1;
  }
  else
  {
    switch(v6)
    {
      case 0:
        char v17 = -[UIKeyboardAccessibility _axDeleteByCharacter](v16) & 1;
        int v11 = 1;
        break;
      case 1:
        char v17 = -[UIKeyboardAccessibility _axDeleteByWord](v16) & 1;
        int v11 = 1;
        break;
      case 2:
      case 3:
        char v17 = -[UIKeyboardAccessibility _axAdvanceKeyboardPlane:]((uint64_t)v16);
        int v11 = 1;
        break;
      case 4:
        char v17 = -[UIKeyboardAccessibility _axCommitWord]((uint64_t)v16);
        int v11 = 1;
        break;
      case 5:
        char v17 = -[UIKeyboardAccessibility _axEnterTextValue:]((uint64_t)v16, location) & 1;
        int v11 = 1;
        break;
      case 6:
      case 7:
        char v17 = -[UIKeyboardAccessibility _axAdvanceKeyboardSuggestion:]((uint64_t)v16);
        int v11 = 1;
        break;
      case 8:
        char v17 = -[UIKeyboardAccessibility _axAdvanceInternationalKeyboard:]((uint64_t)v16);
        int v11 = 1;
        break;
      case 9:
        char v17 = -[UIKeyboardAccessibility _axShift](v16) & 1;
        int v11 = 1;
        break;
      case 10:
        char v17 = -[UIKeyboardAccessibility _axShiftLock](v16) & 1;
        int v11 = 1;
        break;
      case 11:
        v8 = v16;
        [location BOOLValue];
        char v17 = -[UIKeyboardAccessibility _accessibilitySwitchToGestureMode:](v8) & 1;
        int v11 = 1;
        break;
      default:
        JUMPOUT(0);
    }
  }
  objc_storeStrong(&location, 0);
  return v17 & 1;
}

- (uint64_t)_axDeleteByCharacter
{
  v3[1] = a1;
  if (a1)
  {
    v3[0] = (id)[MEMORY[0x263F1C738] activeInstance];
    id v2 = v3[0];
    AXPerformSafeBlock();
    char v4 = 1;
    objc_storeStrong(&v2, 0);
    objc_storeStrong(v3, 0);
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (uint64_t)_axDeleteByWord
{
  v4[1] = a1;
  if (a1)
  {
    v4[0] = (id)[MEMORY[0x263F1C738] activeInstance];
    id v3 = (id)[v4[0] inputDelegate];
    id v1 = (id)[v3 safeValueForKey:@"_deleteByWord"];

    char v5 = 1;
    objc_storeStrong(v4, 0);
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (BOOL)_axAdvanceKeyboardPlane:(uint64_t)a1
{
  return a1 != 0;
}

- (BOOL)_axCommitWord
{
  return a1 != 0;
}

- (uint64_t)_axEnterTextValue:(uint64_t)a1
{
  uint64_t v6 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = (id)[MEMORY[0x263F1C738] activeInstance];
      [v3 addInputString:location];
      char v7 = 1;
      int v4 = 1;
      objc_storeStrong(&v3, 0);
    }
    else
    {
      char v7 = 0;
      int v4 = 1;
    }
  }
  else
  {
    char v7 = 0;
    int v4 = 1;
  }
  objc_storeStrong(&location, 0);
  return v7 & 1;
}

- (BOOL)_axAdvanceKeyboardSuggestion:(uint64_t)a1
{
  return a1 != 0;
}

- (BOOL)_axAdvanceInternationalKeyboard:(uint64_t)a1
{
  return a1 != 0;
}

- (uint64_t)_axShift
{
  v2[1] = a1;
  if (a1)
  {
    v2[0] = (id)[MEMORY[0x263F1C738] activeInstance];
    objc_msgSend(v2[0], "setShift:", (objc_msgSend(v2[0], "isShifted") ^ 1) & 1);
    char v3 = 1;
    objc_storeStrong(v2, 0);
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

- (uint64_t)_axShiftLock
{
  v2[1] = a1;
  if (a1)
  {
    v2[0] = (id)[MEMORY[0x263F1C738] activeInstance];
    objc_msgSend(v2[0], "setShiftLocked:", (objc_msgSend(v2[0], "isShiftLocked") ^ 1) & 1);
    char v3 = 1;
    objc_storeStrong(v2, 0);
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

- (uint64_t)_accessibilitySwitchToGestureMode:(void *)a1
{
  if (a1)
  {
    if (([a1 _accessibilityBoolValueForKey:@"VORegistered"] & 1) == 0)
    {
      id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
      [v2 addObserver:a1 selector:sel__voiceOverStatus_ name:*MEMORY[0x263F1CF90] object:0];

      [a1 _accessibilitySetBoolValue:1 forKey:@"VORegistered"];
    }
    char v4 = 1;
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

uint64_t __47__UIKeyboardAccessibility__axDeleteByCharacter__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteBackwardAndNotify:", 1, a1, a1);
}

- (void)dealloc
{
  char v5 = self;
  SEL v4 = a2;
  id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:v5 name:*MEMORY[0x263F1CF90] object:0];

  v3.receiver = v5;
  v3.super_class = (Class)UIKeyboardAccessibility;
  [(UIKeyboardAccessibility *)&v3 dealloc];
}

- (void)deactivate
{
  SEL v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardAccessibility;
  [(UIKeyboardAccessibility *)&v2 deactivate];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)activate
{
  SEL v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardAccessibility;
  [(UIKeyboardAccessibility *)&v2 activate];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (BOOL)_accessibilityKeyboardSupportsGestureMode
{
  return 1;
}

- (BOOL)_accessibilityTriggerDictationFromPath:(id)a3
{
  unsigned int v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v10 = 0;
  id v9 = (id)[MEMORY[0x263F1C748] sharedInputModeController];
  if (v9)
  {
    [v9 setDelegate:v12];
    id v5 = (id)[v9 currentInputMode];
    id v8 = (id)[v5 primaryLanguage];

    id v6 = v9;
    id v7 = (id)[NSURL fileURLWithPath:location[0] isDirectory:0];
    objc_msgSend(v6, "startDictationConnectionForFileAtURL:forInputModeIdentifier:");

    char v10 = 1;
    objc_storeStrong(&v8, 0);
  }
  char v4 = v10;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (void)insertDictationResult:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (id)[MEMORY[0x263F1C748] sharedInputModeController];
  [v3 setDelegate:0];
  UIAccessibilityPostNotification(*MEMORY[0x263F81290], 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(location, 0);
}

- (void)dictationRecognitionFailed
{
  id v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = (id)[MEMORY[0x263F1C748] sharedInputModeController];
  objc_msgSend(v4[0], "setDelegate:");
  UIAccessibilityNotifications notification = *MEMORY[0x263F81290];
  id v3 = (id)[NSNumber numberWithInteger:0];
  UIAccessibilityPostNotification(notification, v3);

  objc_storeStrong(v4, 0);
}

- (CGRect)accessibilityFrame
{
  v55 = self;
  SEL v54 = a2;
  id v30 = (id)[MEMORY[0x263F1C748] sharedInputModeController];
  id v29 = (id)[v30 currentInputMode];
  char v31 = [v29 isExtensionInputMode];

  char v53 = v31 & 1;
  char v52 = [NSClassFromString(&cfstr_Uiremotekeyboa_5.isa) safeBoolForKey:@"enabled"] & 1;
  char v51 = 1;
  id v34 = (id)[MEMORY[0x263F1C850] sharedInstance];
  id v33 = (id)[v34 safeValueForKey:@"containerRootController"];
  id v32 = (id)[v33 safeValueForKey:@"inputViewSet"];
  id v50 = (id)[v32 safeUIViewForKey:@"inputView"];

  if ((v52 & 1) == 0 || (NSClassFromString(&cfstr_Uiremotekeyboa_2.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!v50) {
      char v51 = 0;
    }
    goto LABEL_17;
  }
  id v49 = (id)[v50 safeUIViewForKey:@"placeheldView"];
  NSClassFromString(&cfstr_Uikbcompatinpu.isa);
  if (objc_opt_isKindOfClass())
  {
    id location = (id)[v49 safeUIViewForKey:@"touchableView"];
    id v27 = (id)[MEMORY[0x263F1C710] activeKeyboard];
    char v46 = 0;
    BOOL v28 = 1;
    if (location == v27)
    {
      id v47 = (id)[MEMORY[0x263F1C710] activeKeyboard];
      char v46 = 1;
      BOOL v28 = v47 == 0;
    }
    char v51 = v28;
    if (v46) {

    }
    objc_storeStrong(&location, 0);
  }
  [v50 frame];
  uint64_t v42 = v3;
  uint64_t v43 = v4;
  double v44 = v2;
  uint64_t v45 = v5;
  double v6 = v2;
  if (v2 > 1.0 && (objc_msgSend(v50, "frame", v2), v38 = v7, v39 = v8, v40 = v9, v41 = v10, double v6 = v10, v10 > 1.0))
  {
    int v36 = 0;
  }
  else
  {
    v37.receiver = v55;
    v37.super_class = (Class)UIKeyboardAccessibility;
    [(UIKeyboardAccessibility *)&v37 accessibilityFrame];
    double v56 = v11;
    double v57 = v12;
    double v58 = v13;
    double v59 = v14;
    int v36 = 1;
  }
  objc_storeStrong(&v49, 0);
  if (!v36)
  {
LABEL_17:
    if (v53 & 1) != 0 || (v52 & 1) != 0 && (v51)
    {
      AXUIKeyboardScreenFrame();
      double v56 = v15;
      double v57 = v16;
      double v58 = v17;
      double v59 = v18;
      int v36 = 1;
    }
    else
    {
      v35.receiver = v55;
      v35.super_class = (Class)UIKeyboardAccessibility;
      [(UIKeyboardAccessibility *)&v35 accessibilityFrame];
      double v56 = v19;
      double v57 = v20;
      double v58 = v21;
      double v59 = v22;
      int v36 = 1;
    }
  }
  objc_storeStrong(&v50, 0);
  double v23 = v56;
  double v24 = v57;
  double v25 = v58;
  double v26 = v59;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGRect)_accessibilityDirectInteractionFrame
{
  id v11 = (id)[MEMORY[0x263F1C738] activeInstance];
  id v10 = (id)[v11 safeValueForKey:@"m_layout"];
  [v10 accessibilityFrame];
  double v12 = v2;
  double v13 = v3;
  double v14 = v4;
  double v15 = v5;

  double v6 = v12;
  double v7 = v13;
  double v8 = v14;
  double v9 = v15;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)_voiceOverStatus:(id)a3
{
  double v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!UIAccessibilityIsVoiceOverRunning()) {
    -[UIKeyboardAccessibility _accessibilitySwitchToGestureMode:](v4);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)canBecomeFocused
{
  double v5 = self;
  SEL v4 = a2;
  if ([(UIKeyboardAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 0; {
  v3.receiver = v5;
  }
  v3.super_class = (Class)UIKeyboardAccessibility;
  return [(UIKeyboardAccessibility *)&v3 canBecomeFocused];
}

- (id)_accessibilityNativeFocusPreferredElement
{
  double v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardAccessibility;
  return [(UIKeyboardAccessibility *)&v3 _accessibilityNativeFocusPreferredElement];
}

@end