@interface PKSpaceInsertionController
- (BOOL)didMoveStrokes;
- (BOOL)isCurrentlyAddingSpace;
- (NSOrderedSet)externalElements;
- (PKDrawing)drawing;
- (PKSelectionController)selectionController;
- (PKSpaceInsertionController)initWithSelectionController:(id)a3;
- (PKStroke)lassoStroke;
- (double)_initalBufferBetweenLollipops;
- (double)offsetInStrokeSpaceFromViewOffset:(double)a3 inDrawing:(id)a4;
- (id)_visibleStrokesOnPage:(id)a3;
- (void)_addSpacingViewsWithFrame:(CGRect)a3;
- (void)_blitStrokesToViewForSpaceInsertionType:(unint64_t)a3 withCompletion:(id)a4;
- (void)_didEndCreatingSpace;
- (void)_didGrabInsertSpaceAffordance:(id)a3;
- (void)_dismissHandlesAndReselectExistingSelectionInDrawing:(id)a3;
- (void)_dismissSpacingResizeHandles;
- (void)_dragLollipop:(id)a3;
- (void)_layoutViewsIfNecessary;
- (void)_makeSpaceWithOffset:(double)a3 spaceInsertionType:(unint64_t)a4;
- (void)_panGestureDidBegin:(id)a3;
- (void)_panGestureDidCancelOrFail:(id)a3;
- (void)_panGestureDidChange:(id)a3;
- (void)_panGestureDidEnd:(id)a3;
- (void)_sortStrokesAboveOrBelowWithStrokesAbove:(id)a3 strokesBelow:(id)a4;
- (void)_temporarilyShiftStrokesWithOffset:(double)a3 spaceInsertionType:(unint64_t)a4;
- (void)commitSpacingResize;
- (void)didBeginCreatingSpaceWithLassoStroke:(id)a3 drawing:(id)a4 addDefaultSpace:(BOOL)a5 strokesAbove:(id)a6 strokesBelow:(id)a7 externalElements:(id)a8;
- (void)didScroll:(CGPoint)a3;
- (void)fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:(id)a3 inDrawing:(id)a4 completion:(id)a5;
- (void)initTopAndBottomSelectionIfNecessary;
- (void)insertDefaultSpace:(double)a3;
- (void)invalidateCachedStrokes;
- (void)projectPath:(CGPath *)a3 toEndOfFrame:(CGRect)a4;
- (void)setDrawing:(id)a3;
- (void)setExternalElements:(id)a3;
- (void)setIsCurrentlyAddingSpace:(BOOL)a3;
- (void)setLassoStroke:(id)a3;
- (void)shiftStrokesWithOffset:(double)a3;
@end

@implementation PKSpaceInsertionController

- (BOOL)isCurrentlyAddingSpace
{
  return self->_isCurrentlyAddingSpace;
}

- (PKSpaceInsertionController)initWithSelectionController:(id)a3
{
  objc_initWeak(&location, a3);
  v7.receiver = self;
  v7.super_class = (Class)PKSpaceInsertionController;
  v4 = [(PKSpaceInsertionController *)&v7 init];
  if (v4)
  {
    id v5 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v4->_selectionController, v5);

    v4->_topHandleRemovesWhitespace = 1;
  }
  objc_destroyWeak(&location);
  return v4;
}

- (void)didScroll:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PKSpaceInsertionView *)self->_topInsertionView origin];
  double v7 = x + v6;
  double v9 = y + v8;
  [(PKSpaceInsertionView *)self->_topInsertionView bounds];
  -[PKSpaceInsertionView setFrame:](self->_topInsertionView, "setFrame:", v7, v9);
  [(PKSpaceInsertionView *)self->_bottomInsertionView origin];
  double v11 = x + v10;
  double v13 = y + v12;
  [(PKSpaceInsertionView *)self->_bottomInsertionView bounds];
  bottomInsertionView = self->_bottomInsertionView;

  -[PKSpaceInsertionView setFrame:](bottomInsertionView, "setFrame:", v11, v13);
}

- (double)_initalBufferBetweenLollipops
{
  return 0.0;
}

- (void)invalidateCachedStrokes
{
  cachedStrokeSelection = self->_cachedStrokeSelection;
  self->_cachedStrokeSelection = 0;

  cachedStrokesBelow = self->_cachedStrokesBelow;
  self->_cachedStrokesBelow = 0;

  cachedStrokesAbove = self->_cachedStrokesAbove;
  self->_cachedStrokesAbove = 0;

  self->_shouldUseCachedStrokes = 0;
}

- (void)_dragLollipop:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    [(PKSpaceInsertionController *)self _panGestureDidBegin:v4];
  }
  else if ([v4 state] == 2)
  {
    [(PKSpaceInsertionController *)self _panGestureDidChange:v4];
  }
  else if ([v4 state] == 3)
  {
    [(PKSpaceInsertionController *)self _panGestureDidEnd:v4];
  }
  else if ([v4 state] == 4 || objc_msgSend(v4, "state") == 5)
  {
    [(PKSpaceInsertionController *)self _panGestureDidCancelOrFail:v4];
  }
}

- (void)_didGrabInsertSpaceAffordance:(id)a3
{
  id v4 = a3;
  id v5 = [(PKSpaceInsertionController *)self selectionController];
  double v6 = -[PKSelectionController topView](v5);
  [v4 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = [(PKSpaceInsertionController *)self selectionController];
  double v12 = -[PKSelectionController _drawingForSelectionRect:]((uint64_t)v11, v8 + -60.0, v10 + -60.0, 120.0, 120.0);

  if ([v4 state] == 1)
  {
    double v13 = +[PKStatisticsManager sharedStatisticsManager]();
    -[PKStatisticsManager recordInsertSpaceWithType:]((uint64_t)v13, 3);

    uint64_t v14 = [(PKSpaceInsertionController *)self selectionController];
    v15 = (void *)v14;
    if (v14) {
      v16 = *(void **)(v14 + 152);
    }
    else {
      v16 = 0;
    }
    id v17 = v16;
    [v17 frame];
    CGFloat MinY = CGRectGetMinY(v39);

    uint64_t v19 = [(PKSpaceInsertionController *)self selectionController];
    v20 = (void *)v19;
    if (v19) {
      v21 = *(void **)(v19 + 128);
    }
    else {
      v21 = 0;
    }
    objc_storeStrong((id *)&self->_strokeSelectionBeforeInsertingSpace, v21);

    uint64_t v22 = [(PKSpaceInsertionController *)self selectionController];
    v23 = (void *)v22;
    if (v22) {
      v24 = *(void **)(v22 + 152);
    }
    else {
      v24 = 0;
    }
    id v25 = v24;
    self->_selectionTypeBeforeInsertingSpace = [v25 selectionType];

    v26 = [(PKStrokeSelection *)self->_cachedStrokeSelection strokeIdentifiers];
    v27 = [(PKStrokeSelection *)self->_strokeSelectionBeforeInsertingSpace strokeIdentifiers];
    if ([v26 isEqual:v27] && self->_cachedStrokesBelow)
    {
      cachedStrokesAbove = self->_cachedStrokesAbove;

      if (cachedStrokesAbove)
      {
        BOOL v29 = 1;
LABEL_16:
        self->_shouldUseCachedStrokes = v29;
        self->_insertSpaceAffordancePanDidEnd = 0;
        v32 = [(PKSpaceInsertionController *)self selectionController];
        -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)v32, 0, 0);

        objc_initWeak(&location, self);
        v33 = [(PKStrokeSelection *)self->_strokeSelectionBeforeInsertingSpace strokes];
        v34 = [v33 array];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __60__PKSpaceInsertionController__didGrabInsertSpaceAffordance___block_invoke;
        v35[3] = &unk_1E64CB1C0;
        objc_copyWeak(v37, &location);
        v35[4] = self;
        v37[1] = 0;
        v37[2] = *(id *)&MinY;
        id v36 = v4;
        [(PKSpaceInsertionController *)self fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:v34 inDrawing:v12 completion:v35];

        objc_destroyWeak(v37);
        objc_destroyWeak(&location);
        goto LABEL_22;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_cachedStrokeSelection, self->_strokeSelectionBeforeInsertingSpace);
    v30 = self->_cachedStrokesAbove;
    self->_cachedStrokesAbove = 0;

    cachedStrokesBelow = self->_cachedStrokesBelow;
    self->_cachedStrokesBelow = 0;

    BOOL v29 = 0;
    goto LABEL_16;
  }
  if ([v4 state] == 2)
  {
    [(PKSpaceInsertionController *)self _panGestureDidChange:v4];
  }
  else if ([v4 state] == 3)
  {
    objc_storeStrong((id *)&self->_cachedStrokesAbove, self->_strokesAbove);
    objc_storeStrong((id *)&self->_cachedStrokesBelow, self->_strokesBelow);
    [(PKSpaceInsertionController *)self _panGestureDidEnd:v4];
    [(PKSpaceInsertionController *)self _dismissHandlesAndReselectExistingSelectionInDrawing:v12];
    self->_insertSpaceAffordancePanDidEnd = 1;
  }
  else if ([v4 state] == 5 || objc_msgSend(v4, "state") == 4)
  {
    [(PKSpaceInsertionController *)self _panGestureDidCancelOrFail:v4];
    [(PKSpaceInsertionController *)self _dismissHandlesAndReselectExistingSelectionInDrawing:v12];
  }
LABEL_22:
}

void __60__PKSpaceInsertionController__didGrabInsertSpaceAffordance___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained[177])
  {
    double v7 = [*(id *)(a1 + 32) selectionController];
    [(PKSelectionController *)v7 insertSpaceAtPoint:v5 addDefaultSpace:v8 strokesAbove:*(double *)(a1 + 56) strokesBelow:*(double *)(a1 + 64)];

    [*(id *)(a1 + 32) _panGestureDidBegin:*(void *)(a1 + 40)];
  }
}

- (void)_dismissHandlesAndReselectExistingSelectionInDrawing:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [(PKSpaceInsertionController *)self selectionController];
  id v5 = (void *)v4;
  if (v4) {
    [*(id *)(v4 + 144) commitSpacingResize];
  }

  double v6 = [(PKStrokeSelection *)self->_strokeSelectionBeforeInsertingSpace strokes];
  double v7 = [v6 array];
  id v8 = +[PKDrawing visibleStrokesFromStrokes:v7 inDrawing:v14];

  double v9 = [(PKSpaceInsertionController *)self selectionController];
  -[PKSelectionController _refreshExternalElementsInStrokeSelection:](v9, self->_strokeSelectionBeforeInsertingSpace);

  double v10 = [(PKStrokeSelection *)self->_strokeSelectionBeforeInsertingSpace externalElements];
  double v11 = [(PKSpaceInsertionController *)self selectionController];
  double v12 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v8];
  -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:](v11, v12, v10, self->_selectionTypeBeforeInsertingSpace, v14);

  strokeSelectionBeforeInsertingSpace = self->_strokeSelectionBeforeInsertingSpace;
  self->_strokeSelectionBeforeInsertingSpace = 0;

  self->_shouldUseCachedStrokes = 0;
}

- (void)_panGestureDidBegin:(id)a3
{
  id v14 = (UIPanGestureRecognizer *)a3;
  uint64_t v4 = 32;
  if (self->_dragBottomLollipopGR == v14) {
    uint64_t v4 = 40;
  }
  id v5 = *(id *)((char *)&self->super.isa + v4);
  [v5 frame];
  self->_beginDragLocation.double x = v6;
  self->_beginDragLocation.double y = v7;
  [v5 setIsDragging:1];
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  double v9 = WeakRetained;
  if (WeakRetained) {
    id v10 = objc_loadWeakRetained(WeakRetained + 15);
  }
  else {
    id v10 = 0;
  }
  double v11 = [(PKDrawing *)self->_drawing uuid];
  double v12 = [v10 attachmentForUUID:v11];

  if (v12)
  {
    double v13 = [(PKSpaceInsertionController *)self selectionController];
    -[PKSelectionController _willBeginInsertSpaceInAttachment:](v13, v12);
  }
  -[PKSpaceInsertionController _blitStrokesToViewForSpaceInsertionType:withCompletion:](self, "_blitStrokesToViewForSpaceInsertionType:withCompletion:", [v5 insertionType], 0);
}

- (void)_panGestureDidChange:(id)a3
{
  uint64_t v4 = (UIPanGestureRecognizer *)a3;
  p_selectionController = &self->_selectionController;
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  CGFloat v7 = -[PKSelectionController topView](WeakRetained);

  [(PKSpaceInsertionController *)self _initalBufferBetweenLollipops];
  double v9 = v8;
  dragBottomLollipopGR = self->_dragBottomLollipopGR;
  if (dragBottomLollipopGR == v4)
  {
    double v11 = self->_bottomInsertionView;
    p_topInsertionView = &self->_topInsertionView;
    [(PKSpaceInsertionView *)self->_topInsertionView frame];
    double v14 = v9 + v15;
  }
  else
  {
    double v11 = self->_topInsertionView;
    p_topInsertionView = &self->_bottomInsertionView;
    [(PKSpaceInsertionView *)self->_bottomInsertionView frame];
    double v14 = v13 - v9;
  }
  v16 = *p_topInsertionView;
  [(UIPanGestureRecognizer *)v4 translationInView:v7];
  double v18 = v17 + self->_beginDragLocation.y;
  double v19 = fmin(v18, v14);
  double v20 = fmax(v18, v14);
  if (dragBottomLollipopGR == v4) {
    double v19 = v20;
  }
  if (self->_topHandleRemovesWhitespace) {
    double v21 = v18;
  }
  else {
    double v21 = v19;
  }
  [(PKSpaceInsertionView *)v11 origin];
  double v23 = v22;
  [(PKSpaceInsertionView *)v11 frame];
  double v25 = v24;
  [(PKSpaceInsertionView *)v11 frame];
  -[PKSpaceInsertionView setFrame:](v11, "setFrame:", v23, v21, v25);
  double y = self->_beginDragLocation.y;
  [(PKSpaceInsertionView *)v16 origin];
  double v28 = v27;
  [(PKSpaceInsertionController *)self _initalBufferBetweenLollipops];
  double v30 = v29;
  [(PKSpaceInsertionView *)v16 frame];
  double v32 = v31;
  [(PKSpaceInsertionView *)v16 frame];
  -[PKSpaceInsertionView setFrame:](v16, "setFrame:", v28, v21 + v30, v32);
  double v33 = v21 - y;
  [(PKSpaceInsertionController *)self _temporarilyShiftStrokesWithOffset:[(PKSpaceInsertionView *)v11 insertionType] spaceInsertionType:v33];
  v34 = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  v35 = v34;
  if (v34) {
    id v36 = objc_loadWeakRetained(v34 + 15);
  }
  else {
    id v36 = 0;
  }
  v37 = [(PKDrawing *)self->_drawing uuid];
  v38 = [v36 attachmentForUUID:v37];

  if (v38)
  {
    [v38 drawingTransform];
    double v39 = v33 / sqrt(v45 * v45 + v44 * v44);
    v40 = (id *)objc_loadWeakRetained((id *)p_selectionController);
    v41 = v40;
    if (v40) {
      id v42 = objc_loadWeakRetained(v40 + 15);
    }
    else {
      id v42 = 0;
    }
    [v42 _transientlyUpdateHeightOfAttachment:v38 delta:v39];

    v43 = (id *)objc_loadWeakRetained((id *)p_selectionController);
    -[PKSelectionController _didMoveInsertSpace:inAttachment:](v43, v38, v39);
  }
}

- (void)_panGestureDidEnd:(id)a3
{
  double v32 = (UIPanGestureRecognizer *)a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  id v5 = -[PKSelectionController topView](WeakRetained);

  [(PKSpaceInsertionController *)self _initalBufferBetweenLollipops];
  double v7 = v6;
  dragBottomLollipopGR = self->_dragBottomLollipopGR;
  if (dragBottomLollipopGR == v32)
  {
    double v9 = self->_bottomInsertionView;
    p_topInsertionView = &self->_topInsertionView;
    [(PKSpaceInsertionView *)self->_topInsertionView frame];
    double v12 = v7 + v13;
  }
  else
  {
    double v9 = self->_topInsertionView;
    p_topInsertionView = &self->_bottomInsertionView;
    [(PKSpaceInsertionView *)self->_bottomInsertionView frame];
    double v12 = v11 - v7;
  }
  double v14 = *p_topInsertionView;
  [(UIPanGestureRecognizer *)v32 translationInView:v5];
  double v16 = v15;
  [(PKSpaceInsertionView *)v9 setIsDragging:0];
  double v17 = v16 + self->_beginDragLocation.y;
  double v18 = fmin(v17, v12);
  double v19 = fmax(v17, v12);
  if (dragBottomLollipopGR == v32) {
    double v18 = v19;
  }
  if (self->_topHandleRemovesWhitespace) {
    double v20 = v16 + self->_beginDragLocation.y;
  }
  else {
    double v20 = v18;
  }
  [(PKSpaceInsertionView *)v9 origin];
  double v22 = v21;
  [(PKSpaceInsertionView *)v9 frame];
  double v24 = v23;
  [(PKSpaceInsertionView *)v9 frame];
  -[PKSpaceInsertionView setFrame:](v9, "setFrame:", v22, v20, v24);
  double y = self->_beginDragLocation.y;
  [(PKSpaceInsertionView *)v14 origin];
  double v27 = v26;
  [(PKSpaceInsertionView *)v14 frame];
  double v29 = v28;
  [(PKSpaceInsertionView *)v14 frame];
  -[PKSpaceInsertionView setFrame:](v14, "setFrame:", v27, v20, v29);
  double v30 = +[PKStatisticsManager sharedStatisticsManager]();
  double v31 = v20 - y;
  -[PKStatisticsManager recordInsertSpaceAddWhitespace:]((uint64_t)v30, v31 > 0.0);

  [(PKSpaceInsertionController *)self _makeSpaceWithOffset:[(PKSpaceInsertionView *)v9 insertionType] spaceInsertionType:v31];
}

- (void)_panGestureDidCancelOrFail:(id)a3
{
}

- (void)commitSpacingResize
{
  [(PKSpaceInsertionController *)self _didEndCreatingSpace];
  [(PKSpaceInsertionController *)self _dismissSpacingResizeHandles];
  id v3 = [(PKSpaceInsertionController *)self selectionController];
  [v3 didEndModifyDrawing];
}

- (void)_dismissSpacingResizeHandles
{
  self->_isCurrentlyAddingSpace = 0;
}

- (void)_layoutViewsIfNecessary
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  uint64_t v4 = -[PKSelectionController topView](WeakRetained);
  [v4 frame];
  double v6 = v5;

  +[PKDrawingAdjustmentKnob leftMargin];
  double v8 = v7;
  topInsertionView = self->_topInsertionView;
  [(PKSpaceInsertionView *)topInsertionView origin];
  double v11 = v10;
  double v13 = v12;
  double v14 = v6 - v8 + -28.0;
  [(PKSpaceInsertionView *)self->_topInsertionView bounds];
  -[PKSpaceInsertionView setFrame:](topInsertionView, "setFrame:", v11, v13, v14);
  bottomInsertionView = self->_bottomInsertionView;
  [(PKSpaceInsertionView *)bottomInsertionView origin];
  double v17 = v16;
  double v19 = v18;
  [(PKSpaceInsertionView *)self->_bottomInsertionView bounds];
  -[PKSpaceInsertionView setFrame:](bottomInsertionView, "setFrame:", v17, v19, v14);
  [(PKSpaceInsertionView *)self->_topInsertionView setNeedsDisplay];
  double v20 = self->_bottomInsertionView;

  [(PKSpaceInsertionView *)v20 setNeedsDisplay];
}

- (void)didBeginCreatingSpaceWithLassoStroke:(id)a3 drawing:(id)a4 addDefaultSpace:(BOOL)a5 strokesAbove:(id)a6 strokesBelow:(id)a7 externalElements:(id)a8
{
  BOOL v45 = a5;
  id v47 = a3;
  id v14 = a4;
  id v49 = a6;
  id v48 = a7;
  id v46 = a8;
  objc_storeStrong((id *)&self->_drawing, a4);
  objc_storeStrong((id *)&self->_lassoStroke, a3);
  objc_storeStrong((id *)&self->_externalElements, a8);
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  double v16 = WeakRetained;
  if (WeakRetained) {
    id v17 = objc_loadWeakRetained(WeakRetained + 15);
  }
  else {
    id v17 = 0;
  }
  double v18 = [v14 uuid];
  double v19 = [v17 attachmentForUUID:v18];

  double v20 = [(PKSpaceInsertionController *)self selectionController];
  [v20 didBeginModifyDrawing];

  if (v19)
  {
    double v21 = [(PKSpaceInsertionController *)self selectionController];
    -[PKSelectionController _willBeginInsertSpaceInAttachment:](v21, v19);
  }
  if (self->_shouldUseCachedStrokes)
  {
    double v22 = (void *)MEMORY[0x1E4F1CA70];
    double v23 = [(NSOrderedSet *)self->_cachedStrokesAbove array];
    double v24 = +[PKDrawing visibleStrokesFromStrokes:v23 inDrawing:v14];
    double v25 = [v22 orderedSetWithArray:v24];
    strokesAbove = self->_strokesAbove;
    self->_strokesAbove = v25;

    double v27 = (void *)MEMORY[0x1E4F1CA70];
    double v28 = [(NSOrderedSet *)self->_cachedStrokesBelow array];
    double v29 = +[PKDrawing visibleStrokesFromStrokes:v28 inDrawing:v14];
    double v30 = [v27 orderedSetWithArray:v29];
    strokesBelow = self->_strokesBelow;
    self->_strokesBelow = v30;
  }
  else
  {
    [(PKSpaceInsertionController *)self _sortStrokesAboveOrBelowWithStrokesAbove:v49 strokesBelow:v48];
  }
  if ([(NSMutableOrderedSet *)self->_strokesBelow count]
    || [(NSOrderedSet *)self->_externalElements count])
  {
    self->_isCurrentlyAddingSpace = 1;
    double v32 = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
    double v33 = -[PKSelectionController topView](v32);
    [v33 frame];
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;

    +[PKDrawingAdjustmentKnob leftMargin];
    double v41 = v40;
    id v42 = [(PKSpaceInsertionController *)self selectionController];
    v43 = -[PKSelectionController topView](v42);
    if ([v43 effectiveUserInterfaceLayoutDirection]) {
      double v44 = 28.0;
    }
    else {
      double v44 = v41;
    }

    -[PKSpaceInsertionController _addSpacingViewsWithFrame:](self, "_addSpacingViewsWithFrame:", v44, v35, v37 - v41 + -28.0, v39);
  }
  else
  {
    [(PKSpaceInsertionController *)self commitSpacingResize];
  }
  if (v45) {
    [(PKSpaceInsertionController *)self insertDefaultSpace:100.0];
  }
}

- (void)_addSpacingViewsWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_didMoveStrokes = 0;
  [(PKSpaceInsertionController *)self _initalBufferBetweenLollipops];
  double v9 = v8;
  double v10 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", x, y, width, height);
  tapToDismissView = self->_tapToDismissView;
  self->_tapToDismissView = v10;

  v66 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_commitSpacingResize];
  [(UIView *)self->_tapToDismissView addGestureRecognizer:v66];
  double v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel_commitSpacingResize];
  [v12 setMinimumPressDuration:0.0];
  [(UIView *)self->_tapToDismissView addGestureRecognizer:v12];
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  id v14 = -[PKSelectionController topView](WeakRetained);
  [v14 addSubview:self->_tapToDismissView];

  double v15 = [(PKStroke *)self->_lassoStroke _newPathRepresentation];
  double v63 = height;
  id v16 = objc_loadWeakRetained((id *)&self->_selectionController);
  [(PKSelectionController *)(uint64_t)v16 _selectionDrawingTransformForDrawing:(uint64_t)&v71];
  CGFloat a = v71.a;

  memset(&v71, 0, sizeof(v71));
  double v65 = a;
  CGAffineTransformMakeScale(&v71, a, a);
  memset(&transform, 0, sizeof(transform));
  [(PKStroke *)self->_lassoStroke _bounds];
  double v19 = v18;
  [(PKStroke *)self->_lassoStroke _bounds];
  CGAffineTransformMakeTranslation(&transform, -v19, -v20);
  CGAffineTransform t1 = transform;
  CGAffineTransform t2 = v71;
  CGAffineTransformConcat(&v69, &t1, &t2);
  CGAffineTransform transform = v69;
  double v21 = CGPathCreateMutableCopyByTransformingPath(v15, &transform);
  double v22 = [(PKStroke *)self->_lassoStroke path];
  uint64_t v23 = [v22 count];

  double v24 = [(PKStroke *)self->_lassoStroke path];
  double v25 = [v24 pointAtIndex:0];
  double v26 = v9;
  [v25 location];
  double v28 = v27;
  double v30 = v29;

  double v31 = [(PKStroke *)self->_lassoStroke path];
  double v32 = [v31 pointAtIndex:v23 - 1];
  [v32 location];
  double v34 = v33;
  double v36 = v35;

  double v64 = v26;
  if (v28 >= v34)
  {
    double v37 = [(PKSpaceInsertionController *)self selectionController];
    double v38 = x;
    double v39 = width;
    double v40 = -[PKSelectionController topView](v37);
    if ([v40 effectiveUserInterfaceLayoutDirection])
    {
      double v41 = v30;
    }
    else
    {
      double v28 = v34;
      double v41 = v36;
    }
  }
  else
  {
    -[PKSpaceInsertionController projectPath:toEndOfFrame:](self, "projectPath:toEndOfFrame:", v21, x, y, width, v63);
    double v37 = [(PKSpaceInsertionController *)self selectionController];
    double v38 = x;
    double v39 = width;
    double v40 = -[PKSelectionController topView](v37);
    if ([v40 effectiveUserInterfaceLayoutDirection])
    {
      double v28 = v34;
      double v41 = v36;
    }
    else
    {
      double v41 = v30;
    }
  }

  id v42 = objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController _selectionOffsetForDrawing:]((uint64_t)v42, self->_drawing);
  double v44 = v43;

  [(PKStroke *)self->_lassoStroke _bounds];
  double v46 = v45;
  double v47 = *MEMORY[0x1E4F1DAD8];
  double v48 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if ([(PKStroke *)self->_lassoStroke _pointsCount])
  {
    double v47 = transform.tx + v41 * transform.c + transform.a * v28;
    double v48 = transform.ty + v41 * transform.d + transform.b * v28;
  }
  BoundingBodouble x = CGPathGetBoundingBox(v21);
  double v49 = v44 + v65 * v46;
  CGFloat v50 = BoundingBox.size.height + 30.0;
  v51 = -[PKSpaceInsertionView initWithFrame:insertionType:path:handleLocation:scale:]([PKSpaceInsertionView alloc], "initWithFrame:insertionType:path:handleLocation:scale:", 0, v21, v38, v49 - v64 * 0.5 + -15.0, v39, BoundingBox.size.height + 30.0, v47, v48, v65);
  topInsertionView = self->_topInsertionView;
  self->_topInsertionView = v51;

  v53 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__dragLollipop_];
  dragTopLollipopGR = self->_dragTopLollipopGR;
  self->_dragTopLollipopGR = v53;

  [(PKSpaceInsertionView *)self->_topInsertionView addGestureRecognizer:self->_dragTopLollipopGR];
  v55 = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  v56 = -[PKSelectionController topView](v55);
  [v56 addSubview:self->_topInsertionView];

  v57 = -[PKSpaceInsertionView initWithFrame:insertionType:path:handleLocation:scale:]([PKSpaceInsertionView alloc], "initWithFrame:insertionType:path:handleLocation:scale:", 1, v21, v38, v64 * 0.5 + v49 + -15.0, v39, v50, v47, v48, v65);
  bottomInsertionView = self->_bottomInsertionView;
  self->_bottomInsertionView = v57;

  v59 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__dragLollipop_];
  dragBottomLollipopGR = self->_dragBottomLollipopGR;
  self->_dragBottomLollipopGR = v59;

  [(PKSpaceInsertionView *)self->_bottomInsertionView addGestureRecognizer:self->_dragBottomLollipopGR];
  v61 = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  v62 = -[PKSelectionController topView](v61);
  [v62 addSubview:self->_bottomInsertionView];

  CGPathRelease(v15);
  CGPathRelease(v21);
}

- (void)projectPath:(CGPath *)a3 toEndOfFrame:(CGRect)a4
{
  double width = a4.size.width;
  CGPoint CurrentPoint = CGPathGetCurrentPoint(a3);
  __p = 0;
  double v18 = 0;
  uint64_t v19 = 0;
  PKPointsFromPath(a3, (const void **)&__p, 1.79769313e308, 0.0);
  unint64_t v7 = (v18 - (unsigned char *)__p) >> 4;
  if ((int)v7 >= 100) {
    uint64_t v8 = 100;
  }
  else {
    uint64_t v8 = v7;
  }
  if ((int)v8 < 3) {
    goto LABEL_15;
  }
  if (v7 <= 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = (v18 - (unsigned char *)__p) >> 4;
  }
  if (v9 - 1 <= (unint64_t)(v8 - 3)) {
    std::vector<double>::__throw_out_of_range[abi:ne180100]();
  }
  int v10 = 0;
  uint64_t v11 = v8 - 2;
  double v12 = (double *)((char *)__p + 16 * v7 - 32);
  double v13 = 0.0;
  double y = CurrentPoint.y;
  double x = CurrentPoint.x;
  do
  {
    double v16 = x - *v12;
    if (v16 > 1.0)
    {
      double v13 = v13 + (y - v12[1]) / v16;
      ++v10;
      double y = v12[1];
      double x = *v12;
    }
    v12 -= 2;
    --v11;
  }
  while (v11);
  if (v10 <= 0) {
LABEL_15:
  }
    CGPathAddLineToPoint(a3, 0, width, CurrentPoint.y);
  else {
    CGPathAddQuadCurveToPoint(a3, 0, width * 0.5 + CurrentPoint.x * 0.5, CurrentPoint.y + (width * 0.5 + CurrentPoint.x * 0.5 - CurrentPoint.x) * (v13 / (double)v10), width, (CurrentPoint.y + CurrentPoint.y + (width * 0.5 + CurrentPoint.x * 0.5 - CurrentPoint.x) * (v13 / (double)v10))* 0.5);
  }
  if (__p)
  {
    double v18 = __p;
    operator delete(__p);
  }
}

- (void)_didEndCreatingSpace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController _resetSelectedStrokeStateForRenderer]((uint64_t)WeakRetained);

  [(NSMutableOrderedSet *)self->_strokesAbove removeAllObjects];
  [(NSMutableOrderedSet *)self->_strokesBelow removeAllObjects];
  strokesAbove = self->_strokesAbove;
  self->_strokesAbove = 0;

  strokesBelow = self->_strokesBelow;
  self->_strokesBelow = 0;
}

- (void)_sortStrokesAboveOrBelowWithStrokesAbove:(id)a3 strokesBelow:(id)a4
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v90 = a3;
  id v6 = a4;
  unint64_t v7 = [MEMORY[0x1E4F1CA70] orderedSet];
  strokesAbove = self->_strokesAbove;
  p_strokesAbove = &self->_strokesAbove;
  self->_strokesAbove = v7;

  uint64_t v9 = [MEMORY[0x1E4F1CA70] orderedSet];
  v92 = self;
  strokesBelow = self->_strokesBelow;
  p_strokesBelow = &self->_strokesBelow;
  self->_strokesBelow = v9;

  if (v90)
  {
    uint64_t v11 = *p_strokesAbove;
    double v12 = [v90 array];
    double v13 = +[PKDrawing visibleStrokesFromStrokes:v12 inDrawing:self->_drawing];
    [(NSMutableOrderedSet *)v11 addObjectsFromArray:v13];
  }
  if (v6)
  {
    id v14 = *p_strokesBelow;
    double v15 = [v6 array];
    double v16 = +[PKDrawing visibleStrokesFromStrokes:v15 inDrawing:self->_drawing];
    [(NSMutableOrderedSet *)v14 addObjectsFromArray:v16];
  }
  id location = (id *)&self->_selectionController;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  double v18 = -[PKSelectionController topView](WeakRetained);
  [v18 frame];
  CGFloat v85 = v20;
  CGFloat v86 = v19;
  CGFloat v83 = v22;
  CGFloat v84 = v21;

  [(PKStroke *)self->_lassoStroke _bounds];
  CGFloat v81 = v24;
  CGFloat v82 = v23;
  double v88 = v25;
  CGFloat rect = v26;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id obj = [(PKDrawing *)self->_drawing strokes];
  uint64_t v27 = [obj countByEnumeratingWithState:&v93 objects:v97 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v94 != v28) {
          objc_enumerationMutation(obj);
        }
        double v30 = *(void **)(*((void *)&v93 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v30, p_strokesAbove) & 1) == 0
          && ([v90 containsObject:v30] & 1) == 0)
        {
          double v31 = [v30 ink];
          double v32 = [v31 identifier];
          if ([v32 isEqual:@"com.apple.ink.lasso"])
          {
          }
          else
          {
            double v33 = [v30 ink];
            double v34 = [v33 identifier];
            char v35 = [v34 isEqual:@"com.apple.ink.generationtool"];

            if ((v35 & 1) == 0)
            {
              double v36 = (id *)objc_loadWeakRetained(location);
              double v37 = -[PKSelectionController topView](v36);
              [v37 frame];
              CGFloat v39 = v38;
              CGFloat v41 = v40;
              CGFloat v43 = v42;
              CGFloat v45 = v44;

              id v46 = objc_loadWeakRetained(location);
              v99.origin.double x = v39;
              v99.origin.double y = v41;
              v99.size.double width = v43;
              v99.size.double height = v45;
              double MaxX = CGRectGetMaxX(v99);
              v100.origin.double x = v39;
              v100.origin.double y = v41;
              v100.size.double width = v43;
              v100.size.double height = v45;
              double MaxY = CGRectGetMaxY(v100);
              *(void *)&double v49 = [(PKSelectionController *)(uint64_t)v46 _pointInStrokeSpace:MaxX inDrawing:MaxY].n128_u64[0];
              double v51 = v50;

              id v52 = objc_loadWeakRetained(location);
              v101.origin.double y = v85;
              v101.origin.double x = v86;
              v101.size.double height = v83;
              v101.size.double width = v84;
              double v53 = CGRectGetMaxY(v101);
              [(PKSelectionController *)(uint64_t)v52 _pointInStrokeSpace:0.0 inDrawing:v53];
              double v55 = v54;

              [v30 _bounds];
              CGFloat v57 = v56;
              double v59 = v58;
              CGFloat v61 = v60;
              CGFloat v63 = v62;
              v102.size.double width = v81;
              v102.origin.double x = v82;
              v102.origin.double y = v88;
              v102.size.double height = rect;
              double v64 = CGRectGetMaxY(v102);
              v103.origin.double x = v57;
              v103.origin.double y = v59;
              v103.size.double width = v61;
              v103.size.double height = v63;
              double v65 = CGRectGetMaxY(v103);
              v66 = (id *)p_strokesBelow;
              if (v59 <= v64 && (v66 = (id *)p_strokesAbove, v65 >= v88))
              {
                v104.origin.double x = v57;
                v104.origin.double y = v59;
                v104.size.double width = v61;
                v104.size.double height = v63;
                int v67 = 0;
                int MinX = (int)CGRectGetMinX(v104);
                double v69 = 0.0;
                while (1)
                {
                  v105.origin.double x = v57;
                  v105.origin.double y = v59;
                  v105.size.double width = v61;
                  v105.size.double height = v63;
                  if (CGRectGetMaxX(v105) <= (double)MinX) {
                    break;
                  }
                  -[PKStroke intersectionFromPoint:toPoint:](v92->_lassoStroke, "intersectionFromPoint:toPoint:", (double)MinX, 0.0, (double)MinX, v55);
                  double v69 = v69 + v70;
                  ++v67;
                  ++MinX;
                }
                if (v67)
                {
                  double v71 = v69 / (double)v67;
                }
                else
                {
                  [(PKStroke *)v92->_lassoStroke _locationAtIndex:[(PKStroke *)v92->_lassoStroke _pointsCount] - 1];
                  double v71 = v72;
                }
                [v30 _bounds];
                DKDPercentRectInsideRect(v73, v74, v75, v76, 0.0, v71, v49, v51 - v71);
                v77 = (id *)p_strokesAbove;
                if (v78 > 0.5) {
                  v77 = (id *)p_strokesBelow;
                }
                [*v77 addObject:v30];
              }
              else
              {
                objc_msgSend(*v66, "addObject:", v30, v65);
              }
            }
          }
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v93 objects:v97 count:16];
    }
    while (v27);
  }
}

- (void)_makeSpaceWithOffset:(double)a3 spaceInsertionType:(unint64_t)a4
{
  [(PKSpaceInsertionController *)self initTopAndBottomSelectionIfNecessary];
  unint64_t v7 = self->_drawing;
  if (a4 == 1)
  {
    uint64_t v8 = 96;
  }
  else
  {
    uint64_t v8 = 96;
    if (!self->_topHandleRemovesWhitespace) {
      uint64_t v8 = 104;
    }
  }
  id v9 = *(id *)((char *)&self->super.isa + v8);
  [(PKSpaceInsertionController *)self offsetInStrokeSpaceFromViewOffset:v7 inDrawing:a3];
  CGFloat v11 = v10;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __70__PKSpaceInsertionController__makeSpaceWithOffset_spaceInsertionType___block_invoke;
  v27[3] = &unk_1E64C5368;
  v27[4] = self;
  double v13 = -[PKSelectionController applySpaceInsertionWithStrokeSelection:inDrawing:offset:completion:]((uint64_t)WeakRetained, v9, v7, v27, v11);

  self->_didMoveStrokes = 1;
  if (a4 == 1 || self->_topHandleRemovesWhitespace)
  {
    id v14 = [MEMORY[0x1E4F1CA70] orderedSetWithOrderedSet:v13];
    strokesBelow = self->_strokesBelow;
    self->_strokesBelow = v14;
  }
  else
  {
    double v26 = [MEMORY[0x1E4F1CA70] orderedSetWithOrderedSet:v13];
    strokesBelow = self->_strokesAbove;
    self->_strokesAbove = v26;
  }

  bottomStrokeSelection = self->_bottomStrokeSelection;
  self->_bottomStrokeSelection = 0;

  topStrokeSelection = self->_topStrokeSelection;
  self->_topStrokeSelection = 0;

  double v18 = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  double v19 = v18;
  if (v18) {
    id v20 = objc_loadWeakRetained(v18 + 15);
  }
  else {
    id v20 = 0;
  }
  double v21 = [(PKDrawing *)self->_drawing uuid];
  double v22 = [v20 attachmentForUUID:v21];

  if (v22)
  {
    double v23 = [(PKSpaceInsertionController *)self selectionController];
    double v24 = [(PKSpaceInsertionController *)self externalElements];
    -[PKSelectionController _didEndDraggingExternalElements:inAttachment:](v23, v24, v22);

    double v25 = [(PKSpaceInsertionController *)self selectionController];
    -[PKSelectionController _didEndInsertSpaceInAttachment:](v25, v22);
  }
}

void __70__PKSpaceInsertionController__makeSpaceWithOffset_spaceInsertionType___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 120) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 120);
  *(void *)(v2 + 120) = 0;

  [*(id *)(*(void *)(a1 + 32) + 112) removeFromSuperview];
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(void **)(v4 + 112);
  *(void *)(v4 + 112) = 0;
}

- (void)_temporarilyShiftStrokesWithOffset:(double)a3 spaceInsertionType:(unint64_t)a4
{
  if (a4 == 1)
  {
    uint64_t v6 = 120;
  }
  else
  {
    uint64_t v6 = 120;
    if (!self->_topHandleRemovesWhitespace) {
      uint64_t v6 = 112;
    }
  }
  id v7 = *(id *)((char *)&self->super.isa + v6);
  double x = self->_initialViewLocation.x;
  double y = self->_initialViewLocation.y;
  [v7 frame];
  objc_msgSend(v7, "setFrame:", x, y + a3);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  CGFloat v11 = WeakRetained;
  if (WeakRetained) {
    id v12 = objc_loadWeakRetained(WeakRetained + 15);
  }
  else {
    id v12 = 0;
  }
  double v13 = [(PKDrawing *)self->_drawing uuid];
  id v14 = [v12 attachmentForUUID:v13];

  if (v14)
  {
    [v14 drawingTransform];
    CGAffineTransformInvert(&v26, &v25);
    double b = v26.b;
    double d = v26.d;
    tdouble y = v26.ty;
    double v18 = [(PKSpaceInsertionController *)self selectionController];
    double v19 = ty + d * a3 + b * 0.0;
    -[PKSelectionController _didMoveInsertSpace:inAttachment:](v18, v14, v19);

    id v20 = [(PKSpaceInsertionController *)self selectionController];
    double v21 = [(PKSpaceInsertionController *)self externalElements];
    long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v23.CGFloat a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v23.c = v22;
    *(_OWORD *)&v23.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransformTranslate(&v24, &v23, 0.0, v19);
    -[PKSelectionController _didDragExternalElements:withTransform:inAttachment:](v20, v21, &v24, v14);
  }
}

- (void)insertDefaultSpace:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__PKSpaceInsertionController_insertDefaultSpace___block_invoke;
  v3[3] = &unk_1E64C73F8;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  [(PKSpaceInsertionController *)self _blitStrokesToViewForSpaceInsertionType:1 withCompletion:v3];
}

uint64_t __49__PKSpaceInsertionController_insertDefaultSpace___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) shiftStrokesWithOffset:*(double *)(a1 + 40)];
}

- (void)shiftStrokesWithOffset:(double)a3
{
  [(PKSpaceInsertionView *)self->_bottomInsertionView frame];
  uint64_t v6 = v5;
  uint64_t v27 = v8;
  uint64_t v28 = v7;
  uint64_t v10 = v9;
  [(PKSpaceInsertionView *)self->_topInsertionView frame];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  id v20 = WeakRetained;
  if (WeakRetained) {
    id v21 = objc_loadWeakRetained(WeakRetained + 15);
  }
  else {
    id v21 = 0;
  }

  long long v22 = [(PKDrawing *)self->_drawing uuid];
  CGAffineTransform v23 = [v21 attachmentForUUID:v22];

  CGAffineTransform v24 = (void *)MEMORY[0x1E4FB1EB0];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __53__PKSpaceInsertionController_shiftStrokesWithOffset___block_invoke;
  v30[3] = &unk_1E64CB1E8;
  v30[4] = self;
  double v33 = a3;
  uint64_t v34 = v6;
  uint64_t v35 = v28;
  uint64_t v36 = v27;
  uint64_t v37 = v10;
  uint64_t v38 = v12;
  uint64_t v39 = v14;
  uint64_t v40 = v16;
  uint64_t v41 = v18;
  id v25 = v21;
  id v31 = v25;
  id v32 = v23;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __53__PKSpaceInsertionController_shiftStrokesWithOffset___block_invoke_2;
  v29[3] = &unk_1E64CB210;
  v29[4] = self;
  *(double *)&v29[5] = a3;
  id v26 = v23;
  [v24 animateWithDuration:v30 animations:v29 completion:0.75];
}

uint64_t __53__PKSpaceInsertionController_shiftStrokesWithOffset___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _temporarilyShiftStrokesWithOffset:1 spaceInsertionType:*(double *)(a1 + 56)];
  double v2 = *(double *)(a1 + 72) + *(double *)(a1 + 56);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setFrame:", *(double *)(a1 + 64), v2, *(double *)(a1 + 80), *(double *)(a1 + 88));
  double v3 = *(double *)(a1 + 96);
  [*(id *)(a1 + 32) _initalBufferBetweenLollipops];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setFrame:", v3, v2 + v4, *(double *)(a1 + 112), *(double *)(a1 + 120));
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  double v7 = *(double *)(a1 + 56);

  return [v5 _transientlyUpdateHeightOfAttachment:v6 delta:v7];
}

uint64_t __53__PKSpaceInsertionController_shiftStrokesWithOffset___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _makeSpaceWithOffset:1 spaceInsertionType:*(double *)(a1 + 40)];
}

- (void)initTopAndBottomSelectionIfNecessary
{
  memset(&v14, 0, sizeof(v14));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  [(PKSelectionController *)(uint64_t)WeakRetained _selectionDrawingTransformForDrawing:(uint64_t)&v14];

  if (!self->_bottomStrokeSelection)
  {
    double v4 = [[PKStrokeSelection alloc] initWithStrokes:self->_strokesBelow lassoStroke:self->_lassoStroke drawing:self->_drawing];
    bottomStrokeSelection = self->_bottomStrokeSelection;
    self->_bottomStrokeSelection = v4;
  }
  if (!self->_topStrokeSelection)
  {
    uint64_t v6 = [[PKStrokeSelection alloc] initWithStrokes:self->_strokesAbove lassoStroke:self->_lassoStroke drawing:self->_drawing];
    topStrokeSelection = self->_topStrokeSelection;
    self->_topStrokeSelection = v6;
  }
  if (!self->_bottomImageView)
  {
    [(PKStrokeSelection *)self->_bottomStrokeSelection boundsWithoutLasso];
    CGAffineTransform v13 = v14;
    CGRect v16 = CGRectApplyAffineTransform(v15, &v13);
    uint64_t v8 = -[PKImageView initWithFrame:]([PKImageView alloc], "initWithFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
    bottomImageView = self->_bottomImageView;
    self->_bottomImageView = v8;
  }
  if (!self->_topImageView)
  {
    [(PKStrokeSelection *)self->_topStrokeSelection boundsWithoutLasso];
    CGAffineTransform v12 = v14;
    CGRect v18 = CGRectApplyAffineTransform(v17, &v12);
    uint64_t v10 = -[PKImageView initWithFrame:]([PKImageView alloc], "initWithFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
    topImageView = self->_topImageView;
    self->_topImageView = v10;
  }
}

- (void)_blitStrokesToViewForSpaceInsertionType:(unint64_t)a3 withCompletion:(id)a4
{
  uint64_t v6 = (void (**)(void))a4;
  [(PKSpaceInsertionController *)self initTopAndBottomSelectionIfNecessary];
  if (a3 == 1)
  {
    uint64_t v7 = 120;
    uint64_t v8 = 96;
  }
  else
  {
    uint64_t v8 = 96;
    if (self->_topHandleRemovesWhitespace)
    {
      uint64_t v7 = 120;
    }
    else
    {
      uint64_t v8 = 104;
      uint64_t v7 = 112;
    }
  }
  id v9 = *(id *)((char *)&self->super.isa + v8);
  id v10 = *(id *)((char *)&self->super.isa + v7);
  [v10 setAlpha:1.0];
  uint64_t v11 = [v9 strokes];
  uint64_t v12 = [v11 count];

  if (!v12)
  {
    BOOL v16 = 1;
    if (!v6) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  CGAffineTransform v13 = [v9 strokes];
  CGAffineTransform v14 = [(PKSpaceInsertionController *)self _visibleStrokesOnPage:v13];

  CGFloat v45 = [[PKStrokeSelection alloc] initWithStrokes:v14 lassoStroke:self->_lassoStroke drawing:self->_drawing];
  uint64_t v15 = [v14 count];
  BOOL v16 = v15 == 0;
  if (v15)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
    double v18 = -[PKSelectionController _selectionOffsetForDrawing:]((uint64_t)WeakRetained, self->_drawing);
    double v20 = v19;

    memset(&v47, 0, sizeof(v47));
    id v21 = objc_loadWeakRetained((id *)&self->_selectionController);
    [(PKSelectionController *)(uint64_t)v21 _selectionDrawingTransformForDrawing:(uint64_t)&v47];

    [(PKStrokeSelection *)v45 boundsWithoutLasso];
    CGAffineTransform v46 = v47;
    CGRect v49 = CGRectApplyAffineTransform(v48, &v46);
    self->_initialViewLocation.double x = v18 + v49.origin.x;
    self->_initialViewLocation.double y = v20 + v49.origin.y;
    objc_msgSend(v10, "setFrame:");
    long long v22 = [(PKSpaceInsertionController *)self drawing];
    id v23 = objc_alloc((Class)objc_opt_class());
    CGAffineTransform v24 = [v14 array];
    id v25 = [(PKSpaceInsertionController *)self drawing];
    double v44 = (void *)[v23 initWithStrokes:v24 fromDrawing:v25];

    id v26 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v26 scale];
    double v28 = v27;

    [(PKStrokeSelection *)v45 boundsWithoutLasso];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    uint64_t v37 = [(PKSpaceInsertionController *)self selectionController];
    uint64_t v38 = (void *)v37;
    if (v37) {
      id v39 = objc_loadWeakRetained((id *)(v37 + 120));
    }
    else {
      id v39 = 0;
    }
    uint64_t v40 = [v39 _sixChannelBlendingIsActive];

    objc_msgSend(v10, "setupWithDrawing:imageSize:scale:strokeSpaceClipRect:sixChannel:", v44, v40, v34, v36, v28, v30, v32, v34, v36);
    uint64_t v41 = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
    double v42 = -[PKSelectionController topView](v41);
    [v42 addSubview:v10];

    id v43 = objc_loadWeakRetained((id *)&self->_selectionController);
    -[PKSelectionController hideStrokes:inDrawing:]((uint64_t)v43, v9, self->_drawing);

    if (v6) {
      v6[2](v6);
    }

    BOOL v16 = 0;
  }

  if (v6)
  {
LABEL_16:
    if (v16) {
      v6[2](v6);
    }
  }
LABEL_18:
}

- (id)_visibleStrokesOnPage:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  uint64_t v6 = -[PKSelectionController _visibleStrokesWithinExtendedBounds:forDrawing:]((uint64_t)WeakRetained, v4, self->_drawing);

  return v6;
}

- (double)offsetInStrokeSpaceFromViewOffset:(double)a3 inDrawing:(id)a4
{
  id v6 = a4;
  double x = self->_beginDragLocation.x;
  double y = self->_beginDragLocation.y;
  p_selectionController = &self->_selectionController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  [(PKSelectionController *)(uint64_t)WeakRetained _pointInStrokeSpace:x inDrawing:y];
  double v12 = v11;

  id v13 = objc_loadWeakRetained((id *)p_selectionController);
  [(PKSelectionController *)(uint64_t)v13 _pointInStrokeSpace:x + 0.0 inDrawing:y + a3];
  double v15 = v14;

  return v15 - v12;
}

- (void)fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:(id)a3 inDrawing:(id)a4 completion:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(PKSpaceInsertionController *)self selectionController];
  double v11 = (void *)v10;
  if (v10) {
    id WeakRetained = objc_loadWeakRetained((id *)(v10 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  id v13 = [v8 uuid];
  double v14 = [WeakRetained attachmentForUUID:v13];

  if (v14) {
    [v14 fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:v15 completion:v9];
  }
}

- (void)setIsCurrentlyAddingSpace:(BOOL)a3
{
  self->_isCurrentlyAddingSpace = a3;
}

- (PKStroke)lassoStroke
{
  return self->_lassoStroke;
}

- (void)setLassoStroke:(id)a3
{
}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (void)setDrawing:(id)a3
{
}

- (PKSelectionController)selectionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);

  return (PKSelectionController *)WeakRetained;
}

- (BOOL)didMoveStrokes
{
  return self->_didMoveStrokes;
}

- (NSOrderedSet)externalElements
{
  return self->_externalElements;
}

- (void)setExternalElements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalElements, 0);
  objc_destroyWeak((id *)&self->_selectionController);
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_lassoStroke, 0);
  objc_storeStrong((id *)&self->_cachedStrokesAbove, 0);
  objc_storeStrong((id *)&self->_cachedStrokesBelow, 0);
  objc_storeStrong((id *)&self->_cachedStrokeSelection, 0);
  objc_storeStrong((id *)&self->_strokeSelectionBeforeInsertingSpace, 0);
  objc_storeStrong((id *)&self->_bottomImageView, 0);
  objc_storeStrong((id *)&self->_topImageView, 0);
  objc_storeStrong((id *)&self->_topStrokeSelection, 0);
  objc_storeStrong((id *)&self->_bottomStrokeSelection, 0);
  objc_storeStrong((id *)&self->_dragBottomLollipopGR, 0);
  objc_storeStrong((id *)&self->_dragTopLollipopGR, 0);
  objc_storeStrong((id *)&self->_bottomInsertionView, 0);
  objc_storeStrong((id *)&self->_topInsertionView, 0);
  objc_storeStrong((id *)&self->_tapToDismissView, 0);
  objc_storeStrong((id *)&self->_strokesAbove, 0);

  objc_storeStrong((id *)&self->_strokesBelow, 0);
}

@end