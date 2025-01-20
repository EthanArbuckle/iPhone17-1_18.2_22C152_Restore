@interface MapsSuggestionsRealInsights
- (BOOL)isTransitUser;
- (BOOL)isTransitUserHere;
- (BOOL)userHasAPaymentCard;
- (BOOL)userHasATransitCard;
- (BOOL)userHasAnExpressPaymentCard;
- (BOOL)userHasAnUpcomingTrip;
- (BOOL)userIsCurrentlyInATrip;
- (MapsSuggestionsInsightsUpdates)insightUpdatesDelegate;
- (NSString)uniqueName;
- (char)currentTripWithHandler:(id)a3;
- (char)futureTripsWithHandler:(id)a3;
- (char)signalPackForDestinationEntry:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5;
- (char)signalPackForDestinationMapItem:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5;
- (char)signalPackForHereWithHandler:(id)a3;
- (double)isTouristHere;
- (id).cxx_construct;
- (id)confidenceScoresForContacts:(id)a3 addresses:(id)a4;
- (id)confidenceScoresForMapItems:(id)a3;
- (id)initFromResourceDepot:(id)a3;
- (id)signalPackForDestinationEntry:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4;
- (id)signalPackForDestinationMapItem:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4;
- (id)signalPackForHere;
- (void)_closeConnection;
- (void)_openConnectionIfNecessary;
- (void)_scheduleCloseConnection;
- (void)_unscheduleCloseConnection;
- (void)dealloc;
- (void)setInsightUpdatesDelegate:(id)a3;
- (void)signalPackUpdated:(id)a3;
@end

@implementation MapsSuggestionsRealInsights

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)signalPackUpdated:(id)a3
{
  *(void *)&v11[13] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MapsSuggestionsRealInsights *)self insightUpdatesDelegate];
  if (!v5)
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      v9 = "MapsSuggestionsRealInsights.mm";
      __int16 v10 = 1026;
      *(_DWORD *)v11 = 512;
      v11[2] = 2082;
      *(void *)&v11[3] = "-[MapsSuggestionsRealInsights signalPackUpdated:]";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongDelegate went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
    v6 = (char *)v7;
    goto LABEL_8;
  }
  if (objc_opt_respondsToSelector())
  {
    MapsSuggestionsSignalPackFromData(v4);
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    [v5 insightsUpdated:v6];
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138412546;
      v9 = v6;
      __int16 v10 = 2112;
      *(void *)v11 = v5;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "Received a SignalPack update %@ and delivered to %@", (uint8_t *)&v8, 0x16u);
    }
LABEL_8:
  }
}

- (MapsSuggestionsInsightsUpdates)insightUpdatesDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_insightUpdatesDelegate);
  return (MapsSuggestionsInsightsUpdates *)WeakRetained;
}

- (char)futureTripsWithHandler:(id)a3
{
  return [(MapsSuggestionsPortrait *)self->_portrait futureTripsWithHandler:a3];
}

- (id)initFromResourceDepot:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 73;
      __int16 v24 = 2082;
      v25 = "-[MapsSuggestionsRealInsights initFromResourceDepot:]";
      __int16 v26 = 2082;
      v27 = "nil == (resourceDepot)";
      _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!", buf, 0x26u);
    }
    goto LABEL_19;
  }
  v6 = [v4 oneRoutine];

  if (!v6)
  {
    v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 74;
      __int16 v24 = 2082;
      v25 = "-[MapsSuggestionsRealInsights initFromResourceDepot:]";
      __int16 v26 = 2082;
      v27 = "nil == (resourceDepot.oneRoutine)";
      _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Routine!", buf, 0x26u);
    }
    goto LABEL_19;
  }
  v7 = [v5 oneNetworkRequester];

  if (!v7)
  {
    v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 75;
      __int16 v24 = 2082;
      v25 = "-[MapsSuggestionsRealInsights initFromResourceDepot:]";
      __int16 v26 = 2082;
      v27 = "nil == (resourceDepot.oneNetworkRequester)";
      _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Network!", buf, 0x26u);
    }
    goto LABEL_19;
  }
  int v8 = [v5 onePortrait];

  if (!v8)
  {
    v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 77;
      __int16 v24 = 2082;
      v25 = "-[MapsSuggestionsRealInsights initFromResourceDepot:]";
      __int16 v26 = 2082;
      v27 = "nil == (resourceDepot.onePortrait)";
      _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Portrait!", buf, 0x26u);
    }
LABEL_19:

    v19 = 0;
    goto LABEL_20;
  }
  v22.receiver = self;
  v22.super_class = (Class)MapsSuggestionsRealInsights;
  v9 = [(MapsSuggestionsRealInsights *)&v22 init];
  if (v9)
  {
    __int16 v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    MSg::Queue::Queue((dispatch_queue_t *)buf, @"MapsSuggestionsInsightsQueue", v10);
    v11 = *(OS_dispatch_queue **)buf;
    *(void *)buf = 0;
    innerQueue = v9->_queue._innerQueue;
    v9->_queue._innerQueue = v11;

    v13 = *(NSString **)&buf[8];
    *(void *)&buf[8] = 0;
    name = v9->_queue._name;
    v9->_queue._name = v13;

    closeTimer = v9->_closeTimer;
    v9->_closeTimer = 0;

    connection = v9->_connection;
    v9->_connection = 0;

    uint64_t v17 = [v5 onePortrait];
    portrait = v9->_portrait;
    v9->_portrait = (MapsSuggestionsPortrait *)v17;
  }
  self = v9;
  v19 = self;
LABEL_20:

  return v19;
}

void __60__MapsSuggestionsRealInsights_signalPackForHereWithHandler___block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v19[13] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446722;
      uint64_t v17 = "MapsSuggestionsRealInsights.mm";
      __int16 v18 = 1026;
      *(_DWORD *)v19 = 334;
      v19[2] = 2082;
      *(void *)&v19[3] = "-[MapsSuggestionsRealInsights signalPackForHereWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v16, 0x1Cu);
    }
    int v8 = v11;
    goto LABEL_11;
  }
  if (v5 && !v6)
  {
    int v8 = +[MapsSuggestionsSignalPack signalPackFromData:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      __int16 v10 = [WeakRetained uniqueName];
      int v16 = 138412546;
      uint64_t v17 = v10;
      __int16 v18 = 2080;
      *(void *)v19 = "signalPackForHereWithHandler";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v16, 0x16u);
    }
    v11 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v11))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "signalPackForHereWithHandler", "", (uint8_t *)&v16, 2u);
    }
LABEL_11:

    goto LABEL_19;
  }
  v12 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v16 = 138412290;
    uint64_t v17 = v6;
    _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "Failed with error: %@", (uint8_t *)&v16, 0xCu);
  }

  GEOFindOrCreateLog();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = [WeakRetained uniqueName];
    int v16 = 138412546;
    uint64_t v17 = v14;
    __int16 v18 = 2080;
    *(void *)v19 = "signalPackForHereWithHandler";
    _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v16, 0x16u);
  }
  v15 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v15))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "signalPackForHereWithHandler", "", (uint8_t *)&v16, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_19:
}

void __48__MapsSuggestionsRealInsights_signalPackForHere__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Error on signalPackForHere, error:%@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = [v5 copy];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)isTransitUserHere
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    v14 = "-[MapsSuggestionsRealInsights isTransitUserHere]";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v4 = [(MapsSuggestionsRealInsights *)self signalPackForHere];
  if (v4)
  {
    id v5 = [[MapsSuggestionsSignalPackEvaluator alloc] initWithSignalPack:v4];
    [(MapsSuggestionsSignalPackEvaluator *)v5 isTransitUserHereConfidence];
    double v7 = v6;
    double v8 = MapsSuggestionsConfidenceDontKnow();
    BOOL v9 = v7 > v8;
    __int16 v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = @"NO";
      if (v7 > v8) {
        int v11 = @"YES";
      }
      int v13 = 134218242;
      v14 = *(const char **)&v7;
      __int16 v15 = 2112;
      int v16 = v11;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "isTransitUserHere: %f = %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v5 = (MapsSuggestionsSignalPackEvaluator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A70DF000, &v5->super, OS_LOG_TYPE_ERROR, "Couldn't get SignalPack. Cannot predict isTransitUserHere, so we say NO", (uint8_t *)&v13, 2u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (double)isTouristHere
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F647A0] sharedManager];
  int v4 = [v3 isEnabledForSubTestWithName:@"MSGPPTTest_Insights_ACRanking_Tourist"];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"MSGPPTTest_Insights_ACRanking_TouristBEGIN" object:0];
  }
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (s_verbose)
  {
    double v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136315138;
      v19 = "-[MapsSuggestionsRealInsights isTouristHere]";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v18, 0xCu);
    }
  }
  double v7 = [(MapsSuggestionsRealInsights *)self signalPackForHere];
  if (v7)
  {
    double v8 = [[MapsSuggestionsSignalPackEvaluator alloc] initWithSignalPack:v7];
    if ([(MapsSuggestionsSignalPackEvaluator *)v8 hasTouristInfo])
    {
      if ([(MapsSuggestionsSignalPackEvaluator *)v8 isTouristHere]) {
        double v9 = MapsSuggestionsConfidenceDefinitelyTrue();
      }
      else {
        double v9 = MapsSuggestionsConfidenceDefinitelyFalse();
      }
      double v11 = v9;
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      }
      if (s_verbose)
      {
        int v13 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          int v18 = 134217984;
          v19 = *(const char **)&v11;
          _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "isTouristHere: %f", (uint8_t *)&v18, 0xCu);
        }
      }
      v14 = [MEMORY[0x1E4F647A0] sharedManager];
      int v15 = [v14 isEnabledForSubTestWithName:@"MSGPPTTest_Insights_ACRanking_Tourist"];

      if (v15)
      {
        int v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v16 postNotificationName:@"MSGPPTTest_Insights_ACRanking_TouristEND" object:0];
      }
    }
    else
    {
      id v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "Couldn't get TouristInfo from Evaluator. Cannot predict confidence", (uint8_t *)&v18, 2u);
      }

      double v11 = MapsSuggestionsConfidenceDontKnow();
    }
  }
  else
  {
    __int16 v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "Couldn't get SignalPack. Cannot predict confidence", (uint8_t *)&v18, 2u);
    }

    double v11 = MapsSuggestionsConfidenceDontKnow();
  }

  return v11;
}

- (id)signalPackForHere
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  id v22 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__MapsSuggestionsRealInsights_signalPackForHere__block_invoke;
  v14[3] = &unk_1E5CB94D0;
  int v16 = &v17;
  id v5 = v4;
  int v15 = v5;
  if ([(MapsSuggestionsRealInsights *)self signalPackForHereWithHandler:v14])
  {
    GEOConfigGetDouble();
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    if (dispatch_semaphore_wait(v5, v7))
    {
      double v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "Timeout on signalPackForHere", buf, 2u);
      }
    }
    v9.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    __int16 v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v24 = (v9.__d_.__rep_ - v3.__d_.__rep_) / 1000;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "signalPackForHere took %lu usec", buf, 0xCu);
    }

    id v11 = (id)v18[5];
  }
  else
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "No callback on signalPackForHere", buf, 2u);
    }

    id v11 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (char)signalPackForHereWithHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      double v6 = [(MapsSuggestionsRealInsights *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      int v16 = v6;
      __int16 v17 = 2080;
      *(void *)int v18 = "signalPackForHereWithHandler";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    dispatch_time_t v7 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "signalPackForHereWithHandler", "", buf, 2u);
    }

    double v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Getting SignalPack for here", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__MapsSuggestionsRealInsights_signalPackForHereWithHandler___block_invoke;
    v12[3] = &unk_1E5CB84F0;
    objc_copyWeak(&v14, (id *)buf);
    id v13 = v4;
    dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
    char v9 = 1;
  }
  else
  {
    __int16 v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      int v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      __int16 v17 = 1024;
      *(_DWORD *)int v18 = 323;
      *(_WORD *)&v18[4] = 2082;
      *(void *)&v18[6] = "-[MapsSuggestionsRealInsights signalPackForHereWithHandler:]";
      __int16 v19 = 2082;
      uint64_t v20 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler block", buf, 0x26u);
    }

    char v9 = 0;
  }

  return v9;
}

void __60__MapsSuggestionsRealInsights_signalPackForHereWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsRealInsights _openConnectionIfNecessary]((uint64_t)WeakRetained);
    id v5 = [v4[3] remoteObjectProxy];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__MapsSuggestionsRealInsights_signalPackForHereWithHandler___block_invoke_103;
    v7[3] = &unk_1E5CB94A8;
    objc_copyWeak(&v9, v2);
    id v8 = *(id *)(a1 + 32);
    [v5 signalPackForLocation:0 handler:v7];

    -[MapsSuggestionsRealInsights _scheduleCloseConnection]((dispatch_queue_t *)v4);
    objc_destroyWeak(&v9);
  }
  else
  {
    GEOFindOrCreateLog();
    double v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v11 = "MapsSuggestionsRealInsights.mm";
      __int16 v12 = 1026;
      int v13 = 331;
      __int16 v14 = 2082;
      int v15 = "-[MapsSuggestionsRealInsights signalPackForHereWithHandler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

- (void)_scheduleCloseConnection
{
  dispatch_assert_queue_V2(a1[1]);
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "_scheduleCloseConnection", (uint8_t *)v14, 2u);
  }

  dispatch_assert_queue_V2(a1[1]);
  if (!a1[4])
  {
    std::chrono::steady_clock::time_point v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "Re-initializing the _closeTimer", (uint8_t *)v14, 2u);
    }

    objc_initWeak(&location, a1);
    id v4 = a1[1];
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
    dispatch_queue_t v6 = a1[4];
    a1[4] = v5;

    dispatch_source_set_timer(a1[4], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_time_t v7 = a1[4];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__MapsSuggestionsRealInsights__initCloseTimerIfNecessary__block_invoke;
    v14[3] = &unk_1E5CB7E78;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v7, v14);
    dispatch_resume(a1[4]);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  GEOConfigGetDouble();
  double v9 = v8;
  GEOConfigGetDouble();
  double v11 = v10;
  __int16 v12 = a1[4];
  dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
  dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v11 * 1000000000.0));
}

- (void)_openConnectionIfNecessary
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (!*(void *)(a1 + 24))
  {
    GEOFindOrCreateLog();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      std::chrono::steady_clock::time_point v3 = [(id)a1 uniqueName];
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v3;
      __int16 v22 = 2080;
      v23 = "openingConnectionForRealInsights";
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    id v4 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "openingConnectionForRealInsights", "", buf, 2u);
    }

    dispatch_source_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.maps.destinationd.signalPipeline" options:0];
    dispatch_queue_t v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFCA48D0];
    [v5 setRemoteObjectInterface:v6];

    dispatch_time_t v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC90C88];
    double v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    [v7 setClasses:v8 forSelector:sel_signalPackUpdated_ argumentIndex:0 ofReply:0];

    [v5 setExportedInterface:v7];
    [v5 setExportedObject:a1];
    objc_initWeak(&location, (id)a1);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke;
    v17[3] = &unk_1E5CB7E78;
    objc_copyWeak(&v18, &location);
    [v5 setInvalidationHandler:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_162;
    v15[3] = &unk_1E5CB7E78;
    objc_copyWeak(&v16, &location);
    [v5 setInterruptionHandler:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_164;
    v13[3] = &unk_1E5CB94F8;
    objc_copyWeak(&v14, &location);
    id v9 = (id)[v5 remoteObjectProxyWithErrorHandler:v13];
    objc_storeStrong((id *)(a1 + 24), v5);
    [v5 resume];
    GEOFindOrCreateLog();
    double v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      double v11 = [(id)a1 uniqueName];
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v11;
      __int16 v22 = 2080;
      v23 = "openingConnectionForRealInsights";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    __int16 v12 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "openingConnectionForRealInsights", "", buf, 2u);
    }

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  -[MapsSuggestionsRealInsights _unscheduleCloseConnection]((uint64_t)self);
  -[MapsSuggestionsRealInsights _closeConnection](self);
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsRealInsights;
  [(MapsSuggestionsRealInsights *)&v3 dealloc];
}

- (void)_unscheduleCloseConnection
{
  if (a1)
  {
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)dispatch_source_t v5 = 0;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "_unscheduleCloseConnection", v5, 2u);
    }

    objc_super v3 = *(NSObject **)(a1 + 32);
    if (v3)
    {
      dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
      id v4 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;
    }
  }
}

- (void)_closeConnection
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    GEOFindOrCreateLog();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_super v3 = [a1 uniqueName];
      int v11 = 138412546;
      __int16 v12 = v3;
      __int16 v13 = 2080;
      id v14 = "_closeConnection";
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", (uint8_t *)&v11, 0x16u);
    }
    id v4 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v4))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_closeConnection", "", (uint8_t *)&v11, 2u);
    }

    dispatch_source_t v5 = (void *)a1[3];
    if (v5)
    {
      id v6 = v5;
      dispatch_time_t v7 = (void *)a1[3];
      a1[3] = 0;

      [v6 setInterruptionHandler:0];
      [v6 setInvalidationHandler:0];
      [v6 invalidate];
    }
    -[MapsSuggestionsRealInsights _unscheduleCloseConnection]((uint64_t)a1);
    GEOFindOrCreateLog();
    double v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [a1 uniqueName];
      int v11 = 138412546;
      __int16 v12 = v9;
      __int16 v13 = 2080;
      id v14 = "_closeConnection";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v11, 0x16u);
    }
    double v10 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v10))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_closeConnection", "", (uint8_t *)&v11, 2u);
    }
  }
}

- (id)confidenceScoresForMapItems:(id)a3
{
  return 0;
}

- (id)confidenceScoresForContacts:(id)a3 addresses:(id)a4
{
  return 0;
}

- (BOOL)isTransitUser
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    id v14 = "-[MapsSuggestionsRealInsights isTransitUser]";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v4 = [(MapsSuggestionsRealInsights *)self signalPackForHere];
  if (v4)
  {
    dispatch_source_t v5 = [[MapsSuggestionsSignalPackEvaluator alloc] initWithSignalPack:v4];
    [(MapsSuggestionsSignalPackEvaluator *)v5 isTransitUserConfidence];
    double v7 = v6;
    double v8 = MapsSuggestionsConfidenceDontKnow();
    BOOL v9 = v7 > v8;
    double v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = @"NO";
      if (v7 > v8) {
        int v11 = @"YES";
      }
      int v13 = 134218242;
      id v14 = *(const char **)&v7;
      __int16 v15 = 2112;
      id v16 = v11;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "isTransitUserHere: %f = %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    dispatch_source_t v5 = (MapsSuggestionsSignalPackEvaluator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A70DF000, &v5->super, OS_LOG_TYPE_ERROR, "Couldn't get SignalPack. Cannot predict isTransitUser, so we say NO", (uint8_t *)&v13, 2u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)userHasAnExpressPaymentCard
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    id v14 = "-[MapsSuggestionsRealInsights userHasAnExpressPaymentCard]";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v4 = [(MapsSuggestionsRealInsights *)self signalPackForHere];
  if (v4)
  {
    dispatch_source_t v5 = [[MapsSuggestionsSignalPackEvaluator alloc] initWithSignalPack:v4];
    double v6 = MapsSuggestionsConfidenceDontKnow();
    if ([(MapsSuggestionsSignalPackEvaluator *)v5 hasSignalForExpressPaymentCard])
    {
      double v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "hasSignalForExpressPaymentCard", (uint8_t *)&v13, 2u);
      }

      double v6 = (double)[(MapsSuggestionsSignalPackEvaluator *)v5 userHasAnExpressPaymentCard];
    }
    double v8 = MapsSuggestionsConfidenceDontKnow();
    BOOL v9 = v6 > v8;
    double v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = @"NO";
      if (v6 > v8) {
        int v11 = @"YES";
      }
      int v13 = 134218242;
      id v14 = *(const char **)&v6;
      __int16 v15 = 2112;
      id v16 = v11;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "userHasAnExpressPaymentCard: %f = %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    dispatch_source_t v5 = (MapsSuggestionsSignalPackEvaluator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A70DF000, &v5->super, OS_LOG_TYPE_ERROR, "Couldn't get SignalPack. Cannot predict if userHasAnExpressPaymentCard, so we say NO", (uint8_t *)&v13, 2u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)userHasAPaymentCard
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    id v14 = "-[MapsSuggestionsRealInsights userHasAPaymentCard]";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v4 = [(MapsSuggestionsRealInsights *)self signalPackForHere];
  if (v4)
  {
    dispatch_source_t v5 = [[MapsSuggestionsSignalPackEvaluator alloc] initWithSignalPack:v4];
    double v6 = MapsSuggestionsConfidenceDontKnow();
    if ([(MapsSuggestionsSignalPackEvaluator *)v5 hasSignalForPaymentCard])
    {
      double v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "hasSignalForPaymentCard", (uint8_t *)&v13, 2u);
      }

      double v6 = (double)[(MapsSuggestionsSignalPackEvaluator *)v5 userHasAPaymentCard];
    }
    double v8 = MapsSuggestionsConfidenceDontKnow();
    BOOL v9 = v6 > v8;
    double v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = @"NO";
      if (v6 > v8) {
        int v11 = @"YES";
      }
      int v13 = 134218242;
      id v14 = *(const char **)&v6;
      __int16 v15 = 2112;
      id v16 = v11;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "userHasAPaymentCard: %f = %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    dispatch_source_t v5 = (MapsSuggestionsSignalPackEvaluator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A70DF000, &v5->super, OS_LOG_TYPE_ERROR, "Couldn't get SignalPack. Cannot predict if userHasAPaymentCard, so we say NO", (uint8_t *)&v13, 2u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)userHasATransitCard
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    id v14 = "-[MapsSuggestionsRealInsights userHasATransitCard]";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v4 = [(MapsSuggestionsRealInsights *)self signalPackForHere];
  if (v4)
  {
    dispatch_source_t v5 = [[MapsSuggestionsSignalPackEvaluator alloc] initWithSignalPack:v4];
    double v6 = MapsSuggestionsConfidenceDontKnow();
    if ([(MapsSuggestionsSignalPackEvaluator *)v5 hasSignalForHasATransitCard])
    {
      double v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "userHasATransitCard", (uint8_t *)&v13, 2u);
      }

      double v6 = (double)[(MapsSuggestionsSignalPackEvaluator *)v5 userHasATransitCard];
    }
    double v8 = MapsSuggestionsConfidenceDontKnow();
    BOOL v9 = v6 > v8;
    double v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = @"NO";
      if (v6 > v8) {
        int v11 = @"YES";
      }
      int v13 = 134218242;
      id v14 = *(const char **)&v6;
      __int16 v15 = 2112;
      id v16 = v11;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "userHasATransitCard: %f = %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    dispatch_source_t v5 = (MapsSuggestionsSignalPackEvaluator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A70DF000, &v5->super, OS_LOG_TYPE_ERROR, "Couldn't get SignalPack. Cannot predict if userHasATransitCard, so we say NO", (uint8_t *)&v13, 2u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (char)signalPackForDestinationMapItem:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    __int16 v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      __int16 v31 = 1024;
      *(_DWORD *)v32 = 256;
      *(_WORD *)&v32[4] = 2082;
      *(void *)&v32[6] = "-[MapsSuggestionsRealInsights signalPackForDestinationMapItem:originCoordinate:handler:]";
      __int16 v33 = 2082;
      v34 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler block", buf, 0x26u);
    }
    goto LABEL_15;
  }
  if (!v9)
  {
    __int16 v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      __int16 v31 = 1024;
      *(_DWORD *)v32 = 257;
      *(_WORD *)&v32[4] = 2082;
      *(void *)&v32[6] = "-[MapsSuggestionsRealInsights signalPackForDestinationMapItem:originCoordinate:handler:]";
      __int16 v33 = 2082;
      v34 = "nil == (mapItem)";
      _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem", buf, 0x26u);
    }
LABEL_15:

    char v21 = 0;
    goto LABEL_16;
  }
  GEOFindOrCreateLog();
  int v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    __int16 v12 = [(MapsSuggestionsRealInsights *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v30 = v12;
    __int16 v31 = 2080;
    *(void *)v32 = "signalPackForDestinationMapItem";
    _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  int v13 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "signalPackForDestinationMapItem", "", buf, 2u);
  }

  GEOFindOrCreateLog();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [v9 _muid];
    *(_DWORD *)buf = 134217984;
    v30 = (const char *)v15;
    _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "Getting SignalPack for MapItem with MUID %llu", buf, 0xCu);
  }

  id v16 = [v9 data];
  uint64_t v17 = NSDataFromCLLocationCoordinate(latitude, longitude);
  objc_initWeak((id *)buf, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __88__MapsSuggestionsRealInsights_signalPackForDestinationMapItem_originCoordinate_handler___block_invoke;
  v24[3] = &unk_1E5CB8798;
  objc_copyWeak(&v28, (id *)buf);
  id v25 = v16;
  id v26 = v17;
  id v27 = v10;
  innerQueue = self->_queue._innerQueue;
  id v19 = v17;
  id v20 = v16;
  dispatch_async(innerQueue, v24);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
  char v21 = 1;
LABEL_16:

  return v21;
}

void __88__MapsSuggestionsRealInsights_signalPackForDestinationMapItem_originCoordinate_handler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 56);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsRealInsights _openConnectionIfNecessary]((uint64_t)WeakRetained);
    dispatch_source_t v5 = [v4[3] remoteObjectProxy];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __88__MapsSuggestionsRealInsights_signalPackForDestinationMapItem_originCoordinate_handler___block_invoke_95;
    v9[3] = &unk_1E5CB94A8;
    objc_copyWeak(&v11, v2);
    id v10 = *(id *)(a1 + 48);
    [v5 signalPackForDestinationMapItemData:v6 originCoordinateData:v7 handler:v9];

    -[MapsSuggestionsRealInsights _scheduleCloseConnection]((dispatch_queue_t *)v4);
    objc_destroyWeak(&v11);
  }
  else
  {
    GEOFindOrCreateLog();
    double v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v13 = "MapsSuggestionsRealInsights.mm";
      __int16 v14 = 1026;
      int v15 = 267;
      __int16 v16 = 2082;
      uint64_t v17 = "-[MapsSuggestionsRealInsights signalPackForDestinationMapItem:originCoordinate:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __88__MapsSuggestionsRealInsights_signalPackForDestinationMapItem_originCoordinate_handler___block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v19[13] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446722;
      uint64_t v17 = "MapsSuggestionsRealInsights.mm";
      __int16 v18 = 1026;
      *(_DWORD *)id v19 = 270;
      v19[2] = 2082;
      *(void *)&v19[3] = "-[MapsSuggestionsRealInsights signalPackForDestinationMapItem:originCoordinate:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v16, 0x1Cu);
    }
    double v8 = v11;
    goto LABEL_11;
  }
  if (v5 && !v6)
  {
    double v8 = +[MapsSuggestionsSignalPack signalPackFromData:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    GEOFindOrCreateLog();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [WeakRetained uniqueName];
      int v16 = 138412546;
      uint64_t v17 = v10;
      __int16 v18 = 2080;
      *(void *)id v19 = "signalPackForDestinationMapItem";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v16, 0x16u);
    }
    id v11 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v11))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "signalPackForDestinationMapItem", "", (uint8_t *)&v16, 2u);
    }
LABEL_11:

    goto LABEL_19;
  }
  __int16 v12 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v16 = 138412290;
    uint64_t v17 = v6;
    _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "Failed with error: %@", (uint8_t *)&v16, 0xCu);
  }

  GEOFindOrCreateLog();
  int v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    __int16 v14 = [WeakRetained uniqueName];
    int v16 = 138412546;
    uint64_t v17 = v14;
    __int16 v18 = 2080;
    *(void *)id v19 = "signalPackForDestinationMapItem";
    _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v16, 0x16u);
  }
  int v15 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v15))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "signalPackForDestinationMapItem", "", (uint8_t *)&v16, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_19:
}

- (char)signalPackForDestinationEntry:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    id v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v28 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      __int16 v29 = 1024;
      *(_DWORD *)v30 = 291;
      *(_WORD *)&v30[4] = 2082;
      *(void *)&v30[6] = "-[MapsSuggestionsRealInsights signalPackForDestinationEntry:originCoordinate:handler:]";
      __int16 v31 = 2082;
      v32 = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler block", buf, 0x26u);
    }
    goto LABEL_15;
  }
  if (!v9)
  {
    id v20 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v28 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      __int16 v29 = 1024;
      *(_DWORD *)v30 = 292;
      *(_WORD *)&v30[4] = 2082;
      *(void *)&v30[6] = "-[MapsSuggestionsRealInsights signalPackForDestinationEntry:originCoordinate:handler:]";
      __int16 v31 = 2082;
      v32 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", buf, 0x26u);
    }
LABEL_15:

    char v19 = 0;
    goto LABEL_16;
  }
  GEOFindOrCreateLog();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    __int16 v12 = [(MapsSuggestionsRealInsights *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    id v28 = v12;
    __int16 v29 = 2080;
    *(void *)v30 = "signalPackForDestinationEntry";
    _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  int v13 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "signalPackForDestinationEntry", "", buf, 2u);
  }

  GEOFindOrCreateLog();
  __int16 v14 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v15 = [v9 uniqueIdentifier];
    *(_DWORD *)buf = 138412290;
    id v28 = v15;
    _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_DEBUG, "Getting SignalPack for Entry %@", buf, 0xCu);
  }
  int v16 = NSDataFromCLLocationCoordinate(latitude, longitude);
  objc_initWeak((id *)buf, self);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__MapsSuggestionsRealInsights_signalPackForDestinationEntry_originCoordinate_handler___block_invoke;
  v22[3] = &unk_1E5CB8798;
  objc_copyWeak(&v26, (id *)buf);
  id v23 = v9;
  id v24 = v16;
  id v25 = v10;
  innerQueue = self->_queue._innerQueue;
  id v18 = v16;
  dispatch_async(innerQueue, v22);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
  char v19 = 1;
LABEL_16:

  return v19;
}

void __86__MapsSuggestionsRealInsights_signalPackForDestinationEntry_originCoordinate_handler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 56);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsRealInsights _openConnectionIfNecessary]((uint64_t)WeakRetained);
    id v5 = [v4[3] remoteObjectProxy];
    uint64_t v6 = [*(id *)(a1 + 32) data];
    uint64_t v7 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __86__MapsSuggestionsRealInsights_signalPackForDestinationEntry_originCoordinate_handler___block_invoke_101;
    v9[3] = &unk_1E5CB94A8;
    objc_copyWeak(&v11, v2);
    id v10 = *(id *)(a1 + 48);
    [v5 signalPackForDestinationEntryData:v6 originCoordinateData:v7 handler:v9];

    -[MapsSuggestionsRealInsights _scheduleCloseConnection]((dispatch_queue_t *)v4);
    objc_destroyWeak(&v11);
  }
  else
  {
    GEOFindOrCreateLog();
    double v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v13 = "MapsSuggestionsRealInsights.mm";
      __int16 v14 = 1026;
      int v15 = 301;
      __int16 v16 = 2082;
      uint64_t v17 = "-[MapsSuggestionsRealInsights signalPackForDestinationEntry:originCoordinate:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __86__MapsSuggestionsRealInsights_signalPackForDestinationEntry_originCoordinate_handler___block_invoke_101(uint64_t a1, void *a2, void *a3)
{
  *(void *)&v19[13] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446722;
      uint64_t v17 = "MapsSuggestionsRealInsights.mm";
      __int16 v18 = 1026;
      *(_DWORD *)char v19 = 304;
      v19[2] = 2082;
      *(void *)&v19[3] = "-[MapsSuggestionsRealInsights signalPackForDestinationEntry:originCoordinate:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v16, 0x1Cu);
    }
    double v8 = v11;
    goto LABEL_11;
  }
  if (v5 && !v6)
  {
    double v8 = +[MapsSuggestionsSignalPack signalPackFromData:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    GEOFindOrCreateLog();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [WeakRetained uniqueName];
      int v16 = 138412546;
      uint64_t v17 = v10;
      __int16 v18 = 2080;
      *(void *)char v19 = "signalPackForDestinationEntry";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v16, 0x16u);
    }
    id v11 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v11))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "signalPackForDestinationEntry", "", (uint8_t *)&v16, 2u);
    }
LABEL_11:

    goto LABEL_19;
  }
  __int16 v12 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v16 = 138412290;
    uint64_t v17 = v6;
    _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "Failed with error: %@", (uint8_t *)&v16, 0xCu);
  }

  GEOFindOrCreateLog();
  int v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    __int16 v14 = [WeakRetained uniqueName];
    int v16 = 138412546;
    uint64_t v17 = v14;
    __int16 v18 = 2080;
    *(void *)char v19 = "signalPackForDestinationEntry";
    _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v16, 0x16u);
  }
  int v15 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v15))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "signalPackForDestinationEntry", "", (uint8_t *)&v16, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_19:
}

- (id)signalPackForDestinationMapItem:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__7;
    *(void *)&buf[32] = __Block_byref_object_dispose__7;
    id v22 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __80__MapsSuggestionsRealInsights_signalPackForDestinationMapItem_originCoordinate___block_invoke;
    v18[3] = &unk_1E5CB94D0;
    id v20 = buf;
    id v9 = v8;
    char v19 = v9;
    if (-[MapsSuggestionsRealInsights signalPackForDestinationMapItem:originCoordinate:handler:](self, "signalPackForDestinationMapItem:originCoordinate:handler:", v7, v18, latitude, longitude))
    {
      GEOConfigGetDouble();
      dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
      if (dispatch_semaphore_wait(v9, v11))
      {
        __int16 v12 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v17 = 0;
          _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "Timeout on signalPackForDestinationMapItem:", v17, 2u);
        }
      }
      id v13 = *(id *)(*(void *)&buf[8] + 40);
    }
    else
    {
      int v15 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "No callback on signalPackForDestinationMapItem:", v17, 2u);
      }

      id v13 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    __int16 v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 358;
      *(_WORD *)&unsigned char buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsRealInsights signalPackForDestinationMapItem:originCoordinate:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (mapItem)";
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem", buf, 0x26u);
    }

    id v13 = 0;
  }

  return v13;
}

void __80__MapsSuggestionsRealInsights_signalPackForDestinationMapItem_originCoordinate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Error on signalPackForDestinationMapItem: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = [v5 copy];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)signalPackForDestinationEntry:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__7;
    *(void *)&buf[32] = __Block_byref_object_dispose__7;
    id v22 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __78__MapsSuggestionsRealInsights_signalPackForDestinationEntry_originCoordinate___block_invoke;
    v18[3] = &unk_1E5CB94D0;
    id v20 = buf;
    uint64_t v9 = v8;
    char v19 = v9;
    if (-[MapsSuggestionsRealInsights signalPackForDestinationEntry:originCoordinate:handler:](self, "signalPackForDestinationEntry:originCoordinate:handler:", v7, v18, latitude, longitude))
    {
      GEOConfigGetDouble();
      dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
      if (dispatch_semaphore_wait(v9, v11))
      {
        id v12 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v17 = 0;
          _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "Timeout on signalPackForDestinationEntry:", v17, 2u);
        }
      }
      id v13 = *(id *)(*(void *)&buf[8] + 40);
    }
    else
    {
      int v15 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, "No callback on signalPackForDestinationEntry:", v17, 2u);
      }

      id v13 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    __int16 v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRealInsights.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 387;
      *(_WORD *)&unsigned char buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsRealInsights signalPackForDestinationEntry:originCoordinate:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", buf, 0x26u);
    }

    id v13 = 0;
  }

  return v13;
}

void __78__MapsSuggestionsRealInsights_signalPackForDestinationEntry_originCoordinate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Error on signalPackForDestinationEntry: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = [v5 copy];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)userHasAnUpcomingTrip
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    __int16 v14 = "-[MapsSuggestionsRealInsights userHasAnUpcomingTrip]";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v4 = [(MapsSuggestionsRealInsights *)self signalPackForHere];
  if (v4)
  {
    id v5 = [[MapsSuggestionsSignalPackEvaluator alloc] initWithSignalPack:v4];
    double v6 = MapsSuggestionsConfidenceDontKnow();
    if ([(MapsSuggestionsSignalPackEvaluator *)v5 hasSignalForUpcomingTrip])
    {
      id v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "MSg has a signal for upcoming trip.", (uint8_t *)&v13, 2u);
      }

      double v6 = (double)[(MapsSuggestionsSignalPackEvaluator *)v5 userHasAnUpcomingTrip];
    }
    double v8 = MapsSuggestionsConfidenceDontKnow();
    BOOL v9 = v6 > v8;
    double v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = @"NO";
      if (v6 > v8) {
        int v11 = @"YES";
      }
      int v13 = 134218242;
      __int16 v14 = *(const char **)&v6;
      __int16 v15 = 2112;
      int v16 = v11;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "userHasAnUpcomingTrip: %f = %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v5 = (MapsSuggestionsSignalPackEvaluator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A70DF000, &v5->super, OS_LOG_TYPE_ERROR, "Couldn't get SignalPack. Cannot predict if userHasAnUpcomingTrip, so we say NO", (uint8_t *)&v13, 2u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)userIsCurrentlyInATrip
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    __int16 v14 = "-[MapsSuggestionsRealInsights userIsCurrentlyInATrip]";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v4 = [(MapsSuggestionsRealInsights *)self signalPackForHere];
  if (v4)
  {
    id v5 = [[MapsSuggestionsSignalPackEvaluator alloc] initWithSignalPack:v4];
    double v6 = MapsSuggestionsConfidenceDontKnow();
    if ([(MapsSuggestionsSignalPackEvaluator *)v5 hasSignalForIsCurrentlyInATrip])
    {
      id v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "MSg has a signal for a current trip.", (uint8_t *)&v13, 2u);
      }

      double v6 = (double)[(MapsSuggestionsSignalPackEvaluator *)v5 userIsCurrentlyInATrip];
    }
    double v8 = MapsSuggestionsConfidenceDontKnow();
    BOOL v9 = v6 > v8;
    double v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = @"NO";
      if (v6 > v8) {
        int v11 = @"YES";
      }
      int v13 = 134218242;
      __int16 v14 = *(const char **)&v6;
      __int16 v15 = 2112;
      int v16 = v11;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "userIsCurrenltyInATrip: %f = %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v5 = (MapsSuggestionsSignalPackEvaluator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A70DF000, &v5->super, OS_LOG_TYPE_ERROR, "Couldn't get SignalPack. Cannot predict if userIsCurrentlyInATrip, so we say NO", (uint8_t *)&v13, 2u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (char)currentTripWithHandler:(id)a3
{
  return [(MapsSuggestionsPortrait *)self->_portrait currentTripsWithHandler:a3];
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

void __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_161;
    block[3] = &unk_1E5CB7E78;
    objc_copyWeak(&v5, v1);
    dispatch_async(WeakRetained[1], block);
    objc_destroyWeak(&v5);
  }
  else
  {
    GEOFindOrCreateLog();
    objc_super v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v7 = "MapsSuggestionsRealInsights.mm";
      __int16 v8 = 1026;
      int v9 = 549;
      __int16 v10 = 2082;
      int v11 = "-[MapsSuggestionsRealInsights _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_161(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_super v3 = (char *)WeakRetained[3];
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "XPC connection {%@} became invalid", (uint8_t *)&v6, 0xCu);
    }

    id v4 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    -[MapsSuggestionsRealInsights _unscheduleCloseConnection]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsRealInsights.mm";
      __int16 v8 = 1026;
      int v9 = 551;
      __int16 v10 = 2082;
      int v11 = "-[MapsSuggestionsRealInsights _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_162(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_163;
    block[3] = &unk_1E5CB7E78;
    objc_copyWeak(&v5, v1);
    dispatch_async(WeakRetained[1], block);
    objc_destroyWeak(&v5);
  }
  else
  {
    GEOFindOrCreateLog();
    objc_super v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v7 = "MapsSuggestionsRealInsights.mm";
      __int16 v8 = 1026;
      int v9 = 559;
      __int16 v10 = 2082;
      int v11 = "-[MapsSuggestionsRealInsights _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_163(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_super v3 = (char *)WeakRetained[3];
      int v5 = 138412290;
      int v6 = v3;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_DEBUG, "XPC connection {%@} got interrupted", (uint8_t *)&v5, 0xCu);
    }

    -[MapsSuggestionsRealInsights _closeConnection](WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      int v6 = "MapsSuggestionsRealInsights.mm";
      __int16 v7 = 1026;
      int v8 = 561;
      __int16 v9 = 2082;
      __int16 v10 = "-[MapsSuggestionsRealInsights _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_164(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_165;
    v7[3] = &unk_1E5CB85B8;
    objc_copyWeak(&v9, v4);
    id v8 = v3;
    dispatch_async(WeakRetained[1], v7);

    objc_destroyWeak(&v9);
  }
  else
  {
    GEOFindOrCreateLog();
    int v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v11 = "MapsSuggestionsRealInsights.mm";
      __int16 v12 = 1026;
      int v13 = 568;
      __int16 v14 = 2082;
      __int16 v15 = "-[MapsSuggestionsRealInsights _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __57__MapsSuggestionsRealInsights__openConnectionIfNecessary__block_invoke_165(uint64_t a1)
{
  *(void *)&v10[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = (char *)WeakRetained[3];
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138412546;
      id v8 = v4;
      __int16 v9 = 2112;
      *(void *)__int16 v10 = v5;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "XPC connection {%@} got error: %@", (uint8_t *)&v7, 0x16u);
    }

    -[MapsSuggestionsRealInsights _closeConnection](WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    int v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      id v8 = "MapsSuggestionsRealInsights.mm";
      __int16 v9 = 1026;
      *(_DWORD *)__int16 v10 = 570;
      v10[2] = 2082;
      *(void *)&v10[3] = "-[MapsSuggestionsRealInsights _openConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void __57__MapsSuggestionsRealInsights__initCloseTimerIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsRealInsights _closeConnection](WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      uint64_t v5 = "MapsSuggestionsRealInsights.mm";
      __int16 v6 = 1026;
      int v7 = 623;
      __int16 v8 = 2082;
      __int16 v9 = "-[MapsSuggestionsRealInsights _initCloseTimerIfNecessary]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)setInsightUpdatesDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_insightUpdatesDelegate);
  objc_storeStrong((id *)&self->_portrait, 0);
  objc_storeStrong((id *)&self->_closeTimer, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  innerQueue = self->_queue._innerQueue;
}

@end