@interface PLCacheUpdatesMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLCacheUpdatesMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v4 = a3;
  v5 = [(PLMaintenanceTask *)self photoLibrary];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006390;
  v10[3] = &unk_10002D400;
  v10[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000064F8;
  v8[3] = &unk_10002D4B0;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  [v5 performTransactionAndWait:v10 completionHandler:v8];

  return 1;
}

@end