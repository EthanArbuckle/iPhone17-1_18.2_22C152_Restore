@interface MapsSuggestionsReservationDeduper
+ (BOOL)isEnabled;
- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4;
@end

@implementation MapsSuggestionsReservationDeduper

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v53 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReservationDeduper.m";
      __int16 v54 = 1024;
      int v55 = 70;
      __int16 v56 = 2082;
      v57 = "-[MapsSuggestionsReservationDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v58 = 2082;
      v59 = "nil == (originalEntry)";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_14:
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x26u);
    }
LABEL_15:
    LOBYTE(v11) = 0;
LABEL_16:

    goto LABEL_17;
  }
  if (!v6)
  {
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v53 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReservationDeduper.m";
      __int16 v54 = 1024;
      int v55 = 71;
      __int16 v56 = 2082;
      v57 = "-[MapsSuggestionsReservationDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v58 = 2082;
      v59 = "nil == (entry)";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (([v5 hasMultipleWaypointsLeft] & 1) == 0
    && ([v7 hasMultipleWaypointsLeft] & 1) == 0
    && MapsSuggestionsEntriesAtLeastOneIsOfType(8, v5, v7)
    && !MapsSuggestionsAtLeastOneEntryIsShortcut(v7, v5))
  {
    int ShouldBeOfOneOfEachType = MapsSuggestionsEntriesShouldBeOfOneOfEachType(8, 3, v5, v7);
    BOOL v9 = MapsSuggestionsEntriesAreBothOfType(8, v5, v7);
    BOOL v10 = v9;
    if ((ShouldBeOfOneOfEachType & 1) != 0 || v9)
    {
      v12 = [v5 stringForKey:@"MapsSuggestionsCoreSuggestionsOpaqueKey"];
      v15 = [v7 stringForKey:@"MapsSuggestionsCoreSuggestionsOpaqueKey"];
      if ([v12 isEqualToString:v15])
      {
        v16 = v5;
        id v17 = v7;
LABEL_20:
        v18 = v17;
        if ([v16 type] == 3)
        {
          [v16 replaceByEntry:v18];
        }
        else
        {
          if ([v18 type] == 3
            || [v16 type] == 8
            && ([v16 originatingSourceName],
                v38 = objc_claimAutoreleasedReturnValue(),
                int v39 = [v38 isEqualToString:@"MapsSuggestionsReservationsSource"],
                v38,
                v39))
          {
            v28 = v16;
            v29 = v18;
            uint64_t v30 = 0;
          }
          else
          {
            v28 = v16;
            v29 = v18;
            uint64_t v30 = 1;
          }
          [v28 mergeFromSuggestionEntry:v29 behavior:v30];
        }

        LOBYTE(v11) = 1;
        goto LABEL_48;
      }
      if (ShouldBeOfOneOfEachType)
      {
        v19 = v5;
        id v20 = v7;
        if ([v19 containsKey:@"MapsSuggestionsScheduledTimeKey"]
          && ([v20 containsKey:@"MapsSuggestionsScheduledTimeKey"] & 1) != 0)
        {
          v21 = [v19 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
          v22 = [v20 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
          uint64_t v23 = [v21 compare:v22];

          if (!v23)
          {
            v11 = [v19 geoMapItem];
            if (!v11)
            {
LABEL_48:

              goto LABEL_16;
            }
            v24 = [v20 geoMapItem];

            if (v24)
            {
              v25 = [v19 geoMapItem];
              v26 = [v20 geoMapItem];
              char v27 = MapsSuggestionsMapItemsAreEqual(v25, v26, 1, 0, 0);

              if ((v27 & 1) == 0)
              {
                v19 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_DEBUG, "GEOMapItems were not Equal. So cannot dupe entries", buf, 2u);
                }
                goto LABEL_41;
              }
LABEL_58:
              v16 = v19;
              id v17 = v20;
              goto LABEL_20;
            }
          }
LABEL_42:
          LOBYTE(v11) = 0;
          goto LABEL_48;
        }
        goto LABEL_40;
      }
      if (!v10) {
        goto LABEL_42;
      }
      v19 = v5;
      id v20 = v7;
      if (![v19 containsKey:@"MapsSuggestionsScheduledTimeKey"]
        || ([v20 containsKey:@"MapsSuggestionsScheduledTimeKey"] & 1) == 0)
      {
LABEL_40:

LABEL_41:
        goto LABEL_42;
      }
      v31 = [v19 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
      v32 = [v20 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
      uint64_t v33 = [v31 compare:v32];

      if (v33) {
        goto LABEL_42;
      }
      v34 = [v19 title];
      uint64_t v35 = [v20 title];
      v36 = (void *)v35;
      if (v34 == (void *)v35)
      {
        v49 = (void *)v35;
        v50 = v34;
      }
      else
      {
        v37 = [v19 title];
        v47 = [v20 title];
        v48 = v37;
        if (![v37 isEqualToString:v47])
        {
          int v51 = 0;
          goto LABEL_55;
        }
        v49 = v36;
        v50 = v34;
      }
      v40 = [v19 subtitle];
      v41 = [v20 subtitle];
      if (v40 == v41)
      {
        int v51 = 1;
      }
      else
      {
        v42 = [v19 subtitle];
        v43 = [v20 subtitle];
        int v51 = [v42 isEqualToString:v43];
      }
      v36 = v49;
      v34 = v50;
      if (v50 == v49)
      {
LABEL_56:

        v44 = [v19 geoMapItem];
        v45 = [v20 geoMapItem];
        int v46 = MapsSuggestionsMapItemsAreEqual(v44, v45, 1, 0, 0);

        if (!v51)
        {
          LOBYTE(v11) = 0;
          if (!v46) {
            goto LABEL_48;
          }
        }
        goto LABEL_58;
      }
LABEL_55:

      goto LABEL_56;
    }
  }
  LOBYTE(v11) = 0;
LABEL_17:

  return (char)v11;
}

@end