@interface FPFetchDefaultContainerOperation
- (id)fetchCompletionBlock;
- (id)initForApplicationRecord:(id)a3 providerDomain:(id)a4;
- (void)actionMain;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)setFetchCompletionBlock:(id)a3;
@end

@implementation FPFetchDefaultContainerOperation

- (id)initForApplicationRecord:(id)a3 providerDomain:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 identifier];
  v15.receiver = self;
  v15.super_class = (Class)FPFetchDefaultContainerOperation;
  v10 = [(FPActionOperation *)&v15 initWithProvider:v9 action:0];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_requestedRecord, a3);
    v11 = [v8 identifier];
    uint64_t v12 = objc_msgSend(v11, "fp_toDomainIdentifier");
    domainIdentifier = v10->_domainIdentifier;
    v10->_domainIdentifier = (NSString *)v12;

    [(FPActionOperation *)v10 setSetupRemoteOperationService:1];
  }

  return v10;
}

- (void)actionMain
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_ERROR, "[ERROR] Requested default container for application record %@ with nil bundle identifier", v1, 0xCu);
}

void __46__FPFetchDefaultContainerOperation_actionMain__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__FPFetchDefaultContainerOperation_actionMain__block_invoke_cold_1(v6);
    }
  }
  [*(id *)(a1 + 32) completedWithResult:v5 error:v6];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(FPFetchDefaultContainerOperation *)self fetchCompletionBlock];
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    [(FPFetchDefaultContainerOperation *)self setFetchCompletionBlock:0];
  }

  v10.receiver = self;
  v10.super_class = (Class)FPFetchDefaultContainerOperation;
  [(FPActionOperation *)&v10 finishWithResult:v6 error:v7];
}

- (id)fetchCompletionBlock
{
  return self->_fetchCompletionBlock;
}

- (void)setFetchCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchCompletionBlock, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);

  objc_storeStrong((id *)&self->_requestedRecord, 0);
}

void __46__FPFetchDefaultContainerOperation_actionMain__block_invoke_cold_1(void *a1)
{
  v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] couldn't create directory: %@", v4, v5, v6, v7, v8);
}

@end