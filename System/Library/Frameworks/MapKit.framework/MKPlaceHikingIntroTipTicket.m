@interface MKPlaceHikingIntroTipTicket
@end

@implementation MKPlaceHikingIntroTipTicket

void __66___MKPlaceHikingIntroTipTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    v11 = MEMORY[0x1E4F14428];
    id v12 = MEMORY[0x1E4F14428];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66___MKPlaceHikingIntroTipTicket_submitWithHandler_networkActivity___block_invoke_2;
    block[3] = &unk_1E54B8360;
    v10 = &v18;
    id v18 = *(id *)(a1 + 32);
    id v17 = v6;
    id v13 = a2;
    dispatch_async(v11, block);

    v9 = v17;
  }
  else
  {
    v19[0] = a2;
    v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = a2;
    v9 = [v7 arrayWithObjects:v19 count:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66___MKPlaceHikingIntroTipTicket_submitWithHandler_networkActivity___block_invoke_3;
    v14[3] = &unk_1E54B83D0;
    v10 = &v15;
    id v15 = *(id *)(a1 + 32);
    _mapItemsForGeoMapItemsWithHandler(v9, v14);
  }
}

uint64_t __66___MKPlaceHikingIntroTipTicket_submitWithHandler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __66___MKPlaceHikingIntroTipTicket_submitWithHandler_networkActivity___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = MEMORY[0x1E4F14428];
  id v8 = MEMORY[0x1E4F14428];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66___MKPlaceHikingIntroTipTicket_submitWithHandler_networkActivity___block_invoke_4;
  block[3] = &unk_1E54B83F8;
  id v9 = *(id *)(a1 + 32);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

void __66___MKPlaceHikingIntroTipTicket_submitWithHandler_networkActivity___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) firstObject];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

@end