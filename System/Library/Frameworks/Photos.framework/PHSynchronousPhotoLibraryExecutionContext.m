@interface PHSynchronousPhotoLibraryExecutionContext
+ (PHSynchronousPhotoLibraryExecutionContext)synchronousExecutionContext;
- (void)callTransactionCompletionHandler:(id)a3 withSuccess:(BOOL)a4 error:(id)a5;
- (void)dispatchOnQueue:(id)a3 block:(id)a4;
- (void)sendChangesRequest:(id)a3 onClient:(id)a4 reply:(id)a5;
@end

@implementation PHSynchronousPhotoLibraryExecutionContext

- (void)callTransactionCompletionHandler:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  if (a3) {
    (*((void (**)(id, BOOL, id))a3 + 2))(a3, a4, a5);
  }
}

- (void)sendChangesRequest:(id)a3 onClient:(id)a4 reply:(id)a5
{
  id v10 = 0;
  v7 = (void (**)(id, uint64_t, id))a5;
  uint64_t v8 = [a4 sendChangesRequest:a3 error:&v10];
  id v9 = v10;
  v7[2](v7, v8, v9);
}

- (void)dispatchOnQueue:(id)a3 block:(id)a4
{
}

+ (PHSynchronousPhotoLibraryExecutionContext)synchronousExecutionContext
{
  v2 = objc_alloc_init(PHSynchronousPhotoLibraryExecutionContext);

  return v2;
}

@end