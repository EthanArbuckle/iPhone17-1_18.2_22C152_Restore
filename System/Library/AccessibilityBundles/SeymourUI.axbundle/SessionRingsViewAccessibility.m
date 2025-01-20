@interface SessionRingsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)displayHighlightWithDuration:(double)a3;
@end

@implementation SessionRingsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.SessionRingsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SeymourUI.SessionRingsView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.SessionRingsView", @"ringsPlatter", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.SessionRingsView", @"displayHighlightWithDuration:", "v", "d", 0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"activity.rings");
}

- (id)accessibilityValue
{
  return (id)[(SessionRingsViewAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SessionRingsViewAccessibility;
  return *MEMORY[0x263F1CF68] | [(SessionRingsViewAccessibility *)&v3 accessibilityTraits];
}

- (CGRect)accessibilityFrame
{
  v2 = [(SessionRingsViewAccessibility *)self safeUIViewForKey:@"ringsPlatter"];
  objc_super v3 = v2;
  if (v2 && ([v2 superview], v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    [v3 frame];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    v13 = [v3 superview];
    v22.origin.CGFloat x = v6;
    v22.origin.CGFloat y = v8;
    v22.size.CGFloat width = v10;
    v22.size.CGFloat height = v12;
    CGRect v23 = UIAccessibilityConvertFrameToScreenCoordinates(v22, v13);
    CGFloat x = v23.origin.x;
    CGFloat y = v23.origin.y;
    CGFloat width = v23.size.width;
    CGFloat height = v23.size.height;
  }
  else
  {
    CGFloat x = *MEMORY[0x263F001A8];
    CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (void)displayHighlightWithDuration:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SessionRingsViewAccessibility;
  -[SessionRingsViewAccessibility displayHighlightWithDuration:](&v3, sel_displayHighlightWithDuration_);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __62__SessionRingsViewAccessibility_displayHighlightWithDuration___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263EFF8C0] axArrayByIgnoringNilElementsWithCount:1, MEMORY[0x245660210](@"ARUIRingsView")];
  v2 = [*(id *)(a1 + 32) _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0 classExclusions:v3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v2);
}

@end