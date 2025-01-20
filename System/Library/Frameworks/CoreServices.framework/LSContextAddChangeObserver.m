@interface LSContextAddChangeObserver
@end

@implementation LSContextAddChangeObserver

uint64_t ___LSContextAddChangeObserver_block_invoke_3(uint64_t a1)
{
  v2 = (void *)gChangeObservers;
  if (!gChangeObservers)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4 = (void *)gChangeObservers;
    gChangeObservers = (uint64_t)v3;

    v2 = (void *)gChangeObservers;
  }
  uint64_t v5 = *(void *)(a1 + 32);

  return [v2 addObject:v5];
}

void ___LSContextAddChangeObserver_block_invoke(uint64_t a1)
{
  v2 = (atomic_uchar *)(*(void *)(a1 + 32) + 24);
  id v3 = _LSGetDispatchTokenQueue();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___LSContextAddChangeObserver_block_invoke_2;
  v4[3] = &unk_1E522DCE8;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  _LSDispatchCoalescedAfterDelay(v2, v3, v4, 0.25);
}

void ___LSContextAddChangeObserver_block_invoke_2(uint64_t a1)
{
  v2 = (void (**)(void))MEMORY[0x18530F950](*(void *)(*(void *)(a1 + 32) + 8));
  if (v2)
  {
    id v8 = 0;
    id v5 = 0;
    id v6 = 0;
    char v7 = 0;
    if (LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v5, *(_LSDServiceDomain **)(a1 + 40), 0))
    {
      v2[2](v2);
    }
    if (v5 && v7) {
      _LSContextDestroy(v5);
    }
    id v3 = v6;
    id v5 = 0;
    id v6 = 0;

    char v7 = 0;
    id v4 = v8;
    id v8 = 0;
  }
}

@end