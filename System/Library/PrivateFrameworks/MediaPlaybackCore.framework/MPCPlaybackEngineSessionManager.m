@interface MPCPlaybackEngineSessionManager
@end

@implementation MPCPlaybackEngineSessionManager

void __62___MPCPlaybackEngineSessionManager_saveSessionWithCompletion___block_invoke_45(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) containsRestorableContent])
  {
    id v2 = objc_alloc(MEMORY[0x263F54F30]);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v9 = *MEMORY[0x263F11C30];
    v10[0] = &unk_26CC193C8;
    v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    v5 = (void *)[v2 initWithCodingPackage:v3 userInfo:v4];

    [v5 encodeRootObject:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlaybackSessionManagerError", 3, @"Opting not to save an archive that does not contain restorable content");
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __65___MPCPlaybackEngineSessionManager_setStateRestorationSupported___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = objc_opt_class();
    uint64_t v3 = [*(id *)(a1 + 32) _playbackSessionsDirectory];
    uint64_t v4 = [v2 archivesAtURL:v3];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;

    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "count"));
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = *(id *)(*(void *)(a1 + 32) + 32);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v16 = *(void **)(*(void *)(a1 + 32) + 40);
          v17 = objc_msgSend(v15, "identifier", (void)v24);
          [v16 setObject:v15 forKeyedSubscript:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x263EFF980] array];
    uint64_t v19 = *(void *)(a1 + 32);
    v20 = *(void **)(v19 + 32);
    *(void *)(v19 + 32) = v18;

    uint64_t v21 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v22 = *(void *)(a1 + 32);
    v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;
  }
}

void __62___MPCPlaybackEngineSessionManager_saveSessionWithCompletion___block_invoke_49(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v44 = 0;
    [v5 saveWithError:&v44];
    id v6 = v44;
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = [v6 domain];
      if ([v8 isEqualToString:*MEMORY[0x263F07F70]])
      {
        uint64_t v9 = [v7 code];

        if (v9 == 640)
        {
          unint64_t v41 = [*(id *)(*(void *)(a1 + 32) + 32) count];
          if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 32) count] >= 2)
          {
            id v10 = "com.apple.amp.mediaplaybackcore";
            do
            {
              uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 32) lastObject];
              uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 40);
              uint64_t v13 = [v11 identifier];
              [v12 setObject:0 forKeyedSubscript:v13];

              [*(id *)(*(void *)(a1 + 32) + 32) removeLastObject];
              id v43 = 0;
              [v11 deleteWithError:&v43];
              id v14 = v43;
              v15 = os_log_create(v10, "Session");
              v16 = v15;
              if (v14)
              {
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v17 = *(void *)(a1 + 32);
                  uint64_t v18 = [v11 identifier];
                  objc_msgSend(v14, "msv_description");
                  v20 = uint64_t v19 = v10;
                  *(_DWORD *)buf = 134218498;
                  uint64_t v46 = v17;
                  __int16 v47 = 2114;
                  v48 = v18;
                  __int16 v49 = 2114;
                  v50 = v20;
                  _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_ERROR, "_MPCPlaybackEngineSessionManager %p - saveSessionWithCompletion [out of disk space] deleting archive: %{public}@ error=%{public}@", buf, 0x20u);

                  id v10 = v19;
                }
              }
              else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v21 = *(void *)(a1 + 32);
                uint64_t v22 = [v11 identifier];
                *(_DWORD *)buf = 134218242;
                uint64_t v46 = v21;
                __int16 v47 = 2114;
                v48 = v22;
                _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "_MPCPlaybackEngineSessionManager %p - saveSessionWithCompletion [out of disk space] deleting archive: %{public}@", buf, 0x16u);
              }
            }
            while ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 32) count] > 1);
          }
          if (v41 >= 2)
          {
            v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Session");
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v24 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 134217984;
              uint64_t v46 = v24;
              _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "_MPCPlaybackEngineSessionManager %p - saveSessionWithCompletion: [out of disk space] deleted old archives attempting to save again", buf, 0xCu);
            }

            long long v25 = *(void **)(a1 + 40);
            id v42 = 0;
            [v25 saveWithError:&v42];
            id v7 = v42;
          }
          if (!v7) {
            goto LABEL_21;
          }
        }
      }
      else
      {
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_30:

      return;
    }
LABEL_21:
    long long v26 = *(void **)(*(void *)(a1 + 32) + 40);
    long long v27 = [*(id *)(a1 + 40) identifier];
    id v7 = [v26 objectForKeyedSubscript:v27];

    if (v7) {
      [*(id *)(*(void *)(a1 + 32) + 32) removeObjectIdenticalTo:v7];
    }
    [*(id *)(*(void *)(a1 + 32) + 32) insertObject:*(void *)(a1 + 40) atIndex:0];
    v28 = *(void **)(a1 + 40);
    uint64_t v29 = *(void **)(*(void *)(a1 + 32) + 40);
    v30 = [v28 identifier];
    [v29 setObject:v28 forKeyedSubscript:v30];

    if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 32) count] >= 0xB)
    {
      do
      {
        v31 = [*(id *)(*(void *)(a1 + 32) + 32) lastObject];
        v32 = *(void **)(*(void *)(a1 + 32) + 40);
        v33 = [v31 identifier];
        [v32 setObject:0 forKeyedSubscript:v33];

        [*(id *)(*(void *)(a1 + 32) + 32) removeLastObject];
        [v31 deleteWithError:0];
      }
      while ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 32) count] > 0xA);
    }
    v34 = *(void **)(a1 + 32);
    v35 = [*(id *)(a1 + 40) identifier];
    [v34 setStateRestorationSessionIdentifier:v35];

    v36 = os_log_create("com.apple.amp.mediaplaybackcore", "Session");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = *(void *)(a1 + 32);
      v38 = [*(id *)(a1 + 40) identifier];
      *(_DWORD *)buf = 134218242;
      uint64_t v46 = v37;
      __int16 v47 = 2114;
      v48 = v38;
      _os_log_impl(&dword_21BB87000, v36, OS_LOG_TYPE_DEFAULT, "_MPCPlaybackEngineSessionManager %p - saveSessionWithCompletion: created archive identifier=%{public}@", buf, 0x16u);
    }
    uint64_t v39 = *(void *)(a1 + 48);
    v40 = [*(id *)(a1 + 40) identifier];
    (*(void (**)(uint64_t, void *, void))(v39 + 16))(v39, v40, 0);

    goto LABEL_30;
  }
  id v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Session");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v46 = v3;
    __int16 v47 = 2114;
    v48 = v4;
    _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_ERROR, "_MPCPlaybackEngineSessionManager %p - saveSessionWithCompletion - failed to encode with error=%{public}@", buf, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __62___MPCPlaybackEngineSessionManager_saveSessionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Session");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "_MPCPlaybackEngineSessionManager %p - saveSessionWithCompletion - skipping artwork [failed to get artwork] error=%{public}@", buf, 0x16u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62___MPCPlaybackEngineSessionManager_saveSessionWithCompletion___block_invoke_43;
    block[3] = &unk_2643C6660;
    id v11 = *(id *)(a1 + 48);
    id v12 = v5;
    id v13 = *(id *)(a1 + 40);
    dispatch_async(v9, block);
  }
}

void __62___MPCPlaybackEngineSessionManager_saveSessionWithCompletion___block_invoke_43(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) imageByPreparingForDisplay];
  [*(id *)(a1 + 32) setArtworkImage:v2];

  uint64_t v3 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v3);
}

uint64_t __50___MPCPlaybackEngineSessionManager_archivesAtURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 distantPast];
  uint64_t v8 = [MEMORY[0x263EFF910] distantPast];
  uint64_t v9 = [v6 packageURL];

  id v17 = 0;
  uint64_t v10 = *MEMORY[0x263EFF5F8];
  [v9 getResourceValue:&v17 forKey:*MEMORY[0x263EFF5F8] error:0];
  id v11 = v17;

  id v12 = [v5 packageURL];

  id v16 = 0;
  [v12 getResourceValue:&v16 forKey:v10 error:0];
  id v13 = v16;

  uint64_t v14 = [v13 compare:v11];
  return v14;
}

@end