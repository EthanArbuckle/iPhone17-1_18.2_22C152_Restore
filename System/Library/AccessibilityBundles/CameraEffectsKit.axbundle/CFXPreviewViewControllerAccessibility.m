@interface CFXPreviewViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axEffectToElement;
- (void)CFX_addEffect:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axRemoveEffectFromView:(id)a3;
- (void)_axSetEffectToElement:(id)a3;
- (void)effectEditorView:(id)a3 didRemoveEffect:(id)a4;
- (void)fullScreenTextEditViewController:(id)a3 didFinishEditingByRemovingEffect:(id)a4;
- (void)viewDidLayoutSubviews;
@end

@implementation CFXPreviewViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CFXPreviewViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXPreviewViewController", @"CFX_addEffect:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXPreviewViewController", @"displayEffectEditorForEffect:forMode:", "v", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXPreviewViewController", @"removeEffectEditor", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXPreviewViewController", @"effectEditorView:didRemoveEffect:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXPreviewViewController", @"fullScreenTextEditViewController:didFinishEditingByRemovingEffect:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXPreviewViewController", @"effectEditor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXPreviewViewController", @"previewClip", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXPreviewViewController", @"presentFullScreenTextEditorForEffect:insertingEffect:", "B", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXPreviewViewController", @"playerContainerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXClip", @"effectStack", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXClip", @"isVideo", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)CFXPreviewViewControllerAccessibility;
  [(CFXPreviewViewControllerAccessibility *)&v32 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CFXPreviewViewControllerAccessibility *)self safeValueForKey:@"playerContainerView"];
  [v3 setIsAccessibilityElement:1];
  v4 = [(CFXPreviewViewControllerAccessibility *)self safeValueForKey:@"previewClip"];
  int v5 = [v4 safeBoolForKey:@"isVideo"];

  if (v5) {
    v6 = @"preview.clip.video";
  }
  else {
    v6 = @"preview.clip.image";
  }
  v7 = accessibilityLocalizedString(v6);
  [v3 setAccessibilityLabel:v7];

  char v31 = 0;
  objc_opt_class();
  v8 = [(CFXPreviewViewControllerAccessibility *)self safeValueForKeyPath:@"previewClip.effectStack"];
  v9 = __UIAccessibilityCastAsClass();

  v10 = [(CFXPreviewViewControllerAccessibility *)self _axEffectToElement];

  if (!v10)
  {
    v11 = [MEMORY[0x263EFF9A0] dictionary];
    [(CFXPreviewViewControllerAccessibility *)self _axSetEffectToElement:v11];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v17 = +[AXCFXElementUtilities sharedInstance];
        char v31 = 0;
        objc_opt_class();
        uint64_t v18 = __UIAccessibilityCastAsClass();
        if (v31) {
          abort();
        }
        v19 = (void *)v18;
        v20 = [v17 axElementForJTEffect:v16 vc:v18];

        if (v20)
        {
          v21 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v16];
          v22 = [(CFXPreviewViewControllerAccessibility *)self _axEffectToElement];
          [v22 setObject:v20 forKey:v21];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v13);
  }

  v23 = [(CFXPreviewViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  v24 = [(CFXPreviewViewControllerAccessibility *)self _axEffectToElement];
  v25 = [v24 allValues];
  [v23 _accessibilitySetAdditionalElements:v25];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CFXPreviewViewControllerAccessibility;
  [(CFXPreviewViewControllerAccessibility *)&v3 viewDidLayoutSubviews];
  [(CFXPreviewViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_axEffectToElement
{
}

- (void)_axSetEffectToElement:(id)a3
{
}

- (void)CFX_addEffect:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CFXPreviewViewControllerAccessibility;
  [(CFXPreviewViewControllerAccessibility *)&v16 CFX_addEffect:v4];
  int v5 = [(CFXPreviewViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  v6 = [v4 safeValueForKey:@"jtEffect"];
  v7 = +[AXCFXElementUtilities sharedInstance];
  objc_opt_class();
  v8 = __UIAccessibilityCastAsClass();
  v9 = [v7 axElementForJTEffect:v6 vc:v8];

  v10 = [(CFXPreviewViewControllerAccessibility *)self _axEffectToElement];

  if (!v10)
  {
    v11 = [MEMORY[0x263EFF9A0] dictionary];
    [(CFXPreviewViewControllerAccessibility *)self _axSetEffectToElement:v11];
  }
  if (v9)
  {
    uint64_t v12 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v6];
    uint64_t v13 = [(CFXPreviewViewControllerAccessibility *)self _axEffectToElement];
    [v13 setObject:v9 forKey:v12];
  }
  uint64_t v14 = [(CFXPreviewViewControllerAccessibility *)self _axEffectToElement];
  v15 = [v14 allValues];
  [v5 _accessibilitySetAdditionalElements:v15];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)_axRemoveEffectFromView:(id)a3
{
  id v11 = [a3 safeValueForKey:@"jtEffect"];
  id v4 = objc_msgSend(MEMORY[0x263F08D40], "valueWithNonretainedObject:");
  int v5 = [(CFXPreviewViewControllerAccessibility *)self _axEffectToElement];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {
    v7 = [(CFXPreviewViewControllerAccessibility *)self _axEffectToElement];
    [v7 removeObjectForKey:v4];

    v8 = [(CFXPreviewViewControllerAccessibility *)self safeValueForKey:@"view"];
    v9 = [(CFXPreviewViewControllerAccessibility *)self _axEffectToElement];
    v10 = [v9 allValues];
    [v8 _accessibilitySetAdditionalElements:v10];
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)effectEditorView:(id)a3 didRemoveEffect:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CFXPreviewViewControllerAccessibility;
  id v6 = a4;
  [(CFXPreviewViewControllerAccessibility *)&v7 effectEditorView:a3 didRemoveEffect:v6];
  -[CFXPreviewViewControllerAccessibility _axRemoveEffectFromView:](self, "_axRemoveEffectFromView:", v6, v7.receiver, v7.super_class);
}

- (void)fullScreenTextEditViewController:(id)a3 didFinishEditingByRemovingEffect:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CFXPreviewViewControllerAccessibility;
  id v6 = a4;
  [(CFXPreviewViewControllerAccessibility *)&v7 fullScreenTextEditViewController:a3 didFinishEditingByRemovingEffect:v6];
  -[CFXPreviewViewControllerAccessibility _axRemoveEffectFromView:](self, "_axRemoveEffectFromView:", v6, v7.receiver, v7.super_class);
}

@end