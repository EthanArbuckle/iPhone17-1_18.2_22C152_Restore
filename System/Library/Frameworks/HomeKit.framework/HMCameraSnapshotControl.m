@interface HMCameraSnapshotControl
- (HMCameraSnapshot)mostRecentSnapshot;
- (HMCameraSnapshotControl)init;
- (HMCameraSnapshotControl)initWithSnapshotControl:(id)a3;
- (_HMCameraSnapshotControl)snapshotControl;
- (id)delegate;
- (void)cameraSnapshotControl:(id)a3 didTakeSnapshot:(id)a4 error:(id)a5;
- (void)cameraSnapshotControlDidUpdateMostRecentSnapshot:(id)a3;
- (void)fetchCameraSnapshotForBulletinContext:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)delegate;
- (void)takeSnapshot;
@end

@implementation HMCameraSnapshotControl

void __67___HMCameraSnapshotControl__notifyDelegateOfDidTakeSnapshot_error___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 56) hmPublicError];
  [v1 cameraSnapshotControl:v2 didTakeSnapshot:v3 error:v4];
}

- (void)cameraSnapshotControl:(id)a3 didTakeSnapshot:(id)a4 error:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  v8 = [(HMCameraSnapshotControl *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 cameraSnapshotControl:self didTakeSnapshot:v9 error:v7];
  }
}

- (id)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return WeakRetained;
}

uint64_t __40___HMCameraSnapshotControl_takeSnapshot__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _takeSnapshot];
}

- (HMCameraSnapshot)mostRecentSnapshot
{
  uint64_t v2 = [(HMCameraSnapshotControl *)self snapshotControl];
  uint64_t v3 = [v2 mostRecentSnapshot];

  return (HMCameraSnapshot *)v3;
}

- (_HMCameraSnapshotControl)snapshotControl
{
  return (_HMCameraSnapshotControl *)objc_getProperty(self, a2, 24, 1);
}

- (HMCameraSnapshotControl)initWithSnapshotControl:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMCameraSnapshotControl;
  v6 = [(HMCameraControl *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_snapshotControl, a3);
    [(_HMCameraSnapshotControl *)v7->_snapshotControl setDelegate:v7];
  }

  return v7;
}

void __41___HMCameraSnapshotControl__takeSnapshot__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138543874;
    v14 = v11;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Received response for snapshot request with session ID %@: %@", (uint8_t *)&v13, 0x20u);
  }
  [v9 _handleSnapshot:v6 error:v5 isMostRecent:0];
}

uint64_t __39___HMCameraSnapshotControl_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v21;
  logCategory__hmf_once_v21 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)takeSnapshot
{
  id v4 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v5 = NSString;
  id v6 = MEMORY[0x19F3A5D00](self, a2);
  id v7 = [v5 stringWithFormat:@"%@, %s:%ld", v6, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/Camera/Source/Snapshot/HMCameraSnapshotControl.m", 64];
  id v9 = (void *)[v4 initWithName:v7];

  v8 = [(HMCameraSnapshotControl *)self snapshotControl];
  [v8 takeSnapshot];

  __HMFActivityScopeLeave();
}

- (void)setDelegate:(id)delegate
{
  p_lock = &self->_lock;
  id v5 = delegate;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

uint64_t __70___HMCameraSnapshotControl__notifyDelegateOfMostRecentSnapshotUpdated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cameraSnapshotControlDidUpdateMostRecentSnapshot:*(void *)(a1 + 40)];
}

uint64_t __85___HMCameraSnapshotControl__fetchCameraSnapshotForBulletinContext_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleCreateSnapshotWithBulletinContext:a3 error:a2 completionHandler:*(void *)(a1 + 40)];
}

uint64_t __52___HMCameraSnapshotControl_mergeNewSnapshotControl___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfMostRecentSnapshotUpdated];
}

uint64_t __84___HMCameraSnapshotControl_fetchCameraSnapshotForBulletinContext_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchCameraSnapshotForBulletinContext:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotControl, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)cameraSnapshotControlDidUpdateMostRecentSnapshot:(id)a3
{
  id v4 = [(HMCameraSnapshotControl *)self delegate];
  if ([v4 conformsToProtocol:&unk_1EEF6FE90]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (objc_opt_respondsToSelector()) {
    [v6 cameraSnapshotControlDidUpdateMostRecentSnapshot:self];
  }
}

- (void)fetchCameraSnapshotForBulletinContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMCameraSnapshotControl *)self snapshotControl];
  [v8 fetchCameraSnapshotForBulletinContext:v7 completionHandler:v6];
}

- (HMCameraSnapshotControl)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMCameraSnapshotControl;
  return [(HMCameraControl *)&v3 init];
}

@end