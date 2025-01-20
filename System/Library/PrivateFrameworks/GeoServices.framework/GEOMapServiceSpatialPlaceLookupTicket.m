@interface GEOMapServiceSpatialPlaceLookupTicket
@end

@implementation GEOMapServiceSpatialPlaceLookupTicket

void __77___GEOMapServiceSpatialPlaceLookupTicket_submitWithHandler_auditToken_queue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = +[GEONotificationPreferenceManager sharedManager];
  int v8 = [v7 isEnabledForSubTestWithName:@"GEOPPTTest_PlaceRequestTicket_PlaceDataRequest"];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"GEOPPTTest_PlaceRequestTicket_PlaceDataRequestEND" object:v5];
  }
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    if (v6)
    {
      v10 = GEOGetGEOBatchSpatialLookupLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        id v14 = v6;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "SpatialPlaceLookup received error %@", (uint8_t *)&v13, 0xCu);
      }

      [*(id *)(a1 + 32) callCompletion:*(void *)(a1 + 48) onQueue:*(void *)(a1 + 40) withResult:0 error:v6];
    }
    else if (v5)
    {
      [*(id *)(a1 + 32) handleResponse:v5 completion:*(void *)(a1 + 48) queue:*(void *)(a1 + 40)];
    }
    else
    {
      v11 = GEOGetGEOBatchSpatialLookupLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "SpatialPlaceLookup received empty response", (uint8_t *)&v13, 2u);
      }

      v12 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Received unexpected response"];
      [*(id *)(a1 + 32) callCompletion:*(void *)(a1 + 48) onQueue:*(void *)(a1 + 40) withResult:0 error:v12];
    }
  }
}

void __74___GEOMapServiceSpatialPlaceLookupTicket_handleResponse_completion_queue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    if (v6)
    {
      [*(id *)(a1 + 32) callCompletion:*(void *)(a1 + 56) onQueue:*(void *)(a1 + 40) withResult:0 error:v6];
    }
    else
    {
      v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            int v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            id v14 = objc_msgSend(v13, "_identifier", (void)v16);

            if (v14)
            {
              uint64_t v15 = [v13 _identifier];
              [v7 setObject:v13 forKey:v15];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }

      [*(id *)(a1 + 32) createSpatialPlaceLookupResultForLookupResults:*(void *)(a1 + 48) mapItems:v7 completion:*(void *)(a1 + 56) queue:*(void *)(a1 + 40)];
    }
  }
}

void __115___GEOMapServiceSpatialPlaceLookupTicket_createSpatialPlaceLookupResultForLookupResults_mapItems_completion_queue___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  -[GEOPDSpatialPlaceLookupResult places](v5);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (![v16 count]
    || ([*(id *)(a1 + 32) mapItemsForPlaceLookupResponses:v16 usingIdentifierToMapItemMap:*(void *)(a1 + 40)], id v6 = objc_claimAutoreleasedReturnValue(), (v7 = v6) == 0))
  {
    id v6 = 0;
    v7 = *(void **)(a1 + 48);
  }
  id v8 = v7;

  uint64_t v9 = *(void **)(a1 + 56);
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 344) objectAtIndexedSubscript:a3];
  [v9 setObject:v8 forKey:v10];

  uint64_t v11 = *(void **)(a1 + 64);
  v12 = [GEOSpatialPlaceLookupResultItem alloc];
  int v13 = -[GEOPDSpatialPlaceLookupResult displayMapRegion](v5);

  id v14 = [(GEOSpatialPlaceLookupResultItem *)v12 initWithMapItems:v8 boundingRegion:v13];
  uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 344) objectAtIndexedSubscript:a3];
  [v11 setObject:v14 forKey:v15];
}

uint64_t __82___GEOMapServiceSpatialPlaceLookupTicket_callCompletion_onQueue_withResult_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v3();
  }
  return result;
}

@end