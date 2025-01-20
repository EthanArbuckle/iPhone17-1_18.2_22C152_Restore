@interface CDMContextualSpanMatcherService
+ (BOOL)isAssetRequired;
+ (BOOL)isEnabled;
- (ContextualSpanMatcher)contextualSpanMatcher;
- (NSArray)overrideSpansForReplay;
- (id)getContextualSpansInternal:(id)a3;
- (id)getPredictor;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)setup:(id)a3;
- (void)setContextualSpanMatcher:(id)a3;
@end

@implementation CDMContextualSpanMatcherService

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
  return +[CDMFeatureFlags isContextualSpanMatcherEnabled];
}

+ (BOOL)isAssetRequired
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideSpansForReplay, 0);
  objc_storeStrong((id *)&self->_contextualSpanMatcher, 0);
}

- (NSArray)overrideSpansForReplay
{
  return self->_overrideSpansForReplay;
}

- (void)setContextualSpanMatcher:(id)a3
{
}

- (ContextualSpanMatcher)contextualSpanMatcher
{
  return self->_contextualSpanMatcher;
}

- (id)getContextualSpansInternal:(id)a3
{
  return (id)[(ContextualSpanMatcher *)self->_contextualSpanMatcher getContextualSpansWithRequest:a3];
}

- (id)getPredictor
{
  id v2 = objc_alloc_init(MEMORY[0x263F53FC0]);
  return v2;
}

- (id)handle:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315138;
    v16 = "-[CDMContextualSpanMatcherService handle:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Calling ContextualSpanMatcher", (uint8_t *)&v15, 0xCu);
  }

  if (v4
    && ([v4 contextualSpanMatcherRequest],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    if (self->_overrideSpansForReplay)
    {
      v7 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 136315138;
        v16 = "-[CDMContextualSpanMatcherService handle:]";
        _os_log_debug_impl(&dword_2263A0000, v7, OS_LOG_TYPE_DEBUG, "%s ContextualSpanMatcher is using override contextual spans", (uint8_t *)&v15, 0xCu);
      }

      v8 = [[CDMContextualSpanMatcherResponseCommand alloc] initWithMentions:self->_overrideSpansForReplay];
    }
    else
    {
      v11 = [v4 contextualSpanMatcherRequest];
      v12 = [(CDMContextualSpanMatcherService *)self getContextualSpansInternal:v11];

      v13 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 136315394;
        v16 = "-[CDMContextualSpanMatcherService handle:]";
        __int16 v17 = 2112;
        v18 = v12;
        _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s #ContextualSpanMatcherService obtained response: %@; handling now",
          (uint8_t *)&v15,
          0x16u);
      }

      v14 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = 136315138;
        v16 = "-[CDMContextualSpanMatcherService handle:]";
        _os_log_impl(&dword_2263A0000, v14, OS_LOG_TYPE_INFO, "%s Returning from ContextualSpanMatcher", (uint8_t *)&v15, 0xCu);
      }

      v8 = [[CDMContextualSpanMatcherResponseCommand alloc] initWithContextualSpanMatcherResponse:v12];
    }
  }
  else
  {
    v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      v16 = "-[CDMContextualSpanMatcherService handle:]";
      _os_log_error_impl(&dword_2263A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: ContextualSpanMatcher: Either Request and/or Predictor is nil", (uint8_t *)&v15, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (id)setup:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    int v15 = "-[CDMContextualSpanMatcherService setup:]";
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s Setting up ContextualSpanMatcher service", (uint8_t *)&v14, 0xCu);
  }

  v6 = [v4 dynamicConfig];

  v7 = [v6 overrideContextualSpans];
  overrideSpansForReplay = self->_overrideSpansForReplay;
  self->_overrideSpansForReplay = v7;

  self->super.super._serviceState = 2;
  v9 = [(CDMContextualSpanMatcherService *)self getPredictor];
  contextualSpanMatcher = self->_contextualSpanMatcher;
  self->_contextualSpanMatcher = v9;

  v11 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    int v15 = "-[CDMContextualSpanMatcherService setup:]";
    _os_log_impl(&dword_2263A0000, v11, OS_LOG_TYPE_INFO, "%s ContextualSpanMatcher service loaded", (uint8_t *)&v14, 0xCu);
  }

  v12 = [(CDMBaseService *)self createSetupResponseCommand];
  return v12;
}

@end