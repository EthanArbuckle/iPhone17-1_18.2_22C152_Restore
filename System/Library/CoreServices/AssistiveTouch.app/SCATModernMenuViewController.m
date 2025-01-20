@interface SCATModernMenuViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_menuFrameIsValid:(CGRect)a3;
- (BOOL)isElementTopLevelInMenu:(id)a3;
- (BOOL)isVisible;
- (BOOL)showsFooter;
- (CGPoint)_positionForMenuDockPosition:(int64_t)a3 size:(CGSize)a4;
- (CGPoint)_positionForMenuPopoverPosition:(int64_t)a3 size:(CGSize)a4;
- (CGRect)_rectToClearIfNeededForSheet:(id)a3;
- (CGRect)frame;
- (NSMutableArray)sheetViewControllerStack;
- (SCATMenu)menu;
- (SCATModernMenuViewController)initWithMenu:(id)a3;
- (SCATPointPicker)pointPicker;
- (id)contentViewContainer;
- (id)currentSheet;
- (id)currentSheetViewController;
- (id)elementProviderForSheet:(id)a3;
- (id)exitActionElement;
- (id)extraProviderElements;
- (id)showMoreItemsPageControl;
- (int64_t)tipObject;
- (void)_determineMenuOrigin:(CGPoint *)a3 anchorPosition:(double *)a4 anchorDirection:(BOOL *)a5 shouldUseTip:(BOOL *)a6 sheet:(id)a7;
- (void)_handleShowMoreItems:(id)a3;
- (void)_updateContentSizeForSheet:(id)a3;
- (void)_updateMenuLayoutForSheet:(id)a3 sheetViewController:(id)a4 animated:(BOOL)a5;
- (void)didFocusOnContext:(id)a3 oldContext:(id)a4;
- (void)didReloadSheet:(id)a3;
- (void)flashModernMenuItem:(id)a3;
- (void)hide;
- (void)loadView;
- (void)reloadMenuVisuals;
- (void)setMenu:(id)a3;
- (void)setPointPicker:(id)a3;
- (void)setSheetViewControllerStack:(id)a3;
- (void)setShowsFooter:(BOOL)a3 numberOfPagesRequired:(unint64_t)a4;
- (void)setTipObject:(int64_t)a3;
- (void)systemApertureLayoutDidChange:(id)a3;
- (void)transitionToMenuSheet:(id)a3 fromSheet:(id)a4;
- (void)updateForGeometryChange;
- (void)updateMenuLayout;
- (void)updateMenuSheetContentSize;
- (void)updateMenuSheetForOrientationChange;
- (void)updateModernMenuItem:(id)a3;
- (void)updateViewControllerStackForSheet:(id)a3 previousSheet:(id)a4;
- (void)willBePresentedWithElement:(id)a3 pointPicker:(id)a4 sheetToShow:(id)a5;
- (void)willUnfocusFromContext:(id)a3;
@end

@implementation SCATModernMenuViewController

- (SCATModernMenuViewController)initWithMenu:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCATModernMenuViewController;
  v5 = [(SCATModernMenuViewController *)&v11 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    [(SCATModernMenuViewController *)v5 setMenu:v4];
    id v7 = objc_alloc_init((Class)NSMutableArray);
    [(SCATModernMenuViewController *)v6 setSheetViewControllerStack:v7];

    [(SCATModernMenuViewController *)v6 setOverrideUserInterfaceStyle:2];
    v8 = (SBSSystemApertureLayoutMonitor *)objc_alloc_init((Class)SBSSystemApertureLayoutMonitor);
    layoutMonitor = v6->_layoutMonitor;
    v6->_layoutMonitor = v8;

    [(SBSSystemApertureLayoutMonitor *)v6->_layoutMonitor addObserver:v6];
    v6->_foreheadRect.origin = 0u;
    v6->_foreheadRect.size = 0u;
  }

  return v6;
}

- (void)loadView
{
  v3 = -[SCATModernMenuView initWithFrame:]([SCATModernMenuView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(SCATModernMenuViewController *)self setView:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)currentSheet
{
  v2 = [(SCATModernMenuViewController *)self menu];
  v3 = [v2 currentSheet];

  return v3;
}

- (void)setTipObject:(int64_t)a3
{
  if (self->_tipObject != a3)
  {
    self->_tipObject = a3;
    id v3 = [(SCATModernMenuViewController *)self menu];
    [v3 menuTipObjectDidChange];
  }
}

- (BOOL)showsFooter
{
  v2 = [(SCATModernMenuViewController *)self menuView];
  id v3 = [v2 backgroundView];
  id v4 = [v3 containerView];
  unsigned __int8 v5 = [v4 isShowingFooterView];

  return v5;
}

- (void)setShowsFooter:(BOOL)a3 numberOfPagesRequired:(unint64_t)a4
{
  BOOL v5 = a3;
  id v7 = [(SCATModernMenuViewController *)self menuView];
  v8 = [v7 backgroundView];
  v9 = [v8 containerView];
  [v9 setShowingFooterView:v5];

  v10 = [(SCATModernMenuViewController *)self showMoreItemsPageControl];
  [v10 setNumberOfPages:a4];
  objc_super v11 = [(SCATModernMenuViewController *)self currentSheetViewController];
  objc_msgSend(v10, "setCurrentPage:", objc_msgSend(v11, "currentPage"));

  [v10 setHidesForSinglePage:0];
  if (v5)
  {
    [v10 addTarget:self action:"_handleShowMoreItems:" forControlEvents:64];
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v12 = objc_msgSend(v10, "allTargets", 0);
    id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          [v10 removeTarget:*(void *)(*((void *)&v17 + 1) + 8 * (void)v16) action:0 forControlEvents:64];
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }
  }
}

- (id)showMoreItemsPageControl
{
  v2 = [(SCATModernMenuViewController *)self menuView];
  id v3 = [v2 backgroundView];
  id v4 = [v3 containerView];
  BOOL v5 = [v4 footerView];
  v6 = [v5 moreItemsPageControl];

  return v6;
}

- (id)contentViewContainer
{
  v2 = [(SCATModernMenuViewController *)self menuView];
  id v3 = [v2 backgroundView];
  id v4 = [v3 containerView];
  BOOL v5 = [v4 contentViewContainer];

  return v5;
}

- (void)willBePresentedWithElement:(id)a3 pointPicker:(id)a4 sheetToShow:(id)a5
{
  [(SCATModernMenuViewController *)self setPointPicker:a4];
  id v9 = [(SCATModernMenuViewController *)self menuView];
  v6 = +[SCATScannerManager sharedManager];
  id v7 = [(SCATModernMenuViewController *)self menu];
  v8 = objc_msgSend(v6, "scatUIContextForDisplayID:", objc_msgSend(v7, "currentDisplayID"));

  [v8 addSubview:v9];
}

- (void)didFocusOnContext:(id)a3 oldContext:(id)a4
{
  id v34 = a3;
  BOOL v5 = [v34 element];
  v6 = [(SCATModernMenuViewController *)self showMoreItemsPageControl];

  if (v5 == v6)
  {
    id v7 = [(SCATModernMenuViewController *)self showMoreItemsPageControl];
    [v7 setScatMenuItemStyle:2];
  }
  id v8 = [v34 shouldBeTrackedByZoom];
  id v9 = v34;
  if (v8)
  {
    v10 = [v34 element];
    [v10 scatFrame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;

    long long v19 = [v34 element];
    unsigned int v20 = [v19 isGroup];

    if (v20)
    {
      v21 = [(SCATModernMenuViewController *)self showMoreItemsPageControl];
      objc_msgSend(v21, "convertRect:toView:", 0, v12, v14, v16, v18);
      double v12 = v22;
      double v14 = v23;
      double v16 = v24;
      double v18 = v25;
    }
    if (fabs(v12) == INFINITY || fabs(v14) == INFINITY)
    {
      v26 = [(SCATModernMenuViewController *)self menuView];
      [v26 frame];
      double v12 = v27;
      double v14 = v28;
    }
    v29 = +[ZoomServices sharedInstance];
    v30 = [(SCATModernMenuViewController *)self menuView];
    v31 = [v30 window];
    v32 = [v31 screen];
    v33 = [v32 displayIdentity];
    objc_msgSend(v29, "notifyZoomFocusDidChangeWithType:rect:contextId:displayId:", 3, 0, objc_msgSend(v33, "displayID"), v12, v14, v16, v18);

    id v9 = v34;
  }

  _objc_release_x1(v8, v9);
}

- (void)willUnfocusFromContext:(id)a3
{
  id v4 = [a3 element];
  BOOL v5 = [(SCATModernMenuViewController *)self showMoreItemsPageControl];

  if (v4 == v5)
  {
    id v6 = [(SCATModernMenuViewController *)self showMoreItemsPageControl];
    [v6 setScatMenuItemStyle:0];
  }
}

- (id)exitActionElement
{
  int64_t v3 = [(SCATModernMenuViewController *)self tipObject];
  id v4 = [(SCATModernMenuViewController *)self menu];
  BOOL v5 = v4;
  if (v3 == 1)
  {
    id v6 = [v4 delegate];
    id v7 = [(SCATModernMenuViewController *)self menu];
    id v8 = [v6 exitActionElementForFingersInMenu:v7];
  }
  else
  {
    id v9 = [v4 element];

    if (v9)
    {
      id v8 = 0;
      goto LABEL_7;
    }
    BOOL v5 = [(SCATModernMenuViewController *)self menuView];
    id v8 = [v5 backgroundView];
  }

LABEL_7:

  return v8;
}

- (id)extraProviderElements
{
  if ([(SCATModernMenuViewController *)self showsFooter]
    && ([(SCATModernMenuViewController *)self showMoreItemsPageControl],
        int64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [(SCATModernMenuViewController *)self showMoreItemsPageControl];
    id v7 = v4;
    BOOL v5 = +[NSArray arrayWithObjects:&v7 count:1];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)elementProviderForSheet:(id)a3
{
  return [a3 elementProvider];
}

- (void)updateForGeometryChange
{
  [(SCATModernMenuViewController *)self updateMenuSheetContentSize];

  [(SCATModernMenuViewController *)self updateMenuLayout];
}

- (void)hide
{
  id v2 = [(SCATModernMenuViewController *)self view];
  [v2 removeFromSuperview];
}

- (CGRect)frame
{
  id v2 = [(SCATModernMenuViewController *)self view];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)updateMenuLayout
{
  id v4 = [(SCATModernMenuViewController *)self currentSheet];
  double v3 = [(SCATModernMenuViewController *)self currentSheetViewController];
  [(SCATModernMenuViewController *)self _updateMenuLayoutForSheet:v4 sheetViewController:v3 animated:1];
}

- (void)updateMenuSheetForOrientationChange
{
  id v4 = [(SCATModernMenuViewController *)self menuView];
  id v2 = [v4 backgroundView];
  double v3 = [v2 containerView];
  [v3 orientationDidChange];
}

- (void)updateMenuSheetContentSize
{
  id v3 = [(SCATModernMenuViewController *)self currentSheet];
  [(SCATModernMenuViewController *)self _updateContentSizeForSheet:v3];
}

- (void)_handleShowMoreItems:(id)a3
{
  id v4 = [(SCATModernMenuViewController *)self currentSheet];
  double v5 = [(SCATModernMenuViewController *)self menu];
  [v5 willTransitionToSheet:v4];

  double v6 = [(SCATModernMenuViewController *)self currentSheetViewController];
  double v7 = [v6 collectionViewController];
  [v7 showMoreItemsButtonWasActivated];

  [(SCATModernMenuViewController *)self _updateContentSizeForSheet:v4];
  double v8 = [(SCATModernMenuViewController *)self currentSheetViewController];
  [(SCATModernMenuViewController *)self _updateMenuLayoutForSheet:v4 sheetViewController:v8 animated:0];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v9 = [v4 menuItems];
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * i) setStyle:0];
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  double v14 = [(SCATModernMenuViewController *)self currentSheetViewController];
  id v15 = [v14 currentPage];
  double v16 = [(SCATModernMenuViewController *)self showMoreItemsPageControl];
  [v16 setCurrentPage:v15];

  id v17 = v4;
  AXPerformBlockOnMainThreadAfterDelay();
}

- (id)currentSheetViewController
{
  id v2 = [(SCATModernMenuViewController *)self sheetViewControllerStack];
  id v3 = [v2 lastObject];

  return v3;
}

- (void)updateViewControllerStackForSheet:(id)a3 previousSheet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    double v8 = [(SCATModernMenuViewController *)self currentSheetViewController];
    [v8 willMoveToParentViewController:0];
    [v8 removeFromParentViewController];
  }
  else
  {
    double v9 = [(SCATModernMenuViewController *)self sheetViewControllerStack];
    [v9 enumerateObjectsUsingBlock:&stru_1001ACDF0];

    double v8 = [(SCATModernMenuViewController *)self sheetViewControllerStack];
    [v8 removeAllObjects];
  }

  id v10 = [(SCATModernMenuViewController *)self sheetViewControllerStack];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100073EB4;
  v20[3] = &unk_1001ACE18;
  id v11 = v6;
  id v21 = v11;
  uint64_t v12 = [v10 axFilterObjectsUsingBlock:v20];
  double v13 = [v12 firstObject];

  double v14 = [(SCATModernMenuViewController *)self sheetViewControllerStack];
  id v15 = v14;
  if (!v13)
  {
    long long v19 = [[SCATMenuSheetViewController alloc] initWithSheet:v11];
    [v15 addObject:v19];
    goto LABEL_8;
  }
  double v16 = [v14 lastObject];

  if (v13 != v16)
  {
    id v17 = [(SCATModernMenuViewController *)self sheetViewControllerStack];
    long long v18 = [v17 indexOfObject:v13];

    id v15 = [(SCATModernMenuViewController *)self sheetViewControllerStack];
    long long v19 = [(SCATModernMenuViewController *)self sheetViewControllerStack];
    objc_msgSend(v15, "removeObjectsInRange:", v18 + 1, (unsigned char *)-[SCATMenuSheetViewController count](v19, "count") - (v18 + 1));
LABEL_8:
  }
}

- (BOOL)isVisible
{
  id v2 = [(SCATModernMenuViewController *)self view];
  id v3 = [v2 window];
  if (v3 && ([v2 alpha], v4 > 0.0)) {
    unsigned int v5 = [v2 isHidden] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)didReloadSheet:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SCATModernMenuViewController *)self sheetViewControllerStack];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100074038;
  v9[3] = &unk_1001ACE18;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 axFilterObjectsUsingBlock:v9];
  double v8 = [v7 firstObject];
  [v8 reload];
}

- (void)reloadMenuVisuals
{
  id v4 = [(SCATModernMenuViewController *)self currentSheetViewController];
  id v2 = [v4 collectionViewController];
  id v3 = [v2 collectionView];
  [v3 reloadData];
}

- (BOOL)isElementTopLevelInMenu:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATModernMenuViewController *)self showMoreItemsPageControl];

  return v5 == v4;
}

- (void)updateModernMenuItem:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATModernMenuViewController *)self currentSheetViewController];
  [v5 updateCellForMenuItem:v4];
}

- (void)flashModernMenuItem:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATModernMenuViewController *)self currentSheetViewController];
  [v5 flashCellForMenuItem:v4];
}

- (void)transitionToMenuSheet:(id)a3 fromSheet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(SCATModernMenuViewController *)self menu];
  [v8 willTransitionToSheet:v6];

  [(SCATModernMenuViewController *)self _updateContentSizeForSheet:v6];
  [(SCATModernMenuViewController *)self updateViewControllerStackForSheet:v6 previousSheet:v7];

  double v9 = [(SCATModernMenuViewController *)self currentSheetViewController];
  [(SCATModernMenuViewController *)self addChildViewController:v9];

  id v10 = [(SCATModernMenuViewController *)self currentSheetViewController];
  [v10 didMoveToParentViewController:self];

  id v11 = [(SCATModernMenuViewController *)self contentViewContainer];
  uint64_t v12 = [(SCATModernMenuViewController *)self currentSheetViewController];
  double v13 = [v12 collectionViewController];
  double v14 = [v13 view];
  [v11 setContentView:v14];

  id v15 = [(SCATModernMenuViewController *)self menu];
  -[SCATModernMenuViewController setTipObject:](self, "setTipObject:", [v15 tipObjectForPresentingSheet:v6]);

  double v16 = [(SCATModernMenuViewController *)self currentSheetViewController];
  [(SCATModernMenuViewController *)self _updateMenuLayoutForSheet:v6 sheetViewController:v16 animated:0];

  id v17 = v6;
  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)_updateContentSizeForSheet:(id)a3
{
  id v6 = [(SCATModernMenuViewController *)self currentSheetViewController];
  id v3 = [v6 collectionViewController];
  id v4 = [v3 view];
  id v5 = [v4 superview];
  [v5 invalidateIntrinsicContentSize];
}

- (void)_updateMenuLayoutForSheet:(id)a3 sheetViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  double v9 = [(SCATModernMenuViewController *)self menuView];
  if ([v7 presentationMode])
  {
    if ([v7 presentationMode] == (id)1)
    {
      id v10 = [(SCATModernMenuViewController *)self menuView];
      id v11 = [v10 backgroundView];
      [v11 setShouldRoundMenuCorners:0];

      [(SCATModernMenuViewController *)self setShowsFooter:0 numberOfPagesRequired:1];
      uint64_t v12 = [(SCATModernMenuViewController *)self menuView];
      double v13 = [v12 backgroundView];
      double v14 = [v13 containerView];
      [v14 setShouldUseDockContentPadding:1];

      id v15 = [(SCATModernMenuViewController *)self menu];
      id v16 = [v15 dockPosition];
      id v17 = [(SCATModernMenuViewController *)self menuView];
      long long v18 = [v17 backgroundView];
      long long v19 = [v18 containerView];
      [v19 setDockPosition:v16];

      long long v20 = [(SCATModernMenuViewController *)self menuView];
      id v21 = [v20 backgroundView];
      [v21 setTip:0];

      [v9 sizeToFit];
      [v9 bounds];
      double v23 = v22;
      double v24 = +[SCATScannerManager sharedManager];
      double v25 = [(SCATModernMenuViewController *)self menu];
      v26 = objc_msgSend(v24, "scatUIContextForDisplayID:", objc_msgSend(v25, "currentDisplayID"));

      [v26 bounds];
      double v28 = v27;
      v29 = [(SCATModernMenuViewController *)self menu];
      -[SCATModernMenuViewController _positionForMenuDockPosition:size:](self, "_positionForMenuDockPosition:size:", [v29 dockPosition], v28, v23);
      double v31 = v30;
      double v33 = v32;

      objc_msgSend(v9, "setFrame:", v31, v33, v28, v23);
    }
  }
  else
  {
    id v34 = [(SCATModernMenuViewController *)self menuView];
    v35 = [v34 backgroundView];
    [v35 setShouldRoundMenuCorners:1];

    id v36 = [v8 numberOfPagesRequired];
    [(SCATModernMenuViewController *)self setShowsFooter:(unint64_t)v36 > 1 numberOfPagesRequired:v36];
    v37 = [(SCATModernMenuViewController *)self menuView];
    v38 = [v37 backgroundView];
    v39 = [v38 containerView];
    [v39 setShouldUseDockContentPadding:0];

    double v54 = 0.0;
    double v55 = 0.0;
    double v53 = 0.0;
    __int16 v52 = 0;
    [(SCATModernMenuViewController *)self _determineMenuOrigin:&v54 anchorPosition:&v53 anchorDirection:(char *)&v52 + 1 shouldUseTip:&v52 sheet:v7];
    if ((_BYTE)v52)
    {
      int v40 = HIBYTE(v52);
      v41 = [v9 backgroundView];
      v42 = v41;
      if (v40) {
        uint64_t v43 = 1;
      }
      else {
        uint64_t v43 = 2;
      }
    }
    else
    {
      v41 = [v9 backgroundView];
      v42 = v41;
      uint64_t v43 = 0;
    }
    [v41 setTip:v43];

    [v9 sizeToFit];
    double v44 = v53 - v54;
    [v9 frame];
    double v46 = v44 / v45;
    v47 = [v9 backgroundView];
    [v47 setNormalizedHorizontalTipCenter:v46];

    p_foreheadRect = &self->_foreheadRect;
    double v49 = p_foreheadRect->origin.y + p_foreheadRect->size.height;
    double v50 = v55;
    [v9 frame];
    [v9 frame];
    if (v49 > v50 && AXDeviceHasJindo())
    {
      [v9 frame];
      double v51 = v55 + p_foreheadRect->origin.y + p_foreheadRect->size.height + 5.0;
    }
    else
    {
      [v9 frame];
      double v51 = v55;
    }
    objc_msgSend(v9, "setFrame:", v54, v51);
  }
}

- (CGRect)_rectToClearIfNeededForSheet:(id)a3
{
  id v4 = a3;
  if (!v4) {
    _AXAssert();
  }
  [v4 rectToClear];
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  if (CGRectIsNull(v20) && (id)[(SCATModernMenuViewController *)self tipObject] == (id)1)
  {
    double v9 = [(SCATModernMenuViewController *)self menu];
    id v10 = [v9 delegate];
    id v11 = [(SCATModernMenuViewController *)self menu];
    [v10 menu:v11 rectToClearForFingersWithGestureSheet:1];
    CGFloat x = v12;
    CGFloat y = v13;
    CGFloat width = v14;
    CGFloat height = v15;
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)_determineMenuOrigin:(CGPoint *)a3 anchorPosition:(double *)a4 anchorDirection:(BOOL *)a5 shouldUseTip:(BOOL *)a6 sheet:(id)a7
{
  id v108 = a7;
  double v12 = [(SCATModernMenuViewController *)self menuView];
  uint64_t v13 = (uint64_t)v108;
  if (!v108)
  {
    uint64_t v13 = [(SCATModernMenuViewController *)self currentSheet];
  }
  id v109 = (id)v13;
  double height = CGSizeZero.height;
  objc_msgSend(v12, "sizeThatFits:includeTip:", 1, CGSizeZero.width, height);
  double v16 = v15;
  double v18 = v17;
  objc_msgSend(v12, "sizeThatFits:includeTip:", 0, CGSizeZero.width, height);
  double v20 = v19;
  double v22 = v21;
  if (![v109 presentationMode])
  {
    v37 = [(SCATModernMenuViewController *)self menu];
    id v38 = [v37 popoverPosition];

    if (v38)
    {
      uint64_t v23 = [(SCATModernMenuViewController *)self menu];
      -[SCATModernMenuViewController _positionForMenuPopoverPosition:size:](self, "_positionForMenuPopoverPosition:size:", [(id)v23 popoverPosition], v20, v22);
      goto LABEL_12;
    }
  }
  if ([v109 presentationMode] == (id)1)
  {
    uint64_t v23 = [(SCATModernMenuViewController *)self menu];
    -[SCATModernMenuViewController _positionForMenuDockPosition:size:](self, "_positionForMenuDockPosition:size:", [(id)v23 dockPosition], v20, v22);
LABEL_12:
    double v39 = v24;
    double v40 = v25;
    char v31 = 0;
    double v41 = 0.0;
    LOBYTE(v42) = 1;
    goto LABEL_76;
  }
  [(SCATModernMenuViewController *)self _rectToClearIfNeededForSheet:v109];
  double v27 = v26;
  double v103 = v28;
  CGFloat v106 = v29;
  double v107 = v30;
  int64_t v102 = [(SCATModernMenuViewController *)self tipObject];
  char v31 = v102 != 0;
  double v32 = [(SCATModernMenuViewController *)self menu];
  uint64_t v23 = [v32 element];

  uint64_t v33 = [(SCATModernMenuViewController *)self pointPicker];
  v101 = a6;
  if (v33)
  {
    id v34 = (void *)v33;
    if ([(id)v23 scatIsAXElement])
    {
      v35 = [(id)v23 uiElement];
      unsigned __int8 v36 = [v35 BOOLWithAXAttribute:2150];

      if (v36) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    uint64_t v23 = 0;
  }
LABEL_15:
  CGFloat v98 = v27;
  v100 = a4;
  if ((id)[(SCATModernMenuViewController *)self tipObject] == (id)2
    && ([v109 alternateTipElement],
        uint64_t v43 = objc_claimAutoreleasedReturnValue(),
        v43,
        v43))
  {
    double v44 = a5;
    uint64_t v45 = [v109 alternateTipElement];

    uint64_t v23 = v45;
  }
  else
  {
    double v44 = a5;
  }
  double v46 = [(SCATModernMenuViewController *)self menu];
  uint64_t v47 = [v46 screenPoint];

  v48 = +[SCATScannerManager sharedManager];
  double v49 = [(SCATModernMenuViewController *)self menu];
  uint64_t v50 = objc_msgSend(v48, "scatUIContextForDisplayID:", objc_msgSend(v49, "currentDisplayID"));

  v104 = (void *)v50;
  double v51 = (void *)v50;
  __int16 v52 = (void *)v47;
  [v51 bounds];
  CGFloat v57 = v53;
  CGFloat v58 = v54;
  double v59 = v55;
  double v60 = v56;
  double v96 = v20;
  if (v102) {
    double v20 = v16;
  }
  double v99 = v22;
  if (!v102) {
    double v18 = v22;
  }
  double MidX = CGRectGetMidX(*(CGRect *)&v53);
  v111.origin.CGFloat x = v57;
  v111.origin.CGFloat y = v58;
  v111.size.CGFloat width = v59;
  v111.size.double height = v60;
  double v97 = v20;
  double v62 = v20 * 0.5;
  double v39 = MidX - v20 * 0.5;
  double v63 = CGRectGetMidY(v111) - v18 * 0.5;
  BOOL v64 = (v23 | v47) != 0;
  if (v23
    && ([(id)v23 scatFrame], v112.origin.CGFloat x = sub_100040B50(v65, v66, v67, v68), !CGRectIsEmpty(v112)))
  {
    [(id)v23 scatFrame];
    +[HNDScreen convertRect:v104 toView:sub_100040B50(v73, v74, v75, v76)];
    double v71 = v69 + v77;
    double v72 = v70 + v78;
  }
  else if (v47)
  {
    [(id)v47 pointValue];
    +[HNDScreen convertPoint:toView:](HNDScreen, "convertPoint:toView:", v104);
    double v71 = v69;
    double v72 = v70;
  }
  else
  {
    double v71 = v39 + v59;
    double v72 = v60 + v63;
    double v69 = v39;
    double v70 = v63;
  }
  a5 = v44;
  a4 = v100;
  a6 = v101;
  if (v64)
  {
    double v79 = v18 + v72;
    double v80 = (v70 + v72) * 0.5;
    if (v18 + v80 > v60) {
      double v80 = 0.0;
    }
    BOOL v81 = v70 <= v18;
    if (v70 > v18) {
      double v82 = v70 - v18;
    }
    else {
      double v82 = v80;
    }
    BOOL v42 = v79 <= v60 || v81;
    if (v79 > v60) {
      double v83 = v82;
    }
    else {
      double v83 = v72;
    }
    double v41 = (v69 + v71) * 0.5;
    BOOL v84 = v41 - v62 < 0.0 || v62 + v41 > v59;
    CGFloat v105 = v83;
    if (v84)
    {
      if (v20 + v69 <= v59)
      {
        double v39 = v69;
      }
      else if (v71 - v20 > 0.0)
      {
        double v39 = v59 - (v59 - v71) - v20;
      }
    }
    else
    {
      double v39 = v41 - v62;
    }
  }
  else
  {
    CGFloat v105 = v63;
    BOOL v42 = 1;
    double v41 = v39;
  }
  v113.origin.CGFloat x = v98;
  v113.origin.CGFloat y = v103;
  v113.size.CGFloat width = v106;
  v113.size.double height = v107;
  if (CGRectIsNull(v113)) {
    goto LABEL_75;
  }
  v114.origin.CGFloat x = v98;
  v114.origin.CGFloat y = v103;
  v114.size.CGFloat width = v106;
  v114.size.double height = v107;
  v116.origin.CGFloat x = v39;
  double v85 = v105;
  v116.origin.CGFloat y = v105;
  double v86 = v20;
  v116.size.CGFloat width = v20;
  v116.size.double height = v18;
  if (!CGRectIntersectsRect(v114, v116)) {
    goto LABEL_75;
  }
  if (v102) {
    BOOL v87 = v42;
  }
  else {
    BOOL v87 = 0;
  }
  if (!v87)
  {
    double v89 = v96;
    if (v42 || v102 == 0) {
      goto LABEL_65;
    }
    goto LABEL_62;
  }
  double v85 = v103 + v107;
  if (!-[SCATModernMenuViewController _menuFrameIsValid:](self, "_menuFrameIsValid:", v39, v103 + v107))
  {
    double v85 = v103 - v18;
    double v86 = v20;
    unsigned __int8 v88 = -[SCATModernMenuViewController _menuFrameIsValid:](self, "_menuFrameIsValid:", v39, v103 - v18, v20, v18);
    double v89 = v96;
    if ((v42 || v102 == 0) | v88 & 1)
    {
      if (v88) {
        goto LABEL_60;
      }
LABEL_65:
      unint64_t v91 = 0;
      CGFloat v90 = v39;
      do
      {
        if (v91)
        {
          -[SCATModernMenuViewController _positionForMenuPopoverPosition:size:](self, "_positionForMenuPopoverPosition:size:", v91, v89, v99);
          CGFloat v90 = v92;
          double v85 = v93;
          v115.origin.CGFloat x = v98;
          v115.origin.CGFloat y = v103;
          v115.size.CGFloat width = v106;
          v115.size.double height = v107;
          v117.origin.CGFloat x = v90;
          v117.origin.CGFloat y = v85;
          v117.size.CGFloat width = v89;
          v117.size.double height = v99;
          BOOL v94 = CGRectIntersectsRect(v115, v117);
          int v95 = !v94;
          v31 &= v94;
        }
        else
        {
          int v95 = 0;
        }
        if (v91 > 7) {
          break;
        }
        ++v91;
      }
      while (!v95);
      if (!v95) {
        double v85 = v105;
      }
      CGFloat v105 = v85;
      a6 = v101;
      if (!v95) {
        goto LABEL_75;
      }
      goto LABEL_74;
    }
LABEL_62:
    double v85 = v103 - v18;
    if (-[SCATModernMenuViewController _menuFrameIsValid:](self, "_menuFrameIsValid:", v39, v103 - v18, v86, v18, *(void *)&v96))
    {
      goto LABEL_64;
    }
    double v85 = v103 + v107;
    if (-[SCATModernMenuViewController _menuFrameIsValid:](self, "_menuFrameIsValid:", v39, v103 + v107, v97, v18)) {
      goto LABEL_64;
    }
    goto LABEL_65;
  }
LABEL_60:
  char v31 = 1;
LABEL_64:
  CGFloat v90 = v39;
  a6 = v101;
LABEL_74:
  CGFloat v105 = v85;
  double v39 = v90;
LABEL_75:

  double v40 = v105;
LABEL_76:

  if (a3)
  {
    a3->CGFloat x = floor(v39);
    a3->CGFloat y = floor(v40);
  }
  if (a4) {
    *a4 = floor(v41);
  }
  if (a5) {
    *a5 = v42;
  }
  if (a6) {
    *a6 = v31 & 1;
  }
}

- (BOOL)_menuFrameIsValid:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = +[SCATScannerManager sharedManager];
  double v9 = [(SCATModernMenuViewController *)self menu];
  id v10 = objc_msgSend(v8, "scatUIContextForDisplayID:", objc_msgSend(v9, "currentDisplayID"));

  [v10 bounds];
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  LOBYTE(v9) = CGRectContainsRect(v12, v13);

  return (char)v9;
}

- (CGPoint)_positionForMenuPopoverPosition:(int64_t)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v8 = +[SCATScannerManager sharedManager];
  double v9 = [(SCATModernMenuViewController *)self menu];
  id v10 = objc_msgSend(v8, "scatUIContextForDisplayID:", objc_msgSend(v9, "currentDisplayID"));

  [v10 bounds];
  double x = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [v10 safeAreaInsets];
  double y = v14 + v19;
  double v22 = v18 - v21;
  switch(a3)
  {
    case 1:
      break;
    case 2:
      v26.origin.double x = x;
      v26.origin.double y = y;
      v26.size.double width = v16;
      v26.size.double height = v22;
      double x = floor(CGRectGetMidX(v26) + width * -0.5);
      break;
    case 3:
      double x = v16 - width;
      break;
    case 4:
      v27.origin.double x = x;
      v27.origin.double y = y;
      v27.size.double width = v16;
      v27.size.double height = v22;
      double y = floor(CGRectGetMidY(v27) + height * -0.5);
      double x = v16 - width;
      break;
    case 5:
      double x = v16 - width;
      goto LABEL_8;
    case 6:
      v28.origin.double x = x;
      v28.origin.double y = y;
      v28.size.double width = v16;
      v28.size.double height = v22;
      double x = floor(CGRectGetMidX(v28) + width * -0.5);
      goto LABEL_8;
    case 7:
LABEL_8:
      double y = v22 - height;
      break;
    case 8:
      v29.origin.double x = x;
      v29.origin.double y = y;
      v29.size.double width = v16;
      v29.size.double height = v22;
      double y = floor(CGRectGetMidY(v29) + height * -0.5);
      break;
    default:
      double x = CGPointZero.x;
      double y = CGPointZero.y;
      _AXAssert();
      break;
  }

  double v23 = x;
  double v24 = y;
  result.double y = v24;
  result.double x = v23;
  return result;
}

- (CGPoint)_positionForMenuDockPosition:(int64_t)a3 size:(CGSize)a4
{
  double height = a4.height;
  if (a4.width == CGSizeZero.width && a4.height == CGSizeZero.height)
  {
    id v8 = [(SCATModernMenuViewController *)self view];
    [v8 frame];
    double height = v9;
  }
  id v10 = +[SCATScannerManager sharedManager];
  double v11 = [(SCATModernMenuViewController *)self menu];
  CGRect v12 = objc_msgSend(v10, "scatUIContextForDisplayID:", objc_msgSend(v11, "currentDisplayID"));

  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = [(SCATModernMenuViewController *)self view];
  [v19 frame];

  if (a3 == 1) {
    double v20 = v16;
  }
  else {
    double v20 = v18 - height;
  }

  double v21 = v14;
  double v22 = v20;
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (void)systemApertureLayoutDidChange:(id)a3
{
  id v24 = a3;
  if ([v24 count] == (id)1)
  {
    p_foreheadRect = &self->_foreheadRect;
    id v5 = [v24 objectAtIndexedSubscript:0];
    [v5 CGRectValue];
    p_foreheadRect->origin.double x = v6;
    p_foreheadRect->origin.double y = v7;
    p_foreheadRect->size.double width = v8;
    p_foreheadRect->size.double height = v9;
  }
  else
  {
    if ([v24 count] != (id)2) {
      goto LABEL_6;
    }
    id v10 = &self->_foreheadRect;
    id v5 = [v24 objectAtIndexedSubscript:0];
    [v5 CGRectValue];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    double v19 = [v24 objectAtIndexedSubscript:1];
    [v19 CGRectValue];
    v27.origin.double x = v20;
    v27.origin.double y = v21;
    v27.size.double width = v22;
    v27.size.double height = v23;
    v26.origin.double x = v12;
    v26.origin.double y = v14;
    v26.size.double width = v16;
    v26.size.double height = v18;
    CGRect *v10 = CGRectUnion(v26, v27);
  }
LABEL_6:
}

- (int64_t)tipObject
{
  return self->_tipObject;
}

- (SCATMenu)menu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menu);

  return (SCATMenu *)WeakRetained;
}

- (void)setMenu:(id)a3
{
}

- (SCATPointPicker)pointPicker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pointPicker);

  return (SCATPointPicker *)WeakRetained;
}

- (void)setPointPicker:(id)a3
{
}

- (NSMutableArray)sheetViewControllerStack
{
  return self->_sheetViewControllerStack;
}

- (void)setSheetViewControllerStack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sheetViewControllerStack, 0);
  objc_destroyWeak((id *)&self->_pointPicker);
  objc_destroyWeak((id *)&self->_menu);

  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

@end