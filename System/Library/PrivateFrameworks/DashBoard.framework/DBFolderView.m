@interface DBFolderView
+ (Class)_scrollViewClass;
+ (double)maximumPageControlHeightForInteractionAffordances:(unint64_t)a3;
+ (unint64_t)countOfAdditionalPagesToKeepVisibleInOneDirection;
- (BOOL)_showsButtons;
- (BOOL)_useParallaxOnPageControl;
- (BOOL)buttonUXEnabled;
- (BOOL)hidesOffscreenCustomPageViews;
- (BOOL)shouldInstallFocusGuides;
- (DBDashboardLayoutEngine)layoutEngine;
- (DBEnvironment)environment;
- (DBFolderView)initWithConfiguration:(id)a3;
- (DBScrollButton)scrollLeftButton;
- (DBScrollButton)scrollRightButton;
- (NSLayoutConstraint)leadingScrollArrowLeadingConstraint;
- (NSLayoutConstraint)trailingScrollArrowTrailingConstraint;
- (UIEdgeInsets)_listViewVerticalInset;
- (UIEdgeInsets)listViewInsets;
- (double)_listViewSideInset;
- (double)_offsetToCenterPageControlInSpaceForPageControl;
- (double)internalDockPageControlVerticalMargin;
- (double)pageControlAreaHeight;
- (id)_newPageControl;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)iconVisibilityHandling;
- (int64_t)orientation;
- (void)_layoutSubviews;
- (void)_scrollButtonPressed:(id)a3;
- (void)_updateIconListFrames;
- (void)_updatePageControlToIndex:(int64_t)a3;
- (void)_updateScrollButtonStatesForIndex:(int64_t)a3;
- (void)setButtonUXEnabled:(BOOL)a3;
- (void)setEnvironment:(id)a3;
- (void)setLayoutEngine:(id)a3;
- (void)setLeadingCustomViewVisibilityProgress:(double)a3;
- (void)setLeadingScrollArrowLeadingConstraint:(id)a3;
- (void)setListViewInsets:(UIEdgeInsets)a3;
- (void)setScrollLeftButton:(id)a3;
- (void)setScrollRightButton:(id)a3;
- (void)setTrailingScrollArrowTrailingConstraint:(id)a3;
@end

@implementation DBFolderView

- (DBFolderView)initWithConfiguration:(id)a3
{
  v35[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)DBFolderView;
  v5 = [(SBRootFolderView *)&v34 initWithConfiguration:v4];
  v6 = v5;
  if (v5)
  {
    v7 = [(SBFolderView *)v5 scalingView];
    uint64_t v8 = +[DBScrollButton buttonWithDirection:0];
    scrollLeftButton = v6->_scrollLeftButton;
    v6->_scrollLeftButton = (DBScrollButton *)v8;

    [(DBScrollButton *)v6->_scrollLeftButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DBScrollButton *)v6->_scrollLeftButton addTarget:v6 action:sel__scrollButtonPressed_ forControlEvents:64];
    [v7 addSubview:v6->_scrollLeftButton];
    uint64_t v10 = +[DBScrollButton buttonWithDirection:1];
    scrollRightButton = v6->_scrollRightButton;
    v6->_scrollRightButton = (DBScrollButton *)v10;

    [(DBScrollButton *)v6->_scrollRightButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DBScrollButton *)v6->_scrollRightButton addTarget:v6 action:sel__scrollButtonPressed_ forControlEvents:64];
    [v7 addSubview:v6->_scrollRightButton];
    [(DBScrollButton *)v6->_scrollLeftButton setHidden:1];
    [(DBScrollButton *)v6->_scrollRightButton setHidden:1];
    v12 = [v4 todayViewController];

    if (v12) {
      double v13 = 0.0;
    }
    else {
      double v13 = 1.0;
    }
    v14 = [(DBFolderView *)v6 scrollLeftButton];
    [v14 setAlpha:v13];

    v15 = [(DBFolderView *)v6 scrollRightButton];
    [v15 setAlpha:v13];

    v16 = [(DBScrollButton *)v6->_scrollLeftButton leadingAnchor];
    v17 = [v7 leadingAnchor];
    uint64_t v18 = [v16 constraintEqualToAnchor:v17 constant:12.0];
    id v33 = v4;
    leadingScrollArrowLeadingConstraint = v6->_leadingScrollArrowLeadingConstraint;
    v6->_leadingScrollArrowLeadingConstraint = (NSLayoutConstraint *)v18;

    v20 = [(DBScrollButton *)v6->_scrollRightButton trailingAnchor];
    v21 = [v7 trailingAnchor];
    uint64_t v22 = [v20 constraintEqualToAnchor:v21 constant:-12.0];
    trailingScrollArrowTrailingConstraint = v6->_trailingScrollArrowTrailingConstraint;
    v6->_trailingScrollArrowTrailingConstraint = (NSLayoutConstraint *)v22;

    v24 = (void *)MEMORY[0x263F08938];
    v35[0] = v6->_leadingScrollArrowLeadingConstraint;
    v35[1] = v6->_trailingScrollArrowTrailingConstraint;
    v25 = [(DBScrollButton *)v6->_scrollLeftButton bottomAnchor];
    v26 = [v7 bottomAnchor];
    v27 = [v25 constraintEqualToAnchor:v26 constant:-8.5];
    v35[2] = v27;
    v28 = [(DBScrollButton *)v6->_scrollRightButton bottomAnchor];
    v29 = [v7 bottomAnchor];
    v30 = [v28 constraintEqualToAnchor:v29 constant:-8.5];
    v35[3] = v30;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:4];
    [v24 activateConstraints:v31];

    id v4 = v33;
  }

  return v6;
}

+ (Class)_scrollViewClass
{
  return (Class)self;
}

+ (double)maximumPageControlHeightForInteractionAffordances:(unint64_t)a3
{
  if ((a3 & 2) == 0) {
    return 28.0;
  }
  id v4 = (void *)MEMORY[0x263F827E8];
  v5 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceIdiom:3];
  v6 = [v4 systemImageNamed:@"chevron.forward" compatibleWithTraitCollection:v5];

  [v6 size];
  [v6 size];
  double v3 = v7 + 28.0;

  return v3;
}

- (void)setEnvironment:(id)a3
{
  p_environment = &self->_environment;
  id v5 = a3;
  objc_storeWeak((id *)p_environment, v5);
  v6 = [v5 environmentConfiguration];

  unint64_t v7 = [v6 interactionAffordances];
  unint64_t v8 = v7 & 2;
  if (self->_buttonUXEnabled != ((v7 >> 1) & 1))
  {
    self->_buttonUXEnabled = (v7 & 2) >> 1;
    [(DBScrollButton *)self->_scrollLeftButton setHidden:v8 == 0];
    [(DBScrollButton *)self->_scrollRightButton setHidden:v8 == 0];
    [(SBRootFolderView *)self setNeedsLayout];
  }
  id v9 = [(SBFolderView *)self pageControl];
  [v9 setShowsButtons:v8 != 0];
}

- (BOOL)shouldInstallFocusGuides
{
  return 0;
}

- (BOOL)hidesOffscreenCustomPageViews
{
  return 0;
}

- (int64_t)orientation
{
  return 1;
}

- (BOOL)_showsButtons
{
  BOOL v3 = [(DBFolderView *)self buttonUXEnabled];
  if (v3) {
    LOBYTE(v3) = [(SBFolderView *)self iconListViewCount] > 1;
  }
  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DBFolderView;
  unint64_t v8 = -[SBRootFolderView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, v7, x, y);
  id v9 = [(SBFolderView *)self scrollView];
  [(SBRootFolderView *)self todayViewVisibilityProgress];
  if (v10 > 0.0 && ([v8 isDescendantOfView:v9] & 1) == 0)
  {
    v11 = [(SBFolderView *)self delegate];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [v11 todayViewController];
      double v13 = [v12 view];

      objc_msgSend(v13, "convertPoint:fromView:", self, x, y);
      if (v13)
      {
        uint64_t v14 = objc_msgSend(v13, "hitTest:withEvent:", v7);
        if (v14)
        {
          id v15 = (id)v14;

          goto LABEL_10;
        }
      }
    }
  }
  id v15 = v8;
LABEL_10:

  return v15;
}

- (void)_layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)DBFolderView;
  [(SBRootFolderView *)&v8 _layoutSubviews];
  [(DBFolderView *)self _listViewVerticalInset];
  double v4 = v3;
  double v6 = v5;
  [(DBFolderView *)self _listViewSideInset];
  -[DBFolderView setListViewInsets:](self, "setListViewInsets:", v4, v7, v6, v7);
}

- (void)_updateIconListFrames
{
  double v3 = [(SBFolderView *)self iconListViews];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__DBFolderView__updateIconListFrames__block_invoke;
  v5[3] = &unk_2649B4F40;
  v5[4] = self;
  [v3 enumerateObjectsUsingBlock:v5];

  v4.receiver = self;
  v4.super_class = (Class)DBFolderView;
  [(SBFolderView *)&v4 _updateIconListFrames];
}

void __37__DBFolderView__updateIconListFrames__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v7 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      double v5 = v7;
    }
    else {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }
  id v6 = v5;

  [*(id *)(a1 + 32) listViewInsets];
  objc_msgSend(v6, "setInsets:");
}

+ (unint64_t)countOfAdditionalPagesToKeepVisibleInOneDirection
{
  return 1;
}

- (int64_t)iconVisibilityHandling
{
  return 0;
}

- (id)_newPageControl
{
  v2 = [DBIconListPageControl alloc];
  id v3 = -[DBIconListPageControl initWithFrame:](v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(UIPageControl *)v3 _setAllowsDiscreteInteraction:1];
  return v3;
}

- (BOOL)_useParallaxOnPageControl
{
  return 0;
}

- (double)_offsetToCenterPageControlInSpaceForPageControl
{
  return 0.0;
}

- (void)_updatePageControlToIndex:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DBFolderView;
  -[SBFolderView _updatePageControlToIndex:](&v5, sel__updatePageControlToIndex_);
  [(DBFolderView *)self _updateScrollButtonStatesForIndex:a3];
}

- (double)internalDockPageControlVerticalMargin
{
  BOOL v2 = [(DBFolderView *)self _showsButtons];
  double result = 6.0;
  if (v2) {
    return 9.0;
  }
  return result;
}

- (double)pageControlAreaHeight
{
  BOOL v2 = [(DBFolderView *)self _showsButtons];
  double result = 28.0;
  if (v2) {
    return 34.0;
  }
  return result;
}

- (void)setLeadingCustomViewVisibilityProgress:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DBFolderView;
  -[SBRootFolderView setLeadingCustomViewVisibilityProgress:](&v10, sel_setLeadingCustomViewVisibilityProgress_);
  if ([(DBFolderView *)self _showsButtons])
  {
    double v5 = fmax(a3 * -2.0 + 1.0, 0.0);
    id v6 = [(DBFolderView *)self scrollLeftButton];
    [v6 setAlpha:v5];

    id v7 = [(DBFolderView *)self scrollRightButton];
    [v7 setAlpha:v5];

    objc_super v8 = [(SBFolderView *)self scalingView];
    [v8 bounds];
    CGFloat v9 = CGRectGetWidth(v11) * a3;

    [(NSLayoutConstraint *)self->_leadingScrollArrowLeadingConstraint setConstant:v9 + 12.0];
    [(NSLayoutConstraint *)self->_trailingScrollArrowTrailingConstraint setConstant:v9 + -12.0];
  }
}

- (double)_listViewSideInset
{
  id v3 = [(SBFolderView *)self listLayoutProvider];
  uint64_t v4 = [(SBFolderView *)self iconLocation];
  double v5 = [v3 layoutForIconLocation:v4];

  [v5 iconImageInfo];
  double v7 = v6;
  objc_super v8 = [(DBFolderView *)self environment];
  CGFloat v9 = [v8 environmentConfiguration];

  objc_super v10 = [(SBFolderView *)self scalingView];
  [v10 bounds];
  double Width = CGRectGetWidth(v21);

  v12 = [(DBFolderView *)self layoutEngine];
  [v12 dualStatusBarTotalHorizontalWidth];
  double v14 = Width - v13;

  unint64_t v15 = [v9 iconColumnCount];
  double v16 = fmax(floor(fmax(v14 - ceil(v7 * (double)v15), 0.0) / (double)(v15 + 1)), 0.0);
  objc_super v17 = [(DBFolderView *)self layoutEngine];
  [v17 folderViewAdditionalHorizontalInset];
  double v19 = v18 + v16;

  return v19;
}

- (UIEdgeInsets)_listViewVerticalInset
{
  id v3 = [(SBFolderView *)self listLayoutProvider];
  uint64_t v4 = [(SBFolderView *)self iconLocation];
  double v5 = [v3 layoutForIconLocation:v4];

  [v5 iconImageInfo];
  double v7 = v6;
  double v9 = v8;
  objc_super v10 = [(DBFolderView *)self environment];
  CGRect v11 = [v10 environmentConfiguration];

  v12 = [(SBFolderView *)self scalingView];
  [v12 bounds];
  double Height = CGRectGetHeight(v32);
  [(DBFolderView *)self pageControlAreaHeight];
  double v15 = Height - v14;

  unint64_t v16 = 2;
  unint64_t v17 = [v11 iconRowCount];
  if (v17 >= 2) {
    unint64_t v16 = v17;
  }
  +[DBIconView maximumIconViewHeightForIconImageSize:](DBIconView, "maximumIconViewHeightForIconImageSize:", v7, v9);
  double v19 = fmax(v15 - ceil(v18 * (double)v16), 0.0);
  double v20 = floor(v19 / (double)(v16 + 1));
  double v21 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v22 = *(double *)(MEMORY[0x263F834E8] + 24);
  if (v20 >= 20.0) {
    double v23 = v20;
  }
  else {
    double v23 = 20.0;
  }
  double v24 = floor((v19 - v23) / (double)v16);
  double v25 = -10.0;
  if (v24 >= 0.0)
  {
    if (v24 >= 5.0 || (double v25 = 0.0, ![(DBFolderView *)self _showsButtons]))
    {
      BOOL v26 = [(DBFolderView *)self _showsButtons];
      double v27 = 0.0;
      if (!v26) {
        double v27 = 0.0 + 10.0;
      }
      if (v24 >= v27) {
        double v25 = v24;
      }
      else {
        double v25 = v27;
      }
    }
  }

  double v28 = v23;
  double v29 = v21;
  double v30 = v25;
  double v31 = v22;
  result.right = v31;
  result.bottom = v30;
  result.left = v29;
  result.top = v28;
  return result;
}

- (void)_updateScrollButtonStatesForIndex:(int64_t)a3
{
  double v5 = [(DBFolderView *)self scrollLeftButton];
  objc_msgSend(v5, "setEnabled:", -[SBFolderView minimumPageIndex](self, "minimumPageIndex") < a3);

  id v6 = [(DBFolderView *)self scrollRightButton];
  objc_msgSend(v6, "setEnabled:", -[SBFolderView maximumPageIndex](self, "maximumPageIndex") > a3);
}

- (void)_scrollButtonPressed:(id)a3
{
  id v9 = a3;
  int64_t v4 = [(SBFolderView *)self currentPageIndex];
  id v5 = [(DBFolderView *)self scrollLeftButton];

  if (v5 == v9)
  {
    uint64_t v7 = -1;
  }
  else
  {
    id v6 = [(DBFolderView *)self scrollRightButton];
    uint64_t v7 = v6 == v9;
  }
  int64_t v8 = v4 + v7;
  [(SBFolderView *)self setCurrentPageIndex:v8 animated:1];
  [(DBFolderView *)self _updateScrollButtonStatesForIndex:v8];
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (DBDashboardLayoutEngine)layoutEngine
{
  return self->_layoutEngine;
}

- (void)setLayoutEngine:(id)a3
{
}

- (BOOL)buttonUXEnabled
{
  return self->_buttonUXEnabled;
}

- (void)setButtonUXEnabled:(BOOL)a3
{
  self->_buttonUXEnabled = a3;
}

- (DBScrollButton)scrollLeftButton
{
  return self->_scrollLeftButton;
}

- (void)setScrollLeftButton:(id)a3
{
}

- (DBScrollButton)scrollRightButton
{
  return self->_scrollRightButton;
}

- (void)setScrollRightButton:(id)a3
{
}

- (UIEdgeInsets)listViewInsets
{
  double top = self->_listViewInsets.top;
  double left = self->_listViewInsets.left;
  double bottom = self->_listViewInsets.bottom;
  double right = self->_listViewInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setListViewInsets:(UIEdgeInsets)a3
{
  self->_listViewInsets = a3;
}

- (NSLayoutConstraint)leadingScrollArrowLeadingConstraint
{
  return self->_leadingScrollArrowLeadingConstraint;
}

- (void)setLeadingScrollArrowLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingScrollArrowTrailingConstraint
{
  return self->_trailingScrollArrowTrailingConstraint;
}

- (void)setTrailingScrollArrowTrailingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingScrollArrowTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingScrollArrowLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_scrollRightButton, 0);
  objc_storeStrong((id *)&self->_scrollLeftButton, 0);
  objc_storeStrong((id *)&self->_layoutEngine, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end