@interface CAMExpandableMenuButton
+ (double)expansionDuration;
- (BOOL)_isTrackingViewHighlighted;
- (BOOL)_wantsHeaderViewToBeVisible;
- (BOOL)isExpanded;
- (BOOL)shouldAllowExpansion;
- (BOOL)shouldIgnoreMenuInteraction;
- (BOOL)wantsSelectedItemToBeVisible;
- (CAMExpandableMenuButton)initWithCoder:(id)a3;
- (CAMExpandableMenuButton)initWithFrame:(CGRect)a3;
- (CAMExpandableMenuButton)initWithLayoutStyle:(int64_t)a3;
- (CAMExpandableMenuButtonDelegate)expandableMenuDelegate;
- (CAMTouchingGestureRecognizer)touchingGestureRecognizer;
- (CGRect)alignmentRectForFrame:(CGRect)a3 expanded:(BOOL)a4;
- (CGRect)frameForAlignmentRect:(CGRect)a3 expanded:(BOOL)a4;
- (CGSize)_layoutForPadCollapsedPortraitButton:(BOOL)a3;
- (CGSize)_layoutForPadExpandedPortraitButton:(BOOL)a3;
- (CGSize)_layoutForPadStyle:(BOOL)a3 expanded:(BOOL)a4;
- (CGSize)_layoutForPhoneCollapsedLandscapeButton:(BOOL)a3;
- (CGSize)_layoutForPhoneCollapsedPortraitButton:(BOOL)a3;
- (CGSize)_layoutForPhoneExpandedLandscapeButton:(BOOL)a3;
- (CGSize)_layoutForPhoneExpandedPortraitButton:(BOOL)a3;
- (CGSize)_layoutForPhoneStyle:(BOOL)a3 expanded:(BOOL)a4;
- (CGSize)_layoutMenuButton:(BOOL)a3 expanded:(BOOL)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)intrinsicContentSizeForExpansion:(BOOL)a3;
- (NSIndexSet)_shownIndexesWhileCollapsed;
- (NSMutableArray)_menuItems;
- (NSMutableIndexSet)_highlightedIndexesWhileCollapsed;
- (UIEdgeInsets)tappableEdgeInsets;
- (UIImageView)_padBackgroundView;
- (UIView)_headerView;
- (UIView)_trackingView;
- (double)collapsedSelectedLabelHorizontalMargin;
- (double)padHeaderViewContentInsetLeft;
- (id)_selectedLabel;
- (id)_viewToTrackForTouchAtLocation:(CGPoint)a3;
- (id)headerView;
- (id)hudItemForAccessibilityHUDManager:(id)a3;
- (id)shownIndexesWhileCollapsed;
- (id)titleForMenuItemAtIndex:(int64_t)a3;
- (int64_t)layoutStyle;
- (int64_t)numberOfMenuItems;
- (int64_t)orientation;
- (int64_t)selectedIndex;
- (void)_applyHeaderViewForCurrentExpansionState;
- (void)_applyMenuItemAlphaForCurrentExpansionState;
- (void)_applyMenuItemColorsForCurrentState;
- (void)_applyMenuItemTextAlignmentAndShadowForCurrentOrientation;
- (void)_convertAllSubviewsToProposedFrame:(CGRect)a3;
- (void)_createPadBackgroundView;
- (void)_handleTouchGesture:(id)a3;
- (void)_setTrackingView:(id)a3;
- (void)_setTrackingViewHighlighted:(BOOL)a3;
- (void)_updateFromExpansionChangeAnimated:(BOOL)a3;
- (void)_updateFromOrientationChangeAnimated:(BOOL)a3;
- (void)_updateFromSelectedIndexChange;
- (void)collapseMenuAnimated:(BOOL)a3;
- (void)completeExpansionToProposedFrame:(CGRect)a3;
- (void)expandMenuAnimated:(BOOL)a3;
- (void)finishCollapsingAnimated:(BOOL)a3;
- (void)finishExpansionAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)reloadData;
- (void)selectedByAccessibilityHUDManager:(id)a3;
- (void)setExpandableMenuDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3 forIndex:(int64_t)a4;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setSelectedIndex:(int64_t)a3;
- (void)setTappableEdgeInsets:(UIEdgeInsets)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CAMExpandableMenuButton

- (CAMExpandableMenuButton)initWithLayoutStyle:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CAMExpandableMenuButton;
  v4 = -[CAMExpandableMenuButton initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    menuItems = v4->__menuItems;
    v4->__menuItems = v5;

    v4->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    v4->_orientation = 1;
    v4->_layoutStyle = a3;
    v7 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
    highlightedIndexesWhileCollapsed = v4->__highlightedIndexesWhileCollapsed;
    v4->__highlightedIndexesWhileCollapsed = v7;

    v9 = [MEMORY[0x263F825C8] whiteColor];
    [(CAMExpandableMenuButton *)v4 setTintColor:v9];

    [(CAMExpandableMenuButton *)v4 _updateFromExpansionChangeAnimated:0];
    [(CAMExpandableMenuButton *)v4 _updateFromOrientationChangeAnimated:0];
    v10 = [[CAMTouchingGestureRecognizer alloc] initWithTarget:v4 action:sel__handleTouchGesture_];
    touchingGestureRecognizer = v4->_touchingGestureRecognizer;
    v4->_touchingGestureRecognizer = v10;

    [(CAMExpandableMenuButton *)v4 addGestureRecognizer:v4->_touchingGestureRecognizer];
    v12 = v4;
  }

  return v4;
}

- (void)_updateFromExpansionChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(CAMExpandableMenuButton *)self invalidateIntrinsicContentSize];
  [(CAMExpandableMenuButton *)self setNeedsLayout];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__CAMExpandableMenuButton__updateFromExpansionChangeAnimated___block_invoke;
  aBlock[3] = &unk_263FA0208;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  v6 = v5;
  if (v3)
  {
    [(id)objc_opt_class() expansionDuration];
    double v8 = v7;
    v9 = (void *)MEMORY[0x263F82E00];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __62__CAMExpandableMenuButton__updateFromExpansionChangeAnimated___block_invoke_2;
    v10[3] = &unk_263FA08E8;
    v10[4] = self;
    id v11 = v6;
    [v9 animateWithDuration:2 delay:v10 options:0 animations:v8 completion:0.0];
  }
  else
  {
    (*((void (**)(void *))v5 + 2))(v5);
  }
}

uint64_t __62__CAMExpandableMenuButton__updateFromExpansionChangeAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _applyHeaderViewForCurrentExpansionState];
  [*(id *)(a1 + 32) _applyMenuItemColorsForCurrentState];
  v2 = *(void **)(a1 + 32);
  return [v2 _applyMenuItemAlphaForCurrentExpansionState];
}

- (void)_applyHeaderViewForCurrentExpansionState
{
  BOOL v3 = [(CAMExpandableMenuButton *)self _headerView];

  if (v3)
  {
    BOOL v4 = [(CAMExpandableMenuButton *)self isExpanded];
    [(CAMExpandableMenuButton *)self prepareHeaderViewForExpanding:v4];
  }
}

- (UIView)_headerView
{
  return self->__headerView;
}

- (void)_applyMenuItemColorsForCurrentState
{
  if ([(NSMutableArray *)self->__menuItems count])
  {
    BOOL v3 = [(CAMExpandableMenuButton *)self isExpanded];
    menuItems = self->__menuItems;
    if (v3)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __62__CAMExpandableMenuButton__applyMenuItemColorsForCurrentState__block_invoke;
      v14[3] = &unk_263FA5098;
      v14[4] = self;
      [(NSMutableArray *)menuItems enumerateObjectsUsingBlock:v14];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      headerView = self->__headerView;
      double v7 = (void *)MEMORY[0x263F825C8];
      if (isKindOfClass)
      {
        double v8 = headerView;
        v9 = [v7 whiteColor];
        [(UIView *)v8 setTextColor:v9];

LABEL_11:
        return;
      }
      v9 = [MEMORY[0x263F825C8] whiteColor];
      v12 = headerView;
    }
    else
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __62__CAMExpandableMenuButton__applyMenuItemColorsForCurrentState__block_invoke_2;
      v13[3] = &unk_263FA5098;
      v13[4] = self;
      [(NSMutableArray *)menuItems enumerateObjectsUsingBlock:v13];
      v9 = [MEMORY[0x263F825C8] whiteColor];
      if ([(NSMutableIndexSet *)self->__highlightedIndexesWhileCollapsed containsIndex:self->_selectedIndex])
      {
        uint64_t v10 = [MEMORY[0x263F825C8] systemYellowColor];

        v9 = (void *)v10;
      }
      objc_opt_class();
      char v11 = objc_opt_isKindOfClass();
      v12 = self->__headerView;
      if (v11)
      {
        [(UIView *)v12 setTextColor:v9];
        goto LABEL_11;
      }
    }
    [(UIView *)v12 setTintColor:v9];
    goto LABEL_11;
  }
}

- (void)_applyMenuItemAlphaForCurrentExpansionState
{
  if ([(CAMExpandableMenuButton *)self isExpanded]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  menuItems = self->__menuItems;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__CAMExpandableMenuButton__applyMenuItemAlphaForCurrentExpansionState__block_invoke;
  v6[3] = &unk_263FA50C0;
  v6[4] = self;
  v6[5] = 0x3FF0000000000000;
  *(double *)&v6[6] = v3;
  [(NSMutableArray *)menuItems enumerateObjectsUsingBlock:v6];
  if ([(CAMExpandableMenuButton *)self _wantsHeaderViewToBeVisible]) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  [(UIView *)self->__headerView setAlpha:v5];
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)_wantsHeaderViewToBeVisible
{
  BOOL v3 = [(CAMExpandableMenuButton *)self isExpanded];
  BOOL v4 = [(CAMExpandableMenuButton *)self wantsSelectedItemToBeVisible];
  return [(CAMExpandableMenuButton *)self layoutStyle] != 1 || v3 || !v4;
}

- (BOOL)wantsSelectedItemToBeVisible
{
  int64_t v3 = [(CAMExpandableMenuButton *)self selectedIndex];
  BOOL v4 = [(CAMExpandableMenuButton *)self _shownIndexesWhileCollapsed];
  LOBYTE(v3) = [v4 containsIndex:v3];

  return v3;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (NSIndexSet)_shownIndexesWhileCollapsed
{
  return self->__shownIndexesWhileCollapsed;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)_updateFromOrientationChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CAMExpandableMenuButton *)self isHidden])
  {
    uint64_t v5 = 0;
    id v6 = 0;
  }
  else
  {
    [(CAMExpandableMenuButton *)self alpha];
    id v6 = 0;
    uint64_t v5 = 0;
    if (v3 && v7 != 0.0)
    {
      double v8 = [(CAMExpandableMenuButton *)self snapshotViewAfterScreenUpdates:0];
      v9 = (void *)MEMORY[0x263F82E00];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke;
      v21[3] = &unk_263FA0408;
      id v6 = v8;
      id v22 = v6;
      v23 = self;
      [v9 performWithoutAnimation:v21];

      uint64_t v5 = 1;
    }
  }
  uint64_t v10 = [(CAMExpandableMenuButton *)self shownIndexesWhileCollapsed];
  int v11 = objc_msgSend(v10, "containsIndex:", -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex"));
  +[CAMView rotateView:self toInterfaceOrientation:self->_orientation animated:v5];
  [(CAMExpandableMenuButton *)self _applyMenuItemTextAlignmentAndShadowForCurrentOrientation];
  if ([(CAMExpandableMenuButton *)self isExpanded])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_expandableMenuDelegate);
    [WeakRetained collapseMenuButton:self animated:0];
  }
  if (v11) {
    [(CAMExpandableMenuButton *)self _removeAllAnimations:1];
  }
  [(CAMExpandableMenuButton *)self setNeedsLayout];
  [(CAMExpandableMenuButton *)self invalidateIntrinsicContentSize];
  if ((v5 & v11) == 1)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke_2;
    v20[3] = &unk_263FA0208;
    v20[4] = self;
    [MEMORY[0x263F82E00] performWithoutAnimation:v20];
    v13 = [(CAMExpandableMenuButton *)self superview];
    [v13 addSubview:v6];

    objc_super v14 = (void *)MEMORY[0x263F82E00];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke_3;
    v18[3] = &unk_263FA0208;
    id v19 = v6;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke_4;
    v16[3] = &unk_263FA0430;
    id v17 = v19;
    [v14 animateWithDuration:2 delay:v18 options:v16 animations:0.2 completion:0.0];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke_5;
    v15[3] = &unk_263FA0208;
    v15[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:2 delay:v15 options:0 animations:0.5 completion:0.0];
  }
}

- (id)shownIndexesWhileCollapsed
{
  return 0;
}

- (void)_applyMenuItemTextAlignmentAndShadowForCurrentOrientation
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t v2 = self->_orientation - 3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = self->__menuItems;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setTextAlignment:", v2 < 2, (void)v9);
        [v8 setWantsLegibilityShadow:v2 < 2];
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)reloadData
{
  int64_t v3 = [(CAMExpandableMenuButton *)self layoutStyle];
  [(NSMutableArray *)self->__menuItems makeObjectsPerformSelector:sel_removeFromSuperview];
  [(NSMutableArray *)self->__menuItems removeAllObjects];
  uint64_t v4 = [(CAMExpandableMenuButton *)self numberOfMenuItems];
  if (v4 >= 1)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    double v7 = *MEMORY[0x263F001A8];
    double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
    do
    {
      long long v11 = -[CAMButtonLabel initWithFrame:]([CAMButtonLabel alloc], "initWithFrame:", v7, v8, v9, v10);
      long long v12 = [(CAMExpandableMenuButton *)self titleForMenuItemAtIndex:v6];
      [(CAMButtonLabel *)v11 setText:v12];
      [(NSMutableArray *)self->__menuItems addObject:v11];
      [(CAMExpandableMenuButton *)self addSubview:v11];

      ++v6;
    }
    while (v5 != v6);
  }
  [(UIView *)self->__headerView removeFromSuperview];
  v13 = [(CAMExpandableMenuButton *)self headerView];
  headerView = self->__headerView;
  self->__headerView = v13;

  [(CAMExpandableMenuButton *)self addSubview:self->__headerView];
  [(UIImageView *)self->__padBackgroundView removeFromSuperview];
  padBackgroundView = self->__padBackgroundView;
  self->__padBackgroundView = 0;

  if (v3 == 1) {
    [(CAMExpandableMenuButton *)self _createPadBackgroundView];
  }
  v16 = [(CAMExpandableMenuButton *)self shownIndexesWhileCollapsed];
  shownIndexesWhileCollapsed = self->__shownIndexesWhileCollapsed;
  self->__shownIndexesWhileCollapsed = v16;

  uint64_t v18 = [(NSMutableArray *)self->__menuItems count];
  unint64_t selectedIndex = self->_selectedIndex;
  if (selectedIndex > [(NSMutableArray *)self->__menuItems count] - 1)
  {
    int64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    if (v18 > 0) {
      int64_t v20 = 0;
    }
    self->_unint64_t selectedIndex = v20;
  }
  [(CAMExpandableMenuButton *)self _applyMenuItemColorsForCurrentState];
  [(CAMExpandableMenuButton *)self _applyMenuItemAlphaForCurrentExpansionState];
  [(CAMExpandableMenuButton *)self _applyMenuItemTextAlignmentAndShadowForCurrentOrientation];
  [(CAMExpandableMenuButton *)self setNeedsLayout];
}

void __70__CAMExpandableMenuButton__applyMenuItemAlphaForCurrentExpansionState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v9 = v5;
  if (v6[59] == a3 && (int v7 = [v6 wantsSelectedItemToBeVisible], v5 = v9, v7)) {
    double v8 = (double *)(a1 + 40);
  }
  else {
    double v8 = (double *)(a1 + 48);
  }
  [v5 setAlpha:*v8];
}

- (void)setHighlighted:(BOOL)a3 forIndex:(int64_t)a4
{
  highlightedIndexesWhileCollapsed = self->__highlightedIndexesWhileCollapsed;
  if (a3) {
    [(NSMutableIndexSet *)highlightedIndexesWhileCollapsed addIndex:a4];
  }
  else {
    [(NSMutableIndexSet *)highlightedIndexesWhileCollapsed removeIndex:a4];
  }
  [(CAMExpandableMenuButton *)self _applyMenuItemColorsForCurrentState];
}

- (void)setSelectedIndex:(int64_t)a3
{
  if (self->_selectedIndex != a3)
  {
    self->_unint64_t selectedIndex = a3;
    [(CAMExpandableMenuButton *)self _updateFromSelectedIndexChange];
  }
}

- (void)_updateFromSelectedIndexChange
{
  [(CAMExpandableMenuButton *)self invalidateIntrinsicContentSize];
  [(CAMExpandableMenuButton *)self setNeedsLayout];
  [(CAMExpandableMenuButton *)self _applyMenuItemColorsForCurrentState];
  [(CAMExpandableMenuButton *)self _applyMenuItemAlphaForCurrentExpansionState];
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    [(CAMExpandableMenuButton *)self setNeedsLayout];
  }
}

- (void)setExpandableMenuDelegate:(id)a3
{
}

- (void)collapseMenuAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expandableMenuDelegate);
  [WeakRetained collapseMenuButton:self animated:v3];
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    [(CAMExpandableMenuButton *)self _updateFromOrientationChangeAnimated:a4];
  }
}

- (CGSize)intrinsicContentSizeForExpansion:(BOOL)a3
{
  [(CAMExpandableMenuButton *)self _layoutMenuButton:0 expanded:a3];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutMenuButton:(BOOL)a3 expanded:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = *MEMORY[0x263F001B0];
  double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  switch([(CAMExpandableMenuButton *)self layoutStyle])
  {
    case 0:
    case 2:
    case 4:
      [(CAMExpandableMenuButton *)self _layoutForPhoneStyle:v5 expanded:v4];
      goto LABEL_4;
    case 1:
      [(CAMExpandableMenuButton *)self _layoutForPadStyle:v5 expanded:v4];
LABEL_4:
      double v7 = v9;
      double v8 = v10;
      break;
    default:
      break;
  }
  double v11 = v7;
  double v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)_layoutForPhoneStyle:(BOOL)a3 expanded:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unint64_t v7 = [(CAMExpandableMenuButton *)self orientation] - 3;
  char v8 = !v4;
  if (!v4 || v7 > 1)
  {
    if (v7 < 2) {
      char v8 = 1;
    }
    if (v8)
    {
      if (v4 || v7 > 1)
      {
        double v9 = *MEMORY[0x263F001B0];
        double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
        if (!v4 && v7 >= 2) {
          -[CAMExpandableMenuButton _layoutForPhoneCollapsedPortraitButton:](self, "_layoutForPhoneCollapsedPortraitButton:", v5, v9, v10);
        }
      }
      else
      {
        [(CAMExpandableMenuButton *)self _layoutForPhoneCollapsedLandscapeButton:v5];
      }
    }
    else
    {
      [(CAMExpandableMenuButton *)self _layoutForPhoneExpandedPortraitButton:v5];
    }
  }
  else
  {
    [(CAMExpandableMenuButton *)self _layoutForPhoneExpandedLandscapeButton:v5];
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (CGSize)_layoutForPhoneCollapsedPortraitButton:(BOOL)a3
{
  BOOL v3 = a3;
  [(CAMExpandableMenuButton *)self bounds];
  -[CAMExpandableMenuButton alignmentRectForFrame:expanded:](self, "alignmentRectForFrame:expanded:", 0);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  BOOL v13 = [(CAMExpandableMenuButton *)self wantsSelectedItemToBeVisible];
  [(UIView *)self->__headerView intrinsicContentSize];
  uint64_t v53 = 0;
  UIRectCenteredIntegralRectScale();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  if (v13)
  {
    v60.origin.x = v6;
    v60.origin.y = v8;
    v60.size.width = v10;
    v60.size.height = v12;
    rect.origin.x = CGRectGetMinX(v60) + 0.0;
    if (v3)
    {
      v21 = [(CAMExpandableMenuButton *)self _headerView];
      objc_msgSend(v21, "frameForAlignmentRect:", rect.origin.x, v16, v18, v20);
      CAMViewSetBoundsAndCenterForFrame(v21, v22, v23, v24, v25);
    }
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x2020000000;
    v58[3] = 0;
    menuItems = self->__menuItems;
    *(void *)&rect.origin.y = MEMORY[0x263EF8330];
    *(void *)&rect.size.width = 3221225472;
    *(void *)&rect.size.height = __66__CAMExpandableMenuButton__layoutForPhoneCollapsedPortraitButton___block_invoke;
    v56 = &unk_263FA5070;
    v57 = v58;
    -[NSMutableArray enumerateObjectsUsingBlock:](menuItems, "enumerateObjectsUsingBlock:", &rect.origin.y, v53);
    v27 = [(CAMExpandableMenuButton *)self _selectedLabel];
    [v27 intrinsicContentSize];
    UIRectCenteredIntegralRectScale();
    double v54 = v28;
    double v30 = v29;
    double v32 = v31;
    v61.origin.x = rect.origin.x;
    v61.origin.y = v16;
    v61.size.width = v18;
    v61.size.height = v20;
    double MaxX = CGRectGetMaxX(v61);
    [(CAMExpandableMenuButton *)self collapsedSelectedLabelHorizontalMargin];
    double v35 = MaxX + v34;
    if (v3)
    {
      objc_msgSend(v27, "frameForAlignmentRect:", MaxX + v34, v54, v30, v32);
      CAMViewSetBoundsAndCenterForFrame(v27, v36, v37, v38, v39);
    }
    v62.origin.x = v35;
    v62.origin.y = v54;
    v62.size.width = v30;
    v62.size.height = v32;
    double v40 = CGRectGetMaxX(v62);
    v63.origin.x = rect.origin.x;
    v63.origin.y = v16;
    v63.size.width = v18;
    v63.size.height = v20;
    double MinX = CGRectGetMinX(v63);
    v64.origin.x = rect.origin.x;
    v64.origin.y = v16;
    v64.size.width = v18;
    v64.size.height = v20;
    double Height = CGRectGetHeight(v64);
    v65.origin.x = v35;
    v65.origin.y = v54;
    v65.size.width = v30;
    v65.size.height = v32;
    double v43 = CGRectGetHeight(v65);
    double Width = v40 - MinX;
    if (Height < v43) {
      double Height = v43;
    }

    _Block_object_dispose(v58, 8);
  }
  else
  {
    double v45 = v14;
    if (v3)
    {
      v46 = [(CAMExpandableMenuButton *)self _headerView];
      objc_msgSend(v46, "frameForAlignmentRect:", v45, v16, v18, v20);
      CAMViewSetBoundsAndCenterForFrame(v46, v47, v48, v49, v50);
    }
    v66.origin.x = v45;
    v66.origin.y = v16;
    v66.size.width = v18;
    v66.size.height = v20;
    double Width = CGRectGetWidth(v66);
    v67.origin.x = v45;
    v67.origin.y = v16;
    v67.size.width = v18;
    v67.size.height = v20;
    double Height = CGRectGetHeight(v67);
  }
  double v51 = Width;
  double v52 = Height;
  result.height = v52;
  result.width = v51;
  return result;
}

- (CGRect)alignmentRectForFrame:(CGRect)a3 expanded:(BOOL)a4
{
  if (a4) {
    p_tappableEdgeInsets = (UIEdgeInsets *)MEMORY[0x263F834E8];
  }
  else {
    p_tappableEdgeInsets = &self->_tappableEdgeInsets;
  }
  double left = p_tappableEdgeInsets->left;
  double v6 = a3.origin.x + left;
  double v7 = a3.origin.y + p_tappableEdgeInsets->top;
  double v8 = a3.size.width - (p_tappableEdgeInsets->right + left);
  double v9 = a3.size.height - (p_tappableEdgeInsets->bottom + p_tappableEdgeInsets->top);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)frameForAlignmentRect:(CGRect)a3 expanded:(BOOL)a4
{
  if (a4) {
    p_tappableEdgeInsets = (UIEdgeInsets *)MEMORY[0x263F834E8];
  }
  else {
    p_tappableEdgeInsets = &self->_tappableEdgeInsets;
  }
  double left = p_tappableEdgeInsets->left;
  double v6 = a3.origin.x - left;
  double v7 = a3.origin.y - p_tappableEdgeInsets->top;
  double v8 = a3.size.width - (-p_tappableEdgeInsets->right - left);
  double v9 = a3.size.height - (-p_tappableEdgeInsets->bottom - p_tappableEdgeInsets->top);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CAMExpandableMenuButton;
  [(CAMExpandableMenuButton *)&v3 layoutSubviews];
  [(CAMExpandableMenuButton *)self _layoutMenuButton:1 expanded:[(CAMExpandableMenuButton *)self isExpanded]];
}

- (CAMExpandableMenuButton)initWithFrame:(CGRect)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return [(CAMExpandableMenuButton *)self initWithLayoutStyle:v5];
}

- (CAMExpandableMenuButton)initWithCoder:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return [(CAMExpandableMenuButton *)self initWithLayoutStyle:v5];
}

- (CGSize)intrinsicContentSize
{
  [(CAMExpandableMenuButton *)self intrinsicContentSizeForExpansion:self->_expanded];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)collapsedSelectedLabelHorizontalMargin
{
  return 6.0;
}

uint64_t __66__CAMExpandableMenuButton__layoutForPhoneCollapsedPortraitButton___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = [a2 intrinsicContentSize];
  if (v3 >= v5) {
    double v5 = v3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

- (CGSize)_layoutForPhoneCollapsedLandscapeButton:(BOOL)a3
{
  [(CAMExpandableMenuButton *)self bounds];
  -[CAMExpandableMenuButton alignmentRectForFrame:expanded:](self, "alignmentRectForFrame:expanded:", 0);
  if ([(CAMExpandableMenuButton *)self wantsSelectedItemToBeVisible])
  {
    [(UIView *)self->__headerView intrinsicContentSize];
    UIRectCenteredIntegralRectScale();
    CGFloat v75 = v5;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v78 = v10;
    double v11 = [(CAMExpandableMenuButton *)self _selectedLabel];
    [v11 intrinsicContentSize];
    UIRectCenteredIntegralRectScale();
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    v84.origin.x = v7;
    v84.origin.double y = v75;
    v84.size.width = v9;
    v84.size.height = v78;
    v92.origin.double y = CGRectGetMaxY(v84) + 2.0;
    v85.origin.x = v7;
    v85.origin.double y = v75;
    v85.size.width = v9;
    v85.size.height = v78;
    double v69 = v13;
    double v70 = v15;
    v92.origin.x = v13;
    v92.size.width = v15;
    v92.size.height = v17;
    double v18 = v7;
    double v19 = v9;
    CGRectUnion(v85, v92);
    UIRectCenteredIntegralRectScale();
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    memset(&slice, 0, sizeof(slice));
    memset(&remainder, 0, sizeof(remainder));
    v86.origin.x = v18;
    v86.origin.double y = v75;
    v86.size.height = v78;
    v86.size.width = v9;
    CGFloat Height = CGRectGetHeight(v86);
    v87.origin.x = v21;
    v87.origin.double y = v23;
    v87.size.width = v25;
    v87.size.height = v27;
    CGRectDivide(v87, &slice, &remainder, Height, CGRectMinYEdge);
    double y = slice.origin.y;
    double v30 = slice.size.height;
    if (a3)
    {
      double v76 = remainder.origin.y;
      double v79 = remainder.size.height;
      double v31 = [(CAMExpandableMenuButton *)self _headerView];
      objc_msgSend(v31, "frameForAlignmentRect:", v18, y, v19, v30);
      double v71 = v33;
      double v72 = v32;
      double v67 = v35;
      double v68 = v34;
      objc_msgSend(v11, "frameForAlignmentRect:", v69, v76, v70, v79);
      double v73 = v27;
      double v74 = v25;
      double v36 = v19;
      double v38 = v37;
      double v39 = v18;
      double v41 = v40;
      double v77 = v23;
      double v80 = v21;
      double v43 = v42;
      double v45 = v44;
      CAMViewSetBoundsAndCenterForFrame(v31, v72, v71, v68, v67);
      double v46 = v38;
      double v19 = v36;
      double v47 = v41;
      double v18 = v39;
      CGFloat v27 = v73;
      CGFloat v25 = v74;
      double v48 = v43;
      double v49 = v45;
      CGFloat v23 = v77;
      CGFloat v21 = v80;
      CAMViewSetBoundsAndCenterForFrame(v11, v46, v47, v48, v49);
    }
    v88.origin.x = v21;
    v88.origin.double y = v23;
    v88.size.width = v25;
    v88.size.height = v27;
    CGFloat v50 = CGRectGetHeight(v88);
    v89.origin.x = v18;
    v89.origin.double y = y;
    v89.size.width = v19;
    v89.size.height = v30;
    CGFloat Width = CGRectGetWidth(v89);
  }
  else
  {
    [(UIView *)self->__headerView intrinsicContentSize];
    UIRectCenteredIntegralRectScale();
    double v53 = v52;
    double v55 = v54;
    double v57 = v56;
    double v59 = v58;
    if (a3)
    {
      CGRect v60 = [(CAMExpandableMenuButton *)self _headerView];
      objc_msgSend(v60, "frameForAlignmentRect:", v53, v55, v57, v59);
      CAMViewSetBoundsAndCenterForFrame(v60, v61, v62, v63, v64);
    }
    v90.origin.x = v53;
    v90.origin.double y = v55;
    v90.size.width = v57;
    v90.size.height = v59;
    CGFloat v50 = CGRectGetHeight(v90);
    v91.origin.x = v53;
    v91.origin.double y = v55;
    v91.size.width = v57;
    v91.size.height = v59;
    CGFloat Width = CGRectGetWidth(v91);
  }
  double v65 = v50;
  double v66 = Width;
  result.height = v66;
  result.width = v65;
  return result;
}

- (CGSize)_layoutForPhoneExpandedPortraitButton:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v46 = *MEMORY[0x263EF8340];
  [(CAMExpandableMenuButton *)self bounds];
  -[CAMExpandableMenuButton alignmentRectForFrame:expanded:](self, "alignmentRectForFrame:expanded:", 1);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v13 addObject:self->__headerView];
  [v13 addObjectsFromArray:self->__menuItems];
  CGFloat v36 = v12;
  v48.origin.x = v6;
  v48.origin.double y = v8;
  CGFloat v37 = v10;
  v48.size.width = v10;
  v48.size.height = v12;
  CGRectGetWidth(v48);
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v44[3] = 0;
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __65__CAMExpandableMenuButton__layoutForPhoneExpandedPortraitButton___block_invoke;
  v43[3] = &unk_263FA5070;
  v43[4] = v44;
  [v13 enumerateObjectsUsingBlock:v43];
  [v13 count];
  UIRoundToViewScale();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v13;
  uint64_t v14 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v14)
  {
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v40;
    CGFloat v17 = 11.0;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(obj);
        }
        double v19 = *(UIView **)(*((void *)&v39 + 1) + 8 * i);
        [(UIView *)v19 intrinsicContentSize];
        UIRectCenteredIntegralRectScale();
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        if (v3)
        {
          BOOL v26 = [(CAMExpandableMenuButton *)self wantsSelectedItemToBeVisible];
          BOOL v27 = self->_selectedIndex != v15;
          BOOL v28 = self->__headerView == v19;
          aBlock[0] = MEMORY[0x263EF8330];
          if (v28) {
            BOOL v27 = 1;
          }
          aBlock[1] = 3221225472;
          if (v27) {
            BOOL v29 = v28;
          }
          else {
            BOOL v29 = v26;
          }
          aBlock[2] = __65__CAMExpandableMenuButton__layoutForPhoneExpandedPortraitButton___block_invoke_2;
          aBlock[3] = &unk_263FA06F8;
          aBlock[4] = v19;
          *(CGFloat *)&void aBlock[5] = v17;
          *(CGFloat *)&aBlock[6] = v21;
          *(CGFloat *)&aBlock[7] = v23;
          *(CGFloat *)&aBlock[8] = v25;
          double v30 = _Block_copy(aBlock);
          double v31 = v30;
          if (v29) {
            (*((void (**)(void *))v30 + 2))(v30);
          }
          else {
            [MEMORY[0x263F82E00] performWithoutAnimation:v30];
          }
        }
        v49.origin.x = v17;
        v49.origin.double y = v21;
        v49.size.width = v23;
        v49.size.height = v25;
        CGRectGetWidth(v49);
        UIRoundToViewScale();
        CGFloat v17 = v32;
        v15 += [(NSMutableArray *)self->__menuItems containsObject:v19];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v14);
  }

  _Block_object_dispose(v44, 8);
  double v34 = v36;
  double v33 = v37;
  result.height = v34;
  result.width = v33;
  return result;
}

double __65__CAMExpandableMenuButton__layoutForPhoneExpandedPortraitButton___block_invoke(uint64_t a1, void *a2)
{
  [a2 intrinsicContentSize];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

void __65__CAMExpandableMenuButton__layoutForPhoneExpandedPortraitButton___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "frameForAlignmentRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  CGFloat v6 = *(void **)(a1 + 32);
  CAMViewSetBoundsAndCenterForFrame(v6, v2, v3, v4, v5);
}

- (CGSize)_layoutForPhoneExpandedLandscapeButton:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v80 = *MEMORY[0x263EF8340];
  [(CAMExpandableMenuButton *)self bounds];
  -[CAMExpandableMenuButton alignmentRectForFrame:expanded:](self, "alignmentRectForFrame:expanded:", 1);
  CGFloat v66 = v6;
  CGFloat v67 = v5;
  CGFloat v8 = v7;
  CGFloat rect = v9;
  int64_t v10 = [(CAMExpandableMenuButton *)self orientation];
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v11 addObjectsFromArray:self->__menuItems];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expandableMenuDelegate);
  [WeakRetained collapsedFrameForMenuButton:self];
  double v14 = v13;
  double v16 = v15;

  -[CAMExpandableMenuButton alignmentRectForFrame:expanded:](self, "alignmentRectForFrame:expanded:", 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v14, v16);
  [(UIView *)self->__headerView intrinsicContentSize];
  uint64_t v56 = 0;
  UIRectCenteredIntegralRectScale();
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  BOOL v63 = v3;
  if (v3)
  {
    CGFloat v25 = [(CAMExpandableMenuButton *)self _headerView];
    objc_msgSend(v25, "frameForAlignmentRect:", v20, v18, v24, v22);
    double v30 = v29;
    if (v10 == 4)
    {
      double obja = v26;
      v82.origin.double y = v66;
      v82.origin.x = v67;
      CGFloat v60 = v28;
      CGFloat v62 = v27;
      v82.size.width = v8;
      v82.size.height = rect;
      double MaxX = CGRectGetMaxX(v82);
      v83.origin.x = v30;
      v83.origin.double y = obja;
      v83.size.height = v60;
      v83.size.width = v62;
      CGFloat v31 = CGRectGetMaxX(v83);
      double v28 = v60;
      double v27 = v62;
      double v26 = obja;
      double v30 = MaxX - v31;
    }
    CAMViewSetBoundsAndCenterForFrame(v25, v30, v26, v27, v28);
  }
  v84.origin.x = v20;
  v84.origin.double y = v18;
  v84.size.width = v24;
  v84.size.height = v22;
  double v32 = CGRectGetMaxX(v84);
  v85.origin.double y = v66;
  v85.origin.x = v67;
  v85.size.width = v8;
  v85.size.height = rect;
  CGRectGetWidth(v85);
  uint64_t v75 = 0;
  double v76 = (double *)&v75;
  uint64_t v77 = 0x2020000000;
  uint64_t v78 = 0;
  v74[0] = MEMORY[0x263EF8330];
  v74[1] = 3221225472;
  v74[2] = __66__CAMExpandableMenuButton__layoutForPhoneExpandedLandscapeButton___block_invoke;
  v74[3] = &unk_263FA5070;
  v74[4] = &v75;
  [v11 enumerateObjectsUsingBlock:v74];
  uint64_t v61 = [v11 count];
  UIRoundToViewScale();
  double v34 = v33;
  double v59 = v76[3];
  if (v10 == 4)
  {
    v86.origin.double y = v66;
    v86.origin.x = v67;
    v86.size.width = v8;
    v86.size.height = rect;
    double v35 = CGRectGetMaxX(v86) - v32 - v34;
  }
  else
  {
    double v35 = v32 + v33;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v11;
  uint64_t v36 = [obj countByEnumeratingWithState:&v70 objects:v79 count:16];
  if (v36)
  {
    uint64_t v37 = 0;
    uint64_t v38 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v71 != v38) {
          objc_enumerationMutation(obj);
        }
        long long v40 = *(UIView **)(*((void *)&v70 + 1) + 8 * i);
        [(UIView *)v40 intrinsicContentSize];
        uint64_t v57 = 0;
        UIRectCenteredIntegralRectScale();
        CGFloat v45 = v42;
        CGFloat v46 = v43;
        CGFloat v47 = v44;
        if (v10 == 4) {
          double v35 = v35 - CGRectGetWidth(*(CGRect *)&v41);
        }
        if (v3)
        {
          BOOL v48 = [(CAMExpandableMenuButton *)self wantsSelectedItemToBeVisible];
          BOOL v49 = self->_selectedIndex != v37;
          BOOL v50 = self->__headerView == v40;
          aBlock[0] = MEMORY[0x263EF8330];
          if (v50) {
            BOOL v49 = 1;
          }
          aBlock[1] = 3221225472;
          if (v49) {
            BOOL v51 = v50;
          }
          else {
            BOOL v51 = v48;
          }
          aBlock[2] = __66__CAMExpandableMenuButton__layoutForPhoneExpandedLandscapeButton___block_invoke_2;
          aBlock[3] = &unk_263FA06F8;
          aBlock[4] = v40;
          *(double *)&void aBlock[5] = v35;
          *(CGFloat *)&aBlock[6] = v45;
          *(CGFloat *)&aBlock[7] = v46;
          *(CGFloat *)&aBlock[8] = v47;
          double v52 = _Block_copy(aBlock);
          double v53 = v52;
          if (v51) {
            (*((void (**)(void *))v52 + 2))(v52);
          }
          else {
            [MEMORY[0x263F82E00] performWithoutAnimation:v52];
          }

          BOOL v3 = v63;
        }
        if (v10 == 4)
        {
          double v35 = v35 - v34;
        }
        else
        {
          v87.origin.x = v35;
          v87.origin.double y = v45;
          v87.size.width = v46;
          v87.size.height = v47;
          double v35 = v35 + v34 + CGRectGetWidth(v87);
        }
        v37 += -[NSMutableArray containsObject:](self->__menuItems, "containsObject:", v40, v57);
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v70 objects:v79 count:16];
    }
    while (v36);
  }

  _Block_object_dispose(&v75, 8);
  double v54 = v59 + v34 * (double)(v61 - 1);
  double v55 = rect;
  result.height = v54;
  result.width = v55;
  return result;
}

double __66__CAMExpandableMenuButton__layoutForPhoneExpandedLandscapeButton___block_invoke(uint64_t a1, void *a2)
{
  [a2 intrinsicContentSize];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

void __66__CAMExpandableMenuButton__layoutForPhoneExpandedLandscapeButton___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "frameForAlignmentRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v6 = *(void **)(a1 + 32);
  CAMViewSetBoundsAndCenterForFrame(v6, v2, v3, v4, v5);
}

- (CGSize)_layoutForPadCollapsedPortraitButton:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v45 = *MEMORY[0x263EF8340];
  [(CAMExpandableMenuButton *)self bounds];
  -[CAMExpandableMenuButton alignmentRectForFrame:expanded:](self, "alignmentRectForFrame:expanded:", 0);
  if (v3) {
    -[UIImageView setFrame:](self->__padBackgroundView, "setFrame:", v5, v6, v7, v8);
  }
  [(UIView *)self->__headerView intrinsicContentSize];
  uint64_t v37 = 0;
  UIRectCenteredIntegralRectScale();
  if (v3)
  {
    double v13 = v9;
    double v14 = v10;
    double v38 = v11;
    double v39 = v12;
    double v15 = [(CAMExpandableMenuButton *)self _headerView];
    objc_msgSend(v15, "frameForAlignmentRect:", v13, v14, v38, v39);
    CAMViewSetBoundsAndCenterForFrame(v15, v16, v17, v18, v19);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  double v20 = self->__menuItems;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v41 != v23) {
          objc_enumerationMutation(v20);
        }
        CGFloat v25 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        objc_msgSend(v25, "intrinsicContentSize", v37);
        uint64_t v37 = 0;
        UIRectCenteredIntegralRectScale();
        if (v3)
        {
          [v25 frameForAlignmentRect:0];
          CAMViewSetBoundsAndCenterForFrame(v25, v26, v27, v28, v29);
        }
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v22);
  }

  double v30 = [(UIImageView *)self->__padBackgroundView image];
  [v30 size];
  double v32 = v31;
  double v34 = v33;

  double v35 = v32;
  double v36 = v34;
  result.height = v36;
  result.width = v35;
  return result;
}

- (CGSize)_layoutForPadExpandedPortraitButton:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v56 = *MEMORY[0x263EF8340];
  [(CAMExpandableMenuButton *)self tappableEdgeInsets];
  double v6 = v5;
  [(CAMExpandableMenuButton *)self bounds];
  -[CAMExpandableMenuButton alignmentRectForFrame:expanded:](self, "alignmentRectForFrame:expanded:", 0);
  if (v3) {
    -[UIImageView setFrame:](self->__padBackgroundView, "setFrame:", v7, v8, v9, v10);
  }
  double v50 = v6;
  double v11 = v6 + 13.0;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  double v12 = self->__menuItems;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v52 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        objc_msgSend(v17, "intrinsicContentSize", v49);
        uint64_t v49 = 0;
        UIRectCenteredIntegralRectScale();
        CGFloat v21 = v18;
        CGFloat v22 = v19;
        CGFloat v23 = v20;
        if (v3)
        {
          objc_msgSend(v17, "frameForAlignmentRect:", v11, v18, v19, v20, 0);
          CAMViewSetBoundsAndCenterForFrame(v17, v24, v25, v26, v27);
        }
        v58.origin.x = v11;
        v58.origin.double y = v21;
        v58.size.width = v22;
        v58.size.height = v23;
        double v11 = CGRectGetMaxX(v58) + 29.0;
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v14);
  }

  [(UIView *)self->__headerView intrinsicContentSize];
  UIRectCenteredIntegralRectScale();
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  [(CAMExpandableMenuButton *)self padHeaderViewContentInsetLeft];
  double v35 = v11 - v34;
  if (v3)
  {
    double v36 = [(CAMExpandableMenuButton *)self _headerView];
    objc_msgSend(v36, "frameForAlignmentRect:", v35, v29, v31, v33);
    CAMViewSetBoundsAndCenterForFrame(v36, v37, v38, v39, v40);
  }
  long long v41 = [(UIImageView *)self->__padBackgroundView image];
  [v41 size];
  double v43 = v42;
  double v45 = v44;
  v59.origin.x = v35;
  v59.origin.double y = v29;
  v59.size.width = v31;
  v59.size.height = v33;
  double MidX = CGRectGetMidX(v59);

  double v47 = MidX + v43 * 0.5 - v50;
  double v48 = v45;
  result.height = v48;
  result.width = v47;
  return result;
}

- (CGSize)_layoutForPadStyle:(BOOL)a3 expanded:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unint64_t v7 = [(CAMExpandableMenuButton *)self orientation] - 3;
  double v8 = *MEMORY[0x263F001B0];
  double v9 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (!v4 || v7 >= 2)
  {
    BOOL v10 = !v4;
    if (!v4 || v7 < 2)
    {
      if (v7 >= 2) {
        BOOL v10 = 0;
      }
      if (!v10 && !v4 && v7 >= 2) {
        -[CAMExpandableMenuButton _layoutForPadCollapsedPortraitButton:](self, "_layoutForPadCollapsedPortraitButton:", v5, v8, v9);
      }
    }
    else
    {
      -[CAMExpandableMenuButton _layoutForPadExpandedPortraitButton:](self, "_layoutForPadExpandedPortraitButton:", v5, v8, v9);
    }
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)_selectedLabel
{
  if ([(CAMExpandableMenuButton *)self selectedIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = (void *)[(NSMutableArray *)self->__menuItems count];
    if (v3)
    {
      BOOL v3 = [(NSMutableArray *)self->__menuItems objectAtIndex:[(CAMExpandableMenuButton *)self selectedIndex]];
    }
  }
  return v3;
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(CAMExpandableMenuButton *)self reloadData];
  }
}

- (void)_createPadBackgroundView
{
  BOOL v3 = (void *)MEMORY[0x263F827E8];
  BOOL v4 = CAMCameraUIFrameworkBundle();
  id v10 = [v3 imageNamed:@"CAMButtonBackgroundPad" inBundle:v4];

  [v10 size];
  unint64_t v7 = objc_msgSend(v10, "resizableImageWithCapInsets:resizingMode:", 1, v5 * 0.5, v6 * 0.5, v5 * 0.5, v6 * 0.5);
  double v8 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v7];
  [(CAMExpandableMenuButton *)self insertSubview:v8 atIndex:0];
  padBackgroundView = self->__padBackgroundView;
  self->__padBackgroundView = v8;
}

+ (double)expansionDuration
{
  return 0.2;
}

- (void)expandMenuAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expandableMenuDelegate);
  [WeakRetained expandMenuButton:self animated:v3];
}

void __62__CAMExpandableMenuButton__applyMenuItemColorsForCurrentState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 472);
  double v5 = (void *)MEMORY[0x263F825C8];
  id v6 = a2;
  if (v4 == a3) {
    [v5 systemYellowColor];
  }
  else {
  id v7 = [v5 whiteColor];
  }
  [v6 setTextColor:v7];
}

void __62__CAMExpandableMenuButton__applyMenuItemColorsForCurrentState__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 504) containsIndex:a3])
  {
    if ([*(id *)(*(void *)(a1 + 32) + 512) containsIndex:a3]
      && *(void *)(*(void *)(a1 + 32) + 472) == a3)
    {
      uint64_t v5 = [MEMORY[0x263F825C8] systemYellowColor];
    }
    else
    {
      uint64_t v5 = [MEMORY[0x263F825C8] whiteColor];
    }
    id v6 = (void *)v5;
    [v7 setTextColor:v5];
  }
}

uint64_t __62__CAMExpandableMenuButton__updateFromExpansionChangeAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  double v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_convertAllSubviewsToProposedFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v36 = *MEMORY[0x263EF8340];
  [(CAMExpandableMenuButton *)self frame];
  double v9 = v8;
  double v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  int64_t v16 = [(CAMExpandableMenuButton *)self orientation];
  if ([(CAMExpandableMenuButton *)self orientation] == 4
    || [(CAMExpandableMenuButton *)self orientation] == 2)
  {
    v37.origin.double x = x;
    v37.origin.double y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    CGFloat rect = height;
    double MaxX = CGRectGetMaxX(v37);
    v38.origin.double x = v9;
    v38.origin.double y = v11;
    v38.size.CGFloat width = v13;
    v38.size.CGFloat height = v15;
    double v30 = MaxX - CGRectGetMaxX(v38);
    v39.origin.double x = x;
    v39.origin.double y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = rect;
    double MaxY = CGRectGetMaxY(v39);
    v40.origin.double x = v9;
    v40.origin.double y = v11;
    v40.size.CGFloat width = v13;
    v40.size.CGFloat height = v15;
    double v19 = MaxY - CGRectGetMaxY(v40);
  }
  else
  {
    double v30 = v9 - x;
    double v19 = v11 - y;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  double v20 = [(CAMExpandableMenuButton *)self subviews];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v32;
    if ((unint64_t)(v16 - 3) >= 2) {
      double v24 = v30;
    }
    else {
      double v24 = v19;
    }
    if ((unint64_t)(v16 - 3) < 2) {
      double v19 = v30;
    }
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v20);
        }
        double v26 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        [v26 frame];
        objc_msgSend(v26, "setFrame:", v24 + v27, v19 + v28);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v22);
  }
}

- (void)finishCollapsingAnimated:(BOOL)a3
{
  if (self->_expanded)
  {
    self->_expanded = 0;
    [(CAMExpandableMenuButton *)self _updateFromExpansionChangeAnimated:a3];
  }
}

- (void)finishExpansionAnimated:(BOOL)a3
{
  if (!self->_expanded)
  {
    self->_expanded = 1;
    [(CAMExpandableMenuButton *)self _updateFromExpansionChangeAnimated:a3];
  }
}

- (void)completeExpansionToProposedFrame:(CGRect)a3
{
}

- (void)setOrientation:(int64_t)a3
{
}

uint64_t __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke(uint64_t a1)
{
  BOOL v3 = *(void **)(a1 + 32);
  double v2 = *(void **)(a1 + 40);
  if (v2) {
    [v2 transform];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  [v3 setTransform:v6];
  uint64_t v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) frame];
  return objc_msgSend(v4, "setFrame:");
}

uint64_t __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  double v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __64__CAMExpandableMenuButton__updateFromOrientationChangeAnimated___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)_handleTouchGesture:(id)a3
{
  id v23 = a3;
  if (![(CAMExpandableMenuButton *)self shouldIgnoreMenuInteraction])
  {
    uint64_t v4 = [(CAMExpandableMenuButton *)self _trackingView];
    [v23 locationInView:self];
    double v6 = v5;
    double v8 = v7;
    uint64_t v9 = [v23 state];
    if (v9 == 1)
    {
      double v10 = -[CAMExpandableMenuButton _viewToTrackForTouchAtLocation:](self, "_viewToTrackForTouchAtLocation:", v6, v8);
      if (v10)
      {
        [(CAMExpandableMenuButton *)self _setTrackingView:v10];
        [(CAMExpandableMenuButton *)self _setTrackingViewHighlighted:1];
        double v11 = [v10 layer];
        +[CAMAnimationHelper animateLayer:v11 forButtonHighlighted:1 layoutStyle:[(CAMExpandableMenuButton *)self layoutStyle]];
      }
    }
    else if (v4)
    {
      uint64_t v12 = v9;
      [v4 frame];
      UIDistanceBetweenPointAndRect();
      double v14 = v13;
      if (v12 == 2)
      {
        if (v13 < 50.0 != [(CAMExpandableMenuButton *)self _isTrackingViewHighlighted])
        {
          -[CAMExpandableMenuButton _setTrackingViewHighlighted:](self, "_setTrackingViewHighlighted:", v14 < 50.0, 50.0);
          CGFloat v15 = [v4 layer];
          +[CAMAnimationHelper animateLayer:v15 forButtonHighlighted:v14 < 50.0 layoutStyle:[(CAMExpandableMenuButton *)self layoutStyle]];
        }
      }
      else
      {
        if (v12 != 4 && v13 < 50.0)
        {
          unint64_t v16 = [(CAMExpandableMenuButton *)self selectedIndex];
          double v17 = [(CAMExpandableMenuButton *)self _menuItems];
          BOOL v18 = [(CAMExpandableMenuButton *)self shouldAllowExpansion];
          if (v18)
          {
            double v19 = [(CAMExpandableMenuButton *)self headerView];

            if (v4 != v19) {
              unint64_t v16 = [v17 indexOfObject:v4];
            }
          }
          else
          {
            unint64_t v16 = (v16 + 1) % [v17 count];
          }
          int64_t v20 = [(CAMExpandableMenuButton *)self selectedIndex];
          [(CAMExpandableMenuButton *)self setSelectedIndex:v16];
          uint64_t v21 = [(CAMExpandableMenuButton *)self expandableMenuDelegate];
          if ([(CAMExpandableMenuButton *)self isExpanded])
          {
            [v21 collapseMenuButton:self animated:1];
          }
          else if (v18)
          {
            [v21 expandMenuButton:self animated:1];
          }
          if (v16 != v20) {
            [(CAMExpandableMenuButton *)self sendActionsForControlEvents:4096];
          }
        }
        if ([(CAMExpandableMenuButton *)self _isTrackingViewHighlighted])
        {
          uint64_t v22 = [v4 layer];
          +[CAMAnimationHelper animateLayer:v22 forButtonHighlighted:0 layoutStyle:[(CAMExpandableMenuButton *)self layoutStyle]];
          [(CAMExpandableMenuButton *)self _setTrackingViewHighlighted:0];
        }
        [(CAMExpandableMenuButton *)self _setTrackingView:0];
      }
    }
  }
}

- (id)_viewToTrackForTouchAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v6 = [(CAMExpandableMenuButton *)self _menuItems];
  double v7 = [(CAMExpandableMenuButton *)self _headerView];
  if ([(CAMExpandableMenuButton *)self isExpanded])
  {
    uint64_t v19 = 0;
    int64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    uint64_t v22 = __Block_byref_object_copy__18;
    id v23 = __Block_byref_object_dispose__18;
    id v24 = 0;
    uint64_t v15 = 0;
    unint64_t v16 = (double *)&v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0x7FEFFFFFFFFFFFFFLL;
    double v8 = [v6 arrayByAddingObject:v7];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __58__CAMExpandableMenuButton__viewToTrackForTouchAtLocation___block_invoke;
    v14[3] = &unk_263FA50E8;
    *(CGFloat *)&v14[6] = x;
    *(CGFloat *)&v14[7] = y;
    v14[4] = &v15;
    void v14[5] = &v19;
    [v8 enumerateObjectsUsingBlock:v14];
    if (v16[3] >= 20.0) {
      id v9 = 0;
    }
    else {
      id v9 = (id)v20[5];
    }

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v10 = [(CAMExpandableMenuButton *)self wantsSelectedItemToBeVisible];
    BOOL v11 = [(CAMExpandableMenuButton *)self _wantsHeaderViewToBeVisible];
    if (!v10 || v11)
    {
      id v12 = v7;
    }
    else
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex"));
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v9 = v12;
  }

  return v9;
}

void __58__CAMExpandableMenuButton__viewToTrackForTouchAtLocation___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  [v13 frame];
  CGFloat x = v15.origin.x;
  CGFloat y = v15.origin.y;
  CGFloat width = v15.size.width;
  CGFloat height = v15.size.height;
  CGFloat MinX = CGRectGetMinX(v15);
  double v9 = *(double *)(a1 + 48);
  double v10 = MinX - v9;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v11 = fmax(v10, v9 - CGRectGetMaxX(v16));
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v11 < *(double *)(v12 + 24))
  {
    *(double *)(v12 + 24) = v11;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (UIEdgeInsets)tappableEdgeInsets
{
  CGFloat top = self->_tappableEdgeInsets.top;
  CGFloat left = self->_tappableEdgeInsets.left;
  CGFloat bottom = self->_tappableEdgeInsets.bottom;
  CGFloat right = self->_tappableEdgeInsets.right;
  unint64_t v7 = [(CAMExpandableMenuButton *)self layoutStyle];
  if (v7 <= 4 && ((1 << v7) & 0x15) != 0 && [(CAMExpandableMenuButton *)self isExpanded])
  {
    CGFloat top = *MEMORY[0x263F834E8];
    CGFloat left = *(double *)(MEMORY[0x263F834E8] + 8);
    CGFloat bottom = *(double *)(MEMORY[0x263F834E8] + 16);
    CGFloat right = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  double v8 = top;
  double v9 = left;
  double v10 = bottom;
  double v11 = right;
  result.CGFloat right = v11;
  result.CGFloat bottom = v10;
  result.CGFloat left = v9;
  result.CGFloat top = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [a3 preferredContentSizeCategory];
  uint64_t v4 = [(CAMExpandableMenuButton *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v6 && ([v5 isEqualToString:v6] & 1) == 0)
  {
    [(CAMExpandableMenuButton *)self invalidateIntrinsicContentSize];
    [(CAMExpandableMenuButton *)self setNeedsLayout];
  }
}

- (int64_t)numberOfMenuItems
{
  return 0;
}

- (id)titleForMenuItemAtIndex:(int64_t)a3
{
  return &stru_26BD78BA0;
}

- (id)headerView
{
  return 0;
}

- (double)padHeaderViewContentInsetLeft
{
  return 0.0;
}

- (BOOL)shouldAllowExpansion
{
  return (unint64_t)[(NSMutableArray *)self->__menuItems count] > 2;
}

- (BOOL)shouldIgnoreMenuInteraction
{
  return 0;
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  [a3 locationOfAccessibilityGestureInView:self];
  uint64_t v4 = -[CAMExpandableMenuButton _viewToTrackForTouchAtLocation:](self, "_viewToTrackForTouchAtLocation:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (objc_class *)MEMORY[0x263F823C0];
    id v6 = v4;
    id v7 = [v5 alloc];
    double v8 = [v6 text];

    double v9 = objc_msgSend(v7, "initWithTitle:image:imageInsets:", v8, 0, *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  }
  else
  {
    double v10 = [(CAMExpandableMenuButton *)self headerView];
    int v11 = [v4 isEqual:v10];

    if (!v11)
    {
      double v9 = 0;
      goto LABEL_15;
    }
    double v8 = [(CAMExpandableMenuButton *)self shownIndexesWhileCollapsed];
    if (objc_msgSend(v8, "containsIndex:", -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex")))
    {
      uint64_t v12 = [(CAMExpandableMenuButton *)self _menuItems];
      id v13 = objc_msgSend(v12, "objectAtIndex:", -[CAMExpandableMenuButton selectedIndex](self, "selectedIndex"));

      double v14 = [v13 text];
    }
    else
    {
      double v14 = 0;
    }
    if ([(CAMExpandableMenuButton *)self conformsToProtocol:&unk_26BE10ED0])
    {
      CGRect v15 = [(CAMExpandableMenuButton *)self imageForAccessibilityHUD];
    }
    else
    {
      CGRect v16 = [(CAMExpandableMenuButton *)self headerView];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v18 = [(CAMExpandableMenuButton *)self headerView];
        CGRect v15 = [v18 image];
      }
      else
      {
        CGRect v15 = 0;
      }
    }
    id v19 = objc_alloc(MEMORY[0x263F823C0]);
    double v9 = objc_msgSend(v19, "initWithTitle:image:imageInsets:scaleImage:", v14, v15, 1, *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  }
LABEL_15:

  return v9;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  id v10 = a3;
  if ([(CAMExpandableMenuButton *)self isExpanded])
  {
    [v10 locationOfAccessibilityGestureInView:self];
    uint64_t v4 = -[CAMExpandableMenuButton _viewToTrackForTouchAtLocation:](self, "_viewToTrackForTouchAtLocation:");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(CAMExpandableMenuButton *)self _menuItems];
      uint64_t v7 = [v6 indexOfObject:v5];

      [(CAMExpandableMenuButton *)self setSelectedIndex:v7];
      [(CAMExpandableMenuButton *)self sendActionsForControlEvents:4096];
    }
    [(CAMExpandableMenuButton *)self collapseMenuAnimated:1];
  }
  else if ([(CAMExpandableMenuButton *)self shouldAllowExpansion])
  {
    [(CAMExpandableMenuButton *)self expandMenuAnimated:1];
  }
  else
  {
    unint64_t v8 = [(CAMExpandableMenuButton *)self selectedIndex] + 1;
    double v9 = [(CAMExpandableMenuButton *)self _menuItems];
    -[CAMExpandableMenuButton setSelectedIndex:](self, "setSelectedIndex:", v8 % [v9 count]);

    [(CAMExpandableMenuButton *)self sendActionsForControlEvents:4096];
  }
}

- (NSMutableArray)_menuItems
{
  return self->__menuItems;
}

- (NSMutableIndexSet)_highlightedIndexesWhileCollapsed
{
  return self->__highlightedIndexesWhileCollapsed;
}

- (UIImageView)_padBackgroundView
{
  return self->__padBackgroundView;
}

- (UIView)_trackingView
{
  return self->__trackingView;
}

- (void)_setTrackingView:(id)a3
{
}

- (BOOL)_isTrackingViewHighlighted
{
  return self->__trackingViewHighlighted;
}

- (void)_setTrackingViewHighlighted:(BOOL)a3
{
  self->__trackingViewHighlighted = a3;
}

- (CAMExpandableMenuButtonDelegate)expandableMenuDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expandableMenuDelegate);
  return (CAMExpandableMenuButtonDelegate *)WeakRetained;
}

- (CAMTouchingGestureRecognizer)touchingGestureRecognizer
{
  return self->_touchingGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchingGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_expandableMenuDelegate);
  objc_storeStrong((id *)&self->__trackingView, 0);
  objc_storeStrong((id *)&self->__padBackgroundView, 0);
  objc_storeStrong((id *)&self->__highlightedIndexesWhileCollapsed, 0);
  objc_storeStrong((id *)&self->__shownIndexesWhileCollapsed, 0);
  objc_storeStrong((id *)&self->__headerView, 0);
  objc_storeStrong((id *)&self->__menuItems, 0);
}

@end