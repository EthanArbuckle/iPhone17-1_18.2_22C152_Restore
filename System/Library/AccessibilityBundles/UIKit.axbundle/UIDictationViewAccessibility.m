@interface UIDictationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)endpointButtonPressed;
- (void)finishReturnToKeyboard;
- (void)setState:(int)a3;
@end

@implementation UIDictationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIDictationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  id v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = @"UIDictationView";
  v7 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v3 = @"UIKeyboardImpl";
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", 0);
  [location[0] validateClass:v3 hasInstanceVariable:@"m_layout" withType:"UIKeyboardLayout"];
  v4 = @"UIKeyboardLayoutStar";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_accessibilityKeys", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_accessibilityKeyElementForKey:", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"setState:", v7, "i", 0);
  objc_storeStrong(v9, v8);
}

- (void)setState:(int)a3
{
  v13 = self;
  SEL v12 = a2;
  int v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIDictationViewAccessibility;
  [(UIDictationViewAccessibility *)&v10 setState:a3];
  BOOL v9 = 0;
  BOOL v7 = 1;
  if (v11 != 3) {
    BOOL v7 = v11 == 4;
  }
  BOOL v9 = v7;
  id location = (id)[(UIDictationViewAccessibility *)v13 _accessibilityValueForKey:@"kAXDictationThinkingTimer"];
  if (v7)
  {
    if (!location || ([location isActive] & 1) == 0 && (objc_msgSend(location, "isPending") & 1) == 0)
    {
      id v5 = objc_alloc(MEMORY[0x263F21398]);
      id v6 = MEMORY[0x263EF83A0];
      v3 = objc_msgSend(v5, "initWithTargetSerialQueue:");
      id v4 = location;
      id location = v3;

      [location afterDelay:&__block_literal_global_17 processBlock:1.0];
      [(UIDictationViewAccessibility *)v13 _accessibilitySetRetainedValue:location forKey:@"kAXDictationThinkingTimer"];
    }
  }
  else
  {
    [location cancel];
    [(UIDictationViewAccessibility *)v13 _accessibilityRemoveValueForKey:@"kAXDictationThinkingTimer"];
  }
  objc_storeStrong(&location, 0);
}

void __41__UIDictationViewAccessibility_setState___block_invoke()
{
  UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
  id v1 = accessibilityLocalizedString(@"thinking.about.dictation");
  UIAccessibilityPostNotification(notification, v1);
}

- (void)endpointButtonPressed
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIDictationViewAccessibility;
  [(UIDictationViewAccessibility *)&v2 endpointButtonPressed];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)finishReturnToKeyboard
{
  v30 = self;
  SEL v29 = a2;
  v28.receiver = self;
  v28.super_class = (Class)UIDictationViewAccessibility;
  [(UIDictationViewAccessibility *)&v28 finishReturnToKeyboard];
  id v5 = (id)[MEMORY[0x263F1C738] activeInstance];
  id v27 = (id)[v5 safeValueForKey:@"m_layout"];

  uint64_t v20 = 0;
  v21 = &v20;
  int v22 = 838860800;
  int v23 = 48;
  v24 = __Block_byref_object_copy__8;
  v25 = __Block_byref_object_dispose__8;
  id v26 = 0;
  id v4 = (id)[v27 safeValueForKey:@"_accessibilityKeys"];
  v14[1] = (id)MEMORY[0x263EF8330];
  int v15 = -1073741824;
  int v16 = 0;
  v17 = __54__UIDictationViewAccessibility_finishReturnToKeyboard__block_invoke;
  v18 = &unk_2650AED78;
  v19 = &v20;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:");

  if (v21[5])
  {
    uint64_t v8 = 0;
    BOOL v9 = &v8;
    int v10 = 838860800;
    int v11 = 48;
    SEL v12 = __Block_byref_object_copy__8;
    v13 = __Block_byref_object_dispose__8;
    v14[0] = 0;
    v7[1] = &v8;
    v7[0] = v27;
    v7[2] = &v20;
    AXPerformSafeBlock();
    id v6 = (id)v9[5];
    objc_storeStrong(v7, 0);
    _Block_object_dispose(&v8, 8);
    objc_storeStrong(v14, 0);
    objc_super v2 = (void *)v21[5];
    v21[5] = (uint64_t)v6;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - -[UIApplicationAccessibility _accessibilityLastDictationMagicTapTime]((void *)*MEMORY[0x263F1D020]) > 2.0) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)v21[5]);
  }
  _Block_object_dispose(&v20, 8);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
}

void __54__UIDictationViewAccessibility_finishReturnToKeyboard__block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  char v9 = 0;
  char v7 = 0;
  BOOL v6 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v10 = (id)[location[0] properties];
    char v9 = 1;
    id v8 = (id)[v10 objectForKey:*MEMORY[0x263F1D3B0]];
    char v7 = 1;
    BOOL v6 = [v8 intValue] == 4;
  }
  if (v7) {

  }
  if (v9) {
  if (v6)
  }
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), location[0]);
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
}

void __54__UIDictationViewAccessibility_finishReturnToKeyboard__block_invoke_2(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _accessibilityKeyElementForKey:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  SEL v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

@end