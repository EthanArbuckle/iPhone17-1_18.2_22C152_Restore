@interface HMDCameraSnapshotIDSStreamReceiver
+ (id)logCategory;
- (HMDCameraSnapshotIDSStreamReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 proxyService:(id)a5 snapshotFile:(id)a6 delegate:(id)a7 remoteDevice:(id)a8;
- (HMDCameraSnapshotIDSStreamReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 snapshotFile:(id)a5 delegate:(id)a6 remoteDevice:(id)a7;
- (HMDCameraSnapshotIDSStreamReceiverDelegate)delegate;
- (HMDDevice)remoteDevice;
- (HMDSnapshotFile)snapshotFile;
- (id)logIdentifier;
- (void)_callFileReceivedWithError:(id)a3;
- (void)dealloc;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)setDelegate:(id)a3;
@end

@implementation HMDCameraSnapshotIDSStreamReceiver

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_snapshotFile, 0);
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraSnapshotIDSStreamReceiverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraSnapshotIDSStreamReceiverDelegate *)WeakRetained;
}

- (HMDDevice)remoteDevice
{
  return (HMDDevice *)objc_getProperty(self, a2, 48, 1);
}

- (HMDSnapshotFile)snapshotFile
{
  return (HMDSnapshotFile *)objc_getProperty(self, a2, 40, 1);
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v57 = a8;
  v19 = [(HMDCameraSnapshotIDSStream *)self workQueue];
  dispatch_assert_queue_V2(v19);

  v20 = objc_msgSend(v17, "hmf_stringForKey:", @"kCameraSessionID");
  v21 = [(HMDCameraSnapshotIDSStream *)self sessionID];
  v22 = [v21 sessionID];
  char v23 = [v20 isEqualToString:v22];

  if (v23)
  {
    v24 = +[HMDDeviceHandle deviceHandleForDestination:v18];
    if (v24)
    {
      id v54 = v14;
      id v55 = v15;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v25 = [(HMDCameraSnapshotIDSStreamReceiver *)self remoteDevice];
      v26 = [v25 handles];

      uint64_t v27 = [v26 countByEnumeratingWithState:&v58 objects:v68 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v59;
        while (2)
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v59 != v29) {
              objc_enumerationMutation(v26);
            }
            if ([*(id *)(*((void *)&v58 + 1) + 8 * i) isEqual:v24])
            {

              v39 = objc_msgSend(v17, "hmf_dateForKey:", *MEMORY[0x1E4F2EE80]);
              if (v39)
              {
                v40 = [(HMDCameraSnapshotIDSStreamReceiver *)self snapshotFile];
                v41 = [v16 path];
                v42 = (void *)[v40 copyFileAtPath:v41 snapshotTimestamp:v39];

                v43 = [(HMDCameraSnapshotIDSStream *)self sessionID];
                [v43 markMilestoneFor:@"IDSTransferReceivedImage"];
              }
              else
              {
                v49 = (void *)MEMORY[0x1D9452090]();
                v50 = self;
                v51 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v52 = v53 = v50;
                  *(_DWORD *)buf = 138543362;
                  v63 = v52;
                  _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_ERROR, "%{public}@Did not receive the snapshot timestamp in the IDS delegate callback", buf, 0xCu);

                  v50 = v53;
                }

                v42 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1035];
              }
              id v14 = v54;
              -[HMDCameraSnapshotIDSStreamReceiver _callFileReceivedWithError:](self, "_callFileReceivedWithError:", v42, v53);

              goto LABEL_26;
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v58 objects:v68 count:16];
          if (v28) {
            continue;
          }
          break;
        }
      }

      v31 = (void *)MEMORY[0x1D9452090]();
      v32 = self;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v63 = v34;
        __int16 v64 = 2112;
        id v65 = v24;
        __int16 v66 = 2112;
        id v67 = v18;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Ignoring incoming snapshot resource from unexpected device handle: %@ fromID: %@", buf, 0x20u);
      }
      id v14 = v54;
LABEL_26:
      id v15 = v55;
    }
    else
    {
      v44 = (void *)MEMORY[0x1D9452090]();
      v45 = self;
      v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v56 = v16;
        v48 = id v47 = v15;
        *(_DWORD *)buf = 138543618;
        v63 = v48;
        __int16 v64 = 2112;
        id v65 = v18;
        _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_ERROR, "%{public}@Could not determine device handle for fromID: %@", buf, 0x16u);

        id v15 = v47;
        id v16 = v56;
      }
    }
  }
  else
  {
    v35 = (void *)MEMORY[0x1D9452090]();
    v36 = self;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v63 = v38;
      __int16 v64 = 2112;
      id v65 = v20;
      _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring incoming snapshot resource with unexpected request identifier: %@", buf, 0x16u);
    }
  }
}

- (id)logIdentifier
{
  v2 = [(HMDCameraSnapshotIDSStream *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (void)_callFileReceivedWithError:(id)a3
{
  id v6 = a3;
  v4 = [(HMDCameraSnapshotIDSStream *)self workQueue];
  dispatch_assert_queue_V2(v4);

  v5 = [(HMDCameraSnapshotIDSStreamReceiver *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 streamReceiver:self didReceiveFileWithError:v6];
  }
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the HMDCameraSnapshotIDSStreamReceiver", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraSnapshotIDSStreamReceiver;
  [(HMDCameraSnapshotIDSStream *)&v7 dealloc];
}

- (HMDCameraSnapshotIDSStreamReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 proxyService:(id)a5 snapshotFile:(id)a6 delegate:(id)a7 remoteDevice:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v15)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v16)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  v20 = v19;
  if (!v19)
  {
LABEL_13:
    v24 = (HMDCameraSnapshotIDSStreamReceiver *)_HMFPreconditionFailure();
    return [(HMDCameraSnapshotIDSStreamReceiver *)v24 initWithSessionID:v26 workQueue:v27 snapshotFile:v28 delegate:v29 remoteDevice:v30];
  }
  v31.receiver = self;
  v31.super_class = (Class)HMDCameraSnapshotIDSStreamReceiver;
  v21 = [(HMDCameraSnapshotIDSStream *)&v31 initWithSessionID:v14 workQueue:v15 proxyService:v16];
  v22 = v21;
  if (v21)
  {
    objc_storeWeak((id *)&v21->_delegate, v18);
    objc_storeStrong((id *)&v22->_snapshotFile, a6);
    objc_storeStrong((id *)&v22->_remoteDevice, a8);
  }

  return v22;
}

- (HMDCameraSnapshotIDSStreamReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 snapshotFile:(id)a5 delegate:(id)a6 remoteDevice:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v13)
  {
LABEL_7:
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v14)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  id v17 = v16;
  if (v16)
  {
    id v18 = +[HMDIDSServiceManager sharedManager];
    id v19 = [v18 proxyService];
    v20 = [(HMDCameraSnapshotIDSStreamReceiver *)self initWithSessionID:v12 workQueue:v13 proxyService:v19 snapshotFile:v14 delegate:v15 remoteDevice:v17];

    return v20;
  }
LABEL_9:
  v22 = (void *)_HMFPreconditionFailure();
  return (HMDCameraSnapshotIDSStreamReceiver *)+[HMDCameraSnapshotIDSStreamReceiver logCategory];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_142621 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_142621, &__block_literal_global_142622);
  }
  v2 = (void *)logCategory__hmf_once_v2_142623;
  return v2;
}

uint64_t __49__HMDCameraSnapshotIDSStreamReceiver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_142623;
  logCategory__hmf_once_v2_142623 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end