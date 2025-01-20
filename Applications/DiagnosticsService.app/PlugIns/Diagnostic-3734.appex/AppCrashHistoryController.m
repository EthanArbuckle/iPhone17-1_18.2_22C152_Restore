@interface AppCrashHistoryController
- (AppCrashHistoryInputs)inputs;
- (id)appNameForBundleID:(id)a3;
- (id)userFriendlyAppNameForBundleID:(id)a3;
- (void)parseLogsWithCollector:(id)a3;
- (void)setInputs:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
@end

@implementation AppCrashHistoryController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
}

- (void)start
{
  id v3 = objc_alloc((Class)DSGeneralLogCollector);
  v4 = [(AppCrashHistoryController *)self inputs];
  v5 = [v4 logIds];
  id v6 = [v3 initWithLogIDs:v5];

  if (([(AppCrashHistoryController *)self isCancelled] & 1) == 0) {
    [(AppCrashHistoryController *)self parseLogsWithCollector:v6];
  }
  [(AppCrashHistoryController *)self setFinished:1];
}

- (void)parseLogsWithCollector:(id)a3
{
  id v22 = a3;
  v4 = +[NSMutableDictionary dictionary];
  v5 = +[NSMutableDictionary dictionary];
  id v6 = +[NSMutableSet set];
  objc_initWeak(&location, self);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000243C;
  v26[3] = &unk_100004210;
  objc_copyWeak(&v30, &location);
  id v7 = v4;
  id v27 = v7;
  id v8 = v6;
  id v28 = v8;
  id v9 = v5;
  id v29 = v9;
  [v22 enumerateLogLinesWithBlock:v26];
  if (([(AppCrashHistoryController *)self isCancelled] & 1) == 0)
  {
    v10 = +[DSGeneralLogCollector latestUserLog];
    v11 = [v10 restoreDate];
    [v11 timeIntervalSinceNow];
    double v13 = v12;

    +[NSMutableArray array];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100002664;
    v23[3] = &unk_100004238;
    double v25 = v13 / -86400.0;
    v23[4] = self;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v24 = v14;
    [v7 enumerateKeysAndObjectsUsingBlock:v23];
    v15 = +[NSNull null];
    if ([v14 count])
    {
      v16 = [(AppCrashHistoryController *)self result];
      [v16 setStatusCode:&off_100004450];

      v17 = +[NSSortDescriptor sortDescriptorWithKey:&stru_100004398 ascending:1];
      v32 = v17;
      v18 = +[NSArray arrayWithObjects:&v32 count:1];
      uint64_t v19 = [v14 sortedArrayUsingDescriptors:v18];

      v15 = (void *)v19;
    }
    else
    {
      v17 = [(AppCrashHistoryController *)self result];
      [v17 setStatusCode:&off_100004468];
    }

    v20 = +[NSMutableDictionary dictionary];
    [v20 setValue:v15 forKey:@"frequentlyCrashingApps"];
    if ([v9 count]) {
      [v20 setValue:v9 forKey:@"panicCounts"];
    }
    v21 = [(AppCrashHistoryController *)self result];
    [v21 setData:v20];
  }
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (id)userFriendlyAppNameForBundleID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4 || ![v4 length]) {
    goto LABEL_11;
  }
  id v6 = [v5 length];
  if (v6 < [@"com.apple." length]) {
    goto LABEL_9;
  }
  id v7 = [v5 substringToIndex:@"com.apple.".length];
  if (([v7 isEqualToString:@"com.apple."] & 1) == 0)
  {

    goto LABEL_9;
  }
  id v8 = [(AppCrashHistoryController *)self inputs];
  id v9 = [v8 whitelist];
  if ([v9 count])
  {
    v10 = [(AppCrashHistoryController *)self inputs];
    v11 = [v10 whitelist];
    unsigned int v12 = [v11 containsObject:v5];

    if (!v12) {
      goto LABEL_11;
    }
LABEL_9:
    double v13 = [(AppCrashHistoryController *)self appNameForBundleID:v5];
    goto LABEL_12;
  }

LABEL_11:
  double v13 = 0;
LABEL_12:

  return v13;
}

- (id)appNameForBundleID:(id)a3
{
  id v3 = a3;
  id v9 = 0;
  id v4 = +[LSApplicationRecord bundleRecordWithApplicationIdentifier:v3 error:&v9];
  id v5 = v9;
  if (v4)
  {
    id v6 = [v4 localizedName];
  }
  else
  {
    id v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000029A8((uint64_t)v3, (uint64_t)v5, v7);
    }

    id v6 = 0;
  }

  return v6;
}

- (AppCrashHistoryInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end