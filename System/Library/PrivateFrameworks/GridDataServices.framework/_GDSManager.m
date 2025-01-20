@interface _GDSManager
+ (id)managerWithID:(id)a3 locationBundlePath:(id)a4;
- (NSDictionary)currentMarginalForecast;
- (NSString)clientID;
- (NSString)locBundlePath;
- (NSUserDefaults)fakeDataDefaults;
- (NSXPCConnection)connection;
- (OS_os_log)log;
- (_GDSManager)initWithID:(id)a3 locationBundlePath:(id)a4;
- (id)carbonIntensityHistoryForBA:(id)a3 from:(id)a4 to:(id)a5;
- (id)getFakeMarginalEmissionForecast;
- (id)latestBalancingAuthority;
- (id)latestBalancingAuthorityWithError:(id *)a3;
- (id)latestMarginalEmissionForecast;
- (void)dealloc;
- (void)fixMarginalEmissionForecast:(id)a3;
- (void)latestBalancingAuthority;
- (void)latestMarginalEmissionForecast;
- (void)registerClientID:(id)a3 locationBundlePath:(id)a4;
- (void)setClientID:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCurrentMarginalForecast:(id)a3;
- (void)setFakeConfigURL:(id)a3;
- (void)setFakeDataDefaults:(id)a3;
- (void)setFakeSecret:(id)a3;
- (void)setFakeSecretVersion:(id)a3;
- (void)setFakeServerURL:(id)a3;
- (void)setLocBundlePath:(id)a3;
- (void)setLog:(id)a3;
- (void)triggerBAUpdateWithHandler:(id)a3;
- (void)unFixMarginalEmissionForecast;
- (void)unSetFakeConfigURL;
- (void)unSetFakeSecret;
- (void)unSetFakeSecretVersion;
- (void)unSetFakeServerURL;
@end

@implementation _GDSManager

- (_GDSManager)initWithID:(id)a3 locationBundlePath:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)_GDSManager;
  v9 = [(_GDSManager *)&v26 init];
  if (v9)
  {
    os_log_t v10 = os_log_create("com.apple.gds", "manager");
    log = v9->_log;
    v9->_log = (OS_os_log *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.gridDataServices.fakeData"];
    fakeDataDefaults = v9->_fakeDataDefaults;
    v9->_fakeDataDefaults = (NSUserDefaults *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.griddatad.registration" options:4096];
    connection = v9->_connection;
    v9->_connection = (NSXPCConnection *)v14;

    v16 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270191D80];
    [(NSXPCConnection *)v9->_connection setRemoteObjectInterface:v16];

    [(NSXPCConnection *)v9->_connection resume];
    p_clientID = &v9->_clientID;
    objc_storeStrong((id *)&v9->_clientID, a3);
    objc_storeStrong((id *)&v9->_locBundlePath, a4);
    v18 = +[_GDSBalancingAuthority loadRegistrations];
    uint64_t v19 = [v18 objectForKeyedSubscript:v9->_clientID];
    if (!v19
      || (v20 = (void *)v19,
          [v18 objectForKeyedSubscript:*p_clientID],
          v21 = objc_claimAutoreleasedReturnValue(),
          char v22 = [v21 isEqualToString:v8],
          v21,
          v20,
          (v22 & 1) == 0))
    {
      v23 = [(_GDSManager *)v9 log];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *p_clientID;
        *(_DWORD *)buf = 138412290;
        v28 = v24;
        _os_log_impl(&dword_2504C2000, v23, OS_LOG_TYPE_DEFAULT, "Registering client %@", buf, 0xCu);
      }

      [(_GDSManager *)v9 registerClientID:v7 locationBundlePath:v8];
    }
  }
  return v9;
}

+ (id)managerWithID:(id)a3 locationBundlePath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48___GDSManager_managerWithID_locationBundlePath___block_invoke;
  v12[3] = &unk_26534F650;
  id v13 = v5;
  id v14 = v6;
  uint64_t v7 = managerWithID_locationBundlePath__once;
  id v8 = v6;
  id v9 = v5;
  if (v7 != -1) {
    dispatch_once(&managerWithID_locationBundlePath__once, v12);
  }
  id v10 = (id)managerWithID_locationBundlePath__instance;

  return v10;
}

- (void)registerClientID:(id)a3 locationBundlePath:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(_GDSManager *)self log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2504C2000, v9, OS_LOG_TYPE_DEFAULT, "Calling registration with griddatad", buf, 2u);
  }

  connection = self->_connection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51___GDSManager_registerClientID_locationBundlePath___block_invoke;
  v13[3] = &unk_26534F678;
  v13[4] = self;
  v13[5] = a2;
  v11 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51___GDSManager_registerClientID_locationBundlePath___block_invoke_62;
  v12[3] = &unk_26534F678;
  void v12[4] = self;
  v12[5] = a2;
  [v11 registerClientID:v8 locationBundlePath:v7 handler:v12];
}

- (void)triggerBAUpdateWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(_GDSManager *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2504C2000, v6, OS_LOG_TYPE_DEFAULT, "Calling fetch BA with griddatad", buf, 2u);
  }

  connection = self->_connection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42___GDSManager_triggerBAUpdateWithHandler___block_invoke;
  v14[3] = &unk_26534F678;
  v14[4] = self;
  v14[5] = a2;
  id v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v14];
  clientID = self->_clientID;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42___GDSManager_triggerBAUpdateWithHandler___block_invoke_63;
  v11[3] = &unk_26534F6A0;
  id v12 = v5;
  SEL v13 = a2;
  v11[4] = self;
  id v10 = v5;
  [v8 updateBAClientID:clientID handler:v11];
}

- (id)latestBalancingAuthority
{
  id v7 = 0;
  v3 = [(_GDSManager *)self latestBalancingAuthorityWithError:&v7];
  id v4 = v7;
  if (v4)
  {
    id v5 = [(_GDSManager *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(_GDSManager *)v4 latestBalancingAuthority];
    }
  }

  return v3;
}

- (id)latestBalancingAuthorityWithError:(id *)a3
{
  v43[1] = *MEMORY[0x263EF8340];
  id v5 = +[_GDSBalancingAuthority loadBalancingAuthorityStatus];
  if (![v5 count])
  {
    v15 = [(_GDSManager *)self log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[_GDSManager latestBalancingAuthorityWithError:](v15);
    }

    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v42 = *MEMORY[0x263F08320];
    v43[0] = @"Failed to get latest BA. Location availability status not found";
    v17 = [NSDictionary dictionaryWithObjects:v43 forKeys:&v42 count:1];
    *a3 = [v16 errorWithDomain:@"com.apple.gds" code:2 userInfo:v17];

    goto LABEL_17;
  }
  id v6 = [v5 objectForKeyedSubscript:self->_clientID];

  if (!v6)
  {
    v18 = [(_GDSManager *)self log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      [(_GDSManager *)(uint64_t *)&self->_clientID latestBalancingAuthorityWithError:v18];
    }

    uint64_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v40 = *MEMORY[0x263F08320];
    v41 = @"Failed to get latest BA. Location availability status not found for client";
    v20 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    *a3 = [v19 errorWithDomain:@"com.apple.gds" code:1 userInfo:v20];

    goto LABEL_17;
  }
  id v7 = [v5 objectForKeyedSubscript:self->_clientID];
  char v8 = [v7 BOOLValue];

  if ((v8 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Location not available", (uint8_t *)&v30, 2u);
    }
    char v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v38 = *MEMORY[0x263F08320];
    v39 = @"Failed to get latest BA. Location authorization not available for client";
    v23 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    *a3 = [v22 errorWithDomain:@"com.apple.gds" code:2 userInfo:v23];

LABEL_17:
    AnalyticsSendEventLazy();
    id v9 = 0;
    goto LABEL_18;
  }
  id v9 = +[_GDSBalancingAuthority currentBalancingAuthority];
  id v10 = [v9 name];
  int v11 = [v10 isEqualToString:@"Unkown"];

  if (v11)
  {
    id v12 = [(_GDSManager *)self log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_GDSManager latestBalancingAuthorityWithError:](v12);
    }

    SEL v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    v37 = @"Failed to get latest BA. Unable to find BA name";
    id v14 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    *a3 = [v13 errorWithDomain:@"com.apple.gds" code:3 userInfo:v14];
  }
  AnalyticsSendEventLazy();
  v25 = self->_log;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v26 = v25;
    v27 = [v9 name];
    v28 = [v9 identifier];
    uint64_t v29 = [v9 lastUpdatedDate];
    int v30 = 138412802;
    v31 = v27;
    __int16 v32 = 2112;
    v33 = v28;
    __int16 v34 = 2112;
    v35 = v29;
    _os_log_impl(&dword_2504C2000, v26, OS_LOG_TYPE_DEFAULT, "Balancing Authority Output Name:%@, ID:%@, Date:%@", (uint8_t *)&v30, 0x20u);
  }
LABEL_18:

  return v9;
}

- (id)latestMarginalEmissionForecast
{
  v3 = [(_GDSManager *)self latestBalancingAuthority];
  id v4 = [(_GDSManager *)self getFakeMarginalEmissionForecast];
  if (v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Returning the fake forecast set in defaults.", v11, 2u);
    }
    id v6 = v4;
  }
  else
  {
    id v7 = [v3 identifier];

    if (v7)
    {
      char v8 = +[_GDSServerConnection sharedInstance];
      id v6 = [v8 fetchMarginalEmissionForecastFor:v3];
    }
    else
    {
      id v9 = self->_log;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(_GDSManager *)v9 latestMarginalEmissionForecast];
      }
      id v6 = 0;
    }
  }

  return v6;
}

- (id)carbonIntensityHistoryForBA:(id)a3 from:(id)a4 to:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = v10;
  if (v8 && v9 && v10)
  {
    id v12 = +[_GDSServerConnection sharedInstance];
    SEL v13 = [v12 fetchCarbonIntensityHistoryForBA:v8 from:v9 to:v11];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412802;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      v21 = v11;
      _os_log_error_impl(&dword_2504C2000, log, OS_LOG_TYPE_ERROR, "Parameters not specified BA:%@ startDate:%@ endDate:%@", (uint8_t *)&v16, 0x20u);
    }
    SEL v13 = 0;
  }

  return v13;
}

- (void)fixMarginalEmissionForecast:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Fixing the marginal emission forecast.", v7, 2u);
  }
  id v6 = [(_GDSManager *)self fakeDataDefaults];
  [v6 setObject:v4 forKey:@"fakeForecast"];
}

- (void)unFixMarginalEmissionForecast
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Unfixing the marginal emission forecast.", v5, 2u);
  }
  id v4 = [(_GDSManager *)self fakeDataDefaults];
  [v4 removeObjectForKey:@"fakeForecast"];
}

- (void)setFakeSecret:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Setting the HMAC secret.", v7, 2u);
  }
  id v6 = [(_GDSManager *)self fakeDataDefaults];
  [v6 setObject:v4 forKey:@"fakeSecret"];
}

- (void)unSetFakeSecret
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Unsetting the HMAC secret.", v5, 2u);
  }
  id v4 = [(_GDSManager *)self fakeDataDefaults];
  [v4 removeObjectForKey:@"fakeSecret"];
}

- (void)setFakeSecretVersion:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Setting the HMAC secret version.", v7, 2u);
  }
  id v6 = [(_GDSManager *)self fakeDataDefaults];
  [v6 setObject:v4 forKey:@"fakeSecretVersion"];
}

- (void)unSetFakeSecretVersion
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Unsetting the HMAC secret version", v5, 2u);
  }
  id v4 = [(_GDSManager *)self fakeDataDefaults];
  [v4 removeObjectForKey:@"fakeSecretVersion"];
}

- (void)setFakeConfigURL:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Setting the configURL.", v7, 2u);
  }
  id v6 = [(_GDSManager *)self fakeDataDefaults];
  [v6 setObject:v4 forKey:@"fakeConfigURL"];
}

- (void)unSetFakeConfigURL
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Unsetting the configURL.", v5, 2u);
  }
  id v4 = [(_GDSManager *)self fakeDataDefaults];
  [v4 removeObjectForKey:@"fakeConfigURL"];
}

- (void)setFakeServerURL:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Setting the serverURL.", v7, 2u);
  }
  id v6 = [(_GDSManager *)self fakeDataDefaults];
  [v6 setObject:v4 forKey:@"fakeServerURL"];
}

- (void)unSetFakeServerURL
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Unsetting the serverURL.", v5, 2u);
  }
  id v4 = [(_GDSManager *)self fakeDataDefaults];
  [v4 removeObjectForKey:@"fakeServerURL"];
}

- (id)getFakeMarginalEmissionForecast
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = [(_GDSManager *)self fakeDataDefaults];
  id v4 = [v3 arrayForKey:@"fakeForecast"];

  if (v4)
  {
    id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v7 = [MEMORY[0x263EFF910] now];
    v24 = v5;
    uint64_t v22 = [v5 components:192 fromDate:v7];
    v23 = (void *)v7;
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF910]), "initWithTimeInterval:sinceDate:", v7, (double)-fmod((double)(objc_msgSend(v22, "second") + 60 * objc_msgSend(v22, "minute")), 900.0));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v25 = v4;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      int v12 = 0;
      uint64_t v13 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          id v16 = objc_alloc(MEMORY[0x263EFF910]);
          unsigned int v17 = v12++;
          __int16 v18 = (void *)[v16 initWithTimeInterval:v8 sinceDate:(double)v17 * 900.0];
          [v6 setObject:v15 forKeyedSubscript:v18];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v11);
    }

    id v19 = [[_GDSEmissionForecast alloc] initWithForecast:v6 generatedAt:v8 fetchedAt:v23 refetchInterval:14400.0];
    id v4 = v25;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2504C2000, log, OS_LOG_TYPE_DEFAULT, "Found no fakeForecast values.", buf, 2u);
    }
    id v19 = 0;
  }

  return v19;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_GDSManager;
  [(_GDSManager *)&v3 dealloc];
}

- (NSDictionary)currentMarginalForecast
{
  return self->_currentMarginalForecast;
}

- (void)setCurrentMarginalForecast:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (NSString)locBundlePath
{
  return self->_locBundlePath;
}

- (void)setLocBundlePath:(id)a3
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
  objc_storeStrong((id *)&self->_locBundlePath, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_currentMarginalForecast, 0);
}

- (void)latestBalancingAuthority
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_super v3 = [a1 userInfo];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_2504C2000, a2, OS_LOG_TYPE_ERROR, "Error getting BA. Error information %@", (uint8_t *)&v4, 0xCu);
}

- (void)latestBalancingAuthorityWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2504C2000, log, OS_LOG_TYPE_ERROR, "Location availability status not found", v1, 2u);
}

- (void)latestBalancingAuthorityWithError:(os_log_t)log .cold.2(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(a2 + 40);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_2504C2000, log, OS_LOG_TYPE_ERROR, "Location availability status not found for clientID %@, bundlePath %@", (uint8_t *)&v5, 0x16u);
}

- (void)latestBalancingAuthorityWithError:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2504C2000, log, OS_LOG_TYPE_ERROR, "Unable to find BA name", v1, 2u);
}

- (void)latestMarginalEmissionForecast
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 name];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_2504C2000, v3, OS_LOG_TYPE_ERROR, "Parameter not specified BA:%@", (uint8_t *)&v5, 0xCu);
}

@end