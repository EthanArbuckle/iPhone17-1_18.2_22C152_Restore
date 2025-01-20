@interface MUImageContentViewController
- (AKPageController)pageController;
- (AKRectAnnotation)editingAnnotaiton;
- (BOOL)_canShowWhileLocked;
- (BOOL)_imageIsSize:(CGSize)a3 isSmallerThanSize:(CGSize)a4;
- (BOOL)_imageIsSmallerThanView;
- (BOOL)_placeholderCanBeUsedForBaseImageOfSize:(CGSize)a3;
- (BOOL)acceptSingleTouch:(id)a3;
- (BOOL)canEditContent;
- (BOOL)centersIgnoringContentInsets;
- (BOOL)controllerShouldDetectFormElements:(id)a3;
- (BOOL)didSetup;
- (BOOL)firstLoadZoomToFit;
- (BOOL)inDoubleTapZoom;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)shouldPlaceFormElementAtPoint:(CGPoint)a3 onOverlayAtPageIndex:(unint64_t)a4 forAnnotationController:(id)a5;
- (BOOL)shouldPlaceProposedFormElementAtRect:(CGRect)a3 onOverlayAtPageIndex:(unint64_t)a4 forAnnotationController:(id)a5;
- (BOOL)supportsImageDescriptionEditing;
- (BOOL)usePlaceholderAsDisplayImageIfPossible;
- (BOOL)zoomToFitRestoreValue;
- (CGPoint)_maximumContentOffset;
- (CGPoint)_minimumContentOffset;
- (CGPoint)convertPoint:(CGPoint)a3 fromModelToOverlayWithPageIndex:(unint64_t)a4 forAnnotationController:(id)a5;
- (CGPoint)convertPoint:(CGPoint)a3 fromOverlayToModelWithPageIndex:(unint64_t)a4 forAnnotationController:(id)a5;
- (CGRect)_annotationRectInOverlay:(id)a3 pageIndex:(unint64_t)a4;
- (CGRect)_zoomRectForScale:(double)a3 withCenter:(CGPoint)a4;
- (CGRect)maxPageRectWithPageIndex:(unint64_t)a3 forAnnotationController:(id)a4;
- (CGRect)visibleContentRect;
- (CGRect)visibleContentRectInCoordinateSpace:(id)a3;
- (CGSize)idealContentSizeForScreenSize:(CGSize)a3 windowDecorationSize:(CGSize)a4;
- (CGSize)sourceImagePixelSize;
- (MUImageContentViewController)initWithSourceContent:(id)a3 archivedDataModel:(id)a4 delegate:(id)a5;
- (NSString)originalImageDescription;
- (UIEdgeInsets)edgeInsets;
- (UIImage)imageForAnalysis;
- (UIImage)tentativePlaceholderImage;
- (UIImageView)imageView;
- (UIScrollView)scrollView;
- (UIScrollViewDelegate)scrollViewDelegate;
- (UITapGestureRecognizer)localDoubleTapRecognizer;
- (UIView)combinedContentView;
- (double)_zoomToFitZoomFactorInBounds:(CGRect)a3;
- (double)_zoomToFitZoomFactorIncludingScrollViewEdgeInsets;
- (double)downsampledImageScale;
- (double)maxImageDimension;
- (double)modelBaseScaleFactorOfPageAtIndex:(unint64_t)a3 forAnnotationController:(id)a4;
- (id)contentSnapshot;
- (id)controller:(id)a3 willSetToolbarItems:(id)a4;
- (id)layerContainingQuickBackgroundForLoupeOnOverlayAtPageIndex:(unint64_t)a3 forAnnotationController:(id)a4;
- (id)loadCompletionBlock;
- (id)newContentSnapshotPDFDataIncludingAdornments:(BOOL)a3 atScale:(double)a4 inRect:(CGRect)a5 onOverlayAtPageIndex:(unint64_t)a6 forAnnotationController:(id)a7;
- (id)popoverPresentingViewControllerForAnnotationController:(id)a3;
- (id)sourceContent;
- (id)undoManagerForAnnotationController:(id)a3;
- (int64_t)defaultToolTag;
- (unint64_t)_pageIndexForAnnotation:(id)a3;
- (unint64_t)inkStyle;
- (void)_adjustScrollViewForKeyboardNotification:(id)a3;
- (void)_annotationDidEndEditing:(id)a3;
- (void)_annotationWillBeginEditing:(id)a3;
- (void)_doubleTap:(id)a3;
- (void)_downsampleImageForDisplay:(CGImage *)a3 fromImageSource:(CGImageSource *)a4 withCompletionHandler:(id)a5;
- (void)_installOverlayOfController:(id)a3 forPageAtIndex:(unint64_t)a4;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_prepareToRotate;
- (void)_recoverFromRotation;
- (void)_setImage:(id)a3 withCompletionHandler:(id)a4;
- (void)_setupScrollViewForImageOfScaledSize:(CGSize)a3;
- (void)_uninstallOverlayOfController:(id)a3 forPageAtIndex:(unint64_t)a4;
- (void)_updateMinMaxZoomFactor;
- (void)adjustScrollViewToAccomodateKeyboardStartingFrame:(double)a3 endingFrame:(double)a4 annotationFrame:(double)a5 inOverlayView:(CGFloat)a6 withAnimationDuration:(CGFloat)a7 curve:(CGFloat)a8;
- (void)controllerDidEnterToolMode:(id)a3;
- (void)controllerDidExitToolMode:(id)a3;
- (void)controllerWillDismissSignatureCaptureView:(id)a3;
- (void)controllerWillDismissSignatureManagerView:(id)a3;
- (void)controllerWillShowSignatureCaptureView:(id)a3;
- (void)controllerWillShowSignatureManagerView:(id)a3;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)editCheckpointReachedForAnnotationController:(id)a3;
- (void)editDetectedForAnnotationController:(id)a3;
- (void)installDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 forAnnotationController:(id)a5;
- (void)loadContentWithCompletionBlock:(id)a3;
- (void)penStrokeCompletedForAnnotationController:(id)a3;
- (void)positionSketchOverlay:(id)a3 forAnnotationController:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidZoom:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)setCentersIgnoringContentInsets:(BOOL)a3;
- (void)setCombinedContentView:(id)a3;
- (void)setDidSetup:(BOOL)a3;
- (void)setDownsampledImageScale:(double)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setEditingAnnotaiton:(id)a3;
- (void)setFirstLoadZoomToFit:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setInDoubleTapZoom:(BOOL)a3;
- (void)setInkStyle:(unint64_t)a3;
- (void)setLoadCompletionBlock:(id)a3;
- (void)setLocalDoubleTapRecognizer:(id)a3;
- (void)setMaxImageDimension:(double)a3;
- (void)setPageController:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setScrollViewDelegate:(id)a3;
- (void)setSourceContent:(id)a3;
- (void)setSourceImagePixelSize:(CGSize)a3;
- (void)setTentativePlaceholderImage:(id)a3;
- (void)setUsePlaceholderAsDisplayImageIfPossible:(BOOL)a3;
- (void)setZoomToFitRestoreValue:(BOOL)a3;
- (void)setup;
- (void)teardown;
- (void)uninstallAllAnnotationControllerOverlays;
- (void)uninstallDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 forAnnotationController:(id)a5;
- (void)updateDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 withPriority:(BOOL)a5 forAnnotationController:(id)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MUImageContentViewController

- (MUImageContentViewController)initWithSourceContent:(id)a3 archivedDataModel:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MUImageContentViewController;
  v11 = [(MUContentViewController *)&v18 initWithNibName:0 bundle:0 delegate:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_sourceContent, a3);
    v12->_downsampledImageScale = 1.0;
    v12->_maxImageDimension = 1.79769313e308;
    v12->_usePlaceholderAsDisplayImageIfPossible = v10 == 0;
    v13 = [MEMORY[0x263F24BB8] controllerWithDelegate:v12];
    [(MUContentViewController *)v12 setAnnotationController:v13];

    [(MUImageContentViewController *)v12 setInkStyle:0];
    if (v10)
    {
      v14 = objc_alloc_init(MUImageReader);
      v15 = [(MUContentViewController *)v12 annotationController];
      BOOL v16 = [(MUImageReader *)v14 readAnnotationsFromArchivedModelData:v10 toController:v15];

      if (!v16)
      {
        NSLog(&cfstr_SFailedToReadA.isa, "-[MUImageContentViewController initWithSourceContent:archivedDataModel:delegate:]");
        v12->_usePlaceholderAsDisplayImageIfPossible = 1;
      }
    }
  }

  return v12;
}

- (void)setInkStyle:(unint64_t)a3
{
  self->_inkStyle = a3;
  BOOL v3 = a3 == 0;
  id v4 = [(MUContentViewController *)self annotationController];
  [v4 setUseHighVisibilityDefaultInks:v3];
}

- (UIImage)imageForAnalysis
{
  v2 = [(MUImageContentViewController *)self imageView];
  BOOL v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)dealloc
{
  [(MUImageContentViewController *)self teardown];
  v3.receiver = self;
  v3.super_class = (Class)MUImageContentViewController;
  [(MUImageContentViewController *)&v3 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v46.receiver = self;
  v46.super_class = (Class)MUImageContentViewController;
  [(MUImageContentViewController *)&v46 viewDidLoad];
  objc_super v3 = [MEMORY[0x263F1C550] darkGrayColor];
  id v4 = [(MUImageContentViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [MUImageScrollView alloc];
  v6 = [(MUImageContentViewController *)self view];
  [v6 bounds];
  v7 = -[MUImageScrollView initWithFrame:](v5, "initWithFrame:");
  [(MUImageContentViewController *)self setScrollView:v7];

  v8 = [(MUImageContentViewController *)self scrollView];
  [v8 setPreservesCenterDuringRotation:1];

  id v9 = [(MUImageContentViewController *)self scrollView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v10 = [(MUImageContentViewController *)self scrollView];
  [v10 setDelegate:self];

  [(MUImageContentViewController *)self edgeInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [(MUImageContentViewController *)self scrollView];
  objc_msgSend(v19, "setContentInset:", v12, v14, v16, v18);

  double v20 = *MEMORY[0x263F1D5C8];
  v21 = [(MUImageContentViewController *)self scrollView];
  [v21 setDecelerationRate:v20];

  v22 = [(MUImageContentViewController *)self scrollView];
  [v22 setMaximumZoomScale:1.3];

  v23 = [(MUImageContentViewController *)self scrollView];
  [v23 setMinimumZoomScale:0.1];

  v24 = [(MUImageContentViewController *)self view];
  v25 = [(MUImageContentViewController *)self scrollView];
  [v24 addSubview:v25];

  v26 = _NSDictionaryOfVariableBindings(&cfstr_Scrollview.isa, self->_scrollView, 0);
  v27 = (void *)MEMORY[0x263F08938];
  v28 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_scrollView]|" options:0 metrics:0 views:v26];
  [v27 activateConstraints:v28];

  v29 = (void *)MEMORY[0x263F08938];
  v30 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[_scrollView]|" options:0 metrics:0 views:v26];
  [v29 activateConstraints:v30];

  id v31 = objc_alloc(MEMORY[0x263F1CB60]);
  v32 = [(MUImageContentViewController *)self scrollView];
  [v32 bounds];
  v33 = objc_msgSend(v31, "initWithFrame:");
  [(MUImageContentViewController *)self setCombinedContentView:v33];

  v34 = [(MUImageContentViewController *)self scrollView];
  v35 = [(MUImageContentViewController *)self combinedContentView];
  [v34 addSubview:v35];

  id v36 = objc_alloc(MEMORY[0x263F1C6D0]);
  v37 = [(MUImageContentViewController *)self combinedContentView];
  [v37 bounds];
  v38 = objc_msgSend(v36, "initWithFrame:");
  [(MUImageContentViewController *)self setImageView:v38];

  v39 = [(MUImageContentViewController *)self imageView];
  [v39 setUserInteractionEnabled:1];

  v40 = [(MUImageContentViewController *)self combinedContentView];
  v41 = [(MUImageContentViewController *)self imageView];
  [v40 addSubview:v41];

  v42 = [MEMORY[0x263F08A00] defaultCenter];
  [v42 addObserver:self selector:sel__annotationWillBeginEditing_ name:*MEMORY[0x263F24B90] object:0];

  v43 = [MEMORY[0x263F08A00] defaultCenter];
  [v43 addObserver:self selector:sel__annotationDidEndEditing_ name:*MEMORY[0x263F24B70] object:0];

  v44 = [MEMORY[0x263F08A00] defaultCenter];
  [v44 addObserver:self selector:sel__keyboardWillShow_ name:*MEMORY[0x263F1D488] object:0];

  v45 = [MEMORY[0x263F08A00] defaultCenter];
  [v45 addObserver:self selector:sel__keyboardWillHide_ name:*MEMORY[0x263F1D480] object:0];

  [(MUImageContentViewController *)self setFirstLoadZoomToFit:1];
  [(MUImageContentViewController *)self setZoomToFitRestoreValue:1];
}

- (CGRect)visibleContentRect
{
  objc_super v3 = [(MUImageContentViewController *)self view];
  id v4 = [v3 window];
  [(MUImageContentViewController *)self visibleContentRectInCoordinateSpace:v4];
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
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)visibleContentRectInCoordinateSpace:(id)a3
{
  id v4 = a3;
  double v5 = [(MUImageContentViewController *)self imageView];
  double v6 = [(MUImageContentViewController *)self imageView];
  [v6 bounds];
  objc_msgSend(v5, "convertRect:toCoordinateSpace:", v4);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)contentSnapshot
{
  v2 = [(MUImageContentViewController *)self combinedContentView];
  objc_super v3 = [v2 snapshotViewAfterScreenUpdates:1];

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MUImageContentViewController;
  [(MUImageContentViewController *)&v3 viewDidAppear:a3];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)MUImageContentViewController;
  [(MUImageContentViewController *)&v2 didReceiveMemoryWarning];
}

- (void)setup
{
  NSLog(&cfstr_S_0.isa, a2, "-[MUImageContentViewController setup]");
  [(MUImageContentViewController *)self setDidSetup:1];
  id v36 = [(MUContentViewController *)self annotationController];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__doubleTap_];
  [v3 setNumberOfTapsRequired:2];
  [(MUImageContentViewController *)self setLocalDoubleTapRecognizer:v3];
  id v4 = [(MUImageContentViewController *)self view];
  [v4 addGestureRecognizer:v3];

  double v5 = [(MUImageContentViewController *)self view];
  double v6 = [v36 tapGestureRecognizer];
  [v5 addGestureRecognizer:v6];

  double v7 = [(MUImageContentViewController *)self view];
  double v8 = [v36 doubleTapGestureRecognizer];
  [v7 addGestureRecognizer:v8];

  double v9 = [(MUImageContentViewController *)self view];
  double v10 = [v36 pressGestureRecognizer];
  [v9 addGestureRecognizer:v10];

  double v11 = [(MUImageContentViewController *)self view];
  double v12 = [v36 panGestureRecognizer];
  [v11 addGestureRecognizer:v12];

  double v13 = [(MUImageContentViewController *)self view];
  double v14 = [v36 rotationGestureRecognizer];
  [v13 addGestureRecognizer:v14];

  double v15 = [v36 tapGestureRecognizer];
  [v15 requireGestureRecognizerToFail:v3];

  double v16 = [v36 doubleTapGestureRecognizer];
  [v3 requireGestureRecognizerToFail:v16];

  double v17 = [v36 panGestureRecognizer];
  [v3 requireGestureRecognizerToFail:v17];

  double v18 = [(MUImageContentViewController *)self scrollView];
  v19 = [v18 panGestureRecognizer];
  double v20 = [v36 panGestureRecognizer];
  [v19 requireGestureRecognizerToFail:v20];

  v21 = [(MUImageContentViewController *)self scrollView];
  v22 = [v21 panGestureRecognizer];
  v23 = [v36 rotationGestureRecognizer];
  [v22 requireGestureRecognizerToFail:v23];

  v24 = [(MUImageContentViewController *)self scrollView];
  v25 = [v24 pinchGestureRecognizer];
  v26 = [v36 panGestureRecognizer];
  [v25 requireGestureRecognizerToFail:v26];

  v27 = [(MUImageContentViewController *)self scrollView];
  v28 = [v27 pinchGestureRecognizer];
  v29 = [v36 rotationGestureRecognizer];
  [v28 requireGestureRecognizerToFail:v29];

  v30 = [v36 modelController];
  id v31 = [v30 pageModelControllers];
  uint64_t v32 = [v31 count];

  if (!v32)
  {
    v33 = objc_opt_new();
    v34 = [v36 modelController];
    v35 = [v34 mutableArrayValueForKey:@"pageModelControllers"];
    [v35 addObject:v33];
  }
  [v36 setCurrentPageIndex:0];
}

- (void)teardown
{
  NSLog(&cfstr_S_0.isa, a2, "-[MUImageContentViewController teardown]");
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  if ([(MUImageContentViewController *)self didSetup])
  {
    [(MUImageContentViewController *)self setDidSetup:0];
    if ([(MUImageContentViewController *)self isViewLoaded])
    {
      id v4 = [(MUImageContentViewController *)self view];
      double v5 = [(MUImageContentViewController *)self localDoubleTapRecognizer];
      [v4 removeGestureRecognizer:v5];

      double v6 = [(MUContentViewController *)self annotationController];
      if (v6)
      {
        double v7 = [(MUImageContentViewController *)self view];
        double v8 = [v6 tapGestureRecognizer];
        [v7 removeGestureRecognizer:v8];

        double v9 = [(MUImageContentViewController *)self view];
        double v10 = [v6 doubleTapGestureRecognizer];
        [v9 removeGestureRecognizer:v10];

        double v11 = [(MUImageContentViewController *)self view];
        double v12 = [v6 pressGestureRecognizer];
        [v11 removeGestureRecognizer:v12];

        double v13 = [(MUImageContentViewController *)self view];
        double v14 = [v6 panGestureRecognizer];
        [v13 removeGestureRecognizer:v14];

        double v15 = [(MUImageContentViewController *)self view];
        double v16 = [v6 rotationGestureRecognizer];
        [v15 removeGestureRecognizer:v16];

        [v6 teardown];
        [(MUContentViewController *)self setAnnotationController:0];
      }
    }
    [(MUImageContentViewController *)self setLocalDoubleTapRecognizer:0];
  }
  if ([(MUImageContentViewController *)self isViewLoaded])
  {
    double v17 = [(MUImageContentViewController *)self scrollView];
    [v17 setDelegate:0];

    double v18 = [(MUImageContentViewController *)self scrollView];
    [v18 removeFromSuperview];

    [(MUImageContentViewController *)self setScrollView:0];
  }
}

- (void)loadContentWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MUImageContentViewController *)self sourceContent];
  [(MUImageContentViewController *)self _setImage:v5 withCompletionHandler:v4];
}

- (CGSize)idealContentSizeForScreenSize:(CGSize)a3 windowDecorationSize:(CGSize)a4
{
  double v4 = a3.width - a4.width;
  double v5 = a3.height - a4.height;
  [(MUImageContentViewController *)self contentSize];
  double v8 = v7 * (v4 / v6);
  double v9 = v6 * (v5 / v7);
  if (v6 / v7 < v4 / v5) {
    double v8 = v5;
  }
  else {
    double v9 = v4;
  }
  BOOL v10 = v9 > v6;
  if (v8 > v7) {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    double v6 = v9;
    double v7 = v8;
  }
  double v11 = fmax(v6, 32.0);
  double v12 = fmax(v7, 32.0);
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  p_edgeInsets = &self->_edgeInsets;
  double v9 = self->_edgeInsets.top;
  if (self->_edgeInsets.left == a3.left && v9 == top && self->_edgeInsets.right == a3.right)
  {
    double v9 = self->_edgeInsets.bottom;
    p_edgeInsets->double top = top;
    self->_edgeInsets.double left = a3.left;
    self->_edgeInsets.double bottom = a3.bottom;
    self->_edgeInsets.double right = a3.right;
    if (v9 == a3.bottom) {
      goto LABEL_11;
    }
  }
  else
  {
    p_edgeInsets->double top = top;
    self->_edgeInsets.double left = a3.left;
    self->_edgeInsets.double bottom = a3.bottom;
    self->_edgeInsets.double right = a3.right;
  }
  double v12 = [(MUImageContentViewController *)self scrollView];
  objc_msgSend(v12, "setContentInset:", top, left, bottom, right);

  double v13 = [(MUImageContentViewController *)self scrollView];
  objc_msgSend(v13, "setScrollIndicatorInsets:", top, left, bottom, right);

LABEL_11:
  [(MUImageContentViewController *)self _updateMinMaxZoomFactor];
}

- (void)_installOverlayOfController:(id)a3 forPageAtIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 setOverlayShouldPixelate:1];
  if (([v6 isOverlayViewLoadedAtIndex:a4] & 1) == 0) {
    [v6 prepareOverlayAtIndex:a4];
  }
  double v7 = [v6 overlayViewAtIndex:a4];
  double v8 = [(MUImageContentViewController *)self combinedContentView];
  double v9 = [v7 superview];

  if (v9 != v8)
  {
    [(UIImageView *)self->_imageView bounds];
    -[UIImageView convertRect:toView:](self->_imageView, "convertRect:toView:", v8);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    long long v21 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v25.a = *MEMORY[0x263F000D0];
    long long v20 = *(_OWORD *)&v25.a;
    *(_OWORD *)&v25.c = v21;
    *(_OWORD *)&v25.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    long long v19 = *(_OWORD *)&v25.tx;
    CGAffineTransformMakeScale(&t2, 1.0, -1.0);
    *(_OWORD *)&t1.a = v20;
    *(_OWORD *)&t1.c = v21;
    *(_OWORD *)&t1.tx = v19;
    CGAffineTransformConcat(&v25, &t1, &t2);
    double v18 = [v7 layer];
    objc_msgSend(v18, "setAnchorPoint:", 0.5, 0.5);

    CGAffineTransform v22 = v25;
    [v7 setTransform:&v22];
    objc_msgSend(v7, "setFrame:", v11, v13, v15, v17);
    [v8 addSubview:v7];
  }
}

- (void)_uninstallOverlayOfController:(id)a3 forPageAtIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 isOverlayViewLoadedAtIndex:a4])
  {
    double v5 = [v6 overlayViewAtIndex:a4];
    [v6 relinquishOverlayAtIndex:a4];
    [v5 removeFromSuperview];
  }
}

- (void)uninstallAllAnnotationControllerOverlays
{
  id v7 = [(MUContentViewController *)self annotationController];
  objc_super v3 = [v7 modelController];
  double v4 = [v3 pageModelControllers];
  uint64_t v5 = [v4 count];

  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
      [(MUImageContentViewController *)self _uninstallOverlayOfController:v7 forPageAtIndex:i];
  }
  [MEMORY[0x263F158F8] commit];
}

- (BOOL)canEditContent
{
  if (![(MUImageContentViewController *)self didSetup]) {
    return 0;
  }
  objc_super v3 = [(MUImageContentViewController *)self imageView];
  double v4 = [v3 image];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)acceptSingleTouch:(id)a3
{
  return 0;
}

- (int64_t)defaultToolTag
{
  return 764017;
}

- (void)_setImage:(id)a3 withCompletionHandler:(id)a4
{
  CFDataRef v6 = (const __CFData *)a3;
  id v7 = a4;
  if (!v6)
  {
    NSLog(&cfstr_SCouldNotSetIm.isa, "-[MUImageContentViewController _setImage:withCompletionHandler:]", 0);
    goto LABEL_29;
  }
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v8 = CGImageSourceCreateWithData(v6, 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = (CGImage *)[(__CFData *)v6 CGImage];
        v34[3] = (uint64_t)v23;
        CGImageRetain(v23);
      }
      goto LABEL_8;
    }
    double v8 = CGImageSourceCreateWithURL(v6, 0);
  }
  v30[3] = (uint64_t)v8;
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v8, 0, 0);
  v34[3] = (uint64_t)ImageAtIndex;
LABEL_8:
  double v10 = (CGImage *)v34[3];
  if (v10)
  {
    size_t Width = CGImageGetWidth(v10);
    size_t Height = CGImageGetHeight((CGImageRef)v34[3]);
    double v13 = (CGImageSource *)v30[3];
    if (v13)
    {
      CFDictionaryRef v14 = CGImageSourceCopyPropertiesAtIndex(v13, 0, 0);
      CFDictionaryRef v15 = v14;
      if (v14)
      {
        double v16 = (const void *)*MEMORY[0x263F0F4C8];
        if (CFDictionaryContainsKey(v14, (const void *)*MEMORY[0x263F0F4C8]))
        {
          CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v15, v16);
          int valuePtr = 0;
          if (Value)
          {
            if (CFNumberGetValue(Value, kCFNumberIntType, &valuePtr))
            {
              if ((valuePtr - 5) >= 4) {
                size_t v18 = Height;
              }
              else {
                size_t v18 = Width;
              }
              if ((valuePtr - 5) < 4) {
                size_t Width = Height;
              }
              size_t Height = v18;
            }
          }
        }
        CFRelease(v15);
      }
    }
    -[MUImageContentViewController setSourceImagePixelSize:](self, "setSourceImagePixelSize:", (double)Width, (double)Height);
    uint64_t v19 = v34[3];
    uint64_t v20 = v30[3];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __64__MUImageContentViewController__setImage_withCompletionHandler___block_invoke;
    v24[3] = &unk_2649C2CF0;
    v26 = &v33;
    v27 = &v29;
    v24[4] = self;
    id v25 = v7;
    [(MUImageContentViewController *)self _downsampleImageForDisplay:v19 fromImageSource:v20 withCompletionHandler:v24];
  }
  else
  {
    long long v21 = (const void *)v30[3];
    if (v21)
    {
      CFRelease(v21);
      uint64_t v22 = v34[3];
    }
    else
    {
      uint64_t v22 = 0;
    }
    NSLog(&cfstr_SFailedToGetAC.isa, "-[MUImageContentViewController _setImage:withCompletionHandler:]", v22);
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
LABEL_29:
}

void __64__MUImageContentViewController__setImage_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  CGImageRelease(*(CGImageRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  id v7 = *(const void **)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v7)
  {
    CFRelease(v7);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  if (!v6)
  {
    double v8 = [*(id *)(a1 + 32) imageView];
    [v8 setImage:v5];

    double v9 = [*(id *)(a1 + 32) annotationController];
    [*(id *)(a1 + 32) _installOverlayOfController:v9 forPageAtIndex:0];
    double v10 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v11 = [v10 userInterfaceIdiom];

    if (v11 != 1)
    {
      double v12 = [MEMORY[0x263F1C5C0] currentDevice];
      if ((unint64_t)([v12 orientation] - 1) >= 2)
      {
      }
      else
      {
        double v13 = [*(id *)(a1 + 32) parentViewController];
        CFDictionaryRef v14 = [v13 view];
        [v14 safeAreaInsets];
        double v16 = v15;

        if (v16 <= 0.0)
        {
          [*(id *)(a1 + 32) setLoadCompletionBlock:*(void *)(a1 + 40)];
          dispatch_time_t v17 = dispatch_time(0, 200000000);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __64__MUImageContentViewController__setImage_withCompletionHandler___block_invoke_2;
          block[3] = &unk_2649C2828;
          block[4] = *(void *)(a1 + 32);
          dispatch_after(v17, MEMORY[0x263EF83A0], block);
LABEL_12:

          goto LABEL_13;
        }
      }
    }
    uint64_t v18 = *(void *)(a1 + 40);
    if (v18) {
      (*(void (**)(void))(v18 + 16))();
    }
    goto LABEL_12;
  }
  NSLog(&stru_26E182208.isa, v6);
LABEL_13:
}

void __64__MUImageContentViewController__setImage_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) loadCompletionBlock];

  if (v2)
  {
    objc_super v3 = [*(id *)(a1 + 32) loadCompletionBlock];
    v3[2]();

    double v4 = *(void **)(a1 + 32);
    [v4 setLoadCompletionBlock:0];
  }
}

- (void)viewDidLayoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)MUImageContentViewController;
  [(MUImageContentViewController *)&v24 viewDidLayoutSubviews];
  uint64_t v3 = [(MUImageContentViewController *)self loadCompletionBlock];
  if (v3)
  {
    double v4 = (void *)v3;
    id v5 = [(MUImageContentViewController *)self parentViewController];
    id v6 = [v5 view];
    [v6 safeAreaInsets];
    double v8 = v7;

    if (v8 != 0.0)
    {
      double v9 = [(MUImageContentViewController *)self loadCompletionBlock];
      [(MUImageContentViewController *)self setLoadCompletionBlock:0];
      dispatch_time_t v10 = dispatch_time(0, 0);
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      uint64_t v20 = __53__MUImageContentViewController_viewDidLayoutSubviews__block_invoke;
      long long v21 = &unk_2649C2D18;
      uint64_t v22 = self;
      id v23 = v9;
      id v11 = v9;
      dispatch_after(v10, MEMORY[0x263EF83A0], &v18);
    }
  }
  [(MUImageContentViewController *)self _updateMinMaxZoomFactor];
  if ([(MUImageContentViewController *)self firstLoadZoomToFit])
  {
    BOOL v12 = [(MUImageContentViewController *)self _imageIsSmallerThanView];
    double v13 = 1.0;
    if (!v12) {
      [(MUImageContentViewController *)self _zoomToFitZoomFactor];
    }
    [(UIScrollView *)self->_scrollView setZoomScale:v13];
  }
  [(UIScrollView *)self->_scrollView zoomScale];
  double v15 = v14;
  [(UIScrollView *)self->_scrollView minimumZoomScale];
  if (v15 < v16) {
    double v15 = v16;
  }
  [(UIScrollView *)self->_scrollView maximumZoomScale];
  if (v15 < v17) {
    double v17 = v15;
  }
  [(UIScrollView *)self->_scrollView setZoomScale:v17];
}

uint64_t __53__MUImageContentViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) _updateMinMaxZoomFactor];
  char v2 = [*(id *)(a1 + 32) _imageIsSmallerThanView];
  double v3 = 1.0;
  if ((v2 & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "_zoomToFitZoomFactor", 1.0);
  }
  double v4 = *(void **)(*(void *)(a1 + 32) + 1064);
  return [v4 setZoomScale:v3];
}

- (void)_setupScrollViewForImageOfScaledSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(MUImageContentViewController *)self imageView];
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, width, height);

  double v7 = [(MUImageContentViewController *)self combinedContentView];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, width, height);

  id v13 = [(MUImageContentViewController *)self scrollView];
  double v8 = [(MUImageContentViewController *)self combinedContentView];
  [v8 frame];
  objc_msgSend(v13, "setContentSize:", v9, v10);

  [(MUImageContentViewController *)self _updateMinMaxZoomFactor];
  BOOL v11 = [(MUImageContentViewController *)self _imageIsSmallerThanView];
  double v12 = 1.0;
  if (!v11) {
    [(MUImageContentViewController *)self _zoomToFitZoomFactor];
  }
  [v13 setZoomScale:v12];
  [(MUImageContentViewController *)self setFirstLoadZoomToFit:1];
}

- (void)_downsampleImageForDisplay:(CGImage *)a3 fromImageSource:(CGImageSource *)a4 withCompletionHandler:(id)a5
{
  double v8 = (void (**)(id, uint64_t, void))a5;
  [(MUImageContentViewController *)self sourceImagePixelSize];
  double v11 = v9;
  double v12 = v10;
  if (v9 >= v10) {
    double v13 = v9;
  }
  else {
    double v13 = v10;
  }
  BOOL v14 = -[MUImageContentViewController _placeholderCanBeUsedForBaseImageOfSize:](self, "_placeholderCanBeUsedForBaseImageOfSize:");
  double v15 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  objc_super v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  if (v14)
  {
    double v15 = [(MUImageContentViewController *)self tentativePlaceholderImage];
  }
  id v48 = v15;
  [(MUImageContentViewController *)self setTentativePlaceholderImage:0];
  if (v14)
  {
    [(id)v44[5] size];
    double v17 = v16;
    [(id)v44[5] size];
    if (v17 >= v18) {
      double v19 = v17;
    }
    else {
      double v19 = v18;
    }
  }
  else
  {
    [(MUImageContentViewController *)self maxImageDimension];
    if (v13 <= v20)
    {
      double v21 = 1.0;
      double v22 = v11;
      goto LABEL_14;
    }
    [(MUImageContentViewController *)self maxImageDimension];
  }
  double v21 = v19 / v13;
  double v22 = v11 * v21;
  double v12 = v12 * v21;
LABEL_14:
  id v23 = [(MUContentViewController *)self delegate];
  char v24 = objc_opt_respondsToSelector();
  double v26 = v21;
  if (v24)
  {
    objc_msgSend(v23, "adjustedSourceImageSize", v21);
    double v25 = v27;
    BOOL v28 = v27 == 0.0;
    double v26 = v21;
    if (!v28) {
      double v26 = v11 / v25;
    }
  }
  -[MUImageContentViewController setDownsampledImageScale:](self, "setDownsampledImageScale:", v26, v25);
  -[MUImageContentViewController _setupScrollViewForImageOfScaledSize:](self, "_setupScrollViewForImageOfScaledSize:", v22, v12);
  if (v8)
  {
    if (v14)
    {
      v8[2](v8, v44[5], 0);
    }
    else
    {
      CFDictionaryRef v29 = CGImageSourceCopyPropertiesAtIndex(a4, 0, 0);
      v30 = [(__CFDictionary *)v29 valueForKey:*MEMORY[0x263F0F4C8]];
      uint64_t v31 = v30;
      if (v21 >= 1.0 && [v30 longLongValue] < 2)
      {
        uint64_t v33 = [MEMORY[0x263F1C6B0] imageWithCGImage:a3];
        v34 = (void *)v44[5];
        v44[5] = v33;

        v8[2](v8, v44[5], 0);
      }
      else
      {
        uint64_t v32 = dispatch_get_global_queue(33, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __97__MUImageContentViewController__downsampleImageForDisplay_fromImageSource_withCompletionHandler___block_invoke;
        block[3] = &unk_2649C2D68;
        double v39 = v22;
        double v40 = v12;
        double v41 = v21;
        v37 = &v43;
        v38 = a4;
        v42 = a3;
        uint64_t v36 = v8;
        dispatch_async(v32, block);
      }
    }
  }

  _Block_object_dispose(&v43, 8);
}

void __97__MUImageContentViewController__downsampleImageForDisplay_fromImageSource_withCompletionHandler___block_invoke(uint64_t a1)
{
  v32[8] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 48))
  {
    uint64_t v2 = *MEMORY[0x263F0F5B8];
    uint64_t v3 = MEMORY[0x263EFFA88];
    v32[0] = MEMORY[0x263EFFA88];
    uint64_t v4 = *MEMORY[0x263F0F638];
    v31[0] = v2;
    v31[1] = v4;
    double v5 = *(double *)(a1 + 56);
    if (v5 < *(double *)(a1 + 64)) {
      double v5 = *(double *)(a1 + 64);
    }
    id v6 = [NSNumber numberWithDouble:v5];
    v32[1] = v6;
    v31[2] = *MEMORY[0x263F0F628];
    double v7 = [NSNumber numberWithInteger:vcvtpd_s64_f64(1.0 / *(double *)(a1 + 72))];
    uint64_t v8 = *MEMORY[0x263F0F650];
    v32[2] = v7;
    v32[3] = v3;
    uint64_t v9 = *MEMORY[0x263F0F5A8];
    v31[3] = v8;
    v31[4] = v9;
    v32[4] = v3;
    v32[5] = &unk_26E189FA8;
    uint64_t v10 = *MEMORY[0x263F0F620];
    v31[5] = *MEMORY[0x263F0F5E8];
    v31[6] = v10;
    v31[7] = *MEMORY[0x263F0F5F8];
    v32[6] = v3;
    v32[7] = v3;
    CFDictionaryRef v11 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:8];

    CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(*(CGImageSourceRef *)(a1 + 48), 0, v11);
    if (ThumbnailAtIndex)
    {
      double v13 = ThumbnailAtIndex;
      uint64_t v14 = [MEMORY[0x263F1C6B0] imageWithCGImage:ThumbnailAtIndex];
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      double v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      CGImageRelease(v13);
    }
  }
  else
  {
    double v17 = [MEMORY[0x263F1C6B0] imageWithCGImage:*(void *)(a1 + 80)];
    CFDictionaryRef v11 = [MEMORY[0x263F1C688] defaultFormat];
    [(__CFDictionary *)v11 setScale:1.0];
    double v18 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:format:", v11, *(double *)(a1 + 56), *(double *)(a1 + 64));
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __97__MUImageContentViewController__downsampleImageForDisplay_fromImageSource_withCompletionHandler___block_invoke_68;
    v28[3] = &unk_2649C2CC8;
    id v29 = v17;
    long long v30 = *(_OWORD *)(a1 + 56);
    id v19 = v17;
    uint64_t v20 = [v18 imageWithActions:v28];
    uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
    double v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __97__MUImageContentViewController__downsampleImageForDisplay_fromImageSource_withCompletionHandler___block_invoke_2;
  v25[3] = &unk_2649C2D40;
  id v23 = *(id *)(a1 + 32);
  uint64_t v24 = *(void *)(a1 + 40);
  id v26 = v23;
  uint64_t v27 = v24;
  dispatch_async(MEMORY[0x263EF83A0], v25);
}

uint64_t __97__MUImageContentViewController__downsampleImageForDisplay_fromImageSource_withCompletionHandler___block_invoke_68(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __97__MUImageContentViewController__downsampleImageForDisplay_fromImageSource_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

- (BOOL)_placeholderCanBeUsedForBaseImageOfSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(MUImageContentViewController *)self tentativePlaceholderImage];
  [v6 size];
  double v8 = v7;
  double v10 = v9;
  [(MUImageContentViewController *)self maxImageDimension];
  BOOL usePlaceholderAsDisplayImageIfPossible = 0;
  if (v6)
  {
    if (v8 >= v10) {
      double v13 = v8;
    }
    else {
      double v13 = v10;
    }
    if (v13 >= v11 && v8 <= width && v10 <= height && vabdd_f64(v8 / v10, width / height) < 0.0005) {
      BOOL usePlaceholderAsDisplayImageIfPossible = self->_usePlaceholderAsDisplayImageIfPossible;
    }
  }

  return usePlaceholderAsDisplayImageIfPossible;
}

- (double)_zoomToFitZoomFactorIncludingScrollViewEdgeInsets
{
  [(UIScrollView *)self->_scrollView bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIScrollView *)self->_scrollView contentInset];
  -[MUImageContentViewController _zoomToFitZoomFactorInBounds:](self, "_zoomToFitZoomFactorInBounds:", v4 + v12, v6 + v11, v8 - (v12 + v14), v10 - (v11 + v13));
  return result;
}

- (double)_zoomToFitZoomFactorInBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = CGRectGetWidth(a3);
  [(UIImageView *)self->_imageView bounds];
  double v9 = v8 / CGRectGetWidth(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double v10 = CGRectGetHeight(v13);
  [(UIImageView *)self->_imageView bounds];
  double result = v10 / CGRectGetHeight(v14);
  if (v9 < result) {
    double result = v9;
  }
  if (result == 0.0) {
    return 0.0001;
  }
  return result;
}

- (void)_doubleTap:(id)a3
{
  id v14 = a3;
  double v4 = [(MUImageContentViewController *)self scrollView];
  [v4 zoomScale];
  double v6 = v5;
  [v4 maximumZoomScale];
  double v8 = v7;
  [(MUImageContentViewController *)self _zoomToFitZoomFactor];
  double v10 = v9;
  if ([(MUImageContentViewController *)self _imageIsSmallerThanView])
  {
    double v11 = 1.0;
    if (v6 == 1.0) {
      double v11 = v10;
    }
  }
  else
  {
    [v4 setScrollEnabled:1];
    if (vabdd_f64(v6, v10) >= 0.0005) {
      double v11 = v10;
    }
    else {
      double v11 = v8;
    }
  }
  if (v11 < v8) {
    double v8 = v11;
  }
  if (vabdd_f64(v8, v6) >= 0.0005)
  {
    [v14 locationInView:self->_imageView];
    -[MUImageContentViewController _zoomRectForScale:withCenter:](self, "_zoomRectForScale:withCenter:", v8, v12, v13);
    self->_inDoubleTapZoom = 1;
    objc_msgSend(v4, "zoomToRect:animated:", 1);
    self->_inDoubleTapZoom = 0;
  }
}

- (CGRect)_zoomRectForScale:(double)a3 withCenter:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v7 = [(MUImageContentViewController *)self scrollView];
  [v7 frame];
  double v9 = v8 / a3;
  [v7 frame];
  double v11 = v10 / a3;

  double v12 = x - v11 * 0.5;
  double v13 = y - v9 * 0.5;
  double v14 = v11;
  double v15 = v9;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (BOOL)_imageIsSmallerThanView
{
  [(UIImageView *)self->_imageView bounds];
  double v4 = v3;
  double v6 = v5;
  [(UIScrollView *)self->_scrollView bounds];
  return [(MUImageContentViewController *)self _imageIsSize:v4 isSmallerThanSize:v6];
}

- (BOOL)_imageIsSize:(CGSize)a3 isSmallerThanSize:(CGSize)a4
{
  return a3.height < a4.height && a3.width < a4.width;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(MUImageContentViewController *)self _prepareToRotate];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __83__MUImageContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_2649C2D90;
  *(double *)&v9[5] = width;
  *(double *)&v9[6] = height;
  v9[4] = self;
  [v7 animateAlongsideTransition:v9 completion:0];
  v8.receiver = self;
  v8.super_class = (Class)MUImageContentViewController;
  -[MUImageContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

void __83__MUImageContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v7 = *(double *)(a1 + 40);
  double v8 = *(double *)(a1 + 48);

  if (v7 == v4 && v8 == v6)
  {
    double v10 = *(void **)(a1 + 32);
    [v10 _recoverFromRotation];
  }
}

- (void)_prepareToRotate
{
  [(UIScrollView *)self->_scrollView bounds];
  double MidX = CGRectGetMidX(v11);
  [(UIScrollView *)self->_scrollView bounds];
  -[UIScrollView convertPoint:toView:](self->_scrollView, "convertPoint:toView:", self->_combinedContentView, MidX, CGRectGetMidY(v12));
  self->_pointToCenterAfterRotation.double x = v4;
  self->_pointToCenterAfterRotation.double y = v5;
  [(MUImageContentViewController *)self _zoomToFitZoomFactor];
  double v7 = v6;
  id v9 = [(MUImageContentViewController *)self scrollView];
  [v9 zoomScale];
  self->_wasZoomToFit = vabdd_f64(v7, v8) < 0.0005;
}

- (void)_recoverFromRotation
{
  double v3 = 1.0;
  if (![(MUImageContentViewController *)self _imageIsSmallerThanView])
  {
    [(MUImageContentViewController *)self _zoomToFitZoomFactor];
    double v3 = v4;
  }
  [(UIScrollView *)self->_scrollView bounds];
  double v6 = v5;
  double v8 = v7;
  imageView = self->_imageView;
  [(UIImageView *)imageView bounds];
  -[UIImageView convertRect:toView:](imageView, "convertRect:toView:", self->_scrollView);
  if (!self->_wasZoomToFit && (v6 >= v10 ? (BOOL v12 = v8 < v11) : (BOOL v12 = 1), v12))
  {
    -[UIScrollView convertPoint:fromView:](self->_scrollView, "convertPoint:fromView:", self->_combinedContentView, self->_pointToCenterAfterRotation.x, self->_pointToCenterAfterRotation.y);
    double v14 = v13;
    double v16 = v15;
    [(UIScrollView *)self->_scrollView bounds];
    double v18 = v14 - v17 * 0.5;
    [(UIScrollView *)self->_scrollView bounds];
    double v20 = v16 - v19 * 0.5;
    [(MUImageContentViewController *)self _maximumContentOffset];
    double v22 = v21;
    double v24 = v23;
    [(MUImageContentViewController *)self _minimumContentOffset];
    if (v22 >= v18) {
      double v27 = v18;
    }
    else {
      double v27 = v22;
    }
    if (v25 < v27) {
      double v25 = v27;
    }
    if (v24 >= v20) {
      double v28 = v20;
    }
    else {
      double v28 = v24;
    }
    if (v26 < v28) {
      double v26 = v28;
    }
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v25, v26);
  }
  else
  {
    [(UIScrollView *)self->_scrollView setZoomScale:1 animated:v3];
  }
  [(MUImageContentViewController *)self _updateMinMaxZoomFactor];
}

- (CGPoint)_maximumContentOffset
{
  [(UIScrollView *)self->_scrollView contentSize];
  double v4 = v3;
  double v6 = v5;
  [(UIScrollView *)self->_scrollView bounds];
  double v8 = v4 - v7;
  double v10 = v6 - v9;
  result.double y = v10;
  result.double x = v8;
  return result;
}

- (void)_updateMinMaxZoomFactor
{
  [(MUImageContentViewController *)self _zoomToFitZoomFactor];
  double v4 = v3;
  [(MUImageContentViewController *)self _zoomToFitZoomFactorIncludingScrollViewEdgeInsets];
  double v6 = v5;
  BOOL v7 = [(MUImageContentViewController *)self _imageIsSmallerThanView];
  double v8 = fmax(v4, 1.0);
  double v9 = fmin(v6, 1.3);
  if (v7) {
    double v10 = v8;
  }
  else {
    double v10 = 1.3;
  }
  if (v7) {
    double v11 = 1.0;
  }
  else {
    double v11 = v9;
  }
  [(UIScrollView *)self->_scrollView setMinimumZoomScale:v11];
  [(UIScrollView *)self->_scrollView setMaximumZoomScale:v10];
  [(UIScrollView *)self->_scrollView zoomScale];
  if (v12 < v11)
  {
    scrollView = self->_scrollView;
    [(UIScrollView *)scrollView setZoomScale:v11];
  }
}

- (CGPoint)_minimumContentOffset
{
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGRect)_annotationRectInOverlay:(id)a3 pageIndex:(unint64_t)a4
{
  [a3 rectangle];
  CGFloat x = v29.origin.x;
  CGFloat y = v29.origin.y;
  CGFloat width = v29.size.width;
  CGFloat height = v29.size.height;
  double MinX = CGRectGetMinX(v29);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v30);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v31);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v32);
  double v14 = [(MUContentViewController *)self annotationController];
  -[MUImageContentViewController convertPoint:fromModelToOverlayWithPageIndex:forAnnotationController:](self, "convertPoint:fromModelToOverlayWithPageIndex:forAnnotationController:", a4, v14, MinX, MinY);
  double v16 = v15;
  double v18 = v17;

  double v19 = [(MUContentViewController *)self annotationController];
  -[MUImageContentViewController convertPoint:fromModelToOverlayWithPageIndex:forAnnotationController:](self, "convertPoint:fromModelToOverlayWithPageIndex:forAnnotationController:", a4, v19, MaxX, MaxY);
  double v21 = v20;
  double v23 = v22;

  double v26 = v16;
  double v27 = v18;
  double v24 = v21 - v16;
  double v25 = v23 - v18;
  return CGRectStandardize(*(CGRect *)&v26);
}

- (void)_annotationWillBeginEditing:(id)a3
{
  double v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x263F24B78]];

  [(MUImageContentViewController *)self setEditingAnnotaiton:v5];
}

- (void)_annotationDidEndEditing:(id)a3
{
}

- (unint64_t)_pageIndexForAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = [(MUContentViewController *)self annotationController];
  double v6 = [v5 modelController];
  BOOL v7 = [v6 pageModelControllerForAnnotation:v4];

  double v8 = [v5 modelController];
  double v9 = [v8 pageModelControllers];
  unint64_t v10 = [v9 indexOfObject:v7];

  return v10;
}

- (void)_keyboardWillShow:(id)a3
{
  [(MUImageContentViewController *)self _adjustScrollViewForKeyboardNotification:a3];
  id v4 = [(MUImageContentViewController *)self view];
  [v4 setNeedsLayout];

  [(MUImageContentViewController *)self setZoomToFitRestoreValue:[(MUImageContentViewController *)self firstLoadZoomToFit]];
  [(MUImageContentViewController *)self setFirstLoadZoomToFit:0];
}

- (void)_keyboardWillHide:(id)a3
{
  [(MUImageContentViewController *)self _adjustScrollViewForKeyboardNotification:a3];
  id v4 = [(MUImageContentViewController *)self view];
  [v4 setNeedsLayout];

  BOOL v5 = [(MUImageContentViewController *)self zoomToFitRestoreValue];
  [(MUImageContentViewController *)self setFirstLoadZoomToFit:v5];
}

- (void)_adjustScrollViewForKeyboardNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 userInfo];
  double v6 = [v5 valueForKey:*MEMORY[0x263F1D420]];
  [v6 CGRectValue];
  double v38 = v7;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = [v4 userInfo];
  double v15 = [v14 valueForKey:*MEMORY[0x263F1D428]];
  [v15 CGRectValue];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = [v4 userInfo];
  double v25 = [v24 valueForKey:*MEMORY[0x263F1D3F8]];
  [v25 floatValue];
  float v27 = v26;

  double v28 = [v4 userInfo];

  CGRect v29 = [v28 valueForKey:*MEMORY[0x263F1D3F0]];
  uint64_t v30 = [v29 unsignedIntegerValue];

  id v39 = [(MUImageContentViewController *)self editingAnnotaiton];
  unint64_t v31 = [(MUImageContentViewController *)self _pageIndexForAnnotation:v39];
  if (v39 && v31 != 0x7FFFFFFFFFFFFFFFLL)
  {
    CGRect v32 = [(MUContentViewController *)self annotationController];
    uint64_t v33 = [v32 overlayViewAtIndex:v31];

    [(MUImageContentViewController *)self _annotationRectInOverlay:v39 pageIndex:v31];
    objc_msgSend(v33, "convertRect:toView:", 0);
    -[MUImageContentViewController adjustScrollViewToAccomodateKeyboardStartingFrame:endingFrame:annotationFrame:inOverlayView:withAnimationDuration:curve:](self, "adjustScrollViewToAccomodateKeyboardStartingFrame:endingFrame:annotationFrame:inOverlayView:withAnimationDuration:curve:", v33, v30, v38, v9, v11, v13, v17, v19, v21, v23, v34, v35, v36, v37, v27);
  }
}

- (void)adjustScrollViewToAccomodateKeyboardStartingFrame:(double)a3 endingFrame:(double)a4 annotationFrame:(double)a5 inOverlayView:(CGFloat)a6 withAnimationDuration:(CGFloat)a7 curve:(CGFloat)a8
{
  double v25 = [a1 scrollView];
  float v26 = [v25 superview];
  [v25 frame];
  objc_msgSend(v26, "convertRect:toView:", 0);
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;

  v89.origin.double x = v28;
  v89.origin.double y = v30;
  v89.size.CGFloat width = v32;
  v89.size.double height = v34;
  double v69 = -(a7 - CGRectGetMaxY(v89));
  double v67 = *MEMORY[0x263F001A0];
  double v66 = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat rect = *(double *)(MEMORY[0x263F001A0] + 16);
  double v68 = *(double *)(MEMORY[0x263F001A0] + 24);
  [v25 bounds];
  objc_msgSend(v25, "convertRect:toView:", 0);
  double x = v90.origin.x;
  double y = v90.origin.y;
  CGFloat width = v90.size.width;
  double height = v90.size.height;
  v95.origin.double x = a6;
  v95.origin.double y = a7;
  v95.size.CGFloat width = a8;
  v95.size.double height = a9;
  if (CGRectIntersectsRect(v90, v95))
  {
    v91.origin.double x = x;
    v91.origin.double y = y;
    v91.size.CGFloat width = width;
    v91.size.double height = height;
    v96.origin.double x = a6;
    v96.origin.double y = a7;
    v96.size.CGFloat width = a8;
    v96.size.double height = a9;
    CGRect v92 = CGRectIntersection(v91, v96);
    recCGAffineTransform t1 = height - (CGRectGetHeight(v92) + 0.0);
    objc_msgSend(v25, "convertRect:fromView:", 0, a13, a14, a15, a16);
    double rect2a = v39;
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    v93.origin.double y = y + 0.0;
    v93.origin.double x = x + 0.0;
    v93.size.CGFloat width = width;
    v93.size.double height = rect1;
    v97.origin.double x = a13;
    v97.origin.double y = a14;
    v97.size.CGFloat width = a15;
    v97.size.double height = a16;
    BOOL v46 = CGRectContainsRect(v93, v97);
    CGFloat v48 = v67;
    CGFloat v47 = v68;
    if (!v46) {
      CGFloat v47 = v45;
    }
    double v49 = rect;
    if (!v46) {
      double v49 = v43;
    }
    CGFloat rect = v49;
    CGFloat v50 = v66;
    if (!v46) {
      CGFloat v50 = v41;
    }
    double v51 = v69;
    if (!v46) {
      CGFloat v48 = rect2a;
    }
  }
  else
  {
    CGFloat v47 = v68;
    double v51 = v69;
    CGFloat v50 = v66;
    CGFloat v48 = v67;
  }
  [v25 contentInset];
  double v53 = v52;
  [v25 _contentScrollInset];
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  if (v53 >= v51) {
    double v60 = 0.0;
  }
  else {
    double v60 = v51 - v53;
  }
  v94.origin.double x = v48;
  v94.origin.double y = v50;
  v94.size.CGFloat width = rect;
  v94.size.double height = v47;
  if (CGRectIsNull(v94))
  {
    if (v60 <= 0.0)
    {
      objc_msgSend(v25, "_setContentScrollInset:", v55, v57, v60, v59);
      goto LABEL_23;
    }
    dispatch_time_t v61 = dispatch_time(0, (uint64_t)(a17 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __152__MUImageContentViewController_adjustScrollViewToAccomodateKeyboardStartingFrame_endingFrame_annotationFrame_inOverlayView_withAnimationDuration_curve___block_invoke_2;
    block[3] = &unk_2649C2DE0;
    id v74 = v25;
    double v75 = v55;
    double v76 = v57;
    double v77 = v60;
    double v78 = v59;
    dispatch_after(v61, MEMORY[0x263EF83A0], block);
    v62 = v74;
  }
  else
  {
    if ((unint64_t)(a12 - 1) >= 3) {
      uint64_t v63 = 4;
    }
    else {
      uint64_t v63 = ((a12 - 1) << 16) + 65540;
    }
    v64 = (void *)MEMORY[0x263F1CB60];
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = __152__MUImageContentViewController_adjustScrollViewToAccomodateKeyboardStartingFrame_endingFrame_annotationFrame_inOverlayView_withAnimationDuration_curve___block_invoke;
    v79[3] = &unk_2649C2DB8;
    id v80 = v25;
    double v81 = v55;
    double v82 = v57;
    double v83 = v60;
    double v84 = v59;
    CGFloat v85 = v48;
    CGFloat v86 = v50;
    CGFloat v87 = rect;
    CGFloat v88 = v47;
    [v64 animateWithDuration:v63 delay:v79 options:0 animations:a17 completion:0.0];
    v62 = v80;
  }

LABEL_23:
}

uint64_t __152__MUImageContentViewController_adjustScrollViewToAccomodateKeyboardStartingFrame_endingFrame_annotationFrame_inOverlayView_withAnimationDuration_curve___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setContentScrollInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 72);
  double v4 = *(double *)(a1 + 80);
  double v5 = *(double *)(a1 + 88);
  double v6 = *(double *)(a1 + 96);
  return objc_msgSend(v2, "scrollRectToVisible:animated:", 0, v3, v4, v5, v6);
}

uint64_t __152__MUImageContentViewController_adjustScrollViewToAccomodateKeyboardStartingFrame_endingFrame_annotationFrame_inOverlayView_withAnimationDuration_curve___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setContentScrollInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v7 = a3;
  id v4 = [(MUImageContentViewController *)self scrollView];

  double v5 = v7;
  if (v4 == v7)
  {
    [(MUImageContentViewController *)self setFirstLoadZoomToFit:0];
    [(MUImageContentViewController *)self setCentersIgnoringContentInsets:0];
    double v6 = [(MUImageContentViewController *)self scrollViewDelegate];
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v6 scrollViewWillBeginDragging:v7];
    }

    double v5 = v7;
  }
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(MUImageContentViewController *)self scrollView];

  if (v7 == v9)
  {
    [(MUImageContentViewController *)self setFirstLoadZoomToFit:0];
    [(MUImageContentViewController *)self setCentersIgnoringContentInsets:0];
    if (!self->_inDoubleTapZoom) {
      [v9 setScrollEnabled:1];
    }
    double v8 = [(MUImageContentViewController *)self scrollViewDelegate];
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v8 scrollViewWillBeginZooming:v9 withView:v6];
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v7 = a3;
  id v4 = [(MUImageContentViewController *)self scrollViewDelegate];
  id v5 = [(MUImageContentViewController *)self scrollView];
  if (v5 == v7 && v4)
  {
    char v6 = objc_opt_respondsToSelector();

    if (v6) {
      [v4 scrollViewDidScroll:v7];
    }
  }
  else
  {
  }
}

- (void)scrollViewDidZoom:(id)a3
{
  id v7 = a3;
  id v4 = [(MUImageContentViewController *)self scrollViewDelegate];
  id v5 = [(MUImageContentViewController *)self scrollView];
  if (v5 == v7 && v4)
  {
    char v6 = objc_opt_respondsToSelector();

    if (v6) {
      [v4 scrollViewDidZoom:v7];
    }
  }
  else
  {
  }
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4 = a3;
  id v5 = [(MUImageContentViewController *)self scrollView];

  if (v5 == v4)
  {
    [(MUImageContentViewController *)self setCentersIgnoringContentInsets:0];
    id v7 = [(MUImageContentViewController *)self scrollViewDelegate];
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
      char v6 = [v7 scrollViewShouldScrollToTop:v4];
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromOverlayToModelWithPageIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  double v8 = [a5 overlayViewAtIndex:a4];
  objc_msgSend(v8, "convertPoint:toView:", self->_imageView, x, y);
  double v10 = v9;
  double v12 = v11;
  [(UIImageView *)self->_imageView bounds];
  CGFloat v13 = CGRectGetHeight(v21) - v12;
  [(MUImageContentViewController *)self downsampledImageScale];
  double v15 = v10 / v14;
  [(MUImageContentViewController *)self downsampledImageScale];
  double v17 = v13 / v16;

  double v18 = v15;
  double v19 = v17;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromModelToOverlayWithPageIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  double v8 = [a5 overlayViewAtIndex:a4];
  [(MUImageContentViewController *)self downsampledImageScale];
  double v10 = x * v9;
  [(MUImageContentViewController *)self downsampledImageScale];
  double v12 = y * v11;
  [(UIImageView *)self->_imageView bounds];
  objc_msgSend(v8, "convertPoint:fromView:", self->_imageView, v10, CGRectGetHeight(v20) - v12);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (CGRect)maxPageRectWithPageIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  id v5 = [(MUImageContentViewController *)self imageView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  [(MUImageContentViewController *)self downsampledImageScale];
  double v15 = v11 / v14;
  [(MUImageContentViewController *)self downsampledImageScale];
  double v17 = v13 / v16;
  double v18 = v7;
  double v19 = v9;
  double v20 = v15;
  result.size.double height = v17;
  result.size.CGFloat width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (id)newContentSnapshotPDFDataIncludingAdornments:(BOOL)a3 atScale:(double)a4 inRect:(CGRect)a5 onOverlayAtPageIndex:(unint64_t)a6 forAnnotationController:(id)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v14 = a7;
  double v15 = [(MUImageContentViewController *)self imageView];
  id v16 = [v15 image];
  double v17 = (CGImage *)[v16 CGImage];

  double v18 = [v14 overlayViewAtIndex:a6];

  double v19 = [(MUImageContentViewController *)self imageView];
  objc_msgSend(v19, "convertRect:fromView:", v18, x, y, width, height);
  double v21 = v20;
  CGFloat v23 = v22;
  double v25 = v24;
  double v27 = v26;

  [(UIImageView *)self->_imageView bounds];
  double MaxY = CGRectGetMaxY(v58);
  v59.origin.double x = v21;
  v59.origin.double y = v23;
  v59.size.double width = v25;
  v59.size.double height = v27;
  double v29 = MaxY - CGRectGetMaxY(v59);
  mediaBox.origin = (CGPoint)*MEMORY[0x263F00148];
  mediaBox.size.double width = v25 * a4;
  mediaBox.size.double height = v27 * a4;
  size_t v30 = CGImageGetWidth(v17);
  size_t v31 = CGImageGetHeight(v17);
  v60.origin.double x = v21;
  v60.origin.double y = v29;
  v60.size.double width = v25;
  v60.size.double height = v27;
  CGRect v61 = CGRectIntegral(v60);
  double v32 = v61.origin.y;
  CGFloat v33 = v61.size.width;
  CGFloat v34 = v61.size.height;
  double v55 = v61.origin.x;
  double v56 = CGRectGetWidth(v61);
  v62.origin.double x = v55;
  v62.origin.double y = v32;
  v62.size.double width = v33;
  CGFloat v54 = v34;
  v62.size.double height = v34;
  double v35 = CGRectGetHeight(v62);
  v63.origin.double x = v21;
  v63.origin.double y = v29;
  v63.size.double width = v25;
  v63.size.double height = v27;
  if (CGRectIsEmpty(v63)) {
    goto LABEL_16;
  }
  size_t v36 = vcvtad_u64_f64(v56);
  size_t v37 = vcvtad_u64_f64(v35);
  ColorSpace = CGImageGetColorSpace(v17);
  if (!ColorSpace || (double v39 = ColorSpace, CGColorSpaceUsesExtendedRange(ColorSpace)) || CGColorSpaceIsWideGamutRGB(v39))
  {
    double v40 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
    double v39 = v40;
  }
  else
  {
    double v40 = 0;
  }
  uint32_t v41 = CGColorSpaceGetNumberOfComponents(v39) != 1;
  CGContextRef v42 = CGBitmapContextCreate(0, v36, v37, 8uLL, 0, v39, v41);
  if (v42)
  {
    double v43 = v42;
    CGFloat v44 = (double)v30;
    id v45 = [MEMORY[0x263F1C550] whiteColor];
    CGContextSetFillColorWithColor(v43, (CGColorRef)[v45 CGColor]);

    v64.size.double height = v54;
    v64.origin.double x = v55;
    v64.origin.double y = v32;
    v64.size.double width = v33;
    CGContextFillRect(v43, v64);
    CGContextTranslateCTM(v43, -v55, -v32);
    CGContextSetInterpolationQuality(v43, kCGInterpolationNone);
    v65.origin.double x = 0.0;
    v65.origin.double y = 0.0;
    v65.size.double width = v44;
    v65.size.double height = (double)v31;
    CGContextDrawImage(v43, v65, v17);
    Image = CGBitmapContextCreateImage(v43);
    CGContextRelease(v43);
    if (!v40) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  Image = 0;
  if (v40) {
LABEL_8:
  }
    CGColorSpaceRelease(v40);
LABEL_9:
  if (!Image)
  {
LABEL_16:
    CGFloat v48 = 0;
    goto LABEL_17;
  }
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CGFloat v48 = Mutable;
  if (Mutable)
  {
    double v49 = CGDataConsumerCreateWithCFData(Mutable);
    if (v49)
    {
      CGFloat v50 = v49;
      double v51 = CGPDFContextCreate(v49, &mediaBox, 0);
      if (v51)
      {
        double v52 = v51;
        CGPDFContextBeginPage(v51, 0);
        CGContextSaveGState(v52);
        CGContextScaleCTM(v52, a4, a4);
        CGContextTranslateCTM(v52, -(v21 - v55), -(v29 - v32));
        CGContextSetInterpolationQuality(v52, kCGInterpolationNone);
        v66.origin.double x = 0.0;
        v66.origin.double y = 0.0;
        v66.size.double width = (double)(unint64_t)round(v56);
        v66.size.double height = (double)(unint64_t)round(v35);
        CGContextDrawImage(v52, v66, Image);
        CGContextRestoreGState(v52);
        CGPDFContextEndPage(v52);
        CGPDFContextClose(v52);
        CGContextRelease(v52);
      }
      CGDataConsumerRelease(v50);
    }
  }
  CGImageRelease(Image);
LABEL_17:

  return v48;
}

- (id)undoManagerForAnnotationController:(id)a3
{
  id v4 = [(MUContentViewController *)self delegate];
  id v5 = [v4 undoManagerForContentViewController:self];

  return v5;
}

- (id)popoverPresentingViewControllerForAnnotationController:(id)a3
{
  id v4 = a3;
  id v5 = [(MUContentViewController *)self delegate];
  double v6 = [v5 popoverPresentingViewControllerForAnnotationController:v4];

  return v6;
}

- (void)installDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  id v6 = a3;
  id v7 = [(MUImageContentViewController *)self view];
  [v7 addGestureRecognizer:v6];
}

- (void)uninstallDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  id v5 = a3;
  id v6 = [v5 view];
  [v6 removeGestureRecognizer:v5];
}

- (void)updateDrawingGestureRecognizer:(id)a3 forPageAtIndex:(unint64_t)a4 withPriority:(BOOL)a5 forAnnotationController:(id)a6
{
  BOOL v7 = a5;
  v55[4] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  double v11 = [v10 tapGestureRecognizer];
  v55[0] = v11;
  double v12 = [v10 pressGestureRecognizer];
  v55[1] = v12;
  double v13 = [v10 panGestureRecognizer];
  v55[2] = v13;
  double v39 = v10;
  id v14 = [v10 rotationGestureRecognizer];
  v55[3] = v14;
  double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:4];

  id v16 = [MEMORY[0x263EFF9C0] set];
  double v17 = [(MUImageContentViewController *)self view];
  double v18 = [v17 gestureRecognizers];
  [v16 addObjectsFromArray:v18];

  double v19 = [(MUImageContentViewController *)self scrollView];
  double v20 = [v19 gestureRecognizers];
  [v16 addObjectsFromArray:v20];

  double v21 = [MEMORY[0x263EFFA08] setWithArray:v15];
  [v16 minusSet:v21];

  [v16 removeObject:v9];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v22 = v15;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v49 != v25) {
          objc_enumerationMutation(v22);
        }
        [v9 requireGestureRecognizerToFail:*(void *)(*((void *)&v48 + 1) + 8 * i)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v24);
  }

  if (v7)
  {
    long long v46 = 0uLL;
    long long v47 = 0uLL;
    long long v44 = 0uLL;
    long long v45 = 0uLL;
    id v27 = v16;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v45 != v30) {
            objc_enumerationMutation(v27);
          }
          double v32 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          [v9 removeFailureRequirement:v32];
          if ((objc_opt_respondsToSelector() & 1) == 0
            || [v32 _acceptsFailureRequirements])
          {
            [v32 requireGestureRecognizerToFail:v9];
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v29);
    }
  }
  else
  {
    long long v42 = 0uLL;
    long long v43 = 0uLL;
    long long v40 = 0uLL;
    long long v41 = 0uLL;
    id v33 = v16;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v41;
      do
      {
        for (uint64_t k = 0; k != v35; ++k)
        {
          if (*(void *)v41 != v36) {
            objc_enumerationMutation(v33);
          }
          double v38 = *(void **)(*((void *)&v40 + 1) + 8 * k);
          [v38 removeFailureRequirement:v9];
          if ((objc_opt_respondsToSelector() & 1) == 0
            || [v38 _acceptsFailureRequirements])
          {
            [v9 requireGestureRecognizerToFail:v38];
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v40 objects:v52 count:16];
      }
      while (v35);
    }
  }
}

- (double)modelBaseScaleFactorOfPageAtIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  id v6 = [(MUContentViewController *)self delegate];
  [v6 modelBaseScaleFactorOfPageAtIndex:a3 forContentViewController:self];
  double v8 = v7;

  return v8;
}

- (id)controller:(id)a3 willSetToolbarItems:(id)a4
{
  id v5 = a4;
  id v6 = [(MUContentViewController *)self delegate];
  double v7 = [v6 annotationControllerOfContentViewController:self willSetToolbarItems:v5];

  return v7;
}

- (void)positionSketchOverlay:(id)a3 forAnnotationController:(id)a4
{
  id v5 = a3;
  id v6 = [(MUContentViewController *)self delegate];
  [v6 positionSketchOverlay:v5 forContentViewController:self];
}

- (BOOL)controllerShouldDetectFormElements:(id)a3
{
  return 0;
}

- (id)layerContainingQuickBackgroundForLoupeOnOverlayAtPageIndex:(unint64_t)a3 forAnnotationController:(id)a4
{
  id v4 = [(MUImageContentViewController *)self imageView];
  id v5 = [v4 layer];

  return v5;
}

- (BOOL)shouldPlaceFormElementAtPoint:(CGPoint)a3 onOverlayAtPageIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  return 0;
}

- (BOOL)shouldPlaceProposedFormElementAtRect:(CGRect)a3 onOverlayAtPageIndex:(unint64_t)a4 forAnnotationController:(id)a5
{
  return 0;
}

- (void)controllerDidEnterToolMode:(id)a3
{
  id v4 = [(MUImageContentViewController *)self scrollView];
  id v5 = [v4 panGestureRecognizer];
  [v5 setMinimumNumberOfTouches:2];

  id v6 = [(MUImageContentViewController *)self localDoubleTapRecognizer];
  [v6 setEnabled:0];
}

- (void)controllerDidExitToolMode:(id)a3
{
  id v4 = [(MUImageContentViewController *)self scrollView];
  id v5 = [v4 panGestureRecognizer];
  [v5 setMinimumNumberOfTouches:1];

  id v6 = [(MUImageContentViewController *)self localDoubleTapRecognizer];
  [v6 setEnabled:1];
}

- (void)editDetectedForAnnotationController:(id)a3
{
  id v4 = a3;
  id v5 = [(MUContentViewController *)self delegate];
  [v5 editDetectedForAnnotationController:v4];
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

- (BOOL)supportsImageDescriptionEditing
{
  return 1;
}

- (NSString)originalImageDescription
{
  double v2 = [(MUContentViewController *)self delegate];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v3 = [v2 originalImageDescription];
  }
  else
  {
    double v3 = 0;
  }

  return (NSString *)v3;
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

- (BOOL)centersIgnoringContentInsets
{
  return self->_centersIgnoringContentInsets;
}

- (void)setCentersIgnoringContentInsets:(BOOL)a3
{
  self->_centersIgnoringContentInsets = a3;
}

- (UIImage)tentativePlaceholderImage
{
  return self->_tentativePlaceholderImage;
}

- (void)setTentativePlaceholderImage:(id)a3
{
}

- (double)maxImageDimension
{
  return self->_maxImageDimension;
}

- (void)setMaxImageDimension:(double)a3
{
  self->_maxImageDimension = a3;
}

- (UIView)combinedContentView
{
  return self->_combinedContentView;
}

- (void)setCombinedContentView:(id)a3
{
}

- (unint64_t)inkStyle
{
  return self->_inkStyle;
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegate);
  return (UIScrollViewDelegate *)WeakRetained;
}

- (void)setScrollViewDelegate:(id)a3
{
}

- (id)sourceContent
{
  return objc_getProperty(self, a2, 1056, 1);
}

- (void)setSourceContent:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (CGSize)sourceImagePixelSize
{
  objc_copyStruct(v4, &self->_sourceImagePixelSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setSourceImagePixelSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_sourceImagePixelSize, &v3, 16, 1, 0);
}

- (double)downsampledImageScale
{
  return self->_downsampledImageScale;
}

- (void)setDownsampledImageScale:(double)a3
{
  self->_downsampledImageScale = a3;
}

- (BOOL)usePlaceholderAsDisplayImageIfPossible
{
  return self->_usePlaceholderAsDisplayImageIfPossible;
}

- (void)setUsePlaceholderAsDisplayImageIfPossible:(BOOL)a3
{
  self->_BOOL usePlaceholderAsDisplayImageIfPossible = a3;
}

- (BOOL)inDoubleTapZoom
{
  return self->_inDoubleTapZoom;
}

- (void)setInDoubleTapZoom:(BOOL)a3
{
  self->_inDoubleTapZoom = a3;
}

- (id)loadCompletionBlock
{
  return objc_getProperty(self, a2, 1088, 1);
}

- (void)setLoadCompletionBlock:(id)a3
{
}

- (UITapGestureRecognizer)localDoubleTapRecognizer
{
  return (UITapGestureRecognizer *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setLocalDoubleTapRecognizer:(id)a3
{
}

- (BOOL)didSetup
{
  return self->_didSetup;
}

- (void)setDidSetup:(BOOL)a3
{
  self->_didSetup = a3;
}

- (AKRectAnnotation)editingAnnotaiton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editingAnnotaiton);
  return (AKRectAnnotation *)WeakRetained;
}

- (void)setEditingAnnotaiton:(id)a3
{
}

- (AKPageController)pageController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
  return (AKPageController *)WeakRetained;
}

- (void)setPageController:(id)a3
{
}

- (BOOL)firstLoadZoomToFit
{
  return self->_firstLoadZoomToFit;
}

- (void)setFirstLoadZoomToFit:(BOOL)a3
{
  self->_firstLoadZoomToFit = a3;
}

- (BOOL)zoomToFitRestoreValue
{
  return self->_zoomToFitRestoreValue;
}

- (void)setZoomToFitRestoreValue:(BOOL)a3
{
  self->_zoomToFitRestoreCFNumberRef Value = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageController);
  objc_destroyWeak((id *)&self->_editingAnnotaiton);
  objc_storeStrong((id *)&self->_localDoubleTapRecognizer, 0);
  objc_storeStrong(&self->_loadCompletionBlock, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong(&self->_sourceContent, 0);
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_storeStrong((id *)&self->_combinedContentView, 0);
  objc_storeStrong((id *)&self->_tentativePlaceholderImage, 0);
}

@end