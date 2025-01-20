@interface HMDCameraClipUserNotificationCenter
+ (id)logCategory;
- (HMDCameraBulletinBoard)bulletinBoard;
- (HMDCameraClipUserNotificationCenter)initWithBulletinBoard:(id)a3 workQueue:(id)a4 logIdentifier:(id)a5;
- (HMDCameraClipUserNotificationCenter)initWithBulletinBoard:(id)a3 workQueue:(id)a4 logIdentifier:(id)a5 fileManager:(id)a6;
- (HMDFileManager)fileManager;
- (NSString)logIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)_firstAvailableHeroFrameURLForSignificantEvents:(id)a3 cameraProfile:(id)a4;
- (id)_writeHeroFrameData:(id)a3;
- (id)bulletinForClipSignificantEvent:(id)a3 cameraProfile:(id)a4;
- (void)_insertClipSignificantEventBulletin:(id)a3;
- (void)postNotificationForBulletin:(id)a3 significantEvent:(id)a4;
- (void)removeCachedHeroFrameImages;
- (void)removeEventNotificationForClipWithUUID:(id)a3;
- (void)removeEventNotificationsForCameraProfile:(id)a3;
@end

@implementation HMDCameraClipUserNotificationCenter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_bulletinBoard, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (HMDFileManager)fileManager
{
  return (HMDFileManager *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMDCameraBulletinBoard)bulletinBoard
{
  return (HMDCameraBulletinBoard *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)_firstAvailableHeroFrameURLForSignificantEvents:(id)a3 cameraProfile:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
      v14 = objc_msgSend(v7, "clipManager", (void)v20);
      v15 = [v13 uniqueIdentifier];
      v16 = [v14 heroFrameURLForSignificantEventWithUUID:v15];

      if (v16)
      {
        v17 = [(HMDCameraClipUserNotificationCenter *)self fileManager];
        char v18 = [v17 fileExistsAtURL:v16];

        if (v18) {
          break;
        }
      }

      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v16 = 0;
  }

  return v16;
}

- (id)_writeHeroFrameData:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraClipUserNotificationCenter *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraClipUserNotificationCenter *)self fileManager];
  id v7 = [v6 heroFrameStoreDirectoryURL];

  id v8 = [(HMDCameraClipUserNotificationCenter *)self fileManager];
  id v29 = 0;
  char v9 = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v29];
  id v10 = v29;

  if (v9)
  {
    uint64_t v11 = [MEMORY[0x263F08C38] UUID];
    uint64_t v12 = [v11 UUIDString];
    v13 = [v12 stringByAppendingPathExtension:@"jpg"];

    v14 = [v7 URLByAppendingPathComponent:v13];
    v15 = [(HMDCameraClipUserNotificationCenter *)self fileManager];
    id v28 = v10;
    char v16 = [v15 writeData:v4 toURL:v14 options:0 error:&v28];
    id v17 = v28;

    if (v16)
    {
      id v18 = v14;
    }
    else
    {
      long long v23 = (void *)MEMORY[0x230FBD990]();
      v24 = self;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v31 = v26;
        __int16 v32 = 2112;
        v33 = v14;
        __int16 v34 = 2112;
        id v35 = v17;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to write hero frame data to %@ error: %@", buf, 0x20u);
      }
      id v18 = 0;
    }

    id v10 = v17;
  }
  else
  {
    v19 = (void *)MEMORY[0x230FBD990]();
    long long v20 = self;
    long long v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      long long v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v31 = v22;
      __int16 v32 = 2112;
      v33 = v7;
      __int16 v34 = 2112;
      id v35 = v10;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to create hero frame directory at URL %@: %@", buf, 0x20u);
    }
    id v18 = 0;
  }

  return v18;
}

- (void)_insertClipSignificantEventBulletin:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraClipUserNotificationCenter *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    char v9 = HMFGetLogIdentifier();
    id v10 = [v4 significantEvents];
    uint64_t v11 = [v4 previewImageFilePathURL];
    int v13 = 138543874;
    v14 = v9;
    __int16 v15 = 2112;
    char v16 = v10;
    __int16 v17 = 2112;
    id v18 = v11;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Inserting bulletin with clip significant events: %@ hero frame URL: %@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v12 = [(HMDCameraClipUserNotificationCenter *)v7 bulletinBoard];
  [v12 insertCameraClipSignificantEventBulletin:v4];
}

- (void)removeCachedHeroFrameImages
{
  v3 = [(HMDCameraClipUserNotificationCenter *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraClipUserNotificationCenter *)self fileManager];
  v5 = [(HMDCameraClipUserNotificationCenter *)self fileManager];
  id v6 = [v5 heroFrameStoreDirectoryURL];
  [v4 removeItemAtURL:v6 error:0];

  id v9 = [(HMDCameraClipUserNotificationCenter *)self fileManager];
  id v7 = [(HMDCameraClipUserNotificationCenter *)self fileManager];
  id v8 = [v7 legacyHeroFrameStoreDirectoryURL];
  [v9 removeItemAtURL:v8 error:0];
}

- (void)removeEventNotificationsForCameraProfile:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraClipUserNotificationCenter *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing camera clip bulletins for camera profile: %@", (uint8_t *)&v11, 0x16u);
  }
  id v10 = [(HMDCameraClipUserNotificationCenter *)v7 bulletinBoard];
  [v10 removeCameraClipBulletinsForCameraProfile:v4];
}

- (void)removeEventNotificationForClipWithUUID:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraClipUserNotificationCenter *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier();
    int v12 = 138543618;
    __int16 v13 = v9;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Removing bulletin for clip with UUID: %@", (uint8_t *)&v12, 0x16u);
  }
  id v10 = [(HMDCameraClipUserNotificationCenter *)v7 bulletinBoard];
  int v11 = [v4 UUIDString];
  [v10 removeBulletinWithRecordID:v11];
}

- (void)postNotificationForBulletin:(id)a3 significantEvent:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 previewImageFilePathURL];

  if (v8)
  {
    [(HMDCameraClipUserNotificationCenter *)self _insertClipSignificantEventBulletin:v6];
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v22 = v12;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Fetching hero frame URL to post notification for significant event: %@", buf, 0x16u);
    }
    __int16 v13 = [v6 camera];
    __int16 v14 = [v13 clipManager];
    id v15 = [v7 uniqueIdentifier];
    uint64_t v16 = [v14 fetchHeroFrameURLForSignificantEventWithUUID:v15];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __84__HMDCameraClipUserNotificationCenter_postNotificationForBulletin_significantEvent___block_invoke;
    v18[3] = &unk_264A2AF50;
    v18[4] = v10;
    id v19 = v7;
    id v20 = v6;
    id v17 = (id)[v16 addCompletionBlock:v18];
  }
}

void __84__HMDCameraClipUserNotificationCenter_postNotificationForBulletin_significantEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (!v10) {
      goto LABEL_7;
    }
    int v11 = HMFGetLogIdentifier();
    uint64_t v12 = *(void *)(a1 + 40);
    int v20 = 138543618;
    long long v21 = v11;
    __int16 v22 = 2112;
    uint64_t v23 = v12;
    __int16 v13 = "%{public}@Posting notification after fetching hero frame URL for significant event: %@";
    __int16 v14 = v9;
    uint32_t v15 = 22;
  }
  else
  {
    if (!v10) {
      goto LABEL_7;
    }
    int v11 = HMFGetLogIdentifier();
    int v20 = 138543362;
    long long v21 = v11;
    __int16 v13 = "%{public}@Fetch did not result in a hero frame being downloaded";
    __int16 v14 = v9;
    uint32_t v15 = 12;
  }
  _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v20, v15);

LABEL_7:
  uint64_t v16 = *(void **)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  id v18 = [*(id *)(a1 + 48) camera];
  id v19 = [v16 bulletinForClipSignificantEvent:v17 cameraProfile:v18];

  if (v19) {
    [*(id *)(a1 + 32) _insertClipSignificantEventBulletin:v19];
  }
}

- (id)bulletinForClipSignificantEvent:(id)a3 cameraProfile:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 accessory];
  id v9 = v8;
  if (v8)
  {
    v43 = [v8 home];
    if (v43)
    {
      v41 = [v7 recordingManagementService];
      BOOL v10 = [v7 clipManager];
      int v11 = [v6 clipUUID];
      uint64_t v12 = [v10 significantEventsForClipWithUUID:v11];

      v42 = v9;
      if (![v12 count])
      {
        __int16 v13 = (void *)MEMORY[0x230FBD990]();
        __int16 v14 = self;
        uint32_t v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = HMFGetLogIdentifier();
          uint64_t v17 = [v6 clipUUID];
          *(_DWORD *)buf = 138543618;
          v45 = v16;
          __int16 v46 = 2112;
          id v47 = v17;
          _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not find any significant events for clip with UUID %@", buf, 0x16u);
        }
        uint64_t v18 = [MEMORY[0x263EFFA08] setWithObject:v6];

        uint64_t v12 = (void *)v18;
      }
      id v19 = [v12 allObjects];
      int v20 = [v19 sortedArrayUsingComparator:&__block_literal_global_241131];

      [(HMDCameraClipUserNotificationCenter *)self _firstAvailableHeroFrameURLForSignificantEvents:v20 cameraProfile:v7];
      v40 = v39 = v20;
      long long v21 = [v20 firstObject];
      __int16 v22 = [v21 uniqueIdentifier];

      uint64_t v23 = [v20 lastObject];
      uint64_t v24 = [v23 dateOfOccurrence];

      LOBYTE(v23) = objc_msgSend(v12, "na_allObjectsPassTest:", &__block_literal_global_4_241132);
      uint64_t v25 = [HMDCameraClipSignificantEventBulletin alloc];
      [v6 clipUUID];
      v27 = id v26 = v6;
      LOBYTE(v38) = (_BYTE)v23;
      id v9 = v42;
      id v28 = [(HMDCameraClipSignificantEventBulletin *)v25 initWithSignificantEvents:v12 previewImageNotificationUUID:v22 previewImageFilePathURL:v40 dateOfOccurrence:v24 camera:v7 home:v43 accessory:v42 recordingService:v41 clipUUID:v27 shouldShowProvideFeedbackButton:v38];

      id v6 = v26;
    }
    else
    {
      v33 = (void *)MEMORY[0x230FBD990]();
      __int16 v34 = self;
      id v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        uint64_t v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v45 = v36;
        __int16 v46 = 2112;
        id v47 = v9;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Could not create a bulletin for clip significant event because the home is nil for accessory: %@", buf, 0x16u);
      }
      id v28 = 0;
    }
  }
  else
  {
    id v29 = (void *)MEMORY[0x230FBD990]();
    v30 = self;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      __int16 v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v45 = v32;
      __int16 v46 = 2112;
      id v47 = v7;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Could not create a bulletin for clip significant event because the accessory is nil for camera profile: %@", buf, 0x16u);
    }
    id v28 = 0;
  }

  return v28;
}

uint64_t __85__HMDCameraClipUserNotificationCenter_bulletinForClipSignificantEvent_cameraProfile___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 canAskForUserFeedback];
}

uint64_t __85__HMDCameraClipUserNotificationCenter_bulletinForClipSignificantEvent_cameraProfile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 dateOfOccurrence];
  id v6 = [v4 dateOfOccurrence];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (HMDCameraClipUserNotificationCenter)initWithBulletinBoard:(id)a3 workQueue:(id)a4 logIdentifier:(id)a5 fileManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDCameraClipUserNotificationCenter;
  uint32_t v15 = [(HMDCameraClipUserNotificationCenter *)&v18 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bulletinBoard, a3);
    objc_storeStrong((id *)&v16->_workQueue, a4);
    objc_storeStrong((id *)&v16->_logIdentifier, a5);
    objc_storeStrong((id *)&v16->_fileManager, a6);
  }

  return v16;
}

- (HMDCameraClipUserNotificationCenter)initWithBulletinBoard:(id)a3 workQueue:(id)a4 logIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(HMDFileManager);
  id v12 = [(HMDCameraClipUserNotificationCenter *)self initWithBulletinBoard:v10 workQueue:v9 logIdentifier:v8 fileManager:v11];

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_241144 != -1) {
    dispatch_once(&logCategory__hmf_once_t11_241144, &__block_literal_global_11_241145);
  }
  v2 = (void *)logCategory__hmf_once_v12_241146;
  return v2;
}

void __50__HMDCameraClipUserNotificationCenter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v12_241146;
  logCategory__hmf_once_v12_241146 = v0;
}

@end