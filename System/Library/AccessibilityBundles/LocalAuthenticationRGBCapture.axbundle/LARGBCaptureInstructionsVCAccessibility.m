@interface LARGBCaptureInstructionsVCAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation LARGBCaptureInstructionsVCAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LARGBCaptureInstructionsVC";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LARGBCaptureInstructionsVC", @"loadView", "v", 0);
  [v3 validateClass:@"LARGBCaptureInstructionsVC" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"LARGBCaptureInstructionsVC" hasInstanceVariable:@"_footerText" withType:"UITextView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)LARGBCaptureInstructionsVCAccessibility;
  [(LARGBCaptureInstructionsVCAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = *MEMORY[0x263F1CEF8];
  v4 = [(LARGBCaptureInstructionsVCAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  [v4 setAccessibilityTraits:v3];

  v5 = [(LARGBCaptureInstructionsVCAccessibility *)self safeUIViewForKey:@"_footerText"];
  [v5 setAccessibilityTraits:*MEMORY[0x263F21AA8]];

  v6 = [(LARGBCaptureInstructionsVCAccessibility *)self safeUIViewForKey:@"_footerText"];
  [v6 setAccessibilityLabel:0];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)LARGBCaptureInstructionsVCAccessibility;
  [(LARGBCaptureInstructionsVCAccessibility *)&v3 loadView];
  [(LARGBCaptureInstructionsVCAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end