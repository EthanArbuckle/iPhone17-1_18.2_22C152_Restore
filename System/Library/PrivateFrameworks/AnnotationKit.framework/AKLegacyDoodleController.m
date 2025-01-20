@interface AKLegacyDoodleController
- (AKAnnotation)coalescedAnnotation;
- (AKController)controller;
- (AKLegacyDoodleController)initWithController:(id)a3;
- (AKShapeDetectionController)shapeDetectionController;
- (AKSmoothPathView)intelligentSketchOverlayView;
- (BOOL)coalescesDoodles;
- (BOOL)ignoreAnnotationAndSelectionKVO;
- (BOOL)isIgnoringAnnotationAndSelectionKVO:(id)a3;
- (BOOL)isShowingCandidatePicker;
- (BOOL)isShowingOverlay;
- (BOOL)isWaitingToCoalesceStrokes;
- (BOOL)preferDoodle;
- (BOOL)pressureSensitiveDoodleMode;
- (BOOL)selectNewlyCreatedAnnotations;
- (BOOL)shapeDetectionController:(id)a3 shouldSelectCandidateAnnotation:(id)a4;
- (BOOL)shapeDetectionEnabled;
- (CGRect)_frameForOurOverlayInHostingView:(id)a3;
- (CGRect)recentDrawingBoundsInInputView;
- (CGRect)shapeDetectionControllerPositioningRectForCandidatePicker:(id)a3;
- (NSMutableArray)recentDoodlePaths;
- (NSMutableArray)recentDoodlesAnnotations;
- (id)createDoodleAnnotationWithPath:(CGPath *)a3 drawingBoundsInView:(CGRect)a4 drawingCenter:(CGPoint)a5 pathIsPrestroked:(BOOL)a6 shouldGoToPageController:(id *)a7;
- (id)overlayView:(id)a3;
- (id)performRecognitionBlock;
- (void)_addAnnotationImmediatelyFor:(CGPath *)a3 withDrawingCenter:(CGPoint)a4 drawingBoundsInView:(CGRect)a5 pathIsPrestroked:(BOOL)a6 isSingelDot:(BOOL)a7 fromInputView:(id)a8;
- (void)_beginOrExtendCoalescingTimer;
- (void)_clearCoalescingState;
- (void)_coalesceDrawingsCancelled;
- (void)_coalesceRecentDrawings;
- (void)_executeDeferredRecognition;
- (void)_inputView:(id)a3 didCollectPath:(CGPath *)a4 isPrestroked:(BOOL)a5;
- (void)_removeAnnotations:(id)a3 mostLikelyFromPageController:(id)a4;
- (void)_scheduleDelayedRecognitionForDrawing:(id)a3 withPath:(CGPath *)a4 boundsInView:(CGRect)a5 center:(CGPoint)a6 isPrestroked:(BOOL)a7;
- (void)beginIgnoringAnnotationSelectionObservation:(id)a3;
- (void)dealloc;
- (void)dismissCandidatePicker;
- (void)enclosingScrollViewNotification:(id)a3;
- (void)endIgnoringAnnotationSelectionObservation:(id)a3;
- (void)handleDragAction:(id)a3;
- (void)handleForwardedEvent:(id)a3;
- (void)handleTapAction:(id)a3;
- (void)inputView:(id)a3 didCollectPath:(CGPath *)a4;
- (void)inputView:(id)a3 didCollectPrestrokedPath:(CGPath *)a4;
- (void)inputViewWillStartDrawing:(id)a3;
- (void)removeOverlay;
- (void)setCoalescedAnnotation:(id)a3;
- (void)setCoalescesDoodles:(BOOL)a3;
- (void)setController:(id)a3;
- (void)setIgnoreAnnotationAndSelectionKVO:(BOOL)a3;
- (void)setIntelligentSketchOverlayView:(id)a3;
- (void)setIsShowingOverlay:(BOOL)a3;
- (void)setIsWaitingToCoalesceStrokes:(BOOL)a3;
- (void)setPerformRecognitionBlock:(id)a3;
- (void)setPreferDoodle:(BOOL)a3;
- (void)setPressureSensitiveDoodleMode:(BOOL)a3;
- (void)setRecentDoodlePaths:(id)a3;
- (void)setRecentDoodlesAnnotations:(id)a3;
- (void)setRecentDrawingBoundsInInputView:(CGRect)a3;
- (void)setSelectNewlyCreatedAnnotations:(BOOL)a3;
- (void)setShapeDetectionController:(id)a3;
- (void)setShapeDetectionEnabled:(BOOL)a3;
- (void)shapeDetectionControllerWillPickCandidate:(id)a3 isInk:(BOOL)a4;
- (void)showOverlay;
- (void)toolbarNotification:(id)a3;
- (void)updateOverlayBoundsAndBackingScale:(id)a3;
- (void)updateStrokeAttributes;
@end

@implementation AKLegacyDoodleController

- (AKLegacyDoodleController)initWithController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKLegacyDoodleController;
  v5 = [(AKLegacyDoodleController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    [(AKLegacyDoodleController *)v5 setController:v4];
    [(AKLegacyDoodleController *)v6 setSelectNewlyCreatedAnnotations:1];
    v7 = [MEMORY[0x263EFF980] array];
    [(AKLegacyDoodleController *)v6 setRecentDoodlesAnnotations:v7];

    v8 = [MEMORY[0x263EFF980] array];
    [(AKLegacyDoodleController *)v6 setRecentDoodlePaths:v8];

    -[AKLegacyDoodleController setRecentDrawingBoundsInInputView:](v6, "setRecentDrawingBoundsInInputView:", *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
    [(AKLegacyDoodleController *)v6 setIsWaitingToCoalesceStrokes:0];
    v9 = [[AKShapeDetectionController alloc] initWithController:v4];
    [(AKLegacyDoodleController *)v6 setShapeDetectionController:v9];

    v10 = [(AKLegacyDoodleController *)v6 shapeDetectionController];
    [v10 setDelegate:v6];

    -[AKLegacyDoodleController setShapeDetectionEnabled:](v6, "setShapeDetectionEnabled:", [v4 shapeDetectionEnabled]);
  }

  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel_updateOverlayBoundsAndBackingScale_ object:0];
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__coalesceRecentDrawings object:0];
  v4.receiver = self;
  v4.super_class = (Class)AKLegacyDoodleController;
  [(AKLegacyDoodleController *)&v4 dealloc];
}

- (AKSmoothPathView)intelligentSketchOverlayView
{
  intelligentSketchOverlayView = self->_intelligentSketchOverlayView;
  if (!intelligentSketchOverlayView)
  {
    objc_super v4 = [(AKLegacyDoodleController *)self controller];
    v5 = +[AKSmoothPathView newSmoothPathViewForCurrentPlatformWithController:v4];
    v6 = self->_intelligentSketchOverlayView;
    self->_intelligentSketchOverlayView = v5;

    [(AKSmoothPathView *)self->_intelligentSketchOverlayView setDelegate:self];
    [(AKSmoothPathView *)self->_intelligentSketchOverlayView setUserInteractionEnabled:0];
    intelligentSketchOverlayView = self->_intelligentSketchOverlayView;
  }

  return intelligentSketchOverlayView;
}

- (void)showOverlay
{
  if (![(AKLegacyDoodleController *)self isShowingOverlay])
  {
    [(AKLegacyDoodleController *)self setIsShowingOverlay:1];
    id v21 = [(AKLegacyDoodleController *)self controller];
    v3 = [v21 currentPageController];
    objc_super v4 = [v3 overlayView];
    v5 = [v4 superview];
    v6 = [v21 delegate];
    if (objc_opt_respondsToSelector())
    {
      v7 = [(AKLegacyDoodleController *)self intelligentSketchOverlayView];
      [v6 positionSketchOverlay:v7 forAnnotationController:v21];
    }
    else
    {
      [(AKLegacyDoodleController *)self _frameForOurOverlayInHostingView:v5];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      v16 = [(AKLegacyDoodleController *)self intelligentSketchOverlayView];
      objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

      v17 = [(AKLegacyDoodleController *)self intelligentSketchOverlayView];
      [v17 setAutoresizingMask:18];

      v18 = [(AKLegacyDoodleController *)self intelligentSketchOverlayView];
      [v5 insertSubview:v18 aboveSubview:v4];

      v7 = [v5 akEnclosingScrollView];
      if (v7) {
        [(AKLegacyDoodleController *)self updateOverlayBoundsAndBackingScale:v7];
      }
    }

    v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 addObserver:self selector:sel_enclosingScrollViewNotification_ name:@"AKOverlayView.AKContentScrollViewVisibleRectChangeNotification" object:0];

    v20 = [MEMORY[0x263F08A00] defaultCenter];
    [v20 addObserver:self selector:sel_toolbarNotification_ name:@"AKAttributeToolbarDidShowNotification" object:0];

    [(AKLegacyDoodleController *)self updateStrokeAttributes];
  }
}

- (void)removeOverlay
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel_updateOverlayBoundsAndBackingScale_ object:0];
  if ([(AKLegacyDoodleController *)self isShowingOverlay])
  {
    [(AKLegacyDoodleController *)self setIsShowingOverlay:0];
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:@"AKOverlayView.AKContentScrollViewVisibleRectChangeNotification" object:0];

    objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self name:@"AKAttributeToolbarDidShowNotification" object:0];

    v5 = [(AKLegacyDoodleController *)self shapeDetectionController];
    [v5 reset];

    v6 = [(AKLegacyDoodleController *)self intelligentSketchOverlayView];
    [v6 removeFromSuperview];

    v7 = [(AKLegacyDoodleController *)self intelligentSketchOverlayView];
    [v7 teardown];

    MEMORY[0x270F9A6D0](self, sel_setIntelligentSketchOverlayView_);
  }
}

- (void)enclosingScrollViewNotification:(id)a3
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel_updateOverlayBoundsAndBackingScale_ object:0];

  [(AKLegacyDoodleController *)self performSelector:sel_updateOverlayBoundsAndBackingScale_ withObject:0 afterDelay:0.1];
}

- (void)toolbarNotification:(id)a3
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel_updateOverlayBoundsAndBackingScale_ object:0];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(AKLegacyDoodleController *)self performSelector:sel_updateOverlayBoundsAndBackingScale_ withObject:0 afterDelay:0.0];
  objc_super v4 = (void *)MEMORY[0x263F158F8];

  [v4 commit];
}

- (void)updateOverlayBoundsAndBackingScale:(id)a3
{
  id v33 = a3;
  objc_super v4 = [(AKLegacyDoodleController *)self controller];
  v5 = [v4 delegate];
  if (objc_opt_respondsToSelector())
  {
    v6 = [(AKLegacyDoodleController *)self intelligentSketchOverlayView];
    [v5 positionSketchOverlay:v6 forAnnotationController:v4];
LABEL_13:

    goto LABEL_14;
  }
  v7 = v33;
  if (v33
    || ([(AKLegacyDoodleController *)self intelligentSketchOverlayView],
        double v8 = objc_claimAutoreleasedReturnValue(),
        [v8 akEnclosingScrollView],
        id v34 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        (v7 = v34) != 0))
  {
    id v33 = v7;
    double v9 = [v7 window];

    if (!v9) {
      goto LABEL_14;
    }
    double v10 = [v33 window];
    double v11 = [v10 screen];
    [v11 scale];
    double v13 = v12;

    [v33 zoomScale];
    double v15 = v13 * v14;
    if (v15 >= v13) {
      double v16 = v13;
    }
    else {
      double v16 = v15;
    }
    v17 = [(AKLegacyDoodleController *)self intelligentSketchOverlayView];
    v18 = [v17 layer];
    if (v16 <= 0.0)
    {
      [v18 setContentsScale:v13];

      v19 = [(AKLegacyDoodleController *)self intelligentSketchOverlayView];
      v20 = [v19 layer];
      [v20 setRasterizationScale:v13];
    }
    else
    {
      [v18 setContentsScale:v16];

      v19 = [(AKLegacyDoodleController *)self intelligentSketchOverlayView];
      v20 = [v19 layer];
      [v20 setRasterizationScale:v16];
    }

    v6 = [v4 currentPageController];
    id v21 = [v6 overlayView];
    v22 = [v21 superview];
    [(AKLegacyDoodleController *)self _frameForOurOverlayInHostingView:v22];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    v31 = [(AKLegacyDoodleController *)self intelligentSketchOverlayView];
    objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

    v32 = [(AKLegacyDoodleController *)self intelligentSketchOverlayView];
    [v32 setAutoresizingMask:18];

    goto LABEL_13;
  }
  id v33 = 0;
LABEL_14:
}

- (CGRect)_frameForOurOverlayInHostingView:(id)a3
{
  id v3 = a3;
  [v3 bounds];
  objc_msgSend(v3, "convertRect:toView:", 0);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = [v3 window];
  [v12 bounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v33.origin.x = v5;
  v33.origin.y = v7;
  v33.size.width = v9;
  v33.size.height = v11;
  v36.origin.x = v14;
  v36.origin.y = v16;
  v36.size.width = v18;
  v36.size.height = v20;
  CGRect v34 = CGRectIntersection(v33, v36);
  objc_msgSend(v3, "convertRect:fromView:", 0, v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  double v29 = v22;
  double v30 = v24;
  double v31 = v26;
  double v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)handleForwardedEvent:(id)a3
{
  id v5 = a3;
  double v4 = [(AKLegacyDoodleController *)self intelligentSketchOverlayView];
  [v4 handleForwardedEvent:v5];
}

- (void)handleTapAction:(id)a3
{
  id v5 = a3;
  double v4 = [(AKLegacyDoodleController *)self intelligentSketchOverlayView];
  [v4 handleTapAction:v5];
}

- (void)handleDragAction:(id)a3
{
  id v5 = a3;
  double v4 = [(AKLegacyDoodleController *)self intelligentSketchOverlayView];
  [v4 handleDragAction:v5];
}

- (void)updateStrokeAttributes
{
  id v6 = [(AKLegacyDoodleController *)self controller];
  id v3 = [v6 attributeController];
  double v4 = [(AKLegacyDoodleController *)self intelligentSketchOverlayView];
  id v5 = [v3 strokeColor];
  [v4 setStrokeColor:v5];

  [v3 strokeWidth];
  objc_msgSend(v4, "setStrokeWidth:");
  objc_msgSend(v4, "setPrestrokedOutputMode:", -[AKLegacyDoodleController pressureSensitiveDoodleMode](self, "pressureSensitiveDoodleMode"));
  objc_msgSend(v4, "setHasShadow:", objc_msgSend(v3, "hasShadow"));
}

- (BOOL)isShowingCandidatePicker
{
  v2 = [(AKLegacyDoodleController *)self shapeDetectionController];
  char v3 = [v2 isShowingCandidatePicker];

  return v3;
}

- (void)dismissCandidatePicker
{
  id v2 = [(AKLegacyDoodleController *)self shapeDetectionController];
  [v2 dismissCandidatePicker];
}

- (void)setShapeDetectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shapeDetectionEnabled = a3;
  id v4 = [(AKLegacyDoodleController *)self shapeDetectionController];
  [v4 setShapeDetectionEnabled:v3];
}

- (void)inputViewWillStartDrawing:(id)a3
{
  +[AKLegacyDoodleController cancelPreviousPerformRequestsWithTarget:self selector:sel__executeDeferredRecognition object:0];
  id v4 = [(AKLegacyDoodleController *)self performRecognitionBlock];

  if (v4)
  {
    id v5 = [(AKLegacyDoodleController *)self performRecognitionBlock];
    v5[2](v5, 0);

    [(AKLegacyDoodleController *)self setPerformRecognitionBlock:0];
  }
  if ([(AKLegacyDoodleController *)self coalescesDoodles])
  {
    id v6 = [(AKLegacyDoodleController *)self shapeDetectionController];
    if ([v6 isPreviousCandidateAnnotationUndecided])
    {
      BOOL v7 = [(AKLegacyDoodleController *)self isWaitingToCoalesceStrokes];

      if (v7)
      {
LABEL_8:
        [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__coalesceRecentDrawings object:0];
        goto LABEL_9;
      }
      id v6 = [(AKLegacyDoodleController *)self shapeDetectionController];
      [v6 clearPreviousCandidateAnnotation];
    }

    goto LABEL_8;
  }
LABEL_9:

  [(AKLegacyDoodleController *)self dismissCandidatePicker];
}

- (void)inputView:(id)a3 didCollectPath:(CGPath *)a4
{
}

- (void)inputView:(id)a3 didCollectPrestrokedPath:(CGPath *)a4
{
}

- (void)_inputView:(id)a3 didCollectPath:(CGPath *)a4 isPrestroked:(BOOL)a5
{
  BOOL v5 = a5;
  id v23 = a3;
  if ([(AKLegacyDoodleController *)self coalescesDoodles]) {
    [(AKLegacyDoodleController *)self _beginOrExtendCoalescingTimer];
  }
  double v8 = [v23 drawing];
  CGFloat v9 = v8;
  if (v5) {
    BoundingBodouble x = CGPathGetBoundingBox(a4);
  }
  else {
    [v8 bounds];
  }
  double x = BoundingBox.origin.x;
  double y = BoundingBox.origin.y;
  double width = BoundingBox.size.width;
  double height = BoundingBox.size.height;
  uint64_t v14 = [v9 strokeCount];
  if (v14)
  {
    v26.origin.double x = x;
    v26.origin.double y = y;
    v26.size.double width = width;
    v26.size.double height = height;
    double MidX = CGRectGetMidX(v26);
    v27.origin.double x = x;
    v27.origin.double y = y;
    v27.size.double width = width;
    v27.size.double height = height;
    double MidY = CGRectGetMidY(v27);
  }
  else
  {
    CGRect v28 = CGPathGetBoundingBox(a4);
    CGFloat v17 = v28.origin.x;
    CGFloat v18 = v28.origin.y;
    CGFloat v19 = v28.size.width;
    CGFloat v20 = v28.size.height;
    double x = CGRectGetMidX(v28);
    v29.origin.double x = v17;
    v29.origin.double y = v18;
    v29.size.double width = v19;
    v29.size.double height = v20;
    double MidY = CGRectGetMidY(v29);
    double y = MidY;
    double width = *(double *)(MEMORY[0x263F001A8] + 16);
    double height = *(double *)(MEMORY[0x263F001A8] + 24);
    double MidX = x;
  }
  double v21 = MidY;
  -[AKLegacyDoodleController _addAnnotationImmediatelyFor:withDrawingCenter:drawingBoundsInView:pathIsPrestroked:isSingelDot:fromInputView:](self, "_addAnnotationImmediatelyFor:withDrawingCenter:drawingBoundsInView:pathIsPrestroked:isSingelDot:fromInputView:", a4, v5, v14 == 0, v23, MidX, MidY, x, y, width, height);
  if (v14 && [(AKLegacyDoodleController *)self shapeDetectionEnabled])
  {
    double v22 = (void *)[v9 copy];

    if (+[AKShapeDetectionController drawingIsValidForRecognition:v22 withPath:a4])
    {
      -[AKLegacyDoodleController _scheduleDelayedRecognitionForDrawing:withPath:boundsInView:center:isPrestroked:](self, "_scheduleDelayedRecognitionForDrawing:withPath:boundsInView:center:isPrestroked:", v22, a4, v5, x, y, width, height, MidX, v21);
    }
  }
  else
  {
    double v22 = v9;
  }
}

- (void)_scheduleDelayedRecognitionForDrawing:(id)a3 withPath:(CGPath *)a4 boundsInView:(CGRect)a5 center:(CGPoint)a6 isPrestroked:(BOOL)a7
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat v12 = a5.origin.y;
  CGFloat v13 = a5.origin.x;
  id v16 = a3;
  objc_initWeak(&location, self);
  CGPathRetain(a4);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_237685BD0;
  v19[3] = &unk_264CDB7A8;
  objc_copyWeak(v21, &location);
  id v17 = v16;
  id v20 = v17;
  v21[1] = a4;
  v21[2] = *(id *)&v13;
  v21[3] = *(id *)&v12;
  v21[4] = *(id *)&width;
  v21[5] = *(id *)&height;
  v21[6] = *(id *)&x;
  v21[7] = *(id *)&y;
  BOOL v22 = a7;
  CGFloat v18 = (void *)MEMORY[0x237E1E250](v19);
  [(AKLegacyDoodleController *)self setPerformRecognitionBlock:v18];
  [(AKLegacyDoodleController *)self performSelector:sel__executeDeferredRecognition withObject:0 afterDelay:0.2];

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

- (void)_executeDeferredRecognition
{
  BOOL v3 = [(AKLegacyDoodleController *)self performRecognitionBlock];

  if (v3)
  {
    id v4 = [(AKLegacyDoodleController *)self performRecognitionBlock];
    v4[2](v4, 1);

    [(AKLegacyDoodleController *)self setPerformRecognitionBlock:0];
  }
}

- (void)_addAnnotationImmediatelyFor:(CGPath *)a3 withDrawingCenter:(CGPoint)a4 drawingBoundsInView:(CGRect)a5 pathIsPrestroked:(BOOL)a6 isSingelDot:(BOOL)a7 fromInputView:(id)a8
{
  if (a3)
  {
    BOOL v8 = a7;
    CGFloat height = a5.size.height;
    CGFloat width = a5.size.width;
    CGFloat y = a5.origin.y;
    CGFloat x = a5.origin.x;
    id v23 = 0;
    double v15 = -[AKLegacyDoodleController createDoodleAnnotationWithPath:drawingBoundsInView:drawingCenter:pathIsPrestroked:shouldGoToPageController:](self, "createDoodleAnnotationWithPath:drawingBoundsInView:drawingCenter:pathIsPrestroked:shouldGoToPageController:", a3, a6, &v23, a8, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a4.x, a4.y);
    id v16 = v23;
    if (v15)
    {
      [(AKLegacyDoodleController *)self setIgnoreAnnotationAndSelectionKVO:1];
      if (v8) {
        [v15 setPathIsDot:1];
      }
      id v17 = [(AKLegacyDoodleController *)self controller];
      CGFloat v18 = [v17 toolController];
      objc_msgSend(v18, "addNewAnnotation:onPageController:shouldSelect:shouldCascade:", v15, v16, -[AKLegacyDoodleController shapeDetectionController:shouldSelectCandidateAnnotation:](self, "shapeDetectionController:shouldSelectCandidateAnnotation:", 0, v15), 0);

      [(AKLegacyDoodleController *)self setIgnoreAnnotationAndSelectionKVO:0];
    }
    if ([(AKLegacyDoodleController *)self coalescesDoodles])
    {
      CGFloat v19 = [(AKLegacyDoodleController *)self recentDoodlePaths];
      id v20 = [MEMORY[0x263F1C478] bezierPathWithCGPath:a3];
      [v19 addObject:v20];

      if (v15)
      {
        double v21 = [(AKLegacyDoodleController *)self recentDoodlesAnnotations];
        [v21 addObject:v15];
      }
      [(AKLegacyDoodleController *)self recentDrawingBoundsInInputView];
      v26.origin.CGFloat x = x;
      v26.origin.CGFloat y = y;
      v26.size.CGFloat width = width;
      v26.size.CGFloat height = height;
      CGRect v25 = CGRectUnion(v24, v26);
      -[AKLegacyDoodleController setRecentDrawingBoundsInInputView:](self, "setRecentDrawingBoundsInInputView:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
    }
    BOOL v22 = [(AKLegacyDoodleController *)self shapeDetectionController];
    [v22 setCandidateAnnotation:v15];
  }
}

- (id)createDoodleAnnotationWithPath:(CGPath *)a3 drawingBoundsInView:(CGRect)a4 drawingCenter:(CGPoint)a5 pathIsPrestroked:(BOOL)a6 shouldGoToPageController:(id *)a7
{
  BOOL v8 = a6;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v15 = [(AKLegacyDoodleController *)self controller];
  id v16 = [v15 toolController];
  id v17 = objc_msgSend(v16, "createAnnotationOfType:centeredAtPoint:", 764018, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

  v31.origin.double x = x;
  v31.origin.double y = y;
  v31.size.double width = width;
  v31.size.double height = height;
  double MidX = CGRectGetMidX(v31);
  v32.origin.double x = x;
  v32.origin.double y = y;
  v32.size.double width = width;
  v32.size.double height = height;
  double MidY = CGRectGetMidY(v32);
  if (a3)
  {
    double v20 = MidY;
    long long v21 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    long long v28 = *MEMORY[0x263F001A8];
    long long v29 = v21;
    BOOL v22 = [(AKLegacyDoodleController *)self shapeDetectionController];
    id v23 = objc_msgSend(v22, "convertDrawingBoundsInInputView:outBoundsInPageModel:", &v28, x, y, fmax(width, 1.0), fmax(height, 1.0));

    objc_msgSend(v17, "setRectangle:", v28, v29);
    [v17 setPathIsPrestroked:v8];
    +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", 4, MidX, v20, 0, 0, 0, 0, 0, 0);
    CGRect v24 = (const CGPath *)MEMORY[0x237E1D700](a3, &v27);
    CGRect v25 = [MEMORY[0x263F1C478] bezierPathWithCGPath:v24];
    CGPathRelease(v24);
    [v17 setPath:v25];
  }
  else
  {
    id v23 = 0;
  }
  objc_msgSend(v17, "setOriginalExifOrientation:", objc_msgSend(v23, "currentModelToScreenExifOrientation"));
  [v23 modelBaseScaleFactor];
  objc_msgSend(v17, "setOriginalModelBaseScaleFactor:");
  if (a7) {
    *a7 = v23;
  }

  return v17;
}

- (id)overlayView:(id)a3
{
  BOOL v3 = [(AKLegacyDoodleController *)self intelligentSketchOverlayView];

  return v3;
}

- (void)beginIgnoringAnnotationSelectionObservation:(id)a3
{
}

- (void)endIgnoringAnnotationSelectionObservation:(id)a3
{
}

- (BOOL)isIgnoringAnnotationAndSelectionKVO:(id)a3
{
  return MEMORY[0x270F9A6D0](self, sel_ignoreAnnotationAndSelectionKVO);
}

- (BOOL)shapeDetectionController:(id)a3 shouldSelectCandidateAnnotation:(id)a4
{
  id v5 = a4;
  LOBYTE(self) = [(AKLegacyDoodleController *)self selectNewlyCreatedAnnotations];
  objc_opt_class();
  LOBYTE(self) = self & (objc_opt_isKindOfClass() ^ 1);

  return (char)self;
}

- (void)shapeDetectionControllerWillPickCandidate:(id)a3 isInk:(BOOL)a4
{
  if ([(AKLegacyDoodleController *)self coalescesDoodles])
  {
    id v5 = [(AKLegacyDoodleController *)self coalescedAnnotation];

    if (v5)
    {
      [(AKLegacyDoodleController *)self setIgnoreAnnotationAndSelectionKVO:1];
      id v6 = [(AKLegacyDoodleController *)self controller];
      [v6 undo:self];

      [(AKLegacyDoodleController *)self setCoalescedAnnotation:0];
      [(AKLegacyDoodleController *)self setIgnoreAnnotationAndSelectionKVO:0];
    }
    else
    {
      MEMORY[0x270F9A6D0](self, sel__coalesceDrawingsCancelled);
    }
  }
}

- (CGRect)shapeDetectionControllerPositioningRectForCandidatePicker:(id)a3
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)_coalesceRecentDrawings
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  double v3 = [(AKLegacyDoodleController *)self controller];
  double v4 = [(AKLegacyDoodleController *)self recentDoodlesAnnotations];
  unint64_t v5 = [v4 count];

  if (v5 < 2)
  {
    [(AKLegacyDoodleController *)self _clearCoalescingState];
  }
  else
  {
    double v6 = [(AKLegacyDoodleController *)self recentDoodlesAnnotations];
    BOOL v7 = [v6 lastObject];
    uint64_t v8 = [v7 pathIsPrestroked];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    CGFloat v9 = [(AKLegacyDoodleController *)self recentDoodlesAnnotations];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v31;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v9);
        }
        if (v8 != [*(id *)(*((void *)&v30 + 1) + 8 * v12) pathIsPrestroked]) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      CGFloat v9 = [MEMORY[0x263F1C478] bezierPath];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      CGFloat v13 = [(AKLegacyDoodleController *)self recentDoodlePaths];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v27;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v27 != v15) {
              objc_enumerationMutation(v13);
            }
            [v9 akAppendPath:*(void *)(*((void *)&v26 + 1) + 8 * v16++)];
          }
          while (v14 != v16);
          uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
        }
        while (v14);
      }

      [(AKLegacyDoodleController *)self recentDrawingBoundsInInputView];
      CGRectGetMidX(v37);
      [(AKLegacyDoodleController *)self recentDrawingBoundsInInputView];
      CGRectGetMidY(v38);
      id v17 = (const CGPath *)[v9 newCGPathForPlatformBezierPath];
      [(AKLegacyDoodleController *)self recentDrawingBoundsInInputView];
      id v25 = 0;
      CGFloat v18 = -[AKLegacyDoodleController createDoodleAnnotationWithPath:drawingBoundsInView:drawingCenter:pathIsPrestroked:shouldGoToPageController:](self, "createDoodleAnnotationWithPath:drawingBoundsInView:drawingCenter:pathIsPrestroked:shouldGoToPageController:", v17, v8, &v25);
      id v19 = v25;
      if (v18)
      {
        [(AKLegacyDoodleController *)self setIgnoreAnnotationAndSelectionKVO:1];
        double v20 = [v3 toolController];
        [v20 addNewAnnotation:v18 onPageController:v19 shouldSelect:0 shouldCascade:0];

        [(AKLegacyDoodleController *)self setCoalescedAnnotation:v18];
        long long v21 = [v19 pageModelController];
        BOOL v22 = [(AKLegacyDoodleController *)self recentDoodlesAnnotations];
        [(AKLegacyDoodleController *)self _removeAnnotations:v22 mostLikelyFromPageController:v21];

        [(AKLegacyDoodleController *)self setIgnoreAnnotationAndSelectionKVO:0];
      }
      CGPathRelease(v17);
    }
    id v23 = [(AKLegacyDoodleController *)self recentDoodlesAnnotations];
    [v23 removeAllObjects];

    CGRect v24 = [(AKLegacyDoodleController *)self recentDoodlePaths];
    [v24 removeAllObjects];

    -[AKLegacyDoodleController setRecentDrawingBoundsInInputView:](self, "setRecentDrawingBoundsInInputView:", *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
  }
  [(AKLegacyDoodleController *)self setIsWaitingToCoalesceStrokes:0];
}

- (void)_clearCoalescingState
{
  double v3 = [(AKLegacyDoodleController *)self recentDoodlesAnnotations];
  [v3 removeAllObjects];

  double v4 = [(AKLegacyDoodleController *)self recentDoodlePaths];
  [v4 removeAllObjects];

  -[AKLegacyDoodleController setRecentDrawingBoundsInInputView:](self, "setRecentDrawingBoundsInInputView:", *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));

  [(AKLegacyDoodleController *)self setCoalescedAnnotation:0];
}

- (void)_coalesceDrawingsCancelled
{
  [(AKLegacyDoodleController *)self setIsWaitingToCoalesceStrokes:0];
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__coalesceRecentDrawings object:0];

  [(AKLegacyDoodleController *)self _clearCoalescingState];
}

- (void)_beginOrExtendCoalescingTimer
{
  [(AKLegacyDoodleController *)self setIsWaitingToCoalesceStrokes:1];
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__coalesceRecentDrawings object:0];

  [(AKLegacyDoodleController *)self performSelector:sel__coalesceRecentDrawings withObject:0 afterDelay:0.25];
}

- (void)_removeAnnotations:(id)a3 mostLikelyFromPageController:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v23 = a4;
  CGRect v24 = objc_msgSend(v23, "annotations", v6);
  BOOL v7 = (void *)[v6 mutableCopy];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = sub_237686BF0;
  v29[3] = &unk_264CDB7D0;
  id v20 = v6;
  id v30 = v20;
  long long v31 = self;
  id v22 = v7;
  id v32 = v22;
  long long v21 = [v24 indexesOfObjectsPassingTest:v29];
  uint64_t v8 = [v23 mutableArrayValueForKey:@"annotations"];
  [v8 removeObjectsAtIndexes:v21];

  CGFloat v9 = [(AKLegacyDoodleController *)self controller];
  uint64_t v10 = [(AKLegacyDoodleController *)self shapeDetectionController];
  uint64_t v11 = [v10 candidateAnnotation];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v22;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v26;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * v15);
        if (v16 != v11)
        {
          id v17 = [v9 modelController];
          CGFloat v18 = [v17 pageModelControllerForAnnotation:v16];

          id v19 = [v18 mutableArrayValueForKey:@"annotations"];
          [v19 removeObject:v16];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v13);
  }
}

- (BOOL)preferDoodle
{
  return self->_preferDoodle;
}

- (void)setPreferDoodle:(BOOL)a3
{
  self->_preferDoodle = a3;
}

- (BOOL)coalescesDoodles
{
  return self->_coalescesDoodles;
}

- (void)setCoalescesDoodles:(BOOL)a3
{
  self->_coalescesDoodles = a3;
}

- (BOOL)shapeDetectionEnabled
{
  return self->_shapeDetectionEnabled;
}

- (BOOL)selectNewlyCreatedAnnotations
{
  return self->_selectNewlyCreatedAnnotations;
}

- (void)setSelectNewlyCreatedAnnotations:(BOOL)a3
{
  self->_selectNewlyCreatedAnnotations = a3;
}

- (void)setIntelligentSketchOverlayView:(id)a3
{
}

- (BOOL)pressureSensitiveDoodleMode
{
  return self->_pressureSensitiveDoodleMode;
}

- (void)setPressureSensitiveDoodleMode:(BOOL)a3
{
  self->_pressureSensitiveDoodleMode = a3;
}

- (AKShapeDetectionController)shapeDetectionController
{
  return self->_shapeDetectionController;
}

- (void)setShapeDetectionController:(id)a3
{
}

- (AKController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (id)performRecognitionBlock
{
  return self->_performRecognitionBlock;
}

- (void)setPerformRecognitionBlock:(id)a3
{
}

- (AKAnnotation)coalescedAnnotation
{
  return (AKAnnotation *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoalescedAnnotation:(id)a3
{
}

- (NSMutableArray)recentDoodlesAnnotations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRecentDoodlesAnnotations:(id)a3
{
}

- (NSMutableArray)recentDoodlePaths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRecentDoodlePaths:(id)a3
{
}

- (CGRect)recentDrawingBoundsInInputView
{
  objc_copyStruct(v6, &self->_recentDrawingBoundsInInputView, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setRecentDrawingBoundsInInputView:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_recentDrawingBoundsInInputView, &v3, 32, 1, 0);
}

- (BOOL)ignoreAnnotationAndSelectionKVO
{
  return self->_ignoreAnnotationAndSelectionKVO;
}

- (void)setIgnoreAnnotationAndSelectionKVO:(BOOL)a3
{
  self->_ignoreAnnotationAndSelectionKVO = a3;
}

- (BOOL)isShowingOverlay
{
  return self->_isShowingOverlay;
}

- (void)setIsShowingOverlay:(BOOL)a3
{
  self->_isShowingOverladouble y = a3;
}

- (BOOL)isWaitingToCoalesceStrokes
{
  return self->_isWaitingToCoalesceStrokes;
}

- (void)setIsWaitingToCoalesceStrokes:(BOOL)a3
{
  self->_isWaitingToCoalesceStrokes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentDoodlePaths, 0);
  objc_storeStrong((id *)&self->_recentDoodlesAnnotations, 0);
  objc_storeStrong((id *)&self->_coalescedAnnotation, 0);
  objc_storeStrong(&self->_performRecognitionBlock, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_shapeDetectionController, 0);

  objc_storeStrong((id *)&self->_intelligentSketchOverlayView, 0);
}

@end