@interface PUPhotoEditMediaToolControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateLivePhotoButtonAnimated:(BOOL)a3;
- (void)_updateMuteButtonAnimated:(BOOL)a3;
- (void)_updateTrimControlAndToolbarButtons;
- (void)reloadToolbarButtons:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PUPhotoEditMediaToolControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUPhotoEditMediaToolController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PUPhotoEditMediaToolController" hasInstanceVariable:@"_muteButton" withType:"PUPhotoEditToolbarButton"];
  [v3 validateClass:@"PUPhotoEditMediaToolController" hasInstanceVariable:@"_livePhotoButton" withType:"PUPhotoEditToolActivationButton"];
  [v3 validateClass:@"PUPhotoEditMediaToolController" hasInstanceVariable:@"_portraitVideoButton" withType:"PUPhotoEditToolActivationButton"];
  [v3 validateClass:@"PUPhotoEditMediaToolController" hasInstanceVariable:@"_autoFocusButton" withType:"PUPhotoEditToolbarButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditMediaToolController", @"viewDidAppear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditMediaToolController", @"_updateTrimControlAndToolbarButtons", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditMediaToolController", @"reloadToolbarButtons:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditMediaToolController", @"_updateLivePhotoButtonAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditMediaToolController", @"_updateMuteButtonAnimated:", "v", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v33.receiver = self;
  v33.super_class = (Class)PUPhotoEditMediaToolControllerAccessibility;
  [(PUPhotoEditMediaToolControllerAccessibility *)&v33 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  id v3 = [(PUPhotoEditMediaToolControllerAccessibility *)self safeValueForKey:@"_muteButton"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = *MEMORY[0x263F1CEE8];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  [v4 _setAccessibilityLabelBlock:&__block_literal_global_9];
  objc_initWeak(&location, v4);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v30[3] = &unk_2650A7D50;
  objc_copyWeak(&v31, &location);
  [v4 _setAccessibilityValueBlock:v30];
  v6 = (void *)[v4 accessibilityTraits];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v28[3] = &unk_2650A8000;
  objc_copyWeak(v29, &location);
  v29[1] = v6;
  [v4 _setAccessibilityTraitsBlock:v28];
  LOBYTE(from) = 0;
  objc_opt_class();
  v7 = [(PUPhotoEditMediaToolControllerAccessibility *)self safeValueForKey:@"_portraitVideoButton"];
  v8 = __UIAccessibilityCastAsClass();

  [v8 setAccessibilityTraits:v5];
  [v8 _setAccessibilityLabelBlock:&__block_literal_global_346];
  objc_initWeak(&from, v8);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
  v25[3] = &unk_2650A7D50;
  objc_copyWeak(&v26, &from);
  [v8 _setAccessibilityValueBlock:v25];
  v9 = (void *)[v8 accessibilityTraits];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6;
  v23[3] = &unk_2650A8000;
  objc_copyWeak(v24, &from);
  v24[1] = v9;
  [v8 _setAccessibilityTraitsBlock:v23];
  LOBYTE(v22) = 0;
  objc_opt_class();
  v10 = [(PUPhotoEditMediaToolControllerAccessibility *)self safeValueForKey:@"_autoFocusButton"];
  v11 = __UIAccessibilityCastAsClass();

  [v11 setAccessibilityTraits:v5];
  [v11 _setAccessibilityLabelBlock:&__block_literal_global_357];
  objc_initWeak(&v22, v11);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8;
  v20[3] = &unk_2650A7D50;
  objc_copyWeak(&v21, &v22);
  [v11 _setAccessibilityValueBlock:v20];
  v12 = (void *)[v11 accessibilityTraits];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_9;
  v18[3] = &unk_2650A8000;
  objc_copyWeak(v19, &v22);
  v19[1] = v12;
  [v11 _setAccessibilityTraitsBlock:v18];
  LOBYTE(v17) = 0;
  objc_opt_class();
  v13 = [(PUPhotoEditMediaToolControllerAccessibility *)self safeValueForKey:@"_livePhotoButton"];
  v14 = __UIAccessibilityCastAsClass();

  [v14 setAccessibilityTraits:v5];
  [v14 _setAccessibilityLabelBlock:&__block_literal_global_368];
  objc_initWeak(&v17, v14);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_11;
  v15[3] = &unk_2650A7D50;
  objc_copyWeak(&v16, &v17);
  [v14 _setAccessibilityValueBlock:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v17);

  objc_destroyWeak(v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v22);

  objc_destroyWeak(v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&from);

  objc_destroyWeak(v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

id __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityPULocalizedString(@"volume.label");
}

id __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isSelected]) {
    v2 = @"volume.label.off";
  }
  else {
    v2 = @"volume.label.on";
  }
  id v3 = accessibilityPULocalizedString(v2);

  return v3;
}

uint64_t __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained isEnabled];
  uint64_t v4 = *MEMORY[0x263F1CF20];
  if (v3) {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 40) | v4;

  return v5;
}

id __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4()
{
  return accessibilityPULocalizedString(@"cinematic.label");
}

id __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isSelected]) {
    v2 = @"cinematic.on";
  }
  else {
    v2 = @"cinematic.off";
  }
  int v3 = accessibilityPULocalizedString(v2);

  return v3;
}

uint64_t __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained isEnabled];
  uint64_t v4 = *MEMORY[0x263F1CF20];
  if (v3) {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 40) | v4;

  return v5;
}

id __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7()
{
  return accessibilityPULocalizedString(@"cinematic.focus");
}

id __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isSelected]) {
    v2 = @"cinematic.auto";
  }
  else {
    v2 = @"cinematic.manual";
  }
  int v3 = accessibilityPULocalizedString(v2);

  return v3;
}

uint64_t __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained isEnabled];
  uint64_t v4 = *MEMORY[0x263F1CF20];
  if (v3) {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 40) | v4;

  return v5;
}

id __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_10()
{
  return accessibilityPULocalizedString(@"iris.tool.label");
}

id __89__PUPhotoEditMediaToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isSelected]) {
    v2 = @"iris.tool.on";
  }
  else {
    v2 = @"iris.tool.off";
  }
  int v3 = accessibilityPULocalizedString(v2);

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditMediaToolControllerAccessibility;
  [(PUPhotoEditMediaToolControllerAccessibility *)&v4 viewDidAppear:a3];
  [(PUPhotoEditMediaToolControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_updateTrimControlAndToolbarButtons
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditMediaToolControllerAccessibility;
  [(PUPhotoEditMediaToolControllerAccessibility *)&v3 _updateTrimControlAndToolbarButtons];
  [(PUPhotoEditMediaToolControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)reloadToolbarButtons:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditMediaToolControllerAccessibility;
  [(PUPhotoEditMediaToolControllerAccessibility *)&v4 reloadToolbarButtons:a3];
  [(PUPhotoEditMediaToolControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_updateLivePhotoButtonAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditMediaToolControllerAccessibility;
  [(PUPhotoEditMediaToolControllerAccessibility *)&v4 _updateLivePhotoButtonAnimated:a3];
  [(PUPhotoEditMediaToolControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_updateMuteButtonAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditMediaToolControllerAccessibility;
  [(PUPhotoEditMediaToolControllerAccessibility *)&v4 _updateMuteButtonAnimated:a3];
  [(PUPhotoEditMediaToolControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end