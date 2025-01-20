@interface PKGroupQuery
+ (id)_strokesInLine:(id)a3 inDrawing:(id)a4;
- (BOOL)_strokes:(id)a3 containsAnyStrokes:(id)a4;
- (CHStrokeGroupQuery)strokeGroupQuery;
- (PKDrawing)drawing;
- (PKGroupQuery)initWithRecognitionSessionManager:(id)a3;
- (id)_closestLineToPoint:(CGPoint)a3 isTop:(BOOL)a4;
- (id)_lines:(id)a3 containingStrokes:(id)a4;
- (id)_strokesAtLineIndex:(int64_t)a3 containingStrokes:(id)a4;
- (id)_strokesForIdentifiers:(id)a3 inDrawing:(id)a4;
- (id)_strokesInLine:(id)a3 leftOf:(BOOL)a4 point:(CGPoint)a5;
- (id)firstStrokesInStrokes:(id)a3 isRTL:(BOOL)a4;
- (id)lastStrokesInStrokes:(id)a3 isRTL:(BOOL)a4;
- (id)strokeGroups;
- (int64_t)_firstLineIndexFromInitialStrokes:(id)a3;
- (int64_t)_lastLineIndexFromInitialStrokes:(id)a3;
- (int64_t)_tokenizationLevelForSelectionType:(int64_t)a3;
- (int64_t)contentTypeForIntersectedStrokes:(id)a3;
- (void)_precalculateStrokeGroupProperties:(id)a3;
- (void)dealloc;
- (void)fetchCurrentStrokeGroupItems:(id)a3;
- (void)pause;
- (void)q_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:(id)a3 completion:(id)a4;
- (void)q_fetchStrokesBetweenTopPoint:(CGPoint)a3 bottomPoint:(CGPoint)a4 isRTL:(BOOL)a5 completion:(id)a6;
- (void)q_fetchStrokesForPoint:(CGPoint)a3 selectionType:(int64_t)a4 inputType:(int64_t)a5 visibleOnscreenStrokes:(id)a6 completion:(id)a7;
- (void)queryDidUpdateResult:(id)a3;
- (void)setDrawing:(id)a3;
- (void)setStrokeGroupQuery:(id)a3;
- (void)setStrokeGroups:(id)a3;
- (void)setupForMath;
- (void)start;
- (void)teardown;
- (void)textStrokesCoveredByStroke:(id)a3 completion:(id)a4;
@end

@implementation PKGroupQuery

- (PKGroupQuery)initWithRecognitionSessionManager:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKGroupQuery;
  v5 = [(PKQuery *)&v23 initWithRecognitionSessionManager:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F5C090]);
    v7 = -[PKRecognitionSessionManager session](v4);
    uint64_t v8 = [v6 initWithRecognitionSession:v7];
    strokeGroupQuery = v5->_strokeGroupQuery;
    v5->_strokeGroupQuery = (CHStrokeGroupQuery *)v8;

    v10 = [(PKGroupQuery *)v5 strokeGroupQuery];
    [v10 setDelegate:v5];

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.PencilKit.GroupQueryIntersection", v12);
    intersectionQueue = v5->_intersectionQueue;
    v5->_intersectionQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.PencilKit.GroupQueryStrokeGroupComputation", v15);
    strokeGroupComputationQueue = v5->_strokeGroupComputationQueue;
    v5->_strokeGroupComputationQueue = (OS_dispatch_queue *)v16;
  }
  v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v19 = [v18 BOOLForKey:@"internalSettings.drawing.forceFastGroupingForLassolessSelection"];

  if (v19)
  {
    v20 = [(PKQuery *)v5 sessionManager];
    v21 = -[PKRecognitionSessionManager session](v20);
    [v21 setShouldForceFastGrouping:1];
  }
  return v5;
}

- (void)setupForMath
{
  id v2 = [(PKGroupQuery *)self strokeGroupQuery];
  [v2 setPreferredUpdatesInterval:0.3];
}

- (void)fetchCurrentStrokeGroupItems:(id)a3
{
  uint64_t v8 = (void (**)(id, id))a3;
  uint64_t v4 = [(PKGroupQuery *)self strokeGroups];
  v5 = (void *)v4;
  id v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  v8[2](v8, v7);
}

- (void)setStrokeGroups:(id)a3
{
  id v7 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  strokeGroups = v4->_strokeGroups;
  v4->_strokeGroups = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (id)strokeGroups
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_strokeGroups;
  objc_sync_exit(v2);

  return v3;
}

- (void)start
{
  id v2 = [(PKGroupQuery *)self strokeGroupQuery];
  [v2 start];
}

- (void)pause
{
  id v2 = [(PKGroupQuery *)self strokeGroupQuery];
  [v2 pause];
}

- (void)teardown
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__PKGroupQuery_teardown__block_invoke;
  block[3] = &unk_1E64C5368;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __24__PKGroupQuery_teardown__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setDelegate:0];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKGroupQuery;
  [(PKGroupQuery *)&v2 dealloc];
}

- (PKDrawing)drawing
{
  objc_super v2 = [(PKQuery *)self sessionManager];
  v3 = -[PKRecognitionSessionManager drawing](v2);

  return (PKDrawing *)v3;
}

- (void)queryDidUpdateResult:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 strokeGroupItems];
  uint64_t v5 = os_log_create("com.apple.pencilkit", "Recognition");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 count];
    id v7 = [(PKQuery *)self sessionManager];
    int v8 = 138412802;
    v9 = self;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    dispatch_queue_t v13 = v7;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "StateUpdate: Did update group query results for %@ with %lu stroke group items for session manager %@", (uint8_t *)&v8, 0x20u);
  }
  [(PKGroupQuery *)self _precalculateStrokeGroupProperties:v4];
}

- (void)textStrokesCoveredByStroke:(id)a3 completion:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = _PKSignpostLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  __int16 v10 = _PKSignpostLog();
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "textStrokesCoveredByStroke", (const char *)&unk_1C48540E6, buf, 2u);
  }

  __int16 v12 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_INFO, "BEGIN \"textStrokesCoveredByStroke\"", buf, 2u);
  }

  v24[0] = v6;
  dispatch_queue_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  uint64_t v14 = +[PKStrokeProvider slicesForStrokes:v13];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PKGroupQuery_textStrokesCoveredByStroke_completion___block_invoke;
  aBlock[3] = &unk_1E64C52F0;
  aBlock[4] = self;
  os_signpost_id_t v22 = v9;
  id v15 = v7;
  id v21 = v15;
  dispatch_queue_t v16 = _Block_copy(aBlock);
  v17 = [(PKGroupQuery *)self strokeGroupQuery];
  v18 = [v14 objectAtIndex:0];
  id v19 = (id)[v17 tokenStrokeIdentifiersWithCoveringStroke:v18 completion:v16 shouldCancel:0];
}

void __54__PKGroupQuery_textStrokesCoveredByStroke_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.pencilkit", "Actions");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v5 strokeIdentifiers];
    os_signpost_id_t v9 = [v8 allObjects];
    int v23 = 134217984;
    uint64_t v24 = [v9 count];
    _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Scratch Out will delete %lu text strokes.", (uint8_t *)&v23, 0xCu);
  }
  __int16 v10 = *(void **)(a1 + 32);
  uint64_t v11 = [v5 strokeIdentifiers];
  __int16 v12 = [v11 allObjects];
  dispatch_queue_t v13 = [*(id *)(a1 + 32) drawing];
  uint64_t v14 = [v10 _strokesForIdentifiers:v12 inDrawing:v13];

  id v15 = *(void **)(a1 + 32);
  dispatch_queue_t v16 = [v6 allObjects];
  v17 = [*(id *)(a1 + 32) drawing];
  v18 = [v15 _strokesForIdentifiers:v16 inDrawing:v17];

  id v19 = _PKSignpostLog();
  v20 = v19;
  os_signpost_id_t v21 = *(void *)(a1 + 48);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v20, OS_SIGNPOST_INTERVAL_END, v21, "textStrokesCoveredByStroke", (const char *)&unk_1C48540E6, (uint8_t *)&v23, 2u);
  }

  os_signpost_id_t v22 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_1C44F8000, v22, OS_LOG_TYPE_INFO, "END \"textStrokesCoveredByStroke\"", (uint8_t *)&v23, 2u);
  }

  (*(void (**)(void, void *, void *, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v14, v18, [v5 resultLevel] == 0);
}

- (void)_precalculateStrokeGroupProperties:(id)a3
{
  id v4 = a3;
  id v5 = [(PKGroupQuery *)self drawing];
  id v6 = (void *)[v5 copy];

  id v7 = (void *)[v4 copy];
  strokeGroupComputationQueue = self->_strokeGroupComputationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PKGroupQuery__precalculateStrokeGroupProperties___block_invoke;
  block[3] = &unk_1E64C53E0;
  id v12 = v7;
  id v13 = v6;
  uint64_t v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(strokeGroupComputationQueue, block);
}

void __51__PKGroupQuery__precalculateStrokeGroupProperties___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  for (unint64_t i = 0; i < [*(id *)(a1 + 32) count]; ++i)
  {
    v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
    id v4 = +[PKGroupQuery _strokesInLine:v3 inDrawing:*(void *)(a1 + 40)];
    +[PKDrawing _boundingBoxForStrokeArray:v4];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    if ([v3 strokeGroupType] == 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = 2;
    }
    uint64_t v14 = objc_alloc_init(PKStrokeGroupItem);
    id v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_strokeGroupItem, v3);
      objc_setProperty_nonatomic_copy(v15, v16, v4, 16);
      v15->_bounds.origin.x = v6;
      v15->_bounds.origin.y = v8;
      v15->_bounds.size.width = v10;
      v15->_bounds.size.height = v12;
      v15->_contentType = v13;
    }
    [v22 addObject:v15];
  }
  [*(id *)(a1 + 48) setStrokeGroups:v22];
  v17 = [*(id *)(a1 + 48) delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    id v19 = [*(id *)(a1 + 48) delegate];
    uint64_t v20 = *(void *)(a1 + 48);
    os_signpost_id_t v21 = (void *)[v22 copy];
    [v19 groupQuery:v20 foundItems:v21];
  }
}

- (id)_strokesForIdentifiers:(id)a3 inDrawing:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v7 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        CGFloat v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "strokeUUID", (void)v15);
        uint64_t v13 = [v6 _visibleStrokeForIdentifier:v12];

        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v7;
}

+ (id)_strokesInLine:(id)a3 inDrawing:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v17 = v5;
  double v7 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [v5 strokeIdentifiers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        CGFloat v12 = [*(id *)(*((void *)&v19 + 1) + 8 * v11) strokeUUID];
        uint64_t v13 = [v6 _visibleStrokeForIdentifier:v12];

        if (v13)
        {
          [v7 addObject:v13];
        }
        else
        {
          uint64_t v14 = os_log_create("com.apple.pencilkit", "");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_ERROR, "Unable to find stroke from stroke group in drawing.", buf, 2u);
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  long long v15 = (void *)[v7 copy];

  return v15;
}

- (id)_lines:(id)a3 containingStrokes:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
        if (v13) {
          uint64_t v14 = *(void **)(v13 + 16);
        }
        else {
          uint64_t v14 = 0;
        }
        id v15 = v14;
        if (-[PKGroupQuery _strokes:containsAnyStrokes:](self, "_strokes:containsAnyStrokes:", v15, v7, (void)v18)) {
          [v8 addObject:v13];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v16 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v10 = v16;
    }
    while (v16);
  }

  return v8;
}

- (BOOL)_strokes:(id)a3 containsAnyStrokes:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v22 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v21 = *(void *)v28;
    do
    {
      uint64_t v20 = v7;
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v6);
        }
        id v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v10 = v22;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v24;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              id v15 = [v9 _strokeUUID];
              uint64_t v16 = [v14 _strokeUUID];
              char v17 = [v15 isEqual:v16];

              if (v17)
              {

                BOOL v18 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
      BOOL v18 = 0;
    }
    while (v7);
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_19:

  return v18;
}

- (void)q_fetchStrokesForPoint:(CGPoint)a3 selectionType:(int64_t)a4 inputType:(int64_t)a5 visibleOnscreenStrokes:(id)a6 completion:(id)a7
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v13 = a6;
  uint64_t v14 = (void (**)(id, void))a7;
  id v15 = objc_alloc_init(PKIntersectionResult);
  uint64_t v16 = [(PKQuery *)self sessionManager];
  if ([v16 state] == 3) {
    uint64_t v17 = 3;
  }
  else {
    uint64_t v17 = 2;
  }
  [(PKIntersectionResult *)v15 setIntersectionAlgorithmType:v17];

  if (a4 == 6 || !a4) {
    v14[2](v14, 0);
  }
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy_;
  v35[4] = __Block_byref_object_dispose_;
  id v36 = [(PKGroupQuery *)self strokeGroupQuery];
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy_;
  v33[4] = __Block_byref_object_dispose_;
  id v34 = [(PKGroupQuery *)self drawing];
  intersectionQueue = self->_intersectionQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __97__PKGroupQuery_q_fetchStrokesForPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke;
  v22[3] = &unk_1E64C5340;
  CGFloat v29 = x;
  CGFloat v30 = y;
  id v23 = v13;
  long long v24 = v15;
  long long v25 = self;
  id v26 = v14;
  int64_t v31 = a5;
  int64_t v32 = a4;
  long long v27 = v35;
  long long v28 = v33;
  long long v19 = v14;
  uint64_t v20 = v15;
  id v21 = v13;
  dispatch_async(intersectionQueue, v22);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);
}

void __97__PKGroupQuery_q_fetchStrokesForPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke(uint64_t a1)
{
  objc_super v2 = +[PKClusteringUtility _geometricBasedStrokeClusteringFromPoint:visibleStrokes:selectionType:inputType:](PKClusteringUtility, "_geometricBasedStrokeClusteringFromPoint:visibleStrokes:selectionType:inputType:", *(void *)(a1 + 32), 1, *(void *)(a1 + 96), *(double *)(a1 + 80), *(double *)(a1 + 88));
  if ([v2 count])
  {
    uint64_t v3 = [*(id *)(a1 + 48) _tokenizationLevelForSelectionType:*(void *)(a1 + 104)];
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    id v5 = +[PKStrokeProvider _identifiersForStrokes:v2];
    double v6 = *(double *)(a1 + 80);
    double v7 = *(double *)(a1 + 88);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __97__PKGroupQuery_q_fetchStrokesForPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke_3;
    v14[3] = &unk_1E64C5318;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v15[0] = v8;
    v15[1] = v9;
    uint64_t v10 = *(void *)(a1 + 104);
    uint64_t v19 = *(void *)(a1 + 72);
    uint64_t v20 = v10;
    id v16 = *(id *)(a1 + 32);
    id v17 = v2;
    id v18 = *(id *)(a1 + 56);
    id v11 = (id)objc_msgSend(v4, "tokenizedStrokeResultForInitialStrokes:point:tokenizationLevel:completion:shouldCancel:", v5, v3, v14, 0, v6, v7);
    uint64_t v12 = (id *)v15;

    id v13 = v16;
  }
  else
  {
    [*(id *)(a1 + 40) setIntersectedStrokes:v2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__PKGroupQuery_q_fetchStrokesForPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke_2;
    block[3] = &unk_1E64C53B8;
    uint64_t v12 = &v23;
    id v23 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v13 = v22;
  }
}

uint64_t __97__PKGroupQuery_q_fetchStrokesForPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __97__PKGroupQuery_q_fetchStrokesForPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 resultLevel] == 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 32) intersectionAlgorithmType];
  }
  [*(id *)(a1 + 32) setIntersectionAlgorithmType:v4];
  id v5 = *(void **)(a1 + 40);
  double v6 = [v3 strokeIdentifiers];
  double v7 = [v6 allObjects];
  id v8 = [v5 _strokesForIdentifiers:v7 inDrawing:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

  uint64_t v9 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v8];
  uint64_t v10 = (void *)v9;
  if (*(void *)(a1 + 80) == 5)
  {
    id v11 = [MEMORY[0x1E4F1CA70] orderedSetWithOrderedSet:v9];
    [v11 addObjectsFromArray:*(void *)(a1 + 48)];
  }
  else
  {
    id v11 = (void *)v9;
  }
  uint64_t v12 = [MEMORY[0x1E4F1CA70] orderedSetWithOrderedSet:v11];
  if (([v12 intersectsOrderedSet:*(void *)(a1 + 56)] & 1) == 0)
  {
    [v12 unionOrderedSet:*(void *)(a1 + 56)];
    id v13 = v12;

    id v11 = v13;
  }
  [*(id *)(a1 + 32) setIntersectedStrokes:v11];
  objc_msgSend(*(id *)(a1 + 32), "setContentType:", objc_msgSend(*(id *)(a1 + 40), "contentTypeForIntersectedStrokes:", v11));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __97__PKGroupQuery_q_fetchStrokesForPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke_4;
  v14[3] = &unk_1E64C53B8;
  id v16 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

uint64_t __97__PKGroupQuery_q_fetchStrokesForPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (int64_t)_tokenizationLevelForSelectionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 3) {
    return 0;
  }
  else {
    return qword_1C4828DC0[a3 - 2];
  }
}

- (id)_closestLineToPoint:(CGPoint)a3 isTop:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = [(PKGroupQuery *)self strokeGroups];
  double v7 = 0;
  uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v8)
  {
    uint64_t v30 = *(void *)v36;
    double v9 = 1.79769313e308;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v36 != v30) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v35 + 1) + 8 * v10);
        if (v11) {
          uint64_t v12 = (void *)v11[2];
        }
        else {
          uint64_t v12 = 0;
        }
        id v13 = v12;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v32 != v16) {
                objc_enumerationMutation(v14);
              }
              [*(id *)(*((void *)&v31 + 1) + 8 * i) _bounds];
              CGFloat v18 = v43.origin.x;
              CGFloat v19 = v43.origin.y;
              CGFloat width = v43.size.width;
              CGFloat height = v43.size.height;
              double MidX = CGRectGetMidX(v43);
              v44.origin.double x = v18;
              v44.origin.double y = v19;
              v44.size.CGFloat width = width;
              v44.size.CGFloat height = height;
              double MidY = CGRectGetMidY(v44);
              BOOL v24 = MidY <= y;
              if (!v4) {
                BOOL v24 = MidY >= y;
              }
              if (!v24)
              {
                double v25 = sqrt((MidY - y) * (MidY - y) + (MidX - x) * (MidX - x));
                if (v25 < v9)
                {
                  id v26 = v11;

                  double v7 = v26;
                  double v9 = v25;
                }
              }
            }
            uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v15);
        }

        ++v10;
      }
      while (v10 != v8);
      uint64_t v27 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      uint64_t v8 = v27;
    }
    while (v27);
  }

  return v7;
}

- (void)q_fetchStrokesBetweenTopPoint:(CGPoint)a3 bottomPoint:(CGPoint)a4 isRTL:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  double y = a4.y;
  double x = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  id v12 = a6;
  id v13 = [(PKGroupQuery *)self strokeGroups];
  if (v13)
  {
    id v14 = [(PKGroupQuery *)self strokeGroups];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      id v49 = v12;
      uint64_t v16 = -[PKGroupQuery _closestLineToPoint:isTop:](self, "_closestLineToPoint:isTop:", 1, v10, v9);
      uint64_t v17 = -[PKGroupQuery _closestLineToPoint:isTop:](self, "_closestLineToPoint:isTop:", 0, x, y);
      CGFloat v18 = [(PKGroupQuery *)self strokeGroups];
      uint64_t v19 = [v18 indexOfObject:v16];

      uint64_t v20 = [(PKGroupQuery *)self strokeGroups];
      uint64_t v21 = [v20 indexOfObject:v17];

      if (!(v16 | v17))
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __75__PKGroupQuery_q_fetchStrokesBetweenTopPoint_bottomPoint_isRTL_completion___block_invoke;
        block[3] = &unk_1E64C5390;
        id v57 = v12;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      BOOL v22 = v16 != 0;
      BOOL v23 = v17 == 0;
      if (v17) {
        BOOL v24 = v16 == 0;
      }
      else {
        BOOL v24 = 0;
      }
      if (v24) {
        uint64_t v25 = v21;
      }
      else {
        uint64_t v25 = v19;
      }
      if (v22 && v23) {
        unint64_t v26 = v19;
      }
      else {
        unint64_t v26 = v21;
      }
      if (v22 && v23) {
        unint64_t v27 = v19;
      }
      else {
        unint64_t v27 = v25;
      }
      if (v26 < v27)
      {
        id v28 = (id)v16;

        unint64_t v26 = v27;
        uint64_t v17 = (uint64_t)v28;
      }
      if (v16)
      {
        uint64_t v29 = *(void *)(v16 + 24);
        if (v17)
        {
LABEL_21:
          uint64_t v30 = *(void *)(v17 + 24);
LABEL_22:
          BOOL v48 = v6;
          long long v31 = [MEMORY[0x1E4F1CA70] orderedSet];
          if (v29 == v30) {
            uint64_t v32 = v29;
          }
          else {
            uint64_t v32 = 3;
          }
          unint64_t v33 = v27 + 1;
          if (v27 + 1 < v26)
          {
            do
            {
              long long v34 = [(PKGroupQuery *)self strokeGroups];
              long long v35 = [v34 objectAtIndexedSubscript:v33];

              if (v35) {
                long long v36 = (void *)v35[2];
              }
              else {
                long long v36 = 0;
              }
              id v37 = v36;
              [v31 addObjectsFromArray:v37];

              if (v32 != 3)
              {
                uint64_t v38 = v35 ? v35[3] : 0;
                if (v38 != v32) {
                  uint64_t v32 = 3;
                }
              }

              ++v33;
            }
            while (v26 != v33);
          }
          id v41 = v31;
          v51 = (void *)[v41 mutableCopy];
          v50 = -[PKGroupQuery _strokesInLine:leftOf:point:](self, "_strokesInLine:leftOf:point:", v16, v48, v10, v9);
          v42 = -[PKGroupQuery _strokesInLine:leftOf:point:](self, "_strokesInLine:leftOf:point:", v17, !v48, x, y);
          if (v16 == v17)
          {
            CGRect v43 = (void *)[v50 mutableCopy];
            [v43 intersectOrderedSet:v42];
            [v51 unionOrderedSet:v43];
          }
          else
          {
            [v51 unionOrderedSet:v50];
            [v51 unionOrderedSet:v42];
          }
          id v39 = v51;

          v40 = objc_alloc_init(PKIntersectionResult);
          [(PKIntersectionResult *)v40 setIntersectedStrokes:v39];
          CGRect v44 = [(PKQuery *)self sessionManager];
          if ([v44 state] == 3) {
            uint64_t v45 = 3;
          }
          else {
            uint64_t v45 = 2;
          }
          [(PKIntersectionResult *)v40 setIntersectionAlgorithmType:v45];

          [(PKIntersectionResult *)v40 setContentType:v32];
          id v12 = v49;
          goto LABEL_47;
        }
      }
      else
      {
        uint64_t v29 = 0;
        if (v17) {
          goto LABEL_21;
        }
      }
      uint64_t v30 = 0;
      goto LABEL_22;
    }
  }
  uint64_t v16 = (uint64_t)os_log_create("com.apple.pencilkit", "Recognition");
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "No recognition results available", buf, 2u);
  }
  id v39 = 0;
  v40 = 0;
LABEL_47:

  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __75__PKGroupQuery_q_fetchStrokesBetweenTopPoint_bottomPoint_isRTL_completion___block_invoke_33;
  v52[3] = &unk_1E64C53B8;
  v53 = v40;
  id v54 = v12;
  v46 = v40;
  id v47 = v12;
  dispatch_async(MEMORY[0x1E4F14428], v52);
}

uint64_t __75__PKGroupQuery_q_fetchStrokesBetweenTopPoint_bottomPoint_isRTL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__PKGroupQuery_q_fetchStrokesBetweenTopPoint_bottomPoint_isRTL_completion___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_strokesInLine:(id)a3 leftOf:(BOOL)a4 point:(CGPoint)a5
{
  double x = a5.x;
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  if (v7) {
    double v9 = (void *)v7[2];
  }
  else {
    double v9 = 0;
  }
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend(v14, "_bounds", (void)v23);
        CGFloat v15 = v30.origin.x;
        CGFloat y = v30.origin.y;
        CGFloat width = v30.size.width;
        CGFloat height = v30.size.height;
        double MidX = CGRectGetMidX(v30);
        v31.origin.double x = v15;
        v31.origin.CGFloat y = y;
        v31.size.CGFloat width = width;
        v31.size.CGFloat height = height;
        double MidY = CGRectGetMidY(v31);
        BOOL v21 = MidX < x;
        if (!v6) {
          BOOL v21 = MidX > x;
        }
        if (v21) {
          objc_msgSend(v8, "addObject:", v14, MidY);
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  return v8;
}

- (int64_t)_firstLineIndexFromInitialStrokes:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 array];
  for (unint64_t i = 0; ; ++i)
  {
    double v7 = [(PKGroupQuery *)self strokeGroups];
    BOOL v8 = i < [v7 count];

    if (!v8) {
      break;
    }
    double v9 = [(PKGroupQuery *)self strokeGroups];
    id v10 = [v9 objectAtIndexedSubscript:i];

    v14[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    uint64_t v12 = [(PKGroupQuery *)self _lines:v11 containingStrokes:v5];

    LOBYTE(v11) = [v12 count] == 1;
    if (v11) {
      goto LABEL_6;
    }
  }
  unint64_t i = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:

  return i;
}

- (int64_t)_lastLineIndexFromInitialStrokes:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 array];
  id v5 = [(PKGroupQuery *)self strokeGroups];
  int64_t v6 = [v5 count];

  while (--v6 >= 0)
  {
    double v7 = [(PKGroupQuery *)self strokeGroups];
    BOOL v8 = [v7 objectAtIndexedSubscript:v6];

    v12[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    id v10 = [(PKGroupQuery *)self _lines:v9 containingStrokes:v4];

    LOBYTE(v9) = [v10 count] == 1;
    if (v9) {
      goto LABEL_6;
    }
  }
  int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:

  return v6;
}

- (id)firstStrokesInStrokes:(id)a3 isRTL:(BOOL)a4
{
  id v6 = a3;
  double v7 = [(PKGroupQuery *)self strokeGroups];
  BOOL v8 = v7;
  if (v7
    && [v7 count]
    && (unint64_t v9 = [(PKGroupQuery *)self _firstLineIndexFromInitialStrokes:v6],
        v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v12 = [(PKGroupQuery *)self _strokesAtLineIndex:v9 containingStrokes:v6];
    id v13 = (void *)[v12 mutableCopy];
    id v14 = [v8 objectAtIndexedSubscript:v9];
    if (v14)
    {
      CGFloat v15 = v14[6];
      CGFloat v28 = v14[4];
      CGFloat v29 = v14[5];
      CGFloat v16 = v14[7];
    }
    else
    {
      CGFloat v28 = 0.0;
      CGFloat v29 = 0.0;
      CGFloat v15 = 0.0;
      CGFloat v16 = 0.0;
    }

    while (v9 < objc_msgSend(v8, "count", *(void *)&v28, *(void *)&v29))
    {
      uint64_t v17 = [v8 objectAtIndexedSubscript:v9];
      if (v17)
      {
        CGFloat v19 = v17[4];
        CGFloat v18 = v17[5];
        CGFloat v20 = v17[6];
        CGFloat v21 = v17[7];
      }
      else
      {
        CGFloat v18 = 0.0;
        CGFloat v20 = 0.0;
        CGFloat v21 = 0.0;
        CGFloat v19 = 0.0;
      }

      v31.origin.double x = v19;
      v31.origin.CGFloat y = v18;
      v31.size.CGFloat width = v20;
      v31.size.CGFloat height = v21;
      double MinY = CGRectGetMinY(v31);
      v32.origin.double x = v28;
      v32.origin.CGFloat y = v29;
      v32.size.CGFloat width = v15;
      v32.size.CGFloat height = v16;
      double v23 = CGRectGetMinY(v32);
      v33.origin.double x = v19;
      v33.origin.CGFloat y = v18;
      v33.size.CGFloat width = v20;
      v33.size.CGFloat height = v21;
      v34.origin.double x = v28;
      v34.origin.CGFloat y = v29;
      v34.size.CGFloat width = v15;
      v34.size.CGFloat height = v16;
      BOOL v24 = CGRectIntersectsRect(v33, v34);
      if (MinY - v23 < 20.0 && v24)
      {
        long long v26 = -[PKGroupQuery _strokesAtLineIndex:containingStrokes:](self, "_strokesAtLineIndex:containingStrokes:", v9, v6, MinY - v23);
        unint64_t v27 = v26;
        if (v26 && [v26 count]) {
          [v13 unionOrderedSet:v27];
        }
      }
      ++v9;
    }
    if (a4) {
      +[PKDrawing _findRightmostStrokes:v13];
    }
    else {
    id v10 = +[PKDrawing _findLeftmostStrokes:v13];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_strokesAtLineIndex:(int64_t)a3 containingStrokes:(id)a4
{
  id v6 = a4;
  double v7 = [(PKGroupQuery *)self strokeGroups];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    id v14 = 0;
  }
  else
  {
    unint64_t v9 = [(PKGroupQuery *)self strokeGroups];
    uint64_t v10 = [v9 objectAtIndexedSubscript:a3];
    uint64_t v11 = (void *)v10;
    if (v10) {
      uint64_t v12 = *(void **)(v10 + 16);
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    id v14 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v13];
    [v14 intersectOrderedSet:v6];
  }

  return v14;
}

- (id)lastStrokesInStrokes:(id)a3 isRTL:(BOOL)a4
{
  id v6 = a3;
  double v7 = [(PKGroupQuery *)self strokeGroups];
  unint64_t v8 = v7;
  if (v7
    && [v7 count]
    && (int64_t v9 = [(PKGroupQuery *)self _lastLineIndexFromInitialStrokes:v6],
        v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v12 = [(PKGroupQuery *)self _strokesAtLineIndex:v9 containingStrokes:v6];
    id v13 = (void *)[v12 mutableCopy];
    id v14 = [v8 objectAtIndexedSubscript:v9];
    if (v14)
    {
      CGFloat v15 = v14[6];
      CGFloat v29 = v14[4];
      CGFloat v30 = v14[5];
      CGFloat v16 = v14[7];
    }
    else
    {
      CGFloat v29 = 0.0;
      CGFloat v30 = 0.0;
      CGFloat v15 = 0.0;
      CGFloat v16 = 0.0;
    }

    if ((v9 & 0x8000000000000000) == 0)
    {
      do
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v9, *(void *)&v29, *(void *)&v30);
        uint64_t v17 = (double *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          CGFloat v19 = v17[4];
          CGFloat v18 = v17[5];
          CGFloat v20 = v17[6];
          CGFloat v21 = v17[7];
        }
        else
        {
          CGFloat v18 = 0.0;
          CGFloat v20 = 0.0;
          CGFloat v21 = 0.0;
          CGFloat v19 = 0.0;
        }

        v32.origin.double x = v19;
        v32.origin.CGFloat y = v18;
        v32.size.CGFloat width = v20;
        v32.size.CGFloat height = v21;
        double MaxY = CGRectGetMaxY(v32);
        v33.origin.double x = v29;
        v33.origin.CGFloat y = v30;
        v33.size.CGFloat width = v15;
        v33.size.CGFloat height = v16;
        double v23 = CGRectGetMaxY(v33);
        v34.origin.double x = v19;
        v34.origin.CGFloat y = v18;
        v34.size.CGFloat width = v20;
        v34.size.CGFloat height = v21;
        v35.origin.double x = v29;
        v35.origin.CGFloat y = v30;
        v35.size.CGFloat width = v15;
        v35.size.CGFloat height = v16;
        BOOL v24 = CGRectIntersectsRect(v34, v35);
        if (MaxY - v23 > -20.0 && v24)
        {
          long long v26 = -[PKGroupQuery _strokesAtLineIndex:containingStrokes:](self, "_strokesAtLineIndex:containingStrokes:", v9, v6, MaxY - v23);
          unint64_t v27 = v26;
          if (v26 && [v26 count]) {
            [v13 unionOrderedSet:v27];
          }
        }
      }
      while (v9-- > 0);
    }
    if (a4) {
      +[PKDrawing _findLeftmostStrokes:v13];
    }
    else {
    id v10 = +[PKDrawing _findRightmostStrokes:v13];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)q_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:(id)a3 completion:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v6 = (void (**)(void, void *, void *))a4;
  double v7 = [(PKGroupQuery *)self strokeGroups];
  if (v7
    && ([(PKGroupQuery *)self strokeGroups],
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v7,
        v9))
  {
    CGRect v43 = v6;
    id v10 = [MEMORY[0x1E4F1CA70] orderedSet];
    uint64_t v11 = [MEMORY[0x1E4F1CA70] orderedSet];
    uint64_t v12 = [(PKGroupQuery *)self strokeGroups];
    id v13 = [(PKGroupQuery *)self _lines:v12 containingStrokes:v44];

    CGFloat x = *MEMORY[0x1E4F1DB28];
    double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v18 = v13;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v50;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v50 != v20) {
            objc_enumerationMutation(v18);
          }
          BOOL v22 = *(void **)(*((void *)&v49 + 1) + 8 * v21);
          if (v22) {
            double v23 = (void *)v22[2];
          }
          else {
            double v23 = 0;
          }
          id v24 = v23;
          [v10 addObjectsFromArray:v24];

          if (v22)
          {
            uint64_t v25 = v22[4];
            uint64_t v26 = v22[5];
            uint64_t v27 = v22[6];
            uint64_t v28 = v22[7];
          }
          else
          {
            uint64_t v26 = 0;
            uint64_t v27 = 0;
            uint64_t v28 = 0;
            uint64_t v25 = 0;
          }
          v56.origin.CGFloat x = x;
          v56.origin.double y = y;
          v56.size.CGFloat width = width;
          v56.size.CGFloat height = height;
          CGRect v57 = CGRectUnion(v56, *(CGRect *)&v25);
          CGFloat x = v57.origin.x;
          double y = v57.origin.y;
          CGFloat width = v57.size.width;
          CGFloat height = v57.size.height;
          ++v21;
        }
        while (v19 != v21);
        uint64_t v29 = [v18 countByEnumeratingWithState:&v49 objects:v54 count:16];
        uint64_t v19 = v29;
      }
      while (v29);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    CGFloat v30 = [(PKGroupQuery *)self strokeGroups];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v31)
    {
      double v32 = y + -20.0;
      uint64_t v33 = *(void *)v46;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v46 != v33) {
            objc_enumerationMutation(v30);
          }
          CGRect v35 = *(void **)(*((void *)&v45 + 1) + 8 * v34);
          if (([v18 containsObject:v35] & 1) == 0)
          {
            if (v35)
            {
              uint64_t v36 = v35[4];
              uint64_t v37 = v35[5];
              uint64_t v38 = v35[6];
              uint64_t v39 = v35[7];
            }
            else
            {
              uint64_t v37 = 0;
              uint64_t v38 = 0;
              uint64_t v39 = 0;
              uint64_t v36 = 0;
            }
            v58.origin.CGFloat x = x;
            v58.origin.double y = v32;
            v58.size.CGFloat width = width;
            v58.size.CGFloat height = 40.0;
            if (CGRectIntersectsRect(*(CGRect *)&v36, v58))
            {
              if (v35) {
                v40 = (void *)v35[2];
              }
              else {
                v40 = 0;
              }
              id v41 = v40;
              [v11 addObjectsFromArray:v41];
            }
          }
          ++v34;
        }
        while (v31 != v34);
        uint64_t v42 = [v30 countByEnumeratingWithState:&v45 objects:v53 count:16];
        uint64_t v31 = v42;
      }
      while (v42);
    }

    v43[2](v43, v10, v11);
    id v6 = v43;
  }
  else
  {
    v6[2](v6, 0, 0);
  }
}

- (int64_t)contentTypeForIntersectedStrokes:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [(PKGroupQuery *)self strokeGroups];
  obuint64_t j = v5;
  int64_t v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * v9);
        if (v10) {
          uint64_t v11 = *(void **)(v10 + 16);
        }
        else {
          uint64_t v11 = 0;
        }
        uint64_t v12 = (void *)MEMORY[0x1E4F1CAA0];
        id v13 = v11;
        id v14 = [v12 orderedSetWithArray:v13];
        int v15 = [v4 intersectsOrderedSet:v14];

        if (v15)
        {
          if (v6)
          {
            if (v10) {
              uint64_t v16 = *(void *)(v10 + 24);
            }
            else {
              uint64_t v16 = 0;
            }
            if (v6 != v16)
            {
              int64_t v6 = 3;
              id v5 = obj;
              goto LABEL_22;
            }
          }
          else if (v10)
          {
            int64_t v6 = *(void *)(v10 + 24);
          }
          else
          {
            int64_t v6 = 0;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      id v5 = obj;
      uint64_t v17 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v7 = v17;
    }
    while (v17);
  }
LABEL_22:

  return v6;
}

- (CHStrokeGroupQuery)strokeGroupQuery
{
  return self->_strokeGroupQuery;
}

- (void)setStrokeGroupQuery:(id)a3
{
}

- (void)setDrawing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_strokeGroupQuery, 0);
  objc_storeStrong((id *)&self->_strokeGroups, 0);
  objc_storeStrong((id *)&self->_strokeGroupComputationQueue, 0);

  objc_storeStrong((id *)&self->_intersectionQueue, 0);
}

@end