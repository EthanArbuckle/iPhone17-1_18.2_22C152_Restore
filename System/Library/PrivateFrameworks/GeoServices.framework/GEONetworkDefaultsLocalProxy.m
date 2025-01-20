@interface GEONetworkDefaultsLocalProxy
@end

@implementation GEONetworkDefaultsLocalProxy

void __55___GEONetworkDefaultsLocalProxy__updateNetworkDefaults__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) _incompleteTaskMetrics];
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;

  id v13 = v9;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = GEOGetNetworkDefaultsLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v19 = objc_opt_class();
        _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_ERROR, "Invalid response class: %{public}@", buf, 0xCu);
      }

      if (!v13)
      {
        v15 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11];
        id v7 = 0;
        goto LABEL_8;
      }
      id v7 = 0;
    }
  }
  v15 = v13;
LABEL_8:
  [*(id *)(a1 + 32) requestCompleted:v15];
  [*(id *)(a1 + 40) _processNetworkDefaultsResponse:v8 data:v7 error:v13 request:*(void *)(a1 + 48)];
  v16 = objc_msgSend(v10, "_geo_clientMetrics");
  v17 = GEOApplicationIdentifierOrProcessName();
  +[GEONetworkEventDataRecorder recordNetworkEventDataForDataRequestKind:6 usedBackgroundURL:MEMORY[0x1E4F1CC28] requestAppIdentifier:v17 appMajorVersion:0 appMinorVersion:0 error:v13 clientMetrics:v16 additionalStates:0];

  [*(id *)(a1 + 56) invalidateAndCancel];
}

uint64_t __83___GEONetworkDefaultsLocalProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke_100(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateNetworkDefaults];
}

uint64_t __66___GEONetworkDefaultsLocalProxy__callCompletionHandlersWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  *(unsigned char *)(*(void *)(a1 + 32) + 52) = 0;
  return result;
}

uint64_t __55___GEONetworkDefaultsLocalProxy__updateNetworkDefaults__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (*(unsigned char *)(*(void *)(result + 32) + 52))
  {
    *(unsigned char *)(v1 + 24) = 1;
  }
  else
  {
    *(unsigned char *)(v1 + 24) = 0;
    *(unsigned char *)(*(void *)(result + 32) + 52) = 1;
  }
  return result;
}

void __83___GEONetworkDefaultsLocalProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(unsigned char *)(a1[4] + 52);
  uint64_t v2 = (void *)a1[5];
  if (v2)
  {
    uint64_t v3 = *(void **)(a1[4] + 24);
    if (!v3)
    {
      uint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      uint64_t v5 = a1[4];
      v6 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = v4;

      uint64_t v2 = (void *)a1[5];
      uint64_t v3 = *(void **)(a1[4] + 24);
    }
    id v7 = (id)[v2 copy];
    [v3 addObject:v7];
  }
}

void __37___GEONetworkDefaultsLocalProxy_init__block_invoke(uint64_t a1)
{
  id global_queue = (id)geo_get_global_queue();
  _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_UseProductionURLs, (uint64_t)off_1E9115608, global_queue, *(void **)(a1 + 32));
  long long v4 = 0u;
  long long v5 = 0u;
  long long v3 = 0u;
  _recordForType(0, (uint64_t)&v3);
  _GEOConfigAddDelegateListenerForKey(*((uint64_t *)&v3 + 1), v4, global_queue, *(void **)(a1 + 32));
}

uint64_t __83___GEONetworkDefaultsLocalProxy_updateNetworkDefaultsWithReason_completionHandler___block_invoke_99(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateNetworkDefaultsWithReason:5 completionHandler:0];
}

void __60___GEONetworkDefaultsLocalProxy_captureStatePlistWithHints___block_invoke(uint64_t a1)
{
  id v12 = 0;
  uint64_t v2 = readNetworkDefaultsFromFile((uint64_t *)&v12);
  id v3 = v12;
  if (v2) {
    [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"CurrentValues"];
  }
  long long v4 = +[GEOFilePaths urlFor:23];
  id v11 = 0;
  int v5 = [v4 getResourceValue:&v11 forKey:*MEMORY[0x1E4F1C530] error:0];
  id v6 = v11;

  if (v5)
  {
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceDate:v6];
    double v9 = v8;

    v10 = [NSNumber numberWithDouble:v9];
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:@"Age"];
  }
}

@end