@interface PKPaletteToolPickerView
- (BOOL)_canPresentToolAttributesPopover;
- (BOOL)_canSelectToolView:(id)a3 fromTap:(BOOL)a4;
- (BOOL)_isAllToolsColorUserInterfaceStyleEqualsTo:(int64_t)a3;
- (BOOL)_isAllToolsEdgeLocationEqualsTo:(unint64_t)a3;
- (BOOL)_useCompactSize;
- (BOOL)canToggleSelectedToolAndEraser;
- (BOOL)canToggleSelectedToolAndLastSelectedTool;
- (BOOL)hasToolViewWithIdentifier:(id)a3;
- (BOOL)isScrollingEnabled;
- (BOOL)unselectedToolsVisible;
- (CGRect)sourceRectForPopoverPresentationForTool:(id)a3;
- (NSArray)toolViews;
- (NSHashTable)presentedViewControllers;
- (NSLayoutConstraint)clippingViewBottomConstraint;
- (NSLayoutConstraint)clippingViewLeadingConstraint;
- (NSLayoutConstraint)clippingViewTopConstraint;
- (NSLayoutConstraint)clippingViewTrailingConstraint;
- (NSLayoutConstraint)scrollViewBottomConstraint;
- (NSLayoutConstraint)scrollViewCenterXConstraint;
- (NSLayoutConstraint)scrollViewCenterYConstraint;
- (NSLayoutConstraint)scrollViewHeightConstraint;
- (NSLayoutConstraint)scrollViewLeadingConstraint;
- (NSLayoutConstraint)scrollViewTopConstraint;
- (NSLayoutConstraint)scrollViewTrailingConstraint;
- (NSLayoutConstraint)scrollViewWidthConstraint;
- (NSLayoutConstraint)stackViewCompactHeightConstraint;
- (NSMutableArray)toolsHeightConstraints;
- (NSMutableArray)toolsWidthCompactConstraints;
- (NSMutableArray)toolsWidthConstraints;
- (PKDrawingPaletteStatistics)drawingPaletteStatistics;
- (PKPaletteAttributeViewController)toolAttributesPopover;
- (PKPaletteToolPickerClippingView)clippingView;
- (PKPaletteToolPickerView)init;
- (PKPaletteToolPickerView)initWithToolViews:(id)a3;
- (PKPaletteToolPickerViewDelegate)delegate;
- (PKPaletteToolView)lastSelectedToolView;
- (PKPaletteToolView)selectedToolView;
- (PKPaletteTooltipPresentationHandle)tooltipPresentationHandle;
- (PKScrollViewDelegateEventsHandler)scrollViewDelegateEventsHandler;
- (UIScrollView)scrollView;
- (UIScrollViewDelegate)lastScrollViewDelegateBeforeScrollingToolToVisible;
- (UIStackView)stackView;
- (double)_widthForToolAtIndex:(unint64_t)a3 isCompactSize:(BOOL)a4;
- (double)interItemToolsSpacing;
- (double)scalingFactor;
- (id)_eraserToolView;
- (id)_firstInkingTool;
- (id)sourceViewForPopoverPresentationForTool:(id)a3;
- (int64_t)_stackViewAxis;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)colorUserInterfaceStyle;
- (unint64_t)_selectedToolsCount;
- (unint64_t)cornerLocation;
- (unint64_t)edgeLocation;
- (unint64_t)indexOfSelectedTool;
- (void)_addToolView:(id)a3 updateUI:(BOOL)a4;
- (void)_insertToolView:(id)a3 atIndex:(unint64_t)a4 updateUI:(BOOL)a5;
- (void)_installScrollViewInView:(id)a3;
- (void)_installStackViewInScrollView:(id)a3;
- (void)_setSelectedToolView:(id)a3 animated:(BOOL)a4 showToolTip:(BOOL)a5 notifyDelegate:(BOOL)a6 fromTap:(BOOL)a7;
- (void)_showToolAttributesPopoverFromRect:(CGRect)a3 inView:(id)a4;
- (void)_toolTapGestureRecognizer:(id)a3;
- (void)_updateToolViewVisibilityLayingOutIfNeeded:(BOOL)a3;
- (void)_updateUI;
- (void)addToolView:(id)a3;
- (void)dealloc;
- (void)dismissPalettePopoverWithCompletion:(id)a3;
- (void)insertToolView:(id)a3 atIndex:(unint64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reloadToolViewsWithDataSource:(id)a3;
- (void)removeToolView:(id)a3;
- (void)removeToolView:(id)a3 updateUI:(BOOL)a4;
- (void)removeToolViewsWithIdentifier:(id)a3;
- (void)scrollSelectedToolViewToVisibleAnimated:(BOOL)a3;
- (void)scrollToolViewAtIndex:(unint64_t)a3 toVisibleAnimated:(BOOL)a4;
- (void)selectToolViewAtIndex:(unint64_t)a3;
- (void)setClippingView:(id)a3;
- (void)setClippingViewBottomConstraint:(id)a3;
- (void)setClippingViewLeadingConstraint:(id)a3;
- (void)setClippingViewTopConstraint:(id)a3;
- (void)setClippingViewTrailingConstraint:(id)a3;
- (void)setColorUserInterfaceStyle:(int64_t)a3;
- (void)setCornerLocation:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDrawingPaletteStatistics:(id)a3;
- (void)setEdgeLocation:(unint64_t)a3;
- (void)setInterItemToolsSpacing:(double)a3;
- (void)setLastScrollViewDelegateBeforeScrollingToolToVisible:(id)a3;
- (void)setLastSelectedToolView:(id)a3;
- (void)setPresentedViewControllers:(id)a3;
- (void)setScalingFactor:(double)a3;
- (void)setScrollView:(id)a3;
- (void)setScrollViewBottomConstraint:(id)a3;
- (void)setScrollViewCenterXConstraint:(id)a3;
- (void)setScrollViewCenterYConstraint:(id)a3;
- (void)setScrollViewDelegateEventsHandler:(id)a3;
- (void)setScrollViewHeightConstraint:(id)a3;
- (void)setScrollViewLeadingConstraint:(id)a3;
- (void)setScrollViewTopConstraint:(id)a3;
- (void)setScrollViewTrailingConstraint:(id)a3;
- (void)setScrollViewWidthConstraint:(id)a3;
- (void)setScrollingEnabled:(BOOL)a3;
- (void)setStackView:(id)a3;
- (void)setStackViewCompactHeightConstraint:(id)a3;
- (void)setToolAttributesPopover:(id)a3;
- (void)setToolsHeightConstraints:(id)a3;
- (void)setToolsWidthCompactConstraints:(id)a3;
- (void)setToolsWidthConstraints:(id)a3;
- (void)setTooltipPresentationHandle:(id)a3;
- (void)setUnselectedToolsVisible:(BOOL)a3;
- (void)toggleSelectedToolAndEraserAnimated:(BOOL)a3;
- (void)toggleSelectedToolAndLastSelectedToolAnimated:(BOOL)a3;
- (void)toggleSelectedToolAttributesPopoverFromRect:(CGRect)a3 inView:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateClippingViewEdgesVisibility;
- (void)updatePopoverUI;
@end

@implementation PKPaletteToolPickerView

- (PKPaletteToolPickerView)init
{
  return [(PKPaletteToolPickerView *)self initWithToolViews:MEMORY[0x1E4F1CBF0]];
}

- (PKPaletteToolPickerView)initWithToolViews:(id)a3
{
  v48[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PKPaletteToolPickerView;
  v5 = [(PKPaletteToolPickerView *)&v46 init];
  if (v5)
  {
    uint64_t v6 = +[PKStatisticsManager sharedStatisticsManager]();
    v7 = (void *)v6;
    if (v6) {
      v8 = *(void **)(v6 + 64);
    }
    else {
      v8 = 0;
    }
    objc_storeStrong((id *)&v5->_drawingPaletteStatistics, v8);

    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    presentedViewControllers = v5->_presentedViewControllers;
    v5->_presentedViewControllers = (NSHashTable *)v9;

    v5->_scalingFactor = 1.0;
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    mutableToolViews = v5->_mutableToolViews;
    v5->_mutableToolViews = (NSMutableArray *)v11;

    v5->_interItemToolsSpacing = 0.0;
    v5->_unselectedToolsVisible = 1;
    v13 = objc_alloc_init(PKPaletteToolPickerClippingView);
    clippingView = v5->_clippingView;
    v5->_clippingView = v13;

    [(PKPaletteToolPickerClippingView *)v5->_clippingView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPaletteToolPickerView *)v5 addSubview:v5->_clippingView];
    v15 = [(PKPaletteToolPickerClippingView *)v5->_clippingView topAnchor];
    v16 = [(PKPaletteToolPickerView *)v5 topAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    [(PKPaletteToolPickerView *)v5 setClippingViewTopConstraint:v17];

    v18 = [(PKPaletteToolPickerClippingView *)v5->_clippingView leadingAnchor];
    v19 = [(PKPaletteToolPickerView *)v5 leadingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [(PKPaletteToolPickerView *)v5 setClippingViewLeadingConstraint:v20];

    v21 = [(PKPaletteToolPickerClippingView *)v5->_clippingView bottomAnchor];
    v22 = [(PKPaletteToolPickerView *)v5 bottomAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [(PKPaletteToolPickerView *)v5 setClippingViewBottomConstraint:v23];

    v24 = [(PKPaletteToolPickerClippingView *)v5->_clippingView trailingAnchor];
    v25 = [(PKPaletteToolPickerView *)v5 trailingAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [(PKPaletteToolPickerView *)v5 setClippingViewTrailingConstraint:v26];

    v27 = (void *)MEMORY[0x1E4F28DC8];
    v28 = [(PKPaletteToolPickerView *)v5 clippingViewTopConstraint];
    v48[0] = v28;
    v29 = [(PKPaletteToolPickerView *)v5 clippingViewLeadingConstraint];
    v48[1] = v29;
    v30 = [(PKPaletteToolPickerView *)v5 clippingViewBottomConstraint];
    v48[2] = v30;
    v31 = [(PKPaletteToolPickerView *)v5 clippingViewTrailingConstraint];
    v48[3] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
    [v27 activateConstraints:v32];

    v33 = v5->_clippingView;
    if (v33) {
      v33 = (PKPaletteToolPickerClippingView *)v33->_contentView;
    }
    v34 = v33;
    [(PKPaletteToolPickerView *)v5 _installScrollViewInView:v34];

    [(PKPaletteToolPickerView *)v5 _installStackViewInScrollView:v5->_scrollView];
    v35 = [(PKPaletteToolPickerView *)v5 scrollView];
    [v35 addObserver:v5 forKeyPath:@"bounds" options:1 context:PKPaletteToolPickerScrollViewObserverContext];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v36 = v4;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v43 != v39) {
            objc_enumerationMutation(v36);
          }
          -[PKPaletteToolPickerView _addToolView:updateUI:](v5, "_addToolView:updateUI:", *(void *)(*((void *)&v42 + 1) + 8 * i), 0, (void)v42);
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v38);
    }

    [(PKPaletteToolPickerView *)v5 _updateUI];
  }

  return v5;
}

- (void)dealloc
{
  v3 = [(PKPaletteToolPickerView *)self scrollView];
  [v3 removeObserver:self forKeyPath:@"bounds" context:PKPaletteToolPickerScrollViewObserverContext];

  v4.receiver = self;
  v4.super_class = (Class)PKPaletteToolPickerView;
  [(PKPaletteToolPickerView *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)PKPaletteToolPickerScrollViewObserverContext != a6) {
    goto LABEL_6;
  }
  id v13 = [(PKPaletteToolPickerView *)self scrollView];
  if (v13 != v11)
  {

LABEL_6:
    v15.receiver = self;
    v15.super_class = (Class)PKPaletteToolPickerView;
    [(PKPaletteToolPickerView *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_7;
  }
  int v14 = [v10 isEqualToString:@"bounds"];

  if (!v14) {
    goto LABEL_6;
  }
  [(PKPaletteToolPickerView *)self updateClippingViewEdgesVisibility];
LABEL_7:
}

- (NSArray)toolViews
{
  v2 = (void *)[(NSMutableArray *)self->_mutableToolViews copy];

  return (NSArray *)v2;
}

- (id)_firstInkingTool
{
  uint64_t v3 = [(NSMutableArray *)self->_mutableToolViews indexOfObjectPassingTest:&__block_literal_global_98];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v4 = 0;
  }
  else
  {
    objc_super v4 = [(NSMutableArray *)self->_mutableToolViews objectAtIndexedSubscript:v3];
  }

  return v4;
}

uint64_t __43__PKPaletteToolPickerView__firstInkingTool__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 tool];
  if ([v3 isInkingTool])
  {
    objc_super v4 = [v2 tool];
    uint64_t v5 = [v4 isHandwritingTool] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_installScrollViewInView:(id)a3
{
  v43[4] = *MEMORY[0x1E4F143B8];
  objc_super v4 = (objc_class *)MEMORY[0x1E4FB1BE0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [(PKPaletteToolPickerView *)self setScrollView:v6];

  v7 = [(PKPaletteToolPickerView *)self scrollView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(PKPaletteToolPickerView *)self scrollView];
  [v8 setShowsVerticalScrollIndicator:0];

  uint64_t v9 = [(PKPaletteToolPickerView *)self scrollView];
  [v9 setShowsHorizontalScrollIndicator:0];

  id v10 = [(PKPaletteToolPickerView *)self scrollView];
  [v10 setPagingEnabled:0];

  id v11 = [(PKPaletteToolPickerView *)self scrollView];
  [v11 setClipsToBounds:0];

  id v12 = [(PKPaletteToolPickerView *)self scrollView];
  [v5 addSubview:v12];

  id v13 = [(PKPaletteToolPickerView *)self scrollView];
  int v14 = [v13 topAnchor];
  objc_super v15 = [v5 topAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  [(PKPaletteToolPickerView *)self setScrollViewTopConstraint:v16];

  v17 = [(PKPaletteToolPickerView *)self scrollView];
  v18 = [v17 leadingAnchor];
  v19 = [v5 leadingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  [(PKPaletteToolPickerView *)self setScrollViewLeadingConstraint:v20];

  v21 = [(PKPaletteToolPickerView *)self scrollView];
  v22 = [v21 bottomAnchor];
  v23 = [v5 bottomAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  [(PKPaletteToolPickerView *)self setScrollViewBottomConstraint:v24];

  v25 = [(PKPaletteToolPickerView *)self scrollView];
  v26 = [v25 trailingAnchor];
  v27 = [v5 trailingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  [(PKPaletteToolPickerView *)self setScrollViewTrailingConstraint:v28];

  v29 = [(PKPaletteToolPickerView *)self scrollView];
  v30 = [v29 centerXAnchor];
  v31 = [v5 centerXAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  [(PKPaletteToolPickerView *)self setScrollViewCenterXConstraint:v32];

  v33 = [(PKPaletteToolPickerView *)self scrollView];
  v34 = [v33 centerYAnchor];
  v35 = [v5 centerYAnchor];

  id v36 = [v34 constraintEqualToAnchor:v35];
  [(PKPaletteToolPickerView *)self setScrollViewCenterYConstraint:v36];

  uint64_t v37 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v38 = [(PKPaletteToolPickerView *)self scrollViewTopConstraint];
  v43[0] = v38;
  uint64_t v39 = [(PKPaletteToolPickerView *)self scrollViewLeadingConstraint];
  v43[1] = v39;
  v40 = [(PKPaletteToolPickerView *)self scrollViewBottomConstraint];
  v43[2] = v40;
  v41 = [(PKPaletteToolPickerView *)self scrollViewTrailingConstraint];
  v43[3] = v41;
  long long v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
  [v37 activateConstraints:v42];
}

- (void)_installStackViewInScrollView:(id)a3
{
  v43[4] = *MEMORY[0x1E4F143B8];
  objc_super v4 = (objc_class *)MEMORY[0x1E4FB1C60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [(PKPaletteToolPickerView *)self setStackView:v6];

  v7 = [(PKPaletteToolPickerView *)self stackView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(PKPaletteToolPickerView *)self stackView];
  [v8 setAxis:0];

  uint64_t v9 = [(PKPaletteToolPickerView *)self stackView];
  [v5 addSubview:v9];

  v35 = (void *)MEMORY[0x1E4F28DC8];
  long long v42 = [(PKPaletteToolPickerView *)self stackView];
  v41 = [v42 topAnchor];
  v40 = [v5 topAnchor];
  uint64_t v39 = [v41 constraintEqualToAnchor:v40];
  v43[0] = v39;
  uint64_t v38 = [(PKPaletteToolPickerView *)self stackView];
  uint64_t v37 = [v38 bottomAnchor];
  id v36 = [v5 bottomAnchor];
  v34 = [v37 constraintEqualToAnchor:v36];
  v43[1] = v34;
  id v10 = [(PKPaletteToolPickerView *)self stackView];
  id v11 = [v10 leftAnchor];
  id v12 = [v5 leftAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12];
  v43[2] = v13;
  int v14 = [(PKPaletteToolPickerView *)self stackView];
  objc_super v15 = [v14 rightAnchor];
  v16 = [v5 rightAnchor];

  v17 = [v15 constraintEqualToAnchor:v16];
  v43[3] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
  [v35 activateConstraints:v18];

  v19 = [(PKPaletteToolPickerView *)self stackView];
  v20 = [v19 heightAnchor];
  v21 = [(PKPaletteToolPickerView *)self scrollView];
  v22 = [v21 heightAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [(PKPaletteToolPickerView *)self setStackViewCompactHeightConstraint:v23];

  v24 = [(PKPaletteToolPickerView *)self scrollView];
  v25 = [v24 widthAnchor];
  v26 = [(PKPaletteToolPickerView *)self stackView];
  v27 = [v26 widthAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  [(PKPaletteToolPickerView *)self setScrollViewWidthConstraint:v28];

  v29 = [(PKPaletteToolPickerView *)self scrollView];
  v30 = [v29 heightAnchor];
  v31 = [(PKPaletteToolPickerView *)self stackView];
  v32 = [v31 heightAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  [(PKPaletteToolPickerView *)self setScrollViewHeightConstraint:v33];
}

- (void)addToolView:(id)a3
{
}

- (void)_addToolView:(id)a3 updateUI:(BOOL)a4
{
  BOOL v4 = a4;
  mutableToolViews = self->_mutableToolViews;
  id v7 = a3;
  [(PKPaletteToolPickerView *)self _insertToolView:v7 atIndex:[(NSMutableArray *)mutableToolViews count] updateUI:v4];
}

- (void)removeToolView:(id)a3
{
}

- (void)removeToolView:(id)a3 updateUI:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (PKPaletteToolView *)a3;
  v8 = v6;
  if (self->_selectedToolView == v6)
  {
    self->_selectedToolView = 0;

    id v6 = v8;
  }
  if (self->_lastSelectedToolView == v6)
  {
    self->_lastSelectedToolView = 0;

    id v6 = v8;
  }
  [(NSMutableArray *)self->_mutableToolViews removeObject:v6];
  id v7 = [(PKPaletteToolPickerView *)self stackView];
  [v7 removeArrangedSubview:v8];

  [(PKPaletteToolView *)v8 removeFromSuperview];
  if (v4) {
    [(PKPaletteToolPickerView *)self _updateUI];
  }
}

- (void)insertToolView:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)_insertToolView:(id)a3 atIndex:(unint64_t)a4 updateUI:(BOOL)a5
{
  BOOL v5 = a5;
  mutableToolViews = self->_mutableToolViews;
  id v9 = a3;
  [(NSMutableArray *)mutableToolViews insertObject:v9 atIndex:a4];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v10 = [(PKPaletteToolPickerView *)self stackView];
  [v10 insertArrangedSubview:v9 atIndex:a4];

  id v11 = (id)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__toolTapGestureRecognizer_];
  objc_msgSend(v9, "addGestureRecognizer:");

  if (v5) {
    [(PKPaletteToolPickerView *)self _updateUI];
  }
}

- (BOOL)hasToolViewWithIdentifier:(id)a3
{
  id v4 = a3;
  mutableToolViews = self->_mutableToolViews;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__PKPaletteToolPickerView_hasToolViewWithIdentifier___block_invoke;
  v8[3] = &unk_1E64CBA40;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(mutableToolViews) = [(NSMutableArray *)mutableToolViews indexOfObjectPassingTest:v8] != 0x7FFFFFFFFFFFFFFFLL;

  return (char)mutableToolViews;
}

uint64_t __53__PKPaletteToolPickerView_hasToolViewWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 tool];
  id v4 = [v3 toolIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (void)removeToolViewsWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(NSMutableArray *)self->_mutableToolViews copy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PKPaletteToolPickerView_removeToolViewsWithIdentifier___block_invoke;
  v7[3] = &unk_1E64CBA68;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __57__PKPaletteToolPickerView_removeToolViewsWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 tool];
  id v4 = [v3 toolIdentifier];
  int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5) {
    [*(id *)(a1 + 40) removeToolView:v6];
  }
}

- (void)setUnselectedToolsVisible:(BOOL)a3
{
  if (self->_unselectedToolsVisible != a3)
  {
    self->_unselectedToolsVisible = a3;
    [(PKPaletteToolPickerView *)self _updateToolViewVisibilityLayingOutIfNeeded:1];
  }
}

- (void)_updateToolViewVisibilityLayingOutIfNeeded:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__PKPaletteToolPickerView__updateToolViewVisibilityLayingOutIfNeeded___block_invoke;
  v3[3] = &unk_1E64C8030;
  v3[4] = self;
  BOOL v4 = a3;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

void __70__PKPaletteToolPickerView__updateToolViewVisibilityLayingOutIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) indexOfSelectedTool];
  uint64_t v3 = [*(id *)(a1 + 32) toolViews];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__PKPaletteToolPickerView__updateToolViewVisibilityLayingOutIfNeeded___block_invoke_2;
  v4[3] = &unk_1E64CBA90;
  v4[4] = *(void *)(a1 + 32);
  v4[5] = v2;
  [v3 enumerateObjectsUsingBlock:v4];

  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) layoutIfNeeded];
  }
}

uint64_t __70__PKPaletteToolPickerView__updateToolViewVisibilityLayingOutIfNeeded___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v3 = *(void *)(a1 + 40) != a3 && *(unsigned char *)(*(void *)(a1 + 32) + 416) == 0;
  return [a2 setHidden:v3];
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_double scalingFactor = a3;
    [(PKPaletteToolPickerView *)self _updateUI];
  }
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    [(PKPaletteToolPickerView *)self _updateUI];
  }
}

- (void)setCornerLocation:(unint64_t)a3
{
  if (self->_cornerLocation != a3)
  {
    self->_cornerLocation = a3;
    [(PKPaletteToolPickerView *)self _updateUI];
  }
}

- (void)setInterItemToolsSpacing:(double)a3
{
  if (vabdd_f64(self->_interItemToolsSpacing, a3) >= 0.00999999978)
  {
    self->_interItemToolsSpacing = a3;
    [(PKPaletteToolPickerView *)self _updateUI];
  }
}

- (void)_toolTapGestureRecognizer:(id)a3
{
  id v4 = a3;
  int v5 = [v4 view];
  if ([v4 state] == 1)
  {
    id v6 = (void *)MEMORY[0x1E4FB1EB0];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke;
    v29[3] = &unk_1E64C5F60;
    id v30 = v5;
    v31 = self;
    [v6 animateWithDuration:4 delay:v29 usingSpringWithDamping:0 initialSpringVelocity:0.35 options:0.0 animations:0.65 completion:0.0];
    id v7 = v30;
LABEL_3:

    goto LABEL_18;
  }
  if ([v5 isHighlighted])
  {
    id v8 = (void *)MEMORY[0x1E4FB1EB0];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke_2;
    v26[3] = &unk_1E64C5F60;
    id v27 = v5;
    v28 = self;
    [v8 animateWithDuration:4 delay:v26 usingSpringWithDamping:0 initialSpringVelocity:0.35 options:0.0 animations:0.65 completion:0.0];
  }
  if ([v4 state] == 3)
  {
    id v9 = [v5 tool];
    int v10 = [v9 isRulerTool];

    id v11 = [v5 tool];
    int v12 = [v11 isHandwritingTool];

    if (v12 && ([v5 isSelected] & 1) == 0)
    {
      id v13 = [(PKPaletteToolPickerView *)self drawingPaletteStatistics];
      [v13 recordHandwritingToolSelected];
    }
    int v14 = [(PKPaletteToolPickerView *)self selectedToolView];
    if (v14 == v5) {
      char v15 = v10;
    }
    else {
      char v15 = 1;
    }

    if ((v15 & 1) == 0)
    {
      -[PKPaletteToolPickerView _showToolAttributesPopoverFromRect:inView:](self, "_showToolAttributesPopoverFromRect:inView:", 0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
      goto LABEL_18;
    }
    if (!v10)
    {
      [(PKPaletteToolPickerView *)self _setSelectedToolView:v5 animated:1 showToolTip:0 notifyDelegate:1 fromTap:1];
      goto LABEL_18;
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke_3;
    v23[3] = &unk_1E64C5F60;
    id v24 = v5;
    v25 = self;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke_4;
    v20 = &unk_1E64CB5E0;
    id v21 = v24;
    v22 = self;
    +[PKPaletteToolViewAnimation performSelectionAnimations:completion:]((uint64_t)PKPaletteToolViewAnimation, v23, &v17);
    v16 = [(PKPaletteToolPickerView *)self delegate];
    [v16 toolPickerDidToggleRulerTool:self];

    id v7 = v24;
    goto LABEL_3;
  }
LABEL_18:
}

uint64_t __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHighlighted:1];
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 layoutIfNeeded];
}

uint64_t __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setHighlighted:0];
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 layoutIfNeeded];
}

uint64_t __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setSelected:1];
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 layoutIfNeeded];
}

void __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke_4(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke_5;
  v4[3] = &unk_1E64C5F60;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  +[PKPaletteToolViewAnimation performSelectionAnimations:completion:]((uint64_t)PKPaletteToolViewAnimation, v4, 0);
}

uint64_t __53__PKPaletteToolPickerView__toolTapGestureRecognizer___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setSelected:0];
  id v2 = *(void **)(a1 + 40);

  return [v2 layoutIfNeeded];
}

- (unint64_t)indexOfSelectedTool
{
  return [(NSMutableArray *)self->_mutableToolViews indexOfObject:self->_selectedToolView];
}

- (void)selectToolViewAtIndex:(unint64_t)a3
{
  id v4 = [(NSMutableArray *)self->_mutableToolViews objectAtIndex:a3];
  [(PKPaletteToolPickerView *)self _setSelectedToolView:v4 animated:0 showToolTip:0 notifyDelegate:0 fromTap:0];
}

- (void)_setSelectedToolView:(id)a3 animated:(BOOL)a4 showToolTip:(BOOL)a5 notifyDelegate:(BOOL)a6 fromTap:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v43 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  int v12 = (PKPaletteToolView *)a3;
  p_selectedToolView = (id *)&self->_selectedToolView;
  if (self->_selectedToolView != v12)
  {
    if (![(PKPaletteToolPickerView *)self _canSelectToolView:v12 fromTap:v7])
    {
      v20 = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v12;
        _os_log_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_DEFAULT, "Can't select tool: %@", buf, 0xCu);
      }

      id v21 = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (PKPaletteToolView *)*p_selectedToolView;
        *(_DWORD *)buf = 138412290;
        v54 = v22;
        _os_log_impl(&dword_1C44F8000, v21, OS_LOG_TYPE_DEFAULT, "Currently selected tool is: %@", buf, 0xCu);
      }

      v23 = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        lastSelectedToolView = self->_lastSelectedToolView;
        *(_DWORD *)buf = 138412290;
        v54 = lastSelectedToolView;
        _os_log_impl(&dword_1C44F8000, v23, OS_LOG_TYPE_DEFAULT, "Last selected tool is: %@", buf, 0xCu);
      }
      goto LABEL_34;
    }
    p_lastSelectedToolView = &self->_lastSelectedToolView;
    objc_storeStrong((id *)&self->_lastSelectedToolView, *p_selectedToolView);
    long long v51 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v48 = 0u;
    uint64_t v41 = 408;
    int v14 = self->_mutableToolViews;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v49;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v49 != v16) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * v17++), "setSelected:", 0, v41);
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v15);
    }

    objc_storeStrong((id *)&self->_selectedToolView, a3);
    [*p_selectedToolView setSelected:1];
    [(PKPaletteToolPickerView *)self _updateToolViewVisibilityLayingOutIfNeeded:0];
    uint64_t v18 = [(PKPaletteToolPickerView *)self scrollView];
    [*p_selectedToolView frame];
    int v19 = objc_msgSend(v18, "_isRectFullyVisible:");

    if ((!v9 | v19))
    {
      if (((v9 | v19) & 1) == 0) {
        [(PKPaletteToolPickerView *)self scrollSelectedToolViewToVisibleAnimated:0];
      }
    }
    else
    {
      v25 = [(PKPaletteToolPickerView *)self scrollView];
      v26 = [v25 delegate];
      [(PKPaletteToolPickerView *)self setLastScrollViewDelegateBeforeScrollingToolToVisible:v26];

      id v27 = objc_alloc_init(PKScrollViewDelegateEventsHandler);
      [(PKPaletteToolPickerView *)self setScrollViewDelegateEventsHandler:v27];

      v28 = [(PKPaletteToolPickerView *)self scrollViewDelegateEventsHandler];
      v29 = [(PKPaletteToolPickerView *)self scrollView];
      [v29 setDelegate:v28];

      objc_initWeak((id *)buf, self);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __92__PKPaletteToolPickerView__setSelectedToolView_animated_showToolTip_notifyDelegate_fromTap___block_invoke;
      v45[3] = &unk_1E64CBAB8;
      objc_copyWeak(&v46, (id *)buf);
      BOOL v47 = v8;
      id v30 = [(PKPaletteToolPickerView *)self scrollViewDelegateEventsHandler];
      [v30 setScrollViewDidEndScrollingAnimationHandler:v45];

      [(PKPaletteToolPickerView *)self scrollSelectedToolViewToVisibleAnimated:1];
      objc_destroyWeak(&v46);
      objc_destroyWeak((id *)buf);
    }
    if ((v8 & v19) == 1)
    {
      v31 = [(PKPaletteToolPickerView *)self tooltipPresentationHandle];
      BOOL v32 = v31 == 0;

      if (!v32)
      {
        id v33 = *p_selectedToolView;
        v34 = [(PKPaletteToolPickerView *)self tooltipPresentationHandle];
        [v33 showTooltip:v34];
      }
    }
    if (v9)
    {
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __92__PKPaletteToolPickerView__setSelectedToolView_animated_showToolTip_notifyDelegate_fromTap___block_invoke_2;
      v44[3] = &unk_1E64C61C0;
      v44[4] = self;
      +[PKPaletteToolViewAnimation performSelectionAnimations:completion:]((uint64_t)PKPaletteToolViewAnimation, v44, 0);
    }
    v35 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      id v36 = (PKPaletteToolView *)*p_selectedToolView;
      *(_DWORD *)buf = 138412290;
      v54 = v36;
      _os_log_impl(&dword_1C44F8000, v35, OS_LOG_TYPE_DEFAULT, "Did select tool: %@", buf, 0xCu);
    }

    uint64_t v37 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = *p_lastSelectedToolView;
      *(_DWORD *)buf = 138412290;
      v54 = v38;
      _os_log_impl(&dword_1C44F8000, v37, OS_LOG_TYPE_DEFAULT, "Last selected tool is: %@", buf, 0xCu);
    }

    if (v43)
    {
      uint64_t v39 = [*(id *)((char *)&self->super.super.super.isa + v41) indexOfObject:*p_selectedToolView];
      v40 = [(PKPaletteToolPickerView *)self delegate];
      [v40 toolPicker:self didSelectTool:*p_selectedToolView atIndex:v39];
    }
    if (*p_lastSelectedToolView == *p_selectedToolView)
    {
      v23 = os_log_create("com.apple.pencilkit", "PKPalette");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1C44F8000, v23, OS_LOG_TYPE_FAULT, "_lastSelectedToolView == _selectedToolView", buf, 2u);
      }
LABEL_34:
    }
  }
}

void __92__PKPaletteToolPickerView__setSelectedToolView_animated_showToolTip_notifyDelegate_fromTap___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained lastScrollViewDelegateBeforeScrollingToolToVisible];
  uint64_t v3 = [WeakRetained scrollView];
  [v3 setDelegate:v2];

  [WeakRetained setLastScrollViewDelegateBeforeScrollingToolToVisible:0];
  id v4 = [WeakRetained scrollView];
  id v5 = [WeakRetained selectedToolView];
  [v5 frame];
  int v6 = objc_msgSend(v4, "_isRectFullyVisible:");

  if (*(unsigned char *)(a1 + 40))
  {
    if (v6)
    {
      BOOL v7 = [WeakRetained tooltipPresentationHandle];

      if (v7)
      {
        BOOL v8 = [WeakRetained selectedToolView];
        BOOL v9 = [WeakRetained tooltipPresentationHandle];
        [v8 showTooltip:v9];
      }
    }
  }
}

uint64_t __92__PKPaletteToolPickerView__setSelectedToolView_animated_showToolTip_notifyDelegate_fromTap___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)_canSelectToolView:(id)a3 fromTap:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([(NSMutableArray *)self->_mutableToolViews containsObject:v6] & 1) == 0)
  {
    id v11 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v13 = 0;
      _os_log_error_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_ERROR, "tried to select an untracked tool", v13, 2u);
    }

    goto LABEL_7;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
  {
LABEL_7:
    char v10 = 0;
    goto LABEL_8;
  }
  id v9 = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = [v9 toolPicker:self canSelectTool:v6 fromTap:v4];

LABEL_8:
  return v10;
}

- (unint64_t)_selectedToolsCount
{
  id v2 = [(NSMutableArray *)self->_mutableToolViews indexesOfObjectsPassingTest:&__block_literal_global_28_0];
  unint64_t v3 = [v2 count];

  return v3;
}

uint64_t __46__PKPaletteToolPickerView__selectedToolsCount__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [v2 tool];
  if ([v3 isRulerTool]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [v2 isSelected];
  }

  return v4;
}

- (id)_eraserToolView
{
  uint64_t v3 = [(NSMutableArray *)self->_mutableToolViews indexOfObjectPassingTest:&__block_literal_global_30_0];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [(NSMutableArray *)self->_mutableToolViews objectAtIndexedSubscript:v3];
  }

  return v4;
}

uint64_t __42__PKPaletteToolPickerView__eraserToolView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 tool];
  uint64_t v3 = [v2 isErasingTool];

  return v3;
}

- (void)_showToolAttributesPopoverFromRect:(CGRect)a3 inView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  char v10 = [(PKPaletteToolPickerView *)self delegate];
  id v11 = [v10 palettePopoverPresentingController];

  if (!v11) {
    goto LABEL_30;
  }
  int v12 = [(PKPaletteToolView *)self->_selectedToolView attributeViewController];
  [(PKPaletteToolPickerView *)self setToolAttributesPopover:v12];

  id v13 = [(PKPaletteToolView *)self->_selectedToolView tool];
  int v14 = [v13 toolIdentifier];
  uint64_t v15 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
  [v15 setToolIdentifier:v14];

  uint64_t v16 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
  if (!v16) {
    goto LABEL_30;
  }
  uint64_t v17 = (void *)v16;
  id v18 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
  if (!v18)
  {

LABEL_8:
    id v21 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
    [v21 setModalPresentationStyle:7];

    v22 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
    v23 = [v22 popoverPresentationController];
    [v23 setDelegate:self];

    if (v9)
    {
      v62.origin.double x = x;
      v62.origin.double y = y;
      v62.size.double width = width;
      v62.size.double height = height;
      BOOL v24 = !CGRectIsNull(v62);
    }
    else
    {
      BOOL v24 = 0;
    }
    uint64_t v25 = [(PKPaletteToolPickerView *)self edgeLocation];
    uint64_t v26 = [(PKPaletteToolPickerView *)self cornerLocation];
    BOOL v27 = [(PKPaletteToolPickerView *)self _useCompactSize];
    unint64_t v28 = [(PKPaletteToolPickerView *)self cornerLocation];
    if (v24) {
      uint64_t v29 = 0;
    }
    else {
      uint64_t v29 = 2;
    }
    if (!v24 && !v27)
    {
      if (v28 == -1) {
        uint64_t v30 = PKUIPopoverPermittedArrowDirectionsForEdge(v25);
      }
      else {
        uint64_t v30 = PKUIPopoverPermittedArrowDirectionsForCorner(v26);
      }
      uint64_t v29 = v30;
    }
    v31 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
    BOOL v32 = [v31 popoverPresentationController];
    [v32 setPermittedArrowDirections:v29];

    if (v24)
    {
      id v33 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
      v34 = [v33 popoverPresentationController];
      objc_msgSend(v34, "setSourceRect:", x, y, width, height);

      v35 = v9;
    }
    else
    {
      [(PKPaletteToolPickerView *)self sourceRectForPopoverPresentationForTool:self->_selectedToolView];
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      long long v44 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
      long long v45 = [v44 popoverPresentationController];
      objc_msgSend(v45, "setSourceRect:", v37, v39, v41, v43);

      v35 = [(PKPaletteToolPickerView *)self sourceViewForPopoverPresentationForTool:self->_selectedToolView];
    }
    id v46 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
    BOOL v47 = [v46 popoverPresentationController];
    [v47 setSourceView:v35];

    if (!v24) {
    long long v48 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
    }
    long long v49 = [v48 popoverPresentationController];
    [v49 _setShouldDisableInteractionDuringTransitions:0];

    long long v50 = [(PKPaletteToolPickerView *)self delegate];
    long long v51 = [v50 palettePopoverPassthroughViews];
    v52 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
    v53 = [v52 popoverPresentationController];
    [v53 setPassthroughViews:v51];

    v54 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
    uint64_t v55 = [v54 popoverPresentationController];
    [v55 _setIgnoresKeyboardNotifications:1];

    [(PKPaletteToolPickerView *)self updatePopoverUI];
    v56 = [v11 presentedViewController];

    if (!v56)
    {
      v57 = [(PKPaletteToolPickerView *)self presentedViewControllers];
      [v57 removeAllObjects];
    }
    if ([(PKPaletteToolPickerView *)self _canPresentToolAttributesPopover])
    {
      v58 = [(PKPaletteToolPickerView *)self presentedViewControllers];
      v59 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
      [v58 addObject:v59];

      v60 = [(PKPaletteToolPickerView *)self tooltipPresentationHandle];
      [v60 hideFloatingLabel];

      uint64_t v17 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __69__PKPaletteToolPickerView__showToolAttributesPopoverFromRect_inView___block_invoke;
      v61[3] = &unk_1E64C61C0;
      v61[4] = self;
      [v11 presentViewController:v17 animated:1 completion:v61];
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  int v19 = v18;
  if ([v18 isBeingPresented])
  {

LABEL_29:
    goto LABEL_30;
  }
  char v20 = [v19 isBeingDismissed];

  if ((v20 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_30:
}

void __69__PKPaletteToolPickerView__showToolAttributesPopoverFromRect_inView___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) presentedViewControllers];
  id v2 = [*(id *)(a1 + 32) toolAttributesPopover];
  [v3 removeObject:v2];
}

- (BOOL)_canPresentToolAttributesPopover
{
  id v3 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
  if (v3)
  {
    uint64_t v4 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
    if ([v4 isBeingPresented])
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      id v6 = [(PKPaletteToolPickerView *)self delegate];
      if ([v6 shouldPalettePresentPopover])
      {
        BOOL v7 = [(PKPaletteToolPickerView *)self presentedViewControllers];
        char v8 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
        int v5 = [v7 containsObject:v8] ^ 1;
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (CGRect)sourceRectForPopoverPresentationForTool:(id)a3
{
  id v4 = a3;
  if ([(PKPaletteToolPickerView *)self cornerLocation] == -1)
  {
    id WeakRetained = [(PKPaletteToolPickerView *)self scrollView];
    [v4 frame];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    v22 = [(PKPaletteToolPickerView *)self stackView];
    objc_msgSend(WeakRetained, "convertRect:fromView:", v22, v15, v17, v19, v21);
    CGFloat v7 = v23;
    CGFloat v9 = v24;
    CGFloat v11 = v25;
    CGFloat v13 = v26;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "toolPickerViewSourceRectForPopoverPresentation:fromCorner:", self, -[PKPaletteToolPickerView cornerLocation](self, "cornerLocation"));
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
  }

  unint64_t v27 = [(PKPaletteToolPickerView *)self cornerLocation];
  [(PKPaletteToolPickerView *)self cornerLocation];
  if (v27 == -1) {
    double v28 = -5.0;
  }
  else {
    double v28 = 0.0;
  }
  v37.origin.CGFloat x = v7;
  v37.origin.CGFloat y = v9;
  v37.size.CGFloat width = v11;
  v37.size.CGFloat height = v13;
  CGRect v38 = CGRectInset(v37, v28, -5.0);
  CGFloat x = v38.origin.x;
  CGFloat y = v38.origin.y;
  CGFloat width = v38.size.width;
  CGFloat height = v38.size.height;

  double v33 = x;
  double v34 = y;
  double v35 = width;
  double v36 = height;
  result.size.CGFloat height = v36;
  result.size.CGFloat width = v35;
  result.origin.CGFloat y = v34;
  result.origin.CGFloat x = v33;
  return result;
}

- (id)sourceViewForPopoverPresentationForTool:(id)a3
{
  if ([(PKPaletteToolPickerView *)self cornerLocation] == -1)
  {
    int v5 = [(PKPaletteToolPickerView *)self scrollView];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v5 = objc_msgSend(WeakRetained, "toolPickerViewSourceViewForPopoverPresentation:fromCorner:", self, -[PKPaletteToolPickerView cornerLocation](self, "cornerLocation"));
  }

  return v5;
}

- (void)updatePopoverUI
{
  id v4 = [(PKPaletteToolPickerView *)self delegate];
  id v3 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
  [v4 updatePalettePopover:v3];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaletteToolPickerView;
  [(PKPaletteToolPickerView *)&v14 traitCollectionDidChange:v4];
  int v5 = [(PKPaletteToolPickerView *)self traitCollection];
  uint64_t v6 = [v5 verticalSizeClass];
  if (v6 == [v4 verticalSizeClass])
  {
    CGFloat v7 = [(PKPaletteToolPickerView *)self traitCollection];
    uint64_t v8 = [v7 horizontalSizeClass];
    BOOL v9 = v8 != [v4 horizontalSizeClass];
  }
  else
  {
    BOOL v9 = 1;
  }

  double v10 = [(PKPaletteToolPickerView *)self traitCollection];
  uint64_t v11 = [v10 userInterfaceStyle];
  uint64_t v12 = [v4 userInterfaceStyle];

  if (v9 || v11 != v12)
  {
    [(PKPaletteToolPickerView *)self _updateUI];
    [(PKPaletteToolPickerView *)self updatePopoverUI];
    if (v9)
    {
      CGFloat v13 = [(PKPaletteToolPickerView *)self delegate];
      [v13 toolPickerViewDidChangeTraitCollectionSizeClass:self];
    }
  }
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  if (self->_colorUserInterfaceStyle != a3)
  {
    self->_colorUserInterfaceStyle = a3;
    [(PKPaletteToolPickerView *)self _updateUI];
  }
}

- (void)_updateUI
{
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PKPaletteToolPickerView *)self _stackViewAxis];
  id v4 = [(PKPaletteToolPickerView *)self stackView];
  [v4 setAxis:v3];

  [(PKPaletteToolPickerView *)self interItemToolsSpacing];
  double v6 = v5;
  CGFloat v7 = [(PKPaletteToolPickerView *)self stackView];
  [v7 setSpacing:v6];

  BOOL v8 = [(PKPaletteToolPickerView *)self isScrollingEnabled];
  BOOL v9 = [(PKPaletteToolPickerView *)self scrollView];
  [v9 setScrollEnabled:v8];

  BOOL v10 = [(PKPaletteToolPickerView *)self isScrollingEnabled];
  uint64_t v11 = [(PKPaletteToolPickerView *)self clippingView];
  uint64_t v12 = (void *)v11;
  if (v11) {
    CGFloat v13 = *(void **)(v11 + 536);
  }
  else {
    CGFloat v13 = 0;
  }
  id v14 = v13;
  [v14 setClipsToBounds:v10];

  [(PKPaletteToolPickerView *)self scalingFactor];
  double v16 = v15;
  double v17 = [(PKPaletteToolPickerView *)self clippingView];
  [v17 setScalingFactor:v16];

  double v18 = [(PKPaletteToolPickerView *)self clippingViewTopConstraint];
  [v18 setConstant:0.0];

  double v19 = [(PKPaletteToolPickerView *)self clippingViewBottomConstraint];
  [v19 setConstant:0.0];

  double v20 = [(PKPaletteToolPickerView *)self clippingViewLeadingConstraint];
  [v20 setConstant:0.0];

  double v21 = [(PKPaletteToolPickerView *)self clippingViewTrailingConstraint];
  [v21 setConstant:0.0];

  v22 = [(PKPaletteToolPickerView *)self scrollViewTopConstraint];
  [v22 setConstant:0.0];

  double v23 = [(PKPaletteToolPickerView *)self scrollViewBottomConstraint];
  [v23 setConstant:0.0];

  double v24 = [(PKPaletteToolPickerView *)self scrollViewLeadingConstraint];
  [v24 setConstant:0.0];

  double v25 = [(PKPaletteToolPickerView *)self scrollViewTrailingConstraint];
  [v25 setConstant:0.0];

  if ([(PKPaletteToolPickerView *)self _useCompactSize])
  {
    mutableToolViews = self->_mutableToolViews;
    v164[0] = MEMORY[0x1E4F143A8];
    v164[1] = 3221225472;
    v164[2] = __36__PKPaletteToolPickerView__updateUI__block_invoke;
    v164[3] = &unk_1E64CBAE0;
    v164[4] = self;
    [(NSMutableArray *)mutableToolViews enumerateObjectsUsingBlock:v164];
  }
  else
  {
    long long v162 = 0u;
    long long v163 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    unint64_t v27 = self->_mutableToolViews;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v160 objects:v172 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v161;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v161 != v30) {
            objc_enumerationMutation(v27);
          }
          BOOL v32 = *(void **)(*((void *)&v160 + 1) + 8 * i);
          [(PKPaletteToolPickerView *)self scalingFactor];
          objc_msgSend(v32, "setScalingFactor:");
        }
        uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v160 objects:v172 count:16];
      }
      while (v29);
    }
  }
  long long v158 = 0u;
  long long v159 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  double v33 = self->_mutableToolViews;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v156 objects:v171 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v157;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v157 != v36) {
          objc_enumerationMutation(v33);
        }
        CGRect v38 = *(void **)(*((void *)&v156 + 1) + 8 * j);
        objc_msgSend(v38, "setEdgeLocation:", -[PKPaletteToolPickerView edgeLocation](self, "edgeLocation"));
        objc_msgSend(v38, "setColorUserInterfaceStyle:", -[PKPaletteToolPickerView colorUserInterfaceStyle](self, "colorUserInterfaceStyle"));
      }
      uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v156 objects:v171 count:16];
    }
    while (v35);
  }

  double v39 = (void *)MEMORY[0x1E4F28DC8];
  double v40 = [(PKPaletteToolPickerView *)self toolsHeightConstraints];
  [v39 deactivateConstraints:v40];

  double v41 = (void *)MEMORY[0x1E4F28DC8];
  double v42 = [(PKPaletteToolPickerView *)self toolsWidthConstraints];
  [v41 deactivateConstraints:v42];

  double v43 = (void *)MEMORY[0x1E4F28DC8];
  long long v44 = [(PKPaletteToolPickerView *)self toolsWidthCompactConstraints];
  [v43 deactivateConstraints:v44];

  long long v45 = [MEMORY[0x1E4F1CA48] array];
  toolsWidthConstraints = self->_toolsWidthConstraints;
  self->_toolsWidthConstraints = v45;

  BOOL v47 = [MEMORY[0x1E4F1CA48] array];
  toolsHeightConstraints = self->_toolsHeightConstraints;
  self->_toolsHeightConstraints = v47;

  long long v49 = [MEMORY[0x1E4F1CA48] array];
  toolsWidthCompactConstraints = self->_toolsWidthCompactConstraints;
  self->_toolsWidthCompactConstraints = v49;

  if ([(PKPaletteToolPickerView *)self _useCompactSize])
  {
    long long v51 = self->_mutableToolViews;
    v155[0] = MEMORY[0x1E4F143A8];
    v155[1] = 3221225472;
    v155[2] = __36__PKPaletteToolPickerView__updateUI__block_invoke_2;
    v155[3] = &unk_1E64CBAE0;
    v155[4] = self;
    [(NSMutableArray *)v51 enumerateObjectsUsingBlock:v155];
  }
  else
  {
    long long v153 = 0u;
    long long v154 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    v52 = self->_mutableToolViews;
    uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v151 objects:v170 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v152;
      do
      {
        for (uint64_t k = 0; k != v54; ++k)
        {
          if (*(void *)v152 != v55) {
            objc_enumerationMutation(v52);
          }
          v57 = *(void **)(*((void *)&v151 + 1) + 8 * k);
          v58 = [(PKPaletteToolPickerView *)self toolsWidthConstraints];
          v59 = [v57 widthAnchor];
          v60 = [(PKPaletteToolPickerView *)self widthAnchor];
          v61 = [v59 constraintEqualToAnchor:v60];
          [v58 addObject:v61];

          CGRect v62 = [(PKPaletteToolPickerView *)self toolsHeightConstraints];
          v63 = [v57 heightAnchor];
          v64 = [(PKPaletteToolPickerView *)self heightAnchor];
          v65 = [v63 constraintEqualToAnchor:v64];
          [v62 addObject:v65];
        }
        uint64_t v54 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v151 objects:v170 count:16];
      }
      while (v54);
    }
  }
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  v66 = [(PKPaletteToolPickerView *)self toolsWidthConstraints];
  v67 = [(PKPaletteToolPickerView *)self toolsHeightConstraints];
  v68 = [v66 arrayByAddingObjectsFromArray:v67];

  uint64_t v69 = [v68 countByEnumeratingWithState:&v147 objects:v169 count:16];
  if (v69)
  {
    uint64_t v71 = v69;
    uint64_t v72 = *(void *)v148;
    do
    {
      for (uint64_t m = 0; m != v71; ++m)
      {
        if (*(void *)v148 != v72) {
          objc_enumerationMutation(v68);
        }
        LODWORD(v70) = 1148829696;
        [*(id *)(*((void *)&v147 + 1) + 8 * m) setPriority:v70];
      }
      uint64_t v71 = [v68 countByEnumeratingWithState:&v147 objects:v169 count:16];
    }
    while (v71);
  }

  v144 = (void *)MEMORY[0x1E4F28DC8];
  v145 = [(PKPaletteToolPickerView *)self stackViewCompactHeightConstraint];
  v168[0] = v145;
  v74 = [(PKPaletteToolPickerView *)self scrollViewTopConstraint];
  v168[1] = v74;
  v75 = [(PKPaletteToolPickerView *)self scrollViewBottomConstraint];
  v168[2] = v75;
  v76 = [(PKPaletteToolPickerView *)self scrollViewLeadingConstraint];
  v168[3] = v76;
  v77 = [(PKPaletteToolPickerView *)self scrollViewTrailingConstraint];
  v168[4] = v77;
  v78 = [(PKPaletteToolPickerView *)self scrollViewCenterXConstraint];
  v168[5] = v78;
  v79 = [(PKPaletteToolPickerView *)self scrollViewCenterYConstraint];
  v168[6] = v79;
  v80 = [(PKPaletteToolPickerView *)self scrollViewWidthConstraint];
  v168[7] = v80;
  v81 = [(PKPaletteToolPickerView *)self scrollViewHeightConstraint];
  v168[8] = v81;
  v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:v168 count:9];
  [v144 deactivateConstraints:v82];

  if ([(PKPaletteToolPickerView *)self isScrollingEnabled])
  {
    unint64_t v83 = [(PKPaletteToolPickerView *)self edgeLocation];
    BOOL v84 = v83 == 2 || v83 == 8;
    double v85 = 0.0;
    if (v84) {
      double v86 = 0.0;
    }
    else {
      double v86 = 4.0;
    }
    if (v84) {
      double v87 = 4.0;
    }
    else {
      double v87 = 0.0;
    }
    double v88 = 0.0;
  }
  else
  {
    double v85 = *MEMORY[0x1E4FB2848];
    double v88 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v87 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v86 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  v89 = [(PKPaletteToolPickerView *)self scrollView];
  objc_msgSend(v89, "setContentInset:", v85, v88, v87, v86);

  [(PKPaletteToolPickerView *)self _useCompactSize];
  [(PKPaletteToolPickerView *)self scalingFactor];
  double v91 = v90 * 0.0;
  if (![(PKPaletteToolPickerView *)self _useCompactSize])
  {
    v107 = [(PKPaletteToolPickerView *)self stackView];
    objc_msgSend(v107, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
    double v109 = v108;
    double v111 = v110;

    if (PKIsVisionDevice())
    {
      if (PKIsVisionDevice()) {
        double v112 = 534.0;
      }
      else {
        double v112 = 372.0;
      }
    }
    else
    {
      double v112 = 394.0;
    }
    [(PKPaletteToolPickerView *)self scalingFactor];
    double v114 = v112 * v113;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__PKPaletteToolPickerView__updateUI__block_invoke_3;
    aBlock[3] = &unk_1E64C61C0;
    aBlock[4] = self;
    v106 = (void (**)(void))_Block_copy(aBlock);
    unint64_t v115 = [(PKPaletteToolPickerView *)self edgeLocation];
    if (v115 == 8 || v115 == 2)
    {
      v116 = (void *)MEMORY[0x1E4F28DC8];
      v117 = [(PKPaletteToolPickerView *)self toolsWidthConstraints];
      [v116 activateConstraints:v117];

      v118 = [(PKPaletteToolPickerView *)self clippingViewTopConstraint];
      [v118 setConstant:-v91];

      v119 = [(PKPaletteToolPickerView *)self clippingViewBottomConstraint];
      [v119 setConstant:v91];

      v120 = [(PKPaletteToolPickerView *)self scrollViewTopConstraint];
      [v120 setConstant:v91];

      v121 = [(PKPaletteToolPickerView *)self scrollViewBottomConstraint];
      [v121 setConstant:-v91];

      if (v111 < v114)
      {
        v122 = (void *)MEMORY[0x1E4F28DC8];
        v123 = [(PKPaletteToolPickerView *)self scrollViewCenterYConstraint];
        v166[0] = v123;
        v124 = [(PKPaletteToolPickerView *)self scrollViewHeightConstraint];
        v166[1] = v124;
        v125 = [(PKPaletteToolPickerView *)self scrollViewLeadingConstraint];
        v166[2] = v125;
        v126 = [(PKPaletteToolPickerView *)self scrollViewTrailingConstraint];
        v166[3] = v126;
        v127 = (void *)MEMORY[0x1E4F1C978];
        v128 = v166;
LABEL_65:
        v135 = [v127 arrayWithObjects:v128 count:4];
        [v122 activateConstraints:v135];

        goto LABEL_67;
      }
    }
    else
    {
      v129 = (void *)MEMORY[0x1E4F28DC8];
      v130 = [(PKPaletteToolPickerView *)self toolsHeightConstraints];
      [v129 activateConstraints:v130];

      v131 = [(PKPaletteToolPickerView *)self clippingViewLeadingConstraint];
      [v131 setConstant:-v91];

      v132 = [(PKPaletteToolPickerView *)self clippingViewTrailingConstraint];
      [v132 setConstant:v91];

      v133 = [(PKPaletteToolPickerView *)self scrollViewLeadingConstraint];
      [v133 setConstant:v91];

      v134 = [(PKPaletteToolPickerView *)self scrollViewTrailingConstraint];
      [v134 setConstant:-v91];

      if (v109 < v114)
      {
        v122 = (void *)MEMORY[0x1E4F28DC8];
        v123 = [(PKPaletteToolPickerView *)self scrollViewCenterXConstraint];
        v165[0] = v123;
        v124 = [(PKPaletteToolPickerView *)self scrollViewWidthConstraint];
        v165[1] = v124;
        v125 = [(PKPaletteToolPickerView *)self scrollViewTopConstraint];
        v165[2] = v125;
        v126 = [(PKPaletteToolPickerView *)self scrollViewBottomConstraint];
        v165[3] = v126;
        v127 = (void *)MEMORY[0x1E4F1C978];
        v128 = v165;
        goto LABEL_65;
      }
    }
    v106[2](v106);
    goto LABEL_67;
  }
  v92 = (void *)MEMORY[0x1E4F28DC8];
  v93 = [(PKPaletteToolPickerView *)self toolsWidthCompactConstraints];
  v94 = [(PKPaletteToolPickerView *)self scrollViewTopConstraint];
  v167[0] = v94;
  v95 = [(PKPaletteToolPickerView *)self scrollViewBottomConstraint];
  v167[1] = v95;
  v96 = [(PKPaletteToolPickerView *)self scrollViewLeadingConstraint];
  v167[2] = v96;
  v97 = [(PKPaletteToolPickerView *)self scrollViewTrailingConstraint];
  v167[3] = v97;
  v98 = [(PKPaletteToolPickerView *)self stackViewCompactHeightConstraint];
  v167[4] = v98;
  v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:v167 count:5];
  v100 = [v93 arrayByAddingObjectsFromArray:v99];
  [v92 activateConstraints:v100];

  v101 = [(PKPaletteToolPickerView *)self clippingViewLeadingConstraint];
  [v101 setConstant:-v91];

  v102 = [(PKPaletteToolPickerView *)self clippingViewTrailingConstraint];
  [v102 setConstant:v91];

  v103 = [(PKPaletteToolPickerView *)self scrollViewLeadingConstraint];
  [v103 setConstant:v91];

  v104 = [(PKPaletteToolPickerView *)self scrollViewTrailingConstraint];
  [v104 setConstant:-v91];

  if ([(PKPaletteToolPickerView *)self isScrollingEnabled]) {
    double v105 = 6.0;
  }
  else {
    double v105 = 0.0;
  }
  v106 = [(PKPaletteToolPickerView *)self scrollView];
  objc_msgSend(v106, "setContentInset:", 0.0, 0.0, 0.0, v105);
LABEL_67:

  unint64_t v136 = [(PKPaletteToolPickerView *)self edgeLocation];
  uint64_t v138 = v136 == 2 || v136 == 8;
  uint64_t v139 = [(PKPaletteToolPickerView *)self clippingView];
  v140 = (void *)v139;
  if (v139 && *(void *)(v139 + 544) != v138)
  {
    *(void *)(v139 + 544) = v138;
    -[PKPaletteToolPickerClippingView _updateUI](v139);
  }

  int v141 = [(PKPaletteToolPickerView *)self edgeLocation] == 8;
  uint64_t v142 = [(PKPaletteToolPickerView *)self clippingView];
  v143 = (void *)v142;
  if (v142 && *(unsigned __int8 *)(v142 + 520) != v141)
  {
    *(unsigned char *)(v142 + 520) = v141;
    -[PKPaletteToolPickerClippingView _updateUI](v142);
  }

  [(PKPaletteToolPickerView *)self updateClippingViewEdgesVisibility];
}

void __36__PKPaletteToolPickerView__updateUI__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  [v10 intrinsicContentSize];
  double v6 = v5;
  [v10 scalingFactor];
  double v8 = v6 / v7;
  [*(id *)(a1 + 32) _widthForToolAtIndex:a3 isCompactSize:1];
  [v10 setScalingFactor:v9 / v8];
}

void __36__PKPaletteToolPickerView__updateUI__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 _widthForToolAtIndex:a3 isCompactSize:1];
  double v8 = v7;
  double v9 = [v6 widthAnchor];

  id v11 = [v9 constraintEqualToConstant:v8];

  id v10 = [*(id *)(a1 + 32) toolsWidthCompactConstraints];
  [v10 addObject:v11];
}

void __36__PKPaletteToolPickerView__updateUI__block_invoke_3(uint64_t a1)
{
  void v8[4] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28DC8];
  int64_t v3 = [*(id *)(a1 + 32) scrollViewTopConstraint];
  v8[0] = v3;
  id v4 = [*(id *)(a1 + 32) scrollViewBottomConstraint];
  v8[1] = v4;
  double v5 = [*(id *)(a1 + 32) scrollViewLeadingConstraint];
  v8[2] = v5;
  id v6 = [*(id *)(a1 + 32) scrollViewTrailingConstraint];
  v8[3] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];
  [v2 activateConstraints:v7];
}

- (void)updateClippingViewEdgesVisibility
{
  unint64_t v3 = [(PKPaletteToolPickerView *)self edgeLocation];
  if (v3 == 2 || v3 == 8)
  {
    id v4 = [(PKPaletteToolPickerView *)self scrollView];
    [v4 contentOffset];
    double v6 = v5;
  }
  else
  {
    id v4 = [(PKPaletteToolPickerView *)self scrollView];
    [v4 contentOffset];
    double v6 = v7;
  }

  BOOL v8 = [(PKPaletteToolPickerView *)self isScrollingEnabled];
  int v9 = v6 > 10.0 && v8;
  uint64_t v10 = [(PKPaletteToolPickerView *)self clippingView];
  id v11 = (void *)v10;
  if (v10 && *(unsigned __int8 *)(v10 + 521) != v9)
  {
    *(unsigned char *)(v10 + 521) = v9;
    -[PKPaletteToolPickerClippingView _updateUI](v10);
  }

  uint64_t v12 = [(PKPaletteToolPickerView *)self scrollView];
  objc_msgSend(v12, "_pk_maximumContentOffset");
  double v14 = v13;
  double v16 = v15;

  unint64_t v17 = [(PKPaletteToolPickerView *)self edgeLocation];
  if (v17 == 8 || v17 == 2) {
    double v14 = v16;
  }
  BOOL v19 = [(PKPaletteToolPickerView *)self isScrollingEnabled];
  int v20 = v6 < v14 + -10.0 && v19;
  double v21 = [(PKPaletteToolPickerView *)self clippingView];
  if (v21 && v21[522] != v20)
  {
    v21[522] = v20;
    v22 = v21;
    -[PKPaletteToolPickerClippingView _updateUI]((uint64_t)v21);
    double v21 = v22;
  }
}

- (BOOL)_useCompactSize
{
  unint64_t v3 = [(PKPaletteToolPickerView *)self traitCollection];
  id v4 = [(PKPaletteToolPickerView *)self window];
  double v5 = [v4 windowScene];
  BOOL v6 = PKUseCompactSize(v3, v5);

  return v6;
}

- (int64_t)_stackViewAxis
{
  if ([(PKPaletteToolPickerView *)self _useCompactSize]) {
    return 0;
  }
  unint64_t v4 = [(PKPaletteToolPickerView *)self edgeLocation];
  return v4 == 2 || v4 == 8;
}

- (double)_widthForToolAtIndex:(unint64_t)a3 isCompactSize:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(PKPaletteToolPickerView *)self delegate];
  [v7 toolPickerView:self widthForToolAtIndex:a3 isCompactSize:v4];
  double v9 = v8;

  return v9;
}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  BOOL v6 = (void (**)(void))a3;
  BOOL v4 = [(PKPaletteToolPickerView *)self toolAttributesPopover];

  if (v4)
  {
    double v5 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
    [v5 dismissViewControllerAnimated:1 completion:v6];
  }
  else if (v6)
  {
    v6[2]();
  }
}

- (BOOL)canToggleSelectedToolAndEraser
{
  if ((unint64_t)[(NSMutableArray *)self->_mutableToolViews count] >= 2)
  {
    unint64_t v3 = [(PKPaletteToolPickerView *)self selectedToolView];
    BOOL v4 = [v3 tool];
    if ([v4 isErasingTool])
    {
    }
    else
    {
      double v5 = [(PKPaletteToolPickerView *)self _eraserToolView];

      if (v5) {
        return 1;
      }
    }
    BOOL v6 = [(PKPaletteToolPickerView *)self selectedToolView];
    double v7 = [v6 tool];
    if ([v7 isErasingTool])
    {
      double v8 = [(PKPaletteToolView *)self->_lastSelectedToolView tool];
      int v9 = [v8 isErasingTool];

      if (!v9) {
        return 1;
      }
    }
    else
    {
    }
  }
  return 0;
}

- (void)toggleSelectedToolAndEraserAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PKPaletteToolPickerView *)self canToggleSelectedToolAndEraser])
  {
    double v5 = [(PKPaletteToolPickerView *)self _eraserToolView];
    BOOL v6 = [(PKPaletteToolPickerView *)self selectedToolView];

    if (v6 == v5)
    {
      lastSelectedToolView = self->_lastSelectedToolView;
      if (!lastSelectedToolView)
      {
        mutableToolViews = self->_mutableToolViews;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __63__PKPaletteToolPickerView_toggleSelectedToolAndEraserAnimated___block_invoke;
        v13[3] = &unk_1E64CBA40;
        v13[4] = self;
        uint64_t v10 = [(NSMutableArray *)mutableToolViews indexOfObjectPassingTest:v13];
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v11 = [(NSMutableArray *)self->_mutableToolViews objectAtIndex:v10];
          uint64_t v12 = self->_lastSelectedToolView;
          self->_lastSelectedToolView = v11;
        }
        lastSelectedToolView = self->_lastSelectedToolView;
      }
      double v7 = self;
    }
    else
    {
      double v7 = self;
      lastSelectedToolView = (PKPaletteToolView *)v5;
    }
    [(PKPaletteToolPickerView *)v7 _setSelectedToolView:lastSelectedToolView animated:v3 showToolTip:1 notifyDelegate:1 fromTap:0];
    [(PKPaletteToolPickerView *)self dismissPalettePopoverWithCompletion:0];
  }
  else
  {
    double v5 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Can't toggle between last selected tool and eraser.", buf, 2u);
    }
  }
}

uint64_t __63__PKPaletteToolPickerView_toggleSelectedToolAndEraserAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (*(id *)(*(void *)(a1 + 32) + 456) == v3)
  {
    uint64_t v6 = 0;
  }
  else
  {
    double v5 = [v3 tool];
    if ([v5 isInkingTool])
    {
      uint64_t v6 = 1;
    }
    else
    {
      double v7 = [v4 tool];
      uint64_t v6 = [v7 isHandwritingTool];
    }
  }

  return v6;
}

- (BOOL)canToggleSelectedToolAndLastSelectedTool
{
  return (unint64_t)[(NSMutableArray *)self->_mutableToolViews count] > 1;
}

- (void)toggleSelectedToolAndLastSelectedToolAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PKPaletteToolPickerView *)self canToggleSelectedToolAndLastSelectedTool])
  {
    lastSelectedToolView = self->_lastSelectedToolView;
    if (!lastSelectedToolView)
    {
      mutableToolViews = self->_mutableToolViews;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __73__PKPaletteToolPickerView_toggleSelectedToolAndLastSelectedToolAnimated___block_invoke;
      v11[3] = &unk_1E64CBA40;
      v11[4] = self;
      uint64_t v7 = [(NSMutableArray *)mutableToolViews indexOfObjectPassingTest:v11];
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        double v8 = [(NSMutableArray *)self->_mutableToolViews objectAtIndex:v7];
        int v9 = self->_lastSelectedToolView;
        self->_lastSelectedToolView = v8;
      }
      lastSelectedToolView = self->_lastSelectedToolView;
    }
    [(PKPaletteToolPickerView *)self _setSelectedToolView:lastSelectedToolView animated:v3 showToolTip:1 notifyDelegate:1 fromTap:0];
    [(PKPaletteToolPickerView *)self dismissPalettePopoverWithCompletion:0];
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.pencilkit", "PKPalette");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "Can't toggle between last selected tool and currently selected tool.", buf, 2u);
    }
  }
}

BOOL __73__PKPaletteToolPickerView_toggleSelectedToolAndLastSelectedToolAnimated___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)(a1 + 32) + 456) != a2;
}

- (void)toggleSelectedToolAttributesPopoverFromRect:(CGRect)a3 inView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a4;
  int v9 = [(PKPaletteToolPickerView *)self delegate];
  uint64_t v10 = [v9 palettePopoverPresentingController];

  uint64_t v11 = [(PKPaletteToolPickerView *)self toolAttributesPopover];
  if (!v11) {
    goto LABEL_3;
  }
  uint64_t v12 = (void *)v11;
  double v13 = [v10 presentedViewController];
  double v14 = [(PKPaletteToolPickerView *)self toolAttributesPopover];

  if (v13 == v14) {
    [(PKPaletteToolPickerView *)self dismissPalettePopoverWithCompletion:0];
  }
  else {
LABEL_3:
  }
    -[PKPaletteToolPickerView _showToolAttributesPopoverFromRect:inView:](self, "_showToolAttributesPopoverFromRect:inView:", v15, x, y, width, height);
}

- (BOOL)_isAllToolsColorUserInterfaceStyleEqualsTo:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v4 = self->_mutableToolViews;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    char v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        int64_t v11 = [(PKPaletteToolPickerView *)self colorUserInterfaceStyle];
        v8 &= v11 == [v10 colorUserInterfaceStyle];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (BOOL)_isAllToolsEdgeLocationEqualsTo:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v4 = self->_mutableToolViews;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    char v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unint64_t v11 = [(PKPaletteToolPickerView *)self edgeLocation];
        v8 &= v11 == [v10 edgeLocation];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (void)reloadToolViewsWithDataSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(NSMutableArray *)self->_mutableToolViews copy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__PKPaletteToolPickerView_reloadToolViewsWithDataSource___block_invoke;
  v10[3] = &unk_1E64CBAE0;
  v10[4] = self;
  [v5 enumerateObjectsUsingBlock:v10];

  uint64_t v6 = [v4 numberOfToolsInToolPickerView:self];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      int v9 = [v4 toolPickerView:self viewForToolAtIndex:i];
      [(PKPaletteToolPickerView *)self _addToolView:v9 updateUI:0];
    }
  }
  [(PKPaletteToolPickerView *)self _updateUI];
}

uint64_t __57__PKPaletteToolPickerView_reloadToolViewsWithDataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeToolView:a2 updateUI:0];
}

- (void)setScrollingEnabled:(BOOL)a3
{
  if (self->_scrollingEnabled != a3)
  {
    self->_scrollingEnabled = a3;
    [(PKPaletteToolPickerView *)self _updateUI];
  }
}

- (void)scrollSelectedToolViewToVisibleAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(PKPaletteToolPickerView *)self scrollView];
  uint64_t v5 = [(PKPaletteToolPickerView *)self selectedToolView];
  [v5 frame];
  objc_msgSend(v6, "scrollRectToVisible:animated:", v3);
}

- (void)scrollToolViewAtIndex:(unint64_t)a3 toVisibleAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(PKPaletteToolPickerView *)self toolViews];
  id v9 = [v7 objectAtIndex:a3];

  char v8 = [(PKPaletteToolPickerView *)self scrollView];
  [v9 frame];
  objc_msgSend(v8, "scrollRectToVisible:animated:", v4);
}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (PKPaletteToolPickerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaletteToolPickerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaletteToolView)selectedToolView
{
  return self->_selectedToolView;
}

- (int64_t)colorUserInterfaceStyle
{
  return self->_colorUserInterfaceStyle;
}

- (double)interItemToolsSpacing
{
  return self->_interItemToolsSpacing;
}

- (BOOL)unselectedToolsVisible
{
  return self->_unselectedToolsVisible;
}

- (BOOL)isScrollingEnabled
{
  return self->_scrollingEnabled;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (PKPaletteTooltipPresentationHandle)tooltipPresentationHandle
{
  return self->_tooltipPresentationHandle;
}

- (void)setTooltipPresentationHandle:(id)a3
{
}

- (PKDrawingPaletteStatistics)drawingPaletteStatistics
{
  return self->_drawingPaletteStatistics;
}

- (void)setDrawingPaletteStatistics:(id)a3
{
}

- (PKPaletteToolPickerClippingView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
}

- (NSLayoutConstraint)scrollViewTopConstraint
{
  return self->_scrollViewTopConstraint;
}

- (void)setScrollViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)scrollViewBottomConstraint
{
  return self->_scrollViewBottomConstraint;
}

- (void)setScrollViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)scrollViewLeadingConstraint
{
  return self->_scrollViewLeadingConstraint;
}

- (void)setScrollViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)scrollViewTrailingConstraint
{
  return self->_scrollViewTrailingConstraint;
}

- (void)setScrollViewTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)scrollViewCenterXConstraint
{
  return self->_scrollViewCenterXConstraint;
}

- (void)setScrollViewCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)scrollViewCenterYConstraint
{
  return self->_scrollViewCenterYConstraint;
}

- (void)setScrollViewCenterYConstraint:(id)a3
{
}

- (NSLayoutConstraint)scrollViewWidthConstraint
{
  return self->_scrollViewWidthConstraint;
}

- (void)setScrollViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)scrollViewHeightConstraint
{
  return self->_scrollViewHeightConstraint;
}

- (void)setScrollViewHeightConstraint:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (NSLayoutConstraint)stackViewCompactHeightConstraint
{
  return self->_stackViewCompactHeightConstraint;
}

- (void)setStackViewCompactHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)clippingViewTopConstraint
{
  return self->_clippingViewTopConstraint;
}

- (void)setClippingViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)clippingViewBottomConstraint
{
  return self->_clippingViewBottomConstraint;
}

- (void)setClippingViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)clippingViewLeadingConstraint
{
  return self->_clippingViewLeadingConstraint;
}

- (void)setClippingViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)clippingViewTrailingConstraint
{
  return self->_clippingViewTrailingConstraint;
}

- (void)setClippingViewTrailingConstraint:(id)a3
{
}

- (NSMutableArray)toolsWidthConstraints
{
  return self->_toolsWidthConstraints;
}

- (void)setToolsWidthConstraints:(id)a3
{
}

- (NSMutableArray)toolsHeightConstraints
{
  return self->_toolsHeightConstraints;
}

- (void)setToolsHeightConstraints:(id)a3
{
}

- (NSMutableArray)toolsWidthCompactConstraints
{
  return self->_toolsWidthCompactConstraints;
}

- (void)setToolsWidthCompactConstraints:(id)a3
{
}

- (PKPaletteToolView)lastSelectedToolView
{
  return self->_lastSelectedToolView;
}

- (void)setLastSelectedToolView:(id)a3
{
}

- (PKPaletteAttributeViewController)toolAttributesPopover
{
  return self->_toolAttributesPopover;
}

- (void)setToolAttributesPopover:(id)a3
{
}

- (NSHashTable)presentedViewControllers
{
  return self->_presentedViewControllers;
}

- (void)setPresentedViewControllers:(id)a3
{
}

- (UIScrollViewDelegate)lastScrollViewDelegateBeforeScrollingToolToVisible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastScrollViewDelegateBeforeScrollingToolToVisible);

  return (UIScrollViewDelegate *)WeakRetained;
}

- (void)setLastScrollViewDelegateBeforeScrollingToolToVisible:(id)a3
{
}

- (PKScrollViewDelegateEventsHandler)scrollViewDelegateEventsHandler
{
  return self->_scrollViewDelegateEventsHandler;
}

- (void)setScrollViewDelegateEventsHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewDelegateEventsHandler, 0);
  objc_destroyWeak((id *)&self->_lastScrollViewDelegateBeforeScrollingToolToVisible);
  objc_storeStrong((id *)&self->_presentedViewControllers, 0);
  objc_storeStrong((id *)&self->_toolAttributesPopover, 0);
  objc_storeStrong((id *)&self->_lastSelectedToolView, 0);
  objc_storeStrong((id *)&self->_toolsWidthCompactConstraints, 0);
  objc_storeStrong((id *)&self->_toolsHeightConstraints, 0);
  objc_storeStrong((id *)&self->_toolsWidthConstraints, 0);
  objc_storeStrong((id *)&self->_clippingViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_clippingViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_clippingViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_clippingViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewCompactHeightConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_drawingPaletteStatistics, 0);
  objc_storeStrong((id *)&self->_tooltipPresentationHandle, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_selectedToolView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_mutableToolViews, 0);
}

@end