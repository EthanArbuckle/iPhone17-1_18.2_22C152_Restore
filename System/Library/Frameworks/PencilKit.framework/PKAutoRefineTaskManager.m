@interface PKAutoRefineTaskManager
- (BOOL)isTrackingQueryItemIdenticalToQueryItem:(void *)a1;
- (PKAutoRefineTaskManager)init;
- (void)autoRefineTask:(id)a3 isReadyToSynthesizeRefinedDrawingForStrokes:(id)a4 transcription:(id)a5 drawingUUID:(id)a6;
- (void)cancelAllTasks;
- (void)cancelTasksGivenQueryItem:(void *)a1;
- (void)cancelTasksGivenRefinableStroke:(void *)a1;
- (void)dealloc;
- (void)hasOngoingAnimationTask;
- (void)scheduleAutoRefineTaskForItem:(uint64_t)a3 firstColumnToCommit:(uint64_t)a4 lastColumnToCommit:(void *)a5 providerVersion:(void *)a6 delay:(double)a7 taskInitBlock:;
- (void)setCurrentDrawingUUID:(uint64_t)a1;
@end

@implementation PKAutoRefineTaskManager

- (PKAutoRefineTaskManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)PKAutoRefineTaskManager;
  v2 = [(PKAutoRefineTaskManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
    tasksQueue = v2->_tasksQueue;
    v2->_tasksQueue = (NSMutableArray *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.PencilKit.AutoRefineTaskManager", v5);
    autoRefineQueue = v2->_autoRefineQueue;
    v2->_autoRefineQueue = (OS_dispatch_queue *)v6;
  }
  v8 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_debug_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEBUG, "AutoRefine taskManager created", v10, 2u);
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    activeTask = self->_activeTask;
    uint64_t v6 = [(NSMutableArray *)self->_tasksQueue count];
    *(_DWORD *)buf = 67109376;
    BOOL v9 = activeTask != 0;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    _os_log_debug_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEBUG, "AutoRefine taskManager destroyed, had active task ? %d, %ld tasks", buf, 0x12u);
  }

  v4 = self->_activeTask;
  self->_activeTask = 0;

  [(NSMutableArray *)self->_tasksQueue removeAllObjects];
  v7.receiver = self;
  v7.super_class = (Class)PKAutoRefineTaskManager;
  [(PKAutoRefineTaskManager *)&v7 dealloc];
}

- (void)scheduleAutoRefineTaskForItem:(uint64_t)a3 firstColumnToCommit:(uint64_t)a4 lastColumnToCommit:(void *)a5 providerVersion:(void *)a6 delay:(double)a7 taskInitBlock:
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  v60 = a2;
  id v59 = a5;
  id v58 = a6;
  if (a1)
  {
    v13 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v42 = v60;
      if (v60) {
        v42 = (void *)v60[2];
      }
      id v43 = v42;
      v44 = [v43 refinableTranscription];
      uint64_t v45 = *(void *)(a1 + 16);
      uint64_t v46 = [*(id *)(a1 + 24) count];
      *(_DWORD *)buf = 138740483;
      v79 = v44;
      __int16 v80 = 1024;
      *(_DWORD *)v81 = v45 != 0;
      *(_WORD *)&v81[4] = 2048;
      *(void *)&v81[6] = v46;
      _os_log_debug_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEBUG, "AutoRefine taskManager creating a new task for transcription %{sensitive}@, has active task ? %d, %ld tasks", buf, 0x1Cu);
    }
    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__24;
    v68 = __Block_byref_object_dispose__24;
    v14 = [PKAutoRefineTask alloc];
    v56 = v60;
    id v57 = v59;
    if (v14)
    {
      v77.receiver = v14;
      v77.super_class = (Class)PKAutoRefineTask;
      v15 = (char *)objc_msgSendSuper2(&v77, sel_init);
      uint64_t v16 = (uint64_t)v15;
      if (v15)
      {
        *((_WORD *)v15 + 52) = 0;
        v17 = (void **)(v15 + 8);
        objc_storeStrong((id *)v15 + 1, a2);
        *(void *)(v16 + 32) = a3;
        *(void *)(v16 + 40) = a4;
        *(void *)(v16 + 16) = a3;
        *(void *)(v16 + 24) = a4;
        v18 = *v17;
        if (*v17) {
          v18 = (void *)v18[2];
        }
        v19 = (void *)MEMORY[0x1E4F28D60];
        v20 = v18;
        v21 = objc_msgSend(v19, "indexSetWithIndexesInRange:", 0, objc_msgSend(v20, "tokenColumnCount"));
        v54 = (void *)[v21 mutableCopy];

        v22 = [MEMORY[0x1E4F28E60] indexSet];
        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = __93__PKAutoRefineTask_initWithQueryItem_firstColumnToCommit_lastColumnToCommit_providerVersion___block_invoke;
        v74[3] = &unk_1E64C9FE8;
        v23 = (id *)(id)v16;
        v75 = v23;
        id v24 = v22;
        id v76 = v24;
        [v54 enumerateIndexesUsingBlock:v74];
        v25 = os_log_create("com.apple.pencilkit", "AutoRefine");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v50 = [v24 description];
          v51 = *v17;
          v53 = (id *)v50;
          if (*v17) {
            v51 = (void *)v51[6];
          }
          v52 = v51;
          *(_DWORD *)buf = 138412546;
          v79 = v53;
          __int16 v80 = 2112;
          *(void *)v81 = v52;
          _os_log_debug_impl(&dword_1C44F8000, v25, OS_LOG_TYPE_DEBUG, "New AutoRefine task with nonRefinableColumns from stroke checks = %@, queryItem.refinableStrokes = %@", buf, 0x16u);
        }
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __93__PKAutoRefineTask_initWithQueryItem_firstColumnToCommit_lastColumnToCommit_providerVersion___block_invoke_5;
        v72[3] = &unk_1E64CA010;
        id v26 = v54;
        id v73 = v26;
        [v24 enumerateRangesUsingBlock:v72];
        if ([v26 count])
        {
          v70[0] = MEMORY[0x1E4F143A8];
          v70[1] = 3221225472;
          v70[2] = __93__PKAutoRefineTask_initWithQueryItem_firstColumnToCommit_lastColumnToCommit_providerVersion___block_invoke_2_6;
          v70[3] = &unk_1E64CA010;
          v71 = v23;
          [v26 enumerateRangesUsingBlock:v70];
        }
        else
        {
          *(void *)(v16 + 32) = 0;
          *(void *)(v16 + 40) = 0;
          *(unsigned char *)(v16 + 104) = 1;
        }
        objc_storeStrong(v23 + 6, a5);
        v27 = os_log_create("com.apple.pencilkit", "AutoRefine");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = *v17;
          if (*v17) {
            v28 = (void *)v28[2];
          }
          v29 = v28;
          v30 = [v29 topTranscription];
          uint64_t v31 = *(void *)(v16 + 32);
          uint64_t v32 = *(void *)(v16 + 40);
          BOOL v33 = *(unsigned char *)(v16 + 104) == 0;
          *(_DWORD *)buf = 134219523;
          v79 = v23;
          __int16 v80 = 2117;
          *(void *)v81 = v30;
          *(_WORD *)&v81[8] = 2048;
          *(void *)&v81[10] = v31;
          *(_WORD *)&v81[18] = 2048;
          *(void *)&v81[20] = v32;
          __int16 v82 = 2048;
          uint64_t v83 = a3;
          __int16 v84 = 2048;
          uint64_t v85 = a4;
          __int16 v86 = 1024;
          BOOL v87 = v33;
          _os_log_impl(&dword_1C44F8000, v27, OS_LOG_TYPE_DEFAULT, "New AutoRefine task created %p with text transcription _%{sensitive}@_, columns to commit (%ld-%ld) from initial columns (%ld-%ld), task valid ? %d", buf, 0x44u);
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        v23[7] = v34;
      }
      -[PKAutoRefineTask updateCommittableRange](v16);
      v35 = os_log_create("com.apple.pencilkit", "AutoRefine");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = *(void *)(v16 + 72);
        *(_DWORD *)buf = 134218243;
        v79 = (id *)v16;
        __int16 v80 = 2117;
        *(void *)v81 = v36;
        _os_log_impl(&dword_1C44F8000, v35, OS_LOG_TYPE_DEFAULT, "New AutoRefine task just created %p has committable transcription = _%{sensitive}@_", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v16 = 0;
    }

    id v69 = (id)v16;
    uint64_t v37 = v65[5];
    if (v37) {
      objc_storeWeak((id *)(v37 + 112), (id)a1);
    }
    id v38 = (id)a1;
    objc_sync_enter(v38);
    [*((id *)v38 + 3) addObject:v65[5]];
    objc_sync_exit(v38);

    v39 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      v47 = (id *)v65[5];
      uint64_t v48 = *((void *)v38 + 2);
      uint64_t v49 = [*((id *)v38 + 3) count];
      *(_DWORD *)buf = 134218752;
      v79 = v47;
      __int16 v80 = 2048;
      *(double *)v81 = a7;
      *(_WORD *)&v81[8] = 1024;
      *(_DWORD *)&v81[10] = v48 != 0;
      *(_WORD *)&v81[14] = 2048;
      *(void *)&v81[16] = v49;
      _os_log_debug_impl(&dword_1C44F8000, v39, OS_LOG_TYPE_DEBUG, "AutoRefine taskManager scheduling task %p for execution with delay = %.2f, has active task ? %d, %ld tasks", buf, 0x26u);
    }

    dispatch_time_t v40 = dispatch_time(0, (uint64_t)(a7 * 1000000000.0));
    v41 = *((void *)v38 + 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __132__PKAutoRefineTaskManager_scheduleAutoRefineTaskForItem_firstColumnToCommit_lastColumnToCommit_providerVersion_delay_taskInitBlock___block_invoke;
    block[3] = &unk_1E64CA088;
    v63 = &v64;
    block[4] = v38;
    id v62 = v58;
    dispatch_after(v40, v41, block);

    _Block_object_dispose(&v64, 8);
  }
}

void __132__PKAutoRefineTaskManager_scheduleAutoRefineTaskForItem_firstColumnToCommit_lastColumnToCommit_providerVersion_delay_taskInitBlock___block_invoke(void *a1)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = *(void *)(*(void *)(a1[6] + 8) + 40);
    *(_DWORD *)v68 = 134217984;
    uint64_t v69 = v22;
    _os_log_debug_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p becomes current", v68, 0xCu);
  }

  uint64_t v3 = *(unsigned char **)(*(void *)(a1[6] + 8) + 40);
  if (!v3 || (v3[104] & 1) != 0)
  {
    v19 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    uint64_t v32 = *(void *)(*(void *)(a1[6] + 8) + 40);
    *(_DWORD *)v68 = 134217984;
    uint64_t v69 = v32;
    v21 = "AutoRefine Task %p stopped early";
LABEL_35:
    _os_log_debug_impl(&dword_1C44F8000, v19, OS_LOG_TYPE_DEBUG, v21, v68, 0xCu);
    goto LABEL_17;
  }
  v4 = (void *)a1[4];
  v5 = v3;
  if (v4)
  {
    id v6 = v4;
    objc_sync_enter(v6);
    objc_super v7 = (id *)v6;
    objc_sync_enter(v7);
    v8 = [v7[3] indexesOfObjectsPassingTest:&__block_literal_global_69];
    [v7[3] removeObjectsAtIndexes:v8];

    objc_sync_exit(v7);
    objc_storeStrong(v7 + 2, v3);
    [v7[3] removeObject:v5];
    objc_sync_exit(v7);
  }
  BOOL v9 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v38 = *(void *)(*(void *)(a1[6] + 8) + 40);
    uint64_t v39 = a1[4];
    uint64_t v40 = *(void *)(v39 + 16);
    uint64_t v41 = [*(id *)(v39 + 24) count];
    *(_DWORD *)v68 = 134218496;
    uint64_t v69 = v38;
    __int16 v70 = 2048;
    uint64_t v71 = v40;
    __int16 v72 = 2048;
    uint64_t v73 = v41;
    _os_log_debug_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p starts execution, active task %p, %ld tasks", v68, 0x20u);
  }

  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v10 = a1[4];
  uint64_t v11 = *(void *)(v10 + 16);
  if (!v11)
  {
    v53 = *(void **)(v10 + 48);
    id v13 = *(id *)(v10 + 40);
    id v14 = v53;
    goto LABEL_42;
  }
  if (*(unsigned char *)(v11 + 104))
  {
    v19 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    uint64_t v20 = *(void *)(a1[4] + 16);
    *(_DWORD *)v68 = 134217984;
    uint64_t v69 = v20;
    v21 = "AutoRefine Task %p canceled in its init block";
    goto LABEL_35;
  }
  uint64_t v12 = *(void **)(v10 + 48);
  id v13 = *(id *)(v10 + 40);
  id v14 = v12;
  v15 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v16 = *(void *)(v11 + 32);
    unint64_t v17 = *(void *)(v11 + 40);
    *(_DWORD *)buf = 134218496;
    uint64_t v59 = v11;
    __int16 v60 = 2048;
    unint64_t v61 = v16;
    __int16 v62 = 2048;
    unint64_t v63 = v17;
    _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEFAULT, "AutoRefine Task %p running with fresh stroke provider, firstColumnToCommit = %ld, lastColumnToCommit = %ld", buf, 0x20u);
  }

  if (*(unsigned char *)(v11 + 104))
  {
    v18 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v59 = v11;
      _os_log_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_DEFAULT, "AutoRefine Task %p was canceled.", buf, 0xCu);
    }
    goto LABEL_41;
  }
  v18 = v13;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v23 = *(void **)(v11 + 8);
  if (v23) {
    v23 = (void *)v23[4];
  }
  id v24 = v23;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v54 objects:v68 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v55;
LABEL_24:
    uint64_t v27 = 0;
    while (1)
    {
      if (*(void *)v55 != v26) {
        objc_enumerationMutation(v24);
      }
      if ((-[NSObject isValidStrokeIdentifier:](v18, "isValidStrokeIdentifier:", *(void *)(*((void *)&v54 + 1) + 8 * v27), (void)v54) & 1) == 0)break; {
      if (v25 == ++v27)
      }
      {
        uint64_t v25 = [v24 countByEnumeratingWithState:&v54 objects:v68 count:16];
        if (v25) {
          goto LABEL_24;
        }
        goto LABEL_30;
      }
    }

    WeakRetained = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_40;
    }
    *(_DWORD *)buf = 134217984;
    uint64_t v59 = v11;
    uint64_t v31 = "AutoRefine Task %p skipped because the drawing has changed";
    goto LABEL_38;
  }
LABEL_30:

  unint64_t v28 = *(void *)(v11 + 32);
  if (v28 <= 0x7FFFFFFFFFFFFFFELL && (int64_t v29 = *(void *)(v11 + 40), v29 >= (uint64_t)v28))
  {
    unint64_t v45 = v29 + 1;
    if ((unint64_t)[*(id *)(v11 + 72) length] > 1) {
      goto LABEL_49;
    }
    uint64_t v46 = *(void **)(v11 + 8);
    if (v46) {
      uint64_t v46 = (void *)v46[2];
    }
    v47 = v46;
    BOOL v48 = v45 < [v47 tokenColumnCount];

    if (v48)
    {
LABEL_49:
      uint64_t v49 = os_log_create("com.apple.pencilkit", "AutoRefine");
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v51 = *(void *)(v11 + 72);
        uint64_t v52 = [*(id *)(v11 + 80) count];
        *(_DWORD *)buf = 134219011;
        uint64_t v59 = v11;
        __int16 v60 = 2048;
        unint64_t v61 = v28;
        __int16 v62 = 2048;
        unint64_t v63 = v45;
        __int16 v64 = 2117;
        uint64_t v65 = v51;
        __int16 v66 = 2048;
        uint64_t v67 = v52;
        _os_log_debug_impl(&dword_1C44F8000, v49, OS_LOG_TYPE_DEBUG, "AutoRefine task %p triggered (cols: %ld -> %ld) for transcription = %{sensitive}@, strokes to replace: %ld", buf, 0x34u);
      }

      WeakRetained = objc_loadWeakRetained((id *)(v11 + 112));
      [WeakRetained autoRefineTask:v11 isReadyToSynthesizeRefinedDrawingForStrokes:*(void *)(v11 + 80) transcription:*(void *)(v11 + 72) drawingUUID:v14];
      goto LABEL_40;
    }
    WeakRetained = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v50 = *(void *)(v11 + 72);
      *(_DWORD *)buf = 134218243;
      uint64_t v59 = v11;
      __int16 v60 = 2117;
      unint64_t v61 = v50;
      uint64_t v31 = "AutoRefine Task %p skipped because uncertain commit for transcription = %{sensitive}@";
      BOOL v33 = WeakRetained;
      uint32_t v34 = 22;
      goto LABEL_39;
    }
  }
  else
  {
    WeakRetained = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v59 = v11;
      uint64_t v31 = "AutoRefine Task %p skipped because nothing to commit";
LABEL_38:
      BOOL v33 = WeakRetained;
      uint32_t v34 = 12;
LABEL_39:
      _os_log_impl(&dword_1C44F8000, v33, OS_LOG_TYPE_DEFAULT, v31, buf, v34);
    }
  }
LABEL_40:

LABEL_41:
LABEL_42:

  v35 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v42 = a1[4];
    uint64_t v43 = *(void *)(v42 + 16);
    uint64_t v44 = [*(id *)(v42 + 24) count];
    *(_DWORD *)v68 = 134218240;
    uint64_t v69 = v43;
    __int16 v70 = 2048;
    uint64_t v71 = v44;
    _os_log_debug_impl(&dword_1C44F8000, v35, OS_LOG_TYPE_DEBUG, "AutoRefine Task %p is done running, %ld tasks", v68, 0x16u);
  }

  v19 = *(id *)(a1[4] + 16);
  objc_sync_enter(v19);
  uint64_t v36 = a1[4];
  uint64_t v37 = *(void **)(v36 + 16);
  *(void *)(v36 + 16) = 0;

  objc_sync_exit(v19);
LABEL_17:
}

uint64_t __45__PKAutoRefineTaskManager_updatePendingTasks__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return *(unsigned char *)(a2 + 104) & 1;
  }
  else {
    return 0;
  }
}

- (void)cancelAllTasks
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    -[PKAutoRefineTask cancel](*((void *)v1 + 2));
    v2 = (void *)*((void *)v1 + 2);
    *((void *)v1 + 2) = 0;

    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = *((id *)v1 + 3);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          -[PKAutoRefineTask cancel](*(void *)(*((void *)&v8 + 1) + 8 * v6++));
        }
        while (v4 != v6);
        uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }

    objc_msgSend(*((id *)v1 + 3), "removeAllObjects", (void)v8);
    objc_super v7 = +[PKAutoRefineLogger sharedAutoRefineLogger]();
    -[PKAutoRefineLogger clearAllEntries](v7);

    objc_sync_exit(v1);
  }
}

- (BOOL)isTrackingQueryItemIdenticalToQueryItem:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = a1;
    objc_sync_enter(v4);
    uint64_t v5 = *((void *)v4 + 2);
    if (v5 && (*(unsigned char *)(v5 + 104) & 1) != 0 || (-[PKAutoRefineTask queryItemIsEqualToQueryItem:](v5, v3) & 1) == 0)
    {
      for (unint64_t i = 0; ; ++i)
      {
        unint64_t v9 = [*((id *)v4 + 3) count];
        BOOL v6 = i < v9;
        if (i >= v9) {
          break;
        }
        long long v10 = [*((id *)v4 + 3) objectAtIndex:i];
        char v11 = -[PKAutoRefineTask queryItemIsEqualToQueryItem:]((uint64_t)v10, v3);

        if (v11) {
          break;
        }
      }
    }
    else
    {
      BOOL v6 = 1;
    }
    objc_sync_exit(v4);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)cancelTasksGivenQueryItem:(void *)a1
{
  id v8 = a2;
  if (a1)
  {
    id v3 = a1;
    objc_sync_enter(v3);
    uint64_t v4 = *((void *)v3 + 2);
    if (!v4 || (*(unsigned char *)(v4 + 104) & 1) == 0)
    {
      char v10 = 0;
      -[PKAutoRefineTask trimTaskForNewItem:shouldCancel:]((void *)v4, v8, &v10);
      if (v10) {
        -[PKAutoRefineTask cancel](*((void *)v3 + 2));
      }
    }
    for (unint64_t i = 0; i < objc_msgSend(*((id *)v3 + 3), "count", v8); ++i)
    {
      uint64_t v6 = [*((id *)v3 + 3) objectAtIndex:i];
      objc_super v7 = (void *)v6;
      if (!v6 || (*(unsigned char *)(v6 + 104) & 1) == 0)
      {
        char v9 = 0;
        -[PKAutoRefineTask trimTaskForNewItem:shouldCancel:]((void *)v6, v8, &v9);
        if (v9) {
          -[PKAutoRefineTask cancel]((uint64_t)v7);
        }
      }
    }
    objc_sync_exit(v3);
  }
}

- (void)cancelTasksGivenRefinableStroke:(void *)a1
{
  id v16 = a2;
  if (a1)
  {
    id v3 = a1;
    objc_sync_enter(v3);
    uint64_t v4 = *((void *)v3 + 2);
    if (!v4 || (*(unsigned char *)(v4 + 104) & 1) == 0)
    {
      char v18 = 0;
      objc_msgSend(v16, "_bounds", v16);
      -[PKAutoRefineTask trimTaskForNewStrokeInRect:shouldCancel:]((uint64_t *)v4, &v18, v5, v6, v7, v8);
      if (v18) {
        -[PKAutoRefineTask cancel](*((void *)v3 + 2));
      }
    }
    for (unint64_t i = 0; i < objc_msgSend(*((id *)v3 + 3), "count", v16); ++i)
    {
      uint64_t v10 = [*((id *)v3 + 3) objectAtIndex:i];
      char v11 = (uint64_t *)v10;
      if (!v10 || (*(unsigned char *)(v10 + 104) & 1) == 0)
      {
        char v17 = 0;
        [v16 _bounds];
        -[PKAutoRefineTask trimTaskForNewStrokeInRect:shouldCancel:](v11, &v17, v12, v13, v14, v15);
        if (v17) {
          -[PKAutoRefineTask cancel]((uint64_t)v11);
        }
      }
    }
    objc_sync_exit(v3);
  }
}

- (void)hasOngoingAnimationTask
{
  if (result)
  {
    id v1 = result;
    objc_sync_enter(v1);
    BOOL v2 = -[PKAutoRefineTask hasOngoingAnimation](v1[2]);
    objc_sync_exit(v1);

    return (void *)v2;
  }
  return result;
}

- (void)autoRefineTask:(id)a3 isReadyToSynthesizeRefinedDrawingForStrokes:(id)a4 transcription:(id)a5 drawingUUID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_134);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __112__PKAutoRefineTaskManager_autoRefineTask_isReadyToSynthesizeRefinedDrawingForStrokes_transcription_drawingUUID___block_invoke_2;
  v20[3] = &unk_1E64CA0D0;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  dispatch_async(MEMORY[0x1E4F14428], v20);
  dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
}

void __112__PKAutoRefineTaskManager_autoRefineTask_isReadyToSynthesizeRefinedDrawingForStrokes_transcription_drawingUUID___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __112__PKAutoRefineTaskManager_autoRefineTask_isReadyToSynthesizeRefinedDrawingForStrokes_transcription_drawingUUID___block_invoke_3;
  v7[3] = &unk_1E64C5390;
  id v8 = *(id *)(a1 + 72);
  [WeakRetained autoRefineTask:v3 synthesizeRefinedDrawingForStrokes:v4 transcription:v5 drawingUUID:v6 completionBlock:v7];
}

uint64_t __112__PKAutoRefineTaskManager_autoRefineTask_isReadyToSynthesizeRefinedDrawingForStrokes_transcription_drawingUUID___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setCurrentDrawingUUID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDrawingUUID, 0);
  objc_storeStrong((id *)&self->_latestStrokeProvider, 0);
  objc_destroyWeak((id *)&self->_autoRefineViewDelegate);
  objc_storeStrong((id *)&self->_tasksQueue, 0);
  objc_storeStrong((id *)&self->_activeTask, 0);

  objc_storeStrong((id *)&self->_autoRefineQueue, 0);
}

@end