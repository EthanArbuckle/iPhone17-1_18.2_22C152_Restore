@interface RestoreFromBackupHistoryController
- (void)parseLogsWithCollector:(id)a3;
- (void)start;
@end

@implementation RestoreFromBackupHistoryController

- (void)start
{
  id v3 = [objc_alloc((Class)DSGeneralLogCollector) initWithLogIDs:&off_1000042F8];
  if (([(RestoreFromBackupHistoryController *)self isCancelled] & 1) == 0) {
    [(RestoreFromBackupHistoryController *)self parseLogsWithCollector:v3];
  }
  [(RestoreFromBackupHistoryController *)self setFinished:1];
}

- (void)parseLogsWithCollector:(id)a3
{
  id v4 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_1000031D0;
  v32 = sub_1000031E0;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_1000031D0;
  v26 = sub_1000031E0;
  id v27 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000031E8;
  v13[3] = &unk_100004128;
  v13[4] = self;
  v13[5] = &v18;
  v13[6] = &v22;
  v13[7] = &v14;
  v13[8] = &v28;
  [v4 enumerateLogLinesWithBlock:v13];
  if (([(RestoreFromBackupHistoryController *)self isCancelled] & 1) == 0)
  {
    v5 = [(RestoreFromBackupHistoryController *)self result];
    [v5 setStatusCode:&off_100004310];

    if (*((unsigned char *)v19 + 24))
    {
      if (!v23[5])
      {
        v6 = [(RestoreFromBackupHistoryController *)self result];
        [v6 setStatusCode:&off_100004328];
        goto LABEL_7;
      }
      if (*((unsigned char *)v15 + 24))
      {
        v6 = [(RestoreFromBackupHistoryController *)self result];
        [v6 setStatusCode:&off_100004340];
LABEL_7:
      }
    }
    v34[0] = @"lastBackupRestoreEvent";
    v7 = [(id)v29[5] dictionary];
    v8 = dictionaryOrNull(v7);
    v34[1] = @"lastSuccessfulBackupRestoreEvent";
    v35[0] = v8;
    v9 = [(id)v23[5] dictionary];
    v10 = dictionaryOrNull(v9);
    v35[1] = v10;
    v11 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    v12 = [(RestoreFromBackupHistoryController *)self result];
    [v12 setData:v11];
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

@end