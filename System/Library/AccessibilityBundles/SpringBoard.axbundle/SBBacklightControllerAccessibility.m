@interface SBBacklightControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
+ (void)isIdling;
- (BOOL)screenIsDim;
- (float)_factorToPublishForBacklightState:(int64_t)a3;
- (void)setBacklightState:(int64_t)a3 source:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6;
@end

@implementation SBBacklightControllerAccessibility

- (BOOL)screenIsDim
{
  if (_SBAXScreenCurtainEnabled && *(float *)&_SBAXRealBacklightFactor != 0.0) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SBBacklightControllerAccessibility;
  return [(SBBacklightControllerAccessibility *)&v3 screenIsDim];
}

+ (id)safeCategoryTargetClassName
{
  return @"SBBacklightController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBBacklightController", @"setBacklightState:source:animated:completion:", "v", "q", "q", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBBacklightControllerAccessibility", @"_factorToPublishForBacklightState:", "f", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBBacklightController", @"screenIsOn", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBBacklightController", @"screenIsOn", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBBacklightController", @"screenIsDim", "B", 0);
}

+ (void)isIdling
{
  IsIdling = 1;
}

- (float)_factorToPublishForBacklightState:(int64_t)a3
{
  if (a3 == 2) {
    return 0.02;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBBacklightControllerAccessibility;
  -[SBBacklightControllerAccessibility _factorToPublishForBacklightState:](&v4, sel__factorToPublishForBacklightState_);
  return result;
}

- (void)setBacklightState:(int64_t)a3 source:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  v11 = (void *)MEMORY[0x2456635C0]();
  uint64_t v32 = 0;
  v33 = (float *)&v32;
  uint64_t v34 = 0x2020000000;
  int v35 = 0;
  uint64_t v25 = MEMORY[0x263EF8330];
  uint64_t v26 = 3221225472;
  v27 = __83__SBBacklightControllerAccessibility_setBacklightState_source_animated_completion___block_invoke;
  v28 = &unk_265153FB0;
  v29 = self;
  v30 = &v32;
  int64_t v31 = a3;
  AXPerformSafeBlock();
  float v12 = v33[6];
  _Block_object_dispose(&v32, 8);
  if (v12 == 1.0)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __83__SBBacklightControllerAccessibility_setBacklightState_source_animated_completion___block_invoke_2;
    v22[3] = &unk_2651547C0;
    int64_t v24 = a4;
    id v23 = v10;
    uint64_t v13 = MEMORY[0x2456635C0](v22);

    v11 = (void *)v13;
  }
  BOOL v14 = fabs(v12 + -0.02) >= 0.001 && _SBAXScreenCurtainEnabled == 0;
  if (v14 || IsIdling != 1)
  {
    char v16 = 0;
    goto LABEL_12;
  }
  if ((setBacklightState_source_animated_completion___AXShouldSpeakNextDimmedMessage & 1) == 0
    && UIAccessibilityIsVoiceOverRunning())
  {
    v15 = [MEMORY[0x263F22968] server];
    [v15 isMediaPlayingForApp:0 completionHandler:&__block_literal_global_21];

    char v16 = 1;
LABEL_12:
    setBacklightState_source_animated_completion___AXShouldSpeakNextDimmedMessage = v16;
  }
  IsIdling = 0;
  int v17 = setBacklightState_source_animated_completion__wasEnabled;
  int v18 = _SBAXScreenCurtainEnabled;
  if (setBacklightState_source_animated_completion__wasEnabled != _SBAXScreenCurtainEnabled) {
    setBacklightState_source_animated_completion__wasEnabled = _SBAXScreenCurtainEnabled;
  }
  _SBAXRealBacklightFactor = LODWORD(v12);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    if (!_SBAXScreenCurtainEnabled || v12 == 0.0)
    {
      -[SBBacklightControllerAccessibility setBacklightState:source:animated:completion:](&v19, sel_setBacklightState_source_animated_completion_, a3, a4, v6, v11, self, SBBacklightControllerAccessibility);
    }
    else
    {
      v20.receiver = self;
      v20.super_class = (Class)SBBacklightControllerAccessibility;
      [(SBBacklightControllerAccessibility *)&v20 setBacklightState:2 source:a4 animated:v17 != v18 completion:v11];
      BKSHIDServicesSetBacklightFactorPending();
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)SBBacklightControllerAccessibility;
    -[SBBacklightControllerAccessibility setBacklightState:source:animated:completion:](&v21, sel_setBacklightState_source_animated_completion_, a3, a4, v6, v11, v19.receiver, v19.super_class);
  }
}

uint64_t __83__SBBacklightControllerAccessibility_setBacklightState_source_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _factorToPublishForBacklightState:*(void *)(a1 + 48)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

void __83__SBBacklightControllerAccessibility_setBacklightState_source_animated_completion___block_invoke_2(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 == 20 || v2 == 9)
  {
    UIAccessibilityPostNotification(0x41Au, 0);
    uint64_t v2 = *(void *)(a1 + 40);
  }
  if (v2 == 14) {
    objc_super v4 = (id *)MEMORY[0x263F21AD0];
  }
  else {
    objc_super v4 = (id *)MEMORY[0x263F21AC8];
  }
  id v5 = *v4;
  uint64_t v8 = *MEMORY[0x263F21AC0];
  v9[0] = v5;
  BOOL v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  UIAccessibilityPostNotification(*MEMORY[0x263F81330], v6);
  if (*(void *)(a1 + 40) != 14) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A78]);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

void __83__SBBacklightControllerAccessibility_setBacklightState_source_animated_completion___block_invoke_3(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    int v3 = (void *)MEMORY[0x263F21660];
    objc_super v4 = accessibilityLocalizedString(@"screen.dimmed");
    id argument = [v3 axAttributedStringWithString:v4];

    [argument setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21860]];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
  }
}

@end