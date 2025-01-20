@interface AXCFXElementUtilities
+ (id)sharedInstance;
- (id)axElementForJTEffect:(id)a3 vc:(id)a4;
- (void)_axRemoveEffect:(id)a3;
- (void)_axRotateClockwise:(id)a3;
- (void)_axRotateCounterClockwise:(id)a3;
- (void)_axScaleDown:(id)a3;
- (void)_axScaleUp:(id)a3;
@end

@implementation AXCFXElementUtilities

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)_SharedInstance;

  return v2;
}

uint64_t __39__AXCFXElementUtilities_sharedInstance__block_invoke()
{
  _SharedInstance = objc_alloc_init(AXCFXElementUtilities);

  return MEMORY[0x270F9A758]();
}

- (id)axElementForJTEffect:(id)a3 vc:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x245646100](@"JFXEffectEditingUtilities");
  id v8 = objc_initWeak(location, v5);
  int v9 = [v5 safeIntForKey:@"type"];

  if (v9 == 2)
  {
    uint64_t v10 = [v6 safeUIViewForKey:@"view"];
    v11 = [[UIAccessibilityFunCamElement alloc] initWithAccessibilityContainer:v10];
    v56 = (void *)v10;
    objc_initWeak(&from, v6);
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke;
    v73[3] = &unk_2651111E0;
    objc_copyWeak(&v75, &from);
    id v12 = v5;
    id v74 = v12;
    [(UIAccessibilityFunCamElement *)v11 _setAccessibilityFrameBlock:v73];
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_3;
    v71[3] = &unk_265111208;
    objc_copyWeak(&v72, location);
    [(UIAccessibilityFunCamElement *)v11 _setAccessibilityLabelBlock:v71];
    objc_initWeak(&v70, v11);
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_4;
    v66[3] = &unk_265111230;
    objc_copyWeak(&v68, location);
    objc_copyWeak(&v69, &v70);
    id v13 = v12;
    id v67 = v13;
    [(UIAccessibilityFunCamElement *)v11 _setAccessibilityValueBlock:v66];
    v55 = [v13 safeValueForKey:@"trackingProps"];
    if ([v55 safeIntForKey:@"trackingType"]) {
      [(UIAccessibilityFunCamElement *)v11 setTracked:1];
    }
    id v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x2020000000;
    char v65 = 0;
    v60[1] = (id)MEMORY[0x263EF8330];
    v60[2] = (id)3221225472;
    v60[3] = __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_5;
    v60[4] = &unk_265111258;
    v60[5] = &v62;
    v61[1] = v7;
    objc_copyWeak(v61, location);
    AXPerformSafeBlock();
    int v14 = *((unsigned __int8 *)v63 + 24);
    objc_destroyWeak(v61);
    _Block_object_dispose(&v62, 8);
    if (v14)
    {
      objc_initWeak(&v62, v6);
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_6;
      v58[3] = &unk_265111280;
      objc_copyWeak(&v59, &v62);
      objc_copyWeak(v60, location);
      [(UIAccessibilityFunCamElement *)v11 _setAccessibilityActivateBlock:v58];
      v15 = accessibilityLocalizedString(@"text.effect.hint");
      v16 = accessibilityLocalizedString(@"effect.hint");
      v17 = __UIAXStringForVariables();
      [(UIAccessibilityFunCamElement *)v11 setAccessibilityHint:v17, v16, @"__AXStringForVariablesSentinel"];

      objc_destroyWeak(v60);
      objc_destroyWeak(&v59);
      objc_destroyWeak(&v62);
    }
    else
    {
      [(UIAccessibilityFunCamElement *)v11 _setAccessibilityActivateBlock:&__block_literal_global_389];
      v18 = accessibilityLocalizedString(@"effect.hint");
      [(UIAccessibilityFunCamElement *)v11 setAccessibilityHint:v18];
    }
    v19 = [MEMORY[0x263EFF980] array];
    v20 = [UIAccessibilityFunCamCustomAction alloc];
    v21 = accessibilityLocalizedString(@"increase.size.action");
    v22 = +[AXCFXElementUtilities sharedInstance];
    id WeakRetained = objc_loadWeakRetained(location);
    uint64_t v24 = [(UIAccessibilityFunCamCustomAction *)v20 initWithName:v21 target:v22 selector:sel__axScaleUp_ effect:WeakRetained axElement:v11 vc:v6];

    [v19 addObject:v24];
    v54 = (void *)v24;
    v25 = [UIAccessibilityFunCamCustomAction alloc];
    v26 = accessibilityLocalizedString(@"decrease.size.action");
    v27 = +[AXCFXElementUtilities sharedInstance];
    id v28 = objc_loadWeakRetained(location);
    uint64_t v29 = [(UIAccessibilityFunCamCustomAction *)v25 initWithName:v26 target:v27 selector:sel__axScaleDown_ effect:v28 axElement:v11 vc:v6];

    [v19 addObject:v29];
    v53 = (void *)v29;
    v30 = [UIAccessibilityFunCamCustomAction alloc];
    v31 = accessibilityLocalizedString(@"rotate.clockwise.action");
    v32 = +[AXCFXElementUtilities sharedInstance];
    id v33 = objc_loadWeakRetained(location);
    v34 = [(UIAccessibilityFunCamCustomAction *)v30 initWithName:v31 target:v32 selector:sel__axRotateClockwise_ effect:v33 axElement:v11 vc:v6];

    [v19 addObject:v34];
    v35 = [UIAccessibilityFunCamCustomAction alloc];
    v36 = accessibilityLocalizedString(@"rotate.counterclockwise.action");
    v37 = +[AXCFXElementUtilities sharedInstance];
    id v38 = objc_loadWeakRetained(location);
    v39 = [(UIAccessibilityFunCamCustomAction *)v35 initWithName:v36 target:v37 selector:sel__axRotateCounterClockwise_ effect:v38 axElement:v11 vc:v6];

    [v19 addObject:v39];
    v40 = [UIAccessibilityFunCamCustomAction alloc];
    v41 = accessibilityLocalizedString(@"remove.effect.action");
    v42 = +[AXCFXElementUtilities sharedInstance];
    id v43 = objc_loadWeakRetained(location);
    v44 = [(UIAccessibilityFunCamCustomAction *)v40 initWithName:v41 target:v42 selector:sel__axRemoveEffect_ effect:v43 axElement:v11 vc:v6];

    [v19 addObject:v44];
    [(UIAccessibilityFunCamElement *)v11 setAccessibilityCustomActions:v19];
    LOBYTE(v62) = 0;
    objc_opt_class();
    id v45 = objc_loadWeakRetained(location);
    v46 = [v45 safeValueForKeyPath:@"effectParameters"];
    v47 = __UIAccessibilityCastAsClass();

    if ((_BYTE)v62) {
      abort();
    }
    v48 = [v47 objectForKeyedSubscript:*MEMORY[0x263F617B0]];
    v49 = v48;
    if (v48)
    {
      [v48 SIMDDouble4x4];
      double v50 = v57;
    }
    else
    {
      double v50 = *MEMORY[0x263F000D0];
    }
    v51 = [NSNumber numberWithDouble:v50];
    [(UIAccessibilityFunCamElement *)v11 _accessibilitySetValue:v51 forKey:@"AXOriginalScale" storageMode:0];

    objc_destroyWeak(&v69);
    objc_destroyWeak(&v68);
    objc_destroyWeak(&v70);
    objc_destroyWeak(&v72);

    objc_destroyWeak(&v75);
    objc_destroyWeak(&from);
  }
  else
  {
    v11 = 0;
  }
  objc_destroyWeak(location);

  return v11;
}

double __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  MEMORY[0x245646100](@"CFXCaptureViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = objc_loadWeakRetained(v2);
  id v6 = v5;
  if (isKindOfClass)
  {
    v7 = @"liveCaptureContainer";
  }
  else
  {
    MEMORY[0x245646100](@"CFXPreviewViewController");
    char v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0)
    {
LABEL_7:
      uint64_t v10 = [MEMORY[0x263F1C920] mainScreen];
      [v10 bounds];

      int v9 = 0;
      goto LABEL_8;
    }
    id v5 = objc_loadWeakRetained(v2);
    id v6 = v5;
    v7 = @"playerContainerView";
  }
  int v9 = [v5 safeUIViewForKey:v7];

  if (!v9) {
    goto LABEL_7;
  }
  [(UIView *)v9 frame];
LABEL_8:
  uint64_t v18 = 0;
  v19 = (double *)&v18;
  uint64_t v20 = 0x4010000000;
  v21 = &unk_241FE5B53;
  long long v22 = 0u;
  long long v23 = 0u;
  id v17 = *(id *)(a1 + 32);
  AXPerformSafeBlock();
  CGFloat v11 = v19[4];
  CGFloat v12 = v19[5];
  CGFloat v13 = v19[6];
  CGFloat v14 = v19[7];

  _Block_object_dispose(&v18, 8);
  v24.origin.x = v11;
  v24.origin.y = v12;
  v24.size.width = v13;
  v24.size.height = v14;
  *(void *)&double v15 = (unint64_t)UIAccessibilityConvertFrameToScreenCoordinates(v24, v9);

  return v15;
}

uint64_t __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v9 = *MEMORY[0x263F010E0];
  uint64_t v10 = *(void *)(MEMORY[0x263F010E0] + 16);
  uint64_t result = objc_msgSend(v2, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v9, 1, 1, 1, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v4 = *(void **)(*(void *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

id __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_3(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  char v24 = 0;
  objc_opt_class();
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained safeValueForKey:@"accessibilityName"];
  uint64_t v5 = __UIAccessibilityCastAsClass();

  id v6 = objc_loadWeakRetained(v2);
  MEMORY[0x245646100](@"JFXTextEffect");
  LOBYTE(WeakRetained) = objc_opt_isKindOfClass();

  if (WeakRetained)
  {
    char v24 = 0;
    objc_opt_class();
    id v7 = objc_loadWeakRetained(v2);
    uint64_t v8 = [v7 safeValueForKey:@"strings"];
    long long v9 = __UIAccessibilityCastAsClass();

    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      CGFloat v13 = 0;
      uint64_t v14 = *(void *)v21;
      do
      {
        uint64_t v15 = 0;
        v16 = v13;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v19 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
          CGFloat v13 = __UIAXStringForVariables();

          ++v15;
          v16 = v13;
        }
        while (v12 != v15);
        uint64_t v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16, v19, @"__AXStringForVariablesSentinel");
      }
      while (v12);
    }
    else
    {
      CGFloat v13 = 0;
    }
  }
  else
  {
    CGFloat v13 = 0;
  }
  id v17 = __UIAXStringForVariables();

  return v17;
}

id __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_4(id *a1)
{
  v46[135] = 0;
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = [WeakRetained safeValueForKeyPath:@"effectParameters"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F617B0]];
  id v6 = v5;
  if (v5)
  {
    id v7 = v46;
    [v5 SIMDDouble4x4];
  }
  else
  {
    id v7 = (unsigned char *)MEMORY[0x263F000D0];
  }
  long double v8 = *(double *)v7;
  long double v9 = *((double *)v7 + 1);
  id v10 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v10 setRoundingMode:6];
  long double v11 = atan2(v9, v8) * 180.0 / 3.14159265;
  if (fabs(v11) >= 0.001)
  {
    *(float *)&long double v11 = v11;
    CGFloat v13 = [NSNumber numberWithFloat:(double)v11];
    uint64_t v14 = [v10 stringFromNumber:v13];
    uint64_t v15 = [v10 numberFromString:v14];

    v16 = NSNumber;
    [v15 doubleValue];
    uint64_t v18 = [v16 numberWithDouble:fabs(v17)];
    uint64_t v19 = [NSNumber numberWithInteger:180];
    int v20 = [v18 isEqualToNumber:v19];

    if (v20)
    {
      long long v21 = NSString;
      long long v22 = @"rotation.value.degrees";
    }
    else
    {
      [v15 floatValue];
      long long v21 = NSString;
      if (v23 <= 0.0) {
        long long v22 = @"rotation.value.counterclockwise";
      }
      else {
        long long v22 = @"rotation.value.clockwise";
      }
    }
    char v24 = accessibilityLocalizedString(v22);
    uint64_t v12 = objc_msgSend(v21, "localizedStringWithFormat:", v24, v18);
  }
  else
  {
    uint64_t v12 = 0;
  }
  v25 = a1 + 6;
  id v26 = objc_loadWeakRetained(a1 + 6);
  v27 = [v26 _accessibilityValueForKey:@"AXOriginalScale"];
  [v27 floatValue];
  float v29 = v28;

  if (v29 > 0.0) {
    double v30 = v8 / v29;
  }
  else {
    double v30 = 1.0;
  }
  id v31 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v31 setMaximumFractionDigits:2];
  [v31 setNumberStyle:1];
  [v31 setRoundingMode:6];
  v32 = 0;
  double v33 = fabs(v30 + -1.0);
  if (v33 >= 0.001 && v30 > 0.0)
  {
    *(float *)&double v33 = v30;
    v34 = [NSNumber numberWithFloat:v33];
    v35 = [v31 stringFromNumber:v34];
    v36 = [v31 numberFromString:v35];

    v37 = NSString;
    id v38 = accessibilityLocalizedString(@"scale.value");
    v32 = objc_msgSend(v37, "localizedStringWithFormat:", v38, v36);
  }
  v39 = [a1[4] safeValueForKey:@"trackingProps"];
  BOOL v40 = [v39 safeIntForKey:@"trackingType"] != 0;
  id v41 = objc_loadWeakRetained(v25);
  [v41 setTracked:v40];

  id v42 = objc_loadWeakRetained(v25);
  if ([v42 tracked])
  {
    id v43 = accessibilityLocalizedString(@"following.face");
  }
  else
  {
    id v43 = 0;
  }

  v44 = __UIAXStringForVariables();

  return v44;
}

void __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_5(uint64_t a1)
{
  v2 = *(void **)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 canEditTextForEffect:WeakRetained];
}

uint64_t __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained presentFullScreenTextEditorForEffect:v3 insertingEffect:1];

  return 1;
}

uint64_t __49__AXCFXElementUtilities_axElementForJTEffect_vc___block_invoke_7()
{
  return 1;
}

- (void)_axScaleUp:(id)a3
{
  id v3 = a3;
  v4 = [v3 effect];
  int v5 = [v4 safeIntForKey:@"type"];

  if (v5 == 2)
  {
    id v13 = v3;
    AXPerformSafeBlock();
    id v6 = [v13 vc];
    id v7 = [v6 safeValueForKey:@"effectEditor"];

    uint64_t v12 = v7;
    id v8 = v7;
    AXPerformSafeBlock();
    LODWORD(v7) = *MEMORY[0x263F1CDC8];
    long double v9 = [v13 axElement];
    id v10 = [v9 accessibilityValue];
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v7, v10);

    id v11 = v13;
    AXPerformSafeBlock();
  }
}

void __36__AXCFXElementUtilities__axScaleUp___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) vc];
  v2 = [*(id *)(a1 + 32) effect];
  [v3 displayEffectEditorForEffect:v2 forMode:1];
}

uint64_t __36__AXCFXElementUtilities__axScaleUp___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_scaleEffect:", 1.25);
}

void __36__AXCFXElementUtilities__axScaleUp___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) vc];
  char v3 = objc_opt_respondsToSelector();

  v4 = [*(id *)(a1 + 32) vc];
  id v6 = v4;
  if (v3)
  {
    [v4 removeEffectEditor];
  }
  else
  {
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) vc];
    [v6 removeEffectEditorAnimated:0];
  }
}

- (void)_axScaleDown:(id)a3
{
  id v3 = a3;
  v4 = [v3 effect];
  int v5 = [v4 safeIntForKey:@"type"];

  if (v5 == 2)
  {
    id v13 = v3;
    AXPerformSafeBlock();
    id v6 = [v13 vc];
    id v7 = [v6 safeValueForKey:@"effectEditor"];

    uint64_t v12 = v7;
    id v8 = v7;
    AXPerformSafeBlock();
    LODWORD(v7) = *MEMORY[0x263F1CDC8];
    long double v9 = [v13 axElement];
    id v10 = [v9 accessibilityValue];
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v7, v10);

    id v11 = v13;
    AXPerformSafeBlock();
  }
}

void __38__AXCFXElementUtilities__axScaleDown___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) vc];
  v2 = [*(id *)(a1 + 32) effect];
  [v3 displayEffectEditorForEffect:v2 forMode:1];
}

uint64_t __38__AXCFXElementUtilities__axScaleDown___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_scaleEffect:", 0.75);
}

void __38__AXCFXElementUtilities__axScaleDown___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) vc];
  char v3 = objc_opt_respondsToSelector();

  v4 = [*(id *)(a1 + 32) vc];
  id v6 = v4;
  if (v3)
  {
    [v4 removeEffectEditor];
  }
  else
  {
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) vc];
    [v6 removeEffectEditorAnimated:0];
  }
}

- (void)_axRotateClockwise:(id)a3
{
  id v3 = a3;
  v4 = [v3 effect];
  int v5 = [v4 safeIntForKey:@"type"];

  if (v5 == 2)
  {
    id v13 = v3;
    AXPerformSafeBlock();
    id v6 = [v13 vc];
    id v7 = [v6 safeValueForKey:@"effectEditor"];

    uint64_t v12 = v7;
    id v8 = v7;
    AXPerformSafeBlock();
    LODWORD(v7) = *MEMORY[0x263F1CDC8];
    long double v9 = [v13 axElement];
    id v10 = [v9 accessibilityValue];
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v7, v10);

    id v11 = v13;
    AXPerformSafeBlock();
  }
}

void __44__AXCFXElementUtilities__axRotateClockwise___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) vc];
  v2 = [*(id *)(a1 + 32) effect];
  [v3 displayEffectEditorForEffect:v2 forMode:1];
}

uint64_t __44__AXCFXElementUtilities__axRotateClockwise___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_rotateEffect:", 0.785398163);
}

void __44__AXCFXElementUtilities__axRotateClockwise___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) vc];
  char v3 = objc_opt_respondsToSelector();

  v4 = [*(id *)(a1 + 32) vc];
  id v6 = v4;
  if (v3)
  {
    [v4 removeEffectEditor];
  }
  else
  {
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) vc];
    [v6 removeEffectEditorAnimated:0];
  }
}

- (void)_axRotateCounterClockwise:(id)a3
{
  id v3 = a3;
  v4 = [v3 effect];
  int v5 = [v4 safeIntForKey:@"type"];

  if (v5 == 2)
  {
    id v13 = v3;
    AXPerformSafeBlock();
    id v6 = [v13 vc];
    id v7 = [v6 safeValueForKey:@"effectEditor"];

    uint64_t v12 = v7;
    id v8 = v7;
    AXPerformSafeBlock();
    LODWORD(v7) = *MEMORY[0x263F1CDC8];
    long double v9 = [v13 axElement];
    id v10 = [v9 accessibilityValue];
    UIAccessibilityPostNotification((UIAccessibilityNotifications)v7, v10);

    id v11 = v13;
    AXPerformSafeBlock();
  }
}

void __51__AXCFXElementUtilities__axRotateCounterClockwise___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) vc];
  v2 = [*(id *)(a1 + 32) effect];
  [v3 displayEffectEditorForEffect:v2 forMode:1];
}

uint64_t __51__AXCFXElementUtilities__axRotateCounterClockwise___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_rotateEffect:", -0.785398163);
}

void __51__AXCFXElementUtilities__axRotateCounterClockwise___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) vc];
  char v3 = objc_opt_respondsToSelector();

  v4 = [*(id *)(a1 + 32) vc];
  id v6 = v4;
  if (v3)
  {
    [v4 removeEffectEditor];
  }
  else
  {
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) vc];
    [v6 removeEffectEditorAnimated:0];
  }
}

- (void)_axRemoveEffect:(id)a3
{
  id v3 = a3;
  v4 = [v3 effect];
  int v5 = [v4 safeIntForKey:@"type"];

  if (v5 == 2)
  {
    id v9 = v3;
    AXPerformSafeBlock();
    id v6 = [v9 vc];
    id v7 = [v6 safeValueForKey:@"effectEditor"];

    id v8 = v7;
    AXPerformSafeBlock();
  }
}

void __41__AXCFXElementUtilities__axRemoveEffect___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) vc];
  v2 = [*(id *)(a1 + 32) effect];
  [v3 displayEffectEditorForEffect:v2 forMode:0];
}

uint64_t __41__AXCFXElementUtilities__axRemoveEffect___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_removeEffect");
}

@end