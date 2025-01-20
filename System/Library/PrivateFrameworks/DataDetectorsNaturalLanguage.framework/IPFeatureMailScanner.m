@interface IPFeatureMailScanner
- (BOOL)isBannedSender:(id)a3;
- (BOOL)subjectContainsDate;
- (IPFeatureData)dateInSubjectFeatureData;
- (NSArray)subjectDataDetectorsFeatures;
- (NSArray)subjectSentenceFeatures;
- (NSMutableArray)subjectAndBodyDataDetectorsFeatures;
- (NSMutableArray)subjectKeywordFeatures;
- (double)confidenceForEvent:(id)a3 baseConfidence:(double)a4;
- (id)emailParticipantNames;
- (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4;
- (void)doSynchronousScanWithCompletionHandler:(id)a3;
- (void)enrichEvents:(id)a3 messageUnits:(id)a4 dateInSubject:(id)a5 dataFeatures:(id)a6;
- (void)processScanOfMessageUnit:(id)a3;
- (void)resetScanState;
- (void)scanEventsInMessageUnits:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5;
- (void)setDateInSubjectFeatureData:(id)a3;
- (void)setSubjectAndBodyDataDetectorsFeatures:(id)a3;
- (void)setSubjectContainsDate:(BOOL)a3;
- (void)setSubjectDataDetectorsFeatures:(id)a3;
- (void)setSubjectKeywordFeatures:(id)a3;
- (void)setSubjectSentenceFeatures:(id)a3;
@end

@implementation IPFeatureMailScanner

- (void)resetScanState
{
  [(IPFeatureMailScanner *)self setSubjectContainsDate:0];
  uint64_t v3 = MEMORY[0x263EFFA68];
  [(IPFeatureMailScanner *)self setSubjectDataDetectorsFeatures:MEMORY[0x263EFFA68]];
  [(IPFeatureMailScanner *)self setDateInSubjectFeatureData:0];
  [(IPFeatureMailScanner *)self setSubjectSentenceFeatures:v3];
  v4 = objc_opt_new();
  [(IPFeatureMailScanner *)self setSubjectKeywordFeatures:v4];

  v5 = objc_opt_new();
  [(IPFeatureMailScanner *)self setSubjectAndBodyDataDetectorsFeatures:v5];

  v6.receiver = self;
  v6.super_class = (Class)IPFeatureMailScanner;
  [(IPFeatureScanner *)&v6 resetScanState];
}

- (void)setSubjectContainsDate:(BOOL)a3
{
  self->_subjectContainsDate = a3;
}

- (void)scanEventsInMessageUnits:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  [(IPFeatureMailScanner *)v10 resetScanState];
  objc_sync_exit(v10);

  [(IPFeatureScanner *)v10 setBodyMessageUnits:v8];
  if (IPDebuggingModeEnabled_once != -1) {
    dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
  }
  if (IPDebuggingModeEnabled_sEnabled)
  {
    v11 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v11 = _IPLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_225684000, v11, OS_LOG_TYPE_INFO, "Start with message units: %@ #FeatureManager", (uint8_t *)&buf, 0xCu);
    }
  }
  if ([v8 count])
  {
    if ([(id)objc_opt_class() isNaturalLanguageEventDetectionEnabled])
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v21 = 0x3032000000;
      v22 = __Block_byref_object_copy_;
      v23 = __Block_byref_object_dispose_;
      v12 = [v8 firstObject];
      id v24 = [v12 originalMessage];

      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __81__IPFeatureMailScanner_scanEventsInMessageUnits_synchronously_completionHandler___block_invoke;
      v17[3] = &unk_264722CF0;
      v17[4] = v10;
      id v18 = v9;
      p_long long buf = &buf;
      uint64_t v13 = MEMORY[0x22A632750](v17);
      v14 = (void *)v13;
      if (v6)
      {
        (*(void (**)(uint64_t))(v13 + 16))(v13);
      }
      else
      {
        v16 = dispatch_get_global_queue(17, 0);
        dispatch_async(v16, v14);
      }
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      [(IPFeatureScanner *)v10 setResultType:-1];
      (*((void (**)(id, void, int64_t))v9 + 2))(v9, 0, [(IPFeatureScanner *)v10 resultType]);
    }
  }
  else
  {
    [(IPFeatureScanner *)v10 setResultType:0];
    uint64_t v15 = [(IPFeatureScanner *)v10 resultType];
    (*((void (**)(id, void, uint64_t))v9 + 2))(v9, MEMORY[0x263EFFA68], v15);
  }
}

- (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4
{
  v74[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = [v5 originalMessage];
  uint64_t v7 = [v6 subject];

  id v8 = [(id)objc_opt_class() dataDetectorsFeatureExtractor];
  v74[0] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:1];
  v10 = [(IPFeatureScanner *)self featuresForTextString:v7 inMessageUnit:v5 extractors:v9 context:0];
  [(IPFeatureMailScanner *)self setSubjectDataDetectorsFeatures:v10];

  v72 = @"IPFeatureExtractorContextDataDetectorsFeatures";
  v11 = [(IPFeatureMailScanner *)self subjectDataDetectorsFeatures];
  v73 = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];

  uint64_t v13 = [(id)objc_opt_class() sentenceFeatureExtractor];
  v71 = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v71 count:1];
  v54 = (void *)v7;
  v52 = (void *)v12;
  v53 = [(IPFeatureScanner *)self featuresForTextString:v7 inMessageUnit:v5 extractors:v14 context:v12];

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v15 = [(IPFeatureMailScanner *)self subjectDataDetectorsFeatures];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v59 objects:v70 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v60;
    uint64_t v19 = MEMORY[0x263EFFA88];
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v60 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = [*(id *)(*((void *)&v59 + 1) + 8 * i) contextDictionary];
        [v21 setObject:v19 forKeyedSubscript:@"extractedInSubject"];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v59 objects:v70 count:16];
    }
    while (v17);
  }

  v22 = [v5 text];
  v23 = [(id)objc_opt_class() dataDetectorsFeatureExtractor];
  v69 = v23;
  id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v69 count:1];
  uint64_t v25 = [(IPFeatureScanner *)self featuresForTextString:v22 inMessageUnit:v5 extractors:v24 context:0];

  v67[1] = @"IPFeatureExtractorContextDataDetectorsFeatures";
  v68[0] = v53;
  v67[0] = @"IPFeatureExtractorPreviousFeatureSentences";
  v26 = [(IPFeatureScanner *)self _sortedFeaturesByRange:v25];
  v68[1] = v26;
  uint64_t v27 = [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];

  v28 = [v5 text];
  v29 = [(id)objc_opt_class() sentenceFeatureExtractor];
  v66 = v29;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v66 count:1];
  v50 = (void *)v27;
  v31 = [(IPFeatureScanner *)self featuresForTextString:v28 inMessageUnit:v5 extractors:v30 context:v27];

  v48 = v31;
  v32 = (void *)[v31 mutableCopy];
  v33 = v32;
  if (v25) {
    [v32 addObjectsFromArray:v25];
  }
  v49 = v33;
  v51 = (void *)v25;
  v34 = [(id)objc_opt_class() keywordFeatureExtractor];
  v65 = v34;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v65 count:1];
  v36 = [(IPFeatureScanner *)self featuresForTextString:v54 inMessageUnit:v5 extractors:v35 context:0];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v37 = v36;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v56;
    uint64_t v41 = MEMORY[0x263EFFA88];
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v56 != v40) {
          objc_enumerationMutation(v37);
        }
        v43 = [*(id *)(*((void *)&v55 + 1) + 8 * j) contextDictionary];
        [v43 setObject:v41 forKeyedSubscript:@"IPFeatureKeywordContextExtractedFromSubject"];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v39);
  }

  v44 = [v5 lowercaseTextTruncated];
  v63 = v34;
  v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v63 count:1];
  v46 = [(IPFeatureScanner *)self featuresForTextString:v44 inMessageUnit:v5 extractors:v45 context:0];

  if (v37) {
    [v49 addObjectsFromArray:v37];
  }
  if (v46) {
    [v49 addObjectsFromArray:v46];
  }

  return v49;
}

void __81__IPFeatureMailScanner_scanEventsInMessageUnits_synchronously_completionHandler___block_invoke(uint64_t a1)
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
  v175[1] = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void, int64_t))a3;
  id v5 = [(id)objc_opt_class() dataDetectorsFeatureExtractor];
  v175[0] = v5;
  BOOL v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v175 count:1];

  uint64_t v7 = [(IPFeatureScanner *)self bodyMessageUnits];
  id v8 = [v7 firstObject];

  id v9 = [v8 originalMessage];
  v10 = [v9 subject];

  v11 = [v8 originalMessage];
  uint64_t v12 = [v11 sender];

  uint64_t v13 = [v8 originalMessage];
  v14 = [v13 dateSent];

  uint64_t v15 = [(IPFeatureScanner *)self subjectEventVocabularyRejectionKeyword:v10];
  v147 = self;
  if (!v15)
  {
    if ([(IPFeatureMailScanner *)self isBannedSender:v12])
    {
      [(IPFeatureScanner *)self setResultType:-40];
      uint64_t v18 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        uint64_t v18 = _IPLogHandle;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_225684000, v18, OS_LOG_TYPE_INFO, "Skipping message unit because sender is banned #FeatureManager", buf, 2u);
      }
      if (IPDebuggingModeEnabled_once != -1) {
        dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
      }
      if (IPDebuggingModeEnabled_sEnabled)
      {
        uint64_t v19 = _IPLogHandle;
        if (!_IPLogHandle)
        {
          IPInitLogging();
          uint64_t v19 = _IPLogHandle;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = v19;
          uint64_t v21 = [v12 email];
          *(_DWORD *)long long buf = 138412290;
          uint64_t v174 = (uint64_t)v21;
          _os_log_impl(&dword_225684000, v20, OS_LOG_TYPE_INFO, "Banned sender: %@ #FeatureManager", buf, 0xCu);

          uint64_t v15 = 0;
        }
      }
      goto LABEL_25;
    }
    v145 = v4;
    [(IPFeatureMailScanner *)self setSubjectDataDetectorsFeatures:MEMORY[0x263EFFA68]];
    v139 = [(IPFeatureScanner *)self subjectEventVocabularyIgnoreDateKeyword:v10];
    if (!v139)
    {
      v23 = [(IPFeatureScanner *)self featuresForTextString:v10 inMessageUnit:v8 extractors:v6 context:0];
      [(IPFeatureMailScanner *)self setSubjectDataDetectorsFeatures:v23];
    }
    v144 = v6;
    [(IPFeatureMailScanner *)self setDateInSubjectFeatureData:0];
    long long v166 = 0u;
    long long v167 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    id v24 = [(IPFeatureMailScanner *)self subjectDataDetectorsFeatures];
    uint64_t v25 = [v24 reverseObjectEnumerator];

    uint64_t v26 = [v25 countByEnumeratingWithState:&v164 objects:v172 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v165;
      while (2)
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v165 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v164 + 1) + 8 * i);
          if (![v30 type] || objc_msgSend(v30, "type") == 1)
          {
            [(IPFeatureMailScanner *)v147 setDateInSubjectFeatureData:v30];
            [(IPFeatureMailScanner *)v147 setSubjectContainsDate:1];
            goto LABEL_40;
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v164 objects:v172 count:16];
        if (v27) {
          continue;
        }
        break;
      }
    }
LABEL_40:

    long long v162 = 0u;
    long long v163 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    v31 = [(IPFeatureScanner *)v147 bodyMessageUnits];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v160 objects:v171 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v161;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v161 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void *)(*((void *)&v160 + 1) + 8 * j);
          id v37 = (void *)MEMORY[0x22A632550]();
          [(IPFeatureMailScanner *)v147 processScanOfMessageUnit:v36];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v160 objects:v171 count:16];
      }
      while (v33);
    }

    uint64_t v38 = (void *)_IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      uint64_t v38 = (void *)_IPLogHandle;
    }
    uint64_t v39 = v38;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      uint64_t v40 = [(IPFeatureScanner *)v147 detectedEvents];
      uint64_t v41 = [v40 count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v174 = v41;
      _os_log_impl(&dword_225684000, v39, OS_LOG_TYPE_INFO, "%lu detected events #FeatureManager", buf, 0xCu);
    }
    if (IPDebuggingModeEnabled_once != -1) {
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
    }
    if (IPDebuggingModeEnabled_sEnabled)
    {
      v42 = (void *)_IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v42 = (void *)_IPLogHandle;
      }
      v43 = v42;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = [(IPFeatureScanner *)v147 detectedEvents];
        id v45 = [v44 valueForKey:@"ipsos_betterDescription"];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v174 = (uint64_t)v45;
        _os_log_impl(&dword_225684000, v43, OS_LOG_TYPE_INFO, "Detected Events: %@ #FeatureManager", buf, 0xCu);
      }
    }
    v46 = v147;
    v47 = [(IPFeatureScanner *)v147 detectedEvents];
    unint64_t v48 = [v47 count];

    if (v48 >= 0xA)
    {
      v49 = (void *)_IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v49 = (void *)_IPLogHandle;
      }
      v50 = v49;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        v51 = [(IPFeatureScanner *)v147 detectedEvents];
        uint64_t v52 = [v51 count];
        *(_DWORD *)long long buf = 134217984;
        uint64_t v174 = v52;
        _os_log_impl(&dword_225684000, v50, OS_LOG_TYPE_INFO, "Too many UNSTITCHED dates. (%lu)  Skipping. #FeatureManager", buf, 0xCu);
      }
      v46 = v147;
      [(IPFeatureScanner *)v147 setResultType:-12];
      v53 = [(IPFeatureScanner *)v147 detectedEvents];
      [v53 removeAllObjects];
    }
    v54 = [(IPFeatureScanner *)v46 detectedEvents];
    long long v55 = [(IPFeatureScanner *)v46 stitchedEventsFromEvents:v54];
    [(IPFeatureScanner *)v46 setStitchedEvents:v55];

    if (IPDebuggingModeEnabled_once != -1) {
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
    }
    if (IPDebuggingModeEnabled_sEnabled)
    {
      long long v56 = (void *)_IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        long long v56 = (void *)_IPLogHandle;
      }
      long long v57 = v56;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        long long v58 = [(IPFeatureScanner *)v147 stitchedEvents];
        id v59 = [v58 valueForKey:@"ipsos_betterDescription"];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v174 = (uint64_t)v59;
        _os_log_impl(&dword_225684000, v57, OS_LOG_TYPE_INFO, "Stitched Events: %@ #FeatureManager", buf, 0xCu);
      }
    }
    long long v60 = v147;
    long long v61 = [(IPFeatureScanner *)v147 stitchedEvents];
    unint64_t v62 = [v61 count];

    if (v62 >= 3)
    {
      v63 = (void *)_IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v63 = (void *)_IPLogHandle;
      }
      v64 = v63;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        v65 = [(IPFeatureScanner *)v147 stitchedEvents];
        uint64_t v66 = [v65 count];
        *(_DWORD *)long long buf = 134217984;
        uint64_t v174 = v66;
        _os_log_impl(&dword_225684000, v64, OS_LOG_TYPE_INFO, "Too many STITCHED dates. (%lu)  Skipping. #FeatureManager", buf, 0xCu);
      }
      long long v60 = v147;
      [(IPFeatureScanner *)v147 setResultType:-12];
      [(IPFeatureScanner *)v147 setStitchedEvents:MEMORY[0x263EFFA68]];
    }
    if ([(IPFeatureMailScanner *)v60 subjectContainsDate])
    {
      v67 = [(IPFeatureMailScanner *)v60 dateInSubjectFeatureData];
      id v68 = [v67 value];
    }
    else
    {
      id v68 = 0;
    }
    v69 = [(IPFeatureScanner *)v60 stitchedEvents];
    v70 = [(IPFeatureScanner *)v60 bodyMessageUnits];
    v71 = [(IPFeatureScanner *)v60 bodyDataDetectorsFeatures];
    [(IPFeatureMailScanner *)v60 enrichEvents:v69 messageUnits:v70 dateInSubject:v68 dataFeatures:v71];

    if (IPDebuggingModeEnabled_once != -1) {
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
    }
    if (IPDebuggingModeEnabled_sEnabled)
    {
      v72 = (void *)_IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v72 = (void *)_IPLogHandle;
      }
      v73 = v72;
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        v74 = [(IPFeatureScanner *)v147 stitchedEvents];
        id v75 = [v74 valueForKey:@"ipsos_betterDescription"];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v174 = (uint64_t)v75;
        _os_log_impl(&dword_225684000, v73, OS_LOG_TYPE_INFO, "Enriched Events based on Event Type: %@ #FeatureManager", buf, 0xCu);
      }
    }
    v138 = v68;
    v140 = v14;
    v141 = v12;
    v142 = v10;
    v143 = v8;
    long long v158 = 0u;
    long long v159 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    v76 = v147;
    v77 = [(IPFeatureScanner *)v147 stitchedEvents];
    uint64_t v78 = [v77 countByEnumeratingWithState:&v156 objects:v170 count:16];
    if (v78)
    {
      uint64_t v79 = v78;
      v80 = 0;
      uint64_t v81 = *(void *)v157;
      char v82 = 1;
      v146 = v77;
      do
      {
        for (uint64_t k = 0; k != v79; ++k)
        {
          if (*(void *)v157 != v81) {
            objc_enumerationMutation(v77);
          }
          v84 = *(void **)(*((void *)&v156 + 1) + 8 * k);
          v85 = [v84 location];

          if (!v85)
          {
            if (v82)
            {
              long long v154 = 0u;
              long long v155 = 0u;
              long long v152 = 0u;
              long long v153 = 0u;
              v86 = [(IPFeatureMailScanner *)v76 subjectDataDetectorsFeatures];
              v87 = [v86 reverseObjectEnumerator];

              uint64_t v88 = [v87 countByEnumeratingWithState:&v152 objects:v169 count:16];
              if (v88)
              {
                uint64_t v89 = v88;
                uint64_t v90 = *(void *)v153;
                while (2)
                {
                  for (uint64_t m = 0; m != v89; ++m)
                  {
                    if (*(void *)v153 != v90) {
                      objc_enumerationMutation(v87);
                    }
                    v92 = *(void **)(*((void *)&v152 + 1) + 8 * m);
                    if ([v92 type] == 3
                      || [v92 type] == 7
                      || [v92 type] == 12
                      || [v92 type] == 13)
                    {
                      v76 = v147;
                      uint64_t v93 = [(IPFeatureScanner *)v147 cleanedStringForFeatureData:v92];

                      v80 = (void *)v93;
                      goto LABEL_110;
                    }
                  }
                  uint64_t v89 = [v87 countByEnumeratingWithState:&v152 objects:v169 count:16];
                  if (v89) {
                    continue;
                  }
                  break;
                }
                v76 = v147;
LABEL_110:
                v77 = v146;
              }
            }
            [v84 setLocation:v80];
            char v82 = 0;
          }
        }
        uint64_t v79 = [v77 countByEnumeratingWithState:&v156 objects:v170 count:16];
      }
      while (v79);
    }
    else
    {
      v80 = 0;
    }
    v94 = v80;

    v95 = [(IPFeatureScanner *)v76 stitchedEvents];
    [(IPFeatureScanner *)v76 adjustTimeForEvents:v95];

    v96 = [(IPFeatureScanner *)v76 stitchedEvents];
    [(IPFeatureScanner *)v76 confidenceForEvents:v96];

    v97 = [(IPFeatureScanner *)v76 stitchedEvents];
    v14 = v140;
    v98 = [(IPFeatureScanner *)v76 filteredEventsForDetectedEvents:v97 referenceDate:v140];
    [(IPFeatureScanner *)v76 setFilteredDetectedEvents:v98];

    v99 = (void *)_IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v99 = (void *)_IPLogHandle;
    }
    v100 = v99;
    v10 = v142;
    id v8 = v143;
    uint64_t v12 = v141;
    if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
    {
      v101 = [(IPFeatureScanner *)v147 filteredDetectedEvents];
      uint64_t v102 = [v101 count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v174 = v102;
      _os_log_impl(&dword_225684000, v100, OS_LOG_TYPE_INFO, "%lu detected events after filtering #FeatureManager", buf, 0xCu);
    }
    if (IPDebuggingModeEnabled_once != -1) {
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
    }
    if (IPDebuggingModeEnabled_sEnabled)
    {
      v103 = (void *)_IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v103 = (void *)_IPLogHandle;
      }
      v104 = v103;
      if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
      {
        v105 = [(IPFeatureScanner *)v147 filteredDetectedEvents];
        id v106 = [v105 valueForKey:@"ipsos_betterDescription"];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v174 = (uint64_t)v106;
        _os_log_impl(&dword_225684000, v104, OS_LOG_TYPE_INFO, "Filtered Events: %@ #FeatureManager", buf, 0xCu);
      }
    }
    v107 = v147;
    v108 = [(IPFeatureScanner *)v147 filteredDetectedEvents];
    [(IPFeatureScanner *)v147 normalizedEvents:v108];

    v109 = [(IPFeatureScanner *)v147 extractedNotesStrings];
    v110 = [(IPFeatureMailScanner *)v147 subjectDataDetectorsFeatures];
    v111 = [(IPFeatureScanner *)v147 notesStringsFromDataFeatures:v110];
    [v109 addObjectsFromArray:v111];

    v112 = [(IPFeatureScanner *)v147 extractedNotesStrings];
    uint64_t v113 = [v112 count];

    if (v113)
    {
      v114 = [(IPFeatureScanner *)v147 extractedNotesStrings];
      v115 = [v114 allObjects];
      v116 = objc_msgSend(v115, "_pas_componentsJoinedByString:", @"\n");

      long long v150 = 0u;
      long long v151 = 0u;
      long long v148 = 0u;
      long long v149 = 0u;
      v117 = [(IPFeatureScanner *)v147 filteredDetectedEvents];
      uint64_t v118 = [v117 countByEnumeratingWithState:&v148 objects:v168 count:16];
      if (v118)
      {
        uint64_t v119 = v118;
        uint64_t v120 = *(void *)v149;
        do
        {
          for (uint64_t n = 0; n != v119; ++n)
          {
            if (*(void *)v149 != v120) {
              objc_enumerationMutation(v117);
            }
            [*(id *)(*((void *)&v148 + 1) + 8 * n) setNotes:v116];
          }
          uint64_t v119 = [v117 countByEnumeratingWithState:&v148 objects:v168 count:16];
        }
        while (v119);
      }

      v107 = v147;
    }
    v122 = [(IPFeatureScanner *)v107 filteredDetectedEvents];
    uint64_t v123 = [v122 count];

    if (v123 == 1)
    {
      [(IPFeatureScanner *)v107 setResultType:1];
      v124 = [(IPFeatureScanner *)v107 filteredDetectedEvents];
      v4 = v145;
      ((void (**)(id, void *, int64_t))v145)[2](v145, v124, [(IPFeatureScanner *)v107 resultType]);

      BOOL v6 = v144;
LABEL_154:
      uint64_t v15 = 0;
      goto LABEL_155;
    }
    v125 = [(IPFeatureScanner *)v107 filteredDetectedEvents];
    unint64_t v126 = [v125 count];

    BOOL v6 = v144;
    v4 = v145;
    if (v126 < 3)
    {
      v132 = [(IPFeatureScanner *)v107 filteredDetectedEvents];
      unint64_t v133 = [v132 count];

      if (v133 < 2)
      {
        uint64_t v137 = [(IPFeatureScanner *)v107 resultType];
        v145[2](v145, MEMORY[0x263EFFA68], v137);
        goto LABEL_154;
      }
      v134 = (void *)_IPLogHandle;
      uint64_t v15 = 0;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v134 = (void *)_IPLogHandle;
      }
      v135 = v134;
      if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_225684000, v135, OS_LOG_TYPE_INFO, "Bailing out because more than 1 EVENT are detected #FeatureManager", buf, 2u);
      }

      v129 = v147;
      v130 = v147;
      uint64_t v131 = -68;
    }
    else
    {
      v127 = (void *)_IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v127 = (void *)_IPLogHandle;
      }
      v128 = v127;
      uint64_t v15 = 0;
      if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_225684000, v128, OS_LOG_TYPE_INFO, "Bailing out because more than 3 EVENTS are detected #FeatureManager", buf, 2u);
      }

      v129 = v147;
      v130 = v147;
      uint64_t v131 = 2;
    }
    [(IPFeatureScanner *)v130 setResultType:v131];
    uint64_t v136 = [(IPFeatureScanner *)v129 resultType];
    v145[2](v145, MEMORY[0x263EFFA68], v136);
LABEL_155:

    goto LABEL_26;
  }
  [(IPFeatureScanner *)self setResultType:-50];
  uint64_t v16 = _IPLogHandle;
  if (!_IPLogHandle)
  {
    IPInitLogging();
    uint64_t v16 = _IPLogHandle;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_225684000, v16, OS_LOG_TYPE_INFO, "Found REJECTION keyword in SUBJECT #FeatureManager", buf, 2u);
  }
  if (IPDebuggingModeEnabled_once != -1) {
    dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
  }
  if (IPDebuggingModeEnabled_sEnabled)
  {
    uint64_t v17 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      uint64_t v17 = _IPLogHandle;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v174 = (uint64_t)v15;
      _os_log_impl(&dword_225684000, v17, OS_LOG_TYPE_INFO, "Subject rejection keyword: %@ #FeatureManager", buf, 0xCu);
    }
  }
LABEL_25:
  int64_t v22 = [(IPFeatureScanner *)self resultType];
  v4[2](v4, MEMORY[0x263EFFA68], v22);
LABEL_26:
}

- (void)processScanOfMessageUnit:(id)a3
{
  v131[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() dataDetectorsFeatureExtractor];
  v131[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v131 count:1];

  uint64_t v7 = [v4 originalMessage];
  uint64_t v8 = [v7 lowercaseSubject];

  id v9 = [v4 originalMessage];
  v10 = [v9 dateSent];

  if ([(IPFeatureScanner *)self shouldReplaceSendDateWithCurrentDate])
  {
    uint64_t v11 = [MEMORY[0x263EFF910] date];

    v10 = (void *)v11;
  }
  uint64_t v12 = [(IPFeatureMailScanner *)self dateInSubjectFeatureData];

  if (v12)
  {
    v129 = @"IPFeatureExtractorDetectedDateInSubjectFeatureData";
    uint64_t v13 = [(IPFeatureMailScanner *)self dateInSubjectFeatureData];
    v130 = v13;
    v14 = [NSDictionary dictionaryWithObjects:&v130 forKeys:&v129 count:1];
  }
  else
  {
    v14 = 0;
  }
  uint64_t v15 = [v4 text];
  uint64_t v16 = [(IPFeatureScanner *)self featuresForTextString:v15 inMessageUnit:v4 extractors:v6 context:v14];

  if (-[IPFeatureScanner countOfFeaturesContainDateInTheFuture:messageUnitSentDate:](self, "countOfFeaturesContainDateInTheFuture:messageUnitSentDate:", v16, v10)|| (-[IPFeatureMailScanner subjectDataDetectorsFeatures](self, "subjectDataDetectorsFeatures"), uint64_t v18 = objc_claimAutoreleasedReturnValue(), v19 = [v18 count], v18, !v19))
  {
    uint64_t v17 = (void *)[v16 copy];
  }
  else
  {
    v20 = [(IPFeatureMailScanner *)self subjectDataDetectorsFeatures];
    uint64_t v17 = (void *)[v20 mutableCopy];

    [v17 addObjectsFromArray:v16];
  }
  v100 = (void *)v6;
  v101 = (void *)v8;
  if (IPDebuggingModeEnabled_once != -1) {
    dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
  }
  if (IPDebuggingModeEnabled_sEnabled)
  {
    uint64_t v21 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      uint64_t v21 = _IPLogHandle;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      unint64_t v128 = (unint64_t)v17;
      _os_log_impl(&dword_225684000, v21, OS_LOG_TYPE_INFO, "Data Detectors Features:\n%@ #FeatureManager", buf, 0xCu);
    }
  }
  unint64_t v22 = [(IPFeatureScanner *)self countOfFeaturesContainDateInTheFuture:v17 messageUnitSentDate:v10];
  if (v22)
  {
    unint64_t v23 = v22;
    if (v22 >= 0xA)
    {
      id v24 = v17;
      uint64_t v25 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        uint64_t v25 = _IPLogHandle;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134217984;
        unint64_t v128 = v23;
        _os_log_impl(&dword_225684000, v25, OS_LOG_TYPE_INFO, "Too many DETECTED dates in the future detected. (%lu)  Skipping. #FeatureManager", buf, 0xCu);
      }
      [(IPFeatureScanner *)self setResultType:-12];
      uint64_t v17 = v24;
      uint64_t v26 = (void *)v8;
      goto LABEL_93;
    }
    v29 = [MEMORY[0x263EFF910] dateWithTimeInterval:v10 sinceDate:-10800.0];
    if ([(IPFeatureScanner *)self dataFeatures:v17 containDateOlderThan:v29 preciseTimeOnly:1])
    {
      v30 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v30 = _IPLogHandle;
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_225684000, v30, OS_LOG_TYPE_INFO, "Contains a date in the past with precise time. Skipping. #FeatureManager", buf, 2u);
      }
      [(IPFeatureScanner *)self setResultType:-110];
    }
    else
    {
      uint64_t v31 = [MEMORY[0x263EFF910] dateWithTimeInterval:v10 sinceDate:-31536000.0];

      v99 = (void *)v31;
      if (![(IPFeatureScanner *)self dataFeatures:v17 containDateOlderThan:v31 preciseTimeOnly:0])
      {
        v96 = v17;
        v97 = v16;
        v94 = v14;
        v125 = @"IPFeatureExtractorContextDataDetectorsFeatures";
        uint64_t v33 = [(IPFeatureMailScanner *)self subjectDataDetectorsFeatures];
        unint64_t v126 = v33;
        uint64_t v34 = [NSDictionary dictionaryWithObjects:&v126 forKeys:&v125 count:1];

        v35 = [(IPFeatureScanner *)self bodyMessageUnits];
        uint64_t v36 = [v35 firstObject];
        id v37 = [(id)objc_opt_class() sentenceFeatureExtractor];
        v124 = v37;
        uint64_t v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v124 count:1];
        uint64_t v93 = (void *)v34;
        v98 = [(IPFeatureScanner *)self featuresForTextString:v8 inMessageUnit:v36 extractors:v38 context:v34];

        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        uint64_t v39 = [(IPFeatureMailScanner *)self subjectDataDetectorsFeatures];
        uint64_t v40 = [v39 countByEnumeratingWithState:&v110 objects:v123 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v111;
          uint64_t v43 = MEMORY[0x263EFFA88];
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v111 != v42) {
                objc_enumerationMutation(v39);
              }
              id v45 = [*(id *)(*((void *)&v110 + 1) + 8 * i) contextDictionary];
              [v45 setObject:v43 forKeyedSubscript:@"extractedInSubject"];
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v110 objects:v123 count:16];
          }
          while (v41);
        }

        uint64_t v16 = v97;
        v122[0] = v98;
        v121[0] = @"IPFeatureExtractorPreviousFeatureSentences";
        v121[1] = @"IPFeatureExtractorContextDataDetectorsFeatures";
        v46 = [(IPFeatureScanner *)self _sortedFeaturesByRange:v97];
        v122[1] = v46;
        uint64_t v47 = [NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:2];

        unint64_t v48 = [v4 text];
        v49 = [(id)objc_opt_class() sentenceFeatureExtractor];
        uint64_t v120 = v49;
        v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v120 count:1];
        v92 = (void *)v47;
        v51 = [(IPFeatureScanner *)self featuresForTextString:v48 inMessageUnit:v4 extractors:v50 context:v47];

        v95 = v51;
        if ([v51 count])
        {
          uint64_t v52 = MEMORY[0x263EFFA88];
          v91 = [(id)objc_opt_class() keywordFeatureExtractor];
          uint64_t v119 = v91;
          v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v119 count:1];
          v117 = @"IPFeatureExtractorContextSubject";
          uint64_t v118 = v52;
          v54 = [NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1];
          long long v55 = [(IPFeatureScanner *)self featuresForTextString:v101 inMessageUnit:v4 extractors:v53 context:v54];

          long long v108 = 0u;
          long long v109 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          id v56 = v55;
          uint64_t v57 = [v56 countByEnumeratingWithState:&v106 objects:v116 count:16];
          if (v57)
          {
            uint64_t v58 = v57;
            uint64_t v59 = *(void *)v107;
            uint64_t v60 = MEMORY[0x263EFFA88];
            do
            {
              for (uint64_t j = 0; j != v58; ++j)
              {
                if (*(void *)v107 != v59) {
                  objc_enumerationMutation(v56);
                }
                unint64_t v62 = [*(id *)(*((void *)&v106 + 1) + 8 * j) contextDictionary];
                [v62 setObject:v60 forKeyedSubscript:@"IPFeatureKeywordContextExtractedFromSubject"];
              }
              uint64_t v58 = [v56 countByEnumeratingWithState:&v106 objects:v116 count:16];
            }
            while (v58);
          }

          v63 = [v4 lowercaseTextTruncated];
          v115 = v91;
          v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v115 count:1];
          uint64_t v65 = [(IPFeatureScanner *)self featuresForTextString:v63 inMessageUnit:v4 extractors:v64 context:0];

          uint64_t v66 = (void *)[v95 mutableCopy];
          if (v96)
          {
            v67 = [(IPFeatureScanner *)self _sortedFeaturesByRange:v96];
            [v66 addObjectsFromArray:v67];
          }
          v14 = v94;
          if (v56) {
            [v66 addObjectsFromArray:v56];
          }
          if (v65) {
            [v66 addObjectsFromArray:v65];
          }
          uint64_t v90 = v66;
          [v4 setFeatures:v66];
          if (v96)
          {
            id v68 = [(IPFeatureScanner *)self bodyDataDetectorsFeatures];
            [v68 addObjectsFromArray:v96];
          }
          if (v56)
          {
            v69 = [(IPFeatureMailScanner *)self subjectKeywordFeatures];
            [v69 addObjectsFromArray:v56];
          }
          if (v65)
          {
            v70 = [(IPFeatureScanner *)self bodyKeywordFeatures];
            [v70 addObjectsFromArray:v65];
          }
          [(IPFeatureScanner *)self augmentDetectedDatesWithEndDates:v96];
          uint64_t v71 = [(IPFeatureScanner *)self _sortedFeaturesByRange:v66];
          v72 = [(IPFeatureScanner *)self bodyAllFeatures];
          [v72 addObjectsFromArray:v71];

          if (IPDebuggingModeEnabled_once != -1) {
            dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
          }
          if (IPDebuggingModeEnabled_sEnabled)
          {
            v73 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              v73 = _IPLogHandle;
            }
            if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              unint64_t v128 = v71;
              _os_log_impl(&dword_225684000, v73, OS_LOG_TYPE_INFO, "Feature detection result:\n--> Unit Features:\n%@ #FeatureManager", buf, 0xCu);
            }
          }
          uint64_t v89 = (void *)v65;
          v74 = -[IPFeatureScanner analyzeFeatures:messageUnit:](self, "analyzeFeatures:messageUnit:", v71, v4, v71);
          [(IPFeatureScanner *)self setDetectedEvents:v74];

          long long v104 = 0u;
          long long v105 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          id v75 = [(IPFeatureScanner *)self detectedEvents];
          uint64_t v76 = [v75 countByEnumeratingWithState:&v102 objects:v114 count:16];
          if (v76)
          {
            uint64_t v77 = v76;
            uint64_t v78 = *(void *)v103;
            do
            {
              for (uint64_t k = 0; k != v77; ++k)
              {
                if (*(void *)v103 != v78) {
                  objc_enumerationMutation(v75);
                }
                objc_msgSend(*(id *)(*((void *)&v102 + 1) + 8 * k), "setIpsos_eventAttributes:", objc_msgSend(*(id *)(*((void *)&v102 + 1) + 8 * k), "ipsos_eventAttributes") | 2);
              }
              uint64_t v77 = [v75 countByEnumeratingWithState:&v102 objects:v114 count:16];
            }
            while (v77);
          }

          v80 = [(IPFeatureScanner *)self extractedNotesStrings];
          uint64_t v81 = [v80 count];

          if (!v81)
          {
            char v82 = [(IPFeatureScanner *)self extractedNotesStrings];
            v83 = [(IPFeatureMailScanner *)self subjectDataDetectorsFeatures];
            v84 = [(IPFeatureScanner *)self notesStringsFromDataFeatures:v83];
            [v82 addObjectsFromArray:v84];
          }
          uint64_t v26 = v101;
          uint64_t v16 = v97;
        }
        else
        {
          v85 = _IPLogHandle;
          uint64_t v26 = v101;
          v14 = v94;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v85 = _IPLogHandle;
          }
          if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
            v86 = v85;
            v87 = [v4 bestLanguageID];
            *(_DWORD *)long long buf = 138412290;
            unint64_t v128 = (unint64_t)v87;
            _os_log_impl(&dword_225684000, v86, OS_LOG_TYPE_INFO, "No sentence polarity extracted. No sentence or no LSTM assets available for language identifier %@ #FeatureManager", buf, 0xCu);
          }
          [(IPFeatureScanner *)self setResultType:-13];
        }
        uint64_t v17 = v96;

        v29 = v99;
        goto LABEL_92;
      }
      uint64_t v32 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        uint64_t v32 = _IPLogHandle;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_225684000, v32, OS_LOG_TYPE_INFO, "Contains a date in the far past. Skipping. #FeatureManager", buf, 2u);
      }
      [(IPFeatureScanner *)self setResultType:-11];
      v29 = v99;
    }
    uint64_t v26 = (void *)v8;
LABEL_92:

LABEL_93:
    uint64_t v28 = v100;
    goto LABEL_94;
  }
  uint64_t v27 = _IPLogHandle;
  if (!_IPLogHandle)
  {
    IPInitLogging();
    uint64_t v27 = _IPLogHandle;
  }
  uint64_t v28 = (void *)v6;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_225684000, v27, OS_LOG_TYPE_INFO, "No date in the future detected. Skipping. #FeatureManager", buf, 2u);
  }
  [(IPFeatureScanner *)self setResultType:-10];
  uint64_t v26 = v101;
LABEL_94:
}

- (void)enrichEvents:(id)a3 messageUnits:(id)a4 dateInSubject:(id)a5 dataFeatures:(id)a6
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v93 = a4;
  id v88 = a5;
  id v11 = a6;
  if ([v10 count])
  {
    uint64_t v90 = [(IPFeatureScanner *)self movieTitlesFromDataFeatures:v11];
    v84 = [(IPFeatureScanner *)self sportTeamNamesFromDataFeatures:v11];
    v83 = [(IPFeatureScanner *)self artisNamesFromDataFeatures:v11];
    char v82 = [(IPFeatureScanner *)self restaurantAndBarPOINamesFromDataFeatures:v11];
    v94 = self;
    id v80 = v11;
    uint64_t v12 = [(IPFeatureScanner *)self entertainmentPOINamesFromDataFeatures:v11];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v81 = v10;
    obuint64_t j = v10;
    uint64_t v92 = [obj countByEnumeratingWithState:&v100 objects:v104 count:16];
    if (!v92) {
      goto LABEL_88;
    }
    uint64_t v91 = *(void *)v101;
    unint64_t v13 = 0x264722000uLL;
    uint64_t v89 = v12;
    while (1)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v101 != v91) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v100 + 1) + 8 * v14);
        uint64_t v16 = *(void **)(v13 + 2400);
        uint64_t v17 = objc_msgSend(v15, "ipsos_messageUnit");
        uint64_t v18 = objc_msgSend(v15, "ipsos_messageUnit");
        uint64_t v19 = [v18 keywordFeatures];
        v20 = objc_msgSend(v15, "ipsos_dataFeatures");
        uint64_t v21 = [v16 eventClassificationTypeFromMessageUnit:v17 keywordFeatures:v19 datafeatures:v20];
        objc_msgSend(v15, "setIpsos_eventClassificationType:", v21);

        unint64_t v22 = objc_msgSend(v15, "ipsos_eventClassificationType");
        unint64_t v23 = v22;
        if (v22 && ![v22 isFairlyGeneric]) {
          goto LABEL_21;
        }
        id v24 = [v93 firstObject];
        uint64_t v25 = [v24 bestLanguageID];

        if ([v90 count])
        {
          uint64_t v26 = [*(id *)(v13 + 2400) eventTypeForMoviesAndLanguageID:v25];
        }
        else if ([v84 count])
        {
          uint64_t v26 = [*(id *)(v13 + 2400) eventTypeForSportAndLanguageID:v25];
        }
        else if ([v83 count])
        {
          uint64_t v26 = [*(id *)(v13 + 2400) eventTypeForCultureAndLanguageID:v25];
        }
        else if ([v82 count])
        {
          uint64_t v26 = [*(id *)(v13 + 2400) eventTypeForMealsAndLanguageID:v25];
        }
        else
        {
          if (![v12 count]) {
            goto LABEL_20;
          }
          uint64_t v26 = [*(id *)(v13 + 2400) eventTypeForEntertainmentAndLanguageID:v25];
        }
        uint64_t v27 = (void *)v26;

        unint64_t v23 = v27;
LABEL_20:
        objc_msgSend(v15, "setIpsos_eventClassificationType:", v23);

        if (!v23) {
          goto LABEL_74;
        }
LABEL_21:
        uint64_t v95 = v14;
        unsigned int v28 = [v15 isAllDay];
        int v29 = objc_msgSend(v15, "ipsos_allDayPreferred");
        char v30 = objc_msgSend(v15, "ipsos_disableTimeAdjustment");
        uint64_t v31 = objc_msgSend(v15, "ipsos_isTimeApproximate");
        int v32 = objc_msgSend(v15, "ipsos_isEndTimeApproximate");
        uint64_t v33 = [v15 startDate];
        uint64_t v34 = [v15 endDate];
        v35 = v34;
        unsigned int v97 = v28;
        if (v28)
        {
          [v34 timeIntervalSinceDate:v33];
          unsigned int v28 = fabs(v36) > 86400.0;
        }
        else
        {
          uint64_t v37 = [v23 adjustedEventClassificationTypeWithStartDate:v33];

          objc_msgSend(v15, "setIpsos_eventClassificationType:", v37);
          unint64_t v23 = (void *)v37;
        }
        if (([v23 defaultStartingTimeHour] & 0x80000000) != 0)
        {
          id v44 = 0;
          goto LABEL_36;
        }
        int v86 = v29;
        int v38 = v32;
        uint64_t v39 = v35;
        uint64_t v40 = (void *)MEMORY[0x263EFF910];
        int v41 = 3600 * [v23 defaultStartingTimeHour];
        double v42 = (double)(int)(v41 + 60 * [v23 defaultStartingTimeMinutes]);
        uint64_t v43 = [(IPFeatureScanner *)v94 normalizedAllDayDateFromDate:v33];
        id v44 = [v40 dateWithTimeInterval:v43 sinceDate:v42];

        BOOL v45 = 0;
        char v46 = v97;
        if (!v44) {
          char v46 = 1;
        }
        if ((v46 & 1) == 0 && ((v31 ^ 1) & 1) == 0)
        {
          [v44 timeIntervalSinceDate:v33];
          BOOL v45 = fabs(v47) <= 5400.0;
        }
        if (v44) {
          char v48 = v30;
        }
        else {
          char v48 = 1;
        }
        v35 = v39;
        if (v48)
        {
          int v32 = v38;
LABEL_36:
          uint64_t v14 = v95;
          goto LABEL_37;
        }
        int v32 = v38;
        uint64_t v14 = v95;
        if (((v97 ^ 1 | v86 | v28) ^ 1 | v45) == 1)
        {
          id v54 = v44;

          uint64_t v31 = 1;
          objc_msgSend(v15, "setIpsos_usesDefaultClassificationTypeStartTime:", 1);
          id v44 = v54;

          unsigned int v97 = 0;
          uint64_t v33 = v44;
          v35 = v44;
        }
LABEL_37:
        if (v35 == v33) {
          int v49 = 1;
        }
        else {
          int v49 = v32;
        }
        if (v97)
        {
          v96 = v35;
          v50 = v94;
        }
        else
        {
          v50 = v94;
          if (v49)
          {
            [v23 defaultDuration];
            if (v51 <= 0.0)
            {
              if ([(IPFeatureScanner *)v94 isDateAroundNoon:v33])
              {
                long long v55 = v33;
                double v56 = 3600.0;
              }
              else
              {
                long long v55 = v33;
                double v56 = 7200.0;
              }
              uint64_t v53 = [v55 dateByAddingTimeInterval:v56];
            }
            else
            {
              uint64_t v52 = (void *)MEMORY[0x263EFF910];
              [v23 defaultDuration];
              uint64_t v53 = objc_msgSend(v52, "dateWithTimeInterval:sinceDate:", v33);
            }
            uint64_t v57 = (void *)v53;

            v96 = v57;
          }
          else
          {
            v96 = v35;
          }
        }
        unsigned __int8 v99 = 0;
        uint64_t v58 = [v93 objectAtIndexedSubscript:0];
        uint64_t v59 = [v58 originalMessage];

        uint64_t v60 = [(IPFeatureScanner *)v50 bodyMessageUnits];
        long long v61 = [v59 subject];
        unint64_t v62 = [v23 adjustedEventTitleForMessageUnits:v60 subject:v61 dateInSubject:v88 eventStartDate:v33 isGeneratedFromSubject:&v99];

        v63 = [v23 defaultTitle];
        LODWORD(v61) = [v63 isEqualToString:v62];

        char v98 = 0;
        if (v61)
        {
          if ([v23 isSportRelated])
          {
            v64 = v94;
            uint64_t v65 = v62;
            uint64_t v66 = v84;
            goto LABEL_64;
          }
          if ([v23 isMovieRelated] && v90)
          {
            v64 = v94;
            uint64_t v65 = v62;
            uint64_t v66 = v90;
            goto LABEL_64;
          }
          if ([v23 isCultureRelated] && objc_msgSend(v83, "count"))
          {
            v64 = v94;
            uint64_t v65 = v62;
            uint64_t v66 = v83;
LABEL_64:
            id v68 = [(IPFeatureScanner *)v64 decoratedTitle:v65 withSubtitles:v66];

LABEL_65:
            v67 = 0;
            goto LABEL_66;
          }
          if ([v23 isMealRelated] && objc_msgSend(v82, "count"))
          {
            v74 = v94;
            id v75 = v62;
            uint64_t v76 = v82;
            goto LABEL_85;
          }
          if (![v62 length] && objc_msgSend(v89, "count"))
          {
            v74 = v94;
            id v75 = v62;
            uint64_t v76 = v89;
LABEL_85:
            id v68 = [(IPFeatureScanner *)v74 decoratedTitle:v75 withSubtitles:v76];

            if ([v76 count] == 1)
            {
              v67 = [v76 firstObject];
              goto LABEL_66;
            }
            goto LABEL_65;
          }
          char v77 = [v59 isGroupConversation];
          v67 = 0;
          if ([v23 prefersTitleSenderDecoration] && (v77 & 1) == 0)
          {
            v87 = [v59 sender];
            uint64_t v78 = [v59 recipients];
            id v68 = -[IPFeatureScanner decoratedTitleFromEventType:title:sender:recipients:isSent:isTitleSenderDecorated:](v94, "decoratedTitleFromEventType:title:sender:recipients:isSent:isTitleSenderDecorated:", v23, v62, v87, v78, [v59 isSent], &v98);

            goto LABEL_65;
          }
        }
        else
        {
          v67 = 0;
        }
        id v68 = v62;
LABEL_66:
        [v15 setAllDay:v97];
        [v15 setStartDate:v33];
        [v15 setEndDate:v96];
        objc_msgSend(v15, "setIpsos_isTimeApproximate:", v31);
        [v15 setTitle:v68];
        if ([v68 length])
        {
          int v69 = v99;
          uint64_t v70 = objc_msgSend(v15, "ipsos_eventAttributes");
          uint64_t v71 = 1024;
          if (!v69) {
            uint64_t v71 = 2048;
          }
          objc_msgSend(v15, "setIpsos_eventAttributes:", v70 | v71);
          if (v98) {
            objc_msgSend(v15, "setIpsos_eventAttributes:", objc_msgSend(v15, "ipsos_eventAttributes") | 0x1000);
          }
        }
        v72 = [v15 location];
        uint64_t v73 = [v72 length];

        if (!v73) {
          [v15 setLocation:v67];
        }

        uint64_t v12 = v89;
        unint64_t v13 = 0x264722000;
LABEL_74:
        ++v14;
      }
      while (v92 != v14);
      uint64_t v79 = [obj countByEnumeratingWithState:&v100 objects:v104 count:16];
      uint64_t v92 = v79;
      if (!v79)
      {
LABEL_88:

        id v11 = v80;
        id v10 = v81;
        break;
      }
    }
  }
}

- (BOOL)isBannedSender:(id)a3
{
  uint64_t v3 = [a3 email];
  if ([v3 length])
  {
    if ([v3 hasPrefix:@"receipts."]) {
      goto LABEL_10;
    }
    if ([v3 hasPrefix:@"receipts@"]) {
      goto LABEL_10;
    }
    if ([v3 hasPrefix:@"info@"]) {
      goto LABEL_10;
    }
    if ([v3 hasPrefix:@"news@"]) {
      goto LABEL_10;
    }
    if ([v3 containsString:@"_news@"]) {
      goto LABEL_10;
    }
    if ([v3 hasPrefix:@"noreply@"]) {
      goto LABEL_10;
    }
    id v4 = [NSString stringWithFormat:@"%@@%@", @"radar", @"apple.com"];
    char v5 = [v3 hasPrefix:v4];

    if ((v5 & 1) != 0
      || ([NSString stringWithFormat:@"%@.%@@%@", @"travel", @"res", @"apple.com"], uint64_t v6 = objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v3, "hasPrefix:", v6), v6, (v7 & 1) != 0))
    {
LABEL_10:
      char v8 = 1;
    }
    else
    {
      char v8 = [v3 containsString:@"newsletter"];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (double)confidenceForEvent:(id)a3 baseConfidence:(double)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(IPFeatureScanner *)self bodyMessageUnits];
  char v7 = [v6 firstObject];
  char v8 = [v7 originalMessage];

  if ([v5 isAllDay])
  {
    double v9 = 0.95;
  }
  else if (objc_msgSend(v5, "ipsos_usesDefaultClassificationTypeStartTime"))
  {
    double v9 = 0.8;
  }
  else if (objc_msgSend(v5, "ipsos_isTimeApproximate"))
  {
    double v9 = 0.8;
  }
  else
  {
    double v9 = 1.0;
  }
  if (objc_msgSend(v5, "ipsos_isDateTimeTenseDependent")) {
    double v10 = v9 * 0.8;
  }
  else {
    double v10 = v9;
  }
  if (objc_msgSend(v5, "ipsos_timeNeedsMeridianGuess")) {
    double v10 = v10 * 0.9;
  }
  if (objc_msgSend(v5, "ipsos_isEventTimeOnlyAndReferrengingToSentDate")) {
    double v10 = v10 * 0.75;
  }
  id v11 = [(IPFeatureScanner *)self detectedEvents];
  unint64_t v12 = [v11 count];

  if (v12 < 5)
  {
    unint64_t v13 = [(IPFeatureScanner *)self detectedEvents];
    unint64_t v14 = [v13 count];

    if (v14 < 4)
    {
      uint64_t v15 = [(IPFeatureScanner *)self detectedEvents];
      unint64_t v16 = [v15 count];

      if (v16 > 2) {
        double v10 = v10 * 0.95;
      }
    }
    else
    {
      double v10 = v10 * 0.9;
    }
  }
  else
  {
    double v10 = v10 * 0.7;
  }
  uint64_t v17 = [(IPFeatureScanner *)self stitchedEvents];
  unint64_t v18 = [v17 count];

  if (v18 < 4)
  {
    v20 = [(IPFeatureScanner *)self stitchedEvents];
    unint64_t v21 = [v20 count];

    if (v21 < 3)
    {
      unint64_t v22 = [(IPFeatureScanner *)self stitchedEvents];
      unint64_t v23 = [v22 count];

      if (v23 <= 1) {
        double v19 = v10;
      }
      else {
        double v19 = v10 * 0.9;
      }
    }
    else
    {
      double v19 = v10 * 0.8;
    }
  }
  else
  {
    double v19 = v10 * 0.7;
  }
  id v24 = [(IPFeatureScanner *)self bodyKeywordFeatures];
  unint64_t v25 = [v24 count];

  if (v25 <= 5) {
    double v26 = v19;
  }
  else {
    double v26 = v19 * 0.9;
  }
  uint64_t v27 = [(IPFeatureScanner *)self bodyKeywordFeatures];
  unint64_t v28 = [v27 count];

  if (v28 >= 4)
  {
    double v29 = 1.15;
LABEL_35:
    double v26 = v26 * v29;
    goto LABEL_38;
  }
  char v30 = [(IPFeatureScanner *)self bodyKeywordFeatures];
  unint64_t v31 = [v30 count];

  if (v31 >= 3)
  {
    double v29 = 1.1;
    goto LABEL_35;
  }
  int v32 = [(IPFeatureScanner *)self bodyKeywordFeatures];
  unint64_t v33 = [v32 count];

  if (v33 > 1) {
    double v26 = v26 * 1.05;
  }
LABEL_38:
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v34 = objc_msgSend(v5, "ipsos_dataFeatures", 0);
  uint64_t v35 = [v34 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v53;
    double v38 = 0.0;
    double v39 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v53 != v37) {
          objc_enumerationMutation(v34);
        }
        int v41 = [*(id *)(*((void *)&v52 + 1) + 8 * i) contextDictionary];
        double v42 = [v41 objectForKeyedSubscript:@"polarityProbability"];

        if (v42)
        {
          [v42 doubleValue];
          if (v43 <= 0.001) {
            double v43 = -0.0;
          }
          else {
            double v38 = v38 + 1.0;
          }
          double v39 = v39 + v43;
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v36);

    if (v38 > 0.0) {
      double v26 = v26 * ((1.0 - v39 / v38) * -0.5 + 1.0);
    }
  }
  else
  {
  }
  id v44 = [v8 type];
  BOOL v45 = IPMessageTypeEmail;

  if (v44 == v45)
  {
    char v46 = objc_msgSend(v5, "ipsos_messageUnit");
    double v47 = [v46 originalMessage];
    int v48 = [v47 isReply];

    if (v48) {
      double v26 = v26 * 0.85;
    }
    if ((unint64_t)[v8 messageUnitsTextLength] > 0xFA0) {
      double v26 = v26 * 0.5;
    }
  }
  int v49 = [v5 title];
  uint64_t v50 = [v49 length];

  if (!v50) {
    double v26 = v26 * 0.85;
  }

  return v26;
}

- (id)emailParticipantNames
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
  id v4 = [(IPFeatureScanner *)self messageSenderName];
  if ([v4 length]) {
    [v3 addObject:v4];
  }
  id v5 = [(IPFeatureScanner *)self bodyMessageUnits];
  uint64_t v6 = [v5 firstObject];
  char v7 = [v6 originalMessage];

  char v8 = [v7 recipients];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) displayableName];
        if ([v13 length]) {
          [v3 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v3;
}

- (NSArray)subjectDataDetectorsFeatures
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSubjectDataDetectorsFeatures:(id)a3
{
}

- (NSArray)subjectSentenceFeatures
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSubjectSentenceFeatures:(id)a3
{
}

- (NSMutableArray)subjectKeywordFeatures
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSubjectKeywordFeatures:(id)a3
{
}

- (NSMutableArray)subjectAndBodyDataDetectorsFeatures
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSubjectAndBodyDataDetectorsFeatures:(id)a3
{
}

- (BOOL)subjectContainsDate
{
  return self->_subjectContainsDate;
}

- (IPFeatureData)dateInSubjectFeatureData
{
  return (IPFeatureData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDateInSubjectFeatureData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInSubjectFeatureData, 0);
  objc_storeStrong((id *)&self->_subjectAndBodyDataDetectorsFeatures, 0);
  objc_storeStrong((id *)&self->_subjectKeywordFeatures, 0);
  objc_storeStrong((id *)&self->_subjectSentenceFeatures, 0);
  objc_storeStrong((id *)&self->_subjectDataDetectorsFeatures, 0);
}

@end