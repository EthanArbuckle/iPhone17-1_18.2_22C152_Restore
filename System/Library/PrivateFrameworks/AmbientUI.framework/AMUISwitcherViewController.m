@interface AMUISwitcherViewController
- (AMUISwitcherDataSource)dataSource;
- (AMUISwitcherDelegate)delegate;
- (AMUISwitcherLayout)layout;
- (AMUISwitcherViewController)initWithLayout:(id)a3;
- (BOOL)_beginTransitionIfNeededFromRecord:(id)a3 toRecord:(id)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)_endTransitionIfNeeded;
- (BOOL)_scrollToIndex:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)_shouldAdjustForRTL;
- (BOOL)isCircular;
- (BOOL)isScrollEnabled;
- (BOOL)isScrollingInteractively;
- (BOOL)scrollToIdentifier:(id)a3 animated:(BOOL)a4;
- (BOOL)scrollToItem:(id)a3 animated:(BOOL)a4;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (CGSize)_pageSize;
- (NSArray)visibleIndices;
- (NSArray)visibleItems;
- (double)_point:(double)a3 setValue:(double)a4 onAxis:(double)a5;
- (double)_presentationProgressForItemIndex:(int64_t)a3;
- (double)_size:(double)a3 valueOnAxis:(double)a4;
- (double)presentationProgressForIdentifier:(id)a3;
- (double)presentationProgressForItem:(id)a3;
- (double)spacing;
- (id)_accessibilityIdentifierPrefix;
- (id)_switcherLayout;
- (id)acquireUnsettledAssertionForReason:(id)a3;
- (int64_t)_indexOfItem:(id)a3;
- (int64_t)_indexOfItemWithIdentifier:(id)a3;
- (int64_t)switcherAxis;
- (void)_detachItemRecord:(id)a3;
- (void)_noteTransitionFrom:(id)a3 to:(id)a4 progress:(double)a5;
- (void)_noteTransitionProgressIfNeeded;
- (void)_sendTransitionUpdate;
- (void)_updateForUnsettled:(BOOL)a3;
- (void)_updateTrailingSpacerConstraints;
- (void)dealloc;
- (void)reload;
- (void)reloadItemAtIndex:(int64_t)a3;
- (void)reloadItemWithIdentifier:(id)a3;
- (void)scrollViewDidEndScrolling:(id)a3;
- (void)scrollViewDidScroll:(id)a3 withContext:(id *)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillMoveToWindow:(id)a3;
@end

@implementation AMUISwitcherViewController

- (AMUISwitcherViewController)initWithLayout:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AMUISwitcherViewController;
  v5 = [(AMUISwitcherViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_layout, v4);
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(NSMutableDictionary *)self->_knownItems allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [(AMUISwitcherViewController *)self _detachItemRecord:*(void *)(*((void *)&v10 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(BSCompoundAssertion *)self->_unsettledAssertions invalidate];
  unsettledAssertions = self->_unsettledAssertions;
  self->_unsettledAssertions = 0;

  v9.receiver = self;
  v9.super_class = (Class)AMUISwitcherViewController;
  [(AMUISwitcherViewController *)&v9 dealloc];
}

- (BOOL)scrollToItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v6 = [(AMUISwitcherViewController *)self _indexOfItem:a3];

  return [(AMUISwitcherViewController *)self _scrollToIndex:v6 animated:v4 completion:0];
}

- (BOOL)scrollToIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v6 = [(AMUISwitcherViewController *)self _indexOfItemWithIdentifier:a3];

  return [(AMUISwitcherViewController *)self _scrollToIndex:v6 animated:v4 completion:0];
}

- (void)reload
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  self->_firstLayout = 1;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(NSMutableDictionary *)self->_knownItems allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [(AMUISwitcherViewController *)self _detachItemRecord:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_knownItems removeAllObjects];
  [(NSMutableDictionary *)self->_visibleItems removeAllObjects];
  objc_super v8 = [(AMUISwitcherViewController *)self viewIfLoaded];
  [v8 setNeedsLayout];
}

- (void)reloadItemWithIdentifier:(id)a3
{
  int64_t v4 = [(AMUISwitcherViewController *)self _indexOfItemWithIdentifier:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(AMUISwitcherViewController *)self reloadItemAtIndex:v4];
  }
}

- (void)reloadItemAtIndex:(int64_t)a3
{
  knownItems = self->_knownItems;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v12 = [(NSMutableDictionary *)knownItems objectForKeyedSubscript:v6];

  if (v12) {
    [(AMUISwitcherViewController *)self _detachItemRecord:v12];
  }
  uint64_t v7 = self->_knownItems;
  objc_super v8 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)v7 removeObjectForKey:v8];

  visibleItems = self->_visibleItems;
  long long v10 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)visibleItems removeObjectForKey:v10];

  long long v11 = [(AMUISwitcherViewController *)self viewIfLoaded];
  [v11 setNeedsLayout];
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(AMUISwitcherViewController *)self reload];
    [(AMUISwitcherViewController *)self _scrollToIndex:0 animated:0 completion:0];
  }
}

- (NSArray)visibleIndices
{
  v3 = [(AMUISwitcherViewController *)self viewIfLoaded];
  [v3 layoutIfNeeded];

  visibleItems = self->_visibleItems;

  return (NSArray *)[(NSMutableDictionary *)visibleItems allKeys];
}

- (NSArray)visibleItems
{
  v3 = [(AMUISwitcherViewController *)self viewIfLoaded];
  [v3 layoutIfNeeded];

  int64_t v4 = [(NSMutableDictionary *)self->_visibleItems allValues];
  uint64_t v5 = objc_msgSend(v4, "bs_map:", &__block_literal_global);

  return (NSArray *)v5;
}

id __42__AMUISwitcherViewController_visibleItems__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a2 + 48));
  }
  else
  {
    id WeakRetained = 0;
  }
  return WeakRetained;
}

- (BOOL)isScrollingInteractively
{
  LODWORD(scrollView) = [(BSUIScrollView *)self->_scrollView isScrolling];
  if (scrollView)
  {
    scrollView = self->_scrollView;
    if (scrollView)
    {
      [(BSUIScrollView *)scrollView currentScrollContext];
      LOBYTE(scrollView) = v5 == 3;
    }
  }
  return (char)scrollView;
}

- (BOOL)isScrollEnabled
{
  return [(BSUIScrollView *)self->_scrollView isScrollEnabled];
}

- (void)setScrollEnabled:(BOOL)a3
{
}

- (double)presentationProgressForIdentifier:(id)a3
{
  int64_t v4 = [(AMUISwitcherViewController *)self _indexOfItemWithIdentifier:a3];

  [(AMUISwitcherViewController *)self _presentationProgressForItemIndex:v4];
  return result;
}

- (double)presentationProgressForItem:(id)a3
{
  int64_t v4 = [(AMUISwitcherViewController *)self _indexOfItem:a3];

  [(AMUISwitcherViewController *)self _presentationProgressForItemIndex:v4];
  return result;
}

- (id)acquireUnsettledAssertionForReason:(id)a3
{
  id v4 = a3;
  unsettledAssertions = self->_unsettledAssertions;
  if (!unsettledAssertions)
  {
    objc_initWeak(&location, self);
    uint64_t v6 = (void *)MEMORY[0x263F29C18];
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"ambientSwitcherUnsettled-%p", self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __65__AMUISwitcherViewController_acquireUnsettledAssertionForReason___block_invoke;
    v12[3] = &unk_265224740;
    objc_copyWeak(&v13, &location);
    objc_super v8 = [v6 assertionWithIdentifier:v7 stateDidChangeHandler:v12];
    long long v9 = self->_unsettledAssertions;
    self->_unsettledAssertions = v8;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    unsettledAssertions = self->_unsettledAssertions;
  }
  long long v10 = [(BSCompoundAssertion *)unsettledAssertions acquireForReason:v4];

  return v10;
}

void __65__AMUISwitcherViewController_acquireUnsettledAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [v3 isActive];

  [WeakRetained _updateForUnsettled:v4];
}

- (void)viewDidLoad
{
  v34[4] = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)AMUISwitcherViewController;
  [(AMUISwitcherViewController *)&v33 viewDidLoad];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  visibleItems = self->_visibleItems;
  self->_visibleItems = v3;

  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  knownItems = self->_knownItems;
  self->_knownItems = v5;

  uint64_t v7 = [(AMUISwitcherViewController *)self view];
  id v8 = objc_alloc(MEMORY[0x263F29D58]);
  [v7 bounds];
  long long v9 = objc_msgSend(v8, "initWithFrame:");
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setPagingEnabled:1];
  [v9 setShowsHorizontalScrollIndicator:0];
  [v9 setShowsVerticalScrollIndicator:0];
  [v9 setContentInsetAdjustmentBehavior:2];
  [v9 setBounces:1];
  [v9 setDelegate:self];
  long long v10 = NSString;
  long long v11 = [(AMUISwitcherViewController *)self _accessibilityIdentifierPrefix];
  id v12 = [v10 stringWithFormat:@"%@-scroll-view", v11];
  [v9 setAccessibilityIdentifier:v12];

  scrollView = self->_scrollView;
  self->_scrollView = (BSUIScrollView *)v9;
  id v14 = v9;

  [v7 addSubview:v14];
  [v7 setClipsToBounds:1];
  uint64_t v15 = [v7 trailingAnchor];
  v16 = [v14 trailingAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 constant:0.0];
  horizontalTrailingSpacerConstraint = self->_horizontalTrailingSpacerConstraint;
  self->_horizontalTrailingSpacerConstraint = v17;

  v19 = [v7 bottomAnchor];
  v20 = [v14 bottomAnchor];
  v21 = [v19 constraintEqualToAnchor:v20 constant:0.0];
  verticalTrailingSpacerConstraint = self->_verticalTrailingSpacerConstraint;
  self->_verticalTrailingSpacerConstraint = v21;

  v31 = (void *)MEMORY[0x263F08938];
  v32 = v7;
  v23 = [v7 leadingAnchor];
  v24 = [v14 leadingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v34[0] = v25;
  v26 = [v7 topAnchor];
  v27 = [v14 topAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v29 = self->_horizontalTrailingSpacerConstraint;
  v34[1] = v28;
  v34[2] = v29;
  v34[3] = self->_verticalTrailingSpacerConstraint;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  [v31 activateConstraints:v30];

  [v32 setNeedsUpdateConstraints];
  [(AMUISwitcherViewController *)self reload];
  [(AMUISwitcherViewController *)self _scrollToIndex:0 animated:0 completion:0];
}

- (void)updateViewConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)AMUISwitcherViewController;
  [(AMUISwitcherViewController *)&v3 updateViewConstraints];
  [(AMUISwitcherViewController *)self _updateTrailingSpacerConstraints];
}

- (void)viewWillLayoutSubviews
{
  uint64_t v2 = self;
  v104.receiver = self;
  v104.super_class = (Class)AMUISwitcherViewController;
  [(AMUISwitcherViewController *)&v104 viewWillLayoutSubviews];
  v91 = [(AMUISwitcherViewController *)v2 view];
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_dataSource);
  uint64_t v4 = [(AMUISwitcherViewController *)v2 _switcherLayout];
  v86 = WeakRetained;
  uint64_t v5 = [WeakRetained switcherNumberOfItems:v2];
  unsigned __int8 v6 = [v4 isCircular];
  [(AMUISwitcherViewController *)v2 _pageSize];
  double v8 = v7;
  double v10 = v9;
  v92 = v4;
  uint64_t v11 = [v4 switcherAxis];
  uint64_t v12 = v11;
  double v13 = 3.0;
  if ((v6 & (v5 > 1)) == 0) {
    double v13 = (double)v5;
  }
  if (v11) {
    double v14 = v10;
  }
  else {
    double v14 = v8;
  }
  if (v11) {
    double v15 = 1.0;
  }
  else {
    double v15 = v13;
  }
  double v16 = v8 * v15;
  if (!v11) {
    double v13 = 1.0;
  }
  -[BSUIScrollView setContentSize:](v2->_scrollView, "setContentSize:", v16, v10 * v13);
  if (!v2) {
    double v14 = 0.0;
  }
  char v97 = v6 & (v5 > 1);
  if (v97 == 1)
  {
    if (v2->_firstLayout)
    {
      double v17 = *MEMORY[0x263F00148];
      double v18 = *(double *)(MEMORY[0x263F00148] + 8);
      if (v12) {
        double v18 = v14;
      }
      else {
        double v17 = v14;
      }
      if (!v2)
      {
        double v18 = 0.0;
        double v17 = 0.0;
      }
      -[BSUIScrollView setContentOffset:](v2->_scrollView, "setContentOffset:", v17, v18);
      v2->_firstLayout = 0;
      goto LABEL_62;
    }
    [(BSUIScrollView *)v2->_scrollView contentOffset];
    double v20 = v19;
    double v22 = v21;
    [(BSUIScrollView *)v2->_scrollView contentSize];
    if (v12) {
      double v25 = v22;
    }
    else {
      double v25 = v20;
    }
    if (v12) {
      double v23 = v24;
    }
    if (v2) {
      double v26 = v25;
    }
    else {
      double v26 = 0.0;
    }
    double v27 = v14 + v26;
    if (!v2) {
      double v23 = 0.0;
    }
    if (v27 > v23)
    {
      uint64_t v28 = v5 + v2->_topItemIndex + 1;
      do
        v28 -= v5;
      while (v28 >= v5);
      v2->_int64_t topItemIndex = v28;
      [(BSUIScrollView *)v2->_scrollView contentOffset];
      if (v12) {
        double v31 = v30;
      }
      else {
        double v31 = v29;
      }
      if (!v2) {
        double v31 = 0.0;
      }
      BOOL v32 = v12 == 0;
      double v33 = v31 - v14;
LABEL_56:
      if (v32) {
        double v29 = v33;
      }
      else {
        double v30 = v33;
      }
      if (!v2)
      {
        double v30 = 0.0;
        double v29 = 0.0;
      }
      -[BSUIScrollView setContentOffset:](v2->_scrollView, "setContentOffset:", v29, v30);
      goto LABEL_62;
    }
    [(BSUIScrollView *)v2->_scrollView contentOffset];
    if (v12) {
      double v34 = v35;
    }
    if (!v2) {
      double v34 = 0.0;
    }
    if (v34 - v14 < 0.0)
    {
      int64_t topItemIndex = v2->_topItemIndex;
      uint64_t v37 = ((topItemIndex - 1) & ~((topItemIndex - 1) >> 63)) + 1;
      if (v37 == topItemIndex) {
        int64_t v38 = v2->_topItemIndex;
      }
      else {
        int64_t v38 = topItemIndex + 1;
      }
      BOOL v32 = v37 == topItemIndex;
      unint64_t v39 = (v37 - v38) / (unint64_t)v5;
      if (!v32) {
        ++v39;
      }
      v2->_int64_t topItemIndex = topItemIndex + v5 * v39 - 1;
      [(BSUIScrollView *)v2->_scrollView contentOffset];
      if (v12) {
        double v40 = v30;
      }
      else {
        double v40 = v29;
      }
      if (!v2) {
        double v40 = 0.0;
      }
      BOOL v32 = v12 == 0;
      double v33 = v14 + v40;
      goto LABEL_56;
    }
  }
LABEL_62:
  [(BSUIScrollView *)v2->_scrollView contentOffset];
  uint64_t v90 = v12;
  if (v12) {
    double v41 = v42;
  }
  if (v2) {
    double v43 = v41;
  }
  else {
    double v43 = 0.0;
  }
  uint64_t v44 = v5 - 1;
  if (v5 >= 1)
  {
    uint64_t v45 = 0;
    uint64_t v46 = v6 & (v5 > 1);
    int64_t v96 = (uint64_t)(v43 / v14) - v46;
    uint64_t v88 = v46;
    int64_t v95 = (uint64_t)((v14 + v43 + -1.0) / v14) - v46;
    double v47 = *(double *)(MEMORY[0x263F00148] + 8);
    double v87 = *MEMORY[0x263F00148];
    uint64_t v89 = v5;
    while (1)
    {
      uint64_t v48 = v45;
      if (v97) {
        uint64_t v48 = (v45 - v2->_topItemIndex) % v5;
      }
      int64_t v49 = v48
          + v5 * (((v48 & ~(v48 >> 63)) - (v48 + ((unint64_t)v48 >> 63))) / v5 + ((unint64_t)v48 >> 63));
      uint64_t v50 = [(AMUISwitcherViewController *)v2 _shouldAdjustForRTL] ? v44 : v45;
      visibleItems = v2->_visibleItems;
      v52 = [NSNumber numberWithInteger:v50];
      uint64_t v53 = [(NSMutableDictionary *)visibleItems objectForKeyedSubscript:v52];

      if (v49 >= v96 && v49 <= v95) {
        break;
      }
      if (v53)
      {
        id v55 = objc_loadWeakRetained((id *)(v53 + 56));
        [v55 setHidden:1];
        -[_AMUISwitcherVisibleItemRecord setPresentationProgress:](v53, 0.0);
        v56 = v2->_visibleItems;
        v57 = [NSNumber numberWithInteger:v50];
        [(NSMutableDictionary *)v56 removeObjectForKey:v57];
LABEL_107:
      }
      ++v45;
      if (--v44 == -1) {
        goto LABEL_111;
      }
    }
    if (!v53)
    {
      v58 = [v86 switcher:v2 itemAtIndex:v50];
      uint64_t v53 = +[_AMUISwitcherVisibleItemRecord recordWithItem:index:forSwitcher:]((uint64_t)_AMUISwitcherVisibleItemRecord, v58, v50, v2);
      v59 = v2->_visibleItems;
      v60 = [NSNumber numberWithInteger:v50];
      [(NSMutableDictionary *)v59 setObject:v53 forKeyedSubscript:v60];

      knownItems = v2->_knownItems;
      v62 = [NSNumber numberWithInteger:v50];
      [(NSMutableDictionary *)knownItems setObject:v53 forKeyedSubscript:v62];

      if (!v53)
      {

        id v64 = 0;
        v57 = 0;
        char v93 = 1;
        goto LABEL_86;
      }
      id v63 = objc_loadWeakRetained((id *)(v53 + 64));
      if (v63)
      {
        [(AMUISwitcherViewController *)v2 addChildViewController:v63];
        [v63 didMoveToParentViewController:v2];
      }
    }
    id v64 = objc_loadWeakRetained((id *)(v53 + 48));
    v57 = objc_loadWeakRetained((id *)(v53 + 56));
    char v93 = 0;
LABEL_86:
    v65 = NSString;
    v66 = [(AMUISwitcherViewController *)v2 _accessibilityIdentifierPrefix];
    id v94 = v64;
    v67 = [v64 identifier];
    [v67 description];
    v69 = p_isa = (id *)&v2->super.super.super.isa;
    v70 = [v65 stringWithFormat:@"%@-item,identifier:%@", v66, v69];

    [v57 setAccessibilityIdentifier:v70];
    id v71 = [v57 superview];
    id v72 = p_isa[122];

    BOOL v32 = v71 == v72;
    uint64_t v2 = (AMUISwitcherViewController *)p_isa;
    if (!v32) {
      [p_isa[122] addSubview:v57];
    }
    long long v102 = 0u;
    long long v103 = 0u;
    long long v101 = 0u;
    if (v57) {
      [v57 transform];
    }
    long long v73 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v98 = *MEMORY[0x263F000D0];
    long long v99 = v73;
    long long v100 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v57 setTransform:&v98];
    [v57 frame];
    [v91 bounds];
    double v75 = v74;
    double v77 = v76;
    int v78 = [p_isa _shouldAdjustForRTL];
    double v79 = 0.0;
    uint64_t v5 = v89;
    id v55 = v94;
    if (v78) {
      objc_msgSend(v92, "spacing", 0.0);
    }
    double v80 = v79 + (double)(v49 + v88) * v14;
    double v81 = v87;
    if (!v90)
    {
      double v81 = v79 + (double)(v49 + v88) * v14;
      double v80 = v47;
    }
    if (!v2)
    {
      double v80 = 0.0;
      double v81 = 0.0;
    }
    if (v90) {
      double v82 = v80;
    }
    else {
      double v82 = v81;
    }
    if (!v2) {
      double v82 = 0.0;
    }
    double v83 = fmax(vabdd_f64(v82 - v79, v43) / v14, 0.0);
    if (v83 >= 1.0) {
      double v84 = 0.0;
    }
    else {
      double v84 = 1.0 - v83;
    }
    objc_msgSend(v57, "setFrame:", v81, v80, v75, v77);
    long long v98 = v101;
    long long v99 = v102;
    long long v100 = v103;
    [v57 setTransform:&v98];
    [v92 switcher:v2 updateItem:v94 view:v57 forPresentationProgress:v84];
    char v85 = [(BSCompoundAssertion *)v2->_unsettledAssertions isActive];
    if ((v93 & 1) == 0)
    {
      *(unsigned char *)(v53 + 16) = v85;
      [(id)v53 _updateAppearState];
    }
    -[_AMUISwitcherVisibleItemRecord setPresentationProgress:](v53, v84);
    [v57 setHidden:0];

    goto LABEL_107;
  }
LABEL_111:
  [(AMUISwitcherViewController *)v2 _sendTransitionUpdate];
}

- (double)_size:(double)a3 valueOnAxis:(double)a4
{
  if (a2) {
    double result = a4;
  }
  if (!a1) {
    return 0.0;
  }
  return result;
}

- (double)_point:(double)a3 setValue:(double)a4 onAxis:(double)a5
{
  if (!a2) {
    double result = a5;
  }
  if (!a1) {
    return 0.0;
  }
  return result;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)AMUISwitcherViewController;
  -[AMUISwitcherViewController viewWillDisappear:](&v15, sel_viewWillDisappear_);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_visibleItems allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * v9);
        if (v10 && *(void *)(v10 + 32)) {
          -[_AMUISwitcherVisibleItemRecord sendCallbackForState:animated:]((id *)v10, 1, v3);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)AMUISwitcherViewController;
  -[AMUISwitcherViewController viewDidDisappear:](&v14, sel_viewDidDisappear_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_visibleItems allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[_AMUISwitcherVisibleItemRecord sendCallbackForState:animated:](*(id **)(*((void *)&v10 + 1) + 8 * v9++), 0, v3);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)AMUISwitcherViewController;
  -[AMUISwitcherViewController viewWillAppear:](&v17, sel_viewWillAppear_);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_visibleItems allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        if (v10)
        {
          if (*(void *)(v10 + 32) == 3) {
            uint64_t v11 = 2;
          }
          else {
            uint64_t v11 = *(void *)(v10 + 32);
          }
        }
        else
        {
          uint64_t v11 = 0;
        }
        -[_AMUISwitcherVisibleItemRecord sendCallbackForState:animated:]((id *)v10, v11, v3);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v12 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      uint64_t v7 = v12;
    }
    while (v12);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)AMUISwitcherViewController;
  -[AMUISwitcherViewController viewDidAppear:](&v17, sel_viewDidAppear_);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_visibleItems allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        if (v10) {
          uint64_t v11 = *(void *)(v10 + 32);
        }
        else {
          uint64_t v11 = 0;
        }
        -[_AMUISwitcherVisibleItemRecord sendCallbackForState:animated:]((id *)v10, v11, v3);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v12 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      uint64_t v7 = v12;
    }
    while (v12);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillMoveToWindow:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_visibleItems allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        if (v10) {
          id WeakRetained = objc_loadWeakRetained((id *)(v10 + 48));
        }
        else {
          id WeakRetained = 0;
        }
        if (objc_opt_respondsToSelector()) {
          [WeakRetained switcher:self willMoveToWindow:v4];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v12 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v7 = v12;
    }
    while (v12);
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(NSMutableDictionary *)self->_visibleItems allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        if (v11) {
          id WeakRetained = objc_loadWeakRetained((id *)(v11 + 48));
        }
        else {
          id WeakRetained = 0;
        }
        if (objc_opt_respondsToSelector()) {
          [WeakRetained switcher:self didMoveToWindow:v5];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v13 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v8 = v13;
    }
    while (v13);
  }
}

- (int64_t)switcherAxis
{
  return 0;
}

- (BOOL)isCircular
{
  return 0;
}

- (double)spacing
{
  return 0.0;
}

- (void)scrollViewDidScroll:(id)a3 withContext:(id *)a4
{
  uint64_t v6 = [(AMUISwitcherViewController *)self view];
  [v6 setNeedsLayout];

  self->_lastScrollMethod = a4->var0;
}

- (void)scrollViewDidEndScrolling:(id)a3
{
  int64_t lastScrollMethod = self->_lastScrollMethod;
  self->_int64_t lastScrollMethod = 0;
  uint64_t v7 = [(AMUISwitcherViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(AMUISwitcherViewController *)self visibleItems];
    uint64_t v6 = [v5 firstObject];

    if (v6) {
      [v7 switcher:self didSettleOnItem:v6 interactive:lastScrollMethod == 3];
    }
  }

  MEMORY[0x270F9A758]();
}

- (id)_accessibilityIdentifierPrefix
{
  uint64_t v2 = [(AMUISwitcherViewController *)self _switcherLayout];
  uint64_t v3 = [v2 switcherAxis];
  id v4 = @"vertical";
  if (!v3) {
    id v4 = @"horizontal";
  }
  id v5 = v4;

  uint64_t v6 = [NSString stringWithFormat:@"amui-%@-switcher", v5];

  return v6;
}

- (id)_switcherLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  id v4 = WeakRetained;
  if (!WeakRetained) {
    id WeakRetained = self;
  }
  id v5 = WeakRetained;

  return v5;
}

- (BOOL)_scrollToIndex:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = [(AMUISwitcherViewController *)self layout];
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = a3;
    if ([(AMUISwitcherViewController *)self _shouldAdjustForRTL])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      uint64_t v10 = [WeakRetained switcherNumberOfItems:self] + ~a3;
    }
    if ([v9 isCircular])
    {
      self->_int64_t topItemIndex = v10;
      self->_firstLayout = 1;
      uint64_t v12 = [(AMUISwitcherViewController *)self viewIfLoaded];
      [v12 setNeedsLayout];

      if (v5)
      {
        uint64_t v13 = (void *)MEMORY[0x263F1CB60];
        long long v14 = [(AMUISwitcherViewController *)self view];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __65__AMUISwitcherViewController__scrollToIndex_animated_completion___block_invoke_2;
        v26[3] = &unk_265224788;
        id v27 = v8;
        [v13 transitionWithView:v14 duration:5242883 options:&__block_literal_global_50 animations:v26 completion:0.25];
      }
      else
      {
        double v24 = [(AMUISwitcherViewController *)self viewIfLoaded];
        [v24 layoutIfNeeded];

        if (v8) {
          (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
        }
      }
    }
    else
    {
      long long v15 = [(AMUISwitcherViewController *)self viewIfLoaded];
      [v15 layoutIfNeeded];

      uint64_t v16 = [v9 switcherAxis];
      [(AMUISwitcherViewController *)self _pageSize];
      if (v16) {
        double v17 = v18;
      }
      if (!self) {
        double v17 = 0.0;
      }
      double v19 = v17 * (double)v10;
      if (v16) {
        double v20 = *MEMORY[0x263F00148];
      }
      else {
        double v20 = v19;
      }
      if (!v16) {
        double v19 = *(double *)(MEMORY[0x263F00148] + 8);
      }
      if (self) {
        double v21 = v19;
      }
      else {
        double v21 = 0.0;
      }
      if (self) {
        double v22 = v20;
      }
      else {
        double v22 = 0.0;
      }
      -[BSUIScrollView setContentOffset:animated:completion:](self->_scrollView, "setContentOffset:animated:completion:", v5, v8, v22, v21);
      double v23 = [(AMUISwitcherViewController *)self viewIfLoaded];
      [v23 layoutIfNeeded];
    }
  }

  return a3 != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __65__AMUISwitcherViewController__scrollToIndex_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int64_t)_indexOfItemWithIdentifier:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (objc_opt_respondsToSelector())
  {
    int64_t v6 = [WeakRetained switcher:self indexOfItemWithIdentifier:v4];
  }
  else
  {
    uint64_t v7 = [WeakRetained switcherNumberOfItems:self];
    if (v7 < 1)
    {
LABEL_7:
      int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v8 = v7;
      int64_t v6 = 0;
      while (1)
      {
        uint64_t v9 = [WeakRetained switcher:self itemAtIndex:v6];
        uint64_t v10 = [v9 identifier];
        char v11 = BSEqualObjects();

        if (v11) {
          break;
        }
        if (v8 == ++v6) {
          goto LABEL_7;
        }
      }
    }
  }

  return v6;
}

- (int64_t)_indexOfItem:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (objc_opt_respondsToSelector())
  {
    int64_t v6 = [WeakRetained switcher:self indexOfItem:v4];
  }
  else
  {
    uint64_t v7 = [WeakRetained switcherNumberOfItems:self];
    if (v7 < 1)
    {
LABEL_7:
      int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v8 = v7;
      int64_t v6 = 0;
      while (1)
      {
        uint64_t v9 = [WeakRetained switcher:self itemAtIndex:v6];
        char v10 = BSEqualObjects();

        if (v10) {
          break;
        }
        if (v8 == ++v6) {
          goto LABEL_7;
        }
      }
    }
  }

  return v6;
}

- (void)_updateTrailingSpacerConstraints
{
  id v8 = [(AMUISwitcherViewController *)self _switcherLayout];
  [v8 spacing];
  double v4 = -v3;
  uint64_t v5 = [v8 switcherAxis];
  if (v5) {
    int64_t v6 = &OBJC_IVAR___AMUISwitcherViewController__verticalTrailingSpacerConstraint;
  }
  else {
    int64_t v6 = &OBJC_IVAR___AMUISwitcherViewController__horizontalTrailingSpacerConstraint;
  }
  if (v5) {
    uint64_t v7 = &OBJC_IVAR___AMUISwitcherViewController__horizontalTrailingSpacerConstraint;
  }
  else {
    uint64_t v7 = &OBJC_IVAR___AMUISwitcherViewController__verticalTrailingSpacerConstraint;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v6) setConstant:v4];
  [*(id *)((char *)&self->super.super.super.isa + *v7) setConstant:0.0];
}

- (void)_noteTransitionFrom:(id)a3 to:(id)a4 progress:(double)a5
{
  id v10 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained switcher:self transitioningFromItem:v10 toItem:v8 progress:a5];
  }
}

- (void)_sendTransitionUpdate
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v2 = [(NSMutableDictionary *)self->_visibleItems objectEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v3)
  {
    char v5 = 0;
    int64_t v6 = 0;
    uint64_t v7 = 0;
    char v8 = 0;
    goto LABEL_22;
  }
  uint64_t v4 = v3;
  char v5 = 0;
  int64_t v6 = 0;
  uint64_t v7 = 0;
  char v8 = 0;
  uint64_t v9 = *(void *)v21;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v2);
      }
      char v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
      if (!v11)
      {

        int64_t v6 = 0;
        goto LABEL_16;
      }
      unint64_t v12 = v11[4];
      if (v12 - 2 < 2)
      {
        uint64_t v13 = (id *)v7;
        uint64_t v7 = *(void *)(*((void *)&v20 + 1) + 8 * v10);
      }
      else
      {
        if (v12 > 1) {
          goto LABEL_12;
        }
        uint64_t v13 = v6;
        int64_t v6 = *(id **)(*((void *)&v20 + 1) + 8 * v10);
      }
      long long v14 = v11;

      unint64_t v12 = v11[4];
LABEL_12:
      if (v12 == 2)
      {
        char v8 = 1;
      }
      else if (v12 == 1)
      {
        char v5 = 1;
      }
LABEL_16:
      ++v10;
    }
    while (v4 != v10);
    uint64_t v15 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
    uint64_t v4 = v15;
  }
  while (v15);
LABEL_22:

  if (v8 & 1) != 0 || (v5)
  {
    uint64_t v16 = self;
    [(AMUISwitcherViewController *)self _beginTransitionIfNeededFromRecord:v6 toRecord:v7];
  }
  else
  {
    uint64_t v16 = self;
    [(AMUISwitcherViewController *)self _endTransitionIfNeeded];
  }
  [(AMUISwitcherViewController *)v16 _noteTransitionProgressIfNeeded];
  if (v7)
  {
    if (v6) {
      id WeakRetained = objc_loadWeakRetained(v6 + 6);
    }
    else {
      id WeakRetained = 0;
    }
    id v18 = objc_loadWeakRetained((id *)(v7 + 48));
    [(AMUISwitcherViewController *)v16 _noteTransitionFrom:WeakRetained to:v18 progress:*(double *)(v7 + 24)];
  }
}

- (BOOL)_beginTransitionIfNeededFromRecord:(id)a3 toRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  currentTransition = self->_currentTransition;
  if (!currentTransition) {
    goto LABEL_6;
  }
  if ((-[_AMUISwitcherTransitionContext hasSameItemsAsFromRecord:toRecord:]((uint64_t)currentTransition, v6, v7) & 1) == 0) {
    [(AMUISwitcherViewController *)self _endTransitionIfNeeded];
  }
  if (self->_currentTransition)
  {
    BOOL v9 = 0;
  }
  else
  {
LABEL_6:
    uint64_t v10 = [(AMUISwitcherViewController *)self delegate];
    char v11 = [(AMUISwitcherViewController *)self _switcherLayout];
    uint64_t v12 = [v11 switcherAxis];

    scrollView = self->_scrollView;
    if (v12) {
      [(BSUIScrollView *)scrollView _verticalVelocity];
    }
    else {
      [(BSUIScrollView *)scrollView _horizontalVelocity];
    }
    double v15 = v14;
    BOOL v16 = [(AMUISwitcherViewController *)self _shouldAdjustForRTL];
    double v17 = -v15;
    if (!v16) {
      double v17 = v15;
    }
    +[_AMUISwitcherTransitionContext contextWithFromRecord:toRecord:direction:interactive:]((uint64_t)_AMUISwitcherTransitionContext, v6, v7, v17 < 0.0, self->_lastScrollMethod == 3);
    id v18 = (_AMUISwitcherTransitionContext *)objc_claimAutoreleasedReturnValue();
    double v19 = self->_currentTransition;
    self->_currentTransition = v18;

    if (objc_opt_respondsToSelector()) {
      [v10 switcher:self transitionDidBegin:self->_currentTransition];
    }

    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)_endTransitionIfNeeded
{
  currentTransition = self->_currentTransition;
  if (currentTransition)
  {
    uint64_t v4 = [(AMUISwitcherViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 switcher:self transitionDidEnd:self->_currentTransition];
    }
    char v5 = self->_currentTransition;
    self->_currentTransition = 0;
  }
  return currentTransition != 0;
}

- (void)_noteTransitionProgressIfNeeded
{
  if (self->_currentTransition)
  {
    id v8 = [(AMUISwitcherViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      currentTransition = self->_currentTransition;
      if (currentTransition)
      {
        toRecord = currentTransition->_toRecord;
        if (toRecord)
        {
          double presentationProgress = toRecord->_presentationProgress;
        }
        else
        {
          fromRecord = currentTransition->_fromRecord;
          if (fromRecord) {
            double v7 = fromRecord->_presentationProgress;
          }
          else {
            double v7 = 0.0;
          }
          double presentationProgress = 1.0 - v7;
        }
      }
      else
      {
        double presentationProgress = 0.0;
      }
      objc_msgSend(v8, "switcher:transitionDidUpdate:withProgress:", self, presentationProgress);
    }
  }
}

- (CGSize)_pageSize
{
  uint64_t v3 = [(AMUISwitcherViewController *)self _switcherLayout];
  [v3 spacing];
  double v5 = v4;
  id v6 = [(AMUISwitcherViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  uint64_t v11 = [v3 switcherAxis];
  if (!v11) {
    double v8 = v5 + v8;
  }
  double v12 = -0.0;
  if (v11) {
    double v12 = v5;
  }
  double v13 = v10 + v12;

  double v14 = v8;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)_detachItemRecord:(id)a3
{
  double v4 = (id *)a3;
  uint64_t v11 = v4;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained(v4 + 7);
    id v6 = objc_loadWeakRetained(v11 + 8);
    id v7 = objc_loadWeakRetained(v11 + 6);
    *((unsigned char *)v11 + 16) = 0;
    [v11 _updateAppearState];
    v11[1] = 0;
    [v11 _updateAppearState];
  }
  else
  {
    id v6 = 0;
    id WeakRetained = 0;
    id v7 = 0;
  }
  double v8 = [WeakRetained superview];
  scrollView = self->_scrollView;

  if (v8 == scrollView) {
    [WeakRetained removeFromSuperview];
  }
  double v10 = [v6 parentViewController];

  if (v10 == self) {
    [(AMUISwitcherViewController *)self bs_removeChildViewController:v6];
  }
  if (objc_opt_respondsToSelector()) {
    [v7 invalidate];
  }
}

- (double)_presentationProgressForItemIndex:(int64_t)a3
{
  double v3 = 0.0;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    visibleItems = self->_visibleItems;
    double v5 = objc_msgSend(NSNumber, "numberWithInteger:");
    id v6 = [(NSMutableDictionary *)visibleItems objectForKeyedSubscript:v5];

    if (v6) {
      double v3 = v6[3];
    }
  }
  return v3;
}

- (BOOL)_shouldAdjustForRTL
{
  uint64_t v2 = [(AMUISwitcherViewController *)self _switcherLayout];
  if ([v2 switcherAxis]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = [(id)*MEMORY[0x263F1D020] userInterfaceLayoutDirection] == 1;
  }

  return v3;
}

- (void)_updateForUnsettled:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v4 = [(NSMutableDictionary *)self->_visibleItems allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(unsigned char **)(*((void *)&v10 + 1) + 8 * v8);
        if (v9)
        {
          v9[16] = a3;
          [v9 _updateAppearState];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (AMUISwitcherDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (AMUISwitcherDataSource *)WeakRetained;
}

- (AMUISwitcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AMUISwitcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AMUISwitcherLayout)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);

  return (AMUISwitcherLayout *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layout);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_unsettledAssertions, 0);
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_knownItems, 0);
  objc_storeStrong((id *)&self->_visibleItems, 0);
  objc_storeStrong((id *)&self->_verticalTrailingSpacerConstraint, 0);
  objc_storeStrong((id *)&self->_horizontalTrailingSpacerConstraint, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end