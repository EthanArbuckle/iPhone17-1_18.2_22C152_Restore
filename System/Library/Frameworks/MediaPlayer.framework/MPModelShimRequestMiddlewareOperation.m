@interface MPModelShimRequestMiddlewareOperation
@end

@implementation MPModelShimRequestMiddlewareOperation

void __49___MPModelShimRequestMiddlewareOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && ([v5 isValid] & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 280) + 16))();
  }
  else
  {
    v7 = (void *)MEMORY[0x19971E0F0](*(void *)(*(void *)(a1 + 32) + 280));
    v8 = [MPNotificationObserver alloc];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49___MPModelShimRequestMiddlewareOperation_execute__block_invoke_2;
    v14[3] = &unk_1E57EF1E8;
    id v15 = v7;
    id v9 = v7;
    v10 = [(MPNotificationObserver *)v8 initWithName:@"MPModelResponseDidInvalidateNotification" object:v5 handler:v14];
    v16[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 272);
    *(void *)(v12 + 272) = v11;
  }
  [*(id *)(*(void *)(a1 + 32) + 288) setModelResponse:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
}

uint64_t __49___MPModelShimRequestMiddlewareOperation_execute__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end