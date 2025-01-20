@interface CPSLaunchContentViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (CGRect)_axFrameForInformationContainerView;
- (id)_axBackgroundView;
- (id)_axButtons;
- (id)_axDescriptionLabel;
- (id)_axInformationContainerView;
- (id)_axLabels;
- (id)_axNameLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateContent;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CPSLaunchContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CPSLaunchContentViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CPSLaunchContentViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CPSLaunchContentViewController", @"_updateContent", "v", 0);
  [v3 validateClass:@"CPSLaunchContentViewController" hasInstanceVariable:@"_clipNameVibrantLabel" withType:"CPSVibrantLabel"];
  [v3 validateClass:@"CPSLaunchContentViewController" hasInstanceVariable:@"_clipDescriptionVibrantLabel" withType:"CPSVibrantLabel"];
  [v3 validateClass:@"CPSLaunchContentViewController" hasInstanceVariable:@"_openButton" withType:"UIButton"];
  [v3 validateClass:@"CPSLaunchContentViewController" hasInstanceVariable:@"_closeButton" withType:"CPSVibrantButton"];
  [v3 validateClass:@"CPSLaunchContentViewController" hasInstanceVariable:@"_clipInformationContainerView" withType:"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CPSLaunchContentViewController", @"_openAppClip:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CPSLaunchContentViewController", @"dismiss:", "v", "@", 0);
  [v3 validateClass:@"UITransitionView"];
  [v3 validateClass:@"CPSLaunchContentViewController" isKindOfClass:@"UIViewController"];
}

- (CGRect)_axFrameForInformationContainerView
{
  id v3 = [(CPSLaunchContentViewControllerAccessibility *)self _axNameLabel];
  [v3 accessibilityFrame];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  v12 = [(CPSLaunchContentViewControllerAccessibility *)self _axDescriptionLabel];
  [v12 accessibilityFrame];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;

  uint64_t v21 = v5;
  uint64_t v22 = v7;
  uint64_t v23 = v9;
  uint64_t v24 = v11;
  uint64_t v25 = v14;
  uint64_t v26 = v16;
  uint64_t v27 = v18;
  uint64_t v28 = v20;

  return CGRectUnion(*(CGRect *)&v21, *(CGRect *)&v25);
}

- (id)_axNameLabel
{
  return (id)[(CPSLaunchContentViewControllerAccessibility *)self safeUIViewForKey:@"_clipNameVibrantLabel"];
}

- (id)_axDescriptionLabel
{
  return (id)[(CPSLaunchContentViewControllerAccessibility *)self safeUIViewForKey:@"_clipDescriptionVibrantLabel"];
}

- (id)_axLabels
{
  id v3 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v4 = [(CPSLaunchContentViewControllerAccessibility *)self _axNameLabel];
  uint64_t v5 = [(CPSLaunchContentViewControllerAccessibility *)self _axDescriptionLabel];
  uint64_t v6 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v4, v5);

  return v6;
}

- (id)_axInformationContainerView
{
  return (id)[(CPSLaunchContentViewControllerAccessibility *)self safeUIViewForKey:@"_clipInformationContainerView"];
}

- (id)_axButtons
{
  v2 = [(CPSLaunchContentViewControllerAccessibility *)self _axInformationContainerView];
  id v3 = [v2 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_1];

  return v3;
}

uint64_t __57__CPSLaunchContentViewControllerAccessibility__axButtons__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axBackgroundView
{
  objc_opt_class();
  id v3 = [(CPSLaunchContentViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  uint64_t v4 = [v3 _accessibilityFindAncestor:&__block_literal_global_319 startWithSelf:0];
  uint64_t v5 = __UIAccessibilityCastAsClass();

  uint64_t v6 = [v5 subviews];
  if ([v6 count] == 2)
  {
    uint64_t v7 = [v6 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v6 objectAtIndexedSubscript:1];
      MEMORY[0x245647820](@"PRXCardContainerView");
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v10 = [v6 objectAtIndexedSubscript:0];
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  uint64_t v10 = 0;
LABEL_7:

  return v10;
}

uint64_t __64__CPSLaunchContentViewControllerAccessibility__axBackgroundView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245647820](@"UITransitionView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  AXPerformSafeBlock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __73__CPSLaunchContentViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dismiss:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CE68];

  UIAccessibilityPostNotification(v2, 0);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CPSLaunchContentViewControllerAccessibility;
  [(CPSLaunchContentViewControllerAccessibility *)&v3 viewDidLoad];
  [(CPSLaunchContentViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CPSLaunchContentViewControllerAccessibility;
  [(CPSLaunchContentViewControllerAccessibility *)&v6 viewDidAppear:a3];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE18];
  uint64_t v5 = [(CPSLaunchContentViewControllerAccessibility *)self _axNameLabel];
  UIAccessibilityPostNotification(v4, v5);
}

- (void)_updateContent
{
  v3.receiver = self;
  v3.super_class = (Class)CPSLaunchContentViewControllerAccessibility;
  [(CPSLaunchContentViewControllerAccessibility *)&v3 _updateContent];
  [(CPSLaunchContentViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v17.receiver = self;
  v17.super_class = (Class)CPSLaunchContentViewControllerAccessibility;
  [(CPSLaunchContentViewControllerAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(CPSLaunchContentViewControllerAccessibility *)self _axBackgroundView];
  UIAccessibilityNotifications v4 = [(CPSLaunchContentViewControllerAccessibility *)self _axInformationContainerView];
  [v3 setIsAccessibilityElement:1];
  uint64_t v5 = accessibilityLocalizedString(@"popover.view.dismiss");
  [v3 setAccessibilityLabel:v5];

  [v4 _setAccessibilityServesAsFirstElement:1];
  objc_super v6 = (void *)MEMORY[0x263EFF8C0];
  char v7 = [(CPSLaunchContentViewControllerAccessibility *)self _axLabels];
  uint64_t v8 = [(CPSLaunchContentViewControllerAccessibility *)self _axButtons];
  uint64_t v9 = objc_msgSend(v6, "axArrayWithPossiblyNilArrays:", 2, v7, v8);
  [v4 setAccessibilityElements:v9];

  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __89__CPSLaunchContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v14[3] = &unk_265116208;
  objc_copyWeak(&v15, &location);
  [v3 _setAccessibilityActivateBlock:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __89__CPSLaunchContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v12[3] = &unk_265116230;
  objc_copyWeak(&v13, &location);
  [v4 _setAccessibilityFrameBlock:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __89__CPSLaunchContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v10[3] = &unk_265116208;
  objc_copyWeak(&v11, &location);
  [v4 _setAccessibilityActivateBlock:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

uint64_t __89__CPSLaunchContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained accessibilityPerformEscape];

  return v2;
}

double __89__CPSLaunchContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _axFrameForInformationContainerView];
  double v3 = v2;

  return v3;
}

uint64_t __89__CPSLaunchContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v2);
  return 1;
}

void __89__CPSLaunchContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _openAppClip:0];
}

@end