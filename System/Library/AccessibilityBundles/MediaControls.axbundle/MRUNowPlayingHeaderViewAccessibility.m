@interface MRUNowPlayingHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityContainingMRUControlCenterCollectionViewCell;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axMakeNowPlayingHeaderViewElement;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (int64_t)_accessibilityNowPlayingLayout;
@end

@implementation MRUNowPlayingHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUNowPlayingHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingHeaderView", @"labelView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingHeaderView", @"transportButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingHeaderView", @"routingButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingHeaderView", @"layout", "q", 0);
  [v3 validateClass:@"MRUControlCenterCollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingLabelView", @"routeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingLabelView", @"titleMarqueeView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingLabelView", @"subtitleMarqueeView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUMarqueeLabel", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingLabelView", @"placeholder", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUNowPlayingHeaderView", @"hapticView", "@", 0);
}

- (id)_axMakeNowPlayingHeaderViewElement
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__MRUNowPlayingHeaderViewAccessibility__axMakeNowPlayingHeaderViewElement__block_invoke;
  v7[3] = &unk_265130468;
  objc_copyWeak(&v8, &location);
  [v3 _setAccessibilityLabelBlock:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__MRUNowPlayingHeaderViewAccessibility__axMakeNowPlayingHeaderViewElement__block_invoke_2;
  v5[3] = &unk_2651304B8;
  objc_copyWeak(&v6, &location);
  [v3 _setAccessibilityFrameBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v3;
}

id __74__MRUNowPlayingHeaderViewAccessibility__axMakeNowPlayingHeaderViewElement__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"labelView"];
  id v3 = [v2 safeUIViewForKey:@"routeLabel"];
  [v3 alpha];
  if (v4 <= 0.01)
  {
    v5 = 0;
  }
  else
  {
    v5 = [v3 accessibilityLabel];
  }
  id v6 = [v2 safeValueForKey:@"titleMarqueeView"];
  v7 = [v2 safeValueForKey:@"subtitleMarqueeView"];
  id v8 = [v6 safeStringForKey:@"text"];
  v11 = [v7 safeStringForKey:@"text"];
  v9 = __UIAXStringForVariables();

  return v9;
}

double __74__MRUNowPlayingHeaderViewAccessibility__axMakeNowPlayingHeaderViewElement__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _accessibilityNowPlayingLayout] == 3) {
    [WeakRetained _accessibilityContainingMRUControlCenterCollectionViewCell];
  }
  else {
  v2 = [WeakRetained safeValueForKey:@"labelView"];
  }
  [v2 accessibilityFrame];
  double v4 = v3;

  return v4;
}

- (id)accessibilityElements
{
  v12[1] = *MEMORY[0x263EF8340];
  double v3 = (void *)MEMORY[0x263F81490];
  double v4 = [(MRUNowPlayingHeaderViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (!v4)
  {
    v5 = [(MRUNowPlayingHeaderViewAccessibility *)self _axMakeNowPlayingHeaderViewElement];
    v12[0] = v5;
    double v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];

    [(MRUNowPlayingHeaderViewAccessibility *)self _accessibilitySetRetainedValue:v4 forKey:*v3];
  }
  id v6 = [MEMORY[0x263EFF980] arrayWithArray:v4];
  v7 = [(MRUNowPlayingHeaderViewAccessibility *)self safeUIViewForKey:@"transportButton"];
  id v8 = [(MRUNowPlayingHeaderViewAccessibility *)self safeUIViewForKey:@"routingButton"];
  [v7 alpha];
  if (v9 > 0.01) {
    [v6 axSafelyAddObject:v7];
  }
  [v8 alpha];
  if (v10 > 0.01) {
    [v6 axSafelyAddObject:v8];
  }

  return v6;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MRUNowPlayingHeaderViewAccessibility;
  v5 = -[MRUNowPlayingHeaderViewAccessibility _accessibilityHitTest:withEvent:](&v8, sel__accessibilityHitTest_withEvent_, a4, a3.x, a3.y);
  if (!v5)
  {
    id v6 = [(MRUNowPlayingHeaderViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
    v5 = [v6 firstObject];
  }

  return v5;
}

- (int64_t)_accessibilityNowPlayingLayout
{
  return [(MRUNowPlayingHeaderViewAccessibility *)self safeIntegerForKey:@"layout"];
}

- (id)_accessibilityContainingMRUControlCenterCollectionViewCell
{
  if (_accessibilityContainingMRUControlCenterCollectionViewCell_onceToken != -1) {
    dispatch_once(&_accessibilityContainingMRUControlCenterCollectionViewCell_onceToken, &__block_literal_global_4);
  }
  if (_accessibilityContainingMRUControlCenterCollectionViewCell_MRUControlCenterCollectionViewCellClass)
  {
    double v3 = -[MRUNowPlayingHeaderViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:");
    if (v3) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = _accessibilityContainingMRUControlCenterCollectionViewCell_MRUViewServiceEndpointTableViewCellClass == 0;
    }
    if (!v4)
    {
      v5 = -[MRUNowPlayingHeaderViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:");
      goto LABEL_11;
    }
  }
  v5 = 0;
LABEL_11:

  return v5;
}

Class __98__MRUNowPlayingHeaderViewAccessibility__accessibilityContainingMRUControlCenterCollectionViewCell__block_invoke()
{
  _accessibilityContainingMRUControlCenterCollectionViewCell_MRUControlCenterCollectionViewCellClass = (uint64_t)NSClassFromString(&cfstr_Mrucontrolcent_4.isa);
  Class result = NSClassFromString(&cfstr_Mruviewservice_0.isa);
  _accessibilityContainingMRUControlCenterCollectionViewCell_MRUViewServiceEndpointTableViewCellClass = (uint64_t)result;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(MRUNowPlayingHeaderViewAccessibility *)self safeValueForKey:@"labelView"];
  double v3 = [v2 safeValueForKey:@"routeLabel"];
  BOOL v4 = [v3 accessibilityLabel];

  v5 = [v2 safeValueForKey:@"placeholder"];
  id v6 = [v2 accessibilityLabel];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    double v10 = [v2 accessibilityLabel];
    objc_super v8 = __UIAXStringForVariables();
  }
  else
  {
    objc_super v8 = __UIAXStringForVariables();
  }

  return v8;
}

- (id)_accessibilitySupplementaryFooterViews
{
  double v3 = [MEMORY[0x263EFF980] array];
  v10.receiver = self;
  v10.super_class = (Class)MRUNowPlayingHeaderViewAccessibility;
  BOOL v4 = [(MRUNowPlayingHeaderViewAccessibility *)&v10 _accessibilitySupplementaryFooterViews];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(MRUNowPlayingHeaderViewAccessibility *)self safeValueForKey:@"hapticView"];
  if (v5)
  {
    id v6 = [MEMORY[0x263F110B0] sharedManager];
    int v7 = [v6 musicHapticsEnabled];

    if (v7) {
      [v3 axSafelyAddObject:v5];
    }
  }
  objc_super v8 = [(MRUNowPlayingHeaderViewAccessibility *)self safeValueForKey:@"transportButton"];
  [v3 axSafelyAddObject:v8];

  return v3;
}

@end