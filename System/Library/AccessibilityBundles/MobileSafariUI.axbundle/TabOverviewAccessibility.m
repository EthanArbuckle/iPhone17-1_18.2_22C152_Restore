@interface TabOverviewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsScrollAncestor;
- (BOOL)_accessibilityScrollToView:(id)a3;
- (BOOL)_isClosingLastItem;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)isAccessibilityOpaqueElementProvider;
- (BOOL)shouldGroupAccessibilityChildren;
- (CGPoint)_accessibilityAdjustedScrollOffset:(CGPoint)a3;
- (CGPoint)_accessibilityThumbnailOffset;
- (TabOverviewAccessibility)initWithFrame:(CGRect)a3;
- (id)_accessibilityScrollStatus;
- (id)_accessibilityScrollStatusFormatString;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityThumbnailApplyScrollOffset:(CGPoint)a3;
- (void)_dismissWithItemAtCurrentDecelerationFactor:(id)a3;
- (void)layoutSubviews;
@end

@implementation TabOverviewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TabOverview";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BarButton" isKindOfClass:@"UIButton"];
  [v3 validateClass:@"TabOverview" isKindOfClass:@"UIView"];
  [v3 validateClass:@"BarButton" isKindOfClass:@"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabOverview", @"layoutSubviews", "v", 0);
  [v3 validateClass:@"TabOverview" hasInstanceVariable:@"_interpolatedLocation" withType:"TabOverviewInterpolatedLocation"];
  [v3 validateClass:@"TabOverview" hasInstanceVariable:@"_header" withType:"TabOverviewToolbar"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabOverviewInterpolatedLocation", @"location", "{?={CGPoint=dd}dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabOverviewInterpolatedLocation", @"resetToLocation:", "v", "{?={CGPoint=dd}dd}", 0);
  [v3 validateClass:@"TabOverview" hasInstanceVariable:@"_searchBar" withType:"SFTabOverviewSearchBar"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabOverview", @"_updateDisplayLink", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabOverview", @"_contentSize", "{CGSize=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabOverview", @"_dismissWithItemAtCurrentDecelerationFactor:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabOverview", @"_isClosingLastItem", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabOverview", @"presentationState", "q", 0);
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)TabOverviewAccessibility;
  [(TabOverviewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(TabOverviewAccessibility *)self safeUIViewForKey:@"_header"];
  [v3 setAccessibilityContainerType:4];
  [v3 _accessibilitySetOnlyComparesByXAxis:1];
  [v3 setShouldGroupAccessibilityChildren:1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TabOverviewAccessibility;
  [(TabOverviewAccessibility *)&v3 layoutSubviews];
  [(TabOverviewAccessibility *)self _accessibilityLoadAccessibilityInformation];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A78]);
}

- (TabOverviewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TabOverviewAccessibility;
  objc_super v3 = -[TabOverviewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(TabOverviewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  return v3;
}

- (CGPoint)_accessibilityThumbnailOffset
{
  [(TabOverviewAccessibility *)self safeValueForKey:@"_interpolatedLocation"];
  uint64_t v7 = 0;
  v8 = (double *)&v7;
  uint64_t v9 = 0x4010000000;
  v10 = "";
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  double v2 = v8[4];
  double v3 = v8[5];

  _Block_object_dispose(&v7, 8);
  double v4 = v2;
  double v5 = v3;
  result.y = v5;
  result.x = v4;
  return result;
}

uint64_t __57__TabOverviewAccessibility__accessibilityThumbnailOffset__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) location];
  double v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (BOOL)_accessibilityScrollToView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TabOverviewAccessibility *)self safeIntegerForKey:@"presentationState"];
  if (v5 != 3)
  {
    objc_opt_class();
    uint64_t v6 = __UIAccessibilityCastAsClass();
    [v4 bounds];
    objc_msgSend(v4, "convertRect:toView:", v6);
    AX_CGRectGetCenter();
    double v8 = v7;
    [v6 frame];
    AX_CGRectGetCenter();
    -[TabOverviewAccessibility _accessibilityThumbnailApplyScrollOffset:](self, "_accessibilityThumbnailApplyScrollOffset:", 0.0, v9 - v8);
    AXPerformBlockOnMainThreadAfterDelay();
  }
  return v5 != 3;
}

void __55__TabOverviewAccessibility__accessibilityScrollToView___block_invoke()
{
}

- (void)_accessibilityThumbnailApplyScrollOffset:(CGPoint)a3
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  AXPerformSafeBlock();
  _Block_object_dispose(v10, 8);
  id v4 = [(TabOverviewAccessibility *)self safeValueForKey:@"_interpolatedLocation"];
  uint64_t v9 = MEMORY[0x263EF8330];
  id v5 = v4;
  AXPerformSafeBlock();
  id v6 = (id)[(TabOverviewAccessibility *)self safeValueForKey:@"_updateDisplayLink", v9, 3221225472, __69__TabOverviewAccessibility__accessibilityThumbnailApplyScrollOffset___block_invoke_2, &unk_265137048, self];
  LOBYTE(v10[0]) = 0;
  objc_opt_class();
  double v7 = __UIAccessibilityCastAsClass();
  if (LOBYTE(v10[0])) {
    abort();
  }
  double v8 = v7;
  [v7 setNeedsLayout];
}

void __69__TabOverviewAccessibility__accessibilityThumbnailApplyScrollOffset___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"_searchBar"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 resignFirstResponder];
}

uint64_t __69__TabOverviewAccessibility__accessibilityThumbnailApplyScrollOffset___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityAdjustedScrollOffset:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  double v3 = v2;
  uint64_t v11 = 0;
  long long v12 = (double *)&v11;
  uint64_t v13 = 0x4010000000;
  v14 = "";
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = MEMORY[0x263EF8330];
  id v10 = *(id *)(a1 + 40);
  AXPerformSafeBlock();
  double v4 = v12[4];
  double v5 = v12[5];
  double v6 = v12[6];
  double v7 = v12[7];

  _Block_object_dispose(&v11, 8);
  return objc_msgSend(*(id *)(a1 + 40), "resetToLocation:", v4, v3 + v5, v6, v7, v9, 3221225472, __69__TabOverviewAccessibility__accessibilityThumbnailApplyScrollOffset___block_invoke_3, &unk_265137020);
}

uint64_t __69__TabOverviewAccessibility__accessibilityThumbnailApplyScrollOffset___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) location];
  double v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (CGPoint)_accessibilityAdjustedScrollOffset:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  [(TabOverviewAccessibility *)self _accessibilityThumbnailOffset];
  double v7 = v6;
  double v8 = y + v6;
  if (y + v6 <= 0.0)
  {
    uint64_t v9 = [(TabOverviewAccessibility *)self safeValueForKey:@"_contentSize"];
    [v9 CGSizeValue];
    double v22 = v10;

    objc_opt_class();
    uint64_t v11 = __UIAccessibilityCastAsClass();
    [v11 bounds];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;

    v24.origin.CGFloat x = v13;
    v24.origin.double y = v15;
    v24.size.width = v17;
    v24.size.height = v19;
    if (v22 - CGRectGetHeight(v24) < -v8)
    {
      v25.origin.CGFloat x = v13;
      v25.origin.double y = v15;
      v25.size.width = v17;
      v25.size.height = v19;
      double y = -(v7 + v22 - CGRectGetHeight(v25));
    }
  }
  else
  {
    double y = -v6;
  }
  double v20 = x;
  double v21 = y;
  result.double y = v21;
  result.CGFloat x = v20;
  return result;
}

- (id)_accessibilityScrollStatus
{
  double v3 = [(TabOverviewAccessibility *)self safeValueForKey:@"_contentSize"];
  [v3 CGSizeValue];

  [(TabOverviewAccessibility *)self bounds];
  [(TabOverviewAccessibility *)self _accessibilityThumbnailOffset];
  uint64_t v4 = NSString;
  uint64_t v5 = [(TabOverviewAccessibility *)self _accessibilityScrollStatusFormatString];
  double v6 = AXFormatInteger();
  double v7 = AXFormatInteger();
  double v8 = objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);

  return v8;
}

- (id)_accessibilityScrollStatusFormatString
{
  return (id)MEMORY[0x270F80B08](@"scroll.page.summary", a2);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  uint64_t v5 = [(TabOverviewAccessibility *)self safeValueForKey:@"frame"];
  [v5 rectValue];
  double v7 = v6;

  if (a3 == 4)
  {
    double v8 = -(v7 + -30.0);
    goto LABEL_5;
  }
  if (a3 == 3)
  {
    double v8 = v7 + -30.0;
LABEL_5:
    -[TabOverviewAccessibility _accessibilityThumbnailApplyScrollOffset:](self, "_accessibilityThumbnailApplyScrollOffset:", 0.0, v8);
    UIAccessibilityNotifications v9 = *MEMORY[0x263F1CE30];
    double v10 = [(TabOverviewAccessibility *)self _accessibilityScrollStatus];
    UIAccessibilityPostNotification(v9, v10);

    return 1;
  }
  return 0;
}

- (BOOL)_accessibilityIsScrollAncestor
{
  return 1;
}

- (void)_dismissWithItemAtCurrentDecelerationFactor:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TabOverviewAccessibility;
  [(TabOverviewAccessibility *)&v3 _dismissWithItemAtCurrentDecelerationFactor:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __72__TabOverviewAccessibility__dismissWithItemAtCurrentDecelerationFactor___block_invoke()
{
}

- (BOOL)_isClosingLastItem
{
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning()) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TabOverviewAccessibility;
  return [(TabOverviewAccessibility *)&v4 _isClosingLastItem];
}

@end