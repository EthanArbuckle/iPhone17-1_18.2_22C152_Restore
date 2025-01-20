@interface MapsSuggestionsOrderStatusImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsOrderStatusImprover

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)improveEntry:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v29 = 136446978;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsOrderStatusImprover.m";
      __int16 v31 = 1024;
      int v32 = 55;
      __int16 v33 = 2082;
      v34 = "-[MapsSuggestionsOrderStatusImprover improveEntry:]";
      __int16 v35 = 2082;
      v36 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", (uint8_t *)&v29, 0x26u);
    }

    goto LABEL_14;
  }
  if ([v4 type] != 23)
  {
LABEL_14:
    BOOL v18 = 0;
    goto LABEL_30;
  }
  v6 = [v5 title];
  v7 = [v5 subtitle];
  v8 = MapsSuggestionsLocalizedOrderPickupTitle();
  if ([v5 containsKey:@"MapsSuggestionsOrderPickupMerchant"])
  {
    v9 = [v5 stringForKey:@"MapsSuggestionsOrderPickupMerchant"];

    if (v9)
    {
      v10 = [v5 stringForKey:@"MapsSuggestionsOrderPickupMerchant"];
      uint64_t v11 = MapsSuggestionsLocalizedOrderPickupFromMerchantTitle(v10);

      v8 = (void *)v11;
    }
  }
  id v12 = v5;
  v13 = v12;
  if (!self) {
    goto LABEL_21;
  }
  if ([v12 containsKey:@"MapsSuggestionsOrderPickupStartDate"])
  {
    v14 = [v13 dateForKey:@"MapsSuggestionsOrderPickupStartDate"];
    v15 = v14;
    if (v14 && MapsSuggestionsIsInTheFuture(v14))
    {
      MapsSuggestionsLocalizedOrderPickupReadyAt(v15);
      v16 = (MapsSuggestionsOrderStatusImprover *)objc_claimAutoreleasedReturnValue();
LABEL_20:
      self = v16;

      goto LABEL_21;
    }
  }
  uint64_t v19 = [v13 expires];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [v13 expires];
    double v22 = MapsSuggestionsSecondsTo(v21);
    GEOConfigGetDouble();
    double v24 = v23;

    if (v22 <= v24)
    {
      v15 = [v13 expires];
      MapsSuggestionsLocalizedOrderPickupReadyUntil(v15);
      v16 = (MapsSuggestionsOrderStatusImprover *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
  }
  MapsSuggestionsLocalizedOrderPickupReady();
  self = (MapsSuggestionsOrderStatusImprover *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  v25 = MapsSuggestionsLocalizedHideInMapsString();
  [v13 setString:v25 forKey:@"MapsSuggestionsRemovalBehaviorStringForHide"];

  v26 = MapsSuggestionsLocalizedForgetMyVisitsString();
  [v13 setString:v26 forKey:@"MapsSuggestionsRemovalBehaviorStringForForget"];

  [v13 setUndecoratedTitle:v8];
  BOOL v27 = v8 == v6 && self == v7;
  BOOL v18 = !v27;
  if (!v27)
  {
    [v13 setTitle:v8];
    [v13 setSubtitle:self];
  }

LABEL_30:
  return v18;
}

@end