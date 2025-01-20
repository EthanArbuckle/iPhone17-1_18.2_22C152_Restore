@interface DMCProcessAssertion
- (DMCProcessAssertion)initWithReason:(id)a3;
- (NSString)reason;
- (void)_createAssertion;
- (void)_releaseAssertion;
- (void)dealloc;
@end

@implementation DMCProcessAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

void __40__DMCProcessAssertion__releaseAssertion__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = DMCLogObjects()[2];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1A7863000, v2, OS_LOG_TYPE_INFO, "Releasing process assertion with reason: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
}

- (DMCProcessAssertion)initWithReason:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMCProcessAssertion;
  int v6 = [(DMCProcessAssertion *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reason, a3);
    [(DMCProcessAssertion *)v7 _createAssertion];
  }

  return v7;
}

- (void)_createAssertion
{
  uint64_t v3 = _assertionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__DMCProcessAssertion__createAssertion__block_invoke;
  block[3] = &unk_1E5CFD920;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)dealloc
{
  [(DMCProcessAssertion *)self _releaseAssertion];
  v3.receiver = self;
  v3.super_class = (Class)DMCProcessAssertion;
  [(DMCProcessAssertion *)&v3 dealloc];
}

- (void)_releaseAssertion
{
  objc_super v3 = _assertionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__DMCProcessAssertion__releaseAssertion__block_invoke;
  block[3] = &unk_1E5CFD920;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __39__DMCProcessAssertion__createAssertion__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = DMCLogObjects()[2];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
    int v8 = 138543362;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1A7863000, v2, OS_LOG_TYPE_INFO, "Creating process assertion with reason: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  id v4 = [@"com.apple.ManagedConfiguration." stringByAppendingString:*(void *)(*(void *)(a1 + 32) + 16)];
  [v4 UTF8String];
  uint64_t v5 = os_transaction_create();
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v5;
}

- (NSString)reason
{
  return self->_reason;
}

@end