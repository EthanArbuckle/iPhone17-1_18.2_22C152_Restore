@interface _GDSServerConnection
+ (id)createSessionConfiguration;
+ (id)dateFormatter;
+ (id)dateFromString:(id)a3;
+ (id)dateStringFromDate:(id)a3;
+ (id)fetchConfigWithError:(id *)a3;
+ (id)fetchEstimatedCountryCode;
+ (id)osBuildVersion;
+ (id)platform;
+ (id)queryItemsMetaParams;
+ (id)sharedInstance;
- (BOOL)isCASupported;
- (BOOL)isCECSupported;
- (NSDate)configFetchDate;
- (NSString)serverURL;
- (NSUserDefaults)defaults;
- (NSUserDefaults)fakeDataDefaults;
- (OS_os_log)log;
- (_GDSServerConnection)init;
- (double)configVersion;
- (id)dataFromLocation:(id)a3;
- (id)fetchBalancingAuthorityFromLocation:(id)a3;
- (id)fetchBalancingAuthorityPolygons;
- (id)fetchCarbonIntensityHistoryForBA:(id)a3 from:(id)a4 to:(id)a5;
- (id)fetchMarginalEmissionForecastFor:(id)a3;
- (id)getFakeSecret;
- (id)getFakeSecretVersion;
- (id)getFakeServerURL;
- (id)getRequestForEndpoint:(id)a3 withData:(id)a4 keySequence:(id)a5;
- (id)postRequestForEndpoint:(id)a3 withData:(id)a4;
- (void)checkServerConfiguration;
- (void)handleNewConfig:(id)a3;
- (void)init;
- (void)loadConfigState;
- (void)setConfigFetchDate:(id)a3;
- (void)setConfigVersion:(double)a3;
- (void)setDefaults:(id)a3;
- (void)setFakeDataDefaults:(id)a3;
- (void)setIsCASupported:(BOOL)a3;
- (void)setIsCECSupported:(BOOL)a3;
- (void)setLog:(id)a3;
- (void)setServerURL:(id)a3;
@end

@implementation _GDSServerConnection

- (_GDSServerConnection)init
{
  v22.receiver = self;
  v22.super_class = (Class)_GDSServerConnection;
  v2 = [(_GDSServerConnection *)&v22 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.gds", "serverConnection");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.gridDataServices.config"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.gridDataServices.fakeData"];
    fakeDataDefaults = v2->_fakeDataDefaults;
    v2->_fakeDataDefaults = (NSUserDefaults *)v7;

    uint64_t v9 = [(NSUserDefaults *)v2->_defaults objectForKey:@"configDate"];
    configFetchDate = v2->_configFetchDate;
    v2->_configFetchDate = (NSDate *)v9;

    if (!v2->_configFetchDate)
    {
      v11 = v2->_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        [(_GDSServerConnection *)v11 init];
      }
      uint64_t v19 = [MEMORY[0x263EFF910] distantPast];
      v20 = v2->_configFetchDate;
      v2->_configFetchDate = (NSDate *)v19;
    }
    [(_GDSServerConnection *)v2 checkServerConfiguration];
    [(_GDSServerConnection *)v2 loadConfigState];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

+ (id)dateFormatter
{
  if (dateFormatter_once != -1) {
    dispatch_once(&dateFormatter_once, &__block_literal_global_91);
  }
  v2 = (void *)dateFormatter_dateFormatter;

  return v2;
}

+ (id)dateFromString:(id)a3
{
  id v3 = a3;
  v4 = +[_GDSServerConnection dateFormatter];
  uint64_t v5 = [v4 dateFromString:v3];

  return v5;
}

+ (id)dateStringFromDate:(id)a3
{
  id v3 = a3;
  v4 = +[_GDSServerConnection dateFormatter];
  uint64_t v5 = [v4 stringFromDate:v3];

  return v5;
}

+ (id)fetchEstimatedCountryCode
{
  v2 = [MEMORY[0x263F62D20] currentEstimates];
  if ([v2 count])
  {
    id v3 = v2;
LABEL_5:
    v4 = [v2 objectAtIndexedSubscript:0];
    id v5 = [v4 countryCode];

    goto LABEL_6;
  }
  id v3 = [MEMORY[0x263F62D20] lastKnownEstimates];

  if ([v3 count])
  {
    v2 = v3;
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_6:

  return v5;
}

+ (id)queryItemsMetaParams
{
  v2 = +[_GDSServerConnection fetchEstimatedCountryCode];
  id v3 = v2;
  if (!v2 || [(__CFString *)v2 length] != 2)
  {
    AnalyticsSendEventLazy();

    id v3 = @"US";
  }
  v4 = +[_GDSServerConnection platform];
  id v5 = +[_GDSServerConnection osBuildVersion];
  v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = [MEMORY[0x263F08BD0] queryItemWithName:@"country" value:v3];
  [v6 addObject:v7];

  v8 = [MEMORY[0x263F08BD0] queryItemWithName:@"platform" value:v4];
  [v6 addObject:v8];

  uint64_t v9 = [MEMORY[0x263F08BD0] queryItemWithName:@"build" value:v5];
  [v6 addObject:v9];

  return v6;
}

+ (id)fetchConfigWithError:(id *)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  os_log_t v4 = os_log_create("com.apple.gds", "serverConnection");
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  id v42 = 0;
  id v5 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.gridDataServices.fakeData"];
  v6 = [v5 stringForKey:@"fakeConfigURL"];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45___GDSServerConnection_fetchConfigWithError___block_invoke;
    block[3] = &unk_26534F650;
    v35 = v4;
    uint64_t v9 = (__CFString *)v8;
    v36 = v9;
    if (fetchConfigWithError__once != -1) {
      dispatch_once(&fetchConfigWithError__once, block);
    }
  }
  else
  {
    uint64_t v9 = @"https://cabana-config.cdn-apple.com/static/v1/bootstrap-31e8c871-9a82-4a76-af31-7857bae5b03e.json";
  }
  v10 = objc_msgSend(MEMORY[0x263F08BA0], "componentsWithString:", v9, v5);
  v11 = +[_GDSServerConnection queryItemsMetaParams];
  [v10 setQueryItems:v11];

  uint64_t v12 = (void *)MEMORY[0x263F089E0];
  uint64_t v13 = [v10 URL];
  uint64_t v14 = [v12 requestWithURL:v13];

  [v14 setHTTPMethod:@"GET"];
  [v14 addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [v14 addValue:@"application/json" forHTTPHeaderField:@"Accept"];
  uint64_t v15 = v4;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v14 allHTTPHeaderFields];
    *(_DWORD *)buf = 138412546;
    id v50 = v14;
    __int16 v51 = 2112;
    v52 = v16;
    _os_log_impl(&dword_2504C2000, v15, OS_LOG_TYPE_DEFAULT, "Request: %@, Header: %@", buf, 0x16u);
  }
  uint64_t v17 = +[_GDSServerConnection createSessionConfiguration];
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __45___GDSServerConnection_fetchConfigWithError___block_invoke_144;
  v28[3] = &unk_26534F760;
  uint64_t v19 = v15;
  v29 = v19;
  v31 = &v37;
  v20 = v18;
  v30 = v20;
  v32 = &v43;
  v33 = a3;
  v21 = [v17 dataTaskWithRequest:v14 completionHandler:v28];
  [v21 resume];
  [v17 finishTasksAndInvalidate];
  dispatch_time_t v22 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v20, v22);
  if (a3)
  {
    v23 = (void *)v38[5];
    if (v23)
    {
      *a3 = v23;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = *a3;
        *(_DWORD *)buf = 138412290;
        id v50 = v24;
        _os_log_impl(&dword_2504C2000, v19, OS_LOG_TYPE_DEFAULT, "Reporting error %@", buf, 0xCu);
      }
    }
  }
  id v25 = (id)v44[5];

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  return v25;
}

- (void)checkServerConfiguration
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  configFetchDate = self->_configFetchDate;
  if (!configFetchDate || ([(NSDate *)configFetchDate timeIntervalSinceNow], v4 < -1209600.0))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_configFetchDate;
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v6;
      _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Server connection config needs refresh (Config date %@)", buf, 0xCu);
    }
    uint64_t v7 = 0;
    id v8 = 0;
    int v9 = 3;
    while (1)
    {
      v10 = v7;
      id v14 = v8;
      uint64_t v7 = +[_GDSServerConnection fetchConfigWithError:&v14];
      id v11 = v14;

      if (!v11 && v7 != 0) {
        break;
      }
      uint64_t v13 = self->_log;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2504C2000, v13, OS_LOG_TYPE_DEFAULT, "Config request failed. Retrying", buf, 2u);
      }
      id v8 = v11;
      if (!--v9) {
        goto LABEL_14;
      }
    }
    id v11 = 0;
LABEL_14:
    [(_GDSServerConnection *)self handleNewConfig:v7];
  }
}

- (void)handleNewConfig:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"version"];
  v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    if (v7 > 1.0 || ([v6 doubleValue], v8 < 0.0))
    {
      int v9 = [(_GDSServerConnection *)self log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_GDSServerConnection handleNewConfig:](v6, v9);
      }
    }
    [v6 doubleValue];
    self->_configVersion = v10;
    defaults = self->_defaults;
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithDouble:");
    [(NSUserDefaults *)defaults setObject:v12 forKey:@"configVersion"];
  }
  uint64_t v13 = [v4 objectForKeyedSubscript:@"serverUrl"];
  if (v13)
  {
    objc_storeStrong((id *)&self->_serverURL, v13);
    [(NSUserDefaults *)self->_defaults setObject:self->_serverURL forKey:@"serverURL"];
  }
  else
  {
    id v14 = [(_GDSServerConnection *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_GDSServerConnection handleNewConfig:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  dispatch_time_t v22 = [v4 objectForKeyedSubscript:@"configuration"];
  v23 = [v22 objectForKeyedSubscript:@"cecEnabled"];
  id v24 = v23;
  if (v23)
  {
    self->_isCECSupported = [v23 BOOLValue];
    [(NSUserDefaults *)self->_defaults setObject:v24 forKey:@"CECSupported"];
  }
  id v25 = [v22 objectForKeyedSubscript:@"accountingEnabled"];

  if (v25)
  {
    self->_isCASupported = [v25 BOOLValue];
    [(NSUserDefaults *)self->_defaults setObject:v25 forKey:@"AccountingSupported"];
  }
  v26 = [MEMORY[0x263EFF910] date];
  configFetchDate = self->_configFetchDate;
  self->_configFetchDate = v26;

  [(NSUserDefaults *)self->_defaults setObject:self->_configFetchDate forKey:@"configDate"];
}

- (void)loadConfigState
{
}

- (id)postRequestForEndpoint:(id)a3 withData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(_GDSServerConnection *)self checkServerConfiguration];
  double v8 = [(_GDSServerConnection *)self getFakeServerURL];
  serverURL = v8;
  if (!v8) {
    serverURL = self->_serverURL;
  }
  double v10 = [NSString stringWithFormat:@"%@%@", serverURL, v7];

  id v11 = [MEMORY[0x263F08BA0] componentsWithString:v10];
  uint64_t v12 = (void *)MEMORY[0x263F089E0];
  uint64_t v13 = [v11 URL];
  id v14 = [v12 requestWithURL:v13];

  [v14 setHTTPMethod:@"POST"];
  [v14 setHTTPBody:v6];

  [v14 addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [v14 addValue:@"application/json" forHTTPHeaderField:@"Accept"];
  uint64_t v15 = [(_GDSServerConnection *)self getFakeSecret];
  uint64_t v16 = [(_GDSServerConnection *)self getFakeSecretVersion];
  uint64_t v17 = (void *)v16;
  if (v15) {
    uint64_t v18 = v15;
  }
  else {
    uint64_t v18 = @"f971ea5835cead5eaf7e2750224fd8f4";
  }
  if (v16) {
    uint64_t v19 = (__CFString *)v16;
  }
  else {
    uint64_t v19 = @"1";
  }
  uint64_t v20 = +[_GDSHMACGenerator HMACSignedRequest:v14 secret:v18 secretVersion:v19];
  uint64_t v21 = (void *)[v20 mutableCopy];

  return v21;
}

- (id)getRequestForEndpoint:(id)a3 withData:(id)a4 keySequence:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v41 = a3;
  id v8 = a4;
  id v9 = a5;
  [(_GDSServerConnection *)self checkServerConfiguration];
  uint64_t v39 = self;
  v40 = [(_GDSServerConnection *)self getFakeServerURL];
  double v10 = +[_GDSServerConnection queryItemsMetaParams];
  id v11 = (void *)[v10 mutableCopy];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v18 = [v8 objectForKeyedSubscript:v17];

        if (v18)
        {
          uint64_t v19 = (void *)MEMORY[0x263F08BD0];
          uint64_t v20 = [v8 objectForKeyedSubscript:v17];
          uint64_t v21 = [v19 queryItemWithName:v17 value:v20];
          [v11 addObject:v21];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v14);
  }

  serverURL = v40;
  if (!v40) {
    serverURL = v39->_serverURL;
  }
  v23 = [NSString stringWithFormat:@"%@%@", serverURL, v41];
  id v24 = [MEMORY[0x263F08BA0] componentsWithString:v23];
  [v24 setQueryItems:v11];
  log = v39->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v26 = log;
    v27 = [v24 URL];
    *(_DWORD *)buf = 138412290;
    v47 = v27;
    _os_log_impl(&dword_2504C2000, v26, OS_LOG_TYPE_DEFAULT, "URL: %@", buf, 0xCu);
  }
  v28 = (void *)MEMORY[0x263F089E0];
  v29 = [v24 URL];
  v30 = [v28 requestWithURL:v29];

  [v30 setHTTPMethod:@"GET"];
  [v30 addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [v30 addValue:@"application/json" forHTTPHeaderField:@"Accept"];
  v31 = [(_GDSServerConnection *)v39 getFakeSecret];
  uint64_t v32 = [(_GDSServerConnection *)v39 getFakeSecretVersion];
  v33 = (void *)v32;
  if (v31) {
    v34 = v31;
  }
  else {
    v34 = @"f971ea5835cead5eaf7e2750224fd8f4";
  }
  if (v32) {
    v35 = (__CFString *)v32;
  }
  else {
    v35 = @"1";
  }
  v36 = +[_GDSHMACGenerator HMACSignedRequest:v30 secret:v34 secretVersion:v35];
  uint64_t v37 = (void *)[v36 mutableCopy];

  return v37;
}

- (id)getFakeSecret
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(_GDSServerConnection *)self fakeDataDefaults];
  id v4 = [v3 stringForKey:@"fakeSecret"];

  log = self->_log;
  BOOL v6 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      id v7 = v4;
      id v8 = log;
      int v11 = 136315138;
      uint64_t v12 = [v7 UTF8String];
      _os_log_impl(&dword_2504C2000, v8, OS_LOG_TYPE_DEFAULT, "Found fakeSecret: %s", (uint8_t *)&v11, 0xCu);
    }
    id v9 = v4;
  }
  else if (v6)
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Found no fakeSecret.", (uint8_t *)&v11, 2u);
  }

  return v4;
}

- (id)getFakeSecretVersion
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(_GDSServerConnection *)self fakeDataDefaults];
  id v4 = [v3 stringForKey:@"fakeSecretVersion"];

  log = self->_log;
  BOOL v6 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      id v7 = v4;
      id v8 = log;
      int v11 = 136315138;
      uint64_t v12 = [v7 UTF8String];
      _os_log_impl(&dword_2504C2000, v8, OS_LOG_TYPE_DEFAULT, "Found fakeSecretVersion: %s", (uint8_t *)&v11, 0xCu);
    }
    id v9 = v4;
  }
  else if (v6)
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Found no fakeSecretVersion.", (uint8_t *)&v11, 2u);
  }

  return v4;
}

- (id)getFakeServerURL
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(_GDSServerConnection *)self fakeDataDefaults];
  id v4 = [v3 stringForKey:@"fakeServerURL"];

  log = self->_log;
  BOOL v6 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      id v7 = v4;
      id v8 = log;
      int v11 = 136315138;
      uint64_t v12 = [v7 UTF8String];
      _os_log_impl(&dword_2504C2000, v8, OS_LOG_TYPE_DEFAULT, "Found fakeServerURL: %s", (uint8_t *)&v11, 0xCu);
    }
    id v9 = v4;
  }
  else if (v6)
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Found no fakeServerURL.", (uint8_t *)&v11, 2u);
  }

  return v4;
}

- (id)dataFromLocation:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  v19[0] = @"longitude";
  id v3 = NSNumber;
  id v4 = a3;
  [v4 coordinate];
  BOOL v6 = [v3 numberWithDouble:v5];
  v19[1] = @"latitude";
  v20[0] = v6;
  id v7 = NSNumber;
  [v4 coordinate];
  double v9 = v8;

  double v10 = [v7 numberWithDouble:v9];
  v20[1] = v10;
  int v11 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

  uint64_t v12 = [MEMORY[0x263EFF980] array];
  [v12 addObject:v11];
  uint64_t v13 = (void *)MEMORY[0x263F08900];
  uint64_t v17 = @"locations";
  uint64_t v18 = v12;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  uint64_t v15 = [v13 dataWithJSONObject:v14 options:0 error:0];

  return v15;
}

+ (id)createSessionConfiguration
{
  v2 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  [v2 setRequestCachePolicy:5];
  id v3 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v2 delegate:0 delegateQueue:0];

  return v3;
}

- (id)fetchBalancingAuthorityFromLocation:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  BOOL v6 = [(_GDSServerConnection *)self dataFromLocation:v4];
  id v7 = [(_GDSServerConnection *)self postRequestForEndpoint:@"getBalancingAuthorities" withData:v6];
  double v8 = self->_log;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
  {
    double v9 = [v7 allHTTPHeaderFields];
    -[_GDSServerConnection fetchBalancingAuthorityFromLocation:]((uint64_t)v7, v9, buf, (os_log_t)v8);
  }

  double v10 = +[_GDSServerConnection createSessionConfiguration];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __60___GDSServerConnection_fetchBalancingAuthorityFromLocation___block_invoke;
  uint64_t v20 = &unk_26534F788;
  uint64_t v21 = self;
  int v11 = v5;
  dispatch_time_t v22 = v11;
  id v12 = v4;
  id v23 = v12;
  id v24 = &v25;
  uint64_t v13 = [v10 dataTaskWithRequest:v7 completionHandler:&v17];
  objc_msgSend(v13, "resume", v17, v18, v19, v20, v21);
  [v10 finishTasksAndInvalidate];
  dispatch_time_t v14 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v11, v14);
  id v15 = (id)v26[5];

  _Block_object_dispose(&v25, 8);

  return v15;
}

+ (id)osBuildVersion
{
  CFDictionaryRef v2 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  uint64_t v3 = objc_msgSend(NSString, "stringWithString:", CFDictionaryGetValue(v2, (const void *)*MEMORY[0x263EFFAB0]));
  CFRelease(v2);
  if (v3) {
    id v4 = (__CFString *)v3;
  }
  else {
    id v4 = @"UnknownBuildVersion";
  }

  return v4;
}

+ (id)platform
{
  return @"iOS";
}

- (id)fetchBalancingAuthorityPolygons
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  dispatch_time_t v22 = __Block_byref_object_dispose_;
  id v23 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = (void *)os_transaction_create();
  dispatch_semaphore_t v5 = [(_GDSServerConnection *)self getRequestForEndpoint:@"getBaBoundaries" withData:0 keySequence:0];
  BOOL v6 = self->_log;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 allHTTPHeaderFields];
    *(_DWORD *)buf = 138412546;
    uint64_t v25 = v5;
    __int16 v26 = 2112;
    uint64_t v27 = v7;
    _os_log_impl(&dword_2504C2000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Request: %@, Header: %@", buf, 0x16u);
  }
  double v8 = +[_GDSServerConnection createSessionConfiguration];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __55___GDSServerConnection_fetchBalancingAuthorityPolygons__block_invoke;
  v15[3] = &unk_26534F7B0;
  v15[4] = self;
  double v9 = v3;
  uint64_t v16 = v9;
  uint64_t v17 = &v18;
  double v10 = [v8 dataTaskWithRequest:v5 completionHandler:v15];
  int v11 = (void *)MEMORY[0x25337E490]();
  [v10 resume];
  [v8 finishTasksAndInvalidate];
  dispatch_time_t v12 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v9, v12);
  id v13 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v13;
}

- (id)fetchMarginalEmissionForecastFor:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_semaphore_t v5 = v4;
  if (!self->_isCECSupported)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Fetching for CEC disabled. Returning nil", v33, 2u);
    }
    goto LABEL_10;
  }
  BOOL v6 = [v4 identifier];

  if (!v6)
  {
    uint64_t v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_GDSServerConnection fetchMarginalEmissionForecastFor:](v17, v5);
    }
LABEL_10:
    id v15 = 0;
    goto LABEL_11;
  }
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  *(void *)v33 = 0;
  v34 = v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  uint64_t v37 = __Block_byref_object_dispose_;
  id v38 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy_;
  v31[4] = __Block_byref_object_dispose_;
  id v32 = [MEMORY[0x263EFF9A0] dictionary];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy_;
  v29[4] = __Block_byref_object_dispose_;
  id v30 = 0;
  double v8 = [(_GDSServerConnection *)self getRequestForEndpoint:@"getEmissionsForecasts" withData:0 keySequence:0];
  double v9 = self->_log;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = [v8 allHTTPHeaderFields];
    *(_DWORD *)buf = 138412546;
    v40 = v8;
    __int16 v41 = 2112;
    long long v42 = v10;
    _os_log_impl(&dword_2504C2000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Request: %@, Header: %@", buf, 0x16u);
  }
  int v11 = +[_GDSServerConnection createSessionConfiguration];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __57___GDSServerConnection_fetchMarginalEmissionForecastFor___block_invoke;
  dispatch_time_t v22 = &unk_26534F7D8;
  id v23 = self;
  dispatch_time_t v12 = v7;
  id v24 = v12;
  id v25 = v5;
  __int16 v26 = v29;
  uint64_t v27 = v31;
  uint64_t v28 = v33;
  id v13 = [v11 dataTaskWithRequest:v8 completionHandler:&v19];
  objc_msgSend(v13, "resume", v19, v20, v21, v22, v23);
  [v11 finishTasksAndInvalidate];
  dispatch_time_t v14 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v12, v14);
  id v15 = *((id *)v34 + 5);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(v33, 8);
LABEL_11:

  return v15;
}

- (id)fetchCarbonIntensityHistoryForBA:(id)a3 from:(id)a4 to:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  double v10 = (uint64_t (*)(uint64_t, uint64_t))a5;
  int v11 = v10;
  if (!self->_isCASupported)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Fetching for Carbon Accounting disabled. Returning nil", v43, 2u);
    }
    goto LABEL_12;
  }
  if (!v8 || !v9 || !v10)
  {
    id v25 = self->_log;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v43 = 138412802;
      *(void *)&v43[4] = v8;
      *(_WORD *)&v43[12] = 2112;
      *(void *)&v43[14] = v9;
      *(_WORD *)&v43[22] = 2112;
      long long v44 = v11;
      _os_log_error_impl(&dword_2504C2000, v25, OS_LOG_TYPE_ERROR, "Parameters not specified BA:%@ startDate:%@ endDate:%@", v43, 0x20u);
    }
LABEL_12:
    id v23 = 0;
    goto LABEL_13;
  }
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  *(void *)uint64_t v43 = 0;
  *(void *)&v43[8] = v43;
  *(void *)&v43[16] = 0x3032000000;
  long long v44 = __Block_byref_object_copy_;
  long long v45 = __Block_byref_object_dispose_;
  id v46 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy_;
  v35[4] = __Block_byref_object_dispose_;
  id v36 = [MEMORY[0x263EFF9A0] dictionary];
  v42[0] = v8;
  v41[0] = @"balancingAuthorityId";
  v41[1] = @"startTime";
  id v13 = +[_GDSServerConnection dateStringFromDate:v9];
  v42[1] = v13;
  v41[2] = @"endTime";
  dispatch_time_t v14 = +[_GDSServerConnection dateStringFromDate:v11];
  v42[2] = v14;
  id v15 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3];

  uint64_t v16 = [(_GDSServerConnection *)self getRequestForEndpoint:@"getEmissionsHistory" withData:v15 keySequence:&unk_27018F428];
  uint64_t v17 = self->_log;
  if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v16 allHTTPHeaderFields];
    *(_DWORD *)buf = 138412546;
    id v38 = v16;
    __int16 v39 = 2112;
    v40 = v18;
    _os_log_impl(&dword_2504C2000, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "Request: %@, Header: %@", buf, 0x16u);
  }
  uint64_t v19 = +[_GDSServerConnection createSessionConfiguration];
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = __65___GDSServerConnection_fetchCarbonIntensityHistoryForBA_from_to___block_invoke;
  id v30 = &unk_26534F800;
  v31 = self;
  uint64_t v20 = v12;
  id v32 = v20;
  v33 = v35;
  v34 = v43;
  uint64_t v21 = [v19 dataTaskWithRequest:v16 completionHandler:&v27];
  objc_msgSend(v21, "resume", v27, v28, v29, v30, v31);
  [v19 finishTasksAndInvalidate];
  dispatch_time_t v22 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v20, v22);
  id v23 = *(id *)(*(void *)&v43[8] + 40);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v43, 8);

LABEL_13:

  return v23;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (double)configVersion
{
  return self->_configVersion;
}

- (void)setConfigVersion:(double)a3
{
  self->_configVersion = a3;
}

- (NSDate)configFetchDate
{
  return self->_configFetchDate;
}

- (void)setConfigFetchDate:(id)a3
{
}

- (NSString)serverURL
{
  return self->_serverURL;
}

- (void)setServerURL:(id)a3
{
}

- (BOOL)isCASupported
{
  return self->_isCASupported;
}

- (void)setIsCASupported:(BOOL)a3
{
  self->_isCASupported = a3;
}

- (BOOL)isCECSupported
{
  return self->_isCECSupported;
}

- (void)setIsCECSupported:(BOOL)a3
{
  self->_isCECSupported = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSUserDefaults)fakeDataDefaults
{
  return self->_fakeDataDefaults;
}

- (void)setFakeDataDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeDataDefaults, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_serverURL, 0);
  objc_storeStrong((id *)&self->_configFetchDate, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

- (void)init
{
}

- (void)handleNewConfig:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleNewConfig:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [a1 doubleValue];
  int v4 = 134218496;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = 0;
  __int16 v8 = 2048;
  uint64_t v9 = 0x3FF0000000000000;
  _os_log_error_impl(&dword_2504C2000, a2, OS_LOG_TYPE_ERROR, "Config version %lf not supported by OS versions (%lf - %lf)", (uint8_t *)&v4, 0x20u);
}

- (void)fetchBalancingAuthorityFromLocation:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEBUG, "Request: %@, Header: %@", buf, 0x16u);
}

- (void)fetchMarginalEmissionForecastFor:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  int v4 = [a2 identifier];
  int v5 = 138412290;
  __int16 v6 = v4;
  _os_log_error_impl(&dword_2504C2000, v3, OS_LOG_TYPE_ERROR, "Parameter not specified BA:%@", (uint8_t *)&v5, 0xCu);
}

@end