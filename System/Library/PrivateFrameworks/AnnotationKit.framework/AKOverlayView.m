@interface AKOverlayView
+ (void)initialize;
- (AKMainEventHandler)mainEventHandler;
- (AKOverlayView)initWithPageController:(id)a3;
- (AKPageController)pageController;
- (BOOL)_hasResizeHandleAtLocation:(CGPoint)a3;
- (BOOL)_isEditingTextBoxAnnotation;
- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)deferWasMovedToSuperviewUntilMoveToWindow;
- (BOOL)isObserving;
- (BOOL)isObservingEventHandling;
- (BOOL)scrollViewIsInLiveMagnify;
- (CGRect)_findResizeHandleRectAtLocation:(CGPoint)a3 withVisualStyle:(id *)a4;
- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4;
- (NSMutableDictionary)pointerRegionToHandleViewDict;
- (UIEdgeInsets)_scribbleInteraction:(id)a3 hitToleranceInsetsForElement:(id)a4 defaultInsets:(UIEdgeInsets)a5;
- (UIPointerInteraction)pointerInteraction;
- (UIScrollView)observedScrollView;
- (id)_liftOffHandleViewForRegion:(id)a3;
- (id)_liftOffHandleViewInFrame:(CGRect)a3 withPointStyle:(unint64_t)a4;
- (id)_singleSelectedAnnotation;
- (id)annotationController;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)keyCommands;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_addLiftOffHandleViewForRegion:(id)a3;
- (void)_postScrollViewRectChangedNotification;
- (void)_postScrollViewScrollOrMagnifyEndNotification;
- (void)_removeAllLiftOffHandleViews;
- (void)_removeLiftOffHandleViewForRegion:(id)a3;
- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6;
- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5;
- (void)_scrollViewDidEndAnimation:(id)a3;
- (void)_scrollViewDidEndDecelerating:(id)a3;
- (void)_scrollViewDidEndDragging:(id)a3;
- (void)_scrollViewDidScrollToTop:(id)a3;
- (void)_setupObservation;
- (void)_startObservingAnnotationEventHandlers;
- (void)_stopObservingAnnotationEventHandlers;
- (void)_teardownObservation;
- (void)_updateLayersUsingScrollView;
- (void)_updateLayersUsingScrollViewWithForcedUpdate:(BOOL)a3;
- (void)_updateLayersUsingScrollViewWithForcedUpdate:(BOOL)a3 dismissSelectionMenu:(BOOL)a4;
- (void)_wasMovedToNewSuperview;
- (void)_willEndLiveMagnify:(id)a3;
- (void)_willStartLiveMagnify:(id)a3;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)delete:(id)a3;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)duplicate:(id)a3;
- (void)editTextAnnotation:(id)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)paste:(id)a3;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setDeferWasMovedToSuperviewUntilMoveToWindow:(BOOL)a3;
- (void)setIsObserving:(BOOL)a3;
- (void)setIsObservingEventHandling:(BOOL)a3;
- (void)setMainEventHandler:(id)a3;
- (void)setObservedScrollView:(id)a3;
- (void)setPageController:(id)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setPointerRegionToHandleViewDict:(id)a3;
- (void)setScrollViewIsInLiveMagnify:(BOOL)a3;
- (void)updateLayers;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation AKOverlayView

+ (void)initialize
{
  if (qword_26AA47CE8 != -1) {
    dispatch_once(&qword_26AA47CE8, &unk_26EA57678);
  }
}

- (AKOverlayView)initWithPageController:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AKOverlayView;
  v5 = [(AKOverlayView *)&v16 init];
  v6 = v5;
  if (v5)
  {
    [(AKOverlayView *)v5 setPageController:v4];
    v7 = [v4 controller];
    v8 = [v7 mainEventHandler];
    [(AKOverlayView *)v6 setMainEventHandler:v8];

    v9 = [v4 layerPresentationManager];
    v10 = [v9 rootLayer];

    v11 = [(AKOverlayView *)v6 layer];
    [v11 addSublayer:v10];

    [(AKOverlayView *)v6 setUserInteractionEnabled:0];
    id v12 = objc_alloc_init(MEMORY[0x263F14BA0]);
    [v12 setDelegate:v6];
    [v12 setElementSource:v6];
    [(AKOverlayView *)v6 addInteraction:v12];
    v13 = (void *)[objc_alloc(MEMORY[0x263F1C878]) initWithDelegate:v6];
    [(AKOverlayView *)v6 setPointerInteraction:v13];

    v14 = [(AKOverlayView *)v6 pointerInteraction];
    [(AKOverlayView *)v6 addInteraction:v14];
  }
  return v6;
}

- (void)dealloc
{
  [(AKOverlayView *)self _teardownObservation];
  v3.receiver = self;
  v3.super_class = (Class)AKOverlayView;
  [(AKOverlayView *)&v3 dealloc];
}

- (void)willMoveToSuperview:(id)a3
{
  id v4 = a3;
  [(AKOverlayView *)self _willRemoveFromOldSuperview];
  v5.receiver = self;
  v5.super_class = (Class)AKOverlayView;
  [(AKOverlayView *)&v5 willMoveToSuperview:v4];
}

- (void)didMoveToSuperview
{
  v5.receiver = self;
  v5.super_class = (Class)AKOverlayView;
  [(AKOverlayView *)&v5 didMoveToSuperview];
  objc_super v3 = [(AKOverlayView *)self superview];

  if (v3)
  {
    id v4 = [(AKOverlayView *)self window];

    if (v4) {
      [(AKOverlayView *)self _wasMovedToNewSuperview];
    }
    else {
      [(AKOverlayView *)self setDeferWasMovedToSuperviewUntilMoveToWindow:1];
    }
  }
}

- (void)didMoveToWindow
{
  objc_super v3 = [(AKOverlayView *)self window];

  if (v3
    && [(AKOverlayView *)self deferWasMovedToSuperviewUntilMoveToWindow])
  {
    [(AKOverlayView *)self setDeferWasMovedToSuperviewUntilMoveToWindow:0];
    [(AKOverlayView *)self _wasMovedToNewSuperview];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)AKOverlayView;
  v8 = -[AKOverlayView hitTest:withEvent:](&v38, sel_hitTest_withEvent_, v7, x, y);
  v9 = [(AKOverlayView *)self pageController];
  v10 = [v9 controller];
  v11 = v10;
  if (!v8)
  {
    id v12 = [v10 textEditorController];
    v13 = [v12 textView];

    if (!v13
      || (-[AKOverlayView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y),
          double v15 = v14,
          double v17 = v16,
          !objc_msgSend(v13, "pointInside:withEvent:", v7))
      || (objc_msgSend(v13, "hitTest:withEvent:", v7, v15, v17),
          (v8 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v33 = v13;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v18 = [(AKOverlayView *)self subviews];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v35;
LABEL_7:
        uint64_t v22 = 0;
        while (1)
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v34 + 1) + 8 * v22);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          if (v20 == ++v22)
          {
            uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v39 count:16];
            if (v20) {
              goto LABEL_7;
            }
            goto LABEL_13;
          }
        }
        id v24 = v23;

        if (!v24) {
          goto LABEL_17;
        }
        -[AKOverlayView convertPoint:toView:](self, "convertPoint:toView:", v24, x, y);
        double v26 = v25;
        double v28 = v27;
        v13 = v33;
        if (objc_msgSend(v24, "pointInside:withEvent:", v7))
        {
          v8 = objc_msgSend(v24, "hitTest:withEvent:", v7, v26, v28);
        }
        else
        {
          v8 = 0;
        }
      }
      else
      {
LABEL_13:

        id v24 = 0;
LABEL_17:
        v8 = 0;
        v13 = v33;
      }
    }
  }
  v29 = [v11 overlayInteractionDelegate];
  v30 = v29;
  if (v8) {
    BOOL v31 = v29 == 0;
  }
  else {
    BOOL v31 = 1;
  }
  if (!v31
    && (objc_msgSend(v29, "annotationController:shouldAllowOverlayHitTestAtPoint:forOverlayView:currentHitTest:", v11, self, v8, x, y) & 1) == 0)
  {

    v8 = 0;
  }

  return v8;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)_startObservingAnnotationEventHandlers
{
  if (![(AKOverlayView *)self isObservingEventHandling])
  {
    id v5 = [(AKOverlayView *)self pageController];
    objc_super v3 = [v5 controller];
    id v4 = [v3 mainEventHandler];
    [v4 addObserver:self forKeyPath:@"annotationEventHandler" options:0 context:@"AKOverlayView.eventHandlingObservationContext"];
    [(AKOverlayView *)self setIsObservingEventHandling:1];
  }
}

- (void)_stopObservingAnnotationEventHandlers
{
  if ([(AKOverlayView *)self isObservingEventHandling])
  {
    id v5 = [(AKOverlayView *)self pageController];
    objc_super v3 = [v5 controller];
    id v4 = [v3 mainEventHandler];
    [v4 removeObserver:self forKeyPath:@"annotationEventHandler" context:@"AKOverlayView.eventHandlingObservationContext"];
    [(AKOverlayView *)self setIsObservingEventHandling:0];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(AKOverlayView *)self pageController];
  double v14 = [v13 controller];

  if (a6 == @"AKOverlayView.contentViewMagnificationObservationContext")
  {
    [(AKOverlayView *)self _updateLayersUsingScrollView];
    [(AKOverlayView *)self _postScrollViewRectChangedNotification];
    goto LABEL_28;
  }
  if (a6 == @"AKOverlayView.overlayViewSizeObservationContext")
  {
    double v15 = [v12 objectForKey:*MEMORY[0x263F081C8]];
    double v16 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    [v15 akRectValue];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    double v22 = v21;
    double v24 = v23;
    [v16 akRectValue];
    v44.origin.double x = v25;
    v44.origin.double y = v26;
    double v28 = v27;
    double v30 = v29;
    v43.origin.double x = v18;
    v43.origin.double y = v20;
    v43.size.width = v22;
    v43.size.height = v24;
    v44.size.width = v28;
    v44.size.height = v30;
    if (CGRectEqualToRect(v43, v44))
    {
LABEL_23:

      goto LABEL_28;
    }
    if (v22 == v28 && v24 == v30)
    {
LABEL_22:
      [(AKOverlayView *)self _postScrollViewRectChangedNotification];
      goto LABEL_23;
    }
LABEL_21:
    [(AKOverlayView *)self _updateLayersUsingScrollViewWithForcedUpdate:1];
    goto LABEL_22;
  }
  if (a6 == @"AKOverlayView.contentViewContentSizeObservationContext")
  {
    double v15 = [v12 objectForKey:*MEMORY[0x263F081C8]];
    double v16 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    [v15 akSizeValue];
    double v33 = v32;
    double v35 = v34;
    [v16 akSizeValue];
    if (v33 == v37 && v35 == v36) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  if (a6 == @"AKOverlayView.controllerAnnotationEditingContext")
  {
    uint64_t v39 = [v14 annotationEditingEnabled];
LABEL_26:
    uint64_t v40 = v39;
    v41 = [(AKOverlayView *)self pointerInteraction];
    [v41 setEnabled:v40];

    goto LABEL_28;
  }
  if (a6 == @"AKOverlayView.controllerFormFillingContext")
  {
    uint64_t v39 = [v14 formFillingEnabled];
    goto LABEL_26;
  }
  if (a6 == @"AKOverlayView.eventHandlingObservationContext")
  {
    [(AKOverlayView *)self _removeAllLiftOffHandleViews];
  }
  else if (a6 != @"AKOverlayView.selectedAnnotationsContext")
  {
    v42.receiver = self;
    v42.super_class = (Class)AKOverlayView;
    [(AKOverlayView *)&v42 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
LABEL_28:
}

- (void)updateLayers
{
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v8 = a3;
  id v4 = [(AKOverlayView *)self layer];

  if (v4 == v8)
  {
    id v5 = [(AKOverlayView *)self pageController];
    v6 = [v5 layerPresentationManager];
    id v7 = [v6 rootLayer];

    [v8 bounds];
    objc_msgSend(v7, "setFrame:");
  }
}

- (id)keyCommands
{
  v2 = [(AKOverlayView *)self annotationController];
  objc_super v3 = [v2 keyCommandsForAnnotations];

  return v3;
}

- (id)annotationController
{
  v2 = [(AKOverlayView *)self pageController];
  objc_super v3 = [v2 controller];

  return v3;
}

- (void)cut:(id)a3
{
  id v4 = a3;
  id v5 = [(AKOverlayView *)self annotationController];
  [v5 cut:v4];
}

- (void)copy:(id)a3
{
  id v4 = a3;
  id v5 = [(AKOverlayView *)self annotationController];
  [v5 copy:v4];
}

- (void)paste:(id)a3
{
  id v4 = a3;
  id v5 = [(AKOverlayView *)self annotationController];
  [v5 paste:v4];
}

- (void)delete:(id)a3
{
  id v4 = a3;
  id v5 = [(AKOverlayView *)self annotationController];
  [v5 delete:v4];
}

- (void)duplicate:(id)a3
{
  id v4 = a3;
  id v5 = [(AKOverlayView *)self annotationController];
  [v5 duplicate:v4];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  id v7 = [(AKOverlayView *)self annotationController];
  id v8 = [v7 textEditorController];
  v9 = [v8 textView];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v9 isBlockedAction:a3]) {
    goto LABEL_3;
  }
  char v18 = 0;
  unsigned __int8 v11 = [v7 canPerformKeyCommandAction:a3 withSender:v6 handled:&v18];
  if (v18)
  {
LABEL_5:
    BOOL v10 = v11;
    goto LABEL_6;
  }
  uint64_t v13 = [MEMORY[0x263F1C7B0] sharedMenuController];
  if ((id)v13 == v6)
  {
  }
  else
  {
    double v14 = (void *)v13;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v16.receiver = self;
      v16.super_class = (Class)AKOverlayView;
      unsigned __int8 v11 = [(AKOverlayView *)&v16 canPerformAction:a3 withSender:v6];
      goto LABEL_5;
    }
  }
  if (sel_editTextAnnotation_ == a3)
  {
    unsigned __int8 v11 = [v7 validateEditTextAnnotation:v6];
    goto LABEL_5;
  }
  if (sel_duplicate_ == a3)
  {
    unsigned __int8 v11 = [v7 validateDuplicate:v6];
    goto LABEL_5;
  }
  if (sel_delete_ == a3)
  {
    unsigned __int8 v11 = [v7 validateDelete:v6];
    goto LABEL_5;
  }
  if (sel_cut_ == a3)
  {
    unsigned __int8 v11 = [v7 validateCut:v6];
    goto LABEL_5;
  }
  if (sel_copy_ == a3)
  {
    unsigned __int8 v11 = [v7 validateCopy:v6];
    goto LABEL_5;
  }
  if (sel_paste_ != a3)
  {
    v17.receiver = self;
    v17.super_class = (Class)AKOverlayView;
    unsigned __int8 v11 = [(AKOverlayView *)&v17 canPerformAction:a3 withSender:v6];
    goto LABEL_5;
  }
LABEL_3:
  BOOL v10 = 0;
LABEL_6:

  return v10;
}

- (void)editTextAnnotation:(id)a3
{
  id v6 = a3;
  id v4 = [(AKOverlayView *)self pageController];
  id v5 = [v4 controller];
  if ([v5 validateEditTextAnnotation:v6]) {
    [v5 editTextAnnotation:v6];
  }
}

- (id)_singleSelectedAnnotation
{
  v2 = [(AKOverlayView *)self pageController];
  objc_super v3 = [v2 controller];
  id v4 = [v3 modelController];
  id v5 = [v4 allSelectedAnnotations];

  if ([v5 count] == 1)
  {
    id v6 = [v5 firstObject];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_postScrollViewRectChangedNotification
{
  v2 = (void *)MEMORY[0x263F089F8];
  objc_super v3 = [(AKOverlayView *)self observedScrollView];
  id v5 = [v2 notificationWithName:@"AKOverlayView.AKContentScrollViewVisibleRectChangeNotification" object:v3];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotification:v5];
}

- (void)_postScrollViewScrollOrMagnifyEndNotification
{
  v2 = (void *)MEMORY[0x263F089F8];
  objc_super v3 = [(AKOverlayView *)self observedScrollView];
  id v5 = [v2 notificationWithName:@"AKOverlayView.AKContentScrollViewEndScrollOrMagnifyNotification" object:v3];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotification:v5];
}

- (void)_updateLayersUsingScrollView
{
}

- (void)_updateLayersUsingScrollViewWithForcedUpdate:(BOOL)a3
{
}

- (void)_updateLayersUsingScrollViewWithForcedUpdate:(BOOL)a3 dismissSelectionMenu:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(AKOverlayView *)self window];

  if (v7)
  {
    id v8 = [(AKOverlayView *)self observedScrollView];
    int v9 = [v8 isZooming];

    uint64_t v10 = v9 | [(AKOverlayView *)self scrollViewIsInLiveMagnify];
    uint64_t v11 = [(AKOverlayView *)self observedScrollView];
    double v12 = 1.0;
    if (v11)
    {
      uint64_t v13 = (void *)v11;
      double v14 = [(AKOverlayView *)self observedScrollView];
      double v15 = [v14 window];

      if (v15)
      {
        objc_super v16 = [(AKOverlayView *)self observedScrollView];
        [v16 zoomScale];
        double v12 = v17;
      }
    }
    id v19 = [(AKOverlayView *)self pageController];
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    [v19 updateScaleFactor:v10 isLiveUpdate:v5 forceUpdate:v12];
    [MEMORY[0x263F158F8] commit];
    if (v4)
    {
      char v18 = [v19 controller];
      [v18 hideSelectionMenu:0];
    }
  }
}

- (void)_setupObservation
{
  if (![(AKOverlayView *)self isObserving])
  {
    [(AKOverlayView *)self setIsObserving:1];
    [(AKOverlayView *)self _startObservingAnnotationEventHandlers];
    objc_super v3 = [(UIView *)self akEnclosingScrollView];
    [(AKOverlayView *)self setObservedScrollView:v3];

    BOOL v4 = [(AKOverlayView *)self observedScrollView];

    if (v4)
    {
      BOOL v5 = [(AKOverlayView *)self observedScrollView];
      [v5 addObserver:self forKeyPath:@"contentSize" options:3 context:@"AKOverlayView.contentViewContentSizeObservationContext"];

      [(AKOverlayView *)self addObserver:self forKeyPath:@"pageController.controller.annotationEditingEnabled" options:0 context:@"AKOverlayView.controllerAnnotationEditingContext"];
      [(AKOverlayView *)self addObserver:self forKeyPath:@"pageController.controller.formFillingEnabled" options:0 context:@"AKOverlayView.controllerFormFillingContext"];
      id v6 = [MEMORY[0x263F08A00] defaultCenter];
      id v7 = [(AKOverlayView *)self observedScrollView];
      [v6 addObserver:self selector:sel__willStartLiveMagnify_ name:@"UITextSelectionWillZoom" object:v7];

      id v8 = [MEMORY[0x263F08A00] defaultCenter];
      int v9 = [(AKOverlayView *)self observedScrollView];
      [v8 addObserver:self selector:sel__willEndLiveMagnify_ name:@"UITextSelectionDidZoom" object:v9];

      uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v11 = *MEMORY[0x263F1D8A8];
      double v12 = [(AKOverlayView *)self observedScrollView];
      [v10 addObserver:self selector:sel__scrollViewDidEndDragging_ name:v11 object:v12];

      uint64_t v13 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v14 = *MEMORY[0x263F1D8A0];
      double v15 = [(AKOverlayView *)self observedScrollView];
      [v13 addObserver:self selector:sel__scrollViewDidEndDecelerating_ name:v14 object:v15];

      objc_super v16 = [MEMORY[0x263F08A00] defaultCenter];
      double v17 = [(AKOverlayView *)self observedScrollView];
      [v16 addObserver:self selector:sel__scrollViewDidEndAnimation_ name:@"_UIScrollViewAnimationEndedNotification" object:v17];

      char v18 = [MEMORY[0x263F08A00] defaultCenter];
      id v19 = [(AKOverlayView *)self observedScrollView];
      [v18 addObserver:self selector:sel__scrollViewDidScrollToTop_ name:@"AKScrollViewDidScrollToTopNotification" object:v19];

      CGFloat v20 = [(AKOverlayView *)self observedScrollView];
      [v20 addObserver:self forKeyPath:@"frame" options:3 context:@"AKOverlayView.overlayViewSizeObservationContext"];

      double v21 = [(AKOverlayView *)self observedScrollView];
      [v21 addObserver:self forKeyPath:@"bounds" options:3 context:@"AKOverlayView.overlayViewSizeObservationContext"];

      [(AKOverlayView *)self addObserver:self forKeyPath:@"frame" options:3 context:@"AKOverlayView.overlayViewSizeObservationContext"];
      [(AKOverlayView *)self addObserver:self forKeyPath:@"bounds" options:3 context:@"AKOverlayView.overlayViewSizeObservationContext"];
    }
    else
    {
      NSLog(&cfstr_CouldnTFindAnE.isa);
    }
  }
}

- (void)_teardownObservation
{
  if ([(AKOverlayView *)self isObserving])
  {
    [(AKOverlayView *)self setIsObserving:0];
    [(AKOverlayView *)self _stopObservingAnnotationEventHandlers];
    objc_super v3 = [(AKOverlayView *)self observedScrollView];

    if (v3)
    {
      BOOL v4 = [(AKOverlayView *)self observedScrollView];
      [v4 removeObserver:self forKeyPath:@"contentSize" context:@"AKOverlayView.contentViewContentSizeObservationContext"];

      [(AKOverlayView *)self removeObserver:self forKeyPath:@"pageController.controller.annotationEditingEnabled" context:@"AKOverlayView.controllerAnnotationEditingContext"];
      [(AKOverlayView *)self removeObserver:self forKeyPath:@"pageController.controller.formFillingEnabled" context:@"AKOverlayView.controllerFormFillingContext"];
      BOOL v5 = [MEMORY[0x263F08A00] defaultCenter];
      id v6 = [(AKOverlayView *)self observedScrollView];
      [v5 removeObserver:self name:@"UITextSelectionWillZoom" object:v6];

      id v7 = [MEMORY[0x263F08A00] defaultCenter];
      id v8 = [(AKOverlayView *)self observedScrollView];
      [v7 removeObserver:self name:@"UITextSelectionDidZoom" object:v8];

      int v9 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v10 = *MEMORY[0x263F1D8A8];
      uint64_t v11 = [(AKOverlayView *)self observedScrollView];
      [v9 removeObserver:self name:v10 object:v11];

      double v12 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v13 = *MEMORY[0x263F1D8A0];
      uint64_t v14 = [(AKOverlayView *)self observedScrollView];
      [v12 removeObserver:self name:v13 object:v14];

      double v15 = [MEMORY[0x263F08A00] defaultCenter];
      objc_super v16 = [(AKOverlayView *)self observedScrollView];
      [v15 removeObserver:self name:@"_UIScrollViewAnimationEndedNotification" object:v16];

      double v17 = [MEMORY[0x263F08A00] defaultCenter];
      char v18 = [(AKOverlayView *)self observedScrollView];
      [v17 removeObserver:self name:@"AKScrollViewDidScrollToTopNotification" object:v18];

      id v19 = [(AKOverlayView *)self observedScrollView];
      [v19 removeObserver:self forKeyPath:@"frame" context:@"AKOverlayView.overlayViewSizeObservationContext"];

      CGFloat v20 = [(AKOverlayView *)self observedScrollView];
      [v20 removeObserver:self forKeyPath:@"bounds" context:@"AKOverlayView.overlayViewSizeObservationContext"];

      [(AKOverlayView *)self removeObserver:self forKeyPath:@"frame" context:@"AKOverlayView.overlayViewSizeObservationContext"];
      [(AKOverlayView *)self removeObserver:self forKeyPath:@"bounds" context:@"AKOverlayView.overlayViewSizeObservationContext"];
      [(AKOverlayView *)self setObservedScrollView:0];
    }
  }
}

- (void)_wasMovedToNewSuperview
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  id v3 = [(AKOverlayView *)self pageController];
  [v3 overlayWasAddedToSuperview];
  [(AKOverlayView *)self _setupObservation];
  [(AKOverlayView *)self _updateLayersUsingScrollView];
  [MEMORY[0x263F158F8] commit];
}

- (void)_willStartLiveMagnify:(id)a3
{
  BOOL v4 = [a3 object];
  BOOL v5 = [(AKOverlayView *)self observedScrollView];

  if (v4 == v5)
  {
    [(AKOverlayView *)self setScrollViewIsInLiveMagnify:1];
  }
}

- (void)_willEndLiveMagnify:(id)a3
{
  BOOL v4 = [a3 object];
  BOOL v5 = [(AKOverlayView *)self observedScrollView];

  if (v4 == v5)
  {
    [(AKOverlayView *)self setScrollViewIsInLiveMagnify:0];
    [(AKOverlayView *)self _updateLayersUsingScrollViewWithForcedUpdate:1 dismissSelectionMenu:0];
    [(AKOverlayView *)self _postScrollViewScrollOrMagnifyEndNotification];
  }
}

- (void)_scrollViewDidEndDragging:(id)a3
{
  id v9 = a3;
  BOOL v4 = [v9 object];
  BOOL v5 = [(AKOverlayView *)self observedScrollView];

  if (v4 == v5)
  {
    id v6 = [v9 userInfo];
    id v7 = [v6 objectForKey:*MEMORY[0x263F1D8B0]];
    char v8 = [v7 BOOLValue];

    if ((v8 & 1) == 0)
    {
      [(AKOverlayView *)self _updateLayersUsingScrollViewWithForcedUpdate:1];
      [(AKOverlayView *)self _postScrollViewScrollOrMagnifyEndNotification];
    }
  }
}

- (void)_scrollViewDidEndDecelerating:(id)a3
{
  BOOL v4 = [a3 object];
  BOOL v5 = [(AKOverlayView *)self observedScrollView];

  if (v4 == v5)
  {
    [(AKOverlayView *)self _updateLayersUsingScrollViewWithForcedUpdate:1];
    [(AKOverlayView *)self _postScrollViewScrollOrMagnifyEndNotification];
  }
}

- (void)_scrollViewDidEndAnimation:(id)a3
{
  BOOL v4 = [a3 object];
  BOOL v5 = [(AKOverlayView *)self observedScrollView];

  if (v4 == v5)
  {
    [(AKOverlayView *)self _updateLayersUsingScrollViewWithForcedUpdate:1];
    [(AKOverlayView *)self _postScrollViewScrollOrMagnifyEndNotification];
  }
}

- (void)_scrollViewDidScrollToTop:(id)a3
{
  BOOL v4 = [a3 object];
  BOOL v5 = [(AKOverlayView *)self observedScrollView];

  if (v4 == v5)
  {
    [(AKOverlayView *)self _updateLayersUsingScrollViewWithForcedUpdate:1];
    [(AKOverlayView *)self _postScrollViewScrollOrMagnifyEndNotification];
  }
}

- (CGRect)_findResizeHandleRectAtLocation:(CGPoint)a3 withVisualStyle:(id *)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  char v8 = [(AKOverlayView *)self _singleSelectedAnnotation];
  if (v8)
  {
    id v9 = [(AKOverlayView *)self pageController];
    id v42 = 0;
    id v43 = 0;
    +[AKAnnotationPointOfInterestHelper pointsOfInterest:&v43 withVisualStyle:&v42 ofAnnotation:v8 pageControllerForPixelAlignment:v9];
    id v10 = v43;
    id v11 = v42;
    uint64_t v36 = 0;
    double v37 = (double *)&v36;
    uint64_t v38 = 0x4010000000;
    uint64_t v39 = &unk_2376FA1DD;
    long long v12 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    long long v40 = *MEMORY[0x263F001A8];
    long long v41 = v12;
    uint64_t v30 = 0;
    BOOL v31 = &v30;
    uint64_t v32 = 0x3032000000;
    double v33 = sub_2376AB49C;
    double v34 = sub_2376AB4AC;
    id v35 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_2376AB4B4;
    v23[3] = &unk_264CDBAB8;
    id v13 = v9;
    id v24 = v13;
    id v14 = v11;
    CGFloat v28 = x;
    CGFloat v29 = y;
    id v25 = v14;
    CGFloat v26 = &v36;
    double v27 = &v30;
    [v10 enumerateObjectsUsingBlock:v23];
    if (a4) {
      *a4 = (id) v31[5];
    }
    double v15 = v37[4];
    double v16 = v37[5];
    double v17 = v37[6];
    double v18 = v37[7];

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);
  }
  else
  {
    double v15 = *MEMORY[0x263F001A0];
    double v16 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v17 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v18 = *(double *)(MEMORY[0x263F001A0] + 24);
  }

  double v19 = v15;
  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (BOOL)_hasResizeHandleAtLocation:(CGPoint)a3
{
  id v14 = 0;
  -[AKOverlayView _findResizeHandleRectAtLocation:withVisualStyle:](self, "_findResizeHandleRectAtLocation:withVisualStyle:", &v14, a3.x, a3.y);
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = v14;
  v15.origin.CGFloat x = v4;
  v15.origin.CGFloat y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  BOOL v12 = 0;
  if (!CGRectIsEmpty(v15) && v11) {
    BOOL v12 = (unint64_t)[v11 integerValue] < 2;
  }

  return v12;
}

- (id)_liftOffHandleViewInFrame:(CGRect)a3 withPointStyle:(unint64_t)a4
{
  if (a4 <= 1)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    id v11 = [(AKOverlayView *)self _singleSelectedAnnotation];
    if (v11)
    {
      BOOL v12 = [(AKOverlayView *)self pageController];
      id v13 = [v12 layerPresentationManager];
      id v14 = [v13 adornmentLayerForAnnotation:v11];

      if (v14)
      {
        CGRect v15 = [v14 handleSublayerWithStyle:a4];
        CGFloat v4 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", x, y, width, height);
        double v16 = [v4 layer];
        [v16 addSublayer:v15];

        [v4 bounds];
        CGFloat v17 = v24.origin.x;
        CGFloat v18 = v24.origin.y;
        CGFloat v19 = v24.size.width;
        CGFloat v20 = v24.size.height;
        double MidX = CGRectGetMidX(v24);
        v25.origin.double x = v17;
        v25.origin.double y = v18;
        v25.size.double width = v19;
        v25.size.double height = v20;
        objc_msgSend(v15, "setPosition:", MidX, CGRectGetMidY(v25));
      }
      else
      {
        CGFloat v4 = 0;
      }
    }
    else
    {
      CGFloat v4 = 0;
    }
  }
  else
  {
    CGFloat v4 = 0;
  }

  return v4;
}

- (id)_liftOffHandleViewForRegion:(id)a3
{
  id v4 = a3;
  double v5 = [(AKOverlayView *)self pointerRegionToHandleViewDict];
  CGFloat v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)_addLiftOffHandleViewForRegion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v14 = v4;
    double v5 = [(AKOverlayView *)self pointerRegionToHandleViewDict];

    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [(AKOverlayView *)self setPointerRegionToHandleViewDict:v6];
    }
    double v7 = [(AKOverlayView *)self pointerRegionToHandleViewDict];
    CGFloat v8 = [v7 objectForKey:v14];

    if (!v8)
    {
      double v9 = [v14 identifier];
      CGFloat v10 = v9;
      if (v9)
      {
        unint64_t v11 = [v9 integerValue];
        if (v11 <= 1)
        {
          unint64_t v12 = v11;
          [v14 rect];
          id v13 = -[AKOverlayView _liftOffHandleViewInFrame:withPointStyle:](self, "_liftOffHandleViewInFrame:withPointStyle:", v12);
          if (v13)
          {
            [(AKOverlayView *)self addSubview:v13];
            [v7 setObject:v13 forKey:v14];
          }
        }
      }
    }
    id v4 = v14;
  }
}

- (void)_removeAllLiftOffHandleViews
{
  v2 = [(AKOverlayView *)self pointerRegionToHandleViewDict];
  if (v2)
  {
    id v3 = v2;
    [v2 enumerateKeysAndObjectsUsingBlock:&unk_26EA578D8];
    [v3 removeAllObjects];
    v2 = v3;
  }
}

- (void)_removeLiftOffHandleViewForRegion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    double v5 = [(AKOverlayView *)self pointerRegionToHandleViewDict];
    id v6 = [v5 objectForKey:v8];
    double v7 = v6;
    if (v6)
    {
      [v6 removeFromSuperview];
      [v5 removeObjectForKey:v8];
    }

    id v4 = v8;
  }
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL v7 = [(AKOverlayView *)self _isEditingTextBoxAnnotation];
  if (v7) {
    LOBYTE(v7) = !-[AKOverlayView _hasResizeHandleAtLocation:](self, "_hasResizeHandleAtLocation:", x, y);
  }
  return v7;
}

- (BOOL)_isEditingTextBoxAnnotation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(AKOverlayView *)self pageController];
  id v3 = [v2 controller];

  if ([v3 annotationEditingEnabled])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    id v4 = objc_msgSend(v3, "modelController", 0, 0);
    double v5 = [v4 allSelectedAnnotations];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      char v7 = 0;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            char v7 = 1;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
      LOBYTE(v6) = v7 & 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (UIEdgeInsets)_scribbleInteraction:(id)a3 hitToleranceInsetsForElement:(id)a4 defaultInsets:(UIEdgeInsets)a5
{
  double v5 = a5.top + -30.0;
  double v6 = a5.bottom + -30.0;
  double v7 = a5.left + -100.0;
  double v8 = a5.right + -100.0;
  result.right = v8;
  result.bottom = v6;
  result.left = v7;
  result.top = v5;
  return result;
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  double v6 = (void (**)(id, void *, uint64_t))a5;
  double v7 = [(AKOverlayView *)self pageController];
  double v8 = [v7 controller];

  double v9 = [v8 textEditorController];
  CGFloat v10 = [v9 annotation];
  long long v11 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  if ([v8 annotationEditingEnabled])
  {
    double v22 = v9;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v12 = [v8 modelController];
    long long v13 = [v12 allSelectedAnnotations];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          CGFloat v18 = *(void **)(*((void *)&v23 + 1) + 8 * v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && ([v18 editingDisabled] & 1) == 0)
          {
            CGFloat v19 = [v18 UUID];
            [v11 addObject:v19];
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }

    double v9 = v22;
  }
  if (v10)
  {
    CGFloat v20 = [v10 UUID];
    uint64_t v21 = [v11 indexOfObject:v20];
  }
  else
  {
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v6[2](v6, v11, v21);
}

- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a4;
  double v6 = [(AKOverlayView *)self pageController];
  double v7 = [v6 controller];
  double v8 = *MEMORY[0x263F001A0];
  double v9 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v12 = objc_msgSend(v7, "modelController", 0);
  long long v13 = [v12 allSelectedAnnotations];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v13);
        }
        CGFloat v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        CGFloat v19 = [v18 UUID];
        int v20 = [v19 isEqual:v5];

        if (v20)
        {
          [v18 hitTestBounds];
          double v8 = v21;
          double v9 = v22;
          double v10 = v23;
          double v11 = v24;
          goto LABEL_11;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v39.origin.double x = v8;
  v39.origin.double y = v9;
  v39.size.double width = v10;
  v39.size.double height = v11;
  if (!CGRectIsNull(v39))
  {
    objc_msgSend(v6, "convertRectFromModelToOverlay:", v8, v9, v10, v11);
    double v8 = v25;
    double v9 = v26;
    double v10 = v27;
    double v11 = v28;
  }

  double v29 = v8;
  double v30 = v9;
  double v31 = v10;
  double v32 = v11;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a4;
  double v9 = (void (**)(id, void *))a6;
  double v10 = [(AKOverlayView *)self pageController];
  double v11 = [v10 controller];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v12 = [v11 modelController];
  long long v13 = [v12 allSelectedAnnotations];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    double v23 = v10;
    uint64_t v16 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        CGFloat v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        CGFloat v19 = [v18 UUID];
        int v20 = [v19 isEqual:v8];

        if (v20)
        {
          double v22 = [v11 textEditorController];
          double v10 = v23;
          if (([v22 isEditing] & 1) == 0) {
            [v22 beginEditingAnnotation:v18 withPageController:v23 selectAllText:0 withPencil:1];
          }
          double v21 = [v22 textView];

          goto LABEL_14;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v15) {
        continue;
      }
      break;
    }
    double v21 = 0;
    double v10 = v23;
  }
  else
  {
    double v21 = 0;
  }
LABEL_14:

  v9[2](v9, v21);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = a5;
  [a4 location];
  id v20 = 0;
  -[AKOverlayView _findResizeHandleRectAtLocation:withVisualStyle:](self, "_findResizeHandleRectAtLocation:withVisualStyle:", &v20);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  id v16 = v20;
  v22.origin.double x = v9;
  v22.origin.double y = v11;
  v22.size.double width = v13;
  v22.size.double height = v15;
  if (CGRectIsEmpty(v22))
  {
    id v17 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F1C888], "regionWithRect:identifier:", v16, v9, v11, v13, v15);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  CGFloat v18 = v17;

  return v18;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  if (a4) {
    MEMORY[0x270F9A6D0](self, sel__addLiftOffHandleViewForRegion_);
  }
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(AKOverlayView *)self _liftOffHandleViewForRegion:v9];
  if (v11)
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_2376AC484;
    v12[3] = &unk_264CDBB00;
    objc_copyWeak(&v14, &location);
    id v13 = v9;
    [v10 addCompletion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  v35[2] = *MEMORY[0x263EF8340];
  id v5 = a4;
  double v6 = [v5 identifier];
  id v7 = v6;
  if (v6 && (unint64_t)[v6 integerValue] <= 1)
  {
    id v9 = [(AKOverlayView *)self _singleSelectedAnnotation];
    if (v9)
    {
      id v10 = [(AKOverlayView *)self pageController];
      [v5 rect];
      +[AKGeometryHelper centerOfRect:](AKGeometryHelper, "centerOfRect:");
      objc_msgSend(v10, "convertPointFromOverlayToModel:");
      double v12 = v11;
      double v14 = v13;
      [v10 currentModelToScreenScaleFactor];
      unint64_t v16 = +[AKAnnotationPointOfInterestHelper draggableAreaForPoint:onAnnotation:withScale:pageControllerForPixelAlignment:](AKAnnotationPointOfInterestHelper, "draggableAreaForPoint:onAnnotation:withScale:pageControllerForPixelAlignment:", v9, v10, v12, v14, v15);
      id v8 = [MEMORY[0x263F1C890] hiddenPointerStyle];
      if (v16)
      {
        id v17 = [(AKOverlayView *)self _liftOffHandleViewForRegion:v5];
        if (v17)
        {
          CGFloat v18 = (void *)[objc_alloc(MEMORY[0x263F1CA80]) initWithView:v17];
          CGFloat v19 = [MEMORY[0x263F1C870] effectWithPreview:v18];
          uint64_t v20 = [MEMORY[0x263F1C890] styleWithEffect:v19 shape:0];

          id v8 = (void *)v20;
        }

        if (v16 <= 8)
        {
          int v21 = [v9 conformsToAKRotatableAnnotationProtocol];
          double v22 = 0.0;
          if (v21) {
            objc_msgSend(v9, "rotationAngle", 0.0);
          }
          unint64_t v16 = (((_BYTE)v16 + vcvtad_u64_f64(v22 / 0.785398163) - 1) & 7) + 1;
        }
        switch(v16)
        {
          case 1uLL:
          case 5uLL:
            double v23 = objc_msgSend(MEMORY[0x263F1C868], "arrowAccessoryWithPosition:", *MEMORY[0x263F1D520], *(double *)(MEMORY[0x263F1D520] + 8));
            v35[0] = v23;
            long long v24 = objc_msgSend(MEMORY[0x263F1C868], "arrowAccessoryWithPosition:", *MEMORY[0x263F1D550], *(double *)(MEMORY[0x263F1D550] + 8));
            v35[1] = v24;
            double v28 = (void *)MEMORY[0x263EFF8C0];
            uint64_t v29 = v35;
            goto LABEL_19;
          case 2uLL:
          case 6uLL:
            double v23 = objc_msgSend(MEMORY[0x263F1C868], "arrowAccessoryWithPosition:", *MEMORY[0x263F1D540], *(double *)(MEMORY[0x263F1D540] + 8));
            v34[0] = v23;
            long long v24 = objc_msgSend(MEMORY[0x263F1C868], "arrowAccessoryWithPosition:", *MEMORY[0x263F1D518], *(double *)(MEMORY[0x263F1D518] + 8));
            v34[1] = v24;
            double v28 = (void *)MEMORY[0x263EFF8C0];
            uint64_t v29 = v34;
            goto LABEL_19;
          case 3uLL:
          case 7uLL:
          case 0x12uLL:
          case 0x13uLL:
            double v23 = objc_msgSend(MEMORY[0x263F1C868], "arrowAccessoryWithPosition:", *MEMORY[0x263F1D548], *(double *)(MEMORY[0x263F1D548] + 8));
            v33[0] = v23;
            long long v24 = objc_msgSend(MEMORY[0x263F1C868], "arrowAccessoryWithPosition:", *MEMORY[0x263F1D528], *(double *)(MEMORY[0x263F1D528] + 8));
            v33[1] = v24;
            double v28 = (void *)MEMORY[0x263EFF8C0];
            uint64_t v29 = v33;
            goto LABEL_19;
          case 4uLL:
          case 8uLL:
            double v23 = objc_msgSend(MEMORY[0x263F1C868], "arrowAccessoryWithPosition:", *MEMORY[0x263F1D530], *(double *)(MEMORY[0x263F1D530] + 8));
            v32[0] = v23;
            long long v24 = objc_msgSend(MEMORY[0x263F1C868], "arrowAccessoryWithPosition:", *MEMORY[0x263F1D538], *(double *)(MEMORY[0x263F1D538] + 8));
            v32[1] = v24;
            double v28 = (void *)MEMORY[0x263EFF8C0];
            uint64_t v29 = v32;
LABEL_19:
            long long v25 = [v28 arrayWithObjects:v29 count:2];
            [v8 setAccessories:v25];
            goto LABEL_20;
          case 9uLL:
          case 0xAuLL:
          case 0xBuLL:
          case 0xEuLL:
          case 0xFuLL:
            double v23 = objc_msgSend(MEMORY[0x263F1C868], "arrowAccessoryWithPosition:", *MEMORY[0x263F1D540], *(double *)(MEMORY[0x263F1D540] + 8));
            v31[0] = v23;
            long long v24 = objc_msgSend(MEMORY[0x263F1C868], "arrowAccessoryWithPosition:", *MEMORY[0x263F1D518], *(double *)(MEMORY[0x263F1D518] + 8));
            v31[1] = v24;
            long long v25 = objc_msgSend(MEMORY[0x263F1C868], "arrowAccessoryWithPosition:", *MEMORY[0x263F1D530], *(double *)(MEMORY[0x263F1D530] + 8));
            v31[2] = v25;
            long long v26 = objc_msgSend(MEMORY[0x263F1C868], "arrowAccessoryWithPosition:", *MEMORY[0x263F1D538], *(double *)(MEMORY[0x263F1D538] + 8));
            v31[3] = v26;
            long long v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];
            [v8 setAccessories:v27];

LABEL_20:
            break;
          default:
            break;
        }
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (AKPageController)pageController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);

  return (AKPageController *)WeakRetained;
}

- (void)setPageController:(id)a3
{
}

- (AKMainEventHandler)mainEventHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainEventHandler);

  return (AKMainEventHandler *)WeakRetained;
}

- (void)setMainEventHandler:(id)a3
{
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (BOOL)deferWasMovedToSuperviewUntilMoveToWindow
{
  return self->_deferWasMovedToSuperviewUntilMoveToWindow;
}

- (void)setDeferWasMovedToSuperviewUntilMoveToWindow:(BOOL)a3
{
  self->_deferWasMovedToSuperviewUntilMoveToWindow = a3;
}

- (UIScrollView)observedScrollView
{
  return (UIScrollView *)objc_getProperty(self, a2, 432, 1);
}

- (void)setObservedScrollView:(id)a3
{
}

- (BOOL)scrollViewIsInLiveMagnify
{
  return self->_scrollViewIsInLiveMagnify;
}

- (void)setScrollViewIsInLiveMagnify:(BOOL)a3
{
  self->_scrollViewIsInLiveMagnifdouble y = a3;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
}

- (NSMutableDictionary)pointerRegionToHandleViewDict
{
  return self->_pointerRegionToHandleViewDict;
}

- (void)setPointerRegionToHandleViewDict:(id)a3
{
}

- (BOOL)isObservingEventHandling
{
  return self->_isObservingEventHandling;
}

- (void)setIsObservingEventHandling:(BOOL)a3
{
  self->_isObservingEventHandling = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerRegionToHandleViewDict, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_observedScrollView, 0);
  objc_destroyWeak((id *)&self->_mainEventHandler);

  objc_destroyWeak((id *)&self->_pageController);
}

@end