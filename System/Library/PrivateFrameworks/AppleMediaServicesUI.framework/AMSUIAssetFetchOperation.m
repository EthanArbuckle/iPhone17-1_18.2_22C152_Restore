@interface AMSUIAssetFetchOperation
- (AMSPromise)operationPromise;
- (BOOL)isLowLatency;
- (void)_finishWithImage:(id)a3 error:(id)a4;
- (void)cancel;
- (void)main;
- (void)setLowLatency:(BOOL)a3;
- (void)setOperationPromise:(id)a3;
- (void)setQueuePriority:(int64_t)a3;
@end

@implementation AMSUIAssetFetchOperation

- (BOOL)isLowLatency
{
  return 0;
}

- (void)setQueuePriority:(int64_t)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)AMSUIAssetFetchOperation;
  id v5 = [(AMSUIAssetFetchOperation *)&v11 queuePriority];
  v10.receiver = self;
  v10.super_class = (Class)AMSUIAssetFetchOperation;
  [(AMSUIAssetFetchOperation *)&v10 setQueuePriority:a3];
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  v12[0] = @"oldPriority";
  v7 = [NSNumber numberWithInteger:v5];
  v12[1] = @"newPriority";
  v13[0] = v7;
  v8 = [NSNumber numberWithInteger:a3];
  v13[1] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v6 postNotificationName:@"com.apple.AppleMediaServicesUI.AssetFetchOperation.didChangePriority" object:self userInfo:v9];
}

- (void)main
{
  AMSError();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(AMSUIAssetFetchOperation *)self _finishWithImage:0 error:v3];
}

- (void)cancel
{
  [(AMSUIAssetFetchOperation *)self setOperationPromise:0];
  v4.receiver = self;
  v4.super_class = (Class)AMSUIAssetFetchOperation;
  [(AMSUIAssetFetchOperation *)&v4 cancel];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"com.apple.AppleMediaServicesUI.AssetFetchOperation.didCancel" object:self];
}

- (void)_finishWithImage:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (([(AMSUIAssetFetchOperation *)self isCancelled] & 1) == 0)
  {
    v7 = [(AMSUIAssetFetchOperation *)self operationPromise];

    if (v7)
    {
      v8 = [(AMSUIAssetFetchOperation *)self operationPromise];
      [v8 finishWithResult:v9 error:v6];
    }
    [(AMSUIAssetFetchOperation *)self setOperationPromise:0];
  }
}

- (void)setLowLatency:(BOOL)a3
{
  self->_lowLatency = a3;
}

- (AMSPromise)operationPromise
{
  return self->_operationPromise;
}

- (void)setOperationPromise:(id)a3
{
}

- (void).cxx_destruct
{
}

@end