@interface CDMTokenizerProtoService
+ (id)createProtoTokenRequestWithAsrOutputs:(id)a3 locale:(id)a4;
+ (id)createProtoTokenRequestWithText:(id)a3 locale:(id)a4;
+ (id)tokenChainFromProto:(id)a3;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)setup:(id)a3;
@end

@implementation CDMTokenizerProtoService

- (id)handleRequestCommandTypeNames
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = +[CDMBaseCommand commandName];
  v7[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  v5 = [v2 setWithArray:v4];

  return v5;
}

- (id)setup:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315138;
    v19 = "-[CDMTokenizerProtoService setup:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Tokenization Service setup started", (uint8_t *)&v18, 0xCu);
  }

  v6 = [v4 dynamicConfig];
  v7 = [v6 languageCode];
  v8 = +[CDMTokenizer tokenizerForLocale:v7];
  tokenizer = self->_tokenizer;
  self->_tokenizer = v8;

  v10 = [v4 dataDispatcherContext];

  dataDispatcherContext = self->_dataDispatcherContext;
  self->_dataDispatcherContext = v10;

  v12 = self->_tokenizer;
  v13 = CDMOSLoggerForCategory(0);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v14)
    {
      int v18 = 136315138;
      v19 = "-[CDMTokenizerProtoService setup:]";
      _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s Tokenization Service setup success", (uint8_t *)&v18, 0xCu);
    }

    self->super.super._serviceState = 2;
    v15 = [(CDMBaseService *)self createSetupResponseCommand];
  }
  else
  {
    if (v14)
    {
      int v18 = 136315138;
      v19 = "-[CDMTokenizerProtoService setup:]";
      _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s Tokenization Service setup failed", (uint8_t *)&v18, 0xCu);
    }

    self->super.super._serviceState = 3;
    v15 = [(CDMBaseService *)self createSetupResponseCommand];
    v16 = [(CDMBaseService *)self createErrorWithCode:1 description:@"Tokenizer nil"];
    [v15 setCmdError:v16];
  }
  return v15;
}

+ (id)tokenChainFromProto:(id)a3
{
  id v3 = a3;
  id v4 = [[CDMTokenChain alloc] initWithProtoTokenChain:v3];

  return v4;
}

+ (id)createProtoTokenRequestWithAsrOutputs:(id)a3 locale:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v37;
    unsigned int v11 = 1;
    *(void *)&long long v8 = 136315906;
    long long v33 = v8;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        BOOL v14 = (void *)MEMORY[0x263F71F70];
        v15 = objc_msgSend(v13, "idA", v33);
        v16 = [v14 convertUUID:v15];

        v17 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v25 = [v13 utterance];
          *(_DWORD *)buf = v33;
          v41 = "+[CDMTokenizerProtoService createProtoTokenRequestWithAsrOutputs:locale:]";
          __int16 v42 = 1024;
          *(_DWORD *)v43 = v11;
          *(_WORD *)&v43[4] = 2112;
          *(void *)&v43[6] = v16;
          __int16 v44 = 2112;
          v45 = v25;
          _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s ASR #%d: Processing asr.UUID=%@, asr.utterance=%@", buf, 0x26u);
        }
        int v18 = [v13 utterance];
        v19 = [MEMORY[0x263F08708] whitespaceCharacterSet];
        uint64_t v20 = [v18 stringByTrimmingCharactersInSet:v19];

        if ([v20 length])
        {
          v21 = objc_alloc_init(MEMORY[0x263F71F10]);
          [v21 setText:v20];
          [v21 setLocale:v6];
          v22 = [v13 idA];
          [v21 setAsrId:v22];

          v23 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v33;
            v41 = "+[CDMTokenizerProtoService createProtoTokenRequestWithAsrOutputs:locale:]";
            __int16 v42 = 1024;
            *(_DWORD *)v43 = v11;
            *(_WORD *)&v43[4] = 2112;
            *(void *)&v43[6] = v16;
            __int16 v44 = 2112;
            v45 = v20;
            _os_log_debug_impl(&dword_2263A0000, v23, OS_LOG_TYPE_DEBUG, "%s ASR #%d: Added asr.UUID=%@, trimmed=%@", buf, 0x26u);
          }

          [v35 addObject:v21];
          unsigned int v24 = +[CDMUserDefaultsUtils readAsrAlternativeCount:v6];
          if (v11 >= v24)
          {
            unsigned int v27 = v24;
            v28 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v41 = "+[CDMTokenizerProtoService createProtoTokenRequestWithAsrOutputs:locale:]";
              __int16 v42 = 1024;
              *(_DWORD *)v43 = v27;
              *(_WORD *)&v43[4] = 1024;
              *(_DWORD *)&v43[6] = v11;
              _os_log_debug_impl(&dword_2263A0000, v28, OS_LOG_TYPE_DEBUG, "%s Early return as we've processed enough ASRs per NSUserDefault config=%d, already processed counter=%d", buf, 0x18u);
            }

            goto LABEL_21;
          }
          ++v11;
        }
        else
        {
          v21 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            v26 = [v13 utterance];
            *(_DWORD *)buf = v33;
            v41 = "+[CDMTokenizerProtoService createProtoTokenRequestWithAsrOutputs:locale:]";
            __int16 v42 = 1024;
            *(_DWORD *)v43 = v11;
            *(_WORD *)&v43[4] = 2112;
            *(void *)&v43[6] = v16;
            __int16 v44 = 2112;
            v45 = v26;
            _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s ASR #%d: Skipping trimmed empty version of asr.UUID=%@, asr.utterance=%@", buf, 0x26u);
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  v29 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v32 = [v35 count];
    *(_DWORD *)buf = 136315394;
    v41 = "+[CDMTokenizerProtoService createProtoTokenRequestWithAsrOutputs:locale:]";
    __int16 v42 = 2048;
    *(void *)v43 = v32;
    _os_log_debug_impl(&dword_2263A0000, v29, OS_LOG_TYPE_DEBUG, "%s Returning CDMTokenizationProtoRequestCommand with %lu ASRs", buf, 0x16u);
  }

  v30 = [[CDMTokenizationProtoRequestCommand alloc] initWithRequests:v35];
  return v30;
}

+ (id)createProtoTokenRequestWithText:(id)a3 locale:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F71F10];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setText:v7];

  [v8 setLocale:v6];
  uint64_t v9 = [[CDMTokenizationProtoRequestCommand alloc] initWithRequest:v8];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDispatcherContext, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
}

- (id)handle:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->super.super._serviceState == 2)
  {
    int v5 = [(CDMDataDispatcherContext *)self->_dataDispatcherContext cdmSELFLoggingPolicyType];
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v41 = v4;
    id obj = [v4 requests];
    uint64_t v46 = [obj countByEnumeratingWithState:&v55 objects:v68 count:16];
    if (v46)
    {
      uint64_t v45 = *(void *)v56;
      v43 = self;
      __int16 v44 = v6;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v56 != v45) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v55 + 1) + 8 * v7);
          if (v8)
          {
            uint64_t v49 = v7;
            tokenizer = self->_tokenizer;
            v50 = *(void **)(*((void *)&v55 + 1) + 8 * v7);
            uint64_t v10 = [v8 text];
            unsigned int v11 = [(CDMTokenizer *)tokenizer createTokenChain:v10];

            id v12 = objc_alloc_init(MEMORY[0x263F71F28]);
            v13 = [v11 string];
            [v12 setStringValue:v13];

            BOOL v14 = [v11 locale];
            uint64_t v47 = v12;
            [v12 setLocale:v14];

            v15 = (void *)MEMORY[0x263EFF980];
            v16 = [v11 tokens];
            v17 = objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "count"));

            long long v53 = 0u;
            long long v54 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            v48 = v11;
            int v18 = [v11 tokens];
            uint64_t v19 = [v18 countByEnumeratingWithState:&v51 objects:v67 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v52;
              do
              {
                uint64_t v22 = 0;
                do
                {
                  if (*(void *)v52 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  v23 = *(void **)(*((void *)&v51 + 1) + 8 * v22);
                  id v24 = objc_alloc_init(MEMORY[0x263F71F20]);
                  v25 = [v23 value];
                  [v24 setValue:v25];

                  objc_msgSend(v24, "setBegin:", objc_msgSend(v23, "begin"));
                  objc_msgSend(v24, "setEnd:", objc_msgSend(v23, "end"));
                  objc_msgSend(v24, "setIsSignificant:", objc_msgSend(v23, "isSignificant"));
                  objc_msgSend(v24, "setIsWhitespace:", objc_msgSend(v23, "isWhiteSpace"));
                  v26 = [v23 cleanValue];
                  [v24 setCleanValue:v26];

                  unsigned int v27 = [v23 cleanValues];
                  v28 = (void *)[v27 mutableCopy];
                  [v24 setCleanValues:v28];

                  objc_msgSend(v24, "setTokenIndex:", objc_msgSend(v23, "tokenIndex"));
                  objc_msgSend(v24, "setNonWhitespaceTokenIndex:", objc_msgSend(v23, "nonWhitespaceTokenIndex"));
                  v29 = [v23 normalizedValues];
                  v30 = (void *)[v29 mutableCopy];
                  [v24 setNormalizedValues:v30];

                  [v17 addObject:v24];
                  v31 = CDMLogContext;
                  BOOL v32 = os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG);
                  if (v5 == 2)
                  {
                    if (v32)
                    {
                      *(_DWORD *)buf = 136315394;
                      v60 = "-[CDMTokenizerProtoService handle:]";
                      __int16 v61 = 2112;
                      v62 = @"tokenize";
                      _os_log_debug_impl(&dword_2263A0000, v31, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nAdded token for asrId=<Redacted>.\nToken = <Redacted>", buf, 0x16u);
                    }
                  }
                  else if (v32)
                  {
                    long long v33 = v31;
                    v34 = [v50 asrId];
                    *(_DWORD *)buf = 136315906;
                    v60 = "-[CDMTokenizerProtoService handle:]";
                    __int16 v61 = 2112;
                    v62 = @"tokenize";
                    __int16 v63 = 2112;
                    v64 = v34;
                    __int16 v65 = 2112;
                    id v66 = v24;
                    _os_log_debug_impl(&dword_2263A0000, v33, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nAdded token for asrId=%@.\nToken = %@", buf, 0x2Au);
                  }
                  ++v22;
                }
                while (v20 != v22);
                uint64_t v20 = [v18 countByEnumeratingWithState:&v51 objects:v67 count:16];
              }
              while (v20);
            }

            [v47 setTokens:v17];
            id v35 = objc_alloc_init(MEMORY[0x263F71F18]);
            long long v36 = [v50 text];
            [v35 setText:v36];

            [v35 setTokenChain:v47];
            long long v37 = [v50 asrId];
            [v35 setAsrId:v37];

            id v6 = v44;
            [v44 addObject:v35];

            self = v43;
            long long v38 = v48;
            uint64_t v7 = v49;
          }
          else
          {
            long long v38 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v60 = "-[CDMTokenizerProtoService handle:]";
              _os_log_error_impl(&dword_2263A0000, v38, OS_LOG_TYPE_ERROR, "%s [ERR]: TokenizationProtoRequest nil, skipping", buf, 0xCu);
            }
          }

          ++v7;
        }
        while (v7 != v46);
        uint64_t v46 = [obj countByEnumeratingWithState:&v55 objects:v68 count:16];
      }
      while (v46);
    }

    long long v39 = [[CDMTokenizationProtoResponseCommand alloc] initWithResponses:v6];
    id v4 = v41;
  }
  else
  {
    id v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v60 = "-[CDMTokenizerProtoService handle:]";
      _os_log_error_impl(&dword_2263A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: TokenizationProto Request received while service in not Ready state", buf, 0xCu);
    }
    long long v39 = 0;
  }

  return v39;
}

@end