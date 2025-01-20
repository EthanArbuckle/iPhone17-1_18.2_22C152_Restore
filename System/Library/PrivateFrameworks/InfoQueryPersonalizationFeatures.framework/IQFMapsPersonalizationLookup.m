@interface IQFMapsPersonalizationLookup
+ (id)_aggregateLifeEvents:(id)a3;
+ (id)_muidForKnosisAnswer:(id)a3 entityIDToMuid:(id)a4;
+ (id)_parseECRRankedItem:(id)a3 locationMUIDs:(id)a4;
+ (id)_parseKnosisAnswer:(id)a3 entityIDToMuid:(id)a4;
+ (id)sharedMapsPersonalizationLookup;
+ (void)_fetchResultsForEntityIds:(id)a3 knosisServer:(id)a4 completionHandler:(id)a5;
- (IQFMapsPersonalizationLookup)init;
- (id)eventsAtLocations:(id)a3;
- (void)_fetchECRResultForLocationMUIDs:(id)a3 completionHandler:(id)a4;
- (void)_fetchResultsForEntityIds:(id)a3 completionHandler:(id)a4;
- (void)eventsAtLocations:(id)a3 completionHandler:(id)a4;
- (void)init;
@end

@implementation IQFMapsPersonalizationLookup

- (IQFMapsPersonalizationLookup)init
{
  v12.receiver = self;
  v12.super_class = (Class)IQFMapsPersonalizationLookup;
  v2 = [(IQFMapsPersonalizationLookup *)&v12 init];
  if (!v2) {
    goto LABEL_4;
  }
  id v11 = 0;
  uint64_t v3 = [objc_alloc(MEMORY[0x263F4E880]) initWithMode:4 warmup:1 error:&v11];
  id v4 = v11;
  ecrClient = v2->_ecrClient;
  v2->_ecrClient = (GDEntityResolutionInProcessTextClient *)v3;

  if (v2->_ecrClient)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F4E8C8]) initWithEntitySubgraphView];
    knosisServer = v2->_knosisServer;
    v2->_knosisServer = (GDKnosisServer *)v6;

LABEL_4:
    v8 = v2;
    goto LABEL_8;
  }
  v9 = IQFLogCategoryDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[IQFMapsPersonalizationLookup init]();
  }

  v8 = 0;
LABEL_8:

  return v8;
}

+ (id)sharedMapsPersonalizationLookup
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!sharedMapsPersonalizationLookup_personalizationLookup)
  {
    uint64_t v3 = objc_opt_new();
    id v4 = (void *)sharedMapsPersonalizationLookup_personalizationLookup;
    sharedMapsPersonalizationLookup_personalizationLookup = v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)sharedMapsPersonalizationLookup_personalizationLookup;

  return v5;
}

- (id)eventsAtLocations:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__IQFMapsPersonalizationLookup_eventsAtLocations___block_invoke;
  v9[3] = &unk_2653868C0;
  id v11 = &v12;
  uint64_t v6 = v5;
  v10 = v6;
  [(IQFMapsPersonalizationLookup *)self eventsAtLocations:v4 completionHandler:v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __50__IQFMapsPersonalizationLookup_eventsAtLocations___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)eventsAtLocations:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = IQFLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[IQFMapsPersonalizationLookup eventsAtLocations:completionHandler:](v8);
  }

  v9 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [*(id *)(*((void *)&v31 + 1) + 8 * v14) muid];
        [v9 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v12);
  }

  v16 = IQFLogCategoryDefault();
  os_signpost_id_t v17 = os_signpost_id_generate(v16);
  v18 = v16;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2529E5000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "ecrCallForLocations", " enableTelemetry=YES ", buf, 2u);
  }

  v20 = [v9 allObjects];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke;
  v24[3] = &unk_265386910;
  id v28 = v7;
  os_signpost_id_t v29 = v17;
  v25 = v19;
  id v26 = v9;
  v27 = self;
  id v21 = v9;
  id v22 = v7;
  v23 = v19;
  [(IQFMapsPersonalizationLookup *)self _fetchECRResultForLocationMUIDs:v20 completionHandler:v24];
}

void __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2529E5000, v8, OS_SIGNPOST_INTERVAL_END, v9, "ecrCallForLocations", (const char *)&unk_2529EE612, buf, 2u);
  }

  id v10 = IQFLogCategoryDefault();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    long long v34 = v6;
    if (v11) {
      __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke_cold_3();
    }

    uint64_t v12 = objc_opt_new();
    id v40 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v35 = v5;
    id obj = [v5 rankedResults];
    uint64_t v38 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v38)
    {
      uint64_t v37 = *(void *)v52;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v52 != v37) {
            objc_enumerationMutation(obj);
          }
          uint64_t v39 = v13;
          uint64_t v14 = *(void **)(*((void *)&v51 + 1) + 8 * v13);
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          v15 = objc_msgSend(v14, "rankedItems", v34);
          uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v56 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v48;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v48 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                id v21 = +[IQFMapsPersonalizationLookup _parseECRRankedItem:v20 locationMUIDs:*(void *)(a1 + 40)];
                if (v21)
                {
                  [v12 addObject:v21];
                  id v22 = [v20 entityID];
                  v23 = [v22 stringValue];

                  v24 = [v21 muid];
                  [v40 setObject:v24 forKeyedSubscript:v23];
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v56 count:16];
            }
            while (v17);
          }

          uint64_t v13 = v39 + 1;
        }
        while (v39 + 1 != v38);
        uint64_t v38 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v38);
    }

    v25 = IQFLogCategoryDefault();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke_cold_2(v25);
    }

    os_signpost_id_t v26 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
    v27 = *(id *)(a1 + 32);
    id v28 = v27;
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2529E5000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "fetchResultsForEntityIds", (const char *)&unk_2529EE612, buf, 2u);
    }

    os_signpost_id_t v29 = *(void **)(a1 + 48);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke_50;
    v41[3] = &unk_2653868E8;
    id v30 = *(id *)(a1 + 32);
    os_signpost_id_t v46 = v26;
    id v42 = v30;
    id v43 = v12;
    id v45 = *(id *)(a1 + 56);
    id v6 = v34;
    id v44 = v34;
    id v31 = v12;
    long long v32 = v40;
    [v29 _fetchResultsForEntityIds:v40 completionHandler:v41];

    id v5 = v35;
  }
  else
  {
    if (v11) {
      __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke_cold_1();
    }

    uint64_t v33 = *(void *)(a1 + 56);
    long long v32 = objc_opt_new();
    (*(void (**)(uint64_t, void *, id))(v33 + 16))(v33, v32, v6);
  }
}

void __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke_50(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 64);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_2529E5000, v5, OS_SIGNPOST_INTERVAL_END, v6, "fetchResultsForEntityIds", (const char *)&unk_2529EE612, v7, 2u);
  }

  [*(id *)(a1 + 40) addObjectsFromArray:v3];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_fetchECRResultForLocationMUIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 componentsJoinedByString:@", "];
  v8 = IQFLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[IQFMapsPersonalizationLookup _fetchECRResultForLocationMUIDs:completionHandler:]();
  }

  id v9 = objc_alloc(MEMORY[0x263F4E888]);
  id v10 = [NSString stringWithFormat:@"locationWithMuid([%@])", v7];
  BOOL v11 = (void *)[v9 initWithKgq:v10 text:0 mode:4 includeFeatures:1];

  uint64_t v12 = IQFLogCategoryDefault();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[IQFMapsPersonalizationLookup _fetchECRResultForLocationMUIDs:completionHandler:]();
  }

  [(GDEntityResolutionInProcessTextClient *)self->_ecrClient resolveEntitiesForRequest:v11 completionHandler:v6];
}

- (void)_fetchResultsForEntityIds:(id)a3 completionHandler:(id)a4
{
}

+ (void)_fetchResultsForEntityIds:(id)a3 knosisServer:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [v8 allKeys];
  if ([v11 count])
  {
    id v12 = objc_alloc(MEMORY[0x263F4E8B8]);
    uint64_t v13 = NSString;
    uint64_t v14 = [v11 componentsJoinedByString:@","];
    v15 = [v13 stringWithFormat:@"searchEntityByLocation([%@])", v14];
    uint64_t v16 = (void *)[v12 initWithKGQ:v15 query:&stru_2702E2888 limit:&unk_2702E3290 offset:&unk_2702E32A8];

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __89__IQFMapsPersonalizationLookup__fetchResultsForEntityIds_knosisServer_completionHandler___block_invoke;
    v18[3] = &unk_265386938;
    id v20 = v10;
    id v21 = a1;
    id v19 = v8;
    [v9 executeKGQ:v16 completionHandler:v18];
  }
  else
  {
    uint64_t v17 = objc_opt_new();
    (*((void (**)(id, void *))v10 + 2))(v10, v17);
  }
}

void __89__IQFMapsPersonalizationLookup__fetchResultsForEntityIds_knosisServer_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3 && [v3 status] == 1)
  {
    id v5 = IQFLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __89__IQFMapsPersonalizationLookup__fetchResultsForEntityIds_knosisServer_completionHandler___block_invoke_cold_2(v4, v5);
    }

    id v6 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = objc_msgSend(v4, "answers", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(a1 + 48) _parseKnosisAnswer:*(void *)(*((void *)&v16 + 1) + 8 * v11) entityIDToMuid:*(void *)(a1 + 32)];
          if (v12) {
            [v6 addObject:v12];
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    uint64_t v13 = [*(id *)(a1 + 48) _aggregateLifeEvents:v6];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v14 = IQFLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __89__IQFMapsPersonalizationLookup__fetchResultsForEntityIds_knosisServer_completionHandler___block_invoke_cold_1(v4, v14);
    }

    uint64_t v15 = *(void *)(a1 + 40);
    id v6 = objc_opt_new();
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v6);
  }
}

+ (id)_parseECRRankedItem:(id)a3 locationMUIDs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 sourceID];
  uint64_t v8 = [v7 value];

  if ([v8 length] && (objc_msgSend(v6, "containsObject:", v8) & 1) != 0)
  {
    uint64_t v9 = IQFLogCategoryDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[IQFMapsPersonalizationLookup _parseECRRankedItem:locationMUIDs:]();
    }

    uint64_t v10 = [v5 features];
    int v11 = [v10 locationLastExecutionAge];

    if (v11) {
      [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)-v11];
    }
    else {
    id v12 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:0.0];
    }
    uint64_t v14 = [IQFMapsPersonalizationResult alloc];
    uint64_t v15 = NSNumber;
    long long v16 = [v5 features];
    [v16 locationTrendingPopularity];
    long long v17 = objc_msgSend(v15, "numberWithDouble:");
    long long v18 = NSNumber;
    long long v19 = [v5 features];
    [v19 locationPopularityGivenSpecificGeoHash];
    id v20 = objc_msgSend(v18, "numberWithDouble:");
    uint64_t v21 = NSNumber;
    [v5 entityRelevance];
    id v22 = objc_msgSend(v21, "numberWithDouble:");
    uint64_t v13 = [(IQFMapsPersonalizationResult *)v14 initWithMUID:v8 resultType:10 eventName:0 startEventDate:0 endEventDate:0 terminal:0 flightCode:0 ticketNumber:0 numberOfVisits:v17 numberOfVisitsGivenLocation:v20 dateOfLastVisit:v12 entityRelevanceScore:v22 numberOfGuests:0];

    v23 = IQFLogCategoryDefault();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      +[IQFMapsPersonalizationLookup _parseECRRankedItem:locationMUIDs:]((uint64_t)v8, v23);
    }
  }
  else
  {
    id v12 = IQFLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[IQFMapsPersonalizationLookup _parseECRRankedItem:locationMUIDs:]();
    }
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)_parseKnosisAnswer:(id)a3 entityIDToMuid:(id)a4
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _muidForKnosisAnswer:v6 entityIDToMuid:v7];
  if (!v8)
  {
    v60 = 0;
    goto LABEL_67;
  }
  id v63 = v7;
  v64 = v8;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v9 = [v6 facts];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v80 objects:v86 count:16];
  if (!v10)
  {

    uint64_t v13 = 0;
    id v12 = 0;
    v70 = 0;
LABEL_63:
    v61 = IQFLogCategoryDefault();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
      +[IQFMapsPersonalizationLookup _parseKnosisAnswer:entityIDToMuid:]();
    }
    goto LABEL_65;
  }
  uint64_t v11 = v10;
  v70 = 0;
  uint64_t v71 = 0;
  id v12 = 0;
  uint64_t v13 = 0;
  uint64_t v68 = *(void *)v81;
  v65 = v9;
  do
  {
    uint64_t v14 = 0;
    uint64_t v66 = v11;
    do
    {
      if (*(void *)v81 != v68) {
        objc_enumerationMutation(v9);
      }
      uint64_t v69 = v14;
      uint64_t v15 = *(void **)(*((void *)&v80 + 1) + 8 * v14);
      long long v16 = [v15 predicateId];
      if ([v16 isEqualToString:@"PS33"])
      {
        uint64_t v17 = [v15 objectID];

        uint64_t v13 = (void *)v17;
        goto LABEL_36;
      }
      long long v18 = v16;
      if ([v16 isEqualToString:@"nm_hasDate"])
      {
        v67 = v13;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v19 = [v15 qualifiers];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v76 objects:v85 count:16];
        if (!v20) {
          goto LABEL_35;
        }
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v77;
        while (1)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v77 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v76 + 1) + 8 * i);
            v25 = [v24 predicateId];
            int v26 = [v25 isEqualToString:@"nm_imputedStartTime"];

            if (v26)
            {
              v27 = (void *)MEMORY[0x263EFF910];
              id v28 = [v24 objectID];
              [v28 doubleValue];
              uint64_t v29 = objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
              id v30 = v12;
              id v12 = (void *)v29;
            }
            else
            {
              id v31 = [v24 predicateId];
              int v32 = [v31 isEqualToString:@"nm_imputedEndTime"];

              if (!v32) {
                goto LABEL_20;
              }
              uint64_t v33 = (void *)MEMORY[0x263EFF910];
              id v28 = [v24 objectID];
              [v28 doubleValue];
              uint64_t v34 = objc_msgSend(v33, "dateWithTimeIntervalSinceReferenceDate:");
              id v30 = v70;
              v70 = (void *)v34;
            }

LABEL_20:
            long long v16 = v18;
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v76 objects:v85 count:16];
          if (!v21) {
            goto LABEL_35;
          }
        }
      }
      if ([v16 isEqualToString:@"PS72"])
      {
        v67 = v13;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v19 = [v15 qualifiers];
        uint64_t v35 = [v19 countByEnumeratingWithState:&v72 objects:v84 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v73;
          do
          {
            for (uint64_t j = 0; j != v36; ++j)
            {
              if (*(void *)v73 != v37) {
                objc_enumerationMutation(v19);
              }
              uint64_t v39 = *(void **)(*((void *)&v72 + 1) + 8 * j);
              id v40 = [v39 predicateId];
              int v41 = [v40 isEqualToString:@"PS396"];

              if (v41)
              {
                id v42 = [v39 objectID];
                int v43 = [v42 isEqual:@"EKCalendarItemIdentifier"];

                uint64_t v44 = v71;
                if (v43) {
                  uint64_t v44 = 9;
                }
                uint64_t v71 = v44;
              }
              long long v16 = v18;
            }
            uint64_t v36 = [v19 countByEnumeratingWithState:&v72 objects:v84 count:16];
          }
          while (v36);
        }
LABEL_35:

        uint64_t v11 = v66;
        uint64_t v13 = v67;
        uint64_t v9 = v65;
      }
      else
      {
        if (![v16 isEqual:@"nm_sgEventType"])
        {
          if (![v16 isEqualToString:@"PS1"]) {
            goto LABEL_36;
          }
          long long v48 = [v15 objectID];
          int v49 = [v48 isEqualToString:@"SB764"];

          uint64_t v47 = v71;
          if (v49) {
            uint64_t v47 = 1;
          }
          goto LABEL_49;
        }
        id v45 = [v15 objectID];
        char v46 = [v45 isEqualToString:@"FlightReservation"];

        if (v46)
        {
          uint64_t v47 = 2;
LABEL_49:
          uint64_t v71 = v47;
          goto LABEL_36;
        }
        long long v50 = [v15 objectID];
        char v51 = [v50 isEqualToString:@"FoodEstablishmentReservation"];

        if (v51)
        {
          uint64_t v47 = 4;
          goto LABEL_49;
        }
        long long v52 = [v15 objectID];
        char v53 = [v52 isEqualToString:@"LodgingReservation"];

        if (v53)
        {
          uint64_t v47 = 5;
          goto LABEL_49;
        }
        long long v54 = [v15 objectID];
        int v55 = [v54 isEqualToString:@"RentalCarReservation"];

        uint64_t v56 = v71;
        if (v55) {
          uint64_t v56 = 6;
        }
        uint64_t v71 = v56;
      }
LABEL_36:

      uint64_t v14 = v69 + 1;
    }
    while (v69 + 1 != v11);
    uint64_t v57 = [v9 countByEnumeratingWithState:&v80 objects:v86 count:16];
    uint64_t v11 = v57;
  }
  while (v57);

  if (!v71) {
    goto LABEL_63;
  }
  if (isCalendarBasedPersonalizationResultType(v71) && (!v12 || ([v12 isDateInTodayOrFuture] & 1) == 0))
  {
    v61 = IQFLogCategoryDefault();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
      +[IQFMapsPersonalizationLookup _parseKnosisAnswer:entityIDToMuid:]();
    }
LABEL_65:

    v60 = 0;
    v59 = v70;
    goto LABEL_66;
  }
  uint64_t v58 = IQFLogCategoryDefault();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
    +[IQFMapsPersonalizationLookup _parseKnosisAnswer:entityIDToMuid:]();
  }

  v59 = v70;
  v60 = [[IQFMapsPersonalizationResult alloc] initWithMUID:v64 resultType:v71 eventName:v13 startEventDate:v12 endEventDate:v70 terminal:0 flightCode:0 ticketNumber:0 numberOfVisits:0 numberOfVisitsGivenLocation:0 dateOfLastVisit:0 entityRelevanceScore:&unk_2702E32A8 numberOfGuests:0];
LABEL_66:

  id v7 = v63;
  uint64_t v8 = v64;
LABEL_67:

  return v60;
}

+ (id)_aggregateLifeEvents:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  id v31 = (id)objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if ([v10 resultType] == 1)
        {
          uint64_t v11 = [v10 muid];
          id v12 = [v4 objectForKeyedSubscript:v11];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "intValue") + 1);
          }
          else
          {
            uint64_t v14 = &unk_2702E32C0;
          }
          [v4 setValue:v14 forKey:v11];
          uint64_t v15 = [v5 objectForKeyedSubscript:v11];
          long long v16 = [v10 endEventDate];
          uint64_t v17 = v16;
          if (v15)
          {
            uint64_t v18 = [v16 laterDate:v15];

            uint64_t v17 = (void *)v18;
          }
          [v5 setValue:v17 forKey:v11];
        }
        else
        {
          [v31 addObject:v10];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v7);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v29 = [v4 allKeys];
  uint64_t v19 = [v29 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v29);
        }
        uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        v24 = [IQFMapsPersonalizationResult alloc];
        v25 = [v4 objectForKey:v23];
        int v26 = [v5 objectForKey:v23];
        v27 = [(IQFMapsPersonalizationResult *)v24 initWithMUID:v23 resultType:1 eventName:0 startEventDate:0 endEventDate:0 terminal:0 flightCode:0 ticketNumber:0 numberOfVisits:v25 numberOfVisitsGivenLocation:0 dateOfLastVisit:v26 entityRelevanceScore:0 numberOfGuests:0];

        [v31 addObject:v27];
      }
      uint64_t v20 = [v29 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v20);
  }

  return v31;
}

+ (id)_muidForKnosisAnswer:(id)a3 entityIDToMuid:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v6 = [a3 parents];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v43;
    id v31 = v6;
    uint64_t v27 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v12 = [v11 facts];
        uint64_t v32 = [v12 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v32)
        {
          uint64_t v13 = *(void *)v39;
          uint64_t v28 = i;
          uint64_t v29 = v8;
          long long v33 = v12;
          uint64_t v30 = *(void *)v39;
          do
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v39 != v13) {
                objc_enumerationMutation(v12);
              }
              uint64_t v15 = *(void **)(*((void *)&v38 + 1) + 8 * j);
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              long long v16 = [v15 qualifiers];
              uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v46 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v35;
                while (2)
                {
                  for (uint64_t k = 0; k != v18; ++k)
                  {
                    if (*(void *)v35 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    uint64_t v21 = *(void **)(*((void *)&v34 + 1) + 8 * k);
                    uint64_t v22 = [v21 predicateId];
                    int v23 = [v22 isEqual:@"PS107"];

                    if (v23)
                    {
                      v24 = [v21 objectID];
                      v25 = [v5 objectForKey:v24];

                      if (v25)
                      {

                        uint64_t v6 = v31;
                        goto LABEL_27;
                      }
                    }
                  }
                  uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v46 count:16];
                  if (v18) {
                    continue;
                  }
                  break;
                }
              }

              id v12 = v33;
              uint64_t v13 = v30;
            }
            uint64_t v6 = v31;
            uint64_t v9 = v27;
            uint64_t i = v28;
            uint64_t v8 = v29;
            uint64_t v32 = [v33 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }
          while (v32);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v42 objects:v48 count:16];
      v25 = 0;
    }
    while (v8);
  }
  else
  {
    v25 = 0;
  }
LABEL_27:

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knosisServer, 0);

  objc_storeStrong((id *)&self->_ecrClient, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_2529E5000, v0, OS_LOG_TYPE_ERROR, "IQFMapsPersonalizationLookup: Unable to initialize GDEntityResolutionInProcessTextClient with error: %@", v1, 0xCu);
}

- (void)eventsAtLocations:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2529E5000, log, OS_LOG_TYPE_DEBUG, "IQFMapsPersonalizationLookup: ECR & Knosis lookup for locations", v1, 2u);
}

void __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2529E5000, v0, v1, "IQFMapsPersonalizationLookup: ECR returned error %@", v2, v3, v4, v5, v6);
}

void __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_2529E5000, log, OS_LOG_TYPE_DEBUG, "IQFMapsPersonalizationLookup: making Knosis call for results", v1, 2u);
}

void __68__IQFMapsPersonalizationLookup_eventsAtLocations_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2529E5000, v0, v1, "IQFMapsPersonalizationLookup: ECR returned result %@", v2, v3, v4, v5, v6);
}

- (void)_fetchECRResultForLocationMUIDs:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2529E5000, v0, v1, "IQFMapsPersonalizationLookup: ECR request %@", v2, v3, v4, v5, v6);
}

- (void)_fetchECRResultForLocationMUIDs:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2529E5000, v0, v1, "IQFMapsPersonalizationLookup: ECR muid lookup string %@", v2, v3, v4, v5, v6);
}

void __89__IQFMapsPersonalizationLookup__fetchResultsForEntityIds_knosisServer_completionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 status];
  uint64_t v5 = [a1 errorMessage];
  int v6 = 134218242;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_2529E5000, a2, OS_LOG_TYPE_DEBUG, "IQFMapsPersonalizationLookup: Knosis returned status: %tu, error: %@", (uint8_t *)&v6, 0x16u);
}

void __89__IQFMapsPersonalizationLookup__fetchResultsForEntityIds_knosisServer_completionHandler___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 answers];
  [v3 count];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_2529E5000, a2, OS_LOG_TYPE_DEBUG, "IQFMapsPersonalizationLookup: Knosis returned result with %tu answers", v4, 0xCu);
}

+ (void)_parseECRRankedItem:locationMUIDs:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_2529E5000, v0, OS_LOG_TYPE_ERROR, "IQFMapsPersonalizationLookup: no sourceID for ECR item or sourceID does not match location MUIDs: %@", v1, 0xCu);
}

+ (void)_parseECRRankedItem:(uint64_t)a1 locationMUIDs:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218242;
  uint64_t v3 = 1;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_2529E5000, a2, OS_LOG_TYPE_DEBUG, "IQFMapsPersonalizationLookup: Found personalization result of type %tu for muid: %@", (uint8_t *)&v2, 0x16u);
}

+ (void)_parseECRRankedItem:locationMUIDs:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2529E5000, v0, v1, "IQFMapsPersonalizationLookup: source muid for ranked item %@", v2, v3, v4, v5, v6);
}

+ (void)_parseKnosisAnswer:entityIDToMuid:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_2529E5000, v0, v1, "IQFMapsPersonalizationLookup: Skipping personalization result of type %tu for muid: %@");
}

+ (void)_parseKnosisAnswer:entityIDToMuid:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_2529E5000, v0, v1, "IQFMapsPersonalizationLookup: Skipping personalization result of type %tu for muid: %@ because start date is missing or in the past");
}

+ (void)_parseKnosisAnswer:entityIDToMuid:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_2529E5000, v0, v1, "IQFMapsPersonalizationLookup: Found personalization result of type %tu for muid: %@");
}

@end