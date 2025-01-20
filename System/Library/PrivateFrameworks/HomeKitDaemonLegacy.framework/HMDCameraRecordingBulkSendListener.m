@interface HMDCameraRecordingBulkSendListener
+ (id)logCategory;
- (BOOL)isSessionOpenInProgress;
- (HMDCameraRecordingBulkSendListener)initWithWorkQueue:(id)a3;
- (HMDCameraRecordingBulkSendListenerDelegate)delegate;
- (NSUUID)UUID;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (void)_callPendingOpenSessionCallbackWithResult:(void *)a3 error:;
- (void)accessory:(id)a3 didCloseDataStreamWithError:(id)a4;
- (void)accessory:(id)a3 didReceiveBulkSessionCandidate:(id)a4;
- (void)accessoryDidStartListening:(id)a3;
- (void)addPendingBulkSendSessionCallback:(id)a3;
- (void)openBulkSendSessionWithAccessory:(id)a3 callback:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation HMDCameraRecordingBulkSendListener

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingOpenSessionCallback, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraRecordingBulkSendListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraRecordingBulkSendListenerDelegate *)WeakRetained;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDCameraRecordingBulkSendListener *)self UUID];
  v5 = (void *)[v3 initWithName:@"UUID" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraRecordingBulkSendListener *)self UUID];
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)accessory:(id)a3 didCloseDataStreamWithError:(id)a4
{
  id v6 = a4;
  if (self) {
    Property = objc_getProperty(self, v5, 24, 1);
  }
  else {
    Property = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__HMDCameraRecordingBulkSendListener_accessory_didCloseDataStreamWithError___block_invoke;
  v9[3] = &unk_1E6A197C8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(Property, v9);
}

void __76__HMDCameraRecordingBulkSendListener_accessory_didCloseDataStreamWithError___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory did close data stream", (uint8_t *)&v10, 0xCu);
  }
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:3305];
  }
  id v8 = v7;
  -[HMDCameraRecordingBulkSendListener _callPendingOpenSessionCallbackWithResult:error:](*(void **)(a1 + 32), 0, v7);
  v9 = [*(id *)(a1 + 32) delegate];
  [v9 listenerDidReceiveDataStreamClose:*(void *)(a1 + 32)];
}

- (void)_callPendingOpenSessionCallbackWithResult:(void *)a3 error:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    Property = objc_getProperty(a1, v6, 24, 1);
    dispatch_assert_queue_V2(Property);
    int v10 = (void (**)(id, id, id))objc_getProperty(a1, v9, 32, 1);
    if (v10)
    {
      v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = a1;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = HMFGetLogIdentifier();
        int v16 = 138543874;
        v17 = v14;
        __int16 v18 = 2112;
        id v19 = v5;
        __int16 v20 = 2112;
        id v21 = v7;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Calling pending callback with result: %@ error: %@", (uint8_t *)&v16, 0x20u);
      }
      objc_setProperty_atomic_copy(v12, v15, 0, 32);
      v10[2](v10, v5, v7);
    }
  }
}

- (void)accessoryDidStartListening:(id)a3
{
  id v5 = a3;
  if (self) {
    Property = objc_getProperty(self, v4, 24, 1);
  }
  else {
    Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __65__HMDCameraRecordingBulkSendListener_accessoryDidStartListening___block_invoke;
  v8[3] = &unk_1E6A197C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __65__HMDCameraRecordingBulkSendListener_accessoryDidStartListening___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v15 = 138543362;
    int v16 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory did start listening", (uint8_t *)&v15, 0xCu);
  }
  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    id v8 = objc_getProperty(v7, v6, 32, 1);
    if (v8)
    {
      id v9 = v8;
      int v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = *(id *)(a1 + 32);
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = HMFGetLogIdentifier();
        int v15 = 138543362;
        int v16 = v13;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling pending open bulk send session request", (uint8_t *)&v15, 0xCu);
      }
      [*(id *)(a1 + 32) openBulkSendSessionWithAccessory:*(void *)(a1 + 40) callback:v9];
    }
  }
  v14 = [*(id *)(a1 + 32) delegate];
  [v14 listenerDidReceiveDataStreamStart:*(void *)(a1 + 32)];
}

- (void)accessory:(id)a3 didReceiveBulkSessionCandidate:(id)a4
{
}

- (void)openBulkSendSessionWithAccessory:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (self)
  {
    Property = objc_getProperty(self, v8, 24, 1);
    dispatch_assert_queue_V2(Property);
    objc_setProperty_atomic_copy(self, v10, v6, 32);
    id v12 = objc_getProperty(self, v11, 24, 1);
  }
  else
  {
    dispatch_assert_queue_V2(0);
    id v12 = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__HMDCameraRecordingBulkSendListener_openBulkSendSessionWithAccessory_callback___block_invoke;
  v13[3] = &unk_1E6A113A8;
  v13[4] = self;
  [a3 openBulkSendSessionForFileType:@"ipcamera.recording" reason:@"record" metadata:0 queue:v12 callback:v13];
}

void __80__HMDCameraRecordingBulkSendListener_openBulkSendSessionWithAccessory_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = a3;
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    Property = objc_getProperty(v8, v6, 24, 1);
    uint64_t v10 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v10 = 0;
    Property = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__HMDCameraRecordingBulkSendListener_openBulkSendSessionWithAccessory_callback___block_invoke_2;
  block[3] = &unk_1E6A19668;
  block[4] = v10;
  id v14 = v5;
  id v15 = v7;
  id v11 = v7;
  id v12 = v5;
  dispatch_async(Property, block);
}

void __80__HMDCameraRecordingBulkSendListener_openBulkSendSessionWithAccessory_callback___block_invoke_2(void **a1)
{
}

- (void)addPendingBulkSendSessionCallback:(id)a3
{
  id newValue = a3;
  if (self)
  {
    Property = objc_getProperty(self, v4, 24, 1);
    dispatch_assert_queue_V2(Property);
    objc_setProperty_atomic_copy(self, v6, newValue, 32);
  }
  else
  {
    dispatch_assert_queue_V2(0);
  }
}

- (BOOL)isSessionOpenInProgress
{
  if (self) {
    self = (HMDCameraRecordingBulkSendListener *)objc_getProperty(self, a2, 32, 1);
  }
  return self != 0;
}

- (HMDCameraRecordingBulkSendListener)initWithWorkQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCameraRecordingBulkSendListener;
  SEL v6 = [(HMDCameraRecordingBulkSendListener *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workQueue, a3);
    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    UUID = v7->_UUID;
    v7->_UUID = (NSUUID *)v8;
  }
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_131206 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_131206, &__block_literal_global_131207);
  }
  v2 = (void *)logCategory__hmf_once_v5_131208;
  return v2;
}

uint64_t __49__HMDCameraRecordingBulkSendListener_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_131208;
  logCategory__hmf_once_v5_131208 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end