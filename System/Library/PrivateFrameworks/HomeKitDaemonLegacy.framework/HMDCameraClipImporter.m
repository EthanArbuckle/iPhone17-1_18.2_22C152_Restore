@interface HMDCameraClipImporter
+ (id)logCategory;
- (HMBLocalZone)localZone;
- (HMDCameraClipImporter)initWithLocalZone:(id)a3 cameraProfileUUID:(id)a4;
- (NSString)logIdentifier;
- (NSUUID)cameraProfileUUID;
- (OS_dispatch_queue)workQueue;
- (id)importClipsWithImportData:(id)a3;
@end

@implementation HMDCameraClipImporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraProfileUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (NSUUID)cameraProfileUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)importClipsWithImportData:(id)a3
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  v75 = v4;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v115 = v8;
    __int16 v116 = 2112;
    v117 = v75;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Importing clips using import data: %@", buf, 0x16u);

    id v4 = v75;
  }

  v9 = objc_msgSend(v4, "na_map:", &__block_literal_global_152419);
  v10 = (void *)MEMORY[0x1E4F7A0F0];
  v11 = [(HMDCameraClipImporter *)v6 workQueue];
  v86 = [v10 schedulerWithDispatchQueue:v11];

  v85 = [MEMORY[0x1E4F1CA48] array];
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id obj = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v110 objects:v121 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v111;
    v82 = v6;
    uint64_t v76 = *(void *)v111;
    do
    {
      uint64_t v15 = 0;
      uint64_t v77 = v13;
      do
      {
        if (*(void *)v111 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v110 + 1) + 8 * v15);
        v17 = [v16 videoSegments];
        v18 = [v17 firstObject];
        char v19 = [v18 isHeader];

        if (v19)
        {
          v20 = [HMDCameraClipUploader alloc];
          v21 = [MEMORY[0x1E4F29128] UUID];
          v22 = [v16 startDate];
          [v16 targetFragmentDuration];
          double v24 = v23;
          v25 = [(HMDCameraClipImporter *)v6 localZone];
          v26 = [(HMDCameraClipImporter *)v6 workQueue];
          v27 = [(HMDCameraClipImporter *)v82 logIdentifier];
          uint64_t v28 = [(HMDCameraClipUploader *)v20 initWithClipUUID:v21 startDate:v22 targetFragmentDuration:0 quality:v25 localZone:v26 workQueue:v27 logIdentifier:v24];

          v6 = v82;
          v29 = (void *)v28;

          v30 = [v16 posterFrames];
          v31 = [v30 firstObject];

          if (v31)
          {
            v32 = (void *)MEMORY[0x1E4F7A0D8];
            v106[0] = MEMORY[0x1E4F143A8];
            v106[1] = 3221225472;
            v106[2] = __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_43;
            v106[3] = &unk_1E6A13CF0;
            id v107 = v31;
            v108 = v82;
            id v109 = v29;
            v33 = [v32 lazyFutureWithBlock:v106 scheduler:v86];
            [v85 addObject:v33];
          }
          v34 = [v16 posterFrames];
          v35 = [v34 lastObject];

          if (v35)
          {
            v36 = (void *)MEMORY[0x1E4F7A0D8];
            v102[0] = MEMORY[0x1E4F143A8];
            v102[1] = 3221225472;
            v102[2] = __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_48;
            v102[3] = &unk_1E6A13CF0;
            id v103 = v35;
            v104 = v82;
            id v105 = v29;
            v37 = [v36 lazyFutureWithBlock:v102 scheduler:v86];
            [v85 addObject:v37];
          }
          v79 = v35;
          v80 = v31;
          v84 = v29;
          uint64_t v81 = v15;
          long long v100 = 0u;
          long long v101 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          id v83 = [v16 videoSegments];
          uint64_t v38 = [v83 countByEnumeratingWithState:&v98 objects:v120 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v99;
            double v41 = 0.0;
            do
            {
              for (uint64_t i = 0; i != v39; ++i)
              {
                if (*(void *)v99 != v40) {
                  objc_enumerationMutation(v83);
                }
                v43 = *(void **)(*((void *)&v98 + 1) + 8 * i);
                v44 = (void *)MEMORY[0x1E4F1C9B8];
                v45 = [v43 resourcePath];
                id v97 = 0;
                v46 = [v44 dataWithContentsOfFile:v45 options:0 error:&v97];
                id v47 = v97;

                if (v46)
                {
                  int v48 = [v43 isHeader];
                  v49 = (void *)MEMORY[0x1E4F7A0D8];
                  if (v48)
                  {
                    v94[0] = MEMORY[0x1E4F143A8];
                    v94[1] = 3221225472;
                    v94[2] = __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_49;
                    v94[3] = &unk_1E6A13CF0;
                    v94[4] = v6;
                    id v95 = v46;
                    id v96 = v84;
                    v50 = [v49 lazyFutureWithBlock:v94 scheduler:v86];
                    [v85 addObject:v50];

                    v51 = v95;
                  }
                  else
                  {
                    v89[0] = MEMORY[0x1E4F143A8];
                    v89[1] = 3221225472;
                    v89[2] = __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_50;
                    v89[3] = &unk_1E6A13D18;
                    v89[4] = v6;
                    id v90 = v46;
                    v91 = v43;
                    id v92 = v84;
                    double v93 = v41;
                    v59 = [v49 lazyFutureWithBlock:v89 scheduler:v86];
                    [v85 addObject:v59];

                    [v43 duration];
                    double v41 = v41 + v60;

                    v51 = v90;
                  }
                }
                else
                {
                  uint64_t v52 = MEMORY[0x1D9452090]();
                  v53 = v6;
                  v54 = (void *)v52;
                  v55 = v53;
                  v56 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    v57 = HMFGetLogIdentifier();
                    v58 = [v43 resourcePath];
                    *(_DWORD *)buf = 138543874;
                    v115 = v57;
                    __int16 v116 = 2112;
                    v117 = v58;
                    __int16 v118 = 2112;
                    id v119 = v47;
                    _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_ERROR, "%{public}@Could not load data from %@: %@", buf, 0x20u);
                  }
                  v6 = v82;
                }
              }
              uint64_t v39 = [v83 countByEnumeratingWithState:&v98 objects:v120 count:16];
            }
            while (v39);
          }

          v61 = (void *)MEMORY[0x1E4F7A0D8];
          v87[0] = MEMORY[0x1E4F143A8];
          v87[1] = 3221225472;
          v87[2] = __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_51;
          v87[3] = &unk_1E6A15F20;
          id v88 = v84;
          id v62 = v84;
          v63 = [v61 lazyFutureWithBlock:v87 scheduler:v86];
          [v85 addObject:v63];

          uint64_t v14 = v76;
          uint64_t v13 = v77;
          uint64_t v15 = v81;
        }
        else
        {
          v64 = (void *)MEMORY[0x1D9452090]();
          v65 = v6;
          v66 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            v67 = HMFGetLogIdentifier();
            v68 = [v16 videoSegments];
            v69 = [v68 firstObject];
            v70 = [v69 resourcePath];
            *(_DWORD *)buf = 138543618;
            v115 = v67;
            __int16 v116 = 2112;
            v117 = v70;
            _os_log_impl(&dword_1D49D5000, v66, OS_LOG_TYPE_ERROR, "%{public}@First fragment in clip %@ is not header, skipping", buf, 0x16u);
          }
          v6 = v82;
        }
        ++v15;
      }
      while (v15 != v13);
      uint64_t v13 = [obj countByEnumeratingWithState:&v110 objects:v121 count:16];
    }
    while (v13);
  }

  v71 = (void *)MEMORY[0x1E4F7A0D8];
  v72 = (void *)[v85 copy];
  v73 = [v71 chainFutures:v72];

  return v73;
}

void __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_43(id *a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F1C9B8];
  v5 = [a1[4] resourcePath];
  v6 = [v4 dataWithContentsOfFile:v5];

  v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = a1[5];
  v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v11 = HMFGetLogIdentifier();
      uint64_t v12 = [v6 length];
      uint64_t v13 = [a1[4] resourcePath];
      int v22 = 138543874;
      double v23 = v11;
      __int16 v24 = 2048;
      uint64_t v25 = v12;
      __int16 v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Loaded %lu bytes of hero frame data from %@", (uint8_t *)&v22, 0x20u);
    }
    uint64_t v14 = [HMDMutableCameraRecordingSessionSignificantEvent alloc];
    uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    v16 = [(HMDCameraRecordingSessionSignificantEvent *)v14 initWithUUID:v15];

    [(HMDCameraRecordingSessionSignificantEvent *)v16 setReason:2];
    [(HMDCameraRecordingSessionSignificantEvent *)v16 setConfidenceLevel:100];
    [(HMDCameraRecordingSessionSignificantEvent *)v16 setHeroFrameData:v6];
    v17 = [a1[6] addNotificationForSignificantEvent:v16 homePresenceByPairingIdentity:MEMORY[0x1E4F1CC08]];
    v18 = [v3 completionHandlerAdapter];
    id v19 = (id)[v17 addCompletionBlock:v18];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      v21 = [a1[4] resourcePath];
      int v22 = 138543618;
      double v23 = v20;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v21;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Could not load data from %@", (uint8_t *)&v22, 0x16u);
    }
    v16 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
    [v3 finishWithError:v16];
  }
}

void __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_48(id *a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F1C9B8];
  v5 = [a1[4] resourcePath];
  v6 = [v4 dataWithContentsOfFile:v5];

  v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = a1[5];
  v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v11 = HMFGetLogIdentifier();
      uint64_t v12 = [v6 length];
      uint64_t v13 = [a1[4] resourcePath];
      int v22 = 138543874;
      double v23 = v11;
      __int16 v24 = 2048;
      uint64_t v25 = v12;
      __int16 v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Loaded %lu bytes of hero frame data from %@", (uint8_t *)&v22, 0x20u);
    }
    uint64_t v14 = [HMDMutableCameraRecordingSessionSignificantEvent alloc];
    uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    v16 = [(HMDCameraRecordingSessionSignificantEvent *)v14 initWithUUID:v15];

    [(HMDCameraRecordingSessionSignificantEvent *)v16 setReason:3];
    [(HMDCameraRecordingSessionSignificantEvent *)v16 setConfidenceLevel:100];
    [(HMDCameraRecordingSessionSignificantEvent *)v16 setHeroFrameData:v6];
    v17 = [a1[6] addNotificationForSignificantEvent:v16 homePresenceByPairingIdentity:MEMORY[0x1E4F1CC08]];
    v18 = [v3 completionHandlerAdapter];
    id v19 = (id)[v17 addCompletionBlock:v18];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      v21 = [a1[4] resourcePath];
      int v22 = 138543618;
      double v23 = v20;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v21;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Could not load data from %@", (uint8_t *)&v22, 0x16u);
    }
    v16 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
    [v3 finishWithError:v16];
  }
}

void __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_49(id *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = a1[4];
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    id v8 = [a1[5] shortDescription];
    int v12 = 138543618;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Found new video init data: %@", (uint8_t *)&v12, 0x16u);
  }
  v9 = [a1[6] addVideoInitData:a1[5]];
  v10 = [v3 completionHandlerAdapter];
  id v11 = (id)[v9 addCompletionBlock:v10];
}

void __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_50(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = HMFGetLogIdentifier();
    uint64_t v8 = [*(id *)(a1 + 40) length];
    v9 = [*(id *)(a1 + 48) resourcePath];
    int v15 = 138543874;
    uint64_t v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Loaded %lu bytes from %@", (uint8_t *)&v15, 0x20u);
  }
  v10 = *(void **)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 40);
  [*(id *)(a1 + 48) duration];
  int v12 = objc_msgSend(v10, "addVideoSegmentData:duration:timeOffsetWithinClip:clipFinalizedBecauseMaxDurationExceeded:", v11, 0);
  uint64_t v13 = [v3 completionHandlerAdapter];
  id v14 = (id)[v12 addCompletionBlock:v13];
}

void __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke_51(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v2 finish];
  id v4 = [v3 completionHandlerAdapter];

  id v5 = (id)[v6 addCompletionBlock:v4];
}

id __51__HMDCameraClipImporter_importClipsWithImportData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HMDCameraClipImportMetadata alloc] initClipData:v2];

  return v3;
}

- (HMDCameraClipImporter)initWithLocalZone:(id)a3 cameraProfileUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v20 = (void *)_HMFPreconditionFailure();
    return (HMDCameraClipImporter *)+[HMDCameraClipImporter logCategory];
  }
  v22.receiver = self;
  v22.super_class = (Class)HMDCameraClipImporter;
  v10 = [(HMDCameraClipImporter *)&v22 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_localZone, a3);
    int v12 = (const char *)HMFDispatchQueueName();
    uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
    workQueue = v11->_workQueue;
    v11->_workQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v17 = [v16 UUIDString];
    logIdentifier = v11->_logIdentifier;
    v11->_logIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v11->_cameraProfileUUID, a4);
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_152569 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_152569, &__block_literal_global_54_152570);
  }
  id v2 = (void *)logCategory__hmf_once_v10_152571;
  return v2;
}

uint64_t __36__HMDCameraClipImporter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v10_152571;
  logCategory__hmf_once_v10_152571 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end