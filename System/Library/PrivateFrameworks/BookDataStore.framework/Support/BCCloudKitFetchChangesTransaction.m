@interface BCCloudKitFetchChangesTransaction
+ (id)transactionNameForEntityName:(id)a3;
- (BCCloudKitController)cloudKitController;
- (BCCloudKitFetchChangesTransaction)initWithCloudKitController:(id)a3 delegate:(id)a4;
- (double)coalescingDelay;
- (double)transactionLifetimeTimout;
- (void)performWorkWithCompletion:(id)a3;
- (void)setCloudKitController:(id)a3;
@end

@implementation BCCloudKitFetchChangesTransaction

- (BCCloudKitFetchChangesTransaction)initWithCloudKitController:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCCloudKitFetchChangesTransaction;
  v7 = [(BCCloudKitTransaction *)&v10 initWithEntityName:@"iBooks" delegate:a4];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_cloudKitController, v6);
  }

  return v8;
}

+ (id)transactionNameForEntityName:(id)a3
{
  return [@"BCCloudKitFetchChangesTransaction-" stringByAppendingString:a3];
}

- (void)performWorkWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[BULogUtilities shared];
  unsigned int v6 = [v5 verboseLoggingEnabled];

  if (v6)
  {
    v7 = sub_10000CD80();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(BCCloudKitTransaction *)self entityName];
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "\"\\\"BCCloudKitFetchChangesTransaction - Signaling Database to fetch changes for %@\\\"\"", buf, 0xCu);
    }
  }
  v9 = [(BCCloudKitFetchChangesTransaction *)self cloudKitController];
  objc_super v10 = [v9 privateCloudDatabaseController];

  if (v10)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100041DAC;
    v14[3] = &unk_100260D48;
    id v15 = v4;
    [v10 fetchChangesWithCompletion:v14];
    v11 = v15;
  }
  else
  {
    v12 = sub_1000083A0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001E6AA4(v12);
    }

    id v13 = objc_retainBlock(v4);
    v11 = v13;
    if (v13) {
      (*((void (**)(id))v13 + 2))(v13);
    }
  }
}

- (double)coalescingDelay
{
  return 2.0;
}

- (double)transactionLifetimeTimout
{
  return 5.0;
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
}

@end