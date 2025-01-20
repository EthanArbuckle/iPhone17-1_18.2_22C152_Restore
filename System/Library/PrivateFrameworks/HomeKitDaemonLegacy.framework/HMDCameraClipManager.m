@interface HMDCameraClipManager
+ (double)maximumClipDuration;
+ (id)logCategory;
- (BOOL)_fetchClipsWithDateInterval:(id)a3 quality:(int64_t)a4 isAscending:(BOOL)a5 error:(id *)a6 handler:(id)a7;
- (BOOL)_fetchSignificantEventsWithDateInterval:(id)a3 isAscending:(BOOL)a4 error:(id *)a5 handler:(id)a6;
- (BOOL)areShareModificationsEnabledForManager:(id)a3;
- (BOOL)hasStartedUpCloudZone;
- (BOOL)hasWriteAccess;
- (BOOL)manager:(id)a3 shouldGrantWriteAccessToUser:(id)a4;
- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4;
- (BOOL)zoneManager:(id)a3 shouldRequestShareInvitationFromUser:(id)a4;
- (HMBCloudZone)cloudZone;
- (HMBLocalZone)localZone;
- (HMDActiveXPCClientConnectionsPeriodicTimer)clientConnectionsTimer;
- (HMDCameraClipFeedbackManager)feedbackManager;
- (HMDCameraClipManager)initWithHome:(id)a3 zoneName:(id)a4 messageDispatcher:(id)a5 workQueue:(id)a6 cameraProfileUUID:(id)a7;
- (HMDCameraClipManager)initWithZoneManager:(id)a3 quotaManager:(id)a4 faceClassificationResolver:(id)a5 clientConnectionsTimer:(id)a6 messageDispatcher:(id)a7 workQueue:(id)a8 cameraProfileUUID:(id)a9 fileManager:(id)a10 featuresDataSource:(id)a11;
- (HMDCameraClipManagerDelegate)delegate;
- (HMDCameraClipsQuotaManager)quotaManager;
- (HMDCameraSignificantEventFaceClassificationResolver)faceClassificationResolver;
- (HMDDatabaseZoneManager)zoneManager;
- (HMDFeaturesDataSource)featuresDataSource;
- (HMDFileManager)fileManager;
- (HMFMessageDispatcher)messageDispatcher;
- (NSDate)suppressNotificationsBeforeDate;
- (NSDictionary)stateDump;
- (NSString)logIdentifier;
- (NSString)zoneName;
- (NSUUID)cameraProfileUUID;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)cleanupQueue;
- (OS_dispatch_queue)workQueue;
- (id)_disableCloudStorage;
- (id)_enableCloudStorage;
- (id)_faceClassificationsForSignificantEventWithUUID:(id)a3;
- (id)_fetchCanonicalHeroFrameURLForClipModel:(id)a3;
- (id)_fetchFaceCropURLForSignificantEventModel:(id)a3;
- (id)_fetchHeroFrameURLForSignificantEventModel:(id)a3;
- (id)_handleFaceMisclassificationForFaceCropURL:(id)a3 personUUID:(id)a4 personManagerUUID:(id)a5 significantEventModel:(id)a6;
- (id)_performCloudPull;
- (id)_removeClipsWithUUIDs:(id)a3 options:(id)a4;
- (id)_significantEventFromSignificantEventModel:(id)a3;
- (id)_significantEventModelsForClipWithUUID:(id)a3;
- (id)_significantEventModelsWithUUIDs:(id)a3;
- (id)_significantEventsWithUUIDs:(id)a3;
- (id)fetchHeroFrameURLForSignificantEventWithUUID:(id)a3;
- (id)fetchServerFactory;
- (id)heroFrameURLForSignificantEventWithUUID:(id)a3;
- (id)home;
- (id)localZone:(id)a3 didProcessModelCreation:(id)a4;
- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4;
- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4;
- (id)performCloudPull;
- (id)remove;
- (id)significantEventsForClipContainingDate:(id)a3;
- (id)significantEventsForClipWithUUID:(id)a3;
- (id)significantEventsWithDateInterval:(id)a3;
- (unint64_t)fetchBatchLimit;
- (void)_cleanUpClipsForInitialStartup:(BOOL)a3;
- (void)_cleanUpExpiredClips;
- (void)_cleanUpIncompleteClipsForInitialStartup:(BOOL)a3;
- (void)_fetchAssetContextForMessage:(id)a3 propertyName:(id)a4;
- (void)_handleChangedClipModel:(id)a3 wasCreated:(BOOL)a4 mirrorOutputFuture:(id)a5;
- (void)_handleChangedFaceClassificationModel:(id)a3;
- (void)_handleChangedSignificantEventNotificationModel:(id)a3 mirrorOutputFuture:(id)a4;
- (void)_notifyForChangedSignificantEventModel:(id)a3 mirrorOutputFuture:(id)a4;
- (void)_notifyPrimaryResidentAboutFaceMisclassificationForFaceCropData:(id)a3 personUUID:(id)a4 personManagerUUID:(id)a5;
- (void)_notifyTransportsOfUpdatedClips:(id)a3 removedClipUUIDs:(id)a4;
- (void)_notifyTransportsOfUpdatedSignificantEvents:(id)a3 removedSignificantEventUUIDs:(id)a4;
- (void)_removeAllFaceClassificationModels;
- (void)cleanUpClips;
- (void)clientConnectionsTimerDidFire:(id)a3;
- (void)cloudZone:(id)a3 didEncounterZoneDisabledError:(id)a4;
- (void)configure;
- (void)handleDeleteAllClipsMessage:(id)a3;
- (void)handleDeleteClipMessage:(id)a3;
- (void)handleFetchClipForSignificantEventMessage:(id)a3;
- (void)handleFetchClipMessage:(id)a3;
- (void)handleFetchClipsMessage:(id)a3;
- (void)handleFetchCountOfClipsMessage:(id)a3;
- (void)handleFetchFaceCropDataRepresentationMessage:(id)a3;
- (void)handleFetchFaceCropURLMessage:(id)a3;
- (void)handleFetchHeroFrameDataRepresentationMessage:(id)a3;
- (void)handleFetchHeroFrameURLMessage:(id)a3;
- (void)handleFetchIsCloudStorageEnabledMessage:(id)a3;
- (void)handleFetchSignificantEventsMessage:(id)a3;
- (void)handleFetchVideoSegmentsAssetContextMessage:(id)a3;
- (void)handleHandleFaceMisclassificationMessage:(id)a3;
- (void)handleHomePersonManagerSettingsDidChangeNotification:(id)a3;
- (void)handleImportClipsMessage:(id)a3;
- (void)handlePerformCloudPullMessage:(id)a3;
- (void)handleRemoteHandleFaceMisclassificationMessage:(id)a3;
- (void)handleSubscribeMessage:(id)a3;
- (void)handleUnsubscribeMessage:(id)a3;
- (void)handleUpdateCloudStorageMessage:(id)a3;
- (void)handleUserCamerasAccessLevelDidChangeNotification:(id)a3;
- (void)handleUserPrivilegeDidChangeNotification:(id)a3;
- (void)handleUserRemoteAccessDidChangeNotification:(id)a3;
- (void)setCleanupQueue:(id)a3;
- (void)setCloudZone:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFeedbackManager:(id)a3;
- (void)setFetchBatchLimit:(unint64_t)a3;
- (void)setFetchServerFactory:(id)a3;
- (void)setHasWriteAccess:(BOOL)a3;
- (void)setLocalZone:(id)a3;
- (void)setSuppressNotificationsBeforeDate:(id)a3;
- (void)submitLogEvent:(id)a3 error:(id)a4;
- (void)zoneManager:(id)a3 didReceiveMessageWithUserInfo:(id)a4;
- (void)zoneManagerDidStart:(id)a3;
- (void)zoneManagerDidStop:(id)a3;
@end

@implementation HMDCameraClipManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchServerFactory, 0);
  objc_storeStrong((id *)&self->_cleanupQueue, 0);
  objc_storeStrong((id *)&self->_suppressNotificationsBeforeDate, 0);
  objc_storeStrong((id *)&self->_feedbackManager, 0);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_cameraProfileUUID, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_clientConnectionsTimer, 0);
  objc_storeStrong((id *)&self->_faceClassificationResolver, 0);
  objc_storeStrong((id *)&self->_quotaManager, 0);
  objc_storeStrong((id *)&self->_zoneManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (void)setFetchServerFactory:(id)a3
{
}

- (id)fetchServerFactory
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setCleanupQueue:(id)a3
{
}

- (OS_dispatch_queue)cleanupQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFetchBatchLimit:(unint64_t)a3
{
  self->_fetchBatchLimit = a3;
}

- (unint64_t)fetchBatchLimit
{
  return self->_fetchBatchLimit;
}

- (void)setSuppressNotificationsBeforeDate:(id)a3
{
}

- (NSDate)suppressNotificationsBeforeDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFeedbackManager:(id)a3
{
}

- (HMDCameraClipFeedbackManager)feedbackManager
{
  return (HMDCameraClipFeedbackManager *)objc_getProperty(self, a2, 120, 1);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 112, 1);
}

- (HMDFileManager)fileManager
{
  return (HMDFileManager *)objc_getProperty(self, a2, 104, 1);
}

- (NSUUID)cameraProfileUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 96, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 88, 1);
}

- (HMDActiveXPCClientConnectionsPeriodicTimer)clientConnectionsTimer
{
  return (HMDActiveXPCClientConnectionsPeriodicTimer *)objc_getProperty(self, a2, 80, 1);
}

- (HMDCameraSignificantEventFaceClassificationResolver)faceClassificationResolver
{
  return (HMDCameraSignificantEventFaceClassificationResolver *)objc_getProperty(self, a2, 72, 1);
}

- (HMDCameraClipsQuotaManager)quotaManager
{
  return (HMDCameraClipsQuotaManager *)objc_getProperty(self, a2, 64, 1);
}

- (HMDDatabaseZoneManager)zoneManager
{
  return (HMDDatabaseZoneManager *)objc_getProperty(self, a2, 56, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)hasWriteAccess
{
  return self->_hasWriteAccess;
}

- (void)setCloudZone:(id)a3
{
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocalZone:(id)a3
{
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraClipManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraClipManagerDelegate *)WeakRetained;
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)submitLogEvent:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v7 submitLogEvent:v6 error:v5];
}

- (void)clientConnectionsTimerDidFire:(id)a3
{
  v4 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(HMDCameraClipManager *)self _performCloudPull];
}

- (void)zoneManager:(id)a3 didReceiveMessageWithUserInfo:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [[HMDCameraClipsQuotaServerNotification alloc] initWithDictionaryRepresentation:v7];
  v10 = [(HMDCameraClipsQuotaServerNotification *)v9 containerIdentifier];
  v11 = [(HMDCameraClipManager *)self zoneManager];
  v12 = [v11 containerIdentifier];
  int v13 = [v10 isEqualToString:v12];

  if (v13)
  {
    v14 = [(HMDCameraClipManager *)self delegate];
    uint64_t v15 = [(HMDCameraClipsQuotaServerNotification *)v9 reason];
    v16 = (void *)MEMORY[0x1D9452090]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    v19 = v18;
    if (v15 == 1)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        int v22 = 138543362;
        v23 = v20;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Received all storage disabled notification", (uint8_t *)&v22, 0xCu);
      }
      if (objc_opt_respondsToSelector()) {
        [v14 clipManagerDidDisableCloudStorage:v17];
      }
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v21 = HMFGetLogIdentifier();
        int v22 = 138543618;
        v23 = v21;
        __int16 v24 = 2112;
        v25 = v9;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Received unknown notification: %@", (uint8_t *)&v22, 0x16u);
      }
    }
  }
}

- (void)zoneManagerDidStop:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v11 = 138543362;
    v12 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Camera clips zone manager stopped", (uint8_t *)&v11, 0xCu);
  }
  [(HMDCameraClipManager *)v7 setLocalZone:0];
  [(HMDCameraClipManager *)v7 setCloudZone:0];
  v10 = [(HMDCameraClipManager *)v7 delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 clipManagerDidStop:v7];
  }
}

- (void)zoneManagerDidStart:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v48 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Camera clips zone manager started", buf, 0xCu);
  }
  v10 = [v4 localZone];
  [(HMDCameraClipManager *)v7 setLocalZone:v10];

  int v11 = [(HMDCameraClipManager *)v7 localZone];
  [v11 addObserverForAllModels:v7];

  v12 = [(HMDCameraClipManager *)v7 localZone];
  [v12 startUp];

  [(HMDCameraClipManager *)v7 _cleanUpClipsForInitialStartup:1];
  uint64_t v13 = [v4 cloudZone];
  [(HMDCameraClipManager *)v7 setCloudZone:v13];

  v14 = [(HMDCameraClipManager *)v7 cloudZone];
  char v15 = [v14 hasPerformedInitialFetch];

  if ((v15 & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F1C9C8] date];
    [(HMDCameraClipManager *)v7 setSuppressNotificationsBeforeDate:v16];

    v17 = (void *)MEMORY[0x1D9452090]();
    v18 = v7;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      v21 = [(HMDCameraClipManager *)v18 suppressNotificationsBeforeDate];
      *(_DWORD *)buf = 138543618;
      v48 = v20;
      __int16 v49 = 2112;
      v50 = v21;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Suppressing all clip-related notifications before %@", buf, 0x16u);
    }
  }
  int v22 = [(HMDCameraClipManager *)v7 cloudZone];
  v23 = [v22 startUp];
  __int16 v24 = (void *)MEMORY[0x1E4F7A0F0];
  v25 = [(HMDCameraClipManager *)v7 workQueue];
  uint64_t v26 = [v24 schedulerWithDispatchQueue:v25];
  v27 = [v23 reschedule:v26];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __44__HMDCameraClipManager_zoneManagerDidStart___block_invoke;
  v46[3] = &unk_1E6A19708;
  v46[4] = v7;
  id v28 = (id)[v27 addSuccessBlock:v46];

  v29 = [(HMDCameraClipManager *)v7 delegate];
  if (objc_opt_respondsToSelector()) {
    [v29 clipManagerDidStart:v7];
  }
  v30 = [v4 home];
  if (v30)
  {
    v31 = [HMDCameraClipFeedbackManager alloc];
    v32 = [(HMDCameraClipManager *)v7 localZone];
    v33 = [(HMDCameraClipManager *)v7 cloudZone];
    v34 = [(HMDCameraClipManager *)v7 messageDispatcher];
    v35 = [(HMDCameraClipManager *)v7 cameraProfileUUID];
    v36 = [(HMDCameraClipManager *)v7 messageTargetUUID];
    [(HMDCameraClipManager *)v7 workQueue];
    v37 = id v45 = v4;
    v38 = [(HMDCameraClipFeedbackManager *)v31 initWithLocalZone:v32 cloudZone:v33 home:v30 messageDispatcher:v34 cameraProfileUUID:v35 messageTargetUUID:v36 workQueue:v37];
    [(HMDCameraClipManager *)v7 setFeedbackManager:v38];

    v39 = [(HMDCameraClipManager *)v7 feedbackManager];
    v40 = +[HMDDeviceCapabilities deviceCapabilities];
    objc_msgSend(v39, "configureWithIsCurrentDeviceResidentCapable:", objc_msgSend(v40, "isResidentCapable"));

    id v4 = v45;
  }
  else
  {
    v41 = (void *)MEMORY[0x1D9452090]();
    v42 = v7;
    v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v48 = v44;
      _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot create feedback manager because home reference is nil", buf, 0xCu);
    }
  }
}

void __44__HMDCameraClipManager_zoneManagerDidStart___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    int v11 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Camera clips cloud zone finished starting up", (uint8_t *)&v10, 0xCu);
  }
  v9 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 clipManagerDidStartUpCloudZone:*(void *)(a1 + 32)];
  }
}

- (BOOL)zoneManager:(id)a3 shouldRequestShareInvitationFromUser:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = [v5 isOwner];
  return (char)v6;
}

- (BOOL)areShareModificationsEnabledForManager:(id)a3
{
  id v4 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v4);

  return [(HMDCameraClipManager *)self hasWriteAccess];
}

- (BOOL)manager:(id)a3 shouldGrantWriteAccessToUser:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = [v5 isAdministrator];
  return (char)v6;
}

- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = [v5 hasCameraClipsAccess];
  return (char)v6;
}

- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDCameraClipManager *)self workQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__HMDCameraClipManager_localZone_didProcessModelDeletion___block_invoke;
  v9[3] = &unk_1E6A197C8;
  id v10 = v5;
  int v11 = self;
  id v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

void __58__HMDCameraClipManager_localZone_didProcessModelDeletion___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) model];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (!v4)
  {
    int v11 = [*(id *)(a1 + 32) model];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = *(id *)(a1 + 40);
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = HMFGetLogIdentifier();
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        v18 = [v13 hmbModelID];

        if (v18)
        {
          v19 = [v13 hmbModelID];
          [v19 getUUIDBytes:buf];
        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
        }
        long long v40 = *(_OWORD *)buf;
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 1042;
        *(_DWORD *)&buf[14] = 16;
        __int16 v43 = 2098;
        v44 = &v40;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Significant event notification deleted with UUID: %{public,uuid_t}.16P", buf, 0x1Cu);
      }
      v35 = *(void **)(a1 + 40);
      id v22 = [MEMORY[0x1E4F1CAD0] set];
      v36 = (void *)MEMORY[0x1E4F1CAD0];
      v37 = [v13 hmbModelID];
      v38 = [v36 setWithObject:v37];
      [v35 _notifyTransportsOfUpdatedSignificantEvents:v22 removedSignificantEventUUIDs:v38];
    }
    else
    {
      v20 = [*(id *)(a1 + 32) model];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v21 = v20;
      }
      else {
        v21 = 0;
      }
      id v22 = v21;

      if (v22)
      {
        v23 = (void *)MEMORY[0x1D9452090]();
        id v24 = *(id *)(a1 + 40);
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v26 = HMFGetLogIdentifier();
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          v27 = [v22 hmbModelID];

          if (v27)
          {
            id v28 = [v22 hmbModelID];
            [v28 getUUIDBytes:buf];
          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
          }
          long long v39 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v26;
          *(_WORD *)&buf[12] = 1042;
          *(_DWORD *)&buf[14] = 16;
          __int16 v43 = 2098;
          v44 = &v39;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Significant event face classification deleted with UUID: %{public,uuid_t}.16P", buf, 0x1Cu);
        }
        [*(id *)(a1 + 40) _handleChangedFaceClassificationModel:v22];
      }
      id v13 = 0;
    }
    goto LABEL_33;
  }
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    v9 = [v4 hmbModelID];

    if (v9)
    {
      id v10 = [v4 hmbModelID];
      [v10 getUUIDBytes:buf];
    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
    }
    long long v41 = *(_OWORD *)buf;
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 1042;
    *(_DWORD *)&buf[14] = 16;
    __int16 v43 = 2098;
    v44 = &v41;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Clip deleted with UUID: %{public,uuid_t}.16P", buf, 0x1Cu);
  }
  v29 = *(void **)(a1 + 40);
  v30 = [MEMORY[0x1E4F1CAD0] set];
  v31 = (void *)MEMORY[0x1E4F1CAD0];
  v32 = [v4 hmbModelID];
  v33 = [v31 setWithObject:v32];
  [v29 _notifyTransportsOfUpdatedClips:v30 removedClipUUIDs:v33];

  id v13 = [*(id *)(a1 + 40) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v34 = *(void *)(a1 + 40);
    id v22 = [v4 hmbModelID];
    [v13 clipManager:v34 didDeleteClipWithUUID:v22];
LABEL_33:
  }
}

- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDCameraClipManager *)self workQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__HMDCameraClipManager_localZone_didProcessModelUpdate___block_invoke;
  v9[3] = &unk_1E6A197C8;
  id v10 = v5;
  int v11 = self;
  id v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

void __56__HMDCameraClipManager_localZone_didProcessModelUpdate___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) model];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 40);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      v9 = [v4 hmbModelID];

      if (v9)
      {
        id v10 = [v4 hmbModelID];
        [v10 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
      }
      long long v33 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      __int16 v35 = 2098;
      v36 = &v33;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Clip updated with UUID: %{public,uuid_t}.16P", buf, 0x1Cu);
    }
    v29 = *(void **)(a1 + 40);
    id v13 = [*(id *)(a1 + 32) mirrorOutputFuture];
    [v29 _handleChangedClipModel:v4 wasCreated:0 mirrorOutputFuture:v13];
  }
  else
  {
    int v11 = [*(id *)(a1 + 32) model];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = *(id *)(a1 + 40);
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = HMFGetLogIdentifier();
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        v18 = [v13 hmbModelID];

        if (v18)
        {
          v19 = [v13 hmbModelID];
          [v19 getUUIDBytes:buf];
        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
        }
        long long v32 = *(_OWORD *)buf;
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 1042;
        *(_DWORD *)&buf[14] = 16;
        __int16 v35 = 2098;
        v36 = &v32;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Significant event notification updated with UUID: %{public,uuid_t}.16P", buf, 0x1Cu);
      }
      v30 = *(void **)(a1 + 40);
      id v22 = [*(id *)(a1 + 32) mirrorOutputFuture];
      [v30 _handleChangedSignificantEventNotificationModel:v13 mirrorOutputFuture:v22];
    }
    else
    {
      v20 = [*(id *)(a1 + 32) model];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v21 = v20;
      }
      else {
        v21 = 0;
      }
      id v22 = v21;

      if (v22)
      {
        v23 = (void *)MEMORY[0x1D9452090]();
        id v24 = *(id *)(a1 + 40);
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = HMFGetLogIdentifier();
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          v27 = [v22 hmbModelID];

          if (v27)
          {
            id v28 = [v22 hmbModelID];
            [v28 getUUIDBytes:buf];
          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
          }
          long long v31 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v26;
          *(_WORD *)&buf[12] = 1042;
          *(_DWORD *)&buf[14] = 16;
          __int16 v35 = 2098;
          v36 = &v31;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Face classification updated with UUID: %{public,uuid_t}.16P", buf, 0x1Cu);
        }
        [*(id *)(a1 + 40) _handleChangedFaceClassificationModel:v22];
      }
    }
  }
}

- (id)localZone:(id)a3 didProcessModelCreation:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDCameraClipManager *)self workQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__HMDCameraClipManager_localZone_didProcessModelCreation___block_invoke;
  v9[3] = &unk_1E6A197C8;
  id v10 = v5;
  int v11 = self;
  id v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

void __58__HMDCameraClipManager_localZone_didProcessModelCreation___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) model];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 40);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      v9 = [v4 hmbModelID];

      if (v9)
      {
        id v10 = [v4 hmbModelID];
        [v10 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
      }
      long long v33 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      __int16 v35 = 2098;
      v36 = &v33;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@New clip received with UUID: %{public,uuid_t}.16P", buf, 0x1Cu);
    }
    v29 = *(void **)(a1 + 40);
    id v13 = [*(id *)(a1 + 32) mirrorOutputFuture];
    [v29 _handleChangedClipModel:v4 wasCreated:1 mirrorOutputFuture:v13];
  }
  else
  {
    int v11 = [*(id *)(a1 + 32) model];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = *(id *)(a1 + 40);
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = HMFGetLogIdentifier();
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        v18 = [v13 hmbModelID];

        if (v18)
        {
          v19 = [v13 hmbModelID];
          [v19 getUUIDBytes:buf];
        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
        }
        long long v32 = *(_OWORD *)buf;
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 1042;
        *(_DWORD *)&buf[14] = 16;
        __int16 v35 = 2098;
        v36 = &v32;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@New significant event notification received with UUID: %{public,uuid_t}.16P", buf, 0x1Cu);
      }
      v30 = *(void **)(a1 + 40);
      id v22 = [*(id *)(a1 + 32) mirrorOutputFuture];
      [v30 _handleChangedSignificantEventNotificationModel:v13 mirrorOutputFuture:v22];
    }
    else
    {
      v20 = [*(id *)(a1 + 32) model];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v21 = v20;
      }
      else {
        v21 = 0;
      }
      id v22 = v21;

      if (v22)
      {
        v23 = (void *)MEMORY[0x1D9452090]();
        id v24 = *(id *)(a1 + 40);
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = HMFGetLogIdentifier();
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          v27 = [v22 hmbModelID];

          if (v27)
          {
            id v28 = [v22 hmbModelID];
            [v28 getUUIDBytes:buf];
          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
          }
          long long v31 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v26;
          *(_WORD *)&buf[12] = 1042;
          *(_DWORD *)&buf[14] = 16;
          __int16 v35 = 2098;
          v36 = &v31;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@New face classification received with UUID: %{public,uuid_t}.16P", buf, 0x1Cu);
        }
      }
    }
  }
}

- (void)cloudZone:(id)a3 didEncounterZoneDisabledError:(id)a4
{
  id v5 = [(HMDCameraClipManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__HMDCameraClipManager_cloudZone_didEncounterZoneDisabledError___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v5, block);
}

void __64__HMDCameraClipManager_cloudZone_didEncounterZoneDisabledError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 clipManagerDidEncounterDisabledCloudStorage:*(void *)(a1 + 32)];
  }
}

- (NSUUID)messageTargetUUID
{
  id v2 = [(HMDCameraClipManager *)self zoneManager];
  id v3 = [v2 messageTargetUUID];

  return (NSUUID *)v3;
}

- (void)handleHomePersonManagerSettingsDidChangeNotification:(id)a3
{
  id v4 = [(HMDCameraClipManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__HMDCameraClipManager_handleHomePersonManagerSettingsDidChangeNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __77__HMDCameraClipManager_handleHomePersonManagerSettingsDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) zoneManager];
  id v3 = [v2 defaultConfiguration];
  int v4 = [v3 isZoneOwner];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) home];
    id v6 = [v5 personManagerSettings];
    char v7 = [v6 isFaceClassificationEnabled];

    if ((v7 & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = *(id *)(a1 + 32);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = HMFGetLogIdentifier();
        int v12 = 138543362;
        id v13 = v11;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Home person manager face classification is disabled; removing all face classification models",
          (uint8_t *)&v12,
          0xCu);
      }
      [*(id *)(a1 + 32) _removeAllFaceClassificationModels];
    }
  }
}

- (void)handleUserRemoteAccessDidChangeNotification:(id)a3
{
  int v4 = [(HMDCameraClipManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HMDCameraClipManager_handleUserRemoteAccessDidChangeNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __68__HMDCameraClipManager_handleUserRemoteAccessDidChangeNotification___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) zoneManager];
  [v1 updateShareParticipants];
}

- (void)handleUserCamerasAccessLevelDidChangeNotification:(id)a3
{
  int v4 = [(HMDCameraClipManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HMDCameraClipManager_handleUserCamerasAccessLevelDidChangeNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __74__HMDCameraClipManager_handleUserCamerasAccessLevelDidChangeNotification___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) zoneManager];
  [v1 updateShareParticipants];
}

- (void)handleUserPrivilegeDidChangeNotification:(id)a3
{
  int v4 = [(HMDCameraClipManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HMDCameraClipManager_handleUserPrivilegeDidChangeNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __65__HMDCameraClipManager_handleUserPrivilegeDidChangeNotification___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) zoneManager];
  [v1 updateShareParticipants];
}

- (void)handleUpdateCloudStorageMessage:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v9;
    __int16 v27 = 2114;
    id v28 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling update cloud storage message: %{public}@", buf, 0x16u);
  }
  int v11 = [(HMDCameraClipManager *)v7 cloudZone];

  if (v11)
  {
    if ([v4 BOOLForKey:*MEMORY[0x1E4F2CBC8]])
    {
      int v12 = [(HMDCameraClipManager *)v7 _enableCloudStorage];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __56__HMDCameraClipManager_handleUpdateCloudStorageMessage___block_invoke;
      v23[3] = &unk_1E6A17A30;
      id v24 = v4;
      id v13 = (id)[v12 addCompletionBlock:v23];

      uint64_t v14 = v24;
    }
    else
    {
      v19 = [(HMDCameraClipManager *)v7 _disableCloudStorage];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __56__HMDCameraClipManager_handleUpdateCloudStorageMessage___block_invoke_2;
      v21[3] = &unk_1E6A17A30;
      id v22 = v4;
      id v20 = (id)[v19 addCompletionBlock:v21];

      uint64_t v14 = v22;
    }
  }
  else
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    v16 = v7;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot update cloud storage because zones are not ready", buf, 0xCu);
    }
    uint64_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v14];
  }
}

uint64_t __56__HMDCameraClipManager_handleUpdateCloudStorageMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

uint64_t __56__HMDCameraClipManager_handleUpdateCloudStorageMessage___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

- (void)handleFetchIsCloudStorageEnabledMessage:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    long long v39 = v9;
    __int16 v40 = 2114;
    long long v41 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch is cloud storage enabled message: %{public}@", buf, 0x16u);
  }
  int v11 = [(HMDCameraClipManager *)v7 cloudZone];

  if (!v11)
  {
    id v24 = (void *)MEMORY[0x1D9452090]();
    v25 = v7;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v39 = v27;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch is cloud storage enabled because zones are not ready", buf, 0xCu);
    }
    uint64_t v28 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    goto LABEL_12;
  }
  int v12 = [(HMDCameraClipManager *)v7 zoneManager];
  id v13 = [v12 defaultConfiguration];
  char v14 = [v13 isZoneOwner];

  if ((v14 & 1) == 0)
  {
    uint64_t v29 = (void *)MEMORY[0x1D9452090]();
    v30 = v7;
    long long v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      long long v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v39 = v32;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@User is not the zone owner; cannot fetch is cloud storage enabled",
        buf,
        0xCu);
    }
    uint64_t v28 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
LABEL_12:
    long long v33 = (void *)v28;
    [v4 respondWithError:v28];

    goto LABEL_13;
  }
  id v15 = [(HMDCameraClipManager *)v7 quotaManager];
  v16 = [v15 fetchNamesForZonesWithEnabledCloudStorage];
  v17 = (void *)MEMORY[0x1E4F7A0F0];
  v18 = [(HMDCameraClipManager *)v7 workQueue];
  v19 = [v17 schedulerWithDispatchQueue:v18];
  id v20 = [v16 reschedule:v19];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __64__HMDCameraClipManager_handleFetchIsCloudStorageEnabledMessage___block_invoke;
  v36[3] = &unk_1E6A12C08;
  v36[4] = v7;
  id v21 = v4;
  id v37 = v21;
  id v22 = [v20 addSuccessBlock:v36];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __64__HMDCameraClipManager_handleFetchIsCloudStorageEnabledMessage___block_invoke_221;
  v34[3] = &unk_1E6A196E0;
  v34[4] = v7;
  id v35 = v21;
  id v23 = (id)[v22 addFailureBlock:v34];

LABEL_13:
}

void __64__HMDCameraClipManager_handleFetchIsCloudStorageEnabledMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) zoneManager];
  id v5 = [v4 zoneName];
  uint64_t v6 = [v3 containsObject:v5];

  char v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v11 = HMFEnabledStatusToString();
    *(_DWORD *)buf = 138543618;
    v18 = v10;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetched is cloud storage enabled: %@", buf, 0x16u);
  }
  int v12 = *(void **)(a1 + 40);
  id v13 = objc_msgSend(NSNumber, "numberWithBool:", v6, *MEMORY[0x1E4F2CBC8]);
  v16 = v13;
  char v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  [v12 respondWithPayload:v14];
}

void __64__HMDCameraClipManager_handleFetchIsCloudStorageEnabledMessage___block_invoke_221(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    char v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch is cloud storage enabled: %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 40) respondWithError:v3];
}

- (void)handleImportClipsMessage:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    __int16 v10 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    __int16 v43 = v9;
    __int16 v44 = 2114;
    id v45 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling import clips message: %{public}@", buf, 0x16u);
  }
  id v11 = [(HMDCameraClipManager *)v7 localZone];

  if (v11)
  {
    uint64_t v12 = [v4 dataForKey:*MEMORY[0x1E4F2CB88]];
    if (v12)
    {
      id v13 = (void *)MEMORY[0x1E4F28DC0];
      char v14 = (void *)MEMORY[0x1E4F1CAD0];
      v41[0] = objc_opt_class();
      v41[1] = objc_opt_class();
      v41[2] = objc_opt_class();
      v41[3] = objc_opt_class();
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
      v16 = [v14 setWithArray:v15];
      id v40 = 0;
      v17 = [v13 unarchivedObjectOfClasses:v16 fromData:v12 error:&v40];
      id v18 = v40;

      if (v17)
      {
        __int16 v19 = [HMDCameraClipImporter alloc];
        id v20 = [(HMDCameraClipManager *)v7 localZone];
        uint64_t v21 = [(HMDCameraClipManager *)v7 cameraProfileUUID];
        id v22 = [(HMDCameraClipImporter *)v19 initWithLocalZone:v20 cameraProfileUUID:v21];

        id v23 = [(HMDCameraClipImporter *)v22 importClipsWithImportData:v17];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __49__HMDCameraClipManager_handleImportClipsMessage___block_invoke;
        v38[3] = &unk_1E6A17A30;
        id v39 = v4;
        id v24 = (id)[v23 addCompletionBlock:v38];
      }
      else
      {
        uint64_t v34 = (void *)MEMORY[0x1D9452090]();
        id v35 = v7;
        v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          id v37 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          __int16 v43 = v37;
          __int16 v44 = 2112;
          id v45 = v18;
          _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive camera clips import dictionary from clip data: %@", buf, 0x16u);
        }
        [v4 respondWithError:v18];
      }
    }
    else
    {
      uint64_t v29 = (void *)MEMORY[0x1D9452090]();
      v30 = v7;
      long long v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        long long v32 = HMFGetLogIdentifier();
        long long v33 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        __int16 v43 = v32;
        __int16 v44 = 2112;
        id v45 = v33;
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Could not find serialized import data in message payload: %@", buf, 0x16u);
      }
      id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v4 respondWithError:v18];
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x1D9452090]();
    uint64_t v26 = v7;
    __int16 v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v43 = v28;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot import clips because zones are not ready", buf, 0xCu);
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v12];
  }
}

uint64_t __49__HMDCameraClipManager_handleImportClipsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

- (void)handleRemoteHandleFaceMisclassificationMessage:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    __int16 v10 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling remote handle face misclassification message: %{public}@", buf, 0x16u);
  }
  id v11 = [(HMDCameraClipManager *)v7 localZone];

  if (v11)
  {
    uint64_t v12 = [v4 dataForKey:@"HMDCCM.mk.fmfcd"];
    id v13 = [v4 uuidForKey:@"HMDCCM.mk.fmpu"];
    uint64_t v14 = [v4 uuidForKey:@"HMDCCM.mk.fmpmu"];
    uint64_t v15 = (void *)v14;
    if (v12 && v14 && v13)
    {
      v16 = [(HMDCameraClipManager *)v7 faceClassificationResolver];
      v17 = [v16 personManagerWithUUID:v15];

      if (v17)
      {
        [v17 handleFaceMisclassificationForFaceCropData:v12 personUUID:v13];
        [v4 respondWithSuccess];
      }
      else
      {
        __int16 v27 = (void *)MEMORY[0x1D9452090]();
        uint64_t v28 = v7;
        uint64_t v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = HMFGetLogIdentifier();
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          [v15 getUUIDBytes:buf];
          long long v32 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&buf[12] = 1042;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&unsigned char buf[18] = 2098;
          *(void *)&buf[20] = &v32;
          _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Could not find person manager with UUID %{public,uuid_t}.16P to handle misclassified person", buf, 0x1Cu);
        }
        long long v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        [v4 respondWithError:v31];

        v17 = 0;
      }
    }
    else
    {
      id v22 = (void *)MEMORY[0x1D9452090]();
      id v23 = v7;
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        uint64_t v26 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v26;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Could not find all face misclassification information in message payload: %@", buf, 0x16u);
      }
      v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      [v4 respondWithError:v17];
    }
  }
  else
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    __int16 v19 = v7;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle face misclassification because zones are not ready", buf, 0xCu);
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v12];
  }
}

- (void)handleHandleFaceMisclassificationMessage:(id)a3
{
  v67[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    __int16 v10 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling handle face misclassification message: %{public}@", buf, 0x16u);
  }
  id v11 = [(HMDCameraClipManager *)v7 localZone];

  if (v11)
  {
    uint64_t v12 = *MEMORY[0x1E4F2CC00];
    v67[0] = objc_opt_class();
    v67[1] = objc_opt_class();
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
    uint64_t v14 = [v4 unarchivedObjectForKey:v12 ofClasses:v13];

    uint64_t v15 = [v14 firstObject];
    v16 = v15;
    if (v15)
    {
      v17 = [v15 faceClassification];
      id v18 = v17;
      if (v17)
      {
        __int16 v19 = [v17 person];
        if (v19)
        {
          id v20 = [(HMDCameraClipManager *)v7 localZone];
          uint64_t v21 = [v16 uniqueIdentifier];
          id v64 = 0;
          id v22 = [v20 fetchModelWithModelID:v21 ofType:objc_opt_class() error:&v64];
          id v23 = v64;

          if (v22)
          {
            v54 = [(HMDCameraClipManager *)v7 _fetchFaceCropURLForSignificantEventModel:v22];
            v60[0] = MEMORY[0x1E4F143A8];
            v60[1] = 3221225472;
            v60[2] = __65__HMDCameraClipManager_handleHandleFaceMisclassificationMessage___block_invoke;
            v60[3] = &unk_1E6A12BE0;
            v60[4] = v7;
            id v61 = v19;
            id v62 = v18;
            id v63 = v22;
            id v24 = [v54 flatMap:v60];
            v58[0] = MEMORY[0x1E4F143A8];
            v58[1] = 3221225472;
            v58[2] = __65__HMDCameraClipManager_handleHandleFaceMisclassificationMessage___block_invoke_2;
            v58[3] = &unk_1E6A19708;
            id v25 = v4;
            id v59 = v25;
            [v24 addSuccessBlock:v58];
            uint64_t v26 = v22;
            uint64_t v28 = v27 = v23;
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __65__HMDCameraClipManager_handleHandleFaceMisclassificationMessage___block_invoke_3;
            v56[3] = &unk_1E6A197F0;
            id v57 = v25;
            id v29 = (id)[v28 addFailureBlock:v56];

            id v23 = v27;
            id v22 = v26;
          }
          else
          {
            v47 = (void *)MEMORY[0x1D9452090]();
            v48 = v7;
            __int16 v49 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              v55 = v47;
              v53 = HMFGetLogIdentifier();
              *(void *)buf = 0;
              *(void *)&buf[8] = 0;
              v50 = [v16 uniqueIdentifier];

              if (v50)
              {
                uint64_t v51 = [v16 uniqueIdentifier];
                [v51 getUUIDBytes:buf];
              }
              else
              {
                *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
              }
              long long v65 = *(_OWORD *)buf;
              *(_DWORD *)buf = 138544130;
              *(void *)&uint8_t buf[4] = v53;
              *(_WORD *)&buf[12] = 1042;
              *(_DWORD *)&buf[14] = 16;
              *(_WORD *)&unsigned char buf[18] = 2098;
              *(void *)&buf[20] = &v65;
              *(_WORD *)&unsigned char buf[28] = 2112;
              *(void *)&buf[30] = v23;
              _os_log_impl(&dword_1D49D5000, v49, OS_LOG_TYPE_ERROR, "%{public}@Could not find significant event model with UUID %{public,uuid_t}.16P: %@", buf, 0x26u);

              v47 = v55;
            }

            v52 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
            [v4 respondWithError:v52];
          }
        }
        else
        {
          __int16 v43 = (void *)MEMORY[0x1D9452090]();
          __int16 v44 = v7;
          id v45 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            uint64_t v46 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v46;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v18;
            _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle misclassification for face classification without a person: %@", buf, 0x16u);
          }
          id v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
          [v4 respondWithError:v23];
        }
      }
      else
      {
        id v39 = (void *)MEMORY[0x1D9452090]();
        id v40 = v7;
        long long v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          uint64_t v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v42;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v16;
          _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "%{public}@Could not find face classification on significant event: %@", buf, 0x16u);
        }
        __int16 v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        [v4 respondWithError:v19];
      }
    }
    else
    {
      uint64_t v34 = (void *)MEMORY[0x1D9452090]();
      id v35 = v7;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        id v37 = HMFGetLogIdentifier();
        v38 = [v4 messagePayload];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v37;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v38;
        _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@Could not find significant event in decoded significant events %@ in message payload: %@", buf, 0x20u);
      }
      id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      [v4 respondWithError:v18];
    }
  }
  else
  {
    v30 = (void *)MEMORY[0x1D9452090]();
    long long v31 = v7;
    long long v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      long long v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v33;
      _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle face misclassification because zones are not ready", buf, 0xCu);
    }
    uint64_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v14];
  }
}

id __65__HMDCameraClipManager_handleHandleFaceMisclassificationMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v4 UUID];
  char v7 = [*(id *)(a1 + 48) personManagerUUID];
  int v8 = [v3 _handleFaceMisclassificationForFaceCropURL:v5 personUUID:v6 personManagerUUID:v7 significantEventModel:*(void *)(a1 + 56)];

  return v8;
}

uint64_t __65__HMDCameraClipManager_handleHandleFaceMisclassificationMessage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondWithSuccess];
}

uint64_t __65__HMDCameraClipManager_handleHandleFaceMisclassificationMessage___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithError:a2];
}

- (void)handleDeleteAllClipsMessage:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v27 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling delete all clips message", buf, 0xCu);
  }
  __int16 v10 = [(HMDCameraClipManager *)v7 localZone];

  if (v10)
  {
    id v11 = [(HMDCameraClipManager *)v7 localZone];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    id v13 = (void *)MEMORY[0x1E4F69EF0];
    uint64_t v14 = [v4 name];
    uint64_t v15 = [v13 optionsWithLabel:v14];
    v16 = [v11 removeAllModelsOfTypes:v12 options:v15];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __52__HMDCameraClipManager_handleDeleteAllClipsMessage___block_invoke;
    v23[3] = &unk_1E6A12BB8;
    id v24 = v4;
    id v17 = (id)[v16 addCompletionBlock:v23];

    id v18 = v24;
  }
  else
  {
    __int16 v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = v7;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v27 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot delete clips because zones are not ready", buf, 0xCu);
    }
    id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v18];
  }
}

uint64_t __52__HMDCameraClipManager_handleDeleteAllClipsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

- (void)handleDeleteClipMessage:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    __int16 v10 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    long long v32 = v9;
    __int16 v33 = 2114;
    uint64_t v34 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling delete clip message: %{public}@", buf, 0x16u);
  }
  id v11 = [(HMDCameraClipManager *)v7 localZone];

  if (v11)
  {
    uint64_t v12 = [v4 uuidForKey:*MEMORY[0x1E4F2CB90]];
    if (v12)
    {
      id v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
      uint64_t v14 = (void *)MEMORY[0x1E4F69EF0];
      uint64_t v15 = [v4 name];
      v16 = [v14 optionsWithLabel:v15];
      id v17 = [(HMDCameraClipManager *)v7 _removeClipsWithUUIDs:v13 options:v16];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __48__HMDCameraClipManager_handleDeleteClipMessage___block_invoke;
      v29[3] = &unk_1E6A17A30;
      id v30 = v4;
      id v18 = (id)[v17 addCompletionBlock:v29];

      __int16 v19 = v30;
    }
    else
    {
      id v24 = (void *)MEMORY[0x1D9452090]();
      id v25 = v7;
      uint64_t v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = HMFGetLogIdentifier();
        uint64_t v28 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        long long v32 = v27;
        __int16 v33 = 2112;
        uint64_t v34 = v28;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Could not find clip UUID in message payload: %@", buf, 0x16u);
      }
      __int16 v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v4 respondWithError:v19];
    }
  }
  else
  {
    id v20 = (void *)MEMORY[0x1D9452090]();
    uint64_t v21 = v7;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v32 = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cannot delete clip because zones are not ready", buf, 0xCu);
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v12];
  }
}

uint64_t __48__HMDCameraClipManager_handleDeleteClipMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

- (void)handleFetchSignificantEventsMessage:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    __int16 v10 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    v56 = v9;
    __int16 v57 = 2114;
    id v58 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch significant event message: %{public}@", buf, 0x16u);
  }
  id v11 = [(HMDCameraClipManager *)v7 localZone];

  if (v11)
  {
    uint64_t v12 = [v4 setForKey:*MEMORY[0x1E4F2CBF8]];
    id v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v12 allObjects];
      uint64_t v15 = [(HMDCameraClipManager *)v7 _significantEventsWithUUIDs:v14];

      uint64_t v53 = *MEMORY[0x1E4F2CC00];
      v16 = encodeRootObjectForIncomingXPCMessage(v15, 0);
      v54 = v16;
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      [v4 respondWithPayload:v17];
    }
    else
    {
      id v22 = [(HMDCameraClipManager *)v7 fetchServerFactory];
      uint64_t v15 = ((void (**)(void, id))v22)[2](v22, v4);

      if (v15)
      {
        v16 = [v4 dateForKey:*MEMORY[0x1E4F2CBB0]];
        id v23 = [v4 dateForKey:*MEMORY[0x1E4F2CBB8]];
        id v24 = [v4 numberForKey:*MEMORY[0x1E4F2CBD0]];
        uint64_t v25 = [v4 numberForKey:*MEMORY[0x1E4F2CBF0]];
        uint64_t v26 = (void *)v25;
        v47 = v24;
        if (v16 && v23 && v24 && v25)
        {
          id v27 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v16 endDate:v23];
          uint64_t v28 = [v26 BOOLValue];
          objc_msgSend(v15, "setTotalFetchedObjectsLimit:", objc_msgSend(v24, "unsignedIntegerValue"));
          id v52 = 0;
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __60__HMDCameraClipManager_handleFetchSignificantEventsMessage___block_invoke;
          v50[3] = &unk_1E6A128E0;
          id v29 = v15;
          id v51 = v29;
          LOBYTE(v28) = [(HMDCameraClipManager *)v7 _fetchSignificantEventsWithDateInterval:v27 isAscending:v28 error:&v52 handler:v50];
          id v45 = v52;
          if (v28)
          {
            v48[0] = MEMORY[0x1E4F143A8];
            v48[1] = 3221225472;
            v48[2] = __60__HMDCameraClipManager_handleFetchSignificantEventsMessage___block_invoke_215;
            v48[3] = &unk_1E6A19B30;
            id v49 = v4;
            [v29 sendCurrentlyBatchedFetchedObjectsWithCompletion:v48];

            id v30 = v45;
          }
          else
          {
            id v40 = (void *)MEMORY[0x1D9452090]();
            long long v41 = v7;
            uint64_t v42 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              __int16 v43 = v44 = v40;
              *(_DWORD *)buf = 138543618;
              v56 = v43;
              __int16 v57 = 2112;
              id v58 = v45;
              _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch significant event models from local zone: %@", buf, 0x16u);

              id v40 = v44;
            }

            id v30 = v45;
            [v4 respondWithError:v45];
          }
        }
        else
        {
          uint64_t v35 = (void *)MEMORY[0x1D9452090]();
          v36 = v7;
          id v37 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v38 = HMFGetLogIdentifier();
            [v4 messagePayload];
            id v39 = v46 = v23;
            *(_DWORD *)buf = 138543618;
            v56 = v38;
            __int16 v57 = 2112;
            id v58 = v39;
            _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Could not find required value in message payload: %@", buf, 0x16u);

            id v23 = v46;
          }

          id v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
          [v4 respondWithError:v27];
        }
      }
      else
      {
        long long v31 = (void *)MEMORY[0x1D9452090]();
        long long v32 = v7;
        __int16 v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          uint64_t v34 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v56 = v34;
          __int16 v57 = 2112;
          id v58 = v4;
          _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fetch server from message: %@", buf, 0x16u);
        }
        v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
        [v4 respondWithError:v16];
        uint64_t v15 = 0;
      }
    }
  }
  else
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    __int16 v19 = v7;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v56 = v21;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch significant events because zones are not ready", buf, 0xCu);
    }
    id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v13];
  }
}

uint64_t __60__HMDCameraClipManager_handleFetchSignificantEventsMessage___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  [*(id *)(a1 + 32) handleFetchedObject:a2];
  uint64_t result = [*(id *)(a1 + 32) canHandleMoreFetchedObjects];
  *a3 = result ^ 1;
  return result;
}

uint64_t __60__HMDCameraClipManager_handleFetchSignificantEventsMessage___block_invoke_215(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondWithSuccess];
}

- (void)handleFetchFaceCropURLMessage:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    __int16 v10 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch face crop for message: %{public}@", buf, 0x16u);
  }
  id v11 = [(HMDCameraClipManager *)v7 localZone];

  if (v11)
  {
    uint64_t v12 = [v4 setForKey:*MEMORY[0x1E4F2CBF8]];
    id v13 = [v12 anyObject];
    if (v13)
    {
      uint64_t v14 = [(HMDCameraClipManager *)v7 localZone];
      id v39 = 0;
      uint64_t v15 = [v14 fetchModelWithModelID:v13 ofType:objc_opt_class() error:&v39];
      id v16 = v39;

      if (v15)
      {
        id v17 = [(HMDCameraClipManager *)v7 _fetchFaceCropURLForSignificantEventModel:v15];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __54__HMDCameraClipManager_handleFetchFaceCropURLMessage___block_invoke;
        v37[3] = &unk_1E6A12B90;
        id v18 = v4;
        id v38 = v18;
        __int16 v19 = [v17 addSuccessBlock:v37];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __54__HMDCameraClipManager_handleFetchFaceCropURLMessage___block_invoke_2;
        v35[3] = &unk_1E6A197F0;
        id v36 = v18;
        id v20 = (id)[v19 addFailureBlock:v35];

        uint64_t v21 = v38;
      }
      else
      {
        long long v31 = (void *)MEMORY[0x1D9452090]();
        long long v32 = v7;
        __int16 v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          uint64_t v34 = HMFGetLogIdentifier();
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          [v13 getUUIDBytes:buf];
          long long v40 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v34;
          *(_WORD *)&buf[12] = 1042;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&unsigned char buf[18] = 2098;
          *(void *)&buf[20] = &v40;
          *(_WORD *)&unsigned char buf[28] = 2112;
          *(void *)&buf[30] = v16;
          _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not find significant event model with UUID %{public,uuid_t}.16P: %@", buf, 0x26u);
        }
        uint64_t v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        [v4 respondWithError:v21];
      }
    }
    else
    {
      uint64_t v26 = (void *)MEMORY[0x1D9452090]();
      id v27 = v7;
      uint64_t v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v29 = HMFGetLogIdentifier();
        id v30 = [v4 messagePayload];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v29;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v30;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Could not find significant event UUID in decoded UUIDs %@ in message payload: %@", buf, 0x20u);
      }
      id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v4 respondWithError:v16];
    }
  }
  else
  {
    id v22 = (void *)MEMORY[0x1D9452090]();
    id v23 = v7;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch face crop url because zones are not ready", buf, 0xCu);
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v12];
  }
}

void __54__HMDCameraClipManager_handleFetchFaceCropURLMessage___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  uint64_t v5 = *MEMORY[0x1E4F2CBC0];
  id v3 = [a2 absoluteString];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 respondWithPayload:v4];
}

uint64_t __54__HMDCameraClipManager_handleFetchFaceCropURLMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithError:a2];
}

- (void)handleFetchFaceCropDataRepresentationMessage:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    __int16 v10 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch face crop data representation with message: %{public}@", buf, 0x16u);
  }
  id v11 = [(HMDCameraClipManager *)v7 localZone];

  if (v11)
  {
    uint64_t v12 = [v4 setForKey:*MEMORY[0x1E4F2CBF8]];
    id v13 = [v12 anyObject];
    if (v13)
    {
      uint64_t v14 = [(HMDCameraClipManager *)v7 localZone];
      id v41 = 0;
      uint64_t v15 = [v14 fetchModelWithModelID:v13 ofType:objc_opt_class() error:&v41];
      id v16 = v41;

      if (v15)
      {
        id v17 = [(HMDCameraClipManager *)v7 _fetchFaceCropURLForSignificantEventModel:v15];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __69__HMDCameraClipManager_handleFetchFaceCropDataRepresentationMessage___block_invoke;
        v40[3] = &unk_1E6A12B40;
        v40[4] = v7;
        id v18 = [v17 flatMap:v40];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __69__HMDCameraClipManager_handleFetchFaceCropDataRepresentationMessage___block_invoke_214;
        v38[3] = &unk_1E6A12B68;
        id v19 = v4;
        id v39 = v19;
        id v20 = [v18 addSuccessBlock:v38];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __69__HMDCameraClipManager_handleFetchFaceCropDataRepresentationMessage___block_invoke_2;
        v36[3] = &unk_1E6A197F0;
        id v37 = v19;
        id v21 = (id)[v20 addFailureBlock:v36];
      }
      else
      {
        long long v31 = (void *)MEMORY[0x1D9452090]();
        long long v32 = v7;
        __int16 v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          uint64_t v34 = HMFGetLogIdentifier();
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          [v13 getUUIDBytes:buf];
          long long v42 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v34;
          *(_WORD *)&buf[12] = 1042;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&unsigned char buf[18] = 2098;
          *(void *)&buf[20] = &v42;
          *(_WORD *)&unsigned char buf[28] = 2112;
          *(void *)&buf[30] = v16;
          _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not find significant event model with UUID %{public,uuid_t}.16P: %@", buf, 0x26u);
        }
        uint64_t v35 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        [v4 respondWithError:v35];
      }
    }
    else
    {
      uint64_t v26 = (void *)MEMORY[0x1D9452090]();
      id v27 = v7;
      uint64_t v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v29 = HMFGetLogIdentifier();
        id v30 = [v4 messagePayload];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v29;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v30;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Could not find significant event UUID in decoded UUIDs %@ in message payload: %@", buf, 0x20u);
      }
      id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v4 respondWithError:v16];
    }
  }
  else
  {
    id v22 = (void *)MEMORY[0x1D9452090]();
    id v23 = v7;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch face crop data representation because zones are not ready", buf, 0xCu);
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v12];
  }
}

id __69__HMDCameraClipManager_handleFetchFaceCropDataRepresentationMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) fileManager];
  id v15 = 0;
  uint64_t v5 = [v4 dataWithContentsOfURL:v3 options:0 error:&v15];
  id v6 = v15;

  if (v5)
  {
    char v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];
  }
  else
  {
    int v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = *(id *)(a1 + 32);
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v3;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get data from URL %@: %@", buf, 0x20u);
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F7A0D8];
    id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    char v7 = [v12 futureWithError:v13];
  }
  return v7;
}

void __69__HMDCameraClipManager_handleFetchFaceCropDataRepresentationMessage___block_invoke_214(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  uint64_t v6 = *MEMORY[0x1E4F2CBA8];
  v7[0] = a2;
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a2;
  uint64_t v5 = [v3 dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 respondWithPayload:v5];
}

uint64_t __69__HMDCameraClipManager_handleFetchFaceCropDataRepresentationMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithError:a2];
}

- (void)handleFetchHeroFrameURLMessage:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    __int16 v10 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch hero frame URL message with payload: %@", buf, 0x16u);
  }
  id v11 = [(HMDCameraClipManager *)v7 localZone];

  if (v11)
  {
    uint64_t v12 = [v4 uuidForKey:*MEMORY[0x1E4F2CB90]];
    if (v12)
    {
      id v13 = [(HMDCameraClipManager *)v7 localZone];
      id v37 = 0;
      uint64_t v14 = [v13 fetchModelWithModelID:v12 ofType:objc_opt_class() error:&v37];
      id v15 = v37;

      if (v14)
      {
        id v16 = [(HMDCameraClipManager *)v7 _fetchCanonicalHeroFrameURLForClipModel:v14];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __55__HMDCameraClipManager_handleFetchHeroFrameURLMessage___block_invoke;
        v35[3] = &unk_1E6A12B90;
        id v17 = v4;
        id v36 = v17;
        __int16 v18 = [v16 addSuccessBlock:v35];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __55__HMDCameraClipManager_handleFetchHeroFrameURLMessage___block_invoke_2;
        v33[3] = &unk_1E6A197F0;
        id v34 = v17;
        id v19 = (id)[v18 addFailureBlock:v33];

        __int16 v20 = v36;
      }
      else
      {
        id v29 = (void *)MEMORY[0x1D9452090]();
        id v30 = v7;
        long long v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          long long v32 = HMFGetLogIdentifier();
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          [v12 getUUIDBytes:buf];
          long long v38 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v32;
          *(_WORD *)&buf[12] = 1042;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&unsigned char buf[18] = 2098;
          *(void *)&buf[20] = &v38;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed requesting to fetch hero frame url because no clip could be found for UUID %{public,uuid_t}.16P", buf, 0x1Cu);
        }
        __int16 v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        [v4 respondWithError:v20];
      }
    }
    else
    {
      uint64_t v25 = (void *)MEMORY[0x1D9452090]();
      uint64_t v26 = v7;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v28;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch hero frame url because clip uuid cannot be found in message payload", buf, 0xCu);
      }
      id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v4 respondWithError:v15];
    }
  }
  else
  {
    id v21 = (void *)MEMORY[0x1D9452090]();
    uint64_t v22 = v7;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch hero frame url because zones are not ready", buf, 0xCu);
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v12];
  }
}

void __55__HMDCameraClipManager_handleFetchHeroFrameURLMessage___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  uint64_t v5 = *MEMORY[0x1E4F2CBC0];
  id v3 = [a2 absoluteString];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 respondWithPayload:v4];
}

uint64_t __55__HMDCameraClipManager_handleFetchHeroFrameURLMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithError:a2];
}

- (void)handleFetchHeroFrameDataRepresentationMessage:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    __int16 v10 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    long long v42 = v9;
    __int16 v43 = 2114;
    uint64_t v44 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch hero frame data representation with message: %{public}@", buf, 0x16u);
  }
  id v11 = [(HMDCameraClipManager *)v7 localZone];

  if (v11)
  {
    uint64_t v12 = [v4 uuidForKey:*MEMORY[0x1E4F2CB90]];
    if (v12)
    {
      id v13 = [(HMDCameraClipManager *)v7 localZone];
      id v40 = 0;
      uint64_t v14 = [v13 fetchModelWithModelID:v12 ofType:objc_opt_class() error:&v40];
      id v15 = v40;

      if (v14)
      {
        id v16 = [(HMDCameraClipManager *)v7 _fetchCanonicalHeroFrameURLForClipModel:v14];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __70__HMDCameraClipManager_handleFetchHeroFrameDataRepresentationMessage___block_invoke;
        v39[3] = &unk_1E6A12B40;
        v39[4] = v7;
        id v17 = [v16 flatMap:v39];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __70__HMDCameraClipManager_handleFetchHeroFrameDataRepresentationMessage___block_invoke_211;
        v37[3] = &unk_1E6A12B68;
        id v18 = v4;
        id v38 = v18;
        id v19 = [v17 addSuccessBlock:v37];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __70__HMDCameraClipManager_handleFetchHeroFrameDataRepresentationMessage___block_invoke_2;
        v35[3] = &unk_1E6A197F0;
        id v36 = v18;
        id v20 = (id)[v19 addFailureBlock:v35];
      }
      else
      {
        id v30 = (void *)MEMORY[0x1D9452090]();
        long long v31 = v7;
        long long v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          __int16 v33 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          long long v42 = v33;
          __int16 v43 = 2112;
          uint64_t v44 = v12;
          __int16 v45 = 2112;
          id v46 = v15;
          _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Could not find clip with UUID %@: %@", buf, 0x20u);
        }
        id v34 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        [v4 respondWithError:v34];
      }
    }
    else
    {
      uint64_t v25 = (void *)MEMORY[0x1D9452090]();
      uint64_t v26 = v7;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        id v29 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        long long v42 = v28;
        __int16 v43 = 2112;
        uint64_t v44 = v29;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot find clip UUID in message payload: %@", buf, 0x16u);
      }
      id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v4 respondWithError:v15];
    }
  }
  else
  {
    id v21 = (void *)MEMORY[0x1D9452090]();
    uint64_t v22 = v7;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v42 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch hero frame data representation because zones are not ready", buf, 0xCu);
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v12];
  }
}

id __70__HMDCameraClipManager_handleFetchHeroFrameDataRepresentationMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) fileManager];
  id v15 = 0;
  uint64_t v5 = [v4 dataWithContentsOfURL:v3 options:0 error:&v15];
  id v6 = v15;

  if (v5)
  {
    char v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];
  }
  else
  {
    int v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = *(id *)(a1 + 32);
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v3;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get data from URL %@: %@", buf, 0x20u);
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F7A0D8];
    id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    char v7 = [v12 futureWithError:v13];
  }
  return v7;
}

void __70__HMDCameraClipManager_handleFetchHeroFrameDataRepresentationMessage___block_invoke_211(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  uint64_t v6 = *MEMORY[0x1E4F2CBA8];
  v7[0] = a2;
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a2;
  uint64_t v5 = [v3 dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 respondWithPayload:v5];
}

uint64_t __70__HMDCameraClipManager_handleFetchHeroFrameDataRepresentationMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithError:a2];
}

- (void)handleFetchVideoSegmentsAssetContextMessage:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v15 = 138543362;
    id v16 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch video segments asset context message", (uint8_t *)&v15, 0xCu);
  }
  [(HMDCameraClipManager *)v7 _fetchAssetContextForMessage:v4 propertyName:@"videoStreamingAsset"];
  __int16 v10 = [HMDCameraClipManagerRequestLogEvent alloc];
  id v11 = [(HMDCameraClipManager *)v7 zoneManager];
  uint64_t v12 = [v11 home];
  id v13 = [v12 uuid];
  uint64_t v14 = [(HMDCameraClipManagerRequestLogEvent *)v10 initWithRequestName:@"HMDCameraClipManagerRequestLogEventFetchVideoSegmentsAssetRequestName" homeUUID:v13];
  [(HMDCameraClipManager *)v7 submitLogEvent:v14 error:0];
}

- (void)handleFetchCountOfClipsMessage:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    __int16 v10 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    v48 = v9;
    __int16 v49 = 2114;
    id v50 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch count of clips message: %{public}@", buf, 0x16u);
  }
  id v11 = [(HMDCameraClipManager *)v7 localZone];

  if (v11)
  {
    uint64_t v12 = [v4 dateForKey:*MEMORY[0x1E4F2CBB0]];
    id v13 = [v4 dateForKey:*MEMORY[0x1E4F2CBB8]];
    uint64_t v14 = [v4 numberForKey:*MEMORY[0x1E4F2CBD8]];
    int v15 = v14;
    if (v12 && v13 && v14)
    {
      uint64_t v16 = [v14 integerValue];
      uint64_t v17 = (void *)MEMORY[0x1D9452090]();
      __int16 v18 = v7;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v48 = v20;
        __int16 v49 = 2112;
        id v50 = v12;
        __int16 v51 = 2112;
        id v52 = v13;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Fetching count of clips between %@ and %@", buf, 0x20u);
      }
      v45[0] = @"dateAfter";
      v45[1] = @"dateBefore";
      v46[0] = v12;
      v46[1] = v13;
      v45[2] = @"quality";
      id v21 = [NSNumber numberWithInteger:v16];
      v46[2] = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];

      id v23 = [(HMDCameraClipManager *)v18 localZone];
      id v24 = +[HMDCameraClipModel countOfClipsWithQualityBetweenDatesQuery];
      id v42 = 0;
      uint64_t v25 = [v23 countModelsUsingQuery:v24 arguments:v22 error:&v42];
      id v26 = v42;

      if (v25)
      {
        uint64_t v43 = *MEMORY[0x1E4F2CBA0];
        uint64_t v44 = v25;
        id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        [v4 respondWithPayload:v27];
      }
      else
      {
        id v37 = (void *)MEMORY[0x1D9452090]();
        id v38 = v18;
        id v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v40 = v41 = v37;
          *(_DWORD *)buf = 138543618;
          v48 = v40;
          __int16 v49 = 2112;
          id v50 = v26;
          _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch count of clip models from local zone: %@", buf, 0x16u);

          id v37 = v41;
        }

        [v4 respondWithError:v26];
      }
    }
    else
    {
      long long v32 = (void *)MEMORY[0x1D9452090]();
      __int16 v33 = v7;
      id v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = HMFGetLogIdentifier();
        id v36 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        v48 = v35;
        __int16 v49 = 2112;
        id v50 = v36;
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Could not find required value in message payload: %@", buf, 0x16u);
      }
      uint64_t v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v4 respondWithError:v22];
    }
  }
  else
  {
    uint64_t v28 = (void *)MEMORY[0x1D9452090]();
    id v29 = v7;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      long long v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v48 = v31;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch count of clips because zones are not ready", buf, 0xCu);
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v12];
  }
}

- (void)handleFetchClipForSignificantEventMessage:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    __int16 v10 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch clip for significant event message: %{public}@", buf, 0x16u);
  }
  id v11 = [(HMDCameraClipManager *)v7 localZone];

  if (v11)
  {
    uint64_t v12 = [v4 setForKey:*MEMORY[0x1E4F2CBF8]];
    id v13 = [v12 anyObject];
    if (!v13)
    {
      id v30 = (void *)MEMORY[0x1D9452090]();
      long long v31 = v7;
      long long v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        __int16 v33 = HMFGetLogIdentifier();
        id v34 = [v4 messagePayload];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v34;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Could not find significant event UUID in decoded UUIDs %@ in message payload: %@", buf, 0x20u);
      }
      id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v4 respondWithError:v16];
      goto LABEL_40;
    }
    uint64_t v14 = [(HMDCameraClipManager *)v7 localZone];
    id v64 = 0;
    int v15 = [v14 fetchModelWithModelID:v13 ofType:objc_opt_class() error:&v64];
    id v16 = v64;

    if (!v15)
    {
      uint64_t v35 = (void *)MEMORY[0x1D9452090]();
      id v36 = v7;
      id v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        id v38 = HMFGetLogIdentifier();
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        [v13 getUUIDBytes:buf];
        long long v69 = *(_OWORD *)buf;
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v38;
        *(_WORD *)&buf[12] = 1042;
        *(_DWORD *)&buf[14] = 16;
        *(_WORD *)&unsigned char buf[18] = 2098;
        *(void *)&buf[20] = &v69;
        *(_WORD *)&unsigned char buf[28] = 2112;
        *(void *)&buf[30] = v16;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Could not find significant event with UUID %{public,uuid_t}.16P: %@", buf, 0x26u);
      }
      id v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      [v4 respondWithError:v19];
      goto LABEL_39;
    }
    uint64_t v17 = [(HMDCameraClipManager *)v7 localZone];
    __int16 v18 = [v15 hmbParentModelID];
    id v63 = v16;
    id v19 = [v17 fetchModelWithModelID:v18 ofType:objc_opt_class() error:&v63];
    id v20 = v63;

    if (v19)
    {
      id v16 = v20;
LABEL_8:
      id v21 = [v19 hmbModelID];
      uint64_t v22 = [(HMDCameraClipManager *)v7 significantEventsForClipWithUUID:v21];

      id v23 = [v19 createClipWithSignificantEvents:v22];
      uint64_t v65 = *MEMORY[0x1E4F2CB80];
      id v24 = encodeRootObjectForIncomingXPCMessage(v23, 0);
      v66 = v24;
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      [v4 respondWithPayload:v25];

LABEL_38:
LABEL_39:

LABEL_40:
      goto LABEL_41;
    }
    id v39 = (void *)MEMORY[0x1D9452090]();
    id v40 = v7;
    id v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      context = v39;
      id v42 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      uint64_t v43 = [v15 hmbParentModelID];

      if (v43)
      {
        uint64_t v44 = [v15 hmbParentModelID];
        [v44 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
      }
      long long v68 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v42;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&unsigned char buf[18] = 2098;
      *(void *)&buf[20] = &v68;
      _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find clip model with UUID %{public,uuid_t}.16P. Falling back to using the associated clip", buf, 0x1Cu);

      id v39 = context;
    }

    id v19 = [v15 associatedClip];
    contexta = (void *)MEMORY[0x1D9452090]();
    __int16 v45 = v40;
    id v46 = HMFGetOSLogHandle();
    uint64_t v47 = v46;
    if (v19)
    {
      uint64_t v59 = v20;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        v48 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v48;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v19;
        _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_INFO, "%{public}@Fetching clip model using associated clip reference: %@", buf, 0x16u);
      }
      [(HMDCameraClipManager *)v45 localZone];
      __int16 v49 = v58 = v45;
      id v50 = [v19 hmbModelID];
      id v62 = v59;
      uint64_t v51 = [v49 fetchModelWithModelID:v50 ofType:objc_opt_class() error:&v62];
      id v16 = v62;

      if (v51)
      {

        id v19 = (void *)v51;
        goto LABEL_8;
      }
      uint64_t v53 = (void *)MEMORY[0x1D9452090]();
      __int16 v45 = v58;
      v54 = v58;
      uint64_t v47 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
LABEL_37:

        uint64_t v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        [v4 respondWithError:v22];
        goto LABEL_38;
      }
      contexta = v53;
      v55 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      v56 = [v19 hmbModelID];

      if (v56)
      {
        __int16 v57 = [v19 hmbModelID];
        [v57 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
      }
      long long v67 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v55;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&unsigned char buf[18] = 2098;
      *(void *)&buf[20] = &v67;
      *(_WORD *)&unsigned char buf[28] = 2112;
      *(void *)&buf[30] = v16;
      _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_ERROR, "%{public}@Could not find clip with UUID %{public,uuid_t}.16P: %@", buf, 0x26u);
    }
    else
    {
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        id v52 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v52;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_ERROR, "%{public}@No associatedClip found for significant event model: %@", buf, 0x16u);
      }
      id v16 = v20;
    }
    uint64_t v53 = contexta;
    goto LABEL_37;
  }
  id v26 = (void *)MEMORY[0x1D9452090]();
  id v27 = v7;
  uint64_t v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    id v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v29;
    _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch clip for significant event because zones are not ready", buf, 0xCu);
  }
  uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  [v4 respondWithError:v12];
LABEL_41:
}

- (void)handleFetchClipsMessage:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    __int16 v10 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    v56 = v9;
    __int16 v57 = 2114;
    id v58 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch clips message: %{public}@", buf, 0x16u);
  }
  id v11 = [(HMDCameraClipManager *)v7 localZone];

  if (v11)
  {
    uint64_t v12 = [(HMDCameraClipManager *)v7 fetchServerFactory];
    id v13 = ((void (**)(void, id))v12)[2](v12, v4);

    if (v13)
    {
      uint64_t v14 = [v4 dateForKey:*MEMORY[0x1E4F2CBB0]];
      int v15 = [v4 dateForKey:*MEMORY[0x1E4F2CBB8]];
      id v16 = [v4 numberForKey:*MEMORY[0x1E4F2CBD0]];
      uint64_t v17 = [v4 numberForKey:*MEMORY[0x1E4F2CBF0]];
      uint64_t v18 = [v4 numberForKey:*MEMORY[0x1E4F2CBD8]];
      id v19 = (void *)v18;
      if (v14 && v15 && v16 && v17 && v18)
      {
        v48 = v15;
        id v20 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v14 endDate:v15];
        id v21 = v16;
        uint64_t v22 = [v17 BOOLValue];
        uint64_t v23 = [v19 integerValue];
        id v46 = v21;
        objc_msgSend(v13, "setTotalFetchedObjectsLimit:", objc_msgSend(v21, "unsignedIntegerValue"));
        id v54 = 0;
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __48__HMDCameraClipManager_handleFetchClipsMessage___block_invoke;
        v52[3] = &unk_1E6A12B18;
        id v24 = v13;
        id v53 = v24;
        LOBYTE(v22) = [(HMDCameraClipManager *)v7 _fetchClipsWithDateInterval:v20 quality:v23 isAscending:v22 error:&v54 handler:v52];
        id v25 = v54;
        if (v22)
        {
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __48__HMDCameraClipManager_handleFetchClipsMessage___block_invoke_205;
          v50[3] = &unk_1E6A19B30;
          id v51 = v4;
          [v24 sendCurrentlyBatchedFetchedObjectsWithCompletion:v50];
        }
        else
        {
          id v41 = (void *)MEMORY[0x1D9452090]();
          id v42 = v7;
          uint64_t v43 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v44 = __int16 v45 = v41;
            *(_DWORD *)buf = 138543618;
            v56 = v44;
            __int16 v57 = 2112;
            id v58 = v25;
            _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch clip models from local zone: %@", buf, 0x16u);

            id v41 = v45;
          }

          [v4 respondWithError:v25];
        }

        id v16 = v46;
        int v15 = v48;
      }
      else
      {
        id v34 = (void *)MEMORY[0x1D9452090]();
        uint64_t v35 = v7;
        id v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = __int16 v49 = v15;
          [v4 messagePayload];
          uint64_t v47 = v17;
          id v38 = v19;
          v40 = id v39 = v16;
          *(_DWORD *)buf = 138543618;
          v56 = v37;
          __int16 v57 = 2112;
          id v58 = v40;
          _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@Could not find required value in message payload: %@", buf, 0x16u);

          id v16 = v39;
          id v19 = v38;
          uint64_t v17 = v47;

          int v15 = v49;
        }

        id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
        [v4 respondWithError:v20];
      }
    }
    else
    {
      id v30 = (void *)MEMORY[0x1D9452090]();
      long long v31 = v7;
      long long v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        __int16 v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v56 = v33;
        __int16 v57 = 2112;
        id v58 = v4;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fetch server from message: %@", buf, 0x16u);
      }
      uint64_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v4 respondWithError:v14];
    }
  }
  else
  {
    id v26 = (void *)MEMORY[0x1D9452090]();
    id v27 = v7;
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v56 = v29;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch clips because zones are not ready", buf, 0xCu);
    }
    id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v13];
  }
}

uint64_t __48__HMDCameraClipManager_handleFetchClipsMessage___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  [*(id *)(a1 + 32) handleFetchedObject:a2];
  uint64_t result = [*(id *)(a1 + 32) canHandleMoreFetchedObjects];
  *a3 = result ^ 1;
  return result;
}

uint64_t __48__HMDCameraClipManager_handleFetchClipsMessage___block_invoke_205(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondWithSuccess];
}

- (void)handleFetchClipMessage:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    __int16 v10 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    id v38 = v9;
    __int16 v39 = 2114;
    id v40 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch clip message: %{public}@", buf, 0x16u);
  }
  id v11 = [(HMDCameraClipManager *)v7 localZone];

  if (v11)
  {
    uint64_t v12 = [v4 uuidForKey:*MEMORY[0x1E4F2CB90]];
    if (v12)
    {
      id v13 = [(HMDCameraClipManager *)v7 localZone];
      id v34 = 0;
      uint64_t v14 = [v13 fetchModelWithModelID:v12 ofType:objc_opt_class() error:&v34];
      id v15 = v34;

      if (v14)
      {
        id v16 = [v14 hmbModelID];
        uint64_t v17 = [(HMDCameraClipManager *)v7 significantEventsForClipWithUUID:v16];

        uint64_t v18 = [v14 createClipWithSignificantEvents:v17];
        uint64_t v35 = *MEMORY[0x1E4F2CB80];
        id v19 = encodeRootObjectForIncomingXPCMessage(v18, 0);
        id v36 = v19;
        id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        [v4 respondWithPayload:v20];
      }
      else
      {
        id v30 = (void *)MEMORY[0x1D9452090]();
        long long v31 = v7;
        long long v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          __int16 v33 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          id v38 = v33;
          __int16 v39 = 2112;
          id v40 = v12;
          __int16 v41 = 2112;
          id v42 = v15;
          _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Could not find clip with UUID %@: %@", buf, 0x20u);
        }
        uint64_t v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        [v4 respondWithError:v17];
      }
    }
    else
    {
      id v25 = (void *)MEMORY[0x1D9452090]();
      id v26 = v7;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        id v29 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        id v38 = v28;
        __int16 v39 = 2112;
        id v40 = v29;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Could not find clip UUID in message payload: %@", buf, 0x16u);
      }
      id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v4 respondWithError:v15];
    }
  }
  else
  {
    id v21 = (void *)MEMORY[0x1D9452090]();
    uint64_t v22 = v7;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v38 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch clip because zones are not ready", buf, 0xCu);
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v12];
  }
}

- (void)handlePerformCloudPullMessage:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v20 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling perform cloud pull message", buf, 0xCu);
  }
  __int16 v10 = [(HMDCameraClipManager *)v7 _performCloudPull];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__HMDCameraClipManager_handlePerformCloudPullMessage___block_invoke;
  v17[3] = &unk_1E6A19708;
  id v11 = v4;
  id v18 = v11;
  uint64_t v12 = [v10 addSuccessBlock:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__HMDCameraClipManager_handlePerformCloudPullMessage___block_invoke_2;
  v15[3] = &unk_1E6A197F0;
  id v16 = v11;
  id v13 = v11;
  id v14 = (id)[v12 addFailureBlock:v15];
}

uint64_t __54__HMDCameraClipManager_handlePerformCloudPullMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondWithSuccess];
}

uint64_t __54__HMDCameraClipManager_handlePerformCloudPullMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithError:a2];
}

- (void)handleUnsubscribeMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v21 = 138543362;
    uint64_t v22 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling unsubscribe message", (uint8_t *)&v21, 0xCu);
  }
  __int16 v10 = [v4 transport];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    id v13 = [(HMDCameraClipManager *)v7 clientConnectionsTimer];
    [v13 removeClientConnection:v12];

    [v4 respondWithPayload:0];
  }
  else
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = v7;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      uint64_t v18 = objc_opt_class();
      id v19 = [v4 transport];
      int v21 = 138543874;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      __int16 v25 = 2112;
      id v26 = v19;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unsubscribing transport was not of expected class %@: %@", (uint8_t *)&v21, 0x20u);
    }
    id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v20];
  }
}

- (void)handleSubscribeMessage:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  char v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v27 = 138543362;
    uint64_t v28 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling subscribe message", (uint8_t *)&v27, 0xCu);
  }
  __int16 v10 = [v4 transport];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    id v13 = [(HMDCameraClipManager *)v7 clientConnectionsTimer];
    [v13 addClientConnection:v12];

    id v14 = [(HMDCameraClipManager *)v7 cloudZone];

    if (!v14)
    {
      id v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = v7;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        int v27 = 138543362;
        uint64_t v28 = v18;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Asked to subscribe to changes when no cloud zone exists; Restarting zone manager",
          (uint8_t *)&v27,
          0xCu);
      }
      id v19 = [(HMDCameraClipManager *)v16 zoneManager];
      [v19 start];
    }
    [v4 respondWithPayload:0];
  }
  else
  {
    id v20 = (void *)MEMORY[0x1D9452090]();
    int v21 = v7;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      uint64_t v24 = objc_opt_class();
      __int16 v25 = [v4 transport];
      int v27 = 138543874;
      uint64_t v28 = v23;
      __int16 v29 = 2112;
      uint64_t v30 = v24;
      __int16 v31 = 2112;
      long long v32 = v25;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Subscribing transport was not of expected class %@: %@", (uint8_t *)&v27, 0x20u);
    }
    id v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v26];
  }
}

- (id)_disableCloudStorage
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  uint64_t v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v7 = HMFGetLogIdentifier();
    int v25 = 138543362;
    id v26 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Disabling cloud storage", (uint8_t *)&v25, 0xCu);
  }
  int v8 = [(HMDCameraClipManager *)v5 zoneManager];
  id v9 = [v8 defaultConfiguration];
  char v10 = [v9 isZoneOwner];

  if (v10)
  {
    id v11 = [(HMDCameraClipManager *)v5 quotaManager];
    id v12 = [(HMDCameraClipManager *)v5 zoneManager];
    id v13 = [v12 zoneName];
    id v14 = [v11 disableCloudStorageForZoneWithName:v13];
    id v15 = (void *)MEMORY[0x1E4F7A0F0];
    id v16 = [(HMDCameraClipManager *)v5 workQueue];
    uint64_t v17 = [v15 schedulerWithDispatchQueue:v16];
    uint64_t v18 = [v14 reschedule:v17];
  }
  else
  {
    id v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = v5;
    int v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      int v25 = 138543362;
      id v26 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@User is not the zone owner; cannot disable cloud storage",
        (uint8_t *)&v25,
        0xCu);
    }
    __int16 v23 = (void *)MEMORY[0x1E4F7A0D8];
    id v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
    uint64_t v18 = [v23 futureWithError:v11];
  }

  return v18;
}

- (id)_enableCloudStorage
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  uint64_t v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Enabling cloud storage", buf, 0xCu);
  }
  int v8 = [(HMDCameraClipManager *)v5 zoneManager];
  id v9 = [v8 defaultConfiguration];
  char v10 = [v9 isZoneOwner];

  if (v10)
  {
    id v11 = [(HMDCameraClipManager *)v5 cloudZone];
    id v12 = [v11 startUp];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __43__HMDCameraClipManager__enableCloudStorage__block_invoke;
    v20[3] = &unk_1E6A14668;
    v20[4] = v5;
    id v13 = [v12 flatMap:v20];
  }
  else
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = v5;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@User is not the zone owner; cannot enable cloud storage",
        buf,
        0xCu);
    }
    uint64_t v18 = (void *)MEMORY[0x1E4F7A0D8];
    id v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
    id v13 = [v18 futureWithError:v11];
  }

  return v13;
}

id __43__HMDCameraClipManager__enableCloudStorage__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) quotaManager];
  id v3 = [*(id *)(a1 + 32) zoneManager];
  id v4 = [v3 zoneName];
  uint64_t v5 = [v2 enableCloudStorageForZoneWithName:v4];
  uint64_t v6 = (void *)MEMORY[0x1E4F7A0F0];
  char v7 = [*(id *)(a1 + 32) workQueue];
  int v8 = [v6 schedulerWithDispatchQueue:v7];
  id v9 = [v5 reschedule:v8];

  return v9;
}

- (void)_removeAllFaceClassificationModels
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Remove all face classification models"];
  uint64_t v5 = [(HMDCameraClipManager *)self localZone];
  v8[0] = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v7 = (id)[v5 removeAllModelsOfTypes:v6 options:v4];
}

- (id)_removeClipsWithUUIDs:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(HMDCameraClipManager *)self localZone];
  id v9 = [v8 removeModelsAndDescendantModelsWithIDs:v7 depth:3 options:v6];

  char v10 = [v9 flatMap:&__block_literal_global_198_143138];

  return v10;
}

uint64_t __54__HMDCameraClipManager__removeClipsWithUUIDs_options___block_invoke()
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)_notifyPrimaryResidentAboutFaceMisclassificationForFaceCropData:(id)a3 personUUID:(id)a4 personManagerUUID:(id)a5
{
  v41[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(HMDCameraClipManager *)self home];
  id v13 = [v12 primaryResident];

  if (v13)
  {
    id v14 = [HMDRemoteDeviceMessageDestination alloc];
    id v15 = [(HMDCameraClipManager *)self messageTargetUUID];
    id v16 = [v13 device];
    uint64_t v17 = [(HMDRemoteDeviceMessageDestination *)v14 initWithTarget:v15 device:v16];

    id v34 = v8;
    v41[0] = v8;
    v40[0] = @"HMDCCM.mk.fmfcd";
    v40[1] = @"HMDCCM.mk.fmpu";
    uint64_t v18 = [v9 UUIDString];
    v41[1] = v18;
    v40[2] = @"HMDCCM.mk.fmpmu";
    id v19 = [v10 UUIDString];
    v41[2] = v19;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];

    int v21 = [[HMDRemoteMessage alloc] initWithName:@"HMDCCM.m.rhfm" destination:v17 payload:v20 type:0 timeout:1 secure:0.0];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __117__HMDCameraClipManager__notifyPrimaryResidentAboutFaceMisclassificationForFaceCropData_personUUID_personManagerUUID___block_invoke;
    v35[3] = &unk_1E6A18C18;
    void v35[4] = self;
    [(HMDRemoteMessage *)v21 setResponseHandler:v35];
    int v22 = [v13 isCurrentDevice];
    uint64_t v23 = (void *)MEMORY[0x1D9452090]();
    uint64_t v24 = self;
    int v25 = HMFGetOSLogHandle();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
    if (v22)
    {
      if (v26)
      {
        uint64_t v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v37 = v27;
        __int16 v38 = 2112;
        __int16 v39 = v21;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Directly handling face misclassification message because we are the primary resident: %@", buf, 0x16u);
      }
      [(HMDCameraClipManager *)v24 handleRemoteHandleFaceMisclassificationMessage:v21];
    }
    else
    {
      if (v26)
      {
        long long v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v37 = v32;
        __int16 v38 = 2112;
        __int16 v39 = v21;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Sending remote handle face misclassification message to primary resident: %@", buf, 0x16u);
      }
      uint64_t v33 = [(HMDCameraClipManager *)v24 messageDispatcher];
      [v33 sendMessage:v21];
    }
    id v8 = v34;
  }
  else
  {
    uint64_t v28 = (void *)MEMORY[0x1D9452090]();
    __int16 v29 = self;
    uint64_t v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v37 = v31;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Could not find primary resident to send face misclassification message to", buf, 0xCu);
    }
  }
}

void __117__HMDCameraClipManager__notifyPrimaryResidentAboutFaceMisclassificationForFaceCropData_personUUID_personManagerUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v16 = 138543618;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      id v19 = v5;
      id v12 = "%{public}@Failed to notify primary resident of face misclassification: %@";
      id v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v13, v14, v12, (uint8_t *)&v16, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v16 = 138543362;
    uint64_t v17 = v11;
    id v12 = "%{public}@Successfully notified primary resident of face misclassification";
    id v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 12;
    goto LABEL_6;
  }
}

- (id)_handleFaceMisclassificationForFaceCropURL:(id)a3 personUUID:(id)a4 personManagerUUID:(id)a5 significantEventModel:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  os_log_type_t v14 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v14);

  uint32_t v15 = [(HMDCameraClipManager *)self fileManager];
  id v40 = 0;
  int v16 = [v15 dataWithContentsOfURL:v10 options:0 error:&v40];
  id v17 = v40;

  if (v16)
  {
    id v35 = v17;
    __int16 v18 = (void *)MEMORY[0x1D9452090]([(HMDCameraClipManager *)self _notifyPrimaryResidentAboutFaceMisclassificationForFaceCropData:v16 personUUID:v11 personManagerUUID:v12]);
    id v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v42 = v21;
      __int16 v43 = 2112;
      id v44 = v13;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Removing all face classifications for significant event model: %@", buf, 0x16u);
    }
    int v22 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Remove all face classifications from significant event"];
    uint64_t v23 = [(HMDCameraClipManager *)v19 localZone];
    uint64_t v24 = [v13 hmbModelID];
    int v25 = [v23 removeModelsWithParentModelID:v24 options:v22];

    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __118__HMDCameraClipManager__handleFaceMisclassificationForFaceCropURL_personUUID_personManagerUUID_significantEventModel___block_invoke;
    v38[3] = &unk_1E6A12AA8;
    void v38[4] = v19;
    id v39 = v16;
    BOOL v26 = [v25 flatMap:v38];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __118__HMDCameraClipManager__handleFaceMisclassificationForFaceCropURL_personUUID_personManagerUUID_significantEventModel___block_invoke_185;
    v36[3] = &unk_1E6A12AD0;
    void v36[4] = v19;
    id v37 = v13;
    uint64_t v27 = [v26 flatMap:v36];
    uint64_t v28 = [v27 flatMap:&__block_literal_global_193];

    id v17 = v35;
  }
  else
  {
    __int16 v29 = (void *)MEMORY[0x1D9452090]();
    uint64_t v30 = self;
    __int16 v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      long long v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v42 = v32;
      __int16 v43 = 2112;
      id v44 = v10;
      __int16 v45 = 2112;
      id v46 = v17;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Could not load face crop data at URL %@: %@", buf, 0x20u);
    }
    uint64_t v33 = (void *)MEMORY[0x1E4F7A0D8];
    int v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    uint64_t v28 = [v33 futureWithError:v22];
  }

  return v28;
}

id __118__HMDCameraClipManager__handleFaceMisclassificationForFaceCropURL_personUUID_personManagerUUID_significantEventModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v12 = 138543362;
    id v13 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Adding unassociated face crop to home person dataset for misclassified face classification", (uint8_t *)&v12, 0xCu);
  }
  id v8 = [*(id *)(a1 + 32) home];
  id v9 = [v8 personManager];
  id v10 = [v9 addUnassociatedFaceCropWithData:*(void *)(a1 + 40)];

  return v10;
}

id __118__HMDCameraClipManager__handleFaceMisclassificationForFaceCropURL_personUUID_personManagerUUID_significantEventModel___block_invoke_185(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v21 = 138543618;
    int v22 = v7;
    __int16 v23 = 2112;
    id v24 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating face classification to use unassociated face crop: %@", (uint8_t *)&v21, 0x16u);
  }
  id v8 = [HMDCameraSignificantEventFaceClassificationModel alloc];
  id v9 = [MEMORY[0x1E4F29128] UUID];
  id v10 = [*(id *)(a1 + 40) hmbModelID];
  id v11 = [(HMBModel *)v8 initWithModelID:v9 parentModelID:v10];

  int v12 = [*(id *)(a1 + 32) home];
  id v13 = [v12 personManager];
  uint64_t v14 = [v13 UUID];
  [(HMDCameraSignificantEventFaceClassificationModel *)v11 setPersonManagerUUID:v14];

  uint32_t v15 = [v3 UUID];
  [(HMDCameraSignificantEventFaceClassificationModel *)v11 setUnassociatedFaceCropUUID:v15];

  int v16 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Create face classification with unassociated face crop"];
  id v17 = [*(id *)(a1 + 32) localZone];
  __int16 v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
  id v19 = [v17 createModels:v18 options:v16];

  return v19;
}

uint64_t __118__HMDCameraClipManager__handleFaceMisclassificationForFaceCropURL_personUUID_personManagerUUID_significantEventModel___block_invoke_191()
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)_notifyForChangedSignificantEventModel:(id)a3 mirrorOutputFuture:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v23 = v12;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Waiting for mirror output future to complete: %@", buf, 0x16u);
    }
    id v13 = (void *)MEMORY[0x1E4F7A0F0];
    uint64_t v14 = [(HMDCameraClipManager *)v10 workQueue];
    uint32_t v15 = [v13 schedulerWithDispatchQueue:v14];
    int v16 = [v7 reschedule:v15];
    id v17 = [v16 flatMap:&__block_literal_global_176_143161];
  }
  else
  {
    id v17 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __82__HMDCameraClipManager__notifyForChangedSignificantEventModel_mirrorOutputFuture___block_invoke_2;
  v20[3] = &unk_1E6A12A80;
  v20[4] = self;
  id v21 = v6;
  id v18 = v6;
  id v19 = (id)[v17 addCompletionBlock:v20];
}

void __82__HMDCameraClipManager__notifyForChangedSignificantEventModel_mirrorOutputFuture___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) _significantEventFromSignificantEventModel:*(void *)(a1 + 40)];
  if (!v7)
  {
    uint64_t v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = *(id *)(a1 + 32);
    int v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      __int16 v24 = *(void **)(a1 + 40);
      int v27 = 138543618;
      uint64_t v28 = v23;
      __int16 v29 = 2112;
      uint64_t v30 = v24;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to create significant event from model: %@", (uint8_t *)&v27, 0x16u);
LABEL_12:
    }
LABEL_13:

    goto LABEL_14;
  }
  id v8 = *(void **)(a1 + 32);
  id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
  id v10 = [MEMORY[0x1E4F1CAD0] set];
  [v8 _notifyTransportsOfUpdatedSignificantEvents:v9 removedSignificantEventUUIDs:v10];

  id v11 = [v7 dateOfOccurrence];
  int v12 = [*(id *)(a1 + 32) suppressNotificationsBeforeDate];
  uint64_t v13 = [v11 compare:v12];

  uint64_t v14 = (void *)MEMORY[0x1D9452090]();
  id v15 = *(id *)(a1 + 32);
  int v16 = HMFGetOSLogHandle();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
  if (v13 == -1)
  {
    if (v17)
    {
      __int16 v23 = HMFGetLogIdentifier();
      id v25 = [v7 dateOfOccurrence];
      uint64_t v26 = [*(id *)(a1 + 32) suppressNotificationsBeforeDate];
      int v27 = 138543874;
      uint64_t v28 = v23;
      __int16 v29 = 2112;
      uint64_t v30 = v25;
      __int16 v31 = 2112;
      long long v32 = v26;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring significant event with date of occurrence %@ because it is before %@", (uint8_t *)&v27, 0x20u);

      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (v17)
  {
    id v18 = HMFGetLogIdentifier();
    int v27 = 138543618;
    uint64_t v28 = v18;
    __int16 v29 = 2112;
    uint64_t v30 = v7;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Notifying delegate about updated significant event: %@", (uint8_t *)&v27, 0x16u);
  }
  id v19 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v20 = [HMDHomePresenceRemote alloc];
    id v21 = [*(id *)(a1 + 40) homePresenceByPairingIdentity];
    int v22 = [(HMDHomePresenceRemote *)v20 initWithPresenceByPairingIdentity:v21];

    [v19 clipManager:*(void *)(a1 + 32) didUpdateSignificantEvent:v7 withHomePresence:v22];
  }

LABEL_14:
}

uint64_t __82__HMDCameraClipManager__notifyForChangedSignificantEventModel_mirrorOutputFuture___block_invoke()
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)_handleChangedFaceClassificationModel:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraClipManager *)self localZone];
  id v7 = [v4 hmbParentModelID];
  id v8 = [v6 fetchModelWithModelID:v7 ofType:objc_opt_class() error:0];

  if (v8)
  {
    id v9 = [(HMDCameraClipManager *)self _significantEventFromSignificantEventModel:v8];
    id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    id v11 = [MEMORY[0x1E4F1CAD0] set];
    [(HMDCameraClipManager *)self _notifyTransportsOfUpdatedSignificantEvents:v10 removedSignificantEventUUIDs:v11];
  }
  else
  {
    int v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = HMFGetLogIdentifier();
      int v16 = 138543618;
      BOOL v17 = v15;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring changed face classification model because its associated significant event does not exist: %@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)_handleChangedSignificantEventNotificationModel:(id)a3 mirrorOutputFuture:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v6 associatedClip];
  id v10 = [(HMDCameraClipManager *)self localZone];
  id v11 = [v9 referencedModelFromLocalZone:v10 error:0];

  if (v11)
  {
    [(HMDCameraClipManager *)self _handleChangedClipModel:v11 wasCreated:0 mirrorOutputFuture:0];
    [(HMDCameraClipManager *)self _notifyForChangedSignificantEventModel:v6 mirrorOutputFuture:v7];
  }
  else
  {
    int v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = HMFGetLogIdentifier();
      int v16 = 138543618;
      BOOL v17 = v15;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring changed significant event notification model because its associated clip model does not exist: %@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)_handleChangedClipModel:(id)a3 wasCreated:(BOOL)a4 mirrorOutputFuture:(id)a5
{
  BOOL v6 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v33 = v8;
  id v11 = [v8 hmbModelID];
  int v12 = [(HMDCameraClipManager *)self _significantEventModelsForClipWithUUID:v11];

  if (v6)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v32 = v12;
    id obj = v12;
    uint64_t v13 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(obj);
          }
          BOOL v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          __int16 v18 = (void *)MEMORY[0x1D9452090]();
          id v19 = self;
          uint64_t v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            int v22 = v21 = v9;
            *(_DWORD *)buf = 138543874;
            __int16 v41 = v22;
            __int16 v42 = 2112;
            __int16 v43 = v17;
            __int16 v44 = 2112;
            __int16 v45 = v33;
            _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Found existing significant event model %@ associated with new clip model %@", buf, 0x20u);

            id v9 = v21;
          }

          [(HMDCameraClipManager *)v19 _notifyForChangedSignificantEventModel:v17 mirrorOutputFuture:v9];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v14);
    }

    int v12 = v32;
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __78__HMDCameraClipManager__handleChangedClipModel_wasCreated_mirrorOutputFuture___block_invoke;
  v35[3] = &unk_1E6A128B8;
  void v35[4] = self;
  __int16 v23 = objc_msgSend(v12, "na_map:", v35);
  __int16 v24 = [v33 createClipWithSignificantEvents:v23];
  if (v24)
  {
    id v25 = [MEMORY[0x1E4F1CAD0] setWithObject:v24];
    uint64_t v26 = [MEMORY[0x1E4F1CAD0] set];
    [(HMDCameraClipManager *)self _notifyTransportsOfUpdatedClips:v25 removedClipUUIDs:v26];
  }
  else
  {
    id v27 = v9;
    uint64_t v28 = (void *)MEMORY[0x1D9452090]();
    __int16 v29 = self;
    uint64_t v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v41 = v31;
      __int16 v42 = 2112;
      __int16 v43 = v33;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to create clip from clip model: %@", buf, 0x16u);
    }
    id v9 = v27;
  }
}

uint64_t __78__HMDCameraClipManager__handleChangedClipModel_wasCreated_mirrorOutputFuture___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _significantEventFromSignificantEventModel:a2];
}

- (void)_fetchAssetContextForMessage:(id)a3 propertyName:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDCameraClipManager *)self localZone];

  if (v9)
  {
    uint64_t v10 = [v6 uuidForKey:*MEMORY[0x1E4F2CB90]];
    if (v10)
    {
      id v11 = (void *)v10;
      int v12 = [(HMDCameraClipManager *)self cloudZone];
      uint64_t v13 = [v12 fetchCompleteModelWithID:v11];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __66__HMDCameraClipManager__fetchAssetContextForMessage_propertyName___block_invoke;
      v26[3] = &unk_1E6A12A38;
      v26[4] = self;
      id v14 = v11;
      id v27 = v14;
      id v28 = v6;
      id v29 = v7;
      id v15 = (id)[v13 addCompletionBlock:v26];
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x1D9452090]();
      id v21 = self;
      int v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = HMFGetLogIdentifier();
        __int16 v24 = [v6 messagePayload];
        *(_DWORD *)buf = 138543618;
        __int16 v31 = v23;
        __int16 v32 = 2112;
        id v33 = v24;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failing request to fetch asset context because message has no clip UUID: %@", buf, 0x16u);
      }
      id v25 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
      [v6 respondWithError:v25];

      id v14 = 0;
    }
  }
  else
  {
    int v16 = (void *)MEMORY[0x1D9452090]();
    BOOL v17 = self;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v31 = v19;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch asset context for message because zones are not ready: %@", buf, 0x16u);
    }
    id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v6 respondWithError:v14];
  }
}

void __66__HMDCameraClipManager__fetchAssetContextForMessage_propertyName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 hmbPropertyNamed:*(void *)(a1 + 56)];
    id v8 = [v7 downloadStreamingAsset];

    if (v8)
    {
      id v9 = [v8 contentDownloadURL];
      if (v9)
      {
        uint64_t v10 = [v8 contentDownloadURLExpirationDate];
        if (v10)
        {
          id v63 = v6;
          id v11 = (void *)MEMORY[0x1E4F2E6D0];
          int v12 = [v5 streamingAssetVersion];
          uint64_t v13 = [v11 requiredHTTPHeadersForStreamingAssetVersion:v12];

          id v14 = (void *)[objc_alloc(MEMORY[0x1E4F2E6D8]) initWithURL:v9 expirationDate:v10 requiredHTTPHeaders:v13];
          id v15 = (void *)MEMORY[0x1D9452090]();
          id v16 = *(id *)(a1 + 32);
          BOOL v17 = HMFGetOSLogHandle();
          id v64 = v14;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id v61 = v15;
            uint64_t v18 = HMFGetLogIdentifier();
            uint64_t v60 = *(void *)(a1 + 56);
            *(void *)buf = 0;
            *(void *)&buf[8] = 0;
            id v19 = [v5 hmbModelID];

            if (v19)
            {
              uint64_t v20 = [v5 hmbModelID];
              [v20 getUUIDBytes:buf];
            }
            else
            {
              *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
            }
            long long v68 = *(_OWORD *)buf;
            *(_DWORD *)buf = 138544386;
            v48 = (void *)v18;
            *(void *)&uint8_t buf[4] = v18;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v60;
            *(_WORD *)&buf[22] = 1042;
            *(_DWORD *)&buf[24] = 16;
            __int16 v70 = 2098;
            uint64_t v71 = &v68;
            __int16 v72 = 2112;
            id v14 = v64;
            v73 = v64;
            _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched streaming asset with property name %@ for clip UUID %{public,uuid_t}.16P with context %@", buf, 0x30u);

            id v15 = v61;
          }

          id v62 = *(void **)(a1 + 48);
          v66[0] = *MEMORY[0x1E4F2CB78];
          __int16 v49 = encodeRootObjectForIncomingXPCMessage(v14, 0);
          v67[0] = v49;
          v66[1] = *MEMORY[0x1E4F2CB80];
          id v50 = [MEMORY[0x1E4F1CAD0] set];
          id v51 = [v5 createClipWithSignificantEvents:v50];
          id v52 = encodeRootObjectForIncomingXPCMessage(v51, 0);
          v67[1] = v52;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];
          id v53 = v9;
          id v54 = v10;
          v56 = v55 = (void *)v13;
          [v62 respondWithPayload:v56];

          __int16 v57 = v55;
          uint64_t v10 = v54;
          id v9 = v53;

          id v6 = v63;
        }
        else
        {
          id v40 = (void *)MEMORY[0x1D9452090]();
          id v41 = *(id *)(a1 + 32);
          __int16 v42 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            uint64_t v65 = v40;
            __int16 v43 = HMFGetLogIdentifier();
            *(void *)buf = 0;
            *(void *)&buf[8] = 0;
            __int16 v44 = [v5 hmbModelID];

            if (v44)
            {
              __int16 v45 = [v5 hmbModelID];
              [v45 getUUIDBytes:buf];
            }
            else
            {
              *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
            }
            long long v74 = *(_OWORD *)buf;
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = v43;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v8;
            *(_WORD *)&buf[22] = 1042;
            *(_DWORD *)&buf[24] = 16;
            __int16 v70 = 2098;
            uint64_t v71 = &v74;
            _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Could not find content download URL expiration date on streaming asset %@ for clip with UUID: %{public,uuid_t}.16P", buf, 0x26u);

            id v40 = v65;
          }

          uint64_t v59 = *(void **)(a1 + 48);
          __int16 v57 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
          [v59 respondWithError:v57];
        }
      }
      else
      {
        uint64_t v34 = (void *)MEMORY[0x1D9452090]();
        id v35 = *(id *)(a1 + 32);
        long long v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          long long v37 = HMFGetLogIdentifier();
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          long long v38 = [v5 hmbModelID];

          if (v38)
          {
            long long v39 = [v5 hmbModelID];
            [v39 getUUIDBytes:buf];
          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
          }
          long long v75 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v37;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v8;
          *(_WORD *)&buf[22] = 1042;
          *(_DWORD *)&buf[24] = 16;
          __int16 v70 = 2098;
          uint64_t v71 = &v75;
          _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@Could not find content download URL on streaming asset %@ for clip with UUID: %{public,uuid_t}.16P", buf, 0x26u);
        }
        id v58 = *(void **)(a1 + 48);
        uint64_t v10 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
        [v58 respondWithError:v10];
      }
    }
    else
    {
      uint64_t v26 = (void *)MEMORY[0x1D9452090]();
      id v27 = *(id *)(a1 + 32);
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v29 = v6;
        uint64_t v30 = HMFGetLogIdentifier();
        uint64_t v31 = *(void *)(a1 + 56);
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        __int16 v32 = [v5 hmbModelID];

        if (v32)
        {
          id v33 = [v5 hmbModelID];
          [v33 getUUIDBytes:buf];
        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
        }
        long long v76 = *(_OWORD *)buf;
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v31;
        *(_WORD *)&buf[22] = 1042;
        *(_DWORD *)&buf[24] = 16;
        __int16 v70 = 2098;
        uint64_t v71 = &v76;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Could not find streaming asset on property named %@ for clip with UUID: %{public,uuid_t}.16P", buf, 0x26u);

        id v6 = v29;
      }

      uint64_t v47 = *(void **)(a1 + 48);
      id v9 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
      [v47 respondWithError:v9];
    }
  }
  else
  {
    id v21 = (void *)MEMORY[0x1D9452090]();
    id v22 = *(id *)(a1 + 32);
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      id v25 = *(void **)(a1 + 40);
      if (v25) {
        [v25 getUUIDBytes:buf];
      }
      else {
        *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
      }
      long long v77 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v24;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&unsigned char buf[18] = 2098;
      *(void *)&buf[20] = &v77;
      __int16 v70 = 2112;
      uint64_t v71 = v6;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch complete model for clip UUID %{public,uuid_t}.16P: %@", buf, 0x26u);
    }
    id v46 = *(void **)(a1 + 48);
    id v8 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    [v46 respondWithError:v8];
  }
}

- (void)_notifyTransportsOfUpdatedSignificantEvents:(id)a3 removedSignificantEventUUIDs:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDCameraClipManager *)self clientConnectionsTimer];
  uint64_t v10 = [v9 clientConnections];
  uint64_t v11 = [v10 count];

  int v12 = (void *)MEMORY[0x1D9452090]();
  uint64_t v13 = self;
  id v14 = HMFGetOSLogHandle();
  id v15 = v14;
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      BOOL v17 = [(HMDCameraClipManager *)v13 clientConnectionsTimer];
      uint64_t v18 = [v17 clientConnections];
      *(_DWORD *)buf = 138544130;
      id v46 = v16;
      __int16 v47 = 2048;
      uint64_t v48 = [v18 count];
      __int16 v49 = 2048;
      uint64_t v50 = [v6 count];
      __int16 v51 = 2048;
      uint64_t v52 = [v7 count];
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Notifying %lu subscribed transports of %lu updated significant events, %lu removed significant events", buf, 0x2Au);
    }
    v43[0] = *MEMORY[0x1E4F2CC10];
    id v36 = v6;
    id v19 = encodeRootObjectForIncomingXPCMessage(v6, 0);
    v43[1] = *MEMORY[0x1E4F2CBE8];
    v44[0] = v19;
    id v35 = v7;
    v44[1] = v7;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v21 = [(HMDCameraClipManager *)v13 clientConnectionsTimer];
    id v22 = [v21 clientConnections];

    id obj = v22;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v39;
      uint64_t v26 = *MEMORY[0x1E4F2CB08];
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v38 + 1) + 8 * v27);
          id v29 = [MEMORY[0x1E4F654B0] entitledMessageWithName:v26 messagePayload:v20];
          [v29 setTransport:v28];
          id v30 = objc_alloc(MEMORY[0x1E4F65488]);
          uint64_t v31 = [(HMDCameraClipManager *)v13 messageTargetUUID];
          __int16 v32 = (void *)[v30 initWithTarget:v31];
          [v29 setDestination:v32];

          [v29 setRequiresCameraClipsEntitlement];
          id v33 = [(HMDCameraClipManager *)v13 messageDispatcher];
          [v33 sendMessage:v29 completionHandler:0];

          ++v27;
        }
        while (v24 != v27);
        uint64_t v24 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v24);
    }

    id v7 = v35;
    id v6 = v36;
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v46 = v34;
      __int16 v47 = 2048;
      uint64_t v48 = [v6 count];
      __int16 v49 = 2048;
      uint64_t v50 = [v7 count];
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEBUG, "%{public}@No subscribed transports to notify of %lu updated significant events, %lu removed significant events", buf, 0x20u);
    }
  }
}

- (void)_notifyTransportsOfUpdatedClips:(id)a3 removedClipUUIDs:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDCameraClipManager *)self clientConnectionsTimer];
  uint64_t v10 = [v9 clientConnections];
  uint64_t v11 = [v10 count];

  int v12 = (void *)MEMORY[0x1D9452090]();
  uint64_t v13 = self;
  id v14 = HMFGetOSLogHandle();
  id v15 = v14;
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      BOOL v17 = [(HMDCameraClipManager *)v13 clientConnectionsTimer];
      uint64_t v18 = [v17 clientConnections];
      *(_DWORD *)buf = 138544130;
      id v46 = v16;
      __int16 v47 = 2048;
      uint64_t v48 = [v18 count];
      __int16 v49 = 2048;
      uint64_t v50 = [v6 count];
      __int16 v51 = 2048;
      uint64_t v52 = [v7 count];
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Notifying %lu subscribed transports of %lu updated clips, %lu removed clips", buf, 0x2Au);
    }
    v43[0] = *MEMORY[0x1E4F2CC08];
    id v36 = v6;
    id v19 = encodeRootObjectForIncomingXPCMessage(v6, 0);
    v43[1] = *MEMORY[0x1E4F2CBE0];
    v44[0] = v19;
    id v35 = v7;
    v44[1] = v7;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v21 = [(HMDCameraClipManager *)v13 clientConnectionsTimer];
    id v22 = [v21 clientConnections];

    id obj = v22;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v39;
      uint64_t v26 = *MEMORY[0x1E4F2CB00];
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v38 + 1) + 8 * v27);
          id v29 = [MEMORY[0x1E4F654B0] entitledMessageWithName:v26 messagePayload:v20];
          [v29 setTransport:v28];
          id v30 = objc_alloc(MEMORY[0x1E4F65488]);
          uint64_t v31 = [(HMDCameraClipManager *)v13 messageTargetUUID];
          __int16 v32 = (void *)[v30 initWithTarget:v31];
          [v29 setDestination:v32];

          [v29 setRequiresCameraClipsEntitlement];
          id v33 = [(HMDCameraClipManager *)v13 messageDispatcher];
          [v33 sendMessage:v29 completionHandler:0];

          ++v27;
        }
        while (v24 != v27);
        uint64_t v24 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v24);
    }

    id v7 = v35;
    id v6 = v36;
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v46 = v34;
      __int16 v47 = 2048;
      uint64_t v48 = [v6 count];
      __int16 v49 = 2048;
      uint64_t v50 = [v7 count];
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEBUG, "%{public}@No subscribed transports to notify of %lu updated clips, %lu removed clips", buf, 0x20u);
    }
  }
}

- (void)_cleanUpExpiredClips
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraClipManager *)self cleanupQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-*MEMORY[0x1E4F2CC80]];
  uint64_t v26 = @"dateBefore";
  v27[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[HMDCameraClipManager fetchBatchLimit](self, "fetchBatchLimit"));
  id v7 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Remove expired clips"];
  [v7 setShouldEnqueueMirrorOutput:0];
  id v8 = +[HMDCameraClipModel clipsBeforeDateQuery];
  id v9 = [(HMDCameraClipManager *)self localZone];
  uint64_t v10 = [v9 queryModelsUsingQuery:v8 arguments:v5];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __44__HMDCameraClipManager__cleanUpExpiredClips__block_invoke;
  v19[3] = &unk_1E6A12A10;
  v19[4] = self;
  id v11 = v6;
  id v20 = v11;
  id v12 = v7;
  id v21 = v12;
  [v10 enumerateObjectsUsingBlock:v19];
  if ([v11 count])
  {
    uint64_t v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = HMFGetLogIdentifier();
      uint64_t v17 = [v11 count];
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v16;
      __int16 v24 = 2048;
      uint64_t v25 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Removing %lu expired clips", buf, 0x16u);
    }
    id v18 = [(HMDCameraClipManager *)v14 _removeClipsWithUUIDs:v11 options:v12];
  }
}

void __44__HMDCameraClipManager__cleanUpExpiredClips__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [v3 debugDescription];
    int v18 = 138543618;
    id v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = (uint64_t)v8;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Removing expired clip: %@", (uint8_t *)&v18, 0x16u);
  }
  id v9 = *(void **)(a1 + 40);
  uint64_t v10 = [v3 hmbModelID];
  [v9 addObject:v10];

  unint64_t v11 = [*(id *)(a1 + 40) count];
  if (v11 >= [*(id *)(a1 + 32) fetchBatchLimit])
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = *(id *)(a1 + 32);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = HMFGetLogIdentifier();
      uint64_t v16 = [*(id *)(a1 + 40) count];
      int v18 = 138543618;
      id v19 = v15;
      __int16 v20 = 2048;
      uint64_t v21 = v16;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Removing %lu expired clips", (uint8_t *)&v18, 0x16u);
    }
    id v17 = (id)[*(id *)(a1 + 32) _removeClipsWithUUIDs:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) removeAllObjects];
  }
}

- (void)_cleanUpIncompleteClipsForInitialStartup:(BOOL)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDCameraClipManager *)self cleanupQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraClipManager *)self localZone];
  id v7 = +[HMDCameraClipModel incompleteClipsQuery];
  id v8 = [v6 queryModelsUsingQuery:v7];

  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
  unint64_t v11 = [MEMORY[0x1E4F1CA80] set];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__HMDCameraClipManager__cleanUpIncompleteClipsForInitialStartup___block_invoke;
  aBlock[3] = &unk_1E6A129E8;
  aBlock[4] = self;
  id v12 = v9;
  id v31 = v12;
  BOOL v34 = a3;
  id v13 = v10;
  id v32 = v13;
  id v14 = v11;
  id v33 = v14;
  id v15 = _Block_copy(aBlock);
  [v8 enumerateObjectsUsingBlock:v15];
  unint64_t v16 = 0x1E4F69000;
  if ([v13 count])
  {
    id v17 = (void *)MEMORY[0x1D9452090]();
    int v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v36 = v20;
      __int16 v37 = 2112;
      id v38 = v13;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Completing incomplete clips: %@", buf, 0x16u);

      unint64_t v16 = 0x1E4F69000uLL;
    }

    uint64_t v21 = [(HMDCameraClipManager *)v18 localZone];
    uint64_t v22 = [*(id *)(v16 + 3824) optionsWithLabel:@"Complete Incomplete Clips"];
    id v23 = (id)[v21 updateModels:v13 options:v22];
  }
  if ([v14 count])
  {
    __int16 v24 = (void *)MEMORY[0x1D9452090]();
    uint64_t v25 = self;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v36 = v27;
      __int16 v37 = 2112;
      id v38 = v14;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Removing incomplete 0-duration clip UUIDs: %@", buf, 0x16u);
    }
    uint64_t v28 = [*(id *)(v16 + 3824) optionsWithLabel:@"Remove 0-duration Incomplete Clips"];
    id v29 = [(HMDCameraClipManager *)v25 _removeClipsWithUUIDs:v14 options:v28];
  }
}

void __65__HMDCameraClipManager__cleanUpIncompleteClipsForInitialStartup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [v3 debugDescription];
    int v47 = 138543618;
    uint64_t v48 = v7;
    __int16 v49 = 2112;
    uint64_t v50 = v8;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Cleaning up incomplete clip: %@", (uint8_t *)&v47, 0x16u);
  }
  id v9 = *(void **)(a1 + 40);
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "quality"));
  unint64_t v11 = [v9 objectForKeyedSubscript:v10];
  uint64_t v12 = [v11 unsignedIntegerValue];

  id v13 = [NSNumber numberWithUnsignedInteger:v12 + 1];
  id v14 = *(void **)(a1 + 40);
  id v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "quality"));
  [v14 setObject:v13 forKeyedSubscript:v15];

  if (!v12)
  {
    __int16 v24 = [v3 recordedLocally];
    if (([v24 BOOLValue] & 1) == 0)
    {

      goto LABEL_19;
    }
    int v25 = *(unsigned __int8 *)(a1 + 64);

    if (!v25) {
      goto LABEL_19;
    }
  }
  unint64_t v16 = [v3 duration];
  [v16 doubleValue];
  double v18 = v17;

  if (v18 <= 0.0)
  {
    uint64_t v26 = *(void **)(a1 + 56);
    uint64_t v22 = [v3 hmbModelID];
    id v23 = v26;
  }
  else
  {
    id v19 = [HMDCameraClipModel alloc];
    __int16 v20 = [v3 hmbModelID];
    uint64_t v21 = [v3 hmbParentModelID];
    uint64_t v22 = [(HMBModel *)v19 initWithModelID:v20 parentModelID:v21];

    [(HMDCameraClipModel *)v22 setIsComplete:MEMORY[0x1E4F1CC38]];
    id v23 = *(void **)(a1 + 48);
  }
  [v23 addObject:v22];

  unint64_t v27 = [*(id *)(a1 + 48) count];
  if (v27 >= [*(id *)(a1 + 32) fetchBatchLimit])
  {
    uint64_t v28 = (void *)MEMORY[0x1D9452090]();
    id v29 = *(id *)(a1 + 32);
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = HMFGetLogIdentifier();
      id v32 = *(void **)(a1 + 48);
      int v47 = 138543618;
      uint64_t v48 = v31;
      __int16 v49 = 2112;
      uint64_t v50 = v32;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Completing batch of incomplete clips: %@", (uint8_t *)&v47, 0x16u);
    }
    id v33 = [*(id *)(a1 + 32) localZone];
    uint64_t v34 = *(void *)(a1 + 48);
    id v35 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Complete Incomplete Clips"];
    id v36 = (id)[v33 updateModels:v34 options:v35];

    [*(id *)(a1 + 48) removeAllObjects];
  }
  unint64_t v37 = [*(id *)(a1 + 56) count];
  if (v37 >= [*(id *)(a1 + 32) fetchBatchLimit])
  {
    id v38 = (void *)MEMORY[0x1D9452090]();
    id v39 = *(id *)(a1 + 32);
    long long v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      long long v41 = HMFGetLogIdentifier();
      __int16 v42 = *(void **)(a1 + 56);
      int v47 = 138543618;
      uint64_t v48 = v41;
      __int16 v49 = 2112;
      uint64_t v50 = v42;
      _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Removing batch of incomplete 0-duration clip UUIDs: %@", (uint8_t *)&v47, 0x16u);
    }
    __int16 v43 = *(void **)(a1 + 32);
    uint64_t v44 = *(void *)(a1 + 56);
    __int16 v45 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Remove 0-duration Incomplete Clips"];
    id v46 = (id)[v43 _removeClipsWithUUIDs:v44 options:v45];

    [*(id *)(a1 + 56) removeAllObjects];
  }
LABEL_19:
}

- (void)_cleanUpClipsForInitialStartup:(BOOL)a3
{
  id v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraClipManager *)self cleanupQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __55__HMDCameraClipManager__cleanUpClipsForInitialStartup___block_invoke;
  v7[3] = &unk_1E6A19B58;
  v7[4] = self;
  BOOL v8 = a3;
  dispatch_async(v6, v7);
}

uint64_t __55__HMDCameraClipManager__cleanUpClipsForInitialStartup___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanUpIncompleteClipsForInitialStartup:*(unsigned __int8 *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  return [v2 _cleanUpExpiredClips];
}

- (id)_performCloudPull
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraClipManager *)self cloudZone];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Explicit fetch"];
    id v6 = [(HMDCameraClipManager *)self cloudZone];
    id v7 = [v6 performCloudPullWithOptions:v5];
    BOOL v8 = (void *)MEMORY[0x1E4F7A0F0];
    id v9 = [(HMDCameraClipManager *)self workQueue];
    uint64_t v10 = [v8 schedulerWithDispatchQueue:v9];
    unint64_t v11 = [v7 reschedule:v10];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __41__HMDCameraClipManager__performCloudPull__block_invoke;
    v19[3] = &unk_1E6A197F0;
    v19[4] = self;
    uint64_t v12 = [v11 addFailureBlock:v19];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform cloud pull because zones are not ready", buf, 0xCu);
    }
    double v17 = (void *)MEMORY[0x1E4F7A0D8];
    id v5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    uint64_t v12 = [v17 futureWithError:v5];
  }

  return v12;
}

void __41__HMDCameraClipManager__performCloudPull__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform cloud pull due to cloud zone fetch timer firing: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (id)_fetchFaceCropURLForSignificantEventModel:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 faceCropAsset];
  id v6 = [v5 fileURL];

  if (v6
    && ([(HMDCameraClipManager *)self fileManager],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 fileExistsAtURL:v6],
        v7,
        v8))
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    __int16 v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v25 = v12;
      __int16 v26 = 2112;
      unint64_t v27 = v6;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Using existing cached face crop URL: %@", buf, 0x16u);
    }
    id v13 = [MEMORY[0x1E4F7A0D8] futureWithResult:v6];
  }
  else
  {
    id v14 = [(HMDCameraClipManager *)self cloudZone];
    id v15 = [v14 fetchCompleteModel:v4];

    unint64_t v16 = (void *)MEMORY[0x1E4F7A0F0];
    double v17 = [(HMDCameraClipManager *)self workQueue];
    double v18 = [v16 schedulerWithDispatchQueue:v17];
    id v19 = [v15 reschedule:v18];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __66__HMDCameraClipManager__fetchFaceCropURLForSignificantEventModel___block_invoke;
    v23[3] = &unk_1E6A129C0;
    void v23[4] = self;
    __int16 v20 = [v19 flatMap:v23];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __66__HMDCameraClipManager__fetchFaceCropURLForSignificantEventModel___block_invoke_153;
    v22[3] = &unk_1E6A197F0;
    v22[4] = self;
    id v13 = [v20 addFailureBlock:v22];
  }
  return v13;
}

id __66__HMDCameraClipManager__fetchFaceCropURLForSignificantEventModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 faceCropAsset];
  id v5 = [v4 fileURL];

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 32);
  int v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = HMFGetLogIdentifier();
      int v17 = 138543618;
      double v18 = v10;
      __int16 v19 = 2112;
      __int16 v20 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched face crop URL: %@", (uint8_t *)&v17, 0x16u);
    }
    id v11 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      id v13 = [v3 faceCropAsset];
      int v17 = 138543618;
      double v18 = v12;
      __int16 v19 = 2112;
      __int16 v20 = v13;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not find face crop file URL on fetched asset: %@", (uint8_t *)&v17, 0x16u);
    }
    id v14 = (void *)MEMORY[0x1E4F7A0D8];
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    id v11 = [v14 futureWithError:v15];
  }
  return v11;
}

void __66__HMDCameraClipManager__fetchFaceCropURLForSignificantEventModel___block_invoke_153(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch complete significant event notification model: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (id)_fetchHeroFrameURLForSignificantEventModel:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 heroFrameAsset];
  id v6 = [v5 fileURL];

  if (v6
    && ([(HMDCameraClipManager *)self fileManager],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 fileExistsAtURL:v6],
        v7,
        v8))
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    __int16 v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      id v13 = [v4 hmbModelID];

      if (v13)
      {
        id v14 = [v4 hmbModelID];
        [v14 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
      }
      long long v30 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      __int16 v32 = 2098;
      id v33 = &v30;
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Using existing cached hero frame URL for significant event with UUID %{public,uuid_t}.16P: %@", buf, 0x26u);
    }
    __int16 v26 = [MEMORY[0x1E4F7A0D8] futureWithResult:v6];
  }
  else
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    unint64_t v16 = self;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      double v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Force fetching significant event model from cloud for hero frame url", buf, 0xCu);
    }
    __int16 v19 = [(HMDCameraClipManager *)v16 cloudZone];
    __int16 v20 = [v19 fetchCompleteModel:v4];

    uint64_t v21 = (void *)MEMORY[0x1E4F7A0F0];
    uint64_t v22 = [(HMDCameraClipManager *)v16 workQueue];
    id v23 = [v21 schedulerWithDispatchQueue:v22];
    __int16 v24 = [v20 reschedule:v23];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __67__HMDCameraClipManager__fetchHeroFrameURLForSignificantEventModel___block_invoke;
    v29[3] = &unk_1E6A129C0;
    void v29[4] = v16;
    int v25 = [v24 flatMap:v29];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __67__HMDCameraClipManager__fetchHeroFrameURLForSignificantEventModel___block_invoke_151;
    v28[3] = &unk_1E6A197F0;
    v28[4] = v16;
    __int16 v26 = [v25 addFailureBlock:v28];
  }
  return v26;
}

id __67__HMDCameraClipManager__fetchHeroFrameURLForSignificantEventModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 heroFrameAsset];
  id v5 = [v4 fileURL];

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 32);
  int v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v10 = HMFGetLogIdentifier();
      int v17 = 138543618;
      double v18 = v10;
      __int16 v19 = 2112;
      __int16 v20 = v5;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched hero frame URL: %@", (uint8_t *)&v17, 0x16u);
    }
    id v11 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      id v13 = [v3 heroFrameAsset];
      int v17 = 138543618;
      double v18 = v12;
      __int16 v19 = 2112;
      __int16 v20 = v13;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not find hero frame file URL on fetched asset: %@", (uint8_t *)&v17, 0x16u);
    }
    id v14 = (void *)MEMORY[0x1E4F7A0D8];
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    id v11 = [v14 futureWithError:v15];
  }
  return v11;
}

void __67__HMDCameraClipManager__fetchHeroFrameURLForSignificantEventModel___block_invoke_151(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch complete significant event notification model: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (id)_fetchCanonicalHeroFrameURLForClipModel:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v37 = v4;
  id v6 = [v4 hmbModelID];
  id v7 = [(HMDCameraClipManager *)self significantEventsForClipWithUUID:v6];

  uint64_t v36 = v7;
  int v8 = [v7 allObjects];
  id v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_148_143226];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v48 count:16];
  id v38 = v10;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        unint64_t v16 = [(HMDCameraClipManager *)self localZone];
        int v17 = [v15 uniqueIdentifier];
        uint64_t v18 = objc_opt_class();
        id v39 = 0;
        __int16 v19 = [v16 fetchModelWithModelID:v17 ofType:v18 error:&v39];
        id v20 = v39;

        if (v19)
        {
          __int16 v32 = [(HMDCameraClipManager *)self _fetchHeroFrameURLForSignificantEventModel:v19];

          id v31 = v10;
          __int16 v34 = v10;
          id v33 = v36;
          uint64_t v28 = v37;
          goto LABEL_15;
        }
        uint64_t v21 = (void *)MEMORY[0x1D9452090]();
        uint64_t v22 = self;
        id v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          __int16 v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          __int16 v45 = v24;
          __int16 v46 = 2112;
          id v47 = v20;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch significant event notification model: %@", buf, 0x16u);

          id v10 = v38;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  int v25 = (void *)MEMORY[0x1D9452090]();
  __int16 v26 = self;
  unint64_t v27 = HMFGetOSLogHandle();
  uint64_t v28 = v37;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    id v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v45 = v29;
    __int16 v46 = 2112;
    id v47 = v37;
    _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Could not find hero frame on any significant event for clip model: %@", buf, 0x16u);
  }
  long long v30 = (void *)MEMORY[0x1E4F7A0D8];
  id v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  __int16 v32 = [v30 futureWithError:v31];
  id v33 = v36;
  __int16 v34 = v38;
LABEL_15:

  return v32;
}

uint64_t __64__HMDCameraClipManager__fetchCanonicalHeroFrameURLForClipModel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 reason] == 1 || objc_msgSend(v5, "reason") == 1)
  {
    if ([v4 reason] == 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = -1;
    }
  }
  else
  {
    uint64_t v7 = [v4 confidenceLevel];
    if (v7 == [v5 confidenceLevel])
    {
      int v8 = [v4 dateOfOccurrence];
      [v5 dateOfOccurrence];
    }
    else
    {
      int v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "confidenceLevel"));
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "confidenceLevel"));
    id v9 = };
    uint64_t v6 = [v8 compare:v9];
  }
  return v6;
}

- (BOOL)_fetchClipsWithDateInterval:(id)a3 quality:(int64_t)a4 isAscending:(BOOL)a5 error:(id *)a6 handler:(id)a7
{
  BOOL v9 = a5;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__HMDCameraClipManager__fetchClipsWithDateInterval_quality_isAscending_error_handler___block_invoke;
  aBlock[3] = &unk_1E6A12998;
  aBlock[4] = self;
  uint64_t v36 = &v37;
  id v14 = v13;
  id v35 = v14;
  id v15 = _Block_copy(aBlock);
  unint64_t v16 = (void *)MEMORY[0x1D9452090]();
  int v17 = self;
  HMFGetOSLogHandle();
  uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    __int16 v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v44 = v19;
    __int16 v45 = 2112;
    id v46 = v12;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Fetching clips with date interval: %@", buf, 0x16u);
  }
  if (v9) {
    +[HMDCameraClipModel clipsWithQualityBetweenDatesAscendingQuery];
  }
  else {
  id v20 = +[HMDCameraClipModel clipsWithQualityBetweenDatesDescendingQuery];
  }
  v41[0] = @"dateAfter";
  uint64_t v21 = [v12 startDate];
  v42[0] = v21;
  v41[1] = @"dateBefore";
  uint64_t v22 = [v12 endDate];
  v42[1] = v22;
  v41[2] = @"quality";
  id v23 = [NSNumber numberWithInteger:a4];
  v42[2] = v23;
  __int16 v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];

  int v25 = [(HMDCameraClipManager *)v17 localZone];
  __int16 v26 = [v25 queryModelsUsingQuery:v20 arguments:v24];

  [v26 enumerateObjectsUsingBlock:v15];
  unint64_t v27 = [v26 error];

  if (v27)
  {
    *((unsigned char *)v38 + 24) = 0;
    if (a6)
    {
      *a6 = [v26 error];
    }
  }
  uint64_t v28 = (void *)MEMORY[0x1D9452090]();
  id v29 = v17;
  HMFGetOSLogHandle();
  long long v30 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    id v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v44 = v31;
    _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Finished fetching clips", buf, 0xCu);
  }
  BOOL v32 = *((unsigned char *)v38 + 24) != 0;

  _Block_object_dispose(&v37, 8);
  return v32;
}

void __86__HMDCameraClipManager__fetchClipsWithDateInterval_quality_isAscending_error_handler___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v5 hmbModelID];
  int v8 = [v6 significantEventsForClipWithUUID:v7];

  if (v8)
  {
    BOOL v9 = [v5 createClipWithSignificantEvents:v8];
    if (v9) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543618;
      id v15 = v13;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch significant events for clip model %@", (uint8_t *)&v14, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (BOOL)_fetchSignificantEventsWithDateInterval:(id)a3 isAscending:(BOOL)a4 error:(id *)a5 handler:(id)a6
{
  BOOL v8 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  BOOL v32 = __90__HMDCameraClipManager__fetchSignificantEventsWithDateInterval_isAscending_error_handler___block_invoke;
  id v33 = &unk_1E6A12970;
  __int16 v34 = self;
  id v12 = v11;
  id v35 = v12;
  id v13 = _Block_copy(&v30);
  uint64_t v18 = (void *)MEMORY[0x1D9452090](v13, v14, v15, v16, v17);
  __int16 v19 = self;
  id v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v39 = v21;
    __int16 v40 = 2112;
    id v41 = v10;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Fetching significant events with date interval: %@", buf, 0x16u);
  }
  uint64_t v22 = +[HMDCameraSignificantEventNotificationModel significantEventsBetweenDatesQueryWithIsAscending:](HMDCameraSignificantEventNotificationModel, "significantEventsBetweenDatesQueryWithIsAscending:", v8, v30, v31, v32, v33, v34);
  v36[0] = @"dateAfter";
  id v23 = [v10 startDate];
  v36[1] = @"dateBefore";
  v37[0] = v23;
  __int16 v24 = [v10 endDate];
  v37[1] = v24;
  int v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];

  __int16 v26 = [(HMDCameraClipManager *)v19 localZone];
  unint64_t v27 = [v26 queryModelsUsingQuery:v22 arguments:v25];

  [v27 enumerateObjectsUsingBlock:v13];
  uint64_t v28 = [v27 error];

  if (a5 && v28)
  {
    *a5 = [v27 error];
  }

  return v28 == 0;
}

uint64_t __90__HMDCameraClipManager__fetchSignificantEventsWithDateInterval_isAscending_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _significantEventFromSignificantEventModel:a2];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v4 = v6;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (id)_faceClassificationsForSignificantEventWithUUID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraClipManager *)self localZone];
  id v15 = 0;
  uint64_t v6 = [v5 fetchModelsWithParentModelID:v4 ofType:objc_opt_class() error:&v15];
  id v7 = v15;

  if (v6)
  {
    uint64_t v8 = objc_msgSend(v6, "na_map:", &__block_literal_global_132_143237);
  }
  else
  {
    BOOL v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      if (v4) {
        [v4 getUUIDBytes:buf];
      }
      else {
        *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
      }
      long long v16 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      __int16 v18 = 2098;
      __int16 v19 = &v16;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch face classification models for significant event UUID %{public,uuid_t}.16P: %@", buf, 0x26u);
    }
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v13 = (void *)v8;

  return v13;
}

uint64_t __72__HMDCameraClipManager__faceClassificationsForSignificantEventWithUUID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 createFaceClassification];
}

- (id)_significantEventsWithUUIDs:(id)a3
{
  id v4 = [(HMDCameraClipManager *)self _significantEventModelsWithUUIDs:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __52__HMDCameraClipManager__significantEventsWithUUIDs___block_invoke;
  v7[3] = &unk_1E6A128B8;
  v7[4] = self;
  id v5 = objc_msgSend(v4, "na_map:", v7);

  return v5;
}

uint64_t __52__HMDCameraClipManager__significantEventsWithUUIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _significantEventFromSignificantEventModel:a2];
}

- (id)_significantEventFromSignificantEventModel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 hmbModelID];
  uint64_t v6 = [(HMDCameraClipManager *)self _faceClassificationsForSignificantEventWithUUID:v5];

  id v7 = [(HMDCameraClipManager *)self faceClassificationResolver];
  uint64_t v8 = [v7 faceClassificationForSignificantEventFaceClassifications:v6];

  BOOL v9 = [(HMDCameraClipManager *)self cameraProfileUUID];
  id v10 = [v4 createClipSignificantEventWithCameraProfileUUID:v9 faceClassification:v8];

  return v10;
}

- (id)_significantEventModelsForClipWithUUID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraClipManager *)self localZone];
  id v15 = 0;
  uint64_t v6 = [v5 fetchModelsWithParentModelID:v4 ofType:objc_opt_class() error:&v15];
  id v7 = v15;

  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    BOOL v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      if (v4) {
        [v4 getUUIDBytes:buf];
      }
      else {
        *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
      }
      long long v16 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      __int16 v18 = 2098;
      __int16 v19 = &v16;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch significant events for clip UUID %{public,uuid_t}.16P: %@", buf, 0x26u);
    }
    id v8 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v13 = v8;

  return v13;
}

- (id)_significantEventModelsWithUUIDs:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v29;
    *(void *)&long long v6 = 138544130;
    long long v23 = v6;
    do
    {
      uint64_t v9 = 0;
      uint64_t v24 = v7;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
        id v11 = [(HMDCameraClipManager *)self localZone];
        uint64_t v12 = objc_opt_class();
        id v27 = 0;
        id v13 = [v11 fetchModelWithModelID:v10 ofType:v12 error:&v27];
        id v14 = v27;

        if (v13)
        {
          [v26 addObject:v13];
        }
        else
        {
          uint64_t v15 = v8;
          long long v16 = (void *)MEMORY[0x1D9452090]();
          uint64_t v17 = self;
          __int16 v18 = self;
          __int16 v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            __int16 v20 = HMFGetLogIdentifier();
            *(void *)buf = 0;
            *(void *)&buf[8] = 0;
            if (v10) {
              [v10 getUUIDBytes:buf];
            }
            else {
              *(_OWORD *)buf = *MEMORY[0x1E4F655A8];
            }
            long long v32 = *(_OWORD *)buf;
            *(_DWORD *)buf = v23;
            *(void *)&uint8_t buf[4] = v20;
            *(_WORD *)&buf[12] = 1042;
            *(_DWORD *)&buf[14] = 16;
            __int16 v34 = 2098;
            id v35 = &v32;
            __int16 v36 = 2112;
            id v37 = v14;
            _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch significant notification model with UUID %{public,uuid_t}.16P: %@", buf, 0x26u);
          }
          uint64_t v8 = v15;
          self = v17;
          uint64_t v7 = v24;
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v7);
  }

  id v21 = (void *)[v26 copy];
  return v21;
}

- (id)home
{
  id v2 = [(HMDCameraClipManager *)self zoneManager];
  uint64_t v3 = [v2 home];

  return v3;
}

- (id)significantEventsForClipContainingDate:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDCameraClipManager *)self localZone];

  if (v5)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v38 = 0x3032000000;
    uint64_t v39 = __Block_byref_object_copy__143244;
    __int16 v40 = __Block_byref_object_dispose__143245;
    id v41 = 0;
    id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] distantPast];
    uint64_t v8 = (void *)[v6 initWithStartDate:v7 endDate:v4];

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __63__HMDCameraClipManager_significantEventsForClipContainingDate___block_invoke;
    v30[3] = &unk_1E6A12928;
    v30[4] = &buf;
    BOOL v9 = [(HMDCameraClipManager *)self _fetchClipsWithDateInterval:v8 quality:0 isAscending:0 error:0 handler:v30];
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      id v10 = objc_alloc(MEMORY[0x1E4F28C18]);
      id v11 = [*(id *)(*((void *)&buf + 1) + 40) startDate];
      [*(id *)(*((void *)&buf + 1) + 40) duration];
      id v13 = (void *)[v10 initWithStartDate:v11 duration:v12 + 30.0];

      if ([v13 containsDate:v4])
      {
        uint64_t v14 = [*(id *)(*((void *)&buf + 1) + 40) significantEvents];
      }
      else
      {
        uint64_t v24 = (void *)MEMORY[0x1D9452090]();
        int v25 = self;
        HMFGetOSLogHandle();
        __int16 v26 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          id v27 = HMFGetLogIdentifier();
          long long v28 = *(void **)(*((void *)&buf + 1) + 40);
          *(_DWORD *)long long v31 = 138543874;
          long long v32 = v27;
          __int16 v33 = 2112;
          id v34 = v28;
          __int16 v35 = 2112;
          id v36 = v4;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Clip: %@, does not contain date: %@", v31, 0x20u);
        }
        uint64_t v14 = [MEMORY[0x1E4F1CAD0] set];
      }
      __int16 v19 = (void *)v14;
    }
    else
    {
      __int16 v20 = (void *)MEMORY[0x1D9452090](v9);
      id v21 = self;
      HMFGetOSLogHandle();
      uint64_t v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        long long v23 = HMFGetLogIdentifier();
        *(_DWORD *)long long v31 = 138543618;
        long long v32 = v23;
        __int16 v33 = 2112;
        id v34 = v4;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Did not find any clips before date: %@", v31, 0x16u);
      }
      __int16 v19 = [MEMORY[0x1E4F1CAD0] set];
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1D9452090]();
    long long v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch significant events clip containing date because zones are not ready", (uint8_t *)&buf, 0xCu);
    }
    __int16 v19 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v19;
}

void __63__HMDCameraClipManager_significantEventsForClipContainingDate___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)performCloudPull
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  id v4 = [(HMDCameraClipManager *)self workQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__HMDCameraClipManager_performCloudPull__block_invoke;
  v9[3] = &unk_1E6A197C8;
  void v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_async(v4, v9);

  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __40__HMDCameraClipManager_performCloudPull__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _performCloudPull];
  id v2 = [*(id *)(a1 + 40) completionHandlerAdapter];
  id v3 = (id)[v4 addCompletionBlock:v2];
}

- (void)cleanUpClips
{
  id v3 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(HMDCameraClipManager *)self _cleanUpClipsForInitialStartup:0];
}

- (id)remove
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v11 = 138543362;
    double v12 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Asked to remove clip manager zones", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v8 = [(HMDCameraClipManager *)v5 zoneManager];
  BOOL v9 = [v8 remove];

  return v9;
}

- (id)fetchHeroFrameURLForSignificantEventWithUUID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraClipManager *)self localZone];
  id v17 = 0;
  id v7 = [v6 fetchModelWithModelID:v4 ofType:objc_opt_class() error:&v17];
  id v8 = v17;

  if (v7)
  {
    BOOL v9 = [(HMDCameraClipManager *)self _fetchHeroFrameURLForSignificantEventModel:v7];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    int v11 = self;
    double v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(void *)long long buf = 0;
      *(void *)&buf[8] = 0;
      if (v4) {
        [v4 getUUIDBytes:buf];
      }
      else {
        *(_OWORD *)long long buf = *MEMORY[0x1E4F655A8];
      }
      long long v18 = *(_OWORD *)buf;
      *(_DWORD *)long long buf = 138544130;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      __int16 v20 = 2098;
      id v21 = &v18;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch significant notification model with UUID %{public,uuid_t}.16P: %@", buf, 0x26u);
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    BOOL v9 = [v14 futureWithError:v15];
  }
  return v9;
}

- (id)heroFrameURLForSignificantEventWithUUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraClipManager *)self localZone];
  id v16 = 0;
  id v7 = [v6 fetchModelWithModelID:v4 ofType:objc_opt_class() error:&v16];
  id v8 = v16;

  if (v7)
  {
    BOOL v9 = [v7 heroFrameAsset];
    id v10 = [v9 fileURL];
  }
  else
  {
    int v11 = (void *)MEMORY[0x1D9452090]();
    double v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(void *)long long buf = 0;
      *(void *)&buf[8] = 0;
      if (v4) {
        [v4 getUUIDBytes:buf];
      }
      else {
        *(_OWORD *)long long buf = *MEMORY[0x1E4F655A8];
      }
      long long v17 = *(_OWORD *)buf;
      *(_DWORD *)long long buf = 138544130;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      __int16 v19 = 2098;
      __int16 v20 = &v17;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch significant notification model with UUID %{public,uuid_t}.16P: %@", buf, 0x26u);
    }
    id v10 = 0;
  }

  return v10;
}

- (void)configure
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraClipManager *)self zoneManager];
  id v5 = [v4 home];

  if (v5)
  {
    id v6 = [(HMDCameraClipManager *)self messageDispatcher];
    uint64_t v7 = +[HMDXPCMessagePolicy policyWithEntitlements:133];
    uint64_t v8 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v5 userPrivilege:0 remoteAccessRequired:0];
    BOOL v9 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v5 userPrivilege:4 remoteAccessRequired:0];
    __int16 v45 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v5 userPrivilege:3 remoteAccessRequired:0];
    v52[0] = v7;
    v52[1] = v8;
    __int16 v40 = (void *)v8;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
    [v6 registerForMessage:*MEMORY[0x1E4F2CB60] receiver:self policies:v10 selector:sel_handleFetchVideoSegmentsAssetContextMessage_];
    [v6 registerForMessage:*MEMORY[0x1E4F2CC28] receiver:self policies:v10 selector:sel_handleSubscribeMessage_];
    [v6 registerForMessage:*MEMORY[0x1E4F2CC30] receiver:self policies:v10 selector:sel_handleUnsubscribeMessage_];
    [v6 registerForMessage:*MEMORY[0x1E4F2CC18] receiver:self policies:v10 selector:sel_handlePerformCloudPullMessage_];
    [v6 registerForMessage:*MEMORY[0x1E4F2CB18] receiver:self policies:v10 selector:sel_handleFetchClipMessage_];
    [v6 registerForMessage:*MEMORY[0x1E4F2CB20] receiver:self policies:v10 selector:sel_handleFetchClipsMessage_];
    [v6 registerForMessage:*MEMORY[0x1E4F2CB10] receiver:self policies:v10 selector:sel_handleFetchClipForSignificantEventMessage_];
    [v6 registerForMessage:*MEMORY[0x1E4F2CB28] receiver:self policies:v10 selector:sel_handleFetchCountOfClipsMessage_];
    [v6 registerForMessage:*MEMORY[0x1E4F2CB40] receiver:self policies:v10 selector:sel_handleFetchHeroFrameDataRepresentationMessage_];
    [v6 registerForMessage:*MEMORY[0x1E4F2CB48] receiver:self policies:v10 selector:sel_handleFetchHeroFrameURLMessage_];
    [v6 registerForMessage:*MEMORY[0x1E4F2CB30] receiver:self policies:v10 selector:sel_handleFetchFaceCropDataRepresentationMessage_];
    [v6 registerForMessage:*MEMORY[0x1E4F2CB38] receiver:self policies:v10 selector:sel_handleFetchFaceCropURLMessage_];
    [v6 registerForMessage:*MEMORY[0x1E4F2CB58] receiver:self policies:v10 selector:sel_handleFetchSignificantEventsMessage_];
    uint64_t v11 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:4];
    id v46 = (void *)v7;
    v51[0] = v7;
    v51[1] = v9;
    v51[2] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:3];
    [v6 registerForMessage:*MEMORY[0x1E4F2CAF8] receiver:self policies:v12 selector:sel_handleDeleteClipMessage_];
    [v6 registerForMessage:*MEMORY[0x1E4F2CAF0] receiver:self policies:v12 selector:sel_handleDeleteAllClipsMessage_];
    long long v43 = (void *)v12;
    [v6 registerForMessage:*MEMORY[0x1E4F2CB68] receiver:self policies:v12 selector:sel_handleHandleFaceMisclassificationMessage_];
    +[HMDRemoteMessagePolicy defaultSecurePolicy];
    uint64_t v44 = (void *)v11;
    v50[0] = v9;
    uint64_t v42 = v50[1] = v11;
    v50[2] = v42;
    id v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:3];
    objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", @"HMDCCM.m.rhfm", self);
    if (isInternalBuild())
    {
      uint64_t v13 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:1];
      uint64_t v14 = *MEMORY[0x1E4F2CB70];
      v49[0] = v46;
      v49[1] = v45;
      v49[2] = v13;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
      [v6 registerForMessage:v14 receiver:self policies:v15 selector:sel_handleImportClipsMessage_];

      uint64_t v16 = *MEMORY[0x1E4F2CB50];
      v48[0] = v46;
      v48[1] = v45;
      long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
      [v6 registerForMessage:v16 receiver:self policies:v17 selector:sel_handleFetchIsCloudStorageEnabledMessage_];

      uint64_t v18 = *MEMORY[0x1E4F2CC38];
      v47[0] = v46;
      v47[1] = v45;
      __int16 v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
      [v6 registerForMessage:v18 receiver:self policies:v19 selector:sel_handleUpdateCloudStorageMessage_];
    }
    __int16 v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:self selector:sel_handleUserPrivilegeDidChangeNotification_ name:@"HMDUserPrivilegeDidChangeNotification" object:0];

    __int16 v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:self selector:sel_handleUserCamerasAccessLevelDidChangeNotification_ name:@"HMDUserCamerasAccessLevelDidChangeNotification" object:0];

    id v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:self selector:sel_handleUserRemoteAccessDidChangeNotification_ name:@"HMDUserRemoteAccessDidChangeNotification" object:0];

    uint64_t v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:self selector:sel_handleHomePersonManagerSettingsDidChangeNotification_ name:@"HMDHomePersonManagerSettingsDidChangeNotification" object:v5];

    uint64_t v24 = [(HMDCameraClipManager *)self zoneManager];
    int v25 = [v24 defaultConfiguration];
    __int16 v26 = (void *)[v25 mutableCopy];

    objc_msgSend(v26, "setZoneOwner:", objc_msgSend(v5, "isOwnerUser"));
    id v27 = (void *)MEMORY[0x1E4F1CAD0];
    long long v28 = +[HMDCameraSignificantEventNotificationModel hmbExternalRecordType];
    long long v29 = [v27 setWithObject:v28];
    [v26 setExternalRecordTypesForSubscriptions:v29];

    long long v30 = [(HMDCameraClipManager *)self zoneManager];
    [v30 setDefaultConfiguration:v26];

    long long v31 = [(HMDCameraClipManager *)self zoneManager];
    [v31 setDelegate:self];

    long long v32 = [(HMDCameraClipManager *)self zoneManager];
    [v32 setDataSource:self];

    __int16 v33 = [(HMDCameraClipManager *)self zoneManager];
    [v33 configure];

    id v34 = [(HMDCameraClipManager *)self zoneManager];
    [v34 start];

    __int16 v35 = [(HMDCameraClipManager *)self clientConnectionsTimer];
    [v35 setDelegate:self];
  }
  else
  {
    id v36 = (void *)MEMORY[0x1D9452090]();
    id v37 = self;
    uint64_t v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v54 = v39;
      _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, "%{public}@Skipping camera clip manager configure because home reference is nil", buf, 0xCu);
    }
  }
}

- (NSDictionary)stateDump
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = @"Subscribed Clients";
  id v2 = [(HMDCameraClipManager *)self clientConnectionsTimer];
  id v3 = [v2 clientConnections];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_143280);
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return (NSDictionary *)v5;
}

uint64_t __33__HMDCameraClipManager_stateDump__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stateDump];
}

- (BOOL)hasStartedUpCloudZone
{
  id v2 = [(HMDCameraClipManager *)self cloudZone];
  id v3 = [v2 startUp];
  char v4 = [v3 isFinished];

  return v4;
}

- (void)setHasWriteAccess:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDCameraClipManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_hasWriteAccess != v3)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    uint64_t v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = HMFGetLogIdentifier();
      id v10 = HMFBooleanToString();
      uint64_t v11 = HMFBooleanToString();
      int v13 = 138543874;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating has write access from %@ to %@", (uint8_t *)&v13, 0x20u);
    }
    self->_hasWriteAccess = v3;
    if (v3)
    {
      uint64_t v12 = [(HMDCameraClipManager *)v7 zoneManager];
      [v12 updateShareParticipants];
    }
  }
}

- (id)significantEventsWithDateInterval:(id)a3
{
  char v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__HMDCameraClipManager_significantEventsWithDateInterval___block_invoke;
  v10[3] = &unk_1E6A128E0;
  id v11 = v6;
  id v7 = v6;
  [(HMDCameraClipManager *)self _fetchSignificantEventsWithDateInterval:v5 isAscending:1 error:0 handler:v10];

  uint64_t v8 = (void *)[v7 copy];
  return v8;
}

uint64_t __58__HMDCameraClipManager_significantEventsWithDateInterval___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)significantEventsForClipWithUUID:(id)a3
{
  char v4 = [(HMDCameraClipManager *)self _significantEventModelsForClipWithUUID:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __57__HMDCameraClipManager_significantEventsForClipWithUUID___block_invoke;
  v7[3] = &unk_1E6A128B8;
  v7[4] = self;
  id v5 = objc_msgSend(v4, "na_map:", v7);

  return v5;
}

uint64_t __57__HMDCameraClipManager_significantEventsForClipWithUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _significantEventFromSignificantEventModel:a2];
}

- (NSString)zoneName
{
  id v2 = [(HMDCameraClipManager *)self zoneManager];
  BOOL v3 = [v2 zoneName];

  return (NSString *)v3;
}

- (HMDCameraClipManager)initWithZoneManager:(id)a3 quotaManager:(id)a4 faceClassificationResolver:(id)a5 clientConnectionsTimer:(id)a6 messageDispatcher:(id)a7 workQueue:(id)a8 cameraProfileUUID:(id)a9 fileManager:(id)a10 featuresDataSource:(id)a11
{
  id v17 = a3;
  id obj = a4;
  id v18 = a4;
  id v49 = a5;
  id v19 = a5;
  id v20 = a7;
  id v57 = v19;
  id v56 = a6;
  id v55 = a7;
  id v50 = a8;
  id v21 = a8;
  id v22 = a9;
  id v54 = a10;
  id v23 = a11;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v18)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v57)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v56)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v55)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v21)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v22)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  if (!v23)
  {
LABEL_19:
    uint64_t v46 = _HMFPreconditionFailure();
    return (HMDCameraClipManager *)__184__HMDCameraClipManager_initWithZoneManager_quotaManager_faceClassificationResolver_clientConnectionsTimer_messageDispatcher_workQueue_cameraProfileUUID_fileManager_featuresDataSource___block_invoke(v46, v47);
  }
  uint64_t v51 = v23;
  uint64_t v52 = v18;
  v60.receiver = self;
  v60.super_class = (Class)HMDCameraClipManager;
  uint64_t v24 = v17;
  int v25 = [(HMDCameraClipManager *)&v60 init];
  __int16 v26 = v25;
  id v27 = v21;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_zoneManager, a3);
    objc_storeStrong((id *)&v26->_messageDispatcher, v20);
    objc_storeStrong((id *)&v26->_quotaManager, obj);
    objc_storeStrong((id *)&v26->_faceClassificationResolver, v49);
    objc_storeStrong((id *)&v26->_clientConnectionsTimer, a6);
    objc_storeStrong((id *)&v26->_workQueue, v50);
    objc_storeStrong((id *)&v26->_cameraProfileUUID, a9);
    objc_storeStrong((id *)&v26->_fileManager, a10);
    objc_storeStrong((id *)&v26->_featuresDataSource, a11);
    long long v28 = NSString;
    [v24 zoneName];
    v30 = long long v29 = v24;
    uint64_t v31 = [v28 stringWithFormat:@"%@/%@", v22, v30];
    logIdentifier = v26->_logIdentifier;
    v26->_logIdentifier = (NSString *)v31;

    uint64_t v33 = [MEMORY[0x1E4F1C9C8] distantPast];
    suppressNotificationsBeforeDate = v26->_suppressNotificationsBeforeDate;
    v26->_suppressNotificationsBeforeDate = (NSDate *)v33;

    v26->_fetchBatchLimit = 100;
    HMDispatchQueueNameString();
    id v35 = objc_claimAutoreleasedReturnValue();
    uint64_t v36 = [v35 UTF8String];
    id v37 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_get_global_queue(9, 0);
    uint64_t v39 = v38 = v22;
    __int16 v40 = (const char *)v36;
    uint64_t v24 = v29;
    dispatch_queue_t v41 = dispatch_queue_create_with_target_V2(v40, v37, v39);
    cleanupQueue = v26->_cleanupQueue;
    v26->_cleanupQueue = (OS_dispatch_queue *)v41;

    id v22 = v38;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __184__HMDCameraClipManager_initWithZoneManager_quotaManager_faceClassificationResolver_clientConnectionsTimer_messageDispatcher_workQueue_cameraProfileUUID_fileManager_featuresDataSource___block_invoke;
    aBlock[3] = &unk_1E6A12890;
    id v59 = v27;
    long long v43 = _Block_copy(aBlock);
    id fetchServerFactory = v26->_fetchServerFactory;
    v26->_id fetchServerFactory = v43;
  }
  return v26;
}

id __184__HMDCameraClipManager_initWithZoneManager_quotaManager_faceClassificationResolver_clientConnectionsTimer_messageDispatcher_workQueue_cameraProfileUUID_fileManager_featuresDataSource___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (objc_class *)MEMORY[0x1E4F2E720];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithFetchMessage:v4 workQueue:*(void *)(a1 + 32)];

  return v5;
}

- (HMDCameraClipManager)initWithHome:(id)a3 zoneName:(id)a4 messageDispatcher:(id)a5 workQueue:(id)a6 cameraProfileUUID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v34 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v13)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v34)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v14)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  uint64_t v16 = v15;
  if (v15)
  {
    id v17 = [HMDDatabaseZoneManager alloc];
    id v18 = +[HMDDatabase cameraClipsDatabase];
    id v19 = [(HMDDatabaseZoneManager *)v17 initWithDatabase:v18 zoneName:v13 home:v12 messageTargetUUID:v16 workQueue:v14];

    id v20 = [[HMDCameraSignificantEventFaceClassificationResolver alloc] initWithHome:v12];
    id v21 = [HMDActiveXPCClientConnectionsPeriodicTimer alloc];
    id v22 = [(HMDDatabaseZoneManager *)v19 zoneName];
    id v23 = [(HMDActiveXPCClientConnectionsPeriodicTimer *)v21 initWithTimeInterval:v22 logIdentifier:v14 workQueue:4.0];

    uint64_t v24 = objc_alloc_init(HMDFeaturesDataSource);
    +[HMDCameraClipsQuotaManager defaultManager];
    __int16 v26 = v25 = self;
    long long v32 = v13;
    uint64_t v33 = v12;
    id v27 = objc_alloc_init(HMDFileManager);
    long long v28 = [(HMDCameraClipManager *)v25 initWithZoneManager:v19 quotaManager:v26 faceClassificationResolver:v20 clientConnectionsTimer:v23 messageDispatcher:v34 workQueue:v14 cameraProfileUUID:v16 fileManager:v27 featuresDataSource:v24];

    return v28;
  }
LABEL_11:
  long long v30 = (void *)_HMFPreconditionFailure();
  return (HMDCameraClipManager *)+[HMDCameraClipManager logCategory];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t149 != -1) {
    dispatch_once(&logCategory__hmf_once_t149, &__block_literal_global_223_143339);
  }
  id v2 = (void *)logCategory__hmf_once_v150;
  return v2;
}

uint64_t __35__HMDCameraClipManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v150;
  logCategory__hmf_once_v150 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (double)maximumClipDuration
{
  id v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  BOOL v3 = [v2 preferenceForKey:@"maxClipDuration"];
  id v4 = [v3 numberValue];

  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

@end