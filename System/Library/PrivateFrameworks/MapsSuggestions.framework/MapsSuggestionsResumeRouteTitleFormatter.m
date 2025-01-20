@interface MapsSuggestionsResumeRouteTitleFormatter
- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4 requiredChargeLevel:(id)a5 currentChargeLevel:(id)a6;
@end

@implementation MapsSuggestionsResumeRouteTitleFormatter

- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4 requiredChargeLevel:(id)a5 currentChargeLevel:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    v15 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    int v33 = 136446978;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteTitleFormatter.m";
    __int16 v35 = 1024;
    int v36 = 24;
    __int16 v37 = 2082;
    v38 = "-[MapsSuggestionsResumeRouteTitleFormatter formatTitlesForEntry:eta:requiredChargeLevel:currentChargeLevel:]";
    __int16 v39 = 2082;
    v40 = "nil == (entry)";
    v26 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_19:
    _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v33, 0x26u);
    goto LABEL_20;
  }
  if (!v11)
  {
    v15 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    int v33 = 136446978;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteTitleFormatter.m";
    __int16 v35 = 1024;
    int v36 = 25;
    __int16 v37 = 2082;
    v38 = "-[MapsSuggestionsResumeRouteTitleFormatter formatTitlesForEntry:eta:requiredChargeLevel:currentChargeLevel:]";
    __int16 v39 = 2082;
    v40 = "nil == (eta)";
    v26 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
    goto LABEL_19;
  }
  if ([v10 type] != 11)
  {
    v15 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    int v33 = 136446978;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteTitleFormatter.m";
    __int16 v35 = 1024;
    int v36 = 26;
    __int16 v37 = 2082;
    v38 = "-[MapsSuggestionsResumeRouteTitleFormatter formatTitlesForEntry:eta:requiredChargeLevel:currentChargeLevel:]";
    __int16 v39 = 2082;
    v40 = "MapsSuggestionsEntryTypeResumeRoute != entry.type";
    v26 = "At %{public}s:%d, %{public}s forbids: %{public}s. Needs to be a Resume Route";
    goto LABEL_19;
  }
  uint64_t v14 = [v10 stringForKey:@"MapsSuggestionsResumeRouteDefaultTitle"];
  if (v14)
  {
    v15 = v14;
    [v12 doubleValue];
    double v17 = v16;
    [v13 doubleValue];
    double v19 = v18;
    char v20 = [v10 BOOLeanForKey:@"MapsSuggestionsIsResumingAnEVRoute" is:0];
    if (v13
      && v12
      && (v20 & 1) == 0
      && (![v10 BOOLeanForKey:@"MapsSuggestionsIsResumingAnEVRoute" is:1]
       || (v22 = v19 * 100.0, double v21 = v17 * 100.0, v19 * 100.0 < v17 * 100.0)))
    {
      objc_msgSend(v10, "setBoolean:forKey:", 0, @"MapsSuggestionsHasEnoughChargeKey", v21, v22);
      v23 = [v10 stringForKey:@"MapsSuggestionsResumeRouteTitleWhenCharging"];
      v29 = [v10 stringForKey:@"MapsSuggestionsResumeRouteSubtitleWhenCharging"];
      if (v23)
      {
        v30 = GEOFindOrCreateLog();
        v31 = v30;
        if (v29)
        {
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            int v33 = 138412290;
            v34 = (const char *)v13;
            _os_log_impl(&dword_1A70DF000, v31, OS_LOG_TYPE_INFO, "Setting titles for EV ResumeRoute entry because the vehicle is still charging at %@", (uint8_t *)&v33, 0xCu);
          }

          char v25 = 1;
          if (-[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v10, v23, v29, 1))goto LABEL_39; {
          [v10 setTitle:v23];
          }
        }
        else
        {
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            int v33 = 136446978;
            v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteTitleFormatter.m";
            __int16 v35 = 1024;
            int v36 = 69;
            __int16 v37 = 2082;
            v38 = "-[MapsSuggestionsResumeRouteTitleFormatter formatTitlesForEntry:eta:requiredChargeLevel:currentChargeLevel:]";
            __int16 v39 = 2082;
            v40 = "nil == (chargingSubtitle)";
            _os_log_impl(&dword_1A70DF000, v31, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. EV Resume Route requires a subtitle when charging", (uint8_t *)&v33, 0x26u);
          }
        }
      }
      else
      {
        v32 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          int v33 = 136446978;
          v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteTitleFormatter.m";
          __int16 v35 = 1024;
          int v36 = 68;
          __int16 v37 = 2082;
          v38 = "-[MapsSuggestionsResumeRouteTitleFormatter formatTitlesForEntry:eta:requiredChargeLevel:currentChargeLevel:]";
          __int16 v39 = 2082;
          v40 = "nil == (chargingTitle)";
          _os_log_impl(&dword_1A70DF000, v32, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. EV Resume Route requires a title when charging", (uint8_t *)&v33, 0x26u);
        }
      }
      char v25 = 0;
    }
    else
    {
      [v10 setBoolean:1 forKey:@"MapsSuggestionsHasEnoughChargeKey"];
      v23 = [v10 routeRequestStorageForKey:@"MapsSuggestionsResumeRouteRouteRequestStorage"];
      if (v23)
      {
        unint64_t v24 = [v10 uint64ForKey:@"MapsSuggestionsResumeRouteWaypointIndex"] + 1;
        if (v24 < [v23 waypointsCount])
        {
          char v25 = 0;
LABEL_40:

          goto LABEL_21;
        }
      }
      v29 = [v11 trafficString];
      char v25 = -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v10, v15, v29, 1);
    }
LABEL_39:

    goto LABEL_40;
  }
  v28 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    int v33 = 136446978;
    v34 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteTitleFormatter.m";
    __int16 v35 = 1024;
    int v36 = 29;
    __int16 v37 = 2082;
    v38 = "-[MapsSuggestionsResumeRouteTitleFormatter formatTitlesForEntry:eta:requiredChargeLevel:currentChargeLevel:]";
    __int16 v39 = 2082;
    v40 = "nil == (defaultTitle)";
    _os_log_impl(&dword_1A70DF000, v28, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Resume Route requires a default title", (uint8_t *)&v33, 0x26u);
  }

  v15 = 0;
LABEL_20:
  char v25 = 0;
LABEL_21:

  return v25;
}

@end