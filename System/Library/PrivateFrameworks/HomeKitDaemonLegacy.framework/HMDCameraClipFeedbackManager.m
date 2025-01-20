@interface HMDCameraClipFeedbackManager
+ (id)logCategory;
- (BOOL)isCurrentDeviceConfirmedPrimaryResident;
- (HMBCloudZone)cloudZone;
- (HMBLocalZone)localZone;
- (HMDCameraClipFeedbackManager)initWithLocalZone:(id)a3 cloudZone:(id)a4 home:(id)a5 messageDispatcher:(id)a6 cameraProfileUUID:(id)a7 messageTargetUUID:(id)a8 workQueue:(id)a9;
- (HMDCameraClipFeedbackManager)initWithLocalZone:(id)a3 cloudZone:(id)a4 home:(id)a5 messageDispatcher:(id)a6 cameraProfileUUID:(id)a7 messageTargetUUID:(id)a8 workQueue:(id)a9 feedbackUploader:(id)a10;
- (HMDCameraClipFeedbackUploader)feedbackUploader;
- (HMDHome)home;
- (HMFMessageDispatcher)messageDispatcher;
- (NSUUID)cameraProfileUUID;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (id)_performCloudPull;
- (id)logIdentifier;
- (void)_findAndUploadSubmittedClips;
- (void)_handleFindAndUploadSubmittedClipsMessage:(id)a3;
- (void)_handleSubmitClipsMessage:(id)a3;
- (void)_notifyPrimaryResidentThatClipsWereSubmitted;
- (void)_uploadNextClipFromQueryResult:(id)a3;
- (void)configureWithIsCurrentDeviceResidentCapable:(BOOL)a3;
- (void)handlePrimaryResidentUpdateNotification:(id)a3;
- (void)setHome:(id)a3;
@end

@implementation HMDCameraClipFeedbackManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_cameraProfileUUID, 0);
  objc_storeStrong((id *)&self->_feedbackUploader, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSUUID)cameraProfileUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (HMDCameraClipFeedbackUploader)feedbackUploader
{
  return (HMDCameraClipFeedbackUploader *)objc_getProperty(self, a2, 48, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 40, 1);
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 32, 1);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraClipFeedbackManager *)self cameraProfileUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)_handleSubmitClipsMessage:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraClipFeedbackManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    v72 = v9;
    __int16 v73 = 2112;
    v74 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling submit clips message payload: %@", buf, 0x16u);
  }
  v11 = [v4 setForKey:*MEMORY[0x1E4F2CB98]];
  if (!v11)
  {
    v51 = (void *)MEMORY[0x1D9452090]();
    v52 = v7;
    v53 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v54 = HMFGetLogIdentifier();
      v55 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      v72 = v54;
      __int16 v73 = 2112;
      v74 = v55;
      _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_ERROR, "%{public}@Could not find clip UUIDs in message payload: %@", buf, 0x16u);
    }
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v4 respondWithError:v12];
    goto LABEL_41;
  }
  v57 = v4;
  id v12 = [MEMORY[0x1E4F1CA80] set];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v56 = v11;
  id obj = v11;
  uint64_t v13 = [obj countByEnumeratingWithState:&v66 objects:v77 count:16];
  if (!v13) {
    goto LABEL_12;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v67;
LABEL_6:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v67 != v15) {
      objc_enumerationMutation(obj);
    }
    v17 = *(void **)(*((void *)&v66 + 1) + 8 * v16);
    v18 = [(HMDCameraClipFeedbackManager *)v7 localZone];
    uint64_t v19 = objc_opt_class();
    id v65 = 0;
    v20 = [v18 fetchModelWithModelID:v17 ofType:v19 error:&v65];
    id v21 = v65;

    if (!v20) {
      break;
    }
    [v12 addObject:v20];

    if (v14 == ++v16)
    {
      uint64_t v14 = [obj countByEnumeratingWithState:&v66 objects:v77 count:16];
      if (!v14)
      {
LABEL_12:

        v58 = [MEMORY[0x1E4F1CA80] set];
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v12 = v12;
        uint64_t v22 = [v12 countByEnumeratingWithState:&v61 objects:v70 count:16];
        if (!v22) {
          goto LABEL_31;
        }
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v62;
        while (1)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v62 != v24) {
              objc_enumerationMutation(v12);
            }
            v26 = *(void **)(*((void *)&v61 + 1) + 8 * i);
            uint64_t v27 = [v26 feedbackStatus];
            switch(v27)
            {
              case 2:
                v36 = (void *)MEMORY[0x1D9452090]();
                v37 = v7;
                v38 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                {
                  v39 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v72 = v39;
                  __int16 v73 = 2112;
                  v74 = v26;
                  v40 = v38;
                  v41 = "%{public}@Clip is already uploaded: %@";
LABEL_27:
                  _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_INFO, v41, buf, 0x16u);
                }
LABEL_28:

                continue;
              case 1:
                v36 = (void *)MEMORY[0x1D9452090]();
                v37 = v7;
                v38 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                {
                  v39 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v72 = v39;
                  __int16 v73 = 2112;
                  v74 = v26;
                  v40 = v38;
                  v41 = "%{public}@Clip is already marked for upload: %@";
                  goto LABEL_27;
                }
                goto LABEL_28;
              case 0:
                v28 = (void *)MEMORY[0x1D9452090]();
                v29 = v7;
                v30 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  v31 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v72 = v31;
                  __int16 v73 = 2112;
                  v74 = v26;
                  _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Marking clip for upload: %@", buf, 0x16u);
                }
                v32 = [HMDCameraClipModel alloc];
                v33 = [v26 hmbModelID];
                v34 = [v26 hmbParentModelID];
                v35 = [(HMBModel *)v32 initWithModelID:v33 parentModelID:v34];

                [(HMDCameraClipModel *)v35 setFeedbackStatus:1];
                [v58 addObject:v35];

                break;
            }
          }
          uint64_t v23 = [v12 countByEnumeratingWithState:&v61 objects:v70 count:16];
          if (!v23)
          {
LABEL_31:

            if ([v58 count])
            {
              v42 = [(HMDCameraClipFeedbackManager *)v7 localZone];
              v43 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Marking clips for upload"];
              v44 = [v42 updateModels:v58 options:v43];

              v60[0] = MEMORY[0x1E4F143A8];
              v60[1] = 3221225472;
              v60[2] = __58__HMDCameraClipFeedbackManager__handleSubmitClipsMessage___block_invoke;
              v60[3] = &unk_1E6A16F30;
              v60[4] = v7;
              id v45 = (id)[v44 addSuccessBlock:v60];
            }
            id v4 = v57;
            [v57 respondWithSuccess];

            goto LABEL_37;
          }
        }
      }
      goto LABEL_6;
    }
  }
  v46 = (void *)MEMORY[0x1D9452090]();
  v47 = v7;
  v48 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    v49 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v72 = v49;
    __int16 v73 = 2112;
    v74 = v17;
    __int16 v75 = 2112;
    id v76 = v21;
    _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failing request to submit because no clip model could be found for UUID %@: %@", buf, 0x20u);
  }
  v50 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
  id v4 = v57;
  [v57 respondWithError:v50];

LABEL_37:
  v11 = v56;
LABEL_41:
}

void __58__HMDCameraClipFeedbackManager__handleSubmitClipsMessage___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 mirrorOutputResult];
  id v4 = (void *)MEMORY[0x1E4F7A0F0];
  v5 = [*(id *)(a1 + 32) workQueue];
  v6 = [v4 schedulerWithDispatchQueue:v5];
  v7 = [v3 reschedule:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__HMDCameraClipFeedbackManager__handleSubmitClipsMessage___block_invoke_2;
  v9[3] = &unk_1E6A17A58;
  v9[4] = *(void *)(a1 + 32);
  id v8 = (id)[v7 addSuccessBlock:v9];
}

uint64_t __58__HMDCameraClipFeedbackManager__handleSubmitClipsMessage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyPrimaryResidentThatClipsWereSubmitted];
}

- (void)_handleFindAndUploadSubmittedClipsMessage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraClipFeedbackManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 shortDescription];
    int v11 = 138543618;
    id v12 = v9;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling find and upload submitted clips message: %@", (uint8_t *)&v11, 0x16u);
  }
  [(HMDCameraClipFeedbackManager *)v7 _findAndUploadSubmittedClips];
  [v4 respondWithSuccess];
}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  id v4 = [(HMDCameraClipFeedbackManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HMDCameraClipFeedbackManager_handlePrimaryResidentUpdateNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __72__HMDCameraClipFeedbackManager_handlePrimaryResidentUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) isCurrentDeviceConfirmedPrimaryResident];
  v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 32);
  v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@The current device is the confirmed primary resident", (uint8_t *)&v9, 0xCu);
    }
    [*(id *)(a1 + 32) _findAndUploadSubmittedClips];
  }
  else
  {
    if (v6)
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@The current device is not the confirmed primary resident", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_notifyPrimaryResidentThatClipsWereSubmitted
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCameraClipFeedbackManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDCameraClipFeedbackManager *)self isCurrentDeviceConfirmedPrimaryResident])
  {
    [(HMDCameraClipFeedbackManager *)self _findAndUploadSubmittedClips];
  }
  else
  {
    id v4 = [(HMDCameraClipFeedbackManager *)self home];
    v5 = [v4 primaryResident];

    if (v5)
    {
      BOOL v6 = [HMDRemoteDeviceMessageDestination alloc];
      v7 = [(HMDCameraClipFeedbackManager *)self messageTargetUUID];
      id v8 = [v5 device];
      int v9 = [(HMDRemoteDeviceMessageDestination *)v6 initWithTarget:v7 device:v8];

      v10 = [[HMDRemoteMessage alloc] initWithName:@"HMDCameraClipFeedbackFindAndUploadSubmittedClipsMessage" destination:v9 payload:0 type:3 timeout:1 secure:0.0];
      uint64_t v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = self;
      __int16 v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        uint64_t v15 = [(HMFObject *)v10 shortDescription];
        int v21 = 138543874;
        uint64_t v22 = v14;
        __int16 v23 = 2112;
        uint64_t v24 = v15;
        __int16 v25 = 2112;
        v26 = v5;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending message %@ that clips were submitted to %@", (uint8_t *)&v21, 0x20u);
      }
      uint64_t v16 = [(HMDCameraClipFeedbackManager *)v12 messageDispatcher];
      [v16 sendMessage:v10];
    }
    else
    {
      v17 = (void *)MEMORY[0x1D9452090]();
      v18 = self;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = HMFGetLogIdentifier();
        int v21 = 138543362;
        uint64_t v22 = v20;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not find primary resident to send notifications to", (uint8_t *)&v21, 0xCu);
      }
    }
  }
}

- (void)_uploadNextClipFromQueryResult:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraClipFeedbackManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [v4 nextObject];
  if (!v6)
  {
    uint64_t v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v32 = v18;
      uint64_t v19 = "%{public}@No more clips left to upload";
      v20 = v17;
      os_log_type_t v21 = OS_LOG_TYPE_INFO;
      uint32_t v22 = 12;
LABEL_11:
      _os_log_impl(&dword_1D49D5000, v20, v21, v19, buf, v22);
    }
LABEL_12:

    goto LABEL_17;
  }
  if (![(HMDCameraClipFeedbackManager *)self isCurrentDeviceConfirmedPrimaryResident])
  {
    uint64_t v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v32 = v18;
      __int16 v33 = 2112;
      v34 = v6;
      uint64_t v19 = "%{public}@Current device is not a confirmed primary resident, will not upload clip %@";
      v20 = v17;
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
      uint32_t v22 = 22;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  uint64_t v7 = [v6 feedbackStatus];
  id v8 = (void *)MEMORY[0x1D9452090]();
  int v9 = self;
  v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7 == 2)
  {
    if (v11)
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v32 = v12;
      __int16 v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Clip %@ was already uploaded", buf, 0x16u);
    }
    __int16 v13 = [(HMDCameraClipFeedbackManager *)v9 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__HMDCameraClipFeedbackManager__uploadNextClipFromQueryResult___block_invoke;
    block[3] = &unk_1E6A197C8;
    block[4] = v9;
    id v30 = v4;
    dispatch_async(v13, block);

    uint64_t v14 = v30;
  }
  else
  {
    if (v11)
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v32 = v23;
      __int16 v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Uploading clip %@", buf, 0x16u);
    }
    uint64_t v24 = [(HMDCameraClipFeedbackManager *)v9 feedbackUploader];
    __int16 v25 = [(HMDCameraClipFeedbackManager *)v9 cameraProfileUUID];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __63__HMDCameraClipFeedbackManager__uploadNextClipFromQueryResult___block_invoke_90;
    v26[3] = &unk_1E6A18BA0;
    v26[4] = v9;
    id v27 = v6;
    id v28 = v4;
    [v24 uploadFeedbackWithCameraProfileUUID:v25 clipModel:v27 completionHandler:v26];

    uint64_t v14 = v27;
  }

LABEL_17:
}

uint64_t __63__HMDCameraClipFeedbackManager__uploadNextClipFromQueryResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _uploadNextClipFromQueryResult:*(void *)(a1 + 40)];
}

void __63__HMDCameraClipFeedbackManager__uploadNextClipFromQueryResult___block_invoke_90(id *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = a1[4];
  BOOL v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = a1[5];
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = v8;
      __int16 v25 = 2112;
      id v26 = v9;
      __int16 v27 = 2112;
      id v28 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to upload clip %@: %@", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      id v11 = a1[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v10;
      __int16 v25 = 2112;
      id v26 = v11;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Marking clip as uploaded: %@", buf, 0x16u);
    }
    id v12 = [HMDCameraClipModel alloc];
    __int16 v13 = [a1[5] hmbModelID];
    uint64_t v14 = [a1[5] hmbParentModelID];
    uint64_t v15 = [(HMBModel *)v12 initWithModelID:v13 parentModelID:v14];

    [(HMDCameraClipModel *)v15 setFeedbackStatus:2];
    uint64_t v16 = [a1[4] localZone];
    v17 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
    v18 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Marking clip as uploaded"];
    id v19 = (id)[v16 updateModels:v17 options:v18];
  }
  v20 = [a1[4] workQueue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63__HMDCameraClipFeedbackManager__uploadNextClipFromQueryResult___block_invoke_95;
  v21[3] = &unk_1E6A197C8;
  v21[4] = a1[4];
  id v22 = a1[6];
  dispatch_async(v20, v21);
}

uint64_t __63__HMDCameraClipFeedbackManager__uploadNextClipFromQueryResult___block_invoke_95(uint64_t a1)
{
  return [*(id *)(a1 + 32) _uploadNextClipFromQueryResult:*(void *)(a1 + 40)];
}

- (void)_findAndUploadSubmittedClips
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraClipFeedbackManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDCameraClipFeedbackManager *)self isCurrentDeviceConfirmedPrimaryResident])
  {
    id v4 = [(HMDCameraClipFeedbackManager *)self _performCloudPull];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__HMDCameraClipFeedbackManager__findAndUploadSubmittedClips__block_invoke;
    v10[3] = &unk_1E6A17A30;
    v10[4] = self;
    id v5 = (id)[v4 addCompletionBlock:v10];
  }
  else
  {
    BOOL v6 = (void *)MEMORY[0x1D9452090]();
    uint64_t v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Current device is not a confirmed primary resident, will not upload clips", buf, 0xCu);
    }
  }
}

void __60__HMDCameraClipFeedbackManager__findAndUploadSubmittedClips__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) localZone];
  id v3 = +[HMDCameraClipModel clipsWithNeedsUploadFeedbackStatusQuery];
  id v4 = [v2 queryModelsUsingQuery:v3];

  [*(id *)(a1 + 32) _uploadNextClipFromQueryResult:v4];
}

- (id)_performCloudPull
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraClipFeedbackManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  BOOL v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v19 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Performing cloud pull", buf, 0xCu);
  }
  id v8 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Explicit fetch"];
  id v9 = [(HMDCameraClipFeedbackManager *)v5 cloudZone];
  v10 = [v9 performCloudPullWithOptions:v8];
  id v11 = (void *)MEMORY[0x1E4F7A0F0];
  id v12 = [(HMDCameraClipFeedbackManager *)v5 workQueue];
  uint64_t v13 = [v11 schedulerWithDispatchQueue:v12];
  uint64_t v14 = [v10 reschedule:v13];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__HMDCameraClipFeedbackManager__performCloudPull__block_invoke;
  v17[3] = &unk_1E6A197F0;
  v17[4] = v5;
  uint64_t v15 = [v14 addFailureBlock:v17];

  return v15;
}

void __49__HMDCameraClipFeedbackManager__performCloudPull__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  BOOL v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform cloud pull: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (BOOL)isCurrentDeviceConfirmedPrimaryResident
{
  id v3 = [(HMDCameraClipFeedbackManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraClipFeedbackManager *)self home];
  LOBYTE(v3) = [v4 isCurrentDeviceConfirmedPrimaryResident];

  return (char)v3;
}

- (void)configureWithIsCurrentDeviceResidentCapable:(BOOL)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDCameraClipFeedbackManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (void *)MEMORY[0x1D9452090]();
  uint64_t v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v32 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Configuring clip feedback manager", buf, 0xCu);
  }
  __int16 v10 = [(HMDCameraClipFeedbackManager *)v7 home];
  if (v10)
  {
    id v11 = +[HMDXPCMessagePolicy policyWithEntitlements:133];
    uint64_t v12 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v10 userPrivilege:0 remoteAccessRequired:0];
    uint64_t v13 = [(HMDCameraClipFeedbackManager *)v7 messageDispatcher];
    uint64_t v14 = *MEMORY[0x1E4F2CC20];
    v30[0] = v11;
    v30[1] = v12;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    [v13 registerForMessage:v14 receiver:v7 policies:v15 selector:sel__handleSubmitClipsMessage_];

    if (a3)
    {
      uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v17 = [v10 residentDeviceManager];
      [v16 addObserver:v7 selector:sel_handlePrimaryResidentUpdateNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:v17];

      v18 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
      id v19 = [(HMDCameraClipFeedbackManager *)v7 messageDispatcher];
      uint64_t v29 = v18;
      uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      [v19 registerForMessage:@"HMDCameraClipFeedbackFindAndUploadSubmittedClipsMessage" receiver:v7 policies:v20 selector:sel__handleFindAndUploadSubmittedClipsMessage_];

      [(HMDCameraClipFeedbackManager *)v7 _findAndUploadSubmittedClips];
    }
    else
    {
      __int16 v25 = (void *)MEMORY[0x1D9452090]();
      id v26 = v7;
      __int16 v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v32 = v28;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Current device is not resident capable, clip uploading is not available", buf, 0xCu);
      }
    }
  }
  else
  {
    os_log_type_t v21 = (void *)MEMORY[0x1D9452090]();
    id v22 = v7;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v32 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot configure clip feedback manager because home reference is nil", buf, 0xCu);
    }
  }
}

- (HMDCameraClipFeedbackManager)initWithLocalZone:(id)a3 cloudZone:(id)a4 home:(id)a5 messageDispatcher:(id)a6 cameraProfileUUID:(id)a7 messageTargetUUID:(id)a8 workQueue:(id)a9 feedbackUploader:(id)a10
{
  id v15 = a3;
  id v40 = a4;
  id v16 = a4;
  id v17 = a5;
  id v41 = a6;
  id v18 = a6;
  id v19 = a7;
  id obj = a8;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v43 = v15;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v16)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v17)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v18)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v19)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v20)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v21)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  __int16 v23 = v22;
  if (!v22)
  {
LABEL_19:
    id v30 = (HMDCameraClipFeedbackManager *)_HMFPreconditionFailure();
    return [(HMDCameraClipFeedbackManager *)v30 initWithLocalZone:v32 cloudZone:v33 home:v34 messageDispatcher:v35 cameraProfileUUID:v36 messageTargetUUID:v37 workQueue:a9];
  }
  uint64_t v24 = v17;
  v44.receiver = self;
  v44.super_class = (Class)HMDCameraClipFeedbackManager;
  __int16 v25 = [(HMDCameraClipFeedbackManager *)&v44 init];
  id v26 = v25;
  if (v25)
  {
    objc_storeWeak((id *)&v25->_home, v24);
    uint64_t v27 = [v19 copy];
    cameraProfileUUID = v26->_cameraProfileUUID;
    v26->_cameraProfileUUID = (NSUUID *)v27;

    objc_storeStrong((id *)&v26->_messageTargetUUID, obj);
    objc_storeStrong((id *)&v26->_feedbackUploader, a10);
    objc_storeStrong((id *)&v26->_workQueue, a9);
    objc_storeStrong((id *)&v26->_localZone, a3);
    objc_storeStrong((id *)&v26->_cloudZone, v40);
    objc_storeStrong((id *)&v26->_messageDispatcher, v41);
  }

  return v26;
}

- (HMDCameraClipFeedbackManager)initWithLocalZone:(id)a3 cloudZone:(id)a4 home:(id)a5 messageDispatcher:(id)a6 cameraProfileUUID:(id)a7 messageTargetUUID:(id)a8 workQueue:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v16)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v17)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v18)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v19)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v20)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  id v22 = v21;
  if (v21)
  {
    __int16 v23 = objc_alloc_init(HMDCameraClipFeedbackUploader);
    uint64_t v24 = [(HMDCameraClipFeedbackManager *)self initWithLocalZone:v15 cloudZone:v16 home:v17 messageDispatcher:v18 cameraProfileUUID:v19 messageTargetUUID:v20 workQueue:v22 feedbackUploader:v23];

    return v24;
  }
LABEL_15:
  id v26 = (void *)_HMFPreconditionFailure();
  return (HMDCameraClipFeedbackManager *)+[HMDCameraClipFeedbackManager logCategory];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t23_174236 != -1) {
    dispatch_once(&logCategory__hmf_once_t23_174236, &__block_literal_global_174237);
  }
  int v2 = (void *)logCategory__hmf_once_v24_174238;
  return v2;
}

uint64_t __43__HMDCameraClipFeedbackManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v24_174238;
  logCategory__hmf_once_v24_174238 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end