@interface HMDMultiUserStatusController
+ (id)logCategory;
- (HMDMultiUserStatusController)initWithQueue:(id)a3 delegate:(id)a4;
- (HMDMultiUserStatusControllerDelegate)delegate;
- (OS_dispatch_queue)queue;
- (int64_t)multiUserState;
- (uint64_t)_recalculateState;
- (unint64_t)dataSyncState;
- (unint64_t)haveActiveSignedInAccount;
- (void)didChangeHasActiveAccountState:(BOOL)a3;
- (void)didUpdateDataSyncState:(unint64_t)a3;
- (void)setDataSyncState:(unint64_t)a3;
- (void)setHaveActiveSignedInAccount:(unint64_t)a3;
- (void)setMultiUserState:(int64_t)a3;
@end

@implementation HMDMultiUserStatusController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDataSyncState:(unint64_t)a3
{
  self->_dataSyncState = a3;
}

- (unint64_t)dataSyncState
{
  return self->_dataSyncState;
}

- (void)setHaveActiveSignedInAccount:(unint64_t)a3
{
  self->_haveActiveSignedInAccount = a3;
}

- (unint64_t)haveActiveSignedInAccount
{
  return self->_haveActiveSignedInAccount;
}

- (HMDMultiUserStatusControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMultiUserStatusControllerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)didChangeHasActiveAccountState:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = [(HMDMultiUserStatusController *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDMultiUserStatusController *)self haveActiveSignedInAccount] != v3)
  {
    uint64_t v6 = v3;
    v7 = (void *)MEMORY[0x230FBD990]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = HMFGetLogIdentifier();
      v11 = HMFBooleanToString();
      int v14 = 138543618;
      v15 = v10;
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Changed account state to %@", (uint8_t *)&v14, 0x16u);
    }
    [(HMDMultiUserStatusController *)v8 setHaveActiveSignedInAccount:v6];
    if (v8)
    {
      v12 = [(HMDMultiUserStatusController *)v8 queue];
      dispatch_assert_queue_V2(v12);

      if (-[HMDMultiUserStatusController _recalculateState]((uint64_t)v8))
      {
        v13 = [(HMDMultiUserStatusController *)v8 delegate];
        objc_msgSend(v13, "multiUserStatusController:statusDidChange:", v8, -[HMDMultiUserStatusController multiUserState](v8, "multiUserState"));
      }
    }
  }
}

- (uint64_t)_recalculateState
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (result)
  {
    v1 = (void *)result;
    v2 = [(id)result queue];
    dispatch_assert_queue_V2(v2);

    unsigned int v3 = [v1 queue];
    dispatch_assert_queue_V2(v3);

    v4 = [v1 queue];
    dispatch_assert_queue_V2(v4);

    uint64_t v5 = [v1 dataSyncState] == 1;
    if ([v1 multiUserState] == v5)
    {
      return 0;
    }
    else
    {
      uint64_t v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = v1;
      v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = HMFGetLogIdentifier();
        v10 = [NSNumber numberWithInteger:v5];
        int v11 = 138543618;
        v12 = v9;
        __int16 v13 = 2112;
        int v14 = v10;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Multi-User state updated to %@", (uint8_t *)&v11, 0x16u);
      }
      [v7 setMultiUserState:v5];
      return 1;
    }
  }
  return result;
}

- (void)didUpdateDataSyncState:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(HMDMultiUserStatusController *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDMultiUserStatusController *)self dataSyncState] != a3)
  {
    uint64_t v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = HMFGetLogIdentifier();
      v10 = HMHomeManagerDataSyncStateToString();
      int v11 = 138543618;
      v12 = v9;
      __int16 v13 = 2112;
      int v14 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Changed data sync state to %@", (uint8_t *)&v11, 0x16u);
    }
    [(HMDMultiUserStatusController *)v7 setDataSyncState:a3];
    -[HMDMultiUserStatusController _recalculateState]((uint64_t)v7);
  }
}

- (void)setMultiUserState:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_multiUserState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)multiUserState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t multiUserState = self->_multiUserState;
  os_unfair_lock_unlock(p_lock);
  return multiUserState;
}

- (HMDMultiUserStatusController)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDMultiUserStatusController;
  v9 = [(HMDMultiUserStatusController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v10->_int64_t multiUserState = 0;
    v10->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_245060 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_245060, &__block_literal_global_245061);
  }
  v2 = (void *)logCategory__hmf_once_v1_245062;
  return v2;
}

void __43__HMDMultiUserStatusController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_245062;
  logCategory__hmf_once_v1_245062 = v0;
}

@end