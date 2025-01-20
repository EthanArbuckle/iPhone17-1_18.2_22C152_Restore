@interface AKMainEventHandler
+ (id)newMainEventHandlerForCurrentPlatformWithController:(id)a3;
- (AKAlignmentGuideController)dragAlignmentGuideController;
- (AKAnnotation)annotationToBeginEditingOnDragEnd;
- (AKAnnotationEventHandler)annotationEventHandler;
- (AKController)controller;
- (AKHighlightColorEditorController)highlightColorEditor;
- (AKMainEventHandler)initWithController:(id)a3;
- (AKPageController)dragPageController;
- (BOOL)_detectFormElementInCurrentPageControllerUnderPointInWindow:(CGPoint)a3;
- (BOOL)_detectFormElementInCurrentPageControllerUnderPointInWindow:(CGPoint)a3 withStartingPoint:(CGPoint)a4;
- (BOOL)_didNotHandleEventSoDeselect;
- (BOOL)continueDragEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)continueRotateEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)dragDidCopySelectedAnnotations;
- (BOOL)enterDragEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)enterRotateEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)handleDoubleDownEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)handleKeyboardEvent:(id)a3;
- (BOOL)handleRightDownEvent:(id)a3;
- (BOOL)handleRotateEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)hitTestAnnotationsIncludingPOI:(BOOL)a3 ignoreIfDeselected:(BOOL)a4 atPointInWindow:(CGPoint)a5 outAnnotation:(id *)a6;
- (BOOL)hitTestPointsOfInterestsAtPoint:(CGPoint)a3 onPageController:(id)a4 inAnnotations:(id)a5 event:(id)a6 recognizer:(id)a7 cursorUpdateOnly:(BOOL)a8;
- (BOOL)mainEventHandlerIsInDoodleTrackingLoop;
- (BOOL)mainEventHandlerIsInRotationLoop;
- (BOOL)mainEventHandlerIsInTrackingLoop;
- (BOOL)mainHandleEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)shouldEatNextLeftMouseUp;
- (BOOL)shouldEatNextRightMouseUp;
- (BOOL)undoManagerWasGroupingByEvent;
- (BOOL)wasSelectedByLongPressRecognizer;
- (CGPoint)_alignedAnnotationDragPointForPoint:(CGPoint)a3 withEvent:(id)a4 orRecognizer:(id)a5;
- (CGPoint)_modelPointFromPointInWindow:(CGPoint)a3 usingPageController:(id)a4;
- (CGPoint)firstDragPoint;
- (CGPoint)lastDragActualLocation;
- (CGPoint)lastDragActualLocationInWindow;
- (CGPoint)lastDragPoint;
- (CGPoint)leftMouseDownPoint;
- (CGPoint)modelPointFromEvent:(id)a3 orRecognizer:(id)a4 onPageController:(id *)a5;
- (CGPoint)modelPointFromWindowPoint:(CGPoint)a3 foundOnPageController:(id *)a4;
- (CGPoint)panGestureStartPointInWindow;
- (CGPoint)windowPointFromEvent:(id)a3 orRecognizer:(id)a4;
- (UIEvent)lastEventWithValidLocationForAutoscroll;
- (UIEvent)lastLeftMouseDownEvent;
- (double)draggedAnnotationsMaxBottomEdge;
- (double)draggedAnnotationsMaxLeftEdge;
- (double)draggedAnnotationsMinRightEdge;
- (double)draggedAnnotationsMinTopEdge;
- (id)annotationsPassingBoundingBoxHitTestsWithPoint:(CGPoint)a3 onPageController:(id)a4;
- (id)topmostAnnotationForBorderAndInteriorHitTestAtPoint:(CGPoint)a3 inAnnotations:(id)a4 onPageController:(id)a5 wasOnBorder:(BOOL *)a6 wasOnText:(BOOL *)a7;
- (unint64_t)currentModifierFlags;
- (void)_setCurrentPageBasedOnPageController:(id)a3;
- (void)_updateSelectionWithAnnotation:(id)a3 onPageController:(id)a4;
- (void)applyTranslationToAllSelectedAnnotations:(CGPoint)a3;
- (void)finishTranslationOfAllSelectedAnnotations;
- (void)setAnnotationEventHandler:(id)a3;
- (void)setAnnotationToBeginEditingOnDragEnd:(id)a3;
- (void)setController:(id)a3;
- (void)setCurrentModifierFlags:(unint64_t)a3;
- (void)setDragAlignmentGuideController:(id)a3;
- (void)setDragDidCopySelectedAnnotations:(BOOL)a3;
- (void)setDragPageController:(id)a3;
- (void)setDraggedAnnotationsMaxBottomEdge:(double)a3;
- (void)setDraggedAnnotationsMaxLeftEdge:(double)a3;
- (void)setDraggedAnnotationsMinRightEdge:(double)a3;
- (void)setDraggedAnnotationsMinTopEdge:(double)a3;
- (void)setFirstDragPoint:(CGPoint)a3;
- (void)setHighlightColorEditor:(id)a3;
- (void)setLastDragActualLocation:(CGPoint)a3;
- (void)setLastDragActualLocationInWindow:(CGPoint)a3;
- (void)setLastDragPoint:(CGPoint)a3;
- (void)setLastEventWithValidLocationForAutoscroll:(id)a3;
- (void)setLastLeftMouseDownEvent:(id)a3;
- (void)setLeftMouseDownPoint:(CGPoint)a3;
- (void)setMainEventHandlerIsInDoodleTrackingLoop:(BOOL)a3;
- (void)setMainEventHandlerIsInRotationLoop:(BOOL)a3;
- (void)setMainEventHandlerIsInTrackingLoop:(BOOL)a3;
- (void)setPanGestureStartPointInWindow:(CGPoint)a3;
- (void)setShouldEatNextLeftMouseUp:(BOOL)a3;
- (void)setShouldEatNextRightMouseUp:(BOOL)a3;
- (void)setUndoManagerWasGroupingByEvent:(BOOL)a3;
- (void)setWasSelectedByLongPressRecognizer:(BOOL)a3;
@end

@implementation AKMainEventHandler

+ (id)newMainEventHandlerForCurrentPlatformWithController:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithController:v3];

  return v4;
}

- (AKMainEventHandler)initWithController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKMainEventHandler;
  v5 = [(AKMainEventHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AKMainEventHandler *)v5 setController:v4];
  }

  return v6;
}

- (BOOL)mainHandleEvent:(id)a3 orRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(AKMainEventHandler *)self controller];
  v9 = [v8 currentPageController];
  v10 = [v9 overlayView];

  v11 = [v10 superview];
  if (!v11) {
    goto LABEL_22;
  }
  uint64_t v12 = [v10 window];
  if (!v12)
  {

    goto LABEL_13;
  }
  v13 = (void *)v12;
  v14 = [v10 superview];
  v15 = [v14 window];

  if (!v15)
  {
LABEL_13:
    LOBYTE(v11) = 0;
    goto LABEL_22;
  }
  v16 = [(AKMainEventHandler *)self annotationEventHandler];

  if (!v16)
  {
    if ([(AKMainEventHandler *)self mainEventHandlerIsInTrackingLoop])
    {
      [MEMORY[0x263F158F8] activate];
      [MEMORY[0x263F158F8] begin];
      LOBYTE(v11) = 1;
      [MEMORY[0x263F158F8] setDisableActions:1];
      BOOL v28 = [(AKMainEventHandler *)self continueDragEventTrackingLoopWithEvent:v6 orRecognizer:v7];
      [MEMORY[0x263F158F8] commit];
      if (v28) {
        goto LABEL_22;
      }
      [(AKMainEventHandler *)self setMainEventHandlerIsInTrackingLoop:0];
      [(AKMainEventHandler *)self setWasSelectedByLongPressRecognizer:0];
      -[AKMainEventHandler setLeftMouseDownPoint:](self, "setLeftMouseDownPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    }
    else
    {
      if (![(AKMainEventHandler *)self mainEventHandlerIsInRotationLoop])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          BOOL v35 = [(AKMainEventHandler *)self handleRotateEvent:v6 orRecognizer:v7];
        }
        else {
          BOOL v35 = [(AKMainEventHandler *)self handleDownEvent:v6 orRecognizer:v7];
        }
        LOBYTE(v11) = v35;
        goto LABEL_22;
      }
      [MEMORY[0x263F158F8] activate];
      [MEMORY[0x263F158F8] begin];
      LOBYTE(v11) = 1;
      [MEMORY[0x263F158F8] setDisableActions:1];
      BOOL v29 = [(AKMainEventHandler *)self continueRotateEventTrackingLoopWithEvent:v6 orRecognizer:v7];
      [MEMORY[0x263F158F8] commit];
      if (v29) {
        goto LABEL_22;
      }
      [(AKMainEventHandler *)self setMainEventHandlerIsInRotationLoop:0];
      [(AKMainEventHandler *)self setWasSelectedByLongPressRecognizer:0];
    }
    v30 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v31 = *MEMORY[0x263F08618];
    v32 = [v8 undoController];
    v33 = [v32 undoManager];
    [v30 postNotificationName:v31 object:v33];

LABEL_21:
    LOBYTE(v11) = 1;
    goto LABEL_22;
  }
  [MEMORY[0x263F158F8] begin];
  LOBYTE(v11) = 1;
  [MEMORY[0x263F158F8] setDisableActions:1];
  v17 = [(AKMainEventHandler *)self annotationEventHandler];
  char v18 = [v17 continueDraggableAreaEventTrackingLoopWithEvent:v6 orRecognizer:v7];

  [MEMORY[0x263F158F8] commit];
  if ((v18 & 1) == 0)
  {
    v19 = [(AKMainEventHandler *)self annotationEventHandler];
    v20 = [v19 annotation];

    [v20 setIsDraggingHandle:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || +[AKAnnotationRenderer annotationShouldAvoidRedrawDuringLiveResize:v20])
    {
      v21 = [(AKMainEventHandler *)self annotationEventHandler];
      v22 = [v21 pageController];
      v23 = [v22 layerPresentationManager];
      [v23 forceUpdateAnnotationLayer:v20];
    }
    [(AKMainEventHandler *)self setAnnotationEventHandler:0];
    [(AKMainEventHandler *)self setWasSelectedByLongPressRecognizer:0];
    v24 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v25 = *MEMORY[0x263F08618];
    v26 = [v8 undoController];
    v27 = [v26 undoManager];
    [v24 postNotificationName:v25 object:v27];

    goto LABEL_21;
  }
LABEL_22:

  return (char)v11;
}

- (CGPoint)modelPointFromEvent:(id)a3 orRecognizer:(id)a4 onPageController:(id *)a5
{
  [(AKMainEventHandler *)self windowPointFromEvent:a3 orRecognizer:a4];

  -[AKMainEventHandler modelPointFromWindowPoint:foundOnPageController:](self, "modelPointFromWindowPoint:foundOnPageController:", a5);
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)windowPointFromEvent:(id)a3 orRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_13;
    }
    double v8 = [(AKMainEventHandler *)self annotationEventHandler];
    if (v8)
    {
    }
    else if (![(AKMainEventHandler *)self mainEventHandlerIsInTrackingLoop])
    {
      double v11 = *MEMORY[0x263F00148];
      double v12 = *(double *)(MEMORY[0x263F00148] + 8);
LABEL_8:
      [(AKMainEventHandler *)self panGestureStartPointInWindow];
      if (v14 != v11 || v13 != v12)
      {
        [(AKMainEventHandler *)self panGestureStartPointInWindow];
LABEL_14:
        double v9 = v16;
        double v10 = v17;
        goto LABEL_15;
      }
LABEL_13:
      [v7 akLocationInWindow];
      goto LABEL_14;
    }
    double v11 = *MEMORY[0x263F00148];
    double v12 = *(double *)(MEMORY[0x263F00148] + 8);
    -[AKMainEventHandler setPanGestureStartPointInWindow:](self, "setPanGestureStartPointInWindow:", *MEMORY[0x263F00148], v12);
    goto LABEL_8;
  }
  double v9 = *MEMORY[0x263F00148];
  double v10 = *(double *)(MEMORY[0x263F00148] + 8);
LABEL_15:

  double v18 = v9;
  double v19 = v10;
  result.y = v19;
  result.x = v18;
  return result;
}

- (CGPoint)modelPointFromWindowPoint:(CGPoint)a3 foundOnPageController:(id *)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v29 = *MEMORY[0x263EF8340];
  double v7 = *MEMORY[0x263F00148];
  double v8 = *(double *)(MEMORY[0x263F00148] + 8);
  double v9 = [(AKMainEventHandler *)self controller];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  double v10 = objc_msgSend(v9, "pageControllers", 0);
  id v11 = (id)[v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v10);
        }
        double v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v14 relinquishablesAreLoaded])
        {
          v15 = [v14 overlayView];
          objc_msgSend(v15, "convertPoint:fromView:", 0, x, y);
          double v17 = v16;
          double v19 = v18;
          [v15 bounds];
          v31.double x = v17;
          v31.double y = v19;
          if (CGRectContainsPoint(v32, v31))
          {
            id v11 = v14;
            objc_msgSend(v11, "convertPointFromOverlayToModel:", v17, v19);
            double v7 = v20;
            double v8 = v21;

            goto LABEL_13;
          }
        }
      }
      id v11 = (id)[v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  if (a4) {
    *a4 = v11;
  }

  double v22 = v7;
  double v23 = v8;
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (!v7 || (unint64_t)[v7 akNumberOfTouches] <= 1)
  {
    double v10 = [(AKMainEventHandler *)self controller];
    id v11 = [v10 toolController];
    uint64_t v12 = [v11 toolMode];

    [(AKMainEventHandler *)self setAnnotationToBeginEditingOnDragEnd:0];
    unint64_t v13 = 0x263F08000uLL;
    double v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 postNotificationName:@"AKShapeDetectionController.shouldDismissCandidatePicker" object:self];

    id v85 = 0;
    [(AKMainEventHandler *)self modelPointFromEvent:v6 orRecognizer:v8 onPageController:&v85];
    double v16 = v15;
    double v18 = v17;
    id v19 = v85;
    double v20 = [v10 textEditorController];
    int v21 = [v20 isEditing];

    if (!v21)
    {
LABEL_18:
      if (v6 || !v8)
      {
LABEL_51:
        if (!v19)
        {
          char v9 = 0;
LABEL_111:

          goto LABEL_112;
        }
        [(AKMainEventHandler *)self _setCurrentPageBasedOnPageController:v19];
        __int16 v84 = 0;
        if ([(AKMainEventHandler *)self mainEventHandlerIsInDoodleTrackingLoop])
        {
          double v23 = 0;
        }
        else
        {
          v41 = -[AKMainEventHandler annotationsPassingBoundingBoxHitTestsWithPoint:onPageController:](self, "annotationsPassingBoundingBoxHitTestsWithPoint:onPageController:", v19, v16, v18);
          if (![(AKMainEventHandler *)self wasSelectedByLongPressRecognizer]
            && -[AKMainEventHandler hitTestPointsOfInterestsAtPoint:onPageController:inAnnotations:event:recognizer:cursorUpdateOnly:](self, "hitTestPointsOfInterestsAtPoint:onPageController:inAnnotations:event:recognizer:cursorUpdateOnly:", v19, v41, v6, v8, 0, v16, v18))
          {

            double v23 = 0;
LABEL_109:
            char v9 = 1;
            goto LABEL_110;
          }
          double v23 = -[AKMainEventHandler topmostAnnotationForBorderAndInteriorHitTestAtPoint:inAnnotations:onPageController:wasOnBorder:wasOnText:](self, "topmostAnnotationForBorderAndInteriorHitTestAtPoint:inAnnotations:onPageController:wasOnBorder:wasOnText:", v41, v19, (char *)&v84 + 1, &v84, v16, v18);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v23) {
            goto LABEL_89;
          }
          [v10 modelController];
          id v42 = v6;
          id v43 = v19;
          v45 = uint64_t v44 = v12;
          v46 = [v45 allSelectedAnnotations];
          int v47 = [v46 containsObject:v23];

          unint64_t v13 = 0x263F08000;
          uint64_t v12 = v44;
          id v19 = v43;
          id v6 = v42;
        }
        else
        {
          int v47 = 1;
          if (!v23) {
            goto LABEL_89;
          }
        }
        if (!v47)
        {
LABEL_89:
          if ((unint64_t)(v12 - 1) > 1)
          {
            if (v8)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v8 akLocationInWindow];
                if (-[AKMainEventHandler _detectFormElementInCurrentPageControllerUnderPointInWindow:](self, "_detectFormElementInCurrentPageControllerUnderPointInWindow:"))
                {
                  goto LABEL_109;
                }
              }
            }
          }
          else if (v8)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v70 = [v10 modelController];
              [v70 deselectAllAnnotations];

              [v10 hideSelectionMenu:0];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v71 = [v10 legacyDoodleController];
                [v71 handleDragAction:v8];

                if ((unint64_t)([v8 state] - 3) <= 2) {
                  [(AKMainEventHandler *)self setMainEventHandlerIsInDoodleTrackingLoop:0];
                }
              }
              -[AKMainEventHandler setLeftMouseDownPoint:](self, "setLeftMouseDownPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
              v72 = [*(id *)(v13 + 2560) defaultCenter];
              uint64_t v73 = *MEMORY[0x263F08618];
              v74 = [v10 undoController];
              v75 = [v74 undoManager];
              [v72 postNotificationName:v73 object:v75];

              goto LABEL_109;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v76 = [v10 modelController];
              v77 = [v76 allSelectedAnnotations];

              v78 = [v10 toolbarViewController];
              if ([v78 isPresentingPopovers])
              {
                [v78 dismissPresentedPopovers];
LABEL_108:

                goto LABEL_109;
              }
              if (![v77 count])
              {
                v79 = [v10 legacyDoodleController];
                [v79 handleTapAction:v8];

                goto LABEL_108;
              }
            }
          }
          BOOL v33 = [(AKMainEventHandler *)self _didNotHandleEventSoDeselect];
          goto LABEL_106;
        }
        uint64_t v83 = v12;
        if ((_BYTE)v84)
        {
          v48 = [v19 pageModelController];
          v49 = [v48 selectedAnnotations];
          int v50 = [v49 containsObject:v23];

          if (v50)
          {
            v51 = [v19 pageModelController];
            v52 = [v51 mutableSetValueForKey:@"selectedAnnotations"];

            v53 = [MEMORY[0x263EFFA08] setWithObject:v23];
            [v52 setSet:v53];

            [(AKMainEventHandler *)self setAnnotationToBeginEditingOnDragEnd:v23];
          }
          else
          {
            v54 = +[AKTextAnnotationAttributeHelper actualOrPlaceholderTextOfAnnotation:v23];
            v52 = v54;
            if (!v54 || ![v54 length]) {
              LOBYTE(v84) = 0;
            }
          }
        }
        v55 = [v19 pageModelController];
        v56 = [v55 selectedAnnotations];
        int v57 = [v56 containsObject:v23];

        char v58 = objc_opt_respondsToSelector();
        int v81 = v57;
        if (v58)
        {
          id v59 = [v23 strokeColor];
          v60 = (CGColor *)[v59 CGColor];

          double Alpha = CGColorGetAlpha(v60);
          int v62 = Alpha > 0.0;
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            int v63 = Alpha <= 0.0;
            BOOL v64 = 1;
LABEL_77:
            unint64_t v13 = 0x263F08000;
            uint64_t v12 = v83;
            goto LABEL_81;
          }
        }
        else
        {
          int v62 = 1;
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            int v68 = 0;
            BOOL v64 = 1;
            goto LABEL_80;
          }
        }
        id v65 = [v23 fillColor];
        v66 = (CGColor *)[v65 CGColor];

        double v67 = CGColorGetAlpha(v66);
        BOOL v64 = v67 > 0.0;
        if (v58)
        {
          int v63 = (v67 <= 0.0) & ~v62;
          goto LABEL_77;
        }
        int v68 = 1;
LABEL_80:
        unint64_t v13 = 0x263F08000uLL;
        uint64_t v12 = v83;
        int v63 = v68 & !v64;
LABEL_81:
        if ((_BYTE)v84) {
          goto LABEL_82;
        }
        if (HIBYTE(v84))
        {
          if (((v62 | v63) & 1) == 0) {
            goto LABEL_89;
          }
        }
        else if ((v64 | v63 | v81) != 1)
        {
          goto LABEL_89;
        }
LABEL_82:
        [(AKMainEventHandler *)self _updateSelectionWithAnnotation:v23 onPageController:v19];
        if ([(AKMainEventHandler *)self enterDragEventTrackingLoopWithEvent:v6 orRecognizer:v8])
        {
          char v9 = 1;
          [(AKMainEventHandler *)self setMainEventHandlerIsInTrackingLoop:1];
          [v10 hideSelectionMenu:0];
        }
        else
        {
          id v69 = +[AKAnnotationEventHandler newAnnotationEventHandlerForCurrentPlatformForAnnotation:v23 withPageController:v19];
          char v9 = [v69 handleDownEvent:v6 orRecognizer:v8];
        }
        goto LABEL_110;
      }
      double v23 = [v10 toolbarViewController];
      if ([v23 isPresentingPopovers]) {
        [v23 dismissPresentedPopovers];
      }
      if ([v8 conformsToProtocol:&unk_26EA99DC8]) {
        [v8 penGestureDetected];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(AKMainEventHandler *)self setWasSelectedByLongPressRecognizer:0];
        if ([v8 akNumberOfTapsRequired] == 2)
        {
          BOOL v33 = [(AKMainEventHandler *)self handleDoubleDownEvent:0 orRecognizer:v8];
LABEL_106:
          char v9 = v33;
          goto LABEL_110;
        }
        goto LABEL_50;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 setEnabled:0];
        [v8 setEnabled:1];
        if (![(AKMainEventHandler *)self mainEventHandlerIsInTrackingLoop]
          && ![(AKMainEventHandler *)self mainEventHandlerIsInRotationLoop])
        {
          [(AKMainEventHandler *)self setWasSelectedByLongPressRecognizer:1];
        }
        goto LABEL_50;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char v9 = 0;
LABEL_110:

        goto LABEL_111;
      }
      uint64_t v34 = [v8 state];
      if (v34 == 2)
      {
        if ([(AKMainEventHandler *)self mainEventHandlerIsInTrackingLoop]
          || (unint64_t)(v12 - 3) < 0xFFFFFFFFFFFFFFFELL)
        {
          goto LABEL_50;
        }
        BOOL v35 = self;
        uint64_t v36 = 1;
      }
      else
      {
        if (v34 == 1)
        {
          if ((unint64_t)(v12 - 1) <= 1)
          {
            v37 = [v10 modelController];
            [v37 allSelectedAnnotations];
            id v38 = v19;
            v40 = uint64_t v39 = v12;
            -[AKMainEventHandler setMainEventHandlerIsInDoodleTrackingLoop:](self, "setMainEventHandlerIsInDoodleTrackingLoop:", [v40 count] == 0);

            uint64_t v12 = v39;
            id v19 = v38;
            id v6 = 0;
          }
          goto LABEL_50;
        }
        if (v34)
        {
LABEL_50:

          goto LABEL_51;
        }
        BOOL v35 = self;
        uint64_t v36 = 0;
      }
      [(AKMainEventHandler *)v35 setMainEventHandlerIsInDoodleTrackingLoop:v36];
      goto LABEL_50;
    }
    double v22 = [v10 textEditorController];
    double v23 = [v22 textView];

    if (v8) {
      [v8 locationInView:v23];
    }
    else {
      double v24 = 1.79769313e308;
    }
    id v82 = v6;
    int v25 = [v23 pointInside:0 withEvent:v24];
    int v26 = v25;
    if (v8 && !v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      BOOL v27 = [v8 state] != 1;
      if (v27)
      {
        uint64_t v28 = v12;
LABEL_15:
        uint64_t v29 = [v10 textEditorController];
        v30 = [v29 annotation];

        BOOL v31 = +[AKTextAnnotationRenderHelper hitTestPoint:againstActualTextForAnnotation:onPageController:](AKTextAnnotationRenderHelper, "hitTestPoint:againstActualTextForAnnotation:onPageController:", v30, v19, v16, v18);
        if (v27 || (uint64_t v12 = v28, v31))
        {
          if (v8)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && ([v8 state] == 3 || objc_msgSend(v8, "state") == 4 || objc_msgSend(v8, "state") == 5))
            {
              -[AKMainEventHandler setPanGestureStartPointInWindow:](self, "setPanGestureStartPointInWindow:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
            }
          }
          char v9 = 1;
          id v6 = v82;
          goto LABEL_110;
        }
      }
    }
    else if (v26)
    {
      uint64_t v28 = v12;
      BOOL v27 = 0;
      goto LABEL_15;
    }
    CGRect v32 = [v10 textEditorController];
    [v32 endEditing];

    id v6 = v82;
    goto LABEL_18;
  }
  char v9 = 0;
LABEL_112:

  return v9;
}

- (BOOL)handleDoubleDownEvent:(id)a3 orRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(AKMainEventHandler *)self controller];
  id v22 = 0;
  [(AKMainEventHandler *)self modelPointFromEvent:v7 orRecognizer:v6 onPageController:&v22];
  double v10 = v9;
  double v12 = v11;

  id v13 = v22;
  if (v13)
  {
    double v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 postNotificationName:@"AKShapeDetectionController.shouldDismissCandidatePicker" object:self];

    if (![v6 conformsToProtocol:&unk_26EA99DC8]
      || ([v6 penGestureDetected] & 1) == 0)
    {
      [(AKMainEventHandler *)self _setCurrentPageBasedOnPageController:v13];
      double v15 = -[AKMainEventHandler annotationsPassingBoundingBoxHitTestsWithPoint:onPageController:](self, "annotationsPassingBoundingBoxHitTestsWithPoint:onPageController:", v13, v10, v12);
      __int16 v21 = 0;
      double v16 = -[AKMainEventHandler topmostAnnotationForBorderAndInteriorHitTestAtPoint:inAnnotations:onPageController:wasOnBorder:wasOnText:](self, "topmostAnnotationForBorderAndInteriorHitTestAtPoint:inAnnotations:onPageController:wasOnBorder:wasOnText:", v15, v13, (char *)&v21 + 1, &v21, v10, v12);
      double v17 = v16;
      if (v16
        && [v16 conformsToAKTextAnnotationProtocol]
        && ([v17 editingDisabled] & 1) == 0)
      {
        double v20 = [v8 textEditorController];
        [v20 beginEditingAnnotation:v17 withPageController:v13 selectAllText:0];

        BOOL v18 = 1;
        goto LABEL_10;
      }
    }
    BOOL v18 = [(AKMainEventHandler *)self _didNotHandleEventSoDeselect];
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_10:

  return v18;
}

- (BOOL)handleRightDownEvent:(id)a3
{
  return 0;
}

- (BOOL)handleKeyboardEvent:(id)a3
{
  return 0;
}

- (BOOL)handleRotateEvent:(id)a3 orRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(AKMainEventHandler *)self controller];
  uint64_t v12 = 0;
  [(AKMainEventHandler *)self modelPointFromEvent:v6 orRecognizer:v7 onPageController:&v12];
  if (v12
    && ([v8 textEditorController],
        double v9 = objc_claimAutoreleasedReturnValue(),
        [v9 endEditing],
        v9,
        [(AKMainEventHandler *)self enterRotateEventTrackingLoopWithEvent:v6 orRecognizer:v7]))
  {
    BOOL v10 = 1;
    [(AKMainEventHandler *)self setMainEventHandlerIsInRotationLoop:1];
    [v8 hideSelectionMenu:0];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)enterDragEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v56 = 0;
  }
  else
  {
    [(AKMainEventHandler *)self windowPointFromEvent:v6 orRecognizer:v7];
    double v9 = v8;
    double v11 = v10;
    id v64 = 0;
    -[AKMainEventHandler modelPointFromWindowPoint:foundOnPageController:](self, "modelPointFromWindowPoint:foundOnPageController:", &v64);
    double v58 = v12;
    double v14 = v13;
    id v15 = v64;
    if (v15)
    {
      [(AKMainEventHandler *)self setDraggedAnnotationsMaxLeftEdge:2.22507386e-308];
      [(AKMainEventHandler *)self setDraggedAnnotationsMinRightEdge:1.79769313e308];
      [(AKMainEventHandler *)self setDraggedAnnotationsMaxBottomEdge:2.22507386e-308];
      [(AKMainEventHandler *)self setDraggedAnnotationsMinTopEdge:1.79769313e308];
      id v59 = v15;
      double v16 = [v15 pageModelController];
      double v17 = [v16 selectedAnnotations];

      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v60 objects:v65 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v61;
LABEL_6:
        uint64_t v22 = 0;
        while (1)
        {
          if (*(void *)v61 != v21) {
            objc_enumerationMutation(v18);
          }
          double v23 = *(void **)(*((void *)&v60 + 1) + 8 * v22);
          if (!+[AKAnnotationEventHandler allowsDraggingOfAnnotation:v23])
          {

            BOOL v56 = 0;
            id v15 = v59;
            goto LABEL_37;
          }
          if (([v7 modifierFlags] & 0x80000) != 0)
          {
            double v24 = [(AKMainEventHandler *)self controller];
            [v24 duplicate:0];
          }
          if ([v23 conformsToAKRectangularAnnotationProtocol])
          {
            [v23 rectangle];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v23 startPoint];
              double v30 = v29;
              double v32 = v31;
              [v23 endPoint];
              if (v30 >= v33) {
                CGFloat v35 = v33;
              }
              else {
                CGFloat v35 = v30;
              }
              if (v32 >= v34) {
                CGFloat v36 = v34;
              }
              else {
                CGFloat v36 = v32;
              }
              double v37 = vabdd_f64(v33, v30);
              double v38 = vabdd_f64(v34, v32);
              goto LABEL_24;
            }
            [v23 hitTestBounds];
          }
          CGFloat v35 = v25;
          CGFloat v36 = v26;
          double v37 = v27;
          double v38 = v28;
LABEL_24:
          [(AKMainEventHandler *)self draggedAnnotationsMaxLeftEdge];
          double v40 = v39;
          v67.origin.double x = v35;
          v67.origin.double y = v36;
          v67.size.width = v37;
          v67.size.height = v38;
          double MinX = CGRectGetMinX(v67);
          if (v40 >= MinX) {
            double MinX = v40;
          }
          [(AKMainEventHandler *)self setDraggedAnnotationsMaxLeftEdge:MinX];
          [(AKMainEventHandler *)self draggedAnnotationsMinRightEdge];
          double v43 = v42;
          v68.origin.double x = v35;
          v68.origin.double y = v36;
          v68.size.width = v37;
          v68.size.height = v38;
          double MaxX = CGRectGetMaxX(v68);
          if (v43 < MaxX) {
            double MaxX = v43;
          }
          [(AKMainEventHandler *)self setDraggedAnnotationsMinRightEdge:MaxX];
          [(AKMainEventHandler *)self draggedAnnotationsMaxBottomEdge];
          double v46 = v45;
          v69.origin.double x = v35;
          v69.origin.double y = v36;
          v69.size.width = v37;
          v69.size.height = v38;
          double MinY = CGRectGetMinY(v69);
          if (v46 >= MinY) {
            double MinY = v46;
          }
          [(AKMainEventHandler *)self setDraggedAnnotationsMaxBottomEdge:MinY];
          [(AKMainEventHandler *)self draggedAnnotationsMinTopEdge];
          double v49 = v48;
          v70.origin.double x = v35;
          v70.origin.double y = v36;
          v70.size.width = v37;
          v70.size.height = v38;
          double MaxY = CGRectGetMaxY(v70);
          if (v49 < MaxY) {
            double MaxY = v49;
          }
          [(AKMainEventHandler *)self setDraggedAnnotationsMinTopEdge:MaxY];
          if (v20 == ++v22)
          {
            uint64_t v20 = [v18 countByEnumeratingWithState:&v60 objects:v65 count:16];
            if (v20) {
              goto LABEL_6;
            }
            break;
          }
        }
      }

      id v15 = v59;
      [(AKMainEventHandler *)self setDragPageController:v59];
      v51 = [[AKAlignmentGuideController alloc] initWithPageController:v59];
      [(AKMainEventHandler *)self setDragAlignmentGuideController:v51];

      -[AKMainEventHandler _alignedAnnotationDragPointForPoint:withEvent:orRecognizer:](self, "_alignedAnnotationDragPointForPoint:withEvent:orRecognizer:", v6, v7, v58, v14);
      double v53 = v52;
      double v55 = v54;
      -[AKMainEventHandler setFirstDragPoint:](self, "setFirstDragPoint:");
      -[AKMainEventHandler setLastDragPoint:](self, "setLastDragPoint:", v53, v55);
      -[AKMainEventHandler setLastDragActualLocationInWindow:](self, "setLastDragActualLocationInWindow:", v9, v11);
      [(AKMainEventHandler *)self setLastEventWithValidLocationForAutoscroll:v6];
      BOOL v56 = 1;
LABEL_37:
    }
    else
    {
      BOOL v56 = 0;
    }
  }
  return v56;
}

- (BOOL)continueDragEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (!v7) {
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_24;
  }
  BOOL v9 = [v7 state] != 3 && objc_msgSend(v7, "state") != 4 && objc_msgSend(v7, "state") != 5;
  [(AKMainEventHandler *)self lastDragPoint];
  double v78 = v11;
  double v79 = v10;
  [(AKMainEventHandler *)self windowPointFromEvent:v8 orRecognizer:v7];
  double v13 = v12;
  double v15 = v14;
  -[AKMainEventHandler setLastDragActualLocationInWindow:](self, "setLastDragActualLocationInWindow:");
  [(AKMainEventHandler *)self setLastEventWithValidLocationForAutoscroll:v8];
  double v16 = [(AKMainEventHandler *)self dragPageController];
  -[AKMainEventHandler _modelPointFromPointInWindow:usingPageController:](self, "_modelPointFromPointInWindow:usingPageController:", v16, v13, v15);
  double v76 = v17;
  double v77 = v18;

  uint64_t v19 = [(AKMainEventHandler *)self dragPageController];
  [v19 visibleRectOfOverlay];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  double v28 = [(AKMainEventHandler *)self dragPageController];
  double v29 = [v28 overlayView];
  +[AKGeometryHelper convertRect:fromScreenPointsToView:](AKGeometryHelper, "convertRect:fromScreenPointsToView:", v29, 0.0, 0.0, 12.0, 12.0);
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;

  double v38 = [(AKMainEventHandler *)self dragPageController];
  objc_msgSend(v38, "convertRectFromOverlayToModel:", v31, v33, v35, v37);
  CGFloat v40 = v39;
  CGFloat v42 = v41;

  v80.origin.CGFloat x = v21;
  v80.origin.CGFloat y = v23;
  v80.size.CGFloat width = v25;
  v80.size.CGFloat height = v27;
  CGRect v81 = CGRectInset(v80, v40, v42);
  CGFloat x = v81.origin.x;
  CGFloat y = v81.origin.y;
  CGFloat width = v81.size.width;
  CGFloat height = v81.size.height;
  double MaxX = CGRectGetMaxX(v81);
  [(AKMainEventHandler *)self firstDragPoint];
  double v49 = v48;
  [(AKMainEventHandler *)self draggedAnnotationsMaxLeftEdge];
  double v51 = MaxX + v49 - v50;
  if (v76 >= v51) {
    double v52 = v51;
  }
  else {
    double v52 = v76;
  }
  v82.origin.CGFloat x = x;
  v82.origin.CGFloat y = y;
  v82.size.CGFloat width = width;
  v82.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v82);
  [(AKMainEventHandler *)self draggedAnnotationsMinRightEdge];
  double v55 = v54;
  [(AKMainEventHandler *)self firstDragPoint];
  double v57 = MinX - (v55 - v56);
  if (v52 >= v57) {
    double v58 = v52;
  }
  else {
    double v58 = v57;
  }
  v83.origin.CGFloat x = x;
  v83.origin.CGFloat y = y;
  v83.size.CGFloat width = width;
  v83.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v83);
  [(AKMainEventHandler *)self firstDragPoint];
  double v61 = v60;
  [(AKMainEventHandler *)self draggedAnnotationsMaxBottomEdge];
  double v63 = MaxY + v61 - v62;
  if (v77 >= v63) {
    double v64 = v63;
  }
  else {
    double v64 = v77;
  }
  v84.origin.CGFloat x = x;
  v84.origin.CGFloat y = y;
  v84.size.CGFloat width = width;
  v84.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v84);
  [(AKMainEventHandler *)self draggedAnnotationsMinTopEdge];
  double v67 = v66;
  [(AKMainEventHandler *)self firstDragPoint];
  if (v64 >= MinY - (v67 - v68)) {
    double v69 = v64;
  }
  else {
    double v69 = MinY - (v67 - v68);
  }
  -[AKMainEventHandler _alignedAnnotationDragPointForPoint:withEvent:orRecognizer:](self, "_alignedAnnotationDragPointForPoint:withEvent:orRecognizer:", v8, v7, v58, v69, *(void *)&v76);
  double v71 = v70;
  double v73 = v72;
  -[AKMainEventHandler setLastDragActualLocation:](self, "setLastDragActualLocation:");
  -[AKMainEventHandler setLastDragPoint:](self, "setLastDragPoint:", v79 + v71 - v79, v78 + v73 - v78);
  if (vabdd_f64(v71, v79) >= 0.0005 || vabdd_f64(v73, v78) >= 0.0005)
  {
    -[AKMainEventHandler applyTranslationToAllSelectedAnnotations:](self, "applyTranslationToAllSelectedAnnotations:", v71 - v79, v73 - v78);
    if (v9) {
      goto LABEL_22;
    }
LABEL_24:
    [(AKMainEventHandler *)self finishTranslationOfAllSelectedAnnotations];
    [(AKMainEventHandler *)self setLastEventWithValidLocationForAutoscroll:0];
    BOOL v74 = 0;
    goto LABEL_25;
  }
  if (!v9) {
    goto LABEL_24;
  }
LABEL_22:
  BOOL v74 = 1;
LABEL_25:

  return v74;
}

- (BOOL)enterRotateEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v12 = 0;
  }
  else
  {
    id v8 = [(AKMainEventHandler *)self controller];
    BOOL v9 = [v8 currentPageController];
    double v10 = [v9 pageModelController];
    double v11 = [v10 selectedAnnotations];

    BOOL v12 = [v11 count] != 0;
  }

  return v12;
}

- (BOOL)continueRotateEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4
{
  id v6 = a4;
  [(AKMainEventHandler *)self applyToAllSelectedAnnotationsRotateEvent:a3 orRecognizer:v6];
  BOOL v7 = !v6 || [v6 state] != 3 && objc_msgSend(v6, "state") != 4;

  return v7;
}

- (id)annotationsPassingBoundingBoxHitTestsWithPoint:(CGPoint)a3 onPageController:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = [MEMORY[0x263EFF9B0] orderedSet];
  [v6 currentModelToScreenScaleFactor];
  +[AKAnnotationPointOfInterestHelper draggableAreaScaleFactorForScaleFactor:](AKAnnotationPointOfInterestHelper, "draggableAreaScaleFactorForScaleFactor:");
  double v9 = v8;
  double v10 = *(double *)&AKPointOfInterestSize_LargestHandleSize;
  double v11 = [v6 pageModelController];
  BOOL v12 = [v11 annotations];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v13 = objc_msgSend(v12, "reverseObjectEnumerator", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    double v16 = -1.0 / v9 * v10;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (([v19 editingDisabled] & 1) == 0)
        {
          [v19 hitTestBounds];
          CGRect v32 = CGRectInset(v31, v16, v16);
          v30.CGFloat x = x;
          v30.CGFloat y = y;
          if (CGRectContainsPoint(v32, v30)) {
            [v7 addObject:v19];
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  double v20 = [v7 reversedOrderedSet];
  CGFloat v21 = [v20 array];

  return v21;
}

- (id)topmostAnnotationForBorderAndInteriorHitTestAtPoint:(CGPoint)a3 inAnnotations:(id)a4 onPageController:(id)a5 wasOnBorder:(BOOL *)a6 wasOnText:(BOOL *)a7
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  *a6 = 0;
  *a7 = 0;
  [v13 currentModelToScreenScaleFactor];
  double v15 = v14;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  double v16 = [v12 reverseObjectEnumerator];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    id v25 = v12;
    uint64_t v19 = *(void *)v27;
    double v20 = 20.0 / v15;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        double v22 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (([v22 editingDisabled] & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || [v22 showHandles])
          {
            if ([v22 conformsToAKTextAnnotationProtocol])
            {
              id v23 = v22;
              if (+[AKTextAnnotationRenderHelper hitTestPoint:againstActualTextForAnnotation:onPageController:](AKTextAnnotationRenderHelper, "hitTestPoint:againstActualTextForAnnotation:onPageController:", v23, v13, x, y))
              {
                *a7 = 1;
                goto LABEL_22;
              }
            }
            if (+[AKAnnotationRenderer pointIsOnBorder:ofAnnotation:minimumBorderThickness:](AKAnnotationRenderer, "pointIsOnBorder:ofAnnotation:minimumBorderThickness:", v22, x, y, v20))
            {
              *a6 = 1;
LABEL_20:
              id v23 = v22;
              goto LABEL_22;
            }
            if (+[AKAnnotationRenderer pointIsOnInside:ofAnnotation:](AKAnnotationRenderer, "pointIsOnInside:ofAnnotation:", v22, x, y))
            {
              *a6 = 0;
              goto LABEL_20;
            }
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v18) {
        continue;
      }
      break;
    }
    id v23 = 0;
LABEL_22:
    id v12 = v25;
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (BOOL)hitTestPointsOfInterestsAtPoint:(CGPoint)a3 onPageController:(id)a4 inAnnotations:(id)a5 event:(id)a6 recognizer:(id)a7 cursorUpdateOnly:(BOOL)a8
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v18 = [v14 pageModelController];
  uint64_t v19 = [v18 selectedAnnotations];

  [v14 currentModelToScreenScaleFactor];
  double v21 = v20;
  double v22 = (void *)[objc_alloc(MEMORY[0x263EFF9B0]) initWithArray:v15];
  [v22 intersectSet:v19];
  id v23 = [v14 pageModelController];
  long long v24 = [v23 cropAnnotation];

  if (v24) {
    [v22 insertObject:v24 atIndex:0];
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v25 = [v22 reverseObjectEnumerator];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (!v26)
  {
    LOBYTE(v33) = 0;
    goto LABEL_26;
  }
  uint64_t v27 = v26;
  double v39 = v22;
  CGFloat v40 = v19;
  *(void *)&long long v41 = v17;
  *((void *)&v41 + 1) = v16;
  id v42 = v15;
  uint64_t v28 = *(void *)v44;
LABEL_5:
  uint64_t v29 = 0;
  while (1)
  {
    if (*(void *)v44 != v28) {
      objc_enumerationMutation(v25);
    }
    CGPoint v30 = *(void **)(*((void *)&v43 + 1) + 8 * v29);
    if (([v30 editingDisabled] & 1) == 0
      && (v30 != v24 || [v24 showHandles]))
    {
      break;
    }
LABEL_14:
    if (v27 == ++v29)
    {
      uint64_t v27 = [v25 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v27) {
        goto LABEL_5;
      }
LABEL_16:
      LOBYTE(v33) = 0;
      id v15 = v42;
      id v17 = (id)v41;
      goto LABEL_25;
    }
  }
  unint64_t v31 = +[AKAnnotationPointOfInterestHelper draggableAreaForPoint:onAnnotation:withScale:pageControllerForPixelAlignment:](AKAnnotationPointOfInterestHelper, "draggableAreaForPoint:onAnnotation:withScale:pageControllerForPixelAlignment:", v30, v14, x, y, v21);
  unint64_t v32 = v31;
  if (!v31 || a8)
  {
    if (v31) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  id v17 = (id)v41;
  id v15 = v42;
  if (v41 == 0)
  {
    LOBYTE(v33) = 1;
  }
  else
  {
    id v34 = +[AKAnnotationEventHandler newAnnotationEventHandlerForCurrentPlatformForAnnotation:v30 withPageController:v14];
    [v34 setInitiallyDraggedArea:v32];
    int v33 = [v34 enterDraggableAreaEventTrackingLoopWithEvent:v16 orRecognizer:(void)v41];
    if (v33)
    {
      double v37 = [(AKMainEventHandler *)self controller];
      [(AKMainEventHandler *)self setAnnotationEventHandler:v34];
      if (v30 == v24)
      {
        double v35 = [v37 modelController];
        [v35 deselectAllAnnotations];
      }
      [v37 hideSelectionMenu:0];
      [v30 setIsDraggingHandle:1];
    }
  }
LABEL_25:
  double v22 = v39;
  uint64_t v19 = v40;
LABEL_26:

  return v33;
}

- (BOOL)hitTestAnnotationsIncludingPOI:(BOOL)a3 ignoreIfDeselected:(BOOL)a4 atPointInWindow:(CGPoint)a5 outAnnotation:(id *)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v24 = 0;
  -[AKMainEventHandler modelPointFromWindowPoint:foundOnPageController:](self, "modelPointFromWindowPoint:foundOnPageController:", &v24, a5.x, a5.y);
  double v11 = v10;
  double v13 = v12;
  id v14 = v24;
  id v15 = -[AKMainEventHandler annotationsPassingBoundingBoxHitTestsWithPoint:onPageController:](self, "annotationsPassingBoundingBoxHitTestsWithPoint:onPageController:", v14, v11, v13);
  if (v8
    && -[AKMainEventHandler hitTestPointsOfInterestsAtPoint:onPageController:inAnnotations:event:recognizer:cursorUpdateOnly:](self, "hitTestPointsOfInterestsAtPoint:onPageController:inAnnotations:event:recognizer:cursorUpdateOnly:", v14, v15, 0, 0, 0, v11, v13))
  {
    BOOL v16 = 1;
  }
  else
  {
    __int16 v23 = 0;
    uint64_t v17 = -[AKMainEventHandler topmostAnnotationForBorderAndInteriorHitTestAtPoint:inAnnotations:onPageController:wasOnBorder:wasOnText:](self, "topmostAnnotationForBorderAndInteriorHitTestAtPoint:inAnnotations:onPageController:wasOnBorder:wasOnText:", v15, v14, (char *)&v23 + 1, &v23, v11, v13);
    id v18 = (id)v17;
    BOOL v16 = v17 != 0;
    if (v7
      && v17
      && ([v14 pageModelController],
          uint64_t v19 = objc_claimAutoreleasedReturnValue(),
          [v19 selectedAnnotations],
          double v20 = objc_claimAutoreleasedReturnValue(),
          char v21 = [v20 containsObject:v18],
          v20,
          v19,
          (v21 & 1) == 0))
    {

      BOOL v16 = 0;
      id v18 = 0;
    }
    else if (a6 && v18)
    {
      id v18 = v18;
      *a6 = v18;
      BOOL v16 = 1;
    }
  }
  return v16;
}

- (void)applyTranslationToAllSelectedAnnotations:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a3.x != *MEMORY[0x263F00148] || a3.y != *(double *)(MEMORY[0x263F00148] + 8))
  {
    id v6 = [(AKMainEventHandler *)self controller];
    BOOL v7 = [v6 currentPageController];
    BOOL v8 = [v7 pageModelController];
    double v9 = [v8 selectedAnnotations];

    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "translateBy:", x, y, (void)v15);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }

    [MEMORY[0x263F158F8] commit];
  }
}

- (void)finishTranslationOfAllSelectedAnnotations
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(AKMainEventHandler *)self controller];
  id v3 = [v2 currentPageController];
  id v4 = [v3 pageModelController];
  v5 = [v4 selectedAnnotations];

  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = objc_msgSend(v3, "layerPresentationManager", (void)v13);
          [v12 forceUpdateAnnotationLayer:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [MEMORY[0x263F158F8] commit];
}

- (CGPoint)_modelPointFromPointInWindow:(CGPoint)a3 usingPageController:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  uint64_t v7 = [v6 overlayView];
  objc_msgSend(v7, "convertPoint:fromView:", 0, x, y);
  objc_msgSend(v6, "convertPointFromOverlayToModel:");
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (void)_setCurrentPageBasedOnPageController:(id)a3
{
  id v4 = a3;
  id v6 = [(AKMainEventHandler *)self controller];
  uint64_t v5 = [v4 pageIndex];

  [v6 setCurrentPageIndex:v5];
}

- (BOOL)_didNotHandleEventSoDeselect
{
  v2 = [(AKMainEventHandler *)self controller];
  id v3 = [v2 modelController];
  [v3 deselectAllAnnotations];

  id v4 = [v2 delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 clearHighlightableSelectionForAnnotationController:v2];
  }
  [v2 hideSelectionMenu:0];

  return 0;
}

- (void)_updateSelectionWithAnnotation:(id)a3 onPageController:(id)a4
{
  id v8 = a3;
  uint64_t v5 = [a4 pageModelController];
  id v6 = [v5 mutableSetValueForKey:@"selectedAnnotations"];

  if (([v6 containsObject:v8] & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x263EFFA08] setWithObject:v8];
    [v6 setSet:v7];
  }
}

- (CGPoint)_alignedAnnotationDragPointForPoint:(CGPoint)a3 withEvent:(id)a4 orRecognizer:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a5;
  id v10 = a4;
  double v11 = [(AKMainEventHandler *)self dragAlignmentGuideController];
  objc_msgSend(v11, "guideAlignedPointForPoint:withEvent:orRecognizer:", v10, v9, x, y);
  double v13 = v12;
  double v15 = v14;

  long long v16 = [(AKMainEventHandler *)self dragPageController];
  long long v17 = [v16 geometryHelper];
  objc_msgSend(v17, "screenPixelAlignedPointForPoint:", v13, v15);
  double v19 = v18;
  double v21 = v20;

  double v22 = [(AKMainEventHandler *)self dragPageController];
  __int16 v23 = [v22 geometryHelper];
  objc_msgSend(v23, "contentAlignedPointForPoint:", v19, v21);
  double v25 = v24;
  double v27 = v26;

  double v28 = v25;
  double v29 = v27;
  result.double y = v29;
  result.double x = v28;
  return result;
}

- (BOOL)_detectFormElementInCurrentPageControllerUnderPointInWindow:(CGPoint)a3 withStartingPoint:(CGPoint)a4
{
  double y = a3.y;
  double x = a3.x;
  [(AKMainEventHandler *)self leftMouseDownPoint];
  +[AKGeometryHelper distanceBetweenPoints:andPoint:](AKGeometryHelper, "distanceBetweenPoints:andPoint:");
  if (v7 > 0.0) {
    return 0;
  }

  return -[AKMainEventHandler _detectFormElementInCurrentPageControllerUnderPointInWindow:](self, "_detectFormElementInCurrentPageControllerUnderPointInWindow:", x, y);
}

- (BOOL)_detectFormElementInCurrentPageControllerUnderPointInWindow:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(AKMainEventHandler *)self controller];
  id v6 = [v5 delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v6 controllerShouldDetectFormElements:v5])
  {
    double v7 = [v5 currentPageController];
    id v8 = [v7 overlayView];

    objc_msgSend(v8, "convertPoint:fromView:", 0, x, y);
    double v10 = v9;
    double v12 = v11;
    double v13 = [v5 formDetectionController];
    double v14 = [v5 currentPageController];
    char v15 = objc_msgSend(v13, "detectFormFeatureAtPoint:inPageController:", v14, v10, v12);
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (BOOL)mainEventHandlerIsInTrackingLoop
{
  return self->_mainEventHandlerIsInTrackingLoop;
}

- (void)setMainEventHandlerIsInTrackingLoop:(BOOL)a3
{
  self->_mainEventHandlerIsInTrackingLoop = a3;
}

- (BOOL)mainEventHandlerIsInDoodleTrackingLoop
{
  return self->_mainEventHandlerIsInDoodleTrackingLoop;
}

- (void)setMainEventHandlerIsInDoodleTrackingLoop:(BOOL)a3
{
  self->_mainEventHandlerIsInDoodleTrackingLoop = a3;
}

- (BOOL)mainEventHandlerIsInRotationLoop
{
  return self->_mainEventHandlerIsInRotationLoop;
}

- (void)setMainEventHandlerIsInRotationLoop:(BOOL)a3
{
  self->_mainEventHandlerIsInRotationLoop = a3;
}

- (AKAnnotationEventHandler)annotationEventHandler
{
  return (AKAnnotationEventHandler *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAnnotationEventHandler:(id)a3
{
}

- (unint64_t)currentModifierFlags
{
  return self->_currentModifierFlags;
}

- (void)setCurrentModifierFlags:(unint64_t)a3
{
  self->_currentModifierFlags = a3;
}

- (BOOL)shouldEatNextLeftMouseUp
{
  return self->_shouldEatNextLeftMouseUp;
}

- (void)setShouldEatNextLeftMouseUp:(BOOL)a3
{
  self->_shouldEatNextLeftMouseUp = a3;
}

- (BOOL)shouldEatNextRightMouseUp
{
  return self->_shouldEatNextRightMouseUp;
}

- (void)setShouldEatNextRightMouseUp:(BOOL)a3
{
  self->_shouldEatNextRightMouseUp = a3;
}

- (BOOL)dragDidCopySelectedAnnotations
{
  return self->_dragDidCopySelectedAnnotations;
}

- (void)setDragDidCopySelectedAnnotations:(BOOL)a3
{
  self->_dragDidCopySelectedAnnotations = a3;
}

- (BOOL)undoManagerWasGroupingByEvent
{
  return self->_undoManagerWasGroupingByEvent;
}

- (void)setUndoManagerWasGroupingByEvent:(BOOL)a3
{
  self->_undoManagerWasGroupingByEvent = a3;
}

- (CGPoint)leftMouseDownPoint
{
  objc_copyStruct(v4, &self->_leftMouseDownPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setLeftMouseDownPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_leftMouseDownPoint, &v3, 16, 1, 0);
}

- (AKPageController)dragPageController
{
  return (AKPageController *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDragPageController:(id)a3
{
}

- (AKAlignmentGuideController)dragAlignmentGuideController
{
  return (AKAlignmentGuideController *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDragAlignmentGuideController:(id)a3
{
}

- (CGPoint)lastDragPoint
{
  objc_copyStruct(v4, &self->_lastDragPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setLastDragPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_lastDragPoint, &v3, 16, 1, 0);
}

- (CGPoint)lastDragActualLocation
{
  objc_copyStruct(v4, &self->_lastDragActualLocation, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setLastDragActualLocation:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_lastDragActualLocation, &v3, 16, 1, 0);
}

- (CGPoint)lastDragActualLocationInWindow
{
  objc_copyStruct(v4, &self->_lastDragActualLocationInWindow, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setLastDragActualLocationInWindow:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_lastDragActualLocationInWindow, &v3, 16, 1, 0);
}

- (double)draggedAnnotationsMaxLeftEdge
{
  return self->_draggedAnnotationsMaxLeftEdge;
}

- (void)setDraggedAnnotationsMaxLeftEdge:(double)a3
{
  self->_draggedAnnotationsMaxLeftEdge = a3;
}

- (double)draggedAnnotationsMinRightEdge
{
  return self->_draggedAnnotationsMinRightEdge;
}

- (void)setDraggedAnnotationsMinRightEdge:(double)a3
{
  self->_draggedAnnotationsMinRightEdge = a3;
}

- (double)draggedAnnotationsMaxBottomEdge
{
  return self->_draggedAnnotationsMaxBottomEdge;
}

- (void)setDraggedAnnotationsMaxBottomEdge:(double)a3
{
  self->_draggedAnnotationsMaxBottomEdge = a3;
}

- (double)draggedAnnotationsMinTopEdge
{
  return self->_draggedAnnotationsMinTopEdge;
}

- (void)setDraggedAnnotationsMinTopEdge:(double)a3
{
  self->_draggedAnnotationsMinTopEdge = a3;
}

- (UIEvent)lastEventWithValidLocationForAutoscroll
{
  return (UIEvent *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastEventWithValidLocationForAutoscroll:(id)a3
{
}

- (UIEvent)lastLeftMouseDownEvent
{
  return (UIEvent *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLastLeftMouseDownEvent:(id)a3
{
}

- (BOOL)wasSelectedByLongPressRecognizer
{
  return self->_wasSelectedByLongPressRecognizer;
}

- (void)setWasSelectedByLongPressRecognizer:(BOOL)a3
{
  self->_wasSelectedByLongPressRecognizer = a3;
}

- (AKAnnotation)annotationToBeginEditingOnDragEnd
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationToBeginEditingOnDragEnd);

  return (AKAnnotation *)WeakRetained;
}

- (void)setAnnotationToBeginEditingOnDragEnd:(id)a3
{
}

- (AKHighlightColorEditorController)highlightColorEditor
{
  return (AKHighlightColorEditorController *)objc_getProperty(self, a2, 120, 1);
}

- (void)setHighlightColorEditor:(id)a3
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

- (CGPoint)firstDragPoint
{
  objc_copyStruct(v4, &self->_firstDragPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setFirstDragPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_firstDragPoint, &v3, 16, 1, 0);
}

- (CGPoint)panGestureStartPointInWindow
{
  objc_copyStruct(v4, &self->_panGestureStartPointInWindow, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setPanGestureStartPointInWindow:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_panGestureStartPointInWindow, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_highlightColorEditor, 0);
  objc_destroyWeak((id *)&self->_annotationToBeginEditingOnDragEnd);
  objc_storeStrong((id *)&self->_lastLeftMouseDownEvent, 0);
  objc_storeStrong((id *)&self->_lastEventWithValidLocationForAutoscroll, 0);
  objc_storeStrong((id *)&self->_dragAlignmentGuideController, 0);
  objc_storeStrong((id *)&self->_dragPageController, 0);

  objc_storeStrong((id *)&self->_annotationEventHandler, 0);
}

@end