@interface PUCropToolControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axRotationLabel:(int64_t)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_aspectButtonTapped:(id)a3;
- (void)_axAnnounceFlipOrRotateOrientation;
- (void)_flipButtonTapped:(id)a3;
- (void)_rotateButtonTapped:(id)a3;
- (void)_userChangedAspectRatioLocked:(BOOL)a3;
- (void)cropAspectFlipperView:(id)a3 cropOrientationSelected:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation PUCropToolControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUCropToolController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropToolController", @"rotateButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropToolController", @"autoButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropToolController", @"flipButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropToolController", @"_rotateButtonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropToolController", @"_flipButtonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropToolController", @"_aspectButtonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropToolController", @"aspectButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropToolController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropToolController", @"geometry", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLImageGeometry", @"userOrientation", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropToolController", @"cropAspectFlipperView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropToolController", @"cropAspectFlipperView:cropOrientationSelected:", "v", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropToolController", @"autoButtonMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropToolController", @"cropAspect", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropAspect", @"localizedName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropAspect", @"width", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropAspect", @"height", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropToolController", @"cropAspectViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropToolController", @"_userChangedAspectRatioLocked:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropToolController", @"cropAspect", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropAspect", @"isFreeformCrop", "B", 0);
}

- (id)_axRotationLabel:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v3 = @"crop.rotate.normal";
      goto LABEL_10;
    case 2:
      id v3 = @"crop.flip.horizontal";
      goto LABEL_10;
    case 3:
      v5 = NSString;
      v6 = accessibilityPULocalizedString(@"crop.rotate.degrees");
      uint64_t v7 = 180;
      goto LABEL_12;
    case 4:
      id v3 = @"crop.flip.vertical";
      goto LABEL_10;
    case 5:
      id v3 = @"crop.rotate.transpose";
      goto LABEL_10;
    case 6:
      v5 = NSString;
      v6 = accessibilityPULocalizedString(@"crop.rotate.degrees");
      uint64_t v7 = 90;
      goto LABEL_12;
    case 7:
      id v3 = @"crop.rotate.transverse";
LABEL_10:
      v4 = accessibilityPULocalizedString(v3);
      break;
    case 8:
      v5 = NSString;
      v6 = accessibilityPULocalizedString(@"crop.rotate.degrees");
      uint64_t v7 = 270;
LABEL_12:
      v4 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);

      break;
    default:
      v4 = 0;
      break;
  }

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v48.receiver = self;
  v48.super_class = (Class)PUCropToolControllerAccessibility;
  [(PUCropToolControllerAccessibility *)&v48 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  LOBYTE(v39) = 0;
  objc_opt_class();
  id v3 = [(PUCropToolControllerAccessibility *)self safeValueForKey:@"autoButton"];
  v4 = __UIAccessibilityCastAsClass();

  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v45[3] = &unk_2650A7D50;
  objc_copyWeak(&v46, &location);
  [v4 _setAccessibilityLabelBlock:v45];
  objc_opt_class();
  v5 = [(PUCropToolControllerAccessibility *)self safeValueForKey:@"rotateButton"];
  v6 = __UIAccessibilityCastAsClass();

  [v6 _setAccessibilityLabelBlock:&__block_literal_global_14];
  objc_opt_class();
  uint64_t v7 = [(PUCropToolControllerAccessibility *)self safeValueForKey:@"aspectButton"];
  v8 = __UIAccessibilityCastAsClass();

  [v8 _setAccessibilityLabelBlock:&__block_literal_global_404];
  v9 = [(PUCropToolControllerAccessibility *)self safeValueForKey:@"cropAspect"];
  v10 = v9;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__7;
  v43 = __Block_byref_object_dispose__7;
  id v44 = 0;
  if (v9)
  {
    uint64_t v11 = [v9 safeStringForKey:@"localizedName"];
    v12 = (void *)v40[5];
    v40[5] = v11;

    v13 = (void *)v40[5];
    v14 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    uint64_t v15 = [v13 rangeOfCharacterFromSet:v14];

    if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_6;
    }
    [v10 safeCGFloatForKey:@"width"];
    uint64_t v17 = v16;
    [v10 safeCGFloatForKey:@"height"];
    uint64_t v19 = v18;
    v20 = NSString;
    v21 = accessibilityPULocalizedString(@"aspect.ratio.value");
    uint64_t v22 = objc_msgSend(v20, "stringWithFormat:", v21, v17, v19);
    v23 = (void *)v40[5];
    v40[5] = v22;
  }
  else
  {
    uint64_t v24 = accessibilityPULocalizedString(@"aspect.ratio.freeform");
    v21 = (void *)v40[5];
    v40[5] = v24;
  }

LABEL_6:
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_415;
  v38[3] = &unk_2650A8238;
  v38[4] = &v39;
  [v8 _setAccessibilityValueBlock:v38];
  v25 = [(PUCropToolControllerAccessibility *)self safeValueForKey:@"cropAspectViewController"];
  if (v25) {
    v26 = @"crop.aspectratio.hint.dismiss";
  }
  else {
    v26 = @"crop.aspectratio.hint";
  }
  v27 = accessibilityPULocalizedString(v26);

  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2_422;
  v36[3] = &unk_2650A7F00;
  id v28 = v27;
  id v37 = v28;
  [v8 _setAccessibilityHintBlock:v36];
  objc_opt_class();
  v29 = [(PUCropToolControllerAccessibility *)self safeValueForKey:@"flipButton"];
  v30 = __UIAccessibilityCastAsClass();

  [v30 _setAccessibilityLabelBlock:&__block_literal_global_425];
  char v35 = 0;
  objc_opt_class();
  v31 = [(PUCropToolControllerAccessibility *)self safeValueForKey:@"aspectRatioLockButton"];
  v32 = __UIAccessibilityCastAsClass();

  [v32 _setAccessibilityLabelBlock:&__block_literal_global_433];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
  v33[3] = &unk_2650A8260;
  objc_copyWeak(&v34, &location);
  [v32 _setIsAccessibilityElementBlock:v33];
  [v32 _setAccessibilityTraitsBlock:&__block_literal_global_440];
  objc_destroyWeak(&v34);

  _Block_object_dispose(&v39, 8);
  objc_destroyWeak(&v46);

  objc_destroyWeak(&location);
}

id __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained safeIntegerForKey:@"autoButtonMode"];

  if (v2 == 1)
  {
    id v3 = @"crop.auto";
    goto LABEL_5;
  }
  if (v2 == 3)
  {
    id v3 = @"crop.reset";
LABEL_5:
    v4 = accessibilityPULocalizedString(v3);
    goto LABEL_7;
  }
  v4 = 0;
LABEL_7:

  return v4;
}

id __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return accessibilityPULocalizedString(@"crop.rotate");
}

id __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3()
{
  return accessibilityPULocalizedString(@"crop.aspectratio");
}

id __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_415(uint64_t a1)
{
  return *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
}

id __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2_422(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3_423()
{
  return accessibilityPULocalizedString(@"crop.flip");
}

id __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4()
{
  return accessibilityPULocalizedString(@"photoedit.crop.aspect.ratio.locked");
}

uint64_t __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained safeValueForKey:@"cropAspect"];

  if (v2) {
    uint64_t v3 = [v2 safeBoolForKey:@"isFreeformCrop"] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __79__PUCropToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6()
{
  return *MEMORY[0x263F1CF40] | *MEMORY[0x263F1CEE8];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PUCropToolControllerAccessibility;
  [(PUCropToolControllerAccessibility *)&v3 viewDidLoad];
  [(PUCropToolControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_rotateButtonTapped:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUCropToolControllerAccessibility;
  [(PUCropToolControllerAccessibility *)&v6 _rotateButtonTapped:a3];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE68];
  v5 = [(PUCropToolControllerAccessibility *)self safeValueForKey:@"_rotateButton"];
  UIAccessibilityPostNotification(v4, v5);

  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __57__PUCropToolControllerAccessibility__rotateButtonTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axAnnounceFlipOrRotateOrientation];
}

- (void)_flipButtonTapped:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUCropToolControllerAccessibility;
  [(PUCropToolControllerAccessibility *)&v6 _flipButtonTapped:a3];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE68];
  v5 = [(PUCropToolControllerAccessibility *)self safeValueForKey:@"_flipButton"];
  UIAccessibilityPostNotification(v4, v5);

  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __55__PUCropToolControllerAccessibility__flipButtonTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axAnnounceFlipOrRotateOrientation];
}

- (void)_aspectButtonTapped:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUCropToolControllerAccessibility;
  [(PUCropToolControllerAccessibility *)&v4 _aspectButtonTapped:a3];
  AXPerformBlockOnMainThreadAfterDelay();
  [(PUCropToolControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

void __57__PUCropToolControllerAccessibility__aspectButtonTapped___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE68];
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"cropAspectFlipperView"];
  UIAccessibilityPostNotification(v1, v2);
}

- (void)_axAnnounceFlipOrRotateOrientation
{
  objc_super v3 = [(PUCropToolControllerAccessibility *)self safeValueForKey:@"geometry"];
  objc_super v4 = __UIAccessibilitySafeClass();

  v5 = -[PUCropToolControllerAccessibility _axRotationLabel:](self, "_axRotationLabel:", [v4 safeIntegerForKey:@"userOrientation"]);
  UIAccessibilitySpeak();
}

- (void)cropAspectFlipperView:(id)a3 cropOrientationSelected:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PUCropToolControllerAccessibility;
  [(PUCropToolControllerAccessibility *)&v5 cropAspectFlipperView:a3 cropOrientationSelected:a4];
  [(PUCropToolControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_userChangedAspectRatioLocked:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUCropToolControllerAccessibility;
  -[PUCropToolControllerAccessibility _userChangedAspectRatioLocked:](&v6, sel__userChangedAspectRatioLocked_);
  if (v3) {
    objc_super v4 = @"photoedit.crop.aspect.ratio.locked";
  }
  else {
    objc_super v4 = @"photoedit.crop.aspect.ratio.unlocked";
  }
  objc_super v5 = accessibilityPULocalizedString(v4);
  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

@end