@interface MapsSuggestionsFlightDeparturesOnlyFilter
+ (BOOL)isEnabled;
- (BOOL)shouldKeepEntry:(id)a3;
@end

@implementation MapsSuggestionsFlightDeparturesOnlyFilter

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldKeepEntry:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlightDeparturesOnlyFilter.m";
      __int16 v14 = 1024;
      int v15 = 22;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsFlightDeparturesOnlyFilter shouldKeepEntry:]";
      __int16 v18 = 2082;
      v19 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Required suggestion entry", (uint8_t *)&v12, 0x26u);
    }

LABEL_9:
    BOOL v9 = 0;
    goto LABEL_13;
  }
  if ([v3 type] != 15)
  {
    BOOL v9 = 1;
    goto LABEL_13;
  }
  if (![v4 containsKey:@"MapsSuggestionsScheduledTimeKey"]) {
    goto LABEL_9;
  }
  v5 = [v4 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
  v6 = v5;
  if (v5)
  {
    double v7 = MapsSuggestionsSecondsSince(v5);
    GEOConfigGetDouble();
    BOOL v9 = v7 <= v8;
  }
  else
  {
    BOOL v9 = 0;
  }

LABEL_13:
  return v9;
}

@end