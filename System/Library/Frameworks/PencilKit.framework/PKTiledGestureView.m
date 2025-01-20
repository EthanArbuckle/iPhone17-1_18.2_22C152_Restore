@interface PKTiledGestureView
- (BOOL)_shouldForwardSelectionAtPoint:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)_shouldSelectionBeginAtPoint:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)hitTestAttachmentChrome_point:(CGPoint)a3 isStylus:(BOOL)a4 withEvent:(id)a5 hit:(id *)a6;
- (BOOL)hitTestClearSelectionIfItExists_point:(CGPoint)a3 isHover:(BOOL)a4 withEvent:(id)a5 hit:(id *)a6;
- (BOOL)hitTestDataDetector_point:(CGPoint)a3 isStylus:(BOOL)a4 withEvent:(id)a5 hit:(id *)a6;
- (BOOL)hitTestDelegateSelection_point:(CGPoint)a3 isHover:(BOOL)a4 withEvent:(id)a5 hit:(id *)a6;
- (BOOL)hitTestDragEvent_point:(CGPoint)a3 withEvent:(id)a4 hit:(id *)a5;
- (BOOL)hitTestHandleScrolling_point:(CGPoint)a3 isStylus:(BOOL)a4 isHover:(BOOL)a5;
- (BOOL)hitTestHandwritingInk_point:(CGPoint)a3 isStylus:(BOOL)a4 isHover:(BOOL)a5;
- (BOOL)hitTestInsertNewAttachments_point:(CGPoint)a3 isStylus:(BOOL)a4 isHover:(BOOL)a5 withEvent:(id)a6 hit:(id *)a7;
- (BOOL)hitTestPencilStickiness_point:(CGPoint)a3 isStylus:(BOOL)a4 isHover:(BOOL)a5 withEvent:(id)a6 hit:(id *)a7;
- (BOOL)hitTestSelectionGestures_point:(CGPoint)a3 isStylus:(BOOL)a4 isHover:(BOOL)a5 withEvent:(id)a6 hit:(id *)a7;
- (BOOL)hitTestSelectionView_point:(CGPoint)a3 withEvent:(id)a4 hit:(id *)a5;
- (PKDrawingPaletteStatistics)drawingPaletteStatistics;
- (PKTiledGestureView)init;
- (PKTiledView)tiledView;
- (id)_hitTestAttachmentMiniMenu:(CGPoint)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)hoverController;
- (id)ink;
- (id)rulerController;
- (id)scrollView;
- (id)selectionController;
- (void)_recordDrawingStatisticsForHitPoint:(CGPoint)a3 withEvent:(id)a4;
- (void)_setupPencilShadowViewIfNecessary;
- (void)hitTestUpdateEffects_point:(CGPoint)a3 isStylus:(BOOL)a4 isHover:(BOOL)a5;
- (void)setDrawingPaletteStatistics:(id)a3;
- (void)setTiledView:(id)a3;
@end

@implementation PKTiledGestureView

- (void)setTiledView:(id)a3
{
}

- (PKTiledGestureView)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKTiledGestureView;
  v2 = [(PKTiledGestureView *)&v7 init];
  uint64_t v3 = +[PKStatisticsManager sharedStatisticsManager]();
  v4 = (void *)v3;
  if (v3) {
    v5 = *(void **)(v3 + 64);
  }
  else {
    v5 = 0;
  }
  objc_storeStrong((id *)&v2->_drawingPaletteStatistics, v5);

  return v2;
}

- (id)scrollView
{
  v2 = [(PKTiledGestureView *)self tiledView];
  uint64_t v3 = [v2 scrollView];

  return v3;
}

- (id)ink
{
  v2 = [(PKTiledGestureView *)self tiledView];
  uint64_t v3 = [v2 ink];

  return v3;
}

- (id)hoverController
{
  v2 = [(PKTiledGestureView *)self tiledView];
  uint64_t v3 = [v2 hoverController];

  return v3;
}

- (void)_setupPencilShadowViewIfNecessary
{
  uint64_t v3 = [(PKTiledGestureView *)self tiledView];
  int v4 = [v3 toolShadowShouldBeActive];

  if (v4)
  {
    v5 = [(PKTiledGestureView *)self window];
    v6 = [v5 windowScene];
    +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v6);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    if (!-[PKPencilObserverInteraction isActive]((uint64_t)v17)) {
      goto LABEL_6;
    }
    objc_super v7 = [(PKTiledGestureView *)self window];
    v8 = [v7 windowScene];
    +[PKPencilShadowView createShadowViewForSceneIfNecessary:v8];

    v9 = [(PKTiledGestureView *)self window];
    v10 = [v9 windowScene];
    v11 = +[PKPencilShadowView shadowViewForScene:v10];
    v12 = [(PKTiledGestureView *)self tiledView];
    [v11 keepVisibleInTiledView:v12];

    v13 = [(PKTiledGestureView *)self window];
    v14 = [v13 windowScene];
    v15 = +[PKPencilShadowView shadowViewForScene:v14];
    v16 = [(PKTiledGestureView *)self ink];
    [v15 setInk:v16];
  }
  else
  {
    id v17 = [(PKTiledGestureView *)self window];
    v13 = [v17 windowScene];
    +[PKPencilShadowView hideShadowViewForSceneIfNecessary:v13];
  }

LABEL_6:
}

- (id)rulerController
{
  v2 = [(PKTiledGestureView *)self tiledView];
  uint64_t v3 = [v2 rulerController];

  return v3;
}

- (id)selectionController
{
  v2 = [(PKTiledGestureView *)self tiledView];
  uint64_t v3 = [v2 selectionController];

  return v3;
}

- (void)hitTestUpdateEffects_point:(CGPoint)a3 isStylus:(BOOL)a4 isHover:(BOOL)a5
{
  if (a4)
  {
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    [(PKTiledGestureView *)self bounds];
    v12.CGFloat x = x;
    v12.CGFloat y = y;
    if (CGRectContainsPoint(v13, v12))
    {
      v9 = [(PKTiledGestureView *)self tiledView];
      [v9 _setupPencilShadowViewIfNecessary];
    }
    if (!a5)
    {
      id v10 = [(PKTiledGestureView *)self hoverController];
      -[PKHoverController didReceiveNormalTouch:]((uint64_t)v10, 0);
    }
  }
}

- (BOOL)hitTestHandwritingInk_point:(CGPoint)a3 isStylus:(BOOL)a4 isHover:(BOOL)a5
{
  objc_super v7 = [(PKTiledGestureView *)self ink];
  if ([v7 _isHandwritingInk]) {
    BOOL v8 = a4 & ~a5;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)hitTestHandleScrolling_point:(CGPoint)a3 isStylus:(BOOL)a4 isHover:(BOOL)a5
{
  BOOL v5 = a4;
  objc_super v7 = [(PKTiledGestureView *)self scrollView];
  int v8 = [v7 isDecelerating];

  if (v8)
  {
    v9 = os_log_create("com.apple.pencilkit", "");
    BOOL v10 = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __int16 v26 = 0;
      v11 = "Avoided tiled view hit while decelerating";
      CGPoint v12 = (uint8_t *)&v26;
LABEL_16:
      _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_INFO, v11, v12, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  CGRect v13 = [(PKTiledGestureView *)self scrollView];
  int v14 = [v13 _isAnimatingScroll];

  if (v14)
  {
    v9 = os_log_create("com.apple.pencilkit", "");
    BOOL v10 = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __int16 v25 = 0;
      v11 = "Avoided tiled view hit while animating scroll";
      CGPoint v12 = (uint8_t *)&v25;
      goto LABEL_16;
    }
LABEL_17:

    return v10;
  }
  v15 = [(PKTiledGestureView *)self scrollView];
  int v16 = [v15 isDragging];

  if (v16)
  {
    if (v5)
    {
      id v17 = [(PKTiledGestureView *)self scrollView];
      v18 = [v17 panGestureRecognizer];
      uint64_t v19 = [v18 state];

      if (v19)
      {
        v20 = [(PKTiledGestureView *)self scrollView];
        v21 = [v20 panGestureRecognizer];
        [v21 setState:4];

        v9 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_INFO, "Cancelling the pan gesture to start drawing instead.", buf, 2u);
        }
        BOOL v10 = 0;
        goto LABEL_17;
      }
    }
    v9 = os_log_create("com.apple.pencilkit", "");
    BOOL v10 = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = 0;
      v11 = "Avoided tiled view hit while dragging";
      CGPoint v12 = (uint8_t *)&v23;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  return 0;
}

- (BOOL)hitTestSelectionView_point:(CGPoint)a3 withEvent:(id)a4 hit:(id *)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  uint64_t v10 = [(PKTiledGestureView *)self selectionController];
  v11 = (void *)v10;
  if (v10) {
    CGPoint v12 = *(void **)(v10 + 152);
  }
  else {
    CGPoint v12 = 0;
  }
  id v13 = v12;

  if (!v13) {
    goto LABEL_9;
  }
  objc_msgSend(v13, "convertPoint:fromView:", self, x, y);
  int v14 = objc_msgSend(v13, "hitTest:withEvent:", v9);
  v15 = v14;
  if (!v14)
  {
    if ([v13 isDragging])
    {
      v18 = [(PKTiledGestureView *)self tiledView];
      uint64_t v19 = objc_msgSend(v18, "hitAttachment:includeStandinAttachment:", 1, x, y);

      if (v19) {
        goto LABEL_6;
      }
    }
LABEL_9:
    BOOL v17 = 0;
    goto LABEL_10;
  }
  id v16 = v14;
LABEL_6:
  *a5 = v15;

  BOOL v17 = 1;
LABEL_10:

  return v17;
}

- (BOOL)hitTestDragEvent_point:(CGPoint)a3 withEvent:(id)a4 hit:(id *)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  NSClassFromString(&cfstr_Uidragevent.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    v11 = [(PKTiledGestureView *)self tiledView];
    CGPoint v12 = [(PKTiledGestureView *)self tiledView];
    id v13 = objc_msgSend(v11, "hitAttachment:includeStandinAttachment:expandBottomAttachment:", 0, objc_msgSend(v12, "_shouldExpandBottomAttachmentForDragAndDrop"), x, y);

    if (v13)
    {
      int v14 = [v13 attachmentContainerView];
      v15 = v14;
      if (v14 == v13)
      {
        *a5 = v13;
      }
      else
      {
        objc_msgSend(v14, "convertPoint:fromView:", self, x, y);
        id v16 = objc_msgSend(v15, "hitTest:withEvent:", v9);
        BOOL v17 = v16;
        if (!v16) {
          id v16 = v15;
        }
        *a5 = v16;
      }
    }
    else
    {
      *a5 = 0;
    }
  }
  return isKindOfClass & 1;
}

- (id)_hitTestAttachmentMiniMenu:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(PKTiledGestureView *)self tiledView];
  objc_super v7 = [v6 visibleAttachments];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        CGPoint v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "convertPoint:fromView:", self, x, y);
        uint64_t v13 = objc_msgSend(v12, "hitMiniMenu:");
        if (v13)
        {
          int v14 = (void *)v13;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  int v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)hitTestAttachmentChrome_point:(CGPoint)a3 isStylus:(BOOL)a4 withEvent:(id)a5 hit:(id *)a6
{
  BOOL v7 = a4;
  double y = a3.y;
  double x = a3.x;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  CGPoint v12 = -[PKTiledGestureView _hitTestAttachmentMiniMenu:](self, "_hitTestAttachmentMiniMenu:", x, y);
  uint64_t v13 = v12;
  if (v12)
  {
    *a6 = v12;
    BOOL v14 = 1;
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v15 = [(PKTiledGestureView *)self tiledView];
    long long v16 = [v15 visibleAttachments];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_msgSend(v21, "convertPoint:fromView:", self, x, y);
          double v23 = v22;
          double v25 = v24;
          if (objc_msgSend(v21, "hitChrome:isStylus:", v7))
          {
            *a6 = 0;
            BOOL v14 = 1;
            goto LABEL_15;
          }
          __int16 v26 = objc_msgSend(v21, "hitTest:withEvent:", v11, v23, v25);

          if (v26) {
            goto LABEL_13;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
        BOOL v14 = 0;
        if (v18) {
          continue;
        }
        break;
      }
    }
    else
    {
LABEL_13:
      BOOL v14 = 0;
    }
LABEL_15:
  }
  return v14;
}

- (BOOL)hitTestDataDetector_point:(CGPoint)a3 isStylus:(BOOL)a4 withEvent:(id)a5 hit:(id *)a6
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  if (a4)
  {
    BOOL v12 = 0;
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v13 = [(PKTiledGestureView *)self tiledView];
    BOOL v14 = [v13 visibleAttachments];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          objc_msgSend(v19, "convertPoint:fromView:", self, x, y);
          objc_msgSend(v19, "inlineViewAtPoint:");
          id v20 = (id)objc_claimAutoreleasedReturnValue();
          *a6 = v20;
          if (v20)
          {
            BOOL v12 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    BOOL v12 = 0;
LABEL_13:
  }
  return v12;
}

- (BOOL)_shouldSelectionBeginAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = [(PKTiledGestureView *)self selectionController];
  uint64_t v9 = -[PKSelectionController selectionInteraction](v8);
  int v10 = [v9 isEnabled];

  if (v10)
  {
    id v11 = [(PKTiledGestureView *)self selectionController];
    BOOL v12 = -[PKSelectionController selectionInteraction](v11);
    char v13 = objc_msgSend(v12, "_selectionInteractionShouldBeginAtPoint:forEvent:orGestureRecognizer:", v7, 0, x, y);
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)_shouldForwardSelectionAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = [(PKTiledGestureView *)self selectionController];
  uint64_t v9 = -[PKSelectionController selectionInteraction](v8);
  int v10 = [v9 isEnabled];

  if (v10)
  {
    id v11 = [(PKTiledGestureView *)self selectionController];
    BOOL v12 = -[PKSelectionController selectionInteraction](v11);
    char v13 = objc_msgSend(v12, "_selectionInteractionShouldForwardAtPoint:forEvent:", v7, x, y);
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)hitTestSelectionGestures_point:(CGPoint)a3 isStylus:(BOOL)a4 isHover:(BOOL)a5 withEvent:(id)a6 hit:(id *)a7
{
  BOOL v9 = a4;
  double y = a3.y;
  double x = a3.x;
  id v13 = a6;
  if (a5
    || !-[PKTiledGestureView _shouldSelectionBeginAtPoint:withEvent:](self, "_shouldSelectionBeginAtPoint:withEvent:", v13, x, y))
  {
    char v21 = 0;
  }
  else
  {
    uint64_t v14 = [(PKTiledGestureView *)self selectionController];
    uint64_t v15 = (void *)v14;
    if (v14) {
      uint64_t v16 = *(void **)(v14 + 160);
    }
    else {
      uint64_t v16 = 0;
    }
    id v17 = v16;

    uint64_t v18 = [(PKTiledGestureView *)self ink];
    int v19 = [v18 _isLassoInk];

    if (v19)
    {
      int v20 = 0;
    }
    else
    {
      long long v22 = [(PKTiledGestureView *)self tiledView];
      int v20 = ([v22 allowsFingerDrawing] | v9) ^ 1;
    }
    long long v23 = [(PKTiledGestureView *)self tiledView];
    long long v24 = objc_msgSend(v23, "hitAttachment:includeStandinAttachment:expandBottomAttachment:", 1, 1, x, y);
    if (v24)
    {
      long long v25 = [(PKTiledGestureView *)self selectionController];
      if (v25) {
        BOOL v26 = v25[16] != 0;
      }
      else {
        BOOL v26 = 0;
      }
    }
    else
    {
      BOOL v26 = 0;
    }

    uint64_t v27 = [(PKTiledGestureView *)self tiledView];
    long long v28 = objc_msgSend(v27, "hitAttachment:includeStandinAttachment:expandBottomAttachment:", 0, 0, x, y);

    char v21 = 0;
    if (v28) {
      int v29 = 1;
    }
    else {
      int v29 = v26;
    }
    if (v17 && v20 | v19 && v29)
    {
      objc_msgSend(v17, "convertPoint:fromView:", self, x, y);
      objc_msgSend(v17, "hitTest:withEvent:", v13);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      *a7 = v30;
      if (v30) {
        char v21 = -1;
      }
      else {
        char v21 = 0;
      }
    }
  }
  return v21 & 1;
}

- (BOOL)hitTestDelegateSelection_point:(CGPoint)a3 isHover:(BOOL)a4 withEvent:(id)a5 hit:(id *)a6
{
  double y = a3.y;
  double x = a3.x;
  id v10 = a5;
  if (!-[PKTiledGestureView _shouldForwardSelectionAtPoint:withEvent:](self, "_shouldForwardSelectionAtPoint:withEvent:", v10, x, y))goto LABEL_5; {
  id v11 = [(PKTiledGestureView *)self tiledView];
  }
  BOOL v12 = 1;
  id v13 = objc_msgSend(v11, "hitAttachment:includeStandinAttachment:", 1, x, y);

  uint64_t v14 = [v13 attachmentContainerView];
  objc_msgSend(v14, "convertPoint:fromView:", self, x, y);
  uint64_t v15 = objc_msgSend(v14, "hitTest:withEvent:", v10);
  uint64_t v16 = v15;
  if (!v15) {
    uint64_t v15 = v14;
  }
  *a6 = v15;

  id v17 = *a6;
  if (!v17) {
LABEL_5:
  }
    BOOL v12 = 0;

  return v12;
}

- (BOOL)hitTestClearSelectionIfItExists_point:(CGPoint)a3 isHover:(BOOL)a4 withEvent:(id)a5 hit:(id *)a6
{
  id v10 = [(PKTiledGestureView *)self selectionController];
  if ((-[PKSelectionController hasStrokesOrElementsSelection]((id *)v10) & 1) == 0)
  {

    return 0;
  }
  id v11 = [(PKTiledGestureView *)self tiledView];
  BOOL v12 = [v11 selectionInteraction];
  int v13 = [v12 isEnabled];

  if (!v13) {
    return 0;
  }
  if (a5 && !a4)
  {
    uint64_t v14 = [(PKTiledGestureView *)self selectionController];
    uint64_t v15 = (void *)v14;
    if (v14) {
      -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v14, 1, 0);
    }

    uint64_t v16 = [(PKTiledGestureView *)self selectionController];
    -[PKSelectionController clearExternalSelectionIfNecessary](v16);
  }
  *a6 = 0;
  return 1;
}

- (BOOL)hitTestPencilStickiness_point:(CGPoint)a3 isStylus:(BOOL)a4 isHover:(BOOL)a5 withEvent:(id)a6 hit:(id *)a7
{
  double y = a3.y;
  double x = a3.x;
  id v13 = a6;
  uint64_t v14 = [(PKTiledGestureView *)self tiledView];
  if (![v14 allowsFingerDrawing])
  {

    if (a4)
    {
      BOOL v16 = 0;
      goto LABEL_21;
    }
LABEL_7:
    id v17 = [(PKTiledGestureView *)self tiledView];
    uint64_t v18 = objc_msgSend(v17, "hitAttachment:includeStandinAttachment:", 1, x, y);

    int v19 = [v18 attachmentContainerView];
    char v20 = [v18 isAtEndOfDocument];
    if ((v20 & 1) == 0)
    {
      id v7 = [(PKTiledGestureView *)self tiledView];
      char v21 = [v7 standInAttachmentView];
      if (v18 != v21)
      {

LABEL_10:
        *a7 = 0;
LABEL_20:

        BOOL v16 = 1;
        goto LABEL_21;
      }
    }
    if (([v18 isFirstResponder] & 1) != 0 || objc_msgSend(v19, "isFirstResponder"))
    {
      if ((v20 & 1) == 0)
      {
      }
    }
    else
    {
      long long v25 = [(PKTiledGestureView *)self window];
      BOOL v26 = +[PKToolPicker isActiveToolPickerVisibleForWindow:v25];

      if (v20)
      {
        if (!v26) {
          goto LABEL_10;
        }
      }
      else
      {

        if (!v26) {
          goto LABEL_10;
        }
      }
    }
    if (v19 == v18)
    {
      *a7 = v18;
    }
    else
    {
      objc_msgSend(v19, "convertPoint:fromView:", self, x, y);
      long long v22 = objc_msgSend(v19, "hitTest:withEvent:", v13);
      long long v23 = v22;
      if (!v22) {
        long long v22 = v19;
      }
      *a7 = v22;
    }
    goto LABEL_20;
  }
  id v7 = [(PKTiledGestureView *)self tiledView];
  int v15 = [v7 isReadOnlyView];

  BOOL v16 = 0;
  if (v15 && !a4) {
    goto LABEL_7;
  }
LABEL_21:

  return v16;
}

- (BOOL)hitTestInsertNewAttachments_point:(CGPoint)a3 isStylus:(BOOL)a4 isHover:(BOOL)a5 withEvent:(id)a6 hit:(id *)a7
{
  double y = a3.y;
  double x = a3.x;
  id v12 = a6;
  if (a5)
  {
    id v13 = [(PKTiledGestureView *)self tiledView];
    uint64_t v14 = objc_msgSend(v13, "hitAttachment:includeStandinAttachment:", 1, x, y);

    if (!v14)
    {
LABEL_9:
      *a7 = 0;
      BOOL v21 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    int v15 = [(PKTiledGestureView *)self ink];
    if ([v15 _isHandwritingInk])
    {
    }
    else
    {
      BOOL v16 = [(PKTiledGestureView *)self tiledView];
      id v17 = objc_msgSend(v16, "hitAttachment:", x, y);

      if (!v17)
      {
        uint64_t v18 = [(PKTiledGestureView *)self tiledView];
        int v19 = [(PKTiledGestureView *)self scrollView];
        objc_msgSend(v19, "convertPoint:fromView:", self, x, y);
        char v20 = objc_msgSend(v18, "insertAttachmentIfInBlankSpace:");

        if ((v20 & 1) == 0) {
          goto LABEL_9;
        }
      }
    }
  }
  BOOL v21 = 0;
LABEL_10:

  return v21;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v7 || ![v7 _hidEvent])
  {
    id v12 = 0;
    goto LABEL_19;
  }
  uint64_t v9 = objc_msgSend(v8, "PK_isEventFromPencil");
  uint64_t v10 = [v8 type];
  BOOL v11 = v10 == 11;
  -[PKTiledGestureView hitTestUpdateEffects_point:isStylus:isHover:](self, "hitTestUpdateEffects_point:isStylus:isHover:", v9, v11, x, y);
  -[PKTiledGestureView _recordDrawingStatisticsForHitPoint:withEvent:](self, "_recordDrawingStatisticsForHitPoint:withEvent:", v8, x, y);
  if (!-[PKTiledGestureView hitTestHandwritingInk_point:isStylus:isHover:](self, "hitTestHandwritingInk_point:isStylus:isHover:", v9, v11, x, y)&& !-[PKTiledGestureView hitTestHandleScrolling_point:isStylus:isHover:](self, "hitTestHandleScrolling_point:isStylus:isHover:", v9, v10 == 11, x, y))
  {
    id v37 = 0;
    BOOL v14 = -[PKTiledGestureView hitTestSelectionView_point:withEvent:hit:](self, "hitTestSelectionView_point:withEvent:hit:", v8, &v37, x, y);
    int v15 = (PKTiledGestureView *)v37;
    BOOL v16 = v15;
    if (!v14)
    {
      v36 = v15;
      BOOL v17 = -[PKTiledGestureView hitTestDragEvent_point:withEvent:hit:](self, "hitTestDragEvent_point:withEvent:hit:", v8, &v36, x, y);
      id v13 = v36;

      if (v17) {
        goto LABEL_16;
      }
      v35 = v13;
      BOOL v18 = -[PKTiledGestureView hitTestAttachmentChrome_point:isStylus:withEvent:hit:](self, "hitTestAttachmentChrome_point:isStylus:withEvent:hit:", v9, v8, &v35, x, y);
      BOOL v16 = v35;

      if (!v18)
      {
        v34 = v16;
        BOOL v19 = -[PKTiledGestureView hitTestDataDetector_point:isStylus:withEvent:hit:](self, "hitTestDataDetector_point:isStylus:withEvent:hit:", v9, v8, &v34, x, y);
        id v13 = v34;

        if (v19) {
          goto LABEL_16;
        }
        uint64_t v33 = v13;
        BOOL v20 = -[PKTiledGestureView hitTestSelectionGestures_point:isStylus:isHover:withEvent:hit:](self, "hitTestSelectionGestures_point:isStylus:isHover:withEvent:hit:", v9, v10 == 11, v8, &v33, x, y);
        BOOL v16 = v33;

        if (!v20)
        {
          v32 = v16;
          BOOL v21 = -[PKTiledGestureView hitTestDelegateSelection_point:isHover:withEvent:hit:](self, "hitTestDelegateSelection_point:isHover:withEvent:hit:", v10 == 11, v8, &v32, x, y);
          id v13 = v32;

          if (!v21)
          {
            long long v31 = v13;
            BOOL v22 = -[PKTiledGestureView hitTestClearSelectionIfItExists_point:isHover:withEvent:hit:](self, "hitTestClearSelectionIfItExists_point:isHover:withEvent:hit:", v10 == 11, v8, &v31, x, y);
            BOOL v16 = v31;

            if (v22) {
              goto LABEL_14;
            }
            id v30 = v16;
            BOOL v23 = -[PKTiledGestureView hitTestPencilStickiness_point:isStylus:isHover:withEvent:hit:](self, "hitTestPencilStickiness_point:isStylus:isHover:withEvent:hit:", v9, v10 == 11, v8, &v30, x, y);
            id v13 = v30;

            if (!v23)
            {
              long long v25 = [(PKTiledGestureView *)self tiledView];
              char v26 = [v25 isReadOnlyView];

              if (v26)
              {
                id v12 = 0;
                goto LABEL_18;
              }
              int v29 = v13;
              BOOL v27 = -[PKTiledGestureView hitTestInsertNewAttachments_point:isStylus:isHover:withEvent:hit:](self, "hitTestInsertNewAttachments_point:isStylus:isHover:withEvent:hit:", v9, v10 == 11, v8, &v29, x, y);
              long long v28 = v29;

              if (v27) {
                BOOL v16 = v28;
              }
              else {
                BOOL v16 = self;
              }
              id v13 = v28;
              goto LABEL_17;
            }
          }
LABEL_16:
          BOOL v16 = v13;
          goto LABEL_17;
        }
      }
    }
LABEL_14:
    id v13 = v16;
LABEL_17:
    id v12 = v16;
    goto LABEL_18;
  }
  id v12 = 0;
  id v13 = 0;
LABEL_18:

LABEL_19:

  return v12;
}

- (void)_recordDrawingStatisticsForHitPoint:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v14 = a4;
  if (objc_msgSend(v14, "PK_isEventFromPencil"))
  {
    id v7 = [(PKTiledGestureView *)self tiledView];
    uint64_t v8 = objc_msgSend(v7, "hitAttachment:includeStandinAttachment:expandBottomAttachment:", 1, 0, x, y);

    uint64_t v9 = [(PKTiledGestureView *)self ink];
    int v10 = [v9 _isHandwritingInk];

    if (v10 && v8)
    {
      BOOL v11 = [(PKTiledGestureView *)self drawingPaletteStatistics];
      [v14 timestamp];
      objc_msgSend(v11, "recordHandwritingToolUsedOverDrawingAttachmentWithTimestamp:");
LABEL_8:

      goto LABEL_9;
    }
    id v12 = [(PKTiledGestureView *)self ink];
    int v13 = [v12 _isStrokeGeneratingInk];

    if (v13 && !v8)
    {
      BOOL v11 = [(PKTiledGestureView *)self drawingPaletteStatistics];
      [v14 timestamp];
      objc_msgSend(v11, "recordInkingToolUsedOverNonDrawingAttachmentWithTimestamp:");
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (PKTiledView)tiledView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);

  return (PKTiledView *)WeakRetained;
}

- (PKDrawingPaletteStatistics)drawingPaletteStatistics
{
  return self->_drawingPaletteStatistics;
}

- (void)setDrawingPaletteStatistics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingPaletteStatistics, 0);

  objc_destroyWeak((id *)&self->_tiledView);
}

@end