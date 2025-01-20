@interface HMDLogEventAnalyzer
+ (id)logCategory;
+ (id)managedEventCounterRequestGroups;
- (void)didReceiveEventFromDispatcher:(id)a3;
@end

@implementation HMDLogEventAnalyzer

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_126117 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_126117, &__block_literal_global_126118);
  }
  v2 = (void *)logCategory__hmf_once_v1_126119;
  return v2;
}

void __34__HMDLogEventAnalyzer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_126119;
  logCategory__hmf_once_v1_126119 = v0;
}

+ (id)managedEventCounterRequestGroups
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

@end