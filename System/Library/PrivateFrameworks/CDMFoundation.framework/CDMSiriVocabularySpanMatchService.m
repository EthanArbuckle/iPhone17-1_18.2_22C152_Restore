@interface CDMSiriVocabularySpanMatchService
+ (Class)spanMatcherClass;
- (BOOL)isSetupRerunNeededForRequest:(id)a3;
- (BOOL)shouldBeUsedForAsrAlternatives;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)setupSpanMatcher:(id)a3;
- (id)warmup:(id)a3;
- (void)updateData:(id)a3;
@end

@implementation CDMSiriVocabularySpanMatchService

- (id)handleRequestCommandTypeNames
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = +[CDMBaseCommand commandName];
  v8[0] = v3;
  v4 = +[CDMBaseCommand commandName];
  v8[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  v6 = [v2 setWithArray:v5];

  return v6;
}

- (id)warmup:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(CDMBaseSpanMatchService *)self spanMatcher];
  if (!v4
    || (v5 = (void *)v4,
        [(CDMBaseSpanMatchService *)self spanMatcher],
        v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        v5,
        (isKindOfClass & 1) == 0))
  {
    v9 = CDMOSLoggerForCategory(0);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    v13 = [(CDMBaseService *)self serviceName];
    int v19 = 136315394;
    v20 = "-[CDMSiriVocabularySpanMatchService warmup:]";
    __int16 v21 = 2112;
    v22 = v13;
    _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s Prewarm Span Matcher %@: No-op", (uint8_t *)&v19, 0x16u);
    goto LABEL_10;
  }
  v8 = [(CDMBaseSpanMatchService *)self spanMatcher];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 semSpanMatcher];

    if (v10)
    {
      v11 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = [(CDMBaseService *)self serviceName];
        int v19 = 136315394;
        v20 = "-[CDMSiriVocabularySpanMatchService warmup:]";
        __int16 v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_2263A0000, v11, OS_LOG_TYPE_INFO, "%s Prewarm SEM Span Matcher in %@", (uint8_t *)&v19, 0x16u);
      }
      v13 = [v9 semSpanMatcher];
      [v13 prewarmIndex];
LABEL_10:
    }
  }
LABEL_11:

  v14 = [CDMWarmupResponseCommand alloc];
  int64_t v15 = [(CDMBaseService *)self serviceState];
  v16 = [(CDMBaseService *)self serviceName];
  v17 = [(CDMWarmupResponseCommand *)v14 initWithServiceState:v15 serviceName:v16];

  return v17;
}

- (BOOL)shouldBeUsedForAsrAlternatives
{
  return 1;
}

- (BOOL)isSetupRerunNeededForRequest:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CDMBaseSpanMatchService *)self spanMatcher];
  v6 = [v5 semSandboxId];
  if (!v6)
  {
    v7 = [v4 siriVocabularySandboxId];

    if (!v7)
    {
      v13 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[CDMSiriVocabularySpanMatchService isSetupRerunNeededForRequest:]";
        _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s Both Ids are nil, consider them equal; No need to re-run setup for sandboxes.",
          buf,
          0xCu);
      }

      unsigned __int8 v10 = -[CDMDAGBaseService isSetupRerunNeededForRequest:](&v18, sel_isSetupRerunNeededForRequest_, v4, v17.receiver, v17.super_class, self, CDMSiriVocabularySpanMatchService);
      goto LABEL_11;
    }
  }
  v8 = [v4 siriVocabularySandboxId];
  char v9 = [v6 isEqualToString:v8];

  if (v9)
  {
    unsigned __int8 v10 = -[CDMDAGBaseService isSetupRerunNeededForRequest:](&v17, sel_isSetupRerunNeededForRequest_, v4, self, CDMSiriVocabularySpanMatchService, v18.receiver, v18.super_class);
LABEL_11:
    BOOL v12 = v10;
    goto LABEL_12;
  }
  v11 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int64_t v15 = [(CDMBaseService *)self serviceName];
    v16 = [v4 siriVocabularySandboxId];
    *(_DWORD *)buf = 136315906;
    v20 = "-[CDMSiriVocabularySpanMatchService isSetupRerunNeededForRequest:]";
    __int16 v21 = 2112;
    v22 = v15;
    __int16 v23 = 2112;
    v24 = v6;
    __int16 v25 = 2112;
    v26 = v16;
    _os_log_debug_impl(&dword_2263A0000, v11, OS_LOG_TYPE_DEBUG, "%s Setup rerun is needed for service %@ to change sandbox from %@ to %@", buf, 0x2Au);
  }
  BOOL v12 = 1;
LABEL_12:

  return v12;
}

- (void)updateData:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    int64_t v15 = "-[CDMSiriVocabularySpanMatchService updateData:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Span Match Service Update data", (uint8_t *)&v14, 0xCu);
  }

  v6 = [(CDMBaseSpanMatchService *)self spanMatcher];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 semSandboxId];
    if (!v8)
    {
      char v9 = [v7 overrideSpans];

      if (v9) {
        goto LABEL_7;
      }
      unsigned __int8 v10 = [v4 semSpanMatcher];

      v8 = CDMOSLoggerForCategory(0);
      BOOL v11 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (v10)
      {
        if (v11)
        {
          int v14 = 136315138;
          int64_t v15 = "-[CDMSiriVocabularySpanMatchService updateData:]";
          _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s Update Siri Vocab Searcher, using Siri Entity Matcher", (uint8_t *)&v14, 0xCu);
        }

        BOOL v12 = [CDMSiriVocabularyProtoSpanMatcher alloc];
        v8 = [v4 semSpanMatcher];
        v13 = [(CDMSiriVocabularyProtoSpanMatcher *)v12 initWithSEMSpanMatcher:v8];
        [(CDMBaseSpanMatchService *)self setSpanMatcher:v13];
      }
      else if (v11)
      {
        int v14 = 136315138;
        int64_t v15 = "-[CDMSiriVocabularySpanMatchService updateData:]";
        _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s SiriVocab SpanMatcher not updated because it is originally initialized via sandbox or override spans", (uint8_t *)&v14, 0xCu);
      }
    }
  }
LABEL_7:
}

- (id)handle:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CDMSiriVocabularySpanMatchService *)self updateData:v4];

    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CDMSiriVocabularySpanMatchService;
    v5 = [(CDMBaseSpanMatchService *)&v7 handle:v4];
  }
  return v5;
}

- (id)setupSpanMatcher:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315138;
    __int16 v23 = "-[CDMSiriVocabularySpanMatchService setupSpanMatcher:]";
    _os_log_impl(&dword_2263A0000, v4, OS_LOG_TYPE_INFO, "%s initializing CDMSiriVocabularySpanMatcher", (uint8_t *)&v22, 0xCu);
  }

  v5 = [v3 dynamicConfig];
  v6 = [v5 overrideSiriVocabSpans];

  if (v6)
  {
    objc_super v7 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v22 = 136315138;
      __int16 v23 = "-[CDMSiriVocabularySpanMatchService setupSpanMatcher:]";
      _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s Span Matcher service is using override spans for SiriVocabularyMatcher!", (uint8_t *)&v22, 0xCu);
    }

    v8 = [CDMSiriVocabularyProtoSpanMatcher alloc];
    char v9 = [v3 dynamicConfig];
    unsigned __int8 v10 = [v9 overrideSiriVocabSpans];
    uint64_t v11 = [(CDMSiriVocabularyProtoSpanMatcher *)v8 initWithOverrideSpans:v10];
LABEL_11:
    uint64_t v16 = (CDMSiriVocabularyProtoSpanMatcher *)v11;

    goto LABEL_12;
  }
  BOOL v12 = [v3 dynamicConfig];
  v13 = [v12 siriVocabularySandboxId];

  if (v13)
  {
    int v14 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v20 = [v3 dynamicConfig];
      __int16 v21 = [v20 siriVocabularySandboxId];
      int v22 = 136315394;
      __int16 v23 = "-[CDMSiriVocabularySpanMatchService setupSpanMatcher:]";
      __int16 v24 = 2112;
      __int16 v25 = v21;
      _os_log_debug_impl(&dword_2263A0000, v14, OS_LOG_TYPE_DEBUG, "%s user profile debug: initializing CDMSiriVocabularySpanMatcher with Sandbox id %@", (uint8_t *)&v22, 0x16u);
    }
    int64_t v15 = [CDMSiriVocabularyProtoSpanMatcher alloc];
    char v9 = [v3 dynamicConfig];
    unsigned __int8 v10 = [v9 siriVocabularySandboxId];
    uint64_t v11 = [(CDMSiriVocabularyProtoSpanMatcher *)v15 initWithSandboxId:v10];
    goto LABEL_11;
  }
  int v19 = [CDMSiriVocabularyProtoSpanMatcher alloc];
  char v9 = [MEMORY[0x263F6D188] indexMatcher];
  uint64_t v16 = [(CDMSiriVocabularyProtoSpanMatcher *)v19 initWithSEMSpanMatcher:v9];
LABEL_12:

  if (!v16)
  {
    objc_super v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315138;
      __int16 v23 = "-[CDMSiriVocabularySpanMatchService setupSpanMatcher:]";
      _os_log_error_impl(&dword_2263A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: Not able to initialize SiriVocabulary span matcher", (uint8_t *)&v22, 0xCu);
    }
  }
  return v16;
}

+ (Class)spanMatcherClass
{
  return (Class)objc_opt_class();
}

@end