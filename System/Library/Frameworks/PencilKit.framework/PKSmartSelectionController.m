@interface PKSmartSelectionController
- (BOOL)canCopyAsText;
- (BOOL)canTranslate;
- (BOOL)selectionInteraction:(id)a3 handleTapOnCanvasAtLocation:(CGPoint)a4 inAttachment:(id)a5;
- (NSArray)currentSelectedStrokes;
- (PKAttachment)currentAttachment;
- (PKDrawing)currentDrawing;
- (PKRecognitionController)recognitionController;
- (PKSmartSelectionController)initWithDelegate:(id)a3 canvasView:(id)a4 drawing:(id)a5 gestureRecognizer:(id)a6;
- (UIView)selectionView;
- (id)firstStrokesInSelectedStrokes:(id)a3 isRTL:(BOOL)a4;
- (id)interaction;
- (id)lastStrokesInSelectedStrokes:(id)a3 isRTL:(BOOL)a4;
- (id)strokeSpatialCacheForAttachment:(id)a3;
- (int64_t)contentTypeForIntersectedStrokes:(id)a3;
- (int64_t)currentSelectionType;
- (int64_t)selectionTypeForTapCount:(int64_t)a3;
- (void)clearSelectionIfNecessaryWithCompletion:(id)a3;
- (void)copyAsText:(id)a3;
- (void)dealloc;
- (void)didFinishCalculatingVisibleOnscreenStrokes:(id)a3 drawing:(id)a4;
- (void)fetchIntersectedStrokesAtPoint:(CGPoint)a3 selectionType:(int64_t)a4 inputType:(int64_t)a5 visibleOnscreenStrokes:(id)a6 completion:(id)a7;
- (void)fetchIntersectedStrokesBetweenTopPoint:(CGPoint)a3 bottomPoint:(CGPoint)a4 liveScrollOffset:(CGPoint)a5 completion:(id)a6;
- (void)handleDoubleTapInputAtPoint:(CGPoint)a3;
- (void)handleDoubleTapInputAtPoint:(CGPoint)a3 inSelectionView:(id)a4;
- (void)installSelectionViewForCurrentSelection;
- (void)invalidateCacheForBounds:(CGRect)a3 inDrawing:(id)a4;
- (void)selectStrokes:(id)a3 forSelectionType:(int64_t)a4 inDrawing:(id)a5;
- (void)selectStrokesWithoutDidSelectStrokesUpdate:(id)a3 inDrawing:(id)a4;
- (void)selectionInteraction:(id)a3 didSelectStrokes:(id)a4 selectionType:(int64_t)a5 inAttachment:(id)a6;
- (void)setExternalAttachment:(id)a3;
- (void)straighten:(id)a3 completion:(id)a4;
- (void)translate:(id)a3;
- (void)updateGestureHistoryWithLocation:(CGPoint)a3 gesture:(id)a4;
@end

@implementation PKSmartSelectionController

- (PKSmartSelectionController)initWithDelegate:(id)a3 canvasView:(id)a4 drawing:(id)a5 gestureRecognizer:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)PKSmartSelectionController;
  v14 = [(PKSmartSelectionController *)&v32 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v10);
    uint64_t v16 = [v11 _tiledView];
    tiledView = v15->_tiledView;
    v15->_tiledView = (PKTiledView *)v16;

    v18 = [PKRecognitionController alloc];
    v19 = [v12 strokes];
    uint64_t v20 = [(PKRecognitionController *)v18 initWithDrawing:v12 visibleOnscreenStrokes:v19];
    recognitionController = v15->_recognitionController;
    v15->_recognitionController = (PKRecognitionController *)v20;

    v22 = v15->_recognitionController;
    if (v22) {
      sessionManager = v22->_sessionManager;
    }
    else {
      sessionManager = 0;
    }
    objc_storeStrong((id *)&v15->_sessionManager, sessionManager);
    v24 = v15->_sessionManager;
    v25 = [v12 uuid];
    +[PKRecognitionSessionCache addRecognitionSession:forUUID:]((uint64_t)PKRecognitionSessionCache, v24, v25);

    v26 = -[PKSelectionController initWithTiledView:]((id *)[PKSelectionController alloc], v15->_tiledView);
    selectionController = v15->_selectionController;
    v15->_selectionController = (PKSelectionController *)v26;

    v28 = -[PKSelectionController selectionInteraction]((id *)&v15->_selectionController->super.isa);
    [v28 setDelegate:v15];

    objc_storeStrong((id *)&v15->_gestureRecognizer, a6);
    uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
    uuidToStrokeSpatialCacheDict = v15->_uuidToStrokeSpatialCacheDict;
    v15->_uuidToStrokeSpatialCacheDict = (NSMutableDictionary *)v29;
  }
  return v15;
}

- (void)dealloc
{
  selectionController = self->_selectionController;
  self->_selectionController = 0;

  recognitionController = self->_recognitionController;
  self->_recognitionController = 0;

  sessionManager = self->_sessionManager;
  self->_sessionManager = 0;

  currentAttachment = self->_currentAttachment;
  self->_currentAttachment = 0;

  v7.receiver = self;
  v7.super_class = (Class)PKSmartSelectionController;
  [(PKSmartSelectionController *)&v7 dealloc];
}

- (PKDrawing)currentDrawing
{
  return [(PKRecognitionController *)self->_recognitionController drawing];
}

- (NSArray)currentSelectedStrokes
{
  selectionController = self->_selectionController;
  if (selectionController)
  {
    v3 = selectionController->_currentStrokeSelection;
    v4 = v3;
    if (v3)
    {
      v5 = [(PKStrokeSelection *)v3 strokes];
      v6 = [v5 array];

      goto LABEL_6;
    }
  }
  else
  {
    v4 = 0;
  }
  v6 = 0;
LABEL_6:

  return (NSArray *)v6;
}

- (int64_t)currentSelectionType
{
  selectionController = self->_selectionController;
  if (selectionController) {
    selectionController = (PKSelectionController *)selectionController->_selectionView;
  }
  v3 = selectionController;
  int64_t v4 = [(PKSelectionController *)v3 selectionType];

  return v4;
}

- (PKAttachment)currentAttachment
{
  return self->_currentAttachment;
}

- (UIView)selectionView
{
  selectionController = self->_selectionController;
  if (selectionController) {
    return &selectionController->_selectionView->super.super;
  }
  else {
    return 0;
  }
}

- (id)interaction
{
  return -[PKSelectionController selectionInteraction]((id *)&self->_selectionController->super.isa);
}

- (PKRecognitionController)recognitionController
{
  return self->_recognitionController;
}

- (void)setExternalAttachment:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 drawing];
  currentAttachment = self->_currentAttachment;
  self->_currentAttachment = (PKAttachment *)v4;
  id v7 = v4;

  v8 = objc_alloc_init(PKStrokeSpatialCache);
  v9 = v8;
  if (v8) {
    objc_storeWeak((id *)&v8->_delegate, self);
  }
  uuidToStrokeSpatialCacheDict = self->_uuidToStrokeSpatialCacheDict;
  id v11 = [v5 uuid];
  [(NSMutableDictionary *)uuidToStrokeSpatialCacheDict setObject:v9 forKey:v11];

  tiledView = self->_tiledView;
  v19[0] = v7;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [(PKTiledView *)tiledView _setExternalAttachments:v13];

  v14 = self->_tiledView;
  v15 = [(PKTiledView *)v14 canvasView];
  [(PKTiledView *)v14 canvasView:v15 drawingDidChange:v5];

  uint64_t v16 = self->_tiledView;
  v18 = v5;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  [(PKTiledView *)v16 _selectionRefreshWithChangeToDrawings:v17 completion:&__block_literal_global_77];
}

- (id)strokeSpatialCacheForAttachment:(id)a3
{
  id v4 = [a3 drawing];
  v5 = [v4 uuid];

  v6 = [(NSMutableDictionary *)self->_uuidToStrokeSpatialCacheDict objectForKey:v5];

  return v6;
}

- (void)invalidateCacheForBounds:(CGRect)a3 inDrawing:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uuidToStrokeSpatialCacheDict = self->_uuidToStrokeSpatialCacheDict;
  id v9 = a4;
  id v10 = [v9 uuid];
  id v11 = [(NSMutableDictionary *)uuidToStrokeSpatialCacheDict objectForKey:v10];

  -[PKStrokeSpatialCache _invalidateCacheForBounds:inDrawing:force:]((uint64_t)v11, v9, 1, x, y, width, height);
}

- (void)handleDoubleTapInputAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = -[PKSelectionController _drawingForSelectionRect:]((uint64_t)self->_selectionController, a3.x + -22.0, a3.y + -22.0, 44.0, 44.0);
  id v7 = [(PKSmartSelectionController *)self interaction];
  [v7 setCurrentDrawing:v6];

  if ([(UIGestureRecognizer *)self->_gestureRecognizer state] == UIGestureRecognizerStateEnded)
  {
    v8 = +[PKSelectionInput inputWithType:location:inputType:](PKSelectionInput, "inputWithType:location:inputType:", [(PKSmartSelectionController *)self selectionTypeForTapCount:2], 1, x, y);
    id v9 = [(PKSmartSelectionController *)self interaction];
    selectionController = self->_selectionController;
    if (selectionController) {
      selectionController = (PKSelectionController *)selectionController->_currentStrokeSelection;
    }
    id v11 = selectionController;
    id v12 = [(PKSelectionController *)v11 strokes];
    id v13 = [v12 array];
    [v9 _updateProgressiveTapSelectionWithSelectionInput:v8 existingSelection:v13];

    v14 = [(PKSmartSelectionController *)self interaction];
    [v14 _cancelDeferredPasteFromTappingAction];

    v15 = [(PKSmartSelectionController *)self interaction];
    [v15 performSelector:sel__selectViaContinuousTapWithInput_ withObject:v8 afterDelay:0.35];
  }
  gestureRecognizer = self->_gestureRecognizer;

  -[PKSmartSelectionController updateGestureHistoryWithLocation:gesture:](self, "updateGestureHistoryWithLocation:gesture:", gestureRecognizer, x, y);
}

- (void)handleDoubleTapInputAtPoint:(CGPoint)a3 inSelectionView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  PKDynamicCast(v7, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9)
  {
    objc_msgSend(v9, "_handleDoubleTapInputAtPoint:", x, y);
    v8 = v9;
  }
}

- (void)fetchIntersectedStrokesAtPoint:(CGPoint)a3 selectionType:(int64_t)a4 inputType:(int64_t)a5 visibleOnscreenStrokes:(id)a6 completion:(id)a7
{
}

- (void)fetchIntersectedStrokesBetweenTopPoint:(CGPoint)a3 bottomPoint:(CGPoint)a4 liveScrollOffset:(CGPoint)a5 completion:(id)a6
{
}

- (int64_t)contentTypeForIntersectedStrokes:(id)a3
{
  return -[PKRecognitionSessionManager contentTypeForIntersectedStrokes:]((uint64_t)self->_sessionManager, a3);
}

- (id)firstStrokesInSelectedStrokes:(id)a3 isRTL:(BOOL)a4
{
  return -[PKRecognitionSessionManager _firstStrokesInSelectedStrokes:isRTL:](self->_sessionManager, a3, a4);
}

- (id)lastStrokesInSelectedStrokes:(id)a3 isRTL:(BOOL)a4
{
  return -[PKRecognitionSessionManager _lastStrokesInSelectedStrokes:isRTL:](self->_sessionManager, a3, a4);
}

- (void)straighten:(id)a3 completion:(id)a4
{
  selectionController = self->_selectionController;
  id v6 = a4;
  if (selectionController) {
    currentStrokeSelection = selectionController->_currentStrokeSelection;
  }
  else {
    currentStrokeSelection = 0;
  }
  v8 = currentStrokeSelection;
  id v12 = [(PKStrokeSelection *)v8 drawing];

  id v9 = self->_selectionController;
  if (v9) {
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_tiledView);
  }
  else {
    id WeakRetained = 0;
  }
  id v11 = [(PKSmartSelectionController *)self currentSelectedStrokes];
  [WeakRetained _straightenStrokes:v11 drawing:v12 completionBlock:v6];
}

- (BOOL)canCopyAsText
{
  return -[PKSelectionController supportsCopyAsText]((uint64_t)self->_selectionController);
}

- (void)copyAsText:(id)a3
{
}

- (BOOL)canTranslate
{
  if (!self->_selectionController) {
    return 0;
  }
  id LTUITranslationViewControllerClass = getLTUITranslationViewControllerClass();

  return [LTUITranslationViewControllerClass isAvailable];
}

- (void)translate:(id)a3
{
}

- (void)selectStrokes:(id)a3 forSelectionType:(int64_t)a4 inDrawing:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F1CAA0];
  id v9 = a5;
  id v10 = [v8 orderedSetWithArray:a3];
  -[PKSelectionController selectStrokes:forSelectionType:inDrawing:]((id *)&self->_selectionController->super.isa, v10, a4, v9);
}

- (void)selectStrokesWithoutDidSelectStrokesUpdate:(id)a3 inDrawing:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAA0];
  id v7 = a4;
  id v8 = [v6 orderedSetWithArray:a3];
  -[PKSelectionController _selectStrokesWithoutDidSelectStrokesUpdate:inDrawing:]((uint64_t)self->_selectionController, v8, v7);
}

- (void)clearSelectionIfNecessaryWithCompletion:(id)a3
{
  selectionController = self->_selectionController;
  id v7 = a3;
  if (selectionController) {
    selectionView = selectionController->_selectionView;
  }
  else {
    selectionView = 0;
  }
  id v6 = selectionView;
  [(PKSelectionView *)v6 removeFromSuperview];

  -[PKSelectionController clearSelectionIfNecessaryWithCompletion:]((uint64_t)self->_selectionController, v7);
}

- (void)installSelectionViewForCurrentSelection
{
}

- (int64_t)selectionTypeForTapCount:(int64_t)a3
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

- (void)updateGestureHistoryWithLocation:(CGPoint)a3 gesture:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIGestureRecognizer *)self->_gestureRecognizer lastTouchTimestamp];
  self->_lastTapLocation.CGFloat y = y;
  self->_lastTapTimestamp = v7;
  self->_lastTapLocation.CGFloat x = x;
}

- (void)selectionInteraction:(id)a3 didSelectStrokes:(id)a4 selectionType:(int64_t)a5 inAttachment:(id)a6
{
  id v9 = a4;
  PKProtocolCast(&unk_1F203AAA8, a6);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didSelectStrokes:v9 selectionType:a5 inAttachment:v11];
}

- (BOOL)selectionInteraction:(id)a3 handleTapOnCanvasAtLocation:(CGPoint)a4 inAttachment:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  id v9 = PKProtocolCast(&unk_1F203AAA8, v8);
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    id v10 = [v9 contentWindowCoordinateSpace];
    id v11 = [v9 contentUnscaledCoordinateSpace];
    objc_msgSend(v10, "convertPoint:toCoordinateSpace:", v11, x, y);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v13 = objc_msgSend(WeakRetained, "handleSmartSelectionTapAtUnscaledLocation:inAttachment:", v8, x, y);

  return v13;
}

- (void)didFinishCalculatingVisibleOnscreenStrokes:(id)a3 drawing:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [v9 count];
  recognitionController = self->_recognitionController;
  if (v7) {
    [(PKRecognitionController *)recognitionController setDrawing:v6 withVisibleOnscreenStrokes:v9];
  }
  else {
    [(PKRecognitionController *)recognitionController setDrawing:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_recognitionController, 0);
  objc_storeStrong((id *)&self->_selectionController, 0);
  objc_storeStrong((id *)&self->_uuidToStrokeSpatialCacheDict, 0);
  objc_storeStrong((id *)&self->_currentAttachment, 0);
  objc_storeStrong((id *)&self->_tiledView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end