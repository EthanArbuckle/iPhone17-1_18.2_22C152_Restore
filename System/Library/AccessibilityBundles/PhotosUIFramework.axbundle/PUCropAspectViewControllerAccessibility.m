@interface PUCropAspectViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)aspectButtonPressed:(id)a3;
- (void)updateAspectButtons;
- (void)viewDidLoad;
@end

@implementation PUCropAspectViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUCropAspectViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropAspectViewController", @"aspectButtons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropAspectViewController", @"allAspectRatios", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropAspectViewController", @"buttonContainer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropAspect", @"localizedName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropAspect", @"width", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropAspect", @"height", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropAspectViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropAspectViewController", @"aspectButtonPressed:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropAspectViewController", @"updateAspectButtons", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUCropAspectViewController", @"delegate", "@", 0);
  [v3 validateClass:@"PUCropToolController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)PUCropAspectViewControllerAccessibility;
  [(PUCropAspectViewControllerAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PUCropAspectViewControllerAccessibility *)self safeArrayForKey:@"aspectButtons"];
  v4 = [(PUCropAspectViewControllerAccessibility *)self safeArrayForKey:@"allAspectRatios"];
  v5 = [(PUCropAspectViewControllerAccessibility *)self safeUIViewForKey:@"buttonContainer"];
  [v5 _setAccessibilityLabelBlock:&__block_literal_global_6];
  [v5 setAccessibilityContainerType:4];
  uint64_t v6 = [v3 count];
  if (v6 == [v4 count])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __85__PUCropAspectViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v7[3] = &unk_2650A7F28;
    id v8 = v3;
    [v4 enumerateObjectsUsingBlock:v7];
  }
}

id __85__PUCropAspectViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityPULocalizedString(@"aspect.ratios");
}

void __85__PUCropAspectViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) objectAtIndex:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__PUCropAspectViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v8[3] = &unk_2650A7F00;
  id v9 = v5;
  id v7 = v5;
  [v6 _setAccessibilityLabelBlock:v8];
}

id __85__PUCropAspectViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) safeStringForKey:@"localizedName"];
  id v3 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  uint64_t v4 = [v2 rangeOfCharacterFromSet:v3];

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v2;
  }
  else
  {
    [*(id *)(a1 + 32) safeCGFloatForKey:@"width"];
    uint64_t v7 = v6;
    [*(id *)(a1 + 32) safeCGFloatForKey:@"height"];
    uint64_t v9 = v8;
    v10 = NSString;
    v11 = accessibilityPULocalizedString(@"aspect.ratio.value");
    objc_msgSend(v10, "stringWithFormat:", v11, v7, v9);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PUCropAspectViewControllerAccessibility;
  [(PUCropAspectViewControllerAccessibility *)&v3 viewDidLoad];
  [(PUCropAspectViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)aspectButtonPressed:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUCropAspectViewControllerAccessibility;
  [(PUCropAspectViewControllerAccessibility *)&v5 aspectButtonPressed:a3];
  [(PUCropAspectViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
  uint64_t v4 = [(PUCropAspectViewControllerAccessibility *)self safeValueForKey:@"delegate"];
  NSClassFromString(&cfstr_Pucroptoolcont_0.isa);
  if (objc_opt_isKindOfClass()) {
    [v4 _accessibilityLoadAccessibilityInformation];
  }
}

- (void)updateAspectButtons
{
  v3.receiver = self;
  v3.super_class = (Class)PUCropAspectViewControllerAccessibility;
  [(PUCropAspectViewControllerAccessibility *)&v3 updateAspectButtons];
  [(PUCropAspectViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end