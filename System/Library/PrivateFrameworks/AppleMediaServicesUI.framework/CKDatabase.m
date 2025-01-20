@interface CKDatabase
+ (id)_changeTokenKeyForDatabaseScope:(int64_t)a3 recordZoneName:(id)a4;
+ (id)_fetchChangeTokenWithDatabaseScope:(int64_t)a3;
+ (id)_fetchChangeTokenWithDatabaseScope:(int64_t)a3 recordZoneName:(id)a4;
+ (id)_stringForDatabaseScope:(int64_t)a3;
+ (id)_zoneIdentifiersWithExpiredTokensFrom:(id)a3 andErrors:(id)a4;
- (BOOL)_handleError:(id)a3 andErrors:(id)a4;
- (BOOL)isPrivateDatabase;
- (BOOL)isPublicDatabase;
- (BOOL)isSharedDatabase;
- (NSString)hashedDescription;
- (id)_fetchChangedRecordZonesWithServerChangeToken:(id)a3;
- (id)_fetchChangedRecordsInRecordZonesWithWithRecordZoneIDs:(id)a3 changeTokens:(id)a4;
- (id)_subscribeWithIdentifier:(id)a3 recordZoneIdentifier:(id)a4 attempt:(unint64_t)a5;
- (id)addRecordsToSave:(id)a3 recordIdentifiersToDelete:(id)a4;
- (id)createRecordWithRecordName:(id)a3 recordType:(id)a4 recordZone:(id)a5;
- (id)createRecordZoneWithRecordZoneName:(id)a3;
- (id)deleteRecordWithRecordIdentifier:(id)a3;
- (id)deleteRecordWithRecordIdentifier:(id)a3 missingEncryptionIdentity:(BOOL)a4;
- (id)deleteRecordZonesWithRecordZoneIdentifiers:(id)a3;
- (id)fetchChangedRecordZones;
- (id)fetchChangedRecordsInRecordZonesWithRecordZoneIdentifiers:(id)a3;
- (id)fetchRecordWithName:(id)a3 zoneIdentifier:(id)a4;
- (id)fetchRecordWithRecordIdentifier:(id)a3;
- (id)fetchRecordZones;
- (id)saveRecord:(id)a3;
- (id)saveRecordZone:(id)a3;
- (id)shareForRecordZoneIdentifier:(id)a3;
- (id)subscribeWithIdentifier:(id)a3;
- (id)subscribeWithIdentifier:(id)a3 recordZoneIdentifier:(id)a4;
- (unint64_t)type;
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
  return +[NSString stringWithFormat:@"<%@: %p type = %ld>", objc_opt_class(), self, [(CKDatabase *)self type]];
}

- (id)addRecordsToSave:(id)a3 recordIdentifiersToDelete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    id v8 = objc_alloc_init((Class)AMSPromise);
    id v9 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = (AMSCloudDataSavedRecordsResult *)v9;
    }
    else {
      v10 = 0;
    }

    id v11 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    id v13 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v10 recordIDsToDelete:v12];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001B3F3C;
    v17[3] = &unk_1002190F0;
    id v18 = v8;
    id v14 = v8;
    [v13 setModifyRecordsCompletionBlock:v17];
    [v13 setSavePolicy:0];
    [v13 setAtomic:0];
    [(CKDatabase *)self addOperation:v13];
    v15 = [v14 catchWithBlock:&stru_100219130];
  }
  else
  {
    v10 = [[AMSCloudDataSavedRecordsResult alloc] initWithSavedRecords:v6 deletedRecords:v7 error:0];
    v15 = +[AMSPromise promiseWithResult:v10];
  }

  return v15;
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
  id v12 = [v10 zoneID];
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

  id v8 = objc_alloc_init((Class)AMSPromise);
  id v9 = objc_alloc((Class)CKModifyRecordsOperation);
  id v17 = v7;
  id v10 = +[NSArray arrayWithObjects:&v17 count:1];
  id v11 = [v9 initWithRecordsToSave:0 recordIDsToDelete:v10];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001B438C;
  v15[3] = &unk_1002190F0;
  id v16 = v8;
  id v12 = v8;
  [v11 setModifyRecordsCompletionBlock:v15];
  [v11 setMarkAsParticipantNeedsNewInvitationToken:v4];
  [(CKDatabase *)self addOperation:v11];
  id v13 = [v12 catchWithBlock:&stru_100219150];

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

  id v6 = objc_alloc_init((Class)AMSPromise);
  id v7 = [objc_alloc((Class)CKModifyRecordZonesOperation) initWithRecordZonesToSave:0 recordZoneIDsToDelete:v5];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001B460C;
  v11[3] = &unk_1002190F0;
  id v12 = v6;
  id v8 = v6;
  [v7 setModifyRecordZonesCompletionBlock:v11];
  [(CKDatabase *)self addOperation:v7];
  id v9 = [v8 catchWithBlock:&stru_100219170];

  return v9;
}

- (id)fetchChangedRecordsInRecordZonesWithRecordZoneIdentifiers:(id)a3
{
  id v4 = objc_msgSend(a3, "ams_mapWithTransformIgnoresNil:", &stru_1002191B0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001B4878;
  v8[3] = &unk_1002191D8;
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
  v8[2] = sub_1001B4A00;
  v8[3] = &unk_100219200;
  v8[4] = self;
  id v5 = [v4 catchWithBlock:v8];

  id v6 = [v5 catchWithBlock:&stru_100219220];

  return v6;
}

- (id)fetchRecordWithName:(id)a3 zoneIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  id v9 = [objc_alloc((Class)CKRecordID) initWithRecordName:v7 zoneID:v8];
  id v10 = [(CKDatabase *)self fetchRecordWithRecordIdentifier:v9];

  return v10;
}

- (id)fetchRecordWithRecordIdentifier:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  id v6 = objc_alloc_init((Class)AMSPromise);
  id v7 = objc_alloc((Class)CKFetchRecordsOperation);
  id v20 = v5;
  id v8 = +[NSArray arrayWithObjects:&v20 count:1];
  id v9 = [v7 initWithRecordIDs:v8];

  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_1001B4D60;
  id v17 = &unk_100219248;
  id v18 = v5;
  id v19 = v6;
  id v10 = v6;
  id v11 = v5;
  [v9 setFetchRecordsCompletionBlock:&v14];
  -[CKDatabase addOperation:](self, "addOperation:", v9, v14, v15, v16, v17);
  id v12 = [v10 catchWithBlock:&stru_100219268];

  return v12;
}

- (id)fetchRecordZones
{
  id v3 = objc_alloc_init((Class)AMSPromise);
  id v4 = +[CKFetchRecordZonesOperation fetchAllRecordZonesOperation];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001B5084;
  v9[3] = &unk_100219290;
  id v5 = v3;
  id v10 = v5;
  [v4 setFetchRecordZonesCompletionBlock:v9];
  [(CKDatabase *)self addOperation:v4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001B51B4;
  v8[3] = &unk_1002192E0;
  v8[4] = self;
  [v5 addSuccessBlock:v8];
  id v6 = v5;

  return v6;
}

- (void)persistChangedRecordZonesChangeToken:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AMSTokenStorage);
  uint64_t v6 = [(AMSTokenStorage *)v5 loadWithName:@"AMSCloudKitDatabaseChangeTokens"];
  id v7 = (void *)v6;
  id v8 = &__NSDictionary0__struct;
  if (v6) {
    id v8 = (void *)v6;
  }
  id v9 = v8;

  id v10 = [v9 mutableCopy];
  if (v4)
  {
    id v22 = 0;
    id v11 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v22];
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
        uint64_t v18 = objc_opt_class();
        id v20 = AMSLogKey();
        id v19 = AMSHashIfNeeded();
        uint64_t v15 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138544130;
        uint64_t v24 = v18;
        __int16 v25 = 2114;
        v26 = v20;
        __int16 v27 = 2114;
        v28 = v19;
        __int16 v29 = 2114;
        uint64_t v30 = v15;
        id v16 = (void *)v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to archive a database change token. database = %{public}@ | error = %{public}@", buf, 0x2Au);
      }
    }
  }
  else
  {
    id v11 = 0;
  }
  id v17 = objc_msgSend((id)objc_opt_class(), "_stringForDatabaseScope:", -[CKDatabase scope](self, "scope"));
  [v10 setObject:v11 forKeyedSubscript:v17];

  if (([v9 isEqualToDictionary:v10] & 1) == 0)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001B5520;
    v21[3] = &unk_100219308;
    v21[4] = self;
    [(AMSTokenStorage *)v5 save:v10 name:@"AMSCloudKitDatabaseChangeTokens" completionHandler:v21];
  }
}

- (void)persistChangedRecordsChangeToken:(id)a3 forRecordZoneIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v8)
  {
    id v8 = +[AMSLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = AMSLogKey();
    id v12 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544130;
    uint64_t v36 = v10;
    __int16 v37 = 2114;
    v38 = v11;
    __int16 v39 = 2112;
    id v40 = v6;
    __int16 v41 = 2114;
    v42 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Setting a change token. changeToken = %@ | zoneIdentifier = %{public}@", buf, 0x2Au);
  }
  id v13 = objc_alloc_init(AMSTokenStorage);
  uint64_t v14 = [(AMSTokenStorage *)v13 loadWithName:@"AMSCloudKitRecordZoneChangeTokens"];
  uint64_t v15 = (void *)v14;
  id v16 = &__NSDictionary0__struct;
  if (v14) {
    id v16 = (void *)v14;
  }
  id v17 = v16;

  id v18 = [v17 mutableCopy];
  if (v6)
  {
    id v34 = 0;
    id v19 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v34];
    id v20 = v34;
    if (!v19)
    {
      v21 = +[AMSLogConfig sharedAccountsDaemonConfig];
      if (!v21)
      {
        v21 = +[AMSLogConfig sharedConfig];
      }
      id v22 = [v21 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = objc_opt_class();
        v31 = AMSLogKey();
        id v28 = [(CKDatabase *)self scope];
        uint64_t v30 = AMSHashIfNeeded();
        __int16 v27 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138544386;
        uint64_t v36 = v29;
        __int16 v37 = 2114;
        v38 = v31;
        __int16 v39 = 2048;
        id v40 = v28;
        __int16 v41 = 2114;
        v42 = v30;
        __int16 v43 = 2114;
        v44 = v27;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to archive a record zone change token. databaseScope = %ld | zoneName = %{public}@ | error = %{public}@", buf, 0x34u);
      }
    }
  }
  else
  {
    id v19 = 0;
  }
  v23 = objc_opt_class();
  id v24 = [(CKDatabase *)self scope];
  __int16 v25 = [v7 name];
  v26 = [v23 _changeTokenKeyForDatabaseScope:v24 recordZoneName:v25];

  [v18 setObject:v19 forKeyedSubscript:v26];
  if (([v17 isEqualToDictionary:v18] & 1) == 0)
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1001B5A64;
    v32[3] = &unk_100219330;
    v32[4] = self;
    id v33 = v7;
    [(AMSTokenStorage *)v13 save:v18 name:@"AMSCloudKitRecordZoneChangeTokens" completionHandler:v32];
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

  id v6 = objc_alloc_init((Class)AMSPromise);
  id v7 = objc_alloc((Class)CKModifyRecordsOperation);
  id v15 = v5;
  id v8 = +[NSArray arrayWithObjects:&v15 count:1];
  id v9 = [v7 initWithRecordsToSave:v8 recordIDsToDelete:0];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001B5D7C;
  v13[3] = &unk_1002190F0;
  id v14 = v6;
  id v10 = v6;
  [v9 setModifyRecordsCompletionBlock:v13];
  [(CKDatabase *)self addOperation:v9];
  id v11 = [v10 catchWithBlock:&stru_100219350];

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

  id v6 = objc_alloc_init((Class)AMSPromise);
  id v7 = objc_alloc((Class)CKModifyRecordZonesOperation);
  id v15 = v5;
  id v8 = +[NSArray arrayWithObjects:&v15 count:1];
  id v9 = [v7 initWithRecordZonesToSave:v8 recordZoneIDsToDelete:0];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001B6054;
  v13[3] = &unk_1002190F0;
  id v14 = v6;
  id v10 = v6;
  [v9 setModifyRecordZonesCompletionBlock:v13];
  [(CKDatabase *)self addOperation:v9];
  id v11 = [v10 catchWithBlock:&stru_100219370];

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
  return [(CKDatabase *)self _subscribeWithIdentifier:a3 recordZoneIdentifier:0 attempt:0];
}

- (id)subscribeWithIdentifier:(id)a3 recordZoneIdentifier:(id)a4
{
  return [(CKDatabase *)self _subscribeWithIdentifier:a3 recordZoneIdentifier:a4 attempt:0];
}

- (id)_subscribeWithIdentifier:(id)a3 recordZoneIdentifier:(id)a4 attempt:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v10)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    id v13 = AMSLogKey();
    id v14 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543874;
    uint64_t v37 = v12;
    __int16 v38 = 2114;
    __int16 v39 = v13;
    __int16 v40 = 2114;
    __int16 v41 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Setting up a database subscription. database = %{public}@", buf, 0x20u);
  }
  id v15 = objc_alloc_init((Class)CKNotificationInfo);
  [v15 setShouldSendContentAvailable:1];
  id v16 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }

  if (v17) {
    id v18 = [objc_alloc((Class)CKRecordZoneSubscription) initWithZoneID:v17 subscriptionID:v8];
  }
  else {
    id v18 = [objc_alloc((Class)CKDatabaseSubscription) initWithSubscriptionID:v8];
  }
  id v19 = v18;
  [v18 setNotificationInfo:v15];
  id v20 = objc_alloc_init((Class)AMSPromise);
  id v21 = objc_alloc((Class)CKModifySubscriptionsOperation);
  v35 = v19;
  id v22 = +[NSArray arrayWithObjects:&v35 count:1];
  id v23 = [v21 initWithSubscriptionsToSave:v22 subscriptionIDsToDelete:0];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1001B6588;
  v33[3] = &unk_1002190F0;
  id v34 = v20;
  id v24 = v20;
  [v23 setModifySubscriptionsCompletionBlock:v33];
  [(CKDatabase *)self addOperation:v23];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1001B665C;
  v29[3] = &unk_1002193C0;
  v29[4] = self;
  id v30 = v8;
  id v31 = v16;
  unint64_t v32 = a5;
  id v25 = v16;
  id v26 = v8;
  __int16 v27 = [v24 continueWithBlock:v29];

  return v27;
}

+ (id)_changeTokenKeyForDatabaseScope:(int64_t)a3 recordZoneName:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _stringForDatabaseScope:a3];
  id v8 = +[NSString stringWithFormat:@"%@:%@", v7, v6];

  return v8;
}

- (id)_fetchChangedRecordZonesWithServerChangeToken:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)CKFetchDatabaseChangesOperation) initWithPreviousServerChangeToken:v4];

  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = objc_alloc_init((Class)NSMutableArray);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001B6DE0;
  v22[3] = &unk_1002193E8;
  id v8 = v6;
  id v23 = v8;
  [v5 setRecordZoneWithIDChangedBlock:v22];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001B6DEC;
  v20[3] = &unk_1002193E8;
  id v9 = v7;
  id v21 = v9;
  [v5 setRecordZoneWithIDWasDeletedBlock:v20];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001B6DF8;
  v16[3] = &unk_100219410;
  id v10 = objc_alloc_init((Class)AMSPromise);
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
  v48[2] = sub_1001B7288;
  v48[3] = &unk_1002191D8;
  id v29 = a4;
  id v49 = v29;
  id v28 = objc_msgSend(v6, "ams_invertedDictionaryUsingTransform:", v48);
  id v7 = [objc_alloc((Class)CKFetchRecordZoneChangesOperation) initWithRecordZoneIDs:v6 configurationsByRecordZoneID:v28];
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1001B7308;
  v46[3] = &unk_100219438;
  id v12 = v8;
  id v47 = v12;
  [v7 setRecordChangedBlock:v46];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1001B73E8;
  v44[3] = &unk_100219460;
  id v13 = v9;
  id v45 = v13;
  [v7 setRecordWithIDWasDeletedBlock:v44];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1001B74A8;
  v39[3] = &unk_100219488;
  id v14 = v11;
  id v40 = v14;
  id v15 = v12;
  id v41 = v15;
  id v16 = v13;
  id v42 = v16;
  id v17 = v10;
  id v43 = v17;
  [v7 setRecordZoneFetchCompletionBlock:v39];
  id v18 = objc_alloc_init((Class)AMSPromise);
  id v19 = AMSLogKey();
  objc_initWeak(&location, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1001B7558;
  v30[3] = &unk_1002194F0;
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
  id v26 = [v25 catchWithBlock:&stru_100219510];

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

  return v26;
}

- (BOOL)_handleError:(id)a3 andErrors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = self;
  id v29 = v6;
  id v9 = [(id)objc_opt_class() _zoneIdentifiersWithExpiredTokensFrom:v6 andErrors:v7];
  id v10 = [v9 countByEnumeratingWithState:&v30 objects:v42 count:16];
  id v11 = v10;
  if (v10)
  {
    id v26 = v7;
    uint64_t v12 = *(void *)v31;
    id v13 = &NSFileProtectionComplete_ptr;
    id v25 = v10;
    id v28 = v8;
    uint64_t v27 = *(void *)v31;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v14);
        id v16 = [(NSFileProtectionType *)(id)v13[39] sharedAccountsDaemonConfig];
        if (!v16)
        {
          id v16 = [(NSFileProtectionType *)(id)v13[39] sharedConfig];
        }
        id v17 = [v16 OSLogObject];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = v11;
          id v19 = v9;
          uint64_t v20 = objc_opt_class();
          id v21 = AMSLogKey();
          AMSHashIfNeeded();
          v23 = id v22 = v13;
          *(_DWORD *)buf = 138544130;
          uint64_t v35 = v20;
          id v9 = v19;
          id v11 = v18;
          __int16 v36 = 2114;
          id v37 = v21;
          __int16 v38 = 2114;
          uint64_t v39 = v15;
          __int16 v40 = 2114;
          id v41 = v23;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Change Token Expired for zone %{public}@, removing. error = %{public}@", buf, 0x2Au);

          id v13 = v22;
          uint64_t v12 = v27;
          id v8 = v28;
        }

        [(CKDatabase *)v8 persistChangedRecordsChangeToken:0 forRecordZoneIdentifier:v15];
        id v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      id v11 = [v9 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v11);

    [(CKDatabase *)v8 persistChangedRecordZonesChangeToken:0];
    id v11 = v25;
    id v7 = v26;
  }
  else
  {
  }
  return v11 != 0;
}

+ (id)_zoneIdentifiersWithExpiredTokensFrom:(id)a3 andErrors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableSet set];
  long long v30 = v7;
  id v9 = [v7 mutableCopy];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = +[NSMutableDictionary dictionary];
  }
  uint64_t v12 = v11;

  if (v6)
  {
    id v13 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"not_a_real_zone_name" ownerName:@"fake_owner"];
    [v12 setObject:v6 forKeyedSubscript:v13];
  }
  long long v31 = v6;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [v12 allKeys];
  id v34 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v40;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v40 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        id v16 = v12;
        id v17 = [v12 objectForKeyedSubscript:v15];
        if (objc_msgSend(v17, "amsd_isCKChangeTokenExpiredError")) {
          [v8 addObject:v15];
        }
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v18 = [v17 underlyingErrors];
        id v19 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v36;
          do
          {
            for (j = 0; j != v20; j = (char *)j + 1)
            {
              if (*(void *)v36 != v21) {
                objc_enumerationMutation(v18);
              }
              id v23 = [a1 _zoneIdentifiersWithExpiredTokensFrom:*(void *)(*((void *)&v35 + 1) + 8 * (void)j) andErrors:0];
              [v8 unionSet:v23];
            }
            id v20 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }
          while (v20);
        }

        if (objc_msgSend(v17, "amsd_isCKPartialFailureError"))
        {
          id v24 = [v17 userInfo];
          id v25 = [v24 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v26 = v25;
          }
          else {
            id v26 = 0;
          }

          uint64_t v27 = objc_msgSend(v26, "ams_filterUsingTest:", &stru_100219550);

          id v28 = [a1 _zoneIdentifiersWithExpiredTokensFrom:0 andErrors:v27];
          [v8 unionSet:v28];
        }
        uint64_t v12 = v16;
      }
      id v34 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v34);
  }

  return v8;
}

+ (id)_fetchChangeTokenWithDatabaseScope:(int64_t)a3
{
  id v5 = objc_alloc_init(AMSTokenStorage);
  id v6 = [(AMSTokenStorage *)v5 loadWithName:@"AMSCloudKitDatabaseChangeTokens"];
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
      uint64_t v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = objc_opt_class();
        id v13 = AMSLogKey();
        id v14 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138544130;
        uint64_t v19 = v16;
        __int16 v20 = 2114;
        uint64_t v21 = v13;
        __int16 v22 = 2048;
        int64_t v23 = a3;
        __int16 v24 = 2114;
        id v25 = v14;
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
  id v7 = objc_alloc_init(AMSTokenStorage);
  id v8 = [(AMSTokenStorage *)v7 loadWithName:@"AMSCloudKitRecordZoneChangeTokens"];
  id v9 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = a1;
    int64_t v12 = a3;
    uint64_t v13 = objc_opt_class();
    AMSLogKey();
    id v14 = v31 = v7;
    AMSHashIfNeeded();
    uint64_t v16 = v15 = v6;
    id v17 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544386;
    uint64_t v35 = v13;
    a3 = v12;
    a1 = v11;
    __int16 v36 = 2114;
    long long v37 = v14;
    __int16 v38 = 2048;
    int64_t v39 = a3;
    __int16 v40 = 2114;
    long long v41 = v16;
    __int16 v42 = 2114;
    id v43 = v17;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found change token. databaseScope = %ld | zoneName = %{public}@ | changeTokens = %{public}@", buf, 0x34u);

    id v6 = v15;
    id v7 = v31;
  }

  id v18 = [a1 _changeTokenKeyForDatabaseScope:a3 recordZoneName:v6];
  uint64_t v19 = [v8 objectForKeyedSubscript:v18];

  if (v19)
  {
    int64_t v20 = a3;
    id v33 = 0;
    uint64_t v21 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v19 error:&v33];
    id v22 = v33;
    if (!v21)
    {
      id v30 = v6;
      long long v32 = v7;
      int64_t v23 = +[AMSLogConfig sharedAccountsDaemonConfig];
      if (!v23)
      {
        int64_t v23 = +[AMSLogConfig sharedConfig];
      }
      __int16 v24 = [v23 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = objc_opt_class();
        id v25 = AMSLogKey();
        id v26 = AMSHashIfNeeded();
        uint64_t v27 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138544386;
        uint64_t v35 = v29;
        __int16 v36 = 2114;
        long long v37 = v25;
        __int16 v38 = 2048;
        int64_t v39 = v20;
        __int16 v40 = 2114;
        long long v41 = v26;
        __int16 v42 = 2114;
        id v43 = v27;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to unarchive a record zone change token. databaseScope = %ld | zoneName = %{public}@ | error = %{public}@", buf, 0x34u);
      }
      id v6 = v30;
      id v7 = v32;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
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

@end