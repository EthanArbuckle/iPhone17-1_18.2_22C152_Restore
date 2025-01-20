@interface MapsSuggestionsPinnedPlaceImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsPinnedPlaceImprover

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)improveEntry:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPinnedPlaceImprover.m";
      __int16 v17 = 1024;
      int v18 = 22;
      __int16 v19 = 2082;
      v20 = "-[MapsSuggestionsPinnedPlaceImprover improveEntry:]";
      __int16 v21 = 2082;
      v22 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an Entry", (uint8_t *)&v15, 0x26u);
    }

    goto LABEL_10;
  }
  if (![v3 isPureShortcut])
  {
LABEL_10:
    char v11 = 0;
    goto LABEL_11;
  }
  if (![v4 isShortcutForSetup])
  {
    if (MapsSuggestionsEntryIsNearbyTransit(v4))
    {
LABEL_17:
      v14 = MapsSuggestionsLocalizedNearbyTransitShortSubtitleString();
      char v11 = [v4 updateUndecoratedSubtitle:v14];

      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v5 = MapsSuggestionsShortcutTypeFromEntryType([v4 type]);
  v6 = MapsSuggestionsShortcutSetupStringForType(v5, 1);
  if (v6
    && ([v4 undecoratedSubtitle],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v6 isEqualToString:v7],
        v7,
        (v8 & 1) == 0))
  {
    [v4 setUndecoratedSubtitle:v6];
    char v9 = 1;
  }
  else
  {
    char v9 = 0;
  }

  int IsNearbyTransit = MapsSuggestionsEntryIsNearbyTransit(v4);
  char v11 = v9 | IsNearbyTransit;
  if ((v9 & 1) == 0 && IsNearbyTransit) {
    goto LABEL_17;
  }
LABEL_11:

  return v11;
}

@end