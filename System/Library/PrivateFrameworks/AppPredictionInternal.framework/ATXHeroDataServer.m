@interface ATXHeroDataServer
- (ATXHeroDataServer)init;
- (ATXHeroDataServer)initWithHeroClipManager:(id)a3 heroAppManager:(id)a4 heroPoiManager:(id)a5 tracker:(id)a6 predictionsTracker:(id)a7 locationManager:(id)a8;
- (ATXHeroDataServer)initWithHeroClipManager:(id)a3 heroAppManager:(id)a4 tracker:(id)a5;
- (BOOL)_didPredictionsChange:(id)a3;
- (BOOL)heroAppAndClipPredictionsAreEligibleGivenIsMoving:(BOOL)a3 isNearKnownTypeLOI:(BOOL)a4 isNearFrequentLOI:(BOOL)a5;
- (BOOL)heroPoiPredictionsAreEligibleGivenIsMoving:(BOOL)a3 isNearKnownTypeLOIExcludingGym:(BOOL)a4 isNearFrequentLOI:(BOOL)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_filterPredictions:(id)a3 currentLocation:(id)a4;
- (id)_heroAppPredictionsFromPredictions:(id)a3;
- (id)_heroClipPredictionsFromPredictions:(id)a3;
- (id)_heroPoiPredictionsFromPredictions:(id)a3;
- (id)processPredictions:(id)a3;
- (void)_addBundleIdsToPredictions:(id)a3;
- (void)_donateAppClipsToHeroClipManager:(id)a3;
- (void)_donateHeroAppsToHeroAppManager:(id)a3;
- (void)_donatePoiCategoriesToHeroPoiManager:(id)a3;
- (void)_setExpiry;
- (void)_setPredictionsInDefaults:(id)a3;
- (void)addConfirmForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4;
- (void)addHardRejectForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4;
- (void)addSoftRejectForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)donateHeroAppPredictions:(id)a3 completion:(id)a4;
- (void)donatePredictions:(id)a3 shouldOnlyDonateHeroPoiPredictions:(BOOL)a4;
- (void)feedbackScoreForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4;
- (void)getCurrentHeroPoiCategoryWithCompletion:(id)a3;
- (void)openAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4;
- (void)updateHeroAppManagerAndHeroClipManagerWithPredictions:(id)a3;
@end

@implementation ATXHeroDataServer

- (ATXHeroDataServer)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = [(ATXHeroDataServer *)self initWithHeroClipManager:v3 heroAppManager:v4 tracker:v5];

  return v6;
}

- (ATXHeroDataServer)initWithHeroClipManager:(id)a3 heroAppManager:(id)a4 tracker:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(ATXHeroPoiManager);
  v12 = objc_opt_new();
  v13 = [MEMORY[0x1E4F935D0] sharedInstance];
  v14 = [(ATXHeroDataServer *)self initWithHeroClipManager:v10 heroAppManager:v9 heroPoiManager:v11 tracker:v8 predictionsTracker:v12 locationManager:v13];

  return v14;
}

- (ATXHeroDataServer)initWithHeroClipManager:(id)a3 heroAppManager:(id)a4 heroPoiManager:(id)a5 tracker:(id)a6 predictionsTracker:(id)a7 locationManager:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id obj = a6;
  id v18 = a6;
  id v35 = a7;
  id v19 = a7;
  id v36 = a8;
  v37.receiver = self;
  v37.super_class = (Class)ATXHeroDataServer;
  v20 = [(ATXHeroDataServer *)&v37 init];
  if (v20)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v33 = a8;
    id v21 = v19;
    id v22 = v18;
    id v23 = v17;
    id v24 = v16;
    v26 = id v25 = v15;
    dispatch_queue_t v27 = dispatch_queue_create("ATXHeroServerQueue", v26);
    queue = v20->_queue;
    v20->_queue = (OS_dispatch_queue *)v27;

    id v15 = v25;
    id v16 = v24;
    id v17 = v23;
    id v18 = v22;
    id v19 = v21;
    objc_storeStrong((id *)&v20->_heroClipManager, a3);
    objc_storeStrong((id *)&v20->_heroAppManager, a4);
    objc_storeStrong((id *)&v20->_heroPoiManager, a5);
    objc_storeStrong((id *)&v20->_tracker, obj);
    objc_storeStrong((id *)&v20->_predictionsTracker, v35);
    objc_storeStrong((id *)&v20->_locationManager, v33);
    id v29 = objc_alloc(MEMORY[0x1E4F29290]);
    uint64_t v30 = [v29 initWithMachServiceName:*MEMORY[0x1E4F67E98]];
    listener = v20->_listener;
    v20->_listener = (NSXPCListener *)v30;

    [(NSXPCListener *)v20->_listener setDelegate:v20];
    [(NSXPCListener *)v20->_listener resume];
  }

  return v20;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ATXHeroDataServer;
  [(ATXHeroDataServer *)&v3 dealloc];
}

- (void)donateHeroAppPredictions:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  id v8 = __atxlog_handle_xpc();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = __atxlog_handle_xpc();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "donateHeroAppPredictions", " enableTelemetry=YES ", buf, 2u);
  }

  v12 = __atxlog_handle_hero();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v6 count];
    *(_DWORD *)buf = 136315394;
    id v21 = "-[ATXHeroDataServer donateHeroAppPredictions:completion:]";
    __int16 v22 = 2048;
    uint64_t v23 = v13;
    _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "%s Received %lu hero app predictions", buf, 0x16u);
  }

  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__ATXHeroDataServer_donateHeroAppPredictions_completion___block_invoke;
  v18[3] = &unk_1E68AB870;
  v18[4] = self;
  id v19 = v6;
  id v15 = v6;
  dispatch_sync(queue, v18);
  if (v7) {
    v7[2](v7, 0);
  }
  id v16 = __atxlog_handle_xpc();
  id v17 = v16;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v17, OS_SIGNPOST_INTERVAL_END, v9, "donateHeroAppPredictions", " enableTelemetry=YES ", buf, 2u);
  }
}

uint64_t __57__ATXHeroDataServer_donateHeroAppPredictions_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateHeroAppManagerAndHeroClipManagerWithPredictions:*(void *)(a1 + 40)];
}

- (void)addConfirmForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = a3;
  id v8 = __atxlog_handle_xpc();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = __atxlog_handle_xpc();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "addConfirmForAppClip", " enableTelemetry=YES ", buf, 2u);
  }

  v12 = [(ATXHeroClipManager *)self->_heroClipManager feedback];
  LODWORD(v13) = 1.0;
  [v12 addConfirmForAppClipWithHeroAppPrediction:v7 weight:v13];

  if (v6) {
    v6[2](v6, 0);
  }
  v14 = __atxlog_handle_xpc();
  id v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)id v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v15, OS_SIGNPOST_INTERVAL_END, v9, "addConfirmForAppClip", " enableTelemetry=YES ", v16, 2u);
  }
}

- (void)addSoftRejectForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = a3;
  id v8 = __atxlog_handle_xpc();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = __atxlog_handle_xpc();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "addSoftRejectForAppClip", " enableTelemetry=YES ", buf, 2u);
  }

  v12 = [(ATXHeroClipManager *)self->_heroClipManager feedback];
  LODWORD(v13) = 1.0;
  [v12 addRejectForAppClipWithHeroAppPrediction:v7 weight:v13];

  if (v6) {
    v6[2](v6, 0);
  }
  v14 = __atxlog_handle_xpc();
  id v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)id v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v15, OS_SIGNPOST_INTERVAL_END, v9, "addSoftRejectForAppClip", " enableTelemetry=YES ", v16, 2u);
  }
}

- (void)addHardRejectForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = a3;
  id v8 = __atxlog_handle_xpc();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = __atxlog_handle_xpc();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "addHardRejectForAppClip", " enableTelemetry=YES ", buf, 2u);
  }

  v12 = [(ATXHeroClipManager *)self->_heroClipManager feedback];
  LODWORD(v13) = 1.0;
  [v12 addRejectForAppClipWithHeroAppPrediction:v7 weight:v13];

  if (v6) {
    v6[2](v6, 0);
  }
  v14 = __atxlog_handle_xpc();
  id v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)id v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v15, OS_SIGNPOST_INTERVAL_END, v9, "addHardRejectForAppClip", " enableTelemetry=YES ", v16, 2u);
  }
}

- (void)feedbackScoreForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, double))a4;
  id v7 = a3;
  id v8 = __atxlog_handle_xpc();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = __atxlog_handle_xpc();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "feedbackScoreForAppClip", " enableTelemetry=YES ", buf, 2u);
  }

  v12 = [(ATXHeroClipManager *)self->_heroClipManager feedback];
  [v12 feedbackScoreForAppClipWithHeroAppPrediction:v7];
  double v14 = v13;

  if (v6) {
    v6[2](v6, 0, v14);
  }
  id v15 = __atxlog_handle_xpc();
  id v16 = v15;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)id v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v16, OS_SIGNPOST_INTERVAL_END, v9, "feedbackScoreForAppClip", " enableTelemetry=YES ", v17, 2u);
  }
}

- (void)openAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
}

- (void)getCurrentHeroPoiCategoryWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  v5 = __atxlog_handle_xpc();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = __atxlog_handle_xpc();
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "getCurrentPoiCategory", " enableTelemetry=YES ", buf, 2u);
  }

  os_signpost_id_t v9 = [(ATXHeroPoiManager *)self->_heroPoiManager currentPoiCategory];
  v4[2](v4, v9, 0);

  id v10 = __atxlog_handle_xpc();
  v11 = v10;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v11, OS_SIGNPOST_INTERVAL_END, v6, "getCurrentPoiCategory", " enableTelemetry=YES ", v12, 2u);
  }
}

- (id)processPredictions:(id)a3
{
  id v4 = a3;
  v5 = [(ATXLocationManagerProtocol *)self->_locationManager getCurrentLocation];
  if (v5)
  {
    os_signpost_id_t v6 = [(ATXHeroDataServer *)self _filterPredictions:v4 currentLocation:v5];

    id v7 = +[ATXHeroDataServerHelper heroAppPredictionsSortedByDistance:v6 currentLocation:v5];

    [(ATXHeroDataServer *)self _addBundleIdsToPredictions:v7];
    id v4 = v7;
    id v8 = v4;
  }
  else
  {
    os_signpost_id_t v9 = __atxlog_handle_hero();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXHeroDataServer processPredictions:](v9);
    }

    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (void)donatePredictions:(id)a3 shouldOnlyDonateHeroPoiPredictions:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(ATXHeroDataServer *)self _heroPoiPredictionsFromPredictions:v6];
  if (!v4)
  {
    os_signpost_id_t v9 = [(ATXHeroDataServer *)self _heroAppPredictionsFromPredictions:v6];
    id v10 = [(ATXHeroDataServer *)self _heroClipPredictionsFromPredictions:v6];
    uint64_t v11 = [v6 count];
    BOOL v12 = [(ATXHeroDataServer *)self _didPredictionsChange:v6];
    if (v12 || !v11)
    {
      [(ATXHeroDataServer *)self _donateAppClipsToHeroClipManager:v10];
      if ([v10 count])
      {
        id v17 = (void *)MEMORY[0x1E4F1CBF0];
        id v18 = self;
      }
      else
      {
        id v18 = self;
        id v17 = v9;
      }
      [(ATXHeroDataServer *)v18 _donateHeroAppsToHeroAppManager:v17];
      [(ATXHeroDataServer *)self _setPredictionsInDefaults:v6];
      if (v11) {
        [(ATXHeroDataServer *)self _setExpiry];
      }
      if (v12)
      {
        [(ATXHeroDataServer *)self _donatePoiCategoriesToHeroPoiManager:v7];
LABEL_26:

        goto LABEL_27;
      }
      double v13 = __atxlog_handle_hero();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        double v14 = "Not sending POI categories to blending, since nil predictions were recently donated.";
        id v15 = v20;
        goto LABEL_24;
      }
    }
    else
    {
      double v13 = __atxlog_handle_hero();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = 0;
        double v14 = "Not sending predictions to blending, since same predictions were recently donated.";
        id v15 = (uint8_t *)&v19;
LABEL_24:
        _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
      }
    }

    goto LABEL_26;
  }
  id v8 = __atxlog_handle_hero();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "The user is in a location where we only donate POI category predictions.", buf, 2u);
  }

  if ([(ATXHeroDataServer *)self _didPredictionsChange:v7])
  {
    [(ATXHeroDataServer *)self _setPredictionsInDefaults:v7];
    if ([v7 count]) {
      [(ATXHeroDataServer *)self _setExpiry];
    }
    [(ATXHeroDataServer *)self _donatePoiCategoriesToHeroPoiManager:v7];
  }
  else
  {
    id v16 = __atxlog_handle_hero();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v21 = 0;
      _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "The same POI category prediction already donated. Not donating another prediction of the same category", v21, 2u);
    }
  }
LABEL_27:
}

- (BOOL)heroAppAndClipPredictionsAreEligibleGivenIsMoving:(BOOL)a3 isNearKnownTypeLOI:(BOOL)a4 isNearFrequentLOI:(BOOL)a5
{
  return !a4 && !a5 && !a3;
}

- (BOOL)heroPoiPredictionsAreEligibleGivenIsMoving:(BOOL)a3 isNearKnownTypeLOIExcludingGym:(BOOL)a4 isNearFrequentLOI:(BOOL)a5
{
  return !a3 && !a4;
}

- (void)updateHeroAppManagerAndHeroClipManagerWithPredictions:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = [(ATXLocationManagerProtocol *)self->_locationManager locationOfInterestAtCurrentLocation];
  id v6 = __atxlog_handle_hero();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v35 = 136315394;
    *(void *)&v35[4] = "-[ATXHeroDataServer updateHeroAppManagerAndHeroClipManagerWithPredictions:]";
    *(_WORD *)&v35[12] = 2112;
    *(void *)&v35[14] = v5;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "%s Location of Interest: %@", v35, 0x16u);
  }

  if (!v5 || [v5 type] == -1)
  {
    uint64_t v8 = 0;
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = [v5 type] != 3;
    uint64_t v8 = 1;
  }
  uint64_t v9 = [(ATXLocationManagerProtocol *)self->_locationManager isNearFrequentLocationOfInterest];
  BOOL v10 = +[ATXHeroDataServerHelper canPredictClipsGivenRecentMotion];
  BOOL v11 = !v10;
  BOOL v12 = [(ATXHeroDataServer *)self heroAppAndClipPredictionsAreEligibleGivenIsMoving:v11 isNearKnownTypeLOI:v8 isNearFrequentLOI:v9];
  BOOL v13 = [(ATXHeroDataServer *)self heroPoiPredictionsAreEligibleGivenIsMoving:v11 isNearKnownTypeLOIExcludingGym:v7 isNearFrequentLOI:v9];
  if ([MEMORY[0x1E4F93B08] isInternalBuild])
  {
    CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F4B758];
    v35[0] = 0;
    if (CFPreferencesGetAppBooleanValue(v14, (CFStringRef)*MEMORY[0x1E4F4B688], v35))
    {
      id v15 = __atxlog_handle_hero();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v35 = 0;
        _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "Defaults for OverrideHeroAppPredictionEligibility set to True: Overriding hero app and clip predictions location eligibility and setting to True", v35, 2u);
      }

      goto LABEL_14;
    }
  }
  if (v12)
  {
    if (v13)
    {
LABEL_14:
      int v16 = 0;
      int v17 = 1;
LABEL_38:
      uint64_t v30 = v17 & v16;
      uint64_t v31 = -[ATXHeroDataServer processPredictions:](self, "processPredictions:", v4, *(_OWORD *)v35, *(void *)&v35[16]);

      [(ATXHeroDataServer *)self donatePredictions:v31 shouldOnlyDonateHeroPoiPredictions:v30];
      id v4 = (id)v31;
      goto LABEL_39;
    }
  }
  else
  {
    id v18 = __atxlog_handle_hero();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = @"YES";
      if (v10) {
        v20 = @"NO";
      }
      else {
        v20 = @"YES";
      }
      if (v8) {
        id v21 = @"YES";
      }
      else {
        id v21 = @"NO";
      }
      *(_DWORD *)id v35 = 138412802;
      *(void *)&v35[4] = v20;
      *(_WORD *)&v35[12] = 2112;
      *(void *)&v35[14] = v21;
      if (!v9) {
        __int16 v19 = @"NO";
      }
      *(_WORD *)&v35[22] = 2112;
      id v36 = v19;
      _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "Clearing Hero App and Clip Predictions because the person is moving, or is near a known LOI, or is near a frequently visited LOI. isMoving: %@, isNearKnownTypeLOI: %@, isNearFrequentLOI: %@", v35, 0x20u);
    }

    __int16 v22 = objc_opt_new();
    [(ATXHeroDataServer *)self _donateHeroAppsToHeroAppManager:v22];

    uint64_t v23 = objc_opt_new();
    [(ATXHeroDataServer *)self _donateAppClipsToHeroClipManager:v23];

    if (v13)
    {
      int v17 = 1;
      int v16 = 1;
      goto LABEL_38;
    }
  }
  uint64_t v24 = __atxlog_handle_hero();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = @"YES";
    if (v10) {
      v26 = @"NO";
    }
    else {
      v26 = @"YES";
    }
    if (!v7) {
      id v25 = @"NO";
    }
    *(_DWORD *)id v35 = 138412546;
    *(void *)&v35[4] = v26;
    *(_WORD *)&v35[12] = 2112;
    *(void *)&v35[14] = v25;
    _os_log_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_DEFAULT, "Clearing Hero POI Predictions because the person is moving, or is near a known LOI excluding gym. isMoving: %@, isNearKnownTypeLOIExcludingGym: %@", v35, 0x16u);
  }

  dispatch_queue_t v27 = objc_opt_new();
  BOOL v28 = [(ATXHeroDataServer *)self _didPredictionsChange:v27];

  if (v28)
  {
    id v29 = objc_opt_new();
    [(ATXHeroDataServer *)self _donatePoiCategoriesToHeroPoiManager:v29];
  }
  if (v12)
  {
    int v17 = 0;
    int v16 = 0;
    goto LABEL_38;
  }
  v32 = objc_opt_new();
  BOOL v33 = [(ATXHeroDataServer *)self _didPredictionsChange:v32];

  if (v33)
  {
    v34 = objc_opt_new();
    [(ATXHeroDataServer *)self _setPredictionsInDefaults:v34];
  }
LABEL_39:
}

- (void)_donateAppClipsToHeroClipManager:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = __atxlog_handle_hero();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 description];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Sending app clip predictions to App Clips manager. Predictions: %@", (uint8_t *)&v7, 0xCu);
  }
  [(ATXHeroClipManager *)self->_heroClipManager donateAppClipsWithHeroAppPredictions:v4];
}

- (void)_donateHeroAppsToHeroAppManager:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = __atxlog_handle_hero();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 description];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Sending hero app predictions to Hero App Manager. Predictions: %@", (uint8_t *)&v7, 0xCu);
  }
  [(ATXHeroAppManager *)self->_heroAppManager donateHeroAppPredictions:v4];
}

- (void)_donatePoiCategoriesToHeroPoiManager:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = __atxlog_handle_hero();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 description];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Sending hero poi predictions to Hero POI Manager. Predictions: %@", (uint8_t *)&v7, 0xCu);
  }
  [(ATXHeroPoiManager *)self->_heroPoiManager donateHeroPoiPredictions:v4];
}

- (id)_filterPredictions:(id)a3 currentLocation:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v7)
  {
    uint64_t v8 = +[ATXHeroDataServerHelper inRadiusPredictionsFrom:v6 currentLocation:v7];

    uint64_t v9 = __atxlog_handle_hero();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      uint64_t v14 = [v8 count];
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Left with %lu hero app predictions after removing out of radius predictions.", (uint8_t *)&v13, 0xCu);
    }

    id v6 = v8;
    BOOL v10 = v6;
  }
  else
  {
    BOOL v11 = __atxlog_handle_hero();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "Empty location received while applying radius filter. Clearing predictions.", (uint8_t *)&v13, 2u);
    }

    BOOL v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (void)_addBundleIdsToPredictions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        BOOL v11 = +[ATXHeroDataServerHelper bundleIdForPrediction:](ATXHeroDataServerHelper, "bundleIdForPrediction:", v10, (void)v12);
        [v10 setBundleId:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)_heroAppPredictionsFromPredictions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    uint64_t v10 = *MEMORY[0x1E4F67E90];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v13 = objc_msgSend(v12, "bundleId", (void)v16);
        char v14 = [v13 isEqualToString:v10];

        if ((v14 & 1) == 0) {
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_heroClipPredictionsFromPredictions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    uint64_t v10 = *MEMORY[0x1E4F67E90];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v13 = objc_msgSend(v12, "bundleId", (void)v16);
        if ([v13 isEqualToString:v10])
        {
          char v14 = [v12 urlHash];

          if (v14) {
            [v5 addObject:v12];
          }
        }
        else
        {
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_heroPoiPredictionsFromPredictions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "poiCategory", (void)v17);
        if (v12)
        {
          long long v13 = (void *)v12;
          char v14 = [v11 poiCategory];
          char v15 = [v14 isEqualToString:&stru_1F2740B58];

          if ((v15 & 1) == 0) {
            [v5 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_didPredictionsChange:(id)a3
{
  objc_super v3 = self;
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  LOBYTE(v3) = [(ATXHeroPredictionsTracker *)v3->_predictionsTracker didPredictionsChange:v5];

  return (char)v3;
}

- (void)_setPredictionsInDefaults:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(ATXHeroPredictionsTracker *)self->_predictionsTracker setPredictionsInDefaults:v5];
}

- (void)_setExpiry
{
  objc_super v3 = __atxlog_handle_hero();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "Setting hero expiry", buf, 2u);
  }

  id v4 = +[ATXHeroAndClipConstants sharedInstance];
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  id v6 = (const char *)*MEMORY[0x1E4F14170];
  [v4 heroAppPredictionExpirationInterval];
  xpc_dictionary_set_int64(v5, v6, (uint64_t)v7);
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E4F141A8], 60);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F142F8], 0);
  xpc_dictionary_set_string(v5, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __31__ATXHeroDataServer__setExpiry__block_invoke;
  handler[3] = &unk_1E68ACF98;
  handler[4] = self;
  xpc_activity_register("com.apple.duetexpertd.expire-hero", v5, handler);
}

void __31__ATXHeroDataServer__setExpiry__block_invoke(uint64_t a1, xpc_activity_t activity)
{
  if (xpc_activity_get_state(activity) == 2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(NSObject **)(v3 + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__ATXHeroDataServer__setExpiry__block_invoke_2;
    block[3] = &unk_1E68AB818;
    block[4] = v3;
    dispatch_sync(v4, block);
  }
}

void __31__ATXHeroDataServer__setExpiry__block_invoke_2(uint64_t a1)
{
  v2 = __atxlog_handle_hero();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "Expiring hero apps since time interval has passed", buf, 2u);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = objc_opt_new();
  [v3 _donateHeroAppsToHeroAppManager:v4];

  xpc_object_t v5 = *(void **)(a1 + 32);
  id v6 = objc_opt_new();
  [v5 _donateAppClipsToHeroClipManager:v6];

  double v7 = *(void **)(a1 + 32);
  uint64_t v8 = objc_opt_new();
  LODWORD(v7) = [v7 _didPredictionsChange:v8];

  if (v7)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = objc_opt_new();
    [v9 _setPredictionsInDefaults:v10];

    BOOL v11 = *(void **)(a1 + 32);
    uint64_t v12 = objc_opt_new();
    [v11 _donatePoiCategoriesToHeroPoiManager:v12];
  }
  else
  {
    uint64_t v12 = __atxlog_handle_hero();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v13 = 0;
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "Not sending POI categories to blending, since nil predictions were recently donated.", v13, 2u);
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F67E98];
  double v7 = [v5 valueForEntitlement:*MEMORY[0x1E4F67E98]];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && ([v7 BOOLValue] & 1) != 0)
  {
    uint64_t v8 = ATXHeroDataXPCInterface();
    [v5 setExportedInterface:v8];

    [v5 setExportedObject:self];
    [v5 setInterruptionHandler:&__block_literal_global_168];
    [v5 setInvalidationHandler:&__block_literal_global_43_1];
    [v5 resume];
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v10 = __atxlog_handle_hero();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationDigestRankerServer listener:shouldAcceptNewConnection:]((uint64_t)v5, v6, v10);
    }

    BOOL v9 = 0;
  }

  return v9;
}

void __56__ATXHeroDataServer_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = __atxlog_handle_hero();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEFAULT, "Unexpected interruption on App Prediction ATXServer XPC interface", v1, 2u);
  }
}

void __56__ATXHeroDataServer_listener_shouldAcceptNewConnection___block_invoke_41()
{
  v0 = __atxlog_handle_hero();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEFAULT, "Connection invalidated on App Prediction ATXServer XPC interface. Client went away.", v1, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_predictionsTracker, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_heroPoiManager, 0);
  objc_storeStrong((id *)&self->_heroAppManager, 0);
  objc_storeStrong((id *)&self->_heroClipManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)processPredictions:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Could not get location. Clearing predictions.", v1, 2u);
}

@end