@interface ATXSearchFeedbackListenerTargetBiomeStream
- (ATXSearchFeedbackListenerTargetBiomeStream)init;
- (ATXSearchFeedbackListenerTargetBiomeStream)initWithBiomeUIStream:(id)a3;
- (void)writeSpotlightEvent:(id)a3;
@end

@implementation ATXSearchFeedbackListenerTargetBiomeStream

- (ATXSearchFeedbackListenerTargetBiomeStream)init
{
  v3 = objc_opt_new();
  v4 = [(ATXSearchFeedbackListenerTargetBiomeStream *)self initWithBiomeUIStream:v3];

  return v4;
}

- (ATXSearchFeedbackListenerTargetBiomeStream)initWithBiomeUIStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSearchFeedbackListenerTargetBiomeStream;
  v6 = [(ATXSearchFeedbackListenerTargetBiomeStream *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uiStream, a3);
  }

  return v7;
}

- (void)writeSpotlightEvent:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uiStream = self->_uiStream;
  v6 = +[ATXUIEvent uiEventWithSpotlightEvent:v4];
  [(ATXUniversalBiomeUIStream *)uiStream donateGenericUIEvent:v6];

  v7 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v4 eventType];
    if ((v10 - 1) >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E5D0A2B8[(int)v10 - 1];
    }
    v12 = [v4 appBlendingCacheId];
    v13 = [v4 actionBlendingCacheId];
    v14 = [v4 appSuggestionIds];
    v15 = [v4 actionSuggestionIds];
    *(_DWORD *)buf = 138413570;
    id v17 = v9;
    __int16 v18 = 2112;
    v19 = v11;
    __int16 v20 = 2112;
    v21 = v12;
    __int16 v22 = 2112;
    v23 = v13;
    __int16 v24 = 2112;
    v25 = v14;
    __int16 v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_INFO, "%@ - wrote event of type %@ \nappBlendingCacheId: %@ \nactionBlendingCacheId: %@ \nappUUIDs: %@ \nactionUUIDs: %@", buf, 0x3Eu);
  }
}

- (void).cxx_destruct
{
}

@end