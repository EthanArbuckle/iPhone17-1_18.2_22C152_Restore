@interface PUAudioToolControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PUAudioToolControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PhotosUIPrivate.PUAudioToolController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)PUAudioToolControllerAccessibility;
  [(PUAudioToolControllerAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  v3 = [(PUAudioToolControllerAccessibility *)self safeSwiftValueForKey:@"muteButton"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  [v4 _setAccessibilityLabelBlock:&__block_literal_global_1];
  objc_initWeak(&location, v4);
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  v7 = __80__PUAudioToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v8 = &unk_2650A7D50;
  objc_copyWeak(&v9, &location);
  [v4 _setAccessibilityValueBlock:&v5];
  objc_msgSend(v4, "_setAccessibilityTraitsBlock:", &__block_literal_global_319, v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

id __80__PUAudioToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityPULocalizedString(@"volume.label");
}

id __80__PUAudioToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isSelected]) {
    v2 = @"volume.label.off";
  }
  else {
    v2 = @"volume.label.on";
  }
  v3 = accessibilityPULocalizedString(v2);

  return v3;
}

uint64_t __80__PUAudioToolControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3()
{
  return *MEMORY[0x263F1CEE8];
}

@end