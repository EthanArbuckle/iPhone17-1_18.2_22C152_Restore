@interface PDFHostViewController
+ (BOOL)useIOSurfaceForTiles;
+ (id)backgroundColor;
+ (id)exportedInterface;
+ (id)loadExtension:(id)a3;
+ (id)serviceViewControllerInterface;
+ (void)createHostView:(id)a3 forExtensionIdentifier:(id)a4;
+ (void)setUseIOSurfaceForTiles:(BOOL)a3;
- (BOOL)_isTouchingLollipopAtLocationOfFirstTouch:(CGPoint)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)userDidEnterPassword:(id)a3 forPasswordViewController:(id)a4;
- (CGRect)_insetBoundsInDocument;
- (CGSize)_documentViewSize;
- (UIEdgeInsets)_pdfViewInsets;
- (UIEdgeInsets)_pdfViewSafeAreaInsets;
- (double)_hostScrollViewZoomScale;
- (double)maximumZoomScale;
- (double)minimumZoomScale;
- (id)pageNumberIndicator;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)currentPageIndex;
- (int64_t)pageCount;
- (unint64_t)_typeForGestureRecognizer:(id)a3;
- (void)_appendPasswordUI;
- (void)_endPDFViewRotationAnimated:(BOOL)a3 withUpdate:(BOOL)a4;
- (void)_gestureInit;
- (void)_pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5 completion:(id)a6;
- (void)_resetPDFHostViewControllerViews;
- (void)_setMaximumZoomScale:(double)a3;
- (void)_setMinimumZoomScale:(double)a3;
- (void)_setupExtensionInterruptionBlock;
- (void)beginPDFViewRotation;
- (void)cancelFindString;
- (void)cancelFindStringWithHighlightsCleared:(BOOL)a3;
- (void)clearSearchHighlights;
- (void)completePointerInteractionRegionForRequest:(id)a3;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)didCopy:(id)a3;
- (void)didLongPressPageIndex:(int64_t)a3 atLocation:(CGPoint)a4 withAnnotationRect:(CGRect)a5;
- (void)didLongPressURL:(id)a3 atLocation:(CGPoint)a4 withAnnotationRect:(CGRect)a5;
- (void)documentIsLocked:(BOOL)a3;
- (void)endPDFViewRotation;
- (void)endPDFViewRotationWithContentInset:(UIEdgeInsets)a3;
- (void)findString:(id)a3 withOptions:(unint64_t)a4;
- (void)findStringUpdate:(unint64_t)a3 done:(BOOL)a4;
- (void)focusOnSearchResultAtIndex:(unint64_t)a3;
- (void)goToDestination:(int64_t)a3 point:(CGPoint)a4;
- (void)goToPageIndex:(int64_t)a3;
- (void)goToPageIndex:(int64_t)a3 pageFrame:(CGRect)a4;
- (void)goToPageIndex:(int64_t)a3 withViewFrustum:(CGRect)a4;
- (void)goToURL:(id)a3 atLocation:(CGPoint)a4;
- (void)handleGesture:(id)a3;
- (void)killExtensionProcess;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)recievedSnapshotViewRect:(id)a3;
- (void)selectAll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentData:(id)a3 withScrollView:(id)a4;
- (void)setHasSelection:(BOOL)a3;
- (void)setTextSelectionPoints:(CGPoint)a3 right:(CGPoint)a4;
- (void)setup;
- (void)setupDocumentViewSize:(CGSize)a3;
- (void)showSelectionRect:(CGRect)a3;
- (void)showTextSelectionMenu:(BOOL)a3 selectionRect:(CGRect)a4;
- (void)snapshotViewRect:(CGRect)a3 snapshotWidth:(id)a4 afterScreenUpdates:(BOOL)a5 withResult:(id)a6;
- (void)updateAutoScaleFactor;
- (void)updateCurrentPageIndex:(int64_t)a3;
- (void)updateDocumentIsLocked:(BOOL)a3;
- (void)updateDocumentViewSize;
- (void)updatePDFViewLayout;
- (void)updatePageCount:(int64_t)a3;
- (void)viewDidLayoutSubviews;
- (void)zoomToRect:(CGRect)a3;
@end

@implementation PDFHostViewController

+ (BOOL)useIOSurfaceForTiles
{
  return sUseIOSurfaceForTiles == 1;
}

+ (void)setUseIOSurfaceForTiles:(BOOL)a3
{
  sUseIOSurfaceForTiles = a3;
}

+ (void)createHostView:(id)a3 forExtensionIdentifier:(id)a4
{
  id v5 = a3;
  v6 = (__CFString *)a4;
  if (v6) {
    v7 = v6;
  }
  else {
    v7 = @"com.apple.PDFKit.PDFExtensionView";
  }
  v8 = +[PDFHostViewController loadExtension:v7];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__PDFHostViewController_createHostView_forExtensionIdentifier___block_invoke;
  v11[3] = &unk_264204470;
  id v12 = v8;
  id v13 = v5;
  id v9 = v5;
  id v10 = v8;
  [v10 instantiateViewControllerWithInputItems:0 connectionHandler:v11];
}

void __63__PDFHostViewController_createHostView_forExtensionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v19[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = v6;
    v8 = [*(id *)(a1 + 32) _extensionContextForUUID:v5];
    id v9 = objc_alloc_init(PDFHostViewControllerPrivate);
    id v10 = (void *)v7[186];
    v7[186] = v9;

    objc_storeStrong((id *)(v7[186] + 8), *(id *)(a1 + 32));
    v11 = [v8 _auxiliaryConnection];
    uint64_t v12 = [v11 remoteObjectProxy];
    uint64_t v13 = v7[186];
    v14 = *(void **)(v13 + 16);
    *(void *)(v13 + 16) = v12;

    [v8 setHostViewController:v7];
    if (!*(void *)(v7[186] + 16))
    {
      NSLog(&cfstr_Pdfhostviewcon.isa);
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    if (sUseIOSurfaceForTiles != 2)
    {
      v15 = *(void **)(v7[186] + 16);
      v18[0] = @"function";
      v18[1] = @"value";
      v19[0] = @"setUseIOSurfaceForTiles";
      v16 = [NSNumber numberWithInt:sUseIOSurfaceForTiles == 1];
      v19[1] = v16;
      v17 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
      [v15 hostToExtension:v17];
    }
    [v7 setup];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    NSLog(&cfstr_Pdfhostviewcon_0.isa);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)setup
{
  v3 = [PDFExtensionTopView alloc];
  v4 = [(PDFHostViewController *)self view];
  [v4 frame];
  uint64_t v5 = -[PDFExtensionTopView initWithFrame:](v3, "initWithFrame:");
  id v6 = self->_private;
  topView = v6->topView;
  v6->topView = (PDFExtensionTopView *)v5;

  [(PDFExtensionTopView *)self->_private->topView setAutoresizingMask:18];
  v8 = [(PDFHostViewController *)self view];
  [v8 addSubview:self->_private->topView];

  id v9 = [(PDFHostViewController *)self view];
  [v9 bringSubviewToFront:self->_private->topView];

  id v10 = self->_private->topView;
  v11 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.001];
  [(PDFExtensionTopView *)v10 setBackgroundColor:v11];

  uint64_t v12 = self->_private;
  passwordViewController = v12->passwordViewController;
  v12->passwordViewController = 0;

  v14 = self->_private;
  password = v14->password;
  v14->password = 0;

  self->_private->isUnlocked = 1;
  self->_private->currentPageIndex = 0;
  self->_private->pageCount = 0;
  self->_private->documentViewSize = (CGSize)*MEMORY[0x263F001B0];
  self->_private->minScaleFactor = 1.0;
  self->_private->maxScaleFactor = 5.0;
  self->_private->hasSelection = 0;
  CGPoint v16 = (CGPoint)*MEMORY[0x263F00148];
  self->_private->topLeftSelectionPoint = (CGPoint)*MEMORY[0x263F00148];
  self->_private->bottomRightSelectionPoint = v16;
  self->_private->pdfViewIsRotating = 0;
  self->_private->pdfViewNeedsUpdate = 0;
  self->_private->hostScrollViewObserverIsActive = 0;
  [(PDFHostViewController *)self _gestureInit];

  [(PDFHostViewController *)self _setupExtensionInterruptionBlock];
}

- (void)dealloc
{
  v3 = self->_private;
  if (v3->hostScrollViewObserverIsActive)
  {
    v3->hostScrollViewObserverIsActive = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
    [WeakRetained removeObserver:self forKeyPath:@"contentInset" context:@"PDFHostViewController.contentInsetPropertyObservationContext"];

    v3 = self->_private;
  }
  [(PDFExtensionProtocol *)v3->extensionProxy hostToExtension:&unk_26C52E4E8];
  v5.receiver = self;
  v5.super_class = (Class)PDFHostViewController;
  [(_UIRemoteViewController *)&v5 dealloc];
}

- (void)_setupExtensionInterruptionBlock
{
  objc_initWeak(&location, self);
  extension = self->_private->extension;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__PDFHostViewController__setupExtensionInterruptionBlock__block_invoke;
  v4[3] = &unk_264204498;
  objc_copyWeak(&v5, &location);
  [(NSExtension *)extension setRequestInterruptionBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__PDFHostViewController__setupExtensionInterruptionBlock__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PDFHostViewController__setupExtensionInterruptionBlock__block_invoke_2;
    aBlock[3] = &unk_264203940;
    id v5 = WeakRetained;
    v3 = (void (**)(void))_Block_copy(aBlock);
    if ([MEMORY[0x263F08B88] isMainThread]) {
      v3[2](v3);
    }
    else {
      dispatch_async(MEMORY[0x263EF83A0], v3);
    }
  }
}

void __57__PDFHostViewController__setupExtensionInterruptionBlock__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  objc_msgSend(v2, "setFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 1488) + 24));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setContentOffset:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    objc_msgSend(WeakRetained, "setContentSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 1488);
    if (*(unsigned char *)(v3 + 378))
    {
      *(unsigned char *)(v3 + 378) = 0;
      [WeakRetained removeObserver:*(void *)(a1 + 32) forKeyPath:@"contentInset" context:@"PDFHostViewController.contentInsetPropertyObservationContext"];
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 1488) + 64) removeFromSuperview];
  id v4 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 1488) + 32));
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 pdfHostViewControllerExtensionProcessDidCrash:*(void *)(a1 + 32)];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setDocumentData:(id)a3 withScrollView:(id)a4
{
  v26[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    extensionProxy = self->_private->extensionProxy;
    v25[0] = @"function";
    v25[1] = @"data";
    v26[0] = @"setDocumentData";
    v26[1] = v6;
    id v9 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    [(PDFExtensionProtocol *)extensionProxy hostToExtension:v9];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
    id v11 = v7;
    if (WeakRetained != v7)
    {
      uint64_t v12 = WeakRetained;
      objc_storeWeak((id *)&self->_private->hostScrollView, v7);
      id v11 = objc_loadWeakRetained((id *)&self->_private->hostScrollView);

      uint64_t v13 = [v7 panGestureRecognizer];
      [v13 requireGestureRecognizerToFail:self->_private->longPressGestureRecognizer];

      v14 = [v7 panGestureRecognizer];
      [v14 requireGestureRecognizerToFail:self->_private->panGestureRecognizer];

      [v11 addObserver:self forKeyPath:@"contentInset" options:1 context:@"PDFHostViewController.contentInsetPropertyObservationContext"];
      self->_private->hostScrollViewObserverIsActive = 1;
    }
    [(PDFHostViewController *)self _resetPDFHostViewControllerViews];
    v15 = self->_private;
    [v7 frame];
    v15->scrollViewFrame.origin.x = v16;
    v15->scrollViewFrame.origin.y = v17;
    v15->scrollViewFrame.size.width = v18;
    v15->scrollViewFrame.size.height = v19;
    v20 = self->_private;
    [v7 contentInset];
    v20->contentInset.top = v21;
    v20->contentInset.left = v22;
    v20->contentInset.bottom = v23;
    v20->contentInset.right = v24;
    [(PDFHostViewController *)self updatePDFViewLayout];
  }
}

- (void)_resetPDFHostViewControllerViews
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  [WeakRetained setMinimumZoomScale:1.0];
  [WeakRetained setMaximumZoomScale:1.0];
  [WeakRetained setZoomScale:1.0];
  [WeakRetained frame];
  objc_msgSend(WeakRetained, "setContentSize:", v3, v4);
  id v5 = [(PDFHostViewController *)self view];
  [WeakRetained frame];
  objc_msgSend(v5, "setFrame:");

  passwordViewController = self->_private->passwordViewController;
  if (passwordViewController)
  {
    id v7 = passwordViewController;
    [(PDFPasswordViewController *)v7 clearPasswordField];
    v8 = [(PDFPasswordViewController *)self->_private->passwordViewController viewIfLoaded];

    [v8 removeFromSuperview];
  }
}

+ (id)backgroundColor
{
  return (id)[MEMORY[0x263F825C8] secondarySystemBackgroundColor];
}

- (int64_t)currentPageIndex
{
  return self->_private->currentPageIndex;
}

- (int64_t)pageCount
{
  return self->_private->pageCount;
}

- (double)minimumZoomScale
{
  return self->_private->minScaleFactor;
}

- (double)maximumZoomScale
{
  return self->_private->maxScaleFactor;
}

- (void)findString:(id)a3 withOptions:(unint64_t)a4
{
  v12[3] = *MEMORY[0x263EF8340];
  id v6 = (__CFString *)a3;
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = &stru_26C516768;
  }
  extensionProxy = self->_private->extensionProxy;
  v11[0] = @"function";
  v11[1] = @"string";
  v12[0] = @"findString";
  v12[1] = v7;
  v11[2] = @"options";
  id v9 = [NSNumber numberWithUnsignedInteger:a4];
  v12[2] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  [(PDFExtensionProtocol *)extensionProxy hostToExtension:v10];

  if (![(__CFString *)v7 length]) {
    [(PDFHostViewController *)self findStringUpdate:0 done:1];
  }
}

- (void)cancelFindString
{
}

- (void)cancelFindStringWithHighlightsCleared:(BOOL)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  extensionProxy = self->_private->extensionProxy;
  v6[0] = @"function";
  v6[1] = @"clearHighlights";
  v7[0] = @"cancelFindStringWithHighlightsCleared";
  double v4 = [NSNumber numberWithBool:a3];
  v7[1] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(PDFExtensionProtocol *)extensionProxy hostToExtension:v5];
}

- (void)focusOnSearchResultAtIndex:(unint64_t)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  extensionProxy = self->_private->extensionProxy;
  v6[0] = @"function";
  v6[1] = @"searchIndex";
  v7[0] = @"focusOnSearchResultAtIndex";
  double v4 = [NSNumber numberWithUnsignedInteger:a3];
  v7[1] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(PDFExtensionProtocol *)extensionProxy hostToExtension:v5];
}

- (void)clearSearchHighlights
{
}

- (void)goToPageIndex:(int64_t)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  extensionProxy = self->_private->extensionProxy;
  v8[0] = @"function";
  v8[1] = @"pageIndex";
  v9[0] = @"goToPageIndex";
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  v9[1] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  [(PDFExtensionProtocol *)extensionProxy hostToExtension:v7];

  [(PDFPageLabelView *)self->_private->pageLabelView setCurrentPageNumber:a3 + 1 forPageCount:self->_private->pageCount];
}

- (void)goToPageIndex:(int64_t)a3 withViewFrustum:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  id v10 = [(PDFHostViewController *)self view];
  objc_msgSend(v10, "convertRect:toView:", WeakRetained, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  objc_msgSend(WeakRetained, "scrollRectToVisible:animated:", 0, v12, v14, v16, v18);
  id v19 = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (v19 && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(v19, "pdfHostViewController:goToPageIndex:withViewFrustum:", self, a3, x, y, width, height);
  }
  [(PDFPageLabelView *)self->_private->pageLabelView setCurrentPageNumber:a3 + 1 forPageCount:self->_private->pageCount];
}

- (void)viewDidLayoutSubviews
{
  v2 = self->_private;
  if (v2->isUnlocked)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v2->hostScrollView);
    [WeakRetained frame];
    v10.origin.double x = v4;
    v10.origin.double y = v5;
    v10.size.double width = v6;
    v10.size.double height = v7;
    if (PDFRectEqualToRect(self->_private->scrollViewFrame, v10) || self->_private->pdfViewIsRotating)
    {
      [(PDFHostViewController *)self updatePDFViewLayout];
    }
    else
    {
      [(PDFHostViewController *)self beginPDFViewRotation];
      [(PDFHostViewController *)self endPDFViewRotation];
    }
  }
}

- (CGSize)_documentViewSize
{
  v2 = self->_private;
  double width = v2->documentViewSize.width;
  double height = v2->documentViewSize.height;
  if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v2->hostScrollView);
    [WeakRetained frame];
    double width = v7;
    double height = v8;
  }
  double v9 = width;
  double v10 = height;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (UIEdgeInsets)_pdfViewInsets
{
  v2 = self->_private;
  [(PDFHostViewController *)self _pdfViewSafeAreaInsets];
  double v4 = v3;
  double top = v2->contentInset.top;
  double left = v2->contentInset.left;
  double bottom = v2->contentInset.bottom;
  double right = v2->contentInset.right;

  double MaxInsets = PDFEdgeInsetsGetMaxInsets(top, left, bottom, right, v4);
  result.double right = v12;
  result.double bottom = v11;
  result.double left = v10;
  result.double top = MaxInsets;
  return result;
}

- (UIEdgeInsets)_pdfViewSafeAreaInsets
{
  v2 = self->_private;
  if (v2->isUnlocked)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v2->hostScrollView);
    [WeakRetained safeAreaInsets];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    double v13 = self->_private;
    double v14 = 0.0;
    if (v13->contentInset.top <= v6) {
      double v15 = v6;
    }
    else {
      double v15 = 0.0;
    }
    if (v13->contentInset.left <= v8) {
      double v16 = v8;
    }
    else {
      double v16 = 0.0;
    }
    if (v13->contentInset.bottom <= v10) {
      double v17 = v10;
    }
    else {
      double v17 = 0.0;
    }
    if (v13->contentInset.right <= v12) {
      double v14 = v12;
    }
  }
  else
  {
    double v15 = *MEMORY[0x263F834E8];
    double v16 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v17 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v14 = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  result.double right = v14;
  result.double bottom = v17;
  result.double left = v16;
  result.double top = v15;
  return result;
}

- (CGRect)_insetBoundsInDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  [WeakRetained bounds];
  double v4 = self->_private;
  double top = v4->contentInset.top;
  double left = v4->contentInset.left;
  double v8 = v7 + left;
  double v10 = v9 + top;
  double v12 = v11 - (left + v4->contentInset.right);
  double v14 = v13 - (top + v4->contentInset.bottom);
  double v15 = [(PDFHostViewController *)self view];
  objc_msgSend(WeakRetained, "convertRect:toView:", v15, v8, v10, v12, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  [(PDFHostViewController *)self _pdfViewSafeAreaInsets];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  [(PDFHostViewController *)self _hostScrollViewZoomScale];
  double v33 = PDFRectScale(v25, v27, v29, v31, 1.0 / v32);
  double v36 = v21 - (v34 + v35);
  double v38 = v23 - (v33 + v37);

  double v39 = v17;
  double v40 = v19;
  double v41 = v36;
  double v42 = v38;
  result.size.double height = v42;
  result.size.double width = v41;
  result.origin.double y = v40;
  result.origin.double x = v39;
  return result;
}

- (double)_hostScrollViewZoomScale
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  [WeakRetained zoomScale];
  double v5 = CGFloatClamp(v4, self->_private->minScaleFactor, self->_private->maxScaleFactor);

  return v5;
}

- (void)updatePDFViewLayout
{
  v69[5] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  [WeakRetained frame];
  double v8 = v7;
  double v9 = self->_private;
  if (v9->scrollViewFrame.size.width == v5)
  {
    double v10 = v6;
    if (v9->scrollViewFrame.size.height == v6)
    {
      double v11 = v4;
      double v12 = v5;
      [WeakRetained contentInset];
      v9->contentInset.double top = v13;
      v9->contentInset.double left = v14;
      v9->contentInset.double bottom = v15;
      v9->contentInset.double right = v16;
      [WeakRetained bounds];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v25 = [(PDFHostViewController *)self view];
      objc_msgSend(WeakRetained, "convertRect:toView:", v25, v18, v20, v22, v24);
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;

      double v34 = self->_private;
      [(PDFHostViewController *)self _insetBoundsInDocument];
      v34->insetBoundsInDocument.origin.double x = v35;
      v34->insetBoundsInDocument.origin.double y = v36;
      v34->insetBoundsInDocument.size.double width = v37;
      v34->insetBoundsInDocument.size.double height = v38;
      double v39 = self->_private;
      v39->scrollViewFrame.origin.double x = v8;
      v39->scrollViewFrame.origin.double y = v11;
      v39->scrollViewFrame.size.double width = v12;
      v39->scrollViewFrame.size.double height = v10;
      double v40 = self->_private;
      [(PDFHostViewController *)self _pdfViewSafeAreaInsets];
      v40->pdfSafeAreaInsets.double top = v41;
      v40->pdfSafeAreaInsets.double left = v42;
      v40->pdfSafeAreaInsets.double bottom = v43;
      v40->pdfSafeAreaInsets.double right = v44;
      [(PDFHostViewController *)self _hostScrollViewZoomScale];
      double v57 = v45;
      extensionProxdouble y = self->_private->extensionProxy;
      v69[0] = @"updatePDFViewLayout";
      v68[0] = @"function";
      v68[1] = @"boundsInDocument";
      v64 = [NSNumber numberWithDouble:v27];
      v67[0] = v64;
      v63 = [NSNumber numberWithDouble:v29];
      v67[1] = v63;
      v62 = [NSNumber numberWithDouble:v31];
      v67[2] = v62;
      v61 = [NSNumber numberWithDouble:v33];
      v67[3] = v61;
      v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:4];
      v69[1] = v60;
      v68[2] = @"scrollViewFrame";
      v58 = [NSNumber numberWithDouble:v8];
      v66[0] = v58;
      v56 = [NSNumber numberWithDouble:v11];
      v66[1] = v56;
      v55 = [NSNumber numberWithDouble:v12];
      v66[2] = v55;
      v54 = [NSNumber numberWithDouble:v10];
      v66[3] = v54;
      v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:4];
      v69[2] = v53;
      v68[3] = @"safeAreaInsets";
      v46 = [NSNumber numberWithDouble:self->_private->pdfSafeAreaInsets.top];
      v65[0] = v46;
      v47 = [NSNumber numberWithDouble:self->_private->pdfSafeAreaInsets.left];
      v65[1] = v47;
      v48 = [NSNumber numberWithDouble:self->_private->pdfSafeAreaInsets.bottom];
      v65[2] = v48;
      v49 = [NSNumber numberWithDouble:self->_private->pdfSafeAreaInsets.right];
      v65[3] = v49;
      v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:4];
      v69[3] = v50;
      v68[4] = @"zoomScale";
      v51 = [NSNumber numberWithDouble:v57];
      v69[4] = v51;
      v52 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:5];
      [(PDFExtensionProtocol *)extensionProxy hostToExtension:v52];

      double v9 = self->_private;
    }
  }
  [(PDFPageLabelView *)v9->pageLabelView updateEffect];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"PDFHostViewController.contentInsetPropertyObservationContext")
  {
    double v7 = self->_private;
    id WeakRetained = objc_loadWeakRetained((id *)&v7->hostScrollView);
    [WeakRetained contentInset];
    v7->contentInset.double top = v9;
    v7->contentInset.double left = v10;
    v7->contentInset.double bottom = v11;
    v7->contentInset.double right = v12;

    CGFloat v13 = self->_private;
    if (v13->pdfViewNeedsUpdate)
    {
      v13->pdfViewNeedsUpdate = 0;
      [(PDFHostViewController *)self _endPDFViewRotationAnimated:1 withUpdate:0];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PDFHostViewController;
    -[PDFHostViewController observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)pageNumberIndicator
{
  pageLabelView = self->_private->pageLabelView;
  if (!pageLabelView)
  {
    double v4 = -[PDFPageLabelView initWithFrame:]([PDFPageLabelView alloc], "initWithFrame:", 10.0, 10.0, 75.0, 35.0);
    double v5 = self->_private;
    double v6 = v5->pageLabelView;
    v5->pageLabelView = v4;

    pageLabelView = self->_private->pageLabelView;
  }

  return pageLabelView;
}

- (void)snapshotViewRect:(CGRect)a3 snapshotWidth:(id)a4 afterScreenUpdates:(BOOL)a5 withResult:(id)a6
{
  BOOL v7 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v27[4] = *MEMORY[0x263EF8340];
  id v13 = a4;
  objc_super v14 = _Block_copy(a6);
  CGFloat v15 = self->_private;
  id snapshotCompletion = v15->snapshotCompletion;
  v15->id snapshotCompletion = v14;

  double v17 = [NSNumber numberWithDouble:x];
  v27[0] = v17;
  double v18 = [NSNumber numberWithDouble:y];
  v27[1] = v18;
  double v19 = [NSNumber numberWithDouble:width];
  v27[2] = v19;
  double v20 = [NSNumber numberWithDouble:height];
  v27[3] = v20;
  double v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];

  extensionProxdouble y = self->_private->extensionProxy;
  v25[0] = @"function";
  v25[1] = @"rect";
  v26[0] = @"snapshotViewRect";
  v26[1] = v21;
  v26[2] = v13;
  void v25[2] = @"width";
  v25[3] = @"afterScreenUpdates";
  double v23 = [NSNumber numberWithBool:v7];
  void v26[3] = v23;
  double v24 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
  [(PDFExtensionProtocol *)extensionProxy hostToExtension:v24];
}

- (void)recievedSnapshotViewRect:(id)a3
{
  if (a3)
  {
    id snapshotCompletion = (void (**)(id, id))self->_private->snapshotCompletion;
    if (snapshotCompletion) {
      snapshotCompletion[2](snapshotCompletion, a3);
    }
  }
}

- (void)_setMinimumZoomScale:(double)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  extensionProxdouble y = self->_private->extensionProxy;
  v6[0] = @"function";
  v6[1] = @"minimumZoomScale";
  v7[0] = @"setMinimumZoomScale";
  double v4 = [NSNumber numberWithDouble:a3];
  v7[1] = v4;
  double v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(PDFExtensionProtocol *)extensionProxy hostToExtension:v5];
}

- (void)_setMaximumZoomScale:(double)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  extensionProxdouble y = self->_private->extensionProxy;
  v6[0] = @"function";
  v6[1] = @"maximumZoomScale";
  v7[0] = @"setMaximumZoomScale";
  double v4 = [NSNumber numberWithDouble:a3];
  v7[1] = v4;
  double v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(PDFExtensionProtocol *)extensionProxy hostToExtension:v5];
}

- (void)copy:(id)a3
{
}

- (void)selectAll:(id)a3
{
}

- (void)setupDocumentViewSize:(CGSize)a3
{
  self->_private->documentViewSize = a3;
  [(PDFHostViewController *)self updateDocumentViewSize];
  [(PDFHostViewController *)self updateAutoScaleFactor];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  [WeakRetained setZoomScale:self->_private->minScaleFactor];
  objc_msgSend(WeakRetained, "setContentOffset:", PDFPointMake(-self->_private->contentInset.left, -self->_private->contentInset.top));
}

- (void)updateDocumentViewSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  [(PDFHostViewController *)self _hostScrollViewZoomScale];
  double v4 = v3;
  [(PDFHostViewController *)self _documentViewSize];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [(PDFHostViewController *)self _pdfViewSafeAreaInsets];
  double v14 = PDFSizeMake(v9, v11 + v10 + v6 * v4, v13 + v12 + v8 * v4);
  double v16 = v15;
  v17.n128_u64[0] = 0;
  v18.n128_u64[0] = 0;
  double v19 = PDFRectMake(v17, v18, v14, v16);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v26 = [(PDFHostViewController *)self view];
  [v26 frame];
  v46.origin.double x = v27;
  v46.origin.double y = v28;
  v46.size.double width = v29;
  v46.size.double height = v30;
  v45.origin.double x = v19;
  v45.origin.double y = v21;
  v45.size.double width = v23;
  v45.size.double height = v25;
  BOOL v31 = PDFRectEqualToRect(v45, v46);

  if (!v31)
  {
    double v32 = [(PDFHostViewController *)self view];
    objc_msgSend(v32, "setFrame:", v19, v21, v23, v25);
  }
  [WeakRetained contentSize];
  if (v14 != v34 || v16 != v33)
  {
    [WeakRetained contentOffset];
    double v37 = v36;
    double v39 = v38;
    objc_msgSend(WeakRetained, "setContentSize:", v14, v16);
    [WeakRetained contentOffset];
    if (v37 != v41 || v39 != v40) {
      objc_msgSend(WeakRetained, "setContentOffset:", v37, v39);
    }
  }
}

- (void)updateAutoScaleFactor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  [(PDFHostViewController *)self _documentViewSize];
  double v4 = v3;
  [(PDFHostViewController *)self _pdfViewInsets];
  double v7 = v5 + v6;
  [WeakRetained bounds];
  double v9 = (v8 - v7) / v4;
  if (v9 <= 0.00000011920929) {
    double v9 = 1.0;
  }
  self->_private->minScaleFactor = v9;
  self->_private->maxScaleFactor = self->_private->minScaleFactor + 5.0;
  [WeakRetained setMinimumZoomScale:self->_private->minScaleFactor];
  [WeakRetained setMaximumZoomScale:self->_private->maxScaleFactor];
  [(PDFHostViewController *)self _setMinimumZoomScale:self->_private->minScaleFactor];
  [(PDFHostViewController *)self _setMaximumZoomScale:self->_private->maxScaleFactor];
}

- (void)documentIsLocked:(BOOL)a3
{
  self->_private->isUnlocked = !a3;
  if (a3) {
    [(PDFHostViewController *)self _appendPasswordUI];
  }
}

- (void)updateCurrentPageIndex:(int64_t)a3
{
  self->_private->currentPageIndedouble x = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained pdfHostViewController:self updateCurrentPageIndex:a3];
  }
  [(PDFPageLabelView *)self->_private->pageLabelView setCurrentPageNumber:self->_private->currentPageIndex + 1 forPageCount:self->_private->pageCount];
}

- (void)updatePageCount:(int64_t)a3
{
  self->_private->pageCount = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained pdfHostViewController:self updatePageCount:a3];
  }
  [(PDFPageLabelView *)self->_private->pageLabelView setCurrentPageNumber:self->_private->currentPageIndex + 1 forPageCount:self->_private->pageCount];
}

- (void)findStringUpdate:(unint64_t)a3 done:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (WeakRetained)
  {
    double v8 = WeakRetained;
    if (objc_opt_respondsToSelector()) {
      [v8 pdfHostViewController:self findStringUpdate:a3 done:v4];
    }
  }

  MEMORY[0x270F9A790]();
}

- (void)showSelectionRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  double v8 = [(PDFHostViewController *)self view];
  objc_msgSend(WeakRetained, "convertRect:fromView:", v8, x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  CGFloat v16 = v15;

  [WeakRetained bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  [(PDFHostViewController *)self _pdfViewInsets];
  double v44 = v25;
  double v42 = v27;
  double v43 = v26;
  v47.origin.double x = PDFEdgeInsetsInsetRect(v18, v20, v22, v24, v25, v28, v26, v27);
  v48.origin.double x = v10;
  v48.origin.double y = v12;
  v48.size.double width = v14;
  v48.size.double height = v16;
  if (!PDFRectContainsRect(v47, v48))
  {
    double CenterPoint = PDFRectGetCenterPoint(v10, v12, v14);
    double v31 = v30;
    [WeakRetained contentSize];
    double v33 = v32;
    double v35 = v34;
    double v36 = PDFRectMakeFromCenter(CenterPoint, v31, v22);
    double v38 = v37;
    if (v42 + v33 - v22 >= 0.0) {
      double v39 = v42 + v33 - v22;
    }
    else {
      double v39 = 0.0;
    }
    double v40 = CGFloatClamp(v36, 0.0, v39);
    if (v43 + v35 - v24 >= 0.0) {
      double v41 = v43 + v35 - v24;
    }
    else {
      double v41 = 0.0;
    }
    objc_msgSend(WeakRetained, "setContentOffset:animated:", 1, v40, CGFloatClamp(v38, -v44, v41));
  }
}

- (void)setHasSelection:(BOOL)a3
{
  self->_private->hasSelection = a3;
}

- (void)setTextSelectionPoints:(CGPoint)a3 right:(CGPoint)a4
{
  self->_private->topLeftSelectionPoint = a3;
  self->_private->bottomRightSelectionPoint = a4;
}

- (void)showTextSelectionMenu:(BOOL)a3 selectionRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v8 = a3;
  id v10 = [MEMORY[0x263F82950] sharedMenuController];
  if (v8)
  {
    [(PDFExtensionTopView *)self->_private->topView becomeFirstResponder];
    objc_msgSend(v10, "showMenuFromView:rect:", self->_private->topView, x, y, width, height);
  }
  else
  {
    [v10 hideMenu];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return sel_copy_ == a3 || sel_selectAll_ == a3;
}

- (void)zoomToRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!PDFRectIsEmpty(a3))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
    [WeakRetained frame];
    double v9 = CGFloatClamp((v8 - self->_private->contentInset.left - self->_private->contentInset.right) / width, self->_private->minScaleFactor, self->_private->maxScaleFactor);
    objc_msgSend(WeakRetained, "zoomToRect:animated:", 1, x - self->_private->contentInset.left / v9 * 0.5, y - self->_private->contentInset.top / v9 * 0.5, width, height);
    [(PDFHostViewController *)self updatePDFViewLayout];
  }
}

- (void)goToURL:(id)a3 atLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (WeakRetained)
  {
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(WeakRetained, "pdfHostViewController:goToURL:atLocation:", self, v8, x, y);
    }
    if (objc_opt_respondsToSelector()) {
      [WeakRetained pdfHostViewController:self goToURL:v8];
    }
  }
}

- (void)goToPageIndex:(int64_t)a3 pageFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  [(PDFHostViewController *)self _hostScrollViewZoomScale];
  if (v10 > self->_private->minScaleFactor) {
    objc_msgSend(WeakRetained, "setZoomScale:animated:", 0);
  }
  double v11 = [(PDFHostViewController *)self view];
  objc_msgSend(v11, "convertRect:toView:", WeakRetained, x, y, width, height);
  double v13 = v12;

  [WeakRetained contentOffset];
  double v15 = v14;
  [(PDFHostViewController *)self _pdfViewInsets];
  double v17 = v13 - v16;
  double v18 = -self->_private->contentInset.top;
  double v19 = [(PDFHostViewController *)self view];
  [v19 frame];
  double v21 = v20;
  [WeakRetained bounds];
  double v23 = CGFloatClamp(v17, v18, v21 - v22);

  objc_msgSend(WeakRetained, "setContentOffset:", v15, v23);
  id v24 = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (v24 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v24 pdfHostViewController:self goToPageIndex:a3];
  }
}

- (void)goToDestination:(int64_t)a3 point:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  id v8 = [(PDFHostViewController *)self view];
  objc_msgSend(v8, "convertPoint:toView:", WeakRetained, x, y);
  double v10 = v9;
  double v12 = v11;

  [(PDFHostViewController *)self _pdfViewInsets];
  double v14 = v13;
  double v16 = v10 - v15;
  double v17 = -self->_private->contentInset.left;
  double v18 = [(PDFHostViewController *)self view];
  [v18 frame];
  double v20 = v19;
  [WeakRetained bounds];
  double v22 = CGFloatClamp(v16, v17, v20 - v21);

  double v23 = v12 - v14;
  double v24 = -self->_private->contentInset.top;
  double v25 = [(PDFHostViewController *)self view];
  [v25 frame];
  double v27 = v26;
  [WeakRetained bounds];
  double v29 = CGFloatClamp(v23, v24, v27 - v28);

  objc_msgSend(WeakRetained, "setContentOffset:", PDFPointMake(v22, v29));
  id v30 = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (v30 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [WeakRetained bounds];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v39 = [(PDFHostViewController *)self view];
    objc_msgSend(WeakRetained, "convertRect:toView:", v39, v32, v34, v36, v38);
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;

    objc_msgSend(v30, "pdfHostViewController:goToPageIndex:withViewFrustum:", self, a3, v41, v43, v45, v47);
  }
}

- (void)didCopy:(id)a3
{
  double v3 = (void *)MEMORY[0x263F82A18];
  id v4 = a3;
  id v5 = [v3 generalPasteboard];
  [v5 setItems:v4];
}

- (void)_appendPasswordUI
{
  passwordViewController = self->_private->passwordViewController;
  if (!passwordViewController)
  {
    id v4 = [[PDFPasswordViewController alloc] initWithDelegate:self];
    id v5 = self->_private;
    double v6 = v5->passwordViewController;
    v5->passwordViewController = v4;

    passwordViewController = self->_private->passwordViewController;
  }
  id v10 = [(PDFPasswordViewController *)passwordViewController view];
  double v7 = [(PDFHostViewController *)self view];
  [v7 addSubview:v10];

  [v10 setAutoresizingMask:18];
  id v8 = [(PDFHostViewController *)self view];
  [v8 bounds];
  objc_msgSend(v10, "setFrame:");

  [(PDFPasswordViewController *)self->_private->passwordViewController clearPasswordField];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained pdfHostViewControllerDocumentDidRequestPassword:self];
  }
}

- (BOOL)userDidEnterPassword:(id)a3 forPasswordViewController:(id)a4
{
  v12[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = v6;
  if (v6 && !self->_private->isUnlocked && [v6 length])
  {
    objc_storeStrong((id *)&self->_private->password, a3);
    extensionProxdouble y = self->_private->extensionProxy;
    v11[0] = @"function";
    v11[1] = @"password";
    v12[0] = @"unlockWithPassword";
    v12[1] = v7;
    double v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    [(PDFExtensionProtocol *)extensionProxy hostToExtension:v9];
  }
  return 1;
}

- (void)updateDocumentIsLocked:(BOOL)a3
{
  self->_private->isUnlocked = !a3;
  id v4 = self->_private;
  passwordViewController = v4->passwordViewController;
  if (!a3)
  {
    if (passwordViewController)
    {
      id v6 = [(PDFPasswordViewController *)passwordViewController view];
      [v6 removeFromSuperview];

      id v4 = self->_private;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&v4->hostViewControllerDelegate);
    if (WeakRetained)
    {
      id v8 = WeakRetained;
      if (objc_opt_respondsToSelector()) {
        [v8 pdfHostViewController:self documentDidUnlockWithPassword:self->_private->password];
      }
    }
    MEMORY[0x270F9A790]();
  }
  else
  {
    [(PDFPasswordViewController *)passwordViewController presentInvalidPasswordAlertWithParentViewController:self];
  }
}

- (void)didLongPressURL:(id)a3 atLocation:(CGPoint)a4 withAnnotationRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.y;
  double v10 = a4.x;
  id v19 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (WeakRetained)
  {
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(WeakRetained, "pdfHostViewController:didLongPressURL:atLocation:withAnnotationRect:", self, v19, v10, v9, x, y, width, height);
    }
    if (objc_opt_respondsToSelector())
    {
      double v13 = [(PDFHostViewController *)self view];
      id v14 = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
      objc_msgSend(v13, "convertPoint:toView:", v14, v10, v9);
      double v16 = v15;
      double v18 = v17;

      objc_msgSend(WeakRetained, "pdfHostViewController:didLongPressURL:atLocation:", self, v19, v16, v18);
    }
  }
}

- (void)didLongPressPageIndex:(int64_t)a3 atLocation:(CGPoint)a4 withAnnotationRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.y;
  double v10 = a4.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostViewControllerDelegate);
  if (WeakRetained)
  {
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(WeakRetained, "pdfHostViewController:didLongPressPageIndex:atLocation:withAnnotationRect:", self, a3, v10, v9, x, y, width, height);
    }
    if (objc_opt_respondsToSelector())
    {
      double v13 = [(PDFHostViewController *)self view];
      id v14 = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
      objc_msgSend(v13, "convertPoint:toView:", v14, v10, v9);
      double v16 = v15;
      double v18 = v17;

      objc_msgSend(WeakRetained, "pdfHostViewController:didLongPressPageIndex:atLocation:", self, a3, v16, v18);
    }
  }
}

- (void)_gestureInit
{
  uint64_t v3 = [objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel_handleGesture_];
  id v4 = self->_private;
  longPressGestureRecognizer = v4->longPressGestureRecognizer;
  v4->longPressGestureRecognizer = (UILongPressGestureRecognizer *)v3;

  [(UILongPressGestureRecognizer *)self->_private->longPressGestureRecognizer setDelegate:self];
  id v6 = [(PDFHostViewController *)self view];
  [v6 addGestureRecognizer:self->_private->longPressGestureRecognizer];

  double v7 = [[PDFPanGestureRecognizer alloc] initWithTarget:self action:sel_handleGesture_];
  id v8 = self->_private;
  panGestureRecognizer = v8->panGestureRecognizer;
  v8->panGestureRecognizer = v7;

  [(PDFPanGestureRecognizer *)self->_private->panGestureRecognizer setDelegate:self];
  [(PDFPanGestureRecognizer *)self->_private->panGestureRecognizer _setHysteresis:8.0];
  double v10 = [(PDFHostViewController *)self view];
  [v10 addGestureRecognizer:self->_private->panGestureRecognizer];

  uint64_t v11 = [objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_handleGesture_];
  double v12 = self->_private;
  tapGestureRecognizer = v12->tapGestureRecognizer;
  v12->tapGestureRecognizer = (UITapGestureRecognizer *)v11;

  [(UITapGestureRecognizer *)self->_private->tapGestureRecognizer setNumberOfTapsRequired:1];
  [(UITapGestureRecognizer *)self->_private->tapGestureRecognizer setDelegate:self];
  id v14 = [(PDFHostViewController *)self view];
  [v14 addGestureRecognizer:self->_private->tapGestureRecognizer];

  uint64_t v15 = [objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_handleGesture_];
  double v16 = self->_private;
  doubleTapGestureRecognizer = v16->doubleTapGestureRecognizer;
  v16->doubleTapGestureRecognizer = (UITapGestureRecognizer *)v15;

  [(UITapGestureRecognizer *)self->_private->doubleTapGestureRecognizer setNumberOfTapsRequired:2];
  [(UITapGestureRecognizer *)self->_private->doubleTapGestureRecognizer setDelegate:self];
  double v18 = [(PDFHostViewController *)self view];
  [v18 addGestureRecognizer:self->_private->doubleTapGestureRecognizer];

  [(UITapGestureRecognizer *)self->_private->tapGestureRecognizer requireGestureRecognizerToFail:self->_private->longPressGestureRecognizer];
  [(PDFPanGestureRecognizer *)self->_private->panGestureRecognizer requireGestureRecognizerToFail:self->_private->longPressGestureRecognizer];
  [(UITapGestureRecognizer *)self->_private->tapGestureRecognizer requireGestureRecognizerToFail:self->_private->doubleTapGestureRecognizer];
  self->_private->recentGestureIsIndirectTouch = 0;
  uint64_t v19 = [objc_alloc(MEMORY[0x263F82A70]) initWithDelegate:self];
  double v20 = self->_private;
  pointerInteraction = v20->pointerInteraction;
  v20->pointerInteraction = (UIPointerInteraction *)v19;

  double v22 = [(PDFHostViewController *)self view];
  [v22 addInteraction:self->_private->pointerInteraction];

  double v23 = self->_private;
  id pdfPointerCompletionHandler = v23->pdfPointerCompletionHandler;
  v23->id pdfPointerCompletionHandler = 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  self->_private->recentGestureIsIndirectTouch = objc_msgSend(a4, "_isPointerTouch", a3);
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  id v6 = self->_private;
  if (v6->tapGestureRecognizer == v4)
  {
    if (v6->hasSelection) {
      goto LABEL_18;
    }
    [(PDFHostViewController *)self handleGesture:v4];
  }
  else if (v6->doubleTapGestureRecognizer == v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v6->hostScrollView);
    [(PDFHostViewController *)self _hostScrollViewZoomScale];
    if (v15 <= self->_private->minScaleFactor)
    {

      goto LABEL_18;
    }
    objc_msgSend(WeakRetained, "setZoomScale:animated:", 1);
  }
  else
  {
    if (v6->longPressGestureRecognizer != v4)
    {
      if (v6->panGestureRecognizer == v4)
      {
        double v7 = [(PDFHostViewController *)self view];
        [v5 locationOfFirstTouchInView:v7];
        double v9 = v8;
        double v11 = v10;

        double v12 = self->_private;
        if (v12->hasSelection)
        {
          char v13 = !-[PDFHostViewController _isTouchingLollipopAtLocationOfFirstTouch:](self, "_isTouchingLollipopAtLocationOfFirstTouch:", v9, v11);
          double v12 = self->_private;
        }
        else
        {
          char v13 = 1;
        }
        if (!v12->recentGestureIsIndirectTouch && (v13 & 1) != 0) {
          goto LABEL_17;
        }
      }
LABEL_18:
      BOOL v16 = 1;
      goto LABEL_19;
    }
    if (!v6->hasSelection) {
      goto LABEL_18;
    }
  }
LABEL_17:
  BOOL v16 = 0;
LABEL_19:

  return v16;
}

- (void)handleGesture:(id)a3
{
  v33[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(PDFHostViewController *)self _typeForGestureRecognizer:v4];
  id v6 = [(PDFHostViewController *)self view];
  [v4 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = [NSNumber numberWithDouble:v8];
  v33[0] = v11;
  double v12 = [NSNumber numberWithDouble:v10];
  v33[1] = v12;
  char v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];

  panGestureRecognizer = self->_private->panGestureRecognizer;
  double v15 = [(PDFHostViewController *)self view];
  [(PDFPanGestureRecognizer *)panGestureRecognizer locationOfFirstTouchInView:v15];
  double v17 = v16;
  double v19 = v18;

  double v20 = [NSNumber numberWithDouble:v17];
  v32[0] = v20;
  double v21 = [NSNumber numberWithDouble:v19];
  v32[1] = v21;
  double v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];

  extensionProxdouble y = self->_private->extensionProxy;
  v31[0] = @"handleGesture";
  double v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v5, @"function", @"gestureType");
  v31[1] = v24;
  v30[2] = @"state";
  double v25 = NSNumber;
  uint64_t v26 = [v4 state];

  double v27 = [v25 numberWithInteger:v26];
  v31[2] = v27;
  v31[3] = v13;
  v30[3] = @"location";
  v30[4] = @"locationOfFirstTouch";
  v31[4] = v22;
  v30[5] = @"isIndirectTouch";
  double v28 = [NSNumber numberWithBool:self->_private->recentGestureIsIndirectTouch];
  v31[5] = v28;
  double v29 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:6];
  [(PDFExtensionProtocol *)extensionProxy hostToExtension:v29];
}

- (unint64_t)_typeForGestureRecognizer:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_private;
  if (v5->tapGestureRecognizer == v4)
  {
    unint64_t v6 = 0;
  }
  else if (v5->doubleTapGestureRecognizer == v4)
  {
    unint64_t v6 = 1;
  }
  else if (v5->longPressGestureRecognizer == v4)
  {
    unint64_t v6 = 2;
  }
  else if (v5->panGestureRecognizer == v4)
  {
    unint64_t v6 = 3;
  }
  else
  {
    unint64_t v6 = 4;
  }

  return v6;
}

- (BOOL)_isTouchingLollipopAtLocationOfFirstTouch:(CGPoint)a3
{
  uint64_t v3 = self->_private;
  if (!v3->hasSelection) {
    return 0;
  }
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&v3->hostScrollView);
  double v8 = [(PDFHostViewController *)self view];
  objc_msgSend(v8, "convertPoint:toView:", WeakRetained, x, y);
  double v10 = v9;
  double v12 = v11;

  char v13 = 1;
  do
  {
    char v14 = v13;
    double v15 = self->_private;
    if (v14) {
      uint64_t v16 = 136;
    }
    else {
      uint64_t v16 = 152;
    }
    if (v14) {
      uint64_t v17 = 144;
    }
    else {
      uint64_t v17 = 160;
    }
    double v18 = *(double *)((char *)&v15->super.isa + v17);
    double v19 = *(double *)((char *)&v15->super.isa + v16);
    double v20 = [(PDFHostViewController *)self view];
    objc_msgSend(v20, "convertPoint:toView:", WeakRetained, v19, v18);
    double v22 = v21;
    double v24 = v23;

    double v25 = sqrt((v12 - v24) * (v12 - v24) + (v10 - v22) * (v10 - v22)) / PDFScreenGetBackingScaleFactor();
    BOOL v26 = v25 < 10.0;
    if (v25 < 10.0) {
      break;
    }
    char v13 = 0;
  }
  while ((v14 & 1) != 0);

  return v26;
}

- (void)_pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5 completion:(id)a6
{
  v21[2] = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (self->_private->pdfPointerCompletionHandler != a6)
  {
    double v9 = _Block_copy(a6);
    double v10 = self->_private;
    id pdfPointerCompletionHandler = v10->pdfPointerCompletionHandler;
    v10->id pdfPointerCompletionHandler = v9;
  }
  [v8 location];
  double v13 = v12;
  extensionProxdouble y = self->_private->extensionProxy;
  v20[0] = @"function";
  v20[1] = @"location";
  v21[0] = @"pointerRegionForLocation";
  double v15 = objc_msgSend(NSNumber, "numberWithDouble:");
  v19[0] = v15;
  uint64_t v16 = [NSNumber numberWithDouble:v13];
  v19[1] = v16;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v21[1] = v17;
  double v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  [(PDFExtensionProtocol *)extensionProxy hostToExtension:v18];
}

- (void)completePointerInteractionRegionForRequest:(id)a3
{
  id v4 = a3;
  if (self->_private->pdfPointerCompletionHandler)
  {
    id v18 = v4;
    unint64_t v5 = [v4 identifier];
    int v6 = [v5 isEqualToString:@"PDFPointerRegionText"];

    if (v6)
    {
      double v7 = (void *)MEMORY[0x263F82A80];
      [v18 rect];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      uint64_t v16 = [v18 identifier];
      uint64_t v17 = objc_msgSend(v7, "regionWithRect:identifier:", v16, v9, v11, v13, v15);
    }
    else
    {
      uint64_t v17 = 0;
    }
    (*((void (**)(void))self->_private->pdfPointerCompletionHandler + 2))();

    id v4 = v18;
  }
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a4;
  int v6 = [(PDFHostViewController *)self view];
  [v5 rect];
  objc_msgSend(v6, "convertRect:toView:", 0);
  double v8 = v7;

  double v9 = [v5 identifier];
  char v10 = [v9 isEqualToString:@"PDFPointerRegionLink"];

  double v11 = 0;
  if ((v10 & 1) == 0)
  {
    double v12 = [v5 identifier];
    int v13 = [v12 isEqualToString:@"PDFPointerRegionText"];

    if (v13)
    {
      double v11 = [MEMORY[0x263F82A88] beamWithPreferredLength:2 axis:v8];
    }
    else
    {
      double v11 = 0;
    }
  }
  [MEMORY[0x263F82D30] _maximumBeamSnappingLength];
  double v15 = [MEMORY[0x263F82A90] styleWithShape:v11 constrainedAxes:2 * (v8 <= v14)];

  return v15;
}

- (void)beginPDFViewRotation
{
  self->_private->pdfViewIsRotating = 1;
  uint64_t v3 = self->_private;
  v3->documentViewCenter.double x = PDFRectGetCenterPoint(v3->insetBoundsInDocument.origin.x, v3->insetBoundsInDocument.origin.y, v3->insetBoundsInDocument.size.width);
  v3->documentViewCenter.double y = v4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  [(PDFHostViewController *)self _documentViewSize];
  double v6 = v5;
  double v7 = self->_private;
  CGFloat v8 = v7->pdfSafeAreaInsets.left + v7->pdfSafeAreaInsets.right;
  CGFloat v9 = v7->contentInset.left + v7->contentInset.right;
  [WeakRetained zoomScale];
  self->_private->horizontalScaleFactor = v6 * v10 / (self->_private->scrollViewFrame.size.width - v8 - v9);
}

- (void)endPDFViewRotation
{
}

- (void)_endPDFViewRotationAnimated:(BOOL)a3 withUpdate:(BOOL)a4
{
  BOOL v5 = a3;
  [(PDFHostViewController *)self updateDocumentViewSize];
  [(PDFHostViewController *)self updateAutoScaleFactor];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  [(PDFHostViewController *)self _documentViewSize];
  double v8 = v7;
  double v10 = v9;
  [(PDFHostViewController *)self _pdfViewInsets];
  double v13 = v11 + v12;
  double horizontalScaleFactor = self->_private->horizontalScaleFactor;
  [WeakRetained bounds];
  double v16 = CGFloatClamp(horizontalScaleFactor * (v15 - v13) / v8, self->_private->minScaleFactor, self->_private->maxScaleFactor);
  objc_msgSend(WeakRetained, "setZoomScale:animated:", v5);
  [(PDFHostViewController *)self _insetBoundsInDocument];
  double v18 = v17;
  double v20 = v19;
  [WeakRetained contentInset];
  double v25 = PDFRectScale(v21, v22, v23, v24, 1.0 / v16);
  double v27 = v26;
  double v30 = CGFloatClamp(self->_private->documentViewCenter.x - v18 * 0.5 - v28, -v28, v8 - v18 - v28 - v29);
  double v31 = CGFloatClamp(self->_private->documentViewCenter.y - v20 * 0.5 - v25, -v25, v10 - v20 - v25 - v27);
  objc_msgSend(WeakRetained, "setContentOffset:animated:", v5, PDFPointMake(v16 * v30, v16 * v31));
  double v32 = self->_private;
  [WeakRetained frame];
  v32->scrollViewFrame.origin.double x = v33;
  v32->scrollViewFrame.origin.double y = v34;
  v32->scrollViewFrame.size.double width = v35;
  v32->scrollViewFrame.size.double height = v36;
  self->_private->pdfViewIsRotating = 0;
  self->_private->pdfViewNeedsUpdate = a4;
  [(PDFHostViewController *)self updatePDFViewLayout];
}

- (void)endPDFViewRotationWithContentInset:(UIEdgeInsets)a3
{
  self->_private->contentInset = a3;
  [(PDFHostViewController *)self updateDocumentViewSize];
  [(PDFHostViewController *)self updateAutoScaleFactor];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->hostScrollView);
  [(PDFHostViewController *)self _documentViewSize];
  double v5 = v4;
  double v7 = v6;
  [(PDFHostViewController *)self _pdfViewInsets];
  double v10 = v8 + v9;
  double horizontalScaleFactor = self->_private->horizontalScaleFactor;
  [WeakRetained bounds];
  double v13 = CGFloatClamp(horizontalScaleFactor * (v12 - v10) / v5, self->_private->minScaleFactor, self->_private->maxScaleFactor);
  objc_msgSend(WeakRetained, "setZoomScale:");
  [(PDFHostViewController *)self _insetBoundsInDocument];
  double v15 = v14;
  double v17 = v16;
  double v18 = PDFRectScale(self->_private->contentInset.top, self->_private->contentInset.left, self->_private->contentInset.bottom, self->_private->contentInset.right, 1.0 / v13);
  double v20 = v19;
  double v23 = CGFloatClamp(self->_private->documentViewCenter.x - v15 * 0.5 - v21, -v21, v5 - v15 - v21 - v22);
  double v24 = CGFloatClamp(self->_private->documentViewCenter.y - v17 * 0.5 - v18, -v18, v7 - v17 - v18 - v20);
  objc_msgSend(WeakRetained, "setContentOffset:", PDFPointMake(v13 * v23, v13 * v24));
  double v25 = self->_private;
  [WeakRetained frame];
  v25->scrollViewFrame.origin.double x = v26;
  v25->scrollViewFrame.origin.double y = v27;
  v25->scrollViewFrame.size.double width = v28;
  v25->scrollViewFrame.size.double height = v29;
  self->_private->pdfViewIsRotating = 0;
  [(PDFHostViewController *)self updatePDFViewLayout];
}

- (void)killExtensionProcess
{
}

+ (id)loadExtension:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__PDFHostViewController_loadExtension___block_invoke;
  block[3] = &unk_264203940;
  id v9 = v3;
  uint64_t v4 = loadExtension__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&loadExtension__onceToken, block);
  }
  id v6 = (id)loadExtension__extension;

  return v6;
}

void __39__PDFHostViewController_loadExtension___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v7 = 0;
  uint64_t v3 = [MEMORY[0x263F08800] extensionWithIdentifier:v2 error:&v7];
  id v4 = v7;
  id v5 = (void *)loadExtension__extension;
  loadExtension__extension = v3;

  if (loadExtension__extension) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6) {
    NSLog(&cfstr_Pdfhostviewcon_1.isa, *(void *)(a1 + 32), v4);
  }
}

+ (id)serviceViewControllerInterface
{
  return +[XPCExtensionInterface extensionInterface];
}

+ (id)exportedInterface
{
  return +[XPCExtensionInterface hostInterface];
}

- (void).cxx_destruct
{
}

@end