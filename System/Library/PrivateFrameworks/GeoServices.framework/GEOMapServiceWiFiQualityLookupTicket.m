@interface GEOMapServiceWiFiQualityLookupTicket
@end

@implementation GEOMapServiceWiFiQualityLookupTicket

void __91___GEOMapServiceWiFiQualityLookupTicket_submitNetworkSearchWithCompletionQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    v7 = *(id *)(a1 + 40);
    if (!v7)
    {
      v7 = dispatch_get_global_queue(21, 0);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91___GEOMapServiceWiFiQualityLookupTicket_submitNetworkSearchWithCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_1E53D95B8;
    id v11 = *(id *)(a1 + 48);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

void __91___GEOMapServiceWiFiQualityLookupTicket_submitNetworkSearchWithCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) networkResults];
  v3 = (void *)[v4 copy];
  (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

void __92___GEOMapServiceWiFiQualityLookupTicket_submitLocationSearchWithCompletionQueue_completion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-6 reason:@"unsupported"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86___GEOMapServiceWiFiQualityLookupTicket_submitTileLoadWithCompletionQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = [*(id *)(*(void *)(a1 + 32) + 56) isEqualToString:v10];
  if (v11) {
    v14 = [[GEOWiFiQualitySearchResultTile alloc] initWithData:v11];
  }
  else {
    v14 = 0;
  }
  v15 = *(id *)(a1 + 40);
  if (!v15)
  {
    v15 = dispatch_get_global_queue(21, 0);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __86___GEOMapServiceWiFiQualityLookupTicket_submitTileLoadWithCompletionQueue_completion___block_invoke_2;
  v21[3] = &unk_1E53DEC18;
  id v16 = *(id *)(a1 + 48);
  id v25 = v12;
  id v26 = v16;
  char v27 = v13;
  id v22 = v9;
  v23 = v14;
  id v24 = v10;
  id v17 = v12;
  id v18 = v10;
  v19 = v14;
  id v20 = v9;
  dispatch_async(v15, v21);
}

uint64_t __86___GEOMapServiceWiFiQualityLookupTicket_submitTileLoadWithCompletionQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

@end