@interface _SSSScreenshotImageView
+ (id)_createDirectoryForSysdiagnoseIfNecessary;
+ (void)_saveImageForSysdiagnose:(id)a3;
- (BOOL)annotationsEnabled;
- (BOOL)hasOutstandingEdits;
- (BOOL)inhibitImageAnalysis;
- (BOOL)useTrilinearMinificationFilter;
- (CGRect)contentsRectForImageAnalysisInteraction:(id)a3;
- (CGSize)intrinsicContentSize;
- (OS_dispatch_queue)analysisHelperQueue;
- (SSSScreenshotImageViewDelegate)delegate;
- (UIActivity)visionKitFeedbackActivity;
- (UIGestureRecognizer)drawingGestureRecognizer;
- (VKCImageAnalysisInteraction)imageInteraction;
- (VKCImageAnalyzer)imageAnalyzer;
- (_SSSScreenshotCropableView)cachedOutputImageView;
- (_SSSScreenshotImageView)initWithFrame:(CGRect)a3;
- (_SSSScreenshotImageView)viewWithScreenshotImage;
- (_SSSScreenshotPaperKitImageView)paperKitImageView;
- (id)_paperKitImageViewOverlayViewController:(id)a3;
- (int)currentInProcessRequestID;
- (unint64_t)feedbackTypeForImageAnalysisInteraction:(id)a3;
- (unint64_t)interactionMode;
- (void)_paperKitImageDidChangeInView:(id)a3 changeCounter:(unint64_t)a4;
- (void)_paperKitImageView:(id)a3 didFinishUpdatingImage:(id)a4;
- (void)_paperKitImageView:(id)a3 startEditingOpacityInAccessoryView:(id)a4;
- (void)_paperKitImageView:(id)a3 willBeginUpdatingImage:(id)a4;
- (void)_updateInteractionModeFromAnalysisButtonPress;
- (void)analyzeCurrentImageIfNecessary;
- (void)clearImageAnalysisTextSelection;
- (void)cropControllerDidUpdateScrollView:(id)a3;
- (void)cropControllerDidZoomInScrollView:(id)a3;
- (void)deselectAllAnnotations;
- (void)endedEditing;
- (void)enterEditing;
- (void)generateSnapshotImageIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)imageAnalysisInteraction:(id)a3 highlightSelectedItemsValueDidChange:(BOOL)a4;
- (void)imageAnalysisInteraction:(id)a3 imageAnalysisBarItemPressed:(id)a4;
- (void)imageAnalysisInteraction:(id)a3 imageAnalysisButtonPressed:(id)a4;
- (void)layoutSubviews;
- (void)reanalyzeImage;
- (void)setAnalysisHelperQueue:(id)a3;
- (void)setAnnotationsEnabled:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCachedOutputImageView:(id)a3;
- (void)setCachedViewsHidden:(BOOL)a3;
- (void)setCurrentInProcessRequestID:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHasOutstandingEdits:(BOOL)a3;
- (void)setImageAnalyzer:(id)a3;
- (void)setImageInteraction:(id)a3;
- (void)setInhibitImageAnalysis:(BOOL)a3;
- (void)setInteractionMode:(unint64_t)a3;
- (void)setRulerHostView:(id)a3;
- (void)setScreenshot:(id)a3;
- (void)setUseTrilinearMinificationFilter:(BOOL)a3;
- (void)setVellumOpacity:(double)a3;
- (void)updateInteractionHighlightStatusIfNecessary;
- (void)updatePaletteVisibilityIfNecessary:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _SSSScreenshotImageView

- (_SSSScreenshotImageView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)_SSSScreenshotImageView;
  v3 = -[_SSSScreenshotAnnotationView initWithFrame:](&v21, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (_os_feature_enabled_impl())
  {
    v4 = objc_alloc_init(_SSSScreenshotPaperKitImageView);
    [(_SSSScreenshotPaperKitImageView *)v4 setDelegate:v3];
    imageView = v3->_imageView;
    v3->_imageView = (_SSSScreenshotCropableView *)v4;
  }
  else
  {
    v6 = objc_alloc_init(_SSSScreenshotFullsizeStaticImageView);
    imageView = v3->_imageView;
    v3->_imageView = (_SSSScreenshotCropableView *)v6;
  }

  v3->_inhibitImageAnalysis = 1;
  [(_SSSScreenshotImageView *)v3 addSubview:v3->_imageView];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v7 = objc_alloc_init((Class)UIView);
    [(_SSSScreenshotAnnotationView *)v3 setVellumView:v7];

    v8 = [(_SSSScreenshotAnnotationView *)v3 vellumView];
    v9 = +[UIColor whiteColor];
    [v8 setBackgroundColor:v9];

    v10 = [(_SSSScreenshotAnnotationView *)v3 vellumView];
    [(_SSSScreenshotImageView *)v3 addSubview:v10];
  }
  [(_SSSScreenshotAnnotationView *)v3 setScreenshotEditsSnapshotted:1];
  v11 = objc_alloc_init(_SSSScreenshotFullsizeStaticImageView);
  cachedOutputImageView = v3->_cachedOutputImageView;
  v3->_cachedOutputImageView = (_SSSScreenshotCropableView *)v11;

  int v13 = _os_feature_enabled_impl();
  v14 = v3->_cachedOutputImageView;
  if (v13) {
    [(_SSSScreenshotImageView *)v3 insertSubview:v14 belowSubview:v3->_imageView];
  }
  else {
    [(_SSSScreenshotImageView *)v3 addSubview:v14];
  }
  if (+[VKCImageAnalyzer supportedAnalysisTypes])
  {
    v15 = (VKCImageAnalysisInteraction *)objc_alloc_init((Class)VKCImageAnalysisInteraction);
    imageInteraction = v3->_imageInteraction;
    v3->_imageInteraction = v15;

    [(VKCImageAnalysisInteraction *)v3->_imageInteraction setAnalysisButtonRequiresVisibleContentGating:0];
    [(VKCImageAnalysisInteraction *)v3->_imageInteraction setDelegate:v3];
    [(VKCImageAnalysisInteraction *)v3->_imageInteraction setWantsAutomaticContentsRectCalculation:0];
    [(VKCImageAnalysisInteraction *)v3->_imageInteraction setAutomaticallyShowVisualSearchResults:1];
    if (_SSQuickActionsEnabled())
    {
      [(VKCImageAnalysisInteraction *)v3->_imageInteraction setActionInfoViewHidden:0];
      [(VKCImageAnalysisInteraction *)v3->_imageInteraction setWantsTranslucentActionInfoButtons:1];
      [(VKCImageAnalysisInteraction *)v3->_imageInteraction setActionInfoLiveTextButtonDisabled:1];
    }
    v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.screenshotServicesService.VKAnalysisHelper", v17);
    analysisHelperQueue = v3->_analysisHelperQueue;
    v3->_analysisHelperQueue = (OS_dispatch_queue *)v18;

    [(_SSSScreenshotImageView *)v3 addInteraction:v3->_imageInteraction];
  }
  return v3;
}

- (void)willMoveToWindow:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_SSSScreenshotImageView;
  -[_SSSScreenshotImageView willMoveToWindow:](&v7, "willMoveToWindow:");
  if (!a3)
  {
    imageInteraction = self->_imageInteraction;
    if (imageInteraction)
    {
      [(VKCImageAnalysisInteraction *)imageInteraction setDelegate:0];
      [(_SSSScreenshotImageView *)self removeInteraction:self->_imageInteraction];
      v6 = self->_imageInteraction;
      self->_imageInteraction = 0;
    }
  }
}

- (void)setAnnotationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_annotationsEnabled = a3;
  id v4 = [(_SSSScreenshotImageView *)self paperKitImageView];
  [v4 setAnnotationsEnabled:v3];
}

- (void)setInteractionMode:(unint64_t)a3
{
  if (a3 && !self->_interactionMode && self->_hasOutstandingEdits)
  {
    self->_hasOutstandingEdits = 0;
    [(_SSSScreenshotImageView *)self reanalyzeImage];
  }
  self->_interactionMode = a3;
  switch(a3)
  {
    case 0uLL:
      uint64_t v5 = 0;
      uint64_t v6 = 1;
      int v7 = 1;
      uint64_t v8 = 1;
      break;
    case 1uLL:
      uint64_t v6 = 0;
      uint64_t v8 = 0;
      int v7 = 1;
      uint64_t v5 = 9;
      break;
    case 2uLL:
      uint64_t v6 = 0;
      int v7 = 0;
      uint64_t v8 = 1;
      uint64_t v5 = 4;
      break;
    case 3uLL:
      uint64_t v6 = 0;
      uint64_t v8 = 0;
      int v7 = 1;
      uint64_t v5 = 11;
      break;
    default:
      uint64_t v6 = 0;
      int v7 = 0;
      uint64_t v8 = 0;
      uint64_t v5 = 0;
      break;
  }
  BOOL v9 = a3 == 3;
  if (!_SSRemoveBackgroundEnabled()) {
    v5 &= 7u;
  }
  id v13 = [(_SSSScreenshotImageView *)self imageInteraction];
  [v13 setActiveInteractionTypes:v5];
  [v13 setHighlightSelectableItems:v9];
  [v13 setForceAnalysisBarButtonItemEnabled:v8];
  if (v7) {
    [v13 resetSelection];
  }
  v10 = [(_SSSScreenshotAnnotationView *)self annotationOverlayView];
  [v10 setUserInteractionEnabled:v6];

  v11 = [(_SSSScreenshotAnnotationView *)self overlayController];
  v12 = [v11 annotationKitController];
  [v12 setAllEditingDisabled:v6 ^ 1];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SSSScreenshotImageView;
  -[_SSSScreenshotImageView setFrame:](&v4, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_SSSScreenshotImageView *)self layoutIfNeeded];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SSSScreenshotImageView;
  -[_SSSScreenshotImageView setBounds:](&v4, "setBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_SSSScreenshotImageView *)self layoutIfNeeded];
}

- (void)layoutSubviews
{
  [(_SSSScreenshotImageView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[_SSSScreenshotCropableView setFrame:](self->_imageView, "setFrame:");
  v11 = [(_SSSScreenshotImageView *)self cachedOutputImageView];
  [v11 setFrame:v4, v6, v8, v10];

  v12 = [(_SSSScreenshotAnnotationView *)self annotationOverlayView];
  [v12 setFrame:v4, v6, v8, v10];

  id v13 = [(_SSSScreenshotAnnotationView *)self vellumView];
  [v13 setFrame:v4, v6, v8, v10];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  v14 = [(_SSSScreenshotAnnotationView *)self screenshot];
  v15 = [v14 modelModificationInfo];
  v16 = v15;
  if (v15)
  {
    [v15 cropInfo];
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  sub_10004C7F4((uint64_t)&v29, *(double *)&v32, *((double *)&v32 + 1));
  imageView = self->_imageView;
  long long v26 = v29;
  long long v27 = v30;
  long long v28 = v31;
  [(_SSSScreenshotCropableView *)imageView setCropInfo:&v26];
  dispatch_queue_t v18 = [(_SSSScreenshotImageView *)self cachedOutputImageView];
  long long v26 = v32;
  long long v27 = v33;
  long long v28 = v34;
  [v18 setCropInfo:&v26];

  double v19 = v8 / *(double *)&v29;
  double v20 = v10 / *((double *)&v29 + 1);
  -[_SSSScreenshotCropableView setSizeMultiplier:](self->_imageView, "setSizeMultiplier:", v19, v20);
  objc_super v21 = [(_SSSScreenshotImageView *)self cachedOutputImageView];
  [v21 setSizeMultiplier:v19, v20];

  v22 = [(_SSSScreenshotAnnotationView *)self vellumView];
  [(_SSSScreenshotAnnotationView *)self vellumOpacity];
  [v22 setAlpha:];

  [(_SSSScreenshotCropableView *)self->_imageView setUseTrilinearMinificationFilter:[(_SSSScreenshotImageView *)self useTrilinearMinificationFilter]];
  v23 = [(_SSSScreenshotImageView *)self cachedOutputImageView];
  [v23 setUseTrilinearMinificationFilter:[self useTrilinearMinificationFilter]];

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v24 = [(_SSSScreenshotImageView *)self cachedOutputImageView];
    [(_SSSScreenshotImageView *)self bringSubviewToFront:v24];
  }
  v25 = [(_SSSScreenshotAnnotationView *)self overlayController];
  [v25 setViewState:0, 0];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(_SSSScreenshotAnnotationView *)self screenshot];
  double v3 = [v2 environmentDescription];
  [v3 imagePointSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_SSSScreenshotPaperKitImageView)paperKitImageView
{
  if (_os_feature_enabled_impl()) {
    double v3 = self->_imageView;
  }
  else {
    double v3 = 0;
  }

  return (_SSSScreenshotPaperKitImageView *)v3;
}

- (void)setVellumOpacity:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_SSSScreenshotImageView;
  -[_SSSScreenshotAnnotationView setVellumOpacity:](&v6, "setVellumOpacity:");
  double v5 = [(_SSSScreenshotImageView *)self paperKitImageView];
  [v5 setVellumOpacity:a3];
}

- (UIGestureRecognizer)drawingGestureRecognizer
{
  if (_os_feature_enabled_impl())
  {
    double v3 = [(_SSSScreenshotCropableView *)self->_imageView drawingGestureRecognizer];
  }
  else
  {
    double v3 = 0;
  }

  return (UIGestureRecognizer *)v3;
}

- (void)setScreenshot:(id)a3
{
  id v4 = a3;
  id v5 = [(_SSSScreenshotAnnotationView *)self screenshot];

  if (v5 != v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)_SSSScreenshotImageView;
    [(_SSSScreenshotAnnotationView *)&v13 setScreenshot:v4];
    if (_os_feature_enabled_impl()) {
      [v4 setImageGenerator:self->_imageView];
    }
    objc_initWeak(&location, self);
    objc_super v6 = [v4 imageProvider];
    double v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    double v9 = sub_10000F8FC;
    double v10 = &unk_100099B30;
    objc_copyWeak(&v11, &location);
    [v6 requestUneditedImageForUI:&v7];

    [(_SSSScreenshotImageView *)self setNeedsLayout];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (_SSSScreenshotImageView)viewWithScreenshotImage
{
  return (_SSSScreenshotImageView *)self->_imageView;
}

- (void)setUseTrilinearMinificationFilter:(BOOL)a3
{
  self->_useTrilinearMinificationFilter = a3;
  [(_SSSScreenshotImageView *)self setNeedsLayout];
}

- (void)setInhibitImageAnalysis:(BOOL)a3
{
  if (self->_inhibitImageAnalysis != a3)
  {
    self->_inhibitImageAnalysis = a3;
    [(_SSSScreenshotImageView *)self analyzeCurrentImageIfNecessary];
  }
}

- (void)reanalyzeImage
{
  double v3 = [(_SSSScreenshotImageView *)self imageInteraction];
  [v3 setAnalysis:0];

  [(_SSSScreenshotImageView *)self analyzeCurrentImageIfNecessary];
}

- (void)analyzeCurrentImageIfNecessary
{
  if (![(_SSSScreenshotImageView *)self inhibitImageAnalysis])
  {
    id v16 = [(_SSSScreenshotImageView *)self imageInteraction];
    double v3 = [v16 analysis];
    if (v3)
    {
    }
    else
    {
      id v4 = +[VKCImageAnalyzer supportedAnalysisTypes];

      if (v4)
      {
        id v5 = [(_SSSScreenshotAnnotationView *)self screenshot];
        objc_super v6 = [(_SSSScreenshotImageView *)self imageAnalyzer];
        objc_initWeak(&location, self);
        objc_initWeak(&from, v5);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10000FE18;
        v22[3] = &unk_100099B80;
        objc_copyWeak(&v24, &location);
        id v7 = v6;
        id v23 = v7;
        objc_copyWeak(&v25, &from);
        uint64_t v8 = objc_retainBlock(v22);
        double v9 = [(_SSSScreenshotAnnotationView *)self screenshot];
        unsigned __int8 v10 = [v9 hasEverBeenEditedForMode:0];

        if (v10)
        {
          id v11 = [(_SSSScreenshotAnnotationView *)self screenshot];
          v12 = [v11 imageProvider];
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_1000101CC;
          v17[3] = &unk_100099BA8;
          dispatch_queue_t v18 = v8;
          [v12 requestOutputImageForSaving:v17];

          id v13 = v18;
        }
        else
        {
          v14 = [(_SSSScreenshotCropableView *)self->_imageView image];
          v15 = [(_SSSScreenshotImageView *)self analysisHelperQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10001016C;
          block[3] = &unk_100099A60;
          id v20 = v14;
          objc_super v21 = v8;
          id v13 = v14;
          dispatch_async(v15, block);
        }
        objc_destroyWeak(&v25);

        objc_destroyWeak(&v24);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (CGRect)contentsRectForImageAnalysisInteraction:(id)a3
{
  double v3 = [(_SSSScreenshotAnnotationView *)self screenshot];
  id v4 = [v3 modelModificationInfo];
  id v5 = v4;
  if (v4) {
    [v4 cropInfo];
  }
  else {
    memset(v17, 0, sizeof(v17));
  }
  double v6 = sub_10004C860((double *)v17);
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

- (UIActivity)visionKitFeedbackActivity
{
  v2 = [(_SSSScreenshotImageView *)self imageInteraction];
  double v3 = [v2 feedbackActivity];

  return (UIActivity *)v3;
}

- (void)setRulerHostView:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [(_SSSScreenshotImageView *)self paperKitImageView];
    [v5 setRulerHostView:v4];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_SSSScreenshotImageView;
    [(_SSSScreenshotAnnotationView *)&v6 setRulerHostView:v4];
  }
}

- (unint64_t)feedbackTypeForImageAnalysisInteraction:(id)a3
{
  return 0;
}

- (void)clearImageAnalysisTextSelection
{
  id v2 = [(_SSSScreenshotImageView *)self imageInteraction];
  [v2 resetSelection];
}

- (void)_updateInteractionModeFromAnalysisButtonPress
{
  if ((id)[(_SSSScreenshotImageView *)self interactionMode] == (id)1
    || ![(_SSSScreenshotImageView *)self interactionMode])
  {
    double v3 = [(_SSSScreenshotImageView *)self delegate];
    id v6 = v3;
    id v4 = self;
    uint64_t v5 = 3;
  }
  else
  {
    double v3 = [(_SSSScreenshotImageView *)self delegate];
    id v6 = v3;
    id v4 = self;
    uint64_t v5 = 1;
  }
  [v3 imageView:v4 requestsUpdateToInteractionMode:v5];
}

- (void)imageAnalysisInteraction:(id)a3 imageAnalysisBarItemPressed:(id)a4
{
}

- (void)imageAnalysisInteraction:(id)a3 imageAnalysisButtonPressed:(id)a4
{
}

- (void)imageAnalysisInteraction:(id)a3 highlightSelectedItemsValueDidChange:(BOOL)a4
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000104D0;
  v4[3] = &unk_100099BD0;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)updateInteractionHighlightStatusIfNecessary
{
  id v7 = [(_SSSScreenshotImageView *)self imageInteraction];
  unsigned int v3 = [v7 highlightSelectableItems];
  unint64_t v4 = [(_SSSScreenshotImageView *)self interactionMode];
  if ((v4 | 2) == 3)
  {
    uint64_t v5 = v3 ? v4 | 2 : 1;
    if (v4 != v5)
    {
      id v6 = [(_SSSScreenshotImageView *)self delegate];
      [v6 imageView:self requestsUpdateToInteractionMode:v5];
    }
  }
}

- (void)cropControllerDidZoomInScrollView:(id)a3
{
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    unint64_t v4 = [(_SSSScreenshotImageView *)self paperKitImageView];
    [v4 cropControllerDidZoomInScrollView:v5];
  }
}

- (void)cropControllerDidUpdateScrollView:(id)a3
{
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    unint64_t v4 = [(_SSSScreenshotImageView *)self paperKitImageView];
    [v4 cropControllerDidUpdateScrollView:v5];
  }
}

- (void)deselectAllAnnotations
{
  if (_os_feature_enabled_impl())
  {
    id v3 = [(_SSSScreenshotImageView *)self paperKitImageView];
    [v3 deselectAllAnnotations];
  }
}

- (void)enterEditing
{
  if (_os_feature_enabled_impl())
  {
    [(_SSSScreenshotCropableView *)self->_imageView setEditable:1];
    [(_SSSScreenshotCropableView *)self->_imageView updatePaletteVisibilityIfNecessary:1];
  }
  else
  {
    id v3 = [(_SSSScreenshotAnnotationView *)self annotationOverlayView];
    unint64_t v4 = [(_SSSScreenshotAnnotationView *)self overlayController];
    id v5 = [v4 overlayView];

    if (v3 != v5)
    {
      id v6 = [(_SSSScreenshotAnnotationView *)self annotationOverlayView];
      [v6 removeFromSuperview];

      id v7 = [(_SSSScreenshotAnnotationView *)self overlayController];
      double v8 = [v7 overlayView];
      [(_SSSScreenshotAnnotationView *)self setAnnotationOverlayView:v8];

      double v9 = [(_SSSScreenshotAnnotationView *)self annotationOverlayView];
      [(_SSSScreenshotImageView *)self addSubview:v9];
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)_SSSScreenshotImageView;
  [(_SSSScreenshotAnnotationView *)&v10 enterEditing];
}

- (void)endedEditing
{
  if (_os_feature_enabled_impl()) {
    [(_SSSScreenshotCropableView *)self->_imageView setEditable:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)_SSSScreenshotImageView;
  [(_SSSScreenshotAnnotationView *)&v3 endedEditing];
}

- (void)updatePaletteVisibilityIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl())
  {
    imageView = self->_imageView;
    [(_SSSScreenshotCropableView *)imageView updatePaletteVisibilityIfNecessary:v3];
  }
}

- (void)generateSnapshotImageIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  if (v4
    && ([(_SSSScreenshotAnnotationView *)self screenshot],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 imageProvider],
        double v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    objc_initWeak(&location, self);
    double v9 = [(_SSSScreenshotAnnotationView *)self screenshot];
    objc_super v10 = [v9 imageProvider];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100010A74;
    v11[3] = &unk_100099C20;
    objc_copyWeak(&v13, &location);
    double v12 = v6;
    [v10 requestOutputImageForUI:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

- (void)setCachedViewsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    cachedOutputImageView = self->_cachedOutputImageView;
    [(_SSSScreenshotCropableView *)cachedOutputImageView setHidden:v3];
  }
}

+ (id)_createDirectoryForSysdiagnoseIfNecessary
{
  id v2 = +[NSFileManager defaultManager];
  id v7 = 0;
  unsigned __int8 v3 = [v2 createDirectoryAtPath:@"/private/var/db/sysdiagnose/com.apple.ScreenshotServicesService/" withIntermediateDirectories:1 attributes:0 error:&v7];
  id v4 = v7;

  if ((v3 & 1) == 0)
  {
    id v5 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10005EB2C((uint64_t)v4, v5);
    }
  }

  return v4;
}

+ (void)_saveImageForSysdiagnose:(id)a3
{
  id v3 = a3;
  if (MGGetBoolAnswer())
  {
    id v4 = SSCGImageBackedImageFromImage();
    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);

    id v7 = dispatch_queue_create("com.apple.ScreenshotServicesService.SysdiagnoseSavingQueue", v6);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100010E04;
    v9[3] = &unk_100099C48;
    id v10 = v4;
    uint64_t v11 = objc_opt_class();
    id v8 = v4;
    dispatch_async(v7, v9);
  }
}

- (void)_paperKitImageDidChangeInView:(id)a3 changeCounter:(unint64_t)a4
{
  id v6 = a3;
  id v17 = [(_SSSScreenshotAnnotationView *)self screenshot];
  id v7 = [v6 imageDescription];

  id v8 = [v17 viewModificationInfo];
  double v9 = [v8 imageDescription];

  id v10 = v7;
  id v11 = v9;
  double v12 = v11;
  if (v10 == v11)
  {

    double v14 = v17;
    goto LABEL_7;
  }
  if (v10 && v11)
  {
    unsigned __int8 v13 = [v10 isEqualToString:v11];

    double v14 = v17;
    if ((v13 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    double v15 = [v14 viewModificationInfo];
    [v15 setPaperKitChangeCounter:a4];
    uint64_t v16 = 2;
    goto LABEL_10;
  }

  double v14 = v17;
LABEL_9:
  double v15 = [v14 viewModificationInfo];
  [v15 setImageDescription:v10];
  uint64_t v16 = 4;
LABEL_10:

  [v17 promoteViewValueToModelValueForKey:v16 forState:0 createUndoCommand:0];
}

- (void)_paperKitImageView:(id)a3 startEditingOpacityInAccessoryView:(id)a4
{
  id v5 = a4;
  id v6 = [(_SSSScreenshotImageView *)self delegate];
  [v6 imageView:self startEditingOpacityInAccessoryView:v5];
}

- (void)_paperKitImageView:(id)a3 willBeginUpdatingImage:(id)a4
{
  id v5 = a4;
  id v6 = [(_SSSScreenshotImageView *)self cachedOutputImageView];
  [v6 setImage:v5];

  id v7 = [(_SSSScreenshotImageView *)self cachedOutputImageView];
  [v7 setHidden:0];
}

- (void)_paperKitImageView:(id)a3 didFinishUpdatingImage:(id)a4
{
  id v5 = [(_SSSScreenshotImageView *)self delegate];
  [v5 imageViewDidLoadImage:self];
}

- (id)_paperKitImageViewOverlayViewController:(id)a3
{
  id v4 = [(_SSSScreenshotImageView *)self delegate];
  id v5 = [v4 imageViewOverlayViewController:self];

  return v5;
}

- (SSSScreenshotImageViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSSScreenshotImageViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)useTrilinearMinificationFilter
{
  return self->_useTrilinearMinificationFilter;
}

- (BOOL)annotationsEnabled
{
  return self->_annotationsEnabled;
}

- (_SSSScreenshotCropableView)cachedOutputImageView
{
  return self->_cachedOutputImageView;
}

- (void)setCachedOutputImageView:(id)a3
{
}

- (VKCImageAnalyzer)imageAnalyzer
{
  return self->_imageAnalyzer;
}

- (void)setImageAnalyzer:(id)a3
{
}

- (unint64_t)interactionMode
{
  return self->_interactionMode;
}

- (BOOL)inhibitImageAnalysis
{
  return self->_inhibitImageAnalysis;
}

- (BOOL)hasOutstandingEdits
{
  return self->_hasOutstandingEdits;
}

- (void)setHasOutstandingEdits:(BOOL)a3
{
  self->_hasOutstandingEdits = a3;
}

- (VKCImageAnalysisInteraction)imageInteraction
{
  return self->_imageInteraction;
}

- (void)setImageInteraction:(id)a3
{
}

- (OS_dispatch_queue)analysisHelperQueue
{
  return self->_analysisHelperQueue;
}

- (void)setAnalysisHelperQueue:(id)a3
{
}

- (int)currentInProcessRequestID
{
  return self->_currentInProcessRequestID;
}

- (void)setCurrentInProcessRequestID:(int)a3
{
  self->_currentInProcessRequestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisHelperQueue, 0);
  objc_storeStrong((id *)&self->_imageInteraction, 0);
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
  objc_storeStrong((id *)&self->_cachedOutputImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end