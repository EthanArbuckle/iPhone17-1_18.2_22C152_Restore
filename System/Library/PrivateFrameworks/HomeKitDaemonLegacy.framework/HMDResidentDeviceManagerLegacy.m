@interface HMDResidentDeviceManagerLegacy
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)_createResidentDeviceWithModel:(id)a3;
- (BOOL)_shouldEnableCoordinationElection;
- (BOOL)hasFirstHomeManagerZoneFetch;
- (BOOL)hasFirstHomeZoneFetch;
- (BOOL)hasFirstLegacyFetch;
- (BOOL)hasTrustZoneCapableResident;
- (BOOL)isCurrentDeviceAvailableResident;
- (BOOL)isCurrentDeviceConfirmedPrimaryResident;
- (BOOL)isCurrentDevicePrimaryResident;
- (BOOL)isOwnerUser;
- (BOOL)isResidentAvailable;
- (BOOL)isResidentElectionV2Enabled;
- (BOOL)isResidentEnabled;
- (BOOL)isResidentSupported;
- (HMDDevice)confirmedPrimaryResidentDevice;
- (HMDHome)home;
- (HMDHomePrimaryResidentInitialReachabilityManager)primaryResidentInitialReachabilityManager;
- (HMDMessageDispatcher)messageDispatcher;
- (HMDPrimaryElectionCoordinationAddOn)localNetworkElection;
- (HMDPrimaryElectionLegacyAddOn)legacyElection;
- (HMDResidentDevice)primaryResidentDevice;
- (HMDResidentDeviceManagerDelegate)delegate;
- (HMDResidentDeviceManagerLegacy)init;
- (HMDResidentDeviceManagerLegacy)initWithCoder:(id)a3;
- (HMDResidentDeviceManagerLegacy)initWithDataSource:(id)a3;
- (HMDResidentDeviceManagerLegacyDataSource)dataSource;
- (HMFFuture)cloudReady;
- (HMFFuture)firstPrimaryResidentDiscoveryAttemptCompletionFuture;
- (HMFPromise)cloudReadyPromise;
- (NSArray)availableResidentDevices;
- (NSArray)residentDevices;
- (NSHashTable)devicePreferenceDataSources;
- (NSNotificationCenter)notificationCenter;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)logIdentifier;
- (NSUUID)messageTargetUUID;
- (NSUUID)primaryResidentUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (OS_dispatch_queue)queue;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)dumpState;
- (id)ourSelf;
- (id)residentDeviceForDevice:(id)a3;
- (id)residentWithUUID:(id)a3;
- (id)shortDescription;
- (int64_t)atHomeLevel;
- (void)__currentDeviceUpdated:(id)a3 completion:(id)a4;
- (void)_addResidentDevice:(id)a3;
- (void)_electResidentDevice:(unint64_t)a3;
- (void)_fixUpRemoteResidentDevice:(id)a3 existingResidentDevice:(id)a4;
- (void)_handleCloudZoneReadyNotification:(id)a3;
- (void)_handleResidentDeviceUpdateEnabled:(id)a3;
- (void)_registerForMessages;
- (void)_removeResidentDevice:(id)a3;
- (void)_removeResidentDevice:(id)a3 reason:(id)a4;
- (void)_removeResidentDeviceWithModel:(id)a3 message:(id)a4;
- (void)_run;
- (void)_sendResidentDeviceNotificationWithName:(id)a3 forResidentDevice:(id)a4;
- (void)_setupSessionWithPrimaryResidentDevice;
- (void)_startElectionAddOn;
- (void)_stopCoordinationElectionWithReason:(id)a3;
- (void)_stopLegacyElectionWithReason:(id)a3;
- (void)_teardownSessionWithPrimaryResidentDevice;
- (void)_updateReachability:(BOOL)a3 forResidentDevice:(id)a4;
- (void)_updateResidentAvailability;
- (void)_verifyCurrentResidentDevice;
- (void)addDataSource:(id)a3;
- (void)atHomeLevelChanged:(int64_t)a3;
- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4;
- (void)confirmAsResident;
- (void)confirmOnAvailability;
- (void)confirmWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)electResidentDevice:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleCurrentDeviceChanged:(id)a3;
- (void)handleDeviceUpdated:(id)a3;
- (void)handleHomeUpdatedAccessories:(id)a3;
- (void)handleResidentDeviceIsNotReachable:(id)a3;
- (void)handleResidentDeviceIsReachable:(id)a3;
- (void)invalidate;
- (void)notifyClientsOfUpdatedResidentDevice:(id)a3;
- (void)notifyResidentAvailable:(BOOL)a3;
- (void)notifyUpdatedPrimaryResident:(id)a3;
- (void)primaryElectionAddOn:(id)a3 didElectPrimaryResident:(id)a4 confirmed:(BOOL)a5 electionLogEvent:(id)a6;
- (void)primaryElectionAddOn:(id)a3 didFailToElectWithError:(id)a4;
- (void)primaryElectionAddOn:(id)a3 didUpdateActiveNodes:(id)a4;
- (void)primaryElectionAddOn:(id)a3 didUpdateResidentDevice:(id)a4;
- (void)removeResidentDevice:(id)a3;
- (void)run;
- (void)setCloudReadyPromise:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstHomeManagerZoneFetch:(BOOL)a3;
- (void)setFirstHomeZoneFetch:(BOOL)a3;
- (void)setFirstLegacyFetch:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setLegacyElection:(id)a3;
- (void)setLocalNetworkElection:(id)a3;
- (void)setPrimaryResidentInitialReachabilityManager:(id)a3;
- (void)setResidentAvailable:(BOOL)a3;
- (void)setResidentSupported:(BOOL)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)updatePrimaryResidentWithUUID:(id)a3 actions:(id)a4;
- (void)updateResidentAvailability;
@end

@implementation HMDResidentDeviceManagerLegacy

- (HMDResidentDevice)primaryResidentDevice
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_primaryResidentUUID;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_residentDevices;
  id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "identifier", (void)v13);
        char v11 = [(NSUUID *)v4 isEqual:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return (HMDResidentDevice *)v6;
}

- (BOOL)isResidentAvailable
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_residentAvailable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isCurrentDeviceAvailableResident
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(HMDResidentDeviceManagerLegacy *)self residentDevices];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v7 = [v6 device];
        char v8 = [v7 isCurrentDevice];

        if (v8)
        {
          LOBYTE(v3) = [v6 isEnabled];
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSArray)residentDevices
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = [(NSMutableSet *)self->_residentDevices allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (BOOL)isCurrentDeviceConfirmedPrimaryResident
{
  v2 = [(HMDResidentDeviceManagerLegacy *)self primaryResidentDevice];
  if ([v2 isCurrentDevice]) {
    char v3 = [v2 isConfirmed];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  v2 = [(HMDResidentDeviceManagerLegacy *)self primaryResidentDevice];
  char v3 = [v2 isCurrentDevice];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localNetworkElection, 0);
  objc_storeStrong((id *)&self->_legacyElection, 0);
  objc_storeStrong((id *)&self->_cloudReadyPromise, 0);
  objc_storeStrong((id *)&self->_primaryResidentInitialReachabilityManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_devicePreferenceDataSources, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudReady, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_primaryResidentUUID, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_residentDevices, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setLocalNetworkElection:(id)a3
{
}

- (HMDPrimaryElectionCoordinationAddOn)localNetworkElection
{
  return (HMDPrimaryElectionCoordinationAddOn *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLegacyElection:(id)a3
{
}

- (HMDPrimaryElectionLegacyAddOn)legacyElection
{
  return (HMDPrimaryElectionLegacyAddOn *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCloudReadyPromise:(id)a3
{
}

- (HMFPromise)cloudReadyPromise
{
  return (HMFPromise *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPrimaryResidentInitialReachabilityManager:(id)a3
{
}

- (HMDHomePrimaryResidentInitialReachabilityManager)primaryResidentInitialReachabilityManager
{
  return (HMDHomePrimaryResidentInitialReachabilityManager *)objc_getProperty(self, a2, 120, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 112, 1);
}

- (NSHashTable)devicePreferenceDataSources
{
  return self->_devicePreferenceDataSources;
}

- (HMDResidentDeviceManagerLegacyDataSource)dataSource
{
  return (HMDResidentDeviceManagerLegacyDataSource *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDResidentDeviceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (HMDResidentDeviceManagerDelegate *)WeakRetained;
}

- (HMFFuture)cloudReady
{
  return (HMFFuture *)objc_getProperty(self, a2, 72, 1);
}

- (HMDMessageDispatcher)messageDispatcher
{
  return (HMDMessageDispatcher *)objc_getProperty(self, a2, 64, 1);
}

- (void)primaryElectionAddOn:(id)a3 didUpdateActiveNodes:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  long long v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    long long v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    long long v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Received updated active nodes: %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)primaryElectionAddOn:(id)a3 didFailToElectWithError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  long long v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    long long v11 = HMFGetLogIdentifier();
    int v12 = 138543874;
    long long v13 = v11;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Election %@ failed: %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)primaryElectionAddOn:(id)a3 didUpdateResidentDevice:(id)a4
{
}

- (void)primaryElectionAddOn:(id)a3 didElectPrimaryResident:(id)a4 confirmed:(BOOL)a5 electionLogEvent:(id)a6
{
  BOOL v7 = a5;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v13 = [(HMDResidentDeviceManagerLegacy *)self queue];
  dispatch_assert_queue_V2(v13);

  id v14 = [(HMDResidentDeviceManagerLegacy *)self localNetworkElection];
  if (v14 != v10)
  {

    goto LABEL_4;
  }
  char v15 = [v11 isCurrentDevice];

  if (v15)
  {
LABEL_4:
    __int16 v16 = [(HMDResidentDeviceManagerLegacy *)self primaryResidentDevice];
    if (HMFEqualObjects())
    {
      int v17 = [v16 isConfirmed];
      uint64_t v18 = (void *)MEMORY[0x1D9452090]();
      v19 = self;
      v20 = HMFGetOSLogHandle();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
      if (v17 == v7)
      {
        if (v21)
        {
          v51 = HMFGetLogIdentifier();
          int v56 = 138543362;
          v57 = v51;
          _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Resident device did not change after election.", (uint8_t *)&v56, 0xCu);
        }
        [(HMDResidentDeviceManagerLegacy *)v19 _run];
        goto LABEL_19;
      }
      if (v21)
      {
        v22 = HMFGetLogIdentifier();
        v23 = HMFBooleanToString();
        int v56 = 138543618;
        v57 = v22;
        __int16 v58 = 2112;
        id v59 = v23;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Updating current resident confirmed to %@", (uint8_t *)&v56, 0x16u);
      }
      v24 = [(HMDResidentDeviceManagerLegacy *)v19 home];
      v25 = [HMDResidentDeviceModel alloc];
      v26 = [v11 identifier];
      v27 = [v24 uuid];
      v28 = [(HMDBackingStoreModelObject *)v25 initWithObjectChangeType:2 uuid:v26 parentUUID:v27];

      v29 = [NSNumber numberWithBool:v7];
      [(HMDResidentDeviceModel *)v28 setConfirmed:v29];

      v30 = [v24 backingStore];
      v31 = +[HMDBackingStoreTransactionOptions defaultResidenceOptions];
      v32 = [v30 transaction:@"residentConfirmed" options:v31];

      [(HMDHomeModel *)v32 add:v28 withMessage:0];
      [(HMDHomeModel *)v32 run];
      if (!v12)
      {
LABEL_15:

LABEL_19:
        goto LABEL_20;
      }
      v33 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v33 submitLogEvent:v12];
    }
    else
    {
      v34 = (void *)MEMORY[0x1D9452090]();
      v35 = self;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = HMFGetLogIdentifier();
        int v56 = 138543874;
        v57 = v37;
        __int16 v58 = 2112;
        id v59 = v16;
        __int16 v60 = 2112;
        id v61 = v11;
        _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@Resident device changed from %@ to %@ after election. Confirming...", (uint8_t *)&v56, 0x20u);
      }
      v24 = [(HMDResidentDeviceManagerLegacy *)v35 home];
      v38 = [HMDResidentDeviceModel alloc];
      v39 = [v11 identifier];
      v40 = [v24 uuid];
      v28 = [(HMDBackingStoreModelObject *)v38 initWithObjectChangeType:2 uuid:v39 parentUUID:v40];

      v41 = [NSNumber numberWithBool:v7];
      [(HMDResidentDeviceModel *)v28 setConfirmed:v41];

      v42 = [HMDHomeModel alloc];
      v43 = [v24 uuid];
      v44 = [v24 homeManager];
      v45 = [v44 uuid];
      v32 = [(HMDBackingStoreModelObject *)v42 initWithObjectChangeType:2 uuid:v43 parentUUID:v45];

      v46 = [v11 identifier];
      v47 = [v46 UUIDString];
      [(HMDHomeModel *)v32 setPrimaryResidentUUID:v47];

      v48 = [v24 backingStore];
      v49 = +[HMDBackingStoreTransactionOptions defaultResidenceOptions];
      v33 = [v48 transaction:@"electResidentDevice" options:v49];

      [v33 add:v32 withMessage:0];
      [v33 add:v28 withMessage:0];
      [v33 run];
      if (v12)
      {
        v50 = +[HMDMetricsManager sharedLogEventSubmitter];
        [v50 submitLogEvent:v12];
      }
    }

    goto LABEL_15;
  }
  v52 = (void *)MEMORY[0x1D9452090]();
  v53 = self;
  v54 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    v55 = HMFGetLogIdentifier();
    int v56 = 138543618;
    v57 = v55;
    __int16 v58 = 2112;
    id v59 = v11;
    _os_log_impl(&dword_1D49D5000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@Coordination add-on elected %@ as primary resident by local mesh, but we're not the primary resident so waiting for its cloud push", (uint8_t *)&v56, 0x16u);
  }
LABEL_20:
}

- (int64_t)atHomeLevel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  int64_t v3 = [WeakRetained atHomeLevel];

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isOwnerUser
{
  v2 = [(HMDResidentDeviceManagerLegacy *)self home];
  char v3 = [v2 isOwnerUser];

  return v3;
}

- (BOOL)isResidentEnabled
{
  v2 = [(HMDResidentDeviceManagerLegacy *)self ourSelf];
  char v3 = [v2 isEnabled];

  return v3;
}

- (void)_removeResidentDeviceWithModel:(id)a3 message:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v7 transactionResult];
  uint64_t v47 = v46 = self;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  char v8 = [(HMDResidentDeviceManagerLegacy *)self residentDevices];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v51;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v51 != v11) {
        objc_enumerationMutation(v8);
      }
      long long v13 = *(void **)(*((void *)&v50 + 1) + 8 * v12);
      id v14 = [v6 uuid];
      char v15 = [v13 identifier];
      char v16 = [v14 isEqual:v15];

      if (v16) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v50 objects:v60 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v17 = v13;

    if (!v17) {
      goto LABEL_13;
    }
    uint64_t v18 = v7;
    v19 = [v7 transactionResult];
    BOOL v20 = [v19 source] == 2 || objc_msgSend(v19, "source") == 3;
    v30 = (void *)v47;
    v31 = [(HMDResidentDeviceManagerLegacy *)v46 dataSource];
    v32 = [v31 appleAccountManager];
    v33 = [v32 device];

    v34 = [v17 device];
    LODWORD(v32) = [v34 isEqual:v33];

    if (v32 && v20)
    {
      v45 = [v17 modelObjectWithChangeType:1 version:4];
      v35 = (void *)MEMORY[0x1D9452090]();
      v36 = v46;
      v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = HMFGetLogIdentifier();
        v39 = [v17 device];
        *(_DWORD *)buf = 138543618;
        v55 = v38;
        __int16 v56 = 2112;
        v57 = v39;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Resident device was removed by another device, adding back - %@", buf, 0x16u);
      }
      v40 = [(HMDResidentDeviceManagerLegacy *)v36 home];
      v41 = [v40 backingStore];
      v42 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      v43 = [v41 transaction:@"residentAddedPushback" options:v42];

      [v43 add:v45];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __73__HMDResidentDeviceManagerLegacy__removeResidentDeviceWithModel_message___block_invoke;
      v48[3] = &unk_1E6A196E0;
      v48[4] = v36;
      id v49 = v45;
      id v44 = v45;
      [v43 save:v48];

      v30 = (void *)v47;
    }
    else
    {
      [(HMDResidentDeviceManagerLegacy *)v46 _removeResidentDevice:v17];
    }
    [v30 markChanged];
    [v18 respondWithPayload:0];

    goto LABEL_25;
  }
LABEL_9:

LABEL_13:
  BOOL v21 = (void *)MEMORY[0x1D9452090]();
  v22 = HMFGetOSLogHandle();
  uint64_t v18 = v7;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = HMFGetLogIdentifier();
    v24 = [v6 uuid];
    v25 = [v24 UUIDString];
    v26 = [(HMDResidentDeviceManagerLegacy *)v46 home];
    v27 = [v26 uuid];
    v28 = [v27 UUIDString];
    *(_DWORD *)buf = 138543874;
    v55 = v23;
    __int16 v56 = 2114;
    v57 = v25;
    __int16 v58 = 2114;
    id v59 = v28;
    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove resident device %{public}@ for home %{public}@", buf, 0x20u);
  }
  v29 = [v18 responseHandler];

  v30 = (void *)v47;
  if (v29)
  {
    id v17 = [v18 responseHandler];
    v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    (*((void (**)(id, void *, void))v17 + 2))(v17, v19, 0);
LABEL_25:
  }
}

void __73__HMDResidentDeviceManagerLegacy__removeResidentDeviceWithModel_message___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) home];
  [v2 saveWithReason:@"residentAddedPushback" information:0 postSyncNotification:0 objectChange:*(void *)(a1 + 40) != 0];
}

- (BOOL)_createResidentDeviceWithModel:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDResidentDeviceManagerLegacy *)self dataSource];
  id v6 = [v5 createResidentDeviceWithModel:v4];

  if (v6)
  {
    id v7 = [(HMDResidentDeviceManagerLegacy *)self home];
    [v6 configureWithHome:v7];

    [(HMDResidentDeviceManagerLegacy *)self _addResidentDevice:v6];
  }
  else
  {
    char v8 = (void *)MEMORY[0x1D9452090]();
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = [v4 uuid];
      uint64_t v12 = [v11 UUIDString];
      long long v13 = [(HMDResidentDeviceManagerLegacy *)self home];
      id v14 = [v13 uuid];
      char v15 = [v14 UUIDString];
      int v17 = 138543874;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      BOOL v20 = v12;
      __int16 v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to add resident device %{public}@ for home %{public}@", (uint8_t *)&v17, 0x20u);
    }
  }

  return v6 != 0;
}

- (void)updatePrimaryResidentWithUUID:(id)a3 actions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(HMDResidentDeviceManagerLegacy *)self primaryResidentUUID];
  if ((HMFEqualObjects() & 1) == 0)
  {
    [v7 markChanged];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__HMDResidentDeviceManagerLegacy_updatePrimaryResidentWithUUID_actions___block_invoke;
    block[3] = &unk_1E6A19668;
    block[4] = self;
    id v11 = v7;
    id v12 = v6;
    dispatch_async(queue, block);
  }
}

void __72__HMDResidentDeviceManagerLegacy_updatePrimaryResidentWithUUID_actions___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _teardownSessionWithPrimaryResidentDevice];
  BOOL v2 = [*(id *)(a1 + 40) source] == 2 || objc_msgSend(*(id *)(a1 + 40), "source") == 3;
  char v3 = *(void **)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  id v5 = v3;
  id v6 = v5;
  if (v4)
  {
    BOOL v24 = v2;
    os_unfair_lock_lock_with_options();
    id v7 = *((id *)v4 + 7);
    int v25 = [v7 isEqual:v6];
    if (v25)
    {
      char v8 = 0;
    }
    else
    {
      objc_storeStrong((id *)v4 + 7, v3);
      uint64_t v9 = (void *)*((void *)v4 + 3);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = ____HMDResidentDeviceManagerUpdatePrimaryResidentUUID_block_invoke;
      v30[3] = &unk_1E6A0CD08;
      id v31 = v7;
      uint64_t v10 = [v9 objectsPassingTest:v30];
      char v8 = [v10 anyObject];
    }
    id v11 = (void *)*((void *)v4 + 3);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = ____HMDResidentDeviceManagerUpdatePrimaryResidentUUID_block_invoke_2;
    v28[3] = &unk_1E6A0CD08;
    id v23 = v6;
    id v29 = v23;
    id v12 = [v11 objectsPassingTest:v28];
    long long v13 = [v12 anyObject];

    os_unfair_lock_unlock((os_unfair_lock_t)v4 + 2);
    id v14 = [v4 legacyElection];
    if (!v14)
    {
      id v14 = [v4 localNetworkElection];
    }
    char v15 = (void *)MEMORY[0x1D9452090]([v14 primaryResidentChanged:v13 previousResidentDevice:v8]);
    id v16 = v4;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      __int16 v19 = HMFBooleanToString();
      *(_DWORD *)buf = 138544130;
      v33 = v18;
      __int16 v34 = 2112;
      v35 = v19;
      __int16 v36 = 2112;
      v37 = v8;
      __int16 v38 = 2112;
      v39 = v13;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Primary resident changed (from cloud: %@): %@ -> %@", buf, 0x2Au);
    }
    if ((v25 & 1) == 0)
    {
      if (v8) {
        [v16 notifyClientsOfUpdatedResidentDevice:v8];
      }
      [v16 notifyUpdatedPrimaryResident:v13];
      BOOL v20 = [v16 home];
      __int16 v21 = [v20 backingStore];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = ____HMDResidentDeviceManagerUpdatePrimaryResidentUUID_block_invoke_486;
      v26[3] = &unk_1E6A197F0;
      id v27 = v16;
      [v21 submitBlock:v26];
    }
    if (((v25 | !v24) & 1) == 0)
    {
      v22 = [*(id *)(a1 + 32) legacyElection];
      [v22 confirmPrimaryResident];
    }
  }
  else
  {
  }
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v11;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  if (v8)
  {
    [(HMDResidentDeviceManagerLegacy *)self _removeResidentDeviceWithModel:v8 message:v6];
  }
  else
  {
    uint64_t v9 = [v6 responseHandler];

    uint64_t v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);

    id v6 = (id)v9;
  }
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;
  id v12 = v11;
  if (v11)
  {
    long long v13 = [v11 uuid];
    id v14 = [(HMDResidentDeviceManagerLegacy *)self residentWithUUID:v13];

    if (v14)
    {
      [v14 transactionObjectUpdated:v17 newValues:v12 message:v9];
    }
    else
    {
      char v15 = [v9 transactionResult];
      if ([(HMDResidentDeviceManagerLegacy *)self _createResidentDeviceWithModel:v12])
      {
        [v15 markChanged];
        [v9 respondWithPayload:0];
      }
      else
      {
        id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        [v9 respondWithError:v16];
      }
      id v14 = 0;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v9 respondWithError:v14];
  }
}

- (void)_verifyCurrentResidentDevice
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (!self->_verifyCurrentResidentDevice) {
    return;
  }
  char v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v44 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Verifying resident device objects", buf, 0xCu);
  }
  self->_verifyCurrentResidentDevice = 0;
  v33 = [(HMDResidentDeviceManagerLegacy *)v4 home];
  id v7 = [v33 backingStore];
  id v8 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  __int16 v34 = [v7 transaction:@"Remove Invalid Resident" options:v8];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v9 = [(HMDResidentDeviceManagerLegacy *)v4 residentDevices];
  uint64_t v37 = [v9 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (!v37)
  {

    goto LABEL_25;
  }
  char v11 = 0;
  uint64_t v12 = *(void *)v40;
  *(void *)&long long v10 = 138543874;
  long long v32 = v10;
  uint64_t v35 = *(void *)v40;
  __int16 v36 = v4;
  do
  {
    for (uint64_t i = 0; i != v37; ++i)
    {
      if (*(void *)v40 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      char v15 = objc_msgSend(v14, "device", v32);
      id v16 = [(HMDResidentDeviceManagerLegacy *)v4 dataSource];
      id v17 = [v16 appleAccountManager];
      uint64_t v18 = [v17 device];

      if ([v15 isCurrentDevice])
      {
        __int16 v19 = v9;
        if ([v15 isEqual:v18])
        {
          uint64_t v20 = [v33 uuid];
          __int16 v21 = [v18 identifier];
          v22 = +[HMDResidentDevice deriveUUIDFromHomeUUID:v20 deviceUUID:v21];

          id v23 = [v14 identifier];
          LOBYTE(v20) = [v23 isEqual:v22];

          if ((v20 & 1) == 0)
          {
            BOOL v24 = (void *)MEMORY[0x1D9452090]();
            int v25 = v36;
            v26 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              id v27 = HMFGetLogIdentifier();
              *(_DWORD *)buf = v32;
              id v44 = v27;
              __int16 v45 = 2112;
              v46 = v14;
              __int16 v47 = 2114;
              v48 = v22;
              _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Current UUID of %@ does not match expected %{public}@, removing current model", buf, 0x20u);
            }

            goto LABEL_18;
          }
        }
        else
        {
          v28 = (void *)MEMORY[0x1D9452090]();
          id v29 = v4;
          v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            id v31 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v44 = v31;
            __int16 v45 = 2112;
            v46 = v14;
            _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Removing HMDResidentDevice referencing stale currentDevice %@", buf, 0x16u);
          }
LABEL_18:
          v22 = [v14 modelObjectWithChangeType:3 version:4];
          [v34 add:v22];
          char v11 = 1;
        }
        id v9 = v19;

        uint64_t v12 = v35;
        id v4 = v36;
      }
    }
    uint64_t v37 = [v9 countByEnumeratingWithState:&v39 objects:v49 count:16];
  }
  while (v37);

  if (v11)
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __62__HMDResidentDeviceManagerLegacy__verifyCurrentResidentDevice__block_invoke;
    v38[3] = &unk_1E6A197F0;
    v38[4] = v4;
    [v34 run:v38];
  }
LABEL_25:
}

void __62__HMDResidentDeviceManagerLegacy__verifyCurrentResidentDevice__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) home];
  v1 = [v2 homeManager];
  [v1 verifyCurrentDeviceResidentStatus];
}

- (void)_handleCloudZoneReadyNotification:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = objc_msgSend(v5, "hmf_UUIDForKey:", @"HMDCR.id");
  objc_msgSend(v5, "hmf_BOOLForKey:", @"HMDCR.stc");
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    long long v10 = HMFGetLogIdentifier();
    char v11 = [v6 UUIDString];
    uint64_t v12 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    uint64_t v18 = v10;
    __int16 v19 = 2114;
    uint64_t v20 = v11;
    __int16 v21 = 2112;
    v22 = v12;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Cloud manager completed initial fetch for zone %{public}@, didServerTokenChange: %@", buf, 0x20u);
  }
  queue = v8->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__HMDResidentDeviceManagerLegacy__handleCloudZoneReadyNotification___block_invoke;
  v15[3] = &unk_1E6A197C8;
  v15[4] = v8;
  id v16 = v6;
  id v14 = v6;
  dispatch_async(queue, v15);
}

void __68__HMDResidentDeviceManagerLegacy__handleCloudZoneReadyNotification___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) home];
  char v3 = v2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = [v2 zoneID];
    int v6 = [v4 isEqual:v5];

    if (v6)
    {
      [*(id *)(a1 + 32) setFirstHomeZoneFetch:1];
      if ([*(id *)(a1 + 32) hasFirstLegacyFetch]
        && [*(id *)(a1 + 32) hasFirstHomeManagerZoneFetch])
      {
        char v7 = [*(id *)(a1 + 32) hasFirstHomeZoneFetch];
      }
      else
      {
        char v7 = 0;
      }
      long long v10 = [v3 backingStore];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __68__HMDResidentDeviceManagerLegacy__handleCloudZoneReadyNotification___block_invoke_2;
      v19[3] = &unk_1E6A197F0;
      v19[4] = *(void *)(a1 + 32);
      [v10 submitBlock:v19];

      if ((v7 & 1) == 0) {
        goto LABEL_21;
      }
    }
    else
    {
      id v8 = *(void **)(a1 + 40);
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"1411CE6C-B4DE-4622-A49D-F66FE296D6B5"];
      LODWORD(v8) = [v8 isEqual:v9];

      if (!v8) {
        goto LABEL_21;
      }
      [*(id *)(a1 + 32) setFirstHomeManagerZoneFetch:1];
      if (![*(id *)(a1 + 32) hasFirstLegacyFetch]
        || ![*(id *)(a1 + 32) hasFirstHomeManagerZoneFetch]
        || ![*(id *)(a1 + 32) hasFirstHomeZoneFetch])
      {
        goto LABEL_21;
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) setFirstLegacyFetch:1];
    if (![*(id *)(a1 + 32) hasFirstLegacyFetch]
      || ![*(id *)(a1 + 32) hasFirstHomeManagerZoneFetch]
      || ([*(id *)(a1 + 32) hasFirstHomeZoneFetch] & 1) == 0)
    {
      goto LABEL_21;
    }
  }
  char v11 = [*(id *)(a1 + 32) dataSource];
  int v12 = [v11 isResidentCapable];

  if (v12)
  {
    long long v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = *(id *)(a1 + 32);
    char v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v21 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Confirming primary resident after first fetch", buf, 0xCu);
    }
    id v17 = [v3 backingStore];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__HMDResidentDeviceManagerLegacy__handleCloudZoneReadyNotification___block_invoke_219;
    v18[3] = &unk_1E6A197F0;
    v18[4] = *(void *)(a1 + 32);
    [v17 submitBlock:v18];
  }
LABEL_21:
}

void __68__HMDResidentDeviceManagerLegacy__handleCloudZoneReadyNotification___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cloudReadyPromise];
  [v1 fulfillWithNoValue];
}

void __68__HMDResidentDeviceManagerLegacy__handleCloudZoneReadyNotification___block_invoke_219(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HMDResidentDeviceManagerLegacy__handleCloudZoneReadyNotification___block_invoke_2_220;
  block[3] = &unk_1E6A19B30;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __68__HMDResidentDeviceManagerLegacy__handleCloudZoneReadyNotification___block_invoke_2_220(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) legacyElection];
  [v2 confirmPrimaryResident];

  char v3 = *(void **)(a1 + 32);
  return [v3 _verifyCurrentResidentDevice];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentDeviceManagerLegacy *)self home];
  [v4 encodeConditionalObject:v5 forKey:@"HM.home"];

  int v6 = [(HMDResidentDeviceManagerLegacy *)self primaryResidentDevice];
  [v4 encodeConditionalObject:v6 forKey:@"HM.currentResidentDevice"];

  char v7 = [(HMDResidentDeviceManagerLegacy *)self primaryResidentUUID];
  [v4 encodeConditionalObject:v7 forKey:@"HM.currentResidentDeviceUUID"];

  id v8 = [(HMDResidentDeviceManagerLegacy *)self residentDevices];
  [v4 encodeObject:v8 forKey:@"HM.residentDevices"];
}

- (HMDResidentDeviceManagerLegacy)initWithCoder:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDResidentDeviceManagerLegacy *)self init];
  if (v5)
  {
    int v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.home"];
    objc_storeWeak((id *)&v5->_home, v6);

    char v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.currentResidentDevice"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.currentResidentDeviceUUID"];
    primaryResidentUUID = v5->_primaryResidentUUID;
    v5->_primaryResidentUUID = (NSUUID *)v8;

    if (v5->_primaryResidentUUID) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v7 == 0;
    }
    if (!v10)
    {
      uint64_t v11 = [v7 identifier];
      int v12 = v5->_primaryResidentUUID;
      v5->_primaryResidentUUID = (NSUUID *)v11;
    }
    long long v13 = (void *)MEMORY[0x1E4F1CAD0];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    char v15 = [v13 setWithArray:v14];
    id v16 = [v4 decodeObjectOfClasses:v15 forKey:@"HM.residentDevices"];

    uint64_t v17 = [MEMORY[0x1E4F1CA80] setWithArray:v16];
    residentDevices = v5->_residentDevices;
    v5->_residentDevices = (NSMutableSet *)v17;

    v5->_verifyCurrentResidentDevice = [(NSMutableSet *)v5->_residentDevices count] != 0;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v19 = v16;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v19);
          }
          if (objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "isEnabled", (void)v25))
          {
            v5->_residentAvailable = 1;
            goto LABEL_17;
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  return v5;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return self->_queue;
}

- (NSUUID)messageTargetUUID
{
  id v2 = [(HMDResidentDeviceManagerLegacy *)self home];
  char v3 = [v2 uuid];

  return (NSUUID *)v3;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (id)dumpState
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(HMDResidentDeviceManagerLegacy *)self legacyElection];

  if (v4)
  {
    id v5 = [(HMDResidentDeviceManagerLegacy *)self legacyElection];
    int v6 = [v5 dumpState];
    [v3 setObject:v6 forKeyedSubscript:@"Election.Legacy"];
  }
  char v7 = [(HMDResidentDeviceManagerLegacy *)self localNetworkElection];

  if (v7)
  {
    uint64_t v8 = [(HMDResidentDeviceManagerLegacy *)self localNetworkElection];
    id v9 = [v8 dumpState];
    [v3 setObject:v9 forKeyedSubscript:@"Election.Coordination"];
  }
  BOOL v10 = NSString;
  v33 = [(HMDResidentDeviceManagerLegacy *)self home];
  long long v32 = [v33 uuid];
  uint64_t v11 = [v32 UUIDString];
  [(HMDResidentDeviceManagerLegacy *)self primaryResidentDevice];
  long long v13 = v12 = v3;
  id v14 = [v13 device];
  char v15 = [v14 identifier];
  id v16 = [v15 UUIDString];
  [(HMDResidentDeviceManagerLegacy *)self isResidentAvailable];
  uint64_t v17 = HMFBooleanToString();
  [(HMDResidentDeviceManagerLegacy *)self isResidentSupported];
  uint64_t v18 = HMFBooleanToString();
  id v19 = [v10 stringWithFormat:@"home: %@, primaryResidentDevice: %@ isResidentAvailable: %@, isResidentSupported: %@", v11, v16, v17, v18];
  __int16 v34 = v12;
  [v12 setObject:v19 forKeyedSubscript:@"State"];

  uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v21 = [(HMDResidentDeviceManagerLegacy *)self residentDevices];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = [*(id *)(*((void *)&v35 + 1) + 8 * i) dumpState];
        [v20 addObject:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v23);
  }

  [v34 setObject:v20 forKeyedSubscript:@"Residents"];
  long long v27 = [(HMDResidentDeviceManagerLegacy *)self messageDispatcher];
  long long v28 = [v27 secureRemoteTransport];
  id v29 = [v28 deviceMonitor];
  v30 = [v29 dumpState];
  [v34 setObject:v30 forKeyedSubscript:@"Remote Device Monitor"];

  return v34;
}

- (NSString)description
{
  return (NSString *)[(HMDResidentDeviceManagerLegacy *)self descriptionWithPointer:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(HMDResidentDeviceManagerLegacy *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = NSString;
  int v6 = [(id)objc_opt_class() shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    char v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v7 = &stru_1F2C9F1A8;
  }
  uint64_t v8 = [(HMDResidentDeviceManagerLegacy *)self residentDevices];
  id v9 = [v5 stringWithFormat:@"<%@%@, Resident Devices = %@", v6, v7, v8];

  if (v3) {
  return v9;
  }
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMDResidentDeviceManagerLegacy *)self messageTargetUUID];
  int v6 = [v5 UUIDString];
  char v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (void)_updateReachability:(BOOL)a3 forResidentDevice:(id)a4
{
  BOOL v4 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  char v7 = [(HMDResidentDeviceManagerLegacy *)self queue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [(HMDResidentDeviceManagerLegacy *)self primaryResidentDevice];
  id v9 = [v6 device];
  int v10 = [v9 isCurrentDevice];

  if (v10)
  {
    if (v4 && ([v8 isReachable] & 1) == 0)
    {
      uint64_t v11 = [v8 device];
      char v12 = [v11 isCurrentDevice];

      if ((v12 & 1) == 0) {
        [(HMDResidentDeviceManagerLegacy *)self _electResidentDevice:1];
      }
    }
  }
  else if ([v6 isReachable] != v4)
  {
    [v6 setReachable:v4];
    int v13 = [v8 isEqual:v6];
    if (v4)
    {
      if (v13)
      {
        id v14 = (void *)MEMORY[0x1D9452090]();
        char v15 = self;
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = HMFGetLogIdentifier();
          int v23 = 138543362;
          uint64_t v24 = v17;
          _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Setting up session with the primary resident and subscribing for notifications", (uint8_t *)&v23, 0xCu);
        }
        [(HMDResidentDeviceManagerLegacy *)v15 _setupSessionWithPrimaryResidentDevice];
        uint64_t v18 = [(HMDResidentDeviceManagerLegacy *)v15 home];
        [v18 subscribeForNotificationsFromRemoteGateway];
      }
    }
    else if (v13)
    {
      [(HMDResidentDeviceManagerLegacy *)self _teardownSessionWithPrimaryResidentDevice];
      id v19 = [(HMDResidentDeviceManagerLegacy *)self messageDispatcher];
      uint64_t v20 = [v19 secureRemoteTransport];
      uint64_t v21 = [v20 deviceMonitor];
      int v22 = [v21 isReachable];

      if (v22) {
        [(HMDResidentDeviceManagerLegacy *)self _electResidentDevice:1];
      }
    }
    [(HMDResidentDeviceManagerLegacy *)self notifyClientsOfUpdatedResidentDevice:v6];
  }
}

- (void)handleResidentDeviceIsNotReachable:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__HMDResidentDeviceManagerLegacy_handleResidentDeviceIsNotReachable___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __69__HMDResidentDeviceManagerLegacy_handleResidentDeviceIsNotReachable___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) residentDeviceForDevice:v4];
    if (v5)
    {
      id v6 = (void *)MEMORY[0x1D9452090]();
      id v7 = *(id *)(a1 + 40);
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = HMFGetLogIdentifier();
        int v10 = 138543618;
        uint64_t v11 = v9;
        __int16 v12 = 2112;
        int v13 = v5;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received notification that resident device is not reachable: %@", (uint8_t *)&v10, 0x16u);
      }
      [*(id *)(a1 + 40) _updateReachability:0 forResidentDevice:v5];
    }
  }
}

- (void)handleResidentDeviceIsReachable:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HMDResidentDeviceManagerLegacy_handleResidentDeviceIsReachable___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __66__HMDResidentDeviceManagerLegacy_handleResidentDeviceIsReachable___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) residentDeviceForDevice:v4];
    if (v5)
    {
      id v6 = (void *)MEMORY[0x1D9452090]();
      id v7 = *(id *)(a1 + 40);
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = HMFGetLogIdentifier();
        int v10 = 138543618;
        uint64_t v11 = v9;
        __int16 v12 = 2112;
        int v13 = v5;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received notification that resident device is reachable: %@", (uint8_t *)&v10, 0x16u);
      }
      [*(id *)(a1 + 40) _updateReachability:1 forResidentDevice:v5];
    }
  }
}

- (void)_electResidentDevice:(unint64_t)a3
{
  id v4 = [(HMDResidentDeviceManagerLegacy *)self legacyElection];
  [v4 performElectionWithReason:a3];
}

- (void)electResidentDevice:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__HMDResidentDeviceManagerLegacy_electResidentDevice___block_invoke;
  v4[3] = &unk_1E6A189D0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __54__HMDResidentDeviceManagerLegacy_electResidentDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _electResidentDevice:*(void *)(a1 + 40)];
}

- (void)__currentDeviceUpdated:(id)a3 completion:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [(HMDResidentDeviceManagerLegacy *)self ourSelf];
  if (v7)
  {
    id v8 = [(HMDResidentDeviceManagerLegacy *)self home];
    id v9 = [v8 backingStore];
    int v10 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    uint64_t v11 = [v9 transaction:@"residentUpdated" options:v10];

    __int16 v12 = [HMDResidentDeviceModel alloc];
    int v13 = [v7 identifier];
    uint64_t v14 = [v8 uuid];
    char v15 = [(HMDBackingStoreModelObject *)v12 initWithObjectChangeType:2 uuid:v13 parentUUID:v14];

    id v16 = [v18 identifier];
    uint64_t v17 = [v16 UUIDString];
    [(HMDResidentDeviceModel *)v15 setDeviceUUID:v17];

    [(HMDResidentDeviceModel *)v15 setDevice:v18];
    [v11 add:v15];
    [v11 run:v6];
  }
}

- (void)handleDeviceUpdated:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__HMDResidentDeviceManagerLegacy_handleDeviceUpdated___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __54__HMDResidentDeviceManagerLegacy_handleDeviceUpdated___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    if ([v4 isCurrentDevice]) {
      objc_msgSend(*(id *)(a1 + 40), "__currentDeviceUpdated:completion:", v4, 0);
    }
    id v5 = [*(id *)(a1 + 40) ourSelf];
    id v6 = v5;
    if (v5 && [v5 isEnabled])
    {
      [*(id *)(a1 + 40) _startElectionAddOn];
    }
    else
    {
      id v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = *(id *)(a1 + 40);
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = HMFGetLogIdentifier();
        int v11 = 138543362;
        __int16 v12 = v10;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Resident device is nil or not enabled", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)handleCurrentDeviceChanged:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HMDResidentDeviceManagerLegacy_handleCurrentDeviceChanged___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __61__HMDResidentDeviceManagerLegacy_handleCurrentDeviceChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  BOOL v3 = [v2 objectForKeyedSubscript:@"HMDDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = *(void **)(a1 + 40);
  if (v5)
  {
    int v7 = [v6 isResidentSupported];
    [*(id *)(a1 + 40) setResidentSupported:1];
    id v8 = [v5 capabilities];
    int v9 = [v8 isResidentCapable];

    if (v9)
    {
      if (v7)
      {
        int v10 = [*(id *)(a1 + 40) notificationCenter];
        [v10 addObserver:*(void *)(a1 + 40) selector:sel_handleDeviceUpdated_ name:@"HMDDeviceUpdatedNotification" object:0];
      }
      int v11 = *(void **)(a1 + 40);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __61__HMDResidentDeviceManagerLegacy_handleCurrentDeviceChanged___block_invoke_2;
      v12[3] = &unk_1E6A197F0;
      v12[4] = v11;
      objc_msgSend(v11, "__currentDeviceUpdated:completion:", v5, v12);
    }
  }
  else
  {
    [v6 setResidentSupported:0];
    [*(id *)(a1 + 40) _teardownSessionWithPrimaryResidentDevice];
    [*(id *)(a1 + 40) run];
  }
}

uint64_t __61__HMDResidentDeviceManagerLegacy_handleCurrentDeviceChanged___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) run];
}

- (void)handleHomeUpdatedAccessories:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__HMDResidentDeviceManagerLegacy_handleHomeUpdatedAccessories___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(queue, block);
}

void __63__HMDResidentDeviceManagerLegacy_handleHomeUpdatedAccessories___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) home];
  int v3 = [v2 isOwnerUser];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(v1 + 32);
    id v6 = HMFGetOSLogHandle();
    uint64_t v28 = v1;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v34 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification that accessories changed in home, auditing residents", buf, 0xCu);

      uint64_t v1 = v28;
    }

    id v8 = [*(id *)(v1 + 32) dataSource];
    int v9 = [v8 appleAccountManager];
    int v10 = [v9 account];

    if (v10)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      int v11 = [*(id *)(v1 + 32) residentDevices];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v12)
      {
        uint64_t v14 = v12;
        uint64_t v15 = *(void *)v30;
        *(void *)&long long v13 = 138543618;
        long long v27 = v13;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v30 != v15) {
              objc_enumerationMutation(v11);
            }
            uint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            id v18 = objc_msgSend(v17, "device", v27);
            char v19 = [v18 isCurrentDevice];

            if ((v19 & 1) == 0)
            {
              uint64_t v20 = [v10 devices];
              uint64_t v21 = [v17 device];
              char v22 = [v20 containsObject:v21];

              if ((v22 & 1) == 0)
              {
                int v23 = (void *)MEMORY[0x1D9452090]();
                id v24 = *(id *)(v1 + 32);
                uint64_t v25 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  long long v26 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = v27;
                  __int16 v34 = v26;
                  __int16 v35 = 2112;
                  long long v36 = v17;
                  _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Removing stale resident: %@", buf, 0x16u);

                  uint64_t v1 = v28;
                }

                [*(id *)(v1 + 32) removeResidentDevice:v17];
              }
            }
          }
          uint64_t v14 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v14);
      }
    }
  }
}

- (void)_handleResidentDeviceUpdateEnabled:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kIdentifierKey"];
  if (v5)
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v6 = [(HMDResidentDeviceManagerLegacy *)self residentDevices];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v55;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v55 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v54 + 1) + 8 * v10);
        uint64_t v12 = [v11 identifier];
        char v13 = [v12 isEqual:v5];

        if (v13) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v54 objects:v58 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v14 = v11;

      if (!v14) {
        goto LABEL_16;
      }
      char v53 = 0;
      uint64_t v15 = [v4 messagePayload];
      uint64_t v16 = objc_msgSend(v15, "hmf_BOOLForKey:isPresent:", @"kEnabledKey", &v53);

      if (v53)
      {
        uint64_t v17 = [(HMDResidentDeviceManagerLegacy *)self home];
        id v18 = [v17 backingStore];
        char v19 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
        uint64_t v20 = [v18 transaction:@"residentDeviceUpdateEnabled" options:v19];

        uint64_t v21 = [HMDResidentDeviceModel alloc];
        char v22 = [v14 identifier];
        int v23 = [v17 uuid];
        id v24 = [(HMDBackingStoreModelObject *)v21 initWithObjectChangeType:2 uuid:v22 parentUUID:v23];

        uint64_t v25 = [NSNumber numberWithBool:v16];
        [(HMDResidentDeviceModel *)v24 setEnabled:v25];

        [v20 add:v24 withMessage:v4];
        long long v26 = [(HMDResidentDeviceManagerLegacy *)self primaryResidentUUID];
        LODWORD(v25) = [v5 isEqual:v26];

        if (v25)
        {
          long long v27 = [HMDHomeModel alloc];
          uint64_t v28 = [v17 uuid];
          long long v29 = [v17 homeManager];
          long long v30 = [v29 uuid];
          long long v31 = [(HMDBackingStoreModelObject *)v27 initWithObjectChangeType:2 uuid:v28 parentUUID:v30];

          [(HMDHomeModel *)v31 setPrimaryResidentUUID:0];
          [v20 add:v31 withMessage:0];
        }
        [v20 run];

        goto LABEL_29;
      }
      __int16 v47 = (void *)MEMORY[0x1D9452090]();
      v48 = self;
      id v49 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        uint64_t v50 = HMFGetLogIdentifier();
        long long v51 = [v4 messagePayload];
        int buf = 138543618;
        __int16 v60 = v50;
        __int16 v61 = 2112;
        uint64_t v62 = v51;
        _os_log_impl(&dword_1D49D5000, v49, OS_LOG_TYPE_INFO, "%{public}@Invalid message paylaod, missing enabled state: %@", (uint8_t *)&buf, 0x16u);
      }
      long long v52 = [v4 responseHandler];

      if (v52)
      {
        uint64_t v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
        uint64_t v20 = [v4 responseHandler];
        ((void (**)(void, void *, void))v20)[2](v20, v17, 0);
LABEL_29:

        goto LABEL_30;
      }
      goto LABEL_30;
    }
LABEL_10:

LABEL_16:
    long long v32 = (void *)MEMORY[0x1D9452090]();
    v33 = self;
    __int16 v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      __int16 v35 = HMFGetLogIdentifier();
      long long v36 = [v5 UUIDString];
      int buf = 138543618;
      __int16 v60 = v35;
      __int16 v61 = 2112;
      uint64_t v62 = v36;
      _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Failed to find resident device with identifier: %@", (uint8_t *)&buf, 0x16u);
    }
    long long v37 = [v4 responseHandler];

    if (v37)
    {
      uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = 2;
LABEL_24:
      id v14 = [v38 hmErrorWithCode:v39];
      v46 = [v4 responseHandler];
      ((void (**)(void, id, void))v46)[2](v46, v14, 0);

LABEL_30:
    }
  }
  else
  {
    uint64_t v40 = (void *)MEMORY[0x1D9452090]();
    long long v41 = self;
    long long v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = HMFGetLogIdentifier();
      id v44 = [v4 messagePayload];
      int buf = 138543618;
      __int16 v60 = v43;
      __int16 v61 = 2112;
      uint64_t v62 = v44;
      _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Invalid message paylaod, missing resident device identifier: %@", (uint8_t *)&buf, 0x16u);
    }
    __int16 v45 = [v4 responseHandler];

    if (v45)
    {
      uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = 20;
      goto LABEL_24;
    }
  }
}

- (void)_sendResidentDeviceNotificationWithName:(id)a3 forResidentDevice:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  [v11 setObject:v7 forKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

  uint64_t v9 = [(HMDResidentDeviceManagerLegacy *)self home];
  uint64_t v10 = [v9 uuid];
  [v11 setObject:v10 forKeyedSubscript:@"HMDResidentDeviceManagerHomeUUIDNotificationKey"];

  logAndPostNotification(v8, self, v11);
}

- (void)notifyUpdatedPrimaryResident:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HMDResidentDeviceManagerLegacy_notifyUpdatedPrimaryResident___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __63__HMDResidentDeviceManagerLegacy_notifyUpdatedPrimaryResident___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 residentDeviceManager:*(void *)(a1 + 32) didUpdatePrimaryResident:*(void *)(a1 + 40) previousPrimaryResident:0];

  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 _sendResidentDeviceNotificationWithName:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" forResidentDevice:v4];
}

- (void)notifyClientsOfUpdatedResidentDevice:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__HMDResidentDeviceManagerLegacy_notifyClientsOfUpdatedResidentDevice___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __71__HMDResidentDeviceManagerLegacy_notifyClientsOfUpdatedResidentDevice___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v11 = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of updated resident: %@", (uint8_t *)&v11, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) delegate];
  [v7 residentDeviceManagerDidUpdateResidents:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) _sendResidentDeviceNotificationWithName:@"HMDResidentDeviceManagerUpdateResidentNotification" forResidentDevice:*(void *)(a1 + 40)];
  id v8 = [*(id *)(a1 + 32) home];
  uint64_t v9 = [v8 homeManager];
  uint64_t v10 = [*(id *)(a1 + 40) identifier];
  [v9 updateGenerationCounterWithReason:@"ResidentDeviceUpdated" sourceUUID:v10 shouldNotifyClients:1];

  [v8 reEvaluateHomeHubState];
  [v8 evaluateResidentUpdate];
}

- (void)notifyResidentAvailable:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__HMDResidentDeviceManagerLegacy_notifyResidentAvailable___block_invoke;
  v4[3] = &unk_1E6A19B58;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

void __58__HMDResidentDeviceManagerLegacy_notifyResidentAvailable___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 residentDeviceManager:*(void *)(a1 + 32) didUpdateResidentAvailable:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setResidentSupported:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_residentSupported = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isResidentSupported
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_residentSupported;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setResidentAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_residentAvailable == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_residentAvailable = v3;
    os_unfair_lock_unlock(p_lock);
    uint64_t v6 = [(HMDResidentDeviceManagerLegacy *)self notifyResidentAvailable:v3];
    if (v3)
    {
      id v7 = (void *)MEMORY[0x1D9452090](v6);
      id v8 = self;
      uint64_t v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        *(_DWORD *)int buf = 138543362;
        uint64_t v14 = v10;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Resident availability became TRUE now, notifying updated primary resident", buf, 0xCu);
      }
      queue = v8->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__HMDResidentDeviceManagerLegacy_setResidentAvailable___block_invoke;
      block[3] = &unk_1E6A19B30;
      block[4] = v8;
      dispatch_async(queue, block);
    }
  }
}

void __55__HMDResidentDeviceManagerLegacy_setResidentAvailable___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) primaryResidentUUID];

  if (v2)
  {
    BOOL v3 = *(void **)(a1 + 32);
    id v4 = [v3 primaryResidentUUID];
    BOOL v5 = [v3 residentWithUUID:v4];

    if (v5)
    {
      [*(id *)(a1 + 32) notifyUpdatedPrimaryResident:v5];
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = *(id *)(a1 + 32);
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = HMFGetLogIdentifier();
        uint64_t v14 = [*(id *)(a1 + 32) primaryResidentUUID];
        int v15 = 138543618;
        uint64_t v16 = v13;
        __int16 v17 = 2112;
        id v18 = v14;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Primary resident UUID is set to %@, cannot find the primary resident device", (uint8_t *)&v15, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Primary resident UUID is not set, cannot find the primary resident device", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_updateResidentAvailability
{
  BOOL v3 = [(HMDResidentDeviceManagerLegacy *)self availableResidentDevices];
  BOOL v4 = [v3 count] != 0;

  [(HMDResidentDeviceManagerLegacy *)self setResidentAvailable:v4];
  BOOL v5 = [(HMDResidentDeviceManagerLegacy *)self ourSelf];
  id v6 = v5;
  id v9 = v5;
  if (v5 && (v7 = [v5 isEnabled], id v6 = v9, v7))
  {
    [(HMDResidentDeviceManagerLegacy *)self _startElectionAddOn];
  }
  else
  {
    id v8 = [NSString stringWithFormat:@"No longer a resident: %@", v6];
    [(HMDResidentDeviceManagerLegacy *)self _stopLegacyElectionWithReason:v8];
    [(HMDResidentDeviceManagerLegacy *)self _stopCoordinationElectionWithReason:v8];
  }
}

- (void)updateResidentAvailability
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HMDResidentDeviceManagerLegacy_updateResidentAvailability__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __60__HMDResidentDeviceManagerLegacy_updateResidentAvailability__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateResidentAvailability];
}

- (void)_removeResidentDevice:(id)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v22 = [(HMDResidentDeviceManagerLegacy *)self home];
  id v8 = [v22 backingStore];
  id v9 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  uint64_t v10 = [v8 transaction:v6 options:v9];

  id v11 = [HMDResidentDeviceModel alloc];
  uint64_t v12 = [v7 identifier];
  __int16 v13 = [v22 uuid];
  uint64_t v14 = [(HMDBackingStoreModelObject *)v11 initWithObjectChangeType:3 uuid:v12 parentUUID:v13];

  [v10 add:v14 withMessage:0];
  int v15 = [v7 identifier];

  uint64_t v16 = [(HMDResidentDeviceManagerLegacy *)self primaryResidentUUID];
  LODWORD(v7) = [v15 isEqual:v16];

  if (v7)
  {
    __int16 v17 = [HMDHomeModel alloc];
    id v18 = [v22 uuid];
    uint64_t v19 = [v22 homeManager];
    uint64_t v20 = [v19 uuid];
    uint64_t v21 = [(HMDBackingStoreModelObject *)v17 initWithObjectChangeType:2 uuid:v18 parentUUID:v20];

    [(HMDHomeModel *)v21 setPrimaryResidentUUID:0];
    [v10 add:v21 withMessage:0];
  }
  [v10 run];
}

- (void)removeResidentDevice:(id)a3
{
}

- (void)_removeResidentDevice:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    if ([(NSMutableSet *)self->_residentDevices containsObject:v4])
    {
      [(NSMutableSet *)self->_residentDevices removeObject:v4];
      os_unfair_lock_unlock(&self->_lock);
      queue = self->_queue;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __56__HMDResidentDeviceManagerLegacy__removeResidentDevice___block_invoke;
      v6[3] = &unk_1E6A197C8;
      v6[4] = self;
      id v7 = v4;
      dispatch_async(queue, v6);
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
  }
}

void __56__HMDResidentDeviceManagerLegacy__removeResidentDevice___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 residentDeviceManagerDidUpdateResidents:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) _sendResidentDeviceNotificationWithName:@"HMDResidentDeviceManagerRemoveResidentNotification" forResidentDevice:*(void *)(a1 + 40)];
  BOOL v3 = [*(id *)(a1 + 32) home];
  [v3 reEvaluateHomeHubState];
  id v4 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 32) _updateResidentAvailability]);
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)int buf = 138543362;
    __int16 v17 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Modifying notification registrations with resident due to resident device removal", buf, 0xCu);
  }
  id v8 = [*(id *)(a1 + 40) device];
  int v15 = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  [v3 disableNotificationsForDevices:v9];

  if ([*(id *)(a1 + 40) isCurrentDevice])
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      *(_DWORD *)int buf = 138543362;
      __int16 v17 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Removed residentDevice is current device, clean up reachability event notification registry if there is any", buf, 0xCu);
    }
    uint64_t v14 = [v3 notificationRegistry];
    [v14 removeAllReachabilityEventNotificationRegistrations];
  }
}

- (void)_addResidentDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  id v5 = [(NSMutableSet *)self->_residentDevices member:v4];
  if (v5)
  {
    [(HMDResidentDeviceManagerLegacy *)self _fixUpRemoteResidentDevice:v4 existingResidentDevice:v5];

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    [(NSMutableSet *)self->_residentDevices addObject:v4];
    os_unfair_lock_unlock(&self->_lock);
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__HMDResidentDeviceManagerLegacy__addResidentDevice___block_invoke;
    v7[3] = &unk_1E6A197C8;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __53__HMDResidentDeviceManagerLegacy__addResidentDevice___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 residentDeviceManagerDidUpdateResidents:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) _sendResidentDeviceNotificationWithName:@"HMDResidentDeviceManagerAddResidentNotification" forResidentDevice:*(void *)(a1 + 40)];
  BOOL v3 = [*(id *)(a1 + 32) home];
  [v3 reEvaluateHomeHubState];
  [*(id *)(a1 + 32) _updateResidentAvailability];
  id v4 = [*(id *)(a1 + 32) primaryResidentUUID];
  id v5 = [*(id *)(a1 + 40) identifier];
  if ([v4 isEqual:v5])
  {

LABEL_5:
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)int buf = 138543362;
      uint64_t v21 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Modifying notification registrations with resident due to resident device addition", buf, 0xCu);
    }
    id v4 = [*(id *)(a1 + 40) device];
    uint64_t v19 = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    [v3 enableNotificationsForDevices:v5];
    goto LABEL_9;
  }
  id v6 = [*(id *)(a1 + 32) primaryResidentDevice];
  id v7 = [v6 device];
  if ([v7 isCurrentDevice])
  {
    int v8 = [*(id *)(a1 + 40) isEnabled];

    if (!v8) {
      goto LABEL_10;
    }
    goto LABEL_5;
  }

LABEL_9:
LABEL_10:
  __int16 v13 = [*(id *)(a1 + 40) device];
  int v14 = [v13 isCurrentDevice];

  if (v14)
  {
    int v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = *(id *)(a1 + 32);
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)int buf = 138543362;
      uint64_t v21 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Adding ourselves as a resident device, starting election", buf, 0xCu);
    }
    [*(id *)(a1 + 32) _electResidentDevice:3];
  }
  else
  {
    [*(id *)(a1 + 32) _run];
  }
}

- (void)_startElectionAddOn
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if ([(HMDResidentDeviceManagerLegacy *)self _shouldEnableCoordinationElection])
  {
    BOOL v3 = [(HMDResidentDeviceManagerLegacy *)self localNetworkElection];

    if (v3)
    {
      id v4 = (void *)MEMORY[0x1D9452090]();
      id v5 = self;
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        id v7 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v7;
        int v8 = "%{public}@Not restarting coordination election because it's already started";
LABEL_8:
        _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&buf, 0xCu);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
    id v10 = (void *)MEMORY[0x1D9452090]([(HMDResidentDeviceManagerLegacy *)self _stopLegacyElectionWithReason:@"starting the coordination election"]);
    id v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Starting coordination election", (uint8_t *)&buf, 0xCu);
    }
    int v14 = [(HMDResidentDeviceManagerLegacy *)v11 dataSource];
    int v15 = [v14 createElectionAddOnWithContext:v11];
    [(HMDResidentDeviceManagerLegacy *)v11 setLocalNetworkElection:v15];

    id v16 = [(HMDResidentDeviceManagerLegacy *)v11 localNetworkElection];
    [v16 setDelegate:v11];

    __int16 v17 = [(HMDResidentDeviceManagerLegacy *)v11 localNetworkElection];
    [v17 registerForMessages];

    if (v11)
    {
      uint64_t v18 = [(HMDResidentDeviceManagerLegacy *)v11 localNetworkElection];

      if (!v18) {
        _HMFPreconditionFailure();
      }
      uint64_t v19 = (void *)MEMORY[0x1D9452090]();
      uint64_t v20 = v11;
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v22;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Waiting for the remote transport to start before starting the coordination election", (uint8_t *)&buf, 0xCu);
      }
      int v23 = (void *)[objc_alloc(MEMORY[0x1E4F65420]) initWithQueue:v20->_queue];
      id v24 = [(HMDResidentDeviceManagerLegacy *)v20 messageDispatcher];
      uint64_t v25 = [v24 secureRemoteTransport];
      long long v26 = [v25 startFuture];
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      id v49 = __60__HMDResidentDeviceManagerLegacy__startCoordinationElection__block_invoke;
      uint64_t v50 = &unk_1E6A17268;
      long long v51 = v20;
      id v27 = (id)[v26 inContext:v23 then:&buf];
    }
  }
  else
  {
    id v9 = [(HMDResidentDeviceManagerLegacy *)self legacyElection];

    if (v9)
    {
      id v4 = (void *)MEMORY[0x1D9452090]();
      id v5 = self;
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        id v7 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v7;
        int v8 = "%{public}@Not restarting legacy election because it's already started";
        goto LABEL_8;
      }
LABEL_9:

      return;
    }
    uint64_t v28 = (void *)MEMORY[0x1D9452090]([(HMDResidentDeviceManagerLegacy *)self _stopCoordinationElectionWithReason:@"starting the legacy election"]);
    long long v29 = self;
    long long v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      long long v31 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v31;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Starting legacy election", (uint8_t *)&buf, 0xCu);
    }
    long long v32 = [[HMDPrimaryElectionLegacyAddOn alloc] initWithContext:v29];
    [(HMDResidentDeviceManagerLegacy *)v29 setLegacyElection:v32];

    v33 = [(HMDResidentDeviceManagerLegacy *)v29 legacyElection];
    [v33 setDelegate:v29];

    __int16 v34 = [(HMDResidentDeviceManagerLegacy *)v29 legacyElection];
    [v34 registerForMessages];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    __int16 v35 = [(HMDResidentDeviceManagerLegacy *)v29 devicePreferenceDataSources];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v44 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          long long v41 = [(HMDResidentDeviceManagerLegacy *)v29 legacyElection];
          [v41 addDataSource:v40];
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v37);
    }

    long long v42 = [(HMDResidentDeviceManagerLegacy *)v29 legacyElection];
    [v42 start];
  }
}

uint64_t __60__HMDResidentDeviceManagerLegacy__startCoordinationElection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = HMFGetLogIdentifier();
    int v10 = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Starting coordination election", (uint8_t *)&v10, 0xCu);
  }
  int v8 = [*(id *)(a1 + 32) localNetworkElection];
  [v8 start];

  return 1;
}

- (void)_stopLegacyElectionWithReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(HMDResidentDeviceManagerLegacy *)self legacyElection];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping legacy election: %@", (uint8_t *)&v11, 0x16u);
    }
    int v10 = [(HMDResidentDeviceManagerLegacy *)v7 legacyElection];
    [v10 stop];

    [(HMDResidentDeviceManagerLegacy *)v7 setLegacyElection:0];
  }
}

- (void)_stopCoordinationElectionWithReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(HMDResidentDeviceManagerLegacy *)self localNetworkElection];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping coordination election: %@", (uint8_t *)&v11, 0x16u);
    }
    int v10 = [(HMDResidentDeviceManagerLegacy *)v7 localNetworkElection];
    [v10 stop];

    [(HMDResidentDeviceManagerLegacy *)v7 setLocalNetworkElection:0];
  }
}

- (BOOL)_shouldEnableCoordinationElection
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Evaluating whether we should enable coordination election", buf, 0xCu);
  }
  id v7 = [[HMDHomeKitVersion alloc] initWithVersionString:@"9.1"];
  int v8 = [(HMDResidentDeviceManagerLegacy *)v4 residentDevices];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__HMDResidentDeviceManagerLegacy__shouldEnableCoordinationElection__block_invoke;
  v12[3] = &unk_1E6A0DE48;
  __int16 v13 = v7;
  id v14 = v4;
  id v9 = v7;
  char v10 = objc_msgSend(v8, "na_all:", v12);

  return v10;
}

BOOL __67__HMDResidentDeviceManagerLegacy__shouldEnableCoordinationElection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 device];
  id v5 = [v4 version];
  uint64_t v6 = [v5 compare:*(void *)(a1 + 32)];

  if (v6 == -1)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 40);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      char v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      __int16 v13 = v10;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Not enabling coordination election because device %@ has too low a version", (uint8_t *)&v12, 0x16u);
    }
  }

  return v6 != -1;
}

- (HMFFuture)firstPrimaryResidentDiscoveryAttemptCompletionFuture
{
  return (HMFFuture *)[MEMORY[0x1E4F65438] futureWithNoValue];
}

- (void)_fixUpRemoteResidentDevice:(id)a3 existingResidentDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_fixupRemoteResidentDevice && [v7 isCurrentDevice])
  {
    id v9 = [(HMDResidentDeviceManagerLegacy *)self home];
    uint64_t v10 = [v9 uuid];
    int v11 = [v8 device];
    int v12 = [v11 identifier];
    __int16 v13 = +[HMDResidentDevice deriveUUIDFromHomeUUID:v10 deviceUUID:v12];

    __int16 v14 = [v6 identifier];
    LOBYTE(v10) = [v14 isEqual:v13];

    if ((v10 & 1) == 0)
    {
      self->_fixupRemoteResidentDevice = 0;
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __84__HMDResidentDeviceManagerLegacy__fixUpRemoteResidentDevice_existingResidentDevice___block_invoke;
      block[3] = &unk_1E6A19668;
      block[4] = self;
      id v17 = v6;
      id v18 = v8;
      dispatch_async(queue, block);
    }
  }
}

void __84__HMDResidentDeviceManagerLegacy__fixUpRemoteResidentDevice_existingResidentDevice___block_invoke(id *a1)
{
  id v2 = [a1[4] home];
  id v3 = [v2 backingStore];
  id v4 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  id v9 = [v3 transaction:@"Removing Invalid Resident Model" options:v4];

  id v5 = [a1[5] modelObjectWithChangeType:3 version:4];
  [v9 add:v5];
  id v6 = [a1[6] modelObjectWithChangeType:2 version:4];
  id v7 = [MEMORY[0x1E4F29128] UUID];
  id v8 = [v7 UUIDString];
  [v6 setChangeToken:v8];

  [v9 add:v6];
  [v9 run];
}

- (id)residentDeviceForDevice:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_residentDevices;
  id v7 = (id)[(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v11 = objc_msgSend(v10, "device", (void)v14);
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (HMDDevice)confirmedPrimaryResidentDevice
{
  id v2 = [(HMDResidentDeviceManagerLegacy *)self primaryResidentDevice];
  if ([v2 isConfirmed])
  {
    id v3 = [v2 device];
  }
  else
  {
    id v3 = 0;
  }

  return (HMDDevice *)v3;
}

- (NSArray)availableResidentDevices
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [(HMDResidentDeviceManagerLegacy *)self residentDevices];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEnabled", (void)v11)) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)ourSelf
{
  id v2 = [(HMDResidentDeviceManagerLegacy *)self residentDevices];
  id v3 = objc_msgSend(v2, "hmf_objectPassingTest:", &__block_literal_global_72384);

  return v3;
}

uint64_t __41__HMDResidentDeviceManagerLegacy_ourSelf__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 device];
  uint64_t v3 = [v2 isCurrentDevice];

  return v3;
}

- (id)residentWithUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(HMDResidentDeviceManagerLegacy *)self residentDevices];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 identifier];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setFirstHomeZoneFetch:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_firstHomeZoneFetch = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasFirstHomeZoneFetch
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_firstHomeZoneFetch;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFirstHomeManagerZoneFetch:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_firstHomeManagerZoneFetch = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasFirstHomeManagerZoneFetch
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_firstHomeManagerZoneFetch;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFirstLegacyFetch:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_firstLegacyFetch = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasFirstLegacyFetch
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_firstLegacyFetch;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSUUID)primaryResidentUUID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_primaryResidentUUID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addDataSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__HMDResidentDeviceManagerLegacy_addDataSource___block_invoke;
    v7[3] = &unk_1E6A197C8;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __48__HMDResidentDeviceManagerLegacy_addDataSource___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) devicePreferenceDataSources];
  [v2 addObject:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) legacyElection];
  [v3 addDataSource:*(void *)(a1 + 40)];
}

- (void)_teardownSessionWithPrimaryResidentDevice
{
  id v4 = [(HMDResidentDeviceManagerLegacy *)self messageDispatcher];
  id v3 = [(HMDResidentDeviceManagerLegacy *)self home];
  [v4 setRemoteAccessDevice:0 forHome:v3];
}

- (void)_setupSessionWithPrimaryResidentDevice
{
  id v6 = [(HMDResidentDeviceManagerLegacy *)self primaryResidentDevice];
  if (v6)
  {
    id v3 = [(HMDResidentDeviceManagerLegacy *)self messageDispatcher];
    id v4 = [v6 device];
    uint64_t v5 = [(HMDResidentDeviceManagerLegacy *)self home];
    [v3 setRemoteAccessDevice:v4 forHome:v5];
  }
}

- (void)_run
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    uint64_t v52 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Running", buf, 0xCu);
  }
  uint64_t v7 = [(HMDResidentDeviceManagerLegacy *)v4 queue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [(HMDResidentDeviceManagerLegacy *)v4 primaryResidentDevice];
  long long v45 = (void *)v8;
  if (!v8)
  {
    [(HMDPrimaryElectionLegacyAddOn *)v4->_legacyElection performElectionWithReason:0];
    uint64_t v10 = [(HMDResidentDeviceManagerLegacy *)v4 home];
    goto LABEL_11;
  }
  id v9 = (void *)v8;
  uint64_t v10 = [(HMDResidentDeviceManagerLegacy *)v4 home];
  if (![(HMDResidentDeviceManagerLegacy *)v4 isResidentSupported])
  {
LABEL_11:
    uint64_t v18 = [(HMDResidentDeviceManagerLegacy *)v4 messageDispatcher];
    uint64_t v19 = [v18 remoteAccessDeviceForHome:v10];

    uint64_t v20 = [v19 capabilities];
    int v21 = [v20 isResidentCapable];

    if (v21)
    {
      uint64_t v22 = (void *)MEMORY[0x1D9452090]();
      int v23 = v4;
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        uint64_t v52 = v25;
        __int16 v53 = 2112;
        long long v54 = v19;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Tearing down remote access to device: %@", buf, 0x16u);
      }
      [(HMDResidentDeviceManagerLegacy *)v23 _teardownSessionWithPrimaryResidentDevice];
    }
    long long v43 = v10;
    goto LABEL_16;
  }
  char v11 = [v9 device];
  char v12 = [v11 isCurrentDevice];

  long long v13 = (void *)MEMORY[0x1D9452090]();
  long long v14 = v4;
  long long v15 = HMFGetOSLogHandle();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v16)
    {
      long long v17 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v52 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Registering for notifications from secondary residents", buf, 0xCu);
    }
    objc_msgSend(v10, "subscribeForNotificationsFromRemoteGateway", v10, v45);
    if (([v9 isConfirmed] & 1) == 0) {
      [(HMDResidentDeviceManagerLegacy *)v14 confirmAsResident];
    }
    goto LABEL_17;
  }
  if (v16)
  {
    uint64_t v40 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    uint64_t v52 = v40;
    __int16 v53 = 2112;
    long long v54 = v9;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Setting up remote access to resident: %@", buf, 0x16u);
  }
  if (objc_msgSend(v9, "isReachable", v10, v45))
  {
    [(HMDResidentDeviceManagerLegacy *)v14 _setupSessionWithPrimaryResidentDevice];
    [v10 subscribeForNotificationsFromRemoteGateway];
  }
  long long v41 = [(HMDResidentDeviceManagerLegacy *)v14 ourSelf];
  int v42 = [v41 isEnabled];

  if (v42)
  {
    uint64_t v19 = [(HMDResidentDeviceManagerLegacy *)v14 legacyElection];
    [v19 start];
LABEL_16:
  }
LABEL_17:
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v26 = [(HMDResidentDeviceManagerLegacy *)v4 residentDevices];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v47 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        if ([v31 isEnabled])
        {
          long long v32 = [(HMDResidentDeviceManagerLegacy *)v4 primaryResidentDevice];
          int v33 = [v32 isEqual:v31];

          if (v33)
          {
            __int16 v34 = [(HMDResidentDeviceManagerLegacy *)v4 primaryResidentInitialReachabilityManager];
            __int16 v35 = [v34 initialReachability];
          }
          else
          {
            __int16 v35 = 0;
          }
          uint64_t v36 = [(HMDResidentDeviceManagerLegacy *)v4 messageDispatcher];
          uint64_t v37 = [v36 secureRemoteTransport];
          uint64_t v38 = [v37 deviceMonitor];
          uint64_t v39 = [v31 device];
          [v38 startMonitoringDevice:v39 withInitialReachability:v35 forClient:v4];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v28);
  }
}

- (void)run
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__HMDResidentDeviceManagerLegacy_run__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __37__HMDResidentDeviceManagerLegacy_run__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _run];
}

- (void)atHomeLevelChanged:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__HMDResidentDeviceManagerLegacy_atHomeLevelChanged___block_invoke;
  v4[3] = &unk_1E6A189D0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

void __53__HMDResidentDeviceManagerLegacy_atHomeLevelChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) legacyElection];
  [v2 atHomeLevelChanged:*(void *)(a1 + 40)];
}

- (void)confirmOnAvailability
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HMDResidentDeviceManagerLegacy_confirmOnAvailability__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(queue, block);
}

void __55__HMDResidentDeviceManagerLegacy_confirmOnAvailability__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) legacyElection];
  [v1 confirmOnAvailability];
}

- (void)confirmAsResident
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HMDResidentDeviceManagerLegacy_confirmAsResident__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(queue, block);
}

void __51__HMDResidentDeviceManagerLegacy_confirmAsResident__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) legacyElection];
  [v1 confirmAsResident];
}

- (void)confirmWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__HMDResidentDeviceManagerLegacy_confirmWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A19530;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__HMDResidentDeviceManagerLegacy_confirmWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) legacyElection];
  [v2 confirmWithCompletionHandler:*(void *)(a1 + 40)];
}

- (BOOL)hasTrustZoneCapableResident
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [[HMDHomeKitVersion alloc] initWithVersionString:@"6.1"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(HMDResidentDeviceManagerLegacy *)self residentDevices];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) device];
        id v9 = [v8 version];
        char v10 = [v9 isAtLeastVersion:v3];

        if (v10)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)isResidentElectionV2Enabled
{
  id v2 = [(HMDResidentDeviceManagerLegacy *)self localNetworkElection];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_registerForMessages
{
  v11[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDResidentDeviceManagerLegacy *)self home];
  id v4 = [(HMDResidentDeviceManagerLegacy *)self messageDispatcher];
  uint64_t v5 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v3 userPrivilege:3 remoteAccessRequired:0];
  uint64_t v6 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  uint64_t v7 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2, v6, v5);
  v11[2] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  [v4 registerForMessage:@"kResidentDeviceUpdateEnabledRequestKey" receiver:self policies:v8 selector:sel__handleResidentDeviceUpdateEnabled_];

  id v9 = [(HMDResidentDeviceManagerLegacy *)self localNetworkElection];
  [v9 registerForMessages];

  char v10 = [(HMDResidentDeviceManagerLegacy *)self legacyElection];
  [v10 registerForMessages];
}

- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__HMDResidentDeviceManagerLegacy_configureWithHome_messageDispatcher___block_invoke;
  block[3] = &unk_1E6A19668;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __70__HMDResidentDeviceManagerLegacy_configureWithHome_messageDispatcher___block_invoke(id *a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  [a1[4] setHome:a1[5]];
  id v2 = [a1[4] dataSource];
  BOOL v3 = [a1[5] uuid];
  id v4 = [v2 createInitialReachabilityManagerWithUUID:v3];
  [a1[4] setPrimaryResidentInitialReachabilityManager:v4];

  uint64_t v5 = [a1[4] primaryResidentInitialReachabilityManager];
  [v5 configureWithHome:a1[5]];

  objc_storeStrong((id *)a1[4] + 8, a1[6]);
  id v6 = [a1[4] dataSource];
  id v7 = [v6 appleAccountManager];
  id v8 = [v7 device];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v9 = [a1[4] residentDevices];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v47 != v13) {
          objc_enumerationMutation(v9);
        }
        long long v15 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        [v15 configureWithHome:a1[5]];
        BOOL v16 = [v15 device];
        int v17 = [v16 isEqual:v8];

        if (v17)
        {
          id v18 = v15;

          id v12 = v18;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v11);
  }
  else
  {
    id v12 = 0;
  }

  [a1[4] _registerForMessages];
  id v19 = a1[4];
  if (v8)
  {
    [v19 setResidentSupported:1];
    uint64_t v20 = [v8 capabilities];
    int v21 = [v20 isResidentCapable];

    if (v21)
    {
      int v23 = [a1[4] notificationCenter];
      [v23 addObserver:a1[4] selector:sel_handleDeviceUpdated_ name:@"HMDDeviceUpdatedNotification" object:0];
    }
    if (v12)
    {
      id v24 = (void *)MEMORY[0x1D9452090]();
      id v25 = a1[4];
      long long v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        id v28 = a1[5];
        *(_DWORD *)long long buf = 138543618;
        uint64_t v52 = v27;
        __int16 v53 = 2112;
        id v54 = v28;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Current device is a resident in home %@", buf, 0x16u);
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __70__HMDResidentDeviceManagerLegacy_configureWithHome_messageDispatcher___block_invoke_119;
      aBlock[3] = &unk_1E6A0CCC0;
      id v29 = v12;
      id v30 = a1[4];
      id v43 = v29;
      id v44 = v30;
      id v45 = v8;
      long long v31 = _Block_copy(aBlock);
      long long v32 = [HMDBackingStoreCacheFetchModelObjects alloc];
      int v33 = [v29 identifier];
      uint64_t v50 = v33;
      __int16 v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
      __int16 v35 = [(HMDBackingStoreCacheFetchModelObjects *)v32 initWithUUIDs:v34 fetchResult:v31];

      uint64_t v36 = [a1[5] backingStore];
      [v36 submit:v35];

      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v22 = [v19 setResidentSupported:0];
  }
  uint64_t v37 = (void *)MEMORY[0x1D9452090](v22);
  id v38 = a1[4];
  uint64_t v39 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v40 = HMFGetLogIdentifier();
    id v41 = a1[5];
    *(_DWORD *)long long buf = 138543618;
    uint64_t v52 = v40;
    __int16 v53 = 2112;
    id v54 = v41;
    _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_DEBUG, "%{public}@Current device is not a resident in home %@", buf, 0x16u);
  }
LABEL_23:
  if (([v12 isEnabled] & 1) != 0 || (objc_msgSend(a1[4], "_shouldEnableCoordinationElection") & 1) == 0) {
    [a1[4] _startElectionAddOn];
  }
  [a1[4] _run];
}

uint64_t __70__HMDResidentDeviceManagerLegacy_configureWithHome_messageDispatcher___block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v37 = a3;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v42;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "object", v37);
        id v12 = [v11 uuid];
        uint64_t v13 = [*(id *)(a1 + 32) identifier];
        if ([v12 isEqual:v13])
        {
          id v14 = [v10 object];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            long long v15 = v14;
          }
          else {
            long long v15 = 0;
          }
          id v16 = v15;

          if (v16)
          {

            int v23 = [v14 device];

            id v24 = (void *)MEMORY[0x1D9452090]();
            id v25 = *(id *)(a1 + 40);
            long long v26 = HMFGetOSLogHandle();
            uint64_t v27 = v26;
            if (v23)
            {
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                id v28 = HMFGetLogIdentifier();
                uint64_t v29 = *(void *)(a1 + 48);
                id v30 = [*(id *)(a1 + 40) home];
                *(_DWORD *)long long buf = 138543874;
                long long v46 = v28;
                __int16 v47 = 2112;
                uint64_t v48 = v29;
                __int16 v49 = 2112;
                uint64_t v50 = v30;
                _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Current device %@ is in the cloud for home %@", buf, 0x20u);
              }
            }
            else
            {
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                long long v31 = HMFGetLogIdentifier();
                uint64_t v32 = *(void *)(a1 + 48);
                int v33 = [*(id *)(a1 + 40) home];
                *(_DWORD *)long long buf = 138543874;
                long long v46 = v31;
                __int16 v47 = 2112;
                uint64_t v48 = v32;
                __int16 v49 = 2112;
                uint64_t v50 = v33;
                _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Current device %@ should be updated in the cloud for home %@", buf, 0x20u);
              }
              __int16 v35 = *(void **)(a1 + 40);
              uint64_t v34 = *(void *)(a1 + 48);
              v39[0] = MEMORY[0x1E4F143A8];
              v39[1] = 3221225472;
              v39[2] = __70__HMDResidentDeviceManagerLegacy_configureWithHome_messageDispatcher___block_invoke_121;
              v39[3] = &unk_1E6A196E0;
              v39[4] = v35;
              id v40 = v14;
              id v14 = v14;
              objc_msgSend(v35, "__currentDeviceUpdated:completion:", v34, v39);
            }
            goto LABEL_26;
          }
        }
        else
        {
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  int v17 = (void *)MEMORY[0x1D9452090]();
  id v18 = *(id *)(a1 + 40);
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = HMFGetLogIdentifier();
    uint64_t v21 = *(void *)(a1 + 48);
    uint64_t v22 = [*(id *)(a1 + 40) home];
    *(_DWORD *)long long buf = 138543874;
    long long v46 = v20;
    __int16 v47 = 2112;
    uint64_t v48 = v21;
    __int16 v49 = 2112;
    uint64_t v50 = v22;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Model not detected for current device %@ for home %@", buf, 0x20u);
  }
LABEL_26:

  return 1;
}

void __70__HMDResidentDeviceManagerLegacy_configureWithHome_messageDispatcher___block_invoke_121(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) home];
  [v2 saveWithReason:@"residentUpdated" information:0 postSyncNotification:0 objectChange:*(void *)(a1 + 40) != 0];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__HMDResidentDeviceManagerLegacy_invalidate__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(queue, block);
}

void __44__HMDResidentDeviceManagerLegacy_invalidate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) notificationCenter];
  [v2 removeObserver:*(void *)(a1 + 32)];

  BOOL v3 = [*(id *)(a1 + 32) messageDispatcher];
  [v3 deregisterReceiver:*(void *)(a1 + 32)];

  id v4 = [*(id *)(a1 + 32) legacyElection];
  [v4 stop];
}

- (void)setHome:(id)a3
{
  p_home = &self->_home;
  id v5 = a3;
  objc_storeWeak((id *)p_home, v5);
  uint64_t v6 = [(HMDResidentDeviceManagerLegacy *)self dataSource];
  uint64_t v7 = [v6 logIdentifierForHome:v5];
  logIdentifier = self->_logIdentifier;
  self->_logIdentifier = v7;

  id v9 = [(HMDResidentDeviceManagerLegacy *)self notificationCenter];
  [v9 addObserver:self selector:sel_handleHomeUpdatedAccessories_ name:@"HMDNotificationHomeAddedAccessory" object:v5];

  id v10 = [(HMDResidentDeviceManagerLegacy *)self notificationCenter];
  [v10 addObserver:self selector:sel_handleHomeUpdatedAccessories_ name:@"HMDHomeAccessoryRemovedNotification" object:v5];
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)dealloc
{
  BOOL v3 = [(HMDResidentDeviceManagerLegacy *)self messageDispatcher];
  [v3 deregisterReceiver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDResidentDeviceManagerLegacy;
  [(HMDResidentDeviceManagerLegacy *)&v4 dealloc];
}

- (HMDResidentDeviceManagerLegacy)initWithDataSource:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HMDResidentDeviceManagerLegacy;
  uint64_t v6 = [(HMDResidentDeviceManagerLegacy *)&v23 init];
  if (v6)
  {
    uint64_t v7 = [v5 queue];
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_dataSource, a3);
    logIdentifier = v6->_logIdentifier;
    v6->_logIdentifier = (NSString *)@"<unconfigured>";

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    residentDevices = v6->_residentDevices;
    v6->_residentDevices = (NSMutableSet *)v10;

    v6->_fixupRemoteResidentDevice = 1;
    v6->_verifyCurrentResidentDevice = 1;
    uint64_t v12 = [v5 notificationCenter];
    notificationCenter = v6->_notificationCenter;
    v6->_notificationCenter = (NSNotificationCenter *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    devicePreferenceDataSources = v6->_devicePreferenceDataSources;
    v6->_devicePreferenceDataSources = (NSHashTable *)v14;

    uint64_t v16 = [MEMORY[0x1E4F65438] futureWithPromise:&v6->_cloudReadyPromise];
    cloudReady = v6->_cloudReady;
    v6->_cloudReady = (HMFFuture *)v16;

    id v18 = [(HMDResidentDeviceManagerLegacy *)v6 notificationCenter];
    [v18 addObserver:v6 selector:sel__handleCloudZoneReadyNotification_ name:@"HMDCloudZoneReadyNotification" object:0];

    id v19 = [(HMDResidentDeviceManagerLegacy *)v6 notificationCenter];
    [v19 addObserver:v6 selector:sel_handleCurrentDeviceChanged_ name:@"HMDAppleAccountManagerDeviceUpdatedNotification" object:0];

    uint64_t v20 = [(HMDResidentDeviceManagerLegacy *)v6 notificationCenter];
    [v20 addObserver:v6 selector:sel_handleResidentDeviceIsReachable_ name:@"HMDRemoteDeviceIsReachableNotification" object:0];

    uint64_t v21 = [(HMDResidentDeviceManagerLegacy *)v6 notificationCenter];
    [v21 addObserver:v6 selector:sel_handleResidentDeviceIsNotReachable_ name:@"HMDRemoteDeviceIsNotReachableNotification" object:0];
  }
  return v6;
}

- (HMDResidentDeviceManagerLegacy)init
{
  BOOL v3 = objc_alloc_init(HMDDefaultResidentDeviceManagerLegacyDataSource);
  objc_super v4 = [(HMDResidentDeviceManagerLegacy *)self initWithDataSource:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t59 != -1) {
    dispatch_once(&logCategory__hmf_once_t59, &__block_literal_global_201_72417);
  }
  id v2 = (void *)logCategory__hmf_once_v60;
  return v2;
}

uint64_t __45__HMDResidentDeviceManagerLegacy_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v60;
  logCategory__hmf_once___int16 v60 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end