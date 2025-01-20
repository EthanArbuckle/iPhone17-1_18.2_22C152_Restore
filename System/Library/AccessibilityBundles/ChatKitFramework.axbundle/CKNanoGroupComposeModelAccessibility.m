@interface CKNanoGroupComposeModelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateStickerViewModels;
- (void)_axAnnotateViewModels;
- (void)_axAnnotateWaveformViewModels;
- (void)configureStickerViewModel;
- (void)configureWaveFormViewModel;
- (void)transitionModelStateTo:(unint64_t)a3;
@end

@implementation CKNanoGroupComposeModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKNanoGroupComposeModel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNanoGroupComposeModel", @"transitionModelStateTo:", "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNanoGroupComposeModel", @"disabledSendViewModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNanoGroupComposeModel", @"configureStickerViewModel", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNanoGroupComposeModel", @"stickerViewModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNanoGroupComposeModel", @"sticker", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNanoGroupComposeModel", @"waveFormViewModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKNanoGroupComposeModel", @"configureWaveFormViewModel", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CKNanoGroupComposeModelAccessibility;
  [(CKNanoGroupComposeModelAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CKNanoGroupComposeModelAccessibility *)self _axAnnotateViewModels];
}

- (void)transitionModelStateTo:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKNanoGroupComposeModelAccessibility;
  [(CKNanoGroupComposeModelAccessibility *)&v4 transitionModelStateTo:a3];
  [(CKNanoGroupComposeModelAccessibility *)self _axAnnotateViewModels];
}

- (void)configureStickerViewModel
{
  v3.receiver = self;
  v3.super_class = (Class)CKNanoGroupComposeModelAccessibility;
  [(CKNanoGroupComposeModelAccessibility *)&v3 configureStickerViewModel];
  [(CKNanoGroupComposeModelAccessibility *)self _axAnnotateStickerViewModels];
}

- (void)configureWaveFormViewModel
{
  v3.receiver = self;
  v3.super_class = (Class)CKNanoGroupComposeModelAccessibility;
  [(CKNanoGroupComposeModelAccessibility *)&v3 configureWaveFormViewModel];
  [(CKNanoGroupComposeModelAccessibility *)self _axAnnotateWaveformViewModels];
}

- (void)_axAnnotateViewModels
{
  id v2 = [(CKNanoGroupComposeModelAccessibility *)self safeValueForKey:@"disabledSendViewModel"];
  [v2 setAccessibilityTraits:*MEMORY[0x263F1CF20]];
}

- (void)_axAnnotateStickerViewModels
{
  objc_super v3 = [(CKNanoGroupComposeModelAccessibility *)self safeValueForKey:@"sticker"];
  id v5 = [v3 accessibilityLabel];

  if (v5)
  {
    objc_super v4 = [(CKNanoGroupComposeModelAccessibility *)self safeValueForKey:@"stickerViewModel"];
    [v4 setAccessibilityLabel:v5];
  }
}

- (void)_axAnnotateWaveformViewModels
{
  id v3 = [(CKNanoGroupComposeModelAccessibility *)self safeValueForKey:@"waveFormViewModel"];
  id v2 = accessibilityLocalizedString(@"waveform.image");
  [v3 setAccessibilityLabel:v2];
}

@end