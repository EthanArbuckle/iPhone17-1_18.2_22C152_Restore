@interface MapsSuggestionsAppConnectionImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsAppConnectionImprover

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)improveEntry:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 type] == 12)
    {
      id v6 = v5;
      if ([v6 BOOLeanForKey:@"MapsSuggestionsAppConnectionIsCoordinateOnlyURL" is:1])
      {
        if (![v6 containsKey:@"MapsSuggestionsAppConnectionMessageSenderContactName"])
        {
          MapsSuggestionsLocalizedSharedLocationString();
          id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

          if (!v8)
          {
            int v12 = 0;
LABEL_27:
            id v20 = v6;
            v21 = [v20 stringForKey:@"MapsSuggestionsAppConnectionOriginatingWebsiteName"];
            if ([v21 length])
            {
              v22 = MapsSuggestionsLocalizedSiriFoundOnString(v21);
LABEL_39:

              BOOL v10 = (v12 | -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v22, v20)) != 0;
              goto LABEL_40;
            }
            v23 = [v20 stringForKey:@"MapsSuggestionsOriginBundleIDKey"];
            if ([v23 isEqualToString:@"com.apple.siri"])
            {
              uint64_t v24 = MapsSuggestionsLocalizedSubtitleFormatForPortraitSiriSuggestionEntry();
            }
            else
            {
              if (![v23 isEqualToString:@"com.apple.siri.homepod"]) {
                goto LABEL_34;
              }
              uint64_t v24 = MapsSuggestionsLocalizedSubtitleFormatForPortraitHomePodEntry();
            }
            v22 = (void *)v24;
            if (v24)
            {
LABEL_38:

              goto LABEL_39;
            }
LABEL_34:
            v25 = [v20 stringForKey:@"MapsSuggestionsOriginatingAppName"];
            if ([v25 length]) {
              MapsSuggestionsLocalizedSiriFoundInString(v25);
            }
            else {
            v22 = MapsSuggestionsLocalizedSiriSuggestionsString();
            }

            goto LABEL_38;
          }
          int v12 = -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v8, v6);
LABEL_25:

          goto LABEL_27;
        }
        v7 = [v6 stringForKey:@"MapsSuggestionsAppConnectionMessageSenderContactName"];
        MapsSuggestionsLocalizedSharedByString(v7);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

        goto LABEL_23;
      }
      v11 = [v6 undecoratedTitle];
      if ([v11 length])
      {
      }
      else
      {
        v13 = [v6 geoMapItem];

        if (v13)
        {
          v7 = [v6 geoMapItem];
          v14 = [v7 name];
          v15 = v14;
          if (v14)
          {
            id v8 = v14;
          }
          else
          {
            v16 = [v6 geoMapItem];
            v17 = [v16 shortAddress];
            v18 = v17;
            if (v17)
            {
              id v19 = v17;
            }
            else
            {
              MapsSuggestionsLocalizedFoundInAppString();
              id v19 = (id)objc_claimAutoreleasedReturnValue();
            }
            id v8 = v19;
          }
          goto LABEL_22;
        }
      }
      int v12 = 0;
      id v8 = v6;
      goto LABEL_25;
    }
  }
  else
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v27 = 136446978;
      v28 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAppConnectionImprover.m";
      __int16 v29 = 1024;
      int v30 = 24;
      __int16 v31 = 2082;
      v32 = "-[MapsSuggestionsAppConnectionImprover improveEntry:]";
      __int16 v33 = 2082;
      v34 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v27, 0x26u);
    }
  }
  BOOL v10 = 0;
LABEL_40:

  return v10;
}

@end