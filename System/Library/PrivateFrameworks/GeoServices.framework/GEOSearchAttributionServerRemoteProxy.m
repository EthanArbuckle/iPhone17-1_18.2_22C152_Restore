@interface GEOSearchAttributionServerRemoteProxy
- (GEOSearchAttributionServerRemoteProxy)init;
- (id)_attributionManifest;
- (void)_loadAttributionInfoForIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)loadAttributionInfoForIdentifiers:(id)a3 completionHandler:(id)a4;
@end

@implementation GEOSearchAttributionServerRemoteProxy

- (void)_loadAttributionInfoForIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v23 = v7;
    v8 = dispatch_group_create();
    v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v11 = [GEOSearchAttributionLoader alloc];
    v12 = self;
    v13 = [(GEOSearchAttributionServerRemoteProxy *)self _attributionManifest];
    v14 = [(GEOSearchAttributionLoader *)v11 initWithAttributionManifest:v13];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v24 = v6;
    id obj = v6;
    uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v37;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v36 + 1) + 8 * v18);
          dispatch_group_enter(v8);
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __94__GEOSearchAttributionServerRemoteProxy__loadAttributionInfoForIdentifiers_completionHandler___block_invoke;
          v31[3] = &unk_1E53EA6B8;
          v31[4] = v12;
          id v32 = v9;
          uint64_t v33 = v19;
          id v34 = v10;
          v35 = v8;
          [(GEOSearchAttributionLoader *)v14 loadAttributionInfoForIdentifier:v19 allowNetwork:0 completionHandler:v31];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v16);
    }

    attributionQueue = v12->_attributionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__GEOSearchAttributionServerRemoteProxy__loadAttributionInfoForIdentifiers_completionHandler___block_invoke_3;
    block[3] = &unk_1E53DE528;
    id v27 = v10;
    id v7 = v23;
    v29 = v12;
    id v30 = v23;
    id v28 = v9;
    id v21 = v9;
    id v22 = v10;
    dispatch_group_notify(v8, attributionQueue, block);

    id v6 = v24;
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CC08], MEMORY[0x1E4F1CC08]);
  }
}

- (id)_attributionManifest
{
  v2 = self;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  p_attributionManifestLock = &self->_attributionManifestLock;
  os_unfair_lock_lock(&self->_attributionManifestLock);
  attributionManifest = v2->_attributionManifest;
  if (!attributionManifest)
  {
    v5 = +[GEOFilePaths pathFor:30];
    if ([v5 length])
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v5];
      id v7 = [[GEOSearchAttributionManifest alloc] initWithData:v6];
      v8 = v2->_attributionManifest;
      v2->_attributionManifest = v7;

      v9 = v2->_attributionManifest;
      if (v9)
      {
        v31 = v6;
        id v32 = v5;
        uint64_t v33 = v2;
        id v34 = p_attributionManifestLock;
        context = (void *)MEMORY[0x18C1203C0]();
        v10 = [MEMORY[0x1E4F28D30] hashTableWithOptions:0];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v30 = v9;
        -[GEOSearchAttributionManifest searchAttributionSources](v9);
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v37 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (v37)
        {
          uint64_t v36 = *(void *)v46;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v46 != v36) {
                objc_enumerationMutation(obj);
              }
              uint64_t v38 = v11;
              v12 = *(id **)(*((void *)&v45 + 1) + 8 * v11);
              long long v41 = 0u;
              long long v42 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              -[GEOSearchAttributionSource localizedAttributions](v12);
              id v39 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v13 = [v39 countByEnumeratingWithState:&v41 objects:v49 count:16];
              if (v13)
              {
                uint64_t v14 = v13;
                uint64_t v40 = *(void *)v42;
                do
                {
                  for (uint64_t i = 0; i != v14; ++i)
                  {
                    if (*(void *)v42 != v40) {
                      objc_enumerationMutation(v39);
                    }
                    unint64_t v16 = 0;
                    uint64_t v17 = *(id **)(*((void *)&v41 + 1) + 8 * i);
                    if (v17)
                    {
LABEL_15:
                      -[GEOLocalizedAttribution _readLogoURLs]((uint64_t)v17);
                      unint64_t v18 = [v17[6] count];
                      goto LABEL_16;
                    }
                    while (1)
                    {
                      unint64_t v18 = 0;
LABEL_16:
                      if (v16 >= v18) {
                        break;
                      }
                      uint64_t v19 = -[GEOLocalizedAttribution logoURLsAtIndex:](v17, v16);
                      v20 = [v10 member:v19];
                      if (v20)
                      {
                        id v21 = -[GEOLocalizedAttribution logoURLs](v17);
                        [v21 replaceObjectAtIndex:v16 withObject:v20];
                      }
                      else
                      {
                        [v10 addObject:v19];
                      }

                      ++v16;
                      if (v17) {
                        goto LABEL_15;
                      }
                    }
                    unint64_t v22 = 0;
                    if (v17)
                    {
LABEL_23:
                      -[GEOLocalizedAttribution _readSnippetLogoURLs]((uint64_t)v17);
                      unint64_t v23 = [v17[7] count];
                      goto LABEL_24;
                    }
                    while (1)
                    {
                      unint64_t v23 = 0;
LABEL_24:
                      if (v22 >= v23) {
                        break;
                      }
                      id v24 = -[GEOLocalizedAttribution snippetLogoURLsAtIndex:](v17, v22);
                      v25 = [v10 member:v24];
                      if (v25)
                      {
                        v26 = -[GEOLocalizedAttribution snippetLogoURLs](v17);
                        [v26 replaceObjectAtIndex:v22 withObject:v25];
                      }
                      else
                      {
                        [v10 addObject:v24];
                      }

                      ++v22;
                      if (v17) {
                        goto LABEL_23;
                      }
                    }
                  }
                  uint64_t v14 = [v39 countByEnumeratingWithState:&v41 objects:v49 count:16];
                }
                while (v14);
              }

              uint64_t v11 = v38 + 1;
            }
            while (v38 + 1 != v37);
            uint64_t v37 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
          }
          while (v37);
        }

        v2 = v33;
        p_attributionManifestLock = v34;
        id v6 = v31;
        v5 = v32;
        v9 = v30;
      }
    }
    attributionManifest = v2->_attributionManifest;
  }
  id v27 = attributionManifest;
  os_unfair_lock_unlock(p_attributionManifestLock);

  return v27;
}

void __94__GEOSearchAttributionServerRemoteProxy__loadAttributionInfoForIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__GEOSearchAttributionServerRemoteProxy__loadAttributionInfoForIdentifiers_completionHandler___block_invoke_2;
  block[3] = &unk_1E53EA690;
  id v10 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(void **)(a1 + 56);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = v7;
  id v14 = *(id *)(a1 + 64);
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __93__GEOSearchAttributionServerRemoteProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadAttributionInfoForIdentifiers:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)loadAttributionInfoForIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  attributionQueue = self->_attributionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__GEOSearchAttributionServerRemoteProxy_loadAttributionInfoForIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_1E53D7F70;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(attributionQueue, block);
}

void __94__GEOSearchAttributionServerRemoteProxy__loadAttributionInfoForIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  if (v2) {
    [*(id *)(a1 + 40) setObject:v2 forKey:v3];
  }
  else {
    [*(id *)(a1 + 56) addObject:v3];
  }
  v4 = *(NSObject **)(a1 + 64);

  dispatch_group_leave(v4);
}

void __94__GEOSearchAttributionServerRemoteProxy__loadAttributionInfoForIdentifiers_completionHandler___block_invoke_3(uint64_t a1)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "Missing some attribution information. Asking geod to load it instead.", buf, 2u);
    }

    v18[0] = @"searchattribution.loadAttribution";
    v17[0] = @"message";
    v17[1] = @"userInfo";
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v15 = @"identifiers";
    uint64_t v16 = v3;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v18[1] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

    id v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    id v7 = +[GEOXPCConnection createServerConnectionFor:13 debugIdentifier:@"SearchAttribution" eventHandler:0];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __94__GEOSearchAttributionServerRemoteProxy__loadAttributionInfoForIdentifiers_completionHandler___block_invoke_24;
    v10[3] = &unk_1E53EA6E0;
    id v11 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 40);
    [v7 sendMessage:v6 withReply:v8 handler:v10];
  }
  else
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v9();
  }
}

- (GEOSearchAttributionServerRemoteProxy)init
{
  v13.receiver = self;
  v13.super_class = (Class)GEOSearchAttributionServerRemoteProxy;
  uint64_t v2 = [(GEOSearchAttributionServerRemoteProxy *)&v13 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_attributionManifestLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = geo_dispatch_queue_create_with_workloop_qos();
    attributionQueue = v3->_attributionQueue;
    v3->_attributionQueue = (OS_dispatch_queue *)v4;

    objc_initWeak(&location, v3);
    id v6 = GEOSearchAttributionManifestUpdatedDarwinNotificationName;
    id v7 = v3->_attributionQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__GEOSearchAttributionServerRemoteProxy_init__block_invoke;
    v10[3] = &unk_1E53DD2C0;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch(v6, &v3->_attributionManifestUpdatedToken, v7, v10);
    uint64_t v8 = v3;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v3;
}

void __45__GEOSearchAttributionServerRemoteProxy_init__block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained + 6;
    uint64_t v4 = WeakRetained;
    os_unfair_lock_lock_with_options();
    uint64_t v3 = *(void **)&v4[4]._os_unfair_lock_opaque;
    *(void *)&v4[4]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v2);
    WeakRetained = v4;
  }
}

void __94__GEOSearchAttributionServerRemoteProxy__loadAttributionInfoForIdentifiers_completionHandler___block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F145A8])
  {
    id v27 = GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

    if (v28)
    {
      v29 = (void *)MEMORY[0x18C121170](v3);
      id v30 = GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v65 = v29;
        _os_log_impl(&dword_188D96000, v30, OS_LOG_TYPE_ERROR, "Error loading attribution info from geod: %{public}s", buf, 0xCu);
      }

      free(v29);
    }
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v26 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v31 = *(id *)(a1 + 32);
    uint64_t v32 = [v31 countByEnumeratingWithState:&v58 objects:v69 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v59 != v34) {
            objc_enumerationMutation(v31);
          }
          [v4 setObject:v26 forKey:*(void *)(*((void *)&v58 + 1) + 8 * i)];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v58 objects:v69 count:16];
      }
      while (v33);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v42 = a1;
      id v43 = v3;
      long long v41 = v4;
      long long v44 = [v4 objectForKey:@"userInfo"];
      id v5 = [v44 objectForKey:@"errors"];
      long long v45 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v54 objects:v68 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v55;
        do
        {
          for (uint64_t j = 0; j != v8; ++j)
          {
            if (*(void *)v55 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = *(void **)(*((void *)&v54 + 1) + 8 * j);
            id v12 = [v6 objectForKey:v11];
            objc_super v13 = _geo_NSErrorFromDictionaryRepresentationCopy(v12);
            if (!v13)
            {
              objc_super v13 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15 reason:@"Bad response data"];
            }
            id v14 = GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v65 = v11;
              __int16 v66 = 2114;
              v67 = v13;
              _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_ERROR, "Error loading attribution info for identifier %{public}@ from geod: %{public}@", buf, 0x16u);
            }

            [v45 setObject:v13 forKey:v11];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v54 objects:v68 count:16];
        }
        while (v8);
      }

      uint64_t v15 = [v44 objectForKey:@"attributionInfos"];
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v17 = v15;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v50 objects:v63 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v51;
        do
        {
          for (uint64_t k = 0; k != v19; ++k)
          {
            if (*(void *)v51 != v20) {
              objc_enumerationMutation(v17);
            }
            unint64_t v22 = *(void **)(*((void *)&v50 + 1) + 8 * k);
            unint64_t v23 = [v17 objectForKey:v22];
            id v24 = [[GEOSearchAttributionInfo alloc] initWithDictionaryRepresentation:v23];
            if (v24)
            {
              v25 = GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                v65 = v22;
                _os_log_impl(&dword_188D96000, v25, OS_LOG_TYPE_DEBUG, "Finished loading attribution info from geod for identifier '%{public}@'", buf, 0xCu);
              }

              [v16 setObject:v24 forKey:v22];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v50 objects:v63 count:16];
        }
        while (v19);
      }

      [*(id *)(v42 + 40) addEntriesFromDictionary:v16];
      (*(void (**)(void))(*(void *)(v42 + 48) + 16))();

      id v3 = v43;
      v26 = v44;
      uint64_t v4 = v41;
    }
    else
    {
      v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      id v6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v36 = *(id *)(a1 + 32);
      uint64_t v37 = [v36 countByEnumeratingWithState:&v46 objects:v62 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v47;
        do
        {
          for (uint64_t m = 0; m != v38; ++m)
          {
            if (*(void *)v47 != v39) {
              objc_enumerationMutation(v36);
            }
            [v26 setObject:v6 forKey:*(void *)(*((void *)&v46 + 1) + 8 * m)];
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v46 objects:v62 count:16];
        }
        while (v38);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionManifest, 0);

  objc_storeStrong((id *)&self->_attributionQueue, 0);
}

@end