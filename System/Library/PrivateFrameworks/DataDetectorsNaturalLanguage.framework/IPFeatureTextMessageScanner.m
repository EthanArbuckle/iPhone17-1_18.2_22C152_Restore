@interface IPFeatureTextMessageScanner
- (BOOL)followProposal;
- (NSArray)contextMessageUnits;
- (NSMutableArray)dataFeaturesExtractedInContextAndMain;
- (NSMutableArray)detectedEventsInContext;
- (double)confidenceForEvent:(id)a3 baseConfidence:(double)a4;
- (double)experimentalConfidenceForEvent:(id)a3 experimentalBaseConfidence:(double)a4;
- (id)commonComponentsForConfidence;
- (id)dataDetectorsFeaturesForMessageUnit:(id)a3 context:(id)a4;
- (id)eventSpecificComponentsForConfidence:(id)a3;
- (id)keywordFeaturesForMessageUnit:(id)a3;
- (id)processScanOfMainMessageUnit:(id)a3 contextMessageUnits:(id)a4;
- (id)sentenceFeaturesForMessageUnit:(id)a3;
- (unint64_t)mainSentencePolarityFrom:(id)a3;
- (unint64_t)mainSentencePolarityFromMessageUnit:(id)a3 index:(unint64_t)a4;
- (void)confidenceForEvents:(id)a3;
- (void)doSynchronousScanWithCompletionHandler:(id)a3;
- (void)experimentalConfidenceForEvents:(id)a3;
- (void)resetScanState;
- (void)scanEventsInMessageUnits:(id)a3 contextMessageUnits:(id)a4 synchronously:(BOOL)a5 completionHandler:(id)a6;
- (void)scanEventsInMessageUnits:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5;
- (void)setContextMessageUnits:(id)a3;
- (void)setDataFeaturesExtractedInContextAndMain:(id)a3;
- (void)setDetectedEventsInContext:(id)a3;
- (void)setFollowProposal:(BOOL)a3;
@end

@implementation IPFeatureTextMessageScanner

- (void)scanEventsInMessageUnits:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)scanEventsInMessageUnits:(id)a3 contextMessageUnits:(id)a4 synchronously:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void, uint64_t))a6;
  v13 = self;
  objc_sync_enter(v13);
  [(IPFeatureTextMessageScanner *)v13 resetScanState];
  objc_sync_exit(v13);

  [(IPFeatureScanner *)v13 setBodyMessageUnits:v10];
  [(IPFeatureTextMessageScanner *)v13 setContextMessageUnits:v11];
  if (IPDebuggingModeEnabled_once != -1) {
    dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
  }
  if (IPDebuggingModeEnabled_sEnabled)
  {
    v14 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v14 = _IPLogHandle;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = v14;
      v16 = [v10 firstObject];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_225684000, v15, OS_LOG_TYPE_INFO, "Start with message units: %@ #FeatureManager", (uint8_t *)&buf, 0xCu);
    }
    if (IPDebuggingModeEnabled_once != -1) {
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
    }
  }
  if (IPDebuggingModeEnabled_sEnabled)
  {
    v17 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v17 = _IPLogHandle;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = v17;
      v19 = [(IPFeatureTextMessageScanner *)v13 contextMessageUnits];
      uint64_t v20 = [v19 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v20;
      _os_log_impl(&dword_225684000, v18, OS_LOG_TYPE_INFO, "Context: %lu message units #FeatureManager", (uint8_t *)&buf, 0xCu);
    }
  }
  v21 = [v10 firstObject];
  v22 = [v21 text];
  BOOL v23 = [v22 length] == 0;

  if (v23)
  {
    [(IPFeatureScanner *)v13 setResultType:0];
    uint64_t v27 = [(IPFeatureScanner *)v13 resultType];
    v12[2](v12, MEMORY[0x263EFFA68], v27);
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy_;
    v35 = __Block_byref_object_dispose_;
    v24 = [v10 firstObject];
    id v36 = [v24 originalMessage];

    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __108__IPFeatureTextMessageScanner_scanEventsInMessageUnits_contextMessageUnits_synchronously_completionHandler___block_invoke;
    v29[3] = &unk_264722CF0;
    v29[4] = v13;
    v30 = v12;
    p_long long buf = &buf;
    uint64_t v25 = MEMORY[0x22A632750](v29);
    v26 = (void *)v25;
    if (v7)
    {
      (*(void (**)(uint64_t))(v25 + 16))(v25);
    }
    else
    {
      v28 = dispatch_get_global_queue(17, 0);
      dispatch_async(v28, v26);
    }
    _Block_object_dispose(&buf, 8);
  }
}

void __108__IPFeatureTextMessageScanner_scanEventsInMessageUnits_contextMessageUnits_synchronously_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  [*(id *)(a1 + 32) doSynchronousScanWithCompletionHandler:*(void *)(a1 + 40)];
  objc_sync_exit(v2);

  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)doSynchronousScanWithCompletionHandler:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(IPFeatureTextMessageScanner *)self contextMessageUnits];
  int v6 = [v5 count];

  if (v6 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = v6;
    do
    {
      v9 = [(IPFeatureTextMessageScanner *)self contextMessageUnits];
      id v10 = [v9 objectAtIndexedSubscript:v7];

      id v11 = [(IPFeatureTextMessageScanner *)self contextMessageUnits];
      v12 = objc_msgSend(v11, "subarrayWithRange:", 0, v7);

      v13 = [(IPFeatureTextMessageScanner *)self processScanOfMainMessageUnit:v10 contextMessageUnits:v12];
      if ([v13 count])
      {
        v14 = [(IPFeatureTextMessageScanner *)self detectedEventsInContext];
        [v14 addObject:v13];
      }
      ++v7;
    }
    while (v8 != v7);
  }
  v15 = [(IPFeatureScanner *)self bodyMessageUnits];
  v16 = [v15 firstObject];
  v17 = [(IPFeatureTextMessageScanner *)self contextMessageUnits];
  v18 = [(IPFeatureTextMessageScanner *)self processScanOfMainMessageUnit:v16 contextMessageUnits:v17];
  v19 = (void *)[v18 mutableCopy];
  [(IPFeatureScanner *)self setDetectedEvents:v19];

  uint64_t v20 = _IPLogHandle;
  if (!_IPLogHandle)
  {
    IPInitLogging();
    uint64_t v20 = _IPLogHandle;
  }
  v65 = (void (**)(void, void, void))v4;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = v20;
    v22 = [(IPFeatureScanner *)self detectedEvents];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v67 = [v22 count];
    _os_log_impl(&dword_225684000, v21, OS_LOG_TYPE_INFO, "%lu detected events #FeatureManager", buf, 0xCu);
  }
  if (IPDebuggingModeEnabled_once != -1) {
    dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
  }
  if (IPDebuggingModeEnabled_sEnabled)
  {
    BOOL v23 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      BOOL v23 = _IPLogHandle;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = v23;
      uint64_t v25 = [(IPFeatureScanner *)self detectedEvents];
      v26 = [v25 valueForKey:@"ipsos_betterDescription"];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v67 = (uint64_t)v26;
      _os_log_impl(&dword_225684000, v24, OS_LOG_TYPE_INFO, "Detected Events: %@ #FeatureManager", buf, 0xCu);
    }
  }
  uint64_t v27 = [(IPFeatureScanner *)self detectedEvents];
  v28 = [(IPFeatureScanner *)self stitchedEventsFromEvents:v27];
  [(IPFeatureScanner *)self setStitchedEvents:v28];

  if (IPDebuggingModeEnabled_once != -1) {
    dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
  }
  if (IPDebuggingModeEnabled_sEnabled)
  {
    v29 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v29 = _IPLogHandle;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = v29;
      v31 = [(IPFeatureScanner *)self stitchedEvents];
      v32 = [v31 valueForKey:@"ipsos_betterDescription"];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v67 = (uint64_t)v32;
      _os_log_impl(&dword_225684000, v30, OS_LOG_TYPE_INFO, "Stitched Events: %@ #FeatureManager", buf, 0xCu);
    }
  }
  uint64_t v33 = [(IPFeatureScanner *)self stitchedEvents];
  v34 = [(IPFeatureScanner *)self bodyMessageUnits];
  v35 = [(IPFeatureTextMessageScanner *)self dataFeaturesExtractedInContextAndMain];
  [(IPFeatureScanner *)self enrichEvents:v33 messageUnits:v34 dateInSubject:0 dataFeatures:v35];

  if (IPDebuggingModeEnabled_once != -1) {
    dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
  }
  if (IPDebuggingModeEnabled_sEnabled)
  {
    id v36 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      id v36 = _IPLogHandle;
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      uint64_t v37 = v36;
      v38 = [(IPFeatureScanner *)self stitchedEvents];
      v39 = [v38 valueForKey:@"ipsos_betterDescription"];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v67 = (uint64_t)v39;
      _os_log_impl(&dword_225684000, v37, OS_LOG_TYPE_INFO, "Enriched Events based on Event Type: %@ #FeatureManager", buf, 0xCu);
    }
  }
  v40 = [(IPFeatureScanner *)self stitchedEvents];
  [(IPFeatureScanner *)self adjustTimeForEvents:v40];

  v41 = [(IPFeatureScanner *)self stitchedEvents];
  [(IPFeatureTextMessageScanner *)self confidenceForEvents:v41];

  v42 = [(IPFeatureScanner *)self stitchedEvents];
  [(IPFeatureTextMessageScanner *)self experimentalConfidenceForEvents:v42];

  v43 = [(IPFeatureScanner *)self stitchedEvents];
  v44 = [(IPFeatureScanner *)self bodyMessageUnits];
  v45 = [v44 firstObject];
  v46 = [v45 originalMessage];
  v47 = [v46 dateSent];
  v48 = [(IPFeatureScanner *)self filteredEventsForDetectedEvents:v43 referenceDate:v47];
  [(IPFeatureScanner *)self setFilteredDetectedEvents:v48];

  v49 = _IPLogHandle;
  if (!_IPLogHandle)
  {
    IPInitLogging();
    v49 = _IPLogHandle;
  }
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    v50 = v49;
    v51 = [(IPFeatureScanner *)self filteredDetectedEvents];
    uint64_t v52 = [v51 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v67 = v52;
    _os_log_impl(&dword_225684000, v50, OS_LOG_TYPE_INFO, "%lu detected events after filtering #FeatureManager", buf, 0xCu);
  }
  if (IPDebuggingModeEnabled_once != -1) {
    dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
  }
  if (IPDebuggingModeEnabled_sEnabled)
  {
    v53 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v53 = _IPLogHandle;
    }
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      v54 = v53;
      v55 = [(IPFeatureScanner *)self filteredDetectedEvents];
      v56 = [v55 valueForKey:@"ipsos_betterDescription"];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v67 = (uint64_t)v56;
      _os_log_impl(&dword_225684000, v54, OS_LOG_TYPE_INFO, "Filtered Events: %@ #FeatureManager", buf, 0xCu);
    }
  }
  v57 = [(IPFeatureScanner *)self filteredDetectedEvents];
  unint64_t v58 = [v57 count];

  if (v58 < 2)
  {
    v61 = [(IPFeatureScanner *)self filteredDetectedEvents];
    [(IPFeatureScanner *)self normalizedEvents:v61];

    v62 = [(IPFeatureScanner *)self filteredDetectedEvents];
    uint64_t v63 = [v62 count];

    v64 = [(IPFeatureScanner *)self filteredDetectedEvents];
    ((void (**)(void, void *, BOOL))v65)[2](v65, v64, v63 != 0);
  }
  else
  {
    v59 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v59 = _IPLogHandle;
    }
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_225684000, v59, OS_LOG_TYPE_INFO, "Bailing out because more than 1 EVENT are detected #FeatureManager", buf, 2u);
    }
    [(IPFeatureScanner *)self setResultType:-68];
    int64_t v60 = [(IPFeatureScanner *)self resultType];
    v65[2](v65, MEMORY[0x263EFFA68], v60);
  }
}

- (unint64_t)mainSentencePolarityFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    double v7 = 0.0;
    unint64_t v8 = 1;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        v12 = objc_msgSend(v11, "fragments", 0);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = [*(id *)(*((void *)&v19 + 1) + 8 * j) mainPolarity];
              switch(v17)
              {
                case 2:
                  double v7 = v7 + 1.0;
                  break;
                case 3:
                  double v9 = v9 + 1.0;
                  break;
                case 4:
                  unint64_t v8 = 4;
                  goto LABEL_19;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v14);
        }
LABEL_19:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
    if (v7 <= 0.0)
    {
      if (v9 > 0.0) {
        unint64_t v8 = 3;
      }
    }
    else
    {
      unint64_t v8 = 2;
    }
  }
  else
  {
    unint64_t v8 = 1;
  }

  return v8;
}

- (id)processScanOfMainMessageUnit:(id)a3 contextMessageUnits:(id)a4
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 count];
  uint64_t v9 = [v7 count];
  unint64_t v10 = [(IPFeatureTextMessageScanner *)self mainSentencePolarityFromMessageUnit:v6 index:v8];
  if (v10 != 4)
  {
    unint64_t v84 = v10;
    id v14 = (id)objc_opt_new();
    long long v20 = objc_opt_new();
    uint64_t v90 = v9;
    if (v9)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        long long v22 = [v7 objectAtIndexedSubscript:i];
        if (([(IPFeatureTextMessageScanner *)self mainSentencePolarityFromMessageUnit:v22 index:i] & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          [v22 text];
          v24 = long long v23 = self;
          [v20 appendString:v24];

          [v20 appendString:@"\n"];
          long long v25 = [NSNumber numberWithUnsignedInteger:i];
          [v14 addObject:v25];

          self = v23;
          uint64_t v9 = v90;
        }
      }
    }
    long long v26 = [(IPFeatureTextMessageScanner *)self keywordFeaturesForMessageUnit:v6];
    uint64_t v27 = (void *)[v26 mutableCopy];
    [(IPFeatureScanner *)self setBodyKeywordFeatures:v27];

    if ([v20 length])
    {
      v110 = @"IPFeatureExtractorContextText";
      v111 = v20;
      uint64_t v28 = [NSDictionary dictionaryWithObjects:&v111 forKeys:&v110 count:1];
    }
    else
    {
      uint64_t v28 = 0;
    }
    v80 = (void *)v28;
    uint64_t v29 = [(IPFeatureTextMessageScanner *)self dataDetectorsFeaturesForMessageUnit:v6 context:v28];
    v30 = (void *)[v29 mutableCopy];
    [(IPFeatureScanner *)self setBodyDataDetectorsFeatures:v30];

    v31 = [(IPFeatureTextMessageScanner *)self dataFeaturesExtractedInContextAndMain];
    v32 = [(IPFeatureScanner *)self bodyDataDetectorsFeatures];
    [v31 addObjectsFromArray:v32];

    id v33 = objc_alloc(MEMORY[0x263EFF980]);
    v34 = [(IPFeatureScanner *)self bodyDataDetectorsFeatures];
    v35 = (void *)[v33 initWithArray:v34];

    id v36 = [(IPFeatureScanner *)self bodySentenceFeatures];
    [v35 addObjectsFromArray:v36];

    uint64_t v37 = [(IPFeatureScanner *)self bodyKeywordFeatures];
    [v35 addObjectsFromArray:v37];

    v83 = v35;
    [(IPFeatureScanner *)self setBodyAllFeatures:v35];
    uint64_t v38 = v90;
    id v82 = v6;
    if ((v84 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v39 = [(IPFeatureScanner *)self bodyKeywordFeatures];
      if ([v39 count])
      {
      }
      else
      {
        v40 = [(IPFeatureScanner *)self bodyDataDetectorsFeatures];
        uint64_t v41 = [v40 count];

        if (!v41)
        {
          v72 = [(IPFeatureTextMessageScanner *)self detectedEventsInContext];
          uint64_t v73 = [v72 count];

          if (!v73)
          {
            long long v19 = (void *)MEMORY[0x263EFFA68];
            goto LABEL_45;
          }
          v74 = [(IPFeatureTextMessageScanner *)self detectedEventsInContext];
          v75 = [v74 lastObject];

          long long v101 = 0u;
          long long v102 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          id v61 = v75;
          uint64_t v76 = [v61 countByEnumeratingWithState:&v99 objects:v109 count:16];
          if (v76)
          {
            uint64_t v77 = v76;
            uint64_t v78 = *(void *)v100;
            do
            {
              for (uint64_t j = 0; j != v77; ++j)
              {
                if (*(void *)v100 != v78) {
                  objc_enumerationMutation(v61);
                }
                objc_msgSend(*(id *)(*((void *)&v99 + 1) + 8 * j), "setIpsos_eventStatus:", -[IPFeatureScanner eventStatusFromPolarity:](self, "eventStatusFromPolarity:", v84));
              }
              uint64_t v77 = [v61 countByEnumeratingWithState:&v99 objects:v109 count:16];
            }
            while (v77);
            long long v19 = v61;
          }
          else
          {
            long long v19 = v61;
          }
LABEL_44:

LABEL_45:
          goto LABEL_46;
        }
      }
    }
    v87 = self;
    v81 = v20;
    v88 = objc_opt_new();
    if (v90)
    {
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v44 = MEMORY[0x263EFFA88];
      id v85 = v14;
      id v86 = v7;
      do
      {
        id v45 = v7;
        v46 = [v7 objectAtIndexedSubscript:v43];
        v47 = [NSNumber numberWithUnsignedInteger:v43];
        int v48 = [v14 containsObject:v47];

        if (v48)
        {
          v89 = v46;
          v49 = [(IPFeatureTextMessageScanner *)v87 keywordFeaturesForMessageUnit:v46];
          long long v95 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          uint64_t v50 = [v49 countByEnumeratingWithState:&v95 objects:v108 count:16];
          if (v50)
          {
            uint64_t v51 = v50;
            uint64_t v52 = *(void *)v96;
            do
            {
              for (uint64_t k = 0; k != v51; ++k)
              {
                if (*(void *)v96 != v52) {
                  objc_enumerationMutation(v49);
                }
                v54 = *(void **)(*((void *)&v95 + 1) + 8 * k);
                uint64_t v55 = [v54 matchRange] + v42;
                [v54 matchRange];
                objc_msgSend(v54, "setMatchRange:", v55, v56);
                v57 = [v54 contextDictionary];
                [v57 setObject:v44 forKeyedSubscript:@"extractedInSubject"];
              }
              uint64_t v51 = [v49 countByEnumeratingWithState:&v95 objects:v108 count:16];
            }
            while (v51);
          }
          [v88 addObjectsFromArray:v49];

          id v14 = v85;
          id v45 = v86;
          v46 = v89;
          uint64_t v38 = v90;
        }
        unint64_t v58 = [v46 text];
        v42 += [v58 length];

        ++v43;
        id v7 = v45;
      }
      while (v43 != v38);
    }
    v59 = [(IPFeatureScanner *)v87 bodyKeywordFeatures];
    int64_t v60 = (void *)[v59 mutableCopy];

    id v61 = v88;
    [v60 addObjectsFromArray:v88];
    long long v19 = [(IPFeatureScanner *)v87 analyzeFeatures:v83 messageUnit:v6 checkPolarity:0 polarity:v84];
    if ([v19 count])
    {
      v62 = [v6 originalMessage];
      [v62 setSubject:v81];

      uint64_t v63 = [(IPFeatureScanner *)v87 bodyDataDetectorsFeatures];
      v64 = +[IPEventClassificationType eventClassificationTypeFromMessageUnit:v6 keywordFeatures:v60 datafeatures:v63];

      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id v65 = v19;
      uint64_t v66 = [v65 countByEnumeratingWithState:&v91 objects:v107 count:16];
      if (v66)
      {
        uint64_t v67 = v66;
        uint64_t v68 = *(void *)v92;
        do
        {
          for (uint64_t m = 0; m != v67; ++m)
          {
            if (*(void *)v92 != v68) {
              objc_enumerationMutation(v65);
            }
            v70 = *(void **)(*((void *)&v91 + 1) + 8 * m);
            objc_msgSend(v70, "setIpsos_eventClassificationType:", v64);
            objc_msgSend(v70, "setIpsos_eventAttributes:", objc_msgSend(v70, "ipsos_eventAttributes") | 4);
          }
          uint64_t v67 = [v65 countByEnumeratingWithState:&v91 objects:v107 count:16];
        }
        while (v67);
      }

      id v6 = v82;
      id v61 = v88;
    }

    long long v20 = v81;
    goto LABEL_44;
  }
  id v11 = [(IPFeatureTextMessageScanner *)self detectedEventsInContext];
  v12 = [v11 lastObject];
  uint64_t v13 = (void *)[v12 copy];

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v103 objects:v112 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v104;
    do
    {
      for (uint64_t n = 0; n != v16; ++n)
      {
        if (*(void *)v104 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v103 + 1) + 8 * n), "setIpsos_eventStatus:", 3);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v103 objects:v112 count:16];
    }
    while (v16);
  }
  long long v19 = v14;
LABEL_46:

  return v19;
}

- (id)dataDetectorsFeaturesForMessageUnit:(id)a3 context:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 dataFeatures];

  if (!v8)
  {
    uint64_t v9 = [(id)objc_opt_class() dataDetectorsFeatureExtractor];
    v15[0] = v9;
    unint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];

    id v11 = [v6 text];
    v12 = [(IPFeatureScanner *)self featuresForTextString:v11 inMessageUnit:v6 extractors:v10 context:v7];
    [v6 setDataFeatures:v12];
  }
  uint64_t v13 = [v6 dataFeatures];

  return v13;
}

- (id)sentenceFeaturesForMessageUnit:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 sentenceFeatures];

  if (!v5)
  {
    id v6 = [(id)objc_opt_class() sentenceFeatureExtractor];
    id v7 = [v4 text];
    v12[0] = v6;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    uint64_t v9 = [(IPFeatureScanner *)self featuresForTextString:v7 inMessageUnit:v4 extractors:v8 context:0];

    [v4 setSentenceFeatures:v9];
  }
  unint64_t v10 = [v4 sentenceFeatures];

  return v10;
}

- (id)keywordFeaturesForMessageUnit:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 keywordFeatures];

  if (!v5)
  {
    id v6 = [(id)objc_opt_class() keywordFeatureExtractor];
    id v7 = [v4 lowercaseTextTruncated];
    v12[0] = v6;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    uint64_t v9 = [(IPFeatureScanner *)self featuresForTextString:v7 inMessageUnit:v4 extractors:v8 context:0];

    [v4 setKeywordFeatures:v9];
  }
  unint64_t v10 = [v4 keywordFeatures];

  return v10;
}

- (unint64_t)mainSentencePolarityFromMessageUnit:(id)a3 index:(unint64_t)a4
{
  uint64_t v5 = -[IPFeatureTextMessageScanner sentenceFeaturesForMessageUnit:](self, "sentenceFeaturesForMessageUnit:", a3, a4);
  unint64_t v6 = [(IPFeatureTextMessageScanner *)self mainSentencePolarityFrom:v5];

  return v6;
}

- (void)resetScanState
{
  [(IPFeatureTextMessageScanner *)self setContextMessageUnits:MEMORY[0x263EFFA68]];
  id v3 = objc_opt_new();
  [(IPFeatureTextMessageScanner *)self setDetectedEventsInContext:v3];

  id v4 = objc_opt_new();
  [(IPFeatureTextMessageScanner *)self setDataFeaturesExtractedInContextAndMain:v4];

  [(IPFeatureTextMessageScanner *)self setFollowProposal:0];
  v5.receiver = self;
  v5.super_class = (Class)IPFeatureTextMessageScanner;
  [(IPFeatureScanner *)&v5 resetScanState];
}

- (void)confidenceForEvents:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [(IPFeatureScanner *)self detectedEvents];
  unint64_t v6 = [v5 count];

  if (v6 <= 4)
  {
    uint64_t v8 = [(IPFeatureScanner *)self detectedEvents];
    unint64_t v9 = [v8 count];

    if (v9 <= 3)
    {
      unint64_t v10 = [(IPFeatureScanner *)self detectedEvents];
      unint64_t v11 = [v10 count];

      if (v11 <= 2) {
        double v7 = 1.0;
      }
      else {
        double v7 = 0.95;
      }
    }
    else
    {
      double v7 = 0.9;
    }
  }
  else
  {
    double v7 = 0.7;
  }
  v12 = [(IPFeatureScanner *)self stitchedEvents];
  unint64_t v13 = [v12 count];

  if (v13 >= 4)
  {
    double v14 = 0.75;
LABEL_12:
    double v7 = v7 * v14;
    goto LABEL_15;
  }
  uint64_t v15 = [(IPFeatureScanner *)self stitchedEvents];
  unint64_t v16 = [v15 count];

  if (v16 >= 3)
  {
    double v14 = 0.85;
    goto LABEL_12;
  }
  uint64_t v17 = [(IPFeatureScanner *)self stitchedEvents];
  unint64_t v18 = [v17 count];

  if (v18 > 1) {
    double v7 = v7 * 0.95;
  }
LABEL_15:
  long long v19 = [(IPFeatureScanner *)self bodyKeywordFeatures];
  unint64_t v20 = [v19 count];

  if (v20 > 5) {
    double v7 = v7 * 0.9;
  }
  long long v21 = [(IPFeatureScanner *)self bodyKeywordFeatures];
  unint64_t v22 = [v21 count];

  if (v22 >= 4)
  {
    double v23 = 1.15;
LABEL_21:
    double v7 = v7 * v23;
    goto LABEL_24;
  }
  long long v24 = [(IPFeatureScanner *)self bodyKeywordFeatures];
  unint64_t v25 = [v24 count];

  if (v25 >= 3)
  {
    double v23 = 1.1;
    goto LABEL_21;
  }
  long long v26 = [(IPFeatureScanner *)self bodyKeywordFeatures];
  unint64_t v27 = [v26 count];

  if (v27 > 1) {
    double v7 = v7 * 1.05;
  }
LABEL_24:
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v28 = v4;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v37 != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        -[IPFeatureTextMessageScanner confidenceForEvent:baseConfidence:](self, "confidenceForEvent:baseConfidence:", v33, v7, (void)v36);
        double v7 = v34;
        double v35 = fmin(v34, 1.0);
        if (v35 < 0.0) {
          double v35 = 0.0;
        }
        objc_msgSend(v33, "setIpsos_confidence:", v35);
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v30);
  }
}

- (double)confidenceForEvent:(id)a3 baseConfidence:(double)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 isAllDay])
  {
    double v6 = 0.95;
LABEL_5:
    a4 = a4 * v6;
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "ipsos_usesDefaultClassificationTypeStartTime"))
  {
    double v6 = 0.8;
    goto LABEL_5;
  }
  if (objc_msgSend(v5, "ipsos_isTimeApproximate")) {
    a4 = a4 * 0.8;
  }
LABEL_8:
  if (objc_msgSend(v5, "ipsos_isDateTimeTenseDependent")) {
    a4 = a4 * 0.8;
  }
  if (objc_msgSend(v5, "ipsos_timeNeedsMeridianGuess")) {
    a4 = a4 * 0.9;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  if (objc_msgSend(v5, "ipsos_isEventTimeOnlyAndReferrengingToSentDate")) {
    a4 = a4 * 0.75;
  }
  long long v22 = 0uLL;
  long long v23 = 0uLL;
  double v7 = objc_msgSend(v5, "ipsos_dataFeatures", (void)v20);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    double v11 = 0.0;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        double v14 = [*(id *)(*((void *)&v20 + 1) + 8 * i) contextDictionary];
        uint64_t v15 = [v14 objectForKeyedSubscript:@"polarityProbability"];

        if (v15)
        {
          [v15 doubleValue];
          if (v16 <= 0.001) {
            double v16 = -0.0;
          }
          else {
            double v11 = v11 + 1.0;
          }
          double v12 = v12 + v16;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);

    if (v11 > 0.0) {
      a4 = a4 * ((1.0 - v12 / v11) * -0.5 + 1.0);
    }
  }
  else
  {
  }
  uint64_t v17 = [v5 title];
  uint64_t v18 = [v17 length];

  if (!v18) {
    a4 = a4 * 0.85;
  }

  return a4;
}

- (void)experimentalConfidenceForEvents:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(IPFeatureTextMessageScanner *)self commonComponentsForConfidence];
  double v6 = [v5 objectForKeyedSubscript:@"IPFeatureTextMessageScannerConfidenceNormTextLength"];
  [v6 doubleValue];
  BOOL v8 = v7 < 27.5;

  uint64_t v9 = [v5 objectForKeyedSubscript:@"IPFeatureTextMessageScannerConfidenceNumberOfEventTypes"];
  int v10 = [v9 intValue];

  if (v10 >= 2)
  {
    if (v10 >= 4) {
      double v11 = dbl_2256AF000[v10 < 6];
    }
    else {
      double v11 = 0.05;
    }
  }
  else
  {
    double v11 = -0.05;
  }
  double v12 = [(IPFeatureScanner *)self stitchedEvents];
  unint64_t v13 = [v12 count];

  double v14 = [(IPFeatureScanner *)self bodyKeywordFeatures];
  uint64_t v15 = [v14 count];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = v4;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    double v19 = dbl_2256AEFF0[v8] + v11;
    if (v13 > 1) {
      double v19 = v19 + -0.02;
    }
    double v20 = dbl_2256AF010[v15 == 1];
    if (!v15) {
      double v20 = -0.04;
    }
    double v21 = v19 + v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v16);
        }
        long long v24 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        -[IPFeatureTextMessageScanner experimentalConfidenceForEvent:experimentalBaseConfidence:](self, "experimentalConfidenceForEvent:experimentalBaseConfidence:", v24, v21, (void)v26);
        double v21 = v25;
        objc_msgSend(v24, "setIpsos_experimentalConfidence:");
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v18);
  }
}

- (double)experimentalConfidenceForEvent:(id)a3 experimentalBaseConfidence:(double)a4
{
  id v6 = a3;
  double v7 = [(IPFeatureTextMessageScanner *)self eventSpecificComponentsForConfidence:v6];
  BOOL v8 = [v7 objectForKeyedSubscript:@"IPFeatureTextMessageScannerConfidenceMatchedRatio"];
  [v8 doubleValue];
  double v10 = v9;

  if (v10 >= 0.02)
  {
    if (v10 >= 0.04)
    {
      if (v10 >= 0.06)
      {
        if (v10 >= 0.11) {
          double v11 = dbl_2256AF020[v10 < 0.15];
        }
        else {
          double v11 = 0.03;
        }
      }
      else
      {
        double v11 = -0.01;
      }
    }
    else
    {
      double v11 = -0.02;
    }
  }
  else
  {
    double v11 = -0.13;
  }
  double v12 = v11 + a4;
  int v13 = objc_msgSend(v6, "ipsos_isTimeApproximate");
  double v14 = 0.03;
  if (v13) {
    double v14 = -0.08;
  }
  double v15 = v12 + v14;
  id v16 = [v7 objectForKeyedSubscript:@"IPFeatureTextMessageScannerConfidenceDistanceToDates"];
  [v16 doubleValue];
  double v18 = v17;

  if (v18 >= 0.97) {
    double v19 = v15 + 0.1;
  }
  else {
    double v19 = v15;
  }
  if (objc_msgSend(v6, "ipsos_usesDefaultClassificationTypeStartTime")) {
    double v19 = v19 + 0.01;
  }
  int v20 = [v6 isAllDay];
  double v21 = -0.24;
  if (!v20) {
    double v21 = 0.01;
  }
  double v22 = v19 + v21;
  long long v23 = [v6 title];

  BOOL v24 = [v23 length] == 0;
  double v25 = v22 + dbl_2256AF030[v24];

  return v25;
}

- (id)eventSpecificComponentsForConfidence:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v37 = a3;
  uint64_t v36 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = [(IPFeatureScanner *)self bodyKeywordFeatures];
  id v6 = [v4 setWithArray:v5];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  double v7 = [(IPFeatureTextMessageScanner *)self contextMessageUnits];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = [*(id *)(*((void *)&v42 + 1) + 8 * i) keywordFeatures];
        [v6 addObjectsFromArray:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v9);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = v13;
    int v17 = 0;
    uint64_t v18 = *(void *)v39;
    double v19 = 0.0;
    double v20 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v16);
        }
        double v22 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        long long v23 = [v22 eventTypes];
        BOOL v24 = objc_msgSend(v37, "ipsos_eventClassificationType");
        int v25 = [v23 containsObject:v24];

        if (v25)
        {
          long long v26 = [v22 contextDictionary];
          long long v27 = [v26 objectForKeyedSubscript:@"IPFeatureKeywordContextDistanceToDate"];
          [v27 doubleValue];
          double v20 = v20 + v28;

          long long v29 = [v22 contextDictionary];
          uint64_t v30 = [v29 objectForKeyedSubscript:@"IPFeatureKeywordContextMatchedRatio"];
          [v30 doubleValue];
          double v19 = v19 + v31;

          ++v17;
        }
      }
      uint64_t v15 = [v16 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v15);
    id v13 = v16;

    v32 = (void *)v36;
    if (v17 >= 1) {
      double v20 = v20 / (double)v17;
    }
  }
  else
  {

    double v19 = 0.0;
    double v20 = 0.0;
    v32 = (void *)v36;
  }
  id v33 = [NSNumber numberWithDouble:v20];
  [v32 setObject:v33 forKeyedSubscript:@"IPFeatureTextMessageScannerConfidenceDistanceToDates"];

  double v34 = [NSNumber numberWithDouble:v19];
  [v32 setObject:v34 forKeyedSubscript:@"IPFeatureTextMessageScannerConfidenceMatchedRatio"];

  return v32;
}

- (id)commonComponentsForConfidence
{
  uint64_t v132 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = [(IPFeatureScanner *)self bodyKeywordFeatures];
  id v6 = [v4 setWithArray:v5];

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  v88 = self;
  double v7 = [(IPFeatureTextMessageScanner *)self contextMessageUnits];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v120 objects:v131 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v121;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v121 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = [*(id *)(*((void *)&v120 + 1) + 8 * i) keywordFeatures];
        [v6 addObjectsFromArray:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v120 objects:v131 count:16];
    }
    while (v9);
  }

  id v13 = [MEMORY[0x263EFF9C0] set];
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v116 objects:v130 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v117;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v117 != v17) {
          objc_enumerationMutation(v14);
        }
        double v19 = [*(id *)(*((void *)&v116 + 1) + 8 * j) eventTypes];
        [v13 addObjectsFromArray:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v116 objects:v130 count:16];
    }
    while (v16);
  }

  id v86 = v13;
  double v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
  v87 = v3;
  [v3 setObject:v20 forKeyedSubscript:@"IPFeatureTextMessageScannerConfidenceNumberOfEventTypes"];

  double v21 = [MEMORY[0x263EFF9A0] dictionary];
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  obuint64_t j = v14;
  uint64_t v91 = [obj countByEnumeratingWithState:&v112 objects:v129 count:16];
  if (v91)
  {
    uint64_t v90 = *(void *)v113;
    do
    {
      double v22 = 0;
      do
      {
        if (*(void *)v113 != v90) {
          objc_enumerationMutation(obj);
        }
        long long v93 = v22;
        long long v23 = *(void **)(*((void *)&v112 + 1) + 8 * (void)v22);
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        BOOL v24 = [v23 eventTypes];
        uint64_t v25 = [v24 countByEnumeratingWithState:&v108 objects:v128 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v109;
          do
          {
            for (uint64_t k = 0; k != v26; ++k)
            {
              if (*(void *)v109 != v27) {
                objc_enumerationMutation(v24);
              }
              long long v29 = *(void **)(*((void *)&v108 + 1) + 8 * k);
              uint64_t v30 = [v29 identifier];
              double v31 = [v21 objectForKeyedSubscript:v30];

              if (!v31)
              {
                v32 = [v29 identifier];
                [v21 setObject:&unk_26D8CD7E0 forKeyedSubscript:v32];
              }
              id v33 = NSNumber;
              double v34 = [v29 identifier];
              double v35 = [v21 objectForKeyedSubscript:v34];
              uint64_t v36 = objc_msgSend(v33, "numberWithInt:", objc_msgSend(v35, "intValue") + 1);
              id v37 = [v29 identifier];
              [v21 setObject:v36 forKeyedSubscript:v37];
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v108 objects:v128 count:16];
          }
          while (v26);
        }

        double v22 = v93 + 1;
      }
      while (v93 + 1 != (char *)v91);
      uint64_t v91 = [obj countByEnumeratingWithState:&v112 objects:v129 count:16];
    }
    while (v91);
  }

  long long v38 = [v21 allValues];
  long long v92 = v38;
  if ([v38 count])
  {
    long long v39 = (void *)MEMORY[0x263F087F0];
    long long v40 = [MEMORY[0x263F087F0] expressionForConstantValue:v38];
    v127 = v40;
    long long v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v127 count:1];
    long long v42 = [v39 expressionForFunction:@"stddev:" arguments:v41];

    long long v43 = [v42 expressionValueWithObject:0 context:0];
    [v43 doubleValue];
    double v45 = v44;
  }
  else
  {
    double v45 = 0.0;
  }
  v46 = [NSNumber numberWithDouble:v45];
  [v87 setObject:v46 forKeyedSubscript:@"IPFeatureTextMessageScannerConfidenceEventVariance"];

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  v47 = [(IPFeatureTextMessageScanner *)v88 contextMessageUnits];
  uint64_t v48 = [(IPFeatureScanner *)v88 bodyMessageUnits];
  v49 = [v47 arrayByAddingObjectsFromArray:v48];

  id v94 = v49;
  uint64_t v50 = [v49 countByEnumeratingWithState:&v104 objects:v126 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = *(void *)v105;
    do
    {
      for (uint64_t m = 0; m != v51; ++m)
      {
        if (*(void *)v105 != v54) {
          objc_enumerationMutation(v94);
        }
        uint64_t v56 = *(void **)(*((void *)&v104 + 1) + 8 * m);
        long long v100 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        v57 = [v56 sentenceFeatures];
        uint64_t v58 = [v57 countByEnumeratingWithState:&v100 objects:v125 count:16];
        if (v58)
        {
          uint64_t v59 = v58;
          uint64_t v60 = *(void *)v101;
          do
          {
            for (uint64_t n = 0; n != v59; ++n)
            {
              if (*(void *)v101 != v60) {
                objc_enumerationMutation(v57);
              }
              uint64_t v62 = [*(id *)(*((void *)&v100 + 1) + 8 * n) polarity];
              if (v62 == 4)
              {
                if ((v52 & 0xFFFFFFFFFFFFFFFELL) == 2) {
                  uint64_t v53 = (v53 + 1);
                }
                else {
                  uint64_t v53 = v53;
                }
                uint64_t v52 = 4;
              }
              else if ((v62 & 0xFFFFFFFFFFFFFFFELL) == 2)
              {
                if (v52 == 4) {
                  uint64_t v53 = (v53 + 1);
                }
                else {
                  uint64_t v53 = v53;
                }
                uint64_t v52 = v62;
              }
            }
            uint64_t v59 = [v57 countByEnumeratingWithState:&v100 objects:v125 count:16];
          }
          while (v59);
        }
      }
      uint64_t v51 = [v94 countByEnumeratingWithState:&v104 objects:v126 count:16];
    }
    while (v51);
  }
  else
  {
    uint64_t v53 = 0;
  }

  uint64_t v63 = [NSNumber numberWithInt:v53];
  [v87 setObject:v63 forKeyedSubscript:@"IPFeatureTextMessageScannerConfidencePolarityFlips"];

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v64 = [(IPFeatureScanner *)v88 bodyMessageUnits];
  uint64_t v65 = [v64 countByEnumeratingWithState:&v96 objects:v124 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = *(void *)v97;
    double v68 = 0.0;
    do
    {
      for (iuint64_t i = 0; ii != v66; ++ii)
      {
        if (*(void *)v97 != v67) {
          objc_enumerationMutation(v64);
        }
        v70 = *(void **)(*((void *)&v96 + 1) + 8 * ii);
        v71 = [v70 text];
        uint64_t v72 = [v71 length];
        uint64_t v73 = [v70 originalMessage];
        v74 = [v73 subject];
        double v68 = v68 + (double)(unint64_t)([v74 length] + v72);
      }
      uint64_t v66 = [v64 countByEnumeratingWithState:&v96 objects:v124 count:16];
    }
    while (v66);
  }
  else
  {
    double v68 = 0.0;
  }

  v75 = [(IPFeatureScanner *)v88 bodyMessageUnits];
  uint64_t v76 = [v75 firstObject];
  uint64_t v77 = [v76 bestLanguageID];

  uint64_t v78 = +[xF objectForKeyedSubscript:v77];

  if (v78)
  {
    v79 = +[xF objectForKeyedSubscript:v77];
    [v79 doubleValue];
    double v68 = v68 * v80;

    v81 = v86;
    id v82 = v92;
  }
  else
  {
    v83 = _IPLogHandle;
    v81 = v86;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v83 = _IPLogHandle;
    }
    id v82 = v92;
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_225684000, v83, OS_LOG_TYPE_INFO, "No average sentence length information found for this locale #FeatureManager", buf, 2u);
    }
  }
  unint64_t v84 = [NSNumber numberWithDouble:v68];
  [v87 setObject:v84 forKeyedSubscript:@"IPFeatureTextMessageScannerConfidenceNormTextLength"];

  return v87;
}

- (NSArray)contextMessageUnits
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setContextMessageUnits:(id)a3
{
}

- (NSMutableArray)detectedEventsInContext
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDetectedEventsInContext:(id)a3
{
}

- (BOOL)followProposal
{
  return self->_followProposal;
}

- (void)setFollowProposal:(BOOL)a3
{
  self->_followProposal = a3;
}

- (NSMutableArray)dataFeaturesExtractedInContextAndMain
{
  return self->_dataFeaturesExtractedInContextAndMain;
}

- (void)setDataFeaturesExtractedInContextAndMain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataFeaturesExtractedInContextAndMain, 0);
  objc_storeStrong((id *)&self->_detectedEventsInContext, 0);
  objc_storeStrong((id *)&self->_contextMessageUnits, 0);
}

@end