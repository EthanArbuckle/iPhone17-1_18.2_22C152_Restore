@interface __HMFLocationAuthorizationMarkOperation
+ (id)logCategory;
- (void)main;
@end

@implementation __HMFLocationAuthorizationMarkOperation

+ (id)logCategory
{
  if (_MergedGlobals_51 != -1) {
    dispatch_once(&_MergedGlobals_51, &__block_literal_global);
  }
  v2 = (void *)qword_1EB4EEC60;
  return v2;
}

- (void)main
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(__HMFLocationManagerOperation *)self manager];
  v4 = (void *)MEMORY[0x19F3A87A0]();
  v5 = self;
  v6 = HMFGetOSLogHandle();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier(v5);
      int v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_INFO, "%{public}@Marking as having received location", (uint8_t *)&v11, 0xCu);
    }
    [v3 markAsHavingReceivedLocation];
    [(HMFOperation *)v5 finish];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier(v5);
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_ERROR, "%{public}@Missing internal location manager", (uint8_t *)&v11, 0xCu);
    }
    v10 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11 reason:@"Unexpected internal state."];
    [(HMFOperation *)v5 cancelWithError:v10];
  }
}

@end