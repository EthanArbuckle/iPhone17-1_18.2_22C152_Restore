@interface GEOPlaceEVChargerTicket
@end

@implementation GEOPlaceEVChargerTicket

void __76___GEOPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = [a2 resultsWithResultType:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76___GEOPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_2;
  v9[3] = &unk_1E53DECB8;
  id v7 = *(id *)(a1 + 32);
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  _attributedGeoMapItemsForPlaceDatasWithHandler(23, v6, 0, 0, 0, 0, v9);
}

void __76___GEOPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7 && [v7 count]) {
    v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else {
    v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

@end