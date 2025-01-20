@interface HMDResidentSelectionManager
+ (id)logCategory;
- (BOOL)allowExternalUpdateOfPrimaryResidentTo:(id)a3 selectionTimestamp:(id)a4;
- (BOOL)devicesInHomeSupportResidentSelection;
- (BOOL)residentIsLocallyReachable:(id)a3;
- (BOOL)residentIsPresentInCurrentAccount:(id)a3;
- (BOOL)weAreInResidentSelection;
- (BOOL)weAreTheOnlyActingResident;
- (HMDIDSServerBag)idsServerBag;
- (HMDPreferredResidentsList)localPreferredResidentsList;
- (HMDResidentDeviceManagerContext)context;
- (HMDResidentSelectionInfo)residentSelectionInfoFromWorkingStore;
- (HMDResidentSelectionManager)initWithContext:(id)a3;
- (HMDResidentSelectionManager)initWithContext:(id)a3 dataSource:(id)a4;
- (HMDResidentSelectionManagerDataSource)dataSource;
- (HMDResidentSelectionManagerDelegate)delegate;
- (HMDResidentSelectionMode)currentResidentSelectionMode;
- (NSBackgroundActivityScheduler)backgroundScheduler;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (OS_dispatch_queue)queue;
- (double)preferredResidentEvaluationDelay;
- (id)_idsIdentifierForResidentDeviceWithIdentifier:(id)a3;
- (id)createResidentSelectionModeWithType:(unint64_t)a3;
- (id)dumpState;
- (id)locallyReachableResidents;
- (id)logIdentifier;
- (id)minimumHomeKitVersionForResidentSelection;
- (id)notificationCenter;
- (id)residentWithIdentifier:(id)a3;
- (id)residentsNotPresentInPreferredResidentsList:(id)a3;
- (id)shortDescription;
- (unint64_t)currentModeType;
- (unint64_t)messageTransportRestriction;
- (unint64_t)primaryChangedReason;
- (void)_handleModeChangeWithPreviousMode:(unint64_t)a3;
- (void)_processSelectedAsPreferredMessage:(id)a3;
- (void)_registerForMessages;
- (void)_removeScheduledAutoModeEvaluation;
- (void)_scheduleAutoModeEvaluationWithRetryNeeded:(BOOL)a3;
- (void)currentDeviceReadyAsAResident;
- (void)didRemoveResidentsFromHome:(id)a3;
- (void)didUpdateResidentSelectionModelTo:(id)a3;
- (void)didUpdateResidentSelectionVersion;
- (void)didUpdateResidentStatus:(id)a3 residentsFound:(id)a4 residentsLost:(id)a5;
- (void)evaluateSelectionMode;
- (void)handleSelectedAsPreferredMessage:(id)a3;
- (void)makeSureCurrentModeIsOfType:(unint64_t)a3;
- (void)performSelectionInMode:(unint64_t)a3 preferredPrimaryResident:(id)a4 requireAutoUpdate:(BOOL)a5 reason:(unint64_t)a6 completion:(id)a7;
- (void)primaryResidentChanged:(id)a3 previousResidentDevice:(id)a4;
- (void)primarySelectionMode:(id)a3 didFailToSelectWithError:(id)a4;
- (void)primarySelectionMode:(id)a3 didReceivePrimaryResidentIdsIdentifier:(id)a4 selectionTimestamp:(id)a5;
- (void)primarySelectionMode:(id)a3 didSelectPrimaryResident:(id)a4 selectionInfo:(id)a5 selectionLogEvent:(id)a6 completion:(id)a7;
- (void)primarySelectionMode:(id)a3 didUpdateActiveNodes:(id)a4;
- (void)primarySelectionMode:(id)a3 didUpdatePreferredResidentsList:(id)a4;
- (void)primarySelectionMode:(id)a3 didUpdateResidentDevice:(id)a4;
- (void)primarySelectionMode:(id)a3 didUpdateResidentSelectionInfo:(id)a4 completion:(id)a5;
- (void)primarySelectionMode:(id)a3 reassertAsCurrentPrimaryWithSelectionTimestamp:(id)a4;
- (void)primarySelectionModeReadyAsResident:(id)a3;
- (void)setBackgroundScheduler:(id)a3;
- (void)setCurrentModeType:(unint64_t)a3;
- (void)setCurrentResidentSelectionMode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResidentSelectionInfoFromWorkingStore:(id)a3;
- (void)start;
- (void)stop;
- (void)triggerAutoModeEvaluationWithCompletion:(id)a3;
@end

@implementation HMDResidentSelectionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundScheduler, 0);
  objc_storeStrong((id *)&self->_residentSelectionInfoFromWorkingStore, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentResidentSelectionMode, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setBackgroundScheduler:(id)a3
{
}

- (NSBackgroundActivityScheduler)backgroundScheduler
{
  return (NSBackgroundActivityScheduler *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResidentSelectionInfoFromWorkingStore:(id)a3
{
}

- (HMDResidentSelectionInfo)residentSelectionInfoFromWorkingStore
{
  return (HMDResidentSelectionInfo *)objc_getProperty(self, a2, 56, 1);
}

- (HMDResidentDeviceManagerContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (HMDResidentDeviceManagerContext *)WeakRetained;
}

- (HMDResidentSelectionManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setCurrentModeType:(unint64_t)a3
{
  self->_currentModeType = a3;
}

- (unint64_t)currentModeType
{
  return self->_currentModeType;
}

- (void)setCurrentResidentSelectionMode:(id)a3
{
}

- (HMDResidentSelectionMode)currentResidentSelectionMode
{
  return (HMDResidentSelectionMode *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDResidentSelectionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDResidentSelectionManagerDelegate *)WeakRetained;
}

- (id)shortDescription
{
  v2 = NSString;
  v3 = [(HMDResidentSelectionManager *)self messageTargetUUID];
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (id)logIdentifier
{
  v2 = [(HMDResidentSelectionManager *)self context];
  v3 = [v2 home];
  v4 = [v3 uuid];
  v5 = [v4 UUIDString];

  return v5;
}

- (unint64_t)messageTransportRestriction
{
  return -1;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return self->_queue;
}

- (NSUUID)messageTargetUUID
{
  v2 = [(HMDResidentSelectionManager *)self context];
  v3 = [v2 home];
  v4 = [v3 uuid];

  return (NSUUID *)v4;
}

- (HMDIDSServerBag)idsServerBag
{
  v3 = [(HMDResidentSelectionManager *)self dataSource];
  v4 = [(HMDResidentSelectionManager *)self context];
  v5 = [v4 home];
  v6 = [v3 idsServerBagForHome:v5];

  return (HMDIDSServerBag *)v6;
}

- (id)minimumHomeKitVersionForResidentSelection
{
  v3 = [(HMDResidentSelectionManager *)self idsServerBag];
  v4 = [v3 residentSelectionMinHomeKitVersion];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v6 = [(HMDResidentSelectionManager *)self dataSource];
    id v5 = [v6 minimumHomeKitVersionForResidentSelection];
  }
  return v5;
}

- (void)primarySelectionMode:(id)a3 didUpdatePreferredResidentsList:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDResidentSelectionManager *)self delegate];
  [v6 residentSelectionManager:self didUpdatePreferredResidentsList:v5];
}

- (void)primarySelectionMode:(id)a3 didUpdateResidentSelectionInfo:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(HMDResidentSelectionManager *)self delegate];
  [v9 residentSelectionManager:self didUpdateResidentSelectionInfo:v8 completion:v7];
}

- (void)primarySelectionMode:(id)a3 didReceivePrimaryResidentIdsIdentifier:(id)a4 selectionTimestamp:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(HMDResidentSelectionManager *)self delegate];
  [v9 residentSelectionManager:self didReceivePrimaryResidentIdsIdentifier:v8 selectionTimestamp:v7];
}

- (void)primarySelectionModeReadyAsResident:(id)a3
{
  id v4 = [(HMDResidentSelectionManager *)self delegate];
  [v4 residentSelectionManagerReadyAsResident:self];
}

- (void)primarySelectionMode:(id)a3 reassertAsCurrentPrimaryWithSelectionTimestamp:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDResidentSelectionManager *)self delegate];
  [v6 residentSelectionManager:self reassertAsTheCurrentPrimaryWithSelectionTimestamp:v5];
}

- (void)primarySelectionMode:(id)a3 didUpdateResidentDevice:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDResidentSelectionManager *)self delegate];
  [v6 residentSelectionManager:self didUpdateResidentDevice:v5];
}

- (void)primarySelectionMode:(id)a3 didUpdateActiveNodes:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDResidentSelectionManager *)self delegate];
  [v6 residentSelectionManager:self didUpdateActiveNodes:v5];
}

- (void)primarySelectionMode:(id)a3 didFailToSelectWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDResidentSelectionManager *)self delegate];
  [v6 residentSelectionManager:self didFailToSelectWithError:v5];
}

- (void)primarySelectionMode:(id)a3 didSelectPrimaryResident:(id)a4 selectionInfo:(id)a5 selectionLogEvent:(id)a6 completion:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(HMDResidentSelectionManager *)self delegate];
  [v17 residentSelectionManager:self didSelectPrimaryResident:v13 selectionInfo:v14 electionLogEvent:v15 completion:v16];

  if ([v12 currentModeType] == 1)
  {
    v18 = [(HMDResidentSelectionManager *)self context];
    v19 = [v18 currentResidentDevice];
    int v20 = [v13 isEqual:v19];

    if (v20)
    {
      v21 = (void *)MEMORY[0x230FBD990]();
      v22 = self;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = HMFGetLogIdentifier();
        int v25 = 138543362;
        v26 = v24;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@We are the Coordination elected resident. Scheduling an evaluation.", (uint8_t *)&v25, 0xCu);
      }
      [(HMDResidentSelectionManager *)v22 _scheduleAutoModeEvaluationWithRetryNeeded:1];
    }
  }
}

- (unint64_t)primaryChangedReason
{
  v2 = [(HMDResidentSelectionManager *)self currentResidentSelectionMode];
  unint64_t v3 = [v2 primaryChangedReason];

  return v3;
}

- (void)didUpdateResidentSelectionModelTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v16 = 138543618;
    v17 = v8;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Resident Selection info in the working store updated to: %@", (uint8_t *)&v16, 0x16u);
  }
  [(HMDResidentSelectionManager *)v6 setResidentSelectionInfoFromWorkingStore:v4];
  id v9 = [(HMDResidentSelectionManager *)v6 context];
  char v10 = [v9 homeSupportsResidentSelection];

  if (v10)
  {
    [(HMDResidentSelectionManager *)v6 evaluateSelectionMode];
    v11 = [(HMDResidentSelectionManager *)v6 currentResidentSelectionMode];
    [v11 didUpdateResidentSelectionModelTo:v4];
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = v6;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Ignoring the Resident Selection model update since the home does not support Resident Selection.", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (id)residentWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentSelectionManager *)self context];
  id v6 = [v5 availableResidentDevices];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__HMDResidentSelectionManager_residentWithIdentifier___block_invoke;
  v10[3] = &unk_264A2A830;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __54__HMDResidentSelectionManager_residentWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = [v5 identifier];

  uint64_t v7 = [v6 isEqual:*(void *)(a1 + 32)];
  return v7;
}

- (void)_processSelectedAsPreferredMessage:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(HMDResidentSelectionManager *)self context];
  char v6 = [v5 isActingAsResident];

  if (v6)
  {
    uint64_t v7 = [v4 messagePayload];
    id v8 = objc_msgSend(v7, "hmf_numberForKey:", @"primary.selection.mode");

    if (v8)
    {
      uint64_t v9 = [v8 unsignedIntegerValue];
      char v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        id v14 = [v4 remoteSourceDevice];
        int v24 = 138543618;
        int v25 = v13;
        __int16 v26 = 2112;
        id v27 = v14;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Received preferred primary selection message from: %@", (uint8_t *)&v24, 0x16u);
      }
      [(HMDResidentSelectionManager *)v11 makeSureCurrentModeIsOfType:v9];
      id v15 = [(HMDResidentSelectionManager *)v11 currentResidentSelectionMode];
      [v15 didReceiveSelectionMessage:v4];
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x230FBD990]();
      v21 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        int v24 = 138543618;
        int v25 = v23;
        __int16 v26 = 2112;
        id v27 = v4;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Selection message did not contain any mode: %@", (uint8_t *)&v24, 0x16u);
      }
      id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
      [v4 respondWithError:v15];
    }
  }
  else
  {
    int v16 = (void *)MEMORY[0x230FBD990]();
    v17 = self;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      int v24 = 138543618;
      int v25 = v19;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Received the selection message: %@ but we are not acting as a resident.", (uint8_t *)&v24, 0x16u);
    }
    id v8 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v4 respondWithError:v8];
  }
}

- (void)handleSelectedAsPreferredMessage:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(HMDResidentSelectionManager *)self _processSelectedAsPreferredMessage:v5];
}

- (id)_idsIdentifierForResidentDeviceWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = [(HMDResidentSelectionManager *)self context];
    char v6 = [v5 availableResidentDevices];

    uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          char v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v11 = [v10 identifier];
          char v12 = [v11 isEqual:v4];

          if (v12)
          {
            id v13 = [v10 device];
            uint64_t v7 = [v13 idsIdentifier];

            goto LABEL_12;
          }
        }
        uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)residentIsPresentInCurrentAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDResidentSelectionManager *)self context];
  char v6 = [v5 appleAccountManager];
  uint64_t v7 = [v6 account];

  uint64_t v8 = [v4 device];

  uint64_t v9 = [v8 identifier];
  char v10 = [v7 deviceForIdentifier:v9];

  return v10 != 0;
}

- (BOOL)devicesInHomeSupportResidentSelection
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v53 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Evaluating if devices in home are ready to support Resident Selection", buf, 0xCu);
  }
  uint64_t v7 = [(HMDResidentSelectionManager *)v4 context];
  uint64_t v8 = [v7 availableResidentDevices];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v46 = [(HMDResidentSelectionManager *)v4 minimumHomeKitVersionForResidentSelection];
    char v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = v4;
    char v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v53 = v13;
      __int16 v54 = 2112;
      uint64_t v55 = (uint64_t)v46;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Minimum version for support evaluation is %@", buf, 0x16u);
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v43 = v7;
    id obj = [v7 availableResidentDevices];
    uint64_t v14 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v45 = 0;
      uint64_t v16 = *(void *)v49;
      uint64_t v44 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v49 != v16) {
            objc_enumerationMutation(obj);
          }
          long long v18 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          id v19 = [v18 device];
          uint64_t v20 = [v19 version];

          if ([(HMDResidentSelectionManager *)v11 residentIsPresentInCurrentAccount:v18])
          {
            if ([v20 isAtLeastVersion:v46])
            {
              ++v45;
            }
            else
            {
              __int16 v26 = (void *)MEMORY[0x230FBD990]();
              id v27 = v11;
              uint64_t v28 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v30 = uint64_t v29 = v9;
                *(_DWORD *)buf = 138543618;
                v53 = v30;
                __int16 v54 = 2112;
                uint64_t v55 = (uint64_t)v18;
                _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Cannot support Resident Selection because resident: %@ has too low a version", buf, 0x16u);

                uint64_t v9 = v29;
                uint64_t v16 = v44;
              }
            }
          }
          else
          {
            v21 = (void *)MEMORY[0x230FBD990]();
            v22 = v11;
            v23 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              int v25 = v24 = v9;
              *(_DWORD *)buf = 138543618;
              v53 = v25;
              __int16 v54 = 2112;
              uint64_t v55 = (uint64_t)v18;
              _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Resident: %@ is not present in the current account. Excluding it from the RS migration check.", buf, 0x16u);

              uint64_t v9 = v24;
              uint64_t v16 = v44;
            }

            --v9;
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
      }
      while (v15);
    }
    else
    {
      uint64_t v45 = 0;
    }

    v36 = (void *)MEMORY[0x230FBD990]();
    v37 = v11;
    v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v40 = uint64_t v39 = v9;
      *(_DWORD *)buf = 138543874;
      v53 = v40;
      __int16 v54 = 2048;
      uint64_t v55 = v45;
      __int16 v56 = 2048;
      uint64_t v57 = v39;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@%ld of %lu residents are eligible to support Resident Selection", buf, 0x20u);

      uint64_t v9 = v39;
    }

    uint64_t v7 = v43;
    if (v45 == v9)
    {
      BOOL v35 = 1;
    }
    else
    {
      char v41 = isInternalBuild();
      if (v45 > 1) {
        BOOL v35 = v41;
      }
      else {
        BOOL v35 = 0;
      }
    }
  }
  else
  {
    v31 = (void *)MEMORY[0x230FBD990]();
    v32 = v4;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v53 = v34;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Cannot support resident selection in a home that has no residents", buf, 0xCu);
    }
    BOOL v35 = 0;
  }

  return v35;
}

- (void)_removeScheduledAutoModeEvaluation
{
  id v3 = [(HMDResidentSelectionManager *)self backgroundScheduler];
  [v3 invalidate];

  [(HMDResidentSelectionManager *)self setBackgroundScheduler:0];
}

- (void)_scheduleAutoModeEvaluationWithRetryNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = [(HMDResidentSelectionManager *)self backgroundScheduler];

  if (!v5)
  {
    char v6 = [(HMDResidentSelectionManager *)self dataSource];
    uint64_t v7 = [v6 autoModeEvaluationScheduler];
    [(HMDResidentSelectionManager *)self setBackgroundScheduler:v7];

    uint64_t v8 = [(HMDResidentSelectionManager *)self backgroundScheduler];
    [v8 setQualityOfService:17];

    [(HMDResidentSelectionManager *)self preferredResidentEvaluationDelay];
    double v10 = v9;
    id v11 = [(HMDResidentSelectionManager *)self backgroundScheduler];
    [v11 setInterval:v10];

    char v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      __int16 v22 = 2048;
      double v23 = v10;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling auto mode evaluation in %f", buf, 0x16u);
    }
    if (v3)
    {
      uint64_t v16 = [(HMDResidentSelectionManager *)v13 backgroundScheduler];
      [v16 setRepeats:1];
    }
    objc_initWeak((id *)buf, v13);
    long long v17 = [(HMDResidentSelectionManager *)v13 backgroundScheduler];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __74__HMDResidentSelectionManager__scheduleAutoModeEvaluationWithRetryNeeded___block_invoke;
    v18[3] = &unk_264A21510;
    objc_copyWeak(&v19, (id *)buf);
    [v17 scheduleWithBlock:v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

void __74__HMDResidentSelectionManager__scheduleAutoModeEvaluationWithRetryNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    char v6 = [WeakRetained queue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __74__HMDResidentSelectionManager__scheduleAutoModeEvaluationWithRetryNeeded___block_invoke_77;
    v10[3] = &unk_264A2F870;
    void v10[4] = v5;
    id v11 = v3;
    dispatch_async(v6, v10);
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      double v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v13 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Resident Selection Manager instance is gone", buf, 0xCu);
    }
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
  }
}

void __74__HMDResidentSelectionManager__scheduleAutoModeEvaluationWithRetryNeeded___block_invoke_77(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v11 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Kicking off an evaluation in Auto mode", buf, 0xCu);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__HMDResidentSelectionManager__scheduleAutoModeEvaluationWithRetryNeeded___block_invoke_78;
  v8[3] = &unk_264A2EE08;
  char v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [v6 triggerAutoModeEvaluationWithCompletion:v8];
}

void __74__HMDResidentSelectionManager__scheduleAutoModeEvaluationWithRetryNeeded___block_invoke_78(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v6 || (uint64_t v7 = [*(id *)(a1 + 32) weAreInResidentSelection], !v7))
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990](v7);
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      long long v17 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Auto mode evaluation failed. Will try again in sometime.", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    double v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v16 = 138543362;
      long long v17 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Auto mode evaluation is complete", (uint8_t *)&v16, 0xCu);
    }
    [*(id *)(a1 + 32) _removeScheduledAutoModeEvaluation];
  }
}

- (void)triggerAutoModeEvaluationWithCompletion:(id)a3
{
  id v4 = a3;
  if (-[HMDResidentSelectionManager devicesInHomeSupportResidentSelection](self, "devicesInHomeSupportResidentSelection")|| (-[HMDResidentSelectionManager context](self, "context"), id v5 = objc_claimAutoreleasedReturnValue(), v6 = [v5 homeSupportsResidentSelection], v5, (v6 & 1) != 0))
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __71__HMDResidentSelectionManager_triggerAutoModeEvaluationWithCompletion___block_invoke;
    v8[3] = &unk_264A214E8;
    id v9 = v4;
    [(HMDResidentSelectionManager *)self performSelectionInMode:3 preferredPrimaryResident:0 requireAutoUpdate:0 reason:7 completion:v8];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
  }
}

uint64_t __71__HMDResidentSelectionManager_triggerAutoModeEvaluationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)createResidentSelectionModeWithType:(unint64_t)a3
{
  id v5 = [(HMDResidentSelectionManager *)self dataSource];
  char v6 = [(HMDResidentSelectionManager *)self context];
  uint64_t v7 = [v5 createResidentSelectionModeWithType:a3 context:v6];

  return v7;
}

- (void)_handleModeChangeWithPreviousMode:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = [(HMDResidentSelectionManager *)self context];
  int v6 = [v5 isActingAsResident];

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      double v10 = HMFGetLogIdentifier();
      if (a3 - 1 > 2) {
        id v11 = @"unknown";
      }
      else {
        id v11 = off_264A29950[a3 - 1];
      }
      uint64_t v12 = v11;
      uint64_t v13 = [(HMDResidentSelectionManager *)v8 currentModeType];
      if ((unint64_t)(v13 - 1) > 2) {
        uint64_t v14 = @"unknown";
      }
      else {
        uint64_t v14 = off_264A29950[v13 - 1];
      }
      uint64_t v15 = v14;
      int v17 = 138543874;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      __int16 v22 = v15;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@We just switched from %@ to %@.", (uint8_t *)&v17, 0x20u);
    }
    int v16 = [(HMDResidentSelectionManager *)v8 currentResidentSelectionMode];
    [v16 configureAsAResidentWithRunPrimaryEvaluation:0];
  }
}

- (void)makeSureCurrentModeIsOfType:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = [(HMDResidentSelectionManager *)self currentResidentSelectionMode];
  uint64_t v6 = [v5 currentModeType];

  if (v6 != a3)
  {
    uint64_t v7 = [(HMDResidentSelectionManager *)self currentResidentSelectionMode];
    uint64_t v8 = [v7 currentModeType];

    id v9 = (void *)MEMORY[0x230FBD990]();
    double v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      if ((unint64_t)(v8 - 1) > 2) {
        uint64_t v13 = @"unknown";
      }
      else {
        uint64_t v13 = off_264A29950[v8 - 1];
      }
      uint64_t v14 = v13;
      if (a3 - 1 > 2) {
        uint64_t v15 = @"unknown";
      }
      else {
        uint64_t v15 = off_264A29950[a3 - 1];
      }
      int v16 = v15;
      int v21 = 138543874;
      __int16 v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      __int16 v25 = 2112;
      __int16 v26 = v16;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Switching from %@ to %@", (uint8_t *)&v21, 0x20u);
    }
    int v17 = [(HMDResidentSelectionManager *)v10 currentResidentSelectionMode];
    [v17 stop];

    uint64_t v18 = [(HMDResidentSelectionManager *)v10 createResidentSelectionModeWithType:a3];
    [(HMDResidentSelectionManager *)v10 setCurrentResidentSelectionMode:v18];

    __int16 v19 = [(HMDResidentSelectionManager *)v10 currentResidentSelectionMode];
    [v19 setDelegate:v10];

    [(HMDResidentSelectionManager *)v10 setCurrentModeType:a3];
    uint64_t v20 = [(HMDResidentSelectionManager *)v10 currentResidentSelectionMode];
    [v20 start];

    [(HMDResidentSelectionManager *)v10 _handleModeChangeWithPreviousMode:v8];
  }
}

- (BOOL)weAreTheOnlyActingResident
{
  v2 = [(HMDResidentSelectionManager *)self context];
  id v3 = [v2 residentStatusChannel];
  int v4 = [v3 isConnected];

  if (v4)
  {
    id v5 = [v2 currentResidentDevice];
    uint64_t v6 = [v5 device];
    uint64_t v7 = [v6 idsIdentifier];

    uint64_t v8 = [v2 residentsPresentOnStatusKit];
    if ([v8 count])
    {
      id v9 = [v2 residentsPresentOnStatusKit];
      if ([v9 count] == 1)
      {
        double v10 = [v2 residentsPresentOnStatusKit];
        id v11 = [v10 objectAtIndexedSubscript:0];
        char v12 = [v11 isEqual:v7];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 1;
  }
  if ([v2 isCurrentDeviceAvailableResident])
  {
    uint64_t v13 = [v2 availableResidentDevices];
    if ([v13 count] == 1) {
      char v14 = [v2 isActingAsResident];
    }
    else {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v12 & v14;
}

- (BOOL)weAreInResidentSelection
{
  return [(HMDResidentSelectionManager *)self currentModeType] == 2
      || [(HMDResidentSelectionManager *)self currentModeType] == 3;
}

- (void)evaluateSelectionMode
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(HMDResidentSelectionManager *)self context];
  if ([(HMDResidentSelectionManager *)self weAreTheOnlyActingResident]
    && ![(HMDResidentSelectionManager *)self weAreInResidentSelection])
  {
    uint64_t v6 = 3;
  }
  else if ([v3 homeSupportsResidentSelection])
  {
    int v4 = [(HMDResidentSelectionManager *)self residentSelectionInfoFromWorkingStore];
    uint64_t v5 = [v4 currentModeType];

    if (v5 == 2) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 3;
    }
  }
  else
  {
    uint64_t v6 = 1;
  }
  uint64_t v7 = [v3 residentSelectionInfo];
  BOOL v8 = [v7 currentModeType] == 3 || objc_msgSend(v7, "currentModeType") == 2;
  int v9 = [v3 homeSupportsResidentSelection];
  if (![(HMDResidentSelectionManager *)self weAreTheOnlyActingResident]
    || (v9 & v8 & 1) != 0)
  {
    [(HMDResidentSelectionManager *)self makeSureCurrentModeIsOfType:v6];
  }
  else
  {
    double v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    char v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v16 = v13;
      __int16 v17 = 2112;
      uint64_t v18 = v7;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@We are the only resident in the home and we are not in RS. Starting an Auto mode evaluation. Resident Selection info from the working store: %@", buf, 0x16u);
    }
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __52__HMDResidentSelectionManager_evaluateSelectionMode__block_invoke;
    v14[3] = &unk_264A2ED40;
    v14[4] = v11;
    [(HMDResidentSelectionManager *)v11 triggerAutoModeEvaluationWithCompletion:v14];
  }
}

void __52__HMDResidentSelectionManager_evaluateSelectionMode__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      double v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      char v12 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Auto mode evaluation to switch to RS while we were the only resident in the home failed. Going to Coordination", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 32) makeSureCurrentModeIsOfType:1];
  }
}

- (double)preferredResidentEvaluationDelay
{
  v2 = [(HMDResidentSelectionManager *)self idsServerBag];
  id v3 = [v2 residentSelectionPreferredResidentEvaluationDelay];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 3600.0;
  }

  return v5;
}

- (id)notificationCenter
{
  v2 = [(HMDResidentSelectionManager *)self dataSource];
  id v3 = [v2 notificationCenter];

  return v3;
}

- (void)_registerForMessages
{
  v10[2] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(HMDResidentSelectionManager *)self context];
  double v4 = [v3 messageDispatcher];
  double v5 = [v3 home];
  id v6 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  objc_msgSend(v6, "setRoles:", objc_msgSend(v6, "roles") | 4);
  uint64_t v7 = (void *)[v6 copy];
  id v8 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v5 userPrivilege:4 remoteAccessRequired:0];
  v10[0] = v7;
  v10[1] = v8;
  int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  [v4 registerForMessage:@"residentSelection.preferred" receiver:self policies:v9 selector:sel_handleSelectedAsPreferredMessage_];
}

- (BOOL)allowExternalUpdateOfPrimaryResidentTo:(id)a3 selectionTimestamp:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDResidentSelectionManager *)self currentResidentSelectionMode];

  if (v8)
  {
    int v9 = [(HMDResidentSelectionManager *)self currentResidentSelectionMode];
    char v10 = [v9 allowExternalUpdateOfPrimaryResidentTo:v6 selectionTimestamp:v7];
  }
  else
  {
    int v11 = (void *)MEMORY[0x230FBD990]();
    char v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      char v14 = HMFGetLogIdentifier();
      uint64_t v15 = [(HMDResidentSelectionManager *)v12 currentModeType];
      if ((unint64_t)(v15 - 1) > 2) {
        int v16 = @"unknown";
      }
      else {
        int v16 = off_264A29950[v15 - 1];
      }
      __int16 v17 = v16;
      int v19 = 138543874;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 2112;
      uint64_t v24 = v17;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Allowing external update of primary resident to: %@ in mode: %@.", (uint8_t *)&v19, 0x20u);
    }
    char v10 = 1;
  }

  return v10;
}

- (id)residentsNotPresentInPreferredResidentsList:(id)a3
{
  id v4 = a3;
  double v5 = [(HMDResidentSelectionManager *)self currentResidentSelectionMode];
  id v6 = [v4 residentIDSIdentifiers];

  id v7 = [v5 residentsNotPresentInPreferredResidentsList:v6];

  return v7;
}

- (BOOL)residentIsLocallyReachable:(id)a3
{
  id v4 = a3;
  double v5 = [(HMDResidentSelectionManager *)self currentResidentSelectionMode];
  char v6 = [v5 residentIsLocallyReachable:v4];

  return v6;
}

- (id)locallyReachableResidents
{
  v2 = [(HMDResidentSelectionManager *)self currentResidentSelectionMode];
  id v3 = [v2 locallyReachableResidents];

  return v3;
}

- (id)dumpState
{
  v2 = [(HMDResidentSelectionManager *)self currentResidentSelectionMode];
  id v3 = [v2 dumpState];

  return v3;
}

- (void)primaryResidentChanged:(id)a3 previousResidentDevice:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isCurrentDevice]
    && ![(HMDResidentSelectionManager *)self weAreInResidentSelection])
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    int v9 = self;
    char v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      char v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@We are the new primary and the home is in REv2. Scheduling an Auto mode evaluation.", (uint8_t *)&v13, 0xCu);
    }
    [(HMDResidentSelectionManager *)v9 _scheduleAutoModeEvaluationWithRetryNeeded:1];
  }
  else if (([v6 isCurrentDevice] & 1) == 0)
  {
    [(HMDResidentSelectionManager *)self _removeScheduledAutoModeEvaluation];
  }
  char v12 = [(HMDResidentSelectionManager *)self currentResidentSelectionMode];
  [v12 primaryResidentChanged:v6 previousResidentDevice:v7];
}

- (void)performSelectionInMode:(unint64_t)a3 preferredPrimaryResident:(id)a4 requireAutoUpdate:(BOOL)a5 reason:(unint64_t)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a7;
  unint64_t v14 = a3 - 1;
  if (a3 == 1
    && ([(HMDResidentSelectionManager *)self context],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v15 homeSupportsResidentSelection],
        v15,
        v16))
  {
    __int16 v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = self;
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v28 = 138543362;
      uint64_t v29 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform a Coordination Election after the home has switched to Resident Selection.", (uint8_t *)&v28, 0xCu);
    }
  }
  else
  {
    __int16 v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = self;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      if (v14 > 2) {
        uint64_t v25 = @"unknown";
      }
      else {
        uint64_t v25 = off_264A29950[v14];
      }
      __int16 v26 = v25;
      int v28 = 138543874;
      uint64_t v29 = v24;
      __int16 v30 = 2112;
      v31 = v26;
      __int16 v32 = 2112;
      id v33 = v12;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Starting a selection in mode: %@ with preferred primary: %@.", (uint8_t *)&v28, 0x20u);
    }
    [(HMDResidentSelectionManager *)v22 makeSureCurrentModeIsOfType:a3];
    uint64_t v27 = [(HMDResidentSelectionManager *)v22 currentResidentSelectionMode];
    [v27 performSelectionWithPreferredPrimaryResident:v12 requireAutoUpdate:v9 reason:a6 completion:v13];
  }
}

- (void)didUpdateResidentStatus:(id)a3 residentsFound:(id)a4 residentsLost:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HMDResidentSelectionManager *)self currentResidentSelectionMode];
  [v11 didUpdateResidentStatus:v10 residentsFound:v9 residentsLost:v8];
}

- (void)didUpdateResidentSelectionVersion
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  double v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [(HMDResidentSelectionManager *)v4 context];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 1024;
    int v11 = [v7 homeSupportsResidentSelection];
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Home's resident selection version updated. Home supports Resident Selection: %d.", (uint8_t *)&v8, 0x12u);
  }
  [(HMDResidentSelectionManager *)v4 evaluateSelectionMode];
}

- (void)didRemoveResidentsFromHome:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(HMDResidentSelectionManager *)self context];
  id v6 = [v5 primaryResidentDevice];
  id v7 = (void *)MEMORY[0x230FBD990]();
  int v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    __int16 v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v17 = v10;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Residents: %@ are removed from the home.", buf, 0x16u);
  }
  if (![(HMDResidentSelectionManager *)v8 weAreInResidentSelection]
    && [v6 isCurrentDevice])
  {
    int v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = v8;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      unint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v17 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Evaluating if we are ready to switch to Resident Selection after the removal.", buf, 0xCu);
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __58__HMDResidentSelectionManager_didRemoveResidentsFromHome___block_invoke;
    v15[3] = &unk_264A2ED40;
    v15[4] = v12;
    [(HMDResidentSelectionManager *)v12 triggerAutoModeEvaluationWithCompletion:v15];
  }
}

void __58__HMDResidentSelectionManager_didRemoveResidentsFromHome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Attempt to switch to RS triggered by the removal of a resident failed with error: %@.", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)currentDeviceReadyAsAResident
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    uint64_t v7 = [(HMDResidentSelectionManager *)v4 currentModeType];
    if ((unint64_t)(v7 - 1) > 2) {
      id v8 = @"unknown";
    }
    else {
      id v8 = off_264A29950[v7 - 1];
    }
    id v9 = v8;
    int v11 = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Notified that current device is ready as a resident. Current Mode: %@", (uint8_t *)&v11, 0x16u);
  }
  [(HMDResidentSelectionManager *)v4 _registerForMessages];
  [(HMDResidentSelectionManager *)v4 evaluateSelectionMode];
  __int16 v10 = [(HMDResidentSelectionManager *)v4 currentResidentSelectionMode];
  [v10 currentDeviceReadyAsAResident];
}

- (void)stop
{
  id v3 = [(HMDResidentSelectionManager *)self currentResidentSelectionMode];
  [v3 stop];

  id v5 = [(HMDResidentSelectionManager *)self context];
  id v4 = [v5 messageDispatcher];
  [v4 deregisterReceiver:self];
}

- (void)start
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting.", (uint8_t *)&v7, 0xCu);
  }
  [(HMDResidentSelectionManager *)v4 evaluateSelectionMode];
}

- (HMDPreferredResidentsList)localPreferredResidentsList
{
  v2 = [(HMDResidentSelectionManager *)self currentResidentSelectionMode];
  id v3 = [v2 localPreferredResidentsList];

  return (HMDPreferredResidentsList *)v3;
}

- (HMDResidentSelectionManager)initWithContext:(id)a3 dataSource:(id)a4
{
  id v6 = (HMDResidentSelectionManagerDataSource *)a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDResidentSelectionManager;
  id v7 = a3;
  id v8 = [(HMDResidentSelectionManager *)&v16 init];
  objc_storeWeak((id *)&v8->_context, v7);
  uint64_t v9 = objc_msgSend(v7, "queue", v16.receiver, v16.super_class);

  queue = v8->_queue;
  v8->_queue = (OS_dispatch_queue *)v9;

  dataSource = v8->_dataSource;
  v8->_dataSource = v6;
  uint64_t v12 = v6;

  currentResidentSelectionMode = v8->_currentResidentSelectionMode;
  v8->_currentResidentSelectionMode = 0;

  v8->_currentModeType = 0;
  residentSelectionInfoFromWorkingStore = v8->_residentSelectionInfoFromWorkingStore;
  v8->_residentSelectionInfoFromWorkingStore = 0;

  return v8;
}

- (HMDResidentSelectionManager)initWithContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(HMDResidentSelectionManagerDefaultDataSource);
  id v6 = [(HMDResidentSelectionManager *)self initWithContext:v4 dataSource:v5];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t34_140569 != -1) {
    dispatch_once(&logCategory__hmf_once_t34_140569, &__block_literal_global_140570);
  }
  v2 = (void *)logCategory__hmf_once_v35_140571;
  return v2;
}

void __42__HMDResidentSelectionManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v35_140571;
  logCategory__hmf_once_v35_140571 = v0;
}

@end