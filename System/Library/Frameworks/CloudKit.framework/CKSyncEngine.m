@interface CKSyncEngine
+ (void)unregisterActivitiesWithDatabase:(id)a3 ignoringSystemConditions:(BOOL)a4;
- (BOOL)automaticSyncingEnabled;
- (BOOL)hasPendingModifications;
- (BOOL)needsToReloadAccount;
- (BOOL)useOpportunisticPushTopic;
- (CKDatabase)database;
- (CKSyncEngine)init;
- (CKSyncEngine)initWithConfiguration:(CKSyncEngineConfiguration *)configuration;
- (CKSyncEngine)initWithDeprecatedConfiguration:(id)a3;
- (CKSyncEngineDataSource)dataSource;
- (CKSyncEngineState)state;
- (NSArray)recordIDsToDelete;
- (NSArray)recordIDsToSave;
- (NSString)description;
- (NSString)syncActivityIdentifier;
- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4;
- (void)addRecordZonesToSave:(id)a3 recordZoneIDsToDelete:(id)a4;
- (void)cancelOperationsWithCompletionHandler:(void *)completionHandler;
- (void)fetchChangesForZoneIDs:(id)a3 completionHandler:(id)a4;
- (void)fetchChangesWithCompletionHandler:(void *)completionHandler;
- (void)fetchChangesWithOptions:(CKSyncEngineFetchChangesOptions *)options completionHandler:(void *)completionHandler;
- (void)modifyPendingChangesInZoneIDs:(id)a3 completionHandler:(id)a4;
- (void)removeRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4;
- (void)removeRecordZonesToSave:(id)a3 recordZoneIDsToDelete:(id)a4;
- (void)scheduleSync;
- (void)sendChangesWithCompletionHandler:(void *)completionHandler;
- (void)sendChangesWithOptions:(CKSyncEngineSendChangesOptions *)options completionHandler:(void *)completionHandler;
- (void)setAutomaticSyncingEnabled:(BOOL)a3;
- (void)setNeedsToDeleteRecordZones:(id)a3 needsToDelete:(BOOL)a4;
- (void)setNeedsToDeleteRecords:(id)a3 needsToDelete:(BOOL)a4;
- (void)setNeedsToFetchChanges;
- (void)setNeedsToReloadAccount:(BOOL)a3;
- (void)setNeedsToSaveRecordZones:(id)a3 needsToSave:(BOOL)a4;
- (void)setNeedsToSaveRecords:(id)a3 needsToSave:(BOOL)a4;
- (void)unregisterActivities;
@end

@implementation CKSyncEngine

- (void)sendChangesWithOptions:(CKSyncEngineSendChangesOptions *)options completionHandler:(void *)completionHandler
{
  v6 = (uint64_t (*)())_Block_copy(completionHandler);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = sub_18AF20004;
  }
  v7 = options;
  v8 = self;
  sub_18AF42BDC();
  sub_18AF1E758((uint64_t)v6);
}

- (void)fetchChangesWithOptions:(CKSyncEngineFetchChangesOptions *)options completionHandler:(void *)completionHandler
{
  v6 = (uint64_t (*)())_Block_copy(completionHandler);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = sub_18AF20004;
  }
  v7 = options;
  v8 = self;
  sub_18AF42BDC();
  sub_18AF1E758((uint64_t)v6);
}

- (CKSyncEngineState)state
{
  v2 = self;
  id v3 = sub_18AF2A258();

  return (CKSyncEngineState *)v3;
}

- (void)addRecordZonesToSave:(id)a3 recordZoneIDsToDelete:(id)a4
{
}

- (void)modifyPendingChangesInZoneIDs:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (a3)
  {
    sub_18AF34EA0(0, (unint64_t *)&qword_1EB279460);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v7 = sub_18AF20008;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_18AF1BC8C();
  sub_18AF1E758((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (CKSyncEngineDataSource)dataSource
{
  v2 = self;
  id v3 = sub_18AF4846C();

  return (CKSyncEngineDataSource *)v3;
}

- (CKSyncEngine)initWithConfiguration:(CKSyncEngineConfiguration *)configuration
{
  return (CKSyncEngine *)sub_18AF6A60C(configuration);
}

- (NSString)description
{
  return (NSString *)sub_18AF6BD38(self, (uint64_t)a2, (uint64_t (*)(void))CKSyncEngine.description.getter);
}

- (CKDatabase)database
{
  v2 = self;
  id v3 = sub_18AF6A90C();

  return (CKDatabase *)v3;
}

- (void)cancelOperationsWithCompletionHandler:(void *)completionHandler
{
  v4 = _Block_copy(completionHandler);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    v5 = sub_18AF71DE4;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_18AF6AC38();
  sub_18AF1E758((uint64_t)v5);
}

- (void)fetchChangesWithCompletionHandler:(void *)completionHandler
{
  v4 = _Block_copy(completionHandler);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    v5 = sub_18AF20004;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_18AF6AC38();
  sub_18AF1E758((uint64_t)v5);
}

- (void)sendChangesWithCompletionHandler:(void *)completionHandler
{
  v4 = _Block_copy(completionHandler);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    v5 = sub_18AF20004;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_18AF6B220();
  sub_18AF1E758((uint64_t)v5);
}

- (CKSyncEngine)init
{
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

- (void)setNeedsToFetchChanges
{
  v2 = self;
  sub_18AF6B834();
}

- (BOOL)automaticSyncingEnabled
{
  v2 = self;
  char v3 = sub_18AF6BB28(sub_18AF38A9C);

  return v3 & 1;
}

- (void)setAutomaticSyncingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_18AF6BBD0(v3, (void (*)(uint64_t))sub_18AFE6150);
}

- (BOOL)needsToReloadAccount
{
  v2 = self;
  char v3 = sub_18AF6BB28(sub_18AF3A69C);

  return v3 & 1;
}

- (void)setNeedsToReloadAccount:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_18AF6BBD0(v3, (void (*)(uint64_t))sub_18AFE0608);
}

- (void)unregisterActivities
{
  v2 = self;
  sub_18AF6BC24();
}

+ (void)unregisterActivitiesWithDatabase:(id)a3 ignoringSystemConditions:(BOOL)a4
{
  id v4 = a3;
  sub_18AF6BCA8();
}

- (NSString)syncActivityIdentifier
{
  return (NSString *)sub_18AF6BD38(self, (uint64_t)a2, sub_18AF6BDA8);
}

- (BOOL)useOpportunisticPushTopic
{
  v2 = self;
  char v3 = sub_18AF6BE24();

  return v3 & 1;
}

- (CKSyncEngine)initWithDeprecatedConfiguration:(id)a3
{
  return (CKSyncEngine *)sub_18AF6D91C(a3);
}

- (NSArray)recordIDsToSave
{
  return (NSArray *)sub_18AF6DF3C(self, (uint64_t)a2, sub_18AF6D99C);
}

- (NSArray)recordIDsToDelete
{
  return (NSArray *)sub_18AF6DF3C(self, (uint64_t)a2, sub_18AF6DFB8);
}

- (BOOL)hasPendingModifications
{
  v2 = self;
  char v3 = sub_18AF6E1FC();

  return v3 & 1;
}

- (void)fetchChangesForZoneIDs:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (a3)
  {
    sub_18AF34EA0(0, (unint64_t *)&qword_1EB279460);
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v8 = sub_18AF20008;
  }
  else
  {
    v8 = 0;
    uint64_t v7 = 0;
  }
  v9 = self;
  sub_18AF6E364((uint64_t)a3, (uint64_t)v8, v7);
  sub_18AF1E758((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4
{
}

- (void)removeRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4
{
}

- (void)removeRecordZonesToSave:(id)a3 recordZoneIDsToDelete:(id)a4
{
}

- (void)setNeedsToSaveRecords:(id)a3 needsToSave:(BOOL)a4
{
}

- (void)setNeedsToDeleteRecords:(id)a3 needsToDelete:(BOOL)a4
{
}

- (void)setNeedsToSaveRecordZones:(id)a3 needsToSave:(BOOL)a4
{
}

- (void)setNeedsToDeleteRecordZones:(id)a3 needsToDelete:(BOOL)a4
{
}

- (void)scheduleSync
{
  v2 = self;
  sub_18AF6FB54();
}

@end