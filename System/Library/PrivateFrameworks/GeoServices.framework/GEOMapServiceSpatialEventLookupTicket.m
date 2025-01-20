@interface GEOMapServiceSpatialEventLookupTicket
@end

@implementation GEOMapServiceSpatialEventLookupTicket

void __77___GEOMapServiceSpatialEventLookupTicket_submitWithHandler_auditToken_queue___block_invoke(uint64_t a1, void *a2, void *a3)
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
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "SpatialEventLookup received error %@", (uint8_t *)&v13, 0xCu);
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
        _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "SpatialEventLookup received empty response", (uint8_t *)&v13, 2u);
      }

      v12 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Received unexpected response"];
      [*(id *)(a1 + 32) callCompletion:*(void *)(a1 + 48) onQueue:*(void *)(a1 + 40) withResult:0 error:v12];
    }
  }
}

void __118___GEOMapServiceSpatialEventLookupTicket_createSpatialEventLookupResultForLookupResults_usingPlaces_completion_queue___block_invoke(uint64_t a1, id *a2, uint64_t a3)
{
  -[GEOPDSpatialEventLookupResult events](a2);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (![v10 count]
    || ([*(id *)(a1 + 32) eventsForEventLookupResponses:v10 usingIdentifierToEventMap:*(void *)(a1 + 40)], id v5 = objc_claimAutoreleasedReturnValue(), (v6 = v5) == 0))
  {
    id v5 = 0;
    id v6 = *(void **)(a1 + 48);
  }
  id v7 = v6;

  int v8 = *(void **)(a1 + 56);
  v9 = [*(id *)(*(void *)(a1 + 32) + 344) objectAtIndexedSubscript:a3];
  [v8 setObject:v7 forKey:v9];
}

uint64_t __82___GEOMapServiceSpatialEventLookupTicket_callCompletion_onQueue_withResult_error___block_invoke(uint64_t a1)
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