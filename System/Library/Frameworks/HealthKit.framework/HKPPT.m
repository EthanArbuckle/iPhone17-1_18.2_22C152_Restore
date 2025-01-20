@interface HKPPT
- (BOOL)runTest:(id)a3 options:(id)a4;
- (HKPPT)init;
- (HKPPT)initWithHKPPTInterface:(id)a3 usingQueue:(id)a4;
- (id)_testNameForDriver:(id)a3;
- (id)builtinTests;
- (void)_failedTest:(id)a3;
- (void)_failedTest:(id)a3 withResults:(id)a4;
- (void)_finishedTest:(id)a3;
- (void)_finishedTest:(id)a3 extraResults:(id)a4;
- (void)_startedTest:(id)a3;
- (void)dealloc;
- (void)failedTest:(id)a3 results:(id)a4 error:(id)a5;
- (void)finishedTest:(id)a3 extraResults:(id)a4;
- (void)invalidConfigurationForTest:(id)a3 error:(id)a4;
- (void)startedTest:(id)a3;
@end

@implementation HKPPT

- (HKPPT)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKPPT)initWithHKPPTInterface:(id)a3 usingQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HKPPT;
  v9 = [(HKPPT *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pptInterface, a3);
    if (v8)
    {
      v11 = (OS_dispatch_queue *)v8;
      pptQueue = v10->_pptQueue;
      v10->_pptQueue = v11;
    }
    else
    {
      v13 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v14 = MEMORY[0x1E4F14428];
      pptQueue = v10->_pptQueue;
      v10->_pptQueue = v13;
    }

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activeTestsByName = v10->_activeTestsByName;
    v10->_activeTestsByName = v15;
  }
  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HKPPT;
  [(HKPPT *)&v4 dealloc];
}

- (id)builtinTests
{
  v2 = +[HKPPTPluginManager sharedPluginManager];
  v3 = [v2 builtinTests];

  return v3;
}

- (id)_testNameForDriver:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_activeTestsByName;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_activeTestsByName, "objectForKeyedSubscript:", v10, (void)v14);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          id v12 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (void)invalidConfigurationForTest:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(HKPPT *)self startedTest:v7];
  [(HKPPT *)self failedTest:v7 results:0 error:v6];
}

- (void)startedTest:(id)a3
{
  uint64_t v4 = [(HKPPT *)self _testNameForDriver:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(HKPPT *)self _startedTest:v4];
    uint64_t v5 = v6;
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)failedTest:(id)a3 results:(id)a4 error:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [(HKPPT *)self _testNameForDriver:a3];
  if (v10)
  {
    [(NSMutableDictionary *)self->_activeTestsByName removeObjectForKey:v10];
    if (v9)
    {
      if (!v8)
      {
        long long v14 = @"error";
        v13 = [v9 description];
        v15[0] = v13;
        id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_8;
      }
      id v11 = (void *)[v8 mutableCopy];
      id v12 = [v9 description];
      [v11 setObject:v12 forKeyedSubscript:@"error"];

      id v8 = v11;
    }
    if (v8)
    {
LABEL_6:
      [(HKPPT *)self _failedTest:v10 withResults:v8];
      goto LABEL_9;
    }
LABEL_8:
    [(HKPPT *)self _failedTest:v10];
  }
LABEL_9:
}

- (void)finishedTest:(id)a3 extraResults:(id)a4
{
  id v7 = a4;
  uint64_t v6 = [(HKPPT *)self _testNameForDriver:a3];
  if (v6)
  {
    [(NSMutableDictionary *)self->_activeTestsByName removeObjectForKey:v6];
    if (v7) {
      [(HKPPT *)self _finishedTest:v6 extraResults:v7];
    }
    else {
      [(HKPPT *)self _finishedTest:v6];
    }
  }
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKey:@"testType"];
  if (!v8)
  {
    _HKInitializeLogging();
    long long v15 = HKLogTesting();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v6;
      long long v16 = "[PPT] Skipping unspecified performance test type for: %@";
LABEL_9:
      _os_log_impl(&dword_19C023000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v18, 0xCu);
    }
LABEL_12:

    BOOL v14 = 0;
    goto LABEL_13;
  }
  id v9 = [v7 objectForKeyedSubscript:@"enabled"];
  char v10 = [v9 BOOLValue];

  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    long long v15 = HKLogTesting();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v6;
      long long v16 = "[PPT] Skipping disabled performance test: %@";
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  id v11 = +[HKPPTPluginManager sharedPluginManager];
  id v12 = (objc_class *)[v11 classForTestType:v8];

  if (!v12)
  {
    _HKInitializeLogging();
    long long v15 = HKLogTesting();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[HKPPT runTest:options:]((uint64_t)v6, (uint64_t)v8, v15);
    }
    goto LABEL_12;
  }
  id v13 = objc_alloc_init(v12);
  [(NSMutableDictionary *)self->_activeTestsByName setObject:v13 forKeyedSubscript:v6];
  [v13 runTest:v6 options:v7 controller:self];

  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)_startedTest:(id)a3
{
  id v4 = a3;
  pptQueue = self->_pptQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __22__HKPPT__startedTest___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(pptQueue, v7);
}

void __22__HKPPT__startedTest___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void *)(a1 + 40);
    v3 = *(void **)(*(void *)(a1 + 32) + 8);
    [v3 startedTest:v2];
  }
  else
  {
    _HKInitializeLogging();
    id v4 = HKLogTesting();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "[PPT] *** HKPPT application object does not conform to startedTest.", v5, 2u);
    }
  }
}

- (void)_finishedTest:(id)a3
{
  id v4 = a3;
  pptQueue = self->_pptQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __23__HKPPT__finishedTest___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(pptQueue, v7);
}

void __23__HKPPT__finishedTest___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void *)(a1 + 40);
    v3 = *(void **)(*(void *)(a1 + 32) + 8);
    [v3 finishedTest:v2];
  }
  else
  {
    _HKInitializeLogging();
    id v4 = HKLogTesting();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "[PPT] *** HKPPT application object does not conform to finishedTest.", v5, 2u);
    }
  }
}

- (void)_finishedTest:(id)a3 extraResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  pptQueue = self->_pptQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__HKPPT__finishedTest_extraResults___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(pptQueue, block);
}

void __36__HKPPT__finishedTest_extraResults___block_invoke(void *a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = a1[5];
    v3 = *(void **)(a1[4] + 8);
    uint64_t v4 = a1[6];
    [v3 finishedTest:v2 extraResults:v4];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v5 = HKLogTesting();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "[PPT] *** HKPPT application object does not conform to finishedTest:extraResults:.", v6, 2u);
    }
  }
}

- (void)_failedTest:(id)a3
{
  id v4 = a3;
  pptQueue = self->_pptQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __21__HKPPT__failedTest___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(pptQueue, v7);
}

void __21__HKPPT__failedTest___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void *)(a1 + 40);
    v3 = *(void **)(*(void *)(a1 + 32) + 8);
    [v3 failedTest:v2];
  }
  else
  {
    _HKInitializeLogging();
    id v4 = HKLogTesting();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "[PPT] *** HKPPT application object does not conform to failedTest:.", v5, 2u);
    }
  }
}

- (void)_failedTest:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  pptQueue = self->_pptQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__HKPPT__failedTest_withResults___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(pptQueue, block);
}

void __33__HKPPT__failedTest_withResults___block_invoke(void *a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = a1[5];
    v3 = *(void **)(a1[4] + 8);
    uint64_t v4 = a1[6];
    [v3 failedTest:v2 withResults:v4];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v5 = HKLogTesting();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "[PPT] *** HKPPT application object does not conform to failedTest:withResults:.", v6, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTestsByName, 0);
  objc_storeStrong((id *)&self->_pptQueue, 0);

  objc_storeStrong((id *)&self->_pptInterface, 0);
}

- (void)runTest:(os_log_t)log options:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "Unrecognized performance test: %@ (%@)", (uint8_t *)&v3, 0x16u);
}

@end