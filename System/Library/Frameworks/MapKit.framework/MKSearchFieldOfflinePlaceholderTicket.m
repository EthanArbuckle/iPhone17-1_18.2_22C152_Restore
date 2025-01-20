@interface MKSearchFieldOfflinePlaceholderTicket
@end

@implementation MKSearchFieldOfflinePlaceholderTicket

void __76___MKSearchFieldOfflinePlaceholderTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = MEMORY[0x1E4F14428];
  id v7 = MEMORY[0x1E4F14428];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76___MKSearchFieldOfflinePlaceholderTicket_submitWithHandler_networkActivity___block_invoke_2;
  block[3] = &unk_1E54BB010;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = a2;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __76___MKSearchFieldOfflinePlaceholderTicket_submitWithHandler_networkActivity___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __76___MKSearchFieldOfflinePlaceholderTicket_submitWithHandler_networkActivity___block_invoke_3(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __76___MKSearchFieldOfflinePlaceholderTicket_submitWithHandler_networkActivity___block_invoke_4;
    v4[3] = &unk_1E54BAF98;
    id v5 = v2;
    char v6 = a2;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

uint64_t __76___MKSearchFieldOfflinePlaceholderTicket_submitWithHandler_networkActivity___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

@end