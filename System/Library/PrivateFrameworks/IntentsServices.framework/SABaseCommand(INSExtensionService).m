@interface SABaseCommand(INSExtensionService)
- (BOOL)ins_isJSONPayload;
- (id)ins_aceIntent;
- (id)ins_aceIntentResponse;
- (id)ins_afAnalyticsContext;
- (uint64_t)ins_analyticsBeginEventType;
- (uint64_t)ins_analyticsEndEventType;
- (uint64_t)ins_jsonEncodedIntent;
- (uint64_t)ins_jsonEncodedIntentResponse;
- (uint64_t)ins_protobufEncodedIntent;
- (uint64_t)ins_protobufEncodedIntentResponse;
- (void)ins_invokeErrorCompletionHandler:()INSExtensionService forUnderlyingError:;
- (void)ins_invokeErrorCompletionHandler:()INSExtensionService withErrorCode:underlyingError:;
- (void)ins_sendIntent:()INSExtensionService toExtensionProxy:onQueue:completionHandler:;
@end

@implementation SABaseCommand(INSExtensionService)

- (id)ins_afAnalyticsContext
{
  v12[1] = *MEMORY[0x263EF8340];
  v2 = +[INSAnalytics sharedAnalytics];
  v3 = [v2 contextDictionaryForCommand:a1];

  id v4 = a1;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [v6 metricsContext];

  if (v7)
  {
    v11 = @"metricsContext";
    v12[0] = v7;
    v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v8 = IFMergeDictionaries();

    v3 = (void *)v8;
  }

  return v3;
}

- (void)ins_invokeErrorCompletionHandler:()INSExtensionService forUnderlyingError:
{
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (a3)
  {
    id v6 = (objc_class *)MEMORY[0x263F64820];
    v7 = a3;
    uint64_t v8 = (void *)[[v6 alloc] initWithErrorCode:-1];
    v9 = [v5 domain];
    uint64_t v10 = [v5 code];
    if ([v9 isEqualToString:*MEMORY[0x263F0F758]])
    {
      if (v10 == 3001)
      {
        v11 = @"kAFAssistantErrorDomain";
        v17 = @"kAFAssistantErrorDomain";
        v13 = (uint64_t *)MEMORY[0x263F65918];
      }
      else
      {
        if (v10 != 3005)
        {
          v11 = @"kAFAssistantErrorDomain";
          v18 = @"kAFAssistantErrorDomain";
          uint64_t v15 = 1302;
          goto LABEL_17;
        }
        v11 = @"SiriAceErrorDomain";
        v12 = @"SiriAceErrorDomain";
        v13 = (uint64_t *)MEMORY[0x263F658D0];
      }
      uint64_t v15 = *v13;
      [v8 setErrorCode:*v13];
    }
    else
    {
      if (![v9 isEqualToString:*MEMORY[0x263F0F768]]) {
        goto LABEL_11;
      }
      switch(v10)
      {
        case 2005:
          v11 = @"kAFAssistantErrorDomain";
          v19 = @"kAFAssistantErrorDomain";
          uint64_t v15 = 1315;
          [v8 setErrorCode:1315];
          break;
        case 5001:
          v11 = @"kAFAssistantErrorDomain";
          v20 = @"kAFAssistantErrorDomain";
          uint64_t v15 = 1301;
          break;
        case 5000:
          v11 = @"kAFAssistantErrorDomain";
          v14 = @"kAFAssistantErrorDomain";
          uint64_t v15 = 1304;
          break;
        default:
LABEL_11:
          v11 = @"kAFAssistantErrorDomain";
          v16 = @"kAFAssistantErrorDomain";
          uint64_t v15 = 1399;
          break;
      }
    }
LABEL_17:
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08608];
    v25[0] = v5;
    v22 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v23 = [v21 errorWithDomain:v11 code:v15 userInfo:v22];

    v7[2](v7, v8, v23);
    kdebug_trace();
  }
}

- (void)ins_invokeErrorCompletionHandler:()INSExtensionService withErrorCode:underlyingError:
{
  v26[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = a3;
  id v9 = a5;
  if (v8)
  {
    uint64_t v10 = objc_msgSend(a1, "ins_analyticsEndEventType");
    uint64_t v11 = 603;
    if (a4 != 1306) {
      uint64_t v11 = v10;
    }
    uint64_t v24 = v11;
    if (a4 == 1316) {
      uint64_t v12 = *MEMORY[0x263F658E0];
    }
    else {
      uint64_t v12 = a4;
    }
    v13 = (void *)[objc_alloc(MEMORY[0x263F64820]) initWithErrorCode:v12];
    if (v9)
    {
      v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = *MEMORY[0x263F08608];
      v26[0] = v9;
      uint64_t v15 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
      v16 = [v14 errorWithDomain:@"kAFAssistantErrorDomain" code:a4 userInfo:v15];
    }
    else
    {
      v16 = 0;
    }
    v8[2](v8, v13, v16);
    v17 = +[INSAnalytics sharedAnalytics];
    v18 = [v17 contextDictionaryForCommand:v13];

    v19 = +[INSAnalytics sharedAnalytics];
    v20 = objc_msgSend(a1, "ins_afAnalyticsContext");
    v21 = +[INSAnalytics sharedAnalytics];
    v22 = [v21 contextDictionaryForError:v16];
    v23 = IFMergeDictionaries();
    objc_msgSend(v19, "logEventWithType:context:contextNoCopy:", v24, v23, 1, v18, v22, 0);
  }
}

- (uint64_t)ins_analyticsEndEventType
{
  return 0;
}

- (uint64_t)ins_analyticsBeginEventType
{
  return 0;
}

- (void)ins_sendIntent:()INSExtensionService toExtensionProxy:onQueue:completionHandler:
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v7 = a6;
  uint64_t v8 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[SABaseCommand(INSExtensionService) ins_sendIntent:toExtensionProxy:onQueue:completionHandler:]";
    __int16 v11 = 2112;
    uint64_t v12 = a1;
    _os_log_error_impl(&dword_2163DF000, v8, OS_LOG_TYPE_ERROR, "%s %@ delivered to the wrong service", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(a1, "ins_invokeErrorCompletionHandler:withErrorCode:underlyingError:", v7, 1303, 0);
}

- (id)ins_aceIntentResponse
{
  v2 = objc_msgSend(a1, "ins_jsonEncodedIntentResponse");

  if (!v2) {
    goto LABEL_3;
  }
  v3 = objc_msgSend(a1, "ins_jsonEncodedIntentResponse");
  id v4 = [v3 dataUsingEncoding:4];
  id v5 = INIntentResponseCreate();

  if (!v5)
  {
LABEL_3:
    id v6 = objc_msgSend(a1, "ins_protobufEncodedIntentResponse");

    if (v6)
    {
      id v7 = objc_msgSend(a1, "ins_protobufEncodedIntentResponse");
      uint64_t v8 = [v7 data];

      if (v8)
      {
        int v9 = objc_msgSend(a1, "ins_protobufEncodedIntentResponse");
        uint64_t v10 = [v9 typeName];
        id v5 = INIntentResponseCreate();
      }
      else
      {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (uint64_t)ins_protobufEncodedIntentResponse
{
  return 0;
}

- (uint64_t)ins_jsonEncodedIntentResponse
{
  return 0;
}

- (id)ins_aceIntent
{
  v2 = objc_msgSend(a1, "ins_jsonEncodedIntent");

  if (!v2) {
    goto LABEL_10;
  }
  v3 = objc_msgSend(a1, "ins_jsonEncodedIntent");
  id v4 = [v3 dataUsingEncoding:4];
  id v5 = INIntentCreate();

  if (!v5)
  {
LABEL_10:
    id v5 = objc_msgSend(a1, "ins_protobufEncodedIntent");

    if (v5)
    {
      id v6 = objc_msgSend(a1, "ins_protobufEncodedIntent");
      id v7 = [v6 typeName];
      uint64_t v8 = objc_msgSend(a1, "ins_protobufEncodedIntent");
      int v9 = [v8 data];
      id v5 = INIntentCreate();
    }
  }

  return v5;
}

- (uint64_t)ins_protobufEncodedIntent
{
  return 0;
}

- (uint64_t)ins_jsonEncodedIntent
{
  return 0;
}

- (BOOL)ins_isJSONPayload
{
  v1 = objc_msgSend(a1, "ins_jsonEncodedIntent");
  BOOL v2 = v1 != 0;

  return v2;
}

@end