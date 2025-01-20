@interface BYSoftwareUpdateCache
- (NSDate)lastScanDate;
- (SUDescriptor)latestUpdate;
- (SUDescriptor)preferredUpdate;
- (unint64_t)_retryDelaySecondsForAttemptCount:(unint64_t)a3;
- (void)_scanUsingCache:(BOOL)a3 allowBootstrap:(BOOL)a4 attemptCount:(unint64_t)a5 attemptsAllowed:(unint64_t)a6 withCompletion:(id)a7;
- (void)_scanUsingCache:(BOOL)a3 allowBootstrap:(BOOL)a4 attemptsAllowed:(unint64_t)a5 withCompletion:(id)a6;
- (void)reset;
- (void)scanUsingCache:(BOOL)a3 allowBootstrap:(BOOL)a4 retry:(BOOL)a5 withCompletion:(id)a6;
- (void)scanUsingCache:(BOOL)a3 allowBootstrap:(BOOL)a4 withCompletion:(id)a5;
- (void)scanUsingCache:(BOOL)a3 withCompletion:(id)a4;
- (void)setLastScanDate:(id)a3;
- (void)setLatestUpdate:(id)a3;
- (void)setPreferredUpdate:(id)a3;
@end

@implementation BYSoftwareUpdateCache

- (void)scanUsingCache:(BOOL)a3 withCompletion:(id)a4
{
  v25 = self;
  SEL v24 = a2;
  BOOL v23 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  char v20 = 0;
  BOOL v4 = 0;
  if (v23)
  {
    id v21 = [(BYSoftwareUpdateCache *)v25 preferredUpdate];
    char v20 = 1;
    BOOL v4 = 0;
    if (v21) {
      BOOL v4 = location != 0;
    }
  }
  if (v20) {

  }
  if (v4)
  {
    v5 = (void (**)(id, id, id, void))location;
    v6 = [(BYSoftwareUpdateCache *)v25 preferredUpdate];
    v7 = [(BYSoftwareUpdateCache *)v25 latestUpdate];
    v5[2](v5, v6, v7, 0);

    int v19 = 1;
  }
  else
  {
    id v18 = objc_alloc_init((Class)SUScanOptions);
    [v18 setForced:1];
    [v18 setIdentifier:@"com.apple.purplebuddy.software_update"];
    id v8 = objc_alloc((Class)SUManagerClient);
    v9 = dispatch_get_global_queue(0, 0);
    id v17 = [v8 initWithDelegate:0 queue:v9 clientType:1];

    v10 = _NSConcreteStackBlock;
    int v11 = -1073741824;
    int v12 = 0;
    v13 = sub_1001A16E4;
    v14 = &unk_1002B4510;
    v15 = v25;
    id v16 = location;
    [v17 scanForUpdates:v18 withScanResults:&v10];
    objc_storeStrong(&v16, 0);
    objc_storeStrong((id *)&v15, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
    int v19 = 0;
  }
  objc_storeStrong(&location, 0);
}

- (void)scanUsingCache:(BOOL)a3 allowBootstrap:(BOOL)a4 withCompletion:(id)a5
{
  v41 = self;
  SEL v40 = a2;
  BOOL v39 = a3;
  BOOL v38 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  char v35 = 0;
  BOOL v5 = 0;
  if (v39)
  {
    v36 = [(BYSoftwareUpdateCache *)v41 preferredUpdate];
    char v35 = 1;
    BOOL v5 = 0;
    if (v36) {
      BOOL v5 = location != 0;
    }
  }
  if (v35) {

  }
  if (v5)
  {
    v6 = (void (**)(id, id, id, void))location;
    v7 = [(BYSoftwareUpdateCache *)v41 preferredUpdate];
    id v8 = [(BYSoftwareUpdateCache *)v41 latestUpdate];
    v6[2](v6, v7, v8, 0);

    int v34 = 1;
  }
  else
  {
    id v33 = 0;
    if (v38)
    {
      id v32 = dispatch_queue_create("Telephony Queue", 0);
      id v31 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:v32];
      id v30 = 0;
      id obj = 0;
      id v9 = [v31 usingBootstrapDataService:&obj];
      objc_storeStrong(&v30, obj);
      id v10 = v33;
      id v33 = v9;

      if (v33)
      {
        if ([v33 BOOLValue])
        {
          id v12 = +[CTCellularPlanManager sharedManager];
          [v12 setUserInPurchaseFlow:1];
        }
      }
      else
      {
        os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v27 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          char v25 = 0;
          char v23 = 0;
          if (_BYIsInternalInstall())
          {
            int v11 = (NSString *)v30;
          }
          else if (v30)
          {
            id v26 = [v30 domain];
            char v25 = 1;
            int v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v26, [v30 code]);
            id v24 = v11;
            char v23 = 1;
          }
          else
          {
            int v11 = 0;
          }
          sub_10004BB7C((uint64_t)buf, (uint64_t)v11);
          _os_log_error_impl((void *)&_mh_execute_header, oslog, v27, "Unable to get bootstrap status for software update scan: %{public}@", buf, 0xCu);
          if (v23) {

          }
          if (v25) {
        }
          }
        objc_storeStrong((id *)&oslog, 0);
      }
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v32, 0);
    }
    v13 = v41;
    BOOL v14 = v39;
    v15 = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    id v18 = sub_1001A1E00;
    int v19 = &unk_1002B3E70;
    BOOL v22 = v38;
    id v20 = v33;
    id v21 = location;
    [(BYSoftwareUpdateCache *)v13 scanUsingCache:v14 withCompletion:&v15];
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v33, 0);
    int v34 = 0;
  }
  objc_storeStrong(&location, 0);
}

- (void)scanUsingCache:(BOOL)a3 allowBootstrap:(BOOL)a4 retry:(BOOL)a5 withCompletion:(id)a6
{
  int v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  BOOL v8 = a4;
  BOOL v7 = a5;
  id location = 0;
  objc_storeStrong(&location, a6);
  if (v7) {
    [(BYSoftwareUpdateCache *)v11 _scanUsingCache:v9 allowBootstrap:v8 attemptsAllowed:3 withCompletion:location];
  }
  else {
    [(BYSoftwareUpdateCache *)v11 scanUsingCache:v9 allowBootstrap:v8 withCompletion:location];
  }
  objc_storeStrong(&location, 0);
}

- (void)reset
{
  BOOL v7 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    os_log_type_t v3 = v5;
    sub_10004B24C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Resetting software update cache...", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  [(BYSoftwareUpdateCache *)v7 setPreferredUpdate:0];
  [(BYSoftwareUpdateCache *)v7 setLatestUpdate:0];
  [(BYSoftwareUpdateCache *)v7 setLastScanDate:0];
}

- (void)_scanUsingCache:(BOOL)a3 allowBootstrap:(BOOL)a4 attemptsAllowed:(unint64_t)a5 withCompletion:(id)a6
{
  int v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  BOOL v8 = a4;
  unint64_t v7 = a5;
  id location = 0;
  objc_storeStrong(&location, a6);
  [(BYSoftwareUpdateCache *)v11 _scanUsingCache:v9 allowBootstrap:v8 attemptCount:0 attemptsAllowed:v7 withCompletion:location];
  objc_storeStrong(&location, 0);
}

- (void)_scanUsingCache:(BOOL)a3 allowBootstrap:(BOOL)a4 attemptCount:(unint64_t)a5 attemptsAllowed:(unint64_t)a6 withCompletion:(id)a7
{
  char v25 = self;
  SEL v24 = a2;
  BOOL v23 = a3;
  BOOL v22 = a4;
  id v21 = (void *)a5;
  id v20 = (void *)a6;
  id location = 0;
  objc_storeStrong(&location, a7);
  unint64_t v7 = v25;
  BOOL v8 = v23;
  BOOL v9 = v22;
  SEL v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  v13 = sub_1001A2204;
  BOOL v14 = &unk_1002B4560;
  v16[1] = v21;
  v16[2] = v20;
  v16[0] = location;
  v15 = v25;
  BOOL v17 = v23;
  BOOL v18 = v22;
  [(BYSoftwareUpdateCache *)v7 scanUsingCache:v8 allowBootstrap:v9 withCompletion:&v10];
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(v16, 0);
  objc_storeStrong(&location, 0);
}

- (unint64_t)_retryDelaySecondsForAttemptCount:(unint64_t)a3
{
  return 5 * (a3 + 1);
}

- (SUDescriptor)preferredUpdate
{
  return (SUDescriptor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPreferredUpdate:(id)a3
{
}

- (SUDescriptor)latestUpdate
{
  return (SUDescriptor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLatestUpdate:(id)a3
{
}

- (NSDate)lastScanDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastScanDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end