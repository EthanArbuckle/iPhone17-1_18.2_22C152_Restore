@interface CAMFullscreenViewfinderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (double)_axChangeValue:(double)a3 increment:(BOOL)a4 borderHit:(BOOL *)a5;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_loadSmartStyleControlsIfNeeded;
- (void)axUpdateSliderValue:(CGPoint)a3 smartSliderType:(int64_t)a4 increment:(BOOL)a5;
- (void)setControlDrawerExpanded:(BOOL)a3 forReason:(int64_t)a4 animated:(BOOL)a5;
- (void)setImageAnalysisButtonVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setVisiblePreviewSuggestionButton:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMFullscreenViewfinderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMFullscreenViewfinder";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFullscreenViewfinder", @"setControlDrawerExpanded:forReason:animated:", "v", "B", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFullscreenViewfinder", @"controlDrawer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFullscreenViewfinder", @"_handleDirectionIndicatorTapped", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFullscreenViewfinder", @"isControlDrawerExpanded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFullscreenViewfinder", @"setImageAnalysisButtonVisible:animated:", "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFullscreenViewfinder", @"imageAnalysisButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFullscreenViewfinder", @"setVisiblePreviewSuggestionButton:animated:", "v", "q", "B", 0);
  [v3 validateClass:@"CAMViewfinderViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFullscreenViewfinder", @"_loadSmartStyleControlsIfNeeded", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_handleSmartStylePadValueChanged:", "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_currentSmartStyle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFullscreenViewfinder", @"smartStyleSlider2D", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFullscreenViewfinder", @"smartStyleIntensitySlider", "@", 0);
}

- (void)setControlDrawerExpanded:(BOOL)a3 forReason:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMFullscreenViewfinderAccessibility;
  [(CAMFullscreenViewfinderAccessibility *)&v9 setControlDrawerExpanded:a3 forReason:a4 animated:a5];
  if (v5)
  {
    UIAccessibilityNotifications v7 = *MEMORY[0x263F1CE68];
    v8 = [(CAMFullscreenViewfinderAccessibility *)self safeValueForKey:@"controlDrawer"];
    UIAccessibilityPostNotification(v7, v8);
  }
}

- (BOOL)accessibilityPerformEscape
{
  int v2 = [(CAMFullscreenViewfinderAccessibility *)self safeBoolForKey:@"isControlDrawerExpanded"];
  if (v2) {
    AXPerformSafeBlock();
  }
  return v2;
}

uint64_t __66__CAMFullscreenViewfinderAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDirectionIndicatorTapped];
}

- (void)setImageAnalysisButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMFullscreenViewfinderAccessibility;
  [(CAMFullscreenViewfinderAccessibility *)&v12 setImageAnalysisButtonVisible:a3 animated:a4];
  if (v4)
  {
    v6 = [(CAMFullscreenViewfinderAccessibility *)self safeValueForKey:@"imageAnalysisButton"];
    uint64_t v7 = [v6 safeUnsignedIntegerForKey:@"mode"];
    if (v7 == 2)
    {
      objc_super v9 = @"appclip.detected";
    }
    else
    {
      uint64_t v8 = v7;
      if (v7 == 1)
      {
        objc_super v9 = @"qrcode.detected";
      }
      else
      {
        if (v7)
        {
          v11 = AXLogAppAccessibility();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            -[CAMFullscreenViewfinderAccessibility setImageAnalysisButtonVisible:animated:](v8, v11);
          }

          v10 = 0;
          goto LABEL_12;
        }
        objc_super v9 = @"text.detected";
      }
    }
    v10 = accessibilityCameraUILocalizedString(v9);
LABEL_12:
    UIAccessibilitySpeakIfNotSpeaking();
  }
}

- (void)setVisiblePreviewSuggestionButton:(int64_t)a3 animated:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CAMFullscreenViewfinderAccessibility;
  [(CAMFullscreenViewfinderAccessibility *)&v7 setVisiblePreviewSuggestionButton:a3 animated:a4];
  if (a3 == 1)
  {
    if ([(CAMFullscreenViewfinderAccessibility *)self safeBoolForKey:@"shouldShowControls"])
    {
      v6 = accessibilityCameraUILocalizedString(@"auto.macro.mode.detected");
      UIAccessibilitySpeakIfNotSpeaking();
    }
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v30.receiver = self;
  v30.super_class = (Class)CAMFullscreenViewfinderAccessibility;
  [(CAMFullscreenViewfinderAccessibility *)&v30 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CAMFullscreenViewfinderAccessibility *)self safeValueForKey:@"smartStyleSlider2D"];
  BOOL v4 = [v3 safeUIViewForKey:@"view"];

  [v4 _setIsAccessibilityElementBlock:&__block_literal_global_12];
  BOOL v5 = [(CAMFullscreenViewfinderAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_377 startWithSelf:1];
  v6 = [v5 _accessibilityViewController];

  objc_super v7 = [v6 safeValueForKey:@"_currentSmartStyle"];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3010000000;
  v28[3] = &unk_2401C37DE;
  long long v29 = *MEMORY[0x263F00148];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3010000000;
  v26[3] = &unk_2401C37DE;
  long long v27 = v29;
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v22 = &unk_2650A0148;
  v24 = v28;
  id v8 = v7;
  id v23 = v8;
  v25 = v26;
  AXPerformSafeBlock();
  if (v8)
  {
    objc_super v9 = NSString;
    v10 = accessibilityCameraUI3LocalizedString(@"tone.and.color.string");
    v11 = AXFormatFloatWithPercentage();
    objc_super v12 = AXFormatFloatWithPercentage();
    v13 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v11, v12);

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
    v17[3] = &unk_26509FC38;
    id v14 = v13;
    id v18 = v14;
    [v4 _setAccessibilityLabelBlock:v17];
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
  v16[3] = &unk_2650A0198;
  v16[4] = self;
  v16[5] = v28;
  [v4 _setAccessibilityCustomActionsBlock:v16];
  [v4 _setAccessibilityTraitsBlock:&__block_literal_global_407];
  [v4 _setAccessibilityActivationPointBlock:&__block_literal_global_410];
  [v4 _setAccessibilityActivateBlock:&__block_literal_global_412];
  v15 = [(CAMFullscreenViewfinderAccessibility *)self safeValueForKey:@"smartStyleIntensitySlider"];
  [v15 _setAccessibilityLabelBlock:&__block_literal_global_414];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return 1;
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = [a2 _accessibilityViewController];
  MEMORY[0x2455E18B0](@"CAMViewfinderViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(void *a1)
{
  [MEMORY[0x263F307C8] slider2DValueForStyle:a1[4] limitRangeForSystemStyles:0];
  uint64_t v2 = *(void *)(a1[5] + 8);
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v4;
  uint64_t result = objc_msgSend(MEMORY[0x263F307C8], "colorAndToneBiasForSlider2DValue:limitRangeForSystemStyles:", 0, *(double *)(*(void *)(a1[5] + 8) + 32), *(double *)(*(void *)(a1[5] + 8) + 40));
  uint64_t v6 = *(void *)(a1[6] + 8);
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v8;
  return result;
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4()
{
  return __UIAXStringForVariables();
}

id __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  v24[4] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F1C390]);
  uint64_t v3 = accessibilityCameraUI3LocalizedString(@"increment.color");
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6;
  v22[3] = &unk_2650A0170;
  long long v23 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = (void *)[v2 initWithName:v3 actionHandler:v22];

  id v5 = objc_alloc(MEMORY[0x263F1C390]);
  uint64_t v6 = accessibilityCameraUI3LocalizedString(@"decrement.color");
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
  v20[3] = &unk_2650A0170;
  long long v21 = *(_OWORD *)(a1 + 32);
  uint64_t v7 = (void *)[v5 initWithName:v6 actionHandler:v20];

  id v8 = objc_alloc(MEMORY[0x263F1C390]);
  objc_super v9 = accessibilityCameraUI3LocalizedString(@"increment.tone");
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8;
  v18[3] = &unk_2650A0170;
  long long v19 = *(_OWORD *)(a1 + 32);
  v10 = (void *)[v8 initWithName:v9 actionHandler:v18];

  id v11 = objc_alloc(MEMORY[0x263F1C390]);
  objc_super v12 = accessibilityCameraUI3LocalizedString(@"decrement.tone");
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_9;
  v16[3] = &unk_2650A0170;
  long long v17 = *(_OWORD *)(a1 + 32);
  v13 = (void *)[v11 initWithName:v12 actionHandler:v16];

  v24[0] = v4;
  v24[1] = v7;
  v24[2] = v10;
  v24[3] = v13;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];

  return v14;
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  return 1;
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(uint64_t a1)
{
  return 1;
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8(uint64_t a1)
{
  return 1;
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_9(uint64_t a1)
{
  return 1;
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_10()
{
  return *MEMORY[0x263F1CF48];
}

double __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_11()
{
  return -1.0;
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_12()
{
  return 1;
}

id __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_13()
{
  return accessibilityCameraUI3LocalizedString(@"smart.style.palette.slider");
}

- (void)_loadSmartStyleControlsIfNeeded
{
  v3.receiver = self;
  v3.super_class = (Class)CAMFullscreenViewfinderAccessibility;
  [(CAMFullscreenViewfinderAccessibility *)&v3 _loadSmartStyleControlsIfNeeded];
  [(CAMFullscreenViewfinderAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)axUpdateSliderValue:(CGPoint)a3 smartSliderType:(int64_t)a4 increment:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  v10 = [(CAMFullscreenViewfinderAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_421_1 startWithSelf:1];
  id v11 = [v10 _accessibilityViewController];

  objc_super v12 = (long long *)MEMORY[0x263F00148];
  char v17 = 0;
  if (a4)
  {
    if (a4 == 1) {
      [(CAMFullscreenViewfinderAccessibility *)self _axChangeValue:v5 increment:&v17 borderHit:y];
    }
  }
  else
  {
    [(CAMFullscreenViewfinderAccessibility *)self _axChangeValue:v5 increment:&v17 borderHit:x];
  }
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3010000000;
  v15[3] = &unk_2401C37DE;
  long long v16 = *v12;
  id v13 = v11;
  AXPerformSafeBlock();
  if (v17) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21918]);
  }
  if ((unint64_t)a4 <= 1)
  {
    id v14 = AXFormatFloatWithPercentage();
    UIAccessibilitySpeak();
  }
  _Block_object_dispose(v15, 8);
}

uint64_t __86__CAMFullscreenViewfinderAccessibility_axUpdateSliderValue_smartSliderType_increment___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 _accessibilityViewController];
  MEMORY[0x2455E18B0](@"CAMViewfinderViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __86__CAMFullscreenViewfinderAccessibility_axUpdateSliderValue_smartSliderType_increment___block_invoke_2(uint64_t a1)
{
  objc_msgSend(MEMORY[0x263F307C8], "colorAndToneBiasForSlider2DValue:limitRangeForSystemStyles:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v4;
  BOOL v5 = *(void **)(a1 + 32);
  double v6 = *(double *)(a1 + 48);
  double v7 = *(double *)(a1 + 56);

  return objc_msgSend(v5, "_handleSmartStylePadValueChanged:", v6, v7);
}

- (double)_axChangeValue:(double)a3 increment:(BOOL)a4 borderHit:(BOOL *)a5
{
  double v5 = -0.1;
  if (a4) {
    double v5 = 0.1;
  }
  double result = v5 + a3;
  double v7 = 1.0;
  if (result >= 1.0 || (double v7 = -1.0, result <= -1.0))
  {
    *a5 = 1;
    return v7;
  }
  return result;
}

- (void)setImageAnalysisButtonVisible:(uint64_t)a1 animated:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24019A000, a2, OS_LOG_TYPE_ERROR, "VKImageAnalysisButtonMode unhandled : %lu", (uint8_t *)&v2, 0xCu);
}

@end