@interface CRKPlatformInternetDateProvider
+ (id)sharedProvider;
- (CRKInternetDateFetching)dateFetchingProvider;
- (CRKPlatformInternetDateProvider)init;
- (NSDate)internetDateAndTime;
- (NSMutableArray)completionQueue;
- (double)uptimeAtInternetDateAndTimeFetch;
- (id)fetchExistingInternetDate;
- (void)fetchInternetDateWithCompletion:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setDateFetchingProvider:(id)a3;
- (void)setInternetDateAndTime:(id)a3;
- (void)setUptimeAtInternetDateAndTimeFetch:(double)a3;
@end

@implementation CRKPlatformInternetDateProvider

+ (id)sharedProvider
{
  if (sharedProvider_onceToken_0 != -1) {
    dispatch_once(&sharedProvider_onceToken_0, &__block_literal_global_114);
  }
  v2 = (void *)sharedProvider_sharedProvider;

  return v2;
}

uint64_t __49__CRKPlatformInternetDateProvider_sharedProvider__block_invoke()
{
  sharedProvider_sharedProvider = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (CRKPlatformInternetDateProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRKPlatformInternetDateProvider;
  v2 = [(CRKPlatformInternetDateProvider *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    completionQueue = v2->_completionQueue;
    v2->_completionQueue = (NSMutableArray *)v3;

    v2->_uptimeAtInternetDateAndTimeFetch = -1.0;
    uint64_t v5 = objc_opt_new();
    dateFetchingProvider = v2->_dateFetchingProvider;
    v2->_dateFetchingProvider = (CRKInternetDateFetching *)v5;
  }
  return v2;
}

- (void)fetchInternetDateWithCompletion:(id)a3
{
  uint64_t v5 = (void (**)(id, void *, void))a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    v15 = NSStringFromSelector(a2);
    [v14 handleFailureInMethod:a2, self, @"CRKPlatformInternetDateProvider.m", 60, @"%@ must be called from the main thread", v15 object file lineNumber description];
  }
  v6 = [(CRKPlatformInternetDateProvider *)self fetchExistingInternetDate];
  if (v6)
  {
    v7 = _CRKLogGeneral_20();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224C00000, v7, OS_LOG_TYPE_DEFAULT, "Cached time found. No attempt to fetch the internet date and time will be made.", buf, 2u);
    }

    v5[2](v5, v6, 0);
  }
  else
  {
    objc_super v8 = [(CRKPlatformInternetDateProvider *)self completionQueue];
    v9 = (void *)MEMORY[0x22A620AF0](v5);
    [v8 addObject:v9];

    v10 = [(CRKPlatformInternetDateProvider *)self completionQueue];
    unint64_t v11 = [v10 count];

    v12 = _CRKLogGeneral_20();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11 < 2)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224C00000, v12, OS_LOG_TYPE_DEFAULT, "No cached time found. Attempting to fetch the internet date and time for the first time.", buf, 2u);
      }

      v12 = [(CRKPlatformInternetDateProvider *)self dateFetchingProvider];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __67__CRKPlatformInternetDateProvider_fetchInternetDateWithCompletion___block_invoke;
      v16[3] = &unk_2646F5978;
      v16[4] = self;
      [v12 fetchInternetDateWithCompletion:v16];
    }
    else if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224C00000, v12, OS_LOG_TYPE_DEFAULT, "No cached time found, but a fetch for the internet date and time is already in-flight. No attempt to fetch the internet date and time will be made again.", buf, 2u);
    }
  }
}

void __67__CRKPlatformInternetDateProvider_fetchInternetDateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = _CRKLogGeneral_20();
  objc_super v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __67__CRKPlatformInternetDateProvider_fetchInternetDateWithCompletion___block_invoke_cold_1(v6, v8);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = v5;
      _os_log_impl(&dword_224C00000, v8, OS_LOG_TYPE_DEFAULT, "Fetched the internet date and time: %{public}@", (uint8_t *)&v14, 0xCu);
    }

    [*(id *)(a1 + 32) setInternetDateAndTime:v5];
    objc_super v8 = [MEMORY[0x263F08AB0] processInfo];
    [v8 systemUptime];
    objc_msgSend(*(id *)(a1 + 32), "setUptimeAtInternetDateAndTimeFetch:");
  }

  while (1)
  {
    v9 = [*(id *)(a1 + 32) completionQueue];
    uint64_t v10 = [v9 count];

    if (!v10) {
      break;
    }
    unint64_t v11 = [*(id *)(a1 + 32) completionQueue];
    v12 = [v11 firstObject];

    ((void (**)(void, id, id))v12)[2](v12, v5, v6);
    BOOL v13 = [*(id *)(a1 + 32) completionQueue];
    [v13 removeObjectAtIndex:0];
  }
}

- (id)fetchExistingInternetDate
{
  uint64_t v3 = [(CRKPlatformInternetDateProvider *)self internetDateAndTime];
  [(CRKPlatformInternetDateProvider *)self uptimeAtInternetDateAndTimeFetch];
  id v5 = 0;
  if (v3)
  {
    double v6 = v4;
    if (v4 >= 0.0)
    {
      [v3 timeIntervalSince1970];
      double v8 = v7;
      v9 = [MEMORY[0x263F08AB0] processInfo];
      [v9 systemUptime];
      double v11 = v10;

      id v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v8 + v11 - v6];
    }
  }

  return v5;
}

- (CRKInternetDateFetching)dateFetchingProvider
{
  return self->_dateFetchingProvider;
}

- (void)setDateFetchingProvider:(id)a3
{
}

- (NSDate)internetDateAndTime
{
  return self->_internetDateAndTime;
}

- (void)setInternetDateAndTime:(id)a3
{
}

- (double)uptimeAtInternetDateAndTimeFetch
{
  return self->_uptimeAtInternetDateAndTimeFetch;
}

- (void)setUptimeAtInternetDateAndTimeFetch:(double)a3
{
  self->_uptimeAtInternetDateAndTimeFetch = a3;
}

- (NSMutableArray)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_internetDateAndTime, 0);

  objc_storeStrong((id *)&self->_dateFetchingProvider, 0);
}

void __67__CRKPlatformInternetDateProvider_fetchInternetDateWithCompletion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedFailureReason];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch the internet date and time with error: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end