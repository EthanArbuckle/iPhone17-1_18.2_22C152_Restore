@interface HMCameraClipManager
+ (id)logCategory;
+ (id)zoneNameForRecordingManagementServiceUUID:(id)a3;
- (HMCameraClipManager)initWithContext:(id)a3 profileUniqueIdentifier:(id)a4 zoneName:(id)a5;
- (HMCameraClipManager)initWithContext:(id)a3 profileUniqueIdentifier:(id)a4 zoneName:(id)a5 notificationCenter:(id)a6;
- (NSMapTable)delegateCallersByObservers;
- (NSMutableDictionary)clipsByFetchUUID;
- (NSMutableDictionary)significantEventsByFetchUUID;
- (NSMutableDictionary)videoAssetContextsByClipUUID;
- (NSNotificationCenter)notificationCenter;
- (NSString)zoneName;
- (NSUUID)profileUniqueIdentifier;
- (_HMContext)context;
- (id)fetchClientFactory;
- (id)logIdentifier;
- (id)videoSegmentsAssetContextForClip:(id)a3;
- (void)addObserver:(id)a3;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)configure;
- (void)dealloc;
- (void)deleteAllClipsWithCompletionHandler:(id)a3;
- (void)deleteClipWithUUID:(id)a3 completion:(id)a4;
- (void)donateClipsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchAllClipsWithCompletion:(id)a3;
- (void)fetchAllSignificantEventsWithCompletion:(id)a3;
- (void)fetchClipForSignificantEventWithUUID:(id)a3 completion:(id)a4;
- (void)fetchClipWithUUID:(id)a3 completion:(id)a4;
- (void)fetchClipsWithDateInterval:(id)a3 limit:(unint64_t)a4 shouldOrderAscending:(BOOL)a5 completion:(id)a6;
- (void)fetchClipsWithDateInterval:(id)a3 quality:(int64_t)a4 limit:(unint64_t)a5 shouldOrderAscending:(BOOL)a6 completion:(id)a7;
- (void)fetchCountOfAllClipsWithCompletion:(id)a3;
- (void)fetchCountOfClipsWithDateInterval:(id)a3 completion:(id)a4;
- (void)fetchCountOfClipsWithDateInterval:(id)a3 quality:(int64_t)a4 completion:(id)a5;
- (void)fetchFaceCropDataRepresentationForSignificantEventWithUUID:(id)a3 completion:(id)a4;
- (void)fetchFaceCropURLForSignificantEventWithUUID:(id)a3 completion:(id)a4;
- (void)fetchHeroFrameDataRepresentationForClipWithUUID:(id)a3 completion:(id)a4;
- (void)fetchHeroFrameURLOfClipWithUUID:(id)a3 completion:(id)a4;
- (void)fetchIsCloudStorageEnabledWithCompletion:(id)a3;
- (void)fetchSignificantEventsWithDateInterval:(id)a3 limit:(unint64_t)a4 completion:(id)a5;
- (void)fetchSignificantEventsWithDateInterval:(id)a3 limit:(unint64_t)a4 shouldOrderAscending:(BOOL)a5 completion:(id)a6;
- (void)fetchSignificantEventsWithUUIDs:(id)a3 completion:(id)a4;
- (void)fetchVideoSegmentsAssetContextForClip:(id)a3 completion:(id)a4;
- (void)handleDaemonReconnectedNotification:(id)a3;
- (void)handleDidChangeClipsMessage:(id)a3;
- (void)handleDidChangeSignificantEventsMessage:(id)a3;
- (void)handleFaceMisclassificationForSignificantEvent:(id)a3 completion:(id)a4;
- (void)importClipsWithImportData:(id)a3 completion:(id)a4;
- (void)performCloudPullWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCloudStorageEnabled:(BOOL)a3 completion:(id)a4;
- (void)setFetchClientFactory:(id)a3;
- (void)subscribe;
- (void)unsubscribe;
- (void)updateVideoSegmentsAssetContextForClip:(id)a3;
@end

@implementation HMCameraClipManager

- (void)configure
{
  v3 = [(HMCameraClipManager *)self context];
  v4 = [v3 messageDispatcher];
  [v4 registerForMessage:@"HMCCM.m.dcc" receiver:self selector:sel_handleDidChangeClipsMessage_];

  v5 = [(HMCameraClipManager *)self context];
  v6 = [v5 messageDispatcher];
  [v6 registerForMessage:@"HMCCM.m.dcse" receiver:self selector:sel_handleDidChangeSignificantEventsMessage_];

  id v7 = [(HMCameraClipManager *)self notificationCenter];
  [v7 addObserver:self selector:sel_handleDaemonReconnectedNotification_ name:@"HMDaemonReconnectedNotification" object:0];
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 24, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchClientFactory, 0);
  objc_storeStrong((id *)&self->_delegateCallersByObservers, 0);
  objc_storeStrong((id *)&self->_videoAssetContextsByClipUUID, 0);
  objc_storeStrong((id *)&self->_significantEventsByFetchUUID, 0);
  objc_storeStrong((id *)&self->_clipsByFetchUUID, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_profileUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_zoneName, 0);
}

- (void)setFetchClientFactory:(id)a3
{
}

- (id)fetchClientFactory
{
  return objc_getProperty(self, a2, 80, 1);
}

- (NSMapTable)delegateCallersByObservers
{
  return (NSMapTable *)objc_getProperty(self, a2, 72, 1);
}

- (NSMutableDictionary)videoAssetContextsByClipUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (NSMutableDictionary)significantEventsByFetchUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableDictionary)clipsByFetchUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)profileUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)zoneName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  v2 = [(HMCameraClipManager *)self profileUniqueIdentifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)handleDaemonReconnectedNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling daemon reconnected notification by reconnecting to daemon if necessary", (uint8_t *)&v10, 0xCu);
  }
  os_unfair_lock_lock_with_options();
  uint64_t v9 = [(NSMapTable *)v6->_delegateCallersByObservers count];
  os_unfair_lock_unlock(&v6->_lock);
  if (v9) {
    [(HMCameraClipManager *)v6 subscribe];
  }
}

- (void)handleDidChangeSignificantEventsMessage:(id)a3
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  v5 = self;
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v36 = v7;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling significant events changed message", buf, 0xCu);
  }
  v41[0] = objc_opt_class();
  v41[1] = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  v23 = [v20 unarchivedObjectForKey:@"HMCCM.mk.use" ofClasses:v8];

  v22 = [v20 setForKey:@"HMCCM.mk.rseu"];
  os_unfair_lock_lock_with_options();
  v24 = (void *)[(NSMapTable *)v5->_delegateCallersByObservers copy];
  os_unfair_lock_unlock(&v5->_lock);
  uint64_t v9 = (void *)MEMORY[0x19F3A64A0]();
  int v10 = v5;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    uint64_t v13 = [v23 count];
    uint64_t v14 = [v22 count];
    *(_DWORD *)buf = 138543874;
    v36 = v12;
    __int16 v37 = 2048;
    uint64_t v38 = v13;
    __int16 v39 = 2048;
    uint64_t v40 = v14;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Received %lu updated significant events, %lu removed significant event UUIDs", buf, 0x20u);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [v24 keyEnumerator];
  uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        v19 = [v24 objectForKey:v18];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __63__HMCameraClipManager_handleDidChangeSignificantEventsMessage___block_invoke;
        v25[3] = &unk_1E5944F20;
        id v26 = v23;
        uint64_t v27 = v18;
        v28 = v10;
        id v29 = v22;
        [v19 invokeBlock:v25];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v15);
  }

  [v20 respondWithPayload:0];
}

uint64_t __63__HMCameraClipManager_handleDidChangeSignificantEventsMessage___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count] && (objc_opt_respondsToSelector() & 1) != 0) {
    [*(id *)(a1 + 40) clipManager:*(void *)(a1 + 48) didUpdateSignificantEvents:*(void *)(a1 + 32)];
  }
  uint64_t result = [*(id *)(a1 + 56) count];
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      v3 = *(void **)(a1 + 40);
      uint64_t v4 = *(void *)(a1 + 48);
      uint64_t v5 = *(void *)(a1 + 56);
      return [v3 clipManager:v4 didRemoveSignificantEventsWithUUIDs:v5];
    }
  }
  return result;
}

- (void)handleDidChangeClipsMessage:(id)a3
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  uint64_t v4 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v5 = self;
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v44 = v7;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling clips changed message", buf, 0xCu);
  }
  v50[0] = objc_opt_class();
  v50[1] = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  uint64_t v9 = [v25 unarchivedObjectForKey:@"HMCCM.mk.uc" ofClasses:v8];

  uint64_t v27 = [v25 setForKey:@"HMCCM.mk.rcu"];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v10);
        }
        [(HMCameraClipManager *)v5 updateVideoSegmentsAssetContextForClip:*(void *)(*((void *)&v38 + 1) + 8 * i)];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v49 count:16];
    }
    while (v11);
  }

  os_unfair_lock_lock_with_options();
  v28 = (void *)[(NSMapTable *)v5->_delegateCallersByObservers copy];
  os_unfair_lock_unlock(&v5->_lock);
  uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v15 = v5;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    uint64_t v18 = [v10 count];
    uint64_t v19 = [v27 count];
    *(_DWORD *)buf = 138543874;
    v44 = v17;
    __int16 v45 = 2048;
    uint64_t v46 = v18;
    __int16 v47 = 2048;
    uint64_t v48 = v19;
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Received %lu updated clips, %lu removed clip UUIDs", buf, 0x20u);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [v28 keyEnumerator];
  uint64_t v20 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v34 + 1) + 8 * j);
        v24 = [v28 objectForKey:v23];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __51__HMCameraClipManager_handleDidChangeClipsMessage___block_invoke;
        v29[3] = &unk_1E5944F20;
        id v30 = v10;
        uint64_t v31 = v23;
        long long v32 = v15;
        id v33 = v27;
        [v24 invokeBlock:v29];
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v20);
  }

  [v25 respondWithPayload:0];
}

uint64_t __51__HMCameraClipManager_handleDidChangeClipsMessage___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count] && (objc_opt_respondsToSelector() & 1) != 0) {
    [*(id *)(a1 + 40) clipManager:*(void *)(a1 + 48) didUpdateClips:*(void *)(a1 + 32)];
  }
  uint64_t result = [*(id *)(a1 + 56) count];
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      v3 = *(void **)(a1 + 40);
      uint64_t v4 = *(void *)(a1 + 48);
      uint64_t v5 = *(void *)(a1 + 56);
      return [v3 clipManager:v4 didRemoveClipsWithUUIDs:v5];
    }
  }
  return result;
}

- (void)unsubscribe
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  uint64_t v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing from camera clip changes", (uint8_t *)&v13, 0xCu);
  }
  id v7 = objc_alloc(MEMORY[0x1E4F65488]);
  v8 = [(HMCameraClipManager *)v4 profileUniqueIdentifier];
  uint64_t v9 = (void *)[v7 initWithTarget:v8];

  id v10 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCCM.m.u" destination:v9 payload:0];
  uint64_t v11 = [(HMCameraClipManager *)v4 context];
  uint64_t v12 = [v11 messageDispatcher];
  [v12 sendMessage:v10 completionHandler:0];
}

- (void)subscribe
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  uint64_t v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Subscribing to camera clip changes", (uint8_t *)&v13, 0xCu);
  }
  id v7 = objc_alloc(MEMORY[0x1E4F65488]);
  v8 = [(HMCameraClipManager *)v4 profileUniqueIdentifier];
  uint64_t v9 = (void *)[v7 initWithTarget:v8];

  id v10 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCCM.m.s" destination:v9 payload:0];
  uint64_t v11 = [(HMCameraClipManager *)v4 context];
  uint64_t v12 = [v11 messageDispatcher];
  [v12 sendMessage:v10 completionHandler:0];
}

- (void)updateVideoSegmentsAssetContextForClip:(id)a3
{
  id v20 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  videoAssetContextsByClipUUID = self->_videoAssetContextsByClipUUID;
  v6 = [v20 uniqueIdentifier];
  id v7 = [(NSMutableDictionary *)videoAssetContextsByClipUUID objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = [HMCameraClipVideoHLSPlaylistGenerator alloc];
    uint64_t v9 = [v7 url];
    id v10 = [(HMCameraClipVideoHLSPlaylistGenerator *)v8 initWithClip:v20 url:v9];

    uint64_t v11 = [v20 videoSegments];
    [(HMCameraClipVideoHLSPlaylistGenerator *)v10 addSegments:v11];

    if ([v20 isComplete]) {
      [(HMCameraClipVideoHLSPlaylistGenerator *)v10 finish];
    }
    uint64_t v12 = [(HMCameraClipVideoHLSPlaylistGenerator *)v10 hlsPlaylist];
    int v13 = [HMCameraClipVideoAssetContext alloc];
    uint64_t v14 = [v7 url];
    uint64_t v15 = [v7 expirationDate];
    uint64_t v16 = [v7 requiredHTTPHeaders];
    v17 = [(HMCameraClipVideoAssetContext *)v13 initWithURL:v14 expirationDate:v15 requiredHTTPHeaders:v16 hlsPlaylist:v12];

    uint64_t v18 = self->_videoAssetContextsByClipUUID;
    uint64_t v19 = [v20 uniqueIdentifier];
    [(NSMutableDictionary *)v18 setObject:v17 forKeyedSubscript:v19];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setCloudStorageEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Updating cloud storage"];
  v8 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = [v7 identifier];
    int v13 = [v12 shortDescription];
    uint64_t v14 = HMFEnabledStatusToString();
    *(_DWORD *)buf = 138543874;
    long long v36 = v11;
    __int16 v37 = 2114;
    long long v38 = v13;
    __int16 v39 = 2112;
    long long v40 = v14;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Setting cloud storage to %@", buf, 0x20u);
  }
  id v15 = objc_alloc(MEMORY[0x1E4F65488]);
  uint64_t v16 = [(HMCameraClipManager *)v9 profileUniqueIdentifier];
  v17 = (void *)[v15 initWithTarget:v16];

  id v33 = @"HMCMM.mk.ie";
  uint64_t v18 = [NSNumber numberWithBool:v4];
  long long v34 = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];

  id v20 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCCM.m.ucs" destination:v17 payload:v19];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  uint64_t v27 = __57__HMCameraClipManager_setCloudStorageEnabled_completion___block_invoke;
  v28 = &unk_1E5943980;
  id v29 = v9;
  id v30 = v7;
  BOOL v32 = v4;
  id v31 = v6;
  id v21 = v6;
  id v22 = v7;
  [v20 setResponseHandler:&v25];
  uint64_t v23 = [(HMCameraClipManager *)v9 context];
  v24 = [v23 messageDispatcher];
  [v24 sendMessage:v20 completionHandler:0];
}

void __57__HMCameraClipManager_setCloudStorageEnabled_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      int v19 = 138543874;
      id v20 = v11;
      __int16 v21 = 2114;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to update cloud storage: %@", (uint8_t *)&v19, 0x20u);

LABEL_6:
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v14 = [*(id *)(a1 + 40) identifier];
    id v15 = [v14 shortDescription];
    uint64_t v16 = HMFEnabledStatusToString();
    int v19 = 138543874;
    id v20 = v11;
    __int16 v21 = 2114;
    id v22 = v15;
    __int16 v23 = 2112;
    id v24 = v16;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully set cloud storage to %@", (uint8_t *)&v19, 0x20u);

    goto LABEL_6;
  }

  v17 = [*(id *)(a1 + 32) context];
  uint64_t v18 = [v17 delegateCaller];
  [v18 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)fetchIsCloudStorageEnabledWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetching is cloud storage enabled"];
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    id v10 = [v5 identifier];
    uint64_t v11 = [v10 shortDescription];
    *(_DWORD *)buf = 138543618;
    id v24 = v9;
    __int16 v25 = 2114;
    uint64_t v26 = v11;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching is cloud storage enabled", buf, 0x16u);
  }
  id v12 = objc_alloc(MEMORY[0x1E4F65488]);
  int v13 = [(HMCameraClipManager *)v7 profileUniqueIdentifier];
  uint64_t v14 = (void *)[v12 initWithTarget:v13];

  id v15 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCCM.m.ficse" destination:v14 payload:0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__HMCameraClipManager_fetchIsCloudStorageEnabledWithCompletion___block_invoke;
  v20[3] = &unk_1E5945510;
  v20[4] = v7;
  id v21 = v5;
  id v22 = v4;
  id v16 = v4;
  id v17 = v5;
  [v15 setResponseHandler:v20];
  uint64_t v18 = [(HMCameraClipManager *)v7 context];
  int v19 = [v18 messageDispatcher];
  [v19 sendMessage:v15 completionHandler:0];
}

void __64__HMCameraClipManager_fetchIsCloudStorageEnabledWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_msgSend(v6, "hmf_numberForKey:", @"HMCMM.mk.ie");
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  uint64_t v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = [*(id *)(a1 + 40) identifier];
      uint64_t v14 = [v13 shortDescription];
      [v7 BOOLValue];
      HMFEnabledStatusToString();
      uint64_t v26 = v8;
      v16 = id v15 = v5;
      *(_DWORD *)buf = 138543874;
      v28 = v12;
      __int16 v29 = 2114;
      id v30 = v14;
      __int16 v31 = 2112;
      id v32 = v16;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched is cloud storage enabled: %@", buf, 0x20u);

      id v5 = v15;
      id v8 = v26;
    }
    id v17 = [*(id *)(a1 + 32) context];
    uint64_t v18 = [v17 delegateCaller];
    int v19 = v18;
    uint64_t v20 = *(void *)(a1 + 48);
    id v21 = v7;
    id v22 = 0;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      id v24 = [*(id *)(a1 + 40) identifier];
      __int16 v25 = [v24 shortDescription];
      *(_DWORD *)buf = 138543874;
      v28 = v23;
      __int16 v29 = 2114;
      id v30 = v25;
      __int16 v31 = 2112;
      id v32 = v5;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch is cloud storage enabled: %@", buf, 0x20u);
    }
    id v17 = [*(id *)(a1 + 32) context];
    uint64_t v18 = [v17 delegateCaller];
    int v19 = v18;
    uint64_t v20 = *(void *)(a1 + 48);
    id v21 = 0;
    id v22 = v5;
  }
  [v18 callCompletion:v20 obj:v21 error:v22];
}

- (void)importClipsWithImportData:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Import clips"];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = [v8 identifier];
    uint64_t v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    __int16 v37 = v12;
    __int16 v38 = 2114;
    __int16 v39 = v14;
    __int16 v40 = 2048;
    uint64_t v41 = [v6 count];
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Importing %lu clips", buf, 0x20u);
  }
  id v15 = objc_alloc(MEMORY[0x1E4F65488]);
  id v16 = [(HMCameraClipManager *)v10 profileUniqueIdentifier];
  id v17 = (void *)[v15 initWithTarget:v16];

  long long v34 = @"HMCCM.mk.cid";
  uint64_t v18 = encodeRootObject(v6);
  long long v35 = v18;
  int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];

  uint64_t v20 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCCM.m.ic" destination:v17 payload:v19];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __60__HMCameraClipManager_importClipsWithImportData_completion___block_invoke;
  __int16 v29 = &unk_1E59441B0;
  id v30 = v10;
  id v31 = v8;
  id v32 = v6;
  id v33 = v7;
  id v21 = v7;
  id v22 = v6;
  id v23 = v8;
  [v20 setResponseHandler:&v26];
  id v24 = [(HMCameraClipManager *)v10 context];
  __int16 v25 = [v24 messageDispatcher];
  [v25 sendMessage:v20 completionHandler:0];
}

void __60__HMCameraClipManager_importClipsWithImportData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      int v20 = 138543874;
      id v21 = v11;
      __int16 v22 = 2114;
      id v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v5;
      uint64_t v14 = "%{public}@[%{public}@] Failed to import clips: %@";
      id v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v20, 0x20u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) identifier];
    int v13 = [v12 shortDescription];
    uint64_t v17 = [*(id *)(a1 + 48) count];
    int v20 = 138543874;
    id v21 = v11;
    __int16 v22 = 2114;
    id v23 = v13;
    __int16 v24 = 2048;
    uint64_t v25 = v17;
    uint64_t v14 = "%{public}@[%{public}@] Successfully imported %lu clips";
    id v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  uint64_t v18 = [*(id *)(a1 + 32) context];
  int v19 = [v18 delegateCaller];
  [v19 callCompletion:*(void *)(a1 + 56) error:v5];
}

- (void)fetchVideoSegmentsAssetContextForClip:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch video segments asset context"];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = [v8 identifier];
    uint64_t v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v30 = v12;
    __int16 v31 = 2114;
    id v32 = v14;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching video segments asset context for clip %@", buf, 0x20u);
  }
  id v15 = [(HMCameraClipManager *)v10 videoSegmentsAssetContextForClip:v6];
  if (v15)
  {
    v7[2](v7, v15, 0);
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v17 = [(HMCameraClipManager *)v10 profileUniqueIdentifier];
    uint64_t v18 = (void *)[v16 initWithTarget:v17];

    uint64_t v27 = @"HMCCM.mk.cu";
    int v19 = [v6 uniqueIdentifier];
    v28 = v19;
    int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];

    id v21 = (void *)[objc_alloc(MEMORY[0x1E4F654B0]) initWithName:@"HMCCM.m.fvsac" destination:v18 payload:v20];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __72__HMCameraClipManager_fetchVideoSegmentsAssetContextForClip_completion___block_invoke;
    v24[3] = &unk_1E5945510;
    v24[4] = v10;
    id v25 = v8;
    uint64_t v26 = v7;
    [v21 setResponseHandler:v24];
    __int16 v22 = [(HMCameraClipManager *)v10 context];
    id v23 = [v22 messageDispatcher];
    [v23 sendMessage:v21 completionHandler:0];
  }
}

void __72__HMCameraClipManager_fetchVideoSegmentsAssetContextForClip_completion___block_invoke(id *a1, void *a2, void *a3)
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v47 = a2;
  id v5 = a3;
  v64[0] = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
  id v7 = objc_msgSend(v5, "hmf_unarchivedObjectForKey:ofClasses:", @"HMCCM.mk.ac", v6);

  if (v7)
  {
    uint64_t v63 = objc_opt_class();
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
    id v9 = objc_msgSend(v5, "hmf_unarchivedObjectForKey:ofClasses:", @"HMCCM.mk.c", v8);

    id v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = a1[4];
    id v12 = HMFGetOSLogHandle();
    int v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        id v15 = [a1[5] identifier];
        id v16 = [v15 shortDescription];
        *(_DWORD *)buf = 138544130;
        v56 = v14;
        __int16 v57 = 2114;
        v58 = v16;
        __int16 v59 = 2112;
        id v60 = v7;
        __int16 v61 = 2112;
        v62 = v9;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched video segments asset context: %@ clip: %@", buf, 0x2Au);
      }
      uint64_t v17 = [HMCameraClipVideoHLSPlaylistGenerator alloc];
      uint64_t v18 = [v7 url];
      int v19 = [(HMCameraClipVideoHLSPlaylistGenerator *)v17 initWithClip:v9 url:v18];

      int v20 = [v9 videoSegments];
      [(HMCameraClipVideoHLSPlaylistGenerator *)v19 addSegments:v20];

      if ([v9 isComplete]) {
        [(HMCameraClipVideoHLSPlaylistGenerator *)v19 finish];
      }
      id v21 = [(HMCameraClipVideoHLSPlaylistGenerator *)v19 hlsPlaylist];
      __int16 v22 = [HMCameraClipVideoAssetContext alloc];
      id v23 = [v7 url];
      __int16 v24 = [v7 expirationDate];
      id v25 = [v7 requiredHTTPHeaders];
      uint64_t v26 = [(HMCameraClipVideoAssetContext *)v22 initWithURL:v23 expirationDate:v24 requiredHTTPHeaders:v25 hlsPlaylist:v21];

      uint64_t v27 = (os_unfair_lock_s *)((char *)a1[4] + 8);
      os_unfair_lock_lock_with_options();
      v28 = (void *)*((void *)a1[4] + 8);
      __int16 v29 = [v9 uniqueIdentifier];
      [v28 setObject:v26 forKeyedSubscript:v29];

      os_unfair_lock_unlock(v27);
      id v30 = [a1[4] context];
      __int16 v31 = [v30 delegateCaller];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __72__HMCameraClipManager_fetchVideoSegmentsAssetContextForClip_completion___block_invoke_237;
      v48[3] = &unk_1E59454E8;
      id v32 = a1[6];
      v49 = v26;
      id v50 = v32;
      __int16 v33 = v26;
      [v31 invokeBlock:v48];
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = HMFGetLogIdentifier();
        v43 = [a1[5] identifier];
        v44 = [v43 shortDescription];
        *(_DWORD *)buf = 138543874;
        v56 = v42;
        __int16 v57 = 2114;
        v58 = v44;
        __int16 v59 = 2112;
        id v60 = v5;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Could not find clip in response payload: %@", buf, 0x20u);
      }
      __int16 v45 = [a1[4] context];
      uint64_t v46 = [v45 delegateCaller];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __72__HMCameraClipManager_fetchVideoSegmentsAssetContextForClip_completion___block_invoke_234;
      v51[3] = &unk_1E59454C0;
      v52 = (HMCameraClipVideoHLSPlaylistGenerator *)a1[6];
      [v46 invokeBlock:v51];

      int v19 = v52;
    }
  }
  else
  {
    id v34 = (void *)MEMORY[0x19F3A64A0]();
    id v35 = a1[4];
    long long v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      __int16 v37 = HMFGetLogIdentifier();
      __int16 v38 = [a1[5] identifier];
      __int16 v39 = [v38 shortDescription];
      *(_DWORD *)buf = 138543874;
      v56 = v37;
      __int16 v57 = 2114;
      v58 = v39;
      __int16 v59 = 2112;
      id v60 = v5;
      _os_log_impl(&dword_19D1A8000, v36, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Could not find video segments asset context in response payload %@", buf, 0x20u);
    }
    __int16 v40 = [a1[4] context];
    uint64_t v41 = [v40 delegateCaller];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __72__HMCameraClipManager_fetchVideoSegmentsAssetContextForClip_completion___block_invoke_233;
    v53[3] = &unk_1E59454C0;
    id v54 = a1[6];
    [v41 invokeBlock:v53];

    id v9 = v54;
  }
}

void __72__HMCameraClipManager_fetchVideoSegmentsAssetContextForClip_completion___block_invoke_233(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __72__HMCameraClipManager_fetchVideoSegmentsAssetContextForClip_completion___block_invoke_234(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __72__HMCameraClipManager_fetchVideoSegmentsAssetContextForClip_completion___block_invoke_237(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)donateClipsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Handle feedback submission"];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = [v8 identifier];
    uint64_t v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    long long v36 = v12;
    __int16 v37 = 2114;
    __int16 v38 = v14;
    __int16 v39 = 2112;
    id v40 = v6;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Handling feedback submission for clips %@", buf, 0x20u);
  }
  id v15 = objc_alloc(MEMORY[0x1E4F65488]);
  id v16 = [(HMCameraClipManager *)v10 profileUniqueIdentifier];
  uint64_t v17 = (void *)[v15 initWithTarget:v16];

  __int16 v33 = @"HMCCM.mk.cus";
  id v34 = v6;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  int v19 = (void *)[objc_alloc(MEMORY[0x1E4F654B0]) initWithName:@"HMCCM.m.sc" destination:v17 payload:v18];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  uint64_t v27 = __55__HMCameraClipManager_donateClipsWithUUIDs_completion___block_invoke;
  v28 = &unk_1E59441B0;
  __int16 v29 = v10;
  id v30 = v8;
  id v31 = v6;
  id v32 = v7;
  id v20 = v7;
  id v21 = v6;
  id v22 = v8;
  [v19 setResponseHandler:&v25];
  id v23 = [(HMCameraClipManager *)v10 context];
  __int16 v24 = [v23 messageDispatcher];
  [v24 sendMessage:v19 completionHandler:0];
}

void __55__HMCameraClipManager_donateClipsWithUUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      uint64_t v14 = *(void *)(a1 + 48);
      int v22 = 138544130;
      id v23 = v11;
      __int16 v24 = 2114;
      uint64_t v25 = v13;
      __int16 v26 = 2112;
      uint64_t v27 = v14;
      __int16 v28 = 2112;
      id v29 = v5;
      id v15 = "%{public}@[%{public}@] Failed to handle feedback submission for clips %@: %@";
      id v16 = v10;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      uint32_t v18 = 42;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v16, v17, v15, (uint8_t *)&v22, v18);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) identifier];
    int v13 = [v12 shortDescription];
    uint64_t v19 = *(void *)(a1 + 48);
    int v22 = 138543874;
    id v23 = v11;
    __int16 v24 = 2114;
    uint64_t v25 = v13;
    __int16 v26 = 2112;
    uint64_t v27 = v19;
    id v15 = "%{public}@[%{public}@] Successfully handled feedback submission for clips %@";
    id v16 = v10;
    os_log_type_t v17 = OS_LOG_TYPE_INFO;
    uint32_t v18 = 32;
    goto LABEL_6;
  }

  id v20 = [*(id *)(a1 + 32) context];
  id v21 = [v20 delegateCaller];
  [v21 callCompletion:*(void *)(a1 + 56) error:v5];
}

- (void)handleFaceMisclassificationForSignificantEvent:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Handle face misclassification"];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = [v8 identifier];
    uint64_t v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v35 = v12;
    __int16 v36 = 2114;
    __int16 v37 = v14;
    __int16 v38 = 2112;
    id v39 = v6;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Handling face misclassification for significant event %@", buf, 0x20u);
  }
  id v15 = objc_alloc(MEMORY[0x1E4F65488]);
  id v16 = [(HMCameraClipManager *)v10 profileUniqueIdentifier];
  os_log_type_t v17 = (void *)[v15 initWithTarget:v16];

  id v31 = v6;
  id v32 = @"HMCCM.mk.se";
  uint32_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  uint64_t v19 = encodeRootObject(v18);
  __int16 v33 = v19;
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];

  id v21 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCCM.m.hfm" destination:v17 payload:v20];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __81__HMCameraClipManager_handleFaceMisclassificationForSignificantEvent_completion___block_invoke;
  v27[3] = &unk_1E59441B0;
  v27[4] = v10;
  id v28 = v8;
  id v29 = v6;
  id v30 = v7;
  id v22 = v7;
  id v23 = v6;
  id v24 = v8;
  [v21 setResponseHandler:v27];
  uint64_t v25 = [(HMCameraClipManager *)v10 context];
  __int16 v26 = [v25 messageDispatcher];
  [v26 sendMessage:v21 completionHandler:0];
}

void __81__HMCameraClipManager_handleFaceMisclassificationForSignificantEvent_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      uint64_t v14 = *(void *)(a1 + 48);
      int v22 = 138544130;
      id v23 = v11;
      __int16 v24 = 2114;
      uint64_t v25 = v13;
      __int16 v26 = 2112;
      uint64_t v27 = v14;
      __int16 v28 = 2112;
      id v29 = v5;
      id v15 = "%{public}@[%{public}@] Failed to handle face misclassification for significant event %@: %@";
      id v16 = v10;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      uint32_t v18 = 42;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v16, v17, v15, (uint8_t *)&v22, v18);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) identifier];
    int v13 = [v12 shortDescription];
    uint64_t v19 = *(void *)(a1 + 48);
    int v22 = 138543874;
    id v23 = v11;
    __int16 v24 = 2114;
    uint64_t v25 = v13;
    __int16 v26 = 2112;
    uint64_t v27 = v19;
    id v15 = "%{public}@[%{public}@] Successfully handled face misclassification for significant event %@";
    id v16 = v10;
    os_log_type_t v17 = OS_LOG_TYPE_INFO;
    uint32_t v18 = 32;
    goto LABEL_6;
  }

  id v20 = [*(id *)(a1 + 32) context];
  id v21 = [v20 delegateCaller];
  [v21 callCompletion:*(void *)(a1 + 56) error:v5];
}

- (void)deleteAllClipsWithCompletionHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Delete all clips"];
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 identifier];
    id v11 = [v10 shortDescription];
    *(_DWORD *)buf = 138543618;
    __int16 v24 = v9;
    __int16 v25 = 2114;
    __int16 v26 = v11;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Deleting all clips", buf, 0x16u);
  }
  id v12 = objc_alloc(MEMORY[0x1E4F65488]);
  int v13 = [(HMCameraClipManager *)v7 profileUniqueIdentifier];
  uint64_t v14 = (void *)[v12 initWithTarget:v13];

  id v15 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCCM.m.dac" destination:v14 payload:0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59__HMCameraClipManager_deleteAllClipsWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E5945510;
  v20[4] = v7;
  id v21 = v5;
  id v22 = v4;
  id v16 = v4;
  id v17 = v5;
  [v15 setResponseHandler:v20];
  uint32_t v18 = [(HMCameraClipManager *)v7 context];
  uint64_t v19 = [v18 messageDispatcher];
  [v19 sendMessage:v15 completionHandler:0];
}

void __59__HMCameraClipManager_deleteAllClipsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      int v20 = 138543874;
      id v21 = v11;
      __int16 v22 = 2114;
      id v23 = v13;
      __int16 v24 = 2112;
      id v25 = v5;
      uint64_t v14 = "%{public}@[%{public}@] Failed to delete all clips: %@";
      id v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 32;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v20, v17);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) identifier];
    int v13 = [v12 shortDescription];
    int v20 = 138543618;
    id v21 = v11;
    __int16 v22 = 2114;
    id v23 = v13;
    uint64_t v14 = "%{public}@[%{public}@] Successfully deleted all clips";
    id v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    uint32_t v17 = 22;
    goto LABEL_6;
  }

  uint32_t v18 = [*(id *)(a1 + 32) context];
  uint64_t v19 = [v18 delegateCaller];
  [v19 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)deleteClipWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Delete clip"];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = [v8 identifier];
    uint64_t v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    __int16 v36 = v12;
    __int16 v37 = 2114;
    __int16 v38 = v14;
    __int16 v39 = 2112;
    id v40 = v6;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Deleting clip with UUID %@", buf, 0x20u);
  }
  id v15 = objc_alloc(MEMORY[0x1E4F65488]);
  os_log_type_t v16 = [(HMCameraClipManager *)v10 profileUniqueIdentifier];
  uint32_t v17 = (void *)[v15 initWithTarget:v16];

  __int16 v33 = @"HMCCM.mk.cu";
  id v34 = v6;
  uint32_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  uint64_t v19 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCCM.m.dc" destination:v17 payload:v18];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  uint64_t v27 = __53__HMCameraClipManager_deleteClipWithUUID_completion___block_invoke;
  __int16 v28 = &unk_1E59441B0;
  id v29 = v10;
  id v30 = v8;
  id v31 = v6;
  id v32 = v7;
  id v20 = v7;
  id v21 = v6;
  id v22 = v8;
  [v19 setResponseHandler:&v25];
  id v23 = [(HMCameraClipManager *)v10 context];
  __int16 v24 = [v23 messageDispatcher];
  [v24 sendMessage:v19 completionHandler:0];
}

void __53__HMCameraClipManager_deleteClipWithUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      uint64_t v14 = *(void *)(a1 + 48);
      int v22 = 138544130;
      id v23 = v11;
      __int16 v24 = 2114;
      uint64_t v25 = v13;
      __int16 v26 = 2112;
      uint64_t v27 = v14;
      __int16 v28 = 2112;
      id v29 = v5;
      id v15 = "%{public}@[%{public}@] Failed to delete clip with UUID %@: %@";
      os_log_type_t v16 = v10;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      uint32_t v18 = 42;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v16, v17, v15, (uint8_t *)&v22, v18);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) identifier];
    int v13 = [v12 shortDescription];
    uint64_t v19 = *(void *)(a1 + 48);
    int v22 = 138543874;
    id v23 = v11;
    __int16 v24 = 2114;
    uint64_t v25 = v13;
    __int16 v26 = 2112;
    uint64_t v27 = v19;
    id v15 = "%{public}@[%{public}@] Successfully deleted clip with UUID %@";
    os_log_type_t v16 = v10;
    os_log_type_t v17 = OS_LOG_TYPE_INFO;
    uint32_t v18 = 32;
    goto LABEL_6;
  }

  id v20 = [*(id *)(a1 + 32) context];
  id v21 = [v20 delegateCaller];
  [v21 callCompletion:*(void *)(a1 + 56) error:v5];
}

- (void)fetchSignificantEventsWithDateInterval:(id)a3 limit:(unint64_t)a4 shouldOrderAscending:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch significant events with date interval"];
  int v13 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v16 = v10;
    uint32_t v18 = v17 = v7;
    [v12 identifier];
    uint64_t v19 = v35 = v11;
    id v20 = [v19 shortDescription];
    *(_DWORD *)buf = 138544386;
    uint64_t v42 = v18;
    __int16 v43 = 2114;
    v44 = v20;
    __int16 v45 = 2112;
    id v46 = v16;
    __int16 v47 = 2048;
    unint64_t v48 = a4;
    __int16 v49 = 1024;
    BOOL v50 = v17;
    _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching significant events with date interval: %@ limit: %lu shouldOrderAscending: %d", buf, 0x30u);

    id v11 = v35;
    BOOL v7 = v17;
    id v10 = v16;
  }

  id v21 = objc_alloc(MEMORY[0x1E4F65488]);
  int v22 = [(HMCameraClipManager *)v14 profileUniqueIdentifier];
  id v23 = (void *)[v21 initWithTarget:v22];

  v39[0] = @"HMCCM.mk.daf";
  __int16 v24 = [v10 startDate];
  v40[0] = v24;
  v39[1] = @"HMCCM.mk.db";
  uint64_t v25 = [v10 endDate];
  v40[1] = v25;
  v39[2] = @"HMCCM.mk.l";
  __int16 v26 = [NSNumber numberWithUnsignedInteger:a4];
  v40[2] = v26;
  v39[3] = @"HMCCM.mk.soa";
  uint64_t v27 = [NSNumber numberWithBool:v7];
  v40[3] = v27;
  __int16 v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:4];

  id v29 = [(HMCameraClipManager *)v14 fetchClientFactory];
  uint64_t v30 = [v12 identifier];
  id v31 = [(HMCameraClipManager *)v14 context];
  id v32 = ((void (**)(void, void *, void *, __CFString *, void *))v29)[2](v29, v30, v31, @"HMCCM.m.fse", v23);

  [v32 setClassForUnarchiving:objc_opt_class()];
  [v32 setPayload:v28];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __100__HMCameraClipManager_fetchSignificantEventsWithDateInterval_limit_shouldOrderAscending_completion___block_invoke;
  v36[3] = &unk_1E59437B0;
  v36[4] = v14;
  id v37 = v12;
  id v38 = v11;
  id v33 = v11;
  id v34 = v12;
  [v32 fetchWithCompletion:v36];
}

void __100__HMCameraClipManager_fetchSignificantEventsWithDateInterval_limit_shouldOrderAscending_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      int v17 = 138543874;
      uint32_t v18 = v11;
      __int16 v19 = 2114;
      id v20 = v13;
      __int16 v21 = 2048;
      uint64_t v22 = [v5 count];
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched %lu significant events", (uint8_t *)&v17, 0x20u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    id v15 = [*(id *)(a1 + 40) identifier];
    id v16 = [v15 shortDescription];
    int v17 = 138543874;
    uint32_t v18 = v14;
    __int16 v19 = 2114;
    id v20 = v16;
    __int16 v21 = 2112;
    uint64_t v22 = (uint64_t)v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch significant events: %@", (uint8_t *)&v17, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchSignificantEventsWithDateInterval:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
}

- (void)fetchAllSignificantEventsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  BOOL v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v8 = (void *)[v5 initWithStartDate:v6 endDate:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__HMCameraClipManager_fetchAllSignificantEventsWithCompletion___block_invoke;
  v10[3] = &unk_1E5944EC8;
  id v11 = v4;
  id v9 = v4;
  [(HMCameraClipManager *)self fetchSignificantEventsWithDateInterval:v8 limit:-1 shouldOrderAscending:1 completion:v10];
}

void __63__HMCameraClipManager_fetchAllSignificantEventsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = a3;
    id v8 = [v5 setWithArray:a2];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    BOOL v7 = *(void (**)(uint64_t, void))(v3 + 16);
    id v8 = a3;
    v7(v3, 0);
  }
}

- (void)fetchSignificantEventsWithUUIDs:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch significant events with UUIDs"];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = [v8 identifier];
    uint64_t v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    uint64_t v30 = v12;
    __int16 v31 = 2114;
    id v32 = v14;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching significant events with UUIDs %@", buf, 0x20u);
  }
  id v15 = objc_alloc(MEMORY[0x1E4F65488]);
  id v16 = [(HMCameraClipManager *)v10 profileUniqueIdentifier];
  int v17 = (void *)[v15 initWithTarget:v16];

  uint64_t v27 = @"HMCCM.mk.seu";
  id v28 = v6;
  uint32_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  __int16 v19 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCCM.m.fse" destination:v17 payload:v18];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __66__HMCameraClipManager_fetchSignificantEventsWithUUIDs_completion___block_invoke;
  v24[3] = &unk_1E5945510;
  v24[4] = v10;
  id v25 = v8;
  id v26 = v7;
  id v20 = v7;
  id v21 = v8;
  [v19 setResponseHandler:v24];
  uint64_t v22 = [(HMCameraClipManager *)v10 context];
  uint64_t v23 = [v22 messageDispatcher];
  [v23 sendMessage:v19 completionHandler:0];
}

void __66__HMCameraClipManager_fetchSignificantEventsWithUUIDs_completion___block_invoke(id *a1, void *a2, void *a3)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  id v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMCCM.mk.se", v7);

  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = a1[4];
  id v11 = HMFGetOSLogHandle();
  id v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      uint64_t v14 = [a1[5] identifier];
      id v15 = [v14 shortDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v13;
      __int16 v28 = 2114;
      id v29 = v15;
      __int16 v30 = 2112;
      id v31 = v8;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched significant events: %@", buf, 0x20u);
    }
    id v16 = [a1[4] context];
    int v17 = [v16 delegateCaller];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __66__HMCameraClipManager_fetchSignificantEventsWithUUIDs_completion___block_invoke_206;
    v23[3] = &unk_1E59454E8;
    id v25 = a1[6];
    id v24 = v8;
    [v17 invokeBlock:v23];

    uint32_t v18 = v25;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      id v20 = [a1[5] identifier];
      id v21 = [v20 shortDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v19;
      __int16 v28 = 2114;
      id v29 = v21;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Could not find significant events in response payload %@", buf, 0x20u);
    }
    uint64_t v22 = (void (**)(id, void, void *))a1[6];
    uint32_t v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    v22[2](v22, 0, v18);
  }
}

void __66__HMCameraClipManager_fetchSignificantEventsWithUUIDs_completion___block_invoke_206(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)fetchFaceCropURLForSignificantEventWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch face crop URL for significant event"];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = [v8 identifier];
    uint64_t v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v37 = v12;
    __int16 v38 = 2114;
    __int16 v39 = v14;
    __int16 v40 = 2112;
    id v41 = v6;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching face crop url for significant event with UUID %@", buf, 0x20u);
  }
  id v15 = objc_alloc(MEMORY[0x1E4F65488]);
  id v16 = [(HMCameraClipManager *)v10 profileUniqueIdentifier];
  int v17 = (void *)[v15 initWithTarget:v16];

  id v34 = @"HMCCM.mk.seu";
  uint32_t v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
  uint64_t v35 = v18;
  __int16 v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];

  id v20 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCCM.ffcu" destination:v17 payload:v19];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  __int16 v28 = __78__HMCameraClipManager_fetchFaceCropURLForSignificantEventWithUUID_completion___block_invoke;
  id v29 = &unk_1E59441B0;
  __int16 v30 = v10;
  id v31 = v8;
  id v32 = v6;
  id v33 = v7;
  id v21 = v7;
  id v22 = v6;
  id v23 = v8;
  [v20 setResponseHandler:&v26];
  id v24 = [(HMCameraClipManager *)v10 context];
  id v25 = [v24 messageDispatcher];
  [v25 sendMessage:v20 completionHandler:0];
}

void __78__HMCameraClipManager_fetchFaceCropURLForSignificantEventWithUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      uint64_t v14 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      __int16 v38 = v11;
      __int16 v39 = 2114;
      __int16 v40 = v13;
      __int16 v41 = 2112;
      uint64_t v42 = v14;
      __int16 v43 = 2112;
      id v44 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch face crop URL for significant event with UUID %@: %@", buf, 0x2Au);
    }
    id v15 = [*(id *)(a1 + 32) context];
    id v16 = [v15 delegateCaller];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __78__HMCameraClipManager_fetchFaceCropURLForSignificantEventWithUUID_completion___block_invoke_200;
    v34[3] = &unk_1E59454E8;
    id v36 = *(id *)(a1 + 56);
    id v35 = v5;
    [v16 invokeBlock:v34];

    int v17 = v36;
  }
  else
  {
    int v17 = objc_msgSend(v6, "hmf_stringForKey:", @"HMCCM.mk.furl");
    uint32_t v18 = [MEMORY[0x1E4F1CB10] URLWithString:v17];
    __int16 v19 = (void *)MEMORY[0x19F3A64A0]();
    id v20 = *(id *)(a1 + 32);
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      [*(id *)(a1 + 40) identifier];
      v23 = __int16 v30 = v7;
      id v24 = [v23 shortDescription];
      uint64_t v25 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      __int16 v38 = v22;
      __int16 v39 = 2114;
      __int16 v40 = v24;
      __int16 v41 = 2112;
      uint64_t v42 = v25;
      __int16 v43 = 2112;
      id v44 = v18;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched face crop URL for significant event with UUID %@: %@", buf, 0x2Au);

      id v7 = v30;
    }

    uint64_t v26 = [*(id *)(a1 + 32) context];
    uint64_t v27 = [v26 delegateCaller];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __78__HMCameraClipManager_fetchFaceCropURLForSignificantEventWithUUID_completion___block_invoke_201;
    v31[3] = &unk_1E59454E8;
    id v28 = *(id *)(a1 + 56);
    id v32 = v18;
    id v33 = v28;
    id v29 = v18;
    [v27 invokeBlock:v31];
  }
}

uint64_t __78__HMCameraClipManager_fetchFaceCropURLForSignificantEventWithUUID_completion___block_invoke_200(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __78__HMCameraClipManager_fetchFaceCropURLForSignificantEventWithUUID_completion___block_invoke_201(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)fetchFaceCropDataRepresentationForSignificantEventWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch face crop image data for significant event"];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = [v8 identifier];
    uint64_t v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v31 = v12;
    __int16 v32 = 2114;
    id v33 = v14;
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching face crop image data for significant event with UUID %@", buf, 0x20u);
  }
  id v15 = objc_alloc(MEMORY[0x1E4F65488]);
  id v16 = [(HMCameraClipManager *)v10 profileUniqueIdentifier];
  int v17 = (void *)[v15 initWithTarget:v16];

  id v28 = @"HMCCM.mk.seu";
  uint32_t v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
  id v29 = v18;
  __int16 v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];

  id v20 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCCM.ffcdr" destination:v17 payload:v19];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __93__HMCameraClipManager_fetchFaceCropDataRepresentationForSignificantEventWithUUID_completion___block_invoke;
  v25[3] = &unk_1E5945510;
  void v25[4] = v10;
  id v26 = v8;
  id v27 = v7;
  id v21 = v7;
  id v22 = v8;
  [v20 setResponseHandler:v25];
  id v23 = [(HMCameraClipManager *)v10 context];
  id v24 = [v23 messageDispatcher];
  [v24 sendMessage:v20 completionHandler:0];
}

void __93__HMCameraClipManager_fetchFaceCropDataRepresentationForSignificantEventWithUUID_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_msgSend(v6, "hmf_dataForKey:", @"HMCCM.mk.id");
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = a1[4];
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v12 = v25 = v5;
      int v13 = [a1[5] identifier];
      uint64_t v14 = [v13 shortDescription];
      id v15 = [v7 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v33 = v12;
      __int16 v34 = 2114;
      id v35 = v14;
      __int16 v36 = 2112;
      id v37 = v15;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched face crop image data: %@", buf, 0x20u);

      id v5 = v25;
    }

    id v16 = [a1[4] context];
    int v17 = [v16 delegateCaller];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __93__HMCameraClipManager_fetchFaceCropDataRepresentationForSignificantEventWithUUID_completion___block_invoke_196;
    v26[3] = &unk_1E59454E8;
    uint32_t v18 = &v28;
    id v28 = a1[6];
    __int16 v19 = &v27;
    id v27 = v7;
    id v20 = v26;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = id v21 = v5;
      id v23 = [a1[5] identifier];
      id v24 = [v23 shortDescription];
      *(_DWORD *)buf = 138544130;
      id v33 = v22;
      __int16 v34 = 2114;
      id v35 = v24;
      __int16 v36 = 2112;
      id v37 = v6;
      __int16 v38 = 2112;
      id v39 = v21;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch face crop image data from response payload %@: %@", buf, 0x2Au);

      id v5 = v21;
    }

    id v16 = [a1[4] context];
    int v17 = [v16 delegateCaller];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __93__HMCameraClipManager_fetchFaceCropDataRepresentationForSignificantEventWithUUID_completion___block_invoke_195;
    v29[3] = &unk_1E59454E8;
    uint32_t v18 = &v31;
    id v31 = a1[6];
    __int16 v19 = &v30;
    id v30 = v5;
    id v20 = v29;
  }
  [v17 invokeBlock:v20];
}

uint64_t __93__HMCameraClipManager_fetchFaceCropDataRepresentationForSignificantEventWithUUID_completion___block_invoke_195(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __93__HMCameraClipManager_fetchFaceCropDataRepresentationForSignificantEventWithUUID_completion___block_invoke_196(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)fetchHeroFrameURLOfClipWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch hero frame URL of clip"];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = [v8 identifier];
    uint64_t v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    __int16 v36 = v12;
    __int16 v37 = 2114;
    __int16 v38 = v14;
    __int16 v39 = 2112;
    id v40 = v6;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching hero frame url of clip with UUID %@", buf, 0x20u);
  }
  id v15 = objc_alloc(MEMORY[0x1E4F65488]);
  id v16 = [(HMCameraClipManager *)v10 profileUniqueIdentifier];
  int v17 = (void *)[v15 initWithTarget:v16];

  id v33 = @"HMCCM.mk.cu";
  id v34 = v6;
  uint32_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  __int16 v19 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCCM.fhfu" destination:v17 payload:v18];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  id v27 = __66__HMCameraClipManager_fetchHeroFrameURLOfClipWithUUID_completion___block_invoke;
  id v28 = &unk_1E59441B0;
  id v29 = v10;
  id v30 = v8;
  id v31 = v6;
  id v32 = v7;
  id v20 = v7;
  id v21 = v6;
  id v22 = v8;
  [v19 setResponseHandler:&v25];
  id v23 = [(HMCameraClipManager *)v10 context];
  id v24 = [v23 messageDispatcher];
  [v24 sendMessage:v19 completionHandler:0];
}

void __66__HMCameraClipManager_fetchHeroFrameURLOfClipWithUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      uint64_t v14 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      __int16 v38 = v11;
      __int16 v39 = 2114;
      id v40 = v13;
      __int16 v41 = 2112;
      uint64_t v42 = v14;
      __int16 v43 = 2112;
      id v44 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch the hero frame of clip %@ due to error - %@", buf, 0x2Au);
    }
    id v15 = [*(id *)(a1 + 32) context];
    id v16 = [v15 delegateCaller];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __66__HMCameraClipManager_fetchHeroFrameURLOfClipWithUUID_completion___block_invoke_189;
    v34[3] = &unk_1E59454E8;
    id v36 = *(id *)(a1 + 56);
    id v35 = v5;
    [v16 invokeBlock:v34];

    int v17 = v36;
  }
  else
  {
    int v17 = objc_msgSend(v6, "hmf_stringForKey:", @"HMCCM.mk.furl");
    uint32_t v18 = [MEMORY[0x1E4F1CB10] URLWithString:v17];
    __int16 v19 = (void *)MEMORY[0x19F3A64A0]();
    id v20 = *(id *)(a1 + 32);
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      [*(id *)(a1 + 40) identifier];
      v23 = id v30 = v7;
      id v24 = [v23 shortDescription];
      uint64_t v25 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      __int16 v38 = v22;
      __int16 v39 = 2114;
      id v40 = v24;
      __int16 v41 = 2112;
      uint64_t v42 = v25;
      __int16 v43 = 2112;
      id v44 = v18;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched hero frame URL for clip with UUID %@ : %@]", buf, 0x2Au);

      id v7 = v30;
    }

    uint64_t v26 = [*(id *)(a1 + 32) context];
    id v27 = [v26 delegateCaller];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __66__HMCameraClipManager_fetchHeroFrameURLOfClipWithUUID_completion___block_invoke_191;
    v31[3] = &unk_1E59454E8;
    id v28 = *(id *)(a1 + 56);
    id v32 = v18;
    id v33 = v28;
    id v29 = v18;
    [v27 invokeBlock:v31];
  }
}

uint64_t __66__HMCameraClipManager_fetchHeroFrameURLOfClipWithUUID_completion___block_invoke_189(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __66__HMCameraClipManager_fetchHeroFrameURLOfClipWithUUID_completion___block_invoke_191(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)fetchHeroFrameDataRepresentationForClipWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch hero frame image data for clip"];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = [v8 identifier];
    uint64_t v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v30 = v12;
    __int16 v31 = 2114;
    id v32 = v14;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching hero frame image data for clip with UUID %@", buf, 0x20u);
  }
  id v15 = objc_alloc(MEMORY[0x1E4F65488]);
  id v16 = [(HMCameraClipManager *)v10 profileUniqueIdentifier];
  int v17 = (void *)[v15 initWithTarget:v16];

  id v27 = @"HMCCM.mk.cu";
  id v28 = v6;
  uint32_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  __int16 v19 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCCM.fhfdr" destination:v17 payload:v18];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __82__HMCameraClipManager_fetchHeroFrameDataRepresentationForClipWithUUID_completion___block_invoke;
  v24[3] = &unk_1E5945510;
  v24[4] = v10;
  id v25 = v8;
  id v26 = v7;
  id v20 = v7;
  id v21 = v8;
  [v19 setResponseHandler:v24];
  id v22 = [(HMCameraClipManager *)v10 context];
  id v23 = [v22 messageDispatcher];
  [v23 sendMessage:v19 completionHandler:0];
}

void __82__HMCameraClipManager_fetchHeroFrameDataRepresentationForClipWithUUID_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_msgSend(v6, "hmf_dataForKey:", @"HMCCM.mk.id");
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = a1[4];
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v12 = v25 = v5;
      int v13 = [a1[5] identifier];
      uint64_t v14 = [v13 shortDescription];
      id v15 = [v7 shortDescription];
      *(_DWORD *)buf = 138543874;
      __int16 v33 = v12;
      __int16 v34 = 2114;
      uint64_t v35 = v14;
      __int16 v36 = 2112;
      id v37 = v15;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched hero frame image data: %@", buf, 0x20u);

      id v5 = v25;
    }

    id v16 = [a1[4] context];
    int v17 = [v16 delegateCaller];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __82__HMCameraClipManager_fetchHeroFrameDataRepresentationForClipWithUUID_completion___block_invoke_185;
    v26[3] = &unk_1E59454E8;
    uint32_t v18 = &v28;
    id v28 = a1[6];
    __int16 v19 = &v27;
    id v27 = v7;
    id v20 = v26;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = id v21 = v5;
      id v23 = [a1[5] identifier];
      id v24 = [v23 shortDescription];
      *(_DWORD *)buf = 138544130;
      __int16 v33 = v22;
      __int16 v34 = 2114;
      uint64_t v35 = v24;
      __int16 v36 = 2112;
      id v37 = v6;
      __int16 v38 = 2112;
      id v39 = v21;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch hero frame image data from response payload %@: %@", buf, 0x2Au);

      id v5 = v21;
    }

    id v16 = [a1[4] context];
    int v17 = [v16 delegateCaller];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __82__HMCameraClipManager_fetchHeroFrameDataRepresentationForClipWithUUID_completion___block_invoke_184;
    v29[3] = &unk_1E59454E8;
    uint32_t v18 = &v31;
    id v31 = a1[6];
    __int16 v19 = &v30;
    id v30 = v5;
    id v20 = v29;
  }
  [v17 invokeBlock:v20];
}

uint64_t __82__HMCameraClipManager_fetchHeroFrameDataRepresentationForClipWithUUID_completion___block_invoke_184(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __82__HMCameraClipManager_fetchHeroFrameDataRepresentationForClipWithUUID_completion___block_invoke_185(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)fetchCountOfClipsWithDateInterval:(id)a3 quality:(int64_t)a4 completion:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch count of clips with date interval"];
  id v11 = (void *)MEMORY[0x19F3A64A0]();
  id v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    [v10 identifier];
    id v15 = v32 = v9;
    id v16 = [v15 shortDescription];
    int v17 = HMStringFromCameraClipQuality(a4);
    *(_DWORD *)buf = 138544130;
    id v39 = v14;
    __int16 v40 = 2114;
    __int16 v41 = v16;
    __int16 v42 = 2112;
    id v43 = v8;
    __int16 v44 = 2112;
    uint64_t v45 = v17;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching count of clips with date interval: %@ quality: %@", buf, 0x2Au);

    id v9 = v32;
  }

  id v18 = objc_alloc(MEMORY[0x1E4F65488]);
  __int16 v19 = [(HMCameraClipManager *)v12 profileUniqueIdentifier];
  id v20 = (void *)[v18 initWithTarget:v19];

  v36[0] = @"HMCCM.mk.daf";
  id v21 = [v8 startDate];
  v37[0] = v21;
  v36[1] = @"HMCCM.mk.db";
  id v22 = [v8 endDate];
  v37[1] = v22;
  v36[2] = @"HMCCM.mk.v";
  id v23 = [NSNumber numberWithInteger:a4];
  v37[2] = v23;
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:3];

  id v25 = (void *)MEMORY[0x1E4F654B0];
  id v26 = (void *)[v24 copy];
  id v27 = [v25 messageWithName:@"HMCCM.m.fcoc" destination:v20 payload:v26];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __76__HMCameraClipManager_fetchCountOfClipsWithDateInterval_quality_completion___block_invoke;
  v33[3] = &unk_1E5945510;
  v33[4] = v12;
  id v34 = v10;
  id v35 = v9;
  id v28 = v9;
  id v29 = v10;
  [v27 setResponseHandler:v33];
  id v30 = [(HMCameraClipManager *)v12 context];
  id v31 = [v30 messageDispatcher];
  [v31 sendMessage:v27 completionHandler:0];
}

void __76__HMCameraClipManager_fetchCountOfClipsWithDateInterval_quality_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_msgSend(v6, "hmf_numberForKey:", @"HMCCM.mk.coc");
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = a1[4];
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = [a1[5] identifier];
      uint64_t v14 = [v13 shortDescription];
      *(_DWORD *)buf = 138543874;
      __int16 v33 = v12;
      __int16 v34 = 2114;
      id v35 = v14;
      __int16 v36 = 2112;
      id v37 = v7;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched count of %@ clips", buf, 0x20u);
    }
    id v15 = [a1[4] context];
    id v16 = [v15 delegateCaller];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    id v25 = __76__HMCameraClipManager_fetchCountOfClipsWithDateInterval_quality_completion___block_invoke_180;
    id v26 = &unk_1E59454E8;
    int v17 = &v28;
    id v28 = a1[6];
    id v18 = &v27;
    id v27 = v7;
    __int16 v19 = &v23;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      id v21 = [a1[5] identifier];
      id v22 = [v21 shortDescription];
      *(_DWORD *)buf = 138543874;
      __int16 v33 = v20;
      __int16 v34 = 2114;
      id v35 = v22;
      __int16 v36 = 2112;
      id v37 = v5;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch count of clips: %@", buf, 0x20u);
    }
    id v15 = [a1[4] context];
    id v16 = [v15 delegateCaller];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __76__HMCameraClipManager_fetchCountOfClipsWithDateInterval_quality_completion___block_invoke_179;
    v29[3] = &unk_1E59454E8;
    int v17 = &v31;
    id v31 = a1[6];
    id v18 = &v30;
    id v30 = v5;
    __int16 v19 = v29;
  }
  objc_msgSend(v16, "invokeBlock:", v19, v23, v24, v25, v26, v27);
}

uint64_t __76__HMCameraClipManager_fetchCountOfClipsWithDateInterval_quality_completion___block_invoke_179(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __76__HMCameraClipManager_fetchCountOfClipsWithDateInterval_quality_completion___block_invoke_180(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)fetchCountOfClipsWithDateInterval:(id)a3 completion:(id)a4
{
}

- (void)fetchCountOfAllClipsWithCompletion:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28C18];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v8 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v9 = (id)[v6 initWithStartDate:v7 endDate:v8];

  [(HMCameraClipManager *)self fetchCountOfClipsWithDateInterval:v9 completion:v5];
}

- (void)fetchClipsWithDateInterval:(id)a3 quality:(int64_t)a4 limit:(unint64_t)a5 shouldOrderAscending:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v37 = a7;
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch clips with date interval"];
  int v13 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    [v12 identifier];
    v17 = id v35 = v13;
    id v18 = [v17 shortDescription];
    HMStringFromCameraClipQuality(a4);
    __int16 v19 = v36 = a5;
    *(_DWORD *)buf = 138544642;
    uint64_t v45 = v16;
    __int16 v46 = 2114;
    __int16 v47 = v18;
    __int16 v48 = 2112;
    __int16 v49 = v19;
    __int16 v50 = 2112;
    id v51 = v11;
    __int16 v52 = 2048;
    unint64_t v53 = v36;
    __int16 v54 = 1024;
    BOOL v55 = v8;
    _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching clips with date interval: %@ quality: %@ limit: %lu shouldOrderAscending: %d", buf, 0x3Au);

    int v13 = v35;
    a5 = v36;
  }
  id v20 = objc_alloc(MEMORY[0x1E4F65488]);
  id v21 = [(HMCameraClipManager *)v14 profileUniqueIdentifier];
  id v22 = (void *)[v20 initWithTarget:v21];

  v42[0] = @"HMCCM.mk.daf";
  uint64_t v23 = [v11 startDate];
  v43[0] = v23;
  v42[1] = @"HMCCM.mk.db";
  uint64_t v24 = [v11 endDate];
  v43[1] = v24;
  v42[2] = @"HMCCM.mk.v";
  id v25 = [NSNumber numberWithInteger:a4];
  v43[2] = v25;
  v42[3] = @"HMCCM.mk.l";
  id v26 = [NSNumber numberWithUnsignedInteger:a5];
  v43[3] = v26;
  v42[4] = @"HMCCM.mk.soa";
  id v27 = [NSNumber numberWithBool:v8];
  v43[4] = v27;
  id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:5];

  id v29 = [(HMCameraClipManager *)v14 fetchClientFactory];
  id v30 = [v12 identifier];
  id v31 = [(HMCameraClipManager *)v14 context];
  id v32 = ((void (**)(void, void *, void *, __CFString *, void *))v29)[2](v29, v30, v31, @"HMCCM.m.fcs", v22);

  [v32 setClassForUnarchiving:objc_opt_class()];
  [v32 setPayload:v28];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __96__HMCameraClipManager_fetchClipsWithDateInterval_quality_limit_shouldOrderAscending_completion___block_invoke;
  v39[3] = &unk_1E59437B0;
  void v39[4] = v14;
  id v40 = v12;
  id v41 = v37;
  id v33 = v37;
  id v34 = v12;
  [v32 fetchWithCompletion:v39];
}

void __96__HMCameraClipManager_fetchClipsWithDateInterval_quality_limit_shouldOrderAscending_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      int v17 = 138543874;
      id v18 = v11;
      __int16 v19 = 2114;
      id v20 = v13;
      __int16 v21 = 2048;
      uint64_t v22 = [v5 count];
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched %lu clips", (uint8_t *)&v17, 0x20u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    id v15 = [*(id *)(a1 + 40) identifier];
    id v16 = [v15 shortDescription];
    int v17 = 138543874;
    id v18 = v14;
    __int16 v19 = 2114;
    id v20 = v16;
    __int16 v21 = 2112;
    uint64_t v22 = (uint64_t)v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch clips: %@", (uint8_t *)&v17, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchClipsWithDateInterval:(id)a3 limit:(unint64_t)a4 shouldOrderAscending:(BOOL)a5 completion:(id)a6
{
}

- (void)fetchAllClipsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v8 = (void *)[v5 initWithStartDate:v6 endDate:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__HMCameraClipManager_fetchAllClipsWithCompletion___block_invoke;
  v10[3] = &unk_1E5944EC8;
  id v11 = v4;
  id v9 = v4;
  [(HMCameraClipManager *)self fetchClipsWithDateInterval:v8 limit:-1 shouldOrderAscending:1 completion:v10];
}

void __51__HMCameraClipManager_fetchAllClipsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = a3;
    id v8 = [v5 setWithArray:a2];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    id v7 = *(void (**)(uint64_t, void))(v3 + 16);
    id v8 = a3;
    v7(v3, 0);
  }
}

- (void)fetchClipForSignificantEventWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch clip for significant event"];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = [v8 identifier];
    uint64_t v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v37 = v12;
    __int16 v38 = 2114;
    id v39 = v14;
    __int16 v40 = 2112;
    id v41 = v6;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching clip for significant event with UUID %@", buf, 0x20u);
  }
  id v15 = objc_alloc(MEMORY[0x1E4F65488]);
  id v16 = [(HMCameraClipManager *)v10 profileUniqueIdentifier];
  int v17 = (void *)[v15 initWithTarget:v16];

  id v34 = @"HMCCM.mk.seu";
  id v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
  id v35 = v18;
  __int16 v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];

  id v20 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCCM.m.fcfse" destination:v17 payload:v19];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  id v28 = __71__HMCameraClipManager_fetchClipForSignificantEventWithUUID_completion___block_invoke;
  id v29 = &unk_1E59441B0;
  id v30 = v10;
  id v31 = v8;
  id v32 = v6;
  id v33 = v7;
  id v21 = v6;
  id v22 = v7;
  id v23 = v8;
  [v20 setResponseHandler:&v26];
  uint64_t v24 = [(HMCameraClipManager *)v10 context];
  id v25 = [v24 messageDispatcher];
  [v25 sendMessage:v20 completionHandler:0];
}

void __71__HMCameraClipManager_fetchClipForSignificantEventWithUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v38[0] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  id v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMCCM.mk.c", v7);

  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = *(id *)(a1 + 32);
  id v11 = HMFGetOSLogHandle();
  id v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      uint64_t v14 = [*(id *)(a1 + 40) identifier];
      id v15 = [v14 shortDescription];
      id v16 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      id v31 = v13;
      __int16 v32 = 2114;
      id v33 = v15;
      __int16 v34 = 2112;
      id v35 = v16;
      __int16 v36 = 2112;
      id v37 = v8;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched clip for significant event with UUID %@: %@", buf, 0x2Au);
    }
    int v17 = [*(id *)(a1 + 32) context];
    id v18 = [v17 delegateCaller];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __71__HMCameraClipManager_fetchClipForSignificantEventWithUUID_completion___block_invoke_169;
    v25[3] = &unk_1E59454E8;
    __int16 v19 = &v27;
    id v27 = *(id *)(a1 + 56);
    id v26 = v8;
    [v18 invokeBlock:v25];

    id v20 = v26;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = [*(id *)(a1 + 40) identifier];
      id v23 = [v22 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v31 = v21;
      __int16 v32 = 2114;
      id v33 = v23;
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Could not find clip in response payload: %@", buf, 0x20u);
    }
    id v20 = [*(id *)(a1 + 32) context];
    uint64_t v24 = [v20 delegateCaller];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __71__HMCameraClipManager_fetchClipForSignificantEventWithUUID_completion___block_invoke_168;
    v28[3] = &unk_1E59454C0;
    __int16 v19 = &v29;
    id v29 = *(id *)(a1 + 56);
    [v24 invokeBlock:v28];
  }
}

void __71__HMCameraClipManager_fetchClipForSignificantEventWithUUID_completion___block_invoke_168(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __71__HMCameraClipManager_fetchClipForSignificantEventWithUUID_completion___block_invoke_169(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)fetchClipWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch clip for significant event"];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v13 = [v8 identifier];
    uint64_t v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v30 = v12;
    __int16 v31 = 2114;
    __int16 v32 = v14;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching clip with UUID %@", buf, 0x20u);
  }
  id v27 = @"HMCCM.mk.cu";
  id v28 = v6;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  id v16 = objc_alloc(MEMORY[0x1E4F65488]);
  int v17 = [(HMCameraClipManager *)v10 profileUniqueIdentifier];
  id v18 = (void *)[v16 initWithTarget:v17];

  __int16 v19 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCCM.m.fc" destination:v18 payload:v15];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __52__HMCameraClipManager_fetchClipWithUUID_completion___block_invoke;
  v24[3] = &unk_1E5945510;
  v24[4] = v10;
  id v25 = v8;
  id v26 = v7;
  id v20 = v7;
  id v21 = v8;
  [v19 setResponseHandler:v24];
  id v22 = [(HMCameraClipManager *)v10 context];
  id v23 = [v22 messageDispatcher];
  [v23 sendMessage:v19 completionHandler:0];
}

void __52__HMCameraClipManager_fetchClipWithUUID_completion___block_invoke(id *a1, void *a2, void *a3)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v35[0] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  id v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMCCM.mk.c", v7);

  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = a1[4];
  id v11 = HMFGetOSLogHandle();
  id v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      uint64_t v14 = [a1[5] identifier];
      id v15 = [v14 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v30 = v13;
      __int16 v31 = 2114;
      __int16 v32 = v15;
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched clip: %@", buf, 0x20u);
    }
    id v16 = [a1[4] context];
    int v17 = [v16 delegateCaller];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __52__HMCameraClipManager_fetchClipWithUUID_completion___block_invoke_166;
    v24[3] = &unk_1E59454E8;
    id v18 = &v26;
    id v26 = a1[6];
    id v25 = v8;
    [v17 invokeBlock:v24];

    __int16 v19 = v25;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      id v21 = [a1[5] identifier];
      id v22 = [v21 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v30 = v20;
      __int16 v31 = 2114;
      __int16 v32 = v22;
      __int16 v33 = 2112;
      id v34 = v6;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Could not find clip in response payload: %@", buf, 0x20u);
    }
    __int16 v19 = [a1[4] context];
    id v23 = [v19 delegateCaller];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __52__HMCameraClipManager_fetchClipWithUUID_completion___block_invoke_163;
    v27[3] = &unk_1E59454C0;
    id v18 = &v28;
    id v28 = a1[6];
    [v23 invokeBlock:v27];
  }
}

void __52__HMCameraClipManager_fetchClipWithUUID_completion___block_invoke_163(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __52__HMCameraClipManager_fetchClipWithUUID_completion___block_invoke_166(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (id)videoSegmentsAssetContextForClip:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMCameraClipManager *)self videoAssetContextsByClipUUID];
  id v7 = [v4 uniqueIdentifier];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    id v9 = [v8 expirationDate];
    id v10 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceDate:v10];
    double v12 = v11;

    if (v12 < 120.0)
    {
      int v13 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v14 = self;
      HMFGetOSLogHandle();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        int v17 = [v4 uniqueIdentifier];
        id v18 = [v17 UUIDString];
        int v22 = 138543874;
        id v23 = v16;
        __int16 v24 = 2112;
        id v25 = v18;
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Video segments asset context for clip UUID %@ has expired: %@", (uint8_t *)&v22, 0x20u);
      }
      __int16 v19 = [(HMCameraClipManager *)v14 videoAssetContextsByClipUUID];
      id v20 = [v4 uniqueIdentifier];
      [v19 setObject:0 forKeyedSubscript:v20];

      id v8 = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (void)performCloudPullWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Perform cloud pull"];
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 identifier];
    double v11 = [v10 shortDescription];
    *(_DWORD *)buf = 138543618;
    __int16 v24 = v9;
    __int16 v25 = 2114;
    __int16 v26 = v11;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Performing cloud pull", buf, 0x16u);
  }
  id v12 = objc_alloc(MEMORY[0x1E4F65488]);
  int v13 = [(HMCameraClipManager *)v7 profileUniqueIdentifier];
  uint64_t v14 = (void *)[v12 initWithTarget:v13];

  id v15 = [MEMORY[0x1E4F654B0] messageWithName:@"HMCCM.m.pcp" destination:v14 payload:0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __54__HMCameraClipManager_performCloudPullWithCompletion___block_invoke;
  v20[3] = &unk_1E5945510;
  v20[4] = v7;
  id v21 = v5;
  id v22 = v4;
  id v16 = v4;
  id v17 = v5;
  [v15 setResponseHandler:v20];
  id v18 = [(HMCameraClipManager *)v7 context];
  __int16 v19 = [v18 messageDispatcher];
  [v19 sendMessage:v15];
}

void __54__HMCameraClipManager_performCloudPullWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      double v11 = HMFGetLogIdentifier();
      id v12 = [*(id *)(a1 + 40) identifier];
      int v13 = [v12 shortDescription];
      int v20 = 138543874;
      id v21 = v11;
      __int16 v22 = 2114;
      id v23 = v13;
      __int16 v24 = 2112;
      id v25 = v5;
      uint64_t v14 = "%{public}@[%{public}@] Failed to perform cloud pull: %@";
      id v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 32;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, (uint8_t *)&v20, v17);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    double v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 40) identifier];
    int v13 = [v12 shortDescription];
    int v20 = 138543618;
    id v21 = v11;
    __int16 v22 = 2114;
    id v23 = v13;
    uint64_t v14 = "%{public}@[%{public}@] Successfully performed cloud pull";
    id v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    uint32_t v17 = 22;
    goto LABEL_6;
  }

  id v18 = [*(id *)(a1 + 32) context];
  __int16 v19 = [v18 delegateCaller];
  [v19 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)removeObserver:(id)a3
{
  id v9 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMCameraClipManager *)self delegateCallersByObservers];
  uint64_t v5 = [v4 count];

  id v6 = [(HMCameraClipManager *)self delegateCallersByObservers];
  [v6 removeObjectForKey:v9];

  id v7 = [(HMCameraClipManager *)self delegateCallersByObservers];
  uint64_t v8 = [v7 count];

  os_unfair_lock_unlock(&self->_lock);
  if (!v8 && v5) {
    [(HMCameraClipManager *)self unsubscribe];
  }
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  id v7 = [(HMCameraClipManager *)self delegateCallersByObservers];
  uint64_t v8 = [v7 count];

  if (v6)
  {
    id v9 = [[HMDelegateCaller alloc] initWithQueue:v6];
  }
  else
  {
    id v10 = [(HMCameraClipManager *)self context];
    id v9 = [v10 delegateCaller];
  }
  double v11 = [(HMCameraClipManager *)self delegateCallersByObservers];
  [v11 setObject:v9 forKey:v12];

  os_unfair_lock_unlock(&self->_lock);
  if (!v8) {
    [(HMCameraClipManager *)self subscribe];
  }
}

- (void)addObserver:(id)a3
{
}

- (void)dealloc
{
  uint64_t v3 = [(NSMapTable *)self->_delegateCallersByObservers keyEnumerator];
  id v4 = [v3 nextObject];

  if (v4) {
    [(HMCameraClipManager *)self unsubscribe];
  }
  uint64_t v5 = [(HMCameraClipManager *)self context];
  id v6 = [v5 messageDispatcher];
  [v6 deregisterReceiver:self];

  v7.receiver = self;
  v7.super_class = (Class)HMCameraClipManager;
  [(HMCameraClipManager *)&v7 dealloc];
}

- (HMCameraClipManager)initWithContext:(id)a3 profileUniqueIdentifier:(id)a4 zoneName:(id)a5 notificationCenter:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  id v15 = v14;
  if (!v14)
  {
LABEL_11:
    uint64_t v32 = _HMFPreconditionFailure();
    return (HMCameraClipManager *)__91__HMCameraClipManager_initWithContext_profileUniqueIdentifier_zoneName_notificationCenter___block_invoke(v32);
  }
  v33.receiver = self;
  v33.super_class = (Class)HMCameraClipManager;
  os_log_type_t v16 = [(HMCameraClipManager *)&v33 init];
  uint32_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_context, a3);
    uint64_t v18 = [v12 copy];
    profileUniqueIdentifier = v17->_profileUniqueIdentifier;
    v17->_profileUniqueIdentifier = (NSUUID *)v18;

    uint64_t v20 = [v13 copy];
    zoneName = v17->_zoneName;
    v17->_zoneName = (NSString *)v20;

    objc_storeStrong((id *)&v17->_notificationCenter, a6);
    uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
    clipsByFetchUUID = v17->_clipsByFetchUUID;
    v17->_clipsByFetchUUID = (NSMutableDictionary *)v22;

    uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
    significantEventsByFetchUUID = v17->_significantEventsByFetchUUID;
    v17->_significantEventsByFetchUUID = (NSMutableDictionary *)v24;

    uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionary];
    videoAssetContextsByClipUUID = v17->_videoAssetContextsByClipUUID;
    v17->_videoAssetContextsByClipUUID = (NSMutableDictionary *)v26;

    uint64_t v28 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    delegateCallersByObservers = v17->_delegateCallersByObservers;
    v17->_delegateCallersByObservers = (NSMapTable *)v28;

    id fetchClientFactory = v17->_fetchClientFactory;
    v17->_id fetchClientFactory = &__block_literal_global_44982;
  }
  return v17;
}

HMCameraObjectFetchClient *__91__HMCameraClipManager_initWithContext_profileUniqueIdentifier_zoneName_notificationCenter___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  id v12 = [[HMCameraObjectFetchClient alloc] initWithUUID:v11 context:v10 messageName:v9 destination:v8];

  return v12;
}

- (HMCameraClipManager)initWithContext:(id)a3 profileUniqueIdentifier:(id)a4 zoneName:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F28EB8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 defaultCenter];
  id v13 = [(HMCameraClipManager *)self initWithContext:v11 profileUniqueIdentifier:v10 zoneName:v9 notificationCenter:v12];

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t74 != -1) {
    dispatch_once(&logCategory__hmf_once_t74, &__block_literal_global_256);
  }
  id v2 = (void *)logCategory__hmf_once_v75;

  return v2;
}

uint64_t __34__HMCameraClipManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v75;
  logCategory__hmf_once_v75 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)zoneNameForRecordingManagementServiceUUID:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", a3);
  id v4 = [v3 UUIDString];
  uint64_t v5 = [@"camera-clips-" stringByAppendingString:v4];

  return v5;
}

@end