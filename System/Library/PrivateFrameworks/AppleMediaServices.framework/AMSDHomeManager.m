@interface AMSDHomeManager
+ (id)homeIdentifierForRecord:(id)a3;
+ (id)homeIdentifierForRecordZone:(id)a3 inDatabase:(id)a4;
+ (id)homeUserIdentifierForRecord:(id)a3;
+ (id)homeUserIdentifierForRecordZone:(id)a3 inDatabase:(id)a4;
+ (id)identifiersForRecord:(id)a3;
+ (id)identifiersForRecordZone:(id)a3 inDatabase:(id)a4;
+ (id)identifiersForRecordZone:(id)a3 inDatabase:(id)a4 qualityOfService:(int64_t)a5;
+ (unint64_t)multiUserStatusForHomeUser:(id)a3 inHome:(id)a4;
- (AMSDHomeManager)initWithDataSource:(id)a3;
- (AMSDHomeManagerDataSource)dataSource;
- (AMSPromise)allHomes;
- (id)homeForRecord:(id)a3;
- (id)homeForRecordZone:(id)a3 inDatabase:(id)a4;
- (id)homeWithHomeIdentifier:(id)a3;
- (id)sendCloudShare:(id)a3 inContainer:(id)a4 toOwnerOfHome:(id)a5;
- (id)settingForKeyPath:(id)a3;
- (id)settingForKeyPath:(id)a3 user:(id)a4 home:(id)a5;
- (void)registerToAcceptCloudSharesForContainers:(id)a3;
- (void)setDataSource:(id)a3;
- (void)teardownMultiUser;
@end

@implementation AMSDHomeManager

- (id)homeForRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 type];
  unsigned __int8 v6 = [v5 isEqualToString:@"AMSHomeParticipant"];

  if ((v6 & 1) == 0)
  {
    v7 = AMSError();
    uint64_t v8 = +[AMSPromise promiseWithError:v7];
    goto LABEL_5;
  }
  v7 = [(id)objc_opt_class() homeIdentifierForRecord:v4];
  if (v7)
  {
    uint64_t v8 = [(AMSDHomeManager *)self homeWithHomeIdentifier:v7];
LABEL_5:
    v9 = (void *)v8;
    goto LABEL_7;
  }
  v10 = AMSError();
  v9 = +[AMSPromise promiseWithError:v10];

LABEL_7:
  return v9;
}

- (id)homeForRecordZone:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a3 identifier];
  uint64_t v8 = [v6 fetchRecordWithName:@"AMSHomeParticipant" zoneIdentifier:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100038F24;
  v11[3] = &unk_100112C70;
  v11[4] = self;
  v9 = [v8 thenWithBlock:v11];

  return v9;
}

+ (id)homeIdentifierForRecord:(id)a3
{
  v3 = [a3 fieldForKey:@"AMSHomeParticipant_HomeIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4) {
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

+ (id)homeIdentifierForRecordZone:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a3 identifier];
  uint64_t v8 = [v6 fetchRecordWithName:@"AMSHomeParticipant" zoneIdentifier:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000390C0;
  v11[3] = &unk_100113018;
  v11[4] = a1;
  v9 = [v8 thenWithBlock:v11];

  return v9;
}

+ (id)homeUserIdentifierForRecord:(id)a3
{
  v3 = [a3 fieldForKey:@"AMSHomeParticipant_HomeUserIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4) {
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

+ (id)homeUserIdentifierForRecordZone:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a3 identifier];
  uint64_t v8 = [v6 fetchRecordWithName:@"AMSHomeParticipant" zoneIdentifier:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100039334;
  v11[3] = &unk_100113018;
  v11[4] = a1;
  v9 = [v8 thenWithBlock:v11];

  return v9;
}

+ (id)identifiersForRecord:(id)a3
{
  id v4 = a3;
  id v5 = [a1 homeIdentifierForRecord:v4];
  id v6 = [a1 homeUserIdentifierForRecord:v4];

  id v7 = 0;
  if (v5 && v6) {
    id v7 = [objc_alloc((Class)AMSPair) initWithFirst:v5 second:v6];
  }

  return v7;
}

+ (id)identifiersForRecordZone:(id)a3 inDatabase:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() identifiersForRecordZone:v6 inDatabase:v5 qualityOfService:9];

  return v7;
}

+ (id)identifiersForRecordZone:(id)a3 inDatabase:(id)a4 qualityOfService:(int64_t)a5
{
  id v8 = a4;
  v9 = [a3 identifier];
  v10 = [v8 fetchRecordWithName:@"AMSHomeParticipant" zoneIdentifier:v9 qualityOfService:a5];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003962C;
  v13[3] = &unk_100113018;
  v13[4] = a1;
  v11 = [v10 thenWithBlock:v13];

  return v11;
}

+ (unint64_t)multiUserStatusForHomeUser:(id)a3 inHome:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v6 isMultiUserEnabled] & 1) == 0)
  {
    v12 = +[AMSLogConfig sharedAccountsMultiUserConfig];
    if (!v12)
    {
      v12 = +[AMSLogConfig sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = objc_opt_class();
      v15 = AMSLogKey();
      v16 = AMSHashIfNeeded();
      v17 = AMSHashIfNeeded();
      int v19 = 138544130;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      v22 = v15;
      __int16 v23 = 2114;
      v24 = v16;
      __int16 v25 = 2114;
      v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Multi-user isn't enabled. home = %{public}@ | user = %{public}@", (uint8_t *)&v19, 0x2Au);
    }
    goto LABEL_13;
  }
  id v7 = [v5 identifier];
  unsigned __int8 v8 = [v6 isRestrictedGuestUserIdentifier:v7];

  if (v8)
  {
LABEL_13:
    unint64_t v11 = 1;
    goto LABEL_14;
  }
  id v9 = [v6 mediaProfileEnabledForUser:v5];
  uint64_t v10 = 1;
  if (v9 == (id)2) {
    uint64_t v10 = 2;
  }
  if (v9) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = 0;
  }
LABEL_14:

  return v11;
}

- (AMSDHomeManager)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDHomeManager;
  id v6 = [(AMSDHomeManager *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (void)teardownMultiUser
{
  v3 = [(AMSDHomeManager *)self dataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(AMSDHomeManager *)self dataSource];
    [v5 teardownMultiUser];
  }
  [(AMSDHomeManager *)self setDataSource:0];
}

- (AMSPromise)allHomes
{
  v2 = [(AMSDHomeManager *)self dataSource];
  v3 = [v2 allHomes];
  id v4 = [v3 thenWithBlock:&stru_100113058];

  return (AMSPromise *)v4;
}

- (id)homeWithHomeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDHomeManager *)self allHomes];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100039B1C;
  v9[3] = &unk_100112320;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 thenWithBlock:v9];

  return v7;
}

- (void)registerToAcceptCloudSharesForContainers:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDHomeManager *)self dataSource];
  [v5 registerToAcceptCloudSharesForContainers:v4];
}

- (id)sendCloudShare:(id)a3 inContainer:(id)a4 toOwnerOfHome:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [(AMSDHomeManager *)self dataSource];
  v12 = [v11 sendCloudShare:v10 inContainer:v9 toOwnerOfHome:v8];

  return v12;
}

- (id)settingForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDHomeManager *)self dataSource];
  id v6 = [v5 settingForKeyPath:v4];

  return v6;
}

- (id)settingForKeyPath:(id)a3 user:(id)a4 home:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [(AMSDHomeManager *)self dataSource];
  v12 = [v11 settingForKeyPath:v10 user:v9 home:v8];

  return v12;
}

- (AMSDHomeManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end