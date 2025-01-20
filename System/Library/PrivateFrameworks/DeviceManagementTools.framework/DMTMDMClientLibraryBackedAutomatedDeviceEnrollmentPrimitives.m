@interface DMTMDMClientLibraryBackedAutomatedDeviceEnrollmentPrimitives
- (DEPClient)DEPClient;
- (DMTMDMClientLibraryBackedAutomatedDeviceEnrollmentPrimitives)init;
- (void)enrollWithNonce:(id)a3 completionBlock:(id)a4;
@end

@implementation DMTMDMClientLibraryBackedAutomatedDeviceEnrollmentPrimitives

- (DMTMDMClientLibraryBackedAutomatedDeviceEnrollmentPrimitives)init
{
  v6.receiver = self;
  v6.super_class = (Class)DMTMDMClientLibraryBackedAutomatedDeviceEnrollmentPrimitives;
  v2 = [(DMTMDMClientLibraryBackedAutomatedDeviceEnrollmentPrimitives *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    DEPClient = v2->_DEPClient;
    v2->_DEPClient = (DEPClient *)v3;
  }
  return v2;
}

- (void)enrollWithNonce:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(DMTMDMClientLibraryBackedAutomatedDeviceEnrollmentPrimitives *)self DEPClient];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __96__DMTMDMClientLibraryBackedAutomatedDeviceEnrollmentPrimitives_enrollWithNonce_completionBlock___block_invoke;
  v10[3] = &unk_2649A9CA8;
  id v11 = v6;
  id v9 = v6;
  [v8 provisionallyEnrollWithNonce:v7 completionBlock:v10];
}

void __96__DMTMDMClientLibraryBackedAutomatedDeviceEnrollmentPrimitives_enrollWithNonce_completionBlock___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (_DMTLogGeneral_onceToken_1 != -1) {
    dispatch_once(&_DMTLogGeneral_onceToken_1, &__block_literal_global_2);
  }
  id v9 = _DMTLogGeneral_logObj_1;
  if (os_log_type_enabled((os_log_t)_DMTLogGeneral_logObj_1, OS_LOG_TYPE_DEBUG))
  {
    v10 = @"NO";
    int v11 = 138543874;
    if (a2) {
      v10 = @"YES";
    }
    v12 = v10;
    __int16 v13 = 2114;
    id v14 = v7;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_debug_impl(&dword_22D3D6000, v9, OS_LOG_TYPE_DEBUG, "Enrollment complete: %{public}@, response: %{public}@, error:%{public}@", (uint8_t *)&v11, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (DEPClient)DEPClient
{
  return self->_DEPClient;
}

- (void).cxx_destruct
{
}

@end