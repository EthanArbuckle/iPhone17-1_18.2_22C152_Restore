@interface PDCKOperation
+ (NSArray)syncableEntities;
+ (NSDictionary)recordTypeToEntityMap;
- (BOOL)hasCachedProgressZone;
- (BOOL)hasCachedTeacherZone;
- (BOOL)isBootstrapped;
- (BOOL)isNetworkError:(id)a3;
- (BOOL)isServerBusyError:(id)a3;
- (BOOL)updateSyncMetadataForRecord:(id)a3;
- (CKContainer)container;
- (CKDatabase)cloudDatabase;
- (CKRecordZone)assetZone;
- (CKRecordZone)progressZone;
- (CKRecordZone)surveyAnswerZone;
- (CKRecordZone)teacherZone;
- (PDCKOperation)initWithDatabase:(id)a3 container:(id)a4;
- (double)retryDelayForServerBusyError:(id)a3;
- (id)_zoneWithName:(id)a3;
- (id)recordIDForSyncItem:(id)a3;
- (id)syncMetadataForRecord:(id)a3;
- (id)syncMetadataForRecordID:(id)a3;
- (id)zoneIDForSyncItem:(id)a3;
- (void)abort;
- (void)deleteSyncMetadataAssociatedWithRecordID:(id)a3;
- (void)performCKDatabaseOperation:(id)a3;
- (void)prepare;
- (void)setBootstrapped:(BOOL)a3;
@end

@implementation PDCKOperation

- (CKRecordZone)progressZone
{
  v3 = *(CKContainer **)((char *)&self->_container + 2);
  if (!v3)
  {
    v4 = [(PDCKOperation *)self _zoneWithName:@"PDCK_ClassKitZoneName"];
    v5 = *(CKContainer **)((char *)&self->_container + 2);
    *(CKContainer **)((char *)&self->_container + 2) = v4;

    v3 = *(CKContainer **)((char *)&self->_container + 2);
  }

  return (CKRecordZone *)v3;
}

- (PDCKOperation)initWithDatabase:(id)a3 container:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PDCKOperation;
  v8 = [(PDOperation *)&v11 initWithDatabase:a3];
  v9 = (PDCKOperation *)v8;
  if (v8) {
    objc_storeStrong((id *)(v8 + 74), a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_surveyAnswerZone + 2), 0);
  objc_storeStrong((id *)((char *)&self->_assetZone + 2), 0);
  objc_storeStrong((id *)((char *)&self->_teacherZone + 2), 0);
  objc_storeStrong((id *)((char *)&self->_progressZone + 2), 0);
  objc_storeStrong((id *)((char *)&self->_container + 2), 0);

  objc_storeStrong((id *)(&self->super._executing + 1), 0);
}

- (id)_zoneWithName:(id)a3
{
  id v4 = a3;
  v5 = [(PDOperation *)self database];
  v6 = sub_100006D08(v5, v4);

  if ([v6 length]) {
    id v7 = [objc_alloc((Class)CKRecordZone) initWithZoneName:v6];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

+ (NSArray)syncableEntities
{
  if (qword_10023E7D8 != -1) {
    dispatch_once(&qword_10023E7D8, &stru_1001F5DD8);
  }
  v2 = (void *)qword_10023E7D0;

  return (NSArray *)v2;
}

+ (NSDictionary)recordTypeToEntityMap
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013A748;
  block[3] = &unk_1001F29D0;
  block[4] = a1;
  if (qword_10023E7E8 != -1) {
    dispatch_once(&qword_10023E7E8, block);
  }
  v2 = (void *)qword_10023E7E0;

  return (NSDictionary *)v2;
}

- (void)performCKDatabaseOperation:(id)a3
{
  id v10 = a3;
  if (![(PDOperation *)self isAborted])
  {
    id v4 = self;
    objc_sync_enter(v4);
    v5 = [v10 configuration];
    if (!v5)
    {
      v5 = objc_opt_new();
      [v5 setQualityOfService:17];
      [v10 setConfiguration:v5];
    }
    [v5 setQualityOfService:25];
    objc_msgSend(v5, "setAllowsCellularAccess:", -[PDOperation mayUseCellularData](v4, "mayUseCellularData"));
    [(PDOperation *)v4 timeoutIntervalForRequests];
    objc_msgSend(v5, "setTimeoutIntervalForRequest:");
    [v5 setLongLived:0];
    v6 = *(CKRecordZone **)((char *)&v4->_surveyAnswerZone + 2);
    if (!v6)
    {
      uint64_t v7 = objc_opt_new();
      v8 = *(CKRecordZone **)((char *)&v4->_surveyAnswerZone + 2);
      *(CKRecordZone **)((char *)&v4->_surveyAnswerZone + 2) = (CKRecordZone *)v7;

      v6 = *(CKRecordZone **)((char *)&v4->_surveyAnswerZone + 2);
    }
    [v6 addObject:v10];

    objc_sync_exit(v4);
    v9 = [(PDCKOperation *)v4 cloudDatabase];
    [v9 addOperation:v10];
  }
}

- (void)abort
{
  v4.receiver = self;
  v4.super_class = (Class)PDCKOperation;
  [(PDOperation *)&v4 abort];
  v3 = self;
  objc_sync_enter(v3);
  [*(id *)((char *)&v3->_surveyAnswerZone + 2) makeObjectsPerformSelector:"cancel"];
  objc_sync_exit(v3);
}

- (BOOL)isBootstrapped
{
  v2 = [(PDOperation *)self database];
  BOOL v3 = sub_100006970(v2, @"PDCK_Bootstrapped");

  return v3;
}

- (void)setBootstrapped:(BOOL)a3
{
  id v4 = [(PDOperation *)self database];
  sub_10015FEC4(v4, a3, @"PDCK_Bootstrapped");
}

- (CKDatabase)cloudDatabase
{
  return (CKDatabase *)[*(id *)(&self->super._executing + 1) organizationCloudDatabase];
}

- (BOOL)isNetworkError:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 code] == (id)3 || objc_msgSend(v3, "code") == (id)4;

  return v4;
}

- (BOOL)isServerBusyError:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 code] == (id)6 || objc_msgSend(v3, "code") == (id)7 || objc_msgSend(v3, "code") == (id)23;

  return v4;
}

- (double)retryDelayForServerBusyError:(id)a3
{
  id v3 = [a3 userInfo];
  BOOL v4 = [v3 objectForKeyedSubscript:CKErrorRetryAfterKey];

  [v4 doubleValue];
  if (v5 >= 10.0) {
    double v6 = v5;
  }
  else {
    double v6 = 10.0;
  }

  return v6;
}

- (CKRecordZone)teacherZone
{
  id v3 = *(CKRecordZone **)((char *)&self->_progressZone + 2);
  if (!v3)
  {
    BOOL v4 = [(PDCKOperation *)self _zoneWithName:@"PDCK_TeacherZoneName"];
    double v5 = *(CKRecordZone **)((char *)&self->_progressZone + 2);
    *(CKRecordZone **)((char *)&self->_progressZone + 2) = v4;

    id v3 = *(CKRecordZone **)((char *)&self->_progressZone + 2);
  }

  return (CKRecordZone *)v3;
}

- (CKRecordZone)assetZone
{
  id v3 = *(CKRecordZone **)((char *)&self->_teacherZone + 2);
  if (!v3)
  {
    BOOL v4 = [(PDCKOperation *)self _zoneWithName:@"PDCK_ClassKitSharedAssetZone"];
    double v5 = *(CKRecordZone **)((char *)&self->_teacherZone + 2);
    *(CKRecordZone **)((char *)&self->_teacherZone + 2) = v4;

    id v3 = *(CKRecordZone **)((char *)&self->_teacherZone + 2);
  }

  return (CKRecordZone *)v3;
}

- (CKRecordZone)surveyAnswerZone
{
  id v3 = *(CKRecordZone **)((char *)&self->_assetZone + 2);
  if (!v3)
  {
    BOOL v4 = [(PDCKOperation *)self _zoneWithName:@"PDCK_StudentZoneName"];
    double v5 = *(CKRecordZone **)((char *)&self->_assetZone + 2);
    *(CKRecordZone **)((char *)&self->_assetZone + 2) = v4;

    id v3 = *(CKRecordZone **)((char *)&self->_assetZone + 2);
  }

  return (CKRecordZone *)v3;
}

- (void)prepare
{
  v7.receiver = self;
  v7.super_class = (Class)PDCKOperation;
  [(PDAsyncOperation *)&v7 prepare];
  [(PDOperation *)self database];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10013AE38;
  v4[3] = &unk_1001F2710;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  double v6 = self;
  id v3 = v5;
  sub_10000749C(v3, v4);
}

- (id)zoneIDForSyncItem:(id)a3
{
  id v5 = [a3 syncableItemType];
  if (v5)
  {
    if (v5 == (id)2)
    {
      double v6 = [(PDCKOperation *)self surveyAnswerZone];
    }
    else
    {
      if (v5 != (id)1) {
        goto LABEL_8;
      }
      double v6 = [(PDCKOperation *)self progressZone];
    }
  }
  else
  {
    double v6 = [(PDCKOperation *)self teacherZone];
  }
  objc_super v7 = v6;
  id v3 = [v6 zoneID];

LABEL_8:

  return v3;
}

- (id)recordIDForSyncItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PDCKOperation *)self zoneIDForSyncItem:v4];
  double v6 = [v4 entityIdentity];

  objc_super v7 = [v6 description];

  id v8 = [objc_alloc((Class)CKRecordID) initWithRecordName:v7 zoneID:v5];

  return v8;
}

- (id)syncMetadataForRecordID:(id)a3
{
  id v4 = [a3 recordName];
  id v5 = [(PDOperation *)self database];
  uint64_t v6 = objc_opt_class();
  id v10 = v4;
  objc_super v7 = +[NSArray arrayWithObjects:&v10 count:1];
  id v8 = [v5 select:v6 where:@"entityIdentity = ?" bindings:v7];

  return v8;
}

- (id)syncMetadataForRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 recordID];
  uint64_t v6 = [(PDCKOperation *)self syncMetadataForRecordID:v5];

  if (!v6)
  {
    uint64_t v6 = objc_opt_new();
    objc_super v7 = [v4 recordID];
    id v8 = [v7 recordName];
    sub_100075F40((uint64_t)v6, v8);

    v9 = [(id)objc_opt_class() recordTypeToEntityMap];
    id v10 = [v4 recordType];
    id v11 = [v9 objectForKeyedSubscript:v10];

    sub_100075F30((uint64_t)v6, v11);
  }

  return v6;
}

- (BOOL)updateSyncMetadataForRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(PDOperation *)self database];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10013B3B4;
  v14[3] = &unk_1001F3060;
  v14[4] = self;
  id v6 = v4;
  id v15 = v6;
  id v7 = v5;
  id v8 = v7;
  id v16 = v7;
  if (!v7 || (BOOL v9 = 1, ([v7 performTransaction:v14 forWriting:1] & 1) == 0))
  {
    CLSInitLog();
    id v10 = (void *)CLSLogSync;
    if (os_log_type_enabled(CLSLogSync, OS_LOG_TYPE_INFO))
    {
      id v11 = v10;
      v12 = [v6 recordID];
      *(_DWORD *)buf = 138412546;
      id v18 = v6;
      __int16 v19 = 2114;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Failed to update sync state for record: %@, recordID: %{public}@", buf, 0x16u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (void)deleteSyncMetadataAssociatedWithRecordID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 recordName];
  uint64_t v11 = v5;
  id v6 = +[NSArray arrayWithObjects:&v11 count:1];

  id v7 = [(PDOperation *)self database];
  LOBYTE(v5) = [v7 deleteAll:objc_opt_class() where:@"entityIdentity = ?" bindings:v6];

  if ((v5 & 1) == 0)
  {
    CLSInitLog();
    id v8 = CLSLogSync;
    if (os_log_type_enabled(CLSLogSync, OS_LOG_TYPE_INFO))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Failed to delete sync state for deleted record with recordID: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (CKContainer)container
{
  return *(CKContainer **)(&self->super._executing + 1);
}

- (BOOL)hasCachedTeacherZone
{
  return BYTE2(self->_operations);
}

- (BOOL)hasCachedProgressZone
{
  return BYTE3(self->_operations);
}

@end