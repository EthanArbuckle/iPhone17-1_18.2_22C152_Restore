@interface CDMContextUpdateService
+ (BOOL)isEnabled;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)setup:(id)a3;
- (void)doCoreAnalyticsForContextUpdateOutcome:(int)a3 numTurnsRollback:(int)a4 locale:(id)a5;
@end

@implementation CDMContextUpdateService

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

+ (BOOL)isEnabled
{
  return +[CDMFeatureFlags isContextUpdateEnabled];
}

- (void).cxx_destruct
{
}

- (void)doCoreAnalyticsForContextUpdateOutcome:(int)a3 numTurnsRollback:(int)a4 locale:(id)a5
{
}

- (id)handle:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v50 = "-[CDMContextUpdateService handle:]";
    _os_log_impl(&dword_2263A0000, v4, OS_LOG_TYPE_INFO, "%s Calling Context Update Service", buf, 0xCu);
  }

  v5 = [v3 ctxUpdateRequest];
  v6 = [v5 currentTurn];
  v7 = (void *)[v6 copy];

  id v8 = objc_alloc(MEMORY[0x263EFF980]);
  v9 = [v3 ctxUpdateRequest];
  v10 = [v9 previousTurns];
  v11 = (void *)[v8 initWithArray:v10 copyItems:1];

  if (!v7
    || (int v12 = [v7 tapToEdit], (v12 & 1) == 0)
    && !+[SiriNLUTypesUtils isTopSdaAskRepeat:v7])
  {
    v18 = [v3 ctxUpdateRequest];
    uint64_t v14 = [v18 qrHypotheses];
    if (v14)
    {
      v19 = [v3 ctxUpdateRequest];
      v20 = [v19 qrHypotheses];
      BOOL v21 = [v20 count] == 1;

      if (!v21)
      {
        char v47 = 0;
        uint64_t v14 = 0;
        uint64_t v27 = 0;
        goto LABEL_39;
      }
      v22 = [v3 ctxUpdateRequest];
      v23 = [v22 qrHypotheses];
      v24 = [v23 objectAtIndexedSubscript:0];
      v18 = [v24 copy];

      if (![v18 rewriteType])
      {
        v34 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v50 = "-[CDMContextUpdateService handle:]";
          _os_log_debug_impl(&dword_2263A0000, v34, OS_LOG_TYPE_DEBUG, "%s Handling Correction by Repetition Request", buf, 0xCu);
        }

        v26 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v50 = "-[CDMContextUpdateService handle:]";
          _os_log_debug_impl(&dword_2263A0000, v26, OS_LOG_TYPE_DEBUG, "%s Reform type: Correction by Repetition", buf, 0xCu);
        }
        uint64_t v27 = 1;
        goto LABEL_34;
      }
      if ([v18 rewriteType] == 1)
      {
        v25 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v50 = "-[CDMContextUpdateService handle:]";
          _os_log_debug_impl(&dword_2263A0000, v25, OS_LOG_TYPE_DEBUG, "%s Handling AER Request", buf, 0xCu);
        }

        v26 = CDMOSLoggerForCategory(0);
        uint64_t v27 = 2;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v50 = "-[CDMContextUpdateService handle:]";
          _os_log_debug_impl(&dword_2263A0000, v26, OS_LOG_TYPE_DEBUG, "%s Reform type: Reference Resolution", buf, 0xCu);
        }
LABEL_34:

        char v47 = 0;
        uint64_t v14 = 0;
        goto LABEL_37;
      }
      char v47 = 0;
      uint64_t v14 = 0;
    }
    else
    {
      char v47 = 0;
    }
    uint64_t v27 = 0;
    goto LABEL_37;
  }
  v13 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v44 = @"AskRepeat";
    if (v12) {
      v44 = @"Tap2Edit";
    }
    *(_DWORD *)buf = 136315394;
    v50 = "-[CDMContextUpdateService handle:]";
    __int16 v51 = 2112;
    v52 = v44;
    _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s Handling %@ triggered Request", buf, 0x16u);
  }

  uint64_t v14 = 0;
  char v47 = v12 ^ 1;
  while ([v11 count])
  {
    v15 = [v11 lastObject];
    if ([v15 tapToEdit])
    {
    }
    else
    {
      v16 = [v11 lastObject];
      BOOL v17 = +[SiriNLUTypesUtils isTopSdaAskRepeat:v16];

      if (!v17) {
        break;
      }
    }
    uint64_t v14 = (v14 + 1);
    [v11 removeLastObject];
  }
  if ([v11 count])
  {
    v18 = [v7 asrOutputs];
    v28 = [v11 lastObject];

    id v29 = [v18 mutableCopy];
    [v28 setAsrOutputs:v29];

    [v11 removeLastObject];
    v30 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v45 = @"AskRepeat";
      if (v12) {
        v45 = @"Tap2Edit";
      }
      *(_DWORD *)buf = 136315394;
      v50 = "-[CDMContextUpdateService handle:]";
      __int16 v51 = 2112;
      v52 = v45;
      _os_log_debug_impl(&dword_2263A0000, v30, OS_LOG_TYPE_DEBUG, "%s Reform type: %@", buf, 0x16u);
    }

    uint64_t v14 = (v14 + 1);
    uint64_t v27 = 3;
    goto LABEL_38;
  }
  v31 = [v3 ctxUpdateRequest];
  v32 = [v31 previousTurns];
  uint64_t v33 = [v32 mutableCopy];

  v18 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v50 = "-[CDMContextUpdateService handle:]";
    _os_log_impl(&dword_2263A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: Received an invalid NluRequest with every turn as Tap2Edit/AskRepeat turns.", buf, 0xCu);
  }
  uint64_t v27 = 0;
  v11 = (void *)v33;
LABEL_37:
  v28 = v7;
LABEL_38:

  v7 = v28;
LABEL_39:
  id v35 = objc_alloc_init(MEMORY[0x263F71DF8]);
  [v35 setType:v27];
  [v35 setCurrentTurn:v7];
  [v35 setPreviousTurns:v11];
  id v36 = objc_alloc_init(MEMORY[0x263F71DF0]);
  v37 = [v3 ctxUpdateRequest];
  v38 = [v37 requestId];
  v39 = (void *)[v38 copy];
  [v36 setRequestId:v39];

  id v48 = v35;
  v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
  v41 = (void *)[v40 mutableCopy];
  [v36 setReformedTurnInputBundles:v41];

  v42 = [[CDMContextUpdateResponseCommand alloc] initWithCtxUpdateResponse:v36];
  if ((v47 & 1) == 0) {
    [(CDMContextUpdateService *)self doCoreAnalyticsForContextUpdateOutcome:v27 numTurnsRollback:v14 locale:self->locale];
  }

  return v42;
}

- (id)setup:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    v13 = "-[CDMContextUpdateService setup:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Setting up Context Update Service", (uint8_t *)&v12, 0xCu);
  }

  v6 = [v4 dynamicConfig];
  v7 = [v6 languageCode];
  locale = self->locale;
  self->locale = v7;

  if (!self->locale)
  {
    v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      v13 = "-[CDMContextUpdateService setup:]";
      _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: Received a setup request command with locale being nil.", (uint8_t *)&v12, 0xCu);
    }
  }
  self->super.super._serviceState = 2;
  v10 = [(CDMBaseService *)self createSetupResponseCommand];

  return v10;
}

@end