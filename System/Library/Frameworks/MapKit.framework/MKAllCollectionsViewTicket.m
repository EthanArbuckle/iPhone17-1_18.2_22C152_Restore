@interface MKAllCollectionsViewTicket
@end

@implementation MKAllCollectionsViewTicket

void __79___MKAllCollectionsViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  v11 = *(void **)(a1 + 40);
  if (v11)
  {
    v12 = *(NSObject **)(a1 + 32);
    if (v9)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __79___MKAllCollectionsViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2;
      block[3] = &unk_1E54B8360;
      v13 = &v26;
      id v14 = v11;
      id v26 = v14;
      v15 = &v25;
      id v16 = v10;
      id v25 = v16;
      if (v12) {
        dispatch_async(v12, block);
      }
      else {
        (*((void (**)(id, void, void, id))v14 + 2))(v14, 0, 0, v16);
      }
    }
    else
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __79___MKAllCollectionsViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3;
      v20[3] = &unk_1E54B83F8;
      v13 = (id *)&v23;
      v17 = v11;
      v23 = v17;
      v15 = &v21;
      id v18 = v7;
      id v21 = v18;
      id v19 = v8;
      id v22 = v19;
      if (v12) {
        dispatch_async(v12, v20);
      }
      else {
        v17[2](v17, v18, v19, 0);
      }
    }
  }
}

uint64_t __79___MKAllCollectionsViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

uint64_t __79___MKAllCollectionsViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

@end