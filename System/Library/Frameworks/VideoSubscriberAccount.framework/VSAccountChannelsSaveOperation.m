@interface VSAccountChannelsSaveOperation
- (NSError)error;
- (VSAccountChannels)unsavedAccountChannels;
- (VSAccountChannelsCenter)accountChannelsCenter;
- (VSAccountChannelsSaveOperation)init;
- (VSAccountChannelsSaveOperation)initWithUnsavedAccountChannels:(id)a3 accountChannelsCenter:(id)a4;
- (void)executionDidBegin;
- (void)setAccountChannelsCenter:(id)a3;
- (void)setError:(id)a3;
- (void)setUnsavedAccountChannels:(id)a3;
@end

@implementation VSAccountChannelsSaveOperation

- (VSAccountChannelsSaveOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSAccountChannelsSaveOperation)initWithUnsavedAccountChannels:(id)a3 accountChannelsCenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The accountChannels parameter must not be nil."];
  }
  v12.receiver = self;
  v12.super_class = (Class)VSAccountChannelsSaveOperation;
  v9 = [(VSAccountChannelsSaveOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_unsavedAccountChannels, a3);
    objc_storeStrong((id *)&v10->_accountChannelsCenter, a4);
  }

  return v10;
}

- (void)executionDidBegin
{
  v3 = [(VSAccountChannelsSaveOperation *)self unsavedAccountChannels];
  objc_initWeak(&location, self);
  uint64_t v4 = [(VSAccountChannelsSaveOperation *)self accountChannelsCenter];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__VSAccountChannelsSaveOperation_executionDidBegin__block_invoke;
  v5[3] = &unk_1E6BD2928;
  objc_copyWeak(&v6, &location);
  [v4 _saveAccountChannels:v3 withCompletionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __51__VSAccountChannelsSaveOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setError:v5];
    [v4 finishExecutionIfPossible];
  }
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (VSAccountChannels)unsavedAccountChannels
{
  return self->_unsavedAccountChannels;
}

- (void)setUnsavedAccountChannels:(id)a3
{
}

- (VSAccountChannelsCenter)accountChannelsCenter
{
  return self->_accountChannelsCenter;
}

- (void)setAccountChannelsCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountChannelsCenter, 0);
  objc_storeStrong((id *)&self->_unsavedAccountChannels, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end