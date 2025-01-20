@interface PKSelectionController
+ (id)_orderedStrokes:(void *)a3 relativeToStrokeOrderInDrawing:;
+ (id)_selectStrandedBitmapStrokesForIntersectedStrokesIfNecessary:(void *)a3 visibleOnscreenStrokes:;
- (BOOL)_hasExternalElementsInAttachment:(id *)a1;
- (BOOL)_hasExternalElementsSelectedInAttachment:(BOOL)a1;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)isRTL;
- (CGAffineTransform)transformFromStrokeSpaceToViewInDrawing:(SEL)a3;
- (CGColor)selectionColor;
- (CGRect)attachmentBoundsForDrawing:(id)a3;
- (OS_dispatch_queue)selectionHullQueue;
- (PKStrokeSelectionImageConfig)cachedImageConfigForSelection:(uint64_t)a3 scaleStrategy:(uint64_t)a4 highlighted:;
- (__n128)_pointInStrokeSpace:(double)a3 inDrawing:(double)a4;
- (double)_scrollContent:(double)a3;
- (double)_scrollViewDrawingFrame;
- (double)_selectionOffsetForDrawing:(uint64_t)a1;
- (double)autoscrollForPointIfNecessary:(double)a3;
- (double)calculateFrameForSelectionView:(void *)a3 inDrawing:;
- (double)closestPointForPastedSelectionRect:(double)a3 withDrawing:(double)a4;
- (double)editMenuTargetRect;
- (double)scaleForDrawing:(id)a3;
- (id)_IDsFromExternalElements:(void *)a1;
- (id)_attachmentForSelectionRect:(double)a3;
- (id)_attachmentForStrokeSelection:(id *)a1;
- (id)_commitStrokeSelection:(void *)a3 toDrawing:(uint64_t)a4 selectionAction:(uint64_t)a5 selectionType:;
- (id)_commitStrokeSelection:(void *)a3 toDrawing:(uint64_t)a4 selectionAction:(void *)a5 inkChanges:(uint64_t)a6 selectionType:(void *)a7 withCompletion:;
- (id)_contextMenuInteraction:(void *)a3 configurationForExternalElement:(void *)a4 inAttachment:;
- (id)_contextMenuInteraction:(void *)a3 previewForHighlightingMenuWithConfiguration:(void *)a4 forExternalElement:(void *)a5 inAttachment:;
- (id)_currentAttachment;
- (id)_didDuplicateExternalElements:(void *)a3 inAttachment:;
- (id)_didLongPressElement:(void *)a3 withGesture:(void *)a4 inAttachment:;
- (id)_drawingForSelectionRect:(double)a3;
- (id)_elementsForSpaceInsertedAtPoint:(double)a3 inAttachment:(double)a4;
- (id)_externalElementsAtLocation:(double)a3 inAttachment:(double)a4;
- (id)_externalElementsForIDs:(void *)a3 inAttachment:;
- (id)_externalElementsInAttachment:(id *)a1;
- (id)_externalElementsInRect:(double)a3 inAttachment:(double)a4;
- (id)_firstStrokesInStrokes:(id)a3;
- (id)_itemProviderForExternalElements:(void *)a3 inAttachment:;
- (id)_lastStrokesInStrokes:(id)a3;
- (id)_pasteboardRepresentationsForExternalElements:(void *)a3 inAttachment:;
- (id)_selectedExternalElementsContainsPoint:(double)a3 inAttachment:(double)a4;
- (id)_selectedExternalElementsInAttachment:(uint64_t)a1;
- (id)_strokeForLassoPath:(void *)a3 inDrawing:;
- (id)_strokeSelectionForDropSession:(uint64_t)a1;
- (id)_visibleOnscreenStrokesForDrawing:(uint64_t)a1;
- (id)_visibleOnscreenStrokesIncludingCurrentSelection:(void *)a3 forDrawing:;
- (id)_visibleStrokesWithinExtendedBounds:(void *)a3 forDrawing:;
- (id)applySpaceInsertionWithStrokeSelection:(void *)a3 inDrawing:(void *)a4 offset:(CGFloat)a5 completion:;
- (id)drawingForUUID:(uint64_t)a1;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)editMenuActionsForConfiguration:(uint64_t)a1;
- (id)initWithTiledView:(id *)a1;
- (id)selectionInteraction;
- (id)topView;
- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)currentIntersectionAlgorithm;
- (uint64_t)_externalElements:(void *)a3 locationOutOfBounds:(double)a4 inAttachment:(double)a5;
- (uint64_t)_hasStrokesOrExternalElementsSelectedInAttachment:(uint64_t)a1;
- (uint64_t)_isValidDropPointForStrokes:(double)a3;
- (uint64_t)_isValidDropPointForStrokes:(double)a3 didInsertNewAttachment:(double)a4;
- (uint64_t)_liveDrawingIsAtEndOfDocument;
- (uint64_t)_selectionInteractionCanPerformAction:(void *)a3 withSender:(void *)a4 inAttachment:;
- (uint64_t)contentTypeForIntersectedStrokes:(void *)a3 inDrawing:;
- (uint64_t)hasStrokesOrElementsSelection;
- (uint64_t)refinementEnabled;
- (uint64_t)shouldClampInputPoints;
- (uint64_t)supportsCopyAsText;
- (void)_addItemsToPasteboard:(id)a3;
- (void)_clearExternalSelectionInAttachment:(id *)a1;
- (void)_contextMenuInteraction:(void *)a3 willDisplayMenuForConfiguration:(void *)a4 animator:(void *)a5 forExternalElement:(void *)a6 inAttachment:;
- (void)_contextMenuInteraction:(void *)a3 willEndForConfiguration:(void *)a4 animator:(void *)a5 forExternalElement:(void *)a6 inAttachment:;
- (void)_createSelectionViewForDropSession:(char)a3 removeFromSource:(void *)a4 withStrokeSelection:;
- (void)_didAddDrawingAttachmentView;
- (void)_didDeleteExternalElements:(void *)a3 inAttachment:;
- (void)_didDragExternalElements:(void *)a3 withTransform:(void *)a4 inAttachment:;
- (void)_didDropExternalElementsItemProvider:(void *)a3 inAttachment:(void *)a4 withCompletion:;
- (void)_didEndDraggingExternalElements:(void *)a3 inAttachment:;
- (void)_didEndInsertSpaceInAttachment:(id *)a1;
- (void)_didMoveInsertSpace:(double)a3 inAttachment:;
- (void)_didResizeExternalElements;
- (void)_didTapElement:(void *)a3 withGesture:(void *)a4 inAttachment:;
- (void)_dragInteractionWillBeginForExternalElements:(void *)a3 inAttachment:;
- (void)_dragInteractionWillEndForExternalElements:(uint64_t)a3 withOperation:(void *)a4 inAttachment:;
- (void)_imageViewForStrokes:(void *)a3 drawing:(long long *)a4 drawingTransform:(void *)a5 coordinateSpace:(void *)a6 completion:;
- (void)_imageViewForStrokes:(void *)a3 drawing:(void *)a4 completion:;
- (void)_installSelectionViewForCurrentSelectionFromExternalAttachments;
- (void)_layoutViewsIfNecessary;
- (void)_maskImageForStrokes:(uint64_t)a3 drawing:(void *)a4 imageView:(void *)a5 completion:;
- (void)_pasteStrokeSelection:(void *)a3 atPoint:(uint64_t)a4 inDrawing:(double)a5 withSelectionType:(double)a6;
- (void)_refreshExternalElementsInStrokeSelection:(void *)a1;
- (void)_refreshTiledViewWithSelectionForDrawing:(void *)a3 completion:;
- (void)_removeSelectionViewAnimated:(void *)a3 withCompletion:;
- (void)_resetExternalElements:(void *)a3 inAttachment:;
- (void)_resetSelectedStrokeStateForRenderer;
- (void)_selectStrokesWithoutDidSelectStrokesUpdate:(void *)a3 inDrawing:;
- (void)_selectionBeganInDrawing:(void *)a3 withPath:;
- (void)_selectionDrawingTransformForDrawing:(uint64_t)a3@<X8>;
- (void)_selectionRefreshWithChangeToDrawings:(void *)a3 completion:;
- (void)_selectionTransformForStrokes:(void *)a3 atLocation:(int)a4 dragOffsetInDragView:(void *)a5 constrainSelection:(double)a6 inDrawing:(double)a7;
- (void)_setAdditionalStrokes:(void *)a3 inDrawing:(void *)a4 completion:;
- (void)_share:(uint64_t)a1;
- (void)_tearDownSelectionView;
- (void)_willBeginInsertSpaceInAttachment:(id *)a1;
- (void)addTranscriptionToPasteboard:(void *)a1;
- (void)changeColorOfSelection:(uint64_t)a1;
- (void)changeColorOfSelection:(void *)a3 withCompletion:;
- (void)clearExternalSelectionIfNecessary;
- (void)clearSelectionIfNecessaryAnimated:(void *)a3 withCompletion:;
- (void)clearSelectionIfNecessaryWithCompletion:(uint64_t)a1;
- (void)commitStrokesWithCompletion:(uint64_t)a1;
- (void)copy:(void *)a1;
- (void)copyAll:(uint64_t)a1;
- (void)copyTranscription:(uint64_t)a1;
- (void)createSticker:(uint64_t)a1;
- (void)currentPasteboard;
- (void)cut:(void *)a1;
- (void)dealloc;
- (void)delete:(uint64_t)a1;
- (void)didBeginDraggingSelection;
- (void)didBeginModifyDrawing;
- (void)didBeginSpaceInsertionWithLassoPath:(double)a3 atLocation:(double)a4;
- (void)didBeginSpaceInsertionWithLassoStroke:(id)a3 drawing:(id)a4 addDefaultSpace:(BOOL)a5 strokesAbove:(id)a6 strokesBelow:(id)a7 externalElements:(id)a8;
- (void)didEndDraggingSelection;
- (void)didEndModifyDrawing;
- (void)didEndScroll;
- (void)didMoveStrokeSelectionToLocation:(double)a3;
- (void)didScroll:(double)a3;
- (void)didSelect:(id)a3 lassoStroke:(id)a4 transform:(CGAffineTransform *)a5 drawing:(id)a6;
- (void)didSelect:(id)a3 lassoStroke:(id)a4 transform:(CGAffineTransform *)a5 drawing:(id)a6 selectionType:(int64_t)a7 completion:(id)a8;
- (void)didSelectStrokesNotification:(id)a3;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)duplicate:(id *)a1;
- (void)eraseSelection;
- (void)fetchStrokesToSelectAtPoint:(uint64_t)a3 inDrawing:(uint64_t)a4 withSelectionType:(void *)a5 inputType:(void *)a6 existingSelection:(double)a7 completion:(double)a8;
- (void)fetchStrokesToSelectBetweenTopPoint:(void *)a3 bottomPoint:(void *)a4 inDrawing:(double)a5 liveScrollOffset:(double)a6 existingSelection:(double)a7 completion:(double)a8;
- (void)findCompleteTranscriptionForNote:(uint64_t)a1;
- (void)findTranscriptionForType:(void *)a3 withCompletion:;
- (void)findTranscriptionWithCompletion:(uint64_t)a1;
- (void)generateImageForStrokeSelection:(uint64_t)a3 scaleStrategy:(char)a4 highlighted:(void *)a5 withCompletion:;
- (void)getAllHandwritingTranscription:(uint64_t)a1;
- (void)hideStrokes:(void *)a3 inDrawing:;
- (void)insertSpace:(id *)a1;
- (void)insertSpaceAtPoint:(void *)a3 addDefaultSpace:(void *)a4 strokesAbove:(double)a5 strokesBelow:(double)a6;
- (void)lassoSelectStrokesInDrawing:(void *)a3 withPath:;
- (void)moveSelectionViewBasedOnStrokeTransform:(void *)a3 drawing:;
- (void)paste:(uint64_t)a1;
- (void)refine:(uint64_t)a1;
- (void)registerCommandWithUndoManager:(uint64_t)a1;
- (void)selectAll:(id *)a1;
- (void)selectStrokes:(uint64_t)a3 forSelectionType:(void *)a4 inDrawing:;
- (void)selectStrokes:(void *)a3 externalElements:(uint64_t)a4 forSelectionType:(void *)a5 inDrawing:;
- (void)selectStrokes:(void *)a3 externalElements:(uint64_t)a4 forSelectionType:(void *)a5 inDrawing:(void *)a6 completion:;
- (void)setCurrentStrokeSelection:(uint64_t)a1;
- (void)setImageOnSelectionViewForStrokeSelection:(void *)a3 withCompletion:;
- (void)setInsertSpaceEnabled:(uint64_t)a1;
- (void)setupSpaceInsertionControllerIfNecessary;
- (void)straighten:(uint64_t)a1;
- (void)supportsRefinement:(id *)a1;
- (void)translate:(uint64_t)a1;
- (void)updateCurrentSelectionWithNewDrawingIfNecessary:(uint64_t)a1;
- (void)updateCurrentStrokeSelectionTransformForLocation:(double)a3 atLocation:(double)a4 offsetInTouchView:(double)a5;
- (void)updateLiveSelectionForStrokesInLayer:(id)a3 inDrawing:(id)a4;
@end

@implementation PKSelectionController

- (id)selectionInteraction
{
  if (a1)
  {
    a1 = [a1[20] selectionInteraction];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)didScroll:(double)a3
{
  if (a1)
  {
    if ([a1[18] isCurrentlyAddingSpace]) {
      objc_msgSend(a1[18], "didScroll:", a2, a3);
    }
    if (a1[16])
    {
      id v6 = a1[19];
      if (v6)
      {
        v7 = [v6 dragGR];
        uint64_t v8 = [v7 state];

        if (v8 != 2)
        {
          id v9 = a1[16];
          id v10 = a1[16];
          v11 = [v10 drawing];
          double v12 = -[PKSelectionController calculateFrameForSelectionView:inDrawing:]((uint64_t)a1, v9, v11);
          double v14 = v13;
          double v16 = v15;
          double v18 = v17;

          objc_msgSend(a1[19], "setFrame:", v12, v14, v16, v18);
          memset(&v32, 0, sizeof(v32));
          v19 = [a1[16] drawing];
          [(PKSelectionController *)(uint64_t)a1 _selectionDrawingTransformForDrawing:(uint64_t)&v32];

          CGAffineTransform t1 = v32;
          id v20 = a1[19];
          v21 = v20;
          if (v20) {
            [v20 selectionDrawingTransform];
          }
          else {
            memset(&t2, 0, sizeof(t2));
          }
          BOOL v22 = CGAffineTransformEqualToTransform(&t1, &t2);

          if (!v22)
          {
            CGAffineTransform v28 = v32;
            memset(&v29, 0, sizeof(v29));
            id v23 = a1[19];
            v24 = v23;
            if (v23) {
              [v23 selectionDrawingTransform];
            }
            else {
              memset(&v26, 0, sizeof(v26));
            }
            CGAffineTransformInvert(&v27, &v26);
            CGAffineTransformConcat(&v29, &v28, &v27);

            CGAffineTransform v25 = v29;
            [a1[19] setTransform:&v25];
            -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)a1, 0, 0);
          }
        }
      }
    }
  }
}

- (id)initWithTiledView:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v25.receiver = a1;
    v25.super_class = (Class)PKSelectionController;
    v4 = (id *)objc_msgSendSuper2(&v25, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak(v4 + 15, v3);
      v5 = objc_alloc_init(PKImageGenerationController);
      id v6 = a1[13];
      a1[13] = v5;

      v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 addObserver:a1 selector:sel_didSelectStrokesNotification_ name:@"PKDidSelectStrokesNotification" object:0];

      uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);

      dispatch_queue_t v10 = dispatch_queue_create("com.apple.pencilkit.selection-hull", v9);
      id v11 = a1[8];
      a1[8] = v10;

      double v12 = [PKSelectionGestureView alloc];
      id WeakRetained = objc_loadWeakRetained(a1 + 15);
      [WeakRetained bounds];
      uint64_t v14 = -[PKSelectionGestureView initWithFrame:selectionController:](v12, "initWithFrame:selectionController:", a1);
      id v15 = a1[20];
      a1[20] = (id)v14;

      id v16 = objc_loadWeakRetained(a1 + 15);
      [v16 addSubview:a1[20]];

      double v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      double v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_USER_INTERACTIVE, 0);

      dispatch_queue_t v19 = dispatch_queue_create("com.apple.PencilKit.SelectionIntersection", v18);
      id v20 = a1[7];
      a1[7] = v19;

      uint64_t v21 = [objc_alloc(MEMORY[0x1E4FB1738]) initWithDelegate:a1];
      id v22 = a1[10];
      a1[10] = (id)v21;

      id v23 = objc_loadWeakRetained(a1 + 15);
      [v23 addInteraction:a1[10]];
    }
  }

  return a1;
}

- (double)scaleForDrawing:(id)a3
{
  id v4 = a3;
  [(PKSelectionController *)(uint64_t)self _selectionDrawingTransformForDrawing:(uint64_t)v7];
  double v5 = DKDScaleForTransform(v7);

  return v5;
}

- (void)_selectionDrawingTransformForDrawing:(uint64_t)a3@<X8>
{
  id v5 = a2;
  if (a1)
  {
    id v6 = (id *)(a1 + 120);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    uint64_t v8 = [v5 uuid];
    id v9 = [WeakRetained _attachmentForUUID:v8];

    memset(&v16, 0, sizeof(v16));
    if (v9)
    {
      [v9 drawingTransform];
    }
    else
    {
      long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v16.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v16.c = v10;
      *(_OWORD *)&v16.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    }
    id v11 = objc_loadWeakRetained(v6);
    [v11 canvasZoomScale];
    CGFloat v13 = v12;

    CGAffineTransformMakeScale(&t1, v13, v13);
    CGAffineTransform v14 = v16;
    CGAffineTransformConcat((CGAffineTransform *)a3, &t1, &v14);
  }
  else
  {
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)a3 = 0u;
  }
}

- (BOOL)isRTL
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);
  }
  else {
    id WeakRetained = 0;
  }
  BOOL v3 = [WeakRetained effectiveUserInterfaceLayoutDirection] == 1;

  return v3;
}

- (void)_layoutViewsIfNecessary
{
  if (a1)
  {
    if ([a1[18] isCurrentlyAddingSpace]) {
      [a1[18] _layoutViewsIfNecessary];
    }
    id WeakRetained = objc_loadWeakRetained(a1 + 15);
    [WeakRetained bounds];
    objc_msgSend(a1[20], "setFrame:");
  }
}

- (CGColor)selectionColor
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);
  }
  else {
    id WeakRetained = 0;
  }
  id v3 = [WeakRetained interactionTintColor];
  id v4 = (CGColor *)[v3 CGColor];

  return v4;
}

- (void)setInsertSpaceEnabled:(uint64_t)a1
{
  if (a1)
  {
    if (a2) {
      id v4 = -[PKSelectionController setupSpaceInsertionControllerIfNecessary]((void *)a1);
    }
    *(unsigned char *)(a1 + 114) = a2;
    -[PKSelectionController selectionInteraction]((id *)a1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v5 setInsertSpaceEnabled:a2];
  }
}

- (void)setupSpaceInsertionControllerIfNecessary
{
  if (a1)
  {
    v2 = a1;
    id v3 = (void *)a1[18];
    if (!v3)
    {
      id v4 = [[PKSpaceInsertionController alloc] initWithSelectionController:a1];
      id v5 = (void *)v2[18];
      v2[18] = v4;

      id v3 = (void *)v2[18];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)didEndScroll
{
  if (self && self->_currentStrokeSelection && ![(PKSelectionView *)self->_selectionView isDragging])
  {
    currentStrokeSelection = self->_currentStrokeSelection;
    -[PKSelectionController setImageOnSelectionViewForStrokeSelection:withCompletion:]((id *)&self->super.isa, currentStrokeSelection, 0);
  }
}

- (id)topView
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 15);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)dealloc
{
  id v3 = +[PKSelectionStatisticsManager sharedStatisticsManager];
  [v3 logEndSelectionSessionIfNecessary];

  id v4 = [(UIDropInteraction *)self->_dropInteraction view];

  if (v4)
  {
    id v5 = [(UIDropInteraction *)self->_dropInteraction view];
    [v5 removeInteraction:self->_dropInteraction];
  }
  v6.receiver = self;
  v6.super_class = (Class)PKSelectionController;
  [(PKSelectionController *)&v6 dealloc];
}

- (uint64_t)shouldClampInputPoints
{
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  uint64_t v2 = [WeakRetained _shouldUpdateHeightOfAttachments];

  return v2;
}

- (uint64_t)hasStrokesOrElementsSelection
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = -[PKSelectionController selectionInteraction](a1);
  uint64_t v2 = [v1 hasStrokesOrElementsSelection];

  return v2;
}

- (void)setCurrentStrokeSelection:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (v3)
    {
      id v5 = [v3 strokes];
      uint64_t v6 = [v5 count];

      if (!v6)
      {
        v7 = os_log_create("com.apple.pencilkit", "Selection");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id v15 = 0;
          _os_log_debug_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEBUG, "Selection set to an empty set of strokes. Setting to nil instead", v15, 2u);
        }

        id v4 = 0;
      }
    }
    id v8 = *(id *)(a1 + 128);
    objc_storeStrong((id *)(a1 + 128), v4);
    if (v8 != v4)
    {
      if (!v4
        || !v8
        || ([v8 strokeIdentifiers],
            id v9 = objc_claimAutoreleasedReturnValue(),
            [v4 strokeIdentifiers],
            long long v10 = objc_claimAutoreleasedReturnValue(),
            char v11 = [v9 isEqual:v10],
            v10,
            v9,
            (v11 & 1) == 0))
      {
        double v12 = (void *)MEMORY[0x1E4FBA8A8];
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
        [v12 cancelPreviousPerformRequestsWithTarget:WeakRetained selector:sel_selectionDidChange object:0];

        id v14 = objc_loadWeakRetained((id *)(a1 + 120));
        [v14 performSelector:sel_selectionDidChange withObject:0 afterDelay:0.2];
      }
    }
  }
}

- (id)_visibleOnscreenStrokesForDrawing:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    id v5 = [v3 uuid];
    uint64_t v6 = [WeakRetained _attachmentForUUID:v5];

    uint64_t v7 = [v6 strokeSpatialCache];
    id v8 = (void *)v7;
    if (v7 && *(unsigned char *)(v7 + 8))
    {
      uint64_t v9 = [v6 strokeSpatialCache];
      long long v10 = (void *)v9;
      if (v9) {
        char v11 = *(void **)(v9 + 24);
      }
      else {
        char v11 = 0;
      }
      id v12 = v11;
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (int64_t)currentIntersectionAlgorithm
{
  return self->_currentIntersectionAlgorithm;
}

- (id)_visibleOnscreenStrokesIncludingCurrentSelection:(void *)a3 forDrawing:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA70] orderedSet];
    id v8 = -[PKSelectionController _visibleOnscreenStrokesForDrawing:](a1, v6);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    objc_msgSend(WeakRetained, "visibleOnscreenBoundsForDrawing:slack:", v6, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v18 = v8;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v18);
          }
          id v22 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          objc_msgSend(v22, "_bounds", (void)v34);
          v43.origin.x = v23;
          v43.origin.y = v24;
          v43.size.width = v25;
          v43.size.height = v26;
          v41.origin.x = v11;
          v41.origin.y = v13;
          v41.size.width = v15;
          v41.size.height = v17;
          if (!CGRectContainsRect(v41, v43))
          {
            [v22 _bounds];
            v44.origin.x = v11;
            v44.origin.y = v13;
            v44.size.width = v15;
            v44.size.height = v17;
            if (!CGRectIntersectsRect(v42, v44)) {
              continue;
            }
            [v22 _bounds];
            DKDPercentRectInsideRect(v27, v28, v29, v30, v11, v13, v15, v17);
            if (v31 <= 0.5) {
              continue;
            }
          }
          [v7 addObject:v22];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v19);
    }

    if (v5) {
      [v7 addObjectsFromArray:v5];
    }
    CGAffineTransform v32 = objc_msgSend(v7, "array", (void)v34);
  }
  else
  {
    CGAffineTransform v32 = 0;
  }

  return v32;
}

- (void)fetchStrokesToSelectAtPoint:(uint64_t)a3 inDrawing:(uint64_t)a4 withSelectionType:(void *)a5 inputType:(void *)a6 existingSelection:(double)a7 completion:(double)a8
{
  id v15 = a2;
  id v16 = a5;
  id v17 = a6;
  if (a1)
  {
    id v18 = -[PKSelectionController _visibleOnscreenStrokesIncludingCurrentSelection:forDrawing:](a1, v16, v15);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    uint64_t v20 = [v15 uuid];
    uint64_t v21 = [WeakRetained _attachmentForUUID:v20];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __120__PKSelectionController_fetchStrokesToSelectAtPoint_inDrawing_withSelectionType_inputType_existingSelection_completion___block_invoke;
    v22[3] = &unk_1E64C81D8;
    v22[4] = a1;
    uint64_t v25 = a3;
    id v23 = v15;
    id v24 = v17;
    objc_msgSend(v21, "fetchIntersectedStrokesAtPoint:selectionType:inputType:visibleOnscreenStrokes:completion:", a3, a4, v18, v22, a7, a8);
  }
}

void __120__PKSelectionController_fetchStrokesToSelectAtPoint_inDrawing_withSelectionType_inputType_existingSelection_completion___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 intersectedStrokes];
  *(void *)(*(void *)(a1 + 32) + 40) = [v9 intersectionAlgorithmType];
  if ([v3 count])
  {
    unint64_t v4 = *(void *)(a1 + 56);
    if (v4 > 6 || ((1 << v4) & 0x43) == 0)
    {
      id v5 = -[PKSelectionController _visibleOnscreenStrokesForDrawing:](*(void *)(a1 + 32), *(void **)(a1 + 40));
      uint64_t v6 = +[PKSelectionController _selectStrandedBitmapStrokesForIntersectedStrokesIfNecessary:visibleOnscreenStrokes:]((uint64_t)PKSelectionController, v3, v5);

      id v3 = (void *)v6;
    }
    uint64_t v7 = +[PKSelectionController _orderedStrokes:relativeToStrokeOrderInDrawing:]((uint64_t)PKSelectionController, v3, *(void **)(a1 + 40));

    id v3 = (void *)v7;
  }
  id v8 = objc_alloc_init(PKIntersectionResult);
  [(PKIntersectionResult *)v8 setIntersectedStrokes:v3];
  -[PKIntersectionResult setIntersectionAlgorithmType:](v8, "setIntersectionAlgorithmType:", [v9 intersectionAlgorithmType]);
  -[PKIntersectionResult setContentType:](v8, "setContentType:", [v9 contentType]);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (id)_selectStrandedBitmapStrokesForIntersectedStrokesIfNecessary:(void *)a3 visibleOnscreenStrokes:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  id v32 = a3;
  self;
  id v33 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v4 = v32;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v9 = [v8 _strokeMask];
        BOOL v10 = v9 == 0;

        if (!v10)
        {
          double v11 = [v8 _strokeMask];
          double v12 = (void *)[v11 centerlineSlices];
          BOOL v13 = v12[1] == *v12;

          if (v13)
          {
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            id v14 = v34;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v15)
            {
              uint64_t v16 = *(void *)v36;
              while (2)
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v36 != v16) {
                    objc_enumerationMutation(v14);
                  }
                  id v18 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                  [v8 _bounds];
                  double v20 = v19;
                  CGFloat v22 = v21;
                  CGFloat v24 = v23;
                  CGFloat v26 = v25;
                  [v18 _bounds];
                  if (DKDDistanceToRectFromRect(v20, v22, v24, v26, v27, v28, v29, v30) < 20.0)
                  {
                    [v33 addObject:v8];
                    goto LABEL_18;
                  }
                }
                uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v43 count:16];
                if (v15) {
                  continue;
                }
                break;
              }
            }
LABEL_18:
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v5);
  }

  [v33 unionOrderedSet:v34];

  return v33;
}

+ (id)_orderedStrokes:(void *)a3 relativeToStrokeOrderInDrawing:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = objc_msgSend(v5, "strokes", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ([v4 containsObject:v11]) {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v6;
}

- (void)fetchStrokesToSelectBetweenTopPoint:(void *)a3 bottomPoint:(void *)a4 inDrawing:(double)a5 liveScrollOffset:(double)a6 existingSelection:(double)a7 completion:(double)a8
{
  id v19 = a2;
  id v20 = a3;
  id v21 = a4;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    double v23 = [v19 uuid];
    CGFloat v24 = [WeakRetained _attachmentForUUID:v23];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __129__PKSelectionController_fetchStrokesToSelectBetweenTopPoint_bottomPoint_inDrawing_liveScrollOffset_existingSelection_completion___block_invoke;
    v25[3] = &unk_1E64C8228;
    v25[4] = a1;
    id v26 = v20;
    id v27 = v19;
    double v29 = a9;
    double v30 = a10;
    double v31 = a5;
    double v32 = a6;
    double v33 = a7;
    double v34 = a8;
    id v28 = v21;
    objc_msgSend(v24, "fetchIntersectedStrokesBetweenTopPoint:bottomPoint:liveScrollOffset:completion:", v25, a5, a6, a7, a8, a9, a10);
  }
}

void __129__PKSelectionController_fetchStrokesToSelectBetweenTopPoint_bottomPoint_inDrawing_liveScrollOffset_existingSelection_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 intersectedStrokes];
  *(void *)(*(void *)(a1 + 32) + 40) = [v3 intersectionAlgorithmType];
  if (v3 && v4)
  {
    id v5 = -[PKSelectionController _visibleOnscreenStrokesForDrawing:](*(void *)(a1 + 32), *(void **)(a1 + 48));
    uint64_t v6 = +[PKSelectionController _selectStrandedBitmapStrokesForIntersectedStrokesIfNecessary:visibleOnscreenStrokes:]((uint64_t)PKSelectionController, v4, v5);

    uint64_t v7 = +[PKSelectionController _orderedStrokes:relativeToStrokeOrderInDrawing:]((uint64_t)PKSelectionController, v6, *(void **)(a1 + 48));

    uint64_t v8 = objc_alloc_init(PKIntersectionResult);
    [(PKIntersectionResult *)v8 setIntersectedStrokes:v7];
    -[PKIntersectionResult setIntersectionAlgorithmType:](v8, "setIntersectionAlgorithmType:", [v3 intersectionAlgorithmType]);
    -[PKIntersectionResult setContentType:](v8, "setContentType:", [v3 contentType]);
    uint64_t v9 = *(void *)(a1 + 56);
    if (v9) {
      (*(void (**)(uint64_t, PKIntersectionResult *))(v9 + 16))(v9, v8);
    }

    id v4 = (void *)v7;
  }
  else
  {
    BOOL v10 = os_log_create("com.apple.pencilkit", "Recognition");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "Had to fall back to a naive geometry method", buf, 2u);
    }

    *(void *)(*(void *)(a1 + 32) + 40) = 0;
    uint64_t v11 = -[PKSelectionController _visibleOnscreenStrokesIncludingCurrentSelection:forDrawing:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
    double v12 = (void *)v11;
    if (*(double *)(a1 + 64) == 0.0 && *(double *)(a1 + 72) == 0.0) {
      long long v13 = (void *)v11;
    }
    else {
      long long v13 = 0;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    long long v23 = *(_OWORD *)(a1 + 96);
    long long v24 = *(_OWORD *)(a1 + 80);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __129__PKSelectionController_fetchStrokesToSelectBetweenTopPoint_bottomPoint_inDrawing_liveScrollOffset_existingSelection_completion___block_invoke_20;
    v25[3] = &unk_1E64C8200;
    long long v15 = *(void **)(a1 + 48);
    id v26 = *(id *)(a1 + 56);
    id v16 = v15;
    id v17 = v13;
    uint64_t v18 = v25;
    if (v14)
    {
      id v19 = *(void **)(v14 + 72);
      if (v19) {
        dispatch_block_cancel(v19);
      }
      objc_initWeak(&location, (id)v14);
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      double v29 = __146__PKSelectionController__findIntersectedStrokesWithoutRecognitionToSelectBetweenTopPoint_bottomPoint_inDrawing_visibleOnscreenStrokes_completion___block_invoke;
      double v30 = &unk_1E64C82A0;
      id v31 = v16;
      long long v35 = v24;
      long long v36 = v23;
      id v32 = v17;
      double v33 = v18;
      objc_copyWeak(&v34, &location);
      dispatch_block_t v20 = dispatch_block_create((dispatch_block_flags_t)0, buf);
      id v21 = *(void **)(v14 + 72);
      *(void *)(v14 + 72) = v20;

      dispatch_time_t v22 = dispatch_time(0, 0);
      dispatch_after(v22, *(dispatch_queue_t *)(v14 + 56), *(dispatch_block_t *)(v14 + 72));
      objc_destroyWeak(&v34);

      objc_destroyWeak(&location);
    }
  }
}

void __129__PKSelectionController_fetchStrokesToSelectBetweenTopPoint_bottomPoint_inDrawing_liveScrollOffset_existingSelection_completion___block_invoke_20(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_alloc_init(PKIntersectionResult);
  [(PKIntersectionResult *)v3 setIntersectedStrokes:v5];
  [(PKIntersectionResult *)v3 setIntersectionAlgorithmType:0];
  [(PKIntersectionResult *)v3 setContentType:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, PKIntersectionResult *))(v4 + 16))(v4, v3);
  }
}

void __146__PKSelectionController__findIntersectedStrokesWithoutRecognitionToSelectBetweenTopPoint_bottomPoint_inDrawing_visibleOnscreenStrokes_completion___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 64);
  double v3 = *(double *)(a1 + 72);
  double v4 = *(double *)(a1 + 80);
  double v5 = *(double *)(a1 + 88);
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __146__PKSelectionController__findIntersectedStrokesWithoutRecognitionToSelectBetweenTopPoint_bottomPoint_inDrawing_visibleOnscreenStrokes_completion___block_invoke_2;
  v8[3] = &unk_1E64C8278;
  id v9 = v6;
  id v10 = *(id *)(a1 + 48);
  objc_copyWeak(&v11, (id *)(a1 + 56));
  objc_msgSend(v9, "fetchIntersectedStrokesBetweenPoint:otherPoint:visibleOnscreenStrokes:completion:", v7, v8, v2, v3, v4, v5);
  objc_destroyWeak(&v11);
}

void __146__PKSelectionController__findIntersectedStrokesWithoutRecognitionToSelectBetweenTopPoint_bottomPoint_inDrawing_visibleOnscreenStrokes_completion___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = +[PKSelectionController _orderedStrokes:relativeToStrokeOrderInDrawing:]((uint64_t)PKSelectionController, a2, *(void **)(a1 + 32));
  double v4 = *(void **)(a1 + 40);
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __146__PKSelectionController__findIntersectedStrokesWithoutRecognitionToSelectBetweenTopPoint_bottomPoint_inDrawing_visibleOnscreenStrokes_completion___block_invoke_3;
    block[3] = &unk_1E64C8250;
    id v7 = v4;
    id v6 = v3;
    objc_copyWeak(&v8, (id *)(a1 + 48));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v8);
  }
}

void __146__PKSelectionController__findIntersectedStrokesWithoutRecognitionToSelectBetweenTopPoint_bottomPoint_inDrawing_visibleOnscreenStrokes_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    double v3 = (void *)WeakRetained[9];
    WeakRetained[9] = 0;
    double v4 = WeakRetained;

    id WeakRetained = v4;
  }
}

- (uint64_t)contentTypeForIntersectedStrokes:(void *)a3 inDrawing:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    id v8 = [v6 uuid];
    id v9 = [WeakRetained _attachmentForUUID:v8];

    a1 = [v9 contentTypeForIntersectedStrokes:v5];
  }

  return a1;
}

- (void)selectStrokes:(uint64_t)a3 forSelectionType:(void *)a4 inDrawing:
{
  id v8 = a2;
  id v7 = a4;
  if (a1) {
    -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:completion:](a1, v8, 0, a3, v7, 0);
  }
}

- (void)selectStrokes:(void *)a3 externalElements:(uint64_t)a4 forSelectionType:(void *)a5 inDrawing:(void *)a6 completion:
{
  id v11 = a2;
  id v27 = a3;
  id v12 = a5;
  long long v13 = a6;
  if (a1)
  {
    uint64_t v14 = +[PKSelectionStatisticsManager sharedStatisticsManager];
    [v14 recordDidMakeSelectionWithType:a4];

    if (![v11 count] && !objc_msgSend(v27, "count")) {
      goto LABEL_5;
    }
    id v15 = a1[16];
    id v16 = [v15 strokes];
    id v17 = [v16 set];
    uint64_t v18 = [v11 set];
    char v19 = [v17 isEqualToSet:v18];

    if ((v19 & 1) == 0)
    {
      if (a4 && a4 != 6)
      {
        uint64_t v24 = +[PKCanvasSessionStatisticsManager sharedStatisticsManager]();
        double v25 = (void *)v24;
        if (v24) {
          -[PKCanvasSessionStatisticsManager logFeatureUsed:](v24, (void *)*MEMORY[0x1E4F5BFF0]);
        }
      }
      id v26 = +[PKSelectionController _orderedStrokes:relativeToStrokeOrderInDrawing:]((uint64_t)PKSelectionController, v11, v12);

      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __94__PKSelectionController_selectStrokes_externalElements_forSelectionType_inDrawing_completion___block_invoke;
      v28[3] = &unk_1E64C82C8;
      id v11 = v26;
      id v29 = v11;
      id v30 = v27;
      id v31 = v12;
      id v32 = a1;
      uint64_t v34 = a4;
      double v33 = v13;
      -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)a1, 0, v28);
    }
    else
    {
LABEL_5:
      id WeakRetained = objc_loadWeakRetained(a1 + 15);
      id v21 = [v12 uuid];
      dispatch_time_t v22 = [WeakRetained _attachmentForUUID:v21];

      if ([v22 isExternalAttachment])
      {
        if ([v11 count] && (objc_opt_respondsToSelector() & 1) != 0)
        {
          long long v23 = [v11 array];
          [v22 didSelectPreviouslySelectedStrokes:v23];
        }
        else if (![v11 count] && (objc_opt_respondsToSelector() & 1) != 0)
        {
          [v22 didDeselectAllStrokes];
        }
      }
      [a1[19] setSelectionType:a4];
      if (v13) {
        v13[2](v13);
      }
    }
  }
}

- (void)selectStrokes:(void *)a3 externalElements:(uint64_t)a4 forSelectionType:(void *)a5 inDrawing:
{
  id v11 = a2;
  id v9 = a3;
  id v10 = a5;
  if (a1) {
    -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:completion:](a1, v11, v9, a4, v10, 0);
  }
}

void __94__PKSelectionController_selectStrokes_externalElements_forSelectionType_inDrawing_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v2 = os_log_create("com.apple.pencilkit", "Selection");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = v5;
    _os_log_debug_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEBUG, "Selected %lu strokes", buf, 0xCu);
  }

  double v3 = [[PKStrokeSelection alloc] initWithStrokes:*(void *)(a1 + 32) externalElements:*(void *)(a1 + 40) lassoStroke:0 drawing:*(void *)(a1 + 48)];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v6[0] = *MEMORY[0x1E4F1DAB8];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [*(id *)(a1 + 56) didSelect:v3 lassoStroke:0 transform:v6 drawing:*(void *)(a1 + 48) selectionType:*(void *)(a1 + 72) completion:*(void *)(a1 + 64)];
}

- (void)clearSelectionIfNecessaryAnimated:(void *)a3 withCompletion:
{
  uint64_t v5 = a3;
  if (a1)
  {
    if ([*(id *)(a1 + 152) isDragging])
    {
      if (v5) {
        v5[2](v5);
      }
    }
    else
    {
      *(unsigned char *)(a1 + 112) = 1;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __74__PKSelectionController_clearSelectionIfNecessaryAnimated_withCompletion___block_invoke;
      aBlock[3] = &unk_1E64C53B8;
      aBlock[4] = a1;
      id v16 = v5;
      id v6 = (void (**)(void))_Block_copy(aBlock);
      if ([*(id *)(a1 + 144) isCurrentlyAddingSpace]) {
        [*(id *)(a1 + 144) commitSpacingResize];
      }
      id v7 = *(id *)(a1 + 128);
      if (*(void *)(a1 + 128))
      {
        uint64_t v8 = os_log_create("com.apple.pencilkit", "Selection");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)uint64_t v14 = 0;
          _os_log_debug_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEBUG, "Clearing the selection", v14, 2u);
        }

        uint64_t v9 = +[PKSelectionStatisticsManager sharedStatisticsManager];
        [v9 logSelectionAction:0];

        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
        int v11 = [WeakRetained editMenuVisible];

        if (v11)
        {
          id v12 = objc_loadWeakRetained((id *)(a1 + 120));
          long long v13 = [v12 editMenuInteraction];
          [v13 dismissMenu];
        }
        -[PKSelectionController _removeSelectionViewAnimated:withCompletion:](a1, a2, v6);
        -[PKSelectionController _resetSelectedStrokeStateForRenderer](a1);
      }
      else if (v6)
      {
        v6[2](v6);
      }
      if (v7 == *(id *)(a1 + 128)) {
        -[PKSelectionController setCurrentStrokeSelection:](a1, 0);
      }
    }
  }
}

- (void)_selectStrokesWithoutDidSelectStrokesUpdate:(void *)a3 inDrawing:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = +[PKSelectionController _orderedStrokes:relativeToStrokeOrderInDrawing:]((uint64_t)PKSelectionController, v5, v6);

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__PKSelectionController__selectStrokesWithoutDidSelectStrokesUpdate_inDrawing___block_invoke;
    v8[3] = &unk_1E64C53E0;
    void v8[4] = a1;
    id v5 = v7;
    id v9 = v5;
    id v10 = v6;
    -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](a1, 0, v8);
  }
}

void __79__PKSelectionController__selectStrokesWithoutDidSelectStrokesUpdate_inDrawing___block_invoke(uint64_t a1)
{
  -[PKSelectionController _resetSelectedStrokeStateForRenderer](*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = MEMORY[0x1E4F1DAB8];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)(v2 + 168) = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)(v2 + 184) = v4;
    *(_OWORD *)(v2 + 200) = *(_OWORD *)(v3 + 32);
  }
  if ([*(id *)(a1 + 40) count])
  {
    id v5 = [[PKStrokeSelection alloc] initWithStrokes:*(void *)(a1 + 40) lassoStroke:0 drawing:*(void *)(a1 + 48)];
    -[PKSelectionController setCurrentStrokeSelection:](*(void *)(a1 + 32), v5);
  }
}

- (void)_resetSelectedStrokeStateForRenderer
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    [WeakRetained _resetSelectedStrokeStateForRenderer];
  }
}

- (void)lassoSelectStrokesInDrawing:(void *)a3 withPath:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = +[PKSelectionStatisticsManager sharedStatisticsManager];
    [v7 recordDidMakeSelectionWithType:0];

    if (*(void *)(a1 + 128))
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __62__PKSelectionController_lassoSelectStrokesInDrawing_withPath___block_invoke;
      v8[3] = &unk_1E64C53E0;
      void v8[4] = a1;
      id v9 = v5;
      id v10 = v6;
      -[PKSelectionController clearSelectionIfNecessaryWithCompletion:](a1, v8);
    }
    else
    {
      -[PKSelectionController _selectionBeganInDrawing:withPath:]((id *)a1, v5, v6);
    }
  }
}

void __62__PKSelectionController_lassoSelectStrokesInDrawing_withPath___block_invoke(uint64_t a1)
{
}

- (void)_selectionBeganInDrawing:(void *)a3 withPath:
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v53 = a3;
  if (a1)
  {
    kdebug_trace();
    v54 = -[PKSelectionController _strokeForLassoPath:inDrawing:]((uint64_t)a1, v53, v5);
    id WeakRetained = objc_loadWeakRetained(a1 + 15);
    id v7 = [v5 uuid];
    uint64_t v8 = [WeakRetained _attachmentForUUID:v7];

    v50 = -[PKSelectionController _visibleOnscreenStrokesForDrawing:]((uint64_t)a1, v5);
    v52 = [v5 intersectedStrokesFromStroke:v54 visibleOnscreenStrokes:v8];
    id v9 = v53;
    id v10 = (id)v8;
    int v11 = -[PKSelectionController selectionInteraction](a1);
    id v12 = [v11 delegate];
    LOBYTE(v8) = objc_opt_respondsToSelector();

    if (v8)
    {
      long long v13 = -[PKSelectionController selectionInteraction](a1);
      uint64_t v14 = [v13 delegate];
      id v15 = -[PKSelectionController selectionInteraction](a1);
      id v16 = [v10 attachmentView];
      id v17 = [v14 selectionInteraction:v15 requestElementsInPath:v9 inAttachment:v16];

      v51 = -[PKSelectionController _externalElementsForIDs:inAttachment:](a1, v17, v10);
    }
    else
    {
      v51 = 0;
    }

    kdebug_trace();
    uint64_t v18 = os_log_create("com.apple.pencilkit", "Selection");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v42 = [v52 count];
      uint64_t v43 = [v10 strokeSpatialCache];
      CGRect v44 = (void *)v43;
      if (v43) {
        BOOL v45 = *(unsigned char *)(v43 + 8) != 0;
      }
      else {
        BOOL v45 = 0;
      }
      uint64_t v46 = [v50 count];
      v47 = @"NO";
      *(_DWORD *)buf = 134218498;
      uint64_t v57 = v42;
      if (v45) {
        v47 = @"YES";
      }
      __int16 v58 = 2112;
      uint64_t v59 = (uint64_t)v47;
      __int16 v60 = 2048;
      uint64_t v61 = v46;
      _os_log_debug_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_DEBUG, "Found selected %lu strokes; used cached strokes: %@  visibleOnscreenStrokes:%lu",
        buf,
        0x20u);
    }
    char v19 = -[PKSelectionController selectionInteraction](a1);
    dispatch_block_t v20 = [v19 delegate];
    char v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) == 0) {
      goto LABEL_32;
    }
    dispatch_time_t v22 = [[PKStrokeSelection alloc] initWithStrokes:v52 externalElements:v51 lassoStroke:v54 drawing:v5];
    long long v23 = -[PKSelectionController selectionInteraction](a1);
    uint64_t v24 = [v23 delegate];
    double v25 = -[PKSelectionController selectionInteraction](a1);
    id v26 = [(PKStrokeSelection *)v22 strokeIdentifiers];
    id v27 = [v10 attachmentView];
    char v28 = [v24 selectionInteraction:v25 handleLassoSelection:v9 strokes:v26 inAttachment:v27];

    if ((v28 & 1) == 0)
    {
LABEL_32:
      if ([v52 count] || objc_msgSend(v51, "count"))
      {
        id v29 = os_log_create("com.apple.pencilkit", "Selection");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v48 = [v52 count];
          uint64_t v49 = [v51 count];
          *(_DWORD *)buf = 134218240;
          uint64_t v57 = v48;
          __int16 v58 = 2048;
          uint64_t v59 = v49;
          _os_log_debug_impl(&dword_1C44F8000, v29, OS_LOG_TYPE_DEBUG, "Selected %lu strokes, %lu external elements", buf, 0x16u);
        }

        id v30 = [[PKStrokeSelection alloc] initWithStrokes:v52 externalElements:v51 lassoStroke:v54 drawing:v5];
        id v31 = +[PKSelectionStatisticsManager sharedStatisticsManager];
        id v32 = v30;
        double v33 = [(PKStrokeSelection *)v32 strokes];
        uint64_t v34 = [v33 count];

        long long v35 = [(PKStrokeSelection *)v32 externalElements];
        uint64_t v36 = [v35 count];

        uint64_t v37 = 5;
        if (v36)
        {
          BOOL v38 = v34 == 0;
        }
        else
        {
          uint64_t v37 = 0;
          BOOL v38 = 1;
        }
        uint64_t v39 = 4;
        if (!v38) {
          uint64_t v39 = 6;
        }
        if (v34) {
          uint64_t v40 = v39;
        }
        else {
          uint64_t v40 = v37;
        }

        [v31 recordLassoSelectionEventWithContentType:v40];
        long long v41 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        v55[0] = *MEMORY[0x1E4F1DAB8];
        v55[1] = v41;
        v55[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        [a1 didSelect:v32 lassoStroke:v54 transform:v55 drawing:v5];
      }
      else
      {
        -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)a1, 1, 0);
      }
    }
  }
}

- (void)clearSelectionIfNecessaryWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  if (a1) {
    -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](a1, 1, v3);
  }
}

- (id)_strokeForLassoPath:(void *)a3 inDrawing:
{
  id v5 = a2;
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained transformFromViewToStrokeSpaceInDrawing:v6];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
  }

  v15[0] = v16;
  v15[1] = v17;
  v15[2] = v18;
  [v5 applyTransform:v15];
  id v9 = [MEMORY[0x1E4FB1618] blackColor];
  id v10 = +[PKInk inkWithIdentifier:@"com.apple.ink.lasso" color:v9 weight:-1.0];

  id v11 = objc_alloc((Class)[v6 strokeClass]);
  id v12 = v5;
  long long v13 = objc_msgSend(v11, "_initWithPath:ink:inputScale:", objc_msgSend(v12, "CGPath"), v10, 2.0);

  return v13;
}

- (void)didSelectStrokesNotification:(id)a3
{
  id v13 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = [v13 object];
  PKCheckedDynamicCast(v4, v5);
  id v6 = (PKSelectionController *)objc_claimAutoreleasedReturnValue();

  if (v6 != self)
  {
    id v7 = v6 ? objc_loadWeakRetained((id *)&v6->_tiledView) : 0;
    uint64_t v8 = [v7 window];
    id v9 = [v8 windowScene];
    id v10 = self ? objc_loadWeakRetained((id *)&self->_tiledView) : 0;
    id v11 = [v10 window];
    id v12 = [v11 windowScene];

    if (self)
    {
      if (v9 == v12) {
        -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)self, 1, 0);
      }
    }
  }
}

- (void)didSelect:(id)a3 lassoStroke:(id)a4 transform:(CGAffineTransform *)a5 drawing:(id)a6
{
  long long v6 = *(_OWORD *)&a5->c;
  v7[0] = *(_OWORD *)&a5->a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a5->tx;
  [(PKSelectionController *)self didSelect:a3 lassoStroke:a4 transform:v7 drawing:a6 selectionType:0 completion:0];
}

- (OS_dispatch_queue)selectionHullQueue
{
  return self->_selectionHullQueue;
}

- (void)didSelect:(id)a3 lassoStroke:(id)a4 transform:(CGAffineTransform *)a5 drawing:(id)a6 selectionType:(int64_t)a7 completion:(id)a8
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a8;
  id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 postNotificationName:@"PKDidSelectStrokesNotification" object:self];

  -[PKSelectionController _resetSelectedStrokeStateForRenderer]((uint64_t)self);
  if (self)
  {
    long long v16 = *(_OWORD *)&a5->a;
    long long v17 = *(_OWORD *)&a5->c;
    *(_OWORD *)&self->_selectionTransform.tx = *(_OWORD *)&a5->tx;
    *(_OWORD *)&self->_selectionTransform.c = v17;
    *(_OWORD *)&self->_selectionTransform.a = v16;
  }
  objc_initWeak(&location, self);
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v70 = __90__PKSelectionController_didSelect_lassoStroke_transform_drawing_selectionType_completion___block_invoke;
  v71 = &unk_1E64C82F0;
  objc_copyWeak(&v74, &location);
  long long v18 = *(_OWORD *)&a5->c;
  long long v75 = *(_OWORD *)&a5->a;
  long long v76 = v18;
  long long v77 = *(_OWORD *)&a5->tx;
  id v72 = v13;
  id v67 = v14;
  id v73 = v67;
  id v19 = v12;
  id v68 = v72;
  dispatch_block_t v20 = v69;
  if (self && v19)
  {
    v65 = v20;
    -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)self, 1, 0);
    if (self->_selectionView)
    {
      char v21 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C44F8000, v21, OS_LOG_TYPE_DEBUG, "Tried to add a selection view while another one was up", buf, 2u);
      }
    }
    -[PKSelectionController setCurrentStrokeSelection:]((uint64_t)self, v19);
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    double v22 = -[PKSelectionController calculateFrameForSelectionView:inDrawing:]((uint64_t)self, v19, v68);
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    selectionView = self->_selectionView;
    if (selectionView)
    {
      id v30 = [(PKSelectionView *)selectionView layer];
      [v30 removeAllAnimations];

      -[PKSelectionController _removeSelectionViewAnimated:withCompletion:]((uint64_t)self, 0, 0);
    }
    v64 = -[PKSelectionController _attachmentForStrokeSelection:]((id *)&self->super.isa, v19);
    id v31 = [v19 externalElements];
    id v32 = v64;
    double v33 = -[PKSelectionController selectionInteraction]((id *)&self->super.isa);
    uint64_t v34 = [v33 delegate];
    char v35 = objc_opt_respondsToSelector();

    if (v35)
    {
      uint64_t v36 = -[PKSelectionController _IDsFromExternalElements:](self, v31);
      uint64_t v37 = -[PKSelectionController selectionInteraction]((id *)&self->super.isa);
      BOOL v38 = [v37 delegate];
      uint64_t v39 = -[PKSelectionController selectionInteraction]((id *)&self->super.isa);
      uint64_t v40 = [v32 attachmentView];
      [v38 selectionInteraction:v39 didSelectElements:v36 inAttachment:v40];
    }
    long long v41 = [v19 strokes];
    uint64_t v42 = [v41 count];

    if (v42)
    {
      uint64_t v43 = -[PKSelectionView initWithFrame:strokeSelection:selectionController:selectionType:]([PKSelectionView alloc], "initWithFrame:strokeSelection:selectionController:selectionType:", v19, self, a7, v22, v24, v26, v28);
      CGRect v44 = self->_selectionView;
      self->_selectionView = v43;

      if ([v32 isExternalAttachment])
      {
        if (objc_opt_respondsToSelector()) {
          [v32 installSelectionView:self->_selectionView];
        }
      }
      else
      {
        BOOL v45 = -[PKSelectionController selectionInteraction]((id *)&self->super.isa);
        [v45 _didAddSelectionView:self->_selectionView];
      }
      int selectionViewCount = self->_selectionViewCount;
      self->_int selectionViewCount = selectionViewCount + 1;
      if (selectionViewCount < 0) {
        -[PKSelectionController _removeSelectionViewAnimated:withCompletion:]((uint64_t)self, 0, 0);
      }
      else {
        -[PKSelectionController setCurrentStrokeSelection:]((uint64_t)self, v19);
      }
      [(PKSelectionView *)self->_selectionView center];
      uint64_t v48 = v47;
      uint64_t v50 = v49;
      -[PKSelectionView setCenter:](self->_selectionView, "setCenter:");
      [(PKSelectionView *)self->_selectionView setAlpha:0.5];
      v51 = self->_selectionView;
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v80 = 3221225472;
      v81 = __102__PKSelectionController__addViewForStrokeSelection_isDragSource_drawing_selectionType_withCompletion___block_invoke;
      v82 = &unk_1E64C55F0;
      v83 = self;
      uint64_t v84 = v48;
      uint64_t v85 = v50;
      [MEMORY[0x1E4FB1EB0] transitionWithView:v51 duration:5242880 options:buf animations:0 completion:0.1];
    }
    else
    {
      -[PKSelectionController setCurrentStrokeSelection:]((uint64_t)self, 0);
    }
    ((void (*)(void *, PKSelectionView *))v70)(v65, self->_selectionView);

    dispatch_block_t v20 = v65;
  }

  v52 = -[PKSelectionController selectionInteraction]((id *)&self->super.isa);
  id v53 = [v52 delegate];
  char v54 = objc_opt_respondsToSelector();

  if (v54)
  {
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);
    }
    else {
      id WeakRetained = 0;
    }
    v56 = [v68 uuid];
    uint64_t v57 = [WeakRetained _attachmentForUUID:v56];

    __int16 v58 = -[PKSelectionController selectionInteraction]((id *)&self->super.isa);
    uint64_t v59 = [v58 delegate];
    __int16 v60 = -[PKSelectionController selectionInteraction]((id *)&self->super.isa);
    uint64_t v61 = [v19 strokes];
    uint64_t v62 = [v61 array];
    v63 = [v57 attachmentView];
    [v59 selectionInteraction:v60 didSelectStrokes:v62 selectionType:a7 inAttachment:v63];
  }
  objc_destroyWeak(&v74);
  objc_destroyWeak(&location);
}

uint64_t __90__PKSelectionController_didSelect_lassoStroke_transform_drawing_selectionType_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[19];

    if (!v4) {
      goto LABEL_5;
    }
    id v5 = (id *)objc_loadWeakRetained(v2);
    long long v6 = *(_OWORD *)(a1 + 72);
    v9[0] = *(_OWORD *)(a1 + 56);
    v9[1] = v6;
    v9[2] = *(_OWORD *)(a1 + 88);
    -[PKSelectionController moveSelectionViewBasedOnStrokeTransform:drawing:](v5, (double *)v9, *(void **)(a1 + 32));
  }
  else
  {
    id v5 = 0;
  }

LABEL_5:
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

- (void)moveSelectionViewBasedOnStrokeTransform:(void *)a3 drawing:
{
  id v5 = a3;
  if (a1)
  {
    [a1[16] bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = *a2;
    double v10 = a2[1];
    double v13 = a2[2];
    double v12 = a2[3];
    double v15 = a2[4];
    double v14 = a2[5];
    id WeakRetained = objc_loadWeakRetained(a1 + 15);
    long long v17 = WeakRetained;
    double v46 = v11;
    double v47 = v10;
    double v44 = v14;
    double v45 = v12;
    double v42 = v15;
    double v43 = v13;
    if (WeakRetained)
    {
      [WeakRetained transformFromStrokeSpaceToViewInDrawing:v5];
      double v18 = *((double *)&v50 + 1);
      double v20 = *((double *)&v51 + 1);
      double v19 = *(double *)&v51;
      double v40 = *((double *)&v52 + 1);
      double v21 = *(double *)&v52;
      double v41 = *(double *)&v50;
    }
    else
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v50 = 0u;
      double v40 = 0.0;
      double v41 = 0.0;
      double v20 = 0.0;
      double v18 = 0.0;
      double v21 = 0.0;
      double v19 = 0.0;
    }

    [a1[19] frame];
    uint64_t v38 = v23;
    uint64_t v39 = v22;
    double v25 = v24;
    double v27 = v26;
    objc_msgSend(a1[19], "setFrame:", v21 + (v44 + v9 * v45 + v47 * v7) * v19 + v41 * (v42 + v9 * v43 + v46 * v7), v40 + (v44 + v9 * v45 + v47 * v7) * v20 + v18 * (v42 + v9 * v43 + v46 * v7), v24, v26);
    id v28 = objc_loadWeakRetained(a1 + 15);
    id v29 = [v5 uuid];
    id v30 = [v28 _attachmentForUUID:v29];

    if (v30
      && [v30 isExternalAttachment]
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v31 = [v30 contentWindowCoordinateSpace];
      id v32 = [v30 contentScaledCoordinateSpace];
      PK_transformToConvertFromCoordinateSpaceToCoordinateSpace(v31, v32, v49);
      long long v33 = v49[1];
      *(_OWORD *)a2 = v49[0];
      *((_OWORD *)a2 + 1) = v33;
      *((_OWORD *)a2 + 2) = v49[2];

      long long v34 = *((_OWORD *)a2 + 1);
      *(_OWORD *)&v48.a = *(_OWORD *)a2;
      *(_OWORD *)&v48.c = v34;
      *(_OWORD *)&v48.tx = *((_OWORD *)a2 + 2);
      *(void *)&long long v34 = v38;
      uint64_t v35 = v39;
      double v36 = v25;
      double v37 = v27;
      CGRect v53 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v34 - 8), &v48);
      objc_msgSend(a1[19], "setFrame:", v53.origin.x, v53.origin.y, v53.size.width, v53.size.height);
    }
  }
}

- (double)calculateFrameForSelectionView:(void *)a3 inDrawing:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    [v5 bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    long long v16 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained transformFromStrokeSpaceToViewInDrawing:v6];
    }
    else {
      memset(&v19, 0, sizeof(v19));
    }
    v20.origin.x = v8;
    v20.origin.y = v10;
    v20.size.width = v12;
    v20.size.height = v14;
    *(void *)&double v17 = (unint64_t)CGRectApplyAffineTransform(v20, &v19);
  }
  else
  {
    double v17 = 0.0;
  }

  return v17;
}

- (void)_installSelectionViewForCurrentSelectionFromExternalAttachments
{
  if (a1)
  {
    id v2 = a1[16];
    if (v2)
    {
      dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
      id v3 = -[PKSelectionController _attachmentForStrokeSelection:](a1, v2);
      if ([v3 isExternalAttachment])
      {
        uint64_t v4 = [v3 drawing];
        double v5 = -[PKSelectionController calculateFrameForSelectionView:inDrawing:]((uint64_t)a1, v2, v4);
        double v7 = v6;
        double v9 = v8;
        double v11 = v10;

        CGFloat v12 = [v2 strokes];
        uint64_t v13 = [v12 count];

        if (v13)
        {
          CGFloat v14 = -[PKSelectionView initWithFrame:strokeSelection:selectionController:selectionType:]([PKSelectionView alloc], "initWithFrame:strokeSelection:selectionController:selectionType:", v2, a1, 2, v5, v7, v9, v11);
          id v15 = a1[19];
          a1[19] = v14;

          if (objc_opt_respondsToSelector()) {
            [v3 installSelectionView:a1[19]];
          }
          [a1[19] center];
          uint64_t v17 = v16;
          uint64_t v19 = v18;
          objc_msgSend(a1[19], "setCenter:");
          [a1[19] setAlpha:0.5];
          id v20 = a1[19];
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __88__PKSelectionController__installSelectionViewForCurrentSelectionFromExternalAttachments__block_invoke;
          v23[3] = &unk_1E64C55F0;
          v23[4] = a1;
          v23[5] = v17;
          v23[6] = v19;
          [MEMORY[0x1E4FB1EB0] transitionWithView:v20 duration:5242880 options:v23 animations:0 completion:0.1];
          if (a1[19])
          {
            double v21 = objc_msgSend(v3, "drawing", *MEMORY[0x1E4F1DAB8], *(void *)(MEMORY[0x1E4F1DAB8] + 8), *(void *)(MEMORY[0x1E4F1DAB8] + 16), *(void *)(MEMORY[0x1E4F1DAB8] + 24), *(void *)(MEMORY[0x1E4F1DAB8] + 32), *(void *)(MEMORY[0x1E4F1DAB8] + 40));
            -[PKSelectionController moveSelectionViewBasedOnStrokeTransform:drawing:](a1, (double *)&v22, v21);
          }
        }
      }
    }
  }
}

- (id)_attachmentForStrokeSelection:(id *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    double v5 = [v3 drawing];
    double v6 = [v5 uuid];

    if (v6)
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 15);
      a1 = [WeakRetained _attachmentForUUID:v6];
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

uint64_t __88__PKSelectionController__installSelectionViewForCurrentSelectionFromExternalAttachments__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  id v2 = *(void **)(*(void *)(a1 + 32) + 152);

  return [v2 setAlpha:1.0];
}

- (void)_removeSelectionViewAnimated:(void *)a3 withCompletion:
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKSelectionController__removeSelectionViewAnimated_withCompletion___block_invoke;
  aBlock[3] = &unk_1E64C8458;
  aBlock[4] = a1;
  char v12 = a2;
  id v6 = v5;
  id v11 = v6;
  double v7 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v7[2](v7);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__PKSelectionController__removeSelectionViewAnimated_withCompletion___block_invoke_4;
    v8[3] = &unk_1E64C5390;
    double v9 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

uint64_t __102__PKSelectionController__addViewForStrokeSelection_isDragSource_drawing_selectionType_withCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  id v2 = *(void **)(*(void *)(a1 + 32) + 152);

  return [v2 setAlpha:1.0];
}

- (void)_imageViewForStrokes:(void *)a3 drawing:(long long *)a4 drawingTransform:(void *)a5 coordinateSpace:(void *)a6 completion:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (a1)
  {
    id v15 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v11];
    uint64_t v16 = [[PKStrokeSelection alloc] initWithStrokes:v15 lassoStroke:0 drawing:v12];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __98__PKSelectionController__imageViewForStrokes_drawing_drawingTransform_coordinateSpace_completion___block_invoke;
    v19[3] = &unk_1E64C8340;
    id v20 = v13;
    uint64_t v21 = a1;
    long long v17 = a4[1];
    long long v24 = *a4;
    long long v25 = v17;
    long long v26 = a4[2];
    long long v22 = v16;
    id v23 = v14;
    uint64_t v18 = v16;
    -[PKSelectionController generateImageForStrokeSelection:scaleStrategy:highlighted:withCompletion:](a1, v18, 1, 0, v19);
  }
}

void __98__PKSelectionController__imageViewForStrokes_drawing_drawingTransform_coordinateSpace_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__PKSelectionController__imageViewForStrokes_drawing_drawingTransform_coordinateSpace_completion___block_invoke_2;
  block[3] = &unk_1E64C8318;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  long long v7 = *(_OWORD *)(a1 + 80);
  long long v15 = *(_OWORD *)(a1 + 64);
  long long v16 = v7;
  long long v17 = *(_OWORD *)(a1 + 96);
  id v12 = v6;
  id v13 = v3;
  id v14 = *(id *)(a1 + 56);
  id v8 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __98__PKSelectionController__imageViewForStrokes_drawing_drawingTransform_coordinateSpace_completion___block_invoke_2(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  memset(&v15, 0, sizeof(v15));
  uint64_t v5 = [WeakRetained canvasView];
  PK_transformToConvertFromCoordinateSpaceToCoordinateSpace(v3, v5, &v15);

  long long v6 = *(_OWORD *)(a1 + 88);
  *(_OWORD *)&t1.a = *(_OWORD *)(a1 + 72);
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 104);
  CGAffineTransform t2 = v15;
  CGAffineTransformConcat(&v14, &t1, &t2);
  CGAffineTransform v15 = v14;
  [*(id *)(a1 + 48) bounds];
  CGAffineTransform v11 = v15;
  CGRect v17 = CGRectApplyAffineTransform(v16, &v11);
  long long v7 = -[PKImageView initWithFrame:]([PKImageView alloc], "initWithFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  id v8 = [*(id *)(a1 + 56) image];
  [(PKImageView *)v7 setImage:v8];

  double v9 = [*(id *)(a1 + 56) addImage];
  [(PKImageView *)v7 setAddImage:v9];

  id v10 = [*(id *)(a1 + 56) mulImage];
  [(PKImageView *)v7 setMulImage:v10];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)generateImageForStrokeSelection:(uint64_t)a3 scaleStrategy:(char)a4 highlighted:(void *)a5 withCompletion:
{
  id v9 = a2;
  id v10 = a5;
  if (a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__PKSelectionController_generateImageForStrokeSelection_scaleStrategy_highlighted_withCompletion___block_invoke;
    block[3] = &unk_1E64C83E0;
    void block[4] = a1;
    id v12 = v9;
    uint64_t v14 = a3;
    char v15 = a4;
    id v13 = v10;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)_imageViewForStrokes:(void *)a3 drawing:(void *)a4 completion:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v7];
    CGAffineTransform v11 = [[PKStrokeSelection alloc] initWithStrokes:v10 lassoStroke:0 drawing:v8];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__PKSelectionController__imageViewForStrokes_drawing_completion___block_invoke;
    v13[3] = &unk_1E64C8390;
    v13[4] = a1;
    uint64_t v14 = v11;
    id v15 = v8;
    id v16 = v9;
    id v12 = v11;
    -[PKSelectionController generateImageForStrokeSelection:scaleStrategy:highlighted:withCompletion:](a1, v12, 1, 0, v13);
  }
}

void __65__PKSelectionController__imageViewForStrokes_drawing_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKSelectionController__imageViewForStrokes_drawing_completion___block_invoke_2;
  block[3] = &unk_1E64C8368;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v10 = *(id *)(a1 + 56);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __65__PKSelectionController__imageViewForStrokes_drawing_completion___block_invoke_2(uint64_t a1)
{
  double v2 = -[PKSelectionController calculateFrameForSelectionView:inDrawing:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  id v9 = -[PKImageView initWithFrame:]([PKImageView alloc], "initWithFrame:", v2, v3, v4, v5);
  long long v6 = [*(id *)(a1 + 56) image];
  [(PKImageView *)v9 setImage:v6];

  id v7 = [*(id *)(a1 + 56) addImage];
  [(PKImageView *)v9 setAddImage:v7];

  id v8 = [*(id *)(a1 + 56) mulImage];
  [(PKImageView *)v9 setMulImage:v8];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_maskImageForStrokes:(uint64_t)a3 drawing:(void *)a4 imageView:(void *)a5 completion:
{
  id v7 = a4;
  id v8 = a5;
  if (a1)
  {
    id v9 = [v7 addImage];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v7 image];
    }
    id v12 = v11;

    id v13 = [MEMORY[0x1E4F1E040] colorMatrixFilter];
    uint64_t v14 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
    [v13 setRVector:v14];

    id v15 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
    [v13 setGVector:v15];

    id v16 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
    [v13 setBVector:v16];

    CGRect v17 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:1.0];
    [v13 setAVector:v17];

    uint64_t v18 = (void *)MEMORY[0x1E4F1E050];
    id v19 = v12;
    id v20 = objc_msgSend(v18, "imageWithCGImage:", objc_msgSend(v19, "CGImage"));
    [v13 setInputImage:v20];

    uint64_t v21 = [v13 outputImage];
    long long v22 = [MEMORY[0x1E4F1E040] morphologyMaximumFilter];
    LODWORD(v23) = 2.0;
    [v22 setRadius:v23];
    [v22 setInputImage:v21];
    long long v24 = [v22 outputImage];

    [v19 scale];
    double v26 = v25;
    [v7 frame];
    CGRect v47 = CGRectInset(v46, -1.0, -1.0);
    CGFloat x = v47.origin.x;
    CGFloat y = v47.origin.y;
    CGFloat width = v47.size.width;
    CGFloat height = v47.size.height;
    [v7 bounds];
    CGRect v49 = CGRectInset(v48, -1.0, -1.0);
    double v30 = v49.origin.x;
    double v31 = v49.origin.y;
    double v32 = v49.size.width;
    double v33 = v49.size.height;
    id v34 = objc_alloc_init(MEMORY[0x1E4F1E018]);
    uint64_t v35 = (CGImage *)objc_msgSend(v34, "createCGImage:fromRect:", v24, v26 * v30, v26 * v31, v26 * v32, v26 * v33);
    double v36 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:v35 scale:0 orientation:v26];
    CGImageRelease(v35);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__PKSelectionController__maskImageForStrokes_drawing_imageView_completion___block_invoke;
    block[3] = &unk_1E64C83B8;
    id v40 = v36;
    id v41 = v8;
    CGFloat v42 = x;
    CGFloat v43 = y;
    CGFloat v44 = width;
    CGFloat v45 = height;
    id v37 = v36;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __75__PKSelectionController__maskImageForStrokes_drawing_imageView_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, double, double, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (PKStrokeSelectionImageConfig)cachedImageConfigForSelection:(uint64_t)a3 scaleStrategy:(uint64_t)a4 highlighted:
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = v7;
  if (a1)
  {
    [v7 bounds];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    double v14 = v13;
    double v16 = v15;
    CGRect v17 = [v8 drawing];
    [(PKSelectionController *)a1 _selectionDrawingTransformForDrawing:(uint64_t)&v79];
    double v18 = sqrt(v80 * v80 + v79 * v79);
    CGAffineTransformMakeScale(&v78, v18, v18);
    *(CGFloat *)long long v76 = v10;
    v87.origin.double x = v10;
    v87.origin.double y = v12;
    v87.size.double width = v14;
    v87.size.double height = v16;
    CGRect v88 = CGRectApplyAffineTransform(v87, &v78);
    double width = v88.size.width;
    double height = v88.size.height;
    objc_msgSend(v8, "boundsWithoutLasso", v88.origin.x, v88.origin.y);
    double v23 = fmax(v18 * v21, width);
    double rect = v12;
    double v75 = fmax(v18 * v22, height);
    if (a3)
    {
      if (a3 == 1)
      {
        +[PKMetalUtility clampedPixelSize:](PKMetalUtility, "clampedPixelSize:", v23, v75);
        uint64_t v26 = 0;
        BOOL v27 = v24 != v23;
        if (v25 != v75) {
          BOOL v27 = 1;
        }
        BOOL v28 = v23 <= 0.0 || !v27;
        if (v28 || v75 <= 0.0)
        {
          uint64_t v29 = 0;
        }
        else
        {
          uint64_t v26 = 0;
          uint64_t v29 = 0;
          double v18 = v18 * (v24 / v23);
          double v75 = v25;
          double v23 = v24;
        }
      }
      else
      {
        uint64_t v26 = 0;
        uint64_t v29 = 0;
      }
    }
    else
    {
      if (v23 > 4000.0 || (double MaxY = v75, v75 > 4000.0))
      {
        CGFloat v71 = v16;
        double v33 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          double v82 = v23;
          __int16 v83 = 2048;
          double v84 = v75;
          _os_log_error_impl(&dword_1C44F8000, v33, OS_LOG_TYPE_ERROR, "SELECTION: image renderer bounds are too big %f %f, sizing it down", buf, 0x16u);
        }

        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
        uint64_t v35 = [v8 drawing];
        objc_msgSend(WeakRetained, "visibleOnscreenBoundsForDrawing:slack:", v35, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
        CGFloat v37 = v36;
        CGFloat v39 = v38;
        CGFloat v41 = v40;
        CGFloat v43 = v42;

        double v72 = fmin(v23, 4000.0);
        double v44 = v14 * (v72 / v23);
        v89.origin.double x = v37;
        v89.origin.double y = v39;
        v89.size.double width = v41;
        v89.size.double height = v43;
        double MidX = CGRectGetMidX(v89);
        v90.origin.double x = v37;
        v90.origin.double y = v39;
        v90.size.double width = v41;
        v90.size.double height = v43;
        double MidY = CGRectGetMidY(v90);
        double v73 = v44;
        if (v14 <= v44)
        {
          uint64_t v49 = *(void *)v76;
          double v31 = *(double *)v76;
          double v46 = v71;
        }
        else
        {
          v91.origin.double x = *(CGFloat *)v76;
          v91.origin.double y = rect;
          v91.size.double width = v14;
          double v46 = v71;
          v91.size.double height = v71;
          double MaxX = CGRectGetMaxX(v91);
          double v48 = MidX + v44 * -0.5;
          double v31 = *(double *)v76;
          uint64_t v49 = *(void *)v76;
          if (v48 >= *(double *)v76)
          {
            double v50 = MaxX - v44;
            double v31 = MidX + v44 * -0.5;
            if (v48 > v50) {
              double v31 = v50;
            }
          }
        }
        double v32 = fmin(v75, 4000.0);
        double MaxY = v32 / v75;
        double v51 = v46;
        double v16 = v46 * (v32 / v75);
        if (v51 > v16)
        {
          uint64_t v52 = v49;
          double v53 = rect;
          double v54 = v14;
          double MaxY = CGRectGetMaxY(*(CGRect *)(&v51 - 3));
          double v55 = MidY + v16 * -0.5;
          if (v55 >= rect)
          {
            double MaxY = MaxY - v16;
            double rect = MaxY;
            if (v55 <= MaxY) {
              double rect = MidY + v16 * -0.5;
            }
          }
        }
      }
      else
      {
        double v32 = v75;
        double v31 = *(double *)v76;
        double v72 = v23;
        double v73 = v14;
      }
      v56 = objc_msgSend(v8, "drawing", MaxY);
      [(PKSelectionController *)a1 _selectionDrawingTransformForDrawing:(uint64_t)v77];
      BOOL v57 = v77[2] * v77[1] - v77[0] * v77[3] > 0.0;

      if (v57)
      {
        uint64_t v26 = 0;
        uint64_t v29 = 1;
      }
      else
      {
        id v58 = objc_loadWeakRetained((id *)(a1 + 120));
        uint64_t v26 = [v58 _sixChannelBlendingIsActive];

        uint64_t v29 = 0;
      }
      double v75 = v32;
      *(double *)long long v76 = v31;
      double v23 = v72;
      double v14 = v73;
    }
    uint64_t v59 = (id *)(a1 + 120);
    id v60 = objc_loadWeakRetained(v59);
    uint64_t v61 = v60;
    if (v60) {
      [v60 transformFromStrokeSpaceToViewInDrawing:v17];
    }
    else {
      memset(&v76[8], 0, 48);
    }
    v92.origin.double y = rect;
    v92.size.double height = v16;
    v92.size.double width = v14;
    v92.origin.double x = *(CGFloat *)v76;
    CGRect v93 = CGRectApplyAffineTransform(v92, (CGAffineTransform *)&v76[8]);
    double x = v93.origin.x;
    double y = v93.origin.y;
    double v64 = v93.size.width;
    double v65 = v93.size.height;

    v66 = [PKStrokeSelectionImageConfig alloc];
    id v67 = objc_loadWeakRetained(v59);
    id v68 = -[PKStrokeSelectionImageConfig initWithStrokeBounds:imageViewBounds:scale:imageSize:invertedColors:rotated:sixChannel:highlighted:](v66, "initWithStrokeBounds:imageViewBounds:scale:imageSize:invertedColors:rotated:sixChannel:highlighted:", [v67 invertColors], v29, v26, a4, *(double *)v76, rect, v14, v16, x, y, v64, v65, *(void *)&v18, *(void *)&v23, *(void *)&v75);
  }
  else
  {
    id v68 = 0;
  }

  return v68;
}

void __98__PKSelectionController_generateImageForStrokeSelection_scaleStrategy_highlighted_withCompletion___block_invoke(uint64_t a1)
{
  -[PKSelectionController cachedImageConfigForSelection:scaleStrategy:highlighted:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  double v2 = -[PKSelectionController cachedImageConfigForSelection:scaleStrategy:highlighted:](*(void *)(a1 + 32), *(void **)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 64));
  double v3 = *(void **)(a1 + 40);
  double v4 = -[PKSelectionController selectionInteraction](*(id **)(a1 + 32));
  [v3 generateImageWithConfig:v5 fullSizeConfig:v2 selectionInteraction:v4 withCompletion:*(void *)(a1 + 48)];
}

- (void)setImageOnSelectionViewForStrokeSelection:(void *)a3 withCompletion:
{
  id v5 = a2;
  long long v6 = a3;
  if (a1)
  {
    id v7 = -[PKSelectionController cachedImageConfigForSelection:scaleStrategy:highlighted:]((uint64_t)a1, v5, 0, 1);
    id v8 = [a1[19] strokeSelectionImage];
    if (!v8) {
      goto LABEL_7;
    }
    double v9 = [a1[19] strokeSelectionImage];
    CGFloat v10 = [v9 config];
    char v11 = [v10 isEqual:v7];

    if (v11)
    {
      if (v6) {
        v6[2](v6);
      }
      CGFloat v12 = v7;
    }
    else
    {
LABEL_7:
      double v13 = -[PKSelectionController cachedImageConfigForSelection:scaleStrategy:highlighted:]((uint64_t)a1, v5, 1, 1);
      double v14 = -[PKSelectionController selectionInteraction](a1);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __82__PKSelectionController_setImageOnSelectionViewForStrokeSelection_withCompletion___block_invoke;
      v19[3] = &unk_1E64C8408;
      void v19[4] = a1;
      id v20 = v6;
      [v5 generateImageWithConfig:v7 fullSizeConfig:v13 selectionInteraction:v14 withCompletion:v19];

      CGFloat v12 = -[PKSelectionController cachedImageConfigForSelection:scaleStrategy:highlighted:]((uint64_t)a1, v5, 0, 0);

      double v15 = -[PKSelectionController cachedImageConfigForSelection:scaleStrategy:highlighted:]((uint64_t)a1, v5, 1, 0);

      double v16 = -[PKSelectionController selectionInteraction](a1);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __82__PKSelectionController_setImageOnSelectionViewForStrokeSelection_withCompletion___block_invoke_3;
      v17[3] = &unk_1E64C5618;
      id v18 = v5;
      [v18 generateImageWithConfig:v12 fullSizeConfig:v15 selectionInteraction:v16 withCompletion:v17];
    }
  }
}

void __82__PKSelectionController_setImageOnSelectionViewForStrokeSelection_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKSelectionController_setImageOnSelectionViewForStrokeSelection_withCompletion___block_invoke_2;
  block[3] = &unk_1E64C5820;
  double v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __82__PKSelectionController_setImageOnSelectionViewForStrokeSelection_withCompletion___block_invoke_2(void *a1)
{
  [*(id *)(a1[4] + 152) setStrokeSelectionImage:a1[5]];
  uint64_t result = a1[6];
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __82__PKSelectionController_setImageOnSelectionViewForStrokeSelection_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setStrokeImage:a2];
}

void __69__PKSelectionController__removeSelectionViewAnimated_withCompletion___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 32) = (int)fmax((double)(*(_DWORD *)(*(void *)(a1 + 32) + 32) - 1), 0.0);
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2
    && *(void *)(v3 + 152)
    && (v4 = [*(id *)(v3 + 152) selectionType], uint64_t v3 = *(void *)(a1 + 32), v4 != 6))
  {
    id v7 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v8 = *(void *)(v3 + 152);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__PKSelectionController__removeSelectionViewAnimated_withCompletion___block_invoke_2;
    v11[3] = &unk_1E64C5368;
    v11[4] = v3;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__PKSelectionController__removeSelectionViewAnimated_withCompletion___block_invoke_3;
    _OWORD v9[3] = &unk_1E64C8430;
    v9[4] = v3;
    id v10 = *(id *)(a1 + 40);
    [v7 transitionWithView:v8 duration:5242880 options:v11 animations:v9 completion:0.2];
  }
  else
  {
    -[PKSelectionController _tearDownSelectionView](v3);
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      long long v6 = *(void (**)(void))(v5 + 16);
      v6();
    }
  }
}

uint64_t __69__PKSelectionController__removeSelectionViewAnimated_withCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 152) setAlpha:0.0];
}

uint64_t __69__PKSelectionController__removeSelectionViewAnimated_withCompletion___block_invoke_3(uint64_t a1)
{
  -[PKSelectionController _tearDownSelectionView](*(void *)(a1 + 32));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_tearDownSelectionView
{
  if (a1)
  {
    int v2 = [*(id *)(a1 + 152) window];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __47__PKSelectionController__tearDownSelectionView__block_invoke;
    v3[3] = &unk_1E64C5368;
    v3[4] = a1;
    +[PKToolPicker _performWithVisibilityUpdatesEnabled:0 window:v2 block:v3];
  }
}

uint64_t __69__PKSelectionController__removeSelectionViewAnimated_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__PKSelectionController__tearDownSelectionView__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 152) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 152);
  *(void *)(v2 + 152) = 0;
}

- (id)_commitStrokeSelection:(void *)a3 toDrawing:(uint64_t)a4 selectionAction:(uint64_t)a5 selectionType:
{
  id v9 = a2;
  id v10 = a3;
  if (a1)
  {
    char v11 = -[PKSelectionController _commitStrokeSelection:toDrawing:selectionAction:inkChanges:selectionType:withCompletion:](a1, v9, v10, a4, 0, a5, 0);
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)_commitStrokeSelection:(void *)a3 toDrawing:(uint64_t)a4 selectionAction:(void *)a5 inkChanges:(uint64_t)a6 selectionType:(void *)a7 withCompletion:
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v108 = a2;
  id v109 = a3;
  id v112 = a5;
  blocuint64_t k = a7;
  v106 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v110 = a1;
  id v11 = *(id *)(a1 + 128);
  if (!v11) {
    id v11 = v108;
  }
  CGFloat v12 = (void *)MEMORY[0x1E4F1C978];
  v105 = v11;
  double v13 = objc_msgSend(v11, "strokes", a6);
  double v14 = [v13 array];
  v102 = [v12 arrayWithArray:v14];

  v103 = [v105 drawing];
  id location = (id *)(a1 + 120);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  double v16 = [WeakRetained undoManager];
  [v16 beginUndoGrouping];

  switch(a4)
  {
    case 3:
      double v23 = [v108 strokes];
      double v24 = [v23 array];

      v111 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v24, "count"));
      for (unint64_t i = 0; [v24 count] > i; ++i)
      {
        uint64_t v26 = [v24 objectAtIndexedSubscript:i];
        id v27 = [v26 ink];
        id v28 = v112;
        uint64_t v29 = [v27 color];
        double v30 = [v27 identifier];
        double v31 = [v28 objectForKey:@"PKInkColorProperty"];

        if (v31)
        {
          uint64_t v32 = [v28 objectForKey:@"PKInkColorProperty"];

          uint64_t v29 = (void *)v32;
        }
        double v33 = [PKInk alloc];
        uint64_t v34 = [v27 version];
        uint64_t v35 = [v27 variant];
        [v27 weight];
        double v36 = -[PKInk initWithIdentifier:color:version:variant:weight:](v33, "initWithIdentifier:color:version:variant:weight:", v30, v29, v34, v35);

        id v37 = objc_loadWeakRetained(location);
        LODWORD(v35) = [v37 sixChannelBlending];

        if (v35)
        {
          uint64_t v38 = [(PKInk *)v36 _sixChannelVersion];

          double v36 = (PKInk *)v38;
        }

        [v111 addObject:v36];
      }
      v63 = [v109 undoableSetStrokes:v24 inks:v111];
      if (v63) {
        -[PKSelectionController registerCommandWithUndoManager:](v110, v63);
      }

      double v22 = 0;
      break;
    case 0:
      CGRect v17 = [v108 strokes];
      id v18 = [v17 array];
      long long v19 = *(_OWORD *)(a1 + 184);
      v125[0] = *(_OWORD *)(a1 + 168);
      v125[1] = v19;
      v125[2] = *(_OWORD *)(a1 + 200);
      id v20 = [v109 undoableTransformStrokes:v18 withTransform:v125 concat:1];

      if (v20) {
        -[PKSelectionController registerCommandWithUndoManager:](a1, v20);
      }
      int v21 = 0;
      double v22 = 0;
LABEL_45:

      id v67 = dispatch_group_create();
      goto LABEL_46;
    case 1:
      double v64 = [v103 uuid];
      id v20 = -[PKSelectionController drawingForUUID:](v110, v64);

      [v106 addObject:v20];
      double v65 = [v20 undoableDeleteStrokes:v102];
      if (v65) {
        -[PKSelectionController registerCommandWithUndoManager:](v110, v65);
      }
      id v66 = objc_loadWeakRetained(location);
      [v66 didChangeDrawing:v20];

      int v21 = 1;
      goto LABEL_45;
    default:
      id v39 = v108;
      double v40 = (void *)MEMORY[0x1E4F1CA48];
      id v114 = v39;
      CGFloat v41 = [v39 strokes];
      double v42 = objc_msgSend(v40, "arrayWithCapacity:", objc_msgSend(v41, "count"));

      long long v132 = 0u;
      long long v133 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      CGFloat v43 = [v114 strokes];
      double v44 = [v43 array];

      uint64_t v45 = [v44 countByEnumeratingWithState:&v130 objects:v135 count:16];
      if (v45)
      {
        uint64_t v46 = *(void *)v131;
        do
        {
          for (uint64_t j = 0; j != v45; ++j)
          {
            if (*(void *)v131 != v46) {
              objc_enumerationMutation(v44);
            }
            double v48 = (void *)[*(id *)(*((void *)&v130 + 1) + 8 * j) copyForMutation];
            uint64_t v49 = [MEMORY[0x1E4F29128] UUID];
            [v48 _setStrokeUUID:v49];

            [v42 addObject:v48];
          }
          uint64_t v45 = [v44 countByEnumeratingWithState:&v130 objects:v135 count:16];
        }
        while (v45);
      }

      double v50 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v128 = 0u;
      long long v129 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      id v51 = v42;
      uint64_t v52 = [v51 countByEnumeratingWithState:&v126 objects:v134 count:16];
      if (v52)
      {
        uint64_t v53 = *(void *)v127;
        do
        {
          for (uint64_t k = 0; k != v52; ++k)
          {
            if (*(void *)v127 != v53) {
              objc_enumerationMutation(v51);
            }
            double v55 = *(void **)(*((void *)&v126 + 1) + 8 * k);
            v56 = [v55 _groupID];
            if (v56)
            {
              BOOL v57 = [v50 objectForKeyedSubscript:v56];
              if (!v57)
              {
                BOOL v57 = [MEMORY[0x1E4F29128] UUID];
                [v50 setObject:v57 forKeyedSubscript:v56];
              }
              [v55 _setGroupID:v57];
            }
          }
          uint64_t v52 = [v51 countByEnumeratingWithState:&v126 objects:v134 count:16];
        }
        while (v52);
      }

      id v58 = [v109 undoableAddNewStrokes:v51];
      long long v59 = *(_OWORD *)(v110 + 184);
      *(_OWORD *)&v124.a = *(_OWORD *)(v110 + 168);
      *(_OWORD *)&v124.c = v59;
      *(_OWORD *)&v124.tdouble x = *(_OWORD *)(v110 + 200);
      if (!CGAffineTransformIsIdentity(&v124))
      {
        long long v60 = *(_OWORD *)(v110 + 184);
        v123[0] = *(_OWORD *)(v110 + 168);
        v123[1] = v60;
        v123[2] = *(_OWORD *)(v110 + 200);
        [v109 transformStrokes:v51 withTransform:v123 concat:1];
      }
      uint64_t v61 = (void *)MEMORY[0x1E4F1CAA0];
      uint64_t v62 = +[PKDrawing visibleStrokesFromStrokes:v51 inDrawing:v109];
      double v22 = [v61 orderedSetWithArray:v62];

      if (v58) {
        -[PKSelectionController registerCommandWithUndoManager:](v110, v58);
      }

      break;
  }
  id v67 = dispatch_group_create();
  if (a4 == 2)
  {
    CGRect v92 = [v108 lassoStroke];
    CGRect v93 = (void *)[v92 mutableCopy];

    long long v94 = *(_OWORD *)(v110 + 184);
    v122[0] = *(_OWORD *)(v110 + 168);
    v122[1] = v94;
    v122[2] = *(_OWORD *)(v110 + 200);
    [v93 _applyTransform:v122];
    v95 = [PKStrokeSelection alloc];
    v96 = [v108 externalElements];
    v97 = [(PKStrokeSelection *)v95 initWithStrokes:v22 externalElements:v96 lassoStroke:v93 drawing:v109];

    dispatch_group_enter(v67);
    long long v98 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v121[0] = *MEMORY[0x1E4F1DAB8];
    v121[1] = v98;
    v121[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v119[0] = MEMORY[0x1E4F143A8];
    v119[1] = 3221225472;
    v119[2] = __114__PKSelectionController__commitStrokeSelection_toDrawing_selectionAction_inkChanges_selectionType_withCompletion___block_invoke;
    v119[3] = &unk_1E64C5368;
    v99 = v67;
    v120 = v99;
    [(id)v110 didSelect:v97 lassoStroke:v93 transform:v121 drawing:v109 selectionType:v101 completion:v119];

    int v21 = 0;
    id v67 = v99;
  }
  else
  {
    int v21 = 0;
  }
LABEL_46:
  id v68 = objc_loadWeakRetained(location);
  v69 = [v68 undoManager];
  [v69 endUndoGrouping];

  id v70 = objc_loadWeakRetained(location);
  [v70 didChangeDrawing:v109];

  [v106 addObject:v109];
  dispatch_group_enter(v67);
  v117[0] = MEMORY[0x1E4F143A8];
  v117[1] = 3221225472;
  v117[2] = __114__PKSelectionController__commitStrokeSelection_toDrawing_selectionAction_inkChanges_selectionType_withCompletion___block_invoke_2;
  v117[3] = &unk_1E64C5368;
  CGFloat v71 = v67;
  v118 = v71;
  -[PKSelectionController _selectionRefreshWithChangeToDrawings:completion:](v110, v106, v117);
  if (v21)
  {
    double v72 = [v108 lassoStroke];
    double v73 = (void *)[v72 mutableCopy];

    long long v74 = *(_OWORD *)(v110 + 184);
    v116[0] = *(_OWORD *)(v110 + 168);
    v116[1] = v74;
    v116[2] = *(_OWORD *)(v110 + 200);
    [v73 _applyTransform:v116];
    double v75 = [PKStrokeSelection alloc];
    long long v76 = [v108 externalElements];
    long long v77 = [(PKStrokeSelection *)v75 initWithStrokes:v22 externalElements:v76 lassoStroke:v73 drawing:v109];

    CGAffineTransform v78 = (void **)v110;
    -[PKSelectionController setCurrentStrokeSelection:](v110, v77);
    [v78[19] setStrokeSelection:v78[16]];
    -[PKSelectionController _refreshExternalElementsInStrokeSelection:](v78, v78[16]);
  }
  if (a4 == 3 || !a4)
  {
    double v79 = [v108 lassoStroke];
    double v80 = (void *)[v79 mutableCopy];

    long long v81 = *(_OWORD *)(v110 + 184);
    v115[0] = *(_OWORD *)(v110 + 168);
    v115[1] = v81;
    v115[2] = *(_OWORD *)(v110 + 200);
    [v80 _applyTransform:v115];
    double v82 = [v108 strokes];
    __int16 v83 = [v82 array];
    double v84 = +[PKDrawing visibleStrokesFromStrokes:v83 inDrawing:v109];

    uint64_t v85 = [PKStrokeSelection alloc];
    v86 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v84];
    CGRect v87 = [v108 externalElements];
    CGRect v88 = [(PKStrokeSelection *)v85 initWithStrokes:v86 externalElements:v87 lassoStroke:v80 drawing:v109];

    -[PKSelectionController setCurrentStrokeSelection:](v110, v88);
    [*(id *)(v110 + 152) setStrokeSelection:*(void *)(v110 + 128)];
    -[PKSelectionController _refreshExternalElementsInStrokeSelection:]((void *)v110, *(void **)(v110 + 128));
    if (a4 == 3) {
      [*(id *)(v110 + 152) setStrokeSelectionImage:0];
    }
  }
  uint64_t v89 = MEMORY[0x1E4F1DAB8];
  long long v90 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)(v110 + 168) = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)(v110 + 184) = v90;
  *(_OWORD *)(v110 + 200) = *(_OWORD *)(v89 + 32);
  if (block) {
    dispatch_group_notify(v71, MEMORY[0x1E4F14428], block);
  }

  return v22;
}

- (void)registerCommandWithUndoManager:(uint64_t)a1
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  [WeakRetained registerUndoCommand:v4];
}

- (id)drawingForUUID:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    uint64_t v5 = [WeakRetained attachmentForUUID:v3];
    long long v6 = [v5 drawing];
  }
  else
  {
    long long v6 = 0;
  }

  return v6;
}

void __114__PKSelectionController__commitStrokeSelection_toDrawing_selectionAction_inkChanges_selectionType_withCompletion___block_invoke(uint64_t a1)
{
}

void __114__PKSelectionController__commitStrokeSelection_toDrawing_selectionAction_inkChanges_selectionType_withCompletion___block_invoke_2(uint64_t a1)
{
}

- (void)_selectionRefreshWithChangeToDrawings:(void *)a3 completion:
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  [WeakRetained _selectionRefreshWithChangeToDrawings:v7 completion:v5];
}

- (void)_refreshExternalElementsInStrokeSelection:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v8 = v3;
    id v4 = [v3 externalElements];
    id v5 = -[PKSelectionController _IDsFromExternalElements:](a1, v4);

    long long v6 = -[PKSelectionController _attachmentForStrokeSelection:]((id *)a1, v8);
    id v7 = -[PKSelectionController _externalElementsForIDs:inAttachment:]((id *)a1, v5, v6);
    [v8 setExternalElements:v7];

    id v3 = v8;
  }
}

- (void)eraseSelection
{
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = -[PKSelectionController _currentAttachment](a1);
  id v3 = [v2 recognitionController];
  char v4 = [v3 shouldCancelForAutoRefineCompletion];

  if ((v4 & 1) == 0)
  {
    id v5 = a1[19];
    if ([v5 selectionType])
    {
      uint64_t v6 = [a1[19] selectionType];

      if (v6 != 6)
      {
        id v7 = -[PKSelectionController selectionInteraction](a1);
        id v8 = [v7 delegate];
        char v9 = objc_opt_respondsToSelector();

        if (v9)
        {
          id v10 = -[PKSelectionController selectionInteraction](a1);
          id v11 = [v10 delegate];
          CGFloat v12 = -[PKSelectionController selectionInteraction](a1);
          double v13 = [a1[16] strokes];
          double v14 = [v13 array];
          [v11 selectionInteraction:v12 handleDeleteForTextStrokes:v14 inAttachment:v2];

          goto LABEL_12;
        }
      }
    }
    else
    {
    }
    double v15 = [a1[16] drawing];

    if (v15)
    {
      -[PKSelectionController _resetSelectedStrokeStateForRenderer]((uint64_t)a1);
      double v16 = [a1[16] drawing];
      CGRect v17 = (void *)MEMORY[0x1E4F1C978];
      id v18 = [a1[16] strokes];
      long long v19 = [v18 array];
      id v20 = [v17 arrayWithArray:v19];

      int v21 = [v16 undoableDeleteStrokes:v20];
      if (v21) {
        -[PKSelectionController registerCommandWithUndoManager:]((uint64_t)a1, v21);
      }
      -[PKSelectionController setCurrentStrokeSelection:]((uint64_t)a1, 0);
      id WeakRetained = objc_loadWeakRetained(a1 + 15);
      [WeakRetained didChangeDrawing:v16];

      v25[0] = v16;
      id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      -[PKSelectionController _selectionRefreshWithChangeToDrawings:completion:]((uint64_t)a1, v23, 0);
    }
    double v24 = -[PKSelectionController _selectedExternalElementsInAttachment:]((uint64_t)a1, v2);
    -[PKSelectionController _didDeleteExternalElements:inAttachment:](a1, v24, v2);

    -[PKSelectionController _removeSelectionViewAnimated:withCompletion:]((uint64_t)a1, 1, 0);
  }
LABEL_12:
}

- (id)_currentAttachment
{
  if (a1)
  {
    -[PKSelectionController _attachmentForStrokeSelection:](a1, a1[16]);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_selectedExternalElementsInAttachment:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    char v4 = *(void **)(a1 + 128);
    if (v4)
    {
      a1 = [v4 externalElements];
    }
    else
    {
      id v5 = -[PKSelectionController selectionInteraction]((id *)a1);
      uint64_t v6 = [v5 delegate];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = -[PKSelectionController selectionInteraction]((id *)a1);
        char v9 = [v8 delegate];
        id v10 = -[PKSelectionController selectionInteraction]((id *)a1);
        id v11 = [v3 attachmentView];
        CGFloat v12 = [v9 selectionInteraction:v10 selectedElementsInAttachment:v11];

        a1 = -[PKSelectionController _externalElementsForIDs:inAttachment:]((id *)a1, v12, v3);
      }
      else
      {
        a1 = 0;
      }
    }
  }

  return (id)a1;
}

- (void)_didDeleteExternalElements:(void *)a3 inAttachment:
{
  id v14 = a2;
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = -[PKSelectionController selectionInteraction](a1);
    char v7 = [v6 delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      char v9 = -[PKSelectionController _IDsFromExternalElements:](a1, v14);
      id v10 = -[PKSelectionController selectionInteraction](a1);
      id v11 = [v10 delegate];
      CGFloat v12 = -[PKSelectionController selectionInteraction](a1);
      double v13 = [v5 attachmentView];
      [v11 selectionInteraction:v12 didDeleteElements:v9 inAttachment:v13];
    }
  }
}

- (void)currentPasteboard
{
  if (a1)
  {
    uint64_t v2 = (void *)a1[17];
    if (v2)
    {
      a1 = v2;
    }
    else
    {
      a1 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_addItemsToPasteboard:(id)a3
{
  id v4 = a3;
  id v5 = -[PKSelectionController currentPasteboard](self);
  uint64_t v6 = -[PKSelectionController _currentAttachment]((id *)&self->super.isa);
  char v7 = -[PKSelectionController _selectedExternalElementsInAttachment:]((uint64_t)self, v6);
  char v8 = -[PKSelectionController _pasteboardRepresentationsForExternalElements:inAttachment:]((id *)&self->super.isa, v7, v6);

  char v9 = [v4 strokes];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    id v11 = [v4 legacyStrokeDataForSelection];
    CGFloat v12 = [v4 strokeDataForSelection];
    int v13 = [v4 containsBitmapData];
    id v14 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    double v15 = v14;
    if (v11)
    {
      [v14 setObject:v12 forKeyedSubscript:@"com.apple.drawing"];
      if (!v13) {
        [v15 setObject:v11 forKeyedSubscript:@"com.apple.pencilkit.strokes"];
      }
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __47__PKSelectionController__addItemsToPasteboard___block_invoke;
    v17[3] = &unk_1E64C8480;
    id v18 = v8;
    id v19 = v15;
    id v20 = v5;
    id v16 = v15;
    -[PKSelectionController generateImageForStrokeSelection:scaleStrategy:highlighted:withCompletion:]((uint64_t)self, v4, 1, 0, v17);
  }
  else
  {
    [v5 setItems:v8];
  }
}

- (id)_pasteboardRepresentationsForExternalElements:(void *)a3 inAttachment:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    char v7 = -[PKSelectionController selectionInteraction](a1);
    char v8 = [v7 delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = -[PKSelectionController _IDsFromExternalElements:](a1, v5);
      id v11 = -[PKSelectionController selectionInteraction](a1);
      CGFloat v12 = [v11 delegate];
      int v13 = -[PKSelectionController selectionInteraction](a1);
      id v14 = [a1[16] strokeIdentifiers];
      double v15 = [v6 attachmentView];
      a1 = [v12 selectionInteraction:v13 pasteboardRepresentationsForElements:v10 strokes:v14 inAttachment:v15];
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

void __47__PKSelectionController__addItemsToPasteboard___block_invoke(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a2 combinedImage];
  id v4 = UIImagePNGRepresentation(v3);

  uint64_t v5 = [*(id *)(a1 + 32) count];
  id v6 = *(void **)(a1 + 40);
  if (v5 == 1)
  {
    char v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    [v6 addEntriesFromDictionary:v7];

    char v8 = *(void **)(a1 + 40);
    char v9 = [(id)*MEMORY[0x1E4F44460] identifier];
    [v8 setObject:v4 forKeyedSubscript:v9];

    v14[0] = *(void *)(a1 + 40);
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [*(id *)(a1 + 48) setItems:v10];
  }
  else
  {
    id v11 = [(id)*MEMORY[0x1E4F44460] identifier];
    [v6 setObject:v4 forKeyedSubscript:v11];

    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    CGFloat v12 = [v10 arrayByAddingObjectsFromArray:*(void *)(a1 + 32)];
    [*(id *)(a1 + 48) setItems:v12];
  }
}

void __43__PKSelectionController__addToStickerMenu___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PKSelectionController__addToStickerMenu___block_invoke_2;
  block[3] = &unk_1E64C53E0;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __43__PKSelectionController__addToStickerMenu___block_invoke_2(uint64_t a1)
{
  -[PKSelectionController _resetSelectedStrokeStateForRenderer](*(void *)(a1 + 32));
  id v2 = [*(id *)(a1 + 40) combinedImage];
  uint64_t v3 = [v2 CGImage];
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x2050000000;
  id v4 = (void *)_MergedGlobals_136;
  uint64_t v26 = _MergedGlobals_136;
  if (!_MergedGlobals_136)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = ___ZL31getVKCStickerFromPKDrawingClassv_block_invoke;
    v22[3] = &unk_1E64C8720;
    v22[4] = &v23;
    ___ZL31getVKCStickerFromPKDrawingClassv_block_invoke((uint64_t)v22);
    id v4 = (void *)v24[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v23, 8);
  id v6 = [v5 alloc];
  id v7 = *(void **)(a1 + 32);
  if (v7) {
    id v7 = (void *)v7[19];
  }
  id v8 = v7;
  [v8 frame];
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    uint64_t v10 = *(void *)(v9 + 152);
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(v6, "initWithFrameVar:currentView:inputtedImage:", v10, v3);

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(a1 + 48);
  id v14 = [v13 drawing];
  double v15 = -[PKSelectionController calculateFrameForSelectionView:inDrawing:](v12, v13, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  objc_msgSend(v11, "presentStickerPickerViewController:", v15, v17, v19, v21);
}

- (void)clearExternalSelectionIfNecessary
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id WeakRetained = objc_loadWeakRetained(a1 + 15);
    uint64_t v3 = objc_msgSend(WeakRetained, "attachmentViews", 0);

    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
          if (-[PKSelectionController _hasExternalElementsSelectedInAttachment:]((BOOL)a1, v7)) {
            -[PKSelectionController _clearExternalSelectionInAttachment:](a1, v7);
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (BOOL)_hasExternalElementsSelectedInAttachment:(BOOL)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (v3)
    {
      uint64_t v5 = -[PKSelectionController _selectedExternalElementsInAttachment:](a1, v3);
      a1 = [v5 count] != 0;
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
      id v7 = objc_msgSend(WeakRetained, "attachmentViews", 0);

      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v13;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v7);
            }
            if (-[PKSelectionController _hasExternalElementsSelectedInAttachment:](a1, *(void *)(*((void *)&v12 + 1) + 8 * i)))
            {

              a1 = 1;
              goto LABEL_14;
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      a1 = 0;
    }
  }
LABEL_14:

  return a1;
}

- (void)_clearExternalSelectionInAttachment:(id *)a1
{
  id v10 = a2;
  if (a1)
  {
    id v3 = -[PKSelectionController selectionInteraction](a1);
    uint64_t v4 = [v3 delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = -[PKSelectionController selectionInteraction](a1);
      id v7 = [v6 delegate];
      uint64_t v8 = -[PKSelectionController selectionInteraction](a1);
      uint64_t v9 = [v10 attachmentView];
      [v7 selectionInteraction:v8 clearSelectionInAttachment:v9];
    }
  }
}

uint64_t __74__PKSelectionController_clearSelectionIfNecessaryAnimated_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    uint64_t result = (*(uint64_t (**)(void))(result + 16))();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 112) = 0;
  return result;
}

- (void)commitStrokesWithCompletion:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    -[PKSelectionController _resetSelectedStrokeStateForRenderer](a1);
    [*(id *)(a1 + 152) frame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    long long v12 = -[PKSelectionController _drawingForSelectionRect:](a1, v4, v6, v8, v10);
    if (!*(void *)(a1 + 128))
    {
      -[PKSelectionController _refreshTiledViewWithSelectionForDrawing:completion:](a1, v12, v3);
LABEL_23:

      goto LABEL_24;
    }
    long long v13 = [*(id *)(a1 + 152) strokeSelection];
    long long v14 = (_OWORD *)MEMORY[0x1E4F1DAB8];
    if (!v12)
    {
      long long v15 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v42.origin.double x = v5;
        v42.origin.double y = v7;
        v42.size.double width = v9;
        v42.size.double height = v11;
        uint64_t v32 = NSStringFromCGRect(v42);
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = (uint64_t)v32;
        _os_log_debug_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEBUG, "Current stroke selection doesn't have a drawing for rect %@", buf, 0xCu);
      }
      [*(id *)(a1 + 152) animateViewToOriginalPosition];
      uint64_t v16 = [*(id *)(a1 + 128) drawing];
      long long v17 = v14[1];
      *(_OWORD *)(a1 + 168) = *v14;
      *(_OWORD *)(a1 + 184) = v17;
      *(_OWORD *)(a1 + 200) = v14[2];
      long long v12 = (void *)v16;
    }
    long long v18 = *(_OWORD *)(a1 + 184);
    *(_OWORD *)&t1.a = *(_OWORD *)(a1 + 168);
    *(_OWORD *)&t1.c = v18;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)(a1 + 200);
    long long v19 = v14[1];
    *(_OWORD *)&v37.a = *v14;
    *(_OWORD *)&v37.c = v19;
    *(_OWORD *)&v37.tdouble x = v14[2];
    if (CGAffineTransformEqualToTransform(&t1, &v37))
    {
      double v20 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_DEBUG, "Stroke selection was not moved, cancelled drag, or dragged out of the app.  Returning selection back to its original spot", buf, 2u);
      }

      -[PKSelectionController _refreshTiledViewWithSelectionForDrawing:completion:](a1, v12, v3);
      goto LABEL_22;
    }
    double v21 = [*(id *)(a1 + 128) drawing];
    double v22 = [v21 uuid];
    uint64_t v23 = -[PKSelectionController drawingForUUID:](a1, v22);

    double v24 = [v12 uuid];
    uint64_t v25 = [v23 uuid];
    int v26 = [v24 isEqual:v25];

    if (v26)
    {
      id v27 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        double v33 = [*(id *)(a1 + 128) strokes];
        uint64_t v34 = [v33 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v40 = v34;
        _os_log_debug_impl(&dword_1C44F8000, v27, OS_LOG_TYPE_DEBUG, "Moving stroke selection of %lu strokes inside same drawing", buf, 0xCu);
      }
      uint64_t v28 = [*(id *)(a1 + 152) selectionType];
      uint64_t v29 = 0;
    }
    else
    {
      if (!v23)
      {
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
      double v30 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v35 = [*(id *)(a1 + 128) strokes];
        uint64_t v36 = [v35 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v40 = v36;
        _os_log_debug_impl(&dword_1C44F8000, v30, OS_LOG_TYPE_DEBUG, "Committing stroke selection of %lu strokes from one drawing to another", buf, 0xCu);
      }
      uint64_t v28 = [*(id *)(a1 + 152) selectionType];
      uint64_t v29 = 1;
    }
    id v31 = -[PKSelectionController _commitStrokeSelection:toDrawing:selectionAction:inkChanges:selectionType:withCompletion:](a1, v13, v12, v29, 0, v28, v3);
    goto LABEL_21;
  }
LABEL_24:
}

- (id)_drawingForSelectionRect:(double)a3
{
  if (a1)
  {
    CGFloat v5 = -[PKSelectionController _attachmentForSelectionRect:](a1, a2, a3, a4, a5);
    double v6 = [v5 drawing];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (void)_refreshTiledViewWithSelectionForDrawing:(void *)a3 completion:
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  double v6 = a3;
  -[PKSelectionController _resetSelectedStrokeStateForRenderer](a1);
  if (v5)
  {
    v10[0] = v5;
    CGFloat v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    -[PKSelectionController _selectionRefreshWithChangeToDrawings:completion:](a1, v7, v6);
  }
  else
  {
    double v8 = os_log_create("com.apple.pencilkit", "Selection");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CGFloat v9 = 0;
      _os_log_error_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_ERROR, "Current stroke selection doesn't have a drawing", v9, 2u);
    }

    if (v6) {
      v6[2](v6);
    }
  }
}

- (void)delete:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    double v4 = +[PKSelectionStatisticsManager sharedStatisticsManager];
    [v4 logSelectionAction:6];

    if (*(void *)(a1 + 128)
      || (-[PKSelectionController _currentAttachment]((id *)a1),
          id v5 = objc_claimAutoreleasedReturnValue(),
          BOOL v6 = -[PKSelectionController _hasExternalElementsInAttachment:]((id *)a1, v5),
          v5,
          v6))
    {
      -[PKSelectionController eraseSelection]((id *)a1);
    }
    else
    {
      CGFloat v7 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v8 = 0;
        _os_log_error_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_ERROR, "SELECTION: No current selection in delete:", v8, 2u);
      }
    }
  }
}

- (BOOL)_hasExternalElementsInAttachment:(id *)a1
{
  id v3 = a2;
  double v4 = -[PKSelectionController _externalElementsInAttachment:](a1, v3);
  uint64_t v5 = [v4 count];

  return v5 != 0;
}

- (void)copy:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    double v4 = +[PKSelectionStatisticsManager sharedStatisticsManager];
    [v4 logSelectionAction:4];

    uint64_t v5 = a1[16];
    if (v5)
    {
LABEL_5:
      [a1 _addItemsToPasteboard:v5];
      goto LABEL_6;
    }
    BOOL v6 = -[PKSelectionController _currentAttachment]((id *)a1);
    BOOL v7 = -[PKSelectionController _hasExternalElementsInAttachment:]((id *)a1, v6);

    if (v7)
    {
      uint64_t v5 = a1[16];
      goto LABEL_5;
    }
    double v8 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CGFloat v9 = 0;
      _os_log_error_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_ERROR, "SELECTION: No current selection in copy:", v9, 2u);
    }
  }
LABEL_6:
}

- (void)cut:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    double v4 = +[PKSelectionStatisticsManager sharedStatisticsManager];
    [v4 logSelectionAction:3];

    uint64_t v5 = a1[16];
    if (v5)
    {
LABEL_5:
      [a1 _addItemsToPasteboard:v5];
      -[PKSelectionController eraseSelection]((id *)a1);
      goto LABEL_6;
    }
    BOOL v6 = -[PKSelectionController _currentAttachment]((id *)a1);
    BOOL v7 = -[PKSelectionController _hasExternalElementsInAttachment:]((id *)a1, v6);

    if (v7)
    {
      uint64_t v5 = a1[16];
      goto LABEL_5;
    }
    double v8 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CGFloat v9 = 0;
      _os_log_error_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_ERROR, "SELECTION: No current selection in cut:", v9, 2u);
    }
  }
LABEL_6:
}

- (void)duplicate:(id *)a1
{
  if (a1)
  {
    id v2 = +[PKSelectionStatisticsManager sharedStatisticsManager];
    [v2 logSelectionAction:5];

    id v3 = -[PKSelectionController _currentAttachment](a1);
    if (a1[16] || -[PKSelectionController _hasExternalElementsInAttachment:](a1, v3))
    {
      double v4 = -[PKSelectionController _selectedExternalElementsInAttachment:]((uint64_t)a1, v3);
      if (a1[16])
      {
        uint64_t v5 = [a1[19] selectionType];
        [a1[19] frame];
        CGFloat v7 = v6;
        CGFloat v9 = v8;
        CGFloat v11 = v10;
        CGFloat v13 = v12;
        [a1[19] frame];
        double v15 = v14;
        double v17 = v16;
        v37.origin.double x = v7;
        v37.origin.double y = v9;
        v37.size.double width = v11;
        v37.size.double height = v13;
        double MidX = CGRectGetMidX(v37);
        v38.origin.double x = v7;
        v38.origin.double y = v9;
        v38.size.double width = v11;
        v38.size.double height = v13;
        double MidY = CGRectGetMidY(v38);
        id WeakRetained = objc_loadWeakRetained(a1 + 15);
        uint64_t v21 = [WeakRetained _maxFileFormatVersion];

        id v22 = a1[16];
        if (v21 == 1) {
          [v22 legacyStrokeDataForSelection];
        }
        else {
        double v24 = [v22 strokeDataForSelection];
        }
        uint64_t v25 = [a1[16] drawing];
        int v26 = +[PKStrokeSelection strokeSelectionFromData:v24 forDrawingClass:objc_opt_class()];
        id v27 = -[PKSelectionController _didDuplicateExternalElements:inAttachment:](a1, v4, v3);
        [v26 setExternalElements:v27];

        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __35__PKSelectionController_duplicate___block_invoke;
        v30[3] = &unk_1E64C84D0;
        v30[4] = a1;
        id v28 = v26;
        id v31 = v28;
        double v33 = v15 * 0.1 + MidX;
        double v34 = v17 * 0.1 + MidY;
        id v29 = v25;
        id v32 = v29;
        uint64_t v35 = v5;
        -[PKSelectionController clearSelectionIfNecessaryWithCompletion:]((uint64_t)a1, v30);
      }
      else
      {
        id v23 = -[PKSelectionController _didDuplicateExternalElements:inAttachment:](a1, v4, v3);
      }
    }
    else
    {
      double v4 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_ERROR, "SELECTION: No current selection in duplicate:", buf, 2u);
      }
    }
  }
}

- (id)_didDuplicateExternalElements:(void *)a3 inAttachment:
{
  id v5 = a2;
  id v6 = a3;
  CGFloat v7 = -[PKSelectionController selectionInteraction](a1);
  double v8 = [v7 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    double v16 = 0;
    goto LABEL_5;
  }
  CGFloat v9 = -[PKSelectionController selectionInteraction](a1);
  double v10 = [v9 delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    CGFloat v7 = -[PKSelectionController _IDsFromExternalElements:](a1, v5);
    double v12 = -[PKSelectionController selectionInteraction](a1);
    CGFloat v13 = [v12 delegate];
    double v14 = -[PKSelectionController selectionInteraction](a1);
    double v15 = [v6 attachmentView];
    double v8 = [v13 selectionInteraction:v14 didDuplicateElements:v7 inAttachment:v15];

    double v16 = -[PKSelectionController _externalElementsForIDs:inAttachment:](a1, v8, v6);
LABEL_5:

    goto LABEL_7;
  }
  double v16 = 0;
LABEL_7:

  return v16;
}

void __35__PKSelectionController_duplicate___block_invoke(uint64_t a1)
{
}

- (void)_pasteStrokeSelection:(void *)a3 atPoint:(uint64_t)a4 inDrawing:(double)a5 withSelectionType:(double)a6
{
  id v11 = a2;
  id v12 = a3;
  if (a1)
  {
    -[PKSelectionController setCurrentStrokeSelection:](a1, v11);
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v25.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v25.c = v13;
    *(_OWORD *)&v25.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    memset(&v24, 0, sizeof(v24));
    -[PKSelectionController _selectionTransformForStrokes:atLocation:dragOffsetInDragView:constrainSelection:inDrawing:]((uint64_t)&v24, a1, v11, 1, v12, a5, a6, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    CGAffineTransform t1 = v25;
    CGAffineTransform t2 = v24;
    CGAffineTransformConcat(&v23, &t1, &t2);
    long long v14 = *(_OWORD *)&v23.c;
    *(_OWORD *)(a1 + 168) = *(_OWORD *)&v23.a;
    *(_OWORD *)(a1 + 184) = v14;
    *(_OWORD *)(a1 + 200) = *(_OWORD *)&v23.tx;
    double v15 = -[PKSelectionController _attachmentForStrokeSelection:]((id *)a1, v11);
    double v16 = [v11 externalElements];
    long long v17 = *(_OWORD *)(a1 + 184);
    v20[0] = *(_OWORD *)(a1 + 168);
    v20[1] = v17;
    v20[2] = *(_OWORD *)(a1 + 200);
    -[PKSelectionController _didDragExternalElements:withTransform:inAttachment:]((id *)a1, v16, v20, v15);

    long long v18 = [v11 externalElements];
    -[PKSelectionController _didEndDraggingExternalElements:inAttachment:]((id *)a1, v18, v15);

    -[PKSelectionController _refreshExternalElementsInStrokeSelection:]((void *)a1, v11);
    id v19 = -[PKSelectionController _commitStrokeSelection:toDrawing:selectionAction:selectionType:](a1, v11, v12, 2, a4);
  }
}

- (void)copyAll:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    -[PKSelectionController selectAll:]((id *)a1, v3);
    [(id)a1 _addItemsToPasteboard:*(void *)(a1 + 128)];
    -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](a1, 1, 0);
  }
}

- (void)selectAll:(id *)a1
{
  id v22 = a2;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v22;
      [v3 sourcePoint];
      id v6 = -[PKSelectionController _drawingForSelectionRect:]((uint64_t)a1, v4 + -60.0, v5 + -60.0, 120.0, 120.0);
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 15);
      [WeakRetained bounds];
      CGFloat x = v24.origin.x;
      CGFloat y = v24.origin.y;
      CGFloat width = v24.size.width;
      CGFloat height = v24.size.height;
      double MidX = CGRectGetMidX(v24);
      v25.origin.CGFloat x = x;
      v25.origin.CGFloat y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      double MidY = CGRectGetMidY(v25);

      id v6 = -[PKSelectionController _drawingForSelectionRect:]((uint64_t)a1, MidX + -60.0, MidY + -60.0, 120.0, 120.0);
    }
    id v14 = objc_loadWeakRetained(a1 + 15);
    double v15 = [v6 uuid];
    double v16 = [v14 _attachmentForUUID:v15];

    long long v17 = (void *)MEMORY[0x1E4F1CAA0];
    long long v18 = [v6 strokes];
    id v19 = [v17 orderedSetWithArray:v18];

    double v20 = -[PKSelectionController _externalElementsInAttachment:](a1, v16);
    -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:](a1, v19, v20, 1, v6);
    uint64_t v21 = +[PKStatisticsManager sharedStatisticsManager]();
    [v19 count];
    [v20 count];
    -[PKStatisticsManager recordSelectAllWithStrokeCount:externalElementsCount:]((uint64_t)v21);
  }
}

- (void)createSticker:(uint64_t)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_8;
  }
  double v4 = +[PKSelectionStatisticsManager sharedStatisticsManager];
  [v4 logSelectionAction:10];

  double v5 = *(void **)(a1 + 128);
  if (v5) {
    goto LABEL_5;
  }
  id v6 = -[PKSelectionController _currentAttachment]((id *)a1);
  BOOL v7 = -[PKSelectionController _hasExternalElementsInAttachment:]((id *)a1, v6);

  if (v7)
  {
    double v5 = *(void **)(a1 + 128);
LABEL_5:
    id v8 = v5;
    CGFloat v9 = [v8 strokes];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __43__PKSelectionController__addToStickerMenu___block_invoke;
      v12[3] = &unk_1E64C84A8;
      v12[4] = a1;
      id v13 = v8;
      -[PKSelectionController generateImageForStrokeSelection:scaleStrategy:highlighted:withCompletion:](a1, v13, 1, 0, v12);
    }
    goto LABEL_8;
  }
  id v11 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v12[0]) = 0;
    _os_log_error_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_ERROR, "SELECTION: No current selection in copy:", (uint8_t *)v12, 2u);
  }

LABEL_8:
}

- (void)paste:(uint64_t)a1
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v102 = a2;
  if (a1)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      [v102 sourcePoint];
      double v4 = v3;
      double v6 = v5;
      -[PKSelectionController _drawingForSelectionRect:](a1, v3, v5, 40.0, 40.0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (*(void *)(a1 + 128))
      {
        [*(id *)(a1 + 152) frame];
        CGFloat v9 = v8;
        CGFloat v11 = v10;
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        [*(id *)(a1 + 152) frame];
        double v17 = v16;
        double v19 = v18;
        v135.origin.CGFloat x = v9;
        v135.origin.CGFloat y = v11;
        v135.size.CGFloat width = v13;
        v135.size.CGFloat height = v15;
        double MidX = CGRectGetMidX(v135);
        v136.origin.CGFloat x = v9;
        v136.origin.CGFloat y = v11;
        v136.size.CGFloat width = v13;
        v136.size.CGFloat height = v15;
        double v21 = v17 * 0.1 + MidX;
        double MidY = v19 * 0.1 + CGRectGetMidY(v136);
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
        [WeakRetained bounds];
        CGFloat x = v137.origin.x;
        CGFloat y = v137.origin.y;
        CGFloat width = v137.size.width;
        CGFloat height = v137.size.height;
        double v21 = CGRectGetMidX(v137);
        v138.origin.CGFloat x = x;
        v138.origin.CGFloat y = y;
        v138.size.CGFloat width = width;
        v138.size.CGFloat height = height;
        double MidY = CGRectGetMidY(v138);
      }
      id v126 = 0;
      double v4 = -[PKSelectionController closestPointForPastedSelectionRect:withDrawing:](a1, &v126, v21 + -60.0, MidY + -60.0, 120.0, 120.0);
      double v6 = v28;
      id v7 = v126;
    }
    id v29 = v7;
    double v30 = (id *)(a1 + 120);
    id v31 = objc_loadWeakRetained((id *)(a1 + 120));
    uint64_t v106 = [v31 effectiveMaximumSupportedContentVersion];

    id v32 = objc_loadWeakRetained((id *)(a1 + 120));
    double v33 = [v29 uuid];
    uint64_t v101 = [v32 _attachmentForUUID:v33];

    v111 = v29;
    *(void *)&double v34 = [(PKSelectionController *)a1 _pointInStrokeSpace:v4 inDrawing:v6].n128_u64[0];
    double v36 = v35;
    id v103 = v101;
    CGRect v37 = -[PKSelectionController selectionInteraction]((id *)a1);
    CGRect v38 = [v37 delegate];
    char v39 = objc_opt_respondsToSelector();

    if (v39)
    {
      uint64_t v40 = -[PKSelectionController selectionInteraction]((id *)a1);
      uint64_t v41 = [v40 delegate];
      CGRect v42 = -[PKSelectionController selectionInteraction]((id *)a1);
      CGFloat v43 = [v103 attachmentView];
      objc_msgSend(v41, "selectionInteractionDidPaste:atPoint:inAttachment:", v42, v43, v34, v36);
    }
    v104 = -[PKSelectionController _selectedExternalElementsInAttachment:](a1, v103);
    double v44 = -[PKSelectionController currentPasteboard]((void *)a1);
    v132[0] = @"com.apple.pencilkit.strokes";
    v132[1] = @"com.apple.drawing";
    uint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:2];
    uint64_t v110 = a1;
    int v46 = [v44 containsPasteboardTypes:v45];

    if (v46)
    {
      v100 = -[PKSelectionController currentPasteboard]((void *)a1);
      [v100 items];
      long long v124 = 0u;
      long long v125 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v47 = [obj countByEnumeratingWithState:&v122 objects:v131 count:16];
      if (!v47) {
        goto LABEL_46;
      }
      uint64_t v108 = *(void *)v123;
      while (1)
      {
        uint64_t v109 = v47;
        for (uint64_t i = 0; i != v109; ++i)
        {
          if (*(void *)v123 != v108) {
            objc_enumerationMutation(obj);
          }
          uint64_t v49 = *(void **)(*((void *)&v122 + 1) + 8 * i);
          double v50 = [v49 objectForKeyedSubscript:@"com.apple.pencilkit.strokes"];
          id v51 = [v49 objectForKeyedSubscript:@"com.apple.drawing"];
          if (v51)
          {
            id v52 = objc_loadWeakRetained(v30);
            uint64_t v53 = [v52 visibleAttachments];
            BOOL v54 = [v53 count] == 0;

            if (v54)
            {
              long long v59 = objc_opt_class();
            }
            else
            {
              id v55 = objc_loadWeakRetained(v30);
              v56 = [v55 visibleAttachments];
              BOOL v57 = [v56 firstObject];
              id v58 = [v57 drawing];
              long long v59 = objc_opt_class();
            }
            long long v60 = +[PKStrokeSelection strokeSelectionFromData:v51 forDrawingClass:v59];
            uint64_t v61 = v60;
            if (isKindOfClass)
            {
              id v62 = v111;
            }
            else
            {
              id v63 = v60;
              [v63 bounds];
              CGFloat v65 = v64;
              CGFloat v67 = v66;
              CGFloat v69 = v68;
              CGFloat v71 = v70;
              double v72 = [v63 drawing];
              [(PKSelectionController *)v110 _selectionDrawingTransformForDrawing:(uint64_t)&v133];
              v139.origin.CGFloat x = v65;
              v139.origin.CGFloat y = v67;
              v139.size.CGFloat width = v69;
              v139.size.CGFloat height = v71;
              CGRect v140 = CGRectApplyAffineTransform(v139, &v133);
              double v73 = v140.size.width;
              double v74 = v140.size.height;

              id v121 = 0;
              double v4 = -[PKSelectionController closestPointForPastedSelectionRect:withDrawing:](v110, &v121, v4 - v73 * 0.5, v6 - v74 * 0.5, v73, v74);
              double v6 = v75;
              id v62 = v121;
            }
            v111 = v62;
            if (!v62) {
              goto LABEL_43;
            }
            id v76 = objc_loadWeakRetained(v30);
            uint64_t v77 = [v76 _maxFileFormatVersion];

            if (v50 && v77 == 1)
            {
              id v78 = +[PKStrokeSelection strokeSelectionFromData:v50 forDrawingClass:objc_opt_class()];
              goto LABEL_29;
            }
            if (v77 < 2)
            {
              double v79 = 0;
            }
            else
            {
              id v78 = v61;
LABEL_29:
              double v79 = v78;
            }
            [v79 setExternalElements:v104];
            if (v106 <= 2 && v79)
            {
              if ([v79 requiredContentVersion] > v106)
              {
                double v80 = os_log_create("com.apple.pencilkit", "Selection");
                if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v83 = [v79 requiredContentVersion];
                  LODWORD(v133.a) = 134218240;
                  *(void *)((char *)&v133.a + 4) = v83;
                  WORD2(v133.b) = 2048;
                  *(void *)((char *)&v133.b + 6) = v106;
                  _os_log_error_impl(&dword_1C44F8000, v80, OS_LOG_TYPE_ERROR, "Trying to paste a stroke selection with required version: %ld, into max version: %ld", (uint8_t *)&v133, 0x16u);
                }

LABEL_42:
LABEL_43:

                goto LABEL_44;
              }
            }
            else if (!v79)
            {
              goto LABEL_43;
            }
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __31__PKSelectionController_paste___block_invoke;
            aBlock[3] = &unk_1E64C84F8;
            aBlock[4] = v110;
            id v117 = v79;
            double v119 = v4;
            double v120 = v6;
            id v118 = v111;
            long long v81 = (void (**)(void))_Block_copy(aBlock);
            double v82 = v81;
            if (*(void *)(v110 + 128))
            {
              v114[0] = MEMORY[0x1E4F143A8];
              v114[1] = 3221225472;
              v114[2] = __31__PKSelectionController_paste___block_invoke_2;
              v114[3] = &unk_1E64C5390;
              v115 = v81;
              -[PKSelectionController clearSelectionIfNecessaryWithCompletion:](v110, v114);
            }
            else
            {
              v81[2](v81);
            }

            goto LABEL_42;
          }
LABEL_44:
        }
        uint64_t v47 = [obj countByEnumeratingWithState:&v122 objects:v131 count:16];
        if (!v47)
        {
LABEL_46:

          goto LABEL_56;
        }
      }
    }
    if (isKindOfClass)
    {
      id v84 = v104;
      CGFloat v86 = *MEMORY[0x1E4F1DB20];
      CGFloat v85 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat v88 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat v87 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      long long v127 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      id v89 = v84;
      uint64_t v90 = [v89 countByEnumeratingWithState:&v127 objects:&v133 count:16];
      if (v90)
      {
        uint64_t v91 = *(void *)v128;
        do
        {
          for (uint64_t j = 0; j != v90; ++j)
          {
            if (*(void *)v128 != v91) {
              objc_enumerationMutation(v89);
            }
            [*(id *)(*((void *)&v127 + 1) + 8 * j) boundingBox];
            v145.origin.CGFloat x = v93;
            v145.origin.CGFloat y = v94;
            v145.size.CGFloat width = v95;
            v145.size.CGFloat height = v96;
            v141.origin.CGFloat x = v86;
            v141.origin.CGFloat y = v85;
            v141.size.CGFloat width = v88;
            v141.size.CGFloat height = v87;
            CGRect v142 = CGRectUnion(v141, v145);
            CGFloat v86 = v142.origin.x;
            CGFloat v85 = v142.origin.y;
            CGFloat v88 = v142.size.width;
            CGFloat v87 = v142.size.height;
          }
          uint64_t v90 = [v89 countByEnumeratingWithState:&v127 objects:&v133 count:16];
        }
        while (v90);
      }

      v143.origin.CGFloat x = v86;
      v143.origin.CGFloat y = v85;
      v143.size.CGFloat width = v88;
      v143.size.CGFloat height = v87;
      double v97 = CGRectGetMidX(v143);
      v144.origin.CGFloat x = v86;
      v144.origin.CGFloat y = v85;
      v144.size.CGFloat width = v88;
      v144.size.CGFloat height = v87;
      CGFloat v98 = CGRectGetMidY(v144);
      memset(&v133, 0, sizeof(v133));
      long long v99 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v113.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v113.c = v99;
      *(_OWORD *)&v113.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      CGAffineTransformTranslate(&v133, &v113, v34 - v97, v36 - v98);
      CGAffineTransform v112 = v133;
      -[PKSelectionController _didDragExternalElements:withTransform:inAttachment:]((id *)a1, v89, &v112, v103);
      -[PKSelectionController _didEndDraggingExternalElements:inAttachment:]((id *)a1, v89, v103);
    }
LABEL_56:
  }
}

- (double)closestPointForPastedSelectionRect:(double)a3 withDrawing:(double)a4
{
  *(double *)&v57[16] = a5;
  *(double *)&v57[24] = a6;
  *(double *)BOOL v57 = a3;
  *(double *)&v57[8] = a4;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0.0;
  }
  double MidX = *MEMORY[0x1E4F1DAD8];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  double v6 = (id *)(a1 + 120);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  double v8 = [WeakRetained visibleAttachments];

  CGFloat v9 = 0;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (!v10) {
    goto LABEL_27;
  }
  uint64_t v11 = *(void *)v61;
  double v59 = 1.79769313e308;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v61 != v11) {
        objc_enumerationMutation(v8);
      }
      CGFloat v13 = *(void **)(*((void *)&v60 + 1) + 8 * i);
      id v14 = objc_loadWeakRetained(v6);
      objc_msgSend(v14, "convertRect:fromView:", v14, *(double *)v57, *(double *)&v57[8], *(double *)&v57[16], *(double *)&v57[24]);
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;

      CGAffineTransform v23 = [v13 superview];
      CGRect v24 = [v13 tileMaskView];
      [v24 frame];
      objc_msgSend(v23, "convertRect:fromView:", v13);
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;

      id v33 = objc_loadWeakRetained(v6);
      double v34 = [v33 scrollView];
      objc_msgSend(v33, "convertRect:fromView:", v34, v26, v28, v30, v32);
      double v36 = v35;
      double v38 = v37;
      CGFloat v40 = v39;
      CGFloat v42 = v41;

      int v43 = [v13 isAtEndOfDocument];
      if (v18 > v38) {
        int v44 = v43;
      }
      else {
        int v44 = 0;
      }
      if (v44 == 1)
      {
        id v50 = v13;

        double MidX = CGRectGetMidX(*(CGRect *)v57);
        CGRectGetMidY(*(CGRect *)v57);
LABEL_26:
        CGFloat v9 = v50;
        goto LABEL_27;
      }
      v71.origin.CGFloat x = v36;
      v71.origin.CGFloat y = v38;
      v71.size.CGFloat width = v40;
      v71.size.CGFloat height = v42;
      v76.origin.CGFloat x = v16;
      v76.origin.CGFloat y = v18;
      v76.size.CGFloat width = v20;
      v76.size.CGFloat height = v22;
      if (CGRectContainsRect(v71, v76))
      {
        id v50 = v13;

        double MidX = CGRectGetMidX(*(CGRect *)v57);
        CGFloat MidY = CGRectGetMidY(*(CGRect *)v57);
        id v51 = os_log_create("com.apple.pencilkit", "Paste");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          v70.CGFloat y = MidY;
          v70.CGFloat x = MidX;
          uint64_t v53 = NSStringFromCGPoint(v70);
          *(_DWORD *)buf = 138412290;
          CGFloat v65 = v53;
          _os_log_debug_impl(&dword_1C44F8000, v51, OS_LOG_TYPE_DEBUG, "Pasting stroke inside of existing drawing at point %@", buf, 0xCu);
        }
        goto LABEL_26;
      }
      double v58 = DKDDistanceToRectFromRect(v36, v38, v40, v42, v16, v18, v20, v22);
      if (v58 < v59)
      {
        id v45 = v13;

        v72.origin.CGFloat x = v16;
        v72.origin.CGFloat y = v18;
        v72.size.CGFloat width = v20;
        v72.size.CGFloat height = v22;
        double MidX = CGRectGetMidX(v72);
        v73.origin.CGFloat x = v16;
        v73.origin.CGFloat y = v18;
        v73.size.CGFloat width = v20;
        v73.size.CGFloat height = v22;
        double v46 = CGRectGetMidY(v73);
        v74.origin.CGFloat x = v36;
        v74.origin.CGFloat y = v38;
        v74.size.CGFloat width = v40;
        v74.size.CGFloat height = v42;
        CGRectGetMidX(v74);
        v75.origin.CGFloat x = v36;
        v75.origin.CGFloat y = v38;
        v75.size.CGFloat width = v40;
        v75.size.CGFloat height = v42;
        if (v46 <= CGRectGetMidY(v75))
        {
          uint64_t v47 = os_log_create("com.apple.pencilkit", "Paste");
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            v69.CGFloat y = v22 * 0.5 + v38;
            v69.CGFloat x = MidX;
            uint64_t v49 = NSStringFromCGPoint(v69);
            *(_DWORD *)buf = 138412290;
            CGFloat v65 = v49;
            _os_log_debug_impl(&dword_1C44F8000, v47, OS_LOG_TYPE_DEBUG, "Pasting stroke, clamped to the top of a drawing at %@", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v47 = os_log_create("com.apple.pencilkit", "Paste");
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            v68.CGFloat y = v38 + v42 + v22 * -0.5;
            v68.CGFloat x = MidX;
            double v48 = NSStringFromCGPoint(v68);
            *(_DWORD *)buf = 138412290;
            CGFloat v65 = v48;
            _os_log_debug_impl(&dword_1C44F8000, v47, OS_LOG_TYPE_DEBUG, "Pasting stroke, clamped to the bottom of a drawing at %@", buf, 0xCu);
          }
        }

        CGFloat v9 = v45;
        double v59 = v58;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_27:

  *a2 = [v9 drawing];

  return MidX;
}

- (__n128)_pointInStrokeSpace:(double)a3 inDrawing:(double)a4
{
  id v7 = a2;
  if (a1)
  {
    double v8 = (id *)(a1 + 120);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    uint64_t v10 = [v7 uuid];
    uint64_t v11 = [WeakRetained _attachmentForUUID:v10];

    double v12 = [v11 tileContainerView];
    id v13 = objc_loadWeakRetained(v8);
    objc_msgSend(v12, "convertPoint:fromView:", v13, a3, a4);
    long long v17 = v15;
    long long v18 = v14;

    if (v11) {
      objc_msgSend(v11, "drawingTransform", v17, v18);
    }
    else {
      memset(&v20, 0, sizeof(v20));
    }
    CGAffineTransformInvert(&v21, &v20);
    float64x2_t v19 = vaddq_f64(*(float64x2_t *)&v21.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v21.c, *(double *)&v17), *(float64x2_t *)&v21.a, *(double *)&v18));
  }
  else
  {
    float64x2_t v19 = 0u;
  }

  return (__n128)v19;
}

void __31__PKSelectionController_paste___block_invoke(uint64_t a1)
{
}

uint64_t __31__PKSelectionController_paste___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_didDragExternalElements:(void *)a3 withTransform:(void *)a4 inAttachment:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    CGFloat v9 = -[PKSelectionController selectionInteraction](a1);
    uint64_t v10 = [v9 delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      double v12 = -[PKSelectionController _IDsFromExternalElements:](a1, v7);
      id v13 = -[PKSelectionController selectionInteraction](a1);
      long long v14 = [v13 delegate];
      long long v15 = -[PKSelectionController selectionInteraction](a1);
      double v16 = objc_msgSend(v8, "attachmentView", *a3, a3[1], a3[2], a3[3], a3[4], a3[5]);
      [v14 selectionInteraction:v15 didDragElements:v12 withTransform:&v17 inAttachment:v16];
    }
  }
}

- (void)_didEndDraggingExternalElements:(void *)a3 inAttachment:
{
  id v14 = a2;
  id v5 = a3;
  if (a1)
  {
    double v6 = -[PKSelectionController selectionInteraction](a1);
    id v7 = [v6 delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      CGFloat v9 = -[PKSelectionController _IDsFromExternalElements:](a1, v14);
      uint64_t v10 = -[PKSelectionController selectionInteraction](a1);
      char v11 = [v10 delegate];
      double v12 = -[PKSelectionController selectionInteraction](a1);
      id v13 = [v5 attachmentView];
      [v11 selectionInteraction:v12 didEndDraggingElements:v9 inAttachment:v13];
    }
  }
}

- (void)changeColorOfSelection:(uint64_t)a1
{
  id v3 = a2;
  if (a1) {
    -[PKSelectionController changeColorOfSelection:withCompletion:](a1, v3, 0);
  }
}

- (void)changeColorOfSelection:(void *)a3 withCompletion:
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = +[PKSelectionStatisticsManager sharedStatisticsManager];
    [v7 logSelectionAction:2];

    if (v6)
    {
LABEL_3:
      -[PKSelectionController _resetSelectedStrokeStateForRenderer](a1);
      double v25 = @"PKInkColorProperty";
      v26[0] = v5;
      char v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      *(unsigned char *)(a1 + 88) = 1;
      objc_initWeak(&location, (id)a1);
      CGFloat v9 = *(void **)(a1 + 128);
      uint64_t v10 = [v9 drawing];
      uint64_t v11 = [*(id *)(a1 + 152) selectionType];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __63__PKSelectionController_changeColorOfSelection_withCompletion___block_invoke_2;
      v18[3] = &unk_1E64C8520;
      id v19 = v6;
      objc_copyWeak(&v20, &location);
      id v12 = -[PKSelectionController _commitStrokeSelection:toDrawing:selectionAction:inkChanges:selectionType:withCompletion:](a1, v9, v10, 3, v8, v11, v18);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);

      goto LABEL_10;
    }
    id v13 = *(void **)(a1 + 96);
    if (*(unsigned char *)(a1 + 88))
    {
      if (!v13) {
        goto LABEL_9;
      }
    }
    else if (!v13)
    {
      goto LABEL_3;
    }
    dispatch_block_cancel(v13);
LABEL_9:
    objc_initWeak(&location, (id)a1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PKSelectionController_changeColorOfSelection_withCompletion___block_invoke;
    block[3] = &unk_1E64C5E98;
    objc_copyWeak(&v23, &location);
    id v22 = v5;
    dispatch_block_t v14 = dispatch_block_create((dispatch_block_flags_t)0, block);
    double v16 = *(void **)(a1 + 96);
    long long v15 = (dispatch_block_t *)(a1 + 96);
    *long long v15 = v14;

    dispatch_time_t v17 = dispatch_time(0, 100000000);
    dispatch_after(v17, MEMORY[0x1E4F14428], *v15);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
LABEL_10:
}

void __63__PKSelectionController_changeColorOfSelection_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[12];
    WeakRetained[12] = 0;

    if (WeakRetained[16]) {
      -[PKSelectionController changeColorOfSelection:](WeakRetained, *(void *)(a1 + 32));
    }
  }
}

void __63__PKSelectionController_changeColorOfSelection_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    WeakRetained[88] = 0;
  }
}

- (void)_selectionTransformForStrokes:(void *)a3 atLocation:(int)a4 dragOffsetInDragView:(void *)a5 constrainSelection:(double)a6 inDrawing:(double)a7
{
  id v17 = a3;
  id v18 = a5;
  if (a2)
  {
    id v19 = *(void **)(a2 + 152);
    double v55 = a9;
    if (v19
      && ([v19 strokeSelection],
          id v20 = (id)objc_claimAutoreleasedReturnValue(),
          v20,
          id v19 = *(void **)(a2 + 152),
          v20 == v17))
    {
      [v19 frame];
      double v25 = v27;
      double v26 = v28;
      CGFloat v22 = v29;
      CGFloat v24 = v30;
    }
    else
    {
      [v19 frame];
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      double v25 = a6 - a8 - v21 * 0.5;
      double v26 = a7 - a9 - v23 * 0.5;
    }
    v63.origin.CGFloat x = v25;
    v63.origin.CGFloat y = v26;
    v63.size.CGFloat width = v22;
    v63.size.CGFloat height = v24;
    double MidX = CGRectGetMidX(v63);
    v64.origin.CGFloat x = v25;
    v64.origin.CGFloat y = v26;
    v64.size.CGFloat width = v22;
    v64.size.CGFloat height = v24;
    double MidY = CGRectGetMidY(v64);
    unint64_t v33 = [(PKSelectionController *)a2 _pointInStrokeSpace:MidX inDrawing:MidY].n128_u64[0];
    CGFloat v35 = v34;
    double v36 = a7;
    [v17 bounds];
    CGFloat x = v65.origin.x;
    CGFloat y = v65.origin.y;
    CGFloat width = v65.size.width;
    CGFloat height = v65.size.height;
    double v41 = CGRectGetMidX(v65);
    v66.origin.CGFloat x = x;
    v66.origin.CGFloat y = y;
    v66.size.CGFloat width = width;
    v66.size.CGFloat height = height;
    CGFloat v42 = CGRectGetMidY(v66);
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    CGAffineTransformMakeTranslation((CGAffineTransform *)a1, -v41, -v42);
    if (a4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a2 + 120));
      [WeakRetained frame];
      double v45 = v44;
      [(PKSelectionController *)a2 _selectionDrawingTransformForDrawing:(uint64_t)v62];
      double v46 = DKDScaleForTransform(v62);

      [v17 boundsWithoutLasso];
      double v48 = v45 / v46;
      if (v47 > v48)
      {
        memset(&v61, 0, sizeof(v61));
        double v49 = v48 / v47;
        CGAffineTransformMakeScale(&v61, v48 / v47, v48 / v47);
        long long v50 = *(_OWORD *)(a1 + 16);
        *(_OWORD *)&t1.a = *(_OWORD *)a1;
        *(_OWORD *)&t1.c = v50;
        *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a1 + 32);
        CGAffineTransform t2 = v61;
        CGAffineTransformConcat(&v60, &t1, &t2);
        long long v51 = *(_OWORD *)&v60.c;
        *(_OWORD *)a1 = *(_OWORD *)&v60.a;
        *(_OWORD *)(a1 + 16) = v51;
        *(_OWORD *)(a1 + 32) = *(_OWORD *)&v60.tx;
        unint64_t v33 = [(PKSelectionController *)a2 _pointInStrokeSpace:v48 * 0.5 inDrawing:v36 - v55 * v49].n128_u64[0];
        CGFloat v35 = v52;
      }
    }
    long long v53 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&v57.a = *(_OWORD *)a1;
    *(_OWORD *)&v57.c = v53;
    *(_OWORD *)&v57.tCGFloat x = *(_OWORD *)(a1 + 32);
    CGAffineTransformMakeTranslation(&v56, *(CGFloat *)&v33, v35);
    CGAffineTransformConcat(&v61, &v57, &v56);
    long long v54 = *(_OWORD *)&v61.c;
    *(_OWORD *)a1 = *(_OWORD *)&v61.a;
    *(_OWORD *)(a1 + 16) = v54;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)&v61.tx;
  }
  else
  {
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }
}

- (id)_strokeSelectionForDropSession:(uint64_t)a1
{
  id v3 = a2;
  double v4 = v3;
  if (a1)
  {
    id v5 = [v3 localDragSession];
    id v6 = [v5 localContext];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v4 localDragSession];
      char v8 = [v7 localContext];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

void __77__PKSelectionController__createSelectionViewForDropSession_removeFromSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        char v8 = objc_msgSend(*(id *)(a1 + 32), "externalElementsItemProvider", (void)v9);
        [v7 setExternalElementsItemProvider:v8];

        -[PKSelectionController _createSelectionViewForDropSession:removeFromSource:withStrokeSelection:](*(id **)(a1 + 40), *(void **)(a1 + 48), *(unsigned char *)(a1 + 56), v7);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)_createSelectionViewForDropSession:(char)a3 removeFromSource:(void *)a4 withStrokeSelection:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 15);
    [v7 locationInView:WeakRetained];
    double v11 = v10;
    double v13 = v12;

    uint64_t v14 = -[PKSelectionController _drawingForSelectionRect:]((uint64_t)a1, v11, v13, 120.0, 120.0);
    id v15 = objc_loadWeakRetained(a1 + 15);
    double v16 = [v14 uuid];
    id v17 = [v15 _attachmentForUUID:v16];

    id v18 = [v8 externalElementsItemProvider];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __97__PKSelectionController__createSelectionViewForDropSession_removeFromSource_withStrokeSelection___block_invoke;
    v21[3] = &unk_1E64C8570;
    id v22 = v8;
    double v23 = a1;
    id v19 = v17;
    id v24 = v19;
    id v25 = v7;
    id v20 = v14;
    id v26 = v20;
    char v27 = a3;
    -[PKSelectionController _didDropExternalElementsItemProvider:inAttachment:withCompletion:](a1, v18, v19, v21);
  }
}

id __97__PKSelectionController__createSelectionViewForDropSession_removeFromSource_withStrokeSelection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = -[PKSelectionController _externalElementsForIDs:inAttachment:](*(id **)(a1 + 40), a2, *(void **)(a1 + 48));
  [*(id *)(a1 + 32) setExternalElements:v3];

  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v27.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v27.c = v4;
  *(_OWORD *)&v27.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  memset(&v26, 0, sizeof(v26));
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(id **)(a1 + 40);
  id v7 = *(void **)(a1 + 56);
  id v8 = -[PKSelectionController topView](v5);
  [v7 locationInView:v8];
  -[PKSelectionController _selectionTransformForStrokes:atLocation:dragOffsetInDragView:constrainSelection:inDrawing:]((uint64_t)&v26, (uint64_t)v5, v6, 1, *(void **)(a1 + 64), v9, v10, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  CGAffineTransform t1 = v27;
  CGAffineTransform t2 = v26;
  CGAffineTransformConcat(&v25, &t1, &t2);
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11)
  {
    long long v12 = *(_OWORD *)&v25.c;
    *(_OWORD *)(v11 + 168) = *(_OWORD *)&v25.a;
    *(_OWORD *)(v11 + 184) = v12;
    *(_OWORD *)(v11 + 200) = *(_OWORD *)&v25.tx;
    double v13 = *(id **)(a1 + 40);
  }
  else
  {
    double v13 = 0;
  }
  uint64_t v14 = [*(id *)(a1 + 32) externalElements];
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15)
  {
    long long v16 = *(_OWORD *)(v15 + 184);
    long long v20 = *(_OWORD *)(v15 + 168);
    long long v21 = v16;
    long long v22 = *(_OWORD *)(v15 + 200);
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
  }
  -[PKSelectionController _didDragExternalElements:withTransform:inAttachment:](v13, v14, &v20, *(void **)(a1 + 48));

  id v17 = *(id **)(a1 + 40);
  id v18 = objc_msgSend(*(id *)(a1 + 32), "externalElements", v20, v21, v22);
  -[PKSelectionController _didEndDraggingExternalElements:inAttachment:](v17, v18, *(void **)(a1 + 48));

  -[PKSelectionController _refreshExternalElementsInStrokeSelection:](*(void **)(a1 + 40), *(void **)(a1 + 32));
  return -[PKSelectionController _commitStrokeSelection:toDrawing:selectionAction:selectionType:](*(void *)(a1 + 40), *(void **)(a1 + 32), *(void **)(a1 + 64), 2 * (*(unsigned char *)(a1 + 72) == 0), 0);
}

- (id)_externalElementsForIDs:(void *)a3 inAttachment:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  id v22 = a3;
  if (a1
    && (-[PKSelectionController selectionInteraction](a1),
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 delegate],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    id v21 = [MEMORY[0x1E4F1CA70] orderedSet];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    obuint64_t j = v19;
    uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          long long v12 = -[PKSelectionController selectionInteraction](a1);
          double v13 = [v12 delegate];
          uint64_t v14 = -[PKSelectionController selectionInteraction](a1);
          uint64_t v15 = [v22 attachmentView];
          uint64_t v16 = [v13 selectionInteraction:v14 pathForElement:v11 inAttachment:v15];

          id v17 = [[PKExternalElement alloc] initWithIdentifier:v11 path:v16];
          [v21 addObject:v17];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (void)_didDropExternalElementsItemProvider:(void *)a3 inAttachment:(void *)a4 withCompletion:
{
  id v16 = a2;
  id v7 = a3;
  uint64_t v8 = a4;
  if (a1)
  {
    uint64_t v9 = -[PKSelectionController selectionInteraction](a1);
    double v10 = [v9 delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      long long v12 = -[PKSelectionController selectionInteraction](a1);
      double v13 = [v12 delegate];
      uint64_t v14 = -[PKSelectionController selectionInteraction](a1);
      uint64_t v15 = [v7 attachmentView];
      [v13 selectionInteraction:v14 didDropItemProvider:v16 inAttachment:v15 withCompletion:v8];
    }
    else
    {
      v8[2](v8, 0);
    }
  }
}

- (void)updateCurrentStrokeSelectionTransformForLocation:(double)a3 atLocation:(double)a4 offsetInTouchView:(double)a5
{
  id v11 = a2;
  if (a1)
  {
    [*(id *)(a1 + 152) frame];
    double v13 = v12;
    double v15 = v14;
    -[PKSelectionController _drawingForSelectionRect:](a1, a3 - a5, a4 - a6, v12, v14);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      id v24 = 0;
      -[PKSelectionController closestPointForPastedSelectionRect:withDrawing:](a1, &v24, a3 - a5, a4 - a6, v13, v15);
      id v16 = v24;
    }
    -[PKSelectionController _selectionTransformForStrokes:atLocation:dragOffsetInDragView:constrainSelection:inDrawing:]((uint64_t)v23, a1, v11, 0, v16, a3, a4, a5, a6);
    long long v17 = v23[1];
    *(_OWORD *)(a1 + 168) = v23[0];
    *(_OWORD *)(a1 + 184) = v17;
    *(_OWORD *)(a1 + 200) = v23[2];
    if (!*(void *)(a1 + 24))
    {
      id v18 = [v11 drawing];
      uint64_t v19 = [v18 uuid];
      long long v20 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v19;
    }
    uint64_t v21 = [v16 uuid];
    id v22 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v21;
  }
}

- (id)_externalElementsInAttachment:(id *)a1
{
  id v3 = a2;
  long long v4 = -[PKSelectionController selectionInteraction](a1);
  uint64_t v5 = [v4 delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = -[PKSelectionController selectionInteraction](a1);
    uint64_t v8 = [v7 delegate];
    uint64_t v9 = -[PKSelectionController selectionInteraction](a1);
    double v10 = [v3 attachmentView];
    id v11 = [v8 selectionInteraction:v9 elementsInAttachment:v10];

    double v12 = -[PKSelectionController _externalElementsForIDs:inAttachment:](a1, v11, v3);
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (void)didBeginSpaceInsertionWithLassoPath:(double)a3 atLocation:(double)a4
{
  id v7 = a2;
  if (a1)
  {
    uint64_t v8 = -[PKSelectionController _drawingForSelectionRect:]((uint64_t)a1, a3 + -60.0, a4 + -60.0, 120.0, 120.0);
    uint64_t v9 = -[PKSelectionController _strokeForLassoPath:inDrawing:]((uint64_t)a1, v7, v8);
    id WeakRetained = objc_loadWeakRetained(a1 + 15);
    id v11 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained transformFromViewToStrokeSpaceInDrawing:v8];
      double v13 = v23;
      double v12 = v22;
      double v14 = v25;
      double v15 = v24;
      double v16 = v27;
      double v17 = v26;
    }
    else
    {
      double v16 = 0.0;
      double v14 = 0.0;
      double v13 = 0.0;
      double v17 = 0.0;
      double v15 = 0.0;
      double v12 = 0.0;
    }

    id v18 = objc_loadWeakRetained(a1 + 15);
    uint64_t v19 = [v8 uuid];
    long long v20 = [v18 _attachmentForUUID:v19];

    uint64_t v21 = [(PKSelectionController *)a1 _elementsForSpaceInsertedAtPoint:v17 + a4 * v15 + v12 * a3 inAttachment:v16 + a4 * v14 + v13 * a3];
    [a1 didBeginSpaceInsertionWithLassoStroke:v9 drawing:v8 addDefaultSpace:0 strokesAbove:0 strokesBelow:0 externalElements:v21];
  }
}

- (id)_elementsForSpaceInsertedAtPoint:(double)a3 inAttachment:(double)a4
{
  id v7 = a2;
  uint64_t v8 = -[PKSelectionController selectionInteraction](a1);
  uint64_t v9 = [v8 delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = -[PKSelectionController selectionInteraction](a1);
    double v12 = [v11 delegate];
    double v13 = -[PKSelectionController selectionInteraction](a1);
    double v14 = [v7 attachmentView];
    double v15 = objc_msgSend(v12, "selectionInteraction:elementsForSpaceInsertedAtPoint:inAttachment:", v13, v14, a3, a4);

    double v16 = [v7 attachmentView];
    double v17 = -[PKSelectionController _externalElementsForIDs:inAttachment:](a1, v15, v16);
  }
  else
  {
    double v17 = 0;
  }

  return v17;
}

- (void)didBeginSpaceInsertionWithLassoStroke:(id)a3 drawing:(id)a4 addDefaultSpace:(BOOL)a5 strokesAbove:(id)a6 strokesBelow:(id)a7 externalElements:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __130__PKSelectionController_didBeginSpaceInsertionWithLassoStroke_drawing_addDefaultSpace_strokesAbove_strokesBelow_externalElements___block_invoke;
  v24[3] = &unk_1E64C8598;
  v24[4] = self;
  id v25 = v14;
  BOOL v30 = a5;
  id v26 = v15;
  id v27 = v16;
  id v28 = v17;
  id v29 = v18;
  id v19 = v18;
  id v20 = v17;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  -[PKSelectionController clearSelectionIfNecessaryWithCompletion:]((uint64_t)self, v24);
}

uint64_t __130__PKSelectionController_didBeginSpaceInsertionWithLassoStroke_drawing_addDefaultSpace_strokesAbove_strokesBelow_externalElements___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 144) didBeginCreatingSpaceWithLassoStroke:*(void *)(a1 + 40) drawing:*(void *)(a1 + 48) addDefaultSpace:*(unsigned __int8 *)(a1 + 80) strokesAbove:*(void *)(a1 + 56) strokesBelow:*(void *)(a1 + 64) externalElements:*(void *)(a1 + 72)];
}

- (id)applySpaceInsertionWithStrokeSelection:(void *)a3 inDrawing:(void *)a4 offset:(CGFloat)a5 completion:
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    if (v10)
    {
      CGAffineTransformMakeTranslation(&v23, 0.0, a5);
      long long v12 = *(_OWORD *)&v23.c;
      *(_OWORD *)(a1 + 168) = *(_OWORD *)&v23.a;
      *(_OWORD *)(a1 + 184) = v12;
      *(_OWORD *)(a1 + 200) = *(_OWORD *)&v23.tx;
      double v13 = [v9 strokes];
      id v14 = [v13 array];

      long long v15 = *(_OWORD *)(a1 + 184);
      v22[0] = *(_OWORD *)(a1 + 168);
      v22[1] = v15;
      v22[2] = *(_OWORD *)(a1 + 200);
      id v16 = [v10 undoableTransformStrokes:v14 withTransform:v22 concat:1];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
      [WeakRetained didChangeDrawing:v10];

      if (v16) {
        -[PKSelectionController registerCommandWithUndoManager:](a1, v16);
      }
      -[PKSelectionController _resetSelectedStrokeStateForRenderer](a1);
      v26[0] = v10;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      -[PKSelectionController _selectionRefreshWithChangeToDrawings:completion:](a1, v18, v11);

      id v19 = +[PKDrawing visibleStrokesFromStrokes:v14 inDrawing:v10];

      a1 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v19];
    }
    else
    {
      id v20 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v9;
        _os_log_fault_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_FAULT, "Trying to fetch strokes for insert space with a nil drawing with stroke selection %@", buf, 0xCu);
      }

      if (v11) {
        v11[2](v11);
      }
      a1 = [MEMORY[0x1E4F1CAA0] orderedSet];
    }
  }

  return (id)a1;
}

- (void)hideStrokes:(void *)a3 inDrawing:
{
  id v9 = a2;
  id v5 = a3;
  if (a1)
  {
    -[PKSelectionController _resetSelectedStrokeStateForRenderer](a1);
    char v6 = [v9 strokes];
    id v7 = [v6 array];
    id v8 = +[PKStroke copyStrokes:v7 hidden:1];
    -[PKSelectionController _setAdditionalStrokes:inDrawing:completion:](a1, v8, v5, 0);
  }
}

- (void)_setAdditionalStrokes:(void *)a3 inDrawing:(void *)a4 completion:
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    if (v11) {
      id v10 = v11;
    }
    else {
      id v10 = (id)MEMORY[0x1E4F1CBF0];
    }
    [WeakRetained _setAdditionalStrokes:v10 inDrawing:v7 completion:v8];
  }
}

- (void)insertSpaceAtPoint:(void *)a3 addDefaultSpace:(void *)a4 strokesAbove:(double)a5 strokesBelow:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  if (a1)
  {
    double v13 = -[PKSelectionController _drawingForSelectionRect:]((uint64_t)a1, a5 + -60.0, a6 + -60.0, 120.0, 120.0);
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;
      id v16 = [MEMORY[0x1E4FB14C0] bezierPath];
      id WeakRetained = objc_loadWeakRetained(a1 + 15);
      [WeakRetained origin];
      objc_msgSend(v16, "moveToPoint:");

      id v18 = objc_loadWeakRetained(a1 + 15);
      [v18 bounds];
      objc_msgSend(v16, "addLineToPoint:", CGRectGetMaxX(v38), a6);

      id v19 = -[PKSelectionController _strokeForLassoPath:inDrawing:]((uint64_t)a1, v16, v15);

      id v20 = objc_loadWeakRetained(a1 + 15);
      id v21 = v20;
      if (v20)
      {
        [v20 transformFromViewToStrokeSpaceInDrawing:v15];
        double v23 = v33;
        double v22 = v32;
        double v24 = v35;
        double v25 = v34;
        double v26 = v37;
        double v27 = v36;
      }
      else
      {
        double v26 = 0.0;
        double v24 = 0.0;
        double v23 = 0.0;
        double v27 = 0.0;
        double v25 = 0.0;
        double v22 = 0.0;
      }

      id v28 = objc_loadWeakRetained(a1 + 15);
      id v29 = [v15 uuid];
      BOOL v30 = [v28 _attachmentForUUID:v29];

      double v31 = [(PKSelectionController *)a1 _elementsForSpaceInsertedAtPoint:v27 + a6 * v25 + v22 * a5 inAttachment:v26 + a6 * v24 + v23 * a5];
      [a1 didBeginSpaceInsertionWithLassoStroke:v19 drawing:v15 addDefaultSpace:a2 strokesAbove:v11 strokesBelow:v12 externalElements:v31];
    }
  }
}

- (void)insertSpace:(id *)a1
{
  id v6 = a2;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v6;
      [v3 sourcePoint];
    }
    else
    {
      id v3 = a1[19];
      [v3 frame];
    }
    [(PKSelectionController *)a1 insertSpaceAtPoint:0 addDefaultSpace:0 strokesAbove:v4 strokesBelow:v5];
  }
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = -[PKSelectionController topView]((id *)&self->super.isa);
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v12 = [WeakRetained _maxFileFormatVersion];

  if (v12 == 1)
  {
    v17[0] = @"com.apple.pencilkit.strokes";
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  }
  else
  {
    uint64_t v13 = +[PKStrokeSelection readableTypeIdentifiersForItemProvider];
  }
  id v14 = (void *)v13;
  if ([v5 hasItemsConformingToTypeIdentifiers:v13]) {
    char v15 = [(PKSelectionController *)(uint64_t)self _isValidDropPointForStrokes:v10];
  }
  else {
    char v15 = 0;
  }

  return v15;
}

- (uint64_t)_isValidDropPointForStrokes:(double)a3
{
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  uint64_t v6 = objc_msgSend(WeakRetained, "_isValidDropPointForStrokes:", a2, a3);

  return v6;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v5 = a4;
  if (!self->_selectionView)
  {
    id v14 = v5;
    uint64_t v6 = -[PKSelectionController _strokeSelectionForDropSession:]((uint64_t)self, v5);
    double v7 = [v6 drawing];
    double v8 = [v7 uuid];
    double v9 = -[PKSelectionController drawingForUUID:]((uint64_t)self, v8);

    if (v9)
    {
      double v10 = [v6 strokes];
      id v11 = [v10 array];
      id v12 = +[PKStroke copyStrokes:v11 hidden:1];
      uint64_t v13 = [v6 drawing];
      -[PKSelectionController _setAdditionalStrokes:inDrawing:completion:]((uint64_t)self, v12, v13, 0);
    }
    id v5 = v14;
  }
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5 = a4;
  uint64_t v6 = -[PKSelectionController topView]((id *)&self->super.isa);
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  id v11 = -[PKSelectionController _strokeSelectionForDropSession:]((uint64_t)self, v5);
  id v12 = -[PKSelectionController _drawingForSelectionRect:]((uint64_t)self, v8, v10, 40.0, 40.0);
  if (self && self->_currentStrokeSelection)
  {
    uint64_t v13 = [v11 drawing];
    if (v13 == v12)
    {
      char v15 = [v11 externalElementsItemProvider];
      BOOL v14 = v15 != 0;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
  if (([(PKSelectionController *)(uint64_t)self _isValidDropPointForStrokes:v10] ^ 1 | v14))
  {
    id v16 = objc_alloc(MEMORY[0x1E4FB1740]);
    uint64_t v17 = 0;
  }
  else
  {
    id v18 = [v11 drawing];
    id v19 = [v18 uuid];
    id v20 = -[PKSelectionController drawingForUUID:]((uint64_t)self, v19);

    id v16 = objc_alloc(MEMORY[0x1E4FB1740]);
    if (v20) {
      uint64_t v17 = 3;
    }
    else {
      uint64_t v17 = 2;
    }
  }
  id v21 = (void *)[v16 initWithDropOperation:v17];

  return v21;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = -[PKSelectionController topView]((id *)&self->super.isa);
  [v5 locationInView:v6];
  self->_dropPosition.CGFloat x = v7;
  self->_dropPosition.CGFloat y = v8;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);
  uint64_t v10 = [WeakRetained effectiveMaximumSupportedContentVersion];

  id v11 = -[PKSelectionController _strokeSelectionForDropSession:]((uint64_t)self, v5);
  id v12 = v11;
  if (v10 > 2 || [v11 requiredContentVersion] <= v10)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_tiledView);
    [v5 locationInView:v15];
    double v17 = v16;
    double v19 = v18;

    BOOL v14 = -[PKSelectionController _drawingForSelectionRect:]((uint64_t)self, v17, v19, 120.0, 120.0);
    -[PKSelectionController _attachmentForStrokeSelection:]((id *)&self->super.isa, v12);
    os_log_t v13 = (os_log_t)objc_claimAutoreleasedReturnValue();
    id v20 = objc_loadWeakRetained((id *)&self->_tiledView);
    id v21 = [v14 uuid];
    int v43 = [v20 _attachmentForUUID:v21];

    if (self->_currentStrokeSelection && [(PKSelectionView *)self->_selectionView isDragging])
    {
      double v22 = [v12 externalElements];
      -[PKSelectionController _didDeleteExternalElements:inAttachment:]((id *)&self->super.isa, v22, v13);

      double v23 = [v12 externalElementsItemProvider];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __53__PKSelectionController_dropInteraction_performDrop___block_invoke;
      v44[3] = &unk_1E64C85C0;
      id v45 = v12;
      double v46 = self;
      id v47 = v43;
      id v48 = v5;
      -[PKSelectionController _didDropExternalElementsItemProvider:inAttachment:withCompletion:]((id *)&self->super.isa, v23, v47, v44);
    }
    else
    {
      double v24 = [v12 drawing];
      double v25 = [v24 uuid];
      double v26 = -[PKSelectionController drawingForUUID:]((uint64_t)self, v25);

      if (v26)
      {
        double v27 = [v12 externalElements];
        -[PKSelectionController _didDeleteExternalElements:inAttachment:]((id *)&self->super.isa, v27, v13);

        id v28 = os_log_create("com.apple.pencilkit", "Selection");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C44F8000, v28, OS_LOG_TYPE_DEBUG, "Selection is from drawing originally, but drawing got torn down mid-drag", buf, 2u);
        }

        -[PKSelectionController _createSelectionViewForDropSession:removeFromSource:withStrokeSelection:]((id *)&self->super.isa, v5, 1, v12);
      }
      else
      {
        -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)self, 1, 0);
        id v42 = v5;
        id v29 = objc_loadWeakRetained((id *)&self->_tiledView);
        BOOL v30 = [v29 visibleAttachments];
        uint64_t v31 = [v30 count];

        if (v31)
        {
          id v32 = objc_loadWeakRetained((id *)&self->_tiledView);
          double v33 = [v32 visibleAttachments];
          double v34 = [v33 firstObject];
          double v35 = [v34 drawing];
          double v36 = [v35 strokeSelectionClass];
        }
        else
        {
          double v36 = objc_opt_class();
        }
        id v37 = v36;
        CGRect v38 = -[PKSelectionController _strokeSelectionForDropSession:]((uint64_t)self, v42);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __77__PKSelectionController__createSelectionViewForDropSession_removeFromSource___block_invoke;
        long long v50 = &unk_1E64C8548;
        id v51 = v38;
        double v52 = self;
        id v39 = v42;
        id v53 = v39;
        char v54 = 0;
        id v40 = v38;
        id v41 = (id)[v39 loadObjectsOfClass:v37 completion:buf];
      }
    }
  }
  else
  {
    os_log_t v13 = os_log_create("com.apple.pencilkit", "Selection");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = [v12 requiredContentVersion];
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v10;
      _os_log_error_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_ERROR, "Trying to drop a stroke selection with required version: %ld, into max version: %ld", buf, 0x16u);
    }
    BOOL v14 = v13;
  }
}

uint64_t __53__PKSelectionController_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  id v3 = -[PKSelectionController _externalElementsForIDs:inAttachment:](*(id **)(a1 + 40), a2, *(void **)(a1 + 48));
  [*(id *)(a1 + 32) setExternalElements:v3];

  double v4 = *(void **)(a1 + 56);
  id v5 = -[PKSelectionController topView](*(id **)(a1 + 40));
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    id v11 = *(void **)(v10 + 152);
  }
  else {
    id v11 = 0;
  }
  objc_msgSend(v11, "updateLocationForDrop:", v7, v9);
  [(PKSelectionController *)*(void *)(a1 + 40) didMoveStrokeSelectionToLocation:v9];
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    os_log_t v13 = *(void **)(v12 + 152);
  }
  else {
    os_log_t v13 = 0;
  }

  return [v13 _putStrokesBackIntoTiledViewAnimated:1];
}

- (void)didMoveStrokeSelectionToLocation:(double)a3
{
  if (a1)
  {
    [*(id *)(a1 + 152) offsetInTouchView];
    double v8 = *(void **)(a1 + 128);
    -[PKSelectionController updateCurrentStrokeSelectionTransformForLocation:atLocation:offsetInTouchView:](a1, v8, a2, a3, v6, v7);
  }
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  if (self) {
    self = (PKSelectionController *)self->_selectionView;
  }
  return [(PKSelectionController *)self _dropDataOwner];
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v6 = a5;
  [(PKSelectionView *)self->_selectionView offsetInTouchView];
  double v8 = v7;
  double v10 = v9;
  [(PKSelectionView *)self->_selectionView bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  id v19 = objc_alloc(MEMORY[0x1E4FB1728]);
  v31.origin.CGFloat x = v12;
  v31.origin.CGFloat y = v14;
  v31.size.CGFloat width = v16;
  v31.size.CGFloat height = v18;
  double MidX = CGRectGetMidX(v31);
  v32.origin.CGFloat x = v12;
  v32.origin.CGFloat y = v14;
  v32.size.CGFloat width = v16;
  v32.size.CGFloat height = v18;
  double MidY = CGRectGetMidY(v32);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);
  double v23 = MidX + self->_dropPosition.x - v8;
  double v24 = MidY + self->_dropPosition.y - v10;
  long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v29[0] = *MEMORY[0x1E4F1DAB8];
  v29[1] = v25;
  v29[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  double v26 = objc_msgSend(v19, "initWithContainer:center:transform:", WeakRetained, v29, v23, v24);

  double v27 = [v6 retargetedPreviewWithTarget:v26];

  return v27;
}

- (void)didBeginDraggingSelection
{
  if (a1)
  {
    [a1 didBeginModifyDrawing];
    -[PKSelectionController selectionInteraction]((id *)a1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [v2 _didBeginDraggingSelection:a1[19]];
  }
}

- (void)didEndDraggingSelection
{
  if (a1)
  {
    [a1 didEndModifyDrawing];
    -[PKSelectionController selectionInteraction]((id *)a1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [v2 _didEndDraggingSelection:a1[19]];
  }
}

- (void)didBeginModifyDrawing
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);
  }
  else {
    id WeakRetained = 0;
  }
  id v3 = objc_msgSend(WeakRetained, "attachmentViews", (void)v7);

  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) didBeginModifyDrawing];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)didEndModifyDrawing
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);
  }
  else {
    id WeakRetained = 0;
  }
  id v3 = objc_msgSend(WeakRetained, "attachmentViews", (void)v7);

  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) didEndModifyDrawing];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (CGAffineTransform)transformFromStrokeSpaceToViewInDrawing:(SEL)a3
{
  id v9 = a4;
  if (self && (id WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView)) != 0)
  {
    long long v7 = WeakRetained;
    [WeakRetained transformFromStrokeSpaceToViewInDrawing:v9];
  }
  else
  {
    long long v7 = 0;
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tCGFloat x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (CGRect)attachmentBoundsForDrawing:(id)a3
{
  id v4 = a3;
  if (self) {
    self = (PKSelectionController *)objc_loadWeakRetained((id *)&self->_tiledView);
  }
  [(PKSelectionController *)self attachmentBoundsForDrawing:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (id)_firstStrokesInStrokes:(id)a3
{
  id v4 = a3;
  double v5 = -[PKSelectionController selectionInteraction]((id *)&self->super.isa);
  double v6 = [v5 _firstStrokesInStrokes:v4];

  return v6;
}

- (id)_lastStrokesInStrokes:(id)a3
{
  id v4 = a3;
  double v5 = -[PKSelectionController selectionInteraction]((id *)&self->super.isa);
  double v6 = [v5 _lastStrokesInStrokes:v4];

  return v6;
}

- (void)updateLiveSelectionForStrokesInLayer:(id)a3 inDrawing:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);
  }
  else {
    id WeakRetained = 0;
  }
  double v8 = [v6 uuid];
  double v9 = [WeakRetained _attachmentForUUID:v8];

  if (objc_opt_respondsToSelector()) {
    [v9 updateLiveSelectionForStrokesInLayer:v10 inDrawing:v6];
  }
}

- (double)_scrollViewDrawingFrame
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  id v2 = [WeakRetained scrollView];
  [v2 frame];

  return *MEMORY[0x1E4F1DAD8];
}

- (id)_visibleStrokesWithinExtendedBounds:(void *)a3 forDrawing:
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v70 = a3;
  if (a1)
  {
    id v6 = [MEMORY[0x1E4F1CA70] orderedSet];
    double v7 = -[PKSelectionController _scrollViewDrawingFrame](a1);
    CGFloat v68 = v8;
    CGFloat v69 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    id v13 = v70;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    double v15 = [v13 uuid];
    double v16 = [WeakRetained _attachmentForUUID:v15];

    double v17 = [v16 viewRep];
    CGFloat v18 = [v17 superview];
    id v19 = [v16 tileContainerView];
    [v19 bounds];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    id v28 = [v16 tileContainerView];
    objc_msgSend(v18, "convertRect:fromView:", v28, v21, v23, v25, v27);
    double v30 = v29;
    double v32 = v31;

    id v33 = objc_loadWeakRetained((id *)(a1 + 120));
    double v34 = [v33 scrollView];
    [v34 contentOffset];
    double v36 = v35;
    double v38 = v37;

    [v13 bounds];
    CGFloat v40 = v39;
    CGFloat v42 = v41;

    v78.origin.double y = v68;
    v78.origin.double x = v69;
    v78.size.CGFloat width = v10;
    v78.size.CGFloat height = v12;
    v82.origin.double x = v30 - v36;
    v82.origin.double y = v32 - v38;
    v82.size.CGFloat width = v40;
    v82.size.CGFloat height = v42;
    if (CGRectIntersectsRect(v78, v82))
    {
      id v43 = v13;
      v79.origin.double x = -[PKSelectionController _scrollViewDrawingFrame](a1);
      double x = v79.origin.x;
      double y = v79.origin.y;
      CGFloat width = v79.size.width;
      CGFloat height = v79.size.height;
      double MaxX = CGRectGetMaxX(v79);
      v80.origin.double x = x;
      v80.origin.double y = y;
      v80.size.CGFloat width = width;
      v80.size.CGFloat height = height;
      double MaxY = CGRectGetMaxY(v80);
      *(void *)&double v50 = [(PKSelectionController *)a1 _pointInStrokeSpace:x inDrawing:y - MaxY].n128_u64[0];
      double v52 = v51;
      *(void *)&double v53 = [(PKSelectionController *)a1 _pointInStrokeSpace:MaxX + 0.0 inDrawing:MaxY + MaxY].n128_u64[0];
      double v55 = v54;

      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v56 = v5;
      uint64_t v57 = [v56 countByEnumeratingWithState:&v71 objects:v75 count:16];
      if (v57)
      {
        double v58 = v53 - v50;
        double v59 = v55 - v52;
        uint64_t v60 = *(void *)v72;
        do
        {
          for (uint64_t i = 0; i != v57; ++i)
          {
            if (*(void *)v72 != v60) {
              objc_enumerationMutation(v56);
            }
            long long v62 = *(void **)(*((void *)&v71 + 1) + 8 * i);
            [v62 _bounds];
            v83.origin.double x = v63;
            v83.origin.double y = v64;
            v83.size.CGFloat width = v65;
            v83.size.CGFloat height = v66;
            v81.origin.double x = v50;
            v81.origin.double y = v52;
            v81.size.CGFloat width = v58;
            v81.size.CGFloat height = v59;
            if (CGRectIntersectsRect(v81, v83)) {
              [v6 addObject:v62];
            }
          }
          uint64_t v57 = [v56 countByEnumeratingWithState:&v71 objects:v75 count:16];
        }
        while (v57);
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)updateCurrentSelectionWithNewDrawingIfNecessary:(uint64_t)a1
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    +[PKSelectionGlowRenderer invalidateSharedStrokePathCache]();
    if (*(void *)(a1 + 128))
    {
      double v41 = (id *)a1;
      unsigned int v40 = [*(id *)(a1 + 152) isHidden];
      id v5 = (void *)MEMORY[0x1E4F1CAD0];
      id v6 = [v4 strokes];
      double v7 = [v5 setWithArray:v6];

      id v8 = v41[16];
      double v9 = [v8 strokes];
      CGFloat v42 = (void *)[v9 mutableCopy];

      CGFloat v10 = [v41[16] externalElements];
      uint64_t v11 = [v10 count];

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      CGFloat v12 = [v41[16] strokes];
      id v13 = (id)[v12 countByEnumeratingWithState:&v46 objects:v50 count:16];
      uint64_t v39 = v11;
      if (v13)
      {
        char v14 = 0;
        uint64_t v15 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v47 != v15) {
              objc_enumerationMutation(v12);
            }
            double v17 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            if ((objc_msgSend(v7, "containsObject:", v17, v39) & 1) == 0)
            {
              CGFloat v18 = [v17 _strokeUUID];
              id v2 = [v4 _strokeForIdentifier:v18];

              if (v2 && [v2 _visibleSubstrokeCountInDrawing:v4] >= 1)
              {
                v44[0] = MEMORY[0x1E4F143A8];
                v44[1] = 3221225472;
                v44[2] = __73__PKSelectionController_updateCurrentSelectionWithNewDrawingIfNecessary___block_invoke;
                v44[3] = &unk_1E64C85E8;
                id v45 = v42;
                [v2 _visitVisibleSubstrokes:v44 inDrawing:v4];
              }
              [v42 removeObject:v17];

              char v14 = 1;
            }
          }
          id v13 = (id)[v12 countByEnumeratingWithState:&v46 objects:v50 count:16];
        }
        while (v13);

        if (v14)
        {
          int v19 = 0;
          goto LABEL_21;
        }
      }
      else
      {
      }
      CGFloat v12 = objc_msgSend(v4, "uuid", v39);
      id v13 = v41[16];
      id v2 = [v13 drawing];
      double v17 = [v2 uuid];
      if ([v12 isEqual:v17])
      {

LABEL_23:
        if (v39)
        {
          -[PKSelectionController _refreshExternalElementsInStrokeSelection:](v41, v41[16]);
          id v22 = v41[16];
          id v23 = v41[16];
          double v24 = [v23 drawing];
          double v25 = -[PKSelectionController calculateFrameForSelectionView:inDrawing:]((uint64_t)v41, v22, v24);
          double v27 = v26;
          double v29 = v28;
          double v31 = v30;

          objc_msgSend(v41[19], "setFrame:", v25, v27, v29, v31);
LABEL_34:
          [v41[19] setHidden:v40];

          goto LABEL_35;
        }
        id v34 = [v4 uuid];
        id v35 = v41[16];
        double v36 = [v35 drawing];
        double v37 = [v36 uuid];
        if ([v34 isEqual:v37])
        {
          BOOL v38 = [v42 count] == 0;

          if (v38) {
            -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)v41, 0, 0);
          }
          goto LABEL_34;
        }

LABEL_33:
        goto LABEL_34;
      }
      int v19 = 1;
LABEL_21:
      uint64_t v20 = [v42 count];
      if (v19)
      {
        BOOL v21 = v20 == 0;

        if (v21) {
          goto LABEL_23;
        }
      }
      else if (!v20)
      {
        goto LABEL_23;
      }
      double v32 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v32, OS_LOG_TYPE_DEFAULT, "Updated selection based on a drawing change", buf, 2u);
      }

      uint64_t v33 = [v41[19] selectionType];
      id v34 = v41[16];
      id v35 = [v34 externalElements];
      -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:](v41, v42, v35, v33, v4);
      goto LABEL_33;
    }
  }
LABEL_35:
}

uint64_t __73__PKSelectionController_updateCurrentSelectionWithNewDrawingIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 hasSubstrokes] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return 1;
}

- (double)autoscrollForPointIfNecessary:(double)a3
{
  if (!a1) {
    return 0.0;
  }
  id v6 = (id *)(a1 + 120);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  id v8 = [WeakRetained scrollView];
  char v9 = [v8 isScrollEnabled];

  CGFloat v10 = (double *)MEMORY[0x1E4F1DAD8];
  double v12 = *MEMORY[0x1E4F1DAD8];
  double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v9)
  {
    id v13 = objc_loadWeakRetained(v6);
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    if (a3 <= v17 + v21 + -100.0)
    {
      if (a3 < v17 + 100.0)
      {
        double v11 = -10.0;
        double v12 = 0.0;
      }
    }
    else
    {
      double v12 = 0.0;
      double v11 = 10.0;
    }
    if (a2 <= v15 + v19 + -100.0)
    {
      double v22 = v12 + -10.0;
      double v23 = v11 + 0.0;
      if (a2 >= v15 + 100.0)
      {
        double v22 = v12;
        double v23 = v11;
      }
    }
    else
    {
      double v22 = v12 + 10.0;
      double v23 = v11 + 0.0;
    }
    double v12 = *v10;
    if (*v10 != v22 || v10[1] != v23) {
      return [(PKSelectionController *)a1 _scrollContent:v23];
    }
  }
  return v12;
}

- (double)_scrollContent:(double)a3
{
  if (!a1) {
    return 0.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  id v6 = [WeakRetained scrollView];

  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    [v6 contentOffset];
    double v8 = v7;
    double v10 = v9;
    [v6 _minimumContentOffset];
    double v12 = v11;
    double v14 = v13;
    [v6 _maximumContentOffset];
    double v17 = v16;
    double v18 = a2 + v8;
    double v19 = a3 + v10;
    if (a2 + v8 >= v12)
    {
      if (v18 > v17) {
        double v18 = v17;
      }
    }
    else
    {
      double v18 = v12;
    }
    if (v19 >= v14)
    {
      double v14 = a3 + v10;
      if (v19 > v15) {
        double v14 = v15;
      }
    }
    double v20 = v8 - v18;
    if (v8 - v18 != *MEMORY[0x1E4F1DAD8] || v10 - v14 != *(double *)(MEMORY[0x1E4F1DAD8] + 8)) {
      objc_msgSend(v6, "setContentOffset:animated:", 0);
    }
  }
  else
  {
    if (v6 && -[PKSelectionController _scrollContent:]::onceToken != -1) {
      dispatch_once(&-[PKSelectionController _scrollContent:]::onceToken, &__block_literal_global_43);
    }
    double v20 = *MEMORY[0x1E4F1DAD8];
  }

  return v20;
}

void __40__PKSelectionController__scrollContent___block_invoke()
{
  v0 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_fault_impl(&dword_1C44F8000, v0, OS_LOG_TYPE_FAULT, "UIScrollView IPI must have changed.", v1, 2u);
  }
}

- (void)_willBeginInsertSpaceInAttachment:(id *)a1
{
  id v10 = a2;
  if (a1)
  {
    id v3 = -[PKSelectionController selectionInteraction](a1);
    id v4 = [v3 delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = -[PKSelectionController selectionInteraction](a1);
      double v7 = [v6 delegate];
      double v8 = -[PKSelectionController selectionInteraction](a1);
      double v9 = [v10 attachmentView];
      [v7 selectionInteraction:v8 willBeginInsertSpaceInAttachment:v9];
    }
  }
}

- (void)_didMoveInsertSpace:(double)a3 inAttachment:
{
  id v12 = a2;
  if (a1)
  {
    char v5 = -[PKSelectionController selectionInteraction](a1);
    id v6 = [v5 delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      double v8 = -[PKSelectionController selectionInteraction](a1);
      double v9 = [v8 delegate];
      id v10 = -[PKSelectionController selectionInteraction](a1);
      double v11 = [v12 attachmentView];
      [v9 selectionInteraction:v10 insertSpaceDidMove:v11 inAttachment:a3];
    }
  }
}

- (void)_didEndInsertSpaceInAttachment:(id *)a1
{
  id v10 = a2;
  if (a1)
  {
    id v3 = -[PKSelectionController selectionInteraction](a1);
    id v4 = [v3 delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = -[PKSelectionController selectionInteraction](a1);
      char v7 = [v6 delegate];
      double v8 = -[PKSelectionController selectionInteraction](a1);
      double v9 = [v10 attachmentView];
      [v7 selectionInteraction:v8 didEndInsertSpaceInAttachment:v9];
    }
  }
}

- (uint64_t)_hasStrokesOrExternalElementsSelectedInAttachment:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(id *)(a1 + 128);
    if (v4) {
      a1 = 1;
    }
    else {
      a1 = -[PKSelectionController _hasExternalElementsSelectedInAttachment:](a1, v3);
    }
  }
  return a1;
}

- (id)_externalElementsAtLocation:(double)a3 inAttachment:(double)a4
{
  id v7 = a2;
  double v8 = v7;
  if (a1)
  {
    double v9 = [v7 attachmentView];
    -[PKSelectionController _externalElementsInRect:inAttachment:](a1, v9, a3, a4, 1.0, 1.0);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (id)_externalElementsInRect:(double)a3 inAttachment:(double)a4
{
  id v11 = a2;
  if (a1)
  {
    id v12 = -[PKSelectionController selectionInteraction](a1);
    double v13 = [v12 delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      double v15 = -[PKSelectionController selectionInteraction](a1);
      double v16 = [v15 delegate];
      double v17 = -[PKSelectionController selectionInteraction](a1);
      double v18 = [v11 attachmentView];
      double v19 = objc_msgSend(v16, "selectionInteraction:requestElementsInRect:inAttachment:", v17, v18, a3, a4, a5, a6);

      -[PKSelectionController _externalElementsForIDs:inAttachment:](a1, v19, v11);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_IDsFromExternalElements:(void *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    a1 = [MEMORY[0x1E4F1CA48] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          double v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "identifier", (void)v10);
          [a1 addObject:v8];
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }

  return a1;
}

- (void)_didTapElement:(void *)a3 withGesture:(void *)a4 inAttachment:
{
  id v17 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    double v9 = -[PKSelectionController selectionInteraction](a1);
    long long v10 = [v9 delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      long long v12 = -[PKSelectionController selectionInteraction](a1);
      long long v13 = [v12 delegate];
      char v14 = -[PKSelectionController selectionInteraction](a1);
      uint64_t v15 = [v17 identifier];
      double v16 = [v8 attachmentView];
      [v13 selectionInteraction:v14 didTapElement:v15 withGesture:v7 inAttachment:v16];
    }
  }
}

- (id)_didLongPressElement:(void *)a3 withGesture:(void *)a4 inAttachment:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    long long v10 = -[PKSelectionController selectionInteraction](a1);
    char v11 = [v10 delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      long long v13 = -[PKSelectionController selectionInteraction](a1);
      char v14 = [v13 delegate];
      uint64_t v15 = -[PKSelectionController selectionInteraction](a1);
      double v16 = [v7 identifier];
      id v17 = [v9 attachmentView];
      a1 = (id *)[v14 selectionInteraction:v15 didLongPressElement:v16 withGesture:v8 inAttachment:v17];
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_selectedExternalElementsContainsPoint:(double)a3 inAttachment:(double)a4
{
  id v7 = a2;
  if (a1)
  {
    id v8 = -[PKSelectionController selectionInteraction](a1);
    id v9 = [v8 delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      char v11 = -[PKSelectionController selectionInteraction](a1);
      char v12 = [v11 delegate];
      long long v13 = -[PKSelectionController selectionInteraction](a1);
      char v14 = [v7 attachmentView];
      a1 = (id *)objc_msgSend(v12, "selectionInteraction:selectionContainsPoint:inAttachment:", v13, v14, a3, a4);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (uint64_t)_selectionInteractionCanPerformAction:(void *)a3 withSender:(void *)a4 inAttachment:
{
  id v7 = a3;
  id v8 = a4;
  if (a1
    && (-[PKSelectionController selectionInteraction](a1),
        id v9 = objc_claimAutoreleasedReturnValue(),
        [v9 delegate],
        char v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    char v12 = -[PKSelectionController selectionInteraction](a1);
    long long v13 = [v12 delegate];
    char v14 = -[PKSelectionController selectionInteraction](a1);
    uint64_t v15 = [v8 attachmentView];
    uint64_t v16 = [v13 selectionInteraction:v14 canPerformAction:a2 withSender:v7 inAttachment:v15];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)_itemProviderForExternalElements:(void *)a3 inAttachment:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    id v8 = [v6 attachmentView];
    id v9 = -[PKSelectionController _pasteboardRepresentationsForExternalElements:inAttachment:](a1, v5, v8);

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v10);
          }
          char v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(v14, "valueForKey:", @"com.apple.paper", (void)v22);
          BOOL v16 = v15 == 0;

          if (!v16)
          {
            double v18 = (void *)MEMORY[0x1E4F1CB10];
            double v19 = [v14 valueForKey:@"com.apple.paper"];
            double v20 = [v18 URLWithDataRepresentation:v19 relativeToURL:0];

            id v17 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v20];
            goto LABEL_12;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    id v17 = 0;
LABEL_12:
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)_dragInteractionWillBeginForExternalElements:(void *)a3 inAttachment:
{
  id v14 = a2;
  id v5 = a3;
  if (a1)
  {
    id v6 = -[PKSelectionController selectionInteraction](a1);
    id v7 = [v6 delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = -[PKSelectionController _IDsFromExternalElements:](a1, v14);
      id v10 = -[PKSelectionController selectionInteraction](a1);
      uint64_t v11 = [v10 delegate];
      uint64_t v12 = -[PKSelectionController selectionInteraction](a1);
      long long v13 = [v5 attachmentView];
      [v11 selectionInteraction:v12 dragInteractionWillBeginForElements:v9 inAttachment:v13];
    }
  }
}

- (void)_dragInteractionWillEndForExternalElements:(uint64_t)a3 withOperation:(void *)a4 inAttachment:
{
  id v16 = a2;
  id v7 = a4;
  if (a1)
  {
    char v8 = -[PKSelectionController selectionInteraction](a1);
    id v9 = [v8 delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = -[PKSelectionController _IDsFromExternalElements:](a1, v16);
      uint64_t v12 = -[PKSelectionController selectionInteraction](a1);
      long long v13 = [v12 delegate];
      id v14 = -[PKSelectionController selectionInteraction](a1);
      uint64_t v15 = [v7 attachmentView];
      [v13 selectionInteraction:v14 dragInteractionWillEndForElements:v11 withOperation:a3 inAttachment:v15];
    }
  }
}

- (uint64_t)_externalElements:(void *)a3 locationOutOfBounds:(double)a4 inAttachment:(double)a5
{
  id v9 = a2;
  id v10 = a3;
  if (a1)
  {
    if ([v9 count])
    {
      id v11 = *(id *)(a1 + 152);
      if (v11)
      {
        [*(id *)(a1 + 152) bounds];
        double v13 = v12;
        double v15 = v14;
      }
      else
      {
        double v13 = 120.0;
        double v15 = 120.0;
      }

      -[PKSelectionController _drawingForSelectionRect:](a1, a4, a5, v13, v15);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        id v19 = 0;
        -[PKSelectionController closestPointForPastedSelectionRect:withDrawing:](a1, &v19, a4, a5, v13, v15);
        id v16 = v19;
      }
      id v17 = [v10 drawing];
      a1 = v16 != v17;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)_resetExternalElements:(void *)a3 inAttachment:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v8.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v8.c = v7;
    *(_OWORD *)&v8.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransformTranslate(&v9, &v8, 0.0, 0.0);
    -[PKSelectionController _didDragExternalElements:withTransform:inAttachment:](a1, v5, &v9, v6);
    -[PKSelectionController _didEndDraggingExternalElements:inAttachment:](a1, v5, v6);
  }
}

- (void)_didResizeExternalElements
{
  if (a1)
  {
    id v2 = [a1[16] externalElements];
    uint64_t v3 = [v2 count];

    if (v3)
    {
      -[PKSelectionController _refreshExternalElementsInStrokeSelection:](a1, a1[16]);
      id v4 = a1[16];
      id v5 = a1[16];
      id v6 = [v5 drawing];
      objc_msgSend(a1[19], "setFrame:", -[PKSelectionController calculateFrameForSelectionView:inDrawing:]((uint64_t)a1, v4, v6));

      id v7 = a1[16];
      -[PKSelectionController setImageOnSelectionViewForStrokeSelection:withCompletion:](a1, v7, 0);
    }
  }
}

- (id)_contextMenuInteraction:(void *)a3 configurationForExternalElement:(void *)a4 inAttachment:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = -[PKSelectionController selectionInteraction](a1);
    id v11 = [v10 delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      double v13 = -[PKSelectionController selectionInteraction](a1);
      double v14 = [v13 delegate];
      double v15 = -[PKSelectionController selectionInteraction](a1);
      id v16 = [v9 attachmentView];
      a1 = [v14 selectionInteraction:v15 contextMenuInteraction:v7 configurationForElement:v8 inAttachment:v16];
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_contextMenuInteraction:(void *)a3 previewForHighlightingMenuWithConfiguration:(void *)a4 forExternalElement:(void *)a5 inAttachment:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    double v13 = -[PKSelectionController selectionInteraction](a1);
    double v14 = [v13 delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v16 = -[PKSelectionController selectionInteraction](a1);
      id v17 = [v16 delegate];
      double v18 = -[PKSelectionController selectionInteraction](a1);
      id v19 = [v12 attachmentView];
      a1 = [v17 selectionInteraction:v18 contextMenuInteraction:v9 previewForHighlightingMenuWithConfiguration:v10 forElement:v11 inAttachment:v19];
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)_contextMenuInteraction:(void *)a3 willDisplayMenuForConfiguration:(void *)a4 animator:(void *)a5 forExternalElement:(void *)a6 inAttachment:
{
  id v22 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (a1)
  {
    char v15 = -[PKSelectionController selectionInteraction](a1);
    id v16 = [v15 delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      double v18 = -[PKSelectionController selectionInteraction](a1);
      id v19 = [v18 delegate];
      double v20 = -[PKSelectionController selectionInteraction](a1);
      double v21 = [v14 attachmentView];
      [v19 selectionInteraction:v20 contextMenuInteraction:v22 willDisplayMenuForConfiguration:v11 animator:v12 forElement:v13 inAttachment:v21];
    }
  }
}

- (void)_contextMenuInteraction:(void *)a3 willEndForConfiguration:(void *)a4 animator:(void *)a5 forExternalElement:(void *)a6 inAttachment:
{
  id v22 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (a1)
  {
    char v15 = -[PKSelectionController selectionInteraction](a1);
    id v16 = [v15 delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      double v18 = -[PKSelectionController selectionInteraction](a1);
      id v19 = [v18 delegate];
      double v20 = -[PKSelectionController selectionInteraction](a1);
      double v21 = [v14 attachmentView];
      [v19 selectionInteraction:v20 contextMenuInteraction:v22 willEndForConfiguration:v11 animator:v12 forElement:v13 inAttachment:v21];
    }
  }
}

- (uint64_t)_isValidDropPointForStrokes:(double)a3 didInsertNewAttachment:(double)a4
{
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  uint64_t v8 = objc_msgSend(WeakRetained, "_isValidDropPointForStrokes:didInsertNewAttachment:", a2, a3, a4);

  return v8;
}

- (uint64_t)_liveDrawingIsAtEndOfDocument
{
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  id v2 = [WeakRetained liveAttachment];
  uint64_t v3 = [v2 isAtEndOfDocument];

  return v3;
}

- (id)_attachmentForSelectionRect:(double)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v5 = (id *)(a1 + 120);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    id v7 = [WeakRetained attachments];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v9 = objc_loadWeakRetained(v5);
      id v10 = [v9 _visibleAttachments];

      uint64_t v11 = [v10 countByEnumeratingWithState:&v55 objects:v61 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v56;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v56 != v12) {
              objc_enumerationMutation(v10);
            }
            if ([*(id *)(*((void *)&v55 + 1) + 8 * i) isExternalAttachment])
            {
              int v14 = 1;
              goto LABEL_13;
            }
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v55 objects:v61 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
      int v14 = 0;
LABEL_13:

      long long v53 = 0u;
      long long v54 = 0u;
      memset(&rect[1], 0, 32);
      id v15 = objc_loadWeakRetained(v5);
      id v16 = [v15 _visibleAttachments];

      uint64_t v17 = [v16 countByEnumeratingWithState:&rect[1] objects:v60 count:16];
      if (v17)
      {
        double v18 = 0;
        uint64_t v19 = *(void *)rect[3];
        double v47 = 0.0;
        while (2)
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)rect[3] != v19) {
              objc_enumerationMutation(v16);
            }
            double v21 = *(void **)(rect[2] + 8 * j);
            id v22 = objc_msgSend(v21, "viewRep", *(void *)&v47);
            [v22 bounds];
            rect[0] = v23;
            double v25 = v24;
            CGFloat v27 = v26;
            CGFloat v29 = v28;

            double v30 = [v21 viewRep];
            id v31 = objc_loadWeakRetained(v5);
            objc_msgSend(v30, "convertRect:fromView:", v31, a2, a3, a4, a5);
            CGFloat v33 = v32;
            double v35 = v34;
            CGFloat v37 = v36;
            CGFloat v39 = v38;

            char v40 = [v21 isAtEndOfDocument];
            if (v35 > v25) {
              char v41 = v40;
            }
            else {
              char v41 = 0;
            }
            if (v41)
            {
LABEL_30:
              id v45 = v21;

              double v18 = v45;
              goto LABEL_34;
            }
            if (v14)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                continue;
              }
            }
            v65.origin.double x = v33;
            v65.origin.double y = v35;
            v65.size.CGFloat width = v37;
            v65.size.CGFloat height = v39;
            CGFloat MidX = CGRectGetMidX(v65);
            v66.origin.double x = v33;
            v66.origin.double y = v35;
            v66.size.CGFloat width = v37;
            v66.size.CGFloat height = v39;
            v64.double y = CGRectGetMidY(v66);
            *(void *)&v67.origin.double x = rect[0];
            v67.origin.double y = v25;
            v67.size.CGFloat width = v27;
            v67.size.CGFloat height = v29;
            v64.double x = MidX;
            if (CGRectContainsPoint(v67, v64)) {
              goto LABEL_30;
            }
            *(void *)&v68.origin.double x = rect[0];
            v68.origin.double y = v25;
            v68.size.CGFloat width = v27;
            v68.size.CGFloat height = v29;
            v70.origin.double x = v33;
            v70.origin.double y = v35;
            v70.size.CGFloat width = v37;
            v70.size.CGFloat height = v39;
            CGRect v69 = CGRectIntersection(v68, v70);
            double v43 = v69.size.width * v69.size.height;
            if (v69.size.width * v69.size.height > v47)
            {
              id v44 = v21;

              double v47 = v43;
              double v18 = v44;
            }
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&rect[1] objects:v60 count:16];
          if (v17) {
            continue;
          }
          goto LABEL_34;
        }
      }
    }
    else
    {
      id v16 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_DEBUG, "Tiled view has no attachments", buf, 2u);
      }
    }
    double v18 = 0;
LABEL_34:

    goto LABEL_35;
  }
  double v18 = 0;
LABEL_35:

  return v18;
}

- (double)_selectionOffsetForDrawing:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = (id *)(a1 + 120);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    id v6 = [v3 uuid];
    id v7 = [WeakRetained _attachmentForUUID:v6];

    uint64_t v8 = [v7 attachmentContainerView];
    id v9 = [v8 superview];
    id v10 = [v7 tileContainerView];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    uint64_t v19 = [v7 tileContainerView];
    objc_msgSend(v9, "convertRect:fromView:", v19, v12, v14, v16, v18);
    double v21 = v20;

    id v22 = objc_loadWeakRetained(v4);
    [v22 canvasZoomScale];
    double v24 = v23;

    id v25 = objc_loadWeakRetained(v4);
    double v26 = [v25 scrollView];
    [v26 contentOffset];
    double v28 = v21 * v24 - v27;
  }
  else
  {
    double v28 = 0.0;
  }

  return v28;
}

- (void)_didAddDrawingAttachmentView
{
  if (result)
  {
    CGRect result = (void *)result[19];
    if (result) {
      return (void *)[result _didAddNewAttachment];
    }
  }
  return result;
}

- (void)copyTranscription:(uint64_t)a1
{
  if (a1)
  {
    id v2 = +[PKSelectionStatisticsManager sharedStatisticsManager];
    [v2 logSelectionAction:7];

    id v3 = *(id *)(a1 + 152);
    if ([v3 selectionType]) {
      BOOL v4 = [*(id *)(a1 + 152) selectionType] != 6;
    }
    else {
      BOOL v4 = 0;
    }

    id v5 = [MEMORY[0x1E4F1C9C8] date];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__PKSelectionController_copyTranscription___block_invoke;
    _OWORD v7[3] = &unk_1E64C8610;
    v7[4] = a1;
    id v8 = v5;
    BOOL v9 = v4;
    id v6 = v5;
    -[PKSelectionController findTranscriptionWithCompletion:](a1, v7);
  }
}

void __43__PKSelectionController_copyTranscription___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 transcription];
  BOOL v4 = [v3 dataUsingEncoding:4];

  -[PKSelectionController addTranscriptionToPasteboard:](*(void **)(a1 + 32), v4);
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  id v5 = +[PKStatisticsManager sharedStatisticsManager]();
  id v6 = [v7 transcription];
  -[PKStatisticsManager recordCopyAsTextWithLength:time:didShowHUD:invokedFromSmartSelection:]((uint64_t)v5, [v6 length], objc_msgSend(v7, "didShowHUD"), *(unsigned __int8 *)(a1 + 48));
}

- (void)addTranscriptionToPasteboard:(void *)a1
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    BOOL v4 = -[PKSelectionController currentPasteboard](a1);
    id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    if (v3)
    {
      id v6 = [(id)*MEMORY[0x1E4F44510] identifier];
      [v5 setObject:v3 forKeyedSubscript:v6];
    }
    if ([v5 count])
    {
      v8[0] = v5;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
      [v4 setItems:v7];
    }
  }
}

- (void)findTranscriptionWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  if (a1) {
    -[PKSelectionController findTranscriptionForType:withCompletion:](a1, 0, v3);
  }
}

- (void)findTranscriptionForType:(void *)a3 withCompletion:
{
  id v16 = a3;
  if (a1)
  {
    id v5 = -[PKSelectionController _currentAttachment]((id *)a1);
    id v6 = *(void **)(a1 + 48);
    if (v6)
    {
      id v7 = [v6 attachment];
      if (v7 == v5)
      {
        id v8 = [*(id *)(a1 + 48) strokeSelection];
        BOOL v9 = *(void **)(a1 + 128);

        if (v8 == v9)
        {
LABEL_9:
          [*(id *)(a1 + 48) findTranscriptionForType:a2 withCompletion:v16];

          goto LABEL_10;
        }
      }
      else
      {
      }
    }
    uint64_t v10 = [v5 recognitionController];
    double v11 = (void *)v10;
    if (v10) {
      double v12 = *(void **)(v10 + 48);
    }
    else {
      double v12 = 0;
    }
    id v13 = v12;

    double v14 = [[PKTranscriptionController alloc] initWithRecognitionManager:v13 strokeSelection:*(void *)(a1 + 128) attachment:v5];
    double v15 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v14;

    goto LABEL_9;
  }
LABEL_10:
}

- (uint64_t)supportsCopyAsText
{
  uint64_t v1 = a1;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    int v3 = [WeakRetained supportsCopyAsText];

    if (v3)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      BOOL v4 = +[PKRecognitionSessionManager enabledLocales];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v16 != v6) {
              objc_enumerationMutation(v4);
            }
            if ([MEMORY[0x1E4F5C070] isLocaleSupported:*(void *)(*((void *)&v15 + 1) + 8 * i) withMode:6])
            {

              long long v13 = 0u;
              long long v14 = 0u;
              long long v11 = 0u;
              long long v12 = 0u;
              BOOL v4 = objc_msgSend(*(id *)(v1 + 128), "strokes", 0);
              uint64_t v1 = [v4 countByEnumeratingWithState:&v11 objects:v19 count:16];
              if (v1)
              {
                uint64_t v8 = *(void *)v12;
                while (2)
                {
                  for (uint64_t j = 0; j != v1; ++j)
                  {
                    if (*(void *)v12 != v8) {
                      objc_enumerationMutation(v4);
                    }
                    if (![*(id *)(*((void *)&v11 + 1) + 8 * j) _shapeType])
                    {
                      uint64_t v1 = 1;
                      goto LABEL_23;
                    }
                  }
                  uint64_t v1 = [v4 countByEnumeratingWithState:&v11 objects:v19 count:16];
                  if (v1) {
                    continue;
                  }
                  break;
                }
              }
              goto LABEL_23;
            }
          }
          uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }
      uint64_t v1 = 0;
LABEL_23:
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (void)supportsRefinement:(id *)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    BOOL v4 = [a1[16] strokes];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      char v6 = 0;
      uint64_t v7 = *(void *)v21;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        char v10 = [v9 _isSynthesizedInk];
        if (([v9 _flags] & 0x20000000000) != 0) {
          break;
        }
        v6 |= v10 ^ 1;
        if (v5 == ++v8)
        {
          uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v5) {
            goto LABEL_4;
          }

          if (v6)
          {
            v18[0] = 0;
            v18[1] = v18;
            v18[2] = 0x3032000000;
            v18[3] = __Block_byref_object_copy__15;
            void v18[4] = __Block_byref_object_dispose__15;
            long long v11 = -[PKSelectionController _currentAttachment](a1);
            uint64_t v12 = [v11 recognitionController];
            long long v13 = (void *)v12;
            if (v12) {
              long long v14 = *(void **)(v12 + 48);
            }
            else {
              long long v14 = 0;
            }
            id v19 = v14;

            v15[0] = MEMORY[0x1E4F143A8];
            v15[1] = 3221225472;
            v15[2] = __44__PKSelectionController_supportsRefinement___block_invoke;
            _OWORD v15[3] = &unk_1E64C8638;
            long long v17 = v18;
            id v16 = v3;
            -[PKSelectionController findTranscriptionForType:withCompletion:]((uint64_t)a1, 2, v15);

            _Block_object_dispose(v18, 8);
            goto LABEL_17;
          }
          goto LABEL_15;
        }
      }
    }

LABEL_15:
    if (v3) {
      (*((void (**)(id, void))v3 + 2))(v3, 0);
    }
  }
LABEL_17:
}

void __44__PKSelectionController_supportsRefinement___block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 transcription];
  BOOL v3 = -[PKRecognitionSessionManager canSynthesizeDrawingForText:](*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v3);
  }
}

- (uint64_t)refinementEnabled
{
  if (!a1 || !_os_feature_enabled_impl() || CHGetPersonalizedSynthesisSupportState() < 3) {
    return 0;
  }

  return PKCurrentAppSupportsRefinement();
}

- (void)getAllHandwritingTranscription:(uint64_t)a1
{
  if (a1)
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __56__PKSelectionController_getAllHandwritingTranscription___block_invoke;
    v1[3] = &unk_1E64C8660;
    v1[4] = a1;
    -[PKSelectionController findCompleteTranscriptionForNote:](a1, v1);
  }
}

void __56__PKSelectionController_getAllHandwritingTranscription___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 transcription];
  id v4 = [v3 dataUsingEncoding:4];

  -[PKSelectionController addTranscriptionToPasteboard:](*(void **)(a1 + 32), v4);
}

- (void)findCompleteTranscriptionForNote:(uint64_t)a1
{
  id v13 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    id v4 = [WeakRetained visibleAttachments];
    id v5 = [v4 firstObject];

    char v6 = *(void **)(a1 + 48);
    if (v6)
    {
      uint64_t v7 = [v6 attachment];
      if (v7 == v5)
      {
        uint64_t v8 = [*(id *)(a1 + 48) strokeSelection];

        if (!v8)
        {
LABEL_7:
          [*(id *)(a1 + 48) findCompleteTranscriptionForNote:v13];

          goto LABEL_8;
        }
      }
      else
      {
      }
    }
    BOOL v9 = [PKTranscriptionController alloc];
    char v10 = [v5 recognitionManager];
    uint64_t v11 = [(PKTranscriptionController *)v9 initWithRecognitionManager:v10 strokeSelection:0 attachment:v5];
    uint64_t v12 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v11;

    goto LABEL_7;
  }
LABEL_8:
}

- (void)translate:(uint64_t)a1
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 128);
    BOOL v3 = [v2 drawing];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    id v5 = [v3 uuid];
    char v6 = [WeakRetained _attachmentForUUID:v5];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __35__PKSelectionController_translate___block_invoke;
    v8[3] = &unk_1E64C8688;
    id v9 = v6;
    uint64_t v10 = a1;
    id v7 = v6;
    -[PKSelectionController findTranscriptionForType:withCompletion:](a1, 1, v8);
  }
}

void __35__PKSelectionController_translate___block_invoke(uint64_t a1, void *a2)
{
  id v12 = [a2 transcription];
  BOOL v3 = (void *)[objc_alloc((Class)getLTUITranslationViewControllerClass()) initWithNibName:0 bundle:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v12];
  [v3 setText:v4];

  [v3 setModalPresentationStyle:7];
  if ([*(id *)(a1 + 32) isExternalAttachment])
  {
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 32) translationDidFinishedInViewController:v3];
    }
  }
  else
  {
    id v5 = *(void **)(a1 + 40);
    if (v5) {
      id v5 = (void *)v5[19];
    }
    char v6 = v5;
    id v7 = [v3 popoverPresentationController];
    [v7 setSourceView:v6];

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      id v9 = *(void **)(v8 + 152);
    }
    else {
      id v9 = 0;
    }
    uint64_t v10 = [v9 window];
    uint64_t v11 = [v10 rootViewController];
    [v11 presentViewController:v3 animated:1 completion:0];
  }
}

- (void)straighten:(uint64_t)a1
{
  id v7 = a2;
  if (a1)
  {
    BOOL v3 = [*(id *)(a1 + 128) drawing];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    id v5 = [*(id *)(a1 + 128) strokes];
    char v6 = [v5 array];
    [WeakRetained straighten:v7 strokes:v6 drawing:v3];
  }
}

- (void)refine:(uint64_t)a1
{
  id v7 = a2;
  if (a1)
  {
    BOOL v3 = [*(id *)(a1 + 128) drawing];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    id v5 = [*(id *)(a1 + 128) strokes];
    char v6 = [v5 array];
    [WeakRetained refine:v7 strokes:v6 drawing:v3];
  }
}

- (void)_share:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && *(void *)(a1 + 152))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __32__PKSelectionController__share___block_invoke;
    aBlock[3] = &unk_1E64C5368;
    aBlock[4] = a1;
    id v4 = (void (**)(void))_Block_copy(aBlock);
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v4[2](v4);
    }
    else {
      dispatch_sync(MEMORY[0x1E4F14428], v4);
    }
  }
}

void __32__PKSelectionController__share___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F42718]);
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    id v3 = (void *)v3[16];
  }
  id v4 = v3;
  id v5 = [v4 strokeImage];
  char v6 = [v5 combinedImage];
  v16[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  uint64_t v8 = (void *)[v2 initWithActivityItems:v7 applicationActivities:0];

  id v9 = *(void **)(a1 + 32);
  if (v9) {
    id v9 = (void *)v9[19];
  }
  uint64_t v10 = v9;
  uint64_t v11 = [v8 popoverPresentationController];
  [v11 setSourceView:v10];

  [v8 setModalTransitionStyle:0];
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    id v13 = *(void **)(v12 + 152);
  }
  else {
    id v13 = 0;
  }
  long long v14 = [v13 window];
  long long v15 = [v14 rootViewController];
  [v15 presentViewController:v8 animated:1 completion:0];
}

- (id)editMenuActionsForConfiguration:(uint64_t)a1
{
  v79[4] = *MEMORY[0x1E4F143B8];
  id v55 = a2;
  if (a1)
  {
    id v3 = _PencilKitBundle();
    id v4 = [v3 localizedStringForKey:@"Cut" value:@"Cut" table:@"Localizable"];
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_2;
    v77[3] = &unk_1E64C5E20;
    v77[4] = a1;
    id v5 = v55;
    id v78 = v5;
    long long v54 = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke((uint64_t)v5, v4, @"scissors", v77);

    char v6 = _PencilKitBundle();
    id v7 = [v6 localizedStringForKey:@"Copy" value:@"Copy" table:@"Localizable"];
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_3;
    v75[3] = &unk_1E64C5E20;
    v75[4] = a1;
    id v8 = v5;
    id v76 = v8;
    long long v53 = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke((uint64_t)v8, v7, @"doc.on.doc", v75);

    id v9 = _PencilKitBundle();
    uint64_t v10 = [v9 localizedStringForKey:@"Delete" value:@"Delete" table:@"Localizable"];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_4;
    v73[3] = &unk_1E64C5E20;
    v73[4] = a1;
    id v11 = v8;
    id v74 = v11;
    double v52 = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke((uint64_t)v11, v10, @"trash", v73);

    uint64_t v12 = _PencilKitBundle();
    id v13 = [v12 localizedStringForKey:@"Add to Playground" value:@"Add to Playground" table:@"Localizable"];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_5;
    v71[3] = &unk_1E64C5E20;
    v71[4] = a1;
    id v14 = v11;
    id v72 = v14;
    long long v49 = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke((uint64_t)v14, v13, 0, v71);

    long long v15 = _PencilKitBundle();
    id v16 = [v15 localizedStringForKey:@"Duplicate" value:@"Duplicate" table:@"Localizable"];
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    void v69[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_6;
    v69[3] = &unk_1E64C5E20;
    v69[4] = a1;
    id v17 = v14;
    id v70 = v17;
    uint64_t v51 = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke((uint64_t)v17, v16, @"doc.on.doc", v69);

    long long v18 = _PencilKitBundle();
    id v19 = [v18 localizedStringForKey:@"Copy as Text" value:@"Copy as Text" table:@"Localizable"];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_7;
    v67[3] = &unk_1E64C5E20;
    v67[4] = a1;
    id v20 = v17;
    id v68 = v20;
    long long v48 = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke((uint64_t)v20, v19, @"textformat", v67);

    long long v21 = _PencilKitBundle();
    long long v22 = [v21 localizedStringForKey:@"Insert Space Above" value:@"Insert Space Above" table:@"Localizable"];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_8;
    v65[3] = &unk_1E64C5E20;
    v65[4] = a1;
    id v23 = v20;
    id v66 = v23;
    double v50 = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke((uint64_t)v23, v22, @"rectangle.expand.vertical", v65);

    double v24 = _PencilKitBundle();
    uint64_t v25 = [v24 localizedStringForKey:@"Translate" value:@"Translate" table:@"Localizable"];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_9;
    v63[3] = &unk_1E64C5E20;
    v63[4] = a1;
    id v26 = v23;
    id v64 = v26;
    uint64_t v46 = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke((uint64_t)v26, v25, @"character.bubble", v63);

    double v27 = _PencilKitBundle();
    double v28 = [v27 localizedStringForKey:@"Straighten" value:@"Straighten" table:@"Localizable"];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_10;
    v61[3] = &unk_1E64C5E20;
    v61[4] = a1;
    id v29 = v26;
    id v62 = v29;
    double v30 = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke((uint64_t)v29, v28, @"wrench", v61);

    objc_initWeak(&location, (id)a1);
    id v31 = (void *)MEMORY[0x1E4FB16B8];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_11;
    v56[3] = &unk_1E64C86F8;
    objc_copyWeak(&v59, &location);
    id v58 = &__block_literal_global_164;
    v56[4] = a1;
    id v57 = v29;
    double v32 = [v31 elementWithUncachedProvider:v56];
    int v33 = -[PKSelectionController supportsCopyAsText](a1);
    int v34 = [getLTUITranslationViewControllerClass() isAvailable];
    double v35 = [*(id *)(a1 + 128) externalElements];
    uint64_t v36 = [v35 count];

    CGFloat v37 = [*(id *)(a1 + 128) strokes];
    uint64_t v38 = [v37 count];

    CGFloat v39 = (void *)MEMORY[0x1E4F1CA48];
    v79[0] = v54;
    v79[1] = v53;
    v79[2] = v52;
    v79[3] = v51;
    char v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:4];
    char v41 = [v39 arrayWithArray:v40];

    int v42 = [*(id *)(a1 + 104) shouldShowImageGenerationUI];
    if (v38) {
      int v43 = v42;
    }
    else {
      int v43 = 0;
    }
    if (v43 == 1) {
      [v41 addObject:v49];
    }
    id v44 = objc_msgSend(*(id *)(a1 + 152), "shapeMenuActions", v46);
    [v41 addObjectsFromArray:v44];

    if (-[PKSelectionController refinementEnabled](a1)) {
      [v41 addObject:v32];
    }
    if (v33 && !v36) {
      [v41 addObject:v48];
    }
    if (*(unsigned char *)(a1 + 114)) {
      [v41 addObject:v50];
    }
    if ((v33 & v34) == 1 && !v36) {
      [v41 addObject:v47];
    }
    if (v33) {
      [v41 addObject:v30];
    }

    objc_destroyWeak(&v59);
    objc_destroyWeak(&location);
  }
  else
  {
    char v41 = 0;
  }

  return v41;
}

id __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4FB13F0];
  id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:a3];
  uint64_t v10 = [v8 actionWithTitle:v6 image:v9 identifier:0 handler:v7];

  return v10;
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_2(uint64_t a1)
{
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_3(uint64_t a1)
{
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_4(uint64_t a1)
{
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(id **)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    id v3 = +[PKGenerationModelAvailabilityController sharedInstance];
    id v4 = [v1[19] window];
    char v5 = [v3 presentGreymatterAvailabilityAlertControllerInWindow:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = objc_initWeak(&location, v1);
      id v7 = -[PKSelectionController selectionInteraction](v1);
      id v8 = [v7 delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id WeakRetained = objc_loadWeakRetained(v1 + 15);
        id v38 = v2;
        id v11 = [v1[16] drawing];
        uint64_t v12 = [v11 uuid];
        id v13 = [WeakRetained _attachmentForUUID:v12];

        CGFloat v37 = (id *)objc_loadWeakRetained(&location);
        uint64_t v36 = -[PKSelectionController selectionInteraction](v37);
        id v14 = [v36 delegate];
        double v35 = (id *)objc_loadWeakRetained(&location);
        long long v15 = -[PKSelectionController selectionInteraction](v35);
        id v16 = objc_loadWeakRetained(&location);
        id v17 = v16;
        if (v16) {
          long long v18 = (void *)*((void *)v16 + 16);
        }
        else {
          long long v18 = 0;
        }
        id v19 = v18;
        id v20 = [v19 strokes];
        long long v21 = [v20 array];
        id v22 = objc_loadWeakRetained(&location);
        id v23 = v22;
        if (v22) {
          double v24 = (void *)*((void *)v22 + 19);
        }
        else {
          double v24 = 0;
        }
        id v25 = v24;
        [v25 frame];
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;
        int v34 = [v13 attachmentView];
        objc_msgSend(v14, "selectionInteraction:handleGenerationToolForSelectedStrokes:inBounds:inAttachment:", v15, v21, v34, v27, v29, v31, v33);

        id v2 = v38;
      }
      objc_destroyWeak(&location);
    }
  }
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_6(uint64_t a1)
{
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_7(uint64_t a1)
{
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_8(uint64_t a1)
{
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_9(uint64_t a1)
{
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_10(uint64_t a1)
{
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_12;
  _OWORD v9[3] = &unk_1E64C86D0;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v11 = v5;
  v9[4] = v6;
  id v10 = v7;
  id v12 = v3;
  id v8 = v3;
  -[PKSelectionController supportsRefinement:](WeakRetained, v9);
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_12(void *a1, int a2)
{
  id v4 = objc_opt_new();
  if (a2)
  {
    uint64_t v5 = a1[6];
    uint64_t v6 = _PencilKitBundle();
    id v7 = [v6 localizedStringForKey:@"Refine" value:@"Refine" table:@"Localizable"];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_13;
    long long v15 = &unk_1E64C5E20;
    id v8 = (void *)a1[5];
    uint64_t v16 = a1[4];
    id v17 = v8;
    char v9 = (*(void (**)(uint64_t, void *, __CFString *, uint64_t *))(v5 + 16))(v5, v7, @"wrench", &v12);
    objc_msgSend(v4, "addObject:", v9, v12, v13, v14, v15, v16);
  }
  uint64_t v10 = a1[7];
  id v11 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_13(uint64_t a1)
{
}

- (double)editMenuTargetRect
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 152) editMenuTargetRect];
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionGestureView, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_storeStrong((id *)&self->_spaceInsertionController, 0);
  objc_storeStrong((id *)&self->_currentPasteboard, 0);
  objc_storeStrong((id *)&self->_currentStrokeSelection, 0);
  objc_destroyWeak((id *)&self->_tiledView);
  objc_storeStrong((id *)&self->_imageGenerationController, 0);
  objc_storeStrong(&self->_deferredChangingColorBlock, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong(&self->_intersectStrokesBetweenLollipopBlock, 0);
  objc_storeStrong((id *)&self->_selectionHullQueue, 0);
  objc_storeStrong((id *)&self->_intersectionQueue, 0);
  objc_storeStrong((id *)&self->_transcriptionController, 0);

  objc_storeStrong((id *)&self->_previousDrawingUUIDForSelection, 0);
}

@end