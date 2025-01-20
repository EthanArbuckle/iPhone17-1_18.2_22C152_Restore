@interface GEOTerritoryLookupRequestTicket
@end

@implementation GEOTerritoryLookupRequestTicket

void __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 352) mutableCopy];
  v3 = [*(id *)(*(void *)(a1 + 32) + 296) placeRequestParameters];
  v4 = -[GEOPDPlaceRequestParameters territoryLookupParameters](v3);
  -[GEOPDTerritoryLookupParameters setLocations:]((uint64_t)v4, v2);

  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = v5[37];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2;
  v8[3] = &unk_1E53DA278;
  id v9 = *(id *)(a1 + 48);
  [v5 _processRequest:v7 auditToken:v6 timeout:v8 withHandler:0 refinedHandler:*(void *)(a1 + 56) networkActivity:0.0];
}

uint64_t __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_672(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  [v9 coordinate];
  if (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:"))
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 344), "count"));
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    v8 = [NSNumber numberWithUnsignedInteger:a3];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v8 forKeyedSubscript:v9];
  }
}

void __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2_677(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 unsignedIntegerValue];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 344) objectAtIndexedSubscript:v4];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  uint64_t v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_3;
  v17[3] = &unk_1E53DE8C0;
  id v18 = *(id *)(a1 + 64);
  id v19 = *(id *)(a1 + 72);
  uint64_t v21 = v4;
  id v20 = *(id *)(a1 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_5;
  v15[3] = &unk_1E53DA028;
  id v16 = *(id *)(a1 + 80);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_6;
  v10[3] = &unk_1E53DE910;
  id v11 = *(id *)(a1 + 64);
  id v12 = v5;
  long long v14 = *(_OWORD *)(a1 + 88);
  id v13 = *(id *)(a1 + 40);
  id v8 = v5;
  global_queue = (void *)geo_get_global_queue();
  [v6 shiftLatLng:v8 accuracy:v7 auditToken:v17 withCompletionHandler:v15 mustGoToNetworkCallback:v10 errorHandler:global_queue callbackQueue:0.0];
}

void __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_3(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  geo_isolate_sync_data();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_4(uint64_t a1)
{
  id v2 = -[GEOLatLngE7 initWithCoordinate:]([GEOLatLngE7 alloc], "initWithCoordinate:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  [*(id *)(a1 + 32) setObject:v2 atIndexedSubscript:*(void *)(a1 + 40)];
}

uint64_t __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = v3;
  id v4 = v3;
  geo_isolate_sync_data();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_7(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (qword_1E9117F08 != -1) {
    dispatch_once(&qword_1E9117F08, &__block_literal_global_1193);
  }
  id v2 = qword_1E9117F00;
  if (os_log_type_enabled((os_log_t)qword_1E9117F00, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = a1[4];
    int v9 = 138477827;
    uint64_t v10 = v3;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_ERROR, "Unable to shift coordinate: %{private}@ will not resolve territory information.", (uint8_t *)&v9, 0xCu);
  }
  id v4 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (!v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1[7] + 8) + 40), "count"));
    uint64_t v6 = *(void *)(a1[6] + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v4 = *(void **)(*(void *)(a1[6] + 8) + 40);
  }
  return [v4 addObject:a1[5]];
}

void __89___GEOTerritoryLookupRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_679(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
  {
    uint64_t v2 = *(void *)(a1 + 48);
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) firstObject];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v7);
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 40) copy];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 352);
    *(void *)(v4 + 352) = v3;

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v6();
  }
}

@end