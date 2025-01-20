@interface BCCloudChangeTokenController
- (BCCloudChangeTokenController)initWithMOC:(id)a3 zoneName:(id)a4 cloudKitController:(id)a5;
- (BCCloudKitController)cloudKitController;
- (BOOL)enableCloudSync;
- (NSManagedObjectContext)moc;
- (NSString)zoneName;
- (void)deleteCloudDataWithCompletion:(id)a3;
- (void)serverChangeTokenWithCompletion:(id)a3;
- (void)setCloudKitController:(id)a3;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)setMoc:(id)a3;
- (void)setZoneName:(id)a3;
- (void)storeServerChangeToken:(id)a3 completion:(id)a4;
- (void)updateSaltVersionIdentifier:(id)a3 completion:(id)a4;
- (void)zoneNeedsUpdate:(id)a3 completion:(id)a4;
@end

@implementation BCCloudChangeTokenController

- (BCCloudChangeTokenController)initWithMOC:(id)a3 zoneName:(id)a4 cloudKitController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)BCCloudChangeTokenController;
  v11 = [(BCCloudChangeTokenController *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_moc, v8);
    v13 = (NSString *)[v9 copy];
    zoneName = v12->_zoneName;
    v12->_zoneName = v13;

    id v15 = objc_storeWeak((id *)&v12->_cloudKitController, v10);
    unsigned int v16 = [v10 didChangeContainer];

    if (v16)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100053F04;
      v18[3] = &unk_100261018;
      v19 = v12;
      [(BCCloudChangeTokenController *)v19 dissociateCloudDataFromSyncWithCompletion:v18];
    }
  }

  return v12;
}

- (void)setEnableCloudSync:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[BULogUtilities shared];
  unsigned int v6 = [v5 verboseLoggingEnabled];

  if (v6)
  {
    v7 = sub_10000CD80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v8 = @"NO";
      if (v3) {
        CFStringRef v8 = @"YES";
      }
      int v14 = 138412290;
      CFStringRef v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudChangeTokenController #enableCloudSync setEnableCloudSync %@\\\"\"", (uint8_t *)&v14, 0xCu);
    }
  }
  if (self->_enableCloudSync != v3)
  {
    self->_enableCloudSync = v3;
    if (v3)
    {
      id v9 = objc_alloc((Class)CKRecordZoneID);
      id v10 = [(BCCloudChangeTokenController *)self zoneName];
      id v11 = [v9 initWithZoneName:v10 ownerName:CKCurrentUserDefaultName];

      v12 = [(BCCloudChangeTokenController *)self cloudKitController];
      v13 = [v12 privateCloudDatabaseController];
      [v13 registerServerChangeTokenStore:self forZoneID:v11];
    }
    else
    {
      id v11 = [(BCCloudChangeTokenController *)self cloudKitController];
      v12 = [v11 privateCloudDatabaseController];
      [v12 unregisterServerChangeTokenStore:self];
    }
  }
}

- (void)zoneNeedsUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(BCCloudChangeTokenController *)self moc];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100054290;
  v11[3] = &unk_1002604D8;
  v11[4] = self;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v8 = v7;
  id v9 = v13;
  id v10 = v6;
  [v9 performBlock:v11];
}

- (void)updateSaltVersionIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(BCCloudChangeTokenController *)self moc];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000546E4;
  v11[3] = &unk_1002604D8;
  v11[4] = self;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v8 = v7;
  id v9 = v13;
  id v10 = v6;
  [v9 performBlock:v11];
}

- (void)deleteCloudDataWithCompletion:(id)a3
{
  id v4 = a3;
  [(BCCloudChangeTokenController *)self moc];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100054BB4;
  v7[3] = &unk_100260528;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = self;
  id v10 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 performBlock:v7];
}

- (void)storeServerChangeToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(BCCloudChangeTokenController *)self enableCloudSync])
  {
    id v8 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v6 encodeWithCoder:v8];
    [v8 finishEncoding];
    id v9 = [v8 encodedData];
    id v10 = [(BCCloudChangeTokenController *)self moc];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100055034;
    v18[3] = &unk_100261698;
    void v18[4] = self;
    id v19 = v6;
    id v20 = v10;
    id v21 = v9;
    id v22 = v7;
    id v11 = v9;
    id v12 = v10;
    [v12 performBlock:v18];
  }
  else
  {
    id v13 = +[BULogUtilities shared];
    unsigned int v14 = [v13 verboseLoggingEnabled];

    if (v14)
    {
      CFStringRef v15 = sub_10000CD80();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v16 = [(BCCloudChangeTokenController *)self zoneName];
        *(_DWORD *)buf = 138412546;
        v24 = v16;
        __int16 v25 = 2112;
        id v26 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudChangeTokenController - #recordChange zone: %@ NOT storing server change token: %@\\\"\"", buf, 0x16u);
      }
    }
    id v17 = objc_retainBlock(v7);
    id v8 = v17;
    if (v17) {
      (*((void (**)(id))v17 + 2))(v17);
    }
  }
}

- (void)serverChangeTokenWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudChangeTokenController *)self moc];
  id v6 = sub_1000083A0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(BCCloudChangeTokenController *)self zoneName];
    *(_DWORD *)buf = 138412290;
    CFStringRef v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "BCCloudChangeTokenController - serverChangeTokenWithCompletion: %@", buf, 0xCu);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000553C4;
  v10[3] = &unk_100260528;
  id v11 = v5;
  id v12 = self;
  id v13 = v4;
  id v8 = v4;
  id v9 = v5;
  [v9 performBlock:v10];
}

- (BOOL)enableCloudSync
{
  return self->_enableCloudSync;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (NSManagedObjectContext)moc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_moc);
  return (NSManagedObjectContext *)WeakRetained;
}

- (void)setMoc:(id)a3
{
}

- (BCCloudKitController)cloudKitController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitController);
  return (BCCloudKitController *)WeakRetained;
}

- (void)setCloudKitController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cloudKitController);
  objc_destroyWeak((id *)&self->_moc);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end