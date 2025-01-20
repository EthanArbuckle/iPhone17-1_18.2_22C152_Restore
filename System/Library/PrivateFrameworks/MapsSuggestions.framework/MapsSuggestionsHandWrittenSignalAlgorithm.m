@interface MapsSuggestionsHandWrittenSignalAlgorithm
- (BOOL)transportModesForSignalPack:(id)a3 handler:(id)a4;
- (NSString)uniqueName;
@end

@implementation MapsSuggestionsHandWrittenSignalAlgorithm

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (BOOL)transportModesForSignalPack:(id)a3 handler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *, void))a4;
  if (v6)
  {
    v7 = [objc_alloc((Class)MapsSuggestionsSignalPackEvaluator) initWithSignalPack:v5];
    if ([v7 hasUserTransportTypePreferenceInfo]
      && ([v7 isUserPreferenceDriving] & 1) == 0)
    {
      if ([v7 isUserPreferenceWalking])
      {
        uint64_t v8 = 2;
        goto LABEL_5;
      }
      if ([v7 isUserPreferenceTransit])
      {
        uint64_t v8 = 1;
        goto LABEL_5;
      }
      if ([v7 isUserPreferenceRidesharing])
      {
        uint64_t v8 = 6;
        goto LABEL_5;
      }
    }
    uint64_t v8 = 0;
LABEL_5:

    if ([v7 hasCarPlayInfo]
      && ([v7 isCarPlayConnected] & 1) != 0)
    {
      goto LABEL_58;
    }
    if ([v7 hasMapTypeInfo]
      && [v7 isMapTypeTransit])
    {
      v9 = v7;
      v10 = v9;
      if (v9)
      {
        if ([v9 hasDistanceFromHereToDestinationInfo])
        {
          unsigned __int8 v11 = [v10 isEasilyWalkable];

          if ((v11 & 1) == 0) {
            goto LABEL_32;
          }
LABEL_23:
          uint64_t v8 = 2;
LABEL_59:
          v22 = +[NSNumber numberWithInt:v8];
          v25 = v22;
          v23 = +[NSArray arrayWithObjects:&v25 count:1];
          v6[2](v6, v23, 0);

          goto LABEL_60;
        }
      }
      else
      {
        v15 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136446978;
          v27 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHandWrittenSignalAlgorithm.m";
          __int16 v28 = 1024;
          int v29 = 50;
          __int16 v30 = 2082;
          v31 = "BOOL _isDistanceWithinLowerWalkingThreshold(MapsSuggestionsSignalPackEvaluator *__strong)";
          __int16 v32 = 2082;
          v33 = "nil == (evaluator)";
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal pack evaluator", buf, 0x26u);
        }
      }
LABEL_32:
      if ([v10 hasTransitInfo]
        && ([v10 isTransitCurrentlyPossible] & 1) != 0)
      {
        uint64_t v8 = 1;
        goto LABEL_59;
      }
      if ([v10 hasRidesharingInfo]
        && ([v10 isRideSharingAppsInstalled] & 1) != 0)
      {
        uint64_t v8 = 6;
        goto LABEL_59;
      }
      v16 = v10;
      v13 = v16;
      if (v10)
      {
        if ([v16 hasDistanceFromHereToDestinationInfo])
        {
          unsigned int v17 = [v13 isWalkable];

          if (v17) {
            uint64_t v8 = 2;
          }
          else {
            uint64_t v8 = 0;
          }
          goto LABEL_59;
        }
        goto LABEL_57;
      }
      v19 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        goto LABEL_56;
      }
LABEL_55:
      *(_DWORD *)buf = 136446978;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHandWrittenSignalAlgorithm.m";
      __int16 v28 = 1024;
      int v29 = 44;
      __int16 v30 = 2082;
      v31 = "BOOL _isDistanceWithinHigherWalkingThreshold(MapsSuggestionsSignalPackEvaluator *__strong)";
      __int16 v32 = 2082;
      v33 = "nil == (evaluator)";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal pack evaluator", buf, 0x26u);
LABEL_56:

LABEL_57:
LABEL_58:
      uint64_t v8 = 0;
      goto LABEL_59;
    }
    if (![v7 hasUserTransportTypePreferenceInfo]
      || ([v7 isUserPreferenceDriving] & 1) == 0
      && ![v7 isUserPreferenceWalking])
    {
      goto LABEL_59;
    }
    if ([v7 hasWeatherInfo]
      && ([v7 isBadWeather] & 1) != 0)
    {
      goto LABEL_58;
    }
    v12 = v7;
    v13 = v12;
    if (!v12)
    {
      v18 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136446978;
        v27 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHandWrittenSignalAlgorithm.m";
        __int16 v28 = 1024;
        int v29 = 50;
        __int16 v30 = 2082;
        v31 = "BOOL _isDistanceWithinLowerWalkingThreshold(MapsSuggestionsSignalPackEvaluator *__strong)";
        __int16 v32 = 2082;
        v33 = "nil == (evaluator)";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal pack evaluator", buf, 0x26u);
      }

      v19 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        goto LABEL_56;
      }
      goto LABEL_55;
    }
    if ([v12 hasDistanceFromHereToDestinationInfo])
    {
      unsigned __int8 v14 = [v13 isEasilyWalkable];

      if (v14) {
        goto LABEL_23;
      }
    }
    else
    {
    }
    v20 = v13;
    if ([v20 hasDistanceFromHereToDestinationInfo])
    {
      unsigned int v21 = [v20 isWalkable];

      if (v21) {
        uint64_t v8 = v8;
      }
      else {
        uint64_t v8 = 0;
      }
      goto LABEL_59;
    }
    goto LABEL_57;
  }
  v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446978;
    v27 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHandWrittenSignalAlgorithm.m";
    __int16 v28 = 1024;
    int v29 = 57;
    __int16 v30 = 2082;
    v31 = "-[MapsSuggestionsHandWrittenSignalAlgorithm transportModesForSignalPack:handler:]";
    __int16 v32 = 2082;
    v33 = "nil == (handler)";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler", buf, 0x26u);
  }
LABEL_60:

  return v6 != 0;
}

@end