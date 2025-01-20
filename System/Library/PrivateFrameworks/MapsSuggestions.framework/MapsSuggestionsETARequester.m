@interface MapsSuggestionsETARequester
- (BOOL)ETAsFromLocation:(id)a3 toEntries:(id)a4 completion:(id)a5;
- (BOOL)transportTypeFromLocation:(id)a3 toEntry:(id)a4 completion:(id)a5;
- (MapsSuggestionsETARequester)initWithNetworkRequester:(id)a3 transportModePredictor:(id)a4 requirements:(id)a5;
- (NSString)uniqueName;
- (id)networkRequester;
- (int)mapType;
- (uint64_t)_determineTransportTypeFromOrigin:(void *)a3 toEntry:(void *)a4 completion:;
- (void)forceTransportType:(int)a3;
- (void)setAutomobileOptions:(id)a3;
- (void)setMapType:(int)a3;
@end

@implementation MapsSuggestionsETARequester

- (MapsSuggestionsETARequester)initWithNetworkRequester:(id)a3 transportModePredictor:(id)a4 requirements:(id)a5
{
  id v9 = a3;
  objc_initWeak(&location, a4);
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)MapsSuggestionsETARequester;
  v11 = [(MapsSuggestionsETARequester *)&v28 init];
  if (v11)
  {
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("MapsSuggestionsETARequester", v12);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v13;

    v11->_forcedTransportMode = 4;
    objc_storeStrong((id *)&v11->_networkRequester, a3);
    objc_storeStrong((id *)&v11->_etaRequirements, a5);
    v15 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    waypointsLock = v11->_waypointsLock;
    v11->_waypointsLock = v15;

    if (GEOConfigGetBOOL())
    {
      v17 = (MapsSuggestionsPredictor *)objc_loadWeakRetained(&location);
      transportModePredictor = v11->_transportModePredictor;
      v11->_transportModePredictor = v17;
    }
    v19 = (GEOAutomobileOptions *)objc_alloc_init(MEMORY[0x1E4F64410]);
    automobileOptions = v11->_automobileOptions;
    v11->_automobileOptions = v19;

    v21 = v11->_automobileOptions;
    v22 = [MEMORY[0x1E4F28CB8] defaultManager];
    v23 = [v22 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];
    v24 = [v23 path];
    int AppBooleanValueWithContainer = _CFPreferencesGetAppBooleanValueWithContainer();

    if (AppBooleanValueWithContainer) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = 3;
    }
    [(GEOAutomobileOptions *)v21 setTrafficType:v26];
  }

  objc_destroyWeak(&location);
  return v11;
}

- (void)setMapType:(int)a3
{
  self->_mapType = a3;
}

- (void)setAutomobileOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MapsSuggestionsETARequester_setAutomobileOptions___block_invoke;
  block[3] = &unk_1E5CB7BE0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__MapsSuggestionsETARequester_setAutomobileOptions___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) copy];
    id v4 = (void *)WeakRetained[10];
    WeakRetained[10] = v3;
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      v7 = "MapsSuggestionsETARequester.m";
      __int16 v8 = 1026;
      int v9 = 105;
      __int16 v10 = 2082;
      v11 = "-[MapsSuggestionsETARequester setAutomobileOptions:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (BOOL)ETAsFromLocation:(id)a3 toEntries:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETARequester.m";
      __int16 v33 = 1024;
      *(_DWORD *)v34 = 114;
      *(_WORD *)&v34[4] = 2082;
      *(void *)&v34[6] = "-[MapsSuggestionsETARequester ETAsFromLocation:toEntries:completion:]";
      __int16 v35 = 2082;
      v36 = "nil == (completion)";
      v23 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_13:
      _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x26u);
    }
LABEL_14:

LABEL_15:
    BOOL v21 = 0;
    goto LABEL_16;
  }
  if (!v8)
  {
    v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETARequester.m";
      __int16 v33 = 1024;
      *(_DWORD *)v34 = 115;
      *(_WORD *)&v34[4] = 2082;
      *(void *)&v34[6] = "-[MapsSuggestionsETARequester ETAsFromLocation:toEntries:completion:]";
      __int16 v35 = 2082;
      v36 = "nil == (location)";
      v23 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a current location";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  uint64_t v11 = [v9 count];
  uint64_t v12 = GEOFindOrCreateLog();
  dispatch_queue_t v13 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETARequester.m";
      __int16 v33 = 1024;
      *(_DWORD *)v34 = 116;
      *(_WORD *)&v34[4] = 2082;
      *(void *)&v34[6] = "-[MapsSuggestionsETARequester ETAsFromLocation:toEntries:completion:]";
      __int16 v35 = 2082;
      v36 = "0u == [entries count]";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a least one suggestions entry", buf, 0x26u);
    }

    goto LABEL_15;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = [(MapsSuggestionsETARequester *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v32 = v14;
    __int16 v33 = 2080;
    *(void *)v34 = "ETAsFromLocation";
    _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  v15 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ETAsFromLocation", "", buf, 2u);
  }

  v16 = (void *)[v8 copy];
  v17 = (void *)[v9 copy];
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MapsSuggestionsETARequester_ETAsFromLocation_toEntries_completion___block_invoke;
  block[3] = &unk_1E5CB7C30;
  objc_copyWeak(&v30, (id *)buf);
  id v26 = v16;
  objc_super v28 = self;
  id v29 = v10;
  id v27 = v17;
  id v19 = v17;
  id v20 = v16;
  dispatch_async(queue, block);

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
  BOOL v21 = 1;
LABEL_16:

  return v21;
}

void __69__MapsSuggestionsETARequester_ETAsFromLocation_toEntries_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  from = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id val = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v4 = *(id *)(v1 + 32);
    uint64_t v94 = v1;
    if (v4)
    {
      dispatch_assert_queue_V2(*((dispatch_queue_t *)v3 + 1));
      if (*((void *)v3 + 6) && ([v4 isEqual:*((void *)v3 + 5)] & 1) != 0)
      {
LABEL_8:

        id v15 = *(id *)(v1 + 40);
        [*((id *)v3 + 8) lock];
        obuint64_t j = *((id *)v3 + 7);
        [*((id *)v3 + 8) unlock];
        dispatch_group_t group = (dispatch_group_t)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "count"));
        long long v106 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v106 objects:v120 count:16];
        char v18 = 0;
        if (v17)
        {
          uint64_t v19 = *(void *)v107;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v107 != v19) {
                objc_enumerationMutation(v16);
              }
              BOOL v21 = *(void **)(*((void *)&v106 + 1) + 8 * i);
              if ([v21 containsKey:@"MapsSuggestionsNeedsETATrackingKey"]
                && [v21 BOOLeanForKey:@"MapsSuggestionsNeedsETATrackingKey"])
              {
                v22 = MapsSuggestionsDestinationKey(v21);
                v23 = [obj objectForKeyedSubscript:v22];
                if (v23)
                {
                  [group setObject:v23 forKeyedSubscript:v22];
                }
                else
                {
                  v24 = GEOFindOrCreateLog();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                  {
                    v25 = [obj allKeys];
                    *(_DWORD *)buf = 138412546;
                    *(void *)&uint8_t buf[4] = v21;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v25;
                    _os_log_impl(&dword_1A70DF000, v24, OS_LOG_TYPE_DEBUG, "No existing waypoint for entry: %@. Existing waypoint identifiers: %@", buf, 0x16u);
                  }
                  char v18 = 1;
                }
              }
            }
            uint64_t v17 = [v16 countByEnumeratingWithState:&v106 objects:v120 count:16];
          }
          while (v17);
        }

        [*((id *)val + 8) lock];
        id v26 = (void *)*((void *)val + 7);
        *((void *)val + 7) = group;
        id v27 = group;

        [*((id *)val + 8) unlock];
        if ((v18 & 1) == 0)
        {
LABEL_71:
          v58 = *(void **)(v94 + 40);
          v101[0] = MEMORY[0x1E4F143A8];
          v101[1] = 3221225472;
          v102 = __69__MapsSuggestionsETARequester_ETAsFromLocation_toEntries_completion___block_invoke_138;
          v103 = &unk_1E5CB7C08;
          objc_copyWeak(&v105, from);
          id v104 = *(id *)(v94 + 56);
          froma = v58;
          v93 = v101;
          dispatch_assert_queue_V2(*((dispatch_queue_t *)val + 1));
          id v59 = objc_alloc(MEMORY[0x1E4F64410]);
          v60 = [*((id *)val + 10) data];
          id objb = (id)[v59 initWithData:v60];

          v61 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            v62 = [val uniqueName];
            *(_DWORD *)id location = 138412546;
            *(void *)&location[4] = v62;
            *(_WORD *)&location[12] = 2080;
            *(void *)&location[14] = "_requestETAs";
            _os_log_impl(&dword_1A70DF000, v61, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", location, 0x16u);
          }
          v63 = GEOFindOrCreateLog();
          if (os_signpost_enabled(v63))
          {
            *(_WORD *)id location = 0;
            _os_signpost_emit_with_name_impl(&dword_1A70DF000, v63, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_requestETAs", "", location, 2u);
          }

          if (*((void *)val + 6))
          {
            [*((id *)val + 8) lock];
            uint64_t v64 = [*((id *)val + 7) count];
            [*((id *)val + 8) unlock];
            if (v64)
            {
              objc_initWeak(&v112, val);
              *(void *)id location = 0;
              *(void *)&location[8] = location;
              *(void *)&location[16] = 0x3032000000;
              v130 = __Block_byref_object_copy_;
              v131 = __Block_byref_object_dispose_;
              id v132 = 0;
              v65 = dispatch_group_create();
              memset(buf, 0, sizeof(buf));
              long long v127 = 0u;
              long long v128 = 0u;
              v66 = froma;
              uint64_t v67 = [v66 countByEnumeratingWithState:buf objects:v120 count:16];
              if (v67)
              {
                uint64_t v68 = **(void **)&buf[16];
                do
                {
                  for (uint64_t j = 0; j != v67; ++j)
                  {
                    if (**(void **)&buf[16] != v68) {
                      objc_enumerationMutation(v66);
                    }
                    v70 = *(void **)(*(void *)&buf[8] + 8 * j);
                    [*((id *)val + 8) lock];
                    v71 = (void *)*((void *)val + 7);
                    v72 = MapsSuggestionsDestinationKey(v70);
                    v73 = [v71 objectForKeyedSubscript:v72];

                    [*((id *)val + 8) unlock];
                    if (v73)
                    {
                      dispatch_group_enter(v65);
                      v74 = (void *)*((void *)val + 5);
                      *(void *)&long long v106 = MEMORY[0x1E4F143A8];
                      *((void *)&v106 + 1) = 3221225472;
                      *(void *)&long long v107 = __64__MapsSuggestionsETARequester__requestETAsToEntries_completion___block_invoke;
                      *((void *)&v107 + 1) = &unk_1E5CB7D48;
                      v110 = location;
                      v75 = v65;
                      *(void *)&long long v108 = v75;
                      objc_copyWeak(v111, &v112);
                      *((void *)&v108 + 1) = v73;
                      *(void *)&long long v109 = objb;
                      *((void *)&v109 + 1) = v70;
                      if ((-[MapsSuggestionsETARequester _determineTransportTypeFromOrigin:toEntry:completion:]((uint64_t)val, v74, v70, &v106) & 1) == 0)
                      {
                        v76 = GEOFindOrCreateLog();
                        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                        {
                          uint64_t v77 = *((void *)val + 5);
                          *(_DWORD *)v116 = 138412546;
                          uint64_t v117 = v77;
                          __int16 v118 = 2112;
                          v119 = v70;
                          _os_log_impl(&dword_1A70DF000, v76, OS_LOG_TYPE_ERROR, "Could not determine transportType for input: %@, %@", v116, 0x16u);
                        }

                        dispatch_group_leave(v75);
                      }

                      objc_destroyWeak(v111);
                    }
                  }
                  uint64_t v67 = [v66 countByEnumeratingWithState:buf objects:v120 count:16];
                }
                while (v67);
              }

              v78 = *((void *)val + 1);
              *(void *)blocuint64_t k = MEMORY[0x1E4F143A8];
              *(void *)&block[8] = 3221225472;
              *(void *)&block[16] = __64__MapsSuggestionsETARequester__requestETAsToEntries_completion___block_invoke_169;
              *(void *)&block[24] = &unk_1E5CB7D70;
              objc_copyWeak(v115, &v112);
              *(void *)&block[32] = v93;
              v114 = location;
              dispatch_group_notify(v65, v78, block);

              objc_destroyWeak(v115);
              _Block_object_dispose(location, 8);

              objc_destroyWeak(&v112);
            }
            else
            {
              v87 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10 reason:@"Had no Waypoints at all"];
              v102((uint64_t)v93, v87);
              v88 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
              {
                v89 = [val uniqueName];
                *(_DWORD *)id location = 138412546;
                *(void *)&location[4] = v89;
                *(_WORD *)&location[12] = 2080;
                *(void *)&location[14] = "_requestETAs";
                _os_log_impl(&dword_1A70DF000, v88, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", location, 0x16u);
              }
              v90 = GEOFindOrCreateLog();
              if (os_signpost_enabled(v90))
              {
                *(_WORD *)id location = 0;
                _os_signpost_emit_with_name_impl(&dword_1A70DF000, v90, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_requestETAs", "", location, 2u);
              }
            }
          }
          else
          {
            v79 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)id location = 0;
              _os_log_impl(&dword_1A70DF000, v79, OS_LOG_TYPE_DEBUG, "CurrentLocation was nil", location, 2u);
            }

            v80 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
            {
              v81 = [val uniqueName];
              *(_DWORD *)id location = 138412546;
              *(void *)&location[4] = v81;
              *(_WORD *)&location[12] = 2080;
              *(void *)&location[14] = "_requestETAs";
              _os_log_impl(&dword_1A70DF000, v80, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", location, 0x16u);
            }
            v82 = GEOFindOrCreateLog();
            if (os_signpost_enabled(v82))
            {
              *(_WORD *)id location = 0;
              _os_signpost_emit_with_name_impl(&dword_1A70DF000, v82, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_requestETAs", "", location, 2u);
            }

            GEOFindOrCreateLog();
            v83 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
            {
              v84 = [*(id *)(v94 + 48) uniqueName];
              *(_DWORD *)v120 = 138412546;
              v121 = v84;
              __int16 v122 = 2080;
              *(void *)v123 = "ETAsFromLocation";
              _os_log_impl(&dword_1A70DF000, v83, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", v120, 0x16u);
            }
            v85 = GEOFindOrCreateLog();
            if (os_signpost_enabled(v85))
            {
              *(_WORD *)v120 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A70DF000, v85, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ETAsFromLocation", "", v120, 2u);
            }

            v86 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10 reason:@"Could not request ETA for this Entry"];
            (*(void (**)(void))(*(void *)(v94 + 56) + 16))();
          }
          objc_destroyWeak(&v105);
          goto LABEL_109;
        }
        id v28 = *(id *)(v94 + 40);
        if (!v28)
        {
          v55 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)blocuint64_t k = 136446978;
            *(void *)&void block[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETARequester.m";
            *(_WORD *)&block[12] = 1024;
            *(_DWORD *)&block[14] = 243;
            *(_WORD *)&block[18] = 2082;
            *(void *)&block[20] = "-[MapsSuggestionsETARequester _requestWaypointsForEntries:]";
            *(_WORD *)&block[28] = 2082;
            *(void *)&block[30] = "nil == (entries)";
            _os_log_impl(&dword_1A70DF000, v55, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestions entries", block, 0x26u);
          }

          goto LABEL_70;
        }
        id v29 = v28;
        dispatch_assert_queue_V2(*((dispatch_queue_t *)val + 1));
        id v30 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          v31 = [val uniqueName];
          *(_DWORD *)blocuint64_t k = 138412546;
          *(void *)&void block[4] = v31;
          *(_WORD *)&block[12] = 2080;
          *(void *)&block[14] = "_requestWaypointsForEntries";
          _os_log_impl(&dword_1A70DF000, v30, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", block, 0x16u);
        }
        v32 = GEOFindOrCreateLog();
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)blocuint64_t k = 0;
          _os_signpost_emit_with_name_impl(&dword_1A70DF000, v32, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_requestWaypointsForEntries", "", block, 2u);
        }

        groupa = dispatch_group_create();
        objc_initWeak((id *)location, val);
        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        id obja = v29;
        uint64_t v33 = [obja countByEnumeratingWithState:&v106 objects:v120 count:16];
        v34 = (id *)val;
        if (v33)
        {
          uint64_t v35 = *(void *)v107;
          do
          {
            for (uint64_t k = 0; k != v33; ++k)
            {
              if (*(void *)v107 != v35) {
                objc_enumerationMutation(obja);
              }
              uint64_t v37 = *(void **)(*((void *)&v106 + 1) + 8 * k);
              if ([v37 BOOLeanForKey:@"MapsSuggestionsNeedsETATrackingKey"])
              {
                v38 = MapsSuggestionsDestinationKey(v37);
                [v34[8] lock];
                v39 = [v34[7] objectForKeyedSubscript:v38];
                [v34[8] unlock];
                if (!v39)
                {
                  dispatch_group_enter(groupa);
                  v40 = (void *)*((void *)val + 2);
                  *(void *)buf = MEMORY[0x1E4F143A8];
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&buf[16] = __59__MapsSuggestionsETARequester__requestWaypointsForEntries___block_invoke;
                  *(void *)&buf[24] = &unk_1E5CB7C58;
                  v41 = groupa;
                  *(void *)&long long v127 = v41;
                  objc_copyWeak((id *)&v128, (id *)location);
                  *((void *)&v127 + 1) = v38;
                  if ((GEOComposedWaypointFromMapsSuggestionsEntry(v37, v40, buf) & 1) == 0)
                  {
                    v42 = GEOFindOrCreateLog();
                    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)blocuint64_t k = 136315138;
                      *(void *)&void block[4] = "-[MapsSuggestionsETARequester _requestWaypointsForEntries:]";
                      _os_log_impl(&dword_1A70DF000, v42, OS_LOG_TYPE_ERROR, "%s will not call back", block, 0xCu);
                    }

                    dispatch_group_leave(v41);
                  }

                  objc_destroyWeak((id *)&v128);
                }

                v34 = (id *)val;
              }
            }
            uint64_t v33 = [obja countByEnumeratingWithState:&v106 objects:v120 count:16];
          }
          while (v33);
        }

        GEOConfigGetDouble();
        dispatch_time_t v44 = dispatch_time(0, (uint64_t)(v43 * 1000000000.0));
        intptr_t v45 = dispatch_group_wait(groupa, v44);
        if (v45)
        {
          v46 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)blocuint64_t k = 0;
            _os_log_impl(&dword_1A70DF000, v46, OS_LOG_TYPE_ERROR, "Timeout on getting waypoints", block, 2u);
          }

          GEOFindOrCreateLog();
          v47 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            v48 = [val uniqueName];
            *(_DWORD *)blocuint64_t k = 138412546;
            *(void *)&void block[4] = v48;
            *(_WORD *)&block[12] = 2080;
            *(void *)&block[14] = "_requestWaypointsForEntries";
            _os_log_impl(&dword_1A70DF000, v47, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", block, 0x16u);
          }
          v49 = GEOFindOrCreateLog();
          if (os_signpost_enabled(v49))
          {
            *(_WORD *)blocuint64_t k = 0;
LABEL_68:
            _os_signpost_emit_with_name_impl(&dword_1A70DF000, v49, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_requestWaypointsForEntries", "", block, 2u);
          }
        }
        else
        {
          GEOFindOrCreateLog();
          v56 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            v57 = [val uniqueName];
            *(_DWORD *)blocuint64_t k = 138412546;
            *(void *)&void block[4] = v57;
            *(_WORD *)&block[12] = 2080;
            *(void *)&block[14] = "_requestWaypointsForEntries";
            _os_log_impl(&dword_1A70DF000, v56, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", block, 0x16u);
          }
          v49 = GEOFindOrCreateLog();
          if (os_signpost_enabled(v49))
          {
            *(_WORD *)blocuint64_t k = 0;
            goto LABEL_68;
          }
        }

        objc_destroyWeak((id *)location);
        if (v45)
        {
LABEL_70:
          v52 = (void *)[[NSString alloc] initWithFormat:@"Could not make waypoints for all Entries: %@", *(void *)(v94 + 40)];
          uint64_t v53 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-19 reason:v52];
          goto LABEL_59;
        }
        goto LABEL_71;
      }
      [v4 coordinate];
      if (CLLocationCoordinate2DIsValid(v134))
      {
        [v4 coordinate];
        double v6 = v5;
        [v4 coordinate];
        double v8 = v7;
        uint64_t v9 = [v4 copy];
        id v3 = val;
        id v10 = (void *)*((void *)val + 5);
        *((void *)val + 5) = v9;

        uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64660]), "initWithGEOCoordinate:", v6, v8);
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          uint64_t v13 = [objc_alloc(MEMORY[0x1E4F644F0]) initWithLocation:v11 isCurrentLocation:1];
          v14 = (void *)*((void *)val + 6);
          *((void *)val + 6) = v13;

          uint64_t v1 = v94;
          goto LABEL_8;
        }

LABEL_58:
        v52 = (void *)[[NSString alloc] initWithFormat:@"Could not make waypoint for location: %@", *(void *)(v94 + 32)];
        uint64_t v53 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-12 reason:v52];
LABEL_59:
        v54 = (void *)v53;
        (*(void (**)(void))(*(void *)(v94 + 56) + 16))();

        goto LABEL_109;
      }
    }
    else
    {
      v51 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v120 = 136446978;
        v121 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETARequester.m";
        __int16 v122 = 1024;
        *(_DWORD *)v123 = 214;
        *(_WORD *)&v123[4] = 2082;
        *(void *)&v123[6] = "-[MapsSuggestionsETARequester _requestWaypointForCurrentLocation:]";
        __int16 v124 = 2082;
        v125 = "nil == (location)";
        _os_log_impl(&dword_1A70DF000, v51, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location", v120, 0x26u);
      }
    }
    goto LABEL_58;
  }
  GEOFindOrCreateLog();
  v50 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v120 = 136446722;
    v121 = "MapsSuggestionsETARequester.m";
    __int16 v122 = 1026;
    *(_DWORD *)v123 = 126;
    *(_WORD *)&v123[4] = 2082;
    *(void *)&v123[6] = "-[MapsSuggestionsETARequester ETAsFromLocation:toEntries:completion:]_block_invoke";
    _os_log_impl(&dword_1A70DF000, v50, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", v120, 0x1Cu);
  }

LABEL_109:
}

void __69__MapsSuggestionsETARequester_ETAsFromLocation_toEntries_completion___block_invoke_138(uint64_t a1, void *a2)
{
  *(void *)&v13[13] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v5 = GEOFindOrCreateLog();
  double v6 = v5;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      double v7 = [WeakRetained uniqueName];
      int v10 = 138412546;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      *(void *)uint64_t v13 = "ETAsFromLocation";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v10, 0x16u);
    }
    double v8 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v8))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ETAsFromLocation", "", (uint8_t *)&v10, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = v5;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446722;
      uint64_t v11 = "MapsSuggestionsETARequester.m";
      __int16 v12 = 1026;
      *(_DWORD *)uint64_t v13 = 150;
      v13[2] = 2082;
      *(void *)&v13[3] = "-[MapsSuggestionsETARequester ETAsFromLocation:toEntries:completion:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

void __59__MapsSuggestionsETARequester__requestWaypointsForEntries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  double v6 = a3;
  if (v6)
  {
    double v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412290;
      __int16 v12 = v6;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "Error fetching waypoint: %@", (uint8_t *)&v11, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v9 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained[8] lock];
      [v9[7] setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];
      [v9[8] unlock];
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
    else
    {
      GEOFindOrCreateLog();
      int v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136446722;
        __int16 v12 = "MapsSuggestionsETARequester.m";
        __int16 v13 = 1026;
        int v14 = 275;
        __int16 v15 = 2082;
        id v16 = "-[MapsSuggestionsETARequester _requestWaypointsForEntries:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v11, 0x1Cu);
      }
    }
  }
}

- (BOOL)transportTypeFromLocation:(id)a3 toEntry:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    __int16 v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v15 = 136446978;
    id v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETARequester.m";
    __int16 v17 = 1024;
    int v18 = 304;
    __int16 v19 = 2082;
    id v20 = "-[MapsSuggestionsETARequester transportTypeFromLocation:toEntry:completion:]";
    __int16 v21 = 2082;
    v22 = "nil == (completion)";
    __int16 v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_11:
    _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0x26u);
    goto LABEL_12;
  }
  if (!v8)
  {
    __int16 v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v15 = 136446978;
    id v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETARequester.m";
    __int16 v17 = 1024;
    int v18 = 305;
    __int16 v19 = 2082;
    id v20 = "-[MapsSuggestionsETARequester transportTypeFromLocation:toEntry:completion:]";
    __int16 v21 = 2082;
    v22 = "nil == (location)";
    __int16 v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a current location";
    goto LABEL_11;
  }
  if (!v9)
  {
    __int16 v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446978;
      id v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETARequester.m";
      __int16 v17 = 1024;
      int v18 = 306;
      __int16 v19 = 2082;
      id v20 = "-[MapsSuggestionsETARequester transportTypeFromLocation:toEntry:completion:]";
      __int16 v21 = 2082;
      v22 = "nil == (entry)";
      __int16 v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a destinationd entry";
      goto LABEL_11;
    }
LABEL_12:

    char v11 = 0;
    goto LABEL_13;
  }
  char v11 = -[MapsSuggestionsETARequester _determineTransportTypeFromOrigin:toEntry:completion:]((uint64_t)self, v8, v9, v10);
LABEL_13:

  return v11;
}

- (uint64_t)_determineTransportTypeFromOrigin:(void *)a3 toEntry:(void *)a4 completion:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_26;
  }
  id v10 = GEOFindOrCreateLog();
  char v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v53 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETARequester.m";
      __int16 v54 = 1024;
      *(_DWORD *)v55 = 319;
      *(_WORD *)&v55[4] = 2082;
      *(void *)&v55[6] = "-[MapsSuggestionsETARequester _determineTransportTypeFromOrigin:toEntry:completion:]";
      __int16 v56 = 2082;
      v57 = "nil == (completion)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }

    goto LABEL_26;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    __int16 v12 = [(id)a1 uniqueName];
    *(_DWORD *)buf = 138412546;
    uint64_t v53 = v12;
    __int16 v54 = 2080;
    *(void *)v55 = "_determineTransportTypeFromOrigin";
    _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  __int16 v13 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_determineTransportTypeFromOrigin", "", buf, 2u);
  }

  if (v7 && v8)
  {
    if ([v8 type] == 11)
    {
      if (([v8 containsKey:@"MapsSuggestionsTransportTypeKey"] & 1) == 0)
      {
        int v14 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, "Resume Route should always have a transport type key, falling back to Automobile", buf, 2u);
        }

        [v8 setNumber:&unk_1EFC89720 forKey:@"MapsSuggestionsTransportTypeKey"];
      }
      int v15 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "Entry type is resume route, using the transport type key.", buf, 2u);
      }

      id v16 = [v8 numberForKey:@"MapsSuggestionsTransportTypeKey"];
      v9[2](v9, [v16 intValue], 0);
LABEL_45:

      goto LABEL_46;
    }
    if (*(_DWORD *)(a1 + 72) != 4)
    {
      v34 = objc_msgSend(NSNumber, "numberWithInt:");
      [v8 setNumber:v34 forKey:@"MapsSuggestionsTransportTypeKey"];

      v9[2](v9, *(unsigned int *)(a1 + 72), 0);
      uint64_t v35 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        int v36 = *(_DWORD *)(a1 + 72);
        *(_DWORD *)buf = 67109120;
        LODWORD(v53) = v36;
        _os_log_impl(&dword_1A70DF000, v35, OS_LOG_TYPE_DEBUG, "Forcing transport type: %d", buf, 8u);
      }

      uint64_t v37 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v38 = [(id)a1 uniqueName];
        *(_DWORD *)buf = 138412546;
        uint64_t v53 = v38;
        __int16 v54 = 2080;
        *(void *)v55 = "_determineTransportTypeFromOrigin";
        _os_log_impl(&dword_1A70DF000, v37, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
      }
      id v16 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_determineTransportTypeFromOrigin", "", buf, 2u);
      }
      goto LABEL_45;
    }
    [v7 coordinate];
    v22 = v21;
    [v7 coordinate];
    if (v23 < -180.0 || (double v24 = v23, v23 > 180.0) || *(double *)&v22 < -90.0 || *(double *)&v22 > 90.0)
    {
      v40 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        v41 = [(id)a1 uniqueName];
        *(_DWORD *)buf = 138412546;
        uint64_t v53 = v41;
        __int16 v54 = 2080;
        *(void *)v55 = "_determineTransportTypeFromOrigin";
        _os_log_impl(&dword_1A70DF000, v40, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      __int16 v19 = GEOFindOrCreateLog();
      if (!os_signpost_enabled(v19)) {
        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
    }
    else if ([v8 containsKey:@"MapsSuggestionsLatitudeKey"] {
           && ([v8 containsKey:@"MapsSuggestionsLongitudeKey"] & 1) != 0)
    }
    {
      v25 = [v8 numberForKey:@"MapsSuggestionsLatitudeKey"];
      [v25 doubleValue];
      id v27 = v26;
      id v28 = [v8 numberForKey:@"MapsSuggestionsLongitudeKey"];
      [v28 doubleValue];
      id v30 = v29;

      if (*(double *)&v30 >= -180.0 && *(double *)&v30 <= 180.0 && *(double *)&v27 >= -90.0 && *(double *)&v27 <= 90.0)
      {
        dispatch_group_t v31 = dispatch_group_create();
        objc_initWeak((id *)buf, (id)a1);
        v32 = *(NSObject **)(a1 + 8);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __84__MapsSuggestionsETARequester__determineTransportTypeFromOrigin_toEntry_completion___block_invoke;
        block[3] = &unk_1E5CB7CF8;
        objc_copyWeak(v51, (id *)buf);
        v51[1] = v22;
        v51[2] = *(id *)&v24;
        v51[3] = v27;
        v51[4] = v30;
        id v47 = v8;
        v50 = v9;
        dispatch_group_t v48 = v31;
        id v49 = v7;
        uint64_t v33 = v31;
        dispatch_async(v32, block);

        objc_destroyWeak(v51);
        objc_destroyWeak((id *)buf);
LABEL_46:
        uint64_t v20 = 1;
        goto LABEL_47;
      }
      dispatch_time_t v44 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        intptr_t v45 = [(id)a1 uniqueName];
        *(_DWORD *)buf = 138412546;
        uint64_t v53 = v45;
        __int16 v54 = 2080;
        *(void *)v55 = "_determineTransportTypeFromOrigin";
        _os_log_impl(&dword_1A70DF000, v44, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      __int16 v19 = GEOFindOrCreateLog();
      if (!os_signpost_enabled(v19)) {
        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
    }
    else
    {
      v42 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        double v43 = [(id)a1 uniqueName];
        *(_DWORD *)buf = 138412546;
        uint64_t v53 = v43;
        __int16 v54 = 2080;
        *(void *)v55 = "_determineTransportTypeFromOrigin";
        _os_log_impl(&dword_1A70DF000, v42, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      __int16 v19 = GEOFindOrCreateLog();
      if (!os_signpost_enabled(v19)) {
        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
    }
  }
  else
  {
    __int16 v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v18 = [(id)a1 uniqueName];
      *(_DWORD *)buf = 138412546;
      uint64_t v53 = v18;
      __int16 v54 = 2080;
      *(void *)v55 = "_determineTransportTypeFromOrigin";
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
    }
    __int16 v19 = GEOFindOrCreateLog();
    if (!os_signpost_enabled(v19)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
  }
  _os_signpost_emit_with_name_impl(&dword_1A70DF000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_determineTransportTypeFromOrigin", "", buf, 2u);
LABEL_25:

LABEL_26:
  uint64_t v20 = 0;
LABEL_47:

  return v20;
}

void __84__MapsSuggestionsETARequester__determineTransportTypeFromOrigin_toEntry_completion___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    *(_DWORD *)&buf[24] = 4;
    uint64_t v30 = 0;
    dispatch_group_t v31 = &v30;
    uint64_t v32 = 0x2020000000;
    int v33 = 4;
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F645E0], "idealTransportTypeForOrigin:destination:mapType:", objc_msgSend(WeakRetained, "mapType"), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    if ((unint64_t)(v5 - 1) > 3) {
      unsigned int v6 = 0;
    }
    else {
      unsigned int v6 = dword_1A7226FE0[v5 - 1];
    }
    *((_DWORD *)v31 + 6) = v6;
    if (GEOConfigGetBOOL())
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      id v8 = (void *)v4[3];
      uint64_t v9 = *(void *)(a1 + 32);
      [*(id *)(a1 + 48) coordinate];
      double v11 = v10;
      double v13 = v12;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __84__MapsSuggestionsETARequester__determineTransportTypeFromOrigin_toEntry_completion___block_invoke_154;
      v26[3] = &unk_1E5CB7CA8;
      objc_copyWeak(&v29, v2);
      id v27 = *(id *)(a1 + 40);
      id v28 = buf;
      objc_msgSend(v8, "predictedTransportModeForDestinationEntry:originCoordinate:handler:", v9, v26, v11, v13);
      int v14 = v4[1];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __84__MapsSuggestionsETARequester__determineTransportTypeFromOrigin_toEntry_completion___block_invoke_157;
      v21[3] = &unk_1E5CB7CD0;
      double v24 = buf;
      v25 = &v30;
      v21[4] = v4;
      int v15 = *(NSObject **)(a1 + 40);
      id v22 = *(id *)(a1 + 32);
      id v23 = *(id *)(a1 + 56);
      dispatch_group_notify(v15, v14, v21);

      objc_destroyWeak(&v29);
    }
    else
    {
      id v16 = *(void **)(a1 + 32);
      __int16 v17 = [NSNumber numberWithInt:*((unsigned int *)v31 + 6)];
      [v16 setNumber:v17 forKey:@"MapsSuggestionsTransportTypeKey"];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      GEOFindOrCreateLog();
      int v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        __int16 v19 = [v4 uniqueName];
        *(_DWORD *)v34 = 138412546;
        uint64_t v35 = v19;
        __int16 v36 = 2080;
        uint64_t v37 = "_determineTransportTypeFromOrigin";
        _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", v34, 0x16u);
      }
      uint64_t v20 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v20))
      {
        *(_WORD *)v34 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A70DF000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_determineTransportTypeFromOrigin", "", v34, 2u);
      }
    }
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "MapsSuggestionsETARequester.m";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 373;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsETARequester _determineTransportTypeFromOrigin:toEntry:completion:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __84__MapsSuggestionsETARequester__determineTransportTypeFromOrigin_toEntry_completion___block_invoke_154(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained[1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __84__MapsSuggestionsETARequester__determineTransportTypeFromOrigin_toEntry_completion___block_invoke_155;
    v13[3] = &unk_1E5CB7C80;
    int v14 = v6;
    id v15 = v5;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v16 = v10;
    uint64_t v17 = v11;
    dispatch_async(v9, v13);

    double v12 = v14;
  }
  else
  {
    GEOFindOrCreateLog();
    double v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v19 = "MapsSuggestionsETARequester.m";
      __int16 v20 = 1026;
      int v21 = 395;
      __int16 v22 = 2082;
      id v23 = "-[MapsSuggestionsETARequester _determineTransportTypeFromOrigin:toEntry:completion:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __84__MapsSuggestionsETARequester__determineTransportTypeFromOrigin_toEntry_completion___block_invoke_155(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) || ![*(id *)(a1 + 40) count])
  {
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v3 = [*(id *)(a1 + 32) localizedDescription];
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_ERROR, "Could not predict transport mode. Error: %@", (uint8_t *)&v10, 0xCu);
    }
LABEL_4:

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
    return;
  }
  id v4 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
      int v10 = 138412290;
      id v11 = (id)objc_opt_class();
      id v9 = v11;
      _os_log_impl(&dword_1A70DF000, v2, OS_LOG_TYPE_ERROR, "Unexpected class type for predicted transport mode. Error: %@", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_4;
  }
  id v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v6 intValue];

  id v7 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v7);
}

void __84__MapsSuggestionsETARequester__determineTransportTypeFromOrigin_toEntry_completion___block_invoke_157(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  MapsSuggestionsLogPredictedTransportModeForEntry(v2, v3, v5, *(void **)(a1 + 40));

  if (GEOConfigGetBOOL())
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315138;
      id v15 = "-[MapsSuggestionsETARequester _determineTransportTypeFromOrigin:toEntry:completion:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "Using MSg PTM in %s", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v7 = *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v7 == 4)
    {
      id v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "Could not set predicted transport mode.", (uint8_t *)&v14, 2u);
      }

      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                              + 24);
      uint64_t v7 = *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    }
    id v9 = *(void **)(a1 + 40);
    int v10 = [NSNumber numberWithInt:v7];
    [v9 setNumber:v10 forKey:@"MapsSuggestionsTransportTypeKey"];

    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [*(id *)(a1 + 32) uniqueName];
    int v14 = 138412546;
    id v15 = v12;
    __int16 v16 = 2080;
    uint64_t v17 = "_determineTransportTypeFromOrigin";
    _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v14, 0x16u);
  }
  double v13 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v13))
  {
    LOWORD(v14) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_determineTransportTypeFromOrigin", "", (uint8_t *)&v14, 2u);
  }
}

void __64__MapsSuggestionsETARequester__requestETAsToEntries_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v6;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Could not determine transportType: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    id v9 = GEOFindOrCreateLog();
    int v10 = v9;
    if (WeakRetained)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v11 = (char *)*((void *)WeakRetained + 5);
        *(_DWORD *)buf = 138412290;
        id v26 = v11;
        _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "Sending ETA Request (current location: %@)", buf, 0xCu);
      }

      uint64_t v12 = *((id *)WeakRetained + 6);
      double v13 = (void *)[*((id *)WeakRetained + 5) copy];
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 48);
      uint64_t v18 = (void *)*((void *)WeakRetained + 2);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __64__MapsSuggestionsETARequester__requestETAsToEntries_completion___block_invoke_162;
      v19[3] = &unk_1E5CB7D20;
      objc_copyWeak(&v23, (id *)(a1 + 72));
      uint64_t v16 = *(void *)(a1 + 64);
      v19[4] = *(void *)(a1 + 56);
      uint64_t v22 = v16;
      id v20 = *(id *)(a1 + 32);
      int v24 = a2;
      uint64_t v17 = v13;
      int v21 = v17;
      [v18 ETAFromWaypoint:v12 toWaypoint:v14 transportType:a2 automobileOptions:v15 completion:v19];

      objc_destroyWeak(&v23);
    }
    else
    {
      uint64_t v17 = v9;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        id v26 = "MapsSuggestionsETARequester.m";
        __int16 v27 = 1026;
        int v28 = 496;
        __int16 v29 = 2082;
        uint64_t v30 = "-[MapsSuggestionsETARequester _requestETAsToEntries:completion:]_block_invoke";
        _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
      }
      uint64_t v12 = v17;
    }
  }
}

void __64__MapsSuggestionsETARequester__requestETAsToEntries_completion___block_invoke_162(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      if ([v6 code] == -8
        && ([v6 domain],
            uint64_t v14 = objc_claimAutoreleasedReturnValue(),
            GEOErrorDomain(),
            uint64_t v15 = objc_claimAutoreleasedReturnValue(),
            int v16 = [v14 isEqualToString:v15],
            v15,
            v14,
            v16))
      {
        uint64_t v17 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          LOWORD(v24) = 0;
          _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_INFO, "No ETA/Route available", (uint8_t *)&v24, 2u);
        }

        [*(id *)(a1 + 32) setBoolean:1 forKey:@"MapsSuggestionsRoutingNotAvailableKey"];
        [*(id *)(a1 + 32) setBoolean:0 forKey:@"MapsSuggestionsNeedsETATrackingKey"];
      }
      else
      {
        uint64_t v18 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          int v24 = 138412290;
          v25 = v6;
          _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, "ETA request failed: %@", (uint8_t *)&v24, 0xCu);
        }
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    }
    else if ([*(id *)(a1 + 32) containsKey:@"MapsSuggestionsNeedsETATrackingKey"] {
           && [*(id *)(a1 + 32) BOOLeanForKey:@"MapsSuggestionsNeedsETATrackingKey"])
    }
    {
      if ([v5 isSuccess])
      {
        id v8 = [MapsSuggestionsETA alloc];
        uint64_t v9 = *(unsigned int *)(a1 + 72);
        uint64_t v10 = *(void *)(a1 + 48);
        id v11 = MapsSuggestionsNow();
        uint64_t v12 = [(MapsSuggestionsETA *)v8 initWithTrafficAndETAResult:v5 transportType:v9 location:v10 time:v11];

        [*(id *)(a1 + 32) setETA:v12 forKey:@"MapsSuggestionsETAKey"];
      }
      else
      {
        __int16 v19 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v20 = *(char **)(a1 + 32);
          int v24 = 138412290;
          v25 = v20;
          _os_log_impl(&dword_1A70DF000, v19, OS_LOG_TYPE_ERROR, "ETA Request failed specificantly for %@", (uint8_t *)&v24, 0xCu);
        }

        [*(id *)(a1 + 32) setETA:0 forKey:@"MapsSuggestionsETAKey"];
        uint64_t v21 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Failed significantly in the result"];
        uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
        id v23 = *(void **)(v22 + 40);
        *(void *)(v22 + 40) = v21;
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    GEOFindOrCreateLog();
    double v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136446722;
      v25 = "MapsSuggestionsETARequester.m";
      __int16 v26 = 1026;
      int v27 = 508;
      __int16 v28 = 2082;
      __int16 v29 = "-[MapsSuggestionsETARequester _requestETAsToEntries:completion:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v24, 0x1Cu);
    }
  }
}

void __64__MapsSuggestionsETARequester__requestETAsToEntries_completion___block_invoke_169(uint64_t a1)
{
  *(void *)&v11[13] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = GEOFindOrCreateLog();
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [WeakRetained uniqueName];
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      *(void *)id v11 = "_requestETAs";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v8, 0x16u);
    }
    id v6 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v6))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A70DF000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_requestETAs", "", (uint8_t *)&v8, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v7 = v3;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      uint64_t v9 = "MapsSuggestionsETARequester.m";
      __int16 v10 = 1026;
      *(_DWORD *)id v11 = 558;
      v11[2] = 2082;
      *(void *)&v11[3] = "-[MapsSuggestionsETARequester _requestETAsToEntries:completion:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)forceTransportType:(int)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__MapsSuggestionsETARequester_forceTransportType___block_invoke;
  v4[3] = &unk_1E5CB7D98;
  v4[4] = self;
  int v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __50__MapsSuggestionsETARequester_forceTransportType___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 72) = *(_DWORD *)(result + 40);
  return result;
}

- (id)networkRequester
{
  return self->_networkRequester;
}

- (int)mapType
{
  return self->_mapType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_waypointsLock, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_currentLocationWaypoint, 0);
  objc_storeStrong((id *)&self->_currentLocationUsed, 0);
  objc_storeStrong((id *)&self->_etaRequirements, 0);
  objc_storeStrong((id *)&self->_transportModePredictor, 0);
  objc_storeStrong((id *)&self->_networkRequester, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end