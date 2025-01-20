@interface FPProgressProxy
- (BOOL)updateFileCount;
- (id)shortDescription;
- (void)_readPausedProgressFromDisk;
- (void)dealloc;
- (void)setCancellationHandler:(id)a3;
- (void)setProgressDidSetupHandler:(id)a3;
- (void)setUpdateFileCount:(BOOL)a3;
- (void)startTrackingFileURL:(id)a3 kind:(id)a4 allowReadPausedProgressFromDisk:(BOOL)a5;
- (void)stopTrackingIfStarted;
- (void)stopTrackingIfStartedNotSynchronized;
- (void)updateWithProgress:(id)a3;
@end

@implementation FPProgressProxy

- (void)dealloc
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A33AE000, log, OS_LOG_TYPE_FAULT, "[CRIT] Progress proxy wasn't stop properly", v1, 2u);
}

- (id)shortDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:%p>", v5, self];

  return v6;
}

- (void)updateWithProgress:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[FPProgressProxy setPausable:](v5, "setPausable:", [v4 isPausable]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __38__FPProgressProxy_updateWithProgress___block_invoke;
  v23[3] = &unk_1E5AF0FF0;
  id v6 = v4;
  id v24 = v6;
  [(FPProgressProxy *)v5 setPausingHandler:v23];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __38__FPProgressProxy_updateWithProgress___block_invoke_2;
  v21[3] = &unk_1E5AF0FF0;
  id v7 = v6;
  id v22 = v7;
  [(FPProgressProxy *)v5 setResumingHandler:v21];
  -[FPProgressProxy setCancellable:](v5, "setCancellable:", [v7 isCancellable]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __38__FPProgressProxy_updateWithProgress___block_invoke_3;
  v19[3] = &unk_1E5AF0FF0;
  id v8 = v7;
  id v20 = v8;
  [(FPProgressProxy *)v5 setCancellationHandler:v19];
  if ([(FPProgressProxy *)v5 updateFileCount])
  {
    v9 = [v8 fileTotalCount];
    [(FPProgressProxy *)v5 setFileTotalCount:v9];

    v10 = [v8 fileCompletedCount];
    [(FPProgressProxy *)v5 setFileCompletedCount:v10];
  }
  [v8 fractionCompleted];
  double v12 = v11;
  -[FPProgressProxy _setCompletedUnitCount:totalUnitCount:](v5, "_setCompletedUnitCount:totalUnitCount:", (uint64_t)(v11 * (double)[v8 totalUnitCount]), objc_msgSend(v8, "totalUnitCount"));
  v13 = [v8 userInfo];
  v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F28800]];
  [(FPProgressProxy *)v5 setByteTotalCount:v14];

  v15 = [(FPProgressProxy *)v5 byteTotalCount];

  if (v15)
  {
    v16 = NSNumber;
    v17 = [(FPProgressProxy *)v5 byteTotalCount];
    v18 = objc_msgSend(v16, "numberWithDouble:", v12 * (double)objc_msgSend(v17, "longLongValue"));
    [(FPProgressProxy *)v5 setByteCompletedCount:v18];
  }
  else
  {
    [(FPProgressProxy *)v5 setByteCompletedCount:0];
  }

  objc_sync_exit(v5);
}

uint64_t __38__FPProgressProxy_updateWithProgress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pause];
}

uint64_t __38__FPProgressProxy_updateWithProgress___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) resume];
}

uint64_t __38__FPProgressProxy_updateWithProgress___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (void)setCancellationHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(FPProgressProxy *)self valueForKey:@"_lock"];
  [v6 lock];
  v5 = (void *)MEMORY[0x1A6248B00](v4);

  [(FPProgressProxy *)self setValue:v5 forKey:@"_cancellationHandler"];
  [v6 unlock];
}

- (void)_readPausedProgressFromDisk
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  double v7 = a4;
  OUTLINED_FUNCTION_17(&dword_1A33AE000, a2, a3, "[DEBUG] %@: reading paused progress from disk: %g", (uint8_t *)&v4);
}

- (void)startTrackingFileURL:(id)a3 kind:(id)a4 allowReadPausedProgressFromDisk:(BOOL)a5
{
  BOOL v5 = a5;
  location[4] = *(id *)MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  location[0] = 0;
  objc_initWeak(location, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke;
  v24[3] = &unk_1E5AF2F88;
  id v22 = &v28;
  objc_copyWeak(&v28, location);
  id v21 = v11;
  id v25 = v21;
  id v12 = v10;
  BOOL v29 = v5;
  id v26 = v12;
  v27 = self;
  v23 = (void *)MEMORY[0x1A6248B00](v24);
  v13 = self;
  objc_sync_enter(v13);
  v13->_isInSetup = 1;
  if (v13->_subscriber)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = [(FPProgressProxy *)v13 shortDescription];
    [v14 handleFailureInMethod:a2, v13, @"FPProgressProxy.m", 192, @"%@: startTracking/stopTracking not properly balanced", v15, v21, &v28 object file lineNumber description];

    if (v13->_subscriber) {
      [(FPProgressProxy *)v13 stopTrackingIfStarted];
    }
  }
  if (v13->_fileURL)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [(FPProgressProxy *)v13 shortDescription];
    [v16 handleFailureInMethod:a2, v13, @"FPProgressProxy.m", 197, @"%@: startTracking/stopTracking not properly balanced", v17 object file lineNumber description];
  }
  v13->_shouldStopAccessingURL = [v12 startAccessingSecurityScopedResource];
  objc_storeStrong((id *)&v13->_fileURL, a3);
  [(FPProgressProxy *)v13 setTotalUnitCount:-1];
  [(FPProgressProxy *)v13 setCancellable:0];
  if (v5) {
    [(FPProgressProxy *)v13 _readPausedProgressFromDisk];
  }
  v18 = fp_current_or_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    [(FPProgressProxy *)v13 shortDescription];
    objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fp_shortDescription");
    objc_claimAutoreleasedReturnValue();
    -[FPProgressProxy startTrackingFileURL:kind:allowReadPausedProgressFromDisk:]();
  }

  uint64_t v19 = [MEMORY[0x1E4F28F90] _addSubscriberForFileURL:v12 withPublishingHandler:v23];
  id subscriber = v13->_subscriber;
  v13->_id subscriber = (id)v19;

  v13->_isInSetup = 0;
  objc_sync_exit(v13);

  objc_destroyWeak(v22);
  objc_destroyWeak(location);
}

id __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (objc_msgSend(v3, "fp_isOfFileOperationKind:strict:", *(void *)(a1 + 32), 0))
    {
      BOOL v5 = [v3 fileURL];
      uint64_t v6 = objc_msgSend(v5, "fp_relationshipToItemAtURL:", *(void *)(a1 + 40));

      if (v6 == 1)
      {
        double v7 = (id *)WeakRetained;
        objc_sync_enter(v7);
        if (v7[19])
        {
          uint64_t v8 = fp_current_or_default_log();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            id v24 = [v7 shortDescription];
            id v25 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
            *(_DWORD *)buf = 138412802;
            v36 = v24;
            __int16 v37 = 2112;
            v38 = v25;
            __int16 v39 = 2112;
            id v40 = v3;
            _os_log_debug_impl(&dword_1A33AE000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: replace observer for %@, newProgress %@", buf, 0x20u);
          }
          [v7[19] finishObserving];
          v9 = v7[19];
          v7[19] = 0;
        }
        else
        {
          v9 = fp_current_or_default_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            id v26 = [v7 shortDescription];
            v27 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
            *(_DWORD *)buf = 138412802;
            v36 = v26;
            __int16 v37 = 2112;
            v38 = v27;
            __int16 v39 = 2112;
            id v40 = v3;
            _os_log_debug_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: add observer to %@, newProgress %@", buf, 0x20u);
          }
        }

        [v7 updateWithProgress:v3];
        v13 = [MEMORY[0x1E4F28EE8] keyPathWithRootObject:v3 path:"fractionCompleted"];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_18;
        v32[3] = &unk_1E5AF2F38;
        objc_copyWeak(&v34, (id *)(a1 + 56));
        id v33 = v3;
        uint64_t v14 = [v13 addObserverBlock:v32];
        id v15 = v7[19];
        v7[19] = (id)v14;

        objc_destroyWeak(&v34);
        objc_sync_exit(v7);

        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_2_20;
        v28[3] = &unk_1E5AF2F60;
        v28[4] = v7;
        id v16 = *(id *)(a1 + 40);
        char v31 = *(unsigned char *)(a1 + 64);
        uint64_t v17 = *(void *)(a1 + 48);
        id v29 = v16;
        uint64_t v30 = v17;
        v18 = (void *)MEMORY[0x1A6248B00](v28);
        id v10 = (void *)MEMORY[0x1A6248B00](v18, v19, v20, v21, v22);
      }
      else
      {
        id v12 = fp_current_or_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_cold_1(WeakRetained, v3, v12);
        }

        id v10 = &__block_literal_global_15_0;
      }
    }
    else
    {
      id v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_cold_2(WeakRetained, (uint64_t)v3, v11);
      }

      id v10 = &__block_literal_global_12_0;
    }
  }
  else
  {
    id v10 = &__block_literal_global_17;
  }

  return v10;
}

void __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateWithProgress:*(void *)(a1 + 32)];
}

void __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_2_20(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if (*(void *)(*(void *)(a1 + 32) + 152))
  {
    id v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(a1 + 32) shortDescription];
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
      objc_claimAutoreleasedReturnValue();
      __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_2_20_cold_1();
    }

    [*(id *)(*(void *)(a1 + 32) + 152) finishObserving];
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = *(void **)(v4 + 152);
    *(void *)(v4 + 152) = 0;
  }
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 48) _readPausedProgressFromDisk];
  }
  objc_sync_exit(v2);
}

- (void)stopTrackingIfStarted
{
  obj = self;
  objc_sync_enter(obj);
  [(FPProgressProxy *)obj stopTrackingIfStartedNotSynchronized];
  objc_sync_exit(obj);
}

- (void)stopTrackingIfStartedNotSynchronized
{
  if (self->_subscriber)
  {
    objc_msgSend(MEMORY[0x1E4F28F90], "_removeSubscriber:");
    id subscriber = self->_subscriber;
    self->_id subscriber = 0;
  }
  if (self->_shouldStopAccessingURL) {
    [(NSURL *)self->_fileURL stopAccessingSecurityScopedResource];
  }
  totalUnitCountObservation = self->_totalUnitCountObservation;
  if (totalUnitCountObservation)
  {
    [(NSObservation *)totalUnitCountObservation finishObserving];
    BOOL v5 = self->_totalUnitCountObservation;
    self->_totalUnitCountObservation = 0;
  }
  fractionCompletedObservation = self->_fractionCompletedObservation;
  if (fractionCompletedObservation)
  {
    [(NSObservation *)fractionCompletedObservation finishObserving];
    double v7 = self->_fractionCompletedObservation;
    self->_fractionCompletedObservation = 0;
  }
  fileURL = self->_fileURL;
  self->_fileURL = 0;
}

- (void)setProgressDidSetupHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  totalUnitCountObservation = v5->_totalUnitCountObservation;
  if (totalUnitCountObservation)
  {
    [(NSObservation *)totalUnitCountObservation finishObserving];
    double v7 = v5->_totalUnitCountObservation;
    v5->_totalUnitCountObservation = 0;
  }
  id location = 0;
  objc_initWeak(&location, v5);
  uint64_t v8 = [MEMORY[0x1E4F28EE8] keyPathWithRootObject:v5 path:"totalUnitCount"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__FPProgressProxy_setProgressDidSetupHandler___block_invoke;
  v12[3] = &unk_1E5AF2FB0;
  objc_copyWeak(&v14, &location);
  id v9 = v4;
  id v13 = v9;
  uint64_t v10 = [v8 addObserverBlock:v12];
  id v11 = v5->_totalUnitCountObservation;
  v5->_totalUnitCountObservation = (NSObservation *)v10;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  objc_sync_exit(v5);
}

void __46__FPProgressProxy_setProgressDidSetupHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = (id *)WeakRetained;
    objc_sync_enter(v6);
    if (!*((unsigned char *)v6 + 160) && [v6 totalUnitCount] >= 1)
    {
      double v7 = fp_current_or_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __46__FPProgressProxy_setProgressDidSetupHandler___block_invoke_cold_1((uint64_t)v6, v7);
      }

      *((unsigned char *)v6 + 160) = 1;
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      [v6[18] finishObserving];
      id v8 = v6[18];
      v6[18] = 0;
    }
    objc_sync_exit(v6);
  }
}

- (BOOL)updateFileCount
{
  return self->_updateFileCount;
}

- (void)setUpdateFileCount:(BOOL)a3
{
  self->_updateFileCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fractionCompletedObservation, 0);
  objc_storeStrong((id *)&self->_totalUnitCountObservation, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);

  objc_storeStrong(&self->_subscriber, 0);
}

- (void)startTrackingFileURL:kind:allowReadPausedProgressFromDisk:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_10_1(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_17(&dword_1A33AE000, v7, v5, "[DEBUG] %@: Trying to listen to %@", v6);
}

void __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_cold_1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 shortDescription];
  uint64_t v6 = [a2 fileURL];
  double v7 = objc_msgSend(v6, "fp_shortDescription");
  int v8 = 138412802;
  id v9 = v5;
  __int16 v10 = 2112;
  id v11 = v7;
  __int16 v12 = 2112;
  id v13 = a2;
  _os_log_debug_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: ignoring published progress of a different URL (%@) %@", (uint8_t *)&v8, 0x20u);
}

void __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 shortDescription];
  int v7 = 138412546;
  int v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  OUTLINED_FUNCTION_17(&dword_1A33AE000, a3, v6, "[DEBUG] %@: ignoring published progress of a different kind %@", (uint8_t *)&v7);
}

void __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_2_20_cold_1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_10_1(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_17(&dword_1A33AE000, v7, v5, "[DEBUG] %@: remove observer for %@", v6);
}

void __46__FPProgressProxy_setProgressDidSetupHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] FPProgressProxy: calling parent setup handler for: %@", (uint8_t *)&v2, 0xCu);
}

@end