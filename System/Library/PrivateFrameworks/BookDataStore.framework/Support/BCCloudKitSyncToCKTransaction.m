@interface BCCloudKitSyncToCKTransaction
+ (id)transactionNameForEntityName:(id)a3;
- (BCCloudDataSyncProvider)syncManager;
- (BCCloudKitSyncToCKTransaction)initWithEntityName:(id)a3 syncManager:(id)a4 delegate:(id)a5;
- (double)coalescingDelay;
- (double)transactionLifetimeTimout;
- (void)performWorkWithCompletion:(id)a3;
- (void)setSyncManager:(id)a3;
@end

@implementation BCCloudKitSyncToCKTransaction

- (BCCloudKitSyncToCKTransaction)initWithEntityName:(id)a3 syncManager:(id)a4 delegate:(id)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BCCloudKitSyncToCKTransaction;
  v10 = [(BCCloudKitTransaction *)&v13 initWithEntityName:a3 delegate:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_syncManager, a4);
  }

  return v11;
}

+ (id)transactionNameForEntityName:(id)a3
{
  return [@"BCCloudKitSyncToCKTransaction-" stringByAppendingString:a3];
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
      int v10 = 138412290;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "\"\\\"Transaction - Signaling Sync Manager for  %@\\\"\"", (uint8_t *)&v10, 0xCu);
    }
  }
  id v9 = [(BCCloudKitSyncToCKTransaction *)self syncManager];
  [v9 startSyncToCKWithCompletion:v4];
}

- (double)coalescingDelay
{
  return 5.0;
}

- (double)transactionLifetimeTimout
{
  return 5.0;
}

- (BCCloudDataSyncProvider)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end