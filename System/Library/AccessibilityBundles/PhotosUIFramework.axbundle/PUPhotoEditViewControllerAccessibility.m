@interface PUPhotoEditViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_reloadToolbarButtonsIfNeeded;
- (void)_updateMainActionButtonAnimated:(BOOL)a3;
- (void)_updateToolbarsAnimated:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PUPhotoEditViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUPhotoEditViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PUPhotoEditViewController" hasInstanceVariable:@"_moreButton" withType:"PUPhotoEditToolbarButton"];
  [v3 validateClass:@"PUPhotoEditViewController" hasInstanceVariable:@"_redEyeButton" withType:"PUPhotoEditToolbarButton"];
  [v3 validateClass:@"PUPhotoEditViewController" hasInstanceVariable:@"_ttrButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditViewController", @"_updateToolbarsAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditViewController", @"_updateMainActionButtonAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditViewController", @"_reloadToolbarButtonsIfNeeded", "v", 0);
  [v3 validateClass:@"PUPhotoEditViewController" hasInstanceVariable:@"_mediaView" withType:"NUMediaView"];
  [v3 validateClass:@"NUMediaView" hasInstanceVariable:@"_renderView" withType:"NURenderView"];
  [v3 validateClass:@"NUMediaView" hasInstanceVariable:@"_renderer" withType:"NUMediaViewRenderer"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NUMediaViewRenderer", @"computedDisplayType", "Q", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v21.receiver = self;
  v21.super_class = (Class)PUPhotoEditViewControllerAccessibility;
  [(PUPhotoEditViewControllerAccessibility *)&v21 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PUPhotoEditViewControllerAccessibility *)self safeValueForKey:@"_moreButton"];
  v4 = accessibilityPULocalizedString(@"plugin.tool");
  [v3 setAccessibilityLabel:v4];

  v5 = [(PUPhotoEditViewControllerAccessibility *)self safeValueForKey:@"_redEyeButton"];
  v6 = accessibilityPULocalizedString(@"redeye.tool");
  [v5 setAccessibilityLabel:v6];

  v7 = [(PUPhotoEditViewControllerAccessibility *)self safeValueForKey:@"_ttrButton"];
  v8 = accessibilityPULocalizedString(@"ttr.tool");
  [v7 setAccessibilityLabel:v8];

  v9 = [(PUPhotoEditViewControllerAccessibility *)self safeValueForKey:@"_mediaView"];
  v10 = [v9 safeValueForKey:@"_renderView"];
  v11 = [v9 safeValueForKey:@"_renderer"];
  uint64_t v12 = [v11 safeIntegerForKey:@"computedDisplayType"];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __84__PUPhotoEditViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v20[3] = &__block_descriptor_40_e5_B8__0l;
  v20[4] = v12;
  [v10 _setIsAccessibilityElementBlock:v20];
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __84__PUPhotoEditViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v17[3] = &unk_2650A8048;
  objc_copyWeak(&v18, &location);
  [v10 _setAccessibilityTraitsBlock:v17];
  if ((unint64_t)(v12 - 1) >= 3)
  {
    v13 = 0;
  }
  else
  {
    v13 = accessibilityPULocalizedString(off_2650A8068[v12 - 1]);
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __84__PUPhotoEditViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v15[3] = &unk_2650A7F00;
  id v14 = v13;
  id v16 = v14;
  [v10 _setAccessibilityLabelBlock:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

BOOL __84__PUPhotoEditViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return (*(void *)(a1 + 32) & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

uint64_t __84__PUPhotoEditViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x263F1CF00];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained safeValueForKey:@"_redEyeButton"];
  int v4 = [v3 safeBoolForKey:@"isSelected"];

  if (v4) {
    return *MEMORY[0x263F1CEE0] | v1;
  }
  else {
    return v1 & ~*MEMORY[0x263F1CEE0];
  }
}

id __84__PUPhotoEditViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_reloadToolbarButtonsIfNeeded
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditViewControllerAccessibility;
  [(PUPhotoEditViewControllerAccessibility *)&v3 _reloadToolbarButtonsIfNeeded];
  [(PUPhotoEditViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditViewControllerAccessibility;
  [(PUPhotoEditViewControllerAccessibility *)&v3 viewDidLoad];
  [(PUPhotoEditViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_updateToolbarsAnimated:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditViewControllerAccessibility;
  [(PUPhotoEditViewControllerAccessibility *)&v3 _updateToolbarsAnimated:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)_updateMainActionButtonAnimated:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditViewControllerAccessibility;
  [(PUPhotoEditViewControllerAccessibility *)&v3 _updateMainActionButtonAnimated:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end