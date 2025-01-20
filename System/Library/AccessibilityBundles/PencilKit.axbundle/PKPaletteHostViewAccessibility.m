@interface PKPaletteHostViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_axToolPaletteLocationAlongEdge:(int64_t)a3;
- (id)_axToolPaletteLocationAtCorner:(unint64_t)a3;
- (void)_dockPaletteToPosition:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation PKPaletteHostViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaletteHostView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPaletteHostView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteHostView", @"_dockPaletteToPosition:animated:", "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaletteHostView", @"isPaletteVisible", "B", 0);
}

- (BOOL)accessibilityElementsHidden
{
  return [(PKPaletteHostViewAccessibility *)self safeBoolForKey:@"isPaletteVisible"] ^ 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v7 = (id *)MEMORY[0x263F1D020];
  v8 = (void *)*MEMORY[0x263F1D020];
  id v9 = a4;
  [v8 _accessibilitySetBoolValue:1 forKey:@"AXIsHitTestingPKPaletteHostViewKey"];
  v12.receiver = self;
  v12.super_class = (Class)PKPaletteHostViewAccessibility;
  v10 = -[PKPaletteHostViewAccessibility _accessibilityHitTest:withEvent:](&v12, sel__accessibilityHitTest_withEvent_, v9, x, y);

  [*v7 _accessibilitySetBoolValue:0 forKey:@"AXIsHitTestingPKPaletteHostViewKey"];

  return v10;
}

- (void)_dockPaletteToPosition:(int64_t)a3 animated:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaletteHostViewAccessibility;
  [(PKPaletteHostViewAccessibility *)&v8 _dockPaletteToPosition:a3 animated:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  UIAccessibilityNotifications v6 = *MEMORY[0x263F1CDC8];
  v7 = [(PKPaletteHostViewAccessibility *)self _axToolPaletteLocationAlongEdge:a3];
  UIAccessibilityPostNotification(v6, v7);
}

- (id)_axToolPaletteLocationAlongEdge:(int64_t)a3
{
  v4 = accessibilityPencilKitLocalizedString(@"tool.palette.location.edge.format");
  if ((unint64_t)(a3 - 1) > 7) {
    v5 = @"tool.palette.location.edge.unknown";
  }
  else {
    v5 = off_265142FC8[a3 - 1];
  }
  UIAccessibilityNotifications v6 = accessibilityPencilKitLocalizedString(v5);
  v7 = objc_msgSend(NSString, "stringWithFormat:", v4, v6);

  return v7;
}

- (id)_axToolPaletteLocationAtCorner:(unint64_t)a3
{
  id v3 = accessibilityPencilKitLocalizedString(@"tool.palette.location.corner.format");
  v4 = accessibilityPencilKitLocalizedString(@"tool.palette.location.corner.unknown");
  v5 = objc_msgSend(NSString, "stringWithFormat:", v3, v4);

  return v5;
}

@end