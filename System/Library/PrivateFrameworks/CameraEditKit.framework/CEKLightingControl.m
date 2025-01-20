@interface CEKLightingControl
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)collapsedItemFading;
- (BOOL)_isLightingTypeEnabled:(int64_t)a3;
- (BOOL)_isOverDialedWithSelectionAngularOffset:(double)a3 selectionIndex:(unint64_t)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isExpanded;
- (BOOL)isHighlighted;
- (BOOL)isNameBadgeHidden;
- (BOOL)isTracking;
- (CEKAnimationGenerator)_animationGenerator;
- (CEKLightingControl)initWithFrame:(CGRect)a3;
- (CEKLightingControlDelegate)delegate;
- (CEKLightingDialBackground)_backgroundView;
- (CEKLightingFrameCache)_frameCache;
- (CEKLightingNameBadge)_nameBadge;
- (CEKMultiplyImageView)_collapsedControlSelectionOverlay;
- (CEKMultiplyImageView)_selectionOverlay;
- (CEKSelectionFeedbackGenerator)_selectionFeedbackGenerator;
- (CGPoint)_dialCenter;
- (CGPoint)_dialCenterForWidth:(double)a3;
- (CGPoint)_selectionPointForExpanded:(BOOL)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)_effectTypes;
- (NSDate)_timeTrackingBegan;
- (NSDictionary)_effectItemsForType;
- (NSDictionary)_itemOutlineViewsForType;
- (NSDictionary)_itemShadowViewsForType;
- (NSDictionary)_itemViewsForType;
- (NSSet)_enabledEffectTypes;
- (NSTimer)_collapseTimer;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImageView)_collapsedControlItemView;
- (UIImageView)_collapsedControlSelectionUnderlay;
- (UIImageView)_collapsedControlShadowView;
- (UIImageView)_selectionUnderlay;
- (UILongPressGestureRecognizer)_pressGesture;
- (UIPanGestureRecognizer)_panGesture;
- (UITapGestureRecognizer)_tapGesture;
- (UIView)_itemContainer;
- (double)_angleFromCenterToPoint:(CGPoint)a3;
- (double)_angularSpacingForRadialLayout;
- (double)_compressedItemOffsetForFractionalItemOffset:(double)a3;
- (double)_dialBadgePaddingExpanded:(BOOL)a3;
- (double)_dialCenterDistanceBelowBoundsForWidth:(double)a3;
- (double)_dialRadius;
- (double)_dialRadiusForWidth:(double)a3;
- (double)_dialVisibleHeightExpanded:(BOOL)a3;
- (double)_offsetAngleForItemAtIndex:(unint64_t)a3 withSelectionOffset:(double)a4;
- (double)_offsetAngleForRubberBandOffsetAngle:(double)a3 selectionIndex:(unint64_t)a4;
- (double)_offsetXForItemAtIndex:(unint64_t)a3;
- (double)_rotationForPanGesture:(id)a3;
- (double)_rubberBandOffsetAngleForOffsetAngle:(double)a3;
- (double)_safeWidthForWidth:(double)a3;
- (double)_selectionAngularOffset;
- (double)_spacingForLinearLayout;
- (double)additionalBottomPadding;
- (double)collapsedSelectionCenterPointEdgeInset;
- (double)contentHeightForWidth:(double)a3;
- (double)maxContentWidth;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)defaultLightingType;
- (int64_t)lightingEffectSet;
- (int64_t)orientation;
- (int64_t)selectedLightingType;
- (unint64_t)_enabledItemCount;
- (unint64_t)_expandedAnimationCounter;
- (unint64_t)_itemCount;
- (unint64_t)_selectionIndex;
- (unint64_t)collapsedControlLocation;
- (unint64_t)nameBadgeFontStyle;
- (void)_cancelDelayedCollapse;
- (void)_collapseWithDelay:(double)a3;
- (void)_createBackgroundViewIfNeeded;
- (void)_createCollapsedControlViewsIfNeeded;
- (void)_createItemContainerIfNeeded;
- (void)_createItemViewsIfNeeded;
- (void)_createNameBadgeIfNeeded;
- (void)_createSelectionViewsIfNeeded;
- (void)_handleCollapseTimer:(id)a3;
- (void)_handlePanGesture:(id)a3;
- (void)_handlePressGesture:(id)a3;
- (void)_handleSettlingSelectionViewsFromOffset:(double)a3 withProgress:(double)a4 timingCurve:(id)a5;
- (void)_handleSnapFromOffset:(double)a3 withProgress:(double)a4 timingCurve:(id)a5;
- (void)_handleTapGesture:(id)a3;
- (void)_handleTapRotationFromOffset:(double)a3 withProgress:(double)a4 timingCurve:(id)a5;
- (void)_layoutBackgroundExpanded:(BOOL)a3;
- (void)_layoutCollapsedControlViews;
- (void)_layoutItemContainer;
- (void)_layoutItemViewsLinear;
- (void)_layoutItemViewsRadialWithSelectionOffsetAngle:(double)a3;
- (void)_layoutNameBadgeExpanded:(BOOL)a3;
- (void)_layoutSelectionViewsExpanded:(BOOL)a3;
- (void)_loadItemsIfNeeded;
- (void)_performFeedback;
- (void)_prepareFeedback;
- (void)_rotateForTapFromSelectionIndex:(unint64_t)a3 offset:(double)a4 toSelectionIndex:(unint64_t)a5;
- (void)_setBackgroundView:(id)a3;
- (void)_setCollapseTimer:(id)a3;
- (void)_setEffectItemsForType:(id)a3;
- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4 shouldNotify:(BOOL)a5;
- (void)_setExpandedAnimationCounter:(unint64_t)a3;
- (void)_setItemContainer:(id)a3;
- (void)_setItemOutlineViewsForType:(id)a3;
- (void)_setItemShadowViewsForType:(id)a3;
- (void)_setItemViewsForType:(id)a3;
- (void)_setNameBadge:(id)a3;
- (void)_setSelectedLightingType:(int64_t)a3 atIndex:(unint64_t)a4 shouldNotify:(BOOL)a5 shouldSuppressHaptic:(BOOL)a6 animated:(BOOL)a7;
- (void)_setSelectionAngularOffset:(double)a3;
- (void)_setSelectionOverlay:(id)a3;
- (void)_setSelectionUnderlay:(id)a3;
- (void)_setTimeTrackingBegan:(id)a3;
- (void)_setTracking:(BOOL)a3;
- (void)_settleSelectionViewsFromSelectionOffsetAngle:(double)a3;
- (void)_snapFromSelectionOffsetAngle:(double)a3 toAngle:(double)a4 animated:(BOOL)a5;
- (void)_updateImagesForCollapedControlViews;
- (void)_updateItemViewsWithSelectionOffsetAngle:(double)a3;
- (void)_updateNameBadgeAnimated:(BOOL)a3;
- (void)_updateSelectionOverlayColorAnimated:(BOOL)a3;
- (void)_updateSelectionViewsWithSelectionOffsetAngle:(double)a3;
- (void)layoutSubviews;
- (void)ppt_selectLightingType:(int64_t)a3;
- (void)preloadEffectChangeAnimation;
- (void)setAdditionalBottomPadding:(double)a3;
- (void)setCollapsedControlLocation:(unint64_t)a3;
- (void)setCollapsedControlLocation:(unint64_t)a3 animated:(BOOL)a4;
- (void)setCollapsedItemFading:(id)a3;
- (void)setCollapsedItemFading:(id)a3 animated:(BOOL)a4;
- (void)setCollapsedSelectionCenterPointEdgeInset:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setLightingEffectSet:(int64_t)a3;
- (void)setLightingEffectSet:(int64_t)a3 animated:(BOOL)a4;
- (void)setMaxContentWidth:(double)a3;
- (void)setNameBadgeFontStyle:(unint64_t)a3;
- (void)setNameBadgeHidden:(BOOL)a3;
- (void)setNameBadgeHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setOrientation:(int64_t)a3;
- (void)setSelectedLightingType:(int64_t)a3;
- (void)setSelectedLightingType:(int64_t)a3 animated:(BOOL)a4;
- (void)set_collapsedControlItemView:(id)a3;
- (void)set_collapsedControlSelectionOverlay:(id)a3;
- (void)set_collapsedControlSelectionUnderlay:(id)a3;
- (void)set_collapsedControlShadowView:(id)a3;
- (void)set_enabledEffectTypes:(id)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CEKLightingControl

- (CEKLightingControl)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CEKLightingControl;
  v3 = -[CEKLightingControl initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemYellowColor];
    [(CEKLightingControl *)v3 setTintColor:v4];

    v3->_selectedLightingType = [(CEKLightingControl *)v3 defaultLightingType];
    v3->_collapsedItemFading.leftRate = 0;
    v3->_collapsedItemFading.rightRate = 0;
    [(CEKLightingControl *)v3 _createBackgroundViewIfNeeded];
    [(CEKLightingControl *)v3 _createSelectionViewsIfNeeded];
    [(CEKLightingControl *)v3 _createNameBadgeIfNeeded];
    [(CEKLightingControl *)v3 _createItemContainerIfNeeded];
    effectTypes = v3->__effectTypes;
    v3->__effectTypes = (NSArray *)&unk_1F1A0FFC8;

    v3->_lightingEffectSet = 2;
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F1A0FFB0];
    enabledEffectTypes = v3->__enabledEffectTypes;
    v3->__enabledEffectTypes = (NSSet *)v6;

    [(CEKLightingControl *)v3 _loadItemsIfNeeded];
    [(CEKLightingControl *)v3 _createItemViewsIfNeeded];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v3 action:sel__handlePanGesture_];
    [(CEKLightingControl *)v3 addGestureRecognizer:v8];
    [v8 setMaximumNumberOfTouches:1];
    [v8 setAllowedScrollTypesMask:3];
    [v8 setDelegate:v3];
    objc_storeStrong((id *)&v3->__panGesture, v8);
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v3 action:sel__handlePressGesture_];
    [(CEKLightingControl *)v3 addGestureRecognizer:v9];
    [v9 setMinimumPressDuration:0.0];
    [v9 setDelegate:v3];
    objc_storeStrong((id *)&v3->__pressGesture, v9);
    v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v3 action:sel__handleTapGesture_];
    [(CEKLightingControl *)v3 addGestureRecognizer:v10];
    [v10 setDelegate:v3];
    objc_storeStrong((id *)&v3->__tapGesture, v10);
    v11 = objc_alloc_init(CEKAnimationGenerator);
    animationGenerator = v3->__animationGenerator;
    v3->__animationGenerator = v11;

    v13 = objc_alloc_init(CEKLightingFrameCache);
    frameCache = v3->__frameCache;
    v3->__frameCache = v13;

    if (CEKHapticsAllowed())
    {
      v15 = objc_alloc_init(CEKSelectionFeedbackGenerator);
      selectionFeedbackGenerator = v3->__selectionFeedbackGenerator;
      v3->__selectionFeedbackGenerator = v15;
    }
    v3->_maxContentWidth = 414.0;
    v3->_collapsedSelectionCenterPointEdgeInset = 44.0;
  }
  return v3;
}

- (UIEdgeInsets)alignmentRectInsets
{
  v3 = [(CEKLightingControl *)self _nameBadge];
  [v3 intrinsicContentSize];
  double v5 = v4;
  [(CEKLightingControl *)self _dialBadgePaddingExpanded:1];
  double v7 = v6 + v5;

  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = v7;
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v11;
  return result;
}

- (void)setCollapsedControlLocation:(unint64_t)a3
{
}

- (void)setCollapsedControlLocation:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_collapsedControlLocation != a3)
  {
    BOOL v4 = a4;
    self->_collapsedControlLocation = a3;
    [(CEKLightingControl *)self _createCollapsedControlViewsIfNeeded];
    [(CEKLightingControl *)self setNeedsLayout];
    if (v4)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __59__CEKLightingControl_setCollapsedControlLocation_animated___block_invoke;
      v6[3] = &unk_1E63CD380;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:0.25];
    }
  }
}

uint64_t __59__CEKLightingControl_setCollapsedControlLocation_animated___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 _selectionAngularOffset];
  return objc_msgSend(v1, "_updateItemViewsWithSelectionOffsetAngle:");
}

- (void)setCollapsedSelectionCenterPointEdgeInset:(double)a3
{
  if (self->_collapsedSelectionCenterPointEdgeInset != a3)
  {
    self->_collapsedSelectionCenterPointEdgeInset = a3;
    [(CEKLightingControl *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  BOOL v3 = [(CEKLightingControl *)self isExpanded];
  [(CEKLightingControl *)self _selectionAngularOffset];
  -[CEKLightingControl _rubberBandOffsetAngleForOffsetAngle:](self, "_rubberBandOffsetAngleForOffsetAngle:");
  double v5 = v4;
  id v7 = [(CEKLightingControl *)self _animationGenerator];
  char v6 = [v7 isAnimatingForIdentifier:@"cubeSettling"];
  if (v3)
  {
    if ([v7 isAnimatingForIdentifier:@"rotation"]) {
      goto LABEL_7;
    }
    [(CEKLightingControl *)self _layoutItemViewsRadialWithSelectionOffsetAngle:v5];
  }
  else
  {
    [(CEKLightingControl *)self _layoutItemViewsLinear];
  }
  [(CEKLightingControl *)self _updateItemViewsWithSelectionOffsetAngle:v5];
  if ((v6 & 1) == 0) {
    [(CEKLightingControl *)self _updateSelectionViewsWithSelectionOffsetAngle:v5];
  }
LABEL_7:
  [(CEKLightingControl *)self _layoutBackgroundExpanded:v3];
  [(CEKLightingControl *)self _layoutSelectionViewsExpanded:v3];
  [(CEKLightingControl *)self _layoutNameBadgeExpanded:v3];
  [(CEKLightingControl *)self _layoutItemContainer];
  [(CEKLightingControl *)self _layoutCollapsedControlViews];
}

- (void)setAdditionalBottomPadding:(double)a3
{
  if (self->_additionalBottomPadding != a3)
  {
    self->_additionalBottomPadding = a3;
    [(CEKLightingControl *)self setNeedsLayout];
  }
}

- (void)setMaxContentWidth:(double)a3
{
  if (self->_maxContentWidth != a3)
  {
    self->_maxContentWidth = a3;
    [(CEKLightingControl *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[CEKLightingControl _safeWidthForWidth:](self, "_safeWidthForWidth:", a3.width, a3.height);
  double v5 = v4;
  -[CEKLightingControl contentHeightForWidth:](self, "contentHeightForWidth:");
  double v7 = v6;
  double v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (double)contentHeightForWidth:(double)a3
{
  [(CEKLightingControl *)self _safeWidthForWidth:a3];
  double v5 = v4;
  -[CEKLightingControl _dialCenterDistanceBelowBoundsForWidth:](self, "_dialCenterDistanceBelowBoundsForWidth:");
  [(CEKLightingControl *)self _dialRadiusForWidth:v5];
  UIRoundToViewScale();
  return result;
}

- (double)_safeWidthForWidth:(double)a3
{
  [(CEKLightingControl *)self maxContentWidth];
  double v6 = v5;
  double v7 = 320.0;
  if (v6 >= 320.0) {
    [(CEKLightingControl *)self maxContentWidth];
  }
  return fmin(v7, fmax(a3, 320.0));
}

- (void)_layoutItemViewsRadialWithSelectionOffsetAngle:(double)a3
{
  [(CEKLightingControl *)self _selectionPointForExpanded:1];
  uint64_t v34 = v5;
  double v6 = [(CEKLightingControl *)self _itemViewsForType];
  double v7 = [(CEKLightingControl *)self _itemShadowViewsForType];
  double v8 = [(CEKLightingControl *)self _itemOutlineViewsForType];
  [(CEKLightingControl *)self _dialCenter];
  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeTranslation(&v41, v9, v10);
  memset(&v40, 0, sizeof(v40));
  CGAffineTransform v39 = v41;
  CGAffineTransformInvert(&v40, &v39);
  if ([(CEKLightingControl *)self _itemCount])
  {
    unint64_t v11 = 0;
    double v12 = *MEMORY[0x1E4F1DAD8];
    double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    int64x2_t v32 = vdupq_lane_s64(v34, 0);
    do
    {
      -[CEKLightingControl _offsetAngleForItemAtIndex:withSelectionOffset:](self, "_offsetAngleForItemAtIndex:withSelectionOffset:", v11, a3, *(_OWORD *)&v32);
      long long v33 = *(_OWORD *)&v40.c;
      long long v35 = *(_OWORD *)&v40.a;
      CGFloat tx = v40.tx;
      CGFloat ty = v40.ty;
      CGAffineTransformMakeRotation(&t2, v16);
      *(_OWORD *)&t1.a = v35;
      *(_OWORD *)&t1.c = v33;
      t1.CGFloat tx = tx;
      t1.CGFloat ty = ty;
      CGAffineTransformConcat(&v39, &t1, &t2);
      CGAffineTransform t1 = v39;
      CGAffineTransform v36 = v41;
      CGAffineTransformConcat(&v39, &t1, &v36);
      UIPointRoundToViewScale();
      double v18 = v17;
      double v20 = v19;
      v21 = [(CEKLightingControl *)self _effectTypes];
      v22 = [v21 objectAtIndexedSubscript:v11];

      v23 = [v6 objectForKeyedSubscript:v22];
      v24 = [v7 objectForKeyedSubscript:v22];
      v25 = [v8 objectForKeyedSubscript:v22];
      objc_msgSend(v23, "setCenter:", v18, v20);
      objc_msgSend(v24, "setCenter:", v18, v20);
      objc_msgSend(v25, "setCenter:", v18, v20);
      [v23 intrinsicContentSize];
      objc_msgSend(v23, "setBounds:", v12, v13, v26, v27);
      [v24 intrinsicContentSize];
      objc_msgSend(v24, "setBounds:", v12, v13, v28, v29);
      [v25 intrinsicContentSize];
      objc_msgSend(v25, "setBounds:", v12, v13, v30, v31);

      ++v11;
    }
    while (v11 < [(CEKLightingControl *)self _itemCount]);
  }
}

- (void)_layoutItemViewsLinear
{
  [(CEKLightingControl *)self _selectionPointForExpanded:0];
  double v4 = v3;
  double v6 = v5;
  id v25 = [(CEKLightingControl *)self _itemViewsForType];
  double v7 = [(CEKLightingControl *)self _itemShadowViewsForType];
  double v8 = [(CEKLightingControl *)self _itemOutlineViewsForType];
  if ([(CEKLightingControl *)self _itemCount])
  {
    unint64_t v9 = 0;
    double v10 = *MEMORY[0x1E4F1DAD8];
    double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    do
    {
      [(CEKLightingControl *)self _offsetXForItemAtIndex:v9];
      double v13 = v4 + v12;
      v14 = [(CEKLightingControl *)self _effectTypes];
      v15 = [v14 objectAtIndexedSubscript:v9];

      CGFloat v16 = [v25 objectForKeyedSubscript:v15];
      double v17 = [v8 objectForKeyedSubscript:v15];
      double v18 = [v7 objectForKeyedSubscript:v15];
      objc_msgSend(v16, "setCenter:", v13, v6);
      objc_msgSend(v18, "setCenter:", v13, v6);
      objc_msgSend(v17, "setCenter:", v13, v6);
      [v16 intrinsicContentSize];
      objc_msgSend(v16, "setBounds:", v10, v11, v19, v20);
      [v18 intrinsicContentSize];
      objc_msgSend(v18, "setBounds:", v10, v11, v21, v22);
      [v17 intrinsicContentSize];
      objc_msgSend(v17, "setBounds:", v10, v11, v23, v24);

      ++v9;
    }
    while (v9 < [(CEKLightingControl *)self _itemCount]);
  }
}

- (void)_layoutCollapsedControlViews
{
  [(CEKLightingControl *)self _selectionPointForExpanded:0];
  double v4 = v3;
  double v6 = v5;
  unint64_t v7 = [(CEKLightingControl *)self collapsedControlLocation];
  if (v7)
  {
    if (v7 == 2)
    {
      [(CEKLightingControl *)self bounds];
      double v10 = v9;
      [(CEKLightingControl *)self collapsedSelectionCenterPointEdgeInset];
      double v4 = v10 - v11;
    }
    else if (v7 == 1)
    {
      [(CEKLightingControl *)self collapsedSelectionCenterPointEdgeInset];
      double v4 = v8;
    }
    double v12 = [(CEKLightingControl *)self _collapsedControlItemView];
    double v13 = [(CEKLightingControl *)self _collapsedControlShadowView];
    v14 = [(CEKLightingControl *)self _collapsedControlSelectionOverlay];
    v15 = [(CEKLightingControl *)self _collapsedControlSelectionUnderlay];
    objc_msgSend(v12, "setCenter:", v4, v6);
    objc_msgSend(v13, "setCenter:", v4, v6);
    objc_msgSend(v14, "setCenter:", v4, v6);
    objc_msgSend(v15, "setCenter:", v4, v6);
    [v12 intrinsicContentSize];
    [v12 setBounds:CEKRectWithSize()];
    [v13 intrinsicContentSize];
    [v13 setBounds:CEKRectWithSize()];
    [v14 intrinsicContentSize];
    [v14 setBounds:CEKRectWithSize()];
    [v14 bounds];
    objc_msgSend(v15, "setBounds:");
    memset(&v20, 0, sizeof(v20));
    CGAffineTransformMakeScale(&v20, 0.8, 0.8);
    CGAffineTransform v19 = v20;
    [v12 setTransform:&v19];
    CGAffineTransform v18 = v20;
    [v13 setTransform:&v18];
    CGAffineTransform v17 = v20;
    [v14 setTransform:&v17];
    CGAffineTransform v16 = v20;
    [v15 setTransform:&v16];
  }
}

- (void)_layoutBackgroundExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  [(CEKLightingControl *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  id v21 = [(CEKLightingControl *)self _backgroundView];
  [(CEKLightingControl *)self _dialRadius];
  objc_msgSend(v21, "setRadius:");
  [(CEKLightingControl *)self _dialVisibleHeightExpanded:1];
  double v14 = v13;
  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  double Width = CGRectGetWidth(v23);
  [(CEKLightingControl *)self additionalBottomPadding];
  double v17 = v14 + 3.0 + v16;
  [(CEKLightingControl *)self _dialVisibleHeightExpanded:v3];
  double v19 = v18;
  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  objc_msgSend(v21, "setFrame:", 0.0, CGRectGetMaxY(v24) - v19, Width, v17);
  double v20 = 1.0;
  if (!v3) {
    double v20 = 0.0;
  }
  [v21 setAlpha:v20];
}

- (void)_layoutSelectionViewsExpanded:(BOOL)a3
{
  [(CEKLightingControl *)self _selectionPointForExpanded:a3];
  double v5 = v4;
  double v7 = v6;
  CGFloat v8 = [(CEKLightingControl *)self _selectionOverlay];
  double v9 = [(CEKLightingControl *)self _selectionUnderlay];
  objc_msgSend(v8, "setCenter:", v5, v7);
  objc_msgSend(v9, "setCenter:", v5, v7);
  double v10 = *MEMORY[0x1E4F1DB28];
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  [v8 intrinsicContentSize];
  double v13 = v12;
  double v15 = v14;
  objc_msgSend(v8, "setBounds:", v10, v11, v12, v14);
  objc_msgSend(v9, "setBounds:", v10, v11, v13, v15);
  BOOL v16 = [(CEKLightingControl *)self isExpanded];
  double v17 = 0.75;
  memset(&v20.c, 0, 32);
  if (v16) {
    double v17 = 1.0;
  }
  *(_OWORD *)&v20.a = 0uLL;
  CGAffineTransformMakeScale(&v20, v17, v17);
  CGAffineTransform v19 = v20;
  [v8 setTransform:&v19];
  CGAffineTransform v18 = v20;
  [v9 setTransform:&v18];
}

- (void)_layoutNameBadgeExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CEKLightingControl *)self _nameBadge];
  [(CEKLightingControl *)self bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v5 intrinsicContentSize];
  UIRectCenteredXInRectScale();
  double v15 = v14;
  double v26 = v16;
  double v18 = v17;
  -[CEKLightingControl _dialVisibleHeightExpanded:](self, "_dialVisibleHeightExpanded:", v3, 0);
  double v20 = v19;
  [(CEKLightingControl *)self _dialBadgePaddingExpanded:v3];
  double v22 = v21;
  v31.origin.x = v7;
  v31.origin.y = v9;
  v31.size.width = v11;
  v31.size.height = v13;
  objc_msgSend(v5, "setFrame:", v15, CGRectGetMaxY(v31) - v20 - v22 - v18, v26, v18);
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v30.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v30.c = v23;
  *(_OWORD *)&v30.CGFloat tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  if ([(CEKLightingControl *)self orientation] == 2) {
    CGAffineTransformMakeRotation(&v30, 3.14159265);
  }
  CGRect v24 = (void *)MEMORY[0x1E4FB1EB0];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  CGAffineTransform v29 = v30;
  v27[2] = __47__CEKLightingControl__layoutNameBadgeExpanded___block_invoke;
  v27[3] = &unk_1E63CDB10;
  id v28 = v5;
  id v25 = v5;
  [v24 performWithoutAnimation:v27];
}

uint64_t __47__CEKLightingControl__layoutNameBadgeExpanded___block_invoke(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return [*(id *)(a1 + 32) setTransform:v3];
}

- (void)_layoutItemContainer
{
  [(CEKLightingControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(CEKLightingControl *)self _itemContainer];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);
}

- (CGPoint)_selectionPointForExpanded:(BOOL)a3
{
  if (a3)
  {
    [(CEKLightingControl *)self _dialVisibleHeightExpanded:1];
    double v5 = v4 + -36.0;
  }
  else
  {
    double v5 = 34.0;
  }
  [(CEKLightingControl *)self bounds];
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  CGFloat MidX = CGRectGetMidX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v11 = CGRectGetMaxY(v15) - v5;
  double v12 = MidX;
  result.CGFloat y = v11;
  result.CGFloat x = v12;
  return result;
}

- (double)_dialVisibleHeightExpanded:(BOOL)a3
{
  if (!a3) {
    return 72.0;
  }
  [(CEKLightingControl *)self bounds];
  [(CEKLightingControl *)self contentHeightForWidth:v4];
  return result;
}

- (double)_dialRadius
{
  [(CEKLightingControl *)self bounds];
  [(CEKLightingControl *)self _dialRadiusForWidth:v3];
  return result;
}

- (double)_dialRadiusForWidth:(double)a3
{
  [(CEKLightingControl *)self _safeWidthForWidth:a3];
  -[CEKLightingControl _dialCenterDistanceBelowBoundsForWidth:](self, "_dialCenterDistanceBelowBoundsForWidth:");
  UIDistanceBetweenPoints();
  return result;
}

- (double)_angularSpacingForRadialLayout
{
  return 0.3;
}

- (double)_spacingForLinearLayout
{
  return 48.0;
}

- (double)_dialBadgePaddingExpanded:(BOOL)a3
{
  double result = -5.0;
  if (a3) {
    return 10.0;
  }
  return result;
}

- (CGPoint)_dialCenter
{
  [(CEKLightingControl *)self bounds];
  [(CEKLightingControl *)self _dialCenterForWidth:v3];
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (CGPoint)_dialCenterForWidth:(double)a3
{
  [(CEKLightingControl *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(CEKLightingControl *)self _dialCenterDistanceBelowBoundsForWidth:a3];
  v17.origin.CGFloat x = v6;
  v17.origin.CGFloat y = v8;
  v17.size.CGFloat width = v10;
  v17.size.CGFloat height = v12;
  CGRectGetMaxY(v17);
  UIRoundToViewScale();
  double v14 = v13;
  double v15 = a3 * 0.5;
  result.CGFloat y = v14;
  result.CGFloat x = v15;
  return result;
}

- (double)_dialCenterDistanceBelowBoundsForWidth:(double)a3
{
  double v3 = a3 * 0.2909 + -29.09;
  double v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 scale];
  double v6 = -1.0 / v5 + 84.0;

  return fmin(v6, v3);
}

- (double)_angleFromCenterToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CEKLightingControl *)self _dialCenter];
  return atan2(v6 - y, v5 - x);
}

- (double)_offsetAngleForItemAtIndex:(unint64_t)a3 withSelectionOffset:(double)a4
{
  [(CEKLightingControl *)self _angularSpacingForRadialLayout];
  double v8 = v7;
  [(CEKLightingControl *)self _compressedItemOffsetForFractionalItemOffset:a4 / v7 + (double)(uint64_t)(a3 - [(CEKLightingControl *)self _selectionIndex])];
  return v8 * v9;
}

- (double)_offsetXForItemAtIndex:(unint64_t)a3
{
  [(CEKLightingControl *)self _spacingForLinearLayout];
  double v6 = v5;
  [(CEKLightingControl *)self _compressedItemOffsetForFractionalItemOffset:(double)(uint64_t)(a3 - [(CEKLightingControl *)self _selectionIndex])];
  return v6 * v7;
}

- (double)_compressedItemOffsetForFractionalItemOffset:(double)a3
{
  double v3 = fabs(a3);
  if (a3 >= 0.0) {
    return v3 * (v3 * -0.039 + 1.024);
  }
  else {
    return -(v3 * (v3 * -0.039 + 1.024));
  }
}

- (double)_rotationForPanGesture:(id)a3
{
  id v4 = a3;
  [v4 translationInView:self];
  double v6 = v5;
  double v8 = v7;
  [v4 locationInView:self];
  double v10 = v9;
  double v12 = v11;

  double v13 = v10 - v6;
  -[CEKLightingControl _angleFromCenterToPoint:](self, "_angleFromCenterToPoint:", v10, v12);
  double v15 = v14;
  -[CEKLightingControl _angleFromCenterToPoint:](self, "_angleFromCenterToPoint:", v13, v12 - v8);
  double result = v15 - v16;
  if (result > 3.14159265) {
    double result = result + -6.28318531;
  }
  if (result < -3.14159265) {
    return result + 6.28318531;
  }
  return result;
}

- (BOOL)_isOverDialedWithSelectionAngularOffset:(double)a3 selectionIndex:(unint64_t)a4
{
  unint64_t v6 = [(CEKLightingControl *)self _enabledItemCount] - 1;
  BOOL v7 = a3 > 0.0;
  if (a4) {
    BOOL v7 = 0;
  }
  BOOL v8 = v6 == a4 && a3 < 0.0;
  return v7 || v8;
}

- (double)_rubberBandOffsetAngleForOffsetAngle:(double)a3
{
  [(CEKLightingControl *)self _angularSpacingForRadialLayout];
  double v6 = v5;
  double v7 = fabs(a3) / v5;
  BOOL v8 = [(CEKLightingControl *)self _isOverDialedWithSelectionAngularOffset:[(CEKLightingControl *)self _selectionIndex] selectionIndex:a3];
  if (v8 && v7 > 0.4) {
    double v9 = -4.0 / ((v7 + 1.546) * 0.55 + 1.0) + 1.986;
  }
  else {
    double v9 = pow(10000.0, v7) * 0.0014 + -0.0014;
  }
  if (v9 > 0.5 && !v8) {
    double v9 = 0.5;
  }
  double v11 = v6 * v9;
  double result = -(v6 * v9);
  if (a3 >= 0.0) {
    return v11;
  }
  return result;
}

- (double)_offsetAngleForRubberBandOffsetAngle:(double)a3 selectionIndex:(unint64_t)a4
{
  [(CEKLightingControl *)self _angularSpacingForRadialLayout];
  double v8 = v7;
  double v9 = fabs(a3) / v7;
  if ([(CEKLightingControl *)self _isOverDialedWithSelectionAngularOffset:a4 selectionIndex:a3]&& v9 > 0.05433)
  {
    double v10 = (4.0 / (1.986 - v9) + -1.0) / 0.55 + -1.546;
  }
  else
  {
    double v10 = log((v9 + 0.0014) * 714.286) * 0.108574 / 0.99999999;
  }
  double v11 = v8 * v10;
  double result = -(v8 * v10);
  if (a3 >= 0.0) {
    return v11;
  }
  return result;
}

- (void)_handlePressGesture:(id)a3
{
  unint64_t v4 = [a3 state];
  if (v4 <= 4 && ((1 << v4) & 0x1A) != 0)
  {
    [(CEKLightingControl *)self _setTracking:v4 == 1];
  }
}

- (void)_setTracking:(BOOL)a3
{
  if (self->_tracking != a3)
  {
    self->_tracking = a3;
    if (a3)
    {
      unint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
      [(CEKLightingControl *)self _setTimeTrackingBegan:v4];

      [(CEKLightingControl *)self _setExpanded:1 animated:1 shouldNotify:1];
      [(CEKLightingControl *)self _cancelDelayedCollapse];
      [(CEKLightingControl *)self _prepareFeedback];
    }
    else
    {
      double v5 = [(CEKLightingControl *)self _timeTrackingBegan];
      [v5 timeIntervalSinceNow];
      double v7 = v6;

      if (v7 >= -0.5)
      {
        unint64_t v8 = [(CEKLightingControl *)self collapsedControlLocation] - 1;
        double v9 = 1.0;
        if (v8 < 2) {
          double v9 = 1.5;
        }
        [(CEKLightingControl *)self _collapseWithDelay:v9];
        [(CEKLightingControl *)self _selectionAngularOffset];
        -[CEKLightingControl _snapFromSelectionOffsetAngle:toAngle:animated:](self, "_snapFromSelectionOffsetAngle:toAngle:animated:", 1);
      }
      else
      {
        [(CEKLightingControl *)self _setExpanded:0 animated:1 shouldNotify:1];
      }
      [(CEKLightingControl *)self _setTimeTrackingBegan:0];
    }
  }
}

- (void)_handlePanGesture:(id)a3
{
  id v30 = a3;
  uint64_t v4 = [v30 state];
  if (v4 == 3)
  {
    if (![(CEKLightingControl *)self isTracking]) {
      goto LABEL_22;
    }
    double v5 = self;
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  if (v4 == 2)
  {
    [(CEKLightingControl *)self _rotationForPanGesture:v30];
    double v8 = v7;
    [(CEKLightingControl *)self _selectionAngularOffset];
    double v10 = v8 + v9;
    objc_msgSend(v30, "setTranslation:inView:", self, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    [(CEKLightingControl *)self _angularSpacingForRadialLayout];
    double v12 = v11;
    double v13 = v11 * 0.5;
    unint64_t v14 = [(CEKLightingControl *)self _selectionIndex];
    BOOL v15 = [(CEKLightingControl *)self _isOverDialedWithSelectionAngularOffset:v14 selectionIndex:v10];
    if (fabs(v10) >= v13 && !v15)
    {
      if (v10 <= 0.0) {
        double v21 = v12;
      }
      else {
        double v21 = -v12;
      }
      if (v10 <= 0.0) {
        unint64_t v22 = v14 + 1;
      }
      else {
        unint64_t v22 = v14 - 1;
      }
      double v23 = v10 + v21;
      [(CEKLightingControl *)self _rubberBandOffsetAngleForOffsetAngle:v10];
      [(CEKLightingControl *)self _offsetAngleForRubberBandOffsetAngle:v22 selectionIndex:v21 + v24];
      double v26 = v25;
      double v27 = [(CEKLightingControl *)self _effectTypes];
      id v28 = [v27 objectAtIndexedSubscript:v22];
      uint64_t v29 = [v28 integerValue];

      [(CEKLightingControl *)self _setSelectedLightingType:v29 atIndex:v22 shouldNotify:1 shouldSuppressHaptic:0 animated:0];
      double v18 = self;
      double v17 = v26;
      double v19 = v23;
      uint64_t v20 = 1;
    }
    else
    {
      [(CEKLightingControl *)self _selectionAngularOffset];
      double v18 = self;
      double v19 = v10;
      uint64_t v20 = 0;
    }
    [(CEKLightingControl *)v18 _snapFromSelectionOffsetAngle:v20 toAngle:v17 animated:v19];
    [(CEKLightingControl *)self setNeedsLayout];
    goto LABEL_22;
  }
  if (v4 == 1 && ![(CEKLightingControl *)self isTracking])
  {
    double v5 = self;
    uint64_t v6 = 1;
LABEL_8:
    [(CEKLightingControl *)v5 _setTracking:v6];
  }
LABEL_22:
}

- (void)_handleTapGesture:(id)a3
{
  id v23 = a3;
  unint64_t v4 = [(CEKLightingControl *)self _expandedAnimationCounter];
  id v5 = v23;
  if (!v4)
  {
    [v23 locationInView:self];
    if ([(CEKLightingControl *)self _enabledItemCount])
    {
      unint64_t v6 = 0;
      double v7 = 0;
      double v8 = 1.79769313e308;
      do
      {
        double v9 = [(CEKLightingControl *)self _effectTypes];
        double v10 = [v9 objectAtIndexedSubscript:v6];

        double v11 = [(CEKLightingControl *)self _itemViewsForType];
        double v12 = [v11 objectForKeyedSubscript:v10];

        [v12 center];
        UIDistanceBetweenPoints();
        if (v13 < v8)
        {
          double v14 = v13;
          id v15 = v10;

          double v8 = v14;
          double v7 = v15;
        }

        ++v6;
      }
      while (v6 < [(CEKLightingControl *)self _enabledItemCount]);
    }
    else
    {
      double v7 = 0;
      double v8 = 1.79769313e308;
    }
    uint64_t v16 = [v7 integerValue];
    double v17 = [(CEKLightingControl *)self _effectTypes];
    uint64_t v18 = [v17 indexOfObject:v7];

    unint64_t v19 = [(CEKLightingControl *)self _selectionIndex];
    if (v8 <= 30.0)
    {
      unint64_t v20 = v19;
      if (v19 != v18)
      {
        [(CEKLightingControl *)self _selectionAngularOffset];
        double v22 = v21;
        [(CEKLightingControl *)self _setSelectedLightingType:v16 atIndex:v18 shouldNotify:1 shouldSuppressHaptic:0 animated:0];
        [(CEKLightingControl *)self _rotateForTapFromSelectionIndex:v20 offset:v18 toSelectionIndex:v22];
      }
    }

    id v5 = v23;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CEKLightingControl *)self _panGesture];
  id v9 = [(CEKLightingControl *)self _pressGesture];
  id v10 = [(CEKLightingControl *)self _tapGesture];
  if (v9 == v6 || v9 == v7)
  {
    BOOL v13 = v10 == v6 || v10 == v7;
    BOOL v15 = v8 == v6 || v8 == v7;
    BOOL v11 = v15 ^ v13;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v33.receiver = self;
  v33.super_class = (Class)CEKLightingControl;
  -[CEKLightingControl hitTest:withEvent:](&v33, sel_hitTest_withEvent_, a4);
  id v7 = (CEKLightingControl *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {
    if ([(CEKLightingControl *)self isExpanded])
    {
      [(CEKLightingControl *)self _dialCenter];
      [(CEKLightingControl *)self _dialRadius];
      double v9 = v8;
      UIDistanceBetweenPoints();
      if (v10 > v9)
      {
LABEL_12:

        id v7 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      [(CEKLightingControl *)self bounds];
      double v11 = v37.origin.x;
      CGFloat v12 = v37.origin.y;
      CGFloat width = v37.size.width;
      CGFloat height = v37.size.height;
      double MaxY = CGRectGetMaxY(v37);
      [(CEKLightingControl *)self _selectionPointForExpanded:0];
      double v17 = MaxY - v16 + MaxY - v16;
      double v18 = MaxY - v17;
      if ([(CEKLightingControl *)self collapsedItemFading] == 2 && v19 == 2)
      {
        v38.origin.CGFloat x = v11;
        v38.origin.CGFloat y = v12;
        v38.size.CGFloat width = width;
        v38.size.CGFloat height = height;
        double v11 = CGRectGetMidX(v38) + -50.0;
        CGFloat width = 100.0;
      }
      v39.origin.CGFloat x = v11;
      v39.origin.CGFloat y = v18;
      v39.size.CGFloat width = width;
      v39.size.CGFloat height = v17;
      v35.CGFloat x = x;
      v35.CGFloat y = y;
      if (!CGRectContainsPoint(v39, v35))
      {
        unint64_t v20 = [(CEKLightingControl *)self _collapsedControlSelectionOverlay];

        if (!v20) {
          goto LABEL_12;
        }
        double v21 = [(CEKLightingControl *)self _collapsedControlSelectionOverlay];
        double v22 = [v21 superview];
        id v23 = [(CEKLightingControl *)self _collapsedControlSelectionOverlay];
        [v23 frame];
        objc_msgSend(v22, "convertRect:toView:", self);
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        CGFloat v29 = v28;
        CGFloat v31 = v30;

        v40.origin.CGFloat x = v25;
        v40.origin.CGFloat y = v27;
        v40.size.CGFloat width = v29;
        v40.size.CGFloat height = v31;
        CGRect v41 = CGRectInset(v40, -10.0, -10.0);
        v36.CGFloat x = x;
        v36.CGFloat y = y;
        if (!CGRectContainsPoint(v41, v36)) {
          goto LABEL_12;
        }
      }
    }
    id v7 = self;
  }
LABEL_13:
  return v7;
}

- (void)setExpanded:(BOOL)a3
{
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4 shouldNotify:(BOOL)a5
{
  if (self->_expanded != a3)
  {
    BOOL v5 = a5;
    BOOL v6 = a4;
    BOOL v7 = a3;
    if (a5 && self->_delegateFlags.respondsToWillChangeExpanded)
    {
      double v9 = [(CEKLightingControl *)self delegate];
      [v9 lightingControl:self willChangeExpanded:v7];
    }
    double v10 = [(CEKLightingControl *)self _animationGenerator];
    [v10 stopAllAnimations];
    if (v6) {
      [(CEKLightingControl *)self layoutIfNeeded];
    }
    self->_expanded = v7;
    [(CEKLightingControl *)self setNeedsLayout];
    [(CEKLightingControl *)self _selectionAngularOffset];
    double v12 = v11;
    [(CEKLightingControl *)self _setSelectionAngularOffset:0.0];
    if (v6)
    {
      if (!v7)
      {
        [(CEKLightingControl *)self _rubberBandOffsetAngleForOffsetAngle:v12];
        -[CEKLightingControl _settleSelectionViewsFromSelectionOffsetAngle:](self, "_settleSelectionViewsFromSelectionOffsetAngle:");
      }
      [(CEKLightingControl *)self _setExpandedAnimationCounter:[(CEKLightingControl *)self _expandedAnimationCounter] + 1];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __57__CEKLightingControl__setExpanded_animated_shouldNotify___block_invoke;
      v15[3] = &unk_1E63CD380;
      v15[4] = self;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __57__CEKLightingControl__setExpanded_animated_shouldNotify___block_invoke_2;
      v14[3] = &unk_1E63CD3F0;
      v14[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:0x20000 delay:v15 usingSpringWithDamping:v14 initialSpringVelocity:0.5 options:0.0 animations:0.8 completion:0.0];
    }
    [(CEKLightingControl *)self _updateNameBadgeAnimated:v6];
    if (v5 && self->_delegateFlags.respondsToDidChangeExpanded)
    {
      BOOL v13 = [(CEKLightingControl *)self delegate];
      [v13 lightingControlDidChangeExpanded:self];
    }
  }
}

uint64_t __57__CEKLightingControl__setExpanded_animated_shouldNotify___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __57__CEKLightingControl__setExpanded_animated_shouldNotify___block_invoke_2(uint64_t a1)
{
  long long v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 _expandedAnimationCounter] - 1;
  return [v1 _setExpandedAnimationCounter:v2];
}

- (void)_collapseWithDelay:(double)a3
{
  unint64_t v4 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__handleCollapseTimer_ selector:0 userInfo:0 repeats:a3];
  [(CEKLightingControl *)self _setCollapseTimer:v4];

  id v6 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  BOOL v5 = [(CEKLightingControl *)self _collapseTimer];
  [v6 addTimer:v5 forMode:*MEMORY[0x1E4F1C4B0]];
}

- (void)_handleCollapseTimer:(id)a3
{
  [(CEKLightingControl *)self _setCollapseTimer:0];
  [(CEKLightingControl *)self _setExpanded:0 animated:1 shouldNotify:1];
}

- (void)_cancelDelayedCollapse
{
  double v3 = [(CEKLightingControl *)self _collapseTimer];
  [v3 invalidate];

  [(CEKLightingControl *)self _setCollapseTimer:0];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToWillChangeExpanded = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidChangeExpanded = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setLightingEffectSet:(int64_t)a3
{
}

- (void)setLightingEffectSet:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_lightingEffectSet != a3)
  {
    BOOL v4 = a4;
    if (a4) {
      [(CEKLightingControl *)self layoutIfNeeded];
    }
    self->_lightingEffectSet = a3;
    if ((unint64_t)a3 > 3) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = qword_1E63CDF08[a3];
    }
    double v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    [(CEKLightingControl *)self set_enabledEffectTypes:v8];

    [(CEKLightingControl *)self setNeedsLayout];
    if (![(CEKLightingControl *)self _isLightingTypeEnabled:[(CEKLightingControl *)self selectedLightingType]])[(CEKLightingControl *)self setSelectedLightingType:[(CEKLightingControl *)self defaultLightingType] animated:v4]; {
    if (v4)
    }
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __52__CEKLightingControl_setLightingEffectSet_animated___block_invoke;
      v9[3] = &unk_1E63CD380;
      v9[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v9 options:0 animations:0.4 completion:0.0];
    }
  }
}

uint64_t __52__CEKLightingControl_setLightingEffectSet_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)_isLightingTypeEnabled:(int64_t)a3
{
  BOOL v4 = [(CEKLightingControl *)self _enabledEffectTypes];
  BOOL v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

- (int64_t)defaultLightingType
{
  return 1;
}

- (void)setSelectedLightingType:(int64_t)a3
{
}

- (void)setSelectedLightingType:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(CEKLightingControl *)self _effectTypes];
  double v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  uint64_t v9 = [v7 indexOfObject:v8];

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(CEKLightingControl *)self _setSelectedLightingType:a3 atIndex:v9 shouldNotify:0 shouldSuppressHaptic:1 animated:v4];
  }
}

- (void)ppt_selectLightingType:(int64_t)a3
{
  BOOL v5 = [(CEKLightingControl *)self _effectTypes];
  char v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  uint64_t v7 = [v5 indexOfObject:v6];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(CEKLightingControl *)self _setSelectedLightingType:a3 atIndex:v7 shouldNotify:1 shouldSuppressHaptic:1 animated:0];
  }
}

- (void)_setSelectedLightingType:(int64_t)a3 atIndex:(unint64_t)a4 shouldNotify:(BOOL)a5 shouldSuppressHaptic:(BOOL)a6 animated:(BOOL)a7
{
  if (self->_selectedLightingType != a3)
  {
    BOOL v7 = a7;
    BOOL v9 = a5;
    if (a7) {
      [(CEKLightingControl *)self layoutIfNeeded];
    }
    self->_selectedLightingType = a3;
    self->__selectionIndeCGFloat x = a4;
    [(CEKLightingControl *)self _updateNameBadgeAnimated:0];
    [(CEKLightingControl *)self _updateImagesForCollapedControlViews];
    if (v9)
    {
      BOOL v13 = [(CEKLightingControl *)self delegate];
      [v13 lightingControlDidChangeSelectedLightingType:self];
    }
    if (!a6)
    {
      [(CEKLightingControl *)self _performFeedback];
      [(CEKLightingControl *)self _prepareFeedback];
    }
    [(CEKLightingControl *)self setNeedsLayout];
    if (v7)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __98__CEKLightingControl__setSelectedLightingType_atIndex_shouldNotify_shouldSuppressHaptic_animated___block_invoke;
      v14[3] = &unk_1E63CD380;
      v14[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v14 options:0 animations:0.15 completion:0.0];
    }
  }
}

uint64_t __98__CEKLightingControl__setSelectedLightingType_atIndex_shouldNotify_shouldSuppressHaptic_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_snapFromSelectionOffsetAngle:(double)a3 toAngle:(double)a4 animated:(BOOL)a5
{
  if (a3 != a4)
  {
    BOOL v5 = a5;
    [(CEKLightingControl *)self _setSelectionAngularOffset:a4];
    if (v5)
    {
      objc_initWeak(&location, self);
      LODWORD(v8) = 1.0;
      BOOL v9 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :0.0 :v8];
      double v10 = [(CEKLightingControl *)self _animationGenerator];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __69__CEKLightingControl__snapFromSelectionOffsetAngle_toAngle_animated___block_invoke;
      v12[3] = &unk_1E63CDEC8;
      objc_copyWeak(v14, &location);
      v14[1] = *(id *)&a3;
      id v11 = v9;
      id v13 = v11;
      [v10 startAnimationForIdentifier:@"rotation" duration:v12 updateHandler:0 completionHandler:0.2];

      objc_destroyWeak(v14);
      objc_destroyWeak(&location);
    }
    else
    {
      [(CEKLightingControl *)self setNeedsLayout];
    }
  }
}

void __69__CEKLightingControl__snapFromSelectionOffsetAngle_toAngle_animated___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleSnapFromOffset:*(void *)(a1 + 32) withProgress:*(double *)(a1 + 48) timingCurve:a2];
}

- (void)_handleSnapFromOffset:(double)a3 withProgress:(double)a4 timingCurve:(id)a5
{
  id v8 = a5;
  [(CEKLightingControl *)self _selectionAngularOffset];
  -[CEKLightingControl _rubberBandOffsetAngleForOffsetAngle:](self, "_rubberBandOffsetAngleForOffsetAngle:");
  double v10 = v9;
  [(CEKLightingControl *)self _rubberBandOffsetAngleForOffsetAngle:a3];
  double v12 = v11;
  *(float *)&double v11 = a4;
  [v8 _solveForInput:v11];
  LODWORD(a4) = v13;

  double v14 = v12 + *(float *)&a4 * (v10 - v12);
  [(CEKLightingControl *)self _layoutItemViewsRadialWithSelectionOffsetAngle:v14];
  [(CEKLightingControl *)self _updateItemViewsWithSelectionOffsetAngle:v14];
  [(CEKLightingControl *)self _updateSelectionViewsWithSelectionOffsetAngle:v14];
}

- (void)_rotateForTapFromSelectionIndex:(unint64_t)a3 offset:(double)a4 toSelectionIndex:(unint64_t)a5
{
  [(CEKLightingControl *)self _angularSpacingForRadialLayout];
  double v10 = v9;
  objc_initWeak(&location, self);
  LODWORD(v11) = 1.0;
  double v12 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :0.0 :v11];
  int v13 = [(CEKLightingControl *)self _animationGenerator];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__CEKLightingControl__rotateForTapFromSelectionIndex_offset_toSelectionIndex___block_invoke;
  v15[3] = &unk_1E63CDEC8;
  objc_copyWeak(v17, &location);
  *(double *)&v17[1] = v10 * (double)(uint64_t)(a5 - a3) + a4;
  id v14 = v12;
  id v16 = v14;
  [v13 startAnimationForIdentifier:@"rotation" duration:v15 updateHandler:0 completionHandler:0.35];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __78__CEKLightingControl__rotateForTapFromSelectionIndex_offset_toSelectionIndex___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleTapRotationFromOffset:*(void *)(a1 + 32) withProgress:*(double *)(a1 + 48) timingCurve:a2];
}

- (void)_handleTapRotationFromOffset:(double)a3 withProgress:(double)a4 timingCurve:(id)a5
{
  id v8 = a5;
  [(CEKLightingControl *)self _selectionAngularOffset];
  double v10 = v9;
  *(float *)&double v9 = a4;
  [v8 _solveForInput:v9];
  LODWORD(a4) = v11;

  double v12 = a3 + *(float *)&a4 * (v10 - a3);
  [(CEKLightingControl *)self _layoutItemViewsRadialWithSelectionOffsetAngle:v12];
  [(CEKLightingControl *)self _updateItemViewsWithSelectionOffsetAngle:v12];
  [(CEKLightingControl *)self _updateSelectionViewsWithSelectionOffsetAngle:v12];
}

- (void)preloadEffectChangeAnimation
{
  id v2 = [(CEKLightingControl *)self _frameCache];
  [v2 preloadForegroundFrames];
  [v2 preloadBackgroundFrames];
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_highlighted != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_highlighted = a3;
    BOOL v7 = [(CEKLightingControl *)self _nameBadge];
    [v7 setHighlighted:v5 animated:v4];

    [(CEKLightingControl *)self _updateSelectionOverlayColorAnimated:v4];
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CEKLightingControl;
  [(CEKLightingControl *)&v3 tintColorDidChange];
  [(CEKLightingControl *)self _updateSelectionOverlayColorAnimated:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CEKLightingControl;
  [(CEKLightingControl *)&v4 traitCollectionDidChange:a3];
  [(CEKLightingControl *)self _updateSelectionOverlayColorAnimated:0];
}

- (void)_updateSelectionOverlayColorAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CEKLightingControl *)self tintColor];
  char v6 = [(CEKLightingControl *)self _nameBadge];
  [v6 setTintColor:v5];

  if ([(CEKLightingControl *)self isHighlighted]) {
    [(CEKLightingControl *)self tintColor];
  }
  else {
  BOOL v7 = [MEMORY[0x1E4FB1618] labelColor];
  }
  id v8 = [(CEKLightingControl *)self traitCollection];
  double v9 = [v7 resolvedColorWithTraitCollection:v8];

  double v10 = [(CEKLightingControl *)self _selectionOverlay];
  int v11 = v10;
  if (v3)
  {
    double v12 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    id v14[2] = __59__CEKLightingControl__updateSelectionOverlayColorAnimated___block_invoke;
    v14[3] = &unk_1E63CDAE8;
    id v15 = v10;
    id v16 = v9;
    double v17 = self;
    [v12 animateWithDuration:v14 animations:0.25];
  }
  else
  {
    [v10 setContentsMultiplyColor:v9];
    int v13 = [(CEKLightingControl *)self _collapsedControlSelectionOverlay];
    [v13 setContentsMultiplyColor:v9];
  }
}

void __59__CEKLightingControl__updateSelectionOverlayColorAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setContentsMultiplyColor:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) _collapsedControlSelectionOverlay];
  [v3 setContentsMultiplyColor:v2];
}

- (void)_updateSelectionViewsWithSelectionOffsetAngle:(double)a3
{
  uint64_t v5 = [(CEKLightingControl *)self _selectionIndex];
  BOOL v6 = [(CEKLightingControl *)self _isOverDialedWithSelectionAngularOffset:v5 selectionIndex:a3];
  [(CEKLightingControl *)self _angularSpacingForRadialLayout];
  double v8 = -a3 / v7;
  if (fabs(v8) >= 0.5)
  {
    double v9 = v8 + (double)(unint64_t)v5;
    uint64_t v5 = (uint64_t)fmax(fmin((double)([(CEKLightingControl *)self _enabledItemCount] - 1), (double)(uint64_t)round(v9)), 0.0);
    double v8 = v9 - (double)v5;
  }
  double v10 = fmax(fmin(v8 * 0.15, 0.1889), -0.1889);
  if (v6) {
    double v8 = v10;
  }
  uint64_t v11 = (uint64_t)-round(v8 * 90.0);
  id v21 = [(CEKLightingControl *)self _frameCache];
  double v12 = [(CEKLightingControl *)self _effectTypes];
  int v13 = [v12 objectAtIndexedSubscript:v5];
  uint64_t v14 = [v13 integerValue];

  id v15 = [v21 foregroundFrameForAngle:v11];
  uint64_t v16 = [v21 backgroundFrameForAngle:v11 lightingType:v14];
  double v17 = (void *)v16;
  if (v15) {
    BOOL v18 = v16 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18)
  {
    uint64_t v19 = [(CEKLightingControl *)self _selectionOverlay];
    [v19 setImage:v15];

    unint64_t v20 = [(CEKLightingControl *)self _selectionUnderlay];
    [v20 setImage:v17];

    [(CEKLightingControl *)self _updateSelectionOverlayColorAnimated:0];
  }
}

- (void)_updateImagesForCollapedControlViews
{
  id v3 = [(CEKLightingControl *)self _collapsedControlItemView];

  if (v3)
  {
    objc_super v4 = [(CEKLightingControl *)self _effectItemsForType];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[CEKLightingControl selectedLightingType](self, "selectedLightingType"));
    id v15 = [v4 objectForKeyedSubscript:v5];

    BOOL v6 = [(CEKLightingControl *)self _frameCache];
    double v7 = [v15 displayImage];
    double v8 = [(CEKLightingControl *)self _collapsedControlItemView];
    [v8 setImage:v7];

    double v9 = [v15 displayShadowImage];
    double v10 = [(CEKLightingControl *)self _collapsedControlShadowView];
    [v10 setImage:v9];

    uint64_t v11 = [v6 foregroundFrameForAngle:0];
    double v12 = [(CEKLightingControl *)self _collapsedControlSelectionOverlay];
    [v12 setImage:v11];

    int v13 = objc_msgSend(v6, "backgroundFrameForAngle:lightingType:", 0, -[CEKLightingControl selectedLightingType](self, "selectedLightingType"));
    uint64_t v14 = [(CEKLightingControl *)self _collapsedControlSelectionUnderlay];
    [v14 setImage:v13];
  }
}

- (void)_settleSelectionViewsFromSelectionOffsetAngle:(double)a3
{
  objc_initWeak(&location, self);
  LODWORD(v5) = 1.0;
  BOOL v6 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :0.0 :v5];
  double v7 = [(CEKLightingControl *)self _animationGenerator];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__CEKLightingControl__settleSelectionViewsFromSelectionOffsetAngle___block_invoke;
  v9[3] = &unk_1E63CDEC8;
  objc_copyWeak(v11, &location);
  v11[1] = *(id *)&a3;
  id v8 = v6;
  id v10 = v8;
  [v7 startAnimationForIdentifier:@"cubeSettling" duration:v9 updateHandler:0 completionHandler:0.25];

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __68__CEKLightingControl__settleSelectionViewsFromSelectionOffsetAngle___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleSettlingSelectionViewsFromOffset:*(void *)(a1 + 32) withProgress:*(double *)(a1 + 48) timingCurve:a2];
}

- (void)_handleSettlingSelectionViewsFromOffset:(double)a3 withProgress:(double)a4 timingCurve:(id)a5
{
  double v5 = a3;
  *(float *)&a3 = a4;
  [a5 _solveForInput:a3];
  double v8 = (1.0 - v7) * v5;
  [(CEKLightingControl *)self _updateSelectionViewsWithSelectionOffsetAngle:v8];
}

- (void)setCollapsedItemFading:(id)a3
{
}

- (void)setCollapsedItemFading:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3.var0 != self->_collapsedItemFading.leftRate || a3.var1 != self->_collapsedItemFading.rightRate)
  {
    self->_collapsedItemFading = ($C9D92E28556B0069BD874CE32F50D5A6)a3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__CEKLightingControl_setCollapsedItemFading_animated___block_invoke;
    aBlock[3] = &unk_1E63CD380;
    aBlock[4] = self;
    double v5 = _Block_copy(aBlock);
    BOOL v6 = v5;
    if (v4) {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0.25];
    }
    else {
      (*((void (**)(void *))v5 + 2))(v5);
    }
  }
}

uint64_t __54__CEKLightingControl_setCollapsedItemFading_animated___block_invoke(uint64_t a1)
{
  long long v1 = *(void **)(a1 + 32);
  [v1 _selectionAngularOffset];
  return objc_msgSend(v1, "_updateItemViewsWithSelectionOffsetAngle:");
}

- (void)_updateItemViewsWithSelectionOffsetAngle:(double)a3
{
  BOOL v4 = self;
  int64_t v60 = [(CEKLightingControl *)self selectedLightingType];
  double v5 = [(CEKLightingControl *)v4 _effectItemsForType];
  BOOL v6 = [(CEKLightingControl *)v4 _itemViewsForType];
  float v7 = [(CEKLightingControl *)v4 _itemShadowViewsForType];
  double v8 = [(CEKLightingControl *)v4 _itemOutlineViewsForType];
  v62 = [(CEKLightingControl *)v4 _effectTypes];
  BOOL v9 = [(CEKLightingControl *)v4 isExpanded];
  uint64_t v10 = [(CEKLightingControl *)v4 collapsedControlLocation];
  double v11 = 1.0;
  unint64_t v12 = v10 - 1;
  BOOL v59 = v9;
  if (v9) {
    double v13 = 0.0;
  }
  else {
    double v13 = 1.0;
  }
  if (!v10) {
    double v11 = 0.0;
  }
  if (v12 >= 2) {
    double v13 = v11;
  }
  double v54 = v13;
  int v14 = v12 < 2 && !v9;
  int v61 = v14;
  [(CEKLightingControl *)v4 _angularSpacingForRadialLayout];
  double v16 = v15;
  uint64_t v17 = [(CEKLightingControl *)v4 _itemCount];
  if ([(CEKLightingControl *)v4 _itemCount])
  {
    unint64_t v18 = 0;
    double v19 = v16 * (double)(unint64_t)(v17 - 1);
    double v55 = fabs(a3);
    v57 = v6;
    v58 = v7;
    v56 = v8;
    do
    {
      unint64_t v20 = [v62 objectAtIndexedSubscript:v18];
      uint64_t v64 = [v6 objectForKeyedSubscript:v20];
      uint64_t v63 = [v7 objectForKeyedSubscript:v20];
      uint64_t v21 = [v8 objectForKeyedSubscript:v20];
      v65 = [v5 objectForKeyedSubscript:v20];
      uint64_t v22 = [v65 lightingType];
      [(CEKLightingControl *)v4 _offsetAngleForItemAtIndex:v18 withSelectionOffset:a3];
      double v24 = 1.0;
      double v25 = fmin(fabs(v23) / v19, 1.0);
      double v26 = (v25 * (v25 * v25) + v25 * v25 * -4.0 + v25 * 5.0) * 0.5 * -0.3 + 1.0;
      memset(&v69.c, 0, 32);
      if (!v59) {
        double v26 = v26 * 0.75;
      }
      *(_OWORD *)&v69.a = 0uLL;
      CGAffineTransformMakeScale(&v69, v26, v26);
      if (!v59)
      {
        uint64_t v27 = [(CEKLightingControl *)v4 collapsedItemFading];
        double v28 = v4;
        uint64_t v30 = v29;
        CGFloat v31 = v28;
        uint64_t v32 = [(CEKLightingControl *)v28 _selectionIndex];
        uint64_t v33 = v18 - v32;
        if ((uint64_t)(v18 - v32) >= 0) {
          uint64_t v34 = v30;
        }
        else {
          uint64_t v34 = v27;
        }
        if (v34 == 2)
        {
          if (v33 < 0) {
            uint64_t v33 = v32 - v18;
          }
          double v37 = 1.0 - (double)v33;
        }
        else
        {
          if (v34 != 1)
          {
            BOOL v4 = v31;
            double v8 = v56;
            BOOL v6 = v57;
            uint64_t v36 = v63;
            CGPoint v35 = (void *)v64;
            if (!v34) {
              double v24 = v25 * -0.7 + 1.0;
            }
            goto LABEL_31;
          }
          if (v33 < 0) {
            uint64_t v33 = v32 - v18;
          }
          double v37 = (double)v33 * -0.375 + 1.0;
        }
        double v24 = fmax(v37, 0.0);
        BOOL v4 = v31;
        double v8 = v56;
        BOOL v6 = v57;
      }
      uint64_t v36 = v63;
      CGPoint v35 = (void *)v64;
LABEL_31:
      double v38 = 0.0;
      double v39 = v24;
      if (v22 == v60 && v36 | v21)
      {
        [(CEKLightingControl *)v4 _angularSpacingForRadialLayout];
        double v39 = v24 * (1.0 - (v40 * 0.5 - v55) / (v40 * 0.5 - v40 * 0.5 * 0.5));
        double v38 = 1.0 - v39;
      }
      BOOL v41 = [(CEKLightingControl *)v4 _isLightingTypeEnabled:v22];
      if (v41) {
        double v42 = v24;
      }
      else {
        double v42 = 0.0;
      }
      if (v41) {
        double v43 = v39;
      }
      else {
        double v43 = 0.0;
      }
      if (v41) {
        double v44 = v38;
      }
      else {
        double v44 = 0.0;
      }
      if (v61)
      {
        double v42 = 0.0;
        double v45 = 0.0;
      }
      else
      {
        double v45 = v43;
      }
      if (v61) {
        double v46 = 0.0;
      }
      else {
        double v46 = v44;
      }
      objc_msgSend(v35, "setAlpha:", v42, v43, v44);
      [(id)v36 setAlpha:v46];
      [(id)v21 setAlpha:v45];
      CGAffineTransform v68 = v69;
      [v35 setTransform:&v68];
      CGAffineTransform v67 = v69;
      [(id)v36 setTransform:&v67];
      CGAffineTransform v66 = v69;
      [(id)v21 setTransform:&v66];

      ++v18;
      float v7 = v58;
    }
    while (v18 < [(CEKLightingControl *)v4 _itemCount]);
  }
  if (v61) {
    double v47 = 0.0;
  }
  else {
    double v47 = 1.0;
  }
  v48 = [(CEKLightingControl *)v4 _selectionUnderlay];
  [v48 setAlpha:v47];

  v49 = [(CEKLightingControl *)v4 _selectionOverlay];
  [v49 setAlpha:v47];

  v50 = [(CEKLightingControl *)v4 _collapsedControlItemView];
  [v50 setAlpha:v54];

  v51 = [(CEKLightingControl *)v4 _collapsedControlShadowView];
  [v51 setAlpha:v54];

  v52 = [(CEKLightingControl *)v4 _collapsedControlSelectionUnderlay];
  [v52 setAlpha:v54];

  v53 = [(CEKLightingControl *)v4 _collapsedControlSelectionOverlay];
  [v53 setAlpha:v54];
}

- (void)setNameBadgeHidden:(BOOL)a3
{
}

- (void)setNameBadgeHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_nameBadgeHidden != a3)
  {
    self->_nameBadgeHidden = a3;
    [(CEKLightingControl *)self _updateNameBadgeAnimated:a4];
  }
}

- (void)_updateNameBadgeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (double)([(CEKLightingControl *)self isNameBadgeHidden] ^ 1);
  BOOL v6 = [(CEKLightingControl *)self _nameBadge];
  float v7 = v6;
  if (v3)
  {
    double v8 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    double v11 = __47__CEKLightingControl__updateNameBadgeAnimated___block_invoke;
    unint64_t v12 = &unk_1E63CD5A0;
    id v13 = v6;
    double v14 = v5;
    [v8 animateWithDuration:&v9 animations:0.25];
  }
  else
  {
    [v6 setAlpha:v5];
  }
  objc_msgSend(v7, "setLightingType:", -[CEKLightingControl selectedLightingType](self, "selectedLightingType", v9, v10, v11, v12));
}

uint64_t __47__CEKLightingControl__updateNameBadgeAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)setOrientation:(int64_t)a3
{
  int64_t orientation = self->_orientation;
  if (orientation != a3)
  {
    self->_int64_t orientation = a3;
    if (a3 == 2 || orientation == 2) {
      [(CEKLightingControl *)self setNeedsLayout];
    }
  }
}

- (void)setNameBadgeFontStyle:(unint64_t)a3
{
  id v4 = [(CEKLightingControl *)self _nameBadge];
  [v4 setFontStyle:a3];
}

- (unint64_t)nameBadgeFontStyle
{
  uint64_t v2 = [(CEKLightingControl *)self _nameBadge];
  unint64_t v3 = [v2 fontStyle];

  return v3;
}

- (void)_loadItemsIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(CEKLightingControl *)self _effectItemsForType];

  if (!v3)
  {
    id v4 = [(CEKLightingControl *)self _effectTypes];
    double v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          unint64_t v12 = -[CEKLightingControlItem initWithType:]([CEKLightingControlItem alloc], "initWithType:", objc_msgSend(v11, "integerValue", (void)v13));
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [(CEKLightingControl *)self _setEffectItemsForType:v5];
  }
}

- (unint64_t)_itemCount
{
  uint64_t v2 = [(CEKLightingControl *)self _effectTypes];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)_enabledItemCount
{
  uint64_t v2 = [(CEKLightingControl *)self _enabledEffectTypes];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)_createItemViewsIfNeeded
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(CEKLightingControl *)self _itemViewsForType];

  if (!v3)
  {
    [(CEKLightingControl *)self _loadItemsIfNeeded];
    id v4 = [(CEKLightingControl *)self _effectItemsForType];
    double v5 = [v4 allValues];

    uint64_t v29 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    double v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    double v25 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_7];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v28 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v10 = [v9 lightingType];
          double v11 = [v9 displayImage];
          unint64_t v12 = [v9 displayShadowImage];
          long long v13 = [v9 displayOutlineImage];
          if (v12)
          {
            long long v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v12];
            long long v15 = [MEMORY[0x1E4F28ED0] numberWithInteger:v10];
            [v27 setObject:v14 forKeyedSubscript:v15];

            long long v16 = [(CEKLightingControl *)self _itemContainer];
            [v16 addSubview:v14];
          }
          if (v13)
          {
            uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v13];
            [v17 setTintColor:v25];
            uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithInteger:v10];
            [v26 setObject:v17 forKeyedSubscript:v18];

            double v19 = [(CEKLightingControl *)self _itemContainer];
            [v19 addSubview:v17];
          }
          unint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v11];
          uint64_t v21 = [MEMORY[0x1E4F28ED0] numberWithInteger:v10];
          [v29 setObject:v20 forKeyedSubscript:v21];

          uint64_t v22 = [(CEKLightingControl *)self _itemContainer];
          [v22 addSubview:v20];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v7);
    }

    double v23 = [(CEKLightingControl *)self _selectionOverlay];
    [(CEKLightingControl *)self bringSubviewToFront:v23];

    [(CEKLightingControl *)self _setItemViewsForType:v29];
    [(CEKLightingControl *)self _setItemShadowViewsForType:v27];
    [(CEKLightingControl *)self _setItemOutlineViewsForType:v26];
  }
}

id __46__CEKLightingControl__createItemViewsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 1) {
    [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  }
  else {
  uint64_t v2 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.5];
  }
  return v2;
}

- (void)_createCollapsedControlViewsIfNeeded
{
  if ([(CEKLightingControl *)self collapsedControlLocation])
  {
    unint64_t v3 = [(CEKLightingControl *)self _collapsedControlItemView];

    if (!v3)
    {
      id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
      [(CEKLightingControl *)self set_collapsedControlItemView:v4];

      double v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
      [(CEKLightingControl *)self set_collapsedControlShadowView:v5];

      id v6 = objc_alloc_init(MEMORY[0x1E4FB1838]);
      [(CEKLightingControl *)self set_collapsedControlSelectionUnderlay:v6];

      uint64_t v7 = objc_alloc_init(CEKMultiplyImageView);
      [(CEKLightingControl *)self set_collapsedControlSelectionOverlay:v7];

      uint64_t v8 = [(CEKLightingControl *)self _itemContainer];
      uint64_t v9 = [(CEKLightingControl *)self _collapsedControlSelectionUnderlay];
      [v8 addSubview:v9];

      uint64_t v10 = [(CEKLightingControl *)self _itemContainer];
      double v11 = [(CEKLightingControl *)self _collapsedControlShadowView];
      [v10 addSubview:v11];

      unint64_t v12 = [(CEKLightingControl *)self _itemContainer];
      long long v13 = [(CEKLightingControl *)self _collapsedControlItemView];
      [v12 addSubview:v13];

      long long v14 = [(CEKLightingControl *)self _itemContainer];
      long long v15 = [(CEKLightingControl *)self _collapsedControlSelectionOverlay];
      [v14 addSubview:v15];

      [(CEKLightingControl *)self _updateImagesForCollapedControlViews];
    }
  }
}

- (void)_createBackgroundViewIfNeeded
{
  unint64_t v3 = [(CEKLightingControl *)self _backgroundView];

  if (!v3)
  {
    id v4 = objc_alloc_init(CEKLightingDialBackground);
    [(CEKLightingDialBackground *)v4 setUserInteractionEnabled:0];
    [(CEKLightingControl *)self _dialRadius];
    -[CEKLightingDialBackground setRadius:](v4, "setRadius:");
    [(CEKLightingControl *)self insertSubview:v4 atIndex:0];
    [(CEKLightingControl *)self _setBackgroundView:v4];
  }
}

- (void)_createSelectionViewsIfNeeded
{
  unint64_t v3 = [(CEKLightingControl *)self _selectionOverlay];

  if (!v3)
  {
    id v4 = objc_alloc_init(CEKMultiplyImageView);
    [(CEKLightingControl *)self addSubview:v4];
    [(CEKLightingControl *)self setNeedsLayout];
    [(CEKLightingControl *)self _setSelectionOverlay:v4];
    [(CEKLightingControl *)self _updateSelectionOverlayColorAnimated:0];
  }
  double v5 = [(CEKLightingControl *)self _selectionUnderlay];

  if (!v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    [(CEKLightingControl *)self insertSubview:v7 atIndex:0];
    id v6 = [(CEKLightingControl *)self _backgroundView];
    [(CEKLightingControl *)self sendSubviewToBack:v6];

    [(CEKLightingControl *)self _setSelectionUnderlay:v7];
  }
}

- (void)_createNameBadgeIfNeeded
{
  unint64_t v3 = [(CEKLightingControl *)self _nameBadge];

  if (!v3)
  {
    id v4 = objc_alloc_init(CEKLightingNameBadge);
    [(CEKBadgeView *)v4 setDelegate:self];
    [(CEKLightingControl *)self addSubview:v4];
    [(CEKLightingControl *)self _setNameBadge:v4];
    [(CEKLightingControl *)self _updateNameBadgeAnimated:0];
  }
}

- (void)_createItemContainerIfNeeded
{
  unint64_t v3 = [(CEKLightingControl *)self _itemContainer];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(CEKLightingControl *)self addSubview:v4];
    [v4 setClipsToBounds:1];
    [v4 setUserInteractionEnabled:0];
    [(CEKLightingControl *)self _setItemContainer:v4];
  }
}

- (void)_prepareFeedback
{
  id v2 = [(CEKLightingControl *)self _selectionFeedbackGenerator];
  [v2 prepareFeedback];
}

- (void)_performFeedback
{
  id v2 = [(CEKLightingControl *)self _selectionFeedbackGenerator];
  [v2 performFeedback];
}

- (CEKLightingControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CEKLightingControlDelegate *)WeakRetained;
}

- (int64_t)lightingEffectSet
{
  return self->_lightingEffectSet;
}

- (int64_t)selectedLightingType
{
  return self->_selectedLightingType;
}

- (BOOL)isTracking
{
  return self->_tracking;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)collapsedItemFading
{
  p_collapsedItemFading = &self->_collapsedItemFading;
  unint64_t leftRate = self->_collapsedItemFading.leftRate;
  unint64_t rightRate = p_collapsedItemFading->rightRate;
  result.var1 = rightRate;
  result.var0 = leftRate;
  return result;
}

- (BOOL)isNameBadgeHidden
{
  return self->_nameBadgeHidden;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (double)additionalBottomPadding
{
  return self->_additionalBottomPadding;
}

- (double)maxContentWidth
{
  return self->_maxContentWidth;
}

- (unint64_t)collapsedControlLocation
{
  return self->_collapsedControlLocation;
}

- (double)collapsedSelectionCenterPointEdgeInset
{
  return self->_collapsedSelectionCenterPointEdgeInset;
}

- (NSArray)_effectTypes
{
  return self->__effectTypes;
}

- (NSSet)_enabledEffectTypes
{
  return self->__enabledEffectTypes;
}

- (void)set_enabledEffectTypes:(id)a3
{
}

- (NSDictionary)_effectItemsForType
{
  return self->__effectItemsForType;
}

- (void)_setEffectItemsForType:(id)a3
{
}

- (double)_selectionAngularOffset
{
  return self->__selectionAngularOffset;
}

- (void)_setSelectionAngularOffset:(double)a3
{
  self->__selectionAngularOffset = a3;
}

- (unint64_t)_selectionIndex
{
  return self->__selectionIndex;
}

- (CEKLightingFrameCache)_frameCache
{
  return self->__frameCache;
}

- (NSDictionary)_itemViewsForType
{
  return self->__itemViewsForType;
}

- (void)_setItemViewsForType:(id)a3
{
}

- (NSDictionary)_itemShadowViewsForType
{
  return self->__itemShadowViewsForType;
}

- (void)_setItemShadowViewsForType:(id)a3
{
}

- (NSDictionary)_itemOutlineViewsForType
{
  return self->__itemOutlineViewsForType;
}

- (void)_setItemOutlineViewsForType:(id)a3
{
}

- (UIImageView)_collapsedControlItemView
{
  return self->__collapsedControlItemView;
}

- (void)set_collapsedControlItemView:(id)a3
{
}

- (UIImageView)_collapsedControlShadowView
{
  return self->__collapsedControlShadowView;
}

- (void)set_collapsedControlShadowView:(id)a3
{
}

- (UIImageView)_collapsedControlSelectionUnderlay
{
  return self->__collapsedControlSelectionUnderlay;
}

- (void)set_collapsedControlSelectionUnderlay:(id)a3
{
}

- (CEKMultiplyImageView)_collapsedControlSelectionOverlay
{
  return self->__collapsedControlSelectionOverlay;
}

- (void)set_collapsedControlSelectionOverlay:(id)a3
{
}

- (CEKLightingDialBackground)_backgroundView
{
  return self->__backgroundView;
}

- (void)_setBackgroundView:(id)a3
{
}

- (CEKMultiplyImageView)_selectionOverlay
{
  return self->__selectionOverlay;
}

- (void)_setSelectionOverlay:(id)a3
{
}

- (UIImageView)_selectionUnderlay
{
  return self->__selectionUnderlay;
}

- (void)_setSelectionUnderlay:(id)a3
{
}

- (CEKLightingNameBadge)_nameBadge
{
  return self->__nameBadge;
}

- (void)_setNameBadge:(id)a3
{
}

- (UIView)_itemContainer
{
  return self->__itemContainer;
}

- (void)_setItemContainer:(id)a3
{
}

- (UIPanGestureRecognizer)_panGesture
{
  return self->__panGesture;
}

- (UILongPressGestureRecognizer)_pressGesture
{
  return self->__pressGesture;
}

- (UITapGestureRecognizer)_tapGesture
{
  return self->__tapGesture;
}

- (NSDate)_timeTrackingBegan
{
  return self->__timeTrackingBegan;
}

- (void)_setTimeTrackingBegan:(id)a3
{
}

- (CEKAnimationGenerator)_animationGenerator
{
  return self->__animationGenerator;
}

- (NSTimer)_collapseTimer
{
  return self->__collapseTimer;
}

- (void)_setCollapseTimer:(id)a3
{
}

- (unint64_t)_expandedAnimationCounter
{
  return self->__expandedAnimationCounter;
}

- (void)_setExpandedAnimationCounter:(unint64_t)a3
{
  self->__expandedAnimationCounter = a3;
}

- (CEKSelectionFeedbackGenerator)_selectionFeedbackGenerator
{
  return self->__selectionFeedbackGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->__collapseTimer, 0);
  objc_storeStrong((id *)&self->__animationGenerator, 0);
  objc_storeStrong((id *)&self->__timeTrackingBegan, 0);
  objc_storeStrong((id *)&self->__tapGesture, 0);
  objc_storeStrong((id *)&self->__pressGesture, 0);
  objc_storeStrong((id *)&self->__panGesture, 0);
  objc_storeStrong((id *)&self->__itemContainer, 0);
  objc_storeStrong((id *)&self->__nameBadge, 0);
  objc_storeStrong((id *)&self->__selectionUnderlay, 0);
  objc_storeStrong((id *)&self->__selectionOverlay, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
  objc_storeStrong((id *)&self->__collapsedControlSelectionOverlay, 0);
  objc_storeStrong((id *)&self->__collapsedControlSelectionUnderlay, 0);
  objc_storeStrong((id *)&self->__collapsedControlShadowView, 0);
  objc_storeStrong((id *)&self->__collapsedControlItemView, 0);
  objc_storeStrong((id *)&self->__itemOutlineViewsForType, 0);
  objc_storeStrong((id *)&self->__itemShadowViewsForType, 0);
  objc_storeStrong((id *)&self->__itemViewsForType, 0);
  objc_storeStrong((id *)&self->__frameCache, 0);
  objc_storeStrong((id *)&self->__effectItemsForType, 0);
  objc_storeStrong((id *)&self->__enabledEffectTypes, 0);
  objc_storeStrong((id *)&self->__effectTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end