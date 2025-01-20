@interface HMBCloudDatabase
+ (id)logCategory;
- (BOOL)_retryCloudKitOperationAfterError:(id)a3 retryBlock:(id)a4;
- (BOOL)needsZoneCreationForZoneWithID:(id)a3;
- (BOOL)reopenOrRecreatePrivateZone:(id)a3 error:(id *)a4;
- (BOOL)retryCloudKitOperation:(id)a3 afterError:(id)a4 retryBlock:(id)a5;
- (CKContainer)container;
- (CKContainerID)containerID;
- (CKDatabase)privateDatabase;
- (CKDatabase)publicDatabase;
- (CKDatabase)sharedDatabase;
- (HMBCloudCredentialsAvailabilityListener)credentialsAvailabilityListener;
- (HMBCloudDatabase)initWithLocalDatabase:(id)a3 configuration:(id)a4;
- (HMBCloudDatabase)initWithLocalDatabase:(id)a3 stateZone:(id)a4 container:(id)a5 configuration:(id)a6 databaseStateModelsByScope:(id)a7 zoneStateModels:(id)a8 credentialsAvailabilityListener:(id)a9 dataSource:(id)a10;
- (HMBCloudDatabaseConfiguration)configuration;
- (HMBCloudDatabaseDataSource)dataSource;
- (HMBCloudDatabaseDelegate)delegate;
- (HMBCloudDatabaseStateModel)privateDatabaseState;
- (HMBCloudDatabaseStateModel)publicDatabaseState;
- (HMBCloudDatabaseStateModel)sharedDatabaseState;
- (HMBLocalDatabase)localDatabase;
- (HMBLocalZone)stateZone;
- (NAFuture)initialCloudSyncFuture;
- (NAScheduler)operationScheduler;
- (NSMutableDictionary)zoneStateByZoneID;
- (NSOperationQueue)databaseFetchOperationQueue;
- (NSOperationQueue)invitationOperationQueue;
- (NSSet)privateZoneIDs;
- (NSSet)publicZoneIDs;
- (NSSet)sharedZoneIDs;
- (id)_acceptInvitation:(id)a3;
- (id)_openOrCreateZoneWithScope:(int64_t)a3 recordZoneID:(id)a4 delegate:(id)a5 shouldCreate:(BOOL)a6 configuration:(id)a7 existingCloudZone:(id)a8 error:(id *)a9;
- (id)_updateAPSRegistration:(BOOL)a3;
- (id)_zonesWithScope:(int64_t)a3;
- (id)acceptInvitation:(id)a3;
- (id)acceptInvitationWithShareMetadata:(id)a3;
- (id)attributeDescriptions;
- (id)cloudZoneFactory;
- (id)createPrivateZoneWithID:(id)a3;
- (id)databaseStateForDatabaseScope:(int64_t)a3;
- (id)fetchCurrentUserRecordForDatabase:(id)a3;
- (id)fetchParticipantWithLookupInfo:(id)a3;
- (id)fetchShareMetadataForInvitation:(id)a3;
- (id)fetchSubscriptionsInDatabase:(id)a3;
- (id)fetchZonesWithIDs:(id)a3 inDatabase:(id)a4;
- (id)logIdentifier;
- (id)openExistingPrivateZoneWithID:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6;
- (id)openExistingSharedZoneWithID:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6;
- (id)openOrCreatePrivateZoneWithID:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6;
- (id)operationConfigurationWithProcessingOptions:(id)a3;
- (id)performCloudPullForScope:(int64_t)a3;
- (id)performCodeOperationWithServiceName:(id)a3 functionName:(id)a4 request:(id)a5 responseClass:(Class)a6;
- (id)performInitialCloudSync;
- (id)pushSubscriptionsForDatabase:(id)a3 subscriptionsToSave:(id)a4 subscriptionIDsToRemove:(id)a5;
- (id)registerPrivateSubscription:(id)a3;
- (id)registerPrivateSubscriptionForExternalRecordType:(id)a3;
- (id)registerSharedSubscriptionForExternalRecordType:(id)a3;
- (id)registerSubscription:(id)a3 forZoneWithID:(id)a4;
- (id)registerSubscriptionForExternalRecordType:(id)a3 databaseState:(id)a4;
- (id)removePrivateZoneWithID:(id)a3;
- (id)removeZoneWithID:(id)a3;
- (id)serverChangeTokenForZoneWithID:(id)a3;
- (id)shutdown;
- (id)subscriptionIDForCloudID:(id)a3 recordType:(id)a4;
- (id)subscriptionIDForZoneID:(id)a3 recordType:(id)a4;
- (id)subscriptionsForZoneWithID:(id)a3;
- (id)synchronizeSharedZones;
- (id)synchronizeZoneStateForZoneIDs:(id)a3;
- (id)unregisterPrivateSubscriptionForExternalRecordType:(id)a3;
- (id)unregisterPrivateSubscriptionForSubscriptionID:(id)a3;
- (id)unregisterSharedSubscriptionForExternalRecordType:(id)a3;
- (id)unregisterSharedSubscriptionForSubscriptionID:(id)a3;
- (id)unregisterSubscription:(id)a3 forZoneWithID:(id)a4;
- (void)_performInitialCloudSync;
- (void)addContainerOperation:(id)a3;
- (void)addDatabaseOperation:(id)a3 forScope:(int64_t)a4;
- (void)handleCreatedZoneIDs:(id)a3;
- (void)handleRemovedZoneIDs:(id)a3 userInitiated:(BOOL)a4;
- (void)handleUpdatedZonesIDs:(id)a3;
- (void)handler:(id)a3 didReceiveCKNotification:(id)a4;
- (void)handler:(id)a3 didReceiveMessageWithUserInfo:(id)a4;
- (void)notifyDelegateOfError:(id)a3 forOperation:(id)a4;
- (void)removeStateForZoneID:(id)a3;
- (void)retryStartupBlock:(id)a3;
- (void)setCloudZoneFactory:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInitialCloudSyncFuture:(id)a3;
- (void)setPrivateDatabaseState:(id)a3;
- (void)setPublicDatabaseState:(id)a3;
- (void)setSharedDatabaseState:(id)a3;
- (void)updateNeedsZoneDeletion:(BOOL)a3 forZoneWithID:(id)a4;
- (void)updateRebuildStatus:(id)a3 forZoneWithID:(id)a4;
- (void)updateServerChangeToken:(id)a3 forDatabaseWithScope:(int64_t)a4;
- (void)updateServerChangeToken:(id)a3 forZoneWithID:(id)a4;
@end

@implementation HMBCloudDatabase

- (NSSet)privateZoneIDs
{
  return (NSSet *)[(HMBCloudDatabase *)self _zonesWithScope:2];
}

- (id)_zonesWithScope:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  v6 = [(HMBCloudDatabase *)self zoneStateByZoneID];
  v7 = [v6 allKeys];

  os_unfair_lock_unlock(p_propertyLock);
  v8 = [MEMORY[0x1E4F1CA80] set];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "scope", (void)v16) == a3) {
          [v8 addObject:v13];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  v14 = (void *)[v8 copy];
  return v14;
}

- (NSMutableDictionary)zoneStateByZoneID
{
  return self->_zoneStateByZoneID;
}

- (id)performCodeOperationWithServiceName:(id)a3 functionName:(id)a4 request:(id)a5 responseClass:(Class)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)MEMORY[0x1E4F7A0D8];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __99__HMBCloudDatabase_CKCode__performCodeOperationWithServiceName_functionName_request_responseClass___block_invoke;
  v21[3] = &unk_1E69E9DD8;
  v21[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  Class v25 = a6;
  v14 = (void *)MEMORY[0x1E4F7A0F0];
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  long long v18 = [v14 globalAsyncScheduler];
  long long v19 = [v13 futureWithBlock:v21 scheduler:v18];

  return v19;
}

void __99__HMBCloudDatabase_CKCode__performCodeOperationWithServiceName_functionName_request_responseClass___block_invoke(void **a1, void *a2)
{
}

- (id)_acceptInvitation:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D944CB30]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Accepting invitation: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v6);
  id v9 = [(HMBCloudDatabase *)v6 fetchShareMetadataForInvitation:v4];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__HMBCloudDatabase_User___acceptInvitation___block_invoke;
  v15[3] = &unk_1E69EA0E8;
  objc_copyWeak(&v16, (id *)buf);
  id v10 = [v9 flatMap:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__HMBCloudDatabase_User___acceptInvitation___block_invoke_2;
  v13[3] = &unk_1E69EA110;
  objc_copyWeak(&v14, (id *)buf);
  id v11 = [v10 flatMap:v13];
  objc_destroyWeak(&v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

  return v11;
}

id __44__HMBCloudDatabase_User___acceptInvitation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x1D944CB30]();
  id v6 = WeakRetained;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetched share metadata: %@", (uint8_t *)&v11, 0x16u);
  }
  id v9 = [v6 acceptInvitationWithShareMetadata:v3];

  return v9;
}

id __44__HMBCloudDatabase_User___acceptInvitation___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x1D944CB30]();
  id v6 = (os_unfair_lock_s *)WeakRetained;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v43 = v8;
    __int16 v44 = 2112;
    v45 = v3;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Accepted invitation with share: %@", buf, 0x16u);
  }
  id v9 = [HMBCloudZoneID alloc];
  id v10 = [(os_unfair_lock_s *)v6 containerID];
  int v11 = [(HMBCloudZoneStateModel *)v3 recordID];
  id v12 = [v11 zoneID];
  __int16 v13 = [(HMBCloudZoneID *)v9 initWithContainerID:v10 scope:3 zoneID:v12];

  os_unfair_lock_lock_with_options();
  id v14 = [(os_unfair_lock_s *)v6 zoneStateByZoneID];
  uint64_t v15 = [v14 objectForKeyedSubscript:v13];

  if (v15)
  {
    id v16 = (void *)MEMORY[0x1D944CB30]();
    id v17 = v6;
    HMFGetOSLogHandle();
    long long v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v43 = v19;
      __int16 v44 = 2112;
      v45 = v15;
      _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_INFO, "%{public}@Not adding zone state model because one already exists: %@", buf, 0x16u);
    }
  }
  else
  {
    id v20 = [HMBCloudZoneStateModel alloc];
    uint64_t v21 = [(HMBCloudID *)v13 modelID];
    id v22 = [(os_unfair_lock_s *)v6 sharedDatabaseState];
    id v23 = [v22 hmbModelID];
    id v24 = [(HMBCloudZoneStateModel *)v20 initWithModelID:v21 parentModelID:v23];

    Class v25 = (void *)MEMORY[0x1D944CB30]([(HMBCloudZoneStateModel *)v24 setZoneID:v13]);
    v26 = v6;
    HMFGetOSLogHandle();
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v43 = v28;
      __int16 v44 = 2112;
      v45 = v24;
      _os_log_impl(&dword_1D4693000, v27, OS_LOG_TYPE_INFO, "%{public}@Adding zone state model: %@", buf, 0x16u);
    }
    v29 = [(os_unfair_lock_s *)v26 zoneStateByZoneID];
    [v29 setObject:v24 forKeyedSubscript:v13];

    v30 = [(os_unfair_lock_s *)v26 stateZone];
    v41 = v24;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
    v32 = [v30 update:v31];

    if (v32)
    {
      context = (void *)MEMORY[0x1D944CB30]();
      v33 = v26;
      HMFGetOSLogHandle();
      v34 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v43 = v35;
        __int16 v44 = 2112;
        v45 = v32;
        _os_log_impl(&dword_1D4693000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to add zone state model: %@", buf, 0x16u);
      }
    }
  }
  os_unfair_lock_unlock(v6 + 2);
  v40 = v13;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  [(os_unfair_lock_s *)v6 handleCreatedZoneIDs:v36];

  v37 = [MEMORY[0x1E4F7A0D8] futureWithResult:v13];

  return v37;
}

- (id)acceptInvitation:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D944CB30]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Queueing up accept for invitation %@", buf, 0x16u);
  }
  id v9 = [HMBFutureOperation alloc];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __43__HMBCloudDatabase_User__acceptInvitation___block_invoke;
  long long v18 = &unk_1E69EB530;
  __int16 v19 = v6;
  id v20 = v4;
  id v10 = v4;
  int v11 = [(HMBFutureOperation *)v9 initWithBlock:&v15];
  id v12 = [(HMBCloudDatabase *)v6 invitationOperationQueue];
  [v12 addOperation:v11];

  __int16 v13 = [(HMBFutureOperation *)v11 future];

  return v13;
}

uint64_t __43__HMBCloudDatabase_User__acceptInvitation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _acceptInvitation:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialCloudSyncFuture, 0);
  objc_storeStrong((id *)&self->_databaseFetchOperationQueue, 0);
  objc_storeStrong((id *)&self->_invitationOperationQueue, 0);
  objc_storeStrong(&self->_cloudZoneFactory, 0);
  objc_storeStrong((id *)&self->_publicDatabase, 0);
  objc_storeStrong((id *)&self->_privateDatabase, 0);
  objc_storeStrong((id *)&self->_sharedDatabase, 0);
  objc_storeStrong((id *)&self->_credentialsAvailabilityListener, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_zoneStateByZoneID, 0);
  objc_storeStrong((id *)&self->_publicDatabaseState, 0);
  objc_storeStrong((id *)&self->_sharedDatabaseState, 0);
  objc_storeStrong((id *)&self->_privateDatabaseState, 0);
  objc_storeStrong((id *)&self->_stateZone, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_localDatabase, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setInitialCloudSyncFuture:(id)a3
{
}

- (NAFuture)initialCloudSyncFuture
{
  return self->_initialCloudSyncFuture;
}

- (NSOperationQueue)databaseFetchOperationQueue
{
  return self->_databaseFetchOperationQueue;
}

- (NSOperationQueue)invitationOperationQueue
{
  return self->_invitationOperationQueue;
}

- (void)setCloudZoneFactory:(id)a3
{
}

- (id)cloudZoneFactory
{
  return self->_cloudZoneFactory;
}

- (CKDatabase)publicDatabase
{
  return self->_publicDatabase;
}

- (CKDatabase)privateDatabase
{
  return self->_privateDatabase;
}

- (CKDatabase)sharedDatabase
{
  return self->_sharedDatabase;
}

- (HMBCloudCredentialsAvailabilityListener)credentialsAvailabilityListener
{
  return self->_credentialsAvailabilityListener;
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setPublicDatabaseState:(id)a3
{
}

- (HMBCloudDatabaseStateModel)publicDatabaseState
{
  return self->_publicDatabaseState;
}

- (void)setSharedDatabaseState:(id)a3
{
}

- (HMBCloudDatabaseStateModel)sharedDatabaseState
{
  return self->_sharedDatabaseState;
}

- (void)setPrivateDatabaseState:(id)a3
{
}

- (HMBCloudDatabaseStateModel)privateDatabaseState
{
  return self->_privateDatabaseState;
}

- (HMBLocalZone)stateZone
{
  return self->_stateZone;
}

- (HMBCloudDatabaseDataSource)dataSource
{
  return self->_dataSource;
}

- (HMBCloudDatabaseConfiguration)configuration
{
  return self->_configuration;
}

- (HMBLocalDatabase)localDatabase
{
  return self->_localDatabase;
}

- (void)setDelegate:(id)a3
{
}

- (HMBCloudDatabaseDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMBCloudDatabaseDelegate *)WeakRetained;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMBCloudDatabase *)self container];
  v5 = (void *)[v3 initWithName:@"Container" value:v4];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)logIdentifier
{
  v2 = [(HMBCloudDatabase *)self container];
  id v3 = [v2 containerID];
  id v4 = [v3 containerIdentifier];

  return v4;
}

- (void)handler:(id)a3 didReceiveMessageWithUserInfo:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMBCloudDatabase *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v9 = (void *)MEMORY[0x1D944CB30]();
    id v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v12;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Received message that did not translate to a CKNotification; deferring to delegate: %@",
        (uint8_t *)&v13,
        0x16u);
    }
    [v8 cloudDatabase:v10 didReceiveMessageWithUserInfo:v7];
  }
}

- (void)handler:(id)a3 didReceiveCKNotification:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 containerIdentifier];
  id v9 = [(HMBCloudDatabase *)self container];
  id v10 = [v9 containerIdentifier];
  char v11 = [v8 isEqualToString:v10];

  if (v11) {
    goto LABEL_7;
  }
  id v12 = [(HMBCloudDatabase *)self container];
  int v13 = [v12 containerIdentifier];
  if ([v13 isEqualToString:@"com.apple.willow.config"])
  {
    id v14 = [v7 containerIdentifier];
    int v15 = [v14 isEqualToString:@"com.apple.homekit.config"];

    if (v15)
    {
      id v16 = (void *)MEMORY[0x1D944CB30]();
      uint64_t v17 = self;
      long long v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        __int16 v19 = HMFGetLogIdentifier();
        id v20 = [v7 containerIdentifier];
        *(_DWORD *)buf = 138543618;
        v76 = v19;
        __int16 v77 = 2112;
        id v78 = v20;
        _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Allowing CKNotification for %@ container to trigger operations", buf, 0x16u);
      }
LABEL_7:
      id v21 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v22 = v21;
      }
      else {
        id v22 = 0;
      }
      id v23 = v22;

      if (v23)
      {
        id v24 = (id)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Database APS Notification"];
        uint64_t v25 = (void *)MEMORY[0x1D944CB30]();
        v26 = self;
        v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = HMFGetLogIdentifier();
          v29 = [v24 identifier];
          v30 = [v29 shortDescription];
          *(_DWORD *)buf = 138543874;
          v76 = v28;
          __int16 v77 = 2114;
          id v78 = v30;
          __int16 v79 = 2112;
          id v80 = v23;
          _os_log_impl(&dword_1D4693000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Handling CKDatabaseNotification: %@", buf, 0x20u);
        }
        id v31 = -[HMBCloudDatabase performCloudPullForScope:](v26, "performCloudPullForScope:", [v23 databaseScope]);
        goto LABEL_38;
      }
      id v37 = v21;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v38 = v37;
      }
      else {
        v38 = 0;
      }
      id v24 = v38;

      if (v24)
      {
        v39 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Record Zone APS Notification"];
        v40 = (void *)MEMORY[0x1D944CB30]();
        v41 = self;
        v42 = HMFGetOSLogHandle();
        v73 = v39;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = HMFGetLogIdentifier();
          __int16 v44 = [v39 identifier];
          v45 = [v44 shortDescription];
          *(_DWORD *)buf = 138543874;
          v76 = v43;
          __int16 v77 = 2114;
          id v78 = v45;
          __int16 v79 = 2112;
          id v80 = v24;
          _os_log_impl(&dword_1D4693000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Handling CKRecordZoneNotification: %@", buf, 0x20u);

          v39 = v73;
        }
        id v72 = v6;

        uint64_t v46 = [HMBCloudZoneID alloc];
        v47 = [(HMBCloudDatabase *)v41 containerID];
        uint64_t v48 = [v24 databaseScope];
        v49 = [v24 recordZoneID];
        v50 = [(HMBCloudZoneID *)v46 initWithContainerID:v47 scope:v48 zoneID:v49];

        v51 = [(HMBCloudID *)v50 name];
        [v39 markWithFormat:@"updating zone: %@", v51];

        v52 = (void *)MEMORY[0x1D944CB30]();
        v53 = v41;
        v54 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v55 = HMFGetLogIdentifier();
          v56 = [v73 identifier];
          [v56 shortDescription];
          v57 = v71 = v52;
          v58 = [(HMBCloudID *)v50 name];
          *(_DWORD *)buf = 138543874;
          v76 = v55;
          __int16 v77 = 2114;
          id v78 = v57;
          __int16 v79 = 2112;
          id v80 = v58;
          _os_log_impl(&dword_1D4693000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Starting update for zone: %@", buf, 0x20u);

          v52 = v71;
          v39 = v73;
        }

        v74 = v50;
        v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
        [(HMBCloudDatabase *)v53 handleUpdatedZonesIDs:v59];

        id v6 = v72;
        goto LABEL_37;
      }
      id v60 = v6;
      id v61 = v37;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v62 = v61;
      }
      else {
        v62 = 0;
      }
      id v63 = v62;

      v64 = (void *)MEMORY[0x1D944CB30]();
      v65 = self;
      v66 = HMFGetOSLogHandle();
      BOOL v67 = os_log_type_enabled(v66, OS_LOG_TYPE_ERROR);
      id v68 = v63;
      if (v63)
      {
        if (v67)
        {
          v69 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v76 = v69;
          __int16 v77 = 2112;
          id v78 = v68;
          v70 = "%{public}@Received unexpected query notification: %@";
LABEL_35:
          _os_log_impl(&dword_1D4693000, v66, OS_LOG_TYPE_ERROR, v70, buf, 0x16u);
        }
      }
      else if (v67)
      {
        v69 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v76 = v69;
        __int16 v77 = 2112;
        id v78 = v61;
        v70 = "%{public}@Received unknown CKNotification: %@";
        goto LABEL_35;
      }

      id v6 = v60;
      v39 = v68;
LABEL_37:

LABEL_38:
      goto LABEL_39;
    }
  }
  else
  {
  }
  v32 = (void *)MEMORY[0x1D944CB30]();
  v33 = self;
  v34 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    v35 = HMFGetLogIdentifier();
    v36 = [v7 containerIdentifier];
    *(_DWORD *)buf = 138543618;
    v76 = v35;
    __int16 v77 = 2112;
    id v78 = v36;
    _os_log_impl(&dword_1D4693000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring CKNotification for irrelevant container identifier: %@", buf, 0x16u);
  }
LABEL_39:
}

- (id)operationConfigurationWithProcessingOptions:(id)a3
{
  id v4 = a3;
  v5 = [(HMBCloudDatabase *)self configuration];
  id v6 = [v5 defaultOperationConfiguration];
  id v7 = v6;
  if (v4)
  {
    v8 = (void *)[v6 copy];

    objc_msgSend(v8, "setQualityOfService:", objc_msgSend(v4, "qualityOfService"));
    objc_msgSend(v8, "setAllowsCellularAccess:", objc_msgSend(v4, "disallowsCellularAccessForMirrorOutput") ^ 1);
    id v7 = v8;
  }
  else
  {
  }
  return v7;
}

- (void)retryStartupBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HMBCloudDatabase *)self dataSource];
  [v5 performAfterDelay:v4 block:300.0];
}

- (void)removeStateForZoneID:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_t lock = &self->_propertyLock;
  uint64_t v5 = os_unfair_lock_lock_with_options();
  id v6 = (void *)MEMORY[0x1D944CB30](v5);
  id v7 = self;
  HMFGetOSLogHandle();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v46 = v9;
    __int16 v47 = 2112;
    id v48 = v4;
    _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing state for zone ID %@", buf, 0x16u);
  }
  id v10 = [(HMBCloudDatabase *)v7 zoneStateByZoneID];
  char v11 = [v10 objectForKeyedSubscript:v4];

  if (v11)
  {
    id v12 = [(HMBCloudDatabase *)v7 stateZone];
    int v13 = [v11 hmbModelID];
    id v43 = 0;
    id v14 = [v12 fetchModelsWithParentModelID:v13 error:&v43];
    id v15 = v43;

    if (!v14)
    {
      id v16 = (void *)MEMORY[0x1D944CB30]();
      uint64_t v17 = v7;
      HMFGetOSLogHandle();
      long long v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        uint64_t v46 = v19;
        __int16 v47 = 2112;
        id v48 = v11;
        __int16 v49 = 2112;
        id v50 = v4;
        __int16 v51 = 2112;
        id v52 = v15;
        _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine children of zone state model %@ with ID %@: %@", buf, 0x2Au);
      }
      id v14 = [MEMORY[0x1E4F1CAD0] set];
    }
    id v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v14, "count") + 1);
    id v21 = [v11 hmbModelID];
    [v20 addObject:v21];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v22 = v14;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v40;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v22);
          }
          v26 = [*(id *)(*((void *)&v39 + 1) + 8 * v25) hmbModelID];
          [v20 addObject:v26];

          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v23);
    }

    v27 = [(HMBCloudDatabase *)v7 stateZone];
    v28 = [v27 remove:v20];

    if (v28)
    {
      v29 = (void *)MEMORY[0x1D944CB30]();
      v30 = v7;
      HMFGetOSLogHandle();
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v46 = v32;
        __int16 v47 = 2112;
        id v48 = v4;
        __int16 v49 = 2112;
        id v50 = v28;
        _os_log_impl(&dword_1D4693000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove cloud zone state models for zone ID %@: %@", buf, 0x20u);
      }
    }
    v33 = [(HMBCloudDatabase *)v7 zoneStateByZoneID];
    [v33 setObject:0 forKeyedSubscript:v4];
  }
  else
  {
    v34 = (void *)MEMORY[0x1D944CB30]();
    v35 = v7;
    HMFGetOSLogHandle();
    v36 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      id v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v46 = v37;
      __int16 v47 = 2112;
      id v48 = v4;
      _os_log_impl(&dword_1D4693000, v36, OS_LOG_TYPE_INFO, "%{public}@Asked to remove state for zoneID %@ that has already been removed", buf, 0x16u);
    }
  }

  os_unfair_lock_unlock(lock);
}

- (void)notifyDelegateOfError:(id)a3 forOperation:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMBCloudDatabase *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v9 = (void *)MEMORY[0x1D944CB30]();
    id v10 = self;
    char v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = HMFGetLogIdentifier();
      int v14 = 138544130;
      id v15 = v12;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Notifying delegate %@ for error on operation %@: %@", (uint8_t *)&v14, 0x2Au);
    }
    int v13 = [(HMBCloudDatabase *)v10 containerID];
    [v8 cloudDatabase:v10 encounteredError:v6 withOperation:v7 onContainer:v13];
  }
}

- (BOOL)_retryCloudKitOperationAfterError:(id)a3 retryBlock:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v6 hmbIsCKMissingManateeIdentityError])
  {
    [v6 hmbCloudKitRetryDelay];
    double v18 = v17;
    if (v17 == -1.0)
    {
      if ([v6 hmbIsCKManateeUnavailableError])
      {
        id v19 = (void *)MEMORY[0x1D944CB30]();
        __int16 v20 = self;
        id v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v54 = v22;
          _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_INFO, "%{public}@Manatee is unavailable. Waiting for Manatee to become available before retrying", buf, 0xCu);
        }
        uint64_t v23 = [(HMBCloudDatabase *)v20 credentialsAvailabilityListener];
        uint64_t v24 = [v23 waitForAccountAvailabilityAndRecheckIfAlreadyAvailable];
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __65__HMBCloudDatabase__retryCloudKitOperationAfterError_retryBlock___block_invoke;
        v51[3] = &unk_1E69EA288;
        v51[4] = v20;
        id v52 = v7;
        id v25 = (id)[v24 addSuccessBlock:v51];

        v26 = v52;
      }
      else if ([v6 hmbIsCKNotAuthenticatedError])
      {
        v33 = (void *)MEMORY[0x1D944CB30]();
        v34 = self;
        v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v54 = v36;
          _os_log_impl(&dword_1D4693000, v35, OS_LOG_TYPE_INFO, "%{public}@CloudKit account status is no longer authenticated. Waiting for Manatee to become available before retrying", buf, 0xCu);
        }
        id v37 = [(HMBCloudDatabase *)v34 credentialsAvailabilityListener];
        v38 = [v37 waitForAccountAvailabilityAndRecheckIfAlreadyAvailable];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __65__HMBCloudDatabase__retryCloudKitOperationAfterError_retryBlock___block_invoke_89;
        v49[3] = &unk_1E69EA288;
        v49[4] = v34;
        id v50 = v7;
        id v39 = (id)[v38 addSuccessBlock:v49];

        v26 = v50;
      }
      else
      {
        int v40 = [v6 hmbIsCKUnsyncedKeychainError];
        v8 = (void *)MEMORY[0x1D944CB30]();
        id v9 = self;
        long long v41 = HMFGetOSLogHandle();
        id v10 = v41;
        if (!v40)
        {
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_5;
          }
          char v11 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v54 = v11;
          id v12 = "%{public}@Not retrying failed CloudKit operation";
          int v13 = v10;
          os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
          uint32_t v15 = 12;
          goto LABEL_4;
        }
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          long long v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v54 = v42;
          _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@Keychain is unsynced. Waiting for keychain to become available before retrying", buf, 0xCu);
        }
        id v43 = [(HMBCloudDatabase *)v9 credentialsAvailabilityListener];
        __int16 v44 = [v43 waitForKeychainAvailability];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __65__HMBCloudDatabase__retryCloudKitOperationAfterError_retryBlock___block_invoke_90;
        v47[3] = &unk_1E69EA288;
        v47[4] = v9;
        id v48 = v7;
        id v45 = (id)[v44 addSuccessBlock:v47];

        v26 = v48;
      }
    }
    else
    {
      dispatch_time_t v27 = dispatch_time(0, (unint64_t)(v17 * 1000000000.0));
      v28 = dispatch_get_global_queue(0, 0);
      dispatch_after(v27, v28, v7);

      v29 = (void *)MEMORY[0x1D944CB30]();
      v30 = self;
      id v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v54 = v32;
        __int16 v55 = 2048;
        double v56 = v18;
        _os_log_impl(&dword_1D4693000, v31, OS_LOG_TYPE_INFO, "%{public}@Will retry cloud operation after %.2f seconds", buf, 0x16u);
      }
    }
    BOOL v16 = 1;
    goto LABEL_24;
  }
  v8 = (void *)MEMORY[0x1D944CB30]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    char v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v54 = v11;
    __int16 v55 = 2112;
    double v56 = *(double *)&v6;
    id v12 = "%{public}@Received missing Manatee identity error on database specific query (this is not expected): %@";
    int v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 22;
LABEL_4:
    _os_log_impl(&dword_1D4693000, v13, v14, v12, buf, v15);
  }
LABEL_5:

  BOOL v16 = 0;
LABEL_24:

  return v16;
}

void __65__HMBCloudDatabase__retryCloudKitOperationAfterError_retryBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_INFO, "%{public}@Retrying operation that received Manatee unavailable error", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __65__HMBCloudDatabase__retryCloudKitOperationAfterError_retryBlock___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_INFO, "%{public}@Retrying operation that received account not authenticated error", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __65__HMBCloudDatabase__retryCloudKitOperationAfterError_retryBlock___block_invoke_90(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_INFO, "%{public}@Retrying operation that received keychain unsynced error", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)retryCloudKitOperation:(id)a3 afterError:(id)a4 retryBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(HMBCloudDatabase *)self notifyDelegateOfError:v9 forOperation:a3];
  LOBYTE(a3) = [(HMBCloudDatabase *)self _retryCloudKitOperationAfterError:v9 retryBlock:v8];

  return (char)a3;
}

- (id)removeZoneWithID:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(HMBCloudDatabase *)self updateNeedsZoneDeletion:1 forZoneWithID:v4];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(HMBCloudDatabase *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 cloudDatabase:self willRemoveZoneWithID:v4];
    [v5 addObject:v7];
  }
  uint64_t v8 = [v4 scope];
  unint64_t v9 = 0x1E4F7A000uLL;
  if (v8 == 1)
  {
    os_log_type_t v14 = (void *)MEMORY[0x1D944CB30]();
    uint32_t v15 = self;
    BOOL v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      double v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v39 = v17;
      __int16 v40 = 2112;
      id v41 = v4;
      _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove zone with public zoneID: %@", buf, 0x16u);

      unint64_t v9 = 0x1E4F7A000;
    }

    [(HMBCloudDatabase *)v15 updateNeedsZoneDeletion:0 forZoneWithID:v4];
    double v18 = (void *)MEMORY[0x1E4F7A0D8];
    id v19 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
    __int16 v20 = [v18 futureWithError:v19];
    [v5 addObject:v20];
  }
  else
  {
    if (v8 == 3)
    {
      id v21 = (void *)MEMORY[0x1E4F7A0D8];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __37__HMBCloudDatabase_removeZoneWithID___block_invoke_2;
      v34[3] = &unk_1E69EB2A8;
      v34[4] = self;
      id v35 = v4;
      uint64_t v22 = [MEMORY[0x1E4F7A0F0] immediateScheduler];
      uint64_t v23 = [v21 lazyFutureWithBlock:v34 scheduler:v22];

      [v5 addObject:v23];
      int v13 = v35;
    }
    else
    {
      if (v8 != 2) {
        goto LABEL_12;
      }
      uint64_t v10 = (void *)MEMORY[0x1E4F7A0D8];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __37__HMBCloudDatabase_removeZoneWithID___block_invoke;
      v36[3] = &unk_1E69EB2A8;
      v36[4] = self;
      id v37 = v4;
      char v11 = [MEMORY[0x1E4F7A0F0] immediateScheduler];
      id v12 = [v10 lazyFutureWithBlock:v36 scheduler:v11];

      [v5 addObject:v12];
      int v13 = v37;
    }
  }
LABEL_12:
  uint64_t v24 = (void *)MEMORY[0x1E4F7A0D8];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __37__HMBCloudDatabase_removeZoneWithID___block_invoke_88;
  v31[3] = &unk_1E69EB2A8;
  v32 = self;
  id v33 = v4;
  id v25 = *(void **)(v9 + 240);
  id v26 = v4;
  dispatch_time_t v27 = objc_msgSend(v25, "immediateScheduler", v31[0], 3221225472, __37__HMBCloudDatabase_removeZoneWithID___block_invoke_88, &unk_1E69EB2A8, v32);
  v28 = [v24 lazyFutureWithBlock:v31 scheduler:v27];

  [v5 addObject:v28];
  v29 = [MEMORY[0x1E4F7A0D8] chainFutures:v5];

  return v29;
}

void __37__HMBCloudDatabase_removeZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) zoneID];
  id v6 = objc_alloc_init(HMBCloudZoneConfiguration);
  id v33 = 0;
  id v7 = [v4 openExistingPrivateZoneWithID:v5 configuration:v6 delegate:0 error:&v33];
  id v8 = v33;

  if (v7)
  {
    unint64_t v9 = objc_alloc_init(HMBMutableLocalZoneConfiguration);
    [(HMBLocalZoneConfiguration *)v9 setCreateIfNeeded:1];
    uint64_t v10 = [*(id *)(a1 + 32) localDatabase];
    id v32 = v8;
    char v11 = [v10 openZoneWithMirror:v7 configuration:v9 error:&v32];
    id v12 = v32;

    if (v11)
    {
      [v11 startUp];
      int v13 = [v7 startUp];
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      v28 = __37__HMBCloudDatabase_removeZoneWithID___block_invoke_86;
      v29 = &unk_1E69EBD00;
      os_log_type_t v14 = *(void **)(a1 + 40);
      uint64_t v30 = *(void *)(a1 + 32);
      id v31 = v14;
      uint32_t v15 = [v13 flatMap:&v26];
      BOOL v16 = objc_msgSend(v3, "completionHandlerAdapter", v26, v27, v28, v29, v30);
      id v17 = (id)[v15 addCompletionBlock:v16];
    }
    else
    {
      uint64_t v22 = (void *)MEMORY[0x1D944CB30]();
      id v23 = *(id *)(a1 + 32);
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v35 = v25;
        __int16 v36 = 2112;
        id v37 = v12;
        _os_log_impl(&dword_1D4693000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to open private local zone for removal: %@", buf, 0x16u);
      }
      [v3 finishWithError:v12];
    }

    id v8 = v12;
  }
  else
  {
    double v18 = (void *)MEMORY[0x1D944CB30]();
    id v19 = *(id *)(a1 + 32);
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v35 = v21;
      __int16 v36 = 2112;
      id v37 = v8;
      _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to open existing private cloud zone for removal: %@", buf, 0x16u);
    }
    [v3 finishWithError:v8];
  }
}

void __37__HMBCloudDatabase_removeZoneWithID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) zoneID];
  id v6 = objc_alloc_init(HMBCloudZoneConfiguration);
  id v25 = 0;
  id v7 = [v4 openExistingSharedZoneWithID:v5 configuration:v6 delegate:0 error:&v25];
  id v8 = v25;

  if (v7)
  {
    unint64_t v9 = objc_alloc_init(HMBMutableLocalZoneConfiguration);
    [(HMBLocalZoneConfiguration *)v9 setCreateIfNeeded:1];
    uint64_t v10 = [*(id *)(a1 + 32) localDatabase];
    id v24 = v8;
    char v11 = [v10 openZoneWithMirror:v7 configuration:v9 error:&v24];
    id v12 = v24;

    if (v11)
    {
      [v11 startUp];
      int v13 = [v7 leaveCloudShareRequestingNewInvitationToken:0];
      os_log_type_t v14 = [v3 completionHandlerAdapter];
      id v15 = (id)[v13 addCompletionBlock:v14];
    }
    else
    {
      __int16 v20 = (void *)MEMORY[0x1D944CB30]();
      id v21 = *(id *)(a1 + 32);
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v27 = v23;
        __int16 v28 = 2112;
        id v29 = v12;
        _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to open shared local zone for removal: %@", buf, 0x16u);
      }
      [v3 finishWithError:v12];
    }

    id v8 = v12;
  }
  else
  {
    BOOL v16 = (void *)MEMORY[0x1D944CB30]();
    id v17 = *(id *)(a1 + 32);
    double v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v19;
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to open existing shared cloud zone for removal: %@", buf, 0x16u);
    }
    [v3 finishWithError:v8];
  }
}

void __37__HMBCloudDatabase_removeZoneWithID___block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v6 count:1];
  objc_msgSend(v2, "handleRemovedZoneIDs:userInitiated:", v5, 1, v6, v7);

  [v4 finishWithNoResult];
}

uint64_t __37__HMBCloudDatabase_removeZoneWithID___block_invoke_86(uint64_t a1)
{
  return [*(id *)(a1 + 32) removePrivateZoneWithID:*(void *)(a1 + 40)];
}

- (id)_openOrCreateZoneWithScope:(int64_t)a3 recordZoneID:(id)a4 delegate:(id)a5 shouldCreate:(BOOL)a6 configuration:(id)a7 existingCloudZone:(id)a8 error:(id *)a9
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a5;
  id v66 = a7;
  BOOL v67 = (HMBCloudZoneID *)a8;
  id v17 = [HMBCloudZoneID alloc];
  double v18 = [(HMBCloudDatabase *)self containerID];
  id v19 = [(HMBCloudZoneID *)v17 initWithContainerID:v18 scope:a3 zoneID:v15];

  os_unfair_lock_t lock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  __int16 v20 = [(HMBCloudDatabase *)self zoneStateByZoneID];
  id v21 = [v20 objectForKey:v19];

  if (v21) {
    goto LABEL_2;
  }
  if (!a6)
  {
    double v56 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v57 = self;
    HMFGetOSLogHandle();
    v58 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      v59 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v70 = v59;
      __int16 v71 = 2112;
      id v72 = v19;
      _os_log_impl(&dword_1D4693000, v58, OS_LOG_TYPE_INFO, "%{public}@No cloud zone state found with ID: %@", buf, 0x16u);
    }
    if (a9)
    {
      [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
      id v33 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    }
    goto LABEL_38;
  }
  if (a3 != 2)
  {
    _HMFPreconditionFailure();
    __break(1u);
  }
  v34 = (void *)MEMORY[0x1D944CB30]();
  id v35 = self;
  HMFGetOSLogHandle();
  __int16 v36 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    id v37 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v70 = v37;
    __int16 v71 = 2112;
    id v72 = v19;
    _os_log_impl(&dword_1D4693000, v36, OS_LOG_TYPE_INFO, "%{public}@Creating state for cloud zone with ID %@", buf, 0x16u);
  }
  uint64_t v38 = [HMBCloudZoneStateModel alloc];
  id v39 = [(HMBCloudID *)v19 modelID];
  __int16 v40 = [(HMBCloudDatabase *)v35 privateDatabaseState];
  id v41 = [v40 hmbModelID];
  id v21 = [(HMBCloudZoneStateModel *)v38 initWithModelID:v39 parentModelID:v41];

  [(HMBCloudZoneStateModel *)v21 setZoneID:v19];
  [(HMBCloudZoneStateModel *)v21 setNeedsZoneCreation:MEMORY[0x1E4F1CC38]];
  uint64_t v42 = [(HMBCloudDatabase *)v35 stateZone];
  id v68 = v21;
  id v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
  __int16 v44 = [v42 update:v43];

  if (v44)
  {
    id v45 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v46 = v35;
    HMFGetOSLogHandle();
    __int16 v47 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      id v48 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v70 = v48;
      __int16 v71 = 2112;
      id v72 = v44;
      _os_log_impl(&dword_1D4693000, v47, OS_LOG_TYPE_ERROR, "%{public}@Unable to save new zone to database: %@", buf, 0x16u);
    }
    if (a9) {
      *a9 = v44;
    }

LABEL_38:
    id v33 = 0;
    goto LABEL_46;
  }
  v64 = [(HMBCloudDatabase *)v35 zoneStateByZoneID];
  [v64 setObject:v21 forKey:v19];

LABEL_2:
  uint64_t v22 = [(HMBCloudZoneStateModel *)v21 cloudZone];
  id v23 = v22;
  if (v22)
  {
    uint64_t v24 = [(HMBCloudZoneID *)v22 delegate];
    id v25 = (void *)v24;
    if (v16) {
      BOOL v26 = v24 == 0;
    }
    else {
      BOOL v26 = 1;
    }
    char v28 = v26 || v24 == (void)v16;
    id v29 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v30 = self;
    if (v28)
    {
      HMFGetOSLogHandle();
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        id v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v70 = v32;
        __int16 v71 = 2112;
        id v72 = v23;
        _os_log_impl(&dword_1D4693000, v31, OS_LOG_TYPE_INFO, "%{public}@Using existing HMBCloudZone instance: %@", buf, 0x16u);
      }
      id v33 = v23;
    }
    else
    {
      HMFGetOSLogHandle();
      v54 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        __int16 v55 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v70 = v55;
        __int16 v71 = 2112;
        id v72 = v19;
        _os_log_impl(&dword_1D4693000, v54, OS_LOG_TYPE_ERROR, "%{public}@Cannot set a delegate on cloud zone with identifier %@ because that cloud zone has already been opened with a different delegate", buf, 0x16u);
      }
      if (a9)
      {
        [MEMORY[0x1E4F28C58] hmfErrorWithCode:1];
        id v33 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v33 = 0;
      }
    }
  }
  else
  {
    __int16 v49 = (void *)MEMORY[0x1D944CB30]();
    id v50 = self;
    if (v67)
    {
      HMFGetOSLogHandle();
      __int16 v51 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        id v52 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v70 = v52;
        __int16 v71 = 2112;
        id v72 = v67;
        _os_log_impl(&dword_1D4693000, v51, OS_LOG_TYPE_INFO, "%{public}@Using re-opened HMBCloudZone instance: %@", buf, 0x16u);
      }
      uint64_t v53 = v67;
    }
    else
    {
      HMFGetOSLogHandle();
      id v60 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        id v61 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v70 = v61;
        __int16 v71 = 2112;
        id v72 = v19;
        _os_log_impl(&dword_1D4693000, v60, OS_LOG_TYPE_INFO, "%{public}@Creating new HMBCloudZone instance with ID: %@", buf, 0x16u);
      }
      v62 = [(HMBCloudDatabase *)v50 cloudZoneFactory];
      ((void (**)(void, HMBCloudDatabase *, id, HMBCloudZoneStateModel *))v62)[2](v62, v50, v66, v21);
      uint64_t v53 = (HMBCloudZoneID *)objc_claimAutoreleasedReturnValue();

      [(HMBCloudZoneID *)v53 setDelegate:v16];
    }
    [(HMBCloudZoneStateModel *)v21 setCloudZone:v53];
    id v23 = v53;
    id v33 = v23;
  }

LABEL_46:
  os_unfair_lock_unlock(lock);

  return v33;
}

- (BOOL)reopenOrRecreatePrivateZone:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 cloudZoneID];
  uint64_t v8 = [v7 scope];

  if (v8 == 2)
  {
    unint64_t v9 = [v6 cloudZoneID];
    uint64_t v10 = [v9 scope];
    char v11 = [v6 cloudZoneID];
    id v12 = [v11 zoneID];
    int v13 = [v6 delegate];
    os_log_type_t v14 = [v6 configuration];
    id v15 = [(HMBCloudDatabase *)self _openOrCreateZoneWithScope:v10 recordZoneID:v12 delegate:v13 shouldCreate:1 configuration:v14 existingCloudZone:v6 error:a4];
    BOOL v16 = v15 != 0;

    return v16;
  }
  else
  {
    double v18 = (HMBCloudDatabase *)_HMFPreconditionFailure();
    return [(HMBCloudDatabase *)v18 openExistingSharedZoneWithID:v20 configuration:v21 delegate:v22 error:v23];
  }
}

- (id)openExistingSharedZoneWithID:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void *)MEMORY[0x1D944CB30]();
  os_log_type_t v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    BOOL v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v20 = v16;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_1D4693000, v15, OS_LOG_TYPE_INFO, "%{public}@Asked to open existing shared zone with ID: %@", buf, 0x16u);
  }
  id v17 = [(HMBCloudDatabase *)v14 _openOrCreateZoneWithScope:3 recordZoneID:v10 delegate:v12 shouldCreate:0 configuration:v11 existingCloudZone:0 error:a6];

  return v17;
}

- (id)openExistingPrivateZoneWithID:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void *)MEMORY[0x1D944CB30]();
  os_log_type_t v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    BOOL v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v20 = v16;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_1D4693000, v15, OS_LOG_TYPE_INFO, "%{public}@Asked to open existing private zone with ID: %@", buf, 0x16u);
  }
  id v17 = [(HMBCloudDatabase *)v14 _openOrCreateZoneWithScope:2 recordZoneID:v10 delegate:v12 shouldCreate:0 configuration:v11 existingCloudZone:0 error:a6];

  return v17;
}

- (id)openOrCreatePrivateZoneWithID:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void *)MEMORY[0x1D944CB30]();
  os_log_type_t v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    BOOL v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v20 = v16;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_1D4693000, v15, OS_LOG_TYPE_INFO, "%{public}@Asked to open or create private zone with ID: %@", buf, 0x16u);
  }
  id v17 = [(HMBCloudDatabase *)v14 _openOrCreateZoneWithScope:2 recordZoneID:v10 delegate:v12 shouldCreate:1 configuration:v11 existingCloudZone:0 error:a6];

  return v17;
}

- (void)handleRemovedZoneIDs:(id)a3 userInitiated:(BOOL)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = a3;
  uint64_t v37 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v37)
  {
    uint64_t v35 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v6 = (void *)MEMORY[0x1D944CB30]();
        uint64_t v7 = self;
        uint64_t v8 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          unint64_t v9 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v46 = v9;
          __int16 v47 = 2112;
          id v48 = v5;
          _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling removed zone ID: %@", buf, 0x16u);
        }
        os_unfair_lock_lock_with_options();
        id v10 = [(HMBCloudDatabase *)v7 zoneStateByZoneID];
        id v11 = [v10 objectForKey:v5];
        id v12 = [v11 cloudZone];

        os_unfair_lock_unlock(&v7->_propertyLock);
        if ([v12 isZoneRebuildInProgress] && !a4)
        {
          int v13 = (void *)MEMORY[0x1D944CB30]();
          os_log_type_t v14 = v7;
          id v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            BOOL v16 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v46 = v16;
            __int16 v47 = 2112;
            id v48 = v5;
            _os_log_impl(&dword_1D4693000, v15, OS_LOG_TYPE_INFO, "%{public}@Normal remove behavior for zone %@ suppressed due to rebuild.", buf, 0x16u);
          }
          goto LABEL_25;
        }
        id v17 = v7;
        id v18 = v5;
        SEL v19 = [(HMBCloudDatabase *)v17 localDatabase];
        id v20 = objc_alloc_init(HMBLocalZoneConfiguration);
        id v43 = 0;
        __int16 v21 = [v19 openZoneWithZoneID:v18 configuration:v20 error:&v43];
        id v22 = v43;

        if (!v21)
        {
          BOOL v26 = (void *)MEMORY[0x1D944CB30]();
          uint64_t v27 = v17;
          char v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            id v29 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            uint64_t v46 = v29;
            __int16 v47 = 2112;
            id v48 = v18;
            __int16 v49 = 2112;
            id v50 = v22;
            _os_log_impl(&dword_1D4693000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to open local zone with ID %@ for removal: %@", buf, 0x20u);
          }
          goto LABEL_21;
        }
        uint64_t v23 = [(HMBCloudDatabase *)v17 localDatabase];
        id v42 = v22;
        char v24 = [v23 removeLocalDataForZone:v21 error:&v42];
        id v25 = v42;

        if ((v24 & 1) == 0)
        {
          BOOL v26 = (void *)MEMORY[0x1D944CB30]();
          uint64_t v30 = v17;
          char v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            id v31 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            uint64_t v46 = v31;
            __int16 v47 = 2112;
            id v48 = v21;
            __int16 v49 = 2112;
            id v50 = v25;
            _os_log_impl(&dword_1D4693000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove local data for zone %@: %@", buf, 0x20u);
          }
          id v22 = v25;
LABEL_21:

          goto LABEL_22;
        }
        id v22 = v25;
LABEL_22:

        [(HMBCloudDatabase *)v17 removeStateForZoneID:v18];
        id v32 = [(HMBCloudDatabase *)v17 delegate];
        if (objc_opt_respondsToSelector()) {
          [v32 cloudDatabase:v17 didRemoveZoneWithID:v18];
        }

LABEL_25:
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v37);
  }
}

- (void)handleUpdatedZonesIDs:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v32 = [MEMORY[0x1E4F1CA80] set];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v4;
  uint64_t v36 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v7 = (void *)MEMORY[0x1D944CB30]();
        uint64_t v8 = self;
        unint64_t v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v43 = v10;
          __int16 v44 = 2112;
          uint64_t v45 = v6;
          _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling updated zone ID: %@", buf, 0x16u);
        }
        os_unfair_lock_lock_with_options();
        id v11 = [(HMBCloudDatabase *)v8 zoneStateByZoneID];
        uint64_t v37 = [v11 objectForKey:v6];

        id v12 = [v37 cloudZone];
        if (!v37)
        {
          context = (void *)MEMORY[0x1D944CB30]();
          int v13 = v8;
          HMFGetOSLogHandle();
          os_log_type_t v14 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = self;
            HMFGetLogIdentifier();
            id v16 = (id)objc_claimAutoreleasedReturnValue();
            id v17 = [(HMBCloudDatabase *)v13 zoneStateByZoneID];
            *(_DWORD *)buf = 138543874;
            id v43 = v16;
            __int16 v44 = 2112;
            uint64_t v45 = v6;
            __int16 v46 = 2112;
            __int16 v47 = v17;
            _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Got update for a zone ID %@ we don't have state for. All zone states: %@", buf, 0x20u);

            self = v15;
          }

          [v32 addObject:v6];
        }
        os_unfair_lock_unlock(&v8->_propertyLock);
        if (v12)
        {
          int v18 = [v12 isZoneRebuildInProgress];
          SEL v19 = (void *)MEMORY[0x1D944CB30]();
          id v20 = v8;
          __int16 v21 = HMFGetOSLogHandle();
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
          if (v18)
          {
            if (v22)
            {
              uint64_t v23 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              id v43 = v23;
              __int16 v44 = 2112;
              uint64_t v45 = v6;
              _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_INFO, "%{public}@Normal update behavior for suppressed due to rebuild for zoneID: %@", buf, 0x16u);
            }
            [v12 handleZoneChangedNotification];
          }
          else
          {
            if (v22)
            {
              char v28 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              id v43 = v28;
              __int16 v44 = 2112;
              uint64_t v45 = v6;
              _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_INFO, "%{public}@Performing cloud pull for open cloud zone with updated zoneID: %@", buf, 0x16u);
            }
            id v29 = +[HMBProcessingOptions optionsWithLabel:@"Fetch due to Subscription Push"];
            id v30 = (id)[v12 performCloudPullWithOptions:v29];
          }
        }
        else
        {
          char v24 = (void *)MEMORY[0x1D944CB30]();
          id v25 = v8;
          BOOL v26 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            uint64_t v27 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v43 = v27;
            __int16 v44 = 2112;
            uint64_t v45 = v6;
            _os_log_impl(&dword_1D4693000, v26, OS_LOG_TYPE_INFO, "%{public}@No open HMBCloudZone exists for zoneID %@", buf, 0x16u);
          }
        }
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v36);
  }

  if ([v32 count]) {
    id v31 = [(HMBCloudDatabase *)self synchronizeZoneStateForZoneIDs:v32];
  }
}

- (void)handleCreatedZoneIDs:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v20 = [(HMBCloudDatabase *)self delegate];
  char v21 = objc_opt_respondsToSelector();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        unint64_t v9 = (void *)MEMORY[0x1D944CB30]();
        id v10 = self;
        id v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          char v28 = v12;
          __int16 v29 = 2112;
          uint64_t v30 = v8;
          _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_INFO, "%{public}@Handling created zone ID: %@", buf, 0x16u);
        }
        os_unfair_lock_lock_with_options();
        int v13 = [(HMBCloudDatabase *)v10 zoneStateByZoneID];
        os_log_type_t v14 = [v13 objectForKey:v8];
        id v15 = [v14 cloudZone];

        os_unfair_lock_unlock(&v10->_propertyLock);
        if ([v15 isZoneRebuildInProgress])
        {
          id v16 = (void *)MEMORY[0x1D944CB30]();
          id v17 = v10;
          int v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            SEL v19 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            char v28 = v19;
            __int16 v29 = 2112;
            uint64_t v30 = v8;
            _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_INFO, "%{public}@Due to rebuild, suppressing normal create behavior for zone with ID: %@", buf, 0x16u);
          }
        }
        else if (v21)
        {
          [v20 cloudDatabase:v10 didCreateZoneWithID:v8];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v5);
  }
}

- (id)shutdown
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (id)synchronizeZoneStateForZoneIDs:(id)a3
{
  id v4 = objc_msgSend(a3, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_62);
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __51__HMBCloudDatabase_synchronizeZoneStateForZoneIDs___block_invoke_2;
  id v12 = &unk_1E69EA260;
  int v13 = self;
  id v14 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:&v9];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F7A0D8], "chainFutures:", v6, v9, v10, v11, v12, v13);

  return v7;
}

void __51__HMBCloudDatabase_synchronizeZoneStateForZoneIDs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 integerValue];
  switch(v7)
  {
    case 1:
      uint64_t v10 = (void *)MEMORY[0x1D944CB30]();
      id v11 = *(id *)(a1 + 32);
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = HMFGetLogIdentifier();
        id v14 = CKDatabaseScopeString();
        int v19 = 138543618;
        id v20 = v13;
        __int16 v21 = 2112;
        BOOL v22 = v14;
        _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_ERROR, "%{public}@Asked to perform zone state synchronization for unsupported database scope: %@", (uint8_t *)&v19, 0x16u);
      }
      id v15 = (void *)MEMORY[0x1E4F7A0D8];
      id v16 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
      uint64_t v17 = [v15 futureWithError:v16];
      goto LABEL_10;
    case 3:
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = [v8 sharedDatabaseState];
      goto LABEL_9;
    case 2:
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = [v8 privateDatabaseState];
LABEL_9:
      id v16 = v9;
      uint64_t v17 = __synchronizeZoneStateForZoneIDs(v8, v6, v9, 1);
LABEL_10:
      int v18 = (void *)v17;

      [*(id *)(a1 + 40) addObject:v18];
      break;
  }
}

uint64_t __51__HMBCloudDatabase_synchronizeZoneStateForZoneIDs___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v3 = [a2 scope];
  return [v2 numberWithInteger:v3];
}

- (void)addDatabaseOperation:(id)a3 forScope:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 3:
      id v9 = v6;
      uint64_t v7 = [(HMBCloudDatabase *)self sharedDatabase];
      break;
    case 2:
      id v9 = v6;
      uint64_t v7 = [(HMBCloudDatabase *)self privateDatabase];
      break;
    case 1:
      id v9 = v6;
      uint64_t v7 = [(HMBCloudDatabase *)self publicDatabase];
      break;
    default:
      goto LABEL_8;
  }
  uint64_t v8 = v7;
  [v7 addOperation:v9];

  id v6 = v9;
LABEL_8:
}

- (void)addContainerOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(HMBCloudDatabase *)self container];
  [v5 addOperation:v4];
}

- (id)_updateAPSRegistration:(BOOL)a3
{
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4F7A0D8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__HMBCloudDatabase__updateAPSRegistration___block_invoke;
  v9[3] = &unk_1E69EA218;
  objc_copyWeak(&v10, &location);
  BOOL v11 = a3;
  id v6 = [(HMBCloudDatabase *)self operationScheduler];
  uint64_t v7 = [v5 lazyFutureWithBlock:v9 scheduler:v6];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v7;
}

void __43__HMBCloudDatabase__updateAPSRegistration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained container];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__HMBCloudDatabase__updateAPSRegistration___block_invoke_2;
  v7[3] = &unk_1E69EA1F0;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v6 = v3;
  id v8 = v6;
  char v10 = *(unsigned char *)(a1 + 40);
  [v5 serverPreferredPushEnvironmentWithCompletionHandler:v7];

  objc_destroyWeak(&v9);
}

void __43__HMBCloudDatabase__updateAPSRegistration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (v6)
  {
    id v9 = (void *)MEMORY[0x1D944CB30]();
    char v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = HMFGetLogIdentifier();
      int v29 = 138543618;
      uint64_t v30 = v11;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_ERROR, "%{public}@[HMBCloudDatabase] Failed to resolve preferred CloudKit environment with error: %@", (uint8_t *)&v29, 0x16u);
    }
    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    if (WeakRetained)
    {
      id v12 = v5;
      if (!v12)
      {
        id v12 = (id)*MEMORY[0x1E4F4E1D0];
        int v13 = (void *)MEMORY[0x1D944CB30]();
        id v14 = v8;
        id v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = HMFGetLogIdentifier();
          int v29 = 138543618;
          uint64_t v30 = v16;
          __int16 v31 = 2112;
          id v32 = v12;
          _os_log_impl(&dword_1D4693000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Did not receive a preferred push environment, defaulting to %@", (uint8_t *)&v29, 0x16u);
        }
      }
      uint64_t v17 = (void *)MEMORY[0x1D944CB30]();
      id v18 = v8;
      int v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = HMFGetLogIdentifier();
        int v29 = 138543618;
        uint64_t v30 = v20;
        __int16 v31 = 2112;
        id v32 = v12;
        _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_INFO, "%{public}@Registering APS Connection for environment: %@", (uint8_t *)&v29, 0x16u);
      }
      __int16 v21 = +[HMBCloudPushHandler sharedHandlerForEnvironment:v12];
      int v22 = *(unsigned __int8 *)(a1 + 48);
      uint64_t v23 = [v18 configuration];
      long long v24 = [v23 sourceApplicationBundleIdentifier];
      if (v22) {
        [v21 addObserver:v18 forBundleIdentifier:v24];
      }
      else {
        [v21 removeAllObserversForBundleIdentifier:v24];
      }

      [*(id *)(a1 + 32) finishWithNoResult];
    }
    else
    {
      long long v25 = (void *)MEMORY[0x1D944CB30]();
      long long v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        int v29 = 138543362;
        uint64_t v30 = v27;
        _os_log_impl(&dword_1D4693000, v26, OS_LOG_TYPE_ERROR, "%{public}@[HMBCloudDatabase] Lost self.", (uint8_t *)&v29, 0xCu);
      }
      char v28 = *(void **)(a1 + 32);
      id v12 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
      [v28 finishWithError:v12];
    }
  }
}

- (void)_performInitialCloudSync
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944CB30](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1D4693000, v5, OS_LOG_TYPE_INFO, "%{public}@Performing initial cloud sync", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = __waitForAccountAvailability(v4);
  [v7 addObject:v8];

  id v9 = [(HMBCloudDatabase *)v4 configuration];
  uint64_t v10 = [v9 subscriptionPushRegistrationAction];

  if (v10 == 1)
  {
    uint64_t v11 = 1;
    goto LABEL_7;
  }
  if (v10 == 2)
  {
    uint64_t v11 = 0;
LABEL_7:
    id v12 = [(HMBCloudDatabase *)v4 _updateAPSRegistration:v11];
    [v7 addObject:v12];
  }
  int v13 = v4;
  id v14 = (void *)MEMORY[0x1E4F7A0D8];
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  char v28 = ____synchronizeAllZoneState_block_invoke;
  int v29 = &unk_1E69EA300;
  uint64_t v30 = v13;
  char v31 = 0;
  id v15 = [MEMORY[0x1E4F7A0F0] immediateScheduler];
  id v16 = [v14 lazyFutureWithBlock:&buf scheduler:v15];

  [v7 addObject:v16];
  uint64_t v17 = v13;
  id v18 = (void *)MEMORY[0x1E4F7A0D8];
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  char v28 = ____removeDeletedZones_block_invoke;
  int v29 = &unk_1E69EA378;
  uint64_t v30 = v17;
  int v19 = v17;
  id v20 = [(HMBCloudDatabase *)v19 operationScheduler];
  __int16 v21 = [v18 lazyFutureWithBlock:&buf scheduler:v20];

  [v7 addObject:v21];
  int v22 = [MEMORY[0x1E4F7A0D8] chainFutures:v7];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __44__HMBCloudDatabase__performInitialCloudSync__block_invoke;
  v26[3] = &unk_1E69EB0B8;
  v26[4] = v19;
  uint64_t v23 = [v22 addSuccessBlock:v26];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __44__HMBCloudDatabase__performInitialCloudSync__block_invoke_52;
  v25[3] = &unk_1E69EA690;
  v25[4] = v19;
  id v24 = (id)[v23 addFailureBlock:v25];
}

void __44__HMBCloudDatabase__performInitialCloudSync__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully performed initial cloud sync", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [*(id *)(a1 + 32) initialCloudSyncFuture];
  [v8 finishWithNoResult];
}

void __44__HMBCloudDatabase__performInitialCloudSync__block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform initial cloud sync (will retry after delay): %@", buf, 0x16u);
  }
  id v8 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__HMBCloudDatabase__performInitialCloudSync__block_invoke_53;
  v9[3] = &unk_1E69EA1C8;
  void v9[4] = v8;
  [v8 retryStartupBlock:v9];
}

uint64_t __44__HMBCloudDatabase__performInitialCloudSync__block_invoke_53(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D944CB30]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D4693000, v4, OS_LOG_TYPE_INFO, "%{public}@Retrying initial cloud sync", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _performInitialCloudSync];
}

- (id)performInitialCloudSync
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  initialCloudSyncFuture = self->_initialCloudSyncFuture;
  if (initialCloudSyncFuture)
  {
    id v5 = initialCloudSyncFuture;
    os_unfair_lock_unlock(p_propertyLock);
    id v6 = (void *)MEMORY[0x1D944CB30]();
    int v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_INFO, "%{public}@Returning existing initial cloud sync future: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    uint64_t v10 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    uint64_t v11 = self->_initialCloudSyncFuture;
    self->_initialCloudSyncFuture = v10;

    id v5 = self->_initialCloudSyncFuture;
    os_unfair_lock_unlock(p_propertyLock);
    [(HMBCloudDatabase *)self _performInitialCloudSync];
  }
  return v5;
}

- (NAScheduler)operationScheduler
{
  v2 = (void *)MEMORY[0x1E4F7A0F0];
  id v3 = [(HMBCloudDatabase *)self configuration];
  id v4 = [v3 operationQueue];
  id v5 = [v2 schedulerWithDispatchQueue:v4];

  return (NAScheduler *)v5;
}

- (CKContainerID)containerID
{
  v2 = [(HMBCloudDatabase *)self container];
  id v3 = [v2 containerID];

  return (CKContainerID *)v3;
}

- (HMBCloudDatabase)initWithLocalDatabase:(id)a3 configuration:(id)a4
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_46:
    _HMFPreconditionFailure();
  }
  id v8 = v7;
  if (!v7) {
    goto LABEL_46;
  }
  uint64_t v9 = (void *)MEMORY[0x1D944CB30]();
  uint64_t v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543874;
    v116 = v12;
    __int16 v117 = 2112;
    id v118 = v6;
    __int16 v119 = 2112;
    v120 = v8;
    _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_INFO, "%{public}@Creating cloud database with localDatabase: %@ configuration: %@", buf, 0x20u);
  }
  int v13 = [HMBLocalZoneIDUnshared alloc];
  uint64_t v14 = [v8 containerID];
  __int16 v15 = [v14 containerIdentifier];
  id v16 = [(HMBLocalZoneIDUnshared *)v13 initWithName:v15];

  uint64_t v17 = objc_alloc_init(HMBMutableLocalZoneConfiguration);
  [(HMBLocalZoneConfiguration *)v17 setCreateIfNeeded:1];
  id v103 = 0;
  id v18 = [v6 openZoneWithZoneID:v16 configuration:v17 error:&v103];
  id v19 = v103;
  if (v18)
  {
    v95 = v17;
    id v98 = v6;
    id v20 = objc_alloc_init(MEMORY[0x1E4F19EE0]);
    objc_msgSend(v20, "setUseZoneWidePCS:", objc_msgSend(v8, "isManateeContainer"));
    id v21 = objc_alloc(MEMORY[0x1E4F19EC8]);
    int v22 = [v8 containerID];
    v92 = v20;
    uint64_t v23 = (void *)[v21 initWithContainerID:v22 options:v20];

    id v24 = [v8 sourceApplicationBundleIdentifier];
    v91 = v23;
    [v23 setSourceApplicationBundleIdentifier:v24];

    id v90 = [v8 containerID];
    v93 = v18;
    id v25 = v18;
    long long v26 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    v102 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v27 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A089A5B9-6D32-4A0E-B611-0492B7D9F3D5"];
    uint64_t v28 = objc_opt_class();
    id v108 = 0;
    v101 = (void *)v27;
    int v29 = [v25 fetchModelsWithParentModelID:v27 ofType:v28 error:&v108];
    id v99 = v108;
    if (!v29)
    {
      uint64_t v30 = (void *)MEMORY[0x1D944CB30]();
      char v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        v116 = v32;
        __int16 v117 = 2112;
        id v118 = v99;
        _os_log_impl(&dword_1D4693000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to load cloud database states: %@", buf, 0x16u);
      }
    }
    v100 = v25;
    id v94 = v19;
    v96 = v16;
    v97 = v10;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v33 = v29;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v104 objects:buf count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v105;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v105 != v36) {
            objc_enumerationMutation(v33);
          }
          long long v38 = *(void **)(*((void *)&v104 + 1) + 8 * i);
          long long v39 = [v38 cloudID];
          uint64_t v40 = [v39 scope];

          long long v41 = [MEMORY[0x1E4F28ED0] numberWithInteger:v40];
          [v26 setObject:v38 forKeyedSubscript:v41];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v104 objects:buf count:16];
      }
      while (v35);
    }

    id v42 = [v26 objectForKeyedSubscript:&unk_1F2C4CA08];

    if (!v42)
    {
      id v43 = [[HMBCloudID alloc] initWithContainerID:v90 scope:1];
      __int16 v44 = [HMBCloudDatabaseStateModel alloc];
      uint64_t v45 = [(HMBCloudID *)v43 modelID];
      __int16 v46 = [(HMBCloudDatabaseStateModel *)v44 initWithModelID:v45 parentModelID:v101];

      __int16 v47 = (void *)MEMORY[0x1D944CB30]([(HMBCloudDatabaseStateModel *)v46 setCloudID:v43]);
      id v48 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        uint64_t v49 = HMFGetLogIdentifier();
        *(_DWORD *)v109 = 138543874;
        v110 = v49;
        __int16 v111 = 2112;
        v112 = v43;
        __int16 v113 = 2112;
        v114 = v46;
        _os_log_impl(&dword_1D4693000, v48, OS_LOG_TYPE_INFO, "%{public}@Created public database state model with cloudID %@: %@", v109, 0x20u);
      }
      [v26 setObject:v46 forKeyedSubscript:&unk_1F2C4CA08];
      [v102 addObject:v46];
    }
    id v50 = [v26 objectForKeyedSubscript:&unk_1F2C4CA20];

    uint64_t v51 = v102;
    if (!v50)
    {
      id v52 = [[HMBCloudID alloc] initWithContainerID:v90 scope:2];
      uint64_t v53 = [HMBCloudDatabaseStateModel alloc];
      v54 = [(HMBCloudID *)v52 modelID];
      __int16 v55 = [(HMBCloudDatabaseStateModel *)v53 initWithModelID:v54 parentModelID:v101];

      double v56 = (void *)MEMORY[0x1D944CB30]([(HMBCloudDatabaseStateModel *)v55 setCloudID:v52]);
      uint64_t v57 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        v58 = HMFGetLogIdentifier();
        *(_DWORD *)v109 = 138543874;
        v110 = v58;
        __int16 v111 = 2112;
        v112 = v52;
        __int16 v113 = 2112;
        v114 = v55;
        _os_log_impl(&dword_1D4693000, v57, OS_LOG_TYPE_INFO, "%{public}@Created private database state model with cloudID %@: %@", v109, 0x20u);
      }
      [v26 setObject:v55 forKeyedSubscript:&unk_1F2C4CA20];
      uint64_t v51 = v102;
      [v102 addObject:v55];
    }
    v59 = [v26 objectForKeyedSubscript:&unk_1F2C4CA38];

    if (!v59)
    {
      id v60 = [[HMBCloudID alloc] initWithContainerID:v90 scope:3];
      id v61 = [HMBCloudDatabaseStateModel alloc];
      v62 = [(HMBCloudID *)v60 modelID];
      id v63 = [(HMBCloudDatabaseStateModel *)v61 initWithModelID:v62 parentModelID:v101];

      v64 = (void *)MEMORY[0x1D944CB30]([(HMBCloudDatabaseStateModel *)v63 setCloudID:v60]);
      v65 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        id v66 = HMFGetLogIdentifier();
        *(_DWORD *)v109 = 138543874;
        v110 = v66;
        __int16 v111 = 2112;
        v112 = v60;
        __int16 v113 = 2112;
        v114 = v63;
        _os_log_impl(&dword_1D4693000, v65, OS_LOG_TYPE_INFO, "%{public}@Created shared database state model with cloudID %@: %@", v109, 0x20u);
      }
      [v26 setObject:v63 forKeyedSubscript:&unk_1F2C4CA38];
      uint64_t v51 = v102;
      [v102 addObject:v63];
    }
    BOOL v67 = v100;
    if ([v51 count])
    {
      id v68 = [v100 update:v51];
      if (v68)
      {
        v69 = (void *)MEMORY[0x1D944CB30]();
        v70 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          __int16 v71 = HMFGetLogIdentifier();
          *(_DWORD *)v109 = 138543618;
          v110 = v71;
          __int16 v111 = 2112;
          v112 = v68;
          _os_log_impl(&dword_1D4693000, v70, OS_LOG_TYPE_ERROR, "%{public}@Unable to update cloud database models: %@", v109, 0x16u);

          BOOL v67 = v100;
        }

        uint64_t v51 = v102;
      }
    }
    id v72 = (void *)[v26 copy];

    id v73 = v67;
    uint64_t v74 = objc_opt_class();
    *(void *)&long long v104 = 0;
    v75 = [v73 fetchModelsOfType:v74 error:&v104];
    id v76 = (id)v104;
    if (v75)
    {
      id v77 = v75;
    }
    else
    {
      v82 = (void *)MEMORY[0x1D944CB30]();
      id v83 = v73;
      v84 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_FAULT))
      {
        v85 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        v116 = v85;
        __int16 v117 = 2112;
        id v118 = v76;
        _os_log_impl(&dword_1D4693000, v84, OS_LOG_TYPE_FAULT, "%{public}@Unable to load zone model state: %@", buf, 0x16u);
      }
      id v77 = [MEMORY[0x1E4F1CAD0] set];
    }
    v86 = v77;

    v87 = [[HMBCloudCredentialsAvailabilityListener alloc] initWithContainer:v91];
    v88 = objc_alloc_init(HMBCloudDatabaseDataSource);
    id v6 = v98;
    uint64_t v10 = [(HMBCloudDatabase *)v97 initWithLocalDatabase:v98 stateZone:v73 container:v91 configuration:v8 databaseStateModelsByScope:v72 zoneStateModels:v86 credentialsAvailabilityListener:v87 dataSource:v88];

    uint64_t v81 = v10;
    uint64_t v17 = v95;
    id v16 = v96;
    id v18 = v93;
    id v19 = v94;
  }
  else
  {
    id v78 = (void *)MEMORY[0x1D944CB30]();
    __int16 v79 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      id v80 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      v116 = v80;
      __int16 v117 = 2112;
      id v118 = v19;
      _os_log_impl(&dword_1D4693000, v79, OS_LOG_TYPE_ERROR, "%{public}@Failed to create state zone for database: %@", buf, 0x16u);

      id v18 = 0;
    }

    uint64_t v81 = 0;
  }

  return v81;
}

- (HMBCloudDatabase)initWithLocalDatabase:(id)a3 stateZone:(id)a4 container:(id)a5 configuration:(id)a6 databaseStateModelsByScope:(id)a7 zoneStateModels:(id)a8 credentialsAvailabilityListener:(id)a9 dataSource:(id)a10
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id obj = a4;
  id v18 = a4;
  id v58 = a5;
  id v63 = a5;
  id v19 = a6;
  id v64 = a7;
  id v20 = a8;
  id v62 = a9;
  id v21 = a10;
  id v61 = v17;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_24;
  }
  if (!v18)
  {
LABEL_24:
    _HMFPreconditionFailure();
    goto LABEL_25;
  }
  if (!v63)
  {
LABEL_25:
    _HMFPreconditionFailure();
    goto LABEL_26;
  }
  if (!v64)
  {
LABEL_26:
    _HMFPreconditionFailure();
    goto LABEL_27;
  }
  if (!v20)
  {
LABEL_27:
    _HMFPreconditionFailure();
    goto LABEL_28;
  }
  if (!v62)
  {
LABEL_28:
    _HMFPreconditionFailure();
    goto LABEL_29;
  }
  if (!v21)
  {
LABEL_29:
    _HMFPreconditionFailure();
LABEL_30:
    _HMFPreconditionFailure();
    goto LABEL_31;
  }
  id v60 = v21;
  v69.receiver = self;
  v69.super_class = (Class)HMBCloudDatabase;
  int v22 = [(HMBCloudDatabase *)&v69 init];
  uint64_t v23 = v22;
  if (!v22) {
    goto LABEL_22;
  }
  objc_storeStrong((id *)&v22->_localDatabase, a3);
  objc_storeStrong((id *)&v23->_stateZone, obj);
  p_container = (id *)&v23->_container;
  objc_storeStrong((id *)&v23->_container, v58);
  uint64_t v25 = [v19 copy];
  configuration = v23->_configuration;
  v23->_configuration = (HMBCloudDatabaseConfiguration *)v25;

  objc_storeStrong((id *)&v23->_credentialsAvailabilityListener, a9);
  objc_storeStrong((id *)&v23->_dataSource, a10);
  uint64_t v27 = [(CKContainer *)v23->_container publicCloudDatabase];
  publicDatabase = v23->_publicDatabase;
  v23->_publicDatabase = (CKDatabase *)v27;

  uint64_t v29 = [v64 objectForKeyedSubscript:&unk_1F2C4CA08];
  publicDatabaseState = v23->_publicDatabaseState;
  v23->_publicDatabaseState = (HMBCloudDatabaseStateModel *)v29;

  [(HMBCloudDatabaseStateModel *)v23->_publicDatabaseState setDatabase:v23->_publicDatabase];
  if (!v23->_publicDatabaseState) {
    goto LABEL_30;
  }
  uint64_t v31 = [*p_container privateCloudDatabase];
  privateDatabase = v23->_privateDatabase;
  v23->_privateDatabase = (CKDatabase *)v31;

  uint64_t v33 = [v64 objectForKeyedSubscript:&unk_1F2C4CA20];
  privateDatabaseState = v23->_privateDatabaseState;
  v23->_privateDatabaseState = (HMBCloudDatabaseStateModel *)v33;

  [(HMBCloudDatabaseStateModel *)v23->_privateDatabaseState setDatabase:v23->_privateDatabase];
  if (!v23->_privateDatabaseState)
  {
LABEL_31:
    _HMFPreconditionFailure();
LABEL_32:
    _HMFPreconditionFailure();
  }
  uint64_t v35 = [*p_container sharedCloudDatabase];
  sharedDatabase = v23->_sharedDatabase;
  v23->_sharedDatabase = (CKDatabase *)v35;

  uint64_t v37 = [v64 objectForKeyedSubscript:&unk_1F2C4CA38];
  sharedDatabaseState = v23->_sharedDatabaseState;
  v23->_sharedDatabaseState = (HMBCloudDatabaseStateModel *)v37;

  [(HMBCloudDatabaseStateModel *)v23->_sharedDatabaseState setDatabase:v23->_sharedDatabase];
  if (!v23->_sharedDatabaseState) {
    goto LABEL_32;
  }
  id v59 = v18;
  uint64_t v39 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
  zoneStateByZoneID = v23->_zoneStateByZoneID;
  v23->_zoneStateByZoneID = (NSMutableDictionary *)v39;

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obja = v20;
  id v41 = v20;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v66 != v44) {
          objc_enumerationMutation(v41);
        }
        __int16 v46 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        __int16 v47 = objc_msgSend(v46, "zoneID", obja);

        if (v47)
        {
          id v48 = v23->_zoneStateByZoneID;
          uint64_t v49 = [v46 zoneID];
          [(NSMutableDictionary *)v48 setObject:v46 forKey:v49];
        }
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v43);
  }

  id v50 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
  invitationOperationQueue = v23->_invitationOperationQueue;
  v23->_invitationOperationQueue = v50;

  [(NSOperationQueue *)v23->_invitationOperationQueue setMaxConcurrentOperationCount:1];
  [(NSOperationQueue *)v23->_invitationOperationQueue setQualityOfService:17];
  id v52 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
  databaseFetchOperationQueue = v23->_databaseFetchOperationQueue;
  v23->_databaseFetchOperationQueue = v52;

  [(NSOperationQueue *)v23->_databaseFetchOperationQueue setMaxConcurrentOperationCount:1];
  [(NSOperationQueue *)v23->_databaseFetchOperationQueue setQualityOfService:25];
  id cloudZoneFactory = v23->_cloudZoneFactory;
  v23->_id cloudZoneFactory = &__block_literal_global_3746;

  id v18 = v59;
  id v20 = obja;
LABEL_22:

  return v23;
}

HMBCloudZone *__162__HMBCloudDatabase_initWithLocalDatabase_stateZone_container_configuration_databaseStateModelsByScope_zoneStateModels_credentialsAvailabilityListener_dataSource___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [[HMBCloudZone alloc] initWithCloudDatabase:v8 configuration:v7 state:v6];

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t100 != -1) {
    dispatch_once(&logCategory__hmf_once_t100, &__block_literal_global_116);
  }
  v2 = (void *)logCategory__hmf_once_v101;
  return v2;
}

uint64_t __31__HMBCloudDatabase_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v101;
  logCategory__hmf_once_v101 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)removePrivateZoneWithID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 scope] == 2)
  {
    id v5 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    id v16 = v4;
    id v6 = [(HMBCloudDatabase *)self operationScheduler];
    id v7 = [v5 lazyFutureWithBlock:&v15 scheduler:v6];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove zone with ID %@ on a non-private database", buf, 0x16u);
    }
    __int16 v12 = (void *)MEMORY[0x1E4F7A0D8];
    int v13 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
    id v7 = [v12 futureWithError:v13];
  }
  return v7;
}

void __55__HMBCloudDatabase_CloudZone__removePrivateZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v12 = 138543618;
    int v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing private cloud zone with ID %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = [v9 privateDatabase];
  uint64_t v11 = [*(id *)(a1 + 40) zoneID];
  __modifyRecordZoneOperation(v9, v10, 0, v11, 0, v3);
}

- (id)createPrivateZoneWithID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 scope] == 2)
  {
    id v5 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    id v16 = v4;
    id v6 = [(HMBCloudDatabase *)self operationScheduler];
    id v7 = [v5 lazyFutureWithBlock:&v15 scheduler:v6];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to create zone with ID %@ on a non-private database.", buf, 0x16u);
    }
    int v12 = (void *)MEMORY[0x1E4F7A0D8];
    int v13 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
    id v7 = [v12 futureWithError:v13];
  }
  return v7;
}

void __55__HMBCloudDatabase_CloudZone__createPrivateZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v27 = v7;
    __int16 v28 = 2112;
    uint64_t v29 = v8;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating private cloud zone with ID: %@", buf, 0x16u);
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F7A0E8]);
  id v10 = objc_alloc(MEMORY[0x1E4F1A310]);
  uint64_t v11 = [*(id *)(a1 + 40) zoneID];
  int v12 = (void *)[v10 initWithZoneID:v11];

  int v13 = *(void **)(a1 + 32);
  __int16 v14 = [v13 privateDatabase];
  __modifyRecordZoneOperation(v13, v14, v12, 0, 0, v9);

  uint64_t v15 = [v9 future];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  int v22 = __55__HMBCloudDatabase_CloudZone__createPrivateZoneWithID___block_invoke_5;
  uint64_t v23 = &unk_1E69EA668;
  id v16 = *(void **)(a1 + 40);
  uint64_t v24 = *(void *)(a1 + 32);
  id v25 = v16;
  id v17 = [v15 addSuccessBlock:&v20];
  id v18 = objc_msgSend(v3, "completionHandlerAdapter", v20, v21, v22, v23, v24);
  id v19 = (id)[v17 addCompletionBlock:v18];
}

void __55__HMBCloudDatabase_CloudZone__createPrivateZoneWithID___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  id v5 = [*(id *)(a1 + 32) zoneStateByZoneID];
  id v6 = [v5 objectForKey:*(void *)(a1 + 40)];

  if (!v6)
  {
    id v7 = (void *)MEMORY[0x1D944CB30]();
    id v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138543618;
      int v22 = v10;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_FAULT, "%{public}@Local zone model state was removed while creating CKRecordZone with ID: %@", buf, 0x16u);
    }
    int v12 = [HMBCloudZoneStateModel alloc];
    int v13 = [*(id *)(a1 + 40) modelID];
    __int16 v14 = [*(id *)(a1 + 32) privateDatabaseState];
    uint64_t v15 = [v14 hmbModelID];
    id v6 = [(HMBCloudZoneStateModel *)v12 initWithModelID:v13 parentModelID:v15];

    [(HMBCloudZoneStateModel *)v6 setZoneID:*(void *)(a1 + 40)];
    id v16 = [*(id *)(a1 + 32) zoneStateByZoneID];
    [v16 setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  [(HMBCloudZoneStateModel *)v6 setNeedsZoneCreation:MEMORY[0x1E4F1CC28]];
  id v17 = [*(id *)(a1 + 32) stateZone];
  uint64_t v20 = v6;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  id v19 = (id)[v17 update:v18];

  os_unfair_lock_unlock(v4);
}

- (id)fetchZonesWithIDs:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F7A0D8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__HMBCloudDatabase_CloudZone__fetchZonesWithIDs_inDatabase___block_invoke;
  v14[3] = &unk_1E69EA4D8;
  id v15 = v6;
  id v16 = self;
  id v17 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = [(HMBCloudDatabase *)self operationScheduler];
  int v12 = [v8 lazyFutureWithBlock:v14 scheduler:v11];

  return v12;
}

void __60__HMBCloudDatabase_CloudZone__fetchZonesWithIDs_inDatabase___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "na_map:", &__block_literal_global_3855);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  __fetchCloudZones(*(void **)(a1 + 40), v5, *(void **)(a1 + 48), 0, v4);
}

uint64_t __60__HMBCloudDatabase_CloudZone__fetchZonesWithIDs_inDatabase___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 zoneID];
}

- (void)updateNeedsZoneDeletion:(BOOL)a3 forZoneWithID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  p_propertyLock = &self->_propertyLock;
  uint64_t v8 = os_unfair_lock_lock_with_options();
  id v9 = (void *)MEMORY[0x1D944CB30](v8);
  id v10 = self;
  HMFGetOSLogHandle();
  uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    int v13 = HMFBooleanToString();
    *(_DWORD *)long long buf = 138543874;
    id v30 = v12;
    __int16 v31 = 2112;
    id v32 = v13;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Updating needs deletion to %@ for zone with ID: %@", buf, 0x20u);
  }
  __int16 v14 = [(HMBCloudDatabase *)v10 zoneStateByZoneID];
  id v15 = [v14 objectForKeyedSubscript:v6];

  if (v15)
  {
    id v16 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
    [v15 setNeedsZoneDeletion:v16];

    id v17 = [(HMBCloudDatabase *)v10 stateZone];
    __int16 v28 = v15;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    id v19 = [v17 update:v18];

    if (v19)
    {
      uint64_t v20 = (void *)MEMORY[0x1D944CB30]();
      uint64_t v21 = v10;
      HMFGetOSLogHandle();
      int v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        id v30 = v23;
        __int16 v31 = 2112;
        id v32 = v19;
        _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to update needs zone deletion on state model for zone: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v25 = v10;
    HMFGetOSLogHandle();
    long long v26 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v30 = v27;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl(&dword_1D4693000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to find state model to update needs zone deletion for with zone ID %@", buf, 0x16u);
    }
  }

  os_unfair_lock_unlock(p_propertyLock);
}

- (void)updateRebuildStatus:(id)a3 forZoneWithID:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_propertyLock = &self->_propertyLock;
  uint64_t v9 = os_unfair_lock_lock_with_options();
  id v10 = (void *)MEMORY[0x1D944CB30](v9);
  uint64_t v11 = self;
  HMFGetOSLogHandle();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543874;
    uint64_t v29 = v13;
    __int16 v30 = 2112;
    id v31 = v7;
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Updating rebuild state for zone %@: %@", buf, 0x20u);
  }
  __int16 v14 = [(HMBCloudDatabase *)v11 zoneStateByZoneID];
  id v15 = [v14 objectForKey:v7];

  if (v15)
  {
    [v15 setRebuilderStatus:v6];
    id v16 = [(HMBCloudDatabase *)v11 stateZone];
    uint64_t v27 = v15;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    id v18 = [v16 update:v17];

    if (v18)
    {
      id v19 = (void *)MEMORY[0x1D944CB30]();
      uint64_t v20 = v11;
      HMFGetOSLogHandle();
      uint64_t v21 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v22 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        uint64_t v29 = v22;
        __int16 v30 = 2112;
        id v31 = v18;
        _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to update state model for zone: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    __int16 v23 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v24 = v11;
    HMFGetOSLogHandle();
    uint64_t v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      long long v26 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v29 = v26;
      _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to find state model for zone.", buf, 0xCu);
    }
  }

  os_unfair_lock_unlock(p_propertyLock);
}

- (void)updateServerChangeToken:(id)a3 forZoneWithID:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  uint64_t v9 = [(HMBCloudDatabase *)self zoneStateByZoneID];
  id v10 = [v9 objectForKey:v7];

  uint64_t v11 = (void *)MEMORY[0x1D944CB30]();
  id v12 = self;
  if (v10)
  {
    HMFGetOSLogHandle();
    int v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      id v15 = [v6 hmbDescription];
      *(_DWORD *)long long buf = 138543874;
      id v28 = v14;
      __int16 v29 = 2112;
      id v30 = v7;
      __int16 v31 = 2112;
      __int16 v32 = v15;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Updating server change token of %@ to %@", buf, 0x20u);
    }
    id v16 = [v10 serverChangeToken];
    [v10 setServerChangeToken:v6];
    id v17 = [(HMBCloudDatabase *)v12 stateZone];
    long long v26 = v10;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    id v19 = [v17 update:v18];

    if (v19)
    {
      uint64_t v20 = (void *)MEMORY[0x1D944CB30]();
      uint64_t v21 = v12;
      HMFGetOSLogHandle();
      int v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543874;
        id v28 = v23;
        __int16 v29 = 2112;
        id v30 = v10;
        __int16 v31 = 2112;
        __int16 v32 = v19;
        _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to update server change token for zone %@: %@", buf, 0x20u);
      }
      [v10 setServerChangeToken:v16];
    }
  }
  else
  {
    HMFGetOSLogHandle();
    uint64_t v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v28 = v25;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_1D4693000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot find zone model to update server change for with zone ID %@", buf, 0x16u);
    }
  }

  os_unfair_lock_unlock(p_propertyLock);
}

- (void)updateServerChangeToken:(id)a3 forDatabaseWithScope:(int64_t)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  uint64_t v8 = [(HMBCloudDatabase *)self databaseStateForDatabaseScope:a4];
  uint64_t v9 = [v8 serverChangeToken];
  [v8 setServerChangeToken:v6];
  id v10 = [(HMBCloudDatabase *)self stateZone];
  v23[0] = v8;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v12 = [v10 update:v11];

  if (v12)
  {
    int v13 = (void *)MEMORY[0x1D944CB30]();
    id v14 = self;
    HMFGetOSLogHandle();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      int v17 = 138543874;
      id v18 = v16;
      __int16 v19 = 2048;
      int64_t v20 = a4;
      __int16 v21 = 2112;
      int v22 = v12;
      _os_log_impl(&dword_1D4693000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to update server change token for scope %ld: %@", (uint8_t *)&v17, 0x20u);
    }
    [v8 setServerChangeToken:v9];
  }

  os_unfair_lock_unlock(p_propertyLock);
}

- (BOOL)needsZoneCreationForZoneWithID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMBCloudDatabase *)self zoneStateByZoneID];
  id v7 = [v6 objectForKey:v4];

  if (v7)
  {
    uint64_t v8 = [v7 needsZoneCreation];
    char v9 = [v8 BOOLValue];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v11 = self;
    HMFGetOSLogHandle();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v13;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot find zone model to fetch needs zone creation for with zone ID %@", (uint8_t *)&v15, 0x16u);
    }
    char v9 = 0;
  }

  os_unfair_lock_unlock(p_propertyLock);
  return v9;
}

- (id)serverChangeTokenForZoneWithID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMBCloudDatabase *)self zoneStateByZoneID];
  id v7 = [v6 objectForKey:v4];

  if (v7)
  {
    uint64_t v8 = [v7 serverChangeToken];
  }
  else
  {
    char v9 = (void *)MEMORY[0x1D944CB30]();
    id v10 = self;
    HMFGetOSLogHandle();
    uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      int v14 = 138543618;
      int v15 = v12;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot find zone model to fetch server change token for with zone ID %@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v8 = 0;
  }

  os_unfair_lock_unlock(p_propertyLock);
  return v8;
}

- (id)subscriptionIDForZoneID:(id)a3 recordType:(id)a4
{
  id v5 = a3;
  if (a4)
  {
    id v6 = [NSString stringWithFormat:@".%@", a4];
  }
  else
  {
    id v6 = &stru_1F2C3E4E0;
  }
  id v7 = NSString;
  [v5 scope];
  uint64_t v8 = CKDatabaseScopeString();
  char v9 = [v5 containerID];
  id v10 = [v9 containerIdentifier];
  uint64_t v11 = [v5 zoneID];
  id v12 = [v11 hmbDescription];
  int v13 = [v7 stringWithFormat:@"ZoneSubscription_%@.%@.%@%@", v8, v10, v12, v6];

  return v13;
}

- (id)subscriptionIDForCloudID:(id)a3 recordType:(id)a4
{
  id v5 = a3;
  if (a4)
  {
    id v6 = [NSString stringWithFormat:@".%@", a4];
  }
  else
  {
    id v6 = &stru_1F2C3E4E0;
  }
  id v7 = NSString;
  [v5 scope];
  uint64_t v8 = CKDatabaseScopeString();
  char v9 = [v5 containerID];
  id v10 = [v9 containerIdentifier];
  uint64_t v11 = [v7 stringWithFormat:@"DBSubscription_%@.%@%@", v8, v10, v6];

  return v11;
}

- (id)fetchSubscriptionsInDatabase:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4F7A0D8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__HMBCloudDatabase_CloudSubscription__fetchSubscriptionsInDatabase___block_invoke;
  v10[3] = &unk_1E69EAAD8;
  objc_copyWeak(&v12, &location);
  id v6 = v4;
  id v11 = v6;
  id v7 = [(HMBCloudDatabase *)self operationScheduler];
  uint64_t v8 = [v5 lazyFutureWithBlock:v10 scheduler:v7];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

void __68__HMBCloudDatabase_CloudSubscription__fetchSubscriptionsInDatabase___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  __fetchSubscriptions(WeakRetained, *(void **)(a1 + 32), 0, v4);
}

- (id)fetchCurrentUserRecordForDatabase:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  id v11 = v4;
  id v6 = v4;
  id v7 = [(HMBCloudDatabase *)self operationScheduler];
  uint64_t v8 = [v5 lazyFutureWithBlock:&v10 scheduler:v7];

  return v8;
}

void __65__HMBCloudDatabase_CloudUser__fetchCurrentUserRecordForDatabase___block_invoke(uint64_t a1, void *a2)
{
}

- (id)acceptInvitationWithShareMetadata:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  id v11 = v4;
  id v6 = v4;
  id v7 = [(HMBCloudDatabase *)self operationScheduler];
  uint64_t v8 = [v5 lazyFutureWithBlock:&v10 scheduler:v7];

  return v8;
}

void __65__HMBCloudDatabase_CloudUser__acceptInvitationWithShareMetadata___block_invoke(uint64_t a1, void *a2)
{
}

- (id)fetchShareMetadataForInvitation:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  id v11 = v4;
  id v6 = v4;
  id v7 = [(HMBCloudDatabase *)self operationScheduler];
  uint64_t v8 = [v5 lazyFutureWithBlock:&v10 scheduler:v7];

  return v8;
}

void __63__HMBCloudDatabase_CloudUser__fetchShareMetadataForInvitation___block_invoke(uint64_t a1, void *a2)
{
}

- (id)fetchParticipantWithLookupInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  id v11 = v4;
  id v6 = v4;
  id v7 = [(HMBCloudDatabase *)self operationScheduler];
  uint64_t v8 = [v5 lazyFutureWithBlock:&v10 scheduler:v7];

  return v8;
}

void __62__HMBCloudDatabase_CloudUser__fetchParticipantWithLookupInfo___block_invoke(uint64_t a1, void *a2)
{
}

- (id)performCloudPullForScope:(int64_t)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = -[HMBCloudDatabase databaseStateForDatabaseScope:](self, "databaseStateForDatabaseScope:");
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    os_unfair_lock_lock_with_options();
    id v6 = [v4 queuedCloudPullFuture];
    if (v6)
    {
      id v7 = [v5 completionHandlerAdapter];
      id v8 = (id)[v6 addCompletionBlock:v7];

      os_unfair_lock_unlock(&self->_propertyLock);
      char v9 = (void *)MEMORY[0x1D944CB30]();
      uint64_t v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = HMFGetLogIdentifier();
        int v13 = CKDatabaseScopeString();
        *(_DWORD *)long long buf = 138543618;
        uint64_t v40 = v12;
        __int16 v41 = 2112;
        uint64_t v42 = v13;
        _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_INFO, "%{public}@Coalescing cloud pull for scope: %@", buf, 0x16u);
      }
    }
    else
    {
      [v4 setQueuedCloudPullFuture:v5];
      os_unfair_lock_unlock(&self->_propertyLock);
      __int16 v21 = (void *)MEMORY[0x1D944CB30]();
      int v22 = self;
      __int16 v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        uint64_t v25 = CKDatabaseScopeString();
        *(_DWORD *)long long buf = 138543618;
        uint64_t v40 = v24;
        __int16 v41 = 2112;
        uint64_t v42 = v25;
        _os_log_impl(&dword_1D4693000, v23, OS_LOG_TYPE_INFO, "%{public}@Queueing up cloud pull for scope: %@", buf, 0x16u);
      }
      long long v26 = [HMBFutureOperation alloc];
      uint64_t v33 = MEMORY[0x1E4F143A8];
      uint64_t v34 = 3221225472;
      uint64_t v35 = __56__HMBCloudDatabase_ZoneFetch__performCloudPullForScope___block_invoke;
      uint64_t v36 = &unk_1E69EB530;
      uint64_t v37 = v22;
      id v38 = v4;
      uint64_t v27 = [(HMBFutureOperation *)v26 initWithBlock:&v33];
      id v28 = [(HMBCloudDatabase *)v22 databaseFetchOperationQueue];
      [v28 addOperation:v27];

      __int16 v29 = [(HMBFutureOperation *)v27 future];
      id v30 = [v5 completionHandlerAdapter];
      id v31 = (id)[v29 addCompletionBlock:v30];
    }
  }
  else
  {
    int v14 = (void *)MEMORY[0x1D944CB30]();
    int v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      uint64_t v18 = CKDatabaseScopeString();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v40 = v17;
      __int16 v41 = 2112;
      uint64_t v42 = v18;
      _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch updated zones for unsupported database scope: %@", buf, 0x16u);
    }
    uint64_t v19 = (void *)MEMORY[0x1E4F7A0D8];
    int64_t v20 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
    id v5 = [v19 futureWithError:v20];
  }
  return v5;
}

id __56__HMBCloudDatabase_ZoneFetch__performCloudPullForScope___block_invoke(uint64_t a1)
{
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  [*(id *)(a1 + 40) setQueuedCloudPullFuture:0];
  os_unfair_lock_unlock(v2);
  id v3 = objc_alloc_init(MEMORY[0x1E4F7A0E8]);
  id v5 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v6 = [v4 serverChangeToken];
  __performCloudPull(v5, v4, v6, 0, v3);

  id v7 = [v3 future];

  return v7;
}

- (id)databaseStateForDatabaseScope:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v3 = [(HMBCloudDatabase *)self publicDatabaseState];
      break;
    case 3:
      id v3 = [(HMBCloudDatabase *)self sharedDatabaseState];
      break;
    case 2:
      id v3 = [(HMBCloudDatabase *)self privateDatabaseState];
      break;
    default:
      id v3 = 0;
      break;
  }
  return v3;
}

- (id)synchronizeSharedZones
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944CB30](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1D4693000, v5, OS_LOG_TYPE_INFO, "%{public}@Asked to synchronize shared zones", (uint8_t *)&v9, 0xCu);
  }
  id v7 = [(HMBCloudDatabase *)v4 performCloudPullForScope:3];
  return v7;
}

- (NSSet)publicZoneIDs
{
  return (NSSet *)[(HMBCloudDatabase *)self _zonesWithScope:1];
}

- (NSSet)sharedZoneIDs
{
  return (NSSet *)[(HMBCloudDatabase *)self _zonesWithScope:3];
}

- (id)registerPrivateSubscription:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944CB30]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    uint64_t v33 = v8;
    __int16 v34 = 2112;
    id v35 = v4;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Asked to register subscription for Private DB: %@", buf, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  int v9 = [(HMBCloudDatabase *)v6 privateDatabaseState];
  uint64_t v10 = [v9 subscriptions];
  os_unfair_lock_unlock(&v6->_propertyLock);
  if (v10)
  {
    if ([v10 count])
    {
      uint64_t v11 = (void *)MEMORY[0x1D944CB30]();
      id v12 = v6;
      int v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v14 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543874;
        uint64_t v33 = v14;
        __int16 v34 = 2112;
        id v35 = v4;
        __int16 v36 = 2112;
        uint64_t v37 = v10;
        _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Not registering DB subscription %@ because it appears to already exist in our list of subscriptions: %@", buf, 0x20u);
      }
      int v15 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    }
    else
    {
      int v22 = [v9 database];
      id v31 = v4;
      __int16 v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      uint64_t v24 = [(HMBCloudDatabase *)v6 pushSubscriptionsForDatabase:v22 subscriptionsToSave:v23 subscriptionIDsToRemove:MEMORY[0x1E4F1CBF0]];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __71__HMBCloudDatabase_Subscription_Internal__registerPrivateSubscription___block_invoke;
      v26[3] = &unk_1E69EBC88;
      id v27 = v10;
      id v28 = v4;
      __int16 v29 = v6;
      id v30 = v9;
      int v15 = [v24 addSuccessBlock:v26];
    }
  }
  else
  {
    __int16 v16 = (void *)MEMORY[0x1D944CB30]();
    id v17 = v6;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v33 = v19;
      _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Asked to register subscription on PrivateDB, but no subscriptions!.", buf, 0xCu);
    }
    int64_t v20 = (void *)MEMORY[0x1E4F7A0D8];
    __int16 v21 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    int v15 = [v20 futureWithError:v21];
  }
  return v15;
}

void __71__HMBCloudDatabase_Subscription_Internal__registerPrivateSubscription___block_invoke(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) setByAddingObject:*(void *)(a1 + 40)];
  id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 48) + 8);
  os_unfair_lock_lock_with_options();
  [*(id *)(a1 + 56) setSubscriptions:v4];
  id v6 = [*(id *)(a1 + 48) stateZone];
  v17[0] = *(void *)(a1 + 56);
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v8 = [v6 update:v7];

  if (v8)
  {
    int v9 = (void *)MEMORY[0x1D944CB30]();
    id v10 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      int v14 = v12;
      __int16 v15 = 2112;
      __int16 v16 = v8;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to update zone state: %@", (uint8_t *)&v13, 0x16u);
    }
  }

  os_unfair_lock_unlock(v5);
}

- (id)unregisterSharedSubscriptionForSubscriptionID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944CB30]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    __int16 v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Asked to unregister shared subscription for subscription ID %@", buf, 0x16u);
  }
  int v9 = [(HMBCloudDatabase *)v6 performInitialCloudSync];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__HMBCloudDatabase_Subscription_Internal__unregisterSharedSubscriptionForSubscriptionID___block_invoke;
  v13[3] = &unk_1E69EBD00;
  void v13[4] = v6;
  id v14 = v4;
  id v10 = v4;
  uint64_t v11 = [v9 flatMap:v13];

  return v11;
}

id __89__HMBCloudDatabase_Subscription_Internal__unregisterSharedSubscriptionForSubscriptionID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v3 = [v1 sharedDatabaseState];
  id v4 = __unregisterSubscriptionForSubscriptionID(v1, v2, v3);

  return v4;
}

- (id)unregisterPrivateSubscriptionForSubscriptionID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944CB30]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    __int16 v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Asked to unregister private subscription for subscription ID %@", buf, 0x16u);
  }
  int v9 = [(HMBCloudDatabase *)v6 performInitialCloudSync];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__HMBCloudDatabase_Subscription_Internal__unregisterPrivateSubscriptionForSubscriptionID___block_invoke;
  v13[3] = &unk_1E69EBD00;
  void v13[4] = v6;
  id v14 = v4;
  id v10 = v4;
  uint64_t v11 = [v9 flatMap:v13];

  return v11;
}

id __90__HMBCloudDatabase_Subscription_Internal__unregisterPrivateSubscriptionForSubscriptionID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v3 = [v1 privateDatabaseState];
  id v4 = __unregisterSubscriptionForSubscriptionID(v1, v2, v3);

  return v4;
}

- (id)subscriptionsForZoneWithID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMBCloudDatabase *)self zoneStateByZoneID];
  id v7 = [v6 objectForKey:v4];

  if (v7)
  {
    uint64_t v8 = [v7 subscriptions];
  }
  else
  {
    int v9 = (void *)MEMORY[0x1D944CB30]();
    id v10 = self;
    HMFGetOSLogHandle();
    uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      int v13 = [(HMBCloudDatabase *)v10 zoneStateByZoneID];
      int v16 = 138543874;
      id v17 = v12;
      __int16 v18 = 2112;
      id v19 = v4;
      __int16 v20 = 2112;
      __int16 v21 = v13;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not find zone state for zone ID %@ when fetching subscriptions. All zone ID state: %@", (uint8_t *)&v16, 0x20u);
    }
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v14 = (void *)v8;

  os_unfair_lock_unlock(p_propertyLock);
  return v14;
}

- (id)unregisterSubscription:(id)a3 forZoneWithID:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D944CB30]();
  int v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543874;
    uint64_t v42 = v11;
    __int16 v43 = 2112;
    id v44 = v6;
    __int16 v45 = 2112;
    id v46 = v7;
    _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@Asked to unregister subscription for zone ID %@: %@", buf, 0x20u);
  }
  os_unfair_lock_lock_with_options();
  id v12 = [(HMBCloudDatabase *)v9 zoneStateByZoneID];
  int v13 = [v12 objectForKeyedSubscript:v7];
  id v14 = [v13 subscriptions];

  os_unfair_lock_unlock(&v9->_propertyLock);
  if (v14)
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __80__HMBCloudDatabase_Subscription_Internal__unregisterSubscription_forZoneWithID___block_invoke;
    v39[3] = &unk_1E69EBCB0;
    id v15 = v6;
    id v40 = v15;
    int v16 = objc_msgSend(v14, "na_map:", v39);
    if ([v16 count])
    {
      id v17 = -[HMBCloudDatabase databaseStateForDatabaseScope:](v9, "databaseStateForDatabaseScope:", [v7 scope]);
      __int16 v18 = [v17 database];
      id v19 = [v16 allObjects];
      __int16 v20 = [(HMBCloudDatabase *)v9 pushSubscriptionsForDatabase:v18 subscriptionsToSave:MEMORY[0x1E4F1CBF0] subscriptionIDsToRemove:v19];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __80__HMBCloudDatabase_Subscription_Internal__unregisterSubscription_forZoneWithID___block_invoke_7;
      v34[3] = &unk_1E69EBC88;
      id v35 = v14;
      id v36 = v16;
      uint64_t v37 = v9;
      id v38 = v7;
      __int16 v21 = [v20 addSuccessBlock:v34];
    }
    else
    {
      __int16 v29 = (void *)MEMORY[0x1D944CB30]();
      id v30 = v9;
      id v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        __int16 v32 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543874;
        uint64_t v42 = v32;
        __int16 v43 = 2112;
        id v44 = v15;
        __int16 v45 = 2112;
        id v46 = v14;
        _os_log_impl(&dword_1D4693000, v31, OS_LOG_TYPE_DEBUG, "%{public}@Not unregistering zone subscription %@ because it is not in our list of existing subscriptions: %@", buf, 0x20u);
      }
      __int16 v21 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    }

    id v28 = v40;
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x1D944CB30]();
    __int16 v23 = v9;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      long long v26 = [(HMBCloudDatabase *)v23 zoneStateByZoneID];
      *(_DWORD *)long long buf = 138544130;
      uint64_t v42 = v25;
      __int16 v43 = 2112;
      id v44 = v6;
      __int16 v45 = 2112;
      id v46 = v7;
      __int16 v47 = 2112;
      id v48 = v26;
      _os_log_impl(&dword_1D4693000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Asked to unregister subscription %@ on unknown zoneID %@. All zone ID state: %@", buf, 0x2Au);
    }
    id v27 = (void *)MEMORY[0x1E4F7A0D8];
    id v28 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    __int16 v21 = [v27 futureWithError:v28];
  }

  return v21;
}

id __80__HMBCloudDatabase_Subscription_Internal__unregisterSubscription_forZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) subscriptionID];
  id v5 = [v3 subscriptionID];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = [v3 subscriptionID];
  }
  else
  {
    id v8 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    id v10 = v9;

    id v11 = *(id *)(a1 + 32);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    id v7 = 0;
    if (v10 && v13)
    {
      id v14 = [v10 zoneID];
      id v15 = [v13 zoneID];
      int v16 = [v14 isEqual:v15];

      if (v16
        && ([v10 recordType],
            id v17 = objc_claimAutoreleasedReturnValue(),
            [v13 recordType],
            __int16 v18 = objc_claimAutoreleasedReturnValue(),
            int v19 = HMFEqualObjects(),
            v18,
            v17,
            v19))
      {
        id v7 = [v10 subscriptionID];
      }
      else
      {
        id v7 = 0;
      }
    }
  }
  return v7;
}

void __80__HMBCloudDatabase_Subscription_Internal__unregisterSubscription_forZoneWithID___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __80__HMBCloudDatabase_Subscription_Internal__unregisterSubscription_forZoneWithID___block_invoke_2;
  uint64_t v25 = &unk_1E69EBCD8;
  id v4 = *(void **)(a1 + 32);
  id v26 = *(id *)(a1 + 40);
  id v5 = objc_msgSend(v4, "na_filter:", &v22);
  int v6 = (os_unfair_lock_s *)(*(void *)(a1 + 48) + 8);
  os_unfair_lock_lock_with_options();
  id v7 = objc_msgSend(*(id *)(a1 + 48), "zoneStateByZoneID", v22, v23, v24, v25);
  id v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 56)];

  if (v8)
  {
    [v8 setSubscriptions:v5];
    int v9 = [*(id *)(a1 + 48) stateZone];
    id v27 = v8;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    id v11 = [v9 update:v10];

    if (v11)
    {
      id v12 = (void *)MEMORY[0x1D944CB30]();
      id v13 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        id v29 = v15;
        __int16 v30 = 2112;
        id v31 = v11;
        _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to update zone state: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    int v16 = (void *)MEMORY[0x1D944CB30]();
    id v17 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    __int16 v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v20 = *(void **)(a1 + 56);
      __int16 v21 = [*(id *)(a1 + 48) zoneStateByZoneID];
      *(_DWORD *)long long buf = 138543874;
      id v29 = v19;
      __int16 v30 = 2112;
      id v31 = v20;
      __int16 v32 = 2112;
      uint64_t v33 = v21;
      _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not find zone state for zone ID %@ after updating subscriptions. All zone ID state: %@", buf, 0x20u);
    }
  }

  os_unfair_lock_unlock(v6);
}

uint64_t __80__HMBCloudDatabase_Subscription_Internal__unregisterSubscription_forZoneWithID___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 subscriptionID];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (id)registerSubscription:(id)a3 forZoneWithID:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D944CB30]();
  int v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543874;
    uint64_t v42 = v11;
    __int16 v43 = 2112;
    id v44 = v6;
    __int16 v45 = 2112;
    id v46 = v7;
    _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@Asked to register subscription for zone ID %@: %@", buf, 0x20u);
  }
  os_unfair_lock_lock_with_options();
  id v12 = [(HMBCloudDatabase *)v9 zoneStateByZoneID];
  id v13 = [v12 objectForKeyedSubscript:v7];
  id v14 = [v13 subscriptions];

  os_unfair_lock_unlock(&v9->_propertyLock);
  if (!v14)
  {
    uint64_t v23 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v24 = v9;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = HMFGetLogIdentifier();
      id v27 = [(HMBCloudDatabase *)v24 zoneStateByZoneID];
      *(_DWORD *)long long buf = 138544130;
      uint64_t v42 = v26;
      __int16 v43 = 2112;
      id v44 = v6;
      __int16 v45 = 2112;
      id v46 = v7;
      __int16 v47 = 2112;
      id v48 = v27;
      _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Asked to register subscription %@ on unknown zoneID %@. All zone ID state: %@", buf, 0x2Au);
    }
    id v28 = (void *)MEMORY[0x1E4F7A0D8];
    id v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    uint64_t v22 = [v28 futureWithError:v15];
    goto LABEL_11;
  }
  id v15 = objc_msgSend(v14, "na_map:", &__block_literal_global_8282);
  int v16 = [v6 subscriptionID];
  int v17 = [v15 containsObject:v16];

  if (v17)
  {
    __int16 v18 = (void *)MEMORY[0x1D944CB30]();
    id v19 = v9;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      __int16 v21 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543874;
      uint64_t v42 = v21;
      __int16 v43 = 2112;
      id v44 = v6;
      __int16 v45 = 2112;
      id v46 = v14;
      _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Not registering zone subscription %@ because it is already in our list of subscriptions: %@", buf, 0x20u);
    }
    uint64_t v22 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
LABEL_11:
    id v29 = (void *)v22;
    goto LABEL_13;
  }
  __int16 v30 = -[HMBCloudDatabase databaseStateForDatabaseScope:](v9, "databaseStateForDatabaseScope:", [v7 scope]);
  id v31 = [v30 database];
  id v40 = v6;
  __int16 v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  uint64_t v33 = [(HMBCloudDatabase *)v9 pushSubscriptionsForDatabase:v31 subscriptionsToSave:v32 subscriptionIDsToRemove:MEMORY[0x1E4F1CBF0]];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __78__HMBCloudDatabase_Subscription_Internal__registerSubscription_forZoneWithID___block_invoke_4;
  v35[3] = &unk_1E69EBC88;
  id v36 = v14;
  id v37 = v6;
  id v38 = v9;
  id v39 = v7;
  id v29 = [v33 addSuccessBlock:v35];

LABEL_13:
  return v29;
}

void __78__HMBCloudDatabase_Subscription_Internal__registerSubscription_forZoneWithID___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) setByAddingObject:*(void *)(a1 + 40)];
  id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 48) + 8);
  os_unfair_lock_lock_with_options();
  id v6 = [*(id *)(a1 + 48) zoneStateByZoneID];
  id v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 56)];

  if (v7)
  {
    [v7 setSubscriptions:v4];
    id v8 = [*(id *)(a1 + 48) stateZone];
    __int16 v21 = v7;
    int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    id v10 = [v8 update:v9];

    if (v10)
    {
      id v11 = (void *)MEMORY[0x1D944CB30]();
      id v12 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        id v23 = v14;
        __int16 v24 = 2112;
        uint64_t v25 = v10;
        _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to update zone state: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v15 = (void *)MEMORY[0x1D944CB30]();
    id v16 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    int v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      id v19 = *(void **)(a1 + 56);
      __int16 v20 = [*(id *)(a1 + 48) zoneStateByZoneID];
      *(_DWORD *)long long buf = 138543874;
      id v23 = v18;
      __int16 v24 = 2112;
      uint64_t v25 = v19;
      __int16 v26 = 2112;
      id v27 = v20;
      _os_log_impl(&dword_1D4693000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not find zone state for zone ID %@ after updating subscriptions. All zone ID state: %@", buf, 0x20u);
    }
  }

  os_unfair_lock_unlock(v5);
}

uint64_t __78__HMBCloudDatabase_Subscription_Internal__registerSubscription_forZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 subscriptionID];
}

- (id)pushSubscriptionsForDatabase:(id)a3 subscriptionsToSave:(id)a4 subscriptionIDsToRemove:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = [(HMBCloudDatabase *)self operationScheduler];
  id v16 = [v11 lazyFutureWithBlock:&v18 scheduler:v15];

  return v16;
}

void __116__HMBCloudDatabase_Subscription_Internal__pushSubscriptionsForDatabase_subscriptionsToSave_subscriptionIDsToRemove___block_invoke(void **a1, void *a2)
{
}

- (id)unregisterSharedSubscriptionForExternalRecordType:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944CB30]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Asked to unregister shared subscription for external record type %@", buf, 0x16u);
  }
  id v9 = [(HMBCloudDatabase *)v6 performInitialCloudSync];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__HMBCloudDatabase_Subscription__unregisterSharedSubscriptionForExternalRecordType___block_invoke;
  v13[3] = &unk_1E69EBD00;
  void v13[4] = v6;
  id v14 = v4;
  id v10 = v4;
  id v11 = [v9 flatMap:v13];

  return v11;
}

id __84__HMBCloudDatabase_Subscription__unregisterSharedSubscriptionForExternalRecordType___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 sharedDatabaseState];
  id v4 = [v3 cloudID];
  id v5 = [v2 subscriptionIDForCloudID:v4 recordType:*(void *)(a1 + 40)];
  id v6 = [*(id *)(a1 + 32) sharedDatabaseState];
  id v7 = __unregisterSubscriptionForSubscriptionID(v2, v5, v6);

  return v7;
}

- (id)unregisterPrivateSubscriptionForExternalRecordType:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944CB30]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Asked to unregister private subscription for external record type %@", buf, 0x16u);
  }
  id v9 = [(HMBCloudDatabase *)v6 performInitialCloudSync];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__HMBCloudDatabase_Subscription__unregisterPrivateSubscriptionForExternalRecordType___block_invoke;
  v13[3] = &unk_1E69EBD00;
  void v13[4] = v6;
  id v14 = v4;
  id v10 = v4;
  id v11 = [v9 flatMap:v13];

  return v11;
}

id __85__HMBCloudDatabase_Subscription__unregisterPrivateSubscriptionForExternalRecordType___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 privateDatabaseState];
  id v4 = [v3 cloudID];
  id v5 = [v2 subscriptionIDForCloudID:v4 recordType:*(void *)(a1 + 40)];
  id v6 = [*(id *)(a1 + 32) privateDatabaseState];
  id v7 = __unregisterSubscriptionForSubscriptionID(v2, v5, v6);

  return v7;
}

- (id)registerSharedSubscriptionForExternalRecordType:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944CB30]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Asked to register shared subscription for external record type %@", buf, 0x16u);
  }
  id v9 = [(HMBCloudDatabase *)v6 performInitialCloudSync];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__HMBCloudDatabase_Subscription__registerSharedSubscriptionForExternalRecordType___block_invoke;
  v13[3] = &unk_1E69EBD00;
  void v13[4] = v6;
  id v14 = v4;
  id v10 = v4;
  id v11 = [v9 flatMap:v13];

  return v11;
}

id __82__HMBCloudDatabase_Subscription__registerSharedSubscriptionForExternalRecordType___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [v1 sharedDatabaseState];
  id v4 = [v1 registerSubscriptionForExternalRecordType:v2 databaseState:v3];

  return v4;
}

- (id)registerPrivateSubscriptionForExternalRecordType:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944CB30]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Asked to register private subscription for external record type %@", buf, 0x16u);
  }
  id v9 = [(HMBCloudDatabase *)v6 performInitialCloudSync];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__HMBCloudDatabase_Subscription__registerPrivateSubscriptionForExternalRecordType___block_invoke;
  v13[3] = &unk_1E69EBD00;
  void v13[4] = v6;
  id v14 = v4;
  id v10 = v4;
  id v11 = [v9 flatMap:v13];

  return v11;
}

id __83__HMBCloudDatabase_Subscription__registerPrivateSubscriptionForExternalRecordType___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [v1 privateDatabaseState];
  id v4 = [v1 registerSubscriptionForExternalRecordType:v2 databaseState:v3];

  return v4;
}

- (id)registerSubscriptionForExternalRecordType:(id)a3 databaseState:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMBCloudDatabase *)self initialCloudSyncFuture];
  char v9 = [v8 isFinished];

  if ((v9 & 1) == 0) {
    _HMFPreconditionFailure();
  }
  id v10 = [v7 cloudID];
  id v11 = [(HMBCloudDatabase *)self subscriptionIDForCloudID:v10 recordType:v6];

  os_unfair_lock_lock_with_options();
  id v12 = [v7 subscriptions];
  os_unfair_lock_unlock(&self->_propertyLock);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __90__HMBCloudDatabase_Subscription__registerSubscriptionForExternalRecordType_databaseState___block_invoke;
  v29[3] = &unk_1E69EBD28;
  id v13 = v11;
  id v30 = v13;
  if (objc_msgSend(v12, "na_any:", v29))
  {
    id v14 = (void *)MEMORY[0x1D944CB30]();
    id v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543874;
      uint64_t v33 = v17;
      __int16 v34 = 2112;
      id v35 = v13;
      __int16 v36 = 2112;
      id v37 = v12;
      _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_INFO, "%{public}@Not pushing database subscription ID %@ because it is already in our list of registered database subscriptions: %@", buf, 0x20u);
    }
    id v18 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F19F50]) initWithSubscriptionID:v13];
    [v19 setRecordType:v6];
    id v20 = [v7 database];
    id v31 = v19;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    uint64_t v22 = [(HMBCloudDatabase *)self pushSubscriptionsForDatabase:v20 subscriptionsToSave:v21 subscriptionIDsToRemove:MEMORY[0x1E4F1CBF0]];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __90__HMBCloudDatabase_Subscription__registerSubscriptionForExternalRecordType_databaseState___block_invoke_22;
    v25[3] = &unk_1E69EBC88;
    v25[4] = self;
    id v26 = v7;
    id v27 = v12;
    id v28 = v19;
    id v23 = v19;
    id v18 = [v22 addSuccessBlock:v25];
  }
  return v18;
}

uint64_t __90__HMBCloudDatabase_Subscription__registerSubscriptionForExternalRecordType_databaseState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 subscriptionID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __90__HMBCloudDatabase_Subscription__registerSubscriptionForExternalRecordType_databaseState___block_invoke_22(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  id v5 = [*(id *)(a1 + 48) setByAddingObject:*(void *)(a1 + 56)];
  [*(id *)(a1 + 40) setSubscriptions:v5];

  id v6 = [*(id *)(a1 + 32) stateZone];
  v17[0] = *(void *)(a1 + 40);
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v8 = [v6 update:v7];

  if (v8)
  {
    char v9 = (void *)MEMORY[0x1D944CB30]();
    id v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v12;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to update database state: %@", (uint8_t *)&v13, 0x16u);
    }
  }

  os_unfair_lock_unlock(v4);
}

@end