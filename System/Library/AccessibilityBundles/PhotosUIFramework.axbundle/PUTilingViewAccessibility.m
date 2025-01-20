@interface PUTilingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)accessibilityPerformEscape;
- (BOOL)canBecomeFocused;
- (CGSize)_accessibilityContentSize;
- (double)_accessibilityScrollWidthDistance;
- (id)_accessibilityScrollStatus;
@end

@implementation PUTilingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUTilingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpBarsController", @"browsingSession", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUBrowsingSession", @"viewModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUBrowsingViewModel", @"isChromeVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpViewController", @"_barsController", "@", 0);
  [v3 validateClass:@"PUTilingView" isKindOfClass:@"UIScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTilingView", @"layout", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTilingLayout", @"preferredScrollInfo", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTilingScrollInfo", @"interpageSpacing", "{CGSize=dd}", 0);
  [v3 validateClass:@"PUScrubberView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"canBecomeFocused", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_isEligibleForFocusInteraction", "B", 0);
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [(PUTilingViewAccessibility *)self safeValueForKey:@"delegate"];
  id v3 = [v2 safeValueForKey:@"_barsController"];

  v4 = [v3 safeValueForKey:@"browsingSession"];
  v5 = [v4 safeValueForKey:@"viewModel"];

  char v6 = [v5 safeBoolForKey:@"isChromeVisible"];
  if (v3) {
    char v7 = v6;
  }
  else {
    char v7 = 1;
  }
  if ((v7 & 1) == 0)
  {
    id v9 = v3;
    AXPerformSafeBlock();
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
  return v7 ^ 1;
}

uint64_t __55__PUTilingViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleTapGestureRecognizer:0];
}

- (double)_accessibilityScrollWidthDistance
{
  v12.receiver = self;
  v12.super_class = (Class)PUTilingViewAccessibility;
  [(PUTilingViewAccessibility *)&v12 _accessibilityScrollWidthDistance];
  double v4 = v3;
  v5 = [(PUTilingViewAccessibility *)self safeValueForKey:@"layout"];
  char v6 = [v5 safeValueForKey:@"preferredScrollInfo"];

  objc_opt_class();
  char v7 = [v6 safeValueForKey:@"interpageSpacing"];
  v8 = __UIAccessibilityCastAsClass();

  [v8 CGSizeValue];
  double v10 = v4 + v9;

  return v10;
}

- (id)_accessibilityScrollStatus
{
  v2 = [(PUTilingViewAccessibility *)self safeValueForKey:@"delegate"];
  double v3 = [v2 safeValueForKey:@"browsingSession"];
  double v4 = accessibilityPULocalizedString(@"photo.scrubber.photo");
  v5 = AXScrollStatusForBrowsingSession(v3, v4);

  return v5;
}

- (CGSize)_accessibilityContentSize
{
  v2 = [(PUTilingViewAccessibility *)self safeValueForKey:@"layout"];
  [v2 safeCGRectForKey:@"contentBounds"];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  double MaxX = CGRectGetMaxX(v17);
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  double v12 = MaxX - CGRectGetMinX(v18);
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  double MaxY = CGRectGetMaxY(v19);
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  double v14 = MaxY - CGRectGetMinY(v20);
  double v15 = v12;
  result.height = v14;
  result.width = v15;
  return result;
}

- (BOOL)canBecomeFocused
{
  v5.receiver = self;
  v5.super_class = (Class)PUTilingViewAccessibility;
  unsigned __int8 v3 = [(PUTilingViewAccessibility *)&v5 canBecomeFocused];
  return [(PUTilingViewAccessibility *)self _accessibilityIsFKARunningForFocusItem] | v3;
}

- (BOOL)_isEligibleForFocusInteraction
{
  if ([(PUTilingViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    unsigned __int8 v3 = [(PUTilingViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Puscrubberview.isa)];
    BOOL v4 = v3 == 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PUTilingViewAccessibility;
    return [(PUTilingViewAccessibility *)&v6 _isEligibleForFocusInteraction];
  }
  return v4;
}

@end