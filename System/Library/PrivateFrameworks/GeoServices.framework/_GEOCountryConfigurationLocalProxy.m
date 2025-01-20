@interface _GEOCountryConfigurationLocalProxy
- (BOOL)_checkThrottlerOrScheduleUpdate:(id *)a3;
- (_GEOCountryConfigurationLocalProxy)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (void)_determineCurrentCountryCode:(id)a3;
- (void)_determineGeoIPCountryCode:(id)a3;
- (void)_postNotificationsForOldInfo:(id)a3 newInfo:(id)a4;
- (void)_reachabilityChanged:(id)a3;
- (void)_scheduleUpdate:(double)a3;
- (void)_updateCountryCodeWithCallbackQueue:(id)a3 callback:(id)a4;
- (void)currentDataSimChanged:(id)a3;
- (void)dealloc;
- (void)servingNetworkChanged:(id)a3;
- (void)updateCountryCodeWithCallbackQueue:(id)a3 callback:(id)a4;
@end

@implementation _GEOCountryConfigurationLocalProxy

- (void)updateCountryCodeWithCallbackQueue:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82___GEOCountryConfigurationLocalProxy_updateCountryCodeWithCallbackQueue_callback___block_invoke;
  block[3] = &unk_1E53D7F70;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_updateCountryCodeWithCallbackQueue:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  scheduledUpdateTimer = self->_scheduledUpdateTimer;
  if (scheduledUpdateTimer)
  {
    dispatch_source_cancel(scheduledUpdateTimer);
    id v9 = self->_scheduledUpdateTimer;
    self->_scheduledUpdateTimer = 0;
  }
  id v19 = 0;
  BOOL v10 = [(_GEOCountryConfigurationLocalProxy *)self _checkThrottlerOrScheduleUpdate:&v19];
  id v11 = v19;
  if (v10)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke_2;
    v13[3] = &unk_1E53DE240;
    v13[4] = self;
    id v15 = v7;
    v14 = v6;
    [(_GEOCountryConfigurationLocalProxy *)self _determineCurrentCountryCode:v13];

    id v12 = v15;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83___GEOCountryConfigurationLocalProxy__updateCountryCodeWithCallbackQueue_callback___block_invoke;
    block[3] = &unk_1E53D7C50;
    id v18 = v7;
    id v17 = v11;
    dispatch_async(v6, block);

    id v12 = v18;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_determineCurrentCountryCode:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_24;
  }
  if (qword_1EB29F7C8 != -1) {
    dispatch_once(&qword_1EB29F7C8, &__block_literal_global_250);
  }
  if (byte_1EB29F7B2 && self->_telephonyClient && self->_telephonyServerConnection)
  {
    *(void *)v21 = 0;
    v22 = v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__18;
    v25 = __Block_byref_object_dispose__18;
    id v26 = 0;
    v20[1] = (id)MEMORY[0x1E4F143A8];
    v20[2] = (id)3221225472;
    v20[3] = __67___GEOCountryConfigurationLocalProxy__determineCurrentCountryCode___block_invoke_2;
    v20[4] = &unk_1E53D7C00;
    v20[5] = self;
    v20[6] = v21;
    geo_isolate_sync();
    uint64_t v5 = *((void *)v22 + 5);
    if (v5)
    {
      telephonyClient = self->_telephonyClient;
      v20[0] = 0;
      id v7 = (void *)[(CoreTelephonyClient *)telephonyClient copyMobileCountryCode:v5 error:v20];
      id v8 = v20[0];
      if (v7)
      {
        if (([v7 isEqualToString:@"000"] & 1) == 0)
        {
          id v19 = 0;
          if (!geo_CTServerConnectionCopyISOForMCC((uint64_t)self->_telephonyServerConnection, (uint64_t)v7, (uint64_t)&v19))
          {
            id v9 = v19;
            if (v19)
            {
              GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
              BOOL v10 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
              {
                id v11 = [v9 uppercaseString];
                *(_DWORD *)buf = 138478083;
                id v28 = v11;
                __int16 v29 = 2113;
                v30 = v7;
                _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "Found country code '%{private}@' for current MCC (%{private}@)", buf, 0x16u);
              }
              queue = self->_queue;
              v16[0] = MEMORY[0x1E4F143A8];
              v16[1] = 3221225472;
              v16[2] = __67___GEOCountryConfigurationLocalProxy__determineCurrentCountryCode___block_invoke_254;
              v16[3] = &unk_1E53D7C50;
              id v17 = v9;
              id v18 = v4;
              id v13 = v9;
              dispatch_async(queue, v16);

              _Block_object_dispose(v21, 8);
              goto LABEL_24;
            }
          }
        }
      }
      else
      {
        v14 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          id v28 = v8;
          _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "No active MCC found: %{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v8 = 0;
    }
    _Block_object_dispose(v21, 8);
  }
  id v15 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "Pinging server to determine current country code", v21, 2u);
  }

  [(_GEOCountryConfigurationLocalProxy *)self _determineGeoIPCountryCode:v4];
LABEL_24:
}

- (BOOL)_checkThrottlerOrScheduleUpdate:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[GEOApplicationAuditToken currentProcessAuditToken];
  id v6 = +[GEODataRequestThrottler sharedThrottler];
  char v7 = [v6 allowRequest:1 forClient:v5 throttlerToken:0 error:a3];

  if ((v7 & 1) == 0)
  {
    double v13 = 0.0;
    int v12 = 0;
    id v8 = +[GEODataRequestThrottler sharedThrottler];
    [v8 getInfoForRequest:1 client:v5 timeUntilNextReset:&v13 availableRequestCount:&v12];

    if (v13 > 0.0) {
      [(_GEOCountryConfigurationLocalProxy *)self _scheduleUpdate:v13];
    }
    id v9 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = *a3;
      *(_DWORD *)buf = 134218242;
      double v15 = v13;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "Refusing to update country code again, will try again in %f seconds: %{public}@", buf, 0x16u);
    }
  }
  return v7;
}

- (_GEOCountryConfigurationLocalProxy)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_GEOCountryConfigurationLocalProxy;
  id v8 = [(_GEOCountryConfigurationLocalProxy *)&v20 init];
  if (v8)
  {
    uint64_t v9 = geo_dispatch_queue_create();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_delegateQueue, a4);
    uint64_t v11 = geo_isolater_create();
    currentDataContextIsolation = v8->_currentDataContextIsolation;
    v8->_currentDataContextIsolation = (geo_isolater *)v11;

    double v13 = v8->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69___GEOCountryConfigurationLocalProxy_initWithDelegate_delegateQueue___block_invoke;
    block[3] = &unk_1E53D79D8;
    v14 = v8;
    id v19 = v14;
    dispatch_async(v13, block);
    id v17 = v14;
    geo_dispatch_async_qos();
    double v15 = v17;
  }
  return v8;
}

- (void)dealloc
{
  GEOConfigRemoveBlockListener(self->_countryCodeOverrideChangeListener);
  scheduledUpdateTimer = self->_scheduledUpdateTimer;
  if (scheduledUpdateTimer) {
    dispatch_source_cancel(scheduledUpdateTimer);
  }
  telephonyServerConnection = self->_telephonyServerConnection;
  if (telephonyServerConnection) {
    CFRelease(telephonyServerConnection);
  }
  uint64_t v5 = +[GEONetworkObserver sharedNetworkObserver];
  [v5 removeNetworkReachableObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)_GEOCountryConfigurationLocalProxy;
  [(_GEOCountryConfigurationLocalProxy *)&v6 dealloc];
}

- (void)servingNetworkChanged:(id)a3
{
  id v4 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Cell network changed. Scheduling country code update", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60___GEOCountryConfigurationLocalProxy_servingNetworkChanged___block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)currentDataSimChanged:(id)a3
{
  id v3 = a3;
  id v4 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Current data sim changed", buf, 2u);
  }

  id v5 = v3;
  geo_isolate_sync();
}

- (void)_reachabilityChanged:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v10 = v4;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Reachability changed: %{private}@", buf, 0xCu);
  }

  if (GEOConfigGetBOOL(GeoServicesConfig_CountryConfigurationRefreshOnReachability, (uint64_t)off_1E9113D28))
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59___GEOCountryConfigurationLocalProxy__reachabilityChanged___block_invoke;
    v7[3] = &unk_1E53D8998;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)_scheduleUpdate:(double)a3
{
  scheduledUpdateTimer = self->_scheduledUpdateTimer;
  if (scheduledUpdateTimer)
  {
    dispatch_source_cancel(scheduledUpdateTimer);
    id v5 = self->_scheduledUpdateTimer;
    self->_scheduledUpdateTimer = 0;
  }
  objc_super v6 = (OS_dispatch_source *)geo_dispatch_timer_create_on_queue();
  id v7 = self->_scheduledUpdateTimer;
  self->_scheduledUpdateTimer = v6;

  dispatch_activate((dispatch_object_t)self->_scheduledUpdateTimer);
}

- (void)_determineGeoIPCountryCode:(id)a3
{
  id v4 = a3;
  p_geoIPLookupTask = &self->_geoIPLookupTask;
  [(GEOCancellable *)self->_geoIPLookupTask cancel];
  objc_super v6 = GEOGetURLWithSource(14, 0);
  id v7 = +[GEORequestCounter sharedCounter];
  id v8 = +[GEOApplicationAuditToken currentProcessAuditToken];
  uint64_t v9 = [v7 requestCounterTicketForType:1 auditToken:v8 traits:0];

  id v10 = [[GEOApplicationAuditToken alloc] initWithSecondaryIdentifier:@"com.apple.GeoServices.CountryCode"];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__18;
  v22 = __Block_byref_object_dispose__18;
  id v23 = 0;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65___GEOCountryConfigurationLocalProxy__determineGeoIPCountryCode___block_invoke;
  v15[3] = &unk_1E53DE1F0;
  id v16 = v4;
  id v17 = &v18;
  v15[4] = self;
  id v12 = v4;
  uint64_t v13 = +[GEODataURLSession asynchronousGetURL:v6 kind:1 auditToken:v10 requestCounterTicket:v9 queue:queue completionHandler:v15];
  v14 = (void *)v19[5];
  v19[5] = v13;

  objc_storeStrong((id *)p_geoIPLookupTask, (id)v19[5]);
  _Block_object_dispose(&v18, 8);
}

- (void)_postNotificationsForOldInfo:(id)a3 newInfo:(id)a4
{
  objc_super v6 = a3;
  id v7 = a4;
  id v8 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "Country code changed. Informing delegate", buf, 2u);
  }

  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75___GEOCountryConfigurationLocalProxy__postNotificationsForOldInfo_newInfo___block_invoke;
  block[3] = &unk_1E53D8998;
  void block[4] = self;
  id v10 = v7;
  id v26 = v10;
  dispatch_async(delegateQueue, block);
  notify_post((const char *)GEOCountryConfigurationCountryCodeChangedDarwinNotification);
  uint64_t v11 = _getValue(GeoServicesConfig_CountryProviders, (uint64_t)off_1E9113978, 1, 0, 0, 0);
  id v12 = v11;
  if (v6) {
    uint64_t v13 = v6[2];
  }
  else {
    uint64_t v13 = 0;
  }
  v14 = [v11 objectForKeyedSubscript:v13];
  if (v10) {
    uint64_t v15 = v10[2];
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = [v12 objectForKeyedSubscript:v15];
  id v17 = v16;
  if (v14) {
    BOOL v18 = v16 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18)
  {
    BOOL v19 = v14 == 0;
    if (v16)
    {
      BOOL v20 = 1;
    }
    else
    {
      BOOL v19 = 0;
      BOOL v20 = v14 == 0;
    }
    if (v20 && !v19) {
      goto LABEL_25;
    }
  }
  else if ([v16 isEqualToDictionary:v14])
  {
    goto LABEL_25;
  }
  v22 = GEOFindOrCreateLog("com.apple.GeoServices", "CountryConfiguration");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_DEBUG, "Country-specific networkDefaults changed. Informing delegate", buf, 2u);
  }

  id v23 = self->_delegateQueue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __75___GEOCountryConfigurationLocalProxy__postNotificationsForOldInfo_newInfo___block_invoke_276;
  v24[3] = &unk_1E53D79D8;
  v24[4] = self;
  dispatch_async(v23, v24);
  notify_post("com.apple.GeoServices.countryProvidersChanged");
LABEL_25:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoIPLookupTask, 0);
  objc_storeStrong((id *)&self->_currentDataContext, 0);
  objc_storeStrong((id *)&self->_currentDataContextIsolation, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong(&self->_countryCodeOverrideChangeListener, 0);
  objc_storeStrong((id *)&self->_scheduledUpdateTimer, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end