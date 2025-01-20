@interface VNCIContextManager
- (VNCIContextManager)init;
- (id)waitAndGetAvailableContextForCPUAndReturnError:(uint64_t)a1;
- (id)waitAndGetAvailableContextForComputeDevice:(void *)a3 error:;
- (id)waitAndGetAvailableContextForMetalDevice:(uint64_t)a1 error:(void *)a2;
- (id)waitAndGetAvailableContextFromOptions:(void *)a3 error:;
- (uint64_t)performBlock:(void *)a3 usingAvailableContextForComputeDevice:(void *)a4 error:;
- (void)releaseContext:(uint64_t)a1;
@end

@implementation VNCIContextManager

- (VNCIContextManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)VNCIContextManager;
  v2 = [(VNCIContextManager *)&v10 init];
  if (!v2) {
    return 0;
  }
  v11.receiver = v2;
  v11.super_class = (Class)VNCIContextManager;
  v3 = [(VNCIContextManager *)&v11 init];
  v4 = v3;
  if (v3)
  {
    v3->_maxContextsCount = 4;
    v5 = -[VNCIContextsHandler initWithMaxCount:metalDevice:]((id *)[VNCIContextsHandler alloc], v3->_maxContextsCount, 0);
    cpuContextsHandler = v4->_cpuContextsHandler;
    v4->_cpuContextsHandler = (VNCIContextsHandler *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    gpuContextsHandlers = v4->_gpuContextsHandlers;
    v4->_gpuContextsHandlers = v7;

    v4->_gpuHandlersLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gpuContextsHandlers, 0);

  objc_storeStrong((id *)&self->_cpuContextsHandler, 0);
}

void __44__VNCIContextManager_releaseCachedResources__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

- (id)waitAndGetAvailableContextForComputeDevice:(void *)a3 error:
{
  id v5 = a2;
  if (v5)
  {
    if (+[VNComputeDeviceUtilities isCPUComputeDevice:v5])
    {
      v6 = -[VNCIContextManager waitAndGetAvailableContextForCPUAndReturnError:](a1);
    }
    else
    {
      v7 = +[VNComputeDeviceUtilities metalDeviceForComputeDevice:v5];
      if (!v7)
      {
        v8 = +[VNProcessingDevice defaultMetalDevice];
        v7 = [v8 metalDevice];
      }
      v6 = -[VNCIContextManager waitAndGetAvailableContextForMetalDevice:error:](a1, v7);
    }
  }
  else if (a3)
  {
    +[VNError errorForInvalidArgument:0 named:@"computeDevice"];
    v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)waitAndGetAvailableContextForCPUAndReturnError:(uint64_t)a1
{
  v1 = -[VNCIContextsHandler waitAndGetAvailableContextReturnError:](*(void *)(a1 + 8));

  return v1;
}

- (id)waitAndGetAvailableContextForMetalDevice:(uint64_t)a1 error:(void *)a2
{
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v3, "registryID"));
  id v5 = [*(id *)(a1 + 16) objectForKey:v4];
  if (!v5)
  {
    id v5 = -[VNCIContextsHandler initWithMaxCount:metalDevice:]((id *)[VNCIContextsHandler alloc], *(void *)(a1 + 32), v3);
    objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:");
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  v6 = -[VNCIContextsHandler waitAndGetAvailableContextReturnError:]((uint64_t)v5);

  return v6;
}

- (id)waitAndGetAvailableContextFromOptions:(void *)a3 error:
{
  id v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = [v5 objectForKeyedSubscript:@"VNDetectorOption_ComputeStageDeviceAssignments"];
    v8 = [v7 objectForKeyedSubscript:@"VNComputeStageMain"];

    if (v8)
    {
      a1 = -[VNCIContextManager waitAndGetAvailableContextForComputeDevice:error:]((uint64_t)a1, v8, a3);
    }
    else
    {
      v9 = +[VNProcessingDevice defaultMetalDevice];
      objc_super v10 = [v9 metalDevice];

      if (v10) {
        -[VNCIContextManager waitAndGetAvailableContextForMetalDevice:error:]((uint64_t)a1, v10);
      }
      else {
      a1 = -[VNCIContextManager waitAndGetAvailableContextForCPUAndReturnError:]((uint64_t)a1);
      }
    }
  }

  return a1;
}

- (void)releaseContext:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v7 = v3;
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained(v3 + 2);
      id v5 = v7;
      if (WeakRetained)
      {
        v6 = v5;
        os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 6);
        if ([*((id *)WeakRetained + 5) containsObject:v6])
        {
          [*((id *)WeakRetained + 4) addObject:v6];
          [*((id *)WeakRetained + 5) removeObject:v6];
          os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 6);
          dispatch_semaphore_signal(*((dispatch_semaphore_t *)WeakRetained + 2));
        }
        else
        {
          os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 6);
        }
      }
    }
    else
    {
      id WeakRetained = 0;
    }

    id v3 = v7;
  }
}

- (uint64_t)performBlock:(void *)a3 usingAvailableContextForComputeDevice:(void *)a4 error:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    v9 = -[VNCIContextManager waitAndGetAvailableContextForComputeDevice:error:](a1, v8, a4);
    if (v9)
    {
      objc_super v10 = (uint64_t (**)(id, id, void *))v7;
      id v11 = v9;
      uint64_t v12 = v10[2](v10, v11, a4);
      -[VNCIContextManager releaseContext:](a1, v11);
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

@end