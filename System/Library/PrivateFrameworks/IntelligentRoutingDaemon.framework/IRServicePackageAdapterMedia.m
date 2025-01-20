@interface IRServicePackageAdapterMedia
+ (id)_getUniqueAirplayRoutsFromCandidateIdentifiers:(id)a3 inCandiateContainer:(id)a4;
- (BOOL)generateClassificationsWithCandiatesContainer:(id)a3 systemState:(id)a4 historyEventsContainer:(id)a5 miloPrediction:(id)a6 nearbyDeviceContainer:(id)a7 fillInspection:(BOOL)a8 date:(id)a9;
- (BOOL)outputRulesToContext:(id)a3 candidatesContainer:(id)a4 fillInspection:(BOOL)a5;
- (BOOL)shouldAskForLowLatencyMiLo:(id)a3 historyEventsAsc:(id)a4;
- (BOOL)shouldConsiderEventForSignificantBundles:(id)a3;
- (BOOL)shouldRejectEvent:(id)a3 withHistoryEventsContainer:(id)a4 withSystemState:(id)a5 forCandidate:(id)a6 date:(id)a7;
- (IRClassificationGenerator)generator;
- (IRServicePackageAdapterMedia)init;
- (NSDictionary)contexts;
- (NSDictionary)policyInspections;
- (id)_getGeneralWeeklyAnalyticsWithWeeklyHistory:(id)a3 withCandidatesContainer:(id)a4;
- (id)_getUIWeeklyAnalyticsWithWeeklyHistory:(id)a3;
- (id)_getWeeklyAnalyticsFromStatistics:(id)a3 candidatesContainer:(id)a4;
- (id)filterHistory:(id)a3 withCandidatesContainer:(id)a4;
- (id)getSignificantBundlesWithCandidates:(id)a3 fromHistory:(id)a4;
- (id)uiAnalyticsWithEvent:(id)a3 forCandidateIdentifier:(id)a4 systemStateManager:(id)a5 candidatesContainer:(id)a6 inspections:(id)a7 statisticsManager:(id)a8 service:(id)a9 historyEventsContainer:(id)a10;
- (id)weeklyAnalyticsWithServiceStore:(id)a3 statistics:(id)a4 service:(id)a5;
- (void)setGenerator:(id)a3;
@end

@implementation IRServicePackageAdapterMedia

- (NSDictionary)contexts
{
  v2 = [(IRServicePackageAdapterMedia *)self generator];
  v3 = [v2 contexts];

  return (NSDictionary *)v3;
}

- (IRClassificationGenerator)generator
{
  return self->_generator;
}

- (BOOL)generateClassificationsWithCandiatesContainer:(id)a3 systemState:(id)a4 historyEventsContainer:(id)a5 miloPrediction:(id)a6 nearbyDeviceContainer:(id)a7 fillInspection:(BOOL)a8 date:(id)a9
{
  uint64_t v9 = a8;
  id v16 = a9;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = [(IRServicePackageAdapterMedia *)self generator];
  LOBYTE(v9) = [v22 generateClassificationsWithCandiatesContainer:v21 systemState:v20 historyEventsContainer:v19 miloPrediction:v18 nearbyDeviceContainer:v17 fillInspection:v9 date:v16];

  return v9;
}

- (id)filterHistory:(id)a3 withCandidatesContainer:(id)a4
{
  uint64_t v138 = *MEMORY[0x263EF8340];
  id v114 = a3;
  id v112 = a4;
  v5 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v6 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    v7 = NSNumber;
    v8 = v6;
    uint64_t v9 = objc_msgSend(v114, "historyEvents", v112);
    v10 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "#service-package-adapter-media, ";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2112;
    v137 = v10;
    _os_log_impl(&dword_25418E000, v8, OS_LOG_TYPE_INFO, "%s[%@], Number of history events before filtering = %@", buf, 0x20u);
  }
  v11 = (void *)MEMORY[0x263EFF980];
  v12 = [v114 historyEvents];
  v13 = [v11 arrayWithArray:v12];

  if ([&unk_2703AF338 count])
  {
    unint64_t v115 = 0;
    do
    {
      v116 = objc_opt_new();
      v14 = [&unk_2703AF338 objectAtIndexedSubscript:v115];
      uint64_t v117 = [v14 integerValue];

      unint64_t v15 = [&unk_2703AF338 count];
      unint64_t v16 = ++v115 / v15;
      id v17 = [&unk_2703AF338 objectAtIndexedSubscript:v115 - v16 * v15];
      uint64_t v122 = [v17 integerValue];

      if ([v13 count])
      {
        uint64_t v18 = 0;
        do
        {
          id v19 = objc_msgSend(v13, "objectAtIndexedSubscript:", v18, v112);
          id v20 = [v19 event];
          BOOL v21 = [v20 eventType] == v117;

          unint64_t v119 = v18 + 1;
          if (v21 && v119 < [v13 count])
          {
            for (unint64_t i = v18 + 1; i < [v13 count]; ++i)
            {
              v23 = [v13 objectAtIndexedSubscript:i];
              v24 = [v23 date];
              v25 = [v13 objectAtIndexedSubscript:v18];
              v26 = [v25 date];
              [v24 timeIntervalSinceDate:v26];
              double v28 = v27;
              v29 = +[IRPreferences shared];
              v30 = [v29 mediaPlaybackEventsTimeIntervalThreshold];
              [v30 doubleValue];
              BOOL v32 = v28 < v31;

              if (!v32) {
                break;
              }
              v33 = [v13 objectAtIndexedSubscript:i];
              v34 = [v33 event];
              BOOL v35 = [v34 eventType] == v122;

              if (v35)
              {
                v36 = [v13 objectAtIndexedSubscript:i];
                v37 = [v36 candidateIdentifier];
                v38 = [v13 objectAtIndexedSubscript:v18];
                v39 = [v38 candidateIdentifier];
                int v40 = [v37 isEqual:v39];

                if (v40)
                {
                  v41 = [v13 objectAtIndexedSubscript:i];
                  v42 = [v41 event];
                  v43 = [v42 bundleID];

                  v44 = [v13 objectAtIndexedSubscript:v18];
                  v45 = [v44 event];
                  v46 = [v45 bundleID];

                  if ([v43 isEqual:v46]
                    && ([v116 containsIndex:i] & 1) == 0)
                  {
                    [v116 addIndex:v18];
                    [v116 addIndex:i];

                    break;
                  }
                }
              }
            }
          }
          ++v18;
        }
        while (v119 < [v13 count]);
      }
      objc_msgSend(v13, "removeObjectsAtIndexes:", v116, v112);
    }
    while (v115 < [&unk_2703AF338 count]);
  }
  v47 = +[IREventDO mediaUserInteractionEvents];
  v123 = [v47 compactMap:&__block_literal_global_1];

  v118 = objc_opt_new();
  if ([v13 count])
  {
    unint64_t v48 = 0;
    uint64_t v120 = 1;
    do
    {
      v49 = NSNumber;
      v50 = [v13 objectAtIndexedSubscript:v48];
      v51 = [v50 event];
      v52 = objc_msgSend(v49, "numberWithLongLong:", objc_msgSend(v51, "eventType"));
      LODWORD(v49) = [v123 containsObject:v52];

      if (v49)
      {
        unint64_t v53 = v120;
        while (v53 < [v13 count])
        {
          v54 = [v13 objectAtIndexedSubscript:v53];
          v55 = [v54 date];
          v56 = [v13 objectAtIndexedSubscript:v48];
          v57 = [v56 date];
          [v55 timeIntervalSinceDate:v57];
          double v59 = v58;
          v60 = +[IRPreferences shared];
          v61 = [v60 mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds];
          [v61 doubleValue];
          BOOL v63 = v59 < v62;

          if (!v63) {
            break;
          }
          v64 = NSNumber;
          v65 = [v13 objectAtIndexedSubscript:v53];
          v66 = [v65 event];
          v67 = objc_msgSend(v64, "numberWithLongLong:", objc_msgSend(v66, "eventType"));
          LODWORD(v64) = [v123 containsObject:v67];

          ++v53;
          if (v64)
          {
            [v118 addIndex:v48];
            break;
          }
        }
      }
      ++v48;
      ++v120;
    }
    while (v48 < [v13 count]);
  }
  [v13 removeObjectsAtIndexes:v118];
  [v118 removeAllIndexes];
  if ([v13 count])
  {
    uint64_t v68 = 0;
    do
    {
      v69 = NSNumber;
      v70 = [v13 objectAtIndexedSubscript:v68];
      v71 = [v70 event];
      v72 = objc_msgSend(v69, "numberWithLongLong:", objc_msgSend(v71, "eventType"));
      LODWORD(v69) = [v123 containsObject:v72];

      unint64_t v121 = v68 + 1;
      if (v69 && v121 < [v13 count])
      {
        for (unint64_t j = v68 + 1; j < [v13 count]; ++j)
        {
          v74 = [v13 objectAtIndexedSubscript:j];
          v75 = [v74 date];
          v76 = [v13 objectAtIndexedSubscript:v68];
          v77 = [v76 date];
          [v75 timeIntervalSinceDate:v77];
          double v79 = v78;
          v80 = +[IRPreferences shared];
          v81 = [v80 mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds];
          [v81 doubleValue];
          BOOL v83 = v79 < v82;

          if (!v83) {
            break;
          }
          v84 = NSNumber;
          v85 = [v13 objectAtIndexedSubscript:j];
          v86 = [v85 event];
          v87 = objc_msgSend(v84, "numberWithLongLong:", objc_msgSend(v86, "eventType"));
          LODWORD(v84) = [v123 containsObject:v87];

          if (v84)
          {
            v88 = [v13 objectAtIndexedSubscript:j];
            v89 = [v88 candidateIdentifier];
            v90 = [v13 objectAtIndexedSubscript:v68];
            v91 = [v90 candidateIdentifier];
            int v92 = [v89 isEqual:v91];

            if (v92)
            {
              v93 = [v13 objectAtIndexedSubscript:j];
              v94 = [v93 event];
              v95 = [v94 bundleID];

              v96 = [v13 objectAtIndexedSubscript:v68];
              v97 = [v96 event];
              v98 = [v97 bundleID];

              if ([v95 isEqual:v98])
              {
                [v118 addIndex:v68];

                break;
              }
            }
          }
        }
      }
      ++v68;
    }
    while (v121 < [v13 count]);
  }
  [v13 removeObjectsAtIndexes:v118];
  v99 = +[IREventDO mediaBrokeredDeviceEvents];
  v100 = [v99 compactMap:&__block_literal_global_11];

  [v118 removeAllIndexes];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v137) = 0;
  v124[0] = MEMORY[0x263EF8330];
  v124[1] = 3221225472;
  v124[2] = __70__IRServicePackageAdapterMedia_filterHistory_withCandidatesContainer___block_invoke_3;
  v124[3] = &unk_26539F778;
  id v101 = v100;
  id v125 = v101;
  v129 = buf;
  id v102 = v113;
  id v126 = v102;
  id v103 = v123;
  id v127 = v103;
  id v104 = v118;
  id v128 = v104;
  [v13 enumerateObjectsWithOptions:2 usingBlock:v124];
  [v13 removeObjectsAtIndexes:v104];
  v105 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v106 = (id)*MEMORY[0x263F50090];
  if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
  {
    v107 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    *(_DWORD *)v130 = 136315650;
    v131 = "#service-package-adapter-media, ";
    __int16 v132 = 2112;
    v133 = v105;
    __int16 v134 = 2112;
    v135 = v107;
    _os_log_impl(&dword_25418E000, v106, OS_LOG_TYPE_INFO, "%s[%@], Number of history events after filtering = %@", v130, 0x20u);
  }
  v108 = [IRHistoryEventsContainerDO alloc];
  v109 = (void *)[v13 copy];
  v110 = [(IRHistoryEventsContainerDO *)v108 initWithHistoryEvents:v109];

  _Block_object_dispose(buf, 8);

  return v110;
}

uint64_t __70__IRServicePackageAdapterMedia_filterHistory_withCandidatesContainer___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 eventType];

  return [v2 numberWithLongLong:v3];
}

uint64_t __70__IRServicePackageAdapterMedia_filterHistory_withCandidatesContainer___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 eventType];

  return [v2 numberWithLongLong:v3];
}

- (IRServicePackageAdapterMedia)init
{
  v5.receiver = self;
  v5.super_class = (Class)IRServicePackageAdapterMedia;
  v2 = [(IRServicePackageAdapterMedia *)&v5 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(IRClassificationGenerator);
    [(IRServicePackageAdapterMedia *)v2 setGenerator:v3];
  }
  return v2;
}

- (NSDictionary)policyInspections
{
  v2 = [(IRServicePackageAdapterMedia *)self generator];
  uint64_t v3 = [v2 policyInspections];

  return (NSDictionary *)v3;
}

- (BOOL)outputRulesToContext:(id)a3 candidatesContainer:(id)a4 fillInspection:(BOOL)a5
{
  return 0;
}

void __70__IRServicePackageAdapterMedia_filterHistory_withCandidatesContainer___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = NSNumber;
  id v19 = v5;
  v8 = [v5 event];
  uint64_t v9 = objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v8, "eventType"));
  LODWORD(v6) = [v6 containsObject:v9];

  if (v6) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  v10 = v19;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    v11 = *(void **)(a1 + 40);
    v12 = [v19 candidateIdentifier];
    v13 = [v11 candidateForCandidateIdentifier:v12];
    int v14 = [v13 isBrokeredDevice];

    v10 = v19;
    if (v14)
    {
      unint64_t v15 = *(void **)(a1 + 48);
      unint64_t v16 = NSNumber;
      id v17 = [v19 event];
      uint64_t v18 = objc_msgSend(v16, "numberWithLongLong:", objc_msgSend(v17, "eventType"));
      LODWORD(v15) = [v15 containsObject:v18];

      v10 = v19;
      if (v15)
      {
        [*(id *)(a1 + 56) addIndex:a3];
        v10 = v19;
      }
    }
  }
}

- (BOOL)shouldAskForLowLatencyMiLo:(id)a3 historyEventsAsc:(id)a4
{
  id v5 = (void *)MEMORY[0x263EFF9C0];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 set];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__IRServicePackageAdapterMedia_shouldAskForLowLatencyMiLo_historyEventsAsc___block_invoke;
  v16[3] = &unk_26539F7A0;
  id v9 = v8;
  id v17 = v9;
  [v6 enumerateObjectsWithOptions:2 usingBlock:v16];

  v10 = [v7 candidates];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76__IRServicePackageAdapterMedia_shouldAskForLowLatencyMiLo_historyEventsAsc___block_invoke_2;
  v14[3] = &unk_26539F7C8;
  id v15 = v9;
  id v11 = v9;
  v12 = [v10 firstWhere:v14];
  LOBYTE(v9) = v12 != 0;

  return (char)v9;
}

void __76__IRServicePackageAdapterMedia_shouldAskForLowLatencyMiLo_historyEventsAsc___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v18 = a2;
  id v6 = [MEMORY[0x263EFF910] now];
  id v7 = [v18 date];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;
  v10 = +[IRPreferences shared];
  id v11 = [v10 candidateLastUsedThrForMiLoLowLatancyPowerOpt];
  [v11 doubleValue];
  double v13 = v12;

  if (v9 >= v13)
  {
    *a4 = 1;
  }
  else
  {
    int v14 = [v18 systemState];
    if ([v14 isMiLoSupportedLocation])
    {
      id v15 = [v18 candidateIdentifier];

      unint64_t v16 = v18;
      if (!v15) {
        goto LABEL_8;
      }
      id v17 = *(void **)(a1 + 32);
      int v14 = [v18 candidateIdentifier];
      [v17 addObject:v14];
    }
  }
  unint64_t v16 = v18;
LABEL_8:
}

uint64_t __76__IRServicePackageAdapterMedia_shouldAskForLowLatencyMiLo_historyEventsAsc___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 containsAirplayTarget])
  {
    v4 = *(void **)(a1 + 32);
    id v5 = [v3 candidateIdentifier];
    uint64_t v6 = [v4 containsObject:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)shouldRejectEvent:(id)a3 withHistoryEventsContainer:(id)a4 withSystemState:(id)a5 forCandidate:(id)a6 date:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (+[IRPlatformInfo isIOS](IRPlatformInfo, "isIOS") && ![v13 displayOn])
  {
    BOOL v24 = 1;
  }
  else if (([v14 isMediaRemoteLocal] & 1) != 0 {
         || ([v14 candidateIdentifier],
  }
             unint64_t v16 = objc_claimAutoreleasedReturnValue(),
             int v17 = [v16 isEqual:@"speaker"],
             v16,
             v17))
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 1;
    if (+[IRPlatformInfo isTVOS])
    {
      id v18 = +[IRPreferences shared];
      id v19 = [v18 mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds];
      [v19 doubleValue];
      BOOL v21 = [v15 dateByAddingTimeInterval:-v20];

      v22 = [v12 historyEvents];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __111__IRServicePackageAdapterMedia_shouldRejectEvent_withHistoryEventsContainer_withSystemState_forCandidate_date___block_invoke;
      v26[3] = &unk_26539F7F0;
      id v23 = v21;
      id v27 = v23;
      double v28 = &v29;
      [v22 enumerateObjectsWithOptions:2 usingBlock:v26];
    }
    BOOL v24 = *((unsigned char *)v30 + 24) != 0;
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

void __111__IRServicePackageAdapterMedia_shouldRejectEvent_withHistoryEventsContainer_withSystemState_forCandidate_date___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  id v11 = v6;
  double v8 = [v6 date];
  LOBYTE(v7) = [v7 isLaterThan:v8];

  if ((v7 & 1) == 0)
  {
    double v9 = [v11 event];
    int v10 = [v9 isUserIntentionEvent];

    if (!v10) {
      goto LABEL_5;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  *a4 = 1;
LABEL_5:
}

- (BOOL)shouldConsiderEventForSignificantBundles:(id)a3
{
  return [a3 isUserIntentionEvent];
}

- (id)getSignificantBundlesWithCandidates:(id)a3 fromHistory:(id)a4
{
  id v6 = a4;
  id v7 = [a3 airplayOrUnknownCandidates];
  double v8 = [MEMORY[0x263EFF9A0] dictionary];
  double v9 = [MEMORY[0x263EFF9C0] set];
  int v10 = +[IRPreferences shared];
  id v11 = [v10 startDateForSignificantBundlesLookup];

  id v12 = [v6 historyEvents];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __80__IRServicePackageAdapterMedia_getSignificantBundlesWithCandidates_fromHistory___block_invoke;
  v22[3] = &unk_26539F838;
  v22[4] = self;
  id v23 = v7;
  id v24 = v11;
  id v25 = v9;
  id v13 = v8;
  id v26 = v13;
  id v14 = v9;
  id v15 = v11;
  id v16 = v7;
  [v12 enumerateObjectsUsingBlock:v22];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __80__IRServicePackageAdapterMedia_getSignificantBundlesWithCandidates_fromHistory___block_invoke_27;
  v20[3] = &unk_26539F860;
  id v21 = v13;
  id v17 = v13;
  id v18 = [v14 compactMap:v20];

  return v18;
}

void __80__IRServicePackageAdapterMedia_getSignificantBundlesWithCandidates_fromHistory___block_invoke(void *a1, void *a2)
{
  id v26 = a2;
  id v3 = [v26 event];
  v4 = [v3 bundleID];

  if (v4)
  {
    id v5 = (void *)a1[4];
    id v6 = [v26 event];
    LODWORD(v5) = [v5 shouldConsiderEventForSignificantBundles:v6];

    if (v5)
    {
      id v7 = [v26 candidateIdentifier];
      double v8 = +[IRCandidateDO candidateForIdentifier:v7 within:a1[5]];

      if (!v8) {
        goto LABEL_14;
      }
      double v9 = [v26 date];
      int v10 = [v9 isLaterThan:a1[6]];

      if (!v10) {
        goto LABEL_14;
      }
      id v11 = (void *)a1[7];
      id v12 = [v26 event];
      id v13 = [v12 bundleID];
      [v11 addObject:v13];

      id v14 = [v8 nodes];
      LODWORD(v12) = [v14 containsObjectPassingTest:&__block_literal_global_23];

      id v15 = (void *)a1[8];
      id v16 = [v26 event];
      id v17 = [v16 bundleID];
      id v18 = [v15 objectForKeyedSubscript:v17];

      if (v12)
      {
        if (!v18)
        {
          id v25 = (void *)a1[8];
          id v21 = [v26 event];
          id v23 = [v21 bundleID];
          [v25 setObject:&unk_2703AF038 forKeyedSubscript:v23];
          goto LABEL_12;
        }
        id v19 = NSNumber;
        uint64_t v20 = [v18 integerValue] + 1;
      }
      else
      {
        if (!v18)
        {
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        id v19 = NSNumber;
        uint64_t v20 = [v18 integerValue] - 1;
      }
      id v21 = [v19 numberWithInteger:v20];
      v22 = (void *)a1[8];
      id v23 = [v26 event];
      id v24 = [v23 bundleID];
      [v22 setObject:v21 forKeyedSubscript:v24];

LABEL_12:
      goto LABEL_13;
    }
  }
LABEL_15:
}

BOOL __80__IRServicePackageAdapterMedia_getSignificantBundlesWithCandidates_fromHistory___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 avOutputDevice];

  if (v3)
  {
    v4 = [v2 avOutputDevice];
    if ([v4 deviceType])
    {
      BOOL v5 = 0;
    }
    else
    {
      id v6 = [v2 avOutputDevice];
      if ([v6 deviceSubType] == 11)
      {
        BOOL v5 = 1;
      }
      else
      {
        id v7 = [v2 avOutputDevice];
        if ([v7 deviceSubType] == 13)
        {
          BOOL v5 = 1;
        }
        else
        {
          double v8 = [v2 avOutputDevice];
          BOOL v5 = [v8 deviceSubType] == 17;
        }
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

id __80__IRServicePackageAdapterMedia_getSignificantBundlesWithCandidates_fromHistory___block_invoke_27(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 objectForKeyedSubscript:v3];

  v4 = (void *)[objc_alloc(MEMORY[0x263F500E0]) initWithBundleType:2 andIdentifier:v3];

  return v4;
}

- (void)setGenerator:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)weeklyAnalyticsWithServiceStore:(id)a3 statistics:(id)a4 service:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[IRPreferences shared];
  id v12 = [v11 numberOfHistoryEventsInCache];
  id v13 = objc_msgSend(v10, "fetchHistoryEventsContainerWithLimit:", objc_msgSend(v12, "unsignedIntegerValue"));

  id v14 = [v10 fetchCandidatesContainer];

  id v15 = [MEMORY[0x263EFF910] date];
  id v16 = [v13 historyEvents];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __96__IRServicePackageAdapterMedia_IRAnalytics__weeklyAnalyticsWithServiceStore_statistics_service___block_invoke;
  v29[3] = &unk_26539FEB0;
  id v17 = v15;
  id v30 = v17;
  id v18 = [v16 allWhere:v29];
  id v19 = +[IRHistoryEventsContainerDO historyEventsContainerDOWithHistoryEvents:v18];

  uint64_t v20 = [(IRServicePackageAdapterMedia *)self filterHistory:v19 withCandidatesContainer:v14];

  id v21 = [MEMORY[0x263EFF9A0] dictionary];
  v22 = [v8 clientIdentifier];
  if (v22)
  {
    id v23 = [v8 clientIdentifier];
    [v21 setObject:v23 forKeyedSubscript:@"General_Weekly_Client_Identifier"];
  }
  else
  {
    [v21 setObject:&stru_27039A840 forKeyedSubscript:@"General_Weekly_Client_Identifier"];
  }

  id v24 = [(IRServicePackageAdapterMedia *)self _getUIWeeklyAnalyticsWithWeeklyHistory:v20];
  [v21 addEntriesFromDictionary:v24];

  id v25 = [(IRServicePackageAdapterMedia *)self _getGeneralWeeklyAnalyticsWithWeeklyHistory:v20 withCandidatesContainer:v14];
  [v21 addEntriesFromDictionary:v25];

  id v26 = [(IRServicePackageAdapterMedia *)self _getWeeklyAnalyticsFromStatistics:v9 candidatesContainer:v14];

  [v21 addEntriesFromDictionary:v26];
  id v27 = (void *)[v21 copy];

  return v27;
}

uint64_t __96__IRServicePackageAdapterMedia_IRAnalytics__weeklyAnalyticsWithServiceStore_statistics_service___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 date];
  v4 = +[IRPreferences shared];
  BOOL v5 = [v4 coreAnalyticsXPCHistoryEventsValidThreshold];
  [v5 doubleValue];
  id v6 = objc_msgSend(v3, "dateByAddingTimeInterval:");
  uint64_t v7 = [v2 isEarlierThanOrEqualTo:v6];

  return v7;
}

- (id)_getUIWeeklyAnalyticsWithWeeklyHistory:(id)a3
{
  v49[10] = *MEMORY[0x263EF8340];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  id v25 = a3;
  id v3 = [v25 historyEvents];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __84__IRServicePackageAdapterMedia_IRAnalytics___getUIWeeklyAnalyticsWithWeeklyHistory___block_invoke;
  v27[3] = &unk_2653A0C20;
  v27[4] = &v44;
  v27[5] = &v40;
  v27[6] = &v36;
  v27[7] = &v32;
  v27[8] = &v28;
  [v3 enumerateObjectsUsingBlock:v27];

  uint64_t v4 = v45[3];
  unint64_t v5 = v41[3] + v4;
  if (v5) {
    unint64_t v6 = 100 * v4 / v5;
  }
  else {
    unint64_t v6 = 200;
  }
  uint64_t v7 = v37[3];
  unint64_t v8 = v33[3] + v7;
  if (v8) {
    unint64_t v9 = 100 * v7 / v8;
  }
  else {
    unint64_t v9 = 200;
  }
  unint64_t v11 = v7 + v5;
  BOOL v10 = v11 == 0;
  unint64_t v12 = 100 * v5 / v11;
  if (v10) {
    uint64_t v13 = 200;
  }
  else {
    uint64_t v13 = v12;
  }
  v48[0] = @"Autoroute_UI_Weekly_Accepted";
  id v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v49[0] = v26;
  v48[1] = @"Autoroute_UI_Weekly_Rejected";
  id v14 = [NSNumber numberWithUnsignedInteger:v41[3]];
  v49[1] = v14;
  v48[2] = @"Autoroute_UI_Weekly_Prompt";
  id v15 = [NSNumber numberWithUnsignedInteger:v5];
  v49[2] = v15;
  v48[3] = @"Autoroute_UI_Weekly_Accepted_Ratio";
  id v16 = [NSNumber numberWithUnsignedInteger:v6];
  v49[3] = v16;
  v48[4] = @"OneTap_UI_Weekly_Accepted";
  id v17 = [NSNumber numberWithUnsignedInteger:v37[3]];
  v49[4] = v17;
  v48[5] = @"OneTap_UI_Weekly_Rejected";
  id v18 = [NSNumber numberWithUnsignedInteger:v33[3]];
  v49[5] = v18;
  v48[6] = @"OneTap_UI_Weekly_Prompt";
  id v19 = [NSNumber numberWithUnsignedInteger:v8];
  v49[6] = v19;
  v48[7] = @"OneTap_UI_Weekly_Accepted_Ratio";
  uint64_t v20 = [NSNumber numberWithUnsignedInteger:v9];
  v49[7] = v20;
  v48[8] = @"Autoroute_To_OneTap_UI_Weekly_Ratio";
  id v21 = [NSNumber numberWithUnsignedInteger:v13];
  v49[8] = v21;
  v48[9] = @"PickerTop_UI_Weekly_Prompt";
  v22 = [NSNumber numberWithUnsignedInteger:v29[3]];
  v49[9] = v22;
  id v23 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:10];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v23;
}

void __84__IRServicePackageAdapterMedia_IRAnalytics___getUIWeeklyAnalyticsWithWeeklyHistory___block_invoke(void *a1, void *a2)
{
  id v18 = a2;
  id v3 = [v18 event];
  uint64_t v4 = [v3 eventType];

  if (v4 == 1)
  {
    uint64_t v5 = a1[4];
LABEL_7:
    BOOL v10 = (void *)(*(void *)(v5 + 8) + 24);
    unint64_t v11 = v18;
LABEL_8:
    ++*v10;
    goto LABEL_9;
  }
  unint64_t v6 = [v18 event];
  uint64_t v7 = [v6 eventType];

  if (v7 == 2)
  {
    uint64_t v5 = a1[5];
    goto LABEL_7;
  }
  unint64_t v8 = [v18 event];
  uint64_t v9 = [v8 eventType];

  if (v9 == 3)
  {
    uint64_t v5 = a1[6];
    goto LABEL_7;
  }
  unint64_t v12 = [v18 event];
  if ([v12 eventType] == 4)
  {

    unint64_t v11 = v18;
LABEL_15:
    uint64_t v15 = a1[7];
LABEL_16:
    BOOL v10 = (void *)(*(void *)(v15 + 8) + 24);
    goto LABEL_8;
  }
  uint64_t v13 = [v18 event];
  uint64_t v14 = [v13 eventType];

  unint64_t v11 = v18;
  if (v14 == 8) {
    goto LABEL_15;
  }
  id v16 = [v18 event];
  uint64_t v17 = [v16 eventType];

  unint64_t v11 = v18;
  if (!v17)
  {
    uint64_t v15 = a1[8];
    goto LABEL_16;
  }
LABEL_9:
}

- (id)_getGeneralWeeklyAnalyticsWithWeeklyHistory:(id)a3 withCandidatesContainer:(id)a4
{
  v95[13] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v31 = v5;
  uint64_t v7 = [v5 historyEvents];
  uint64_t v8 = [v7 count];

  uint64_t v90 = 0;
  v91 = &v90;
  uint64_t v92 = 0x2020000000;
  uint64_t v93 = 200;
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x2020000000;
  uint64_t v89 = 0;
  uint64_t v82 = 0;
  BOOL v83 = &v82;
  uint64_t v84 = 0x2020000000;
  uint64_t v85 = 0;
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x3032000000;
  double v79 = __Block_byref_object_copy__10;
  v80 = __Block_byref_object_dispose__10;
  id v81 = [MEMORY[0x263EFF9C0] set];
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__10;
  v74 = __Block_byref_object_dispose__10;
  id v75 = [MEMORY[0x263EFF9C0] set];
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__10;
  uint64_t v68 = __Block_byref_object_dispose__10;
  id v69 = [MEMORY[0x263EFF980] array];
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2020000000;
  uint64_t v63 = 0;
  uint64_t v9 = [v5 historyEvents];
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __113__IRServicePackageAdapterMedia_IRAnalytics___getGeneralWeeklyAnalyticsWithWeeklyHistory_withCandidatesContainer___block_invoke;
  v59[3] = &unk_2653A0C48;
  v59[4] = &v90;
  v59[5] = &v64;
  v59[6] = &v86;
  v59[7] = &v82;
  v59[8] = &v70;
  v59[9] = &v76;
  v59[10] = &v60;
  [v9 enumerateObjectsUsingBlock:v59];

  uint64_t v10 = [(id)v77[5] count];
  uint64_t v11 = [(id)v71[5] count];
  id v25 = +[IRServicePackageAdapterMedia _getUniqueAirplayRoutsFromCandidateIdentifiers:v71[5] inCandiateContainer:v6];
  id v26 = (id)[v25 count];
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v58 = 0;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  uint64_t v47 = 0;
  unint64_t v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  unint64_t v12 = (void *)v65[5];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __113__IRServicePackageAdapterMedia_IRAnalytics___getGeneralWeeklyAnalyticsWithWeeklyHistory_withCandidatesContainer___block_invoke_2;
  v32[3] = &unk_2653A0C70;
  id v24 = v6;
  id v33 = v24;
  uint64_t v34 = &v55;
  uint64_t v35 = &v39;
  uint64_t v36 = &v51;
  v37 = &v47;
  uint64_t v38 = &v43;
  [v12 enumerateObjectsUsingBlock:v32];
  v94[0] = @"General_Weekly_N_events";
  uint64_t v30 = [NSNumber numberWithUnsignedInteger:v8];
  v95[0] = v30;
  v94[1] = @"General_Weekly_N_days_since_last_brokered_scan";
  uint64_t v29 = [NSNumber numberWithInteger:v91[3]];
  v95[1] = v29;
  v94[2] = @"General_Weekly_N_playbacks_with_milo";
  uint64_t v28 = [NSNumber numberWithUnsignedInteger:v87[3]];
  v95[2] = v28;
  v94[3] = @"General_Is_Milo_Available_Weekly";
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:v83[3]];
  v95[3] = v13;
  v94[4] = @"General_N_Routes_In_History_Weekly";
  uint64_t v14 = [NSNumber numberWithUnsignedInteger:v10];
  v95[4] = v14;
  v94[5] = @"General_N_Routes_used_With_Milo_Weekly";
  uint64_t v15 = [NSNumber numberWithUnsignedInteger:v11];
  v95[5] = v15;
  v94[6] = @"General_N_airplay_Routes_Weekly";
  id v16 = [NSNumber numberWithUnsignedInteger:v26];
  v95[6] = v16;
  v94[7] = @"General_N_airplay_playback_events_Weekly";
  uint64_t v17 = [NSNumber numberWithUnsignedInteger:v56[3]];
  v95[7] = v17;
  v94[8] = @"General_N_airplay_playback_events_custom_loi_Weekly";
  id v18 = [NSNumber numberWithUnsignedInteger:v52[3]];
  v95[8] = v18;
  v94[9] = @"General_Have_BLE_headphones_Weekly";
  id v19 = [NSNumber numberWithUnsignedInteger:v61[3]];
  v95[9] = v19;
  v94[10] = @"General_N_airplay_playback_events_Milo_Weekly";
  uint64_t v20 = [NSNumber numberWithUnsignedInteger:v48[3]];
  v95[10] = v20;
  v94[11] = @"General_N_airplay_playback_events_Milo_Eligible_App_Weekly";
  id v21 = [NSNumber numberWithUnsignedInteger:v44[3]];
  v95[11] = v21;
  v94[12] = @"General_N_airplay_playback_events_Eligible_App_Weekly";
  v22 = [NSNumber numberWithUnsignedInteger:v40[3]];
  v95[12] = v22;
  id v27 = [NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:13];

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v90, 8);

  return v27;
}

void __113__IRServicePackageAdapterMedia_IRAnalytics___getGeneralWeeklyAnalyticsWithWeeklyHistory_withCandidatesContainer___block_invoke(void *a1, void *a2)
{
  id v26 = a2;
  id v3 = [v26 event];
  uint64_t v4 = [v3 eventType];

  if (v4 == 9)
  {
    id v5 = (void *)MEMORY[0x263EFF910];
    id v6 = [v26 date];
    uint64_t v7 = [MEMORY[0x263EFF910] now];
    *(void *)(*(void *)(a1[4] + 8) + 24) = [v5 daysFromDate:v6 toDate:v7];
  }
  uint64_t v8 = [v26 event];
  uint64_t v9 = [v8 eventType];

  if (v9 == 5)
  {
    [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v26];
    uint64_t v10 = [v26 miloPredictionEvent];
    uint64_t v11 = [v10 predictionId];

    if (v11) {
      ++*(void *)(*(void *)(a1[6] + 8) + 24);
    }
  }
  unint64_t v12 = [v26 systemState];
  int v13 = [v12 locationSemanticUserSpecificPlaceType];

  if (v13 == 1)
  {
    *(void *)(*(void *)(a1[7] + 8) + 24) = 1;
    uint64_t v14 = [v26 candidateIdentifier];

    if (v14)
    {
      uint64_t v15 = *(void **)(*(void *)(a1[8] + 8) + 40);
      id v16 = [v26 candidateIdentifier];
      [v15 addObject:v16];
    }
  }
  uint64_t v17 = [v26 candidateIdentifier];

  if (v17)
  {
    id v18 = *(void **)(*(void *)(a1[9] + 8) + 40);
    id v19 = [v26 candidateIdentifier];
    [v18 addObject:v19];
  }
  uint64_t v20 = [v26 systemState];
  if ([v20 outputDeviceType] != 1)
  {

    goto LABEL_17;
  }
  id v21 = [v26 systemState];
  if ([v21 outputDeviceSubType] == 3)
  {
  }
  else
  {
    v22 = [v26 systemState];
    uint64_t v23 = [v22 outputDeviceSubType];

    if (v23 != 2)
    {
LABEL_17:
      id v24 = [v26 systemState];
      uint64_t v25 = [v24 predictedOutputDeviceType];

      if (v25 != 1) {
        goto LABEL_19;
      }
    }
  }
  *(void *)(*(void *)(a1[10] + 8) + 24) = 1;
LABEL_19:
}

void __113__IRServicePackageAdapterMedia_IRAnalytics___getGeneralWeeklyAnalyticsWithWeeklyHistory_withCandidatesContainer___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  id v13 = v3;
  id v5 = [v3 candidateIdentifier];
  id v6 = [v4 candidateForCandidateIdentifier:v5];

  if (v6 && [v6 containsAirplayTarget])
  {
    ++*(void *)(*(void *)(a1[5] + 8) + 24);
    uint64_t v7 = [v13 event];
    int v8 = [v7 isEligibleApp];

    if (v8) {
      ++*(void *)(*(void *)(a1[6] + 8) + 24);
    }
    uint64_t v9 = [v13 systemState];
    int v10 = [v9 locationSemanticUserSpecificPlaceType];

    if (v10 == 5) {
      ++*(void *)(*(void *)(a1[7] + 8) + 24);
    }
    uint64_t v11 = [v13 systemState];
    int v12 = [v11 locationSemanticUserSpecificPlaceType];

    if (v12 == 1)
    {
      ++*(void *)(*(void *)(a1[8] + 8) + 24);
      if (v8) {
        ++*(void *)(*(void *)(a1[9] + 8) + 24);
      }
    }
  }
}

- (id)_getWeeklyAnalyticsFromStatistics:(id)a3 candidatesContainer:(id)a4
{
  v36[11] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a4 candidates];
  uint64_t v7 = [v6 count];

  uint64_t v8 = [v5 numberOfContextChanges];
  uint64_t v9 = [v5 numberOfMiLoPredictions];
  uint64_t v10 = [v5 numberOfMiLoPredictionsInUpdatesMode];
  uint64_t v11 = [v5 lastMiLoLSLItems];
  uint64_t v12 = [v5 lastMiLoQualityReasonBitmap];
  uint64_t v31 = [v5 lastMiLoQuality];
  uint64_t v32 = [v5 lastMiLoModels];
  unint64_t v13 = [v5 numberOfPickerChoiceEvents];
  uint64_t v14 = [v5 numberOfCorrectPickerChoiceEvents];
  if (v13) {
    unint64_t v15 = 100 * v14 / v13;
  }
  else {
    unint64_t v15 = 200;
  }
  uint64_t v30 = [v5 timeInUpdatesModeInSeconds];

  id v16 = +[IRPreferences shared];
  uint64_t v17 = [v16 mobileAssetVersion];

  id v18 = &stru_27039A840;
  if (v17) {
    id v18 = (__CFString *)v17;
  }
  v35[0] = @"General_Weekly_N_candidates";
  uint64_t v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v7, v18);
  v36[0] = v34;
  v35[1] = @"General_Weekly_N_context_changes";
  id v33 = [NSNumber numberWithUnsignedInteger:v8];
  v36[1] = v33;
  v35[2] = @"General_Weekly_N_milo_predictions";
  id v19 = [NSNumber numberWithUnsignedInteger:v9];
  v36[2] = v19;
  v35[3] = @"General_Weekly_N_Milo_Predictions_in_Update_Mode";
  uint64_t v20 = [NSNumber numberWithUnsignedInteger:v10];
  v36[3] = v20;
  v35[4] = @"Milo_Number_of_LSL_Items_Weekly";
  id v21 = [NSNumber numberWithUnsignedInteger:v11];
  v36[4] = v21;
  v35[5] = @"Milo_Quality_Reason_Weekly";
  v22 = [NSNumber numberWithUnsignedInteger:v12];
  v36[5] = v22;
  v35[6] = @"Milo_Quality_Weekly";
  uint64_t v23 = [NSNumber numberWithUnsignedInteger:v31];
  v36[6] = v23;
  v35[7] = @"N_MiLo_Different_Models_Weekly";
  id v24 = [NSNumber numberWithUnsignedInteger:v32];
  v36[7] = v24;
  v35[8] = @"PickerTop_UI_Weekly_SuccessRate";
  uint64_t v25 = [NSNumber numberWithUnsignedInteger:v15];
  v36[8] = v25;
  v35[9] = @"Time_In_Update_Mode_Weekly";
  id v26 = [NSNumber numberWithUnsignedInteger:v30];
  v35[10] = @"General_Weekly_Mobile_Asset_Version";
  v36[9] = v26;
  v36[10] = v29;
  id v27 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:11];

  return v27;
}

- (id)uiAnalyticsWithEvent:(id)a3 forCandidateIdentifier:(id)a4 systemStateManager:(id)a5 candidatesContainer:(id)a6 inspections:(id)a7 statisticsManager:(id)a8 service:(id)a9 historyEventsContainer:(id)a10
{
  v181[37] = *MEMORY[0x263EF8340];
  id v119 = a3;
  id v16 = a4;
  id v120 = a5;
  id v17 = a6;
  id v112 = a7;
  id v113 = a8;
  id v114 = a9;
  id v111 = a10;
  v118 = v17;
  id v18 = -[IRServicePackageAdapterMedia filterHistory:withCandidatesContainer:](self, "filterHistory:withCandidatesContainer:");
  v110 = [v18 historyEvents];

  unint64_t v115 = [v112 objectForKeyedSubscript:*MEMORY[0x263F50080]];
  id v19 = [v114 clientIdentifier];
  if (v19)
  {
    v108 = [v114 clientIdentifier];
  }
  else
  {
    v108 = &stru_27039A840;
  }

  uint64_t v20 = [v119 bundleID];
  int64_t v103 = +[IRAnalyticsUtilities getRedactedBundleID:v20];

  unsigned int v101 = [v119 isEligibleApp];
  id v21 = [v120 systemState];
  unsigned int v99 = [v21 locationSemanticUserSpecificPlaceType];

  [v119 eventType];
  v107 = IRMediaEventTypeToString();
  v22 = [v120 systemState];
  int v71 = [v22 locationSemanticUserSpecificPlaceType];

  uint64_t v23 = [v120 miloProviderLslPredictionResults];
  unsigned int v96 = [v23 canUse];

  id v24 = [v120 miloProviderLslPredictionResults];
  uint64_t v94 = [v24 confidence];

  uint64_t v25 = [v120 miloProviderLslPredictionResults];
  uint64_t v92 = [v25 confidenceReasonBitmap];

  id v26 = [v120 miloProviderLslPredictionResults];
  id v27 = [v26 scores];
  uint64_t v90 = [v27 count];

  uint64_t v28 = [v120 miloProviderLslPredictionResults];
  uint64_t v88 = [v28 miLoServiceQuality];

  uint64_t v29 = [v120 miloProviderLslPredictionResults];
  uint64_t v86 = [v29 miLoServiceQualityReasonBitmap];

  uint64_t v30 = [v120 miloProviderLslPredictionResults];
  uint64_t v31 = [v30 predictionTime];
  [v31 timeIntervalSinceNow];
  double v33 = v32;

  uint64_t v34 = [v17 candidates];
  uint64_t v79 = [v34 count];

  uint64_t v176 = 0;
  v177 = &v176;
  uint64_t v178 = 0x2020000000;
  uint64_t v179 = 0;
  uint64_t v172 = 0;
  v173 = &v172;
  uint64_t v174 = 0x2020000000;
  uint64_t v175 = 0;
  uint64_t v168 = 0;
  v169 = &v168;
  uint64_t v170 = 0x2020000000;
  uint64_t v171 = 0;
  uint64_t v164 = 0;
  v165 = &v164;
  uint64_t v166 = 0x2020000000;
  uint64_t v167 = 0;
  uint64_t v160 = 0;
  v161 = &v160;
  uint64_t v162 = 0x2020000000;
  uint64_t v163 = 0;
  uint64_t v156 = 0;
  v157 = &v156;
  uint64_t v158 = 0x2020000000;
  uint64_t v159 = 0;
  uint64_t v152 = 0;
  v153 = &v152;
  uint64_t v154 = 0x2020000000;
  uint64_t v155 = 0;
  uint64_t v148 = 0;
  v149 = &v148;
  uint64_t v150 = 0x2020000000;
  uint64_t v151 = 0;
  uint64_t v142 = 0;
  v143 = &v142;
  uint64_t v144 = 0x3032000000;
  v145 = __Block_byref_object_copy__10;
  v146 = __Block_byref_object_dispose__10;
  v147 = &stru_27039A840;
  uint64_t v136 = 0;
  v137 = &v136;
  uint64_t v138 = 0x3032000000;
  v139 = __Block_byref_object_copy__10;
  v140 = __Block_byref_object_dispose__10;
  v141 = &stru_27039A840;
  uint64_t v35 = [v115 candidates];
  v123[0] = MEMORY[0x263EF8330];
  v123[1] = 3221225472;
  v123[2] = __189__IRServicePackageAdapterMedia_IRAnalytics__uiAnalyticsWithEvent_forCandidateIdentifier_systemStateManager_candidatesContainer_inspections_statisticsManager_service_historyEventsContainer___block_invoke;
  v123[3] = &unk_2653A0CB8;
  id v126 = &v176;
  id v127 = &v172;
  id v128 = &v168;
  v129 = &v164;
  id v117 = v16;
  id v124 = v117;
  v130 = &v142;
  v131 = &v136;
  __int16 v132 = &v160;
  id v109 = v115;
  id v125 = v109;
  v133 = &v156;
  __int16 v134 = &v152;
  v135 = &v148;
  [v35 enumerateObjectsUsingBlock:v123];

  uint64_t v36 = [v17 candidateForCandidateIdentifier:v117];
  uint64_t v37 = [v36 containsAirplayTarget];
  v106 = +[IRAnalyticsUtilities candidateTypeForCandidate:v36];
  v105 = +[IRAnalyticsUtilities candidateModelTypeForCandidate:v36];
  uint64_t v38 = [v113 timeToBannerInMilliSeconds];
  if (v38)
  {
    uint64_t v39 = [v113 timeToBannerInMilliSeconds];
    uint64_t v40 = [v39 unsignedIntegerValue];
  }
  else
  {
    uint64_t v40 = 0;
  }

  uint64_t v41 = [v109 generatorNegativeInputs];
  uint64_t v42 = [v41 allValues];
  uint64_t v43 = [v42 firstWhere:&__block_literal_global_231];
  BOOL v44 = v43 != 0;

  uint64_t v45 = +[IRPreferences shared];
  uint64_t v46 = [v45 mobileAssetVersion];

  uint64_t v47 = &stru_27039A840;
  if (v46) {
    uint64_t v47 = (__CFString *)v46;
  }
  id v81 = v47;
  unint64_t v48 = [v111 historyEvents];
  v121[0] = MEMORY[0x263EF8330];
  v121[1] = 3221225472;
  v121[2] = __189__IRServicePackageAdapterMedia_IRAnalytics__uiAnalyticsWithEvent_forCandidateIdentifier_systemStateManager_candidatesContainer_inspections_statisticsManager_service_historyEventsContainer___block_invoke_4;
  v121[3] = &unk_26539FEB0;
  id v69 = v36;
  id v122 = v69;
  uint64_t v49 = [v48 firstWhere:v121];

  uint64_t v50 = [v120 miloProviderLslPredictionResults];
  uint64_t v51 = [MEMORY[0x263EFF910] date];
  v116 = +[IRCandidateClassificationDetectorSameSpace sameSpaceMiLoScoresForCandidate:v117 basedOnMiLoPrediction:v50 andHistoryEventsAsc:v110 andDate:v51];

  v52 = [v116 first];
  uint64_t v53 = [v52 unsignedIntegerValue];

  uint64_t v54 = [v116 second];
  unint64_t v55 = [v54 unsignedIntegerValue];

  if (v55) {
    unint64_t v56 = 100 * v53 / v55;
  }
  else {
    unint64_t v56 = 200;
  }
  unsigned int v70 = [v119 isOutsideApp];
  v181[0] = v108;
  v180[0] = @"UI_Event_Client_Identifier";
  v180[1] = @"UI_Event_Internal_App_Name_Enum";
  id v104 = [NSNumber numberWithInteger:v103];
  v181[1] = v104;
  v180[2] = @"UI_Event_Is_Eligible_App";
  id v102 = [NSNumber numberWithBool:v101];
  v181[2] = v102;
  v180[3] = @"UI_Event_Current_LOI_Enum";
  v100 = [NSNumber numberWithInt:v99];
  v181[3] = v100;
  v181[4] = v107;
  v180[4] = @"UI_Event_Type";
  v180[5] = @"UI_Event_Count";
  v98 = [NSNumber numberWithUnsignedInteger:1];
  v181[5] = v98;
  v180[6] = @"UI_Event_MiLo_Available";
  v97 = [NSNumber numberWithBool:v96];
  v181[6] = v97;
  v180[7] = @"UI_Event_MiLo_Confidence";
  v95 = [NSNumber numberWithUnsignedInteger:v94];
  v181[7] = v95;
  v180[8] = @"UI_Event_Milo_Confidence_Reason";
  uint64_t v93 = [NSNumber numberWithUnsignedInteger:v92];
  v181[8] = v93;
  v180[9] = @"UI_Event_Milo_N_LSL_Items";
  v91 = [NSNumber numberWithUnsignedInteger:v90];
  v181[9] = v91;
  v180[10] = @"UI_Event_Milo_Quality";
  uint64_t v89 = [NSNumber numberWithUnsignedInteger:v88];
  v181[10] = v89;
  v180[11] = @"UI_Event_Milo_Quality_Reason";
  v87 = [NSNumber numberWithUnsignedInteger:v86];
  v181[11] = v87;
  v180[12] = @"UI_Event_Milo_Time_Since_Prediction";
  uint64_t v85 = [NSNumber numberWithUnsignedInteger:(unint64_t)fabs(v33)];
  v181[12] = v85;
  v180[13] = @"UI_Event_N_MiLo_Models";
  uint64_t v84 = [NSNumber numberWithUnsignedInteger:0];
  v181[13] = v84;
  v180[14] = @"UI_Event_MiLo_Suspended_Reasons";
  uint64_t v57 = NSNumber;
  BOOL v83 = [v120 miloProvider];
  uint64_t v82 = objc_msgSend(v57, "numberWithUnsignedInteger:", objc_msgSend(v83, "miLoServiceSuspendedReasonBitmap"));
  v181[14] = v82;
  v180[15] = @"UI_Event_N_Candidates";
  v80 = [NSNumber numberWithUnsignedInteger:v79];
  v181[15] = v80;
  v180[16] = @"UI_Event_N_Candidates_Classified_AutoRoute";
  uint64_t v78 = [NSNumber numberWithUnsignedInteger:v177[3]];
  v181[16] = v78;
  v180[17] = @"UI_Event_N_Candidates_Classified_OneTap";
  v77 = [NSNumber numberWithUnsignedInteger:v173[3]];
  v181[17] = v77;
  v180[18] = @"UI_Event_N_Candidates_Classified_TopOfList";
  uint64_t v76 = [NSNumber numberWithUnsignedInteger:v169[3]];
  v181[18] = v76;
  v180[19] = @"UI_Event_N_Candidates_Classified_Filter";
  id v75 = [NSNumber numberWithUnsignedInteger:v165[3]];
  v181[19] = v75;
  v180[20] = @"UI_Event_Selected_Candidate_Classification";
  v181[20] = v143[5];
  v180[21] = @"UI_Event_Selected_Candidate_Rule_Reason";
  v181[21] = v137[5];
  v181[22] = v106;
  v180[22] = @"UI_Event_Selected_Candidate_Type";
  v180[23] = @"UI_Event_Selected_Candidate_Eligibility";
  v74 = [NSNumber numberWithUnsignedInteger:v161[3]];
  v181[23] = v74;
  v180[24] = @"UI_Event_Selected_Candidate_Is_Device_Selector_Output";
  v73 = [NSNumber numberWithUnsignedInteger:v157[3]];
  v181[24] = v73;
  v180[25] = @"UI_Event_Selected_Candidate_Is_Device_Selector_Output_And_Eligible";
  uint64_t v58 = [NSNumber numberWithUnsignedInteger:v153[3]];
  v181[25] = v58;
  v180[26] = @"UI_Event_Selected_Candidate_Is_UWB_Or_MiLo";
  double v59 = [NSNumber numberWithUnsignedInteger:v149[3]];
  v181[26] = v59;
  v180[27] = @"UI_Event_Selected_Candidate_Is_Airplay_Target";
  uint64_t v60 = [NSNumber numberWithBool:v37];
  v181[27] = v60;
  v180[28] = @"UI_Event_Selected_Candidate_Was_Used_At_Home";
  v61 = [NSNumber numberWithBool:v49 != 0];
  v181[28] = v61;
  v181[29] = v105;
  v180[29] = @"UI_Event_Selected_Candidate_Device_Model_Type";
  v180[30] = @"UI_Event_Selected_Candidate_Same_Space_MiLo_LSL_Items";
  uint64_t v62 = [NSNumber numberWithUnsignedInteger:v55];
  v181[30] = v62;
  v180[31] = @"UI_Event_Selected_Candidate_Same_Space_MiLo_Agg_Score";
  uint64_t v63 = [NSNumber numberWithUnsignedInteger:v56];
  v181[31] = v63;
  v180[32] = @"UI_Event_Time_To_Banner_Milli_Seconds";
  uint64_t v64 = [NSNumber numberWithUnsignedInteger:v40];
  v181[32] = v64;
  v180[33] = @"UI_Event_Is_Negative_Rules";
  v65 = [NSNumber numberWithUnsignedInteger:v44];
  v181[33] = v65;
  v181[34] = v81;
  v180[34] = @"UI_Event_Mobile_Asset_Version";
  v180[35] = @"UI_Event_Is_Location_Custom";
  uint64_t v66 = [NSNumber numberWithBool:v71 == 5];
  v181[35] = v66;
  v180[36] = @"UI_Event_Is_Widget";
  v67 = [NSNumber numberWithBool:v70];
  v181[36] = v67;
  id v72 = [NSDictionary dictionaryWithObjects:v181 forKeys:v180 count:37];

  _Block_object_dispose(&v136, 8);
  _Block_object_dispose(&v142, 8);

  _Block_object_dispose(&v148, 8);
  _Block_object_dispose(&v152, 8);
  _Block_object_dispose(&v156, 8);
  _Block_object_dispose(&v160, 8);
  _Block_object_dispose(&v164, 8);
  _Block_object_dispose(&v168, 8);
  _Block_object_dispose(&v172, 8);
  _Block_object_dispose(&v176, 8);

  return v72;
}

void __189__IRServicePackageAdapterMedia_IRAnalytics__uiAnalyticsWithEvent_forCandidateIdentifier_systemStateManager_candidatesContainer_inspections_statisticsManager_service_historyEventsContainer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 inspectionGenerator];
  if (!v3) {
    goto LABEL_21;
  }
  id v20 = v3;
  if ([v3 classification] == 4)
  {
    uint64_t v4 = *(void *)(a1 + 48);
  }
  else if ([v20 classification] == 3)
  {
    uint64_t v4 = *(void *)(a1 + 56);
  }
  else if ([v20 classification] == 2)
  {
    uint64_t v4 = *(void *)(a1 + 64);
  }
  else
  {
    if ([v20 classification] != 1) {
      goto LABEL_11;
    }
    uint64_t v4 = *(void *)(a1 + 72);
  }
  ++*(void *)(*(void *)(v4 + 8) + 24);
LABEL_11:
  id v5 = *(void **)(a1 + 32);
  id v6 = [v20 candidate];
  uint64_t v7 = [v6 candidateIdentifier];
  LODWORD(v5) = [v5 isEqual:v7];

  id v3 = v20;
  if (v5)
  {
    [v20 classification];
    uint64_t v8 = IRCandidateClassificationToString();
    uint64_t v9 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = [v20 classificationDescription];
    uint64_t v12 = *(void *)(*(void *)(a1 + 88) + 8);
    unint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v14 = *(void *)(*(void *)(a1 + 88) + 8);
    if (!*(void *)(v14 + 40))
    {
      *(void *)(v14 + 40) = &stru_27039A840;
    }
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = [*(id *)(a1 + 40) stateMachineClassification];
    unint64_t v15 = [v20 candidateSelectorReasons];
    id v16 = [v15 allValues];
    id v17 = [v16 firstWhere:&__block_literal_global_21];
    *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = v17 != 0;

    BOOL v18 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) >= 3uLL
       && *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) != 0;
    *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = v18;
    if ([v20 sameSpaceBasedOnUWB]) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = [v20 sameSpaceBasedOnMiLo];
    }
    *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = v19;
    id v3 = v20;
  }
LABEL_21:
}

uint64_t __189__IRServicePackageAdapterMedia_IRAnalytics__uiAnalyticsWithEvent_forCandidateIdentifier_systemStateManager_candidatesContainer_inspections_statisticsManager_service_historyEventsContainer___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 BOOLValue];
}

uint64_t __189__IRServicePackageAdapterMedia_IRAnalytics__uiAnalyticsWithEvent_forCandidateIdentifier_systemStateManager_candidatesContainer_inspections_statisticsManager_service_historyEventsContainer___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 BOOLValue];
}

BOOL __189__IRServicePackageAdapterMedia_IRAnalytics__uiAnalyticsWithEvent_forCandidateIdentifier_systemStateManager_candidatesContainer_inspections_statisticsManager_service_historyEventsContainer___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 candidateIdentifier];
  id v5 = [*(id *)(a1 + 32) candidateIdentifier];
  if ([v4 isEqual:v5])
  {
    id v6 = [v3 systemState];
    BOOL v7 = [v6 locationSemanticUserSpecificPlaceType] == 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)_getUniqueAirplayRoutsFromCandidateIdentifiers:(id)a3 inCandiateContainer:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x263EFF9C0];
  id v7 = a3;
  uint64_t v8 = [v6 set];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __112__IRServicePackageAdapterMedia_IRAnalytics___getUniqueAirplayRoutsFromCandidateIdentifiers_inCandiateContainer___block_invoke;
  v14[3] = &unk_2653A0CE0;
  id v15 = v5;
  id v9 = v8;
  id v16 = v9;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:v14];

  uint64_t v11 = v16;
  id v12 = v9;

  return v12;
}

void __112__IRServicePackageAdapterMedia_IRAnalytics___getUniqueAirplayRoutsFromCandidateIdentifiers_inCandiateContainer___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) candidateForCandidateIdentifier:a2];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 nodes];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __112__IRServicePackageAdapterMedia_IRAnalytics___getUniqueAirplayRoutsFromCandidateIdentifiers_inCandiateContainer___block_invoke_2;
    v6[3] = &unk_26539FF00;
    id v7 = *(id *)(a1 + 40);
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

void __112__IRServicePackageAdapterMedia_IRAnalytics___getUniqueAirplayRoutsFromCandidateIdentifiers_inCandiateContainer___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 deviceTypeAndSubType];
  uint64_t v4 = [v3 first];
  uint64_t v5 = [v4 unsignedIntegerValue];

  if (v3 && !v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v9 avOutputDevice];
    uint64_t v8 = [v7 deviceID];
    [v6 addObject:v8];
  }
}

@end