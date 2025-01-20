@interface MUPlaceRibbonView
- (BOOL)hasContent;
- (BOOL)showTopAndBottomSeparators;
- (MUPlaceRibbonView)initWithFrame:(CGRect)a3;
- (MUPlaceRibbonViewDelegate)delegate;
- (MUScrollAnalyticActionObserving)analyticsDelegate;
- (NSArray)viewModels;
- (id)_visibleRibbonItemViews;
- (void)_setupStackView;
- (void)_updateAppearance;
- (void)layoutSubviews;
- (void)reloadVisibility;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setViewModels:(id)a3;
@end

@implementation MUPlaceRibbonView

- (MUPlaceRibbonView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUPlaceRibbonView;
  v3 = -[MUPlaceRibbonView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MUPlaceRibbonView *)v3 _setupStackView];
  }
  return v4;
}

- (void)_setupStackView
{
  v30[4] = *MEMORY[0x1E4F143B8];
  v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  viewModels = self->_viewModels;
  self->_viewModels = v3;

  v5 = [MUScrollableStackView alloc];
  objc_super v6 = -[MUScrollableStackView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  contentStackView = self->_contentStackView;
  self->_contentStackView = v6;

  [(MUScrollableStackView *)self->_contentStackView setAxis:0];
  [(MUScrollableStackView *)self->_contentStackView setSpacing:16.0];
  [(MUScrollableStackView *)self->_contentStackView setDelegate:self];
  BOOL v8 = [(MUPlaceRibbonView *)self showTopAndBottomSeparators];
  if (v8) {
    double v9 = 19.0;
  }
  else {
    double v9 = 16.0;
  }
  double v10 = 0.0;
  if (v8) {
    double v10 = 10.0;
  }
  -[MUScrollableStackView setContentEdgeInsets:](self->_contentStackView, "setContentEdgeInsets:", v10, v9, v10, 16.0);
  if (MapKitIdiomIsMacCatalyst())
  {
    v11 = [[MUPagingScrollContainerView alloc] initWithHorizontalScrollView:self->_contentStackView];
    [(MUPagingScrollContainerView *)v11 setCornerStyle:0];
  }
  else
  {
    v11 = self->_contentStackView;
  }
  [(MUPagingScrollContainerView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUPlaceRibbonView *)self addSubview:v11];
  if (v8)
  {
    v12 = objc_alloc_init(MUHairlineView);
    topHairline = self->_topHairline;
    self->_topHairline = v12;

    v14 = objc_alloc_init(MUHairlineView);
    bottomHairline = self->_bottomHairline;
    self->_bottomHairline = v14;

    [(MUScrollableStackView *)self->_contentStackView addSubview:self->_topHairline];
    [(MUScrollableStackView *)self->_contentStackView addSubview:self->_bottomHairline];
  }
  v29 = [(MUPagingScrollContainerView *)v11 leadingAnchor];
  v28 = [(MUPlaceRibbonView *)self leadingAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v30[0] = v27;
  v26 = [(MUPagingScrollContainerView *)v11 trailingAnchor];
  v16 = [(MUPlaceRibbonView *)self trailingAnchor];
  v17 = [v26 constraintEqualToAnchor:v16];
  v30[1] = v17;
  v18 = [(MUPagingScrollContainerView *)v11 topAnchor];
  v19 = [(MUPlaceRibbonView *)self topAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  v30[2] = v20;
  v21 = [(MUPagingScrollContainerView *)v11 bottomAnchor];
  v22 = [(MUPlaceRibbonView *)self bottomAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v30[3] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  [v25 activateConstraints:v24];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)MUPlaceRibbonView;
  [(MUPlaceRibbonView *)&v12 layoutSubviews];
  [(MUPlaceRibbonView *)self layoutIfNeeded];
  [(MUScrollableStackView *)self->_contentStackView frame];
  double Width = CGRectGetWidth(v13);
  v4 = [(MUScrollableStackView *)self->_contentStackView contentLayoutGuide];
  [v4 layoutFrame];
  double v5 = CGRectGetWidth(v14);

  if (Width >= v5) {
    double v6 = Width;
  }
  else {
    double v6 = v5;
  }
  double v7 = v6 + -16.0 + -16.0;
  [(MUHairlineView *)self->_topHairline intrinsicContentSize];
  double v9 = v8;
  [(MUScrollableStackView *)self->_contentStackView frame];
  double v11 = v10 + 16.0;
  -[MUHairlineView setFrame:](self->_topHairline, "setFrame:", v10 + 16.0, 0.0, v7, v9);
  [(MUScrollableStackView *)self->_contentStackView frame];
  -[MUHairlineView setFrame:](self->_bottomHairline, "setFrame:", v11, CGRectGetMaxY(v15) - v9, v7, v9);
}

- (BOOL)showTopAndBottomSeparators
{
  return 1;
}

- (void)setViewModels:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_viewModels, "isEqualToArray:"))
  {
    v4 = (NSArray *)[v6 copy];
    viewModels = self->_viewModels;
    self->_viewModels = v4;

    [(MUPlaceRibbonView *)self _updateAppearance];
  }
}

- (void)_updateAppearance
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obj = self->_viewModels;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
        objc_super v12 = -[MUPlaceRibbonItemView initWithFrame:]([MUPlaceRibbonItemView alloc], "initWithFrame:", v6, v7, v8, v9);
        [(MUPlaceRibbonItemView *)v12 setViewModel:v11];
        objc_initWeak(&location, self);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __38__MUPlaceRibbonView__updateAppearance__block_invoke;
        v16[3] = &unk_1E5750558;
        objc_copyWeak(&v17, &location);
        v16[4] = v11;
        [(MUPlaceRibbonItemView *)v12 setActionHandler:v16];
        CGRect v13 = [(NSArray *)self->_viewModels lastObject];
        BOOL v14 = v11 != v13;

        [(MUPlaceRibbonItemView *)v12 setShowTrailingHairline:v14];
        [v3 addObject:v12];
        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);

        ++v10;
      }
      while (v4 != v10);
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
  }

  [(MUScrollableStackView *)self->_contentStackView setArrangedSubviews:v3];
}

void __38__MUPlaceRibbonView__updateAppearance__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = objc_alloc_init(MUPresentationOptions);
    [(MUPresentationOptions *)v4 setSourceView:v6];
    [v6 frame];
    -[MUPresentationOptions setSourceRect:](v4, "setSourceRect:");
    [(MUPresentationOptions *)v4 setProgressObserver:v6];
    uint64_t v5 = [WeakRetained delegate];
    [v5 ribbonView:WeakRetained didTapItemWithViewModel:*(void *)(a1 + 32) withPresentationOptions:v4];
  }
}

- (BOOL)hasContent
{
  v2 = [(MUPlaceRibbonView *)self _visibleRibbonItemViews];
  unint64_t v3 = [v2 count];
  LOBYTE(v3) = v3 >= GEOConfigGetUInteger();

  return v3;
}

- (id)_visibleRibbonItemViews
{
  v2 = [(MUScrollableStackView *)self->_contentStackView arrangedSubviews];
  unint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_33];
  uint64_t v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

uint64_t __44__MUPlaceRibbonView__visibleRibbonItemViews__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHidden] ^ 1;
}

- (void)reloadVisibility
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(MUScrollableStackView *)self->_contentStackView arrangedSubviews];
  uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v26;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v25 + 1) + 8 * v7);
        double v9 = [(MUPlaceRibbonView *)self delegate];
        uint64_t v10 = [(NSArray *)self->_viewModels objectAtIndexedSubscript:v5 + v7];
        int v11 = [v9 ribbonView:self shouldShowRibbonItem:v10];

        [v8 setHidden:v11 ^ 1u];
        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      v5 += v7;
    }
    while (v4);
  }

  objc_super v12 = [(MUPlaceRibbonView *)self _visibleRibbonItemViews];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v21 + 1) + 8 * v16);
        v18 = [v12 lastObject];
        BOOL v19 = v17 != v18;

        [v17 setShowTrailingHairline:v19];
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  p_beginAnalyticsScrollingPoint = &self->_beginAnalyticsScrollingPoint;
  [a3 contentOffset];
  p_beginAnalyticsScrollingPoint->x = v4;
  p_beginAnalyticsScrollingPoint->y = v5;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  CGFloat v5 = self->_beginAnalyticsScrollingPoint.x - a5->x;
  uint64_t v6 = [(MUPlaceRibbonView *)self analyticsDelegate];
  id v7 = v6;
  if (v5 <= 0.0) {
    [v6 performInstrumentationForScrollRight];
  }
  else {
    [v6 performInstrumentationForScrollLeft];
  }
}

- (MUScrollAnalyticActionObserving)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
  return (MUScrollAnalyticActionObserving *)WeakRetained;
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (MUPlaceRibbonViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUPlaceRibbonViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_bottomHairline, 0);
  objc_storeStrong((id *)&self->_topHairline, 0);
  objc_storeStrong((id *)&self->_callToActionViewModel, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
}

@end