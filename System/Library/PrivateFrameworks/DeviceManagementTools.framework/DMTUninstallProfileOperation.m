@interface DMTUninstallProfileOperation
- (BOOL)isAsynchronous;
- (DMTProfileInstallationPrimitives)primitives;
- (DMTUninstallProfileOperation)initWithProfileInstallationPrimitives:(id)a3 profileIdentifier:(id)a4;
- (NSString)profileIdentifier;
- (void)cancel;
- (void)uninstallProfile;
@end

@implementation DMTUninstallProfileOperation

- (DMTUninstallProfileOperation)initWithProfileInstallationPrimitives:(id)a3 profileIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DMTUninstallProfileOperation;
  v9 = [(DMTUninstallProfileOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_primitives, a3);
    objc_storeStrong((id *)&v10->_profileIdentifier, a4);
  }

  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)DMTUninstallProfileOperation;
  [(DMTUninstallProfileOperation *)&v4 cancel];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__DMTUninstallProfileOperation_cancel__block_invoke;
  block[3] = &unk_2649A9730;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __38__DMTUninstallProfileOperation_cancel__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  CATErrorWithCodeAndUserInfo();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 endOperationWithError:v2];
}

- (void)uninstallProfile
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_22D3D6000, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed to uninstall profile: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (DMTProfileInstallationPrimitives)primitives
{
  return self->_primitives;
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_primitives, 0);
}

@end