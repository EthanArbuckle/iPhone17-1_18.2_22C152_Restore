@interface ADCloudKitAccountStatusMirroredStore
- (ADCloudKitAccountStatusMirroredStore)init;
- (BOOL)cloudSyncEnabled;
- (BOOL)dataStoreIsOnSharedDatabase;
- (BOOL)dataStoreShouldMirrorData;
- (BOOL)hasSetUpRecordZoneSubscription;
- (BOOL)isMirroredDataStore;
- (CKRecordZone)zone;
- (CKServerChangeToken)serverChangeToken;
- (NSArray)supportedRecordTypes;
- (void)deleteUserData:(id)a3;
- (void)fetchDeviceTypesForAllLanguages:(id)a3;
- (void)fetchDeviceTypesForLanguage:(id)a3 completion:(id)a4;
- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6;
- (void)setCloudSyncEnabled:(BOOL)a3;
- (void)setDataStoreIsOnSharedDatabase:(BOOL)a3;
- (void)setDataStoreShouldMirrorData:(BOOL)a3;
- (void)setIsMirroredDataStore:(BOOL)a3;
- (void)setSupportedRecordTypes:(id)a3;
- (void)setZone:(id)a3;
- (void)synchronizeUsingActivity:(id)a3 completion:(id)a4;
- (void)synchronizeWithCompletion:(id)a3;
@end

@implementation ADCloudKitAccountStatusMirroredStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedRecordTypes, 0);
  objc_storeStrong((id *)&self->_zone, 0);
}

- (void)setCloudSyncEnabled:(BOOL)a3
{
  self->_cloudSyncEnabled = a3;
}

- (BOOL)cloudSyncEnabled
{
  return self->_cloudSyncEnabled;
}

- (void)setSupportedRecordTypes:(id)a3
{
}

- (NSArray)supportedRecordTypes
{
  return self->_supportedRecordTypes;
}

- (void)setZone:(id)a3
{
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (void)setIsMirroredDataStore:(BOOL)a3
{
  self->_isMirroredDataStore = a3;
}

- (BOOL)isMirroredDataStore
{
  return self->_isMirroredDataStore;
}

- (void)setDataStoreShouldMirrorData:(BOOL)a3
{
  self->_dataStoreShouldMirrorData = a3;
}

- (BOOL)dataStoreShouldMirrorData
{
  return self->_dataStoreShouldMirrorData;
}

- (void)setDataStoreIsOnSharedDatabase:(BOOL)a3
{
  self->_dataStoreIsOnSharedDatabase = a3;
}

- (BOOL)dataStoreIsOnSharedDatabase
{
  return self->_dataStoreIsOnSharedDatabase;
}

- (void)synchronizeUsingActivity:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
  }
}

- (void)fetchDeviceTypesForAllLanguages:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0, 0);
  }
}

- (void)fetchDeviceTypesForLanguage:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)deleteUserData:(id)a3
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[ADCloudKitAccountStatusMirroredStore deleteUserData:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)mergeDataWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4 containsAllChanges:(BOOL)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a6;
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    v13 = "-[ADCloudKitAccountStatusMirroredStore mergeDataWithModifiedRecords:deletedRecordIDs:containsAllChanges:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s No merging on mirrored container.", (uint8_t *)&v12, 0xCu);
  }
  if (v10) {
    v10[2](v10, 0);
  }
}

- (void)synchronizeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[AFPreferences sharedPreferences];
  unsigned int v6 = [v5 cloudSyncEnabled];

  if (self->_cloudSyncEnabled != v6)
  {
    self->_cloudSyncEnabled = v6;
    if (v6)
    {
      v7 = +[ADCloudKitManager sharedManager];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1001158DC;
      v8[3] = &unk_10050D728;
      id v9 = v4;
      [v7 saveCloudSyncEnabledRecord:1 mirror:1 completion:v8];
    }
  }
  if (v4) {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

- (CKServerChangeToken)serverChangeToken
{
  return 0;
}

- (BOOL)hasSetUpRecordZoneSubscription
{
  return 0;
}

- (ADCloudKitAccountStatusMirroredStore)init
{
  v7.receiver = self;
  v7.super_class = (Class)ADCloudKitAccountStatusMirroredStore;
  v2 = [(ADCloudKitAccountStatusMirroredStore *)&v7 init];
  if (v2)
  {
    CFStringRef v8 = @"AssistantKeyValueRecord";
    uint64_t v3 = +[NSArray arrayWithObjects:&v8 count:1];
    supportedRecordTypes = v2->_supportedRecordTypes;
    v2->_supportedRecordTypes = (NSArray *)v3;

    v5 = +[AFPreferences sharedPreferences];
    v2->_cloudSyncEnabled = [v5 cloudSyncEnabled];
  }
  return v2;
}

@end