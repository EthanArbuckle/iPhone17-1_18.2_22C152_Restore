@interface AKInkPageOverlayController
+ (id)newInkOverlayDrawingUndoTargetWithPageController:(id)a3;
- (AKInkOverlayView)inkOverlayView;
- (AKInkPageOverlayController)initWithPageController:(id)a3;
- (AKPageController)pageController;
- (AKShapeDetectionController)shapeDetectionController;
- (BOOL)ignoreAnnotationAndSelectionKVO;
- (BOOL)inputViewCanBeginDrawing:(id)a3 withTouch:(id)a4;
- (BOOL)isIgnoringAnnotationAndSelectionKVO:(id)a3;
- (BOOL)isWaitingToCoalesceStrokes;
- (BOOL)onlyPencilDraws;
- (BOOL)shapeDetectionController:(id)a3 shouldSelectCandidateAnnotation:(id)a4;
- (CGRect)_convertRect:(CGRect)a3 fromDrawingInCanvasView:(id)a4 toPageControllerModelSpace:(id)a5;
- (CGRect)shapeDetectionControllerPositioningRectForCandidatePicker:(id)a3;
- (CGSize)scaleFromDrawingInCanvasView:(id)a3 toPageControllerModelSpace:(id)a4;
- (PKRulerHostingDelegate)rulerHostingDelegate;
- (double)lastStrokeEndTime;
- (id)_convertCHDrawing:(id)a3 fromDrawingInCanvasView:(id)a4 toInkOverlayView:(id)a5;
- (id)delayedShapeDetectionBlock;
- (void)_controllerWillSave:(id)a3;
- (void)_enclosingScrollViewDidScroll:(id)a3;
- (void)_fullSetup;
- (void)_inkCanvasAnnotationUpdated:(id)a3;
- (void)_inkDidChangeNotification:(id)a3;
- (void)_partialTeardown;
- (void)_performDelayedShapeDetection;
- (void)_setupGestureDependencies;
- (void)_tearDownGestureDependencies;
- (void)_toolStatusUpdated:(id)a3;
- (void)_updateAllowedTouchTypesAllEnabled:(BOOL)a3 pencilEnabled:(BOOL)a4;
- (void)_updateGestureDependencyPriority;
- (void)annotationEditingDidEndWithCompletion:(id)a3;
- (void)beginIgnoringAnnotationSelectionObservation:(id)a3;
- (void)didToggleRuler;
- (void)endIgnoringAnnotationSelectionObservation:(id)a3;
- (void)inputView:(id)a3 didCollectDrawingForAnalysis:(id)a4;
- (void)inputViewDidBeginStroke:(id)a3;
- (void)setDelayedShapeDetectionBlock:(id)a3;
- (void)setIgnoreAnnotationAndSelectionKVO:(BOOL)a3;
- (void)setInkOverlayView:(id)a3;
- (void)setLastStrokeEndTime:(double)a3;
- (void)setOnlyPencilDraws:(BOOL)a3;
- (void)setPageController:(id)a3;
- (void)setRulerHostingDelegate:(id)a3;
- (void)setShapeDetectionController:(id)a3;
- (void)setup;
- (void)shapeDetectionControllerWillPickCandidate:(id)a3 isInk:(BOOL)a4;
- (void)teardown;
@end

@implementation AKInkPageOverlayController

- (AKInkPageOverlayController)initWithPageController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKInkPageOverlayController;
  v5 = [(AKInkPageOverlayController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AKInkPageOverlayController *)v5 setPageController:v4];
  }

  return v6;
}

- (void)setup
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__fullSetup object:0];
  id v15 = [(AKInkPageOverlayController *)self pageController];
  v3 = [v15 controller];
  id v4 = [v15 pageModelController];
  v5 = [v4 inkCanvasAnnotation];

  if (v5
    && ([v5 drawing],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 strokes],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v6,
        v8))
  {
    [(AKInkPageOverlayController *)self _fullSetup];
  }
  else
  {
    v9 = [v3 toolController];
    if (([v9 allInkEnabled] & 1) != 0 || objc_msgSend(v9, "pencilInkEnabled"))
    {
      [(AKInkPageOverlayController *)self performSelector:sel__fullSetup withObject:0 afterDelay:0.25];
    }
    else
    {
      v10 = [MEMORY[0x263F08A00] defaultCenter];
      v11 = off_268923F68[0];
      v12 = [v15 pageModelController];
      [v10 addObserver:self selector:sel__inkCanvasAnnotationUpdated_ name:v11 object:v12];
    }
  }
  v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 addObserver:self selector:sel__toolStatusUpdated_ name:@"AKToolController.inkToolStatusUpdated" object:0];

  v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 addObserver:self selector:sel__controllerWillSave_ name:AKControllerWillSaveNotification object:v3];
}

- (void)_fullSetup
{
  v3 = [(AKInkPageOverlayController *)self inkOverlayView];

  if (!v3)
  {
    id v51 = [(AKInkPageOverlayController *)self pageController];
    id v4 = [v51 controller];
    v5 = v4;
    if (v4 && ([v4 isTornDown] & 1) == 0)
    {
      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setDisableActions:1];
      v6 = [[AKShapeDetectionController alloc] initWithController:v5];
      [(AKInkPageOverlayController *)self setShapeDetectionController:v6];

      v7 = [(AKInkPageOverlayController *)self shapeDetectionController];
      [v7 setDelegate:self];

      uint64_t v8 = [v5 shapeDetectionEnabled];
      v9 = [(AKInkPageOverlayController *)self shapeDetectionController];
      [v9 setShapeDetectionEnabled:v8];

      v10 = [v51 pageModelController];
      v11 = [(AKInkPageOverlayController *)self shapeDetectionController];
      [v11 setModelControllerToObserveForAnnotationsAndSelections:v10];

      v12 = [v51 overlayView];
      [v12 bounds];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      v21 = [v51 inkOverlayDrawingUndoTarget];
      id v22 = +[AKInkOverlayView newAKInkOverlayViewForCurrentPlatformWithPageController:v51 drawingUndoTarget:v21];

      [(AKInkPageOverlayController *)self setInkOverlayView:v22];
      [v22 setDelegate:self];
      [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
      objc_msgSend(v22, "setFrame:", v14, v16, v18, v20);
      [v12 addSubview:v22];
      v23 = [v22 centerXAnchor];
      v24 = [v12 centerXAnchor];
      v25 = [v23 constraintEqualToAnchor:v24];
      [v25 setActive:1];

      v26 = [v22 centerYAnchor];
      v27 = [v12 centerYAnchor];
      v28 = [v26 constraintEqualToAnchor:v27];
      [v28 setActive:1];

      v29 = [v22 widthAnchor];
      v30 = [v12 widthAnchor];
      v31 = [v29 constraintEqualToAnchor:v30];
      [v31 setActive:1];

      v32 = [v22 heightAnchor];
      v50 = v12;
      v33 = [v12 heightAnchor];
      v34 = [v32 constraintEqualToAnchor:v33];
      [v34 setActive:1];

      double v35 = (double)((2 * AKAdornmentZPositionOffset) | 1uLL);
      v36 = [v22 layer];
      [v36 setZPosition:v35];

      [(AKInkPageOverlayController *)self _setupGestureDependencies];
      v37 = [v5 undoController];
      v38 = [v37 undoManager];

      int v39 = [v38 isUndoRegistrationEnabled];
      if (v39) {
        [v38 disableUndoRegistration];
      }
      v40 = [v51 pageModelController];
      v41 = [v40 inkCanvasAnnotation];

      if (v41)
      {
        v42 = [v41 drawing];

        if (v42)
        {
          v43 = [v41 drawing];
          v44 = [v22 canvasView];
          [v44 setDrawing:v43];
        }
        else
        {
          NSLog(&cfstr_TheCanvasAnnot.isa);
        }
      }
      if (v39) {
        [v38 enableUndoRegistration];
      }
      v45 = [v5 toolController];
      -[AKInkPageOverlayController _updateAllowedTouchTypesAllEnabled:pencilEnabled:](self, "_updateAllowedTouchTypesAllEnabled:pencilEnabled:", [v45 allInkEnabled], objc_msgSend(v45, "pencilInkEnabled"));
      v46 = [MEMORY[0x263F08A00] defaultCenter];
      [v5 attributeController];
      v48 = v47 = v38;
      [v46 addObserver:self selector:sel__inkDidChangeNotification_ name:@"AKAttributeController.inkDidChange" object:v48];

      v49 = [MEMORY[0x263F08A00] defaultCenter];
      [v49 addObserver:self selector:sel__enclosingScrollViewDidScroll_ name:@"AKOverlayView.AKContentScrollViewVisibleRectChangeNotification" object:0];

      [MEMORY[0x263F158F8] commit];
    }
  }
}

- (void)teardown
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__fullSetup object:0];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(AKInkPageOverlayController *)self _partialTeardown];
}

- (void)_partialTeardown
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__fullSetup object:0];
  v3 = [(AKInkPageOverlayController *)self inkOverlayView];
  if (v3)
  {
    id v7 = v3;
    id v4 = [v3 canvasView];
    [v4 setRulerActive:0];

    [(AKInkPageOverlayController *)self _tearDownGestureDependencies];
    v5 = [(AKInkPageOverlayController *)self shapeDetectionController];
    [v5 setModelControllerToObserveForAnnotationsAndSelections:0];

    v6 = [(AKInkPageOverlayController *)self shapeDetectionController];
    [v6 dismissCandidatePicker];

    [v7 teardown];
    [v7 removeFromSuperview];
    [(AKInkPageOverlayController *)self setInkOverlayView:0];
    v3 = v7;
  }
}

- (void)annotationEditingDidEndWithCompletion:(id)a3
{
  v6 = (void (**)(void))a3;
  id v4 = [(AKInkPageOverlayController *)self inkOverlayView];
  v5 = [v4 canvasView];

  if (v5)
  {
    [v5 setRulerActive:0];
    [v5 commitSelectionIfNecessaryWithCompletion:v6];
  }
  else if (v6)
  {
    v6[2]();
  }
}

- (AKInkOverlayView)inkOverlayView
{
  return self->_inkOverlayView;
}

- (void)setInkOverlayView:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_inkOverlayView, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rulerHostingDelegate);
  if (v6 && WeakRetained) {
    [(AKInkOverlayView *)self->_inkOverlayView setRulerHostingDelegate:WeakRetained];
  }
}

- (void)setRulerHostingDelegate:(id)a3
{
  p_rulerHostingDelegate = &self->_rulerHostingDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_rulerHostingDelegate, v5);
  id v7 = [(AKInkPageOverlayController *)self inkOverlayView];
  id v6 = [v7 canvasView];
  [v6 setRulerHostingDelegate:v5];
}

+ (id)newInkOverlayDrawingUndoTargetWithPageController:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](AKInkOverlayView, sel_newDrawingUndoTargetWithPageController_);
}

- (BOOL)inputViewCanBeginDrawing:(id)a3 withTouch:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(AKInkPageOverlayController *)self pageController];
  id v7 = [v6 controller];

  if ([v5 type] == 2)
  {
    if (([v7 pencilAlwaysDraws] & 1) == 0 && (objc_msgSend(v7, "annotationEditingEnabled") & 1) == 0) {
      goto LABEL_4;
    }
  }
  else if (![v7 annotationEditingEnabled])
  {
LABEL_4:
    BOOL v8 = 0;
    goto LABEL_28;
  }
  v9 = [v7 modelController];
  v10 = [v9 allSelectedAnnotations];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
    BOOL v8 = 1;
    goto LABEL_28;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v12 = objc_msgSend(v7, "modelController", 0);
  double v13 = [v12 allSelectedAnnotations];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        if ([*(id *)(*((void *)&v25 + 1) + 8 * i) conformsToAKTextAnnotationProtocol]
          && [v5 type] == 2)
        {
          BOOL v8 = 0;
          goto LABEL_27;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  double v13 = [v7 textEditorController];
  if ([v13 isEditing])
  {
    double v18 = [v13 textView];
    [v5 locationInView:v18];
    if ((objc_msgSend(v18, "pointInside:withEvent:", 0) & 1) == 0)
    {
      [v13 endEditing];
LABEL_24:
      v23 = [v7 modelController];
      [v23 deselectAllAnnotations];
    }
  }
  else
  {
    if ([v5 type] == 2)
    {
      double v18 = [v7 modelController];
      [v18 deselectAllAnnotations];
      BOOL v8 = 1;
      goto LABEL_26;
    }
    [v5 locationInView:0];
    double v20 = v19;
    double v22 = v21;
    double v18 = [v7 mainEventHandler];
    if ((objc_msgSend(v18, "hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:", 1, 1, 0, v20, v22) & 1) == 0)goto LABEL_24; {
  }
    }
  BOOL v8 = 0;
LABEL_26:

LABEL_27:
LABEL_28:

  return v8;
}

- (void)inputViewDidBeginStroke:(id)a3
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__performDelayedShapeDetection object:0];
  [(AKInkPageOverlayController *)self setDelayedShapeDetectionBlock:0];
  id v9 = [(AKInkPageOverlayController *)self pageController];
  id v4 = [v9 controller];
  id v5 = [v4 toolbarViewController];

  if (v5 && [v5 isPresentingPopovers]) {
    [v5 dismissPresentedPopovers];
  }
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"AKShapeDetectionController.shouldDismissCandidatePicker" object:self];

  id v7 = [v9 controller];
  BOOL v8 = [v7 modelController];
  [v8 deselectAllAnnotations];
}

- (void)inputView:(id)a3 didCollectDrawingForAnalysis:(id)a4
{
  id v6 = a3;
  id v30 = a4;
  id v7 = [(AKInkPageOverlayController *)self pageController];
  BOOL v8 = [v7 controller];
  id v9 = [v6 canvasView];
  v10 = [v9 drawing];
  uint64_t v11 = [v8 modelController];
  [v11 deselectAllAnnotations];

  v12 = [v7 pageModelController];
  double v13 = [v12 inkCanvasAnnotation];

  uint64_t v14 = [v10 _rootStrokes];
  uint64_t v15 = [v14 count];

  if (v13) {
    BOOL v16 = 1;
  }
  else {
    BOOL v16 = v15 == 0;
  }
  int v17 = !v16;
  if (v13 && !v15)
  {
    double v18 = [v7 pageModelController];
    double v19 = [v18 mutableArrayValueForKey:@"annotations"];

    [v19 removeObject:v13];
    double v13 = 0;
    goto LABEL_16;
  }
  if (v17)
  {
    double v13 = objc_alloc_init(AKInkAnnotation2);
    [v6 canvasSizeInPKDrawingSpace];
    -[AKInkAnnotation setDrawingSize:](v13, "setDrawingSize:");
    [v7 modelBaseScaleFactor];
    -[AKAnnotation setOriginalModelBaseScaleFactor:](v13, "setOriginalModelBaseScaleFactor:");
    [(AKAnnotation *)v13 setOriginalExifOrientation:1];
  }
  else if (!v15)
  {
    goto LABEL_14;
  }
  [v10 bounds];
  -[AKInkPageOverlayController _convertRect:fromDrawingInCanvasView:toPageControllerModelSpace:](self, "_convertRect:fromDrawingInCanvasView:toPageControllerModelSpace:", v9, v7);
  -[AKInkAnnotation setRectangle:](v13, "setRectangle:");
LABEL_14:
  if (v13)
  {
    double v20 = (void *)[v10 copy];
    [(AKInkAnnotation *)v13 setDrawing:v20];

    [(AKAnnotation *)v13 setShouldUseAppearanceOverride:0];
  }
LABEL_16:
  if (v17)
  {
    double v21 = [v7 pageModelController];
    [v21 setInkCanvasAnnotationOneTime:v13];
  }
  double Current = CFAbsoluteTimeGetCurrent();
  [(AKInkPageOverlayController *)self lastStrokeEndTime];
  double v24 = v23;
  [(AKInkPageOverlayController *)self setLastStrokeEndTime:Current];
  long long v25 = [(AKInkPageOverlayController *)self shapeDetectionController];
  if ([v25 shapeDetectionEnabled])
  {
    long long v26 = [v30 strokes];
    uint64_t v27 = [v26 count];

    if (v27 == 1)
    {
      double v28 = Current - v24;
      if (Current - v24 > 0.5)
      {
        objc_initWeak(&location, self);
        objc_initWeak(&from, v7);
        objc_initWeak(&v38, v9);
        objc_initWeak(&v37, v6);
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = sub_23765E1F4;
        v31[3] = &unk_264CDB4F8;
        objc_copyWeak(&v33, &location);
        objc_copyWeak(&v34, &from);
        objc_copyWeak(&v35, &v38);
        objc_copyWeak(&v36, &v37);
        id v32 = v30;
        [(AKInkPageOverlayController *)self setDelayedShapeDetectionBlock:v31];
        [(AKInkPageOverlayController *)self performSelector:sel__performDelayedShapeDetection withObject:0 afterDelay:0.2];

        objc_destroyWeak(&v36);
        objc_destroyWeak(&v35);
        objc_destroyWeak(&v34);
        objc_destroyWeak(&v33);
        objc_destroyWeak(&v37);
        objc_destroyWeak(&v38);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
    }
  }
  else
  {
  }
  v29 = objc_msgSend(v8, "delegate", v28);
  if (objc_opt_respondsToSelector()) {
    [v29 penStrokeCompletedForAnnotationController:v8];
  }
}

- (void)_performDelayedShapeDetection
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__performDelayedShapeDetection object:0];
  uint64_t v4 = [(AKInkPageOverlayController *)self delayedShapeDetectionBlock];
  [(AKInkPageOverlayController *)self setDelayedShapeDetectionBlock:0];
  v3 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    v3 = (void *)v4;
  }
}

- (void)shapeDetectionControllerWillPickCandidate:(id)a3 isInk:(BOOL)a4
{
  if (!a4)
  {
    [(AKInkPageOverlayController *)self setIgnoreAnnotationAndSelectionKVO:1];
    id v6 = [(AKInkPageOverlayController *)self pageController];
    id v7 = [v6 controller];
    [v7 undo:self];

    [(AKInkPageOverlayController *)self setIgnoreAnnotationAndSelectionKVO:0];
  }
}

- (CGRect)shapeDetectionControllerPositioningRectForCandidatePicker:(id)a3
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
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

- (BOOL)isWaitingToCoalesceStrokes
{
  return 0;
}

- (BOOL)shapeDetectionController:(id)a3 shouldSelectCandidateAnnotation:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(AKInkPageOverlayController *)self pageController];
  id v7 = [(id)v6 controller];
  char v8 = [v7 selectNewlyCreatedAnnotations];

  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  return v8 & (v6 ^ 1);
}

- (void)_inkDidChangeNotification:(id)a3
{
  id v12 = a3;
  double v4 = [(AKInkPageOverlayController *)self pageController];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 controller];
    id v7 = [v12 object];
    char v8 = [v6 attributeController];

    if (v7 == v8)
    {
      id v9 = [v6 attributeController];
      v10 = [v9 ink];

      uint64_t v11 = [(AKInkPageOverlayController *)self inkOverlayView];
      [v11 setInk:v10];
    }
  }
}

- (void)didToggleRuler
{
  id v7 = [(AKInkPageOverlayController *)self inkOverlayView];
  double v3 = [v7 canvasView];
  uint64_t v4 = [v3 isRulerActive] ^ 1;
  id v5 = [(AKInkPageOverlayController *)self inkOverlayView];
  uint64_t v6 = [v5 canvasView];
  [v6 setRulerActive:v4];
}

- (void)_enclosingScrollViewDidScroll:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  [v4 postNotificationName:@"AKShapeDetectionController.shouldDismissCandidatePicker" object:self];

  id v6 = [(AKInkPageOverlayController *)self inkOverlayView];
  id v5 = [v6 canvasView];
  [v5 setNeedsLayout];
}

- (void)_inkCanvasAnnotationUpdated:(id)a3
{
  uint64_t v4 = [(AKInkPageOverlayController *)self inkOverlayView];

  if (!v4)
  {
    id v5 = [(AKInkPageOverlayController *)self pageController];
    id v6 = [v5 pageModelController];
    id v11 = [v6 inkCanvasAnnotation];

    id v7 = v11;
    if (v11)
    {
      char v8 = [v11 drawing];
      id v9 = [v8 strokes];
      uint64_t v10 = [v9 count];

      id v7 = v11;
      if (v10)
      {
        [(AKInkPageOverlayController *)self _fullSetup];
        id v7 = v11;
      }
    }
  }
}

- (void)_toolStatusUpdated:(id)a3
{
  id v15 = [(AKInkPageOverlayController *)self pageController];
  uint64_t v4 = [v15 controller];
  id v5 = [v4 toolController];
  id v6 = v5;
  if (v5)
  {
    if (([v5 allInkEnabled] & 1) != 0 || objc_msgSend(v6, "pencilInkEnabled"))
    {
      id v7 = [(AKInkPageOverlayController *)self inkOverlayView];

      if (!v7) {
        [(AKInkPageOverlayController *)self _fullSetup];
      }
    }
    else
    {
      char v8 = [v15 pageModelController];
      id v9 = [v8 inkCanvasAnnotation];

      uint64_t v10 = [(AKInkPageOverlayController *)self inkOverlayView];
      if (v10)
      {
        id v11 = (void *)v10;
        id v12 = [v9 drawing];
        double v13 = [v12 strokes];
        uint64_t v14 = [v13 count];

        if (!v14) {
          [(AKInkPageOverlayController *)self _partialTeardown];
        }
      }
    }
    -[AKInkPageOverlayController _updateAllowedTouchTypesAllEnabled:pencilEnabled:](self, "_updateAllowedTouchTypesAllEnabled:pencilEnabled:", [v6 allInkEnabled], objc_msgSend(v6, "pencilInkEnabled"));
    [(AKInkPageOverlayController *)self _updateGestureDependencyPriority];
  }
}

- (void)_controllerWillSave:(id)a3
{
  id v4 = [(AKInkPageOverlayController *)self inkOverlayView];
  double v3 = [v4 canvasView];
  [v3 commitSelectionIfNecessaryWithCompletion:0];
}

- (void)_updateAllowedTouchTypesAllEnabled:(BOOL)a3 pencilEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v17 = [(AKInkPageOverlayController *)self pageController];
  id v7 = [v17 overlayView];
  char v8 = [(AKInkPageOverlayController *)self inkOverlayView];
  id v9 = [v8 drawingGestureRecognizer];

  uint64_t v10 = [v7 superview];
  id v11 = [v10 akEnclosingScrollView];
  id v12 = [v11 akEnclosingScrollView];
  double v13 = [v11 panGestureRecognizer];
  uint64_t v14 = [v12 panGestureRecognizer];
  if (v5 || v4) {
    id v15 = &unk_26EA75C80;
  }
  else {
    id v15 = &unk_26EA75C98;
  }
  [v13 setAllowedTouchTypes:v15];
  [v14 setAllowedTouchTypes:v15];
  BOOL v16 = [v9 allowedTouchTypes];
  AKLog(@"%s %@ types: %@ on recognizer: %p scrollview recognizer: %p");
}

- (void)_setupGestureDependencies
{
  id v13 = [(AKInkPageOverlayController *)self pageController];
  double v3 = [v13 controller];
  BOOL v4 = [v3 delegate];
  BOOL v5 = [(AKInkPageOverlayController *)self inkOverlayView];
  id v6 = [v5 drawingGestureRecognizer];

  id v7 = [v6 view];

  if (v7)
  {
    char v8 = [v6 view];
    [v8 removeGestureRecognizer:v6];
  }
  id v9 = [(AKInkPageOverlayController *)self inkOverlayView];
  uint64_t v10 = [v9 pinchGestureRecognizer];

  id v11 = [v10 view];

  if (v11)
  {
    id v12 = [v10 view];
    [v12 removeGestureRecognizer:v10];
  }
  if (v4)
  {
    if (objc_opt_respondsToSelector())
    {
      if (v3 && v13 && v6) {
        objc_msgSend(v4, "installDrawingGestureRecognizer:forPageAtIndex:forAnnotationController:", v6, objc_msgSend(v13, "pageIndex"), v3);
      }
    }
    else
    {
      NSLog(&cfstr_ThisClientIsMi.isa);
    }
    [(AKInkPageOverlayController *)self _updateGestureDependencyPriority];
  }
}

- (void)_updateGestureDependencyPriority
{
  v40[1] = *MEMORY[0x263EF8340];
  double v3 = [(AKInkPageOverlayController *)self pageController];
  BOOL v4 = [v3 controller];
  BOOL v5 = [v4 mainEventHandler];
  id v6 = [(AKInkPageOverlayController *)self inkOverlayView];
  id v7 = [v6 canvasView];
  char v8 = [v7 _selectionInteraction];
  [v8 setDelegate:v5];

  id v9 = [v4 delegate];
  uint64_t v10 = [(AKInkPageOverlayController *)self inkOverlayView];
  id v11 = [v10 drawingGestureRecognizer];

  if (v4 && v3 && v11)
  {
    id v12 = [v4 modelController];
    id v13 = [v12 allSelectedAnnotations];
    uint64_t v14 = [v13 count] == 0;

    id v15 = [v4 toolController];
    if (([v15 allInkEnabled] & 1) == 0 && !objc_msgSend(v15, "pencilInkEnabled")) {
      uint64_t v14 = 0;
    }
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "updateDrawingGestureRecognizer:forPageAtIndex:withPriority:forAnnotationController:", v11, objc_msgSend(v3, "pageIndex"), v14, v4);
      if (v14)
      {
        BOOL v16 = [(AKInkPageOverlayController *)self inkOverlayView];
        id v17 = [v16 canvasView];
        double v18 = [v17 _tiledView];
        char v19 = [v18 allowsFingerDrawing];

        if ((v19 & 1) == 0)
        {
          unsigned int v32 = v14;
          double v20 = [v4 tapGestureRecognizer];
          v40[0] = v20;
          double v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];

          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v22 = v21;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v39 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v34;
            do
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v34 != v25) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v27 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                [v11 removeFailureRequirement:v27];
                [v27 requireGestureRecognizerToFail:v11];
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v39 count:16];
            }
            while (v24);
          }

          uint64_t v14 = v32;
        }
      }
    }
    else
    {
      NSLog(&cfstr_ThisClientIsMi_0.isa);
    }
    double v28 = [MEMORY[0x263F08A00] defaultCenter];
    v29 = AKControllerDrawingGestureRecognizerNeedsDependencyUpdate;
    v37[0] = @"drawingGestureRecognizer";
    v37[1] = @"highPriority";
    v38[0] = v11;
    id v30 = [NSNumber numberWithBool:v14];
    v38[1] = v30;
    v31 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
    [v28 postNotificationName:v29 object:v4 userInfo:v31];
  }
}

- (void)_tearDownGestureDependencies
{
  id v7 = [(AKInkPageOverlayController *)self pageController];
  double v3 = [v7 controller];
  BOOL v4 = [v3 delegate];
  if (v4)
  {
    if (objc_opt_respondsToSelector())
    {
      BOOL v5 = [(AKInkPageOverlayController *)self inkOverlayView];
      id v6 = [v5 drawingGestureRecognizer];

      if (v3 && v7 && v6) {
        objc_msgSend(v4, "uninstallDrawingGestureRecognizer:forPageAtIndex:forAnnotationController:", v6, objc_msgSend(v7, "pageIndex"), v3);
      }
    }
    else
    {
      NSLog(&cfstr_ThisClientIsMi_1.isa);
    }
  }
}

- (CGSize)scaleFromDrawingInCanvasView:(id)a3 toPageControllerModelSpace:(id)a4
{
  -[AKInkPageOverlayController _convertRect:fromDrawingInCanvasView:toPageControllerModelSpace:](self, "_convertRect:fromDrawingInCanvasView:toPageControllerModelSpace:", a3, a4, 0.0, 0.0, 1.0, 1.0);
  double v5 = v4;
  double v7 = v6;
  result.height = v7;
  result.width = v5;
  return result;
}

- (CGRect)_convertRect:(CGRect)a3 fromDrawingInCanvasView:(id)a4 toPageControllerModelSpace:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = a4;
  id v11 = a5;
  memset(&v37[1], 0, sizeof(CGAffineTransform));
  if (v10) {
    [v10 drawingTransform];
  }
  v37[0] = v37[1];
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  CGRect v39 = CGRectApplyAffineTransform(v38, v37);
  double v12 = v39.origin.x;
  double v13 = v39.origin.y;
  double v14 = v39.size.width;
  double v15 = v39.size.height;
  BOOL v16 = [v11 overlayView];
  objc_msgSend(v10, "convertRect:toView:", v16, v12, v13, v14, v15);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  objc_msgSend(v11, "convertRectFromOverlayToModel:", v18, v20, v22, v24);
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  double v33 = v26;
  double v34 = v28;
  double v35 = v30;
  double v36 = v32;
  result.size.CGFloat height = v36;
  result.size.CGFloat width = v35;
  result.origin.CGFloat y = v34;
  result.origin.CGFloat x = v33;
  return result;
}

- (id)_convertCHDrawing:(id)a3 fromDrawingInCanvasView:(id)a4 toInkOverlayView:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x263F35C88]);
  long long v11 = *MEMORY[0x263F000D0];
  long long v12 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v13 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  if (v8)
  {
    long long v26 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v27 = *MEMORY[0x263F000D0];
    long long v25 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v8 drawingTransform];
    long long v13 = v25;
    long long v12 = v26;
    long long v11 = v27;
  }
  else
  {
    memset(&t2, 0, sizeof(t2));
  }
  *(_OWORD *)&t1.double a = v11;
  *(_OWORD *)&t1.double c = v12;
  *(_OWORD *)&t1.tCGFloat x = v13;
  CGAffineTransformConcat(&v30, &t1, &t2);
  double a = v30.a;
  double b = v30.b;
  double c = v30.c;
  double d = v30.d;
  tCGFloat x = v30.tx;
  tCGFloat y = v30.ty;
  if ([v7 strokeCount])
  {
    unint64_t v20 = 0;
    do
    {
      if ([v7 pointCountForStrokeIndex:v20])
      {
        unint64_t v21 = 0;
        do
        {
          [v7 pointForStrokeIndex:v20 pointIndex:v21];
          objc_msgSend(v8, "convertPoint:toView:", v9, tx + c * v22 + a * v23, ty + d * v22 + b * v23);
          objc_msgSend(v10, "addPoint:");
          ++v21;
        }
        while (v21 < [v7 pointCountForStrokeIndex:v20]);
      }
      [v10 endStroke];
      ++v20;
    }
    while (v20 < [v7 strokeCount]);
  }

  return v10;
}

- (AKPageController)pageController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);

  return (AKPageController *)WeakRetained;
}

- (void)setPageController:(id)a3
{
}

- (AKShapeDetectionController)shapeDetectionController
{
  return (AKShapeDetectionController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setShapeDetectionController:(id)a3
{
}

- (PKRulerHostingDelegate)rulerHostingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rulerHostingDelegate);

  return (PKRulerHostingDelegate *)WeakRetained;
}

- (BOOL)ignoreAnnotationAndSelectionKVO
{
  return self->_ignoreAnnotationAndSelectionKVO;
}

- (void)setIgnoreAnnotationAndSelectionKVO:(BOOL)a3
{
  self->_ignoreAnnotationAndSelectionKVO = a3;
}

- (BOOL)onlyPencilDraws
{
  return self->_onlyPencilDraws;
}

- (void)setOnlyPencilDraws:(BOOL)a3
{
  self->_onlyPencilDraws = a3;
}

- (id)delayedShapeDetectionBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setDelayedShapeDetectionBlock:(id)a3
{
}

- (double)lastStrokeEndTime
{
  return self->_lastStrokeEndTime;
}

- (void)setLastStrokeEndTime:(double)a3
{
  self->_lastStrokeEndTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delayedShapeDetectionBlock, 0);
  objc_destroyWeak((id *)&self->_rulerHostingDelegate);
  objc_storeStrong((id *)&self->_shapeDetectionController, 0);
  objc_destroyWeak((id *)&self->_pageController);

  objc_storeStrong((id *)&self->_inkOverlayView, 0);
}

@end