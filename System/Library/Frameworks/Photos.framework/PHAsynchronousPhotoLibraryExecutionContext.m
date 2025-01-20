@interface PHAsynchronousPhotoLibraryExecutionContext
+ (PHAsynchronousPhotoLibraryExecutionContext)asynchronousExecutionContext;
- (void)callTransactionCompletionHandler:(id)a3 withSuccess:(BOOL)a4 error:(id)a5;
- (void)dispatchOnQueue:(id)a3 block:(id)a4;
- (void)sendChangesRequest:(id)a3 onClient:(id)a4 reply:(id)a5;
@end

@implementation PHAsynchronousPhotoLibraryExecutionContext

- (void)callTransactionCompletionHandler:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  if (v6)
  {
    v8 = dispatch_get_global_queue(0, 0);
    id v10 = v6;
    id v9 = v7;
    pl_dispatch_async();
  }
}

uint64_t __97__PHAsynchronousPhotoLibraryExecutionContext_callTransactionCompletionHandler_withSuccess_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)sendChangesRequest:(id)a3 onClient:(id)a4 reply:(id)a5
{
}

- (void)dispatchOnQueue:(id)a3 block:(id)a4
{
}

+ (PHAsynchronousPhotoLibraryExecutionContext)asynchronousExecutionContext
{
  v2 = objc_alloc_init(PHAsynchronousPhotoLibraryExecutionContext);

  return v2;
}

@end