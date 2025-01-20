@interface PKTextInputCanvasController
+ (id)defaultInkWithColor:(uint64_t)a1;
+ (void)prewarmFutureCanvasesIfNecessarySecureRendering:(uint64_t)a1;
- (BOOL)canvasViewAllowSnapToShape:(id)a3;
- (PKTextInputCanvasController)init;
- (double)convertRect:(double)a3 toCanvasFromCoordinateSpace:(double)a4;
- (double)renderedStrokesBounds;
- (id).cxx_construct;
- (id)_containerView;
- (id)canvasCoordinateSpace;
- (id)canvasView:(id)a3 inkForStroke:(id)a4;
- (id)canvasViewTouchView:(id)a3;
- (id)defaultStrokeColor;
- (id)inProgressStroke;
- (uint64_t)canvasHasVisibleStrokes;
- (void)_clearRecordedColorForStroke:(uint64_t)a1;
- (void)_recordColorForStroke:(uint64_t)a1;
- (void)_trackRecentlyRemovedStrokes:(uint64_t)a1;
- (void)_updateCanvasView;
- (void)_updateCanvasViewInkAnimated:(uint64_t)a1;
- (void)_updateCanvasViewOffsetFromTouch:(uint64_t)a1;
- (void)_updateFloatingBackground;
- (void)animateAndRemoveStrokes:(uint64_t)a3 destinationFrame:(CGFloat)a4 animationDuration:(CGFloat)a5 useImpreciseAnimation:(CGFloat)a6;
- (void)canvasView:(id)a3 beganStroke:(id)a4;
- (void)canvasView:(id)a3 cancelledStroke:(id)a4;
- (void)canvasView:(id)a3 didPresentWithCanvasOffset:(CGPoint)a4;
- (void)canvasView:(id)a3 drawingDidChange:(id)a4;
- (void)canvasView:(id)a3 endedStroke:(id)a4;
- (void)canvasViewDidBeginDrawing:(id)a3;
- (void)canvasViewDidEndDrawing:(id)a3;
- (void)canvasViewDidFinishAnimatingStrokes:(id)a3;
- (void)canvasViewDrawingMoved:(id)a3 withTouch:(id)a4;
- (void)canvasViewHasVisibleStrokesChanged:(id)a3;
- (void)canvasViewWillBeginNewStroke:(id)a3 withTouch:(id)a4 location:(CGPoint)a5;
- (void)dealloc;
- (void)reloadPreferredStrokeColor;
- (void)removeStrokes:(double)a3 animationDuration:;
- (void)reportDebugStateDescription:(id)a3;
- (void)setDelegate:(uint64_t)a1;
- (void)setFloatingBackgroundRect:(double)a3;
@end

@implementation PKTextInputCanvasController

- (PKTextInputCanvasController)init
{
  v9.receiver = self;
  v9.super_class = (Class)PKTextInputCanvasController;
  v2 = [(PKTextInputCanvasController *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    recentlyRemovedStrokeIDs = v2->_recentlyRemovedStrokeIDs;
    v2->_recentlyRemovedStrokeIDs = v3;

    v5 = +[PKTextInputSettings sharedSettings];
    v2->_useSlidingCanvas = [v5 useSlidingCanvas];

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    strokeColorForStrokeUUID = v2->_strokeColorForStrokeUUID;
    v2->_strokeColorForStrokeUUID = (NSMutableDictionary *)v6;
  }
  return v2;
}

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (PKTextInputCanvasController *)self->__canvasView;
  }
  v3 = [(PKTextInputCanvasController *)self drawingGestureRecognizer];
  [v3 setDrawingTarget:0];

  v4.receiver = v2;
  v4.super_class = (Class)PKTextInputCanvasController;
  [(PKTextInputCanvasController *)&v4 dealloc];
}

+ (void)prewarmFutureCanvasesIfNecessarySecureRendering:(uint64_t)a1
{
  uint64_t v3 = self;
  +[PKTiledCanvasView prewarmFutureCanvasesIfNecessarySecureRendering:a2 prewarmSharedResourceHandler:0];
  id v5 = [MEMORY[0x1E4FB1618] blackColor];
  id v4 = +[PKTextInputCanvasController defaultInkWithColor:](v3, v5);
}

+ (id)defaultInkWithColor:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    uint64_t v3 = +[PKTextInputSettings sharedSettings];
    [v3 inkWeightForIncreasedContrast];
  }
  else
  {
    uint64_t v3 = +[PKTextInputSettings sharedSettings];
    [v3 inkWeight];
  }
  double v5 = v4;

  uint64_t v6 = +[PKInk inkWithIdentifier:@"com.apple.ink.pen" color:v2 weight:v5];

  return v6;
}

- (void)_updateCanvasViewInkAnimated:(uint64_t)a1
{
  if (*(void *)(a1 + 96))
  {
    id v4 = *(id *)(a1 + 88);
    if (!v4)
    {
      id v4 = [MEMORY[0x1E4FB1618] whiteColor];
    }
    id v8 = v4;
    double v5 = +[PKTextInputCanvasController defaultInkWithColor:]((uint64_t)PKTextInputCanvasController, v4);
    [*(id *)(a1 + 96) setInk:v5];

    id v6 = *(id *)(a1 + 88);
    v7 = *(void **)(a1 + 56);
    if (v7) {
      -[PKTextInputCanvasController _recordColorForStroke:](a1, v7);
    }
    [*(id *)(a1 + 96) setLiveRenderingOverrideColor:v6 animated:a2];
  }
}

- (id)defaultStrokeColor
{
  if (a1)
  {
    a1 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_containerView
{
  id v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 9);
    id v1 = [WeakRetained canvasControllerContainerView:v1];
  }

  return v1;
}

- (void)_updateCanvasView
{
  v58[4] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(unsigned char *)(a1 + 64) || *(unsigned char *)(a1 + 65))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      BOOL v3 = WeakRetained != 0;

      double v5 = (id *)(a1 + 96);
      id v4 = *(void **)(a1 + 96);
      BOOL v6 = v4 == 0;
      if (WeakRetained && !v4)
      {
        v7 = +[PKTextInputSettings sharedSettings];
        *(unsigned char *)(a1 + 16) = [v7 useSlidingCanvas];

        id v8 = +[PKTextInputSettings sharedSettings];
        [v8 slidingCanvasWidth];
        double v10 = v9;

        v11 = +[PKTextInputSettings sharedSettings];
        [v11 slidingCanvasHeight];
        double v13 = v12;

        v14 = +[PKTextInputSettings sharedSettings];
        uint64_t v15 = [v14 useSingleComponentCanvas];

        v16 = [PKTiledCanvasView alloc];
        v17 = -[PKTiledCanvasView initWithFrame:usePrivateResourceHandler:singleComponent:sixChannelBlending:](v16, "initWithFrame:usePrivateResourceHandler:singleComponent:sixChannelBlending:", 1, v15, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        [(PKTiledCanvasView *)v17 setResourceCacheSize:0x800000];
        [(PKTiledCanvasView *)v17 setDisableAXDrawingAnnouncements:1];
        [(PKTiledCanvasView *)v17 setOverrideUserInterfaceStyle:1];
        [(PKTiledCanvasView *)v17 setAccessibilityIgnoresInvertColors:1];
        if (PK_UIApplicationIsSystemShell_onceToken != -1) {
          dispatch_once(&PK_UIApplicationIsSystemShell_onceToken, &__block_literal_global_72);
        }
        unint64_t v18 = (unint64_t)v10;
        unint64_t v19 = (unint64_t)v13;
        if (!PK_UIApplicationIsSystemShell___result)
        {
          unint64_t v20 = MEMORY[0x1C87849E0]();
          if (*(unsigned char *)(a1 + 16))
          {
            +[PKMetalUtility layerContentsScale];
            uint64_t v22 = 18;
            if (v15) {
              uint64_t v22 = 12;
            }
            unint64_t v23 = (unint64_t)((double)(v19 * v18 * v22) * v21 + 54457280.0);
          }
          else
          {
            unint64_t v23 = 188743680;
          }
          if (v20 < v23) {
            [(PKTiledCanvasView *)v17 setMetalLayerContentsScaleOverride:1.0];
          }
        }
        [(PKTiledCanvasView *)v17 setDelegate:a1];
        [(PKTiledCanvasView *)v17 setOpaque:0];
        [(PKTiledCanvasView *)v17 setLiveStrokeMode:1];
        [(PKTiledCanvasView *)v17 setUseLuminanceColorFilter:1];
        objc_storeStrong((id *)(a1 + 96), v17);
        -[PKTextInputCanvasController _updateCanvasViewInkAnimated:](a1, 0);
        id v29 = objc_loadWeakRetained((id *)(a1 + 72));
        v30 = [v29 canvasControllerContainerView:a1];

        [v30 addSubview:v17];
        [(PKTiledCanvasView *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
        if (*(unsigned char *)(a1 + 16))
        {
          v31 = +[PKTextInputSettings sharedSettings];
          int v32 = [v31 slidingCanvasDebugBorder];

          if (v32)
          {
            id v33 = [MEMORY[0x1E4FB1618] labelColor];
            uint64_t v34 = [v33 CGColor];
            v35 = [(PKTiledCanvasView *)v17 layer];
            [v35 setBorderColor:v34];

            v36 = [(PKTiledCanvasView *)v17 layer];
            [v36 setBorderWidth:1.0];
          }
          v37 = +[PKTextInputSettings sharedSettings];
          [v37 slidingCanvasWidth];
          double v39 = v38;
          v40 = +[PKTextInputSettings sharedSettings];
          [v40 slidingCanvasHeight];
          double v42 = v41;

          -[PKTiledCanvasView setLiveStrokeMaxSize:](v17, "setLiveStrokeMaxSize:", v39, v42);
          [(PKTiledCanvasView *)v17 setEnableCanvasOffsetSupport:1];
          -[PKTiledCanvasView setFrame:](v17, "setFrame:", 0.0, 0.0, (double)v18, (double)v19);
        }
        else
        {
          v55 = [(PKTiledCanvasView *)v17 leadingAnchor];
          v54 = [v30 leadingAnchor];
          v53 = [v55 constraintEqualToAnchor:v54];
          v58[0] = v53;
          v57 = [(PKTiledCanvasView *)v17 trailingAnchor];
          v52 = [v30 trailingAnchor];
          v51 = objc_msgSend(v57, "constraintEqualToAnchor:");
          v58[1] = v51;
          v56 = [(PKTiledCanvasView *)v17 topAnchor];
          v43 = [v30 topAnchor];
          v44 = [v56 constraintEqualToAnchor:v43];
          v58[2] = v44;
          v45 = [(PKTiledCanvasView *)v17 bottomAnchor];
          v46 = [v30 bottomAnchor];
          v47 = [v45 constraintEqualToAnchor:v46];
          v58[3] = v47;
          v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];

          [MEMORY[0x1E4F28DC8] activateConstraints:v48];
        }
        id v49 = objc_loadWeakRetained((id *)(a1 + 72));
        v50 = [v49 canvasControllerDrawingGestureRecognizer:a1];

        [(PKTiledCanvasView *)v17 setDrawingGestureRecognizer:v50];
        [v50 setDrawingTarget:v17];
        +[PKTextInputDebugStateIntrospector debugStateDidChange];

LABEL_28:
        [*(id *)(a1 + 96) setHidden:*(unsigned char *)(a1 + 64) == 0];
        -[PKTextInputCanvasController _updateFloatingBackground](a1);
        return;
      }
    }
    else
    {
      BOOL v3 = 0;
      double v5 = (id *)(a1 + 96);
      id v4 = *(void **)(a1 + 96);
      BOOL v6 = v4 == 0;
    }
    if (!v3 && !v6)
    {
      id v24 = v4;
      v25 = [v24 drawingGestureRecognizer];
      id v26 = [v25 drawingTarget];
      id v27 = *v5;

      if (v26 == v27)
      {
        v28 = [*v5 drawingGestureRecognizer];
        [v28 setDrawingTarget:0];
      }
      [*v5 removeFromSuperview];
      [*v5 setDelegate:0];
      objc_storeStrong(v5, 0);
      +[PKTextInputDebugStateIntrospector debugStateDidChange];
    }
    goto LABEL_28;
  }
}

- (uint64_t)canvasHasVisibleStrokes
{
  if (result)
  {
    uint64_t v1 = result;
    if ([*(id *)(result + 96) isDrawing])
    {
      return 1;
    }
    else
    {
      id v2 = *(void **)(v1 + 96);
      return [v2 hasVisibleStrokes];
    }
  }
  return result;
}

- (double)renderedStrokesBounds
{
  if (!a1) {
    return 0.0;
  }
  id v2 = *(id *)(a1 + 96);
  if (v2)
  {
    [*(id *)(a1 + 96) renderedStrokesBounds];
    double v4 = v3;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB20];
  }

  return v4;
}

- (id)inProgressStroke
{
  if (a1)
  {
    uint64_t v1 = [*(id *)(a1 + 96) currentStrokeWithStrokeDataCopy];
    [v1 _setIsInProgressScribbleStroke:1];
  }
  else
  {
    uint64_t v1 = 0;
  }

  return v1;
}

- (void)setDelegate:(uint64_t)a1
{
  id obj = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));

    if (WeakRetained != obj)
    {
      objc_storeWeak((id *)(a1 + 72), obj);
      -[PKTextInputCanvasController _updateCanvasView](a1);
    }
  }
}

- (void)reloadPreferredStrokeColor
{
  if (a1)
  {
    unsigned __int8 v11 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    double v3 = [WeakRetained canvasControllerPreferredStrokeColor:a1 animated:&v11];

    if (!v3)
    {
      double v3 = [MEMORY[0x1E4FB1618] whiteColor];
    }
    int v4 = v11;
    id v5 = v3;
    id v6 = *(id *)(a1 + 88);
    if (v6 == v5) {
      goto LABEL_12;
    }
    unint64_t v7 = (unint64_t)v6;
    unint64_t v8 = (unint64_t)v5;
    if (!(v8 | v7)) {
      goto LABEL_12;
    }
    double v9 = (void *)v8;
    if (v8 && v7)
    {
      char v10 = [(id)v7 isEqual:v8];

      if (v10) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)(a1 + 88), v3);
    -[PKTextInputCanvasController _updateCanvasViewInkAnimated:](a1, v4 != 0);
LABEL_12:
  }
}

- (double)convertRect:(double)a3 toCanvasFromCoordinateSpace:(double)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  if (a1)
  {
    double v12 = -[PKTextInputCanvasController _containerView](a1);
    if (v12)
    {
      a3 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v11, v12, a3, a4, a5, a6);
    }
    else
    {
      double v13 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        v16 = a1;
        _os_log_error_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_ERROR, "Trying to convert a rect from a canvas view that has no container view. Canvas controller: %@", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  else
  {
    a3 = 0.0;
  }

  return a3;
}

- (id)canvasCoordinateSpace
{
  if (a1)
  {
    -[PKTextInputCanvasController _containerView](a1);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)removeStrokes:(double)a3 animationDuration:
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    id v6 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      unint64_t v7 = +[PKDrawing _uuidDescriptionForStrokes:v5];
      int v8 = 138412290;
      double v9 = v7;
      _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_INFO, "Fade out strokes from canvas: %@", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 96) fadeOutAndHideStrokes:v5 duration:a3];
    -[PKTextInputCanvasController _trackRecentlyRemovedStrokes:](a1, v5);
  }
}

- (void)_trackRecentlyRemovedStrokes:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        unint64_t v7 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "_strokeUUID", (void)v8);
        if (v7) {
          [*(id *)(a1 + 8) addObject:v7];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)animateAndRemoveStrokes:(uint64_t)a3 destinationFrame:(CGFloat)a4 animationDuration:(CGFloat)a5 useImpreciseAnimation:(CGFloat)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  if (a1)
  {
    v16 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v24.origin.x = a4;
      v24.origin.y = a5;
      v24.size.width = a6;
      v24.size.height = a7;
      uint64_t v17 = NSStringFromCGRect(v24);
      unint64_t v18 = +[PKDrawing _uuidDescriptionForStrokes:v15];
      int v19 = 138412546;
      unint64_t v20 = v17;
      __int16 v21 = 2112;
      uint64_t v22 = v18;
      _os_log_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_INFO, "Animate out strokes from canvas. Frame: %@, strokes: %@", (uint8_t *)&v19, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 96), "animateStrokes:destinationFrame:duration:particles:", v15, a3, a4, a5, a6, a7, a8);
    -[PKTextInputCanvasController _trackRecentlyRemovedStrokes:](a1, v15);
  }
}

- (void)setFloatingBackgroundRect:(double)a3
{
  if (a1 && !CGRectEqualToRect(*(CGRect *)&a2, *(CGRect *)(a1 + 112)))
  {
    *(double *)(a1 + 112) = a2;
    *(double *)(a1 + 120) = a3;
    *(double *)(a1 + 128) = a4;
    *(double *)(a1 + 136) = a5;
    -[PKTextInputCanvasController _updateFloatingBackground](a1);
  }
}

- (void)_updateFloatingBackground
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  id v2 = *(id *)(a1 + 96);
  id v3 = [v2 superview];
  BOOL v4 = v3 && !CGRectIsEmpty(*(CGRect *)(a1 + 112)) && !CGRectIsNull(*(CGRect *)(a1 + 112));

  uint64_t v5 = (void **)(a1 + 104);
  uint64_t v6 = *(void **)(a1 + 104);
  if (v4 && !v6)
  {
    unint64_t v7 = [PKTextInputFloatingBackgroundView alloc];
    long long v8 = -[PKTextInputFloatingBackgroundView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    objc_storeStrong((id *)(a1 + 104), v8);
    id v9 = *(id *)(a1 + 96);
    long long v10 = [v9 superview];
    [v10 insertSubview:v8 belowSubview:*(void *)(a1 + 96)];

    [(PKTextInputFloatingBackgroundView *)v8 setAlpha:0.0];
    long long v11 = (void *)MEMORY[0x1E4FB1EB0];
    double v12 = v39;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __56__PKTextInputCanvasController__updateFloatingBackground__block_invoke;
    v39[3] = &unk_1E64C5368;
    uint64_t v13 = v8;
    v39[4] = v13;
    [v11 animateWithDuration:v39 animations:0.15];
LABEL_14:

    goto LABEL_15;
  }
  if (v6) {
    char v14 = v4;
  }
  else {
    char v14 = 1;
  }
  if ((v14 & 1) == 0)
  {
    id v15 = v6;
    v16 = *v5;
    id *v5 = 0;

    uint64_t v17 = +[PKTextInputSettings sharedSettings];
    [v17 textInputStrokeFadeOutDuration];
    double v19 = v18;

    unint64_t v20 = (void *)MEMORY[0x1E4FB1EB0];
    double v12 = v37;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __56__PKTextInputCanvasController__updateFloatingBackground__block_invoke_2;
    v37[3] = &unk_1E64C5368;
    id v38 = v15;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __56__PKTextInputCanvasController__updateFloatingBackground__block_invoke_3;
    v35[3] = &unk_1E64C5528;
    uint64_t v13 = (PKTextInputFloatingBackgroundView *)v38;
    v36 = v13;
    [v20 animateWithDuration:v37 animations:v35 completion:v19];

    goto LABEL_14;
  }
LABEL_15:
  if (v4)
  {
    double v22 = *(double *)(a1 + 112);
    double v21 = *(double *)(a1 + 120);
    double v24 = *(double *)(a1 + 128);
    double v23 = *(double *)(a1 + 136);
    id v25 = *(id *)(a1 + 104);
    id v26 = [v25 superview];
    id v27 = -[PKTextInputCanvasController _containerView]((id *)a1);
    v28 = v27;
    if (v27)
    {
      double v22 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v27, v26, v22, v21, v24, v23);
      double v21 = v29;
      double v24 = v30;
      double v23 = v31;
    }
    else
    {
      int v32 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = a1;
        _os_log_error_impl(&dword_1C44F8000, v32, OS_LOG_TYPE_ERROR, "Trying to convert a rect to a canvas view that has no container view. Canvas controller: %@", buf, 0xCu);
      }
    }
    double v33 = 0.2;
    v34[1] = 3221225472;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[2] = __56__PKTextInputCanvasController__updateFloatingBackground__block_invoke_4;
    v34[3] = &unk_1E64C7358;
    if (!v6) {
      double v33 = 0.0;
    }
    v34[4] = a1;
    *(double *)&v34[5] = v22;
    *(double *)&v34[6] = v21;
    *(double *)&v34[7] = v24;
    *(double *)&v34[8] = v23;
    objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:delay:options:animations:completion:", 131073, v34, 0, v33);
  }
}

uint64_t __56__PKTextInputCanvasController__updateFloatingBackground__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __56__PKTextInputCanvasController__updateFloatingBackground__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __56__PKTextInputCanvasController__updateFloatingBackground__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __56__PKTextInputCanvasController__updateFloatingBackground__block_invoke_4(double *a1)
{
  double v1 = a1[5];
  double v2 = a1[6];
  double v3 = a1[7];
  double v4 = a1[8];
  uint64_t v5 = *((void *)a1 + 4);
  if (v5) {
    uint64_t v6 = *(void **)(v5 + 104);
  }
  else {
    uint64_t v6 = 0;
  }
  return objc_msgSend(v6, "setFrame:", v1, v2, v3, v4);
}

- (void)_recordColorForStroke:(uint64_t)a1
{
  id v7 = a2;
  if (a1)
  {
    id v3 = *(id *)(a1 + 48);
    objc_sync_enter(v3);
    uint64_t v4 = *(void *)(a1 + 88);
    uint64_t v5 = *(void **)(a1 + 48);
    uint64_t v6 = [v7 _strokeUUID];
    if (v4) {
      [v5 setObject:v4 forKeyedSubscript:v6];
    }
    else {
      [v5 removeObjectForKey:v6];
    }

    objc_sync_exit(v3);
  }
}

- (void)_updateCanvasViewOffsetFromTouch:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && *(unsigned char *)(a1 + 16))
  {
    uint64_t v27 = 0;
    v28 = (double *)&v27;
    uint64_t v29 = 0x5012000000;
    double v30 = __Block_byref_object_copy__17;
    double v31 = __Block_byref_object_dispose__17;
    int v32 = "";
    long long v33 = 0u;
    long long v34 = 0u;
    [*(id *)(a1 + 96) frame];
    *(void *)&long long v33 = v4;
    *((void *)&v33 + 1) = v5;
    *(void *)&long long v34 = v6;
    *((void *)&v34 + 1) = v7;
    [*(id *)(a1 + 96) visibleStrokesBounds];
    long long v8 = v28;
    v8[6] = DKDUpdateFixedSizeRectToIncludeRectIfPossible(v28[6], v28[7], v28[8], v28[9], v9, v10, v11, v12, 16.0, 16.0);
    *((void *)v8 + 7) = v13;
    *((void *)v8 + 8) = v14;
    *((void *)v8 + 9) = v15;
    v16 = *(void **)(a1 + 96);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __64__PKTextInputCanvasController__updateCanvasViewOffsetFromTouch___block_invoke;
    v26[3] = &unk_1E64C8828;
    v26[4] = &v27;
    [v16 enumerateRenderedStrokesBounds:v26];
    uint64_t v17 = *(double **)(a1 + 24);
    double v18 = *(double **)(a1 + 32);
    double v19 = v28;
    if (v17 == v18)
    {
      double v20 = v28[6];
      CGFloat v21 = v28[7];
    }
    else
    {
      double v20 = v28[6];
      CGFloat v21 = v28[7];
      CGFloat v22 = v28[8];
      CGFloat v23 = v28[9];
      do
      {
        double v24 = *v17;
        double v25 = v17[1];
        v17 += 2;
        double v20 = DKDUpdateFixedSizeRectToIncludePoint(v20, v21, v22, v23, v24, v25, 16.0, 16.0);
        v19[6] = v20;
        v19[7] = v21;
        v19[8] = v22;
        v19[9] = v23;
      }
      while (v17 != v18);
    }
    objc_msgSend(*(id *)(a1 + 96), "setCanvasOffset:", v20, v21);
    _Block_object_dispose(&v27, 8);
  }
}

void __64__PKTextInputCanvasController__updateCanvasViewOffsetFromTouch___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v5 = *(double **)(*(void *)(a1 + 32) + 8);
  v5[6] = DKDUpdateFixedSizeRectToIncludeRectIfPossible(v5[6], v5[7], v5[8], v5[9], a2, a3, a4, a5, 16.0, 16.0);
  *((void *)v5 + 7) = v6;
  *((void *)v5 + 8) = v7;
  *((void *)v5 + 9) = v8;
}

- (void)_clearRecordedColorForStroke:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v7 = v3;
    id v4 = *(id *)(a1 + 48);
    objc_sync_enter(v4);
    uint64_t v5 = *(void **)(a1 + 48);
    uint64_t v6 = [v7 _strokeUUID];
    [v5 removeObjectForKey:v6];

    objc_sync_exit(v4);
    id v3 = v7;
  }
}

- (void)canvasView:(id)a3 didPresentWithCanvasOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if (self)
  {
    [(PKTiledCanvasView *)self->__canvasView frame];
    canvasView = self->__canvasView;
  }
  else
  {
    objc_msgSend(0, "frame", a3);
    canvasView = 0;
  }

  -[PKTiledCanvasView setFrame:](canvasView, "setFrame:", x, y);
}

- (id)canvasView:(id)a3 inkForStroke:(id)a4
{
  id v5 = a4;
  uint64_t v6 = self->_strokeColorForStrokeUUID;
  objc_sync_enter(v6);
  strokeColorForStrokeUUID = self->_strokeColorForStrokeUUID;
  uint64_t v8 = [v5 _strokeUUID];
  CGFloat v9 = [(NSMutableDictionary *)strokeColorForStrokeUUID objectForKeyedSubscript:v8];

  objc_sync_exit(v6);
  CGFloat v10 = [v5 ink];
  CGFloat v11 = v10;
  if (v9)
  {
    CGFloat v12 = [v10 color];
    char v13 = [v9 isEqual:v12];

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = +[PKInk inkFromInk:v11 color:v9];

      CGFloat v11 = (void *)v14;
    }
  }

  return v11;
}

- (void)canvasViewDidBeginDrawing:(id)a3
{
  id v5 = a3;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  }
  else {
    id WeakRetained = 0;
  }
  [WeakRetained canvasControllerDidBeginDrawing:self];

  +[PKTextInputDebugStateIntrospector debugStateDidChange];
}

- (void)canvasView:(id)a3 beganStroke:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  objc_storeStrong((id *)&self->_currentStroke, a4);
  -[PKTextInputCanvasController _recordColorForStroke:]((uint64_t)self, v6);
  id v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v6 _strokeUUID];
    int v9 = 138412290;
    CGFloat v10 = v8;
    _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_INFO, "canvasViewBeganStroke: %@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)canvasView:(id)a3 endedStroke:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 _strokeUUID];
    int v10 = 138412290;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_INFO, "canvasViewEndedStroke: %@", (uint8_t *)&v10, 0xCu);
  }
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  }
  else {
    id WeakRetained = 0;
  }
  [WeakRetained canvasControllerEndedStroke:self];

  +[PKTextInputDebugStateIntrospector debugStateDidChange];
  -[PKTextInputCanvasController _clearRecordedColorForStroke:]((uint64_t)self, v5);
  currentStroke = self->_currentStroke;
  self->_currentStroke = 0;
}

- (void)canvasView:(id)a3 cancelledStroke:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id WeakRetained = 0;
  }
  int v9 = [WeakRetained canvasControllerDrawingGestureRecognizer:self];

  int v10 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v7 _strokeUUID];
    int v14 = 138412546;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "canvasViewCancelledStroke: %@, gesture: %@", (uint8_t *)&v14, 0x16u);
  }
  if (self) {
    id v12 = objc_loadWeakRetained((id *)&self->_changeObserver);
  }
  else {
    id v12 = 0;
  }
  objc_msgSend(v12, "canvasControllerDidCancelStroke:strokeAcceptanceState:", self, objc_msgSend(v9, "strokeAcceptanceState"));

  +[PKTextInputDebugStateIntrospector debugStateDidChange];
  -[PKTextInputCanvasController _clearRecordedColorForStroke:]((uint64_t)self, v7);
  currentStroke = self->_currentStroke;
  self->_currentStroke = 0;
}

- (void)canvasViewWillBeginNewStroke:(id)a3 withTouch:(id)a4 location:(CGPoint)a5
{
  id v7 = a4;
  currentStroke = self->_currentStroke;
  self->_currentStroke = 0;

  std::vector<CGPoint>::resize((uint64_t)&self->_currentStrokePoints, 0);
  std::vector<CGPoint>::reserve((void **)&self->_currentStrokePoints.__begin_, 0x400uLL);
  -[PKTextInputCanvasController _updateCanvasViewOffsetFromTouch:]((uint64_t)self, v7);
}

- (void)canvasViewDrawingMoved:(id)a3 withTouch:(id)a4
{
  id v35 = a3;
  id v6 = a4;
  id v7 = v6;
  if (self)
  {
    if (v6)
    {
      uint64_t v8 = -[PKTextInputCanvasController _containerView]((id *)&self->super.isa);
      objc_msgSend(v7, "PK_locationInView:", v8);
      CGFloat v10 = v9;
      CGFloat v12 = v11;
    }
    else
    {
      CGFloat v10 = 0.0;
      CGFloat v12 = 0.0;
    }
    value = self->_currentStrokePoints.__end_cap_.__value_;
    end = self->_currentStrokePoints.__end_;
    if (end >= value)
    {
      begin = self->_currentStrokePoints.__begin_;
      uint64_t v17 = end - begin;
      unint64_t v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 60) {
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v19 = (char *)value - (char *)begin;
      if (v19 >> 3 > v18) {
        unint64_t v18 = v19 >> 3;
      }
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v20 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = v18;
      }
      if (v20)
      {
        CGFloat v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&self->_currentStrokePoints.__end_cap_, v20);
        begin = self->_currentStrokePoints.__begin_;
        end = self->_currentStrokePoints.__end_;
      }
      else
      {
        CGFloat v21 = 0;
      }
      CGFloat v22 = (CGPoint *)&v21[16 * v17];
      CGFloat v23 = (CGPoint *)&v21[16 * v20];
      v22->double x = v10;
      v22->double y = v12;
      uint64_t v15 = v22 + 1;
      if (end != begin)
      {
        do
        {
          v22[-1] = end[-1];
          --v22;
          --end;
        }
        while (end != begin);
        begin = self->_currentStrokePoints.__begin_;
      }
      self->_currentStrokePoints.__begin_ = v22;
      self->_currentStrokePoints.__end_ = v15;
      self->_currentStrokePoints.__end_cap_.__value_ = v23;
      if (begin) {
        operator delete(begin);
      }
    }
    else
    {
      end->double x = v10;
      end->double y = v12;
      uint64_t v15 = end + 1;
    }
    self->_currentStrokePoints.__end_ = v15;
    -[PKTextInputCanvasController _updateCanvasViewOffsetFromTouch:]((uint64_t)self, v7);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
    [WeakRetained canvasControllerInProgressStrokeDidChange:self];

    double v25 = self->_currentStrokePoints.__begin_;
    id v26 = self->_currentStrokePoints.__end_ - 1;
    double v27 = 0.0;
    if (v25 < v26)
    {
      double x = v25->x;
      do
      {
        double v29 = v25[1].x;
        ++v25;
        double v27 = v27 + sqrt((v25[-1].y - v25->y) * (v25[-1].y - v25->y) + (x - v29) * (x - v29));
        double x = v29;
      }
      while (v25 < v26);
    }
    double v30 = self->__canvasView;
    [(PKTiledCanvasView *)v30 liveStrokeMaxSize];
    double v32 = v31;
    [(PKTiledCanvasView *)self->__canvasView liveStrokeMaxSize];
    double v34 = (v32 + v33) * 10.0;

    if (v27 > v34) {
      [(PKTiledCanvasView *)self->__canvasView cancelCurrentStroke];
    }
  }
}

- (void)canvasViewDidEndDrawing:(id)a3
{
  id v5 = a3;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  }
  else {
    id WeakRetained = 0;
  }
  [WeakRetained canvasControllerDidEndDrawing:self];

  +[PKTextInputDebugStateIntrospector debugStateDidChange];
}

- (void)canvasViewHasVisibleStrokesChanged:(id)a3
{
  id v3 = self;
  if (self) {
    self = (PKTextInputCanvasController *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  id v4 = self;
  [(PKTextInputCanvasController *)self canvasControllerHasVisibleStrokesChanged:v3];
}

- (void)canvasViewDidFinishAnimatingStrokes:(id)a3
{
  id v4 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_INFO, "canvasViewDidFinishAnimatingStrokes", v6, 2u);
  }

  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id WeakRetained = 0;
  }
  [WeakRetained canvasControllerCanvasDidFinishAnimatingStrokes:self];
}

- (void)canvasView:(id)a3 drawingDidChange:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 strokes];
    uint64_t v8 = +[PKDrawing _uuidDescriptionForStrokes:v7];
    int v12 = 138412290;
    char v13 = v8;
    _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_INFO, "canvasViewDrawingDidChange. Visible strokes: %@", (uint8_t *)&v12, 0xCu);
  }
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  }
  else {
    id WeakRetained = 0;
  }
  [WeakRetained canvasController:self drawingDidChange:v5];

  CGFloat v10 = [v5 strokes];
  BOOL v11 = [v10 count] == 0;

  if (v11) {
    [(NSMutableSet *)self->_recentlyRemovedStrokeIDs removeAllObjects];
  }
  +[PKTextInputDebugStateIntrospector debugStateDidChange];
}

- (id)canvasViewTouchView:(id)a3
{
  id v3 = -[PKTextInputCanvasController _containerView]((id *)&self->super.isa);

  return v3;
}

- (BOOL)canvasViewAllowSnapToShape:(id)a3
{
  return 0;
}

- (void)reportDebugStateDescription:(id)a3
{
  BOOL v11 = (void (**)(id, __CFString *, void *))a3;
  BOOL v5 = self != 0;
  if (self)
  {
    id v6 = self->__canvasView;
    if (v6)
    {
      id v3 = self->__canvasView;
      [(PKTiledCanvasView *)v3 frame];
      id v7 = NSStringFromCGRect(v13);
      goto LABEL_6;
    }
    BOOL v5 = 0;
  }
  else
  {
    id v6 = 0;
  }
  id v7 = 0;
LABEL_6:
  v11[2](v11, @"Canvas view", v7);
  if (v5)
  {
  }
  uint64_t v8 = @"No";
  if (self && self->_wantsCanvasVisible) {
    uint64_t v8 = @"Yes";
  }
  v11[2](v11, @"wantsCanvasVisible", v8);
  if (self)
  {
    if ([(PKTiledCanvasView *)self->__canvasView isDrawing]) {
      double v9 = @"Yes";
    }
    else {
      double v9 = @"No";
    }
  }
  else
  {
    double v9 = @"No";
  }
  v11[2](v11, @"isDrawing", v9);
  if (-[PKTextInputCanvasController canvasHasVisibleStrokes]((uint64_t)self)) {
    CGFloat v10 = @"Yes";
  }
  else {
    CGFloat v10 = @"No";
  }
  v11[2](v11, @"hasVisibleStrokes", v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__floatingBackgroundView, 0);
  objc_storeStrong((id *)&self->__canvasView, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_destroyWeak((id *)&self->_changeObserver);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentStroke, 0);
  objc_storeStrong((id *)&self->_strokeColorForStrokeUUID, 0);
  begin = self->_currentStrokePoints.__begin_;
  if (begin)
  {
    self->_currentStrokePoints.__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_recentlyRemovedStrokeIDs, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end