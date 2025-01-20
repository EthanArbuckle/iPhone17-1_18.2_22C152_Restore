@interface BackupHistoryController
- (void)parseLogsWithCollector:(id)a3;
- (void)start;
@end

@implementation BackupHistoryController

- (void)start
{
  id v3 = [objc_alloc((Class)DSGeneralLogCollector) initWithLogIDs:&off_1000042F8];
  if (([(BackupHistoryController *)self isCancelled] & 1) == 0) {
    [(BackupHistoryController *)self parseLogsWithCollector:v3];
  }
  [(BackupHistoryController *)self setFinished:1];
}

- (void)parseLogsWithCollector:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100003034;
  v23 = sub_100003044;
  id v24 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_100003034;
  v17 = sub_100003044;
  id v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000304C;
  v12[3] = &unk_100004128;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = &v19;
  [v4 enumerateLogLinesWithBlock:v12];
  if (([(BackupHistoryController *)self isCancelled] & 1) == 0)
  {
    if (v20[5])
    {
      if (v14[5])
      {
        v5 = [(BackupHistoryController *)self result];
        [v5 setStatusCode:&off_100004340];
      }
      else
      {
        v5 = [(BackupHistoryController *)self result];
        [v5 setStatusCode:&off_100004328];
      }
    }
    else
    {
      v5 = [(BackupHistoryController *)self result];
      [v5 setStatusCode:&off_100004310];
    }

    v25[0] = @"lastBackupEvent";
    v6 = [(id)v20[5] dictionary];
    if (v6) {
      [(id)v20[5] dictionary];
    }
    else {
    v7 = +[NSNull null];
    }
    v25[1] = @"lastSuccessfulBackupEvent";
    v26[0] = v7;
    v8 = [(id)v14[5] dictionary];
    if (v8) {
      [(id)v14[5] dictionary];
    }
    else {
    v9 = +[NSNull null];
    }
    v26[1] = v9;
    v10 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    v11 = [(BackupHistoryController *)self result];
    [v11 setData:v10];
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
}

@end