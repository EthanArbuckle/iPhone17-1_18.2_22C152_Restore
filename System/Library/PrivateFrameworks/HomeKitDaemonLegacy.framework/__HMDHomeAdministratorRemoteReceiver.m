@interface __HMDHomeAdministratorRemoteReceiver
+ (id)logCategory;
- (void)__handleRemoteMessage:(id)a3;
- (void)registerForMessage:(id)a3 policies:(id)a4;
@end

@implementation __HMDHomeAdministratorRemoteReceiver

- (void)__handleRemoteMessage:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(__HMDHomeAdministratorReceiver *)self receiver];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      v10 = [v4 shortDescription];
      int v12 = 138543618;
      v13 = v9;
      __int16 v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Locally dispatching remote configuration message: %@", (uint8_t *)&v12, 0x16u);
    }
    v11 = [(__HMDHomeAdministratorReceiver *)v7 handler];
    [v11 dispatchMessage:v4];
  }
}

- (void)registerForMessage:(id)a3 policies:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)__HMDHomeAdministratorRemoteReceiver;
  id v6 = a4;
  id v7 = a3;
  [(__HMDHomeAdministratorReceiver *)&v15 registerForMessage:v7 policies:v6];
  v8 = objc_msgSend(v6, "mutableCopy", v15.receiver, v15.super_class);

  v9 = [v8 indexesOfObjectsPassingTest:&__block_literal_global_177_167023];
  if (v9) {
    [v8 removeObjectsAtIndexes:v9];
  }
  v10 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  [v10 setRoles:4];
  v11 = (void *)[v10 copy];
  uint64_t v12 = [v8 indexOfObjectPassingTest:&__block_literal_global_181_167025];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
    [v8 addObject:v11];
  }
  else {
    [v8 replaceObjectAtIndex:v12 withObject:v11];
  }
  v13 = [(__HMDHomeAdministratorReceiver *)self handler];
  __int16 v14 = [v13 dispatcher];
  [v14 registerForMessage:v7 receiver:self policies:v8 selector:sel___handleRemoteMessage_];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_167030 != -1) {
    dispatch_once(&logCategory__hmf_once_t19_167030, &__block_literal_global_185);
  }
  v2 = (void *)logCategory__hmf_once_v20_167031;
  return v2;
}

@end