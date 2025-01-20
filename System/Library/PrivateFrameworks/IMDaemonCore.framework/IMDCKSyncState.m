@interface IMDCKSyncState
+ (id)logHandle;
+ (void)removeBuildObjectsFromDict:(id)a3;
- (BOOL)_shouldReportNewUserIfCreatedChatZones:(BOOL)a3 deletedZones:(BOOL)a4;
- (BOOL)createdChatZone;
- (BOOL)deletedZones;
- (BOOL)hasAvailableRecordsToDownload;
- (BOOL)isDisablingDevices;
- (BOOL)isEligibleForTruthZone;
- (BOOL)isFeatureEnabled;
- (BOOL)isInExitState;
- (BOOL)isRemovedFromBackup;
- (BOOL)isStartingEnabledSettingChange;
- (BOOL)isStartingInitialSyncSetByCloudKitHooks;
- (BOOL)isStartingPeriodicSyncSetByCloudKitHooks;
- (BOOL)isSyncing;
- (BOOL)isSyncingEnabled;
- (BOOL)isSyncingPaused;
- (BOOL)syncCancelled;
- (IMDCKSyncState)init;
- (IMDCKSyncState)initWithKeyValueCollection:(id)a3;
- (IMDCKSyncStateDelegate)delegate;
- (IMKeyValueCollection)keyValueCollection;
- (NSArray)syncErrors;
- (NSDate)exitDate;
- (NSDate)lastSyncDate;
- (NSDictionary)analyticSyncDatesDictionary;
- (NSDictionary)syncStatistics;
- (NSString)description;
- (NSString)micDeviceIdentifier;
- (NSString)syncSessionID;
- (double)lastDownloadProgress;
- (id)_describeErrors:(id)a3;
- (id)describeErrors;
- (id)describeRecordCounts;
- (id)getAnalyticSyncDatesObjectForKey:(id)a3;
- (id)logHandle;
- (id)serializedRepresentation;
- (id)syncReportDictionary;
- (id)syncReportDictionaryForAttempt:(unint64_t)a3 withSuccess:(BOOL)a4 duration:(double)a5;
- (id)syncUserType;
- (int64_t)accountStatus;
- (int64_t)syncControllerRecordType;
- (int64_t)syncControllerSyncType;
- (unint64_t)syncControllerSyncState;
- (unint64_t)syncJobState;
- (unint64_t)syncStatus;
- (unint64_t)syncType;
- (void)_finishBatchChange;
- (void)_removeObjectForKey:(id)a3 forDictionary:(id)a4;
- (void)_setObject:(id)a3 forKey:(id)a4 forDictionary:(id)a5 shouldSetBuild:(BOOL)a6;
- (void)_setStartingSync;
- (void)_startBatchChange;
- (void)addSyncError:(id)a3;
- (void)broadcastSyncState;
- (void)clearLocalCloudKitSyncState;
- (void)clearSyncErrors;
- (void)clearSyncStateForAllRecordTypes;
- (void)deleteAllCloudKitData;
- (void)keyValueCollection:(id)a3 didUpdateValues:(id)a4;
- (void)keyValueCollection:(id)a3 willUpdateValues:(id)a4;
- (void)removeObjectFromAnalyticSyncDatesDictionaryForKey:(id)a3;
- (void)setAccountStatus:(int64_t)a3;
- (void)setAnalyticSyncDatesDictionary:(id)a3;
- (void)setAnalyticSyncDatesDictionaryObject:(id)a3 forKey:(id)a4 shouldOverrideIfExists:(BOOL)a5;
- (void)setCloudKitSyncStatistics:(id)a3;
- (void)setCreatedChatZone:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeletedZones:(BOOL)a3;
- (void)setDisablingDevices:(BOOL)a3;
- (void)setEligibleForTruthZone:(BOOL)a3;
- (void)setErrorToAccountNeedsRepair;
- (void)setErrorToKeyRollingError;
- (void)setExitDate:(id)a3;
- (void)setFeatureEnabled:(BOOL)a3;
- (void)setHasAvailableRecordsToDownload:(BOOL)a3;
- (void)setInExitState:(BOOL)a3;
- (void)setLastDownloadProgress:(double)a3;
- (void)setLastSyncDate:(id)a3;
- (void)setLastSyncDownloadProgress:(double)a3;
- (void)setMiCDeviceIdentifier:(id)a3;
- (void)setRemovedFromBackup:(BOOL)a3;
- (void)setStartingEnabledSettingChange:(BOOL)a3;
- (void)setStartingInitialSyncSetByCloudKitHooks:(BOOL)a3;
- (void)setStartingInitialSyncWithRecordType:(int64_t)a3;
- (void)setStartingPeriodicSyncSetByCloudKitHooks:(BOOL)a3;
- (void)setStartingPeriodicSyncWithRecordType:(int64_t)a3;
- (void)setSyncCancelled:(BOOL)a3;
- (void)setSyncControllerRecordType:(int64_t)a3;
- (void)setSyncControllerSyncState:(unint64_t)a3;
- (void)setSyncControllerSyncState:(unint64_t)a3 withRecordType:(int64_t)a4;
- (void)setSyncControllerSyncType:(int64_t)a3;
- (void)setSyncJobState:(unint64_t)a3;
- (void)setSyncJobStateWithState:(unint64_t)a3;
- (void)setSyncPhaseType:(unint64_t)a3;
- (void)setSyncSessionID:(id)a3;
- (void)setSyncStarted;
- (void)setSyncStatistics:(id)a3;
- (void)setSyncStatus:(unint64_t)a3;
- (void)setSyncStopped;
- (void)setSyncType:(unint64_t)a3;
- (void)setSyncing:(BOOL)a3;
- (void)setSyncingEnabled:(BOOL)a3;
- (void)setSyncingFinished;
- (void)setSyncingPaused:(BOOL)a3;
- (void)syncReportDictionaryForAttempt:(unint64_t)a3 withSuccess:(BOOL)a4 duration:(double)a5 completion:(id)a6;
- (void)updateSyncType:(unint64_t)a3;
@end

@implementation IMDCKSyncState

- (void)setAccountStatus:(int64_t)a3
{
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setInteger:a3 forKey:*MEMORY[0x1E4F6CE88]];
}

- (void)setEligibleForTruthZone:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setBool:v3 forKey:*MEMORY[0x1E4F6D018]];
}

- (id)logHandle
{
  v2 = objc_opt_class();

  return (id)[v2 logHandle];
}

+ (id)logHandle
{
  if (qword_1EBE2BA68 != -1) {
    dispatch_once(&qword_1EBE2BA68, &unk_1F3390D60);
  }
  v2 = (void *)qword_1EBE2BA58;

  return v2;
}

- (id)serializedRepresentation
{
  v14[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = IMCloudKitGetSyncStateDictionary();
  uint64_t v4 = [(IMDCKSyncState *)self syncStatistics];
  if (v4
    && (v5 = (void *)v4,
        [(IMDCKSyncState *)self syncStatistics],
        v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v5,
        v7))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v13 = *MEMORY[0x1E4F6D108];
    v9 = [(IMDCKSyncState *)self syncStatistics];
    v14[0] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v11 = (void *)[v8 initWithDictionary:v10];
  }
  else
  {
    v11 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  [v11 addEntriesFromDictionary:v3];

  return v11;
}

- (NSDictionary)syncStatistics
{
  return self->_syncStatistics;
}

- (void)broadcastSyncState
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D96887F8;
  block[3] = &unk_1E6B73268;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_startBatchChange
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  [v2 _startBatchWrite];
}

- (void)_finishBatchChange
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  [v2 _commitBatchWrite];
}

- (BOOL)isSyncingEnabled
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F6D170] withDefault:0];

  return v3;
}

- (BOOL)isFeatureEnabled
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F6CFA8] withDefault:0];

  return v3;
}

- (IMKeyValueCollection)keyValueCollection
{
  return self->_storage;
}

- (void)setSyncingPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setBool:v3 forKey:*MEMORY[0x1E4F6D150]];
}

- (void)setSyncingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setBool:v3 forKey:*MEMORY[0x1E4F6D170]];
}

- (void)setRemovedFromBackup:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setBool:v3 forKey:*MEMORY[0x1E4F6D028]];
}

- (void)setSyncPhaseType:(unint64_t)a3
{
}

- (void)setSyncJobStateWithState:(unint64_t)a3
{
}

- (void)setSyncStarted
{
}

- (void)setSyncStopped
{
}

- (void)setCloudKitSyncStatistics:(id)a3
{
}

- (void)setLastSyncDownloadProgress:(double)a3
{
}

- (void)deleteAllCloudKitData
{
  [(IMDCKSyncState *)self setDeletedZones:1];
  BOOL v3 = +[IMDRecordZoneManager sharedInstance];
  [v3 deleteAllZones];

  MEMORY[0x1F4181798](self, sel_clearSyncStateForAllRecordTypes);
}

- (void)clearSyncStateForAllRecordTypes
{
  id v2 = +[IMDCKSyncController sharedInstance];
  [v2 clearLocalCloudKitSyncState];
}

- (IMDCKSyncState)initWithKeyValueCollection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMDCKSyncState;
  v6 = [(IMDCKSyncState *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storage, a3);
    id v8 = [(IMDCKSyncState *)v7 keyValueCollection];
    [v8 setDelegate:v7];
  }
  return v7;
}

- (IMDCKSyncState)init
{
  return 0;
}

- (BOOL)createdChatZone
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F6CEE8] withDefault:0];

  return v3;
}

- (void)setCreatedChatZone:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setBool:v3 forKey:*MEMORY[0x1E4F6CEE8]];
}

- (BOOL)deletedZones
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F6CEE8] withDefault:0];

  return v3;
}

- (void)setDeletedZones:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setBool:v3 forKey:*MEMORY[0x1E4F6CEE8]];
}

- (void)setFeatureEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setBool:v3 forKey:*MEMORY[0x1E4F6CFA8]];
}

- (BOOL)isSyncing
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F6D030] withDefault:0];

  return v3;
}

- (void)setSyncing:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setBool:v3 forKey:*MEMORY[0x1E4F6D030]];
}

- (BOOL)isEligibleForTruthZone
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F6D018] withDefault:0];

  return v3;
}

- (BOOL)isRemovedFromBackup
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F6D028] withDefault:0];

  return v3;
}

- (BOOL)isInExitState
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F6D020] withDefault:0];

  return v3;
}

- (void)setInExitState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setBool:v3 forKey:*MEMORY[0x1E4F6D020]];
}

- (BOOL)isSyncingPaused
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F6D150] withDefault:0];

  return v3;
}

- (BOOL)syncCancelled
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F6D110] withDefault:0];

  return v3;
}

- (void)setSyncCancelled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setBool:v3 forKey:*MEMORY[0x1E4F6D110]];
}

- (BOOL)isDisablingDevices
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F6D0E8] withDefault:0];

  return v3;
}

- (void)setDisablingDevices:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setBool:v3 forKey:*MEMORY[0x1E4F6D0E8]];
}

- (BOOL)isStartingEnabledSettingChange
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F6D0F0] withDefault:0];

  return v3;
}

- (void)setStartingEnabledSettingChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setBool:v3 forKey:*MEMORY[0x1E4F6D0F0]];
}

- (BOOL)isStartingPeriodicSyncSetByCloudKitHooks
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F6D100] withDefault:0];

  return v3;
}

- (void)setStartingPeriodicSyncSetByCloudKitHooks:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setBool:v3 forKey:*MEMORY[0x1E4F6D100]];
}

- (BOOL)isStartingInitialSyncSetByCloudKitHooks
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F6D0F8] withDefault:0];

  return v3;
}

- (void)setStartingInitialSyncSetByCloudKitHooks:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setBool:v3 forKey:*MEMORY[0x1E4F6D0F8]];
}

- (NSDate)exitDate
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  BOOL v3 = [v2 objectForKey:*MEMORY[0x1E4F6CFA0]];

  return (NSDate *)v3;
}

- (void)setExitDate:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDCKSyncState *)self keyValueCollection];
  [v5 setObject:v4 forKey:*MEMORY[0x1E4F6CFA0]];
}

- (NSDate)lastSyncDate
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  BOOL v3 = [v2 objectForKey:*MEMORY[0x1E4F6D130]];

  return (NSDate *)v3;
}

- (void)setLastSyncDate:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDCKSyncState *)self keyValueCollection];
  [v5 setObject:v4 forKey:*MEMORY[0x1E4F6D130]];
}

- (NSDictionary)analyticSyncDatesDictionary
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  BOOL v3 = [v2 objectForKey:*MEMORY[0x1E4F6CE90]];

  return (NSDictionary *)v3;
}

- (void)setAnalyticSyncDatesDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDCKSyncState *)self keyValueCollection];
  [v5 setObject:v4 forKey:*MEMORY[0x1E4F6CE90]];
}

- (NSString)syncSessionID
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  BOOL v3 = [v2 objectForKey:*MEMORY[0x1E4F6D158]];

  return (NSString *)v3;
}

- (void)setSyncSessionID:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDCKSyncState *)self keyValueCollection];
  [v5 setObject:v4 forKey:*MEMORY[0x1E4F6D158]];
}

- (NSString)micDeviceIdentifier
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  BOOL v3 = [v2 objectForKey:*MEMORY[0x1E4F6D080]];

  return (NSString *)v3;
}

- (void)setMiCDeviceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDCKSyncState *)self keyValueCollection];
  [v5 setObject:v4 forKey:*MEMORY[0x1E4F6D080]];
}

- (unint64_t)syncControllerSyncState
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  unint64_t v3 = [v2 integerForKey:*MEMORY[0x1E4F6D120] withDefault:0];

  return v3;
}

- (void)setSyncControllerSyncState:(unint64_t)a3
{
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setInteger:a3 forKey:*MEMORY[0x1E4F6D120]];
}

- (unint64_t)syncType
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  unint64_t v3 = [v2 integerForKey:*MEMORY[0x1E4F6D168] withDefault:0];

  return v3;
}

- (void)setSyncType:(unint64_t)a3
{
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setInteger:a3 forKey:*MEMORY[0x1E4F6D168]];
}

- (unint64_t)syncStatus
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  unint64_t v3 = [v2 integerForKey:*MEMORY[0x1E4F6D160] withDefault:0];

  return v3;
}

- (void)setSyncStatus:(unint64_t)a3
{
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setInteger:a3 forKey:*MEMORY[0x1E4F6D160]];
}

- (unint64_t)syncJobState
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  unint64_t v3 = [v2 integerForKey:*MEMORY[0x1E4F6D148] withDefault:0];

  return v3;
}

- (void)setSyncJobState:(unint64_t)a3
{
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setInteger:a3 forKey:*MEMORY[0x1E4F6D148]];
}

- (int64_t)syncControllerSyncType
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  int64_t v3 = [v2 integerForKey:*MEMORY[0x1E4F6D128] withDefault:0];

  return v3;
}

- (void)setSyncControllerSyncType:(int64_t)a3
{
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setInteger:a3 forKey:*MEMORY[0x1E4F6D128]];
}

- (int64_t)syncControllerRecordType
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  int64_t v3 = [v2 integerForKey:*MEMORY[0x1E4F6D118] withDefault:0];

  return v3;
}

- (void)setSyncControllerRecordType:(int64_t)a3
{
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setInteger:a3 forKey:*MEMORY[0x1E4F6D118]];
}

- (int64_t)accountStatus
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  int64_t v3 = [v2 integerForKey:*MEMORY[0x1E4F6CE88] withDefault:0];

  return v3;
}

- (BOOL)hasAvailableRecordsToDownload
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F6CFE8] withDefault:0];

  return v3;
}

- (void)setHasAvailableRecordsToDownload:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setBool:v3 forKey:*MEMORY[0x1E4F6CFE8]];
}

- (double)lastDownloadProgress
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  [v2 doubleForKey:*MEMORY[0x1E4F6D050] withDefault:0.0];
  double v4 = v3;

  return v4;
}

- (void)setLastDownloadProgress:(double)a3
{
  id v4 = [(IMDCKSyncState *)self keyValueCollection];
  [v4 setDouble:*MEMORY[0x1E4F6D050] forKey:a3];
}

- (NSArray)syncErrors
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  double v3 = [v2 errorArrayForKey:*MEMORY[0x1E4F6D140]];

  return (NSArray *)v3;
}

- (void)clearSyncErrors
{
  id v2 = [(IMDCKSyncState *)self keyValueCollection];
  [v2 removeObjectForKey:*MEMORY[0x1E4F6D140]];
}

- (void)addSyncError:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[IMDCKUtilities sharedInstance];
  v6 = [v5 findRootCauses:v4];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    uint64_t v10 = *MEMORY[0x1E4F6D140];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v13 = [(IMDCKSyncState *)self keyValueCollection];
        [v13 addErrorToArray:v12 forKey:v10];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)_setObject:(id)a3 forKey:(id)a4 forDictionary:(id)a5 shouldSetBuild:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [NSString stringWithFormat:@"%@%@", v10, qword_1EA8C7130];
  uint64_t v13 = [MEMORY[0x1E4F61740] sharedInstance];
  long long v14 = [v13 productBuildVersion];

  if (IMOSLoggingEnabled())
  {
    long long v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Setting object %@ for key %@ in analyticDict.", buf, 0x16u);
    }
  }
  [v11 setObject:v9 forKey:v10];
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      long long v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v18 = v14;
        __int16 v19 = 2112;
        id v20 = v12;
        _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Setting ProductBuildVersion %@ for key %@ in analyticDict.", buf, 0x16u);
      }
    }
    [v11 setObject:v14 forKey:v12];
  }
}

- (void)_removeObjectForKey:(id)a3 forDictionary:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [NSString stringWithFormat:@"%@%@", v5, qword_1EA8C7130];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v10 = v7;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Removing keys %@ %@ from analyticDict.", buf, 0x16u);
    }
  }
  [v6 removeObjectForKey:v5];
  [v6 removeObjectForKey:v7];
}

+ (void)removeBuildObjectsFromDict:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", (unint64_t)(objc_msgSend(v3, "count") + 1) >> 1);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = objc_msgSend(v3, "keyEnumerator", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v10 hasSuffix:qword_1EA8C7130]) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [v3 removeObjectsForKeys:v4];
}

- (void)removeObjectFromAnalyticSyncDatesDictionaryForKey:(id)a3
{
  id v10 = a3;
  if ([v10 length])
  {
    id v4 = [(IMDCKSyncState *)self analyticSyncDatesDictionary];
    id v5 = [v4 objectForKey:v10];

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
      uint64_t v7 = [(IMDCKSyncState *)self analyticSyncDatesDictionary];
      uint64_t v8 = (void *)[v6 initWithDictionary:v7];

      [(IMDCKSyncState *)self _removeObjectForKey:v10 forDictionary:v8];
      id v9 = (void *)[v8 copy];
      [(IMDCKSyncState *)self setAnalyticSyncDatesDictionary:v9];
    }
  }
}

- (void)setAnalyticSyncDatesDictionaryObject:(id)a3 forKey:(id)a4 shouldOverrideIfExists:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      long long v11 = @"NO";
      *(_DWORD *)v23 = 138412802;
      *(void *)&v23[4] = v8;
      *(_WORD *)&v23[12] = 2112;
      if (v5) {
        long long v11 = @"YES";
      }
      *(void *)&v23[14] = v9;
      __int16 v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Request to set analytic sync date for object %@ and key %@ shouldOverrideIfExists %@", v23, 0x20u);
    }
  }
  uint64_t v12 = objc_msgSend(v9, "length", *(_OWORD *)v23);
  if (v8 && v12)
  {
    long long v13 = [(IMDCKSyncState *)self analyticSyncDatesDictionary];
    BOOL v14 = v13 == 0;

    if (v14)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    else
    {
      id v15 = objc_alloc(MEMORY[0x1E4F1CA60]);
      uint64_t v16 = [(IMDCKSyncState *)self analyticSyncDatesDictionary];
      id v17 = (id)[v15 initWithDictionary:v16];

      if (!v5)
      {
        id v18 = [v17 objectForKey:v9];
        BOOL v19 = v18 == 0;

        if (!v19)
        {
LABEL_20:

          goto LABEL_21;
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = NSNumber;
      [v8 timeIntervalSince1970];
      uint64_t v21 = objc_msgSend(v20, "numberWithDouble:");
      if (v21) {
        [(IMDCKSyncState *)self _setObject:v21 forKey:v9 forDictionary:v17 shouldSetBuild:1];
      }
    }
    else
    {
      [(IMDCKSyncState *)self _setObject:v8 forKey:v9 forDictionary:v17 shouldSetBuild:0];
    }
    v22 = (void *)[v17 copy];
    [(IMDCKSyncState *)self setAnalyticSyncDatesDictionary:v22];

    goto LABEL_20;
  }
LABEL_21:
}

- (id)getAnalyticSyncDatesObjectForKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    BOOL v5 = [(IMDCKSyncState *)self analyticSyncDatesDictionary];
    id v6 = [v5 objectForKey:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)describeErrors
{
  id v3 = [(IMDCKSyncState *)self syncErrors];
  id v4 = [(IMDCKSyncState *)self _describeErrors:v3];

  return v4;
}

- (id)_describeErrors:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    objc_msgSend(v4, "appendFormat:", @"Errors(%lu total)", objc_msgSend(v3, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) logString];
          [v4 appendFormat:@"|%@", v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldReportNewUserIfCreatedChatZones:(BOOL)a3 deletedZones:(BOOL)a4
{
  return a3 & ~a4;
}

- (id)syncUserType
{
  if ([(IMDCKSyncState *)self _shouldReportNewUserIfCreatedChatZones:[(IMDCKSyncState *)self createdChatZone] deletedZones:[(IMDCKSyncState *)self deletedZones]])
  {
    return @"NewUser";
  }
  else
  {
    return @"RestoringUser";
  }
}

- (id)syncReportDictionary
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = [(IMDCKSyncState *)self analyticSyncDatesDictionary];
  id v5 = [v3 dictionaryWithDictionary:v4];

  +[IMDCKSyncState removeBuildObjectsFromDict:v5];
  uint64_t v6 = [(IMDCKSyncState *)self syncUserType];
  [v5 setObject:v6 forKey:*MEMORY[0x1E4F6D1A8]];

  uint64_t v7 = [(IMDCKSyncState *)self syncSessionID];

  if (v7)
  {
    uint64_t v8 = [(IMDCKSyncState *)self syncSessionID];
    [v5 setObject:v8 forKey:@"syncSessionID"];
  }
  id v9 = [(IMDCKSyncState *)self micDeviceIdentifier];

  if (v9)
  {
    id v10 = [(IMDCKSyncState *)self micDeviceIdentifier];
    [v5 setObject:v10 forKey:*MEMORY[0x1E4F6D080]];
  }
  long long v11 = [(IMDCKSyncState *)self describeErrors];
  if ([v11 length]) {
    [v5 setObject:v11 forKey:@"syncErrors"];
  }

  return v5;
}

- (id)describeRecordCounts
{
  id v13 = (id)NSString;
  uint64_t v16 = +[IMDCKChatSyncController sharedInstance];
  id v2 = [v16 describeRecordCounts];
  long long v15 = +[IMDCKMessageSyncController sharedInstance];
  id v3 = [v15 describeRecordCounts];
  id v4 = +[IMDCKAttachmentSyncController sharedInstance];
  id v5 = [v4 describeRecordCounts];
  uint64_t v6 = +[IMDCKMessageSyncController sharedInstance];
  uint64_t v7 = [v6 describeRecordCounts];
  uint64_t v8 = +[IMDCKAttachmentSyncController sharedInstance];
  id v9 = [v8 describeRecordCounts];
  id v10 = +[IMDCKRecoverableMessageSyncController sharedInstance];
  long long v11 = [v10 describeRecordCounts];
  id v14 = [v13 stringWithFormat:@"chat %@ init %@ %@ full %@ %@ %@", v2, v3, v5, v7, v9, v11];

  return v14;
}

- (id)syncReportDictionaryForAttempt:(unint64_t)a3 withSuccess:(BOOL)a4 duration:(double)a5
{
  BOOL v6 = a4;
  id v9 = [(IMDCKSyncState *)self syncReportDictionary];
  id v10 = [NSNumber numberWithUnsignedInteger:a3];
  [v9 setObject:v10 forKey:@"syncAttempts"];

  long long v11 = [NSNumber numberWithInt:v6];
  [v9 setObject:v11 forKey:@"syncSuccess"];

  long long v12 = [NSNumber numberWithDouble:a5];
  [v9 setObject:v12 forKey:@"syncDuration"];

  id v13 = [(IMDCKSyncState *)self describeRecordCounts];
  [v9 setObject:v13 forKey:@"syncCounts"];

  id v14 = NSNumber;
  long long v15 = +[IMDCKUtilities sharedInstance];
  uint64_t v16 = objc_msgSend(v14, "numberWithUnsignedInt:", objc_msgSend(v15, "PCSReportManateeStatus"));
  [v9 setObject:v16 forKey:@"pcsStatus"];

  return v9;
}

- (void)syncReportDictionaryForAttempt:(unint64_t)a3 withSuccess:(BOOL)a4 duration:(double)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_1D9712994;
  v28 = sub_1D97129A4;
  id v29 = 0;
  id v29 = [(IMDCKSyncState *)self syncReportDictionary];
  long long v11 = (void *)v25[5];
  long long v12 = [NSNumber numberWithUnsignedInteger:a3];
  [v11 setObject:v12 forKey:@"syncAttempts"];

  id v13 = (void *)v25[5];
  id v14 = [NSNumber numberWithInt:v7];
  [v13 setObject:v14 forKey:@"syncSuccess"];

  long long v15 = (void *)v25[5];
  uint64_t v16 = [NSNumber numberWithDouble:a5];
  [v15 setObject:v16 forKey:@"syncDuration"];

  uint64_t v17 = (void *)v25[5];
  id v18 = [(IMDCKSyncState *)self describeRecordCounts];
  [v17 setObject:v18 forKey:@"syncCounts"];

  BOOL v19 = +[IMDCKUtilities sharedInstance];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1D97129AC;
  v21[3] = &unk_1E6B74E58;
  v23 = &v24;
  id v20 = v10;
  id v22 = v20;
  [v19 PCSReportManateeStatusAsync:v21 timeout:10.0];

  _Block_object_dispose(&v24, 8);
}

- (NSString)description
{
  v35 = NSString;
  v36.receiver = self;
  v36.super_class = (Class)IMDCKSyncState;
  v34 = [(IMDCKSyncState *)&v36 description];
  if ([(IMDCKSyncState *)self isFeatureEnabled]) {
    id v3 = @"YES";
  }
  else {
    id v3 = @"NO";
  }
  v33 = v3;
  if ([(IMDCKSyncState *)self isSyncing]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  v32 = v4;
  if ([(IMDCKSyncState *)self isEligibleForTruthZone]) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  v31 = v5;
  if ([(IMDCKSyncState *)self isSyncingEnabled]) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  v30 = v6;
  if ([(IMDCKSyncState *)self isRemovedFromBackup]) {
    BOOL v7 = @"YES";
  }
  else {
    BOOL v7 = @"NO";
  }
  id v29 = v7;
  if ([(IMDCKSyncState *)self isInExitState]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  v28 = v8;
  v27 = [(IMDCKSyncState *)self exitDate];
  if ([(IMDCKSyncState *)self isDisablingDevices]) {
    id v9 = @"YES";
  }
  else {
    id v9 = @"NO";
  }
  uint64_t v26 = v9;
  id v10 = [(IMDCKSyncState *)self lastSyncDate];
  if ([(IMDCKSyncState *)self isSyncingPaused]) {
    long long v11 = @"YES";
  }
  else {
    long long v11 = @"NO";
  }
  v25 = v11;
  if ([(IMDCKSyncState *)self isStartingEnabledSettingChange]) {
    long long v12 = @"YES";
  }
  else {
    long long v12 = @"NO";
  }
  uint64_t v24 = v12;
  if ([(IMDCKSyncState *)self isSyncingPaused]) {
    id v13 = @"YES";
  }
  else {
    id v13 = @"NO";
  }
  [(IMDCKSyncState *)self syncControllerSyncState];
  v23 = IMStringFromIMCloudKitSyncControllerSyncState();
  [(IMDCKSyncState *)self syncType];
  id v14 = IMStringFromIMCloudKitSyncType();
  [(IMDCKSyncState *)self syncStatus];
  long long v15 = IMStringFromIMCloudKitSyncStatus();
  [(IMDCKSyncState *)self syncJobState];
  uint64_t v16 = IMStringFromIMCloudKitSyncJobState();
  [(IMDCKSyncState *)self syncControllerRecordType];
  uint64_t v17 = IMStringFromIMCloudKitSyncControllerSyncRecordType();
  [(IMDCKSyncState *)self syncControllerSyncType];
  id v18 = IMStringFromIMCloudKitSyncControllerSyncType();
  [(IMDCKSyncState *)self accountStatus];
  BOOL v19 = IMStringFromIMCloudKitAccountStatus();
  id v20 = [(IMDCKSyncState *)self syncErrors];
  objc_msgSend(v35, "stringWithFormat:", @"%@, isFeatureEnabled: %@, isSyncing: %@, isEligibleForTruthzone %@, isSyncingEnabled: %@, isRemovedFromBackup: %@, isInExitState: %@, exitDate: %@, isStartingDisabledDisableDevice: %@, lastSyncDate: %@, isSyncingPaused: %@, startingChangingEnabledSetting: %@, isPaused: %@, syncControllerSyncState: %@, syncType: %@, syncStatus: %@, syncJobState: %@, syncControllerRecordType: %@, syncType: %@, accountStatus: %@, syncErrors: %@", v34, v33, v32, v31, v30, v29, v28, v27, v26, v10, v25, v24, v13, v23, v14, v15,
    v16,
    v17,
    v18,
    v19,
  uint64_t v21 = v20);

  return (NSString *)v21;
}

- (void)setSyncingFinished
{
  id v3 = [(IMDCKSyncState *)self logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "syncing finished", v4, 2u);
  }

  [(IMDCKSyncState *)self _startBatchChange];
  [(IMDCKSyncState *)self setStartingPeriodicSyncSetByCloudKitHooks:0];
  [(IMDCKSyncState *)self setStartingInitialSyncSetByCloudKitHooks:0];
  [(IMDCKSyncState *)self setSyncControllerSyncState:0];
  [(IMDCKSyncState *)self setSyncControllerRecordType:0];
  [(IMDCKSyncState *)self setSyncControllerSyncType:0];
  [(IMDCKSyncState *)self setSyncStatus:0];
  [(IMDCKSyncState *)self setSyncJobState:0];
  [(IMDCKSyncState *)self _finishBatchChange];
}

- (void)clearLocalCloudKitSyncState
{
  id v3 = [(IMDCKSyncState *)self logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "clearing all sync states", v4, 2u);
  }

  [(IMDCKSyncState *)self _startBatchChange];
  [(IMDCKSyncState *)self setSyncControllerSyncState:0];
  [(IMDCKSyncState *)self setSyncControllerRecordType:0];
  [(IMDCKSyncState *)self setSyncStatus:0];
  [(IMDCKSyncState *)self setSyncJobState:0];
  [(IMDCKSyncState *)self setSyncingPaused:0];
  [(IMDCKSyncState *)self setSyncCancelled:0];
  [(IMDCKSyncState *)self setStartingEnabledSettingChange:0];
  [(IMDCKSyncState *)self setDisablingDevices:0];
  [(IMDCKSyncState *)self clearSyncErrors];
  [(IMDCKSyncState *)self setStartingPeriodicSyncSetByCloudKitHooks:0];
  [(IMDCKSyncState *)self setStartingInitialSyncSetByCloudKitHooks:0];
  [(IMDCKSyncState *)self setSyncControllerSyncType:0];
  [(IMDCKSyncState *)self setHasAvailableRecordsToDownload:0];
  [(IMDCKSyncState *)self setLastDownloadProgress:0.0];
  [(IMDCKSyncState *)self _finishBatchChange];
}

- (void)_setStartingSync
{
  [(IMDCKSyncState *)self setStartingPeriodicSyncSetByCloudKitHooks:0];
  [(IMDCKSyncState *)self setStartingInitialSyncSetByCloudKitHooks:0];

  [(IMDCKSyncState *)self clearSyncErrors];
}

- (void)updateSyncType:(unint64_t)a3
{
}

- (void)setStartingPeriodicSyncWithRecordType:(int64_t)a3
{
  id v5 = [(IMDCKSyncState *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Set starting periodic sync", v6, 2u);
  }

  [(IMDCKSyncState *)self _startBatchChange];
  [(IMDCKSyncState *)self _setStartingSync];
  [(IMDCKSyncState *)self setSyncControllerSyncType:2];
  [(IMDCKSyncState *)self setSyncControllerSyncState:1 withRecordType:a3];
  [(IMDCKSyncState *)self _finishBatchChange];
}

- (void)setStartingInitialSyncWithRecordType:(int64_t)a3
{
  id v5 = [(IMDCKSyncState *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Set starting initial sync", v6, 2u);
  }

  [(IMDCKSyncState *)self _startBatchChange];
  [(IMDCKSyncState *)self _setStartingSync];
  [(IMDCKSyncState *)self setSyncControllerSyncType:1];
  [(IMDCKSyncState *)self setSyncControllerSyncState:1 withRecordType:a3];
  [(IMDCKSyncState *)self _finishBatchChange];
}

- (void)setSyncControllerSyncState:(unint64_t)a3 withRecordType:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(IMDCKSyncState *)self logHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = IMStringFromIMCloudKitSyncControllerSyncState();
    id v9 = IMStringFromIMCloudKitSyncControllerSyncRecordType();
    int v10 = 138412546;
    long long v11 = v8;
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Setting controller sync type to %@ for record type: %@", (uint8_t *)&v10, 0x16u);
  }
  [(IMDCKSyncState *)self _startBatchChange];
  [(IMDCKSyncState *)self setStartingPeriodicSyncSetByCloudKitHooks:0];
  [(IMDCKSyncState *)self setStartingInitialSyncSetByCloudKitHooks:0];
  [(IMDCKSyncState *)self setSyncControllerRecordType:a4];
  [(IMDCKSyncState *)self setSyncControllerSyncState:a3];
  [(IMDCKSyncState *)self _finishBatchChange];
}

- (void)keyValueCollection:(id)a3 willUpdateValues:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = [(IMDCKSyncState *)self logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1D98FFE80((uint64_t)v5, v6);
  }

  BOOL v7 = [(IMDCKSyncState *)self isSyncing];
  uint64_t v8 = [v5 objectForKey:*MEMORY[0x1E4F6D170]];

  if (v8)
  {
    LODWORD(v9) = [(IMDCKSyncState *)self isSyncingEnabled];
  }
  else
  {
    int v10 = +[IMDCKUtilities sharedInstance];
    uint64_t v9 = [v10 cloudKitSyncingEnabled];

    [(IMDCKSyncState *)self setSyncingEnabled:v9];
  }
  long long v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v12 = [v11 isMessagesIniCloudVersion2];

  if (v12)
  {
    if (v9)
    {
      unint64_t v13 = [(IMDCKSyncState *)self syncStatus];
      goto LABEL_11;
    }
  }
  else if (v9)
  {
    unint64_t v13 = [(IMDCKSyncState *)self syncControllerSyncState];
LABEL_11:
    BOOL v14 = v13 != 0;
    if (v7 == v14) {
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  if (!v7) {
    goto LABEL_20;
  }
  BOOL v14 = 0;
LABEL_15:
  [(IMDCKSyncState *)self setSyncing:v14];
  [(IMDCKSyncState *)self setStartingPeriodicSyncSetByCloudKitHooks:0];
  [(IMDCKSyncState *)self setStartingInitialSyncSetByCloudKitHooks:0];
  long long v15 = [(IMDCKSyncState *)self logHandle];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = @"NO";
    if (v14) {
      uint64_t v16 = @"YES";
    }
    int v20 = 138412290;
    uint64_t v21 = v16;
    _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Updating syncing to: %@", (uint8_t *)&v20, 0xCu);
  }

LABEL_20:
  uint64_t v17 = [(IMDCKSyncState *)self delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    BOOL v19 = [(IMDCKSyncState *)self delegate];
    [v19 syncStateWillUpdate:self];
  }
  [(IMDCKSyncState *)self setStartingEnabledSettingChange:0];
}

- (void)keyValueCollection:(id)a3 didUpdateValues:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(IMDCKSyncState *)self logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1D98FFEF8((uint64_t)v5, v6);
  }

  BOOL v7 = [(IMDCKSyncState *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(IMDCKSyncState *)self delegate];
    [v9 syncStateDidUpdate:self];
  }
  [(IMDCKSyncState *)self broadcastSyncState];
}

- (void)setErrorToAccountNeedsRepair
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(IMDCKSyncState *)self logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)char v8 = 0;
    _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Account in need of repair detected, setting sync error", v8, 2u);
  }

  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F6D138];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = @"Account needs repair";
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  BOOL v7 = [v4 errorWithDomain:v5 code:3 userInfo:v6];
  [(IMDCKSyncState *)self addSyncError:v7];
}

- (void)setErrorToKeyRollingError
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(IMDCKSyncState *)self logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)char v8 = 0;
    _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Account in need of repair detected, setting sync error", v8, 2u);
  }

  id v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F6D138];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = @"Account needs repair";
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  BOOL v7 = [v4 errorWithDomain:v5 code:6 userInfo:v6];
  [(IMDCKSyncState *)self addSyncError:v7];
}

- (IMDCKSyncStateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMDCKSyncStateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSyncStatistics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncStatistics, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_storage, 0);
}

@end