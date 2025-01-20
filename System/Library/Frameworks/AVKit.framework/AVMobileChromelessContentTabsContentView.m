@interface AVMobileChromelessContentTabsContentView
- (AVMobileChromelessContentTabsContentView)init;
- (AVMobileContentTab)activeContentTab;
- (AVMobileContentTab)upcomingContentTab;
- (NSArray)contentTabs;
- (UIScrollView)scrollView;
- (double)_contentOffsetForTab:(id *)a1;
- (id)_updateContentSize;
- (uint64_t)_indexForContentTab:(id *)a1;
- (void)_attachViewForContentTab:(id *)a1;
- (void)_updateActiveContentTabFrom:(void *)a3 to:(uint64_t)a4 withChangingReason:;
- (void)_updateContentTabViewFrame:(id *)a1;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setActiveTabContentTab:(id)a3 withChangingReason:(unint64_t)a4;
- (void)setContentTabs:(id)a3;
- (void)setUpcomingContentTab:(id)a3;
@end

@implementation AVMobileChromelessContentTabsContentView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_activeContentTab, 0);
  objc_storeStrong((id *)&self->_contentTabs, 0);

  objc_storeStrong((id *)&self->_upcomingContentTab, 0);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (AVMobileContentTab)activeContentTab
{
  return self->_activeContentTab;
}

- (NSArray)contentTabs
{
  return self->_contentTabs;
}

- (AVMobileContentTab)upcomingContentTab
{
  return self->_upcomingContentTab;
}

- (void)didMoveToSuperview
{
  v7.receiver = self;
  v7.super_class = (Class)AVMobileChromelessContentTabsContentView;
  [(AVMobileChromelessContentTabsContentView *)&v7 didMoveToSuperview];
  if (self)
  {
    if (!self->_scrollView)
    {
      v3 = [(AVMobileChromelessContentTabsContentView *)self window];

      if (v3)
      {
        id v4 = objc_alloc(MEMORY[0x1E4FB1BE0]);
        v5 = (UIScrollView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        scrollView = self->_scrollView;
        self->_scrollView = v5;

        [(UIScrollView *)self->_scrollView setPagingEnabled:1];
        [(UIScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
        [(UIScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
        [(UIScrollView *)self->_scrollView setContentInsetAdjustmentBehavior:2];
        [(AVMobileChromelessContentTabsContentView *)self addSubview:self->_scrollView];
      }
    }
  }
  -[AVMobileChromelessContentTabsContentView _updateContentSize]((id *)&self->super.super.super.super.isa);
}

- (id)_updateContentSize
{
  if (result)
  {
    v1 = result;
    [result bounds];
    objc_msgSend(v1[60], "setContentSize:", v2 * (double)(unint64_t)objc_msgSend(v1[58], "count"), v3);
    id v4 = v1[60];
    return (id *)[v4 setNeedsLayout];
  }
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)AVMobileChromelessContentTabsContentView;
  [(AVView *)&v4 layoutSubviews];
  if ([(UIScrollView *)self->_scrollView isTracking]
    || [(UIScrollView *)self->_scrollView isDecelerating])
  {
    -[AVMobileChromelessContentTabsContentView _updateContentSize]((id *)&self->super.super.super.super.isa);
    -[AVMobileChromelessContentTabsContentView _updateContentTabViewFrame:]((id *)&self->super.super.super.super.isa, self->_activeContentTab);
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", -[AVMobileChromelessContentTabsContentView _contentOffsetForTab:]((id *)&self->super.super.super.super.isa, self->_activeContentTab));
  }
  scrollView = self->_scrollView;
  [(AVMobileChromelessContentTabsContentView *)self bounds];
  -[UIScrollView setFrame:](scrollView, "setFrame:");
}

- (void)_updateContentTabViewFrame:(id *)a1
{
  if (a1 && a2)
  {
    id v3 = a2;
    uint64_t v4 = -[AVMobileChromelessContentTabsContentView _indexForContentTab:](a1, v3);
    [a1 bounds];
    double v6 = v5;
    double v8 = v7;
    [a1 layoutMargins];
    double v10 = v9 + v6 * (double)(unint64_t)v4;
    double v12 = v6 - (v9 + v11);
    v13 = [v3 viewController];

    id v14 = [v13 view];

    objc_msgSend(v14, "setFrame:", v10, 0.0, v12, v8);
  }
}

- (double)_contentOffsetForTab:(id *)a1
{
  id v3 = a2;
  double v4 = *MEMORY[0x1E4F1DAD8];
  if (v3)
  {
    uint64_t v5 = -[AVMobileChromelessContentTabsContentView _indexForContentTab:](a1, v3);
    if (v5)
    {
      unint64_t v6 = v5;
      [a1[60] bounds];
      double v4 = v7 * (double)v6;
    }
  }

  return v4;
}

- (uint64_t)_indexForContentTab:(id *)a1
{
  id v3 = a2;
  uint64_t v4 = [a1[58] indexOfObject:v3];
  if ([a1 effectiveUserInterfaceLayoutDirection] == 1) {
    uint64_t v4 = [a1[58] count] + ~v4;
  }

  return v4;
}

- (void)setContentTabs:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_contentTabs, "isEqualToArray:"))
  {
    uint64_t v4 = (NSArray *)[v6 copy];
    contentTabs = self->_contentTabs;
    self->_contentTabs = v4;

    -[AVMobileChromelessContentTabsContentView _updateContentSize]((id *)&self->super.super.super.super.isa);
  }
}

- (void)setUpcomingContentTab:(id)a3
{
  uint64_t v5 = (AVMobileContentTab *)a3;
  id v6 = v5;
  if (self->_upcomingContentTab != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_upcomingContentTab, a3);
    uint64_t v5 = (AVMobileContentTab *)[(UIScrollView *)self->_scrollView isTracking];
    id v6 = v7;
    if (v5)
    {
      -[AVMobileChromelessContentTabsContentView _updateContentSize]((id *)&self->super.super.super.super.isa);
      -[AVMobileChromelessContentTabsContentView _updateContentTabViewFrame:]((id *)&self->super.super.super.super.isa, self->_activeContentTab);
      -[AVMobileChromelessContentTabsContentView _attachViewForContentTab:]((id *)&self->super.super.super.super.isa, self->_upcomingContentTab);
      id v6 = v7;
    }
  }

  MEMORY[0x1F41817F8](v5, v6);
}

- (void)_attachViewForContentTab:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v8 = v3;
    uint64_t v4 = [v3 viewController];
    uint64_t v5 = [v4 view];

    id v6 = [a1[60] subviews];
    char v7 = [v6 containsObject:v5];

    if ((v7 & 1) == 0) {
      [a1[60] addSubview:v5];
    }
    -[AVMobileChromelessContentTabsContentView _updateContentTabViewFrame:](a1, v8);
    if (([a1[60] isTracking] & 1) == 0) {
      objc_msgSend(a1[60], "setContentOffset:", -[AVMobileChromelessContentTabsContentView _contentOffsetForTab:](a1, a1[59]));
    }

    id v3 = v8;
  }
}

- (void)setActiveTabContentTab:(id)a3 withChangingReason:(unint64_t)a4
{
  char v7 = (AVMobileContentTab *)a3;
  if (v7 && ![(NSArray *)self->_contentTabs containsObject:v7]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Error: Internal inconsistency. The provided AVMobileContentTab does not exist."];
  }
  activeContentTab = self->_activeContentTab;
  if (activeContentTab != v7)
  {
    double v9 = activeContentTab;
    objc_storeStrong((id *)&self->_activeContentTab, a3);
    if (v9)
    {
      double v10 = self;
      double v11 = v9;
    }
    else
    {
      objc_initWeak(&location, self);
      double v12 = (void *)MEMORY[0x1E4FB1EB0];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __86__AVMobileChromelessContentTabsContentView_setActiveTabContentTab_withChangingReason___block_invoke;
      v13[3] = &unk_1E5FC4180;
      objc_copyWeak(&v14, &location);
      v13[4] = self;
      [v12 performWithoutAnimation:v13];
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
      double v10 = self;
      double v11 = 0;
    }
    -[AVMobileChromelessContentTabsContentView _updateActiveContentTabFrom:to:withChangingReason:]((id *)&v10->super.super.super.super.isa, v11, v7, a4);
  }
}

void __86__AVMobileChromelessContentTabsContentView_setActiveTabContentTab_withChangingReason___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    -[AVMobileChromelessContentTabsContentView _updateContentSize](WeakRetained);
    -[AVMobileChromelessContentTabsContentView _updateContentTabViewFrame:](v3, *(void **)(*(void *)(a1 + 32) + 472));
    WeakRetained = v3;
  }
}

- (void)_updateActiveContentTabFrom:(void *)a3 to:(uint64_t)a4 withChangingReason:
{
  id v7 = a2;
  id v8 = a3;
  double v9 = v8;
  if (a1)
  {
    if (a4)
    {
      -[AVMobileChromelessContentTabsContentView _updateContentSize](a1);
      -[AVMobileChromelessContentTabsContentView _updateContentTabViewFrame:](a1, a1[59]);
      -[AVMobileChromelessContentTabsContentView _attachViewForContentTab:](a1, a1[59]);
    }
    else
    {
      double v10 = [v8 viewController];
      double v11 = [v10 view];

      double v12 = [a1[60] subviews];
      char v13 = [v12 containsObject:v11];

      if ((v13 & 1) == 0) {
        [a1[60] addSubview:v11];
      }
      objc_initWeak(&location, a1);
      id v14 = (void *)MEMORY[0x1E4FB1EB0];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __94__AVMobileChromelessContentTabsContentView__updateActiveContentTabFrom_to_withChangingReason___block_invoke;
      v27[3] = &unk_1E5FC4180;
      objc_copyWeak(&v29, &location);
      id v15 = v9;
      id v28 = v15;
      [v14 performWithoutAnimation:v27];
      id v16 = v15;
      id v17 = v7;
      v18 = v17;
      if (v16 && v17)
      {
        objc_initWeak(&from, a1);
        v19 = (void *)MEMORY[0x1E4FB1EB0];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __79__AVMobileChromelessContentTabsContentView__scrollToContentTab_fromContentTab___block_invoke;
        v31[3] = &unk_1E5FC42E8;
        objc_copyWeak(&v34, &from);
        id v20 = v16;
        id v32 = v20;
        id v33 = v18;
        [v19 performWithoutAnimation:v31];
        v21 = [v20 viewController];
        v22 = [v21 view];
        [v22 frame];
        double v24 = v23;
        [a1 layoutMargins];
        double v26 = v24 - v25;

        objc_msgSend(a1[60], "setContentOffset:", v26, 0.0);
        objc_destroyWeak(&v34);
        objc_destroyWeak(&from);
      }

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }
}

void __94__AVMobileChromelessContentTabsContentView__updateActiveContentTabFrom_to_withChangingReason___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained[60], "setContentOffset:", -[AVMobileChromelessContentTabsContentView _contentOffsetForTab:](WeakRetained, *(void **)(a1 + 32)));
    WeakRetained = v3;
  }
}

void __79__AVMobileChromelessContentTabsContentView__scrollToContentTab_fromContentTab___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained[60];
    v31 = WeakRetained;
    uint64_t v4 = [*(id *)(a1 + 32) viewController];
    uint64_t v5 = [v4 view];
    [v3 addSubview:v5];

    [v31[60] bounds];
    double v7 = v6 + v6;
    id v8 = v31[60];
    [v8 frame];
    objc_msgSend(v8, "setContentSize:", v7, v9);
    double v10 = *(void **)(a1 + 40);
    id v11 = *(id *)(a1 + 32);
    id v12 = v10;
    unint64_t v13 = -[AVMobileChromelessContentTabsContentView _indexForContentTab:](v31, v11);
    unint64_t v14 = -[AVMobileChromelessContentTabsContentView _indexForContentTab:](v31, v12);
    id v15 = [v12 viewController];

    id v16 = [v15 view];

    id v17 = [v11 viewController];

    v18 = [v17 view];

    [v31[60] bounds];
    double v20 = v19;
    double v22 = v21;
    [v31 layoutMargins];
    double v24 = v23;
    [v31 layoutMargins];
    double v26 = v20 - (v24 + v25);
    [v31 layoutMargins];
    double v28 = v27;
    double v29 = *MEMORY[0x1E4F1DAD8];
    double v30 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    objc_msgSend(v31[60], "setContentOffset:", *MEMORY[0x1E4F1DAD8], v30);
    if (v14 >= v13)
    {
      objc_msgSend(v16, "setFrame:", v20 + v28, 0.0, v26, v22);
      objc_msgSend(v31[60], "setContentOffset:", v20, 0.0);
    }
    else
    {
      objc_msgSend(v16, "setFrame:", v28, 0.0, v26, v22);
      objc_msgSend(v31[60], "setContentOffset:", v29, v30);
      double v28 = v20 + v28;
    }
    objc_msgSend(v18, "setFrame:", v28, 0.0, v26, v22);

    WeakRetained = v31;
  }
}

- (AVMobileChromelessContentTabsContentView)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVMobileChromelessContentTabsContentView;
  double v2 = -[AVView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v3 = v2;
  if (v2)
  {
    [(AVMobileChromelessContentTabsContentView *)v2 setInsetsLayoutMarginsFromSafeArea:0];
    [(AVMobileChromelessContentTabsContentView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  return v3;
}

@end