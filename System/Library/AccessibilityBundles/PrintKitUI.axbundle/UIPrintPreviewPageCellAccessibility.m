@interface UIPrintPreviewPageCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsPageInSelection;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation UIPrintPreviewPageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPrintPreviewPageCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIPrintPreviewPageCell", @"pageLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIPrintPreviewPageCell", @"checkmarkImageView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(UIPrintPreviewPageCellAccessibility *)self safeValueForKey:@"pageLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  return 0;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"print.preview.cell.double.tap.hint");
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(UIPrintPreviewPageCellAccessibility *)self safeValueForKey:@"pageLabel"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)UIPrintPreviewPageCellAccessibility;
  unint64_t v3 = [(UIPrintPreviewPageCellAccessibility *)&v7 accessibilityTraits];
  BOOL v4 = [(UIPrintPreviewPageCellAccessibility *)self _axIsPageInSelection];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (BOOL)_axIsPageInSelection
{
  v2 = [(UIPrintPreviewPageCellAccessibility *)self safeUIViewForKey:@"checkmarkImageView"];
  [v2 alpha];
  BOOL v4 = v3 > 0.1;

  return v4;
}

@end