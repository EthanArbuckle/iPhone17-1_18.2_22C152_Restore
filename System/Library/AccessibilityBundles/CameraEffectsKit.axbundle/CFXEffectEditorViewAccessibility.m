@interface CFXEffectEditorViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (id)_axParentElements;
- (id)_axParentView;
- (void)CFX_beginTextEditing;
- (void)CFX_endTextEditing:(BOOL)a3;
- (void)CFX_removeEffect;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetParentElements:(id)a3;
- (void)_axSetParentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation CFXEffectEditorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CFXEffectEditorView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXEffectEditorView", @"removeButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXEffectEditorView", @"isTextEditing", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXEffectEditorView", @"CFX_endTextEditing:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXEffectEditorView", @"CFX_beginTextEditing", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXEffectEditorView", @"CFX_removeEffect", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXEffectEditorView", @"endEditingAnimated:withCompletionBlock:", "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXEffectEditorView", @"tapRemoveButton:", "v", "@", 0);
  [v3 validateClass:@"CFXFullScreenTextEditViewController"];
  [v3 validateClass:@"CFXCameraViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXCameraViewController", @"captureViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXCameraViewController", @"effectBrowserViewController", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)CFXEffectEditorViewAccessibility;
  [(CFXEffectEditorViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CFXEffectEditorViewAccessibility *)self safeValueForKey:@"removeButton"];
  [v3 setIsAccessibilityElement:0];

  v4 = [(CFXEffectEditorViewAccessibility *)self safeValueForKey:@"removeButton"];
  v5 = accessibilityLocalizedString(@"close.button");
  [v4 setAccessibilityLabel:v5];
}

- (BOOL)accessibilityPerformEscape
{
  if ([(CFXEffectEditorViewAccessibility *)self safeBoolForKey:@"isTextEditing"])
  {
    UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
    v4 = accessibilityLocalizedString(@"text.inserted");
    UIAccessibilityPostNotification(v3, v4);

    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    v9 = __62__CFXEffectEditorViewAccessibility_accessibilityPerformEscape__block_invoke;
    v10 = &unk_2651112C8;
    v11 = self;
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CFXEffectEditorViewAccessibility;
    return [(CFXEffectEditorViewAccessibility *)&v6 accessibilityPerformEscape];
  }
}

uint64_t __62__CFXEffectEditorViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endEditingAnimated:1 withCompletionBlock:0];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CFXEffectEditorViewAccessibility;
  [(CFXEffectEditorViewAccessibility *)&v3 viewDidLoad];
  [(CFXEffectEditorViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_axParentElements
{
}

- (void)_axSetParentElements:(id)a3
{
}

- (id)_axParentView
{
}

- (void)_axSetParentView:(id)a3
{
}

- (void)CFX_beginTextEditing
{
  v19[1] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)CFXEffectEditorViewAccessibility;
  [(CFXEffectEditorViewAccessibility *)&v16 CFX_beginTextEditing];
  if ([(CFXEffectEditorViewAccessibility *)self safeBoolForKey:@"isTextEditing"])
  {
    id v3 = objc_alloc(MEMORY[0x263F1C390]);
    v4 = accessibilityLocalizedString(@"close.button");
    v5 = (void *)[v3 initWithName:v4 target:self selector:sel_tapRemoveButton_];

    v19[0] = v5;
    objc_super v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
    [(CFXEffectEditorViewAccessibility *)self accessibilityFrame];
    objc_msgSend(v7, "setAccessibilityFrame:");
    [v7 setAccessibilityCustomActions:v6];
    [v7 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
    uint64_t v8 = accessibilityLocalizedString(@"done.editing");
    [v7 setAccessibilityLabel:v8];

    v9 = accessibilityLocalizedString(@"done.editing.hint");
    [v7 setAccessibilityHint:v9];

    v10 = [(CFXEffectEditorViewAccessibility *)self safeValueForKey:@"removeButton"];
    [v10 setIsAccessibilityElement:1];

    v18 = v7;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    [(CFXEffectEditorViewAccessibility *)self _accessibilitySetAdditionalElements:v11];

    v12 = [(CFXEffectEditorViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_2 startWithSelf:0];
    v13 = v12;
    if (v12)
    {
      v14 = [v12 _accessibilityAdditionalElements];
      [(CFXEffectEditorViewAccessibility *)self _axSetParentElements:v14];

      [(CFXEffectEditorViewAccessibility *)self _axSetParentView:v13];
    }
    [v13 _accessibilitySetAdditionalElements:0];
    v17 = self;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    [v13 setAccessibilityElements:v15];

    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
}

uint64_t __56__CFXEffectEditorViewAccessibility_CFX_beginTextEditing__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 _accessibilityViewController];
  MEMORY[0x245646100](@"CFXCaptureViewController");
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    v5 = [v2 _accessibilityViewController];
    MEMORY[0x245646100](@"CFXPreviewViewController");
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)CFX_removeEffect
{
  if ([(CFXEffectEditorViewAccessibility *)self safeBoolForKey:@"isTextEditing"])
  {
    id v3 = [(CFXEffectEditorViewAccessibility *)self _axParentView];

    if (v3)
    {
      v4 = [(CFXEffectEditorViewAccessibility *)self _axParentView];
      [v4 setAccessibilityElements:0];

      v5 = [(CFXEffectEditorViewAccessibility *)self _axParentView];
      objc_super v6 = [(CFXEffectEditorViewAccessibility *)self _axParentElements];
      [v5 _accessibilitySetAdditionalElements:v6];

      [(CFXEffectEditorViewAccessibility *)self _axSetParentView:0];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)CFXEffectEditorViewAccessibility;
  [(CFXEffectEditorViewAccessibility *)&v7 CFX_removeEffect];
}

- (void)CFX_endTextEditing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CFXEffectEditorViewAccessibility *)self safeBoolForKey:@"isTextEditing"])
  {
    [(CFXEffectEditorViewAccessibility *)self _accessibilitySetAdditionalElements:0];
    v5 = [(CFXEffectEditorViewAccessibility *)self safeValueForKey:@"removeButton"];
    [v5 setIsAccessibilityElement:0];

    v10.receiver = self;
    v10.super_class = (Class)CFXEffectEditorViewAccessibility;
    [(CFXEffectEditorViewAccessibility *)&v10 CFX_endTextEditing:v3];
    objc_super v6 = [(CFXEffectEditorViewAccessibility *)self _axParentView];

    if (v6)
    {
      objc_super v7 = [(CFXEffectEditorViewAccessibility *)self _axParentView];
      [v7 setAccessibilityElements:0];

      uint64_t v8 = [(CFXEffectEditorViewAccessibility *)self _axParentView];
      v9 = [(CFXEffectEditorViewAccessibility *)self _axParentElements];
      [v8 _accessibilitySetAdditionalElements:v9];
    }
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CFXEffectEditorViewAccessibility;
    [(CFXEffectEditorViewAccessibility *)&v10 CFX_endTextEditing:v3];
  }
}

@end