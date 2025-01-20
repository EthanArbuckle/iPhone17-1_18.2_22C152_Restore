@interface HMFLocationManagerOperationStartMonitoring
@end

@implementation HMFLocationManagerOperationStartMonitoring

void ____HMFLocationManagerOperationStartMonitoring_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (CoreLocationLibraryCore_0())
  {
    id v11 = [*(id *)(a1 + 32) authorization];
    uint64_t v2 = *(void *)(a1 + 32);
    v3 = NSStringFromSelector(sel_isMonitoring);
    [v11 addObserver:v2 forKeyPath:v3 options:5 context:HMFLocationManagerOperationMonitoringContext];

    v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 312);
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(*(void *)(a1 + 32) + 316) = 1;
    os_unfair_lock_unlock(v4);
    [v11 registerObserver:*(void *)(a1 + 32)];
  }
  else
  {
    v5 = (void *)MEMORY[0x19F3A87A0]();
    id v6 = *(id *)(a1 + 32);
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier(v6);
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_ERROR, "%{public}@Missing internal location manager", buf, 0xCu);
    }
    v9 = *(void **)(a1 + 32);
    v10 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11 reason:@"Unexpected internal state."];
    [v9 cancelWithError:v10];
  }
}

@end