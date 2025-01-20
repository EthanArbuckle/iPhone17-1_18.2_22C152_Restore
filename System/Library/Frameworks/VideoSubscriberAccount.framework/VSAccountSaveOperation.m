@interface VSAccountSaveOperation
- (NSArray)unsavedAccounts;
- (NSOperation)currentOperation;
- (VSAccountChannels)unsavedChannels;
- (VSAccountSaveOperation)init;
- (VSAccountSaveOperation)initWithUnsavedAccounts:(id)a3 channels:(id)a4 storage:(id)a5;
- (VSOptional)result;
- (VSPersistentStorage)storage;
- (void)_startAccountChannelsSaveOperation;
- (void)_startCredentialSaveOperation;
- (void)cancel;
- (void)setCurrentOperation:(id)a3;
- (void)setResult:(id)a3;
- (void)setStorage:(id)a3;
- (void)setUnsavedAccounts:(id)a3;
- (void)setUnsavedChannels:(id)a3;
@end

@implementation VSAccountSaveOperation

- (VSAccountSaveOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSAccountSaveOperation)initWithUnsavedAccounts:(id)a3 channels:(id)a4 storage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The channels parameter must not be nil."];
    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The accounts parameter must not be nil."];
  if (!v9) {
    goto LABEL_8;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_9:
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The storage parameter must not be nil."];
LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)VSAccountSaveOperation;
  v11 = [(VSAccountSaveOperation *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    unsavedAccounts = v11->_unsavedAccounts;
    v11->_unsavedAccounts = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    unsavedChannels = v11->_unsavedChannels;
    v11->_unsavedChannels = (VSAccountChannels *)v14;

    objc_storeStrong((id *)&v11->_storage, a5);
    v16 = objc_alloc_init(VSOptional);
    v17 = v11->_result;
    v11->_result = v16;
  }
  return v11;
}

- (void)_startCredentialSaveOperation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v14 = "-[VSAccountSaveOperation _startCredentialSaveOperation]";
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  uint64_t v4 = [VSCredentialSaveOperation alloc];
  v5 = [(VSAccountSaveOperation *)self unsavedAccounts];
  v6 = [(VSAccountSaveOperation *)self storage];
  v7 = [v6 accountStore];
  id v8 = [(VSCredentialSaveOperation *)v4 initWithUnsavedAccounts:v5 accountStore:v7];

  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v8);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__VSAccountSaveOperation__startCredentialSaveOperation__block_invoke;
  v9[3] = &unk_1E6BD2880;
  objc_copyWeak(&v10, (id *)buf);
  objc_copyWeak(&v11, &location);
  [(VSCredentialSaveOperation *)v8 setCompletionBlock:v9];
  [(VSAccountSaveOperation *)self setCurrentOperation:v8];
  [(VSAsyncOperation *)v8 start];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

void __55__VSAccountSaveOperation__startCredentialSaveOperation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = v3;
  if (WeakRetained && v3)
  {
    v5 = [v3 result];
    [WeakRetained setResult:v5];
    v6 = [v5 forceUnwrapObject];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__VSAccountSaveOperation__startCredentialSaveOperation__block_invoke_2;
    v9[3] = &unk_1E6BD4718;
    void v9[4] = WeakRetained;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__VSAccountSaveOperation__startCredentialSaveOperation__block_invoke_3;
    v8[3] = &unk_1E6BD28B0;
    v8[4] = WeakRetained;
    [v6 unwrapObject:v9 error:v8];
  }
  else
  {
    v5 = VSDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "_startCredentialSaveOperation: nil operation ref", v7, 2u);
    }
  }
}

uint64_t __55__VSAccountSaveOperation__startCredentialSaveOperation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startAccountChannelsSaveOperation];
}

void __55__VSAccountSaveOperation__startCredentialSaveOperation__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "_startCredentialSaveOperation: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) finishExecutionIfPossible];
}

- (void)_startAccountChannelsSaveOperation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = "-[VSAccountSaveOperation _startAccountChannelsSaveOperation]";
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  uint64_t v4 = [VSAccountChannelsSaveOperation alloc];
  int v5 = [(VSAccountSaveOperation *)self unsavedChannels];
  id v6 = [(VSAccountSaveOperation *)self storage];
  uint64_t v7 = [v6 channelsCenter];
  id v8 = [(VSAccountChannelsSaveOperation *)v4 initWithUnsavedAccountChannels:v5 accountChannelsCenter:v7];

  objc_initWeak((id *)buf, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__VSAccountSaveOperation__startAccountChannelsSaveOperation__block_invoke;
  v9[3] = &unk_1E6BD35C8;
  objc_copyWeak(&v10, (id *)buf);
  [(VSAccountChannelsSaveOperation *)v8 setCompletionBlock:v9];
  [(VSAccountSaveOperation *)self setCurrentOperation:v8];
  [(VSAsyncOperation *)v8 start];
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __60__VSAccountSaveOperation__startAccountChannelsSaveOperation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained finishExecutionIfPossible];
    id WeakRetained = v2;
  }
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)VSAccountSaveOperation;
  [(VSAsyncOperation *)&v4 cancel];
  id v3 = [(VSAccountSaveOperation *)self currentOperation];
  [v3 cancel];
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

- (VSPersistentStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (VSAccountChannels)unsavedChannels
{
  return self->_unsavedChannels;
}

- (void)setUnsavedChannels:(id)a3
{
}

- (NSOperation)currentOperation
{
  return self->_currentOperation;
}

- (void)setCurrentOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_unsavedChannels, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_unsavedAccounts, 0);

  objc_storeStrong((id *)&self->_result, 0);
}

@end