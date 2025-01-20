@interface HMFLocationAuthorizationRequest
@end

@implementation HMFLocationAuthorizationRequest

uint64_t __48____HMFLocationAuthorizationRequest_logCategory__block_invoke()
{
  qword_1EB4EEAA0 = HMFCreateOSLogHandle(@"Location.Authorization.Request", @"com.apple.HMFoundation");
  return MEMORY[0x1F41817F8]();
}

uint64_t __84____HMFLocationAuthorizationRequest_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t result)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(result + 32) + 336))
  {
    uint64_t v1 = result;
    int v2 = [*(id *)(result + 40) status];
    v3 = (void *)MEMORY[0x19F3A87A0]();
    id v4 = *(id *)(v1 + 32);
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = HMFGetLogIdentifier(v4);
      int v7 = 138543618;
      v8 = v6;
      __int16 v9 = 1024;
      int v10 = v2;
      _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Received notification of status: %d", (uint8_t *)&v7, 0x12u);
    }
    return __HMFLocationAuthorizationHandleAuthorizationStatus(*(void **)(v1 + 32), v2);
  }
  return result;
}

@end