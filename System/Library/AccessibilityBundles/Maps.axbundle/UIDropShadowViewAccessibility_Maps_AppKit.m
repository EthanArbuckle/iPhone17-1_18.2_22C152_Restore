@interface UIDropShadowViewAccessibility_Maps_AppKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axCollapseCard;
- (BOOL)_axExpandCard;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityViewIsModal;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)_accessibilityContaineeViewController;
- (id)_accessibilityContainerViewController;
- (int64_t)accessibilityContainerType;
- (unint64_t)_accessibilityContaineeLayout;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
- (void)setLayoutIfSupported:(unint64_t)a3 animated:(BOOL)a4;
@end

@implementation UIDropShadowViewAccessibility_Maps_AppKit

+ (id)safeCategoryTargetClassName
{
  return @"UIDropShadowView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIDropShadowView", @"_topGrabber", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIDropShadowView", @"contentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ContainerViewController", @"setLayoutIfSupported: animated:", "v", "Q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ModalContaineeViewController", @"_dismissContainee", "v", 0);
  [v3 validateClass:@"ContainerViewController"];
  [v3 validateClass:@"ModalContaineeViewController"];
  [v3 validateClass:@"CollectionCreateViewController"];
  [v3 validateClass:@"ControlContaineeViewController"];
  [v3 validateClass:@"MapsRouteCreationContainee"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ContainerViewController", @"currentViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CardPresentationController", @"containeeLayout", "Q", 0);
}

- (void)setLayoutIfSupported:(unint64_t)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)UIDropShadowViewAccessibility_Maps_AppKit;
  [(UIDropShadowViewAccessibility_Maps_AppKit *)&v4 setLayoutIfSupported:a3 animated:a4];
}

- (BOOL)_axExpandCard
{
  id v3 = [(UIDropShadowViewAccessibility_Maps_AppKit *)self _accessibilityContainerViewController];
  unint64_t v4 = [(UIDropShadowViewAccessibility_Maps_AppKit *)self _accessibilityContaineeLayout];
  if (v4 == 2)
  {
    v5 = v9;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v6 = __58__UIDropShadowViewAccessibility_Maps_AppKit__axExpandCard__block_invoke_2;
  }
  else
  {
    if (v4 != 1)
    {
      BOOL v7 = 0;
      goto LABEL_7;
    }
    v5 = v10;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v6 = __58__UIDropShadowViewAccessibility_Maps_AppKit__axExpandCard__block_invoke;
  }
  v5[2] = v6;
  v5[3] = &unk_26512D688;
  v5[4] = v3;
  AXPerformSafeBlock();

  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (BOOL)_axCollapseCard
{
  id v3 = [(UIDropShadowViewAccessibility_Maps_AppKit *)self _accessibilityContainerViewController];
  unint64_t v4 = [(UIDropShadowViewAccessibility_Maps_AppKit *)self _accessibilityContaineeLayout];
  if (v4 - 3 >= 2)
  {
    if (v4 != 2)
    {
      BOOL v7 = 0;
      goto LABEL_7;
    }
    v5 = v10;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v6 = __60__UIDropShadowViewAccessibility_Maps_AppKit__axCollapseCard__block_invoke;
  }
  else
  {
    v5 = v9;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v6 = __60__UIDropShadowViewAccessibility_Maps_AppKit__axCollapseCard__block_invoke_2;
  }
  v5[2] = v6;
  v5[3] = &unk_26512D688;
  v5[4] = v3;
  AXPerformSafeBlock();

  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v20[2] = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)UIDropShadowViewAccessibility_Maps_AppKit;
  [(UIDropShadowViewAccessibility_Maps_AppKit *)&v19 _accessibilityLoadAccessibilityInformation];
  id v3 = [(UIDropShadowViewAccessibility_Maps_AppKit *)self safeUIViewForKey:@"_topGrabber"];
  objc_msgSend(v3, "_accessibilitySetFrameExpansion:", 20.0, 10.0);
  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityRespondsToUserInteraction:1];
  [v3 setAccessibilityIdentifier:@"Card grabber"];
  unint64_t v4 = [v3 accessibilityCustomActions];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    objc_initWeak(&location, self);
    id v6 = objc_alloc(MEMORY[0x263F1C390]);
    BOOL v7 = AXMapsLocString(@"EXPAND_CARD");
    v8 = (void *)[v6 initWithName:v7 target:self selector:sel__axExpandCard];

    id v9 = objc_alloc(MEMORY[0x263F1C390]);
    v10 = AXMapsLocString(@"COLLAPSE_CARD");
    v11 = (void *)[v9 initWithName:v10 target:self selector:sel__axCollapseCard];

    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:self selector:sel__axCollapseCard name:@"AXCollapseMapsChromeNotification" object:0];

    v20[0] = v8;
    v20[1] = v11;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    [v3 setAccessibilityCustomActions:v13];

    v14 = AXMapsLocString(@"CARD_GRABBER_VIEW");
    [v3 setAccessibilityLabel:v14];

    v15 = AXMapsLocString(@"CARD_GRABBER_VIEW_HINT");
    [v3 setAccessibilityHint:v15];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __87__UIDropShadowViewAccessibility_Maps_AppKit__accessibilityLoadAccessibilityInformation__block_invoke;
    v16[3] = &unk_26512D610;
    objc_copyWeak(&v17, &location);
    [v3 _setAccessibilityValueBlock:v16];
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)UIDropShadowViewAccessibility_Maps_AppKit;
  [(UIDropShadowViewAccessibility_Maps_AppKit *)&v4 layoutSubviews];
  [(UIDropShadowViewAccessibility_Maps_AppKit *)self _accessibilityLoadAccessibilityInformation];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"AXMapVisibleRegionDidChange" object:0];
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (id)_accessibilityContainerViewController
{
  v2 = (void *)MEMORY[0x263F1CB68];
  id v3 = [(UIDropShadowViewAccessibility_Maps_AppKit *)self safeUIViewForKey:@"contentView"];
  objc_super v4 = [v2 viewControllerForView:v3];

  MEMORY[0x245653010](@"ControlContaineeViewController");
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (MEMORY[0x245653010](@"MapsRouteCreationContainee"), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v5 = [v4 safeValueForKey:@"cardPresentationController"];
    id v6 = [v5 safeValueForKey:@"containerViewController"];

    MEMORY[0x245653010](@"ContainerViewController");
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

- (id)_accessibilityContaineeViewController
{
  v2 = [(UIDropShadowViewAccessibility_Maps_AppKit *)self _accessibilityContainerViewController];
  id v3 = [v2 safeValueForKey:@"currentViewController"];

  return v3;
}

- (unint64_t)_accessibilityContaineeLayout
{
  v2 = (void *)MEMORY[0x263F1CB68];
  id v3 = [(UIDropShadowViewAccessibility_Maps_AppKit *)self safeUIViewForKey:@"contentView"];
  objc_super v4 = [v2 viewControllerForView:v3];

  MEMORY[0x245653010](@"ControlContaineeViewController");
  if (((objc_opt_isKindOfClass() & 1) != 0
     || (MEMORY[0x245653010](@"MapsRouteCreationContainee"), (objc_opt_isKindOfClass() & 1) != 0))
    && ([v4 safeValueForKey:@"cardPresentationController"],
        (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;
    unint64_t v7 = [v5 safeUnsignedIntegerForKey:@"containeeLayout"];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [MEMORY[0x263F1CB68] viewControllerForView:self];
  MEMORY[0x245653010](@"ModalContaineeViewController");
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v5 = v2;
    AXPerformSafeBlock();
  }
  return isKindOfClass & 1;
}

- (BOOL)accessibilityViewIsModal
{
  id v3 = [(UIDropShadowViewAccessibility_Maps_AppKit *)self _accessibilityContaineeViewController];
  MEMORY[0x245653010](@"CollectionCreateViewController");
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0
    || [(UIDropShadowViewAccessibility_Maps_AppKit *)self _accessibilityContaineeLayout] == 3;

  return v4;
}

@end