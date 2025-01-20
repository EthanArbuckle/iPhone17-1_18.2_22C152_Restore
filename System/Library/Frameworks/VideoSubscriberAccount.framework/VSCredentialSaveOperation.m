@interface VSCredentialSaveOperation
- (NSArray)unsavedAccounts;
- (VSAccountStore)accountStore;
- (VSCredentialSaveOperation)init;
- (VSCredentialSaveOperation)initWithUnsavedAccounts:(id)a3 accountStore:(id)a4;
- (VSOptional)result;
- (void)_didSaveAccounts:(id)a3 withResult:(BOOL)a4 error:(id)a5;
- (void)executionDidBegin;
- (void)setAccountStore:(id)a3;
- (void)setResult:(id)a3;
- (void)setUnsavedAccounts:(id)a3;
@end

@implementation VSCredentialSaveOperation

- (VSCredentialSaveOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSCredentialSaveOperation)initWithUnsavedAccounts:(id)a3 accountStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The accounts parameter must not be nil."];
    if (v8) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The accountStore parameter must not be nil."];
LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)VSCredentialSaveOperation;
  v9 = [(VSCredentialSaveOperation *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    unsavedAccounts = v9->_unsavedAccounts;
    v9->_unsavedAccounts = (NSArray *)v10;

    objc_storeStrong((id *)&v9->_accountStore, a4);
    v12 = objc_alloc_init(VSOptional);
    v13 = v9->_result;
    v9->_result = v12;
  }
  return v9;
}

- (void)_didSaveAccounts:(id)a3 withResult:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v6)
  {
    v11 = +[VSAccountStore sharedAccountStore];
    v12 = [v11 accounts];

    if (![v12 count] && objc_msgSend(v8, "count"))
    {
      v13 = VSDefaultLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1DA674000, v13, OS_LOG_TYPE_DEFAULT, "Unable to fetch accounts from account store - fallback to local accounts.", v19, 2u);
      }

      id v14 = v8;
      v12 = v14;
    }
    objc_super v15 = +[VSFailable failableWithObject:v12];
    v16 = +[VSOptional optionalWithObject:v15];
    [(VSCredentialSaveOperation *)self setResult:v16];
  }
  else
  {
    if (!v9) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The error parameter must not be nil."];
    }
    v17 = +[VSFailable failableWithError:v10];
    v18 = +[VSOptional optionalWithObject:v17];
    [(VSCredentialSaveOperation *)self setResult:v18];
  }
  [(VSAsyncOperation *)self finishExecutionIfPossible];
}

- (void)executionDidBegin
{
  v3 = [(VSCredentialSaveOperation *)self unsavedAccounts];
  uint64_t v4 = [(VSCredentialSaveOperation *)self accountStore];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__VSCredentialSaveOperation_executionDidBegin__block_invoke;
  v6[3] = &unk_1E6BD3798;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [v4 saveAccounts:v5 withCompletionHandler:v6];
}

void __46__VSCredentialSaveOperation_executionDidBegin__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "VSCredentialSaveOperation: success %d, error %@", (uint8_t *)v7, 0x12u);
  }

  [*(id *)(a1 + 32) _didSaveAccounts:*(void *)(a1 + 40) withResult:a2 error:v5];
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSArray)unsavedAccounts
{
  return self->_unsavedAccounts;
}

- (void)setUnsavedAccounts:(id)a3
{
}

- (VSAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_unsavedAccounts, 0);

  objc_storeStrong((id *)&self->_result, 0);
}

@end