@interface MapsSuggestionsEventKit
- (BOOL)_addCalendarEventFieldsToEntry:(void *)a1 event:(void *)a2;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (BOOL)deleteOrDeclineEntry:(id)a3 handler:(id)a4;
- (BOOL)entriesForEventsAtLocation:(id)a3 period:(id)a4 fetchMapItems:(BOOL)a5 handler:(id)a6;
- (BOOL)hasVisibleCalendars;
- (MapsSuggestionsEventKit)initWithConnector:(id)a3 network:(id)a4;
- (NSString)uniqueName;
- (id)initFromResourceDepot:(id)a3;
- (void)_q_createEntriesWithinPeriod:(void *)a3 location:(char)a4 fetchMapItems:(void *)a5 handler:;
- (void)eventKitDidChange:(id)a3;
- (void)interestingFlightEventsFrom:(id)a3 to:(id)a4 handler:(id)a5;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation MapsSuggestionsEventKit

- (BOOL)hasVisibleCalendars
{
  v2 = [(MapsSuggestionsEventKitConnector *)self->_connector visibleCalendars];
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 count] != 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)eventKitDidChange:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [v4 uniqueName];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "Received eventKitDidChange:%@", (uint8_t *)&v7, 0xCu);
  }
  [(MapsSuggestionsCanKicker *)self->_changedNotificationCanKicker kickCanBySameTime];
}

void __83__MapsSuggestionsEventKit_entriesForEventsAtLocation_period_fetchMapItems_handler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]((uint64_t)WeakRetained, *(void **)(a1 + 32), *(void **)(a1 + 40), *(unsigned char *)(a1 + 64), *(void **)(a1 + 48));
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      v6 = "MapsSuggestionsEventKit.m";
      __int16 v7 = 1026;
      int v8 = 186;
      __int16 v9 = 2082;
      v10 = "-[MapsSuggestionsEventKit entriesForEventsAtLocation:period:fetchMapItems:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (BOOL)entriesForEventsAtLocation:(id)a3 period:(id)a4 fetchMapItems:(BOOL)a5 handler:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v12)
  {
    v15 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)location = 136446978;
    *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
    __int16 v25 = 1024;
    int v26 = 180;
    __int16 v27 = 2082;
    v28 = "-[MapsSuggestionsEventKit entriesForEventsAtLocation:period:fetchMapItems:handler:]";
    __int16 v29 = 2082;
    v30 = "nil == (handler)";
    v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_11:
    _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_ERROR, v16, location, 0x26u);
    goto LABEL_12;
  }
  if (!v10)
  {
    v15 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)location = 136446978;
    *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
    __int16 v25 = 1024;
    int v26 = 181;
    __int16 v27 = 2082;
    v28 = "-[MapsSuggestionsEventKit entriesForEventsAtLocation:period:fetchMapItems:handler:]";
    __int16 v29 = 2082;
    v30 = "nil == (location)";
    v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location";
    goto LABEL_11;
  }
  if (!v11)
  {
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
      __int16 v25 = 1024;
      int v26 = 182;
      __int16 v27 = 2082;
      v28 = "-[MapsSuggestionsEventKit entriesForEventsAtLocation:period:fetchMapItems:handler:]";
      __int16 v29 = 2082;
      v30 = "nil == (period)";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time period";
      goto LABEL_11;
    }
LABEL_12:

    BOOL v14 = 0;
    goto LABEL_13;
  }
  objc_initWeak((id *)location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__MapsSuggestionsEventKit_entriesForEventsAtLocation_period_fetchMapItems_handler___block_invoke;
  block[3] = &unk_1E5CB8A20;
  objc_copyWeak(&v22, (id *)location);
  id v19 = v11;
  id v20 = v10;
  BOOL v23 = a5;
  id v21 = v12;
  dispatch_async(queue, block);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)location);
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

void __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_389(uint64_t a1)
{
  *(void *)&v11[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:@"No events available"];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, MEMORY[0x1E4F1CBF0], v4);

    int v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = [WeakRetained uniqueName];
      int v8 = 138412546;
      __int16 v9 = v6;
      __int16 v10 = 2080;
      *(void *)id v11 = "_q_createEntriesWithinPeriod";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);
    }
    __int16 v7 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod", "", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      __int16 v9 = "MapsSuggestionsEventKit.m";
      __int16 v10 = 1026;
      *(_DWORD *)id v11 = 777;
      v11[2] = 2082;
      *(void *)&v11[3] = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)_q_createEntriesWithinPeriod:(void *)a3 location:(char)a4 fetchMapItems:(void *)a5 handler:
{
  uint64_t v366 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a5;
  v315 = v7;
  v319 = v8;
  v317 = v9;
  if (!v7)
  {
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 745;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (period)";
      _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a period", buf, 0x26u);
    }
    goto LABEL_19;
  }
  if (!v8)
  {
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 746;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (location)";
      _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location", buf, 0x26u);
    }
    goto LABEL_19;
  }
  if (!v9)
  {
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 747;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (handler)";
      _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler", buf, 0x26u);
    }
LABEL_19:

    goto LABEL_365;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  GEOFindOrCreateLog();
  __int16 v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = [(id)a1 uniqueName];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "_q_createEntriesWithinPeriod";
    _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  id v12 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod", "", buf, 2u);
  }

  objc_initWeak(&location, (id)a1);
  if (([(id)a1 hasVisibleCalendars] & 1) == 0)
  {
    id v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_DEBUG, "Returning because all the calendars are invisible", buf, 2u);
    }

    id v20 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke;
    block[3] = &unk_1E5CB8A98;
    objc_copyWeak(&v352, &location);
    id v351 = v317;
    dispatch_async(v20, block);

    objc_destroyWeak(&v352);
    goto LABEL_364;
  }
  v13 = *(void **)(a1 + 16);
  id v14 = v7;
  v15 = [*(id *)(a1 + 16) visibleCalendars];
  v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    uint64_t v21 = [*(id *)(a1 + 16) calendarsForEntityType:0];
    id v22 = (void *)v21;
    BOOL v23 = (void *)MEMORY[0x1E4F1CBF0];
    if (v21) {
      BOOL v23 = (void *)v21;
    }
    id v17 = v23;
  }
  v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v17, "count"));
  long long v356 = 0u;
  long long v357 = 0u;
  long long v354 = 0u;
  long long v355 = 0u;
  id v25 = v17;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v354 objects:buf count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v355;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v355 != v27) {
          objc_enumerationMutation(v25);
        }
        __int16 v29 = *(void **)(*((void *)&v354 + 1) + 8 * i);
        if (![v29 isSuggestedEventCalendar] || GEOConfigGetBOOL()) {
          [v24 addObject:v29];
        }
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v354 objects:buf count:16];
    }
    while (v26);
  }

  v30 = *(void **)(a1 + 16);
  uint64_t v31 = [v14 startDate];
  v32 = [v14 endDate];
  v33 = (void *)[v24 copy];
  v34 = [v30 predicateForEventsWithStartDate:v31 endDate:v32 calendars:v33];

  v306 = [v13 eventsMatchingPredicate:v34];

  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v35 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v36 = [v306 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v36;
      _os_log_impl(&dword_1A70DF000, v35, OS_LOG_TYPE_DEBUG, "Received %lu records from EKEventStore", buf, 0xCu);
    }
  }
  if (![v306 count])
  {
    v285 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v285, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v285, OS_LOG_TYPE_DEBUG, "Number of events are zero. Returning.", buf, 2u);
    }

    v286 = *(NSObject **)(a1 + 8);
    v347[0] = MEMORY[0x1E4F143A8];
    v347[1] = 3221225472;
    v347[2] = __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_389;
    v347[3] = &unk_1E5CB8A98;
    objc_copyWeak(&v349, &location);
    id v348 = v317;
    dispatch_async(v286, v347);

    objc_destroyWeak(&v349);
    goto LABEL_363;
  }
  GEOFindOrCreateLog();
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    v38 = [(id)a1 uniqueName];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v38;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "_q_createEntriesWithinPeriod_Entries";
    _os_log_impl(&dword_1A70DF000, v37, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  v39 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v39, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_Entries", "", buf, 2u);
  }

  id v312 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v40 = [*(id *)(a1 + 56) allKeys];
  v301 = (void *)[v40 mutableCopy];

  group = dispatch_group_create();
  long long v343 = 0u;
  long long v344 = 0u;
  long long v345 = 0u;
  long long v346 = 0u;
  obuint64_t j = v306;
  uint64_t v41 = [obj countByEnumeratingWithState:&v343 objects:v363 count:16];
  if (!v41) {
    goto LABEL_354;
  }
  uint64_t v327 = *(void *)v344;
  v287 = v359;
  do
  {
    uint64_t v328 = v41;
    for (uint64_t j = 0; j != v328; ++j)
    {
      if (*(void *)v344 != v327) {
        objc_enumerationMutation(obj);
      }
      v43 = *(void **)(*((void *)&v343 + 1) + 8 * j);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        GEOFindOrCreateLog();
        v46 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          v48 = [v43 title];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v48;
          _os_log_impl(&dword_1A70DF000, v46, OS_LOG_TYPE_DEBUG, "Skipping event {%@} because event is not of type EKCalenderItem", buf, 0xCu);
        }
LABEL_64:
        v49 = v46;
LABEL_65:

        continue;
      }
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      }
      if (s_verbose)
      {
        GEOFindOrCreateLog();
        v44 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          v45 = [v43 title];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v45;
          _os_log_impl(&dword_1A70DF000, v44, OS_LOG_TYPE_DEBUG, "Treating event {%@}", buf, 0xCu);
        }
      }
      if ([v43 status] == 3)
      {
        GEOFindOrCreateLog();
        v46 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          v47 = [v43 title];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v47;
          _os_log_impl(&dword_1A70DF000, v46, OS_LOG_TYPE_DEBUG, "Skipping event {%@} because the event is canceled", buf, 0xCu);
        }
        goto LABEL_64;
      }
      v50 = [v43 selfAttendee];
      BOOL v51 = v50 == 0;

      if (!v51)
      {
        v52 = [v43 selfAttendee];
        BOOL v53 = [v52 participantStatus] == 3;

        if (v53)
        {
          GEOFindOrCreateLog();
          v46 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            v54 = [v43 title];
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v54;
            _os_log_impl(&dword_1A70DF000, v46, OS_LOG_TYPE_DEBUG, "Skipping event {%@} because the participant declined the event", buf, 0xCu);
          }
          goto LABEL_64;
        }
      }
      GEOFindOrCreateLog();
      v55 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        v56 = [v43 title];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v56;
        _os_log_impl(&dword_1A70DF000, v55, OS_LOG_TYPE_DEBUG, "Treating event {%@}", buf, 0xCu);
      }
      v49 = v43;
      v46 = [v49 customObjectForKey:@"SuggestionsSchemaOrg"];
      v57 = [v49 uniqueId];
      BOOL v58 = v57 == 0;

      if (v58) {
        goto LABEL_65;
      }
      if (!v46 && (GEOConfigGetBOOL() & 1) == 0)
      {
        GEOFindOrCreateLog();
        v73 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          v74 = [v49 title];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v74;
          _os_log_impl(&dword_1A70DF000, v73, OS_LOG_TYPE_DEBUG, "RoutineSource will process the calendar item %@ because it does not have the schema.org blob and the MapsSuggestionsCalendarEventsFromCalendarSource server default is NO", buf, 0xCu);
        }
        v46 = 0;
        goto LABEL_65;
      }
      v59 = v49;
      v49 = v59;
      if (!v59)
      {
        GEOFindOrCreateLog();
        v66 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A70DF000, v66, OS_LOG_TYPE_DEBUG, "No Event", buf, 2u);
        }

LABEL_101:
LABEL_102:
        v324 = 0;
        goto LABEL_103;
      }
      v60 = [v59 preferredLocationWithoutPrediction];
      v61 = [v60 geoLocation];
      if (v61)
      {
        v62 = [v49 preferredLocationWithoutPrediction];
        v63 = [v62 geoLocation];
        [v63 coordinate];
        BOOL v64 = CLLocationCoordinate2DIsValid(v367);

        if (v64)
        {
          GEOFindOrCreateLog();
          v65 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A70DF000, v65, OS_LOG_TYPE_DEBUG, "Using Event's preferredLocationWithoutPrediction", buf, 2u);
          }

          v324 = [v49 preferredLocationWithoutPrediction];
          goto LABEL_103;
        }
      }
      else
      {
      }
      v67 = [v49 preferredLocation];
      v68 = [v67 geoLocation];
      if (v68)
      {
        v69 = [v49 preferredLocation];
        v70 = [v69 geoLocation];
        [v70 coordinate];
        BOOL v71 = CLLocationCoordinate2DIsValid(v368);

        if (v71)
        {
          GEOFindOrCreateLog();
          v72 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A70DF000, v72, OS_LOG_TYPE_DEBUG, "Using Event's preferredLocation", buf, 2u);
          }

          v324 = [v49 preferredLocation];
          goto LABEL_103;
        }
      }
      else
      {
      }
      v66 = [v49 structuredLocation];
      v75 = [v66 geoLocation];
      if (!v75) {
        goto LABEL_101;
      }
      v76 = [v49 structuredLocation];
      v77 = [v76 geoLocation];
      [v77 coordinate];
      BOOL v78 = CLLocationCoordinate2DIsValid(v369);

      if (!v78) {
        goto LABEL_102;
      }
      GEOFindOrCreateLog();
      v79 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v79, OS_LOG_TYPE_DEBUG, "Using Event's structuredLocation", buf, 2u);
      }

      v324 = [v49 structuredLocation];
LABEL_103:

      v325 = [v324 geoLocation];
      if (!v325)
      {
        GEOFindOrCreateLog();
        v80 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          v82 = [v49 title];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v82;
          _os_log_impl(&dword_1A70DF000, v80, OS_LOG_TYPE_DEBUG, "Skipping event {%@} because it lacks a location", buf, 0xCu);
        }
        goto LABEL_109;
      }
      if ([v49 hasPredictedLocation])
      {
        GEOFindOrCreateLog();
        v80 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          v81 = [v49 title];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v81;
          _os_log_impl(&dword_1A70DF000, v80, OS_LOG_TYPE_DEBUG, "Skipping event {%@} because the location is a suggested location", buf, 0xCu);
        }
LABEL_109:

        goto LABEL_65;
      }
      if (v46)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v83 = [v46 firstObject];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            GEOFindOrCreateLog();
            v85 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v46;
              _os_log_impl(&dword_1A70DF000, v85, OS_LOG_TYPE_DEBUG, "Received CustomObject:%@", buf, 0xCu);
            }
          }
        }
      }
      v46 = v46;
      id v321 = [v46 firstObject];
      v86 = [v321 objectForKeyedSubscript:@"@type"];
      v87 = v86;
      if (v86 && [v86 length])
      {
        if ([v87 containsString:@"http://schema.org/"])
        {
          uint64_t v88 = [v87 stringByReplacingOccurrencesOfString:@"http://schema.org/" withString:&stru_1EFC640F8];

          v87 = (void *)v88;
        }
        v89 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v87;
          _os_log_impl(&dword_1A70DF000, v89, OS_LOG_TYPE_DEBUG, "schemaType is %@", buf, 0xCu);
        }

        if ([v87 isEqualToString:@"EventReservation"])
        {
          v90 = [v321 objectForKeyedSubscript:@"reservationFor"];
          v91 = [v90 objectForKeyedSubscript:@"@type"];

          v92 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v91;
            _os_log_impl(&dword_1A70DF000, v92, OS_LOG_TYPE_DEBUG, "Subtype is %@", buf, 0xCu);
          }

          if (![*(id *)(a1 + 48) containsObject:v91]) {
            goto LABEL_127;
          }
          v93 = [v321 objectForKeyedSubscript:@"reservedTicket"];
          v94 = [v93 objectForKeyedSubscript:@"ticketedSeat"];

          v322 = [v94 objectForKeyedSubscript:@"seatSection"];
          v95 = [v94 objectForKeyedSubscript:@"seatRow"];
          v96 = [v94 objectForKeyedSubscript:@"seatNumber"];
          uint64_t v97 = [v322 length];
          uint64_t v98 = [v95 length];
          LODWORD(v97) = v98 + v97 + [v96 length] == 0;

          if (!v97)
          {
            uint64_t v100 = 16;
          }
          else
          {
LABEL_127:
            v99 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A70DF000, v99, OS_LOG_TYPE_DEBUG, "No subtype available or no seat information available. Changing type to CalendarEvent.", buf, 2u);
            }

            uint64_t v100 = 3;
          }
        }
        else
        {
          if (_MergedGlobals_32 != -1) {
            dispatch_once(&_MergedGlobals_32, &__block_literal_global_6);
          }
          v141 = [(id)qword_1EB6F0190 objectForKeyedSubscript:v87];
          v91 = v141;
          if (v141) {
            uint64_t v100 = [v141 integerValue];
          }
          else {
            uint64_t v100 = 0;
          }
        }
      }
      else
      {
        v91 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A70DF000, v91, OS_LOG_TYPE_DEBUG, "Schema type cannot be nil. Defaulting to Calendar Event.", buf, 2u);
        }
        uint64_t v100 = 3;
      }

      [v325 distanceFromLocation:v319];
      double v102 = v101;
      if (v100 != 15)
      {
        GEOConfigGetDouble();
        if (v103 < v102)
        {
          GEOFindOrCreateLog();
          v104 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
          {
            v105 = [v49 title];
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v105;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v102;
            _os_log_impl(&dword_1A70DF000, v104, OS_LOG_TYPE_DEBUG, "Skipping event {%@} because it is too far away (%.2f m).", buf, 0x16u);
          }
          goto LABEL_65;
        }
      }
      GEOConfigGetDouble();
      if (v100 == 15 || (double v107 = v106, v100 == 13))
      {
        GEOConfigGetDouble();
        double v107 = v108;
      }
      v109 = [MapsSuggestionsEntry alloc];
      v110 = [v49 title];
      v111 = [(MapsSuggestionsEntry *)v109 initWithType:v100 title:v110];

      [v325 coordinate];
      double v113 = v112;
      double v115 = v114;
      v116 = [v49 uniqueId];
      [(MapsSuggestionsEntry *)v111 setString:v116 forKey:@"MapsSuggestionsCalendarPK"];

      [(MapsSuggestionsEntry *)v111 setString:@"MapsSuggestionsCalendarPK" forKey:@"MapsSuggestionsPrimaryKey"];
      v117 = [NSNumber numberWithDouble:v113];
      [(MapsSuggestionsEntry *)v111 setNumber:v117 forKey:@"MapsSuggestionsLatitudeKey"];

      v118 = [NSNumber numberWithDouble:v115];
      [(MapsSuggestionsEntry *)v111 setNumber:v118 forKey:@"MapsSuggestionsLongitudeKey"];

      -[MapsSuggestionsEntry setBoolean:forKey:](v111, "setBoolean:forKey:", [v325 referenceFrame] != 2, @"MapsSuggestionsShiftCoordinateIfNeededKey");
      v119 = [v49 location];
      v120 = v119;
      if (!v119)
      {
        v313 = [v49 locationWithoutPrediction];
        v120 = v313;
      }
      [(MapsSuggestionsEntry *)v111 setString:v120 forKey:@"MapsSuggestionsDestinationAddressKey"];
      if (!v119) {

      }
      v121 = [v49 startDate];
      [(MapsSuggestionsEntry *)v111 setDate:v121 forKey:@"MapsSuggestionsScheduledTimeKey"];

      v122 = [v49 endDate];
      [(MapsSuggestionsEntry *)v111 setDate:v122 forKey:@"MapsSuggestionsScheduledEndTimeKey"];

      [(MapsSuggestionsEntry *)v111 setBoolean:1 forKey:@"MapsSuggestionsNeedsETATrackingKey"];
      v123 = [v49 suggestionInfo];
      v124 = [v123 opaqueKey];
      [(MapsSuggestionsEntry *)v111 setString:v124 forKey:@"MapsSuggestionsCoreSuggestionsOpaqueKey"];

      v125 = [v49 suggestionInfo];
      v126 = [v125 uniqueKey];
      [(MapsSuggestionsEntry *)v111 setString:v126 forKey:@"MapsSuggestionsCoreSuggestionsUniqueKey"];

      v127 = [v49 eventIdentifier];
      [(MapsSuggestionsEntry *)v111 setString:v127 forKey:@"MapsSuggestionsEventIDKey"];

      v128 = [v49 endDate];
      [(MapsSuggestionsEntry *)v111 setExpires:v128];

      v129 = [v49 timeZone];
      v130 = [v129 name];
      [(MapsSuggestionsEntry *)v111 setString:v130 forKey:@"MapsSuggestionsEventTimeZoneKey"];

      [(MapsSuggestionsEntry *)v111 setBoolean:v107 > v102 forKey:@"MapsSuggestionsAlreadyThereKey"];
      v323 = v49;
      v131 = [v323 organizer];
      if (v131)
      {
        v132 = [v323 organizer];
        int v133 = [v132 isCurrentUser];

        uint64_t v134 = v133 ^ 1u;
      }
      else
      {
        uint64_t v134 = 0;
      }

      [(MapsSuggestionsEntry *)v111 setBoolean:v134 forKey:@"MapsSuggestionsCalendarIsInvitationKey"];
      id v135 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      v362 = MapsSuggestionsCalendarAppBundleID;
      v136 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v362 count:1];
      v316 = (void *)[v135 initWithArray:v136];

      [(MapsSuggestionsEntry *)v111 setSet:v316 forKey:@"MapsSuggestionsAssociatedBundleIDsKey"];
      [(MapsSuggestionsEntry *)v111 setBoolean:[v323 hasRecurrenceRules] forKey:@"MapsSuggestionsCalendarEventIsRecurringKey"];
      v137 = [v323 calendar];
      LODWORD(v136) = [v137 sharingStatus] == 2;

      if (v136) {
        [(MapsSuggestionsEntry *)v111 setBoolean:1 forKey:@"MapsSuggestionsCalendarIsSharedToMeKey"];
      }
      v318 = [v324 title];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v318 length])
      {
        id v138 = v318;
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        *(void *)&buf[24] = __Block_byref_object_copy__4;
        *(void *)&buf[32] = __Block_byref_object_dispose__4;
        id v365 = 0;
        *(void *)&long long v354 = MEMORY[0x1E4F143A8];
        *((void *)&v354 + 1) = 3221225472;
        *(void *)&long long v355 = ___firstLineOfString_block_invoke;
        *((void *)&v355 + 1) = &unk_1E5CB8B80;
        *(void *)&long long v356 = buf;
        [v138 enumerateLinesUsingBlock:&v354];
        id v139 = *(id *)(*(void *)&buf[8] + 40);
        _Block_object_dispose(buf, 8);

        [(MapsSuggestionsEntry *)v111 setString:v139 forKey:@"MapsSuggestionsEntryTitleNameKey"];
        GEOFindOrCreateLog();
        v140 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v138;
          _os_log_impl(&dword_1A70DF000, v140, OS_LOG_TYPE_DEBUG, "About to process entry with name %@.", buf, 0xCu);
        }
      }
      switch([(MapsSuggestionsEntry *)v111 type])
      {
        case 3:
          if (-[MapsSuggestionsEventKit _addCalendarEventFieldsToEntry:event:](v111, v323)) {
            goto LABEL_192;
          }
          goto LABEL_279;
        case 8:
          v170 = v111;
          id v310 = v321;
          v304 = v323;
          v144 = v170;
          if ([(MapsSuggestionsEntry *)v170 type] != 8)
          {
            v194 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v194, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 627;
              *(_WORD *)&buf[18] = 2082;
              *(void *)&buf[20] = "-[MapsSuggestionsEventKit _addRestaurantReservationFieldsToEntry:fromSchemaOrgDictionary:event:]";
              *(_WORD *)&buf[28] = 2082;
              *(void *)&buf[30] = "entry.type != MapsSuggestionsEntryTypeRestaurantReservation";
              _os_log_impl(&dword_1A70DF000, v194, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Entry needs to be of type MapsSuggestionsEntryTypeRestaurantReservation", buf, 0x26u);
            }

            goto LABEL_279;
          }
          GEOConfigGetDouble();
          -[MapsSuggestionsEntry setWeight:](v170, "setWeight:");
          v171 = [v304 endDate];
          GEOConfigGetDouble();
          v172 = objc_msgSend(v171, "dateByAddingTimeInterval:");
          [(MapsSuggestionsEntry *)v144 setExpires:v172];

          v173 = [v310 objectForKeyedSubscript:@"reservationId"];
          v174 = v173;
          if (v173)
          {
            id v298 = v173;
          }
          else
          {
            v199 = [v304 suggestionInfo];
            id v298 = [v199 uniqueKey];
          }
          [(MapsSuggestionsEntry *)v144 setString:v298 forKey:@"MapsSuggestionsReservationsBookingIDKey"];
          if (v298) {
            [(MapsSuggestionsEntry *)v144 setString:@"MapsSuggestionsReservationsBookingIDKey" forKey:@"MapsSuggestionsPrimaryKey"];
          }
          v200 = [v310 objectForKeyedSubscript:@"partySize"];
          [(MapsSuggestionsEntry *)v144 setNumber:v200 forKey:@"MapsSuggestionsReservationsPartySizeKey"];

          v290 = [v310 objectForKeyedSubscript:@"reservationStatus"];
          v201 = [v310 objectForKeyedSubscript:@"reservationFor"];
          v294 = [v201 objectForKeyedSubscript:@"name"];

          if ([v294 length])
          {
            v202 = v294;
            goto LABEL_339;
          }
          v203 = v304;
          v288 = v203;
          if (!v49)
          {
            v234 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v234, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A70DF000, v234, OS_LOG_TYPE_DEBUG, "No Event", buf, 2u);
            }
LABEL_336:

            goto LABEL_337;
          }
          v204 = [v203 preferredLocationWithoutPrediction];
          v205 = [v204 geoLocation];
          if (v205)
          {
            v206 = [v288 preferredLocationWithoutPrediction];
            v207 = [v206 geoLocation];
            [v207 coordinate];
            BOOL v208 = CLLocationCoordinate2DIsValid(v370);

            if (v208)
            {
              v209 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v209, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A70DF000, v209, OS_LOG_TYPE_DEBUG, "Using Event's preferredLocationWithoutPrediction", buf, 2u);
              }

              uint64_t v210 = [v288 preferredLocationWithoutPrediction];
LABEL_335:
              v273 = (void *)v210;
              goto LABEL_338;
            }
          }
          else
          {
          }
          v261 = [v288 preferredLocation];
          v262 = [v261 geoLocation];
          if (v262)
          {
            v263 = [v288 preferredLocation];
            v264 = [v263 geoLocation];
            [v264 coordinate];
            BOOL v265 = CLLocationCoordinate2DIsValid(v371);

            if (v265)
            {
              v266 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v266, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A70DF000, v266, OS_LOG_TYPE_DEBUG, "Using Event's preferredLocation", buf, 2u);
              }

              uint64_t v210 = [v288 preferredLocation];
              goto LABEL_335;
            }
          }
          else
          {
          }
          v234 = [v288 structuredLocation];
          v268 = [v234 geoLocation];
          if (!v268) {
            goto LABEL_336;
          }
          v269 = [v288 structuredLocation];
          v270 = [v269 geoLocation];
          [v270 coordinate];
          BOOL v271 = CLLocationCoordinate2DIsValid(v372);

          if (v271)
          {
            v272 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v272, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A70DF000, v272, OS_LOG_TYPE_DEBUG, "Using Event's structuredLocation", buf, 2u);
            }

            uint64_t v210 = [v288 structuredLocation];
            goto LABEL_335;
          }
LABEL_337:
          v273 = 0;
LABEL_338:

          uint64_t v274 = [v273 title];

          v202 = (void *)v274;
LABEL_339:
          v275 = v202;
          uint64_t v276 = [v202 length];
          if (v276)
          {
            [(MapsSuggestionsEntry *)v144 setTitle:v275];
            id v277 = v290;
            if ([v277 isEqualToString:@"http://schema.org/ReservationConfirmed"])
            {
              uint64_t v278 = 1;
            }
            else if ([v277 isEqualToString:@"http://schema.org/ReservationCancelled"])
            {
              uint64_t v278 = 2;
            }
            else if ([v277 isEqualToString:@"http://schema.org/ReservationPending"])
            {
              uint64_t v278 = 3;
            }
            else
            {
              uint64_t v278 = 0;
            }

            [(MapsSuggestionsEntry *)v144 setInteger:v278 forKey:@"MapsSuggestionsReservationsStatusKey"];
          }
          else
          {
            v279 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v279, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 650;
              *(_WORD *)&buf[18] = 2082;
              *(void *)&buf[20] = "-[MapsSuggestionsEventKit _addRestaurantReservationFieldsToEntry:fromSchemaOrgDictionary:event:]";
              *(_WORD *)&buf[28] = 2082;
              *(void *)&buf[30] = "name.length == 0u";
              _os_log_impl(&dword_1A70DF000, v279, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Entry does not have name in either schema.org dictionary or in the event object", buf, 0x26u);
            }
          }
          if (v276) {
            goto LABEL_282;
          }
          goto LABEL_279;
        case 13:
          v142 = v111;
          id v143 = v321;
          v302 = v323;
          v144 = v142;
          uint64_t v308 = [(MapsSuggestionsEntry *)v142 type];
          if (v308 == 13)
          {
            v145 = [v302 endDate];
            GEOConfigGetDouble();
            v146 = objc_msgSend(v145, "dateByAddingTimeInterval:");
            [(MapsSuggestionsEntry *)v144 setExpires:v146];

            GEOConfigGetDouble();
            -[MapsSuggestionsEntry setWeight:](v144, "setWeight:");
            v296 = v144;
            id v147 = v143;
            v148 = [v147 objectForKeyedSubscript:@"checkinTime"];
            if (v148)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v292 = MapsSuggestionsDateFromString(v148);
                v149 = GEOFindOrCreateLog();
                v150 = v149;
                if (v292)
                {
                  if (os_log_type_enabled(v149, OS_LOG_TYPE_DEBUG))
                  {
                    v151 = [v147 objectForKeyedSubscript:@"checkinTime"];
                    *(_DWORD *)buf = 138412546;
                    *(void *)&buf[4] = @"checkinTime";
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v151;
                    _os_log_impl(&dword_1A70DF000, v150, OS_LOG_TYPE_DEBUG, "%@ time from schema is %@", buf, 0x16u);
                  }
                  [(MapsSuggestionsEntry *)v296 setDate:v292 forKey:@"MapsSuggestionsScheduledTimeKey"];
                }
                else
                {
                  if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&buf[4] = @"checkinTime";
                    _os_log_impl(&dword_1A70DF000, v150, OS_LOG_TYPE_ERROR, "Could not parse date '%@'", buf, 0xCu);
                  }
                  v292 = v150;
                }
              }
            }

            v190 = v296;
            id v235 = v147;
            v236 = [v235 objectForKeyedSubscript:@"checkoutTime"];
            if (v236)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v300 = MapsSuggestionsDateFromString(v236);
                v237 = GEOFindOrCreateLog();
                v238 = v237;
                if (v300)
                {
                  if (os_log_type_enabled(v237, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v239 = [v235 objectForKeyedSubscript:@"checkoutTime"];
                    *(_DWORD *)buf = 138412546;
                    *(void *)&buf[4] = @"checkoutTime";
                    *(_WORD *)&buf[12] = 2112;
                    v295 = (void *)v239;
                    *(void *)&buf[14] = v239;
                    _os_log_impl(&dword_1A70DF000, v238, OS_LOG_TYPE_DEBUG, "%@ time from schema is %@", buf, 0x16u);
                  }
                  [v190 setDate:v300 forKey:@"MapsSuggestionsScheduledEndTimeKey"];
                }
                else
                {
                  if (os_log_type_enabled(v237, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&buf[4] = @"checkoutTime";
                    _os_log_impl(&dword_1A70DF000, v238, OS_LOG_TYPE_ERROR, "Could not parse date '%@'", buf, 0xCu);
                  }
                  v300 = v238;
                }
              }
            }
          }
          else
          {
            v190 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 397;
              *(_WORD *)&buf[18] = 2082;
              *(void *)&buf[20] = "-[MapsSuggestionsEventKit _addHotelFieldsToEntry:fromSchemaOrgDictionary:event:]";
              *(_WORD *)&buf[28] = 2082;
              *(void *)&buf[30] = "entry.type != MapsSuggestionsEntryTypeHotel";
              _os_log_impl(&dword_1A70DF000, v190, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Entry needs to be of type MapsSuggestionsEntryTypeHotel", buf, 0x26u);
            }
          }
          BOOL v233 = v308 == 13;

          goto LABEL_278;
        case 14:
          v152 = v111;
          v153 = v323;
          if ([(MapsSuggestionsEntry *)v152 type] == 14)
          {
            v309 = [v153 customObjectForKey:@"SGEventMetadataKey"];
            if (!v309)
            {
              v191 = GEOFindOrCreateLog();
              if (!os_log_type_enabled(v191, OS_LOG_TYPE_ERROR)) {
                goto LABEL_215;
              }
              *(_WORD *)buf = 0;
              v197 = v191;
              v198 = "Suggestions custom object is nil. Returning.";
LABEL_231:
              _os_log_impl(&dword_1A70DF000, v197, OS_LOG_TYPE_ERROR, v198, buf, 2u);
              goto LABEL_215;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v191 = GEOFindOrCreateLog();
              if (!os_log_type_enabled(v191, OS_LOG_TYPE_ERROR)) {
                goto LABEL_215;
              }
              *(_WORD *)buf = 0;
              v197 = v191;
              v198 = "Suggestions custom object is not an NSDictionary. Returning.";
              goto LABEL_231;
            }
            v303 = [v309 objectForKeyedSubscript:@"SGEventMetadataCategoryDescriptionKey"];
            GEOConfigGetDouble();
            -[MapsSuggestionsEntry setWeight:](v152, "setWeight:");
            v175 = [v153 startDate];
            [(MapsSuggestionsEntry *)v152 setDate:v175 forKey:@"MapsSuggestionsScheduledTimeKey"];

            v176 = [v153 endDate];
            [(MapsSuggestionsEntry *)v152 setDate:v176 forKey:@"MapsSuggestionsScheduledEndTimeKey"];

            v177 = [v153 endDate];
            [(MapsSuggestionsEntry *)v152 setExpires:v177];

            uint64_t v178 = [v303 isEqualToString:@"CarRentalPickup"];
            if ((v178 & 1) != 0
              || [v303 isEqualToString:@"CarRentalDropoff"])
            {
              [(MapsSuggestionsEntry *)v152 setBoolean:v178 forKey:@"MapsSuggestionsCalendarCarRentalIsPickupDayKey"];
              goto LABEL_191;
            }
            v267 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v267, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A70DF000, v267, OS_LOG_TYPE_DEBUG, "Neither pickup nor drop off, not processing as a Car Rental entry. Returning NO.", buf, 2u);
            }

            v191 = v303;
LABEL_215:
          }
          else
          {
            v195 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 411;
              *(_WORD *)&buf[18] = 2082;
              *(void *)&buf[20] = "-[MapsSuggestionsEventKit _addCarRentalFieldsToEntry:event:]";
              *(_WORD *)&buf[28] = 2082;
              *(void *)&buf[30] = "entry.type != MapsSuggestionsEntryTypeCarRental";
              _os_log_impl(&dword_1A70DF000, v195, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Entry needs to be of type MapsSuggestionsEntryTypeCarRental", buf, 0x26u);
            }
          }
LABEL_279:
          GEOFindOrCreateLog();
          v240 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v240, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A70DF000, v240, OS_LOG_TYPE_DEBUG, "Changing type of the entry to MapsSuggestionsEntryTypeCalendarEvent", buf, 2u);
          }

          v241 = [MapsSuggestionsEntry alloc];
          v242 = [(MapsSuggestionsEntry *)v111 title];
          uint64_t v243 = [(MapsSuggestionsEntry *)v241 initWithType:3 title:v242];

          [(id)v243 mergeFromSuggestionEntry:v111 behavior:0];
          v144 = (MapsSuggestionsEntry *)(id)v243;

          LOBYTE(v243) = -[MapsSuggestionsEventKit _addCalendarEventFieldsToEntry:event:](v144, v323);
          if (v243) {
            goto LABEL_282;
          }
          GEOFindOrCreateLog();
          v168 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v321;
            _os_log_impl(&dword_1A70DF000, v168, OS_LOG_TYPE_ERROR, "This should never happen. Continue - unusable Schema.org dictionary %@ AND bad event data to construct a sensible Calendar Event entry", buf, 0xCu);
          }
          goto LABEL_299;
        case 15:
          v179 = v111;
          id v293 = v321;
          v305 = v323;
          v144 = v179;
          if ([(MapsSuggestionsEntry *)v179 type] != 15)
          {
            v196 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v196, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 300;
              *(_WORD *)&buf[18] = 2082;
              *(void *)&buf[20] = "-[MapsSuggestionsEventKit _addTravelFlightFieldsToEntry:fromSchemaOrgDictionary:event:]";
              *(_WORD *)&buf[28] = 2082;
              *(void *)&buf[30] = "entry.type != MapsSuggestionsEntryTypeTravelFlight";
              _os_log_impl(&dword_1A70DF000, v196, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Entry needs to be of type MapsSuggestionsEntryTypeTravelFlight", buf, 0x26u);
            }

            goto LABEL_279;
          }
          v180 = [v305 startDate];
          GEOConfigGetDouble();
          v181 = objc_msgSend(v180, "dateByAddingTimeInterval:");
          [(MapsSuggestionsEntry *)v144 setExpires:v181];

          GEOConfigGetDouble();
          -[MapsSuggestionsEntry setWeight:](v144, "setWeight:");
          v182 = [v305 startDate];
          [(MapsSuggestionsEntry *)v144 setDate:v182 forKey:@"MapsSuggestionsFlightDepartureTimeKey"];

          v311 = [v293 objectForKeyedSubscript:@"reservationFor"];
          v183 = [v311 objectForKeyedSubscript:@"flightNumber"];
          v184 = (void *)MEMORY[0x1E4F28B88];
          id v299 = v183;
          v185 = [v184 letterCharacterSet];
          uint64_t v186 = [v299 rangeOfCharacterFromSet:v185];

          if (v186 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v187 = [v311 objectForKeyedSubscript:@"airlineCode"];
            v188 = v187;
            if (v187)
            {
              id v189 = v187;
            }
            else
            {
              v211 = [v311 objectForKeyedSubscript:@"airline"];
              id v189 = [v211 objectForKeyedSubscript:@"iataCode"];
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v189 length])
            {
              uint64_t v212 = [[NSString alloc] initWithFormat:@"%@%@", v189, v299, v287];

              id v299 = (id)v212;
            }
          }
          [(MapsSuggestionsEntry *)v144 setString:v299 forKey:@"MapsSuggestionsFullFlightNumberKey"];
          v291 = [v311 objectForKey:@"departureAirportCode"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v291 length])
          {
            id v213 = v291;
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            *(void *)&buf[24] = __Block_byref_object_copy__4;
            *(void *)&buf[32] = __Block_byref_object_dispose__4;
            id v365 = 0;
            *(void *)&long long v354 = MEMORY[0x1E4F143A8];
            *((void *)&v354 + 1) = 3221225472;
            *(void *)&long long v355 = ___firstLineOfString_block_invoke;
            *((void *)&v355 + 1) = &unk_1E5CB8B80;
            *(void *)&long long v356 = buf;
            [v213 enumerateLinesUsingBlock:&v354];
            id v214 = *(id *)(*(void *)&buf[8] + 40);
            _Block_object_dispose(buf, 8);

            [(MapsSuggestionsEntry *)v144 setString:v214 forKey:@"MapsSuggestionsEntryTitleNameKey"];
            id v215 = v213;
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            *(void *)&buf[24] = __Block_byref_object_copy__4;
            *(void *)&buf[32] = __Block_byref_object_dispose__4;
            id v365 = 0;
            *(void *)&long long v354 = MEMORY[0x1E4F143A8];
            *((void *)&v354 + 1) = 3221225472;
            *(void *)&long long v355 = ___firstLineOfString_block_invoke;
            *((void *)&v355 + 1) = &unk_1E5CB8B80;
            *(void *)&long long v356 = buf;
            [v215 enumerateLinesUsingBlock:&v354];
            id v216 = *(id *)(*(void *)&buf[8] + 40);
            _Block_object_dispose(buf, 8);

            [(MapsSuggestionsEntry *)v144 setString:v216 forKey:@"MapsSuggestionsFlightDepartureAirportCodeKey"];
          }
          v289 = [v311 objectForKey:@"arrivalAirportCode"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v289 length])
          {
            id v217 = v289;
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            *(void *)&buf[24] = __Block_byref_object_copy__4;
            *(void *)&buf[32] = __Block_byref_object_dispose__4;
            id v365 = 0;
            *(void *)&long long v354 = MEMORY[0x1E4F143A8];
            *((void *)&v354 + 1) = 3221225472;
            *(void *)&long long v355 = ___firstLineOfString_block_invoke;
            *((void *)&v355 + 1) = &unk_1E5CB8B80;
            *(void *)&long long v356 = buf;
            [v217 enumerateLinesUsingBlock:&v354];
            id v218 = *(id *)(*(void *)&buf[8] + 40);
            _Block_object_dispose(buf, 8);

            [(MapsSuggestionsEntry *)v144 setString:v218 forKey:@"MapsSuggestionsFlightArrivalAirportCodeKey"];
          }
          v219 = [v311 objectForKey:@"departureAirport"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v220 = [v219 objectForKey:@"iataCode"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v220 length])
            {
              id v221 = v220;
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x3032000000;
              *(void *)&buf[24] = __Block_byref_object_copy__4;
              *(void *)&buf[32] = __Block_byref_object_dispose__4;
              id v365 = 0;
              *(void *)&long long v354 = MEMORY[0x1E4F143A8];
              *((void *)&v354 + 1) = 3221225472;
              *(void *)&long long v355 = ___firstLineOfString_block_invoke;
              *((void *)&v355 + 1) = &unk_1E5CB8B80;
              *(void *)&long long v356 = buf;
              [v221 enumerateLinesUsingBlock:&v354];
              id v222 = *(id *)(*(void *)&buf[8] + 40);
              _Block_object_dispose(buf, 8);

              [(MapsSuggestionsEntry *)v144 setString:v222 forKey:@"MapsSuggestionsEntryTitleNameKey"];
              id v223 = v221;
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x3032000000;
              *(void *)&buf[24] = __Block_byref_object_copy__4;
              *(void *)&buf[32] = __Block_byref_object_dispose__4;
              id v365 = 0;
              *(void *)&long long v354 = MEMORY[0x1E4F143A8];
              *((void *)&v354 + 1) = 3221225472;
              *(void *)&long long v355 = ___firstLineOfString_block_invoke;
              *((void *)&v355 + 1) = &unk_1E5CB8B80;
              *(void *)&long long v356 = buf;
              [v223 enumerateLinesUsingBlock:&v354];
              id v224 = *(id *)(*(void *)&buf[8] + 40);
              _Block_object_dispose(buf, 8);

              [(MapsSuggestionsEntry *)v144 setString:v224 forKey:@"MapsSuggestionsFlightDepartureAirportCodeKey"];
            }
          }
          v225 = [v311 objectForKey:@"arrivalAirport"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v226 = [v225 objectForKeyedSubscript:@"iataCode"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v226 length])
            {
              id v227 = v226;
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x3032000000;
              *(void *)&buf[24] = __Block_byref_object_copy__4;
              *(void *)&buf[32] = __Block_byref_object_dispose__4;
              id v365 = 0;
              *(void *)&long long v354 = MEMORY[0x1E4F143A8];
              *((void *)&v354 + 1) = 3221225472;
              *(void *)&long long v355 = ___firstLineOfString_block_invoke;
              *((void *)&v355 + 1) = &unk_1E5CB8B80;
              *(void *)&long long v356 = buf;
              [v227 enumerateLinesUsingBlock:&v354];
              id v228 = *(id *)(*(void *)&buf[8] + 40);
              _Block_object_dispose(buf, 8);

              [(MapsSuggestionsEntry *)v144 setString:v228 forKey:@"MapsSuggestionsFlightArrivalAirportCodeKey"];
            }
          }
          if ([(MapsSuggestionsEntry *)v144 containsKey:@"MapsSuggestionsFlightArrivalAirportCodeKey"])
          {
            v229 = dispatch_group_create();
            dispatch_group_enter(v229);
            v230 = *(void **)(a1 + 24);
            v358[0] = MEMORY[0x1E4F143A8];
            v358[1] = 3221225472;
            v359[0] = __87__MapsSuggestionsEventKit__addTravelFlightFieldsToEntry_fromSchemaOrgDictionary_event___block_invoke;
            v359[1] = &unk_1E5CB8A70;
            v360 = v229;
            v231 = v229;
            MapsSuggestionsSetArrivalAirportFieldsForEntry(v144, v230, v358);
            dispatch_group_wait(v231, 0xFFFFFFFFFFFFFFFFLL);
            char v361 = 1;
          }
          else
          {
            v232 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v232, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A70DF000, v232, OS_LOG_TYPE_INFO, "Did not find arrival airport information in flight schema. Returning what we have.", buf, 2u);
            }

            char v361 = 1;
          }

          BOOL v233 = v361;
LABEL_278:
          if (!v233) {
            goto LABEL_279;
          }
          goto LABEL_282;
        case 16:
          v152 = v111;
          v153 = v321;
          v309 = v323;
          if ([(MapsSuggestionsEntry *)v152 type] != 16)
          {
            v191 = GEOFindOrCreateLog();
            if (!os_log_type_enabled(v191, OS_LOG_TYPE_ERROR)) {
              goto LABEL_215;
            }
            *(_DWORD *)buf = 136446978;
            *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 453;
            *(_WORD *)&buf[18] = 2082;
            *(void *)&buf[20] = "-[MapsSuggestionsEventKit _addTicketedEventFieldsToEntry:fromSchemaOrgDictionary:event:]";
            *(_WORD *)&buf[28] = 2082;
            *(void *)&buf[30] = "entry.type != MapsSuggestionsEntryTypeTicketedEvent";
            v192 = v191;
            v193 = "At %{public}s:%d, %{public}s forbids: %{public}s. Entry needs to be of type MapsSuggestionsEntryTypeTicketedEvent";
LABEL_214:
            _os_log_impl(&dword_1A70DF000, v192, OS_LOG_TYPE_ERROR, v193, buf, 0x26u);
            goto LABEL_215;
          }
          if (!v153)
          {
            v191 = GEOFindOrCreateLog();
            if (!os_log_type_enabled(v191, OS_LOG_TYPE_ERROR)) {
              goto LABEL_215;
            }
            *(_DWORD *)buf = 136446978;
            *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 454;
            *(_WORD *)&buf[18] = 2082;
            *(void *)&buf[20] = "-[MapsSuggestionsEventKit _addTicketedEventFieldsToEntry:fromSchemaOrgDictionary:event:]";
            *(_WORD *)&buf[28] = 2082;
            *(void *)&buf[30] = "schema == nil";
            v192 = v191;
            v193 = "At %{public}s:%d, %{public}s forbids: %{public}s. Schema dictionary cannot be nil";
            goto LABEL_214;
          }
          v154 = [v309 endDate];
          GEOConfigGetDouble();
          v155 = objc_msgSend(v154, "dateByAddingTimeInterval:");
          [(MapsSuggestionsEntry *)v152 setExpires:v155];

          GEOConfigGetDouble();
          -[MapsSuggestionsEntry setWeight:](v152, "setWeight:");
          v156 = [v309 startDate];
          [(MapsSuggestionsEntry *)v152 setDate:v156 forKey:@"MapsSuggestionsCalendarTicketedEventShowTimeKey"];

          v157 = [v309 title];
          [(MapsSuggestionsEntry *)v152 setString:v157 forKey:@"MapsSuggestionsCalendarTicketedEventNameKey"];

          v303 = objc_opt_new();
          v158 = [v153 objectForKeyedSubscript:@"reservedTicket"];
          v159 = [v158 objectForKeyedSubscript:@"ticketedSeat"];

          v297 = [v159 objectForKeyedSubscript:@"seatSection"];
          if (v297)
          {
            v160 = MapsSuggestionsLocalizedTicketedEvent_SectionString(v297);
            [v303 addObject:v160];
          }
          v161 = [v159 objectForKeyedSubscript:@"seatRow"];
          v162 = v161;
          if (v161)
          {
            v163 = MapsSuggestionsLocalizedTicketedEvent_SeatRowString(v161);
            [v303 addObject:v163];
          }
          v164 = [v159 objectForKeyedSubscript:@"seatNumber"];
          v165 = v164;
          if (v164)
          {
            v166 = MapsSuggestionsLocalizedTicketedEvent_SeatNumberString(v164);
            [v303 addObject:v166];
          }
          v167 = [v303 componentsJoinedByString:@", "];
          [(MapsSuggestionsEntry *)v152 setString:v167 forKey:@"MapsSuggestionsCalendarTicketedEventSeatDetailsKey"];

LABEL_191:
LABEL_192:
          v144 = v111;
LABEL_282:
          if (a4)
          {
            v168 = [v324 mapKitHandle];
            GEOFindOrCreateLog();
            v244 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
            {
              v245 = [(id)a1 uniqueName];
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v245;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "_q_createEntriesWithinPeriod_MapItem";
              _os_log_impl(&dword_1A70DF000, v244, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
            }
            v246 = GEOFindOrCreateLog();
            if (os_signpost_enabled(v246))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1A70DF000, v246, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_MapItem", "", buf, 2u);
            }

            if (v168)
            {
              id v247 = [*(id *)(a1 + 56) objectForKeyedSubscript:v168];
              v248 = [*(id *)(a1 + 64) objectForKeyedSubscript:v168];
              uint64_t v249 = [v248 integerValue];

              if (v247)
              {
                v250 = [NSNumber numberWithInteger:v249];
                [(MapsSuggestionsEntry *)v144 setNumber:v250 forKey:@"MapsSuggestionsGEOMapItemOriginKey"];

                [(MapsSuggestionsEntry *)v144 setGeoMapItem:v247];
                [v312 addObject:v144];
                [v301 removeObject:v168];
                GEOFindOrCreateLog();
                v251 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v251, OS_LOG_TYPE_DEBUG))
                {
                  v252 = [(id)a1 uniqueName];
                  *(_DWORD *)buf = 138412546;
                  *(void *)&buf[4] = v252;
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "_q_createEntriesWithinPeriod_MapItem";
                  _os_log_impl(&dword_1A70DF000, v251, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
                }
                v253 = GEOFindOrCreateLog();
                if (os_signpost_enabled(v253))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_1A70DF000, v253, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_MapItem", "", buf, 2u);
                }
                int v169 = 35;
LABEL_315:

                goto LABEL_316;
              }
LABEL_309:
              v256 = 0;
            }
            else
            {
              GEOFindOrCreateLog();
              v254 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v254, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A70DF000, v254, OS_LOG_TYPE_DEBUG, "We have no MapItemHandle for this Event", buf, 2u);
              }

              if (![(MapsSuggestionsEntry *)v144 containsKey:@"MapsSuggestionsDestinationAddressKey"]|| ![(MapsSuggestionsEntry *)v144 containsKey:@"MapsSuggestionsLatitudeKey"]|| ![(MapsSuggestionsEntry *)v144 containsKey:@"MapsSuggestionsLongitudeKey"])
              {
                id v247 = 0;
                goto LABEL_309;
              }
              GEOFindOrCreateLog();
              v255 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v255, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A70DF000, v255, OS_LOG_TYPE_DEBUG, "Entry has address, removing lat/long", buf, 2u);
              }

              id v247 = [(MapsSuggestionsEntry *)v144 numberForKey:@"MapsSuggestionsLatitudeKey"];
              v256 = [(MapsSuggestionsEntry *)v144 numberForKey:@"MapsSuggestionsLongitudeKey"];
            }
            [(MapsSuggestionsEntry *)v144 setMapItemHandleData:v168];
            GEOFindOrCreateLog();
            v257 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v257, OS_LOG_TYPE_DEBUG))
            {
              v258 = [(id)a1 uniqueName];
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v258;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "_q_createEntriesWithinPeriod_MapItem_Download";
              _os_log_impl(&dword_1A70DF000, v257, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
            }
            v259 = GEOFindOrCreateLog();
            if (os_signpost_enabled(v259))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1A70DF000, v259, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_MapItem_Download", "", buf, 2u);
            }

            dispatch_group_enter(group);
            v260 = *(NSObject **)(a1 + 8);
            v334[0] = MEMORY[0x1E4F143A8];
            v334[1] = 3221225472;
            v334[2] = __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_404;
            v334[3] = &unk_1E5CB8B10;
            objc_copyWeak(&v342, &location);
            v335 = v144;
            v336 = v323;
            v337 = group;
            id v247 = v247;
            id v338 = v247;
            v253 = v256;
            v339 = v253;
            id v340 = v312;
            v341 = v168;
            dispatch_async(v260, v334);

            objc_destroyWeak(&v342);
            int v169 = 0;
            goto LABEL_315;
          }
          [v312 addObject:v144];
          GEOFindOrCreateLog();
          v168 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v168, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A70DF000, v168, OS_LOG_TYPE_INFO, "Skipping fetching the mapItems because fetchMapItems == NO", buf, 2u);
          }
LABEL_299:

          int v169 = 35;
LABEL_316:
          v111 = v144;
LABEL_317:

          if (v169 && v169 != 35)
          {

            goto LABEL_359;
          }
          break;
        default:
          if ([(MapsSuggestionsEntry *)v111 type] == -1000000) {
            goto LABEL_279;
          }
          v168 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 937;
            *(_WORD *)&buf[18] = 2082;
            *(void *)&buf[20] = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]";
            *(_WORD *)&buf[28] = 2082;
            *(void *)&buf[30] = "entry.type + 1000000L";
            _os_log_impl(&dword_1A70DF000, v168, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. How can we get here? That's not a type MSgEventKit can produce!", buf, 0x26u);
          }
          int v169 = 1;
          goto LABEL_317;
      }
    }
    uint64_t v41 = [obj countByEnumeratingWithState:&v343 objects:v363 count:16];
  }
  while (v41);
LABEL_354:

  v280 = *(NSObject **)(a1 + 8);
  v329[0] = MEMORY[0x1E4F143A8];
  v329[1] = 3221225472;
  v329[2] = __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_409;
  v329[3] = &unk_1E5CB8B58;
  objc_copyWeak(&v333, &location);
  id v281 = v312;
  id v330 = v281;
  id v282 = v317;
  id v332 = v282;
  id v331 = v301;
  dispatch_group_notify(group, v280, v329);
  if ((a4 & 1) == 0)
  {
    GEOFindOrCreateLog();
    v283 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v283, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromMapsSuggestionsEntries(v281);
      id v284 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v284;
      _os_log_impl(&dword_1A70DF000, v283, OS_LOG_TYPE_DEBUG, "fetchMapItems == NO. Sending %@", buf, 0xCu);
    }
    (*((void (**)(id, id, void))v282 + 2))(v282, v281, 0);
  }

  objc_destroyWeak(&v333);
LABEL_359:

LABEL_363:
LABEL_364:
  objc_destroyWeak(&location);
LABEL_365:
}

void __44__MapsSuggestionsEventKit_registerObserver___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v3 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained[2] startListeningForChanges];
    }
    else
    {
      GEOFindOrCreateLog();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136446722;
        v6 = "MapsSuggestionsEventKit.m";
        __int16 v7 = 1026;
        int v8 = 245;
        __int16 v9 = 2082;
        __int16 v10 = "-[MapsSuggestionsEventKit registerObserver:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }
    }
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  observers = self->_observers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__MapsSuggestionsEventKit_registerObserver___block_invoke;
  v6[3] = &unk_1E5CB8A48;
  objc_copyWeak(&v7, &location);
  [(MapsSuggestionsObservers *)observers registerObserver:v4 handler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (MapsSuggestionsEventKit)initWithConnector:(id)a3 network:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = v8;
  if (!v7)
  {
    __int16 v29 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
      __int16 v35 = 1024;
      int v36 = 113;
      __int16 v37 = 2082;
      v38 = "-[MapsSuggestionsEventKit initWithConnector:network:]";
      __int16 v39 = 2082;
      v40 = "nil == (connector)";
      _os_log_impl(&dword_1A70DF000, v29, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an EventKitConnector", location, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v8)
  {
    __int16 v29 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
      __int16 v35 = 1024;
      int v36 = 114;
      __int16 v37 = 2082;
      v38 = "-[MapsSuggestionsEventKit initWithConnector:network:]";
      __int16 v39 = 2082;
      v40 = "nil == (network)";
      _os_log_impl(&dword_1A70DF000, v29, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a NetworkRequester", location, 0x26u);
    }
LABEL_11:

    v28 = 0;
    goto LABEL_12;
  }
  v33.receiver = self;
  v33.super_class = (Class)MapsSuggestionsEventKit;
  __int16 v10 = [(MapsSuggestionsEventKit *)&v33 init];
  if (v10)
  {
    uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("MapsSuggestionsEventKitQueue", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_connector, a3);
    [(MapsSuggestionsEventKitConnector *)v10->_connector setDelegate:v10];
    objc_storeStrong((id *)&v10->_network, a4);
    id v14 = [[MapsSuggestionsObservers alloc] initWithCallbackQueue:v10->_queue name:@"MapsSuggestionsEventKitObservers"];
    observers = v10->_observers;
    v10->_observers = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    handleToMapItemMapping = v10->_handleToMapItemMapping;
    v10->_handleToMapItemMapping = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    handleToMapItemOriginMapping = v10->_handleToMapItemOriginMapping;
    v10->_handleToMapItemOriginMapping = v18;

    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"http://schema.org/Event", @"http://schema.org/SocialEvent", @"http://schema.org/MovieShowing", 0);
    setOfEventReservationSubtypes = v10->_setOfEventReservationSubtypes;
    v10->_setOfEventReservationSubtypes = (NSSet *)v20;

    objc_initWeak((id *)location, v10);
    id v22 = [MapsSuggestionsCanKicker alloc];
    GEOConfigGetDouble();
    double v24 = v23;
    id v25 = v10->_queue;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __53__MapsSuggestionsEventKit_initWithConnector_network___block_invoke;
    v31[3] = &unk_1E5CB8058;
    objc_copyWeak(&v32, (id *)location);
    uint64_t v26 = [(MapsSuggestionsCanKicker *)v22 initWithName:@"MapsSuggestionsEventKitChangedNotificationCanKicker" time:v25 queue:v31 block:v24];
    changedNotificationCanKicker = v10->_changedNotificationCanKicker;
    v10->_changedNotificationCanKicker = (MapsSuggestionsCanKicker *)v26;

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)location);
  }
  self = v10;
  v28 = self;
LABEL_12:

  return v28;
}

void __53__MapsSuggestionsEventKit_initWithConnector_network___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = GEOFindOrCreateLog();
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Acting on one or more change notifications from EventStore", buf, 2u);
    }

    int v5 = (void *)WeakRetained[4];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__MapsSuggestionsEventKit_initWithConnector_network___block_invoke_330;
    v7[3] = &unk_1E5CB89F8;
    objc_copyWeak(&v8, v1);
    [v5 callBlock:v7];
    objc_destroyWeak(&v8);
  }
  else
  {
    v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v10 = "MapsSuggestionsEventKit.m";
      __int16 v11 = 1026;
      int v12 = 133;
      __int16 v13 = 2082;
      id v14 = "-[MapsSuggestionsEventKit initWithConnector:network:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __53__MapsSuggestionsEventKit_initWithConnector_network___block_invoke_330(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [v3 eventKitDidChange:WeakRetained];
  }
  else
  {
    GEOFindOrCreateLog();
    int v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsEventKit.m";
      __int16 v8 = 1026;
      int v9 = 136;
      __int16 v10 = 2082;
      __int16 v11 = "-[MapsSuggestionsEventKit initWithConnector:network:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelfCall went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (id)initFromResourceDepot:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = v4;
  if (!v4)
  {
    __int16 v11 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v14 = 136446978;
    uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
    __int16 v16 = 1024;
    int v17 = 146;
    __int16 v18 = 2082;
    id v19 = "-[MapsSuggestionsEventKit initFromResourceDepot:]";
    __int16 v20 = 2082;
    uint64_t v21 = "nil == (resourceDepot)";
    uint64_t v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!";
LABEL_11:
    _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 0x26u);
    goto LABEL_12;
  }
  int v6 = [v4 oneEventKitConnector];

  if (!v6)
  {
    __int16 v11 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v14 = 136446978;
    uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
    __int16 v16 = 1024;
    int v17 = 147;
    __int16 v18 = 2082;
    id v19 = "-[MapsSuggestionsEventKit initFromResourceDepot:]";
    __int16 v20 = 2082;
    uint64_t v21 = "nil == (resourceDepot.oneEventKitConnector)";
    uint64_t v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One EventKitConnector!";
    goto LABEL_11;
  }
  id v7 = [v5 oneNetworkRequester];

  if (!v7)
  {
    __int16 v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446978;
      uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
      __int16 v16 = 1024;
      int v17 = 148;
      __int16 v18 = 2082;
      id v19 = "-[MapsSuggestionsEventKit initFromResourceDepot:]";
      __int16 v20 = 2082;
      uint64_t v21 = "nil == (resourceDepot.oneNetworkRequester)";
      uint64_t v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One Network!";
      goto LABEL_11;
    }
LABEL_12:

    __int16 v10 = 0;
    goto LABEL_13;
  }
  __int16 v8 = [v5 oneEventKitConnector];
  int v9 = [v5 oneNetworkRequester];
  self = [(MapsSuggestionsEventKit *)self initWithConnector:v8 network:v9];

  __int16 v10 = self;
LABEL_13:

  return v10;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x11) & (0x1E108u >> a3);
}

- (BOOL)deleteOrDeclineEntry:(id)a3 handler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    __int16 v10 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)id location = 136446978;
    *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
    __int16 v21 = 1024;
    int v22 = 223;
    __int16 v23 = 2082;
    double v24 = "-[MapsSuggestionsEventKit deleteOrDeclineEntry:handler:]";
    __int16 v25 = 2082;
    uint64_t v26 = "nil == (handler)";
    __int16 v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. handler cannot be nil";
LABEL_9:
    uint64_t v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    uint32_t v14 = 38;
LABEL_12:
    _os_log_impl(&dword_1A70DF000, v12, v13, v11, location, v14);
    goto LABEL_13;
  }
  if (!v6)
  {
    __int16 v10 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)id location = 136446978;
    *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
    __int16 v21 = 1024;
    int v22 = 224;
    __int16 v23 = 2082;
    double v24 = "-[MapsSuggestionsEventKit deleteOrDeclineEntry:handler:]";
    __int16 v25 = 2082;
    uint64_t v26 = "nil == (entry)";
    __int16 v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry";
    goto LABEL_9;
  }
  if (([v6 containsKey:@"MapsSuggestionsEventIDKey"] & 1) == 0)
  {
    __int16 v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id location = 138412290;
      *(void *)&location[4] = v6;
      __int16 v11 = "Could not remove Entry without EventIDKey: %@";
      uint64_t v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
      uint32_t v14 = 12;
      goto LABEL_12;
    }
LABEL_13:

    BOOL v9 = 0;
    goto LABEL_14;
  }
  objc_initWeak((id *)location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MapsSuggestionsEventKit_deleteOrDeclineEntry_handler___block_invoke;
  block[3] = &unk_1E5CB8930;
  objc_copyWeak(&v19, (id *)location);
  id v17 = v6;
  id v18 = v7;
  dispatch_async(queue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)location);
  BOOL v9 = 1;
LABEL_14:

  return v9;
}

void __56__MapsSuggestionsEventKit_deleteOrDeclineEntry_handler___block_invoke(uint64_t a1)
{
  *(void *)&v24[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = (id *)WeakRetained;
  if (WeakRetained)
  {
    int v5 = *(void **)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    id v6 = *((void *)WeakRetained + 1);
    id v7 = v4;
    id v8 = v5;
    dispatch_assert_queue_V2(v6);
    BOOL v9 = [v8 stringForKey:@"MapsSuggestionsEventIDKey"];

    __int16 v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      int v22 = (char *)v9;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "About to delete '%@' from Calendar", buf, 0xCu);
    }

    __int16 v11 = [v3[2] eventWithIdentifier:v9];
    id v12 = v3[2];
    id v20 = 0;
    [v12 removeEvent:v11 span:0 error:&v20];
    id v13 = v20;
    v7[2](v7);

    uint32_t v14 = GEOFindOrCreateLog();
    uint64_t v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        int v22 = (char *)v9;
        __int16 v23 = 2112;
        *(void *)double v24 = v13;
        __int16 v16 = "Error during deletion of '%@': %@";
        id v17 = v15;
        os_log_type_t v18 = OS_LOG_TYPE_ERROR;
        uint32_t v19 = 22;
LABEL_12:
        _os_log_impl(&dword_1A70DF000, v17, v18, v16, buf, v19);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      int v22 = (char *)v9;
      __int16 v16 = "Successfully deleted '%@' from Calendar";
      id v17 = v15;
      os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
      uint32_t v19 = 12;
      goto LABEL_12;
    }

    goto LABEL_14;
  }
  GEOFindOrCreateLog();
  BOOL v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    int v22 = "MapsSuggestionsEventKit.m";
    __int16 v23 = 1026;
    *(_DWORD *)double v24 = 233;
    v24[2] = 2082;
    *(void *)&v24[3] = "-[MapsSuggestionsEventKit deleteOrDeclineEntry:handler:]_block_invoke";
    _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
  }

LABEL_14:
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  observers = self->_observers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__MapsSuggestionsEventKit_unregisterObserver___block_invoke;
  v6[3] = &unk_1E5CB8A48;
  objc_copyWeak(&v7, &location);
  [(MapsSuggestionsObservers *)observers unregisterObserver:v4 handler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __46__MapsSuggestionsEventKit_unregisterObserver___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    id v3 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained[2] stopListeningForChanges];
    }
    else
    {
      GEOFindOrCreateLog();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 136446722;
        id v6 = "MapsSuggestionsEventKit.m";
        __int16 v7 = 1026;
        int v8 = 256;
        __int16 v9 = 2082;
        __int16 v10 = "-[MapsSuggestionsEventKit unregisterObserver:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
      }
    }
  }
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

void __87__MapsSuggestionsEventKit__addTravelFlightFieldsToEntry_fromSchemaOrgDictionary_event___block_invoke(uint64_t a1)
{
}

void __48__MapsSuggestionsEventKit__entryTypeFromSchema___block_invoke()
{
  v0 = (void *)qword_1EB6F0190;
  qword_1EB6F0190 = (uint64_t)&unk_1EFC89E40;
}

- (BOOL)_addCalendarEventFieldsToEntry:(void *)a1 event:(void *)a2
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 type];
  if (v5 == 3)
  {
    BOOL v6 = [v4 status] == 2;
    [v4 isAllDay];
    GEOConfigGetDouble();
    objc_msgSend(v3, "setWeight:");
    __int16 v7 = [v4 endDate];
    GEOConfigGetDouble();
    int v8 = objc_msgSend(v7, "dateByAddingTimeInterval:");
    [v3 setExpires:v8];

    objc_msgSend(v3, "setBoolean:forKey:", objc_msgSend(v4, "isAllDay"), @"MapsSuggestionsCalendarAllDayEventKey");
    [v3 setBoolean:v6 forKey:@"MapsSuggestionsCalendarTentativeEventKey"];
  }
  else
  {
    __int16 v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446978;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEventKit.m";
      __int16 v13 = 1024;
      int v14 = 590;
      __int16 v15 = 2082;
      __int16 v16 = "-[MapsSuggestionsEventKit _addCalendarEventFieldsToEntry:event:]";
      __int16 v17 = 2082;
      os_log_type_t v18 = "entry.type != MapsSuggestionsEntryTypeCalendarEvent";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Entry needs to be of type MapsSuggestionsEntryTypeCalendarEvent", (uint8_t *)&v11, 0x26u);
    }
  }
  return v5 == 3;
}

- (void)interestingFlightEventsFrom:(id)a3 to:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  int v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v9];
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__MapsSuggestionsEventKit_interestingFlightEventsFrom_to_handler___block_invoke;
  v15[3] = &unk_1E5CB8930;
  objc_copyWeak(&v18, &location);
  id v16 = v11;
  id v17 = v10;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(queue, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __66__MapsSuggestionsEventKit_interestingFlightEventsFrom_to_handler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = MapsSuggestionsCurrentBestLocation();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__MapsSuggestionsEventKit_interestingFlightEventsFrom_to_handler___block_invoke_382;
    v6[3] = &unk_1E5CB7EF0;
    __int16 v7 = *(id *)(a1 + 40);
    -[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]((uint64_t)WeakRetained, v3, v4, 0, v6);

    uint64_t v5 = v7;
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v9 = "MapsSuggestionsEventKit.m";
      __int16 v10 = 1026;
      int v11 = 720;
      __int16 v12 = 2082;
      id v13 = "-[MapsSuggestionsEventKit interestingFlightEventsFrom:to:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __66__MapsSuggestionsEventKit_interestingFlightEventsFrom_to_handler___block_invoke_382(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", (void)v16) == 15) {
          [v7 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v9);
  }

  id v13 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = [v5 count];
    uint64_t v15 = [v7 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v21 = v14;
    __int16 v22 = 2048;
    uint64_t v23 = v15;
    _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "Filtered flight entries: Before: %lu, After: %lu", buf, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke(uint64_t a1)
{
  *(void *)&v11[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:@"All Calendars are invisible"];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, MEMORY[0x1E4F1CBF0], v4);

    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [WeakRetained uniqueName];
      int v8 = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      *(void *)int v11 = "_q_createEntriesWithinPeriod";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);
    }
    id v7 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod", "", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      uint64_t v9 = "MapsSuggestionsEventKit.m";
      __int16 v10 = 1026;
      *(_DWORD *)int v11 = 764;
      v11[2] = 2082;
      *(void *)&v11[3] = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

void __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_404(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 88);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = (void *)*((void *)WeakRetained + 3);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_405;
    v9[3] = &unk_1E5CB8AE8;
    __int16 v10 = v5;
    objc_copyWeak(&v17, v2);
    id v7 = *(void **)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = v7;
    id v13 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 64);
    id v15 = *(id *)(a1 + 72);
    id v16 = *(id *)(a1 + 80);
    GEOMapItemFromMapsSuggestionsEntry(v10, v6, 1, v9);

    objc_destroyWeak(&v17);
    int v8 = v10;
  }
  else
  {
    GEOFindOrCreateLog();
    int v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      long long v19 = "MapsSuggestionsEventKit.m";
      __int16 v20 = 1026;
      int v21 = 1009;
      __int16 v22 = 2082;
      uint64_t v23 = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_405(id *a1, void *a2, void *a3)
{
  *(void *)&v32[13] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([a1[4] containsKey:@"MapsSuggestionsGEOMapItemOriginKey"])
  {
    id v7 = (void *)[a1[4] integerForKey:@"MapsSuggestionsGEOMapItemOriginKey"];
    id WeakRetained = objc_loadWeakRetained(a1 + 11);
    if (WeakRetained)
    {
      uint64_t v9 = WeakRetained;
      if (v7)
      {
        __int16 v10 = *((void *)WeakRetained + 1);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_406;
        v19[3] = &unk_1E5CB8AC0;
        objc_copyWeak(v28, a1 + 11);
        id v20 = v5;
        id v21 = a1[4];
        id v22 = a1[7];
        id v23 = a1[8];
        id v24 = a1[9];
        id v25 = a1[10];
        v28[1] = v7;
        id v26 = a1[6];
        id v27 = v6;
        dispatch_async(v10, v19);

        objc_destroyWeak(v28);
        goto LABEL_20;
      }
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v9 = objc_loadWeakRetained(a1 + 11);
    if (v9)
    {
LABEL_6:
      uint64_t v11 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = [a1[5] title];
        *(_DWORD *)buf = 138412290;
        v30 = v12;
        _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "Could not get MapItem for event {%@}", buf, 0xCu);
      }
      id v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        id v14 = [v9 uniqueName];
        *(_DWORD *)buf = 138412546;
        v30 = v14;
        __int16 v31 = 2080;
        *(void *)id v32 = "_q_createEntriesWithinPeriod_MapItem_Download";
        _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      id v15 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_MapItem_Download", "", buf, 2u);
      }

      id v16 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        id v17 = [v9 uniqueName];
        *(_DWORD *)buf = 138412546;
        v30 = v17;
        __int16 v31 = 2080;
        *(void *)id v32 = "_q_createEntriesWithinPeriod_MapItem";
        _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      long long v18 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_MapItem", "", buf, 2u);
      }

      dispatch_group_leave((dispatch_group_t)a1[6]);
      goto LABEL_20;
    }
  }
  GEOFindOrCreateLog();
  uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v30 = "MapsSuggestionsEventKit.m";
    __int16 v31 = 1026;
    *(_DWORD *)id v32 = 1020;
    v32[2] = 2082;
    *(void *)&v32[3] = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]_block_invoke";
    _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
  }

LABEL_20:
}

void __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_406(uint64_t a1)
{
  *(void *)&v38[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 96));
  if (WeakRetained)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v4 = v3;
      id v5 = [*(id *)(a1 + 40) stringForKey:@"MapsSuggestionsEntryTitleNameKey"];
      if ([v5 length])
      {
        id v6 = [v4 place];
        [v6 setName:v5];

        id v7 = objc_alloc_init(MEMORY[0x1E4F646E8]);
        [v7 setName:v5];
        [v4 setUserValues:v7];
        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        }
        if (s_verbose)
        {
          int v8 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            int v35 = 138412290;
            int v36 = (char *)v4;
            _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "Separately adding name to the GeoMapItem %@", (uint8_t *)&v35, 0xCu);
          }
        }
      }
      [*(id *)(a1 + 40) setGeoMapItem:v4];
      uint64_t v9 = *(void **)(a1 + 40);
      __int16 v10 = NSNumber;
      [v4 coordinate];
      uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
      [v9 setNumber:v11 forKey:@"MapsSuggestionsLatitudeKey"];

      id v12 = *(void **)(a1 + 40);
      id v13 = NSNumber;
      [v4 coordinate];
      id v15 = [v13 numberWithDouble:v14];
      [v12 setNumber:v15 forKey:@"MapsSuggestionsLongitudeKey"];

      [v4 coordinate];
      if ((v17 < -180.0 || v17 > 180.0 || v16 < -90.0 || v16 > 90.0) && *(void *)(a1 + 48) && *(void *)(a1 + 56))
      {
        objc_msgSend(*(id *)(a1 + 40), "setNumber:forKey:");
        [*(id *)(a1 + 40) setNumber:*(void *)(a1 + 56) forKey:@"MapsSuggestionsLongitudeKey"];
      }
      [*(id *)(a1 + 64) addObject:*(void *)(a1 + 40)];
      if (*(void *)(a1 + 72))
      {
        objc_msgSend(WeakRetained[7], "setObject:forKeyedSubscript:", v4);
        long long v18 = [NSNumber numberWithInteger:*(void *)(a1 + 104)];
        [WeakRetained[8] setObject:v18 forKeyedSubscript:*(void *)(a1 + 72)];
      }
      long long v19 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        id v20 = [WeakRetained uniqueName];
        int v35 = 138412546;
        int v36 = v20;
        __int16 v37 = 2080;
        *(void *)v38 = "_q_createEntriesWithinPeriod_MapItem_Download";
        _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v35, 0x16u);
      }
      id v21 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v21))
      {
        LOWORD(v35) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_MapItem_Download", "", (uint8_t *)&v35, 2u);
      }

      id v22 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        id v23 = [WeakRetained uniqueName];
        int v35 = 138412546;
        int v36 = v23;
        __int16 v37 = 2080;
        *(void *)v38 = "_q_createEntriesWithinPeriod_MapItem";
        _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v35, 0x16u);
      }
      id v24 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v24))
      {
        LOWORD(v35) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_MapItem", "", (uint8_t *)&v35, 2u);
      }

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
    }
    else
    {
      id v26 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        id v27 = [*(id *)(a1 + 40) uniqueIdentifier];
        v28 = [*(id *)(a1 + 88) localizedDescription];
        int v35 = 138412546;
        int v36 = v27;
        __int16 v37 = 2112;
        *(void *)v38 = v28;
        _os_log_impl(&dword_1A70DF000, v26, OS_LOG_TYPE_DEBUG, "Error forming geoMapItem for entry %@. Error is %@", (uint8_t *)&v35, 0x16u);
      }
      __int16 v29 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v30 = [WeakRetained uniqueName];
        int v35 = 138412546;
        int v36 = v30;
        __int16 v37 = 2080;
        *(void *)v38 = "_q_createEntriesWithinPeriod_MapItem_Download";
        _os_log_impl(&dword_1A70DF000, v29, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v35, 0x16u);
      }
      __int16 v31 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v31))
      {
        LOWORD(v35) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v31, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_MapItem_Download", "", (uint8_t *)&v35, 2u);
      }

      id v32 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        objc_super v33 = [WeakRetained uniqueName];
        int v35 = 138412546;
        int v36 = v33;
        __int16 v37 = 2080;
        *(void *)v38 = "_q_createEntriesWithinPeriod_MapItem";
        _os_log_impl(&dword_1A70DF000, v32, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v35, 0x16u);
      }
      v34 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v34))
      {
        LOWORD(v35) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v34, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_MapItem", "", (uint8_t *)&v35, 2u);
      }

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v35 = 136446722;
      int v36 = "MapsSuggestionsEventKit.m";
      __int16 v37 = 1026;
      *(_DWORD *)v38 = 1030;
      v38[2] = 2082;
      *(void *)&v38[3] = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v25, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf3 went away in %{public}s", (uint8_t *)&v35, 0x1Cu);
    }
  }
}

void __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_409(uint64_t a1)
{
  *(void *)&v15[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "MSg_copyIf:", &__block_literal_global_413);
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromMapsSuggestionsEntries(v3);
      id v5 = (char *)objc_claimAutoreleasedReturnValue();
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Sending %@", (uint8_t *)&v12, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [WeakRetained[7] removeObjectsForKeys:*(void *)(a1 + 40)];
    [WeakRetained[8] removeObjectsForKeys:*(void *)(a1 + 40)];
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [WeakRetained uniqueName];
      int v12 = 138412546;
      id v13 = v7;
      __int16 v14 = 2080;
      *(void *)id v15 = "_q_createEntriesWithinPeriod_Entries";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v12, 0x16u);
    }
    int v8 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v8))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod_Entries", "", (uint8_t *)&v12, 2u);
    }

    uint64_t v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      __int16 v10 = [WeakRetained uniqueName];
      int v12 = 138412546;
      id v13 = v10;
      __int16 v14 = 2080;
      *(void *)id v15 = "_q_createEntriesWithinPeriod";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v11 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v11))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_q_createEntriesWithinPeriod", "", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446722;
      id v13 = "MapsSuggestionsEventKit.m";
      __int16 v14 = 1026;
      *(_DWORD *)id v15 = 1081;
      v15[2] = 2082;
      *(void *)&v15[3] = "-[MapsSuggestionsEventKit _q_createEntriesWithinPeriod:location:fetchMapItems:handler:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v12, 0x1Cu);
    }
    uint64_t v3 = v11;
  }
}

BOOL __87__MapsSuggestionsEventKit__q_createEntriesWithinPeriod_location_fetchMapItems_handler___block_invoke_410(uint64_t a1, void *a2)
{
  v2 = [a2 geoMapItem];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleToMapItemOriginMapping, 0);
  objc_storeStrong((id *)&self->_handleToMapItemMapping, 0);
  objc_storeStrong((id *)&self->_setOfEventReservationSubtypes, 0);
  objc_storeStrong((id *)&self->_changedNotificationCanKicker, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_connector, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end