@interface ATXMFeedbackConversionLogger
+ (void)logRecordedFeedbackWithEngagementType:(int)a3 consumerSubType:(unsigned __int8)a4 tracker:(id)a5;
+ (void)logUserInteractionFeedbackWithEngagementType:(int)a3 consumerSubType:(unsigned __int8)a4 tracker:(id)a5;
@end

@implementation ATXMFeedbackConversionLogger

+ (void)logUserInteractionFeedbackWithEngagementType:(int)a3 consumerSubType:(unsigned __int8)a4 tracker:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v8 = (void *)MEMORY[0x1E4F4B680];
  id v9 = a5;
  v10 = [v8 stringForConsumerSubtype:v5];
  v11 = objc_opt_new();
  [v11 setEngagementType:v6];
  [v11 setConsumerSubType:v10];
  [v9 trackScalarForMessage:v11];

  v12 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromClass((Class)a1);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (v6 == 1)
      {
        v14 = @"Rejection";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v14 = @"Engagement";
    }
    *(_DWORD *)buf = 138412802;
    id v16 = v13;
    __int16 v17 = 2112;
    v18 = v14;
    __int16 v19 = 2112;
    v20 = v10;
    _os_log_debug_impl(&dword_1A790D000, v12, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMFeedbackUIInteractionsTracker with engagementType: %@ and consumerSubType: %@", buf, 0x20u);
  }
}

+ (void)logRecordedFeedbackWithEngagementType:(int)a3 consumerSubType:(unsigned __int8)a4 tracker:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v8 = (void *)MEMORY[0x1E4F4B680];
  id v9 = a5;
  v10 = [v8 stringForConsumerSubtype:v5];
  v11 = objc_opt_new();
  [v11 setEngagementType:v6];
  [v11 setConsumerSubType:v10];
  [v9 trackScalarForMessage:v11];

  v12 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromClass((Class)a1);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (v6 == 1)
      {
        v14 = @"Rejection";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v14 = @"Engagement";
    }
    *(_DWORD *)buf = 138412802;
    id v16 = v13;
    __int16 v17 = 2112;
    v18 = v14;
    __int16 v19 = 2112;
    v20 = v10;
    _os_log_debug_impl(&dword_1A790D000, v12, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMFeedbackRecordedTracker with engagementType: %@ and consumerSubType: %@", buf, 0x20u);
  }
}

@end