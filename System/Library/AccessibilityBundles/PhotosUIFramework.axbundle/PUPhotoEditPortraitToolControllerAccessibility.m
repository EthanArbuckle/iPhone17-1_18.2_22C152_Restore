@interface PUPhotoEditPortraitToolControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_setupDepthControlsIfNeeded;
- (BOOL)_setupLightingControlsIfNeeded;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation PUPhotoEditPortraitToolControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUPhotoEditPortraitToolController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PXUIButton" isKindOfClass:@"UIButton"];
  [v3 validateClass:@"PUPhotoEditPortraitToolController" hasInstanceVariable:@"_portraitToolbarButton" withType:"PUPhotoEditToolActivationButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditPortraitToolController", @"_setupDepthControlsIfNeeded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditPortraitToolController", @"viewDidLoad", "v", 0);
  [v3 validateClass:@"PUPhotoEditPortraitToolController" hasInstanceVariable:@"_lightingIntensityButton" withType:"PUPhotoEditToolbarButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditPortraitToolController", @"_setupLightingControlsIfNeeded", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v14.receiver = self;
  v14.super_class = (Class)PUPhotoEditPortraitToolControllerAccessibility;
  [(PUPhotoEditPortraitToolControllerAccessibility *)&v14 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  id v3 = [(PUPhotoEditPortraitToolControllerAccessibility *)self safeValueForKey:@"_portraitToolbarButton"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = *MEMORY[0x263F1CEE8];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  [v4 _setAccessibilityLabelBlock:&__block_literal_global_10];
  objc_initWeak(&location, v4);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __92__PUPhotoEditPortraitToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v11[3] = &unk_2650A7D50;
  objc_copyWeak(&v12, &location);
  [v4 _setAccessibilityValueBlock:v11];
  LOBYTE(from) = 0;
  objc_opt_class();
  v6 = [(PUPhotoEditPortraitToolControllerAccessibility *)self safeValueForKey:@"_lightingIntensityButton"];
  v7 = __UIAccessibilityCastAsClass();

  [v7 setAccessibilityTraits:v5];
  [v7 _setAccessibilityLabelBlock:&__block_literal_global_339];
  objc_initWeak(&from, v7);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __92__PUPhotoEditPortraitToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v8[3] = &unk_2650A7D50;
  objc_copyWeak(&v9, &from);
  [v7 _setAccessibilityValueBlock:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

id __92__PUPhotoEditPortraitToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityPULocalizedString(@"depth.effect");
}

id __92__PUPhotoEditPortraitToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isSelected]) {
    v2 = @"iris.tool.on";
  }
  else {
    v2 = @"iris.tool.off";
  }
  id v3 = accessibilityPULocalizedString(v2);

  return v3;
}

id __92__PUPhotoEditPortraitToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3()
{
  return accessibilityPULocalizedString(@"light.intensity");
}

id __92__PUPhotoEditPortraitToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isSelected]) {
    v2 = @"light.intensity.on";
  }
  else {
    v2 = @"light.intensity.off";
  }
  id v3 = accessibilityPULocalizedString(v2);

  return v3;
}

- (BOOL)_setupDepthControlsIfNeeded
{
  v5.receiver = self;
  v5.super_class = (Class)PUPhotoEditPortraitToolControllerAccessibility;
  BOOL v3 = [(PUPhotoEditPortraitToolControllerAccessibility *)&v5 _setupDepthControlsIfNeeded];
  [(PUPhotoEditPortraitToolControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
  return v3;
}

- (BOOL)_setupLightingControlsIfNeeded
{
  v5.receiver = self;
  v5.super_class = (Class)PUPhotoEditPortraitToolControllerAccessibility;
  BOOL v3 = [(PUPhotoEditPortraitToolControllerAccessibility *)&v5 _setupLightingControlsIfNeeded];
  [(PUPhotoEditPortraitToolControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
  return v3;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditPortraitToolControllerAccessibility;
  [(PUPhotoEditPortraitToolControllerAccessibility *)&v3 viewDidLoad];
  [(PUPhotoEditPortraitToolControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end