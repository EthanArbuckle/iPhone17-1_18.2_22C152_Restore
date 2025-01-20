@interface FPWakeForURLSessionOperation
- (id)initForProvider:(id)a3 sessionIdentifier:(id)a4;
- (void)actionMain;
@end

@implementation FPWakeForURLSessionOperation

- (id)initForProvider:(id)a3 sessionIdentifier:(id)a4
{
  id v7 = a4;
  v8 = objc_msgSend(NSString, "fp_providerDomainIDFromProviderID:domainIdentifier:", a3, @"NSFileProviderDomainDefaultIdentifier");
  v11.receiver = self;
  v11.super_class = (Class)FPWakeForURLSessionOperation;
  v9 = [(FPActionOperation *)&v11 initWithProvider:v8 action:0];

  if (v9)
  {
    objc_storeStrong((id *)&v9->_sessionIdentifier, a4);
    [(FPActionOperation *)v9 setSetupRemoteOperationService:1];
  }

  return v9;
}

- (void)actionMain
{
  v3 = [(FPActionOperation *)self remoteServiceProxy];
  sessionIdentifier = self->_sessionIdentifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__FPWakeForURLSessionOperation_actionMain__block_invoke;
  v5[3] = &unk_1E5AF1240;
  v5[4] = self;
  [v3 wakeForSessionIdentifier:sessionIdentifier completionHandler:v5];
}

void __42__FPWakeForURLSessionOperation_actionMain__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42__FPWakeForURLSessionOperation_actionMain__block_invoke_cold_1(a1, v3, v4);
    }
  }
  [*(id *)(a1 + 32) completedWithResult:0 error:v3];
}

- (void).cxx_destruct
{
}

void __42__FPWakeForURLSessionOperation_actionMain__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = objc_msgSend(a2, "fp_prettyDescription");
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "[ERROR] %@ failed to wake provider: %@", (uint8_t *)&v6, 0x16u);
}

@end