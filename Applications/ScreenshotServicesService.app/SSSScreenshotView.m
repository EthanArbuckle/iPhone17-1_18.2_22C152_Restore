@interface SSSScreenshotView
+ (CGAffineTransform)_transformToConvertFromRect:(SEL)a3 toRect:(CGRect)a4;
+ (CGRect)_scaledAndCenteredRect:(CGRect)a3 withinRect:(CGRect)a4;
+ (void)_zoomToRectWithinContentInsetBounds:(CGRect)a3 scrollView:(id)a4 animated:(BOOL)a5;
- ($0AC6E346AE4835514AAA8AC86D8F4844)_viewState;
- (AKController)akController;
- (BOOL)_layoutPDFViewVerticalContentInsetToMatchImageView;
- (BOOL)annotationsEnabled;
- (BOOL)canRedo;
- (BOOL)canUndo;
- (BOOL)cropHandlesFadedOut;
- (BOOL)gesturesEnabled;
- (BOOL)isBeingRemoved;
- (BOOL)isCropped;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)screenshotEditsSnapshotted;
- (BOOL)shouldFlash;
- (BOOL)showBackgroundForOccludingView;
- (BOOL)useTrilinearMinificationFilter;
- (BOOL)usesOriginalImageAspectRatio;
- (CGRect)cropOverlayViewRectInWindow;
- (CGRect)extent;
- (CGRect)rectToCenterAboveKeyboard;
- (NSString)vsGlyph;
- (NSString)vsGlyphFilled;
- (SSSScreenshot)screenshot;
- (SSSScreenshotView)initWithFrame:(CGRect)a3;
- (SSSScreenshotViewDelegate)delegate;
- (UIActivity)visionKitFeedbackActivity;
- (UIView)contentSnapshot;
- (UIView)viewContainingScreenshotContents;
- (UIViewController)viewControllerForOverlayPresentations;
- (VKCImageAnalysis)currentImageAnalysis;
- (VKCImageAnalyzer)imageAnalyzer;
- (double)cornerGrabberAlpha;
- (double)geometryMultiplier;
- (double)lineAlpha;
- (double)lineGrabberAlpha;
- (id)_actionInfoViewIfExists;
- (id)_currentOverlayController;
- (id)_findTextViewFirstResponderUnderView:(id)a3;
- (id)_imageAnalysisAaBarButtonItemIfExists;
- (id)_imageAnalysisAaButtonIfExists;
- (id)_internalPDFView;
- (id)_visualSearchCornerViewIfExists;
- (id)currentCropController;
- (id)currentView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)modelModificationInfo;
- (id)screenshotRepresentationAKControllerForPDF;
- (id)undoManager;
- (id)viewModificationInfo;
- (int64_t)_numberOfDrawingStrokesInScreenshot;
- (int64_t)borderStyle;
- (int64_t)currentPDFPage;
- (int64_t)editMode;
- (int64_t)screenshotPDFPageIndex:(id)a3;
- (unint64_t)interactionMode;
- (unint64_t)state;
- (void)_commitCropControllerInflightEdits;
- (void)_goToPDFPage:(unint64_t)a3 rect:(CGRect)a4 force:(BOOL)a5;
- (void)_handleTap;
- (void)_layoutPDFViewToMatchImageViewIfNeeded;
- (void)_layoutUpdateCropControllers;
- (void)_logEditsInScreenshotForAnalytics;
- (void)_prepareGesturesForOverlayController:(id)a3;
- (void)_stopFlash;
- (void)_updateGestures;
- (void)adjustPDFPositioningToMatchImageIfNecessary;
- (void)cancelCrop;
- (void)commitInflightEdits;
- (void)cropController:(id)a3 changedToCropRect:(CGRect)a4;
- (void)cropControllerCropRectDidChange:(id)a3;
- (void)cropControllerDidBeginCropping:(id)a3;
- (void)dealloc;
- (void)deselectAllAnnotations;
- (void)doneCrop;
- (void)enterCrop;
- (void)finishPreparingForFullscreenExperience;
- (void)flash;
- (void)imageView:(id)a3 requestsUpdateToInteractionMode:(unint64_t)a4;
- (void)imageView:(id)a3 startEditingOpacityInAccessoryView:(id)a4;
- (void)imageViewDidLoadImage:(id)a3;
- (void)imageViewDidUpdateInteraction:(id)a3 withAnalysis:(id)a4;
- (void)layoutSubviews;
- (void)pageChanged:(id)a3;
- (void)pdfView:(id)a3 startEditingOpacityInAccessoryView:(id)a4;
- (void)prepareForFullscreenExperience;
- (void)promoteViewValueToModelValueForKey:(unint64_t)a3;
- (void)redo;
- (void)requireAllOtherGestureRecognizersToFailBeforeGestureRecognizer:(id)a3;
- (void)requireGestureRecognizerToFailBeforeAllOtherGestureRecognizers:(id)a3;
- (void)resetCrop;
- (void)revert;
- (void)safeAreaInsetsDidChange;
- (void)screenshot:(id)a3 didHaveChangeOnPage:(unint64_t)a4;
- (void)screenshotDeletePDFPage:(int64_t)a3;
- (void)screenshotDidHaveUndoStackChanged:(id)a3;
- (void)screenshotDidMakeAnnotationEditOnImage;
- (void)screenshotDidReceivePDFData;
- (void)screenshotDidRevert:(id)a3;
- (void)screenshotInsertPDFPage:(id)a3 pageIndex:(int64_t)a4;
- (void)screenshotShouldJumpToPDFPageIndex:(int64_t)a3;
- (void)setAnnotationsEnabled:(BOOL)a3;
- (void)setBorderStyle:(int64_t)a3;
- (void)setCornerGrabberAlpha:(double)a3;
- (void)setCropHandlesFadedOut:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEditMode:(int64_t)a3;
- (void)setExtent:(CGRect)a3;
- (void)setGeometryMultiplier:(double)a3;
- (void)setGesturesEnabled:(BOOL)a3;
- (void)setImageAnalyzer:(id)a3;
- (void)setInteractionMode:(unint64_t)a3;
- (void)setIsBeingRemoved:(BOOL)a3;
- (void)setLineAlpha:(double)a3;
- (void)setLineGrabberAlpha:(double)a3;
- (void)setRulerHostingView:(id)a3;
- (void)setScreenshot:(id)a3;
- (void)setScreenshotEditsSnapshotted:(BOOL)a3 inTransition:(BOOL)a4 currentScreenshot:(BOOL)a5;
- (void)setShowBackgroundForOccludingView:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setUseTrilinearMinificationFilter:(BOOL)a3;
- (void)setUsesOriginalImageAspectRatio:(BOOL)a3;
- (void)undo;
- (void)uninstallInterstitialGesture:(id)a3;
- (void)updateForFrame:(CGRect)a3;
- (void)updatePaletteVisibilityIfNecessary:(BOOL)a3;
@end

@implementation SSSScreenshotView

- (SSSScreenshotView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)SSSScreenshotView;
  v3 = -[SSSScreenshotView initWithFrame:](&v24, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SSSScreenshotView *)v3 setClipsToBounds:0];
  v4 = objc_alloc_init(SSSScreenshotBorderView);
  borderView = v3->_borderView;
  v3->_borderView = v4;

  [(SSSScreenshotView *)v3 addSubview:v3->_borderView];
  v6 = objc_alloc_init(_SSSScreenshotImageView);
  screenshotImageView = v3->_screenshotImageView;
  v3->_screenshotImageView = v6;

  [(_SSSScreenshotImageView *)v3->_screenshotImageView setDelegate:v3];
  [(_SSSScreenshotImageView *)v3->_screenshotImageView setAccessibilityIdentifier:@"Screenshots-Image-View"];
  v8 = objc_alloc_init(_SSSScreenshotPDFView);
  screenshotPDFView = v3->_screenshotPDFView;
  v3->_screenshotPDFView = v8;

  [(_SSSScreenshotPDFView *)v3->_screenshotPDFView setAccessibilityIdentifier:@"Screenshots-PDF-View"];
  [(_SSSScreenshotPDFView *)v3->_screenshotPDFView setDelegate:v3];
  v10 = [(_SSSScreenshotAnnotationView *)v3->_screenshotImageView overlayController];
  [v10 setDelegate:v3];

  v11 = [(_SSSScreenshotAnnotationView *)v3->_screenshotPDFView overlayController];
  [v11 setDelegate:v3];

  v12 = objc_alloc_init(SSSCropController);
  imageCropController = v3->_imageCropController;
  v3->_imageCropController = v12;

  [(SSSCropController *)v3->_imageCropController setNumberOfTouchesRequiredForPanningCrop:2];
  [(SSSCropController *)v3->_imageCropController setDelegate:v3];
  v14 = [(SSSCropController *)v3->_imageCropController cropView];
  [v14 setHidden:v3->_editMode != 0];

  v15 = [(SSSCropController *)v3->_imageCropController cropView];
  [(SSSScreenshotView *)v3 addSubview:v15];

  v16 = objc_alloc_init(SSSCropController);
  pdfCropController = v3->_pdfCropController;
  v3->_pdfCropController = v16;

  [(SSSCropController *)v3->_pdfCropController setNumberOfTouchesRequiredForPanningCrop:2];
  [(SSSCropController *)v3->_pdfCropController setDelegate:v3];
  [(SSSCropController *)v3->_pdfCropController setEditMode:1];
  v18 = [(SSSCropController *)v3->_pdfCropController cropView];
  [v18 setHidden:v3->_editMode == 0];

  v19 = [(SSSCropController *)v3->_pdfCropController cropView];
  [(SSSScreenshotView *)v3 addSubview:v19];

  v20 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v3 action:"_handleTap"];
  tapGesture = v3->_tapGesture;
  v3->_tapGesture = v20;

  [(SSSScreenshotView *)v3 addGestureRecognizer:v3->_tapGesture];
  CGSize size = CGRectNull.size;
  v3->_lastScreenshotImageViewFrameInScreen.origin = CGRectNull.origin;
  v3->_lastScreenshotImageViewFrameInScreen.CGSize size = size;
  return v3;
}

- (void)dealloc
{
  v3 = [(SSSScreenshotView *)self undoManager];
  [v3 removeAllActions];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5 = [(_SSSScreenshotAnnotationView *)self->_screenshotImageView overlayController];
  [v5 logDidEndEditingWithOverlay];

  v6 = [(_SSSScreenshotAnnotationView *)self->_screenshotPDFView overlayController];
  [v6 logDidEndEditingWithOverlay];

  v7.receiver = self;
  v7.super_class = (Class)SSSScreenshotView;
  [(SSSScreenshotView *)&v7 dealloc];
}

- (void)setBorderStyle:(int64_t)a3
{
  if ([(SSSScreenshotView *)self borderStyle] != a3)
  {
    borderView = self->_borderView;
    [(SSSScreenshotBorderView *)borderView setBorderStyle:a3];
  }
}

- (int64_t)borderStyle
{
  return [(SSSScreenshotBorderView *)self->_borderView borderStyle];
}

- (void)setUseTrilinearMinificationFilter:(BOOL)a3
{
  self->_useTrilinearMinificationFilter = a3;
  [(SSSScreenshotView *)self setNeedsLayout];
}

- (void)setScreenshot:(id)a3
{
  v4 = (SSSScreenshot *)a3;
  [(SSSScreenshot *)self->_screenshot setRepresentation:0];
  screenshot = self->_screenshot;
  self->_screenshot = v4;
  v6 = v4;

  [(SSSScreenshot *)self->_screenshot setRepresentation:self];
  [(_SSSScreenshotImageView *)self->_screenshotImageView setScreenshot:v6];
  [(_SSSScreenshotPDFView *)self->_screenshotPDFView setScreenshot:v6];
  [(SSSScreenshotView *)self setNeedsLayout];
  [(SSSScreenshotView *)self layoutIfNeeded];
  [(SSSCropController *)self->_imageCropController setViewToCrop:self->_screenshotImageView];
  [(SSSCropController *)self->_pdfCropController setViewToCrop:self->_screenshotPDFView];

  [(SSSScreenshotView *)self setNeedsLayout];
}

- (void)setInteractionMode:(unint64_t)a3
{
}

- (unint64_t)interactionMode
{
  return [(_SSSScreenshotImageView *)self->_screenshotImageView interactionMode];
}

- (void)setImageAnalyzer:(id)a3
{
}

- (VKCImageAnalyzer)imageAnalyzer
{
  return [(_SSSScreenshotImageView *)self->_screenshotImageView imageAnalyzer];
}

- (id)undoManager
{
  v3 = [(SSSScreenshotView *)self screenshot];
  v4 = [v3 undoManagerForEditMode:[self _viewState]];

  return v4;
}

- (void)screenshotDidHaveUndoStackChanged:(id)a3
{
  [(_SSSScreenshotImageView *)self->_screenshotImageView clearImageAnalysisTextSelection];
  v4 = [(SSSScreenshotView *)self delegate];
  [v4 screenshotViewUndoStackChanged:self];

  v5 = [(SSSScreenshotView *)self currentView];
  [v5 updateUndoState];

  v6 = [(SSSScreenshotView *)self modelModificationInfo];
  objc_super v7 = v6;
  if (v6)
  {
    [v6 cropInfo];
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
  }
  double v8 = sub_10004C860((double *)&v18);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = [(SSSScreenshotView *)self currentCropController];
  [v15 cropRect];
  char v16 = SSRectEqualToRect();

  if ((v16 & 1) == 0)
  {
    v17 = [(SSSScreenshotView *)self currentCropController];
    [v17 setCropRect:v8, v10, v12, v14];
  }
  [(SSSScreenshotView *)self setNeedsLayout];
}

- (void)screenshotShouldJumpToPDFPageIndex:(int64_t)a3
{
}

- (void)screenshotDidRevert:(id)a3
{
  [(SSSScreenshotView *)self screenshotDidHaveUndoStackChanged:a3];
  v4 = [(SSSScreenshotView *)self delegate];
  [v4 screenshotViewUndoStackChanged:self];

  [(SSSScreenshotView *)self setNeedsLayout];
}

- (void)screenshot:(id)a3 didHaveChangeOnPage:(unint64_t)a4
{
  -[SSSScreenshotView _goToPDFPage:rect:force:](self, "_goToPDFPage:rect:force:", a4, 0, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  id v5 = [(SSSScreenshotView *)self delegate];
  [v5 screenshotViewUndoStackChanged:self];
}

- (void)screenshotDidMakeAnnotationEditOnImage
{
}

- (void)_goToPDFPage:(unint64_t)a3 rect:(CGRect)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v48 = [(_SSSScreenshotPDFView *)self->_screenshotPDFView _pdfView];
  double v12 = [v48 document];
  if ([v12 pageCount])
  {
    double v13 = (unsigned char *)fmin(fmax((double)a3, 0.0), (double)((unint64_t)[v12 pageCount] - 1));
    double v14 = [v48 currentPage];
    v15 = [v12 indexForPage:v14];

    char v16 = [v12 pageAtIndex:v13];
    [v48 layoutDocumentView];
    v50.origin.double x = x;
    v50.origin.double y = y;
    v50.size.double width = width;
    v50.size.double height = height;
    if (CGRectIsEmpty(v50))
    {
      if (!v5 || v13 && (char *)[v12 pageCount] - 1 != v13)
      {
        if (v15 != v13)
        {
          [v48 goToPage:v16];
          [(_SSSScreenshotPDFView *)self->_screenshotPDFView updateViewState];
        }
        goto LABEL_11;
      }
      [v16 boundsForBox:1];
      [v48 convertRect:v16 fromPage:];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      v25 = [v48 documentView];
      [v48 convertRect:v25 toView:v18];
      double v27 = v26;
      double v29 = v28;

      v30 = [v48 documentScrollView];
      [v30 contentInset];
      double v32 = v31;
      [v48 pageBreakMargins];
      double v34 = v29 - (v32 + v33);

      v35 = [v48 documentScrollView];
      [v35 contentSize];
      double v37 = v36;
      [v35 bounds];
      [v35 setContentOffset:1 v27 fmin(v34, v37 - v38)];
      [(_SSSScreenshotPDFView *)self->_screenshotPDFView updateViewState];
    }
    else
    {
      [v48 convertRect:v16 fromPage:x, y, width, height];
      double v40 = v39;
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      v47 = objc_opt_class();
      v35 = [v48 documentScrollView];
      [v47 _zoomToRectWithinContentInsetBounds:v35 scrollView:0 v40 v42 v44 v46];
    }

LABEL_11:
  }
}

- (void)setUsesOriginalImageAspectRatio:(BOOL)a3
{
  self->_usesOriginalImageAspectRatio = a3;
  [(SSSScreenshotView *)self setNeedsLayout];
}

- (void)screenshotDidReceivePDFData
{
  v3 = [(SSSScreenshotView *)self window];
  id v5 = [v3 firstResponder];

  [(_SSSScreenshotPDFView *)self->_screenshotPDFView setupPDFData];
  if ((id)[(SSSScreenshotView *)self editMode] == (id)1)
  {
    v4 = [(SSSScreenshotView *)self currentView];
    [v4 setOverlayControllerActive:1];
  }
  if (([v5 isFirstResponder] & 1) == 0) {
    [v5 becomeFirstResponder];
  }
  [(SSSScreenshotView *)self adjustPDFPositioningToMatchImageIfNecessary];
}

- (id)screenshotRepresentationAKControllerForPDF
{
  v2 = [(_SSSScreenshotPDFView *)self->_screenshotPDFView _pdfView];
  v3 = [v2 document];
  v4 = [v3 akController];

  return v4;
}

- (int64_t)screenshotPDFPageIndex:(id)a3
{
  id v4 = a3;
  id v5 = [(SSSScreenshotView *)self _internalPDFView];
  v6 = [v5 document];
  id v7 = [v6 indexForPage:v4];

  return (int64_t)v7;
}

- (void)screenshotDeletePDFPage:(int64_t)a3
{
  id v5 = [(SSSScreenshotView *)self _internalPDFView];
  id v4 = [v5 document];
  [v4 removePageAtIndex:a3];
}

- (void)screenshotInsertPDFPage:(id)a3 pageIndex:(int64_t)a4
{
  id v6 = a3;
  id v8 = [(SSSScreenshotView *)self _internalPDFView];
  id v7 = [v8 document];
  [v7 insertPage:v6 atIndex:a4];
}

- (void)_layoutUpdateCropControllers
{
  if ([(SSSScreenshotView *)self gesturesEnabled]) {
    uint64_t v3 = [(SSSScreenshotView *)self cropHandlesFadedOut] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }
  p_imageCropController = &self->_imageCropController;
  [(SSSCropController *)self->_imageCropController setCropEnabled:v3];
  p_pdfCropController = &self->_pdfCropController;
  pdfCropController = self->_pdfCropController;
  if (v3) {
    BOOL v7 = (id)[(SSSScreenshotView *)self editMode] == (id)2;
  }
  else {
    BOOL v7 = 0;
  }
  [(SSSCropController *)pdfCropController setCropEnabled:v7];
  int64_t editMode = self->_editMode;
  double v9 = [(SSSCropController *)*p_imageCropController cropView];
  [v9 setHidden:editMode != 0];

  double v10 = [(SSSCropController *)*p_pdfCropController cropView];
  [v10 setHidden:editMode == 0];

  BOOL v11 = (id)[(SSSScreenshotView *)self interactionMode] != (id)2
     && (id)[(SSSScreenshotView *)self interactionMode] != (id)3;
  [(SSSCropController *)*p_imageCropController setCropEnabled:v3 & v11];
  if (editMode) {
    double v12 = &self->_pdfCropController;
  }
  else {
    double v12 = &self->_imageCropController;
  }
  double v13 = [(SSSCropController *)*v12 cropView];
  [(SSSScreenshotView *)self bounds];
  [v13 sss_setFrameUnanimatingIfChangingFromCGSizeZero:];

  double v14 = *p_imageCropController;
  v15 = [(SSSScreenshotView *)self screenshot];
  char v16 = [v15 snapUnitRects];
  [(SSSCropController *)v14 setSnapRects:v16];

  double v17 = *p_pdfCropController;
  double v18 = [(SSSScreenshotView *)self screenshot];
  double v19 = [v18 snapUnitRects];
  [(SSSCropController *)v17 setSnapRects:v19];

  if ((id)[(SSSScreenshotView *)self state] == (id)1)
  {
    double v20 = [(SSSScreenshotView *)self akController];
    if ([v20 onlyDrawWithApplePencil]) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = 2;
    }

    [(SSSCropController *)*p_imageCropController setNumberOfTouchesRequiredForPanningCrop:v21];
    double v22 = *p_pdfCropController;
    [(SSSCropController *)v22 setNumberOfTouchesRequiredForPanningCrop:v21];
  }
}

- (void)layoutSubviews
{
  uint64_t v3 = [(SSSScreenshotView *)self screenshot];

  if (v3)
  {
    [(SSSScreenshotView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    uint64_t v55 = 0;
    long long v53 = 0u;
    long long v54 = 0u;
    double v12 = [(SSSScreenshotView *)self traitCollection];
    sub_10000E15C(v12, (uint64_t)&v53);

    double v13 = +[UIColor systemBlueColor];
    [(SSSScreenshotView *)self setInteractionTintColor:v13];

    [(SSSScreenshotView *)self _layoutUpdateCropControllers];
    if (!self->_hasPreparedForFullscreenExperience)
    {
      -[_SSSScreenshotImageView setFrame:](self->_screenshotImageView, "setFrame:", v5, v7, v9, v11);
      -[_SSSScreenshotPDFView setFrame:](self->_screenshotPDFView, "setFrame:", v5, v7, v9, v11);
    }
    [(_SSSScreenshotImageView *)self->_screenshotImageView setUseTrilinearMinificationFilter:[(SSSScreenshotView *)self useTrilinearMinificationFilter]];
    screenshotImageView = self->_screenshotImageView;
    v15 = [(SSSScreenshotView *)self viewModificationInfo];
    [v15 vellumOpacity];
    -[_SSSScreenshotImageView setVellumOpacity:](screenshotImageView, "setVellumOpacity:");

    screenshotPDFView = self->_screenshotPDFView;
    double v17 = [(SSSScreenshotView *)self viewModificationInfo];
    [v17 vellumOpacity];
    -[_SSSScreenshotPDFView setVellumOpacity:](screenshotPDFView, "setVellumOpacity:");

    double v18 = 0.0;
    if ([(SSSScreenshotView *)self state]) {
      double v19 = 0.0;
    }
    else {
      double v19 = *((double *)&v54 + 1);
    }
    [(SSSScreenshotView *)self geometryMultiplier];
    double v21 = v19 * v20;
    if (self->_hasPreparedForFullscreenExperience) {
      double v22 = 0.0;
    }
    else {
      double v22 = v19 * v20;
    }
    if (self->_hasPreparedForFullscreenExperience) {
      double v23 = v21;
    }
    else {
      double v23 = 0.0;
    }
    [(_SSSScreenshotAnnotationView *)self->_screenshotImageView setCornerRadius:v22];
    [(SSSCropController *)self->_imageCropController setCornerRadius:v23];
    [(SSSCropController *)self->_pdfCropController setCornerRadius:v23];
    -[SSSScreenshotBorderView setFrame:](self->_borderView, "setFrame:", v5, v7, v9, v11);
    if ((id)[(SSSScreenshotView *)self state] == (id)1)
    {
      double v24 = [(SSSScreenshotView *)self modelModificationInfo];
      v25 = v24;
      if (v24) {
        [v24 cropInfo];
      }
      else {
        memset(v52, 0, sizeof(v52));
      }
      double v27 = sub_10004C860((double *)v52);
      double v28 = v30;
      double v26 = v31;
      double v29 = v32;
    }
    else
    {
      double v26 = 1.0;
      double v27 = 0.0;
      double v28 = 0.0;
      double v29 = 1.0;
    }
    -[SSSScreenshotBorderView setUnitRectForContent:](self->_borderView, "setUnitRectForContent:", v27, v28, v26, v29);
    [(SSSScreenshotView *)self _updateGestures];
    UIRectInset();
    -[UIView setFrame:](self->_flashView, "setFrame:");
    unint64_t v33 = [(SSSScreenshotView *)self state];
    flashView = self->_flashView;
    if (!v33)
    {
      double v35 = *(double *)&v54;
      [(SSSScreenshotView *)self geometryMultiplier];
      double v18 = v35 * v36;
    }
    [(UIView *)flashView _setCornerRadius:v18];
    if (!self->_editMode)
    {
      if (!self->_hasCroppedImageView)
      {
        [(SSSCropController *)self->_imageCropController cropRect];
        v57.origin.double x = 0.0;
        v57.origin.double y = 0.0;
        v57.size.double width = 1.0;
        v57.size.double height = 1.0;
        self->_hasCroppedImageView = !CGRectEqualToRect(v56, v57);
      }
      p_lastScreenshotImageViewFrameInScreen = &self->_lastScreenshotImageViewFrameInScreen;
      if (CGRectIsEmpty(self->_lastScreenshotImageViewFrameInScreen) || !self->_hasCroppedImageView)
      {
        double v38 = [(SSSScreenshotView *)self window];
        [(_SSSScreenshotImageView *)self->_screenshotImageView bounds];
        [v38 convertRect:self->_screenshotImageView fromView:];
        double v40 = v39;
        double v42 = v41;
        double v44 = v43;
        double v46 = v45;

        v47 = [(SSSScreenshotView *)self window];
        [v47 convertRect:0 toWindow:v40, v42, v44, v46];
        p_lastScreenshotImageViewFrameInScreen->origin.double x = v48;
        p_lastScreenshotImageViewFrameInScreen->origin.double y = v49;
        p_lastScreenshotImageViewFrameInScreen->size.double width = v50;
        p_lastScreenshotImageViewFrameInScreen->size.double height = v51;
      }
    }
  }
}

- (void)_updateGestures
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v3 = [(SSSCropController *)self->_imageCropController gestureRecognizers];
  id v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)v7) setAllowedTouchTypes:&off_10009DED8];
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v8 = [(SSSCropController *)self->_pdfCropController gestureRecognizers];
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      double v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v12) setAllowedTouchTypes:&off_10009DED8];
        double v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v10);
  }

  [(UITapGestureRecognizer *)self->_tapGesture setEnabled:[(SSSScreenshotView *)self gesturesEnabled]];
  if ([(SSSScreenshotView *)self annotationsEnabled]) {
    BOOL v13 = (id)[(SSSScreenshotView *)self editMode] == (id)1;
  }
  else {
    BOOL v13 = 0;
  }
  double v14 = [(_SSSScreenshotAnnotationView *)self->_screenshotPDFView overlayController];
  [v14 setGesturesEnabled:v13];

  BOOL v15 = [(SSSScreenshotView *)self annotationsEnabled]
     && ![(SSSScreenshotView *)self editMode]
     && [(SSSScreenshotView *)self interactionMode] == 0;
  char v16 = [(_SSSScreenshotAnnotationView *)self->_screenshotImageView overlayController];
  [v16 setGesturesEnabled:v15];
}

- (void)updateForFrame:(CGRect)a3
{
  if (!self->_hasCroppedImageView)
  {
    [(SSSScreenshotView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    -[_SSSScreenshotImageView setFrame:](self->_screenshotImageView, "setFrame:");
    screenshotPDFView = self->_screenshotPDFView;
    -[_SSSScreenshotPDFView setFrame:](screenshotPDFView, "setFrame:", v5, v7, v9, v11);
  }
}

- (BOOL)_layoutPDFViewVerticalContentInsetToMatchImageView
{
  p_lastScreenshotImageViewFrameInScreen = &self->_lastScreenshotImageViewFrameInScreen;
  IsEmptdouble y = CGRectIsEmpty(self->_lastScreenshotImageViewFrameInScreen);
  if (!IsEmpty)
  {
    double v5 = [(_SSSScreenshotPDFView *)self->_screenshotPDFView _pdfView];
    double v6 = [v5 documentScrollView];

    double v7 = [(SSSScreenshotView *)self window];
    [v7 convertRect:0 fromWindow:p_lastScreenshotImageViewFrameInScreen->origin.x, p_lastScreenshotImageViewFrameInScreen->origin.y, p_lastScreenshotImageViewFrameInScreen->size.width, p_lastScreenshotImageViewFrameInScreen->size.height];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    char v16 = [(SSSScreenshotView *)self window];
    [v16 convertRect:v6 toView:v9];
    CGFloat v18 = v17;
    CGFloat rect = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;

    [(SSSScreenshotView *)self bounds];
    -[SSSScreenshotView convertRect:toView:](self, "convertRect:toView:", v6);
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    v38.origin.double x = v18;
    v38.origin.double y = v20;
    v38.size.double width = v22;
    v38.size.double height = v24;
    double MinY = CGRectGetMinY(v38);
    v39.origin.double x = v26;
    v39.origin.double y = v28;
    v39.size.double width = v30;
    v39.size.double height = v32;
    double v34 = MinY - CGRectGetMinY(v39);
    v40.origin.double x = v26;
    v40.origin.double y = v28;
    v40.size.double width = v30;
    v40.size.double height = v32;
    double MaxY = CGRectGetMaxY(v40);
    v41.origin.double x = rect;
    v41.origin.double y = v20;
    v41.size.double width = v22;
    v41.size.double height = v24;
    [v6 setContentInset:v34, 0.0, MaxY - CGRectGetMaxY(v41), 0.0];
  }
  return !IsEmpty;
}

- (void)_layoutPDFViewToMatchImageViewIfNeeded
{
  if (!self->_hasPositionedPDFViewToMatchImageView)
  {
    uint64_t v3 = [(SSSScreenshotView *)self screenshot];
    double v4 = [v3 pdfData];

    if (v4)
    {
      if ([(SSSScreenshotView *)self _layoutPDFViewVerticalContentInsetToMatchImageView])
      {
        double v5 = [(SSSScreenshotView *)self screenshot];
        id v6 = [v5 visiblePDFPageWhenScreenshotted];

        double v7 = [(SSSScreenshotView *)self screenshot];
        [v7 visiblePDFRectWhenScreenshotted];
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;

        v32.origin.double x = CGRectZero.origin.x;
        v32.origin.double y = CGRectZero.origin.y;
        v32.size.double width = CGRectZero.size.width;
        v32.size.double height = CGRectZero.size.height;
        v31.origin.double x = v9;
        v31.origin.double y = v11;
        v31.size.double width = v13;
        v31.size.double height = v15;
        if (CGRectEqualToRect(v31, v32))
        {
          char v16 = [(_SSSScreenshotPDFView *)self->_screenshotPDFView _pdfView];
          [v16 layoutDocumentView];
          double v17 = [v16 document];
          CGFloat v18 = [v17 pageAtIndex:v6];

          [v18 boundsForBox:0];
          [v16 convertRect:v18 fromPage:];
          double v20 = v19;
          double v22 = v21;
          double v24 = v23;
          double v26 = v25;
          double v27 = objc_opt_class();
          CGFloat v28 = [v16 documentScrollView];
          [v27 _zoomToRectWithinContentInsetBounds:v28 scrollView:0 v20 v22 v24 v26];
        }
        else
        {
          -[SSSScreenshotView _goToPDFPage:rect:force:](self, "_goToPDFPage:rect:force:", v6, 0, v9, v11, v13, v15);
        }
        double v29 = +[NSNotificationCenter defaultCenter];
        CGFloat v30 = [(SSSScreenshotView *)self _internalPDFView];
        [v29 addObserver:self selector:"pageChanged:" name:PDFViewPageChangedNotification object:v30];

        self->_hasPositionedPDFViewToMatchImageView = 1;
      }
    }
  }
}

- (void)setRulerHostingView:(id)a3
{
  screenshotPDFView = self->_screenshotPDFView;
  id v5 = a3;
  [(_SSSScreenshotPDFView *)screenshotPDFView setRulerHostView:v5];
  [(_SSSScreenshotImageView *)self->_screenshotImageView setRulerHostView:v5];
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SSSScreenshotView;
  [(SSSScreenshotView *)&v3 safeAreaInsetsDidChange];
  [(SSSScreenshotView *)self setNeedsLayout];
}

- (CGRect)extent
{
  [(SSSScreenshotBorderView *)self->_borderView extent];
  borderView = self->_borderView;

  -[SSSScreenshotView convertRect:fromView:](self, "convertRect:fromView:", borderView);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (void)setGeometryMultiplier:(double)a3
{
}

- (double)geometryMultiplier
{
  [(SSSScreenshotBorderView *)self->_borderView geometryMultiplier];
  return result;
}

+ (CGAffineTransform)_transformToConvertFromRect:(SEL)a3 toRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat rect = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v8 = a4.size.height;
  CGFloat v9 = a4.size.width;
  CGFloat v10 = a4.origin.y;
  CGFloat v11 = a4.origin.x;
  double v13 = CGRectGetWidth(a5);
  v24.origin.CGFloat x = v11;
  v24.origin.CGFloat y = v10;
  v24.size.CGFloat width = v9;
  v24.size.CGFloat height = v8;
  CGFloat v20 = v13 / CGRectGetWidth(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = rect;
  double v14 = CGRectGetHeight(v25);
  v26.origin.CGFloat x = v11;
  v26.origin.CGFloat y = v10;
  v26.size.CGFloat width = v9;
  v26.size.CGFloat height = height;
  CGFloat v21 = v14 / CGRectGetHeight(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = rect;
  double MinX = CGRectGetMinX(v27);
  v28.origin.CGFloat x = v11;
  v28.origin.CGFloat y = v10;
  v28.size.CGFloat width = v9;
  v28.size.CGFloat height = height;
  CGFloat v19 = MinX - v20 * CGRectGetMinX(v28);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = rect;
  double MinY = CGRectGetMinY(v29);
  v30.origin.CGFloat x = v11;
  v30.origin.CGFloat y = v10;
  v30.size.CGFloat width = v9;
  v30.size.CGFloat height = height;
  CGFloat v18 = CGRectGetMinY(v30);
  retstr->a = v20;
  retstr->b = 0.0;
  retstr->c = 0.0;
  retstr->d = v21;
  retstr->tCGFloat x = v19;
  retstr->tCGFloat y = MinY - v21 * v18;
  return result;
}

+ (CGRect)_scaledAndCenteredRect:(CGRect)a3 withinRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v18 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  double v19 = CGRectGetWidth(a4);
  v22.origin.CGFloat x = v11;
  v22.origin.CGFloat y = v10;
  v22.size.CGFloat width = v9;
  v22.size.CGFloat height = v8;
  double v20 = v19 / CGRectGetWidth(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double v12 = CGRectGetHeight(v23);
  v24.origin.CGFloat x = v11;
  v24.origin.CGFloat y = v18;
  v24.size.CGFloat width = v9;
  v24.size.CGFloat height = v8;
  CGFloat v13 = fmin(v20, v12 / CGRectGetHeight(v24));
  CGAffineTransformMakeScale(&v21, v13, v13);
  v25.origin.CGFloat x = v11;
  v25.origin.CGFloat y = v18;
  v25.size.CGFloat width = v9;
  v25.size.CGFloat height = v8;
  CGRectApplyAffineTransform(v25, &v21);
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

+ (void)_zoomToRectWithinContentInsetBounds:(CGRect)a3 scrollView:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [v11 contentInset];
  [a1 _scaledAndCenteredRect:x, y, width, height withinRect:v13 + v20, v15 + v21, v17 - (v20 + v22), v19 - (v21 + v23)];
  memset(&v24[1], 0, sizeof(CGAffineTransform));
  [a1 _transformToConvertFromRect:toRect:];
  [v11 frame];
  v24[0] = v24[1];
  CGRect v26 = CGRectApplyAffineTransform(v25, v24);
  [v11 zoomToRect:v5 animated:v26.origin.x, v26.origin.y, v26.size.width, v26.size.height];
}

- (void)setState:(unint64_t)a3
{
  if ([(SSSScreenshotView *)self state] != a3)
  {
    self->_state = a3;
    [(SSSScreenshotView *)self _stopFlash];
    [(SSSScreenshotView *)self setNeedsLayout];
  }
}

- (void)cropController:(id)a3 changedToCropRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(_SSSScreenshotImageView *)self->_screenshotImageView clearImageAnalysisTextSelection];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  CGFloat v9 = [(SSSScreenshotView *)self modelModificationInfo];
  CGFloat v10 = v9;
  if (v9)
  {
    [v9 cropInfo];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
  }

  *(double *)&long long v21 = x * *(double *)&v20;
  *((double *)&v21 + 1) = y * *((double *)&v20 + 1);
  *(double *)&long long v22 = width * *(double *)&v20;
  *((double *)&v22 + 1) = height * *((double *)&v20 + 1);
  id v11 = [(SSSScreenshotView *)self screenshot];
  double v12 = [v11 environmentDescription];
  [v12 imageScale];

  SSRoundRectToScale();
  *(void *)&long long v21 = v13;
  *((void *)&v21 + 1) = v14;
  *(void *)&long long v22 = v15;
  *((void *)&v22 + 1) = v16;
  double v17 = [(SSSScreenshotView *)self viewModificationInfo];
  v19[0] = v20;
  v19[1] = v21;
  v19[2] = v22;
  [v17 setCropInfo:v19];

  [(SSSScreenshotView *)self promoteViewValueToModelValueForKey:0];
  double v18 = +[SSSStatisticsManager sharedStatisticsManager];
  [v18 fullscreenExperienceHadCropEvent];
}

- (void)cropControllerDidBeginCropping:(id)a3
{
}

- (void)cropControllerCropRectDidChange:(id)a3
{
  double v4 = os_log_create("com.apple.screenshotservices", "Editing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [(SSSScreenshotView *)self modelModificationInfo];
    double v6 = v5;
    if (v5)
    {
      [v5 cropInfo];
      uint64_t v8 = v14;
      uint64_t v7 = v13;
      uint64_t v10 = v16;
      uint64_t v9 = v15;
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v9 = 0;
      uint64_t v8 = 0;
      uint64_t v7 = 0;
    }
    id v11 = NSStringFromCGRect(*(CGRect *)&v7);
    *(_DWORD *)buf = 138412290;
    double v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User did crop to %@", buf, 0xCu);
  }
  double v12 = [(SSSScreenshotView *)self delegate];
  [v12 screenshotViewCropDidChange:self];

  [(_SSSScreenshotImageView *)self->_screenshotImageView reanalyzeImage];
}

- (double)cornerGrabberAlpha
{
  [(SSSCropController *)self->_imageCropController cornerGrabberAlpha];
  return result;
}

- (double)lineAlpha
{
  [(SSSCropController *)self->_imageCropController lineAlpha];
  return result;
}

- (double)lineGrabberAlpha
{
  [(SSSCropController *)self->_imageCropController lineGrabberAlpha];
  return result;
}

- (void)setCornerGrabberAlpha:(double)a3
{
}

- (void)setLineAlpha:(double)a3
{
}

- (void)setLineGrabberAlpha:(double)a3
{
}

- (void)commitInflightEdits
{
  [(SSSScreenshotView *)self _commitCropControllerInflightEdits];
  id v3 = [(SSSScreenshotView *)self akController];
  [v3 commitEditing];
}

- (void)_commitCropControllerInflightEdits
{
  int64_t editMode = self->_editMode;
  if (!editMode)
  {
    [(SSSCropController *)self->_imageCropController commitInflightEdits];
    int64_t editMode = self->_editMode;
  }
  if (editMode == 2)
  {
    [(SSSCropController *)self->_pdfCropController commitInflightEdits];
    [(SSSScreenshotView *)self doneCrop];
  }
}

- (void)_handleTap
{
  id v3 = [(SSSScreenshotView *)self delegate];
  [v3 screenshotViewTapped:self];
}

- (void)prepareForFullscreenExperience
{
  if (!self->_hasPreparedForFullscreenExperience)
  {
    self->_hasPreparedForFullscreenExperience = 1;
    screenshotPDFView = self->_screenshotPDFView;
    double v4 = [(SSSScreenshotView *)self screenshot];
    [(_SSSScreenshotPDFView *)screenshotPDFView setScreenshot:v4];

    screenshotImageView = self->_screenshotImageView;
    double v6 = [(SSSScreenshotView *)self screenshot];
    [(_SSSScreenshotImageView *)screenshotImageView setScreenshot:v6];

    uint64_t v7 = [(_SSSScreenshotAnnotationView *)self->_screenshotPDFView overlayController];
    [(SSSScreenshotView *)self _prepareGesturesForOverlayController:v7];

    uint64_t v8 = [(_SSSScreenshotAnnotationView *)self->_screenshotImageView overlayController];
    [(SSSScreenshotView *)self _prepareGesturesForOverlayController:v8];

    [(SSSScreenshotView *)self setNeedsLayout];
    imageCropController = self->_imageCropController;
    [(SSSCropController *)imageCropController prepareForFullscreenExperience:1];
  }
}

- (void)finishPreparingForFullscreenExperience
{
  if (!self->_hasFinishedPreparingForFullscreenExperience)
  {
    self->_hasFinishedPreparingForFullscreenExperience = 1;
    [(_SSSScreenshotAnnotationView *)self->_screenshotPDFView setOverlayControllerActive:0];
    [(_SSSScreenshotAnnotationView *)self->_screenshotImageView setOverlayControllerActive:1];
    id v3 = [(SSSScreenshotView *)self delegate];
    [v3 screenshotView:self requestsUpdateToInteractionMode:[self interactionMode]];
  }
}

- (void)deselectAllAnnotations
{
  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    id v3 = [(SSSScreenshotView *)self currentView];
    [v3 deselectAllAnnotations];
  }
  id v5 = [(SSSScreenshotView *)self akController];
  double v4 = [v5 modelController];
  [v4 deselectAllAnnotations];
}

- (void)imageViewDidUpdateInteraction:(id)a3 withAnalysis:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SSSScreenshotView *)self delegate];
  [v8 screenshotView:self didUpdateInteraction:v7 withAnalysis:v6];
}

- (void)imageView:(id)a3 requestsUpdateToInteractionMode:(unint64_t)a4
{
  id v6 = [(SSSScreenshotView *)self delegate];
  [v6 screenshotView:self requestsUpdateToInteractionMode:a4];
}

- (void)imageViewDidLoadImage:(id)a3
{
  [(_SSSScreenshotImageView *)self->_screenshotImageView setInhibitImageAnalysis:0];
  id v5 = [(_SSSScreenshotImageView *)self->_screenshotImageView drawingGestureRecognizer];
  if (v5)
  {
    double v4 = [(SSSScreenshotView *)self delegate];
    [v4 screenshotView:self hasHighPriorityGesture:v5];
  }
}

- (void)imageView:(id)a3 startEditingOpacityInAccessoryView:(id)a4
{
  id v5 = a4;
  id v6 = [(SSSScreenshotView *)self delegate];
  [v6 screenshotView:self startEditingOpacityInAccessoryView:v5];
}

- (void)pdfView:(id)a3 startEditingOpacityInAccessoryView:(id)a4
{
  id v5 = a4;
  id v6 = [(SSSScreenshotView *)self delegate];
  [v6 screenshotView:self startEditingOpacityInAccessoryView:v5];
}

- (void)setCropHandlesFadedOut:(BOOL)a3
{
  self->_cropHandlesFadedOut = a3;
  [(SSSScreenshotView *)self setNeedsLayout];
}

- (void)flash
{
  [(SSSScreenshotView *)self _stopFlash];
  id v3 = [(SSSScreenshotView *)self screenshot];
  double v4 = [v3 environmentDescription];

  if ([v4 presentationMode] == (id)2)
  {
    id v5 = [v4 externalFlashLayerRenderID];
    id v6 = [v4 externalFlashLayerContextID];
    if (v5)
    {
      id v7 = v6;
      if (v6)
      {
        id v8 = objc_alloc_init(SSSPortalView);
        flashView = self->_flashView;
        self->_flashView = &v8->super;

        [(UIView *)self->_flashView setSourceLayerRenderId:v5];
        [(UIView *)self->_flashView setSourceContextId:v7];
        [(UIView *)self->_flashView setHidesSourceView:1];
        [(UIView *)self->_flashView setMatchesAlpha:1];
        [(UIView *)self->_flashView setMatchesPosition:1];
        [(UIView *)self->_flashView setMatchesTransform:1];
        [(SSSScreenshotView *)self addSubview:self->_flashView];
        [(SSSScreenshotView *)self setNeedsLayout];
        [(SSSScreenshotView *)self layoutIfNeeded];
        +[SSFlashView expectedAnimationDurationForStyle:2];
        double v11 = v10;
        double v12 = v10 + -0.75;
        double v13 = v12 * 1000000000.0;
        BOOL v14 = v12 <= 0.0;
        double v15 = 0.0;
        if (!v14) {
          double v15 = v13;
        }
        dispatch_time_t v16 = dispatch_time(0, (uint64_t)v15);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100007AB8;
        block[3] = &unk_100099A20;
        block[4] = self;
        dispatch_after(v16, (dispatch_queue_t)&_dispatch_main_q, block);
        dispatch_time_t v17 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100007AD0;
        v26[3] = &unk_100099A20;
        v26[4] = self;
        dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, v26);
      }
    }
  }
  else
  {
    double v18 = [(SSSScreenshotView *)self screenshot];
    double v19 = [v18 environmentDescription];
    long long v20 = [v19 serviceOptions];
    id v21 = [v20 flashStyle];

    +[SSFlashView flashViewForStyle:v21 != 0];
    long long v22 = (UIView *)objc_claimAutoreleasedReturnValue();
    double v23 = self->_flashView;
    self->_flashView = v22;

    [(SSSScreenshotView *)self addSubview:self->_flashView];
    [(SSSScreenshotView *)self setNeedsLayout];
    [(SSSScreenshotView *)self layoutIfNeeded];
    CGRect v24 = self->_flashView;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100007AD8;
    v25[3] = &unk_100099A20;
    v25[4] = self;
    [(UIView *)v24 flashWithCompletion:v25];
  }
}

- (BOOL)shouldFlash
{
  v2 = [(SSSScreenshotView *)self screenshot];
  id v3 = [v2 environmentDescription];

  if ([v3 presentationMode] == (id)2) {
    BOOL v4 = [v3 externalFlashLayerRenderID] && [v3 externalFlashLayerContextID];
  }
  else {
    BOOL v4 = [v3 presentationMode] == 0;
  }

  return v4;
}

- (void)_stopFlash
{
  [(UIView *)self->_flashView removeFromSuperview];
  flashView = self->_flashView;
  self->_flashView = 0;

  [(SSSScreenshotView *)self setNeedsLayout];
}

- (void)setScreenshotEditsSnapshotted:(BOOL)a3 inTransition:(BOOL)a4 currentScreenshot:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  if (![(SSSScreenshotView *)self screenshotEditsSnapshotted]
    && v7
    && ![(SSSScreenshotView *)self isBeingRemoved])
  {
    [(SSSScreenshotView *)self _logEditsInScreenshotForAnalytics];
    uint64_t v9 = +[SSSScreenshotManager sharedScreenshotManager];
    double v10 = [(SSSScreenshotView *)self screenshot];
    [v9 saveEditsToScreenshotIfNecessary:v10 inTransition:v6];
  }
  unsigned int v11 = [(_SSSScreenshotAnnotationView *)self->_screenshotImageView screenshotEditsSnapshotted];
  if ((!v6 || v5) && v11 != v7)
  {
    [(_SSSScreenshotAnnotationView *)self->_screenshotImageView setScreenshotEditsSnapshotted:v7];
    double v12 = [(SSSScreenshotView *)self screenshot];
    double v13 = [v12 pdfData];

    if (v13)
    {
      screenshotPDFView = self->_screenshotPDFView;
      [(_SSSScreenshotAnnotationView *)screenshotPDFView setScreenshotEditsSnapshotted:v7];
    }
  }
}

- (void)_logEditsInScreenshotForAnalytics
{
  int64_t v3 = [(SSSScreenshotView *)self _numberOfDrawingStrokesInScreenshot];
  BOOL v4 = [(SSSScreenshotView *)self screenshot];
  if ([v4 hasEverBeenEditedForMode:0]
    && [(_SSSScreenshotAnnotationView *)self->_screenshotImageView didDrawPenStroke])
  {

    if (!v3)
    {
      BOOL v5 = +[SSSStatisticsManager sharedStatisticsManager];
      [v5 didAccidentallyDraw];

      BOOL v6 = os_log_create("com.apple.screenshotservices", "Editing");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Saving Edits to screenshot: User did make drawing mark and undid or erased all changes", (uint8_t *)&v16, 2u);
      }

      goto LABEL_13;
    }
  }
  else
  {
  }
  BOOL v7 = [(SSSScreenshotView *)self screenshot];
  if ([v7 hasEverBeenEditedForMode:0])
  {
    unsigned int v8 = [(_SSSScreenshotAnnotationView *)self->_screenshotImageView didDrawPenStroke];

    if (!v8) {
      goto LABEL_13;
    }
    uint64_t v9 = +[SSSStatisticsManager sharedStatisticsManager];
    [v9 drewStrokes:v3];

    BOOL v7 = os_log_create("com.apple.screenshotservices", "Editing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134217984;
      int64_t v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Saving Edits to screenshot: User drew %lu strokes", (uint8_t *)&v16, 0xCu);
    }
  }

LABEL_13:
  double v10 = [(SSSScreenshotView *)self screenshot];
  unsigned int v11 = [v10 modelModificationInfo];
  double v12 = [v11 annotations];
  id v13 = [v12 count];

  BOOL v14 = +[SSSStatisticsManager sharedStatisticsManager];
  [v14 logTotalAnnotations:v13];

  double v15 = os_log_create("com.apple.screenshotservices", "Editing");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134217984;
    int64_t v17 = (int64_t)v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Saving Edits to screenshot: User added %lu annotations", (uint8_t *)&v16, 0xCu);
  }
}

- (int64_t)_numberOfDrawingStrokesInScreenshot
{
  int v16 = [(SSSScreenshotView *)self screenshot];
  v2 = [v16 modelModificationInfo];
  int64_t v3 = [v2 annotations];
  id v4 = [v3 count];

  if (v4)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    BOOL v5 = [v16 modelModificationInfo];
    BOOL v6 = [v5 annotations];

    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v6);
          }
          double v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v22 = 0;
          double v23 = &v22;
          uint64_t v24 = 0x2050000000;
          unsigned int v11 = (void *)qword_1000B5730;
          uint64_t v25 = qword_1000B5730;
          if (!qword_1000B5730)
          {
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472;
            v21[2] = sub_100009A30;
            v21[3] = &unk_100099928;
            v21[4] = &v22;
            sub_100009A30((uint64_t)v21);
            unsigned int v11 = (void *)v23[3];
          }
          id v12 = v11;
          _Block_object_dispose(&v22, 8);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = [v10 drawing];
            BOOL v14 = [v13 strokes];
            id v7 = [v14 count];

            goto LABEL_14;
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v17 objects:v26 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v7 = 0;
  }

  return (int64_t)v7;
}

- (BOOL)screenshotEditsSnapshotted
{
  v2 = [(SSSScreenshotView *)self currentView];
  unsigned __int8 v3 = [v2 screenshotEditsSnapshotted];

  return v3;
}

- (AKController)akController
{
  v2 = [(SSSScreenshotView *)self _currentOverlayController];
  unsigned __int8 v3 = [v2 annotationKitController];

  return (AKController *)v3;
}

- (id)_findTextViewFirstResponderUnderView:(id)a3
{
  if ([(SSSScreenshotView *)self _isAncestorOfFirstResponder])
  {
    id v4 = [(SSSScreenshotView *)self firstResponder];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (CGRect)rectToCenterAboveKeyboard
{
  unsigned __int8 v3 = [(SSSScreenshotView *)self _currentOverlayController];
  [v3 rectToCenterAboveKeyboard];
  double x = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  v30.origin.double x = x;
  v30.origin.CGFloat y = v7;
  v30.size.CGFloat width = v9;
  v30.size.CGFloat height = v11;
  v33.origin.double x = CGRectNull.origin.x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  if (!CGRectEqualToRect(v30, v33))
  {
    double v15 = [(SSSScreenshotView *)self currentView];
    -[SSSScreenshotView convertRect:fromView:](self, "convertRect:fromView:", v15, x, v7, v9, v11);
    double x = v16;
    double v7 = v17;
    double v9 = v18;
    double v11 = v19;
  }
  v31.origin.double x = x;
  v31.origin.CGFloat y = v7;
  v31.size.CGFloat width = v9;
  v31.size.CGFloat height = v11;
  if (CGRectIsNull(v31) && ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl()))
  {
    long long v20 = [(SSSScreenshotView *)self _findTextViewFirstResponderUnderView:self];
    id v21 = v20;
    if (v20)
    {
      [v20 bounds];
      -[SSSScreenshotView convertRect:fromView:](self, "convertRect:fromView:", v21);
      double x = v22;
      double v7 = v23;
      double v9 = v24;
      double v11 = v25;
    }
  }
  if (([(SSSScreenshotView *)self _isAncestorOfFirstResponder] & 1) == 0)
  {
    double v11 = height;
    double v9 = width;
    double v7 = y;
    double x = CGRectNull.origin.x;
  }
  double v26 = x;
  double v27 = v7;
  double v28 = v9;
  double v29 = v11;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.double x = v26;
  return result;
}

- (void)_prepareGesturesForOverlayController:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [v4 gestureRecognizers];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        [(SSSScreenshotView *)self addGestureRecognizer:*(void *)(*((void *)&v14 + 1) + 8 * (void)v9)];
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  double v10 = [v4 panGestureRecognizer];
  double v11 = [v4 rotationGestureRecognizer];
  id v12 = [(SSSCropController *)self->_imageCropController panGestureRecognizer];
  id v13 = [(SSSCropController *)self->_imageCropController pinchGestureRecognizer];
  if (v10)
  {
    [v12 requireGestureRecognizerToFail:v10];
    [v13 requireGestureRecognizerToFail:v10];
  }
  if (v11)
  {
    [v12 requireGestureRecognizerToFail:v11];
    [v13 requireGestureRecognizerToFail:v11];
  }
}

- (void)setAnnotationsEnabled:(BOOL)a3
{
  self->_annotationsEnabled = a3;
  -[_SSSScreenshotImageView setAnnotationsEnabled:](self->_screenshotImageView, "setAnnotationsEnabled:");

  [(SSSScreenshotView *)self setNeedsLayout];
}

- (id)_currentOverlayController
{
  v2 = [(SSSScreenshotView *)self currentView];
  unsigned __int8 v3 = [v2 overlayController];

  return v3;
}

- (void)updatePaletteVisibilityIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SSSScreenshotView *)self currentView];
  [v4 updatePaletteVisibilityIfNecessary:v3];
}

- (UIView)viewContainingScreenshotContents
{
  v2 = [(SSSScreenshotView *)self currentView];
  BOOL v3 = [v2 viewWithScreenshotImage];

  return (UIView *)v3;
}

- (UIViewController)viewControllerForOverlayPresentations
{
  BOOL v3 = [(SSSScreenshotView *)self delegate];
  id v4 = [v3 viewControllerForPresentationsFromScreenshotView:self];

  return (UIViewController *)v4;
}

- (UIView)contentSnapshot
{
  BOOL v3 = [(SSSScreenshotView *)self screenshot];
  id v4 = [v3 modelModificationInfo];
  id v5 = v4;
  if (v4)
  {
    [v4 cropInfo];
    double v6 = v14;
    double v7 = v13;
    double v8 = v16;
    double v9 = v15;
  }
  else
  {
    double v8 = 0.0;
    double v9 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
  }

  double v10 = [(SSSScreenshotView *)self currentView];
  double v11 = [v10 resizableSnapshotViewFromRect:1 afterScreenUpdates:v7 withCapInsets:v6, v9, v8, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];

  return (UIView *)v11;
}

- (void)uninstallInterstitialGesture:(id)a3
{
}

- (void)requireAllOtherGestureRecognizersToFailBeforeGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = [(SSSScreenshotView *)self delegate];
  [v5 screenshotView:self hasHighPriorityGesture:v4];
}

- (void)requireGestureRecognizerToFailBeforeAllOtherGestureRecognizers:(id)a3
{
  id v4 = a3;
  id v5 = [(SSSScreenshotView *)self delegate];
  [v5 screenshotView:self noLongerHasHighPriorityGesture:v4];
}

- (void)setGesturesEnabled:(BOOL)a3
{
  self->_gesturesEnabled = a3;
  [(SSSScreenshotView *)self setNeedsLayout];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(SSSScreenshotView *)self currentView];
  [v8 convertPoint:self x:y];
  double v10 = v9;
  double v12 = v11;

  double v13 = [(SSSScreenshotView *)self currentView];
  unsigned int v14 = [v13 pointInside:v7 withEvent:v10, v12];

  int64_t v15 = [(SSSScreenshotView *)self editMode];
  double v16 = &OBJC_IVAR___SSSScreenshotView__pdfCropController;
  if (!v15) {
    double v16 = &OBJC_IVAR___SSSScreenshotView__imageCropController;
  }
  long long v17 = [*(id *)((char *)&self->super.super.super.isa + *v16) cropView];
  [v17 convertPoint:self x:y];
  unsigned int v18 = [v17 pointInside:v7];
  v21.receiver = self;
  v21.super_class = (Class)SSSScreenshotView;
  unsigned int v19 = v14 & -[SSSScreenshotView pointInside:withEvent:](&v21, "pointInside:withEvent:", v7, x, y) | v18;

  return v19;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ((id)[(SSSScreenshotView *)self state] == (id)1
    && (id)[(SSSScreenshotView *)self editMode] == (id)1)
  {
    double v8 = [(_SSSScreenshotPDFView *)self->_screenshotPDFView _pdfView];
    -[SSSScreenshotView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
    double v10 = v9;
    double v12 = v11;

    double v13 = [(_SSSScreenshotPDFView *)self->_screenshotPDFView _pdfView];
    unsigned int v14 = [v13 hitTest:v7 withEvent:v10, v12];
  }
  else
  {
    if ([(SSSScreenshotView *)self state])
    {
      v17.receiver = self;
      v17.super_class = (Class)SSSScreenshotView;
      -[SSSScreenshotView hitTest:withEvent:](&v17, "hitTest:withEvent:", v7, x, y);
      int64_t v15 = (SSSScreenshotView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int64_t v15 = self;
    }
    unsigned int v14 = v15;
  }

  return v14;
}

- (void)setEditMode:(int64_t)a3
{
  if (self->_editMode != a3)
  {
    self->_int64_t editMode = a3;
    p_screenshotImageView = (id *)&self->_screenshotImageView;
    [(_SSSScreenshotImageView *)self->_screenshotImageView clearImageAnalysisTextSelection];
    [(SSSCropController *)self->_pdfCropController setEditMode:a3];
    if (a3 == 2)
    {
      self->_hasEnteredFullPageCropBefore = 1;
    }
    else if (a3 == 1 && self->_hasEnteredFullPageCropBefore)
    {
      [(SSSScreenshotView *)self _layoutPDFViewVerticalContentInsetToMatchImageView];
      double v6 = [(_SSSScreenshotPDFView *)self->_screenshotPDFView _pdfView];
      id v7 = [v6 documentScrollView];

      [v7 contentInset];
      [v7 setContentInset:fmax(v8, 118.0)];
    }
    double v9 = [(SSSCropController *)self->_imageCropController cropView];
    [v9 setHidden:self->_editMode != 0];

    double v10 = [(SSSCropController *)self->_pdfCropController cropView];
    [v10 setHidden:self->_editMode == 0];

    if (!self->_editMode) {
      p_screenshotImageView = (id *)&self->_screenshotPDFView;
    }
    [*p_screenshotImageView setOverlayControllerActive:0];
    double v11 = [(SSSScreenshotView *)self currentView];
    [v11 setOverlayControllerActive:1];

    double v12 = [(SSSScreenshotView *)self screenshot];
    [v12 setLastViewEditMode:a3];

    [(SSSScreenshotView *)self setNeedsLayout];
  }
}

- (void)adjustPDFPositioningToMatchImageIfNecessary
{
  if ((id)[(SSSScreenshotView *)self editMode] == (id)1)
  {
    [(SSSScreenshotView *)self _layoutPDFViewToMatchImageViewIfNeeded];
  }
}

- (void)enterCrop
{
  BOOL v3 = [(SSSScreenshotView *)self currentCropController];
  [v3 enterCrop];

  [(SSSScreenshotView *)self setNeedsLayout];
}

- (void)resetCrop
{
  BOOL v3 = [(SSSScreenshotView *)self currentCropController];
  [v3 resetCrop];

  [(SSSScreenshotView *)self setNeedsLayout];
}

- (void)doneCrop
{
  BOOL v3 = [(SSSScreenshotView *)self currentCropController];
  [v3 doneCrop];

  [(SSSScreenshotView *)self setNeedsLayout];
}

- (void)cancelCrop
{
  BOOL v3 = [(SSSScreenshotView *)self currentCropController];
  [v3 cancelCrop];

  [(SSSScreenshotView *)self setNeedsLayout];
}

- (BOOL)isCropped
{
  v2 = [(SSSScreenshotView *)self currentCropController];
  unsigned __int8 v3 = [v2 isCropped];

  return v3;
}

- (id)_internalPDFView
{
  return [(_SSSScreenshotPDFView *)self->_screenshotPDFView _pdfView];
}

- (id)_imageAnalysisAaButtonIfExists
{
  if (self->_editMode)
  {
    unsigned __int8 v3 = 0;
  }
  else
  {
    id v4 = [(_SSSScreenshotImageView *)self->_screenshotImageView imageInteraction];
    unsigned __int8 v3 = [v4 analysisButton];
  }
  id v5 = [(_SSSScreenshotImageView *)self->_screenshotImageView imageInteraction];
  [v5 setAnalysisButtonPrefersDarkGlyphWhenSelected:1];

  double v6 = +[UIColor whiteColor];
  [v3 setTintColor:v6];

  return v3;
}

- (id)_imageAnalysisAaBarButtonItemIfExists
{
  if (self->_editMode)
  {
    v2 = 0;
  }
  else
  {
    unsigned __int8 v3 = [(_SSSScreenshotImageView *)self->_screenshotImageView imageInteraction];
    v2 = [v3 analysisBarButtonItem];
  }

  return v2;
}

- (id)_visualSearchCornerViewIfExists
{
  unsigned __int8 v3 = [(SSSScreenshotView *)self traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (_SSQuickActionsEnabled() && v4 || self->_editMode)
  {
    id v5 = 0;
  }
  else
  {
    double v6 = [(_SSSScreenshotImageView *)self->_screenshotImageView imageInteraction];
    id v5 = [v6 visualSearchCornerView];
  }

  return v5;
}

- (id)_actionInfoViewIfExists
{
  if (_SSQuickActionsEnabled())
  {
    unsigned __int8 v3 = [(_SSSScreenshotImageView *)self->_screenshotImageView imageInteraction];
    id v4 = v3;
    if (self->_editMode)
    {
      id v5 = 0;
    }
    else
    {
      id v5 = [v3 customLayoutActionInfoView];
      if (v5)
      {
        [v4 setActionInfoEdgeInsets:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
        [v4 setPreferredQuickActionButtonHeight:35.0];
        [v4 setActionInfoLiveTextButtonDisabled:1];
        [v4 setActionInfoVisualSearchCornerViewDisabled:1];
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (int64_t)currentPDFPage
{
  if (self->_editMode) {
    return [(_SSSScreenshotPDFView *)self->_screenshotPDFView currentPDFPage];
  }
  else {
    return 0;
  }
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_viewState
{
  int64_t v3 = [(SSSScreenshotView *)self editMode];
  int64_t v4 = [(SSSScreenshotView *)self currentPDFPage];
  int64_t v5 = v3;
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

- (void)pageChanged:(id)a3
{
  int64_t v4 = [(SSSScreenshotView *)self editMode];
  int64_t v5 = [(_SSSScreenshotPDFView *)self->_screenshotPDFView currentPDFPage];
  double v6 = [(SSSScreenshotView *)self screenshot];
  id v7 = [v6 modelModificationInfoForState:v4, v5];
  double v8 = v7;
  if (v7) {
    [v7 cropInfo];
  }
  else {
    memset(v16, 0, sizeof(v16));
  }
  double v9 = sub_10004C860((double *)v16);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  -[SSSCropController setPageCropRect:](self->_pdfCropController, "setPageCropRect:", v9, v11, v13, v15);
}

- (id)currentView
{
  if (self->_editMode) {
    v2 = &OBJC_IVAR___SSSScreenshotView__screenshotPDFView;
  }
  else {
    v2 = &OBJC_IVAR___SSSScreenshotView__screenshotImageView;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v2);
}

- (id)currentCropController
{
  if (self->_editMode) {
    v2 = &OBJC_IVAR___SSSScreenshotView__pdfCropController;
  }
  else {
    v2 = &OBJC_IVAR___SSSScreenshotView__imageCropController;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v2);
}

- (id)viewModificationInfo
{
  int64_t v3 = [(SSSScreenshotView *)self screenshot];
  id v4 = [(SSSScreenshotView *)self _viewState];
  double v6 = [v3 viewModificationInfoForState:v4, v5];

  return v6;
}

- (id)modelModificationInfo
{
  int64_t v3 = [(SSSScreenshotView *)self screenshot];
  id v4 = [(SSSScreenshotView *)self _viewState];
  double v6 = [v3 modelModificationInfoForState:v4, v5];

  return v6;
}

- (void)promoteViewValueToModelValueForKey:(unint64_t)a3
{
  id v7 = [(SSSScreenshotView *)self screenshot];
  id v5 = [(SSSScreenshotView *)self _viewState];
  [v7 promoteViewValueToModelValueForKey:a3 forState:v5 v6];
}

- (void)undo
{
  id v5 = [(SSSScreenshotView *)self screenshot];
  id v3 = [(SSSScreenshotView *)self _viewState];
  [v5 undoForViewState:v3, v4];
}

- (void)redo
{
  id v5 = [(SSSScreenshotView *)self screenshot];
  id v3 = [(SSSScreenshotView *)self _viewState];
  [v5 redoForViewState:v3, v4];
}

- (BOOL)canUndo
{
  v2 = self;
  id v3 = [(SSSScreenshotView *)self screenshot];
  id v4 = [(SSSScreenshotView *)v2 _viewState];
  LOBYTE(v2) = [v3 canUndoForViewState:v4, v5];

  return (char)v2;
}

- (BOOL)canRedo
{
  v2 = self;
  id v3 = [(SSSScreenshotView *)self screenshot];
  id v4 = [(SSSScreenshotView *)v2 _viewState];
  LOBYTE(v2) = [v3 canRedoForViewState:v4, v5];

  return (char)v2;
}

- (void)revert
{
  id v5 = [(SSSScreenshotView *)self screenshot];
  id v3 = [(SSSScreenshotView *)self _viewState];
  [v5 revertForViewState:v3, v4];
}

- (VKCImageAnalysis)currentImageAnalysis
{
  if ([(SSSScreenshotView *)self editMode])
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v4 = [(_SSSScreenshotImageView *)self->_screenshotImageView imageInteraction];
    id v3 = [v4 analysis];
  }

  return (VKCImageAnalysis *)v3;
}

- (NSString)vsGlyph
{
  v2 = [(_SSSScreenshotImageView *)self->_screenshotImageView imageInteraction];
  id v3 = [v2 visualSearchResultItems];
  uint64_t v4 = [v3 firstObject];
  id v5 = [v4 infoButtonGlyphName];

  return (NSString *)v5;
}

- (NSString)vsGlyphFilled
{
  v2 = [(_SSSScreenshotImageView *)self->_screenshotImageView imageInteraction];
  id v3 = [v2 visualSearchResultItems];
  uint64_t v4 = [v3 firstObject];
  id v5 = [v4 filledInfoButtonGlyphName];

  return (NSString *)v5;
}

- (UIActivity)visionKitFeedbackActivity
{
  if (self->_editMode)
  {
    v2 = 0;
  }
  else
  {
    v2 = [(_SSSScreenshotImageView *)self->_screenshotImageView visionKitFeedbackActivity];
  }

  return (UIActivity *)v2;
}

- (CGRect)cropOverlayViewRectInWindow
{
  [(SSSCropController *)self->_imageCropController cropOverlayViewRectInWindow];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (SSSScreenshot)screenshot
{
  return self->_screenshot;
}

- (BOOL)useTrilinearMinificationFilter
{
  return self->_useTrilinearMinificationFilter;
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)usesOriginalImageAspectRatio
{
  return self->_usesOriginalImageAspectRatio;
}

- (BOOL)gesturesEnabled
{
  return self->_gesturesEnabled;
}

- (BOOL)annotationsEnabled
{
  return self->_annotationsEnabled;
}

- (BOOL)cropHandlesFadedOut
{
  return self->_cropHandlesFadedOut;
}

- (BOOL)isBeingRemoved
{
  return self->_isBeingRemoved;
}

- (void)setIsBeingRemoved:(BOOL)a3
{
  self->_isBeingRemoved = a3;
}

- (void)setExtent:(CGRect)a3
{
  self->_extent = a3;
}

- (SSSScreenshotViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSSScreenshotViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)editMode
{
  return self->_editMode;
}

- (BOOL)showBackgroundForOccludingView
{
  return self->_showBackgroundForOccludingView;
}

- (void)setShowBackgroundForOccludingView:(BOOL)a3
{
  self->_showBackgroundForOccludingView = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_screenshot, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_flashView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_screenshotPDFView, 0);
  objc_storeStrong((id *)&self->_pdfCropController, 0);
  objc_storeStrong((id *)&self->_screenshotImageView, 0);

  objc_storeStrong((id *)&self->_imageCropController, 0);
}

@end