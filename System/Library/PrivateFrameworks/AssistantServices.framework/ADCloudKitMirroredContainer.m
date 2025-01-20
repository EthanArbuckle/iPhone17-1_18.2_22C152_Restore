@interface ADCloudKitMirroredContainer
- (ADCloudKitMirroredContainer)initWithContainer:(id)a3 queue:(id)a4;
- (ADCloudKitRecordZoneInfo)accountStatusRecordZoneInfo;
- (ADCloudKitRecordZoneInfo)keyValueRecordZoneInfo;
- (ADCloudKitRecordZoneInfo)multiUserRecordZoneInfo;
- (CKContainer)container;
- (void)_createRecordZone:(id)a3 shared:(BOOL)a4;
- (void)createMirroredZonesWithCompletion:(id)a3;
- (void)resynchronizeMirroredZone:(id)a3 completion:(id)a4;
- (void)setAccountStatusRecordZoneInfo:(id)a3;
- (void)setContainer:(id)a3;
- (void)setKeyValueRecordZoneInfo:(id)a3;
- (void)setMultiUserRecordZoneInfo:(id)a3;
@end

@implementation ADCloudKitMirroredContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiUserRecordZoneInfo, 0);
  objc_storeStrong((id *)&self->_keyValueRecordZoneInfo, 0);
  objc_storeStrong((id *)&self->_accountStatusRecordZoneInfo, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_zoneCreationError, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setMultiUserRecordZoneInfo:(id)a3
{
}

- (ADCloudKitRecordZoneInfo)multiUserRecordZoneInfo
{
  return self->_multiUserRecordZoneInfo;
}

- (void)setKeyValueRecordZoneInfo:(id)a3
{
}

- (ADCloudKitRecordZoneInfo)keyValueRecordZoneInfo
{
  return self->_keyValueRecordZoneInfo;
}

- (void)setAccountStatusRecordZoneInfo:(id)a3
{
}

- (ADCloudKitRecordZoneInfo)accountStatusRecordZoneInfo
{
  return self->_accountStatusRecordZoneInfo;
}

- (void)setContainer:(id)a3
{
}

- (CKContainer)container
{
  return self->_container;
}

- (void)resynchronizeMirroredZone:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = [v6 zoneName];
    *(_DWORD *)buf = 136315394;
    v27 = "-[ADCloudKitMirroredContainer resynchronizeMirroredZone:completion:]";
    __int16 v28 = 2112;
    v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  id v11 = objc_alloc((Class)CKRecordZoneID);
  v12 = [v6 zoneName];
  id v13 = [v11 initWithZoneName:v12 ownerName:CKCurrentUserDefaultName];

  v14 = [v6 zoneName];
  unsigned __int8 v15 = [v14 isEqualToString:@"com.apple.assistant.multiuser.shared"];

  dispatch_time_t v16 = dispatch_time(0, 120000000000);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100125A94;
  block[3] = &unk_100509CF0;
  block[4] = self;
  id v22 = v13;
  unsigned __int8 v25 = v15;
  id v23 = v6;
  id v24 = v7;
  id v18 = v6;
  id v19 = v13;
  id v20 = v7;
  dispatch_after(v16, queue, block);
}

- (void)_createRecordZone:(id)a3 shared:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = [v6 zoneName];
    *(_DWORD *)buf = 136315394;
    id v18 = "-[ADCloudKitMirroredContainer _createRecordZone:shared:]";
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v10 = objc_alloc((Class)CKRecordZoneID);
  id v11 = [v6 zoneName];
  id v12 = [v10 initWithZoneName:v11 ownerName:CKCurrentUserDefaultName];

  dispatch_group_enter((dispatch_group_t)self->_group);
  container = self->_container;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001260AC;
  v15[3] = &unk_100502D08;
  v15[4] = self;
  id v16 = v6;
  id v14 = v6;
  sub_100310728(v12, container, v4, v15);
}

- (void)createMirroredZonesWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001263D4;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (ADCloudKitMirroredContainer)initWithContainer:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v38.receiver = self;
  v38.super_class = (Class)ADCloudKitMirroredContainer;
  v9 = [(ADCloudKitMirroredContainer *)&v38 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_containerIdentifier, a3);
    uint64_t v11 = sub_1003104B8(v7);
    container = v10->_container;
    v10->_container = (CKContainer *)v11;

    v10->_zoneCreationState = 0;
    id v13 = +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.assistant.backedup", @"subscription", @"AssistantKeyValueRecord"];
    id v14 = [[ADCloudKitRecordZoneInfo alloc] initWithZoneName:@"com.apple.assistant.backedup" subscriptionName:v13];
    keyValueRecordZoneInfo = v10->_keyValueRecordZoneInfo;
    v10->_keyValueRecordZoneInfo = v14;

    id v16 = +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.assistant.account.status", @"subscription", @"AssistantKeyValueRecord"];

    v17 = [[ADCloudKitRecordZoneInfo alloc] initWithZoneName:@"com.apple.assistant.account.status" subscriptionName:v16];
    accountStatusRecordZoneInfo = v10->_accountStatusRecordZoneInfo;
    v10->_accountStatusRecordZoneInfo = v17;

    __int16 v19 = +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.assistant.multiuser.shared", @"subscription", @"AssistantVoiceTriggerFileAssetRecord"];
    id v20 = +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.assistant.multiuser.shared", @"subscription", @"AssistantKeyValueRecord"];
    v21 = [ADCloudKitRecordZoneInfo alloc];
    v39[0] = v19;
    v39[1] = v20;
    id v22 = +[NSArray arrayWithObjects:v39 count:2];
    id v23 = [(ADCloudKitRecordZoneInfo *)v21 initWithZoneName:@"com.apple.assistant.multiuser.shared" subscriptionNames:v22];
    multiUserRecordZoneInfo = v10->_multiUserRecordZoneInfo;
    v10->_multiUserRecordZoneInfo = v23;

    unsigned __int8 v25 = v10->_accountStatusRecordZoneInfo;
    v26 = objc_alloc_init(ADCloudKitAccountStatusMirroredStore);
    [(ADCloudKitRecordZoneInfo *)v25 setDataStore:v26];

    v27 = v10->_keyValueRecordZoneInfo;
    __int16 v28 = objc_alloc_init(ADCloudKitKeyValueMirroredStore);
    [(ADCloudKitRecordZoneInfo *)v27 setDataStore:v28];

    v29 = v10->_multiUserRecordZoneInfo;
    v30 = objc_alloc_init(ADCloudKitMultiUserSharedDataStore);
    [(ADCloudKitRecordZoneInfo *)v29 setDataStore:v30];

    v31 = [(ADCloudKitRecordZoneInfo *)v10->_accountStatusRecordZoneInfo dataStore];
    [v31 setIsMirroredDataStore:1];

    v32 = [(ADCloudKitRecordZoneInfo *)v10->_keyValueRecordZoneInfo dataStore];
    [v32 setIsMirroredDataStore:1];

    v33 = [(ADCloudKitRecordZoneInfo *)v10->_multiUserRecordZoneInfo dataStore];
    [v33 setIsMirroredDataStore:1];

    dispatch_group_t v34 = dispatch_group_create();
    group = v10->_group;
    v10->_group = (OS_dispatch_group *)v34;

    v36 = v10;
  }

  return v10;
}

@end