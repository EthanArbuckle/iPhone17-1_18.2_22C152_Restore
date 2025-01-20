@interface DMTInstallProfileOperation
- (BOOL)isAsynchronous;
- (DMTInstallProfileOperation)initWithProfileInstallationPrimitives:(id)a3 profileData:(id)a4;
- (DMTProfileInstallationPrimitives)primitives;
- (NSData)profileData;
- (OS_dispatch_queue)profileInstallationQueue;
- (void)cancel;
- (void)installProfile;
- (void)main;
@end

@implementation DMTInstallProfileOperation

- (DMTInstallProfileOperation)initWithProfileInstallationPrimitives:(id)a3 profileData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)DMTInstallProfileOperation;
  v9 = [(DMTInstallProfileOperation *)&v19 init];
  if (v9)
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = [v11 stringByAppendingString:@".profileInstallation"];

    id v13 = v12;
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
    profileInstallationQueue = v9->_profileInstallationQueue;
    v9->_profileInstallationQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v9->_primitives, a3);
    uint64_t v16 = [v8 copy];
    profileData = v9->_profileData;
    v9->_profileData = (NSData *)v16;
  }
  return v9;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)DMTInstallProfileOperation;
  [(DMTInstallProfileOperation *)&v5 cancel];
  v3 = [(DMTInstallProfileOperation *)self profileInstallationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__DMTInstallProfileOperation_cancel__block_invoke;
  block[3] = &unk_2649A9730;
  block[4] = self;
  dispatch_async(v3, block);
}

void __36__DMTInstallProfileOperation_cancel__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) profileInstallationQueue];
  dispatch_suspend(v2);

  v3 = *(void **)(a1 + 32);
  CATErrorWithCodeAndUserInfo();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 endOperationWithError:v4];
}

- (void)main
{
  v3 = [(DMTInstallProfileOperation *)self profileInstallationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__DMTInstallProfileOperation_main__block_invoke;
  block[3] = &unk_2649A9730;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __34__DMTInstallProfileOperation_main__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) installProfile];
}

- (void)installProfile
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_22D3D6000, v0, OS_LOG_TYPE_DEBUG, "%{public}@: Installed profile: %{public}@ successfully", v1, 0x16u);
}

- (OS_dispatch_queue)profileInstallationQueue
{
  return self->_profileInstallationQueue;
}

- (DMTProfileInstallationPrimitives)primitives
{
  return self->_primitives;
}

- (NSData)profileData
{
  return self->_profileData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->_primitives, 0);
  objc_storeStrong((id *)&self->_profileInstallationQueue, 0);
}

@end