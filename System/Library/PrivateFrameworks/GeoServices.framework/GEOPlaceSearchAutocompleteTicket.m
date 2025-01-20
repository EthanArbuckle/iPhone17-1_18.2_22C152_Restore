@interface GEOPlaceSearchAutocompleteTicket
@end

@implementation GEOPlaceSearchAutocompleteTicket

void __96___GEOPlaceSearchAutocompleteTicket_submitWithAutoCompletionHandler_auditToken_networkActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __96___GEOPlaceSearchAutocompleteTicket_submitWithAutoCompletionHandler_auditToken_networkActivity___block_invoke_2;
    v16[3] = &unk_1E53DEAE0;
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    id v17 = v7;
    uint64_t v18 = v8;
    id v19 = v9;
    v10 = (void (**)(void, void))MEMORY[0x18C120660](v16);
    v11 = [v7 resultsWithResultType:1];
    if ([v11 count])
    {
      uint64_t v12 = [v7 requestType];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __96___GEOPlaceSearchAutocompleteTicket_submitWithAutoCompletionHandler_auditToken_networkActivity___block_invoke_3;
      v13[3] = &unk_1E53DEB08;
      id v14 = *(id *)(a1 + 40);
      v15 = v10;
      _attributedGeoMapItemsForPlaceDatasWithHandler(v12, v11, 0, 0, 0, 0, v13);
    }
    else
    {
      v10[2](v10, 0);
    }
  }
}

void __96___GEOPlaceSearchAutocompleteTicket_submitWithAutoCompletionHandler_auditToken_networkActivity___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = [[_GEOPlaceSearchCompletion alloc] initWithResponse:a1[4] traits:*(void *)(a1[5] + 8) sessionData:*(void *)(a1[5] + 72) mapItems:v3];

  if (v5)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v4 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:0];
    (*(void (**)(void))(a1[6] + 16))();
  }
}

uint64_t __96___GEOPlaceSearchAutocompleteTicket_submitWithAutoCompletionHandler_auditToken_networkActivity___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end