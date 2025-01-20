@interface CDMServiceGraphUtil
+ (BOOL)debugInfoEnabled:(id)a3;
+ (BOOL)runUaaPNLProtoService:(id)a3 requestId:(id)a4 utterance:(id)a5 locale:(id)a6 tokenChain:(id)a7 matchingSpans:(id)a8 embeddingTensor:(id)a9 currentTurn:(id)a10 outUaapProtoRequest:(id *)a11 outUaapProtoResponse:(id *)a12 outError:(id *)a13;
+ (BOOL)spanHasMatcherName:(int)a3 matchingSpan:(id)a4;
+ (id)adjustProtoMatchingSpans:(id)a3 tokenChain:(id)a4 outError:(id *)a5;
+ (id)appendMarrsSpans:(id)a3 marrsMRSpans:(id)a4;
+ (id)buildLVCRequestWithTokenChain:(id)a3 matchingSpans:(id)a4 utterance:(id)a5 embeddingTensor:(id)a6 rewriteMsg:(id)a7 nluRequestId:(id)a8 reformedTurnInput:(id)a9 error:(id *)a10;
+ (id)buildNLv4ProtoRequestWithTokenChain:(id)a3 matchingSpans:(id)a4 utterance:(id)a5 embeddingTensor:(id)a6 currentTurn:(id)a7 requestId:(id)a8 outError:(id *)a9;
+ (id)buildNormalizedUtterance:(id)a3;
+ (id)buildPSCRequestWithTokenChain:(id)a3 matchingSpans:(id)a4 utterance:(id)a5 embeddingTensor:(id)a6 rewriteMsg:(id)a7 nluRequestId:(id)a8 currentTurn:(id)a9 error:(id *)a10;
+ (id)buildRepetitionResult:(id)a3;
+ (id)buildSNLCProtoRequestWithTokenChain:(id)a3 matchingSpans:(id)a4 utterance:(id)a5 embeddingTensor:(id)a6 rewriteMsg:(id)a7 requestId:(id)a8 currentTurn:(id)a9 error:(id *)a10;
+ (id)embeddingsOutput:(id)a3 embeddingConfig:(id)a4 forFactor:(id)a5;
+ (id)extractPrevTurnsAsrConfidence:(id)a3;
+ (id)extractReferenceResolutionUtterances:(id)a3;
+ (id)extractStableEmbeddings:(id)a3;
+ (id)filterMatchingSpans:(id)a3 withMatcherName:(int)a4;
+ (id)getNonWhitespaceTokenChain:(id)a3;
+ (id)mergeDateTimeSpans:(id)a3 regexSpans:(id)a4 siriVocabularySpans:(id)a5 vocSpans:(id)a6;
+ (id)overrideInputsFromUtterance:(id)a3 matchingSpans:(id)a4 tokenChain:(id)a5 contextUpdateReformedTurnInputBundle:(id)a6;
+ (id)prepareCcqrServiceRequest:(id)a3 currentTurnAsrConf:(double)a4 tokenResponse:(id)a5 previousTurnsAsrConf:(id)a6 previousTurnTokenizationResponseCommand:(id)a7 nluRequestId:(id)a8 resultCandidateId:(id)a9 cdmRequestId:(id)a10;
+ (id)prepareCcqrTokens:(id)a3 currentTurn:(id)a4 previousTurns:(id)a5 utterance:(id)a6 locale:(id)a7;
+ (id)runCcqrService:(id)a3 nluRequest:(id)a4 tokenResponse:(id)a5 previousTurnTokenizationResponseCommand:(id)a6 rdResponse:(id)a7 requestLink:(id)a8 locale:(id)a9;
+ (void)addDebugInfo:(id)a3 nluRequest:(id)a4 responseObject:(id)a5;
@end

@implementation CDMServiceGraphUtil

+ (id)embeddingsOutput:(id)a3 embeddingConfig:(id)a4 forFactor:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = a5;
  if (!v7)
  {
    v11 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
LABEL_23:
      v23 = 0;
      goto LABEL_30;
    }
    *(_DWORD *)buf = 136315138;
    v35 = "+[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:]";
    v24 = "%s Got nil embeddingsOutput, return nil";
LABEL_34:
    _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, v24, buf, 0xCu);
    goto LABEL_23;
  }
  if (!v8)
  {
    v11 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315138;
    v35 = "+[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:]";
    v24 = "%s Got nil embeddingConfig, return nil";
    goto LABEL_34;
  }
  v10 = [v8 getEmbeddingConfigForFactor:v9];
  v11 = v10;
  if (v10)
  {
    v26 = v9;
    id v27 = v8;
    v12 = [v10 embeddingModelVersion];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v28 = v7;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ([v18 hasEmbeddingVersion])
          {
            v19 = [v18 embeddingVersion];
            int v20 = [v19 isEqualToString:v12];

            if (v20)
            {
              if ([v18 hasEmbeddingTensor])
              {
                v23 = [v18 embeddingTensor];

                goto LABEL_28;
              }
              v21 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                v35 = "+[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:]";
              }
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    v22 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "+[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:]";
      __int16 v36 = 2112;
      v37 = v12;
      _os_log_impl(&dword_2263A0000, v22, OS_LOG_TYPE_INFO, "%s [WARN]: Did not find a EmbeddingTensorOutput that matches version=%@, returning nil.", buf, 0x16u);
    }

    v23 = 0;
LABEL_28:
    id v8 = v27;
    id v7 = v28;
    v9 = v26;
  }
  else
  {
    v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "+[CDMServiceGraphUtil embeddingsOutput:embeddingConfig:forFactor:]";
      __int16 v36 = 2112;
      v37 = v9;
      _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s [WARN]: No EmbeddingConfigItem for factor=%@, return nil", buf, 0x16u);
    }
    v23 = 0;
  }

LABEL_30:
  return v23;
}

+ (id)extractStableEmbeddings:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v15 = v3;
    v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v10 isStableEmbeddingsVersion])
          {
            if ([v10 hasEmbeddingTensor])
            {
              id v13 = [v10 embeddingTensor];
              goto LABEL_21;
            }
            v11 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              v12 = [v10 embeddingVersion];
              *(_DWORD *)buf = 136315394;
              v21 = "+[CDMServiceGraphUtil extractStableEmbeddings:]";
              __int16 v22 = 2112;
              v23 = v12;
              _os_log_impl(&dword_2263A0000, v11, OS_LOG_TYPE_INFO, "%s [WARN]: Found a stable embedding version %@, but it doesn't have embeddingTensor? skip this one", buf, 0x16u);
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "+[CDMServiceGraphUtil extractStableEmbeddings:]";
      _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: Did not find a stableEmbeddingVersion match, returning nil.", buf, 0xCu);
    }
    id v13 = 0;
LABEL_21:
    v4 = v15;
  }
  else
  {
    v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "+[CDMServiceGraphUtil extractStableEmbeddings:]";
      _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Got nil embeddingsOutput, return nil", buf, 0xCu);
    }
    id v13 = 0;
  }

  return v13;
}

+ (id)filterMatchingSpans:(id)a3 withMatcherName:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (!+[CDMServiceGraphUtil spanHasMatcherName:matchingSpan:](CDMServiceGraphUtil, "spanHasMatcherName:matchingSpan:", v4, v12, (void)v14))[v6 addObject:v12]; {
      }
        }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)appendMarrsSpans:(id)a3 marrsMRSpans:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF980] array];
  uint64_t v8 = v7;
  if (v5) {
    [v7 addObjectsFromArray:v5];
  }
  if (v6 && [v6 count])
  {
    uint64_t v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      uint64_t v12 = "+[CDMServiceGraphUtil appendMarrsSpans:marrsMRSpans:]";
      _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s Feeding mention resolver spans to NLv4", (uint8_t *)&v11, 0xCu);
    }

    [v8 addObjectsFromArray:v6];
  }

  return v8;
}

+ (id)mergeDateTimeSpans:(id)a3 regexSpans:(id)a4 siriVocabularySpans:(id)a5 vocSpans:(id)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v12 spanMatchResponse];
  uint64_t v14 = [v13 matchingSpansCount];
  long long v15 = [v11 spanMatchResponse];
  uint64_t v16 = [v15 matchingSpansCount] + v14;
  long long v17 = [v10 spanMatchResponse];
  uint64_t v18 = [v17 matchingSpansCount];
  uint64_t v19 = [v9 spanMatchResponse];
  uint64_t v20 = v16 + v18 + [v19 matchingSpansCount];

  v21 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v20];
  __int16 v22 = [v12 spanMatchResponse];

  v23 = [v22 matchingSpans];
  [v21 addObjectsFromArray:v23];

  v24 = [v11 spanMatchResponse];

  uint64_t v25 = [v24 matchingSpans];
  [v21 addObjectsFromArray:v25];

  v26 = [v10 spanMatchResponse];

  id v27 = [v26 matchingSpans];
  [v21 addObjectsFromArray:v27];

  id v28 = [v9 spanMatchResponse];

  long long v29 = [v28 matchingSpans];
  [v21 addObjectsFromArray:v29];

  id v30 = objc_alloc_init(MEMORY[0x263F71EF0]);
  [v30 setMatchingSpans:v21];
  long long v31 = CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
  {
    v34 = v31;
    int v38 = 136315650;
    v39 = "+[CDMServiceGraphUtil mergeDateTimeSpans:regexSpans:siriVocabularySpans:vocSpans:]";
    __int16 v40 = 2112;
    v41 = @"spanmatch";
    __int16 v42 = 1024;
    LODWORD(v43) = [v21 count];
    _os_log_debug_impl(&dword_2263A0000, v34, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nSpan Matcher Services generated number of spans: %d", (uint8_t *)&v38, 0x1Cu);

    long long v31 = CDMLogContext;
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    v35 = (void *)MEMORY[0x263F71F80];
    __int16 v36 = v31;
    v37 = objc_msgSend(v35, "printableSpanMatchResponse:withUSOGraph:", v30, +[CDMUserDefaultsUtils isPrintUSOInSpanEnabled](CDMUserDefaultsUtils, "isPrintUSOInSpanEnabled"));
    int v38 = 136315650;
    v39 = "+[CDMServiceGraphUtil mergeDateTimeSpans:regexSpans:siriVocabularySpans:vocSpans:]";
    __int16 v40 = 2112;
    v41 = @"spanmatch";
    __int16 v42 = 2112;
    v43 = v37;
    _os_log_debug_impl(&dword_2263A0000, v36, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nSpanMatchResponse: %@", (uint8_t *)&v38, 0x20u);
  }
  long long v32 = [[CDMSpanMatchProtoResponseCommand alloc] initWithResponse:v30];

  return v32;
}

+ (id)buildLVCRequestWithTokenChain:(id)a3 matchingSpans:(id)a4 utterance:(id)a5 embeddingTensor:(id)a6 rewriteMsg:(id)a7 nluRequestId:(id)a8 reformedTurnInput:(id)a9 error:(id *)a10
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v52 = a6;
  id v45 = a7;
  id v51 = a8;
  id v50 = a9;
  uint64_t v18 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v60 = "+[CDMServiceGraphUtil buildLVCRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteMsg:nluRequ"
          "estId:reformedTurnInput:error:]";
    _os_log_impl(&dword_2263A0000, v18, OS_LOG_TYPE_INFO, "%s Building SIRINLUINTERNALITFMITFMParserRequest for LVC...", buf, 0xCu);
  }

  id v19 = objc_alloc_init(MEMORY[0x263F71E70]);
  uint64_t v20 = +[CDMServiceGraphUtil buildNormalizedUtterance:v15];
  [v19 setNormalisedUtterance:v20];

  v46 = v17;
  [v19 setOriginalUtterance:v17];
  id v58 = 0;
  v47 = v16;
  v49 = [(id)objc_opt_class() adjustProtoMatchingSpans:v16 tokenChain:v15 outError:&v58];
  id v43 = v58;
  id v21 = objc_alloc(MEMORY[0x263EFF980]);
  __int16 v22 = [v15 tokens];
  v23 = objc_msgSend(v21, "initWithCapacity:", objc_msgSend(v22, "count"));

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v48 = v15;
  v24 = [v15 tokens];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v55 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        if (objc_msgSend(v29, "isWhitespace", v43))
        {
          id v30 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v60 = "+[CDMServiceGraphUtil buildLVCRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteMsg"
                  ":nluRequestId:reformedTurnInput:error:]";
            __int16 v61 = 2112;
            v62 = v29;
            _os_log_impl(&dword_2263A0000, v30, OS_LOG_TYPE_INFO, "%s ignoring whitespace token: %@", buf, 0x16u);
          }
        }
        else
        {
          [v23 addObject:v29];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v26);
  }

  long long v31 = (void *)[v48 copy];
  [v31 setTokens:v23];
  v53 = v31;
  [v19 setTokenChain:v31];
  id v32 = objc_alloc_init(MEMORY[0x263F71E20]);
  [v32 setNluRequestId:v51];
  [v32 setTokenisedUtterance:v19];
  v33 = [MEMORY[0x263EFF980] arrayWithArray:v49];
  [v32 setMatchingSpans:v33];

  [v32 setEmbeddings:v52];
  v34 = [v50 currentTurn];
  [v32 setTurnInput:v34];

  v35 = [v32 turnInput];
  __int16 v36 = [v35 turnContext];
  v37 = [v36 legacyNlContext];

  if ([v37 hasPreviousDomainName])
  {
    int v38 = [v32 turnInput];
    v39 = [v38 turnContext];
    [v39 setLegacyNlContext:v37];
  }
  __int16 v40 = +[CDMServiceGraphUtil overrideInputsFromUtterance:matchingSpans:tokenChain:contextUpdateReformedTurnInputBundle:](CDMServiceGraphUtil, "overrideInputsFromUtterance:matchingSpans:tokenChain:contextUpdateReformedTurnInputBundle:", v46, v47, v48, v50, v43);
  v41 = [[CDMLVCRequestCommand alloc] initWithParserRequest:v32 rewriteMsg:v45 overridesInputs:v40];

  return v41;
}

+ (id)buildPSCRequestWithTokenChain:(id)a3 matchingSpans:(id)a4 utterance:(id)a5 embeddingTensor:(id)a6 rewriteMsg:(id)a7 nluRequestId:(id)a8 currentTurn:(id)a9 error:(id *)a10
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v55 = a7;
  id v19 = a8;
  id v58 = a9;
  uint64_t v20 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v66 = "+[CDMServiceGraphUtil buildPSCRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteMsg:nluRequ"
          "estId:currentTurn:error:]";
    _os_log_impl(&dword_2263A0000, v20, OS_LOG_TYPE_INFO, "%s Building SIRINLUINTERNALITFMITFMParserRequest...", buf, 0xCu);
  }

  id v21 = objc_alloc_init(MEMORY[0x263F71E70]);
  __int16 v22 = +[CDMServiceGraphUtil buildNormalizedUtterance:v15];
  [v21 setNormalisedUtterance:v22];

  long long v57 = v21;
  [v21 setOriginalUtterance:v17];
  [(id)objc_opt_class() filterMatchingSpans:v16 withMatcherName:7];
  long long v54 = v63 = 0;
  v23 = [(id)objc_opt_class() adjustProtoMatchingSpans:v54 tokenChain:v15 outError:&v63];
  id v56 = v63;
  if (v23)
  {
    id v52 = v23;
    v53 = v19;
    id v49 = v17;
    id v50 = v16;
    id v24 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v25 = [v15 tokens];
    uint64_t v26 = objc_msgSend(v24, "initWithCapacity:", objc_msgSend(v25, "count"));

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v51 = v15;
    uint64_t v27 = [v15 tokens];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v60 != v30) {
            objc_enumerationMutation(v27);
          }
          id v32 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          if ([v32 isWhitespace])
          {
            v33 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v66 = "+[CDMServiceGraphUtil buildPSCRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteM"
                    "sg:nluRequestId:currentTurn:error:]";
              __int16 v67 = 2112;
              v68 = v32;
              _os_log_impl(&dword_2263A0000, v33, OS_LOG_TYPE_INFO, "%s ignoring whitespace token: %@", buf, 0x16u);
            }
          }
          else
          {
            [v26 addObject:v32];
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v29);
    }

    id v15 = v51;
    v34 = (void *)[v51 copy];
    [v34 setTokens:v26];
    [v57 setTokenChain:v34];
    id v35 = objc_alloc_init(MEMORY[0x263F71E20]);
    __int16 v36 = [v53 nluRequestId];
    [v35 setRequestId:v36];

    [v35 setNluRequestId:v53];
    [v35 setTokenisedUtterance:v57];
    v37 = [MEMORY[0x263EFF980] arrayWithArray:v23];
    [v35 setMatchingSpans:v37];

    [v35 setEmbeddings:v18];
    [v35 setTurnInput:v58];
    int v38 = [v35 turnInput];
    v39 = [v38 turnContext];
    __int16 v40 = [v39 legacyNlContext];

    if ([v40 hasPreviousDomainName])
    {
      v41 = [v35 turnInput];
      __int16 v42 = [v41 turnContext];
      [v42 setLegacyNlContext:v40];
    }
    id v43 = v55;
    id v44 = [[CDMPSCRequestCommand alloc] initWithParserRequest:v35 rewriteMsg:v55];

    id v17 = v49;
    id v16 = v50;
    v23 = v52;
    id v19 = v53;
    goto LABEL_19;
  }
  v46 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    v48 = [v56 localizedDescription];
    *(_DWORD *)buf = 136315394;
    v66 = "+[CDMServiceGraphUtil buildPSCRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteMsg:nluRequ"
          "estId:currentTurn:error:]";
    __int16 v67 = 2112;
    v68 = v48;
    _os_log_error_impl(&dword_2263A0000, v46, OS_LOG_TYPE_ERROR, "%s [ERR]: Error converting matched spans: %@", buf, 0x16u);
  }
  id v43 = v55;
  if (!a10)
  {
    id v44 = 0;
LABEL_19:
    id v45 = v56;
    goto LABEL_24;
  }
  id v45 = v56;
  id v44 = 0;
  *a10 = v56;
LABEL_24:

  return v44;
}

+ (id)overrideInputsFromUtterance:(id)a3 matchingSpans:(id)a4 tokenChain:(id)a5 contextUpdateReformedTurnInputBundle:(id)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v12 currentTurn];
  long long v31 = v12;
  uint64_t v14 = [v12 previousTurns];
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v16 = objc_alloc_init(MEMORY[0x263F71E88]);
  v34 = v9;
  [v16 setUtterance:v9];
  id v32 = v11;
  [v16 setTokenChain:v11];
  v33 = v10;
  [v16 setMatchingSpans:v10];
  uint64_t v30 = (void *)v13;
  [v16 setTurnInput:v13];
  uint64_t v28 = v16;
  [v15 addObject:v16];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v29 = v14;
  id v17 = [v14 reverseObjectEnumerator];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v17);
        }
        __int16 v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v23 = objc_alloc_init(MEMORY[0x263F71E88]);
        id v24 = [v22 asrOutputs];
        uint64_t v25 = [v24 objectAtIndex:0];
        uint64_t v26 = [v25 utterance];

        [v23 setUtterance:v26];
        [v23 setTurnInput:v22];
        [v15 addObject:v23];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v19);
  }

  return v15;
}

+ (id)buildSNLCProtoRequestWithTokenChain:(id)a3 matchingSpans:(id)a4 utterance:(id)a5 embeddingTensor:(id)a6 rewriteMsg:(id)a7 requestId:(id)a8 currentTurn:(id)a9 error:(id *)a10
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v55 = a6;
  id v54 = a7;
  id v18 = a8;
  id v19 = a9;
  uint64_t v20 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v64 = "+[CDMServiceGraphUtil buildSNLCProtoRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteMsg:r"
          "equestId:currentTurn:error:]";
    _os_log_impl(&dword_2263A0000, v20, OS_LOG_TYPE_INFO, "%s Building SIRINLUINTERNALITFMITFMParserRequest...", buf, 0xCu);
  }

  id v21 = objc_alloc_init(MEMORY[0x263F71E70]);
  __int16 v22 = +[CDMServiceGraphUtil buildNormalizedUtterance:v15];
  [v21 setNormalisedUtterance:v22];

  [v21 setOriginalUtterance:v17];
  id v61 = 0;
  uint64_t v23 = [(id)objc_opt_class() adjustProtoMatchingSpans:v16 tokenChain:v15 outError:&v61];
  id v56 = v61;
  id v52 = (void *)v23;
  id v53 = v19;
  if (v23)
  {
    v47 = v21;
    v48 = v18;
    id v49 = v17;
    id v50 = v16;
    id v24 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v25 = [v15 tokens];
    uint64_t v26 = objc_msgSend(v24, "initWithCapacity:", objc_msgSend(v25, "count"));

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v51 = v15;
    uint64_t v27 = [v15 tokens];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v58 != v30) {
            objc_enumerationMutation(v27);
          }
          id v32 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          if (objc_msgSend(v32, "isWhitespace", v47))
          {
            v33 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              uint64_t v64 = "+[CDMServiceGraphUtil buildSNLCProtoRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:re"
                    "writeMsg:requestId:currentTurn:error:]";
              __int16 v65 = 2112;
              v66 = v32;
              _os_log_impl(&dword_2263A0000, v33, OS_LOG_TYPE_INFO, "%s ignoring whitespace token: %@", buf, 0x16u);
            }
          }
          else
          {
            [v26 addObject:v32];
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v57 objects:v62 count:16];
      }
      while (v29);
    }

    v34 = (void *)[v51 copy];
    [v34 setTokens:v26];
    id v21 = v47;
    [v47 setTokenChain:v34];
    id v35 = objc_alloc_init(MEMORY[0x263F71E20]);
    long long v36 = [v48 nluRequestId];
    [v35 setRequestId:v36];

    [v35 setNluRequestId:v48];
    [v35 setTokenisedUtterance:v47];
    long long v37 = [MEMORY[0x263EFF980] arrayWithArray:v52];
    [v35 setMatchingSpans:v37];

    long long v38 = v55;
    [v35 setEmbeddings:v55];
    v39 = v53;
    [v35 setTurnInput:v53];
    uint64_t v40 = v54;
    v41 = [[CDMSNLCProtoRequestCommand alloc] initWithParserRequest:v35 rewriteMsg:v54];

    id v18 = v48;
    __int16 v42 = v52;

    id v16 = v50;
    id v43 = v51;
    id v17 = v49;
  }
  else
  {
    id v44 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v46 = [v56 localizedDescription];
      *(_DWORD *)buf = 136315394;
      uint64_t v64 = "+[CDMServiceGraphUtil buildSNLCProtoRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:rewriteMsg"
            ":requestId:currentTurn:error:]";
      __int16 v65 = 2112;
      v66 = v46;
      _os_log_error_impl(&dword_2263A0000, v44, OS_LOG_TYPE_ERROR, "%s [ERR]: Error converting matched spans: %@", buf, 0x16u);
    }
    id v43 = v15;

    uint64_t v40 = v54;
    v41 = 0;
    if (a10) {
      *a10 = v56;
    }
    __int16 v42 = 0;
    v39 = v53;
    long long v38 = v55;
  }

  return v41;
}

+ (id)buildNLv4ProtoRequestWithTokenChain:(id)a3 matchingSpans:(id)a4 utterance:(id)a5 embeddingTensor:(id)a6 currentTurn:(id)a7 requestId:(id)a8 outError:(id *)a9
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v31 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a5;
  id v18 = a4;
  id v19 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "+[CDMServiceGraphUtil buildNLv4ProtoRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:currentTurn:"
          "requestId:outError:]";
    _os_log_impl(&dword_2263A0000, v19, OS_LOG_TYPE_INFO, "%s Building SIRINLUINTERNALNLV4_PARSERNLv4ParserRequest...", buf, 0xCu);
  }

  id v20 = objc_alloc_init(MEMORY[0x263F71E60]);
  id v21 = objc_alloc_init(MEMORY[0x263F71E70]);
  __int16 v22 = +[CDMServiceGraphUtil buildNormalizedUtterance:v14];
  [v21 setNormalisedUtterance:v22];

  [v21 setOriginalUtterance:v17];
  uint64_t v23 = +[CDMServiceGraphUtil getNonWhitespaceTokenChain:v14];
  [v21 setTokenChain:v23];

  objc_msgSend(v20, "setMaxNumParses:", +[CDMUserDefaultsUtils readNLv4MaxNumParses](CDMUserDefaultsUtils, "readNLv4MaxNumParses"));
  id v24 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v30 = [v20 maxNumParses];
    *(_DWORD *)buf = 136315394;
    v33 = "+[CDMServiceGraphUtil buildNLv4ProtoRequestWithTokenChain:matchingSpans:utterance:embeddingTensor:currentTurn:"
          "requestId:outError:]";
    __int16 v34 = 2048;
    uint64_t v35 = v30;
    _os_log_debug_impl(&dword_2263A0000, v24, OS_LOG_TYPE_DEBUG, "%s Set nlv4ParserRequest.maxNumParses = %llu", buf, 0x16u);
  }

  uint64_t v25 = [v16 nluRequestId];
  [v20 setRequestId:v25];

  [v20 setNluRequestId:v16];
  [v20 setTokenisedUtterance:v21];
  uint64_t v26 = +[CDMServiceGraphUtil adjustProtoMatchingSpans:v18 tokenChain:v14 outError:a9];

  [v20 setMatchingSpans:v26];
  if (*a9)
  {
    uint64_t v27 = 0;
    uint64_t v28 = v31;
  }
  else
  {
    uint64_t v28 = v31;
    [v20 setEmbeddings:v31];
    [v20 setTurnInput:v15];
    uint64_t v27 = [[CDMNLv4ProtoRequestCommand alloc] initWithParserRequest:v20 requestId:v16];
  }

  return v27;
}

+ (id)adjustProtoMatchingSpans:(id)a3 tokenChain:(id)a4 outError:(id *)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v44;
    *(void *)&long long v10 = 136315906;
    long long v41 = v10;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v44 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v43 + 1) + 8 * v13);
        id v15 = objc_msgSend(v14, "copy", v41);
        unsigned int v16 = [v14 startTokenIndex];
        id v17 = [v7 tokens];
        unint64_t v18 = [v17 count];

        if (v18 <= v16)
        {
          uint64_t v29 = CDMLogContext;
          if (!os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO)) {
            goto LABEL_17;
          }
          *(_DWORD *)buf = 136315650;
          v48 = "+[CDMServiceGraphUtil adjustProtoMatchingSpans:tokenChain:outError:]";
          __int16 v49 = 2112;
          id v50 = @"spanmatch";
          __int16 v51 = 2112;
          v52[0] = v14;
          uint64_t v27 = v29;
          uint64_t v28 = "%s [WARN]: [insights-cdm-%@]:\nInvalid rawTokenIndex on begin token. Span:\n %@";
          goto LABEL_16;
        }
        id v19 = [v7 tokens];
        id v20 = [v19 objectAtIndexedSubscript:v16];
        uint64_t v21 = [v20 nonWhitespaceTokenIndex];

        if ((v21 & 0x80000000) != 0)
        {
          uint64_t v30 = CDMLogContext;
          if (!os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO)) {
            goto LABEL_17;
          }
          *(_DWORD *)buf = 136315650;
          v48 = "+[CDMServiceGraphUtil adjustProtoMatchingSpans:tokenChain:outError:]";
          __int16 v49 = 2112;
          id v50 = @"spanmatch";
          __int16 v51 = 2112;
          v52[0] = v14;
          uint64_t v27 = v30;
          uint64_t v28 = "%s [WARN]: [insights-cdm-%@]:\nInvalid nonWhitespaceTokenIndex on begin token, Span:\n %@";
          goto LABEL_16;
        }
        [v15 setStartTokenIndex:v21];
        unsigned int v22 = [v14 endTokenIndex];
        if (!v22
          || (unint64_t v23 = v22,
              [v7 tokens],
              id v24 = objc_claimAutoreleasedReturnValue(),
              unint64_t v25 = [v24 count],
              v24,
              v25 < v23))
        {
          uint64_t v26 = CDMLogContext;
          if (!os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO)) {
            goto LABEL_17;
          }
          *(_DWORD *)buf = 136315650;
          v48 = "+[CDMServiceGraphUtil adjustProtoMatchingSpans:tokenChain:outError:]";
          __int16 v49 = 2112;
          id v50 = @"spanmatch";
          __int16 v51 = 2112;
          v52[0] = v14;
          uint64_t v27 = v26;
          uint64_t v28 = "%s [WARN]: [insights-cdm-%@]:\nInvalid end token index, Span:\n %@";
          goto LABEL_16;
        }
        id v31 = [v7 tokens];
        id v32 = [v31 objectAtIndexedSubscript:v23 - 1];
        int v33 = [v32 nonWhitespaceTokenIndex];

        if (v33 < 0)
        {
          uint64_t v35 = CDMLogContext;
          if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v48 = "+[CDMServiceGraphUtil adjustProtoMatchingSpans:tokenChain:outError:]";
            __int16 v49 = 2112;
            id v50 = @"spanmatch";
            __int16 v51 = 2112;
            v52[0] = v14;
            uint64_t v27 = v35;
            uint64_t v28 = "%s [WARN]: [insights-cdm-%@]:\nInvalid nonWhitespaceTokenIndex on end inclusive token, Span:\n %@";
LABEL_16:
            _os_log_impl(&dword_2263A0000, v27, OS_LOG_TYPE_INFO, v28, buf, 0x20u);
          }
        }
        else
        {
          [v15 setEndTokenIndex:(v33 + 1)];
          [v42 addObject:v15];
          __int16 v34 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v36 = [v15 label];
            int v37 = [v15 startTokenIndex];
            int v38 = [v15 endTokenIndex];
            *(_DWORD *)buf = v41;
            v48 = "+[CDMServiceGraphUtil adjustProtoMatchingSpans:tokenChain:outError:]";
            __int16 v49 = 2112;
            id v50 = v36;
            __int16 v51 = 1024;
            LODWORD(v52[0]) = v37;
            WORD2(v52[0]) = 1024;
            *(_DWORD *)((char *)v52 + 6) = v38;
            _os_log_debug_impl(&dword_2263A0000, v34, OS_LOG_TYPE_DEBUG, "%s MatchedSpan for NLv4: label %@, startTokenIndex %u, endTokenIndex %u", buf, 0x22u);
          }
        }
LABEL_17:

        ++v13;
      }
      while (v11 != v13);
      uint64_t v39 = [v8 countByEnumeratingWithState:&v43 objects:v53 count:16];
      uint64_t v11 = v39;
    }
    while (v39);
  }

  return v42;
}

+ (BOOL)spanHasMatcherName:(int)a3 matchingSpan:(id)a4
{
  id v5 = a4;
  if ([v5 matcherNamesCount])
  {
    uint64_t v6 = 0;
    while (1)
    {
      int v7 = [v5 matcherNamesAtIndex:v6];
      BOOL v8 = v7 == a3;
      if (v7 == a3) {
        break;
      }
      if (++v6 >= (unint64_t)[v5 matcherNamesCount]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)buildNormalizedUtterance:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F089D8] string];
  id v5 = [v3 tokens];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      BOOL v8 = [v3 tokens];
      uint64_t v9 = [v8 objectAtIndexedSubscript:v7];
      int v10 = [v9 hasCleanValue];

      uint64_t v11 = [v3 tokens];
      uint64_t v12 = [v11 objectAtIndexedSubscript:v7];
      uint64_t v13 = v12;
      if (v10) {
        [v12 cleanValue];
      }
      else {
      id v14 = [v12 value];
      }
      [v4 appendString:v14];

      ++v7;
      id v15 = [v3 tokens];
      unint64_t v16 = [v15 count];
    }
    while (v7 < v16);
  }

  return v4;
}

+ (id)buildRepetitionResult:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F71D10]);
  [v4 setAsrHypothesisIndex:0];
  [v4 setRepetitionType:0];
  if (v3)
  {
    id v5 = [v3 response];
    int v6 = [v5 repetitionType];

    if (v6 == 3) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 1;
    }
    [v4 setRepetitionType:v7];
  }

  return v4;
}

+ (void)addDebugInfo:(id)a3 nluRequest:(id)a4 responseObject:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  if (+[CDMServiceGraphUtil debugInfoEnabled:a4])
  {
    uint64_t v9 = [v8 commandName];
    int v10 = [v8 description];
    [v7 appendFormat:@"%@%@\n%@", @"\n\n   ➡️  ", v9, v10];
  }
  else
  {
    uint64_t v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = "+[CDMServiceGraphUtil addDebugInfo:nluRequest:responseObject:]";
      __int16 v13 = 2112;
      id v14 = @"debug-mode-id";
      _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s Early return and skip adding debugText as idAsString is not the special %@", buf, 0x16u);
    }
  }
}

+ (BOOL)debugInfoEnabled:(id)a3
{
  id v3 = a3;
  if (+[CDMPlatformUtils isInternalInstall])
  {
    id v4 = [v3 requestId];
    id v5 = [v4 idA];
    char v6 = [v5 isEqualToString:@"debug-mode-id"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (id)extractReferenceResolutionUtterances:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v17 = v3;
  id v5 = [v3 rewriteHypotheses];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = objc_alloc_init(MEMORY[0x263F71ED0]);
        uint64_t v12 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          __int16 v13 = [v10 utterance];
          *(_DWORD *)buf = 136315394;
          unint64_t v23 = "+[CDMServiceGraphUtil extractReferenceResolutionUtterances:]";
          __int16 v24 = 2112;
          unint64_t v25 = v13;
          _os_log_impl(&dword_2263A0000, v12, OS_LOG_TYPE_INFO, "%s Rewritten Utterance (reference resolution): %@", buf, 0x16u);
        }
        id v14 = [v10 utterance];
        [v11 setUtterance:v14];

        [v11 setNluInternalTokens:0];
        [v11 setAsrId:0];
        [v11 setConfidence:0.0];
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v7);
  }

  uint64_t v15 = (void *)[v4 copy];
  return v15;
}

+ (id)prepareCcqrServiceRequest:(id)a3 currentTurnAsrConf:(double)a4 tokenResponse:(id)a5 previousTurnsAsrConf:(id)a6 previousTurnTokenizationResponseCommand:(id)a7 nluRequestId:(id)a8 resultCandidateId:(id)a9 cdmRequestId:(id)a10
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v85 = a3;
  id v79 = a5;
  id v86 = a6;
  id v16 = a7;
  id v78 = a8;
  id v77 = a9;
  id v76 = a10;
  id v17 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v106 = "+[CDMServiceGraphUtil prepareCcqrServiceRequest:currentTurnAsrConf:tokenResponse:previousTurnsAsrConf:previou"
           "sTurnTokenizationResponseCommand:nluRequestId:resultCandidateId:cdmRequestId:]";
    _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s Creating CDMQRRequestCommand for use in CCQR Service", buf, 0xCu);
  }

  v84 = [MEMORY[0x263EFF980] array];
  long long v18 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v106 = "+[CDMServiceGraphUtil prepareCcqrServiceRequest:currentTurnAsrConf:tokenResponse:previousTurnsAsrConf:previou"
           "sTurnTokenizationResponseCommand:nluRequestId:resultCandidateId:cdmRequestId:]";
    _os_log_debug_impl(&dword_2263A0000, v18, OS_LOG_TYPE_DEBUG, "%s 1. Constructing previous interactions", buf, 0xCu);
  }

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  obuint64_t j = [v16 responses];
  uint64_t v83 = [obj countByEnumeratingWithState:&v96 objects:v104 count:16];
  if (v83)
  {
    LODWORD(v19) = 0;
    uint64_t v82 = *(void *)v97;
    id v81 = v16;
    while (2)
    {
      uint64_t v20 = 0;
      unint64_t v19 = (int)v19;
      do
      {
        if (*(void *)v97 != v82) {
          objc_enumerationMutation(obj);
        }
        long long v21 = *(void **)(*((void *)&v96 + 1) + 8 * v20);
        id v22 = objc_alloc_init(MEMORY[0x263F71ED0]);
        unint64_t v23 = [v21 text];
        [v22 setUtterance:v23];

        [v22 setAsrId:0];
        [v22 setConfidence:1000.0];
        if ([v86 count] > v19)
        {
          __int16 v24 = [v86 objectAtIndex:v19];
          [v24 doubleValue];
          objc_msgSend(v22, "setConfidence:");
        }
        unint64_t v25 = objc_msgSend(v21, "tokenChain", v76);
        uint64_t v26 = [v25 tokens];
        [v22 setNluInternalTokens:v26];

        uint64_t v27 = [v16 previousSiriResponseTokenResponses];
        unint64_t v28 = [v27 count];

        if (v28 <= v19)
        {
          long long v44 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v106 = "+[CDMServiceGraphUtil prepareCcqrServiceRequest:currentTurnAsrConf:tokenResponse:previousTurnsAsrConf"
                   ":previousTurnTokenizationResponseCommand:nluRequestId:resultCandidateId:cdmRequestId:]";
            _os_log_impl(&dword_2263A0000, v44, OS_LOG_TYPE_INFO, "%s [WARN]: Missing previous Siri response! Attempted to access index exceeding number of previous Siri responses.", buf, 0xCu);
          }

          goto LABEL_26;
        }
        id v29 = objc_alloc_init(MEMORY[0x263F71EC0]);
        v87 = v22;
        id v103 = v22;
        uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v103 count:1];
        id v31 = (void *)[v30 copy];
        [v29 setOriginalUtterances:v31];

        id v32 = [v16 previousSiriResponseTokenResponses];
        int v33 = [v32 objectAtIndex:v19];

        __int16 v34 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v33, "count"));
        [v29 setSiriResponses:v34];

        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        id v35 = v33;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v92 objects:v102 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v93;
          do
          {
            for (uint64_t i = 0; i != v37; ++i)
            {
              if (*(void *)v93 != v38) {
                objc_enumerationMutation(v35);
              }
              uint64_t v40 = *(void **)(*((void *)&v92 + 1) + 8 * i);
              long long v41 = [v29 siriResponses];
              id v42 = [v40 tokenChain];
              long long v43 = [v42 tokens];
              [v41 addObjectsFromArray:v43];
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v92 objects:v102 count:16];
          }
          while (v37);
        }

        [v29 setLocale:v85];
        [v84 addObject:v29];
        ++v19;

        ++v20;
        id v16 = v81;
      }
      while (v20 != v83);
      uint64_t v83 = [obj countByEnumeratingWithState:&v96 objects:v104 count:16];
      if (v83) {
        continue;
      }
      break;
    }
  }
LABEL_26:

  long long v45 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v106 = "+[CDMServiceGraphUtil prepareCcqrServiceRequest:currentTurnAsrConf:tokenResponse:previousTurnsAsrConf:previou"
           "sTurnTokenizationResponseCommand:nluRequestId:resultCandidateId:cdmRequestId:]";
    _os_log_debug_impl(&dword_2263A0000, v45, OS_LOG_TYPE_DEBUG, "%s 2. Constructing current interactions", buf, 0xCu);
  }

  id v46 = objc_alloc_init(MEMORY[0x263F71ED0]);
  v47 = [v79 text];
  [v46 setUtterance:v47];

  v48 = [v79 tokenChain];
  __int16 v49 = [v48 tokens];
  [v46 setNluInternalTokens:v49];

  [v46 setAsrId:0];
  [v46 setConfidence:a4];
  id v50 = objc_alloc_init(MEMORY[0x263F71EC0]);
  id v101 = v46;
  __int16 v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v101 count:1];
  id v52 = (void *)[v51 copy];
  [v50 setOriginalUtterances:v52];

  id v53 = [v16 responses];
  unint64_t v54 = [v53 count];

  id v55 = [v16 previousSiriResponseTokenResponses];
  unint64_t v56 = [v55 count];

  if (v56 <= v54)
  {
    v72 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v106 = "+[CDMServiceGraphUtil prepareCcqrServiceRequest:currentTurnAsrConf:tokenResponse:previousTurnsAsrConf:previ"
             "ousTurnTokenizationResponseCommand:nluRequestId:resultCandidateId:cdmRequestId:]";
      _os_log_impl(&dword_2263A0000, v72, OS_LOG_TYPE_INFO, "%s [WARN]: Missing previous Siri response! Attempted to access index exceeding number of previous Siri responses.", buf, 0xCu);
    }

    id v63 = [MEMORY[0x263EFF980] array];
    [v50 setSiriResponses:v63];
  }
  else
  {
    long long v57 = [v16 previousSiriResponseTokenResponses];
    unint64_t v58 = [v57 count];

    if (v58 > v54 + 1)
    {
      long long v59 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v106 = "+[CDMServiceGraphUtil prepareCcqrServiceRequest:currentTurnAsrConf:tokenResponse:previousTurnsAsrConf:pre"
               "viousTurnTokenizationResponseCommand:nluRequestId:resultCandidateId:cdmRequestId:]";
        _os_log_impl(&dword_2263A0000, v59, OS_LOG_TYPE_INFO, "%s [WARN]: Missing previous user utterance!", buf, 0xCu);
      }
    }
    long long v60 = objc_msgSend(v16, "previousSiriResponseTokenResponses", v76);
    id v61 = [v60 objectAtIndex:v54];

    long long v62 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v61, "count"));
    [v50 setSiriResponses:v62];

    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v63 = v61;
    uint64_t v64 = [v63 countByEnumeratingWithState:&v88 objects:v100 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v89;
      do
      {
        for (uint64_t j = 0; j != v65; ++j)
        {
          if (*(void *)v89 != v66) {
            objc_enumerationMutation(v63);
          }
          v68 = *(void **)(*((void *)&v88 + 1) + 8 * j);
          uint64_t v69 = [v50 siriResponses];
          v70 = [v68 tokenChain];
          v71 = [v70 tokens];
          [v69 addObjectsFromArray:v71];
        }
        uint64_t v65 = [v63 countByEnumeratingWithState:&v88 objects:v100 count:16];
      }
      while (v65);
    }
  }
  [v50 setLocale:v85];
  [v84 addObject:v50];
  id v73 = objc_alloc_init(MEMORY[0x263F71EA8]);
  [v73 setResultCandidateId:v77];
  [v73 setNluRequestId:v78];
  [v73 setOriginalInteractions:v84];
  [v73 setCdmRequestId:v76];
  v74 = [[CDMQRRequestCommand alloc] initWithQRRequest:v73];

  return v74;
}

+ (BOOL)runUaaPNLProtoService:(id)a3 requestId:(id)a4 utterance:(id)a5 locale:(id)a6 tokenChain:(id)a7 matchingSpans:(id)a8 embeddingTensor:(id)a9 currentTurn:(id)a10 outUaapProtoRequest:(id *)a11 outUaapProtoResponse:(id *)a12 outError:(id *)a13
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v47 = a3;
  id v46 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v48 = a10;
  unint64_t v19 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v54 = "+[CDMServiceGraphUtil runUaaPNLProtoService:requestId:utterance:locale:tokenChain:matchingSpans:embeddingTenso"
          "r:currentTurn:outUaapProtoRequest:outUaapProtoResponse:outError:]";
    _os_log_debug_impl(&dword_2263A0000, v19, OS_LOG_TYPE_DEBUG, "%s Creating SIRINLUINTERNALUAAP_PARSERUaaPParserRequest for use in CDMUaaPNLProtoService", buf, 0xCu);
  }

  id v20 = objc_alloc_init(MEMORY[0x263F71F30]);
  long long v45 = v16;
  [v20 setTokenChain:v16];
  long long v44 = v18;
  [v20 setEmbeddings:v18];
  long long v21 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v17, "count"));
  [v20 setMatchingSpans:v21];

  objc_msgSend(v20, "setMaxNumParses:", +[CDMUserDefaultsUtils readUaaPNLMaxNumParses](CDMUserDefaultsUtils, "readUaaPNLMaxNumParses"));
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v22 = v17;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v50 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        unint64_t v28 = [v20 matchingSpans];
        id v29 = (void *)[v27 copy];
        [v28 addObject:v29];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v24);
  }

  [v20 setTurnInput:v48];
  uint64_t v30 = v46;
  id v31 = [[CDMUaaPNLProtoRequestCommand alloc] initWithParserRequest:v20 requestId:v46];
  *a11 = v31;
  id v32 = v47;
  id v33 = [v47 handle:v31];
  id v34 = v33;
  *a12 = v33;
  if (a13 && !v33)
  {
    id v35 = NSString;
    uint64_t v36 = [*a13 userInfo];
    uint64_t v37 = *MEMORY[0x263F08320];
    uint64_t v38 = [v36 objectForKeyedSubscript:*MEMORY[0x263F08320]];
    uint64_t v39 = [v35 stringWithFormat:@"Hit error running uaap protobuf inference: no response populated. Internal error: %@", v38];

    uint64_t v40 = (void *)MEMORY[0x263F087E8];
    uint64_t v57 = v37;
    unint64_t v58 = v39;
    long long v41 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
    *a13 = [v40 errorWithDomain:@"uaapProtoService" code:1 userInfo:v41];

    id v42 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v54 = "+[CDMServiceGraphUtil runUaaPNLProtoService:requestId:utterance:locale:tokenChain:matchingSpans:embeddingTen"
            "sor:currentTurn:outUaapProtoRequest:outUaapProtoResponse:outError:]";
      __int16 v55 = 2112;
      unint64_t v56 = v39;
      _os_log_error_impl(&dword_2263A0000, v42, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    uint64_t v30 = v46;
    id v32 = v47;
  }

  return v34 != 0;
}

+ (id)getNonWhitespaceTokenChain:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263EFF980]);
  id v5 = [v3 tokens];
  uint64_t v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v3 tokens];
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
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 isWhitespace])
        {
          __int16 v13 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            long long v21 = "+[CDMServiceGraphUtil getNonWhitespaceTokenChain:]";
            __int16 v22 = 2112;
            uint64_t v23 = v12;
            _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s ignoring whitespace token: %@", buf, 0x16u);
          }
        }
        else
        {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v9);
  }

  id v14 = (void *)[v3 copy];
  [v14 setTokens:v6];

  return v14;
}

+ (id)prepareCcqrTokens:(id)a3 currentTurn:(id)a4 previousTurns:(id)a5 utterance:(id)a6 locale:(id)a7
{
  uint64_t v168 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v116 = a4;
  id v11 = a5;
  id v12 = a7;
  __int16 v13 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v164 = "+[CDMServiceGraphUtil prepareCcqrTokens:currentTurn:previousTurns:utterance:locale:]";
    _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s Creating CDMTokenizationProtoRequestCommand for use of PreviousTurn SiriResponse", buf, 0xCu);
  }

  v117 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v120 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v153 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  obuint64_t j = v11;
  id v121 = v10;
  uint64_t v122 = [obj countByEnumeratingWithState:&v153 objects:v167 count:16];
  id v128 = v12;
  if (v122)
  {
    uint64_t v119 = *(void *)v154;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v154 != v119) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v153 + 1) + 8 * v14);
        uint64_t v16 = objc_msgSend(v15, "asrOutputs", v116);
        if (v16)
        {
          long long v17 = (void *)v16;
          long long v18 = [v15 asrOutputs];
          uint64_t v19 = [v18 count];

          if (v19)
          {
            id v20 = [v15 asrOutputs];
            long long v21 = [v20 objectAtIndexedSubscript:0];
            __int16 v22 = [v21 utterance];

            uint64_t v23 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v164 = "+[CDMServiceGraphUtil prepareCcqrTokens:currentTurn:previousTurns:utterance:locale:]";
              __int16 v165 = 2112;
              v166 = v22;
              _os_log_debug_impl(&dword_2263A0000, v23, OS_LOG_TYPE_DEBUG, "%s Extracted from NluRequest.previousTurnInputs, previous asr hypo: %@", buf, 0x16u);
            }

            uint64_t v24 = +[CDMTokenizerProtoService createProtoTokenRequestWithText:v22 locale:v12];
            uint64_t v25 = [v10 handle:v24];
            uint64_t v26 = [v25 response];
            [v117 addObject:v26];
          }
        }
        uint64_t v123 = v14;
        id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
        unint64_t v28 = [v15 turnContext];
        id v29 = [v28 nlContext];
        uint64_t v30 = [v29 systemDialogActs];

        id v31 = [v15 turnContext];
        id v32 = [v31 legacyNlContext];

        id v33 = objc_alloc(MEMORY[0x263EFF980]);
        id v34 = [v32 renderedTexts];
        id v35 = objc_msgSend(v33, "initWithCapacity:", objc_msgSend(v34, "count"));

        v126 = v32;
        uint64_t v36 = [v32 renderedTexts];
        v124 = v30;
        if (v36)
        {
          uint64_t v37 = (void *)v36;
          uint64_t v38 = [v32 renderedTexts];
          uint64_t v39 = [v38 count];

          if (v39)
          {
            long long v151 = 0u;
            long long v152 = 0u;
            long long v149 = 0u;
            long long v150 = 0u;
            uint64_t v40 = [v126 renderedTexts];
            uint64_t v41 = [v40 countByEnumeratingWithState:&v149 objects:v162 count:16];
            if (v41)
            {
              uint64_t v42 = v41;
              uint64_t v43 = *(void *)v150;
              do
              {
                for (uint64_t i = 0; i != v42; ++i)
                {
                  if (*(void *)v150 != v43) {
                    objc_enumerationMutation(v40);
                  }
                  long long v45 = *(void **)(*((void *)&v149 + 1) + 8 * i);
                  id v46 = [v45 value];
                  if (v46)
                  {
                    id v47 = [v45 value];
                    [v27 addObject:v47];
                  }
                  else
                  {
                    [v27 addObject:&stru_26DA24FF0];
                  }

                  id v48 = CDMOSLoggerForCategory(0);
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                  {
                    long long v49 = [v27 lastObject];
                    *(_DWORD *)buf = 136315394;
                    v164 = "+[CDMServiceGraphUtil prepareCcqrTokens:currentTurn:previousTurns:utterance:locale:]";
                    __int16 v165 = 2112;
                    v166 = v49;
                    _os_log_debug_impl(&dword_2263A0000, v48, OS_LOG_TYPE_DEBUG, "%s Extracted from NluRequest.previousTurnInputs.turnContext.legacyNlContext, previous rendered text: %@", buf, 0x16u);
                  }
                }
                uint64_t v42 = [v40 countByEnumeratingWithState:&v149 objects:v162 count:16];
              }
              while (v42);
            }

            id v10 = v121;
            uint64_t v30 = v124;
          }
        }
        if (v30 && [v30 count])
        {
          long long v147 = 0u;
          long long v148 = 0u;
          long long v145 = 0u;
          long long v146 = 0u;
          id v50 = v30;
          uint64_t v51 = [v50 countByEnumeratingWithState:&v145 objects:v161 count:16];
          if (v51)
          {
            uint64_t v52 = v51;
            uint64_t v53 = *(void *)v146;
            do
            {
              for (uint64_t j = 0; j != v52; ++j)
              {
                if (*(void *)v146 != v53) {
                  objc_enumerationMutation(v50);
                }
                __int16 v55 = *(void **)(*((void *)&v145 + 1) + 8 * j);
                if ([v27 count])
                {
                  unint64_t v56 = CDMOSLoggerForCategory(0);
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315138;
                    v164 = "+[CDMServiceGraphUtil prepareCcqrTokens:currentTurn:previousTurns:utterance:locale:]";
                    _os_log_impl(&dword_2263A0000, v56, OS_LOG_TYPE_INFO, "%s [WARN]: NLConetext and legcyNLContext both exists", buf, 0xCu);
                  }
                }
                uint64_t v57 = [v55 renderedText];
                unint64_t v58 = [v57 value];
                if (v58)
                {
                  long long v59 = [v55 renderedText];
                  uint64_t v60 = [v59 value];
                  [v27 addObject:v60];
                }
                else
                {
                  [v27 addObject:&stru_26DA24FF0];
                }

                id v61 = CDMOSLoggerForCategory(0);
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
                {
                  long long v62 = [v27 lastObject];
                  *(_DWORD *)buf = 136315394;
                  v164 = "+[CDMServiceGraphUtil prepareCcqrTokens:currentTurn:previousTurns:utterance:locale:]";
                  __int16 v165 = 2112;
                  v166 = v62;
                  _os_log_debug_impl(&dword_2263A0000, v61, OS_LOG_TYPE_DEBUG, "%s Extracted from NluRequest.previousTurnInputs.turnContext.nlContext, previous rendered text: %@", buf, 0x16u);
                }
                id v12 = v128;
              }
              uint64_t v52 = [v50 countByEnumeratingWithState:&v145 objects:v161 count:16];
            }
            while (v52);
          }

          id v10 = v121;
        }
        long long v143 = 0u;
        long long v144 = 0u;
        long long v141 = 0u;
        long long v142 = 0u;
        id v63 = v27;
        uint64_t v64 = [v63 countByEnumeratingWithState:&v141 objects:v160 count:16];
        if (v64)
        {
          uint64_t v65 = v64;
          uint64_t v66 = *(void *)v142;
          do
          {
            for (uint64_t k = 0; k != v65; ++k)
            {
              if (*(void *)v142 != v66) {
                objc_enumerationMutation(v63);
              }
              v68 = +[CDMTokenizerProtoService createProtoTokenRequestWithText:*(void *)(*((void *)&v141 + 1) + 8 * k) locale:v12];
              uint64_t v69 = [v10 handle:v68];
              v70 = [v69 response];
              [v35 addObject:v70];
            }
            uint64_t v65 = [v63 countByEnumeratingWithState:&v141 objects:v160 count:16];
          }
          while (v65);
        }

        [v120 addObject:v35];
        uint64_t v14 = v123 + 1;
      }
      while (v123 + 1 != v122);
      uint64_t v122 = [obj countByEnumeratingWithState:&v153 objects:v167 count:16];
    }
    while (v122);
  }

  id v71 = objc_alloc_init(MEMORY[0x263EFF980]);
  v72 = [v116 turnContext];
  id v73 = [v72 nlContext];
  v127 = [v73 systemDialogActs];

  v74 = [v116 turnContext];
  v75 = [v74 legacyNlContext];

  id v76 = objc_alloc(MEMORY[0x263EFF980]);
  id v77 = [v75 renderedTexts];
  id v78 = objc_msgSend(v76, "initWithCapacity:", objc_msgSend(v77, "count"));

  uint64_t v79 = [v75 renderedTexts];
  v125 = v75;
  if (v79)
  {
    v80 = (void *)v79;
    id v81 = [v75 renderedTexts];
    uint64_t v82 = [v81 count];

    if (v82)
    {
      long long v139 = 0u;
      long long v140 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      uint64_t v83 = [v75 renderedTexts];
      uint64_t v84 = [v83 countByEnumeratingWithState:&v137 objects:v159 count:16];
      if (v84)
      {
        uint64_t v85 = v84;
        uint64_t v86 = *(void *)v138;
        do
        {
          for (uint64_t m = 0; m != v85; ++m)
          {
            if (*(void *)v138 != v86) {
              objc_enumerationMutation(v83);
            }
            long long v88 = *(void **)(*((void *)&v137 + 1) + 8 * m);
            long long v89 = objc_msgSend(v88, "value", v116);
            if (v89)
            {
              long long v90 = [v88 value];
              [v78 addObject:v90];
            }
            else
            {
              [v78 addObject:&stru_26DA24FF0];
            }

            long long v91 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
            {
              long long v92 = [v78 lastObject];
              *(_DWORD *)buf = 136315394;
              v164 = "+[CDMServiceGraphUtil prepareCcqrTokens:currentTurn:previousTurns:utterance:locale:]";
              __int16 v165 = 2112;
              v166 = v92;
              _os_log_debug_impl(&dword_2263A0000, v91, OS_LOG_TYPE_DEBUG, "%s Extracted from NluRequest.currentTurnInput.turnContext.legacyNlContext, current rendered text: %@", buf, 0x16u);
            }
          }
          uint64_t v85 = [v83 countByEnumeratingWithState:&v137 objects:v159 count:16];
        }
        while (v85);
      }

      id v10 = v121;
      id v12 = v128;
    }
  }
  if (v127 && [v127 count])
  {
    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    id v93 = v127;
    uint64_t v94 = [v93 countByEnumeratingWithState:&v133 objects:v158 count:16];
    if (v94)
    {
      uint64_t v95 = v94;
      uint64_t v96 = *(void *)v134;
      do
      {
        for (uint64_t n = 0; n != v95; ++n)
        {
          if (*(void *)v134 != v96) {
            objc_enumerationMutation(v93);
          }
          long long v98 = *(void **)(*((void *)&v133 + 1) + 8 * n);
          if (objc_msgSend(v78, "count", v116))
          {
            long long v99 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v164 = "+[CDMServiceGraphUtil prepareCcqrTokens:currentTurn:previousTurns:utterance:locale:]";
              _os_log_impl(&dword_2263A0000, v99, OS_LOG_TYPE_INFO, "%s [WARN]: NLConetext and legcyNLContext both exists", buf, 0xCu);
            }
          }
          v100 = [v98 renderedText];
          id v101 = [v100 value];
          if (v101)
          {
            v102 = [v98 renderedText];
            id v103 = [v102 value];
            [v78 addObject:v103];

            id v10 = v121;
          }
          else
          {
            [v78 addObject:&stru_26DA24FF0];
          }

          v104 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
          {
            v105 = [v78 lastObject];
            *(_DWORD *)buf = 136315394;
            v164 = "+[CDMServiceGraphUtil prepareCcqrTokens:currentTurn:previousTurns:utterance:locale:]";
            __int16 v165 = 2112;
            v166 = v105;
            _os_log_debug_impl(&dword_2263A0000, v104, OS_LOG_TYPE_DEBUG, "%s Extracted from NluRequest.currentTurnInput.turnContext.nlContext, current rendered text: %@", buf, 0x16u);
          }
        }
        uint64_t v95 = [v93 countByEnumeratingWithState:&v133 objects:v158 count:16];
      }
      while (v95);
    }

    id v12 = v128;
  }
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  id v106 = v78;
  uint64_t v107 = [v106 countByEnumeratingWithState:&v129 objects:v157 count:16];
  if (v107)
  {
    uint64_t v108 = v107;
    uint64_t v109 = *(void *)v130;
    do
    {
      for (iuint64_t i = 0; ii != v108; ++ii)
      {
        if (*(void *)v130 != v109) {
          objc_enumerationMutation(v106);
        }
        v111 = +[CDMTokenizerProtoService createProtoTokenRequestWithText:locale:](CDMTokenizerProtoService, "createProtoTokenRequestWithText:locale:", *(void *)(*((void *)&v129 + 1) + 8 * ii), v12, v116);
        v112 = [v10 handle:v111];
        v113 = [v112 response];
        [v71 addObject:v113];
      }
      uint64_t v108 = [v106 countByEnumeratingWithState:&v129 objects:v157 count:16];
    }
    while (v108);
  }

  [v120 addObject:v71];
  v114 = [[CDMTokenizationProtoResponseCommand alloc] initWithPreviousResponses:v117 withPreviousSiriResponse:v120];

  return v114;
}

+ (id)runCcqrService:(id)a3 nluRequest:(id)a4 tokenResponse:(id)a5 previousTurnTokenizationResponseCommand:(id)a6 rdResponse:(id)a7 requestLink:(id)a8 locale:(id)a9
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v61 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = [v15 currentTurnInput];
  if ([v20 tapToEdit])
  {

LABEL_4:
    uint64_t v24 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v63 = "+[CDMServiceGraphUtil runCcqrService:nluRequest:tokenResponse:previousTurnTokenizationResponseCommand:rdResp"
            "onse:requestLink:locale:]";
      _os_log_debug_impl(&dword_2263A0000, v24, OS_LOG_TYPE_DEBUG, "%s Current Turn is Tap2Edit or Current Context isn't expected, skipping CCQR", buf, 0xCu);
    }
    uint64_t v25 = 0;
LABEL_7:
    uint64_t v26 = v61;
    goto LABEL_8;
  }
  long long v21 = [v15 currentTurnInput];
  __int16 v22 = [v21 turnContext];
  BOOL v23 = +[CDMCcqrAerCbRService suppressCcqrUsingCurContext:v22];

  if (v23) {
    goto LABEL_4;
  }
  unint64_t v28 = [v15 previousTurnInputs];
  uint64_t v29 = [v28 count];

  id v59 = v16;
  id v60 = v19;
  id v58 = v17;
  if (v29)
  {
    uint64_t v24 = objc_opt_new();
    uint64_t v30 = [v15 currentTurnInput];
    [v24 setCurrentTurn:v30];

    id v31 = [v15 previousTurnInputs];
    [v24 setPreviousTurns:v31];

    [v24 setType:0];
    id v32 = [v15 currentTurnInput];
    id v33 = [v32 asrOutputs];
    id v34 = [v33 firstObject];
    id v35 = [v34 utterance];
    [v16 tokenChain];
    v37 = uint64_t v36 = v14;
    uint64_t v38 = +[CDMServiceGraphUtil overrideInputsFromUtterance:v35 matchingSpans:0 tokenChain:v37 contextUpdateReformedTurnInputBundle:v24];

    id v14 = v36;
    uint64_t v39 = v38;
    uint64_t v40 = [v36 match:v38];
    if (v40)
    {
      uint64_t v25 = (void *)v40;
      uint64_t v41 = CDMOSLoggerForCategory(0);
      id v17 = v58;
      id v19 = v60;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        __int16 v55 = [v25 qrResponse];
        *(_DWORD *)buf = 136315394;
        id v63 = "+[CDMServiceGraphUtil runCcqrService:nluRequest:tokenResponse:previousTurnTokenizationResponseCommand:rdRe"
              "sponse:requestLink:locale:]";
        __int16 v64 = 2112;
        uint64_t v65 = v55;
        _os_log_debug_impl(&dword_2263A0000, v41, OS_LOG_TYPE_DEBUG, "%s Found override match. Return pre-defined match result %@", buf, 0x16u);

        id v19 = v60;
      }

      id v16 = v59;
      goto LABEL_7;
    }
  }
  uint64_t v57 = v14;
  uint64_t v42 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v63 = "+[CDMServiceGraphUtil runCcqrService:nluRequest:tokenResponse:previousTurnTokenizationResponseCommand:rdRespon"
          "se:requestLink:locale:]";
    _os_log_debug_impl(&dword_2263A0000, v42, OS_LOG_TYPE_DEBUG, "%s The current turn is NOT Tap2Edit Request, nor override matching, Running CCQR inference", buf, 0xCu);
  }

  unint64_t v56 = [v15 currentTurnInput];
  uint64_t v43 = [v56 asrOutputs];
  long long v44 = [v43 firstObject];
  [v44 probability];
  double v46 = v45;
  id v47 = [v15 previousTurnInputs];
  id v48 = +[CDMServiceGraphUtil extractPrevTurnsAsrConfidence:v47];
  long long v49 = [v18 nlId];
  id v50 = [v18 resultCandidateId];
  uint64_t v51 = [v15 requestId];
  uint64_t v24 = +[CDMServiceGraphUtil prepareCcqrServiceRequest:v60 currentTurnAsrConf:v59 tokenResponse:v48 previousTurnsAsrConf:v58 previousTurnTokenizationResponseCommand:v49 nluRequestId:v50 resultCandidateId:v46 cdmRequestId:v51];

  id v14 = v57;
  uint64_t v25 = [v57 handle:v24];
  if (+[CDMFeatureFlags isCbrUnrestrictedByRDEnabled])
  {
    id v17 = v58;
    id v16 = v59;
    uint64_t v26 = v61;
  }
  else
  {
    uint64_t v52 = [v25 rewriteMsg];
    id v16 = v59;
    uint64_t v26 = v61;
    if ([v52 rewriteType] == 2)
    {
      uint64_t v53 = [v61 response];
      int v54 = [v53 repetitionType];

      if (v54 != 2) {
        [v25 setRewriteMsg:0];
      }
    }
    else
    {
    }
    id v17 = v58;
  }
  id v19 = v60;
LABEL_8:

  return v25;
}

+ (id)extractPrevTurnsAsrConfidence:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if (v3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "asrOutputs", (void)v16);
          id v11 = [v10 firstObject];
          [v11 probability];
          double v13 = v12;

          id v14 = [NSNumber numberWithDouble:v13];
          [v4 addObject:v14];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

@end