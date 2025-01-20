@interface MapsSuggestionsGEOMapItemDeduper
+ (BOOL)isEnabled;
- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4;
- (MapsSuggestionsGEOMapItemDeduper)initWithSacrificedType:(int64_t)a3;
- (NSString)uniqueName;
@end

@implementation MapsSuggestionsGEOMapItemDeduper

- (MapsSuggestionsGEOMapItemDeduper)initWithSacrificedType:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MapsSuggestionsGEOMapItemDeduper;
  v4 = [(MapsSuggestionsGEOMapItemDeduper *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    id v6 = [NSString alloc];
    v7 = [(id)objc_opt_class() description];
    v8 = NSStringFromMapsSuggestionsEntryType(v5->_type);
    uint64_t v9 = [v6 initWithFormat:@"%@_%@", v7, v8];
    name = v5->_name;
    v5->_name = (NSString *)v9;
  }
  return v5;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (NSString)uniqueName
{
  return self->_name;
}

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    uint64_t v9 = (MapsSuggestionsTooEarlyFilter *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    int v23 = 136446978;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsGEOMapItemDeduper.m";
    __int16 v25 = 1024;
    int v26 = 51;
    __int16 v27 = 2082;
    v28 = "-[MapsSuggestionsGEOMapItemDeduper dedupeByEnrichingEntry:withEntry:]";
    __int16 v29 = 2082;
    v30 = "nil == (originalEntry)";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_26:
    _os_log_impl(&dword_1A70DF000, &v9->super.super, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v23, 0x26u);
    goto LABEL_27;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    uint64_t v9 = (MapsSuggestionsTooEarlyFilter *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    int v23 = 136446978;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsGEOMapItemDeduper.m";
    __int16 v25 = 1024;
    int v26 = 52;
    __int16 v27 = 2082;
    v28 = "-[MapsSuggestionsGEOMapItemDeduper dedupeByEnrichingEntry:withEntry:]";
    __int16 v29 = 2082;
    v30 = "nil == (entry)";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
    goto LABEL_26;
  }
  if (([v6 hasMultipleWaypointsLeft] & 1) == 0
    && ([v8 hasMultipleWaypointsLeft] & 1) == 0
    && MapsSuggestionsEntriesAtLeastOneIsOfType(self->_type, v6, v8))
  {
    uint64_t v9 = objc_alloc_init(MapsSuggestionsTooEarlyFilter);
    if ([(MapsSuggestionsTooEarlyFilter *)v9 shouldKeepEntry:v6]
      && [(MapsSuggestionsTooEarlyFilter *)v9 shouldKeepEntry:v8]
      && !MapsSuggestionsEntriesAtLeastOneIsOfType(24, v6, v8)
      && !MapsSuggestionsAtLeastOneEntryIsShortcut(v8, v6)
      && !MapsSuggestionsEntriesAreBothOfType(23, v6, v8))
    {
      v10 = [v6 geoMapItem];
      if (!v10)
      {
LABEL_28:

        goto LABEL_29;
      }
      v11 = [v8 geoMapItem];

      if (v11)
      {
        if ([v6 type] == self->_type && objc_msgSend(v8, "type") == 15)
        {
          objc_super v12 = [v6 geoMapItem];
          v13 = [v12 geoFenceMapRegion];
          GEOMapRectForMapRegion();

          v14 = [v8 geoMapItem];
          v15 = [v14 geoFenceMapRegion];
          GEOMapRectForMapRegion();

          if ((GEOMapRectIsEmpty() & 1) == 0
            && (GEOMapRectIsEmpty() & 1) == 0
            && GEOMapRectIntersectsRect())
          {
            v16 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v23) = 0;
              _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "Dropping the CalendarEvent in favor of the Flight entry", (uint8_t *)&v23, 2u);
            }

            goto LABEL_37;
          }
        }
        v19 = [v6 geoMapItem];
        v20 = [v8 geoMapItem];
        int v21 = MapsSuggestionsMapItemsAreEqual(v19, v20, 0, 0, 0);

        if (v21)
        {
          uint64_t v22 = [v6 type];
          if (v22 == [v8 type])
          {
            if ([v6 hasStartTime]
              && [v8 hasStartTime]
              && ([v6 startsBeforeEntry:v8] & 1) != 0)
            {
              goto LABEL_38;
            }
          }
          else if ([v6 type] != self->_type)
          {
LABEL_38:
            LOBYTE(v10) = 1;
            goto LABEL_28;
          }
LABEL_37:
          [v6 replaceByEntry:v8];
          goto LABEL_38;
        }
      }
    }
LABEL_27:
    LOBYTE(v10) = 0;
    goto LABEL_28;
  }
  LOBYTE(v10) = 0;
LABEL_29:

  return (char)v10;
}

- (void).cxx_destruct
{
}

@end