@interface PKRecognitionSessionManager
+ (BOOL)hasAutoRefineLocaleEnabled;
+ (id)enabledLocales;
- (BOOL)canSynthesizeDrawingForText:(uint64_t)a1;
- (CGAffineTransform)_affineTransformFromBounds:(double)a3 targetHeight:(double)a4 targetPoint:(double)a5;
- (PKRecognitionSessionManager)init;
- (char)initWithConfiguration:(char *)a1;
- (id)_firstStrokesInSelectedStrokes:(uint64_t)a3 isRTL:;
- (id)_lastStrokesInSelectedStrokes:(uint64_t)a3 isRTL:;
- (id)calculateDocumentProviderSnapshot;
- (id)canvasAttachmentProviderSnapshot;
- (id)directStrokeProviderSnapshot;
- (id)drawing;
- (id)fetchTranscriptionForStrokes:(void *)a3 cancelBlock:(void *)a4 withCompletion:;
- (id)groupQuery;
- (id)listeners;
- (id)q_groupQuery;
- (id)session;
- (id)strokeProviderSnapshot;
- (int64_t)state;
- (uint64_t)contentTypeForIntersectedStrokes:(uint64_t)a1;
- (uint64_t)q_createRecognitionSessionIfNecessary;
- (void)_dispatchSyncToRecognitionThreadIfNecessary:(uint64_t)a1;
- (void)addListener:(uint64_t)a1;
- (void)autoRefineQuery:(id)a3 didUpdateWithQueryItem:(id)a4 validProviderVersion:(id)a5;
- (void)cacheTranscription:(void *)a3 strokeGroup:;
- (void)cleanupSessionIfNecessary;
- (void)completeTextSynthesisForText:(id *)a1 bounds:(void *)a2 ink:(void *)a3 inputScale:(void *)a4 suggestedHeight:(void *)a5 contextDrawing:(void *)a6 sourceStrokes:(void *)a7 tokenStringRanges:(void *)a8 tokens:(double)a9 completion:(double)a10;
- (void)dataDetectorQuery:(id)a3 foundItems:(id)a4;
- (void)dealloc;
- (void)fetchCurrentStrokeGroupItems:(uint64_t)a1;
- (void)fetchIntersectedStrokesAtPoint:(uint64_t)a3 selectionType:(void *)a4 inputType:(void *)a5 visibleOnscreenStrokes:(double)a6 completion:(double)a7;
- (void)fetchIntersectedStrokesBetweenTopPoint:(void *)a3 bottomPoint:(double)a4 liveScrollOffset:(double)a5 isRTL:(double)a6 completion:(double)a7;
- (void)fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:(void *)a3 completion:;
- (void)groupQuery:(id)a3 foundItems:(id)a4;
- (void)hashtagQuery:(id)a3 foundItems:(id)a4;
- (void)mentionQuery:(id)a3 foundItems:(id)a4;
- (void)proofreadingQuery:(id)a3 foundItems:(id)a4;
- (void)q_needRecognitionUpdateWithCancel:(void *)result;
- (void)q_saveRecognitionSessionIfNecessary;
- (void)q_teardownSession;
- (void)q_updateRecognitionStateWithFinishedResult:(uint64_t)a1;
- (void)recognitionSessionDidUpdateRecognitionResult:(id)a3;
- (void)removeListener:(uint64_t)a1;
- (void)saveRecognitionSessionIfNecessary;
- (void)scheduleSaveRecognitionSession;
- (void)setAutoRefineViewDelegate:(uint64_t)a1;
- (void)setCalculateDocumentProvider:(uint64_t)a1;
- (void)setCanvasAttachmentProvider:(uint64_t)a1;
- (void)setDelegate:(uint64_t)a1;
- (void)setDrawing:(void *)a1;
- (void)setDrawing:(void *)a3 withVisibleOnscreenStrokes:;
- (void)setMentionSuffixes:(uint64_t)a1;
- (void)setState:(int64_t)a3;
- (void)setVisibleOnscreenStrokes:(uint64_t)a1;
- (void)setWantsAutoRefine:(uint64_t)a1;
- (void)setWantsDataDetection:(uint64_t)a1;
- (void)setWantsHashtagDetection:(uint64_t)a1;
- (void)setWantsMentionDetection:(uint64_t)a1;
- (void)setWantsProofreadingDetection:(uint64_t)a1;
- (void)setupForMath;
- (void)synthesizeDrawingForMathResultBlock:(void *)a3 fallbackText:(void *)a4 drawing:(void *)a5 mathItem:(void *)a6 inkColor:(void *)a7 inputScale:(double)a8 completion:;
- (void)synthesizeDrawingForReplacementText:(void *)a3 drawing:(void *)a4 strokes:(void *)a5 bounds:(CGFloat)a6 inputScale:(CGFloat)a7 completion:(CGFloat)a8;
- (void)synthesizeDrawingForText:(void *)a3 drawing:(double)a4 inkColor:(double)a5 inputScale:(double)a6 suggestedHeight:(double)a7 bounds:(double)a8 progress:(double)a9 completion:(uint64_t)a10;
- (void)synthesizeDrawingForText:(void *)a3 sourceDrawing:(void *)a4 originalBounds:(double)a5 fitInBounds:(double)a6 inputScale:(double)a7 completion:(double)a8;
- (void)tagAsActive;
- (void)tagAsIdle;
- (void)textInputDidChange:(id)a3;
- (void)textStrokesCoveredByStroke:(void *)a3 completion:;
- (void)updateWithRefinableStroke:(uint64_t)a1;
@end

@implementation PKRecognitionSessionManager

- (PKRecognitionSessionManager)init
{
  self;
  v3 = +[PKRecognitionSessionManagerConfiguration interactiveCanvasConfiguration]();
  v4 = -[PKRecognitionSessionManager initWithConfiguration:]((char *)self, v3);

  return (PKRecognitionSessionManager *)v4;
}

- (char)initWithConfiguration:(char *)a1
{
  v3 = a2;
  if (a1)
  {
    v23.receiver = a1;
    v23.super_class = (Class)PKRecognitionSessionManager;
    a1 = (char *)objc_msgSendSuper2(&v23, sel_init);
    if (a1)
    {
      v4 = os_log_create("com.apple.pencilkit", "RecognitionManager");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v22[0] = 0;
        _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Create manager.", (uint8_t *)v22, 2u);
      }

      if (v3) {
        BOOL v5 = v3[8] != 0;
      }
      else {
        BOOL v5 = 0;
      }
      a1[8] = v5;
      [a1 setState:0];
      a1[120] = 1;
      *(_DWORD *)(a1 + 121) = 0;
      *(_WORD *)(a1 + 125) = 0;
      v6 = (void *)*((void *)a1 + 18);
      *((void *)a1 + 18) = 0;

      uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      v8 = (void *)*((void *)a1 + 20);
      *((void *)a1 + 20) = v7;

      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v10 = dispatch_queue_create("com.apple.PencilKit.RecognitionManager", v9);
      v11 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v10;

      v12 = objc_alloc_init(PKHandwritingTranscriptionCache);
      v13 = (void *)*((void *)a1 + 12);
      *((void *)a1 + 12) = v12;

      v14 = objc_alloc_init(PKHandwritingTranscriptionCache);
      v15 = (void *)*((void *)a1 + 13);
      *((void *)a1 + 13) = v14;

      v16 = -[PKRecognitionQueryController initWithRecognitionSessionManager:]((id *)[PKRecognitionQueryController alloc], a1);
      v17 = (void *)*((void *)a1 + 16);
      *((void *)a1 + 16) = v16;

      if (v3)
      {
        if (v3[9])
        {
          uint64_t v18 = *((void *)a1 + 16);
          uint64_t v19 = objc_opt_class();
          if (v18) {
            [*(id *)(v18 + 32) setObject:v19 forKey:@"SmartSelection"];
          }
        }
      }
      v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v20 addObserver:a1 selector:sel_textInputDidChange_ name:@"TIPreferencesControllerChangedNotification" object:0];
    }
  }

  return a1;
}

- (void)dealloc
{
  v3 = os_log_create("com.apple.pencilkit", "RecognitionManager");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "Teardown", buf, 2u);
  }

  self->_isTearingDown = 1;
  observerWrapper = self->_observerWrapper;
  if (observerWrapper) {
    atomic_store(1u, (unsigned __int8 *)&observerWrapper->_deactivated);
  }
  BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  if (dispatch_queue_get_label(0) == "com.apple.PencilKit.RecognitionManager")
  {
    -[PKRecognitionSessionManager q_teardownSession]((uint64_t)self);
  }
  else
  {
    recognitionSessionQueue = self->_recognitionSessionQueue;
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    dispatch_queue_t v10 = __47__PKRecognitionSessionManager__teardownSession__block_invoke;
    v11 = &unk_1E64C5368;
    v12 = self;
    dispatch_sync(recognitionSessionQueue, buf);
  }
  v7.receiver = self;
  v7.super_class = (Class)PKRecognitionSessionManager;
  [(PKRecognitionSessionManager *)&v7 dealloc];
}

- (void)textStrokesCoveredByStroke:(void *)a3 completion:
{
  id v7 = a2;
  id v5 = a3;
  if (a1)
  {
    v6 = -[PKRecognitionSessionManager groupQuery](a1);
    [v6 textStrokesCoveredByStroke:v7 completion:v5];
  }
}

- (id)groupQuery
{
  if (a1)
  {
    uint64_t v4 = 0;
    id v5 = &v4;
    uint64_t v6 = 0x3032000000;
    id v7 = __Block_byref_object_copy__30;
    v8 = __Block_byref_object_dispose__30;
    id v9 = 0;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __41__PKRecognitionSessionManager_groupQuery__block_invoke;
    v3[3] = &unk_1E64C5848;
    v3[4] = a1;
    v3[5] = &v4;
    -[PKRecognitionSessionManager _dispatchSyncToRecognitionThreadIfNecessary:](a1, v3);
    id v1 = (id)v5[5];
    _Block_object_dispose(&v4, 8);
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

- (void)setDelegate:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v8 = v3;
    objc_storeWeak((id *)(a1 + 192), v3);
    if (objc_opt_respondsToSelector()) {
      char v4 = 2;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)(a1 + 184) = *(unsigned char *)(a1 + 184) & 0xFD | v4;
    if (objc_opt_respondsToSelector()) {
      char v5 = 4;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)(a1 + 184) = *(unsigned char *)(a1 + 184) & 0xFB | v5;
    if (objc_opt_respondsToSelector()) {
      char v6 = 8;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)(a1 + 184) = *(unsigned char *)(a1 + 184) & 0xF7 | v6;
    *(unsigned char *)(a1 + 184) = *(unsigned char *)(a1 + 184) & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v7 = 16;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)(a1 + 184) = *(unsigned char *)(a1 + 184) & 0xEF | v7;
    id v3 = v8;
  }
}

- (void)addListener:(uint64_t)a1
{
  id v3 = a2;
  char v4 = v3;
  if (a1)
  {
    char v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__PKRecognitionSessionManager_addListener___block_invoke;
    v6[3] = &unk_1E64C5870;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __43__PKRecognitionSessionManager_addListener___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 160) addObject:*(void *)(a1 + 40)];
}

- (void)removeListener:(uint64_t)a1
{
  id v3 = a2;
  char v4 = v3;
  if (a1)
  {
    char v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__PKRecognitionSessionManager_removeListener___block_invoke;
    v6[3] = &unk_1E64C5870;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __46__PKRecognitionSessionManager_removeListener___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 160) removeObject:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 160) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    -[PKRecognitionSessionManager q_teardownSession](v2);
  }
}

- (void)q_teardownSession
{
  if (a1)
  {
    uint64_t v2 = (unsigned __int8 *)*(id *)(a1 + 136);
    id v3 = v2;
    if (v2) {
      atomic_store(1u, v2 + 16);
    }
    char v4 = *(void **)(a1 + 136);
    *(void *)(a1 + 136) = 0;

    uint64_t v5 = *(void *)(a1 + 128);
    if (v5)
    {
      -[PKRecognitionQueryController clearVisibleStrokesQueries](*(void *)(a1 + 128));
      -[PKRecognitionQueryController clearDrawingQueries](v5);
    }
    -[PKRecognitionSessionManager q_saveRecognitionSessionIfNecessary](a1);
    char v6 = *(void **)(a1 + 152);
    if (v6)
    {
      -[PKAutoRefineTaskManager cancelAllTasks](v6);
      id v7 = *(void **)(a1 + 152);
      *(void *)(a1 + 152) = 0;
    }
    [*(id *)(a1 + 48) cancelOngoingRequests];
    [*(id *)(a1 + 48) setDataSource:0];
    id v8 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;

    id v9 = *(id *)(a1 + 48);
    dispatch_queue_t v10 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    if (v3)
    {
      if (v9)
      {
        v11 = dispatch_get_global_queue(17, 0);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __48__PKRecognitionSessionManager_q_teardownSession__block_invoke;
        v12[3] = &unk_1E64C5870;
        id v13 = v9;
        v14 = v3;
        dispatch_async(v11, v12);
      }
    }
  }
}

- (id)listeners
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__30;
  id v9 = __Block_byref_object_dispose__30;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__PKRecognitionSessionManager_listeners__block_invoke;
  v4[3] = &unk_1E64C5848;
  v4[4] = self;
  v4[5] = &v5;
  -[PKRecognitionSessionManager _dispatchSyncToRecognitionThreadIfNecessary:]((uint64_t)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __40__PKRecognitionSessionManager_listeners__block_invoke(uint64_t a1)
{
}

- (void)_dispatchSyncToRecognitionThreadIfNecessary:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (dispatch_queue_get_label(0) == "com.apple.PencilKit.RecognitionManager")
    {
      v3[2](v3);
    }
    else
    {
      char v4 = *(NSObject **)(a1 + 24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75__PKRecognitionSessionManager__dispatchSyncToRecognitionThreadIfNecessary___block_invoke;
      block[3] = &unk_1E64C5390;
      char v6 = v3;
      dispatch_sync(v4, block);
    }
  }
}

- (void)tagAsActive
{
  if (a1)
  {
    id v1 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PKRecognitionSessionManager_tagAsActive__block_invoke;
    block[3] = &unk_1E64C5368;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

uint64_t __42__PKRecognitionSessionManager_tagAsActive__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setActive];
}

- (void)tagAsIdle
{
  if (a1)
  {
    id v1 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__PKRecognitionSessionManager_tagAsIdle__block_invoke;
    block[3] = &unk_1E64C5368;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

uint64_t __40__PKRecognitionSessionManager_tagAsIdle__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setIdle];
}

- (void)cleanupSessionIfNecessary
{
  if (a1)
  {
    id v1 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PKRecognitionSessionManager_cleanupSessionIfNecessary__block_invoke;
    block[3] = &unk_1E64C5368;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __56__PKRecognitionSessionManager_cleanupSessionIfNecessary__block_invoke(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 160) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    -[PKRecognitionSessionManager q_teardownSession](v2);
  }
}

uint64_t __75__PKRecognitionSessionManager__dispatchSyncToRecognitionThreadIfNecessary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)session
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    char v6 = &v5;
    uint64_t v7 = 0x3032000000;
    id v8 = __Block_byref_object_copy__30;
    id v9 = __Block_byref_object_dispose__30;
    id v10 = 0;
    if (dispatch_queue_get_label(0) == "com.apple.PencilKit.RecognitionManager")
    {
      id v10 = *((id *)v1 + 6);
    }
    else
    {
      uint64_t v2 = *((void *)v1 + 3);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __38__PKRecognitionSessionManager_session__block_invoke;
      v4[3] = &unk_1E64C5848;
      v4[4] = v1;
      v4[5] = &v5;
      dispatch_sync(v2, v4);
    }
    id v1 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }

  return v1;
}

void __38__PKRecognitionSessionManager_session__block_invoke(uint64_t a1)
{
}

- (void)setState:(int64_t)a3
{
}

- (int64_t)state
{
  return atomic_load((unint64_t *)&self->_stateAtomic);
}

- (id)drawing
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    id v2 = v1[4];
    objc_sync_exit(v1);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (void)setDrawing:(void *)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    char v4 = a1;
    objc_sync_enter(v4);
    if ([v3 isEqual:v4[4]])
    {
      objc_sync_exit(v4);
    }
    else
    {
      uint64_t v5 = [v3 copy];
      char v6 = (void *)v4[4];
      v4[4] = v5;

      objc_sync_exit(v4);
      uint64_t v7 = os_log_create("com.apple.pencilkit", "RecognitionManager");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [v3 uuid];
        *(_DWORD *)buf = 138412290;
        v15 = v8;
        _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Drawing did change: %@", buf, 0xCu);
      }
      -[PKRecognitionSessionManager scheduleSaveRecognitionSession]((uint64_t)v4);
      id v9 = (void *)[v3 copy];
      id v10 = v4[3];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __42__PKRecognitionSessionManager_setDrawing___block_invoke;
      v12[3] = &unk_1E64C5870;
      void v12[4] = v4;
      id v13 = v9;
      id v11 = v9;
      dispatch_async(v10, v12);
    }
  }
}

- (void)scheduleSaveRecognitionSession
{
  if (a1 && *(unsigned char *)(a1 + 8))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__PKRecognitionSessionManager_scheduleSaveRecognitionSession__block_invoke;
    aBlock[3] = &unk_1E64C5368;
    aBlock[4] = a1;
    id v1 = (void (**)(void))_Block_copy(aBlock);
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v1[2](v1);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v1);
    }
  }
}

void __42__PKRecognitionSessionManager_setDrawing___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  if (v3 && *(void *)(a1 + 40))
  {
    char v4 = [v3 uuid];
    uint64_t v5 = [*(id *)(a1 + 40) uuid];
    int v6 = [v4 isEqual:v5] ^ 1;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    int v6 = 0;
  }
  objc_storeStrong((id *)(v2 + 40), *(id *)(a1 + 40));
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 112);
  *(void *)(v7 + 112) = 0;

  if (*(void *)(a1 + 40))
  {
    if (v6)
    {
      id v9 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, "Drawing UUID changed in setDrawing.", v11, 2u);
      }
    }
    -[PKRecognitionSessionManager q_createRecognitionSessionIfNecessary](*(void *)(a1 + 32));
    -[PKRecognitionSessionManager q_needRecognitionUpdateWithCancel:](*(void **)(a1 + 32));
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    -[PKRecognitionSessionManager q_teardownSession](v10);
  }
}

- (uint64_t)q_createRecognitionSessionIfNecessary
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  if (*(void *)(result + 48)) {
    return result;
  }
  uint64_t v2 = [*(id *)(result + 40) uuid];
  if (v2)
  {
    int v3 = *(unsigned __int8 *)(v1 + 8);

    if (v3)
    {
      char v4 = [*(id *)(v1 + 40) uuid];
      uint64_t v5 = PKLoadRecognitionSession(v4);
      int v6 = *(void **)(v1 + 48);
      *(void *)(v1 + 48) = v5;

      uint64_t v7 = os_log_create("com.apple.pencilkit", "RecognitionManager");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [*(id *)(v1 + 40) uuid];
        id v9 = [v8 uniqueCacheFilePath];
        BOOL v10 = *(void *)(v1 + 48) != 0;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v10;
        _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Loading session cache for: %@, success: %{BOOL}d", buf, 0x12u);
      }
      if (!*(void *)(v1 + 48)) {
        goto LABEL_10;
      }
      [(id)v1 setState:3];
    }
  }
  if (!*(void *)(v1 + 48))
  {
LABEL_10:
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F5C068]) initWithMode:0];
    v12 = *(void **)(v1 + 48);
    *(void *)(v1 + 48) = v11;

    if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
    {
      id v13 = *(void **)(v1 + 48);
      uint64_t v29 = *MEMORY[0x1E4F5BFD0];
      v30 = @"! &() + , - . / 0 1 2 3 4 5 6 7 8 9 : = [ \\\\ \\ \\$ \\% \\arccos \\arcsin \\arctan \\ast \\cdot \\circ \\cos \\cosh \\cot \\coth \\csc \\div \\frac \\hline \\lceil \\left( \\left. \\left\\lceil \\left\\lfloor \\left| \\lfloor \\lg \\ln \\log \\pi \\prime \\rceil \\rfloor \\right) \\right. \\right\\rceil \\right\\rfloor \\right| \\sec \\sin \\sinh \\sqrt \\tan \\tanh \\times ] ^ _ a A b B c C d D e E f F g G H h i I j J k K L l m M n N o O p P q Q r R s S t T u U v V w W x X y Y z Z { | } \\begin{array}{lr} \\end{array}";
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      [v13 updateRecognitionOptions:v14];
    }
  }
  uint64_t v15 = [*(id *)(v1 + 48) textSynthesizer];
  uint64_t v16 = *(void **)(v1 + 64);
  *(void *)(v1 + 64) = v15;

  v17 = [(id)objc_opt_class() enabledLocales];
  [*(id *)(v1 + 48) setPreferredLocales:v17];

  if ((objc_opt_respondsToSelector() & 1) != 0
    && [*(id *)(v1 + 48) textSynthesizerWithLocaleFallbackIsSupported])
  {
    uint64_t v18 = [*(id *)(v1 + 48) textSynthesizerWithLocaleFallback];
    uint64_t v19 = *(void **)(v1 + 56);
    *(void *)(v1 + 56) = v18;
  }
  [*(id *)(v1 + 48) setDataSource:v1];
  if (*(void *)(v1 + 48) && !*(void *)(v1 + 152))
  {
    v20 = objc_alloc_init(PKAutoRefineTaskManager);
    v21 = *(void **)(v1 + 152);
    *(void *)(v1 + 152) = v20;

    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 200));
    uint64_t v23 = *(void *)(v1 + 152);
    if (v23) {
      objc_storeWeak((id *)(v23 + 32), WeakRetained);
    }
  }
  v24 = [PKRecognitionSessionObserverWrapper alloc];
  v25 = (PKRecognitionSessionObserverWrapper **)(id)v1;
  if (v24)
  {
    *(void *)buf = v24;
    *(void *)&uint8_t buf[8] = PKRecognitionSessionObserverWrapper;
    v26 = (PKRecognitionSessionObserverWrapper *)objc_msgSendSuper2((objc_super *)buf, sel_init);
    v24 = v26;
    if (v26)
    {
      objc_storeWeak((id *)&v26->_realObserver, v25);
      atomic_store(0, (unsigned __int8 *)&v24->_deactivated);
    }
  }

  v28 = v25[17];
  v27 = v25 + 17;
  *v27 = v24;

  return [*(id *)(v1 + 48) registerChangeObserver:*v27];
}

- (void)q_needRecognitionUpdateWithCancel:(void *)result
{
  if (result)
  {
    uint64_t v1 = result;
    if ([result state] != 3)
    {
      [*((id *)v1 + 6) cancelOngoingRequests];
      -[PKRecognitionQueryController setupVisibleStrokesQueries](*((void *)v1 + 16));
      uint64_t v2 = os_log_create("com.apple.pencilkit", "RecognitionManager");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v3 = 0;
        _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Cancel the ongoing requests", v3, 2u);
      }
    }
    return (void *)[*((id *)v1 + 6) setNeedsRecognitionUpdate];
  }
  return result;
}

- (void)setCalculateDocumentProvider:(uint64_t)a1
{
  id v3 = a2;
  char v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__PKRecognitionSessionManager_setCalculateDocumentProvider___block_invoke;
    v6[3] = &unk_1E64C5870;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __60__PKRecognitionSessionManager_setCalculateDocumentProvider___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 40);
  unint64_t v3 = (unint64_t)*(id *)(*(void *)(a1 + 32) + 80);
  unint64_t v4 = v2;
  uint64_t v5 = (void *)v4;
  if (v3 | v4)
  {
    if (v3) {
      BOOL v7 = v4 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      int v6 = 0;
    }
    else {
      int v6 = [(id)v3 isEqual:v4];
    }
  }
  else
  {
    int v6 = 1;
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
  id v8 = os_log_create("com.apple.pencilkit", "Math");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(a1 + 40) recognizedExpressions];
    uint64_t v10 = [v9 count];
    uint64_t v11 = [*(id *)(a1 + 40) declaredVariables];
    int v12 = 134218496;
    uint64_t v13 = v10;
    __int16 v14 = 2048;
    uint64_t v15 = [v11 count];
    __int16 v16 = 1024;
    int v17 = v6 ^ 1;
    _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "Calculate document provider changed: %lu, %lu, did change: %{BOOL}d", (uint8_t *)&v12, 0x1Cu);
  }
  if ((v6 & 1) == 0) {
    -[PKRecognitionSessionManager q_needRecognitionUpdateWithCancel:](*(void **)(a1 + 32));
  }
}

- (void)setCanvasAttachmentProvider:(uint64_t)a1
{
  id v3 = a2;
  unint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__PKRecognitionSessionManager_setCanvasAttachmentProvider___block_invoke;
    v6[3] = &unk_1E64C5870;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __59__PKRecognitionSessionManager_setCanvasAttachmentProvider___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 40);
  unint64_t v3 = (unint64_t)*(id *)(*(void *)(a1 + 32) + 88);
  unint64_t v4 = v2;
  uint64_t v5 = (void *)v4;
  if (v3 | v4)
  {
    if (v3) {
      BOOL v7 = v4 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      int v6 = 0;
    }
    else {
      int v6 = [(id)v3 isEqual:v4];
    }
  }
  else
  {
    int v6 = 1;
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 40));
  id v8 = os_log_create("com.apple.pencilkit", "generative");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [*(id *)(a1 + 40) attachments];
    int v10 = 134218240;
    uint64_t v11 = [v9 count];
    __int16 v12 = 1024;
    int v13 = v6 ^ 1;
    _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "Canvas attachment provider changed: %lu, did change: %{BOOL}d", (uint8_t *)&v10, 0x12u);
  }
}

- (void)setDrawing:(void *)a3 withVisibleOnscreenStrokes:
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = v6;
  if (a1)
  {
    id v8 = (void *)[v6 copy];
    id v9 = a1;
    objc_sync_enter(v9);
    char v10 = [v5 isEqual:v9[4]];
    if ((v10 & 1) == 0)
    {
      uint64_t v11 = [v5 copy];
      __int16 v12 = (void *)v9[4];
      v9[4] = v11;
    }
    objc_sync_exit(v9);

    int v13 = (void *)[v5 copy];
    char v14 = v10 ^ 1;
    uint64_t v15 = v9[3];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__PKRecognitionSessionManager_setDrawing_withVisibleOnscreenStrokes___block_invoke;
    v18[3] = &unk_1E64C5EC0;
    v18[4] = v9;
    id v19 = v13;
    id v20 = v8;
    char v21 = v14;
    id v16 = v8;
    id v17 = v13;
    dispatch_async(v15, v18);
  }
}

void __69__PKRecognitionSessionManager_setDrawing_withVisibleOnscreenStrokes___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void **)(v2 + 40);
  if (v3 && *(void *)(a1 + 40))
  {
    unint64_t v4 = [v3 uuid];
    id v5 = [*(id *)(a1 + 40) uuid];
    int v6 = [v4 isEqual:v5] ^ 1;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    int v6 = 0;
  }
  objc_storeStrong((id *)(v2 + 40), *(id *)(a1 + 40));
  BOOL v7 = drawingStrokesFromStrokes(*(void **)(a1 + 48), *(void **)(a1 + 40));
  BOOL v8 = ([v7 isEqualToArray:*(void *)(*(void *)(a1 + 32) + 112)] & 1) == 0
    && [*(id *)(a1 + 32) state] != 3;
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(void *)(v9 + 40)) {
    id v10 = v7;
  }
  else {
    id v10 = 0;
  }
  uint64_t v11 = *(void **)(v9 + 112);
  *(void *)(v9 + 112) = v10;

  if (*(void *)(a1 + 40))
  {
    if (*(unsigned char *)(a1 + 56)) {
      int v12 = 1;
    }
    else {
      int v12 = v8;
    }
    if (v12 == 1)
    {
      int v13 = os_log_create("com.apple.pencilkit", "RecognitionManager");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        char v14 = [*(id *)(*(void *)(a1 + 32) + 40) uuid];
        int v16 = 138412290;
        id v17 = v14;
        _os_log_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEFAULT, "Drawing or visible strokes did change: %@", (uint8_t *)&v16, 0xCu);
      }
      -[PKRecognitionSessionManager scheduleSaveRecognitionSession](*(void *)(a1 + 32));
      if (v6)
      {
        uint64_t v15 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEFAULT, "Drawing UUID changed in setDrawing:withVisibleOnscreenStrokes:", (uint8_t *)&v16, 2u);
        }
      }
      -[PKRecognitionSessionManager q_createRecognitionSessionIfNecessary](*(void *)(a1 + 32));
      -[PKRecognitionSessionManager q_needRecognitionUpdateWithCancel:](*(void **)(a1 + 32));
    }
  }
  else
  {
    -[PKRecognitionSessionManager q_teardownSession](*(void *)(a1 + 32));
  }
}

- (void)setVisibleOnscreenStrokes:(uint64_t)a1
{
  id v3 = a2;
  unint64_t v4 = v3;
  if (a1)
  {
    id v5 = (void *)[v3 copy];
    int v6 = *(NSObject **)(a1 + 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__PKRecognitionSessionManager_setVisibleOnscreenStrokes___block_invoke;
    v8[3] = &unk_1E64C5870;
    v8[4] = a1;
    id v9 = v5;
    id v7 = v5;
    dispatch_async(v6, v8);
  }
}

void __57__PKRecognitionSessionManager_setVisibleOnscreenStrokes___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  id v3 = drawingStrokesFromStrokes(*(void **)(a1 + 40), *(void **)(*(void *)(a1 + 32) + 40));
  char v4 = [v3 isEqualToArray:*(void *)(*(void *)v2 + 112)];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), v3);
  if ([*(id *)(a1 + 32) state] == 3) {
    char v5 = 1;
  }
  else {
    char v5 = v4;
  }
  if ((v5 & 1) == 0)
  {
    int v6 = os_log_create("com.apple.pencilkit", "RecognitionManager");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(*(void *)(a1 + 32) + 40) uuid];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "Visible strokes did change: %@", (uint8_t *)&v8, 0xCu);
    }
    -[PKRecognitionSessionManager scheduleSaveRecognitionSession](*(void *)(a1 + 32));
    -[PKRecognitionSessionManager q_needRecognitionUpdateWithCancel:](*(void **)(a1 + 32));
  }
}

void __53__PKRecognitionSessionManager_setWantsTranscription___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 125) != v2)
  {
    *(unsigned char *)(v1 + 125) = v2;
    int v4 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    if (v4)
    {
      -[PKRecognitionSessionManager q_createRecognitionSessionIfNecessary](v5);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 128);
      uint64_t v7 = objc_opt_class();
      if (v6) {
        [*(id *)(v6 + 32) setObject:v7 forKey:@"Transcription"];
      }
      int v8 = *(void **)(a1 + 32);
      id v9 = (id *)v8[16];
      uint64_t v10 = [v8 state];
      -[PKRecognitionQueryController updateQueriesIfNecessaryWithState:](v9, v10);
    }
    else
    {
      uint64_t v11 = *(id **)(v5 + 128);
      -[PKRecognitionQueryController removeQueryWithIdentifier:](v11, @"Transcription");
    }
  }
}

- (void)setWantsAutoRefine:(uint64_t)a1
{
  if (a1)
  {
    int v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __50__PKRecognitionSessionManager_setWantsAutoRefine___block_invoke;
    v3[3] = &unk_1E64C6618;
    v3[4] = a1;
    char v4 = a2;
    dispatch_async(v2, v3);
  }
}

void __50__PKRecognitionSessionManager_setWantsAutoRefine___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 126) != v2)
  {
    *(unsigned char *)(v1 + 126) = v2;
    int v4 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    if (v4)
    {
      -[PKRecognitionSessionManager q_createRecognitionSessionIfNecessary](v5);
      if (!*(void *)(*(void *)(a1 + 32) + 144))
      {
        uint64_t v6 = [[PKAutoRefineQuery alloc] initWithRecognitionSessionManager:*(void *)(a1 + 32)];
        uint64_t v7 = os_log_create("com.apple.pencilkit", "RecognitionManager");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)uint64_t v11 = 0;
          _os_log_debug_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEBUG, "PKAutoRefineQuery created", v11, 2u);
        }

        [(PKQuery *)v6 setDelegate:*(void *)(a1 + 32)];
        if (v6) {
          objc_storeWeak((id *)&v6->_autoRefineDelegate, *(id *)(a1 + 32));
        }
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 144), v6);
        [*(id *)(*(void *)(a1 + 32) + 144) start];
      }
    }
    else
    {
      if (*(void *)(v5 + 144))
      {
        [*(id *)(v5 + 144) pause];
        [*(id *)(*(void *)(a1 + 32) + 144) teardown];
        uint64_t v8 = *(void *)(a1 + 32);
        id v9 = *(void **)(v8 + 144);
        *(void *)(v8 + 144) = 0;

        uint64_t v5 = *(void *)(a1 + 32);
      }
      uint64_t v10 = *(void **)(v5 + 152);
      -[PKAutoRefineTaskManager cancelAllTasks](v10);
    }
  }
}

- (void)setWantsDataDetection:(uint64_t)a1
{
  if (a1)
  {
    int v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __53__PKRecognitionSessionManager_setWantsDataDetection___block_invoke;
    v3[3] = &unk_1E64C6618;
    v3[4] = a1;
    char v4 = a2;
    dispatch_async(v2, v3);
  }
}

void __53__PKRecognitionSessionManager_setWantsDataDetection___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 121) != v2)
  {
    *(unsigned char *)(v1 + 121) = v2;
    int v4 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    if (v4)
    {
      -[PKRecognitionSessionManager q_createRecognitionSessionIfNecessary](v5);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 128);
      uint64_t v7 = objc_opt_class();
      if (v6) {
        [*(id *)(v6 + 32) setObject:v7 forKey:@"DataDetectors"];
      }
      uint64_t v8 = *(void **)(a1 + 32);
      id v9 = (id *)v8[16];
      uint64_t v10 = [v8 state];
      -[PKRecognitionQueryController updateQueriesIfNecessaryWithState:](v9, v10);
    }
    else
    {
      uint64_t v11 = *(id **)(v5 + 128);
      -[PKRecognitionQueryController removeQueryWithIdentifier:](v11, @"DataDetectors");
    }
  }
}

- (void)setWantsHashtagDetection:(uint64_t)a1
{
  if (a1)
  {
    int v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __56__PKRecognitionSessionManager_setWantsHashtagDetection___block_invoke;
    v3[3] = &unk_1E64C6618;
    v3[4] = a1;
    char v4 = a2;
    dispatch_async(v2, v3);
  }
}

void __56__PKRecognitionSessionManager_setWantsHashtagDetection___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 122) != v2)
  {
    *(unsigned char *)(v1 + 122) = v2;
    int v4 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    if (v4)
    {
      -[PKRecognitionSessionManager q_createRecognitionSessionIfNecessary](v5);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 128);
      uint64_t v7 = objc_opt_class();
      if (v6) {
        [*(id *)(v6 + 32) setObject:v7 forKey:@"Hashtags"];
      }
      uint64_t v8 = *(void **)(a1 + 32);
      id v9 = (id *)v8[16];
      uint64_t v10 = [v8 state];
      -[PKRecognitionQueryController updateQueriesIfNecessaryWithState:](v9, v10);
    }
    else
    {
      uint64_t v11 = *(id **)(v5 + 128);
      -[PKRecognitionQueryController removeQueryWithIdentifier:](v11, @"Hashtags");
    }
  }
}

- (void)setWantsMentionDetection:(uint64_t)a1
{
  if (a1)
  {
    int v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __56__PKRecognitionSessionManager_setWantsMentionDetection___block_invoke;
    v3[3] = &unk_1E64C6618;
    v3[4] = a1;
    char v4 = a2;
    dispatch_async(v2, v3);
  }
}

void __56__PKRecognitionSessionManager_setWantsMentionDetection___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 123) != v2)
  {
    *(unsigned char *)(v1 + 123) = v2;
    int v4 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    if (v4)
    {
      -[PKRecognitionSessionManager q_createRecognitionSessionIfNecessary](v5);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 128);
      uint64_t v7 = objc_opt_class();
      if (v6) {
        [*(id *)(v6 + 32) setObject:v7 forKey:@"Mentions"];
      }
      -[PKRecognitionQueryController setSuffixes:forQueryWithIdentifier:](*(void *)(*(void *)(a1 + 32) + 128), *(void **)(*(void *)(a1 + 32) + 208), @"Mentions");
      uint64_t v8 = *(void **)(a1 + 32);
      id v9 = (id *)v8[16];
      uint64_t v10 = [v8 state];
      -[PKRecognitionQueryController updateQueriesIfNecessaryWithState:](v9, v10);
    }
    else
    {
      uint64_t v11 = *(id **)(v5 + 128);
      -[PKRecognitionQueryController removeQueryWithIdentifier:](v11, @"Mentions");
    }
  }
}

- (void)setWantsProofreadingDetection:(uint64_t)a1
{
  if (a1)
  {
    if (a2) {
      BOOL v3 = CHGetPersonalizedSynthesisSupportState() > 2;
    }
    else {
      BOOL v3 = 0;
    }
    int v4 = *(NSObject **)(a1 + 24);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __61__PKRecognitionSessionManager_setWantsProofreadingDetection___block_invoke;
    v5[3] = &unk_1E64C6618;
    v5[4] = a1;
    BOOL v6 = v3;
    dispatch_async(v4, v5);
  }
}

void __61__PKRecognitionSessionManager_setWantsProofreadingDetection___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 124) != v2)
  {
    *(unsigned char *)(v1 + 124) = v2;
    int v4 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    if (v4)
    {
      -[PKRecognitionSessionManager q_createRecognitionSessionIfNecessary](v5);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 128);
      uint64_t v7 = objc_opt_class();
      if (v6) {
        [*(id *)(v6 + 32) setObject:v7 forKey:@"Proofreading"];
      }
      uint64_t v8 = *(void **)(a1 + 32);
      id v9 = (id *)v8[16];
      uint64_t v10 = [v8 state];
      -[PKRecognitionQueryController updateQueriesIfNecessaryWithState:](v9, v10);
    }
    else
    {
      uint64_t v11 = *(id **)(v5 + 128);
      -[PKRecognitionQueryController removeQueryWithIdentifier:](v11, @"Proofreading");
    }
  }
}

void __47__PKRecognitionSessionManager__teardownSession__block_invoke(uint64_t a1)
{
}

uint64_t __61__PKRecognitionSessionManager_scheduleSaveRecognitionSession__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__PKRecognitionSessionManager_cancelSaveRecognitionSession__block_invoke;
    aBlock[3] = &unk_1E64C5368;
    aBlock[4] = v1;
    BOOL v3 = (void (**)(void))_Block_copy(aBlock);
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v3[2](v3);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v3);
    }

    int v4 = *(void **)(a1 + 32);
  }
  else
  {
    int v4 = 0;
  }

  return [v4 performSelector:sel_saveRecognitionSessionIfNecessary withObject:0 afterDelay:5.0];
}

uint64_t __59__PKRecognitionSessionManager_cancelSaveRecognitionSession__block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel_saveRecognitionSessionIfNecessary object:0];
}

- (void)saveRecognitionSessionIfNecessary
{
  if (self->_shouldLoadAndSaveSession)
  {
    recognitionSessionQueue = self->_recognitionSessionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PKRecognitionSessionManager_saveRecognitionSessionIfNecessary__block_invoke;
    block[3] = &unk_1E64C5368;
    void block[4] = self;
    dispatch_async(recognitionSessionQueue, block);
  }
}

void __64__PKRecognitionSessionManager_saveRecognitionSessionIfNecessary__block_invoke(uint64_t a1)
{
}

- (void)q_saveRecognitionSessionIfNecessary
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ([(id)a1 state] == 3)
    {
      if (*(unsigned char *)(a1 + 8))
      {
        int v2 = *(void **)(a1 + 48);
        if (v2)
        {
          BOOL v3 = [*(id *)(a1 + 40) uuid];
          int v4 = PKSaveRecognitionSession(v2, v3);

          uint64_t v5 = os_log_create("com.apple.pencilkit", "RecognitionManager");
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v6 = [*(id *)(a1 + 40) uuid];
            uint64_t v7 = [v6 uniqueCacheFilePath];
            int v8 = 138412546;
            id v9 = v7;
            __int16 v10 = 1024;
            int v11 = v4;
            _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Save session cache for: %@, success: %{BOOL}d", (uint8_t *)&v8, 0x12u);
          }
        }
      }
    }
  }
}

uint64_t __48__PKRecognitionSessionManager_q_teardownSession__block_invoke(uint64_t a1)
{
  int v2 = os_log_create("com.apple.pencilkit", "RecognitionManager");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Delayed removing observer when tearing down.", v4, 2u);
  }

  return [*(id *)(a1 + 32) unregisterChangeObserver:*(void *)(a1 + 40)];
}

- (id)calculateDocumentProviderSnapshot
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__30;
  int v16 = __Block_byref_object_dispose__30;
  id v17 = 0;
  if (dispatch_queue_get_label(0) == "com.apple.PencilKit.RecognitionManager")
  {
    id v17 = self->q_calculateDocumentProvider;
  }
  else
  {
    recognitionSessionQueue = self->_recognitionSessionQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__PKRecognitionSessionManager_calculateDocumentProviderSnapshot__block_invoke;
    v11[3] = &unk_1E64C5848;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(recognitionSessionQueue, v11);
  }
  int v4 = os_log_create("com.apple.pencilkit", "RecognitionManager");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(id)v13[5] recognizedExpressions];
    uint64_t v6 = [v5 count];
    uint64_t v7 = [(id)v13[5] declaredVariables];
    uint64_t v8 = [v7 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v19 = v6;
    __int16 v20 = 2048;
    uint64_t v21 = v8;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Providing  a calculate document provider with %lu expressions and %lu variables.", buf, 0x16u);
  }
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __64__PKRecognitionSessionManager_calculateDocumentProviderSnapshot__block_invoke(uint64_t a1)
{
}

- (id)canvasAttachmentProviderSnapshot
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x3032000000;
  int v13 = __Block_byref_object_copy__30;
  uint64_t v14 = __Block_byref_object_dispose__30;
  uint64_t v15 = 0;
  if (dispatch_queue_get_label(0) == "com.apple.PencilKit.RecognitionManager")
  {
    uint64_t v15 = self->q_canvasAttachmentProvider;
  }
  else
  {
    recognitionSessionQueue = self->_recognitionSessionQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__PKRecognitionSessionManager_canvasAttachmentProviderSnapshot__block_invoke;
    v9[3] = &unk_1E64C5848;
    v9[4] = self;
    v9[5] = &v10;
    dispatch_sync(recognitionSessionQueue, v9);
  }
  int v4 = os_log_create("com.apple.pencilkit", "RecognitionManager");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(id)v11[5] attachments];
    uint64_t v6 = [v5 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = v6;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Providing a canvas attachment provider with %lu attachments.", buf, 0xCu);
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __63__PKRecognitionSessionManager_canvasAttachmentProviderSnapshot__block_invoke(uint64_t a1)
{
}

- (id)directStrokeProviderSnapshot
{
  if (a1)
  {
    a1 = [a1 strokeProviderSnapshot];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)strokeProviderSnapshot
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__30;
  int v11 = __Block_byref_object_dispose__30;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__PKRecognitionSessionManager_strokeProviderSnapshot__block_invoke;
  v6[3] = &unk_1E64C7628;
  v6[4] = self;
  void v6[5] = &v7;
  BOOL v3 = (void (**)(void))_Block_copy(v6);
  if (dispatch_queue_get_label(0) == "com.apple.PencilKit.RecognitionManager") {
    v3[2](v3);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->_recognitionSessionQueue, v3);
  }
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);

  return v4;
}

void __53__PKRecognitionSessionManager_strokeProviderSnapshot__block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  int v2 = os_log_create("com.apple.pencilkit", "RecognitionManager");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 112) count];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 40);
    if (*(void *)(v4 + 112)) {
      uint64_t v6 = @"YES";
    }
    else {
      uint64_t v6 = @"NO";
    }
    *(_DWORD *)buf = 134218498;
    uint64_t v48 = v3;
    __int16 v49 = 2112;
    uint64_t v50 = v5;
    __int16 v51 = 2112;
    v52 = v6;
    _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Providing  a strokeProviderSnapshot with %lu visible strokes and with drawing: %@.  Processing only visible strokes: %@", buf, 0x20u);
  }

  -[PKRecognitionSessionManager q_updateRecognitionStateWithFinishedResult:](*(void *)(a1 + 32), 0);
  BOOL v7 = [*(id *)(a1 + 32) state] == 3 || objc_msgSend(*(id *)(a1 + 32), "state") == 2;
  uint64_t v8 = [[PKStrokeProvider alloc] initWithDrawing:*(void *)(*(void *)(a1 + 32) + 40) visibleOnscreenStrokes:*(void *)(*(void *)(a1 + 32) + 112) shouldProcessVisibleStrokes:!v7 transcriptionCache:*(void *)(*(void *)(a1 + 32) + 96)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v29 = [*(id *)(*(void *)(a1 + 32) + 104) allCachedGroups];
  if ([v29 count])
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obuint64_t j = v29;
    uint64_t v25 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v25)
    {
      char v24 = 0;
      uint64_t v26 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v41 != v26) {
            objc_enumerationMutation(obj);
          }
          int v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v12 = [MEMORY[0x1E4F1CA80] set];
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v30 = v11;
          uint64_t v13 = [v30 countByEnumeratingWithState:&v36 objects:v45 count:16];
          if (v13)
          {
            uint64_t v31 = *(void *)v37;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v37 != v31) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v15 = *(void *)(*((void *)&v36 + 1) + 8 * j);
                long long v32 = 0u;
                long long v33 = 0u;
                long long v34 = 0u;
                long long v35 = 0u;
                int v16 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) orderedStrokes];
                uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v44 count:16];
                if (v17)
                {
                  uint64_t v18 = *(void *)v33;
                  do
                  {
                    for (uint64_t k = 0; k != v17; ++k)
                    {
                      if (*(void *)v33 != v18) {
                        objc_enumerationMutation(v16);
                      }
                      __int16 v20 = *(void **)(*((void *)&v32 + 1) + 8 * k);
                      if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isStroke:v20 versionOfStrokeWithIdentifier:v15])
                      {
                        uint64_t v21 = [v20 strokeIdentifier];
                        [v12 addObject:v21];
                      }
                    }
                    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v44 count:16];
                  }
                  while (v17);
                }
              }
              uint64_t v13 = [v30 countByEnumeratingWithState:&v36 objects:v45 count:16];
            }
            while (v13);
          }

          uint64_t v22 = [v12 count];
          if (v22 == [v30 count])
          {
            uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 104) cachedTranscriptionForStrokeGroup:v30];
            [*(id *)(*(void *)(a1 + 32) + 96) addCachedTranscription:v23 forStrokeGroup:v12];

            char v24 = 1;
          }
          if ([v12 count]) {
            [*(id *)(*(void *)(a1 + 32) + 104) clearCacheForStrokeGroup:v30];
          }
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v25);

      if (v24) {
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) updateTranscriptionCache:*(void *)(*(void *)(a1 + 32) + 96)];
      }
    }
    else
    {
    }
  }
}

- (void)q_updateRecognitionStateWithFinishedResult:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if ([(id)a1 state] == 3) {
    goto LABEL_3;
  }
  if ([(id)a1 state] || !*(void *)(a1 + 112))
  {
    if ([(id)a1 state] == 1 || !*(void *)(a1 + 112))
    {
      if ([(id)a1 state] != 1
        || (id v12 = *(void **)(a1 + 112),
            [*(id *)(a1 + 40) strokes],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            LODWORD(v12) = [v12 isEqualToArray:v13],
            v13,
            !v12))
      {
        [(id)a1 setState:2];
        uint64_t v15 = os_log_create("com.apple.pencilkit", "RecognitionManager");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = *(void **)(a1 + 40);
          uint64_t v17 = [v16 strokes];
          *(_DWORD *)buf = 138412802;
          uint64_t v29 = (uint64_t)v16;
          __int16 v30 = 2048;
          uint64_t v31 = [v17 count];
          __int16 v32 = 2112;
          uint64_t v33 = a1;
          _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEFAULT, "State Update: Starting to process a stroke provider with the full drawing %@ with %lu strokes with manager %@", buf, 0x20u);
        }
        goto LABEL_27;
      }
      uint64_t v14 = os_log_create("com.apple.pencilkit", "RecognitionManager");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_DEFAULT, "Visible onscreen strokes are equal to those in the drawing, skip reprocessing", buf, 2u);
      }
    }
    else if ([(id)a1 state] != 2 || (a2 & 1) == 0)
    {
      [(id)a1 setState:0];
      goto LABEL_25;
    }
LABEL_3:
    [(id)a1 setState:3];
    [*(id *)(a1 + 72) timeIntervalSinceNow];
    uint64_t v5 = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v7 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = v6;

    uint64_t v8 = os_log_create("com.apple.pencilkit", "RecognitionManager");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void **)(a1 + 40);
      uint64_t v10 = [v9 strokes];
      uint64_t v11 = [v10 count];
      *(_DWORD *)buf = 138413058;
      uint64_t v29 = (uint64_t)v9;
      __int16 v30 = 2048;
      uint64_t v31 = v11;
      __int16 v32 = 2112;
      uint64_t v33 = a1;
      __int16 v34 = 2048;
      uint64_t v35 = v5;
      _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "State Update: Finished processing drawing %@ with %lu strokes with manager %@ in %.2fs", buf, 0x2Au);
    }
    -[PKRecognitionQueryController setupDrawingQueriesIfNecessary](*(id **)(a1 + 128));
    -[PKRecognitionQueryController clearVisibleStrokesQueries](*(void *)(a1 + 128));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PKRecognitionSessionManager_q_updateRecognitionStateWithFinishedResult___block_invoke;
    block[3] = &unk_1E64C5368;
    void block[4] = a1;
    dispatch_async(MEMORY[0x1E4F14428], block);
    return;
  }
  [(id)a1 setState:a2];
  if ((a2 & 1) == 0)
  {
LABEL_25:
    uint64_t v15 = os_log_create("com.apple.pencilkit", "RecognitionManager");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [*(id *)(a1 + 112) count];
      *(_DWORD *)buf = 134218242;
      uint64_t v29 = v24;
      __int16 v30 = 2112;
      uint64_t v31 = a1;
      _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEFAULT, "State Update: Starting to process a stroke provider with just %lu visible strokes with manager: %@", buf, 0x16u);
    }
LABEL_27:

    uint64_t v25 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v26 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = v25;

    return;
  }
  [*(id *)(a1 + 72) timeIntervalSinceNow];
  uint64_t v19 = v18;
  uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v21 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = v20;

  uint64_t v22 = os_log_create("com.apple.pencilkit", "RecognitionManager");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [*(id *)(a1 + 112) count];
    *(_DWORD *)buf = 134218498;
    uint64_t v29 = v23;
    __int16 v30 = 2112;
    uint64_t v31 = a1;
    __int16 v32 = 2048;
    uint64_t v33 = v19;
    _os_log_impl(&dword_1C44F8000, v22, OS_LOG_TYPE_DEFAULT, "State Update: Finished processing %lu visible strokes with manager: %@ in %.2fs", buf, 0x20u);
  }

  [*(id *)(a1 + 48) setNeedsRecognitionUpdate];
}

void __74__PKRecognitionSessionManager_q_updateRecognitionStateWithFinishedResult___block_invoke(uint64_t a1)
{
}

- (void)textInputDidChange:(id)a3
{
  -[PKRecognitionSessionManager session](self);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)objc_opt_class() enabledLocales];
  [v4 setPreferredLocales:v3];
}

- (void)setAutoRefineViewDelegate:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    objc_storeWeak((id *)(a1 + 200), v3);
    id v3 = v6;
    if (*(void *)(a1 + 152))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 200));
      uint64_t v5 = *(void *)(a1 + 152);
      if (v5) {
        objc_storeWeak((id *)(v5 + 32), WeakRetained);
      }

      id v3 = v6;
    }
  }
}

- (void)setMentionSuffixes:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && ([*(id *)(a1 + 208) isEqual:v3] & 1) == 0)
  {
    id v4 = (void *)[v3 copy];
    objc_storeStrong((id *)(a1 + 208), v4);
    uint64_t v5 = *(NSObject **)(a1 + 24);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__PKRecognitionSessionManager_setMentionSuffixes___block_invoke;
    v7[3] = &unk_1E64C5870;
    v7[4] = a1;
    id v8 = v4;
    id v6 = v4;
    dispatch_async(v5, v7);
  }
}

void __50__PKRecognitionSessionManager_setMentionSuffixes___block_invoke(uint64_t a1)
{
}

- (void)setupForMath
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PKRecognitionSessionManager_setupForMath__block_invoke;
    block[3] = &unk_1E64C5368;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __43__PKRecognitionSessionManager_setupForMath__block_invoke(uint64_t a1, const char *a2)
{
}

- (void)fetchCurrentStrokeGroupItems:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__PKRecognitionSessionManager_fetchCurrentStrokeGroupItems___block_invoke;
    v6[3] = &unk_1E64C5E48;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __60__PKRecognitionSessionManager_fetchCurrentStrokeGroupItems___block_invoke(uint64_t a1)
{
  -[PKRecognitionSessionManager q_groupQuery](*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 fetchCurrentStrokeGroupItems:*(void *)(a1 + 40)];
}

- (id)q_groupQuery
{
  if (a1)
  {
    id v2 = a1;
    uint64_t v3 = [a1 state];
    id v4 = (id *)*((void *)v2 + 16);
    if (v3 == 3) {
      -[PKRecognitionQueryController drawingQueryWithIdentifier:](v4, @"SmartSelection");
    }
    else {
    a1 = -[PKRecognitionQueryController visibleStrokesQueryWithIdentifier:](v4, @"SmartSelection");
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)recognitionSessionDidUpdateRecognitionResult:(id)a3
{
  id v4 = a3;
  if (!self->_isTearingDown)
  {
    uint64_t v5 = os_log_create("com.apple.pencilkit", "RecognitionManager");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "State Update: PKRecognitionSessionManager recognitionSessionDidUpdateRecognitionResult", buf, 2u);
    }

    recognitionSessionQueue = self->_recognitionSessionQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__PKRecognitionSessionManager_recognitionSessionDidUpdateRecognitionResult___block_invoke;
    v7[3] = &unk_1E64C5870;
    id v8 = v4;
    uint64_t v9 = self;
    dispatch_async(recognitionSessionQueue, v7);
  }
}

void __76__PKRecognitionSessionManager_recognitionSessionDidUpdateRecognitionResult___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  if (v2 == *(void *)(v1 + 48)) {
    -[PKRecognitionSessionManager q_updateRecognitionStateWithFinishedResult:](v1, 1u);
  }
}

void __41__PKRecognitionSessionManager_groupQuery__block_invoke(uint64_t a1)
{
  uint64_t v2 = -[PKRecognitionSessionManager q_groupQuery](*(void **)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)fetchIntersectedStrokesAtPoint:(uint64_t)a3 selectionType:(void *)a4 inputType:(void *)a5 visibleOnscreenStrokes:(double)a6 completion:(double)a7
{
  id v13 = a4;
  id v14 = a5;
  if (a1)
  {
    uint64_t v15 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __120__PKRecognitionSessionManager_fetchIntersectedStrokesAtPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke;
    block[3] = &unk_1E64CAB08;
    void block[4] = a1;
    double v19 = a6;
    double v20 = a7;
    uint64_t v21 = a2;
    uint64_t v22 = a3;
    id v17 = v13;
    id v18 = v14;
    dispatch_async(v15, block);
  }
}

void __120__PKRecognitionSessionManager_fetchIntersectedStrokesAtPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[PKRecognitionSessionManager q_groupQuery](*(void **)(a1 + 32));

  if (v2)
  {
    -[PKRecognitionSessionManager q_groupQuery](*(void **)(a1 + 32));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "q_fetchStrokesForPoint:selectionType:inputType:visibleOnscreenStrokes:completion:", *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __120__PKRecognitionSessionManager_fetchIntersectedStrokesAtPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke_2;
    block[3] = &unk_1E64C5390;
    id v5 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __120__PKRecognitionSessionManager_fetchIntersectedStrokesAtPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchIntersectedStrokesBetweenTopPoint:(void *)a3 bottomPoint:(double)a4 liveScrollOffset:(double)a5 isRTL:(double)a6 completion:(double)a7
{
  id v17 = a3;
  if (a1)
  {
    if ((a8 == 0.0 && a9 == 0.0 || [a1 state] == 3) && objc_msgSend(a1, "state") > 1)
    {
      id v18 = a1[3];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __116__PKRecognitionSessionManager_fetchIntersectedStrokesBetweenTopPoint_bottomPoint_liveScrollOffset_isRTL_completion___block_invoke;
      block[3] = &unk_1E64CAB30;
      void block[4] = a1;
      double v21 = a4;
      double v22 = a5;
      double v23 = a6;
      double v24 = a7;
      char v25 = a2;
      id v20 = v17;
      dispatch_async(v18, block);
    }
    else
    {
      (*((void (**)(id, void))v17 + 2))(v17, 0);
    }
  }
}

void __116__PKRecognitionSessionManager_fetchIntersectedStrokesBetweenTopPoint_bottomPoint_liveScrollOffset_isRTL_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[PKRecognitionSessionManager q_groupQuery](*(void **)(a1 + 32));

  if (v2)
  {
    -[PKRecognitionSessionManager q_groupQuery](*(void **)(a1 + 32));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "q_fetchStrokesBetweenTopPoint:bottomPoint:isRTL:completion:", *(unsigned __int8 *)(a1 + 80), *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __116__PKRecognitionSessionManager_fetchIntersectedStrokesBetweenTopPoint_bottomPoint_liveScrollOffset_isRTL_completion___block_invoke_2;
    block[3] = &unk_1E64C5390;
    id v5 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __116__PKRecognitionSessionManager_fetchIntersectedStrokesBetweenTopPoint_bottomPoint_liveScrollOffset_isRTL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_firstStrokesInSelectedStrokes:(uint64_t)a3 isRTL:
{
  id v5 = a2;
  if (a1 && [a1 state] == 3)
  {
    id v6 = -[PKRecognitionSessionManager groupQuery]((uint64_t)a1);
    id v7 = [v6 firstStrokesInStrokes:v5 isRTL:a3];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_lastStrokesInSelectedStrokes:(uint64_t)a3 isRTL:
{
  id v5 = a2;
  if (a1 && [a1 state] == 3)
  {
    id v6 = -[PKRecognitionSessionManager groupQuery]((uint64_t)a1);
    id v7 = [v6 lastStrokesInStrokes:v5 isRTL:a3];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:(void *)a3 completion:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if ([a1 state] == 3)
    {
      id v7 = a1[3];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __107__PKRecognitionSessionManager_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes_completion___block_invoke;
      block[3] = &unk_1E64C5820;
      void block[4] = a1;
      id v9 = v5;
      id v10 = v6;
      dispatch_async(v7, block);
    }
    else
    {
      (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
    }
  }
}

void __107__PKRecognitionSessionManager_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[PKRecognitionSessionManager q_groupQuery](*(void **)(a1 + 32));

  if (v2)
  {
    id v3 = -[PKRecognitionSessionManager q_groupQuery](*(void **)(a1 + 32));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __107__PKRecognitionSessionManager_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes_completion___block_invoke_2;
    v8[3] = &unk_1E64CAB58;
    uint64_t v4 = *(void *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    objc_msgSend(v3, "q_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:completion:", v4, v8);
    id v5 = &v9;
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __107__PKRecognitionSessionManager_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes_completion___block_invoke_4;
    v6[3] = &unk_1E64C5390;
    id v5 = &v7;
    id v7 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __107__PKRecognitionSessionManager_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__PKRecognitionSessionManager_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes_completion___block_invoke_3;
  block[3] = &unk_1E64C6578;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __107__PKRecognitionSessionManager_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __107__PKRecognitionSessionManager_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (uint64_t)contentTypeForIntersectedStrokes:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = -[PKRecognitionSessionManager groupQuery](a1);
    uint64_t v5 = [v4 contentTypeForIntersectedStrokes:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)updateWithRefinableStroke:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v3 = *(void **)(a1 + 152);
    if (v3) {
      -[PKAutoRefineTaskManager cancelTasksGivenRefinableStroke:](v3, v4);
    }
  }
}

- (CGAffineTransform)_affineTransformFromBounds:(double)a3 targetHeight:(double)a4 targetPoint:(double)a5
{
  result = (CGAffineTransform *)CGRectIsEmpty(*(CGRect *)&a2);
  if (result)
  {
    uint64_t v16 = MEMORY[0x1E4F1DAB8];
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&a1->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&a1->c = v17;
    long long v18 = *(_OWORD *)(v16 + 32);
  }
  else
  {
    *(_OWORD *)&a1->c = 0u;
    *(_OWORD *)&a1->tx = 0u;
    *(_OWORD *)&a1->a = 0u;
    CGAffineTransformMakeTranslation(a1, a7, a8);
    memset(&v27, 0, sizeof(v27));
    CGAffineTransformMakeTranslation(&v27, -a2, -a3);
    CGAffineTransform t1 = v27;
    CGAffineTransformMakeScale(&t2, a6 / a5, a6 / a5);
    CGAffineTransformConcat(&v26, &t1, &t2);
    CGAffineTransform v27 = v26;
    CGAffineTransform v23 = v26;
    long long v19 = *(_OWORD *)&a1->a;
    long long v20 = *(_OWORD *)&a1->tx;
    *(_OWORD *)&v22.c = *(_OWORD *)&a1->c;
    *(_OWORD *)&v22.tx = v20;
    *(_OWORD *)&v22.a = v19;
    result = CGAffineTransformConcat(&v26, &v23, &v22);
    long long v21 = *(_OWORD *)&v26.c;
    *(_OWORD *)&a1->a = *(_OWORD *)&v26.a;
    *(_OWORD *)&a1->c = v21;
    long long v18 = *(_OWORD *)&v26.tx;
  }
  *(_OWORD *)&a1->tx = v18;
  return result;
}

- (void)synthesizeDrawingForText:(void *)a3 sourceDrawing:(void *)a4 originalBounds:(double)a5 fitInBounds:(double)a6 inputScale:(double)a7 completion:(double)a8
{
  id v27 = a2;
  id v28 = a3;
  id v29 = a4;
  if (a1)
  {
    __int16 v30 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __119__PKRecognitionSessionManager_synthesizeDrawingForText_sourceDrawing_originalBounds_fitInBounds_inputScale_completion___block_invoke;
    block[3] = &unk_1E64CAB80;
    double v36 = a5;
    double v37 = a6;
    double v38 = a7;
    double v39 = a8;
    void block[4] = a1;
    id v33 = v27;
    id v34 = v28;
    double v40 = a9;
    double v41 = a10;
    double v42 = a11;
    double v43 = a12;
    uint64_t v44 = a17;
    id v35 = v29;
    dispatch_async(v30, block);
  }
}

void __119__PKRecognitionSessionManager_synthesizeDrawingForText_sourceDrawing_originalBounds_fitInBounds_inputScale_completion___block_invoke(uint64_t a1)
{
  v82[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F5C018];
  v82[0] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = *MEMORY[0x1E4F5C020];
  v81[0] = v2;
  v81[1] = v3;
  id v4 = [NSNumber numberWithDouble:*(double *)(a1 + 88)];
  v82[1] = v4;
  v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:2];

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(*(void *)(a1 + 32) + 64);
  id v71 = 0;
  id v7 = [v6 synthesizeDrawingForString:v5 options:v64 shouldCancel:&__block_literal_global_79 error:&v71];
  id v61 = v71;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [v7 drawing];
  id v10 = *(void **)(a1 + 48);
  CGFloat v11 = *(double *)(a1 + 64);
  CGFloat v12 = *(double *)(a1 + 72);
  CGFloat v62 = *(double *)(a1 + 88);
  CGFloat v63 = *(double *)(a1 + 80);
  double v13 = *(double *)(a1 + 112);
  CGFloat v65 = *(double *)(a1 + 104);
  CGFloat v66 = *(double *)(a1 + 96);
  double v14 = *(double *)(a1 + 120);
  double v15 = *(double *)(a1 + 128);
  id v16 = v9;
  id v17 = v10;
  if (v8)
  {
    memset(&v80, 0, sizeof(v80));
    [v16 bounds];
    -[PKRecognitionSessionManager _affineTransformFromBounds:targetHeight:targetPoint:](&v80, v18, v19, v20, v21, v14, *MEMORY[0x1E4F1DAD8], *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8));
    CGAffineTransform v79 = v80;
    CGAffineTransform v22 = [v17 strokes];
    uint64_t v23 = [v17 strokeClass];
    double v24 = [v17 strokes];
    char v25 = [v24 firstObject];
    CGAffineTransform v26 = [v25 ink];
    id v27 = +[PKStroke _createStrokesFromCHDrawing:v16 transform:&v79 inputScale:v22 sourceStrokes:v23 strokeClass:v26 newInk:1 suggestedHeight:v15 shouldSetSynthesizedFlag:-1.0];

    id v28 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStrokes:v27 fromDrawing:v17];
    [v28 bounds];
    -[PKRecognitionSessionManager _affineTransformFromBounds:targetHeight:targetPoint:](&v78, v29, v30, v31, v32, v14, v66, v65);
    CGAffineTransform v80 = v78;
    id v33 = [v28 drawingByApplyingTransform:&v78 transformInk:0];

    [v33 bounds];
    double v38 = v34;
    CGFloat v39 = v35;
    double v40 = v36;
    CGFloat v41 = v37;
    if (v36 <= v13)
    {
      uint64_t v44 = v33;
    }
    else
    {
      double v60 = v12;
      double MidX = CGRectGetMidX(*(CGRect *)&v34);
      v83.origin.x = v38;
      v83.origin.y = v39;
      v83.size.width = v40;
      v83.size.height = v41;
      double MidY = CGRectGetMidY(v83);
      CGAffineTransformMakeTranslation(&v77, -MidX, -MidY);
      CGAffineTransform v80 = v77;
      CGAffineTransform t1 = v77;
      CGAffineTransformMakeScale(&t2, v13 / v40, v13 / v40);
      CGAffineTransformConcat(&v77, &t1, &t2);
      CGAffineTransform v80 = v77;
      CGAffineTransform v74 = v77;
      CGAffineTransformMakeTranslation(&v73, MidX, MidY);
      CGAffineTransformConcat(&v77, &v74, &v73);
      CGAffineTransform v80 = v77;
      uint64_t v44 = [v33 drawingByApplyingTransform:&v77 transformInk:0];

      CGFloat v12 = v60;
      [v44 bounds];
      double v38 = v45;
      CGFloat v39 = v46;
      double v40 = v47;
      CGFloat v41 = v48;
    }
    v84.origin.x = v11;
    v84.origin.y = v12;
    v84.size.height = v62;
    v84.size.width = v63;
    double v49 = CGRectGetMidX(v84);
    v85.origin.x = v38;
    v85.origin.y = v39;
    v85.size.width = v40;
    v85.size.height = v41;
    double v50 = v49 - CGRectGetMidX(v85);
    CGFloat v51 = v38 + v50;
    v86.origin.x = v51;
    v86.origin.y = v39;
    v86.size.width = v40;
    v86.size.height = v41;
    double MinX = CGRectGetMinX(v86);
    v87.origin.y = v65;
    v87.origin.x = v66;
    v87.size.width = v13;
    v87.size.height = v14;
    double v53 = fmin(MinX - CGRectGetMinX(v87), 0.0);
    v88.origin.x = v51 - v53;
    v88.origin.y = v39;
    v88.size.width = v40;
    v88.size.height = v41;
    double MaxX = CGRectGetMaxX(v88);
    v89.origin.y = v65;
    v89.origin.x = v66;
    v89.size.width = v13;
    v89.size.height = v14;
    CGFloat v55 = CGRectGetMaxX(v89);
    CGAffineTransformMakeTranslation(&v72, v50 - v53 - fmax(MaxX - v55, 0.0), 0.0);
    v56 = [v44 drawingByApplyingTransform:&v72];
  }
  else
  {
    v56 = 0;
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __119__PKRecognitionSessionManager_synthesizeDrawingForText_sourceDrawing_originalBounds_fitInBounds_inputScale_completion___block_invoke_3;
  block[3] = &unk_1E64C6578;
  id v57 = *(id *)(a1 + 56);
  id v69 = v7;
  id v70 = v57;
  id v68 = v56;
  id v58 = v7;
  id v59 = v56;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __119__PKRecognitionSessionManager_synthesizeDrawingForText_sourceDrawing_originalBounds_fitInBounds_inputScale_completion___block_invoke_2()
{
  return 0;
}

void __119__PKRecognitionSessionManager_synthesizeDrawingForText_sourceDrawing_originalBounds_fitInBounds_inputScale_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 40) segmentContents];
  id v4 = [*(id *)(a1 + 40) segmentStrokeIndexes];
  (*(void (**)(uint64_t, uint64_t, id, void *))(v3 + 16))(v3, v2, v5, v4);
}

- (void)synthesizeDrawingForMathResultBlock:(void *)a3 fallbackText:(void *)a4 drawing:(void *)a5 mathItem:(void *)a6 inkColor:(void *)a7 inputScale:(double)a8 completion:
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v49 = a2;
  id v50 = a3;
  id v15 = a4;
  id v16 = a5;
  id v48 = a6;
  id v51 = a7;
  if (a1)
  {
    id v17 = (void *)[v15 copy];

    double v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
    double v47 = [v16 symbolStrokes];
    [v16 boundsForTriggerStrokes];
    CGFloat x = v72.origin.x;
    CGFloat y = v72.origin.y;
    CGFloat width = v72.size.width;
    CGFloat height = v72.size.height;
    if (CGRectIsNull(v72))
    {
      uint64_t v23 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C44F8000, v23, OS_LOG_TYPE_ERROR, "No trigger bounds for drawing. Falling back to full bounds", buf, 2u);
      }

      [v17 bounds];
      CGFloat x = v24;
      CGFloat y = v25;
      CGFloat width = v26;
      CGFloat height = v27;
    }
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v28 = v47;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v66;
      double v31 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v66 != v30) {
            objc_enumerationMutation(v28);
          }
          id v33 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          [v18 addObject:v33];
          double v34 = [v33 ink];
          double v35 = [v34 color];
          [v35 alphaComponent];
          double v37 = v36;

          double v31 = v31 + v37;
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v65 objects:v70 count:16];
      }
      while (v29);
    }
    else
    {
      double v31 = 0.0;
    }

    if ([v18 count])
    {
      unint64_t v38 = [v18 count];
      CGFloat v39 = [v18 firstObject];
      double v40 = [v48 colorWithAlphaComponent:v31 / (double)v38];
      CGFloat v41 = [v39 ink];
      double v42 = +[PKInk inkFromInk:v41 color:v40];
    }
    else
    {
      double v42 = 0;
    }
    double v43 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStrokes:v18 fromDrawing:v17];
    uint64_t v44 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __128__PKRecognitionSessionManager_synthesizeDrawingForMathResultBlock_fallbackText_drawing_mathItem_inkColor_inputScale_completion___block_invoke;
    block[3] = &unk_1E64CABA8;
    id v53 = v16;
    uint64_t v54 = a1;
    id v58 = v49;
    id v55 = v50;
    id v56 = v43;
    CGFloat v60 = x;
    CGFloat v61 = y;
    CGFloat v62 = width;
    CGFloat v63 = height;
    id v57 = v42;
    double v64 = a8;
    id v59 = v51;
    id v45 = v42;
    id v46 = v43;
    dispatch_async(v44, block);
  }
  else
  {
    id v17 = v15;
  }
}

void __128__PKRecognitionSessionManager_synthesizeDrawingForMathResultBlock_fallbackText_drawing_mathItem_inkColor_inputScale_completion___block_invoke(uint64_t a1)
{
  v79[2] = *MEMORY[0x1E4F143B8];
  double v2 = -[PKMathRecognitionItem suggestedHeightForResult](*(void *)(a1 + 32));
  v78[0] = *MEMORY[0x1E4F5C020];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithDouble:");
  v78[1] = *MEMORY[0x1E4F5C018];
  v79[0] = v3;
  v79[1] = MEMORY[0x1E4F1CC38];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:2];

  if ([*(id *)(a1 + 32) isVerticalExpression]
    && (double v5 = -[PKMathRecognitionItem suggestedDistanceBetweenDigits](*(void **)(a1 + 32)), v5 > 0.0))
  {
    id v6 = (void *)[v4 mutableCopy];
    id v7 = [NSNumber numberWithDouble:v5];
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F5C010]];

    uint64_t v8 = (void *)[v6 copy];
  }
  else
  {
    uint64_t v8 = v4;
  }
  id v9 = *(void **)(*(void *)(a1 + 40) + 56);
  uint64_t v10 = *(void *)(a1 + 72);
  id v68 = 0;
  CGFloat v11 = [v9 synthesizeExpressionEvaluationResultWithBlock:v10 options:v8 shouldCancel:&__block_literal_global_150 error:&v68];
  id v12 = v68;
  if (!v11)
  {
    uint64_t v13 = *(void *)(a1 + 48);
    double v14 = *(void **)(*(void *)(a1 + 40) + 64);
    id v67 = v12;
    CGFloat v11 = [v14 synthesizeDrawingForString:v13 options:v8 shouldCancel:&__block_literal_global_152 error:&v67];
    id v15 = v67;

    id v12 = v15;
  }
  uint64_t v16 = *(void *)(a1 + 40);
  id v17 = [v11 drawing];
  CGFloat v18 = *(double *)(a1 + 88);
  CGFloat v19 = *(double *)(a1 + 96);
  CGFloat v20 = *(double *)(a1 + 104);
  CGFloat v21 = *(double *)(a1 + 112);
  CGAffineTransform v22 = *(void **)(a1 + 56);
  uint64_t v23 = *(void **)(a1 + 64);
  double v63 = *(double *)(a1 + 120);
  int v24 = [*(id *)(a1 + 32) isVerticalExpression];
  id v25 = v17;
  id v26 = v22;
  id v27 = v23;
  if (v16)
  {
    double v28 = v2 + 4.0;
    double v29 = (v2 + 4.0) * 8.0 / -30.0;
    if (v24) {
      double v30 = 0.0;
    }
    else {
      double v30 = (v2 + 4.0) * 8.0 / -30.0;
    }
    if (v24) {
      double v31 = v29;
    }
    else {
      double v31 = 0.0;
    }
    v80.origin.CGFloat x = v18;
    v80.origin.CGFloat y = v19;
    v80.size.CGFloat width = v20;
    v80.size.CGFloat height = v21;
    CGRect v81 = CGRectInset(v80, v30, v31);
    CGFloat x = v81.origin.x;
    CGFloat y = v81.origin.y;
    CGFloat width = v81.size.width;
    CGFloat height = v81.size.height;
    [v26 bounds];
    CGRect v83 = CGRectInset(v82, v30, v31);
    CGFloat v59 = v83.origin.y;
    CGFloat v60 = v83.origin.x;
    CGFloat v57 = v83.size.height;
    CGFloat v58 = v83.size.width;
    [v25 bounds];
    double v37 = v36;
    [v25 bounds];
    double v61 = v40;
    double v62 = v41;
    double v42 = v28 / v37;
    if (v24)
    {
      double v43 = v38;
      v84.origin.CGFloat x = x;
      v84.origin.CGFloat y = y;
      v84.size.CGFloat width = width;
      v84.size.CGFloat height = height;
      CGFloat MaxY = CGRectGetMaxY(v84);
      v85.origin.CGFloat y = v59;
      v85.origin.CGFloat x = v60;
      v85.size.CGFloat height = v57;
      v85.size.CGFloat width = v58;
      CGFloat MaxX = CGRectGetMaxX(v85);
      memset(&v77, 0, sizeof(v77));
      CGAffineTransformMakeTranslation(&v77, MaxX - v43 * v42, MaxY);
      memset(&v76, 0, sizeof(v76));
      CGAffineTransformMakeTranslation(&v76, -v61, -v62);
      CGAffineTransform t1 = v76;
      CGAffineTransformMakeScale(&t2, v42, v42);
      CGAffineTransformConcat(&v75, &t1, &t2);
      CGAffineTransform v76 = v75;
      CGAffineTransform v72 = v75;
      CGAffineTransform v71 = v77;
      id v46 = &v72;
      double v47 = &v71;
    }
    else
    {
      double v48 = v39;
      v86.origin.CGFloat x = x;
      v86.origin.CGFloat y = y;
      v86.size.CGFloat width = width;
      v86.size.CGFloat height = height;
      CGFloat v49 = CGRectGetMaxX(v86);
      v87.origin.CGFloat x = x;
      v87.origin.CGFloat y = y;
      v87.size.CGFloat width = width;
      v87.size.CGFloat height = height;
      CGFloat MidY = CGRectGetMidY(v87);
      CGFloat v51 = v48 * 0.5;
      memset(&v77, 0, sizeof(v77));
      CGAffineTransformMakeTranslation(&v77, v49, MidY - v51);
      memset(&v76, 0, sizeof(v76));
      CGAffineTransformMakeTranslation(&v76, -v61, -v62 - v51);
      CGAffineTransform t1 = v76;
      CGAffineTransformMakeScale(&t2, v42, v42);
      CGAffineTransformConcat(&v75, &t1, &t2);
      CGAffineTransform v76 = v75;
      CGAffineTransform v72 = v75;
      CGAffineTransformMakeTranslation(&v71, 0.0, v51);
      CGAffineTransformConcat(&v75, &v72, &v71);
      CGAffineTransform v76 = v75;
      CGAffineTransform v70 = v75;
      CGAffineTransform v69 = v77;
      id v46 = &v70;
      double v47 = &v69;
    }
    CGAffineTransformConcat(&v75, v46, v47);
    CGAffineTransform v77 = v75;
    CGAffineTransform v76 = v75;
    v52 = [v26 strokes];
    id v53 = +[PKStroke _createStrokesFromCHDrawing:transform:inputScale:sourceStrokes:strokeClass:newInk:suggestedHeight:shouldSetSynthesizedFlag:](PKStroke, "_createStrokesFromCHDrawing:transform:inputScale:sourceStrokes:strokeClass:newInk:suggestedHeight:shouldSetSynthesizedFlag:", v25, &v76, v52, [v26 strokeClass], v27, 1, v63, -1.0);

    uint64_t v54 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStrokes:v53 fromDrawing:v26];
  }
  else
  {
    uint64_t v54 = 0;
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__PKRecognitionSessionManager_synthesizeDrawingForMathResultBlock_fallbackText_drawing_mathItem_inkColor_inputScale_completion___block_invoke_4;
  block[3] = &unk_1E64C53B8;
  id v55 = *(id *)(a1 + 80);
  id v65 = v54;
  id v66 = v55;
  id v56 = v54;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __128__PKRecognitionSessionManager_synthesizeDrawingForMathResultBlock_fallbackText_drawing_mathItem_inkColor_inputScale_completion___block_invoke_2()
{
  return 0;
}

uint64_t __128__PKRecognitionSessionManager_synthesizeDrawingForMathResultBlock_fallbackText_drawing_mathItem_inkColor_inputScale_completion___block_invoke_3()
{
  return 0;
}

uint64_t __128__PKRecognitionSessionManager_synthesizeDrawingForMathResultBlock_fallbackText_drawing_mathItem_inkColor_inputScale_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)canSynthesizeDrawingForText:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = [*(id *)(a1 + 64) supportedCharacterIndexesForString:v3 options:0];
    uint64_t v5 = [v3 length];
    uint64_t v6 = [v4 count];
    BOOL v7 = 1.0 - (double)(unint64_t)(v5 - v6) / (double)(unint64_t)[v3 length] >= 0.65;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)synthesizeDrawingForText:(void *)a3 drawing:(double)a4 inkColor:(double)a5 inputScale:(double)a6 suggestedHeight:(double)a7 bounds:(double)a8 progress:(double)a9 completion:(uint64_t)a10
{
  id v22 = a2;
  id v23 = a3;
  id v24 = a11;
  id v25 = a12;
  if (a1)
  {
    id v26 = (void *)[v23 copy];
    objc_initWeak(&location, a1);
    id v27 = a1[3];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __127__PKRecognitionSessionManager_synthesizeDrawingForText_drawing_inkColor_inputScale_suggestedHeight_bounds_progress_completion___block_invoke;
    v30[3] = &unk_1E64CABF8;
    objc_copyWeak(v35, &location);
    id v28 = v22;
    v35[1] = *(id *)&a6;
    v35[2] = *(id *)&a7;
    v35[3] = *(id *)&a8;
    v35[4] = *(id *)&a9;
    v35[5] = *(id *)&a4;
    v35[6] = *(id *)&a5;
    id v31 = v28;
    id v32 = v26;
    id v33 = v25;
    id v34 = v24;
    id v29 = v26;
    dispatch_async(v27, v30);

    objc_destroyWeak(v35);
    objc_destroyWeak(&location);
  }
}

void __127__PKRecognitionSessionManager_synthesizeDrawingForText_drawing_inkColor_inputScale_suggestedHeight_bounds_progress_completion___block_invoke(uint64_t a1)
{
  double v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5C0B8]);
    uint64_t v5 = -[PKRecognitionSessionManager session](WeakRetained);
    uint64_t v6 = (void *)[v4 initWithRecognitionSession:v5];

    uint64_t v7 = *(void *)(a1 + 32);
    double v8 = *(double *)(a1 + 72);
    double v9 = *(double *)(a1 + 80);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __127__PKRecognitionSessionManager_synthesizeDrawingForText_drawing_inkColor_inputScale_suggestedHeight_bounds_progress_completion___block_invoke_2;
    v14[3] = &unk_1E64CABD0;
    objc_copyWeak(&v18, v2);
    id v15 = *(id *)(a1 + 32);
    long long v10 = *(_OWORD *)(a1 + 88);
    long long v19 = *(_OWORD *)(a1 + 72);
    long long v20 = v10;
    long long v21 = *(_OWORD *)(a1 + 104);
    id v16 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    CGFloat v11 = objc_msgSend(v6, "synthesizeTokensForString:point:completion:shouldCancel:", v7, v14, &__block_literal_global_158, v8, v9);

    objc_destroyWeak(&v18);
  }
  else
  {
    CGFloat v11 = 0;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  (*(void (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v11, v12, v13);
}

void __127__PKRecognitionSessionManager_synthesizeDrawingForText_drawing_inkColor_inputScale_suggestedHeight_bounds_progress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    double v7 = *(double *)(a1 + 96);
    double v8 = *(double *)(a1 + 104);
    long long v10 = *(void **)(a1 + 32);
    double v9 = *(void **)(a1 + 40);
    CGFloat v11 = [v9 strokes];
    -[PKRecognitionSessionManager completeTextSynthesisForText:bounds:ink:inputScale:suggestedHeight:contextDrawing:sourceStrokes:tokenStringRanges:tokens:completion:](WeakRetained, v10, 0, v9, v11, v12, v5, *(void **)(a1 + 48), v7, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)completeTextSynthesisForText:(id *)a1 bounds:(void *)a2 ink:(void *)a3 inputScale:(void *)a4 suggestedHeight:(void *)a5 contextDrawing:(void *)a6 sourceStrokes:(void *)a7 tokenStringRanges:(void *)a8 tokens:(double)a9 completion:(double)a10
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v44 = a2;
  id v53 = a3;
  id v18 = a4;
  id v52 = a5;
  id v45 = a6;
  id v19 = a7;
  id v46 = a8;
  CGFloat v51 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  uint64_t v54 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  double v47 = [a1 strokeProviderSnapshot];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = v19;
  uint64_t v20 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v62;
    id v22 = (_OWORD *)MEMORY[0x1E4F1DAB8];
    id v23 = (double *)MEMORY[0x1E4F1DB20];
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v62 != v21) {
          objc_enumerationMutation(obj);
        }
        id v25 = [*(id *)(*((void *)&v61 + 1) + 8 * v24) drawing];
        long long v26 = v22[1];
        v60[0] = *v22;
        v60[1] = v26;
        v60[2] = v22[2];
        id v27 = +[PKStroke _createStrokesFromCHDrawing:transform:inputScale:sourceStrokes:strokeClass:newInk:suggestedHeight:shouldSetSynthesizedFlag:](PKStroke, "_createStrokesFromCHDrawing:transform:inputScale:sourceStrokes:strokeClass:newInk:suggestedHeight:shouldSetSynthesizedFlag:", v25, v60, v52, [v18 strokeClass], v53, 1, a9, a10);

        id v28 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStrokes:v27 fromDrawing:v18];
        objc_msgSend(v28, "set_canvasBounds:", *v23, v23[1], v23[2], v23[3]);
        [v51 addObject:v28];
        id v29 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v27];
        [v54 addObject:v29];

        ++v24;
      }
      while (v20 != v24);
      uint64_t v20 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v20);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __163__PKRecognitionSessionManager_completeTextSynthesisForText_bounds_ink_inputScale_suggestedHeight_contextDrawing_sourceStrokes_tokenStringRanges_tokens_completion___block_invoke;
  block[3] = &unk_1E64CAC70;
  id v42 = v46;
  id v59 = v42;
  id v41 = v45;
  id v56 = v41;
  id v30 = obj;
  id v57 = v30;
  id v43 = v51;
  id v58 = v43;
  dispatch_async(MEMORY[0x1E4F14428], block);
  for (unint64_t i = 0; i < [v30 count]; ++i)
  {
    id v32 = [v30 objectAtIndexedSubscript:i];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {

      break;
    }
    id v33 = [v54 objectAtIndexedSubscript:i];
    id obja = +[PKStrokeProvider _identifiersForStrokes:v33];

    id v34 = [v32 asFullTextResultWithStrokeIdentifiers:obja strokeProvider:v47];
    double v35 = [v54 objectAtIndexedSubscript:i];
    id v36 = v34;
    id v37 = v35;
    double v38 = (void *)MEMORY[0x1E4F1CAD0];
    double v39 = +[PKStrokeProvider _identifiersForStrokes:v37];
    double v40 = [v38 setWithArray:v39];

    [a1[13] addCachedTranscription:v36 forStrokeGroup:v40];
  }
}

uint64_t __127__PKRecognitionSessionManager_synthesizeDrawingForText_drawing_inkColor_inputScale_suggestedHeight_bounds_progress_completion___block_invoke_3()
{
  return 0;
}

- (void)synthesizeDrawingForReplacementText:(void *)a3 drawing:(void *)a4 strokes:(void *)a5 bounds:(CGFloat)a6 inputScale:(CGFloat)a7 completion:(CGFloat)a8
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  if (a1)
  {
    id v23 = (void *)[v20 copy];

    if ([v21 count])
    {
      uint64_t v24 = [v21 lastObject];
      id v25 = [v24 ink];
    }
    else
    {
      uint64_t v24 = [v21 lastObject];
      long long v26 = [v24 ink];
      id v27 = [v26 color];
      id v25 = +[PKInk inkWithIdentifier:@"com.apple.ink.monoline" color:v27 weight:1.0];
    }
    id v28 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStrokes:v21 fromDrawing:v23];
    id v29 = os_log_create("com.apple.pencilkit", "Proofreading");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      id v33 = [v23 uuid];
      v49.origin.CGFloat x = a6;
      v49.origin.CGFloat y = a7;
      v49.size.CGFloat width = a8;
      v49.size.CGFloat height = a9;
      id v34 = NSStringFromCGRect(v49);
      *(_DWORD *)id location = 138412803;
      *(void *)&location[4] = v33;
      __int16 v44 = 2112;
      id v45 = v34;
      __int16 v46 = 2117;
      id v47 = v19;
      _os_log_debug_impl(&dword_1C44F8000, v29, OS_LOG_TYPE_DEBUG, "Requested to synthesize drawing: %@ in bounds: %@ for replacement text: \"%{sensitive}@\"", location, 0x20u);
    }
    objc_initWeak((id *)location, a1);
    id v30 = a1[3];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __112__PKRecognitionSessionManager_synthesizeDrawingForReplacementText_drawing_strokes_bounds_inputScale_completion___block_invoke;
    v35[3] = &unk_1E64CAC48;
    objc_copyWeak(v42, (id *)location);
    id v36 = v21;
    id v37 = v19;
    id v20 = v23;
    v42[1] = *(id *)&a6;
    v42[2] = *(id *)&a7;
    v42[3] = *(id *)&a8;
    v42[4] = *(id *)&a9;
    id v38 = v20;
    id v39 = v25;
    v42[5] = *(id *)&a10;
    id v40 = v28;
    id v41 = v22;
    id v31 = v28;
    id v32 = v25;
    dispatch_async(v30, v35);

    objc_destroyWeak(v42);
    objc_destroyWeak((id *)location);
  }
}

void __112__PKRecognitionSessionManager_synthesizeDrawingForReplacementText_drawing_strokes_bounds_inputScale_completion___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  double v2 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5C0B8]);
    id v5 = -[PKRecognitionSessionManager session](WeakRetained);
    uint64_t v6 = (void *)[v4 initWithRecognitionSession:v5];

    double v7 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:*(void *)(a1 + 32)];
    double v8 = +[PKStrokeProvider _identifiersForStrokes:v7];
    uint64_t v9 = *(void *)(a1 + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __112__PKRecognitionSessionManager_synthesizeDrawingForReplacementText_drawing_strokes_bounds_inputScale_completion___block_invoke_2;
    v15[3] = &unk_1E64CAC20;
    objc_copyWeak(&v22, v2);
    id v16 = *(id *)(a1 + 48);
    long long v23 = *(_OWORD *)(a1 + 88);
    long long v24 = *(_OWORD *)(a1 + 104);
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 56);
    uint64_t v25 = *(void *)(a1 + 120);
    id v19 = *(id *)(a1 + 64);
    id v20 = *(id *)(a1 + 32);
    id v21 = *(id *)(a1 + 72);
    id v10 = (id)[v6 synthesizeTokensForString:v9 replacingStrokes:v8 completion:v15 shouldCancel:&__block_literal_global_167];

    objc_destroyWeak(&v22);
  }
  else
  {
    CGFloat v11 = os_log_create("com.apple.pencilkit", "Proofreading");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = [*(id *)(a1 + 48) uuid];
      uint64_t v13 = NSStringFromCGRect(*(CGRect *)(a1 + 88));
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412803;
      id v27 = v12;
      __int16 v28 = 2112;
      id v29 = v13;
      __int16 v30 = 2117;
      uint64_t v31 = v14;
      _os_log_debug_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEBUG, "Ignoring synthesis of drawing: %@ in bounds: %@, for replacement text: \"%{sensitive}@\"", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __112__PKRecognitionSessionManager_synthesizeDrawingForReplacementText_drawing_strokes_bounds_inputScale_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v25 = a2;
  id v26 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v26, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v6 = v26;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          CGFloat v11 = NSString;
          id v12 = [v10 string];
          [v10 bounds];
          uint64_t v13 = NSStringFromCGRect(v43);
          uint64_t v14 = [v11 stringWithFormat:@"%@ [%@]", v12, v13];
          [v5 addObject:v14];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v41 count:16];
      }
      while (v7);
    }

    id v15 = os_log_create("com.apple.pencilkit", "Proofreading");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v17 = [*(id *)(a1 + 32) uuid];
      id v18 = NSStringFromCGRect(*(CGRect *)(a1 + 88));
      uint64_t v19 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138413315;
      uint64_t v32 = v17;
      __int16 v33 = 2112;
      id v34 = v18;
      __int16 v35 = 2117;
      uint64_t v36 = v19;
      __int16 v37 = 2112;
      id v38 = v25;
      __int16 v39 = 2117;
      id v40 = v5;
      _os_log_debug_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEBUG, "Did synthesize drawing: %@ in bounds: %@, for replacement text: \"%{sensitive}@\". Token ranges: %@. Token: %{sensitive}@", buf, 0x34u);
    }
    -[PKRecognitionSessionManager completeTextSynthesisForText:bounds:ink:inputScale:suggestedHeight:contextDrawing:sourceStrokes:tokenStringRanges:tokens:completion:](WeakRetained, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), v25, v6, *(void **)(a1 + 72), *(double *)(a1 + 120), *(double *)(a1 + 112));
  }
  else
  {
    id v16 = os_log_create("com.apple.pencilkit", "Proofreading");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v20 = [*(id *)(a1 + 32) uuid];
      id v21 = NSStringFromCGRect(*(CGRect *)(a1 + 88));
      uint64_t v22 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412803;
      uint64_t v32 = v20;
      __int16 v33 = 2112;
      id v34 = v21;
      __int16 v35 = 2117;
      uint64_t v36 = v22;
      _os_log_debug_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_DEBUG, "Ignoring synthesis of drawing: %@ in bounds: %@ for replacement text: \"%{sensitive}@\"", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

uint64_t __112__PKRecognitionSessionManager_synthesizeDrawingForReplacementText_drawing_strokes_bounds_inputScale_completion___block_invoke_165()
{
  return 0;
}

uint64_t __163__PKRecognitionSessionManager_completeTextSynthesisForText_bounds_ink_inputScale_suggestedHeight_contextDrawing_sourceStrokes_tokenStringRanges_tokens_completion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)cacheTranscription:(void *)a3 strokeGroup:
{
  id v9 = a2;
  id v5 = a3;
  if (a1)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = +[PKStrokeProvider _identifiersForStrokes:v5];
    uint64_t v8 = [v6 setWithArray:v7];

    [*(id *)(a1 + 96) addCachedTranscription:v9 forStrokeGroup:v8];
  }
}

- (void)dataDetectorQuery:(id)a3 foundItems:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        CGFloat v11 = +[PKDataDetectorItem dataDetectorItemWithQueryItem:sessionManager:](PKDataDetectorItem, "dataDetectorItemWithQueryItem:sessionManager:", *(void *)(*((void *)&v14 + 1) + 8 * v10), self, (void)v14);
        if (v11) {
          [v6 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_delegateFlags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v13 = (void *)[v6 copy];
    [WeakRetained recognitionSessionManager:self foundDataDetectorItems:v13];
  }
}

- (void)hashtagQuery:(id)a3 foundItems:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        CGFloat v11 = +[PKHashtagItem hashtagItemWithQueryItem:sessionManager:](PKHashtagItem, "hashtagItemWithQueryItem:sessionManager:", *(void *)(*((void *)&v14 + 1) + 8 * v10), self, (void)v14);
        if (v11) {
          [v6 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if ((*(unsigned char *)&self->_delegateFlags & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v13 = (void *)[v6 copy];
    [WeakRetained recognitionSessionManager:self foundHashtagItems:v13];
  }
}

- (void)mentionQuery:(id)a3 foundItems:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        CGFloat v11 = +[PKMentionItem mentionItemWithQueryItem:sessionManager:](PKMentionItem, "mentionItemWithQueryItem:sessionManager:", *(void *)(*((void *)&v14 + 1) + 8 * v10), self, (void)v14);
        if (v11) {
          [v6 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if ((*(unsigned char *)&self->_delegateFlags & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v13 = (void *)[v6 copy];
    [WeakRetained recognitionSessionManager:self foundMentionItems:v13];
  }
}

- (void)proofreadingQuery:(id)a3 foundItems:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v24 = a4;
  [(NSTimer *)self->_proofreadingTimer invalidate];
  long long v27 = [MEMORY[0x1E4F1CA48] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v24;
  uint64_t v5 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = +[PKProofreadingItem proofreadingItemWithQueryItem:*(void *)(*((void *)&v35 + 1) + 8 * i) sessionManager:self];
        if (v8) {
          [v27 addObject:v8];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v5);
  }

  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v27, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v25 = v27;
  uint64_t v10 = [v25 countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v25);
        }
        uint64_t v13 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        long long v14 = NSString;
        long long v15 = [v13 identifier];
        long long v16 = [v13 replacementStrings];
        long long v17 = [v14 stringWithFormat:@"{identifer:%@, replacementStrings:%@}", v15, v16];
        [v9 addObject:v17];
      }
      uint64_t v10 = [v25 countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v10);
  }

  id v18 = os_log_create("com.apple.pencilkit", "Proofreading");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    long long v23 = [v25 valueForKey:@"identifier"];
    *(_DWORD *)id location = 138412547;
    *(void *)&location[4] = v23;
    __int16 v40 = 2117;
    id v41 = v9;
    _os_log_debug_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_DEBUG, "Recognized proofreading items: %@. Strings: %{sensitive}@", location, 0x16u);
  }
  if ((*(unsigned char *)&self->_delegateFlags & 8) != 0)
  {
    objc_initWeak((id *)location, self);
    if (self->q_wantsAutoRefine) {
      double v19 = 0.0;
    }
    else {
      double v19 = 1.0;
    }
    id v20 = (void *)MEMORY[0x1E4F1CB00];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __60__PKRecognitionSessionManager_proofreadingQuery_foundItems___block_invoke;
    v28[3] = &unk_1E64CAC98;
    objc_copyWeak(&v30, (id *)location);
    id v29 = v25;
    id v21 = [v20 scheduledTimerWithTimeInterval:0 repeats:v28 block:v19];
    proofreadingTimer = self->_proofreadingTimer;
    self->_proofreadingTimer = v21;

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)location);
  }
}

void __60__PKRecognitionSessionManager_proofreadingQuery_foundItems___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained) {
    id v3 = objc_loadWeakRetained(WeakRetained + 24);
  }
  else {
    id v3 = 0;
  }
  id v4 = (void *)[*(id *)(a1 + 32) copy];
  [v3 recognitionSessionManager:v5 foundProofreadingItems:v4];
}

- (void)groupQuery:(id)a3 foundItems:(id)a4
{
  id v5 = a4;
  if ((*(unsigned char *)&self->_delegateFlags & 0x10) != 0)
  {
    id v7 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained recognitionSessionManager:self foundStrokeGroupItems:v7];

    id v5 = v7;
  }
}

void __49__PKRecognitionSessionManager_transcriptionQuery__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) state];
  id v3 = *(id **)(*(void *)(a1 + 32) + 128);
  if (v2 == 3) {
    -[PKRecognitionQueryController drawingQueryWithIdentifier:](v3, @"Transcription");
  }
  else {
  uint64_t v4 = -[PKRecognitionQueryController visibleStrokesQueryWithIdentifier:](v3, @"Transcription");
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)fetchTranscriptionForStrokes:(void *)a3 cancelBlock:(void *)a4 withCompletion:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v10 = *(NSObject **)(a1 + 24);
    blocuint64_t k = MEMORY[0x1E4F143A8];
    p_blocuint64_t k = 3221225472;
    uint64_t v22 = (uint64_t)__53__PKRecognitionSessionManager_setWantsTranscription___block_invoke;
    long long v23 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E64C6618;
    id v24 = (void (*)(uint64_t))a1;
    LOBYTE(v25) = 1;
    dispatch_async(v10, &block);
    uint64_t v11 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v7];
    id v12 = +[PKStrokeProvider _identifiersForStrokes:v11];
    blocuint64_t k = 0;
    p_blocuint64_t k = (uint64_t)&block;
    uint64_t v22 = 0x3032000000;
    long long v23 = __Block_byref_object_copy__30;
    id v24 = __Block_byref_object_dispose__30;
    id v25 = 0;
    uint64_t v13 = *(NSObject **)(a1 + 24);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __49__PKRecognitionSessionManager_transcriptionQuery__block_invoke;
    v19[3] = &unk_1E64C7628;
    v19[4] = a1;
    v19[5] = &block;
    dispatch_sync(v13, v19);
    id v14 = *(id *)(p_block + 40);
    _Block_object_dispose(&block, 8);

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __87__PKRecognitionSessionManager_fetchTranscriptionForStrokes_cancelBlock_withCompletion___block_invoke;
    v17[3] = &unk_1E64CACE8;
    id v18 = v9;
    long long v15 = [v14 contextualTextResultsForContextStrokes:v12 completion:v17 shouldCancel:v8];
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

void __87__PKRecognitionSessionManager_fetchTranscriptionForStrokes_cancelBlock_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__30;
  void v7[4] = __Block_byref_object_dispose__30;
  id v8 = [v3 topTranscription];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __87__PKRecognitionSessionManager_fetchTranscriptionForStrokes_cancelBlock_withCompletion___block_invoke_2;
  v4[3] = &unk_1E64CACC0;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v4);

  _Block_object_dispose(v7, 8);
}

uint64_t __87__PKRecognitionSessionManager_fetchTranscriptionForStrokes_cancelBlock_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

+ (id)enabledLocales
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  [MEMORY[0x1E4F1CA20] preferredLanguages];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        if (v7) {
          [v2 addObject:v7];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  id v8 = [MEMORY[0x1E4F1C978] arrayWithArray:v2];

  return v8;
}

+ (BOOL)hasAutoRefineLocaleEnabled
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend((id)objc_opt_class(), "enabledLocales", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [*(id *)(*((void *)&v10 + 1) + 8 * i) languageCode];
        char v7 = [&unk_1F200F000 containsObject:v6];

        if (v7)
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (void)autoRefineQuery:(id)a3 didUpdateWithQueryItem:(id)a4 validProviderVersion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  recognitionSessionQueue = self->_recognitionSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__PKRecognitionSessionManager_autoRefineQuery_didUpdateWithQueryItem_validProviderVersion___block_invoke;
  block[3] = &unk_1E64C53E0;
  void block[4] = self;
  id v10 = v7;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  dispatch_sync(recognitionSessionQueue, block);
  long long v12 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = [v10 textResult];
    id v14 = [v13 refinableTranscription];
    *(_DWORD *)buf = 138739971;
    double v19 = v14;
    _os_log_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_DEFAULT, "AutoRefine query item with transcription %{sensitive}@ handled.", buf, 0xCu);
  }
}

void __91__PKRecognitionSessionManager_autoRefineQuery_didUpdateWithQueryItem_validProviderVersion___block_invoke(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 200));
  int v3 = [WeakRetained hasRefinableStrokes];

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 200));
  if (v4
    && ((uint64_t v5 = v4, [*(id *)(a1 + 40) textResult],
                  (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
      ? (int v7 = v3)
      : (int v7 = 0),
        v6,
        v5,
        v7 == 1))
  {
    id v8 = -[PKRecognitionSessionManager directStrokeProviderSnapshot](*(void **)(a1 + 32));
    long long v54 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v51 = 0u;
    id v9 = [*(id *)(a1 + 40) strokeIdentifiers];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v51 objects:v67 count:16];
    if (v10)
    {
      char v11 = 0;
      uint64_t v12 = *(void *)v52;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v52 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          if (([v8 isValidStrokeIdentifier:v14] & 1) == 0)
          {

            os_log_t v30 = os_log_create("com.apple.pencilkit", "AutoRefine");
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C44F8000, v30, OS_LOG_TYPE_DEFAULT, "AutoRefine item rejected because some strokes are invalid in new snapshot", buf, 2u);
            }
            goto LABEL_33;
          }
          uint64_t v15 = [v8 strokeForIdentifier:v14];
          if (v11)
          {
            char v11 = 1;
          }
          else
          {
            id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 200));
            id v17 = [v15 stroke];
            char v11 = [v16 isRefinableStroke:v17];
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v51 objects:v67 count:16];
        if (v10) {
          continue;
        }
        break;
      }

      if (v11)
      {
        id v18 = *(void **)(a1 + 48);
        double v19 = [v8 strokeProviderVersion];
        int v20 = [v18 isEqual:v19];

        id v21 = os_log_create("com.apple.pencilkit", "AutoRefine");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v47 = [*(id *)(a1 + 40) textResult];
          uint64_t v22 = [v47 refinableTranscription];
          uint64_t v23 = *(void *)(a1 + 48);
          id v24 = [v8 strokeProviderVersion];
          id v25 = [v8 orderedStrokes];
          uint64_t v26 = [v25 count];
          long long v27 = [*(id *)(a1 + 40) strokeIdentifiers];
          uint64_t v28 = [v27 count];
          *(_DWORD *)buf = 138741251;
          id v56 = v22;
          __int16 v57 = 2112;
          uint64_t v58 = v23;
          __int16 v59 = 2112;
          CGFloat v60 = v24;
          __int16 v61 = 1024;
          int v62 = v20;
          __int16 v63 = 2048;
          uint64_t v64 = v26;
          __int16 v65 = 2048;
          uint64_t v66 = v28;
          _os_log_impl(&dword_1C44F8000, v21, OS_LOG_TYPE_DEFAULT, "AutoRefine processing new item with transcription %{sensitive}@ received in recognition manager. Versions = %@ vs %@, match ? %d. Current stroke count = %ld, strokes in item = %ld.", buf, 0x3Au);
        }
        id v29 = -[PKAutoRefineQueryItem initWithQueryItem:usingStrokeProvider:]([PKAutoRefineQueryItem alloc], *(void **)(a1 + 40), v8);
        os_log_t v30 = v29;
        if (v29) {
          Class isa = v29[5].isa;
        }
        else {
          Class isa = 0;
        }
        long long v32 = isa;
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __91__PKRecognitionSessionManager_autoRefineQuery_didUpdateWithQueryItem_validProviderVersion___block_invoke_207;
        v50[3] = &unk_1E64CAD10;
        v50[4] = *(void *)(a1 + 32);
        long long v33 = [(objc_class *)v32 indexesOfObjectsPassingTest:v50];

        if (v30) {
          objc_setProperty_nonatomic_copy(v30, v34, v33, 48);
        }
        if (-[PKAutoRefineTaskManager isTrackingQueryItemIdenticalToQueryItem:](*(void **)(*(void *)(a1 + 32) + 152), v30))
        {
          long long v35 = os_log_create("com.apple.pencilkit", "AutoRefine");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            if (v30) {
              Class v36 = v30[2].isa;
            }
            else {
              Class v36 = 0;
            }
            long long v37 = v36;
            long long v38 = [(objc_class *)v37 refinableTranscription];
            *(_DWORD *)buf = 138739971;
            id v56 = v38;
            _os_log_impl(&dword_1C44F8000, v35, OS_LOG_TYPE_DEFAULT, "AutoRefine item with transcription _%{sensitive}@_ rejected because an identical task is already being tracked.", buf, 0xCu);
          }
        }
        else
        {
          -[PKAutoRefineTaskManager cancelTasksGivenQueryItem:](*(void **)(*(void *)(a1 + 32) + 152), v30);
          uint64_t v43 = *(void *)(*(void *)(a1 + 32) + 152);
          uint64_t v44 = [*(id *)(a1 + 40) textResult];
          uint64_t v45 = [v44 tokenColumnCount] - 1;
          __int16 v46 = *(void **)(a1 + 48);
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __91__PKRecognitionSessionManager_autoRefineQuery_didUpdateWithQueryItem_validProviderVersion___block_invoke_209;
          v48[3] = &unk_1E64CAD60;
          v48[4] = *(void *)(a1 + 32);
          CGRect v49 = v30;
          -[PKAutoRefineTaskManager scheduleAutoRefineTaskForItem:firstColumnToCommit:lastColumnToCommit:providerVersion:delay:taskInitBlock:](v43, v49, 0, v45, v46, v48, 0.0);
        }
        goto LABEL_33;
      }
    }
    else
    {
    }
    os_log_t v30 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v41 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 200));
      int v42 = [v41 hasRefinableStrokes];
      *(_DWORD *)buf = 67109120;
      LODWORD(v56) = v42;
      _os_log_impl(&dword_1C44F8000, v30, OS_LOG_TYPE_DEFAULT, "AutoRefine item rejected because it contains no refinable strokes, current tracker has refinable strokes ? %d", buf, 8u);
    }
  }
  else
  {
    os_log_t v30 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v39 = [*(id *)(a1 + 40) textResult];
      __int16 v40 = [v39 refinableTranscription];
      *(_DWORD *)buf = 138740227;
      id v56 = v40;
      __int16 v57 = 1024;
      LODWORD(v58) = v3;
      _os_log_impl(&dword_1C44F8000, v30, OS_LOG_TYPE_DEFAULT, "AutoRefine item with transcription _%{sensitive}@_ rejected: refinable strokes ? %d, .", buf, 0x12u);
    }
    id v8 = v30;
  }
LABEL_33:
}

uint64_t __91__PKRecognitionSessionManager_autoRefineQuery_didUpdateWithQueryItem_validProviderVersion___block_invoke_207(uint64_t a1, uint64_t a2)
{
  int v3 = [*(id *)(*(void *)(a1 + 32) + 40) _visibleStrokeForIdentifier:a2];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 200));
  uint64_t v5 = [WeakRetained isRefinableStroke:v3];

  return v5;
}

void __91__PKRecognitionSessionManager_autoRefineQuery_didUpdateWithQueryItem_validProviderVersion___block_invoke_209(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = -[PKRecognitionSessionManager directStrokeProviderSnapshot](*(void **)(a1 + 32));
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 40) uuid];
  -[PKAutoRefineTaskManager setCurrentDrawingUUID:](*(void *)(*(void *)(a1 + 32) + 152), v5);

  uint64_t v6 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v16 = v3;
    _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "AutoRefine running init block for immediate task %p - checking if task should be cancelled against one of the autorefinable strokes", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 200));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__PKRecognitionSessionManager_autoRefineQuery_didUpdateWithQueryItem_validProviderVersion___block_invoke_210;
  v11[3] = &unk_1E64CAD38;
  id v12 = *(id *)(a1 + 40);
  id v8 = v3;
  id v13 = v8;
  id v9 = v4;
  id v14 = v9;
  [WeakRetained enumerateRefinableStrokesWithOptions:2 usingBlock:v11];

  uint64_t v10 = -[PKRecognitionSessionManager directStrokeProviderSnapshot](*(void **)(a1 + 32));
  -[PKSqueezePaletteViewContext setSelectedColor:](*(void *)(*(void *)(a1 + 32) + 152), v10);
}

void __91__PKRecognitionSessionManager_autoRefineQuery_didUpdateWithQueryItem_validProviderVersion___block_invoke_210(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  int v7 = *(void **)(a1 + 32);
  if (v7) {
    int v7 = (void *)v7[5];
  }
  id v8 = v7;
  int v9 = [v8 containsObject:v6];

  if (v9)
  {
    uint64_t v10 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v19 = 134217984;
      uint64_t v20 = v11;
      _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "AutoRefine found a refinable stroke covered by the item in the task %p", (uint8_t *)&v19, 0xCu);
    }

    *a4 = 1;
  }
  else
  {
    id v12 = [*(id *)(a1 + 48) drawing];
    id v13 = [v12 _visibleStrokeForIdentifier:v6];

    if (v13)
    {
      LOBYTE(v19) = 0;
      id v14 = *(uint64_t **)(a1 + 40);
      [v13 _bounds];
      -[PKAutoRefineTask trimTaskForNewStrokeInRect:shouldCancel:](v14, (char *)&v19, v15, v16, v17, v18);
      if ((_BYTE)v19)
      {
        -[PKAutoRefineTask cancel](*(void *)(a1 + 40));
        *a4 = 1;
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionSuffixes, 0);
  objc_destroyWeak((id *)&self->_autoRefineViewDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proofreadingTimer, 0);
  objc_storeStrong((id *)&self->q_listeners, 0);
  objc_storeStrong((id *)&self->q_autoRefineManager, 0);
  objc_storeStrong((id *)&self->q_autoRefineQuery, 0);
  objc_storeStrong((id *)&self->_observerWrapper, 0);
  objc_storeStrong((id *)&self->q_queryController, 0);
  objc_storeStrong((id *)&self->q_visibleOnscreenStrokes, 0);
  objc_storeStrong((id *)&self->q_stagingTranscriptionCache, 0);
  objc_storeStrong((id *)&self->q_transcriptionCache, 0);
  objc_storeStrong((id *)&self->q_canvasAttachmentProvider, 0);
  objc_storeStrong((id *)&self->q_calculateDocumentProvider, 0);
  objc_storeStrong((id *)&self->q_previousTime, 0);
  objc_storeStrong((id *)&self->q_textSynthesizer, 0);
  objc_storeStrong((id *)&self->q_textSynthesizerWithLocaleFallback, 0);
  objc_storeStrong((id *)&self->q_session, 0);
  objc_storeStrong((id *)&self->q_drawing, 0);
  objc_storeStrong((id *)&self->_drawingForGetter, 0);

  objc_storeStrong((id *)&self->_recognitionSessionQueue, 0);
}

@end