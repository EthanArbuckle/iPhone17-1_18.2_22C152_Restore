@interface HMContext
@end

@implementation HMContext

void __70___HMContext_Convenience__sendMessage_target_payload_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70___HMContext_Convenience__sendMessage_target_payload_responseHandler___block_invoke_2;
  block[3] = &unk_1E5945138;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __70___HMContext_Convenience__sendMessage_target_payload_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) queue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __70___HMContext_Convenience__sendMessage_target_payload_responseHandler___block_invoke_4;
    v5[3] = &unk_1E59454E8;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __70___HMContext_Convenience__sendMessage_target_payload_responseHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __70___HMContext_Convenience__sendMessage_target_payload_responseHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end