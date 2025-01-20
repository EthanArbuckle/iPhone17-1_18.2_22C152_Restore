@interface PXHighFidelityVideoOverlayButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (PXHighFidelityVideoOverlayButtonAccessibility)initWithConfiguration:(id)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PXHighFidelityVideoOverlayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXHighFidelityVideoOverlayButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PXHighFidelityVideoOverlayButton" hasInstanceVariable:@"_button" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXHighFidelityVideoOverlayButton", @"initWithConfiguration:", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)PXHighFidelityVideoOverlayButtonAccessibility;
  [(PXHighFidelityVideoOverlayButtonAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PXHighFidelityVideoOverlayButtonAccessibility *)self safeValueForKey:@"_button"];
  [v3 setIsAccessibilityElement:0];
}

- (PXHighFidelityVideoOverlayButtonAccessibility)initWithConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXHighFidelityVideoOverlayButtonAccessibility;
  id v3 = [(PXHighFidelityVideoOverlayButtonAccessibility *)&v5 initWithConfiguration:a3];
  [(PXHighFidelityVideoOverlayButtonAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  return v3;
}

- (id)accessibilityLabel
{
  return accessibilityPhotosUICoreLocalizedString(@"memory.video.play");
}

- (BOOL)isAccessibilityElement
{
  v2 = [(PXHighFidelityVideoOverlayButtonAccessibility *)self isAccessibilityUserDefinedElement];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PXHighFidelityVideoOverlayButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PXHighFidelityVideoOverlayButtonAccessibility *)&v3 accessibilityTraits];
}

@end