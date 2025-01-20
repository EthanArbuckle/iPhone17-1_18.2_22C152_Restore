@interface CLSPublicEventGeoServiceQuery
+ (unint64_t)maximumBatchSize;
- (BOOL)isCancelled;
- (CLSPublicEventGeoServiceQuery)initWithTimeLocationTuples:(id)a3 radius:(double)a4;
- (GEOMapServiceSpatialEventLookupTicket)ticket;
- (NSArray)timeLocationTuples;
- (NSDictionary)invalidationTokens;
- (NSDictionary)parametersByTimeLocationTupleIdentifier;
- (NSDictionary)resolvedPublicEventsForTimeLocationTuples;
- (OS_dispatch_queue)geoQueue;
- (double)radius;
- (id)_parametersByTimeLocationTupleIdentifierForTimeLocationTuples:(id)a3;
- (id)_publicEventsForGeoEvent:(id)a3 matchingParameters:(id)a4;
- (void)cancel;
- (void)prepareForRetry;
- (void)setInvalidationTokens:(id)a3;
- (void)setResolvedPublicEventsForTimeLocationTuples:(id)a3;
- (void)submitWithHandler:(id)a3;
@end

@implementation CLSPublicEventGeoServiceQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoQueue, 0);
  objc_storeStrong((id *)&self->_invalidationTokens, 0);
  objc_storeStrong((id *)&self->_resolvedPublicEventsForTimeLocationTuples, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_parametersByTimeLocationTupleIdentifier, 0);
  objc_storeStrong((id *)&self->_timeLocationTuples, 0);
}

- (OS_dispatch_queue)geoQueue
{
  return self->_geoQueue;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setInvalidationTokens:(id)a3
{
}

- (NSDictionary)invalidationTokens
{
  return self->_invalidationTokens;
}

- (void)setResolvedPublicEventsForTimeLocationTuples:(id)a3
{
}

- (NSDictionary)resolvedPublicEventsForTimeLocationTuples
{
  return self->_resolvedPublicEventsForTimeLocationTuples;
}

- (GEOMapServiceSpatialEventLookupTicket)ticket
{
  return self->_ticket;
}

- (NSDictionary)parametersByTimeLocationTupleIdentifier
{
  return self->_parametersByTimeLocationTupleIdentifier;
}

- (double)radius
{
  return self->_radius;
}

- (NSArray)timeLocationTuples
{
  return self->_timeLocationTuples;
}

- (id)_parametersByTimeLocationTupleIdentifierForTimeLocationTuples:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v6 = +[CLSPublicEvent supportedCategories];
  v7 = [v6 allObjects];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v12 coordinates];
        double v14 = v13;
        double v16 = v15;
        id v17 = objc_alloc(MEMORY[0x1E4F28C18]);
        v18 = [v12 expandedStartDate];
        v19 = [v12 expandedEndDate];
        v20 = (void *)[v17 initWithStartDate:v18 endDate:v19];

        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64A58]), "initWithCoordinate:radius:categories:dateInterval:", v7, v20, v14, v16, self->_radius);
        v22 = [v12 timeLocationIdentifier];
        [v5 setObject:v21 forKeyedSubscript:v22];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  return v5;
}

- (id)_publicEventsForGeoEvent:(id)a3 matchingParameters:(id)a4
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v91 = a4;
  v6 = [v5 categories];
  uint64_t v100 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v95 = [v5 localizedName];
  id v98 = v5;
  v7 = [v5 identifier];
  uint64_t v93 = [v7 muid];

  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v125 objects:v140 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v103 = *(void *)v126;
    v11 = (void *)v100;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v126 != v103) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v125 + 1) + 8 * i);
        double v14 = [v13 category];
        double v15 = [[CLSPublicEventCategory alloc] initWithCategory:v14];
        double v16 = [v13 localizedNames];
        unint64_t v17 = [v16 count];
        v18 = [v16 firstObject];
        [(CLSPublicEventCategory *)v15 setLocalizedName:v18];

        unint64_t v19 = v17 - 1;
        if (v17 <= 1)
        {
          -[CLSPublicEventCategory setLocalizedSubcategories:](v15, "setLocalizedSubcategories:", MEMORY[0x1E4F1CBF0], v19);
        }
        else
        {
          v20 = objc_msgSend(v16, "subarrayWithRange:", 1, v19);
          [(CLSPublicEventCategory *)v15 setLocalizedSubcategories:v20];
        }
        [v11 addObject:v15];
        v21 = +[CLSPublicEventCategory festivalsAndFairs];
        if ([v14 isEqualToString:v21])
        {
          int v22 = 1;
        }
        else
        {
          +[CLSPublicEventCategory appleEvents];
          v24 = int v23 = v10;
          int v22 = [v14 isEqualToString:v24];

          int v10 = v23;
          v11 = (void *)v100;
        }

        v10 |= v22;
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v125 objects:v140 count:16];
    }
    while (v9);
  }
  else
  {
    LOBYTE(v10) = 0;
    v11 = (void *)v100;
  }
  char v97 = v10;

  long long v25 = [v98 performers];
  long long v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v25, "count"));
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v27 = v25;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v121 objects:v139 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v122;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v122 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v121 + 1) + 8 * j);
        v33 = [CLSPublicEventPerformer alloc];
        v34 = [v32 localizedName];
        v35 = [v32 iTunesIdentifier];
        v36 = [(CLSPublicEventPerformer *)v33 initWithLocalizedName:v34 iTunesIdentifier:v35];

        [v26 addObject:v36];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v121 objects:v139 count:16];
    }
    while (v29);
  }

  [v98 centerCoordinate];
  CLLocationCoordinate2D v39 = CLLocationCoordinate2DMake(v37, v38);
  uint64_t v40 = [v98 hours];
  v41 = [v98 timeZone];
  if (!v41)
  {
    v42 = +[CLSLogging sharedLogging];
    v43 = [v42 loggingConnection];

    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D2150000, v43, OS_LOG_TYPE_ERROR, "[EventsFetch] Time Zone is nil on GeoEvent. Using GMT as fallback", buf, 2u);
    }

    v41 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  }
  v90 = (void *)v40;
  v113[0] = MEMORY[0x1E4F143A8];
  v113[1] = 3221225472;
  v113[2] = __77__CLSPublicEventGeoServiceQuery__publicEventsForGeoEvent_matchingParameters___block_invoke;
  v113[3] = &unk_1E690F958;
  uint64_t v119 = v93;
  id v92 = v95;
  id v114 = v92;
  id v44 = v41;
  id v115 = v44;
  id v89 = v11;
  id v116 = v89;
  id v84 = v26;
  id v117 = v84;
  CLLocationCoordinate2D v120 = v39;
  id v45 = v98;
  id v118 = v45;
  v46 = (void (**)(void, void, double, double))MEMORY[0x1D2602540](v113);
  v47 = [v91 dateInterval];
  v48 = [v47 startDate];
  v49 = +[CLSCalendar localDateFromUniversalDate:v48 inTimeZone:v44];
  uint64_t v50 = +[CLSCalendar startOfDayForDate:v49];

  v87 = v47;
  v51 = v47;
  v52 = (void *)v50;
  v53 = [v51 endDate];
  id v85 = v44;
  v54 = +[CLSCalendar localDateFromUniversalDate:v53 inTimeZone:v44];
  v55 = +[CLSCalendar endOfDayForDate:v54];

  v56 = [v55 laterDate:v52];
  LODWORD(v53) = [v56 isEqualToDate:v52];

  v88 = v45;
  v86 = v55;
  if (v53)
  {
    v57 = v89;
    v58 = obj;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      id v132 = v92;
      __int16 v133 = 2048;
      uint64_t v134 = v93;
      __int16 v135 = 2112;
      v136 = v52;
      __int16 v137 = 2112;
      v138 = v55;
      _os_log_error_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[EventsFetch] Cannot ingest event %{public}@ with muid %lu. Parameters start date %@ cannot be later in time than end date %@.", buf, 0x2Au);
    }
    id v59 = (id)MEMORY[0x1E4F1CBF0];
    v61 = v84;
    v60 = v85;
    v62 = v90;
    goto LABEL_60;
  }
  v83 = v52;
  v63 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v52 endDate:v55];
  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v99 = v90;
  v58 = obj;
  char v64 = v97;
  uint64_t v104 = [v99 countByEnumeratingWithState:&v109 objects:v130 count:16];
  if (!v104) {
    goto LABEL_55;
  }
  uint64_t v65 = *(void *)v110;
  v94 = v63;
  uint64_t v96 = *(void *)v110;
  do
  {
    for (uint64_t k = 0; k != v104; ++k)
    {
      if (*(void *)v110 != v65) {
        objc_enumerationMutation(v99);
      }
      v67 = *(void **)(*((void *)&v109 + 1) + 8 * k);
      v68 = [v67 dateInterval];
      if ([v68 intersectsDateInterval:v63])
      {
        v69 = [v67 hours];
        if ([v69 count])
        {
          long long v107 = 0u;
          long long v108 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          v101 = v69;
          id v70 = v69;
          uint64_t v71 = [v70 countByEnumeratingWithState:&v105 objects:v129 count:16];
          if (v71)
          {
            uint64_t v72 = v71;
            uint64_t v73 = *(void *)v106;
            do
            {
              for (uint64_t m = 0; m != v72; ++m)
              {
                if (*(void *)v106 != v73) {
                  objc_enumerationMutation(v70);
                }
                v75 = *(void **)(*((void *)&v105 + 1) + 8 * m);
                [v75 startTime];
                double v77 = v76;
                [v75 endTime];
                v79 = ((void (**)(void, void *, double, double))v46)[2](v46, v68, v77, v78);
                [v59 addObject:v79];
              }
              uint64_t v72 = [v70 countByEnumeratingWithState:&v105 objects:v129 count:16];
            }
            while (v72);
            v58 = obj;
            v63 = v94;
          }
          v69 = v101;
          goto LABEL_51;
        }
        if (v64)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            id v132 = v92;
            __int16 v133 = 2048;
            uint64_t v134 = v93;
            _os_log_debug_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[EventsFetch] Event %{public}@ with muid %lu contains no hours. Will use full day as hours.", buf, 0x16u);
          }
          ((void (**)(void, void *, double, double))v46)[2](v46, v68, 0.0, 86400.0);
          id v70 = (id)objc_claimAutoreleasedReturnValue();
          [v59 addObject:v70];
LABEL_51:

          char v64 = v97;
          uint64_t v65 = v96;
        }
      }
    }
    uint64_t v104 = [v99 countByEnumeratingWithState:&v109 objects:v130 count:16];
  }
  while (v104);
LABEL_55:

  v61 = v84;
  v57 = v89;
  if ((unint64_t)[v59 count] >= 2)
  {
    v80 = +[CLSLogging sharedLogging];
    v81 = [v80 loggingConnection];

    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v132 = v59;
      _os_log_impl(&dword_1D2150000, v81, OS_LOG_TYPE_INFO, "Created more than one public event for Geo event. %@", buf, 0xCu);
    }

    v58 = obj;
  }

  v62 = v90;
  v60 = v85;
  v52 = v83;
LABEL_60:

  return v59;
}

CLSPublicEvent *__77__CLSPublicEventGeoServiceQuery__publicEventsForGeoEvent_matchingParameters___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  uint64_t v8 = objc_alloc_init(CLSPublicEvent);
  [(CLSPublicEvent *)v8 setMuid:*(void *)(a1 + 72)];
  [(CLSPublicEvent *)v8 setName:*(void *)(a1 + 32)];
  [(CLSPublicEvent *)v8 setLocalDateInterval:v7];

  [(CLSPublicEvent *)v8 setLocalStartTime:a3];
  [(CLSPublicEvent *)v8 setLocalEndTime:a4];
  [(CLSPublicEvent *)v8 setTimeZone:*(void *)(a1 + 40)];
  [(CLSPublicEvent *)v8 setCategories:*(void *)(a1 + 48)];
  [(CLSPublicEvent *)v8 setPerformers:*(void *)(a1 + 56)];
  -[CLSPublicEvent setBusinessItemCoordinates:](v8, "setBusinessItemCoordinates:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  uint64_t v9 = [*(id *)(a1 + 64) relatedPOIIdentifiers];
  int v10 = [v9 firstObject];
  -[CLSPublicEvent setBusinessItemMuid:](v8, "setBusinessItemMuid:", [v10 muid]);

  -[CLSPublicEvent setExpectedAttendance:](v8, "setExpectedAttendance:", [*(id *)(a1 + 64) expectedAttendance]);
  return v8;
}

- (void)prepareForRetry
{
  self->_isCancelled = 0;
  id v6 = [(NSDictionary *)self->_parametersByTimeLocationTupleIdentifier allValues];
  v3 = [MEMORY[0x1E4F64710] sharedService];
  id v4 = [v3 ticketForSpatialEventLookupParameters:v6 traits:0];
  ticket = self->_ticket;
  self->_ticket = v4;
}

- (void)cancel
{
  self->_isCancelled = 1;
  [(GEOMapServiceSpatialEventLookupTicket *)self->_ticket cancel];
}

- (void)submitWithHandler:(id)a3
{
  id v4 = a3;
  ticket = self->_ticket;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__CLSPublicEventGeoServiceQuery_submitWithHandler___block_invoke;
  v8[3] = &unk_1E690F930;
  v8[4] = self;
  id v9 = v4;
  geoQueue = self->_geoQueue;
  id v7 = v4;
  [(GEOMapServiceSpatialEventLookupTicket *)ticket submitWithHandler:v8 queue:geoQueue];
}

void __51__CLSPublicEventGeoServiceQuery_submitWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6 && [v6 code] != -8)
  {
    v12 = +[CLSLogging sharedLogging];
    uint64_t v8 = [v12 loggingConnection];

    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    id v10 = [*(id *)(a1 + 32) timeLocationTuples];
    *(_DWORD *)buf = 138412547;
    v18 = v7;
    __int16 v19 = 2113;
    id v20 = v10;
    _os_log_error_impl(&dword_1D2150000, v8, OS_LOG_TYPE_ERROR, "[EventsFetch] Error fetching public events: %@. timeLocationTuples %{private}@", buf, 0x16u);
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) parametersByTimeLocationTupleIdentifier];
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSObject count](v8, "count"));
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__CLSPublicEventGeoServiceQuery_submitWithHandler___block_invoke_7;
    v13[3] = &unk_1E690F908;
    id v14 = v5;
    id v15 = v9;
    uint64_t v16 = *(void *)(a1 + 32);
    id v11 = v9;
    [v8 enumerateKeysAndObjectsUsingBlock:v13];
    [*(id *)(a1 + 32) setResolvedPublicEventsForTimeLocationTuples:v11];
    [*(id *)(a1 + 32) setInvalidationTokens:v10];
  }
LABEL_6:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __51__CLSPublicEventGeoServiceQuery_submitWithHandler___block_invoke_7(id *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] poiEventsForSpatialLookupParameters:v6];
  uint64_t v8 = [v7 count];
  if (v8)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v8];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = objc_msgSend(a1[6], "_publicEventsForGeoEvent:matchingParameters:", *(void *)(*((void *)&v16 + 1) + 8 * v14), v6, (void)v16);
          [v9 addObjectsFromArray:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CAD0] set];
  }
  objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v9, v5, (void)v16);
}

- (CLSPublicEventGeoServiceQuery)initWithTimeLocationTuples:(id)a3 radius:(double)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSPublicEventGeoServiceQuery;
  uint64_t v8 = [(CLSPublicEventGeoServiceQuery *)&v20 init];
  if (v8)
  {
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.photos.mediamining.georequest.publicevent", v9);
    geoQueue = v8->_geoQueue;
    v8->_geoQueue = (OS_dispatch_queue *)v10;

    v8->_isCancelled = 0;
    objc_storeStrong((id *)&v8->_timeLocationTuples, a3);
    v8->_radius = a4;
    uint64_t v12 = [(CLSPublicEventGeoServiceQuery *)v8 _parametersByTimeLocationTupleIdentifierForTimeLocationTuples:v7];
    objc_storeStrong((id *)&v8->_parametersByTimeLocationTupleIdentifier, v12);
    uint64_t v13 = [v12 allValues];
    uint64_t v14 = [MEMORY[0x1E4F64710] sharedService];
    uint64_t v15 = [v14 ticketForSpatialEventLookupParameters:v13 traits:0];
    ticket = v8->_ticket;
    v8->_ticket = (GEOMapServiceSpatialEventLookupTicket *)v15;

    if (!v8->_ticket)
    {
      long long v17 = +[CLSLogging sharedLogging];
      long long v18 = [v17 loggingConnection];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        int v22 = v13;
        __int16 v23 = 2112;
        id v24 = v7;
        _os_log_error_impl(&dword_1D2150000, v18, OS_LOG_TYPE_ERROR, "[EventsFetch] Cannot create ticket for parameters %@, tuples %@", buf, 0x16u);
      }

      uint64_t v8 = 0;
    }
  }
  return v8;
}

+ (unint64_t)maximumBatchSize
{
  v2 = [MEMORY[0x1E4F64710] sharedService];
  unint64_t v3 = [v2 maxParametersCountForSpatialEventLookup];

  return v3;
}

@end