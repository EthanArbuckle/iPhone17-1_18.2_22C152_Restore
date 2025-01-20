@interface NavdAvocadoUpdater
- (NSString)uniqueName;
- (id)_hashForEntries:(id)a3;
- (id)initFromResourceDepot:(id)a3 sharedRegister:(id)a4;
- (void)_logStateForStep:(id)a3;
- (void)_logStateForStep:(id)a3 stopReason:(id)a4;
- (void)_reloadTimelineWithReason:(id)a3;
- (void)engineRunner:(id)a3 startedBecauseOfTrigger:(id)a4;
- (void)engineRunner:(id)a3 step:(id)a4 jsonDict:(id)a5;
- (void)engineRunner:(id)a3 stoppedWithEntries:(id)a4;
- (void)triggerFired:(id)a3;
@end

@implementation NavdAvocadoUpdater

- (id)initFromResourceDepot:(id)a3 sharedRegister:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v68 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v72 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/AvocadoUpdater/NavdAvocadoUpdater.mm";
      __int16 v73 = 1024;
      int v74 = 120;
      __int16 v75 = 2082;
      v76 = "-[NavdAvocadoUpdater initFromResourceDepot:sharedRegister:]";
      __int16 v77 = 2082;
      v78 = "nil == (resourceDepot)";
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot", buf, 0x26u);
    }
    goto LABEL_13;
  }
  if ((GEOConfigGetBOOL() & 1) == 0)
  {
    v68 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEBUG, "NavdAvocadoUpdater is Disabled", buf, 2u);
    }
LABEL_13:

    v67 = 0;
    goto LABEL_14;
  }
  v70.receiver = self;
  v70.super_class = (Class)NavdAvocadoUpdater;
  v8 = [(NavdAvocadoUpdater *)&v70 init];
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    previousEntryHashes = v8->_previousEntryHashes;
    v8->_previousEntryHashes = (NSArray *)&__NSArray0__struct;

    id v11 = objc_alloc_init((Class)MapsSuggestionsShortcutFilter);
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, 0);

    v13 = +[MapsSuggestionsEngineBuilder forDevice];
    v14 = +[MapsSuggestionsNavdMapsAppLocationManager sharedLocationManager];
    v15 = [v13 withLocationUpdater:v14];
    v16 = [v15 withPreFilters:v12];
    v17 = [v16 withoutTracker];

    id v18 = objc_alloc((Class)MapsSuggestionsEngineRunner);
    GEOConfigGetDouble();
    double v20 = v19;
    GEOConfigGetDouble();
    double v22 = v21;
    GEOConfigGetDouble();
    double v24 = v23;
    GEOConfigGetDouble();
    double v26 = v25;
    GEOConfigGetDouble();
    double v28 = v27;
    GEOConfigGetDouble();
    id v30 = [v18 initWithEngineBuilder:v17 name:@"NavdAvocadoUpdaterRunner" minRunTime:GEOConfigGetInteger() maxRunTime:1 minSleepTime:v20 maxSleepTime:v22 runTimeLeeway:v24 sleepTimeLeeway:v26 maxEntries:v28 nilledWhenAsleep:v29];
    id v31 = p_isa[1];
    p_isa[1] = v30;

    [p_isa[1] registerObserver:p_isa];
    id v32 = p_isa[1];
    v33 = +[MapsSuggestionsDestinationdTrigger description];
    v34 = [v7 objectForKeyedSubscript:v33];
    [v32 addTrigger:v34];

    id v35 = p_isa[1];
    v36 = +[MapsSuggestionsSiri isEnabledCondition];
    v37 = [v36 uniqueName];
    v38 = [v7 objectForKeyedSubscript:v37];
    [v35 addCondition:v38];

    id v39 = [objc_alloc((Class)MapsSuggestionsBlockFilter) initWithBlock:&stru_100089478];
    [p_isa[1] addPostFilter:v39];
    id v40 = p_isa[1];
    v41 = +[MapsSuggestionsMapsInstalledTriggeringToggle description];
    v42 = [v7 objectForKeyedSubscript:v41];
    [v40 addTrigger:v42];

    id v43 = p_isa[1];
    v44 = +[MapsSuggestionsMapsInstalledTriggeringToggle description];
    v45 = [v7 objectForKeyedSubscript:v44];
    [v43 addCondition:v45];

    id v46 = p_isa[1];
    v47 = +[MapsSuggestionsFirstUnlockTrigger description];
    v48 = [v7 objectForKeyedSubscript:v47];
    [v46 addTrigger:v48];

    id v49 = p_isa[1];
    v50 = +[MapsSuggestionsFirstUnlockTrigger description];
    v51 = [v7 objectForKeyedSubscript:v50];
    [v49 addCondition:v51];

    id v52 = p_isa[1];
    v53 = +[MapsSuggestionsBluetoothVehicleConnectionTrigger description];
    v54 = [v7 objectForKeyedSubscript:v53];
    [v52 addTrigger:v54];

    id v55 = p_isa[1];
    v56 = +[MapsSuggestionsEventKitChangedTrigger description];
    v57 = [v7 objectForKeyedSubscript:v56];
    [v55 addTrigger:v57];

    id v58 = p_isa[1];
    v59 = +[MapsSuggestionsPreferredTransportTypeTrigger description];
    v60 = [v7 objectForKeyedSubscript:v59];
    [v58 addTrigger:v60];

    id v61 = p_isa[1];
    v62 = +[MapsSuggestionsUserDeletedSuggestionTrigger description];
    v63 = [v7 objectForKeyedSubscript:v62];
    [v61 addTrigger:v63];

    v64 = objc_alloc_init(NavdAvocadoNavigationSessionTrigger);
    id v65 = p_isa[3];
    p_isa[3] = v64;

    [p_isa[3] registerObserver:p_isa];
    [p_isa[1] addTrigger:p_isa[3]];
    [p_isa[1] addCondition:p_isa[3]];
    [p_isa[1] runASAP];
    v66 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "initialized", buf, 2u);
    }

    [p_isa _logStateForStep:@"featureInitialized"];
  }
  self = p_isa;
  v67 = self;
LABEL_14:

  return v67;
}

- (void)_reloadTimelineWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)CHSTimelineController) initWithExtensionBundleIdentifier:@"com.apple.Maps.GeneralMapsWidget" kind:@"com.apple.Maps"];
  id v6 = [v5 reloadTimelineWithReason:v4];
  if (v6)
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "NavdAvocadoUpdater: could not reload timeline: %{public}@", buf, 0xCu);
    }

    id v8 = [objc_alloc((Class)NSString) initWithFormat:@"Could not reload Timeline: %@", v6];
    [(NavdAvocadoUpdater *)self _logStateForStep:@"errorReloadingTimeline" stopReason:v8];
  }
}

- (id)_hashForEntries:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      id v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/AvocadoUpdater/NavdAvocadoUpdater.mm";
      __int16 v12 = 1024;
      int v13 = 211;
      __int16 v14 = 2082;
      v15 = "-[NavdAvocadoUpdater _hashForEntries:]";
      __int16 v16 = 2082;
      v17 = "nil == (entries)";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires zero or more Entries. @[] is ok.", buf, 0x26u);
    }
    id v6 = 0;
    goto LABEL_7;
  }
  if ([v3 count])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100013418;
    v8[3] = &unk_1000894A0;
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
    v9 = v5;
    [v4 enumerateObjectsUsingBlock:v8];
    id v6 = [v5 copy];

LABEL_7:
    goto LABEL_9;
  }
  id v6 = &__NSArray0__struct;
LABEL_9:

  return v6;
}

- (void)engineRunner:(id)a3 stoppedWithEntries:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = self;
    objc_sync_enter(v8);
    v9 = [(NavdAvocadoUpdater *)v8 _hashForEntries:v7];
    unsigned int v10 = [v9 isEqualToArray:v8->_previousEntryHashes];
    char v11 = v10;
    if (v10)
    {
      [(NavdAvocadoUpdater *)v8 _logStateForStep:@"noChangeInEntries"];
    }
    else
    {
      int v13 = (NSArray *)[v9 copy];
      previousEntryHashes = v8->_previousEntryHashes;
      v8->_previousEntryHashes = v13;

      v15 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 138412290;
        id v18 = (const char *)v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Change detected! New hashes: %@", (uint8_t *)&v17, 0xCu);
      }
    }
    objc_sync_exit(v8);

    if ((v11 & 1) == 0)
    {
      [(NavdAvocadoUpdater *)v8 _logStateForStep:@"willUpdateAvocado"];
      __int16 v16 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "NavdAvocadoUpdater: will reload timeline for MapsSuggestions change", (uint8_t *)&v17, 2u);
      }

      [(NavdAvocadoUpdater *)v8 _reloadTimelineWithReason:@"Change detected in MSg Entries"];
      [(NavdAvocadoUpdater *)v8 _logStateForStep:@"didUpdateAvocado"];
    }
  }
  else
  {
    __int16 v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136446978;
      id v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/AvocadoUpdater/NavdAvocadoUpdater.mm";
      __int16 v19 = 1024;
      int v20 = 228;
      __int16 v21 = 2082;
      double v22 = "-[NavdAvocadoUpdater engineRunner:stoppedWithEntries:]";
      __int16 v23 = 2082;
      double v24 = "nil == (entries)";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires zero or more Entries. @[] is ok.", (uint8_t *)&v17, 0x26u);
    }
  }
}

- (void)engineRunner:(id)a3 startedBecauseOfTrigger:(id)a4
{
  id v5 = a4;
  GEOFindOrCreateLog();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [v5 uniqueName];
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Triggered by %@", (uint8_t *)&v8, 0xCu);
  }
  [(NavdAvocadoUpdater *)self _logStateForStep:@"didStart" stopReason:0];
}

- (void)engineRunner:(id)a3 step:(id)a4 jsonDict:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  int v8 = self;
  objc_sync_enter(v8);
  v9 = (NSDictionary *)[v7 copy];
  lastEngineRunnerState = v8->_lastEngineRunnerState;
  v8->_lastEngineRunnerState = v9;

  objc_sync_exit(v8);
  [(NavdAvocadoUpdater *)v8 _logStateForStep:v11];
}

- (void)triggerFired:(id)a3
{
  if (self->_navSessionTrigger == a3)
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "NavdAvocadoUpdater: will reload timeline for Navigation state change", v5, 2u);
    }

    [(NavdAvocadoUpdater *)self _reloadTimelineWithReason:@"Navigation state change"];
  }
}

- (void)_logStateForStep:(id)a3
{
}

- (void)_logStateForStep:(id)a3 stopReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = self;
  objc_sync_enter(v8);
  v17[0] = @"step";
  v9 = MSg::jsonFor();
  v18[0] = v9;
  v17[1] = @"stopReason";
  unsigned int v10 = MSg::jsonFor();
  v18[1] = v10;
  v17[2] = @"engineRunner";
  id v11 = MSg::jsonFor();
  v18[2] = v11;
  __int16 v12 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

  GEOFindOrCreateLog();
  int v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    __int16 v14 = NSStringFromMapsSuggestionsJSON();
    int v15 = 138412290;
    __int16 v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "EVAL{AvocadoUpdater}=%@", (uint8_t *)&v15, 0xCu);
  }
  objc_sync_exit(v8);
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousEntryHashes, 0);
  objc_storeStrong((id *)&self->_navSessionTrigger, 0);
  objc_storeStrong((id *)&self->_lastEngineRunnerState, 0);

  objc_storeStrong((id *)&self->_engineRunner, 0);
}

@end