@interface ATXCDNDownloaderTriggerManager
+ (BOOL)_locationIsStaleOrNotAccurateEnough:(id)a3 now:(id)a4;
- (ATXCDNDownloaderTriggerManager)init;
- (ATXCDNDownloaderTriggerManager)initWithCDNDownloader:(id)a3 heroAppServer:(id)a4 heroClipManager:(id)a5 heroAppManager:(id)a6 predictionContextBuilder:(id)a7 nudgeRegistrar:(Class)a8 locationManager:(id)a9;
- (ATXCDNDownloaderTriggerManager)initWithCDNDownloader:(id)a3 predictionContextBuilder:(id)a4 nudgeRegistrar:(Class)a5;
- (ATXHeroAppManager)heroAppManager;
- (ATXHeroClipManager)heroClipManager;
- (ATXHeroDataServer)server;
- (ATXPredictionContextBuilderProtocol)predictionContextBuilder;
- (ATXProactiveCDNDownloaderProtocol)cdnDownloader;
- (ATXTimeBucketedRateLimiter)rateLimiter;
- (id)requestHighQualityLocationWithHundredMeterAccuracy;
- (void)_forwardHeroAppPredictionsToHeroAppPredictionsServer:(id)a3;
- (void)_registerForRestrictionChangedNotifications;
- (void)_registerForSiriSettingsChangedNotifications;
- (void)forwardLocationToCDNDownloaderAndHandleReply;
- (void)handleProfileChangedNotification;
- (void)handleSiriSettingsChangedNotification;
- (void)queryAndHandlePredictionsFromCDNDownloader;
@end

@implementation ATXCDNDownloaderTriggerManager

- (void)handleSiriSettingsChangedNotification
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)CFPreferencesCopyAppValue(@"SuggestionsSuggestAppClips", @"com.apple.suggestions");
  v4 = v3;
  if (v3) {
    int v5 = [v3 BOOLValue];
  }
  else {
    int v5 = 1;
  }

  v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v11 = 138412546;
    v12 = v8;
    __int16 v13 = 1024;
    int v14 = v5;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "%@ - got siri settings notification, canSuggestAppClips is: %{BOOL}d", (uint8_t *)&v11, 0x12u);
  }
  if ((v5 & 1) == 0)
  {
    heroClipManager = self->_heroClipManager;
    v10 = objc_opt_new();
    [(ATXHeroClipManager *)heroClipManager donateAppClipsWithHeroAppPredictions:v10];
  }
}

uint64_t __78__ATXCDNDownloaderTriggerManager__registerForSiriSettingsChangedNotifications__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleSiriSettingsChangedNotification];
}

- (ATXCDNDownloaderTriggerManager)initWithCDNDownloader:(id)a3 predictionContextBuilder:(id)a4 nudgeRegistrar:(Class)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  int v11 = objc_opt_new();
  v12 = [ATXHeroDataServer alloc];
  __int16 v13 = objc_opt_new();
  int v14 = [(ATXHeroDataServer *)v12 initWithHeroClipManager:v10 heroAppManager:v11 tracker:v13];

  uint64_t v15 = [MEMORY[0x1E4F935D0] sharedInstance];
  v16 = [(ATXCDNDownloaderTriggerManager *)self initWithCDNDownloader:v9 heroAppServer:v14 heroClipManager:v10 heroAppManager:v11 predictionContextBuilder:v8 nudgeRegistrar:a5 locationManager:v15];

  return v16;
}

- (ATXCDNDownloaderTriggerManager)initWithCDNDownloader:(id)a3 heroAppServer:(id)a4 heroClipManager:(id)a5 heroAppManager:(id)a6 predictionContextBuilder:(id)a7 nudgeRegistrar:(Class)a8 locationManager:(id)a9
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  v34.receiver = self;
  v34.super_class = (Class)ATXCDNDownloaderTriggerManager;
  v18 = [(ATXCDNDownloaderTriggerManager *)&v34 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_heroClipManager, a5);
    objc_storeStrong((id *)&v19->_heroAppManager, a6);
    objc_storeStrong((id *)&v19->_server, a4);
    objc_storeStrong((id *)&v19->_cdnDownloader, a3);
    objc_storeStrong((id *)&v19->_locationManager, a9);
    objc_storeStrong((id *)&v19->_predictionContextBuilder, a7);
    v20 = (objc_class *)objc_opt_class();
    Name = class_getName(v20);
    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create(Name, v22);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v23;

    v25 = [[ATXTimeBucketedRateLimiter alloc] initWithMaxCount:2 perPeriod:15.0];
    rateLimiter = v19->_rateLimiter;
    v19->_rateLimiter = v25;

    [(ATXCDNDownloaderTriggerManager *)v19 _registerForRestrictionChangedNotifications];
    [(ATXCDNDownloaderTriggerManager *)v19 _registerForSiriSettingsChangedNotifications];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __157__ATXCDNDownloaderTriggerManager_initWithCDNDownloader_heroAppServer_heroClipManager_heroAppManager_predictionContextBuilder_nudgeRegistrar_locationManager___block_invoke;
    v32[3] = &unk_1E68AB818;
    v33 = v19;
    [(objc_class *)a8 registerForNearbyAppNudgeWithBlock:v32];
  }
  return v19;
}

uint64_t __157__ATXCDNDownloaderTriggerManager_initWithCDNDownloader_heroAppServer_heroClipManager_heroAppManager_predictionContextBuilder_nudgeRegistrar_locationManager___block_invoke(uint64_t a1)
{
  v2 = __atxlog_handle_hero();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "Trigger received", v4, 2u);
  }

  return [*(id *)(a1 + 32) queryAndHandlePredictionsFromCDNDownloader];
}

- (ATXCDNDownloaderTriggerManager)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F93558]);
  v4 = objc_alloc_init(ATXPredictionContextBuilder);
  int v5 = [(ATXCDNDownloaderTriggerManager *)self initWithCDNDownloader:v3 predictionContextBuilder:v4 nudgeRegistrar:objc_opt_class()];

  return v5;
}

- (void)queryAndHandlePredictionsFromCDNDownloader
{
  id v3 = +[_ATXGlobals sharedInstance];
  char v4 = [v3 cdnDownloaderIsEnabled];

  if (v4)
  {
    cdnDownloader = self->_cdnDownloader;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__ATXCDNDownloaderTriggerManager_queryAndHandlePredictionsFromCDNDownloader__block_invoke;
    v7[3] = &unk_1E68AE6C0;
    v7[4] = self;
    [(ATXProactiveCDNDownloaderProtocol *)cdnDownloader highConfidenceHeroDatasForCurrentLocationWithCompletion:v7];
  }
  else
  {
    v6 = __atxlog_handle_hero();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "Skipping CDN download since it's disabled", buf, 2u);
    }
  }
}

void __76__ATXCDNDownloaderTriggerManager_queryAndHandlePredictionsFromCDNDownloader__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = __atxlog_handle_hero();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __76__ATXCDNDownloaderTriggerManager_queryAndHandlePredictionsFromCDNDownloader__block_invoke_cold_1((uint64_t)v6, v7);
    }

    goto LABEL_5;
  }
  if (![v5 count])
  {
LABEL_5:
    id v8 = __atxlog_handle_hero();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "-[ATXCDNDownloaderTriggerManager queryAndHandlePredictionsFromCDNDownloader]_block_invoke";
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "%s No high confidence hero app predictions received for current location. Forwarding location to CDNDownloader ", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 32) forwardLocationToCDNDownloaderAndHandleReply];
    goto LABEL_12;
  }
  id v9 = __atxlog_handle_hero();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    int v11 = "-[ATXCDNDownloaderTriggerManager queryAndHandlePredictionsFromCDNDownloader]_block_invoke";
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "%s Received high confidence hero app predictions for current location. Forwarding predictions to ATXHeroDataServer", (uint8_t *)&v10, 0xCu);
  }

  [*(id *)(a1 + 32) _forwardHeroAppPredictionsToHeroAppPredictionsServer:v5];
LABEL_12:
}

- (void)forwardLocationToCDNDownloaderAndHandleReply
{
  sel_getName(a2);
  id v3 = (void *)os_transaction_create();
  char v4 = [(ATXCDNDownloaderTriggerManager *)self rateLimiter];
  char v5 = [v4 tryToIncrementCountAndReturnSuccess];

  if (v5)
  {
    id v6 = [(ATXCDNDownloaderTriggerManager *)self requestHighQualityLocationWithHundredMeterAccuracy];
    if (v6)
    {
      cdnDownloader = self->_cdnDownloader;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __78__ATXCDNDownloaderTriggerManager_forwardLocationToCDNDownloaderAndHandleReply__block_invoke;
      v10[3] = &unk_1E68AE6C0;
      v10[4] = self;
      [(ATXProactiveCDNDownloaderProtocol *)cdnDownloader heroDatasForLocation:v6 completion:v10];
    }
    else
    {
      id v8 = __atxlog_handle_hero();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Clearing hero app predictions since nil or bad quality location received.", buf, 2u);
      }

      id v9 = objc_opt_new();
      [(ATXCDNDownloaderTriggerManager *)self _forwardHeroAppPredictionsToHeroAppPredictionsServer:v9];
    }
  }
  else
  {
    id v6 = __atxlog_handle_hero();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "Skipping CDN download since rate limit exceeded", buf, 2u);
    }
  }
}

void __78__ATXCDNDownloaderTriggerManager_forwardLocationToCDNDownloaderAndHandleReply__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = __atxlog_handle_hero();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __76__ATXCDNDownloaderTriggerManager_queryAndHandlePredictionsFromCDNDownloader__block_invoke_cold_1((uint64_t)v5, v6);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _forwardHeroAppPredictionsToHeroAppPredictionsServer:a2];
  }
}

- (id)requestHighQualityLocationWithHundredMeterAccuracy
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(ATXPredictionContextBuilderProtocol *)self->_predictionContextBuilder predictionContextForCurrentContext];
  char v4 = [(ATXLocationManager *)self->_locationManager getCurrentLocation];
  id v5 = [v3 timeContext];
  id v6 = [v5 date];

  v7 = __atxlog_handle_hero();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v8)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "Nil location received. Ignoring trigger.", (uint8_t *)&v17, 2u);
    }

    goto LABEL_11;
  }
  if (v8)
  {
    [v4 coordinate];
    uint64_t v10 = v9;
    [v4 coordinate];
    int v17 = 134545921;
    uint64_t v18 = v10;
    __int16 v19 = 2053;
    uint64_t v20 = v11;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "Received location, %{sensitive}f, %{sensitive}f", (uint8_t *)&v17, 0x16u);
  }

  int v12 = [(id)objc_opt_class() _locationIsStaleOrNotAccurateEnough:v4 now:v6];
  __int16 v13 = __atxlog_handle_hero();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Stale or inaccurate location received. Ignoring trigger.", (uint8_t *)&v17, 2u);
    }

LABEL_11:
    id v15 = 0;
    goto LABEL_15;
  }
  if (v14)
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Location passed quality checks. Forwarding to CDN Downloader.", (uint8_t *)&v17, 2u);
  }

  id v15 = v4;
LABEL_15:

  return v15;
}

+ (BOOL)_locationIsStaleOrNotAccurateEnough:(id)a3 now:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 timestamp];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  if (v9 <= 60.0)
  {
    [v5 horizontalAccuracy];
    if (v12 <= 100.0)
    {
      BOOL v14 = 0;
      goto LABEL_10;
    }
    uint64_t v10 = __atxlog_handle_hero();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      [v5 horizontalAccuracy];
      int v16 = 134217984;
      double v17 = v13;
      uint64_t v11 = "Location uncertainty too large, horizontalAccuracy, %f. Ignoring trigger.";
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v10 = __atxlog_handle_hero();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134217984;
      double v17 = v9;
      uint64_t v11 = "Location is stale. Age: %f. Ignoring trigger.";
LABEL_7:
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, 0xCu);
    }
  }

  BOOL v14 = 1;
LABEL_10:

  return v14;
}

- (void)_forwardHeroAppPredictionsToHeroAppPredictionsServer:(id)a3
{
}

void __87__ATXCDNDownloaderTriggerManager__forwardHeroAppPredictionsToHeroAppPredictionsServer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = __atxlog_handle_hero();
  char v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __87__ATXCDNDownloaderTriggerManager__forwardHeroAppPredictionsToHeroAppPredictionsServer___block_invoke_cold_1(v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[ATXCDNDownloaderTriggerManager _forwardHeroAppPredictionsToHeroAppPredictionsServer:]_block_invoke";
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%s Successfully donated predictions.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_registerForRestrictionChangedNotifications
{
  if (!self->_restrictionChangedNotificationToken)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v4 = *MEMORY[0x1E4F741F0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__ATXCDNDownloaderTriggerManager__registerForRestrictionChangedNotifications__block_invoke;
    v7[3] = &unk_1E68AE6E8;
    v7[4] = self;
    int v5 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:v7];
    id restrictionChangedNotificationToken = self->_restrictionChangedNotificationToken;
    self->_id restrictionChangedNotificationToken = v5;
  }
}

uint64_t __77__ATXCDNDownloaderTriggerManager__registerForRestrictionChangedNotifications__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleProfileChangedNotification];
}

- (void)handleProfileChangedNotification
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F74230] sharedConnection];
  char v4 = [v3 isAppClipsAllowed];

  if ((v4 & 1) == 0)
  {
    int v5 = __atxlog_handle_hero();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      int v10 = 138412290;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%@ - MCProfileConnection status changed, App clips no longer allowed. Clearing predictions", (uint8_t *)&v10, 0xCu);
    }
    heroClipManager = self->_heroClipManager;
    double v9 = objc_opt_new();
    [(ATXHeroClipManager *)heroClipManager donateAppClipsWithHeroAppPredictions:v9];
  }
}

- (void)_registerForSiriSettingsChangedNotifications
{
  if (!self->_siriSettingsChangedNotificationToken)
  {
    queue = self->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __78__ATXCDNDownloaderTriggerManager__registerForSiriSettingsChangedNotifications__block_invoke;
    handler[3] = &unk_1E68AC2F8;
    handler[4] = self;
    notify_register_dispatch("com.apple.suggestions.settingsChanged", &self->_siriSettingsChangedNotificationToken, queue, handler);
  }
}

- (ATXHeroDataServer)server
{
  return self->_server;
}

- (ATXProactiveCDNDownloaderProtocol)cdnDownloader
{
  return self->_cdnDownloader;
}

- (ATXHeroAppManager)heroAppManager
{
  return self->_heroAppManager;
}

- (ATXHeroClipManager)heroClipManager
{
  return self->_heroClipManager;
}

- (ATXTimeBucketedRateLimiter)rateLimiter
{
  return self->_rateLimiter;
}

- (ATXPredictionContextBuilderProtocol)predictionContextBuilder
{
  return self->_predictionContextBuilder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionContextBuilder, 0);
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_heroClipManager, 0);
  objc_storeStrong((id *)&self->_heroAppManager, 0);
  objc_storeStrong((id *)&self->_cdnDownloader, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_restrictionChangedNotificationToken, 0);
}

void __76__ATXCDNDownloaderTriggerManager_queryAndHandlePredictionsFromCDNDownloader__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Error while querying data from GeoServices. Error: %@.", (uint8_t *)&v2, 0xCu);
}

void __87__ATXCDNDownloaderTriggerManager__forwardHeroAppPredictionsToHeroAppPredictionsServer___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 description];
  int v4 = 136446210;
  uint64_t v5 = [v3 UTF8String];
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Error while donating predictions, %{public}s", (uint8_t *)&v4, 0xCu);
}

@end