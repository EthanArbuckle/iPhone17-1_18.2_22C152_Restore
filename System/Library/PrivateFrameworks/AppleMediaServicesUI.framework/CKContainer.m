@interface CKContainer
- (AMSCloudDataDatabase)privateDatabase;
- (AMSCloudDataDatabase)publicDatabase;
- (AMSCloudDataDatabase)sharedDatabase;
- (BOOL)isAvailable;
- (NSString)hashedDescription;
- (NSString)identifier;
- (id)_acceptShareWithShareMetadata:(id)a3;
- (id)_fetchShareMetadataForURL:(id)a3 withToken:(id)a4;
- (id)acceptShareURL:(id)a3 withToken:(id)a4;
- (id)fetchUserRecordID;
- (id)queryDeviceToDeviceEncryptionAvailability;
@end

@implementation CKContainer

- (NSString)identifier
{
  return [(CKContainer *)self containerIdentifier];
}

- (BOOL)isAvailable
{
  id v2 = objc_alloc_init((Class)CKAccountInfo);
  if ([v2 accountStatus])
  {
    if ([v2 accountStatus] == (id)1) {
      unsigned __int8 v3 = [v2 supportsDeviceToDeviceEncryption];
    }
    else {
      unsigned __int8 v3 = 0;
    }
  }
  else
  {
    v4 = +[AMSLogConfig sharedAccountsMultiUserConfig];
    if (!v4)
    {
      v4 = +[AMSLogConfig sharedConfig];
    }
    v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_opt_class();
      v7 = AMSLogKey();
      int v9 = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] accountInfo.accountStatus == CKAccountStatusCouldNotDetermine", (uint8_t *)&v9, 0x16u);
    }
    unsigned __int8 v3 = 1;
  }

  return v3;
}

- (AMSCloudDataDatabase)privateDatabase
{
  return (AMSCloudDataDatabase *)[(CKContainer *)self privateCloudDatabase];
}

- (AMSCloudDataDatabase)publicDatabase
{
  return (AMSCloudDataDatabase *)[(CKContainer *)self publicCloudDatabase];
}

- (AMSCloudDataDatabase)sharedDatabase
{
  return (AMSCloudDataDatabase *)[(CKContainer *)self sharedCloudDatabase];
}

- (NSString)hashedDescription
{
  return (NSString *)[(CKContainer *)self description];
}

- (id)acceptShareURL:(id)a3 withToken:(id)a4
{
  v5 = [(CKContainer *)self _fetchShareMetadataForURL:a3 withToken:a4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001B36D0;
  v9[3] = &unk_100219028;
  v9[4] = self;
  uint64_t v6 = [v5 thenWithBlock:v9];
  v7 = [v6 binaryPromiseAdapter];

  return v7;
}

- (id)fetchUserRecordID
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001B3788;
  v5[3] = &unk_100219050;
  id v3 = objc_alloc_init((Class)AMSPromise);
  id v6 = v3;
  [(CKContainer *)self fetchUserRecordIDWithCompletionHandler:v5];

  return v3;
}

- (id)queryDeviceToDeviceEncryptionAvailability
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001B3844;
  v5[3] = &unk_100219078;
  id v3 = objc_alloc_init((Class)AMSPromise);
  id v6 = v3;
  [(CKContainer *)self accountInfoWithCompletionHandler:v5];

  return v3;
}

- (id)_acceptShareWithShareMetadata:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)AMSPromise);
  id v6 = objc_alloc((Class)CKAcceptSharesOperation);
  id v13 = v4;
  v7 = +[NSArray arrayWithObjects:&v13 count:1];
  id v8 = [v6 initWithShareMetadatas:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001B3A1C;
  v11[3] = &unk_1002190A0;
  id v9 = v5;
  id v12 = v9;
  [v8 setPerShareCompletionBlock:v11];
  [(CKContainer *)self addOperation:v8];

  return v9;
}

- (id)_fetchShareMetadataForURL:(id)a3 withToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  id v9 = objc_alloc_init((Class)AMSPromise);
  id v10 = objc_alloc((Class)CKFetchShareMetadataOperation);
  if (v8)
  {
    id v24 = v6;
    __int16 v11 = +[NSArray arrayWithObjects:&v24 count:1];
    id v22 = v6;
    id v23 = v8;
    id v12 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v13 = [v10 initWithShareURLs:v11 invitationTokensByShareURL:v12];
  }
  else
  {
    id v21 = v6;
    __int16 v11 = +[NSArray arrayWithObjects:&v21 count:1];
    id v13 = [v10 initWithShareURLs:v11];
  }

  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_1001B3C30;
  v19 = &unk_1002190C8;
  id v14 = v9;
  id v20 = v14;
  [v13 setPerShareMetadataBlock:&v16];
  -[CKContainer addOperation:](self, "addOperation:", v13, v16, v17, v18, v19);

  return v14;
}

@end