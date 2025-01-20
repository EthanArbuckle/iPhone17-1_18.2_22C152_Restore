@interface CAMExpandingControl
- (BOOL)_needsUpdateMenuButtons;
- (BOOL)_wantsTitleBackground;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isExpanded;
- (BOOL)isLongPressEnabled;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)showsContentShadows;
- (BOOL)supportsOrientations;
- (CAMExpandingControl)initWithFrame:(CGRect)a3;
- (CAMExpandingControlDelegate)delegate;
- (CAMExpandingControlMenuItem)_selectedMenuItem;
- (CGSize)intrinsicContentSize;
- (NSArray)menu;
- (NSMutableArray)_menuButtons;
- (NSValue)selectedState;
- (UIEdgeInsets)expansionInsets;
- (UILongPressGestureRecognizer)_longPress;
- (UIView)_expandedBackground;
- (UIView)_expandedTitleBackground;
- (_CAMExpandingControlButton)_titleView;
- (id)_buttonForHUDManager:(id)a3;
- (id)_createBackgroundWithColor:(id)a3;
- (id)_createMenuButton;
- (id)_hudItemForButton:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)hudItemForAccessibilityHUDManager:(id)a3;
- (int64_t)expansionAnimation;
- (int64_t)orientation;
- (int64_t)titleStyle;
- (unint64_t)backgroundMaterial;
- (unint64_t)controlStatusType;
- (void)_animateExpandedWithAnimations:(id)a3;
- (void)_handleLongPress:(id)a3;
- (void)_handleMenuButtonReleased:(id)a3;
- (void)_setNeedsUpdateMenuButtonsAnimated:(BOOL)a3;
- (void)_setSelectedMenuItem:(id)a3;
- (void)_setTitleBackground:(id)a3;
- (void)_setTitleView:(id)a3;
- (void)_updateExpandedBackgroundsAnimated:(BOOL)a3;
- (void)_updateMenuButtonsAnimated:(BOOL)a3;
- (void)_updateMenuButtonsIfNeededAnimated:(BOOL)a3;
- (void)_updateSelectedMenuItemAnimated:(BOOL)a3;
- (void)_updateTitleViewAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)selectedByAccessibilityHUDManager:(id)a3;
- (void)sendAction:(SEL)a3 to:(id)a4 forEvent:(id)a5;
- (void)setBackgroundMaterial:(unint64_t)a3;
- (void)setControlStatusType:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setExpansionAnimation:(int64_t)a3;
- (void)setExpansionInsets:(UIEdgeInsets)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLongPressEnabled:(BOOL)a3;
- (void)setMenu:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setSelectedState:(id)a3;
- (void)setSelectedState:(id)a3 animated:(BOOL)a4;
- (void)setShowsContentShadows:(BOOL)a3;
- (void)setTitleStyle:(int64_t)a3;
- (void)set_expandedBackground:(id)a3;
@end

@implementation CAMExpandingControl

- (CAMExpandingControl)initWithFrame:(CGRect)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)CAMExpandingControl;
  v3 = -[CAMExpandingControl initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] systemYellowColor];
    [(CAMExpandingControl *)v3 setTintColor:v4];

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    menuButtons = v3->__menuButtons;
    v3->__menuButtons = (NSMutableArray *)v5;

    v3->_orientation = 1;
    v3->_longPressEnabled = 1;
    uint64_t v7 = [objc_alloc(MEMORY[0x263F82938]) initWithTarget:v3 action:sel__handleLongPress_];
    longPress = v3->__longPress;
    v3->__longPress = (UILongPressGestureRecognizer *)v7;

    [(UILongPressGestureRecognizer *)v3->__longPress setDelegate:v3];
    [(CAMExpandingControl *)v3 addGestureRecognizer:v3->__longPress];
    v13[0] = objc_opt_class();
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    id v10 = (id)[(CAMExpandingControl *)v3 registerForTraitChanges:v9 withHandler:&__block_literal_global_23];
  }
  return v3;
}

void __37__CAMExpandingControl_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 _updateTitleViewAnimated:0];
  [v2 setNeedsLayout];
  if ([v2 isExpanded]) {
    [v2 _updateMenuButtonsAnimated:0];
  }
}

- (CGSize)intrinsicContentSize
{
  id v2 = [(CAMExpandingControl *)self _titleView];
  [v2 intrinsicContentSize];
  CEKRectWithSize();
  objc_msgSend(v2, "frameForAlignmentRect:");
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  [(CAMExpandingControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(CAMExpandingControl *)self traitCollection];
  [v7 displayScale];
  uint64_t v81 = v8;

  v9 = [(CAMExpandingControl *)self _titleView];
  id v10 = [(CAMExpandingControl *)self _expandedBackground];
  v11 = [(CAMExpandingControl *)self _expandedTitleBackground];
  BOOL v12 = [(CAMExpandingControl *)self isExpanded];
  if (v12) {
    [(CAMExpandingControl *)self expansionInsets];
  }
  UIRectInset();
  [(CAMExpandingControl *)self intrinsicContentSize];
  CEKSizeScale();
  UISizeRoundToScale();
  double v14 = v13;
  double v16 = fmin(v15, v6);
  int64_t v17 = [(CAMExpandingControl *)self titleStyle];
  if (v17 == 1)
  {
    double v16 = v6;
    double v18 = v4;
  }
  else
  {
    double v18 = v14;
  }
  if (v18 < v16) {
    double v18 = v16;
  }
  if (v10)
  {
    double v19 = v18;
    UIRectCenteredYInRect();
    objc_msgSend(v10, "setFrame:");
    v20 = [v10 layer];
    objc_msgSend(v20, "setCornerRadius:", fmin(v16, 34.0) * 0.5);

    double v18 = v19;
  }
  if (v9)
  {
    CEKRectWithSize();
    double v78 = v22;
    double v79 = v21;
    double v76 = v24;
    double v77 = v23;
    UIRectCenteredIntegralRectScale();
    objc_msgSend(v11, "setBounds:", v79, v78, v77, v76, v81);
    UIRectGetCenter();
    objc_msgSend(v11, "setCenter:");
    v25 = [v11 layer];
    [v25 setCornerRadius:v16 * 0.5];

    [v9 intrinsicContentSize];
    CEKSizeCeilToScale();
    CEKSizeMax();
    CEKRectWithSize();
    objc_msgSend(v9, "setBounds:");
    [v9 bounds];
    UIRectCenteredIntegralRectScale();
    UIRectGetCenter();
    [v9 setCenter:v81];
  }
  v26 = [(CAMExpandingControl *)self _menuButtons];
  v27 = [(CAMExpandingControl *)self menu];
  if (v12)
  {
    uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
    if (v9)
    {
      if (v17 == 1)
      {
        v29 = [(CAMExpandingControl *)self _selectedMenuItem];
        uint64_t v30 = [v27 indexOfObject:v29];

        uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        if (v30 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v31 = (void *)[v26 mutableCopy];
          [v31 setObject:v9 atIndexedSubscript:v30];

          uint64_t v28 = v30;
          v26 = v31;
        }
      }
    }
    v94[0] = MEMORY[0x263EF8330];
    v94[1] = 3221225472;
    v94[2] = __37__CAMExpandingControl_layoutSubviews__block_invoke;
    v94[3] = &__block_descriptor_40_e44_B32__0__CAMExpandingControlMenuItem_8Q16_B24l;
    v94[4] = v28;
    id v32 = [v27 indexesOfObjectsPassingTest:v94];
    if ([v32 count])
    {
      v33 = (void *)[v26 mutableCopy];
      [v33 removeObjectsAtIndexes:v32];

      v26 = v33;
    }
    [v9 frame];
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    [v10 frame];
    v99.origin.x = v35;
    v99.origin.y = v37;
    v99.size.width = v39;
    v99.size.height = v41;
    CGRectGetMaxX(v99);
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v42 = v26;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v90 objects:v97 count:16];
    v75 = v11;
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v91;
      double v46 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v91 != v45) {
            objc_enumerationMutation(v42);
          }
          [*(id *)(*((void *)&v90 + 1) + 8 * i) intrinsicContentSize];
          double v46 = v46 + v48;
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v90 objects:v97 count:16];
      }
      while (v44);
    }

    [v42 count];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v54 = v42;
    uint64_t v55 = [v54 countByEnumeratingWithState:&v86 objects:v96 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v87;
      do
      {
        for (uint64_t j = 0; j != v56; ++j)
        {
          if (*(void *)v87 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = *(void **)(*((void *)&v86 + 1) + 8 * j);
          [v59 intrinsicContentSize];
          CEKSizeCeilToScale();
          CEKSizeMax();
          CEKRectWithSize();
          double v61 = v60;
          double v63 = v62;
          double v65 = v64;
          double v80 = v66;
          UIRectCenteredYInRectScale();
          CGFloat v68 = v67;
          CGFloat v70 = v69;
          CGFloat v72 = v71;
          UIRoundToScale();
          CGFloat v74 = v73;
          UIRectGetCenter();
          [v59 setCenter:v81];
          objc_msgSend(v59, "setBounds:", v61, v63, v65, v80);
          v100.origin.x = v74;
          v100.origin.y = v68;
          v100.size.width = v70;
          v100.size.height = v72;
          CGRectGetMaxX(v100);
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v86 objects:v96 count:16];
      }
      while (v56);
    }

    v11 = v75;
  }
  else
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v32 = v26;
    uint64_t v49 = [v32 countByEnumeratingWithState:&v82 objects:v95 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v83;
      do
      {
        for (uint64_t k = 0; k != v50; ++k)
        {
          if (*(void *)v83 != v51) {
            objc_enumerationMutation(v32);
          }
          v53 = *(void **)(*((void *)&v82 + 1) + 8 * k);
          [v53 intrinsicContentSize];
          CEKSizeCeilToScale();
          CEKRectWithSize();
          objc_msgSend(v53, "setBounds:");
          UIRectCenteredIntegralRectScale();
          UIRectGetCenter();
          [v53 setCenter:v81];
        }
        uint64_t v50 = [v32 countByEnumeratingWithState:&v82 objects:v95 count:16];
      }
      while (v50);
    }
    id v54 = v32;
  }
}

BOOL __37__CAMExpandingControl_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = [a2 _configuration];
  if ([v5 hidden]) {
    BOOL v6 = *(void *)(a1 + 32) != a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(CAMExpandingControl *)self isExpanded])
  {
    uint64_t v8 = [(CAMExpandingControl *)self _expandedBackground];
    -[CAMExpandingControl convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
    unsigned __int8 v9 = objc_msgSend(v8, "pointInside:withEvent:", v7);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CAMExpandingControl;
    unsigned __int8 v9 = -[CAMExpandingControl pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y);
  }

  return v9;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CAMExpandingControl;
  double v5 = -[CAMExpandingControl hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  if ([(CAMExpandingControl *)self isExpanded])
  {
    BOOL v6 = [(CAMExpandingControl *)self titleStyle] != 1;
    if (!v5) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v6 = 1;
    if (!v5) {
      goto LABEL_9;
    }
  }
  id v7 = [(CAMExpandingControl *)self _titleView];
  if (v5 != v7) {
    BOOL v6 = 0;
  }

  if (v6)
  {
    uint64_t v8 = self;

    double v5 = v8;
  }
LABEL_9:
  return v5;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CAMExpandingControl *)self isHighlighted];
  v10.receiver = self;
  v10.super_class = (Class)CAMExpandingControl;
  [(CAMExpandingControl *)&v10 setHighlighted:v3];
  if (v5 != v3)
  {
    [(CAMExpandingControl *)self _updateExpandedBackgroundsAnimated:1];
    if (![(CAMExpandingControl *)self isExpanded] || !v3)
    {
      BOOL v6 = [(CAMExpandingControl *)self _titleView];
      id v7 = [v6 layer];
      +[CAMAnimationHelper setLayer:v7 highlighted:v3 inverted:1 animated:1 layoutStyle:4];

      uint64_t v8 = [(CAMExpandingControl *)self _expandedTitleBackground];
      unsigned __int8 v9 = [v8 layer];
      +[CAMAnimationHelper setLayer:v9 highlighted:v3 inverted:1 animated:1 layoutStyle:4];
    }
  }
}

- (void)sendAction:(SEL)a3 to:(id)a4 forEvent:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [(CAMExpandingControl *)self isExpanded];
  if (!v9) {
    goto LABEL_25;
  }
  if (!v10) {
    goto LABEL_25;
  }
  uint64_t v11 = [v9 touchesForView:self];
  if (!v11) {
    goto LABEL_25;
  }
  BOOL v12 = (void *)v11;
  double v13 = [(CAMExpandingControl *)self _menuButtons];
  double v14 = (void *)[v13 mutableCopy];

  double v15 = [(CAMExpandingControl *)self _titleView];

  if (v15)
  {
    double v16 = [(CAMExpandingControl *)self _titleView];
    [v14 addObject:v16];
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v17 = v12;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (!v18)
  {

    goto LABEL_26;
  }
  uint64_t v19 = v18;
  uint64_t v30 = self;
  v31 = a3;
  id v32 = v8;
  obuint64_t j = v17;
  char v34 = 0;
  uint64_t v35 = *(void *)v42;
  do
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v42 != v35) {
        objc_enumerationMutation(obj);
      }
      double v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v22 = v14;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        v25 = v14;
        uint64_t v26 = *(void *)v38;
        while (2)
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v38 != v26) {
              objc_enumerationMutation(v22);
            }
            uint64_t v28 = *(void **)(*((void *)&v37 + 1) + 8 * j);
            objc_msgSend(v21, "locationInView:", v28, v30, v31, v32);
            v29 = objc_msgSend(v28, "hitTest:withEvent:", v9);

            if (v29)
            {
              char v34 = 1;
              goto LABEL_21;
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v24) {
            continue;
          }
          break;
        }
LABEL_21:
        double v14 = v25;
      }
    }
    uint64_t v19 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  }
  while (v19);

  a3 = v31;
  id v8 = v32;
  self = v30;
  if (v34)
  {
LABEL_25:
    v36.receiver = self;
    v36.super_class = (Class)CAMExpandingControl;
    -[CAMExpandingControl sendAction:to:forEvent:](&v36, sel_sendAction_to_forEvent_, a3, v8, v9, v30, v31, v32);
  }
LABEL_26:
}

- (void)setBackgroundMaterial:(unint64_t)a3
{
  if (self->_backgroundMaterial != a3)
  {
    self->_backgroundMaterial = a3;
    [(CAMExpandingControl *)self _updateExpandedBackgroundsAnimated:0];
  }
}

- (void)setTitleStyle:(int64_t)a3
{
  if (self->_titleStyle != a3)
  {
    self->_titleStyle = a3;
    [(CAMExpandingControl *)self _updateTitleViewAnimated:0];
    [(CAMExpandingControl *)self _updateExpandedBackgroundsAnimated:0];
    [(CAMExpandingControl *)self _setNeedsUpdateMenuButtonsAnimated:0];
    [(CAMExpandingControl *)self setNeedsLayout];
  }
}

- (void)setShowsContentShadows:(BOOL)a3
{
  if (self->_showsContentShadows != a3)
  {
    self->_showsContentShadows = a3;
    [(CAMExpandingControl *)self _updateTitleViewAnimated:0];
    [(CAMExpandingControl *)self _setNeedsUpdateMenuButtonsAnimated:0];
  }
}

- (void)setExpanded:(BOOL)a3
{
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_expanded != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    if (a4)
    {
      if (a3) {
        [(CAMExpandingControl *)self _updateMenuButtonsIfNeededAnimated:0];
      }
      [(CAMExpandingControl *)self _updateExpandedBackgroundsAnimated:0];
      [(CAMExpandingControl *)self layoutIfNeeded];
      id v7 = [(CAMExpandingControl *)self delegate];
      [v7 expandingControl:self willChangeExpanded:v5 animated:1];

      self->_expanded = v5;
      [(CAMExpandingControl *)self setNeedsLayout];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __44__CAMExpandingControl_setExpanded_animated___block_invoke;
      v10[3] = &unk_263FA0208;
      v10[4] = self;
      [(CAMExpandingControl *)self _animateExpandedWithAnimations:v10];
    }
    else
    {
      id v8 = [(CAMExpandingControl *)self delegate];
      [v8 expandingControl:self willChangeExpanded:v5 animated:0];

      self->_expanded = v5;
      [(CAMExpandingControl *)self setNeedsLayout];
    }
    [(CAMExpandingControl *)self _updateMenuButtonsAnimated:v4];
    [(CAMExpandingControl *)self _updateExpandedBackgroundsAnimated:v4];
    [(CAMExpandingControl *)self _updateTitleViewAnimated:v4];
    id v9 = [(CAMExpandingControl *)self delegate];
    [v9 expandingControl:self didChangeExpanded:v5 animated:v4];
  }
}

uint64_t __44__CAMExpandingControl_setExpanded_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_animateExpandedWithAnimations:(id)a3
{
  id v8 = a3;
  int64_t v4 = [(CAMExpandingControl *)self expansionAnimation];
  double v5 = 0.5;
  if (v4 == 1) {
    double v5 = 0.7;
  }
  double v6 = 1.0;
  if (v4 == 1) {
    double v7 = 0.7;
  }
  else {
    double v7 = 1.0;
  }
  if (v4 == 1) {
    double v6 = 2.0;
  }
  [MEMORY[0x263F82E00] animateWithDuration:2 delay:v8 usingSpringWithDamping:0 initialSpringVelocity:v5 options:0.0 animations:v7 completion:v6];
}

- (void)_updateExpandedBackgroundsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CAMExpandingControl *)self _expandedBackground];
  double v6 = [(CAMExpandingControl *)self _expandedTitleBackground];
  BOOL v7 = [(CAMExpandingControl *)self isExpanded];
  unint64_t v8 = [(CAMExpandingControl *)self backgroundMaterial];
  if (v8 == 1)
  {
    id v9 = (void *)MEMORY[0x263F825C8];
    double v11 = 0.0;
    double v10 = 0.5;
  }
  else
  {
    if (v8)
    {
      BOOL v12 = 0;
      if (v5) {
        goto LABEL_6;
      }
LABEL_8:
      double v5 = [(CAMExpandingControl *)self _createBackgroundWithColor:v12];
      [(CAMExpandingControl *)self set_expandedBackground:v5];
      [(CAMExpandingControl *)self insertSubview:v5 atIndex:0];
      goto LABEL_9;
    }
    id v9 = (void *)MEMORY[0x263F825C8];
    double v10 = 0.11;
    double v11 = 1.0;
  }
  BOOL v12 = [v9 colorWithWhite:v11 alpha:v10];
  if (!v5) {
    goto LABEL_8;
  }
LABEL_6:
  [v5 setBackgroundColor:v12];
LABEL_9:
  BOOL v13 = [(CAMExpandingControl *)self _wantsTitleBackground];
  BOOL v14 = v13;
  if (!v6 && v13)
  {
    double v6 = [(CAMExpandingControl *)self _createBackgroundWithColor:v12];
    [(CAMExpandingControl *)self _setTitleBackground:v6];
    [(CAMExpandingControl *)self insertSubview:v6 aboveSubview:v5];
  }
  if (v3) {
    double v15 = 0.5;
  }
  else {
    double v15 = 0.0;
  }
  if (v3 && !v7)
  {
    if ([(CAMExpandingControl *)self isHighlighted]) {
      double v15 = 0.5;
    }
    else {
      double v15 = 0.25;
    }
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __58__CAMExpandingControl__updateExpandedBackgroundsAnimated___block_invoke;
  v19[3] = &unk_263FA37E0;
  BOOL v24 = v7;
  id v20 = v5;
  id v21 = v6;
  BOOL v25 = v14;
  id v22 = self;
  id v23 = v12;
  id v16 = v12;
  id v17 = v6;
  id v18 = v5;
  +[CAMView animateIfNeededWithDuration:2 usingSpringWithDamping:v19 initialSpringVelocity:0 options:v15 animations:1.0 completion:1.0];
}

void __58__CAMExpandingControl__updateExpandedBackgroundsAnimated___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 64);
  [*(id *)(a1 + 32) setAlpha:(double)*(unint64_t *)&a2];
  if (*(unsigned char *)(a1 + 64) || (v4 = [*(id *)(a1 + 48) isHighlighted], double v3 = 0.0, v4))
  {
    LOBYTE(v3) = *(unsigned char *)(a1 + 65);
    double v3 = (double)*(unint64_t *)&v3;
  }
  [*(id *)(a1 + 40) setAlpha:v3];
  if ([*(id *)(a1 + 48) isExpanded])
  {
    id v7 = [MEMORY[0x263F825C8] systemYellowColor];
    [*(id *)(a1 + 40) setBackgroundColor:v7];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    double v6 = *(void **)(a1 + 40);
    [v6 setBackgroundColor:v5];
  }
}

- (BOOL)_wantsTitleBackground
{
  id v2 = self;
  double v3 = [(CAMExpandingControl *)self _selectedMenuItem];
  int v4 = [v3 _configuration];
  uint64_t v5 = [v4 titleBorder];

  LOBYTE(v2) = (v5 | [(CAMExpandingControl *)v2 titleStyle]) == 0;
  return (char)v2;
}

- (id)_createBackgroundWithColor:(id)a3
{
  double v3 = (objc_class *)MEMORY[0x263F82E00];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setBackgroundColor:v4];

  uint64_t v6 = *MEMORY[0x263F15A20];
  id v7 = [v5 layer];
  [v7 setCornerCurve:v6];

  [v5 setUserInteractionEnabled:0];
  return v5;
}

- (void)_updateTitleViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v27 = [(CAMExpandingControl *)self _selectedMenuItem];
  id v5 = [(CAMExpandingControl *)self _titleView];
  BOOL v6 = [(CAMExpandingControl *)self isExpanded];
  objc_opt_class();
  BOOL v26 = v6;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v27 titleText];
    uint64_t v8 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v8 = [v27 titleImage];
    }
    else
    {
      uint64_t v8 = 0;
    }
    uint64_t v7 = 0;
  }
  if (v7 | v8 && !v5)
  {
    id v5 = objc_alloc_init(_CAMExpandingControlButton);
    [(CAMExpandingControl *)self addSubview:v5];
    [(CAMExpandingControl *)self _setTitleView:v5];
  }
  if (v7)
  {
    [(_CAMExpandingControlButton *)v5 setTitleText:v7];
    [(_CAMExpandingControlButton *)v5 setTitleImage:0];
  }
  else if (v8)
  {
    [(_CAMExpandingControlButton *)v5 setTitleImage:v8];
    [(_CAMExpandingControlButton *)v5 setTitleText:0];
  }
  [(_CAMExpandingControlButton *)v5 setAlpha:1.0];
  id v9 = [v27 _configuration];
  int v10 = [v9 tintsTitle];

  double v11 = [v27 _configuration];
  uint64_t v12 = [v11 slashesTitle];

  BOOL v13 = [(CAMExpandingControl *)self _wantsTitleBackground];
  BOOL v14 = [v27 _configuration];
  uint64_t v15 = [v14 titleBorder];

  [(_CAMExpandingControlButton *)v5 setSlashed:v12 animated:v3];
  [(_CAMExpandingControlButton *)v5 setBorder:v15];
  id v16 = [MEMORY[0x263F825C8] labelColor];
  int64_t v17 = [(CAMExpandingControl *)self titleStyle];
  if (v17 == 1)
  {
    if (([(CAMExpandingControl *)self isExpanded] | v10)) {
      [(CAMExpandingControl *)self tintColor];
    }
    else {
    uint64_t v19 = [MEMORY[0x263F825C8] labelColor];
    }
    [(_CAMExpandingControlButton *)v5 setTintColor:v19];
  }
  else
  {
    if (v17) {
      goto LABEL_27;
    }
    if (v26 && v13)
    {
      uint64_t v18 = [MEMORY[0x263F825C8] systemBackgroundColor];
    }
    else
    {
      if (!v10) {
        goto LABEL_27;
      }
      uint64_t v18 = [(CAMExpandingControl *)self tintColor];
    }
    uint64_t v19 = v16;
    id v16 = (void *)v18;
  }

LABEL_27:
  [(_CAMExpandingControlButton *)v5 setTintColor:v16];
  [(_CAMExpandingControlButton *)v5 setOrientation:[(CAMExpandingControl *)self orientation] animated:v3];
  double v20 = *MEMORY[0x263F001B0];
  double v21 = *(double *)(MEMORY[0x263F001B0] + 8);
  id v22 = [(_CAMExpandingControlButton *)v5 layer];
  objc_msgSend(v22, "setShadowOffset:", v20, v21);

  if ([(CAMExpandingControl *)self showsContentShadows]) {
    float v23 = 0.2;
  }
  else {
    float v23 = 0.0;
  }
  BOOL v24 = [(_CAMExpandingControlButton *)v5 layer];
  *(float *)&double v25 = v23;
  [v24 setShadowOpacity:v25];
}

- (void)setSelectedState:(id)a3
{
}

- (void)setSelectedState:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  uint64_t v7 = [(CAMExpandingControl *)self selectedState];
  if (([v7 isEqualToValue:v8] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedState, a3);
    [(CAMExpandingControl *)self _updateSelectedMenuItemAnimated:v4];
  }
}

- (void)setMenu:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToArray:self->_menu] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_menu, a3);
    [(CAMExpandingControl *)self _updateSelectedMenuItemAnimated:0];
    [(CAMExpandingControl *)self _setNeedsUpdateMenuButtonsAnimated:0];
  }
}

- (void)_updateSelectedMenuItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CAMExpandingControl *)self selectedState];
  BOOL v6 = [(CAMExpandingControl *)self menu];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__CAMExpandingControl__updateSelectedMenuItemAnimated___block_invoke;
  v10[3] = &unk_263FA3808;
  id v7 = v5;
  id v11 = v7;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v10];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [v6 objectAtIndexedSubscript:v8];
    [(CAMExpandingControl *)self _setSelectedMenuItem:v9];
    [(CAMExpandingControl *)self _updateTitleViewAnimated:v3];
    [(CAMExpandingControl *)self _setNeedsUpdateMenuButtonsAnimated:v3];
    [(CAMExpandingControl *)self setNeedsLayout];
  }
}

uint64_t __55__CAMExpandingControl__updateSelectedMenuItemAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = [a2 state];
  uint64_t v4 = [v2 isEqualToValue:v3];

  return v4;
}

- (void)_setNeedsUpdateMenuButtonsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  self->__needsUpdateMenuButtons = 1;
  if ([(CAMExpandingControl *)self isExpanded])
  {
    [(CAMExpandingControl *)self _updateMenuButtonsIfNeededAnimated:v3];
  }
}

- (void)_updateMenuButtonsIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CAMExpandingControl *)self _needsUpdateMenuButtons])
  {
    self->__needsUpdateMenuButtons = 0;
    [(CAMExpandingControl *)self _updateMenuButtonsAnimated:v3];
  }
}

- (void)_updateMenuButtonsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = [(CAMExpandingControl *)self _menuButtons];
  BOOL v6 = [(CAMExpandingControl *)self menu];
  BOOL v7 = [(CAMExpandingControl *)self isExpanded];
  while (1)
  {
    unint64_t v8 = [v5 count];
    if (v8 >= [v6 count]) {
      break;
    }
    id v9 = [(CAMExpandingControl *)self _createMenuButton];
    [(CAMExpandingControl *)self addSubview:v9];
    [v5 addObject:v9];
  }
  while (1)
  {
    unint64_t v11 = [v5 count];
    if (v11 <= [v6 count]) {
      break;
    }
    int v10 = [v5 lastObject];
    [v10 removeFromSuperview];

    [v5 removeLastObject];
  }
  uint64_t v12 = [(CAMExpandingControl *)self orientation];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  CAMOrientationTransform(v12, (uint64_t)&v36);
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 1;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __50__CAMExpandingControl__updateMenuButtonsAnimated___block_invoke;
  v23[3] = &unk_263FA3830;
  id v13 = v6;
  id v24 = v13;
  double v25 = self;
  BOOL v30 = v7;
  BOOL v31 = v3;
  BOOL v26 = &v32;
  long long v27 = v36;
  long long v28 = v37;
  long long v29 = v38;
  [v5 enumerateObjectsUsingBlock:v23];
  if (*((unsigned char *)v33 + 24)) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = 1;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = v5;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v19 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "setOrientation:animated:", v14, v3, (void)v19);
      }
      while (v16 != v18);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v19 objects:v39 count:16];
    }
    while (v16);
  }

  _Block_object_dispose(&v32, 8);
}

void __50__CAMExpandingControl__updateMenuButtonsAnimated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  BOOL v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  BOOL v7 = [*(id *)(a1 + 40) _selectedMenuItem];

  if (v6 == v7)
  {
    int v10 = [*(id *)(a1 + 40) tintColor];
    [v5 setTintColor:v10];

    if ([*(id *)(a1 + 40) titleStyle] != 1)
    {
      uint64_t v9 = [v6 selectedSubtitle];
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v8 = [MEMORY[0x263F825C8] labelColor];
    [v5 setTintColor:v8];

    if ([*(id *)(a1 + 40) titleStyle] != 1)
    {
      uint64_t v9 = [v6 subtitle];
LABEL_11:
      uint64_t v12 = (void *)v9;
      unint64_t v11 = 0;
      goto LABEL_14;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v6 titleText];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    unint64_t v11 = [v6 titleImage];
  }
  else
  {
    unint64_t v11 = 0;
  }
  uint64_t v12 = 0;
LABEL_14:
  [v5 setTitleText:v12];
  [v5 setTitleImage:v11];
  uint64_t v13 = [*(id *)(a1 + 40) titleStyle];
  uint64_t v14 = [v6 _configuration];
  char v15 = [v14 hidden];

  uint64_t v16 = *(unsigned __int8 *)(a1 + 104);
  BOOL v17 = *(unsigned char *)(a1 + 104) == 0;
  double v18 = 0.5;
  if (!*(unsigned char *)(a1 + 104)) {
    double v18 = 0.25;
  }
  BOOL v19 = v13 == 1 && v6 == v7;
  if (v19) {
    BOOL v17 = 1;
  }
  char v20 = (v17 | v15) ^ 1;
  BOOL v19 = *(unsigned char *)(a1 + 105) == 0;
  uint64_t v38 = 3221225472;
  uint64_t v37 = MEMORY[0x263EF8330];
  long long v39 = __50__CAMExpandingControl__updateMenuButtonsAnimated___block_invoke_2;
  uint64_t v40 = &unk_263FA02A8;
  if (v19) {
    double v21 = 0.0;
  }
  else {
    double v21 = v18;
  }
  uint64_t v22 = 2 * v16;
  id v41 = v5;
  char v42 = v20;
  id v23 = v5;
  +[CAMView animateIfNeededWithDuration:v22 usingSpringWithDamping:&v37 initialSpringVelocity:0 options:v21 animations:1.0 completion:1.0];
  objc_msgSend(v23, "bounds", v37, v38, v39, v40);
  double v26 = fabs(v24 * *(double *)(a1 + 80) + *(double *)(a1 + 64) * v25);
  [*(id *)(a1 + 40) bounds];
  uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v30 = v26 <= v28 && *(unsigned char *)(v27 + 24) != 0;
  *(unsigned char *)(v27 + 24) = v30;
  double v31 = *MEMORY[0x263F001B0];
  double v32 = *(double *)(MEMORY[0x263F001B0] + 8);
  v33 = [v23 layer];
  objc_msgSend(v33, "setShadowOffset:", v31, v32);

  if ([*(id *)(a1 + 40) showsContentShadows]) {
    float v34 = 0.2;
  }
  else {
    float v34 = 0.0;
  }
  char v35 = [v23 layer];
  *(float *)&double v36 = v34;
  [v35 setShadowOpacity:v36];
}

uint64_t __50__CAMExpandingControl__updateMenuButtonsAnimated___block_invoke_2(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) setAlpha:(double)*(unint64_t *)&a2];
}

- (void)_handleMenuButtonReleased:(id)a3
{
  id v4 = a3;
  [(CAMExpandingControl *)self sendActionsForControlEvents:64];
  id v5 = [(CAMExpandingControl *)self _menuButtons];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v7 = [(CAMExpandingControl *)self menu];
    unint64_t v8 = [v7 objectAtIndexedSubscript:v6];
    uint64_t v9 = [v8 state];
    [(CAMExpandingControl *)self setSelectedState:v9];

    [(CAMExpandingControl *)self sendActionsForControlEvents:4096];
  }
}

- (id)_createMenuButton
{
  BOOL v3 = objc_alloc_init(_CAMExpandingControlButton);
  [(_CAMExpandingControlButton *)v3 addTarget:self action:sel__handleMenuButtonReleased_ forControlEvents:64];
  [(_CAMExpandingControlButton *)v3 setAlpha:(double)[(CAMExpandingControl *)self isExpanded]];
  if ([(CAMExpandingControl *)self orientation] == 2)
  {
    CAMOrientationTransform([(CAMExpandingControl *)self orientation], (uint64_t)v6);
    v5[0] = v6[0];
    v5[1] = v6[1];
    v5[2] = v6[2];
    [(_CAMExpandingControlButton *)v3 setTransform:v5];
  }
  return v3;
}

- (void)_handleLongPress:(id)a3
{
  if ([a3 state] == 1)
  {
    [(CAMExpandingControl *)self sendActionsForControlEvents:0x1000000];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMExpandingControl *)self _longPress];
  if (v5 == v4)
  {
    if ([(CAMExpandingControl *)self isExpanded])
    {
    }
    else
    {
      BOOL v7 = [(CAMExpandingControl *)self isLongPressEnabled];

      if (v7) {
        goto LABEL_3;
      }
    }
    BOOL v6 = 0;
    goto LABEL_8;
  }

LABEL_3:
  BOOL v6 = 1;
LABEL_8:

  return v6;
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    BOOL v4 = a4;
    self->_orientation = a3;
    [(CAMExpandingControl *)self _updateTitleViewAnimated:a4];
    [(CAMExpandingControl *)self _setNeedsUpdateMenuButtonsAnimated:v4];
  }
}

- (BOOL)supportsOrientations
{
  return 1;
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  id v4 = a3;
  if ([(CAMExpandingControl *)self isExpanded]) {
    [(CAMExpandingControl *)self _buttonForHUDManager:v4];
  }
  else {
  id v5 = [(CAMExpandingControl *)self _titleView];
  }
  BOOL v6 = [(CAMExpandingControl *)self _hudItemForButton:v5];

  return v6;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  BOOL v6 = [(CAMExpandingControl *)self _buttonForHUDManager:a3];
  id v4 = [(CAMExpandingControl *)self _titleView];

  id v5 = v6;
  if (v6 == v4) {
    id v5 = self;
  }
  [(CAMExpandingControl *)v5 sendActionsForControlEvents:64];
}

- (id)_buttonForHUDManager:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CAMExpandingControl *)self _menuButtons];
  BOOL v6 = [(CAMExpandingControl *)self _titleView];
  BOOL v7 = [v5 arrayByAddingObject:v6];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  id v9 = (id)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v4, "locationOfAccessibilityGestureInView:", v12, (void)v15);
        uint64_t v13 = objc_msgSend(v12, "hitTest:withEvent:", 0);

        if (v13)
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)_hudItemForButton:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CAMExpandingControl *)self _menuButtons];
    uint64_t v6 = [v5 indexOfObject:v4];

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v7 = [(CAMExpandingControl *)self _selectedMenuItem];
    }
    else
    {
      id v9 = [(CAMExpandingControl *)self menu];
      BOOL v7 = [v9 objectAtIndexedSubscript:v6];
    }
    uint64_t v10 = [v7 _configuration];
    unint64_t v11 = (void *)MEMORY[0x263F81720];
    uint64_t v12 = *MEMORY[0x263F83570];
    uint64_t v13 = [(CAMExpandingControl *)self traitCollection];
    uint64_t v14 = [v11 preferredFontDescriptorWithTextStyle:v12 compatibleWithTraitCollection:v13];
    [v14 pointSize];
    double v16 = v15;

    id v17 = [(CAMExpandingControl *)self _titleView];

    long long v18 = [v10 axHUDSymbolName];
    if (v18)
    {
      if (v17 == v4)
      {
        BOOL v19 = 0;
      }
      else
      {
        BOOL v19 = [v4 titleText];
      }
      id v23 = [v10 axHUDSymbolConfiguration];
      double v24 = [MEMORY[0x263F82818] configurationWithPointSize:v16];
      double v25 = (void *)MEMORY[0x263F827E8];
      double v26 = [v23 configurationByApplyingConfiguration:v24];
      uint64_t v27 = [v25 systemImageNamed:v18 withConfiguration:v26];

      id v28 = objc_alloc(MEMORY[0x263F823C0]);
      id v8 = objc_msgSend(v28, "initWithTitle:image:imageInsets:scaleImage:", v19, v27, 1, *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
    }
    else
    {
      uint64_t v20 = [_CAMExpandingControlButton alloc];
      [v4 bounds];
      CEKRectWithSize();
      BOOL v19 = -[_CAMExpandingControlButton initWithFrame:](v20, "initWithFrame:");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v21 = [MEMORY[0x263F82818] configurationWithPointSize:v16];
        uint64_t v22 = [v7 _imageWithConfiguration:v21];
        [(_CAMExpandingControlButton *)v19 setTitleImage:v22];
      }
      else
      {
        long long v29 = [v4 titleText];
        BOOL v30 = +[CAMFont cameraFontOfSize:v16];
        [(_CAMExpandingControlButton *)v19 setTitleText:v29 font:v30];

        double v21 = [v4 titleImage];
        [(_CAMExpandingControlButton *)v19 setTitleImage:v21];
      }

      -[_CAMExpandingControlButton setSlashed:](v19, "setSlashed:", [v4 isSlashed]);
      [(_CAMExpandingControlButton *)v19 setBorder:0];
      -[_CAMExpandingControlButton setSlashSize:](v19, "setSlashSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
      double v31 = [MEMORY[0x263F825C8] labelColor];
      [(_CAMExpandingControlButton *)v19 setTintColor:v31];

      double v32 = [(_CAMExpandingControlButton *)v19 traitOverrides];
      [v32 setLegibilityWeight:1];

      id v8 = (void *)[objc_alloc(MEMORY[0x263F823C0]) initWithCustomView:v19];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (unint64_t)controlStatusType
{
  return self->_controlStatusType;
}

- (void)setControlStatusType:(unint64_t)a3
{
  self->_controlStatusType = a3;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (CAMExpandingControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMExpandingControlDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)titleStyle
{
  return self->_titleStyle;
}

- (unint64_t)backgroundMaterial
{
  return self->_backgroundMaterial;
}

- (BOOL)showsContentShadows
{
  return self->_showsContentShadows;
}

- (int64_t)expansionAnimation
{
  return self->_expansionAnimation;
}

- (void)setExpansionAnimation:(int64_t)a3
{
  self->_expansionAnimation = a3;
}

- (BOOL)isLongPressEnabled
{
  return self->_longPressEnabled;
}

- (void)setLongPressEnabled:(BOOL)a3
{
  self->_longPressEnabled = a3;
}

- (_CAMExpandingControlButton)_titleView
{
  return self->__titleView;
}

- (void)_setTitleView:(id)a3
{
}

- (UIView)_expandedTitleBackground
{
  return self->__expandedTitleBackground;
}

- (void)_setTitleBackground:(id)a3
{
}

- (CAMExpandingControlMenuItem)_selectedMenuItem
{
  return self->__selectedMenuItem;
}

- (void)_setSelectedMenuItem:(id)a3
{
}

- (NSMutableArray)_menuButtons
{
  return self->__menuButtons;
}

- (BOOL)_needsUpdateMenuButtons
{
  return self->__needsUpdateMenuButtons;
}

- (UIView)_expandedBackground
{
  return self->__expandedBackground;
}

- (void)set_expandedBackground:(id)a3
{
}

- (UILongPressGestureRecognizer)_longPress
{
  return self->__longPress;
}

- (UIEdgeInsets)expansionInsets
{
  double top = self->_expansionInsets.top;
  double left = self->_expansionInsets.left;
  double bottom = self->_expansionInsets.bottom;
  double right = self->_expansionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setExpansionInsets:(UIEdgeInsets)a3
{
  self->_expansionInsets = a3;
}

- (NSArray)menu
{
  return self->_menu;
}

- (NSValue)selectedState
{
  return self->_selectedState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedState, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->__longPress, 0);
  objc_storeStrong((id *)&self->__expandedBackground, 0);
  objc_storeStrong((id *)&self->__menuButtons, 0);
  objc_storeStrong((id *)&self->__selectedMenuItem, 0);
  objc_storeStrong((id *)&self->__expandedTitleBackground, 0);
  objc_storeStrong((id *)&self->__titleView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end