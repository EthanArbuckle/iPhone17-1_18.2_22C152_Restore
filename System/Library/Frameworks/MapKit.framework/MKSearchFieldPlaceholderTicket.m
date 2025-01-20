@interface MKSearchFieldPlaceholderTicket
@end

@implementation MKSearchFieldPlaceholderTicket

uint64_t __69___MKSearchFieldPlaceholderTicket_submitWithHandler_networkActivity___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __69___MKSearchFieldPlaceholderTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = MEMORY[0x1E4F14428];
  id v8 = MEMORY[0x1E4F14428];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69___MKSearchFieldPlaceholderTicket_submitWithHandler_networkActivity___block_invoke_2;
  block[3] = &unk_1E54B83F8;
  id v9 = *(id *)(a1 + 32);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

void __69___MKSearchFieldPlaceholderTicket_submitWithHandler_networkActivity___block_invoke_3(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __69___MKSearchFieldPlaceholderTicket_submitWithHandler_networkActivity___block_invoke_4;
    v4[3] = &unk_1E54BAF98;
    id v5 = v2;
    char v6 = a2;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

uint64_t __69___MKSearchFieldPlaceholderTicket_submitWithHandler_networkActivity___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

@end