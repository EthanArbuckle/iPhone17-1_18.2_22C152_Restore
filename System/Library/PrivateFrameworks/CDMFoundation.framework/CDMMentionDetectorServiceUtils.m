@interface CDMMentionDetectorServiceUtils
+ (id)buildMDRequestWithUtterance:(id)a3 tokenChain:(id)a4 embedding:(id)a5 nluRequestId:(id)a6 resultCandidateId:(id)a7 cdmRequestId:(id)a8;
+ (void)logMDRequestToFile:(id)a3;
+ (void)logMDResponseToFile:(id)a3;
@end

@implementation CDMMentionDetectorServiceUtils

+ (void)logMDResponseToFile:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!v3)
  {
    v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "+[CDMMentionDetectorServiceUtils logMDResponseToFile:]";
      _os_log_debug_impl(&dword_2263A0000, v6, OS_LOG_TYPE_DEBUG, "%s nil md response, not writing to tmp", buf, 0xCu);
    }
    id v5 = 0;
    goto LABEL_8;
  }
  id v7 = 0;
  v4 = +[CDMNluLogUtil writeMDResponseToDisk:v3 error:&v7];
  id v5 = v7;

  if (!v4)
  {
    v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "+[CDMMentionDetectorServiceUtils logMDResponseToFile:]";
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_error_impl(&dword_2263A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Error logging md response to file: %@", buf, 0x16u);
    }
LABEL_8:
  }
}

+ (void)logMDRequestToFile:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = 0;
  id v3 = +[CDMNluLogUtil writeMDRequestToDisk:a3 error:&v6];
  id v4 = v6;

  if (!v3)
  {
    id v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "+[CDMMentionDetectorServiceUtils logMDRequestToFile:]";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_error_impl(&dword_2263A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: Error logging md request to file: %@", buf, 0x16u);
    }
  }
}

+ (id)buildMDRequestWithUtterance:(id)a3 tokenChain:(id)a4 embedding:(id)a5 nluRequestId:(id)a6 resultCandidateId:(id)a7 cdmRequestId:(id)a8
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v33 = a3;
  id v13 = a4;
  id v32 = a5;
  id v31 = a6;
  id v30 = a7;
  id v29 = a8;
  id v14 = objc_alloc_init(MEMORY[0x263F71E38]);
  v15 = [MEMORY[0x263EFF980] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v16 = [v13 tokens];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (([v21 isWhitespace] & 1) == 0)
        {
          v22 = [v21 cleanValue];
          uint64_t v23 = [v22 length];

          if (v23) {
            [v15 addObject:v21];
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v18);
  }

  id v24 = objc_alloc_init(MEMORY[0x263F71F28]);
  v25 = [v13 locale];
  [v24 setLocale:v25];

  [v24 setTokens:v15];
  v26 = [v13 stringValue];
  [v24 setStringValue:v26];

  [v14 setUtterance:v33];
  id v27 = objc_alloc_init(MEMORY[0x263F71D78]);
  [v14 setRequestId:v27];

  [v14 setResultCandidateId:v30];
  [v14 setNluRequestId:v31];
  [v14 setTokenChain:v24];
  [v14 setMaxCandidates:10];
  [v14 setEmbeddingTensor:v32];
  [v14 setCdmRequestId:v29];

  return v14;
}

@end