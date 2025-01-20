@interface CAMFlipButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation CAMFlipButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMFlipButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_currentDevicePosition", "q", 0);
  [v3 validateClass:@"CAMViewfinderView"];
}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(@"camera.chooser.button.text");
}

- (id)accessibilityValue
{
  id v3 = [(CAMFlipButtonAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2455E18B0](@"CAMViewfinderView", a2)];
  if (v3
    || ([(CAMFlipButtonAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2455E18B0](@"CAMFullscreenViewfinder")], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = [MEMORY[0x263F1CB68] viewControllerForView:v3];
    v5 = __UIAccessibilitySafeClass();
  }
  else
  {
    id v3 = [(CAMFlipButtonAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_11 startWithSelf:1];
    v10 = [v3 _accessibilityViewController];
    v5 = [v10 safeValueForKey:@"_effectsController"];
  }
  uint64_t v6 = [v5 safeIntegerForKey:@"_currentDevicePosition"];
  if (!v6)
  {
    v7 = @"camera.chooser.back.text";
    goto LABEL_8;
  }
  if (v6 == 1)
  {
    v7 = @"camera.chooser.front.text";
LABEL_8:
    v8 = accessibilityCameraKitLocalizedString(v7);
    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

uint64_t __48__CAMFlipButtonAccessibility_accessibilityValue__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2455E18B0](@"PBController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityHint
{
  return accessibilityCameraUILocalizedString(@"bravo.camera.chooser.hint.text");
}

- (id)accessibilityIdentifier
{
  return @"FrontBackFacingCameraChooser";
}

@end