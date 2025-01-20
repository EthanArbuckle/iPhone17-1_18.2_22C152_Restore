@interface MapsSuggestionsPortraitImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsPortraitImprover

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)improveEntry:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 type] == 17)
    {
      v6 = [v5 geoMapItem];
      v7 = [v6 name];
      -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v7, v5);

      id v8 = v5;
      if ([v8 containsKey:@"MapsSuggestionsOriginBundleIDKey"])
      {
        v9 = [v8 stringForKey:@"MapsSuggestionsOriginBundleIDKey"];
        if ([v9 isEqualToString:@"com.apple.siri"])
        {
          uint64_t v10 = MapsSuggestionsLocalizedSubtitleFormatForPortraitSiriSuggestionEntry();
        }
        else
        {
          if (([v9 isEqualToString:@"com.apple.siri.homepod"] & 1) == 0)
          {

            goto LABEL_15;
          }
          uint64_t v10 = MapsSuggestionsLocalizedSubtitleFormatForPortraitHomePodEntry();
        }
        v13 = (void *)v10;

        if (v13)
        {
LABEL_19:

          -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v13, v8);
          [v8 setBoolean:0 forKey:@"MapsSuggestionsNeedsETATrackingKey"];
          BOOL v12 = 1;
          goto LABEL_20;
        }
      }
LABEL_15:
      v14 = [v8 stringForKey:@"MapsSuggestionsOriginatingAppName"];
      if ([v14 length]) {
        MapsSuggestionsLocalizedSiriFoundInString(v14);
      }
      else {
      v13 = MapsSuggestionsLocalizedSiriSuggestionsString();
      }

      goto LABEL_19;
    }
  }
  else
  {
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitImprover.m";
      __int16 v18 = 1024;
      int v19 = 23;
      __int16 v20 = 2082;
      v21 = "-[MapsSuggestionsPortraitImprover improveEntry:]";
      __int16 v22 = 2082;
      v23 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry", (uint8_t *)&v16, 0x26u);
    }
  }
  BOOL v12 = 0;
LABEL_20:

  return v12;
}

@end