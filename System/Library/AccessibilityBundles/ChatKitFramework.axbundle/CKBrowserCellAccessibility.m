@interface CKBrowserCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (id)_axShinyStatusLabel;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
@end

@implementation CKBrowserCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKBrowserCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKBrowserCell" isKindOfClass:@"UICollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBrowserCell", @"iconView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBrowserCell", @"browserLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBrowserCell", @"shinyStatus", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBrowserCell", @"shinyStatusView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  id v3 = [(CKBrowserCellAccessibility *)self safeValueForKey:@"contentView"];
  v4 = [(CKBrowserCellAccessibility *)self safeValueForKey:@"iconView"];
  v5 = [v4 safeValueForKey:@"frame"];
  [v5 rectValue];
  CGRect v31 = UIAccessibilityConvertFrameToScreenCoordinates(v30, v3);
  CGFloat y = v31.origin.y;
  CGFloat x = v31.origin.x;
  CGFloat height = v31.size.height;
  CGFloat width = v31.size.width;

  v6 = [(CKBrowserCellAccessibility *)self safeValueForKey:@"browserLabel"];
  v7 = [v6 safeValueForKey:@"frame"];
  [v7 rectValue];
  CGRect v33 = UIAccessibilityConvertFrameToScreenCoordinates(v32, v3);
  CGFloat v8 = v33.origin.x;
  CGFloat v9 = v33.origin.y;
  CGFloat v10 = v33.size.width;
  CGFloat v11 = v33.size.height;

  v12 = [(CKBrowserCellAccessibility *)self safeValueForKey:@"shinyStatusView"];
  v13 = [v12 safeValueForKey:@"frame"];
  [v13 rectValue];
  CGRect v35 = UIAccessibilityConvertFrameToScreenCoordinates(v34, v3);
  CGFloat v14 = v35.origin.x;
  CGFloat v15 = v35.origin.y;
  CGFloat v16 = v35.size.width;
  CGFloat v17 = v35.size.height;

  v36.origin.CGFloat y = y;
  v36.origin.CGFloat x = x;
  v36.size.CGFloat height = height;
  v36.size.CGFloat width = width;
  v40.origin.CGFloat x = v8;
  v40.origin.CGFloat y = v9;
  v40.size.CGFloat width = v10;
  v40.size.CGFloat height = v11;
  CGRect v37 = CGRectUnion(v36, v40);
  v41.origin.CGFloat x = v14;
  v41.origin.CGFloat y = v15;
  v41.size.CGFloat width = v16;
  v41.size.CGFloat height = v17;
  CGRect v38 = CGRectUnion(v37, v41);
  CGFloat v18 = v38.origin.x;
  CGFloat v19 = v38.origin.y;
  CGFloat v20 = v38.size.width;
  CGFloat v21 = v38.size.height;

  double v22 = v18;
  double v23 = v19;
  double v24 = v20;
  double v25 = v21;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (id)accessibilityLabel
{
  id v3 = [(CKBrowserCellAccessibility *)self safeValueForKey:@"browserLabel"];
  v4 = [v3 accessibilityLabel];
  v7 = [(CKBrowserCellAccessibility *)self _axShinyStatusLabel];
  v5 = __UIAXStringForVariables();

  return v5;
}

- (BOOL)accessibilityActivate
{
  char v21 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [(CKBrowserCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  v5 = v4;
  if (v4) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    goto LABEL_10;
  }
  v7 = [v4 indexPathForCell:v3];
  if (!v7)
  {
LABEL_9:

LABEL_10:
    v13.receiver = self;
    v13.super_class = (Class)CKBrowserCellAccessibility;
    BOOL v11 = [(CKBrowserCellAccessibility *)&v13 accessibilityActivate];
    goto LABEL_11;
  }
  CGFloat v8 = [v5 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_9;
  }
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  CGFloat v16 = __51__CKBrowserCellAccessibility_accessibilityActivate__block_invoke;
  CGFloat v17 = &unk_265113228;
  CGFloat v18 = v8;
  id v19 = v5;
  id v20 = v7;
  id v9 = v7;
  id v10 = v8;
  AXPerformSafeBlock();

  BOOL v11 = 1;
LABEL_11:

  return v11;
}

uint64_t __51__CKBrowserCellAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectionView:*(void *)(a1 + 40) didSelectItemAtIndexPath:*(void *)(a1 + 48)];
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(CKBrowserCellAccessibility *)self safeUIViewForKey:@"iconView"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CGFloat y = v8;
  result.CGFloat x = v7;
  return result;
}

- (id)accessibilityUserInputLabels
{
  v2 = [(CKBrowserCellAccessibility *)self safeValueForKey:@"browserLabel"];
  double v3 = [v2 accessibilityLabel];
  double v4 = MEMORY[0x245646F40]();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CKBrowserCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CKBrowserCellAccessibility *)&v3 accessibilityTraits];
}

- (id)_axShinyStatusLabel
{
  v2 = [(CKBrowserCellAccessibility *)self safeValueForKey:@"shinyStatus"];
  uint64_t v3 = [v2 integerValue];

  if (v3 == 1)
  {
    double v4 = @"app.status.new";
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    double v4 = @"app.status.new.from.test.flight";
LABEL_5:
    double v5 = accessibilityLocalizedString(v4);
    goto LABEL_7;
  }
  double v5 = 0;
LABEL_7:

  return v5;
}

@end