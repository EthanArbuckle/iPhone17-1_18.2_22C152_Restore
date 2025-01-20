@interface HMDCameraSnapshotLocal
+ (id)logCategory;
- (HMDAccessory)accessory;
- (HMDCameraSnapshotLocal)initWithSessionID:(id)a3 workQueue:(id)a4 accessory:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 snapshotRequestHandler:(id)a8;
- (HMDCameraSnapshotLocalDelegate)delegate;
- (HMDCameraSnapshotSessionID)sessionID;
- (HMDSnapshotFile)snapshotFile;
- (HMDSnapshotRequestHandlerProtocol)snapshotRequestHandler;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (void)_getSnapshot:(unint64_t)a3;
- (void)_handleSnapshotFile:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)getSnapshot:(unint64_t)a3;
- (void)setAccessory:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSnapshotFile:(id)a3;
@end

@implementation HMDCameraSnapshotLocal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotRequestHandler, 0);
  objc_storeStrong((id *)&self->_snapshotFile, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (HMDSnapshotRequestHandlerProtocol)snapshotRequestHandler
{
  return self->_snapshotRequestHandler;
}

- (void)setSnapshotFile:(id)a3
{
}

- (HMDSnapshotFile)snapshotFile
{
  return self->_snapshotFile;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraSnapshotLocalDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraSnapshotLocalDelegate *)WeakRetained;
}

- (void)setAccessory:(id)a3
{
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDCameraSnapshotSessionID)sessionID
{
  return self->_sessionID;
}

- (void)_handleSnapshotFile:(id)a3 error:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]([(HMDCameraSnapshotLocal *)self setSnapshotFile:v6]);
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    v12 = [(HMDCameraSnapshotLocal *)v9 sessionID];
    *(_DWORD *)buf = 138544130;
    v21 = v11;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Calling delegate that image %@ has been saved with error %@ for session %@", buf, 0x2Au);
  }
  v13 = [(HMDCameraSnapshotLocal *)v9 delegate];
  if (objc_opt_respondsToSelector())
  {
    v14 = [(HMDCameraSnapshotLocal *)v9 delegateQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __52__HMDCameraSnapshotLocal__handleSnapshotFile_error___block_invoke;
    v15[3] = &unk_264A2E610;
    id v16 = v13;
    v17 = v9;
    id v18 = v6;
    id v19 = v7;
    dispatch_async(v14, v15);
  }
}

void __52__HMDCameraSnapshotLocal__handleSnapshotFile_error___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  v2 = (void *)a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  id v5 = [v2 sessionID];
  [v1 snapshotLocal:v2 didSaveSnapshotFile:v3 error:v4 sessionID:v5];
}

- (void)_getSnapshot:(unint64_t)a3
{
  id v10 = (id)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Take Snapshot Local"];
  id v5 = [(HMDCameraSnapshotLocal *)self snapshotRequestHandler];
  id v6 = [(HMDCameraSnapshotLocal *)self sessionID];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__HMDCameraSnapshotLocal__getSnapshot___block_invoke;
  v7[3] = &unk_264A18298;
  id v8 = v10;
  v9 = self;
  [v5 requestSnapshot:v6 streamingTierType:a3 completionHandler:v7];

  __HMFActivityScopeLeave();
}

void __39__HMDCameraSnapshotLocal__getSnapshot___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 invalidate];
  [*(id *)(a1 + 40) _handleSnapshotFile:v7 error:v6];
}

- (void)getSnapshot:(unint64_t)a3
{
  id v5 = [(HMDCameraSnapshotLocal *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__HMDCameraSnapshotLocal_getSnapshot___block_invoke;
  v6[3] = &unk_264A2C6A0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __38__HMDCameraSnapshotLocal_getSnapshot___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getSnapshot:*(void *)(a1 + 40)];
}

- (id)logIdentifier
{
  v2 = [(HMDCameraSnapshotLocal *)self sessionID];
  uint64_t v3 = [v2 description];

  return v3;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x230FBD990](self, a2);
  uint64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating HMDCameraSnapshotLocal", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraSnapshotLocal;
  [(HMDCameraSnapshotLocal *)&v7 dealloc];
}

- (HMDCameraSnapshotLocal)initWithSessionID:(id)a3 workQueue:(id)a4 accessory:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 snapshotRequestHandler:(id)a8
{
  id v23 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMDCameraSnapshotLocal;
  v20 = [(HMDCameraSnapshotLocal *)&v24 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_sessionID, a3);
    objc_storeWeak((id *)&v21->_accessory, v16);
    objc_storeStrong((id *)&v21->_workQueue, a4);
    objc_storeWeak((id *)&v21->_delegate, v17);
    objc_storeStrong((id *)&v21->_delegateQueue, a7);
    objc_storeStrong((id *)&v21->_snapshotRequestHandler, a8);
  }

  return v21;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_27188 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_27188, &__block_literal_global_27189);
  }
  v2 = (void *)logCategory__hmf_once_v2_27190;
  return v2;
}

void __37__HMDCameraSnapshotLocal_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_27190;
  logCategory__hmf_once_v2_27190 = v0;
}

@end