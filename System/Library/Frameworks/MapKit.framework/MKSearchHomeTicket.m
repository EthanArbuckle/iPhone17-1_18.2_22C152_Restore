@interface MKSearchHomeTicket
@end

@implementation MKSearchHomeTicket

void __71___MKSearchHomeTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(a1 + 32);
    if (v6)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __71___MKSearchHomeTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2;
      v20[3] = &unk_1E54B8360;
      v10 = (id *)&v22;
      v11 = v8;
      v22 = v11;
      v12 = &v21;
      id v13 = v7;
      id v21 = v13;
      if (!v9)
      {
        v11[2](v11, 0, v13);
        goto LABEL_10;
      }
      v14 = v20;
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __71___MKSearchHomeTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3;
      v17[3] = &unk_1E54B8360;
      v10 = (id *)&v19;
      v15 = v8;
      v19 = v15;
      v12 = &v18;
      id v16 = v5;
      id v18 = v16;
      if (!v9)
      {
        v15[2](v15, v16, 0);
        goto LABEL_10;
      }
      v14 = v17;
    }
    dispatch_async(v9, v14);
LABEL_10:
  }
}

uint64_t __71___MKSearchHomeTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __71___MKSearchHomeTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

@end