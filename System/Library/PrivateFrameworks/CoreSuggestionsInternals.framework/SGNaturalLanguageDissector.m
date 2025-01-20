@interface SGNaturalLanguageDissector
+ (BOOL)allowNaturalLanguageDissector;
+ (id)_personForCSPerson:(id)a3;
+ (id)ipsosMessageWithMailMessage:(id)a3 store:(id)a4;
+ (id)ipsosMessageWithTextMessage:(id)a3 store:(id)a4;
+ (id)sharedInstance;
- (BOOL)_shouldProcessMessage:(id)a3 entity:(id)a4;
- (id)_init;
- (id)conversationWithIdentifier:(id)a3;
- (void)_tagNaturalLanguageEnrichmentsForEntity:(id)a3;
- (void)addEnrichmentForEvents:(id)a3 forMessage:(id)a4 toEntity:(id)a5;
- (void)clearConversations;
- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5;
- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5;
@end

@implementation SGNaturalLanguageDissector

- (void).cxx_destruct
{
}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1CB79B230]();
  if ([(SGNaturalLanguageDissector *)self _shouldProcessMessage:v8 entity:v9])
  {
    char v12 = [v9 hasEventEnrichment];
    if ((v12 & 1) == 0)
    {
      v13 = (void *)MEMORY[0x1CB79B230]([v9 releaseDissectorLock]);
      v14 = objc_opt_class();
      v15 = [v10 serviceContext];
      v16 = [v15 store];
      v17 = [v14 ipsosMessageWithTextMessage:v8 store:v16];

      v18 = [v8 conversationIdentifier];
      v19 = [(SGNaturalLanguageDissector *)self conversationWithIdentifier:v18];

      id v20 = v19;
      objc_sync_enter(v20);
      v21 = (void *)MEMORY[0x1CB79B230]([v20 addMessage:v17]);
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = __64__SGNaturalLanguageDissector_dissectTextMessage_entity_context___block_invoke;
      v28 = &unk_1E65BEB60;
      id v22 = v9;
      id v29 = v22;
      v30 = self;
      id v23 = v17;
      id v31 = v23;
      id v24 = v20;
      id v32 = v24;
      [v24 scanEventsInLastMessageOnly:1 synchronously:1 completionHandler:&v25];

      objc_sync_exit(v24);

      objc_msgSend(v22, "acquireDissectorLock", v25, v26, v27, v28);
      [(SGNaturalLanguageDissector *)self _tagNaturalLanguageEnrichmentsForEntity:v22];
    }
  }
  else
  {
  }
}

void __64__SGNaturalLanguageDissector_dissectTextMessage_entity_context___block_invoke(id *a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1CB79B230]();
  [a1[4] acquireDissectorLock];
  [a1[5] addEnrichmentForEvents:v8 forMessage:a1[6] toEntity:a1[4]];
  if (a4)
  {
    id v10 = [a1[7] allMessages];
    id v12 = a1[6];
    v11 = sgMapAndFilter();

    [a1[4] setInvalidatedMessageIdentifiers:v11];
  }
  [a1[4] releaseDissectorLock];
}

id __64__SGNaturalLanguageDissector_dissectTextMessage_entity_context___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2)
  {
    v2 = 0;
  }
  else
  {
    v2 = [a2 identifier];
  }
  return v2;
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1CB79B230]();
  if (![(SGNaturalLanguageDissector *)self _shouldProcessMessage:v8 entity:v9]) {
    goto LABEL_4;
  }
  id v12 = [v8 htmlParser];
  v13 = [v12 tabularRegions];
  if ([v13 count])
  {
    char v14 = [v9 isInhuman];

    if (v14)
    {
LABEL_4:
      goto LABEL_5;
    }
  }
  else
  {
  }
  char v15 = [v9 hasEventEnrichment];
  if ((v15 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1CB79B230]([v9 releaseDissectorLock]);
    v17 = objc_opt_class();
    v18 = [v10 serviceContext];
    v19 = [v18 store];
    id v20 = [v17 ipsosMessageWithMailMessage:v8 store:v19];

    v21 = (void *)MEMORY[0x1CB79B230]();
    id v22 = (void *)MEMORY[0x1E4F5F218];
    id v23 = [v20 messageUnits];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __64__SGNaturalLanguageDissector_dissectMailMessage_entity_context___block_invoke;
    v26[3] = &unk_1E65BEB10;
    id v24 = v9;
    id v27 = v24;
    v28 = self;
    id v25 = v20;
    id v29 = v25;
    [v22 scanEventsInMessageUnits:v23 synchronously:1 completionHandler:v26];

    [v24 acquireDissectorLock];
    [(SGNaturalLanguageDissector *)self _tagNaturalLanguageEnrichmentsForEntity:v24];
  }
LABEL_5:
}

void __64__SGNaturalLanguageDissector_dissectMailMessage_entity_context___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = (void *)MEMORY[0x1CB79B230]();
  [*(id *)(a1 + 32) acquireDissectorLock];
  [*(id *)(a1 + 40) addEnrichmentForEvents:v4 forMessage:*(void *)(a1 + 48) toEntity:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) releaseDissectorLock];
}

- (void)_tagNaturalLanguageEnrichmentsForEntity:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(v3, "enrichments", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        id v10 = (void *)MEMORY[0x1CB79B230]();
        v11 = [v9 duplicateKey];
        [v11 entityType];
        if (SGEntityTypeIsEvent())
        {
          int v12 = [v9 isNaturalLanguageEvent];

          if (v12) {
            [MEMORY[0x1E4F5DAB8] recordInteractionForEventWithInterface:0 actionType:0 harvestedEKEvent:0 curatedEKEvent:0];
          }
        }
        else
        {
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (BOOL)_shouldProcessMessage:(id)a3 entity:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!+[SGNaturalLanguageDissector allowNaturalLanguageDissector])
  {
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v17 = "Skipping NL dissector: allowNaturalLanguageDissector is OFF";
      goto LABEL_16;
    }
LABEL_20:
    LOBYTE(v8) = 0;
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v7 = [v5 textContent];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = objc_msgSend(v5, "attachments", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(*((void *)&v20 + 1) + 8 * i) isCalendarMimeType])
          {
            uint64_t v18 = sgLogHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1CA650000, v18, OS_LOG_TYPE_DEBUG, "Ignoring NL dissection because an iCalendar attachment exists.", buf, 2u);
            }

            goto LABEL_20;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    long long v14 = [v6 tags];
    long long v15 = [MEMORY[0x1E4F5D9F0] templateException];
    int v16 = [v14 containsObject:v15];

    if (!v16)
    {
      id v9 = [MEMORY[0x1E4F5D9F0] fullyDissected];
      [v6 addTag:v9];
      LOBYTE(v8) = 1;
      goto LABEL_21;
    }
    id v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v17 = "Ignoring NL dissection because document was matched by a template";
LABEL_16:
      _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, v17, buf, 2u);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
LABEL_22:

  return v8;
}

- (id)conversationWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_conversations objectForKeyedSubscript:v4];
  if (!v6)
  {
    id v6 = objc_opt_new();
    [(NSMutableDictionary *)v5->_conversations setObject:v6 forKeyedSubscript:v4];
  }
  objc_sync_exit(v5);

  return v6;
}

- (void)addEnrichmentForEvents:(id)a3 forMessage:(id)a4 toEntity:(id)a5
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v116 = a4;
  id v122 = a5;
  v109 = v7;
  if ([v7 count])
  {
    v120 = objc_opt_new();
    long long v140 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    uint64_t v8 = [v116 recipients];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v140 objects:v149 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v141;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v141 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v140 + 1) + 8 * i);
          long long v13 = [v12 handle];

          if (v13)
          {
            long long v14 = [v12 handle];
            [v120 addObject:v14];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v140 objects:v149 count:16];
      }
      while (v9);
    }

    long long v15 = [v116 sender];
    if (v15)
    {
      int v16 = [v116 sender];
      v17 = [v16 handle];
      BOOL v18 = v17 == 0;

      if (!v18)
      {
        v19 = [v116 sender];
        long long v20 = [v19 handle];
        [v120 addObject:v20];
      }
    }
    long long v21 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v134 = 0;
    v135 = &v134;
    uint64_t v136 = 0x3032000000;
    v137 = __Block_byref_object_copy__36201;
    v138 = __Block_byref_object_dispose__36202;
    id v139 = 0;
    long long v22 = (void *)MEMORY[0x1E4F25550];
    v131[0] = MEMORY[0x1E4F143A8];
    v131[1] = 3221225472;
    v131[2] = __73__SGNaturalLanguageDissector_addEnrichmentForEvents_forMessage_toEntity___block_invoke;
    v131[3] = &unk_1E65BEAE8;
    v133 = &v134;
    id v23 = v21;
    id v132 = v23;
    objc_msgSend(v22, "sg_usingSharedStoreForReadingOnly:", v131);
    v106 = v23;
    v107 = [v23 dateByAddingTimeInterval:-1209600.0];
    uint64_t v25 = *MEMORY[0x1E4F5DC38];
    v148[0] = *MEMORY[0x1E4F5DC28];
    uint64_t v24 = v148[0];
    v148[1] = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:2];
    v108 = +[SGRTCLogging launchCountsForApps:v26 afterDate:v107 lowerBucket:10 bucketSize:3 bucketLimit:50];

    id v27 = (void *)MEMORY[0x1E4F5D9F0];
    v28 = [v108 objectForKeyedSubscript:v24];
    v114 = objc_msgSend(v27, "mailAppUsageLevel:", objc_msgSend(v28, "unsignedIntegerValue"));

    id v29 = (void *)MEMORY[0x1E4F5D9F0];
    v30 = [v108 objectForKeyedSubscript:v25];
    v113 = objc_msgSend(v29, "messagesAppUsageLevel:", objc_msgSend(v30, "unsignedIntegerValue"));

    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    obuint64_t j = v109;
    uint64_t v31 = [obj countByEnumeratingWithState:&v127 objects:v147 count:16];
    if (v31)
    {
      uint64_t v112 = *(void *)v128;
      uint64_t v110 = *MEMORY[0x1E4F1C318];
      do
      {
        uint64_t v32 = 0;
        uint64_t v115 = v31;
        do
        {
          if (*(void *)v128 != v112) {
            objc_enumerationMutation(obj);
          }
          uint64_t v118 = v32;
          v33 = *(void **)(*((void *)&v127 + 1) + 8 * v32);
          context = (void *)MEMORY[0x1CB79B230]();
          v121 = [v33 title];
          if (![v121 length])
          {
            v34 = [v116 subject];
            BOOL v35 = [v34 length] == 0;

            if (!v35)
            {
              uint64_t v36 = [v116 subject];

              v121 = (void *)v36;
            }
          }
          v37 = [v33 startDate];
          v38 = [v33 endDate];
          v39 = [v122 title];
          v40 = [v122 duplicateKey];
          v119 = +[SGDuplicateKey duplicateKeyForNaturalLanguageEventWithStartDate:v37 endDate:v38 title:v39 participants:v120 parentKey:v40];

          v41 = [SGPipelineEnrichment alloc];
          v42 = [v33 title];
          v43 = [(SGPipelineEnrichment *)v41 initWithDuplicateKey:v119 title:v42 parent:v122];

          v44 = [MEMORY[0x1E4F5D9F0] naturalLanguageEvent];
          [(SGEntity *)v43 addTag:v44];

          v45 = (void *)MEMORY[0x1E4F5D9F0];
          v46 = objc_msgSend(v33, "ipsos_eventClassificationType");
          v47 = [v46 identifier];
          v48 = [v45 naturalLanguageEventTypeIdentifier:v47];
          [(SGEntity *)v43 addTag:v48];

          v49 = (void *)MEMORY[0x1E4F5D9F0];
          v50 = objc_msgSend(v33, "ipsos_messageUnit");
          v51 = [v50 bestLanguageID];
          v52 = [v49 naturalLanguageEventLanguageID:v51];
          [(SGEntity *)v43 addTag:v52];

          v53 = objc_msgSend(MEMORY[0x1E4F5D9F0], "naturalLanguageEventAttributes:", objc_msgSend(v33, "ipsos_eventAttributes"));
          [(SGEntity *)v43 addTag:v53];

          if ([v116 isSenderSignificant])
          {
            v54 = [MEMORY[0x1E4F5D9F0] significantSender];
            [(SGEntity *)v43 addTag:v54];
          }
          v55 = (void *)MEMORY[0x1E4F5D9F0];
          objc_msgSend(v33, "ipsos_confidence");
          *(float *)&double v56 = v56;
          v57 = [v55 confidenceScore:v56];
          [(SGEntity *)v43 addTag:v57];

          v58 = objc_msgSend(MEMORY[0x1E4F5D9F0], "participantCount:", objc_msgSend(v120, "count"));
          [(SGEntity *)v43 addTag:v58];

          if (objc_msgSend(v33, "ipsos_usedBubblesCount"))
          {
            v59 = objc_msgSend(MEMORY[0x1E4F5D9F0], "usedBubblesCount:", objc_msgSend(v33, "ipsos_usedBubblesCount"));
            [(SGEntity *)v43 addTag:v59];
          }
          if ((objc_msgSend(v33, "ipsos_eventAttributes") & 0x800) != 0)
          {
            v60 = [MEMORY[0x1E4F5D9F0] titleGeneratedFromTemplate];
            [(SGEntity *)v43 addTag:v60];
            goto LABEL_30;
          }
          if ((objc_msgSend(v33, "ipsos_eventAttributes") & 0x400) != 0)
          {
            v60 = [MEMORY[0x1E4F5D9F0] titleGeneratedFromSubject];
            [(SGEntity *)v43 addTag:v60];
LABEL_30:
          }
          [(SGEntity *)v43 addTag:v135[5]];
          [(SGEntity *)v43 addTag:v114];
          [(SGEntity *)v43 addTag:v113];
          v61 = [v33 startTimeZone];
          if (!v61)
          {
            if (([v33 isAllDay] & 1) != 0
              || ([MEMORY[0x1E4F1CAF0] defaultTimeZone],
                  (v61 = objc_claimAutoreleasedReturnValue()) == 0))
            {
              v63 = [v33 startDate];
              v64 = [v33 endDateUnadjustedForLegacyClients];
              if (![v33 isAllDay]) {
                goto LABEL_43;
              }
              v66 = (void *)[objc_alloc(MEMORY[0x1E4F1C9A8]) initWithCalendarIdentifier:v110];
              v67 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
              [v66 setTimeZone:v67];

              uint64_t v68 = [v66 component:32 fromDate:v63];
              if (v68)
              {
                if (v68 != 24)
                {
                  v69 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
                  [v66 setTimeZone:v69];

                  uint64_t v70 = [v66 component:32 fromDate:v63];
                  if (v70 == 24 || !v70)
                  {
                    v65 = [MEMORY[0x1E4F5DB40] floatingRangeWithUTCStartDate:v63 endDate:v64];

                    if (!v65)
                    {
LABEL_43:
                      v71 = objc_opt_new();
                      [v71 setHour:0];
                      v72 = (void *)MEMORY[0x1E4F5DB40];
                      [v63 timeIntervalSince1970];
                      objc_msgSend(v72, "toFloatingTime:withDSTAmbiguityPreferences:", v71);
                      double v74 = v73;
                      v75 = (void *)MEMORY[0x1E4F5DB40];
                      [v64 timeIntervalSince1970];
                      objc_msgSend(v75, "toFloatingTime:withDSTAmbiguityPreferences:", v71);
                      v65 = [MEMORY[0x1E4F5DB40] floatingRangeWithUTCStart:v74 end:v76];
                    }
                    v61 = 0;
                    goto LABEL_45;
                  }
                }
              }

              goto LABEL_43;
            }
          }
          v62 = (void *)MEMORY[0x1E4F5DB40];
          v63 = [v33 startDate];
          v64 = [v33 endDateUnadjustedForLegacyClients];
          v65 = [v62 rangeWithStartDate:v63 startTimeZone:v61 endDate:v64 endTimeZone:v61];
LABEL_45:

          if ([v33 isAllDay])
          {
            v77 = [MEMORY[0x1E4F5D9F0] allDay];
            [(SGEntity *)v43 addTag:v77];

            if (([v65 isValidAllDayRange] & 1) == 0) {
              __assert_rtn("-[SGNaturalLanguageDissector addEnrichmentForEvents:forMessage:toEntity:]", "SGNaturalLanguageDissector.m", 267, "[timeRange isValidAllDayRange]");
            }
          }
          [(SGEntity *)v43 setTimeRange:v65];
          [(SGEntity *)v43 setTitle:v121];
          v78 = [v33 notes];
          [(SGEntity *)v43 setContent:v78];

          v79 = [v33 structuredLocationWithoutPrediction];

          if (v79)
          {
            v80 = [v33 structuredLocationWithoutPrediction];
            v81 = [SGStorageLocation alloc];
            v82 = [v80 title];
            v83 = [v80 geoLocation];
            [v83 horizontalAccuracy];
            v84 = -[SGStorageLocation initWithType:label:address:airportCode:accuracy:quality:](v81, "initWithType:label:address:airportCode:accuracy:quality:", 0, v82, 0, 0);

LABEL_51:
            goto LABEL_52;
          }
          v85 = [v33 locationWithoutPrediction];
          BOOL v86 = [v85 length] == 0;

          if (!v86)
          {
            v87 = [SGStorageLocation alloc];
            v80 = [v33 locationWithoutPrediction];
            v84 = [(SGStorageLocation *)v87 initWithType:0 label:v80 address:0 airportCode:0 accuracy:0.0 quality:0.0];
            goto LABEL_51;
          }
          v84 = 0;
LABEL_52:
          if (objc_msgSend(v33, "ipsos_eventStatus") == 3)
          {
            v88 = sgLogHandle();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1CA650000, v88, OS_LOG_TYPE_DEBUG, "SGNaturalLanguageDissector: Event is cancelled", buf, 2u);
            }

            v89 = [MEMORY[0x1E4F5D9F0] extractedEventCancellation];
            [(SGEntity *)v43 addTag:v89];
          }
          if (v84)
          {
            v90 = [(SGEntity *)v43 locations];
            [v90 addObject:v84];
          }
          [v122 creationTimestamp];
          -[SGPipelineEnrichment setCreationTimestamp:](v43, "setCreationTimestamp:");
          [v122 lastModifiedTimestamp];
          -[SGPipelineEnrichment setLastModifiedTimestamp:](v43, "setLastModifiedTimestamp:");
          long long v125 = 0u;
          long long v126 = 0u;
          long long v123 = 0u;
          long long v124 = 0u;
          v91 = [v122 tags];
          uint64_t v92 = [v91 countByEnumeratingWithState:&v123 objects:v146 count:16];
          if (v92)
          {
            uint64_t v93 = *(void *)v124;
            do
            {
              for (uint64_t j = 0; j != v92; ++j)
              {
                if (*(void *)v124 != v93) {
                  objc_enumerationMutation(v91);
                }
                [(SGEntity *)v43 addTag:*(void *)(*((void *)&v123 + 1) + 8 * j)];
              }
              uint64_t v92 = [v91 countByEnumeratingWithState:&v123 objects:v146 count:16];
            }
            while (v92);
          }

          v95 = [v122 duplicateKey];
          v96 = [v95 bundleId];

          id v97 = objc_alloc(MEMORY[0x1E4F5DA18]);
          v98 = objc_msgSend(v33, "ipsos_eventClassificationType");
          v99 = [v98 identifier];
          objc_msgSend(v33, "ipsos_confidence");
          double v101 = v100;
          v102 = [v120 allObjects];
          v103 = (void *)[v97 initWithType:2 categoryDescription:v99 originBundleId:v96 confidence:0 schemaOrg:v102 participants:v101];

          v104 = [v103 toJsonString];
          if (v104)
          {
            v105 = [MEMORY[0x1E4F5D9F0] eventMetadata:v104];
            [(SGEntity *)v43 addTag:v105];
          }
          else
          {
            v105 = sgLogHandle();
            if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v145 = v103;
              _os_log_error_impl(&dword_1CA650000, v105, OS_LOG_TYPE_ERROR, "Failed to convert object to JSON: %@", buf, 0xCu);
            }
          }

          [v122 addEnrichment:v43];
          uint64_t v32 = v118 + 1;
        }
        while (v118 + 1 != v115);
        uint64_t v31 = [obj countByEnumeratingWithState:&v127 objects:v147 count:16];
      }
      while (v31);
    }

    _Block_object_dispose(&v134, 8);
  }
}

uint64_t __73__SGNaturalLanguageDissector_addEnrichmentForEvents_forMessage_toEntity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F5D9F0];
  [a2 eventsPerWeekAroundDate:*(void *)(a1 + 32)];
  *(float *)&double v4 = v4;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [v3 calendarAppUsageLevel:v4];
  return MEMORY[0x1F41817F8]();
}

- (void)clearConversations
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  uint64_t v2 = objc_opt_new();
  conversations = obj->_conversations;
  obj->_conversations = (NSMutableDictionary *)v2;

  objc_sync_exit(obj);
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)SGNaturalLanguageDissector;
  uint64_t v2 = [(SGNaturalLanguageDissector *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(SGNaturalLanguageDissector *)v2 clearConversations];
  }
  return v3;
}

+ (id)ipsosMessageWithTextMessage:(id)a3 store:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 sender];
  uint64_t v9 = [a1 _personForCSPerson:v8];

  uint64_t v10 = [v6 recipients];
  uint64_t v11 = sgMapAndFilter();

  uint64_t v12 = (void *)MEMORY[0x1CB79B230]();
  id v13 = objc_alloc(MEMORY[0x1E4F5F228]);
  long long v14 = [v6 uniqueIdentifier];
  long long v15 = [v6 subject];
  int v16 = (void *)[v11 copy];
  v17 = [v6 date];
  BOOL v18 = (void *)[v13 initWithIdentifier:v14 subject:v15 sender:v9 recipients:v16 dateSent:v17 type:*MEMORY[0x1E4F5F200]];

  objc_msgSend(v18, "setIsSent:", objc_msgSend(v6, "isSent"));
  objc_msgSend(v18, "setIsGroupConversation:", (unint64_t)objc_msgSend(v11, "count") > 1);
  v19 = [v6 sender];
  objc_msgSend(v18, "setIsSenderSignificant:", objc_msgSend(v19, "sg_isSignificantWithStore:", v7));

  id v20 = objc_alloc(MEMORY[0x1E4F5F230]);
  long long v21 = [v6 textContent];
  long long v22 = (void *)[v20 initWithText:v21 originalMessage:v18 index:0];

  id v23 = (void *)MEMORY[0x1CB79B230]();
  v26[0] = v22;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [v18 setMessageUnits:v24];

  return v18;
}

uint64_t __64__SGNaturalLanguageDissector_ipsosMessageWithTextMessage_store___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _personForCSPerson:a2];
}

+ (id)ipsosMessageWithMailMessage:(id)a3 store:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v55 = a4;
  id v7 = [v6 author];
  v54 = [a1 _personForCSPerson:v7];

  uint64_t v8 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v53 = v6;
  uint64_t v9 = [v6 allRecipients];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v61 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        long long v15 = (void *)MEMORY[0x1CB79B230]();
        id v16 = objc_alloc(MEMORY[0x1E4F5F238]);
        v17 = [v14 emailAddress];
        BOOL v18 = [v14 name];
        v19 = (void *)[v16 initWithEmail:v17 fullName:v18];
        [v8 addObject:v19];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v60 objects:v64 count:16];
    }
    while (v11);
  }

  id v20 = (void *)MEMORY[0x1CB79B230]();
  id v21 = objc_alloc(MEMORY[0x1E4F5F228]);
  long long v22 = [v53 uniqueIdentifier];
  id v23 = [v53 subject];
  uint64_t v24 = (void *)[v8 copy];
  uint64_t v25 = [v53 date];
  uint64_t v26 = (void *)[v21 initWithIdentifier:v22 subject:v23 sender:v54 recipients:v24 dateSent:v25 type:*MEMORY[0x1E4F5F200]];

  objc_msgSend(v26, "setIsSent:", objc_msgSend(v53, "isSent"));
  id v27 = [v53 mailingList];
  if (v27) {
    BOOL v28 = 1;
  }
  else {
    BOOL v28 = (unint64_t)[v8 count] > 1;
  }
  [v26 setIsGroupConversation:v28];

  id v29 = [v53 author];
  objc_msgSend(v26, "setIsSenderSignificant:", objc_msgSend(v29, "sg_isSignificantWithStore:", v55));

  v30 = [v53 textContent];
  uint64_t v31 = objc_opt_new();
  uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, objc_msgSend(v30, "length"));
  v33 = [v53 quotedRegions];
  uint64_t v34 = [v33 count];

  if (v34)
  {
    BOOL v35 = [v53 quotedRegions];
    [v32 removeIndexes:v35];
  }
  uint64_t v36 = [v53 htmlParser];
  v37 = [v36 tabularRegions];
  uint64_t v38 = [v37 count];

  if (v38)
  {
    v39 = [v53 htmlParser];
    v40 = [v39 tabularRegions];
    [v32 removeIndexes:v40];
  }
  v41 = [v53 htmlParser];
  v42 = [v41 signatureRegions];
  uint64_t v43 = [v42 count];

  if (v43)
  {
    v44 = [v53 htmlParser];
    v45 = [v44 signatureRegions];
    [v32 removeIndexes:v45];
  }
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __64__SGNaturalLanguageDissector_ipsosMessageWithMailMessage_store___block_invoke;
  v56[3] = &unk_1E65BEAA0;
  id v57 = v30;
  id v46 = v26;
  id v58 = v46;
  v59 = v31;
  id v47 = v31;
  id v48 = v30;
  [v32 enumerateRangesUsingBlock:v56];
  v49 = (void *)[v47 copy];
  [v46 setMessageUnits:v49];

  v50 = v59;
  id v51 = v46;

  return v51;
}

void __64__SGNaturalLanguageDissector_ipsosMessageWithMailMessage_store___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (void *)MEMORY[0x1CB79B230]();
  id v7 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F5F230]), "initWithText:originalMessage:index:", v7, *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "count"));
  [*(id *)(a1 + 48) addObject:v8];
}

+ (id)_personForCSPerson:(id)a3
{
  id v3 = a3;
  double v4 = [v3 handles];
  if ([v4 count])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F5F238]);
    id v6 = [v3 handles];
    id v7 = [v6 objectAtIndexedSubscript:0];
    uint64_t v8 = [v3 handleIdentifier];
    uint64_t v9 = [v3 displayName];
    uint64_t v10 = (void *)[v5 initWithHandle:v7 handleType:v8 fullName:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (BOOL)allowNaturalLanguageDissector
{
  return [MEMORY[0x1E4F5DAF0] detectNLEvents];
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken3_36240 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken3_36240, &__block_literal_global_36241);
  }
  uint64_t v2 = (void *)sharedInstance__pasExprOnceResult_36242;
  return v2;
}

void __44__SGNaturalLanguageDissector_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  id v1 = [[SGNaturalLanguageDissector alloc] _init];
  uint64_t v2 = (void *)sharedInstance__pasExprOnceResult_36242;
  sharedInstance__pasExprOnceResult_36242 = (uint64_t)v1;
}

@end