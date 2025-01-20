@interface HKMobileAssetDownloadManager
@end

@implementation HKMobileAssetDownloadManager

void __63___HKMobileAssetDownloadManager_downloadAssetsWithQueryParams___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)])
  {
    _HKInitializeLogging();
    v2 = HKLogMobileAsset;
    if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v8 = 138543618;
      uint64_t v9 = v3;
      __int16 v10 = 2112;
      uint64_t v11 = v4;
      _os_log_impl(&dword_19C023000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Load requested for queryParams already in progress: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 32));
    _HKInitializeLogging();
    v5 = HKLogMobileAsset;
    if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543618;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning load for queryParams: %@", (uint8_t *)&v8, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_fetchAssetsWithLocalInformation:shouldRequery:queryParams:returnTypes:", *(unsigned __int8 *)(*(void *)(a1 + 32) + 40), 1, *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 72));
    [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  }
}

void __93___HKMobileAssetDownloadManager_fetchAssetsWithQueryParams_onlyLocal_returnTypes_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _generateAssetQueryFromQueryParams:*(void *)(a1 + 40) returnTypes:*(void *)(a1 + 56)];
  _HKInitializeLogging();
  uint64_t v3 = HKLogMobileAsset;
  if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543618;
    uint64_t v6 = v4;
    __int16 v7 = 2112;
    int v8 = v2;
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning non-downloading fetch for query: %@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_fetchAssetsWithQuery:onlyLocal:completion:", v2, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 48));
}

uint64_t __65___HKMobileAssetDownloadManager_downloadMobileAssets_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)HKLogMobileAsset;
  if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    int v5 = v2;
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = [v3 count];
    _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning download operation for %ld assets", (uint8_t *)&v7, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_downloadAssets:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke(void *a1, void *a2)
{
  id v4 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 24));
  if (!*(void *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v3 = a1[5];
    if (v3) {
      (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24), v4);
    }
  }
}

void __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_291(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v2 = *(id *)(a1 + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v15;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v15 != v5) {
            objc_enumerationMutation(v2);
          }
          int v7 = *(void **)(*((void *)&v14 + 1) + 8 * v6);
          if ([v7 state] == 2 || objc_msgSend(v7, "state") == 3 || objc_msgSend(v7, "state") == 6)
          {
            v11[0] = MEMORY[0x1E4F143A8];
            v11[1] = 3221225472;
            v11[2] = __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_2;
            v11[3] = &unk_1E58C8CC8;
            int8x16_t v13 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
            uint64_t v8 = *(void **)(a1 + 48);
            v11[4] = *(void *)(a1 + 40);
            v11[5] = v7;
            id v12 = v8;
            [v7 purge:v11];
          }
          else
          {
            --*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v9 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
        uint64_t v4 = v9;
      }
      while (v9);
    }
  }
  else
  {
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v10();
  }
}

void __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _errorWithDomain:@"MAPurgeResult" code:a2];
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  if (v3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = *(unsigned char *)(v4 + 24) == 0;
  }
  char v6 = !v5;
  *(unsigned char *)(v4 + 24) = v6;
  --*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  _HKInitializeLogging();
  int v7 = HKLogMobileAsset;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_ERROR)) {
      __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_2_cold_2((uint64_t)v3, a1, v7);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEBUG))
  {
    __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_2_cold_1(a1, v7);
  }
  uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_292;
  v11[3] = &unk_1E58BBF10;
  id v9 = *(id *)(a1 + 48);
  id v12 = v3;
  id v13 = v9;
  id v10 = v3;
  dispatch_async(v8, v11);
}

uint64_t __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_292(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _errorWithDomain:@"MADownloadResult" code:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    BOOL v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  char v6 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v6);
}

void __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(a1 + 56);
  uint64_t v2 = *(void *)(a1 + 56);
  if (*(void *)(*(void *)(v2 + 8) + 40))
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_ERROR)) {
      __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke_2_cold_1();
    }
    uint64_t v2 = *v3;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke_295;
  v5[3] = &unk_1E58C8D68;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  uint64_t v8 = v2;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v4 queryMetaData:v5];
}

void __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke_295(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke_2_296;
  block[3] = &unk_1E58C8D40;
  uint64_t v10 = a2;
  block[4] = v3;
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v6;
  long long v9 = v6;
  id v8 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

void __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke_2_296(uint64_t a1)
{
  if (*(void *)(a1 + 64))
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_errorWithDomain:code:", @"MAQueryResult");
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = [*(id *)(a1 + 40) results];
  (*(void (**)(uint64_t, id, void))(v5 + 16))(v5, v6, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
}

void __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _errorWithDomain:@"MADownloadResult" code:a2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  id v6 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v6);
}

void __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 48;
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v5 = (id *)(a1 + 32);
  uint64_t v4 = *(id **)(a1 + 32);
  if (v3)
  {
    [v4[2] removeObject:*(void *)(a1 + 40)];
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_ERROR)) {
      __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_2_cold_1();
    }
    [*v5 _callErrorHandlerWithError:*(void *)(*(void *)(*(void *)v2 + 8) + 40)];
  }
  else
  {
    id v6 = [v4 _generateAssetQueryFromQueryParams:*(void *)(a1 + 40) returnTypes:*(void *)(a1 + 56)];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_297;
    v10[3] = &unk_1E58C8E08;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v6;
    __int16 v14 = *(_WORD *)(a1 + 64);
    long long v9 = *(_OWORD *)(a1 + 40);
    id v7 = (id)v9;
    long long v12 = v9;
    uint64_t v13 = *(void *)(a1 + 56);
    id v8 = v6;
    [v8 queryMetaData:v10];
  }
}

void __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_297(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_2_298;
  block[3] = &unk_1E58C8DE0;
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = a2;
  block[4] = v3;
  id v8 = *(id *)(a1 + 40);
  __int16 v13 = *(_WORD *)(a1 + 72);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 64);
  id v9 = v5;
  uint64_t v12 = v6;
  dispatch_async(v4, block);
}

void __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_2_298(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 64))
  {
    uint64_t v2 = (id *)(a1 + 32);
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_errorWithDomain:code:", @"MAQueryResult");
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_ERROR)) {
      __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_2_298_cold_1();
    }
    [*v2 _callErrorHandlerWithError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }
  uint64_t v6 = [*(id *)(a1 + 40) results];
  if (v6)
  {

    goto LABEL_7;
  }
  if (!*(unsigned char *)(a1 + 80))
  {
LABEL_7:
    id v7 = *(unsigned __int8 **)(a1 + 32);
    int v8 = v7[41];
    id v9 = [*(id *)(a1 + 40) results];
    if (v8)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_305;
      v12[3] = &unk_1E58C8DB8;
      v12[4] = *(void *)(a1 + 32);
      id v13 = *(id *)(a1 + 48);
      objc_msgSend(v7, "_queue_downloadAssets:completion:", v9, v12);
    }
    else
    {
      [v7 _callDownloadCompletionHandlerWithAssets:v9 queryParams:*(void *)(a1 + 48)];
    }
    return;
  }
  _HKInitializeLogging();
  uint64_t v10 = HKLogMobileAsset;
  if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 81)) {
      uint64_t v11 = @"remote";
    }
    else {
      uint64_t v11 = @"local";
    }
    *(_DWORD *)buf = 138543362;
    long long v15 = v11;
    _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_DEFAULT, "Unable to fetch assets, fetching %{public}@ results.", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_fetchAssetsWithLocalInformation:shouldRequery:queryParams:returnTypes:", *(unsigned char *)(a1 + 81) == 0, 0, *(void *)(a1 + 48), *(void *)(a1 + 72));
}

uint64_t __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_305(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _callDownloadCompletionHandlerWithAssets:a2 queryParams:*(void *)(a1 + 40)];
}

void *__66___HKMobileAssetDownloadManager__queue_downloadAssets_completion___block_invoke(void *result)
{
  if (!*(void *)(*(void *)(result[5] + 8) + 24))
  {
    uint64_t v1 = result[4];
    if (v1) {
      return (void *)(*(uint64_t (**)(void, void, void))(v1 + 16))(result[4], *(void *)(*(void *)(result[6] + 8) + 40), *(void *)(*(void *)(result[7] + 8) + 40));
    }
  }
  return result;
}

void __66___HKMobileAssetDownloadManager__queue_downloadAssets_completion___block_invoke_2(void *a1, uint64_t a2, int a3, void *a4)
{
  id v17 = a4;
  [*(id *)(a1[4] + 8) removeObject:a2];
  if (a3)
  {
    uint64_t v8 = *(void *)(a1[7] + 8);
    id v9 = *(void **)(v8 + 40);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v10;
    }
    else
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v13 = *(void *)(a1[7] + 8);
      uint64_t v11 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }

    [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:a1[5]];
  }
  --*(void *)(*(void *)(a1[8] + 8) + 24);
  uint64_t v14 = *(void *)(a1[9] + 8);
  uint64_t v16 = *(void *)(v14 + 40);
  long long v15 = (id *)(v14 + 40);
  if (!v16) {
    objc_storeStrong(v15, a4);
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __86___HKMobileAssetDownloadManager__callDownloadCompletionHandlerWithAssets_queryParams___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 16) removeObject:a1[5]];
  uint64_t v2 = _Block_copy(*(const void **)(a1[4] + 88));
  id v5 = v2;
  if (v2) {
    (*((void (**)(void *, void))v2 + 2))(v2, a1[6]);
  }
  if (![*(id *)(a1[4] + 8) count])
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;
  }
}

void __60___HKMobileAssetDownloadManager__callErrorHandlerWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 64));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(void *, void))v2 + 2))(v2, *(void *)(a1 + 40));
    uint64_t v2 = v3;
  }
}

void __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_19C023000, a2, OS_LOG_TYPE_DEBUG, "Purged asset (%@)", (uint8_t *)&v3, 0xCu);
}

void __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a2 + 40);
  OUTLINED_FUNCTION_1(&dword_19C023000, a2, a3, "Failed to purge asset with error: %{public}@\n(%@)", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Error querying remote assets: %{public}@, returning local assets.");
}

void __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Error downloading catalog: %{public}@");
}

void __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_2_298_cold_1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Error querying metadata: %{public}@");
}

@end