@interface PKPhysicalCardReaderModeActivationViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation PKPhysicalCardReaderModeActivationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPhysicalCardReaderModeActivationViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPhysicalCardReaderModeActivationViewController" isKindOfClass:@"PKExplanationViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKExplanationViewController", @"explanationView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPhysicalCardReaderModeActivationViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKExplanationView", @"bodyTextView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)PKPhysicalCardReaderModeActivationViewControllerAccessibility;
  [(PKPhysicalCardReaderModeActivationViewControllerAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  id v3 = [(PKPhysicalCardReaderModeActivationViewControllerAccessibility *)self safeUIViewForKey:@"explanationView"];
  v4 = [v3 safeValueForKey:@"bodyTextView"];
  v5 = __UIAccessibilityCastAsClass();

  objc_initWeak(&location, v5);
  [v5 setIsAccessibilityElement:1];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __107__PKPhysicalCardReaderModeActivationViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v6[3] = &unk_265140E18;
  objc_copyWeak(&v7, &location);
  [v5 _setAccessibilityValueBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

id __107__PKPhysicalCardReaderModeActivationViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  if (AXRequestingClient() == 3)
  {
    v2 = accessibilityLocalizedString(@"voiceover.physical.card.instructions");
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v2 = [WeakRetained text];
  }

  return v2;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PKPhysicalCardReaderModeActivationViewControllerAccessibility;
  [(PKPhysicalCardReaderModeActivationViewControllerAccessibility *)&v3 viewDidLoad];
  [(PKPhysicalCardReaderModeActivationViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end