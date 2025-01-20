@interface CAMModeDialAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)accessibilityFrame;
- (id)_axCurrentCameraMode;
- (id)accessibilityCustomActions;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_axAdjustValue:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setSelectedMode:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMModeDialAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMModeDial";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMModeDial", @"setSelectedMode: animated:", "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMModeDial", @"selectedMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMModeDial", @"dataSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMModeDial", @"_items", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMModeDialItem", @"title", "@", 0);
  [v3 validateClass:@"CAMFullscreenViewfinder"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFullscreenViewfinder", @"setControlDrawerExpanded:forReason:animated:", "v", "B", "q", "B", 0);
}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(@"mode.button.text");
}

- (CGRect)accessibilityFrame
{
  if (AXDeviceIsPad())
  {
    [(CAMModeDialAccessibility *)self bounds];
    v6.origin.y = v3 + 60.0;
    v6.size.height = v4 + -120.0;
    return UIAccessibilityConvertFrameToScreenCoordinates(v6, (UIView *)self);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CAMModeDialAccessibility;
    [(CAMModeDialAccessibility *)&v5 accessibilityFrame];
  }
  return result;
}

- (id)accessibilityIdentifier
{
  return @"CameraMode";
}

- (void)setSelectedMode:(int64_t)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CAMModeDialAccessibility;
  [(CAMModeDialAccessibility *)&v4 setSelectedMode:a3 animated:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (id)_axCurrentCameraMode
{
  double v3 = [(CAMModeDialAccessibility *)self safeValueForKey:@"selectedMode"];
  [v3 unsignedIntegerValue];

  objc_super v4 = [(CAMModeDialAccessibility *)self safeValueForKey:@"_items"];
  objc_super v5 = __UIAccessibilitySafeClass();

  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  id v17 = 0;
  id v11 = v5;
  AXPerformSafeBlock();
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  v7 = [v6 safeValueForKey:@"title"];

  v8 = [v7 lowercaseString];
  v9 = [v8 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_26F403C30];

  return v9;
}

void __48__CAMModeDialAccessibility__axCurrentCameraMode__block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  id v6 = [NSNumber numberWithInteger:a1[6]];
  uint64_t v3 = [v2 objectForKey:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  objc_super v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_axAdjustValue:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(CAMModeDialAccessibility *)self safeValueForKey:@"selectedMode"];
  [v5 unsignedIntegerValue];

  LOBYTE(v16) = 0;
  id v6 = [(CAMModeDialAccessibility *)self safeValueForKey:@"_modes"];
  v7 = __UIAccessibilitySafeClass();

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  id v8 = v7;
  AXPerformSafeBlock();
  uint64_t v9 = v17[3];

  _Block_object_dispose(&v16, 8);
  if (v3)
  {
    LOBYTE(v16) = 0;
    v10 = [(CAMModeDialAccessibility *)self safeValueForKey:@"_modes"];
    id v11 = __UIAccessibilitySafeClass();

    if ((_BYTE)v16) {
      abort();
    }
    uint64_t v12 = [v11 count];

    if (v12 - 1 >= v9 + 1) {
      uint64_t v13 = v9 + 1;
    }
    else {
      uint64_t v13 = v12 - 1;
    }
  }
  else
  {
    if (v9 <= 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v9;
    }
    uint64_t v13 = v14 - 1;
  }
  v15 = [v8 objectAtIndex:v13];
  [v15 integerValue];

  AXPerformSafeBlock();
}

void __43__CAMModeDialAccessibility__axAdjustValue___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  id v3 = [NSNumber numberWithInteger:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = [v2 indexOfObject:v3];
}

void __43__CAMModeDialAccessibility__axAdjustValue___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setSelectedMode:*(void *)(a1 + 40) animated:1];
  [*(id *)(a1 + 32) sendActionsForControlEvents:4096];
  id v2 = [*(id *)(a1 + 32) _axCurrentCameraMode];
  UIAccessibilitySpeak();
}

- (void)accessibilityDecrement
{
}

- (void)accessibilityIncrement
{
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (id)accessibilityCustomActions
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = [(CAMModeDialAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_14 startWithSelf:1];
  if (v3)
  {
    objc_initWeak(&location, v3);
    id v4 = objc_alloc(MEMORY[0x263F1C390]);
    objc_super v5 = accessibilityCameraUILocalizedString(@"camera.controls.show");
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __54__CAMModeDialAccessibility_accessibilityCustomActions__block_invoke_2;
    v10[3] = &unk_26509FB10;
    objc_copyWeak(&v11, &location);
    id v6 = (void *)[v4 initWithName:v5 actionHandler:v10];

    v13[0] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CAMModeDialAccessibility;
    v7 = [(CAMModeDialAccessibility *)&v9 accessibilityCustomActions];
  }

  return v7;
}

uint64_t __54__CAMModeDialAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2455E18B0](@"CAMFullscreenViewfinder");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __54__CAMModeDialAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __54__CAMModeDialAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setControlDrawerExpanded:1 forReason:4 animated:1];
}

@end