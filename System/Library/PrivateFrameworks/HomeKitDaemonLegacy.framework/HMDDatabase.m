@interface HMDDatabase
+ (HMDDatabase)cameraClipsDatabase;
+ (HMDDatabase)defaultDatabase;
+ (NSURL)defaultLocalDatabaseFileURL;
+ (id)logCategory;
+ (void)registerQueries;
- (BOOL)hasStarted;
- (HMBCloudDatabase)cloudDatabase;
- (HMBLocalDatabase)localDatabase;
- (HMDDatabase)initWithFileURL:(id)a3 cloudConfiguration:(id)a4;
- (HMDDatabase)initWithLocalDatabase:(id)a3 cloudDatabase:(id)a4 logEventSubmitter:(id)a5;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSHashTable)delegates;
- (NSMapTable)zoneDelegatesByLocalZone;
- (id)acceptInvitation:(id)a3;
- (id)cloudDatabase:(id)a3 willRemoveZoneWithID:(id)a4;
- (id)existingPrivateZonesWithName:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6;
- (id)existingSharedZoneIDWithName:(id)a3;
- (id)logIdentifier;
- (id)mergedActionFutureForActionFutures:(id)a3;
- (id)privateZonesWithName:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6;
- (id)registerSharedSubscriptionForExternalRecordType:(id)a3;
- (id)removeLocalAndCloudDataForLocalZone:(id)a3;
- (id)removePrivateZonesWithName:(id)a3;
- (id)removeSharedZonesWithName:(id)a3;
- (id)removeZonesWithID:(id)a3 isPrivate:(BOOL)a4;
- (id)sharedZonesWithID:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6;
- (id)synchronizeSharedZones;
- (id)unregisterSharedSubscriptionForExternalRecordType:(id)a3;
- (id)zonesWithID:(id)a3 isPrivate:(BOOL)a4 shouldCreate:(BOOL)a5 configuration:(id)a6 delegate:(id)a7 error:(id *)a8;
- (void)addDelegate:(id)a3;
- (void)addZoneDelegate:(id)a3 forLocalZone:(id)a4;
- (void)cloudDatabase:(id)a3 didCreateZoneWithID:(id)a4;
- (void)cloudDatabase:(id)a3 didReceiveMessageWithUserInfo:(id)a4;
- (void)cloudDatabase:(id)a3 didRemoveZoneWithID:(id)a4;
- (void)cloudDatabase:(id)a3 encounteredError:(id)a4 withOperation:(id)a5 onContainer:(id)a6;
- (void)cloudDatabase:(id)a3 encounteredError:(id)a4 withOperation:(id)a5 onZone:(id)a6;
- (void)cloudZone:(id)a3 didEncounterZoneDisabledError:(id)a4;
- (void)cloudZone:(id)a3 didRemoveParticipantWithClientIdentifier:(id)a4;
- (void)cloudZone:(id)a3 didUpdateParticipantWithClientIdentifier:(id)a4;
- (void)dealloc;
- (void)localDatabase:(id)a3 willRemoveZoneWithID:(id)a4;
- (void)localZone:(id)a3 didCompleteProcessingWithResult:(id)a4;
- (void)performDelegateCallback:(id)a3;
- (void)performZoneDelegateCallback:(id)a3 forLocalZone:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)removeZoneDelegate:(id)a3 forLocalZone:(id)a4;
- (void)setHasStarted:(BOOL)a3;
- (void)start;
@end

@implementation HMDDatabase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_zoneDelegatesByLocalZone, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_cloudDatabase, 0);
  objc_storeStrong((id *)&self->_localDatabase, 0);
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 48, 1);
}

- (HMBCloudDatabase)cloudDatabase
{
  return (HMBCloudDatabase *)objc_getProperty(self, a2, 24, 1);
}

- (HMBLocalDatabase)localDatabase
{
  return (HMBLocalDatabase *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDDatabase *)self cloudDatabase];
  v3 = [v2 containerID];
  v4 = [v3 containerIdentifier];

  return v4;
}

- (void)cloudZone:(id)a3 didEncounterZoneDisabledError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  v10 = objc_msgSend(v9, "localZone", v11, 3221225472, __55__HMDDatabase_cloudZone_didEncounterZoneDisabledError___block_invoke, &unk_1E6A0E238);
  [(HMDDatabase *)self performZoneDelegateCallback:&v11 forLocalZone:v10];
}

void __55__HMDDatabase_cloudZone_didEncounterZoneDisabledError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 cloudZone:*(void *)(a1 + 32) didEncounterZoneDisabledError:*(void *)(a1 + 40)];
  }
}

- (void)cloudZone:(id)a3 didRemoveParticipantWithClientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  v10 = objc_msgSend(v9, "localZone", v11, 3221225472, __66__HMDDatabase_cloudZone_didRemoveParticipantWithClientIdentifier___block_invoke, &unk_1E6A0E238);
  [(HMDDatabase *)self performZoneDelegateCallback:&v11 forLocalZone:v10];
}

void __66__HMDDatabase_cloudZone_didRemoveParticipantWithClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 cloudZone:*(void *)(a1 + 32) didRemoveParticipantWithClientIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)cloudZone:(id)a3 didUpdateParticipantWithClientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  v10 = objc_msgSend(v9, "localZone", v11, 3221225472, __66__HMDDatabase_cloudZone_didUpdateParticipantWithClientIdentifier___block_invoke, &unk_1E6A0E238);
  [(HMDDatabase *)self performZoneDelegateCallback:&v11 forLocalZone:v10];
}

void __66__HMDDatabase_cloudZone_didUpdateParticipantWithClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 cloudZone:*(void *)(a1 + 32) didUpdateParticipantWithClientIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)localZone:(id)a3 didCompleteProcessingWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__HMDDatabase_localZone_didCompleteProcessingWithResult___block_invoke;
  v10[3] = &unk_1E6A0E238;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(HMDDatabase *)self performZoneDelegateCallback:v10 forLocalZone:v9];
}

void __57__HMDDatabase_localZone_didCompleteProcessingWithResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 localZone:*(void *)(a1 + 32) didCompleteProcessingWithResult:*(void *)(a1 + 40)];
  }
}

- (void)cloudDatabase:(id)a3 encounteredError:(id)a4 withOperation:(id)a5 onContainer:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v13 = [(HMDDatabase *)self logEventSubmitter];
  v10 = [HMDDatabaseCKOperationCompletionEvent alloc];
  id v11 = [v8 containerIdentifier];

  id v12 = [(HMDDatabaseCKOperationCompletionEvent *)v10 initWithContainerIdentifier:v11];
  [v13 submitLogEvent:v12 error:v9];
}

- (void)cloudDatabase:(id)a3 encounteredError:(id)a4 withOperation:(id)a5 onZone:(id)a6
{
  id v7 = a4;
  id v9 = [(HMDDatabase *)self logEventSubmitter];
  id v8 = objc_alloc_init(HMDBackingStoreCKOperationZoneCompletionEvent);
  [v9 submitLogEvent:v8 error:v7];
}

- (void)cloudDatabase:(id)a3 didReceiveMessageWithUserInfo:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Cloud database %@ received message with user info %@", buf, 0x20u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__HMDDatabase_cloudDatabase_didReceiveMessageWithUserInfo___block_invoke;
  v13[3] = &unk_1E6A0E1E8;
  v13[4] = v9;
  id v14 = v7;
  id v12 = v7;
  [(HMDDatabase *)v9 performDelegateCallback:v13];
}

void __59__HMDDatabase_cloudDatabase_didReceiveMessageWithUserInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 database:*(void *)(a1 + 32) didReceiveMessageWithUserInfo:*(void *)(a1 + 40)];
  }
}

- (void)cloudDatabase:(id)a3 didRemoveZoneWithID:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    __int16 v17 = v11;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Cloud database %@ removed zone with zone ID %@", buf, 0x20u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__HMDDatabase_cloudDatabase_didRemoveZoneWithID___block_invoke;
  v13[3] = &unk_1E6A0E1E8;
  id v14 = v7;
  v15 = v9;
  id v12 = v7;
  [(HMDDatabase *)v9 performDelegateCallback:v13];
}

void __49__HMDDatabase_cloudDatabase_didRemoveZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [*(id *)(a1 + 32) scope];
    if (v3 == 3)
    {
      uint64_t v11 = *(void *)(a1 + 40);
      v5 = [*(id *)(a1 + 32) zoneID];
      id v6 = [v5 zoneName];
      id v7 = v12;
      uint64_t v8 = v11;
      id v9 = v6;
      uint64_t v10 = 0;
    }
    else
    {
      if (v3 != 2) {
        goto LABEL_7;
      }
      uint64_t v4 = *(void *)(a1 + 40);
      v5 = [*(id *)(a1 + 32) zoneID];
      id v6 = [v5 zoneName];
      id v7 = v12;
      uint64_t v8 = v4;
      id v9 = v6;
      uint64_t v10 = 1;
    }
    [v7 database:v8 didRemoveZoneWithName:v9 isPrivate:v10];
  }
LABEL_7:
}

- (id)cloudDatabase:(id)a3 willRemoveZoneWithID:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Cloud database %@ will remove zone with zone ID %@", buf, 0x20u);
  }
  id v12 = [MEMORY[0x1E4F1CA48] array];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __50__HMDDatabase_cloudDatabase_willRemoveZoneWithID___block_invoke;
  v17[3] = &unk_1E6A0E210;
  id v18 = v7;
  id v19 = v12;
  __int16 v20 = v9;
  id v13 = v12;
  id v14 = v7;
  [(HMDDatabase *)v9 performDelegateCallback:v17];
  v15 = [MEMORY[0x1E4F7A0D8] chainFutures:v13];

  return v15;
}

void __50__HMDDatabase_cloudDatabase_willRemoveZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [*(id *)(a1 + 32) scope];
    if (v3 == 3)
    {
      v5 = *(void **)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      id v6 = [*(id *)(a1 + 32) zoneID];
      id v7 = [v6 zoneName];
      uint64_t v8 = v14;
      uint64_t v9 = v12;
      uint64_t v10 = v7;
      uint64_t v11 = 0;
    }
    else
    {
      if (v3 != 2) {
        goto LABEL_7;
      }
      v5 = *(void **)(a1 + 40);
      uint64_t v4 = *(void *)(a1 + 48);
      id v6 = [*(id *)(a1 + 32) zoneID];
      id v7 = [v6 zoneName];
      uint64_t v8 = v14;
      uint64_t v9 = v4;
      uint64_t v10 = v7;
      uint64_t v11 = 1;
    }
    id v13 = [v8 database:v9 willRemoveZoneWithName:v10 isPrivate:v11];
    [v5 addObject:v13];
  }
LABEL_7:
}

- (void)cloudDatabase:(id)a3 didCreateZoneWithID:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    __int16 v17 = v11;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Cloud database %@ created zone with zone ID %@", buf, 0x20u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__HMDDatabase_cloudDatabase_didCreateZoneWithID___block_invoke;
  v13[3] = &unk_1E6A0E1E8;
  id v14 = v7;
  v15 = v9;
  id v12 = v7;
  [(HMDDatabase *)v9 performDelegateCallback:v13];
}

void __49__HMDDatabase_cloudDatabase_didCreateZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [*(id *)(a1 + 32) scope];
    if (v3 == 3)
    {
      uint64_t v11 = *(void *)(a1 + 40);
      v5 = [*(id *)(a1 + 32) zoneID];
      id v6 = [v5 zoneName];
      id v7 = v12;
      uint64_t v8 = v11;
      uint64_t v9 = v6;
      uint64_t v10 = 0;
    }
    else
    {
      if (v3 != 2) {
        goto LABEL_7;
      }
      uint64_t v4 = *(void *)(a1 + 40);
      v5 = [*(id *)(a1 + 32) zoneID];
      id v6 = [v5 zoneName];
      id v7 = v12;
      uint64_t v8 = v4;
      uint64_t v9 = v6;
      uint64_t v10 = 1;
    }
    [v7 database:v8 didCreateZoneWithName:v9 isPrivate:v10];
  }
LABEL_7:
}

- (void)localDatabase:(id)a3 willRemoveZoneWithID:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = 138543874;
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Local database %@ will remove zone with ID: %@", (uint8_t *)&v12, 0x20u);
  }
}

- (id)mergedActionFutureForActionFutures:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F7A0D8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = (void *)MEMORY[0x1E4F7A0D8];
  id v7 = [MEMORY[0x1E4F7A0F0] immediateScheduler];
  uint64_t v8 = [v6 combineAllFutures:v4 ignoringErrors:0 scheduler:v7];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__HMDDatabase_mergedActionFutureForActionFutures___block_invoke;
  v14[3] = &unk_1E6A13FD8;
  id v9 = v5;
  id v15 = v9;
  uint64_t v10 = [v8 addSuccessBlock:v14];
  uint64_t v11 = [v9 errorOnlyCompletionHandlerAdapter];
  id v12 = (id)[v10 addFailureBlock:v11];

  return v9;
}

void __50__HMDDatabase_mergedActionFutureForActionFutures___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F69EC0];
  id v4 = a2;
  id v6 = objc_alloc_init(v3);
  uint64_t v5 = objc_msgSend(v4, "na_any:", &__block_literal_global_91430);

  [v6 setShouldUpdateClients:v5];
  [*(id *)(a1 + 32) finishWithResult:v6];
}

uint64_t __50__HMDDatabase_mergedActionFutureForActionFutures___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 shouldUpdateClients];
}

- (void)performZoneDelegateCallback:(id)a3 forLocalZone:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void))a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v9 = [(HMDDatabase *)self zoneDelegatesByLocalZone];
  uint64_t v10 = [v9 objectForKey:v7];
  uint64_t v11 = [v10 allObjects];

  os_unfair_lock_unlock(p_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        v6[2](v6, *(void *)(*((void *)&v16 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)removeZoneDelegate:(id)a3 forLocalZone:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v8 = [(HMDDatabase *)self zoneDelegatesByLocalZone];
  id v9 = [v8 objectForKey:v6];

  [v9 removeObject:v11];
  if (![v9 count])
  {
    uint64_t v10 = [(HMDDatabase *)self zoneDelegatesByLocalZone];
    [v10 removeObjectForKey:v6];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)addZoneDelegate:(id)a3 forLocalZone:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v8 = [(HMDDatabase *)self zoneDelegatesByLocalZone];
  id v9 = [v8 objectForKey:v6];

  if (!v9)
  {
    id v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v10 = [(HMDDatabase *)self zoneDelegatesByLocalZone];
    [v10 setObject:v9 forKey:v6];
  }
  [v9 addObject:v11];

  os_unfair_lock_unlock(p_lock);
}

- (NSMapTable)zoneDelegatesByLocalZone
{
  os_unfair_lock_assert_owner(&self->_lock);
  zoneDelegatesByLocalZone = self->_zoneDelegatesByLocalZone;
  return zoneDelegatesByLocalZone;
}

- (void)performDelegateCallback:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMDDatabase *)self delegates];
  id v7 = [v6 allObjects];

  os_unfair_lock_unlock(p_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (NSHashTable)delegates
{
  os_unfair_lock_assert_owner(&self->_lock);
  delegates = self->_delegates;
  return delegates;
}

- (id)removeZonesWithID:(id)a3 isPrivate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    uint64_t v11 = @"shared";
    *(_DWORD *)buf = 138543874;
    v41 = v10;
    __int16 v42 = 2112;
    if (v4) {
      uint64_t v11 = @"private";
    }
    v43 = v11;
    __int16 v44 = 2112;
    id v45 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing %@ zones with ID %@", buf, 0x20u);
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F69E50]);
  long long v13 = [(HMDDatabase *)v8 cloudDatabase];
  long long v14 = v13;
  if (v4)
  {
    uint64_t v39 = 0;
    long long v15 = (id *)&v39;
    uint64_t v16 = [v13 openExistingPrivateZoneWithID:v6 configuration:v12 delegate:0 error:&v39];
  }
  else
  {
    uint64_t v38 = 0;
    long long v15 = (id *)&v38;
    uint64_t v16 = [v13 openExistingSharedZoneWithID:v6 configuration:v12 delegate:0 error:&v38];
  }
  uint64_t v17 = (void *)v16;
  id v18 = *v15;

  if (v17)
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F69EE0]);
    [v19 setDelegate:v8];
    [v19 setCreateIfNeeded:0];
    __int16 v20 = [(HMDDatabase *)v8 localDatabase];
    id v37 = v18;
    uint64_t v21 = [v20 openZoneWithMirror:v17 configuration:v19 error:&v37];
    id v22 = v37;

    if (v21)
    {
      uint64_t v23 = [(HMDDatabase *)v8 removeLocalAndCloudDataForLocalZone:v21];
    }
    else
    {
      v30 = (void *)MEMORY[0x1D9452090]();
      v31 = v8;
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = v36 = v30;
        v34 = @"shared";
        *(_DWORD *)buf = 138544130;
        v41 = v33;
        __int16 v42 = 2112;
        if (v4) {
          v34 = @"private";
        }
        v43 = v34;
        __int16 v44 = 2112;
        id v45 = v6;
        __int16 v46 = 2112;
        id v47 = v22;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to open %@ local zone with zoneID %@: %@", buf, 0x2Au);

        v30 = v36;
      }

      uint64_t v23 = [MEMORY[0x1E4F7A0D8] futureWithError:v22];
    }
    v29 = (void *)v23;

    id v18 = v22;
  }
  else
  {
    id v24 = (void *)MEMORY[0x1D9452090]();
    __int16 v25 = v8;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      v28 = @"shared";
      *(_DWORD *)buf = 138544130;
      v41 = v27;
      __int16 v42 = 2112;
      if (v4) {
        v28 = @"private";
      }
      v43 = v28;
      __int16 v44 = 2112;
      id v45 = v6;
      __int16 v46 = 2112;
      id v47 = v18;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to open %@ cloud zone with zoneID %@: %@", buf, 0x2Au);
    }
    v29 = [MEMORY[0x1E4F7A0D8] futureWithError:v18];
  }

  return v29;
}

- (id)zonesWithID:(id)a3 isPrivate:(BOOL)a4 shouldCreate:(BOOL)a5 configuration:(id)a6 delegate:(id)a7 error:(id *)a8
{
  BOOL v10 = a5;
  BOOL v11 = a4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  id v44 = a7;
  long long v15 = [(HMDDatabase *)self cloudDatabase];
  uint64_t v16 = v15;
  if (v11)
  {
    if (v10)
    {
      uint64_t v48 = 0;
      uint64_t v17 = (id *)&v48;
      uint64_t v18 = [v15 openOrCreatePrivateZoneWithID:v13 configuration:v14 delegate:self error:&v48];
    }
    else
    {
      uint64_t v47 = 0;
      uint64_t v17 = (id *)&v47;
      uint64_t v18 = [v15 openExistingPrivateZoneWithID:v13 configuration:v14 delegate:self error:&v47];
    }
  }
  else
  {
    uint64_t v46 = 0;
    uint64_t v17 = (id *)&v46;
    uint64_t v18 = [v15 openExistingSharedZoneWithID:v13 configuration:v14 delegate:self error:&v46];
  }
  id v19 = (void *)v18;
  id v20 = *v17;

  if (v19)
  {
    id v42 = v14;
    id v21 = objc_alloc_init(MEMORY[0x1E4F69EE0]);
    [v21 setDelegate:self];
    [v21 setCreateIfNeeded:1];
    id v22 = [(HMDDatabase *)self localDatabase];
    id v45 = v20;
    uint64_t v23 = [v22 openZoneWithMirror:v19 configuration:v21 error:&v45];
    id v24 = v45;

    __int16 v25 = (void *)MEMORY[0x1D9452090]();
    id v26 = self;
    uint64_t v27 = HMFGetOSLogHandle();
    v28 = v27;
    if (v23)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v29 = HMFGetLogIdentifier();
        v30 = @"shared";
        *(_DWORD *)buf = 138544130;
        v50 = v29;
        __int16 v51 = 2112;
        if (v11) {
          v30 = @"private";
        }
        v52 = v30;
        __int16 v53 = 2112;
        id v54 = v13;
        __int16 v55 = 2112;
        id v56 = v44;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Successfully opened %@ zones with zoneID: %@, delegate: %@", buf, 0x2Au);
      }
      v31 = v44;
      if (v44) {
        [(HMDDatabase *)v26 addZoneDelegate:v44 forLocalZone:v23];
      }
      v32 = [[HMDDatabaseFetchZonesResult alloc] initWithLocalZone:v23 cloudZone:v19];
    }
    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = HMFGetLogIdentifier();
        v40 = @"shared";
        *(_DWORD *)buf = 138544130;
        v50 = v39;
        __int16 v51 = 2112;
        if (v11) {
          v40 = @"private";
        }
        v52 = v40;
        __int16 v53 = 2112;
        id v54 = v13;
        __int16 v55 = 2112;
        id v56 = v24;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to open %@ local zone with zoneID %@: %@", buf, 0x2Au);
      }
      v32 = 0;
      if (a8) {
        *a8 = v24;
      }
      v31 = v44;
    }

    id v14 = v42;
  }
  else
  {
    v33 = (void *)MEMORY[0x1D9452090]();
    v34 = self;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v37 = v36 = v14;
      uint64_t v38 = @"shared";
      *(_DWORD *)buf = 138544130;
      v50 = v37;
      __int16 v51 = 2112;
      if (v11) {
        uint64_t v38 = @"private";
      }
      v52 = v38;
      __int16 v53 = 2112;
      id v54 = v13;
      __int16 v55 = 2112;
      id v56 = v20;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to open %@ cloud zone with zoneID %@: %@", buf, 0x2Au);

      id v14 = v36;
    }

    if (a8)
    {
      id v24 = v20;
      v32 = 0;
      *a8 = v24;
    }
    else
    {
      v32 = 0;
      id v24 = v20;
    }
    v31 = v44;
  }

  return v32;
}

- (id)acceptInvitation:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Accepting sharing invitation %@", (uint8_t *)&v12, 0x16u);
  }
  [(HMDDatabase *)v6 start];
  uint64_t v9 = [(HMDDatabase *)v6 cloudDatabase];
  BOOL v10 = [v9 acceptInvitation:v4];

  return v10;
}

- (id)removeLocalAndCloudDataForLocalZone:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing local and cloud data for local zone %@", buf, 0x16u);
  }
  uint64_t v9 = [(HMDDatabase *)v6 localDatabase];
  BOOL v10 = [v9 removeZone:v4];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__HMDDatabase_removeLocalAndCloudDataForLocalZone___block_invoke;
  v14[3] = &unk_1E6A12A80;
  void v14[4] = v6;
  id v15 = v4;
  id v11 = v4;
  int v12 = [v10 addCompletionBlock:v14];

  return v12;
}

void __51__HMDDatabase_removeLocalAndCloudDataForLocalZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  BOOL v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      int v18 = 138543618;
      id v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      id v13 = "%{public}@Successfully removed local and cloud data for local zone %@";
      __int16 v14 = v10;
      os_log_type_t v15 = OS_LOG_TYPE_INFO;
      uint32_t v16 = 22;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v14, v15, v13, (uint8_t *)&v18, v16);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v11 = HMFGetLogIdentifier();
    uint64_t v17 = *(void *)(a1 + 40);
    int v18 = 138543874;
    id v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = v17;
    __int16 v22 = 2112;
    id v23 = v6;
    id v13 = "%{public}@Failed to remove local and cloud data for local zone %@: %@";
    __int16 v14 = v10;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 32;
    goto LABEL_6;
  }
}

- (id)removeSharedZonesWithName:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v18 = 138543618;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing shared zones with name %@", (uint8_t *)&v18, 0x16u);
  }
  uint64_t v9 = [(HMDDatabase *)v6 existingSharedZoneIDWithName:v4];
  BOOL v10 = v9;
  if (v9)
  {
    id v11 = [v9 zoneID];
    uint64_t v12 = [(HMDDatabase *)v6 removeZonesWithID:v11 isPrivate:0];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1D9452090]();
    __int16 v14 = v6;
    os_log_type_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint32_t v16 = HMFGetLogIdentifier();
      int v18 = 138543618;
      id v19 = v16;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Attempted to remove a non-existing shared zone with name: %@", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v12 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v12;
}

- (id)removePrivateZonesWithName:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v13 = 138543618;
    __int16 v14 = v8;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing private zones with name %@", (uint8_t *)&v13, 0x16u);
  }
  id v9 = objc_alloc(MEMORY[0x1E4F1A320]);
  BOOL v10 = (void *)[v9 initWithZoneName:v4 ownerName:*MEMORY[0x1E4F19C08]];
  id v11 = [(HMDDatabase *)v6 removeZonesWithID:v10 isPrivate:1];

  return v11;
}

- (id)synchronizeSharedZones
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    id v11 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Synchronizing shared zones", (uint8_t *)&v10, 0xCu);
  }
  [(HMDDatabase *)v4 start];
  id v7 = [(HMDDatabase *)v4 cloudDatabase];
  id v8 = [v7 synchronizeSharedZones];

  return v8;
}

- (id)sharedZonesWithID:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void *)MEMORY[0x1D9452090]();
  __int16 v14 = self;
  __int16 v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    int v20 = 138543618;
    id v21 = v16;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Fetching shared zones with zone ID %@", (uint8_t *)&v20, 0x16u);
  }
  [(HMDDatabase *)v14 start];
  uint64_t v17 = [v10 zoneID];
  int v18 = [(HMDDatabase *)v14 zonesWithID:v17 isPrivate:0 shouldCreate:0 configuration:v11 delegate:v12 error:a6];

  return v18;
}

- (id)existingSharedZoneIDWithName:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v25 = v8;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Finding shared zone ID with zone name %@", buf, 0x16u);
  }
  [(HMDDatabase *)v6 start];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = [(HMDDatabase *)v6 cloudDatabase];
  id v10 = [v9 sharedZoneIDs];

  id v11 = (id)[v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v10);
        }
        __int16 v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        __int16 v15 = [v14 zoneID];
        id v16 = [v15 zoneName];
        char v17 = [v16 isEqualToString:v4];

        if (v17)
        {
          id v11 = v14;
          goto LABEL_13;
        }
      }
      id v11 = (id)[v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v11;
}

- (id)privateZonesWithName:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void *)MEMORY[0x1D9452090]();
  __int16 v14 = self;
  __int16 v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    int v21 = 138543618;
    long long v22 = v16;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Fetching private zones with name %@", (uint8_t *)&v21, 0x16u);
  }
  [(HMDDatabase *)v14 start];
  id v17 = objc_alloc(MEMORY[0x1E4F1A320]);
  int v18 = (void *)[v17 initWithZoneName:v10 ownerName:*MEMORY[0x1E4F19C08]];
  long long v19 = [(HMDDatabase *)v14 zonesWithID:v18 isPrivate:1 shouldCreate:1 configuration:v11 delegate:v12 error:a6];

  return v19;
}

- (id)existingPrivateZonesWithName:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void *)MEMORY[0x1D9452090]();
  __int16 v14 = self;
  __int16 v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    int v21 = 138543618;
    long long v22 = v16;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Fetching existing private zones with name %@", (uint8_t *)&v21, 0x16u);
  }
  [(HMDDatabase *)v14 start];
  id v17 = objc_alloc(MEMORY[0x1E4F1A320]);
  int v18 = (void *)[v17 initWithZoneName:v10 ownerName:*MEMORY[0x1E4F19C08]];
  long long v19 = [(HMDDatabase *)v14 zonesWithID:v18 isPrivate:1 shouldCreate:0 configuration:v11 delegate:v12 error:a6];

  return v19;
}

- (id)unregisterSharedSubscriptionForExternalRecordType:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    int v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Unregistering shared subscription for external record type %@", (uint8_t *)&v12, 0x16u);
  }
  [(HMDDatabase *)v6 start];
  id v9 = [(HMDDatabase *)v6 cloudDatabase];
  id v10 = [v9 unregisterSharedSubscriptionForExternalRecordType:v4];

  return v10;
}

- (id)registerSharedSubscriptionForExternalRecordType:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    int v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering shared subscription for external record type %@", (uint8_t *)&v12, 0x16u);
  }
  [(HMDDatabase *)v6 start];
  id v9 = [(HMDDatabase *)v6 cloudDatabase];
  id v10 = [v9 registerSharedSubscriptionForExternalRecordType:v4];

  return v10;
}

- (void)start
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(HMDDatabase *)self hasStarted])
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    [(HMDDatabase *)self setHasStarted:1];
    os_unfair_lock_unlock(p_lock);
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v13 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting database", buf, 0xCu);
    }
    id v8 = [(HMDDatabase *)v5 cloudDatabase];
    id v9 = [v8 performInitialCloudSync];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __20__HMDDatabase_start__block_invoke;
    v11[3] = &unk_1E6A17A30;
    v11[4] = v5;
    id v10 = (id)[v9 addCompletionBlock:v11];
  }
}

void __20__HMDDatabase_start__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v11 = [v4 logEventSubmitter];
  id v6 = [HMDDatabaseCKOperationCompletionEvent alloc];
  id v7 = [*(id *)(a1 + 32) cloudDatabase];
  id v8 = [v7 containerID];
  id v9 = [v8 containerIdentifier];
  id v10 = [(HMDDatabaseCKOperationCompletionEvent *)v6 initWithContainerIdentifier:v9];
  [v11 submitLogEvent:v10 error:v5];
}

- (void)removeDelegate:(id)a3
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v5 = [(HMDDatabase *)self delegates];
  [v5 removeObject:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)addDelegate:(id)a3
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v5 = [(HMDDatabase *)self delegates];
  [v5 addObject:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating database", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDDatabase;
  [(HMDDatabase *)&v7 dealloc];
}

- (HMDDatabase)initWithLocalDatabase:(id)a3 cloudDatabase:(id)a4 logEventSubmitter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDDatabase;
  int v12 = [(HMDDatabase *)&v19 init];
  int v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_localDatabase, a3);
    [(HMBLocalDatabase *)v13->_localDatabase setDelegate:v13];
    objc_storeStrong((id *)&v13->_cloudDatabase, a4);
    [(HMBCloudDatabase *)v13->_cloudDatabase setDelegate:v13];
    uint64_t v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegates = v13->_delegates;
    v13->_delegates = (NSHashTable *)v14;

    uint64_t v16 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    zoneDelegatesByLocalZone = v13->_zoneDelegatesByLocalZone;
    v13->_zoneDelegatesByLocalZone = (NSMapTable *)v16;

    objc_storeStrong((id *)&v13->_logEventSubmitter, a5);
  }

  return v13;
}

- (HMDDatabase)initWithFileURL:(id)a3 cloudConfiguration:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[HMDHomeKitVersion currentVersion];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F69E88]) initWithDataVersion:v8 legacyDataVersion:v8];
  id v10 = objc_alloc_init(MEMORY[0x1E4F69ED8]);
  [v10 setModelContainer:v9];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F69E68]) initWithDatastorePath:v6 configuration:v10];
  if (v11)
  {
    int v12 = (void *)[objc_alloc(MEMORY[0x1E4F69E38]) initWithLocalDatabase:v11 configuration:v7];
    if (v12)
    {
      int v13 = +[HMDMetricsManager sharedLogEventSubmitter];
      self = [(HMDDatabase *)self initWithLocalDatabase:v11 cloudDatabase:v12 logEventSubmitter:v13];

      uint64_t v14 = self;
    }
    else
    {
      int v18 = (void *)MEMORY[0x1D9452090]();
      self = self;
      objc_super v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        long long v20 = v22 = v18;
        *(_DWORD *)buf = 138543618;
        id v24 = v20;
        __int16 v25 = 2112;
        id v26 = v7;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to create cloud database with configuration %@", buf, 0x16u);

        int v18 = v22;
      }

      uint64_t v14 = 0;
    }
  }
  else
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v24 = v17;
      __int16 v25 = 2112;
      id v26 = v6;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to create local database with file URL %@ and cloud configuration %@", buf, 0x20u);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t40_91506 != -1) {
    dispatch_once(&logCategory__hmf_once_t40_91506, &__block_literal_global_83_91507);
  }
  v2 = (void *)logCategory__hmf_once_v41_91508;
  return v2;
}

uint64_t __26__HMDDatabase_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v41_91508;
  logCategory__hmf_once_v41_91508 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (HMDDatabase)cameraClipsDatabase
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  +[HMDDatabase defaultDatabase];

  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained(&cameraClipsDatabase_cameraClipsDatabase);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F65530] sharedPreferences];
    id v6 = [v5 preferenceForKey:@"cameraClipsContainerIdentifier"];

    id v7 = [v6 stringValue];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      HMFGetOSLogHandle();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        id v11 = [v6 stringValue];
        int v20 = 138543618;
        id v21 = v10;
        __int16 v22 = 2112;
        __int16 v23 = v11;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Overriding camera clips container identifier to %@", (uint8_t *)&v20, 0x16u);
      }
      int v12 = [v6 stringValue];
    }
    else
    {
      int v12 = @"com.apple.homekit.camera.clips";
    }
    id v13 = objc_alloc(MEMORY[0x1E4F19ED8]);
    uint64_t v14 = (void *)[v13 initWithContainerIdentifier:v12 environment:cloudKitContainerEnvironment];
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F69EC8]) initWithContainerID:v14];
    [v15 setSourceApplicationBundleIdentifier:@"com.apple.willowd.homekit.camera.clips"];
    [v15 setManateeContainer:1];
    [v15 setSubscriptionPushRegistrationAction:1];
    id v16 = objc_alloc((Class)a1);
    id v17 = +[HMDDatabase defaultLocalDatabaseFileURL];
    int v18 = (void *)[v16 initWithFileURL:v17 cloudConfiguration:v15];

    objc_storeWeak(&cameraClipsDatabase_cameraClipsDatabase, v18);
    id v4 = v18;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&HMDDatabaseSharedInstanceLock);
  return (HMDDatabase *)v4;
}

+ (HMDDatabase)defaultDatabase
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__HMDDatabase_defaultDatabase__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultDatabase_onceToken[0] != -1) {
    dispatch_once(defaultDatabase_onceToken, block);
  }
  v2 = (void *)defaultDatabase_defaultDatabase;
  return (HMDDatabase *)v2;
}

void __30__HMDDatabase_defaultDatabase__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock_with_options();
  v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  uint64_t v3 = [v2 preferenceForKey:@"defaultContainerIdentifier"];

  id v4 = [v3 stringValue];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    HMFGetOSLogHandle();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = [v3 stringValue];
      int v17 = 138543618;
      id v18 = v7;
      __int16 v19 = 2112;
      int v20 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Overriding default container identifier to %@", (uint8_t *)&v17, 0x16u);
    }
    id v9 = [v3 stringValue];
  }
  else
  {
    id v9 = @"com.apple.homekit";
  }
  id v10 = objc_alloc(MEMORY[0x1E4F19ED8]);
  id v11 = (void *)[v10 initWithContainerIdentifier:v9 environment:cloudKitContainerEnvironment];
  int v12 = (void *)[objc_alloc(MEMORY[0x1E4F69EC8]) initWithContainerID:v11];
  [v12 setSourceApplicationBundleIdentifier:@"com.apple.willowd.homekit"];
  [v12 setManateeContainer:1];
  [v12 setSubscriptionPushRegistrationAction:1];
  id v13 = objc_alloc(*(Class *)(a1 + 32));
  uint64_t v14 = +[HMDDatabase defaultLocalDatabaseFileURL];
  uint64_t v15 = [v13 initWithFileURL:v14 cloudConfiguration:v12];
  id v16 = (void *)defaultDatabase_defaultDatabase;
  defaultDatabase_defaultDatabase = v15;

  os_unfair_lock_unlock((os_unfair_lock_t)&HMDDatabaseSharedInstanceLock);
}

+ (void)registerQueries
{
  +[HMBModel hmbPrepareQueries];
  +[HMBModel hmbPrepareQueries];
  +[HMBModel hmbPrepareQueries];
  +[HMBModel hmbPrepareQueries];
  +[HMBModel hmbPrepareQueries];
}

+ (NSURL)defaultLocalDatabaseFileURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = (id)storeDirectoryPath;
  id v4 = [v3 stringByAppendingPathComponent:@"datastore3.sqlite"];
  id v5 = [v2 fileURLWithPath:v4];

  return (NSURL *)v5;
}

@end