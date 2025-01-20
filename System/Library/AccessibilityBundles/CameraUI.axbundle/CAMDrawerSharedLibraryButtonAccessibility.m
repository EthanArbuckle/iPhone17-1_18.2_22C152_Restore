@interface CAMDrawerSharedLibraryButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (id)_axLabelForSharedLibraryMode:(int64_t)a3;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
@end

@implementation CAMDrawerSharedLibraryButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMDrawerSharedLibraryButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDrawerSharedLibraryButton", @"sharedLibraryMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDrawerSharedLibraryButton", @"setSharedLibraryMode:animated:", "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"_itemLabels", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"_cachedMenuItems", "@", 0);
  [v3 validateClass:@"CAMDrawerSharedLibraryButton" isKindOfClass:@"CAMControlDrawerButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuItem", @"value", "@", 0);
  [v3 validateClass:@"CAMDrawerSharedLibraryButton" isKindOfClass:@"CAMControlDrawerMenuButton"];
}

- (BOOL)accessibilityActivate
{
  if (AXRequestingClient() == 3)
  {
    id v3 = [(CAMDrawerSharedLibraryButtonAccessibility *)self safeValueForKey:@"sharedLibraryMode"];
    [v3 integerValue];

    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CAMDrawerSharedLibraryButtonAccessibility;
    return [(CAMDrawerSharedLibraryButtonAccessibility *)&v5 accessibilityActivate];
  }
}

void __66__CAMDrawerSharedLibraryButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSharedLibraryMode:*(void *)(a1 + 40) animated:0];
  v1 = __UIAccessibilitySafeClass();
  [v1 sendActionsForControlEvents:4096];
}

- (id)accessibilityHint
{
  return accessibilityCameraUILocalizedString(@"Shared_Library_Hint");
}

- (id)accessibilityIdentifier
{
  return @"SharedLibraryButton";
}

- (id)_axLabelForSharedLibraryMode:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
  {
    v4 = 0;
  }
  else
  {
    v4 = accessibilityCameraUILocalizedString(off_26509FC80[a3]);
  }
  return v4;
}

- (id)accessibilityLabel
{
  uint64_t v3 = [(CAMDrawerSharedLibraryButtonAccessibility *)self safeIntegerForKey:@"sharedLibraryMode"];

  return [(CAMDrawerSharedLibraryButtonAccessibility *)self _axLabelForSharedLibraryMode:v3];
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CAMDrawerSharedLibraryButtonAccessibility;
  [(CAMDrawerSharedLibraryButtonAccessibility *)&v9 layoutSubviews];
  uint64_t v3 = [(CAMDrawerSharedLibraryButtonAccessibility *)self safeArrayForKey:@"_itemLabels"];
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy_;
  v7[4] = __Block_byref_object_dispose_;
  id v8 = [(CAMDrawerSharedLibraryButtonAccessibility *)self safeArrayForKey:@"_cachedMenuItems"];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__CAMDrawerSharedLibraryButtonAccessibility_layoutSubviews__block_invoke;
  v4[3] = &unk_26509FC60;
  v4[4] = v7;
  objc_copyWeak(&v5, &location);
  [v3 enumerateObjectsUsingBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  _Block_object_dispose(v7, 8);
}

void __59__CAMDrawerSharedLibraryButtonAccessibility_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  [v5 setIsAccessibilityElement:1];
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count] > a3)
  {
    v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectAtIndex:a3];
    v7 = (void *)[v6 safeIntegerForKey:@"value"];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __59__CAMDrawerSharedLibraryButtonAccessibility_layoutSubviews__block_invoke_2;
    v14[3] = &unk_26509FC10;
    id v8 = (id *)(a1 + 40);
    objc_copyWeak(v15, v8);
    v15[1] = v7;
    [v5 _setAccessibilityTraitsBlock:v14];
    id WeakRetained = objc_loadWeakRetained(v8);
    v10 = [WeakRetained _axLabelForSharedLibraryMode:v7];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__CAMDrawerSharedLibraryButtonAccessibility_layoutSubviews__block_invoke_3;
    v12[3] = &unk_26509FC38;
    id v11 = v10;
    id v13 = v11;
    [v5 _setAccessibilityLabelBlock:v12];

    objc_destroyWeak(v15);
  }
}

uint64_t __59__CAMDrawerSharedLibraryButtonAccessibility_layoutSubviews__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained safeIntegerForKey:@"sharedLibraryMode"] == *(void *)(a1 + 40)) {
    uint64_t v3 = *MEMORY[0x263F1CF38];
  }
  else {
    uint64_t v3 = 1;
  }
  uint64_t v4 = v3 | *MEMORY[0x263F1CEE8];

  return v4;
}

id __59__CAMDrawerSharedLibraryButtonAccessibility_layoutSubviews__block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMDrawerSharedLibraryButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMDrawerSharedLibraryButtonAccessibility *)&v3 accessibilityTraits];
}

@end