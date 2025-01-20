@interface CKDatabase
+ (id)_changeTokenKeyForDatabaseScope:(int64_t)a3 recordZoneName:(id)a4;
+ (id)_fetchChangeTokenWithDatabaseScope:(int64_t)a3;
+ (id)_fetchChangeTokenWithDatabaseScope:(int64_t)a3 recordZoneName:(id)a4;
+ (id)_stringForDatabaseScope:(int64_t)a3;
+ (id)_stringForQualityOfService:(int64_t)a3;
- (BOOL)isPrivateDatabase;
- (BOOL)isPublicDatabase;
- (BOOL)isSharedDatabase;
- (NSString)hashedDescription;
- (id)_fetchChangedRecordZonesWithServerChangeToken:(id)a3;
- (id)_fetchChangedRecordsInRecordZonesWithWithRecordZoneIDs:(id)a3 changeTokens:(id)a4;
- (id)_subscribeWithIdentifier:(id)a3 attempt:(unint64_t)a4;
- (id)createRecordWithRecordName:(id)a3 recordType:(id)a4 recordZone:(id)a5;
- (id)createRecordZoneWithRecordZoneName:(id)a3;
- (id)deleteRecordWithRecordIdentifier:(id)a3;
- (id)deleteRecordWithRecordIdentifier:(id)a3 missingEncryptionIdentity:(BOOL)a4;
- (id)deleteRecordZonesWithRecordZoneIdentifiers:(id)a3;
- (id)fetchChangedRecordZones;
- (id)fetchChangedRecordsInRecordZonesWithRecordZoneIdentifiers:(id)a3;
- (id)fetchRecordWithName:(id)a3 zoneIdentifier:(id)a4;
- (id)fetchRecordWithName:(id)a3 zoneIdentifier:(id)a4 qualityOfService:(int64_t)a5;
- (id)fetchRecordWithRecordIdentifier:(id)a3;
- (id)fetchRecordWithRecordIdentifier:(id)a3 qualityOfService:(int64_t)a4;
- (id)fetchRecordZones;
- (id)fetchRecordZonesWithQualityOfService:(int64_t)a3;
- (id)saveRecord:(id)a3;
- (id)saveRecordZone:(id)a3;
- (id)shareForRecordZoneIdentifier:(id)a3;
- (id)subscribeWithIdentifier:(id)a3;
- (unint64_t)type;
- (void)_logFaultIfExcessiveChangeTokens:(id)a3;
- (void)persistChangedRecordZonesChangeToken:(id)a3;
- (void)persistChangedRecordsChangeToken:(id)a3 forRecordZoneIdentifier:(id)a4;
@end

@implementation CKDatabase

- (BOOL)isPrivateDatabase
{
  return [(CKDatabase *)self type] == 0;
}

- (BOOL)isPublicDatabase
{
  return (id)[(CKDatabase *)self type] == (id)1;
}

- (BOOL)isSharedDatabase
{
  return (id)[(CKDatabase *)self type] == (id)2;
}

- (unint64_t)type
{
  CKDatabaseScope v2 = [(CKDatabase *)self databaseScope];
  if (v2 == CKDatabaseScopeShared) {
    return 2;
  }
  else {
    return v2 == CKDatabaseScopePublic;
  }
}

- (NSString)hashedDescription
{
  return +[NSString stringWithFormat:@"<%@: %p type = %lu>", objc_opt_class(), self, [(CKDatabase *)self type]];
}

- (id)createRecordWithRecordName:(id)a3 recordType:(id)a4 recordZone:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v7;
  }
  else {
    id v10 = 0;
  }

  id v11 = objc_alloc((Class)CKRecordID);
  v12 = [v10 zoneID];
  id v13 = [v11 initWithRecordName:v9 zoneID:v12];

  id v14 = [objc_alloc((Class)CKRecord) initWithRecordType:v8 recordID:v13];
  return v14;
}

- (id)createRecordZoneWithRecordZoneName:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)CKRecordZone) initWithZoneName:v3];

  return v4;
}

- (id)deleteRecordWithRecordIdentifier:(id)a3
{
  return [(CKDatabase *)self deleteRecordWithRecordIdentifier:a3 missingEncryptionIdentity:0];
}

- (id)deleteRecordWithRecordIdentifier:(id)a3 missingEncryptionIdentity:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  id v8 = objc_alloc_init((Class)AMSMutablePromise);
  id v9 = objc_alloc((Class)CKModifyRecordsOperation);
  id v17 = v7;
  id v10 = +[NSArray arrayWithObjects:&v17 count:1];
  id v11 = [v9 initWithRecordsToSave:0 recordIDsToDelete:v10];

  [v11 setQualityOfService:17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006428C;
  v15[3] = &unk_1001148B0;
  id v16 = v8;
  id v12 = v8;
  [v11 setModifyRecordsCompletionBlock:v15];
  [v11 setMarkAsParticipantNeedsNewInvitationToken:v4];
  [(CKDatabase *)self addOperation:v11];
  id v13 = [v12 catchWithBlock:&stru_1001148F0];

  return v13;
}

- (id)deleteRecordZonesWithRecordZoneIdentifiers:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  id v6 = objc_alloc_init((Class)AMSMutablePromise);
  id v7 = [objc_alloc((Class)CKModifyRecordZonesOperation) initWithRecordZonesToSave:0 recordZoneIDsToDelete:v5];
  [v7 setQualityOfService:17];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100064514;
  v11[3] = &unk_1001148B0;
  id v12 = v6;
  id v8 = v6;
  [v7 setModifyRecordZonesCompletionBlock:v11];
  [(CKDatabase *)self addOperation:v7];
  id v9 = [v8 catchWithBlock:&stru_100114910];

  return v9;
}

- (id)fetchChangedRecordsInRecordZonesWithRecordZoneIdentifiers:(id)a3
{
  id v4 = objc_msgSend(a3, "ams_mapWithTransformIgnoresNil:", &stru_100114950);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100064780;
  v8[3] = &unk_100114978;
  v8[4] = self;
  id v5 = objc_msgSend(v4, "ams_invertedDictionaryUsingTransformIgnoresNil:", v8);
  id v6 = [(CKDatabase *)self _fetchChangedRecordsInRecordZonesWithWithRecordZoneIDs:v4 changeTokens:v5];

  return v6;
}

- (id)fetchChangedRecordZones
{
  id v3 = objc_msgSend((id)objc_opt_class(), "_fetchChangeTokenWithDatabaseScope:", -[CKDatabase scope](self, "scope"));
  id v4 = [(CKDatabase *)self _fetchChangedRecordZonesWithServerChangeToken:v3];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100064908;
  v8[3] = &unk_100113578;
  v8[4] = self;
  id v5 = [v4 catchWithBlock:v8];

  id v6 = [v5 catchWithBlock:&stru_100114998];

  return v6;
}

- (id)fetchRecordWithName:(id)a3 zoneIdentifier:(id)a4
{
  return [(CKDatabase *)self fetchRecordWithName:a3 zoneIdentifier:a4 qualityOfService:17];
}

- (id)fetchRecordWithName:(id)a3 zoneIdentifier:(id)a4 qualityOfService:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v8;
  }
  else {
    id v10 = 0;
  }

  id v11 = [objc_alloc((Class)CKRecordID) initWithRecordName:v9 zoneID:v10];
  id v12 = [(CKDatabase *)self fetchRecordWithRecordIdentifier:v11 qualityOfService:a5];

  return v12;
}

- (id)fetchRecordWithRecordIdentifier:(id)a3
{
  return [(CKDatabase *)self fetchRecordWithRecordIdentifier:a3 qualityOfService:17];
}

- (id)fetchRecordWithRecordIdentifier:(id)a3 qualityOfService:(int64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  id v9 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    AMSLogKey();
    id v25 = v7;
    id v13 = v12 = a4;
    id v14 = NSStringFromSelector(a2);
    v15 = AMSHashIfNeeded();
    id v16 = [(id)objc_opt_class() _stringForQualityOfService:v12];
    *(_DWORD *)buf = 138544386;
    uint64_t v31 = v11;
    __int16 v32 = 2114;
    v33 = v13;
    __int16 v34 = 2114;
    v35 = v14;
    __int16 v36 = 2114;
    v37 = v15;
    __int16 v38 = 2114;
    v39 = v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing operation: %{public}@  | database: %{public}@ | Quality of Service: %{public}@", buf, 0x34u);

    a4 = v12;
    id v7 = v25;
  }

  id v17 = objc_alloc_init((Class)AMSMutablePromise);
  id v18 = objc_alloc((Class)CKFetchRecordsOperation);
  id v29 = v8;
  v19 = +[NSArray arrayWithObjects:&v29 count:1];
  id v20 = [v18 initWithRecordIDs:v19];

  [v20 setQualityOfService:a4];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100064DB8;
  v26[3] = &unk_1001149C0;
  id v27 = v8;
  id v28 = v17;
  id v21 = v17;
  id v22 = v8;
  [v20 setFetchRecordsCompletionBlock:v26];
  [(CKDatabase *)self addOperation:v20];
  v23 = [v21 catchWithBlock:&stru_1001149E0];

  return v23;
}

- (id)fetchRecordZones
{
  return [(CKDatabase *)self fetchRecordZonesWithQualityOfService:17];
}

- (id)fetchRecordZonesWithQualityOfService:(int64_t)a3
{
  id v6 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = AMSLogKey();
    id v10 = NSStringFromSelector(a2);
    uint64_t v11 = AMSHashIfNeeded();
    int64_t v12 = [(id)objc_opt_class() _stringForQualityOfService:a3];
    *(_DWORD *)buf = 138544386;
    uint64_t v22 = v8;
    __int16 v23 = 2114;
    v24 = v9;
    __int16 v25 = 2114;
    v26 = v10;
    __int16 v27 = 2114;
    id v28 = v11;
    __int16 v29 = 2114;
    v30 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing operation: %{public}@  | database: %{public}@ | Quality of Service: %{public}@", buf, 0x34u);
  }
  id v13 = objc_alloc_init((Class)AMSMutablePromise);
  id v14 = +[CKFetchRecordZonesOperation fetchAllRecordZonesOperation];
  [v14 setQualityOfService:a3];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10006523C;
  v19[3] = &unk_100114A08;
  id v15 = v13;
  id v20 = v15;
  [v14 setFetchRecordZonesCompletionBlock:v19];
  [(CKDatabase *)self addOperation:v14];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10006536C;
  v18[3] = &unk_100114A58;
  v18[4] = self;
  [v15 addSuccessBlock:v18];
  id v16 = v15;

  return v16;
}

- (void)persistChangedRecordZonesChangeToken:(id)a3
{
  id v4 = a3;
  id v5 = &swift_willThrow_ptr;
  id v6 = +[AMSStorage _valueForKey:@"AMSDCloudKitDatabaseChangeTokens"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  uint64_t v8 = &__NSDictionary0__struct;
  if (v7) {
    uint64_t v8 = v7;
  }
  id v9 = v8;

  id v10 = [v9 mutableCopy];
  if (v4)
  {
    id v22 = 0;
    uint64_t v11 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v22];
    id v12 = v22;
    if (!v11)
    {
      id v13 = +[AMSLogConfig sharedAccountsDaemonConfig];
      if (!v13)
      {
        id v13 = +[AMSLogConfig sharedConfig];
      }
      id v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = objc_opt_class();
        id v21 = AMSLogKey();
        uint64_t v15 = AMSHashIfNeeded();
        uint64_t v16 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138544130;
        uint64_t v24 = v20;
        __int16 v25 = 2114;
        v26 = v21;
        __int16 v27 = 2114;
        uint64_t v28 = v15;
        id v17 = (void *)v15;
        __int16 v29 = 2114;
        uint64_t v30 = v16;
        id v18 = (void *)v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to archive a database change token. database = %{public}@ | error = %{public}@", buf, 0x2Au);

        id v5 = &swift_willThrow_ptr;
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  v19 = objc_msgSend((id)objc_opt_class(), "_stringForDatabaseScope:", -[CKDatabase scope](self, "scope"));
  [v10 setObject:v11 forKeyedSubscript:v19];

  if (([v9 isEqualToDictionary:v10] & 1) == 0) {
    [v5[196] _setValue:v10 forKey:@"AMSDCloudKitDatabaseChangeTokens"];
  }
}

- (void)persistChangedRecordsChangeToken:(id)a3 forRecordZoneIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v8)
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = AMSLogKey();
    id v12 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544130;
    uint64_t v35 = v10;
    __int16 v36 = 2114;
    v37 = v11;
    __int16 v38 = 2112;
    id v39 = v6;
    __int16 v40 = 2114;
    v41 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Setting a change token. changeToken = %@ | zoneIdentifier = %{public}@", buf, 0x2Au);
  }
  id v13 = &swift_willThrow_ptr;
  id v14 = +[AMSStorage _valueForKey:@"AMSDCloudKitRecordZoneChangeTokens"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }

  uint64_t v16 = &__NSDictionary0__struct;
  if (v15) {
    uint64_t v16 = v15;
  }
  id v17 = v16;

  id v18 = [v17 mutableCopy];
  v19 = objc_opt_class();
  id v20 = [(CKDatabase *)self scope];
  id v21 = [v7 name];
  id v22 = [v19 _changeTokenKeyForDatabaseScope:v20 recordZoneName:v21];

  if (v6)
  {
    id v33 = 0;
    __int16 v23 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v33];
    id v24 = v33;
    if (!v23)
    {
      __int16 v25 = +[AMSLogConfig sharedAccountsDaemonConfig];
      if (!v25)
      {
        __int16 v25 = +[AMSLogConfig sharedConfig];
      }
      v26 = [v25 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = objc_opt_class();
        __int16 v32 = AMSLogKey();
        id v29 = [(CKDatabase *)self scope];
        uint64_t v31 = AMSHashIfNeeded();
        uint64_t v28 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138544386;
        uint64_t v35 = v30;
        __int16 v36 = 2114;
        v37 = v32;
        __int16 v38 = 2048;
        id v39 = v29;
        __int16 v40 = 2114;
        v41 = v31;
        __int16 v42 = 2114;
        v43 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to archive a record zone change token. databaseScope = %ld | zoneName = %{public}@ | error = %{public}@", buf, 0x34u);
      }
      id v13 = &swift_willThrow_ptr;
    }
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, v22, v28);
  }
  else
  {
    [v18 removeObjectForKey:v22];
  }
  if (([v17 isEqualToDictionary:v18] & 1) == 0)
  {
    [v13[196] _setValue:v18 forKey:@"AMSDCloudKitRecordZoneChangeTokens"];
    id v27 = [v18 copy];
    [(CKDatabase *)self _logFaultIfExcessiveChangeTokens:v27];
  }
}

- (void)_logFaultIfExcessiveChangeTokens:(id)a3
{
  id v3 = [a3 allValues];
  id v4 = [v3 count];

  if ((unint64_t)v4 >= 0xC9)
  {
    unsigned int v5 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v6 = +[AMSLogConfig sharedConfig];
    id v7 = (void *)v6;
    if (v5)
    {
      if (!v6)
      {
        id v7 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138543362;
        uint64_t v11 = objc_opt_class();
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@: AMSStorage database grown too big when inserting record zone change tokens.", (uint8_t *)&v10, 0xCu);
      }

      id v7 = +[NSNotificationCenter defaultCenter];
      id v9 = +[AMSLogConfig sharedConfig];
      [v7 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v9 userInfo:0];
    }
    else
    {
      if (!v6)
      {
        id v7 = +[AMSLogConfig sharedConfig];
      }
      id v9 = [v7 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        int v10 = 138543362;
        uint64_t v11 = objc_opt_class();
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%{public}@: AMSStorage database grown too big when inserting record zone change tokens.", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (id)saveRecord:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  id v6 = objc_alloc_init((Class)AMSMutablePromise);
  id v7 = objc_alloc((Class)CKModifyRecordsOperation);
  id v15 = v5;
  uint64_t v8 = +[NSArray arrayWithObjects:&v15 count:1];
  id v9 = [v7 initWithRecordsToSave:v8 recordIDsToDelete:0];

  [v9 setQualityOfService:17];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100065E08;
  v13[3] = &unk_1001148B0;
  id v14 = v6;
  id v10 = v6;
  [v9 setModifyRecordsCompletionBlock:v13];
  [(CKDatabase *)self addOperation:v9];
  uint64_t v11 = [v10 catchWithBlock:&stru_100114A78];

  return v11;
}

- (id)saveRecordZone:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  id v6 = objc_alloc_init((Class)AMSMutablePromise);
  id v7 = objc_alloc((Class)CKModifyRecordZonesOperation);
  id v15 = v5;
  uint64_t v8 = +[NSArray arrayWithObjects:&v15 count:1];
  id v9 = [v7 initWithRecordZonesToSave:v8 recordZoneIDsToDelete:0];

  [v9 setQualityOfService:17];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000660EC;
  v13[3] = &unk_1001148B0;
  id v14 = v6;
  id v10 = v6;
  [v9 setModifyRecordZonesCompletionBlock:v13];
  [(CKDatabase *)self addOperation:v9];
  uint64_t v11 = [v10 catchWithBlock:&stru_100114A98];

  return v11;
}

- (id)shareForRecordZoneIdentifier:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  id v5 = [objc_alloc((Class)CKShare) initWithRecordZoneID:v4];
  return v5;
}

- (id)subscribeWithIdentifier:(id)a3
{
  return [(CKDatabase *)self _subscribeWithIdentifier:a3 attempt:0];
}

- (id)_subscribeWithIdentifier:(id)a3 attempt:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = AMSLogKey();
    uint64_t v11 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = v9;
    __int16 v30 = 2114;
    uint64_t v31 = v10;
    __int16 v32 = 2114;
    id v33 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Setting up a database subscription. database = %{public}@", buf, 0x20u);
  }
  id v12 = objc_alloc_init((Class)CKNotificationInfo);
  [v12 setShouldSendContentAvailable:1];
  id v13 = [objc_alloc((Class)CKDatabaseSubscription) initWithSubscriptionID:v6];
  [v13 setNotificationInfo:v12];
  id v14 = objc_alloc_init((Class)AMSMutablePromise);
  id v15 = objc_alloc((Class)CKModifySubscriptionsOperation);
  id v27 = v13;
  uint64_t v16 = +[NSArray arrayWithObjects:&v27 count:1];
  id v17 = [v15 initWithSubscriptionsToSave:v16 subscriptionIDsToDelete:0];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100066598;
  v25[3] = &unk_1001148B0;
  id v26 = v14;
  id v18 = v14;
  [v17 setModifySubscriptionsCompletionBlock:v25];
  [(CKDatabase *)self addOperation:v17];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10006666C;
  v22[3] = &unk_100114AC0;
  id v23 = v6;
  unint64_t v24 = a4;
  v22[4] = self;
  id v19 = v6;
  id v20 = [v18 continueWithBlock:v22];

  return v20;
}

+ (id)_changeTokenKeyForDatabaseScope:(int64_t)a3 recordZoneName:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _stringForDatabaseScope:a3];
  uint64_t v8 = +[NSString stringWithFormat:@"%@:%@", v7, v6];

  return v8;
}

- (id)_fetchChangedRecordZonesWithServerChangeToken:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)CKFetchDatabaseChangesOperation) initWithPreviousServerChangeToken:v4];

  [v5 setQualityOfService:17];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = objc_alloc_init((Class)NSMutableArray);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100066DE4;
  v22[3] = &unk_100114AE8;
  id v8 = v6;
  id v23 = v8;
  [v5 setRecordZoneWithIDChangedBlock:v22];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100066DF0;
  v20[3] = &unk_100114AE8;
  id v9 = v7;
  id v21 = v9;
  [v5 setRecordZoneWithIDWasDeletedBlock:v20];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100066DFC;
  v16[3] = &unk_100114B10;
  id v10 = objc_alloc_init((Class)AMSMutablePromise);
  id v17 = v10;
  id v18 = v8;
  id v19 = v9;
  id v11 = v9;
  id v12 = v8;
  [v5 setFetchDatabaseChangesCompletionBlock:v16];
  [(CKDatabase *)self addOperation:v5];
  id v13 = v19;
  id v14 = v10;

  return v14;
}

- (id)_fetchChangedRecordsInRecordZonesWithWithRecordZoneIDs:(id)a3 changeTokens:(id)a4
{
  id v6 = a3;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100067298;
  v48[3] = &unk_100114978;
  id v29 = a4;
  id v49 = v29;
  uint64_t v28 = objc_msgSend(v6, "ams_invertedDictionaryUsingTransform:", v48);
  id v7 = [objc_alloc((Class)CKFetchRecordZoneChangesOperation) initWithRecordZoneIDs:v6 configurationsByRecordZoneID:v28];
  [v7 setQualityOfService:17];
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100067318;
  v46[3] = &unk_100114B38;
  v46[4] = self;
  id v12 = v8;
  id v47 = v12;
  [v7 setRecordWasChangedBlock:v46];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100067558;
  v44[3] = &unk_100114B60;
  id v13 = v9;
  id v45 = v13;
  [v7 setRecordWithIDWasDeletedBlock:v44];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100067618;
  v39[3] = &unk_100114B88;
  id v14 = v11;
  id v40 = v14;
  id v15 = v12;
  id v41 = v15;
  id v16 = v13;
  id v42 = v16;
  id v17 = v10;
  id v43 = v17;
  [v7 setRecordZoneFetchCompletionBlock:v39];
  id v18 = objc_alloc_init((Class)AMSMutablePromise);
  id v19 = AMSLogKey();
  objc_initWeak(&location, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000676C8;
  v30[3] = &unk_100114BF0;
  id v20 = v19;
  id v31 = v20;
  id v21 = v15;
  id v32 = v21;
  id v22 = v16;
  id v33 = v22;
  id v23 = v17;
  id v34 = v23;
  id v24 = v14;
  id v35 = v24;
  objc_copyWeak(&v37, &location);
  id v25 = v18;
  id v36 = v25;
  [v7 setFetchRecordZoneChangesCompletionBlock:v30];
  [(CKDatabase *)self addOperation:v7];
  id v26 = [v25 catchWithBlock:&stru_100114C10];

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

  return v26;
}

+ (id)_fetchChangeTokenWithDatabaseScope:(int64_t)a3
{
  id v5 = +[AMSStorage _valueForKey:@"AMSDCloudKitDatabaseChangeTokens"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  id v7 = [a1 _stringForDatabaseScope:a3];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    id v17 = 0;
    id v9 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v17];
    id v10 = v17;
    if (!v9)
    {
      id v11 = +[AMSLogConfig sharedAccountsDaemonConfig];
      if (!v11)
      {
        id v11 = +[AMSLogConfig sharedConfig];
      }
      id v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = objc_opt_class();
        id v14 = AMSLogKey();
        id v15 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138544130;
        uint64_t v19 = v13;
        __int16 v20 = 2114;
        id v21 = v14;
        __int16 v22 = 2048;
        int64_t v23 = a3;
        __int16 v24 = 2114;
        id v25 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to unarchive a database change token. databaseScope = %ld | error = %{public}@", buf, 0x2Au);
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)_fetchChangeTokenWithDatabaseScope:(int64_t)a3 recordZoneName:(id)a4
{
  id v6 = a4;
  id v7 = +[AMSStorage _valueForKey:@"AMSDCloudKitRecordZoneChangeTokens"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  id v9 = [a1 _changeTokenKeyForDatabaseScope:a3 recordZoneName:v6];
  id v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    id v20 = 0;
    id v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v20];
    id v12 = v20;
    if (!v11)
    {
      uint64_t v13 = +[AMSLogConfig sharedAccountsDaemonConfig];
      if (!v13)
      {
        uint64_t v13 = +[AMSLogConfig sharedConfig];
      }
      id v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = objc_opt_class();
        id v15 = AMSLogKey();
        id v18 = AMSHashIfNeeded();
        id v16 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138544386;
        uint64_t v22 = v19;
        __int16 v23 = 2114;
        __int16 v24 = v15;
        __int16 v25 = 2048;
        int64_t v26 = a3;
        __int16 v27 = 2114;
        uint64_t v28 = v18;
        __int16 v29 = 2114;
        __int16 v30 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to unarchive a record zone change token. databaseScope = %ld | zoneName = %{public}@ | error = %{public}@", buf, 0x34u);
      }
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)_stringForDatabaseScope:(int64_t)a3
{
  CFStringRef v3 = @"private";
  if (a3 == 1) {
    CFStringRef v3 = @"public";
  }
  if (a3 == 3) {
    return @"shared";
  }
  else {
    return (id)v3;
  }
}

+ (id)_stringForQualityOfService:(int64_t)a3
{
  if (a3 <= 16)
  {
    if (a3 == -1) {
      return @"Default";
    }
    if (a3 == 9) {
      return @"Background";
    }
  }
  else
  {
    switch(a3)
    {
      case 17:
        return @"Utility";
      case 25:
        return @"User Initiated";
      case 33:
        return @"User Interactive";
    }
  }
  return @"Unknown";
}

@end