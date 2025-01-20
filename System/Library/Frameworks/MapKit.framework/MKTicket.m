@interface MKTicket
@end

@implementation MKTicket

uint64_t __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a3);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke_2;
    block[3] = &unk_1E54B8360;
    v7 = *(NSObject **)(a1 + 40);
    v8 = (void (**)(id, void, id))*(id *)(a1 + 48);
    id v21 = v8;
    id v9 = v6;
    id v20 = v9;
    if (v7) {
      dispatch_async(v7, block);
    }
    else {
      v8[2](v8, 0, v9);
    }

    v11 = v21;
  }
  else if ([v5 count])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke_4;
    v14[3] = &unk_1E54BAF48;
    v10 = *(void **)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    id v15 = v10;
    id v16 = *(id *)(a1 + 48);
    _mapItemsForGeoMapItemsWithHandler(v5, v14);

    v11 = v15;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke_3;
    v17[3] = &unk_1E54B82E8;
    v12 = *(NSObject **)(a1 + 40);
    id v13 = *(id *)(a1 + 48);
    id v18 = v13;
    if (v12) {
      dispatch_async(v12, v17);
    }
    else {
      (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
    }
    v11 = v18;
  }
}

void __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a4);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke_2;
    block[3] = &unk_1E54B8360;
    id v23 = *(id *)(a1 + 40);
    id v22 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);

    v10 = v23;
  }
  else
  {
    uint64_t v11 = [v7 count];
    uint64_t v12 = [v8 count];
    if (v11 | v12)
    {
      if (v11) {
        id v13 = v7;
      }
      else {
        id v13 = v8;
      }
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke_4;
      v15[3] = &unk_1E54BAEF8;
      uint64_t v17 = v11;
      uint64_t v18 = v12;
      v14 = *(void **)(a1 + 40);
      v15[4] = *(void *)(a1 + 32);
      id v16 = v14;
      _mapItemsForGeoMapItemsWithHandler(v13, v15);
      v10 = v16;
    }
    else
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke_3;
      v19[3] = &unk_1E54B82E8;
      id v20 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x1E4F14428], v19);
      v10 = v20;
    }
  }
}

uint64_t __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

uint64_t __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!*(void *)(a1 + 48))
  {
    if (*(void *)(a1 + 56))
    {
      id v12 = v5;
      id v9 = v12;
      if (v12)
      {
        id v8 = 0;
        uint64_t v11 = 0;
        v10 = v12;
        if (![v12 count]) {
          goto LABEL_12;
        }
        goto LABEL_13;
      }
      id v8 = 0;
LABEL_12:
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v11 = (void *)[v13 initWithDomain:MKErrorDomain code:4 userInfo:0];

      id v8 = 0;
      v10 = 0;
      goto LABEL_13;
    }
    id v8 = 0;
LABEL_10:
    id v9 = 0;
    goto LABEL_12;
  }
  id v7 = v5;
  id v8 = v7;
  if (!v7) {
    goto LABEL_10;
  }
  id v9 = 0;
  v10 = 0;
  uint64_t v11 = 0;
  if (![v7 count]) {
    goto LABEL_12;
  }
LABEL_13:
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v8);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v10);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), v11);
  v14 = MEMORY[0x1E4F14428];
  id v15 = MEMORY[0x1E4F14428];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke_5;
  v20[3] = &unk_1E54BAED0;
  id v16 = *(id *)(a1 + 40);
  id v21 = v8;
  id v22 = v10;
  id v23 = v11;
  id v24 = v16;
  id v17 = v11;
  id v18 = v10;
  id v19 = v8;
  dispatch_async(v14, v20);
}

uint64_t __62___MKTicket_submitWithRefinedHandler_timeout_networkActivity___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke_5;
  block[3] = &unk_1E54B83F8;
  id v8 = *(NSObject **)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v13 = v6;
  uint64_t v14 = v10;
  id v15 = v9;
  id v11 = v6;
  if (v8) {
    dispatch_async(v8, block);
  }
  else {
    (*((void (**)(id, id, void))v9 + 2))(v9, v11, *(void *)(v10 + 32));
  }
}

uint64_t __61___MKTicket_submitWithHandler_timeout_queue_networkActivity___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], *(void *)(a1[5] + 32));
}

@end