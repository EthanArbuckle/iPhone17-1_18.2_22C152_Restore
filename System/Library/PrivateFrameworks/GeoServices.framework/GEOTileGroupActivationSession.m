@interface GEOTileGroupActivationSession
- (GEOTileGroupActivationSession)initWithIdentifier:(id)a3 configuration:(id)a4 tileGroup:(id)a5 inResourceManifest:(id)a6 environmentName:(id)a7 oldTileGroup:(id)a8 activeScales:(id)a9 activeScenarios:(id)a10 activeNames:(id)a11 dataSet:(id)a12 migrators:(id)a13 updateType:(int64_t)a14 delegate:(id)a15 delegateQueue:(id)a16;
- (NSProgress)progress;
- (NSString)uniqueIdentifier;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (void)_finishPhaseWithResult:(void *)a3 errors:;
- (void)cancel;
- (void)dealloc;
- (void)start;
@end

@implementation GEOTileGroupActivationSession

void __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_3;
  v5[3] = &unk_1E53D8998;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 48);
  [WeakRetained activationSession:v3 didChangeActiveTileGroup:v4 completionHandler:v5];
}

- (GEOTileGroupActivationSession)initWithIdentifier:(id)a3 configuration:(id)a4 tileGroup:(id)a5 inResourceManifest:(id)a6 environmentName:(id)a7 oldTileGroup:(id)a8 activeScales:(id)a9 activeScenarios:(id)a10 activeNames:(id)a11 dataSet:(id)a12 migrators:(id)a13 updateType:(int64_t)a14 delegate:(id)a15 delegateQueue:(id)a16
{
  id v43 = a3;
  id obj = a4;
  id v51 = a4;
  id v42 = a5;
  id v50 = a5;
  id v21 = a6;
  id v22 = a7;
  id v49 = a8;
  id v48 = a9;
  id v47 = a10;
  id v46 = a11;
  id v45 = a12;
  id v23 = a13;
  id v24 = a15;
  id v25 = a16;
  v52.receiver = self;
  v52.super_class = (Class)GEOTileGroupActivationSession;
  v26 = [(GEOTileGroupActivationSession *)&v52 init];
  if (v26)
  {
    uint64_t v27 = geo_dispatch_queue_create();
    workQueue = v26->_workQueue;
    v26->_workQueue = (OS_dispatch_queue *)v27;

    v26->_started.lock._os_unfair_lock_opaque = 0;
    v26->_started.didRun = 0;
    uint64_t v29 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:-1];
    progress = v26->_progress;
    v26->_progress = (NSProgress *)v29;

    v26->_finished[0].lock._os_unfair_lock_opaque = 0;
    v26->_finished[0].didRun = 0;
    v26->_finished[1].lock._os_unfair_lock_opaque = 0;
    v26->_finished[1].didRun = 0;
    objc_storeWeak((id *)&v26->_delegate, v24);
    objc_storeStrong((id *)&v26->_delegateQueue, a16);
    uint64_t v31 = [v43 copy];
    uniqueIdentifier = v26->_uniqueIdentifier;
    v26->_uniqueIdentifier = (NSString *)v31;

    objc_storeStrong((id *)&v26->_configuration, obj);
    objc_storeStrong((id *)&v26->_newTileGroup, v42);
    uint64_t v33 = [v21 copy];
    resourceManifest = v26->_resourceManifest;
    v26->_resourceManifest = (GEOResources *)v33;

    uint64_t v35 = [v22 copy];
    environmentName = v26->_environmentName;
    v26->_environmentName = (NSString *)v35;

    objc_storeStrong((id *)&v26->_activeTileGroup, a8);
    objc_storeStrong((id *)&v26->_activeScales, a9);
    objc_storeStrong((id *)&v26->_activeScenarios, a10);
    objc_storeStrong((id *)&v26->_activeNames, a11);
    objc_storeStrong((id *)&v26->_dataSet, a12);
    uint64_t v37 = [v23 copy];
    migrators = v26->_migrators;
    v26->_migrators = (NSArray *)v37;

    v26->_updateType = a14;
    GEORegisterPListStateCaptureLegacy();
    v39 = v26;
  }

  return v26;
}

uint64_t __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke_4(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v2 = [*(id *)(a1 + 32) count];
    uint64_t v3 = GEOGetResourceManifestLog();
    uint64_t v4 = v3;
    if (v2)
    {
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
        goto LABEL_11;
      }
      uint64_t v5 = [*(id *)(a1 + 40) count];
      uint64_t v6 = v5 - [*(id *)(a1 + 32) count];
      uint64_t v7 = [*(id *)(a1 + 40) count];
      int v15 = 134349312;
      uint64_t v16 = v6;
      __int16 v17 = 2050;
      uint64_t v18 = v7;
      v8 = "%{public}lu (of %{public}lu) opportunistic tile group migrators succeeded. Will try again later.";
      v9 = v4;
      os_log_type_t v10 = OS_LOG_TYPE_INFO;
      uint32_t v11 = 22;
      goto LABEL_10;
    }
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
    LOWORD(v15) = 0;
    v8 = "All opportunistic tile group migrators succeeded. Done.";
    v9 = v4;
    os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
  }
  else
  {
    uint64_t v4 = GEOGetResourceManifestLog();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    LOWORD(v15) = 0;
    v8 = "No opportunistic tile group migrators succeeded. Will try again later.";
    v9 = v4;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
  }
  uint32_t v11 = 2;
LABEL_10:
  _os_log_impl(&dword_188D96000, v9, v10, v8, (uint8_t *)&v15, v11);
LABEL_11:

  uint64_t v12 = *(void *)(a1 + 48);
  if ([*(id *)(a1 + 32) count]) {
    uint64_t v13 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v13 = 0;
  }
  return -[GEOTileGroupActivationSession _finishPhaseWithResult:errors:](v12, 0, v13);
}

- (void)_finishPhaseWithResult:(void *)a3 errors:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (v5 || [v6 count] || *(void *)(a1 + 48))
    {
      uint64_t v7 = a1 + 8 * *(void *)(a1 + 48) + 24;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke;
      v8[3] = &unk_1E53D99F0;
      v8[4] = a1;
      id v9 = v5;
      id v10 = v6;
      GEOOnce(v7, v8);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: (activeTileGroup != ((void *)0) || errors.count > 0) || _phase != GEOTileGroupActivationSessionPhaseMandatory", buf, 2u);
    }
  }
}

void __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke_2(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  long long v2 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v4[1] = 3221225472;
  v4[2] = __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke_3;
  v4[3] = &unk_1E53D8998;
  long long v5 = v2;
  dispatch_async(v3, v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 40))
  {
    long long v2 = (void *)MEMORY[0x18C1203C0]();
    [*(id *)(a1 + 40) removeOldData:*(void *)(*(void *)(a1 + 32) + 112)];
  }
}

void __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_4(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 40))
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v49 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v27 != v4) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * i) removeOldData:*(void *)(*(void *)(a1 + 32) + 112)];
        }
        uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v49 count:16];
      }
      while (v3);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 8));
      if (*(void *)(v6 + 48) != 1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)objc_super v52 = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _phase == GEOTileGroupActivationSessionPhaseOpportunistic", v52, 2u);
      }
      if (!*(unsigned char *)(v6 + 40))
      {
        objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(v6 + 152), "count"));
        id obj = (id)objc_claimAutoreleasedReturnValue();
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v7 = *(id *)(v6 + 152);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v52 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v46;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v46 != v9) {
                objc_enumerationMutation(v7);
              }
              uint32_t v11 = *(void **)(*((void *)&v45 + 1) + 8 * j);
              if (objc_opt_respondsToSelector())
              {
                uint64_t v12 = [v11 opportunisticTaskForNewTileGroup:*(void *)(v6 + 88) inResourceManifest:*(void *)(v6 + 96) oldTileGroup:*(void *)(v6 + 112) activeScales:*(void *)(v6 + 120) activeScenarios:*(void *)(v6 + 128) activeNames:*(void *)(v6 + 136) dataSet:*(void *)(v6 + 144)];
                if (v12) {
                  [obj addObject:v12];
                }
              }
            }
            uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v52 count:16];
          }
          while (v8);
        }

        BOOL v13 = [obj count] == 0;
        v14 = GEOGetResourceManifestLog();
        int v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "New tile group requests no opportunistic tasks. Done.", buf, 2u);
          }

          -[GEOTileGroupActivationSession _finishPhaseWithResult:errors:](v6, 0, 0);
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            id v51 = obj;
            _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_INFO, "New tile group requests the following opportunistic migration tasks: %{public}@", buf, 0xCu);
          }

          objc_storeStrong((id *)(v6 + 200), obj);
          v43[0] = 0;
          v43[1] = v43;
          v43[2] = 0x2020000000;
          char v44 = 0;
          uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
          __int16 v17 = dispatch_group_create();
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id v25 = obj;
          uint64_t v18 = [v25 countByEnumeratingWithState:&v39 objects:buf count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v40;
            do
            {
              for (uint64_t k = 0; k != v18; ++k)
              {
                if (*(void *)v40 != v19) {
                  objc_enumerationMutation(v25);
                }
                id v21 = *(void **)(*((void *)&v39 + 1) + 8 * k);
                dispatch_group_enter(v17);
                v35[0] = MEMORY[0x1E4F143A8];
                v35[1] = 3221225472;
                v35[2] = __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke;
                v35[3] = &unk_1E53DA120;
                v35[4] = v6;
                v35[5] = v21;
                id v36 = v16;
                uint64_t v37 = v17;
                v38 = v43;
                [v21 startWithCompletionHandler:v35 callbackQueue:*(void *)(v6 + 8)];
              }
              uint64_t v18 = [v25 countByEnumeratingWithState:&v39 objects:buf count:16];
            }
            while (v18);
          }

          id v22 = *(NSObject **)(v6 + 8);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke_4;
          block[3] = &unk_1E53DA148;
          v34 = v43;
          id v31 = v16;
          id v32 = v25;
          uint64_t v33 = v6;
          id v23 = v16;
          dispatch_group_notify(v17, v22, block);

          _Block_object_dispose(v43, 8);
        }
      }
    }
  }
}

void __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = GEOGetResourceManifestLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = (id)objc_opt_class();
      __int16 v18 = 2114;
      id v19 = v3;
      id v5 = v17;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_ERROR, "Opportunistic tile group migration task '%{public}@' encountered error: %{public}@", buf, 0x16u);
    }
    [*(id *)(a1 + 48) addObject:v3];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    uint64_t v6 = GEOGetResourceManifestLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      id v17 = v7;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Opportunistic tile group migration task '%{public}@' succeeded. Allowing it to update the active tile group.", buf, 0xCu);
    }

    uint64_t v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 112) copy];
    [*(id *)(a1 + 40) populateTileGroup:v8];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), v8);
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(NSObject **)(v9 + 64);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke_41;
    v12[3] = &unk_1E53D8AF8;
    v12[4] = v9;
    id v13 = v8;
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = *(id *)(a1 + 56);
    id v11 = v8;
    dispatch_async(v10, v12);
  }
}

void __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 48);
  if (v3 == 1)
  {
    uint64_t v9 = *(NSObject **)(v2 + 64);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_6;
    v15[3] = &unk_1E53D8998;
    v15[4] = v2;
    id v16 = *(id *)(a1 + 48);
    dispatch_async(v9, v15);
  }
  else if (!v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    if (v4)
    {
      objc_storeStrong((id *)(v2 + 112), v4);
      *(void *)(*(void *)(a1 + 32) + 48) = 1;
      id v5 = *(id *)(*(void *)(a1 + 32) + 192);
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(NSObject **)(v6 + 64);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_2;
      block[3] = &unk_1E53D99F0;
      void block[4] = v6;
      id v20 = *(id *)(a1 + 40);
      id v21 = v5;
      id v8 = v5;
      dispatch_async(v7, block);
    }
    else
    {
      id v10 = *(NSObject **)(v2 + 64);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_5;
      v17[3] = &unk_1E53D8998;
      v17[4] = v2;
      id v18 = *(id *)(a1 + 48);
      dispatch_async(v10, v17);
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 192);
    *(void *)(v11 + 192) = 0;

    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 168);
    *(void *)(v13 + 168) = 0;
  }
}

void __60__GEOTileGroupActivationSession__runMandatoryMigrationTasks__block_invoke_9(uint64_t a1)
{
  uint64_t v169 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = GEOGetResourceManifestLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 72);
    uint64_t v4 = [*(id *)(a1 + 40) count];
    id v5 = @"YES";
    if (!v4) {
      id v5 = @"NO";
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v3;
    __int16 v167 = 2114;
    v168 = v5;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "All tile group migration tasks for '%{public}@' are complete (encountered errors: %{public}@)", buf, 0x16u);
  }

  uint64_t v6 = [*(id *)(a1 + 40) count];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v6)
  {
    -[GEOTileGroupActivationSession _finishPhaseWithResult:errors:](*(void *)(a1 + 32), 0, *(void **)(a1 + 40));
    return;
  }
  if (!*(unsigned char *)(v7 + 40))
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 8));
    id v9 = *(id *)(v7 + 72);
    id v10 = objc_alloc_init(GEOActiveTileGroup);
    [(GEOActiveTileGroup *)v10 setModelVersion:13];
    -[GEOActiveTileGroup setIdentifier:](v10, "setIdentifier:", [*(id *)(v7 + 88) identifier]);
    [(GEOActiveTileGroup *)v10 setEnvironment:*(void *)(v7 + 104)];
    uint64_t v11 = [*(id *)(v7 + 96) displayStrings];
    [(GEOActiveTileGroup *)v10 setDisplayStrings:v11];

    if (*(void *)(v7 + 144)) {
      -[GEOActiveTileGroup setDataSet:](v10, "setDataSet:");
    }
    uint64_t v12 = objc_alloc_init(GEOActiveTileGroupReserved);
    if ([*(id *)(v7 + 96) hasAuthToken])
    {
      uint64_t v13 = [*(id *)(v7 + 96) authToken];
      [(GEOActiveTileGroupReserved *)v12 setAuthToken:v13];
    }
    uint64_t v14 = [(GEOActiveTileGroupReserved *)v12 data];
    [(GEOActiveTileGroup *)v10 setReserved:v14];

    if ([*(id *)(v7 + 88) attributionIndexsCount])
    {
      uint64_t v15 = 0;
      while (1)
      {
        unint64_t v16 = [*(id *)(v7 + 88) attributionIndexAtIndex:v15];
        if ([*(id *)(v7 + 96) attributionsCount] <= v16) {
          break;
        }
        id v17 = [*(id *)(v7 + 96) attributionAtIndex:v16];
        if ([v17 resourcesCount]
          || ([v17 hasLogo] & 1) == 0 && (objc_msgSend(v17, "hasBadge") & 1) == 0)
        {
          if (!*(void *)(v7 + 144)
            || ![v17 hasDataSet]
            || (int v18 = [v17 dataSet], v18 == objc_msgSend(*(id *)(v7 + 144), "identifier")))
          {
            [(GEOActiveTileGroup *)v10 addAttribution:v17];
          }
        }

        if (++v15 >= (unint64_t)[*(id *)(v7 + 88) attributionIndexsCount]) {
          goto LABEL_26;
        }
      }
      v34 = objc_msgSend(NSString, "stringWithFormat:", @"Attribution index %i outside of list length %lu", v16, objc_msgSend(*(id *)(v7 + 96), "attributionsCount"));
      uint64_t v35 = GEOGetResourceManifestLog();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v34;
      goto LABEL_42;
    }
LABEL_26:
    uint64_t v19 = [*(id *)(v7 + 88) tileSets];
    uint64_t v20 = [*(id *)(v7 + 88) tileSetsCount];
    if (v20)
    {
      uint64_t v21 = v20;
      id v22 = (unsigned int *)(v19 + 4);
      id v23 = (unsigned int *)(v19 + 4);
      while (1)
      {
        unint64_t v24 = *v22;
        unint64_t v25 = [*(id *)(v7 + 96) tileSetsCount];
        unsigned int v27 = *v23;
        v23 += 2;
        uint64_t v26 = v27;
        if (v25 <= v24) {
          break;
        }
        long long v28 = [*(id *)(v7 + 96) tileSetAtIndex:v26];
        long long v29 = v28;
        if (!*(void *)(v7 + 144)
          || ![v28 hasDataSet]
          || (int v30 = [v29 dataSet], v30 == objc_msgSend(*(id *)(v7 + 144), "identifier")))
        {
          id v31 = -[GEOActiveTileSet initWithTileSet:version:resourceManifest:]([GEOActiveTileSet alloc], v29, *(v22 - 1), *(void **)(v7 + 96));
          if (v31) {
            [(GEOActiveTileGroup *)v10 addTileSet:v31];
          }
        }
        id v22 = v23;
        if (!--v21) {
          goto LABEL_36;
        }
      }
      v34 = objc_msgSend(NSString, "stringWithFormat:", @"Tile set index %i outside of list length %lu", v26, objc_msgSend(*(id *)(v7 + 96), "tileSetsCount"));
      uint64_t v35 = GEOGetResourceManifestLog();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v34;
LABEL_42:
      _os_log_impl(&dword_188D96000, v35, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
LABEL_43:

      id v36 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:v34];
      *(void *)buf = v36;
      uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
      -[GEOTileGroupActivationSession _finishPhaseWithResult:errors:](v7, 0, v37);

LABEL_137:
      return;
    }
LABEL_36:
    id v32 = [*(id *)(v7 + 80) tileSetOverrides];
    v119 = v9;
    v121 = (void **)v7;
    v118 = v12;
    if (v32)
    {
      id v33 = [MEMORY[0x1E4F1CA48] arrayWithArray:v32];
    }
    else
    {
      id v33 = 0;
    }
    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    id obj = v32;
    v124 = v10;
    uint64_t v125 = [obj countByEnumeratingWithState:&v153 objects:buf count:16];
    if (v125)
    {
      uint64_t v123 = *(void *)v154;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v154 != v123) {
            objc_enumerationMutation(obj);
          }
          uint64_t v126 = v38;
          long long v39 = *(void **)(*((void *)&v153 + 1) + 8 * v38);
          long long v40 = [v39 version];

          long long v41 = [v39 version];
          unsigned int v127 = [v41 unsignedIntValue];

          long long v151 = 0u;
          long long v152 = 0u;
          long long v149 = 0u;
          long long v150 = 0u;
          long long v42 = (void *)MEMORY[0x1E4F1C978];
          id v43 = [(GEOActiveTileGroup *)v10 tileSets];
          char v44 = [v42 arrayWithArray:v43];

          uint64_t v45 = [v44 countByEnumeratingWithState:&v149 objects:v165 count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v150;
            do
            {
              for (uint64_t i = 0; i != v46; ++i)
              {
                if (*(void *)v150 != v47) {
                  objc_enumerationMutation(v44);
                }
                id v49 = *(void **)(*((void *)&v149 + 1) + 8 * i);
                int v50 = [v49 style];
                if (v50 == [v39 style])
                {
                  int v51 = [v49 size];
                  if (v51 == [v39 size])
                  {
                    int v52 = [v49 scale];
                    if (v52 == [v39 scale])
                    {
                      if (v40) {
                        [v49 setVersion:v127];
                      }
                      uint64_t v53 = [v39 baseURL];

                      if (v53)
                      {
                        v54 = [v39 baseURL];
                        v55 = [v54 absoluteString];
                        [v49 setBaseURL:v55];
                      }
                      v56 = [v39 localizationURL];

                      if (v56)
                      {
                        v57 = [v39 localizationURL];
                        v58 = [v57 absoluteString];
                        [v49 setLocalizationURL:v58];
                      }
                      [v33 removeObject:v39];
                    }
                  }
                }
              }
              uint64_t v46 = [v44 countByEnumeratingWithState:&v149 objects:v165 count:16];
            }
            while (v46);
          }

          uint64_t v38 = v126 + 1;
          id v10 = v124;
        }
        while (v126 + 1 != v125);
        uint64_t v125 = [obj countByEnumeratingWithState:&v153 objects:buf count:16];
      }
      while (v125);
    }

    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    id v36 = v33;
    uint64_t v59 = [v36 countByEnumeratingWithState:&v145 objects:v164 count:16];
    id v9 = v119;
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v146;
      do
      {
        for (uint64_t j = 0; j != v60; ++j)
        {
          if (*(void *)v146 != v61) {
            objc_enumerationMutation(v36);
          }
          v63 = *(void **)(*((void *)&v145 + 1) + 8 * j);
          v64 = objc_alloc_init(GEOActiveTileSet);
          v65 = [v63 baseURL];
          v66 = [v65 absoluteString];
          [(GEOActiveTileSet *)v64 setBaseURL:v66];

          v67 = [v63 localizationURL];
          v68 = [v67 absoluteString];
          [(GEOActiveTileSet *)v64 setLocalizationURL:v68];

          -[GEOActiveTileSet setStyle:](v64, "setStyle:", [v63 style]);
          -[GEOActiveTileSet setSize:](v64, "setSize:", [v63 size]);
          -[GEOActiveTileSet setScale:](v64, "setScale:", [v63 scale]);
          v69 = [v63 version];
          -[GEOActiveTileSet setVersion:](v64, "setVersion:", [v69 unsignedIntValue]);

          [(GEOActiveTileGroup *)v10 addTileSet:v64];
        }
        uint64_t v60 = [v36 countByEnumeratingWithState:&v145 objects:v164 count:16];
      }
      while (v60);
    }

    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    v70 = v121;
    id v71 = v121[24];
    uint64_t v72 = [v71 countByEnumeratingWithState:&v141 objects:v163 count:16];
    if (v72)
    {
      uint64_t v73 = v72;
      uint64_t v74 = *(void *)v142;
      do
      {
        for (uint64_t k = 0; k != v73; ++k)
        {
          if (*(void *)v142 != v74) {
            objc_enumerationMutation(v71);
          }
          [*(id *)(*((void *)&v141 + 1) + 8 * k) populateTileGroup:v10];
        }
        uint64_t v73 = [v71 countByEnumeratingWithState:&v141 objects:v163 count:16];
      }
      while (v73);
    }

    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    id v76 = v121[15];
    uint64_t v77 = [v76 countByEnumeratingWithState:&v137 objects:v162 count:16];
    if (v77)
    {
      uint64_t v78 = v77;
      uint64_t v79 = *(void *)v138;
      do
      {
        for (uint64_t m = 0; m != v78; ++m)
        {
          if (*(void *)v138 != v79) {
            objc_enumerationMutation(v76);
          }
          -[GEOActiveTileGroup addActiveScale:](v10, "addActiveScale:", [*(id *)(*((void *)&v137 + 1) + 8 * m) intValue]);
        }
        uint64_t v78 = [v76 countByEnumeratingWithState:&v137 objects:v162 count:16];
      }
      while (v78);
    }

    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    id v81 = v121[16];
    uint64_t v82 = [v81 countByEnumeratingWithState:&v133 objects:v161 count:16];
    uint64_t v12 = v118;
    if (v82)
    {
      uint64_t v83 = v82;
      uint64_t v84 = *(void *)v134;
      do
      {
        for (uint64_t n = 0; n != v83; ++n)
        {
          if (*(void *)v134 != v84) {
            objc_enumerationMutation(v81);
          }
          -[GEOActiveTileGroup addActiveScenario:](v10, "addActiveScenario:", [*(id *)(*((void *)&v133 + 1) + 8 * n) intValue]);
        }
        uint64_t v83 = [v81 countByEnumeratingWithState:&v133 objects:v161 count:16];
      }
      while (v83);
    }

    if ([(GEOActiveTileGroup *)v10 staleResourcesCount])
    {
      uint64_t v86 = objc_msgSend(v119, "stringByAppendingFormat:", @":stale=%lu", -[GEOActiveTileGroup staleResourcesCount](v10, "staleResourcesCount"));

      id v9 = (id)v86;
    }
    [(GEOActiveTileGroup *)v10 setUniqueIdentifier:v9];
    if ([v121[12] announcementsSupportedLanguagesCount])
    {
      v87 = [v121[12] announcementsSupportedLanguages];
      [(GEOActiveTileGroup *)v10 setAnnouncementsSupportedLanguages:v87];
    }
    if ([v121[12] hasReleaseInfo])
    {
      v88 = [v121[12] releaseInfo];
      [(GEOActiveTileGroup *)v10 setReleaseInfo:v88];
    }
    v89 = [v121[12] locationShiftEnabledRegions];
    [(GEOActiveTileGroup *)v10 setLocationShiftEnabledRegions:v89];

    if ([v121[12] hasLocationShiftVersion]) {
      -[GEOActiveTileGroup setLocationShiftVersion:](v10, "setLocationShiftVersion:", [v121[12] locationShiftVersion]);
    }
    if ([v121[11] hybridUnavailableRegionsCount]) {
      -[GEOActiveTileGroup setHybridUnavailableRegions:count:](v10, "setHybridUnavailableRegions:count:", [v121[11] hybridUnavailableRegions], objc_msgSend(v121[11], "hybridUnavailableRegionsCount"));
    }
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    v90 = [(GEOActiveTileGroup *)v10 activeResources];
    uint64_t v91 = [v90 countByEnumeratingWithState:&v129 objects:v160 count:16];
    if (v91)
    {
      uint64_t v92 = v91;
      id v120 = v9;
      uint64_t v93 = *(void *)v130;
      while (2)
      {
        for (iuint64_t i = 0; ii != v92; ++ii)
        {
          if (*(void *)v130 != v93) {
            objc_enumerationMutation(v90);
          }
          v95 = *(void **)(*((void *)&v129 + 1) + 8 * ii);
          if ([v95 resourceType] == 4)
          {
            v96 = [v95 filename];
            uint64_t v97 = [v96 rangeOfString:@"altitude"];

            if (v97 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v98 = GEOResourcesPath(v121[10]);
              v99 = [v95 filename];
              v100 = [v98 stringByAppendingPathComponent:v99];

              if (v100)
              {
                v101 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v100];
                v102 = [[GEOAltitudeManifestVersionParser alloc] initWithFileURL:v101];
                id v128 = 0;
                v103 = [(GEOAltitudeManifestVersionParser *)v102 parse:&v128];
                id v104 = v128;
                v105 = v104;
                if (v103)
                {

                  v106 = [v103 data];
                  id v10 = v124;
                  [(GEOActiveTileGroup *)v124 setFlyoverRegionVersions:v106];

                  [(GEOActiveTileGroup *)v124 _setDecodedFlyoverRegionVersions:v103];
                  v90 = v103;
                }
                else
                {
                  v107 = GEOGetResourceManifestLog();
                  id v10 = v124;
                  if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v157 = 138543618;
                    *(void *)&v157[4] = v100;
                    __int16 v158 = 2114;
                    v159 = v105;
                    _os_log_impl(&dword_188D96000, v107, OS_LOG_TYPE_ERROR, "Failed to parse new altitude.xml file: %{public}@ -- %{public}@", v157, 0x16u);
                  }
                }
                id v9 = v120;
                goto LABEL_124;
              }
            }
          }
        }
        uint64_t v92 = [v90 countByEnumeratingWithState:&v129 objects:v160 count:16];
        if (v92) {
          continue;
        }
        break;
      }
      id v10 = v124;
LABEL_124:
      v70 = v121;
      uint64_t v12 = v118;
    }

    v108 = [v70[12] muninBuckets];
    [(GEOActiveTileGroup *)v10 setMuninBuckets:v108];

    if ([v70[12] hasVersionManifest])
    {
      v109 = [v70[12] versionManifest];
      [(GEOActiveTileGroup *)v10 setVersionManifest:v109];
    }
    if ([v70[11] hasOfflineMetadataIndex])
    {
      unsigned int v110 = [v70[11] offlineMetadataIndex];
      unint64_t v111 = [v70[12] offlineMetadatasCount];
      id v112 = v70[11];
      if (v111 <= v110)
      {
        v114 = objc_msgSend(NSString, "stringWithFormat:", @"Offline metadata index %i outside of list length %lu", objc_msgSend(v112, "offlineMetadataIndex"), objc_msgSend(v70[12], "offlineMetadatasCount"));
        v115 = GEOGetResourceManifestLog();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v157 = 138543362;
          *(void *)&v157[4] = v114;
          _os_log_impl(&dword_188D96000, v115, OS_LOG_TYPE_ERROR, "%{public}@", v157, 0xCu);
        }

        v116 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:v114];
        *(void *)v157 = v116;
        v117 = [MEMORY[0x1E4F1C978] arrayWithObjects:v157 count:1];
        -[GEOTileGroupActivationSession _finishPhaseWithResult:errors:]((uint64_t)v70, 0, v117);

        goto LABEL_136;
      }
      v113 = objc_msgSend(v70[12], "offlineMetadataAtIndex:", objc_msgSend(v112, "offlineMetadataIndex"));
      [(GEOActiveTileGroup *)v10 setOfflineMetadata:v113];
    }
    if ([v70[10] requiresLegacyFormat]) {
      [(GEOActiveTileGroup *)v10 populateLegacyFormat];
    }
    -[GEOTileGroupActivationSession _finishPhaseWithResult:errors:]((uint64_t)v70, v10, 0);
LABEL_136:
    v34 = obj;
    goto LABEL_137;
  }
  id v8 = GEOGetResourceManifestLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "Tile group activation was previously canceled.", buf, 2u);
  }
}

void __38__GEOTileGroupActivationSession_start__block_invoke_2(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 8));
    uint64_t v2 = &GeoServicesConfig_TransactionsForMigration;
    if (GEOConfigGetBOOL(GeoServicesConfig_TransactionsForMigration, (uint64_t)off_1E9113DF8))
    {
      uint64_t v3 = _GEOCreateTransaction();
      uint64_t v4 = *(void **)(v1 + 168);
      *(void *)(v1 + 168) = v3;
    }
    else
    {
      uint64_t v4 = *(void **)(v1 + 168);
      *(void *)(v1 + 168) = 0;
    }

    *(void *)(v1 + 48) = 0;
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(v1 + 152), "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = *(id *)(v1 + 152);
    uint64_t v6 = [obj countByEnumeratingWithState:&v37 objects:v50 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = 0;
      uint64_t v9 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v38 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = [*(id *)(*((void *)&v37 + 1) + 8 * i) taskForNewTileGroup:*(void *)(v1 + 88) inResourceManifest:*(void *)(v1 + 96) oldTileGroup:*(void *)(v1 + 112) activeScales:*(void *)(v1 + 120) activeScenarios:*(void *)(v1 + 128) dataSet:*(void *)(v1 + 144) updateType:*(void *)(v1 + 160)];
          uint64_t v12 = v11;
          if (v11)
          {
            uint64_t v13 = [v11 estimatedWeight];
            [v5 addObject:v12];
            if (GEOConfigGetBOOL(*v2, v2[1]))
            {
              uint64_t v14 = (objc_class *)objc_opt_class();
              NSStringFromClass(v14);
              uint64_t v35 = v8;
              uint64_t v15 = v7;
              uint64_t v16 = v9;
              id v17 = v2;
              int v18 = v5;
              id v19 = objc_claimAutoreleasedReturnValue();
              uint64_t v33 = [v19 UTF8String];
              uint64_t v20 = _GEOCreateTransaction();
              objc_msgSend(v12, "setTransaction:", v20, v33);

              id v5 = v18;
              uint64_t v2 = v17;
              uint64_t v9 = v16;
              uint64_t v7 = v15;
              id v8 = v35;
            }
            else
            {
              [v12 setTransaction:0];
            }
            v8 += v13;
            [v12 setOptions:0];
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v50 count:16];
      }
      while (v7);
    }
    else
    {
      id v8 = 0;
    }

    [*(id *)(v1 + 184) setTotalUnitCount:v8];
    uint64_t v21 = GEOGetResourceManifestLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      int v52 = v5;
      _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_DEBUG, "Changing to new tile group requires the following mandatory migration tasks: %{public}@", buf, 0xCu);
    }

    id v22 = *(void **)(v1 + 192);
    *(void *)(v1 + 192) = v5;

    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 8));
    id v23 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v24 = dispatch_group_create();
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v36 = *(id *)(v1 + 192);
    uint64_t v25 = [v36 countByEnumeratingWithState:&v46 objects:buf count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v47 != v27) {
            objc_enumerationMutation(v36);
          }
          long long v29 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          int v30 = [v29 progress];
          if (v30) {
            objc_msgSend(*(id *)(v1 + 184), "addChild:withPendingUnitCount:", v30, objc_msgSend(v29, "estimatedWeight"));
          }
          dispatch_group_enter(v24);
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __60__GEOTileGroupActivationSession__runMandatoryMigrationTasks__block_invoke;
          void v43[3] = &unk_1E53DA0F8;
          v43[4] = v1;
          v43[5] = v29;
          id v44 = v23;
          uint64_t v45 = v24;
          [v29 startWithCompletionHandler:v43 callbackQueue:*(void *)(v1 + 8)];
        }
        uint64_t v26 = [v36 countByEnumeratingWithState:&v46 objects:buf count:16];
      }
      while (v26);
    }

    id v31 = *(NSObject **)(v1 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__GEOTileGroupActivationSession__runMandatoryMigrationTasks__block_invoke_9;
    block[3] = &unk_1E53D8998;
    void block[4] = v1;
    id v42 = v23;
    id v32 = v23;
    dispatch_group_notify(v24, v31, block);
  }
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = NSNumber;
  [(NSProgress *)self->_progress fractionCompleted];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  [v5 setObject:v7 forKeyedSubscript:@"progress"];

  id v8 = [NSNumber numberWithUnsignedInteger:self->_phase];
  [v5 setObject:v8 forKeyedSubscript:@"phase"];

  if ([(NSArray *)self->_mandatoryMigrationTasks count])
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_mandatoryMigrationTasks, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v10 = self->_mandatoryMigrationTasks;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = _stateDescriptionForTask(*(void **)(*((void *)&v28 + 1) + 8 * i), (uint64_t)a3);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v12);
    }

    [v5 setObject:v9 forKeyedSubscript:@"mandatoryTasks"];
  }
  if ([(NSArray *)self->_opportunisticMigrationTasks count])
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_opportunisticMigrationTasks, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v17 = self->_opportunisticMigrationTasks;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = _stateDescriptionForTask(*(void **)(*((void *)&v24 + 1) + 8 * j), (uint64_t)a3);
          objc_msgSend(v16, "addObject:", v22, (void)v24);
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v19);
    }

    [v5 setObject:v16 forKeyedSubscript:@"opportunisticTasks"];
  }

  return v5;
}

- (void)dealloc
{
  GEOUnregisterStateCaptureLegacy();
  v3.receiver = self;
  v3.super_class = (Class)GEOTileGroupActivationSession;
  [(GEOTileGroupActivationSession *)&v3 dealloc];
}

- (void)start
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __38__GEOTileGroupActivationSession_start__block_invoke;
  v2[3] = &unk_1E53D79D8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_started, v2);
}

void __38__GEOTileGroupActivationSession_start__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__GEOTileGroupActivationSession_start__block_invoke_2;
  block[3] = &unk_1E53D79D8;
  void block[4] = v1;
  dispatch_async(v2, block);
}

void __60__GEOTileGroupActivationSession__runMandatoryMigrationTasks__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = GEOGetResourceManifestLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543618;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2114;
      id v11 = v3;
      id v6 = v9;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "Tile group migration task '%{public}@' encountered error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
    [*(id *)(a1 + 48) addObject:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138543362;
      id v9 = (id)objc_opt_class();
      id v7 = v9;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Tile group migration task '%{public}@' finished successfully", (uint8_t *)&v8, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke_41(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 56));
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__GEOTileGroupActivationSession__startOpportunisticTasks__block_invoke_2;
  v7[3] = &unk_1E53D99F0;
  uint64_t v5 = a1[6];
  id v6 = (void *)a1[7];
  v7[4] = v3;
  v7[5] = v5;
  id v8 = v6;
  [WeakRetained activationSession:v3 didChangeActiveTileGroup:v4 completionHandler:v7];
}

void __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_4;
  v3[3] = &unk_1E53D8998;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained activationSession:*(void *)(a1 + 32) didCompleteWithErrors:*(void *)(a1 + 40)];
}

void __63__GEOTileGroupActivationSession__finishPhaseWithResult_errors___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained activationSession:*(void *)(a1 + 32) didCompleteWithErrors:*(void *)(a1 + 40)];
}

- (void)cancel
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__GEOTileGroupActivationSession_cancel__block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

void __39__GEOTileGroupActivationSession_cancel__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 192);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v6++) cancel];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v4);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = *(id *)(*(void *)(a1 + 32) + 200);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11++), "cancel", (void)v15);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v24 count:16];
    }
    while (v9);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2 userInfo:0];
  id v23 = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  -[GEOTileGroupActivationSession _finishPhaseWithResult:errors:](v12, 0, v14);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opportunisticMigrationTasks, 0);
  objc_storeStrong((id *)&self->_mandatoryMigrationTasks, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_transaction, 0);
  objc_storeStrong((id *)&self->_migrators, 0);
  objc_storeStrong((id *)&self->_dataSet, 0);
  objc_storeStrong((id *)&self->_activeNames, 0);
  objc_storeStrong((id *)&self->_activeScenarios, 0);
  objc_storeStrong((id *)&self->_activeScales, 0);
  objc_storeStrong((id *)&self->_activeTileGroup, 0);
  objc_storeStrong((id *)&self->_environmentName, 0);
  objc_storeStrong((id *)&self->_resourceManifest, 0);
  objc_storeStrong((id *)&self->_newTileGroup, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end