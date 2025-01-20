@interface HMDRemoteHomeMessagingManager
+ (id)logCategory;
- (BOOL)sendMessage:(id)a3 completionHandler:(id)a4;
- (HMDRemoteHomeMessagingManager)init;
- (NSMapTable)homeUUIDToHandlerMap;
- (void)registerHandler:(id)a3;
@end

@implementation HMDRemoteHomeMessagingManager

- (void).cxx_destruct
{
}

- (NSMapTable)homeUUIDToHandlerMap
{
  return self->_homeUUIDToHandlerMap;
}

- (BOOL)sendMessage:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 destination];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    v11 = [v10 homeUUID];
    os_unfair_lock_lock_with_options();
    v12 = [(HMDRemoteHomeMessagingManager *)self homeUUIDToHandlerMap];
    v13 = [v12 objectForKey:v11];

    os_unfair_lock_unlock(&self->_lock);
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    v17 = v16;
    if (v13)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v27 = v18;
        __int16 v28 = 2114;
        v29 = v11;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Dispatching to handler for home UUID: %{public}@", buf, 0x16u);
      }
      [v13 sendMessage:v6 completionHandler:v7];
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v27 = v19;
        __int16 v28 = 2114;
        v29 = v11;
        __int16 v30 = 2112;
        id v31 = v6;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Handler not found for home UUID: %{public}@, message: %@", buf, 0x20u);
      }
      v20 = (void *)MEMORY[0x263F087E8];
      v21 = [NSString stringWithFormat:@"Handler not found for home UUID %@", v11];
      v22 = [v20 hmErrorWithCode:2 description:@"Cannot send message to the specified home" reason:v21 suggestion:0];

      [v6 respondWithError:v22];
      v23 = _Block_copy(v7);
      v24 = v23;
      if (v23) {
        (*((void (**)(void *, void *))v23 + 2))(v23, v22);
      }
    }
  }

  return v10 != 0;
}

- (void)registerHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [v4 homeUUID];
    int v13 = 138543618;
    v14 = v8;
    __int16 v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering handler for home UUID: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  p_lock = &v6->_lock;
  os_unfair_lock_lock_with_options();
  v11 = [(HMDRemoteHomeMessagingManager *)v6 homeUUIDToHandlerMap];
  v12 = [v4 homeUUID];
  [v11 setObject:v4 forKey:v12];

  os_unfair_lock_unlock(p_lock);
}

- (HMDRemoteHomeMessagingManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)HMDRemoteHomeMessagingManager;
  v2 = [(HMDRemoteHomeMessagingManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    homeUUIDToHandlerMap = v3->_homeUUIDToHandlerMap;
    v3->_homeUUIDToHandlerMap = (NSMapTable *)v4;
  }
  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_221412 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_221412, &__block_literal_global_221413);
  }
  v2 = (void *)logCategory__hmf_once_v8_221414;
  return v2;
}

void __44__HMDRemoteHomeMessagingManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v8_221414;
  logCategory__hmf_once_v8_221414 = v0;
}

@end