@interface CDMBaseSpanMatchService
+ (Class)spanMatcherClass;
+ (id)convertToSpanMatchRequest:(id)a3 nlContext:(id)a4;
+ (id)convertToSpanMatchRequests:(id)a3 nlContext:(id)a4;
+ (id)getCDMServiceAssetConfig;
- (BOOL)shouldBeUsedForAsrAlternatives;
- (CDMProtoSpanMatcher)spanMatcher;
- (id)_handle:(id)a3;
- (id)createErrorSetupResponseCommand:(id)a3;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)setup:(id)a3;
- (id)setupSpanMatcher:(id)a3;
- (id)warmup:(id)a3;
- (void)limitNumberOfSpans:(id)a3;
- (void)setSpanMatcher:(id)a3;
- (void)spanizeAsrs:(id)a3 asrSpansMap:(id)a4 topAsrSpans:(id)a5 topAsrSpansFiltered:(id)a6 asrHypotheses:(id)a7;
- (void)spanizeTokenChain:(id)a3 spans:(id)a4 isTopAsr:(BOOL)a5 topAsrSpansFiltered:(id)a6 asrHypothesis:(id)a7;
@end

@implementation CDMBaseSpanMatchService

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

- (void).cxx_destruct
{
}

- (void)setSpanMatcher:(id)a3
{
}

- (CDMProtoSpanMatcher)spanMatcher
{
  return (CDMProtoSpanMatcher *)objc_getProperty(self, a2, 48, 1);
}

- (void)limitNumberOfSpans:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ((unint64_t)[v3 count] >= 0x65)
  {
    v4 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 136315650;
      v6 = "-[CDMBaseSpanMatchService limitNumberOfSpans:]";
      __int16 v7 = 2048;
      uint64_t v8 = [v3 count];
      __int16 v9 = 1024;
      int v10 = 100;
      _os_log_debug_impl(&dword_2263A0000, v4, OS_LOG_TYPE_DEBUG, "%s Matched count=%lu spans, filtering spans to the limit=%d", (uint8_t *)&v5, 0x1Cu);
    }

    objc_msgSend(v3, "removeObjectsInRange:", 100, objc_msgSend(v3, "count") - 100);
  }
}

- (void)spanizeTokenChain:(id)a3 spans:(id)a4 isTopAsr:(BOOL)a5 topAsrSpansFiltered:(id)a6 asrHypothesis:(id)a7
{
  BOOL v9 = a5;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = a4;
  v16 = [(CDMBaseSpanMatchService *)self spanMatcher];
  v17 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v21 = [v12 normalizedString];
    int v24 = 136315650;
    v25 = "-[CDMBaseSpanMatchService spanizeTokenChain:spans:isTopAsr:topAsrSpansFiltered:asrHypothesis:]";
    __int16 v26 = 2112;
    v27 = v21;
    __int16 v28 = 2112;
    uint64_t v29 = (uint64_t)v16;
    _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s Start spanizing utterance: [%@]; with span matcher: %@",
      (uint8_t *)&v24,
      0x20u);
  }
  v18 = [v16 matchSpansForTokenChain:v12 asrHypothesis:v14];

  [v15 addObjectsFromArray:v18];
  if (v9 && [(CDMBaseSpanMatchService *)self shouldBeUsedForAsrAlternatives])
  {
    v19 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      int v24 = 136315138;
      v25 = "-[CDMBaseSpanMatchService spanizeTokenChain:spans:isTopAsr:topAsrSpansFiltered:asrHypothesis:]";
      _os_log_debug_impl(&dword_2263A0000, v19, OS_LOG_TYPE_DEBUG, "%s Add selected spans from top ASR for use later in post-processing of ASR alternatives", (uint8_t *)&v24, 0xCu);
    }

    [v13 addObjectsFromArray:v18];
  }
  v20 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v22 = [v12 normalizedString];
    uint64_t v23 = [v18 count];
    int v24 = 136315906;
    v25 = "-[CDMBaseSpanMatchService spanizeTokenChain:spans:isTopAsr:topAsrSpansFiltered:asrHypothesis:]";
    __int16 v26 = 2112;
    v27 = v22;
    __int16 v28 = 2048;
    uint64_t v29 = v23;
    __int16 v30 = 2112;
    v31 = v16;
    _os_log_debug_impl(&dword_2263A0000, v20, OS_LOG_TYPE_DEBUG, "%s Spanized utterance: [%@]; Created %lu span(s) for span matcher: %@",
      (uint8_t *)&v24,
      0x2Au);
  }
}

- (BOOL)shouldBeUsedForAsrAlternatives
{
  return 0;
}

- (void)spanizeAsrs:(id)a3 asrSpansMap:(id)a4 topAsrSpans:(id)a5 topAsrSpansFiltered:(id)a6 asrHypotheses:(id)a7
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v38 = a4;
  id v37 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v13, "count"));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v41 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v21 = [v20 idA];

        if (v21)
        {
          v22 = [v20 idA];
          [v14 setObject:v20 forKey:v22];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v17);
  }

  if ([v11 count])
  {
    unint64_t v24 = 0;
    *(void *)&long long v23 = 136315138;
    long long v36 = v23;
    do
    {
      v25 = objc_msgSend(v11, "objectAtIndexedSubscript:", v24, v36);
      __int16 v26 = [CDMTokenChain alloc];
      v27 = [v25 tokenChain];
      __int16 v28 = [(CDMTokenChain *)v26 initWithProtoTokenChain:v27];

      uint64_t v29 = [v25 asrId];

      if (v29)
      {
        __int16 v30 = [v25 asrId];
        v31 = [v14 objectForKey:v30];
      }
      else
      {
        v31 = 0;
      }
      id v32 = objc_alloc_init(MEMORY[0x263EFF980]);
      [(CDMBaseSpanMatchService *)self spanizeTokenChain:v28 spans:v32 isTopAsr:v24 == 0 topAsrSpansFiltered:v12 asrHypothesis:v31];
      if (!v24)
      {
        v33 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v36;
          v45 = "-[CDMBaseSpanMatchService spanizeAsrs:asrSpansMap:topAsrSpans:topAsrSpansFiltered:asrHypotheses:]";
          _os_log_debug_impl(&dword_2263A0000, v33, OS_LOG_TYPE_DEBUG, "%s This is top ASR, set the topAsrSpans", buf, 0xCu);
        }

        [v37 addObjectsFromArray:v32];
      }
      v34 = [v25 asrId];

      if (v34)
      {
        v35 = [v25 asrId];
        [v38 setObject:v32 forKey:v35];
      }
      else
      {
        v35 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v45 = "-[CDMBaseSpanMatchService spanizeAsrs:asrSpansMap:topAsrSpans:topAsrSpansFiltered:asrHypotheses:]";
          __int16 v46 = 2112;
          v47 = v25;
          _os_log_impl(&dword_2263A0000, v35, OS_LOG_TYPE_INFO, "%s [WARN]: Did not expect a request w/o ASR uuid? %@", buf, 0x16u);
        }
      }

      ++v24;
    }
    while ([v11 count] > v24);
  }
}

- (id)warmup:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = [(CDMBaseService *)self serviceName];
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[CDMBaseSpanMatchService warmup:]";
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    _os_log_impl(&dword_2263A0000, v4, OS_LOG_TYPE_INFO, "%s Prewarm Span Matcher %@", buf, 0x16u);
  }
  v6 = [[CDMTokenChain alloc] initWithString:@"helloworld" locale:@"en"];
  __int16 v7 = [[CDMToken alloc] initWithValue:@"helloworld" begin:0 end:10 significant:1 whitespace:0 cleanValue:@"helloworld" tokenIndex:0 nonWhitespaceTokenIndex:0];
  [(CDMToken *)v7 addNormalizedValue:@"helloworld"];
  [(CDMTokenChain *)v6 addToken:v7];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(CDMBaseSpanMatchService *)self spanizeTokenChain:v6 spans:v8 isTopAsr:1 topAsrSpansFiltered:v9 asrHypothesis:0];
  int v10 = [CDMWarmupResponseCommand alloc];
  int64_t v11 = [(CDMBaseService *)self serviceState];
  id v12 = [(CDMBaseService *)self serviceName];
  id v13 = [(CDMWarmupResponseCommand *)v10 initWithServiceState:v11 serviceName:v12];

  return v13;
}

- (id)setup:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    __int16 v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[CDMBaseSpanMatchService setup:]";
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Setup %@", buf, 0x16u);
  }
  id v8 = [(CDMBaseSpanMatchService *)self setupSpanMatcher:v4];

  if (v8)
  {
    [(CDMBaseSpanMatchService *)self setSpanMatcher:v8];
    self->super.super._serviceState = 2;
    id v9 = [(CDMBaseService *)self createSetupResponseCommand];
  }
  else
  {
    int v10 = NSString;
    int64_t v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = [v10 stringWithFormat:@"Unable to setup span matcher for %@", v12];

    id v9 = [(CDMBaseSpanMatchService *)self createErrorSetupResponseCommand:v13];
  }
  return v9;
}

- (id)createErrorSetupResponseCommand:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->super.super._serviceState = 3;
  int v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    int v10 = "-[CDMBaseSpanMatchService createErrorSetupResponseCommand:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s [WARN]: %@", (uint8_t *)&v9, 0x16u);
  }

  v6 = [(CDMBaseService *)self createSetupResponseCommand];
  __int16 v7 = [(CDMBaseService *)self createErrorWithCode:1 description:v4];
  [v6 setCmdError:v7];

  return v6;
}

- (id)_handle:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  int64_t v7 = [(CDMBaseService *)self serviceState];
  id v8 = CDMOSLoggerForCategory(0);
  int v9 = v8;
  if (v7 == 2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "-[CDMBaseSpanMatchService _handle:]";
      _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s Spanize all ASR(s) and fill in asrSpansMap & topAsrSpansFiltered", buf, 0xCu);
    }

    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v11 = objc_alloc(MEMORY[0x263EFF980]);
    id v12 = [v4 spanMatchRequests];
    uint64_t v13 = objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));

    id v14 = objc_alloc(MEMORY[0x263EFF980]);
    id v15 = [v4 spanMatchRequests];
    uint64_t v16 = objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

    __int16 v17 = [v4 spanMatchRequests];
    uint64_t v18 = [v4 asrHypothesis];
    [(CDMBaseSpanMatchService *)self spanizeAsrs:v17 asrSpansMap:v10 topAsrSpans:v13 topAsrSpansFiltered:v16 asrHypotheses:v18];

    uint64_t v19 = [v4 spanMatchRequests];
    v20 = [v19 firstObject];

    v21 = [CDMTokenChain alloc];
    v22 = [v20 tokenChain];
    v55 = [(CDMTokenChain *)v21 initWithProtoTokenChain:v22];

    long long v23 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "-[CDMBaseSpanMatchService _handle:]";
      _os_log_debug_impl(&dword_2263A0000, v23, OS_LOG_TYPE_DEBUG, "%s Creating a map of {ASR uuid: {char_index: timing}} for ASR alternatives", buf, 0xCu);
    }

    unint64_t v24 = [v4 asrHypothesis];
    v25 = +[CDMAsrUtils createAsrUuidCharIndexTimingMaps:v24];

    __int16 v26 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "-[CDMBaseSpanMatchService _handle:]";
      _os_log_debug_impl(&dword_2263A0000, v26, OS_LOG_TYPE_DEBUG, "%s Get the {char_index: timing} map for top ASR", buf, 0xCu);
    }

    v52 = v20;
    v27 = [v20 asrId];
    v54 = [v25 objectForKey:v27];

    __int16 v28 = [v4 asrHypothesis];
    uint64_t v29 = [v28 count];

    v53 = v25;
    if (v29)
    {
      os_signpost_id_t v30 = os_signpost_id_generate((os_log_t)CDMLogContext);
      v31 = (id)CDMLogContext;
      id v32 = v31;
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "SpanMatcher", "Add ASR confidence scores to spans", buf, 2u);
      }

      v33 = [v4 asrHypothesis];
      v34 = [v33 objectAtIndexedSubscript:0];
      +[CDMSpanMatchUtils addAsrConfidenceToSpans:v13 tokenChain:v55 asrTimingMap:v54 asrHypothesis:v34];

      v35 = (id)CDMLogContext;
      long long v36 = v35;
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v36, OS_SIGNPOST_INTERVAL_END, v30, "SpanMatcher", "", buf, 2u);
      }

      v25 = v53;
    }
    id v37 = [v4 spanMatchRequests];
    unint64_t v38 = [v37 count];

    if (v38 >= 2)
    {
      v39 = [v4 spanMatchRequests];
      long long v40 = [v4 asrHypothesis];
      +[CDMSpanMatchUtils postProcessSpans:v39 asrSpansMap:v10 asrHypothesis:v40 asrMaps:v25 topAsrTokenChain:v55 asrMapTopAsr:v54 topAsrSpansFiltered:v16];
    }
    os_signpost_id_t v41 = os_signpost_id_generate((os_log_t)CDMLogContext);
    long long v42 = (id)CDMLogContext;
    long long v43 = v42;
    if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v43, OS_SIGNPOST_INTERVAL_BEGIN, v41, "SpanMatcher", "spanMatchResponse", buf, 2u);
    }

    id v44 = objc_alloc_init(MEMORY[0x263F71EF0]);
    [(CDMBaseSpanMatchService *)self limitNumberOfSpans:v13];
    +[CDMSpanMatchUtils setAsrHypothesisIndexForTopAsrSpans:v13];
    [v44 setMatchingSpans:v13];
    v45 = [[CDMSpanMatcherResponseCommand alloc] initWithResponse:v44];
    __int16 v46 = (void *)CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
    {
      v50 = v46;
      int v51 = [v13 count];
      *(_DWORD *)buf = 136315906;
      v57 = "-[CDMBaseSpanMatchService _handle:]";
      __int16 v58 = 2112;
      v59 = @"spanmatch";
      __int16 v60 = 2112;
      int64_t v61 = (int64_t)v6;
      __int16 v62 = 1024;
      int v63 = v51;
      _os_log_debug_impl(&dword_2263A0000, v50, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\n%@ generated number of spans: %d", buf, 0x26u);

      __int16 v46 = (void *)CDMLogContext;
    }
    v47 = v46;
    v48 = v47;
    if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v48, OS_SIGNPOST_INTERVAL_END, v41, "SpanMatcher", "", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v57 = "-[CDMBaseSpanMatchService _handle:]";
      __int16 v58 = 2112;
      v59 = v6;
      __int16 v60 = 2048;
      int64_t v61 = [(CDMBaseService *)self serviceState];
      _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s %@ Not Ready! State: %tu", buf, 0x20u);
    }

    v45 = objc_alloc_init(CDMSpanMatcherResponseCommand);
    id v10 = [(CDMBaseService *)self createErrorWithCode:1 description:@"Service Not Ready"];
    [(CDMBaseCommand *)v45 setCmdError:v10];
  }

  return v45;
}

- (id)handle:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [(CDMBaseSpanMatchService *)self _handle:v4];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)setupSpanMatcher:(id)a3
{
  id v4 = a3;
  int v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  int64_t v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  int v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

+ (id)convertToSpanMatchRequest:(id)a3 nlContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v5 = (objc_class *)MEMORY[0x263F71EE8];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  int v9 = [v7 tokenChain];
  [v8 setTokenChain:v9];

  id v10 = [v7 text];
  [v8 setUtterance:v10];

  [v8 setNlContext:v6];
  id v11 = [v7 asrId];

  [v8 setAsrId:v11];
  id v12 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v14 = [v8 utterance];
    int v15 = 136315394;
    uint64_t v16 = "+[CDMBaseSpanMatchService convertToSpanMatchRequest:nlContext:]";
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s Converted TokenizerResponse -> SpanMatchRequest for utterance: %@", (uint8_t *)&v15, 0x16u);
  }
  return v8;
}

+ (id)convertToSpanMatchRequests:(id)a3 nlContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
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
        uint64_t v13 = +[CDMBaseSpanMatchService convertToSpanMatchRequest:nlContext:](CDMBaseSpanMatchService, "convertToSpanMatchRequest:nlContext:", *(void *)(*((void *)&v15 + 1) + 8 * i), v6, (void)v15);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)getCDMServiceAssetConfig
{
  v2 = (void *)[a1 spanMatcherClass];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v2 getCDMServiceAssetConfig];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

+ (Class)spanMatcherClass
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end