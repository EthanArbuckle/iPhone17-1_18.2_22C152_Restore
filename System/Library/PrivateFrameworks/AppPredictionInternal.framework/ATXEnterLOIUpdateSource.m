@interface ATXEnterLOIUpdateSource
- (ATXEnterLOIUpdateSource)init;
- (ATXEnterLOIUpdateSource)initWithLocationManager:(id)a3 userDefaults:(id)a4;
- (ATXLocationManagerProtocol)locationManager;
- (ATXUpdatePredictionsDelegate)delegate;
- (NSDate)now;
- (NSUserDefaults)userDefaults;
- (id)_regionIdentifierForLocationOfInterestType:(int64_t)a3;
- (void)_registerNotificationListeners;
- (void)_start;
- (void)dealloc;
- (void)locationManagerDidEnterRegion:(id)a3;
- (void)locationManagerDidExitRegion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNow:(id)a3;
- (void)updateMonitoredRegionsIfNecessaryWithReply:(id)a3;
@end

@implementation ATXEnterLOIUpdateSource

- (ATXEnterLOIUpdateSource)init
{
  v3 = [MEMORY[0x1E4F935D0] sharedInstance];
  id v4 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v5 = (void *)[v4 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  v6 = [(ATXEnterLOIUpdateSource *)self initWithLocationManager:v3 userDefaults:v5];

  return v6;
}

- (ATXEnterLOIUpdateSource)initWithLocationManager:(id)a3 userDefaults:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXEnterLOIUpdateSource;
  v9 = [(ATXEnterLOIUpdateSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationManager, a3);
    objc_storeStrong((id *)&v10->_userDefaults, a4);
  }
  [(ATXEnterLOIUpdateSource *)v10 _start];

  return v10;
}

- (void)_start
{
  [(ATXEnterLOIUpdateSource *)self updateMonitoredRegionsIfNecessaryWithReply:0];
  [(ATXEnterLOIUpdateSource *)self _registerNotificationListeners];
}

- (void)_registerNotificationListeners
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_locationManagerDidEnterRegion_ name:*MEMORY[0x1E4F93690] object:0];
  [v3 addObserver:self selector:sel_locationManagerDidExitRegion_ name:*MEMORY[0x1E4F93698] object:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F93690] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F93698] object:0];

  v4.receiver = self;
  v4.super_class = (Class)ATXEnterLOIUpdateSource;
  [(ATXEnterLOIUpdateSource *)&v4 dealloc];
}

- (void)updateMonitoredRegionsIfNecessaryWithReply:(id)a3
{
  objc_super v4 = (void (**)(void))a3;
  v5 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ATXEnterLOIUpdateSourceLastRefreshDate"];
  if (v5
    && ([(ATXEnterLOIUpdateSource *)self now],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v5 timeIntervalSinceDate:v6],
        double v8 = v7,
        v6,
        v8 <= 86400.0))
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    locationManager = self->_locationManager;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__ATXEnterLOIUpdateSource_updateMonitoredRegionsIfNecessaryWithReply___block_invoke;
    v10[3] = &unk_1E68B31F8;
    v10[4] = self;
    v11 = v4;
    [(ATXLocationManagerProtocol *)locationManager fetchAllLocationsOfInterest:v10];
  }
}

void __70__ATXEnterLOIUpdateSource_updateMonitoredRegionsIfNecessaryWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  for (uint64_t i = 0; i != 4; ++i)
  {
    v5 = [*(id *)(a1 + 32) _regionIdentifierForLocationOfInterestType:i];
    [*(id *)(*(void *)(a1 + 32) + 16) stopMonitoringRegionWithIdentifier:v5];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v8; ++j)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * j);
        objc_super v12 = objc_msgSend(*(id *)(a1 + 32), "_regionIdentifierForLocationOfInterestType:", objc_msgSend(v11, "type", (void)v19));
        id v13 = objc_alloc(MEMORY[0x1E4F1E5A8]);
        [v11 coordinate];
        v14 = objc_msgSend(v13, "initWithCenter:radius:identifier:", v12);
        [*(id *)(*(void *)(a1 + 32) + 16) beginMonitoringRegion:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  v15 = *(void **)(a1 + 32);
  v16 = (void *)v15[3];
  v17 = [v15 now];
  [v16 setObject:v17 forKey:@"ATXEnterLOIUpdateSourceLastRefreshDate"];

  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    (*(void (**)(void))(v18 + 16))();
  }
}

- (void)locationManagerDidEnterRegion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [a3 userInfo];
  v5 = [v4 valueForKey:*MEMORY[0x1E4F936A0]];

  id v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    int v10 = 138412802;
    v11 = v8;
    __int16 v12 = 2080;
    id v13 = "-[ATXEnterLOIUpdateSource locationManagerDidEnterRegion:]";
    __int16 v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "%@ - %s: did enter region %@", (uint8_t *)&v10, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tryUpdatePredictionsImmediatelyWithReason:8];
}

- (void)locationManagerDidExitRegion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [a3 userInfo];
  v5 = [v4 valueForKey:*MEMORY[0x1E4F936A0]];

  id v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    int v10 = 138412802;
    v11 = v8;
    __int16 v12 = 2080;
    id v13 = "-[ATXEnterLOIUpdateSource locationManagerDidExitRegion:]";
    __int16 v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "%@ - %s: did enter region %@", (uint8_t *)&v10, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tryUpdatePredictionsDefaultIntervalWithReason:9];
}

- (id)_regionIdentifierForLocationOfInterestType:(int64_t)a3
{
  id v3 = [MEMORY[0x1E4F935D0] stringForLOIType:a3];
  objc_super v4 = (void *)[[NSString alloc] initWithFormat:@"com.apple.duetexpertd.%@", v3];

  return v4;
}

- (NSDate)now
{
  now = self->_now;
  if (now) {
    id v3 = now;
  }
  else {
    id v3 = (NSDate *)objc_opt_new();
  }
  return v3;
}

- (ATXUpdatePredictionsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ATXUpdatePredictionsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ATXLocationManagerProtocol)locationManager
{
  return self->_locationManager;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setNow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end