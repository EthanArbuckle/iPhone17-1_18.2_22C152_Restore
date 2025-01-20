@interface MPCProcessSiriAssetInfoWithStorePlatformPayload
@end

@implementation MPCProcessSiriAssetInfoWithStorePlatformPayload

void ___MPCProcessSiriAssetInfoWithStorePlatformPayload_block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if _NSIsNSString() && (_NSIsNSDictionary())
  {
    v5 = (void *)a1[4];
    v6 = (void *)a1[5];
    id v17 = 0;
    id v18 = 0;
    id v16 = 0;
    _MPCModelStorePlaybackItemsRequestConsumeStorePlatformDictionary(v4, v5, v6, &v18, &v17, &v16);
    os_log_t v7 = (os_log_t)v18;
    id v8 = v17;
    id v9 = v16;
    [v7 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_22898];
    if (v8)
    {
      ++*(void *)(*(void *)(a1[7] + 8) + 24);
      v10 = (void *)[objc_alloc(MEMORY[0x263F12290]) initWithStorePlatformDictionary:v8 expirationDate:a1[6]];
      v11 = [MEMORY[0x263F122A0] sharedStoreItemMetadataRequestController];
      [v11 addStoreItemMetadata:v10];
    }
    if ([v9 count])
    {
      v12 = *(void **)(*(void *)(a1[8] + 8) + 40);
      if (!v12)
      {
        id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v14 = *(void *)(a1[8] + 8);
        v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;

        v12 = *(void **)(*(void *)(a1[8] + 8) + 40);
      }
      [v12 addObjectsFromArray:v9];
    }
  }
  else
  {
    os_log_t v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "[MPCModelStorePlaybackItemsRequest] Siri asset info has results dictionary with invalid key or value format.", buf, 2u);
    }
  }
}

void ___MPCProcessSiriAssetInfoWithStorePlatformPayload_block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x263F12260];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 sharedCache];
  [v7 addCachedResponse:v5 forRequest:v6];
}

@end