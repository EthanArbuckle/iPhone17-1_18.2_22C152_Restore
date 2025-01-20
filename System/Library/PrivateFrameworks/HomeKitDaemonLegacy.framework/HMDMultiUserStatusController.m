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

- (int64_t)multiUserState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t multiUserState = self->_multiUserState;
  os_unfair_lock_unlock(p_lock);
  return multiUserState;
}

- (void)didUpdateDataSyncState:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = [(HMDMultiUserStatusController *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDMultiUserStatusController *)self dataSyncState] != a3)
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = HMFGetLogIdentifier();
      v10 = HMHomeManagerDataSyncStateToString();
      int v11 = 138543618;
      v12 = v9;
      __int16 v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Changed data sync state to %@", (uint8_t *)&v11, 0x16u);
    }
    [(HMDMultiUserStatusController *)v7 setDataSyncState:a3];
    -[HMDMultiUserStatusController _recalculateState]((uint64_t)v7);
  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)dataSyncState
{
  return self->_dataSyncState;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDataSyncState:(unint64_t)a3
{
  self->_dataSyncState = a3;
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

- (void)didChangeHasActiveAccountState:(BOOL)a3
{
  unsigned int v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = [(HMDMultiUserStatusController *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDMultiUserStatusController *)self haveActiveSignedInAccount] != v3)
  {
    uint64_t v6 = v3;
    v7 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = HMFGetLogIdentifier();
      int v11 = HMFBooleanToString();
      int v14 = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Changed account state to %@", (uint8_t *)&v14, 0x16u);
    }
    [(HMDMultiUserStatusController *)v8 setHaveActiveSignedInAccount:v6];
    if (v8)
    {
      v12 = [(HMDMultiUserStatusController *)v8 queue];
      dispatch_assert_queue_V2(v12);

      if (-[HMDMultiUserStatusController _recalculateState]((uint64_t)v8))
      {
        __int16 v13 = [(HMDMultiUserStatusController *)v8 delegate];
        objc_msgSend(v13, "multiUserStatusController:statusDidChange:", v8, -[HMDMultiUserStatusController multiUserState](v8, "multiUserState"));
      }
    }
  }
}

- (uint64_t)_recalculateState
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = (void *)result;
    v2 = [(id)result queue];
    dispatch_assert_queue_V2(v2);

    unsigned int v3 = [v1 queue];
    dispatch_assert_queue_V2(v3);

    uint64_t v4 = [v1 dataSyncState] == 1 && objc_msgSend(v1, "haveActiveSignedInAccount") != 0;
    if ([v1 multiUserState] == v4)
    {
      return 0;
    }
    else
    {
      v5 = (void *)MEMORY[0x1D9452090]();
      id v6 = v1;
      v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = HMFGetLogIdentifier();
        v9 = [NSNumber numberWithInteger:v4];
        int v10 = 138543618;
        int v11 = v8;
        __int16 v12 = 2112;
        __int16 v13 = v9;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Multi-User state updated to %@", (uint8_t *)&v10, 0x16u);
      }
      [v6 setMultiUserState:v4];
      return 1;
    }
  }
  return result;
}

- (void)setMultiUserState:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_int64_t multiUserState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (HMDMultiUserStatusController)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDMultiUserStatusController;
  v9 = [(HMDMultiUserStatusController *)&v12 init];
  int v10 = v9;
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
  if (logCategory__hmf_once_t0_172046 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_172046, &__block_literal_global_172047);
  }
  v2 = (void *)logCategory__hmf_once_v1_172048;
  return v2;
}

uint64_t __43__HMDMultiUserStatusController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_172048;
  logCategory__hmf_once_v1_172048 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end