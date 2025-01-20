@interface HMBCloudZone
+ (id)logCategory;
- (BOOL)handleUpdatedShare:(id)a3 error:(id *)a4;
- (BOOL)handleUpdatedShareParticipantRecord:(id)a3 error:(id *)a4;
- (BOOL)hasPerformedInitialFetch;
- (BOOL)hasStartedUp;
- (BOOL)isInternalModel:(id)a3;
- (BOOL)isZoneRebuildInProgress;
- (BOOL)populateManateeCloudRecord:(id)a3 withModel:(id)a4 encodingContext:(id)a5 error:(id *)a6;
- (BOOL)populateV4CloudRecord:(id)a3 withModel:(id)a4 metadataFieldData:(id)a5 startEncoding:(unint64_t)a6 endEncoding:(unint64_t)a7 encodingContext:(id)a8 error:(id *)a9;
- (BOOL)resolveConflicts:(id)a3 options:(id)a4;
- (BOOL)retryCloudKitOperation:(id)a3 afterError:(id)a4 retryBlock:(id)a5;
- (CKDatabase)database;
- (HMBCloudDatabase)cloudDatabase;
- (HMBCloudZone)initWithCloudDatabase:(id)a3 configuration:(id)a4 state:(id)a5;
- (HMBCloudZoneConfiguration)configuration;
- (HMBCloudZoneDelegate)delegate;
- (HMBCloudZoneID)cloudZoneID;
- (HMBCloudZoneRebuilder)rebuilder;
- (HMBCloudZoneShareModel)shareModel;
- (HMBLocalZone)localZone;
- (HMBLocalZone)stateZone;
- (HMBModelContainer)modelContainer;
- (NAFuture)destroyFuture;
- (NAFuture)queuedCloudPullFuture;
- (NAFuture)shutdownFuture;
- (NAFuture)startUp;
- (NAFuture)waitForPendingRebuild;
- (NAScheduler)operationScheduler;
- (NSArray)defaultDesiredKeys;
- (NSMapTable)modelClassToRequiresPostProcessingMap;
- (NSMutableDictionary)inProgressPushFuturesByOutputBlockRow;
- (NSMutableDictionary)shareParticipantModelsByClientIdentifier;
- (NSMutableSet)queuedFetchRecordsContexts;
- (NSOperationQueue)recordOperationQueue;
- (NSOperationQueue)shareOperationQueue;
- (NSSet)participants;
- (NSSet)subscriptions;
- (NSString)deviceIdentifier;
- (NSUUID)stateModelID;
- (id)_addShareOperationAfterStartupWithName:(id)a3 block:(id)a4;
- (id)_addShareOperationWithName:(id)a3 block:(id)a4;
- (id)_createShareModel;
- (id)_fetchInvitationWithContext:(id)a3 usingShare:(id)a4;
- (id)_fetchRecordsWithRecordIDs:(id)a3 canRetry:(BOOL)a4;
- (id)_leaveCloudShareRequestingNewInvitationToken:(BOOL)a3 allowCloudPull:(BOOL)a4;
- (id)_performCloudPullWithOptions:(id)a3 useCachedServerToken:(BOOL)a4;
- (id)_performImmediateCloudPullWithOptions:(id)a3 useCachedServerToken:(BOOL)a4;
- (id)_pushDeletedParticipantRecordIDs:(id)a3;
- (id)_pushUpdatedShare:(id)a3;
- (id)_pushUpdatedShare:(id)a3 participantRecord:(id)a4;
- (id)_revokeShareAccessForParticipant:(id)a3 usingShare:(id)a4;
- (id)_setWriteAccessEnabled:(BOOL)a3 forParticipant:(id)a4 usingShare:(id)a5;
- (id)_syncInternalModels;
- (id)_triggerOutputForOutputRow:(unint64_t)a3 options:(id)a4;
- (id)attributeDescriptions;
- (id)cloudFieldForEncoding:(unint64_t)a3;
- (id)cloudMetadataForModel:(id)a3 usingEncoding:(unint64_t)a4;
- (id)createShareModel;
- (id)createZoneState;
- (id)decodeManateeCloudFromRecord:(id)a3 externalRecordFields:(id)a4 source:(unint64_t)a5 error:(id *)a6;
- (id)decodeModelFromRecord:(id)a3 externalRecordFields:(id)a4 source:(unint64_t)a5 error:(id *)a6;
- (id)decodeShareModelFromShare:(id)a3;
- (id)destroy;
- (id)encodeManateeCloudModel:(id)a3 existingRecord:(id)a4 encodingContext:(id)a5 error:(id *)a6;
- (id)encodeRecordFromModel:(id)a3 existingRecord:(id)a4 encodingContext:(id)a5 error:(id *)a6;
- (id)encodeRecordFromModel:(id)a3 existingRecord:(id)a4 error:(id *)a5;
- (id)encodeShareModel:(id)a3;
- (id)fetchChangesWithToken:(id)a3 options:(id)a4;
- (id)fetchCloudShareIDForShareParticipantClientIdentifier:(id)a3;
- (id)fetchCompleteModel:(id)a3;
- (id)fetchCompleteModelForRecordID:(id)a3;
- (id)fetchCompleteModelWithID:(id)a3;
- (id)fetchCompleteModels:(id)a3;
- (id)fetchCompleteModelsForRecordIDs:(id)a3;
- (id)fetchCompleteModelsWithIDs:(id)a3;
- (id)fetchCurrentParticipantCloudShareID;
- (id)fetchInvitationWithContext:(id)a3;
- (id)fetchOwnerParticipantCloudShareID;
- (id)fetchRecordWithRecordID:(id)a3 canRetry:(BOOL)a4;
- (id)fetchRecordsWithRecordIDs:(id)a3;
- (id)flush;
- (id)leaveCloudShareRequestingNewInvitationToken:(BOOL)a3;
- (id)logIdentifier;
- (id)participantWithClientIdentifier:(id)a3;
- (id)performCloudPullWithOptions:(id)a3;
- (id)performFullCloudPullWithOptions:(id)a3;
- (id)performStartupCloudPullWithOptions:(id)a3;
- (id)pushRecordsToUpdate:(id)a3 recordIDsToRemove:(id)a4 configuration:(id)a5 rollbackEnabled:(BOOL)a6;
- (id)pushRecordsToUpdate:(id)a3 recordIDsToRemove:(id)a4 configuration:(id)a5 rollbackEnabled:(BOOL)a6 needsNewInvitationToken:(BOOL)a7;
- (id)queryRecordsWithType:(id)a3;
- (id)recordIDForModel:(id)a3;
- (id)registerSubscriptionForExternalRecordType:(id)a3;
- (id)revokeShareAccessForParticipant:(id)a3;
- (id)setWriteAccessEnabled:(BOOL)a3 forParticipant:(id)a4;
- (id)shutdown;
- (id)startUpRebuilderIfNeeded;
- (id)triggerOutputForOutputRow:(unint64_t)a3 options:(id)a4;
- (id)unregisterSubscriptionForExternalRecordType:(id)a3;
- (int64_t)keyStatus;
- (void)_fetchRecordsForContexts:(id)a3;
- (void)_startUpWithPrivateLocalZone:(id)a3;
- (void)_startUpWithPublicLocalZone:(id)a3;
- (void)dealloc;
- (void)handleDeletion;
- (void)handleLostKeys;
- (void)handleUpdatedInternalModels:(id)a3;
- (void)handleUpdatedRebuilderModel:(id)a3;
- (void)handleUpdatedShareModel:(id)a3;
- (void)handleUpdatedShareParticipantModels:(id)a3;
- (void)handleZoneChangedNotification;
- (void)initializeShareModels;
- (void)notifyDelegateOfError:(id)a3 forOperation:(id)a4;
- (void)pushGroupWithBlockRow:(unint64_t)a3 tuples:(id)a4 options:(id)a5 activity:(id)a6 completionPromise:(id)a7;
- (void)rebuild;
- (void)setCloudDatabase:(id)a3;
- (void)setDefaultDesiredKeys:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestroyFuture:(id)a3;
- (void)setHasStartedUp:(BOOL)a3;
- (void)setLocalZone:(id)a3;
- (void)setQueuedCloudPullFuture:(id)a3;
- (void)setQueuedFetchRecordsContexts:(id)a3;
- (void)setRebuilder:(id)a3;
- (void)setShareModel:(id)a3;
- (void)setShutdownFuture:(id)a3;
- (void)setStateZone:(id)a3;
- (void)startUpWithLocalZone:(id)a3;
@end

@implementation HMBCloudZone

- (id)encodeRecordFromModel:(id)a3 existingRecord:(id)a4 encodingContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v12 modelContainer];
  [v10 hmbAssociateWithContainer:v13];

  id v14 = v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  if (v16) {
    [(HMBCloudZone *)self encodeShareModel:v16];
  }
  else {
  v17 = [(HMBCloudZone *)self encodeManateeCloudModel:v14 existingRecord:v11 encodingContext:v12 error:a6];
  }

  return v17;
}

- (id)encodeRecordFromModel:(id)a3 existingRecord:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HMBCloudZone *)self modelContainer];
  if (v10)
  {
    id v11 = [[HMBCloudZoneEncodingContext alloc] initWithModelContainer:v10];
    id v12 = [(HMBCloudZone *)self encodeRecordFromModel:v8 existingRecord:v9 encodingContext:v11 error:a5];
  }
  else
  {
    v13 = (void *)MEMORY[0x1D944CB30]();
    id v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      v17 = [v8 hmbDescription];
      int v19 = 138543618;
      v20 = v16;
      __int16 v21 = 2114;
      v22 = v17;
      _os_log_impl(&dword_1D4693000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode record from model %{public}@: Model container is nil", (uint8_t *)&v19, 0x16u);
    }
    if (a5)
    {
      [MEMORY[0x1E4F28C58] hmfErrorWithCode:8 reason:@"Model container is nil"];
      id v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = 0;
    }
  }

  return v12;
}

- (id)decodeModelFromRecord:(id)a3 externalRecordFields:(id)a4 source:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v10;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;
  if (v13) {
    [(HMBCloudZone *)self decodeShareModelFromShare:v13];
  }
  else {
  id v14 = [(HMBCloudZone *)self decodeManateeCloudFromRecord:v10 externalRecordFields:v11 source:a5 error:a6];
  }

  return v14;
}

- (void)rebuild
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = __getRebuilder(self);
  v4 = v3;
  if (v3)
  {
    [v3 rebuild];
  }
  else
  {
    v5 = (void *)MEMORY[0x1D944CB30]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v8;
      _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_ERROR, "%{public}@Received -[rebuild] on a HMBCloudZone without a rebuilder", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)handleUpdatedRebuilderModel:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D944CB30]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Saving updated rebuilder model: %@", buf, 0x16u);
  }
  int v9 = [(HMBCloudZone *)v6 localZone];
  id v16 = v4;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  uint64_t v11 = [v9 update:v10];

  if (v11)
  {
    id v12 = (void *)MEMORY[0x1D944CB30]();
    id v13 = v6;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v18 = v15;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to update rebuilder model: %@", buf, 0x16u);
    }
  }
}

- (void)handleZoneChangedNotification
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = __getRebuilder(self);
  id v4 = v3;
  if (v3)
  {
    [v3 handleZoneChanged];
  }
  else
  {
    v5 = (void *)MEMORY[0x1D944CB30]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v8;
      _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_ERROR, "%{public}@Received -[handleZoneChangedNotification] on a HMBCloudZone without a rebuilder", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (BOOL)isZoneRebuildInProgress
{
  v2 = __getRebuilder(self);
  v3 = v2;
  if (v2) {
    char v4 = [v2 isZoneRebuildInProgress];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)handleLostKeys
{
  v3 = __createRebuilderIfNeeded(self);
  char v4 = v3;
  if (v3)
  {
    [v3 handleIdentityLost];
    v5 = [v4 rebuildCompleteFuture];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__HMBCloudZone_Rebuild_Internal__handleLostKeys__block_invoke;
    v7[3] = &unk_1E69EB0B8;
    v7[4] = self;
    id v6 = (id)[v5 addSuccessBlock:v7];
  }
}

void __48__HMBCloudZone_Rebuild_Internal__handleLostKeys__block_invoke(uint64_t a1)
{
}

- (id)startUpRebuilderIfNeeded
{
  v3 = __createRebuilderIfNeeded(self);
  char v4 = v3;
  if (v3)
  {
    v5 = [v3 zoneStartUp];
    id v6 = [v4 rebuildCompleteFuture];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__HMBCloudZone_Rebuild_Internal__startUpRebuilderIfNeeded__block_invoke;
    v9[3] = &unk_1E69EB0B8;
    v9[4] = self;
    id v7 = (id)[v6 addSuccessBlock:v9];
  }
  else
  {
    v5 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v5;
}

void __58__HMBCloudZone_Rebuild_Internal__startUpRebuilderIfNeeded__block_invoke(uint64_t a1)
{
}

- (NAFuture)waitForPendingRebuild
{
  v2 = __getRebuilder(self);
  v3 = v2;
  if (v2) {
    [v2 rebuildCompleteFuture];
  }
  else {
  char v4 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return (NAFuture *)v4;
}

- (int64_t)keyStatus
{
  v2 = __getRebuilder(self);
  v3 = v2;
  if (v2)
  {
    char v4 = [v2 rebuilderStatus];
    int64_t v5 = [v4 keyStatus];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)decodeShareModelFromShare:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 recordID];
  id v6 = [v5 recordName];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F19D48]];

  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F29128] UUID];
    id v8 = [v4 recordID];
    uint64_t v11 = [v8 recordName];
    id v10 = (id)[v12 initWithUUIDString:v11];
    goto LABEL_5;
  }
  id v8 = [(HMBCloudZone *)self shareModel];
  int v9 = [v8 hmbModelID];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = v10;
LABEL_5:
    id v13 = v10;
    goto LABEL_7;
  }
  id v13 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v11 = 0;
LABEL_7:

  id v14 = [HMBCloudZoneShareModel alloc];
  v15 = [(HMBCloudZone *)self stateModelID];
  id v16 = [(HMBModel *)v14 initWithModelID:v13 parentModelID:v15];

  [(HMBCloudZoneShareModel *)v16 setShare:v4];
  return v16;
}

- (id)encodeShareModel:(id)a3
{
  v3 = [a3 share];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultDesiredKeys, 0);
  objc_storeStrong((id *)&self->_shareParticipantModelsByClientIdentifier, 0);
  objc_storeStrong((id *)&self->_shareModel, 0);
  objc_storeStrong((id *)&self->_queuedFetchRecordsContexts, 0);
  objc_storeStrong((id *)&self->_queuedCloudPullFuture, 0);
  objc_storeStrong((id *)&self->_shareOperationQueue, 0);
  objc_storeStrong((id *)&self->_recordOperationQueue, 0);
  objc_storeStrong((id *)&self->_operationScheduler, 0);
  objc_storeStrong((id *)&self->_rebuilder, 0);
  objc_storeStrong((id *)&self->_destroyFuture, 0);
  objc_storeStrong((id *)&self->_shutdownFuture, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_inProgressPushFuturesByOutputBlockRow, 0);
  objc_storeStrong((id *)&self->_modelClassToRequiresPostProcessingMap, 0);
  objc_storeStrong((id *)&self->_stateModelID, 0);
  objc_destroyWeak((id *)&self->_stateZone);
  objc_storeStrong((id *)&self->_database, 0);
  objc_destroyWeak((id *)&self->_localZone);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_cloudZoneID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_cloudDatabase);
  objc_storeStrong((id *)&self->_startUp, 0);
}

- (void)setDefaultDesiredKeys:(id)a3
{
}

- (NSArray)defaultDesiredKeys
{
  return self->_defaultDesiredKeys;
}

- (NSMutableDictionary)shareParticipantModelsByClientIdentifier
{
  return self->_shareParticipantModelsByClientIdentifier;
}

- (void)setShareModel:(id)a3
{
}

- (HMBCloudZoneShareModel)shareModel
{
  return (HMBCloudZoneShareModel *)objc_getProperty(self, a2, 176, 1);
}

- (void)setQueuedFetchRecordsContexts:(id)a3
{
}

- (NSMutableSet)queuedFetchRecordsContexts
{
  return (NSMutableSet *)objc_getProperty(self, a2, 168, 1);
}

- (void)setQueuedCloudPullFuture:(id)a3
{
}

- (NAFuture)queuedCloudPullFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 160, 1);
}

- (NSOperationQueue)shareOperationQueue
{
  return self->_shareOperationQueue;
}

- (NSOperationQueue)recordOperationQueue
{
  return self->_recordOperationQueue;
}

- (NAScheduler)operationScheduler
{
  return self->_operationScheduler;
}

- (void)setRebuilder:(id)a3
{
}

- (HMBCloudZoneRebuilder)rebuilder
{
  return self->_rebuilder;
}

- (void)setDestroyFuture:(id)a3
{
}

- (NAFuture)destroyFuture
{
  return self->_destroyFuture;
}

- (void)setShutdownFuture:(id)a3
{
}

- (NAFuture)shutdownFuture
{
  return self->_shutdownFuture;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSMutableDictionary)inProgressPushFuturesByOutputBlockRow
{
  return self->_inProgressPushFuturesByOutputBlockRow;
}

- (NSMapTable)modelClassToRequiresPostProcessingMap
{
  return self->_modelClassToRequiresPostProcessingMap;
}

- (void)setHasStartedUp:(BOOL)a3
{
  self->_hasStartedUp = a3;
}

- (BOOL)hasStartedUp
{
  return self->_hasStartedUp;
}

- (NSUUID)stateModelID
{
  return self->_stateModelID;
}

- (void)setStateZone:(id)a3
{
}

- (HMBLocalZone)stateZone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateZone);
  return (HMBLocalZone *)WeakRetained;
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setLocalZone:(id)a3
{
}

- (HMBLocalZone)localZone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localZone);
  return (HMBLocalZone *)WeakRetained;
}

- (HMBCloudZoneConfiguration)configuration
{
  return self->_configuration;
}

- (HMBCloudZoneID)cloudZoneID
{
  return self->_cloudZoneID;
}

- (void)setDelegate:(id)a3
{
}

- (HMBCloudZoneDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMBCloudZoneDelegate *)WeakRetained;
}

- (void)setCloudDatabase:(id)a3
{
}

- (HMBCloudDatabase)cloudDatabase
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudDatabase);
  return (HMBCloudDatabase *)WeakRetained;
}

- (NAFuture)startUp
{
  return self->_startUp;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMBCloudZone *)self zoneID];
  int64_t v5 = (void *)[v3 initWithName:@"Zone ID" value:v4];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)logIdentifier
{
  v2 = [(HMBCloudZone *)self cloudZoneID];
  id v3 = [v2 zoneID];
  id v4 = [v3 hmbDescription];

  return v4;
}

- (id)createZoneState
{
  id v3 = [(HMBCloudZone *)self cloudZoneID];
  uint64_t v4 = [v3 scope];

  if (v4 == 2)
  {
    int64_t v5 = (void *)MEMORY[0x1E4F7A0D8];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __31__HMBCloudZone_createZoneState__block_invoke;
    v11[3] = &unk_1E69EA378;
    v11[4] = self;
    id v6 = [MEMORY[0x1E4F7A0F0] immediateScheduler];
    int v7 = [v5 lazyFutureWithBlock:v11 scheduler:v6];

    return v7;
  }
  else
  {
    uint64_t v9 = _HMFPreconditionFailure();
    __31__HMBCloudZone_createZoneState__block_invoke(v9, v10);
  }
  return result;
}

void __31__HMBCloudZone_createZoneState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) cloudDatabase];
  if (!v4)
  {
    _HMFPreconditionFailure();
LABEL_17:
    _HMFPreconditionFailure();
  }
  int64_t v5 = (void *)v4;
  uint64_t v6 = [*(id *)(a1 + 32) localZone];
  if (!v6) {
    goto LABEL_17;
  }
  int v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 32);
  id v29 = 0;
  char v9 = [v5 reopenOrRecreatePrivateZone:v8 error:&v29];
  id v10 = v29;
  if (v9)
  {
    uint64_t v11 = [v5 localDatabase];
    id v28 = v10;
    char v12 = [v11 reopenZone:v7 error:&v28];
    id v13 = v28;

    if (v12)
    {
      id v14 = [*(id *)(a1 + 32) cloudZoneID];
      int v15 = [v5 needsZoneCreationForZoneWithID:v14];

      if (v15)
      {
        id v16 = [*(id *)(a1 + 32) cloudZoneID];
        v17 = [v5 createPrivateZoneWithID:v16];
        v18 = [v3 completionHandlerAdapter];
        id v19 = (id)[v17 addCompletionBlock:v18];
      }
      else
      {
        [v3 finishWithNoResult];
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x1D944CB30]();
      id v25 = *(id *)(a1 + 32);
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v31 = v27;
        __int16 v32 = 2114;
        id v33 = v13;
        _os_log_impl(&dword_1D4693000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to re-open or re-create local zone during startup: %{public}@", buf, 0x16u);
      }
      [v3 finishWithError:v13];
    }
    id v10 = v13;
  }
  else
  {
    id v20 = (void *)MEMORY[0x1D944CB30]();
    id v21 = *(id *)(a1 + 32);
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v31 = v23;
      __int16 v32 = 2114;
      id v33 = v10;
      _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to re-open or re-create private cloud zone during startup: %{public}@", buf, 0x16u);
    }
    [v3 finishWithError:v10];
  }
}

- (void)handleDeletion
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMBCloudZone *)self cloudDatabase];
  uint64_t v4 = [(HMBCloudZone *)self cloudZoneID];
  v6[0] = v4;
  int64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 handleRemovedZoneIDs:v5 userInitiated:1];
}

- (void)handleUpdatedInternalModels:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v31;
    v27 = self;
    id v28 = v6;
    id v29 = v5;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(id *)(*((void *)&v30 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v13 = v12;
        }
        else {
          id v13 = 0;
        }
        id v14 = v13;

        if (v14)
        {
          id v15 = v14;
          id v16 = v9;
          char v9 = v12;
        }
        else
        {
          id v17 = v12;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v18 = v17;
          }
          else {
            v18 = 0;
          }
          id v16 = v18;

          if (v16)
          {
            [v5 addObject:v16];
          }
          else
          {
            id v19 = v17;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v20 = v19;
            }
            else {
              id v20 = 0;
            }
            id v21 = v20;

            if (v21)
            {
              [(HMBCloudZone *)self handleUpdatedRebuilderModel:v21];
            }
            else
            {
              v22 = (void *)MEMORY[0x1D944CB30]();
              uint64_t v23 = self;
              v24 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                id v25 = v26 = v22;
                *(_DWORD *)buf = 138543618;
                v35 = v25;
                __int16 v36 = 2112;
                id v37 = v19;
                _os_log_impl(&dword_1D4693000, v24, OS_LOG_TYPE_ERROR, "%{public}@Asked to handle unexpected updated model: %@", buf, 0x16u);

                v22 = v26;
              }

              self = v27;
            }

            id v16 = 0;
            id v6 = v28;
            int64_t v5 = v29;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
  }

  if ([v5 count]) {
    [(HMBCloudZone *)self handleUpdatedShareParticipantModels:v5];
  }
  if (v9) {
    [(HMBCloudZone *)self handleUpdatedShareModel:v9];
  }
}

- (BOOL)isInternalModel:(id)a3
{
  id v3 = a3;
  id v4 = [v3 hmbType];
  if ([v4 isEqualToString:@"HMBCloudZoneShareModel"])
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [v3 hmbType];
    if ([v6 isEqualToString:@"HMBCloudZoneShareParticipantModel"])
    {
      char v5 = 1;
    }
    else
    {
      uint64_t v7 = [v3 hmbType];
      char v5 = [v7 isEqualToString:@"HMBCloudZoneRebuilderModel"];
    }
  }

  return v5;
}

- (id)flush
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __21__HMBCloudZone_flush__block_invoke;
  v6[3] = &unk_1E69EA378;
  v6[4] = self;
  id v3 = [(HMBCloudZone *)self operationScheduler];
  id v4 = [v2 futureWithBlock:v6 scheduler:v3];

  return v4;
}

void __21__HMBCloudZone_flush__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v5 = a2;
  id v3 = [v2 database];
  id v4 = [v3 operationQueue];
  [v4 waitUntilAllOperationsAreFinished];

  [v5 finishWithNoResult];
}

- (HMBModelContainer)modelContainer
{
  v2 = [(HMBCloudZone *)self localZone];
  id v3 = [v2 modelContainer];

  return (HMBModelContainer *)v3;
}

- (void)_startUpWithPublicLocalZone:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMBCloudZone *)self cloudDatabase];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = [(HMBCloudZone *)self startUpRebuilderIfNeeded];
    [v6 addObject:v7];

    if (![(HMBCloudZone *)self hasPerformedInitialFetch])
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F7A0D8];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __44__HMBCloudZone__startUpWithPublicLocalZone___block_invoke;
      v22[3] = &unk_1E69EA378;
      v22[4] = self;
      char v9 = [(HMBCloudZone *)self operationScheduler];
      uint64_t v10 = [v8 lazyFutureWithBlock:v22 scheduler:v9];
      [v6 addObject:v10];
    }
    uint64_t v11 = [MEMORY[0x1E4F7A0D8] chainFutures:v6];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __44__HMBCloudZone__startUpWithPublicLocalZone___block_invoke_2;
    v21[3] = &unk_1E69EB0B8;
    v21[4] = self;
    id v12 = [v11 addSuccessBlock:v21];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __44__HMBCloudZone__startUpWithPublicLocalZone___block_invoke_78;
    v18[3] = &unk_1E69E97F8;
    v18[4] = self;
    id v19 = v5;
    id v20 = v4;
    id v13 = (id)[v12 addFailureBlock:v18];
  }
  else
  {
    id v14 = (void *)MEMORY[0x1D944CB30]();
    id v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v24 = v17;
      _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to start up with local zone because cloud database reference is nil", buf, 0xCu);
    }
  }
}

void __44__HMBCloudZone__startUpWithPublicLocalZone___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = +[HMBProcessingOptions optionsWithLabel:@"HMBCloudZone First Fetch"];
  id v4 = [*(id *)(a1 + 32) performStartupCloudPullWithOptions:v7];
  id v5 = [v3 completionHandlerAdapter];

  id v6 = (id)[v4 addCompletionBlock:v5];
}

void __44__HMBCloudZone__startUpWithPublicLocalZone___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully started up with public local zone", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v8 = [*(id *)(a1 + 32) startUp];
  [v8 finishWithNoResult];
}

void __44__HMBCloudZone__startUpWithPublicLocalZone___block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v12 = v7;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start up with public local zone (will retry after delay): %{public}@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__HMBCloudZone__startUpWithPublicLocalZone___block_invoke_79;
  v9[3] = &unk_1E69E9A18;
  uint64_t v8 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  [v8 retryStartupBlock:v9];
}

uint64_t __44__HMBCloudZone__startUpWithPublicLocalZone___block_invoke_79(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D944CB30]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1D4693000, v4, OS_LOG_TYPE_INFO, "%{public}@Retrying public cloud zone startup", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _startUpWithPublicLocalZone:*(void *)(a1 + 40)];
}

- (void)_startUpWithPrivateLocalZone:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMBCloudZone *)self cloudDatabase];
  if (!v5) {
    _HMFPreconditionFailure();
  }
  id v6 = (void *)v5;
  [(HMBCloudZone *)self initializeShareModels];
  int v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [v6 performInitialCloudSync];
  uint64_t v9 = (void *)MEMORY[0x1D944CB30]();
  id v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v35 = v12;
    __int16 v36 = 2112;
    id v37 = v8;
    _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_INFO, "%{public}@Zone startup steps will begin after initial cloud sync future: %@", buf, 0x16u);
  }
  [v7 addObject:v8];
  __int16 v13 = [(HMBCloudZone *)v10 cloudZoneID];
  uint64_t v14 = [v13 scope];

  if (v14 == 2)
  {
    uint64_t v15 = [(HMBCloudZone *)v10 createZoneState];
    [v7 addObject:v15];
  }
  id v16 = [(HMBCloudZone *)v10 startUpRebuilderIfNeeded];
  [v7 addObject:v16];

  id v17 = (void *)MEMORY[0x1E4F7A0D8];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke;
  v33[3] = &unk_1E69EA378;
  v33[4] = v10;
  v18 = [(HMBCloudZone *)v10 operationScheduler];
  id v19 = [v17 lazyFutureWithBlock:v33 scheduler:v18];
  [v7 addObject:v19];

  id v20 = (void *)MEMORY[0x1E4F7A0D8];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke_2;
  v32[3] = &unk_1E69EA378;
  v32[4] = v10;
  id v21 = [(HMBCloudZone *)v10 operationScheduler];
  v22 = [v20 lazyFutureWithBlock:v32 scheduler:v21];
  [v7 addObject:v22];

  uint64_t v23 = [MEMORY[0x1E4F7A0D8] chainFutures:v7];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke_70;
  v31[3] = &unk_1E69EB0B8;
  v31[4] = v10;
  v24 = [v23 addSuccessBlock:v31];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke_71;
  v28[3] = &unk_1E69E97F8;
  v28[4] = v10;
  id v29 = v6;
  id v30 = v4;
  id v25 = v4;
  id v26 = v6;
  id v27 = (id)[v24 addFailureBlock:v28];
}

void __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = +[HMBProcessingOptions optionsWithLabel:@"HMBCloudZone startup sync"];
  id v4 = [*(id *)(a1 + 32) performStartupCloudPullWithOptions:v7];
  uint64_t v5 = [v3 completionHandlerAdapter];

  id v6 = (id)[v4 addCompletionBlock:v5];
}

void __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v7;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_INFO, "%{public}@Startup steps - enqueue pending pushes", buf, 0xCu);
  }
  id v8 = *(id *)(a1 + 32);
  id v23 = v3;
  uint64_t v9 = [v8 localZone];
  id v28 = 0;
  id v10 = [v9 fetchReadyBlocksWithType:0 error:&v28];
  id v22 = v28;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v10;
  id v12 = (id)[v11 countByEnumeratingWithState:&v24 objects:buf count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v15);
        id v17 = (void *)MEMORY[0x1D944CB30](v12);
        id v18 = v8;
        id v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = HMFGetLogIdentifier();
          uint64_t v21 = objc_msgSend(v16, "blockRow", v22);
          *(_DWORD *)id v29 = 138543618;
          id v30 = v20;
          __int16 v31 = 2048;
          uint64_t v32 = v21;
          _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_INFO, "%{public}@Enqueueing pending push for output blockRow: %lu", v29, 0x16u);
        }
        id v12 = (id)objc_msgSend(v18, "_triggerOutputForOutputRow:options:", objc_msgSend(v16, "blockRow"), 0);
        uint64_t v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v12 = (id)[v11 countByEnumeratingWithState:&v24 objects:buf count:16];
      id v13 = v12;
    }
    while (v12);
  }

  [v23 finishWithNoResult];
}

void __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully started up with private local zone", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [*(id *)(a1 + 32) startUp];
  [v8 finishWithNoResult];
}

void __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke_71(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v12 = v7;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start up with private local zone (will retry after delay): %{public}@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke_72;
  v9[3] = &unk_1E69E9A18;
  id v8 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  [v8 retryStartupBlock:v9];
}

uint64_t __45__HMBCloudZone__startUpWithPrivateLocalZone___block_invoke_72(uint64_t a1)
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
    _os_log_impl(&dword_1D4693000, v4, OS_LOG_TYPE_INFO, "%{public}@Retrying private cloud zone startup", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _startUpWithPrivateLocalZone:*(void *)(a1 + 40)];
}

- (void)startUpWithLocalZone:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  BOOL v5 = [(HMBCloudZone *)self hasStartedUp];
  [(HMBCloudZone *)self setHasStartedUp:1];
  os_unfair_lock_unlock(&self->_propertyLock);
  id v6 = (void *)MEMORY[0x1D944CB30]();
  int v7 = self;
  id v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      id v10 = HMFGetLogIdentifier();
      int v15 = 138543362;
      id v16 = v10;
      _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_INFO, "%{public}@Not starting up cloud zone that has already started up", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v11 = HMFGetLogIdentifier();
      id v12 = [(HMBCloudZone *)v7 configuration];
      int v15 = 138543874;
      id v16 = v11;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting up with local zone: %@ configuration: %@", (uint8_t *)&v15, 0x20u);
    }
    [(HMBCloudZone *)v7 setLocalZone:v4];
    __int16 v13 = [(HMBCloudZone *)v7 cloudZoneID];
    BOOL v14 = [v13 scope] == 1;

    if (v14) {
      [(HMBCloudZone *)v7 _startUpWithPublicLocalZone:v4];
    }
    else {
      [(HMBCloudZone *)v7 _startUpWithPrivateLocalZone:v4];
    }
  }
}

- (void)notifyDelegateOfError:(id)a3 forOperation:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMBCloudZone *)self cloudDatabase];
  BOOL v9 = [v8 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v10 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __int16 v13 = HMFGetLogIdentifier();
      int v15 = 138544130;
      id v16 = v13;
      __int16 v17 = 2112;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Notifying delegate %@ for error on operation %@: %@", (uint8_t *)&v15, 0x2Au);
    }
    BOOL v14 = [(HMBCloudZone *)v11 cloudZoneID];
    [v9 cloudDatabase:v8 encounteredError:v6 withOperation:v7 onZone:v14];
  }
}

- (BOOL)retryCloudKitOperation:(id)a3 afterError:(id)a4 retryBlock:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(HMBCloudZone *)self notifyDelegateOfError:v9 forOperation:v8];
  if ([v9 hmbIsCKMissingManateeIdentityError])
  {
    uint64_t v11 = (void *)MEMORY[0x1D944CB30]();
    id v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      BOOL v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v14;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_ERROR, "%{public}@Received missing Manatee identity error on zone specific operation: %@", buf, 0x16u);
    }
    [(HMBCloudZone *)v12 handleLostKeys];
    int v15 = [(HMBCloudZone *)v12 waitForPendingRebuild];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __61__HMBCloudZone_retryCloudKitOperation_afterError_retryBlock___block_invoke;
    v27[3] = &unk_1E69E97D0;
    id v28 = v10;
    id v16 = (id)[v15 addSuccessBlock:v27];

    __int16 v17 = [(HMBCloudZone *)v12 configuration];
    int v18 = [v17 shouldRebuildOnManateeKeyLoss];

    if (v18) {
      [(HMBCloudZone *)v12 rebuild];
    }

    char v19 = 1;
  }
  else if ([v9 hmbIsCKZoneDisabledError])
  {
    id v20 = (void *)MEMORY[0x1D944CB30]();
    __int16 v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v23;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_ERROR, "%{public}@Received zone disabled error: %@", buf, 0x16u);
    }
    long long v24 = [(HMBCloudZone *)v21 delegate];
    if (objc_opt_respondsToSelector()) {
      [v24 cloudZone:v21 didEncounterZoneDisabledError:v9];
    }

    char v19 = 0;
  }
  else
  {
    long long v25 = [(HMBCloudZone *)self cloudDatabase];
    char v19 = [v25 _retryCloudKitOperationAfterError:v9 retryBlock:v10];
  }
  return v19;
}

uint64_t __61__HMBCloudZone_retryCloudKitOperation_afterError_retryBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)triggerOutputForOutputRow:(unint64_t)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = [(HMBCloudZone *)self startUp];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__HMBCloudZone_triggerOutputForOutputRow_options___block_invoke;
  v11[3] = &unk_1E69E97A8;
  id v12 = v6;
  unint64_t v13 = a3;
  v11[4] = self;
  id v8 = v6;
  id v9 = [v7 flatMap:v11];

  return v9;
}

uint64_t __50__HMBCloudZone_triggerOutputForOutputRow_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _triggerOutputForOutputRow:*(void *)(a1 + 48) options:*(void *)(a1 + 40)];
}

- (id)destroy
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = self;
  p_propertyLock = &v2->_propertyLock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMBCloudZone *)v2 destroyFuture];

  if (v4)
  {
    os_unfair_lock_unlock(p_propertyLock);
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    [(HMBCloudZone *)v2 setDestroyFuture:v5];

    os_unfair_lock_unlock(p_propertyLock);
    id v6 = (void *)MEMORY[0x1D944CB30]();
    id v7 = v2;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v18 = 138543618;
      char v19 = v9;
      __int16 v20 = 2112;
      __int16 v21 = v7;
      _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_INFO, "%{public}@Destroying cloud zone: %@", (uint8_t *)&v18, 0x16u);
    }
    id v10 = [(HMBCloudZone *)v7 cloudDatabase];
    uint64_t v11 = [(HMBCloudZone *)v7 cloudZoneID];
    id v12 = [v10 removeZoneWithID:v11];
    unint64_t v13 = [(HMBCloudZone *)v7 destroyFuture];
    BOOL v14 = [v13 completionHandlerAdapter];
    id v15 = (id)[v12 addCompletionBlock:v14];
  }
  id v16 = [(HMBCloudZone *)v2 destroyFuture];
  return v16;
}

- (id)shutdown
{
  id v3 = [(HMBCloudZone *)self startUp];
  id v4 = [v3 recoverIgnoringError];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __24__HMBCloudZone_shutdown__block_invoke;
  v7[3] = &unk_1E69E9780;
  v7[4] = self;
  id v5 = [v4 flatMap:v7];

  return v5;
}

id __24__HMBCloudZone_shutdown__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (os_unfair_lock_s *)*(id *)(a1 + 32);
  id v5 = v4 + 2;
  os_unfair_lock_lock_with_options();
  id v6 = [(os_unfair_lock_s *)v4 shutdownFuture];

  if (v6) {
    goto LABEL_2;
  }
  id v7 = [(os_unfair_lock_s *)v4 database];

  id v8 = (void *)MEMORY[0x1E4F7A0D8];
  if (!v7)
  {
    unint64_t v13 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    BOOL v14 = [v8 futureWithError:v13];
    [(os_unfair_lock_s *)v4 setShutdownFuture:v14];

LABEL_2:
    os_unfair_lock_unlock(v5);
    goto LABEL_5;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  [(os_unfair_lock_s *)v4 setShutdownFuture:v9];

  os_unfair_lock_unlock(v5);
  id v10 = [(os_unfair_lock_s *)v4 shutdownFuture];
  [v10 finishWithNoResult];

LABEL_5:
  uint64_t v11 = [*(id *)(a1 + 32) shutdownFuture];

  return v11;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D944CB30](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1D4693000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Deallocating HMBCloudZone", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMBCloudZone;
  [(HMBCloudZone *)&v7 dealloc];
}

- (HMBCloudZone)initWithCloudDatabase:(id)a3 configuration:(id)a4 state:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  uint64_t v11 = v10;
  if (!v10)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  v48.receiver = self;
  v48.super_class = (Class)HMBCloudZone;
  id v12 = [(HMBCloudZone *)&v48 init];
  unint64_t v13 = v12;
  if (!v12)
  {
LABEL_13:

    return v13;
  }
  objc_storeWeak((id *)&v12->_cloudDatabase, v8);
  BOOL v14 = [v11 zoneID];
  uint64_t v15 = [v14 scope];

  switch(v15)
  {
    case 1:
      uint64_t v16 = [v8 publicDatabase];
      break;
    case 2:
      uint64_t v16 = [v8 privateDatabase];
      break;
    case 3:
      uint64_t v16 = [v8 sharedDatabase];
      break;
    default:
      goto LABEL_11;
  }
  database = v13->_database;
  v13->_database = (CKDatabase *)v16;

LABEL_11:
  if (v13->_database)
  {
    int v18 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    startUp = v13->_startUp;
    v13->_startUp = v18;

    __int16 v20 = [v8 stateZone];
    objc_storeWeak((id *)&v13->_stateZone, v20);

    uint64_t v21 = [v11 zoneID];
    cloudZoneID = v13->_cloudZoneID;
    v13->_cloudZoneID = (HMBCloudZoneID *)v21;

    uint64_t v23 = [v11 hmbModelID];
    stateModelID = v13->_stateModelID;
    v13->_stateModelID = (NSUUID *)v23;

    uint64_t v25 = [(HMBCloudZone *)v13 operationScheduler];
    operationScheduler = v13->_operationScheduler;
    v13->_operationScheduler = (NAScheduler *)v25;

    long long v27 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v28 = [v27 UUIDString];
    deviceIdentifier = v13->_deviceIdentifier;
    v13->_deviceIdentifier = (NSString *)v28;

    uint64_t v30 = [v9 copy];
    configuration = v13->_configuration;
    v13->_configuration = (HMBCloudZoneConfiguration *)v30;

    uint64_t v32 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    modelClassToRequiresPostProcessingMap = v13->_modelClassToRequiresPostProcessingMap;
    v13->_modelClassToRequiresPostProcessingMap = (NSMapTable *)v32;

    uint64_t v34 = [MEMORY[0x1E4F1CA60] dictionary];
    shareParticipantModelsByClientIdentifier = v13->_shareParticipantModelsByClientIdentifier;
    v13->_shareParticipantModelsByClientIdentifier = (NSMutableDictionary *)v34;

    uint64_t v36 = [MEMORY[0x1E4F1CA60] dictionary];
    inProgressPushFuturesByOutputBlockRow = v13->_inProgressPushFuturesByOutputBlockRow;
    v13->_inProgressPushFuturesByOutputBlockRow = (NSMutableDictionary *)v36;

    uint64_t v38 = [MEMORY[0x1E4F7A0F0] globalAsyncScheduler];
    uint64_t v39 = v13->_operationScheduler;
    v13->_operationScheduler = (NAScheduler *)v38;

    v40 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    recordOperationQueue = v13->_recordOperationQueue;
    v13->_recordOperationQueue = v40;

    [(NSOperationQueue *)v13->_recordOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v13->_recordOperationQueue setQualityOfService:25];
    v42 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    shareOperationQueue = v13->_shareOperationQueue;
    v13->_shareOperationQueue = v42;

    [(NSOperationQueue *)v13->_shareOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v13->_shareOperationQueue setQualityOfService:17];
    defaultDesiredKeys = v13->_defaultDesiredKeys;
    v13->_defaultDesiredKeys = (NSArray *)&unk_1F2C4CB28;

    goto LABEL_13;
  }
LABEL_16:
  v46 = (void *)_HMFPreconditionFailure();
  return (HMBCloudZone *)+[HMBCloudZone logCategory];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t26 != -1) {
    dispatch_once(&logCategory__hmf_once_t26, &__block_literal_global_970);
  }
  v2 = (void *)logCategory__hmf_once_v27;
  return v2;
}

uint64_t __27__HMBCloudZone_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v27;
  logCategory__hmf_once_long long v27 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)pushRecordsToUpdate:(id)a3 recordIDsToRemove:(id)a4 configuration:(id)a5 rollbackEnabled:(BOOL)a6 needsNewInvitationToken:(BOOL)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = (void *)MEMORY[0x1D944CB30]();
  uint64_t v16 = self;
  __int16 v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v36 = v18;
    __int16 v37 = 2112;
    id v38 = v12;
    __int16 v39 = 2112;
    id v40 = v13;
    _os_log_impl(&dword_1D4693000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Pushing with updates: %@ removes: %@", buf, 0x20u);
  }
  if (!v12) {
    id v12 = (id)MEMORY[0x1E4F1CBF0];
  }
  if (!v13) {
    id v13 = (id)MEMORY[0x1E4F1CBF0];
  }
  if ([v12 count] || objc_msgSend(v13, "count"))
  {
    if (!v14)
    {
      char v19 = [(HMBCloudZone *)v16 cloudDatabase];
      id v14 = [v19 operationConfigurationWithProcessingOptions:0];
    }
    __int16 v20 = (void *)MEMORY[0x1E4F7A0D8];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __130__HMBCloudZone_CloudRecord_Internal__pushRecordsToUpdate_recordIDsToRemove_configuration_rollbackEnabled_needsNewInvitationToken___block_invoke;
    v29[3] = &unk_1E69E9820;
    uint8_t v29[4] = v16;
    id v30 = v12;
    id v31 = v13;
    id v14 = v14;
    id v32 = v14;
    BOOL v33 = a6;
    BOOL v34 = a7;
    uint64_t v21 = [(HMBCloudZone *)v16 operationScheduler];
    uint64_t v22 = [v20 futureWithBlock:v29 scheduler:v21];
  }
  else
  {
    long long v24 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v25 = [HMBCloudZoneRecordPushResult alloc];
    long long v26 = [MEMORY[0x1E4F1CAD0] set];
    long long v27 = [MEMORY[0x1E4F1CAD0] set];
    uint64_t v28 = [(HMBCloudZoneRecordPushResult *)v25 initWithUpdatedRecords:v26 deletedRecordIDs:v27 error:0];
    uint64_t v22 = [v24 futureWithResult:v28];
  }
  return v22;
}

void __130__HMBCloudZone_CloudRecord_Internal__pushRecordsToUpdate_recordIDsToRemove_configuration_rollbackEnabled_needsNewInvitationToken___block_invoke(uint64_t a1, void *a2)
{
}

- (id)pushRecordsToUpdate:(id)a3 recordIDsToRemove:(id)a4 configuration:(id)a5 rollbackEnabled:(BOOL)a6
{
  return [(HMBCloudZone *)self pushRecordsToUpdate:a3 recordIDsToRemove:a4 configuration:a5 rollbackEnabled:a6 needsNewInvitationToken:0];
}

- (id)decodeManateeCloudFromRecord:(id)a3 externalRecordFields:(id)a4 source:(unint64_t)a5 error:(id *)a6
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v103 = [(HMBCloudZone *)self cloudDatabase];
  id v12 = [v103 configuration];
  id v13 = objc_msgSend(v10, "hmbObjectForKey:encrypted:", @"k00", objc_msgSend(v12, "isManateeContainer"));

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    int v112 = 0;
    uint64_t v16 = (void *)OPACKDecodeData();
    __int16 v17 = v16;
    if (v16)
    {
      unint64_t v100 = a5;
      id v18 = v16;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v19 = v18;
      }
      else {
        char v19 = 0;
      }
      id v20 = v19;

      v102 = v20;
      uint64_t v21 = objc_msgSend(v20, "hmf_numberForKey:", @"HM.encoding");
      uint64_t v22 = [v21 unsignedIntegerValue];

      if (!v22)
      {
        uint64_t v23 = (void *)MEMORY[0x1D944CB30]();
        long long v24 = self;
        uint64_t v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v96 = v17;
          v27 = id v26 = v11;
          *(_DWORD *)buf = 138543874;
          v114 = v27;
          __int16 v115 = 2112;
          v116 = v102;
          __int16 v117 = 2048;
          uint64_t v118 = 2;
          _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to determine encoding from version metadata: %@. Defaulting to %lu encoding", buf, 0x20u);

          id v11 = v26;
          __int16 v17 = v96;
        }

        uint64_t v22 = 2;
      }
      v101 = v11;
      uint64_t v28 = [(HMBCloudZone *)self cloudFieldForEncoding:v22];
      id v29 = [v103 configuration];
      id v30 = objc_msgSend(v10, "hmbObjectForKey:encrypted:", v28, objc_msgSend(v29, "isManateeContainer"));

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v31 = v30;
      }
      else {
        id v31 = 0;
      }
      id v32 = v31;

      if (v32)
      {
        BOOL v33 = [v32 hmbUncompress];
        if (v33)
        {
          BOOL v34 = [(HMBCloudZone *)self modelContainer];
          v95 = v34;
          if (v34)
          {
            id v111 = 0;
            uint64_t v35 = [v34 modelFromData:v33 encoding:v22 storageLocation:1 error:&v111];
            id v91 = v111;
            id v11 = v101;
            if (v35)
            {
              v97 = v17;
              uint64_t v36 = [(id)objc_opt_class() hmbExternalRecordType];
              __int16 v37 = [v10 recordType];
              char v38 = [v36 isEqualToString:v37];

              if ((v38 & 1) == 0)
              {
                __int16 v39 = (void *)MEMORY[0x1D944CB30]();
                id v40 = self;
                uint64_t v41 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  v90 = HMFGetLogIdentifier();
                  v88 = [v35 hmbCanonicalType];
                  v89 = [(id)objc_opt_class() hmbExternalRecordType];
                  [v10 recordType];
                  v92 = v33;
                  v43 = id v42 = v32;
                  *(_DWORD *)buf = 138544130;
                  v114 = v90;
                  __int16 v115 = 2112;
                  v116 = v88;
                  __int16 v117 = 2112;
                  uint64_t v118 = (uint64_t)v89;
                  __int16 v119 = 2112;
                  v120 = v43;
                  _os_log_impl(&dword_1D4693000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Model of type %@ expected external record type %@ but cloud record has type %@", buf, 0x2Au);

                  id v32 = v42;
                  BOOL v33 = v92;
                }
              }
              v44 = objc_msgSend(v10, "recordType", v88);
              v45 = +[HMBModel hmbExternalRecordType];
              char v46 = [v44 isEqualToString:v45];

              SEL v47 = v95;
              if ((v46 & 1) == 0)
              {
                objc_super v48 = [(id)objc_opt_class() hmbProperties];
                v104[0] = MEMORY[0x1E4F143A8];
                v104[1] = 3221225472;
                v104[2] = __88__HMBCloudZone_Manatee__decodeManateeCloudFromRecord_externalRecordFields_source_error___block_invoke;
                v104[3] = &unk_1E69E9B10;
                id v105 = v101;
                id v106 = v103;
                id v107 = v10;
                unint64_t v110 = v100;
                id v108 = v95;
                id v109 = v35;
                [v48 enumerateKeysAndObjectsUsingBlock:v104];
              }
              id v49 = v35;
              __int16 v17 = v97;
              v50 = v91;
            }
            else
            {
              v81 = (void *)MEMORY[0x1D944CB30]();
              v82 = self;
              v83 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v84 = v99 = v17;
                [v10 hmbDescription];
                v94 = v33;
                v86 = id v85 = v32;
                *(_DWORD *)buf = 138543874;
                v114 = v84;
                __int16 v115 = 2114;
                v116 = v86;
                __int16 v117 = 2112;
                uint64_t v118 = (uint64_t)v91;
                _os_log_impl(&dword_1D4693000, v83, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode data for record %{public}@: %@", buf, 0x20u);

                id v32 = v85;
                BOOL v33 = v94;

                __int16 v17 = v99;
              }

              id v11 = v101;
              SEL v47 = v95;
              v50 = v91;
              if (a6) {
                *a6 = v91;
              }
            }
          }
          else
          {
            v75 = (void *)MEMORY[0x1D944CB30]();
            v76 = self;
            v77 = HMFGetOSLogHandle();
            id v11 = v101;
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v78 = v98 = v17;
              [v10 hmbDescription];
              v93 = v33;
              v80 = id v79 = v32;
              *(_DWORD *)buf = 138543618;
              v114 = v78;
              __int16 v115 = 2114;
              v116 = v80;
              _os_log_impl(&dword_1D4693000, v77, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode data for record %{public}@: Model container is nil", buf, 0x16u);

              id v32 = v79;
              BOOL v33 = v93;

              __int16 v17 = v98;
            }

            if (a6)
            {
              [MEMORY[0x1E4F28C58] hmfErrorWithCode:8 reason:@"Model container is nil"];
              uint64_t v35 = 0;
              *a6 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              uint64_t v35 = 0;
            }
            SEL v47 = 0;
          }
        }
        else
        {
          v68 = (void *)MEMORY[0x1D944CB30]();
          v69 = self;
          v70 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v72 = v71 = v17;
            [v10 hmbDescription];
            v74 = id v73 = v32;
            *(_DWORD *)buf = 138543618;
            v114 = v72;
            __int16 v115 = 2114;
            v116 = v74;
            _os_log_impl(&dword_1D4693000, v70, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode data for record %{public}@: Uncompress failed", buf, 0x16u);

            id v32 = v73;
            __int16 v17 = v71;
            BOOL v33 = 0;
          }

          id v11 = v101;
          if (a6)
          {
            [MEMORY[0x1E4F28C58] hmfErrorWithCode:15 reason:@"Model data failed to uncompress"];
            uint64_t v35 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v35 = 0;
          }
        }
      }
      else
      {
        v62 = (void *)MEMORY[0x1D944CB30]();
        v63 = self;
        v64 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          v65 = HMFGetLogIdentifier();
          [v10 hmbDescription];
          v67 = v66 = v17;
          *(_DWORD *)buf = 138544130;
          v114 = v65;
          __int16 v115 = 2114;
          v116 = v67;
          __int16 v117 = 2048;
          uint64_t v118 = v22;
          __int16 v119 = 2112;
          v120 = v102;
          _os_log_impl(&dword_1D4693000, v64, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode data for record %{public}@: Could not find data for encoding type %lu in metadata: %@", buf, 0x2Au);

          __int16 v17 = v66;
          id v32 = 0;
        }

        if (a6)
        {
          [MEMORY[0x1E4F28C58] hmfErrorWithCode:15 reason:@"No model data for encoding type"];
          uint64_t v35 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v35 = 0;
        }
        id v11 = v101;
      }
    }
    else
    {
      v56 = (void *)MEMORY[0x1D944CB30]();
      v57 = self;
      v58 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        v59 = HMFGetLogIdentifier();
        [v10 hmbDescription];
        v61 = id v60 = v11;
        *(_DWORD *)buf = 138543874;
        v114 = v59;
        __int16 v115 = 2114;
        v116 = v61;
        __int16 v117 = 1024;
        LODWORD(v118) = v112;
        _os_log_impl(&dword_1D4693000, v58, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode data for record %{public}@: Unable to decode version metadata: %d", buf, 0x1Cu);

        id v11 = v60;
      }

      if (a6)
      {
        [MEMORY[0x1E4F28C58] hmfErrorWithCode:15 reason:@"Unable to decode version metadata"];
        uint64_t v35 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v35 = 0;
      }
    }
  }
  else
  {
    v51 = (void *)MEMORY[0x1D944CB30]();
    v52 = self;
    v53 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v54 = HMFGetLogIdentifier();
      v55 = [v10 hmbDescription];
      *(_DWORD *)buf = 138543618;
      v114 = v54;
      __int16 v115 = 2114;
      v116 = v55;
      _os_log_impl(&dword_1D4693000, v53, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode data for record %{public}@: Cannot find metadata", buf, 0x16u);
    }
    if (a6)
    {
      [MEMORY[0x1E4F28C58] hmfErrorWithCode:15 reason:@"Cannot find metadata"];
      uint64_t v35 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v35 = 0;
    }
  }

  return v35;
}

void __88__HMBCloudZone_Manatee__decodeManateeCloudFromRecord_externalRecordFields_source_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = [v5 externalRecordField];
  if (v6)
  {
    objc_super v7 = *(void **)(a1 + 32);
    if (!v7 || [v7 containsObject:v6])
    {
      id v8 = [*(id *)(a1 + 40) configuration];
      if ([v8 isManateeContainer]) {
        uint64_t v9 = [v5 encrypted];
      }
      else {
        uint64_t v9 = 0;
      }

      id v10 = *(void **)(a1 + 48);
      id v11 = [v5 externalRecordField];
      id v12 = [v10 hmbObjectForKey:v11 encrypted:v9];

      if ([v5 conformsToHMBModelNativeCKWrapper]) {
        objc_msgSend((id)objc_msgSend(v5, "classObj"), "applyNativeCKValue:fromSource:associatingWith:toModel:propertyNamed:", v12, *(void *)(a1 + 72), *(void *)(a1 + 56), *(void *)(a1 + 64), v13);
      }
      else {
        [*(id *)(a1 + 64) hmbSetProperty:v12 named:v13];
      }
    }
  }
}

- (id)encodeManateeCloudModel:(id)a3 existingRecord:(id)a4 encodingContext:(id)a5 error:(id *)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v11 modelContainer];
  [v9 hmbAssociateWithContainer:v12];

  id v13 = v10;
  if (v13)
  {
    id v14 = (void *)MEMORY[0x1D944CB30]();
    id v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      __int16 v17 = v38 = self;
      [v13 hmbDescription];
      v18 = uint64_t v36 = v14;
      char v19 = [v9 hmbCanonicalType];
      id v20 = [v9 hmbModelID];
      uint64_t v21 = [v20 UUIDString];
      *(_DWORD *)buf = 138544130;
      id v42 = v17;
      __int16 v43 = 2112;
      v44 = v18;
      __int16 v45 = 2112;
      char v46 = v19;
      __int16 v47 = 2112;
      uint64_t v48 = (uint64_t)v21;
      _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Updating existing cloud record %@ to store model %@.%@", buf, 0x2Au);

      id v14 = v36;
      self = v38;
    }

    uint64_t v22 = v13;
  }
  else
  {
    uint64_t v23 = [(HMBCloudZone *)self recordIDForModel:v9];
    long long v24 = [(id)objc_opt_class() hmbExternalRecordType];
    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:v24 recordID:v23];
    uint64_t v25 = (void *)MEMORY[0x1D944CB30]();
    __int16 v39 = self;
    id v26 = self;
    long long v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v34 = HMFGetLogIdentifier();
      BOOL v33 = [v22 hmbDescription];
      [v9 hmbCanonicalType];
      uint64_t v28 = v35 = v24;
      [v9 hmbModelID];
      id v29 = v37 = v23;
      [v29 UUIDString];
      *(_DWORD *)buf = 138544130;
      id v42 = v34;
      __int16 v43 = 2112;
      v44 = v33;
      __int16 v45 = 2112;
      char v46 = v28;
      v48 = __int16 v47 = 2112;
      id v30 = (void *)v48;
      _os_log_impl(&dword_1D4693000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Creating new cloud record %@ to store model %@.%@", buf, 0x2Au);

      uint64_t v23 = v37;
      long long v24 = v35;
    }

    self = v39;
  }
  if ([(HMBCloudZone *)self populateManateeCloudRecord:v22 withModel:v9 encodingContext:v11 error:a6])
  {
    id v31 = v22;
  }
  else
  {
    id v31 = 0;
  }

  return v31;
}

- (BOOL)populateManateeCloudRecord:(id)a3 withModel:(id)a4 encodingContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 modelContainer];
  [v11 hmbAssociateWithContainer:v13];

  id v14 = [(id)objc_opt_class() hmbProperties];
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  BOOL v33 = __Block_byref_object_copy__1779;
  BOOL v34 = __Block_byref_object_dispose__1780;
  id v35 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __84__HMBCloudZone_Manatee__populateManateeCloudRecord_withModel_encodingContext_error___block_invoke;
  v24[3] = &unk_1E69E9AE8;
  id v15 = v11;
  id v25 = v15;
  id v16 = v10;
  id v26 = v16;
  long long v27 = self;
  id v17 = v12;
  id v28 = v17;
  id v29 = &v30;
  [v14 enumerateKeysAndObjectsUsingBlock:v24];
  id v18 = (void *)v31[5];
  if (v18)
  {
    BOOL v19 = 0;
    if (a6) {
      *a6 = v18;
    }
  }
  else
  {
    id v20 = [(HMBCloudZone *)self cloudMetadataForModel:v15 usingEncoding:2];
    int v23 = 0;
    uint64_t v21 = (void *)MEMORY[0x1D944C960](v20, 12, &v23);
    if (v21)
    {
      BOOL v19 = [(HMBCloudZone *)self populateV4CloudRecord:v16 withModel:v15 metadataFieldData:v21 startEncoding:2 endEncoding:3 encodingContext:v17 error:a6];
    }
    else if (a6)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v23 userInfo:0];
      BOOL v19 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  _Block_object_dispose(&v30, 8);

  return v19;
}

void __84__HMBCloudZone_Manatee__populateManateeCloudRecord_withModel_encodingContext_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = [v8 externalRecordField];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) hmbSetProperties];
    int v11 = [v10 containsObject:v7];

    if (v11)
    {
      id v12 = [*(id *)(a1 + 32) hmbPropertyNamed:v7];
      if ([v8 conformsToHMBModelNativeCKWrapper])
      {
        if (v12)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            uint64_t v30 = (void *)MEMORY[0x1D944CB30]();
            id v31 = *(id *)(a1 + 48);
            uint64_t v32 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              BOOL v33 = HMFGetLogIdentifier();
              BOOL v34 = [*(id *)(a1 + 32) hmbDescription];
              id v35 = (objc_class *)objc_opt_class();
              uint64_t v36 = NSStringFromClass(v35);
              *(_DWORD *)buf = 138544130;
              uint64_t v41 = v33;
              __int16 v42 = 2112;
              __int16 v43 = v34;
              __int16 v44 = 2112;
              id v45 = v7;
              __int16 v46 = 2112;
              id v47 = v36;
              _os_log_impl(&dword_1D4693000, v32, OS_LOG_TYPE_ERROR, "%{public}@Dropping change for %@/%@ because property type %@ doesn't respond to nativeCKValueWithEncodingContext:error: but we think it conforms to HMBModelNativeCKWrapper", buf, 0x2Au);
            }
            goto LABEL_22;
          }
          uint64_t v13 = *(void *)(a1 + 56);
          id v39 = 0;
          uint64_t v14 = [v12 nativeCKValueWithEncodingContext:v13 error:&v39];
          id v15 = v39;
          id v16 = v39;

          if (!v14 && v16)
          {
            id v17 = (void *)MEMORY[0x1D944CB30]();
            id v18 = *(id *)(a1 + 48);
            BOOL v19 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              id v20 = v37 = v18;
              [*(id *)(a1 + 32) hmbDescription];
              uint64_t v21 = v38 = v17;
              *(_DWORD *)buf = 138544130;
              uint64_t v41 = v20;
              __int16 v42 = 2112;
              __int16 v43 = v21;
              __int16 v44 = 2112;
              id v45 = v7;
              __int16 v46 = 2112;
              id v47 = v16;
              _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to encode wrapped and externally stored property %@/%@: %@", buf, 0x2Au);

              id v17 = v38;
              id v18 = v37;
            }

            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v15);
            *a4 = 1;
          }

          id v12 = (void *)v14;
          goto LABEL_14;
        }
        id v28 = *(void **)(a1 + 40);
        id v29 = [v8 externalRecordField];
        [v28 setObject:0 forKey:v29];

        id v12 = 0;
      }
      else
      {
        uint64_t v22 = [v8 classObj];
        if (v22 != objc_opt_class() || [v12 count])
        {
LABEL_14:
          int v23 = [*(id *)(a1 + 48) cloudDatabase];
          long long v24 = [v23 configuration];
          if ([v24 isManateeContainer]) {
            uint64_t v25 = [v8 encrypted];
          }
          else {
            uint64_t v25 = 0;
          }

          id v26 = *(void **)(a1 + 40);
          long long v27 = [v8 externalRecordField];
          [v26 hmbSetObject:v12 forKey:v27 encrypted:v25];
        }
      }
LABEL_22:
    }
  }
}

- (id)recordIDForModel:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 hmbModelID];

  id v8 = [v7 UUIDString];
  id v9 = [(HMBCloudZone *)self cloudZoneID];
  id v10 = [v9 zoneID];
  int v11 = (void *)[v6 initWithRecordName:v8 zoneID:v10];

  return v11;
}

- (id)fetchChangesWithToken:(id)a3 options:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D944CB30]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    long long v24 = v11;
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v7;
    _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching cloud zone changes with token: %@ options: %@", buf, 0x20u);
  }
  id v12 = (void *)MEMORY[0x1E4F7A0D8];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __55__HMBCloudZone_Changes__fetchChangesWithToken_options___block_invoke;
  v20[3] = &unk_1E69EA4D8;
  v20[4] = v9;
  id v21 = v6;
  id v22 = v7;
  id v13 = v7;
  id v14 = v6;
  id v15 = [(HMBCloudZone *)v9 operationScheduler];
  id v16 = [v12 futureWithBlock:v20 scheduler:v15];

  id v17 = [v16 flatMap:&__block_literal_global_2168];
  id v18 = [v17 flatMap:&__block_literal_global_4];

  return v18;
}

void __55__HMBCloudZone_Changes__fetchChangesWithToken_options___block_invoke(void **a1, void *a2)
{
}

uint64_t __55__HMBCloudZone_Changes__fetchChangesWithToken_options___block_invoke_3()
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

uint64_t __55__HMBCloudZone_Changes__fetchChangesWithToken_options___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 processingFuture];
}

- (BOOL)resolveConflicts:(id)a3 options:(id)a4
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMBCloudZone *)self localZone];
  id v98 = 0;
  uint64_t v9 = [v8 createMirrorInputWithError:&v98];
  id v10 = v98;

  v78 = (void *)v9;
  if (v9)
  {
    id v73 = v10;
    id v74 = v7;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v75 = v6;
    id obj = v6;
    v77 = self;
    uint64_t v86 = [obj countByEnumeratingWithState:&v94 objects:v105 count:16];
    if (!v86) {
      goto LABEL_43;
    }
    int v11 = self;
    uint64_t v12 = *(void *)v95;
    uint64_t v80 = *(void *)v95;
    while (1)
    {
      for (uint64_t i = 0; i != v86; ++i)
      {
        if (*(void *)v95 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        id v15 = [v14 serverRecord];
        if (v15)
        {
          id v91 = 0;
          id v16 = [(HMBCloudZone *)v11 decodeModelFromRecord:v15 externalRecordFields:0 source:4 error:&v91];
          id v17 = v91;
          id v18 = v17;
          if (!v16)
          {
            uint64_t v50 = MEMORY[0x1D944CB30]();
            v51 = v11;
            v52 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              v53 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              unint64_t v100 = v53;
              __int16 v101 = 2112;
              id v102 = v14;
              __int16 v103 = 2112;
              id v104 = v18;
              _os_log_impl(&dword_1D4693000, v52, OS_LOG_TYPE_ERROR, "%{public}@Unable to generate server model for conflict %@: %@", buf, 0x20u);
            }
            v54 = (void *)v50;
LABEL_35:
            id v16 = 0;
            goto LABEL_41;
          }
          id v84 = v17;
          id v90 = 0;
          BOOL v19 = [v15 externalID:&v90];
          id v20 = v90;
          id v21 = v20;
          if (v19)
          {
            id v89 = 0;
            id v22 = [v15 externalData:&v89];
            id v81 = v89;
            context = (void *)MEMORY[0x1D944CB30]();
            int v23 = v11;
            long long v24 = HMFGetOSLogHandle();
            __int16 v25 = v24;
            if (v22)
            {
              v76 = v21;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                id v26 = HMFGetLogIdentifier();
                __int16 v27 = [v15 hmbDescription];
                id v28 = [v16 hmbDescription];
                *(_DWORD *)buf = 138543874;
                unint64_t v100 = v26;
                __int16 v101 = 2112;
                id v102 = v27;
                __int16 v103 = 2112;
                id v104 = v28;
                _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Staging server version of conflicted record %@ / %@ due to conflict", buf, 0x20u);
              }
              id v88 = 0;
              char v29 = [v78 stageAdditionForModel:v16 externalID:v19 externalData:v22 error:&v88];
              id v30 = v88;
              if ((v29 & 1) == 0)
              {
                id v31 = (void *)MEMORY[0x1D944CB30]();
                uint64_t v32 = v23;
                BOOL v33 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  BOOL v34 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543874;
                  unint64_t v100 = v34;
                  __int16 v101 = 2112;
                  id v102 = v16;
                  __int16 v103 = 2112;
                  id v104 = v30;
                  _os_log_impl(&dword_1D4693000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage addition for model %@: %@", buf, 0x20u);
                }
              }

              id v21 = v76;
              int v11 = v77;
            }
            else
            {
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                id v60 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                unint64_t v100 = v60;
                __int16 v101 = 2112;
                id v102 = v14;
                __int16 v103 = 2112;
                id v104 = v81;
                _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to generate server externalData for conflict %@: %@", buf, 0x20u);

                int v11 = v77;
              }
            }

            uint64_t v12 = v80;
            id v18 = v84;
          }
          else
          {
            id v55 = v20;
            v82 = (void *)MEMORY[0x1D944CB30]();
            v56 = v11;
            v57 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              v58 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              unint64_t v100 = v58;
              __int16 v101 = 2112;
              id v102 = v14;
              __int16 v103 = 2112;
              id v104 = v55;
              _os_log_impl(&dword_1D4693000, v57, OS_LOG_TYPE_ERROR, "%{public}@Unable to generate server externalID for conflict %@: %@", buf, 0x20u);

              uint64_t v12 = v80;
            }

            id v18 = v84;
            id v21 = v55;
          }
        }
        else
        {
          id v35 = [v14 recordID];
          id v93 = 0;
          id v16 = [v35 externalID:&v93];
          id v18 = v93;

          uint64_t v36 = (void *)MEMORY[0x1D944CB30]();
          id v37 = v11;
          char v38 = HMFGetOSLogHandle();
          id v39 = v38;
          if (!v16)
          {
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              v59 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              unint64_t v100 = v59;
              __int16 v101 = 2112;
              id v102 = v14;
              __int16 v103 = 2112;
              id v104 = v18;
              _os_log_impl(&dword_1D4693000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unable to generate client externalID for conflict %@: %@", buf, 0x20u);
            }
            v54 = v36;
            goto LABEL_35;
          }
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v41 = id v40 = v18;
            __int16 v42 = [v14 recordID];
            *(_DWORD *)buf = 138543618;
            unint64_t v100 = v41;
            __int16 v101 = 2112;
            id v102 = v42;
            _os_log_impl(&dword_1D4693000, v39, OS_LOG_TYPE_INFO, "%{public}@Staging removal for record ID without a server version: %@", buf, 0x16u);

            uint64_t v12 = v80;
            id v18 = v40;
            int v11 = v77;
          }

          id v92 = 0;
          char v43 = [v78 stageRemovalForModelWithExternalID:v16 error:&v92];
          id v44 = v92;
          if ((v43 & 1) == 0)
          {
            id v85 = v18;
            id v45 = (void *)MEMORY[0x1D944CB30]();
            __int16 v46 = v37;
            id v47 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              uint64_t v48 = HMFGetLogIdentifier();
              uint64_t v49 = [v14 recordID];
              *(_DWORD *)buf = 138543874;
              unint64_t v100 = v48;
              __int16 v101 = 2112;
              id v102 = v49;
              __int16 v103 = 2112;
              id v104 = v44;
              _os_log_impl(&dword_1D4693000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to stage removal for record ID %@: %@", buf, 0x20u);

              int v11 = v77;
              uint64_t v12 = v80;
            }

            id v18 = v85;
          }
        }
LABEL_41:
      }
      uint64_t v86 = [obj countByEnumeratingWithState:&v94 objects:v105 count:16];
      if (!v86)
      {
LABEL_43:

        v61 = +[HMBProcessingOptions optionsWithLabel:@"Conflicted record resolution"];
        id v87 = 0;
        v62 = [v78 commitWithOptions:v61 error:&v87];
        id v63 = v87;

        id v10 = v73;
        id v7 = v74;
        if (!v62)
        {
          v64 = (void *)MEMORY[0x1D944CB30]();
          v65 = v77;
          v66 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            v67 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            unint64_t v100 = v67;
            __int16 v101 = 2112;
            id v102 = v63;
            _os_log_impl(&dword_1D4693000, v66, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit conflicted record resolution: %@", buf, 0x16u);
          }
        }

        id v6 = v75;
        goto LABEL_51;
      }
    }
  }
  v68 = (void *)MEMORY[0x1D944CB30]();
  v69 = self;
  v70 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
  {
    v71 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    unint64_t v100 = v71;
    __int16 v101 = 2112;
    id v102 = v10;
    _os_log_impl(&dword_1D4693000, v70, OS_LOG_TYPE_ERROR, "%{public}@Failed to create input context for conflict records: %@", buf, 0x16u);
  }
LABEL_51:

  return 1;
}

- (id)_syncInternalModels
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v4 = NSString;
  id v5 = [(HMBCloudZone *)self zoneID];
  id v6 = [v5 name];
  id v7 = [v4 stringWithFormat:@"%s (%@)", "-[HMBCloudZone(Pull_Internal) _syncInternalModels]", v6];
  id v8 = (void *)[v3 initWithName:v7];

  uint64_t v9 = (void *)MEMORY[0x1D944CB30]();
  id v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    id v13 = [v8 identifier];
    id v14 = [v13 shortDescription];
    *(_DWORD *)buf = 138543618;
    char v38 = v12;
    __int16 v39 = 2114;
    id v40 = v14;
    _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Syncing internal models", buf, 0x16u);
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  id v16 = +[HMBModel hmbExternalRecordType];
  id v17 = [(HMBCloudZone *)v10 queryRecordsWithType:v16];

  id v18 = [(HMBCloudZone *)v10 queryRecordsWithType:*MEMORY[0x1E4F19D78]];
  BOOL v19 = (void *)MEMORY[0x1E4F7A0D8];
  v36[0] = v17;
  v36[1] = v18;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  id v21 = [MEMORY[0x1E4F7A0F0] globalAsyncScheduler];
  id v22 = [v19 combineAllFutures:v20 scheduler:v21];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __50__HMBCloudZone_Pull_Internal___syncInternalModels__block_invoke;
  v33[3] = &unk_1E69EA180;
  v33[4] = v10;
  id v34 = v8;
  id v23 = v15;
  id v35 = v23;
  id v24 = v8;
  __int16 v25 = [v22 addSuccessBlock:v33];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __50__HMBCloudZone_Pull_Internal___syncInternalModels__block_invoke_11;
  v31[3] = &unk_1E69EABF0;
  v31[4] = v10;
  id v26 = v23;
  id v32 = v26;
  id v27 = (id)[v25 addFailureBlock:v31];

  id v28 = v32;
  id v29 = v26;

  return v29;
}

void __50__HMBCloudZone_Pull_Internal___syncInternalModels__block_invoke(id *a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = a1[4];
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [a1[5] identifier];
    uint64_t v9 = [v8 shortDescription];
    *(_DWORD *)buf = 138543618;
    v52 = v7;
    __int16 v53 = 2114;
    v54 = v9;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched records for internal models", buf, 0x16u);
  }
  id v37 = [MEMORY[0x1E4F1CA48] array];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v3;
  uint64_t v33 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v48;
    char v38 = a1;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v48 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v10;
        int v11 = *(void **)(*((void *)&v47 + 1) + 8 * v10);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v41 = v11;
        uint64_t v12 = [v41 countByEnumeratingWithState:&v43 objects:v59 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v44;
          uint64_t v39 = *(void *)v44;
          do
          {
            uint64_t v15 = 0;
            uint64_t v40 = v13;
            do
            {
              if (*(void *)v44 != v14) {
                objc_enumerationMutation(v41);
              }
              id v16 = *(void **)(*((void *)&v43 + 1) + 8 * v15);
              id v17 = a1[4];
              id v42 = 0;
              id v18 = [v17 decodeModelFromRecord:v16 externalRecordFields:0 source:4 error:&v42];
              id v19 = v42;
              if (v18)
              {
                if ([a1[4] isInternalModel:v18])
                {
                  [v37 addObject:v18];
                  goto LABEL_22;
                }
                id v20 = (void *)MEMORY[0x1D944CB30]();
                id v21 = a1[4];
                id v22 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
                {
                  id v35 = HMFGetLogIdentifier();
                  uint64_t v36 = [a1[5] identifier];
                  id v27 = [v36 shortDescription];
                  id v28 = [v16 hmbDescription];
                  [v18 hmbDescription];
                  v30 = id v29 = v20;
                  *(_DWORD *)buf = 138544130;
                  v52 = v35;
                  __int16 v53 = 2114;
                  v54 = v27;
                  __int16 v55 = 2112;
                  v56 = v28;
                  __int16 v57 = 2112;
                  id v58 = v30;
                  _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_FAULT, "%{public}@[%{public}@] Queried record %@ that decoded into non-internal model: %@", buf, 0x2Au);

                  id v20 = v29;
                  a1 = v38;

                  uint64_t v13 = v40;
                  goto LABEL_20;
                }
              }
              else
              {
                id v20 = (void *)MEMORY[0x1D944CB30]();
                id v21 = a1[4];
                id v22 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
                {
                  id v23 = HMFGetLogIdentifier();
                  id v24 = [a1[5] identifier];
                  __int16 v25 = [v24 shortDescription];
                  id v26 = [v16 hmbDescription];
                  *(_DWORD *)buf = 138544130;
                  v52 = v23;
                  __int16 v53 = 2114;
                  v54 = v25;
                  __int16 v55 = 2112;
                  v56 = v26;
                  __int16 v57 = 2112;
                  id v58 = v19;
                  _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_FAULT, "%{public}@[%{public}@] Queried record %@, but failed to decode: %@", buf, 0x2Au);

                  a1 = v38;
                  uint64_t v13 = v40;

LABEL_20:
                  uint64_t v14 = v39;
                }
              }

LABEL_22:

              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v41 countByEnumeratingWithState:&v43 objects:v59 count:16];
          }
          while (v13);
        }

        uint64_t v10 = v34 + 1;
      }
      while (v34 + 1 != v33);
      uint64_t v33 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
    }
    while (v33);
  }

  [a1[4] handleUpdatedInternalModels:v37];
  [a1[6] finishWithNoResult];
}

void __50__HMBCloudZone_Pull_Internal___syncInternalModels__block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to sync internal models: %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 40) finishWithError:v3];
}

- (id)_performImmediateCloudPullWithOptions:(id)a3 useCachedServerToken:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HMBCloudZone *)self configuration];
  int v8 = [v7 shouldSkipCloudPulls];

  if (v8)
  {
    uint64_t v9 = [(HMBCloudZone *)self _syncInternalModels];
  }
  else
  {
    if (v4)
    {
      __int16 v10 = [(HMBCloudZone *)self cloudDatabase];
      id v11 = [(HMBCloudZone *)self cloudZoneID];
      uint64_t v12 = [v10 serverChangeTokenForZoneWithID:v11];
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v9 = [(HMBCloudZone *)self fetchChangesWithToken:v12 options:v6];
  }
  return v9;
}

- (id)_performCloudPullWithOptions:(id)a3 useCachedServerToken:(BOOL)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  os_unfair_lock_lock_with_options();
  int v8 = [(HMBCloudZone *)self queuedCloudPullFuture];
  if (v8)
  {
    uint64_t v9 = [v7 completionHandlerAdapter];
    id v10 = (id)[v8 addCompletionBlock:v9];

    os_unfair_lock_unlock(&self->_propertyLock);
    id v11 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v14;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_INFO, "%{public}@Coalescing cloud pull with options: %@", buf, 0x16u);
    }
  }
  else
  {
    [(HMBCloudZone *)self setQueuedCloudPullFuture:v7];
    os_unfair_lock_unlock(&self->_propertyLock);
    uint64_t v15 = (void *)MEMORY[0x1D944CB30]();
    id v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v18;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl(&dword_1D4693000, v17, OS_LOG_TYPE_INFO, "%{public}@Queueing up cloud pull with options: %@", buf, 0x16u);
    }
    id v19 = [HMBFutureOperation alloc];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __81__HMBCloudZone_Pull_Internal___performCloudPullWithOptions_useCachedServerToken___block_invoke;
    v26[3] = &unk_1E69EB068;
    v26[4] = v16;
    id v27 = v6;
    BOOL v28 = a4;
    id v20 = [(HMBFutureOperation *)v19 initWithBlock:v26];
    id v21 = [(HMBCloudZone *)v16 recordOperationQueue];
    [v21 addOperation:v20];

    id v22 = [(HMBFutureOperation *)v20 future];
    id v23 = [v7 completionHandlerAdapter];
    id v24 = (id)[v22 addCompletionBlock:v23];
  }
  return v7;
}

id __81__HMBCloudZone_Pull_Internal___performCloudPullWithOptions_useCachedServerToken___block_invoke(uint64_t a1)
{
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  [*(id *)(a1 + 32) setQueuedCloudPullFuture:0];
  os_unfair_lock_unlock(v2);
  id v3 = [*(id *)(a1 + 32) startUp];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__HMBCloudZone_Pull_Internal___performCloudPullWithOptions_useCachedServerToken___block_invoke_2;
  v7[3] = &unk_1E69EA158;
  BOOL v4 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  char v9 = *(unsigned char *)(a1 + 48);
  id v5 = [v3 flatMap:v7];

  return v5;
}

uint64_t __81__HMBCloudZone_Pull_Internal___performCloudPullWithOptions_useCachedServerToken___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performImmediateCloudPullWithOptions:*(void *)(a1 + 40) useCachedServerToken:*(unsigned __int8 *)(a1 + 48)];
}

- (id)performStartupCloudPullWithOptions:(id)a3
{
  return [(HMBCloudZone *)self _performImmediateCloudPullWithOptions:a3 useCachedServerToken:1];
}

- (id)performFullCloudPullWithOptions:(id)a3
{
  return [(HMBCloudZone *)self _performCloudPullWithOptions:a3 useCachedServerToken:0];
}

- (id)performCloudPullWithOptions:(id)a3
{
  return [(HMBCloudZone *)self _performCloudPullWithOptions:a3 useCachedServerToken:1];
}

- (BOOL)hasPerformedInitialFetch
{
  id v3 = [(HMBCloudZone *)self cloudDatabase];
  BOOL v4 = [(HMBCloudZone *)self cloudZoneID];
  id v5 = [v3 serverChangeTokenForZoneWithID:v4];
  BOOL v6 = v5 != 0;

  return v6;
}

- (id)unregisterSubscriptionForExternalRecordType:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944CB30]();
  BOOL v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Unregistering subscription for external record type %@", buf, 0x16u);
  }
  char v9 = [(HMBCloudZone *)v6 startUp];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__HMBCloudZone_Subscription__unregisterSubscriptionForExternalRecordType___block_invoke;
  v13[3] = &unk_1E69EBD00;
  v13[4] = v6;
  id v14 = v4;
  id v10 = v4;
  id v11 = [v9 flatMap:v13];

  return v11;
}

id __74__HMBCloudZone_Subscription__unregisterSubscriptionForExternalRecordType___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cloudDatabase];
  id v3 = [*(id *)(a1 + 32) cloudZoneID];
  id v4 = [v2 subscriptionIDForZoneID:v3 recordType:*(void *)(a1 + 40)];

  id v5 = objc_alloc(MEMORY[0x1E4F1A340]);
  BOOL v6 = [*(id *)(a1 + 32) cloudZoneID];
  id v7 = [v6 zoneID];
  id v8 = (void *)[v5 initWithZoneID:v7 subscriptionID:v4];

  [v8 setRecordType:*(void *)(a1 + 40)];
  char v9 = [*(id *)(a1 + 32) cloudZoneID];
  id v10 = [v2 unregisterSubscription:v8 forZoneWithID:v9];

  return v10;
}

- (id)registerSubscriptionForExternalRecordType:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D944CB30]();
  BOOL v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering subscription for external record type %@", buf, 0x16u);
  }
  char v9 = [(HMBCloudZone *)v6 startUp];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__HMBCloudZone_Subscription__registerSubscriptionForExternalRecordType___block_invoke;
  v13[3] = &unk_1E69EBD00;
  v13[4] = v6;
  id v14 = v4;
  id v10 = v4;
  id v11 = [v9 flatMap:v13];

  return v11;
}

id __72__HMBCloudZone_Subscription__registerSubscriptionForExternalRecordType___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cloudDatabase];
  id v3 = [*(id *)(a1 + 32) cloudZoneID];
  id v4 = [v2 subscriptionIDForZoneID:v3 recordType:*(void *)(a1 + 40)];

  id v5 = objc_alloc(MEMORY[0x1E4F1A340]);
  BOOL v6 = [*(id *)(a1 + 32) cloudZoneID];
  id v7 = [v6 zoneID];
  id v8 = (void *)[v5 initWithZoneID:v7 subscriptionID:v4];

  [v8 setRecordType:*(void *)(a1 + 40)];
  char v9 = [*(id *)(a1 + 32) cloudZoneID];
  id v10 = [v2 registerSubscription:v8 forZoneWithID:v9];

  return v10;
}

- (NSSet)subscriptions
{
  id v3 = [(HMBCloudZone *)self cloudDatabase];
  id v4 = [(HMBCloudZone *)self cloudZoneID];
  id v5 = [v3 subscriptionsForZoneWithID:v4];

  return (NSSet *)v5;
}

- (id)fetchCompleteModelsForRecordIDs:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  id v5 = v4;
  if ([v4 count])
  {
    BOOL v6 = (void *)[v5 mutableCopy];
    id v7 = [(HMBCloudZone *)self fetchRecordsWithRecordIDs:v5];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__HMBCloudZone_Fetch_Internal__fetchCompleteModelsForRecordIDs___block_invoke;
    v16[3] = &unk_1E69EA8E0;
    v16[4] = self;
    id v17 = v6;
    id v8 = v6;
    char v9 = [v7 flatMap:v16];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D944CB30]();
    id v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v13;
      _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Asked to fetch an empty set of record IDs", buf, 0xCu);
    }
    id v14 = (void *)MEMORY[0x1E4F7A0D8];
    id v7 = [MEMORY[0x1E4F1CAD0] set];
    char v9 = [v14 futureWithResult:v7];
  }

  return v9;
}

id __64__HMBCloudZone_Fetch_Internal__fetchCompleteModelsForRecordIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v47 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v2, "count"));
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v60 objects:v71 count:16];
  id obj = v3;
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v61;
    while (2)
    {
      uint64_t v8 = 0;
      char v9 = v6;
      do
      {
        if (*(void *)v61 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v60 + 1) + 8 * v8);
        id v11 = *(void **)(a1 + 32);
        id v59 = v9;
        uint64_t v12 = [v11 decodeModelFromRecord:v10 externalRecordFields:0 source:4 error:&v59];
        id v6 = v59;

        if (!v12)
        {
          uint64_t v15 = (void *)MEMORY[0x1D944CB30]();
          id v16 = *(id *)(a1 + 32);
          id v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            id v18 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v66 = v18;
            __int16 v67 = 2112;
            v68 = v10;
            __int16 v69 = 2112;
            id v70 = v6;
            _os_log_impl(&dword_1D4693000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode complete model for record %@: %@", buf, 0x20u);
          }
          uint64_t v19 = [MEMORY[0x1E4F7A0D8] futureWithError:v6];
          uint64_t v20 = obj;
          id v21 = v47;
          id v22 = obj;
          goto LABEL_35;
        }
        uint64_t v13 = *(void **)(a1 + 40);
        id v14 = [v10 recordID];
        [v13 removeObject:v14];

        [v47 addObject:v12];
        ++v8;
        char v9 = v6;
      }
      while (v5 != v8);
      id v3 = obj;
      uint64_t v5 = [obj countByEnumeratingWithState:&v60 objects:v71 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v6 = 0;
  }

  uint64_t v23 = a1;
  id v24 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v51 = [*(id *)(a1 + 32) localZone];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v50 = *(id *)(a1 + 40);
  uint64_t v25 = [v50 countByEnumeratingWithState:&v55 objects:v64 count:16];
  long long v49 = v24;
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v52 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v56 != v52) {
          objc_enumerationMutation(v50);
        }
        BOOL v28 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        id v54 = v6;
        id v29 = [v28 externalID:&v54];
        id v30 = v54;

        if (v29)
        {
          id v53 = v30;
          __int16 v31 = [v51 modelIDForExternalID:v29 error:&v53];
          id v6 = v53;

          if (v31)
          {
            [v24 addObject:v31];
          }
          else
          {
            id v37 = (void *)MEMORY[0x1D944CB30]();
            id v38 = *(id *)(v23 + 32);
            uint64_t v39 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              uint64_t v40 = HMFGetLogIdentifier();
              id v41 = [v29 hmbDescription];
              *(_DWORD *)buf = 138543874;
              v66 = v40;
              __int16 v67 = 2112;
              v68 = v41;
              __int16 v69 = 2112;
              id v70 = v6;
              _os_log_impl(&dword_1D4693000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch modelID for externalID %@: %@", buf, 0x20u);

              uint64_t v23 = a1;
              id v24 = v49;
            }
          }
        }
        else
        {
          id v32 = (void *)MEMORY[0x1D944CB30]();
          id v33 = *(id *)(v23 + 32);
          uint64_t v34 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            id v35 = HMFGetLogIdentifier();
            uint64_t v36 = [v28 hmbDescription];
            *(_DWORD *)buf = 138543874;
            v66 = v35;
            __int16 v67 = 2112;
            v68 = v36;
            __int16 v69 = 2112;
            id v70 = v30;
            _os_log_impl(&dword_1D4693000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to encode externalID from recordID %@: %@", buf, 0x20u);

            id v24 = v49;
          }

          id v6 = v30;
        }
      }
      uint64_t v26 = [v50 countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v26);
  }
  id v42 = v6;

  id v21 = v47;
  long long v43 = [v47 allObjects];
  long long v44 = [v24 allObjects];
  id v6 = [v51 update:v43 remove:v44];

  if (v6) {
    [MEMORY[0x1E4F7A0D8] futureWithError:v6];
  }
  else {
  uint64_t v19 = [MEMORY[0x1E4F7A0D8] futureWithResult:v47];
  }
  uint64_t v20 = obj;

  id v22 = v49;
LABEL_35:

  return v19;
}

- (id)fetchCompleteModelForRecordID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    uint64_t v7 = [(HMBCloudZone *)self fetchCompleteModelsForRecordIDs:v6];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__HMBCloudZone_Fetch_Internal__fetchCompleteModelForRecordID___block_invoke;
    v12[3] = &unk_1E69EA8B8;
    v12[4] = self;
    uint64_t v8 = [v7 flatMap:v12];

    return v8;
  }
  else
  {
    uint64_t v10 = _HMFPreconditionFailure();
    return __62__HMBCloudZone_Fetch_Internal__fetchCompleteModelForRecordID___block_invoke(v10, v11);
  }
}

id __62__HMBCloudZone_Fetch_Internal__fetchCompleteModelForRecordID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 anyObject];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D944CB30]();
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      char v9 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v9;
      _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_ERROR, "%{public}@Successfully fetched complete models for record ID but no models were returned", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F7A0D8];
    id v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    uint64_t v5 = [v10 futureWithError:v11];
  }
  return v5;
}

- (id)fetchRecordWithRecordID:(id)a3 canRetry:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  id v7 = [(HMBCloudZone *)self _fetchRecordsWithRecordIDs:v6 canRetry:v4];
  uint64_t v8 = [v7 flatMap:&__block_literal_global_11];

  return v8;
}

id __65__HMBCloudZone_Fetch_Internal__fetchRecordWithRecordID_canRetry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 allValues];
  id v3 = [v2 firstObject];

  BOOL v4 = (void *)MEMORY[0x1E4F7A0D8];
  if (v3)
  {
    uint64_t v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    uint64_t v5 = [v4 futureWithError:v6];
  }
  return v5;
}

- (id)fetchRecordsWithRecordIDs:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [HMBCloudZoneFetchRecordsContext alloc];
  id v6 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  id v7 = [(HMBCloudZoneFetchRecordsContext *)v5 initWithRecordIDs:v4 future:v6];

  os_unfair_lock_lock_with_options();
  uint64_t v8 = [(HMBCloudZone *)self queuedFetchRecordsContexts];
  char v9 = v8;
  if (v8)
  {
    [v8 addObject:v7];
    os_unfair_lock_unlock(&self->_propertyLock);
    uint64_t v10 = (void *)MEMORY[0x1D944CB30]();
    id v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      id v14 = [v4 hmbDescription];
      int v19 = 138543618;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v14;
      _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_INFO, "%{public}@Queueing fetch for records with record IDs: %@", (uint8_t *)&v19, 0x16u);
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
    [(HMBCloudZone *)self setQueuedFetchRecordsContexts:v15];

    os_unfair_lock_unlock(&self->_propertyLock);
    id v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
    [(HMBCloudZone *)self _fetchRecordsForContexts:v16];
  }
  id v17 = [(HMBCloudZoneFetchRecordsContext *)v7 future];

  return v17;
}

- (void)_fetchRecordsForContexts:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "na_flatMap:", &__block_literal_global_5093);
  id v6 = (void *)MEMORY[0x1D944CB30]();
  id v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    char v9 = HMFGetLogIdentifier();
    uint64_t v10 = [v5 hmbDescription];
    *(_DWORD *)buf = 138543618;
    id v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_INFO, "%{public}@Performing fetch for records with record IDs: %@", buf, 0x16u);
  }
  id v11 = [(HMBCloudZone *)v7 _fetchRecordsWithRecordIDs:v5 canRetry:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__HMBCloudZone_Fetch_Internal___fetchRecordsForContexts___block_invoke_3;
  v14[3] = &unk_1E69EA870;
  id v15 = v4;
  id v16 = v7;
  id v12 = v4;
  id v13 = (id)[v11 addCompletionBlock:v14];
}

void __57__HMBCloudZone_Fetch_Internal___fetchRecordsForContexts___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v17 = a1;
  id v18 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        if (v5)
        {
          id v11 = [*(id *)(*((void *)&v21 + 1) + 8 * v9) recordIDs];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __57__HMBCloudZone_Fetch_Internal___fetchRecordsForContexts___block_invoke_2;
          v19[3] = &unk_1E69EA848;
          id v20 = v5;
          id v12 = objc_msgSend(v11, "na_map:", v19);

          id v13 = [v10 future];
          [v13 finishWithResult:v12];

          id v14 = v20;
        }
        else
        {
          id v14 = [*(id *)(*((void *)&v21 + 1) + 8 * v9) future];
          [v14 finishWithError:v18];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  id v15 = (os_unfair_lock_s *)(*(void *)(v17 + 40) + 8);
  os_unfair_lock_lock_with_options();
  id v16 = [*(id *)(v17 + 40) queuedFetchRecordsContexts];
  [*(id *)(v17 + 40) setQueuedFetchRecordsContexts:0];
  os_unfair_lock_unlock(v15);
  if ([v16 count]) {
    [*(id *)(v17 + 40) _fetchRecordsForContexts:v16];
  }
}

uint64_t __57__HMBCloudZone_Fetch_Internal___fetchRecordsForContexts___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

uint64_t __57__HMBCloudZone_Fetch_Internal___fetchRecordsForContexts___block_invoke(uint64_t a1, void *a2)
{
  return [a2 recordIDs];
}

- (id)_fetchRecordsWithRecordIDs:(id)a3 canRetry:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F7A0D8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__HMBCloudZone_Fetch_Internal___fetchRecordsWithRecordIDs_canRetry___block_invoke;
  v13[3] = &unk_1E69EA800;
  v13[4] = self;
  id v14 = v6;
  BOOL v15 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F7A0F0];
  id v9 = v6;
  uint64_t v10 = [v8 globalAsyncScheduler];
  id v11 = [v7 futureWithBlock:v13 scheduler:v10];

  return v11;
}

void __68__HMBCloudZone_Fetch_Internal___fetchRecordsWithRecordIDs_canRetry___block_invoke(uint64_t a1, void *a2)
{
}

- (id)fetchCompleteModelsWithIDs:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1D944CB30]();
  uint64_t v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    uint64_t v10 = [v5 hmbDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v34 = v9;
    __int16 v35 = 2112;
    uint64_t v36 = (uint64_t)v10;
    _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_INFO, "%{public}@Fetching complete models with IDs: %@", buf, 0x16u);
  }
  id v11 = [(HMBCloudZone *)v7 localZone];
  id v12 = [v5 allObjects];
  id v32 = 0;
  id v13 = [v11 fetchExternalIDsForModelIDs:v12 error:&v32];
  id v14 = v32;

  if (v13)
  {
    uint64_t v15 = [v13 count];
    if (v15 == [v5 count])
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __50__HMBCloudZone_Fetch__fetchCompleteModelsWithIDs___block_invoke;
      v31[3] = &unk_1E69EA928;
      v31[4] = v7;
      id v16 = objc_msgSend(v13, "na_map:", v31);
      uint64_t v17 = [(HMBCloudZone *)v7 fetchCompleteModelsForRecordIDs:v16];
    }
    else
    {
      long long v23 = (void *)MEMORY[0x1D944CB30]();
      long long v24 = v7;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        uint64_t v27 = [v13 count];
        uint64_t v28 = [v5 count];
        *(_DWORD *)buf = 138543874;
        uint64_t v34 = v26;
        __int16 v35 = 2048;
        uint64_t v36 = v27;
        __int16 v37 = 2048;
        uint64_t v38 = v28;
        _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_ERROR, "%{public}@Fetched %lu external IDs but requested %lu model IDs", buf, 0x20u);
      }
      id v29 = (void *)MEMORY[0x1E4F7A0D8];
      id v16 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
      uint64_t v17 = [v29 futureWithError:v16];
    }
    long long v22 = (void *)v17;
  }
  else
  {
    id v18 = (void *)MEMORY[0x1D944CB30]();
    __int16 v19 = v7;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      long long v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v34 = v21;
      __int16 v35 = 2112;
      uint64_t v36 = (uint64_t)v5;
      __int16 v37 = 2112;
      uint64_t v38 = (uint64_t)v14;
      _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch external IDs for model IDs %@: %@", buf, 0x20u);
    }
    long long v22 = [MEMORY[0x1E4F7A0D8] futureWithError:v14];
  }

  return v22;
}

id __50__HMBCloudZone_Fetch__fetchCompleteModelsWithIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v12 = 0;
  id v4 = [MEMORY[0x1E4F1A2F8] recordIDFromExternalID:v3 error:&v12];
  id v5 = v12;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1D944CB30]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v14 = v10;
      __int16 v15 = 2112;
      id v16 = v3;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode record ID from data %@: %@", buf, 0x20u);
    }
  }

  return v4;
}

- (id)fetchCompleteModelWithID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    uint64_t v7 = [(HMBCloudZone *)self fetchCompleteModelsWithIDs:v6];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__HMBCloudZone_Fetch__fetchCompleteModelWithID___block_invoke;
    v12[3] = &unk_1E69EA8B8;
    v12[4] = self;
    id v8 = [v7 flatMap:v12];

    return v8;
  }
  else
  {
    uint64_t v10 = _HMFPreconditionFailure();
    return __48__HMBCloudZone_Fetch__fetchCompleteModelWithID___block_invoke(v10, v11);
  }
}

id __48__HMBCloudZone_Fetch__fetchCompleteModelWithID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 anyObject];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D944CB30]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v9;
      _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_ERROR, "%{public}@Successfully fetched complete model IDs but no models were returned", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F7A0D8];
    id v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    id v5 = [v10 futureWithError:v11];
  }
  return v5;
}

- (id)fetchCompleteModels:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_msgSend(v4, "na_map:", &__block_literal_global_33);
    id v7 = [(HMBCloudZone *)self fetchCompleteModelsWithIDs:v6];

    return v7;
  }
  else
  {
    uint64_t v9 = _HMFPreconditionFailure();
    return (id)__43__HMBCloudZone_Fetch__fetchCompleteModels___block_invoke(v9);
  }
}

uint64_t __43__HMBCloudZone_Fetch__fetchCompleteModels___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hmbModelID];
}

- (id)fetchCompleteModel:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = [v4 hmbModelID];
    id v7 = [(HMBCloudZone *)self fetchCompleteModelWithID:v6];

    return v7;
  }
  else
  {
    uint64_t v9 = (HMBLocalZoneQueryResultRecordIDSequence *)_HMFPreconditionFailure();
    [(HMBLocalZoneQueryResultRecordIDSequence *)v9 .cxx_destruct];
  }
  return result;
}

- (id)queryRecordsWithType:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = self;
  id v13 = v4;
  id v6 = (void *)MEMORY[0x1E4F7A0F0];
  id v7 = v4;
  id v8 = objc_msgSend(v6, "globalAsyncScheduler", v11, 3221225472, __44__HMBCloudZone_Query__queryRecordsWithType___block_invoke, &unk_1E69EB2A8, v12);
  uint64_t v9 = [v5 futureWithBlock:&v11 scheduler:v8];

  return v9;
}

void __44__HMBCloudZone_Query__queryRecordsWithType___block_invoke(uint64_t a1, void *a2)
{
}

- (id)_triggerOutputForOutputRow:(unint64_t)a3 options:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  id v7 = [(HMBCloudZone *)self inProgressPushFuturesByOutputBlockRow];
  id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    os_unfair_lock_unlock(&self->_propertyLock);
    SEL v10 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v13;
      __int16 v28 = 2048;
      unint64_t v29 = a3;
      _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring push request for block row %lu. Appears to be in-progress.", buf, 0x16u);
    }
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    id v14 = [(HMBCloudZone *)self inProgressPushFuturesByOutputBlockRow];
    uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    [v14 setObject:v9 forKeyedSubscript:v15];

    os_unfair_lock_unlock(&self->_propertyLock);
    id v16 = [HMBFutureOperation alloc];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __57__HMBCloudZone_Push___triggerOutputForOutputRow_options___block_invoke;
    v23[3] = &unk_1E69EABC8;
    v23[4] = self;
    unint64_t v25 = a3;
    id v24 = v6;
    __int16 v17 = [(HMBFutureOperation *)v16 initWithBlock:v23];
    id v18 = [(HMBCloudZone *)self recordOperationQueue];
    [v18 addOperation:v17];

    uint64_t v19 = [(HMBFutureOperation *)v17 future];
    id v20 = [v9 completionHandlerAdapter];
    id v21 = (id)[v19 addCompletionBlock:v20];
  }
  return v9;
}

id __57__HMBCloudZone_Push___triggerOutputForOutputRow_options___block_invoke(uint64_t a1)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F7A0E8]);
  id v3 = *(void **)(a1 + 32);
  uint64_t v6 = a1 + 40;
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(v6 + 8);
  id v7 = v3;
  id v8 = v4;
  id v9 = v2;
  SEL v10 = [v9 future];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = ____performCloudPush_block_invoke;
  v64[3] = &unk_1E69EAC68;
  id v11 = v7;
  id v65 = v11;
  uint64_t v66 = v5;
  id v12 = (id)[v10 addCompletionBlock:v64];

  id v13 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v14 = [NSString stringWithUTF8String:"__performCloudPush"];
  uint64_t v15 = (void *)[v13 initWithName:v14];

  id v16 = [v11 localZone];
  __int16 v17 = v16;
  if (v16)
  {
    long long v61 = v15;
    if (v8)
    {
      id v18 = 0;
      goto LABEL_8;
    }
    id v63 = 0;
    id v8 = [v16 fetchOptionsForOutputBlock:v5 error:&v63];
    id v18 = v63;
    if (v8)
    {
LABEL_8:
      uint64_t v26 = v18;
      id v62 = v18;
      uint64_t v27 = [v17 fetchRecordsForOutputBlock:v5 error:&v62];
      id v18 = v62;

      if (v27)
      {
        uint64_t v28 = [v27 count];
        context = (void *)MEMORY[0x1D944CB30]();
        id v29 = v11;
        uint64_t v30 = HMFGetOSLogHandle();
        BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
        if (v28)
        {
          if (v31)
          {
            id v32 = HMFGetLogIdentifier();
            long long v55 = [v61 identifier];
            [v55 shortDescription];
            id v33 = v52 = v17;
            uint64_t v34 = [v27 count];
            *(_DWORD *)buf = 138544386;
            v68 = v32;
            __int16 v69 = 2114;
            uint64_t v70 = (uint64_t)v33;
            __int16 v71 = 2048;
            uint64_t v72 = v5;
            __int16 v73 = 2112;
            id v74 = v8;
            __int16 v75 = 2048;
            uint64_t v76 = v34;
            _os_log_impl(&dword_1D4693000, v30, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Starting cloud push for output block row: %lu options: %@ tuples count: %lu", buf, 0x34u);

            __int16 v17 = v52;
          }

          __int16 v35 = v29;
          uint64_t v15 = v61;
          [v35 pushGroupWithBlockRow:v5 tuples:v27 options:v8 activity:v61 completionPromise:v9];
          goto LABEL_20;
        }
        if (v31)
        {
          id v54 = HMFGetLogIdentifier();
          long long v56 = [v61 identifier];
          uint64_t v41 = [v56 shortDescription];
          *(_DWORD *)buf = 138543874;
          v68 = v54;
          __int16 v69 = 2114;
          uint64_t v70 = v41;
          id v42 = (void *)v41;
          __int16 v71 = 2048;
          uint64_t v72 = v5;
          _os_log_impl(&dword_1D4693000, v30, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Skipping cloud push for output block row %lu because no tuples were found", buf, 0x20u);
        }
        [v17 removeOutputBlockWithRow:v5 error:0];
        long long v43 = objc_alloc_init(HMBCloudZonePushResult);
        [v9 finishWithResult:v43];
      }
      else
      {
        uint64_t v36 = (void *)MEMORY[0x1D944CB30]();
        id v37 = v11;
        uint64_t v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          uint64_t v39 = HMFGetLogIdentifier();
          id v53 = [v61 identifier];
          [v53 shortDescription];
          uint64_t v40 = contextb = v36;
          *(_DWORD *)buf = 138544130;
          v68 = v39;
          __int16 v69 = 2114;
          uint64_t v70 = (uint64_t)v40;
          __int16 v71 = 2048;
          uint64_t v72 = v5;
          __int16 v73 = 2112;
          id v74 = v18;
          _os_log_impl(&dword_1D4693000, v38, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to fetch tuples for output block row %lu: %@", buf, 0x2Au);

          uint64_t v36 = contextb;
          uint64_t v27 = 0;
        }

        [v17 removeOutputBlockWithRow:v5 error:0];
        [v9 finishWithError:v18];
      }
      uint64_t v15 = v61;
LABEL_20:

      goto LABEL_21;
    }
    long long v46 = (void *)MEMORY[0x1D944CB30]();
    id v47 = v11;
    long long v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      long long v49 = contextc = v46;
      id v50 = [v15 identifier];
      v51 = [v50 shortDescription];
      *(_DWORD *)buf = 138544130;
      v68 = v49;
      __int16 v69 = 2114;
      uint64_t v70 = (uint64_t)v51;
      __int16 v71 = 2048;
      uint64_t v72 = v5;
      __int16 v73 = 2112;
      id v74 = v18;
      _os_log_impl(&dword_1D4693000, v48, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to fetch options for output block row %lu: %@", buf, 0x2Au);

      uint64_t v15 = v61;
      long long v46 = contextc;
    }

    [v17 removeOutputBlockWithRow:v5 error:0];
    if (!v18)
    {
      id v18 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    }
    [v9 finishWithError:v18];
    id v8 = 0;
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1D944CB30]();
    id v20 = v11;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      long long v22 = HMFGetLogIdentifier();
      [v15 identifier];
      contexta = v8;
      v24 = long long v23 = v15;
      unint64_t v25 = [v24 shortDescription];
      *(_DWORD *)buf = 138543618;
      v68 = v22;
      __int16 v69 = 2114;
      uint64_t v70 = (uint64_t)v25;
      _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] No local zone available to perform cloud push", buf, 0x16u);

      uint64_t v15 = v23;
      id v8 = contexta;
    }
    id v18 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    [v9 finishWithError:v18];
  }
LABEL_21:

  long long v44 = [v9 future];

  return v44;
}

- (void)pushGroupWithBlockRow:(unint64_t)a3 tuples:(id)a4 options:(id)a5 activity:(id)a6 completionPromise:(id)a7
{
  uint64_t v161 = *MEMORY[0x1E4F143B8];
  id v106 = a4;
  id v104 = a5;
  id v111 = a6;
  id v107 = a7;
  unint64_t v110 = [MEMORY[0x1E4F1CA60] dictionary];
  id v109 = [MEMORY[0x1E4F1CA48] array];
  __int16 v103 = [MEMORY[0x1E4F1CA48] array];
  v114 = [MEMORY[0x1E4F1CA60] dictionary];
  id v108 = [(HMBCloudZone *)self modelContainer];
  if (v108)
  {
    uint64_t v121 = [[HMBCloudZoneEncodingContext alloc] initWithModelContainer:v108];
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    id v10 = v106;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v147 objects:v160 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v148;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v148 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = [*(id *)(*((void *)&v147 + 1) + 8 * i) model];
          if (v14)
          {
            uint64_t v15 = [(HMBCloudZone *)self recordIDForModel:v14];
            id v16 = [(HMBCloudZoneEncodingContext *)v121 createdRecords];
            __int16 v17 = [v14 hmbModelID];
            [v16 setObject:v15 forKeyedSubscript:v17];
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v147 objects:v160 count:16];
      }
      while (v11);
    }

    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    id obj = v10;
    uint64_t v120 = [obj countByEnumeratingWithState:&v143 objects:v159 count:16];
    if (!v120)
    {
      id v18 = 0;
      goto LABEL_59;
    }
    id v18 = 0;
    uint64_t v119 = *(void *)v144;
    while (1)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v144 != v119) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v143 + 1) + 8 * v19);
        v123 = (void *)MEMORY[0x1D944CB30]();
        v126 = [v20 model];
        if (v126)
        {
          id v21 = [v20 externalData];
          if (!v21)
          {
            id v24 = 0;
LABEL_24:
            id v140 = v18;
            uint64_t v118 = v24;
            v124 = -[HMBCloudZone encodeRecordFromModel:existingRecord:encodingContext:error:](self, "encodeRecordFromModel:existingRecord:encodingContext:error:", v126);
            id v26 = v140;

            if (v124)
            {
              uint64_t v27 = [v20 externalID];
              uint64_t v28 = (void *)v27;
              if (v27)
              {
                id v117 = v26;
                goto LABEL_38;
              }
              id v139 = v26;
              uint64_t v28 = [v124 externalID:&v139];
              id v117 = v139;

              if (v28)
              {
                uint64_t v27 = [v20 setExternalID:v28];
LABEL_38:
                context = (void *)MEMORY[0x1D944CB30](v27);
                long long v46 = self;
                id v47 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                {
                  int v112 = HMFGetLogIdentifier();
                  v113 = [v111 identifier];
                  long long v48 = [v113 shortDescription];
                  long long v49 = [v20 model];
                  id v50 = [v49 hmbDescription];
                  v51 = [v124 hmbDescription];
                  *(_DWORD *)buf = 138544130;
                  v152 = v112;
                  __int16 v153 = 2114;
                  unint64_t v154 = (unint64_t)v48;
                  __int16 v155 = 2112;
                  unint64_t v156 = (unint64_t)v50;
                  __int16 v157 = 2112;
                  id v158 = v51;
                  _os_log_impl(&dword_1D4693000, v47, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Preparing to update: %@ / %@", buf, 0x2Au);
                }
                uint64_t v52 = [v124 recordID];
                [v110 setObject:v124 forKey:v52];

                id v53 = [v124 recordID];
                [v114 setObject:v20 forKey:v53];
              }
              else
              {
                long long v60 = (void *)MEMORY[0x1D944CB30]();
                long long v61 = self;
                id v62 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                {
                  id v63 = HMFGetLogIdentifier();
                  v64 = [v111 identifier];
                  id v65 = [v64 shortDescription];
                  *(_DWORD *)buf = 138543874;
                  v152 = v63;
                  __int16 v153 = 2114;
                  unint64_t v154 = (unint64_t)v65;
                  __int16 v155 = 2112;
                  unint64_t v156 = (unint64_t)v117;
                  _os_log_impl(&dword_1D4693000, v62, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to encode recordID for update: %@", buf, 0x20u);
                }
              }
              id v26 = v117;
            }
            else
            {
              id v29 = (void *)MEMORY[0x1D944CB30]();
              uint64_t v30 = self;
              BOOL v31 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                id v32 = HMFGetLogIdentifier();
                id v33 = [v111 identifier];
                uint64_t v34 = [v33 shortDescription];
                *(_DWORD *)buf = 138543874;
                v152 = v32;
                __int16 v153 = 2114;
                unint64_t v154 = (unint64_t)v34;
                __int16 v155 = 2112;
                unint64_t v156 = (unint64_t)v26;
                _os_log_impl(&dword_1D4693000, v31, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to encode record for update: %@", buf, 0x20u);
              }
            }

LABEL_47:
            id v18 = v26;
            goto LABEL_48;
          }
          id v141 = v18;
          uint64_t v22 = [MEMORY[0x1E4F1A2D8] recordFromExternalData:v21 error:&v141];
          id v23 = v141;

          if (v22)
          {
            id v24 = (void *)v22;
            id v18 = v23;
            goto LABEL_24;
          }
          __int16 v35 = (void *)MEMORY[0x1D944CB30]();
          uint64_t v36 = self;
          id v37 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            uint64_t v38 = HMFGetLogIdentifier();
            uint64_t v39 = [v21 hmbDescription];
            *(_DWORD *)buf = 138543874;
            v152 = v38;
            __int16 v153 = 2112;
            unint64_t v154 = (unint64_t)v39;
            __int16 v155 = 2112;
            unint64_t v156 = (unint64_t)v23;
            _os_log_impl(&dword_1D4693000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode record from external data %@: %@", buf, 0x20u);
          }
          id v18 = v23;
        }
        else
        {
          id v21 = [v20 externalID];
          if (v21)
          {
            id v142 = v18;
            unint64_t v25 = [MEMORY[0x1E4F1A2F8] recordIDFromExternalID:v21 error:&v142];
            id v26 = v142;

            if (v25)
            {
              [v109 addObject:v25];
              [v114 setObject:v20 forKey:v25];
            }
            else
            {
              id v54 = (void *)MEMORY[0x1D944CB30]();
              long long v55 = self;
              long long v56 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              {
                v125 = HMFGetLogIdentifier();
                long long v57 = [v111 identifier];
                long long v58 = [v57 shortDescription];
                id v59 = [v20 externalID];
                *(_DWORD *)buf = 138544130;
                v152 = v125;
                __int16 v153 = 2114;
                unint64_t v154 = (unint64_t)v58;
                __int16 v155 = 2112;
                unint64_t v156 = (unint64_t)v59;
                __int16 v157 = 2112;
                id v158 = v26;
                _os_log_impl(&dword_1D4693000, v56, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to decode encoded record ID %@: %@", buf, 0x2Au);
              }
            }

            goto LABEL_47;
          }
          uint64_t v40 = (void *)MEMORY[0x1D944CB30]();
          uint64_t v41 = self;
          id v42 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
          {
            long long v43 = HMFGetLogIdentifier();
            long long v44 = [v111 identifier];
            long long v45 = [v44 shortDescription];
            *(_DWORD *)buf = 138543618;
            v152 = v43;
            __int16 v153 = 2114;
            unint64_t v154 = (unint64_t)v45;
            _os_log_impl(&dword_1D4693000, v42, OS_LOG_TYPE_FAULT, "%{public}@[%{public}@] Deletion was staged for record without an external ID", buf, 0x16u);
          }
          id v21 = 0;
        }
LABEL_48:

        ++v19;
      }
      while (v120 != v19);
      uint64_t v66 = [obj countByEnumeratingWithState:&v143 objects:v159 count:16];
      uint64_t v120 = v66;
      if (!v66)
      {
LABEL_59:

        __int16 v71 = [(HMBCloudZone *)self localZone];
        if (v18)
        {
          uint64_t v72 = (void *)MEMORY[0x1D944CB30]();
          __int16 v73 = self;
          id v74 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            __int16 v75 = HMFGetLogIdentifier();
            uint64_t v76 = [v111 identifier];
            uint64_t v77 = [v76 shortDescription];
            *(_DWORD *)buf = 138544130;
            v152 = v75;
            __int16 v153 = 2114;
            unint64_t v154 = (unint64_t)v77;
            __int16 v155 = 2048;
            unint64_t v156 = a3;
            __int16 v157 = 2112;
            id v158 = v18;
            _os_log_impl(&dword_1D4693000, v74, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Aborting block %lu due to encoding error: %@.", buf, 0x2Au);
          }
          id v78 = [v71 markGroupAsSentWithOutputBlock:a3 tuples:obj];
          if (v78)
          {
            id v79 = (void *)MEMORY[0x1D944CB30]();
            uint64_t v80 = v73;
            id v81 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
            {
              v82 = HMFGetLogIdentifier();
              v83 = [v111 identifier];
              id v84 = [v83 shortDescription];
              *(_DWORD *)buf = 138544130;
              v152 = v82;
              __int16 v153 = 2114;
              unint64_t v154 = (unint64_t)v84;
              __int16 v155 = 2048;
              unint64_t v156 = a3;
              __int16 v157 = 2112;
              id v158 = v78;
              _os_log_impl(&dword_1D4693000, v81, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Abort update for block %lu failed with error: %@", buf, 0x2Au);
            }
          }
          [v107 finishWithError:v18];
        }
        else if ([v110 count] || objc_msgSend(v109, "count"))
        {
          id v78 = objc_alloc_init(MEMORY[0x1E4F7A0E8]);
          __pushWithRecovery(self, a3, v114, v110, v109, v104, v78);
          objc_initWeak((id *)buf, self);
          id v85 = [v78 future];
          v135[0] = MEMORY[0x1E4F143A8];
          v135[1] = 3221225472;
          v135[2] = __86__HMBCloudZone_Push__pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke;
          v135[3] = &unk_1E69EAB28;
          objc_copyWeak(v138, (id *)buf);
          id v86 = v111;
          id v136 = v86;
          v138[1] = (id)a3;
          id v87 = v107;
          id v137 = v87;
          id v88 = (id)[v85 addFailureBlock:v135];

          id v89 = [v78 future];
          v127[0] = MEMORY[0x1E4F143A8];
          v127[1] = 3221225472;
          v127[2] = __86__HMBCloudZone_Push__pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke_11;
          v127[3] = &unk_1E69EABA0;
          objc_copyWeak(v134, (id *)buf);
          id v128 = v86;
          id v129 = v114;
          id v130 = v103;
          id v131 = v71;
          v134[1] = (id)a3;
          id v132 = v104;
          id v133 = v87;
          id v90 = (id)[v89 addSuccessBlock:v127];

          objc_destroyWeak(v134);
          objc_destroyWeak(v138);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          id v91 = (void *)MEMORY[0x1D944CB30]();
          id v92 = self;
          id v93 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            long long v94 = HMFGetLogIdentifier();
            long long v95 = [v111 identifier];
            long long v96 = [v95 shortDescription];
            *(_DWORD *)buf = 138543618;
            v152 = v94;
            __int16 v153 = 2114;
            unint64_t v154 = (unint64_t)v96;
            _os_log_impl(&dword_1D4693000, v93, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] No valid records to push; aborting",
              buf,
              0x16u);
          }
          id v78 = [v71 markGroupAsSentWithOutputBlock:a3 tuples:obj];
          if (v78)
          {
            long long v97 = (void *)MEMORY[0x1D944CB30]();
            id v98 = v92;
            v99 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
            {
              unint64_t v100 = HMFGetLogIdentifier();
              __int16 v101 = [v111 identifier];
              id v102 = [v101 shortDescription];
              *(_DWORD *)buf = 138544130;
              v152 = v100;
              __int16 v153 = 2114;
              unint64_t v154 = (unint64_t)v102;
              __int16 v155 = 2048;
              unint64_t v156 = a3;
              __int16 v157 = 2112;
              id v158 = v78;
              _os_log_impl(&dword_1D4693000, v99, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Abort update for block %lu failed with error: %@", buf, 0x2Au);
            }
          }
          [v107 finishWithNoResult];
        }

        goto LABEL_71;
      }
    }
  }
  __int16 v67 = (void *)MEMORY[0x1D944CB30]();
  v68 = self;
  __int16 v69 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
  {
    uint64_t v70 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v152 = v70;
    __int16 v153 = 2048;
    unint64_t v154 = a3;
    _os_log_impl(&dword_1D4693000, v69, OS_LOG_TYPE_ERROR, "%{public}@Failed to push group with output block row %lu: Model container is nil", buf, 0x16u);
  }
  uint64_t v121 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8 reason:@"Model container is nil"];
  [v107 finishWithError:v121];
LABEL_71:
}

void __86__HMBCloudZone_Push__pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = (void *)MEMORY[0x1D944CB30]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [*(id *)(a1 + 32) identifier];
    id v10 = [v9 shortDescription];
    uint64_t v11 = *(void *)(a1 + 56);
    int v12 = 138544130;
    id v13 = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to complete push for row %lu: %@", (uint8_t *)&v12, 0x2Au);
  }
  [*(id *)(a1 + 32) invalidate];
  [*(id *)(a1 + 40) finishWithError:v3];
}

void __86__HMBCloudZone_Push__pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v132 = a1;
  from = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v121 = v3;
  id v4 = [v3 fatalError];

  if (!v4)
  {
    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    id obj = [v121 updatedRecords];
    uint64_t v130 = [obj countByEnumeratingWithState:&v153 objects:v159 count:16];
    if (!v130) {
      goto LABEL_35;
    }
    uint64_t v128 = *(void *)v154;
    while (1)
    {
      for (uint64_t i = 0; i != v130; ++i)
      {
        if (*(void *)v154 != v128) {
          objc_enumerationMutation(obj);
        }
        __int16 v14 = *(void **)(*((void *)&v153 + 1) + 8 * i);
        id v152 = 0;
        id v137 = [v14 externalID:&v152];
        id v15 = v152;
        __int16 v16 = v15;
        if (v137)
        {
          id v151 = v15;
          v135 = [v14 externalData:&v151];
          id context = v151;

          if (v135)
          {
            uint64_t v17 = *(void **)(v132 + 40);
            __int16 v18 = [v14 recordID];
            id v19 = [v17 objectForKey:v18];

            if (v19)
            {
              uint64_t v20 = [v19 model];
              id v21 = (os_unfair_lock_s *)WeakRetained;
              id v22 = v20;
              id v23 = objc_opt_class();
              os_unfair_lock_lock_with_options();
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x3032000000;
              uint64_t v161 = __Block_byref_object_copy__5618;
              *(void *)&long long v162 = __Block_byref_object_dispose__5619;
              id v24 = [(os_unfair_lock_s *)v21 modelClassToRequiresPostProcessingMap];
              *((void *)&v162 + 1) = [v24 objectForKey:v23];

              unint64_t v25 = *(void **)(*(void *)&buf[8] + 40);
              if (!v25)
              {
                *(void *)(*(void *)&buf[8] + 40) = MEMORY[0x1E4F1CC28];
                id v26 = [v23 hmbProperties];
                v157[0] = MEMORY[0x1E4F143A8];
                v157[1] = 3221225472;
                v157[2] = ____modelRequiresPostProcessing_block_invoke;
                v157[3] = &unk_1E69EAC40;
                v157[4] = buf;
                [v26 enumerateKeysAndObjectsUsingBlock:v157];
                uint64_t v27 = [(os_unfair_lock_s *)v21 modelClassToRequiresPostProcessingMap];
                [v27 setObject:*(void *)(*(void *)&buf[8] + 40) forKey:v23];

                unint64_t v25 = *(void **)(*(void *)&buf[8] + 40);
              }
              int v28 = [v25 BOOLValue];
              _Block_object_dispose(buf, 8);

              os_unfair_lock_unlock(v21 + 2);
              if (v28)
              {

                goto LABEL_27;
              }
              long long v49 = [v19 model];
              int v50 = [(os_unfair_lock_s *)v21 isInternalModel:v49];

              if (v50)
              {
LABEL_27:
                v51 = (void *)MEMORY[0x1D944CB30]();
                uint64_t v52 = v21;
                id v53 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                {
                  id v54 = HMFGetLogIdentifier();
                  long long v55 = [*(id *)(v132 + 32) identifier];
                  long long v56 = [v55 shortDescription];
                  long long v57 = [v14 hmbDescription];
                  *(_DWORD *)buf = 138543874;
                  *(void *)&uint8_t buf[4] = v54;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v56;
                  *(_WORD *)&buf[22] = 2112;
                  uint64_t v161 = v57;
                  _os_log_impl(&dword_1D4693000, v53, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Queueing record for post-processing: %@", buf, 0x20u);
                }
                [*(id *)(v132 + 48) addObject:v14];
              }
              [v19 setExternalID:v137];
              [v19 setExternalData:v135];
              long long v58 = *(void **)(v132 + 32);
              id v59 = [v14 hmbDescription];
              [v58 markWithFormat:@"updating record %@", v59, from];
            }
            else
            {
              long long v43 = (void *)MEMORY[0x1D944CB30]();
              id v44 = WeakRetained;
              long long v45 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                long long v46 = HMFGetLogIdentifier();
                id v47 = [*(id *)(v132 + 32) identifier];
                long long v48 = [v47 shortDescription];
                *(_DWORD *)buf = 138543874;
                *(void *)&uint8_t buf[4] = v46;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v48;
                *(_WORD *)&buf[22] = 2112;
                uint64_t v161 = (uint64_t (*)(uint64_t, uint64_t))v14;
                _os_log_impl(&dword_1D4693000, v45, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Received unexpected updated record: %@", buf, 0x20u);
              }
            }
          }
          else
          {
            uint64_t v36 = (void *)MEMORY[0x1D944CB30]();
            id v37 = WeakRetained;
            uint64_t v38 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              uint64_t v39 = HMFGetLogIdentifier();
              uint64_t v40 = [*(id *)(v132 + 32) identifier];
              uint64_t v41 = [v40 shortDescription];
              id v42 = [v14 hmbDescription];
              *(_DWORD *)buf = 138544130;
              *(void *)&uint8_t buf[4] = v39;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v41;
              *(_WORD *)&buf[22] = 2112;
              uint64_t v161 = v42;
              LOWORD(v162) = 2112;
              *(void *)((char *)&v162 + 2) = context;
              _os_log_impl(&dword_1D4693000, v38, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to encode externalData for %@: %@", buf, 0x2Au);
            }
          }

          __int16 v16 = context;
          goto LABEL_33;
        }
        id v29 = (void *)MEMORY[0x1D944CB30]();
        id v30 = WeakRetained;
        BOOL v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v32 = HMFGetLogIdentifier();
          id v33 = [*(id *)(v132 + 32) identifier];
          uint64_t v34 = [v33 shortDescription];
          __int16 v35 = [v14 hmbDescription];
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v32;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v34;
          *(_WORD *)&buf[22] = 2112;
          uint64_t v161 = v35;
          LOWORD(v162) = 2112;
          *(void *)((char *)&v162 + 2) = v16;
          _os_log_impl(&dword_1D4693000, v31, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to encode externalID for %@: %@", buf, 0x2Au);
        }
LABEL_33:
      }
      uint64_t v130 = [obj countByEnumeratingWithState:&v153 objects:v159 count:16];
      if (!v130) {
        goto LABEL_35;
      }
    }
  }
  uint64_t v5 = (void *)MEMORY[0x1D944CB30]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [*(id *)(v132 + 32) identifier];
    id v10 = [v9 shortDescription];
    uint64_t v11 = [v121 fatalError];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v161 = v11;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Cloud push chunk failed: %@", buf, 0x20u);
  }
  int v12 = *(void **)(v132 + 32);
  id obj = [v121 fatalError];
  [v12 markWithFormat:@"cloud push chunk failed: %@", obj, from];
LABEL_35:

  v122 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(v132 + 48), "count"));
  v123 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(v132 + 48), "count"));
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id obja = *(id *)(v132 + 48);
  uint64_t v131 = [obja countByEnumeratingWithState:&v147 objects:v158 count:16];
  if (v131)
  {
    long long v60 = 0;
    uint64_t v129 = *(void *)v148;
    do
    {
      for (uint64_t j = 0; j != v131; ++j)
      {
        if (*(void *)v148 != v129) {
          objc_enumerationMutation(obja);
        }
        id v62 = *(void **)(*((void *)&v147 + 1) + 8 * j);
        contexta = (void *)MEMORY[0x1D944CB30]();
        id v63 = *(void **)(v132 + 40);
        v64 = [v62 recordID];
        id v65 = [v63 objectForKeyedSubscript:v64];
        v138 = [v65 model];

        uint64_t v66 = [v138 hmbSetExternalRecordFields];
        id v146 = v60;
        __int16 v67 = [WeakRetained decodeModelFromRecord:v62 externalRecordFields:v66 source:1 error:&v146];
        id v136 = v146;

        if (v67)
        {
          int v68 = [WeakRetained isInternalModel:v67];
          __int16 v69 = (void *)MEMORY[0x1D944CB30]();
          id v70 = WeakRetained;
          __int16 v71 = HMFGetOSLogHandle();
          uint64_t v72 = v71;
          if (v68)
          {
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              v124 = HMFGetLogIdentifier();
              __int16 v73 = [*(id *)(v132 + 32) identifier];
              id v74 = [v73 shortDescription];
              __int16 v75 = [v67 hmbDescription];
              uint64_t v76 = [v62 hmbDescription];
              *(_DWORD *)buf = 138544130;
              *(void *)&uint8_t buf[4] = v124;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v74;
              *(_WORD *)&buf[22] = 2112;
              uint64_t v161 = v75;
              LOWORD(v162) = 2112;
              *(void *)((char *)&v162 + 2) = v76;
              _os_log_impl(&dword_1D4693000, v72, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Queueing internal model: %@ %@", buf, 0x2Au);
            }
            [v122 addObject:v67];
          }
          else
          {
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
            {
              v125 = HMFGetLogIdentifier();
              v83 = [*(id *)(v132 + 32) identifier];
              id v84 = [v83 shortDescription];
              id v85 = [v67 hmbDescription];
              id v86 = [v62 hmbDescription];
              *(_DWORD *)buf = 138544130;
              *(void *)&uint8_t buf[4] = v125;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v84;
              *(_WORD *)&buf[22] = 2112;
              uint64_t v161 = v85;
              LOWORD(v162) = 2112;
              *(void *)((char *)&v162 + 2) = v86;
              _os_log_impl(&dword_1D4693000, v72, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Queueing model for post-processing: %@ %@", buf, 0x2Au);
            }
            [v123 addObject:v67];
          }
        }
        else
        {
          uint64_t v77 = (void *)MEMORY[0x1D944CB30]();
          id v78 = WeakRetained;
          id v79 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            uint64_t v80 = HMFGetLogIdentifier();
            id v81 = [*(id *)(v132 + 32) identifier];
            v82 = [v81 shortDescription];
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = v80;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v82;
            *(_WORD *)&buf[22] = 2112;
            uint64_t v161 = (uint64_t (*)(uint64_t, uint64_t))v62;
            LOWORD(v162) = 2112;
            *(void *)((char *)&v162 + 2) = v136;
            _os_log_impl(&dword_1D4693000, v79, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Unable to decode internal record %@: %@", buf, 0x2Au);
          }
        }

        long long v60 = v136;
      }
      uint64_t v131 = [obja countByEnumeratingWithState:&v147 objects:v158 count:16];
      long long v60 = v136;
    }
    while (v131);
  }
  else
  {
    long long v60 = 0;
  }
  id v87 = v60;

  [WeakRetained handleUpdatedInternalModels:v122];
  id v88 = *(void **)(v132 + 56);
  uint64_t v89 = *(void *)(v132 + 88);
  id v90 = [*(id *)(v132 + 40) allValues];
  id v91 = [v88 markGroupAsSentWithOutputBlock:v89 tuples:v90];

  if (v91)
  {
    id v92 = (void *)MEMORY[0x1D944CB30]();
    id v93 = WeakRetained;
    long long v94 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
    {
      long long v95 = HMFGetLogIdentifier();
      long long v96 = [*(id *)(v132 + 32) identifier];
      long long v97 = [v96 shortDescription];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v95;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v97;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v161 = v91;
      _os_log_impl(&dword_1D4693000, v94, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to mark records as pushed: %@", buf, 0x20u);
    }
    [*(id *)(v132 + 32) markWithFormat:@"push mark as completed failed: %@", v91];
  }
  BOOL v98 = [v123 count] == 0;
  v99 = (void *)MEMORY[0x1D944CB30]();
  id v100 = WeakRetained;
  __int16 v101 = HMFGetOSLogHandle();
  BOOL v102 = os_log_type_enabled(v101, OS_LOG_TYPE_INFO);
  if (v98)
  {
    if (v102)
    {
      v116 = HMFGetLogIdentifier();
      id v117 = [*(id *)(v132 + 32) identifier];
      uint64_t v118 = [v117 shortDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v116;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v118;
      _os_log_impl(&dword_1D4693000, v101, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Nothing to post-process", buf, 0x16u);
    }
    uint64_t v119 = *(void **)(v132 + 72);
    unint64_t v110 = objc_alloc_init(HMBCloudZonePushResult);
    [v119 finishWithResult:v110];
  }
  else
  {
    if (v102)
    {
      __int16 v103 = HMFGetLogIdentifier();
      id v104 = [*(id *)(v132 + 32) identifier];
      id v105 = [v104 shortDescription];
      uint64_t v106 = [v123 count];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v103;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v105;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v161 = (uint64_t (*)(uint64_t, uint64_t))v106;
      _os_log_impl(&dword_1D4693000, v101, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Post-processing %lu models", buf, 0x20u);
    }
    id v107 = NSString;
    id v108 = [*(id *)(v132 + 64) label];
    id v109 = [v107 stringWithFormat:@"Post-process: %@", v108];
    unint64_t v110 = +[HMBProcessingOptions optionsWithLabel:v109];

    [(HMBCloudZonePushResult *)v110 setShouldEnqueueMirrorOutput:0];
    id v111 = [*(id *)(v132 + 56) updateModels:v123 options:v110];
    v143[0] = MEMORY[0x1E4F143A8];
    v143[1] = 3221225472;
    v143[2] = __86__HMBCloudZone_Push__pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke_27;
    v143[3] = &unk_1E69EAB50;
    objc_copyWeak(&v145, from);
    id v144 = *(id *)(v132 + 32);
    id v112 = (id)[v111 addFailureBlock:v143];
    v140[0] = MEMORY[0x1E4F143A8];
    v140[1] = 3221225472;
    v140[2] = __86__HMBCloudZone_Push__pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke_28;
    v140[3] = &unk_1E69EAB78;
    objc_copyWeak(&v142, from);
    id v141 = *(id *)(v132 + 32);
    id v113 = (id)[v111 addSuccessBlock:v140];
    v114 = [*(id *)(v132 + 72) completionHandlerAdapter];
    id v115 = (id)[v111 addCompletionBlock:v114];

    objc_destroyWeak(&v142);
    objc_destroyWeak(&v145);
  }
}

void __86__HMBCloudZone_Push__pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = (void *)MEMORY[0x1D944CB30]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [*(id *)(a1 + 32) identifier];
    id v10 = [v9 shortDescription];
    int v11 = 138543874;
    int v12 = v8;
    __int16 v13 = 2114;
    __int16 v14 = v10;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Post-processing failed: %@", (uint8_t *)&v11, 0x20u);
  }
}

void __86__HMBCloudZone_Push__pushGroupWithBlockRow_tuples_options_activity_completionPromise___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = (void *)MEMORY[0x1D944CB30]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [*(id *)(a1 + 32) identifier];
    id v10 = [v9 shortDescription];
    int v11 = 138543618;
    int v12 = v8;
    __int16 v13 = 2114;
    __int16 v14 = v10;
    _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Post-processing succeeded", (uint8_t *)&v11, 0x16u);
  }
}

- (id)_pushDeletedParticipantRecordIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 allObjects];
  id v6 = [(HMBCloudZone *)self pushRecordsToUpdate:MEMORY[0x1E4F1CBF0] recordIDsToRemove:v5 configuration:0 rollbackEnabled:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__HMBCloudZone_Share_Internal___pushDeletedParticipantRecordIDs___block_invoke;
  v10[3] = &unk_1E69EAF28;
  id v11 = v4;
  int v12 = self;
  id v7 = v4;
  id v8 = [v6 flatMap:v10];

  return v8;
}

id __65__HMBCloudZone_Share_Internal___pushDeletedParticipantRecordIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 deletedRecordIDs];
  uint64_t v5 = [v4 count];
  uint64_t v6 = [*(id *)(a1 + 32) count];

  if (v5 == v6)
  {
    id v7 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  else
  {
    id v8 = [v3 fatalError];
    if (v8)
    {
      id v9 = (void *)MEMORY[0x1D944CB30]();
      id v10 = *(id *)(a1 + 40);
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = HMFGetLogIdentifier();
        int v16 = 138543618;
        uint64_t v17 = v12;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete share participant records: %@", (uint8_t *)&v16, 0x16u);
      }
      __int16 v13 = (void *)MEMORY[0x1E4F7A0D8];
      __int16 v14 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
      id v7 = [v13 futureWithError:v14];
    }
    else
    {
      id v7 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    }
  }
  return v7;
}

- (id)_pushUpdatedShare:(id)a3 participantRecord:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v18[0] = v6;
  v18[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  id v9 = [(HMBCloudZone *)self pushRecordsToUpdate:v8 recordIDsToRemove:MEMORY[0x1E4F1CBF0] configuration:0 rollbackEnabled:0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__HMBCloudZone_Share_Internal___pushUpdatedShare_participantRecord___block_invoke;
  v14[3] = &unk_1E69EAF00;
  id v15 = v6;
  id v16 = v7;
  uint64_t v17 = self;
  id v10 = v7;
  id v11 = v6;
  int v12 = [v9 flatMap:v14];

  return v12;
}

id __68__HMBCloudZone_Share_Internal___pushUpdatedShare_participantRecord___block_invoke(id *a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 updatedRecords];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __68__HMBCloudZone_Share_Internal___pushUpdatedShare_participantRecord___block_invoke_2;
  v35[3] = &unk_1E69EAED8;
  id v36 = a1[4];
  uint64_t v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", v35);

  id v6 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = [v3 updatedRecords];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __68__HMBCloudZone_Share_Internal___pushUpdatedShare_participantRecord___block_invoke_3;
  v33[3] = &unk_1E69EAED8;
  id v34 = a1[5];
  id v10 = objc_msgSend(v9, "na_firstObjectPassingTest:", v33);

  if (v8 && v10)
  {
    id v11 = a1[6];
    id v32 = 0;
    char v12 = [v11 handleUpdatedShareParticipantRecord:v10 error:&v32];
    id v13 = v32;
    if (v12)
    {
      id v14 = a1[6];
      id v31 = v13;
      char v15 = [v14 handleUpdatedShare:v8 error:&v31];
      id v16 = v31;

      if (v15) {
        [MEMORY[0x1E4F7A0D8] futureWithResult:v8];
      }
      else {
      id v29 = [MEMORY[0x1E4F7A0D8] futureWithError:v16];
      }
      id v13 = v16;
      goto LABEL_21;
    }
    id v26 = (void *)MEMORY[0x1E4F7A0D8];
  }
  else
  {
    uint64_t v17 = [v3 conflicts];
    uint64_t v18 = [v17 count];

    id v19 = (void *)MEMORY[0x1D944CB30]();
    id v20 = a1[6];
    id v21 = HMFGetOSLogHandle();
    id v22 = v21;
    if (v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v38 = v23;
        _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_INFO, "%{public}@Hit conflict when pushing share and share participant record; retrying operation",
          buf,
          0xCu);
      }
      id v24 = (void *)MEMORY[0x1E4F7A0D8];
      uint64_t v25 = [MEMORY[0x1E4F28C58] hmbRetryShareOperationError];
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        int v28 = [v3 fatalError];
        *(_DWORD *)buf = 138543618;
        uint64_t v38 = v27;
        __int16 v39 = 2112;
        uint64_t v40 = v28;
        _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to push share and share participant record: %@", buf, 0x16u);
      }
      id v24 = (void *)MEMORY[0x1E4F7A0D8];
      uint64_t v25 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    }
    id v13 = (id)v25;
    id v26 = v24;
  }
  id v29 = [v26 futureWithError:v13];
LABEL_21:

  return v29;
}

uint64_t __68__HMBCloudZone_Share_Internal___pushUpdatedShare_participantRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 recordID];
  id v4 = [*(id *)(a1 + 32) recordID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __68__HMBCloudZone_Share_Internal___pushUpdatedShare_participantRecord___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 recordID];
  id v4 = [*(id *)(a1 + 32) recordID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (id)_pushUpdatedShare:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v11[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:v11 count:1];
  id v7 = [(HMBCloudZone *)self pushRecordsToUpdate:v6 recordIDsToRemove:0 configuration:0 rollbackEnabled:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__HMBCloudZone_Share_Internal___pushUpdatedShare___block_invoke;
  v10[3] = &unk_1E69EAE88;
  void v10[4] = self;
  id v8 = [v7 flatMap:v10];

  return v8;
}

id __50__HMBCloudZone_Share_Internal___pushUpdatedShare___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 updatedRecords];
  id v5 = [v4 anyObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    id v26 = 0;
    char v9 = [v8 handleUpdatedShare:v7 error:&v26];
    id v10 = v26;
    id v11 = (void *)MEMORY[0x1E4F7A0D8];
    if (v9)
    {
      uint64_t v12 = [MEMORY[0x1E4F7A0D8] futureWithResult:v7];
      goto LABEL_16;
    }
  }
  else
  {
    id v13 = [v3 conflicts];
    uint64_t v14 = [v13 count];

    char v15 = (void *)MEMORY[0x1D944CB30]();
    id v16 = *(id *)(a1 + 32);
    uint64_t v17 = HMFGetOSLogHandle();
    uint64_t v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        int v28 = v19;
        _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_INFO, "%{public}@Hit conflict when pushing share; retrying operation",
          buf,
          0xCu);
      }
      id v20 = (void *)MEMORY[0x1E4F7A0D8];
      uint64_t v21 = [MEMORY[0x1E4F28C58] hmbRetryShareOperationError];
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v22 = HMFGetLogIdentifier();
        id v23 = [v3 fatalError];
        *(_DWORD *)buf = 138543618;
        int v28 = v22;
        __int16 v29 = 2112;
        id v30 = v23;
        _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to push share: %@", buf, 0x16u);
      }
      id v20 = (void *)MEMORY[0x1E4F7A0D8];
      uint64_t v21 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    }
    id v10 = (id)v21;
    id v11 = v20;
  }
  uint64_t v12 = [v11 futureWithError:v10];
LABEL_16:
  id v24 = (void *)v12;

  return v24;
}

- (id)_addShareOperationAfterStartupWithName:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMBCloudZone *)self startUp];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__HMBCloudZone_Share_Internal___addShareOperationAfterStartupWithName_block___block_invoke;
  v13[3] = &unk_1E69EAEB0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 flatMap:v13];

  return v11;
}

uint64_t __77__HMBCloudZone_Share_Internal___addShareOperationAfterStartupWithName_block___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addShareOperationWithName:*(void *)(a1 + 40) block:*(void *)(a1 + 48)];
}

- (id)_addShareOperationWithName:(id)a3 block:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [[HMBShareOperation alloc] initWithCloudZone:self block:v7];
  id v9 = (void *)MEMORY[0x1D944CB30]([(HMBShareOperation *)v8 setName:v6]);
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v16 = 138543874;
    uint64_t v17 = v12;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_INFO, "%{public}@Adding %@ share operation: %@", (uint8_t *)&v16, 0x20u);
  }
  id v13 = [(HMBCloudZone *)v10 shareOperationQueue];
  [v13 addOperation:v8];

  id v14 = [(HMBFutureOperation *)v8 future];

  return v14;
}

- (id)_leaveCloudShareRequestingNewInvitationToken:(BOOL)a3 allowCloudPull:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1D944CB30](self, a2);
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v40 = v10;
    _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_INFO, "%{public}@Leaving cloud share", buf, 0xCu);
  }
  id v11 = [(HMBCloudZone *)v8 shareModel];
  uint64_t v12 = [v11 share];
  id v13 = [v12 recordID];

  if (v13)
  {
    uint64_t v38 = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    id v15 = [(HMBCloudZone *)v8 pushRecordsToUpdate:0 recordIDsToRemove:v14 configuration:0 rollbackEnabled:0 needsNewInvitationToken:v5];
    int v16 = v15;
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    __int16 v29 = __92__HMBCloudZone_Share_Internal___leaveCloudShareRequestingNewInvitationToken_allowCloudPull___block_invoke_2;
    id v30 = &unk_1E69EAE88;
    uint64_t v31 = v8;
    uint64_t v17 = &v27;
LABEL_9:
    id v23 = objc_msgSend(v15, "flatMap:", v17, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37);

    goto LABEL_10;
  }
  __int16 v18 = (void *)MEMORY[0x1D944CB30]();
  id v19 = v8;
  __int16 v20 = HMFGetOSLogHandle();
  uint64_t v21 = v20;
  if (a4)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v22;
      _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find a share model. Will attempt to find one by re-fetching all records", buf, 0xCu);
    }
    id v14 = +[HMBProcessingOptions optionsWithLabel:@"Full re-fetch for missing share model"];
    id v15 = [(HMBCloudZone *)v19 performFullCloudPullWithOptions:v14];
    int v16 = v15;
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    id v34 = __92__HMBCloudZone_Share_Internal___leaveCloudShareRequestingNewInvitationToken_allowCloudPull___block_invoke;
    __int16 v35 = &unk_1E69EAE60;
    id v36 = v19;
    LOBYTE(v37) = v5;
    uint64_t v17 = &v32;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v40 = v25;
    _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot leave cloud share because no share model was found", buf, 0xCu);
  }
  id v26 = (void *)MEMORY[0x1E4F7A0D8];
  id v14 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
  id v23 = [v26 futureWithError:v14];
LABEL_10:

  return v23;
}

uint64_t __92__HMBCloudZone_Share_Internal___leaveCloudShareRequestingNewInvitationToken_allowCloudPull___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _leaveCloudShareRequestingNewInvitationToken:*(unsigned __int8 *)(a1 + 40) allowCloudPull:0];
}

id __92__HMBCloudZone_Share_Internal___leaveCloudShareRequestingNewInvitationToken_allowCloudPull___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 fatalError];
  BOOL v5 = v4;
  if (!v4)
  {
    id v7 = (void *)MEMORY[0x1D944CB30]();
    id v8 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v19 = 138543618;
      __int16 v20 = v11;
      __int16 v21 = 2112;
      id v22 = v3;
      uint64_t v12 = "%{public}@Successfully pushed changes for leaving cloud share with result: %@";
      id v13 = v10;
      uint32_t v14 = 22;
      goto LABEL_7;
    }
LABEL_8:

    uint64_t v15 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    goto LABEL_12;
  }
  int v6 = [v4 hmbIsCKZoneDeletedError];
  id v7 = (void *)MEMORY[0x1D944CB30]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v19 = 138543362;
      __int16 v20 = v11;
      uint64_t v12 = "%{public}@Received zone deleted error when leaving cloud share";
      id v13 = v10;
      uint32_t v14 = 12;
LABEL_7:
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v19, v14);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v16 = HMFGetLogIdentifier();
    int v19 = 138543618;
    __int16 v20 = v16;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to push changes for leaving cloud share: %@", (uint8_t *)&v19, 0x16u);
  }
  uint64_t v15 = [MEMORY[0x1E4F7A0D8] futureWithError:v5];
LABEL_12:
  uint64_t v17 = (void *)v15;

  return v17;
}

- (id)leaveCloudShareRequestingNewInvitationToken:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__HMBCloudZone_Share_Internal__leaveCloudShareRequestingNewInvitationToken___block_invoke;
  v5[3] = &unk_1E69EAE38;
  v5[4] = self;
  BOOL v6 = a3;
  id v3 = [(HMBCloudZone *)self _addShareOperationAfterStartupWithName:@"Leave Cloud Share" block:v5];
  return v3;
}

uint64_t __76__HMBCloudZone_Share_Internal__leaveCloudShareRequestingNewInvitationToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _leaveCloudShareRequestingNewInvitationToken:*(unsigned __int8 *)(a1 + 40) allowCloudPull:1];
}

- (id)_createShareModel
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMBCloudZone *)self shareModel];

  if (v3)
  {
    id v4 = [(HMBCloudZone *)self shareModel];
    BOOL v5 = [(HMBCloudZone *)self encodeShareModel:v4];

    BOOL v6 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1D944CB30]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v22 = 138543362;
      uint64_t v23 = v10;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_INFO, "%{public}@Creating share model", (uint8_t *)&v22, 0xCu);
    }
    id v11 = [HMBCloudZoneShareModel alloc];
    uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
    id v13 = [(HMBCloudZone *)v8 stateModelID];
    uint32_t v14 = [(HMBModel *)v11 initWithModelID:v12 parentModelID:v13];

    id v15 = objc_alloc(MEMORY[0x1E4F1A390]);
    int v16 = [(HMBCloudZone *)v8 cloudZoneID];
    uint64_t v17 = [v16 zoneID];
    __int16 v18 = (void *)[v15 initWithRecordZoneID:v17];
    [(HMBCloudZoneShareModel *)v14 setShare:v18];

    int v19 = [(HMBCloudZoneShareModel *)v14 share];
    [v19 setParticipantVisibility:2];

    __int16 v20 = [(HMBCloudZone *)v8 encodeShareModel:v14];
    BOOL v6 = [(HMBCloudZone *)v8 _pushUpdatedShare:v20];
  }
  return v6;
}

- (id)createShareModel
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__HMBCloudZone_Share_Internal__createShareModel__block_invoke;
  v4[3] = &unk_1E69EAE10;
  v4[4] = self;
  id v2 = [(HMBCloudZone *)self _addShareOperationAfterStartupWithName:@"Create Share Model" block:v4];
  return v2;
}

id __48__HMBCloudZone_Share_Internal__createShareModel__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _createShareModel];
  id v2 = [v1 flatMap:&__block_literal_global_12_6225];

  return v2;
}

uint64_t __48__HMBCloudZone_Share_Internal__createShareModel__block_invoke_2()
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)handleUpdatedShareParticipantModels:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_t lock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  long long v45 = self;
  id v42 = [(HMBCloudZone *)self localZone];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
  if (v5)
  {
    uint64_t v44 = *(void *)v48;
    do
    {
      uint64_t v46 = v5;
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v48 != v44) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v8 = (void *)MEMORY[0x1D944CB30]();
        id v9 = v45;
        HMFGetOSLogHandle();
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v12 = [v7 participant];
          *(_DWORD *)buf = 138543618;
          id v53 = v11;
          __int16 v54 = 2112;
          long long v55 = v12;
          _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling updated share participant: %@", buf, 0x16u);
        }
        id v13 = [v7 participant];
        uint32_t v14 = [v13 clientIdentifier];

        id v15 = [(HMBCloudZone *)v9 shareParticipantModelsByClientIdentifier];
        int v16 = [v15 objectForKeyedSubscript:v14];

        if (v16)
        {
          uint64_t v17 = [v16 hmbModelID];
          __int16 v18 = [v7 hmbModelID];
          char v19 = [v17 isEqual:v18];

          if ((v19 & 1) == 0)
          {
            __int16 v20 = (void *)MEMORY[0x1D944CB30]();
            __int16 v21 = v9;
            HMFGetOSLogHandle();
            int v22 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              id v23 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v24 = [v14 UUIDString];
              *(_DWORD *)buf = 138543874;
              id v53 = v23;
              __int16 v54 = 2112;
              long long v55 = v24;
              __int16 v56 = 2112;
              long long v57 = v16;
              _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_INFO, "%{public}@Removing existing share participant model with client identifier %@ because it has a different model ID: %@", buf, 0x20u);
            }
            uint64_t v25 = [v16 hmbModelID];
            v51 = v25;
            id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
            uint64_t v27 = [v42 remove:v26];

            if (v27)
            {
              uint64_t v28 = (void *)MEMORY[0x1D944CB30]();
              __int16 v29 = v21;
              HMFGetOSLogHandle();
              id v30 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                uint64_t v31 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                id v53 = v31;
                __int16 v54 = 2112;
                long long v55 = v27;
                _os_log_impl(&dword_1D4693000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove existing share participant model: %@", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v32 = [(HMBCloudZone *)v9 shareParticipantModelsByClientIdentifier];
        uint64_t v33 = [v7 participant];
        id v34 = [v33 clientIdentifier];
        [v32 setObject:v7 forKeyedSubscript:v34];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
    }
    while (v5);
  }

  __int16 v35 = [obj allObjects];
  id v36 = [v42 update:v35];

  if (v36)
  {
    uint64_t v37 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v38 = v45;
    HMFGetOSLogHandle();
    __int16 v39 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v53 = v40;
      __int16 v54 = 2112;
      long long v55 = v36;
      _os_log_impl(&dword_1D4693000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to update share participant models: %@", buf, 0x16u);
    }
  }

  os_unfair_lock_unlock(lock);
}

- (void)handleUpdatedShareModel:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  uint64_t v66 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = HMFGetLogIdentifier();
    id v7 = [v59 share];
    *(_DWORD *)buf = 138543618;
    v82 = v6;
    __int16 v83 = 2112;
    id v84 = v7;
    _os_log_impl(&dword_1D4693000, v5, OS_LOG_TYPE_INFO, "%{public}@Handling updated share: %@", buf, 0x16u);
  }
  long long v60 = [MEMORY[0x1E4F1CA80] set];
  id v62 = [MEMORY[0x1E4F1CA80] set];
  os_unfair_lock_t lock = &v66->_propertyLock;
  os_unfair_lock_lock_with_options();
  long long v61 = [MEMORY[0x1E4F1CA48] arrayWithObject:v59];
  id v63 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [v59 share];
  id v9 = [v8 participants];
  id v65 = objc_msgSend(v9, "na_dictionaryWithKeyGenerator:", &__block_literal_global_6233);

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v10 = [(HMBCloudZone *)v66 shareParticipantModelsByClientIdentifier];
  id obj = [v10 allValues];

  uint64_t v11 = [obj countByEnumeratingWithState:&v75 objects:v87 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v76 != v12) {
          objc_enumerationMutation(obj);
        }
        uint32_t v14 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        id v15 = objc_msgSend(v14, "participant", lock);
        int v16 = [v15 ckShareParticipant];
        uint64_t v17 = [v16 participantID];
        __int16 v18 = [v65 objectForKeyedSubscript:v17];

        if (v18)
        {
          char v19 = [v15 ckShareParticipant];
          char v20 = [v19 hmbIsEqualToParticipant:v18];

          if ((v20 & 1) == 0)
          {
            __int16 v21 = (void *)MEMORY[0x1D944CB30]();
            int v22 = v66;
            HMFGetOSLogHandle();
            id v23 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              uint64_t v24 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v82 = v24;
              __int16 v83 = 2112;
              id v84 = v15;
              __int16 v85 = 2112;
              id v86 = v18;
              _os_log_impl(&dword_1D4693000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating CKShareParticipant on participant %@ to %@", buf, 0x20u);
            }
            uint64_t v25 = [HMBShareParticipant alloc];
            id v26 = [v15 clientIdentifier];
            uint64_t v27 = [(HMBShareParticipant *)v25 initWithCKShareParticipant:v18 clientIdentifier:v26];

            if (![(HMBShareParticipant *)v27 hasAccepted])
            {
              uint64_t v28 = [v15 pendingInvitation];
              [(HMBShareParticipant *)v27 setPendingInvitation:v28];
            }
            __int16 v29 = (void *)[v14 copy];
            [v29 setParticipant:v27];
            id v30 = [(HMBCloudZone *)v22 shareParticipantModelsByClientIdentifier];
            uint64_t v31 = [v15 clientIdentifier];
            [v30 setObject:v29 forKeyedSubscript:v31];

            [v61 addObject:v29];
            [v60 addObject:v29];
          }
        }
        else
        {
          uint64_t v32 = (void *)MEMORY[0x1D944CB30]();
          uint64_t v33 = v66;
          HMFGetOSLogHandle();
          id v34 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            __int16 v35 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v82 = v35;
            __int16 v83 = 2112;
            id v84 = v15;
            _os_log_impl(&dword_1D4693000, v34, OS_LOG_TYPE_INFO, "%{public}@Removing participant that is no longer on share: %@", buf, 0x16u);
          }
          id v36 = [(HMBCloudZone *)v33 shareParticipantModelsByClientIdentifier];
          uint64_t v37 = [v15 clientIdentifier];
          [v36 setObject:0 forKeyedSubscript:v37];

          uint64_t v38 = [v14 hmbModelID];
          [v63 addObject:v38];

          [v62 addObject:v14];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v75 objects:v87 count:16];
    }
    while (v11);
  }

  [(HMBCloudZone *)v66 setShareModel:v59];
  __int16 v39 = [(HMBCloudZone *)v66 localZone];
  uint64_t v40 = [v39 update:v61 remove:v63];

  if (v40)
  {
    uint64_t v41 = (void *)MEMORY[0x1D944CB30]();
    id v42 = v66;
    HMFGetOSLogHandle();
    long long v43 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v82 = v44;
      __int16 v83 = 2112;
      id v84 = v40;
      _os_log_impl(&dword_1D4693000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to update/remove share models: %@", buf, 0x16u);
    }
  }

  os_unfair_lock_unlock(lock);
  long long v45 = [(HMBCloudZone *)v66 delegate];
  if (objc_opt_respondsToSelector())
  {
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v46 = v60;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v71 objects:v80 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v72;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v72 != v48) {
            objc_enumerationMutation(v46);
          }
          long long v50 = objc_msgSend(*(id *)(*((void *)&v71 + 1) + 8 * j), "participant", lock);
          v51 = [v50 clientIdentifier];
          [v45 cloudZone:v66 didUpdateParticipantWithClientIdentifier:v51];
        }
        uint64_t v47 = [v46 countByEnumeratingWithState:&v71 objects:v80 count:16];
      }
      while (v47);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v52 = v62;
    uint64_t v53 = [v52 countByEnumeratingWithState:&v67 objects:v79 count:16];
    if (v53)
    {
      uint64_t v54 = *(void *)v68;
      do
      {
        for (uint64_t k = 0; k != v53; ++k)
        {
          if (*(void *)v68 != v54) {
            objc_enumerationMutation(v52);
          }
          __int16 v56 = objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * k), "participant", lock);
          long long v57 = [v56 clientIdentifier];
          [v45 cloudZone:v66 didRemoveParticipantWithClientIdentifier:v57];
        }
        uint64_t v53 = [v52 countByEnumeratingWithState:&v67 objects:v79 count:16];
      }
      while (v53);
    }
  }
}

uint64_t __56__HMBCloudZone_Share_Internal__handleUpdatedShareModel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 participantID];
}

- (BOOL)handleUpdatedShareParticipantRecord:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v24 = 0;
  id v7 = [(HMBCloudZone *)self decodeModelFromRecord:v6 externalRecordFields:0 source:2 error:&v24];
  id v8 = v24;
  if (v7)
  {
    id v9 = v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    if (isKindOfClass)
    {
      id v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
      [(HMBCloudZone *)self handleUpdatedShareParticipantModels:v13];
    }
    else
    {
      __int16 v18 = (void *)MEMORY[0x1D944CB30]();
      char v19 = self;
      char v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        __int16 v21 = v23 = v18;
        *(_DWORD *)buf = 138543618;
        id v26 = v21;
        __int16 v27 = 2112;
        id v28 = v9;
        _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_ERROR, "%{public}@Decoded model was not a HMBCloudZoneShareParticipantModel: %@", buf, 0x16u);

        __int16 v18 = v23;
      }

      if (a4)
      {
        *a4 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
      }
    }
  }
  else
  {
    uint32_t v14 = (void *)MEMORY[0x1D944CB30]();
    id v15 = self;
    int v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v26 = v17;
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      id v30 = v8;
      _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode model from share participant record %@: %@", buf, 0x20u);
    }
    char isKindOfClass = 0;
    if (a4) {
      *a4 = v8;
    }
  }

  return isKindOfClass & 1;
}

- (BOOL)handleUpdatedShare:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMBCloudZone *)self decodeShareModelFromShare:v6];
  if (v7)
  {
    [(HMBCloudZone *)self handleUpdatedShareModel:v7];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D944CB30]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint32_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode share model from share %@", (uint8_t *)&v13, 0x16u);
    }
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    }
  }

  return v7 != 0;
}

- (void)initializeShareModels
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  id v3 = [(HMBCloudZone *)v2 localZone];
  if (v3)
  {
    id v4 = [(HMBCloudZone *)v2 stateModelID];
    *(void *)id v62 = 0;
    uint64_t v5 = [v3 fetchModelsWithParentModelID:v4 ofType:objc_opt_class() error:v62];
    id v6 = *(id *)v62;

    if (v5)
    {
      if ((unint64_t)[v5 count] >= 2)
      {
        id v7 = (void *)MEMORY[0x1D944CB30]();
        id v8 = v2;
        id v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = HMFGetLogIdentifier();
          uint64_t v11 = [v5 hmbDescription];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v10;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v11;
          _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly found more than one share model: %@", buf, 0x16u);
        }
        id v12 = objc_msgSend(v5, "na_map:", &__block_literal_global_97);
        int v13 = [v12 allObjects];

        uint32_t v14 = [v3 remove:v13];
        if (v14)
        {
          __int16 v15 = (void *)MEMORY[0x1D944CB30]();
          id v16 = v8;
          uint64_t v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            __int16 v18 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v18;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v14;
            _os_log_impl(&dword_1D4693000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove existing share modelIDs: %@", buf, 0x16u);
          }
        }
        uint64_t v19 = [MEMORY[0x1E4F1CAD0] set];

        uint64_t v5 = (void *)v19;
      }
      char v20 = [v5 anyObject];
      __int16 v21 = (void *)MEMORY[0x1D944CB30]();
      int v22 = v2;
      id v23 = HMFGetOSLogHandle();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
      if (v20)
      {
        if (v24)
        {
          uint64_t v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v25;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v20;
          _os_log_impl(&dword_1D4693000, v23, OS_LOG_TYPE_INFO, "%{public}@Fetched existing share model: %@", buf, 0x16u);
        }
      }
      else if (v24)
      {
        id v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v34;
        _os_log_impl(&dword_1D4693000, v23, OS_LOG_TYPE_INFO, "%{public}@Did not find existing share model", buf, 0xCu);
      }
    }
    else
    {
      id v30 = (void *)MEMORY[0x1D944CB30]();
      uint64_t v31 = v2;
      uint64_t v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        _os_log_impl(&dword_1D4693000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch share models: %@", buf, 0x16u);
      }
      char v20 = 0;
    }
  }
  else
  {
    id v26 = (void *)MEMORY[0x1D944CB30]();
    __int16 v27 = v2;
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v29;
      _os_log_impl(&dword_1D4693000, v28, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch share model because local zone is nil", buf, 0xCu);
    }
    char v20 = 0;
  }

  if (v20)
  {
    __int16 v35 = v2;
    id v61 = v20;
    id v36 = [(HMBCloudZone *)v35 localZone];
    if (v36)
    {
      uint64_t v37 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v38 = [MEMORY[0x1E4F1CA80] set];
      __int16 v39 = [(HMBCloudZone *)v35 stateModelID];
      long long v60 = [v36 queryModelsWithParentModelID:v39 ofType:objc_opt_class()];

      uint64_t v40 = [v61 share];
      uint64_t v41 = [v40 participants];
      id v42 = objc_msgSend(v41, "na_dictionaryWithKeyGenerator:", &__block_literal_global_100);

      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ____initializeShareParticipantModels_block_invoke_2;
      long long v67 = &unk_1E69EB100;
      id v59 = v42;
      id v68 = v59;
      long long v43 = v35;
      long long v69 = v43;
      id v70 = v36;
      id v44 = v38;
      id v71 = v44;
      id v45 = v37;
      id v72 = v45;
      [v60 enumerateObjectsUsingBlock:buf];
      id v46 = [v45 allValues];
      uint64_t v47 = objc_msgSend(v46, "na_map:", &__block_literal_global_105);

      uint64_t v48 = (void *)MEMORY[0x1D944CB30]();
      long long v49 = v43;
      long long v50 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        v51 = HMFGetLogIdentifier();
        *(_DWORD *)id v62 = 138543618;
        *(void *)&v62[4] = v51;
        *(_WORD *)&v62[12] = 2112;
        *(void *)&v62[14] = v47;
        _os_log_impl(&dword_1D4693000, v50, OS_LOG_TYPE_INFO, "%{public}@Initializing with fetched participants: %@", v62, 0x16u);
      }
      os_unfair_lock_lock_with_options();
      id v52 = [(os_unfair_lock_s *)v49 shareParticipantModelsByClientIdentifier];
      [v52 addEntriesFromDictionary:v45];

      os_unfair_lock_unlock(v49 + 2);
      if ([v44 count])
      {
        *(void *)id v62 = MEMORY[0x1E4F143A8];
        *(void *)&v62[8] = 3221225472;
        *(void *)&v62[16] = ____initializeShareParticipantModels_block_invoke_109;
        id v63 = &unk_1E69EB530;
        uint64_t v53 = v49;
        v64 = v53;
        id v65 = v44;
        id v54 = (id)[(os_unfair_lock_s *)v53 _addShareOperationAfterStartupWithName:@"Delete extraneous participant models" block:v62];
      }
    }
    else
    {
      long long v55 = (void *)MEMORY[0x1D944CB30]();
      __int16 v56 = v35;
      long long v57 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        long long v58 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v58;
        _os_log_impl(&dword_1D4693000, v57, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize share participant models because local zone is nil", buf, 0xCu);
      }
    }

    [(HMBCloudZone *)v35 handleUpdatedShareModel:v61];
  }
}

- (id)participantWithClientIdentifier:(id)a3
{
  id v4 = a3;
  p_propertyLocuint64_t k = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMBCloudZone *)self shareParticipantModelsByClientIdentifier];
  id v7 = [v6 objectForKeyedSubscript:v4];
  id v8 = [v7 participant];
  id v9 = (void *)[v8 copy];

  os_unfair_lock_unlock(p_propertyLock);
  return v9;
}

- (NSSet)participants
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  p_propertyLocuint64_t k = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(HMBCloudZone *)self shareParticipantModelsByClientIdentifier];
  id v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) participant];
        [v3 addObject:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_propertyLock);
  uint64_t v11 = (void *)[v3 copy];

  return (NSSet *)v11;
}

- (id)_revokeShareAccessForParticipant:(id)a3 usingShare:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D944CB30]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v29 = v11;
    __int16 v30 = 2112;
    id v31 = v6;
    _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@Revoking share access for participant: %@", buf, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  id v12 = [(HMBCloudZone *)v9 shareParticipantModelsByClientIdentifier];
  long long v13 = [v6 clientIdentifier];
  long long v14 = [v12 objectForKeyedSubscript:v13];

  os_unfair_lock_unlock(&v9->_propertyLock);
  if (v14)
  {
    long long v15 = [v6 ckShareParticipant];
    long long v16 = __removeParticipantFromShare(v9, v15, v7);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __67__HMBCloudZone_Share___revokeShareAccessForParticipant_usingShare___block_invoke;
    v26[3] = &unk_1E69EAF78;
    v26[4] = v9;
    id v27 = v14;
    uint64_t v17 = [v16 flatMap:v26];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __67__HMBCloudZone_Share___revokeShareAccessForParticipant_usingShare___block_invoke_78;
    v25[3] = &unk_1E69EB0B8;
    v25[4] = v9;
    uint64_t v18 = [v17 addSuccessBlock:v25];
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1D944CB30]();
    char v20 = v9;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v29 = v22;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_ERROR, "%{public}@Could not find participant model for participant %@", buf, 0x16u);
    }
    id v23 = (void *)MEMORY[0x1E4F7A0D8];
    long long v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    uint64_t v18 = [v23 futureWithError:v15];
  }

  return v18;
}

id __67__HMBCloudZone_Share___revokeShareAccessForParticipant_usingShare___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v13 = 138543362;
    long long v14 = v7;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully pushed share changes for share access revocation", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v8 = [*(id *)(a1 + 32) recordIDForModel:*(void *)(a1 + 40)];
  id v9 = *(void **)(a1 + 32);
  id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  uint64_t v11 = [v9 _pushDeletedParticipantRecordIDs:v10];

  return v11;
}

void __67__HMBCloudZone_Share___revokeShareAccessForParticipant_usingShare___block_invoke_78(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully pushed share participant deletion for share access revocation", (uint8_t *)&v8, 0xCu);
  }
}

- (id)revokeShareAccessForParticipant:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __55__HMBCloudZone_Share__revokeShareAccessForParticipant___block_invoke;
  v8[3] = &unk_1E69EB530;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(HMBCloudZone *)self _addShareOperationAfterStartupWithName:@"Revoke Share Access" block:v8];

  return v6;
}

id __55__HMBCloudZone_Share__revokeShareAccessForParticipant___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _createShareModel];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __55__HMBCloudZone_Share__revokeShareAccessForParticipant___block_invoke_2;
  v6[3] = &unk_1E69EAF78;
  id v3 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v4 = [v2 flatMap:v6];

  return v4;
}

uint64_t __55__HMBCloudZone_Share__revokeShareAccessForParticipant___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _revokeShareAccessForParticipant:*(void *)(a1 + 40) usingShare:a2];
}

- (id)_setWriteAccessEnabled:(BOOL)a3 forParticipant:(id)a4 usingShare:(id)a5
{
  BOOL v6 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1D944CB30]();
  uint64_t v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    long long v14 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    uint64_t v38 = v13;
    __int16 v39 = 2112;
    id v40 = v14;
    __int16 v41 = 2112;
    id v42 = v8;
    _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_INFO, "%{public}@Setting write access enabled to %@ for participant: %@", buf, 0x20u);
  }
  uint64_t v15 = [v9 participants];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __72__HMBCloudZone_Share___setWriteAccessEnabled_forParticipant_usingShare___block_invoke;
  v35[3] = &unk_1E69EB090;
  id v16 = v8;
  id v36 = v16;
  uint64_t v17 = objc_msgSend(v15, "na_firstObjectPassingTest:", v35);

  if (!v17)
  {
    uint64_t v25 = (void *)MEMORY[0x1D944CB30]();
    id v26 = v11;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      __int16 v29 = [v9 participants];
      *(_DWORD *)buf = 138543874;
      uint64_t v38 = v28;
      __int16 v39 = 2112;
      id v40 = v16;
      __int16 v41 = 2112;
      id v42 = v29;
      _os_log_impl(&dword_1D4693000, v27, OS_LOG_TYPE_ERROR, "%{public}@Could not find CKShareParticipant for participant %@. All CKShareParticipants: %@", buf, 0x20u);
    }
    __int16 v30 = (void *)MEMORY[0x1E4F7A0D8];
    id v31 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    uint64_t v32 = [v30 futureWithError:v31];
    goto LABEL_15;
  }
  if (v6) {
    uint64_t v18 = 3;
  }
  else {
    uint64_t v18 = 2;
  }
  if ([v17 permission] != v18)
  {
    [v17 setPermission:v18];
    id v31 = [(HMBCloudZone *)v11 _pushUpdatedShare:v9];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __72__HMBCloudZone_Share___setWriteAccessEnabled_forParticipant_usingShare___block_invoke_74;
    v34[3] = &unk_1E69EAF50;
    v34[4] = v11;
    uint64_t v32 = [v31 flatMap:v34];
LABEL_15:
    BOOL v24 = (void *)v32;

    goto LABEL_16;
  }
  uint64_t v19 = (void *)MEMORY[0x1D944CB30]();
  char v20 = v11;
  __int16 v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    int v22 = HMFGetLogIdentifier();
    [v17 permission];
    id v23 = CKStringFromParticipantPermission();
    *(_DWORD *)buf = 138543618;
    uint64_t v38 = v22;
    __int16 v39 = 2112;
    id v40 = v23;
    _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_INFO, "%{public}@Not setting write access enabled because participant's permission is already %@", buf, 0x16u);
  }
  BOOL v24 = [MEMORY[0x1E4F7A0D8] futureWithResult:v9];
LABEL_16:

  return v24;
}

uint64_t __72__HMBCloudZone_Share___setWriteAccessEnabled_forParticipant_usingShare___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 ckShareParticipant];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

id __72__HMBCloudZone_Share___setWriteAccessEnabled_forParticipant_usingShare___block_invoke_74(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  BOOL v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully pushed changes for participant write access update", (uint8_t *)&v10, 0xCu);
  }
  id v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v8;
}

- (id)setWriteAccessEnabled:(BOOL)a3 forParticipant:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__HMBCloudZone_Share__setWriteAccessEnabled_forParticipant___block_invoke;
  v10[3] = &unk_1E69EB068;
  BOOL v12 = a3;
  void v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(HMBCloudZone *)self _addShareOperationAfterStartupWithName:@"Set Write Access Enabled" block:v10];

  return v8;
}

id __60__HMBCloudZone_Share__setWriteAccessEnabled_forParticipant___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _createShareModel];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HMBCloudZone_Share__setWriteAccessEnabled_forParticipant___block_invoke_2;
  v7[3] = &unk_1E69EB040;
  id v3 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  char v9 = *(unsigned char *)(a1 + 48);
  id v8 = v3;
  id v4 = [v2 flatMap:v7];
  id v5 = [v4 flatMap:&__block_literal_global_73];

  return v5;
}

uint64_t __60__HMBCloudZone_Share__setWriteAccessEnabled_forParticipant___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setWriteAccessEnabled:*(unsigned __int8 *)(a1 + 48) forParticipant:*(void *)(a1 + 40) usingShare:a2];
}

uint64_t __60__HMBCloudZone_Share__setWriteAccessEnabled_forParticipant___block_invoke_3()
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (id)_fetchInvitationWithContext:(id)a3 usingShare:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D944CB30]();
  char v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching invitation with context: %@", buf, 0x16u);
  }
  BOOL v12 = [(HMBCloudZone *)v9 cloudZoneID];
  BOOL v13 = [v12 scope] == 2;

  if (v13)
  {
    long long v14 = [v6 participantClientIdentifier];
    id v15 = [(HMBCloudZone *)v9 participantWithClientIdentifier:v14];

    if (!v15) {
      goto LABEL_23;
    }
    id v16 = v6;
    uint64_t v17 = [v15 ckShareParticipant];
    int v18 = [v17 permission] != 3;

    LODWORD(v17) = [v16 shouldGrantWriteAccess];
    if (v18 != v17)
    {
      if ([v15 hasAccepted])
      {
        uint64_t v19 = (void *)MEMORY[0x1D944CB30]();
        char v20 = v9;
        __int16 v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          int v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v22;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v15;
          _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_ERROR, "%{public}@Asked to fetch an invitation for client identifier corresponding to participant that has already accepted: %@", buf, 0x16u);
        }
        id v23 = (void *)MEMORY[0x1E4F7A0D8];
        BOOL v24 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:1];
        uint64_t v25 = [v23 futureWithError:v24];

        goto LABEL_24;
      }
      uint64_t v38 = [v15 pendingInvitation];
      __int16 v39 = (void *)MEMORY[0x1D944CB30]();
      id v40 = v9;
      __int16 v41 = HMFGetOSLogHandle();
      BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
      if (v38)
      {
        if (v42)
        {
          uint64_t v43 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v43;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v38;
          _os_log_impl(&dword_1D4693000, v41, OS_LOG_TYPE_INFO, "%{public}@Returning existing pending invitation: %@", buf, 0x16u);
        }
        uint64_t v25 = [MEMORY[0x1E4F7A0D8] futureWithResult:v38];

        goto LABEL_24;
      }
      if (v42)
      {
        id v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v44;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        _os_log_impl(&dword_1D4693000, v41, OS_LOG_TYPE_INFO, "%{public}@Participant already exists that has not accepted but has no pending invitation: %@", buf, 0x16u);
      }
LABEL_23:
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      long long v67 = __Block_byref_object_copy__6289;
      id v68 = __Block_byref_object_dispose__6290;
      id v69 = 0;
      v62[0] = 0;
      v62[1] = v62;
      v62[2] = 0x3032000000;
      v62[3] = __Block_byref_object_copy__6289;
      v62[4] = __Block_byref_object_dispose__6290;
      id v63 = 0;
      id v45 = [(HMBCloudZone *)v9 cloudDatabase];
      id v46 = [v6 lookupInfo];
      uint64_t v47 = [v45 fetchParticipantWithLookupInfo:v46];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke_64;
      v57[3] = &unk_1E69EAFA0;
      id v61 = buf;
      id v48 = v6;
      id v58 = v48;
      id v59 = v9;
      id v60 = v7;
      long long v49 = [v47 flatMap:v57];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke_2;
      v53[3] = &unk_1E69EAFF0;
      v53[4] = v9;
      long long v55 = buf;
      __int16 v56 = v62;
      id v54 = v48;
      long long v50 = [v49 flatMap:v53];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke_68;
      v52[3] = &unk_1E69EB018;
      v52[4] = v62;
      uint64_t v25 = [v50 flatMap:v52];

      _Block_object_dispose(v62, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_24;
    }
    id v31 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v32 = v9;
    uint64_t v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      id v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v34;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      long long v67 = (uint64_t (*)(uint64_t, uint64_t))v16;
      _os_log_impl(&dword_1D4693000, v33, OS_LOG_TYPE_INFO, "%{public}@Configuring existing participant %@ for the requested invitation context: %@", buf, 0x20u);
    }
    __int16 v35 = v32;
    id v15 = v15;
    id v36 = v7;
    uint64_t v37 = -[HMBCloudZone _setWriteAccessEnabled:forParticipant:usingShare:](v35, "_setWriteAccessEnabled:forParticipant:usingShare:", [v16 shouldGrantWriteAccess], v15, v36);

    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke;
    v64[3] = &unk_1E69EAF78;
    void v64[4] = v35;
    id v65 = v16;
    uint64_t v25 = [v37 flatMap:v64];
  }
  else
  {
    id v26 = (void *)MEMORY[0x1D944CB30]();
    id v27 = v9;
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v29;
      _os_log_impl(&dword_1D4693000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch an invitation on non-private zone", buf, 0xCu);
    }
    __int16 v30 = (void *)MEMORY[0x1E4F7A0D8];
    id v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
    uint64_t v25 = [v30 futureWithError:v15];
  }
LABEL_24:

  return v25;
}

id __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v10 = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_INFO, "%{public}@Fetching invitation again after configuring participant", (uint8_t *)&v10, 0xCu);
  }
  id v8 = [*(id *)(a1 + 32) _fetchInvitationWithContext:*(void *)(a1 + 40) usingShare:v3];

  return v8;
}

id __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke_64(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  id v4 = a2;
  if ([*(id *)(a1 + 32) shouldGrantWriteAccess]) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setPermission:v5];
  id v6 = __addParticipantToShare(*(void **)(a1 + 40), *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(void **)(a1 + 48));

  return v6;
}

id __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [(HMBCloudZoneShareParticipantModel *)v3 participants];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke_3;
  v48[3] = &unk_1E69EAFC8;
  v48[4] = *(void *)(a1 + 48);
  objc_msgSend(v4, "na_firstObjectPassingTest:", v48);
  uint64_t v5 = (HMBCloudZoneShareParticipantModel *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    id v6 = [(HMBCloudZoneShareParticipantModel *)v5 invitationToken];
    if (v6)
    {
      id v7 = [HMBShareInvitation alloc];
      id v8 = [(HMBCloudZoneShareParticipantModel *)v3 URL];
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = [*(id *)(a1 + 32) cloudZoneID];
      uint64_t v11 = [(HMBShareInvitation *)v7 initWithURL:v8 token:v6 context:v9 cloudZoneID:v10];
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      BOOL v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      long long v14 = (void *)MEMORY[0x1D944CB30]();
      id v15 = *(id *)(a1 + 32);
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        int v18 = *(HMBCloudZoneShareParticipantModel **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        long long v50 = v17;
        __int16 v51 = 2112;
        id v52 = v18;
        _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_INFO, "%{public}@Created invitation: %@", buf, 0x16u);
      }
      uint64_t v19 = [HMBShareParticipant alloc];
      char v20 = [*(id *)(a1 + 40) participantClientIdentifier];
      __int16 v21 = [(HMBShareParticipant *)v19 initWithCKShareParticipant:v5 clientIdentifier:v20];

      [(HMBShareParticipant *)v21 setPendingInvitation:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      int v22 = [HMBCloudZoneShareParticipantModel alloc];
      id v23 = [MEMORY[0x1E4F29128] UUID];
      BOOL v24 = [*(id *)(a1 + 32) stateModelID];
      uint64_t v25 = [(HMBModel *)v22 initWithModelID:v23 parentModelID:v24];

      [(HMBCloudZoneShareParticipantModel *)v25 setParticipant:v21];
      id v26 = *(void **)(a1 + 32);
      id v47 = 0;
      id v27 = [v26 encodeRecordFromModel:v25 existingRecord:0 error:&v47];
      id v28 = v47;
      if (v27)
      {
        uint64_t v29 = [*(id *)(a1 + 32) _pushUpdatedShare:v3 participantRecord:v27];
      }
      else
      {
        __int16 v41 = (void *)MEMORY[0x1D944CB30]();
        id v42 = *(id *)(a1 + 32);
        uint64_t v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = id v46 = v41;
          *(_DWORD *)buf = 138543874;
          long long v50 = v44;
          __int16 v51 = 2112;
          id v52 = v25;
          __int16 v53 = 2112;
          id v54 = v28;
          _os_log_impl(&dword_1D4693000, v43, OS_LOG_TYPE_ERROR, "%{public}@Unable to encode participant model %@: %@", buf, 0x20u);

          __int16 v41 = v46;
        }

        uint64_t v29 = [MEMORY[0x1E4F7A0D8] futureWithError:v28];
      }
      __int16 v35 = (void *)v29;
    }
    else
    {
      id v36 = (void *)MEMORY[0x1D944CB30]();
      id v37 = *(id *)(a1 + 32);
      uint64_t v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        __int16 v39 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v50 = v39;
        __int16 v51 = 2112;
        id v52 = v5;
        _os_log_impl(&dword_1D4693000, v38, OS_LOG_TYPE_ERROR, "%{public}@Unable to find invitation token on share participant %@", buf, 0x16u);
      }
      id v40 = (void *)MEMORY[0x1E4F7A0D8];
      __int16 v21 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
      __int16 v35 = [v40 futureWithError:v21];
    }
  }
  else
  {
    __int16 v30 = (void *)MEMORY[0x1D944CB30]();
    id v31 = *(id *)(a1 + 32);
    uint64_t v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v50 = v33;
      __int16 v51 = 2112;
      id v52 = v3;
      _os_log_impl(&dword_1D4693000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to find updated share participant on share %@", buf, 0x16u);
    }
    id v34 = (void *)MEMORY[0x1E4F7A0D8];
    id v6 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    __int16 v35 = [v34 futureWithError:v6];
  }

  return v35;
}

uint64_t __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke_68(uint64_t a1)
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

uint64_t __62__HMBCloudZone_Share___fetchInvitationWithContext_usingShare___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

- (id)fetchInvitationWithContext:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __50__HMBCloudZone_Share__fetchInvitationWithContext___block_invoke;
  v8[3] = &unk_1E69EB530;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(HMBCloudZone *)self _addShareOperationAfterStartupWithName:@"Fetch Invitation" block:v8];

  return v6;
}

id __50__HMBCloudZone_Share__fetchInvitationWithContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _createShareModel];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __50__HMBCloudZone_Share__fetchInvitationWithContext___block_invoke_2;
  v6[3] = &unk_1E69EAF78;
  id v3 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v4 = [v2 flatMap:v6];

  return v4;
}

uint64_t __50__HMBCloudZone_Share__fetchInvitationWithContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _fetchInvitationWithContext:*(void *)(a1 + 40) usingShare:a2];
}

- (id)fetchCloudShareIDForShareParticipantClientIdentifier:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __76__HMBCloudZone_Share__fetchCloudShareIDForShareParticipantClientIdentifier___block_invoke;
  v8[3] = &unk_1E69EB530;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(HMBCloudZone *)self _addShareOperationAfterStartupWithName:@"Fetch Cloud Share ID For Client Identifier" block:v8];

  return v6;
}

id __76__HMBCloudZone_Share__fetchCloudShareIDForShareParticipantClientIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _createShareModel];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __76__HMBCloudZone_Share__fetchCloudShareIDForShareParticipantClientIdentifier___block_invoke_2;
  v6[3] = &unk_1E69EAF78;
  id v3 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v4 = [v2 flatMap:v6];

  return v4;
}

id __76__HMBCloudZone_Share__fetchCloudShareIDForShareParticipantClientIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) participantWithClientIdentifier:*(void *)(a1 + 40)];
  id v5 = v4;
  if (!v4)
  {
    id v9 = (void *)MEMORY[0x1D944CB30]();
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      BOOL v13 = *(void **)(a1 + 40);
      int v23 = 138543618;
      BOOL v24 = v12;
      __int16 v25 = 2112;
      id v26 = v13;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_ERROR, "%{public}@No participant was found with client identifier: %@", (uint8_t *)&v23, 0x16u);
    }
    long long v14 = (void *)MEMORY[0x1E4F7A0D8];
    id v7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    uint64_t v8 = [v14 futureWithError:v7];
    goto LABEL_7;
  }
  uint64_t v6 = [v4 cloudShareID];
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v6];
LABEL_7:
    id v15 = (void *)v8;
    goto LABEL_11;
  }
  id v16 = (void *)MEMORY[0x1D944CB30]();
  id v17 = *(id *)(a1 + 32);
  int v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    int v23 = 138543618;
    BOOL v24 = v19;
    __int16 v25 = 2112;
    id v26 = v5;
    _os_log_impl(&dword_1D4693000, v18, OS_LOG_TYPE_ERROR, "%{public}@No cloud share ID was found for participant: %@", (uint8_t *)&v23, 0x16u);
  }
  char v20 = (void *)MEMORY[0x1E4F7A0D8];
  __int16 v21 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
  id v15 = [v20 futureWithError:v21];

  id v7 = 0;
LABEL_11:

  return v15;
}

- (id)fetchCurrentParticipantCloudShareID
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__HMBCloudZone_Share__fetchCurrentParticipantCloudShareID__block_invoke;
  v4[3] = &unk_1E69EAE10;
  v4[4] = self;
  id v2 = [(HMBCloudZone *)self _addShareOperationAfterStartupWithName:@"Fetch Current Participant Cloud Share ID" block:v4];
  return v2;
}

id __58__HMBCloudZone_Share__fetchCurrentParticipantCloudShareID__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _createShareModel];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__HMBCloudZone_Share__fetchCurrentParticipantCloudShareID__block_invoke_2;
  v5[3] = &unk_1E69EAF50;
  v5[4] = *(void *)(a1 + 32);
  id v3 = [v2 flatMap:v5];

  return v3;
}

id __58__HMBCloudZone_Share__fetchCurrentParticipantCloudShareID__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 currentUserParticipant];
  id v5 = [v4 userIdentity];
  uint64_t v6 = [v5 userRecordID];

  if (v6)
  {
    id v7 = [[HMBShareUserID alloc] initWithUserRecordID:v6];
    uint64_t v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v7];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D944CB30]();
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v16 = 138543618;
      id v17 = v12;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_ERROR, "%{public}@No current participant record ID found on cloud zone share: %@", (uint8_t *)&v16, 0x16u);
    }
    BOOL v13 = (void *)MEMORY[0x1E4F7A0D8];
    id v7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    uint64_t v8 = [v13 futureWithError:v7];
  }
  long long v14 = (void *)v8;

  return v14;
}

- (id)fetchOwnerParticipantCloudShareID
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__HMBCloudZone_Share__fetchOwnerParticipantCloudShareID__block_invoke;
  v4[3] = &unk_1E69EAE10;
  v4[4] = self;
  id v2 = [(HMBCloudZone *)self _addShareOperationAfterStartupWithName:@"Fetch Owner Participant Cloud Share ID" block:v4];
  return v2;
}

id __56__HMBCloudZone_Share__fetchOwnerParticipantCloudShareID__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _createShareModel];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__HMBCloudZone_Share__fetchOwnerParticipantCloudShareID__block_invoke_2;
  v5[3] = &unk_1E69EAF50;
  v5[4] = *(void *)(a1 + 32);
  id v3 = [v2 flatMap:v5];

  return v3;
}

id __56__HMBCloudZone_Share__fetchOwnerParticipantCloudShareID__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 owner];
  id v5 = [v4 userIdentity];
  uint64_t v6 = [v5 userRecordID];

  if (v6)
  {
    id v7 = [[HMBShareUserID alloc] initWithUserRecordID:v6];
    uint64_t v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v7];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D944CB30]();
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v16 = 138543618;
      id v17 = v12;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_ERROR, "%{public}@No owner record ID found on cloud zone share: %@", (uint8_t *)&v16, 0x16u);
    }
    BOOL v13 = (void *)MEMORY[0x1E4F7A0D8];
    id v7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    uint64_t v8 = [v13 futureWithError:v7];
  }
  long long v14 = (void *)v8;

  return v14;
}

- (id)cloudFieldForEncoding:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"k%02lu", a3);
}

- (id)cloudMetadataForModel:(id)a3 usingEncoding:(unint64_t)a4
{
  v15[5] = *MEMORY[0x1E4F143B8];
  v14[0] = @"HM.device";
  id v6 = a3;
  id v7 = [(HMBCloudZone *)self deviceIdentifier];
  v15[0] = v7;
  v14[1] = @"HM.encoding";
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  v15[1] = v8;
  v14[2] = @"HM.type";
  id v9 = [v6 hmbType];
  v15[2] = v9;
  v14[3] = @"HM.modelID";
  id v10 = [v6 hmbModelID];
  v15[3] = v10;
  void v14[4] = @"HM.parentModelID";
  uint64_t v11 = [v6 hmbParentModelID];

  v15[4] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];

  return v12;
}

- (BOOL)populateV4CloudRecord:(id)a3 withModel:(id)a4 metadataFieldData:(id)a5 startEncoding:(unint64_t)a6 endEncoding:(unint64_t)a7 encodingContext:(id)a8 error:(id *)a9
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v43 = a4;
  id v41 = a5;
  id v42 = a8;
  int v16 = [(HMBCloudZone *)self cloudDatabase];
  if (a6 >= 2)
  {
    uint64_t v17 = 1;
    do
    {
      __int16 v18 = objc_msgSend(NSString, "stringWithFormat:", @"k%02lu", v17);
      id v19 = [v16 configuration];
      objc_msgSend(v15, "hmbSetObject:forKey:encrypted:", 0, v18, objc_msgSend(v19, "isManateeContainer"));

      ++v17;
    }
    while (a6 != v17);
  }
  if (a6 >= a7)
  {
    id v21 = 0;
LABEL_10:
    uint64_t v29 = [v16 configuration];
    __int16 v30 = v41;
    objc_msgSend(v15, "hmbSetObject:forKey:encrypted:", v41, @"k00", objc_msgSend(v29, "isManateeContainer"));

    BOOL v20 = 1;
  }
  else
  {
    __int16 v39 = self;
    BOOL v20 = 0;
    id v21 = 0;
    while (1)
    {
      int v22 = v21;
      int v23 = [v42 modelContainer];
      BOOL v24 = [MEMORY[0x1E4F1CAD0] set];
      id v44 = v21;
      __int16 v25 = [v23 dataFromModel:v43 encoding:a6 storageLocation:1 updatedModelIDs:v24 error:&v44];
      id v21 = v44;

      if (!v25) {
        break;
      }
      id v26 = objc_msgSend(NSString, "stringWithFormat:", @"k%02lu", a6);
      uint64_t v27 = [v25 hmbCompress];
      id v28 = [v16 configuration];
      objc_msgSend(v15, "hmbSetObject:forKey:encrypted:", v27, v26, objc_msgSend(v28, "isManateeContainer"));

      BOOL v20 = ++a6 >= a7;
      if (a7 == a6) {
        goto LABEL_10;
      }
    }
    id v31 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v32 = v39;
    uint64_t v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      id v34 = HMFGetLogIdentifier();
      [v43 hmbCanonicalType];
      __int16 v35 = v40 = v31;
      id v36 = [v43 hmbModelID];
      id v37 = [v36 UUIDString];
      *(_DWORD *)buf = 138544130;
      id v46 = v34;
      __int16 v47 = 2112;
      id v48 = v35;
      __int16 v49 = 2112;
      long long v50 = v37;
      __int16 v51 = 2112;
      id v52 = v21;
      _os_log_impl(&dword_1D4693000, v33, OS_LOG_TYPE_ERROR, "%{public}@Unable to encode model (%@.%@): %@", buf, 0x2Au);

      id v31 = v40;
    }

    if (a9)
    {
      id v21 = v21;
      *a9 = v21;
    }
    __int16 v30 = v41;
  }

  return v20;
}

@end