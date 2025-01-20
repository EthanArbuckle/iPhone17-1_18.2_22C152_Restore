@interface QLPDFItemViewController
- (BOOL)_isPreviewingUnconvertedPDF;
- (BOOL)automaticallyUpdateScrollViewContentInset;
- (BOOL)automaticallyUpdateScrollViewContentOffset;
- (BOOL)automaticallyUpdateScrollViewIndicatorInset;
- (BOOL)canBeLocked;
- (BOOL)canClickToToggleFullscreen;
- (BOOL)canOfferFormFillingForOriginalDocument;
- (BOOL)canShowMarkupButton;
- (BOOL)canSwipeToDismiss;
- (BOOL)hasUnsavedPermissionChanges;
- (BOOL)isSearching;
- (BOOL)needsToSaveChanges;
- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4;
- (BOOL)shouldDisplayAlternateEditButton;
- (PDFViewDelegatePrivate)delegateProxy;
- (UIEdgeInsets)customEdgeInsets;
- (UIEdgeInsets)customSketchOverlayInsets;
- (double)edgePanGestureWidth;
- (id)_itemUUID;
- (id)editProgressIndicatorMessage;
- (id)scrollView;
- (id)stateRestorationDictionary;
- (id)toolbarButtonsForTraitCollection:(id)a3;
- (void)_addDoubleTapGestureRecognizerIfNeeded;
- (void)_currentPDFPageChanged;
- (void)_findSessionDidBeginNotification:(id)a3;
- (void)_findSessionDidChange;
- (void)_findSessionDidEndNotification:(id)a3;
- (void)_setupPrintSessionWithSize:(CGSize)a3;
- (void)_startObservingCurrentPDFPageIndex;
- (void)_stopObservingCurrentPDFPageIndex;
- (void)applyRestoredPDFPageIndexIfPossible;
- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)dismissSearchIfNeeded;
- (void)editDetectedForMarkupViewController:(id)a3 shouldEnableMarkup:(BOOL)a4;
- (void)editor:(id)a3 needsScreenEdgePanGestureRecognition:(BOOL)a4;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)notifyStateRestorationWithUserInfo:(id)a3;
- (void)numberOfPagesWithSize:(CGSize)a3 completionHandler:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pdfDataForPageAtIndex:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)permissionViewController:(id)a3 didPickOptions:(id)a4;
- (void)permissionViewControllerWasCancelled:(id)a3;
- (void)prepareForDrawingPages:(_NSRange)a3 ofSize:(CGSize)a4;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)previewDidAppear:(BOOL)a3;
- (void)previewDidDisappear:(BOOL)a3;
- (void)previewWillAppear:(BOOL)a3;
- (void)previewWillDisappear:(BOOL)a3;
- (void)provideCurrentPageAndVisibleRectWithCompletionHandler:(id)a3;
- (void)requestLockForCurrentItem;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setDelegateProxy:(id)a3;
- (void)setHasUnsavedPermissionChanges:(BOOL)a3;
- (void)setIsSearching:(BOOL)a3;
- (void)shouldLockPreviewForUnsavedEdits:(BOOL)a3;
- (void)startFormFilling;
- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4;
- (void)transitionDidStart:(BOOL)a3;
- (void)transitionWillFinish:(BOOL)a3 didComplete:(BOOL)a4;
- (void)updateContentFrame;
- (void)updatePreviewItemDisplayState:(id)a3;
- (void)updateRemoteEdgePanGestureWidth;
- (void)updateStateRestorationWithUserInfo:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation QLPDFItemViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)QLPDFItemViewController;
  [(QLMarkupItemViewController *)&v6 viewDidLoad];
  v3 = +[UIColor _ql_markupBackgroundColor];
  v4 = [(QLPDFItemViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(QLPDFItemViewController *)self view];
  [v5 setClipsToBounds:1];
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(QLPDFItemViewController *)self _stopObservingCurrentPDFPageIndex];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100009008;
  v13[3] = &unk_100024C60;
  v13[4] = self;
  id v14 = v8;
  v12.receiver = self;
  v12.super_class = (Class)QLPDFItemViewController;
  id v11 = v8;
  [(QLMarkupItemViewController *)&v12 loadPreviewControllerWithContents:v10 context:v9 completionHandler:v13];
}

- (void)previewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)QLPDFItemViewController;
  [(QLMarkupItemViewController *)&v6 previewWillAppear:a3];
  [(QLPDFItemViewController *)self updateScrollViewContentOffset];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_findSessionDidBeginNotification:" name:UIFindInteractionFindSessionDidBeginNotification object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_findSessionDidEndNotification:" name:UIFindInteractionFindSessionDidEndNotification object:0];

  [(QLPDFItemViewController *)self applyRestoredPDFPageIndexIfPossible];
  [(QLPDFItemViewController *)self _startObservingCurrentPDFPageIndex];
}

- (void)previewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLPDFItemViewController;
  [(QLMarkupItemViewController *)&v4 previewWillDisappear:a3];
  [(QLPDFItemViewController *)self _stopObservingCurrentPDFPageIndex];
}

- (void)dealloc
{
  [(QLPDFItemViewController *)self _stopObservingCurrentPDFPageIndex];
  v3.receiver = self;
  v3.super_class = (Class)QLPDFItemViewController;
  [(QLPDFItemViewController *)&v3 dealloc];
}

- (void)_addDoubleTapGestureRecognizerIfNeeded
{
  if (_os_feature_enabled_impl())
  {
    id v8 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_eatDoubleTapGesture:"];
    [v8 setNumberOfTapsRequired:2];
    objc_super v3 = [(QLPDFItemViewController *)self delegate];
    [v8 setDelegate:v3];

    objc_super v4 = [(QLPDFItemViewController *)self delegate];
    v5 = [v4 tapGesture];
    [v5 requireGestureRecognizerToFail:v8];

    objc_super v6 = [(QLMarkupItemViewController *)self markupViewController];
    v7 = [v6 view];
    [v7 addGestureRecognizer:v8];
  }
}

- (void)_startObservingCurrentPDFPageIndex
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_isObservingCurrentPDFPageIndex
    || ([(QLMarkupItemViewController *)v2 markupViewController],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    objc_super v3 = (void *)_qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      objc_super v3 = (void *)_qlsLogHandle;
    }
    objc_super v4 = v3;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      BOOL isObservingCurrentPDFPageIndex = v2->_isObservingCurrentPDFPageIndex;
      objc_super v6 = [(QLMarkupItemViewController *)v2 markupViewController];
      v9[0] = 67109378;
      v9[1] = isObservingCurrentPDFPageIndex;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Not starting the PDF page index observation for state restoration. Already observing: %d. Content editor: %@. #AnyItemViewController", (uint8_t *)v9, 0x12u);
    }
  }
  else
  {
    v2->_BOOL isObservingCurrentPDFPageIndex = 1;
    id v8 = [(QLMarkupItemViewController *)v2 markupViewController];
    [v8 addObserver:v2 forKeyPath:@"currentPDFPageIndex" options:1 context:&off_100024C80];
  }
  objc_sync_exit(v2);
}

- (void)_stopObservingCurrentPDFPageIndex
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (obj->_isObservingCurrentPDFPageIndex)
  {
    obj->_BOOL isObservingCurrentPDFPageIndex = 0;
    objc_super v3 = [(QLMarkupItemViewController *)obj markupViewController];
    [v3 removeObserver:obj forKeyPath:@"currentPDFPageIndex" context:&off_100024C80];

    v2 = obj;
  }
  objc_sync_exit(v2);
}

- (void)previewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLPDFItemViewController;
  [(QLMarkupItemViewController *)&v4 previewDidAppear:a3];
  self->_isVisible = 1;
}

- (void)previewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)QLPDFItemViewController;
  [(QLMarkupItemViewController *)&v5 previewDidDisappear:a3];
  objc_super v4 = [(QLMarkupItemViewController *)self markupViewController];
  [v4 setShowThumbnailViewForMultipage:0];

  self->_isVisible = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLPDFItemViewController;
  [(QLMarkupItemViewController *)&v4 viewWillAppear:a3];
  [(QLPDFItemViewController *)self applyRestoredPDFPageIndexIfPossible];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  [(QLPDFItemViewController *)self dismissSearchIfNeeded];
  v10.receiver = self;
  v10.super_class = (Class)QLPDFItemViewController;
  [(QLPDFItemViewController *)&v10 presentViewController:v9 animated:v5 completion:v8];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 != &off_100024C80) {
    goto LABEL_6;
  }
  id v13 = [(QLMarkupItemViewController *)self markupViewController];
  if (v13 != v11)
  {

LABEL_6:
    v15.receiver = self;
    v15.super_class = (Class)QLPDFItemViewController;
    [(QLPDFItemViewController *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_7;
  }
  unsigned int v14 = [v10 isEqualToString:@"currentPDFPageIndex"];

  if (!v14) {
    goto LABEL_6;
  }
  [(QLPDFItemViewController *)self _currentPDFPageChanged];
LABEL_7:
}

- (void)editDetectedForMarkupViewController:(id)a3 shouldEnableMarkup:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)QLPDFItemViewController;
  [(QLMarkupItemViewController *)&v7 editDetectedForMarkupViewController:v6 shouldEnableMarkup:v4 & [(QLPDFItemViewController *)self _isPreviewingUnconvertedPDF]];
}

- (void)shouldLockPreviewForUnsavedEdits:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)QLPDFItemViewController;
  -[QLMarkupItemViewController shouldLockPreviewForUnsavedEdits:](&v6, "shouldLockPreviewForUnsavedEdits:");
  if (v3)
  {
    BOOL v5 = [(QLPDFItemViewController *)self delegate];
    [v5 previewItemViewControllerDidAcquireLock:self];
  }
  else
  {
    if (self->_isSearching) {
      return;
    }
    BOOL v5 = [(QLPDFItemViewController *)self delegate];
    [v5 previewItemViewControllerDidHandOverLock:self];
  }
}

- (void)editor:(id)a3 needsScreenEdgePanGestureRecognition:(BOOL)a4
{
  double v4 = -1.0;
  if (a4) {
    double v4 = 8.0;
  }
  if (v4 != self->_edgePanGestureWidth)
  {
    self->_edgePanGestureWidth = v4;
    [(QLPDFItemViewController *)self updateRemoteEdgePanGestureWidth];
  }
}

- (void)updateRemoteEdgePanGestureWidth
{
  if (self->_isVisible)
  {
    id v3 = [(QLPDFItemViewController *)self delegate];
    [(QLPDFItemViewController *)self edgePanGestureWidth];
    objc_msgSend(v3, "previewItemViewController:wantsToSetRemoteEdgePanGestureWidth:", self);
  }
}

- (double)edgePanGestureWidth
{
  return self->_edgePanGestureWidth;
}

- (void)notifyStateRestorationWithUserInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    BOOL v5 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    uint64_t v16 = (uint64_t)v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "State restoration: Notified state for PDF item view controller: %@ #AnyItemViewController", (uint8_t *)&v15, 0xCu);
  }
  objc_super v6 = [v4 objectForKey:@"QLStateRestorationItemUUIDKey"];
  objc_super v7 = [(QLPDFItemViewController *)self _itemUUID];
  unsigned int v8 = [v6 isEqual:v7];

  if (v8)
  {
    id v9 = [v4 objectForKey:@"QLStateRestorationPDFPageKey"];
    uint64_t v10 = (uint64_t)[v9 integerValue];
    if (v10 >= 1)
    {
      uint64_t v11 = v10;
      id v12 = _qlsLogHandle;
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        id v12 = _qlsLogHandle;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 134217984;
        uint64_t v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "State restoration: Restoring PDF page index: %ld #AnyItemViewController", (uint8_t *)&v15, 0xCu);
      }
      id v13 = +[NSNumber numberWithInteger:v11];
      restoredPDFPageIndex = self->_restoredPDFPageIndex;
      self->_restoredPDFPageIndex = v13;

      [(QLPDFItemViewController *)self applyRestoredPDFPageIndexIfPossible];
    }
  }
}

- (void)applyRestoredPDFPageIndexIfPossible
{
  if (self->_restoredPDFPageIndex)
  {
    id v3 = [(QLMarkupItemViewController *)self markupViewController];
    id v4 = [v3 contentViewController];

    if (v4)
    {
      BOOL v5 = [(QLMarkupItemViewController *)self markupViewController];
      objc_msgSend(v5, "setCurrentPDFPageIndex:", -[NSNumber unsignedIntegerValue](self->_restoredPDFPageIndex, "unsignedIntegerValue"));

      restoredPDFPageIndex = self->_restoredPDFPageIndex;
      self->_restoredPDFPageIndex = 0;
    }
  }
}

- (id)_itemUUID
{
  id v3 = [(QLPDFItemViewController *)self context];
  id v4 = [v3 item];
  BOOL v5 = [v4 fpItem];

  if (v5)
  {
    objc_super v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 hash]);
    objc_super v7 = [v6 stringValue];
  }
  else
  {
    unsigned int v8 = [(QLPDFItemViewController *)self context];
    id v9 = [v8 item];
    objc_super v6 = [v9 previewItemURL];

    if (v6)
    {
      uint64_t v10 = [v6 absoluteString];
      uint64_t v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 hash]);
      objc_super v7 = [v11 stringValue];
    }
    else
    {
      objc_super v7 = 0;
    }
  }

  return v7;
}

- (id)stateRestorationDictionary
{
  id v3 = [(QLMarkupItemViewController *)self markupViewController];
  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    BOOL v5 = [(QLPDFItemViewController *)self _itemUUID];
    if (v5)
    {
      [v4 setValue:v5 forKey:@"QLStateRestorationItemUUIDKey"];
      objc_super v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 currentPDFPageIndex]);
      [v4 setValue:v6 forKey:@"QLStateRestorationPDFPageKey"];
    }
  }
  else
  {
    objc_super v7 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      objc_super v7 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not saving the current state because there is no editor #AnyItemViewController", v9, 2u);
    }
    id v4 = 0;
  }

  return v4;
}

- (void)updatePreviewItemDisplayState:(id)a3
{
  id v4 = [a3 objectForKey:@"QLStateRestorationPDFPageKey"];
  uint64_t v5 = (uint64_t)[v4 integerValue];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    objc_super v7 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      objc_super v7 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "updatePreviewItemDisplayState: Restoring PDF page index: %ld #AnyItemViewController", (uint8_t *)&v10, 0xCu);
    }
    unsigned int v8 = +[NSNumber numberWithInteger:v6];
    restoredPDFPageIndex = self->_restoredPDFPageIndex;
    self->_restoredPDFPageIndex = v8;

    self->_disablePageChangeNotifications = 1;
    [(QLPDFItemViewController *)self applyRestoredPDFPageIndexIfPossible];
    self->_disablePageChangeNotifications = 0;
  }
}

- (void)_currentPDFPageChanged
{
  if (!self->_disablePageChangeNotifications)
  {
    id v4 = [(QLPDFItemViewController *)self stateRestorationDictionary];
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"updateStateRestorationWithUserInfo:" object:0];
    [(QLPDFItemViewController *)self performSelector:"updateStateRestorationWithUserInfo:" withObject:v4 afterDelay:1.0];
    id v3 = [(QLPDFItemViewController *)self delegate];
    [v3 previewItemViewController:self wantsToUpdatePreviewItemDisplayState:v4];
  }
}

- (void)updateStateRestorationWithUserInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    uint64_t v5 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "State restoration: Updating user info from throttle: %@ #AnyItemViewController", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = [(QLPDFItemViewController *)self delegate];
  [v6 previewItemViewController:self wantsToUpdateStateRestorationWithUserInfo:v4];
}

- (UIEdgeInsets)customEdgeInsets
{
  id v3 = [(QLPDFItemViewController *)self appearance];
  if ([v3 presentationMode] == (id)4)
  {
    double top = UIEdgeInsetsZero.top;
    CGFloat left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
  }
  else
  {
    id v8 = [(QLPDFItemViewController *)self appearance];
    [v8 peripheryInsets];
    double top = v9;
    CGFloat left = v10;
    double bottom = v11;
    CGFloat right = v12;
  }
  id v13 = [(QLPDFItemViewController *)self appearance];
  [v13 topInset];
  double v15 = v14;

  uint64_t v16 = [(QLMarkupItemViewController *)self markupViewController];
  v17 = [v16 toolbar];
  if ([v17 isHidden])
  {
    v18 = [(QLPDFItemViewController *)self appearance];
    [v18 bottomInset];
    double v20 = v19;

    if (bottom < v20) {
      double bottom = v20;
    }
  }
  else
  {
    v21 = [(QLMarkupItemViewController *)self markupViewController];
    v22 = [v21 toolbar];
    [v22 frame];
    double bottom = v23;
  }
  if (v15 >= top) {
    double top = v15;
  }

  double v24 = top;
  double v25 = left;
  double v26 = bottom;
  double v27 = right;
  result.CGFloat right = v27;
  result.double bottom = v26;
  result.CGFloat left = v25;
  result.double top = v24;
  return result;
}

- (UIEdgeInsets)customSketchOverlayInsets
{
  [(QLPDFItemViewController *)self customEdgeInsets];
  double v6 = v5 + 3.0;
  result.CGFloat right = v4;
  result.double bottom = v3;
  result.CGFloat left = v2;
  result.double top = v6;
  return result;
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)QLPDFItemViewController;
  double v5 = [(QLMarkupItemViewController *)&v20 toolbarButtonsForTraitCollection:v4];
  id v6 = [v5 mutableCopy];

  if (!v6)
  {
    id v6 = +[NSMutableArray array];
  }
  int v7 = [(QLMarkupItemViewController *)self markupViewController];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(QLMarkupItemViewController *)self markupViewController];
    unsigned int v10 = [v9 documentIsLocked] ^ 1;
  }
  else
  {
    unsigned int v10 = 1;
  }
  if (self->_isSearching)
  {
    uint64_t v11 = 0;
  }
  else
  {
    double v12 = [(QLMarkupItemViewController *)self markupViewController];
    id v13 = [v12 findInteraction];
    if (v13)
    {
      double v14 = [(QLMarkupItemViewController *)self markupViewController];
      if ([v14 annotationEditingEnabled])
      {
        uint64_t v11 = 0;
      }
      else
      {
        double v15 = [(QLMarkupItemViewController *)self markupViewController];
        uint64_t v11 = v10 & ~[v15 formFillingEnabled];
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  id v16 = [v4 horizontalSizeClass];
  if ((v11 & 1) != 0 || v16 == (id)1)
  {
    id v17 = objc_alloc((Class)QLToolbarButton);
    id v18 = [v17 initWithIdentifier:QLSearchButtonIdentifier];
    [v18 setSymbolImageName:@"magnifyingglass"];
    [v18 setPlacement:2];
    [v18 setForceToNavBar:_UIBarsDesktopNavigationBarEnabled() ^ 1];
    [v18 setAccessibilityIdentifier:QLPDFItemViewControllerBarSearchRightButtonAccessibilityIdentifier];
    [v18 setEnabled:v11];
    [v6 addObject:v18];
  }

  return v6;
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(void))a4;
  if ([v6 isEqualToString:QLSearchButtonIdentifier])
  {
    char v8 = [(QLMarkupItemViewController *)self markupViewController];
    double v9 = [v8 findInteraction];
    [v9 presentFindNavigatorShowingReplace:0];

    if (v7) {
      v7[2](v7);
    }
  }
  else if ([v6 isEqualToString:QLActionButtonIdentifier] && self->_isSearching)
  {
    [(QLPDFItemViewController *)self dismissSearchIfNeeded];
    -[QLMarkupItemViewController buttonPressedWithIdentifier:completionHandler:](&v14, "buttonPressedWithIdentifier:completionHandler:", v6, v7, v12.receiver, v12.super_class, v13.receiver, v13.super_class, self, QLPDFItemViewController);
  }
  else if ([v6 isEqualToString:@"QLInlineMarkup"])
  {
    [(QLPDFItemViewController *)self dismissSearchIfNeeded];
    -[QLMarkupItemViewController buttonPressedWithIdentifier:completionHandler:](&v13, "buttonPressedWithIdentifier:completionHandler:", v6, v7, v12.receiver, v12.super_class, self, QLPDFItemViewController, v14.receiver, v14.super_class);
  }
  else
  {
    if (self->_isSearching)
    {
      unsigned int v10 = [(QLMarkupItemViewController *)self markupViewController];
      uint64_t v11 = [v10 findInteraction];
      [v11 dismissFindNavigator];
    }
    else
    {
      unsigned int v10 = [(QLPDFItemViewController *)self view];
      [v10 endEditing:0];
    }

    -[QLMarkupItemViewController buttonPressedWithIdentifier:completionHandler:](&v12, "buttonPressedWithIdentifier:completionHandler:", v6, v7, self, QLPDFItemViewController, v13.receiver, v13.super_class, v14.receiver, v14.super_class);
  }
}

- (void)dismissSearchIfNeeded
{
  if (self->_isSearching)
  {
    id v3 = [(QLMarkupItemViewController *)self markupViewController];
    double v2 = [v3 findInteraction];
    [v2 dismissFindNavigator];
  }
}

- (BOOL)shouldDisplayAlternateEditButton
{
  double v2 = [(QLMarkupItemViewController *)self markupViewController];
  unsigned __int8 v3 = [v2 formFillingEnabled];

  return v3;
}

- (void)transitionDidStart:(BOOL)a3
{
  BOOL v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)QLPDFItemViewController;
  -[QLPDFItemViewController transitionDidStart:](&v14, "transitionDidStart:");
  double v5 = [(QLMarkupItemViewController *)self markupViewController];
  id v6 = [v5 contentViewScrollView];
  int v7 = [v6 panGestureRecognizer];
  [v7 setEnabled:0];

  char v8 = [(QLMarkupItemViewController *)self markupViewController];
  double v9 = [v8 contentViewScrollView];
  unsigned int v10 = [v9 pinchGestureRecognizer];
  [v10 setEnabled:0];

  if (v3)
  {
    uint64_t v11 = +[UIColor clearColor];
    objc_super v12 = [(QLPDFItemViewController *)self view];
    [v12 setBackgroundColor:v11];

    [(QLPDFItemViewController *)self updateScrollViewContentOffset];
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000A880;
    v13[3] = &unk_100024A30;
    v13[4] = self;
    +[UIView animateWithDuration:v13 animations:0.2];
  }
}

- (void)transitionWillFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  BOOL v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)QLPDFItemViewController;
  -[QLPDFItemViewController transitionWillFinish:didComplete:](&v24, "transitionWillFinish:didComplete:");
  int v7 = [(QLMarkupItemViewController *)self markupViewController];
  char v8 = [v7 contentViewScrollView];
  double v9 = [v8 panGestureRecognizer];
  [v9 setEnabled:1];

  unsigned int v10 = [(QLMarkupItemViewController *)self markupViewController];
  uint64_t v11 = [v10 contentViewScrollView];
  objc_super v12 = [v11 pinchGestureRecognizer];
  [v12 setEnabled:1];

  if (v5)
  {
    double v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_10000AAAC;
    v22 = &unk_100024A30;
    double v23 = self;
    objc_super v13 = &v19;
  }
  else
  {
    if (a4) {
      return;
    }
    objc_super v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    id v16 = sub_10000AB18;
    id v17 = &unk_100024A30;
    id v18 = self;
    objc_super v13 = &v14;
  }
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v13, 0.2, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
}

- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)QLPDFItemViewController;
  [(QLPDFItemViewController *)&v7 transitionDidFinish:a3 didComplete:a4];
  BOOL v5 = +[UIColor _ql_markupBackgroundColor];
  id v6 = [(QLPDFItemViewController *)self view];
  [v6 setBackgroundColor:v5];
}

- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(QLMarkupItemViewController *)self markupViewController];
  if (objc_opt_respondsToSelector())
  {
    double v9 = [(QLMarkupItemViewController *)self markupViewController];
    unsigned __int8 v10 = [v9 acceptSingleTouch:v6];

    if (v10) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  if (!self->_isSearching)
  {
    v13.receiver = self;
    v13.super_class = (Class)QLPDFItemViewController;
    BOOL v11 = [(QLMarkupItemViewController *)&v13 shouldAcceptTouch:v6 ofGestureRecognizer:v7];
    goto LABEL_8;
  }
LABEL_6:
  BOOL v11 = 0;
LABEL_8:

  return v11;
}

- (BOOL)canSwipeToDismiss
{
  return _os_feature_enabled_impl();
}

- (BOOL)canClickToToggleFullscreen
{
  return 0;
}

- (BOOL)canBeLocked
{
  BOOL v3 = [(QLMarkupItemViewController *)self markupViewController];
  if (objc_opt_respondsToSelector())
  {
    unsigned int v4 = [v3 canEncryptDocument];
    BOOL v5 = 0;
    if ([(QLMarkupItemViewController *)self shouldAllowEditingContents] && v4)
    {
      id v6 = [(QLMarkupItemViewController *)self writeOptionsForSaving];
      BOOL v5 = v6 == 0;
    }
  }
  else
  {
    [(QLMarkupItemViewController *)self shouldAllowEditingContents];
    BOOL v5 = 0;
  }

  return v5;
}

- (void)requestLockForCurrentItem
{
  BOOL v3 = [(QLPDFItemViewController *)self delegate];
  [v3 previewItemViewController:self wantsFullScreen:1];

  id v6 = objc_alloc_init(QLPDFPermissionViewController);
  [(QLPDFPermissionViewController *)v6 setDelegate:self];
  id v4 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v6];
  [v4 setModalPresentationStyle:2];
  BOOL v5 = [v4 presentationController];
  [v5 setDelegate:v6];

  [(QLPDFItemViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (id)scrollView
{
  double v2 = [(QLMarkupItemViewController *)self markupViewController];
  BOOL v3 = [v2 contentViewScrollView];

  return v3;
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(QLPDFItemViewController *)self appearance];
  id v8 = [v7 presentationMode];

  v16.receiver = self;
  v16.super_class = (Class)QLPDFItemViewController;
  [(QLMarkupItemViewController *)&v16 setAppearance:v6 animated:v4];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000AFF8;
  v12[3] = &unk_100024C90;
  id v15 = v8;
  id v9 = v6;
  id v13 = v9;
  objc_super v14 = self;
  unsigned __int8 v10 = objc_retainBlock(v12);
  BOOL v11 = v10;
  if (v4) {
    +[UIView animateWithDuration:v10 animations:0 completion:UINavigationControllerHideShowBarDuration];
  }
  else {
    ((void (*)(void *))v10[2])(v10);
  }
}

- (id)editProgressIndicatorMessage
{
  return (id)QLLocalizedString();
}

- (BOOL)automaticallyUpdateScrollViewContentOffset
{
  return 0;
}

- (BOOL)automaticallyUpdateScrollViewContentInset
{
  return _os_feature_enabled_impl() ^ 1;
}

- (BOOL)automaticallyUpdateScrollViewIndicatorInset
{
  return 0;
}

- (void)numberOfPagesWithSize:(CGSize)a3 completionHandler:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v8 = (void (**)(id, size_t))a4;
  -[QLPDFItemViewController _setupPrintSessionWithSize:](self, "_setupPrintSessionWithSize:", width, height);
  size_t NumberOfPages = CGPDFDocumentGetNumberOfPages([(QLPrintSession *)self->_currentPrintSession pdfDocumentRef]);
  v8[2](v8, NumberOfPages);
}

- (void)prepareForDrawingPages:(_NSRange)a3 ofSize:(CGSize)a4
{
  if (!self->_currentPrintSession) {
    -[QLPDFItemViewController _setupPrintSessionWithSize:](self, "_setupPrintSessionWithSize:", a3.location, a3.length, a4.width, a4.height);
  }
}

- (void)pdfDataForPageAtIndex:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  QLRunInMainThreadSync();
}

- (void)provideCurrentPageAndVisibleRectWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  QLRunInMainThread();
}

- (void)_setupPrintSessionWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = (QLPrintSession *)objc_opt_new();
  currentPrintSession = self->_currentPrintSession;
  self->_currentPrintSession = v6;

  id v8 = [(QLPDFItemViewController *)self contents];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFDataRef data = [(QLPDFItemViewController *)self contents];
  }
  else
  {
    id v9 = [(QLPDFItemViewController *)self contents];
    CFDataRef data = +[NSData dataWithContentsOfURL:v9];
  }
  unsigned __int8 v10 = CGDataProviderCreateWithCFData(data);
  BOOL v11 = CGPDFDocumentCreateWithProvider(v10);
  [(QLPrintSession *)self->_currentPrintSession setDataProvider:v10];
  [(QLPrintSession *)self->_currentPrintSession setPdfDocumentRef:v11];
  -[QLPrintSession setPrintSize:](self->_currentPrintSession, "setPrintSize:", width, height);
  CGPDFDocumentRelease(v11);
  CGDataProviderRelease(v10);
}

- (void)updateContentFrame
{
  v3.receiver = self;
  v3.super_class = (Class)QLPDFItemViewController;
  [(QLMarkupItemViewController *)&v3 updateContentFrame];
  [(QLPDFItemViewController *)self contentFrame];
  -[QLPDFItemViewController setContentFrame:](self, "setContentFrame:");
}

- (void)_findSessionDidBeginNotification:(id)a3
{
  id v4 = [a3 object];
  id v5 = [(QLMarkupItemViewController *)self markupViewController];
  id v6 = [v5 findInteraction];
  id v7 = [v6 activeFindSession];

  if (v4 == v7)
  {
    self->_isSearching = 1;
    [(QLPDFItemViewController *)self _findSessionDidChange];
  }
}

- (void)_findSessionDidEndNotification:(id)a3
{
  id v4 = a3;
  if (self->_isSearching)
  {
    id v9 = v4;
    id v5 = [v4 object];
    id v6 = [(QLMarkupItemViewController *)self markupViewController];
    id v7 = [v6 findInteraction];
    id v8 = [v7 activeFindSession];

    id v4 = v9;
    if (v5 == v8)
    {
      self->_isSearching = 0;
      [(QLPDFItemViewController *)self _findSessionDidChange];
      id v4 = v9;
    }
  }
}

- (void)_findSessionDidChange
{
  [(QLPDFItemViewController *)self updateContentFrame];
  BOOL isSearching = self->_isSearching;
  id v4 = [(QLPDFItemViewController *)self delegate];
  id v5 = v4;
  if (isSearching) {
    [v4 previewItemViewControllerDidAcquireLock:self];
  }
  else {
    [v4 previewItemViewControllerDidHandOverLock:self];
  }

  id v6 = [(QLPDFItemViewController *)self delegate];
  [v6 previewItemViewControllerWantsUpdateOverlay:self animated:0];

  id v7 = [(QLPDFItemViewController *)self delegate];
  [v7 previewItemViewControllerWantsUpdateKeyCommands:self];
}

- (BOOL)needsToSaveChanges
{
  v4.receiver = self;
  v4.super_class = (Class)QLPDFItemViewController;
  if ([(QLMarkupItemViewController *)&v4 needsToSaveChanges]) {
    return 1;
  }
  else {
    return [(QLPDFItemViewController *)self hasUnsavedPermissionChanges];
  }
}

- (void)permissionViewController:(id)a3 didPickOptions:(id)a4
{
  id v5 = a4;
  id v6 = [(QLPDFItemViewController *)self delegate];
  [v6 previewItemViewController:self wantsFullScreen:0];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000B9EC;
  v8[3] = &unk_100024990;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(QLPDFItemViewController *)self dismissViewControllerAnimated:1 completion:v8];
}

- (void)permissionViewControllerWasCancelled:(id)a3
{
  objc_super v4 = [(QLPDFItemViewController *)self delegate];
  [v4 previewItemViewController:self wantsFullScreen:0];

  [(QLPDFItemViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)canShowMarkupButton
{
  v5.receiver = self;
  v5.super_class = (Class)QLPDFItemViewController;
  BOOL v3 = [(QLMarkupItemViewController *)&v5 canShowMarkupButton];
  if (v3) {
    LOBYTE(v3) = [(QLPDFItemViewController *)self _isPreviewingUnconvertedPDF];
  }
  return v3;
}

- (BOOL)_isPreviewingUnconvertedPDF
{
  double v2 = [(QLPDFItemViewController *)self context];
  BOOL v3 = [v2 item];
  objc_super v4 = [v3 previewItemContentType];
  objc_super v5 = [UTTypePDF identifier];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)canOfferFormFillingForOriginalDocument
{
  BOOL v3 = [(QLPDFItemViewController *)self context];
  objc_super v4 = [v3 contentType];

  if (_os_feature_enabled_impl())
  {
    id v5 = v4;
    BOOL v6 = ![v5 caseInsensitiveCompare:@"com.apple.iwork.pages.pages"]
      || ![v5 caseInsensitiveCompare:@"com.apple.iwork.pages.sffpages"]
      || ![v5 caseInsensitiveCompare:@"com.apple.iwork.pages.template"]
      || [v5 caseInsensitiveCompare:@"com.apple.iwork.pages.sfftemplate"] == 0;

    id v7 = v5;
    if ([v7 caseInsensitiveCompare:@"com.microsoft.word.doc"])
    {
      id v8 = [v7 caseInsensitiveCompare:@"com.microsoft.word.docx"];

      if (v8) {
        char v9 = v6;
      }
      else {
        char v9 = 1;
      }
      if ((v9 & 1) == 0) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    BOOL v10 = 1;
    goto LABEL_15;
  }
LABEL_12:
  BOOL v10 = [(QLPDFItemViewController *)self _isPreviewingUnconvertedPDF];
LABEL_15:

  return v10;
}

- (void)startFormFilling
{
  [(QLPDFItemViewController *)self dismissSearchIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)QLPDFItemViewController;
  [(QLMarkupItemViewController *)&v3 startFormFilling];
}

- (BOOL)isSearching
{
  return self->_isSearching;
}

- (void)setIsSearching:(BOOL)a3
{
  self->_BOOL isSearching = a3;
}

- (BOOL)hasUnsavedPermissionChanges
{
  return self->_hasUnsavedPermissionChanges;
}

- (void)setHasUnsavedPermissionChanges:(BOOL)a3
{
  self->_hasUnsavedPermissionChanges = a3;
}

- (PDFViewDelegatePrivate)delegateProxy
{
  return self->_delegateProxy;
}

- (void)setDelegateProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateProxy, 0);
  objc_storeStrong((id *)&self->_restoredPDFPageIndex, 0);

  objc_storeStrong((id *)&self->_currentPrintSession, 0);
}

@end