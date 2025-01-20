@interface MapsSuggestionsEventETATitleFormatter
- (BOOL)shouldDecorateEntry:(id)a3 withETA:(id)a4;
@end

@implementation MapsSuggestionsEventETATitleFormatter

- (BOOL)shouldDecorateEntry:(id)a3 withETA:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v9 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v27 = 136446978;
    double v28 = COERCE_DOUBLE("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventETATitleFormatter.m");
    __int16 v29 = 1024;
    *(_DWORD *)v30 = 18;
    *(_WORD *)&v30[4] = 2082;
    *(void *)&v30[6] = "-[MapsSuggestionsEventETATitleFormatter shouldDecorateEntry:withETA:]";
    *(_WORD *)&v30[14] = 2082;
    *(void *)&v30[16] = "nil == (entry)";
    v24 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_18:
    _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v27, 0x26u);
    goto LABEL_19;
  }
  if (!v7)
  {
    v9 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v27 = 136446978;
    double v28 = COERCE_DOUBLE("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventETATitleFormatter.m");
    __int16 v29 = 1024;
    *(_DWORD *)v30 = 19;
    *(_WORD *)&v30[4] = 2082;
    *(void *)&v30[6] = "-[MapsSuggestionsEventETATitleFormatter shouldDecorateEntry:withETA:]";
    *(_WORD *)&v30[14] = 2082;
    *(void *)&v30[16] = "nil == (eta)";
    v24 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
    goto LABEL_18;
  }
  if ([v6 BOOLeanForKey:@"MapsSuggestionsAlreadyThereKey" is:1]) {
    goto LABEL_20;
  }
  LOBYTE(v9) = 1;
  if (([v6 BOOLeanForKey:@"MapsSuggestionsWithinImminentTimeWindowKey" is:1] & 1) == 0)
  {
    v9 = [v6 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
    if (v9)
    {
      [v8 seconds];
      double v11 = v10;
      id v12 = v6;
      v13 = v12;
      if (self)
      {
        if ([v12 containsKey:@"MapsSuggestionsScheduledTimeKey"])
        {
          v14 = [v13 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
          v15 = MapsSuggestionsNow();
          [v14 timeIntervalSinceDate:v15];
          double v17 = v16;

          [v13 type];
          GEOConfigGetDouble();
          double v19 = v11 * v18;
          GEOConfigGetDouble();
          double v21 = fmax(v19, v20);
          v22 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v23 = @"NO";
            __int16 v29 = 2048;
            int v27 = 134218754;
            double v28 = v17 / 60.0;
            *(double *)v30 = v11 / 60.0;
            if (v17 <= v21) {
              v23 = @"Yes";
            }
            *(_WORD *)&v30[8] = 2112;
            *(void *)&v30[10] = v14;
            *(_WORD *)&v30[18] = 2112;
            *(void *)&v30[20] = v23;
            _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_DEBUG, "timeToEvent: %f min, eta: %f min, scheduledTime %@, meetsThreshold: %@", (uint8_t *)&v27, 0x2Au);
          }

          if (v17 <= v21)
          {
            LOBYTE(v9) = 1;
            [v13 setBoolean:1 forKey:@"MapsSuggestionsWithinImminentTimeWindowKey"];
            goto LABEL_21;
          }
LABEL_20:
          LOBYTE(v9) = 0;
          goto LABEL_21;
        }
        v26 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          int v27 = 136446978;
          double v28 = COERCE_DOUBLE("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventETATitleFormatter.m");
          __int16 v29 = 1024;
          *(_DWORD *)v30 = 41;
          *(_WORD *)&v30[4] = 2082;
          *(void *)&v30[6] = "-[MapsSuggestionsEventETATitleFormatter _etaDuration:meetsThresholdForEntry:]";
          *(_WORD *)&v30[14] = 2082;
          *(void *)&v30[16] = "[entry containsKey:MapsSuggestionsScheduledTimeKey] == NO";
          _os_log_impl(&dword_1A70DF000, v26, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Entry doesn't have a value for MapsSuggestionsScheduledTimeKey to verify if we are in the time window", (uint8_t *)&v27, 0x26u);
        }
      }
LABEL_19:

      goto LABEL_20;
    }
  }
LABEL_21:

  return (char)v9;
}

@end