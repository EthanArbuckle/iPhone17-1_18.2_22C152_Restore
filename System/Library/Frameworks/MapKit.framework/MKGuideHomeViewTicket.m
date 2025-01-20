@interface MKGuideHomeViewTicket
@end

@implementation MKGuideHomeViewTicket

void __74___MKGuideHomeViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74___MKGuideHomeViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2;
    block[3] = &unk_1E54B83F8;
    id v9 = v7;
    id v15 = v9;
    id v10 = v5;
    id v13 = v10;
    id v11 = v6;
    id v14 = v11;
    if (v8) {
      dispatch_async(v8, block);
    }
    else {
      (*((void (**)(id, id, id))v9 + 2))(v9, v10, v11);
    }
  }
}

uint64_t __74___MKGuideHomeViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end