@interface GKSwipeToEditStateMachine
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (GKCancelSwipeToEditGestureRecognizer)editModeCancelRecognizer;
- (GKCollectionViewCell)editingCell;
- (GKCollectionViewDataSource)gkDataSource;
- (GKSwipeToEditStateMachine)initWithCollectionView:(id)a3;
- (NSIndexPath)trackedIndexPath;
- (UICollectionView)collectionView;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (_UIDynamicAnimation)openAnimation;
- (double)startTrackingX;
- (double)xPositionForTranslation:(CGPoint)a3;
- (void)didEnterAnimatingOpenState;
- (void)didEnterAnimatingShutState;
- (void)didEnterEditingState;
- (void)didEnterNothingState;
- (void)didExitAnimatingOpenState;
- (void)didExitEditingState;
- (void)didExitNothingState;
- (void)handleCancelTap:(id)a3;
- (void)handlePan:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditModeCancelRecognizer:(id)a3;
- (void)setEditingCell:(id)a3;
- (void)setGkDataSource:(id)a3;
- (void)setOpenAnimation:(id)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setStartTrackingX:(double)a3;
- (void)shutActionPaneForEditingCellAnimated:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation GKSwipeToEditStateMachine

- (GKSwipeToEditStateMachine)initWithCollectionView:(id)a3
{
  v50[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)GKSwipeToEditStateMachine;
  v5 = [(_GKStateMachine *)&v41 init];
  v6 = v5;
  if (v5)
  {
    [(GKSwipeToEditStateMachine *)v5 setCollectionView:v4];
    v7 = [v4 dataSource];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v9 = [v4 dataSource];
      [(GKSwipeToEditStateMachine *)v6 setGkDataSource:v9];
    }
    v32 = v4;
    [(_GKStateMachine *)v6 setCurrentState:@"NothingState"];
    v48 = @"TrackingState";
    v49[0] = @"NothingState";
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
    v50[0] = v31;
    v49[1] = @"TrackingState";
    v47[0] = @"AnimatingOpenState";
    v47[1] = @"AnimatingShutState";
    v47[2] = @"TrackingState";
    v47[3] = @"NothingState";
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];
    v50[1] = v10;
    v49[2] = @"AnimatingOpenState";
    v46[0] = @"EditingState";
    v46[1] = @"AnimatingShutState";
    v46[2] = @"TrackingState";
    v46[3] = @"NothingState";
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
    v50[2] = v11;
    v49[3] = @"AnimatingShutState";
    v45 = @"NothingState";
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    v50[3] = v12;
    v49[4] = @"EditingState";
    v44[0] = @"TrackingState";
    v44[1] = @"AnimatingShutState";
    v44[2] = @"NothingState";
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
    v50[4] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:5];
    [(_GKStateMachine *)v6 setValidTransitions:v14];

    v15 = [[GKCancelSwipeToEditGestureRecognizer alloc] initWithTarget:v6 action:sel_handleCancelTap_];
    editModeCancelRecognizer = v6->_editModeCancelRecognizer;
    v6->_editModeCancelRecognizer = v15;

    [(GKCancelSwipeToEditGestureRecognizer *)v6->_editModeCancelRecognizer setNumberOfTapsRequired:1];
    [(GKCancelSwipeToEditGestureRecognizer *)v6->_editModeCancelRecognizer setCancelsTouchesInView:1];
    [(GKCancelSwipeToEditGestureRecognizer *)v6->_editModeCancelRecognizer setDelegate:v6];
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v6 action:sel_handlePan_];
    panGestureRecognizer = v6->_panGestureRecognizer;
    v6->_panGestureRecognizer = (UIPanGestureRecognizer *)v17;

    [(UIPanGestureRecognizer *)v6->_panGestureRecognizer setDelegate:v6];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v19 = [(UICollectionView *)v6->_collectionView gestureRecognizers];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v38;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v38 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v37 + 1) + 8 * v23);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v24 requireGestureRecognizerToFail:v6->_panGestureRecognizer];
          }
          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v21);
    }

    id v4 = v32;
    [v32 addGestureRecognizer:v6->_panGestureRecognizer];
    v25 = [(UICollectionView *)v6->_collectionView gestureRecognizers];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v34;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(v25);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * v29++) requireGestureRecognizerToFail:v6->_editModeCancelRecognizer];
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v27);
    }
    [(UICollectionView *)v6->_collectionView addGestureRecognizer:v6->_editModeCancelRecognizer];
  }
  return v6;
}

- (NSIndexPath)trackedIndexPath
{
  return [(UICollectionView *)self->_collectionView indexPathForCell:self->_editingCell];
}

- (void)setDelegate:(id)a3
{
  v3 = NSString;
  id v4 = [NSString stringWithFormat:@"you're not the boss of me"];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewController+GKSwipeToEdit.m"];
  id v6 = [v5 lastPathComponent];
  id v7 = [v3 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v4, "-[GKSwipeToEditStateMachine setDelegate:]", objc_msgSend(v6, "UTF8String"), 112];

  [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v7 format];
}

- (void)setEditingCell:(id)a3
{
}

- (double)xPositionForTranslation:(CGPoint)a3
{
  return (double)((int)(a3.x + self->_startTrackingX) & ((int)(a3.x + self->_startTrackingX) >> 31));
}

- (void)handlePan:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  if (v5 == 4) {
    goto LABEL_13;
  }
  if (v5 != 3)
  {
    if (v5 == 2)
    {
      [v4 translationInView:self->_editingCell];
      -[GKSwipeToEditStateMachine xPositionForTranslation:](self, "xPositionForTranslation:");
      -[GKCollectionViewCell setEditingContentOriginX:](self->_editingCell, "setEditingContentOriginX:");
      [(_GKStateMachine *)self setCurrentState:@"TrackingState"];
    }
    goto LABEL_14;
  }
  [v4 velocityInView:self->_editingCell];
  double v7 = v6;
  [(GKCollectionViewCell *)self->_editingCell editingContentOriginX];
  double v9 = v8;
  [(GKCollectionViewCell *)self->_editingCell contentViewOriginXWhileEditing];
  if (v7 >= 0.0 || ((double v11 = v10, v7 >= -100.0) ? (v12 = v9 > v10) : (v12 = 0), v12))
  {
LABEL_13:
    [(GKSwipeToEditStateMachine *)self shutActionPaneForEditingCellAnimated:1];
    goto LABEL_14;
  }
  double v13 = *MEMORY[0x1E4FB31B8];
  id v14 = objc_alloc(MEMORY[0x1E4FB20E0]);
  v15 = (void *)[v14 initWithValue:v9 velocity:v7 unitSize:*MEMORY[0x1E4FB31C0]];
  [v15 setFriction:v13];
  [v15 _setUsesNSTimer:1];
  v16 = [MEMORY[0x1E4FB20D0] lowerBoundary:1 ofType:v11];
  [v15 addActiveValue:v16];
  if (v9 > v11)
  {
    uint64_t v17 = [MEMORY[0x1E4FB20D0] upperBoundary:0 ofType:v11];
    [v15 addActiveValue:v17];
  }
  [(_GKStateMachine *)self setCurrentState:@"AnimatingOpenState"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __39__GKSwipeToEditStateMachine_handlePan___block_invoke;
  v19[3] = &unk_1E5F63AC8;
  v19[4] = self;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __39__GKSwipeToEditStateMachine_handlePan___block_invoke_2;
  v18[3] = &unk_1E5F63198;
  v18[4] = self;
  [v15 runWithValueApplier:v19 completion:v18];
  [(GKSwipeToEditStateMachine *)self setOpenAnimation:v15];

LABEL_14:
}

uint64_t __39__GKSwipeToEditStateMachine_handlePan___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 80) staticContentView];
  [v5 frame];

  double v6 = 0.0;
  if (a3 <= 0.0) {
    double v6 = a3;
  }
  double v7 = *(void **)(*(void *)(a1 + 32) + 80);

  return [v7 setEditingContentOriginX:v6];
}

uint64_t __39__GKSwipeToEditStateMachine_handlePan___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) setCurrentState:@"EditingState"];
  }
  return result;
}

- (void)handleCancelTap:(id)a3
{
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UIPanGestureRecognizer *)a3;
  uint64_t v5 = v4;
  if (self->_panGestureRecognizer == v4)
  {
    double v9 = [(_GKStateMachine *)self currentState];
    if (([v9 isEqualToString:@"NothingState"] & 1) == 0)
    {
      double v10 = [(_GKStateMachine *)self currentState];
      if (![v10 isEqualToString:@"EditingState"])
      {
        v18 = [(_GKStateMachine *)self currentState];
        char v19 = [v18 isEqualToString:@"AnimatingOpenState"];

        if ((v19 & 1) == 0) {
          goto LABEL_21;
        }
LABEL_10:
        collectionView = self->_collectionView;
        [(UIPanGestureRecognizer *)self->_panGestureRecognizer locationInView:collectionView];
        double v6 = -[UICollectionView indexPathForItemAtPoint:](collectionView, "indexPathForItemAtPoint:");
        [(UIPanGestureRecognizer *)self->_panGestureRecognizer velocityInView:self->_collectionView];
        double v13 = v12;
        double v15 = v14;
        v16 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v6];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v17 = [(_GKStateMachine *)self currentState];
          if ([v17 isEqualToString:@"NothingState"])
          {
          }
          else
          {
            editingCell = self->_editingCell;

            if (v16 != editingCell) {
              goto LABEL_20;
            }
          }
          uint64_t v21 = [(GKCollectionViewCell *)v16 editActions];
          uint64_t v22 = [v21 count];

          double v23 = fabs(v15);
          double v24 = fabs(v13);
          if (v22) {
            BOOL v25 = v23 < v24;
          }
          else {
            BOOL v25 = 0;
          }
          if (v25)
          {
            [(GKCollectionViewCell *)v16 editingContentOriginX];
            self->_startTrackingX = v29;
            [(GKSwipeToEditStateMachine *)self setEditingCell:v16];
            [(_GKStateMachine *)self setCurrentState:@"TrackingState"];

            goto LABEL_25;
          }
        }
LABEL_20:

        goto LABEL_21;
      }
    }
    goto LABEL_10;
  }
  if ((UIPanGestureRecognizer *)self->_editModeCancelRecognizer != v4)
  {
LABEL_26:
    BOOL v28 = 1;
    goto LABEL_27;
  }
  double v6 = [(_GKStateMachine *)self currentState];
  if ([v6 isEqualToString:@"EditingState"])
  {
LABEL_25:

    goto LABEL_26;
  }
  double v7 = [(_GKStateMachine *)self currentState];
  char v8 = [v7 isEqualToString:@"AnimatingOpenState"];

  if (v8) {
    goto LABEL_26;
  }
LABEL_21:
  uint64_t v26 = [(_GKStateMachine *)self currentState];
  char v27 = [v26 isEqualToString:@"NothingState"];

  if ((v27 & 1) == 0) {
    [(GKSwipeToEditStateMachine *)self shutActionPaneForEditingCellAnimated:1];
  }
  BOOL v28 = 0;
LABEL_27:

  return v28;
}

- (void)didEnterEditingState
{
  [(GKCollectionViewCell *)self->_editingCell setUserInteractionEnabled:1];
  editingCell = self->_editingCell;

  [(GKCollectionViewCell *)editingCell setUserInteractionEnabledForEditing:1];
}

- (void)didExitEditingState
{
}

- (void)didExitNothingState
{
  [(UICollectionView *)self->_collectionView setScrollEnabled:0];
  editingCell = self->_editingCell;

  [(GKCollectionViewCell *)editingCell beginEditing];
}

- (void)didEnterNothingState
{
  [(UICollectionView *)self->_collectionView setScrollEnabled:1];
  self->_startTrackingX = 0.0;
  [(GKCollectionViewCell *)self->_editingCell setUserInteractionEnabled:1];
  [(GKCollectionViewCell *)self->_editingCell finishEditing];

  [(GKSwipeToEditStateMachine *)self setEditingCell:0];
}

- (void)didEnterAnimatingShutState
{
  [(GKCollectionViewCell *)self->_editingCell setUserInteractionEnabled:0];
  editingCell = self->_editingCell;

  [(GKCollectionViewCell *)editingCell animateOutSwipeToEditAccessories];
}

- (void)didEnterAnimatingOpenState
{
  [(GKCollectionViewCell *)self->_editingCell setUserInteractionEnabled:0];
  editingCell = self->_editingCell;
  editModeCancelRecognizer = self->_editModeCancelRecognizer;

  [(GKCancelSwipeToEditGestureRecognizer *)editModeCancelRecognizer setCurrentEditingCell:editingCell];
}

- (void)didExitAnimatingOpenState
{
  [(_UIDynamicAnimation *)self->_openAnimation stop];

  [(GKSwipeToEditStateMachine *)self setOpenAnimation:0];
}

- (void)shutActionPaneForEditingCellAnimated:(BOOL)a3
{
  if (a3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__GKSwipeToEditStateMachine_shutActionPaneForEditingCellAnimated___block_invoke;
    block[3] = &unk_1E5F62EB0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    gk_dispatch_debounce();
  }
}

uint64_t __66__GKSwipeToEditStateMachine_shutActionPaneForEditingCellAnimated___block_invoke()
{
  return gk_dispatch_debounce();
}

void __66__GKSwipeToEditStateMachine_shutActionPaneForEditingCellAnimated___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) currentState];
  char v3 = [v2 isEqualToString:@"NothingState"];

  if ((v3 & 1) == 0)
  {
    [*(id *)(a1 + 32) setCurrentState:@"AnimatingShutState"];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 80);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__GKSwipeToEditStateMachine_shutActionPaneForEditingCellAnimated___block_invoke_3;
    v6[3] = &unk_1E5F63198;
    v6[4] = v4;
    [v5 shutActionPaneAnimated:1 completion:v6];
  }
}

uint64_t __66__GKSwipeToEditStateMachine_shutActionPaneForEditingCellAnimated___block_invoke_3(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) setCurrentState:@"NothingState"];
  }
  return result;
}

uint64_t __66__GKSwipeToEditStateMachine_shutActionPaneForEditingCellAnimated___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) shutActionPaneAnimated:0 completion:0];
  v2 = *(void **)(a1 + 32);

  return [v2 setCurrentState:@"NothingState"];
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4 = [(_GKStateMachine *)self currentState];
  char v5 = [v4 isEqualToString:@"NothingState"];

  if ((v5 & 1) == 0)
  {
    [(GKSwipeToEditStateMachine *)self shutActionPaneForEditingCellAnimated:0];
  }
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (GKCollectionViewDataSource)gkDataSource
{
  return self->_gkDataSource;
}

- (void)setGkDataSource:(id)a3
{
}

- (GKCancelSwipeToEditGestureRecognizer)editModeCancelRecognizer
{
  return self->_editModeCancelRecognizer;
}

- (void)setEditModeCancelRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (GKCollectionViewCell)editingCell
{
  return self->_editingCell;
}

- (double)startTrackingX
{
  return self->_startTrackingX;
}

- (void)setStartTrackingX:(double)a3
{
  self->_startTrackingX = a3;
}

- (_UIDynamicAnimation)openAnimation
{
  return self->_openAnimation;
}

- (void)setOpenAnimation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openAnimation, 0);
  objc_storeStrong((id *)&self->_editingCell, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_editModeCancelRecognizer, 0);
  objc_storeStrong((id *)&self->_gkDataSource, 0);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end