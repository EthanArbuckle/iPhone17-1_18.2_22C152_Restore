@interface MUPDFContentViewController
- (BOOL)PDFView:(id)a3 shouldHandleLink:(id)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)_pageLabelExistAtPoint:(CGPoint)a3;
- (BOOL)_thumbnailViewExistAtPoint:(CGPoint)a3;
- (BOOL)_updateCachedThumbnailViewInsetsDidChangeLeftOrRight;
- (BOOL)acceptSingleTouch:(id)a3;
- (BOOL)allowsThumbnailViewPageReordering;
- (BOOL)canEditContent;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canShowPageViewLabel;
- (BOOL)constraintsAreHorizontal;
- (BOOL)didSetup;
- (BOOL)documentCanBeEdited:(id)a3;
- (BOOL)fixedThumbnailView;
- (BOOL)forcesPDFViewTopAlignment;
- (BOOL)isTouchInThumbnailView:(id)a3;
- (BOOL)navigationModeHorizontal;
- (BOOL)shouldShowAnnotationsOfType:(id)a3;
- (BOOL)shouldShowThumbnailView;
- (BOOL)showsThumbnailView;
- (BOOL)viewIsTransitioningBetweenSizes;
- (BOOL)viewTransitionPreviousAutoscalingState;
- (CGAffineTransform)_compensatingAffineTransformForPage:(SEL)a3;
- (CGPoint)viewTransitionPointOnPageToCenter;
- (CGRect)visibleContentRect;
- (CGRect)visibleContentRectInCoordinateSpace:(id)a3;
- (CGSize)_medianSizeForCurrentDocumentInPDFViewWithGetter:(id)a3;
- (CGSize)_thumbnailViewCellSize;
- (CGSize)contentSize;
- (CGSize)idealContentSizeForScreenSize:(CGSize)a3 windowDecorationSize:(CGSize)a4;
- (MUPDFContentViewController)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5;
- (MUPDFContentViewController)initWithPDFDocument:(id)a3 delegate:(id)a4;
- (NSArray)sourceContentReplacedAnnotationMaps;
- (NSArray)thumbnailViewHolderConstraints;
- (NSLayoutConstraint)pdfViewLeadingConstraint;
- (NSLayoutConstraint)thumbnailViewHolderRevealConstraint;
- (NSLayoutConstraint)thumbnailViewHolderWidthConstraint;
- (NSLayoutConstraint)thumbnailViewLeadingConstraint;
- (NSString)documentUnlockedWithPassword;
- (PDFDocument)pdfDocument;
- (PDFPage)viewTransitionPageToCenter;
- (PDFThumbnailView)thumbnailView;
- (PDFView)pdfView;
- (UIEdgeInsets)cachedThumnailViewInsets;
- (UIEdgeInsets)edgeInsets;
- (UIScrollView)contentViewScrollView;
- (UIView)pageLabelView;
- (UIView)scrollerBackgroundView;
- (UIView)thumbnailViewHolder;
- (double)_thumbnailViewWidth;
- (double)viewTransitionPreviousScale;
- (id)contentSnapshot;
- (id)controller:(id)a3 willSetToolbarItems:(id)a4;
- (id)menuElementsForPage:(id)a3;
- (int64_t)defaultToolTag;
- (int64_t)thumbnailViewStyle;
- (unint64_t)inkStyle;
- (unint64_t)pageCount;
- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4;
- (void)_createPDFView;
- (void)_prepareToRotate;
- (void)_recoverFromRotation;
- (void)_removePageLabelViewConstraints;
- (void)_teardownPDFViewIfNecessary;
- (void)_updateMinMaxZoomFactor;
- (void)_updatePDFViewDisplayMode;
- (void)_updatePageNumberOverlayToPage:(unint64_t)a3 animate:(BOOL)a4;
- (void)_updateThumbnailView;
- (void)_updateThumbnailViewAppearance;
- (void)_updateThumbnailViewHolderBackgroundColor;
- (void)_updateThumbnailViewHolderConstraints;
- (void)_updateThumbnailViewHolderVisibility;
- (void)_userChangedScrollViewMagnificationNotification:(id)a3;
- (void)annotationController:(id)a3 detectedEditOfType:(unint64_t)a4;
- (void)controllerWillDismissSignatureCaptureView:(id)a3;
- (void)controllerWillDismissSignatureManagerView:(id)a3;
- (void)controllerWillShowSignatureCaptureView:(id)a3;
- (void)controllerWillShowSignatureManagerView:(id)a3;
- (void)dealloc;
- (void)edgeSwipeGestureRecognized:(id)a3;
- (void)editCheckpointReachedForAnnotationController:(id)a3;
- (void)find:(id)a3;
- (void)findNext:(id)a3;
- (void)findPrevious:(id)a3;
- (void)highlight:(id)a3;
- (void)loadContentWithCompletionBlock:(id)a3;
- (void)pageLabelViewTapped:(id)a3;
- (void)pdfDocumentDidUnlock:(id)a3;
- (void)pdfScrollViewWillBeginDragging:(id)a3;
- (void)pdfViewDidChangeCurrentPage:(id)a3;
- (void)penStrokeCompletedForAnnotationController:(id)a3;
- (void)positionSketchOverlay:(id)a3 forAnnotationController:(id)a4;
- (void)removeThumbnailViewHolderConstraints;
- (void)setAllowsThumbnailViewPageReordering:(BOOL)a3;
- (void)setCachedThumnailViewInsets:(UIEdgeInsets)a3;
- (void)setConstraintsAreHorizontal:(BOOL)a3;
- (void)setDidSetup:(BOOL)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setFixedThumbnailView:(BOOL)a3;
- (void)setForcesPDFViewTopAlignment:(BOOL)a3;
- (void)setInkStyle:(unint64_t)a3;
- (void)setNavigationModeHorizontal:(BOOL)a3;
- (void)setPdfView:(id)a3;
- (void)setPdfViewLeadingConstraint:(id)a3;
- (void)setScrollerBackgroundView:(id)a3;
- (void)setShouldShowThumbnailView:(BOOL)a3;
- (void)setShowsThumbnailView:(BOOL)a3;
- (void)setSourceContentReplacedAnnotationMaps:(id)a3;
- (void)setThumbnailView:(id)a3;
- (void)setThumbnailViewHolder:(id)a3;
- (void)setThumbnailViewHolderConstraints:(id)a3;
- (void)setThumbnailViewHolderRevealConstraint:(id)a3;
- (void)setThumbnailViewHolderWidthConstraint:(id)a3;
- (void)setThumbnailViewLeadingConstraint:(id)a3;
- (void)setThumbnailViewStyle:(int64_t)a3;
- (void)setViewIsTransitioningBetweenSizes:(BOOL)a3;
- (void)setViewTransitionPageToCenter:(id)a3;
- (void)setViewTransitionPointOnPageToCenter:(CGPoint)a3;
- (void)setViewTransitionPreviousAutoscalingState:(BOOL)a3;
- (void)setViewTransitionPreviousScale:(double)a3;
- (void)setup;
- (void)teardown;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MUPDFContentViewController

- (MUPDFContentViewController)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5
{
  v6 = (objc_class *)MEMORY[0x263F14738];
  id v7 = a5;
  id v8 = objc_alloc_init(v6);
  v9 = [(MUPDFContentViewController *)self initWithPDFDocument:v8 delegate:v7];

  return v9;
}

- (MUPDFContentViewController)initWithPDFDocument:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MUPDFContentViewController;
  id v8 = [(MUContentViewController *)&v12 initWithNibName:0 bundle:0 delegate:a4];
  v9 = v8;
  if (v8)
  {
    p_pdfDocument = (id *)&v8->_pdfDocument;
    objc_storeStrong((id *)&v8->_pdfDocument, a3);
    [*p_pdfDocument setDelegate:v9];
    [*p_pdfDocument setPDFAKControllerDelegate:v9];
    v9->_thumbnailViewStyle = 0;
    [(MUPDFContentViewController *)v9 setInkStyle:1];
  }

  return v9;
}

- (BOOL)allowsThumbnailViewPageReordering
{
  v2 = [(MUPDFContentViewController *)self thumbnailView];
  v3 = v2;
  if (v2) {
    char v4 = [v2 allowsPageReordering];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setAllowsThumbnailViewPageReordering:(BOOL)a3
{
  BOOL v3 = a3;
  self->_allowsThumbnailViewPageReordering = a3;
  id v4 = [(MUPDFContentViewController *)self thumbnailView];
  [v4 setAllowsPageReordering:v3];
}

- (void)setInkStyle:(unint64_t)a3
{
  self->_inkStyle = a3;
  BOOL v3 = a3 == 0;
  id v4 = [(MUContentViewController *)self annotationController];
  [v4 setUseHighVisibilityDefaultInks:v3];
}

- (void)dealloc
{
  [(MUPDFContentViewController *)self teardown];
  v3.receiver = self;
  v3.super_class = (Class)MUPDFContentViewController;
  [(MUPDFContentViewController *)&v3 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)MUPDFContentViewController;
  [(MUPDFContentViewController *)&v5 viewDidLoad];
  objc_super v3 = [MEMORY[0x263F1C550] darkGrayColor];
  id v4 = [(MUPDFContentViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)viewDidLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)MUPDFContentViewController;
  [(MUPDFContentViewController *)&v16 viewDidLayoutSubviews];
  if (![(MUPDFContentViewController *)self viewIsTransitioningBetweenSizes])
  {
    objc_super v3 = [(MUPDFContentViewController *)self pdfView];
    uint64_t v4 = [v3 autoScales];

    objc_super v5 = [(MUPDFContentViewController *)self pdfView];
    [v5 scaleFactor];
    double v7 = v6;
    id v8 = [(MUPDFContentViewController *)self pdfView];
    [v8 autoScaleFactor];
    double v10 = vabdd_f64(v7, v9);

    [(MUPDFContentViewController *)self _updateMinMaxZoomFactor];
    if (v10 < 0.0005)
    {
      v11 = [(MUPDFContentViewController *)self pdfView];
      objc_super v12 = [(MUPDFContentViewController *)self pdfView];
      [v12 autoScaleFactor];
      objc_msgSend(v11, "setScaleFactor:");
    }
    v13 = [(MUPDFContentViewController *)self pdfView];
    int v14 = [v13 autoScales];

    if (v4 != v14)
    {
      v15 = [(MUPDFContentViewController *)self pdfView];
      [v15 setAutoScales:v4];
    }
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MUPDFContentViewController;
  [(MUPDFContentViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(MUPDFContentViewController *)self _updateThumbnailViewHolderConstraints];
}

- (void)setup
{
  NSLog(&cfstr_S_0.isa, a2, "-[MUPDFContentViewController setup]");
  [(MUPDFContentViewController *)self setDidSetup:1];
}

- (void)teardown
{
  NSLog(&cfstr_S_0.isa, a2, "-[MUPDFContentViewController teardown]");
  [(MUPDFContentViewController *)self _teardownPDFViewIfNecessary];
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  if ([(MUPDFContentViewController *)self didSetup])
  {
    [(MUPDFContentViewController *)self setDidSetup:0];
  }
}

- (void)loadContentWithCompletionBlock:(id)a3
{
  id v6 = a3;
  [MEMORY[0x263F158F8] begin];
  uint64_t v4 = (void *)MEMORY[0x230F8EA40]([MEMORY[0x263F158F8] setDisableActions:1]);
  [(MUPDFContentViewController *)self _createPDFView];
  [MEMORY[0x263F158F8] commit];
  objc_super v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    objc_super v5 = v6;
  }
}

- (CGSize)contentSize
{
  objc_super v3 = [(MUPDFContentViewController *)self pdfView];
  [v3 scaleFactor];
  double v5 = v4;
  uint64_t v6 = [v3 autoScales];
  [v3 setAutoScales:0];
  [v3 setScaleFactor:1.0];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __41__MUPDFContentViewController_contentSize__block_invoke;
  v14[3] = &unk_2649C2F58;
  id v15 = v3;
  id v7 = v3;
  [(MUPDFContentViewController *)self _medianSizeForCurrentDocumentInPDFViewWithGetter:v14];
  double v9 = v8;
  double v11 = v10;
  [v7 setScaleFactor:v5];
  [v7 setAutoScales:v6];

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

uint64_t __41__MUPDFContentViewController_contentSize__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) rowSizeForPage:a2];
}

- (CGSize)idealContentSizeForScreenSize:(CGSize)a3 windowDecorationSize:(CGSize)a4
{
  double v5 = a3.width - a4.width;
  double v6 = a3.height - a4.height;
  id v7 = [(MUPDFContentViewController *)self pdfView];
  int v8 = [v7 autoScales];
  [v7 setScaleFactor:1.0];
  [v7 setAutoScales:0];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __81__MUPDFContentViewController_idealContentSizeForScreenSize_windowDecorationSize___block_invoke;
  v27[3] = &unk_2649C2F58;
  id v9 = v7;
  id v28 = v9;
  [(MUPDFContentViewController *)self _medianSizeForCurrentDocumentInPDFViewWithGetter:v27];
  double v11 = v10;
  double v13 = v12;
  if ([v9 displayMode])
  {
    int v14 = [v9 document];
    unint64_t v15 = [v14 pageCount];

    if (v15 > 1) {
      double v13 = 1.79769313e308;
    }
  }
  char v16 = [v9 displayMode];
  double v17 = v6 / v13;
  if (v5 / v11 < v6 / v13) {
    double v17 = v5 / v11;
  }
  if (v16) {
    double v17 = v5 / v11;
  }
  double v18 = fmin(v17, 1.0);
  [v9 setScaleFactor:v18];
  [v9 setAutoScales:0];
  double v19 = v13 * v18;
  if ([v9 displayMode])
  {
    v20 = [v9 document];
    unint64_t v21 = [v20 pageCount];

    if (v21 > 1) {
      double v19 = 1.79769313e308;
    }
  }
  if (v8) {
    [v9 setAutoScales:1];
  }
  double v22 = v11 * v18;
  if (v19 >= v6) {
    double v23 = v6;
  }
  else {
    double v23 = v19;
  }
  if (v22 >= v5) {
    double v24 = v5;
  }
  else {
    double v24 = v22;
  }

  double v25 = v24;
  double v26 = v23;
  result.height = v26;
  result.width = v25;
  return result;
}

uint64_t __81__MUPDFContentViewController_idealContentSizeForScreenSize_windowDecorationSize___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) rowSizeForPage:a2];
}

- (int64_t)defaultToolTag
{
  return 764017;
}

- (UIScrollView)contentViewScrollView
{
  v2 = [(MUPDFContentViewController *)self pdfView];
  objc_super v3 = [v2 documentScrollView];

  return (UIScrollView *)v3;
}

- (BOOL)PDFView:(id)a3 shouldHandleLink:(id)a4
{
  id v5 = a4;
  double v6 = [(MUContentViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 contentViewController:self shouldHandleURL:v5];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)shouldShowAnnotationsOfType:(id)a3
{
  id v3 = a3;
  double v4 = +[MUCGPDFAnnotationAdaptor supportedAnnotationTypes];
  char v5 = [v4 containsObject:v3];

  return v5 ^ 1;
}

- (BOOL)documentCanBeEdited:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MUPDFContentViewController *)self pdfDocument];
  if ((id)v5 == v4)
  {
    BOOL v9 = [(MUPDFContentViewController *)self canEditContent];

    if (!v9)
    {
      char v7 = 0;
      goto LABEL_5;
    }
    double v6 = [(MUContentViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      char v7 = [v6 allowsEditing];
      goto LABEL_4;
    }
  }
  else
  {
    double v6 = (void *)v5;
  }
  char v7 = 0;
LABEL_4:

LABEL_5:
  return v7;
}

- (id)menuElementsForPage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MUContentViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v6 = [v5 getMenuElementsForPage:v4];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (BOOL)canShowPageViewLabel
{
  id v3 = [(MUContentViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    LOBYTE(v4) = [v3 canShowPageViewLabel];
  }
  else
  {
    uint64_t v5 = [(MUPDFContentViewController *)self pdfDocument];
    int v4 = [v5 isLocked] ^ 1;
  }
  return v4;
}

- (id)controller:(id)a3 willSetToolbarItems:(id)a4
{
  id v5 = a4;
  double v6 = [(MUContentViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 annotationControllerOfContentViewController:self willSetToolbarItems:v5];
  }
  else
  {
    id v7 = v5;
  }
  int v8 = v7;

  return v8;
}

- (void)positionSketchOverlay:(id)a3 forAnnotationController:(id)a4
{
  id v6 = a3;
  id v5 = [(MUContentViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 positionSketchOverlay:v6 forContentViewController:self];
  }
}

- (void)annotationController:(id)a3 detectedEditOfType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(MUContentViewController *)self delegate];
  [v7 annotationController:v6 detectedEditOfType:a4];
}

- (void)editCheckpointReachedForAnnotationController:(id)a3
{
  id v4 = a3;
  id v5 = [(MUContentViewController *)self delegate];
  [v5 editCheckpointReachedForAnnotationController:v4];
}

- (void)penStrokeCompletedForAnnotationController:(id)a3
{
  id v4 = a3;
  id v5 = [(MUContentViewController *)self delegate];
  [v5 penStrokeCompletedForAnnotationController:v4];
}

- (void)controllerWillShowSignatureCaptureView:(id)a3
{
  id v4 = a3;
  id v5 = [(MUContentViewController *)self delegate];
  [v5 controllerWillShowSignatureCaptureView:v4];
}

- (void)controllerWillDismissSignatureCaptureView:(id)a3
{
  id v4 = a3;
  id v5 = [(MUContentViewController *)self delegate];
  [v5 controllerWillDismissSignatureCaptureView:v4];
}

- (void)controllerWillShowSignatureManagerView:(id)a3
{
  id v4 = a3;
  id v5 = [(MUContentViewController *)self delegate];
  [v5 controllerWillShowSignatureManagerView:v4];
}

- (void)controllerWillDismissSignatureManagerView:(id)a3
{
  id v4 = a3;
  id v5 = [(MUContentViewController *)self delegate];
  [v5 controllerWillDismissSignatureManagerView:v4];
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  double v8 = self->_edgeInsets.left;
  double v25 = self->_edgeInsets.top;
  double v10 = self->_edgeInsets.bottom;
  double v9 = self->_edgeInsets.right;
  self->_edgeInsets = a3;
  BOOL v11 = [(MUPDFContentViewController *)self navigationModeHorizontal];
  double v12 = 0.0;
  if (v11) {
    double v13 = 0.0;
  }
  else {
    double v13 = top;
  }
  if (v13 > 0.0)
  {
    if (v11) {
      double v14 = left;
    }
    else {
      double v14 = 0.0;
    }
    if (v11) {
      double v15 = 0.0;
    }
    else {
      double v15 = bottom;
    }
    double v23 = v15;
    double v24 = v14;
    if (v11) {
      double v12 = right;
    }
    char v16 = [(MUPDFContentViewController *)self thumbnailView];
    objc_msgSend(v16, "setContentInset:", v13, v24, v23, v22);
  }
  if (v8 != left || v25 != top || v9 != right || v10 != bottom)
  {
    v20 = [(MUContentViewController *)self annotationController];
    uint64_t v21 = [v20 currentPageIndex];

    if (v21 != 0x7FFFFFFFFFFFFFFFLL) {
      [(MUPDFContentViewController *)self _updatePageNumberOverlayToPage:v21 animate:0];
    }
  }
  if (![(MUPDFContentViewController *)self viewIsTransitioningBetweenSizes])
  {
    [(MUPDFContentViewController *)self _updateMinMaxZoomFactor];
  }
}

- (unint64_t)pageCount
{
  v2 = [(MUPDFContentViewController *)self pdfDocument];
  unint64_t v3 = [v2 pageCount];

  return v3;
}

- (void)setFixedThumbnailView:(BOOL)a3
{
  if (self->_fixedThumbnailView != a3)
  {
    self->_fixedThumbnailView = a3;
    [(MUPDFContentViewController *)self removeThumbnailViewHolderConstraints];
    [(MUPDFContentViewController *)self _updateThumbnailViewHolderConstraints];
  }
}

- (void)setShowsThumbnailView:(BOOL)a3
{
  v36[2] = *MEMORY[0x263EF8340];
  if (self->_showsThumbnailView == a3) {
    return;
  }
  BOOL v3 = a3;
  id v5 = [(MUPDFContentViewController *)self pdfView];

  if (!v5)
  {
    self->_showsThumbnailView = v3;
    return;
  }
  [MEMORY[0x263F158F8] animationDuration];
  double v7 = v6;
  if (([MEMORY[0x263F158F8] disableActions] & 1) != 0
    || [(MUPDFContentViewController *)self fixedThumbnailView])
  {
    double v7 = 0.0;
  }
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  if (v7 <= 0.0)
  {
    self->_showsThumbnailView = v3;
    if ([(MUPDFContentViewController *)self fixedThumbnailView])
    {
      if (v3) {
        double v8 = 1.0;
      }
      else {
        double v8 = 0.0;
      }
      double v9 = [(MUPDFContentViewController *)self thumbnailViewHolder];
      [v9 setAlpha:v8];
    }
    [(MUPDFContentViewController *)self _updateThumbnailViewHolderVisibility];
    if (!v3) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v3)
  {
LABEL_16:
    double v10 = [(MUPDFContentViewController *)self thumbnailView];

    if (!v10)
    {
      BOOL v11 = objc_msgSend(objc_alloc(MEMORY[0x263F14768]), "initWithFrame:style:", self->_thumbnailViewStyle, 0.0, 0.0, 100.0, 100.0);
      [v11 setThumbnailContextMenuDelegate:self];
      [v11 setAllowsPageReordering:self->_allowsThumbnailViewPageReordering];
      [(MUPDFContentViewController *)self setThumbnailView:v11];
      double v12 = [(MUPDFContentViewController *)self pdfView];
      [v11 setPDFView:v12];

      [(MUPDFContentViewController *)self _updateThumbnailViewAppearance];
      [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
      double v13 = [(MUPDFContentViewController *)self thumbnailViewHolder];
      [v13 addSubview:v11];

      double v14 = _NSDictionaryOfVariableBindings(&cfstr_Thumbnailview.isa, v11, 0);
      double v15 = [(MUPDFContentViewController *)self thumbnailViewHolder];
      char v16 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-0-[thumbnailView]-0@999-|" options:0 metrics:0 views:v14];
      [v15 addConstraints:v16];

      double v17 = [(MUPDFContentViewController *)self thumbnailView];
      double v18 = [v17 leadingAnchor];
      double v19 = [(MUPDFContentViewController *)self thumbnailViewHolder];
      v20 = [v19 leadingAnchor];
      uint64_t v21 = [v18 constraintEqualToAnchor:v20];
      [(MUPDFContentViewController *)self setThumbnailViewLeadingConstraint:v21];

      double v22 = [(MUPDFContentViewController *)self thumbnailView];
      double v23 = [v22 trailingAnchor];
      double v24 = [(MUPDFContentViewController *)self thumbnailViewHolder];
      double v25 = [v24 trailingAnchor];
      double v26 = [v23 constraintEqualToAnchor:v25];

      LODWORD(v27) = 1148829696;
      [v26 setPriority:v27];
      id v28 = [(MUPDFContentViewController *)self thumbnailViewHolder];
      v29 = [(MUPDFContentViewController *)self thumbnailViewLeadingConstraint];
      v36[0] = v29;
      v36[1] = v26;
      v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
      [v28 addConstraints:v30];

      [(MUPDFContentViewController *)self _updateThumbnailViewHolderConstraints];
      -[MUPDFContentViewController setEdgeInsets:](self, "setEdgeInsets:", self->_edgeInsets.top, self->_edgeInsets.left, self->_edgeInsets.bottom, self->_edgeInsets.right);

LABEL_20:
      [MEMORY[0x263F158F8] commit];
      if (v7 <= 0.0) {
        return;
      }
      goto LABEL_21;
    }
LABEL_17:
    [(MUPDFContentViewController *)self _updateThumbnailViewHolderConstraints];
    goto LABEL_20;
  }
  [MEMORY[0x263F158F8] commit];
LABEL_21:
  self->_showsThumbnailView = v3;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __52__MUPDFContentViewController_setShowsThumbnailView___block_invoke;
  v34[3] = &unk_2649C2FA8;
  BOOL v35 = v3;
  v34[4] = self;
  v34[5] = 0x3FC999999999999ALL;
  v31 = (void (**)(void))MEMORY[0x230F8ECA0](v34);
  v32 = [(MUPDFContentViewController *)self view];
  v33 = [v32 window];

  if (v33) {
    v31[2](v31);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], v31);
  }
}

uint64_t __52__MUPDFContentViewController_setShowsThumbnailView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCachedThumbnailViewInsetsDidChangeLeftOrRight];
  [*(id *)(a1 + 32) _updateThumbnailViewHolderConstraints];
  char v2 = *(unsigned char *)(a1 + 48);
  if (v2)
  {
    [*(id *)(a1 + 32) _updateThumbnailViewHolderVisibility];
    char v2 = *(unsigned char *)(a1 + 48);
  }
  double v3 = *(double *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__MUPDFContentViewController_setShowsThumbnailView___block_invoke_2;
  v7[3] = &unk_2649C2B18;
  uint64_t v8 = *(void *)(a1 + 32);
  char v9 = v2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__MUPDFContentViewController_setShowsThumbnailView___block_invoke_3;
  v5[3] = &unk_2649C2F80;
  char v6 = v2;
  v5[4] = v8;
  return [MEMORY[0x263F1CB60] animateWithDuration:v7 animations:v5 completion:v3];
}

void __52__MUPDFContentViewController_setShowsThumbnailView___block_invoke_2(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];

  if ([*(id *)(a1 + 32) fixedThumbnailView])
  {
    if (*(unsigned char *)(a1 + 40)) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.0;
    }
    id v4 = [*(id *)(a1 + 32) thumbnailViewHolder];
    [v4 setAlpha:v3];
  }
}

uint64_t __52__MUPDFContentViewController_setShowsThumbnailView___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _updateThumbnailViewHolderVisibility];
  }
  return result;
}

- (void)setNavigationModeHorizontal:(BOOL)a3
{
  if (self->_navigationModeHorizontal != a3)
  {
    self->_navigationModeHorizontal = a3;
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    [(MUPDFContentViewController *)self _updateThumbnailViewAppearance];
    [(MUPDFContentViewController *)self _updateThumbnailViewHolderConstraints];
    [(MUPDFContentViewController *)self _updatePDFViewDisplayMode];
    id v4 = (void *)MEMORY[0x263F158F8];
    [v4 commit];
  }
}

- (void)setForcesPDFViewTopAlignment:(BOOL)a3
{
  if (self->_forcesPDFViewTopAlignment != a3)
  {
    self->_forcesPDFViewTopAlignment = a3;
    id v4 = [(MUPDFContentViewController *)self pdfView];
    [v4 setForcesTopAlignment:self->_forcesPDFViewTopAlignment];
  }
}

- (void)_updatePDFViewDisplayMode
{
  double v3 = [(MUPDFContentViewController *)self pdfView];

  if (v3)
  {
    uint64_t v4 = [(MUPDFContentViewController *)self navigationModeHorizontal] ^ 1;
    id v5 = [(MUPDFContentViewController *)self pdfView];
    [v5 setDisplayMode:v4];

    id v6 = [(MUPDFContentViewController *)self pdfView];
    [v6 setDisplayBox:1];
  }
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  id v6 = a3;
  double v7 = [(MUPDFContentViewController *)self pdfView];
  id v8 = [v7 documentScrollView];

  if (v8 == v6
    && !a4
    && [(MUPDFContentViewController *)self _updateCachedThumbnailViewInsetsDidChangeLeftOrRight]&& [(MUPDFContentViewController *)self showsThumbnailView])
  {
    [(MUPDFContentViewController *)self _updateThumbnailViewHolderConstraints];
  }
}

- (double)_thumbnailViewWidth
{
  if (self->_thumbnailViewStyle != 1) {
    return 61.0;
  }
  double v3 = [MEMORY[0x263F1C668] defaultMetrics];
  uint64_t v4 = [(MUPDFContentViewController *)self traitCollection];
  [v3 scaledValueForValue:v4 compatibleWithTraitCollection:81.0];
  double v6 = v5;

  return (v6 + -81.0) * 0.5 + 81.0;
}

- (CGSize)_thumbnailViewCellSize
{
  if ([(MUPDFContentViewController *)self navigationModeHorizontal])
  {
    double v3 = 22.0;
    double v4 = 18.0;
  }
  else if (self->_thumbnailViewStyle == 1)
  {
    [(MUPDFContentViewController *)self _thumbnailViewWidth];
    double v6 = 47.0;
    if (v5 <= 47.0) {
      double v6 = v5;
    }
    double v4 = v5 + -12.0;
    if (v4 < v6) {
      double v4 = v6;
    }
    double v3 = v4;
  }
  else
  {
    double v4 = 31.0;
    double v3 = 41.0;
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (BOOL)_updateCachedThumbnailViewInsetsDidChangeLeftOrRight
{
  double v3 = [(MUPDFContentViewController *)self contentViewScrollView];
  BOOL v4 = self->_thumbnailViewStyle != 1;
  [(MUPDFContentViewController *)self _thumbnailViewWidth];
  objc_msgSend(v3, "_baseInsetsForAccessoryOnEdge:hasCustomClientInsets:accessorySize:additionalInsetFromEdge:", v4, 0);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(MUPDFContentViewController *)self cachedThumnailViewInsets];
  BOOL v16 = 0;
  if (v17 != v8 || v13 != v6 || v15 != v12 || v14 != v10)
  {
    [(MUPDFContentViewController *)self cachedThumnailViewInsets];
    BOOL v16 = 1;
    if (v21 == v12)
    {
      [(MUPDFContentViewController *)self cachedThumnailViewInsets];
      if (v22 == v8) {
        BOOL v16 = 0;
      }
    }
    -[MUPDFContentViewController setCachedThumnailViewInsets:](self, "setCachedThumnailViewInsets:", v6, v8, v10, v12);
  }

  return v16;
}

- (void)_updateThumbnailViewHolderBackgroundColor
{
  if (self->_thumbnailViewStyle == 1)
  {
    double v3 = [MEMORY[0x263F1C550] clearColor];
    BOOL v4 = [(MUPDFContentViewController *)self thumbnailViewHolder];
    [v4 setBackgroundColor:v3];

    double v5 = [(MUPDFContentViewController *)self scrollerBackgroundView];

    if (!v5)
    {
      double v6 = [MEMORY[0x263F1C480] effectWithStyle:8];
      double v7 = (void *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v6];
      [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
      double v8 = [(MUPDFContentViewController *)self thumbnailViewHolder];
      [v8 addSubview:v7];

      double v9 = _NSDictionaryOfVariableBindings(&cfstr_Backgroundview.isa, v7, 0);
      double v10 = [(MUPDFContentViewController *)self thumbnailViewHolder];
      double v11 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-0-[backgroundView]-0-|" options:0 metrics:0 views:v9];
      [v10 addConstraints:v11];

      double v12 = [(MUPDFContentViewController *)self thumbnailViewHolder];
      double v13 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-0-[backgroundView]-0-|" options:0 metrics:0 views:v9];
      [v12 addConstraints:v13];

      [(MUPDFContentViewController *)self setScrollerBackgroundView:v7];
    }
    BOOL v14 = !self->_showsThumbnailView;
    id v18 = [(MUPDFContentViewController *)self scrollerBackgroundView];
    [v18 setHidden:v14];
  }
  else
  {
    double v15 = [MEMORY[0x263F1C550] colorWithWhite:0.301960784 alpha:0.2];
    BOOL v16 = [(MUPDFContentViewController *)self thumbnailViewHolder];
    [v16 setBackgroundColor:v15];

    double v17 = [(MUPDFContentViewController *)self scrollerBackgroundView];
    [v17 removeFromSuperview];

    [(MUPDFContentViewController *)self setScrollerBackgroundView:0];
  }
}

- (void)_updateThumbnailViewHolderVisibility
{
  BOOL v3 = !self->_showsThumbnailView;
  BOOL v4 = [(MUPDFContentViewController *)self scrollerBackgroundView];
  [v4 setHidden:v3];

  id v5 = [(MUPDFContentViewController *)self thumbnailViewHolder];
  [v5 setHidden:v3];
}

- (void)removeThumbnailViewHolderConstraints
{
  BOOL v3 = [(MUPDFContentViewController *)self thumbnailViewHolderConstraints];

  if (v3)
  {
    BOOL v4 = [(MUPDFContentViewController *)self view];
    id v5 = [(MUPDFContentViewController *)self thumbnailViewHolderConstraints];
    [v4 removeConstraints:v5];

    [(MUPDFContentViewController *)self setThumbnailViewHolderWidthConstraint:0];
    [(MUPDFContentViewController *)self setThumbnailViewHolderConstraints:0];
    [(MUPDFContentViewController *)self setThumbnailViewHolderRevealConstraint:0];
  }
}

- (void)_updateThumbnailViewHolderConstraints
{
  v64[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [(MUPDFContentViewController *)self thumbnailViewHolder];

  if (v3)
  {
    BOOL v4 = [(MUPDFContentViewController *)self thumbnailViewHolderConstraints];
    if (v4)
    {
      BOOL v5 = [(MUPDFContentViewController *)self navigationModeHorizontal];
      char v6 = v5 ^ [(MUPDFContentViewController *)self constraintsAreHorizontal];
    }
    else
    {
      char v6 = 1;
    }

    int64_t thumbnailViewStyle = self->_thumbnailViewStyle;
    if (thumbnailViewStyle == 1)
    {
      double v12 = [(MUPDFContentViewController *)self view];
      [v12 safeAreaInsets];
      double v9 = v13;
      double v11 = v14;
    }
    else
    {
      [(MUPDFContentViewController *)self cachedThumnailViewInsets];
      double v9 = v8;
      double v11 = v10;
    }
    double v15 = [(MUPDFContentViewController *)self thumbnailViewHolder];
    if ([v15 effectiveUserInterfaceLayoutDirection]) {
      double v9 = v11;
    }

    if ([(MUPDFContentViewController *)self navigationModeHorizontal])
    {
      double v16 = 40.0;
    }
    else
    {
      [(MUPDFContentViewController *)self _thumbnailViewWidth];
      double v16 = v17;
    }
    BOOL v18 = [(MUPDFContentViewController *)self navigationModeHorizontal];
    int v19 = thumbnailViewStyle != 1 || v18;
    double v20 = -0.0;
    if (!v19) {
      double v20 = v9;
    }
    double v21 = v16 + v20;
    if ([(MUPDFContentViewController *)self showsThumbnailView]) {
      double v22 = 1.0;
    }
    else {
      double v22 = v21 + 1.0;
    }
    if ([(MUPDFContentViewController *)self showsThumbnailView])
    {
      BOOL v23 = [(MUPDFContentViewController *)self navigationModeHorizontal];
      double v24 = 0.0;
      if (thumbnailViewStyle != 1) {
        double v24 = v11;
      }
      double v25 = v22 - v24;
      if (!v23) {
        double v22 = v25;
      }
    }
    if (v6)
    {
      [(MUPDFContentViewController *)self removeThumbnailViewHolderConstraints];
      double v26 = objc_opt_new();
      [(MUPDFContentViewController *)self setThumbnailViewHolderConstraints:v26];
      double v27 = [(MUPDFContentViewController *)self view];
      id v28 = [(MUPDFContentViewController *)self thumbnailViewHolder];
      v29 = _NSDictionaryOfVariableBindings(&cfstr_Holderview.isa, v28, 0);
      v63[0] = @"WIDTH";
      v30 = [NSNumber numberWithDouble:v21];
      v63[1] = @"OFFSET";
      v64[0] = v30;
      if (thumbnailViewStyle == 1) {
        double v31 = -v22;
      }
      else {
        double v31 = v22;
      }
      v32 = [NSNumber numberWithDouble:v31];
      v64[1] = v32;
      v33 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];

      unint64_t v34 = 0x263F08000uLL;
      if ([(MUPDFContentViewController *)self navigationModeHorizontal])
      {
        BOOL v35 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[holderView(WIDTH)]" options:0 metrics:v33 views:v29];
        [v26 addObjectsFromArray:v35];

        v36 = [MEMORY[0x263F08938] constraintWithItem:v28 attribute:4 relatedBy:0 toItem:v27 attribute:4 multiplier:1.0 constant:v22];
        [(MUPDFContentViewController *)self setThumbnailViewHolderRevealConstraint:v36];

        v37 = @"H:|-(-1)-[holderView]-(-1)-|";
      }
      else
      {
        v41 = [v28 widthAnchor];
        v42 = [v41 constraintEqualToConstant:v21];
        [(MUPDFContentViewController *)self setThumbnailViewHolderWidthConstraint:v42];

        v43 = [(MUPDFContentViewController *)self thumbnailViewHolderWidthConstraint];
        [v26 addObject:v43];

        if (thumbnailViewStyle == 1)
        {
          v45 = [(MUPDFContentViewController *)self thumbnailViewLeadingConstraint];
          [v45 setConstant:v9];

          BOOL v46 = [(MUPDFContentViewController *)self fixedThumbnailView];
          v47 = [(MUPDFContentViewController *)self pdfViewLeadingConstraint];
          v48 = v47;
          if (v46)
          {
            [v47 setActive:0];

            v49 = [v28 leadingAnchor];
            [v27 leadingAnchor];
            v50 = id v62 = v27;
            v44 = [v49 constraintEqualToAnchor:v50];

            v51 = [v28 trailingAnchor];
            v52 = [(MUPDFContentViewController *)self pdfView];
            v53 = [v52 leadingAnchor];
            v54 = [v51 constraintEqualToAnchor:v53];

            unint64_t v34 = 0x263F08000;
            double v27 = v62;

            [v26 addObject:v44];
            [v26 addObject:v54];
          }
          else
          {
            [v47 setActive:1];

            v44 = [v28 leadingAnchor];
            v54 = [v27 leadingAnchor];
            v55 = [v44 constraintEqualToAnchor:v54 constant:-v22];
            [(MUPDFContentViewController *)self setThumbnailViewHolderRevealConstraint:v55];
          }
        }
        else
        {
          v44 = [MEMORY[0x263F08938] constraintWithItem:v28 attribute:2 relatedBy:0 toItem:v27 attribute:2 multiplier:1.0 constant:v22];
          [(MUPDFContentViewController *)self setThumbnailViewHolderRevealConstraint:v44];
        }

        v56 = [(MUPDFContentViewController *)self thumbnailViewHolderRevealConstraint];

        v37 = @"V:|-(-1)-[holderView]-(-1)-|";
        if (!v56) {
          goto LABEL_47;
        }
      }
      v57 = [(MUPDFContentViewController *)self thumbnailViewHolderRevealConstraint];
      [v26 addObject:v57];

LABEL_47:
      v58 = [*(id *)(v34 + 2360) constraintsWithVisualFormat:v37 options:0 metrics:v33 views:v29];
      [v26 addObjectsFromArray:v58];

      [(MUPDFContentViewController *)self setConstraintsAreHorizontal:[(MUPDFContentViewController *)self navigationModeHorizontal]];
      v59 = [(MUPDFContentViewController *)self view];
      [v59 addConstraints:v26];

      v60 = [(MUPDFContentViewController *)self view];
      [v60 setNeedsLayout];

      return;
    }
    if (thumbnailViewStyle == 1) {
      double v22 = -v22;
    }
    v38 = [(MUPDFContentViewController *)self thumbnailViewHolderRevealConstraint];
    [v38 setConstant:v22];

    BOOL v39 = [(MUPDFContentViewController *)self navigationModeHorizontal];
    if (thumbnailViewStyle == 1 && !v39)
    {
      v40 = [(MUPDFContentViewController *)self thumbnailViewHolderWidthConstraint];
      [v40 setConstant:v21];

      id v61 = [(MUPDFContentViewController *)self thumbnailViewLeadingConstraint];
      [v61 setConstant:v9];
    }
  }
}

- (void)_updateThumbnailViewAppearance
{
  BOOL v3 = [(MUPDFContentViewController *)self thumbnailView];
  if (v3)
  {
    id v16 = v3;
    if ([(MUPDFContentViewController *)self navigationModeHorizontal])
    {
      BOOL v4 = [MEMORY[0x263F1C550] whiteColor];
      [v16 setBackgroundColor:v4];

      id v5 = [MEMORY[0x263F1C550] colorWithWhite:0.274509804 alpha:1.0];
      uint64_t v6 = [v5 CGColor];
      double v7 = [v16 layer];
      [v7 setBorderColor:v6];

      double v8 = [MEMORY[0x263F1C920] mainScreen];
      [v8 nativeScale];
      double v10 = 1.0 / v9;
      double v11 = [v16 layer];
      [v11 setBorderWidth:v10];

      uint64_t v12 = 1;
    }
    else
    {
      [v16 setBackgroundColor:0];
      id v13 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.0];
      uint64_t v14 = [v13 CGColor];
      double v15 = [v16 layer];
      [v15 setBorderColor:v14];

      double v8 = [v16 layer];
      [v8 setBorderWidth:0.0];
      uint64_t v12 = 0;
    }

    [v16 setLayoutMode:v12];
    [(MUPDFContentViewController *)self _thumbnailViewCellSize];
    objc_msgSend(v16, "setThumbnailSize:");
    BOOL v3 = v16;
  }
}

- (NSString)documentUnlockedWithPassword
{
  BOOL v3 = [(MUPDFContentViewController *)self pdfDocument];
  int v4 = [v3 isEncrypted];

  if (v4)
  {
    id v5 = [(MUPDFContentViewController *)self pdfDocument];
    uint64_t v6 = [v5 passwordUsedForUnlocking];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (NSString *)v6;
}

- (void)_createPDFView
{
  [(MUPDFContentViewController *)self _teardownPDFViewIfNecessary];
  firstValue = -[MUPDFView initWithFrame:]([MUPDFView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  [(MUPDFView *)firstValue setForcesTopAlignment:[(MUPDFContentViewController *)self forcesPDFViewTopAlignment]];
  [(MUPDFContentViewController *)self setPdfView:firstValue];
  [(MUPDFView *)firstValue setDelegate:self];
  BOOL v3 = [(MUPDFContentViewController *)self view];
  [v3 addSubview:firstValue];

  [(MUPDFView *)firstValue setTranslatesAutoresizingMaskIntoConstraints:0];
  int v4 = [(MUPDFView *)firstValue leadingAnchor];
  id v5 = [(MUPDFContentViewController *)self view];
  uint64_t v6 = [v5 leadingAnchor];
  double v7 = [v4 constraintEqualToAnchor:v6];

  double v8 = [(MUPDFView *)firstValue trailingAnchor];
  double v9 = [(MUPDFContentViewController *)self view];
  double v10 = [v9 trailingAnchor];
  double v11 = [v8 constraintEqualToAnchor:v10];

  LODWORD(v12) = 1148829696;
  [v11 setPriority:v12];
  id v13 = [(MUPDFContentViewController *)self view];
  [v13 addConstraint:v7];

  uint64_t v14 = [(MUPDFContentViewController *)self view];
  [v14 addConstraint:v11];

  [(MUPDFContentViewController *)self setPdfViewLeadingConstraint:v7];
  double v15 = _NSDictionaryOfVariableBindings(&cfstr_Pdfview.isa, firstValue, 0);
  id v16 = [(MUPDFContentViewController *)self view];
  double v17 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-0-[pdfView]-0@999-|" options:0 metrics:0 views:v15];
  [v16 addConstraints:v17];

  [(MUPDFContentViewController *)self _updatePDFViewDisplayMode];
  id v18 = objc_alloc(MEMORY[0x263F1CB60]);
  double v19 = *MEMORY[0x263F001A8];
  double v20 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v21 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v22 = *(double *)(MEMORY[0x263F001A8] + 24);
  BOOL v23 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x263F001A8], v20, v21, v22);
  double v24 = [MEMORY[0x263F1C550] colorWithWhite:0.301960784 alpha:0.2];
  [v23 setBackgroundColor:v24];

  [(MUPDFContentViewController *)self setThumbnailViewHolder:v23];
  double v25 = [(MUPDFContentViewController *)self view];
  [v25 insertSubview:v23 above:firstValue];

  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v26 = [(MUPDFContentViewController *)self pdfDocument];
  int v27 = [v26 isLocked];

  if (v27)
  {
    id v28 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v29 = *MEMORY[0x263F14868];
    v30 = [(MUPDFContentViewController *)self pdfDocument];
    [v28 addObserver:self selector:sel_pdfDocumentDidUnlock_ name:v29 object:v30];
  }
  double v31 = [(MUPDFContentViewController *)self pdfDocument];
  [(MUPDFView *)firstValue setDocument:v31 waitDuration:0.25];

  [(MUPDFView *)firstValue setAutoScales:1];
  BOOL v32 = [(MUPDFContentViewController *)self navigationModeHorizontal];
  BOOL v33 = [(MUPDFContentViewController *)self showsThumbnailView];
  self->_navigationModeHorizontal = !v32;
  self->_showsThumbnailView = !v33;
  [(MUPDFContentViewController *)self setNavigationModeHorizontal:v32];
  [(MUPDFContentViewController *)self setShowsThumbnailView:v33];
  if (v33)
  {
    unint64_t v34 = [(MUPDFContentViewController *)self thumbnailView];
    [v34 setPDFView:firstValue];
  }
  BOOL v35 = [(MUPDFView *)firstValue documentScrollView];
  [v35 setDecelerationRate:*MEMORY[0x263F1D5D0]];
  [v35 setMaximumZoomScale:10.0];
  [v35 setMinimumZoomScale:0.1];
  [v35 _addBoundingPathChangeObserver:self];
  v36 = [MEMORY[0x263F08A00] defaultCenter];
  [v36 addObserver:self selector:sel__userChangedScrollViewMagnificationNotification_ name:@"UITextSelectionDidZoom" object:v35];

  v37 = [MEMORY[0x263F08A00] defaultCenter];
  [v37 addObserver:self selector:sel_pdfViewDidChangeCurrentPage_ name:*MEMORY[0x263F148D0] object:firstValue];

  v38 = [MEMORY[0x263F08A00] defaultCenter];
  [v38 addObserver:self selector:sel_pdfScrollViewWillBeginDragging_ name:*MEMORY[0x263F148B0] object:0];

  if (self->_pageLabelView
    || (BOOL v39 = -[MUPDFPageLabelView initWithFrame:]([MUPDFPageLabelView alloc], "initWithFrame:", v19, v20, v21, v22), pageLabelView = self->_pageLabelView, self->_pageLabelView = v39, pageLabelView, [(MUPDFPageLabelView *)self->_pageLabelView setTranslatesAutoresizingMaskIntoConstraints:0], self->_pageLabelView))
  {
    if (!self->_pageLabelViewTapGestureRecognizer)
    {
      v41 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_pageLabelViewTapped_];
      pageLabelViewTapGestureRecognizer = self->_pageLabelViewTapGestureRecognizer;
      self->_pageLabelViewTapGestureRecognizer = v41;

      [(MUPDFPageLabelView *)self->_pageLabelView addGestureRecognizer:self->_pageLabelViewTapGestureRecognizer];
    }
  }
  if (!self->_edgePanGestureRecognizer)
  {
    v43 = [(MUPDFContentViewController *)self pdfView];
    uint64_t v44 = [v43 effectiveUserInterfaceLayoutDirection];

    v45 = (UIScreenEdgePanGestureRecognizer *)[objc_alloc(MEMORY[0x263F1C928]) initWithTarget:self action:sel_edgeSwipeGestureRecognized_];
    edgePanGestureRecognizer = self->_edgePanGestureRecognizer;
    self->_edgePanGestureRecognizer = v45;

    if (v44 == 1) {
      uint64_t v47 = 8;
    }
    else {
      uint64_t v47 = 2;
    }
    [(UIScreenEdgePanGestureRecognizer *)self->_edgePanGestureRecognizer setEdges:v47];
    v48 = [(MUPDFContentViewController *)self pdfView];
    [v48 addGestureRecognizer:self->_edgePanGestureRecognizer];
  }
  v49 = [(MUPDFContentViewController *)self pdfDocument];
  v50 = [v49 akController];
  [(MUContentViewController *)self setAnnotationController:v50];
}

- (void)_teardownPDFViewIfNecessary
{
  BOOL v3 = [(MUPDFContentViewController *)self pdfView];

  if (v3)
  {
    id v13 = [(MUPDFContentViewController *)self pdfView];
    int v4 = [v13 documentScrollView];
    [v4 _removeBoundingPathChangeObserver:self];
    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 removeObserver:self name:@"UITextSelectionDidZoom" object:v4];

    uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 removeObserver:self name:*MEMORY[0x263F148D0] object:v13];

    double v7 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v8 = *MEMORY[0x263F14868];
    double v9 = [(MUPDFContentViewController *)self pdfDocument];
    [v7 removeObserver:self name:v8 object:v9];

    [(MUPDFContentViewController *)self removeThumbnailViewHolderConstraints];
    double v10 = [(MUPDFContentViewController *)self thumbnailView];
    [v10 setPDFView:0];

    double v11 = [(MUPDFContentViewController *)self thumbnailView];
    [v11 removeFromSuperview];

    [(MUPDFContentViewController *)self setThumbnailView:0];
    double v12 = [(MUPDFContentViewController *)self thumbnailViewHolder];
    [v12 removeFromSuperview];

    [(MUPDFContentViewController *)self setThumbnailViewHolder:0];
    [(PDFDocument *)self->_pdfDocument setDelegate:0];
    [(PDFDocument *)self->_pdfDocument setPDFAKControllerDelegate:0];
    [v13 setDelegate:0];
    [v13 removeFromSuperview];
    [v13 setDocument:0];
    [(MUPDFContentViewController *)self setPdfView:0];
  }
}

- (void)pdfViewDidChangeCurrentPage:(id)a3
{
  id v4 = a3;
  id v11 = [(MUPDFContentViewController *)self pdfView];
  id v5 = [v4 object];

  uint64_t v6 = v11;
  if (v5 == v11)
  {
    double v7 = [v11 document];
    uint64_t v8 = [v11 currentPage];
    double v9 = (void *)v8;
    if (v7)
    {
      if (v8)
      {
        uint64_t v10 = [v7 indexForPage:v8];
        if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
          [(MUPDFContentViewController *)self _updatePageNumberOverlayToPage:v10 animate:1];
        }
      }
    }

    uint64_t v6 = v11;
  }
}

- (void)pdfScrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = [(MUPDFContentViewController *)self view];
  id v7 = [v5 window];

  uint64_t v6 = [v4 object];

  if ((!v7 || [v6 isDescendantOfView:v7])
    && self->_shouldShowThumbnailView
    && [(MUPDFContentViewController *)self thumbnailViewStyle] == 1)
  {
    self->_shouldShowThumbnailView = 0;
    [(MUPDFContentViewController *)self _updateThumbnailView];
  }
}

- (void)pdfDocumentDidUnlock:(id)a3
{
  id v4 = [a3 object];
  id v5 = [(MUPDFContentViewController *)self pdfDocument];

  if (v4 == v5)
  {
    BOOL v7 = [(MUPDFContentViewController *)self navigationModeHorizontal];
    BOOL v8 = [(MUPDFContentViewController *)self showsThumbnailView];
    self->_navigationModeHorizontal = !v7;
    self->_showsThumbnailView = !v8;
    [(MUPDFContentViewController *)self setNavigationModeHorizontal:v7];
    [(MUPDFContentViewController *)self setShowsThumbnailView:v8];
    double v9 = [(MUContentViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v9 contentControllerDidUnlockDocument:self];
    }
    uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v11 = *MEMORY[0x263F14868];
    double v12 = [(MUPDFContentViewController *)self pdfDocument];
    [v10 removeObserver:self name:v11 object:v12];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__MUPDFContentViewController_pdfDocumentDidUnlock___block_invoke;
    block[3] = &unk_2649C2828;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    uint64_t v6 = [(MUPDFContentViewController *)self pdfDocument];
    NSLog(&cfstr_SNotificationD.isa, "-[MUPDFContentViewController pdfDocumentDidUnlock:]", v4, v6);
  }
}

uint64_t __51__MUPDFContentViewController_pdfDocumentDidUnlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateThumbnailView];
}

- (void)_updateThumbnailView
{
  id v2 = [(MUContentViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 updateThumbnailView];
  }
}

- (void)pageLabelViewTapped:(id)a3
{
  if ([(MUPDFContentViewController *)self thumbnailViewStyle] == 1)
  {
    self->_shouldShowThumbnailView ^= 1u;
    [(MUPDFContentViewController *)self _updateThumbnailView];
    pageLabelView = self->_pageLabelView;
    [(MUPDFPageLabelView *)pageLabelView resetFadeOutTimer];
  }
}

- (void)edgeSwipeGestureRecognized:(id)a3
{
  if ([(MUPDFContentViewController *)self thumbnailViewStyle] == 1
    && !self->_shouldShowThumbnailView)
  {
    self->_shouldShowThumbnailView = 1;
    [(MUPDFContentViewController *)self _updateThumbnailView];
  }
}

- (void)_removePageLabelViewConstraints
{
  BOOL v3 = self->pageLabelViewTopConstraint;
  BOOL v8 = v3;
  if (v3)
  {
    [(NSLayoutConstraint *)v3 setActive:0];
    pageLabelViewTopConstraint = self->pageLabelViewTopConstraint;
    self->pageLabelViewTopConstraint = 0;

    BOOL v3 = v8;
  }
  pageLabelViewSideConstraint = self->pageLabelViewSideConstraint;
  if (pageLabelViewSideConstraint)
  {
    uint64_t v6 = pageLabelViewSideConstraint;
    [(NSLayoutConstraint *)v6 setActive:0];
    BOOL v7 = self->pageLabelViewSideConstraint;
    self->pageLabelViewSideConstraint = 0;

    BOOL v3 = v8;
  }
}

- (void)_updatePageNumberOverlayToPage:(unint64_t)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(MUPDFContentViewController *)self canShowPageViewLabel])
  {
    BOOL v7 = NSString;
    BOOL v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v9 = [v8 localizedStringForKey:@"%lu of %lu" value:&stru_26E1811C8 table:@"MUPDFContentViewController"];
    uint64_t v10 = [(MUPDFContentViewController *)self pdfDocument];
    uint64_t v11 = objc_msgSend(v7, "stringWithFormat:", v9, a3 + 1, objc_msgSend(v10, "pageCount"));

    double v12 = [(MUPDFContentViewController *)self pdfView];
    id v13 = self->_pageLabelView;
    uint64_t v14 = [(MUPDFPageLabelView *)v13 superview];

    if (!v14) {
      [(MUPDFContentViewController *)self _removePageLabelViewConstraints];
    }
    [(MUPDFPageLabelView *)v13 showNowInSuperView:v12 withText:v11];
    [(MUPDFContentViewController *)self _updateThumbnailViewHolderConstraints];
    uint64_t v15 = [(MUPDFContentViewController *)self thumbnailViewHolder];
    id v16 = (void *)v15;
    if (self->pageLabelViewTopConstraint || !v15)
    {
      [(MUPDFContentViewController *)self edgeInsets];
      [(NSLayoutConstraint *)self->pageLabelViewTopConstraint setConstant:v23 + 20.0];
    }
    else
    {
      double v17 = [(MUPDFPageLabelView *)v13 topAnchor];
      id v18 = [v16 topAnchor];
      [(MUPDFContentViewController *)self edgeInsets];
      double v20 = [v17 constraintEqualToAnchor:v18 constant:v19 + 20.0];
      pageLabelViewTopConstraint = self->pageLabelViewTopConstraint;
      self->pageLabelViewTopConstraint = v20;

      [(NSLayoutConstraint *)self->pageLabelViewTopConstraint setActive:1];
      double v22 = [(MUPDFContentViewController *)self view];
      [v22 setNeedsUpdateConstraints];
    }
    pageLabelViewSideConstraint = self->pageLabelViewSideConstraint;
    if (pageLabelViewSideConstraint)
    {
      [(NSLayoutConstraint *)pageLabelViewSideConstraint setConstant:20.0];
      if (v4)
      {
LABEL_10:
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __69__MUPDFContentViewController__updatePageNumberOverlayToPage_animate___block_invoke;
        v33[3] = &unk_2649C2828;
        v33[4] = self;
        [MEMORY[0x263F1CB60] animateWithDuration:v33 animations:0.3];
LABEL_16:

        return;
      }
    }
    else
    {
      int64_t thumbnailViewStyle = self->_thumbnailViewStyle;
      double v26 = [(MUPDFPageLabelView *)v13 leadingAnchor];
      if (thumbnailViewStyle == 1)
      {
        int v27 = [v16 trailingAnchor];
        id v28 = [v26 constraintEqualToAnchor:v27 constant:20.0];
        uint64_t v29 = self->pageLabelViewSideConstraint;
        self->pageLabelViewSideConstraint = v28;
      }
      else
      {
        int v27 = [(MUPDFContentViewController *)self view];
        uint64_t v29 = [v27 leadingAnchor];
        v30 = [v26 constraintEqualToAnchor:v29 constant:20.0];
        double v31 = self->pageLabelViewSideConstraint;
        self->pageLabelViewSideConstraint = v30;
      }
      [(NSLayoutConstraint *)self->pageLabelViewSideConstraint setActive:1];
      if (v4) {
        goto LABEL_10;
      }
    }
    BOOL v32 = [(MUPDFContentViewController *)self view];
    [v32 updateConstraints];

    goto LABEL_16;
  }
}

void __69__MUPDFContentViewController__updatePageNumberOverlayToPage_animate___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 updateConstraints];
}

- (UIView)pageLabelView
{
  return 0;
}

- (BOOL)canEditContent
{
  id v2 = [(MUPDFContentViewController *)self pdfDocument];
  BOOL v3 = v2;
  if (v2)
  {
    int v4 = [v2 allowsDocumentAssembly];
    int v5 = [v3 allowsDocumentChanges];
    int v6 = v5 & ([v3 isLocked] ^ 1);
    if (v4) {
      BOOL v7 = v6;
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)acceptSingleTouch:(id)a3
{
  id v4 = a3;
  int v5 = [(MUPDFContentViewController *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  if (-[MUPDFContentViewController _pageLabelExistAtPoint:](self, "_pageLabelExistAtPoint:", v7, v9)
    || -[MUPDFContentViewController _thumbnailViewExistAtPoint:](self, "_thumbnailViewExistAtPoint:", v7, v9))
  {
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v11 = [(MUPDFContentViewController *)self pdfView];
    double v12 = v11;
    BOOL v10 = v11 && ([v11 shouldAcceptTouch:v4 ofGestureRecognizer:0] & 1) != 0;
  }
  return v10;
}

- (BOOL)_pageLabelExistAtPoint:(CGPoint)a3
{
  pageLabelView = self->_pageLabelView;
  if (!pageLabelView) {
    return 0;
  }
  double y = a3.y;
  double x = a3.x;
  double v7 = pageLabelView;
  double v8 = [(MUPDFContentViewController *)self view];
  double v9 = [(MUPDFPageLabelView *)v7 superview];
  objc_msgSend(v8, "convertPoint:toView:", v9, x, y);
  uint64_t v11 = v10;
  uint64_t v13 = v12;

  [(MUPDFPageLabelView *)v7 frame];
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;

  uint64_t v22 = v15;
  uint64_t v23 = v17;
  uint64_t v24 = v19;
  uint64_t v25 = v21;
  uint64_t v26 = v11;
  uint64_t v27 = v13;
  return CGRectContainsPoint(*(CGRect *)&v22, *(CGPoint *)&v26);
}

- (BOOL)_thumbnailViewExistAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  int v5 = [(MUPDFContentViewController *)self thumbnailView];
  double v6 = v5;
  if (v5)
  {
    [v5 frame];
    v9.CGFloat x = x;
    v9.CGFloat y = y;
    BOOL v7 = CGRectContainsPoint(v10, v9);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (int64_t)thumbnailViewStyle
{
  return self->_thumbnailViewStyle;
}

- (void)setThumbnailViewStyle:(int64_t)a3
{
  if (self->_thumbnailViewStyle != a3)
  {
    self->_int64_t thumbnailViewStyle = a3;
    int v5 = [MEMORY[0x263F1C550] clearColor];
    double v6 = [(MUPDFContentViewController *)self thumbnailViewHolder];
    [v6 setBackgroundColor:v5];

    [(MUPDFContentViewController *)self removeThumbnailViewHolderConstraints];
    [(MUPDFContentViewController *)self _updateThumbnailViewHolderBackgroundColor];
    [(MUPDFContentViewController *)self _removePageLabelViewConstraints];
    if (a3 == 1)
    {
      [(MUPDFContentViewController *)self _updateThumbnailViewHolderConstraints];
      BOOL v7 = [(MUPDFContentViewController *)self thumbnailViewHolder];
      double v8 = [v7 superview];
      CGPoint v9 = [(MUPDFContentViewController *)self thumbnailViewHolderRevealConstraint];
      CGRect v10 = [v9 secondItem];

      if (v8 == v10)
      {
        uint64_t v11 = [(MUPDFContentViewController *)self thumbnailViewHolder];
        [v11 frame];
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;

        uint64_t v18 = [(MUPDFContentViewController *)self thumbnailViewHolder];
        uint64_t v19 = [v18 effectiveUserInterfaceLayoutDirection];

        if (v19)
        {
          uint64_t v20 = [(MUPDFContentViewController *)self thumbnailViewHolder];
          uint64_t v21 = [v20 superview];
          [v21 bounds];
          double v23 = v22;
          uint64_t v24 = [(MUPDFContentViewController *)self thumbnailViewHolderRevealConstraint];
          [v24 constant];
          double v26 = v23 - v25;
        }
        else
        {
          uint64_t v20 = [(MUPDFContentViewController *)self thumbnailViewHolderRevealConstraint];
          [v20 constant];
          double v26 = v27;
        }

        id v28 = [(MUPDFContentViewController *)self thumbnailViewHolder];
        objc_msgSend(v28, "setFrame:", v26, v13, v15, v17);
      }
    }
  }
}

- (BOOL)isTouchInThumbnailView:(id)a3
{
  id v4 = a3;
  int v5 = [(MUPDFContentViewController *)self thumbnailView];
  double v6 = v5;
  if (v5)
  {
    [v5 bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [v4 locationInView:v6];
    v19.CGFloat x = v15;
    v19.CGFloat y = v16;
    v20.origin.CGFloat x = v8;
    v20.origin.CGFloat y = v10;
    v20.size.width = v12;
    v20.size.height = v14;
    BOOL v17 = CGRectContainsPoint(v20, v19);
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (CGRect)visibleContentRect
{
  BOOL v3 = [(MUPDFContentViewController *)self view];
  id v4 = [v3 window];
  [(MUPDFContentViewController *)self visibleContentRectInCoordinateSpace:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)visibleContentRectInCoordinateSpace:(id)a3
{
  id v4 = a3;
  double v5 = [(MUContentViewController *)self annotationController];
  double v6 = [(MUPDFContentViewController *)self pdfView];
  [v6 bounds];
  objc_msgSend(v6, "convertRect:toCoordinateSpace:", v4);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [(MUPDFContentViewController *)self pdfDocument];
  char v16 = [v15 isLocked];

  if ((v16 & 1) == 0)
  {
    BOOL v17 = objc_msgSend(v6, "pageViewForPageAtIndex:", objc_msgSend(v5, "currentPageIndex"));
    uint64_t v18 = v17;
    if (v17)
    {
      [v17 bounds];
      objc_msgSend(v18, "convertRect:toCoordinateSpace:", v4);
      double v8 = v19;
      double v10 = v20;
      double v12 = v21;
      double v14 = v22;
    }
  }
  double v23 = v8;
  double v24 = v10;
  double v25 = v12;
  double v26 = v14;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (id)contentSnapshot
{
  BOOL v3 = [(MUContentViewController *)self annotationController];
  id v4 = [(MUPDFContentViewController *)self pdfDocument];
  char v5 = [v4 isLocked];

  if (v5)
  {
    double v6 = [(MUPDFContentViewController *)self pdfView];
  }
  else
  {
    uint64_t v7 = [v3 currentPageIndex];
    double v8 = [(MUPDFContentViewController *)self pdfView];
    double v6 = [v8 pageViewForPageAtIndex:v7];

    if ([v3 isOverlayViewLoadedAtIndex:v7])
    {
      double v9 = [v3 overlayViewAtIndex:v7];
      goto LABEL_6;
    }
  }
  double v9 = 0;
LABEL_6:
  double v10 = [v6 snapshotViewAfterScreenUpdates:1];
  if (v9)
  {
    double v11 = [v9 snapshotViewAfterScreenUpdates:1];
    [v11 setAutoresizingMask:18];
    [v10 addSubview:v11];
  }
  return v10;
}

- (void)highlight:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F1C488]);
  [v5 setTag:764050];
  id v4 = [(MUContentViewController *)self annotationController];
  [v4 performActionForSender:v5];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F1C7B0] sharedMenuController];
  if ((id)v7 == v6)
  {
  }
  else
  {
    double v8 = (void *)v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      unsigned __int8 v10 = -[MUPDFContentViewController canPerformAction:withSender:](&v15, sel_canPerformAction_withSender_, a3, v6, self, MUPDFContentViewController, v16.receiver, v16.super_class);
      goto LABEL_7;
    }
  }
  if (sel_highlight_ == a3)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F1C488]);
    [v12 setTag:764050];
    double v13 = [(MUContentViewController *)self annotationController];
    unsigned __int8 v11 = [v13 validateSender:v12];

    goto LABEL_9;
  }
  unsigned __int8 v10 = -[MUPDFContentViewController canPerformAction:withSender:](&v16, sel_canPerformAction_withSender_, a3, v6, v15.receiver, v15.super_class, self, MUPDFContentViewController);
LABEL_7:
  unsigned __int8 v11 = v10;
LABEL_9:

  return v11;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(MUPDFContentViewController *)self setViewIsTransitioningBetweenSizes:1];
  [(MUPDFContentViewController *)self _prepareToRotate];
  v9[4] = self;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__MUPDFContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_2649C2FD0;
  v10[4] = self;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__MUPDFContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v9[3] = &unk_2649C2FD0;
  [v7 animateAlongsideTransition:v10 completion:v9];
  v8.receiver = self;
  v8.super_class = (Class)MUPDFContentViewController;
  -[MUPDFContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

uint64_t __81__MUPDFContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _recoverFromRotation];
}

uint64_t __81__MUPDFContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setViewIsTransitioningBetweenSizes:0];
}

- (void)_prepareToRotate
{
  id v2 = [(MUPDFContentViewController *)self pdfView];
  [v2 beginPDFViewRotation];
}

- (void)_recoverFromRotation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  BOOL v3 = [(MUPDFContentViewController *)self pdfView];
  [v3 endPDFViewRotation];
  id v4 = [(MUPDFContentViewController *)self pdfView];
  id v5 = [v4 visiblePages];

  id v6 = [(MUPDFContentViewController *)self pdfDocument];
  char v7 = [v6 isLocked];

  if ((v7 & 1) == 0)
  {
    objc_super v8 = [(MUContentViewController *)self annotationController];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
          objc_super v15 = [(MUPDFContentViewController *)self pdfDocument];
          uint64_t v16 = [v15 indexForPage:v14];

          [v8 updateOverlayViewAtIndex:v16];
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
  objc_msgSend(MEMORY[0x263F158F8], "commit", (void)v17);
}

- (CGSize)_medianSizeForCurrentDocumentInPDFViewWithGetter:(id)a3
{
  v20[64] = *MEMORY[0x263EF8340];
  id v4 = (double (**)(id, void *))a3;
  id v5 = [(MUPDFContentViewController *)self pdfView];
  id v6 = [v5 document];
  char v7 = v6;
  double v8 = 792.0;
  double v9 = 612.0;
  if (v5 && v6 && [v6 pageCount])
  {
    unint64_t v10 = [v7 pageCount];
    if (v10 >= 2) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = v10;
    }
    if (v11)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        uint64_t v13 = [v7 pageAtIndex:i];
        double v14 = v4[2](v4, v13);
        uint64_t v16 = v15;

        *(double *)&v20[i] = v14;
        v19[i] = v16;
      }
    }
    double v9 = akMedian((uint64_t)v20, v11);
    double v8 = akMedian((uint64_t)v19, v11);
  }

  double v17 = v9;
  double v18 = v8;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void)_updateMinMaxZoomFactor
{
  id v4 = [(MUPDFContentViewController *)self pdfView];
  id v2 = [v4 documentScrollView];
  [v2 setMinimumZoomScale:0.1];
  [v4 autoScaleFactor];
  objc_msgSend(v2, "setMinimumZoomScale:", fmin(v3, 10.0));
  [v2 setMaximumZoomScale:10.0];
}

- (void)_userChangedScrollViewMagnificationNotification:(id)a3
{
  id v4 = a3;
  uint64_t v13 = [(MUPDFContentViewController *)self pdfView];
  id v5 = [v4 object];

  id v6 = [v13 documentScrollView];

  double v8 = v13;
  if (v5 == v6)
  {
    [v13 scaleFactor];
    double v10 = v9;
    [v13 autoScaleFactor];
    double v12 = v11 + 0.005;
    uint64_t v7 = [v13 autoScales];
    if (v10 >= v12)
    {
      double v8 = v13;
      if (!v7) {
        goto LABEL_7;
      }
    }
    else
    {
      double v8 = v13;
      if (v7) {
        goto LABEL_7;
      }
    }
    uint64_t v7 = [v8 setAutoScales:v10 < v12];
    double v8 = v13;
  }
LABEL_7:
  MEMORY[0x270F9A758](v7, v8);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MUPDFContentViewController;
  id v4 = a3;
  [(MUPDFContentViewController *)&v8 traitCollectionDidChange:v4];
  id v5 = objc_msgSend(v4, "preferredContentSizeCategory", v8.receiver, v8.super_class);

  id v6 = [(MUPDFContentViewController *)self traitCollection];
  uint64_t v7 = [v6 preferredContentSizeCategory];

  if (v5 != v7)
  {
    [(MUPDFContentViewController *)self _updateThumbnailViewAppearance];
    [(MUPDFContentViewController *)self removeThumbnailViewHolderConstraints];
    [(MUPDFContentViewController *)self _updateThumbnailViewHolderConstraints];
  }
}

- (CGAffineTransform)_compensatingAffineTransformForPage:(SEL)a3
{
  id v5 = a4;
  uint64_t v6 = [v5 rotation];
  [v5 boundsForBox:1];
  double v8 = v7;
  double v10 = v9;

  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeRotation(&v18, (double)v6 * 3.14159265 / 180.0);
  long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v17.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v17.c = v11;
  *(_OWORD *)&v17.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  switch(v6)
  {
    case 270:
      CGFloat v13 = 0.0;
LABEL_7:
      CGFloat v12 = v10;
      goto LABEL_8;
    case 180:
      CGFloat v13 = v8;
      goto LABEL_7;
    case 90:
      CGFloat v12 = 0.0;
      CGFloat v13 = v8;
LABEL_8:
      CGAffineTransformMakeTranslation(&v17, v13, v12);
      break;
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransform t1 = v18;
  CGAffineTransform v15 = v17;
  return CGAffineTransformConcat(retstr, &t1, &v15);
}

- (void)find:(id)a3
{
  id v4 = [(MUPDFContentViewController *)self pdfView];
  double v3 = [v4 findInteraction];
  [v3 presentFindNavigatorShowingReplace:0];
}

- (void)findNext:(id)a3
{
  id v4 = [(MUPDFContentViewController *)self pdfView];
  double v3 = [v4 findInteraction];
  [v3 findNext];
}

- (void)findPrevious:(id)a3
{
  id v4 = [(MUPDFContentViewController *)self pdfView];
  double v3 = [v4 findInteraction];
  [v3 findPrevious];
}

- (PDFDocument)pdfDocument
{
  return (PDFDocument *)objc_getProperty(self, a2, 992, 1);
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSArray)sourceContentReplacedAnnotationMaps
{
  return (NSArray *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setSourceContentReplacedAnnotationMaps:(id)a3
{
}

- (BOOL)showsThumbnailView
{
  return self->_showsThumbnailView;
}

- (BOOL)fixedThumbnailView
{
  return self->_fixedThumbnailView;
}

- (BOOL)navigationModeHorizontal
{
  return self->_navigationModeHorizontal;
}

- (PDFView)pdfView
{
  return (PDFView *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setPdfView:(id)a3
{
}

- (PDFThumbnailView)thumbnailView
{
  return (PDFThumbnailView *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setThumbnailView:(id)a3
{
}

- (BOOL)forcesPDFViewTopAlignment
{
  return self->_forcesPDFViewTopAlignment;
}

- (BOOL)shouldShowThumbnailView
{
  return self->_shouldShowThumbnailView;
}

- (void)setShouldShowThumbnailView:(BOOL)a3
{
  self->_shouldShowThumbnailView = a3;
}

- (unint64_t)inkStyle
{
  return self->_inkStyle;
}

- (UIView)thumbnailViewHolder
{
  return (UIView *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setThumbnailViewHolder:(id)a3
{
}

- (UIView)scrollerBackgroundView
{
  return (UIView *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setScrollerBackgroundView:(id)a3
{
}

- (BOOL)constraintsAreHorizontal
{
  return self->_constraintsAreHorizontal;
}

- (void)setConstraintsAreHorizontal:(BOOL)a3
{
  self->_constraintsAreHorizontal = a3;
}

- (NSArray)thumbnailViewHolderConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setThumbnailViewHolderConstraints:(id)a3
{
}

- (NSLayoutConstraint)pdfViewLeadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setPdfViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)thumbnailViewHolderWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setThumbnailViewHolderWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)thumbnailViewHolderRevealConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setThumbnailViewHolderRevealConstraint:(id)a3
{
}

- (NSLayoutConstraint)thumbnailViewLeadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setThumbnailViewLeadingConstraint:(id)a3
{
}

- (BOOL)viewIsTransitioningBetweenSizes
{
  return self->_viewIsTransitioningBetweenSizes;
}

- (void)setViewIsTransitioningBetweenSizes:(BOOL)a3
{
  self->_viewIsTransitioningBetweenSizes = a3;
}

- (PDFPage)viewTransitionPageToCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewTransitionPageToCenter);
  return (PDFPage *)WeakRetained;
}

- (void)setViewTransitionPageToCenter:(id)a3
{
}

- (CGPoint)viewTransitionPointOnPageToCenter
{
  objc_copyStruct(v4, &self->_viewTransitionPointOnPageToCenter, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (void)setViewTransitionPointOnPageToCenter:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_viewTransitionPointOnPageToCenter, &v3, 16, 1, 0);
}

- (double)viewTransitionPreviousScale
{
  return self->_viewTransitionPreviousScale;
}

- (void)setViewTransitionPreviousScale:(double)a3
{
  self->_viewTransitionPreviousScale = a3;
}

- (BOOL)viewTransitionPreviousAutoscalingState
{
  return self->_viewTransitionPreviousAutoscalingState;
}

- (void)setViewTransitionPreviousAutoscalingState:(BOOL)a3
{
  self->_viewTransitionPreviousAutoscalingState = a3;
}

- (BOOL)didSetup
{
  return self->_didSetup;
}

- (void)setDidSetup:(BOOL)a3
{
  self->_didSetup = a3;
}

- (UIEdgeInsets)cachedThumnailViewInsets
{
  double top = self->_cachedThumnailViewInsets.top;
  double left = self->_cachedThumnailViewInsets.left;
  double bottom = self->_cachedThumnailViewInsets.bottom;
  double right = self->_cachedThumnailViewInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCachedThumnailViewInsets:(UIEdgeInsets)a3
{
  self->_cachedThumnailViewInsets = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewTransitionPageToCenter);
  objc_storeStrong((id *)&self->_thumbnailViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_thumbnailViewHolderRevealConstraint, 0);
  objc_storeStrong((id *)&self->_thumbnailViewHolderWidthConstraint, 0);
  objc_storeStrong((id *)&self->_pdfViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_thumbnailViewHolderConstraints, 0);
  objc_storeStrong((id *)&self->_scrollerBackgroundView, 0);
  objc_storeStrong((id *)&self->_thumbnailViewHolder, 0);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_pdfView, 0);
  objc_storeStrong((id *)&self->_sourceContentReplacedAnnotationMaps, 0);
  objc_storeStrong((id *)&self->_edgePanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pageLabelViewTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->pageLabelViewSideConstraint, 0);
  objc_storeStrong((id *)&self->pageLabelViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_pageLabelView, 0);
  objc_storeStrong((id *)&self->_pdfDocument, 0);
}

@end