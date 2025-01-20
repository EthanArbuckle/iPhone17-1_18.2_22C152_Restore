@interface MPStoreSocialTransientState
@end

@implementation MPStoreSocialTransientState

void __44___MPStoreSocialTransientState__endIfNeeded__block_invoke(void *a1)
{
  uint64_t v2 = MEMORY[0x19971E0F0](*(void *)(a1[4] + 64));
  uint64_t v3 = *(void *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[4];
  if (*(void *)(v5 + 40)) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = *(void *)(v5 + 48) == 0;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v6;
}

uint64_t __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

void __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 64));
    v8 = WeakRetained[3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_3;
    block[3] = &unk_1E57F91B0;
    char v24 = a2;
    id v9 = v7;
    id v20 = v9;
    v21 = WeakRetained;
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = v10;
    dispatch_barrier_async(v8, block);
    v11 = *(void **)(a1 + 40);
    if (v11)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_5;
      v14[3] = &unk_1E57F91D8;
      id v12 = v11;
      char v18 = a2;
      uint64_t v13 = *(void *)(a1 + 72);
      id v16 = v12;
      uint64_t v17 = v13;
      id v15 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v14);
    }
  }
}

void __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_6(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (WeakRetained)
  {
    id v5 = WeakRetained[3];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    v8 = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_7;
    id v9 = &unk_1E57F9F98;
    id v10 = v3;
    v11 = WeakRetained;
    dispatch_barrier_async(v5, &v6);
    objc_msgSend(WeakRetained, "_endIfNeeded", v6, v7, v8, v9);
  }
}

void __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_8(uint64_t a1)
{
}

void __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_9(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(a1 + 48);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_10;
  block[3] = &unk_1E57F9EA8;
  void block[4] = v2;
  dispatch_async(v3, block);
}

void __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_10(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"_MPStoreSocialTransientStateDidChangeNotification" object:*(void *)(a1 + 32)];
}

void __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_7(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (*(void **)(v2 + 48) == v1)
    {
      *(void *)(v2 + 48) = 0;
    }
  }
}

void __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2)
    {
      uint64_t v3 = *(void *)(a1 + 40);
      if (*(void *)(v3 + 48) == v2) {
        *(void *)(v3 + 16) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      }
    }
  }
  v1 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_4;
  block[3] = &unk_1E57F9EA8;
  void block[4] = *(void *)(a1 + 48);
  dispatch_async(v1, block);
}

uint64_t __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v3 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v3 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, v3, *(void *)(a1 + 32));
}

void __93___MPStoreSocialTransientState_newOperationForTransientFollowPendingRequestState_completion___block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"_MPStoreSocialTransientStateDidChangeNotification" object:*(void *)(a1 + 32)];
}

uint64_t __57___MPStoreSocialTransientState_followPendingRequestState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

uint64_t __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8);
  return result;
}

void __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 64));
    v8 = WeakRetained[3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_3;
    block[3] = &unk_1E57F91B0;
    char v24 = a2;
    id v9 = v7;
    id v20 = v9;
    v21 = WeakRetained;
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = v10;
    dispatch_barrier_async(v8, block);
    v11 = *(void **)(a1 + 40);
    if (v11)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_5;
      v14[3] = &unk_1E57F91D8;
      id v12 = v11;
      char v18 = a2;
      uint64_t v13 = *(void *)(a1 + 72);
      id v16 = v12;
      uint64_t v17 = v13;
      id v15 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v14);
    }
  }
}

void __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_6(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (WeakRetained)
  {
    id v5 = WeakRetained[3];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    v8 = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_7;
    id v9 = &unk_1E57F9F98;
    id v10 = v3;
    v11 = WeakRetained;
    dispatch_barrier_async(v5, &v6);
    objc_msgSend(WeakRetained, "_endIfNeeded", v6, v7, v8, v9);
  }
}

void __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_8(uint64_t a1)
{
}

void __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_9(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = *(void *)(a1 + 48);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_10;
  block[3] = &unk_1E57F9EA8;
  void block[4] = v2;
  dispatch_async(v3, block);
}

void __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_10(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"_MPStoreSocialTransientStateDidChangeNotification" object:*(void *)(a1 + 32)];
}

void __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_7(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (*(void **)(v2 + 40) == v1)
    {
      *(void *)(v2 + 40) = 0;
    }
  }
}

void __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2)
    {
      uint64_t v3 = *(void *)(a1 + 40);
      if (*(void *)(v3 + 40) == v2) {
        *(void *)(v3 + 8) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      }
    }
  }
  v1 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_4;
  block[3] = &unk_1E57F9EA8;
  void block[4] = *(void *)(a1 + 48);
  dispatch_async(v1, block);
}

uint64_t __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v3 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v3 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, v3, *(void *)(a1 + 32));
}

void __79___MPStoreSocialTransientState_newOperationForTransientFollowState_completion___block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"_MPStoreSocialTransientStateDidChangeNotification" object:*(void *)(a1 + 32)];
}

uint64_t __43___MPStoreSocialTransientState_followState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8);
  return result;
}

@end