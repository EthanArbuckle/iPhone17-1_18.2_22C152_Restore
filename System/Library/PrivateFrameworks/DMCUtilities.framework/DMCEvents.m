@interface DMCEvents
- (DMCEvents)init;
- (NSString)errorFilePath;
- (id)_eventsPlistFilePath;
- (unint64_t)_maximumEventCount;
- (void)_injectTimestamps:(id)a3;
- (void)_logEvent:(id)a3 category:(id)a4 forTopic:(id)a5;
- (void)logErrorEventForTopic:(id)a3 reason:(id)a4 error:(id)a5 details:(id)a6;
- (void)logRegularEventForTopic:(id)a3 reason:(id)a4 details:(id)a5;
- (void)setErrorFilePath:(id)a3;
@end

@implementation DMCEvents

- (DMCEvents)init
{
  v7.receiver = self;
  v7.super_class = (Class)DMCEvents;
  v2 = [(DMCEvents *)&v7 init];
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __17__DMCEvents_init__block_invoke;
    block[3] = &unk_1E5CFD920;
    v6 = v2;
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, block);
    }
  }
  return v3;
}

void __17__DMCEvents_init__block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v2 = [*(id *)(a1 + 32) _eventsFileFolder];
  char v3 = [v5 fileExistsAtPath:v2 isDirectory:0];

  if ((v3 & 1) == 0)
  {
    v4 = [*(id *)(a1 + 32) _eventsFileFolder];
    [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];
  }
}

- (void)logRegularEventForTopic:(id)a3 reason:(id)a4 details:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (a4) {
    v8 = (__CFString *)a4;
  }
  else {
    v8 = @"Unknown";
  }
  uint64_t v15 = 0x1EFD82000;
  v16[0] = v8;
  v9 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v9 dictionaryWithObjects:v16 forKeys:&v15 count:1];

  v14 = (void *)[v13 mutableCopy];
  [(DMCEvents *)self _injectTimestamps:v14];
  [v14 setObject:v10 forKeyedSubscript:@"Details"];

  [(DMCEvents *)self _logEvent:v14 category:@"Regular" forTopic:v12];
}

- (void)logErrorEventForTopic:(id)a3 reason:(id)a4 error:(id)a5 details:(id)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (__CFString *)a4;
  id v12 = a5;
  if (v11) {
    v13 = v11;
  }
  else {
    v13 = @"Unknown";
  }
  uint64_t v22 = 0x1EFD82000;
  v23[0] = v13;
  v14 = (void *)MEMORY[0x1E4F1C9E8];
  id v15 = a6;
  v16 = [v14 dictionaryWithObjects:v23 forKeys:&v22 count:1];
  v17 = (void *)[v16 mutableCopy];

  [(DMCEvents *)self _injectTimestamps:v17];
  [v17 setObject:v15 forKeyedSubscript:@"Details"];

  if (v12)
  {
    v18 = [v12 domain];
    [v17 setObject:v18 forKeyedSubscript:@"Error Domain"];

    v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "code"));
    [v17 setObject:v19 forKeyedSubscript:@"Error Code"];

    v20 = [v12 localizedDescription];
    [v17 setObject:v20 forKeyedSubscript:@"Error Description"];

    v21 = [v12 underlyingErrors];
    [v17 setObject:v21 forKeyedSubscript:@"Error Underlying Errors"];
  }
  [(DMCEvents *)self _logEvent:v17 category:@"Error" forTopic:v10];
}

- (void)_logEvent:(id)a3 category:(id)a4 forTopic:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_logEvent_category_forTopic__onceToken != -1) {
    dispatch_once(&_logEvent_category_forTopic__onceToken, &__block_literal_global_7);
  }
  id v11 = _logEvent_category_forTopic__serialQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __41__DMCEvents__logEvent_category_forTopic___block_invoke_2;
  v15[3] = &unk_1E5CFDA88;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async_and_wait(v11, v15);
}

uint64_t __41__DMCEvents__logEvent_category_forTopic___block_invoke()
{
  _logEvent_category_forTopic__serialQueue = (uint64_t)dispatch_queue_create("DMCEvents", 0);
  return MEMORY[0x1F41817F8]();
}

void __41__DMCEvents__logEvent_category_forTopic___block_invoke_2(id *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] _eventsPlistFilePath];
  char v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  v4 = objc_opt_new();
  id v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__DMCEvents__logEvent_category_forTopic___block_invoke_3;
  v9[3] = &unk_1E5CFDA60;
  id v10 = a1[5];
  id v11 = a1[6];
  id v5 = a1[7];
  id v6 = a1[4];
  id v12 = v5;
  id v13 = v6;
  [v4 coordinateReadingItemAtURL:v3 options:0 writingItemAtURL:v3 options:0 error:&v14 byAccessor:v9];
  id v7 = v14;

  if (v7)
  {
    id v8 = *DMCLogObjects();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v7;
      _os_log_impl(&dword_1A7863000, v8, OS_LOG_TYPE_ERROR, "[NSFileCoordinator coordinateReadingItemAtURL] failed with error: %{public}@", buf, 0xCu);
    }
  }
}

void __41__DMCEvents__logEvent_category_forTopic___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v5 absoluteString];
  int v9 = [v7 fileExistsAtPath:v8];

  if (!v9) {
    goto LABEL_3;
  }
  id v10 = (void *)MEMORY[0x1E4F1C9E8];
  id v11 = [v5 absoluteString];
  id v12 = [v10 DMCDictionaryFromFile:v11];
  id v13 = (void *)[v12 mutableCopy];

  if (!v13)
  {
LABEL_3:
    id v14 = *DMCLogObjects();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7863000, v14, OS_LOG_TYPE_INFO, "Failed to load event dictionary. Creating a new one", buf, 2u);
    }
    id v13 = objc_opt_new();
  }
  uint64_t v15 = [v13 objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (v15)
  {
    id v16 = (void *)v15;
    uint64_t v17 = [v13 objectForKeyedSubscript:*(void *)(a1 + 32)];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v19 = *DMCLogObjects();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_1A7863000, v19, OS_LOG_TYPE_ERROR, "Event category is not a dictionary", v35, 2u);
      }
      [v13 setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
    }
  }
  v20 = (void *)MEMORY[0x1E4F1CA60];
  v21 = [v13 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v22 = [v20 dictionaryWithDictionary:v21];

  uint64_t v23 = [v22 objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [v22 objectForKeyedSubscript:*(void *)(a1 + 40)];
    objc_opt_class();
    char v26 = objc_opt_isKindOfClass();

    if ((v26 & 1) == 0)
    {
      v27 = *DMCLogObjects();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1A7863000, v27, OS_LOG_TYPE_ERROR, "Topic is not an array", v34, 2u);
      }
      [v22 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
    }
  }
  v28 = (void *)MEMORY[0x1E4F1CA48];
  v29 = [v22 objectForKeyedSubscript:*(void *)(a1 + 40)];
  v30 = [v28 arrayWithArray:v29];

  [v30 insertObject:*(void *)(a1 + 48) atIndex:0];
  unint64_t v31 = [*(id *)(a1 + 56) _maximumEventCount];
  if ([v30 count] > v31) {
    objc_msgSend(v30, "removeObjectsInRange:", v31, objc_msgSend(v30, "count") - v31);
  }
  [v22 setObject:v30 forKeyedSubscript:*(void *)(a1 + 40)];
  [v13 setObject:v22 forKeyedSubscript:*(void *)(a1 + 32)];
  v32 = [v6 absoluteString];
  [v13 DMCWriteToBinaryFile:v32];

  if ((v9 & 1) == 0)
  {
    v33 = [v6 absoluteString];
    DMCSetSkipBackupAttributeToItemAtPath(v33, 1);
  }
}

- (void)_injectTimestamps:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  id v7 = [v3 date];
  id v5 = +[DMCDateFormatterFactory isoLocalTimeZoneDateFormatter];
  id v6 = [v5 stringFromDate:v7];

  [v4 setObject:v6 forKeyedSubscript:@"Timestamp (Localized)"];
  [v4 setObject:v7 forKeyedSubscript:@"Timestamp"];
}

- (id)_eventsPlistFilePath
{
  errorFilePath = self->_errorFilePath;
  if (!errorFilePath)
  {
    DMCEventsFilePath();
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_errorFilePath;
    self->_errorFilePath = v4;

    errorFilePath = self->_errorFilePath;
  }
  return errorFilePath;
}

- (unint64_t)_maximumEventCount
{
  return 30;
}

- (NSString)errorFilePath
{
  return self->_errorFilePath;
}

- (void)setErrorFilePath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end