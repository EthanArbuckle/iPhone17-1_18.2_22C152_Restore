@interface UIDictationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_axNotifyDictationStarted;
- (void)_axNotifyDictationStopped;
- (void)_createDictationPresenterWindowIfNecessary;
- (void)insertSerializedDictationResult:(id)a3 withCorrectionIdentifier:(id)a4;
- (void)setState:(int)a3;
- (void)updateLastHypothesis:(id)a3 WithNewHypothesis:(id)a4;
@end

@implementation UIDictationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIDictationController";
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
  v6 = "@";
  v5 = @"UIDictationController";
  v4 = "v";
  [location[0] validateClass:"@" hasInstanceMethod:"@" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"updateLastHypothesis:WithNewHypothesis:", v4, v6, v6, 0);
  v3 = "i";
  [location[0] validateClass:v5 hasInstanceMethod:@"state" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"setState:", v4, v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"targetHypothesis", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"lastHypothesis", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_createDictationPresenterWindowIfNecessary", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"dictationPresenterWindow", v6, 0);
  v7 = @"UIDictationSerializableResults";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  [location[0] validateClass:v7];
  objc_storeStrong(v9, v8);
}

- (void)setState:(int)a3
{
  id v8 = self;
  SEL v7 = a2;
  unsigned int v6 = a3;
  if (a3)
  {
    uint64_t v4 = a3;
    char v3 = 1;
  }
  else
  {
    uint64_t v4 = 0;
    char v3 = 0;
  }
  if ((v3 & 1) == 0)
  {
    switch(v4)
    {
      case 0:
      case 6:
        [(UIDictationControllerAccessibility *)v8 _axNotifyDictationStopped];
        break;
      case 1:
      case 3:
      case 4:
      case 5:
        break;
      case 2:
        [(UIDictationControllerAccessibility *)v8 _axNotifyDictationStarted];
        break;
      default:
        JUMPOUT(0);
    }
  }
  v5.receiver = v8;
  v5.super_class = (Class)UIDictationControllerAccessibility;
  [(UIDictationControllerAccessibility *)&v5 setState:v6];
}

- (void)_axNotifyDictationStarted
{
}

- (void)_axNotifyDictationStopped
{
}

- (void)updateLastHypothesis:(id)a3 WithNewHypothesis:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)UIDictationControllerAccessibility;
  [(UIDictationControllerAccessibility *)&v5 updateLastHypothesis:location[0] WithNewHypothesis:v6];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)insertSerializedDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v35 = 0;
  objc_storeStrong(&v35, a4);
  if (AXProcessIsInputUI())
  {
    v34.receiver = v37;
    v34.super_class = (Class)UIDictationControllerAccessibility;
    [(UIDictationControllerAccessibility *)&v34 insertSerializedDictationResult:location[0] withCorrectionIdentifier:v35];
    int v33 = 1;
  }
  else
  {
    id v32 = (id)[location[0] safeStringForKey:@"bestText"];
    if (!v32)
    {
      char v31 = 0;
      objc_opt_class();
      id v16 = (id)[(UIDictationControllerAccessibility *)v37 safeValueForKey:@"targetHypothesis"];
      id v30 = (id)__UIAccessibilityCastAsClass();

      id v29 = v30;
      objc_storeStrong(&v30, 0);
      id v4 = v32;
      id v32 = v29;

      if (!v32)
      {
        char v28 = 0;
        objc_opt_class();
        id v15 = (id)[(UIDictationControllerAccessibility *)v37 safeValueForKey:@"lastHypothesis"];
        id v27 = (id)__UIAccessibilityCastAsClass();

        id v26 = v27;
        objc_storeStrong(&v27, 0);
        id v5 = v32;
        id v32 = v26;
      }
    }
    if (v32)
    {
      v11 = NSString;
      id v12 = accessibilityLocalizedString(@"inserted.text");
      id v25 = (id)[v11 stringWithFormat:v32];

      id v13 = (id)[(id)*MEMORY[0x263F1D020] _accessibilityResponderElement];
      uint64_t v6 = [v13 accessibilityTraits];
      BOOL v14 = (v6 & *MEMORY[0x263F813D8]) != *MEMORY[0x263F813D8];

      if (!v14)
      {
        v9 = NSString;
        id v10 = accessibilityLocalizedString(@"secure.dictation.characters.count");
        id v7 = (id)objc_msgSend(v9, "localizedStringWithFormat:", v10, objc_msgSend(v32, "length"));
        id v8 = v25;
        id v25 = v7;
      }
      uint64_t v19 = MEMORY[0x263EF8330];
      int v20 = -1073741824;
      int v21 = 0;
      v22 = __95__UIDictationControllerAccessibility_insertSerializedDictationResult_withCorrectionIdentifier___block_invoke;
      v23 = &unk_2650ADF18;
      id v24 = v25;
      AXPerformBlockOnMainThreadAfterDelay();
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v25, 0);
    }
    MEMORY[0x2455E6B10](1005);
    v18.receiver = v37;
    v18.super_class = (Class)UIDictationControllerAccessibility;
    [(UIDictationControllerAccessibility *)&v18 insertSerializedDictationResult:location[0] withCorrectionIdentifier:v35];
    objc_storeStrong(&v32, 0);
    int v33 = 0;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

void __95__UIDictationControllerAccessibility_insertSerializedDictationResult_withCorrectionIdentifier___block_invoke(void *a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  argument[2] = a1;
  argument[1] = a1;
  id v3 = objc_allocWithZone(MEMORY[0x263F086A0]);
  uint64_t v2 = a1[4];
  v6[0] = *MEMORY[0x263F216D8];
  v7[0] = &unk_26F48EA20;
  v6[1] = *MEMORY[0x263F21728];
  v7[1] = MEMORY[0x263EFFA88];
  id v4 = (id)[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  argument[0] = (id)objc_msgSend(v3, "initWithString:attributes:", v2);

  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument[0]);
  objc_storeStrong(argument, 0);
}

- (void)_createDictationPresenterWindowIfNecessary
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIDictationControllerAccessibility;
  [(UIDictationControllerAccessibility *)&v3 _createDictationPresenterWindowIfNecessary];
  id v2 = (id)[(UIDictationControllerAccessibility *)v5 safeValueForKey:@"dictationPresenterWindow"];
  [v2 setAccessibilityViewIsModal:1];
}

@end