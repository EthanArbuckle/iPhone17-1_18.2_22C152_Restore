@interface PKSelectionInteraction
- (BOOL)_didCancelSelection;
- (BOOL)_didLongPressExternalElementAtLocation:(CGPoint)a3;
- (BOOL)_dragShouldBeginForSession:(id)a3;
- (BOOL)_insertSpaceAffordanceEnabled;
- (BOOL)_isLassoAddingSpace:(CGPoint)a3;
- (BOOL)_isRepeatedTap:(id)a3;
- (BOOL)_isWithinRepeatedTapTimeForGesture:(id)a3;
- (BOOL)_liveSelectionGestureStillActive;
- (BOOL)_locationShouldFlipOverLeftKnob:(CGPoint)a3;
- (BOOL)_locationShouldFlipOverLeftKnob_LTR:(CGPoint)a3;
- (BOOL)_locationShouldFlipOverLeftKnob_RTL:(CGPoint)a3;
- (BOOL)_locationShouldFlipOverRightKnob:(CGPoint)a3;
- (BOOL)_locationShouldFlipOverRightKnob_LTR:(CGPoint)a3;
- (BOOL)_locationShouldFlipOverRightKnob_RTL:(CGPoint)a3;
- (BOOL)_selectionInteractionShouldBeginAtPoint:(CGPoint)a3 forEvent:(id)a4 orGestureRecognizer:(id)a5;
- (BOOL)_selectionInteractionShouldForwardAtPoint:(CGPoint)a3 forEvent:(id)a4;
- (BOOL)_selectionShouldReceiveTouchForPoint:(CGPoint)a3;
- (BOOL)currentSelectionHasStrokes;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)gesturesAllowedForPaletteState;
- (BOOL)hasCurrentSelection;
- (BOOL)hasStrokesAtLocation:(CGPoint)a3;
- (BOOL)hasStrokesOrElementsSelection;
- (BOOL)insertSpaceEnabled;
- (BOOL)isEnabled;
- (BOOL)isLTR;
- (BOOL)knobsContainPoint:(CGPoint)a3 forInputType:(int64_t)a4;
- (CGPoint)_drawingBeganLocation;
- (CGPoint)_pointFromViewToStrokeSpace:(CGPoint)a3 inDrawing:(id)a4;
- (CGPoint)_undraggedKnobLocation:(int64_t)a3 forInitialStrokeBounds:(CGRect)a4;
- (CGPoint)clampInputPointForSelection:(CGPoint)a3 forDrawing:(id)a4;
- (NSMutableOrderedSet)smartSelectedStrokes;
- (NSOrderedSet)initialStrokeSelectionBeforeModification;
- (PKDrawing)currentDrawing;
- (PKSelectionController)selectionController;
- (PKSelectionInteraction)initWithSelectionController:(id)a3;
- (PKSelectionInteractionDelegate)delegate;
- (UILongPressGestureRecognizer)knobBrushGestureRecognizer;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (UILongPressGestureRecognizer)pencilLongPressGestureRecognizer;
- (UILongPressGestureRecognizer)tapAndHoldToSelectLongPressGestureRecognizer;
- (UIPanGestureRecognizer)knobDragGestureRecognizer;
- (UIPanGestureRecognizer)lassoGestureRecognizer;
- (UITapAndAHalfRecognizer)modifySelectionRecognizer;
- (UITapGestureRecognizer)noOpTapGestureRecognizer;
- (UITapGestureRecognizer)progressiveTapGestureRecognizer;
- (UIView)view;
- (double)_timestampForGestureRecognizer:(id)a3;
- (double)_timestampForTouch:(id)a3;
- (double)_updateVelocityWindowWithTimestamp:(double)a3 location:(CGPoint)a4;
- (double)_updateVelocityWindowWithTouch:(id)a3 location:(CGPoint)a4;
- (id)_adornmentLayers;
- (id)_closestStrokesToCorner:(unint64_t)a3 fromStrokes:(id)a4;
- (id)_drawingForLocation:(CGPoint)a3;
- (id)_firstStrokesInStrokes:(id)a3;
- (id)_gestures;
- (id)_gesturesForLiveSelection;
- (id)_knobForLocation:(CGPoint)a3;
- (id)_knobForLocation:(CGPoint)a3 forInputType:(int64_t)a4;
- (id)_lastStrokesInStrokes:(id)a3;
- (id)_selectionModifierGestures;
- (id)_visibleOnscreenStrokesForDrawing:(id)a3;
- (int64_t)_selectionTypeForTapCount:(int64_t)a3;
- (int64_t)_selectionTypeForVelocity:(double)a3;
- (int64_t)_updateSmartSelectionWithInput:(id)a3 modificationType:(int64_t)a4;
- (int64_t)_updateSmartSelectionWithInput:(id)a3 modificationType:(int64_t)a4 completion:(id)a5;
- (int64_t)_updateSmartSelectionWithInput:(id)a3 modificationType:(int64_t)a4 liveScrollOffset:(CGPoint)a5 completion:(id)a6;
- (void)_addInsertSpaceAffordance;
- (void)_addInsertSpaceAffordanceGestureIfNecessary;
- (void)_calculateFirstAndLastStrokeForKnobPlacement;
- (void)_cancelDeferredPasteFromTappingAction;
- (void)_cleanupInsertSpaceAffordance;
- (void)_clearLiveSelectionPath;
- (void)_didAddSelectionView:(id)a3;
- (void)_didBeginDraggingSelection:(id)a3;
- (void)_didBeginSelection:(id)a3;
- (void)_didBrushWithKnob:(id)a3;
- (void)_didDragKnob:(id)a3;
- (void)_didEndDraggingSelection:(id)a3;
- (void)_didEndLassoAddingSpaceAtLocation:(CGPoint)a3;
- (void)_didEndLassoSelectionWithPath:(id)a3;
- (void)_didGrabInsertSpaceAffordance:(id)a3;
- (void)_didSmartSelectTap:(id)a3;
- (void)_didTapAndDrag:(id)a3;
- (void)_dismissEditMenuIfNecessary;
- (void)_handleSingleTap:(id)a3;
- (void)_intersectedStrokesInDrawing:(id)a3 forSelectionInput:(id)a4 existingSelection:(id)a5 completion:(id)a6;
- (void)_pressAndHoldLinearExpand:(id)a3;
- (void)_resetVelocityWindow;
- (void)_selectViaContinuousTapWithInput:(id)a3;
- (void)_setupGestures;
- (void)_toolPickerDidShowHide:(id)a3;
- (void)_updateAllowedTouchTypesForLassoGR;
- (void)_updateAllowedTouchTypesForSelectedInk:(id)a3;
- (void)_updateAllowedTouchTypesForSelectedInk:(id)a3 hasCurrentSelection:(BOOL)a4;
- (void)_updateInsertSpaceAffordancePosition;
- (void)_updateLiveLassoPath:(CGPath *)a3;
- (void)_updateProgressiveTapSelectionWithSelectionInput:(id)a3 existingSelection:(id)a4;
- (void)_updateSmartSelectionWithDragToLocation:(CGPoint)a3 liveScrollOffset:(CGPoint)a4 completion:(id)a5;
- (void)_updateSmartSelectionWithDragToLocation:(CGPoint)a3 liveScrollOffset:(CGPoint)a4 initialSelectedWord:(id)a5 completion:(id)a6;
- (void)_updateStateIfNecessaryWithOldModificationType:(int64_t)a3 newModificationType:(int64_t)a4;
- (void)_updateTapGestureHistoryWithLocation:(CGPoint)a3 gesture:(id)a4;
- (void)_updateUndraggedKnobLocationForKnobDrag;
- (void)_willRemoveSelectionView:(id)a3;
- (void)didMoveToView:(id)a3;
- (void)didResizeExternalElements;
- (void)dismissEditMenuIfNecessary;
- (void)setCurrentDrawing:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setInitialStrokeSelectionBeforeModification:(id)a3;
- (void)setInsertSpaceEnabled:(BOOL)a3;
- (void)setKnobBrushGestureRecognizer:(id)a3;
- (void)setKnobDragGestureRecognizer:(id)a3;
- (void)setLassoGestureRecognizer:(id)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setModifySelectionRecognizer:(id)a3;
- (void)setNoOpTapGestureRecognizer:(id)a3;
- (void)setPencilLongPressGestureRecognizer:(id)a3;
- (void)setProgressiveTapGestureRecognizer:(id)a3;
- (void)setSelectionController:(id)a3;
- (void)setSmartSelectedStrokes:(id)a3;
- (void)setTapAndHoldToSelectLongPressGestureRecognizer:(id)a3;
- (void)setView:(id)a3;
- (void)set_didCancelSelection:(BOOL)a3;
- (void)set_drawingBeganLocation:(CGPoint)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation PKSelectionInteraction

- (void)_updateAllowedTouchTypesForLassoGR
{
  uint64_t v3 = [(PKSelectionInteraction *)self selectionController];
  v4 = (void *)v3;
  if (v3) {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  v6 = [WeakRetained ink];
  int v7 = [v6 _isLassoInk];

  if (v7)
  {
    if (!PKIsVisionDevice())
    {
      uint64_t v10 = [(PKSelectionInteraction *)self selectionController];
      id v13 = (id)v10;
      if (v10) {
        id v11 = objc_loadWeakRetained((id *)(v10 + 120));
      }
      else {
        id v11 = 0;
      }
      if ([v11 allowsFingerDrawing]) {
        v12 = &unk_1F200EC88;
      }
      else {
        v12 = &unk_1F200EC70;
      }
      [(UIPanGestureRecognizer *)self->_lassoGestureRecognizer setAllowedTouchTypes:v12];
    }
  }
  else
  {
    lassoGestureRecognizer = self->_lassoGestureRecognizer;
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
    [(UIPanGestureRecognizer *)lassoGestureRecognizer setAllowedTouchTypes:v9];
  }
}

- (void)_updateAllowedTouchTypesForSelectedInk:(id)a3 hasCurrentSelection:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if ([a3 _isLassoInk])
  {
    long long v58 = 0uLL;
    long long v59 = 0uLL;
    long long v56 = 0uLL;
    long long v57 = 0uLL;
    v6 = [(PKSelectionInteraction *)self _gestures];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v57 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v56 + 1) + 8 * i) setAllowedTouchTypes:&unk_1F200EC40];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v56 objects:v63 count:16];
      }
      while (v8);
    }
  }
  else if (v4)
  {
    long long v54 = 0uLL;
    long long v55 = 0uLL;
    long long v52 = 0uLL;
    long long v53 = 0uLL;
    uint64_t v11 = [(PKSelectionInteraction *)self selectionController];
    v12 = (void *)v11;
    if (v11) {
      id v13 = *(void **)(v11 + 152);
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
    v15 = [v14 _selectionViewGestures];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v53 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v52 + 1) + 8 * j) setAllowedTouchTypes:&unk_1F200EC40];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v17);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v20 = [(PKSelectionInteraction *)self _selectionModifierGestures];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v61 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v49;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v49 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v48 + 1) + 8 * k) setAllowedTouchTypes:&unk_1F200EC40];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v48 objects:v61 count:16];
      }
      while (v22);
    }

    [(UIPanGestureRecognizer *)self->_insertSpaceAffordanceGesture setAllowedTouchTypes:&unk_1F200EC40];
  }
  else
  {
    long long v46 = 0uLL;
    long long v47 = 0uLL;
    long long v44 = 0uLL;
    long long v45 = 0uLL;
    obuint64_t j = [(PKSelectionInteraction *)self _gestures];
    uint64_t v25 = [obj countByEnumeratingWithState:&v44 objects:v60 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v45;
      v28 = (void *)MEMORY[0x1E4F1CBF0];
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v45 != v27) {
            objc_enumerationMutation(obj);
          }
          v30 = *(void **)(*((void *)&v44 + 1) + 8 * v29);
          uint64_t v31 = [(PKSelectionInteraction *)self selectionController];
          v32 = (void *)v31;
          if (v31) {
            id WeakRetained = objc_loadWeakRetained((id *)(v31 + 120));
          }
          else {
            id WeakRetained = 0;
          }
          if ([WeakRetained allowsFingerDrawing]) {
            v34 = v28;
          }
          else {
            v34 = &unk_1F200EC58;
          }
          [v30 setAllowedTouchTypes:v34];

          v35 = [v30 name];

          if (v35 == @"com.apple.PencilKit.knobDrag")
          {
            uint64_t v36 = [(PKSelectionInteraction *)self selectionController];
            v37 = (void *)v36;
            if (v36) {
              id v38 = objc_loadWeakRetained((id *)(v36 + 120));
            }
            else {
              id v38 = 0;
            }
            v39 = [(PKSelectionInteraction *)self currentDrawing];
            v40 = [v39 uuid];
            v41 = [v38 _attachmentForUUID:v40];

            if ([v41 isExternalAttachment]) {
              [v30 setAllowedTouchTypes:&unk_1F200EC40];
            }

            v28 = (void *)MEMORY[0x1E4F1CBF0];
          }
          ++v29;
        }
        while (v26 != v29);
        uint64_t v42 = [obj countByEnumeratingWithState:&v44 objects:v60 count:16];
        uint64_t v26 = v42;
      }
      while (v42);
    }
  }
  [(PKSelectionInteraction *)self _updateAllowedTouchTypesForLassoGR];
}

- (PKSelectionController)selectionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);

  return (PKSelectionController *)WeakRetained;
}

- (PKDrawing)currentDrawing
{
  return self->_currentDrawing;
}

- (id)_gestures
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  knobBrushGestureRecognizer = self->_knobBrushGestureRecognizer;
  knobDragGestureRecognizer = self->_knobDragGestureRecognizer;
  v9[0] = self->_lassoGestureRecognizer;
  v9[1] = knobDragGestureRecognizer;
  v9[2] = knobBrushGestureRecognizer;
  long long v10 = *(_OWORD *)&self->_noOpTapGestureRecognizer;
  tapAndHoldToSelectLongPressGestureRecognizer = self->_tapAndHoldToSelectLongPressGestureRecognizer;
  modifySelectionRecognizer = self->_modifySelectionRecognizer;
  v12 = tapAndHoldToSelectLongPressGestureRecognizer;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:7];
  [v3 addObjectsFromArray:v7];
  if (self->_insertSpaceEnabled && self->_insertSpaceAffordanceGesture) {
    objc_msgSend(v3, "addObject:");
  }
  [v3 addObjectsFromArray:self->_selectionViewGestures];

  return v3;
}

- (void)_updateAllowedTouchTypesForSelectedInk:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKSelectionInteraction *)self selectionController];
  id v7 = (id)v5;
  if (v5) {
    BOOL v6 = *(void *)(v5 + 128) != 0;
  }
  else {
    BOOL v6 = 0;
  }
  [(PKSelectionInteraction *)self _updateAllowedTouchTypesForSelectedInk:v4 hasCurrentSelection:v6];
}

- (PKSelectionInteraction)initWithSelectionController:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKSelectionInteraction;
  uint64_t v5 = [(PKSelectionInteraction *)&v13 init];
  if (v5)
  {
    BOOL v6 = [[PKLassoRenderer alloc] initForLiveSelectionWithRenderingDelegate:v4];
    lassoRenderer = v5->_lassoRenderer;
    v5->_lassoRenderer = v6;

    uint64_t v8 = [[PKSelectionGlowRenderer alloc] initForLiveSelectionWithRenderingDelegate:v4];
    glowRenderer = v5->_glowRenderer;
    v5->_glowRenderer = v8;

    objc_storeWeak((id *)&v5->_selectionController, v4);
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    selectionViewGestures = v5->_selectionViewGestures;
    v5->_selectionViewGestures = (NSMutableArray *)v10;

    v5->_enabled = 1;
  }

  return v5;
}

- (void)setDelegate:(id)a3
{
}

- (void)_setupGestures
{
  uint64_t v3 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__didBeginSelection_];
  lassoGestureRecognizer = self->_lassoGestureRecognizer;
  self->_lassoGestureRecognizer = v3;

  [(UIPanGestureRecognizer *)self->_lassoGestureRecognizer setName:@"com.apple.PencilKit.lasso"];
  [(UIPanGestureRecognizer *)self->_lassoGestureRecognizer setDelegate:self];
  [(UIPanGestureRecognizer *)self->_lassoGestureRecognizer setMaximumNumberOfTouches:1];
  uint64_t v5 = [(PKSelectionInteraction *)self view];
  [v5 addGestureRecognizer:self->_lassoGestureRecognizer];

  BOOL v6 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__didBrushWithKnob_];
  knobBrushGestureRecognizer = self->_knobBrushGestureRecognizer;
  self->_knobBrushGestureRecognizer = v6;

  [(UILongPressGestureRecognizer *)self->_knobBrushGestureRecognizer setName:@"com.apple.PencilKit.knobBrush"];
  [(UILongPressGestureRecognizer *)self->_knobBrushGestureRecognizer setDelegate:self];
  uint64_t v8 = [(PKSelectionInteraction *)self view];
  [v8 addGestureRecognizer:self->_knobBrushGestureRecognizer];

  uint64_t v9 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__didDragKnob_];
  knobDragGestureRecognizer = self->_knobDragGestureRecognizer;
  self->_knobDragGestureRecognizer = v9;

  [(UIPanGestureRecognizer *)self->_knobDragGestureRecognizer setName:@"com.apple.PencilKit.knobDrag"];
  [(UIPanGestureRecognizer *)self->_knobDragGestureRecognizer setDelegate:self];
  uint64_t v11 = [(PKSelectionInteraction *)self view];
  [v11 addGestureRecognizer:self->_knobDragGestureRecognizer];

  v12 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__eatGesture_];
  noOpTapGestureRecognizer = self->_noOpTapGestureRecognizer;
  self->_noOpTapGestureRecognizer = v12;

  [(UITapGestureRecognizer *)self->_noOpTapGestureRecognizer setName:@"com.apple.PencilKit.noOpTap"];
  [(UITapGestureRecognizer *)self->_noOpTapGestureRecognizer setDelegate:self];
  id v14 = [(PKSelectionInteraction *)self view];
  [v14 addGestureRecognizer:self->_noOpTapGestureRecognizer];

  v15 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__didSmartSelectTap_];
  progressiveTapGestureRecognizer = self->_progressiveTapGestureRecognizer;
  self->_progressiveTapGestureRecognizer = v15;

  [(UITapGestureRecognizer *)self->_progressiveTapGestureRecognizer setName:@"com.apple.PencilKit.progressiveTaps"];
  [(UITapGestureRecognizer *)self->_progressiveTapGestureRecognizer setDelegate:self];
  [(UITapGestureRecognizer *)self->_progressiveTapGestureRecognizer setNumberOfTouchesRequired:1];
  [(UITapGestureRecognizer *)self->_progressiveTapGestureRecognizer setNumberOfTapsRequired:1];
  [(UITapGestureRecognizer *)self->_progressiveTapGestureRecognizer setAllowableMovement:10.0];
  uint64_t v17 = [(PKSelectionInteraction *)self view];
  [v17 addGestureRecognizer:self->_progressiveTapGestureRecognizer];

  uint64_t v18 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__pressAndHoldLinearExpand_];
  tapAndHoldToSelectLongPressGestureRecognizer = self->_tapAndHoldToSelectLongPressGestureRecognizer;
  self->_tapAndHoldToSelectLongPressGestureRecognizer = v18;

  [(UILongPressGestureRecognizer *)self->_tapAndHoldToSelectLongPressGestureRecognizer setName:@"com.apple.PencilKit.longPressToSelectToken"];
  [(UILongPressGestureRecognizer *)self->_tapAndHoldToSelectLongPressGestureRecognizer setDelegate:self];
  v20 = [(PKSelectionInteraction *)self view];
  [v20 addGestureRecognizer:self->_tapAndHoldToSelectLongPressGestureRecognizer];

  uint64_t v21 = (UITapAndAHalfRecognizer *)[objc_alloc(NSClassFromString(&cfstr_Uitapandahalfr.isa)) initWithTarget:self action:sel__didTapAndDrag_];
  modifySelectionRecognizer = self->_modifySelectionRecognizer;
  self->_modifySelectionRecognizer = v21;

  [(UITapAndAHalfRecognizer *)self->_modifySelectionRecognizer setName:@"com.apple.PencilKit.modifySelection"];
  [(UITapAndAHalfRecognizer *)self->_modifySelectionRecognizer setDelegate:self];
  [(UITapAndAHalfRecognizer *)self->_modifySelectionRecognizer setNumberOfFullTaps:1];
  uint64_t v23 = [(PKSelectionInteraction *)self view];
  [v23 addGestureRecognizer:self->_modifySelectionRecognizer];

  if ([(PKSelectionInteraction *)self _insertSpaceAffordanceEnabled])
  {
    [(PKSelectionInteraction *)self _addInsertSpaceAffordanceGestureIfNecessary];
  }
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (BOOL)_insertSpaceAffordanceEnabled
{
  uint64_t v3 = [(PKSelectionInteraction *)self selectionController];
  id v4 = (void *)v3;
  if (v3) {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v6 = [(PKSelectionInteraction *)self selectionController];
    if (v6) {
      BOOL v7 = v6[114] != 0;
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)setInsertSpaceEnabled:(BOOL)a3
{
  self->_insertSpaceEnabled = a3;
  [(PKSelectionInteraction *)self _addInsertSpaceAffordanceGestureIfNecessary];
}

- (void)_addInsertSpaceAffordanceGestureIfNecessary
{
  uint64_t v3 = [(PKSelectionInteraction *)self selectionController];
  if (v3 && v3[114])
  {
    insertSpaceAffordanceGesture = self->_insertSpaceAffordanceGesture;

    if (insertSpaceAffordanceGesture) {
      return;
    }
    uint64_t v5 = (UIPanGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1A58]);
    BOOL v6 = self->_insertSpaceAffordanceGesture;
    self->_insertSpaceAffordanceGesture = v5;

    [(UIPanGestureRecognizer *)self->_insertSpaceAffordanceGesture setDelegate:self];
    [(UIPanGestureRecognizer *)self->_insertSpaceAffordanceGesture addTarget:self action:sel__didGrabInsertSpaceAffordance_];
    id v7 = [(PKSelectionInteraction *)self view];
    [v7 addGestureRecognizer:self->_insertSpaceAffordanceGesture];
    uint64_t v3 = v7;
  }
}

- (void)didMoveToView:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  -[PKSelectionInteraction setView:](self, "setView:");
  if (a3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = [(PKSelectionInteraction *)self _adornmentLayers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
          uint64_t v11 = [(PKSelectionInteraction *)self view];
          v12 = [v11 layer];
          [v12 addSublayer:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    [(PKSelectionInteraction *)self _setupGestures];
    objc_super v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:self selector:sel__toolPickerDidShowHide_ name:@"PKToolPickerDidShowNotification" object:0];

    id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:self selector:sel__toolPickerDidShowHide_ name:@"PKToolPickerDidHideNotification" object:0];
  }
}

- (void)setView:(id)a3
{
}

- (id)_adornmentLayers
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PKSelectionRendering *)self->_lassoRenderer adornmentLayer];
  v7[0] = v3;
  id v4 = [(PKSelectionGlowRenderer *)self->_glowRenderer adornmentLayer];
  v7[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (void)willMoveToView:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = [(PKSelectionInteraction *)self _adornmentLayers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * v8++) removeFromSuperlayer];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = [(PKSelectionInteraction *)self _gestures];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
          long long v15 = [(PKSelectionInteraction *)self view];
          [v15 removeGestureRecognizer:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v11);
    }

    long long v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 removeObserver:self name:@"PKToolPickerDidShowNotification" object:0];

    long long v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 removeObserver:self name:@"PKToolPickerDidHideNotification" object:0];
  }
}

- (BOOL)hasCurrentSelection
{
  v2 = [(PKSelectionInteraction *)self selectionController];
  if (v2) {
    BOOL v3 = v2[16] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)currentSelectionHasStrokes
{
  uint64_t v2 = [(PKSelectionInteraction *)self selectionController];
  BOOL v3 = (void *)v2;
  if (v2) {
    id v4 = *(void **)(v2 + 128);
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  uint64_t v6 = [v5 strokes];
  BOOL v7 = [v6 count] != 0;

  return v7;
}

- (BOOL)hasStrokesOrElementsSelection
{
  uint64_t v3 = [(PKSelectionInteraction *)self selectionController];
  id v4 = (void *)v3;
  if (v3 && *(void *)(v3 + 128))
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = [(PKSelectionInteraction *)self selectionController];
    BOOL v5 = -[PKSelectionController _hasExternalElementsSelectedInAttachment:]((BOOL)v6, 0);
  }
  return v5;
}

- (BOOL)hasStrokesAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v4 = -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:");
  uint64_t v5 = [(PKSelectionInteraction *)self selectionController];
  uint64_t v6 = (void *)v5;
  if (v5) {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v8 = [v4 uuid];
  uint64_t v9 = [WeakRetained _attachmentForUUID:v8];

  uint64_t v10 = [v9 strokeSpatialCache];
  uint64_t v11 = (void *)v10;
  if (v10 && *(unsigned char *)(v10 + 8))
  {
    uint64_t v12 = [v9 strokeSpatialCache];
    uint64_t v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = *(void **)(v12 + 24);
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = v14;
  }
  else
  {
    id v15 = [v4 strokes];
  }

  uint64_t v16 = [(PKSelectionInteraction *)self selectionController];
  long long v17 = (void *)v16;
  if (v16 && (id v18 = objc_loadWeakRetained((id *)(v16 + 120))) != 0)
  {
    long long v19 = v18;
    [v18 transformFromViewToStrokeSpaceInDrawing:v4];
    float64x2_t v20 = v29;
    float64x2_t v21 = v30;
    float64x2_t v22 = v31;
  }
  else
  {
    long long v19 = 0;
    float64x2_t v22 = 0uLL;
    float64x2_t v20 = 0uLL;
    float64x2_t v21 = 0uLL;
  }
  float64x2_t v28 = vaddq_f64(v22, vmlaq_n_f64(vmulq_n_f64(v21, y), v20, x));

  long long v23 = [v4 intersectedStrokesAtPoint:1 selectionType:0 inputType:v15 visibleOnscreenStrokes:*(_OWORD *)&v28];
  BOOL v24 = [v23 count] != 0;

  return v24;
}

- (void)didResizeExternalElements
{
  uint64_t v2 = [(PKSelectionInteraction *)self selectionController];
  -[PKSelectionController _didResizeExternalElements](v2);
}

- (id)_gesturesForLiveSelection
{
  v7[4] = *MEMORY[0x1E4F143B8];
  knobDragGestureRecognizer = self->_knobDragGestureRecognizer;
  tapAndHoldToSelectLongPressGestureRecognizer = self->_tapAndHoldToSelectLongPressGestureRecognizer;
  modifySelectionRecognizer = self->_modifySelectionRecognizer;
  v7[0] = self->_knobBrushGestureRecognizer;
  v7[1] = modifySelectionRecognizer;
  v7[2] = knobDragGestureRecognizer;
  void v7[3] = tapAndHoldToSelectLongPressGestureRecognizer;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];

  return v5;
}

- (BOOL)_liveSelectionGestureStillActive
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [(PKSelectionInteraction *)self _gesturesForLiveSelection];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 state] == 1 || objc_msgSend(v7, "state") == 2)
        {
          BOOL v8 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      BOOL v8 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (void)_didGrabInsertSpaceAffordance:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 state];
  if (v4 == 1 || [v9 state] == 3 || objc_msgSend(v9, "state") == 4 || objc_msgSend(v9, "state") == 5) {
    [(PKDrawingAdjustmentKnob *)self->_insertSpaceAffordance setHidden:v4 == 1];
  }
  uint64_t v5 = [(PKSelectionInteraction *)self selectionController];
  uint64_t v6 = (void *)v5;
  if (v5) {
    BOOL v7 = *(void **)(v5 + 144);
  }
  else {
    BOOL v7 = 0;
  }
  id v8 = v7;
  [v8 _didGrabInsertSpaceAffordance:v9];
}

- (id)_selectionModifierGestures
{
  v5[2] = *MEMORY[0x1E4F143B8];
  knobBrushGestureRecognizer = self->_knobBrushGestureRecognizer;
  v5[0] = self->_knobDragGestureRecognizer;
  v5[1] = knobBrushGestureRecognizer;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return v3;
}

- (void)_didAddSelectionView:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PKSelectionInteraction *)self view];
  uint64_t v6 = [v5 window];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __47__PKSelectionInteraction__didAddSelectionView___block_invoke;
  v31[3] = &unk_1E64C5F60;
  v31[4] = self;
  id v7 = v4;
  id v32 = v7;
  +[PKToolPicker _performWithVisibilityUpdatesEnabled:0 window:v6 block:v31];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = objc_msgSend(v7, "_selectionViewGestures", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v13 setDelegate:self];
        [(NSMutableArray *)self->_selectionViewGestures addObject:v13];
        uint64_t v14 = [(PKSelectionInteraction *)self view];
        [v14 addGestureRecognizer:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v10);
  }

  if ([(PKSelectionInteraction *)self _insertSpaceAffordanceEnabled])
  {
    [(PKSelectionInteraction *)self _cleanupInsertSpaceAffordance];
    [(PKSelectionInteraction *)self _addInsertSpaceAffordance];
  }
  uint64_t v15 = [(PKSelectionInteraction *)self selectionController];
  uint64_t v16 = (void *)v15;
  if (v15) {
    id WeakRetained = objc_loadWeakRetained((id *)(v15 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  id v18 = [WeakRetained ink];
  [(PKSelectionInteraction *)self _updateAllowedTouchTypesForSelectedInk:v18 hasCurrentSelection:1];

  uint64_t v19 = [(PKSelectionInteraction *)self selectionController];
  float64x2_t v20 = (void *)v19;
  if (v19) {
    id v21 = objc_loadWeakRetained((id *)(v19 + 120));
  }
  else {
    id v21 = 0;
  }
  char v22 = [v21 allowsFingerDrawing];

  if ((v22 & 1) == 0) {
    [(UIPanGestureRecognizer *)self->_lassoGestureRecognizer setAllowedTouchTypes:&unk_1F200EC28];
  }
  long long v23 = [(PKSelectionInteraction *)self view];
  BOOL v24 = [v23 window];
  long long v25 = +[PKToolPicker activeToolPickerForWindow:v24];

  if (v25)
  {
    uint64_t v26 = [v25 _selectionContext];
    objc_msgSend(v26, "setSelectionMask:", objc_msgSend(v26, "selectionMask") | 1);
  }
}

void __47__PKSelectionInteraction__didAddSelectionView___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 addSubview:*(void *)(a1 + 40)];
}

- (void)_willRemoveSelectionView:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = objc_msgSend(a3, "_selectionViewGestures", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        [(NSMutableArray *)self->_selectionViewGestures removeObject:v9];
        uint64_t v10 = [(PKSelectionInteraction *)self view];
        [v10 removeGestureRecognizer:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  uint64_t v11 = [(PKSelectionInteraction *)self selectionController];
  long long v12 = (void *)v11;
  if (v11) {
    id WeakRetained = objc_loadWeakRetained((id *)(v11 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v14 = [WeakRetained ink];
  [(PKSelectionInteraction *)self _updateAllowedTouchTypesForSelectedInk:v14 hasCurrentSelection:0];

  if ([(PKSelectionInteraction *)self _insertSpaceAffordanceEnabled]) {
    [(PKSelectionInteraction *)self _cleanupInsertSpaceAffordance];
  }
  uint64_t v15 = [(PKSelectionInteraction *)self view];
  uint64_t v16 = [v15 window];
  long long v17 = +[PKToolPicker activeToolPickerForWindow:v16];

  if (v17)
  {
    id v18 = [v17 _selectionContext];
    objc_msgSend(v18, "setSelectionMask:", objc_msgSend(v18, "selectionMask") & 0xFFFFFFFFFFFFFFFELL);
  }
}

- (void)_toolPickerDidShowHide:(id)a3
{
  id v24 = a3;
  id v4 = [v24 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"PKToolPickerNotificationWindowSceneUserInfoKey"];
  uint64_t v6 = [(PKSelectionInteraction *)self view];
  uint64_t v7 = [v6 window];
  id v8 = [v7 windowScene];

  uint64_t v9 = v24;
  if (v5 == v8)
  {
    uint64_t v10 = [v24 object];
    uint64_t v11 = [(PKSelectionInteraction *)self selectionController];
    if (v11)
    {
      uint64_t v12 = v11[16];

      if (!v12)
      {
LABEL_13:

        uint64_t v9 = v24;
        goto LABEL_14;
      }
      uint64_t v13 = [(PKSelectionInteraction *)self selectionController];
      uint64_t v14 = (void *)v13;
      if (v13) {
        uint64_t v15 = *(void **)(v13 + 128);
      }
      else {
        uint64_t v15 = 0;
      }
      id v16 = v15;
      long long v17 = [v16 drawing];

      uint64_t v18 = [(PKSelectionInteraction *)self selectionController];
      long long v19 = (void *)v18;
      if (v18) {
        id WeakRetained = objc_loadWeakRetained((id *)(v18 + 120));
      }
      else {
        id WeakRetained = 0;
      }
      long long v21 = [v17 uuid];
      long long v22 = [WeakRetained _attachmentForUUID:v21];

      if (v22 && ([v22 isExternalAttachment] & 1) == 0)
      {
        long long v23 = [v10 _selectionContext];
        objc_msgSend(v23, "setSelectionMask:", objc_msgSend(v23, "selectionMask") | 1);
      }
    }
    else
    {
      long long v17 = 0;
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (void)_didBeginDraggingSelection:(id)a3
{
  -[PKDrawingAdjustmentKnob setAlpha:](self->_insertSpaceAffordance, "setAlpha:", a3, 0.0);
  uint64_t v4 = [(PKSelectionInteraction *)self selectionController];
  id v7 = (id)v4;
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 144);
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  [v6 invalidateCachedStrokes];
}

- (void)_didEndDraggingSelection:(id)a3
{
  -[PKDrawingAdjustmentKnob setAlpha:](self->_insertSpaceAffordance, "setAlpha:", a3, 1.0);

  [(PKSelectionInteraction *)self _updateInsertSpaceAffordancePosition];
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [(PKSelectionInteraction *)self _gestures];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setEnabled:v3];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)_cleanupInsertSpaceAffordance
{
  [(PKDrawingAdjustmentKnob *)self->_insertSpaceAffordance removeFromSuperview];
  insertSpaceAffordance = self->_insertSpaceAffordance;
  self->_insertSpaceAffordance = 0;
}

- (void)_addInsertSpaceAffordance
{
  BOOL v3 = objc_alloc_init(PKDrawingAdjustmentKnob);
  insertSpaceAffordance = self->_insertSpaceAffordance;
  self->_insertSpaceAffordance = v3;

  uint64_t v5 = self->_insertSpaceAffordance;
  uint64_t v6 = [(PKSelectionInteraction *)self view];
  uint64_t v7 = [v6 tintColor];
  [(PKDrawingAdjustmentKnob *)v5 setTintColor:v7];

  [(PKSelectionInteraction *)self _updateInsertSpaceAffordancePosition];
  id v8 = [(PKSelectionInteraction *)self view];
  [v8 addSubview:self->_insertSpaceAffordance];
}

- (void)_updateInsertSpaceAffordancePosition
{
  BOOL v3 = [(PKSelectionInteraction *)self view];
  uint64_t v4 = [v3 effectiveUserInterfaceLayoutDirection];
  uint64_t v5 = [(PKSelectionInteraction *)self selectionController];
  uint64_t v6 = -[PKSelectionController topView](v5);
  [v6 frame];
  double v11 = v7;
  if (v4)
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v7);
    +[PKDrawingAdjustmentKnob leftMargin];
    double v14 = MaxX - v13 + -15.0;
  }
  else
  {
    +[PKDrawingAdjustmentKnob leftMargin];
    double v14 = v11 + v15;
  }

  uint64_t v16 = [(PKSelectionInteraction *)self selectionController];
  long long v17 = (void *)v16;
  if (v16) {
    uint64_t v18 = *(void **)(v16 + 152);
  }
  else {
    uint64_t v18 = 0;
  }
  id v19 = v18;
  [v19 frame];
  double v21 = v20 + -10.0;

  insertSpaceAffordance = self->_insertSpaceAffordance;

  -[PKDrawingAdjustmentKnob setFrame:](insertSpaceAffordance, "setFrame:", v14, v21, 15.0, 16.0);
}

- (id)_drawingForLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(PKSelectionInteraction *)self selectionController];
  uint64_t v6 = -[PKSelectionController _drawingForSelectionRect:]((uint64_t)v5, x + -22.0, y + -22.0, 44.0, 44.0);

  return v6;
}

- (double)_timestampForGestureRecognizer:(id)a3
{
  uint64_t v4 = [a3 touches];
  uint64_t v5 = [v4 lastObject];

  [(PKSelectionInteraction *)self _timestampForTouch:v5];
  double v7 = v6;

  return v7;
}

- (double)_timestampForTouch:(id)a3
{
  if (a3)
  {
    [a3 timestamp];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28F80] processInfo];
    [v5 systemUptime];
    double v7 = v6;

    return v7;
  }
  return result;
}

- (void)_clearLiveSelectionPath
{
  -[PKSelectionGlowRenderer _renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:](self->_glowRenderer, "_renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:", 0, 0, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  smartSelectedStrokes = self->_smartSelectedStrokes;
  self->_smartSelectedStrokes = 0;
}

- (void)_didSmartSelectTap:(id)a3
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PKSelectionInteraction *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  long long v10 = -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:", v7, v9);
  [(PKSelectionInteraction *)self setCurrentDrawing:v10];

  double v11 = [v4 touches];
  long long v12 = [v11 firstObject];

  BOOL v13 = [v12 type] == 2;
  if ([v4 state] == 3)
  {
    if ([(PKSelectionInteraction *)self _isRepeatedTap:v4])
    {
      if (self->_currentTapCount == 1)
      {
        double v14 = -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:", v7, v9);
        uint64_t v15 = [(PKSelectionInteraction *)self selectionController];
        uint64_t v16 = (void *)v15;
        if (v15 && (id WeakRetained = objc_loadWeakRetained((id *)(v15 + 120))) != 0)
        {
          uint64_t v18 = WeakRetained;
          [WeakRetained transformFromViewToStrokeSpaceInDrawing:v14];
          double v20 = *((double *)&v37 + 1);
          double v19 = *(double *)&v37;
          double v22 = *((double *)&v38 + 1);
          double v21 = *(double *)&v38;
          double v23 = v39[1];
          double v24 = v39[0];
        }
        else
        {
          uint64_t v18 = 0;
          long long v38 = 0u;
          *(_OWORD *)v39 = 0u;
          long long v37 = 0u;
          double v23 = 0.0;
          double v22 = 0.0;
          double v20 = 0.0;
          double v24 = 0.0;
          double v21 = 0.0;
          double v19 = 0.0;
        }

        long long v28 = [(PKSelectionInteraction *)self delegate];
        if (objc_opt_respondsToSelector())
        {
          long long v29 = [(PKSelectionInteraction *)self delegate];
          int v30 = objc_msgSend(v29, "selectionInteraction:handleDoubleTapOnCanvasAtLocation:", self, v24 + v9 * v21 + v19 * v7, v23 + v9 * v22 + v20 * v7);

          if (v30)
          {
            [(PKSelectionInteraction *)self _cancelDeferredPasteFromTappingAction];
            self->_currentTapCount = 1;

            goto LABEL_19;
          }
        }
        else
        {
        }
      }
      if (![(PKSelectionInteraction *)self gesturesAllowedForPaletteState])goto LABEL_19; {
      [(PKSelectionInteraction *)self _dismissEditMenuIfNecessary];
      }
      ++self->_currentTapCount;
      uint64_t v26 = +[PKSelectionInput inputWithType:location:inputType:](PKSelectionInput, "inputWithType:location:inputType:", -[PKSelectionInteraction _selectionTypeForTapCount:](self, "_selectionTypeForTapCount:"), v13, v7, v9);
      uint64_t v31 = [(PKSelectionInteraction *)self selectionController];
      id v32 = (void *)v31;
      if (v31) {
        v33 = *(void **)(v31 + 128);
      }
      else {
        v33 = 0;
      }
      id v34 = v33;
      v35 = [v34 strokes];
      uint64_t v36 = [v35 array];
      [(PKSelectionInteraction *)self _updateProgressiveTapSelectionWithSelectionInput:v26 existingSelection:v36];

      [(PKSelectionInteraction *)self _cancelDeferredPasteFromTappingAction];
      long long v27 = sel__selectViaContinuousTapWithInput_;
    }
    else
    {
      self->_currentTapCount = 1;
      v40[0] = @"locationValue";
      long long v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v7, v9);
      v40[1] = @"gestureRecognizer";
      v41[0] = v25;
      v41[1] = v4;
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];

      long long v27 = sel__handleSingleTap_;
    }
    [(PKSelectionInteraction *)self performSelector:v27 withObject:v26 afterDelay:0.35];

    -[PKSelectionInteraction _updateTapGestureHistoryWithLocation:gesture:](self, "_updateTapGestureHistoryWithLocation:gesture:", v4, v7, v9);
  }
LABEL_19:
}

- (void)_cancelDeferredPasteFromTappingAction
{
}

- (int64_t)_selectionTypeForTapCount:(int64_t)a3
{
  uint64_t v3 = 2;
  if (a3 > 2) {
    uint64_t v3 = a3;
  }
  if (v3 >= 5) {
    return 5;
  }
  else {
    return v3;
  }
}

- (void)_updateTapGestureHistoryWithLocation:(CGPoint)a3 gesture:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(PKSelectionInteraction *)self _timestampForGestureRecognizer:a4];
  self->_lastTapLocation.CGFloat y = y;
  self->_lastTapTimestamp = v7;
  self->_lastTapLocation.CGFloat x = x;
}

- (BOOL)_isWithinRepeatedTapTimeForGesture:(id)a3
{
  [(PKSelectionInteraction *)self _timestampForGestureRecognizer:a3];
  return v4 - self->_lastTapTimestamp <= 0.35;
}

- (BOOL)_isRepeatedTap:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKSelectionInteraction *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  LODWORD(v5) = [(PKSelectionInteraction *)self _isWithinRepeatedTapTimeForGesture:v4];
  if (!v5) {
    return 0;
  }
  double v10 = sqrt((v9 - self->_lastTapLocation.y) * (v9 - self->_lastTapLocation.y)+ (v7 - self->_lastTapLocation.x) * (v7 - self->_lastTapLocation.x));
  return v10 * v10 < 625.0;
}

- (void)_handleSingleTap:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 valueForKey:@"locationValue"];
  [v5 CGPointValue];
  double v75 = v6;
  double v76 = v7;

  double v8 = [v4 valueForKey:@"gestureRecognizer"];

  uint64_t v9 = [(PKSelectionInteraction *)self selectionController];
  double v10 = (void *)v9;
  if (v9) {
    id WeakRetained = objc_loadWeakRetained((id *)(v9 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v13 = [(PKSelectionInteraction *)self selectionController];
  double v14 = (void *)v13;
  if (v13) {
    id v15 = objc_loadWeakRetained((id *)(v13 + 120));
  }
  else {
    id v15 = 0;
  }
  uint64_t v16 = [(PKSelectionInteraction *)self currentDrawing];
  long long v17 = [v16 uuid];
  uint64_t v18 = [v15 _attachmentForUUID:v17];

  if (isKindOfClass) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  if (isKindOfClass) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = v18;
  }
  if (v20 | v19)
  {
    uint64_t v21 = objc_opt_class();
    double v22 = PKDynamicCast(v21, (void *)v20);
    uint64_t v23 = objc_opt_class();
    double v24 = PKDynamicCast(v23, (void *)v19);
    uint64_t v25 = [(PKSelectionInteraction *)self selectionController];
    uint64_t v26 = (void *)v25;
    if (v25) {
      id v27 = objc_loadWeakRetained((id *)(v25 + 120));
    }
    else {
      id v27 = 0;
    }
    long long v28 = [(PKSelectionInteraction *)self currentDrawing];
    if (v27)
    {
      [v27 transformFromViewToStrokeSpaceInDrawing:v28];
      float64x2_t v70 = v78;
      float64x2_t v71 = v77;
      float64x2_t v72 = v79;
    }
    else
    {
      float64x2_t v71 = 0u;
      float64x2_t v72 = 0u;
      float64x2_t v70 = 0u;
    }

    if (v22) {
      long long v29 = v22;
    }
    else {
      long long v29 = v24;
    }
    id v30 = v29;
    uint64_t v31 = [(PKSelectionInteraction *)self delegate];
    char v32 = objc_opt_respondsToSelector();

    if (v32)
    {
      if (v20 && [(id)v20 isExternalAttachment])
      {
        v33 = [(PKSelectionInteraction *)self delegate];
        id v34 = [(id)v20 attachmentView];
        char v35 = objc_msgSend(v33, "selectionInteraction:handleTapOnCanvasAtLocation:inAttachment:", self, v34, v75, v76);

        if (v35) {
          goto LABEL_41;
        }
      }
      else
      {
        uint64_t v36 = [(PKSelectionInteraction *)self view];
        objc_msgSend(v30, "convertPoint:fromView:", v36, v75, v76);
        double v38 = v37;
        double v40 = v39;

        v41 = [(PKSelectionInteraction *)self delegate];
        char v42 = objc_msgSend(v41, "selectionInteraction:handleTapOnCanvasAtLocation:inAttachment:", self, v30, v38, v40);

        if (v42)
        {
LABEL_41:

          goto LABEL_42;
        }
      }
    }
    float64x2_t v73 = vaddq_f64(v72, vmlaq_n_f64(vmulq_n_f64(v70, v76), v71, v75));
    v43 = [(PKSelectionInteraction *)self selectionController];
    long long v44 = [(PKSelectionController *)v43 _externalElementsAtLocation:v73.f64[0] inAttachment:v73.f64[1]];

    uint64_t v45 = [v44 count];
    uint64_t v46 = [(PKSelectionInteraction *)self selectionController];
    long long v47 = (void *)v46;
    if (v45)
    {
      long long v48 = -[PKSelectionController _selectedExternalElementsInAttachment:](v46, (void *)v20);

      if (([v44 isEqualToOrderedSet:v48] & 1) == 0)
      {
        uint64_t v49 = [(PKSelectionInteraction *)self selectionController];
        long long v50 = (void *)v49;
        if (v49) {
          -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v49, 1, 0);
        }
      }
      long long v51 = [(PKSelectionInteraction *)self selectionController];
      long long v52 = [v44 firstObject];
      -[PKSelectionController _didTapElement:withGesture:inAttachment:](v51, v52, v8, (void *)v20);

LABEL_38:
LABEL_39:

LABEL_40:
      goto LABEL_41;
    }
    int v53 = -[PKSelectionController _hasStrokesOrExternalElementsSelectedInAttachment:](v46, (void *)v20);

    if (v53)
    {
      uint64_t v54 = [(PKSelectionInteraction *)self selectionController];
      long long v55 = (void *)v54;
      if (v54) {
        -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v54, 1, 0);
      }

      uint64_t v56 = [(PKSelectionInteraction *)self selectionController];
      long long v48 = (void *)v56;
      if (v56) {
        long long v57 = *(void **)(v56 + 144);
      }
      else {
        long long v57 = 0;
      }
      long long v51 = v57;
      [v51 invalidateCachedStrokes];
      goto LABEL_38;
    }
    if (v20)
    {
      uint64_t v58 = [(PKSelectionInteraction *)self selectionController];
      long long v59 = (void *)v58;
      v69 = v24;
      if (v58) {
        id v60 = objc_loadWeakRetained((id *)(v58 + 120));
      }
      else {
        id v60 = 0;
      }
      int v61 = [v60 editMenuVisible];

      if (v61)
      {
        [(PKSelectionInteraction *)self dismissEditMenuIfNecessary];
        long long v48 = [(id)v20 viewRep];
        [v48 becomeFirstResponder];
LABEL_61:
        double v24 = v69;
        goto LABEL_39;
      }
      uint64_t v66 = objc_opt_class();
      long long v48 = PKDynamicCast(v66, (void *)v20);
      v67 = [(PKSelectionInteraction *)self delegate];

      if (!v67 || !v48) {
        goto LABEL_61;
      }
      v65 = [(PKSelectionInteraction *)self selectionController];
      v68 = -[PKSelectionController topView](v65);
      objc_msgSend(v68, "_showEditMenuFromLocation:forAttachment:", v48, v75, v76);
    }
    else
    {
      if (!v19) {
        goto LABEL_40;
      }
      v62 = [(id)v19 attachmentContainerView];
      long long v48 = v62;
      if (v62
        && ([v62 isFirstResponder] & 1) == 0
        && ([v48 _isAncestorOfFirstResponder] & 1) == 0)
      {
        [v48 becomeFirstResponder];
        goto LABEL_39;
      }
      v69 = v24;
      v63 = [(PKSelectionInteraction *)self selectionController];
      uint64_t v64 = -[PKSelectionController topView](v63);
      int v74 = [v64 editMenuVisible];

      if (v74)
      {
        [(PKSelectionInteraction *)self dismissEditMenuIfNecessary];
        v65 = [(id)v19 viewRep];
        [v65 becomeFirstResponder];
LABEL_60:

        goto LABEL_61;
      }
      if (![(PKSelectionInteraction *)self gesturesAllowedForPaletteState]) {
        goto LABEL_61;
      }
      v65 = [(PKSelectionInteraction *)self selectionController];
      v68 = -[PKSelectionController topView](v65);
      objc_msgSend(v68, "_handleSingleTapAtLocation:forAttachment:", v19, v75, v76);
    }

    goto LABEL_60;
  }
LABEL_42:
}

- (void)dismissEditMenuIfNecessary
{
  uint64_t v3 = [(PKSelectionInteraction *)self selectionController];
  id v4 = (void *)v3;
  if (v3) {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  int v6 = [WeakRetained editMenuVisible];

  if (v6)
  {
    uint64_t v7 = [(PKSelectionInteraction *)self selectionController];
    double v8 = (void *)v7;
    if (v7) {
      -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v7, 1, 0);
    }

    uint64_t v9 = [(PKSelectionInteraction *)self selectionController];
    id v12 = (id)v9;
    if (v9) {
      id v10 = objc_loadWeakRetained((id *)(v9 + 120));
    }
    else {
      id v10 = 0;
    }
    double v11 = [v10 editMenuInteraction];
    [v11 dismissMenu];
  }
}

- (void)_didBeginSelection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKSelectionInteraction *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [v4 state];
  switch(v10)
  {
    case 3:
      if (-[PKSelectionInteraction _isLassoAddingSpace:](self, "_isLassoAddingSpace:", v7, v9)
        && ([(PKSelectionInteraction *)self selectionController],
            (uint64_t v19 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue()) != 0)
        && (int v20 = v19[114], v19, v20))
      {
        -[PKSelectionInteraction _didEndLassoAddingSpaceAtLocation:](self, "_didEndLassoAddingSpaceAtLocation:", v7, v9);
      }
      else
      {
        lassoPath = self->_lassoPath;
        [(PKSelectionInteraction *)self _drawingBeganLocation];
        -[UIBezierPath addLineToPoint:](lassoPath, "addLineToPoint:");
        [(UIBezierPath *)self->_lassoPath closePath];
        [(PKSelectionInteraction *)self _updateLiveLassoPath:[(UIBezierPath *)self->_lassoPath CGPath]];
        [(PKSelectionInteraction *)self _didEndLassoSelectionWithPath:self->_lassoPath];
      }
      double v24 = self->_lassoPath;
      self->_lassoPath = 0;

      goto LABEL_14;
    case 2:
      double v14 = [(PKSelectionInteraction *)self currentDrawing];
      -[PKSelectionInteraction clampInputPointForSelection:forDrawing:](self, "clampInputPointForSelection:forDrawing:", v14, v7, v9);
      double v16 = v15;
      double v18 = v17;

      -[UIBezierPath addLineToPoint:](self->_lassoPath, "addLineToPoint:", v16, v18);
LABEL_14:
      double v22 = [(UIBezierPath *)self->_lassoPath CGPath];
      uint64_t v21 = self;
      goto LABEL_15;
    case 1:
      -[PKSelectionInteraction set_drawingBeganLocation:](self, "set_drawingBeganLocation:", v7, v9);
      double v11 = [MEMORY[0x1E4FB14C0] bezierPath];
      id v12 = self->_lassoPath;
      self->_lassoPath = v11;

      -[UIBezierPath moveToPoint:](self->_lassoPath, "moveToPoint:", v7, v9);
      [(PKSelectionInteraction *)self _updateLiveLassoPath:[(UIBezierPath *)self->_lassoPath CGPath]];
      uint64_t v13 = -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:", v7, v9);
      [(PKSelectionInteraction *)self setCurrentDrawing:v13];

      goto LABEL_16;
  }
  if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    uint64_t v21 = self;
    double v22 = 0;
LABEL_15:
    [(PKSelectionInteraction *)v21 _updateLiveLassoPath:v22];
  }
LABEL_16:
  uint64_t v25 = [(PKSelectionInteraction *)self selectionController];
  uint64_t v26 = (void *)v25;
  if (v25) {
    id WeakRetained = objc_loadWeakRetained((id *)(v25 + 120));
  }
  else {
    id WeakRetained = 0;
  }

  if ((unint64_t)(v10 - 3) < 3)
  {
    id v27 = [WeakRetained delegate];
    char v28 = objc_opt_respondsToSelector();

    long long v29 = WeakRetained;
    if ((v28 & 1) == 0) {
      goto LABEL_25;
    }
    id v30 = [WeakRetained delegate];
    [v30 canvasViewDidEndLasso:WeakRetained];
    goto LABEL_24;
  }
  long long v29 = WeakRetained;
  if (v10 == 1)
  {
    uint64_t v31 = [WeakRetained delegate];
    char v32 = objc_opt_respondsToSelector();

    long long v29 = WeakRetained;
    if (v32)
    {
      id v30 = [WeakRetained delegate];
      [v30 canvasViewDidBeginLasso:WeakRetained];
LABEL_24:

      long long v29 = WeakRetained;
    }
  }
LABEL_25:
}

- (void)_updateLiveLassoPath:(CGPath *)a3
{
  lassoRenderer = self->_lassoRenderer;
  id v5 = [(PKSelectionInteraction *)self currentDrawing];
  -[PKSelectionRendering _renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:](lassoRenderer, "_renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:", a3, 0, v5, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (void)_didEndLassoSelectionWithPath:(id)a3
{
  id v4 = a3;
  id v6 = [(PKSelectionInteraction *)self currentDrawing];
  id v5 = [(PKSelectionInteraction *)self selectionController];
  -[PKSelectionController lassoSelectStrokesInDrawing:withPath:]((uint64_t)v5, v6, v4);
}

- (BOOL)_isLassoAddingSpace:(CGPoint)a3
{
  double x = a3.x;
  id v5 = [(PKSelectionInteraction *)self view];
  [v5 frame];
  double v7 = v6 * 0.1;

  double v8 = [(PKSelectionInteraction *)self view];
  [v8 frame];
  double v10 = v9;
  double v11 = [(PKSelectionInteraction *)self view];
  [v11 frame];
  double v13 = v10 + v12 - v7;

  [(PKSelectionInteraction *)self _drawingBeganLocation];
  BOOL v15 = v14 >= v7 || x <= v13;
  BOOL result = 1;
  if (v15)
  {
    if (x >= v7) {
      return 0;
    }
    [(PKSelectionInteraction *)self _drawingBeganLocation];
    if (v16 <= v13) {
      return 0;
    }
  }
  return result;
}

- (void)_didEndLassoAddingSpaceAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = +[PKStatisticsManager sharedStatisticsManager]();
  -[PKStatisticsManager recordInsertSpaceWithType:]((uint64_t)v6, 0);

  double v7 = [(PKSelectionInteraction *)self selectionController];
  [(PKSelectionController *)v7 didBeginSpaceInsertionWithLassoPath:x atLocation:y];
}

- (CGPoint)clampInputPointForSelection:(CGPoint)a3 forDrawing:(id)a4
{
  double y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  p_selectionController = &self->_selectionController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  int v10 = -[PKSelectionController shouldClampInputPoints]((uint64_t)WeakRetained);

  if (v7 && v10)
  {
    uint64_t v11 = [(PKSelectionInteraction *)self selectionController];
    double v12 = (void *)v11;
    if (v11) {
      id v13 = objc_loadWeakRetained((id *)(v11 + 120));
    }
    else {
      id v13 = 0;
    }
    double v14 = [v7 uuid];
    BOOL v15 = [v13 _attachmentForUUID:v14];

    double v16 = [v15 viewRep];
    double v17 = [v15 viewRep];
    [v17 bounds];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    uint64_t v26 = [(PKSelectionInteraction *)self selectionController];
    id v27 = (void *)v26;
    if (v26) {
      id v28 = objc_loadWeakRetained((id *)(v26 + 120));
    }
    else {
      id v28 = 0;
    }
    objc_msgSend(v16, "convertRect:toView:", v28, v19, v21, v23, v25);
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;

    v44.origin.CGFloat x = v30;
    v44.origin.double y = v32;
    v44.size.width = v34;
    v44.size.height = v36;
    double MinY = CGRectGetMinY(v44);
    v45.origin.CGFloat x = v30;
    v45.origin.double y = v32;
    v45.size.width = v34;
    v45.size.height = v36;
    double MaxY = CGRectGetMaxY(v45);
    if (fabs(MinY) != INFINITY && fabs(MaxY) != INFINITY)
    {
      if (y >= MinY)
      {
        id v39 = objc_loadWeakRetained((id *)p_selectionController);
        char v40 = -[PKSelectionController _liveDrawingIsAtEndOfDocument]((uint64_t)v39);

        if ((v40 & 1) == 0 && y > MaxY + -8.0) {
          double y = MaxY + -8.0;
        }
      }
      else
      {
        double y = MinY + 2.0;
      }
    }
  }
  double v41 = x;
  double v42 = y;
  result.double y = v42;
  result.CGFloat x = v41;
  return result;
}

- (void)_dismissEditMenuIfNecessary
{
  uint64_t v2 = [(PKSelectionInteraction *)self selectionController];
  id v5 = (id)v2;
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  id v4 = [WeakRetained editMenuInteraction];
  [v4 dismissMenu];
}

- (void)_selectViaContinuousTapWithInput:(id)a3
{
  id v4 = a3;
  [v4 location];
  id v5 = -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:");
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__PKSelectionInteraction__selectViaContinuousTapWithInput___block_invoke;
  v8[3] = &unk_1E64C80B8;
  id v9 = v4;
  int v10 = self;
  id v11 = v5;
  id v6 = v5;
  id v7 = v4;
  [(PKSelectionInteraction *)self _intersectedStrokesInDrawing:v6 forSelectionInput:v7 existingSelection:0 completion:v8];
}

void __59__PKSelectionInteraction__selectViaContinuousTapWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[PKSelectionStatisticsManager sharedStatisticsManager];
  objc_msgSend(v4, "recordSmartSelectionEventWithType:contentType:gestureInvoked:", objc_msgSend(*(id *)(a1 + 32), "selectionType"), objc_msgSend(v3, "contentType"), 1);

  id v5 = [*(id *)(a1 + 40) selectionController];
  id v6 = [v3 intersectedStrokes];

  uint64_t v7 = [*(id *)(a1 + 32) selectionType];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__PKSelectionInteraction__selectViaContinuousTapWithInput___block_invoke_2;
  void v9[3] = &unk_1E64C61C0;
  double v8 = *(void **)(a1 + 48);
  v9[4] = *(void *)(a1 + 40);
  -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:completion:](v5, v6, 0, v7, v8, v9);
}

uint64_t __59__PKSelectionInteraction__selectViaContinuousTapWithInput___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearLiveSelectionPath];
}

- (void)_didTapAndDrag:(id)a3
{
  id v4 = a3;
  [(PKSelectionInteraction *)self _dismissEditMenuIfNecessary];
  id v5 = [(UITapAndAHalfRecognizer *)self->_modifySelectionRecognizer touch];
  id v6 = [(PKSelectionInteraction *)self view];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  BOOL v11 = [v5 type] == 2;
  if ([v4 state] == 1)
  {
    [(UIPanGestureRecognizer *)self->_lassoGestureRecognizer setState:4];
    [(PKSelectionInteraction *)self _cancelDeferredPasteFromTappingAction];
    double v12 = -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:", v8, v10);
    [(PKSelectionInteraction *)self setCurrentDrawing:v12];

    [(PKSelectionInteraction *)self _resetVelocityWindow];
    [(PKSelectionGlowRenderer *)(uint64_t)self->_glowRenderer _willBeginDragKnobLocation:0 atPoint:v8 knobDragMode:v10];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
    if (WeakRetained && (uint64_t v14 = WeakRetained[16], WeakRetained, v14))
    {
      id v15 = objc_loadWeakRetained((id *)&self->_selectionController);
      double v16 = v15;
      if (v15) {
        double v17 = (void *)*((void *)v15 + 19);
      }
      else {
        double v17 = 0;
      }
      id v18 = v17;
      [v5 locationInView:v18];
      double v20 = v19;
      double v22 = v21;

      id v23 = objc_loadWeakRetained((id *)&self->_selectionController);
      double v24 = v23;
      if (v23) {
        double v25 = (void *)*((void *)v23 + 19);
      }
      else {
        double v25 = 0;
      }
      id v26 = v25;
      char v27 = objc_msgSend(v26, "containsPoint:forInputType:", v11, v20, v22);

      id v28 = os_log_create("com.apple.pencilkit", "Selection");
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
      if (v27)
      {
        if (v29)
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C44F8000, v28, OS_LOG_TYPE_DEBUG, "Should be adding to a current selection", buf, 2u);
        }
        int64_t v30 = 1;
      }
      else if (v29)
      {
        *(_WORD *)buf = 0;
        int64_t v30 = 2;
        _os_log_debug_impl(&dword_1C44F8000, v28, OS_LOG_TYPE_DEBUG, "Should be removing from a current selection", buf, 2u);
      }
      else
      {
        int64_t v30 = 2;
      }

      self->_int64_t modificationType = v30;
      id v40 = objc_loadWeakRetained((id *)&self->_selectionController);
      double v41 = v40;
      if (v40) {
        double v42 = (void *)*((void *)v40 + 16);
      }
      else {
        double v42 = 0;
      }
      id v43 = v42;
      CGRect v44 = [v43 strokes];
      initialStrokeSelectionBeforeModification = self->_initialStrokeSelectionBeforeModification;
      self->_initialStrokeSelectionBeforeModification = v44;

      id v46 = objc_loadWeakRetained((id *)&self->_selectionController);
      long long v47 = v46;
      if (v46) {
        long long v48 = (void *)*((void *)v46 + 16);
      }
      else {
        long long v48 = 0;
      }
      id v49 = v48;
      long long v50 = [v49 strokes];
      long long v51 = (NSMutableOrderedSet *)[v50 mutableCopy];
      smartSelectedStrokes = self->_smartSelectedStrokes;
      self->_smartSelectedStrokes = v51;

      id v53 = objc_loadWeakRetained((id *)&self->_selectionController);
      uint64_t v54 = v53;
      if (v53) {
        -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)v53, 1, 0);
      }
    }
    else
    {
      self->_int64_t modificationType = 1;
      long long v55 = [MEMORY[0x1E4F1CA70] orderedSet];
      uint64_t v56 = self->_smartSelectedStrokes;
      self->_smartSelectedStrokes = v55;
    }
    CGFloat v32 = +[PKSelectionInput inputWithType:location:inputType:](PKSelectionInput, "inputWithType:location:inputType:", 1, v11, v8, v10);
    [(PKSelectionInteraction *)self _updateSmartSelectionWithInput:v32 modificationType:self->_modificationType];
    goto LABEL_38;
  }
  if ([v4 state] == 2)
  {
    -[PKSelectionInteraction _updateVelocityWindowWithTouch:location:](self, "_updateVelocityWindowWithTouch:location:", v5, v8, v10);
    uint64_t v31 = -[PKSelectionInteraction _selectionTypeForVelocity:](self, "_selectionTypeForVelocity:");
    CGFloat v32 = +[PKSelectionInput inputWithType:location:inputType:](PKSelectionInput, "inputWithType:location:inputType:", v31, v11, v8, v10);
    [(PKSelectionInteraction *)self _updateSmartSelectionWithInput:v32 modificationType:self->_modificationType];
    int64_t modificationType = self->_modificationType;
    glowRenderer = self->_glowRenderer;
    uint64_t v35 = [v5 type];
    if (glowRenderer)
    {
      if (modificationType == 1) {
        unint64_t v36 = 1;
      }
      else {
        unint64_t v36 = 2;
      }
      glowRenderer->_knobDragMode = v36;
      [(PKSelectionGlowRenderer *)(uint64_t)glowRenderer _updateKnobAppearanceForDragAtKnobLocation:v36 point:v31 knobDragMode:v35 selectionType:v8 touchType:v10];
    }
    goto LABEL_38;
  }
  if ([v4 state] == 3)
  {
    if (self->_modificationType == 1) {
      unint64_t v38 = 1;
    }
    else {
      unint64_t v38 = 2;
    }
    [(PKSelectionGlowRenderer *)(uint64_t)self->_glowRenderer _didEndDragKnobLocation:0 knobDragMode:v38];
    CGFloat v32 = +[PKSelectionInput inputWithType:location:inputType:](PKSelectionInput, "inputWithType:location:inputType:", 1, v11, v8, v10);
    int64_t v39 = self->_modificationType;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __41__PKSelectionInteraction__didTapAndDrag___block_invoke;
    v57[3] = &unk_1E64C61E8;
    v57[4] = self;
    v57[5] = 1;
    [(PKSelectionInteraction *)self _updateSmartSelectionWithInput:v32 modificationType:v39 completion:v57];
LABEL_38:

    goto LABEL_39;
  }
  if ([v4 state] == 5 || objc_msgSend(v4, "state") == 4) {
    [(PKSelectionInteraction *)self _clearLiveSelectionPath];
  }
LABEL_39:
}

void __41__PKSelectionInteraction__didTapAndDrag___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) selectionController];
  id v3 = *(void **)(a1 + 32);
  id v4 = (void *)v3[40];
  id v5 = [v3 currentDrawing];
  uint64_t v6 = -[PKSelectionController contentTypeForIntersectedStrokes:inDrawing:]((uint64_t)v2, v4, v5);

  double v7 = +[PKSelectionStatisticsManager sharedStatisticsManager];
  [v7 recordSmartSelectionEventWithType:*(void *)(a1 + 40) contentType:v6 gestureInvoked:2];

  double v8 = [*(id *)(a1 + 32) selectionController];
  double v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  BOOL v11 = (void *)v9[40];
  double v12 = [v9 currentDrawing];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__PKSelectionInteraction__didTapAndDrag___block_invoke_2;
  v13[3] = &unk_1E64C61C0;
  v13[4] = *(void *)(a1 + 32);
  -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:completion:](v8, v11, 0, v10, v12, v13);
}

uint64_t __41__PKSelectionInteraction__didTapAndDrag___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearLiveSelectionPath];
}

- (void)_resetVelocityWindow
{
  self->_tapAndDragVelocityCount = 0;
  id v3 = [MEMORY[0x1E4F1CA48] array];
  tapAndDragVelocityArradouble y = self->_tapAndDragVelocityArray;
  self->_tapAndDragVelocityArradouble y = v3;
}

- (double)_updateVelocityWindowWithTouch:(id)a3 location:(CGPoint)a4
{
  [(PKSelectionInteraction *)self _timestampForTouch:a3];

  -[PKSelectionInteraction _updateVelocityWindowWithTimestamp:location:](self, "_updateVelocityWindowWithTimestamp:location:");
  return result;
}

- (double)_updateVelocityWindowWithTimestamp:(double)a3 location:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v8 = sqrt((a4.y - self->_lastDoubleTapAndDragLocation.y) * (a4.y - self->_lastDoubleTapAndDragLocation.y)+ (a4.x - self->_lastDoubleTapAndDragLocation.x) * (a4.x - self->_lastDoubleTapAndDragLocation.x))/ (a3 - self->_lastDoubleTapAndDragTimestamp);
  int64_t tapAndDragVelocityCount = self->_tapAndDragVelocityCount;
  self->_int64_t tapAndDragVelocityCount = tapAndDragVelocityCount + 1;
  if (tapAndDragVelocityCount < 20)
  {
    tapAndDragVelocityArraCGFloat y = self->_tapAndDragVelocityArray;
    double v12 = [NSNumber numberWithDouble:v8];
    [(NSMutableArray *)tapAndDragVelocityArray addObject:v12];
  }
  else
  {
    unint64_t v10 = (tapAndDragVelocityCount + 1) % 0x14uLL;
    BOOL v11 = self->_tapAndDragVelocityArray;
    double v12 = [NSNumber numberWithDouble:v8];
    [(NSMutableArray *)v11 replaceObjectAtIndex:v10 withObject:v12];
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v14 = self->_tapAndDragVelocityArray;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    double v18 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "floatValue", (void)v23);
        double v18 = v18 + v20;
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }
  else
  {
    double v18 = 0.0;
  }

  int64_t v21 = self->_tapAndDragVelocityCount;
  double result = v18 / fmin((double)v21, 20.0);
  if (v21 < 10) {
    double result = 500.0;
  }
  self->_lastDoubleTapAndDragLocation.CGFloat x = x;
  self->_lastDoubleTapAndDragLocation.CGFloat y = y;
  self->_lastDoubleTapAndDragTimestamp = a3;
  return result;
}

- (int64_t)_selectionTypeForVelocity:(double)a3
{
  if (a3 <= 500.0) {
    return 1;
  }
  if (a3 <= 1200.0) {
    return 2;
  }
  return 3;
}

- (id)_visibleOnscreenStrokesForDrawing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKSelectionInteraction *)self selectionController];
  uint64_t v6 = (void *)v5;
  if (v5) {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  double v8 = [v4 uuid];

  double v9 = [WeakRetained _attachmentForUUID:v8];

  unint64_t v10 = [v9 strokeSpatialCache];
  BOOL v11 = v10;
  if (v10) {
    unint64_t v10 = (void *)v10[3];
  }
  double v12 = v10;

  return v12;
}

- (int64_t)_updateSmartSelectionWithInput:(id)a3 modificationType:(int64_t)a4 completion:(id)a5
{
  return -[PKSelectionInteraction _updateSmartSelectionWithInput:modificationType:liveScrollOffset:completion:](self, "_updateSmartSelectionWithInput:modificationType:liveScrollOffset:completion:", a3, a4, a5, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (int64_t)_updateSmartSelectionWithInput:(id)a3 modificationType:(int64_t)a4
{
  return -[PKSelectionInteraction _updateSmartSelectionWithInput:modificationType:liveScrollOffset:completion:](self, "_updateSmartSelectionWithInput:modificationType:liveScrollOffset:completion:", a3, a4, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (int64_t)_updateSmartSelectionWithInput:(id)a3 modificationType:(int64_t)a4 liveScrollOffset:(CGPoint)a5 completion:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  [v11 location];
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = [(PKSelectionInteraction *)self currentDrawing];
  -[PKSelectionInteraction _pointFromViewToStrokeSpace:inDrawing:](self, "_pointFromViewToStrokeSpace:inDrawing:", v17, v14, v16);
  double v19 = v18;
  double v21 = v20;

  double v22 = [(PKSelectionInteraction *)self currentDrawing];
  long long v23 = [(PKSelectionInteraction *)self _visibleOnscreenStrokesForDrawing:v22];
  long long v24 = +[PKClusteringUtility _geometricBasedStrokeClusteringFromPoint:visibleStrokes:selectionType:inputType:](PKClusteringUtility, "_geometricBasedStrokeClusteringFromPoint:visibleStrokes:selectionType:inputType:", v23, 1, [v11 inputType], v19, v21);

  if (a4 == 3)
  {
    if (![v24 count])
    {
      int64_t v30 = 0;
      a4 = 3;
      goto LABEL_17;
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v44;
      a4 = 2;
LABEL_5:
      uint64_t v29 = 0;
      while (1)
      {
        if (*(void *)v44 != v28) {
          objc_enumerationMutation(v25);
        }
        if ([(NSMutableOrderedSet *)self->_smartSelectedStrokes containsObject:*(void *)(*((void *)&v43 + 1) + 8 * v29)])break; {
        if (v27 == ++v29)
        }
        {
          uint64_t v27 = [v25 countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v27) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      a4 = 1;
    }
  }
  if (a4 == 2) {
    int64_t v30 = 2;
  }
  else {
    int64_t v30 = a4 == 1;
  }
LABEL_17:
  glowRenderer = self->_glowRenderer;
  smartSelectedStrokes = self->_smartSelectedStrokes;
  double v33 = [(PKSelectionInteraction *)self currentDrawing];
  -[PKSelectionGlowRenderer _renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:](glowRenderer, "_renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:", 0, smartSelectedStrokes, v33, x, y);

  CGFloat v34 = [(PKSelectionInteraction *)self currentDrawing];
  uint64_t v35 = [(NSMutableOrderedSet *)self->_smartSelectedStrokes array];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __102__PKSelectionInteraction__updateSmartSelectionWithInput_modificationType_liveScrollOffset_completion___block_invoke;
  v38[3] = &unk_1E64C80E0;
  id v39 = v12;
  int64_t v40 = a4;
  double v41 = x;
  double v42 = y;
  v38[4] = self;
  id v36 = v12;
  [(PKSelectionInteraction *)self _intersectedStrokesInDrawing:v34 forSelectionInput:v11 existingSelection:v35 completion:v38];

  return v30;
}

void __102__PKSelectionInteraction__updateSmartSelectionWithInput_modificationType_liveScrollOffset_completion___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  if (!*(void *)(*(void *)(a1 + 32) + 320))
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA70] orderedSet];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 320);
    *(void *)(v4 + 320) = v3;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6 == 2)
  {
    double v9 = *(void **)(*(void *)(a1 + 32) + 320);
    double v8 = [v16 intersectedStrokes];
    [v9 minusOrderedSet:v8];
    goto LABEL_7;
  }
  if (v6 == 1)
  {
    double v7 = *(void **)(*(void *)(a1 + 32) + 320);
    double v8 = [v16 intersectedStrokes];
    [v7 unionOrderedSet:v8];
LABEL_7:
  }
  unint64_t v10 = *(void **)(a1 + 32);
  if (v10[40] && [v10 _liveSelectionGestureStillActive])
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = (void *)v11[2];
    uint64_t v13 = v11[40];
    double v14 = [v11 currentDrawing];
    objc_msgSend(v12, "_renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:", 0, v13, v14, *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(void))(v15 + 16))();
  }
}

- (void)_updateProgressiveTapSelectionWithSelectionInput:(id)a3 existingSelection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(PKSelectionInteraction *)self currentDrawing];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__PKSelectionInteraction__updateProgressiveTapSelectionWithSelectionInput_existingSelection___block_invoke;
  void v9[3] = &unk_1E64C8108;
  v9[4] = self;
  [(PKSelectionInteraction *)self _intersectedStrokesInDrawing:v8 forSelectionInput:v7 existingSelection:v6 completion:v9];
}

void __93__PKSelectionInteraction__updateProgressiveTapSelectionWithSelectionInput_existingSelection___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 intersectedStrokes];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 16);
    id v6 = [v8 intersectedStrokes];
    id v7 = [*(id *)(a1 + 32) currentDrawing];
    objc_msgSend(v5, "_renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:", 0, v6, v7, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
}

- (void)_intersectedStrokesInDrawing:(id)a3 forSelectionInput:(id)a4 existingSelection:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = [v10 strokes];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    [v11 location];
    -[PKSelectionInteraction _pointFromViewToStrokeSpace:inDrawing:](self, "_pointFromViewToStrokeSpace:inDrawing:", v10);
    double v17 = v16;
    double v19 = v18;
    double v20 = [(PKSelectionInteraction *)self selectionController];
    uint64_t v21 = [v11 selectionType];
    uint64_t v22 = [v11 inputType];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __102__PKSelectionInteraction__intersectedStrokesInDrawing_forSelectionInput_existingSelection_completion___block_invoke;
    v24[3] = &unk_1E64C8130;
    id v25 = v13;
    [(PKSelectionController *)(uint64_t)v20 fetchStrokesToSelectAtPoint:v21 inDrawing:v22 withSelectionType:v12 inputType:v24 existingSelection:v17 completion:v19];
  }
  else
  {
    long long v23 = +[PKIntersectionResult noResult];
    (*((void (**)(id, void *))v13 + 2))(v13, v23);
  }
}

uint64_t __102__PKSelectionInteraction__intersectedStrokesInDrawing_forSelectionInput_existingSelection_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_pressAndHoldLinearExpand:(id)a3
{
  id v4 = a3;
  [(PKSelectionInteraction *)self _dismissEditMenuIfNecessary];
  uint64_t v5 = [(UILongPressGestureRecognizer *)self->_tapAndHoldToSelectLongPressGestureRecognizer touches];
  id v6 = [v5 firstObject];

  id v7 = [(PKSelectionInteraction *)self view];
  [v6 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  BOOL v12 = [v6 type] == 2;
  if ([v4 state] == 1)
  {
    if (-[PKSelectionInteraction _didLongPressExternalElementAtLocation:](self, "_didLongPressExternalElementAtLocation:", v9, v11)|| !-[PKSelectionInteraction hasStrokesAtLocation:](self, "hasStrokesAtLocation:", v9, v11))
    {
      [v4 setState:5];
    }
    else
    {
      [(UIPanGestureRecognizer *)self->_lassoGestureRecognizer setState:4];
      id v13 = -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:", v9, v11);
      [(PKSelectionInteraction *)self setCurrentDrawing:v13];

      [(PKSelectionInteraction *)self _resetVelocityWindow];
      *(_OWORD *)&self->_int64_t currentlyDraggedKnob = xmmword_1C482A1D0;
      double v14 = [(PKSelectionInteraction *)self currentDrawing];
      -[PKSelectionInteraction _pointFromViewToStrokeSpace:inDrawing:](self, "_pointFromViewToStrokeSpace:inDrawing:", v14, v9, v11);
      self->_undraggedKnobLocationInStrokeSpace.double x = v15;
      self->_undraggedKnobLocationInStrokeSpace.double y = v16;

      [(PKSelectionGlowRenderer *)(uint64_t)self->_glowRenderer _willBeginDragKnobLocation:self->_knobDragMode atPoint:v9 knobDragMode:v11];
      double v17 = [MEMORY[0x1E4F1CA70] orderedSet];
      smartSelectedStrokes = self->_smartSelectedStrokes;
      self->_smartSelectedStrokes = v17;

      self->_int64_t modificationType = 1;
      self->_currentScrollOffset = (CGPoint)*MEMORY[0x1E4F1DAD8];
      double v19 = +[PKSelectionInput inputWithType:location:inputType:](PKSelectionInput, "inputWithType:location:inputType:", 2, v12, v9, v11);
      int64_t modificationType = self->_modificationType;
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __52__PKSelectionInteraction__pressAndHoldLinearExpand___block_invoke;
      v86[3] = &unk_1E64C61C0;
      v86[4] = self;
      [(PKSelectionInteraction *)self _updateSmartSelectionWithInput:v19 modificationType:modificationType completion:v86];
    }
    goto LABEL_37;
  }
  if ([v4 state] == 2)
  {
    uint64_t v21 = [(PKSelectionInteraction *)self selectionController];
    double v22 = [(PKSelectionController *)(uint64_t)v21 autoscrollForPointIfNecessary:v11];
    double v24 = v23;

    CGFloat v25 = v24 + self->_currentScrollOffset.y;
    self->_currentScrollOffset.double x = v22 + self->_currentScrollOffset.x;
    self->_currentScrollOffset.double y = v25;
    if (!self->_initialStrokeSelectionBeforeModification) {
      goto LABEL_37;
    }
    +[PKDrawing _boundingBoxForStrokes:](PKDrawing, "_boundingBoxForStrokes:");
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    if (-[PKSelectionInteraction _locationShouldFlipOverLeftKnob:](self, "_locationShouldFlipOverLeftKnob:", v9, v11))
    {
      int64_t v34 = 0;
      uint64_t v35 = 1;
    }
    else
    {
      if (!-[PKSelectionInteraction _locationShouldFlipOverRightKnob:](self, "_locationShouldFlipOverRightKnob:", v9, v11))goto LABEL_18; {
      uint64_t v35 = 0;
      }
      int64_t v34 = 1;
    }
    self->_int64_t currentlyDraggedKnob = v34;
    -[PKSelectionInteraction _undraggedKnobLocation:forInitialStrokeBounds:](self, "_undraggedKnobLocation:forInitialStrokeBounds:", v35, v27, v29, v31, v33);
    self->_undraggedKnobLocationInStrokeSpace.double x = v38;
    self->_undraggedKnobLocationInStrokeSpace.double y = v39;
LABEL_18:
    +[PKDrawing _boundingBoxForStrokeArray:self->_firstStrokesInInitialStrokes];
    CGFloat v80 = v40;
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v77 = v45;
    +[PKDrawing _boundingBoxForStrokeArray:self->_lastStrokesInInitialStrokes];
    CGFloat v47 = v46;
    CGFloat v49 = v48;
    CGFloat v51 = v50;
    CGFloat v53 = v52;
    CGFloat v75 = v52;
    CGFloat v76 = v42;
    CGFloat v73 = v46;
    CGFloat v74 = v48;
    if ([(PKSelectionInteraction *)self isLTR])
    {
      v87.origin.double x = v47;
      v87.origin.double y = v49;
      v87.size.width = v51;
      v87.size.height = v53;
      double MaxX = CGRectGetMaxX(v87);
      v88.origin.double x = v47;
      v88.origin.double y = v49;
      v88.size.width = v51;
      v88.size.height = v53;
      double MaxY = CGRectGetMaxY(v88);
    }
    else
    {
      v89.origin.double x = v80;
      v89.origin.double y = v42;
      v89.size.width = v44;
      v89.size.height = v77;
      double MaxX = CGRectGetMaxX(v89);
      v90.origin.double x = v80;
      v90.size.height = v77;
      v90.origin.double y = v42;
      v90.size.width = v44;
      double MaxY = CGRectGetMinY(v90);
    }
    double v55 = MaxY;
    CGFloat v56 = v44;
    if ([(PKSelectionInteraction *)self isLTR])
    {
      v91.origin.double x = v80;
      v91.origin.double y = v76;
      v91.size.width = v44;
      v91.size.height = v77;
      double MinX = CGRectGetMinX(v91);
      v92.origin.double x = v80;
      v92.origin.double y = v76;
      v92.size.width = v56;
      v92.size.height = v77;
      double MinY = CGRectGetMinY(v92);
    }
    else
    {
      v93.origin.double x = v73;
      v93.origin.double y = v74;
      v93.size.width = v51;
      v93.size.height = v75;
      double MinX = CGRectGetMinX(v93);
      v94.origin.double x = v73;
      v94.origin.double y = v74;
      v94.size.width = v51;
      v94.size.height = v75;
      double MinY = CGRectGetMaxY(v94);
    }
    int64_t currentlyDraggedKnob = self->_currentlyDraggedKnob;
    if (currentlyDraggedKnob) {
      double v60 = MinY;
    }
    else {
      double v60 = v55;
    }
    if (currentlyDraggedKnob) {
      double v61 = MinX;
    }
    else {
      double v61 = MaxX;
    }
    double v79 = v61;
    double v81 = v60;
    uint64_t v62 = [(PKSelectionInteraction *)self selectionController];
    v63 = (void *)v62;
    if (v62) {
      id WeakRetained = objc_loadWeakRetained((id *)(v62 + 120));
    }
    else {
      id WeakRetained = 0;
    }
    v65 = [(PKSelectionInteraction *)self currentDrawing];
    if (WeakRetained)
    {
      [WeakRetained transformFromStrokeSpaceToViewInDrawing:v65];
      double v66 = *((double *)&v83 + 1);
      double v67 = *(double *)&v83;
      double v69 = *((double *)&v84 + 1);
      double v68 = *(double *)&v84;
      double v71 = v85[1];
      double v70 = v85[0];
    }
    else
    {
      long long v84 = 0u;
      *(_OWORD *)v85 = 0u;
      long long v83 = 0u;
      double v71 = 0.0;
      double v69 = 0.0;
      double v66 = 0.0;
      double v70 = 0.0;
      double v68 = 0.0;
      double v67 = 0.0;
    }

    -[PKSelectionInteraction _updateSmartSelectionWithDragToLocation:liveScrollOffset:initialSelectedWord:completion:](self, "_updateSmartSelectionWithDragToLocation:liveScrollOffset:initialSelectedWord:completion:", self->_initialStrokeSelectionBeforeModification, 0, v9, v11, self->_currentScrollOffset.x, self->_currentScrollOffset.y);
    glowRenderer = self->_glowRenderer;
    if (glowRenderer) {
      -[PKSelectionGlowRenderer _updateKnobAppearanceForDragAtKnobLocation:point:otherKnobPoint:selectionType:touchType:]((uint64_t)glowRenderer, self->_currentlyDraggedKnob, v9, v11, v70 + v81 * v68 + v67 * v79, v71 + v81 * v69 + v66 * v79);
    }
    goto LABEL_37;
  }
  if ([v4 state] == 3)
  {
    [(PKSelectionGlowRenderer *)(uint64_t)self->_glowRenderer _didEndDragKnobLocation:self->_currentlyDraggedKnob knobDragMode:self->_knobDragMode];
    initialStrokeSelectionBeforeModification = self->_initialStrokeSelectionBeforeModification;
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __52__PKSelectionInteraction__pressAndHoldLinearExpand___block_invoke_2;
    v82[3] = &unk_1E64C8158;
    v82[4] = self;
    -[PKSelectionInteraction _updateSmartSelectionWithDragToLocation:liveScrollOffset:initialSelectedWord:completion:](self, "_updateSmartSelectionWithDragToLocation:liveScrollOffset:initialSelectedWord:completion:", initialStrokeSelectionBeforeModification, v82, v9, v11, self->_currentScrollOffset.x, self->_currentScrollOffset.y);
  }
  else if ([v4 state] == 5 || objc_msgSend(v4, "state") == 4)
  {
    [(PKSelectionInteraction *)self _clearLiveSelectionPath];
  }
LABEL_37:
}

uint64_t __52__PKSelectionInteraction__pressAndHoldLinearExpand___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _liveSelectionGestureStillActive];
  if (result)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 328), *(id *)(*(void *)(a1 + 32) + 320));
    [*(id *)(a1 + 32) _calculateFirstAndLastStrokeForKnobPlacement];
    +[PKDrawing _boundingBoxForStrokes:*(void *)(*(void *)(a1 + 32) + 328)];
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t result = objc_msgSend(v3, "_undraggedKnobLocation:forInitialStrokeBounds:", 0);
    v3[18] = v4;
    v3[19] = v5;
  }
  return result;
}

void __52__PKSelectionInteraction__pressAndHoldLinearExpand___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 selectionController];
  id v6 = [*(id *)(a1 + 32) currentDrawing];
  uint64_t v7 = -[PKSelectionController contentTypeForIntersectedStrokes:inDrawing:]((uint64_t)v5, v4, v6);

  double v8 = +[PKSelectionStatisticsManager sharedStatisticsManager];
  [v8 recordSmartSelectionEventWithType:2 contentType:v7 gestureInvoked:3];

  double v9 = [*(id *)(a1 + 32) selectionController];
  double v10 = [*(id *)(a1 + 32) currentDrawing];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__PKSelectionInteraction__pressAndHoldLinearExpand___block_invoke_3;
  v11[3] = &unk_1E64C61C0;
  v11[4] = *(void *)(a1 + 32);
  -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:completion:](v9, v4, 0, 2, v10, v11);
}

void __52__PKSelectionInteraction__pressAndHoldLinearExpand___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelDeferredPasteFromTappingAction];
  uint64_t v2 = [*(id *)(a1 + 32) selectionController];
  uint64_t v3 = (void *)v2;
  if (v2) {
    id v4 = *(void **)(v2 + 152);
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  [v5 toggleEditMenu];

  [*(id *)(a1 + 32) _clearLiveSelectionPath];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 328);
  *(void *)(v6 + 328) = 0;
}

- (CGPoint)_undraggedKnobLocation:(int64_t)a3 forInitialStrokeBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  BOOL v9 = [(PKSelectionInteraction *)self isLTR];
  BOOL v10 = v9;
  CGFloat v11 = x;
  CGFloat v12 = y;
  CGFloat v13 = width;
  CGFloat v14 = height;
  if (a3 == 1)
  {
    CGFloat MaxX = CGRectGetMaxX(*(CGRect *)&v11);
    if (v10) {
      goto LABEL_8;
    }
  }
  else
  {
    if (!v9)
    {
      CGFloat MaxX = CGRectGetMinX(*(CGRect *)&v11);
LABEL_8:
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      double MaxY = CGRectGetMaxY(v21);
      goto LABEL_9;
    }
    CGFloat MaxX = CGRectGetMinX(*(CGRect *)&v11);
  }
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double MaxY = CGRectGetMinY(v20);
LABEL_9:
  double v17 = MaxY;
  double v18 = MaxX;
  result.CGFloat y = v17;
  result.CGFloat x = v18;
  return result;
}

- (BOOL)_didLongPressExternalElementAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:");
  uint64_t v7 = [(PKSelectionInteraction *)self selectionController];
  double v8 = (void *)v7;
  if (v7) {
    id WeakRetained = objc_loadWeakRetained((id *)(v7 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  BOOL v10 = [v6 uuid];
  CGFloat v11 = [WeakRetained _attachmentForUUID:v10];

  -[PKSelectionInteraction _pointFromViewToStrokeSpace:inDrawing:](self, "_pointFromViewToStrokeSpace:inDrawing:", v6, x, y);
  double v13 = v12;
  double v15 = v14;
  CGFloat v16 = [(PKSelectionInteraction *)self selectionController];
  double v17 = [(PKSelectionController *)v16 _externalElementsAtLocation:v13 inAttachment:v15];

  if ([v17 count])
  {
    double v18 = [(PKSelectionInteraction *)self selectionController];
    double v19 = [v17 firstObject];
    unsigned __int8 v20 = -[PKSelectionController _didLongPressElement:withGesture:inAttachment:](v18, v19, 0, v11);
  }
  else
  {
    unsigned __int8 v20 = 0;
  }

  return v20;
}

- (void)_calculateFirstAndLastStrokeForKnobPlacement
{
  uint64_t v3 = [(PKSelectionInteraction *)self _firstStrokesInStrokes:self->_initialStrokeSelectionBeforeModification];
  firstStrokesInInitialStrokes = self->_firstStrokesInInitialStrokes;
  self->_firstStrokesInInitialStrokes = v3;

  id v5 = [(PKSelectionInteraction *)self _lastStrokesInStrokes:self->_initialStrokeSelectionBeforeModification];
  lastStrokesInInitialStrokes = self->_lastStrokesInInitialStrokes;
  self->_lastStrokesInInitialStrokes = v5;

  uint64_t v7 = self->_firstStrokesInInitialStrokes;
  if (!v7 || ![(NSArray *)v7 count])
  {
    if ([(PKSelectionInteraction *)self isLTR]) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
    BOOL v9 = [(PKSelectionInteraction *)self _closestStrokesToCorner:v8 fromStrokes:self->_initialStrokeSelectionBeforeModification];
    BOOL v10 = self->_firstStrokesInInitialStrokes;
    self->_firstStrokesInInitialStrokes = v9;
  }
  CGFloat v11 = self->_lastStrokesInInitialStrokes;
  if (!v11 || ![(NSArray *)v11 count])
  {
    if ([(PKSelectionInteraction *)self isLTR]) {
      uint64_t v12 = 8;
    }
    else {
      uint64_t v12 = 4;
    }
    double v13 = [(PKSelectionInteraction *)self _closestStrokesToCorner:v12 fromStrokes:self->_initialStrokeSelectionBeforeModification];
    double v14 = self->_lastStrokesInInitialStrokes;
    self->_lastStrokesInInitialStrokes = v13;
  }
}

- (id)_closestStrokesToCorner:(unint64_t)a3 fromStrokes:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  +[PKDrawing _boundingBoxForStrokes:v5];
  double PointFromCorner = DKDRectGetPointFromCorner(a3, v7, v8, v9, v10);
  double v13 = v12;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    double v17 = 0;
    uint64_t v18 = *(void *)v32;
    double v19 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v14);
        }
        CGRect v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_msgSend(v21, "_bounds", (void)v31);
        double v26 = DKDRectGetPointFromCorner(a3, v22, v23, v24, v25);
        double v28 = (v27 - v13) * (v27 - v13) + (v26 - PointFromCorner) * (v26 - PointFromCorner);
        if (v28 < v19)
        {
          id v29 = v21;

          double v17 = v29;
          double v19 = v28;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v16);

    if (v17) {
      [v6 addObject:v17];
    }
  }
  else
  {

    double v17 = 0;
  }

  return v6;
}

- (void)_updateUndraggedKnobLocationForKnobDrag
{
  +[PKDrawing _boundingBoxForStrokeArray:self->_firstStrokesInInitialStrokes];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  +[PKDrawing _boundingBoxForStrokeArray:self->_lastStrokesInInitialStrokes];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  int64_t currentlyDraggedKnob = self->_currentlyDraggedKnob;
  if (currentlyDraggedKnob == 1)
  {
    int64_t knobDragMode = self->_knobDragMode;
    BOOL v24 = [(PKSelectionInteraction *)self isLTR];
    if (knobDragMode != 4)
    {
      if (!v24)
      {
        v47.origin.double x = v4;
        v47.origin.double y = v6;
        v47.size.CGFloat width = v8;
        v47.size.CGFloat height = v10;
        double MaxX = CGRectGetMaxX(v47);
        goto LABEL_21;
      }
      v43.origin.double x = v12;
      v43.origin.double y = v14;
      v43.size.CGFloat width = v16;
      v43.size.CGFloat height = v18;
      double v27 = CGRectGetMaxX(v43);
      goto LABEL_14;
    }
    if (!v24)
    {
      v45.origin.double x = v12;
      v45.origin.double y = v14;
      v45.size.CGFloat width = v16;
      v45.size.CGFloat height = v18;
      double MinX = CGRectGetMinX(v45);
      goto LABEL_16;
    }
    v41.origin.double x = v4;
    v41.origin.double y = v6;
    v41.size.CGFloat width = v8;
    v41.size.CGFloat height = v10;
    double v25 = CGRectGetMinX(v41);
LABEL_18:
    double v37 = v25;
    CGFloat v29 = v4;
    CGFloat v30 = v6;
    CGFloat v31 = v8;
    CGFloat v32 = v10;
    CGFloat v28 = v37;
    goto LABEL_19;
  }
  if (currentlyDraggedKnob) {
    return;
  }
  int64_t v20 = self->_knobDragMode;
  BOOL v21 = [(PKSelectionInteraction *)self isLTR];
  if (v20 != 4)
  {
    if (v21)
    {
      v42.origin.double x = v12;
      v42.origin.double y = v14;
      v42.size.CGFloat width = v16;
      v42.size.CGFloat height = v18;
      double MinX = CGRectGetMaxX(v42);
LABEL_16:
      CGFloat v28 = MinX;
      CGFloat v33 = v12;
      CGFloat v34 = v14;
      CGFloat v35 = v16;
      CGFloat v36 = v18;
LABEL_22:
      double MaxY = CGRectGetMaxY(*(CGRect *)&v33);
      goto LABEL_23;
    }
    v46.origin.double x = v4;
    v46.origin.double y = v6;
    v46.size.CGFloat width = v8;
    v46.size.CGFloat height = v10;
    double v25 = CGRectGetMaxX(v46);
    goto LABEL_18;
  }
  if (v21)
  {
    v40.origin.double x = v4;
    v40.origin.double y = v6;
    v40.size.CGFloat width = v8;
    v40.size.CGFloat height = v10;
    double MaxX = CGRectGetMinX(v40);
LABEL_21:
    double v39 = MaxX;
    CGFloat v33 = v4;
    CGFloat v34 = v6;
    CGFloat v35 = v8;
    CGFloat v36 = v10;
    CGFloat v28 = v39;
    goto LABEL_22;
  }
  v44.origin.double x = v12;
  v44.origin.double y = v14;
  v44.size.CGFloat width = v16;
  v44.size.CGFloat height = v18;
  double v27 = CGRectGetMinX(v44);
LABEL_14:
  CGFloat v28 = v27;
  CGFloat v29 = v12;
  CGFloat v30 = v14;
  CGFloat v31 = v16;
  CGFloat v32 = v18;
LABEL_19:
  double MaxY = CGRectGetMinY(*(CGRect *)&v29);
LABEL_23:
  self->_undraggedKnobLocationInStrokeSpace.double x = v28;
  self->_undraggedKnobLocationInStrokeSpace.double y = MaxY;
}

- (void)_didDragKnob:(id)a3
{
  id v4 = a3;
  double v5 = [(PKSelectionInteraction *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  if ([v4 state] == 1)
  {
    int64_t v10 = 3;
    if (self->_currentlyDraggedKnob) {
      int64_t v10 = 4;
    }
    self->_int64_t knobDragMode = v10;
    double v11 = -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:", v7, v9);
    [(PKSelectionInteraction *)self setCurrentDrawing:v11];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
    double v13 = WeakRetained;
    if (WeakRetained) {
      CGFloat v14 = (void *)*((void *)WeakRetained + 16);
    }
    else {
      CGFloat v14 = 0;
    }
    id v15 = v14;
    CGFloat v16 = [v15 strokes];
    initialStrokeSelectionBeforeModification = self->_initialStrokeSelectionBeforeModification;
    self->_initialStrokeSelectionBeforeModification = v16;

    id v18 = objc_loadWeakRetained((id *)&self->_selectionController);
    double v19 = v18;
    if (v18) {
      int64_t v20 = (void *)*((void *)v18 + 16);
    }
    else {
      int64_t v20 = 0;
    }
    id v21 = v20;
    CGFloat v22 = [v21 strokes];
    CGFloat v23 = (NSMutableOrderedSet *)[v22 mutableCopy];
    smartSelectedStrokes = self->_smartSelectedStrokes;
    self->_smartSelectedStrokes = v23;

    id v25 = objc_loadWeakRetained((id *)&self->_selectionController);
    -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)v25, 0, 0);

    [(PKSelectionInteraction *)self _calculateFirstAndLastStrokeForKnobPlacement];
    [(PKSelectionInteraction *)self _updateUndraggedKnobLocationForKnobDrag];
    self->_currentScrollOffset = (CGPoint)*MEMORY[0x1E4F1DAD8];
    [(PKSelectionGlowRenderer *)(uint64_t)self->_glowRenderer _willBeginDragKnobLocation:self->_knobDragMode atPoint:v7 knobDragMode:v9];
    double x = self->_currentScrollOffset.x;
    double y = self->_currentScrollOffset.y;
    CGFloat v28 = self;
    double v29 = v7;
    double v30 = v9;
    CGFloat v31 = 0;
    goto LABEL_9;
  }
  if ([v4 state] == 2)
  {
    int64_t currentlyDraggedKnob = self->_currentlyDraggedKnob;
    if (currentlyDraggedKnob == 1)
    {
      if (-[PKSelectionInteraction _locationShouldFlipOverLeftKnob:](self, "_locationShouldFlipOverLeftKnob:", v7, v9))
      {
        int64_t v33 = 0;
        goto LABEL_22;
      }
      int64_t currentlyDraggedKnob = self->_currentlyDraggedKnob;
    }
    if (currentlyDraggedKnob
      || !-[PKSelectionInteraction _locationShouldFlipOverRightKnob:](self, "_locationShouldFlipOverRightKnob:", v7, v9))
    {
      goto LABEL_23;
    }
    int64_t v33 = 1;
LABEL_22:
    self->_int64_t currentlyDraggedKnob = v33;
    [(PKSelectionInteraction *)self _updateUndraggedKnobLocationForKnobDrag];
LABEL_23:
    uint64_t v35 = [(PKSelectionInteraction *)self selectionController];
    CGFloat v36 = (void *)v35;
    if (v35) {
      id v37 = objc_loadWeakRetained((id *)(v35 + 120));
    }
    else {
      id v37 = 0;
    }
    CGFloat v38 = [(PKSelectionInteraction *)self currentDrawing];
    if (v37)
    {
      [v37 transformFromStrokeSpaceToViewInDrawing:v38];
      double v39 = *(double *)&v55;
      double v40 = *(double *)&v56;
      double v49 = *(double *)&v54;
      double v50 = *((double *)&v55 + 1);
      double v51 = *((double *)&v54 + 1);
      double v52 = *((double *)&v56 + 1);
    }
    else
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v54 = 0u;
      double v51 = 0.0;
      double v52 = 0.0;
      double v49 = 0.0;
      double v50 = 0.0;
      double v40 = 0.0;
      double v39 = 0.0;
    }
    double v41 = self->_undraggedKnobLocationInStrokeSpace.x;
    double v42 = self->_undraggedKnobLocationInStrokeSpace.y;

    CGRect v43 = [(PKSelectionInteraction *)self selectionController];
    double v44 = [(PKSelectionController *)(uint64_t)v43 autoscrollForPointIfNecessary:v9];
    double v46 = v45;

    CGFloat v47 = v46 + self->_currentScrollOffset.y;
    self->_currentScrollOffset.double x = v44 + self->_currentScrollOffset.x;
    self->_currentScrollOffset.double y = v47;
    [(PKSelectionInteraction *)self _updateSmartSelectionWithDragToLocation:0 liveScrollOffset:v7 completion:v9];
    glowRenderer = self->_glowRenderer;
    if (glowRenderer) {
      -[PKSelectionGlowRenderer _updateKnobAppearanceForDragAtKnobLocation:point:otherKnobPoint:selectionType:touchType:]((uint64_t)glowRenderer, self->_currentlyDraggedKnob, v7, v9, v40 + v39 * v42 + v49 * v41, v52 + v50 * v42 + v51 * v41);
    }
    goto LABEL_30;
  }
  if ([v4 state] == 3)
  {
    [(PKSelectionGlowRenderer *)(uint64_t)self->_glowRenderer _didEndDragKnobLocation:self->_currentlyDraggedKnob knobDragMode:self->_knobDragMode];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __39__PKSelectionInteraction__didDragKnob___block_invoke;
    v53[3] = &unk_1E64C8158;
    v53[4] = self;
    double x = self->_currentScrollOffset.x;
    double y = self->_currentScrollOffset.y;
    CGFloat v31 = v53;
    CGFloat v28 = self;
    double v29 = v7;
    double v30 = v9;
LABEL_9:
    -[PKSelectionInteraction _updateSmartSelectionWithDragToLocation:liveScrollOffset:completion:](v28, "_updateSmartSelectionWithDragToLocation:liveScrollOffset:completion:", v31, v29, v30, x, y);
    goto LABEL_30;
  }
  if ([v4 state] != 4) {
    [v4 state];
  }
LABEL_30:
}

void __39__PKSelectionInteraction__didDragKnob___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 selectionController];
  double v6 = [*(id *)(a1 + 32) currentDrawing];
  uint64_t v7 = -[PKSelectionController contentTypeForIntersectedStrokes:inDrawing:]((uint64_t)v5, v4, v6);

  double v8 = +[PKSelectionStatisticsManager sharedStatisticsManager];
  [v8 recordSmartSelectionEventWithType:1 contentType:v7 gestureInvoked:4];

  double v9 = [*(id *)(a1 + 32) selectionController];
  int64_t v10 = [*(id *)(a1 + 32) currentDrawing];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__PKSelectionInteraction__didDragKnob___block_invoke_2;
  v11[3] = &unk_1E64C61C0;
  v11[4] = *(void *)(a1 + 32);
  -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:completion:](v9, v4, 0, 1, v10, v11);
}

uint64_t __39__PKSelectionInteraction__didDragKnob___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearLiveSelectionPath];
}

- (BOOL)isLTR
{
  uint64_t v2 = [(PKSelectionInteraction *)self view];
  BOOL v3 = [v2 effectiveUserInterfaceLayoutDirection] == 0;

  return v3;
}

- (BOOL)_locationShouldFlipOverLeftKnob:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(PKSelectionInteraction *)self isLTR])
  {
    return -[PKSelectionInteraction _locationShouldFlipOverLeftKnob_LTR:](self, "_locationShouldFlipOverLeftKnob_LTR:", x, y);
  }
  else
  {
    return -[PKSelectionInteraction _locationShouldFlipOverLeftKnob_RTL:](self, "_locationShouldFlipOverLeftKnob_RTL:", x, y);
  }
}

- (BOOL)_locationShouldFlipOverLeftKnob_LTR:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(PKSelectionInteraction *)self selectionController];
  uint64_t v7 = (void *)v6;
  if (v6) {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  memset(&v19, 0, sizeof(v19));
  double v9 = [(PKSelectionInteraction *)self currentDrawing];
  if (WeakRetained) {
    [WeakRetained transformFromStrokeSpaceToViewInDrawing:v9];
  }
  else {
    memset(&v19, 0, sizeof(v19));
  }

  +[PKDrawing _boundingBoxForStrokeArray:self->_firstStrokesInInitialStrokes];
  CGAffineTransform v18 = v19;
  CGRect v21 = CGRectApplyAffineTransform(v20, &v18);
  CGFloat v10 = v21.origin.x;
  CGFloat v11 = v21.origin.y;
  CGFloat width = v21.size.width;
  double height = v21.size.height;
  CGRectGetMinX(v21);
  v22.origin.double x = v10;
  v22.origin.double y = v11;
  v22.size.CGFloat width = width;
  v22.size.double height = height;
  double MinY = CGRectGetMinY(v22);
  v23.origin.double x = v10;
  v23.origin.double y = v11;
  v23.size.CGFloat width = width;
  v23.size.double height = height;
  double MinX = CGRectGetMinX(v23);
  v24.origin.double x = v10;
  v24.origin.double y = v11;
  v24.size.CGFloat width = width;
  v24.size.double height = height;
  CGRectGetMinY(v24);
  if (x >= MinX)
  {
    BOOL v16 = 0;
  }
  else
  {
    v25.origin.double x = v10;
    v25.origin.double y = v11;
    v25.size.CGFloat width = width;
    v25.size.double height = height;
    CGRectGetMinX(v25);
    v26.origin.double x = v10;
    v26.origin.double y = v11;
    v26.size.CGFloat width = width;
    v26.size.double height = height;
    BOOL v16 = y < height + CGRectGetMinY(v26);
  }
  return y < MinY + -38.0 || v16;
}

- (BOOL)_locationShouldFlipOverLeftKnob_RTL:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(PKSelectionInteraction *)self selectionController];
  uint64_t v7 = (void *)v6;
  if (v6) {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  memset(&v19, 0, sizeof(v19));
  double v9 = [(PKSelectionInteraction *)self currentDrawing];
  if (WeakRetained) {
    [WeakRetained transformFromStrokeSpaceToViewInDrawing:v9];
  }
  else {
    memset(&v19, 0, sizeof(v19));
  }

  +[PKDrawing _boundingBoxForStrokeArray:self->_lastStrokesInInitialStrokes];
  CGAffineTransform v18 = v19;
  CGRect v21 = CGRectApplyAffineTransform(v20, &v18);
  CGFloat v10 = v21.origin.x;
  CGFloat v11 = v21.origin.y;
  CGFloat width = v21.size.width;
  double height = v21.size.height;
  CGRectGetMaxX(v21);
  v22.origin.double x = v10;
  v22.origin.double y = v11;
  v22.size.CGFloat width = width;
  v22.size.double height = height;
  double MaxY = CGRectGetMaxY(v22);
  v23.origin.double x = v10;
  v23.origin.double y = v11;
  v23.size.CGFloat width = width;
  v23.size.double height = height;
  double MinX = CGRectGetMinX(v23);
  v24.origin.double x = v10;
  v24.origin.double y = v11;
  v24.size.CGFloat width = width;
  v24.size.double height = height;
  CGRectGetMinY(v24);
  BOOL v16 = x < MinX;
  if (y <= MaxY - height) {
    BOOL v16 = 0;
  }
  return y > MaxY + 38.0 || v16;
}

- (BOOL)_locationShouldFlipOverRightKnob:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(PKSelectionInteraction *)self isLTR])
  {
    return -[PKSelectionInteraction _locationShouldFlipOverRightKnob_LTR:](self, "_locationShouldFlipOverRightKnob_LTR:", x, y);
  }
  else
  {
    return -[PKSelectionInteraction _locationShouldFlipOverRightKnob_RTL:](self, "_locationShouldFlipOverRightKnob_RTL:", x, y);
  }
}

- (BOOL)_locationShouldFlipOverRightKnob_LTR:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(PKSelectionInteraction *)self selectionController];
  uint64_t v7 = (void *)v6;
  if (v6) {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  memset(&v19, 0, sizeof(v19));
  double v9 = [(PKSelectionInteraction *)self currentDrawing];
  if (WeakRetained) {
    [WeakRetained transformFromStrokeSpaceToViewInDrawing:v9];
  }
  else {
    memset(&v19, 0, sizeof(v19));
  }

  +[PKDrawing _boundingBoxForStrokeArray:self->_lastStrokesInInitialStrokes];
  CGAffineTransform v18 = v19;
  CGRect v21 = CGRectApplyAffineTransform(v20, &v18);
  CGFloat v10 = v21.origin.x;
  CGFloat v11 = v21.origin.y;
  CGFloat width = v21.size.width;
  double height = v21.size.height;
  double MaxX = CGRectGetMaxX(v21);
  v22.origin.double x = v10;
  v22.origin.double y = v11;
  v22.size.CGFloat width = width;
  v22.size.double height = height;
  double MaxY = CGRectGetMaxY(v22);
  BOOL v16 = x > MaxX;
  if (y <= MaxY - height) {
    BOOL v16 = 0;
  }
  return y > MaxY + 38.0 || v16;
}

- (BOOL)_locationShouldFlipOverRightKnob_RTL:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(PKSelectionInteraction *)self selectionController];
  uint64_t v7 = (void *)v6;
  if (v6) {
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  memset(&v19, 0, sizeof(v19));
  double v9 = [(PKSelectionInteraction *)self currentDrawing];
  if (WeakRetained) {
    [WeakRetained transformFromStrokeSpaceToViewInDrawing:v9];
  }
  else {
    memset(&v19, 0, sizeof(v19));
  }

  +[PKDrawing _boundingBoxForStrokeArray:self->_firstStrokesInInitialStrokes];
  CGAffineTransform v18 = v19;
  CGRect v21 = CGRectApplyAffineTransform(v20, &v18);
  CGFloat v10 = v21.origin.x;
  CGFloat v11 = v21.origin.y;
  CGFloat width = v21.size.width;
  double height = v21.size.height;
  CGRectGetMinX(v21);
  v22.origin.double x = v10;
  v22.origin.double y = v11;
  v22.size.CGFloat width = width;
  v22.size.double height = height;
  double MinY = CGRectGetMinY(v22);
  v23.origin.double x = v10;
  v23.origin.double y = v11;
  v23.size.CGFloat width = width;
  v23.size.double height = height;
  double MaxX = CGRectGetMaxX(v23);
  v24.origin.double x = v10;
  v24.origin.double y = v11;
  v24.size.CGFloat width = width;
  v24.size.double height = height;
  CGRectGetMaxY(v24);
  if (x <= MaxX)
  {
    BOOL v16 = 0;
  }
  else
  {
    v25.origin.double x = v10;
    v25.origin.double y = v11;
    v25.size.CGFloat width = width;
    v25.size.double height = height;
    CGRectGetMinX(v25);
    v26.origin.double x = v10;
    v26.origin.double y = v11;
    v26.size.CGFloat width = width;
    v26.size.double height = height;
    BOOL v16 = y < height + CGRectGetMinY(v26);
  }
  return y < MinY + -38.0 || v16;
}

- (void)_updateStateIfNecessaryWithOldModificationType:(int64_t)a3 newModificationType:(int64_t)a4
{
  if (a3 == 3 && a4)
  {
    self->_int64_t modificationType = a4;
    int64_t v4 = 1;
    if (a4 != 1) {
      int64_t v4 = 2;
    }
    self->_int64_t knobDragMode = v4;
  }
}

- (void)_didBrushWithKnob:(id)a3
{
  id v4 = a3;
  double v5 = [(PKSelectionInteraction *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  CGFloat v10 = [v4 touches];
  CGFloat v11 = [v10 firstObject];

  BOOL v12 = [v11 type] == 2;
  if ([v4 state] == 1)
  {
    self->_unint64_t knobDragMode = 0;
    double v13 = -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:", v7, v9);
    [(PKSelectionInteraction *)self setCurrentDrawing:v13];

    [(PKSelectionInteraction *)self _resetVelocityWindow];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
    id v15 = WeakRetained;
    if (WeakRetained) {
      BOOL v16 = (void *)*((void *)WeakRetained + 16);
    }
    else {
      BOOL v16 = 0;
    }
    id v17 = v16;
    CGAffineTransform v18 = [v17 strokes];
    initialStrokeSelectionBeforeModification = self->_initialStrokeSelectionBeforeModification;
    self->_initialStrokeSelectionBeforeModification = v18;

    id v20 = objc_loadWeakRetained((id *)&self->_selectionController);
    CGRect v21 = v20;
    if (v20) {
      CGRect v22 = (void *)*((void *)v20 + 16);
    }
    else {
      CGRect v22 = 0;
    }
    id v23 = v22;
    CGRect v24 = [v23 strokes];
    CGRect v25 = (NSMutableOrderedSet *)[v24 mutableCopy];
    smartSelectedStrokes = self->_smartSelectedStrokes;
    self->_smartSelectedStrokes = v25;

    id v27 = objc_loadWeakRetained((id *)&self->_selectionController);
    -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)v27, 0, 0);

    self->_int64_t modificationType = 3;
    CGFloat v28 = +[PKSelectionInput inputWithType:location:inputType:](PKSelectionInput, "inputWithType:location:inputType:", 1, v12, v7, v9);
    [(PKSelectionInteraction *)self _updateStateIfNecessaryWithOldModificationType:self->_modificationType newModificationType:[(PKSelectionInteraction *)self _updateSmartSelectionWithInput:v28 modificationType:self->_modificationType]];
    [(PKSelectionGlowRenderer *)(uint64_t)self->_glowRenderer _willBeginDragKnobLocation:self->_knobDragMode atPoint:v7 knobDragMode:v9];
    goto LABEL_12;
  }
  if ([v4 state] == 2)
  {
    double v29 = [(PKSelectionInteraction *)self selectionController];
    double v30 = [(PKSelectionController *)(uint64_t)v29 autoscrollForPointIfNecessary:v9];
    double v32 = v31;

    [v4 lastTouchTimestamp];
    -[PKSelectionInteraction _updateVelocityWindowWithTimestamp:location:](self, "_updateVelocityWindowWithTimestamp:location:");
    uint64_t v33 = -[PKSelectionInteraction _selectionTypeForVelocity:](self, "_selectionTypeForVelocity:");
    double v34 = [v4 touches];
    uint64_t v35 = [v34 firstObject];
    uint64_t v36 = [v35 type];

    CGFloat v28 = +[PKSelectionInput inputWithType:location:inputType:](PKSelectionInput, "inputWithType:location:inputType:", v33, v12, v7, v9);
    -[PKSelectionInteraction _updateStateIfNecessaryWithOldModificationType:newModificationType:](self, "_updateStateIfNecessaryWithOldModificationType:newModificationType:", self->_modificationType, -[PKSelectionInteraction _updateSmartSelectionWithInput:modificationType:liveScrollOffset:completion:](self, "_updateSmartSelectionWithInput:modificationType:liveScrollOffset:completion:", v28, self->_modificationType, 0, v30, v32));
    glowRenderer = self->_glowRenderer;
    if (glowRenderer)
    {
      int64_t currentlyDraggedKnob = self->_currentlyDraggedKnob;
      unint64_t knobDragMode = self->_knobDragMode;
      glowRenderer->_unint64_t knobDragMode = knobDragMode;
      [(PKSelectionGlowRenderer *)(uint64_t)glowRenderer _updateKnobAppearanceForDragAtKnobLocation:knobDragMode point:v33 knobDragMode:v36 selectionType:v7 touchType:v9];
    }
    goto LABEL_12;
  }
  if ([v4 state] == 3)
  {
    [(PKSelectionGlowRenderer *)(uint64_t)self->_glowRenderer _didEndDragKnobLocation:self->_currentlyDraggedKnob knobDragMode:self->_knobDragMode];
    [v4 lastTouchTimestamp];
    -[PKSelectionInteraction _updateVelocityWindowWithTimestamp:location:](self, "_updateVelocityWindowWithTimestamp:location:");
    int64_t v41 = -[PKSelectionInteraction _selectionTypeForVelocity:](self, "_selectionTypeForVelocity:");
    CGFloat v28 = +[PKSelectionInput inputWithType:location:inputType:](PKSelectionInput, "inputWithType:location:inputType:", v41, v12, v7, v9);
    int64_t modificationType = self->_modificationType;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __44__PKSelectionInteraction__didBrushWithKnob___block_invoke;
    v43[3] = &unk_1E64C61E8;
    v43[4] = self;
    v43[5] = v41;
    -[PKSelectionInteraction _updateSmartSelectionWithInput:modificationType:liveScrollOffset:completion:](self, "_updateSmartSelectionWithInput:modificationType:liveScrollOffset:completion:", v28, modificationType, v43, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
LABEL_12:

    goto LABEL_13;
  }
  if ([v4 state] != 4) {
    [v4 state];
  }
LABEL_13:
}

void __44__PKSelectionInteraction__didBrushWithKnob___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) selectionController];
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = (void *)v3[40];
  double v5 = [v3 currentDrawing];
  uint64_t v6 = -[PKSelectionController contentTypeForIntersectedStrokes:inDrawing:]((uint64_t)v2, v4, v5);

  double v7 = +[PKSelectionStatisticsManager sharedStatisticsManager];
  [v7 recordSmartSelectionEventWithType:*(void *)(a1 + 40) contentType:v6 gestureInvoked:5];

  double v8 = [*(id *)(a1 + 32) selectionController];
  double v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  CGFloat v11 = (void *)v9[40];
  BOOL v12 = [v9 currentDrawing];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__PKSelectionInteraction__didBrushWithKnob___block_invoke_2;
  v13[3] = &unk_1E64C61C0;
  v13[4] = *(void *)(a1 + 32);
  -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:completion:](v8, v11, 0, v10, v12, v13);
}

uint64_t __44__PKSelectionInteraction__didBrushWithKnob___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearLiveSelectionPath];
}

- (void)_updateSmartSelectionWithDragToLocation:(CGPoint)a3 liveScrollOffset:(CGPoint)a4 completion:(id)a5
{
}

- (void)_updateSmartSelectionWithDragToLocation:(CGPoint)a3 liveScrollOffset:(CGPoint)a4 initialSelectedWord:(id)a5 completion:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  id v12 = a5;
  id v13 = a6;
  CGFloat v14 = [(PKSelectionInteraction *)self currentDrawing];
  -[PKSelectionInteraction _pointFromViewToStrokeSpace:inDrawing:](self, "_pointFromViewToStrokeSpace:inDrawing:", v14, v10, v9);
  double v16 = v15;
  double v18 = v17;

  BOOL v19 = [(PKSelectionInteraction *)self isLTR];
  int64_t currentlyDraggedKnob = self->_currentlyDraggedKnob;
  uint64_t v21 = !v19;
  if (currentlyDraggedKnob == v21) {
    double v22 = v16;
  }
  else {
    double v22 = self->_undraggedKnobLocationInStrokeSpace.x;
  }
  if (currentlyDraggedKnob == v21) {
    double v23 = v18;
  }
  else {
    double v23 = self->_undraggedKnobLocationInStrokeSpace.y;
  }
  if (currentlyDraggedKnob == v21)
  {
    double v16 = self->_undraggedKnobLocationInStrokeSpace.x;
    double v18 = self->_undraggedKnobLocationInStrokeSpace.y;
  }
  CGRect v24 = [(PKSelectionInteraction *)self currentDrawing];
  -[PKSelectionGlowRenderer _renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:](self->_glowRenderer, "_renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:", 0, self->_smartSelectedStrokes, v24, x, y);
  CGRect v25 = [(PKSelectionInteraction *)self selectionController];
  CGRect v26 = [(NSOrderedSet *)self->_initialStrokeSelectionBeforeModification array];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __114__PKSelectionInteraction__updateSmartSelectionWithDragToLocation_liveScrollOffset_initialSelectedWord_completion___block_invoke;
  v30[3] = &unk_1E64C8180;
  v30[4] = self;
  id v31 = v12;
  double v34 = x;
  double v35 = y;
  id v32 = v24;
  id v33 = v13;
  id v27 = v13;
  id v28 = v24;
  id v29 = v12;
  -[PKSelectionController fetchStrokesToSelectBetweenTopPoint:bottomPoint:inDrawing:liveScrollOffset:existingSelection:completion:]((uint64_t)v25, v28, v26, v30, v22, v23, v16, v18, x, y);
}

void __114__PKSelectionInteraction__updateSmartSelectionWithDragToLocation_liveScrollOffset_initialSelectedWord_completion___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([*(id *)(a1 + 32) _liveSelectionGestureStillActive])
  {
    BOOL v3 = [v10 intersectedStrokes];
    uint64_t v4 = [v3 mutableCopy];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 320);
    *(void *)(v5 + 320) = v4;

    if (*(void *)(a1 + 40)) {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 320), "unionOrderedSet:");
    }
    double v7 = [v10 intersectedStrokes];
    uint64_t v8 = [v7 count];

    if (v8) {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "_renderLiveSelectionPath:forStrokes:inDrawing:liveScrollOffset:", 0, *(void *)(*(void *)(a1 + 32) + 320), *(void *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72));
    }
  }
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, *(void *)(*(void *)(a1 + 32) + 320));
  }
}

- (id)_knobForLocation:(CGPoint)a3
{
  return -[PKSelectionInteraction _knobForLocation:forInputType:](self, "_knobForLocation:forInputType:", 0, a3.x, a3.y);
}

- (id)_knobForLocation:(CGPoint)a3 forInputType:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  p_selectionController = &self->_selectionController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  uint64_t v9 = WeakRetained;
  if (!WeakRetained || !*((void *)WeakRetained + 16)) {
    goto LABEL_15;
  }
  id v10 = objc_loadWeakRetained((id *)p_selectionController);
  CGFloat v11 = v10;
  if (v10) {
    id v12 = (void *)*((void *)v10 + 19);
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;
  if (![v13 selectionType])
  {

LABEL_15:
    BOOL v19 = 0;
    goto LABEL_16;
  }
  id v14 = objc_loadWeakRetained((id *)p_selectionController);
  double v15 = v14;
  if (v14) {
    double v16 = (void *)*((void *)v14 + 19);
  }
  else {
    double v16 = 0;
  }
  id v17 = v16;
  uint64_t v18 = [v17 selectionType];

  if (v18 == 6)
  {
    BOOL v19 = 0;
    goto LABEL_17;
  }
  id v20 = objc_loadWeakRetained((id *)p_selectionController);
  uint64_t v21 = v20;
  if (v20) {
    double v22 = (void *)*((void *)v20 + 19);
  }
  else {
    double v22 = 0;
  }
  id v23 = v22;
  uint64_t v9 = [v23 selectionRenderer];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  BOOL v19 = [(PKSelectionGlowRenderer *)(uint64_t)v9 _affordanceForLocationInSelectionView:x inputType:y];
LABEL_16:

LABEL_17:

  return v19;
}

- (id)_firstStrokesInStrokes:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(PKSelectionInteraction *)self selectionController];
    uint64_t v6 = (void *)v5;
    if (v5) {
      id WeakRetained = objc_loadWeakRetained((id *)(v5 + 120));
    }
    else {
      id WeakRetained = 0;
    }
    uint64_t v8 = [(PKSelectionInteraction *)self currentDrawing];
    uint64_t v9 = [v8 uuid];
    id v10 = [WeakRetained _attachmentForUUID:v9];

    CGFloat v11 = [v10 _firstStrokesInSelectedStrokes:v4];
    id v12 = v11;
    if (!v11 || ![v11 count])
    {
      if ([(PKSelectionInteraction *)self isLTR]) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = 2;
      }
      uint64_t v14 = [(PKSelectionInteraction *)self _closestStrokesToCorner:v13 fromStrokes:v4];

      id v12 = (void *)v14;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_lastStrokesInStrokes:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(PKSelectionInteraction *)self selectionController];
    uint64_t v6 = (void *)v5;
    if (v5) {
      id WeakRetained = objc_loadWeakRetained((id *)(v5 + 120));
    }
    else {
      id WeakRetained = 0;
    }
    uint64_t v8 = [(PKSelectionInteraction *)self currentDrawing];
    uint64_t v9 = [v8 uuid];
    id v10 = [WeakRetained _attachmentForUUID:v9];

    CGFloat v11 = [v10 _lastStrokesInSelectedStrokes:v4];
    id v12 = v11;
    if (!v11 || ![v11 count])
    {
      if ([(PKSelectionInteraction *)self isLTR]) {
        uint64_t v13 = 8;
      }
      else {
        uint64_t v13 = 4;
      }
      uint64_t v14 = [(PKSelectionInteraction *)self _closestStrokesToCorner:v13 fromStrokes:v4];

      id v12 = (void *)v14;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)knobsContainPoint:(CGPoint)a3 forInputType:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  uint64_t v9 = WeakRetained;
  if (WeakRetained) {
    id v10 = (void *)*((void *)WeakRetained + 19);
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;
  char v12 = [v11 isHidden];

  if (v12) {
    return 0;
  }
  uint64_t v14 = -[PKSelectionInteraction _knobForLocation:forInputType:](self, "_knobForLocation:forInputType:", a4, x, y);
  double v15 = [(PKSelectionInteraction *)self view];
  uint64_t v16 = [(PKSelectionInteraction *)self selectionController];
  id v17 = (void *)v16;
  if (v16) {
    uint64_t v18 = *(void **)(v16 + 152);
  }
  else {
    uint64_t v18 = 0;
  }
  id v19 = v18;
  objc_msgSend(v15, "convertPoint:fromView:", v19, x, y);
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  [(PKDrawingAdjustmentKnob *)self->_insertSpaceAffordance frame];
  CGFloat v24 = v32.origin.x;
  CGFloat v25 = v32.origin.y;
  CGFloat width = v32.size.width;
  CGFloat height = v32.size.height;
  double MidX = CGRectGetMidX(v32);
  v33.origin.double x = v24;
  v33.origin.double y = v25;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  v34.origin.double y = CGRectGetMidY(v33) + -20.0;
  v34.size.CGFloat height = 40.0;
  v34.origin.double x = MidX + -20.0;
  v34.size.CGFloat width = 40.0;
  v31.double x = v21;
  v31.double y = v23;
  BOOL v29 = CGRectContainsPoint(v34, v31);
  if (v14) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v29;
  }

  return v13;
}

- (BOOL)gesturesAllowedForPaletteState
{
  uint64_t v3 = [(PKSelectionInteraction *)self selectionController];
  id v4 = (void *)v3;
  if (v3) {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  int v6 = [WeakRetained isInNotesTextView];

  double v7 = [(PKSelectionInteraction *)self view];
  uint64_t v8 = [v7 window];
  char v9 = +[PKToolPicker isActiveToolPickerVisibleForWindow:v8];

  uint64_t v10 = [(PKSelectionInteraction *)self selectionController];
  id v11 = (void *)v10;
  if (v10) {
    id v12 = objc_loadWeakRetained((id *)(v10 + 120));
  }
  else {
    id v12 = 0;
  }
  BOOL v13 = [v12 ink];
  char v14 = [v13 _isLassoInk];

  if (v6)
  {
    uint64_t v15 = [(PKSelectionInteraction *)self selectionController];
    uint64_t v16 = (void *)v15;
    if (v15) {
      id v17 = objc_loadWeakRetained((id *)(v15 + 120));
    }
    else {
      id v17 = 0;
    }
    char v18 = [v17 allowsFingerDrawing];

    char v9 = v18 ^ 1;
  }
  return v9 | v14;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UITapGestureRecognizer *)a3;
  if (![(PKSelectionInteraction *)self isEnabled])
  {
    uint64_t v5 = [(PKSelectionInteraction *)self view];
    int v6 = [v5 gestureRecognizers];
    int v7 = [v6 containsObject:v4];

    if (v7)
    {
      uint64_t v8 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "Selection interaction is disabled", buf, 2u);
      }
LABEL_10:

      goto LABEL_11;
    }
  }
  char v9 = [(PKSelectionInteraction *)self view];
  [(UITapGestureRecognizer *)v4 locationInView:v9];
  double v11 = v10;
  double v13 = v12;

  if (-[PKSelectionInteraction _selectionInteractionShouldBeginAtPoint:forEvent:orGestureRecognizer:](self, "_selectionInteractionShouldBeginAtPoint:forEvent:orGestureRecognizer:", 0, v4, v11, v13))
  {
    if (![(PKSelectionInteraction *)self gesturesAllowedForPaletteState]
      && self->_progressiveTapGestureRecognizer != v4)
    {
      uint64_t v8 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v82 = 0;
        _os_log_debug_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEBUG, "Cannot start gesture with finger if pen is selected unless palette is up", v82, 2u);
      }
      goto LABEL_10;
    }
    uint64_t v15 = -[PKSelectionInteraction _drawingForLocation:](self, "_drawingForLocation:", v11, v13);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
    if (WeakRetained)
    {
      uint64_t v17 = WeakRetained[16];

      if (v17)
      {
        id v18 = objc_loadWeakRetained((id *)&self->_selectionController);
        id v19 = v18;
        if (v18) {
          double v20 = (void *)*((void *)v18 + 19);
        }
        else {
          double v20 = 0;
        }
        id v21 = v20;

        double v22 = [v21 _selectionViewGestures];
        [(UITapGestureRecognizer *)v4 locationInView:v21];
        double v24 = v23;
        double v26 = v25;
        int v14 = objc_msgSend(v21, "containsPoint:forInputType:", 0);
        uint64_t v27 = -[PKSelectionInteraction _knobForLocation:](self, "_knobForLocation:", v24, v26);
        id v28 = (void *)v27;
        if (v27) {
          int64_t v29 = *(void *)(v27 + 56);
        }
        else {
          int64_t v29 = 0;
        }
        self->_int64_t currentlyDraggedKnob = v29;
        if ((UITapGestureRecognizer *)self->_insertSpaceAffordanceGesture == v4)
        {
          [(UITapGestureRecognizer *)v4 locationInView:self->_insertSpaceAffordance];
          CGFloat v39 = v38;
          CGFloat v41 = v40;
          [(PKDrawingAdjustmentKnob *)self->_insertSpaceAffordance bounds];
          CGFloat x = v85.origin.x;
          CGFloat y = v85.origin.y;
          CGFloat width = v85.size.width;
          CGFloat height = v85.size.height;
          double MidX = CGRectGetMidX(v85);
          v86.origin.CGFloat x = x;
          v86.origin.CGFloat y = y;
          v86.size.CGFloat width = width;
          v86.size.CGFloat height = height;
          v87.origin.CGFloat y = CGRectGetMidY(v86) + -20.0;
          v87.size.CGFloat height = 40.0;
          v87.origin.CGFloat x = MidX + -20.0;
          v87.size.CGFloat width = 40.0;
          v84.CGFloat x = v39;
          v84.CGFloat y = v41;
          LOBYTE(v14) = CGRectContainsPoint(v87, v84);
          goto LABEL_65;
        }
        if ([v22 containsObject:v4])
        {
          id v30 = objc_loadWeakRetained((id *)&self->_selectionController);
          CGPoint v31 = v30;
          if (v30) {
            CGRect v32 = (void *)*((void *)v30 + 19);
          }
          else {
            CGRect v32 = 0;
          }
          id v33 = v32;
          char v34 = [v33 isHidden];

          if ((v34 & 1) == 0)
          {
            CGFloat v47 = [v21 dragGR];

            if (v28 && v47 == v4 && ((v14 ^ 1) & 1) == 0)
            {
              [v21 bounds];
              double v52 = DKDCenterOfRect(v48, v49, v50, v51);
              LOBYTE(v14) = sqrt((v53 - v26) * (v53 - v26) + (v52 - v24) * (v52 - v24)) < [(PKSelectionModificationKnob *)v28 distanceFromKnobCenterToPoint:v26];
            }
            goto LABEL_65;
          }
          goto LABEL_23;
        }
        if ((UITapGestureRecognizer *)self->_lassoGestureRecognizer == v4)
        {
          if (v15) {
            LOBYTE(v14) = (v28 == 0) & ~(_BYTE)v14;
          }
          else {
            LOBYTE(v14) = 0;
          }
          goto LABEL_65;
        }
        if (self->_progressiveTapGestureRecognizer == v4)
        {
          LOBYTE(v14) = v14 ^ 1;
          goto LABEL_65;
        }
        if ((UITapGestureRecognizer *)self->_knobBrushGestureRecognizer == v4
          || (UITapGestureRecognizer *)self->_knobDragGestureRecognizer == v4)
        {
          if (v28)
          {
            id v65 = objc_loadWeakRetained((id *)&self->_selectionController);
            double v66 = v65;
            if (v65) {
              double v67 = (void *)*((void *)v65 + 19);
            }
            else {
              double v67 = 0;
            }
            id v68 = v67;
            int v14 = [v68 isHidden] ^ 1;

            goto LABEL_65;
          }
          goto LABEL_23;
        }
        if ((UITapGestureRecognizer *)self->_tapAndHoldToSelectLongPressGestureRecognizer == v4
          || (UITapGestureRecognizer *)self->_modifySelectionRecognizer == v4 && ![v21 selectionType])
        {
LABEL_23:
          LOBYTE(v14) = 0;
LABEL_65:

LABEL_66:
          goto LABEL_76;
        }

LABEL_56:
        LOBYTE(v14) = 1;
LABEL_76:

        goto LABEL_77;
      }
    }
    if ((UITapGestureRecognizer *)self->_knobBrushGestureRecognizer != v4
      && (UITapGestureRecognizer *)self->_knobDragGestureRecognizer != v4)
    {
      uint64_t v35 = [(PKSelectionInteraction *)self selectionController];
      uint64_t v36 = (void *)v35;
      if (v35) {
        id v37 = objc_loadWeakRetained((id *)(v35 + 120));
      }
      else {
        id v37 = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
      }
      else
      {
        noOpTapGestureRecognizer = self->_noOpTapGestureRecognizer;

        if (noOpTapGestureRecognizer == v4) {
          goto LABEL_75;
        }
      }
      if ((UITapGestureRecognizer *)self->_insertSpaceAffordanceGesture != v4)
      {
        uint64_t v55 = [(PKSelectionInteraction *)self selectionController];
        long long v56 = (void *)v55;
        if (v55) {
          id v57 = objc_loadWeakRetained((id *)(v55 + 120));
        }
        else {
          id v57 = 0;
        }
        int v58 = [v57 allowsFingerDrawing];

        uint64_t v59 = [(PKSelectionInteraction *)self selectionController];
        double v60 = (void *)v59;
        if (v59) {
          id v61 = objc_loadWeakRetained((id *)(v59 + 120));
        }
        else {
          id v61 = 0;
        }
        uint64_t v62 = [v61 ink];
        int v63 = [v62 _isLassoInk];

        int v64 = v63 | v58 ^ 1;
        if (self->_progressiveTapGestureRecognizer == v4
          || (UITapGestureRecognizer *)self->_modifySelectionRecognizer == v4)
        {
          if (v15) {
            LOBYTE(v14) = v63 | v58 ^ 1;
          }
          else {
            LOBYTE(v14) = 0;
          }
          goto LABEL_76;
        }
        if ((UITapGestureRecognizer *)self->_tapAndHoldToSelectLongPressGestureRecognizer != v4)
        {
          if (v15) {
            LOBYTE(v14) = v63;
          }
          else {
            LOBYTE(v14) = 0;
          }
          if ((UITapGestureRecognizer *)self->_lassoGestureRecognizer == v4) {
            goto LABEL_76;
          }
          goto LABEL_56;
        }
        if (!v15) {
          int v64 = 0;
        }
        if (v64 == 1)
        {
          -[PKSelectionInteraction _pointFromViewToStrokeSpace:inDrawing:](self, "_pointFromViewToStrokeSpace:inDrawing:", v15, v11, v13);
          double v70 = v69;
          double v72 = v71;
          CGFloat v73 = [(PKSelectionInteraction *)self _visibleOnscreenStrokesForDrawing:v15];
          +[PKClusteringUtility _geometricBasedStrokeClusteringFromPoint:visibleStrokes:selectionType:inputType:](PKClusteringUtility, "_geometricBasedStrokeClusteringFromPoint:visibleStrokes:selectionType:inputType:", v73, 1, 0, v70, v72);
          id v21 = (id)objc_claimAutoreleasedReturnValue();

          if (v21) {
            BOOL v74 = [v21 count] != 0;
          }
          else {
            BOOL v74 = 0;
          }
          CGFloat v76 = [(PKSelectionInteraction *)self selectionController];
          CGFloat v77 = -[PKSelectionController topView](v76);
          float64x2_t v78 = [v15 uuid];
          double v79 = [v77 _attachmentForUUID:v78];

          CGFloat v80 = [(PKSelectionInteraction *)self selectionController];
          double v81 = [(PKSelectionController *)v80 _externalElementsAtLocation:v70 inAttachment:v72];

          if ([v81 count]) {
            LOBYTE(v14) = 1;
          }
          else {
            LOBYTE(v14) = v74;
          }

          goto LABEL_66;
        }
      }
    }
LABEL_75:
    LOBYTE(v14) = 0;
    goto LABEL_76;
  }
LABEL_11:
  LOBYTE(v14) = 0;
LABEL_77:

  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  int v6 = (UIPanGestureRecognizer *)a3;
  int v7 = (UITapAndAHalfRecognizer *)a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  char v9 = WeakRetained;
  if (WeakRetained) {
    double v10 = (void *)*((void *)WeakRetained + 19);
  }
  else {
    double v10 = 0;
  }
  id v11 = v10;
  double v12 = [v11 dragGR];

  if (self->_lassoGestureRecognizer == v6 && v12 == v7) {
    goto LABEL_5;
  }
  int v14 = objc_loadWeakRetained((id *)&self->_selectionController);
  if (!v14) {
    goto LABEL_19;
  }
  uint64_t v15 = v14[16];

  if (!v15) {
    goto LABEL_19;
  }
  id v16 = objc_loadWeakRetained((id *)&self->_selectionController);
  uint64_t v17 = v16;
  if (v16) {
    id v18 = (void *)*((void *)v16 + 19);
  }
  else {
    id v18 = 0;
  }
  id v19 = v18;

  double v20 = [v19 _selectionViewGestures];
  id v21 = [v19 dragGR];
  if (v21 != v6)
  {

LABEL_13:
    if ([v20 containsObject:v6])
    {
      double v23 = [v19 dragGR];
      if (v23 == v6)
      {
      }
      else
      {
        modifySelectionRecognizer = self->_modifySelectionRecognizer;

        if (modifySelectionRecognizer == v7) {
          goto LABEL_16;
        }
      }
    }
    double v25 = [v19 doubleTapGR];

    if (v25 == v7) {
      goto LABEL_5;
    }
LABEL_19:
    BOOL v13 = 0;
    goto LABEL_20;
  }
  double v22 = [v19 editMenuGR];

  if (v22 != v7) {
    goto LABEL_13;
  }
LABEL_16:

LABEL_5:
  BOOL v13 = 1;
LABEL_20:

  return v13;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  int v6 = (UIPanGestureRecognizer *)a3;
  int v7 = (UITapAndAHalfRecognizer *)a4;
  uint64_t v8 = v7;
  if ((self->_lassoGestureRecognizer != v6 || self->_modifySelectionRecognizer != v7)
    && ((UIPanGestureRecognizer *)self->_progressiveTapGestureRecognizer != v6
     || (UITapAndAHalfRecognizer *)self->_tapAndHoldToSelectLongPressGestureRecognizer == v7))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
    if (WeakRetained)
    {
      uint64_t v10 = WeakRetained[16];

      if (!v10)
      {
        char v16 = 0;
        goto LABEL_24;
      }
      uint64_t v11 = [(PKSelectionInteraction *)self selectionController];
      double v12 = (void *)v11;
      if (v11) {
        BOOL v13 = *(void **)(v11 + 152);
      }
      else {
        BOOL v13 = 0;
      }
      id v14 = v13;

      uint64_t v15 = [v14 dragGR];
      if (v15 != v6)
      {

LABEL_14:
        uint64_t v18 = [(PKSelectionInteraction *)self selectionController];
        id v19 = (void *)v18;
        if (v18) {
          double v20 = *(void **)(v18 + 152);
        }
        else {
          double v20 = 0;
        }
        id v21 = v20;
        double v22 = [v21 dragGR];

        if (v22 == v6)
        {
          if ([(UIPanGestureRecognizer *)v6 state] == 2)
          {
            objc_opt_class();
            char v16 = objc_opt_isKindOfClass() ^ 1;
          }
          else
          {
            char v16 = 0;
          }
          double v22 = v6;
        }
        else
        {
          char v16 = 0;
        }

        goto LABEL_23;
      }
      modifySelectionRecognizer = self->_modifySelectionRecognizer;

      if (modifySelectionRecognizer != v8) {
        goto LABEL_14;
      }
      char v16 = 1;
    }
    else
    {
      id v14 = 0;
      char v16 = 0;
    }
LABEL_23:

    goto LABEL_24;
  }
  char v16 = 1;
LABEL_24:

  return v16 & 1;
}

- (BOOL)_selectionShouldReceiveTouchForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = [(PKSelectionInteraction *)self selectionController];
  if (v6)
  {
    uint64_t v7 = v6[16];

    if (!v7) {
      return 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
    char v9 = WeakRetained;
    if (WeakRetained) {
      uint64_t v10 = (void *)*((void *)WeakRetained + 19);
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    double v12 = [(PKSelectionInteraction *)self selectionController];
    BOOL v13 = -[PKSelectionController topView](v12);
    objc_msgSend(v11, "convertPoint:fromView:", v13, x, y);
    double v15 = v14;
    double v17 = v16;

    char v18 = objc_msgSend(v11, "containsPoint:forInputType:", 0, v15, v17);
    id v19 = -[PKSelectionInteraction _knobForLocation:](self, "_knobForLocation:", v15, v17);
    if (v19) {
      BOOL v20 = 1;
    }
    else {
      BOOL v20 = v18;
    }
  }
  else
  {
    id v11 = 0;
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)_selectionInteractionShouldBeginAtPoint:(CGPoint)a3 forEvent:(id)a4 orGestureRecognizer:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PKSelectionInteraction *)self delegate];

  if (!v11) {
    goto LABEL_4;
  }
  double v12 = [(PKSelectionInteraction *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) == 0) {
    goto LABEL_4;
  }
  double v14 = [(PKSelectionInteraction *)self delegate];
  char v15 = objc_msgSend(v14, "selectionInteractionShouldBegin:atPoint:forEvent:orGestureRecognizer:", self, v9, v10, x, y);

  if ((v15 & 1) == 0)
  {
    if (v9)
    {
      char v18 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        id v21 = v9;
        _os_log_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_DEFAULT, "Interaction delegate does not want interaction to begin for event: %@", (uint8_t *)&v20, 0xCu);
      }
    }
    if (v10)
    {
      id v19 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        id v21 = v10;
        _os_log_impl(&dword_1C44F8000, v19, OS_LOG_TYPE_DEFAULT, "Interaction delegate does not want interaction to begin for gesture recognizer: %@", (uint8_t *)&v20, 0xCu);
      }
    }
    BOOL v16 = 0;
  }
  else
  {
LABEL_4:
    BOOL v16 = 1;
  }

  return v16;
}

- (BOOL)_selectionInteractionShouldForwardAtPoint:(CGPoint)a3 forEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = [(PKSelectionInteraction *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(PKSelectionInteraction *)self delegate];
    LODWORD(self) = objc_msgSend(v10, "selectionInteractionShouldForwardToElements:atPoint:forEvent:", self, v7, x, y);

    if (self)
    {
      self = (PKSelectionInteraction *)os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(&self->super, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v7;
        _os_log_impl(&dword_1C44F8000, &self->super, OS_LOG_TYPE_DEFAULT, "Interaction delegate will forward event: %@", (uint8_t *)&v12, 0xCu);
      }

      LOBYTE(self) = 1;
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (BOOL)_dragShouldBeginForSession:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  if (!WeakRetained)
  {
    id v9 = 0;
    LOBYTE(v6) = 0;
LABEL_8:

    goto LABEL_9;
  }
  int v6 = (void *)WeakRetained[16];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_selectionController);
    int v6 = v7;
    if (v7) {
      uint64_t v8 = (void *)*((void *)v7 + 19);
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;

    [v4 locationInView:v9];
    id v10 = -[PKSelectionInteraction _knobForLocation:](self, "_knobForLocation:");
    LOBYTE(v6) = v10 == 0;
    if (v10) {
      int64_t v11 = v10[7];
    }
    else {
      int64_t v11 = 0;
    }
    self->_int64_t currentlyDraggedKnob = v11;

    goto LABEL_8;
  }
LABEL_9:

  return (char)v6;
}

- (CGPoint)_pointFromViewToStrokeSpace:(CGPoint)a3 inDrawing:(id)a4
{
  long long v13 = *(long long *)&a3.y;
  CGPoint v14 = a3;
  id v5 = a4;
  float64x2_t v16 = 0u;
  float64x2_t v17 = 0u;
  float64x2_t v15 = 0u;
  uint64_t v6 = [(PKSelectionInteraction *)self selectionController];
  id v7 = (void *)v6;
  if (v6 && (id WeakRetained = objc_loadWeakRetained((id *)(v6 + 120))) != 0)
  {
    id v9 = WeakRetained;
    objc_msgSend(WeakRetained, "transformFromViewToStrokeSpaceInDrawing:", v5, v13, v14);
  }
  else
  {
    id v9 = 0;
    float64x2_t v16 = 0u;
    float64x2_t v17 = 0u;
    float64x2_t v15 = 0u;
  }

  float64x2_t v12 = vaddq_f64(v17, vmlaq_n_f64(vmulq_n_f64(v16, *(double *)&v13), v15, v14.x));
  double v11 = v12.f64[1];
  double v10 = v12.f64[0];
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (PKSelectionInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKSelectionInteractionDelegate *)WeakRetained;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UIPanGestureRecognizer)lassoGestureRecognizer
{
  return self->_lassoGestureRecognizer;
}

- (void)setLassoGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)noOpTapGestureRecognizer
{
  return self->_noOpTapGestureRecognizer;
}

- (void)setNoOpTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)progressiveTapGestureRecognizer
{
  return self->_progressiveTapGestureRecognizer;
}

- (void)setProgressiveTapGestureRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)tapAndHoldToSelectLongPressGestureRecognizer
{
  return self->_tapAndHoldToSelectLongPressGestureRecognizer;
}

- (void)setTapAndHoldToSelectLongPressGestureRecognizer:(id)a3
{
}

- (UITapAndAHalfRecognizer)modifySelectionRecognizer
{
  return self->_modifySelectionRecognizer;
}

- (void)setModifySelectionRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)knobBrushGestureRecognizer
{
  return self->_knobBrushGestureRecognizer;
}

- (void)setKnobBrushGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)knobDragGestureRecognizer
{
  return self->_knobDragGestureRecognizer;
}

- (void)setKnobDragGestureRecognizer:(id)a3
{
}

- (void)setSelectionController:(id)a3
{
}

- (CGPoint)_drawingBeganLocation
{
  double x = self->__drawingBeganLocation.x;
  double y = self->__drawingBeganLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)set_drawingBeganLocation:(CGPoint)a3
{
  self->__drawingBeganLocation = a3;
}

- (BOOL)_didCancelSelection
{
  return self->__didCancelSelection;
}

- (void)set_didCancelSelection:(BOOL)a3
{
  self->__didCancelSelection = a3;
}

- (NSMutableOrderedSet)smartSelectedStrokes
{
  return self->_smartSelectedStrokes;
}

- (void)setSmartSelectedStrokes:(id)a3
{
}

- (NSOrderedSet)initialStrokeSelectionBeforeModification
{
  return self->_initialStrokeSelectionBeforeModification;
}

- (void)setInitialStrokeSelectionBeforeModification:(id)a3
{
}

- (void)setCurrentDrawing:(id)a3
{
}

- (UILongPressGestureRecognizer)pencilLongPressGestureRecognizer
{
  return self->_pencilLongPressGestureRecognizer;
}

- (void)setPencilLongPressGestureRecognizer:(id)a3
{
}

- (BOOL)insertSpaceEnabled
{
  return self->_insertSpaceEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pencilLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_currentDrawing, 0);
  objc_storeStrong((id *)&self->_initialStrokeSelectionBeforeModification, 0);
  objc_storeStrong((id *)&self->_smartSelectedStrokes, 0);
  objc_destroyWeak((id *)&self->_selectionController);
  objc_storeStrong((id *)&self->_knobDragGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_knobBrushGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_modifySelectionRecognizer, 0);
  objc_storeStrong((id *)&self->_tapAndHoldToSelectLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_progressiveTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_noOpTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_lassoGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_insertSpaceAffordanceGesture, 0);
  objc_storeStrong((id *)&self->_insertSpaceAffordance, 0);
  objc_storeStrong((id *)&self->_selectionViewGestures, 0);
  objc_storeStrong((id *)&self->_lastStrokesInInitialStrokes, 0);
  objc_storeStrong((id *)&self->_firstStrokesInInitialStrokes, 0);
  objc_storeStrong((id *)&self->_tapAndDragVelocityArray, 0);
  objc_storeStrong((id *)&self->_lassoPath, 0);
  objc_storeStrong((id *)&self->_glowRenderer, 0);

  objc_storeStrong((id *)&self->_lassoRenderer, 0);
}

@end