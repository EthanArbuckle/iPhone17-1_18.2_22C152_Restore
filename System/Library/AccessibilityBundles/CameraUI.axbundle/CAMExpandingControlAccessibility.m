@interface CAMExpandingControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (unint64_t)accessibilityTraits;
- (void)setExpanded:(BOOL)a3;
@end

@implementation CAMExpandingControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMExpandingControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMExpandingControl", @"isExpanded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMExpandingControl", @"setExpanded:", "v", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return [(CAMExpandingControlAccessibility *)self safeBoolForKey:@"isExpanded"] ^ 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMExpandingControlAccessibility;
  return *MEMORY[0x263F1CF60] | [(CAMExpandingControlAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityCustomActions
{
  v20[1] = *MEMORY[0x263EF8340];
  if ([(CAMExpandingControlAccessibility *)self safeBoolForKey:@"isExpanded"])
  {
    objc_initWeak(&location, self);
    id v3 = objc_alloc(MEMORY[0x263F1C390]);
    v4 = accessibilityCameraKitLocalizedString(@"CONTROL_COLLAPSE");
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __62__CAMExpandingControlAccessibility_accessibilityCustomActions__block_invoke;
    v16[3] = &unk_26509FB10;
    objc_copyWeak(&v17, &location);
    v5 = (void *)[v3 initWithName:v4 actionHandler:v16];

    v20[0] = v5;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_initWeak(&location, self);
    id v7 = objc_alloc(MEMORY[0x263F1C390]);
    v8 = accessibilityCameraKitLocalizedString(@"CONTROL_EXPAND");
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __62__CAMExpandingControlAccessibility_accessibilityCustomActions__block_invoke_3;
    v14 = &unk_26509FB10;
    objc_copyWeak(&v15, &location);
    v9 = (void *)[v7 initWithName:v8 actionHandler:&v11];

    v19 = v9;
    v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v19, 1, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v6;
}

uint64_t __62__CAMExpandingControlAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __62__CAMExpandingControlAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setExpanded:0];
}

uint64_t __62__CAMExpandingControlAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __62__CAMExpandingControlAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setExpanded:1];
}

- (BOOL)accessibilityPerformEscape
{
  int v2 = [(CAMExpandingControlAccessibility *)self safeBoolForKey:@"isExpanded"];
  if (v2) {
    AXPerformSafeBlock();
  }
  return v2;
}

void __62__CAMExpandingControlAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setExpanded:0];
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CE18];
  id v3 = *(void **)(a1 + 32);

  UIAccessibilityPostNotification(v2, v3);
}

- (void)setExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CAMExpandingControlAccessibility;
  -[CAMExpandingControlAccessibility setExpanded:](&v5, sel_setExpanded_);
  if (v3) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], self);
  }
}

@end