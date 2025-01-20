@interface MKPlaceEVChargerTicket
@end

@implementation MKPlaceEVChargerTicket

void __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_2;
    block[3] = &unk_1E54B8360;
    v7 = &v14;
    id v14 = *(id *)(a1 + 32);
    id v13 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else if ([v5 count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_4;
    v8[3] = &unk_1E54B83D0;
    v7 = &v9;
    id v9 = *(id *)(a1 + 32);
    _mapItemsForGeoMapItemsWithHandler(v5, v8);
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_3;
    v10[3] = &unk_1E54B82E8;
    v7 = &v11;
    id v11 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

uint64_t __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = MEMORY[0x1E4F14428];
  id v8 = MEMORY[0x1E4F14428];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_5;
  block[3] = &unk_1E54B83F8;
  id v9 = *(id *)(a1 + 32);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __75___MKPlaceEVChargerTicket_submitRefreshRequestWithHandler_networkActivity___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end