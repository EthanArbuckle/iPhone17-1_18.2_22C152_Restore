@interface CoreDAVSRVLookupTask
- (CoreDAVSRVLookupTask)initWithServiceString:(id)a3;
- (NSArray)fetchedRecords;
- (NSString)serviceString;
- (id)description;
- (void)_runOnCallbackThread:(id)a3;
- (void)finishCoreDAVTaskWithError:(id)a3;
- (void)handleResolvedEndPoints:(id)a3;
- (void)performCoreDAVTask;
- (void)setFetchedRecords:(id)a3;
- (void)setServiceString:(id)a3;
@end

@implementation CoreDAVSRVLookupTask

- (CoreDAVSRVLookupTask)initWithServiceString:(id)a3
{
  id v5 = a3;
  if (!v5 || (v6 = v5, ![v5 length]))
  {
    id v11 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Non-nil and non-zero length 'serviceSting' required." userInfo:0];
    objc_exception_throw(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)CoreDAVSRVLookupTask;
  v7 = [(CoreDAVTask *)&v12 initWithURL:0];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_serviceString, a3);
    fetchedRecords = v8->_fetchedRecords;
    v8->_fetchedRecords = 0;
  }
  return v8;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVSRVLookupTask;
  v4 = [(CoreDAVTask *)&v8 description];
  [v3 appendFormat:@"[%@ ", v4];

  id v5 = [(CoreDAVSRVLookupTask *)self serviceString];
  [v3 appendFormat:@"|  Service string: [%@]", v5];

  v6 = [(CoreDAVSRVLookupTask *)self fetchedRecords];
  objc_msgSend(v3, "appendFormat:", @"| Number of SRV records: [%lu]", objc_msgSend(v6, "count"));

  [v3 appendFormat:@"]"];
  return v3;
}

- (void)performCoreDAVTask
{
  if (self->_resolver)
  {
    nw_resolver_set_cancel_handler();
    nw_resolver_cancel();
    resolver = self->_resolver;
    self->_resolver = 0;
  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    [(NSTimer *)timeoutTimer invalidate];
    id v5 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  id v6 = [(CoreDAVSRVLookupTask *)self serviceString];
  [v6 UTF8String];
  srv = (void *)nw_endpoint_create_srv();

  nw_parameters_t v8 = nw_parameters_create();
  v9 = (OS_nw_resolver *)nw_resolver_create_with_endpoint();
  v10 = self->_resolver;
  self->_resolver = v9;
  id v11 = v9;

  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_2;
  v30 = &unk_2641DFC10;
  v31 = self;
  nw_resolver_set_cancel_handler();
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_2_20;
  v25 = &unk_2641DFDD8;
  v26 = self;
  nw_resolver_set_update_handler();
  [(CoreDAVTask *)self timeoutInterval];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_4;
  v19 = &unk_2641DFE00;
  if (v12 <= 0.0) {
    double v12 = 60.0;
  }
  double v21 = v12;
  v20 = self;
  objc_msgSend(MEMORY[0x263EFFA20], "timerWithTimeInterval:repeats:block:", 0, &v16);
  v13 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v14 = self->_timeoutTimer;
  self->_timeoutTimer = v13;

  v15 = [(CoreDAVTask *)self workRunLoop];
  [v15 addTimer:self->_timeoutTimer forMode:*MEMORY[0x263EFF478]];
}

uint64_t __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_2(uint64_t a1)
{
  v2 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  v4 = [v2 logHandleForAccountInfoProvider:WeakRetained];

  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213BFC000, v4, OS_LOG_TYPE_DEFAULT, "nw_resolver canceled; canceling CoreDAVSRVLookupTask",
      buf,
      2u);
  }

  id v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_18;
  v7[3] = &unk_2641DFC10;
  v7[4] = v5;
  return [v5 _runOnCallbackThread:v7];
}

void __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_18(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
  [v1 finishCoreDAVTaskWithError:v2];
}

void __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_2_20(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2 == 2)
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_3;
    v8[3] = &unk_2641DFC88;
    v8[4] = v7;
    id v9 = v5;
    [v7 _runOnCallbackThread:v8];
  }
}

uint64_t __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleResolvedEndPoints:*(void *)(a1 + 40)];
}

void __42__CoreDAVSRVLookupTask_performCoreDAVTask__block_invoke_4(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = +[CoreDAVLogging sharedLogging];
  id v3 = [v2 logHandleForAccountInfoProvider:0];
  v4 = v3;
  if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 134217984;
    uint64_t v8 = v5;
    _os_log_impl(&dword_213BFC000, v4, OS_LOG_TYPE_ERROR, "Timeout interval of %f reached", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:6 userInfo:0];
  [*(id *)(a1 + 32) finishCoreDAVTaskWithError:v6];
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVSRVLookupTask;
  [(CoreDAVTask *)&v7 finishCoreDAVTaskWithError:a3];
  if (self->_resolver)
  {
    nw_resolver_set_cancel_handler();
    nw_resolver_cancel();
    resolver = self->_resolver;
    self->_resolver = 0;
  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    [(NSTimer *)timeoutTimer invalidate];
    id v6 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
}

- (void)_runOnCallbackThread:(id)a3
{
  id v4 = a3;
  id v6 = [(CoreDAVTask *)self taskManager];
  uint64_t v5 = [v6 workRunLoop];
  [v5 performBlock:v4];
}

- (void)handleResolvedEndPoints:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4 || (uint64_t count = nw_array_get_count()) == 0)
  {
    if (self->_resolver)
    {
      int error = nw_resolver_get_error();
      srv_weighted_variant = +[CoreDAVLogging sharedLogging];
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      uint64_t v9 = [srv_weighted_variant logHandleForAccountInfoProvider:WeakRetained];

      if (!error)
      {
        if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213BFC000, v9, OS_LOG_TYPE_INFO, "SRV lookup returned no records", buf, 2u);
        }
        goto LABEL_4;
      }
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v18 = error;
        _os_log_impl(&dword_213BFC000, v9, OS_LOG_TYPE_INFO, "nw_resolver_get_error returned %i", buf, 8u);
      }
    }
    double v12 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"CoreDAVErrorDomain" code:6 userInfo:0];
    goto LABEL_12;
  }
  uint64_t v6 = count;
  srv_weighted_variant = (void *)nw_resolver_create_srv_weighted_variant();
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v6];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = v8;
  uint64_t v9 = v8;
  nw_array_apply();
  v10 = [v9 copy];
  fetchedRecords = self->_fetchedRecords;
  self->_fetchedRecords = v10;

LABEL_4:
  double v12 = 0;
LABEL_12:
  [(CoreDAVSRVLookupTask *)self finishCoreDAVTaskWithError:v12];
}

uint64_t __48__CoreDAVSRVLookupTask_handleResolvedEndPoints___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(CoreDAVSRVResourceRecord);
  uint64_t v6 = [*(id *)(a1 + 32) serviceString];
  [(CoreDAVSRVResourceRecord *)v5 setServiceString:v6];

  objc_super v7 = [NSNumber numberWithUnsignedShort:nw_endpoint_get_port(v4)];
  [(CoreDAVSRVResourceRecord *)v5 setPort:v7];

  hostname = nw_endpoint_get_hostname(v4);
  uint64_t v9 = [NSString stringWithCString:hostname encoding:4];
  if ([v9 hasSuffix:@"."])
  {
    uint64_t v10 = objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - 1);

    uint64_t v9 = (void *)v10;
  }
  [(CoreDAVSRVResourceRecord *)v5 setTarget:v9];
  [*(id *)(a1 + 40) addObject:v5];

  return 1;
}

- (NSString)serviceString
{
  return self->_serviceString;
}

- (void)setServiceString:(id)a3
{
}

- (NSArray)fetchedRecords
{
  return self->_fetchedRecords;
}

- (void)setFetchedRecords:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_fetchedRecords, 0);
  objc_storeStrong((id *)&self->_serviceString, 0);
}

@end