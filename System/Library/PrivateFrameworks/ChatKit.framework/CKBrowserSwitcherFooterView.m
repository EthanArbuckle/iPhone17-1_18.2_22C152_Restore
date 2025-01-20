@interface CKBrowserSwitcherFooterView
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hideShinyStatus;
- (BOOL)isMagnified;
- (BOOL)isMinifyingOnTranscriptScroll;
- (BOOL)minifiesOnSelection;
- (BOOL)scrollsLastUsedAppIconIntoView;
- (BOOL)showBorders;
- (BOOL)toggleBordersOnInterfaceStyle;
- (CGPoint)targetContentOffsetForFocusPoint:(CGPoint)a3 initialLayoutMode:(unint64_t)a4 finalLayoutMode:(unint64_t)a5;
- (CKAppStripLayout)appStripLayout;
- (CKBrowserSwitcherFooterView)init;
- (CKBrowserSwitcherFooterView)initWithFrame:(CGRect)a3 toggleBordersOnInterfaceStyle:(BOOL)a4;
- (CKBrowserSwitcherFooterViewDataSource)dataSource;
- (CKBrowserSwitcherFooterViewDelegate)delegate;
- (UICollectionView)appStripCollectionView;
- (UIEdgeInsets)insetsForAppStrip;
- (UIView)grayLine;
- (double)contentHeight;
- (double)contentHeightForCameraApps;
- (double)snapshotVerticalOffset;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateVisibilityState;
- (void)adjustMagnificationAtPoint:(CGPoint)a3 minifyImmediately:(BOOL)a4;
- (void)animateAppStripVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)appsLongPressed:(id)a3;
- (void)clearSelection;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)dealloc;
- (void)installedAppsChanged:(id)a3;
- (void)layoutSubviews;
- (void)minifyImmediately:(BOOL)a3;
- (void)reloadData;
- (void)resetScrollPosition;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)selectPluginAtIndexPath:(id)a3;
- (void)setAppStripLayout:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGrayLine:(id)a3;
- (void)setHideShinyStatus:(BOOL)a3;
- (void)setInitiallySelectedPluginIfNeeded;
- (void)setIsMagnified:(BOOL)a3;
- (void)setIsMinifyingOnTranscriptScroll:(BOOL)a3;
- (void)setMinifiesOnSelection:(BOOL)a3;
- (void)setScrollsLastUsedAppIconIntoView:(BOOL)a3;
- (void)setShowBorders:(BOOL)a3;
- (void)setSnapshotVerticalOffset:(double)a3;
- (void)setToggleBordersOnInterfaceStyle:(BOOL)a3;
- (void)touchTrackerTrackedTouches:(id)a3;
- (void)transcriptCollectionStartedScrolling:(id)a3;
- (void)updateBrowserCell:(id)a3;
- (void)updateCollectionView:(id)a3;
- (void)updatePredictiveTypeSnapshot:(id)a3;
- (void)visibleAppsChanges:(id)a3;
- (void)willMoveToSuperview:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation CKBrowserSwitcherFooterView

- (void)dealloc
{
  [(NSTimer *)self->_minificationTimer invalidate];
  minificationTimer = self->_minificationTimer;
  self->_minificationTimer = 0;

  [(UICollectionView *)self->_appStripCollectionView setDelegate:0];
  [(UICollectionView *)self->_appStripCollectionView setDataSource:0];
  appStripCollectionView = self->_appStripCollectionView;
  self->_appStripCollectionView = 0;

  appStripLayout = self->_appStripLayout;
  self->_appStripLayout = 0;

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)CKBrowserSwitcherFooterView;
  [(CKBrowserSwitcherFooterView *)&v7 dealloc];
}

- (CKBrowserSwitcherFooterView)initWithFrame:(CGRect)a3 toggleBordersOnInterfaceStyle:(BOOL)a4
{
  v41.receiver = self;
  v41.super_class = (Class)CKBrowserSwitcherFooterView;
  v5 = -[CKBrowserSwitcherFooterView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    [(CKBrowserSwitcherFooterView *)v5 setBackgroundColor:0];
    v6->_scrollsLastUsedAppIconIntoView = 1;
    v6->_minifiesOnSelection = 1;
    v6->_hideShinyStatus = 1;
    v6->_toggleBordersOnInterfaceStyle = a4;
    objc_super v7 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    v9 = (double *)MEMORY[0x1E4F1DB28];
    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v10 = +[CKUIBehavior sharedBehaviors];
      v11 = [v10 theme];
      v12 = [v11 browserSwitcherBorderColor];

      if (v12)
      {
        v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", *v9, v9[1], v9[2], v9[3]);
        v14 = +[CKUIBehavior sharedBehaviors];
        v15 = [v14 theme];
        v16 = [v15 browserSwitcherBorderColor];
        [v13 setBackgroundColor:v16];

        [(CKBrowserSwitcherFooterView *)v6 setGrayLine:v13];
        [(CKBrowserSwitcherFooterView *)v6 addSubview:v13];
      }
    }
    v17 = objc_alloc_init(CKAppStripLayout);
    appStripLayout = v6->_appStripLayout;
    v6->_appStripLayout = v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42858]), "initWithFrame:collectionViewLayout:", v6->_appStripLayout, *v9, v9[1], v9[2], v9[3]);
    for (uint64_t i = 0; i != 3; ++i)
    {
      v21 = +[CKBrowserCell classForItemType:i];
      v22 = [(objc_class *)v21 reuseIdentifier];
      [v19 registerClass:v21 forCellWithReuseIdentifier:v22];
    }
    uint64_t v23 = objc_opt_class();
    v24 = +[CKBrowserSwitcherFooterAccessoryCell supplementryViewKind];
    v25 = +[CKBrowserSwitcherFooterAccessoryCell reuseIdentifier];
    [v19 registerClass:v23 forSupplementaryViewOfKind:v24 withReuseIdentifier:v25];

    [v19 setClipsToBounds:0];
    [v19 setOpaque:0];
    v26 = [MEMORY[0x1E4F428B8] clearColor];
    [v19 setBackgroundColor:v26];

    [v19 setAlwaysBounceVertical:0];
    [v19 setAlwaysBounceHorizontal:1];
    [v19 setShowsVerticalScrollIndicator:0];
    [v19 setShowsHorizontalScrollIndicator:0];
    [v19 setAccessibilityIdentifier:@"appSelectionBrowserIdentifier"];
    [v19 setDelegate:v6];
    [v19 setDataSource:v6];
    objc_msgSend(v19, "setContentInset:", v6->_minifiedContentInsets.top, v6->_minifiedContentInsets.left, v6->_minifiedContentInsets.bottom, v6->_minifiedContentInsets.right);
    objc_storeStrong((id *)&v6->_appStripCollectionView, v19);
    [(CKBrowserSwitcherFooterView *)v6 addSubview:v19];
    objc_storeStrong((id *)&v6->_visibleView, v6->_appStripCollectionView);
    v27 = objc_alloc_init(CKAppStripPredictiveTypeSimpleFadeTransition);
    animator = v6->_animator;
    v6->_animator = (CKAppStripPredictiveTypeTransition *)v27;

    v29 = (void *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v6 action:sel_appsLongPressed_];
    [v29 setMinimumPressDuration:0.2];
    [v29 setDelegate:v6];
    [v29 _setRequiresSystemGesturesToFail:1];
    objc_storeStrong((id *)&v6->_longPressRecognizer, v29);
    [(UICollectionView *)v6->_appStripCollectionView addGestureRecognizer:v29];
    v30 = (void *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v6 action:sel_touchTrackerTrackedTouches_];
    [v30 setCancelsTouchesInView:0];
    [v30 setDelaysTouchesEnded:0];
    [v30 setMinimumPressDuration:0.0];
    [v30 setDelegate:v6];
    objc_storeStrong((id *)&v6->_touchTracker, v30);
    [(UICollectionView *)v6->_appStripCollectionView addGestureRecognizer:v30];
    v31 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v32 = [v31 userInterfaceIdiom];

    if ((v32 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v33 = [(CKBrowserSwitcherFooterView *)v6 grayLine];
      [(CKBrowserSwitcherFooterView *)v6 bringSubviewToFront:v33];
    }
    v6->_isMagnificationEnabled = 0;
    if (v6->_toggleBordersOnInterfaceStyle)
    {
      v34 = [(CKBrowserSwitcherFooterView *)v6 traitCollection];
      -[CKBrowserSwitcherFooterView setShowBorders:](v6, "setShowBorders:", [v34 userInterfaceStyle] == 2);
    }
    v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v35 addObserver:v6 selector:sel_visibleAppsChanges_ name:@"CKBrowserSelectionControllerVisibleSwitcherPluginsChangedNotification" object:0];

    v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v36 addObserver:v6 selector:sel_updateCollectionView_ name:@"CKBrowserSelectionControllerDataSourceChangedNotification" object:0];

    v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v37 addObserver:v6 selector:sel_installedAppsChanged_ name:@"CKBrowserSelectionControllerInstallationsChangedNotification" object:0];

    v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v38 addObserver:v6 selector:sel_updateBrowserCell_ name:*MEMORY[0x1E4F6B870] object:0];

    v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v39 addObserver:v6 selector:sel_transcriptCollectionStartedScrolling_ name:@"transcriptCollectionViewWillBeginDragging" object:0];
  }
  return v6;
}

- (CKBrowserSwitcherFooterView)init
{
  return -[CKBrowserSwitcherFooterView initWithFrame:toggleBordersOnInterfaceStyle:](self, "initWithFrame:toggleBordersOnInterfaceStyle:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);

  [(CKBrowserSwitcherFooterView *)self reloadData];
}

- (void)willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKBrowserSwitcherFooterView;
  -[CKBrowserSwitcherFooterView willMoveToWindow:](&v6, sel_willMoveToWindow_);
  if (!a3)
  {
    [(NSTimer *)self->_minificationTimer invalidate];
    minificationTimer = self->_minificationTimer;
    self->_minificationTimer = 0;
  }
}

- (void)willMoveToSuperview:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKBrowserSwitcherFooterView;
  -[CKBrowserSwitcherFooterView willMoveToSuperview:](&v6, sel_willMoveToSuperview_);
  if (!a3)
  {
    [(NSTimer *)self->_minificationTimer invalidate];
    minificationTimer = self->_minificationTimer;
    self->_minificationTimer = 0;
  }
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)CKBrowserSwitcherFooterView;
  [(CKBrowserSwitcherFooterView *)&v17 layoutSubviews];
  [(CKBrowserSwitcherFooterView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(CKBrowserSwitcherFooterView *)self insetsForAppStrip];
  self->_minifiedContentInsets.top = v9;
  self->_minifiedContentInsets.left = v10;
  self->_minifiedContentInsets.bottom = v11;
  self->_minifiedContentInsets.right = v12;
  -[UICollectionView setContentInset:](self->_appStripCollectionView, "setContentInset:");
  [(CKBrowserSwitcherFooterView *)self contentHeight];
  -[UICollectionView setFrame:](self->_appStripCollectionView, "setFrame:", v4, v6, v8, v13);
  -[UICollectionView _setVisibleRectEdgeInsets:](self->_appStripCollectionView, "_setVisibleRectEdgeInsets:", 0.0, v8 * -0.8, 0.0, v8 * -0.8);
  v14 = [(CKBrowserSwitcherFooterView *)self grayLine];
  [(CKBrowserSwitcherFooterView *)self bounds];
  double v16 = v15;
  if (CKPixelWidth_once_4 != -1) {
    dispatch_once(&CKPixelWidth_once_4, &__block_literal_global_82);
  }
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, v16, *(double *)&CKPixelWidth_sPixel_4);

  self->_isMagnificationEnabled = 1;
}

- (UIEdgeInsets)insetsForAppStrip
{
  if (objc_msgSend(MEMORY[0x1E4F42B08], "__ck_isUsingCompactHeightPredictionBar")
    && (+[CKUIBehavior sharedBehaviors],
        v2 = objc_claimAutoreleasedReturnValue(),
        char v3 = [v2 isAppStripInKeyboard],
        v2,
        (v3 & 1) != 0))
  {
    double v4 = 7.0;
    double v5 = 2.0;
  }
  else
  {
    double v4 = 7.0;
    double v5 = 3.0;
  }
  double v6 = v5;
  double v7 = v4;
  result.right = v7;
  result.bottom = v6;
  result.left = v4;
  result.top = v5;
  return result;
}

- (BOOL)isMagnified
{
  return self->_isMagnified;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  if (self->_toggleBordersOnInterfaceStyle)
  {
    char v3 = [(CKBrowserSwitcherFooterView *)self traitCollection];
    -[CKBrowserSwitcherFooterView setShowBorders:](self, "setShowBorders:", [v3 userInterfaceStyle] == 2);
  }

  [(CKBrowserSwitcherFooterView *)self reloadData];
}

- (void)setShowBorders:(BOOL)a3
{
}

- (BOOL)showBorders
{
  return [(CKAppStripLayout *)self->_appStripLayout shouldShowCellBorders];
}

- (void)setInitiallySelectedPluginIfNeeded
{
  char v3 = [(CKBrowserSwitcherFooterView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(UICollectionView *)self->_appStripCollectionView indexPathsForSelectedItems];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      id v8 = [(CKBrowserSwitcherFooterView *)self delegate];
      double v7 = [v8 indexPathOfCurrentlySelectedPluginInSwitcherView:self];
      [(CKBrowserSwitcherFooterView *)self selectPluginAtIndexPath:v7];
    }
  }
}

- (void)selectPluginAtIndexPath:(id)a3
{
  id v18 = a3;
  char v4 = [(UICollectionView *)self->_appStripCollectionView indexPathsForSelectedItems];
  double v5 = [v4 firstObject];

  uint64_t v6 = [(UICollectionView *)self->_appStripCollectionView indexPathsForVisibleItems];
  if ([v6 containsObject:v18])
  {
    double v7 = [(UICollectionView *)self->_appStripCollectionView cellForItemAtIndexPath:v18];
    [v7 frame];
    double v9 = v8;
    [(UICollectionView *)self->_appStripCollectionView contentOffset];
    if (v9 >= v10
      && ([v7 frame],
          double MaxX = CGRectGetMaxX(v20),
          [(UICollectionView *)self->_appStripCollectionView contentOffset],
          double v13 = v12,
          [(UICollectionView *)self->_appStripCollectionView bounds],
          MaxX <= v13 + v14))
    {
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v15 = [v18 item];
      if (v15 <= [v5 item]) {
        uint64_t v16 = 8;
      }
      else {
        uint64_t v16 = 32;
      }
    }
  }
  else
  {
    uint64_t v17 = [v18 item];
    if (v17 <= [v5 item]) {
      uint64_t v16 = 8;
    }
    else {
      uint64_t v16 = 32;
    }
  }
  if (v18)
  {
    self->_isMagnificationEnabled = 0;
    [(UICollectionView *)self->_appStripCollectionView selectItemAtIndexPath:v18 animated:0 scrollPosition:v16];
    self->_isMagnificationEnabled = 1;
  }
}

- (void)resetScrollPosition
{
  char v3 = [(CKBrowserSwitcherFooterView *)self appStripCollectionView];
  [v3 adjustedContentInset];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(CKBrowserSwitcherFooterView *)self appStripCollectionView];
  objc_msgSend(v8, "setContentOffset:", -v7, -v5);

  [(CKBrowserSwitcherFooterView *)self clearSelection];
}

- (void)clearSelection
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = [(CKBrowserSwitcherFooterView *)self appStripCollectionView];
  double v4 = [v3 indexPathsForSelectedItems];

  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
          CGFloat v11 = [(CKBrowserSwitcherFooterView *)self appStripCollectionView];
          [v11 deselectItemAtIndexPath:v10 animated:0];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (double)contentHeightForCameraApps
{
  BOOL v2 = [(CKBrowserSwitcherFooterView *)self isMagnified];
  char v3 = +[CKUIBehavior sharedBehaviors];
  double v4 = v3;
  if (v2) {
    [v3 chatMagnifiedChromeBottomInset];
  }
  else {
    [v3 cameraAppsMinimizedDockHeight];
  }
  double v6 = v5;

  return v6;
}

- (double)contentHeight
{
  if (CKIsRunningInCameraAppsClient())
  {
    [(CKBrowserSwitcherFooterView *)self contentHeightForCameraApps];
    return result;
  }
  if ([(CKBrowserSwitcherFooterView *)self isMagnified])
  {
    double v4 = +[CKUIBehavior sharedBehaviors];
    [v4 chatMagnifiedChromeBottomInset];
LABEL_9:
    double v8 = v5;

    return v8;
  }
  double v6 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v4 = +[CKUIBehavior sharedBehaviors];
    [v4 chatChromeBottomInset];
    goto LABEL_9;
  }
  if (objc_msgSend(MEMORY[0x1E4F42B08], "__ck_isUsingCompactHeightPredictionBar"))
  {
    uint64_t v9 = +[CKUIBehavior sharedBehaviors];
    char v10 = [v9 isAppStripInKeyboard];

    if (v10) {
      return 37.0;
    }
  }
  CGFloat v11 = (void *)MEMORY[0x1E4F42B08];

  [v11 predictionViewHeightForCurrentInputMode];
  return result;
}

- (UICollectionView)appStripCollectionView
{
  return self->_appStripCollectionView;
}

- (void)appsLongPressed:(id)a3
{
  id v15 = a3;
  if ([v15 state] == 1)
  {
    if (!self->_isMagnified)
    {
      double v4 = v15;
      appStripCollectionView = self;
LABEL_15:
      [v4 locationInView:appStripCollectionView];
      -[CKBrowserSwitcherFooterView adjustMagnificationAtPoint:minifyImmediately:](self, "adjustMagnificationAtPoint:minifyImmediately:", 0);
      goto LABEL_16;
    }
  }
  else if (!self->_isMagnified)
  {
    goto LABEL_16;
  }
  [v15 locationInView:self->_appStripCollectionView];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = [v15 state];
  if (v10 == 3)
  {
    [(UICollectionView *)self->_appStripCollectionView endInteractiveMovement];
LABEL_14:
    [(UICollectionView *)self->_appStripCollectionView setEditing:0];
    long long v14 = [(UICollectionView *)self->_appStripCollectionView panGestureRecognizer];
    [v14 setEnabled:1];

    appStripCollectionView = self->_appStripCollectionView;
    double v4 = v15;
    goto LABEL_15;
  }
  if (v10 == 2)
  {
    -[UICollectionView updateInteractiveMovementTargetPosition:](self->_appStripCollectionView, "updateInteractiveMovementTargetPosition:", v7, v9);
    goto LABEL_16;
  }
  if (v10 != 1)
  {
    [(UICollectionView *)self->_appStripCollectionView cancelInteractiveMovement];
    goto LABEL_14;
  }
  CGFloat v11 = self->_appStripCollectionView;
  [v15 locationInView:v11];
  long long v12 = -[UICollectionView indexPathForItemAtPoint:](v11, "indexPathForItemAtPoint:");
  if (v12)
  {
    [(UICollectionView *)self->_appStripCollectionView setEditing:1];
    [(UICollectionView *)self->_appStripCollectionView beginInteractiveMovementForItemAtIndexPath:v12];
    long long v13 = [(UICollectionView *)self->_appStripCollectionView panGestureRecognizer];
    [v13 setEnabled:0];
  }
LABEL_16:
}

- (void)touchTrackerTrackedTouches:(id)a3
{
  uint64_t v4 = [a3 state];
  if ((unint64_t)(v4 - 4) < 2)
  {
    double v5 = self;
    uint64_t v6 = 1;
  }
  else
  {
    if (v4 != 3)
    {
      if (v4 == 1) {
        self->_hasTouches = 1;
      }
      return;
    }
    double v5 = self;
    uint64_t v6 = 0;
  }

  [(CKBrowserSwitcherFooterView *)v5 minifyImmediately:v6];
}

- (void)minifyImmediately:(BOOL)a3
{
  self->_hasTouches = 0;
  if (self->_isMagnified)
  {
    BOOL v3 = a3;
    [(UILongPressGestureRecognizer *)self->_longPressRecognizer locationInView:self->_appStripCollectionView];
    -[CKBrowserSwitcherFooterView adjustMagnificationAtPoint:minifyImmediately:](self, "adjustMagnificationAtPoint:minifyImmediately:", v3);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (CGPoint)targetContentOffsetForFocusPoint:(CGPoint)a3 initialLayoutMode:(unint64_t)a4 finalLayoutMode:(unint64_t)a5
{
  double x = a3.x;
  [(UICollectionView *)self->_appStripCollectionView contentOffset];
  double v10 = v9;
  double v12 = v11;
  if (a4 != 1 || v9 != -self->_minifiedContentInsets.left)
  {
    [(CKAppStripLayout *)self->_appStripLayout collectionViewContentSizeForLayoutMode:a4];
    double v14 = v13;
    [(CKAppStripLayout *)self->_appStripLayout collectionViewContentSizeForLayoutMode:a5];
    double v10 = (x + v10) / v14 * v15 - x;
  }
  double v16 = v10;
  double v17 = v12;
  result.y = v17;
  result.double x = v16;
  return result;
}

- (void)adjustMagnificationAtPoint:(CGPoint)a3 minifyImmediately:(BOOL)a4
{
  if (self->_isMagnificationEnabled)
  {
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    if (![(UICollectionView *)self->_appStripCollectionView isEditing])
    {
      double v8 = 0.0;
      if (!a4)
      {
        double v8 = 1.5;
        if (!self->_isMagnified)
        {
          self->_isDoingMagnificationAnimation = 1;
          [(CKAppStripLayout *)self->_appStripLayout prepareForLayoutModeTransition];
          [(CKAppStripLayout *)self->_appStripLayout invalidateLayout];
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke;
          v22[3] = &unk_1E5625B88;
          v22[4] = self;
          *(CGFloat *)&v22[5] = x;
          *(CGFloat *)&v22[6] = y;
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke_2;
          v21[3] = &unk_1E5620BF0;
          v21[4] = self;
          [MEMORY[0x1E4F42FF0] animateWithDuration:6 delay:v22 usingSpringWithDamping:v21 initialSpringVelocity:0.4 options:0.0 animations:0.75 completion:0.0];
        }
      }
      [(NSTimer *)self->_minificationTimer invalidate];
      id location = 0;
      objc_initWeak(&location, self);
      double v9 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      double v15 = __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke_3;
      double v16 = &unk_1E5625C00;
      objc_copyWeak(v18, &location);
      BOOL v19 = a4;
      v18[1] = *(id *)&x;
      v18[2] = *(id *)&y;
      double v17 = self;
      double v10 = [v9 scheduledTimerWithTimeInterval:0 repeats:&v13 block:v8];
      minificationTimer = self->_minificationTimer;
      self->_minificationTimer = v10;

      double v12 = objc_msgSend(MEMORY[0x1E4F1CAC0], "currentRunLoop", v13, v14, v15, v16);
      [v12 addTimer:self->_minificationTimer forMode:*MEMORY[0x1E4F1C4B0]];

      objc_destroyWeak(v18);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 480) = 1;
  [*(id *)(*(void *)(a1 + 32) + 496) setMinimumPressDuration:0.5];
  BOOL v2 = [*(id *)(a1 + 32) delegate];
  [v2 switcherView:*(void *)(a1 + 32) didMagnify:1];

  [*(id *)(*(void *)(a1 + 32) + 408) setLayoutMode:1];
  [*(id *)(*(void *)(a1 + 32) + 408) collectionViewContentSizeForLayoutMode:1];
  double v4 = v3;
  double v5 = *(void **)(*(void *)(a1 + 32) + 416);
  [v5 bounds];
  objc_msgSend(v5, "setContentSize:", v4, v6);
  objc_msgSend(*(id *)(a1 + 32), "targetContentOffsetForFocusPoint:initialLayoutMode:finalLayoutMode:", 0, 1, *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "setContentOffset:");
  double v7 = *(void **)(*(void *)(a1 + 32) + 416);

  return [v7 performBatchUpdates:0 completion:0];
}

uint64_t __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 408) finishLayoutModeTransition];
  *(unsigned char *)(*(void *)(a1 + 32) + 481) = 0;
  return result;
}

void __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  double v5 = WeakRetained;
  if (WeakRetained && *((unsigned char *)WeakRetained + 480) && ([WeakRetained[52] isEditing] & 1) == 0)
  {
    if (*((unsigned char *)v5 + 512)) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = __CurrentTestName == 0;
    }
    if (v6)
    {
      *((unsigned char *)v5 + 481) = 1;
      [v5[51] prepareForLayoutModeTransition];
      [v5[51] invalidateLayout];
      double v7 = (void *)MEMORY[0x1E4F42FF0];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke_4;
      v10[3] = &unk_1E5625BB0;
      objc_copyWeak(&v11, (id *)(a1 + 40));
      char v13 = *(unsigned char *)(a1 + 64);
      long long v12 = *(_OWORD *)(a1 + 48);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke_5;
      v8[3] = &unk_1E5625BD8;
      objc_copyWeak(&v9, (id *)(a1 + 40));
      v8[4] = *(void *)(a1 + 32);
      [v7 animateWithDuration:2 delay:v10 usingSpringWithDamping:v8 initialSpringVelocity:0.4 options:0.0 animations:0.75 completion:0.0];
      objc_destroyWeak(&v9);
      objc_destroyWeak(&v11);
    }
  }
}

void __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke_4(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v16 = WeakRetained;
    id v3 = WeakRetained[52];
    id v4 = v16[51];
    *((unsigned char *)v16 + 480) = 0;
    double v5 = [v16 delegate];
    [v5 switcherView:v16 didMagnify:0];

    [v4 setLayoutMode:0];
    if (*(unsigned char *)(a1 + 56))
    {
      double v6 = *(double *)(a1 + 40);
    }
    else
    {
      [v3 contentOffset];
      double v7 = *((double *)v16 + 57);
      if (v8 >= 1.0 - v7)
      {
        [v3 contentOffset];
        double v10 = v9;
        [v3 contentSize];
        double v12 = v11;
        [v3 bounds];
        double v14 = v12 - v13 + -1.0;
        [v3 bounds];
        double v6 = v15;
        if (v10 <= v14) {
          double v6 = v15 * 0.5;
        }
      }
      else
      {
        double v6 = -v7;
      }
    }
    objc_msgSend(v16, "targetContentOffsetForFocusPoint:initialLayoutMode:finalLayoutMode:", 1, 0, v6, 0.0);
    objc_msgSend(v3, "setContentOffset:");
    [v3 performBatchUpdates:0 completion:0];

    WeakRetained = v16;
  }
}

void __76__CKBrowserSwitcherFooterView_adjustMagnificationAtPoint_minifyImmediately___block_invoke_5(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained[51] finishLayoutModeTransition];
    *((unsigned char *)v4 + 481) = 0;
    [v4[62] setMinimumPressDuration:0.2];
    WeakRetained = v4;
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v3 + 517)) {
      *(unsigned char *)(v3 + 517) = 0;
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  if (self->_isMagnificationEnabled && !self->_isDoingMagnificationAnimation)
  {
    id v8 = v4;
    BOOL v5 = [(UICollectionView *)self->_appStripCollectionView isEditing];
    id v4 = v8;
    if (!v5)
    {
      if (__CurrentTestName)
      {
        double v6 = *MEMORY[0x1E4F1DAD8];
        double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      }
      else
      {
        [(UILongPressGestureRecognizer *)self->_longPressRecognizer locationInView:self];
      }
      -[CKBrowserSwitcherFooterView adjustMagnificationAtPoint:minifyImmediately:](self, "adjustMagnificationAtPoint:minifyImmediately:", 0, v6, v7);
      id v4 = v8;
    }
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  self->_isMagnificationEnabled = 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  double v7 = [v25 cellForItemAtIndexPath:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 superview];
    [v7 center];
    objc_msgSend(v8, "convertPoint:toView:", self);
    double v10 = v9;
    double v12 = v11;

    double v13 = [(CKBrowserSwitcherFooterView *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      double v15 = [(CKBrowserSwitcherFooterView *)self delegate];
      double v16 = [v15 indexPathOfCurrentlySelectedPluginInSwitcherView:self];

      if (v16 && [v6 isEqual:v16])
      {
        -[CKBrowserSwitcherFooterView adjustMagnificationAtPoint:minifyImmediately:](self, "adjustMagnificationAtPoint:minifyImmediately:", self->_isMagnified, v10, v12);
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      double v16 = 0;
    }
    if ([v6 section] == 1)
    {
      uint64_t v17 = [v6 row];
      BOOL v18 = v17 == [v25 numberOfItemsInSection:1] - 1;
    }
    else
    {
      BOOL v18 = 0;
    }
    if (self->_minifiesOnSelection || v18) {
      -[CKBrowserSwitcherFooterView adjustMagnificationAtPoint:minifyImmediately:](self, "adjustMagnificationAtPoint:minifyImmediately:", 1, v10, v12);
    }
    self->_ignoreDataSourceChanges = 1;
    if ([v6 section] == 1)
    {
      uint64_t v19 = [v6 row];
      CGRect v20 = +[CKBalloonPluginManager sharedInstance];
      v21 = [v20 visibleFavoriteAppStripPlugins];
      uint64_t v22 = [v21 count] + v19;

      uint64_t v23 = [MEMORY[0x1E4F28D58] indexPathForRow:v22 inSection:0];

      id v6 = (id)v23;
    }
    v24 = [(CKBrowserSwitcherFooterView *)self delegate];
    [v24 switcherView:self didSelectPluginAtIndex:v6];

    self->_ignoreDataSourceChanges = 0;
    goto LABEL_16;
  }
LABEL_17:
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v4 = [a3 cellForItemAtIndexPath:a4];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  if ([v6 section] != 1 || objc_msgSend(v7, "section") != 1)
  {
    if (![v6 section] && objc_msgSend(v7, "section") == 1)
    {
      id v8 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:1];
      goto LABEL_14;
    }
    if (![v7 section])
    {
      double v9 = +[CKBalloonPluginManager sharedInstance];
      int v10 = [v9 isAppStoreEnabled];

      if (v10) {
        unint64_t v11 = 2;
      }
      else {
        unint64_t v11 = 1;
      }
      if ([v7 item] <= v11)
      {
        id v8 = [MEMORY[0x1E4F28D58] indexPathForItem:v11 inSection:0];
      }
      else
      {
        id v8 = v7;
      }
      goto LABEL_14;
    }
  }
  id v8 = v6;
LABEL_14:
  double v12 = v8;

  return v12;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = [(CKBrowserSwitcherFooterView *)self dataSource];
  int64_t v7 = [v6 numberOfPluginsInSwitcherView:self forSection:a4];

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v22 = 0;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CKBrowserSwitcherFooterView *)self dataSource];
  double v9 = [v8 switcherView:self modelAtIndexPath:v6 type:&v22];

  int v10 = [(objc_class *)+[CKBrowserCell classForItemType:v22] reuseIdentifier];
  unint64_t v11 = [v7 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v6];

  switch(v22)
  {
    case 2:
      [v11 setInstallation:v9];
      break;
    case 1:
      id v12 = v11;
      objc_msgSend(v12, "setPlugin:hideShinyStatus:", v9, -[CKBrowserSwitcherFooterView hideShinyStatus](self, "hideShinyStatus"));
      double v13 = [v12 browserImage];
      char v14 = [v13 layer];
      double v15 = [(CKBrowserSwitcherFooterView *)self appStripLayout];
      char v16 = [v15 shouldDimPluginCells];
      uint64_t v17 = +[CKUIBehavior sharedBehaviors];
      BOOL v18 = [v17 theme];
      uint64_t v19 = v18;
      if (v16) {
        [v18 browserAppStripDimmedPluginCellOpacity];
      }
      else {
        [v18 browserAppStripLightPluginCellOpacity];
      }
      *(float *)&double v20 = v20;
      [v14 setOpacity:v20];

      break;
    case 0:
      _IMWarn();
      break;
  }
  [v11 setShouldShowLabel:self->_isMagnified];

  return v11;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  id v8 = +[CKBrowserSwitcherFooterAccessoryCell supplementryViewKind];
  double v9 = +[CKBrowserSwitcherFooterAccessoryCell reuseIdentifier];
  int v10 = [v7 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:v9 forIndexPath:v6];

  +[CKAppStripLayout maxHeight];
  objc_msgSend(v10, "setMaxHeight:");
  +[CKAppStripLayout minHeight];
  objc_msgSend(v10, "setMinHeight:");

  return v10;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if (CKIsRunningInCameraAppsClient()) {
    goto LABEL_13;
  }
  BOOL v6 = ![v5 section] && objc_msgSend(v5, "item") == 0;
  if ([v5 section] || objc_msgSend(v5, "item") != 1)
  {
    int v8 = 0;
  }
  else
  {
    id v7 = +[CKBalloonPluginManager sharedInstance];
    int v8 = [v7 isAppStoreEnabled];
  }
  if ([v5 section] == 1)
  {
    uint64_t v9 = [v5 item];
    BOOL v10 = v9 != [(UICollectionView *)self->_appStripCollectionView numberOfItemsInSection:1]- 1;
  }
  else
  {
    BOOL v10 = 1;
  }
  uint64_t v15 = 0;
  unint64_t v11 = [(CKBrowserSwitcherFooterView *)self dataSource];
  id v12 = (id)[v11 switcherView:self modelAtIndexPath:v5 type:&v15];

  if ((v6 | v8)) {
LABEL_13:
  }
    BOOL v13 = 0;
  else {
    BOOL v13 = v15 == 1 && v10;
  }

  return v13;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7 = a5;
  uint64_t v12 = 0;
  id v8 = a4;
  uint64_t v9 = [(CKBrowserSwitcherFooterView *)self dataSource];
  BOOL v10 = [v9 switcherView:self modelAtIndexPath:v8 type:&v12];

  if (v12 == 1)
  {
    unint64_t v11 = +[CKBalloonPluginManager sharedInstance];
    [v11 updateIndexPath:v7 forPlugin:v10 isDrawerPluginPath:1];
  }
}

- (void)visibleAppsChanges:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CKBrowserSwitcherFooterView *)self scrollsLastUsedAppIconIntoView])
  {
    id v5 = [v4 userInfo];
    BOOL v6 = [v5 objectForKey:@"CKBrowserSelectionControllerInstalledPluginsKey"];

    if ([v6 count])
    {
      id v7 = [MEMORY[0x1E4F28D58] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:0];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      double v20 = v6;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v22;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
            char v14 = [(CKBrowserSwitcherFooterView *)self dataSource];
            uint64_t v15 = [v14 switcherView:self indexPathOfModelWithIdentifier:v13];

            if ([v7 item] == 0x7FFFFFFFFFFFFFFFLL
              || (uint64_t v16 = [v15 item], v16 > objc_msgSend(v7, "item")))
            {
              id v17 = v15;

              id v7 = v17;
            }

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v10);
      }

      if ([v7 item] == 0x7FFFFFFFFFFFFFFFLL
        || (uint64_t v18 = [v7 section],
            v18 >= [(UICollectionView *)self->_appStripCollectionView numberOfSections])
        || (uint64_t v19 = [v7 item],
            v19 >= -[UICollectionView numberOfItemsInSection:](self->_appStripCollectionView, "numberOfItemsInSection:", [v7 section])))
      {
        _IMWarn();
      }
      else
      {
        [(UICollectionView *)self->_appStripCollectionView scrollToItemAtIndexPath:v7 atScrollPosition:8 animated:1];
      }
      BOOL v6 = v20;
    }
  }
}

- (void)updateCollectionView:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CKBrowserSwitcherFooterView_updateCollectionView___block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __52__CKBrowserSwitcherFooterView_updateCollectionView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

- (void)installedAppsChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CKBrowserSwitcherFooterView_installedAppsChanged___block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __52__CKBrowserSwitcherFooterView_installedAppsChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

- (void)reloadData
{
  if (self->_ignoreDataSourceChanges) {
    return;
  }
  uint64_t v3 = [(UICollectionView *)self->_appStripCollectionView indexPathsForSelectedItems];
  id v8 = [v3 lastObject];

  [(CKAppStripLayout *)self->_appStripLayout invalidateCachedLayout];
  [(UICollectionView *)self->_appStripCollectionView reloadData];
  NSInteger v4 = [(UICollectionView *)self->_appStripCollectionView numberOfItemsInSection:0];
  if ([v8 item] < v4 - 1)
  {
    id v5 = v8;
    if (!v8) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v6 = [MEMORY[0x1E4F28D58] indexPathForItem:v4 - 2 inSection:0];

  id v5 = (void *)v6;
  if (v6)
  {
LABEL_6:
    BOOL isMagnificationEnabled = self->_isMagnificationEnabled;
    id v9 = v5;
    [(UICollectionView *)self->_appStripCollectionView selectItemAtIndexPath:v5 animated:0 scrollPosition:0];
    id v5 = v9;
    self->_BOOL isMagnificationEnabled = isMagnificationEnabled;
  }
LABEL_7:
}

- (void)updateBrowserCell:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__CKBrowserSwitcherFooterView_updateBrowserCell___block_invoke;
  v6[3] = &unk_1E5620AF8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __49__CKBrowserSwitcherFooterView_updateBrowserCell___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) userInfo];
  id v9 = [v2 valueForKey:@"IMBalloonPluginIdentifierKey"];

  uint64_t v3 = [*(id *)(a1 + 32) userInfo];
  id v4 = [v3 valueForKey:@"UpdatedIMBalloonPluginIconKey"];

  id v5 = [*(id *)(a1 + 40) dataSource];
  uint64_t v6 = [v5 switcherView:*(void *)(a1 + 40) indexPathOfModelWithIdentifier:v9];

  id v7 = [*(id *)(*(void *)(a1 + 40) + 416) cellForItemAtIndexPath:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 browserImage];
    [v8 setImage:v4];
  }
}

- (void)transcriptCollectionStartedScrolling:(id)a3
{
  id v4 = a3;
  if (self->_isMagnified && !self->_isMinifyingOnTranscriptScroll)
  {
    self->_isMinifyingOnTranscriptScroll = 1;
    id v5 = v4;
    [(CKBrowserSwitcherFooterView *)self minifyImmediately:1];
    id v4 = v5;
  }
}

- (void)updatePredictiveTypeSnapshot:(id)a3
{
  id v5 = a3;
  [(UIView *)self->_predictiveTypeSnapshotView removeFromSuperview];
  if (v5)
  {
    objc_storeStrong((id *)&self->_predictiveTypeSnapshotView, a3);
    if (!self->_visibleView) {
      objc_storeStrong((id *)&self->_visibleView, a3);
    }
    [(CKBrowserSwitcherFooterView *)self addSubview:v5];
  }
  [(CKBrowserSwitcherFooterView *)self _updateVisibilityState];
}

- (void)animateAppStripVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  long long v21 = (void (**)(id, uint64_t))a5;
  if (v6) {
    id v8 = self->_appStripCollectionView;
  }
  else {
    id v8 = self->_predictiveTypeSnapshotView;
  }
  [(UIView *)self->_predictiveTypeSnapshotView frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(CKBrowserSwitcherFooterView *)self snapshotVerticalOffset];
  -[UIView setFrame:](self->_predictiveTypeSnapshotView, "setFrame:", v10, v15, v12, v14);
  visibleView = self->_visibleView;
  if (visibleView != (UIView *)v8)
  {
    id v17 = v8;
    uint64_t v18 = self->_visibleView;
    self->_visibleView = v17;
    uint64_t v19 = visibleView;

    [(UIView *)v17 setHidden:0];
    [(UIView *)v17 setUserInteractionEnabled:1];
    if (v5)
    {
      if (v19 == self->_predictiveTypeSnapshotView) {
        uint64_t v20 = 1;
      }
      else {
        uint64_t v20 = -1;
      }
      [(CKAppStripPredictiveTypeTransition *)self->_animator transitionFromView:v19 toView:v17 withDirection:v20 completion:v21];

      goto LABEL_13;
    }
    [(CKBrowserSwitcherFooterView *)self _updateVisibilityState];
  }
  if (v21) {
    v21[2](v21, 1);
  }
LABEL_13:
}

- (void)_updateVisibilityState
{
  visibleView = self->_visibleView;
  if (visibleView == self->_predictiveTypeSnapshotView)
  {
    [(UIView *)visibleView setAlpha:1.0];
    double v4 = 0.0;
  }
  else
  {
    [(UIView *)self->_predictiveTypeSnapshotView setAlpha:0.0];
    double v4 = 1.0;
  }
  appStripCollectionView = self->_appStripCollectionView;

  [(UICollectionView *)appStripCollectionView setAlpha:v4];
}

- (CKBrowserSwitcherFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKBrowserSwitcherFooterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKBrowserSwitcherFooterViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (CKBrowserSwitcherFooterViewDataSource *)WeakRetained;
}

- (void)setIsMagnified:(BOOL)a3
{
  self->_isMagnified = a3;
}

- (BOOL)scrollsLastUsedAppIconIntoView
{
  return self->_scrollsLastUsedAppIconIntoView;
}

- (void)setScrollsLastUsedAppIconIntoView:(BOOL)a3
{
  self->_scrollsLastUsedAppIconIntoView = a3;
}

- (BOOL)hideShinyStatus
{
  return self->_hideShinyStatus;
}

- (void)setHideShinyStatus:(BOOL)a3
{
  self->_hideShinyStatus = a3;
}

- (BOOL)toggleBordersOnInterfaceStyle
{
  return self->_toggleBordersOnInterfaceStyle;
}

- (void)setToggleBordersOnInterfaceStyle:(BOOL)a3
{
  self->_toggleBordersOnInterfaceStyle = a3;
}

- (CKAppStripLayout)appStripLayout
{
  return self->_appStripLayout;
}

- (void)setAppStripLayout:(id)a3
{
}

- (BOOL)minifiesOnSelection
{
  return self->_minifiesOnSelection;
}

- (void)setMinifiesOnSelection:(BOOL)a3
{
  self->_minifiesOnSelection = a3;
}

- (BOOL)isMinifyingOnTranscriptScroll
{
  return self->_isMinifyingOnTranscriptScroll;
}

- (void)setIsMinifyingOnTranscriptScroll:(BOOL)a3
{
  self->_isMinifyingOnTranscriptScroll = a3;
}

- (double)snapshotVerticalOffset
{
  return self->_snapshotVerticalOffset;
}

- (void)setSnapshotVerticalOffset:(double)a3
{
  self->_snapshotVerticalOffset = a3;
}

- (UIView)grayLine
{
  return self->_grayLine;
}

- (void)setGrayLine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grayLine, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_touchTracker, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_minificationTimer, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_visibleView, 0);
  objc_storeStrong((id *)&self->_predictiveTypeSnapshotView, 0);
  objc_storeStrong((id *)&self->_appStripCollectionView, 0);

  objc_storeStrong((id *)&self->_appStripLayout, 0);
}

@end