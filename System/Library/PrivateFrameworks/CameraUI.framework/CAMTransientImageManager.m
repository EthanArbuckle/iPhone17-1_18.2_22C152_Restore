@interface CAMTransientImageManager
- (BOOL)isEmpty;
- (CAMTransientImageManager)init;
- (NSMutableDictionary)_activeRequestsByPairedUUID;
- (NSMutableDictionary)_pairedVideosByPairedUUID;
- (id)existingPairedVideoForUUID:(id)a3;
- (id)existingPairedVideoUUIDs;
- (id)insertPairedVideoWithConvertible:(id)a3 filterType:(int64_t)a4;
- (void)_handleRequestTimeout:(id)a3;
- (void)removePairedVideoForUUID:(id)a3;
- (void)requestPairedVideoURLForUUID:(id)a3 resultHandler:(id)a4;
@end

@implementation CAMTransientImageManager

- (CAMTransientImageManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)CAMTransientImageManager;
  v2 = [(CAMTransientImageManager *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pairedVideosByPairedUUID = v2->__pairedVideosByPairedUUID;
    v2->__pairedVideosByPairedUUID = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    activeRequestsByPairedUUID = v2->__activeRequestsByPairedUUID;
    v2->__activeRequestsByPairedUUID = v5;

    v7 = v2;
  }

  return v2;
}

- (BOOL)isEmpty
{
  v2 = [(CAMTransientImageManager *)self _pairedVideosByPairedUUID];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (id)existingPairedVideoUUIDs
{
  v2 = [(CAMTransientImageManager *)self _pairedVideosByPairedUUID];
  BOOL v3 = [v2 allKeys];

  return v3;
}

- (id)existingPairedVideoForUUID:(id)a3
{
  id v4 = a3;
  v5 = [(CAMTransientImageManager *)self _pairedVideosByPairedUUID];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)insertPairedVideoWithConvertible:(id)a3 filterType:(int64_t)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 irisStillImageUUID];
  v7 = [v5 persistenceURL];
  memset(&v51, 0, sizeof(v51));
  if (v5) {
    [v5 irisStillDisplayTime];
  }
  if (v6 && v7 && (v51.flags & 1) != 0)
  {
    v12 = [(CAMTransientImageManager *)self _pairedVideosByPairedUUID];
    v13 = [CAMTransientPairedVideo alloc];
    CMTime time = v51;
    v11 = [(CAMTransientPairedVideo *)v13 initWithURL:v7 stillDisplayTime:&time filterType:a4];
    [v12 setObject:v11 forKey:v6];

LABEL_11:
    v35 = v7;
    id v37 = v5;
    v14 = [(CAMTransientImageManager *)self _activeRequestsByPairedUUID];
    v15 = [v14 objectForKeyedSubscript:v6];

    v16 = [(CAMTransientImageManager *)self _activeRequestsByPairedUUID];
    v36 = v6;
    [v16 setObject:0 forKeyedSubscript:v6];

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v48;
      uint64_t v41 = *MEMORY[0x263F5E4E0];
      uint64_t v40 = *MEMORY[0x263F5E4D8];
      uint64_t v39 = *MEMORY[0x263F5E4D0];
      uint64_t v38 = *MEMORY[0x263F08320];
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v48 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          [v22 setIsFinished:1];
          v23 = [v22 resultHandler];
          if (v23)
          {
            [v22 setResultHandler:0];
            if (v11)
            {
              v24 = (void *)MEMORY[0x263EFF9A0];
              v25 = (void *)MEMORY[0x263F08D40];
              [(CAMTransientPairedVideo *)v11 stillDisplayTime];
              v26 = [v25 valueWithCMTime:v46];
              v27 = [v24 dictionaryWithObject:v26 forKey:v41];

              v28 = +[CAMEffectFilterManager ciFilterNameForFilterType:a4];
              if (v28) {
                [v27 setObject:v28 forKeyedSubscript:v40];
              }
              v29 = [(CAMTransientPairedVideo *)v11 url];
              ((void (**)(void, void *, void *))v23)[2](v23, v29, v27);
            }
            else
            {
              v30 = (void *)MEMORY[0x263F087E8];
              uint64_t v52 = v38;
              v53 = @"Invalid transient asset, unable to service the request.";
              uint64_t v54 = v39;
              v31 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
              v32 = [v30 errorWithDomain:@"com.apple.CAMTransientImageManagerErrorDomain" code:-1 userInfo:v31];
              v55 = v32;
              v27 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];

              ((void (**)(void, void, void *))v23)[2](v23, 0, v27);
            }
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v47 objects:v56 count:16];
      }
      while (v19);
    }

    objc_initWeak((id *)&time, self);
    dispatch_time_t v33 = dispatch_time(0, 60000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__CAMTransientImageManager_insertPairedVideoWithConvertible_filterType___block_invoke;
    block[3] = &unk_263FA0868;
    objc_copyWeak(&v45, (id *)&time);
    v6 = v36;
    id v44 = v36;
    dispatch_after(v33, MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)&time);

    id v5 = v37;
    v7 = v35;
    goto LABEL_26;
  }
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CMTime time = v51;
  objc_super v9 = (__CFString *)CMTimeCopyDescription(v8, &time);
  v10 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LODWORD(time.value) = 138543874;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v6;
    LOWORD(time.flags) = 2114;
    *(void *)((char *)&time.flags + 2) = v7;
    HIWORD(time.epoch) = 2114;
    v58 = v9;
    _os_log_error_impl(&dword_2099F8000, v10, OS_LOG_TYPE_ERROR, "Unable to insert a paired video for an invalid UUID (%{public}@), invalid URL (%{public}@), or invalid still display time (%{public}@)", (uint8_t *)&time, 0x20u);
  }

  v11 = 0;
  if (v6) {
    goto LABEL_11;
  }
LABEL_26:

  return v11;
}

void __72__CAMTransientImageManager_insertPairedVideoWithConvertible_filterType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removePairedVideoForUUID:*(void *)(a1 + 32)];
}

- (void)removePairedVideoForUUID:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v20 = [(CAMTransientImageManager *)self _pairedVideosByPairedUUID];
  [v20 removeObjectForKey:v4];
  id v5 = [(CAMTransientImageManager *)self _activeRequestsByPairedUUID];
  v6 = [v5 objectForKeyedSubscript:v4];

  v7 = [(CAMTransientImageManager *)self _activeRequestsByPairedUUID];
  v21 = v4;
  [v7 setObject:0 forKeyedSubscript:v4];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    uint64_t v11 = *MEMORY[0x263F5E4D0];
    uint64_t v12 = *MEMORY[0x263F08320];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v14 setIsCanceled:1];
        v15 = [v14 resultHandler];
        if (v15)
        {
          [v14 setResultHandler:0];
          v16 = (void *)MEMORY[0x263F087E8];
          uint64_t v27 = v12;
          v28 = @"Transient paired video was removed so player request was canceled.";
          uint64_t v29 = v11;
          id v17 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
          uint64_t v18 = [v16 errorWithDomain:@"com.apple.CAMTransientImageManagerErrorDomain" code:-1 userInfo:v17];
          v30 = v18;
          uint64_t v19 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];

          ((void (**)(void, void, void *))v15)[2](v15, 0, v19);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v9);
  }
}

- (void)requestPairedVideoURLForUUID:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  uint64_t v8 = [(CAMTransientImageManager *)self _pairedVideosByPairedUUID];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v11 = (void *)MEMORY[0x263F08D40];
    [v9 stillDisplayTime];
    uint64_t v12 = [v11 valueWithCMTime:v25];
    id v13 = [v10 dictionaryWithObject:v12 forKey:*MEMORY[0x263F5E4E0]];

    v14 = +[CAMEffectFilterManager ciFilterNameForFilterType:](CAMEffectFilterManager, "ciFilterNameForFilterType:", [v9 filterType]);
    if (v14) {
      [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x263F5E4D8]];
    }
    v15 = [v9 url];
    v7[2](v7, v15, v13);
  }
  else
  {
    v16 = [(CAMTransientImageManager *)self _activeRequestsByPairedUUID];
    id v13 = [v16 objectForKeyedSubscript:v6];

    if (!v13)
    {
      id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v17 = [(CAMTransientImageManager *)self _activeRequestsByPairedUUID];
      [v17 setObject:v13 forKeyedSubscript:v6];
    }
    uint64_t v18 = objc_alloc_init(CAMTransientImageManagerRequest);
    [(CAMTransientImageManagerRequest *)v18 setUuid:v6];
    [(CAMTransientImageManagerRequest *)v18 setResultHandler:v7];

    [v13 addObject:v18];
    objc_initWeak(&location, self);
    dispatch_time_t v19 = dispatch_time(0, 30000000000);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __71__CAMTransientImageManager_requestPairedVideoURLForUUID_resultHandler___block_invoke;
    v21[3] = &unk_263FA0868;
    objc_copyWeak(&v23, &location);
    v22 = v18;
    uint64_t v20 = v18;
    dispatch_after(v19, MEMORY[0x263EF83A0], v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

void __71__CAMTransientImageManager_requestPairedVideoURLForUUID_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleRequestTimeout:*(void *)(a1 + 32)];
}

- (void)_handleRequestTimeout:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([v4 isCanceled] & 1) == 0 && (objc_msgSend(v4, "isFinished") & 1) == 0)
  {
    [v4 setIsFinished:1];
    id v5 = [(CAMTransientImageManager *)self _activeRequestsByPairedUUID];
    id v6 = [v4 uuid];
    v7 = [v5 objectForKeyedSubscript:v6];

    [v7 removeObject:v4];
    uint64_t v8 = [v4 resultHandler];
    if (v8)
    {
      [v4 setResultHandler:0];
      uint64_t v15 = *MEMORY[0x263F5E4D0];
      uint64_t v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F08320];
      v14 = @"Transient player item request timed out.";
      uint64_t v10 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      uint64_t v11 = [v9 errorWithDomain:@"com.apple.CAMTransientImageManagerErrorDomain" code:-1 userInfo:v10];
      v16[0] = v11;
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];

      ((void (**)(void, void, void *))v8)[2](v8, 0, v12);
    }
  }
}

- (NSMutableDictionary)_pairedVideosByPairedUUID
{
  return self->__pairedVideosByPairedUUID;
}

- (NSMutableDictionary)_activeRequestsByPairedUUID
{
  return self->__activeRequestsByPairedUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeRequestsByPairedUUID, 0);
  objc_storeStrong((id *)&self->__pairedVideosByPairedUUID, 0);
}

@end