@interface PDFView
+ (void)DisableAnnotationKit;
+ (void)EnableAnnotationKit;
+ (void)setUseIOSurfaceForTiles:(BOOL)a3;
- (BOOL)PDFKitHandleBackTabInTextWidget:(id)a3;
- (BOOL)PDFKitHandleTabInTextWidget:(id)a3;
- (BOOL)_shouldHandleAnnotationAtLocation:(CGPoint)a3 forGestureType:(unint64_t)a4;
- (BOOL)acceptSingleTouch:(id)a3;
- (BOOL)akAnnotationEditingEnabled;
- (BOOL)allowsMarkupAnnotationEditing;
- (BOOL)allowsUndo;
- (BOOL)autoScales;
- (BOOL)backgroundImagesEnabled;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canGoBack;
- (BOOL)canGoForward;
- (BOOL)canGoToFirstPage;
- (BOOL)canGoToLastPage;
- (BOOL)canGoToNextPage;
- (BOOL)canGoToPreviousPage;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canZoomIn;
- (BOOL)canZoomOut;
- (BOOL)displaysAsBook;
- (BOOL)displaysBookmarksForPages;
- (BOOL)displaysPageBreaks;
- (BOOL)displaysRTL;
- (BOOL)enableDataDetectors;
- (BOOL)flipsTileContents;
- (BOOL)focusOnColumnAtPoint:(CGPoint)a3;
- (BOOL)formFillingUpdatesAnnotationOnEveryTextChange;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handleBackTabInDetectedFormField;
- (BOOL)handleBackTabInTextWidget:(id)a3;
- (BOOL)handleTabInDetectedFormField;
- (BOOL)handleTabInTextWidget:(id)a3;
- (BOOL)isAnnotationEditingEnabled;
- (BOOL)isFindInteractionEnabled;
- (BOOL)isFormDetectionEnabled;
- (BOOL)isInFormFillingMode;
- (BOOL)isInMarkupMode;
- (BOOL)isOverLinkAnnotation:(CGPoint)a3;
- (BOOL)isRectVisible:(CGRect)a3 onPage:(id)a4;
- (BOOL)isTextSelectionEnabled;
- (BOOL)isUpdatingSelectionMarkups;
- (BOOL)isUsingPageViewController;
- (BOOL)pageShadowsEnabled;
- (BOOL)shouldAntiAlias;
- (BOOL)showsScrollIndicators;
- (BOOL)userDidEnterPassword:(id)a3 forPasswordViewController:(id)a4;
- (CGAffineTransform)_transformFromPageToPageView:(SEL)a3;
- (CGAffineTransform)_transformFromPageViewToPage:(SEL)a3;
- (CGFloat)greekingThreshold;
- (CGFloat)maxScaleFactor;
- (CGFloat)minScaleFactor;
- (CGFloat)scaleFactor;
- (CGFloat)scaleFactorForSizeToFit;
- (CGPoint)_scrollOriginForPageTopLeft:(id)a3;
- (CGPoint)centerPointOfVisibleRectOfPage:(id)a3;
- (CGPoint)convertPoint:(CGPoint)point fromPage:(PDFPage *)page;
- (CGPoint)convertPoint:(CGPoint)point toPage:(PDFPage *)page;
- (CGRect)convertRect:(CGRect)rect fromPage:(PDFPage *)page;
- (CGRect)convertRect:(CGRect)rect toPage:(PDFPage *)page;
- (CGRect)convertRectToRootView:(CGRect)a3 fromPageLayer:(id)a4;
- (CGRect)convertRootViewRect:(CGRect)a3 toPageLayer:(id)a4;
- (CGRect)extendedRootViewBounds;
- (CGRect)extensionViewBoundsInDocument;
- (CGRect)mainScreenBounds;
- (CGRect)normalizedPageBounds:(id)a3;
- (CGRect)rootViewBounds;
- (CGRect)visibleRectForPageView:(id)a3;
- (CGSize)pageViewSizeForPage:(id)a3;
- (CGSize)pdfDocumentViewSize;
- (CGSize)rowSizeForPage:(PDFPage *)page;
- (NSArray)highlightedSelections;
- (NSArray)visiblePages;
- (PDFAreaOfInterest)areaOfInterestForMouse:(UIEvent *)event;
- (PDFAreaOfInterest)areaOfInterestForPoint:(CGPoint)cursorLocation;
- (PDFDestination)currentDestination;
- (PDFDisplayBox)displayBox;
- (PDFDisplayDirection)displayDirection;
- (PDFDisplayMode)displayMode;
- (PDFDocument)document;
- (PDFInterpolationQuality)interpolationQuality;
- (PDFPage)currentPage;
- (PDFPage)pageForPoint:(CGPoint)point nearest:(BOOL)nearest;
- (PDFSelection)currentSelection;
- (PDFView)initWithCoder:(id)a3;
- (PDFView)initWithFrame:(CGRect)a3;
- (UIColor)backgroundColor;
- (UIEdgeInsets)documentMargins;
- (UIEdgeInsets)pageBreakMargins;
- (UIFindInteraction)findInteraction;
- (UIView)documentView;
- (double)PDFViewWillChangeScaleFactor:(id)a3 toScale:(double)a4;
- (double)_pageViewHeight:(id)a3;
- (double)_unboundAutoScaleFactorForPage:(id)a3;
- (double)_unboundAutoScaleFactorForPageWithSize:(CGSize)a3;
- (double)autoScaleFactor;
- (double)autoScaleFactorForPage:(id)a3;
- (double)autoScaleFactorForPageWithSize:(CGSize)a3;
- (double)defaultGutterWidth;
- (double)extensionViewZoomScale;
- (double)gutterWidth;
- (double)lineWidthThreshold;
- (double)mainScreenScale;
- (double)targetBackingScaleFactor;
- (id)PDFLayout;
- (id)_dragItemsAtLocationInView:(CGPoint)a3;
- (id)_getDocumentAKController;
- (id)activeAnnotation;
- (id)akRedoToolbarItem;
- (id)akToolbarView;
- (id)akToolbarViewItemTintColor;
- (id)akToolbarViewTintColor;
- (id)akUndoToolbarItem;
- (id)controller;
- (id)delegate;
- (id)determineCurrentPage;
- (id)documentScrollView;
- (id)documentViewController;
- (id)doubleTapGestureRecognizer;
- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)findInteraction:(id)a3 sessionForView:(id)a4;
- (id)hitTestForSubviewsOfView:(id)a3 atLocation:(CGPoint)a4 withEvent:(id)a5;
- (id)longPressGestureRecognizer;
- (id)nextPage;
- (id)pageColor;
- (id)pageOverlayViewProvider;
- (id)pageViewForPageAtIndex:(unint64_t)a3;
- (id)parentViewController;
- (id)pdfDocumentView;
- (id)pointerRegionForLocation:(CGPoint)a3;
- (id)previousPage;
- (id)renderingProperties;
- (id)tapGestureRecognizer;
- (id)viewForPage:(id)a3;
- (id)visibleAnnotations;
- (id)visiblePageViews;
- (unint64_t)activeMarkupStyle;
- (unint64_t)lastPageIndex;
- (unint64_t)scrollViewMinimumNumberOfTouches;
- (unint64_t)typeForGestureRecognizer:(id)a3;
- (void)PDFViewWillClickOnLink:(id)a3 withURL:(id)a4;
- (void)_commonInit;
- (void)_ensureOverlayViewController;
- (void)_findVisiblePages;
- (void)_goToPage:(id)a3 animated:(BOOL)a4 withBackgroundUpdate:(BOOL)a5;
- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4;
- (void)_internalSetAutoScaleFactor;
- (void)_internalSetScaleFactor:(double)a3;
- (void)_lookup:(id)a3;
- (void)_reflectNewPageOn;
- (void)_releaseDocument;
- (void)_releaseDocumentViewController;
- (void)_releaseScrollView;
- (void)_removePasswordView;
- (void)_resizeDisplayView:(id)a3;
- (void)_scrollByPage:(BOOL)a3;
- (void)_scrollHorizontalBy:(double)a3;
- (void)_scrollVerticalBy:(double)a3;
- (void)_setupDocumentViewController;
- (void)_setupPasswordView;
- (void)_setupScrollView;
- (void)_showFormFillingButton:(BOOL)a3;
- (void)_syncPageIndexToScrollView;
- (void)_tileRefresh;
- (void)_updateAnnotations;
- (void)_updateBookmarksForPages;
- (void)_updateCurrentPageUsingViewCenter;
- (void)_updatePasswordView;
- (void)addGestureRecognizer:(id)a3;
- (void)addMarkupWithStyle:(unint64_t)a3 fromSelection:(id)a4;
- (void)annotationsChangedOnPage:(PDFPage *)page;
- (void)beginPDFViewRotation;
- (void)callPageVisibilityDelegateMethod:(int)a3 forPageView:(id)a4 atPageIndex:(unint64_t)a5;
- (void)callPageVisibilityDelegateMethodForOverlayAdaptorOnly:(int)a3 forPageView:(id)a4 atPageIndex:(unint64_t)a5;
- (void)clearSelection;
- (void)colorWidgetBackgrounds:(BOOL)a3;
- (void)constrainedScrollToPoint:(CGPoint)a3;
- (void)copy:(id)sender;
- (void)dealloc;
- (void)delete:(id)a3;
- (void)documentWasUnlocked;
- (void)drawDetectedAnnotationBounds:(BOOL)a3;
- (void)drawPage:(PDFPage *)page toContext:(CGContextRef)context;
- (void)enableBackgroundImages:(BOOL)a3;
- (void)enablePageShadows:(BOOL)pageShadowsEnabled;
- (void)encodeWithCoder:(id)a3;
- (void)endPDFViewRotation;
- (void)find:(id)a3;
- (void)findNext:(id)a3;
- (void)findPrevious:(id)a3;
- (void)forceTileRefresh;
- (void)gestureInit;
- (void)goBack:(id)sender;
- (void)goForward:(id)sender;
- (void)goToDestination:(PDFDestination *)destination;
- (void)goToDestinationNoPush:(id)a3;
- (void)goToFirstPage:(id)sender;
- (void)goToLastPage:(id)sender;
- (void)goToNextPage:(id)sender;
- (void)goToPage:(PDFPage *)page;
- (void)goToPage:(id)a3 animated:(BOOL)a4;
- (void)goToPageNoPush:(id)a3;
- (void)goToPageNoPush:(id)a3 animated:(BOOL)a4;
- (void)goToPageWithoutBackgroundUpdate:(id)a3;
- (void)goToPreviousPage:(id)sender;
- (void)goToRect:(CGRect)rect onPage:(PDFPage *)page;
- (void)goToSelection:(PDFSelection *)selection;
- (void)handleGesture:(unint64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6 isIndirectTouch:(BOOL)a7;
- (void)handleTextSuggestion:(id)a3 completionHandler:(id)a4;
- (void)highlight:(id)a3;
- (void)highlightDetectedFormFields:(BOOL)a3;
- (void)highlightPDFRedactions:(BOOL)a3;
- (void)hintScrollDirectionHorizontal:(unint64_t)a3 andVertical:(unint64_t)a4;
- (void)insertFormFieldAtBestLocationNearPoint:(CGPoint)a3 onPage:(id)a4;
- (void)insertFormFieldAtDefaultLocation;
- (void)insertFormFieldWithBounds:(CGRect)a3 onPage:(id)a4;
- (void)interactWithAnnotation:(id)a3;
- (void)internalForceAnnotationRefresh;
- (void)internalForceTileRefresh;
- (void)layoutDocumentView;
- (void)layoutSubviews;
- (void)pageViewControllerSaysPageChanged:(id)a3;
- (void)performAction:(PDFAction *)action;
- (void)performOverlayAdaptorPageVisibilityTrueUpAfterSettingDocument;
- (void)positionInternalViews:(id)a3;
- (void)printActivePageText;
- (void)pushDestination:(id)a3;
- (void)removeControlForAnnotation:(id)a3;
- (void)removeFromSuperview;
- (void)scrollSelectionToVisible:(id)sender;
- (void)scrollViewSaysPageMayHaveChanged:(id)a3;
- (void)selectAll:(id)sender;
- (void)setActiveAnnotation:(id)a3;
- (void)setActiveMarkupStyle:(unint64_t)a3;
- (void)setAkAnnotationEditingEnabled:(BOOL)a3;
- (void)setAkToolbarViewItemTintColor:(id)a3;
- (void)setAkToolbarViewTintColor:(id)a3;
- (void)setAllowsMarkupAnnotationEditing:(BOOL)a3;
- (void)setAllowsUndo:(BOOL)a3;
- (void)setAnnotationEditingEnabled:(BOOL)a3;
- (void)setAutoScales:(BOOL)autoScales;
- (void)setBackgroundColor:(UIColor *)backgroundColor;
- (void)setBackgroundImage:(id)a3 forPage:(id)a4;
- (void)setBounds:(CGRect)a3;
- (void)setCurrentPageIndex:(unint64_t)a3 withNotification:(BOOL)a4;
- (void)setCurrentSelection:(PDFSelection *)currentSelection;
- (void)setCurrentSelection:(PDFSelection *)selection animate:(BOOL)animate;
- (void)setCurrentSelection:(id)a3 updateTextInput:(BOOL)a4;
- (void)setDelegate:(id)delegate;
- (void)setDisplayBox:(PDFDisplayBox)displayBox;
- (void)setDisplayDirection:(PDFDisplayDirection)displayDirection;
- (void)setDisplayMode:(PDFDisplayMode)displayMode;
- (void)setDisplaysAsBook:(BOOL)displaysAsBook;
- (void)setDisplaysBookmarksForPages:(BOOL)a3;
- (void)setDisplaysPageBreaks:(BOOL)displaysPageBreaks;
- (void)setDisplaysRTL:(BOOL)displaysRTL;
- (void)setDocument:(PDFDocument *)document;
- (void)setDocument:(id)a3 waitDuration:(double)a4;
- (void)setDocument:(id)a3 withInitialPageIndex:(unint64_t)a4;
- (void)setDocumentMargins:(UIEdgeInsets)a3;
- (void)setEnableDataDetectors:(BOOL)enableDataDetectors;
- (void)setEnableTileUpdates:(BOOL)a3;
- (void)setFindInteractionEnabled:(BOOL)findInteractionEnabled;
- (void)setForcesTopAlignment:(BOOL)a3;
- (void)setFormDetectionEnabled:(BOOL)a3;
- (void)setFormFillingUpdatesAnnotationOnEveryTextChange:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGreekingThreshold:(CGFloat)greekingThreshold;
- (void)setGutterWidth:(double)a3;
- (void)setHighlightedSelections:(NSArray *)highlightedSelections;
- (void)setInFormFillingMode:(BOOL)a3;
- (void)setInMarkupMode:(BOOL)inMarkupMode;
- (void)setInterpolationQuality:(PDFInterpolationQuality)interpolationQuality;
- (void)setIsUsingPDFExtensionView:(BOOL)a3;
- (void)setLineWidthThreshold:(double)a3;
- (void)setMaxScaleFactor:(CGFloat)maxScaleFactor;
- (void)setMinScaleFactor:(CGFloat)minScaleFactor;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setNewPageVisibilityDelegate:(id)a3 withOldDelegate:(id)a4;
- (void)setPageBreakMargins:(UIEdgeInsets)pageBreakMargins;
- (void)setPageColor:(id)a3;
- (void)setPageOverlayViewProvider:(id)pageOverlayViewProvider;
- (void)setScaleFactor:(CGFloat)scaleFactor;
- (void)setScaleFactor:(double)a3 anchorPoint:(CGPoint)a4;
- (void)setScrollViewScrollEnabled:(BOOL)a3;
- (void)setShouldAntiAlias:(BOOL)shouldAntiAlias;
- (void)setShowsScrollIndicators:(BOOL)a3;
- (void)setTextSelectionEnabled:(BOOL)a3;
- (void)showMarkupMenu:(id)a3;
- (void)signaturesController:(id)a3 didSelectSignatureWithAnnotation:(id)a4;
- (void)syncPageIndexToScrollView;
- (void)takePasswordFrom:(id)sender;
- (void)updatePDFViewLayout:(CGRect)a3 scrollViewFrame:(CGRect)a4 zoomScale:(double)a5;
- (void)usePageViewController:(BOOL)enable withViewOptions:(NSDictionary *)viewOptions;
- (void)visiblePagesChanged:(id)a3;
- (void)zoomIn:(id)sender;
- (void)zoomOut:(id)sender;
@end

@implementation PDFView

+ (void)EnableAnnotationKit
{
}

- (PDFDocument)document
{
  return self->_private->document;
}

- (void)setDocument:(PDFDocument *)document
{
}

- (void)setDocument:(id)a3 withInitialPageIndex:(unint64_t)a4
{
  id v9 = a3;
  self->_private->wantsForceUpdate = 0;
  self->_private->blockingWaitDuration = 0.0;
  v6 = self->_private;
  if (v6->isUsingPageViewController)
  {
    [(PDFDocumentViewController *)v6->documentViewController willForceUpdate];
    v7 = [(PDFScrollView *)self->_private->scrollView pdfDocumentView];
    [v7 willForceUpdate];
  }
  [(PDFView *)self setDocument:v9 waitDuration:0.0];
  v8 = [v9 pageAtIndex:a4];
  [(PDFView *)self goToPage:v8];
}

- (void)setDocument:(id)a3 waitDuration:(double)a4
{
  uint64_t v7 = (uint64_t)a3;
  uint64_t v8 = v7;
  id v9 = self->_private;
  if (v9->document == (PDFDocument *)v7) {
    goto LABEL_30;
  }
  v27 = (void *)v7;
  [(PDFTimer *)v9->pageSyncTimer cancel];
  [(PDFOverlayViewsController *)self->_overlayViewController pdfView:self willSetDocument:v27];
  v10 = [(PDFDocument *)self->_private->document akDocumentAdaptor];
  [v10 setPdfView:0];

  objc_storeStrong((id *)&self->_private->document, a3);
  [(PDFDocument *)self->_private->document setRenderingProperties:self->_private->renderingProperties];
  [(PDFViewLayout *)self->_private->viewLayout setDocument:v27];
  v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 postNotificationName:@"PDFViewChangedDocument" object:self];

  if ([v27 isLinearized] && objc_msgSend(v27, "hasHighLatencyDataProvider"))
  {
    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create("LinearizedPagePreload", v12);
    v14 = self->_private;
    pagePreloadQueue = v14->pagePreloadQueue;
    v14->pagePreloadQueue = (OS_dispatch_queue *)v13;
  }
  else
  {
    v16 = self->_private;
    v12 = v16->pagePreloadQueue;
    v16->pagePreloadQueue = 0;
  }

  if (!v27)
  {
    [(PDFView *)self _releaseDocument];
    [(PDFView *)self layoutDocumentView];
    uint64_t v7 = [(PDFOverlayViewsController *)self->_overlayViewController pdfView:self didSetDocument:0];
LABEL_29:
    uint64_t v8 = (uint64_t)v27;
    goto LABEL_30;
  }
  if (GetDefaultsWriteAKEnabled())
  {
    v17 = [(PDFView *)self undoManager];
    int v18 = [v17 isUndoRegistrationEnabled];
    if (v18) {
      [v17 disableUndoRegistration];
    }
    [(PDFView *)self _ensureOverlayViewController];
    [v27 setupAKDocumentAdaptorIfNecessaryWithView:self];
  }
  else
  {
    v17 = 0;
    int v18 = 0;
  }
  if ([v27 isLocked])
  {
    if (![(PDFRenderingProperties *)self->_private->renderingProperties isUsingPDFExtensionView])
    {
      v19 = [(PDFScrollView *)self->_private->scrollView pdfDocumentView];

      if (v19) {
        [(PDFScrollView *)self->_private->scrollView setDocument:0];
      }
      [(PDFView *)self _setupPasswordView];
    }
    v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 addObserver:self selector:sel_documentWasUnlocked name:@"PDFDocumentDidUnlock" object:self->_private->document];
    goto LABEL_24;
  }
  [(PDFView *)self _removePasswordView];
  v21 = [MEMORY[0x263F08A00] defaultCenter];
  [v21 removeObserver:self name:@"PDFDocumentDidUnlock" object:v27];

  [(PDFScrollView *)self->_private->scrollView setDocument:v27];
  v22 = [(PDFScrollView *)self->_private->scrollView pdfDocumentView];
  v23 = [v22 pageBackgroundManager];
  objc_storeWeak((id *)&self->_pageBackgroundManager, v23);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->delegate);
  [(PDFView *)self setNewPageVisibilityDelegate:WeakRetained withOldDelegate:0];

  if (a4 <= 0.0)
  {
    [(PDFView *)self layoutDocumentView];
  }
  else
  {
    self->_private->wantsForceUpdate = 1;
    self->_private->blockingWaitDuration = a4;
    v25 = [(PDFScrollView *)self->_private->scrollView pdfDocumentView];
    [v25 willForceUpdate];

    v26 = [v27 pageAtIndex:0];
    [(PDFView *)self goToPage:v26];
  }
  [(PDFView *)self setAutoScales:[(PDFView *)self autoScales]];
  if ([(PDFDocument *)self->_private->document pageCount])
  {
    v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 postNotificationName:@"PDFViewChangedPage" object:self];
LABEL_24:
  }
  if (v18) {
    [v17 enableUndoRegistration];
  }
  [v27 setRenderingProperties:self->_private->renderingProperties];

  [(PDFOverlayViewsController *)self->_overlayViewController pdfView:self didSetDocument:v27];
  uint64_t v7 = [v27 isLocked];
  uint64_t v8 = (uint64_t)v27;
  if ((v7 & 1) == 0)
  {
    uint64_t v7 = [(PDFView *)self performOverlayAdaptorPageVisibilityTrueUpAfterSettingDocument];
    goto LABEL_29;
  }
LABEL_30:

  MEMORY[0x270F9A758](v7, v8);
}

- (void)_releaseDocument
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"PDFDocumentDidUnlock" object:self->_private->document];

  [(PDFViewLayout *)self->_private->viewLayout setDocument:0];
  [(PDFScrollView *)self->_private->scrollView setDocument:0];
  v4 = [(PDFDocument *)self->_private->document akDocumentAdaptor];
  [v4 setPdfView:0];

  v5 = self->_private;
  document = v5->document;
  v5->document = 0;
}

- (BOOL)canGoToFirstPage
{
  return self->_currentPageIndex != 0;
}

- (void)goToFirstPage:(id)sender
{
  if ([(PDFView *)self canGoToFirstPage])
  {
    v4 = [(PDFView *)self currentDestination];
    [(PDFView *)self pushDestination:v4];

    id v6 = [(PDFView *)self document];
    v5 = [v6 pageAtIndex:0];
    [(PDFView *)self goToPageNoPush:v5];
  }
}

- (BOOL)canGoToLastPage
{
  unint64_t currentPageIndex = self->_currentPageIndex;
  return currentPageIndex != [(PDFView *)self lastPageIndex];
}

- (void)goToLastPage:(id)sender
{
  if ([(PDFView *)self canGoToLastPage])
  {
    v4 = [(PDFView *)self currentDestination];
    [(PDFView *)self pushDestination:v4];

    v5 = [(PDFView *)self document];
    objc_msgSend(v5, "pageAtIndex:", -[PDFView lastPageIndex](self, "lastPageIndex"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = v7;
    if (v7)
    {
      [(PDFView *)self goToPageNoPush:v7];
      id v6 = v7;
    }
  }
}

- (BOOL)canGoToNextPage
{
  v3 = [(PDFView *)self document];

  if (!v3) {
    return 0;
  }
  v4 = [(PDFView *)self PDFLayout];
  uint64_t v5 = [v4 functionalDisplayMode];

  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    char v6 = [(PDFView *)self lastPageIndex];
    BOOL v7 = [(PDFView *)self displaysAsBook];
    BOOL v8 = (v6 & 1) == 0;
    if (!v7) {
      BOOL v8 = v6;
    }
    unint64_t currentPageIndex = self->_currentPageIndex + v8;
  }
  else
  {
    unint64_t currentPageIndex = self->_currentPageIndex;
  }
  return currentPageIndex < [(PDFView *)self lastPageIndex];
}

- (void)goToNextPage:(id)sender
{
  id v5 = [(PDFView *)self nextPage];
  if (v5)
  {
    v4 = [(PDFView *)self currentDestination];
    [(PDFView *)self pushDestination:v4];

    [(PDFView *)self goToPageNoPush:v5];
  }
}

- (BOOL)canGoToPreviousPage
{
  v3 = [(PDFView *)self document];

  if (!v3) {
    return 0;
  }
  v4 = [(PDFView *)self PDFLayout];
  uint64_t v5 = [v4 functionalDisplayMode];

  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    BOOL v6 = [(PDFView *)self displaysAsBook];
    unint64_t currentPageIndex = self->_currentPageIndex;
    if (!v6) {
      return currentPageIndex > 1;
    }
  }
  else
  {
    unint64_t currentPageIndex = self->_currentPageIndex;
  }
  return currentPageIndex != 0;
}

- (void)goToPreviousPage:(id)sender
{
  id v5 = [(PDFView *)self previousPage];
  if (v5)
  {
    v4 = [(PDFView *)self currentDestination];
    [(PDFView *)self pushDestination:v4];

    [(PDFView *)self goToPageNoPush:v5];
  }
}

- (BOOL)canGoBack
{
  v3 = [(PDFView *)self document];

  return v3 && self->_private->historyIndex > 0;
}

- (void)goBack:(id)sender
{
  if ([(PDFView *)self canGoBack])
  {
    v4 = self->_private;
    unint64_t historyIndex = v4->historyIndex;
    if (historyIndex >= [(NSMutableArray *)v4->destinationHistory count])
    {
      BOOL v6 = [(PDFView *)self currentDestination];
      [(PDFView *)self pushDestination:v6];

      self->_private->unint64_t historyIndex = [(NSMutableArray *)self->_private->destinationHistory count] - 1;
    }
    BOOL v7 = [(NSMutableArray *)self->_private->destinationHistory objectAtIndex:--self->_private->historyIndex];
    [(PDFView *)self goToDestinationNoPush:v7];

    id v9 = [MEMORY[0x263F08A10] defaultQueue];
    BOOL v8 = [MEMORY[0x263F089F8] notificationWithName:@"PDFViewChangedHistory" object:self];
    [v9 enqueueNotification:v8 postingStyle:1];
  }
}

- (BOOL)canGoForward
{
  v3 = [(PDFView *)self document];

  if (!v3) {
    return 0;
  }
  v4 = self->_private;
  unint64_t v5 = v4->historyIndex + 1;
  return v5 < [(NSMutableArray *)v4->destinationHistory count];
}

- (void)goForward:(id)sender
{
  if ([(PDFView *)self canGoForward])
  {
    v4 = [(NSMutableArray *)self->_private->destinationHistory objectAtIndex:++self->_private->historyIndex];
    [(PDFView *)self goToDestinationNoPush:v4];

    id v6 = [MEMORY[0x263F08A10] defaultQueue];
    unint64_t v5 = [MEMORY[0x263F089F8] notificationWithName:@"PDFViewChangedHistory" object:self];
    [v6 enqueueNotification:v5 postingStyle:1];
  }
}

- (PDFPage)currentPage
{
  v3 = [(PDFDocument *)self->_private->document pageCount];
  if (v3)
  {
    v3 = [(PDFDocument *)self->_private->document pageAtIndex:self->_currentPageIndex];
  }

  return (PDFPage *)v3;
}

- (void)setCurrentPageIndex:(unint64_t)a3 withNotification:(BOOL)a4
{
  if (self->_currentPageIndex != a3)
  {
    BOOL v4 = a4;
    self->_unint64_t currentPageIndex = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pageBackgroundManager);
    [WeakRetained updateActivePageIndex:self->_currentPageIndex];

    if (self->_private->pagePreloadQueue)
    {
      BOOL v7 = [(PDFView *)self document];
      objc_msgSend(v7, "preloadDataOfPagesInRange:onQueue:completion:", self->_currentPageIndex + 1, 3, self->_private->pagePreloadQueue, 0);
    }
    id v9 = [(PDFView *)self _getDocumentAKController];
    [v9 setCurrentPageIndex:self->_currentPageIndex];
    if (v4)
    {
      BOOL v8 = [MEMORY[0x263F08A00] defaultCenter];
      [v8 postNotificationName:@"PDFViewChangedPage" object:self];
    }
  }
}

- (void)goToPage:(PDFPage *)page
{
}

- (void)goToPage:(id)a3 animated:(BOOL)a4
{
}

- (void)goToPageWithoutBackgroundUpdate:(id)a3
{
}

- (void)_goToPage:(id)a3 animated:(BOOL)a4 withBackgroundUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  if (v9)
  {
    id v22 = v9;
    v10 = [(PDFView *)self PDFLayout];
    char v11 = [v10 functionalDisplayMode];

    if (v5 && ((v11 & 1) == 0 || self->_private->wantsForceUpdate))
    {
      v12 = [v22 document];
      uint64_t v13 = [v12 indexForPage:v22];

      v14 = self->_private;
      BOOL isUsingPageViewController = v14->isUsingPageViewController;
      v14->wantsForceUpdate = 0;
      v16 = self->_private;
      if (isUsingPageViewController)
      {
        [(PDFDocumentViewController *)v16->documentViewController forceUpdateActivePageIndex:v13 withMaxDuration:v16->blockingWaitDuration];
      }
      else
      {
        v17 = [(PDFScrollView *)v16->scrollView pdfDocumentView];
        [v17 forceUpdateActivePageIndex:v13 withMaxDuration:self->_private->blockingWaitDuration];
      }
    }
    id v18 = [(PDFView *)self currentPage];

    id v9 = v22;
    if (v18 == v22)
    {
      if (!self->_private->scrollView) {
        goto LABEL_13;
      }
      [(PDFView *)self _reflectNewPageOn];
    }
    else
    {
      v19 = [(PDFView *)self currentDestination];
      [(PDFView *)self pushDestination:v19];

      objc_storeStrong((id *)&self->_private->toPage, a3);
      [(PDFView *)self goToPageNoPush:v22 animated:v6];
      v20 = self->_private;
      toPage = v20->toPage;
      v20->toPage = 0;
    }
    id v9 = v22;
  }
LABEL_13:
}

- (PDFDestination)currentDestination
{
  v3 = [(PDFView *)self document];

  if (v3)
  {
    [(PDFView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [(PDFScrollView *)self->_private->scrollView contentInset];
    double v16 = PDFEdgeInsetsInsetRect(v5, v7, v9, v11, v12, v13, v14, v15);
    double MaxY = PDFRectGetMaxY(v16, v17, v18, v19);
    double v21 = PDFPointMake(0.0, MaxY);
    double v23 = v22;
    v24 = -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 1);
    -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v24, v21, v23);
    v27 = -[PDFDestination initWithPage:atPoint:]([PDFDestination alloc], "initWithPage:atPoint:", v24, v25, v26);
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)goToDestination:(PDFDestination *)destination
{
  double v4 = destination;
  if (v4)
  {
    double v7 = v4;
    double v5 = [(PDFDestination *)v4 page];

    double v4 = v7;
    if (v5)
    {
      double v6 = [(PDFView *)self currentDestination];
      [(PDFView *)self pushDestination:v6];

      [(PDFView *)self goToDestinationNoPush:v7];
      double v4 = v7;
    }
  }
}

- (void)goToSelection:(PDFSelection *)selection
{
  double v4 = selection;
  double v5 = v4;
  if (v4)
  {
    double v8 = v4;
    double v4 = (PDFSelection *)[(PDFSelection *)v4 isEmpty];
    double v5 = v8;
    if ((v4 & 1) == 0)
    {
      double v6 = [(PDFSelection *)v8 pages];
      double v7 = [v6 objectAtIndex:0];

      [(PDFSelection *)v8 boundsForPage:v7];
      -[PDFView goToRect:onPage:](self, "goToRect:onPage:", v7);

      double v5 = v8;
    }
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)goToRect:(CGRect)rect onPage:(PDFPage *)page
{
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  double v17 = page;
  if (!-[PDFView isRectVisible:onPage:](self, "isRectVisible:onPage:", x, y, width, height))
  {
    double v9 = *MEMORY[0x263F00148];
    double v10 = *(double *)(MEMORY[0x263F00148] + 8);
    uint64_t v11 = [(PDFPage *)v17 rotation];
    if (v11 > 179)
    {
      if (v11 == 180)
      {
        double MaxX = PDFRectGetMaxX(x, y, width);
        goto LABEL_11;
      }
      if (v11 != 270)
      {
LABEL_13:
        double v16 = -[PDFDestination initWithPage:atPoint:]([PDFDestination alloc], "initWithPage:atPoint:", v17, v9, v10);
        [(PDFView *)self goToDestination:v16];

        goto LABEL_14;
      }
      double v13 = PDFRectGetMaxX(x, y, width);
      double MaxY = PDFRectGetMaxY(x, y, width, height);
      double MaxX = v13;
    }
    else
    {
      if (v11)
      {
        if (v11 == 90)
        {
          double MaxX = x;
LABEL_11:
          double MaxY = y;
          goto LABEL_12;
        }
        goto LABEL_13;
      }
      double MaxY = PDFRectGetMaxY(x, y, width, height);
      double MaxX = x;
    }
LABEL_12:
    double v9 = PDFPointMake(MaxX, MaxY);
    double v10 = v15;
    goto LABEL_13;
  }
LABEL_14:
}

- (void)setDisplayMode:(PDFDisplayMode)displayMode
{
  double v5 = [(PDFView *)self currentPage];
  if ((unint64_t)displayMode < 4)
  {
    double v6 = self->_private;
    if (v6->displayMode == displayMode) {
      goto LABEL_8;
    }
    id v8 = v5;
    v6->displayMode = displayMode;
    [(PDFView *)self layoutDocumentView];
    [(PDFScrollView *)self->_private->scrollView updateLayout];
    if (displayMode) {
      [(PDFView *)self goToPageNoPush:v8];
    }
    [(PDFScrollView *)self->_private->scrollView setBounces:1];
    double v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"PDFViewDisplayModeChanged" object:self];
  }
  else
  {
    id v8 = v5;
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF578], @"setDisplayMode: %ld out of bounds", displayMode);
  }
  double v5 = v8;
LABEL_8:
}

- (PDFDisplayMode)displayMode
{
  return self->_private->displayMode;
}

- (void)setDisplayDirection:(PDFDisplayDirection)displayDirection
{
  v3 = self->_private;
  if (v3->displayDirection != displayDirection)
  {
    v3->displayDirection = displayDirection;
    [(PDFView *)self layoutDocumentView];
    double v5 = self->_private;
    if (v5->isUsingPageViewController)
    {
      if (v5->documentViewController)
      {
        [(PDFView *)self _releaseDocumentViewController];
        [(PDFView *)self _setupDocumentViewController];
      }
    }
  }
}

- (PDFDisplayDirection)displayDirection
{
  return self->_private->displayDirection;
}

- (void)setDisplaysPageBreaks:(BOOL)displaysPageBreaks
{
  if ([(PDFView *)self displaysPageBreaks] != displaysPageBreaks)
  {
    self->_private->displaysPageBreaks = displaysPageBreaks;
    [(PDFView *)self layoutDocumentView];
  }
}

- (BOOL)displaysPageBreaks
{
  return self->_private->displaysPageBreaks;
}

- (void)setPageBreakMargins:(UIEdgeInsets)pageBreakMargins
{
  if (pageBreakMargins.top < 0.0) {
    pageBreakMargins.top = 0.0;
  }
  if (pageBreakMargins.left < 0.0) {
    pageBreakMargins.left = 0.0;
  }
  if (pageBreakMargins.bottom < 0.0) {
    pageBreakMargins.bottom = 0.0;
  }
  v3 = self->_private;
  v3->pageBreakMargins.top = pageBreakMargins.top;
  v3->pageBreakMargins.left = pageBreakMargins.left;
  if (pageBreakMargins.right >= 0.0) {
    double right = pageBreakMargins.right;
  }
  else {
    double right = 0.0;
  }
  v3->pageBreakMargins.bottom = pageBreakMargins.bottom;
  v3->pageBreakMargins.double right = right;
}

- (UIEdgeInsets)pageBreakMargins
{
  v2 = self->_private;
  CGFloat top = v2->pageBreakMargins.top;
  CGFloat left = v2->pageBreakMargins.left;
  CGFloat bottom = v2->pageBreakMargins.bottom;
  CGFloat right = v2->pageBreakMargins.right;
  if (![(PDFView *)self displaysPageBreaks])
  {
    CGFloat top = *MEMORY[0x263F834E8];
    CGFloat left = *(double *)(MEMORY[0x263F834E8] + 8);
    CGFloat bottom = *(double *)(MEMORY[0x263F834E8] + 16);
    CGFloat right = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  double v7 = top;
  double v8 = left;
  double v9 = bottom;
  double v10 = right;
  result.CGFloat right = v10;
  result.CGFloat bottom = v9;
  result.CGFloat left = v8;
  result.CGFloat top = v7;
  return result;
}

- (void)setDocumentMargins:(UIEdgeInsets)a3
{
  self->_private->documentMargins = a3;
  [(PDFView *)self layoutDocumentView];
}

- (UIEdgeInsets)documentMargins
{
  v2 = self->_private;
  double top = v2->documentMargins.top;
  double left = v2->documentMargins.left;
  double bottom = v2->documentMargins.bottom;
  double right = v2->documentMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInFormFillingMode:(BOOL)a3
{
  v3 = self->_private;
  if (v3->inFormFillingMode != a3)
  {
    BOOL v4 = a3;
    v3->inFormFillingMode = a3;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __32__PDFView_setInFormFillingMode___block_invoke;
    aBlock[3] = &unk_2642054B8;
    objc_copyWeak(&v13, &location);
    BOOL v14 = v4;
    double v6 = (void (**)(void))_Block_copy(aBlock);
    [(PDFView *)self _showFormFillingButton:v4];
    double v7 = [(PDFView *)self document];
    double v8 = [v7 akController];

    if (objc_opt_respondsToSelector()) {
      [v8 setFormFillingEnabled:v4];
    }
    controller = self->_private->controller;
    if (v4)
    {
      double v10 = [(PDFViewController *)controller activeAnnotation];
      char v11 = [v10 isFormField];

      if ((v11 & 1) == 0)
      {
        [(PDFViewController *)self->_private->controller activateNextAnnotation:0 withCompletion:v6];
LABEL_9:

        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
        return;
      }
    }
    else
    {
      [(PDFViewController *)controller setActiveAnnotation:0];
    }
    v6[2](v6);
    goto LABEL_9;
  }
}

void __32__PDFView_setInFormFillingMode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained internalForceAnnotationRefresh];
  [WeakRetained highlightDetectedFormFields:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)isInFormFillingMode
{
  return self->_private->inFormFillingMode;
}

- (void)setFormFillingUpdatesAnnotationOnEveryTextChange:(BOOL)a3
{
  self->_private->formFillingUpdatesAnnotationOnEveryTextChange = a3;
}

- (BOOL)formFillingUpdatesAnnotationOnEveryTextChange
{
  return self->_private->formFillingUpdatesAnnotationOnEveryTextChange;
}

- (void)setAllowsMarkupAnnotationEditing:(BOOL)a3
{
  self->_private->allowsMarkupAnnotationEditing = a3;
}

- (BOOL)allowsMarkupAnnotationEditing
{
  if (self->_private->allowsMarkupAnnotationEditing) {
    return 1;
  }
  else {
    return GetDefaultsWriteAKEnabled();
  }
}

- (void)setAllowsUndo:(BOOL)a3
{
  self->_private->allowsUndo = a3;
}

- (BOOL)allowsUndo
{
  return self->_private->allowsUndo;
}

- (void)setTextSelectionEnabled:(BOOL)a3
{
  self->_private->textSelectionEnabled = a3;
}

- (BOOL)isTextSelectionEnabled
{
  return self->_private->textSelectionEnabled;
}

- (void)setDisplayBox:(PDFDisplayBox)displayBox
{
  if ([(PDFView *)self displayBox] != displayBox)
  {
    [(PDFRenderingProperties *)self->_private->renderingProperties setDisplayBox:displayBox];
    [(PDFView *)self layoutDocumentView];
    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:@"PDFViewDisplayBoxChanged" object:self];
  }
}

- (PDFDisplayBox)displayBox
{
  return [(PDFRenderingProperties *)self->_private->renderingProperties displayBox];
}

- (void)setDisplaysAsBook:(BOOL)displaysAsBook
{
  v3 = self->_private;
  if (v3->displaysAsBook != displaysAsBook)
  {
    v3->displaysAsBook = displaysAsBook;
    [(PDFView *)self layoutDocumentView];
  }
}

- (BOOL)displaysAsBook
{
  return self->_private->displaysAsBook;
}

- (void)setShouldAntiAlias:(BOOL)shouldAntiAlias
{
}

- (BOOL)shouldAntiAlias
{
  return [(PDFRenderingProperties *)self->_private->renderingProperties shouldAntiAlias];
}

- (void)setGreekingThreshold:(CGFloat)greekingThreshold
{
}

- (CGFloat)greekingThreshold
{
  [(PDFRenderingProperties *)self->_private->renderingProperties greekingThreshold];
  return result;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  v3.receiver = self;
  v3.super_class = (Class)PDFView;
  [(PDFView *)&v3 setBackgroundColor:backgroundColor];
}

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)PDFView;
  v2 = [(PDFView *)&v4 backgroundColor];

  return (UIColor *)v2;
}

- (void)setInterpolationQuality:(PDFInterpolationQuality)interpolationQuality
{
}

- (PDFInterpolationQuality)interpolationQuality
{
  return [(PDFRenderingProperties *)self->_private->renderingProperties interpolationQuality];
}

- (BOOL)isUsingPageViewController
{
  return self->_private->isUsingPageViewController;
}

- (id)documentViewController
{
  return self->_private->documentViewController;
}

- (void)usePageViewController:(BOOL)enable withViewOptions:(NSDictionary *)viewOptions
{
  BOOL v5 = enable;
  double v7 = viewOptions;
  double v8 = self->_private;
  if (v8->isUsingPageViewController != v5)
  {
    double v9 = v7;
    v8->BOOL isUsingPageViewController = v5;
    objc_storeStrong((id *)&self->_private->pageViewControllerOptions, viewOptions);
    if (v5)
    {
      [(PDFView *)self _setupDocumentViewController];
      [(PDFView *)self _releaseScrollView];
    }
    else
    {
      [(PDFView *)self _setupScrollView];
      [(PDFView *)self _releaseDocumentViewController];
    }
    double v7 = v9;
  }
}

- (void)_setupScrollView
{
  objc_super v3 = [PDFScrollView alloc];
  [(PDFView *)self bounds];
  uint64_t v4 = -[PDFScrollView initWithFrame:](v3, "initWithFrame:");
  BOOL v5 = self->_private;
  scrollView = v5->scrollView;
  v5->scrollView = (PDFScrollView *)v4;

  [(PDFScrollView *)self->_private->scrollView setPDFView:self];
  [(PDFView *)self setMinScaleFactor:0.1];
  [(PDFView *)self setMaxScaleFactor:20.0];
  double v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_scrollViewSaysPageMayHaveChanged_ name:@"PDFScrollViewPageMayHaveChangedNotification" object:self->_private->scrollView];

  [(PDFScrollView *)self->_private->scrollView setShowsVerticalScrollIndicator:1];
  [(PDFScrollView *)self->_private->scrollView setShowsHorizontalScrollIndicator:0];
  [(PDFScrollView *)self->_private->scrollView setAutoresizingMask:18];
  [(PDFView *)self gestureInit];
  uint64_t v8 = [objc_alloc(MEMORY[0x263F826B8]) initWithDelegate:self];
  double v9 = self->_private;
  dragInteraction = v9->dragInteraction;
  v9->dragInteraction = (UIDragInteraction *)v8;

  [(PDFView *)self addInteraction:self->_private->dragInteraction];
  char v11 = self->_private;
  long long v12 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
  *(_OWORD *)&v11->savedSafeAreaInsets.double top = *MEMORY[0x263F834E8];
  *(_OWORD *)&v11->savedSafeAreaInsets.double bottom = v12;
  self->_private->horizontalScaleFactorBeforeRotation = 1.0;
  self->_private->documentViewCenterBeforeRotation = (CGPoint)*MEMORY[0x263F00148];
  p_extensionViewBoundsInDocument = &self->_private->extensionViewBoundsInDocument;
  CGPoint v14 = (CGPoint)*MEMORY[0x263F001A8];
  CGSize v15 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  p_extensionViewBoundsInDocument->origin = (CGPoint)*MEMORY[0x263F001A8];
  p_extensionViewBoundsInDocument->size = v15;
  p_extensionViewFrame = &self->_private->extensionViewFrame;
  p_extensionViewFrame->origin = v14;
  p_extensionViewFrame->size = v15;
  self->_private->extensionViewZoomScale = 1.0;
  double v17 = [[PDFTimer alloc] initWithThrottleDelay:sel__tileRefresh forSelector:self forTarget:0.1];
  double v18 = self->_private;
  tilesSyncTimer = v18->tilesSyncTimer;
  v18->tilesSyncTimer = v17;

  [(PDFTimer *)self->_private->tilesSyncTimer update];
  self->_private->activeMarkupStyle = 0;
  v20 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  [(PDFView *)self setBackgroundColor:v20];

  [(PDFScrollView *)self->_private->scrollView setDocument:self->_private->document];
  [(PDFView *)self addSubview:self->_private->scrollView];
  double v21 = [(PDFScrollView *)self->_private->scrollView pdfDocumentView];
  double v22 = [v21 pageBackgroundManager];
  objc_storeWeak((id *)&self->_pageBackgroundManager, v22);

  [(PDFView *)self _updatePasswordView];
}

- (void)_releaseScrollView
{
  [(PDFScrollView *)self->_private->scrollView removeFromSuperview];
  [(PDFScrollView *)self->_private->scrollView setDocument:0];
  objc_super v3 = self->_private;
  scrollView = v3->scrollView;
  v3->scrollView = 0;

  BOOL v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:@"PDFScrollViewPageMayHaveChangedNotification" object:self->_private->scrollView];

  double v6 = (void *)MEMORY[0x263F8C6D0];

  [v6 cancelPreviousPerformRequestsWithTarget:self selector:sel_syncPageIndexToScrollView object:0];
}

- (void)_setupDocumentViewController
{
  [(PDFScrollView *)self->_private->scrollView minimumZoomScale];
  double v4 = v3;
  [(PDFScrollView *)self->_private->scrollView maximumZoomScale];
  double v6 = v5;
  PDFDisplayDirection v7 = [(PDFView *)self displayDirection];
  documentViewController = self->_private->documentViewController;
  if (!documentViewController)
  {
    if (v6 <= 0.0) {
      double v6 = 5.0;
    }
    if (v4 <= 0.0) {
      double v4 = 0.25;
    }
    double v9 = [[PDFDocumentViewController alloc] initWithPDFView:self pageIndex:self->_currentPageIndex navigationOrientation:v7 == kPDFDisplayDirectionVertical withRenderingProperties:self->_private->renderingProperties andOptions:self->_private->pageViewControllerOptions];
    double v10 = self->_private;
    char v11 = v10->documentViewController;
    v10->documentViewController = v9;

    long long v12 = [(PDFDocumentViewController *)self->_private->documentViewController view];
    [(PDFView *)self addSubview:v12];

    [(PDFView *)self bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v21 = [(PDFDocumentViewController *)self->_private->documentViewController view];
    objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->delegate);
    [(PDFView *)self setNewPageVisibilityDelegate:WeakRetained withOldDelegate:0];

    double v23 = self->_private;
    BOOL autoScale = v23->autoScale;
    [(PDFDocumentViewController *)v23->documentViewController setMinScaleFactor:v4 withMaxScaleFactor:v6];
    [(PDFView *)self setAutoScales:autoScale];
    [(PDFDocumentViewController *)self->_private->documentViewController setDisplaysRTL:self->_private->displaysRTL];
    [(PDFDocumentViewController *)self->_private->documentViewController updateScrollViews];
    double v25 = [MEMORY[0x263F08A00] defaultCenter];
    [v25 addObserver:self selector:sel_pageViewControllerSaysPageChanged_ name:@"PDFDocumentViewControllerChangedPage" object:self];

    documentViewController = self->_private->documentViewController;
  }
  double v26 = [(PDFDocumentViewController *)documentViewController pageBackgroundManager];
  objc_storeWeak((id *)&self->_pageBackgroundManager, v26);

  [(PDFView *)self _updatePasswordView];
}

- (void)_releaseDocumentViewController
{
  v10[1] = *MEMORY[0x263EF8340];
  double v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"PDFDocumentViewControllerChangedPage" object:self];

  documentViewController = self->_private->documentViewController;
  double v5 = objc_alloc_init(PDFPageViewController);
  v10[0] = v5;
  double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [(PDFDocumentViewController *)documentViewController setViewControllers:v6 direction:0 animated:0 completion:0];

  PDFDisplayDirection v7 = [(PDFDocumentViewController *)self->_private->documentViewController view];
  [v7 removeFromSuperview];

  [(PDFDocumentViewController *)self->_private->documentViewController removeFromParentViewController];
  uint64_t v8 = self->_private;
  double v9 = v8->documentViewController;
  v8->documentViewController = 0;
}

- (void)setDelegate:(id)delegate
{
  id v9 = delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->delegate);

  double v5 = v9;
  if (WeakRetained != v9)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_private->delegate);
    [(PDFView *)self setNewPageVisibilityDelegate:v9 withOldDelegate:v6];
    if (v9)
    {
      self->_private->delegateWillScale = objc_opt_respondsToSelector() & 1;
      self->_private->delegateOrdersPageDrawing = objc_opt_respondsToSelector() & 1;
      id v7 = v9;
      self->_private->delegateRespondsToAllowFormFilling = objc_opt_respondsToSelector() & 1;
      self->_private->delegateRespondsToAllowFormFillingWithAutoFill = objc_opt_respondsToSelector() & 1;
      char v8 = objc_opt_respondsToSelector();

      self->_private->delegateRespondsToAllowFormFillingWithConfidence = v8 & 1;
    }
    else
    {
      self->_private->delegateWillScale = 0;
      self->_private->delegateOrdersPageDrawing = 0;
      self->_private->delegateRespondsToAllowFormFilling = 0;
      self->_private->delegateRespondsToAllowFormFillingWithAutoFill = 0;
      self->_private->delegateRespondsToAllowFormFillingWithConfidence = 0;
    }

    double v5 = v9;
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->delegate);

  return WeakRetained;
}

- (void)setPageOverlayViewProvider:(id)pageOverlayViewProvider
{
  id obj = pageOverlayViewProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageOverlayViewProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_pageOverlayViewProvider, obj);
    if (obj)
    {
      [(PDFView *)self _ensureOverlayViewController];
      [(PDFOverlayViewsController *)self->_overlayViewController setViewProvider:obj];
    }
  }
}

- (void)setScaleFactor:(CGFloat)scaleFactor
{
  [(PDFView *)self scaleFactor];
  if (vabdd_f64(v5, scaleFactor) > 0.00000011920929) {
    [(PDFView *)self setAutoScales:0];
  }
  id v6 = self->_private;
  if (v6->isUsingPageViewController)
  {
    documentViewController = v6->documentViewController;
    [(PDFDocumentViewController *)documentViewController setScaleFactor:scaleFactor];
  }
  else if (![(PDFRenderingProperties *)v6->renderingProperties isUsingPDFExtensionView])
  {
    [(PDFView *)self _internalSetScaleFactor:scaleFactor];
  }
}

- (CGFloat)scaleFactor
{
  v2 = self->_private;
  if (v2->isUsingPageViewController)
  {
    documentViewController = v2->documentViewController;
    [(PDFDocumentViewController *)documentViewController scaleFactor];
  }
  else
  {
    BOOL v6 = [(PDFRenderingProperties *)v2->renderingProperties isUsingPDFExtensionView];
    id v7 = self->_private;
    if (v6)
    {
      return v7->extensionViewZoomScale;
    }
    else
    {
      scrollView = v7->scrollView;
      [(PDFScrollView *)scrollView zoomScale];
    }
  }
  return result;
}

- (void)zoomIn:(id)sender
{
  double v4 = [(PDFView *)self document];
  char v5 = [v4 isLocked];

  if ((v5 & 1) == 0)
  {
    [(PDFView *)self setAutoScales:0];
    [(PDFView *)self scaleFactor];
    double v7 = v6 * self->_private->zoomIncrement;
    [(PDFView *)self _internalSetScaleFactor:v7];
  }
}

- (BOOL)canZoomIn
{
  [(PDFView *)self scaleFactor];
  [(PDFView *)self PDFViewWillChangeScaleFactor:self toScale:v3 * self->_private->zoomIncrement];
  double v5 = v4;
  [(PDFView *)self scaleFactor];
  return v5 != v6;
}

- (void)zoomOut:(id)sender
{
  double v4 = [(PDFView *)self document];
  char v5 = [v4 isLocked];

  if ((v5 & 1) == 0)
  {
    [(PDFView *)self setAutoScales:0];
    [(PDFView *)self scaleFactor];
    double v7 = v6 / self->_private->zoomIncrement;
    [(PDFView *)self _internalSetScaleFactor:v7];
  }
}

- (BOOL)canZoomOut
{
  [(PDFView *)self scaleFactor];
  [(PDFView *)self PDFViewWillChangeScaleFactor:self toScale:v3 / self->_private->zoomIncrement];
  double v5 = v4;
  [(PDFView *)self scaleFactor];
  return v5 != v6;
}

- (void)setAutoScales:(BOOL)autoScales
{
  BOOL v3 = autoScales;
  self->_private->BOOL autoScale = autoScales;
  if (autoScales) {
    [(PDFView *)self _internalSetAutoScaleFactor];
  }
  double v5 = self->_private;
  if (v5->isUsingPageViewController)
  {
    documentViewController = v5->documentViewController;
    [(PDFDocumentViewController *)documentViewController setAutoScales:v3];
  }
}

- (BOOL)autoScales
{
  return self->_private->autoScale;
}

- (CGFloat)scaleFactorForSizeToFit
{
  v2 = self->_private;
  if (v2->isUsingPageViewController)
  {
    documentViewController = v2->documentViewController;
    [(PDFDocumentViewController *)documentViewController autoScaleFactor];
  }
  else
  {
    double v6 = [(PDFView *)self currentPage];
    [(PDFView *)self _unboundAutoScaleFactorForPage:v6];
    double v8 = v7;

    return v8;
  }
  return result;
}

- (PDFAreaOfInterest)areaOfInterestForMouse:(UIEvent *)event
{
  return 0;
}

- (PDFAreaOfInterest)areaOfInterestForPoint:(CGPoint)cursorLocation
{
  double y = cursorLocation.y;
  double x = cursorLocation.x;
  double v6 = [(PDFView *)self document];
  double v7 = -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 0, x, y);
  if (!v7)
  {
    long long v12 = 0;
    PDFAreaOfInterest v22 = 0;
    goto LABEL_43;
  }
  -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v7, x, y);
  double v9 = v8;
  double v11 = v10;
  objc_msgSend(v7, "annotationAtPoint:");
  long long v12 = (PDFAnnotation *)objc_claimAutoreleasedReturnValue();
  if (v12
    || (objc_msgSend(v7, "scannedAnnotationAtPoint:", v9, v11),
        (long long v12 = (PDFAnnotation *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v13 = [(PDFAnnotation *)v12 valueForAnnotationKey:@"/Subtype"];
    double v14 = [(PDFAnnotation *)v12 valueForAnnotationKey:@"/FT"];
    annotationOver = self->_private->annotationOver;
    if (annotationOver) {
      BOOL v16 = annotationOver == v12;
    }
    else {
      BOOL v16 = 1;
    }
    if (!v16) {
      [(PDFAnnotation *)annotationOver setPointerIsOverAnnotation:0];
    }
    [(PDFAnnotation *)v12 setPointerIsOverAnnotation:1];
    objc_storeStrong((id *)&self->_private->annotationOver, v12);
    double v17 = [(PDFAnnotation *)v12 valueForAnnotationKey:@"/Subtype"];
    int v18 = [v17 isEqualToString:@"/Link"];

    if (v18) {
      unsigned int v19 = 13;
    }
    else {
      unsigned int v19 = 5;
    }
    double v20 = [(PDFAnnotation *)v12 valueForAnnotationKey:@"/Subtype"];
    int v21 = [v20 isEqualToString:@"/Popup"];

    if (v21)
    {
      v19 |= 0x80u;
    }
    else if ([v13 isEqualToString:@"/Widget"] {
           && [v14 isEqualToString:@"/Tx"]
    }
           && ![(PDFAnnotation *)v12 isReadOnly])
    {
      v19 |= 0x20u;
    }
    else if ([v13 isEqualToString:@"/Widget"] {
           && [v14 isEqualToString:@"/Btn"]
    }
           && ![(PDFAnnotation *)v12 isReadOnly])
    {
      v19 |= 0x10u;
    }
    else if ([v13 isEqualToString:@"/Text"])
    {
      v19 |= 0x40u;
    }
    else if ([(PDFAnnotation *)v12 isMarkupAnnotationSubtype] {
           && -[PDFAnnotation noteContainsPoint:](v12, "noteContainsPoint:", v9, v11))
    }
    {
      v19 |= 0x10u;
    }

    PDFAreaOfInterest v22 = v19;
    if ((v19 & 4) != 0) {
      goto LABEL_32;
    }
  }
  else
  {
    PDFAreaOfInterest v22 = 1;
    unsigned int v19 = 1;
  }
  [(PDFAnnotation *)self->_private->annotationOver setPointerIsOverAnnotation:0];
  double v23 = self->_private;
  v24 = v23->annotationOver;
  v23->annotationOver = 0;

LABEL_32:
  if ([v6 isSimpleSelectionEnabled])
  {
    if ([v7 pageLayoutIfAvail])
    {
      PDFPointToCGPoint(v9, v11);
      int AreaOfInterestAtPoint = CGPDFPageLayoutGetAreaOfInterestAtPoint();
      PDFAreaOfInterest v22 = (AreaOfInterestAtPoint << 7) & 0x100 | (2 * (AreaOfInterestAtPoint & 1)) | v19;
    }
  }
  else
  {
    if (objc_msgSend(v7, "columnAtPointIfAvailable:", v9, v11)) {
      unsigned int v26 = v19 | 2;
    }
    else {
      unsigned int v26 = v19;
    }
    if ([v7 pageLayoutIfAvail] && CGPDFLayoutGetRootNode() && CGPDFNodeGetNodeContainingPoint()) {
      v26 |= 0x100u;
    }
    PDFAreaOfInterest v22 = v26;
  }
LABEL_43:

  return v22;
}

- (void)performAction:(PDFAction *)action
{
  double v4 = action;
  double v5 = v4;
  if (v4)
  {
    double v6 = [(PDFAction *)v4 type];
    double v7 = [(PDFView *)self delegate];
    if ([v6 isEqualToString:@"GoTo"])
    {
      double v8 = [(PDFAction *)v5 destination];
      [(PDFView *)self goToDestination:v8];
    }
    else
    {
      if ([v6 isEqualToString:@"GoToR"])
      {
        if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v7 PDFViewOpenPDF:self forRemoteGoToAction:v5];
        }
        else {
LABEL_36:
        }
          [(PDFView *)self performBeep];
        goto LABEL_37;
      }
      if ([v6 isEqualToString:@"Named"])
      {
        switch([(PDFAction *)v5 name])
        {
          case 1:
            [(PDFView *)self goToNextPage:self];
            break;
          case 2:
            [(PDFView *)self goToPreviousPage:self];
            break;
          case 3:
            [(PDFView *)self goToFirstPage:self];
            break;
          case 4:
            [(PDFView *)self goToLastPage:self];
            break;
          case 5:
            [(PDFView *)self goBack:self];
            break;
          case 6:
            [(PDFView *)self goForward:self];
            break;
          case 7:
            if (!v7 || (objc_opt_respondsToSelector() & 1) == 0) {
              goto LABEL_36;
            }
            [v7 PDFViewPerformGoToPage:self];
            break;
          case 8:
            if (!v7 || (objc_opt_respondsToSelector() & 1) == 0) {
              goto LABEL_36;
            }
            [v7 PDFViewPerformFind:self];
            break;
          case 10:
            if (![(PDFView *)self canZoomIn]) {
              goto LABEL_36;
            }
            [(PDFView *)self zoomIn:self];
            break;
          case 11:
            if (![(PDFView *)self canZoomOut]) {
              goto LABEL_36;
            }
            [(PDFView *)self zoomOut:self];
            break;
          default:
            goto LABEL_37;
        }
        goto LABEL_37;
      }
      if ([v6 isEqualToString:@"ResetForm"])
      {
        double v9 = [(PDFView *)self document];
        if (v9)
        {
          double v10 = v9;
          [v9 resetFormFields:v5];
        }
        goto LABEL_37;
      }
      if (([v6 isEqualToString:@"URI"] & 1) == 0
        && ![v6 isEqualToString:@"Launch"])
      {
LABEL_37:

        goto LABEL_38;
      }
      double v8 = v5;
      double v11 = [(PDFAction *)v8 URL];
      id v12 = v11;
      if (v11 && (PDFURLLooksSuspicious(v11) & 1) == 0)
      {
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __25__PDFView_performAction___block_invoke;
        aBlock[3] = &unk_264204420;
        id v12 = v12;
        id v31 = v12;
        id v32 = v7;
        v33 = self;
        double v13 = (void (**)(void))_Block_copy(aBlock);
        if ([(PDFAction *)v8 isSuspiciousURL])
        {
          double v14 = NSString;
          double v15 = PDFKitLocalizedString(@"Opening the clicked link may send encrypted document content to the server \\U201C%@\\U201D.");
          BOOL v16 = [v12 host];
          v27 = objc_msgSend(v14, "stringWithFormat:", v15, v16);

          double v17 = NSString;
          int v18 = PDFKitLocalizedString(@"Link: %@");
          unsigned int v26 = objc_msgSend(v17, "stringWithFormat:", v18, v12);

          double v25 = PDFKitLocalizedString(@"Cancel");
          v24 = PDFKitLocalizedString(@"Open Anyway");
          unsigned int v19 = [MEMORY[0x263F82418] alertControllerWithTitle:v27 message:v26 preferredStyle:1];
          double v20 = [MEMORY[0x263F82400] actionWithTitle:v25 style:1 handler:0];
          [v19 addAction:v20];
          int v21 = (void *)MEMORY[0x263F82400];
          v28[0] = MEMORY[0x263EF8330];
          v28[1] = 3221225472;
          v28[2] = __25__PDFView_performAction___block_invoke_2;
          v28[3] = &unk_264204F78;
          v29 = v13;
          PDFAreaOfInterest v22 = [v21 actionWithTitle:v24 style:2 handler:v28];
          [v19 addAction:v22];
          double v23 = [(PDFView *)self parentViewController];
          [v23 presentViewController:v19 animated:1 completion:0];
        }
        else
        {
          v13[2](v13);
        }
      }
    }

    goto LABEL_37;
  }
LABEL_38:
}

uint64_t __25__PDFView_performAction___block_invoke(void *a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), uint64_t result = objc_opt_isKindOfClass(), (result))
  {
    if (a1[5] && (objc_opt_respondsToSelector() & 1) != 0)
    {
      BOOL v3 = (void *)a1[5];
      double v4 = (void *)a1[6];
      uint64_t v5 = a1[4];
    }
    else
    {
      BOOL v3 = (void *)a1[6];
      uint64_t v5 = a1[4];
      double v4 = v3;
    }
    return [v3 PDFViewWillClickOnLink:v4 withURL:v5];
  }
  return result;
}

uint64_t __25__PDFView_performAction___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PDFSelection)currentSelection
{
  return self->_private->currentSelection;
}

- (void)setCurrentSelection:(PDFSelection *)currentSelection
{
}

- (void)setCurrentSelection:(id)a3 updateTextInput:(BOOL)a4
{
  BOOL v4 = a4;
  v54[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  double v8 = v7;
  if (v7 && ![v7 isEmpty]) {
    goto LABEL_9;
  }
  double v9 = self->_private;
  currentSelection = v9->currentSelection;
  if (currentSelection)
  {
    v9->currentSelection = 0;

    if (v4)
    {
      double v11 = self->_private;
      if (v11->isUsingPageViewController)
      {
        [(PDFDocumentViewController *)v11->documentViewController setSelection:0];
        double v11 = self->_private;
      }
      id v12 = [(PDFScrollView *)v11->scrollView pdfDocumentView];
      [v12 setSelection:0];
    }
  }
  if (v8)
  {
LABEL_9:
    if (([v8 isEmpty] & 1) == 0)
    {
      objc_storeStrong((id *)&self->_private->currentSelection, a3);
      if (self->_private->isUsingPageViewController)
      {
        double v13 = [(PDFView *)self currentPage];
        uint64_t v14 = [v8 pdfKitIndexOfFirstCharacterOnPage:v13];
        uint64_t v15 = [v8 pdfKitIndexOfLastCharacterOnPage:v13];
        if (v14 != 0x7FFFFFFFFFFFFFFFLL && v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v16 = objc_msgSend(v13, "selectionForRange:", v14, v15 - v14 + 1);
          double v17 = self->_private;
          int v18 = v17->currentSelection;
          v17->currentSelection = (PDFSelection *)v16;

          unsigned int v19 = self->_private->currentSelection;
          double v20 = [v8 color];
          [(PDFSelection *)v19 setColor:v20];

          if (v4) {
            [(PDFDocumentViewController *)self->_private->documentViewController setSelection:self->_private->currentSelection];
          }
        }
      }
      if (v4)
      {
        int v21 = [(PDFScrollView *)self->_private->scrollView pdfDocumentView];
        [v21 setSelection:self->_private->currentSelection];
      }
    }
  }
  PDFAreaOfInterest v22 = self->_private->currentSelection;
  if (v22)
  {
    double v23 = [(PDFSelection *)v22 pages];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      double v25 = [(PDFSelection *)self->_private->currentSelection firstPage];
      [(PDFSelection *)self->_private->currentSelection firstSpanBoundsForPage:v25];
      [(PDFView *)self convertPoint:v25 fromPage:PDFPointMake(v28, v26 + v27)];
      double v30 = v29;
      double v32 = v31;
      uint64_t v33 = [(PDFSelection *)self->_private->currentSelection lastPage];

      v50 = (void *)v33;
      [(PDFSelection *)self->_private->currentSelection lastSpanBoundsForPage:v33];
      [(PDFView *)self convertPoint:v33 fromPage:PDFPointMake(v34 + v35, v36)];
      double v38 = v37;
      double v40 = v39;
      v41 = [MEMORY[0x263F08A00] defaultCenter];
      v53[0] = @"topLeftSelectionPoint";
      v42 = [NSNumber numberWithDouble:v30];
      v52[0] = v42;
      v43 = [NSNumber numberWithDouble:v32];
      v52[1] = v43;
      v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
      v53[1] = @"bottomRightSelectionPoint";
      v54[0] = v44;
      v45 = [NSNumber numberWithDouble:v38];
      v51[0] = v45;
      v46 = [NSNumber numberWithDouble:v40];
      v51[1] = v46;
      v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:2];
      v54[1] = v47;
      v48 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
      [v41 postNotificationName:@"PDFTextSelectionDidChangeTextSelectionPoints" object:self userInfo:v48];
    }
  }
  v49 = [MEMORY[0x263F08A00] defaultCenter];
  [v49 postNotificationName:@"PDFViewSelectionChanged" object:self];
}

- (void)setCurrentSelection:(PDFSelection *)selection animate:(BOOL)animate
{
  BOOL v4 = animate;
  double v10 = selection;
  uint64_t v6 = [(PDFView *)self setCurrentSelection:v10];
  id v7 = v10;
  if (v10)
  {
    if (v4)
    {
      uint64_t v6 = [(PDFSelection *)v10 isEmpty];
      id v7 = v10;
      if ((v6 & 1) == 0)
      {
        double v8 = [(PDFSelection *)v10 pages];
        double v9 = [v8 firstObject];

        [(PDFSelection *)v10 boundsForPage:v9];
        -[PDFCoachMarkManager createCoachMarkForPage:atFrame:](self->_private->coachMarkManager, "createCoachMarkForPage:atFrame:", v9);

        id v7 = v10;
      }
    }
  }

  MEMORY[0x270F9A758](v6, v7);
}

- (void)clearSelection
{
  BOOL v3 = self->_private;
  currentSelection = v3->currentSelection;
  v3->currentSelection = 0;

  uint64_t v5 = [(PDFScrollView *)self->_private->scrollView pdfDocumentView];
  [v5 setSelection:self->_private->currentSelection];

  uint64_t v6 = self->_private;
  if (v6->isUsingPageViewController) {
    [(PDFDocumentViewController *)v6->documentViewController setSelection:v6->currentSelection];
  }
  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 postNotificationName:@"PDFViewSelectionChanged" object:self];
}

- (void)selectAll:(id)sender
{
  if (self->_private->isUsingPageViewController)
  {
    BOOL v4 = [(PDFView *)self currentPage];
    [v4 selectionForAll];
  }
  else
  {
    BOOL v4 = [(PDFView *)self document];
    [v4 selectionForEntireDocument];
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(PDFView *)self setCurrentSelection:v5];
}

- (void)_lookup:(id)a3
{
  id v4 = a3;
  currentSelection = self->_private->currentSelection;
  if (currentSelection)
  {
    id v30 = v4;
    currentSelection = (PDFSelection *)[(PDFSelection *)currentSelection isEmpty];
    id v4 = v30;
    if ((currentSelection & 1) == 0)
    {
      uint64_t v6 = [(PDFView *)self parentViewController];
      if (v6)
      {
        id v7 = [(PDFSelection *)self->_private->currentSelection string];
        double v8 = objc_msgSend(objc_alloc((Class)DDParsecCollectionViewControllerClass()), "initWithString:range:", v7, 0, objc_msgSend(v7, "length"));
        double v9 = self->_private->currentSelection;
        double v10 = [(PDFSelection *)v9 firstPage];
        [(PDFSelection *)v9 boundsForPage:v10];
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;

        unsigned int v19 = [(PDFSelection *)self->_private->currentSelection firstPage];
        -[PDFView convertRect:fromPage:](self, "convertRect:fromPage:", v19, v12, v14, v16, v18);
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;

        double v28 = [v8 popoverPresentationController];
        [v28 setSourceView:self];

        double v29 = [v8 popoverPresentationController];
        objc_msgSend(v29, "setSourceRect:", v21, v23, v25, v27);

        [v6 presentViewController:v8 animated:1 completion:0];
      }
      else
      {
        NSLog(&cfstr_SFailedToFindO.isa, "-[PDFView _lookup:]");
      }

      id v4 = v30;
    }
  }

  MEMORY[0x270F9A758](currentSelection, v4);
}

- (void)highlight:(id)a3
{
}

- (void)showMarkupMenu:(id)a3
{
}

- (void)delete:(id)a3
{
}

- (void)scrollSelectionToVisible:(id)sender
{
  uint64_t v4 = [(PDFView *)self currentSelection];
  uint64_t v5 = v4;
  if (v4)
  {
    double v8 = (void *)v4;
    uint64_t v4 = [(id)v4 isEmpty];
    uint64_t v5 = (uint64_t)v8;
    if ((v4 & 1) == 0)
    {
      uint64_t v6 = [v8 pages];
      id v7 = [v6 objectAtIndex:0];

      [v8 boundsForPage:v7];
      CGRect v11 = PDFRectInset(v10, -4.0, -4.0);
      -[PDFView goToRect:onPage:](self, "goToRect:onPage:", v7, v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);

      uint64_t v5 = (uint64_t)v8;
    }
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)setHighlightedSelections:(NSArray *)highlightedSelections
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v5 = highlightedSelections;
  if (self->_private->highlights != v5)
  {
    uint64_t v6 = [(PDFView *)self visiblePageViews];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v40 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * i) setSearchSelections:0];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v8);
    }
    objc_storeStrong((id *)&self->_private->highlights, highlightedSelections);
    highlights = self->_private->highlights;
    if (highlights)
    {
      double v25 = v6;
      double v26 = v5;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id obj = highlights;
      uint64_t v29 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v29)
      {
        uint64_t v28 = *(void *)v36;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v36 != v28) {
              objc_enumerationMutation(obj);
            }
            uint64_t v30 = v12;
            double v13 = *(void **)(*((void *)&v35 + 1) + 8 * v12);
            double v14 = objc_msgSend(v13, "pages", v25, v26);
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v43 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v32;
              do
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v32 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  NSUInteger v19 = [(PDFDocument *)self->_private->document indexForPage:*(void *)(*((void *)&v31 + 1) + 8 * j)];
                  double v20 = [(PDFScrollView *)self->_private->scrollView pdfDocumentView];
                  double v21 = [v20 pageViewForPageAtIndex:v19];

                  double v22 = self->_private;
                  if (v22->isUsingPageViewController)
                  {
                    double v23 = [(PDFDocumentViewController *)v22->documentViewController findPageViewControllerForPageIndex:v19];
                    uint64_t v24 = [v23 pageView];

                    double v21 = (void *)v24;
                  }
                  if (v21) {
                    [v21 addSearchSelection:v13];
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v43 count:16];
              }
              while (v16);
            }

            uint64_t v12 = v30 + 1;
          }
          while (v30 + 1 != v29);
          uint64_t v29 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v29);
      }

      uint64_t v6 = v25;
      uint64_t v5 = v26;
    }
  }
}

- (NSArray)highlightedSelections
{
  return self->_private->highlights;
}

- (void)takePasswordFrom:(id)sender
{
  id v9 = sender;
  uint64_t v4 = [(PDFView *)self document];
  char v5 = objc_opt_respondsToSelector();
  if (v4)
  {
    if (v5)
    {
      if (![v4 allowsPrinting]
        || ([(PDFView *)self document],
            uint64_t v6 = objc_claimAutoreleasedReturnValue(),
            char v7 = [v6 allowsCopying],
            v6,
            (v7 & 1) == 0))
      {
        uint64_t v8 = [v9 stringValue];
        [v4 unlockWithPassword:v8];
      }
    }
  }
}

- (void)drawPage:(PDFPage *)page toContext:(CGContextRef)context
{
  uint64_t v6 = page;
  [(PDFPage *)v6 drawWithBox:[(PDFView *)self displayBox] toContext:context];
}

- (void)copy:(id)sender
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(PDFView *)self currentSelection];
  if (v4)
  {
    char v5 = [(PDFView *)self document];
    char v6 = [v5 allowsCopying];

    if ((v6 & 1) == 0)
    {
      uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
      [v8 postNotificationName:@"PDFViewCopyPermission" object:self];
LABEL_25:

      goto LABEL_26;
    }
    char v7 = [v4 string];
    uint64_t v8 = [v7 precomposedStringWithCanonicalMapping];

    if (v8)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v9 = objc_msgSend(v4, "pages", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v27;
        while (2)
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v27 != v12) {
              objc_enumerationMutation(v9);
            }
            if ([*(id *)(*((void *)&v26 + 1) + 8 * v13) isTextFromOCR])
            {
              char v14 = 1;
              goto LABEL_15;
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
      char v14 = 0;
LABEL_15:

      uint64_t v15 = [MEMORY[0x263F82A18] generalPasteboard];
      BOOL v16 = [(PDFRenderingProperties *)self->_private->renderingProperties isUsingPDFExtensionView];
      uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
      if ((v14 & 1) == 0)
      {
        double v18 = [v4 rtfData];
        if (v18)
        {
          NSUInteger v19 = [(id)*MEMORY[0x263F1DC68] identifier];
          [v17 setObject:v18 forKeyedSubscript:v19];
        }
        double v20 = [v4 htmlData];
        if (v20)
        {
          double v21 = [(id)*MEMORY[0x263F1DB00] identifier];
          [v17 setObject:v20 forKeyedSubscript:v21];
        }
      }
      double v22 = [(id)*MEMORY[0x263F1DD38] identifier];
      [v17 setObject:v8 forKeyedSubscript:v22];

      if (v16)
      {
        double v23 = [MEMORY[0x263F08A00] defaultCenter];
        long long v31 = v17;
        long long v32 = @"items";
        uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
        long long v33 = v24;
        double v25 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        [v23 postNotificationName:@"PDFTextSelectionDidCopy" object:self userInfo:v25];
      }
      else
      {
        uint64_t v30 = v17;
        double v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
        [v15 setItems:v23];
      }

      goto LABEL_25;
    }
  }
LABEL_26:
}

- (PDFPage)pageForPoint:(CGPoint)point nearest:(BOOL)nearest
{
  BOOL v4 = nearest;
  double y = point.y;
  double x = point.x;
  uint64_t v8 = self->_private;
  if (v8->isUsingPageViewController)
  {
    id v9 = [(PDFDocumentViewController *)v8->documentViewController view];
    -[PDFView convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
    double v11 = v10;
    double v13 = v12;

    char v14 = -[PDFDocumentViewController pageForPoint:nearest:](self->_private->documentViewController, "pageForPoint:nearest:", v4, v11, v13);
    goto LABEL_7;
  }
  uint64_t v15 = [(PDFView *)self document];
  BOOL v16 = v15;
  if (v15 && ([v15 isLocked] & 1) == 0)
  {
    double v18 = [(PDFView *)self documentView];
    -[PDFView convertPoint:toView:](self, "convertPoint:toView:", v18, x, y);
    double v20 = v19;
    double v22 = v21;

    double v23 = [(PDFView *)self documentView];
    [v23 bounds];
    double v25 = v24 - v22;

    long long v26 = [(PDFView *)self PDFLayout];
    long long v27 = [(PDFView *)self currentPage];
    char v14 = objc_msgSend(v26, "pageNearestPoint:currentPage:", v27, v20, v25);

    if (v4) {
      goto LABEL_6;
    }
    -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v14, x, y);
    double v29 = v28;
    double v31 = v30;
    CGFloat v32 = PDFRectToCGRect(objc_msgSend(v14, "boundsForBox:", -[PDFView displayBox](self, "displayBox")));
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    v41.double x = PDFPointToCGPoint(v29, v31);
    v41.double y = v39;
    v42.origin.double x = v32;
    v42.origin.double y = v34;
    v42.size.double width = v36;
    v42.size.double height = v38;
    if (CGRectContainsPoint(v42, v41)) {
      goto LABEL_6;
    }
  }
  char v14 = 0;
LABEL_6:

LABEL_7:

  return (PDFPage *)v14;
}

- (CGPoint)convertPoint:(CGPoint)point toPage:(PDFPage *)page
{
  double y = point.y;
  double x = point.x;
  char v7 = page;
  uint64_t v8 = v7;
  id v9 = self->_private;
  if (v9->isUsingPageViewController)
  {
    double v10 = [(PDFDocumentViewController *)v9->documentViewController view];
    -[PDFView convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
    double v12 = v11;
    double v14 = v13;

    -[PDFDocumentViewController convertPoint:toPage:](self->_private->documentViewController, "convertPoint:toPage:", v8, v12, v14);
    double x = v15;
    double y = v16;
  }
  else if (v7)
  {
    uint64_t v17 = [(PDFView *)self documentView];
    -[PDFView convertPoint:toView:](self, "convertPoint:toView:", v17, x, y);
    double v19 = v18;
    double v21 = v20;

    double v22 = [(PDFView *)self documentView];
    [v22 bounds];
    double v24 = v23 - v21;

    double v25 = [(PDFView *)self PDFLayout];
    objc_msgSend(v25, "convertPoint:toPage:", v8, v19, v24);
    double x = v26;
    double y = v27;
  }
  double v28 = x;
  double v29 = y;
  result.double y = v29;
  result.double x = v28;
  return result;
}

- (CGRect)convertRect:(CGRect)rect toPage:(PDFPage *)page
{
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  id v9 = page;
  -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v9, x, y);
  double v11 = v10;
  double v13 = v12;
  double MaxX = PDFRectGetMaxX(x, y, width);
  double MaxY = PDFRectGetMaxY(x, y, width, height);
  [(PDFView *)self convertPoint:v9 toPage:PDFPointMake(MaxX, MaxY)];
  double v17 = v16;

  double v18 = PDFRectFromPDFPoints(v11, v13, v17);
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)point fromPage:(PDFPage *)page
{
  double y = point.y;
  double x = point.x;
  char v7 = page;
  uint64_t v8 = v7;
  id v9 = self->_private;
  if (v9->isUsingPageViewController)
  {
    -[PDFDocumentViewController convertPoint:fromPage:](v9->documentViewController, "convertPoint:fromPage:", v7, x, y);
    double v11 = v10;
    double v13 = v12;
    double v14 = [(PDFDocumentViewController *)self->_private->documentViewController view];
    objc_msgSend(v14, "convertPoint:toView:", self, v11, v13);
LABEL_5:
    double x = v15;
    double y = v16;

    goto LABEL_6;
  }
  if (v7)
  {
    double v17 = [(PDFView *)self PDFLayout];
    objc_msgSend(v17, "convertPoint:fromPage:", v8, x, y);
    double v19 = v18;
    double v21 = v20;

    double v22 = [(PDFView *)self documentView];
    [v22 bounds];
    double v24 = v23 - v21;

    double v14 = [(PDFView *)self documentView];
    -[PDFView convertPoint:fromView:](self, "convertPoint:fromView:", v14, v19, v24);
    goto LABEL_5;
  }
LABEL_6:

  double v25 = x;
  double v26 = y;
  result.double y = v26;
  result.double x = v25;
  return result;
}

- (CGRect)convertRect:(CGRect)rect fromPage:(PDFPage *)page
{
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  id v9 = page;
  double MinX = PDFRectGetMinX(x, y, width);
  double MinY = PDFRectGetMinY(x, y, width, height);
  [(PDFView *)self convertPoint:v9 fromPage:PDFPointMake(MinX, MinY)];
  double v13 = v12;
  double v15 = v14;
  double MaxX = PDFRectGetMaxX(x, y, width);
  double MaxY = PDFRectGetMaxY(x, y, width, height);
  [(PDFView *)self convertPoint:v9 fromPage:PDFPointMake(MaxX, MaxY)];
  double v19 = v18;

  double v20 = PDFRectFromPDFPoints(v13, v15, v19);
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (UIView)documentView
{
  return (UIView *)[(PDFScrollView *)self->_private->scrollView pdfDocumentView];
}

- (id)pdfDocumentView
{
  return [(PDFScrollView *)self->_private->scrollView pdfDocumentView];
}

- (void)layoutDocumentView
{
  if (!self->_private->scaling)
  {
    unint64_t currentPageIndex = self->_currentPageIndex;
    BOOL v4 = [(PDFView *)self document];
    unint64_t v5 = [v4 pageCount];

    if (currentPageIndex >= v5)
    {
      char v6 = [(PDFView *)self document];
      if ([v6 pageCount])
      {
        char v7 = [(PDFView *)self document];
        uint64_t v8 = [v7 pageCount] - 1;
      }
      else
      {
        uint64_t v8 = 0;
      }

      [(PDFView *)self setCurrentPageIndex:v8 withNotification:0];
    }
  }
  id v9 = [(PDFView *)self PDFLayout];
  [v9 invalidateInternalDocumentGeometry];

  [(PDFView *)self _findVisiblePages];
  double v10 = [(PDFScrollView *)self->_private->scrollView pdfDocumentView];
  [v10 layoutDocumentView];

  [(PDFView *)self _resizeDisplayView:self];
  id v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 postNotificationName:@"PDFViewDidLayoutDocumentView" object:self];
}

- (void)annotationsChangedOnPage:(PDFPage *)page
{
  BOOL v4 = (void *)MEMORY[0x263F08A00];
  unint64_t v5 = page;
  id v7 = [v4 defaultCenter];
  char v6 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v5, @"page", 0);

  [v7 postNotificationName:@"PDFViewAnnotationsDidChange" object:self userInfo:v6];
}

- (CGSize)rowSizeForPage:(PDFPage *)page
{
  BOOL v4 = page;
  unint64_t v5 = [(PDFView *)self PDFLayout];
  [v5 contentSizeWithCurrentPage:v4];
  double v7 = v6;
  double v9 = v8;

  double v10 = round(v7);
  [(PDFView *)self gutterWidth];
  if (v11 > 0.0)
  {
    [(PDFView *)self gutterWidth];
    double v10 = v10 + v12;
    double v13 = [(PDFView *)self PDFLayout];
    uint64_t v14 = [v13 functionalDisplayMode];

    if (v14 >= 2)
    {
      [(PDFView *)self gutterWidth];
      double v10 = v10 + v15;
    }
  }
  double v16 = [(PDFView *)self PDFLayout];
  char v17 = [v16 functionalDisplayMode];

  if (v17)
  {
    [(PDFView *)self _pageViewHeight:v4];
    double v18 = v19;
  }
  else
  {
    double v18 = round(v9);
  }
  [(PDFView *)self scaleFactor];
  double v21 = v18 * v20;
  [(PDFView *)self scaleFactor];
  double v23 = v10 * v22;

  double v24 = v23;
  double v25 = v21;
  result.double height = v25;
  result.double width = v24;
  return result;
}

- (NSArray)visiblePages
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v4 = self->_private;
  if (v4->isUsingPageViewController)
  {
    unint64_t v5 = [(PDFDocumentViewController *)v4->documentViewController pageViews];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) page];
          [v3 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    BOOL v4 = self->_private;
  }
  if ((int)[(PDFDocument *)v4->document pageCount] >= 1)
  {
    uint64_t v11 = 0;
    do
    {
      double v12 = [(PDFScrollView *)self->_private->scrollView pdfDocumentView];
      double v13 = [v12 pageViewForPageAtIndex:v11];

      if (v13 && [v13 isVisible])
      {
        uint64_t v14 = [(PDFDocument *)self->_private->document pageAtIndex:v11];
        if (v14) {
          [v3 addObject:v14];
        }
      }
      ++v11;
    }
    while (v11 < (int)[(PDFDocument *)self->_private->document pageCount]);
  }

  return (NSArray *)v3;
}

- (id)visiblePageViews
{
  v2 = self->_private;
  if (v2->isUsingPageViewController)
  {
    id v3 = [(PDFDocumentViewController *)v2->documentViewController pageViews];
  }
  else
  {
    BOOL v4 = [(PDFScrollView *)v2->scrollView pdfDocumentView];
    id v3 = [v4 pageViews];
  }

  return v3;
}

- (id)visibleAnnotations
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(PDFView *)self visiblePages];
  BOOL v4 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        double v9 = [v8 annotations];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v19 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * j);
              [v14 bounds];
              if (-[PDFView isRectVisible:onPage:](self, "isRectVisible:onPage:", v8)) {
                [v4 addObject:v14];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v11);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)enableBackgroundImages:(BOOL)a3
{
  -[PDFRenderingProperties setEnableBackgroundImages:](self->_private->renderingProperties, "setEnableBackgroundImages:");
  if (!a3)
  {
    id v6 = [(PDFView *)self documentView];
    uint64_t v5 = [v6 pageBackgroundManager];
    [v5 cancel];
  }
}

- (BOOL)backgroundImagesEnabled
{
  return [(PDFRenderingProperties *)self->_private->renderingProperties enableBackgroundImages];
}

- (void)setBackgroundImage:(id)a3 forPage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [(PDFView *)self documentView];
  uint64_t v8 = [v6 document];
  uint64_t v9 = [v8 indexForPage:v6];

  uint64_t v10 = [v11 pageBackgroundManager];
  [v10 forceSetBackgroundImage:v7 forPageIndex:v9];
}

- (void)setEnableDataDetectors:(BOOL)enableDataDetectors
{
}

- (BOOL)enableDataDetectors
{
  return [(PDFDocument *)self->_private->document enableDataDetectors];
}

- (id)controller
{
  return self->_private->controller;
}

- (double)PDFViewWillChangeScaleFactor:(id)a3 toScale:(double)a4
{
  [(PDFView *)self minScaleFactor];
  if (v6 <= a4)
  {
    [(PDFView *)self maxScaleFactor];
    if (v8 >= a4)
    {
      return a4;
    }
    else
    {
      [(PDFView *)self maxScaleFactor];
    }
  }
  else
  {
    [(PDFView *)self minScaleFactor];
  }
  return result;
}

- (void)PDFViewWillClickOnLink:(id)a3 withURL:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v16 = v6;
    id v7 = [MEMORY[0x263F82438] sharedApplication];
    if ([v7 canOpenURL:v16])
    {
      double v8 = [MEMORY[0x263F82438] sharedApplication];
      [v8 openURL:v16 options:MEMORY[0x263EFFA78] completionHandler:0];
    }
    else
    {
      double v8 = PDFKitLocalizedString(@"ERROR: Cannot open URL");
      uint64_t v9 = NSString;
      uint64_t v10 = PDFKitLocalizedString(@"Link: %@");
      id v11 = objc_msgSend(v9, "stringWithFormat:", v10, v16);

      uint64_t v12 = PDFKitLocalizedString(@"OK");
      double v13 = [MEMORY[0x263F82418] alertControllerWithTitle:v8 message:v11 preferredStyle:1];
      uint64_t v14 = [MEMORY[0x263F82400] actionWithTitle:v12 style:0 handler:0];
      [v13 addAction:v14];
      double v15 = [(PDFView *)self parentViewController];
      [v15 presentViewController:v13 animated:1 completion:0];
    }
    id v6 = v16;
  }
}

- (id)viewForPage:(id)a3
{
  unint64_t v4 = [(PDFDocument *)self->_private->document indexForPage:a3];
  if (v4 >= [(PDFDocument *)self->_private->document pageCount])
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v5 = [(PDFScrollView *)self->_private->scrollView pdfDocumentView];
    id v6 = [v5 pageViewForPageAtIndex:v4];
  }

  return v6;
}

- (void)colorWidgetBackgrounds:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PDFDocument *)self->_private->document pageCount];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      double v8 = [(PDFScrollView *)self->_private->scrollView pdfDocumentView];
      uint64_t v9 = [v8 pageViewForPageAtIndex:i];
      uint64_t v10 = [(PDFDocument *)self->_private->document pageAtIndex:i];
      [v9 colorWidgetBackgrounds:v3];
      [v10 setColorWidgetBackgrounds:v3];
    }
  }
}

- (void)drawDetectedAnnotationBounds:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t v4 = [(PDFView *)self visiblePageViews];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) enableHighlightDetectedFormFields:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (PDFView)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PDFView;
  uint64_t v5 = [(PDFView *)&v37 initWithCoder:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    [(PDFView *)v5 _commonInit];
    if (![v4 allowsKeyedCoding])
    {
      int v36 = 0;
      [v4 decodeValueOfObjCType:"i" at:&v36];
      int v35 = 0;
      [v4 decodeValueOfObjCType:"i" at:&v35];
      [(PDFView *)v6 setDisplayMode:v35];
      unsigned __int8 v34 = 1;
      [v4 decodeValueOfObjCType:"B" at:&v34];
      [(PDFView *)v6 setDisplaysPageBreaks:v34];
      float v33 = 1.0;
      [v4 decodeValueOfObjCType:"f" at:&v33];
      [(PDFView *)v6 setScaleFactor:v33];
      unsigned __int8 v32 = 0;
      [v4 decodeValueOfObjCType:"B" at:&v32];
      [(PDFView *)v6 setAutoScales:v32];
      int v31 = 0;
      [v4 decodeValueOfObjCType:"i" at:&v31];
      [(PDFView *)v6 setDisplayDirection:v31];
      unsigned __int8 v30 = 0;
      [v4 decodeValueOfObjCType:"B" at:&v30];
      [(PDFView *)v6 setDisplaysRTL:v30];
      float v29 = 1.0;
      [v4 decodeValueOfObjCType:"f" at:&v29];
      [(PDFView *)v6 setMinScaleFactor:v29];
      float v28 = 1.0;
      [v4 decodeValueOfObjCType:"f" at:&v28];
      [(PDFView *)v6 setMinScaleFactor:v28];
      float v27 = 1.0;
      [v4 decodeValueOfObjCType:"f" at:&v27];
      double v20 = v27;
      [v4 decodeValueOfObjCType:"f" at:&v27];
      double v21 = v27;
      [v4 decodeValueOfObjCType:"f" at:&v27];
      double v22 = v27;
      [v4 decodeValueOfObjCType:"f" at:&v27];
      -[PDFView setPageBreakMargins:](v6, "setPageBreakMargins:", v22, v20, v27, v21);
      unsigned __int8 v26 = 0;
      [v4 decodeValueOfObjCType:"B" at:&v26];
      [(PDFView *)v6 setDisplaysAsBook:v26];
      unsigned __int8 v25 = 0;
      [v4 decodeValueOfObjCType:"B" at:&v25];
      [(PDFView *)v6 setEnableDataDetectors:v25];
      int v24 = 2;
      [v4 decodeValueOfObjCType:"i" at:&v24];
      uint64_t v19 = v24;
      goto LABEL_41;
    }
    [v4 containsValueForKey:@"Version"];
    if ([v4 containsValueForKey:@"DisplayMode"]) {
      -[PDFView setDisplayMode:](v6, "setDisplayMode:", (int)[v4 decodeIntForKey:@"DisplayMode"]);
    }
    if ([v4 containsValueForKey:@"PageBreaks"]) {
      -[PDFView setDisplaysPageBreaks:](v6, "setDisplaysPageBreaks:", [v4 decodeBoolForKey:@"PageBreaks"]);
    }
    if ([v4 containsValueForKey:@"ScaleFactor"])
    {
      [v4 decodeFloatForKey:@"ScaleFactor"];
      [(PDFView *)v6 setScaleFactor:v7];
    }
    if ([v4 containsValueForKey:@"AutoScale"]) {
      -[PDFView setAutoScales:](v6, "setAutoScales:", [v4 decodeBoolForKey:@"AutoScale"]);
    }
    if ([v4 containsValueForKey:@"DisplayDirection"]) {
      -[PDFView setDisplayDirection:](v6, "setDisplayDirection:", [v4 decodeBoolForKey:@"DisplayDirection"]);
    }
    if ([v4 containsValueForKey:@"DisplaysRTL"]) {
      -[PDFView setDisplaysRTL:](v6, "setDisplaysRTL:", [v4 decodeBoolForKey:@"DisplaysRTL"]);
    }
    if ([v4 containsValueForKey:@"MinScaleFactor"])
    {
      [v4 decodeFloatForKey:@"MinScaleFactor"];
      [(PDFView *)v6 setMinScaleFactor:v8];
    }
    if ([v4 containsValueForKey:@"MaxScaleFactor"])
    {
      [v4 decodeFloatForKey:@"MaxScaleFactor"];
      [(PDFView *)v6 setMaxScaleFactor:v9];
    }
    if ([(PDFView *)v6 displaysPageBreaks])
    {
      double v10 = 4.0;
      double v11 = 4.0;
      if ([v4 containsValueForKey:@"PageBreakMargins.left"])
      {
        [v4 decodeFloatForKey:@"PageBreakMargins.left"];
        double v11 = v12;
      }
      if ([v4 containsValueForKey:@"PageBreakMargins.left"])
      {
        [v4 decodeFloatForKey:@"PageBreakMargins.right"];
        double v10 = v13;
      }
      double v14 = 4.75;
      double v15 = 4.75;
      if ([v4 containsValueForKey:@"PageBreakMargins.top"])
      {
        [v4 decodeFloatForKey:@"PageBreakMargins.top"];
        double v15 = v16;
      }
      if ([v4 containsValueForKey:@"PageBreakMargins.bottom"])
      {
        [v4 decodeFloatForKey:@"PageBreakMargins.bottom"];
        double v14 = v17;
      }
      -[PDFView setPageBreakMargins:](v6, "setPageBreakMargins:", v15, v11, v14, v10);
    }
    if ([v4 containsValueForKey:@"DisplaysAsBook"]) {
      -[PDFView setDisplaysAsBook:](v6, "setDisplaysAsBook:", [v4 decodeBoolForKey:@"DisplaysAsBook"]);
    }
    if ([v4 containsValueForKey:@"BackgroundColor"])
    {
      long long v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BackgroundColor"];
      if (v18)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(PDFView *)v6 setBackgroundColor:v18];
        }
      }
    }
    if ([v4 containsValueForKey:@"EnableDataDetectors"]) {
      -[PDFView setEnableDataDetectors:](v6, "setEnableDataDetectors:", [v4 decodeBoolForKey:@"EnableDataDetectors"]);
    }
    if ([v4 containsValueForKey:@"InterpolationQuality"])
    {
      uint64_t v19 = [v4 decodeIntegerForKey:@"InterpolationQuality"];
LABEL_41:
      [(PDFView *)v6 setInterpolationQuality:v19];
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PDFView;
  [(PDFView *)&v3 encodeWithCoder:a3];
}

- (PDFView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PDFView;
  objc_super v3 = -[PDFView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(PDFView *)v3 _commonInit];
  }
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)PDFView;
  -[PDFView setFrame:](&v14, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = self->_private;
  if (v4)
  {
    if (v4->autoScale) {
      [(PDFView *)self _internalSetAutoScaleFactor];
    }
    [(PDFView *)self _updateBookmarksForPages];
    uint64_t v5 = [(PDFView *)self visiblePageViews];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
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
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setNeedsTilesUpdate];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)setBounds:(CGRect)a3
{
  if (self->_private)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    v20.receiver = self;
    v20.super_class = (Class)PDFView;
    -[PDFView setBounds:](&v20, sel_setBounds_, x, y, width, height);
    uint64_t v8 = self->_private;
    if (v8->autoScale)
    {
      [(PDFView *)self _internalSetAutoScaleFactor];
      uint64_t v8 = self->_private;
    }
    uint64_t v9 = [(PDFPasswordViewController *)v8->passwordViewController viewIfLoaded];
    long long v10 = v9;
    if (v9) {
      objc_msgSend(v9, "setFrame:", x, y, width, height);
    }
    [(PDFView *)self _updateBookmarksForPages];
    long long v11 = self->_private;
    [(PDFView *)self safeAreaInsets];
    v11->savedSafeAreaInsets.double top = v12;
    v11->savedSafeAreaInsets.double left = v13;
    v11->savedSafeAreaInsets.double bottom = v14;
    v11->savedSafeAreaInsets.double right = v15;
    [MEMORY[0x263F158F8] commit];
    objc_initWeak(&location, self);
    dispatch_time_t v16 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __21__PDFView_setBounds___block_invoke;
    block[3] = &unk_264204088;
    objc_copyWeak(&v18, &location);
    block[4] = self;
    dispatch_after(v16, MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

    [(PDFView *)self layoutDocumentView];
  }
}

void __21__PDFView_setBounds___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_super v3 = [*(id *)(a1 + 32) visiblePageViews];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setNeedsTilesUpdate];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PDFView;
  [(PDFView *)&v7 layoutSubviews];
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 100000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__PDFView_layoutSubviews__block_invoke;
  block[3] = &unk_264204088;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __25__PDFView_layoutSubviews__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 visiblePageViews];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setNeedsTilesUpdate];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)removeFromSuperview
{
  [(PDFView *)self clearSelection];
  v3.receiver = self;
  v3.super_class = (Class)PDFView;
  [(PDFView *)&v3 removeFromSuperview];
}

- (void)_commonInit
{
  self->_annotationEditingAllowed = 1;
  self->_formDetectionEnabled = 0;
  objc_super v3 = objc_alloc_init(PDFViewPrivate);
  uint64_t v4 = self->_private;
  self->_private = v3;

  uint64_t v5 = self->_private;
  document = v5->document;
  v5->document = 0;

  uint64_t v7 = self->_private;
  currentSelection = v7->currentSelection;
  v7->currentSelection = 0;

  self->_private->BOOL autoScale = 0;
  self->_private->zoomIncrement = 1.1892;
  objc_storeWeak((id *)&self->_private->delegate, 0);
  self->_private->delegateWillScale = 0;
  self->_private->delegateOrdersPageDrawing = 0;
  self->_private->gutterWide = 0.0;
  self->_private->displaysPageBreaks = 1;
  self->_private->pageBreakMargins = *(UIEdgeInsets *)kPDFViewDefaultPageBreakMargins;
  long long v9 = self->_private;
  long long v10 = *MEMORY[0x263F834E8];
  *(_OWORD *)&v9->documentMargins.double bottom = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
  *(_OWORD *)&v9->documentMargins.double top = v10;
  self->_private->displayMode = 1;
  self->_private->displayDirection = 0;
  long long v11 = objc_alloc_init(PDFViewLayout);
  long long v12 = self->_private;
  viewLayout = v12->viewLayout;
  v12->viewLayout = v11;

  [(PDFViewLayout *)self->_private->viewLayout setDelegate:self];
  self->_private->displaysAsBook = 0;
  self->_private->displaysRTL = 0;
  uint64_t v14 = objc_alloc_init(PDFRenderingProperties);
  CGFloat v15 = self->_private;
  renderingProperties = v15->renderingProperties;
  v15->renderingProperties = v14;

  [(PDFRenderingProperties *)self->_private->renderingProperties setPDFView:self];
  self->_private->lastVerticalScrollDirection = 2;
  self->_private->lastHorizontalScrollDirection = 1;
  self->_private->displaysBookmarksForPages = 0;
  self->_private->firstVisiblePage = 0;
  self->_private->lastVisiblePage = 0;
  self->_private->inhibitAutoScroll = 0;
  float v17 = self->_private;
  fromPage = v17->fromPage;
  v17->fromPage = 0;

  uint64_t v19 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
  objc_super v20 = self->_private;
  destinationHistordouble y = v20->destinationHistory;
  v20->destinationHistordouble y = (NSMutableArray *)v19;

  self->_private->unint64_t historyIndex = 0;
  double v22 = self->_private;
  highlights = v22->highlights;
  v22->highlights = 0;

  int v24 = [[PDFCoachMarkManager alloc] initWithPDFRenderingProperties:self->_private->renderingProperties];
  unsigned __int8 v25 = self->_private;
  coachMarkManager = v25->coachMarkManager;
  v25->coachMarkManager = v24;

  float v27 = self->_private;
  passwordViewController = v27->passwordViewController;
  v27->passwordViewController = 0;

  float v29 = self->_private;
  annotationOver = v29->annotationOver;
  v29->annotationOver = 0;

  self->_private->showsScrollIndicators = 1;
  self->_private->dataDetectorsEnabled = 1;
  self->_private->blockingWaitDuration = 0.0;
  self->_private->inFormFillingMode = 0;
  self->_private->formFillingUpdatesAnnotationOnEveryTextChange = 0;
  self->_private->allowsMarkupAnnotationEditing = 0;
  self->_private->allowsUndo = 1;
  self->_private->textSelectionEnabled = 0;
  int v31 = [[PDFViewController alloc] initWithView:self];
  unsigned __int8 v32 = self->_private;
  controller = v32->controller;
  v32->controller = v31;

  [(PDFView *)self colorWidgetBackgrounds:GetDefaultsWriteColorWidgetBackgrounds()];
  [(PDFView *)self _setupScrollView];
  id v37 = [MEMORY[0x263F08A00] defaultCenter];
  [v37 addObserver:self selector:sel_pdfViewDidChangeScale_ name:@"PDFViewScaleChanged" object:self];
  [v37 addObserver:self selector:sel_pdfViewDidChangePage_ name:@"PDFViewChangedPage" object:self];
  [v37 addObserver:self selector:sel_visiblePagesChanged_ name:@"PDFViewVisiblePagesChanged" object:self];
  unsigned __int8 v34 = [[PDFViewDebugFlags alloc] initWithView:self];
  int v35 = self->_private;
  debugFlags = v35->debugFlags;
  v35->debugFlags = v34;
}

- (void)dealloc
{
  overlayViewController = self->_overlayViewController;
  if (overlayViewController)
  {
    [(PDFOverlayViewsController *)overlayViewController teardown];
    uint64_t v4 = self->_overlayViewController;
    self->_overlayViewController = 0;
  }
  [(PDFView *)self _releaseDocument];
  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  uint64_t v6 = self->_private;
  debugFlags = v6->debugFlags;
  v6->debugFlags = 0;

  v8.receiver = self;
  v8.super_class = (Class)PDFView;
  [(PDFView *)&v8 dealloc];
}

- (CGAffineTransform)_transformFromPageToPageView:(SEL)a3
{
  id v6 = a4;
  CGFloat v7 = PDFRectToCGRect([v6 boundsForBox:0]);
  CGFloat v9 = v8;
  CGFloat v39 = v10;
  CGFloat v12 = v11;
  CGFloat rect = v11;
  CGFloat v13 = PDFRectToCGRect(objc_msgSend(v6, "boundsForBox:", -[PDFView displayBox](self, "displayBox")));
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  uint64_t v20 = [v6 rotation];

  v47.origin.double x = v7;
  v47.origin.double y = v9;
  v47.size.double width = v39;
  v47.size.double height = v12;
  double MinX = CGRectGetMinX(v47);
  v48.origin.double x = v13;
  v48.origin.double y = v15;
  v48.size.double width = v17;
  v48.size.double height = v19;
  CGFloat v22 = MinX - CGRectGetMinX(v48);
  v49.origin.double x = v7;
  v49.origin.double y = v9;
  v49.size.double width = v39;
  v49.size.double height = rect;
  double MinY = CGRectGetMinY(v49);
  v50.origin.double x = v13;
  v50.origin.double y = v15;
  v50.size.double width = v17;
  v50.size.double height = v19;
  CGFloat v24 = CGRectGetMinY(v50);
  uint64_t v25 = MEMORY[0x263F000D0];
  long long recta = *MEMORY[0x263F000D0];
  long long v40 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v40;
  long long v36 = *(_OWORD *)(v25 + 32);
  *(_OWORD *)&retstr->tdouble x = v36;
  CGAffineTransformMakeTranslation(&t2, v22, MinY - v24);
  *(_OWORD *)&t1.a = recta;
  *(_OWORD *)&t1.c = v40;
  *(_OWORD *)&t1.tdouble x = v36;
  CGAffineTransformConcat(retstr, &t1, &t2);
  double Width = 0.0;
  if (v20 > 179)
  {
    if (v20 == 180)
    {
      double v28 = PDFDegToRad(180.0);
      v54.origin.double x = v13;
      v54.origin.double y = v15;
      v54.size.double width = v17;
      v54.size.double height = v19;
      double Width = CGRectGetWidth(v54);
      double Height = 0.0;
    }
    else
    {
      double Height = 0.0;
      if (v20 != 270) {
        goto LABEL_12;
      }
      double v28 = PDFDegToRad(-90.0);
      v51.origin.double x = v13;
      v51.origin.double y = v15;
      v51.size.double width = v17;
      v51.size.double height = v19;
      double Width = CGRectGetHeight(v51);
      v52.origin.double x = v13;
      v52.origin.double y = v15;
      v52.size.double width = v17;
      v52.size.double height = v19;
      double Height = CGRectGetWidth(v52);
    }
    goto LABEL_10;
  }
  if (!v20)
  {
    v53.origin.double x = v13;
    v53.origin.double y = v15;
    v53.size.double width = v17;
    v53.size.double height = v19;
    double Height = CGRectGetHeight(v53);
    goto LABEL_12;
  }
  double Height = 0.0;
  if (v20 == 90)
  {
    double v28 = PDFDegToRad(90.0);
LABEL_10:
    if (v28 != 0.0)
    {
      CGAffineTransformMakeRotation(&v44, -v28);
      long long v29 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v43.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v43.c = v29;
      *(_OWORD *)&v43.tdouble x = *(_OWORD *)&retstr->tx;
      CGAffineTransformConcat(&t1, &v43, &v44);
      long long v30 = *(_OWORD *)&t1.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
      *(_OWORD *)&retstr->c = v30;
      *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&t1.tx;
    }
  }
LABEL_12:
  CGAffineTransformMakeScale(&v42, 1.0, -1.0);
  long long v31 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v43.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v43.c = v31;
  *(_OWORD *)&v43.tdouble x = *(_OWORD *)&retstr->tx;
  double result = CGAffineTransformConcat(&t1, &v43, &v42);
  long long v33 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v33;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&t1.tx;
  if (Width != 0.0 || Height != 0.0)
  {
    CGAffineTransformMakeTranslation(&v41, Width, Height);
    long long v34 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v43.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v43.c = v34;
    *(_OWORD *)&v43.tdouble x = *(_OWORD *)&retstr->tx;
    double result = CGAffineTransformConcat(&t1, &v43, &v41);
    long long v35 = *(_OWORD *)&t1.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
    *(_OWORD *)&retstr->c = v35;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&t1.tx;
  }
  return result;
}

- (CGAffineTransform)_transformFromPageViewToPage:(SEL)a3
{
  memset(&v6[1], 0, sizeof(CGAffineTransform));
  [(PDFView *)self _transformFromPageToPageView:a4];
  v6[0] = v6[1];
  return CGAffineTransformInvert(retstr, v6);
}

- (void)_setupPasswordView
{
  passwordViewController = self->_private->passwordViewController;
  if (!passwordViewController)
  {
    uint64_t v4 = [[PDFPasswordViewController alloc] initWithDelegate:self];
    uint64_t v5 = self->_private;
    id v6 = v5->passwordViewController;
    v5->passwordViewController = v4;

    passwordViewController = self->_private->passwordViewController;
  }
  id v9 = [(PDFPasswordViewController *)passwordViewController view];
  CGFloat v7 = [(PDFPasswordViewController *)self->_private->passwordViewController view];
  double v8 = [v7 superview];

  if (!v8)
  {
    [(PDFView *)self addSubview:v9];
    [v9 setAutoresizesSubviews:1];
    [v9 setAutoresizingMask:18];
    [(PDFView *)self bounds];
    objc_msgSend(v9, "setFrame:");
  }
  [v9 setHidden:0];
}

- (void)_removePasswordView
{
  v2 = [(PDFPasswordViewController *)self->_private->passwordViewController viewIfLoaded];
  if (v2)
  {
    id v3 = v2;
    [v2 setHidden:1];
    [v3 removeFromSuperview];
    v2 = v3;
  }
}

- (void)_updatePasswordView
{
  uint64_t v3 = [(PDFPasswordViewController *)self->_private->passwordViewController viewIfLoaded];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v3 = [(id)v3 isHidden];
    uint64_t v4 = v5;
    if ((v3 & 1) == 0)
    {
      uint64_t v3 = [(PDFView *)self bringSubviewToFront:v5];
      uint64_t v4 = v5;
    }
  }

  MEMORY[0x270F9A758](v3, v4);
}

- (BOOL)userDidEnterPassword:(id)a3 forPasswordViewController:(id)a4
{
  id v5 = a3;
  id v6 = [(PDFView *)self document];
  int v7 = [v6 isLocked];

  if (v7
    && ([(PDFView *)self document],
        double v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 unlockWithPassword:v5],
        v8,
        (v9 & 1) == 0))
  {
    double v11 = [(PDFView *)self window];
    CGFloat v12 = [v11 rootViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGFloat v13 = [v12 viewControllers];
      uint64_t v14 = [v13 objectAtIndex:0];

      CGFloat v12 = (void *)v14;
    }
    CGFloat v15 = [v12 presentedViewController];

    if (v15)
    {
      uint64_t v16 = [v12 presentedViewController];

      CGFloat v12 = (void *)v16;
    }
    [(PDFPasswordViewController *)self->_private->passwordViewController presentInvalidPasswordAlertWithParentViewController:v12];

    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_ensureOverlayViewController
{
  if (!self->_overlayViewController)
  {
    uint64_t v3 = +[PDFOverlayViewsController instanceForPlatformWithPDFView:self];
    overlayViewController = self->_overlayViewController;
    self->_overlayViewController = v3;
    MEMORY[0x270F9A758](v3, overlayViewController);
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(PDFViewController *)self->_private->controller textSelectionMenu];
  double v8 = NSStringFromSelector(a3);
  char v9 = [v8 isEqualToString:@"delete:"];

  if (v7 == 1
    && [(PDFRenderingProperties *)self->_private->renderingProperties isUsingPDFExtensionView]
    || [(PDFView *)self akAnnotationEditingEnabled])
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PDFView;
    unsigned __int8 v11 = [(PDFView *)&v17 canPerformAction:a3 withSender:v6];
    CGFloat v12 = NSStringFromSelector(a3);
    int v13 = [v12 isEqualToString:@"_lookup:"];

    if (v13)
    {
      uint64_t v14 = [(PDFView *)self currentSelection];
      if (v14)
      {
        CGFloat v15 = [(PDFView *)self currentSelection];
        int v10 = [v15 isEmpty] ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }
    }
    else
    {
      LOBYTE(v10) = v11 & ~v9;
    }
  }

  return v10;
}

- (void)gestureInit
{
  uint64_t v3 = self->_private;
  if (!v3->longPressGestureRecognizer)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F82938]) initWithTarget:self->_private->controller action:sel_handleGesture_];
    id v5 = self->_private;
    longPressGestureRecognizer = v5->longPressGestureRecognizer;
    v5->longPressGestureRecognizer = (UILongPressGestureRecognizer *)v4;

    [(UILongPressGestureRecognizer *)self->_private->longPressGestureRecognizer setDelegate:self];
    [(PDFView *)self addGestureRecognizer:self->_private->longPressGestureRecognizer];
    uint64_t v3 = self->_private;
  }
  if (!v3->tapGestureRecognizer)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self->_private->controller action:sel_handleGesture_];
    double v8 = self->_private;
    tapGestureRecognizer = v8->tapGestureRecognizer;
    v8->tapGestureRecognizer = (UITapGestureRecognizer *)v7;

    [(UITapGestureRecognizer *)self->_private->tapGestureRecognizer setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)self->_private->tapGestureRecognizer setDelegate:self];
    [(UITapGestureRecognizer *)self->_private->tapGestureRecognizer setAllowedTouchTypes:&unk_26C52E688];
    [(PDFView *)self addGestureRecognizer:self->_private->tapGestureRecognizer];
    uint64_t v3 = self->_private;
  }
  if (!v3->doubleTapGestureRecognizer)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self->_private->controller action:sel_handleGesture_];
    unsigned __int8 v11 = self->_private;
    doubleTapGestureRecognizer = v11->doubleTapGestureRecognizer;
    v11->doubleTapGestureRecognizer = (UITapGestureRecognizer *)v10;

    [(UITapGestureRecognizer *)self->_private->doubleTapGestureRecognizer setNumberOfTapsRequired:2];
    [(UITapGestureRecognizer *)self->_private->doubleTapGestureRecognizer setDelegate:self];
    [(PDFView *)self addGestureRecognizer:self->_private->doubleTapGestureRecognizer];
    uint64_t v3 = self->_private;
  }
  [(UITapGestureRecognizer *)v3->tapGestureRecognizer requireGestureRecognizerToFail:v3->longPressGestureRecognizer];
  [(UITapGestureRecognizer *)self->_private->tapGestureRecognizer requireGestureRecognizerToFail:self->_private->doubleTapGestureRecognizer];
  id v13 = [(PDFScrollView *)self->_private->scrollView panGestureRecognizer];
  [v13 requireGestureRecognizerToFail:self->_private->longPressGestureRecognizer];
}

- (void)addGestureRecognizer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PDFView;
  [(PDFView *)&v9 addGestureRecognizer:a3];
  uint64_t v4 = [(PDFView *)self documentView];
  id v5 = self->_private;
  if (v5->isUsingPageViewController)
  {
    id v6 = [(PDFDocumentViewController *)v5->documentViewController currentPage];
    uint64_t v7 = [(PDFDocumentViewController *)self->_private->documentViewController findPageViewControllerForPageIndex:[(PDFDocument *)self->_private->document indexForPage:v6]];
    uint64_t v8 = [v7 textInputView];

    uint64_t v4 = (void *)v8;
  }
  [v4 updateGestureRecognizerDependencies];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  uint64_t v8 = v7;
  BOOL v9 = self->_private->doubleTapGestureRecognizer != v6 || ([v7 _isPointerTouch] & 1) == 0;

  return v9;
}

- (BOOL)acceptSingleTouch:(id)a3
{
  [a3 locationInView:self];
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 0);
  if (v8)
  {
    -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v8, v5, v7);
    double v10 = v9;
    double v12 = v11;
    id v13 = objc_msgSend(v8, "annotationAtPoint:");
    if ((v13
       || (objc_msgSend(v8, "scannedAnnotationAtPoint:", v10, v12),
           (id v13 = objc_claimAutoreleasedReturnValue()) != 0))
      && ([v13 handledByPDFKit] & 1) != 0
      || ([(PDFViewController *)self->_private->controller activeAnnotation],
          uint64_t v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v14))
    {
      BOOL v15 = 1;
    }
    else
    {
      uint64_t v16 = [(PDFView *)self currentSelection];
      objc_super v17 = v16;
      BOOL v15 = v16 && ![v16 isEmpty];
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  [v4 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  unint64_t v9 = [(PDFView *)self typeForGestureRecognizer:v4];
  double v10 = self->_private;
  if (v10->tapGestureRecognizer == v4)
  {
    double v12 = -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 0, v6, v8);
    currentSelection = self->_private->currentSelection;
    if (!currentSelection || (BOOL v14 = [(PDFSelection *)currentSelection isEmpty], v12) || v14)
    {
      if (-[PDFView _shouldHandleAnnotationAtLocation:forGestureType:](self, "_shouldHandleAnnotationAtLocation:forGestureType:", v9, v6, v8))
      {

        double v10 = self->_private;
        goto LABEL_2;
      }
      BOOL v15 = [(PDFViewController *)self->_private->controller activeAnnotation];
      char v16 = [v15 isMarkupAnnotationSubtype];
      objc_super v17 = [v15 valueForAnnotationKey:@"/Subtype"];
      int v18 = [v17 isEqualToString:@"/Text"];

      if ((v16 & 1) != 0 || v18) {
        [(PDFViewController *)self->_private->controller removeControlForAnnotation:v15];
      }

      LOBYTE(v11) = 0;
    }
    else
    {
      LOBYTE(v11) = 1;
    }

    goto LABEL_21;
  }
LABEL_2:
  if (v10->doubleTapGestureRecognizer == v4)
  {
    if (!PDFKitIsFormFillingEnabled() || ![(PDFView *)self isInFormFillingMode])
    {
      BOOL v11 = ![(PDFView *)self isInMarkupMode];
      goto LABEL_21;
    }
    goto LABEL_12;
  }
  if (v10->longPressGestureRecognizer != v4
    || -[PDFView _shouldHandleAnnotationAtLocation:forGestureType:](self, "_shouldHandleAnnotationAtLocation:forGestureType:", v9, v6, v8))
  {
LABEL_12:
    LOBYTE(v11) = 1;
    goto LABEL_21;
  }
  LOBYTE(v11) = 0;
LABEL_21:

  return v11;
}

- (void)handleGesture:(unint64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6 isIndirectTouch:(BOOL)a7
{
  BOOL v7 = a7;
  double y = a6.y;
  double x = a6.x;
  double v10 = a5.y;
  double v11 = a5.x;
  if (a3 != 1 || !a7) {
    -[PDFViewController handleGesture:state:location:](self->_private->controller, "handleGesture:state:location:", a3, a4, a5.x, a5.y);
  }
  if ([(PDFRenderingProperties *)self->_private->renderingProperties isUsingPDFExtensionView])
  {
    id v15 = [(PDFView *)self documentView];
    objc_msgSend(v15, "handleGesture:state:location:locationOfFirstTouch:isIndirectTouch:", a3, a4, v7, v11, v10, x, y);
  }
}

- (unint64_t)typeForGestureRecognizer:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v4 = [v3 numberOfTapsRequired] == 2;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v4 = 2;
    }
    else {
      unint64_t v4 = 4;
    }
  }

  return v4;
}

- (unint64_t)scrollViewMinimumNumberOfTouches
{
  if (![(PDFView *)self isInMarkupMode]) {
    return 1;
  }
  if ([MEMORY[0x263F82A20] prefersPencilOnlyDrawing]) {
    return 1;
  }
  return 2;
}

- (id)pointerRegionForLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [PDFPointerRegion alloc];
  BOOL v7 = [(PDFPointerRegion *)v6 initWithRect:@"PDFPointerRegionPage", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24) identifier];
  char v8 = -[PDFView areaOfInterestForPoint:](self, "areaOfInterestForPoint:", x, y);
  if ((v8 & 0xA) != 0)
  {
    char v9 = v8;
    double v10 = -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 1, x, y);
    -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v10, x, y);
    if ((v9 & 8) != 0)
    {
      double v11 = objc_msgSend(v10, "annotationAtPoint:");
      [(PDFPointerRegion *)v7 setIdentifier:@"PDFPointerRegionLink"];
      [v11 bounds];
      -[PDFView convertRect:fromPage:](self, "convertRect:fromPage:", v10);
      -[PDFPointerRegion setRect:](v7, "setRect:");
    }
    else
    {
      if ((v9 & 2) == 0)
      {
LABEL_9:
        [(PDFPointerRegion *)v7 rect];
        CGRect v26 = PDFRectInset(v25, -1.2, -1.2);
        -[PDFPointerRegion setRect:](v7, "setRect:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
LABEL_10:

        goto LABEL_11;
      }
      double v11 = objc_msgSend(v10, "selectionForLineAtPoint:");
      double v12 = [v11 string];
      id v13 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      BOOL v14 = [v12 stringByTrimmingCharactersInSet:v13];

      if (!v14 || ![v14 length])
      {

        goto LABEL_10;
      }
      [v11 boundsForPage:v10];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      [(PDFPointerRegion *)v7 setIdentifier:@"PDFPointerRegionText"];
      -[PDFView convertRect:fromPage:](self, "convertRect:fromPage:", v10, v16, v18, v20, v22);
      -[PDFPointerRegion setRect:](v7, "setRect:");
    }
    goto LABEL_9;
  }
LABEL_11:

  return v7;
}

- (id)hitTestForSubviewsOfView:(id)a3 atLocation:(CGPoint)a4 withEvent:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v8 = a3;
  id v9 = a5;
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x3032000000;
  CGFloat v24 = __Block_byref_object_copy__6;
  CGRect v25 = __Block_byref_object_dispose__6;
  id v26 = 0;
  double v10 = [v8 subviews];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__PDFView_hitTestForSubviewsOfView_atLocation_withEvent___block_invoke;
  v15[3] = &unk_2642054E0;
  CGFloat v19 = x;
  CGFloat v20 = y;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  double v18 = &v21;
  [v10 enumerateObjectsUsingBlock:v15];

  id v13 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v13;
}

void __57__PDFView_hitTestForSubviewsOfView_atLocation_withEvent___block_invoke(double *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *((void *)a1 + 4);
  double v7 = a1[7];
  double v8 = a1[8];
  id v9 = a2;
  objc_msgSend(v9, "convertPoint:fromView:", v6, v7, v8);
  objc_msgSend(v9, "hitTest:withEvent:", *((void *)a1 + 5));
  id obj = (id)objc_claimAutoreleasedReturnValue();

  double v10 = obj;
  if (obj)
  {
    objc_storeStrong((id *)(*(void *)(*((void *)a1 + 6) + 8) + 40), obj);
    double v10 = obj;
    *a4 = 1;
  }
}

- (BOOL)_shouldHandleAnnotationAtLocation:(CGPoint)a3 forGestureType:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  v32[1] = *MEMORY[0x263EF8340];
  double v8 = -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 0);
  if (v8)
  {
    -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v8, x, y);
    double v10 = v9;
    double v12 = v11;
    id v13 = objc_msgSend(v8, "annotationAtPoint:");
    BOOL v14 = [(PDFViewController *)self->_private->controller activeAnnotation];
    if (!v13)
    {
      id v13 = objc_msgSend(v8, "scannedAnnotationAtPoint:", v10, v12);
      if (!v13)
      {
        if (a4) {
          BOOL v25 = 1;
        }
        else {
          BOOL v25 = v14 == 0;
        }
        char v21 = !v25;
        goto LABEL_29;
      }
    }
    double v15 = [v13 valueForAnnotationKey:@"/Subtype"];
    int v16 = [v15 isEqualToString:@"/Link"];
    int v17 = [v15 isEqualToString:@"/Text"];
    int v18 = [v13 isMarkupAnnotationSubtype];
    int v19 = [v15 isEqualToString:@"/Widget"];
    if (a4)
    {
      if (a4 == 2)
      {
        if (v18) {
          char v20 = objc_msgSend(v13, "noteContainsPoint:", v10, v12);
        }
        else {
          char v20 = 0;
        }
        char v21 = v17 | v20;
        goto LABEL_28;
      }
    }
    else if (((v16 | v17 | v18) & 1) != 0 {
           || v19
    }
           && (([v13 valueForAnnotationKey:@"/FT"],
                double v22 = objc_claimAutoreleasedReturnValue(),
                char v23 = [v22 isEqualToString:@"/Btn"],
                ([v22 isEqualToString:@"/Tx"] & 1) == 0)
             ? (char v24 = [v22 isEqualToString:@"/Ch"])
             : (char v24 = 1),
               v13 != v14 ? (char v26 = v24) : (char v26 = 0),
               char v27 = v23 | v26,
               v22,
               (v27 & 1) != 0))
    {
      char v21 = 1;
LABEL_28:

LABEL_29:
      goto LABEL_30;
    }
    double v28 = [MEMORY[0x263F08A00] defaultCenter];
    long long v31 = @"PDFAnnotationHit";
    v32[0] = v13;
    long long v29 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    [v28 postNotificationName:@"PDFViewAnnotationHit" object:self userInfo:v29];

    char v21 = 0;
    goto LABEL_28;
  }
  char v21 = 0;
LABEL_30:

  return v21;
}

- (id)_dragItemsAtLocationInView:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v24[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_opt_new();
  if (![(PDFDocument *)self->_private->document allowsCopying])
  {
    id v19 = v6;
    goto LABEL_16;
  }
  id v7 = objc_alloc_init(MEMORY[0x263F088E0]);
  double v8 = -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 0, x, y);
  -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v8, x, y);
  double v11 = v9;
  double v12 = v10;
  if (v8
    && (objc_msgSend(v8, "annotationAtPoint:", v9, v10), (id v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v14 = v13;
    double v15 = [v13 URL];

    int v16 = [(PDFView *)self currentSelection];
    if (v15)
    {
      int v17 = [v14 URL];
      [v7 registerObject:v17 visibility:0];

      [v14 bounds];
      CGRect v27 = PDFRectInset(v26, -3.0, -3.0);
      int v18 = objc_msgSend(v8, "selectionForRect:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
      [(PDFView *)self setCurrentSelection:v18];
      goto LABEL_12;
    }
  }
  else
  {
    int v16 = [(PDFView *)self currentSelection];
    BOOL v14 = 0;
  }
  if (v16
    && ([v16 isEmpty] & 1) == 0
    && objc_msgSend(v16, "containsPoint:onPage:", v8, v11, v12))
  {
    char v20 = [v16 string];
    [v7 registerObject:v20 visibility:0];

    int v18 = [v16 attributedString];
    [v7 registerObject:v18 visibility:0];
LABEL_12:
    char v21 = (void *)[objc_alloc(MEMORY[0x263F826C8]) initWithItemProvider:v7];

    if (v21)
    {
      v24[0] = v21;
      uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];

      uint64_t v6 = (void *)v22;
    }
    goto LABEL_15;
  }
  char v21 = 0;
LABEL_15:
  id v19 = v6;

LABEL_16:

  return v19;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5 = a4;
  if ([(PDFView *)self isInMarkupMode])
  {
    uint64_t v6 = 0;
  }
  else
  {
    [v5 locationInView:self];
    uint64_t v6 = -[PDFView _dragItemsAtLocationInView:](self, "_dragItemsAtLocationInView:");
    if ([v6 count])
    {
      [(UILongPressGestureRecognizer *)self->_private->longPressGestureRecognizer setEnabled:0];
      [(UILongPressGestureRecognizer *)self->_private->longPressGestureRecognizer setEnabled:1];
    }
  }

  return v6;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  if ([(UITapGestureRecognizer *)self->_private->tapGestureRecognizer state] == 5)
  {
    double v8 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    double v8 = -[PDFView _dragItemsAtLocationInView:](self, "_dragItemsAtLocationInView:", x, y);
  }

  return v8;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  uint64_t v6 = [(PDFView *)self currentSelection];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v7 = [v6 pages];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v52;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v52 != v10) {
        objc_enumerationMutation(v7);
      }
      double v12 = *(void **)(*((void *)&v51 + 1) + 8 * v11);
      id v13 = [(PDFView *)self pageViewForPageAtIndex:[(PDFDocument *)self->_private->document indexForPage:v12]];
      if ([v13 isVisible]) {
        break;
      }

      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v51 objects:v55 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v15 = v12;

    if (v15)
    {
      [v6 boundsForPage:v15];
      CGRect v59 = CGRectInset(v58, -4.0, -4.0);
      CGFloat x = v59.origin.x;
      CGFloat y = v59.origin.y;
      double width = v59.size.width;
      CGFloat height = v59.size.height;
      -[PDFView convertRect:fromPage:](self, "convertRect:fromPage:", v15);
      double v21 = v20;
      double v38 = v22;
      double v39 = v20;
      double v24 = v23;
      double v26 = v25;
      double v27 = PDFScreenGetBackingScaleFactor() * (v23 / width);
      double v28 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", v24, v26);
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __57__PDFView_dragInteraction_previewForLiftingItem_session___block_invoke;
      v40[3] = &unk_264205508;
      double v42 = v21;
      double v43 = v38;
      double v44 = v24;
      double v45 = v26;
      CGFloat v46 = x;
      id v41 = v15;
      CGFloat v47 = y;
      double v48 = width;
      CGFloat v49 = height;
      double v50 = v27;
      id v7 = v15;
      long long v29 = [v28 imageWithActions:v40];
      long long v30 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v29];
      long long v31 = [v30 layer];
      [v31 setCornerRadius:16.0];

      unsigned __int8 v32 = [v30 layer];
      [v32 setMasksToBounds:1];

      objc_msgSend(v30, "setFrame:", v39, v38, v24, v26);
      [(PDFView *)self clearSelection];
      id v33 = objc_alloc(MEMORY[0x263F826E0]);
      long long v34 = (void *)[v33 initWithTextLineRects:MEMORY[0x263EFFA68]];
      id v35 = objc_alloc(MEMORY[0x263F826F0]);
      UIRectGetCenter();
      long long v36 = objc_msgSend(v35, "initWithContainer:center:", self);
      BOOL v14 = (void *)[objc_alloc(MEMORY[0x263F82CB8]) initWithView:v30 parameters:v34 target:v36];

      goto LABEL_12;
    }
    BOOL v14 = 0;
  }
  else
  {
LABEL_9:
    BOOL v14 = 0;
LABEL_12:
  }

  return v14;
}

uint64_t __57__PDFView_dragInteraction_previewForLiftingItem_session___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (CGContext *)[a2 CGContext];
  CGContextSetRGBFillColor(v3, 1.0, 1.0, 1.0, 1.0);
  v11.size.double width = *(CGFloat *)(a1 + 56);
  v11.size.CGFloat height = *(CGFloat *)(a1 + 64);
  v11.origin.CGFloat x = 0.0;
  v11.origin.CGFloat y = 0.0;
  CGContextFillRect(v3, v11);
  [*(id *)(a1 + 32) boundsForBox:0];
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeTranslation(&v10, v4 - *(double *)(a1 + 72), v5 - *(double *)(a1 + 80));
  CGAffineTransformMakeScale(&t2, *(CGFloat *)(a1 + 104), *(CGFloat *)(a1 + 104));
  CGAffineTransform v7 = v10;
  CGAffineTransformConcat(&v9, &v7, &t2);
  CGAffineTransform v10 = v9;
  CGContextSetCTM();
  return [*(id *)(a1 + 32) drawWithBox:0 toContext:v3];
}

- (void)setFindInteractionEnabled:(BOOL)findInteractionEnabled
{
  BOOL v3 = findInteractionEnabled;
  findInteraction = self->_private->findInteraction;
  if (v3)
  {
    if (!findInteraction)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x263F82730]) initWithSessionDelegate:self];
      CGAffineTransform v7 = self->_private;
      uint64_t v8 = v7->findInteraction;
      v7->findInteraction = (UIFindInteraction *)v6;

      findInteraction = self->_private->findInteraction;
    }
    [(PDFView *)self addInteraction:findInteraction];
  }
  else if (findInteraction)
  {
    -[PDFView removeInteraction:](self, "removeInteraction:");
  }
}

- (UIFindInteraction)findInteraction
{
  return self->_private->findInteraction;
}

- (void)find:(id)a3
{
}

- (void)findNext:(id)a3
{
}

- (void)findPrevious:(id)a3
{
}

- (id)findInteraction:(id)a3 sessionForView:(id)a4
{
  id v5 = objc_alloc(MEMORY[0x263F82D50]);
  uint64_t v6 = [(PDFView *)self documentView];
  CGAffineTransform v7 = (void *)[v5 initWithSearchableObject:v6];

  return v7;
}

- (id)PDFLayout
{
  return self->_private->viewLayout;
}

- (CGRect)normalizedPageBounds:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "boundsForBox:", -[PDFView displayBox](self, "displayBox"));
  double v6 = v5;
  double v8 = v7;
  double v9 = PDFPointMake(0.0, 0.0);
  double v11 = v10;
  if (![v4 pageRef])
  {
    v12.n128_u64[0] = 0;
    v13.n128_u64[0] = 0;
    double v9 = PDFRectMake(v12, v13, 306.0, 396.0);
    double v11 = v14;
    double v6 = v15;
    double v8 = v16;
  }
  int v17 = [v4 rotation];
  if (v17 == 270 || v17 == 90)
  {
    double v18 = v6;
  }
  else
  {
    double v18 = v8;
    double v8 = v6;
  }

  double v19 = v9;
  double v20 = v11;
  double v21 = v8;
  double v22 = v18;
  result.size.CGFloat height = v22;
  result.size.double width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (double)_pageViewHeight:(id)a3
{
  id v4 = a3;
  [(PDFView *)self normalizedPageBounds:v4];
  double v6 = v5;
  double v7 = [(PDFView *)self PDFLayout];
  uint64_t v8 = [v7 functionalDisplayMode];

  if (v8 == 3)
  {
    double v9 = [(PDFView *)self PDFLayout];
    double v10 = [v9 facingPageForPage:v4];

    if (v10)
    {
      [(PDFView *)self normalizedPageBounds:v10];
      if (v11 > v6) {
        double v6 = v11;
      }
    }
  }
  [(PDFView *)self pageBreakMargins];
  double v14 = v6 + v12 + v13;

  return v14;
}

- (double)autoScaleFactorForPage:(id)a3
{
  [(PDFView *)self _unboundAutoScaleFactorForPage:a3];

  -[PDFView PDFViewWillChangeScaleFactor:toScale:](self, "PDFViewWillChangeScaleFactor:toScale:", self);
  return result;
}

- (double)autoScaleFactorForPageWithSize:(CGSize)a3
{
  -[PDFView _unboundAutoScaleFactorForPageWithSize:](self, "_unboundAutoScaleFactorForPageWithSize:", a3.width, a3.height);

  -[PDFView PDFViewWillChangeScaleFactor:toScale:](self, "PDFViewWillChangeScaleFactor:toScale:", self);
  return result;
}

- (double)_unboundAutoScaleFactorForPage:(id)a3
{
  if (!a3) {
    return 1.0;
  }
  id v4 = a3;
  double v5 = [(PDFView *)self PDFLayout];
  [v5 contentSizeWithCurrentPage:v4];
  double v7 = v6;
  double v9 = v8;

  -[PDFView _unboundAutoScaleFactorForPageWithSize:](self, "_unboundAutoScaleFactorForPageWithSize:", v7, v9);
  return result;
}

- (double)_unboundAutoScaleFactorForPageWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PDFScrollView *)self->_private->scrollView bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(PDFScrollView *)self->_private->scrollView safeAreaInsets];
  double v21 = PDFEdgeInsetsInsetRect(v7, v9, v11, v13, v14, v15, v16, v17);
  double result = 1.0;
  if (width != 0.0)
  {
    double v23 = v18;
    double v24 = v19;
    double v25 = v20;
    [(PDFView *)self gutterWidth];
    if (v26 > 0.0)
    {
      [(PDFView *)self gutterWidth];
      double v24 = v24 - v27;
      double v28 = [(PDFView *)self PDFLayout];
      uint64_t v29 = [v28 functionalDisplayMode];

      if (v29 >= 2)
      {
        [(PDFView *)self gutterWidth];
        double v24 = v24 - v30;
      }
    }
    long long v31 = [(PDFView *)self PDFLayout];
    uint64_t v32 = [v31 functionalDisplayMode];

    if (v32)
    {
      if ([(PDFView *)self displayDirection] == kPDFDisplayDirectionVertical || v32 == 3) {
        return v24 / width;
      }
      else {
        return v25 / height;
      }
    }
    else
    {
      v33.n128_u64[0] = 0;
      v34.n128_u64[0] = 0;
      double v35 = PDFRectMake(v33, v34, width, height);
      return PDFScaleRectToRect(v35, v36, v37, v38, v21, v23, v24, v25);
    }
  }
  return result;
}

- (void)beginPDFViewRotation
{
  if (self->_private->document)
  {
    id v15 = [(PDFView *)self documentView];
    [v15 bounds];
    -[PDFView convertRect:fromView:](self, "convertRect:fromView:", v15);
    double v4 = v3;
    [(PDFView *)self bounds];
    self->_private->horizontalScaleFactorBeforeRotation = v4
                                                        / (v5
                                                         - (self->_private->savedSafeAreaInsets.left
                                                          + self->_private->savedSafeAreaInsets.right));
    -[PDFView convertRect:toView:](self, "convertRect:toView:", v15);
    CGFloat v7 = v6;
    double v8 = self->_private;
    v8->documentViewCenterBeforeRotation.CGFloat x = PDFRectGetCenterPoint(v9, v6, v10);
    v8->documentViewCenterBeforeRotation.CGFloat y = v11;
    [(PDFScrollView *)self->_private->scrollView contentOffset];
    double v13 = v12;
    [(PDFScrollView *)self->_private->scrollView contentInset];
    if (fabs(v13 + v14) < 1.0) {
      self->_private->documentViewCenterBeforeRotation.CGFloat y = v7;
    }
  }
}

- (void)endPDFViewRotation
{
  if (self->_private->document)
  {
    id v39 = [(PDFView *)self documentView];
    [(PDFView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v11 = self->_private->horizontalScaleFactorBeforeRotation
        * (v7 - (self->_private->savedSafeAreaInsets.left + self->_private->savedSafeAreaInsets.right));
    [v39 bounds];
    double v13 = v11 / v12;
    [(PDFView *)self autoScaleFactor];
    double v15 = v14;
    [(PDFView *)self maxScaleFactor];
    [(PDFView *)self setMinScaleFactor:fmin(v15, v16)];
    [(PDFView *)self setScaleFactor:v13];
    -[PDFView convertRect:toView:](self, "convertRect:toView:", v39, v4, v6, v8, v10);
    objc_msgSend(v39, "convertPoint:toView:", self->_private->scrollView, PDFPointMake(self->_private->documentViewCenterBeforeRotation.x - v17 * 0.5, self->_private->documentViewCenterBeforeRotation.y - v18 * 0.5));
    double v20 = v19;
    double v22 = v21;
    double v23 = self->_private->scrollView;
    [(PDFScrollView *)v23 bounds];
    double v25 = v24;
    double v27 = v26;
    [(PDFScrollView *)v23 contentSize];
    double v29 = v28;
    double v31 = v30;
    [(PDFScrollView *)v23 contentInset];
    double v33 = v32;
    double v35 = v34;
    if (v29 - v25 >= 0.0) {
      double v36 = v29 - v25;
    }
    else {
      double v36 = 0.0;
    }
    double v37 = CGFloatClamp(v20, 0.0, v36);
    if (v31 - v27 + v35 >= 0.0) {
      double v38 = v31 - v27 + v35;
    }
    else {
      double v38 = 0.0;
    }
    -[PDFScrollView setContentOffset:](v23, "setContentOffset:", v37, CGFloatClamp(v22, -v33, v38));
  }
}

- (unint64_t)lastPageIndex
{
  unint64_t result = (unint64_t)self->_private->document;
  if (result) {
    return [(id)result pageCount] - 1;
  }
  return result;
}

- (void)_internalSetAutoScaleFactor
{
  BOOL autoScale = self->_private->autoScale;
  [(PDFView *)self autoScaleFactor];
  double v5 = v4;
  [(PDFScrollView *)self->_private->scrollView contentOffset];
  double v7 = v6;
  [(PDFView *)self minScaleFactor];
  if (v8 > v5) {
    [(PDFView *)self setMinScaleFactor:v5];
  }
  [(PDFView *)self maxScaleFactor];
  if (v9 < v5) {
    [(PDFView *)self setMaxScaleFactor:v5];
  }
  [(PDFView *)self _internalSetScaleFactor:v5];
  if (v7 <= 0.0)
  {
    [(PDFScrollView *)self->_private->scrollView contentOffset];
    double v11 = v10;
    [(PDFScrollView *)self->_private->scrollView contentInset];
    [(PDFScrollView *)self->_private->scrollView setContentOffset:PDFPointMake(v11, -v12)];
  }
  self->_private->BOOL autoScale = autoScale;
}

- (void)_internalSetScaleFactor:(double)a3
{
  [(PDFView *)self PDFViewWillChangeScaleFactor:self toScale:a3];
  double v5 = v4;
  [(PDFView *)self minScaleFactor];
  if (v5 < v6)
  {
    [(PDFView *)self minScaleFactor];
LABEL_5:
    double v5 = v7;
    goto LABEL_6;
  }
  [(PDFView *)self maxScaleFactor];
  if (v5 > v8)
  {
    [(PDFView *)self maxScaleFactor];
    goto LABEL_5;
  }
LABEL_6:
  if (v5 != 0.0)
  {
    [(PDFView *)self scaleFactor];
    if (vabdd_f64(v5, v9) >= 0.00000011920929)
    {
      [(PDFScrollView *)self->_private->scrollView setZoomScale:v5];
      self->_private->scaling = 1;
      [(PDFView *)self layoutDocumentView];
      self->_private->scaling = 0;
      id v10 = [MEMORY[0x263F08A00] defaultCenter];
      [v10 postNotificationName:@"PDFViewScaleChanged" object:self];
    }
  }
}

- (CGFloat)maxScaleFactor
{
  v2 = self->_private;
  if (v2->isUsingPageViewController) {
    [(PDFDocumentViewController *)v2->documentViewController maxScaleFactor];
  }
  else {
    [(PDFScrollView *)v2->scrollView maximumZoomScale];
  }
  return result;
}

- (CGFloat)minScaleFactor
{
  v2 = self->_private;
  if (v2->isUsingPageViewController) {
    [(PDFDocumentViewController *)v2->documentViewController minScaleFactor];
  }
  else {
    [(PDFScrollView *)v2->scrollView minimumZoomScale];
  }
  return result;
}

- (void)setMaxScaleFactor:(CGFloat)maxScaleFactor
{
  [(PDFView *)self setAutoScales:0];
  [(PDFView *)self scaleFactor];
  if (v5 > maxScaleFactor) {
    [(PDFView *)self setScaleFactor:maxScaleFactor];
  }
  double v6 = self->_private;
  if (v6->isUsingPageViewController)
  {
    documentViewController = v6->documentViewController;
    [(PDFView *)self minScaleFactor];
    -[PDFDocumentViewController setMinScaleFactor:withMaxScaleFactor:](documentViewController, "setMinScaleFactor:withMaxScaleFactor:");
  }
  else
  {
    scrollView = v6->scrollView;
    [(PDFScrollView *)scrollView setMaximumZoomScale:maxScaleFactor];
  }
}

- (void)setMinScaleFactor:(CGFloat)minScaleFactor
{
  [(PDFView *)self setAutoScales:0];
  [(PDFView *)self scaleFactor];
  if (v5 < minScaleFactor) {
    [(PDFView *)self setScaleFactor:minScaleFactor];
  }
  double v6 = self->_private;
  if (v6->isUsingPageViewController)
  {
    documentViewController = v6->documentViewController;
    [(PDFView *)self maxScaleFactor];
    [(PDFDocumentViewController *)documentViewController setMinScaleFactor:minScaleFactor withMaxScaleFactor:v8];
  }
  else
  {
    scrollView = v6->scrollView;
    [(PDFScrollView *)scrollView setMinimumZoomScale:minScaleFactor];
  }
}

- (void)_reflectNewPageOn
{
  v54[2] = *MEMORY[0x263EF8340];
  double v3 = [(PDFView *)self PDFLayout];
  char v4 = [v3 functionalDisplayMode];

  if (v4)
  {
    viewLayout = self->_private->viewLayout;
    double v6 = [(PDFView *)self currentPage];
    [(PDFViewLayout *)viewLayout boundsForPage:v6];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    double v15 = [(PDFView *)self documentView];
    [v15 bounds];
    double v17 = v16 - v10 - v14;

    if ([(PDFRenderingProperties *)self->_private->renderingProperties isUsingPDFExtensionView])
    {
      document = self->_private->document;
      double v19 = [(PDFView *)self currentPage];
      uint64_t v20 = [(PDFDocument *)document indexForPage:v19];

      [(PDFView *)self setCurrentPageIndex:v20 withNotification:0];
      double v21 = [MEMORY[0x263F08A00] defaultCenter];
      v53[0] = @"pageIndex";
      double v22 = [NSNumber numberWithInteger:v20];
      v53[1] = @"pageFrame";
      v54[0] = v22;
      double v23 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", v8, v17, v12, v14);
      v54[1] = v23;
      double v24 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
      [v21 postNotificationName:@"PDFExtensionViewGoToPage" object:self userInfo:v24];

      return;
    }
    if ([(PDFView *)self autoScales]) {
      [(PDFView *)self _internalSetAutoScaleFactor];
    }
    double v25 = [(PDFScrollView *)self->_private->scrollView pdfDocumentView];
    objc_msgSend(v25, "convertRect:toView:", self->_private->scrollView, v8, v17, v12, v14);
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;

    [(PDFScrollView *)self->_private->scrollView bounds];
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    int64_t displayDirection = self->_private->displayDirection;
    [(PDFView *)self frame];
    double v45 = v44 - v33;
    double v46 = (v44 - v33) * 0.5;
    BOOL v47 = v45 <= 0.0;
    double v48 = 0.0;
    if (v47) {
      double v46 = 0.0;
    }
    double v49 = v29 - v46;
    double v50 = v43 - v31;
    if (v50 > 0.0) {
      double v48 = v50 * 0.5;
    }
    double v51 = v27 - v48;
    if (displayDirection == 1) {
      double v52 = v37;
    }
    else {
      double v52 = v49;
    }
    if (displayDirection != 1) {
      double v51 = v35;
    }
    -[PDFScrollView scrollRectToVisible:animated:](self->_private->scrollView, "scrollRectToVisible:animated:", 0, v51, v52, v39, v41);
  }
  else
  {
    [(PDFView *)self _resizeDisplayView:self];
  }

  [(PDFView *)self _findVisiblePages];
}

- (id)determineCurrentPage
{
  double v3 = [(PDFView *)self PDFLayout];
  char v4 = [v3 functionalDisplayMode];

  if (v4)
  {
    [(PDFView *)self bounds];
    double v7 = v6;
    [(PDFView *)self bounds];
    [(PDFView *)self pageForPoint:1 nearest:PDFPointMake(0.0, (v7 + v8) * 0.5)];
  }
  else
  {
    [(PDFView *)self currentPage];
  CGFloat v5 = };

  return v5;
}

- (void)scrollViewSaysPageMayHaveChanged:(id)a3
{
  char v4 = [a3 object];
  scrollView = self->_private->scrollView;

  if (v4 == scrollView)
  {
    [(PDFView *)self syncPageIndexToScrollView];
  }
}

- (void)pageViewControllerSaysPageChanged:(id)a3
{
  char v4 = [a3 userInfo];
  CGFloat v5 = [v4 objectForKeyedSubscript:@"pageIndex"];
  uint64_t v6 = [v5 integerValue];

  [(PDFView *)self setCurrentPageIndex:v6 withNotification:1];
}

- (void)_syncPageIndexToScrollView
{
  [(PDFView *)self _updateCurrentPageUsingViewCenter];

  [(PDFView *)self _findVisiblePages];
}

- (void)syncPageIndexToScrollView
{
  v5[2] = *MEMORY[0x263EF8340];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__syncPageIndexToScrollView object:0];
  uint64_t v3 = *MEMORY[0x263F83BF8];
  v5[0] = *MEMORY[0x263EFF588];
  v5[1] = v3;
  char v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  [(PDFView *)self performSelector:sel__syncPageIndexToScrollView withObject:0 afterDelay:v4 inModes:0.05];
}

- (void)_updateCurrentPageUsingViewCenter
{
  CGFloat v3 = PDFRectToCGRect([(PDFView *)self bounds]);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  if ([(PDFRenderingProperties *)self->_private->renderingProperties isUsingPDFExtensionView])
  {
    [(PDFView *)self extensionViewBoundsInDocument];
    CGFloat v3 = v10;
    CGFloat v5 = v11;
    CGFloat v7 = v12;
    CGFloat v9 = v13;
  }
  v22.origin.CGFloat x = v3;
  v22.origin.CGFloat y = v5;
  v22.size.double width = v7;
  v22.size.double height = v9;
  double MidX = CGRectGetMidX(v22);
  v23.origin.CGFloat x = v3;
  v23.origin.CGFloat y = v5;
  v23.size.double width = v7;
  v23.size.double height = v9;
  double MidY = CGRectGetMidY(v23);
  toPage = self->_private->toPage;
  if (toPage)
  {
    double v17 = toPage;
  }
  else
  {
    double v17 = [(PDFView *)self pageForPoint:1 nearest:PDFPointFromCGPoint(MidX * 0.99, MidY)];
    if (!v17) {
      goto LABEL_9;
    }
  }
  uint64_t v20 = v17;
  double v18 = [(PDFView *)self document];
  uint64_t v19 = [v18 indexForPage:v20];

  if (self->_currentPageIndex != v19) {
    [(PDFView *)self setCurrentPageIndex:v19 withNotification:1];
  }
  double v17 = v20;
LABEL_9:
}

- (CGSize)pageViewSizeForPage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    CGFloat v5 = [(PDFView *)self PDFLayout];
    [v5 contentSizeWithCurrentPage:v4];
    double v7 = v6;
    double v9 = v8;

    [(PDFView *)self gutterWidth];
    if (v10 > 0.0)
    {
      [(PDFView *)self gutterWidth];
      double v7 = v7 + v11;
      double v12 = [(PDFView *)self PDFLayout];
      uint64_t v13 = [v12 functionalDisplayMode];

      if (v13 >= 2)
      {
        [(PDFView *)self gutterWidth];
        double v7 = v7 + v14;
      }
    }
  }
  else
  {
    double v7 = PDFSizeMake(0, 0.0, 0.0);
    double v9 = v15;
  }

  double v16 = v7;
  double v17 = v9;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)_resizeDisplayView:(id)a3
{
  id v4 = [(PDFScrollView *)self->_private->scrollView pdfDocumentView];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  -[PDFScrollView setContentSize:](self->_private->scrollView, "setContentSize:", v6, v8);
  [(PDFView *)self scaleFactor];
  double v10 = v9;
  id v13 = [(PDFView *)self documentView];
  [v13 updateVisibility];
  [(PDFView *)self scaleFactor];
  if (v11 != v10)
  {
    double v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 postNotificationName:@"PDFViewScaleChanged" object:self];
  }
}

- (void)positionInternalViews:(id)a3
{
  id v4 = [(PDFView *)self documentView];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  [(PDFView *)self bounds];
  double v10 = v9;
  double v12 = v11;
  [(PDFView *)self scaleFactor];
  double v14 = v13;
  [(PDFView *)self scaleFactor];
  double v16 = self->_private;
  if (v16->showsScrollIndicators)
  {
    double v17 = v8 * v15;
    if ([(PDFView *)self autoScales])
    {
      if ([(PDFScrollView *)self->_private->scrollView showsHorizontalScrollIndicator])[(PDFScrollView *)self->_private->scrollView setShowsHorizontalScrollIndicator:0]; {
      int v18 = [(PDFScrollView *)self->_private->scrollView showsVerticalScrollIndicator];
      }
      if (v17 > v12)
      {
LABEL_6:
        if (v18) {
          return;
        }
        scrollView = self->_private->scrollView;
        uint64_t v20 = 1;
LABEL_43:
        [(PDFScrollView *)scrollView setShowsVerticalScrollIndicator:v20];
        return;
      }
LABEL_41:
      if (!v18) {
        return;
      }
      scrollView = self->_private->scrollView;
      uint64_t v20 = 0;
      goto LABEL_43;
    }
    double v22 = v6 * v14;
    CGRect v23 = self->_private->scrollView;
    if (v6 * v14 <= v10 && v17 <= v12)
    {
      if ([(PDFScrollView *)v23 showsVerticalScrollIndicator]) {
        [(PDFScrollView *)self->_private->scrollView setShowsVerticalScrollIndicator:0];
      }
      int v25 = [(PDFScrollView *)self->_private->scrollView showsHorizontalScrollIndicator];
      goto LABEL_26;
    }
    if (v22 <= v10)
    {
      if (([(PDFScrollView *)v23 showsVerticalScrollIndicator] & 1) == 0) {
        [(PDFScrollView *)self->_private->scrollView setShowsVerticalScrollIndicator:1];
      }
      int v25 = [(PDFScrollView *)self->_private->scrollView showsHorizontalScrollIndicator];
      if (v6 <= v10)
      {
LABEL_26:
        if (!v25) {
          return;
        }
        goto LABEL_29;
      }
      if (v25) {
        return;
      }
    }
    else
    {
      if (v17 <= v12)
      {
        if (([(PDFScrollView *)v23 showsHorizontalScrollIndicator] & 1) == 0) {
          [(PDFScrollView *)self->_private->scrollView setShowsHorizontalScrollIndicator:1];
        }
        int v18 = [(PDFScrollView *)self->_private->scrollView showsVerticalScrollIndicator];
        if (v8 > v12) {
          goto LABEL_6;
        }
        goto LABEL_41;
      }
      if (([(PDFScrollView *)v23 showsVerticalScrollIndicator] & 1) == 0) {
        [(PDFScrollView *)self->_private->scrollView setShowsVerticalScrollIndicator:1];
      }
      if ([(PDFScrollView *)self->_private->scrollView showsHorizontalScrollIndicator])return; {
    }
      }
    double v26 = self->_private->scrollView;
    uint64_t v27 = 1;
    goto LABEL_30;
  }
  if (!v16->isUsingPageViewController)
  {
    [(PDFScrollView *)v16->scrollView setShowsVerticalScrollIndicator:0];
LABEL_29:
    double v26 = self->_private->scrollView;
    uint64_t v27 = 0;
LABEL_30:
    [(PDFScrollView *)v26 setShowsHorizontalScrollIndicator:v27];
    return;
  }
  documentViewController = v16->documentViewController;

  [(PDFDocumentViewController *)documentViewController updateScrollViews];
}

- (CGRect)visibleRectForPageView:(id)a3
{
  id v4 = a3;
  [(PDFView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(PDFView *)self safeAreaInsets];
  double MaxInsets = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained pdfViewContentInset];
    double MaxInsets = PDFEdgeInsetsGetMaxInsets(MaxInsets, v16, v18, v20, v22);
    double v16 = v23;
    double v18 = v24;
    double v20 = v25;
  }
  double v26 = PDFEdgeInsetsInsetRect(v6, v8, v10, v12, MaxInsets, v16, v18, v20);
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  -[PDFView convertRect:toView:](self, "convertRect:toView:", v4, v26, v28, v30, v32);
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;

  double v41 = v34;
  double v42 = v36;
  double v43 = v38;
  double v44 = v40;
  result.size.double height = v44;
  result.size.double width = v43;
  result.origin.CGFloat y = v42;
  result.origin.CGFloat x = v41;
  return result;
}

- (BOOL)focusOnColumnAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v88[1] = *MEMORY[0x263EF8340];
  [(PDFView *)self autoScaleFactor];
  double v7 = v6;
  [(PDFView *)self scaleFactor];
  double v9 = vabdd_f64(v8, v7);
  double v10 = [(PDFView *)self renderingProperties];
  int v11 = [v10 isUsingPDFExtensionView];

  if (v9 <= 0.00000011920929 || (v11 & 1) != 0)
  {
    double v13 = -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 0, x, y);
    BOOL v12 = v13 != 0;
    if (!v13)
    {
LABEL_14:

      return v12;
    }
    double v86 = y;
    -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v13, x, y);
    objc_msgSend(v13, "columnFrameAtPoint:");
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    -[PDFView convertRect:fromPage:](self, "convertRect:fromPage:", v13);
    double rect = v22;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    v89.origin.double x = v15;
    v89.origin.double y = v17;
    v89.size.double width = v19;
    v89.size.double height = v21;
    if (PDFRectEqualToRect(v89, *MEMORY[0x263F001A8]))
    {
      if (v11)
      {
        double v29 = self->_private;
        double v30 = v29->extensionViewBoundsInDocument.origin.x;
        double v31 = v29->extensionViewBoundsInDocument.origin.y;
        double width = v29->extensionViewBoundsInDocument.size.width;
        double height = v29->extensionViewBoundsInDocument.size.height;
      }
      else
      {
        [(PDFView *)self bounds];
      }
      PDFRectScale(v30, v31, width, height, 0.5);
      v59.n128_f64[0] = x - v58 * 0.5;
      v61.n128_f64[0] = v86 - v60 * 0.5;
      double v37 = PDFRectMake(v59, v61, v58, v60);
      double v36 = v62;
      double v35 = v63;
      double v34 = v64;
      if (v11) {
        goto LABEL_12;
      }
    }
    else
    {
      double v34 = v28;
      double v35 = v26;
      double v36 = v24;
      double v37 = rect;
      if (v11)
      {
LABEL_12:
        [(PDFView *)self documentMargins];
        double v66 = v65;
        double v68 = v67;
        double v70 = v69;
        double v72 = v71;
        [(PDFView *)self pageBreakMargins];
        double v74 = v37 - (v68 + v73);
        double v76 = v36 - (v66 + v75);
        double v78 = v35 + v68 + v72 + v73 + v77;
        double v80 = v34 + v66 + v70 + v75 + v79;
        double v38 = [MEMORY[0x263F08A00] defaultCenter];
        v87 = @"rect";
        v81 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFRect:", v74, v76, v78, v80);
        v88[0] = v81;
        v82 = [NSDictionary dictionaryWithObjects:v88 forKeys:&v87 count:1];
        [v38 postNotificationName:@"PDFExtensionViewZoomToRect" object:self userInfo:v82];

        goto LABEL_13;
      }
    }
    double v38 = [(PDFView *)self pageViewForPageAtIndex:[(PDFDocument *)self->_private->document indexForPage:v13]];
    -[PDFView convertRect:toView:](self, "convertRect:toView:", v38, v37, v36, v35, v34);
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v45 = v36;
    CGFloat recta = v34;
    CGFloat v47 = v46;
    [(PDFView *)self safeAreaInsets];
    CGFloat v48 = v35;
    double v51 = v49 + v50;
    [(PDFView *)self bounds];
    CGFloat v52 = (CGRectGetWidth(v90) - v51) * 0.85;
    v91.origin.double x = v40;
    v91.origin.double y = v42;
    v91.size.double width = v44;
    v91.size.double height = v47;
    double v53 = v52 / CGRectGetWidth(v91);
    [(PDFView *)self minScaleFactor];
    double v55 = v54;
    [(PDFView *)self maxScaleFactor];
    double v57 = CGFloatClamp(v53, v55, v56);
    v92.origin.double x = v37;
    v92.origin.double y = v45;
    v92.size.double width = v48;
    v92.size.double height = recta;
    -[PDFView setScaleFactor:anchorPoint:](self, "setScaleFactor:anchorPoint:", v57, CGRectGetMidX(v92), v86);
LABEL_13:

    goto LABEL_14;
  }
  -[PDFView setScaleFactor:anchorPoint:](self, "setScaleFactor:anchorPoint:", v7, x, y);
  return 1;
}

- (void)insertFormFieldWithBounds:(CGRect)a3 onPage:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = (void *)MEMORY[0x263F82760];
  id v10 = a4;
  int v11 = +[PDFAnnotation detectedFormFieldDefaultFontName];
  +[PDFAnnotation detectedFormFieldDefaultFontSize];
  objc_msgSend(v9, "fontWithName:size:", v11);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v12 = +[PDFAnnotation createDetectedTextFieldWithBounds:font:textContentType:page:](PDFAnnotation, "createDetectedTextFieldWithBounds:font:textContentType:page:", v13, 0, v10, x, y, width, height);
  [(PDFViewController *)self->_private->controller addDetectedAnnotation:v12 toPage:v10];

  [(PDFViewController *)self->_private->controller activateAnnotation:v12];
}

- (void)insertFormFieldAtDefaultLocation
{
  id v5 = [(PDFView *)self currentPage];
  [(PDFView *)self centerPointOfVisibleRectOfPage:v5];
  [(PDFView *)self insertFormFieldWithBounds:v5 onPage:PDFRectMakeFromCenter(v3, v4, 120.0)];
}

- (void)insertFormFieldAtBestLocationNearPoint:(CGPoint)a3 onPage:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v7, x, y);
  double v9 = v8;
  double v11 = v10;
  BOOL v12 = +[PDFPageAnalyzer sharedInstance];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__PDFView_insertFormFieldAtBestLocationNearPoint_onPage___block_invoke;
  v14[3] = &unk_264205530;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  objc_msgSend(v12, "proposedFormFieldBoundsNearestPoint:onPage:completionBlock:", v13, v14, v9, v11);
}

uint64_t __57__PDFView_insertFormFieldAtBestLocationNearPoint_onPage___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t result = CGRectIsNull(*(CGRect *)&a2);
  if ((result & 1) == 0)
  {
    double v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    return objc_msgSend(v11, "insertFormFieldWithBounds:onPage:", v12, a2, a3, a4, a5);
  }
  return result;
}

- (BOOL)handleTabInDetectedFormField
{
  return 1;
}

- (BOOL)handleBackTabInDetectedFormField
{
  return 1;
}

- (void)handleTextSuggestion:(id)a3 completionHandler:(id)a4
{
}

- (void)constrainedScrollToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(PDFView *)self documentView];
  [v6 bounds];
  double v8 = v7 - y;

  [(PDFScrollView *)self->_private->scrollView bounds];
  double v10 = v9;
  double v12 = v11;
  id v13 = [(PDFScrollView *)self->_private->scrollView pdfDocumentView];
  objc_msgSend(v13, "convertPoint:toView:", self->_private->scrollView, PDFPointToCGPoint(x, v8));
  double v15 = v14;
  double v17 = v16;

  scrollView = self->_private->scrollView;

  -[PDFScrollView scrollRectToVisible:animated:](scrollView, "scrollRectToVisible:animated:", 0, v15, v17, v10, v12);
}

- (void)_scrollVerticalBy:(double)a3
{
  [(PDFView *)self scaleFactor];
  double v6 = a3 / v5;
  uint64_t v18 = [(PDFView *)self determineCurrentPage];
  [(PDFScrollView *)self->_private->scrollView contentOffset];
  double v8 = v7;
  double v10 = v9;
  [(PDFView *)self constrainedScrollToPoint:PDFPointMake(v7, round(v6 + v9))];
  double v11 = [(PDFView *)self PDFLayout];
  char v12 = [v11 functionalDisplayMode];

  if (v12)
  {
    double v16 = [(PDFView *)self determineCurrentPage];
    if (v16 != (void *)v18)
    {
      self->_private->inhibitAutoScroll = 1;
      [(PDFView *)self goToPage:v16];
      self->_private->inhibitAutoScroll = 0;
    }

    goto LABEL_9;
  }
  uint64_t v13 = [(UIScrollView *)self->_private->scrollView PDFKitDocumentVisibleRectIncludingContentInsets];
  uint64_t v14 = v18;
  if (v15 != v10) {
    goto LABEL_10;
  }
  if (v6 < 0.0)
  {
    uint64_t v13 = [(PDFView *)self canGoToNextPage];
    uint64_t v14 = v18;
    if (v13)
    {
      [(PDFView *)self constrainedScrollToPoint:PDFPointMake(v8, 0.0)];
      uint64_t v13 = [(PDFView *)self goToNextPage:self];
LABEL_9:
      uint64_t v14 = v18;
      goto LABEL_10;
    }
  }
  if (v6 > 0.0)
  {
    uint64_t v13 = [(PDFView *)self canGoToPreviousPage];
    uint64_t v14 = v18;
    if (v13)
    {
      [(UIScrollView *)self->_private->scrollView PDFKitDocumentVisibleRectIncludingContentInsets];
      [(PDFView *)self constrainedScrollToPoint:PDFPointMake(v8, v17)];
      uint64_t v13 = [(PDFView *)self goToPreviousPage:self];
      goto LABEL_9;
    }
  }
LABEL_10:

  MEMORY[0x270F9A758](v13, v14);
}

- (void)_scrollHorizontalBy:(double)a3
{
  [(PDFView *)self scaleFactor];
  double v6 = a3 / v5;
  [(UIScrollView *)self->_private->scrollView PDFKitDocumentVisibleRectIncludingContentInsets];
  double v9 = PDFPointMake(round(v6 + v7), v8);

  [(PDFView *)self constrainedScrollToPoint:v9];
}

- (void)_scrollByPage:(BOOL)a3
{
  BOOL v3 = a3;
  [(PDFView *)self frame];
  double v6 = v5;
  id v14 = [(PDFView *)self currentPage];
  -[PDFView _pageViewHeight:](self, "_pageViewHeight:");
  double v8 = v7;
  if (vabdd_f64(v7, v6) <= 32.0)
  {
    double v10 = [(PDFView *)self currentPage];
    [(PDFView *)self _scrollOriginForPageTopLeft:v10];
    double v12 = v11;

    [(UIScrollView *)self->_private->scrollView PDFKitDocumentVisibleRectIncludingContentInsets];
    if (vabdd_f64(v12, v13) < 32.0)
    {
      if (v3) {
        [(PDFView *)self goToNextPage:self];
      }
      else {
        [(PDFView *)self goToPreviousPage:self];
      }
      goto LABEL_13;
    }
    double v9 = -v8;
    if (v3) {
      double v9 = v8;
    }
  }
  else
  {
    double v9 = 50.0 - v6;
    if (v3) {
      double v9 = v6 + -50.0;
    }
  }
  if (v9 != 0.0) {
    -[PDFView _scrollVerticalBy:](self, "_scrollVerticalBy:");
  }
LABEL_13:
}

- (CGPoint)_scrollOriginForPageTopLeft:(id)a3
{
  id v4 = a3;
  double v5 = PDFPointMake(0.0, 0.0);
  double v7 = v6;
  if (v4)
  {
    objc_msgSend(v4, "boundsForBox:", -[PDFView displayBox](self, "displayBox"));
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [(PDFView *)self pageBreakMargins];
    double v17 = v16;
    double v19 = v18;
    uint64_t v20 = [v4 rotation];
    if (v20 > 179)
    {
      if (v20 == 180)
      {
        double v5 = v17 + PDFPointMake(v13, 0.0);
        goto LABEL_12;
      }
      if (v20 != 270)
      {
LABEL_13:
        -[PDFView convertPoint:fromPage:](self, "convertPoint:fromPage:", v4, v9 + v5, v11 + v7);
        double v24 = v23;
        double v26 = v25;
        double v27 = [(PDFView *)self documentView];
        objc_msgSend(v27, "convertPoint:fromView:", self, v24, v26);
        double v5 = v28;
        double v7 = v29;

        goto LABEL_14;
      }
      double v5 = v17 + PDFPointMake(v13, v15);
    }
    else
    {
      if (v20)
      {
        if (v20 == 90)
        {
          double v5 = PDFPointMake(0.0, 0.0) - v17;
LABEL_12:
          double v7 = v21 - v19;
          goto LABEL_13;
        }
        goto LABEL_13;
      }
      double v5 = PDFPointMake(0.0, v15) - v17;
    }
    double v7 = v19 + v22;
    goto LABEL_13;
  }
LABEL_14:

  double v30 = v5;
  double v31 = v7;
  result.double y = v31;
  result.double x = v30;
  return result;
}

- (void)_findVisiblePages
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  BOOL v3 = self->_private;
  if (v3->isUsingPageViewController)
  {
    id v49 = [(PDFDocumentViewController *)v3->documentViewController currentPage];
    NSUInteger v4 = -[PDFDocument indexForPage:](self->_private->document, "indexForPage:");
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v5 = 0;
    }
    else {
      unint64_t v5 = v4;
    }
    self->_private->unint64_t lastVisiblePage = v5;
    self->_private->unint64_t firstVisiblePage = v5;
  }
  else
  {
    [(PDFView *)self bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [(PDFView *)self documentView];
    -[PDFView convertRect:toView:](self, "convertRect:toView:", v14, v7, v9, v11, v13);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    double v23 = [(PDFView *)self PDFLayout];
    double v24 = [(PDFView *)self currentPage];
    double v25 = objc_msgSend(v23, "visiblePagesInBounds:currentPage:", v24, v16, v18, v20, v22);

    if (v25 && [v25 count])
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v26 = v25;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v54 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v51 != v29) {
              objc_enumerationMutation(v26);
            }
            [*(id *)(*((void *)&v50 + 1) + 8 * i) setView:self];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v50 objects:v54 count:16];
        }
        while (v28);
      }

      double v31 = [(PDFView *)self document];
      double v32 = [v26 objectAtIndex:0];
      uint64_t v33 = [v31 indexForPage:v32];

      double v34 = [(PDFView *)self document];
      double v35 = [v26 lastObject];
      uint64_t v36 = [v34 indexForPage:v35];
      unint64_t v37 = v36 + 1;

      double v38 = self->_private;
      unint64_t firstVisiblePage = v38->firstVisiblePage;
      unint64_t lastVisiblePage = v38->lastVisiblePage;
      if (v33 + 1 != firstVisiblePage || v37 != lastVisiblePage)
      {
        v38->unint64_t firstVisiblePage = v33 + 1;
        self->_private->unint64_t lastVisiblePage = v37;
        double v41 = NSDictionary;
        if (firstVisiblePage && lastVisiblePage)
        {
          CGFloat v42 = [NSNumber numberWithUnsignedInteger:firstVisiblePage - 1];
          double v43 = [NSNumber numberWithUnsignedInteger:lastVisiblePage - 1];
          CGFloat v44 = [NSNumber numberWithUnsignedInteger:v33];
          CGFloat v45 = [NSNumber numberWithUnsignedInteger:v36];
          double v46 = objc_msgSend(v41, "dictionaryWithObjectsAndKeys:", v42, @"PDFViewWasFirstVisiblePage", v43, @"PDFViewWasLastVisiblePage", v44, @"PDFViewFirstVisiblePage", v45, @"PDFViewLastVisiblePage", 0);
        }
        else
        {
          CGFloat v42 = [NSNumber numberWithUnsignedInteger:v33];
          double v43 = [NSNumber numberWithUnsignedInteger:v36];
          double v46 = objc_msgSend(v41, "dictionaryWithObjectsAndKeys:", v42, @"PDFViewFirstVisiblePage", v43, @"PDFViewLastVisiblePage", 0);
        }

        CGFloat v47 = [MEMORY[0x263F08A10] defaultQueue];
        CGFloat v48 = [MEMORY[0x263F089F8] notificationWithName:@"PDFViewVisiblePagesChanged" object:self userInfo:v46];
        [v47 enqueueNotification:v48 postingStyle:2];
      }
    }
  }
}

- (void)documentWasUnlocked
{
  [(PDFView *)self _removePasswordView];
  [(PDFScrollView *)self->_private->scrollView setDocument:0];
  [(PDFScrollView *)self->_private->scrollView setDocument:self->_private->document];
  [(PDFViewLayout *)self->_private->viewLayout setDocument:self->_private->document];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->delegate);
  [(PDFView *)self setNewPageVisibilityDelegate:WeakRetained withOldDelegate:0];

  [(PDFView *)self layoutDocumentView];
  NSUInteger v4 = self->_private;
  if (v4->autoScale)
  {
    [(PDFView *)self _internalSetAutoScaleFactor];
    NSUInteger v4 = self->_private;
  }
  if ([(PDFDocument *)v4->document pageCount] && self->_currentPageIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = -[PDFDocument pageAtIndex:](self->_private->document, "pageAtIndex:");
    self->_private->wantsForceUpdate = 1;
    double v6 = self->_private;
    double blockingWaitDuration = v6->blockingWaitDuration;
    v6->double blockingWaitDuration = 0.25;
    [(PDFView *)self _goToPage:v5 animated:0 withBackgroundUpdate:1];
    self->_private->double blockingWaitDuration = blockingWaitDuration;
  }
  [(PDFView *)self _reflectNewPageOn];
  if ([(PDFDocument *)self->_private->document pageCount])
  {
    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 postNotificationName:@"PDFViewChangedPage" object:self];
  }
}

- (void)hintScrollDirectionHorizontal:(unint64_t)a3 andVertical:(unint64_t)a4
{
  self->_private->lastHorizontalScrollDirection = a3;
  self->_private->lastVerticalScrollDirection = a4;
}

- (void)_updateAnnotations
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (ShouldRenderAnnotationsInPDFKit())
  {
    BOOL v3 = [(PDFView *)self visiblePages];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      uint64_t v7 = MEMORY[0x263EF83A0];
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          double v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
          v10[0] = MEMORY[0x263EF8330];
          v10[1] = 3221225472;
          void v10[2] = __29__PDFView__updateAnnotations__block_invoke;
          v10[3] = &unk_264205558;
          v10[4] = self;
          v10[5] = v9;
          [v9 fetchAnnotationsWithCompletion:v10 deliveredOnQueue:v7];
          ++v8;
        }
        while (v5 != v8);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
}

void __29__PDFView__updateAnnotations__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        double v9 = *(void **)(a1 + 32);
        [v8 bounds];
        double v10 = 1.0;
        if (objc_msgSend(v9, "isRectVisible:onPage:", *(void *)(a1 + 40)))
        {
          [*(id *)(a1 + 32) scaleFactor];
          double v10 = v11;
        }
        [v8 setScaleFactor:v10 * PDFScreenGetBackingScaleFactor()];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (id)renderingProperties
{
  return self->_private->renderingProperties;
}

- (void)visiblePagesChanged:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (PDFKitIsOCREnabled())
  {
    id v32 = v4;
    [(PDFView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    long long v13 = [(PDFView *)self documentView];
    -[PDFView convertRect:toView:](self, "convertRect:toView:", v13, v6, v8, v10, v12);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    double v22 = [(PDFView *)self documentView];
    [v22 bounds];
    double v24 = v23;

    double v25 = [(PDFView *)self PDFLayout];
    id v26 = [(PDFView *)self currentPage];
    uint64_t v27 = objc_msgSend(v25, "visiblePagesInBounds:currentPage:", v26, v15, v24 - v17 - v21, v19, v21);

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v27;
    uint64_t v28 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v39;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v39 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = *(void *)(*((void *)&v38 + 1) + 8 * v30);
          v37[0] = 0;
          v37[1] = v37;
          v37[2] = 0x2020000000;
          v37[3] = 0;
          objc_initWeak(&location, self);
          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __31__PDFView_visiblePagesChanged___block_invoke;
          v34[3] = &unk_2642055A8;
          v34[5] = v31;
          v34[6] = v37;
          v34[4] = self;
          objc_copyWeak(&v35, &location);
          +[PDFPageEvaluator isPageCandidateForOCR:v31 completion:v34];
          objc_destroyWeak(&v35);
          objc_destroyWeak(&location);
          _Block_object_dispose(v37, 8);
          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v28);
    }

    id v4 = v32;
  }
}

void __31__PDFView_visiblePagesChanged___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (a3) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= 1uLL;
  }
  if ([*(id *)(a1 + 32) isFormDetectionEnabled]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= 2uLL;
  }
  double v6 = +[PDFPageAnalyzer sharedInstance];
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v8 = MEMORY[0x263EF83A0];
  id v9 = MEMORY[0x263EF83A0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __31__PDFView_visiblePagesChanged___block_invoke_2;
  v10[3] = &unk_264205580;
  int8x16_t v11 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  objc_copyWeak(&v13, (id *)(a1 + 56));
  uint64_t v12 = *(void *)(a1 + 48);
  [v6 analyzePage:v5 analysisTypes:v7 completionQueue:v8 completionBlock:v10];

  objc_destroyWeak(&v13);
}

void __31__PDFView_visiblePagesChanged___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  if (a2 && !a3)
  {
    double v6 = *(void **)(a1 + 32);
    id v7 = a2;
    id v14 = [v6 document];
    uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "pageViewForPageAtIndex:", objc_msgSend(v14, "indexForPage:", *(void *)(a1 + 32)));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [v14 callDelegateDidReceiveAnalysis:v7 forPage:*(void *)(a1 + 32)];

    if (([*(id *)(a1 + 32) containsFormFields] & 1) != 0
      || [*(id *)(a1 + 32) containsDetectedFormFields])
    {
      double v10 = [*(id *)(a1 + 40) delegate];
      int8x16_t v11 = v10;
      uint64_t v12 = (unsigned char *)WeakRetained[51];
      if (v12[68])
      {
        uint64_t v13 = [*(id *)(a1 + 32) detectedFormFieldsRecognitionConfidence];
        if (v13) {
          [v11 PDFView:WeakRetained allowsFormFillingMode:1 withRecognitionConfidence:v13 forPage:*(void *)(a1 + 32)];
        }
      }
      else if (v12[67])
      {
        objc_msgSend(v10, "PDFView:allowsFormFillingMode:withAutofill:forPage:", WeakRetained, 1, objc_msgSend(*(id *)(a1 + 32), "containsFormFieldsWithContentType"), *(void *)(a1 + 32));
      }
      else if (v12[66])
      {
        [v10 PDFView:WeakRetained allowsFormFillingMode:1 forPage:*(void *)(a1 + 32)];
      }
      if ([WeakRetained isInFormFillingMode])
      {
        [*(id *)(WeakRetained[51] + 24) populateAnnotationsFromDetectedAnnotationsOnPage:*(void *)(a1 + 32)];
        [WeakRetained highlightDetectedFormFields:1];
      }
    }
    if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) & 1) != 0
      && GetDefaultsWriteDrawOCRQuads())
    {
      [v8 forceTileUpdate];
    }
    if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) & 2) != 0
      && GetDefaultsWriteHighlightDetectedAnnotations())
    {
      [v8 enableHighlightDetectedFormFields:1];
    }
    if (a4) {
      [v8 resetAccessibilityTree];
    }
  }
}

- (CGPoint)centerPointOfVisibleRectOfPage:(id)a3
{
  id v4 = a3;
  id v5 = [(PDFView *)self document];
  uint64_t v6 = [v5 indexForPage:v4];

  id v7 = [(PDFView *)self pageViewForPageAtIndex:v6];
  [(PDFView *)self visibleRectForPageView:v7];
  objc_msgSend(v7, "convertRect:toView:", self);
  -[PDFView convertRect:toPage:](self, "convertRect:toPage:", v4);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double CenterPoint = PDFRectGetCenterPoint(v9, v11, v13);
  double v16 = v15;

  double v17 = CenterPoint;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (void)_showFormFillingButton:(BOOL)a3
{
  v56[2] = *MEMORY[0x263EF8340];
  formFieldButton = self->_formFieldButton;
  if (a3)
  {
    if (!formFieldButton)
    {
      id v5 = [MEMORY[0x263F824F0] filledButtonConfiguration];
      [v5 setButtonSize:3];
      [v5 setCornerStyle:4];
      uint64_t v6 = [MEMORY[0x263F827E8] systemImageNamed:@"plus"];
      [v5 setImage:v6];

      id v7 = [MEMORY[0x263F82818] configurationWithScale:2];
      [v5 setPreferredSymbolConfigurationForImage:v7];

      double v8 = [MEMORY[0x263F824E8] buttonWithConfiguration:v5 primaryAction:0];
      double v9 = self->_formFieldButton;
      self->_formFieldButton = v8;

      [(UIButton *)self->_formFieldButton setTranslatesAutoresizingMaskIntoConstraints:0];
      double v10 = (void *)MEMORY[0x263F823D0];
      double v11 = PDFKitLocalizedString(@"Add Text Form Box");
      double v12 = [MEMORY[0x263F827E8] systemImageNamed:@"character.textbox"];
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __34__PDFView__showFormFillingButton___block_invoke;
      void v54[3] = &unk_264204A90;
      v54[4] = self;
      double v13 = [v10 actionWithTitle:v11 image:v12 identifier:0 handler:v54];

      id v14 = (void *)MEMORY[0x263F823D0];
      double v15 = PDFKitLocalizedString(@"Add Signature");
      double v16 = [MEMORY[0x263F827E8] systemImageNamed:@"signature"];
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      void v53[2] = __34__PDFView__showFormFillingButton___block_invoke_2;
      v53[3] = &unk_264204A90;
      v53[4] = self;
      double v17 = [v14 actionWithTitle:v15 image:v16 identifier:0 handler:v53];

      double v18 = (void *)MEMORY[0x263F82940];
      double v19 = PDFKitLocalizedString(@"Add Form Item to PDF");
      v56[0] = v13;
      v56[1] = v17;
      double v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
      double v21 = [v18 menuWithTitle:v19 children:v20];

      [(UIButton *)self->_formFieldButton setMenu:v21];
      [(UIButton *)self->_formFieldButton setShowsMenuAsPrimaryAction:1];

      formFieldButton = self->_formFieldButton;
    }
    double v22 = [(PDFView *)self documentView];
    [(PDFView *)self insertSubview:formFieldButton aboveSubview:v22];

    double v23 = [(UIButton *)self->_formFieldButton bottomAnchor];
    double v24 = [(PDFView *)self bottomAnchor];
    double v25 = [v23 constraintEqualToAnchor:v24 constant:-15.0];

    id v26 = (void *)MEMORY[0x263F08938];
    v55[0] = v25;
    uint64_t v27 = [(UIButton *)self->_formFieldButton trailingAnchor];
    uint64_t v28 = [(PDFView *)self trailingAnchor];
    uint64_t v29 = [v27 constraintEqualToAnchor:v28 constant:-15.0];
    v55[1] = v29;
    uint64_t v30 = [(UIButton *)self->_formFieldButton widthAnchor];
    uint64_t v31 = [(UIButton *)self->_formFieldButton heightAnchor];
    id v32 = [v30 constraintEqualToAnchor:v31];
    v55[2] = v32;
    uint64_t v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:3];
    [v26 activateConstraints:v33];

    [(PDFView *)self setNeedsLayout];
    [(PDFView *)self layoutIfNeeded];
    double v34 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v35 = *MEMORY[0x263F83808];
    uint64_t v36 = [MEMORY[0x263F08A48] mainQueue];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    void v51[2] = __34__PDFView__showFormFillingButton___block_invoke_3;
    v51[3] = &unk_2642055D0;
    v51[4] = self;
    id v37 = v25;
    id v52 = v37;
    long long v38 = [v34 addObserverForName:v35 object:0 queue:v36 usingBlock:v51];
    id formFieldButtonShowKeyboardNotification = self->_formFieldButtonShowKeyboardNotification;
    self->_id formFieldButtonShowKeyboardNotification = v38;

    uint64_t v40 = *MEMORY[0x263F83800];
    long long v41 = [MEMORY[0x263F08A48] mainQueue];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __34__PDFView__showFormFillingButton___block_invoke_5;
    v48[3] = &unk_2642055D0;
    id v49 = v37;
    long long v50 = self;
    id v42 = v37;
    uint64_t v43 = [v34 addObserverForName:v40 object:0 queue:v41 usingBlock:v48];
    id formFieldButtonHideKeyboardNotification = self->_formFieldButtonHideKeyboardNotification;
    self->_id formFieldButtonHideKeyboardNotification = v43;
  }
  else
  {
    if (formFieldButton) {
      [(UIButton *)self->_formFieldButton removeFromSuperview];
    }
    id v47 = [MEMORY[0x263F08A00] defaultCenter];
    [v47 removeObserver:self->_formFieldButtonShowKeyboardNotification];
    id v45 = self->_formFieldButtonShowKeyboardNotification;
    self->_id formFieldButtonShowKeyboardNotification = 0;

    [v47 removeObserver:self->_formFieldButtonHideKeyboardNotification];
    id v46 = self->_formFieldButtonHideKeyboardNotification;
    self->_id formFieldButtonHideKeyboardNotification = 0;
  }
}

uint64_t __34__PDFView__showFormFillingButton___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) insertFormFieldAtDefaultLocation];
}

void __34__PDFView__showFormFillingButton___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) document];
  id v7 = [v2 akController];

  id v3 = [v7 signaturesController];
  id v4 = objc_alloc_init((Class)AKSignaturesPresentationContextClass());
  id v5 = [*(id *)(a1 + 32) window];
  uint64_t v6 = [v5 rootViewController];
  [v4 setPresentingViewController:v6];

  [v4 setSourceView:*(void *)(*(void *)(a1 + 32) + 456)];
  [v3 setPresentationContext:v4];
  [v3 setDelegate:*(void *)(a1 + 32)];
  [v3 presentSignaturesViewController];
}

void __34__PDFView__showFormFillingButton___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F837B8]];
  [v5 CGRectValue];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  id v14 = *(void **)(a1 + 32);
  [v14 bounds];
  objc_msgSend(v14, "convertRect:toView:", 0);
  double MaxY = CGRectGetMaxY(v31);
  v32.origin.double x = v7;
  v32.origin.double y = v9;
  v32.size.double width = v11;
  v32.size.double height = v13;
  double v16 = MaxY - CGRectGetMinY(v32);
  double v17 = [v3 userInfo];
  double v18 = [v17 objectForKeyedSubscript:*MEMORY[0x263F83778]];
  uint64_t v19 = [v18 integerValue];

  double v20 = [v3 userInfo];

  double v21 = [v20 objectForKeyedSubscript:*MEMORY[0x263F83780]];
  [v21 doubleValue];
  double v23 = v22;

  double v24 = (void *)MEMORY[0x263F82E00];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __34__PDFView__showFormFillingButton___block_invoke_4;
  v27[3] = &unk_2642050A8;
  id v25 = *(id *)(a1 + 40);
  double v30 = v16;
  uint64_t v26 = *(void *)(a1 + 32);
  id v28 = v25;
  uint64_t v29 = v26;
  [v24 animateWithDuration:v19 | 6 delay:v27 options:0 animations:v23 completion:0.0];
}

uint64_t __34__PDFView__showFormFillingButton___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setConstant:-15.0 - *(double *)(a1 + 48)];
  v2 = *(void **)(a1 + 40);

  return [v2 layoutIfNeeded];
}

void __34__PDFView__showFormFillingButton___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F83778]];
  uint64_t v6 = [v5 integerValue];

  CGFloat v7 = [v3 userInfo];

  double v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F83780]];
  [v8 doubleValue];
  double v10 = v9;

  CGFloat v11 = (void *)MEMORY[0x263F82E00];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __34__PDFView__showFormFillingButton___block_invoke_6;
  v14[3] = &unk_264203F98;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  id v15 = v12;
  uint64_t v16 = v13;
  [v11 animateWithDuration:v6 | 6 delay:v14 options:0 animations:v10 completion:0.0];
}

uint64_t __34__PDFView__showFormFillingButton___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) setConstant:-15.0];
  v2 = *(void **)(a1 + 40);

  return [v2 layoutIfNeeded];
}

- (void)signaturesController:(id)a3 didSelectSignatureWithAnnotation:(id)a4
{
  id v5 = a4;
  id v22 = [(PDFView *)self currentPage];
  uint64_t v6 = [(PDFView *)self document];
  uint64_t v7 = [v6 indexForPage:v22];

  [(PDFView *)self centerPointOfVisibleRectOfPage:v22];
  double v9 = v8;
  double v11 = v10;
  [v5 rectangle];
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;
  double v16 = CGRectGetWidth(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  objc_msgSend(v5, "setRectangle:", v9 - v16 * (216.0 / v16) * 0.5, v11 - CGRectGetHeight(v25) * (216.0 / v16) * 0.5);
  double v17 = [(PDFView *)self document];
  double v18 = [v17 akController];

  objc_msgSend(v5, "setOriginalExifOrientation:", objc_msgSend(v18, "currentExifOrientationForPageAtIndex:", v7));
  [v18 currentModelBaseScaleFactorForPageAtIndex:v7];
  objc_msgSend(v5, "setOriginalModelBaseScaleFactor:");
  uint64_t v19 = [v22 akPageAdaptor];
  double v20 = [v19 akPageModelController];
  double v21 = [v20 mutableArrayValueForKey:@"annotations"];
  [v21 addObject:v5];
}

- (id)nextPage
{
  if ([(PDFView *)self canGoToNextPage])
  {
    id v3 = [(PDFView *)self PDFLayout];
    uint64_t v4 = [v3 functionalDisplayMode];

    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      unint64_t v5 = self->_currentPageIndex + 2;
      if (v5 > [(PDFView *)self lastPageIndex]) {
        unint64_t v5 = [(PDFView *)self lastPageIndex];
      }
      uint64_t v6 = [(PDFView *)self document];
      uint64_t v7 = v6;
      unint64_t v8 = v5;
    }
    else
    {
      uint64_t v6 = [(PDFView *)self document];
      uint64_t v7 = v6;
      unint64_t v8 = self->_currentPageIndex + 1;
    }
    double v9 = [v6 pageAtIndex:v8];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)previousPage
{
  if ([(PDFView *)self canGoToPreviousPage])
  {
    id v3 = [(PDFView *)self PDFLayout];
    uint64_t v4 = [v3 functionalDisplayMode];

    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      unint64_t currentPageIndex = self->_currentPageIndex;
      uint64_t v6 = [(PDFView *)self document];
      uint64_t v7 = v6;
      unint64_t v8 = self->_currentPageIndex;
      if (currentPageIndex < 2) {
        unint64_t v9 = v8 - 1;
      }
      else {
        unint64_t v9 = v8 - 2;
      }
    }
    else
    {
      uint64_t v6 = [(PDFView *)self document];
      uint64_t v7 = v6;
      unint64_t v9 = self->_currentPageIndex - 1;
    }
    double v10 = [v6 pageAtIndex:v9];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (void)pushDestination:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    unint64_t v5 = self->_private;
    unint64_t historyIndex = v5->historyIndex;
    if (historyIndex < [(NSMutableArray *)v5->destinationHistory count]) {
      -[NSMutableArray removeObjectsInRange:](self->_private->destinationHistory, "removeObjectsInRange:", self->_private->historyIndex, [(NSMutableArray *)self->_private->destinationHistory count] - self->_private->historyIndex);
    }
    ++self->_private->historyIndex;
    [(NSMutableArray *)self->_private->destinationHistory addObject:v9];
    uint64_t v7 = [MEMORY[0x263F08A10] defaultQueue];
    unint64_t v8 = [MEMORY[0x263F089F8] notificationWithName:@"PDFViewChangedHistory" object:self];
    [v7 enqueueNotification:v8 postingStyle:1];

    id v4 = v9;
  }
}

- (void)goToDestinationNoPush:(id)a3
{
  v43[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = v4;
  if (!v4)
  {
    id v12 = 0;
    uint64_t v6 = 0;
    goto LABEL_22;
  }
  uint64_t v6 = [v4 page];
  if (!v6) {
    goto LABEL_21;
  }
  [v5 point];
  double v8 = v7;
  double v10 = v9;
  double v11 = [(PDFView *)self currentPage];
  if (v6 != v11 || v8 != 3.40282347e38)
  {

    goto LABEL_9;
  }

  if (v10 == 3.40282347e38)
  {
LABEL_21:
    id v12 = 0;
    goto LABEL_22;
  }
LABEL_9:
  if (v8 == 3.40282347e38 || v10 == 3.40282347e38)
  {
    [(PDFView *)self goToPageNoPush:v6];
    goto LABEL_21;
  }
  id v14 = [(PDFView *)self PDFLayout];
  char v15 = [v14 functionalDisplayMode];

  if ((v15 & 1) == 0) {
    [(PDFView *)self goToPageNoPush:v6];
  }
  if (![(PDFRenderingProperties *)self->_private->renderingProperties isUsingPDFExtensionView])[(PDFScrollView *)self->_private->scrollView contentOffset]; {
  [v6 boundsForBox:0];
  }
  double v19 = PDFPointClampInPDFRect(v8, v10, v16, v17, v18);
  double v21 = v20;
  [v6 rotation];
  -[PDFView convertPoint:fromPage:](self, "convertPoint:fromPage:", v6, v19, v21);
  double v23 = v22;
  double v25 = v24;
  uint64_t v26 = [(PDFView *)self documentView];
  objc_msgSend(v26, "convertPoint:fromView:", self, v23, v25);
  double v28 = v27;
  double v30 = v29;

  if ([(PDFRenderingProperties *)self->_private->renderingProperties isUsingPDFExtensionView])
  {
    NSUInteger v31 = [(PDFDocument *)self->_private->document indexForPage:v6];
    [(PDFView *)self setCurrentPageIndex:v31 withNotification:0];
    CGRect v32 = [MEMORY[0x263F08A00] defaultCenter];
    v42[0] = @"pageIndex";
    uint64_t v33 = [NSNumber numberWithInteger:v31];
    v42[1] = @"point";
    v43[0] = v33;
    double v34 = objc_msgSend(MEMORY[0x263F08D40], "PDFKitValueWithPDFPoint:", v28, v30);
    v43[1] = v34;
    uint64_t v35 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
    [v32 postNotificationName:@"PDFExtensionViewGoToDestination" object:self userInfo:v35];

    goto LABEL_21;
  }
  uint64_t v36 = [(PDFView *)self documentView];
  [v36 bounds];
  double v38 = v37 - v30;

  [(PDFView *)self constrainedScrollToPoint:PDFPointMake(v28, v38)];
  id v12 = [(PDFView *)self determineCurrentPage];
  long long v39 = [(PDFView *)self document];
  uint64_t v40 = [v39 indexForPage:v12];
  unint64_t currentPageIndex = self->_currentPageIndex;

  if (v40 != currentPageIndex)
  {
    self->_private->inhibitAutoScroll = 1;
    [(PDFView *)self goToPageNoPush:v12];
    self->_private->inhibitAutoScroll = 0;
  }
LABEL_22:
}

- (void)goToPageNoPush:(id)a3
{
}

- (void)goToPageNoPush:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v17 = a3;
  if (v17)
  {
    uint64_t v6 = [(PDFView *)self currentPage];
    double v7 = self->_private;
    fromPage = v7->fromPage;
    v7->fromPage = (PDFPage *)v6;

    unint64_t currentPageIndex = self->_currentPageIndex;
    double v10 = [(PDFView *)self document];
    -[PDFView setCurrentPageIndex:withNotification:](self, "setCurrentPageIndex:withNotification:", [v10 indexForPage:v17], 0);

    unint64_t v11 = self->_currentPageIndex;
    if (!self->_private->inhibitAutoScroll)
    {
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_18;
      }
      [(PDFView *)self _reflectNewPageOn];
      [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__syncPageIndexToScrollView object:0];
      unint64_t v11 = self->_currentPageIndex;
    }
    if (v11 != currentPageIndex && v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(PDFView *)self layoutDocumentView];
      uint64_t v13 = self->_private;
      if (v13->isUsingPageViewController)
      {
        unint64_t v14 = self->_currentPageIndex;
        BOOL v15 = currentPageIndex > v14 && !v13->displaysRTL || currentPageIndex < v14 && v13->displaysRTL;
        [(PDFDocumentViewController *)v13->documentViewController goToPage:v17 direction:v15 animated:v4];
      }
      double v16 = [MEMORY[0x263F08A00] defaultCenter];
      [v16 postNotificationName:@"PDFViewChangedPage" object:self];
    }
  }
LABEL_18:
}

- (BOOL)isRectVisible:(CGRect)a3 onPage:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  double v10 = [(PDFView *)self visiblePages];
  if ([v10 containsObject:v9])
  {
    -[PDFView convertRect:fromPage:](self, "convertRect:fromPage:", v9, x, y, width, height);
    double v11 = PDFRectToCGRect([(PDFView *)self bounds]);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [(PDFView *)self safeAreaInsets];
    double MaxInsets = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->delegate);
    if (objc_opt_respondsToSelector())
    {
      [WeakRetained pdfViewContentInset];
      double MaxInsets = PDFEdgeInsetsGetMaxInsets(MaxInsets, v21, v23, v25, v27);
      double v21 = v28;
      double v23 = v29;
      double v25 = v30;
    }
    double v31 = PDFEdgeInsetsInsetRect(v11, v13, v15, v17, MaxInsets, v21, v23, v25);
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    CGFloat v37 = v36;

    v45.origin.double x = PDFRectToCGRect(v38);
    v45.origin.double y = v39;
    v45.size.double width = v40;
    v45.size.double height = v41;
    v44.origin.double x = v31;
    v44.origin.double y = v33;
    v44.size.double width = v35;
    v44.size.double height = v37;
    BOOL v42 = CGRectContainsRect(v44, v45);
  }
  else
  {
    BOOL v42 = 0;
  }

  return v42;
}

- (double)autoScaleFactor
{
  v2 = self->_private;
  if (v2->isUsingPageViewController)
  {
    documentViewController = v2->documentViewController;
    [(PDFDocumentViewController *)documentViewController autoScaleFactor];
  }
  else
  {
    uint64_t v6 = [(PDFView *)self currentPage];
    [(PDFView *)self _unboundAutoScaleFactorForPage:v6];
    double v8 = v7;

    return v8;
  }
  return result;
}

- (void)setScaleFactor:(double)a3 anchorPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(PDFView *)self setAutoScales:0];
  [(PDFView *)self bounds];
  double v9 = v8;
  id v10 = [(PDFView *)self documentView];
  -[PDFView convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
  double v11 = v9 / a3;
  double v43 = a3;
  double v14 = PDFRectMakeFromCenter(v12, v13, v9 / a3);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  double v21 = self->_private->scrollView;
  double v22 = self->_private;
  if (!v22->isUsingPageViewController) {
    goto LABEL_10;
  }
  double v23 = [(PDFDocumentViewController *)v22->documentViewController currentPage];
  double v24 = [(PDFDocumentViewController *)self->_private->documentViewController findPageViewControllerForPageIndex:[(PDFDocument *)self->_private->document indexForPage:v23]];
  double v25 = v24;
  if (v24)
  {
    uint64_t v26 = [v24 scrollView];

    uint64_t v27 = [v25 pageView];

    if (v26) {
      BOOL v28 = v27 == 0;
    }
    else {
      BOOL v28 = 1;
    }
    if (!v28)
    {
      -[PDFView convertPoint:toView:](self, "convertPoint:toView:", v27, x, y);
      double v14 = PDFRectMakeFromCenter(v29, v30, v11);
      CGFloat v16 = v31;
      CGFloat v18 = v32;
      CGFloat v20 = v33;

      double v21 = (PDFScrollView *)v26;
      id v10 = (id)v27;
LABEL_10:
      objc_msgSend(v10, "bounds", *(void *)&v43);
      v55.origin.double x = v34;
      v55.origin.double y = v35;
      v55.size.CGFloat width = v36;
      v55.size.CGFloat height = v37;
      v53.origin.double x = v14;
      v53.origin.double y = v16;
      v53.size.CGFloat width = v18;
      v53.size.CGFloat height = v20;
      CGRect v54 = CGRectIntersection(v53, v55);
      CGFloat v38 = v54.origin.x;
      CGFloat v39 = v54.origin.y;
      CGFloat width = v54.size.width;
      CGFloat height = v54.size.height;
      BOOL v42 = (void *)MEMORY[0x263F82E00];
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __38__PDFView_setScaleFactor_anchorPoint___block_invoke;
      v45[3] = &unk_2642055F8;
      double v21 = v21;
      id v46 = v21;
      uint64_t v48 = v44;
      id v10 = v10;
      id v47 = v10;
      CGFloat v49 = v38;
      CGFloat v50 = v39;
      CGFloat v51 = width;
      CGFloat v52 = height;
      [v42 animateWithDuration:v45 animations:0.25];

      goto LABEL_11;
    }
    double v21 = (PDFScrollView *)v26;
    id v10 = (id)v27;
  }

LABEL_11:
}

uint64_t __38__PDFView_setScaleFactor_anchorPoint___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setZoomScale:0 animated:*(double *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 40), "convertRect:toView:", *(void *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  double v3 = v2;
  double v5 = v4;
  [*(id *)(a1 + 32) bounds];
  double v7 = v6;
  double v9 = v8;
  [*(id *)(a1 + 32) contentSize];
  double v11 = v10;
  double v13 = v12;
  [*(id *)(a1 + 32) contentInset];
  double v15 = v14;
  double v17 = v16;
  if (v11 - v7 >= 0.0) {
    double v18 = v11 - v7;
  }
  else {
    double v18 = 0.0;
  }
  double v19 = CGFloatClamp(v3, 0.0, v18);
  if (v13 - v9 + v17 >= 0.0) {
    double v20 = v13 - v9 + v17;
  }
  else {
    double v20 = 0.0;
  }
  double v21 = CGFloatClamp(v5, -v15, v20);
  if (v21 <= 0.0) {
    double v22 = -v15;
  }
  else {
    double v22 = v21;
  }
  double v23 = *(void **)(a1 + 32);

  return objc_msgSend(v23, "setContentOffset:animated:", 0, v19, v22);
}

- (void)setDisplaysRTL:(BOOL)displaysRTL
{
  self->_private->displaysRTL = displaysRTL;
  double v3 = self->_private;
  if (v3->isUsingPageViewController) {
    -[PDFDocumentViewController setDisplaysRTL:](v3->documentViewController, "setDisplaysRTL:");
  }
}

- (BOOL)displaysRTL
{
  return self->_private->displaysRTL;
}

- (void)setLineWidthThreshold:(double)a3
{
}

- (double)lineWidthThreshold
{
  [(PDFRenderingProperties *)self->_private->renderingProperties lineWidthThreshold];
  return result;
}

- (void)setPageColor:(id)a3
{
}

- (id)pageColor
{
  return [(PDFRenderingProperties *)self->_private->renderingProperties pageColor];
}

- (BOOL)displaysBookmarksForPages
{
  return self->_private->displaysBookmarksForPages;
}

- (void)setDisplaysBookmarksForPages:(BOOL)a3
{
  double v3 = self->_private;
  if (v3->displaysBookmarksForPages != a3)
  {
    v3->displaysBookmarksForPages = a3;
    [(PDFView *)self _updateBookmarksForPages];
  }
}

- (void)_updateBookmarksForPages
{
  double v3 = [(PDFDocument *)self->_private->document bookmarkedPages];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__PDFView__updateBookmarksForPages__block_invoke;
  v4[3] = &unk_264205620;
  v4[4] = self;
  [v3 enumerateIndexesUsingBlock:v4];
}

void __35__PDFView__updateBookmarksForPages__block_invoke(uint64_t a1, uint64_t a2)
{
  double v3 = [*(id *)(a1 + 32) pageViewForPageAtIndex:a2];
  if (v3)
  {
    id v4 = v3;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 408) + 208)) {
      [v3 addBookmark];
    }
    else {
      [v3 removeBookmark];
    }
    double v3 = v4;
  }
}

- (id)documentScrollView
{
  return self->_private->scrollView;
}

- (id)pageViewForPageAtIndex:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = self->_private;
  if (v4->isUsingPageViewController)
  {
    [(PDFDocumentViewController *)v4->documentViewController pageViews];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          double v11 = objc_msgSend(v10, "page", (void)v16);
          double v12 = [v11 document];
          uint64_t v13 = [v12 indexForPage:v11];

          if (v13 == a3)
          {
            id v14 = v10;

            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    id v14 = 0;
LABEL_12:
  }
  else
  {
    id v5 = [(PDFScrollView *)v4->scrollView pdfDocumentView];
    id v14 = [v5 pageViewForPageAtIndex:a3];
  }

  return v14;
}

- (id)activeAnnotation
{
  return [(PDFViewController *)self->_private->controller activeAnnotation];
}

- (void)setActiveAnnotation:(id)a3
{
}

- (void)removeControlForAnnotation:(id)a3
{
}

- (id)longPressGestureRecognizer
{
  return self->_private->longPressGestureRecognizer;
}

- (id)tapGestureRecognizer
{
  return self->_private->tapGestureRecognizer;
}

- (id)doubleTapGestureRecognizer
{
  return self->_private->doubleTapGestureRecognizer;
}

- (id)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained PDFViewParentViewController];
  }
  else {
  id v4 = [(UIView *)self _PDFViewParentViewController];
  }

  return v4;
}

- (void)setEnableTileUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  -[PDFRenderingProperties setEnableTileUpdates:](self->_private->renderingProperties, "setEnableTileUpdates:");
  if (v3)
  {
    id v5 = [(PDFView *)self visiblePageViews];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setNeedsTilesUpdate];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)forceTileRefresh
{
  if (self->_private)
  {
    BOOL v3 = [MEMORY[0x263F086E0] mainBundle];
    id v4 = [v3 bundleIdentifier];
    char v5 = [v4 isEqualToString:@"com.apple.Preview"];

    if ((v5 & 1) == 0)
    {
      [(PDFView *)self internalForceTileRefresh];
    }
  }
}

- (void)internalForceTileRefresh
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  double v2 = [(PDFView *)self visiblePageViews];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) forceTileUpdate];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)internalForceAnnotationRefresh
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v2 = [(PDFView *)self visiblePages];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "annotations", (void)v9);
        [v8 makeObjectsPerformSelector:sel_updateAnnotationEffect];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [MEMORY[0x263F158F8] commit];
}

- (void)highlightPDFRedactions:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(PDFView *)self visiblePages];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [*(id *)(*((void *)&v19 + 1) + 8 * v9) annotations];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v16;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v15 + 1) + 8 * v14++) highlightRedaction:v3];
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v12);
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  [MEMORY[0x263F158F8] commit];
}

- (void)highlightDetectedFormFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(PDFView *)self visiblePages];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = [*(id *)(*((void *)&v22 + 1) + 8 * i) annotations];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v19 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * j);
              uint64_t v14 = [v13 valueForAnnotationKey:@"/AAPL:SFF"];

              if (v14)
              {
                long long v15 = [v13 akAnnotation];
                [v15 setHighlighted:v3];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v10);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  [MEMORY[0x263F158F8] commit];
}

- (void)printActivePageText
{
  id v6 = [(PDFView *)self currentPage];
  if (v6)
  {
    BOOL v3 = [(PDFView *)self document];
    uint64_t v4 = [v3 indexForPage:v6];

    uint64_t v5 = [v6 string];
    NSLog(&cfstr_PageLuText.isa, v4, v5);
  }
}

- (void)setNeedsDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)PDFView;
  [(PDFView *)&v3 setNeedsDisplay];
  [(PDFView *)self forceTileRefresh];
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PDFView;
  -[PDFView setNeedsDisplayInRect:](&v4, sel_setNeedsDisplayInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PDFView *)self forceTileRefresh];
}

- (void)_tileRefresh
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (self->_private)
  {
    objc_super v3 = [(PDFView *)self visiblePageViews];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setNeedsTilesUpdate];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
    [(PDFTimer *)self->_private->tilesSyncTimer update];
  }
}

- (void)setActiveMarkupStyle:(unint64_t)a3
{
  self->_private->activeMarkupStyle = a3;
}

- (unint64_t)activeMarkupStyle
{
  return self->_private->activeMarkupStyle;
}

- (BOOL)isUpdatingSelectionMarkups
{
  return [(PDFViewController *)self->_private->controller isUpdatingSelectionMarkups];
}

- (void)addMarkupWithStyle:(unint64_t)a3 fromSelection:(id)a4
{
}

- (void)interactWithAnnotation:(id)a3
{
}

- (BOOL)handleTabInTextWidget:(id)a3
{
  return 1;
}

- (BOOL)handleBackTabInTextWidget:(id)a3
{
  return 1;
}

- (BOOL)PDFKitHandleTabInTextWidget:(id)a3
{
  return 1;
}

- (BOOL)PDFKitHandleBackTabInTextWidget:(id)a3
{
  return 1;
}

- (BOOL)isOverLinkAnnotation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = -[PDFView pageForPoint:nearest:](self, "pageForPoint:nearest:", 0);
  if (!v6) {
    goto LABEL_6;
  }
  -[PDFView convertPoint:toPage:](self, "convertPoint:toPage:", v6, x, y);
  double v8 = v7;
  double v10 = v9;
  long long v11 = objc_msgSend(v6, "annotationAtPoint:");
  if (!v11)
  {
    long long v11 = objc_msgSend(v6, "scannedAnnotationAtPoint:", v8, v10);
  }
  uint64_t v12 = [v11 valueForAnnotationKey:@"/Subtype"];
  char v13 = [v12 isEqualToString:@"/Link"];

  if (v13) {
    BOOL v14 = 1;
  }
  else {
LABEL_6:
  }
    BOOL v14 = 0;

  return v14;
}

- (void)setGutterWidth:(double)a3
{
  [(PDFView *)self gutterWidth];
  if (v5 != a3)
  {
    [(PDFView *)self gutterWidth];
    if (v6 >= 0.0)
    {
      double v9 = NSNumber;
      [(PDFView *)self gutterWidth];
      *(float *)&double v10 = v10;
      id v11 = [v9 numberWithFloat:v10];
      self->_private->gutterWide = a3;
      [(PDFView *)self layoutDocumentView];
    }
    else
    {
      double v7 = (void *)MEMORY[0x263EFF940];
      uint64_t v8 = *MEMORY[0x263EFF578];
      [v7 raise:v8 format:@"setGutterWidth: width cannot be negative"];
    }
  }
}

- (double)gutterWidth
{
  return self->_private->gutterWide;
}

- (double)defaultGutterWidth
{
  return 224.0;
}

- (BOOL)pageShadowsEnabled
{
  return [(PDFRenderingProperties *)self->_private->renderingProperties enablePageShadows];
}

- (void)enablePageShadows:(BOOL)pageShadowsEnabled
{
}

- (void)setForcesTopAlignment:(BOOL)a3
{
  [(PDFScrollView *)self->_private->scrollView setForcesTopAlignment:a3];

  [(PDFView *)self layoutDocumentView];
}

- (id)_getDocumentAKController
{
  document = self->_private->document;
  if (document)
  {
    objc_super v3 = [(PDFDocument *)document akDocumentAdaptor];
    uint64_t v4 = v3;
    if (v3)
    {
      double v5 = [v3 akMainController];
    }
    else
    {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)akToolbarView
{
  if ([(PDFDocument *)self->_private->document isLocked])
  {
    objc_super v3 = 0;
  }
  else
  {
    uint64_t v4 = [(PDFView *)self _getDocumentAKController];
    if (v4)
    {
      double v5 = [(PDFDocument *)self->_private->document akDocumentAdaptor];
      objc_super v3 = [v5 akToolbarView];
    }
    else
    {
      objc_super v3 = 0;
    }
  }

  return v3;
}

- (void)setAkToolbarViewTintColor:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(PDFView *)self akToolbarView];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 setBarTintColor:v5];
    }
  }
}

- (id)akToolbarViewTintColor
{
  double v2 = [(PDFView *)self akToolbarView];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v3 = [v2 barTintColor];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (void)setAkToolbarViewItemTintColor:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(PDFView *)self akToolbarView];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 setTintColor:v5];
    }
  }
}

- (id)akToolbarViewItemTintColor
{
  double v2 = [(PDFView *)self akToolbarView];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v3 = [v2 tintColor];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (id)akUndoToolbarItem
{
  double v2 = [(PDFView *)self _getDocumentAKController];
  objc_super v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 toolbarButtonItemOfType:10];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)akRedoToolbarItem
{
  double v2 = [(PDFView *)self _getDocumentAKController];
  objc_super v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 toolbarButtonItemOfType:11];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)akAnnotationEditingEnabled
{
  double v2 = [(PDFView *)self _getDocumentAKController];
  objc_super v3 = v2;
  if (v2) {
    char v4 = [v2 annotationEditingEnabled];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setAkAnnotationEditingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PDFView *)self _getDocumentAKController];
  if (v5)
  {
    id v10 = v5;
    BOOL v6 = [v5 annotationEditingEnabled] == v3;
    id v5 = v10;
    if (!v6)
    {
      [v10 setAnnotationEditingEnabled:v3];
      if (v3)
      {
        double v7 = objc_opt_new();
        [v7 setTag:763000];
        [v10 performActionForSender:v7];
      }
      else
      {
        uint64_t v8 = [v10 modelController];
        [v8 deselectAllAnnotations];

        [v10 resetToDefaultToolMode];
      }
      double v9 = self->_private;
      id v5 = v10;
      if (v9->isUsingPageViewController)
      {
        [(PDFDocumentViewController *)v9->documentViewController setScrollViewScrollEnabled:v3 ^ 1];
        id v5 = v10;
      }
    }
  }
}

- (BOOL)isAnnotationEditingEnabled
{
  if (self->_annotationEditingAllowed || [(PDFView *)self akAnnotationEditingEnabled]) {
    return 1;
  }

  return [(PDFView *)self allowsMarkupAnnotationEditing];
}

- (void)setAnnotationEditingEnabled:(BOOL)a3
{
  self->_annotationEditingAllowed = a3;
}

- (BOOL)isFormDetectionEnabled
{
  return self->_formDetectionEnabled;
}

- (void)setFormDetectionEnabled:(BOOL)a3
{
  if (self->_formDetectionEnabled != a3)
  {
    self->_formDetectionEnabled = a3;
    if (a3) {
      [(PDFView *)self visiblePagesChanged:0];
    }
  }
}

- (BOOL)isInMarkupMode
{
  return self->_inMarkupMode || [(PDFView *)self akAnnotationEditingEnabled];
}

- (void)setNewPageVisibilityDelegate:(id)a3 withOldDelegate:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6 != v7)
  {
    uint64_t v8 = self->_private;
    if (v8->isUsingPageViewController)
    {
      double v9 = [(PDFDocumentViewController *)v8->documentViewController pageViews];
    }
    else
    {
      id v10 = [(PDFScrollView *)v8->scrollView pdfDocumentView];
      double v9 = [v10 pageViews];
    }
    objc_storeWeak((id *)&self->_private->delegate, v7);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
    id v31 = v11;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if ([v16 visibilityDelegateIndex] != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v7)
            {
              uint64_t v17 = [v16 visibilityDelegateIndex];
              [(PDFView *)self callPageVisibilityDelegateMethod:2 forPageView:v16 atPageIndex:v17];
              uint64_t v18 = v17;
              id v11 = v31;
              [(PDFView *)self callPageVisibilityDelegateMethod:3 forPageView:v16 atPageIndex:v18];
            }
            else
            {
              [v16 setVisibilityDelegateIndex:0x7FFFFFFFFFFFFFFFLL];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v13);
    }

    objc_storeWeak((id *)&self->_private->delegate, v6);
    if (v6)
    {
      id v29 = v7;
      id v30 = v6;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v19 = v11;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v33 != v22) {
              objc_enumerationMutation(v19);
            }
            long long v24 = *(void **)(*((void *)&v32 + 1) + 8 * j);
            long long v25 = [v24 page];
            uint64_t v26 = [v25 document];
            uint64_t v27 = [v24 page];
            uint64_t v28 = [v26 indexForPage:v27];

            [(PDFView *)self callPageVisibilityDelegateMethod:0 forPageView:v24 atPageIndex:v28];
            [(PDFView *)self callPageVisibilityDelegateMethod:1 forPageView:v24 atPageIndex:v28];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v21);
      }

      id v7 = v29;
      id v6 = v30;
      id v11 = v31;
    }
  }
}

- (void)callPageVisibilityDelegateMethod:(int)a3 forPageView:(id)a4 atPageIndex:(unint64_t)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->delegate);
    id v10 = self->_overlayViewController;
    switch(a3)
    {
      case 0:
        if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
        {
          id v11 = [v8 page];
          [WeakRetained pdfView:self willAddView:v8 forPage:v11 atIndex:a5];
        }
        [v8 setVisibilityDelegateIndex:a5];
        break;
      case 1:
        if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v12 = [v8 page];
          [WeakRetained pdfView:self didAddView:v8 forPage:v12 atIndex:a5];
        }
        uint64_t v13 = [v8 page];
        [(PDFOverlayViewsController *)v10 pdfView:self didAddView:v8 forPage:v13 atIndex:a5];

        [(PDFCoachMarkManager *)self->_private->coachMarkManager pageLayerDidAppear:v8];
        break;
      case 2:
        if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v14 = [v8 page];
          [WeakRetained pdfView:self willRemoveView:v8 forPage:v14 atIndex:a5];
        }
        long long v15 = [v8 page];
        [(PDFOverlayViewsController *)v10 pdfView:self willRemoveView:v8 forPage:v15 atIndex:a5];

        [(PDFCoachMarkManager *)self->_private->coachMarkManager pageLayerWillRemove:v8];
        break;
      case 3:
        if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
        {
          long long v16 = [v8 page];
          [WeakRetained pdfView:self didRemoveView:v8 forPage:v16 atIndex:a5];
        }
        [v8 setVisibilityDelegateIndex:0x7FFFFFFFFFFFFFFFLL];
        uint64_t v17 = [v8 page];
        uint64_t v18 = [(PDFView *)self visiblePageViews];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v26;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v26 != v21) {
                objc_enumerationMutation(v18);
              }
              id v23 = *(id *)(*((void *)&v25 + 1) + 8 * v22);
              if (v23 != v8)
              {
                long long v24 = [*(id *)(*((void *)&v25 + 1) + 8 * v22) page];

                if (v24 == v17) {
                  [v23 setVisibilityDelegateIndex:0x7FFFFFFFFFFFFFFFLL];
                }
              }
              ++v22;
            }
            while (v20 != v22);
            uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v20);
        }

        break;
      default:
        NSLog(&cfstr_IncorrectCallI.isa);
        break;
    }
  }
}

- (void)performOverlayAdaptorPageVisibilityTrueUpAfterSettingDocument
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v3 = self->_private;
  if (v3->isUsingPageViewController)
  {
    char v4 = [(PDFDocumentViewController *)v3->documentViewController pageViews];
  }
  else
  {
    id v5 = [(PDFScrollView *)v3->scrollView pdfDocumentView];
    char v4 = [v5 pageViews];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "visibilityDelegateIndex", (void)v14);
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v13 = v12;
          [(PDFView *)self callPageVisibilityDelegateMethodForOverlayAdaptorOnly:0 forPageView:v11 atPageIndex:v12];
          [(PDFView *)self callPageVisibilityDelegateMethodForOverlayAdaptorOnly:1 forPageView:v11 atPageIndex:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)callPageVisibilityDelegateMethodForOverlayAdaptorOnly:(int)a3 forPageView:(id)a4 atPageIndex:(unint64_t)a5
{
  id v10 = a4;
  uint64_t v8 = self->_overlayViewController;
  switch(a3)
  {
    case 0:
    case 3:
      break;
    case 1:
      uint64_t v9 = [v10 page];
      [(PDFOverlayViewsController *)v8 pdfView:self didAddView:v10 forPage:v9 atIndex:a5];
      goto LABEL_5;
    case 2:
      uint64_t v9 = [v10 page];
      [(PDFOverlayViewsController *)v8 pdfView:self willRemoveView:v10 forPage:v9 atIndex:a5];
LABEL_5:

      break;
    default:
      NSLog(&cfstr_IncorrectCallI.isa);
      break;
  }
}

- (BOOL)showsScrollIndicators
{
  return self->_private->showsScrollIndicators;
}

- (void)setShowsScrollIndicators:(BOOL)a3
{
  BOOL v3 = self->_private;
  if (v3->showsScrollIndicators != a3)
  {
    v3->showsScrollIndicators = a3;
    [(PDFView *)self positionInternalViews:0];
  }
}

+ (void)DisableAnnotationKit
{
}

- (void)setIsUsingPDFExtensionView:(BOOL)a3
{
}

- (void)setScrollViewScrollEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[PDFScrollView setScrollEnabled:](self->_private->scrollView, "setScrollEnabled:");
  scrollView = self->_private->scrollView;

  [(PDFScrollView *)scrollView setUserInteractionEnabled:v3];
}

- (CGRect)extensionViewBoundsInDocument
{
  double v2 = self->_private;
  double x = v2->extensionViewBoundsInDocument.origin.x;
  double y = v2->extensionViewBoundsInDocument.origin.y;
  double width = v2->extensionViewBoundsInDocument.size.width;
  double height = v2->extensionViewBoundsInDocument.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)extensionViewZoomScale
{
  return self->_private->extensionViewZoomScale;
}

- (CGSize)pdfDocumentViewSize
{
  double v2 = [(PDFScrollView *)self->_private->scrollView pdfDocumentView];
  [v2 documentViewSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)updatePDFViewLayout:(CGRect)a3 scrollViewFrame:(CGRect)a4 zoomScale:(double)a5
{
  self->_private->extensionViewBoundsInDocument = a3;
  self->_private->extensionViewFrame = a4;
  self->_private->extensionViewZoomScale = a5;
  id v5 = [(PDFScrollView *)self->_private->scrollView pdfDocumentView];
  [v5 updateVisibility];
}

- (CGRect)rootViewBounds
{
  if ([(PDFRenderingProperties *)self->_private->renderingProperties isUsingPDFExtensionView])
  {
    double v3 = self->_private;
    double x = v3->extensionViewFrame.origin.x;
    double y = v3->extensionViewFrame.origin.y;
    double width = v3->extensionViewFrame.size.width;
    double height = v3->extensionViewFrame.size.height;
  }
  else
  {
    [(PDFView *)self bounds];
    -[PDFView convertRect:toView:](self, "convertRect:toView:", 0);
    double x = v8;
    double y = v9;
    double width = v10;
    double height = v11;
  }
  [(PDFView *)self mainScreenScale];

  double v13 = PDFRectScale(x, y, width, height, v12);
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (double)targetBackingScaleFactor
{
  [(PDFView *)self mainScreenScale];
  return fmax(v2, 1.0);
}

- (CGRect)convertRectToRootView:(CGRect)a3 fromPageLayer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  double v10 = [(PDFView *)self layer];
  objc_msgSend(v9, "convertRect:toLayer:", v10, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  if ([(PDFRenderingProperties *)self->_private->renderingProperties isUsingPDFExtensionView])
  {
    uint64_t v19 = self->_private;
    double extensionViewZoomScale = v19->extensionViewZoomScale;
    double v12 = v19->extensionViewFrame.origin.x
        + v12 * extensionViewZoomScale
        - v19->extensionViewBoundsInDocument.origin.x * extensionViewZoomScale;
    double v16 = v16 * extensionViewZoomScale;
    double v18 = v18 * extensionViewZoomScale;
    double v21 = v19->extensionViewFrame.size.height
        - v18
        - (v19->extensionViewFrame.origin.y
         + v14 * extensionViewZoomScale
         - v19->extensionViewBoundsInDocument.origin.y * extensionViewZoomScale);
  }
  else
  {
    uint64_t v22 = [(PDFView *)self layer];
    [v22 bounds];
    double v21 = v23 - v18 - v14;
  }
  long long v24 = [(PDFView *)self layer];
  objc_msgSend(v24, "convertRect:toLayer:", 0, v12, v21, v16, v18);
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  [(PDFView *)self mainScreenScale];
  double v34 = v28 * v33;
  double v35 = v30 * v33;
  double v36 = v32 * v33;
  double v37 = v26 * v33;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.double y = v34;
  result.origin.double x = v37;
  return result;
}

- (CGRect)convertRootViewRect:(CGRect)a3 toPageLayer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  [(PDFView *)self mainScreenScale];
  double v11 = x / v10;
  double v12 = y / v10;
  double v13 = width / v10;
  double v14 = height / v10;
  double v15 = [(PDFView *)self layer];
  objc_msgSend(v15, "convertRect:fromLayer:", 0, v11, v12, v13, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  long long v24 = [(PDFView *)self layer];
  [v24 bounds];
  double v26 = v25 - v23 - v19;

  double v27 = [(PDFView *)self layer];
  objc_msgSend(v9, "convertRect:fromLayer:", v27, v17, v26, v21, v23);
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;

  if ([(PDFRenderingProperties *)self->_private->renderingProperties isUsingPDFExtensionView])
  {
    double extensionViewZoomScale = self->_private->extensionViewZoomScale;
    double v33 = v33 / extensionViewZoomScale;
    double v35 = v35 / extensionViewZoomScale;
  }
  double v37 = v29;
  double v38 = v31;
  double v39 = v33;
  double v40 = v35;
  result.size.double height = v40;
  result.size.double width = v39;
  result.origin.double y = v38;
  result.origin.double x = v37;
  return result;
}

- (BOOL)flipsTileContents
{
  return 1;
}

- (CGRect)extendedRootViewBounds
{
  [(PDFView *)self rootViewBounds];

  return PDFRectInset(*(CGRect *)&v2, v4 * -0.1, v5 * -0.1);
}

- (CGRect)mainScreenBounds
{
  uint64_t v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (double)mainScreenScale
{
  uint64_t v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 scale];
  double v4 = v3;

  return v4;
}

+ (void)setUseIOSurfaceForTiles:(BOOL)a3
{
}

- (id)pageOverlayViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageOverlayViewProvider);

  return WeakRetained;
}

- (void)setInMarkupMode:(BOOL)inMarkupMode
{
  self->_inMarkupMode = inMarkupMode;
}

- (BOOL)isFindInteractionEnabled
{
  return self->_findInteractionEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageOverlayViewProvider);
  objc_storeStrong(&self->_formFieldButtonHideKeyboardNotification, 0);
  objc_storeStrong(&self->_formFieldButtonShowKeyboardNotification, 0);
  objc_storeStrong((id *)&self->_formFieldButton, 0);
  objc_storeStrong((id *)&self->_overlayViewController, 0);
  objc_destroyWeak((id *)&self->_detectedFormFieldPage);
  objc_destroyWeak((id *)&self->_detectedFormField);
  objc_destroyWeak((id *)&self->_pageBackgroundManager);

  objc_storeStrong((id *)&self->_private, 0);
}

- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  sub_2144177A8();
  sub_214417798();
  sub_214417788();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v10 = a4;
  double v11 = self;
  PDFView._intelligenceCollectContent(in:collector:)((uint64_t)v10, x, y, width, height);
  swift_release();
}

@end