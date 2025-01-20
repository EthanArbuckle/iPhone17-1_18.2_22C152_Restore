@interface BRQueryStitchingContext
- (BRQueryStitchingContext)initWithQuery:(id)a3;
- (void)performAsyncOnReceiver:(id)a3;
@end

@implementation BRQueryStitchingContext

- (BRQueryStitchingContext)initWithQuery:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRQueryStitchingContext;
  v6 = [(BRQueryStitchingContext *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_query, a3);
    uint64_t v8 = [v5 receiver];
    receiver = v7->_receiver;
    v7->_receiver = (BRNotificationReceiver *)v8;
  }
  return v7;
}

- (void)performAsyncOnReceiver:(id)a3
{
  id v4 = a3;
  query = self->_query;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__BRQueryStitchingContext_performAsyncOnReceiver___block_invoke;
  v7[3] = &unk_1E59ADD08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(BRQuery *)query _performBlockAsync:v7];
}

uint64_t __50__BRQueryStitchingContext_performAsyncOnReceiver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16), *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 8), *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 16));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiver, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

@end