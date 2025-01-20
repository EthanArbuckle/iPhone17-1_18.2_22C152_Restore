@interface HDBackgroundTaskClient
- (void)deliverTask:(void *)a3 taskName:(void *)a4 onQueue:;
@end

@implementation HDBackgroundTaskClient

- (void)deliverTask:(void *)a3 taskName:(void *)a4 onQueue:
{
  id v7 = a2;
  id v8 = a3;
  v9 = a4;
  if (a1 && *(void *)(a1 + 8))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__HDBackgroundTaskClient_deliverTask_taskName_onQueue___block_invoke;
    block[3] = &unk_1E62F30F8;
    block[4] = a1;
    id v11 = v8;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

uint64_t __55__HDBackgroundTaskClient_deliverTask_taskName_onQueue___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1[4] + 8) + 16))(*(void *)(a1[4] + 8), a1[5], a1[6]);
}

- (void).cxx_destruct
{
}

@end