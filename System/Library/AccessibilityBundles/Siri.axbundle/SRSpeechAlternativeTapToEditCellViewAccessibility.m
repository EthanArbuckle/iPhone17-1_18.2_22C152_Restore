@interface SRSpeechAlternativeTapToEditCellViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (SRSpeechAlternativeTapToEditCellViewAccessibility)init;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateTapToEditLabel;
@end

@implementation SRSpeechAlternativeTapToEditCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SRSpeechAlternativeTapToEditCellView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SRSpeechAlternativeTapToEditCellView", @"init", "@", 0);
  [v3 validateClass:@"SRSpeechAlternativeTapToEditCellView" hasInstanceVariable:@"_tapToEditLabel" withType:"UILabel"];
}

- (void)_axAnnotateTapToEditLabel
{
  id v2 = [(SRSpeechAlternativeTapToEditCellViewAccessibility *)self safeValueForKey:@"_tapToEditLabel"];
  [v2 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)SRSpeechAlternativeTapToEditCellViewAccessibility;
  [(SRSpeechAlternativeTapToEditCellViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(SRSpeechAlternativeTapToEditCellViewAccessibility *)self _axAnnotateTapToEditLabel];
}

- (SRSpeechAlternativeTapToEditCellViewAccessibility)init
{
  v5.receiver = self;
  v5.super_class = (Class)SRSpeechAlternativeTapToEditCellViewAccessibility;
  id v2 = [(SRSpeechAlternativeTapToEditCellViewAccessibility *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    [(SRSpeechAlternativeTapToEditCellViewAccessibility *)v2 _axAnnotateTapToEditLabel];
  }
  return v3;
}

@end