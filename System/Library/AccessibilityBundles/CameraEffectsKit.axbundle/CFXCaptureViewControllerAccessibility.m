@interface CFXCaptureViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axFaceTimeLocalViewExpanded;
- (BOOL)_axIsFaceTime;
- (id)_axEffectToElement;
- (void)CFX_addEffect:(id)a3 allowImmediateTextEditing:(BOOL)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axRemoveEffectFromView:(id)a3;
- (void)_axSetEffectToElement:(id)a3;
- (void)effectEditorView:(id)a3 didRemoveEffect:(id)a4;
- (void)fullScreenTextEditViewController:(id)a3 didFinishEditingByRemovingEffect:(id)a4;
- (void)viewDidLoad;
@end

@implementation CFXCaptureViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CFXCaptureViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXCaptureViewController", @"CFX_addEffect:allowImmediateTextEditing:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXCaptureViewController", @"displayEffectEditorForEffect:forMode:", "v", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXCaptureViewController", @"removeEffectEditorAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXCaptureViewController", @"effectEditorView:didRemoveEffect:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXCaptureViewController", @"fullScreenTextEditViewController:didFinishEditingByRemovingEffect:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXCaptureViewController", @"effectEditor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXCaptureViewController", @"presentFullScreenTextEditorForEffect:insertingEffect:", "B", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXCaptureViewController", @"liveCaptureContainer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXCaptureViewController", @"composition", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXEffectComposition", @"jtEffects", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXEffect", @"jtEffect", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"JFXEffect", @"type", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"JFXOverlayEffect", @"trackingProps", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"JFXEffect", @"accessibilityName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"JFXEffect", @"effectParameters", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"JFXTextEffect", @"strings", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXEffectEditorView", @"CFX_scaleEffect:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXEffectEditorView", @"CFX_rotateEffect:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXEffectEditorView", @"CFX_removeEffect", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"JFXOverlayEffect", @"imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", "{?=qiIq}", "B", "B", "{CGRect={CGPoint=dd}{CGSize=dd}}", "i", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"JFXEffectEditingUtilities", @"canEditTextForEffect:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"JFXTrackedEffectProperties", @"trackingType", "q", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)CFXCaptureViewControllerAccessibility;
  [(CFXCaptureViewControllerAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CFXCaptureViewControllerAccessibility *)self safeValueForKey:@"liveCaptureContainer"];
  [v3 setAccessibilityIdentifier:@"AXCFXViewFinder"];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __83__CFXCaptureViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9[3] = &unk_265111358;
  objc_copyWeak(&v10, &location);
  [v3 _setIsAccessibilityElementBlock:v9];
  v4 = accessibilityLocalizedString(@"viewfinder.label");
  [v3 setAccessibilityLabel:v4];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__CFXCaptureViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v7[3] = &unk_265111208;
  objc_copyWeak(&v8, &location);
  [v3 _setAccessibilityValueBlock:v7];
  v5 = [(CFXCaptureViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __83__CFXCaptureViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v6[3] = &unk_2651113D0;
  v6[4] = self;
  [v5 _setAccessibilityElementsHiddenBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

uint64_t __83__CFXCaptureViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _axIsFaceTime] ^ 1;

  return v2;
}

id __83__CFXCaptureViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  char v45 = 0;
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained safeValueForKeyPath:@"composition.jtEffects"];
  v4 = __UIAccessibilityCastAsClass();

  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v5 = v4;
  v6 = (void *)[v5 countByEnumeratingWithState:&v41 objects:v46 count:16];
  v36 = v5;
  if (!v6)
  {
    v26 = v5;
    v25 = 0;
    v9 = 0;
    v27 = 0;
    v24 = 0;
    v28 = 0;
LABEL_36:

    goto LABEL_38;
  }
  char v35 = 0;
  v37 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  v9 = 0;
  uint64_t v10 = *(void *)v42;
LABEL_3:
  uint64_t v11 = 0;
  while (2)
  {
    if (*(void *)v42 != v10) {
      objc_enumerationMutation(v5);
    }
    objc_super v12 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
    switch([v12 safeIntForKey:@"type"])
    {
      case 1u:
      case 8u:
        [v12 safeValueForKeyPath:@"accessibilityName"];
        v9 = v13 = v9;
        goto LABEL_20;
      case 2u:
        uint64_t v8 = (v8 + 1);
        v13 = [v12 safeValueForKey:@"trackingProps"];
        if ([v13 safeIntForKey:@"trackingType"]) {
          uint64_t v7 = (v7 + 1);
        }
        else {
          uint64_t v7 = v7;
        }
        goto LABEL_20;
      case 7u:
        uint64_t v38 = v8;
        uint64_t v39 = v7;
        v40 = v9;
        v13 = [v12 safeValueForKey:@"effectID"];
        id v14 = objc_alloc_init(MEMORY[0x263F29798]);
        v15 = [MEMORY[0x263F29770] requestForAvatarWithIdentifier:v13];
        v16 = [v14 avatarsForFetchRequest:v15 error:0];
        v17 = [v16 firstObject];
        if (v17)
        {
          v18 = [MEMORY[0x263F29788] avatarForRecord:v17];
        }
        else
        {
          v18 = 0;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v19 = [MEMORY[0x263F22288] descriptionForAnimoji:v18];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_19;
          }
          uint64_t v19 = [MEMORY[0x263F22288] descriptionForMemoji:v18];
          char v35 = 1;
        }

        v37 = (void *)v19;
        id v5 = v36;
LABEL_19:

        uint64_t v7 = v39;
        v9 = v40;
        uint64_t v8 = v38;
LABEL_20:

LABEL_21:
        if (v6 != (void *)++v11) {
          continue;
        }
        v6 = (void *)[v5 countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (v6) {
          goto LABEL_3;
        }

        if ((int)v8 < 1)
        {
          v6 = 0;
LABEL_29:
          v24 = 0;
          if (!v9) {
            goto LABEL_26;
          }
          goto LABEL_30;
        }
        v20 = NSString;
        v21 = accessibilityLocalizedString(@"stickers.count");
        v6 = objc_msgSend(v20, "localizedStringWithFormat:", v21, v8);

        if ((int)v7 < 1) {
          goto LABEL_29;
        }
        v22 = NSString;
        v23 = accessibilityLocalizedString(@"tracked.stickers.count");
        v24 = objc_msgSend(v22, "localizedStringWithFormat:", v23, v7);

        if (!v9)
        {
LABEL_26:
          v25 = 0;
          goto LABEL_31;
        }
LABEL_30:
        v29 = NSString;
        v30 = accessibilityLocalizedString(@"filter.name");
        v25 = objc_msgSend(v29, "localizedStringWithFormat:", v30, v9);

LABEL_31:
        if (v37)
        {
          v31 = NSString;
          if (v35) {
            v32 = @"memoji.name";
          }
          else {
            v32 = @"animoji.name";
          }
          v26 = accessibilityLocalizedString(v32);
          v28 = objc_msgSend(v31, "localizedStringWithFormat:", v26, v37);
          v27 = v37;
          goto LABEL_36;
        }
        v27 = 0;
        v28 = 0;
LABEL_38:
        v33 = __UIAXStringForVariables();

        return v33;
      default:
        goto LABEL_21;
    }
  }
}

uint64_t __83__CFXCaptureViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axFaceTimeLocalViewExpanded] ^ 1;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CFXCaptureViewControllerAccessibility;
  [(CFXCaptureViewControllerAccessibility *)&v3 viewDidLoad];
  [(CFXCaptureViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_axEffectToElement
{
}

- (void)_axSetEffectToElement:(id)a3
{
}

- (void)CFX_addEffect:(id)a3 allowImmediateTextEditing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CFXCaptureViewControllerAccessibility;
  [(CFXCaptureViewControllerAccessibility *)&v18 CFX_addEffect:v6 allowImmediateTextEditing:v4];
  uint64_t v7 = [(CFXCaptureViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  uint64_t v8 = [v6 safeValueForKey:@"jtEffect"];
  v9 = +[AXCFXElementUtilities sharedInstance];
  objc_opt_class();
  uint64_t v10 = __UIAccessibilityCastAsClass();
  uint64_t v11 = [v9 axElementForJTEffect:v8 vc:v10];

  objc_super v12 = [(CFXCaptureViewControllerAccessibility *)self _axEffectToElement];

  if (!v12)
  {
    v13 = [MEMORY[0x263EFF9A0] dictionary];
    [(CFXCaptureViewControllerAccessibility *)self _axSetEffectToElement:v13];
  }
  if (v11)
  {
    id v14 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v8];
    v15 = [(CFXCaptureViewControllerAccessibility *)self _axEffectToElement];
    [v15 setObject:v11 forKey:v14];
  }
  v16 = [(CFXCaptureViewControllerAccessibility *)self _axEffectToElement];
  v17 = [v16 allValues];
  [v7 _accessibilitySetAdditionalElements:v17];
}

- (void)_axRemoveEffectFromView:(id)a3
{
  id v11 = [a3 safeValueForKey:@"jtEffect"];
  BOOL v4 = objc_msgSend(MEMORY[0x263F08D40], "valueWithNonretainedObject:");
  id v5 = [(CFXCaptureViewControllerAccessibility *)self _axEffectToElement];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    uint64_t v7 = [(CFXCaptureViewControllerAccessibility *)self _axEffectToElement];
    [v7 removeObjectForKey:v4];

    uint64_t v8 = [(CFXCaptureViewControllerAccessibility *)self safeValueForKey:@"view"];
    v9 = [(CFXCaptureViewControllerAccessibility *)self _axEffectToElement];
    uint64_t v10 = [v9 allValues];
    [v8 _accessibilitySetAdditionalElements:v10];
  }
}

- (void)effectEditorView:(id)a3 didRemoveEffect:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CFXCaptureViewControllerAccessibility;
  id v6 = a4;
  [(CFXCaptureViewControllerAccessibility *)&v7 effectEditorView:a3 didRemoveEffect:v6];
  -[CFXCaptureViewControllerAccessibility _axRemoveEffectFromView:](self, "_axRemoveEffectFromView:", v6, v7.receiver, v7.super_class);
}

- (void)fullScreenTextEditViewController:(id)a3 didFinishEditingByRemovingEffect:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CFXCaptureViewControllerAccessibility;
  id v6 = a4;
  [(CFXCaptureViewControllerAccessibility *)&v7 fullScreenTextEditViewController:a3 didFinishEditingByRemovingEffect:v6];
  -[CFXCaptureViewControllerAccessibility _axRemoveEffectFromView:](self, "_axRemoveEffectFromView:", v6, v7.receiver, v7.super_class);
}

- (BOOL)_axIsFaceTime
{
  uint64_t v2 = [(CFXCaptureViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  objc_super v3 = [v2 _accessibilityFindAncestor:&__block_literal_global_3 startWithSelf:1];

  return v3 != 0;
}

uint64_t __54__CFXCaptureViewControllerAccessibility__axIsFaceTime__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245646100](@"PHInCallRootView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axFaceTimeLocalViewExpanded
{
  id v2 = [(CFXCaptureViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  BOOL v3 = 1;
  BOOL v4 = [v2 _accessibilityFindAncestor:&__block_literal_global_431 startWithSelf:1];
  id v5 = [v4 _accessibilityViewController];
  id v6 = [v5 safeValueForKey:@"accessibilityConstraintController"];

  if (v6) {
    BOOL v3 = [v6 safeIntegerForKey:@"localParticipantState"] == 2;
  }

  return v3;
}

uint64_t __69__CFXCaptureViewControllerAccessibility__axFaceTimeLocalViewExpanded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 _accessibilityViewController];
  MEMORY[0x245646100](@"CNKFaceTimeMultiwayConversationViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end