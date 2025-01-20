@interface ANCoreAnalytics
- (void)send:(id)a3 withPayload:(id)a4;
@end

@implementation ANCoreAnalytics

- (void)send:(id)a3 withPayload:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  char v8 = [v7 BOOLForDefault:*MEMORY[0x1E4F4A6C0]];

  if (v8)
  {
    v9 = [@"com.apple.announce." stringByAppendingString:v5];
    id v11 = v6;
    AnalyticsSendEventLazy();
  }
  else
  {
    v10 = ANLogHandleCoreAnalytics();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v13 = &stru_1F34A0E10;
      __int16 v14 = 2080;
      v15 = "-[ANCoreAnalytics send:withPayload:]";
      _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEBUG, "%@%s CA Events Disabled.", buf, 0x16u);
    }

    v9 = ANLogHandleCoreAnalytics();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v13 = &stru_1F34A0E10;
      __int16 v14 = 2080;
      v15 = "-[ANCoreAnalytics send:withPayload:]";
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEBUG, "%@%s CA Ignored event name: %@, event payload: %@", buf, 0x2Au);
    }
  }
}

id __36__ANCoreAnalytics_send_withPayload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end