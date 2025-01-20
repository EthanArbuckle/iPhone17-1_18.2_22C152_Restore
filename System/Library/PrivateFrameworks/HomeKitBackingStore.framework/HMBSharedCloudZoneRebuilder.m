@interface HMBSharedCloudZoneRebuilder
+ (id)logCategory;
- (BOOL)isZoneRebuildInProgress;
- (HMBCloudZone)cloudZone;
- (HMBCloudZoneRebuilderStatus)rebuilderStatus;
- (HMBSharedCloudZoneRebuilder)initWithCloudZone:(id)a3;
- (NAFuture)rebuildCompleteFuture;
- (id)logIdentifier;
- (id)zoneStartUp;
- (void)handleIdentityLost;
- (void)rebuild;
- (void)setCloudZone:(id)a3;
- (void)setRebuildCompleteFuture:(id)a3;
- (void)setRebuilderStatus:(id)a3;
@end

@implementation HMBSharedCloudZoneRebuilder

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cloudZone);
  objc_storeStrong((id *)&self->_rebuildCompleteFuture, 0);
  objc_storeStrong((id *)&self->_rebuilderStatus, 0);
}

- (void)setCloudZone:(id)a3
{
}

- (HMBCloudZone)cloudZone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudZone);
  return (HMBCloudZone *)WeakRetained;
}

- (void)setRebuildCompleteFuture:(id)a3
{
}

- (NAFuture)rebuildCompleteFuture
{
  return self->_rebuildCompleteFuture;
}

- (void)setRebuilderStatus:(id)a3
{
}

- (HMBCloudZoneRebuilderStatus)rebuilderStatus
{
  return (HMBCloudZoneRebuilderStatus *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMBSharedCloudZoneRebuilder *)self cloudZone];
  v3 = [v2 zoneID];
  v4 = [v3 name];

  return v4;
}

- (BOOL)isZoneRebuildInProgress
{
  return 0;
}

- (void)handleIdentityLost
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  [(HMBSharedCloudZoneRebuilder *)self setRebuildCompleteFuture:v3];

  v4 = [(HMBSharedCloudZoneRebuilder *)self rebuilderStatus];
  uint64_t v5 = [v4 rebuildState];

  v6 = [[HMBCloudZoneRebuilderStatus alloc] initWithState:1 message:@"Lost key on shared zone."];
  [(HMBSharedCloudZoneRebuilder *)self setRebuilderStatus:v6];

  v7 = [(HMBSharedCloudZoneRebuilder *)self cloudZone];
  v8 = [(HMBSharedCloudZoneRebuilder *)self rebuilderStatus];
  uint64_t v9 = [v8 rebuildState];

  if (v5 != v9)
  {
    v10 = [v7 delegate];
    v11 = (void *)MEMORY[0x1D944CB30]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v24 = v14;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_INFO, "%{public}@Informing delegate we have lost our identity.", buf, 0xCu);
    }
    if (objc_opt_respondsToSelector())
    {
      v15 = [(HMBSharedCloudZoneRebuilder *)v12 rebuilderStatus];
      [v10 cloudZone:v7 didChangeRebuildStatus:v15];
    }
  }
  v16 = [v7 leaveCloudShareRequestingNewInvitationToken:1];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __49__HMBSharedCloudZoneRebuilder_handleIdentityLost__block_invoke;
  v21[3] = &unk_1E69EA668;
  v21[4] = self;
  id v22 = v7;
  id v17 = v7;
  id v18 = (id)[v16 addSuccessBlock:v21];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __49__HMBSharedCloudZoneRebuilder_handleIdentityLost__block_invoke_10;
  v20[3] = &unk_1E69EA690;
  v20[4] = self;
  id v19 = (id)[v16 addFailureBlock:v20];
}

void __49__HMBSharedCloudZoneRebuilder_handleIdentityLost__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = HMFGetLogIdentifier();
    int v11 = 138543362;
    v12 = v7;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully removed ourself from share.", (uint8_t *)&v11, 0xCu);
  }
  v8 = [*(id *)(a1 + 40) cloudDatabase];
  uint64_t v9 = [v8 delegate];
  if (objc_opt_respondsToSelector())
  {
    v10 = [*(id *)(a1 + 40) cloudZoneID];
    [v9 cloudDatabase:v8 didChangeManateeKeysForZoneWithID:v10];
  }
}

void __49__HMBSharedCloudZoneRebuilder_handleIdentityLost__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove self from the share: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (id)zoneStartUp
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)rebuild
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944CB30](self, a2);
  v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    int v8 = v6;
    _os_log_impl(&dword_1D4693000, v5, OS_LOG_TYPE_ERROR, "%{public}@Unable to rebuild a shared zone.", (uint8_t *)&v7, 0xCu);
  }
}

- (HMBSharedCloudZoneRebuilder)initWithCloudZone:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMBSharedCloudZoneRebuilder;
  id v5 = [(HMBSharedCloudZoneRebuilder *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cloudZone, v4);
    int v7 = [[HMBCloudZoneRebuilderStatus alloc] initWithState:7 message:@"Zone believed to be functional."];
    rebuilderStatus = v6->_rebuilderStatus;
    v6->_rebuilderStatus = v7;
    uint64_t v9 = v7;

    uint64_t v10 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    rebuildCompleteFuture = v6->_rebuildCompleteFuture;
    v6->_rebuildCompleteFuture = (NAFuture *)v10;
  }
  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4 != -1) {
    dispatch_once(&logCategory__hmf_once_t4, &__block_literal_global_3019);
  }
  v2 = (void *)logCategory__hmf_once_v5;
  return v2;
}

uint64_t __42__HMBSharedCloudZoneRebuilder_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5;
  logCategory__hmf_once_id v5 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end