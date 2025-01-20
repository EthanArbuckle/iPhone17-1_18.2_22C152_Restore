@interface SKUIHorizontalLockupCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScrollToVisible;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityScrollParentForComparingByXAxis;
- (void)layoutSubviews;
@end

@implementation SKUIHorizontalLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIHorizontalLockupCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (-[SKUIHorizontalLockupCollectionViewCellAccessibility pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    v8 = [(SKUIHorizontalLockupCollectionViewCellAccessibility *)self _accessibilityParentView];
    UIAccessibilityPointForPoint();
    uint64_t v10 = v9;
    uint64_t v12 = v11;

    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v25[3] = 0x47EFFFFFE0000000;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    id v24 = 0;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __87__SKUIHorizontalLockupCollectionViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v18[3] = &unk_2650AB6F0;
    v18[6] = v10;
    v18[7] = v12;
    v18[4] = v25;
    v18[5] = &v19;
    [(SKUIHorizontalLockupCollectionViewCellAccessibility *)self accessibilityEnumerateContainerElementsUsingBlock:v18];
    v13 = (void *)v20[5];
    if (v13)
    {
      id v14 = v13;
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)SKUIHorizontalLockupCollectionViewCellAccessibility;
      -[SKUIHorizontalLockupCollectionViewCellAccessibility _accessibilityHitTest:withEvent:](&v17, sel__accessibilityHitTest_withEvent_, v7, x, y);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(v25, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __87__SKUIHorizontalLockupCollectionViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _AXAssert();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v6 isAccessibilityElement])
    {
      [v6 accessibilityActivationPoint];
      AX_CGPointGetDistanceToPoint();
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      if (v4 < *(double *)(v5 + 24))
      {
        *(double *)(v5 + 24) = v4;
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      }
    }
  }
}

- (BOOL)accessibilityScrollToVisible
{
  v10.receiver = self;
  v10.super_class = (Class)SKUIHorizontalLockupCollectionViewCellAccessibility;
  BOOL v3 = [(SKUIHorizontalLockupCollectionViewCellAccessibility *)&v10 accessibilityScrollToVisible];
  double v4 = [(SKUIHorizontalLockupCollectionViewCellAccessibility *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Skuicollection_0.isa)];
  uint64_t v5 = [v4 delegate];
  [v4 contentOffset];
  v9[0] = v6;
  v9[1] = v7;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v4, v9, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  }

  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIHorizontalLockupCollectionViewCellAccessibility;
  [(SKUIHorizontalLockupCollectionViewCellAccessibility *)&v4 layoutSubviews];
  if (_AXSAutomationEnabled())
  {
    BOOL v3 = [(SKUIHorizontalLockupCollectionViewCellAccessibility *)self safeValueForKey:@"_lockupView"];
    [v3 layoutIfNeeded];
  }
}

- (id)_accessibilityScrollParentForComparingByXAxis
{
  uint64_t v3 = objc_opt_class();

  return (id)[(SKUIHorizontalLockupCollectionViewCellAccessibility *)self _accessibilityAncestorIsKindOf:v3];
}

@end