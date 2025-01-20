@interface TabBarItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityUpdateAXInfo;
- (void)setActive:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPinned:(BOOL)a3;
- (void)setTitleText:(id)a3;
@end

@implementation TabBarItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TabBarItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TabBarItemView" hasInstanceVariable:@"_titleText" withType:"NSString"];
  [v3 validateClass:@"TabBarItemView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabBarItemView", @"closeButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabBarItemView", @"setTitleText:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabBarItemView", @"setActive:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabBarItemView", @"setPinned:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabBarItemView", @"isActive", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabBarItemView", @"isPinned", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabBarItemView", @"_isPinnedAndNarrow", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)TabBarItemViewAccessibility;
  [(TabBarItemViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(TabBarItemViewAccessibility *)self _accessibilityUpdateAXInfo];
}

- (BOOL)isAccessibilityElement
{
  return [(TabBarItemViewAccessibility *)self safeBoolForKey:@"_isPinnedAndNarrow"];
}

- (id)accessibilityLabel
{
  v2 = [(TabBarItemViewAccessibility *)self safeValueForKey:@"_titleText"];
  objc_super v3 = accessibilityLocalizedString(@"tab.view");
  v4 = AXCFormattedString();
  v7 = accessibilityLocalizedString(@"tab.pinned");
  v5 = __AXStringForVariables();

  return v5;
}

- (void)_accessibilityUpdateAXInfo
{
  id v20 = [(TabBarItemViewAccessibility *)self safeValueForKey:@"_titleText"];
  objc_super v3 = [(TabBarItemViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  int v4 = [(TabBarItemViewAccessibility *)self safeBoolForKey:@"isPinned"];
  v5 = NSString;
  v6 = accessibilityLocalizedString(@"tab.view");
  v7 = objc_msgSend(v5, "stringWithFormat:", v6, v20);
  if (v4)
  {
    v8 = accessibilityLocalizedString(@"tab.pinned");
    v9 = __AXStringForVariables();
    objc_msgSend(v3, "setAccessibilityLabel:", v9, v8, @"__AXStringForVariablesSentinel");
  }
  else
  {
    [v3 setAccessibilityLabel:v7];
  }

  v10 = accessibilityLocalizedString(@"tab.hint");
  [v3 setAccessibilityHint:v10];

  v11 = [(TabBarItemViewAccessibility *)self safeValueForKey:@"closeButton"];
  if ([(TabBarItemViewAccessibility *)self safeBoolForKey:@"isPinned"])
  {
    v12 = v11;
    uint64_t v13 = 0;
  }
  else
  {
    v12 = v11;
    uint64_t v13 = 1;
  }
  [v12 setIsAccessibilityElement:v13];
  v14 = NSString;
  v15 = accessibilityLocalizedString(@"close.tab");
  v16 = objc_msgSend(v14, "stringWithFormat:", v15, v20);
  [v11 setAccessibilityLabel:v16];

  int v17 = [(TabBarItemViewAccessibility *)self safeBoolForKey:@"isActive"];
  uint64_t v18 = [v3 accessibilityTraits];
  if (v17) {
    uint64_t v19 = *MEMORY[0x263F1CF38] | v18;
  }
  else {
    uint64_t v19 = v18 & ~*MEMORY[0x263F1CF38];
  }
  [v3 setAccessibilityTraits:v19];
  [v3 setAccessibilityRespondsToUserInteraction:1];
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(TabBarItemViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  v9 = [(TabBarItemViewAccessibility *)self _accessibilityParentView];
  UIAccessibilityPointForPoint();
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  [v8 accessibilityFrame];
  v19.double x = v11;
  v19.double y = v13;
  if (CGRectContainsPoint(v20, v19))
  {
    id v14 = v8;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)TabBarItemViewAccessibility;
    -[TabBarItemViewAccessibility _accessibilityHitTest:withEvent:](&v17, sel__accessibilityHitTest_withEvent_, v7, x, y);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  return v15;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 0;
}

- (void)setFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TabBarItemViewAccessibility;
  -[TabBarItemViewAccessibility setFrame:](&v7, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(TabBarItemViewAccessibility *)self bounds];
  int v4 = [(TabBarItemViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  v5 = [(TabBarItemViewAccessibility *)self safeValueForKey:@"closeButton"];
  uint64_t v6 = [v4 accessibilityTraits];
  if ((*MEMORY[0x263F1CF38] & v6) != 0) {
    [v5 bounds];
  }
  UIAccessibilityFrameForBounds();
  objc_msgSend(v4, "setAccessibilityFrame:");
}

- (void)setTitleText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TabBarItemViewAccessibility;
  [(TabBarItemViewAccessibility *)&v4 setTitleText:a3];
  [(TabBarItemViewAccessibility *)self _accessibilityUpdateAXInfo];
}

- (void)setActive:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TabBarItemViewAccessibility;
  [(TabBarItemViewAccessibility *)&v4 setActive:a3];
  [(TabBarItemViewAccessibility *)self _accessibilityUpdateAXInfo];
}

- (void)setPinned:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TabBarItemViewAccessibility;
  [(TabBarItemViewAccessibility *)&v4 setPinned:a3];
  [(TabBarItemViewAccessibility *)self _accessibilityUpdateAXInfo];
}

@end