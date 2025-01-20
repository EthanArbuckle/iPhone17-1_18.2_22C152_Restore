@interface COSInstallSpinnerButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)showProgressAnimation;
- (void)stopSpinnerView;
@end

@implementation COSInstallSpinnerButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"COSInstallSpinnerButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"COSInstallSpinnerButton" hasInstanceVariable:@"_progressIndicator" withType:"SKUICircleProgressIndicator"];
  [v3 validateClass:@"COSInstallSpinnerButton" hasInstanceVariable:@"_showingSpinner" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"COSInstallSpinnerButton", @"showProgressAnimation", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"COSInstallSpinnerButton", @"stopSpinnerView", "v", 0);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)COSInstallSpinnerButtonAccessibility;
  return *MEMORY[0x263F1CF68] | [(COSInstallSpinnerButtonAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityValue
{
  if ([(COSInstallSpinnerButtonAccessibility *)self safeBoolForKey:@"_showingSpinner"])
  {
    char v8 = 0;
    objc_opt_class();
    objc_super v3 = [(COSInstallSpinnerButtonAccessibility *)self safeValueForKey:@"_progressIndicator"];
    v4 = __UIAccessibilityCastAsClass();

    [v4 progress];
    v5 = AXFormatFloatWithPercentage();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)COSInstallSpinnerButtonAccessibility;
    v5 = [(COSInstallSpinnerButtonAccessibility *)&v7 accessibilityValue];
  }

  return v5;
}

- (void)showProgressAnimation
{
  v2.receiver = self;
  v2.super_class = (Class)COSInstallSpinnerButtonAccessibility;
  [(COSInstallSpinnerButtonAccessibility *)&v2 showProgressAnimation];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __61__COSInstallSpinnerButtonAccessibility_showProgressAnimation__block_invoke(uint64_t a1)
{
}

- (void)stopSpinnerView
{
  v2.receiver = self;
  v2.super_class = (Class)COSInstallSpinnerButtonAccessibility;
  [(COSInstallSpinnerButtonAccessibility *)&v2 stopSpinnerView];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (id)accessibilityLabel
{
  if ([(COSInstallSpinnerButtonAccessibility *)self safeBoolForKey:@"_showingSpinner"])
  {
    objc_super v3 = accessibilityLocalizedString(@"downloading.spinner.button.label");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)COSInstallSpinnerButtonAccessibility;
    objc_super v3 = [(COSInstallSpinnerButtonAccessibility *)&v5 accessibilityLabel];
  }

  return v3;
}

@end