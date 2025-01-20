@interface CDMNLServiceUtils
+ (id)buildLVCResponse:(id)a3 lvcRequest:(id)a4;
+ (id)buildPSCResponse:(id)a3 pscRequest:(id)a4;
+ (id)buildPSCUserParseForExternalParserId:(id)a3 probability:(float)a4 rewriteMsg:(id)a5;
+ (id)buildSNLCProtoResponse:(id)a3 snlcRequest:(id)a4 parserToSet:(id)a5;
+ (id)buildSetupITFMRequest:(id)a3;
+ (id)buildSetupNLv4ProtoRequest:(id)a3;
+ (id)buildSetupSNLCProtoRequest:(id)a3;
+ (id)getPscOverrideProbabilityForLabel:(int)a3;
+ (id)get_psc_index_to_parser;
+ (unique_ptr<sirinluinternalnlv4_parser::NLv4ParserRequest,)buildNLv4ProtoRequest:(id)a3;
+ (void)_setWarmupRequestId:(id)a3;
+ (void)_sortMultilingualVariantsByScoreDescending:(id)a3;
+ (void)populateParser:(id)a3 parserToSet:(id)a4;
@end

@implementation CDMNLServiceUtils

+ (void)_setWarmupRequestId:(id)a3
{
  v5 = (void (**)(id, id, id))a3;
  id v3 = objc_alloc_init(MEMORY[0x263F71D78]);
  [v3 setHighInt:0];
  [v3 setLowInt:11];
  id v4 = objc_alloc_init(MEMORY[0x263F71D18]);
  [v4 setIdA:@"00000000-0000-0000-0000-00000000000B:0"];
  [v4 setConnectionId:@"4-8-15-16-23-42"];
  v5[2](v5, v3, v4);
}

+ (void)populateParser:(id)a3 parserToSet:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    v7 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "+[CDMNLServiceUtils populateParser:parserToSet:]";
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s Doing a sweep on userParses and if there isn't one, set it to parserToSet=%@", buf, 0x16u);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(id *)(*((void *)&v18 + 1) + 8 * i);
          v13 = [v12 parser];
          BOOL v14 = v13 == 0;

          if (v14)
          {
            v16 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v24 = "+[CDMNLServiceUtils populateParser:parserToSet:]";
              __int16 v25 = 2112;
              id v26 = v6;
              _os_log_debug_impl(&dword_2263A0000, v16, OS_LOG_TYPE_DEBUG, "%s No parser set yet, set it to parserToSet=%@", buf, 0x16u);
            }

            [v12 setParser:v6];
          }
          else
          {
            v15 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              v17 = [v12 parser];
              *(_DWORD *)buf = 136315394;
              v24 = "+[CDMNLServiceUtils populateParser:parserToSet:]";
              __int16 v25 = 2112;
              id v26 = v17;
              _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, "%s A parser is set already, moving on. parser=%@", buf, 0x16u);
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "+[CDMNLServiceUtils populateParser:parserToSet:]";
      _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s Early return as it's an empty userParses (either nil or empty)", buf, 0xCu);
    }
  }
}

+ (id)buildLVCResponse:(id)a3 lvcRequest:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v23 = a3;
  id v26 = [MEMORY[0x263EFF980] array];
  v24 = +[CDMUserDefaultsUtils readUserDefaultLVCOverride];
  id v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "+[CDMNLServiceUtils buildLVCResponse:lvcRequest:]";
    _os_log_debug_impl(&dword_2263A0000, v4, OS_LOG_TYPE_DEBUG, "%s Checking user defaults for \"com.apple.siri.cdm\" \"LVC override\"...", buf, 0xCu);
  }

  if ([v24 length])
  {
    id v5 = objc_alloc_init(MEMORY[0x263F71CE8]);
    [v5 setLanguageVariantName:v24];
    [v5 setLanguageVariantScore:1.0];
    id v6 = (id)CDMLogContext;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = [v5 dictionaryRepresentation];
      *(_DWORD *)buf = 136315650;
      v33 = "+[CDMNLServiceUtils buildLVCResponse:lvcRequest:]";
      __int16 v34 = 2112;
      *(void *)v35 = @"lvc";
      *(_WORD *)&v35[8] = 2112;
      *(void *)&v35[10] = v7;
      _os_log_impl(&dword_2263A0000, v6, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nWARNING: LVC override found. After override, LVC output %@", buf, 0x20u);
    }
    [v26 addObject:v5];
  }
  else
  {
    id v5 = [MEMORY[0x263F089D8] string];
    [v5 appendString:@"LVC classification results: "];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = [v23 hypotheses];
    uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v12 = [v11 label];
          [v11 probability];
          [v5 appendFormat:@"[symbol=%d, prob=%.2f], ", v12, v13];
          id v14 = objc_alloc_init(MEMORY[0x263F71CE8]);
          if ([v11 hasStringLabel])
          {
            v15 = [v11 stringLabel];
            [v14 setLanguageVariantName:v15];
          }
          else
          {
            v15 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              int v17 = [v11 label];
              [v11 probability];
              *(_DWORD *)buf = 136315650;
              v33 = "+[CDMNLServiceUtils buildLVCResponse:lvcRequest:]";
              __int16 v34 = 1024;
              *(_DWORD *)v35 = v17;
              *(_WORD *)&v35[4] = 2048;
              *(double *)&v35[6] = v18;
              _os_log_error_impl(&dword_2263A0000, v15, OS_LOG_TYPE_ERROR, "%s [ERR]: Language variant string representation is not set for label=%i prob=%.2f", buf, 0x1Cu);
            }
          }

          [v11 probability];
          [v14 setLanguageVariantScore:v16];
          [v26 addObject:v14];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v8);
    }

    [(id)objc_opt_class() _sortMultilingualVariantsByScoreDescending:v26];
  }

  id v19 = objc_alloc_init(MEMORY[0x263F71CD8]);
  [v19 setMultilingualVariants:v26];
  long long v20 = [[CDMLVCResponseCommand alloc] initWithITFMResponse:v23 languageVariantResult:v19];
  long long v21 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "+[CDMNLServiceUtils buildLVCResponse:lvcRequest:]";
    __int16 v34 = 2112;
    *(void *)v35 = v20;
    _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s CDMLVCResponseCommand: %@", buf, 0x16u);
  }

  return v20;
}

+ (void)_sortMultilingualVariantsByScoreDescending:(id)a3
{
}

uint64_t __64__CDMNLServiceUtils__sortMultilingualVariantsByScoreDescending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 languageVariantScore];
  double v7 = v6;
  [v5 languageVariantScore];
  if (v7 >= v8)
  {
    [v4 languageVariantScore];
    double v11 = v10;
    [v5 languageVariantScore];
    if (v11 <= v12) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

+ (id)buildSetupITFMRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F71E70]);
  [v5 setOriginalUtterance:@"hello world"];
  [v5 setNormalisedUtterance:@"hello world"];
  id v6 = objc_alloc_init(MEMORY[0x263F71F20]);
  [v6 setValue:@"hello"];
  [v6 setTokenIndex:0];
  [v6 setBegin:0];
  [v6 setEnd:5];
  id v7 = objc_alloc_init(MEMORY[0x263F71F20]);
  [v7 setValue:@"world"];
  [v7 setTokenIndex:0];
  [v7 setBegin:6];
  [v7 setEnd:11];
  id v8 = objc_alloc_init(MEMORY[0x263F71F28]);
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v6, v7, 0);
  [v8 setTokens:v9];

  [v5 setTokenChain:v8];
  id v10 = objc_alloc_init(MEMORY[0x263F71E78]);
  double v11 = malloc_type_calloc([v8 tokensCount] * objc_msgSend(v4, "integerValue"), 4uLL, 0x100004052888210uLL);
  objc_msgSend(v10, "setValues:count:", v11, objc_msgSend(v8, "tokensCount") * objc_msgSend(v4, "integerValue"));
  free(v11);
  objc_msgSend(v10, "setNumToken:", objc_msgSend(v8, "tokensCount"));
  [v10 setNumLayer:1];
  objc_msgSend(v10, "setEmbeddingDim:", objc_msgSend(v4, "integerValue"));
  [v10 setEmbedderId:@"embed_id"];
  id v12 = objc_alloc_init(MEMORY[0x263F71E20]);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __43__CDMNLServiceUtils_buildSetupITFMRequest___block_invoke;
  v16[3] = &unk_2647A52C0;
  id v13 = v12;
  id v17 = v13;
  [a1 _setWarmupRequestId:v16];
  [v13 setTokenisedUtterance:v5];
  [v13 setEmbeddings:v10];
  id v14 = [MEMORY[0x263EFF980] array];
  [v13 setMatchingSpans:v14];

  return v13;
}

void __43__CDMNLServiceUtils_buildSetupITFMRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) setRequestId:v6];
  [*(id *)(a1 + 32) setNluRequestId:v5];
}

+ (id)buildPSCUserParseForExternalParserId:(id)a3 probability:(float)a4 rewriteMsg:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263F71CD0]);
  [v9 setAsrHypothesisIndex:0];
  [v9 setExternalParserId:v7];
  [v9 setRewrite:v8];
  if (v8)
  {
    id v10 = [v8 rewrittenUtterance];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      id v12 = objc_alloc_init(MEMORY[0x263F71C88]);
      id v13 = [v8 rewrittenUtterance];
      [v12 setValue:v13];

      [v9 setRewrittenUtterance:v12];
    }
  }
  id v14 = objc_alloc_init(MEMORY[0x263F71D80]);
  [v14 setDelegated:v9];
  v15 = [MEMORY[0x263EFF980] array];
  [v15 addObject:v14];
  id v16 = objc_alloc_init(MEMORY[0x263F71D88]);
  [v16 setUserDialogActs:v15];
  [v16 setProbability:a4];
  [v16 setParserId:@"POMMESClassifier"];
  id v17 = (void *)MEMORY[0x263F71F48];
  id v18 = objc_alloc_init(MEMORY[0x263F08C38]);
  id v19 = [v17 convertFromUUID:v18];
  [v16 setIdA:v19];

  id v20 = objc_alloc_init(MEMORY[0x263F71D00]);
  [v20 setAlgorithm:2];
  [v20 setParserId:7];
  [v16 setParser:v20];

  return v16;
}

+ (id)getPscOverrideProbabilityForLabel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(a1, "get_psc_index_to_parser");
  id v5 = [NSNumber numberWithInt:v3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  id v7 = +[CDMUserDefaultsUtils readUserDefaultPscOverride];
  if ([v7 length])
  {
    if ([v7 isEqualToString:@"not-pommes"])
    {
      id v8 = &unk_26DA3E6A0;
      goto LABEL_16;
    }
    if ([v7 isEqualToString:@"pommes"])
    {
      id v9 = @"com.apple.search";
LABEL_8:
      if (v6 == v9) {
        id v10 = &unk_26DA3E6B0;
      }
      else {
        id v10 = &unk_26DA3E6C0;
      }
      id v8 = v10;
      goto LABEL_16;
    }
    if ([v7 isEqualToString:@"pommes-phase-2"])
    {
      id v9 = @"com.apple.search_phase_2";
      goto LABEL_8;
    }
    uint64_t v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      id v14 = "+[CDMNLServiceUtils getPscOverrideProbabilityForLabel:]";
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_2263A0000, v11, OS_LOG_TYPE_INFO, "%s [WARN]: Unexpected PSC override \"%@\"", (uint8_t *)&v13, 0x16u);
    }
  }
  id v8 = 0;
LABEL_16:

  return v8;
}

+ (id)buildPSCResponse:(id)a3 pscRequest:(id)a4
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v50 = a3;
  id v49 = a4;
  v55 = [v49 rewriteMsg];
  if (v55)
  {
    id v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v48 = [v55 rewrittenUtterance];
      *(_DWORD *)buf = 136315394;
      v66 = "+[CDMNLServiceUtils buildPSCResponse:pscRequest:]";
      __int16 v67 = 2112;
      *(void *)v68 = v48;
      _os_log_debug_impl(&dword_2263A0000, v6, OS_LOG_TYPE_DEBUG, "%s PSC rewrittenUtterance being set to CCQR top hypothesis:%@", buf, 0x16u);
    }
  }
  id v56 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v7 = objc_alloc(MEMORY[0x263EFF980]);
  id v8 = [v50 hypotheses];
  v54 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = [v50 hypotheses];
  uint64_t v9 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v62 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        if (([v12 hasStringLabel] & 1) == 0)
        {
          int v13 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            int v31 = [v12 label];
            [v12 probability];
            *(_DWORD *)buf = 136315650;
            v66 = "+[CDMNLServiceUtils buildPSCResponse:pscRequest:]";
            __int16 v67 = 1024;
            *(_DWORD *)v68 = v31;
            *(_WORD *)&v68[4] = 2048;
            *(double *)&v68[6] = v32;
          }

          id v14 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v12, "label"));
          [v12 setStringLabel:v14];
        }
        __int16 v15 = objc_msgSend(a1, "get_psc_index_to_parser");
        id v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "label"));
        uint64_t v17 = [v15 objectForKeyedSubscript:v16];

        if ([v17 length])
        {
          [v12 probability];
          float v19 = v18;
          id v20 = objc_msgSend(NSNumber, "numberWithFloat:");
          [v56 setObject:v20 forKey:v17];

          long long v21 = +[CDMNLServiceUtils getPscOverrideProbabilityForLabel:](CDMNLServiceUtils, "getPscOverrideProbabilityForLabel:", [v12 label]);
          if (v21)
          {
            id v23 = (id)CDMLogContext;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              v24 = [v12 stringLabel];
              [v21 floatValue];
              *(_DWORD *)buf = 136315906;
              v66 = "+[CDMNLServiceUtils buildPSCResponse:pscRequest:]";
              __int16 v67 = 2112;
              *(void *)v68 = @"psc";
              *(_WORD *)&v68[8] = 2112;
              *(void *)&v68[10] = v24;
              __int16 v69 = 2048;
              double v70 = v25;
              _os_log_impl(&dword_2263A0000, v23, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nWARNING: PSC override found - setting '%@' parse to probability=%.2f", buf, 0x2Au);
            }
            [v21 floatValue];
            float v19 = *(float *)&v22;
          }
          *(float *)&double v22 = v19;
          id v26 = +[CDMNLServiceUtils buildPSCUserParseForExternalParserId:v17 probability:v55 rewriteMsg:v22];
          if (v19 < 0.6)
          {
            if (+[CDMFeatureFlags isAmbiguityRefactorEnabled])
            {
              long long v27 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315906;
                v66 = "+[CDMNLServiceUtils buildPSCResponse:pscRequest:]";
                __int16 v67 = 2112;
                *(void *)v68 = v17;
                *(_WORD *)&v68[8] = 2048;
                *(double *)&v68[10] = v19;
                __int16 v69 = 2048;
                double v70 = 0.600000024;
                _os_log_debug_impl(&dword_2263A0000, v27, OS_LOG_TYPE_DEBUG, "%s Not emitting PSC parse for externalParserId=%@: probability=%.2f < threshold=%.2f", buf, 0x2Au);
              }

              goto LABEL_30;
            }
            long long v30 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315906;
              v66 = "+[CDMNLServiceUtils buildPSCResponse:pscRequest:]";
              __int16 v67 = 2112;
              *(void *)v68 = v17;
              *(_WORD *)&v68[8] = 2048;
              *(double *)&v68[10] = v19;
              __int16 v69 = 2048;
              double v70 = 0.600000024;
              _os_log_debug_impl(&dword_2263A0000, v30, OS_LOG_TYPE_DEBUG, "%s PSC parse externalParserId=%@: probability=%.2f is below threshold (%.2f), but emitting due to ambiguity refactor being disabled.", buf, 0x2Au);
            }
          }
          [v54 addObject:v26];
LABEL_30:

          goto LABEL_31;
        }
        long long v21 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          long long v28 = [v12 stringLabel];
          [v12 probability];
          *(_DWORD *)buf = 136315650;
          v66 = "+[CDMNLServiceUtils buildPSCResponse:pscRequest:]";
          __int16 v67 = 2112;
          *(void *)v68 = v28;
          *(_WORD *)&v68[8] = 2048;
          *(double *)&v68[10] = v29;
          _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s Not emitting PSC parse for label=%@ prob=%.2f, no externalParserId found", buf, 0x20u);
        }
LABEL_31:
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
    }
    while (v9);
  }

  if (![v54 count])
  {
    v52 = [v56 objectForKeyedSubscript:@"com.apple.search"];
    v51 = [v56 objectForKeyedSubscript:@"com.apple.search_phase_2"];
    if (v52)
    {
      if (v51)
      {
        [v52 floatValue];
        float v34 = v33;
        [v51 floatValue];
        if ((float)(v34 + v35) >= 0.6)
        {
          v74[0] = @"com.apple.search";
          v74[1] = @"com.apple.search_phase_2";
          [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:2];
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id v36 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v37 = [v36 countByEnumeratingWithState:&v57 objects:v73 count:16];
          if (v37)
          {
            uint64_t v38 = *(void *)v58;
            do
            {
              for (uint64_t j = 0; j != v37; ++j)
              {
                if (*(void *)v58 != v38) {
                  objc_enumerationMutation(v36);
                }
                uint64_t v40 = *(void *)(*((void *)&v57 + 1) + 8 * j);
                v41 = [v56 objectForKeyedSubscript:v40];
                [v41 floatValue];
                float v43 = v42;
                v44 = +[CDMNLServiceUtils buildPSCUserParseForExternalParserId:probability:rewriteMsg:](CDMNLServiceUtils, "buildPSCUserParseForExternalParserId:probability:rewriteMsg:", v40, v55);
                v45 = CDMOSLoggerForCategory(0);
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136316162;
                  v66 = "+[CDMNLServiceUtils buildPSCResponse:pscRequest:]";
                  __int16 v67 = 2112;
                  *(void *)v68 = v40;
                  *(_WORD *)&v68[8] = 2048;
                  *(double *)&v68[10] = v43;
                  __int16 v69 = 2048;
                  double v70 = 0.600000024;
                  __int16 v71 = 2048;
                  uint64_t v72 = 0x3FE3333340000000;
                  _os_log_debug_impl(&dword_2263A0000, v45, OS_LOG_TYPE_DEBUG, "%s PSC parse externalParserId=%@: probability=%.2f is below threshold (%.2f), but emitting as POMMES + POMMES_PHASE_2 > (%.2f).", buf, 0x34u);
                }

                [v54 addObject:v44];
              }
              uint64_t v37 = [v36 countByEnumeratingWithState:&v57 objects:v73 count:16];
            }
            while (v37);
          }
        }
      }
    }
  }
  v46 = [[CDMPSCResponseCommand alloc] initWithPscParses:v54 pscResponse:v50];

  return v46;
}

+ (id)buildSNLCProtoResponse:(id)a3 snlcRequest:(id)a4 parserToSet:(id)a5
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v59 = a4;
  id v57 = a5;
  id v8 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v53 = [v7 hypotheses];
    v54 = [v53 firstObject];
    *(_DWORD *)buf = 136315394;
    __int16 v71 = "+[CDMNLServiceUtils buildSNLCProtoResponse:snlcRequest:parserToSet:]";
    __int16 v72 = 1024;
    LODWORD(v73) = [v54 label];
    _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s SNLC classification result=%i", buf, 0x12u);
  }
  long long v58 = +[CDMUserDefaultsUtils readUserDefaultSnlcOverride];
  uint64_t v9 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v71 = "+[CDMNLServiceUtils buildSNLCProtoResponse:snlcRequest:parserToSet:]";
    _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s Checking user defaults for \"com.apple.siri.cdm\" \"SNLC override\"...", buf, 0xCu);
  }

  if ([v58 length])
  {
    if ([v58 isEqualToString:@"server"])
    {
      uint64_t v10 = CDMLogContext;
      if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        __int16 v71 = "+[CDMNLServiceUtils buildSNLCProtoResponse:snlcRequest:parserToSet:]";
        __int16 v72 = 2112;
        v73 = @"snlc";
        __int16 v74 = 2112;
        v75 = @"server";
        __int16 v76 = 2048;
        uint64_t v77 = 0x3FF0000000000000;
        _os_log_impl(&dword_2263A0000, v10, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nWARNING: SNLC defaults override found. Overriding SNLC classification result with %@ and probability=%.2f", buf, 0x2Au);
      }
    }
    else
    {
      if ([v58 isEqualToString:@"device"])
      {
        uint64_t v11 = CDMLogContext;
        int v12 = 1;
        if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          __int16 v71 = "+[CDMNLServiceUtils buildSNLCProtoResponse:snlcRequest:parserToSet:]";
          __int16 v72 = 2112;
          v73 = @"snlc";
          __int16 v74 = 2112;
          v75 = @"device";
          __int16 v76 = 2048;
          uint64_t v77 = 0x3FF0000000000000;
          _os_log_impl(&dword_2263A0000, v11, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nWARNING: SNLC defaults override found. Overriding SNLC classification result with %@ and probability=%.2f", buf, 0x2Au);
        }
        goto LABEL_16;
      }
      int v13 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v71 = "+[CDMNLServiceUtils buildSNLCProtoResponse:snlcRequest:parserToSet:]";
        _os_log_error_impl(&dword_2263A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: Unknown SNLC override label. Falling back on SERVER", buf, 0xCu);
      }
    }
    int v12 = 0;
LABEL_16:
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v14 = [v7 hypotheses];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v64 objects:v69 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v65 != v16) {
            objc_enumerationMutation(v14);
          }
          float v18 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          if ([v18 label] == v12)
          {
            LODWORD(v19) = 1.0;
            [v18 setProbability:v19];
          }
          else
          {
            id v20 = [v7 hypotheses];
            *(float *)&double v21 = 0.0 / (float)(unint64_t)([v20 count] - 1);
            [v18 setProbability:v21];
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v64 objects:v69 count:16];
      }
      while (v15);
    }

    double v22 = (id)CDMLogContext;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = [v7 hypotheses];
      v24 = [v23 firstObject];
      int v25 = [v24 label];
      *(_DWORD *)buf = 136315650;
      __int16 v71 = "+[CDMNLServiceUtils buildSNLCProtoResponse:snlcRequest:parserToSet:]";
      __int16 v72 = 2112;
      v73 = @"snlc";
      __int16 v74 = 1024;
      LODWORD(v75) = v25;
      _os_log_impl(&dword_2263A0000, v22, OS_LOG_TYPE_INFO, "%s [insights-cdm-%@]:\nCorrected SNLC classification result=%i (after override).", buf, 0x1Cu);
    }
  }
  id v26 = [v59 rewriteMsg];
  id v56 = v26;
  id v27 = objc_alloc_init(MEMORY[0x263F71CD0]);
  [v27 setAsrHypothesisIndex:0];
  [v27 setExternalParserId:@"com.apple.siri.nlv3"];
  long long v28 = [v59 rewriteMsg];
  [v27 setRewrite:v28];

  float v29 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v71 = "+[CDMNLServiceUtils buildSNLCProtoResponse:snlcRequest:parserToSet:]";
    __int16 v72 = 1024;
    LODWORD(v73) = v26 != 0;
    _os_log_debug_impl(&dword_2263A0000, v29, OS_LOG_TYPE_DEBUG, "%s SNLC rewrittenUtterances size=%d", buf, 0x12u);
  }

  if (v26)
  {
    long long v30 = [v26 rewrittenUtterance];
    BOOL v31 = [v30 length] == 0;

    if (!v31)
    {
      float v32 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v55 = [v26 rewrittenUtterance];
        *(_DWORD *)buf = 136315394;
        __int16 v71 = "+[CDMNLServiceUtils buildSNLCProtoResponse:snlcRequest:parserToSet:]";
        __int16 v72 = 2112;
        v73 = v55;
        _os_log_debug_impl(&dword_2263A0000, v32, OS_LOG_TYPE_DEBUG, "%s SNLC rewrittenUtterance being set to CCQR top hypothesis:%@", buf, 0x16u);
      }
      id v33 = objc_alloc_init(MEMORY[0x263F71C88]);
      float v34 = [v26 rewrittenUtterance];
      [v33 setValue:v34];

      [v27 setRewrittenUtterance:v33];
    }
  }
  id v35 = objc_alloc_init(MEMORY[0x263F71D80]);
  [v35 setDelegated:v27];
  id v36 = [MEMORY[0x263EFF980] array];
  [v36 addObject:v35];
  id v37 = objc_alloc_init(MEMORY[0x263F71D88]);
  [v37 setUserDialogActs:v36];
  [v37 setParserId:@"ServerNLClassifier"];
  [v37 setParser:v57];
  uint64_t v38 = [v59 parserRequest];
  v39 = [v38 requestId];
  [v37 setIdA:v39];

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v40 = [v7 hypotheses];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v61;
    while (2)
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v61 != v42) {
          objc_enumerationMutation(v40);
        }
        v44 = *(void **)(*((void *)&v60 + 1) + 8 * j);
        if (![v44 label])
        {
          [v44 probability];
          [v37 setProbability:v45];
          goto LABEL_46;
        }
      }
      uint64_t v41 = [v40 countByEnumeratingWithState:&v60 objects:v68 count:16];
      if (v41) {
        continue;
      }
      break;
    }
  }
LABEL_46:

  v46 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v37, 0);
  v47 = [v7 hypotheses];
  [v47 sortUsingComparator:&__block_literal_global_457];

  v48 = [CDMSNLCProtoResponseCommand alloc];
  id v49 = [v7 hypotheses];
  id v50 = [v49 firstObject];
  v51 = -[CDMSNLCProtoResponseCommand initWithClassLabel:snlcParses:snlcResponse:](v48, "initWithClassLabel:snlcParses:snlcResponse:", [v50 label], v46, v7);

  return v51;
}

uint64_t __68__CDMNLServiceUtils_buildSNLCProtoResponse_snlcRequest_parserToSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 probability];
  float v7 = v6;
  [v5 probability];
  if (v7 >= v8)
  {
    [v4 probability];
    float v11 = v10;
    [v5 probability];
    if (v11 <= v12) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

+ (id)buildSetupSNLCProtoRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F71E70]);
  [v5 setOriginalUtterance:@"hello world"];
  [v5 setNormalisedUtterance:@"hello world"];
  id v6 = objc_alloc_init(MEMORY[0x263F71F20]);
  [v6 setValue:@"hello"];
  [v6 setTokenIndex:0];
  [v6 setBegin:0];
  [v6 setEnd:5];
  id v7 = objc_alloc_init(MEMORY[0x263F71F20]);
  [v7 setValue:@"world"];
  [v7 setTokenIndex:0];
  [v7 setBegin:6];
  [v7 setEnd:11];
  id v8 = objc_alloc_init(MEMORY[0x263F71F28]);
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v6, v7, 0);
  [v8 setTokens:v9];

  [v5 setTokenChain:v8];
  id v10 = objc_alloc_init(MEMORY[0x263F71E78]);
  float v11 = malloc_type_calloc([v8 tokensCount] * objc_msgSend(v4, "integerValue"), 4uLL, 0x100004052888210uLL);
  objc_msgSend(v10, "setValues:count:", v11, objc_msgSend(v8, "tokensCount") * objc_msgSend(v4, "integerValue"));
  free(v11);
  objc_msgSend(v10, "setNumToken:", objc_msgSend(v8, "tokensCount"));
  [v10 setNumLayer:1];
  objc_msgSend(v10, "setEmbeddingDim:", objc_msgSend(v4, "integerValue"));
  [v10 setEmbedderId:@"embed_id"];
  id v12 = objc_alloc_init(MEMORY[0x263F71E20]);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__CDMNLServiceUtils_buildSetupSNLCProtoRequest___block_invoke;
  v16[3] = &unk_2647A52C0;
  id v13 = v12;
  id v17 = v13;
  [a1 _setWarmupRequestId:v16];
  [v13 setTokenisedUtterance:v5];
  [v13 setEmbeddings:v10];
  id v14 = [MEMORY[0x263EFF980] array];
  [v13 setMatchingSpans:v14];

  return v13;
}

void __48__CDMNLServiceUtils_buildSetupSNLCProtoRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) setRequestId:v6];
  [*(id *)(a1 + 32) setNluRequestId:v5];
}

+ (id)buildSetupNLv4ProtoRequest:(id)a3
{
  id v36 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F71E60]);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __48__CDMNLServiceUtils_buildSetupNLv4ProtoRequest___block_invoke;
  v37[3] = &unk_2647A52C0;
  id v5 = v4;
  id v38 = v5;
  [a1 _setWarmupRequestId:v37];
  id v35 = objc_alloc_init(MEMORY[0x263F71E70]);
  [v35 setNormalisedUtterance:@"hello world"];
  [v35 setOriginalUtterance:@"hello world"];
  id v6 = objc_alloc_init(MEMORY[0x263F71F28]);
  [v6 setStringValue:@"hello world"];
  [v6 setLocale:@"en_US"];
  id v7 = objc_alloc_init(MEMORY[0x263F71F20]);
  [v7 setCleanValue:@"hello"];
  [v7 setValue:@"hello"];
  [v7 setTokenIndex:0];
  [v7 setBegin:0];
  [v7 setEnd:5];
  [v7 setIsSignificant:1];
  id v8 = objc_alloc_init(MEMORY[0x263F71F20]);
  [v8 setCleanValue:@"world"];
  [v8 setValue:@"world"];
  [v8 setTokenIndex:1];
  [v8 setBegin:6];
  [v8 setEnd:11];
  [v8 setIsSignificant:1];
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v7, v8, 0);
  [v6 setTokens:v9];

  [v35 setTokenChain:v6];
  [v5 setTokenisedUtterance:v35];
  id v10 = objc_alloc_init(MEMORY[0x263F71E78]);
  float v11 = malloc_type_calloc([v6 tokensCount] * objc_msgSend(v36, "integerValue"), 4uLL, 0x100004052888210uLL);
  objc_msgSend(v10, "setValues:count:", v11, objc_msgSend(v6, "tokensCount") * objc_msgSend(v36, "integerValue"));
  free(v11);
  objc_msgSend(v10, "setNumToken:", objc_msgSend(v6, "tokensCount"));
  [v10 setNumLayer:1];
  objc_msgSend(v10, "setEmbeddingDim:", objc_msgSend(v36, "integerValue"));
  [v10 setEmbedderId:@"embed_id"];
  [v5 setEmbeddings:v10];
  id v12 = objc_alloc_init(MEMORY[0x263F71D70]);
  id v13 = objc_alloc_init(MEMORY[0x263F71D60]);
  [v12 setSystemDialogActGroup:v13];

  id v14 = objc_alloc_init(MEMORY[0x263F71D68]);
  [v12 setTurnContext:v14];

  id v15 = objc_alloc_init(MEMORY[0x263F71CF0]);
  uint64_t v16 = [v12 turnContext];
  [v16 setNlContext:v15];

  id v17 = [MEMORY[0x263EFF980] array];
  float v18 = [v12 turnContext];
  double v19 = [v18 nlContext];
  [v19 setActiveTasks:v17];

  id v20 = [MEMORY[0x263EFF980] array];
  double v21 = [v12 turnContext];
  double v22 = [v21 nlContext];
  [v22 setExecutedTasks:v20];

  id v23 = [MEMORY[0x263EFF980] array];
  v24 = [v12 turnContext];
  int v25 = [v24 nlContext];
  [v25 setSalientEntities:v23];

  id v26 = [MEMORY[0x263EFF980] array];
  id v27 = [v12 turnContext];
  long long v28 = [v27 nlContext];
  [v28 setSystemDialogActs:v26];

  id v29 = objc_alloc_init(MEMORY[0x263F71D60]);
  long long v30 = [v12 turnContext];
  BOOL v31 = [v30 nlContext];
  [v31 setSystemDialogActGroup:v29];

  [v5 setTurnInput:v12];
  float v32 = [MEMORY[0x263EFF980] array];
  [v5 setMatchingSpans:v32];

  [v5 setMaxNumParses:1];
  id v33 = v5;

  return v33;
}

void __48__CDMNLServiceUtils_buildSetupNLv4ProtoRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) setRequestId:v6];
  [*(id *)(a1 + 32) setNluRequestId:v5];
}

+ (unique_ptr<sirinluinternalnlv4_parser::NLv4ParserRequest,)buildNLv4ProtoRequest:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    uint64_t v9 = "+[CDMNLServiceUtils buildNLv4ProtoRequest:]";
    _os_log_impl(&dword_2263A0000, v4, OS_LOG_TYPE_INFO, "%s Convert SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest to sirinluinternalnlv4_parser::NLv4ParserRequest...", (uint8_t *)&v8, 0xCu);
  }

  id v5 = (void *)MEMORY[0x263F71F78];
  id v6 = [v3 parserRequest];
  [v5 convertNLv4ParserRequestToCpp:v6];

  return v7;
}

+ (id)get_psc_index_to_parser
{
  if (+[CDMNLServiceUtils get_psc_index_to_parser]::once != -1) {
    dispatch_once(&+[CDMNLServiceUtils get_psc_index_to_parser]::once, &__block_literal_global_7542);
  }
  v2 = (void *)+[CDMNLServiceUtils get_psc_index_to_parser]::_PSC_INDEX_TO_PARSER;
  return v2;
}

void __44__CDMNLServiceUtils_get_psc_index_to_parser__block_invoke()
{
  v3[3] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26DA3E640;
  v2[1] = &unk_26DA3E628;
  v3[0] = &stru_26DA24FF0;
  v3[1] = @"com.apple.search";
  v2[2] = &unk_26DA3E658;
  v3[2] = @"com.apple.search_phase_2";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)+[CDMNLServiceUtils get_psc_index_to_parser]::_PSC_INDEX_TO_PARSER;
  +[CDMNLServiceUtils get_psc_index_to_parser]::_PSC_INDEX_TO_PARSER = v0;
}

@end