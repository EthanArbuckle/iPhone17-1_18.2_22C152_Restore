@interface MKPublisherViewTicket
@end

@implementation MKPublisherViewTicket

void __74___MKPublisherViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  v14 = *(void **)(a1 + 40);
  if (v14)
  {
    v15 = *(NSObject **)(a1 + 32);
    if (v12)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74___MKPublisherViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2;
      block[3] = &unk_1E54B8360;
      v16 = &v31;
      id v17 = v14;
      id v31 = v17;
      v18 = &v30;
      id v19 = v13;
      id v30 = v19;
      if (v15) {
        dispatch_async(v15, block);
      }
      else {
        (*((void (**)(id, void, void, void, id))v17 + 2))(v17, 0, 0, 0, v19);
      }
    }
    else
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __74___MKPublisherViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3;
      v24[3] = &unk_1E54BAED0;
      v16 = (id *)&v28;
      v20 = v14;
      v28 = v20;
      v18 = &v25;
      id v21 = v9;
      id v25 = v21;
      id v22 = v10;
      id v26 = v22;
      id v23 = v11;
      id v27 = v23;
      if (v15) {
        dispatch_async(v15, v24);
      }
      else {
        v20[2](v20, v21, v22, v23, 0);
      }
    }
  }
}

uint64_t __74___MKPublisherViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32));
}

uint64_t __74___MKPublisherViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], 0);
}

@end