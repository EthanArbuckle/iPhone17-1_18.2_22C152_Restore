@interface PKAutoRefineController
- (BOOL)stableSynthesisParametersFromSourceStrokes:(void *)a3 outInk:(void *)a4 outReferenceStroke:;
- (PKAutoRefineController)init;
- (uint64_t)isRefinableStroke:(uint64_t)result;
- (void)clearRefinableStrokes;
- (void)indexRefinableStroke:(uint64_t)a1;
- (void)removeAsRefinableStrokes:(uint64_t)a1;
- (void)setIsAutoRefineOn:(int)a3 force:;
@end

@implementation PKAutoRefineController

- (PKAutoRefineController)init
{
  v14.receiver = self;
  v14.super_class = (Class)PKAutoRefineController;
  v2 = [(PKAutoRefineController *)&v14 init];
  if (v2)
  {
    v2->_isAutoRefineOn = +[PKSettingsDaemon autoRefineEnabled];
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    refinableLocalPencilStrokeUUIDs = v2->_refinableLocalPencilStrokeUUIDs;
    v2->_refinableLocalPencilStrokeUUIDs = (NSMutableArray *)v3;

    objc_initWeak(&location, v2);
    v5 = [PKAutoRefineSettingsObserver alloc];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __30__PKAutoRefineController_init__block_invoke;
    v11[3] = &unk_1E64C6690;
    objc_copyWeak(&v12, &location);
    v6 = (PKAutoRefineSettingsObserver *)-[PKAutoRefineSettingsObserver initWithHandler:](v5, v11);
    settingsObserver = v2->_settingsObserver;
    v2->_settingsObserver = v6;

    v8 = os_log_create("com.apple.pencilkit", "PKAutoRefineController");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v10 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEBUG, "AutoRefine create PKAutoRefineController.", v10, 2u);
    }

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__PKAutoRefineController_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__PKAutoRefineController_init__block_invoke_2;
  v4[3] = &unk_1E64C5998;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  PKPerformOnMainThread(v4);
  objc_destroyWeak(&v5);
}

void __30__PKAutoRefineController_init__block_invoke_2(uint64_t a1)
{
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = os_log_create("com.apple.pencilkit", "PKAutoRefineController");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Handle AutoRefine settings did change.", buf, 2u);
    }

    int v3 = +[PKSettingsDaemon autoRefineEnabled];
    WeakRetained = v4;
    if (v4[24] != v3)
    {
      -[PKAutoRefineController clearRefinableStrokes]((uint64_t)v4);
      WeakRetained = v4;
      v4[24] = v3;
    }
  }
}

- (void)setIsAutoRefineOn:(int)a3 force:
{
  if (a1)
  {
    char v4 = a2;
    if (*(unsigned __int8 *)(a1 + 24) != a2)
    {
      -[PKAutoRefineController clearRefinableStrokes](a1);
      *(unsigned char *)(a1 + 24) = v4;
    }
    if (a3)
    {
      v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0;
    }
  }
}

- (void)clearRefinableStrokes
{
  if (a1)
  {
    [*(id *)(a1 + 8) removeAllObjects];
    v1 = os_log_create("com.apple.pencilkit", "PKAutoRefineController");
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v2 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v1, OS_LOG_TYPE_DEBUG, "AutoRefine _refinableLocalPencilStrokeUUIDs cleared.", v2, 2u);
    }
  }
}

- (void)indexRefinableStroke:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = v3;
  if (a1 && v3 && *(unsigned char *)(a1 + 24))
  {
    id v5 = *(void **)(a1 + 8);
    v6 = [v3 _strokeUUID];
    [v5 addObject:v6];

    v7 = os_log_create("com.apple.pencilkit", "PKAutoRefineController");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      [v4 _bounds];
      v8 = NSStringFromCGRect(v15);
      uint64_t v9 = [*(id *)(a1 + 8) count];
      int v10 = 138412546;
      v11 = v8;
      __int16 v12 = 2048;
      uint64_t v13 = v9;
      _os_log_debug_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEBUG, "AutoRefine _refinableLocalPencilStrokeUUIDs adding one stroke (bounds = %@) -> new count = %ld", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (uint64_t)isRefinableStroke:(uint64_t)result
{
  if (result)
  {
    v2 = *(void **)(result + 8);
    id v3 = [a2 _strokeUUID];
    uint64_t v4 = [v2 containsObject:v3];

    return v4;
  }
  return result;
}

- (void)removeAsRefinableStrokes:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(a1 + 8);
          int v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) _strokeUUID];
          [v9 removeObject:v10];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v6);
    }
    v11 = os_log_create("com.apple.pencilkit", "PKAutoRefineController");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [v4 count];
      uint64_t v13 = [*(id *)(a1 + 8) count];
      *(_DWORD *)buf = 134218240;
      uint64_t v19 = v12;
      __int16 v20 = 2048;
      uint64_t v21 = v13;
      _os_log_debug_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEBUG, "AutoRefine _refinableLocalPencilStrokeUUIDs removed %ld strokes -> new count = %ld", buf, 0x16u);
    }
  }
}

- (BOOL)stableSynthesisParametersFromSourceStrokes:(void *)a3 outInk:(void *)a4 outReferenceStroke:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = v7;
  if (!a1)
  {
    BOOL v13 = 0;
    goto LABEL_13;
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 1;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__28;
  v34 = __Block_byref_object_dispose__28;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__28;
  v28 = __Block_byref_object_dispose__28;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__28;
  v22 = __Block_byref_object_dispose__28;
  id v23 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = -1;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __95__PKAutoRefineController_stableSynthesisParametersFromSourceStrokes_outInk_outReferenceStroke___block_invoke;
  v16[3] = &unk_1E64CAAB8;
  v16[4] = a1;
  v16[5] = v17;
  v16[6] = &v24;
  v16[7] = &v18;
  v16[8] = &v30;
  v16[9] = &v36;
  [v7 enumerateObjectsWithOptions:2 usingBlock:v16];
  uint64_t v9 = *(void **)(a1 + 32);
  if (v9 && *((unsigned char *)v37 + 24) && (void *)v31[5] == v9)
  {
    *a3 = v9;
    id v11 = *(id *)(a1 + 40);
  }
  else
  {
    int v10 = (void *)v25[5];
    if (!v10)
    {
      uint64_t v12 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = [v8 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v41 = v15;
        _os_log_error_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_ERROR, "AutoRefine: No reflowable stroke identified among %ld stroke to determine the synthesis parameters, fallback to using a non-refinable stroke instead.", buf, 0xCu);
      }

      *a3 = [(id)v19[5] _ink];
      BOOL v13 = 0;
      *a4 = (id) v19[5];
      goto LABEL_12;
    }
    *a3 = [v10 _ink];
    id v11 = (id) v25[5];
  }
  *a4 = v11;
  BOOL v13 = *((unsigned char *)v37 + 24) != 0;
LABEL_12:
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
LABEL_13:

  return v13;
}

void __95__PKAutoRefineController_stableSynthesisParametersFromSourceStrokes_outInk_outReferenceStroke___block_invoke(void *a1, void *a2)
{
  id v16 = a2;
  uint64_t v4 = *(void **)(a1[4] + 8);
  uint64_t v5 = [v16 _strokeUUID];
  uint64_t v6 = [v4 indexOfObject:v5];

  if (([v16 _isSynthesizedInk] & 1) == 0
    && v6 != 0x7FFFFFFFFFFFFFFFLL
    && v6 > *(void *)(*(void *)(a1[5] + 8) + 24))
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *(void *)(*(void *)(a1[5] + 8) + 24) = v6;
  }
  uint64_t v7 = *(void *)(a1[7] + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  uint64_t v8 = (id *)(v7 + 40);
  if (!v9) {
    objc_storeStrong(v8, a2);
  }
  uint64_t v10 = *(void *)(*(void *)(a1[8] + 8) + 40);
  id v11 = [v16 ink];
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)(a1[8] + 8);
  long long v14 = *(void **)(v13 + 40);
  if (v10)
  {
    char v15 = [v11 isEqual:v14];

    if ((v15 & 1) == 0) {
      *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 0;
    }
  }
  else
  {
    *(void *)(v13 + 40) = v11;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableReferenceStroke, 0);
  objc_storeStrong((id *)&self->_stableInk, 0);
  objc_storeStrong((id *)&self->_settingsObserver, 0);

  objc_storeStrong((id *)&self->_refinableLocalPencilStrokeUUIDs, 0);
}

@end