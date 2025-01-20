@interface SVSBaseViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SVSBaseViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SVSBaseViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SVSBaseViewController", @"viewDidAppear:", "v", "B", 0);
  [v3 validateClass:@"SharingViewService.B389DoneViewController"];
  [v3 validateClass:@"SharingViewService.B389DoneViewController" isKindOfClass:@"SVSBaseViewController"];
  [v3 validateClass:@"SVSCurrentLocationIndicator"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SVSBaseViewController", @"containerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SVSBaseViewController", @"mainController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SharingViewService.B389SetupMainViewController", @"accessibilitySession", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SPPairingSession", @"pairingLocation", "@", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SVSBaseViewControllerAccessibility;
  [(SVSBaseViewControllerAccessibility *)&v20 viewDidAppear:a3];
  v4 = [(SVSBaseViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v4 setAccessibilityContainerType:10];

  v5 = [(SVSBaseViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v5 _setAccessibilityAutomationType:6];

  MEMORY[0x245660AC0](@"SharingViewService.B389DoneViewController");
  if (objc_opt_isKindOfClass())
  {
    v6 = [(SVSBaseViewControllerAccessibility *)self safeUIViewForKey:@"containerView"];
    [v6 _setAccessibilityViewIsModalBlock:&__block_literal_global_0];
    v7 = [v6 _accessibilityFindDescendant:&__block_literal_global_308];
    v8 = accessibilityLocalizedString(@"ax.current.location");
    v9 = UIAXStringForAllChildren();
    v10 = __UIAXStringForVariables();
    objc_msgSend(v7, "setAccessibilityLabel:", v10, v9, @"__AXStringForVariablesSentinel");

    [v7 setIsAccessibilityElement:1];
    v11 = [v6 _accessibilityFindDescendant:&__block_literal_global_322];
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy_;
    v18[4] = __Block_byref_object_dispose_;
    id v19 = 0;
    v12 = [(SVSBaseViewControllerAccessibility *)self safeValueForKey:@"mainController"];
    v13 = [v12 safeValueForKey:@"accessibilitySession"];

    v14 = [v13 safeValueForKey:@"pairingLocation"];
    id v15 = objc_alloc_init(MEMORY[0x263F00A40]);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __52__SVSBaseViewControllerAccessibility_viewDidAppear___block_invoke_330;
    v17[3] = &unk_265150680;
    v17[4] = v18;
    [v15 reverseGeocodeLocation:v14 completionHandler:v17];
    [v11 _setIsAccessibilityElementBlock:&__block_literal_global_337];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __52__SVSBaseViewControllerAccessibility_viewDidAppear___block_invoke_3_338;
    v16[3] = &unk_2651506A8;
    v16[4] = v18;
    [v11 _setAccessibilityLabelBlock:v16];

    _Block_object_dispose(v18, 8);
  }
}

uint64_t __52__SVSBaseViewControllerAccessibility_viewDidAppear___block_invoke()
{
  return 1;
}

BOOL __52__SVSBaseViewControllerAccessibility_viewDidAppear___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245660AC0](@"UIStackView");
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 subviews];
    v4 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_314);
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __52__SVSBaseViewControllerAccessibility_viewDidAppear___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245660AC0](@"SVSCurrentLocationIndicator");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __52__SVSBaseViewControllerAccessibility_viewDidAppear___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245660AC0](@"UIImageView");
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 superview];
    MEMORY[0x245660AC0](@"UIButton");
    char v4 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v4 = 0;
  }

  return v4 & 1;
}

void __52__SVSBaseViewControllerAccessibility_viewDidAppear___block_invoke_330(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    _AXLogWithFacility();
  }
  else
  {
    id v16 = [a2 firstObject];
    char v4 = [v16 name];
    BOOL v5 = [v16 thoroughfare];
    v6 = [v16 locality];
    v7 = [v16 administrativeArea];
    v8 = [v16 postalCode];
    v9 = [v16 country];
    v10 = [v16 inlandWater];
    v11 = [v16 ocean];
    uint64_t v12 = __UIAXStringForVariables();
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      id v15 = v9;
      if (v9 || (id v15 = v10) != 0 || (id v15 = v11) != 0)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v15);
      }
    }
  }
}

uint64_t __52__SVSBaseViewControllerAccessibility_viewDidAppear___block_invoke_2_335()
{
  return 1;
}

id __52__SVSBaseViewControllerAccessibility_viewDidAppear___block_invoke_3_338(uint64_t a1)
{
  return *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
}

@end