@interface MapsSuggestionsOrderStatusTitleFormatter
- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4;
@end

@implementation MapsSuggestionsOrderStatusTitleFormatter

- (BOOL)formatTitlesForEntry:(id)a3 eta:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v14 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136446978;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsOrderStatusTitleFormatter.m";
    __int16 v33 = 1024;
    int v34 = 25;
    __int16 v35 = 2082;
    v36 = "-[MapsSuggestionsOrderStatusTitleFormatter formatTitlesForEntry:eta:]";
    __int16 v37 = 2082;
    v38 = "nil == (entry)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_15:
    _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0x26u);
    goto LABEL_16;
  }
  if (!v7)
  {
    v14 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136446978;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsOrderStatusTitleFormatter.m";
    __int16 v33 = 1024;
    int v34 = 26;
    __int16 v35 = 2082;
    v36 = "-[MapsSuggestionsOrderStatusTitleFormatter formatTitlesForEntry:eta:]";
    __int16 v37 = 2082;
    v38 = "nil == (eta)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA";
    goto LABEL_15;
  }
  if ([v6 type] != 23)
  {
    v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsOrderStatusTitleFormatter.m";
      __int16 v33 = 1024;
      int v34 = 27;
      __int16 v35 = 2082;
      v36 = "-[MapsSuggestionsOrderStatusTitleFormatter formatTitlesForEntry:eta:]";
      __int16 v37 = 2082;
      v38 = "MapsSuggestionsEntryTypeOrderStatus != entry.type";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Needs to be OrderStatus";
      goto LABEL_15;
    }
LABEL_16:

    char v16 = 0;
    goto LABEL_17;
  }
  id v9 = v6;
  v10 = v9;
  if (!self)
  {
    v24 = 0;
    goto LABEL_24;
  }
  if ([v9 containsKey:@"MapsSuggestionsOrderPickupStartDate"])
  {
    v11 = [v10 dateForKey:@"MapsSuggestionsOrderPickupStartDate"];
    v12 = v11;
    if (v11 && MapsSuggestionsIsInTheFuture(v11))
    {
      uint64_t v13 = MapsSuggestionsLocalizedOrderPickupReadyAt(v12);
LABEL_23:
      v24 = (void *)v13;

      goto LABEL_24;
    }
  }
  uint64_t v18 = [v10 expires];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [v10 expires];
    double v21 = MapsSuggestionsSecondsTo(v20);
    GEOConfigGetDouble();
    double v23 = v22;

    if (v21 <= v23)
    {
      v12 = [v10 expires];
      uint64_t v13 = MapsSuggestionsLocalizedOrderPickupReadyUntil(v12);
      goto LABEL_23;
    }
  }
  v24 = MapsSuggestionsLocalizedOrderPickupReady();
LABEL_24:

  [v8 seconds];
  v26 = NSStringFromMapsSuggestionsShortETA(v25);
  v27 = MapsSuggestionsLocalizedStringFromGEOTransportType([v8 transportType]);
  v28 = MapsSuggestionsLocalizedETAFormatString(v26, v27);

  if (v28)
  {
    uint64_t v29 = objc_msgSend(v24, "stringByAppendingFormat:", @" • %1$@", v28);

    v24 = (void *)v29;
  }

  v30 = [v10 title];
  char v16 = -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v10, v30, v24, 0);

LABEL_17:
  return v16;
}

@end