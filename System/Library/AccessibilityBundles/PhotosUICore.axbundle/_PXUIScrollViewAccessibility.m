@interface _PXUIScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsInFeedViewController;
- (BOOL)_accessibilityOnlyComparesByXAxis;
- (BOOL)_accessibilityScrollAcrossPageBoundaries;
- (BOOL)_axUsesPhotosGridKit;
- (BOOL)isAccessibilityOpaqueElementProvider;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilitySortedElementsWithin;
- (id)_axPXGScrollViewElements;
- (id)accessibilityElements;
- (int64_t)_axCompareView:(id)a3 toView:(id)a4;
- (void)_axSetPXGScrollViewElements:(id)a3;
- (void)_setAXPXGScrollViewElements:(id)a3;
@end

@implementation _PXUIScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_PXUIScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axPXGScrollViewElements
{
}

- (void)_setAXPXGScrollViewElements:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_PXUIScrollView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"PXGView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGView", @"rootLayout", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGLayout", @"axGroup", "@", 0);
  [v3 validateClass:@"PXFeedViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPhotosUIViewController", @"contentController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPhotosContentController", @"viewModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPhotosViewModel", @"headerTitle", "@", 0);
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  id v3 = [(_PXUIScrollViewAccessibility *)self accessibilityIdentification];
  if ([v3 isEqualToString:@"AXPhotoDetailsScrollView"])
  {

    return 0;
  }
  else
  {
    BOOL v5 = [(_PXUIScrollViewAccessibility *)self _axUsesPhotosGridKit];

    return !v5;
  }
}

- (id)_accessibilitySortedElementsWithin
{
  id v3 = [(_PXUIScrollViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"AXExplorerViewControllerScrollView"];

  if (v4)
  {
    char v11 = 0;
    objc_opt_class();
    BOOL v5 = [(_PXUIScrollViewAccessibility *)self _iosAccessibilityAttributeValue:2095];
    v6 = __UIAccessibilityCastAsClass();

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66___PXUIScrollViewAccessibility__accessibilitySortedElementsWithin__block_invoke;
    v10[3] = &unk_2650A5D48;
    v10[4] = self;
    v7 = [v6 sortedArrayUsingComparator:v10];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_PXUIScrollViewAccessibility;
    v7 = [(_PXUIScrollViewAccessibility *)&v9 _accessibilitySortedElementsWithin];
  }

  return v7;
}

- (int64_t)_axCompareView:(id)a3 toView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(_PXUIScrollViewAccessibility *)self safeValueForKey:@"subviews"];
  objc_super v9 = [v8 safeValueForKey:@"@firstObject"];

  v10 = [v7 safeValueForKey:@"frame"];
  [v10 CGRectValue];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  v19 = [v7 safeValueForKey:@"superview"];

  objc_msgSend(v9, "convertRect:fromView:", v19, v12, v14, v16, v18);
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  v28 = [v6 safeValueForKey:@"frame"];
  [v28 CGRectValue];
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;

  v37 = [v6 safeValueForKey:@"superview"];

  objc_msgSend(v9, "convertRect:fromView:", v37, v30, v32, v34, v36);
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;

  v52.origin.x = v21;
  v52.origin.y = v23;
  v52.size.width = v25;
  v52.size.height = v27;
  double MinX = CGRectGetMinX(v52);
  v53.origin.x = v39;
  v53.origin.y = v41;
  v53.size.width = v43;
  v53.size.height = v45;
  double v50 = CGRectGetMinX(v53);
  v54.origin.x = v21;
  v54.origin.y = v23;
  v54.size.width = v25;
  v54.size.height = v27;
  double MinY = CGRectGetMinY(v54);
  v55.origin.x = v39;
  v55.origin.y = v41;
  v55.size.width = v43;
  v55.size.height = v45;
  double v47 = CGRectGetMinY(v55);
  if (MinX < v50)
  {
LABEL_5:
    int64_t v48 = -1;
    goto LABEL_6;
  }
  if (MinX <= v50)
  {
    if (MinY >= v47)
    {
      int64_t v48 = MinY > v47;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int64_t v48 = 1;
LABEL_6:

  return v48;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  v2 = [(_PXUIScrollViewAccessibility *)self accessibilityIdentification];
  char v3 = [v2 isEqualToString:@"AXMemoriesScrollView"];

  return v3;
}

- (BOOL)_accessibilityScrollAcrossPageBoundaries
{
  char v3 = [(_PXUIScrollViewAccessibility *)self accessibilityIdentification];
  char v4 = [v3 isEqualToString:@"AXMemoriesScrollView"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)_PXUIScrollViewAccessibility;
  return [(_PXUIScrollViewAccessibility *)&v6 _accessibilityScrollAcrossPageBoundaries];
}

- (BOOL)_axUsesPhotosGridKit
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  char v3 = [v2 superview];
  MEMORY[0x2455E3C60](@"PXGView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityElements
{
  if ([(_PXUIScrollViewAccessibility *)self _axUsesPhotosGridKit])
  {
    char v3 = [(_PXUIScrollViewAccessibility *)self _axPXGScrollViewElements];
    if (!v3)
    {
      v18.receiver = self;
      v18.super_class = (Class)_PXUIScrollViewAccessibility;
      char v4 = [(_PXUIScrollViewAccessibility *)&v18 accessibilityElements];
      BOOL v5 = (void *)[v4 mutableCopy];
      objc_super v6 = v5;
      if (v5)
      {
        id v7 = v5;
      }
      else
      {
        id v7 = [MEMORY[0x263EFF980] array];
      }
      char v3 = v7;

      v8 = [(_PXUIScrollViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_8 startWithSelf:1];
      objc_super v9 = [v8 safeValueForKey:@"rootLayout"];
      v10 = [v9 safeValueForKey:@"axGroup"];

      objc_initWeak(&location, self);
      double v11 = [AXPhotosGroupAccessibilityElement alloc];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __53___PXUIScrollViewAccessibility_accessibilityElements__block_invoke_2;
      v15[3] = &unk_2650A6470;
      objc_copyWeak(&v16, &location);
      double v12 = [(AXPhotosGroupAccessibilityElement *)v11 initWithAccessibilityContainer:self forGroup:v10 inView:v8 withAdditionalScrollViewElements:v15];
      [v3 axSafelyAddObject:v12];
      [(_PXUIScrollViewAccessibility *)self _axSetPXGScrollViewElements:v3];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_PXUIScrollViewAccessibility;
    char v3 = [(_PXUIScrollViewAccessibility *)&v14 accessibilityElements];
  }

  return v3;
}

- (void)_axSetPXGScrollViewElements:(id)a3
{
  -[_PXUIScrollViewAccessibility _setAXPXGScrollViewElements:](self, "_setAXPXGScrollViewElements:");
  if (!a3)
  {
    UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE18];
    UIAccessibilityPostNotification(v4, 0);
  }
}

- (BOOL)_accessibilityIsInFeedViewController
{
  v2 = [(_PXUIScrollViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_540 startWithSelf:1];
  char v3 = [v2 _accessibilityViewController];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(_PXUIScrollViewAccessibility *)self _accessibilityIsInFeedViewController])
  {
    v8 = [(_PXUIScrollViewAccessibility *)self _accessibilityElements];
    uint64_t v12 = 0;
    double v13 = &v12;
    uint64_t v14 = 0x3032000000;
    double v15 = __Block_byref_object_copy__3;
    id v16 = __Block_byref_object_dispose__3;
    id v17 = 0;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __64___PXUIScrollViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v11[3] = &unk_2650A64B8;
    v11[4] = &v12;
    *(double *)&v11[5] = x;
    *(double *)&v11[6] = y;
    [v8 enumerateObjectsUsingBlock:v11];
    id v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)_PXUIScrollViewAccessibility;
    -[_PXUIScrollViewAccessibility _accessibilityHitTest:withEvent:](&v18, sel__accessibilityHitTest_withEvent_, v7, x, y);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

@end