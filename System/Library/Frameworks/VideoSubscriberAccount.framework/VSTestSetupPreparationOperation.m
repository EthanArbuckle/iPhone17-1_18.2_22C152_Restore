@interface VSTestSetupPreparationOperation
- (NSArray)errors;
- (NSOperationQueue)privateQueue;
- (VSTestSetupPreparationOperation)init;
- (void)addError:(id)a3;
- (void)executionDidBegin;
- (void)setErrors:(id)a3;
- (void)setPrivateQueue:(id)a3;
@end

@implementation VSTestSetupPreparationOperation

- (VSTestSetupPreparationOperation)init
{
  v11.receiver = self;
  v11.super_class = (Class)VSTestSetupPreparationOperation;
  v2 = [(VSTestSetupPreparationOperation *)&v11 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v3;

    [(NSOperationQueue *)v2->_privateQueue setMaxConcurrentOperationCount:1];
    v5 = v2->_privateQueue;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [(NSOperationQueue *)v5 setName:v7];

    v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    errors = v2->_errors;
    v2->_errors = v8;
  }
  return v2;
}

- (void)executionDidBegin
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke;
  v9[3] = &unk_1E6BD29A8;
  v9[4] = self;
  v3 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v9];
  v4 = [(VSTestSetupPreparationOperation *)self privateQueue];
  [v4 addOperation:v3];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_16;
  v8[3] = &unk_1E6BD29A8;
  v8[4] = self;
  v5 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_23;
  v7[3] = &unk_1E6BD29A8;
  v7[4] = self;
  [v5 setCompletionBlock:v7];
  v6 = [(VSTestSetupPreparationOperation *)self privateQueue];
  [v6 addOperation:v5];
}

void __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v2 = +[VSAccountStore sharedAccountStore];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__12;
  v22 = __Block_byref_object_dispose__12;
  id v23 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_4;
  block[3] = &unk_1E6BD4038;
  v17 = &v18;
  id v3 = v2;
  id v16 = v3;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  v4 = objc_alloc_init(VSSemaphore);
  v5 = v4;
  v6 = (void *)v19[5];
  if (v6)
  {
    id v7 = v6;
    v24[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_2;
    v11[3] = &unk_1E6BD4158;
    id v9 = v7;
    uint64_t v10 = *(void *)(a1 + 32);
    id v12 = v9;
    uint64_t v13 = v10;
    v14 = v5;
    [v3 removeAccounts:v8 withCompletionHandler:v11];
  }
  else
  {
    [(VSSemaphore *)v4 signal];
  }
  [(VSSemaphore *)v5 wait];

  _Block_object_dispose(&v18, 8);
}

uint64_t __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) firstAccount];

  return MEMORY[0x1F41817F8]();
}

void __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (a2)
  {
    id v7 = VSDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "Successfully removed account %@ from account store.", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    id v9 = *(void **)(a1 + 40);
    if (!v5) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The error parameter must not be nil."];
    }
    [v9 addError:v6];
    id v7 = VSErrorLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_2_cold_1((uint64_t)v6, v7);
    }
  }

  [*(id *)(a1 + 48) signal];
}

void __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_16(uint64_t a1)
{
  v2 = +[VSDevice currentDevice];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_2_18;
  v3[3] = &unk_1E6BD28B0;
  v3[4] = *(void *)(a1 + 32);
  [v2 refreshSetTopBoxProfile:v3];
}

void __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_2_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = VSErrorLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_2_18_cold_1((uint64_t)v3, v4);
    }

    [*(id *)(a1 + 32) addError:v3];
  }
}

uint64_t __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_23(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) errors];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    v4 = VSErrorLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_23_cold_1(v4);
    }
  }
  else
  {
    id v5 = VSDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "No errors preparting for OOB testing, clearing buddy defaults.", v7, 2u);
    }

    v4 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.purplebuddy"];
    [v4 removeObjectForKey:@"TVBuddyCompletedSuccessfully"];
    [v4 removeObjectForKey:@"SetupDone"];
    [v4 removeObjectForKey:@"VSSkipSetup"];
  }

  return [*(id *)(a1 + 32) finishExecutionIfPossible];
}

- (void)addError:(id)a3
{
  id v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  id v5 = [(VSTestSetupPreparationOperation *)v4 errors];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = [(VSTestSetupPreparationOperation *)v4 errors];
    id v9 = (objc_class *)objc_opt_class();
    int v10 = NSStringFromClass(v9);
    [v7 raise:*MEMORY[0x1E4F1C3C8], @"Unexpectedly, [self errors] was %@, instead of NSMutableArray.", v10 format];
  }
  uint64_t v11 = [(VSTestSetupPreparationOperation *)v4 errors];
  [v11 addObject:v12];

  objc_sync_exit(v4);
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);

  objc_storeStrong((id *)&self->_errors, 0);
}

void __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error removing account for setup testing preparation: %@", (uint8_t *)&v2, 0xCu);
}

void __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_2_18_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error refreshing profile for testing: %@", (uint8_t *)&v2, 0xCu);
}

void __52__VSTestSetupPreparationOperation_executionDidBegin__block_invoke_23_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "Errors present preparing for OOB testing, not clearing buddy defaults.", v1, 2u);
}

@end