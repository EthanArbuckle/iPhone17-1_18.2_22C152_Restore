@interface FPRTCReportingSession
- (BOOL)flushMessagesSynchronouslyWithError:(id *)a3;
- (FPRTCReportingSession)initWithWithCommonProperties:(id)a3 manager:(id)a4;
- (id)description;
- (id)truncateProviderVersion:(id)a3;
- (void)executeModifyDecoratedPayloadHook:(unint64_t)a3 type:(unint64_t)a4 payload:(id)a5 error:(id)a6 decoratedPayload:(id)a7;
- (void)flushMessagesWithCompletion:(id)a3;
- (void)postReportWithCategory:(unint64_t)a3 type:(unint64_t)a4 payload:(id)a5 error:(id)a6;
- (void)setModifyDecoratedPayloadHook:(id)a3 forCategory:(unint64_t)a4;
- (void)setObserver:(id)a3;
@end

@implementation FPRTCReportingSession

- (id)truncateProviderVersion:(id)a3
{
  if (a3)
  {
    v3 = objc_msgSend(a3, "componentsSeparatedByString:", @" (");
    v4 = [v3 objectAtIndexedSubscript:0];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (FPRTCReportingSession)initWithWithCommonProperties:(id)a3 manager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKey:@"provider"];

  if (v8)
  {
    v19.receiver = self;
    v19.super_class = (Class)FPRTCReportingSession;
    v9 = [(FPRTCReportingSession *)&v19 init];
    if (v9)
    {
      uint64_t v10 = [v6 mutableCopy];
      commonProperties = v9->_commonProperties;
      v9->_commonProperties = (NSMutableDictionary *)v10;

      v12 = [(NSMutableDictionary *)v9->_commonProperties objectForKey:@"providerVersion"];
      if (v12)
      {
        v13 = v9->_commonProperties;
        v14 = [(FPRTCReportingSession *)v9 truncateProviderVersion:v12];
        [(NSMutableDictionary *)v13 setObject:v14 forKey:@"providerVersion"];
      }
      objc_storeStrong((id *)&v9->_backingManager, a4);
      categoryHooks = v9->_categoryHooks;
      v9->_categoryHooks = 0;

      v16 = fp_current_or_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[FPRTCReportingSession initWithWithCommonProperties:manager:]();
      }
    }
    self = v9;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)postReportWithCategory:(unint64_t)a3 type:(unint64_t)a4 payload:(id)a5 error:(id)a6
{
  id v22 = a5;
  id v10 = a6;
  v11 = (void *)[(NSMutableDictionary *)self->_commonProperties mutableCopy];
  [v11 addEntriesFromDictionary:v22];
  v12 = [NSNumber numberWithUnsignedInteger:a3];
  [v11 setObject:v12 forKey:*MEMORY[0x263F62A18]];

  v13 = [NSNumber numberWithUnsignedInteger:a4];
  [v11 setObject:v13 forKey:*MEMORY[0x263F62A30]];

  if (v10)
  {
    v14 = [v10 domain];
    [v11 setObject:v14 forKeyedSubscript:@"errorDomain"];

    v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "code"));
    [v11 setObject:v15 forKeyedSubscript:@"errorCode"];

    v16 = [v10 underlyingErrors];
    v17 = [v16 firstObject];
    v18 = v17;
    if (v17)
    {
      objc_super v19 = [v17 domain];
      [v11 setObject:v19 forKeyedSubscript:@"underlyingErrorDomain"];

      v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "code"));
      [v11 setObject:v20 forKeyedSubscript:@"underlyingErrorCode"];
    }
    if ((unint64_t)[v16 count] >= 2)
    {
      v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "count") - 1);
      [v11 setObject:v21 forKeyedSubscript:@"moreUnderlyingErrors"];
    }
  }
  [(FPRTCReportingSessionManager *)self->_backingManager postReportWithCategory:a3 type:a4 payload:v22 error:v10 decoratedPayload:v11 session:self observer:self->_observer];
}

- (void)flushMessagesWithCompletion:(id)a3
{
}

- (BOOL)flushMessagesSynchronouslyWithError:(id *)a3
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  backingManager = self->_backingManager;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __61__FPRTCReportingSession_flushMessagesSynchronouslyWithError___block_invoke;
  v16 = &unk_2653142B8;
  v18 = &v19;
  id v7 = v5;
  v17 = v7;
  [(FPRTCReportingSessionManager *)backingManager flushMessagesWithCompletion:&v13];
  dispatch_time_t v8 = dispatch_time(0, 16000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "fp_errorWithPOSIXCode:", 60, v13, v14, v15, v16);
    id v10 = (void *)v20[5];
    v20[5] = v9;
  }
  if (a3) {
    *a3 = (id) v20[5];
  }
  BOOL v11 = v20[5] == 0;

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __61__FPRTCReportingSession_flushMessagesSynchronouslyWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  dispatch_semaphore_t v5 = [(NSMutableDictionary *)self->_commonProperties objectForKeyedSubscript:@"provider"];
  id v6 = [(NSMutableDictionary *)self->_commonProperties objectForKeyedSubscript:@"providerVersion"];
  id v7 = [v3 stringWithFormat:@"<%@: %p for %@ version: %@>", v4, self, v5, v6];

  return v7;
}

- (void)setObserver:(id)a3
{
}

- (void)setModifyDecoratedPayloadHook:(id)a3 forCategory:(unint64_t)a4
{
  if (self->_categoryHooks)
  {
    id v6 = a3;
    id v14 = (id)MEMORY[0x2533308D0]();

    categoryHooks = self->_categoryHooks;
    dispatch_time_t v8 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)categoryHooks setObject:v14 forKeyedSubscript:v8];
  }
  else
  {
    uint64_t v9 = (objc_class *)MEMORY[0x263EFF9A0];
    id v10 = a3;
    id v11 = [v9 alloc];
    id v14 = (id)MEMORY[0x2533308D0](v10);

    dispatch_time_t v8 = [NSNumber numberWithUnsignedInteger:a4];
    v12 = (NSMutableDictionary *)objc_msgSend(v11, "initWithObjectsAndKeys:", v14, v8, 0);
    uint64_t v13 = self->_categoryHooks;
    self->_categoryHooks = v12;
  }
}

- (void)executeModifyDecoratedPayloadHook:(unint64_t)a3 type:(unint64_t)a4 payload:(id)a5 error:(id)a6 decoratedPayload:(id)a7
{
  id v15 = a6;
  id v11 = a7;
  categoryHooks = self->_categoryHooks;
  if (categoryHooks)
  {
    uint64_t v13 = [NSNumber numberWithUnsignedInteger:a3];
    id v14 = [(NSMutableDictionary *)categoryHooks objectForKey:v13];

    if (v14) {
      ((void (**)(void, unint64_t, id, id))v14)[2](v14, a4, v15, v11);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryHooks, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_backingManager, 0);
  objc_storeStrong((id *)&self->_providerVersion, 0);
  objc_storeStrong((id *)&self->_providerID, 0);

  objc_storeStrong((id *)&self->_commonProperties, 0);
}

- (void)initWithWithCommonProperties:manager:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_24E024000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] %{public}@ RTC session start", v1, 0xCu);
}

@end