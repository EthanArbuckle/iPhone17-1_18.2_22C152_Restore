@interface MPCModelStorePlaybackItemsRequestConsumeStorePlatformDictionary
@end

@implementation MPCModelStorePlaybackItemsRequestConsumeStorePlatformDictionary

void ___MPCModelStorePlaybackItemsRequestConsumeStorePlatformDictionary_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (_NSIsNSDictionary())
  {
    v6 = [v5 objectForKey:@"type"];
    if (_NSIsNSString() && [v6 isEqualToString:*MEMORY[0x263F11CB0]])
    {
      v7 = [v5 objectForKey:@"downloadAssets"];
      if (v7)
      {
        if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
        {
          uint64_t v8 = [*(id *)(a1 + 32) mutableCopy];
          uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
          v10 = *(void **)(v9 + 40);
          *(void *)(v9 + 40) = v8;
        }
        v11 = (void *)[v5 mutableCopy];
        [v11 removeObjectForKey:@"downloadAssets"];
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) replaceObjectAtIndex:a3 withObject:v11];
      }
      if (_NSIsNSDictionary())
      {
        if (*(void *)(a1 + 40))
        {
          v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = *(__CFString **)(a1 + 88);
            uint64_t v14 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 134218242;
            v47 = v13;
            __int16 v48 = 2114;
            uint64_t v49 = v14;
            _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "[MPCModelStorePlaybackItemsRequest] Siri asset info - Updating response for item %ld with HLS info: %{public}@", buf, 0x16u);
          }

          v15 = (void *)[v7 mutableCopy];
          [v15 addEntriesFromDictionary:*(void *)(a1 + 40)];
          uint64_t v16 = [v15 copy];

          v7 = (void *)v16;
        }
        v38 = v6;
        v17 = (void *)[objc_alloc(MEMORY[0x263F891F8]) initWithItemResponseDictionary:v7 urlBag:*(void *)(a1 + 48)];
        id v40 = objc_alloc_init(MEMORY[0x263F120E0]);
        [v40 setExpirationDate:*(void *)(a1 + 56)];
        v39 = v17;
        v18 = [v17 fileAssets];
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          v21 = 0;
          uint64_t v22 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v42 != v22) {
                objc_enumerationMutation(v18);
              }
              v24 = (void *)[objc_alloc(MEMORY[0x263F12280]) initWithiTunesCloudStoreFileAssetInfo:*(void *)(*((void *)&v41 + 1) + 8 * i)];
              if (v24)
              {
                if (!v21) {
                  v21 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v18, "count"));
                }
                [v21 addObject:v24];
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v41 objects:v45 count:16];
          }
          while (v20);
        }
        else
        {
          v21 = 0;
        }
        [v40 setFileAssetInfoList:v21];
        v25 = [v39 hlsAsset];
        v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = @"contains";
          if (!v25) {
            v27 = @"does not contain";
          }
          *(_DWORD *)buf = 138543362;
          v47 = v27;
          _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "[MPCModelStorePlaybackItemsRequest] Siri asset info %{public}@ HLS asset info", buf, 0xCu);
        }

        v6 = v38;
        if (v25)
        {
          v28 = (void *)[objc_alloc(MEMORY[0x263F12288]) initWithiTunesCloudStoreHLSAssetInfo:v25];
          [v40 setHlsAssetInfo:v28];
        }
        id v29 = objc_alloc_init(MEMORY[0x263F12268]);
        [v29 setAccountID:*(void *)(a1 + 96)];
        [v29 setRequestType:2];
        [v29 setStoreSubscriptionAdamID:*(void *)(a1 + 88)];
        v30 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        if (!v30)
        {
          uint64_t v31 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
          uint64_t v32 = *(void *)(*(void *)(a1 + 72) + 8);
          v33 = *(void **)(v32 + 40);
          *(void *)(v32 + 40) = v31;

          v30 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        }
        [v30 setObject:v40 forKey:v29];
        v34 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        if (!v34)
        {
          uint64_t v35 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
          uint64_t v36 = *(void *)(*(void *)(a1 + 80) + 8);
          v37 = *(void **)(v36 + 40);
          *(void *)(v36 + 40) = v35;

          v34 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        }
        [v34 addObject:v29];
      }
    }
  }
}

@end