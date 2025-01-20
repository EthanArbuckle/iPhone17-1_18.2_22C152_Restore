@interface MapsSuggestionsShortcutTitleFormatter
- (BOOL)formatTitlesForEntry:(id)a3 distance:(double)a4 trafficString:(id)a5;
- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4;
@end

@implementation MapsSuggestionsShortcutTitleFormatter

- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      [v7 seconds];
      double v10 = v9;
      GEOConfigGetDouble();
      double v12 = v11;
      *(void *)v25 = 0;
      if (MapsSuggestionsDistanceFromHereToEntry(v6, v25) && (double v13 = *(double *)v25, GEOConfigGetDouble(), v13 < v14))
      {
        [v6 setBoolean:1 forKey:@"MapsSuggestionsAlreadyThereKey"];
      }
      else
      {
        [v6 setBoolean:v10 < v12 forKey:@"MapsSuggestionsAlreadyThereKey"];
        if (v10 >= v12)
        {
          [v8 seconds];
          double v20 = v19;
          [v8 seconds];
          if (v20 >= 3600.0) {
            NSStringFromMapsSuggestionsAbbreviatedETA(v21);
          }
          else {
            NSStringFromMapsSuggestionsShortETA(v21);
          }
          id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
          v22 = v17;
          v23 = [v6 undecoratedTitle];
          BOOL v18 = 1;
          -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v6, v23, v22, 1);

          goto LABEL_21;
        }
      }
      if (qword_1EB6F0160 != -1) {
        dispatch_once(&qword_1EB6F0160, &__block_literal_global_5);
      }
      id v17 = (id)_MergedGlobals_30;
      goto LABEL_20;
    }
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 136446978;
      *(void *)&v25[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutTitleFormatter.m";
      __int16 v26 = 1024;
      int v27 = 35;
      __int16 v28 = 2082;
      v29 = "-[MapsSuggestionsShortcutTitleFormatter formatTitlesForEntry:eta:]";
      __int16 v30 = 2082;
      v31 = "nil == (eta)";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
      goto LABEL_14;
    }
  }
  else
  {
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 136446978;
      *(void *)&v25[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutTitleFormatter.m";
      __int16 v26 = 1024;
      int v27 = 34;
      __int16 v28 = 2082;
      v29 = "-[MapsSuggestionsShortcutTitleFormatter formatTitlesForEntry:eta:]";
      __int16 v30 = 2082;
      v31 = "nil == (entry)";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry";
LABEL_14:
      _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, v16, v25, 0x26u);
    }
  }

  BOOL v18 = 0;
LABEL_21:

  return v18;
}

- (BOOL)formatTitlesForEntry:(id)a3 distance:(double)a4 trafficString:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    GEOConfigGetDouble();
    double v9 = v8;
    [v7 setBoolean:v8 > a4 forKey:@"MapsSuggestionsAlreadyThereKey"];
    if (v9 <= a4)
    {
      MapsSuggestionsDistanceString();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (qword_1EB6F0160 != -1) {
        dispatch_once(&qword_1EB6F0160, &__block_literal_global_5);
      }
      id v10 = (id)_MergedGlobals_30;
    }
    double v12 = v10;
    double v13 = [v7 undecoratedTitle];
    -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v7, v13, v12, 1);
  }
  else
  {
    double v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutTitleFormatter.m";
      __int16 v17 = 1024;
      int v18 = 71;
      __int16 v19 = 2082;
      double v20 = "-[MapsSuggestionsShortcutTitleFormatter formatTitlesForEntry:distance:trafficString:]";
      __int16 v21 = 2082;
      v22 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", (uint8_t *)&v15, 0x26u);
    }
  }
  return v7 != 0;
}

@end