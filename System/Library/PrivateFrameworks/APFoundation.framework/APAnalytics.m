@interface APAnalytics
+ (BOOL)_validatePayload:(id)a3;
+ (void)_analyticsSendEvent:(id)a3 eventPayload:(id)a4;
+ (void)_sendEvent:(id)a3 payload:(id)a4;
+ (void)sendEvent:(id)a3;
+ (void)sendEvent:(id)a3 customPayload:(id)a4;
+ (void)sendEvent:(id)a3 statusDetail:(id)a4 startDate:(id)a5 error:(id)a6;
+ (void)sendEvent:(id)a3 valueFloat:(float)a4;
+ (void)sendEvent:(id)a3 valueInt:(int64_t)a4;
+ (void)sendEventError:(int64_t)a3 message:(id)a4;
+ (void)sendEventLazy:(id)a3 eventPayloadBuilder:(id)a4;
+ (void)sendEventTimed:(int64_t)a3 roundtrip:(double)a4 message:(id)a5;
+ (void)sendEventTimed:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 message:(id)a6;
@end

@implementation APAnalytics

+ (void)sendEvent:(id)a3 customPayload:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6 && [v6 count] && objc_msgSend(a1, "_validatePayload:", v7)) {
    +[APAnalytics _sendEvent:v8 payload:v7];
  }
}

+ (void)_sendEvent:(id)a3 payload:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 length])
  {
    v7 = [NSString stringWithFormat:@"%@.%@", @"com.apple.ap.promotedcontent", v5];
    +[APAnalytics _analyticsSendEvent:v7 eventPayload:v6];
  }
  else
  {
    v7 = APLogForCategory(2uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380675;
      v9 = "+[APAnalytics _sendEvent:payload:]";
      _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_ERROR, "%{private}s Invalid eventType", buf, 0xCu);
    }
  }
}

+ (BOOL)_validatePayload:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v4)
  {
    BOOL v10 = 1;
    goto LABEL_22;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v16;
  while (2)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v16 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = APLogForCategory(2uLL);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_1D70B2000, v9, OS_LOG_TYPE_ERROR, "Incorrect key type", v14, 2u);
        }
        goto LABEL_21;
      }
      v9 = [v3 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = APLogForCategory(2uLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v14 = 0;
          v12 = "Nested dictionaries are not supported.";
LABEL_19:
          _os_log_impl(&dword_1D70B2000, v11, OS_LOG_TYPE_ERROR, v12, v14, 2u);
        }
LABEL_20:

LABEL_21:
        BOOL v10 = 0;
        goto LABEL_22;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = APLogForCategory(2uLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v14 = 0;
          v12 = "Nested arrays are not supported.";
          goto LABEL_19;
        }
        goto LABEL_20;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    BOOL v10 = 1;
    if (v5) {
      continue;
    }
    break;
  }
LABEL_22:

  return v10;
}

+ (void)_analyticsSendEvent:(id)a3 eventPayload:(id)a4
{
}

+ (void)sendEventTimed:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 message:(id)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  if (a4 && a5)
  {
    [a5 timeIntervalSinceDate:a4];
    if (v11 >= 0.0)
    {
      objc_msgSend(a1, "sendEventTimed:roundtrip:message:", a3, v10);
      goto LABEL_11;
    }
    v12 = APLogForCategory(2uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446210;
      long long v15 = "+[APAnalytics sendEventTimed:startDate:endDate:message:]";
      v13 = "%{public}s Start date is prior to end date";
LABEL_8:
      _os_log_impl(&dword_1D70B2000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    v12 = APLogForCategory(2uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446210;
      long long v15 = "+[APAnalytics sendEventTimed:startDate:endDate:message:]";
      v13 = "%{public}s Invalid parameter";
      goto LABEL_8;
    }
  }

LABEL_11:
}

+ (void)sendEventTimed:(int64_t)a3 roundtrip:(double)a4 message:(id)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = [NSString stringWithFormat:@"%@.%@", @"com.apple.ap.promotedcontent", @"timed"];
  if (v7 && [v7 length])
  {
    v16[0] = @"code";
    v9 = [NSNumber numberWithInteger:a3];
    v17[0] = v9;
    v16[1] = @"roundTrip";
    id v10 = [NSNumber numberWithDouble:a4];
    v16[2] = @"message";
    v17[1] = v10;
    v17[2] = v7;
    double v11 = (void *)MEMORY[0x1E4F1C9E8];
    v12 = v17;
    v13 = v16;
    uint64_t v14 = 3;
  }
  else
  {
    v18[0] = @"code";
    v9 = [NSNumber numberWithInteger:a3];
    v18[1] = @"roundTrip";
    v19[0] = v9;
    id v10 = [NSNumber numberWithDouble:a4];
    v19[1] = v10;
    double v11 = (void *)MEMORY[0x1E4F1C9E8];
    v12 = v19;
    v13 = v18;
    uint64_t v14 = 2;
  }
  long long v15 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:v14];

  +[APAnalytics _analyticsSendEvent:v8 eventPayload:v15];
}

+ (void)sendEventError:(int64_t)a3 message:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [NSString stringWithFormat:@"%@.%@", @"com.apple.ap.promotedcontent", @"error"];
  if (v5 && [v5 length])
  {
    v13[0] = @"code";
    id v7 = [NSNumber numberWithInteger:a3];
    v13[1] = @"message";
    v14[0] = v7;
    v14[1] = v5;
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    v9 = v14;
    id v10 = (__CFString **)v13;
    uint64_t v11 = 2;
  }
  else
  {
    long long v15 = @"code";
    id v7 = [NSNumber numberWithInteger:a3];
    v16[0] = v7;
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    v9 = v16;
    id v10 = &v15;
    uint64_t v11 = 1;
  }
  v12 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:v11];

  +[APAnalytics _analyticsSendEvent:v6 eventPayload:v12];
}

+ (void)sendEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && [v3 length])
  {
    id v5 = [NSString stringWithFormat:@"%@.%@", @"com.apple.ap.promotedcontent", v4];
    id v7 = @"dataBOOL";
    uint64_t v8 = MEMORY[0x1E4F1CC38];
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    +[APAnalytics _analyticsSendEvent:v5 eventPayload:v6];
  }
  else
  {
    id v5 = APLogForCategory(2uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      id v10 = "+[APAnalytics sendEvent:]";
      _os_log_impl(&dword_1D70B2000, v5, OS_LOG_TYPE_ERROR, "%{public}s Invalid eventType", buf, 0xCu);
    }
  }
}

+ (void)sendEvent:(id)a3 valueInt:(int64_t)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"dataInt";
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithInteger:a4];
  v10[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  +[APAnalytics _sendEvent:v6 payload:v8];
}

+ (void)sendEvent:(id)a3 valueFloat:(float)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v10 = @"dataFloat";
  id v5 = NSNumber;
  id v6 = a3;
  *(float *)&double v7 = a4;
  uint64_t v8 = [v5 numberWithFloat:v7];
  v11[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  +[APAnalytics _sendEvent:v6 payload:v9];
}

+ (void)sendEvent:(id)a3 statusDetail:(id)a4 startDate:(id)a5 error:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v10 = NSNumber;
  id v11 = a4;
  id v12 = a3;
  [a5 timeIntervalSinceNow];
  v13 = objc_msgSend(v10, "numberWithDouble:");
  if (v9)
  {
    uint64_t v14 = APLogForCategory(2uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      long long v15 = [v9 localizedDescription];
      int v19 = 136446466;
      uint64_t v20 = "+[APAnalytics sendEvent:statusDetail:startDate:error:]";
      __int16 v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_1D70B2000, v14, OS_LOG_TYPE_ERROR, "%{public}s Received error for timed event %{public}@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v16 = &unk_1F2EAD5F8;
  }
  else
  {
    uint64_t v16 = &unk_1F2EAD5E0;
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v17 setObject:v13 forKeyedSubscript:@"processingTime"];
  [v17 setObject:v11 forKeyedSubscript:@"statusDetails"];

  [v17 setObject:v16 forKeyedSubscript:@"statusCode"];
  long long v18 = (void *)[v17 copy];
  +[APAnalytics sendEvent:v12 customPayload:v18];
}

+ (void)sendEventLazy:(id)a3 eventPayloadBuilder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if ([v5 length])
    {
      double v7 = [NSString stringWithFormat:@"%@.%@", @"com.apple.ap.promotedcontent", v5];
      id v8 = v6;
      AnalyticsSendEventLazy();
    }
    else
    {
      double v7 = APLogForCategory(2uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_ERROR, "Invalid eventType", buf, 2u);
      }
    }
  }
}

@end