@interface AVMobileChromelessContentTabsView
- (AVMobileChromelessContentTabsTransitionState)transitionState;
- (AVMobileChromelessContentTabsView)initWithStyleSheet:(id)a3;
- (AVMobileChromelessContentTabsViewDelegate)delegate;
- (AVMobileContentTab)selectedContentTab;
- (CGSize)intrinsicContentSize;
- (NSArray)contentTabs;
- (UIScrollViewDelegate)contentViewDelegate;
- (double)fadeDistance;
- (id)_updateContentTabsUserInteractionEnabledStateIfNeeded;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_setupContentTabSelectionViewIfNeeded;
- (void)_setupContentTabsContentViewIfNeeded;
- (void)avkit_intrinsicContentSizeOfSubviewWasInvalidated:(id)a3;
- (void)contentTabSelectionView:(id)a3 didChangeSelectedTabTo:(id)a4 withReason:(unint64_t)a5;
- (void)didMoveToSuperview;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)resetSelection;
- (void)setContentTabs:(id)a3;
- (void)setContentViewDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFadeDistance:(double)a3;
- (void)setTransitionState:(AVMobileChromelessContentTabsTransitionState *)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation AVMobileChromelessContentTabsView

- (void).cxx_destruct
{
  p_transitionState = &self->_transitionState;

  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_contentViewDelegate);
  objc_storeStrong((id *)&self->_contentTabs, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_contentTabSelectionView, 0);

  objc_storeStrong((id *)&self->_styleSheet, 0);
}

- (AVMobileChromelessContentTabsTransitionState)transitionState
{
  p_transitionState = &self->_transitionState;
  retstr->activeContentTab = self->_transitionState.activeContentTab;
  result = p_transitionState->upcomingContentTab;
  retstr->upcomingContentTab = (AVMobileContentTab *)result;
  *(_OWORD *)&retstr->transitionState = *(_OWORD *)&p_transitionState->transitionState;
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (AVMobileChromelessContentTabsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMobileChromelessContentTabsViewDelegate *)WeakRetained;
}

- (double)fadeDistance
{
  return self->_fadeDistance;
}

- (UIScrollViewDelegate)contentViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewDelegate);

  return (UIScrollViewDelegate *)WeakRetained;
}

- (NSArray)contentTabs
{
  return self->_contentTabs;
}

- (void)contentTabSelectionView:(id)a3 didChangeSelectedTabTo:(id)a4 withReason:(unint64_t)a5
{
  id v10 = a4;
  v7 = [(AVMobileChromelessContentTabsView *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(AVMobileChromelessContentTabsView *)self delegate];
    [v9 contentTabsView:self didChangeContentTab:v10 withReason:a5];
  }
}

- (void)avkit_intrinsicContentSizeOfSubviewWasInvalidated:(id)a3
{
  if (self->_contentTabSelectionView == a3)
  {
    v4 = [(AVMobileChromelessContentTabsView *)self superview];
    objc_msgSend(v4, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);

    [(AVMobileChromelessContentTabsView *)self setNeedsLayout];
  }
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)AVMobileChromelessContentTabsView;
  [(AVMobileChromelessContentTabsView *)&v3 didMoveToSuperview];
  -[AVMobileChromelessContentTabsView _setupContentTabsContentViewIfNeeded]((id *)&self->super.super.super.super.isa);
  -[AVMobileChromelessContentTabsView _setupContentTabSelectionViewIfNeeded]((uint64_t)self);
  -[AVMobileChromelessContentTabsView _updateContentTabsUserInteractionEnabledStateIfNeeded]((id *)&self->super.super.super.super.isa);
}

- (void)_setupContentTabsContentViewIfNeeded
{
  if (a1)
  {
    if (!a1[59])
    {
      v2 = [a1 window];

      if (v2)
      {
        objc_super v3 = objc_alloc_init(AVMobileChromelessContentTabsContentView);
        id v4 = a1[59];
        a1[59] = v3;

        v5 = [a1[59] scrollView];
        id WeakRetained = objc_loadWeakRetained(a1 + 61);
        [v5 setDelegate:WeakRetained];

        [a1 addSubview:a1[59]];
      }
    }
    id v7 = a1[59];
    if (v7)
    {
      char v8 = [v7 scrollView];

      if (v8)
      {
        id v10 = [a1[59] scrollView];
        id v9 = objc_loadWeakRetained(a1 + 61);
        [v10 setDelegate:v9];
      }
    }
  }
}

- (void)_setupContentTabSelectionViewIfNeeded
{
  if (a1)
  {
    if (!*(void *)(a1 + 464))
    {
      v2 = [(id)a1 window];

      if (v2)
      {
        objc_super v3 = [[AVMobileContentTabSelectionView alloc] initWithStyleSheet:*(void *)(a1 + 456)];
        id v4 = *(void **)(a1 + 464);
        *(void *)(a1 + 464) = v3;

        [*(id *)(a1 + 464) setDelegate:a1];
        uint64_t v5 = *(void *)(a1 + 464);
        [(id)a1 addSubview:v5];
      }
    }
  }
}

- (id)_updateContentTabsUserInteractionEnabledStateIfNeeded
{
  if (result)
  {
    v1 = result;
    objc_msgSend(result[59], "setUserInteractionEnabled:", objc_msgSend(result, "isUserInteractionEnabled"));
    id v2 = v1[58];
    uint64_t v3 = [v1 isUserInteractionEnabled];
    return (id *)[v2 setUserInteractionEnabled:v3];
  }
  return result;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)AVMobileChromelessContentTabsView;
  [(AVView *)&v22 layoutSubviews];
  [(AVMobileChromelessContentTabsContentView *)self->_contentView setNeedsLayout];
  [(AVMobileChromelessContentTabsView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(AVMobileContentTabSelectionView *)self->_contentTabSelectionView intrinsicContentSize];
  double v8 = v7;
  if (v6 >= v7
    && (double v9 = v6 - v7,
        -[AVMobileContentTabSelectionView setFrame:](self->_contentTabSelectionView, "setFrame:", 0.0, 0.0, v4, v7),
        v9 > 0.0))
  {
    [(AVMobileContentTabSelectionView *)self->_contentTabSelectionView frame];
    double v12 = v11;
    [(AVMobileChromelessContentTabsView *)self fadeDistance];
    double v14 = v13 + v12;
    [(AVMobileChromelessContentTabsView *)self bounds];
    if (v15 <= v16) {
      double v17 = 16.0;
    }
    else {
      double v17 = 14.0;
    }
    double v18 = v14 + v17;
    [(AVMobileChromelessContentTabsView *)self bounds];
    if (v19 <= v20) {
      double v21 = 16.0;
    }
    else {
      double v21 = 14.0;
    }
    -[AVMobileChromelessContentTabsContentView setFrame:](self->_contentView, "setFrame:", 0.0, v18, v4, v9 - v21);
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 1;
  }
  [(AVMobileContentTabSelectionView *)self->_contentTabSelectionView setHidden:v6 < v8];
  [(AVView *)self->_contentView setHidden:v10];
}

- (void)layoutMarginsDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)AVMobileChromelessContentTabsView;
  [(AVMobileChromelessContentTabsView *)&v5 layoutMarginsDidChange];
  contentTabSelectionView = self->_contentTabSelectionView;
  [(AVMobileChromelessContentTabsView *)self layoutMargins];
  [(AVMobileContentTabSelectionView *)contentTabSelectionView setLayoutMargins:"setLayoutMargins:"];
  contentView = self->_contentView;
  [(AVMobileChromelessContentTabsView *)self layoutMargins];
  [(AVMobileChromelessContentTabsContentView *)contentView setLayoutMargins:"setLayoutMargins:"];
}

- (CGSize)intrinsicContentSize
{
  [(AVMobileContentTabSelectionView *)self->_contentTabSelectionView intrinsicContentSize];
  double v3 = *MEMORY[0x1E4FB30D8];
  result.height = v2;
  result.width = v3;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)AVMobileChromelessContentTabsView;
  -[AVView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  objc_super v5 = (AVMobileContentTabSelectionView *)objc_claimAutoreleasedReturnValue();
  double v6 = v5;
  if (v5 == self->_contentTabSelectionView) {
    int v7 = 1;
  }
  else {
    int v7 = -[AVMobileContentTabSelectionView isDescendantOfView:](v5, "isDescendantOfView:");
  }
  double v8 = [(AVMobileChromelessContentTabsContentView *)self->_contentView scrollView];
  if (([v8 isTracking] & 1) == 0 && (objc_msgSend(v8, "isDragging") & 1) == 0) {
    v7 &= [v8 isDecelerating];
  }
  if (v7) {
    double v9 = 0;
  }
  else {
    double v9 = v6;
  }
  uint64_t v10 = v9;

  return v10;
}

- (void)resetSelection
{
}

- (AVMobileContentTab)selectedContentTab
{
  return [(AVMobileContentTabSelectionView *)self->_contentTabSelectionView selectedTab];
}

- (void)setTransitionState:(AVMobileChromelessContentTabsTransitionState *)a3
{
  p_transitionState = &self->_transitionState;
  objc_storeStrong((id *)&self->_transitionState.activeContentTab, a3->activeContentTab);
  objc_storeStrong((id *)&p_transitionState->upcomingContentTab, a3->upcomingContentTab);
  *(_OWORD *)&p_transitionState->transitionState = *(_OWORD *)&a3->transitionState;
  double v6 = p_transitionState->activeContentTab;
  int v7 = p_transitionState->upcomingContentTab;
  unint64_t transitionReason = p_transitionState->transitionReason;
  double v9 = v6;
  uint64_t v10 = v7;
  double v11 = v10;
  if (v9) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v10 == 0;
  }
  double v13 = v9;
  if (!v12) {
    double v13 = v10;
  }
  [(AVMobileChromelessContentTabsContentView *)self->_contentView setUpcomingContentTab:v11];
  [(AVMobileChromelessContentTabsContentView *)self->_contentView setActiveTabContentTab:v13 withChangingReason:transitionReason];
  if (v13) {
    [(AVMobileContentTabSelectionView *)self->_contentTabSelectionView selectTab:v13 withReason:2];
  }

  upcomingContentTab = a3->upcomingContentTab;
}

- (void)setFadeDistance:(double)a3
{
  if (self->_fadeDistance != a3)
  {
    self->_fadeDistance = a3;
    [(AVMobileChromelessContentTabsView *)self setNeedsLayout];
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromelessContentTabsView;
  if ([(AVMobileChromelessContentTabsView *)&v6 isUserInteractionEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileChromelessContentTabsView;
    [(AVMobileChromelessContentTabsView *)&v5 setUserInteractionEnabled:v3];
    -[AVMobileChromelessContentTabsView _updateContentTabsUserInteractionEnabledStateIfNeeded]((id *)&self->super.super.super.super.isa);
  }
}

- (void)setContentViewDelegate:(id)a3
{
  id obj = a3;
  p_contentViewDelegate = &self->_contentViewDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewDelegate);

  id v7 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_contentViewDelegate, obj);
    -[AVMobileChromelessContentTabsView _setupContentTabsContentViewIfNeeded]((id *)&self->super.super.super.super.isa);
    id v7 = obj;
    contentView = self->_contentView;
    if (contentView)
    {
      double v8 = [(AVMobileChromelessContentTabsContentView *)contentView scrollView];
      id v9 = objc_loadWeakRetained((id *)p_contentViewDelegate);
      [v8 setDelegate:v9];

      id v7 = obj;
    }
  }

  MEMORY[0x1F41817F8](contentView, v7);
}

- (void)setContentTabs:(id)a3
{
  objc_super v5 = (NSArray *)a3;
  if (self->_contentTabs != v5)
  {
    objc_storeStrong((id *)&self->_contentTabs, a3);
    -[AVMobileChromelessContentTabsView _setupContentTabSelectionViewIfNeeded]((uint64_t)self);
    -[AVMobileChromelessContentTabsView _setupContentTabsContentViewIfNeeded]((id *)&self->super.super.super.super.isa);
    [(AVMobileContentTabSelectionView *)self->_contentTabSelectionView setContentTabs:v5];
    [(AVMobileChromelessContentTabsContentView *)self->_contentView setContentTabs:v5];
  }
}

- (AVMobileChromelessContentTabsView)initWithStyleSheet:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVMobileChromelessContentTabsView;
  objc_super v6 = -[AVView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_styleSheet, a3);
    double v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    contentTabs = v7->_contentTabs;
    v7->_contentTabs = v8;

    [(AVMobileChromelessContentTabsView *)v7 setInsetsLayoutMarginsFromSafeArea:0];
  }

  return v7;
}

@end