@interface IdentityProofingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation IdentityProofingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CoreIDVUI.IdentityProofingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CoreIDVUI.IdentityProofingViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CoreIDVUI.IdentityProofingViewController", @"titleLabel", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)IdentityProofingViewControllerAccessibility;
  [(IdentityProofingViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = *MEMORY[0x263F1CEF8];
  v4 = [(IdentityProofingViewControllerAccessibility *)self safeUIViewForKey:@"titleLabel"];
  [v4 setAccessibilityTraits:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)IdentityProofingViewControllerAccessibility;
  [(IdentityProofingViewControllerAccessibility *)&v3 viewDidLoad];
  [(IdentityProofingViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidAppear:(BOOL)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)IdentityProofingViewControllerAccessibility;
  [(IdentityProofingViewControllerAccessibility *)&v9 viewDidAppear:a3];
  v4 = [(IdentityProofingViewControllerAccessibility *)self safeUIViewForKey:@"titleLabel"];
  objc_super v5 = [v4 accessibilityLabel];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v10 = *MEMORY[0x263F1CE80];
    v11[0] = *MEMORY[0x263F1CE40];
    v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v8 = (void *)[v6 initWithString:v5 attributes:v7];

    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v8);
  }
}

@end