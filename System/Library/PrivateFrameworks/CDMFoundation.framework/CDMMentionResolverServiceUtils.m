@interface CDMMentionResolverServiceUtils
+ (id)buildMRRequestWithCurTurn:(id)a3 tokenChain:(id)a4 mdResponse:(id)a5 contextualSpanMatcherResponse:(id)a6 embedding:(id)a7 utterance:(id)a8 turnIndex:(unint64_t)a9 nluRequestId:(id)a10 resultCandidateId:(id)a11 cdmRequestId:(id)a12;
+ (id)includeWhitespaceInIndices:(id)a3 tokenchain:(id)a4;
+ (void)logMRRequestToFile:(id)a3;
+ (void)logMRResponseToFile:(id)a3;
@end

@implementation CDMMentionResolverServiceUtils

+ (void)logMRResponseToFile:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (+[CDMFeatureFlags isLogNluEnabled])
  {
    if (v3)
    {
      id v7 = 0;
      v4 = +[CDMNluLogUtil writeMRResponseToDisk:v3 error:&v7];
      id v5 = v7;

      if (v4)
      {
LABEL_10:

        goto LABEL_11;
      }
      v6 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v9 = "+[CDMMentionResolverServiceUtils logMRResponseToFile:]";
        __int16 v10 = 2112;
        id v11 = v5;
        _os_log_error_impl(&dword_2263A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Error logging mr response to file: %@", buf, 0x16u);
      }
    }
    else
    {
      v6 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v9 = "+[CDMMentionResolverServiceUtils logMRResponseToFile:]";
        _os_log_debug_impl(&dword_2263A0000, v6, OS_LOG_TYPE_DEBUG, "%s nil mr response, not writing to tmp", buf, 0xCu);
      }
      id v5 = 0;
    }

    goto LABEL_10;
  }
LABEL_11:
}

+ (void)logMRRequestToFile:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (+[CDMFeatureFlags isLogNluEnabled])
  {
    id v7 = 0;
    v4 = +[CDMNluLogUtil writeMRRequestToDisk:v3 error:&v7];
    id v5 = v7;

    if (!v4)
    {
      v6 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v9 = "+[CDMMentionResolverServiceUtils logMRRequestToFile:]";
        __int16 v10 = 2112;
        id v11 = v5;
        _os_log_error_impl(&dword_2263A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Error logging mr request to file: %@", buf, 0x16u);
      }
    }
  }
}

+ (id)includeWhitespaceInIndices:(id)a3 tokenchain:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  id v8 = 0;
  if (v5 && v6)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = [v5 mentions];
    uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      id v25 = v5;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          unsigned int v14 = objc_msgSend(v13, "startTokenIndex", v25);
          unint64_t v15 = [v13 endTokenIndex] - 1;
          v16 = [v7 tokens];
          if ([v16 count] <= v15)
          {

LABEL_14:
            v23 = CDMOSLoggerForCategory(0);
            id v5 = v25;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v32 = "+[CDMMentionResolverServiceUtils includeWhitespaceInIndices:tokenchain:]";
              __int16 v33 = 2112;
              id v34 = v25;
              _os_log_error_impl(&dword_2263A0000, v23, OS_LOG_TYPE_ERROR, "%s [ERR]: Error converting MR span indices: %@", buf, 0x16u);
            }

            id v8 = 0;
            goto LABEL_17;
          }
          v17 = [v7 tokens];
          unint64_t v18 = [v17 count];

          if (v18 <= v14) {
            goto LABEL_14;
          }
          v19 = [v7 tokens];
          v20 = [v19 objectAtIndex:v14];
          objc_msgSend(v13, "setStartTokenIndex:", objc_msgSend(v20, "tokenIndex"));

          v21 = [v7 tokens];
          v22 = [v21 objectAtIndex:v15];
          objc_msgSend(v13, "setEndTokenIndex:", objc_msgSend(v22, "tokenIndex") + 1);
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
        id v5 = v25;
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v8 = v5;
  }
LABEL_17:

  return v8;
}

+ (id)buildMRRequestWithCurTurn:(id)a3 tokenChain:(id)a4 mdResponse:(id)a5 contextualSpanMatcherResponse:(id)a6 embedding:(id)a7 utterance:(id)a8 turnIndex:(unint64_t)a9 nluRequestId:(id)a10 resultCandidateId:(id)a11 cdmRequestId:(id)a12
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v44 = a3;
  id v16 = a4;
  id v43 = a5;
  id v42 = a6;
  id v41 = a7;
  id v46 = a10;
  id v45 = a11;
  id v40 = a12;
  id v17 = objc_alloc_init(MEMORY[0x263F71E48]);
  unint64_t v18 = [MEMORY[0x263EFF980] array];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v19 = [v16 tokens];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v48 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if (([v24 isWhitespace] & 1) == 0)
        {
          id v25 = [v24 cleanValue];
          uint64_t v26 = [v25 length];

          if (v26) {
            [v18 addObject:v24];
          }
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v21);
  }

  id v27 = objc_alloc_init(MEMORY[0x263F71F28]);
  long long v28 = [v16 locale];
  [v27 setLocale:v28];

  [v27 setTokens:v18];
  long long v29 = [v16 stringValue];
  [v27 setStringValue:v29];

  long long v30 = [v44 asrOutputs];
  v31 = [v30 firstObject];
  v32 = [v31 utterance];
  [v17 setUtterance:v32];

  id v33 = objc_alloc_init(MEMORY[0x263F71D78]);
  [v17 setRequestId:v33];

  [v17 setResultCandidateId:v45];
  [v17 setNluRequestId:v46];
  [v17 setTokenChain:v27];
  [v17 setMaxCandidates:10];
  [v17 setEmbeddingTensor:v41];
  id v34 = [v43 mentions];
  [v17 setDetectedMentions:v34];

  v35 = [v42 contextualSpans];
  [v17 setContextualSpans:v35];

  uint64_t v36 = [v44 turnContext];
  v37 = [v36 nlContext];
  v38 = [v37 salientEntities];
  [v17 setEntityCandidates:v38];

  [v17 setTurnIndex:a9];
  [v17 setCdmRequestId:v40];

  return v17;
}

@end