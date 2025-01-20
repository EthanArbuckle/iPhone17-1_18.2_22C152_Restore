@interface VNCIContextsHandler
- (VNCIContext)waitAndGetAvailableContextReturnError:(uint64_t)a1;
- (id)initWithMaxCount:(void *)a3 metalDevice:;
- (void)releaseCachedResources;
@end

@implementation VNCIContextsHandler

- (id)initWithMaxCount:(void *)a3 metalDevice:
{
  id v6 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)VNCIContextsHandler;
    v7 = (id *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong(v7 + 1, a3);
      dispatch_semaphore_t v8 = dispatch_semaphore_create(a2);
      id v9 = a1[2];
      a1[2] = v8;

      *((_DWORD *)a1 + 6) = 0;
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v11 = a1[4];
      a1[4] = v10;

      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v13 = a1[5];
      a1[5] = v12;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inUseContexts, 0);
  objc_storeStrong((id *)&self->_freeContexts, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);

  objc_storeStrong((id *)&self->_metalDevice, 0);
}

- (void)releaseCachedResources
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    [*(id *)(a1 + 32) removeAllObjects];
    os_unfair_lock_unlock(v2);
  }
}

- (VNCIContext)waitAndGetAvailableContextReturnError:(uint64_t)a1
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 16), 0xFFFFFFFFFFFFFFFFLL);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    if ([*(id *)(a1 + 32) count])
    {
      v2 = [*(id *)(a1 + 32) lastObject];
      [*(id *)(a1 + 32) removeLastObject];
    }
    else
    {
      uint64_t v3 = *(void *)(a1 + 8);
      v4 = (void *)MEMORY[0x1E4F1E018];
      uint64_t v5 = *MEMORY[0x1E4F1E1E0];
      if (v3)
      {
        v17[0] = MEMORY[0x1E4F1CC28];
        uint64_t v6 = *MEMORY[0x1E4F1E208];
        v16[0] = v5;
        v16[1] = v6;
        v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"VNCIContextsHandler_MetalRegistryID_%llu", objc_msgSend(*(id *)(a1 + 8), "registryID"));
        v17[1] = v7;
        dispatch_semaphore_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
        id v9 = [v4 contextWithMTLDevice:v3 options:v8];
      }
      else
      {
        uint64_t v10 = *MEMORY[0x1E4F1E238];
        v18[0] = *MEMORY[0x1E4F1E1E0];
        v18[1] = v10;
        v19[0] = MEMORY[0x1E4F1CC28];
        v19[1] = MEMORY[0x1E4F1CC38];
        v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
        id v9 = [v4 contextWithOptions:v7];
      }

      v2 = [VNCIContext alloc];
      id v11 = (id)a1;
      id v12 = v9;
      if (v2)
      {
        v15.receiver = v2;
        v15.super_class = (Class)VNCIContext;
        id v13 = (VNCIContext *)objc_msgSendSuper2(&v15, sel_init);
        v2 = v13;
        if (v13)
        {
          objc_storeWeak((id *)&v13->_handler, v11);
          objc_storeStrong((id *)&v2->_ciContext, v9);
        }
      }
    }
    [*(id *)(a1 + 40) addObject:v2];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end