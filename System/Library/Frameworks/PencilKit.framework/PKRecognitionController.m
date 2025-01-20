@interface PKRecognitionController
+ (BOOL)currentDeviceSupportsAutoRefine;
+ (void)removeStrokesFromStyleInventory:(id)a3;
- (BOOL)canConvertTextToHandwriting:(id)a3;
- (BOOL)shouldCancelForAutoRefineCompletion;
- (PKDrawing)drawing;
- (PKMathRecognitionController)mathRecognitionController;
- (PKRecognitionController)initWithDrawing:(id)a3;
- (PKRecognitionController)initWithDrawing:(id)a3 visibleOnscreenStrokes:(id)a4;
- (PKRecognitionController)initWithDrawing:(id)a3 visibleOnscreenStrokes:(id)a4 useSessionCache:(BOOL)a5;
- (_PKDataDetectorController)dataDetectorController;
- (id)compactSurroundTextResults:(uint64_t)a1;
- (id)contextLookupResultsAtLocation:(CGPoint)a3 completion:(id)a4;
- (id)contextLookupResultsForPath:(CGPath *)a3 completion:(id)a4;
- (id)contextLookupResultsWithSelectedStrokes:(id)a3 completion:(id)a4;
- (id)reflowableLinesInitialStrokes:(id)a3 atLocation:(CGPoint)a4 completion:(id)a5;
- (void)_drawingDidUpdate:(uint64_t)a1;
- (void)convertTextToHandwriting:(id)a3 bounds:(CGRect)a4 inkColor:(id)a5 inputScale:(double)a6 suggestedHeight:(double)a7 suggestedDrawing:(id)a8 progress:(id)a9 completion:(id)a10;
- (void)dealloc;
- (void)recognitionSessionManager:(id)a3 foundDataDetectorItems:(id)a4;
- (void)recognitionSessionManager:(id)a3 foundHashtagItems:(id)a4;
- (void)recognitionSessionManager:(id)a3 foundMentionItems:(id)a4;
- (void)recognitionSessionManager:(id)a3 foundProofreadingItems:(id)a4;
- (void)recognitionSessionManager:(id)a3 foundStrokeGroupItems:(id)a4;
- (void)replaceStrokes:(id)a3 withString:(id)a4 inBounds:(CGRect)a5 inputScale:(double)a6 completion:(id)a7;
- (void)setCalculateDocumentProvider:(id)a3;
- (void)setCanvasAttachmentProvider:(id)a3;
- (void)setDrawing:(id)a3;
- (void)setDrawing:(id)a3 withVisibleOnscreenStrokes:(id)a4;
- (void)setVisibleOnscreenStrokes:(id)a3;
- (void)tagAsActive;
- (void)tagAsIdle;
@end

@implementation PKRecognitionController

- (PKRecognitionController)initWithDrawing:(id)a3
{
  return [(PKRecognitionController *)self initWithDrawing:a3 visibleOnscreenStrokes:0];
}

- (PKRecognitionController)initWithDrawing:(id)a3 visibleOnscreenStrokes:(id)a4
{
  return [(PKRecognitionController *)self initWithDrawing:a3 visibleOnscreenStrokes:a4 useSessionCache:0];
}

- (PKRecognitionController)initWithDrawing:(id)a3 visibleOnscreenStrokes:(id)a4 useSessionCache:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKRecognitionController;
  v10 = [(PKRecognitionController *)&v20 init];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
    listenerID = v10->_listenerID;
    v10->_listenerID = (NSUUID *)v11;

    +[PKRecognitionSessionManagerConfiguration interactiveCanvasConfiguration]();
    v13 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v5 && v13) {
      v13[8] = 1;
    }
    v15 = -[PKRecognitionSessionManager initWithConfiguration:]((char *)[PKRecognitionSessionManager alloc], v13);
    -[PKRecognitionSessionManager setDelegate:]((uint64_t)v15, v10);
    -[PKRecognitionSessionManager addListener:]((uint64_t)v15, v10->_listenerID);
    sessionManager = v10->_sessionManager;
    v10->_sessionManager = (PKRecognitionSessionManager *)v15;
    v17 = v15;

    v18 = [v8 uuid];
    +[PKRecognitionSessionCache addRecognitionSession:forUUID:]((uint64_t)PKRecognitionSessionCache, v17, v18);

    if (v9) {
      -[PKRecognitionSessionManager setDrawing:withVisibleOnscreenStrokes:](v17, v8, v9);
    }
    else {
      -[PKRecognitionSessionManager setDrawing:](v17, v8);
    }

    -[PKRecognitionController _drawingDidUpdate:]((uint64_t)v10, v8);
  }

  return v10;
}

- (void)_drawingDidUpdate:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 16);
    if (v4)
    {
      -[PKMathRecognitionController _drawingDidUpdate:](v4, v3);
      BOOL v5 = (void *)MEMORY[0x1E4F1CA80];
      v6 = [v3 strokes];
      v7 = objc_msgSend(v5, "setWithCapacity:", objc_msgSend(v6, "count"));

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v8 = objc_msgSend(v3, "strokes", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v21;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v21 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = [*(id *)(*((void *)&v20 + 1) + 8 * v12) _strokeUUID];
            if (v13) {
              [v7 addObject:v13];
            }

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v10);
      }

      v15 = (void **)(a1 + 32);
      v14 = *(void **)(a1 + 32);
      if (v14)
      {
        v16 = (void *)[v14 mutableCopy];
        [v16 minusSet:v7];
        objc_storeStrong((id *)(a1 + 32), v7);
        if ([v16 count])
        {
          v17 = *(void **)(a1 + 16);
          v18 = (void *)[v16 copy];
          [v17 didEraseStrokes:v18];
        }
      }
      else
      {
        id v19 = v7;
        v16 = *v15;
        char *v15 = v19;
      }
    }
  }
}

- (void)dealloc
{
  -[PKRecognitionSessionManager removeListener:]((uint64_t)self->_sessionManager, self->_listenerID);
  v3.receiver = self;
  v3.super_class = (Class)PKRecognitionController;
  [(PKRecognitionController *)&v3 dealloc];
}

- (void)tagAsIdle
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v3 = os_log_create("com.apple.pencilkit", "Math");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(PKRecognitionController *)self drawing];
    BOOL v5 = [v4 uuid];
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "Tag recognition session as idle: %@", (uint8_t *)&v6, 0xCu);
  }
  -[PKRecognitionSessionManager tagAsIdle]((uint64_t)self->_sessionManager);
}

- (void)tagAsActive
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v3 = os_log_create("com.apple.pencilkit", "Math");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(PKRecognitionController *)self drawing];
    BOOL v5 = [v4 uuid];
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "Tag recognition session as active: %@", (uint8_t *)&v6, 0xCu);
  }
  -[PKRecognitionSessionManager tagAsActive]((uint64_t)self->_sessionManager);
}

- (void)setDrawing:(id)a3 withVisibleOnscreenStrokes:(id)a4
{
  sessionManager = self->_sessionManager;
  id v7 = a3;
  -[PKRecognitionSessionManager setDrawing:withVisibleOnscreenStrokes:](sessionManager, v7, a4);
  -[PKRecognitionController _drawingDidUpdate:]((uint64_t)self, v7);
}

- (void)setVisibleOnscreenStrokes:(id)a3
{
}

- (void)setDrawing:(id)a3
{
  sessionManager = self->_sessionManager;
  id v5 = a3;
  -[PKRecognitionSessionManager setDrawing:](sessionManager, v5);
  -[PKRecognitionController _drawingDidUpdate:]((uint64_t)self, v5);
}

- (PKDrawing)drawing
{
  return (PKDrawing *)-[PKRecognitionSessionManager drawing](self->_sessionManager);
}

- (_PKDataDetectorController)dataDetectorController
{
  p_dataDetectorController = &self->_dataDetectorController;
  uint64_t v4 = self->_dataDetectorController;
  if (!v4)
  {
    uint64_t v4 = objc_alloc_init(_PKDataDetectorController);
    objc_storeStrong((id *)p_dataDetectorController, v4);
    -[PKRecognitionSessionManager setWantsDataDetection:]((uint64_t)self->_sessionManager, 1);
  }

  return v4;
}

- (PKMathRecognitionController)mathRecognitionController
{
  p_mathRecognitionController = &self->_mathRecognitionController;
  uint64_t v4 = self->_mathRecognitionController;
  if (!v4)
  {
    id v5 = objc_alloc_init(PKMathRecognitionController);
    int v6 = v5;
    if (v5) {
      objc_storeWeak((id *)&v5[1].super.isa, self->_sessionManager);
    }
    objc_storeStrong((id *)p_mathRecognitionController, v6);
    -[PKRecognitionSessionManager setupForMath]((uint64_t)self->_sessionManager);
    sessionManager = self->_sessionManager;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__PKRecognitionController_mathRecognitionController__block_invoke;
    v9[3] = &unk_1E64CA8D8;
    uint64_t v4 = v6;
    uint64_t v10 = v4;
    -[PKRecognitionSessionManager fetchCurrentStrokeGroupItems:]((uint64_t)sessionManager, v9);
  }

  return v4;
}

void __52__PKRecognitionController_mathRecognitionController__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v9 = [v3 count];
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Found existing stroke groups when setting up math: %lu", buf, 0xCu);
    }

    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52__PKRecognitionController_mathRecognitionController__block_invoke_10;
    v5[3] = &unk_1E64C5F60;
    id v6 = *(id *)(a1 + 32);
    id v7 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

void __52__PKRecognitionController_mathRecognitionController__block_invoke_10(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    -[PKMathRecognitionController _foundStrokeGroups:canDelay:](v2, *(void **)(a1 + 40), 1);
  }
}

- (id)contextLookupResultsAtLocation:(CGPoint)a3 completion:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = objc_alloc(MEMORY[0x1E4F5C030]);
  uint64_t v9 = -[PKRecognitionSessionManager session](self->_sessionManager);
  uint64_t v10 = (void *)[v8 initWithRecognitionSession:v9];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__PKRecognitionController_contextLookupResultsAtLocation_completion___block_invoke;
  v16[3] = &unk_1E64CA900;
  objc_copyWeak(&v18, &location);
  id v11 = v7;
  id v17 = v11;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__PKRecognitionController_contextLookupResultsAtLocation_completion___block_invoke_16;
  v14[3] = &unk_1E64CA928;
  objc_copyWeak(&v15, &location);
  uint64_t v12 = objc_msgSend(v10, "contextLookupResultsAtLocation:completion:shouldCancel:", v16, v14, x, y);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v12;
}

void __69__PKRecognitionController_contextLookupResultsAtLocation_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.pencilkit", "Generative");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    uint64_t v15 = [v5 count];
    _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Context Lookup - Found %lu strokes at location", (uint8_t *)&v14, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = WeakRetained[6];
    uint64_t v12 = -[PKRecognitionSessionManager drawing](v11);
    v13 = [v12 strokesForCHStrokeIdentifiers:v5];
    (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v13, v6);
  }
}

BOOL __69__PKRecognitionController_contextLookupResultsAtLocation_completion___block_invoke_16(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v2 = WeakRetained == 0;

  return v2;
}

- (id)contextLookupResultsForPath:(CGPath *)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = objc_alloc(MEMORY[0x1E4F5C030]);
  id v8 = -[PKRecognitionSessionManager session](self->_sessionManager);
  uint64_t v9 = (void *)[v7 initWithRecognitionSession:v8];

  if (objc_opt_respondsToSelector())
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__PKRecognitionController_contextLookupResultsForPath_completion___block_invoke;
    v14[3] = &unk_1E64CA978;
    objc_copyWeak(&v16, &location);
    void v14[4] = self;
    id v15 = v6;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__PKRecognitionController_contextLookupResultsForPath_completion___block_invoke_2;
    v12[3] = &unk_1E64CA928;
    objc_copyWeak(&v13, &location);
    uint64_t v10 = [v9 structuredContextLookupResultsWithSelectionPath:a3 completion:v14 shouldCancel:v12];
    objc_destroyWeak(&v13);

    objc_destroyWeak(&v16);
  }
  else
  {
    (*((void (**)(id, void, void, void, void))v6 + 2))(v6, 0, 0, 0, 0);
    uint64_t v10 = 0;
  }

  objc_destroyWeak(&location);

  return v10;
}

void __66__PKRecognitionController_contextLookupResultsForPath_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = os_log_create("com.apple.pencilkit", "Generative");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v34 = [v11 count];
    __int16 v35 = 2048;
    uint64_t v36 = [v12 count];
    _os_log_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEFAULT, "Context Lookup - Found %lu text results and %lu surrounding text results from path", buf, 0x16u);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v15 = [MEMORY[0x1E4F1CA48] array];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __66__PKRecognitionController_contextLookupResultsForPath_completion___block_invoke_21;
    v30[3] = &unk_1E64CA950;
    id v31 = v15;
    id v26 = v15;
    [v11 enumerateObjectsUsingBlock:v30];
    uint64_t v25 = -[PKRecognitionController compactSurroundTextResults:](*(void *)(a1 + 32), v12);
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = WeakRetained[6];
    v27 = -[PKRecognitionSessionManager drawing](v17);
    [v27 strokesForCHStrokeIdentifiers:v9];
    id v18 = v29 = v9;
    id v19 = v11;
    id v20 = WeakRetained[6];
    -[PKRecognitionSessionManager drawing](v20);
    long long v21 = v28 = v12;
    long long v22 = [v21 strokesForCHStrokeIdentifiers:v10];
    v32 = v25;
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    v24 = id v23 = v10;
    (*(void (**)(uint64_t, void *, void *, id, void *))(v16 + 16))(v16, v18, v22, v26, v24);

    id v11 = v19;
    id v10 = v23;

    id v12 = v28;
    id v9 = v29;
  }
}

void __66__PKRecognitionController_contextLookupResultsForPath_completion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3 = [a2 topTranscription];
  [*(id *)(a1 + 32) addObject:v3];
}

- (id)compactSurroundTextResults:(uint64_t)a1
{
  if (a1)
  {
    BOOL v2 = (void *)MEMORY[0x1E4F28B88];
    id v3 = a2;
    uint64_t v4 = [v2 whitespaceAndNewlineCharacterSet];
    id v5 = objc_opt_new();
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __54__PKRecognitionController_compactSurroundTextResults___block_invoke;
    id v13 = &unk_1E64CA9A0;
    id v14 = v5;
    id v15 = v4;
    id v6 = v4;
    id v7 = v5;
    [v3 enumerateObjectsUsingBlock:&v10];

    id v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

BOOL __66__PKRecognitionController_contextLookupResultsForPath_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v2 = WeakRetained == 0;

  return v2;
}

- (id)contextLookupResultsWithSelectedStrokes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = objc_alloc(MEMORY[0x1E4F5C030]);
  id v9 = -[PKRecognitionSessionManager session](self->_sessionManager);
  uint64_t v10 = (void *)[v8 initWithRecognitionSession:v9];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v6];
    id v12 = +[PKStrokeProvider _identifiersForStrokes:v11];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __78__PKRecognitionController_contextLookupResultsWithSelectedStrokes_completion___block_invoke;
    v17[3] = &unk_1E64CA978;
    objc_copyWeak(&v19, &location);
    v17[4] = self;
    id v18 = v7;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__PKRecognitionController_contextLookupResultsWithSelectedStrokes_completion___block_invoke_2;
    v15[3] = &unk_1E64CA928;
    objc_copyWeak(&v16, &location);
    id v13 = [v10 structuredContextLookupResultsWithSelectedStrokes:v12 completion:v17 shouldCancel:v15];
    objc_destroyWeak(&v16);

    objc_destroyWeak(&v19);
  }
  else
  {
    (*((void (**)(id, void, void, void, void))v7 + 2))(v7, 0, 0, 0, 0);
    id v13 = 0;
  }

  objc_destroyWeak(&location);

  return v13;
}

void __78__PKRecognitionController_contextLookupResultsWithSelectedStrokes_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v14 = os_log_create("com.apple.pencilkit", "Generative");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v33 = [v11 count];
      __int16 v34 = 2048;
      uint64_t v35 = [v12 count];
      _os_log_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_DEFAULT, "Context Lookup - Found %lu text results and %lu surrounding text results from selected strokes", buf, 0x16u);
    }

    id v15 = [MEMORY[0x1E4F1CA48] array];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __78__PKRecognitionController_contextLookupResultsWithSelectedStrokes_completion___block_invoke_29;
    v29[3] = &unk_1E64CA950;
    id v30 = v15;
    id v25 = v15;
    [v11 enumerateObjectsUsingBlock:v29];
    v24 = -[PKRecognitionController compactSurroundTextResults:](*(void *)(a1 + 32), v12);
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = WeakRetained[6];
    id v26 = -[PKRecognitionSessionManager drawing](v17);
    [v26 strokesForCHStrokeIdentifiers:v9];
    id v18 = v28 = v9;
    id v19 = WeakRetained[6];
    -[PKRecognitionSessionManager drawing](v19);
    id v20 = v27 = v12;
    [v20 strokesForCHStrokeIdentifiers:v10];
    v22 = long long v21 = WeakRetained;
    id v31 = v24;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    (*(void (**)(uint64_t, void *, void *, id, void *))(v16 + 16))(v16, v18, v22, v25, v23);

    id WeakRetained = v21;
    id v12 = v27;

    id v9 = v28;
  }
}

void __78__PKRecognitionController_contextLookupResultsWithSelectedStrokes_completion___block_invoke_29(uint64_t a1, void *a2)
{
  id v3 = [a2 topTranscription];
  [*(id *)(a1 + 32) addObject:v3];
}

BOOL __78__PKRecognitionController_contextLookupResultsWithSelectedStrokes_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v2 = WeakRetained == 0;

  return v2;
}

void __54__PKRecognitionController_compactSurroundTextResults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 topTranscription];
  if ([v3 length])
  {
    [*(id *)(a1 + 32) appendString:v3];
    if ((objc_msgSend(*(id *)(a1 + 40), "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", objc_msgSend(v3, "length") - 1)) & 1) == 0)objc_msgSend(*(id *)(a1 + 32), "appendString:", @"\n"); {
  }
    }
}

+ (BOOL)currentDeviceSupportsAutoRefine
{
  BOOL v2 = PKIsPadDevice();
  if (v2) {
    LOBYTE(v2) = CHGetPersonalizedSynthesisSupportState() > 2;
  }
  return v2;
}

- (BOOL)shouldCancelForAutoRefineCompletion
{
  p_isa = &self->super.isa;
  if (self)
  {
    sessionManager = self->_sessionManager;
    if (!sessionManager) {
      goto LABEL_8;
    }
    if (-[PKAutoRefineTaskManager hasOngoingAnimationTask](sessionManager->q_autoRefineManager)) {
      return 1;
    }
    uint64_t v5 = p_isa[6];
    if (v5) {
      p_isa = objc_loadWeakRetained((id *)(v5 + 200));
    }
    else {
LABEL_8:
    }
      p_isa = 0;
  }
  [p_isa clearRefinableStrokes];

  return 0;
}

- (id)reflowableLinesInitialStrokes:(id)a3 atLocation:(CGPoint)a4 completion:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = _PKSignpostLog();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  id v13 = _PKSignpostLog();
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "reflowableLinesInitialStrokes", (const char *)&unk_1C48540E6, buf, 2u);
  }

  id v15 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_INFO, "BEGIN \"reflowableLinesInitialStrokes\"", buf, 2u);
  }

  id v16 = objc_alloc(MEMORY[0x1E4F5C078]);
  id v17 = -[PKRecognitionSessionManager session](self->_sessionManager);
  id v18 = (void *)[v16 initWithRecognitionSession:v17];

  sessionManager = self->_sessionManager;
  if (sessionManager) {
    id WeakRetained = objc_loadWeakRetained((id *)&sessionManager->_autoRefineViewDelegate);
  }
  else {
    id WeakRetained = 0;
  }
  [WeakRetained clearRefinableStrokes];

  long long v21 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v9];
  long long v22 = +[PKStrokeProvider _identifiersForStrokes:v21];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __79__PKRecognitionController_reflowableLinesInitialStrokes_atLocation_completion___block_invoke;
  v28[3] = &unk_1E64CA9C8;
  os_signpost_id_t v30 = v12;
  v28[4] = self;
  id v23 = v10;
  id v29 = v23;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __79__PKRecognitionController_reflowableLinesInitialStrokes_atLocation_completion___block_invoke_36;
  v26[3] = &unk_1E64CA928;
  objc_copyWeak(&v27, &location);
  v24 = objc_msgSend(v18, "reflowableTextTokensForInitialStrokes:point:completion:shouldCancel:", v22, v28, v26, x, y);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&location);

  return v24;
}

void __79__PKRecognitionController_reflowableLinesInitialStrokes_atLocation_completion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _PKSignpostLog();
  uint64_t v5 = v4;
  os_signpost_id_t v6 = a1[6];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v5, OS_SIGNPOST_INTERVAL_END, v6, "reflowableLinesInitialStrokes", (const char *)&unk_1C48540E6, buf, 2u);
  }

  id v7 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_INFO, "END \"reflowableLinesInitialStrokes\"", v13, 2u);
  }

  uint64_t v8 = a1[4];
  if (v8
    && (uint64_t v9 = *(void *)(v8 + 48)) != 0
    && -[PKAutoRefineTaskManager hasOngoingAnimationTask](*(void **)(v9 + 152)))
  {
    id v10 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)os_signpost_id_t v12 = 0;
      _os_log_error_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_ERROR, "AutoRefine: No reflow result because hasOngoingAutoRefineAnimationTask=YES", v12, 2u);
    }

    id v11 = *(void (**)(void))(a1[5] + 16);
  }
  else
  {
    id v11 = *(void (**)(void))(a1[5] + 16);
  }
  v11();
}

BOOL __79__PKRecognitionController_reflowableLinesInitialStrokes_atLocation_completion___block_invoke_36(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v2 = WeakRetained == 0;

  return v2;
}

- (void)setCalculateDocumentProvider:(id)a3
{
}

- (void)setCanvasAttachmentProvider:(id)a3
{
}

- (BOOL)canConvertTextToHandwriting:(id)a3
{
  id v4 = a3;
  if (CHGetPersonalizedSynthesisSupportState() == 4)
  {
    if (self) {
      sessionManager = self->_sessionManager;
    }
    else {
      sessionManager = 0;
    }
    BOOL v6 = -[PKRecognitionSessionManager canSynthesizeDrawingForText:]((uint64_t)sessionManager, v4);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)convertTextToHandwriting:(id)a3 bounds:(CGRect)a4 inkColor:(id)a5 inputScale:(double)a6 suggestedHeight:(double)a7 suggestedDrawing:(id)a8 progress:(id)a9 completion:(id)a10
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v21 = a3;
  id v22 = a5;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = _PKSignpostLog();
  os_signpost_id_t v27 = os_signpost_id_generate(v26);

  id v28 = _PKSignpostLog();
  id v29 = v28;
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "Synthesize convertTextToHandwriting", (const char *)&unk_1C48540E6, buf, 2u);
  }

  os_signpost_id_t v30 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v30, OS_LOG_TYPE_INFO, "BEGIN \"Synthesize convertTextToHandwriting\"", buf, 2u);
  }

  if (!v23)
  {
    id v23 = [(PKRecognitionController *)self drawing];
  }
  if (self) {
    self = (PKRecognitionController *)self->_sessionManager;
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __132__PKRecognitionController_convertTextToHandwriting_bounds_inkColor_inputScale_suggestedHeight_suggestedDrawing_progress_completion___block_invoke;
  v32[3] = &unk_1E64CAA18;
  id v33 = v25;
  os_signpost_id_t v34 = v27;
  id v31 = v25;
  -[PKRecognitionSessionManager synthesizeDrawingForText:drawing:inkColor:inputScale:suggestedHeight:bounds:progress:completion:](self, v21, v23, a6, a7, x, y, width, height, (uint64_t)v22, v24, v32);
}

void __132__PKRecognitionController_convertTextToHandwriting_bounds_inkColor_inputScale_suggestedHeight_suggestedDrawing_progress_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __132__PKRecognitionController_convertTextToHandwriting_bounds_inkColor_inputScale_suggestedHeight_suggestedDrawing_progress_completion___block_invoke_2;
  block[3] = &unk_1E64CA9F0;
  id v10 = *(void **)(a1 + 32);
  uint64_t v19 = *(void *)(a1 + 40);
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __132__PKRecognitionController_convertTextToHandwriting_bounds_inkColor_inputScale_suggestedHeight_suggestedDrawing_progress_completion___block_invoke_2(uint64_t a1)
{
  BOOL v2 = _PKSignpostLog();
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Synthesize convertTextToHandwriting", (const char *)&unk_1C48540E6, buf, 2u);
  }

  uint64_t v5 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_INFO, "END \"Synthesize convertTextToHandwriting\"", v7, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)replaceStrokes:(id)a3 withString:(id)a4 inBounds:(CGRect)a5 inputScale:(double)a6 completion:(id)a7
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  id v18 = _PKSignpostLog();
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  id v20 = _PKSignpostLog();
  id v21 = v20;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "Synthesize replaceStrokes", (const char *)&unk_1C48540E6, buf, 2u);
  }

  id v22 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v22, OS_LOG_TYPE_INFO, "BEGIN \"Synthesize replaceStrokes\"", buf, 2u);
  }

  if (self) {
    sessionManager = self->_sessionManager;
  }
  else {
    sessionManager = 0;
  }
  id v24 = sessionManager;
  id v25 = [(PKRecognitionController *)self drawing];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __84__PKRecognitionController_replaceStrokes_withString_inBounds_inputScale_completion___block_invoke;
  v27[3] = &unk_1E64CAA18;
  id v28 = v15;
  os_signpost_id_t v29 = v19;
  id v26 = v15;
  -[PKRecognitionSessionManager synthesizeDrawingForReplacementText:drawing:strokes:bounds:inputScale:completion:](v24, v16, v25, v17, v27, x, y, width, height, a6);
}

void __84__PKRecognitionController_replaceStrokes_withString_inBounds_inputScale_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PKRecognitionController_replaceStrokes_withString_inBounds_inputScale_completion___block_invoke_2;
  block[3] = &unk_1E64CA9F0;
  id v10 = *(void **)(a1 + 32);
  uint64_t v19 = *(void *)(a1 + 40);
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __84__PKRecognitionController_replaceStrokes_withString_inBounds_inputScale_completion___block_invoke_2(uint64_t a1)
{
  BOOL v2 = _PKSignpostLog();
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Synthesize replaceStrokes", (const char *)&unk_1C48540E6, buf, 2u);
  }

  uint64_t v5 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_INFO, "END \"Synthesize replaceStrokes\"", v7, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (void)removeStrokesFromStyleInventory:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = +[PKStrokeProvider slicesForStrokes:a3];
  os_signpost_id_t v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v3, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "encodedStrokeIdentifier", (void)v11);
        if (v10) {
          [v4 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [MEMORY[0x1E4F5C068] updateStyleInventoryWithRemovedStrokeIdentifiers:v4];
}

- (void)recognitionSessionManager:(id)a3 foundDataDetectorItems:(id)a4
{
  id v8 = a4;
  -[_PKDataDetectorController _foundDataDetectorItems:]((uint64_t)self->_dataDetectorController, (uint64_t)v8);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_internalDelegate);
    [v7 recognitionController:self foundDataDetectorItems:v8];
  }
}

- (void)recognitionSessionManager:(id)a3 foundHashtagItems:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_internalDelegate);
    [v7 recognitionController:self foundHashtagItems:v8];
  }
}

- (void)recognitionSessionManager:(id)a3 foundMentionItems:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_internalDelegate);
    [v7 recognitionController:self foundMentionItems:v8];
  }
}

- (void)recognitionSessionManager:(id)a3 foundProofreadingItems:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_internalDelegate);
    [v7 recognitionController:self foundProofreadingItems:v8];
  }
}

- (void)recognitionSessionManager:(id)a3 foundStrokeGroupItems:(id)a4
{
  id v5 = a4;
  char v6 = v5;
  if (self->_mathRecognitionController)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __75__PKRecognitionController_recognitionSessionManager_foundStrokeGroupItems___block_invoke;
    v7[3] = &unk_1E64C5F60;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

void __75__PKRecognitionController_recognitionSessionManager_foundStrokeGroupItems___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) mathRecognitionController];
  if (v2)
  {
    id v3 = v2;
    -[PKMathRecognitionController _foundStrokeGroups:canDelay:]((uint64_t)v2, *(void **)(a1 + 40), 1);
    BOOL v2 = v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_destroyWeak((id *)&self->_internalDelegate);
  objc_storeStrong((id *)&self->_currentDrawingStrokeUUIDs, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
  objc_storeStrong((id *)&self->_mathRecognitionController, 0);

  objc_storeStrong((id *)&self->_dataDetectorController, 0);
}

@end