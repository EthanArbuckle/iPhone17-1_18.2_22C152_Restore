@interface MapsSuggestionsDefaultTitleFormatter
- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4;
@end

@implementation MapsSuggestionsDefaultTitleFormatter

- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      v9 = [v6 title];
      id v10 = v6;
      id v11 = v8;
      v12 = v11;
      if (!self)
      {
        v21 = 0;
        goto LABEL_38;
      }
      [v11 seconds];
      v14 = NSStringFromMapsSuggestionsShortETA(v13);
      v15 = [v10 undecoratedSubtitle];
      if ([v14 length]
        && [(MapsSuggestionsEventETATitleFormatter *)self shouldDecorateEntry:v10 withETA:v12])
      {
        v16 = [v10 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
        if (([v10 BOOLeanForKey:@"MapsSuggestionsCalendarAllDayEventKey" is:1] & 1) != 0
          || MapsSuggestionsIsInThePast(v16))
        {
          v32 = v9;
          v17 = MapsSuggestionsLocalizedStringFromGEOTransportType([v12 transportType]);
          MapsSuggestionsLocalizedETAFormatString(v14, v17);
          v18 = (char *)objc_claimAutoreleasedReturnValue();

          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
          }
          v19 = v16;
          if (s_verbose)
          {
            v20 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v18;
              _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_DEBUG, "Subtitle from decoration: %@", buf, 0xCu);
            }
          }
          v21 = v18;
          v9 = v32;
LABEL_15:

LABEL_37:
LABEL_38:

          char v24 = -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v10, v9, v21, 0);
          goto LABEL_39;
        }
        if (v16)
        {
          v33 = v16;
          v25 = NSStringFromMapsSuggestionsEventTime(v16);
          v26 = MapsSuggestionsLocalizedStringFromGEOTransportType([v12 transportType]);
          v31 = v25;
          MapsSuggestionsLocalizedETAFormatStringWithTime(v25, v14, v26);
          v27 = (char *)objc_claimAutoreleasedReturnValue();

          if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
            dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
          }
          v19 = v33;
          if (s_verbose)
          {
            v28 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v27;
              _os_log_impl(&dword_1A70DF000, v28, OS_LOG_TYPE_DEBUG, "Subtitle from decoration: %@", buf, 0xCu);
            }
          }
          v21 = v27;

          goto LABEL_15;
        }
      }
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      }
      if (s_verbose)
      {
        v29 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v35 = (const char *)v15;
          _os_log_impl(&dword_1A70DF000, v29, OS_LOG_TYPE_DEBUG, "Subtitle from decoration: %@", buf, 0xCu);
        }
      }
      v21 = v15;
      goto LABEL_37;
    }
    v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v35 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDefaultTitleFormatter.m";
      __int16 v36 = 1024;
      int v37 = 25;
      __int16 v38 = 2082;
      v39 = "-[MapsSuggestionsDefaultTitleFormatter formatTitlesForEntry:eta:]";
      __int16 v40 = 2082;
      v41 = "nil == (eta)";
      v23 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
      goto LABEL_20;
    }
  }
  else
  {
    v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v35 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDefaultTitleFormatter.m";
      __int16 v36 = 1024;
      int v37 = 24;
      __int16 v38 = 2082;
      v39 = "-[MapsSuggestionsDefaultTitleFormatter formatTitlesForEntry:eta:]";
      __int16 v40 = 2082;
      v41 = "nil == (entry)";
      v23 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_20:
      _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x26u);
    }
  }

  char v24 = 0;
LABEL_39:

  return v24;
}

@end