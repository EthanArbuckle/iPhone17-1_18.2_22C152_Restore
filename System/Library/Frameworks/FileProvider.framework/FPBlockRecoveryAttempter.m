@interface FPBlockRecoveryAttempter
- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4;
- (FPBlockRecoveryAttempter)initWithBlock:(id)a3 operationService:(id)a4;
- (NSError)expectedError;
- (void)setExpectedError:(id)a3;
@end

@implementation FPBlockRecoveryAttempter

- (FPBlockRecoveryAttempter)initWithBlock:(id)a3 operationService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FPBlockRecoveryAttempter;
  v8 = [(FPBlockRecoveryAttempter *)&v12 init];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x1A6248B00](v6);
    id recoveryBlock = v8->_recoveryBlock;
    v8->_id recoveryBlock = (id)v9;

    objc_storeStrong((id *)&v8->_fpxOperationService, a4);
  }

  return v8;
}

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 code];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expectedError);
  uint64_t v9 = [WeakRetained code];

  if (v7 != v9)
  {
    uint64_t v10 = [v6 code];
    id v11 = objc_loadWeakRetained((id *)&self->_expectedError);
    uint64_t v12 = [v11 code];

    if (v10 != v12)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2 object:self file:@"NSError+FPAdditions.m" lineNumber:857 description:@"unexpected error code"];
    }
  }
  v13 = [v6 domain];
  id v14 = objc_loadWeakRetained((id *)&self->_expectedError);
  v15 = [v14 domain];

  if (v13 != v15)
  {
    v16 = [v6 domain];
    id v17 = objc_loadWeakRetained((id *)&self->_expectedError);
    v18 = [v17 domain];

    if (v16 != v18)
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2 object:self file:@"NSError+FPAdditions.m" lineNumber:858 description:@"unexpected error domain"];
    }
  }
  v19 = [v6 userInfo];
  v20 = [v19 valueForKey:@"FPErrorSuppressionCheckboxIsChecked"];

  if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ([v20 BOOLValue])
    {
      v21 = [v6 userInfo];
      v22 = [v21 valueForKey:@"FPUserInteractionIdentifier"];

      v23 = fp_current_or_default_log();
      v24 = v23;
      if (v22)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[FPBlockRecoveryAttempter attemptRecoveryFromError:optionIndex:]();
        }

        v25 = [v6 userInfo];
        v24 = [v25 objectForKey:@"DomainIdentifier"];

        [(FPXOperationService *)self->_fpxOperationService userCheckedSuppressionCheckboxForUserInteractionIdentifier:v22 domainIdentifier:v24 completionHandler:&__block_literal_global_283];
      }
      else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        -[FPBlockRecoveryAttempter attemptRecoveryFromError:optionIndex:]();
      }
    }
    else
    {
      v22 = fp_current_or_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[FPBlockRecoveryAttempter attemptRecoveryFromError:optionIndex:].cold.4();
      }
    }
  }
  else
  {
    v22 = fp_current_or_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[FPBlockRecoveryAttempter attemptRecoveryFromError:optionIndex:]();
    }
  }

  (*((void (**)(void))self->_recoveryBlock + 2))();
  return 1;
}

void __65__FPBlockRecoveryAttempter_attemptRecoveryFromError_optionIndex___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = fp_current_or_default_log();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __65__FPBlockRecoveryAttempter_attemptRecoveryFromError_optionIndex___block_invoke_cold_2((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __65__FPBlockRecoveryAttempter_attemptRecoveryFromError_optionIndex___block_invoke_cold_1();
  }
}

- (NSError)expectedError
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expectedError);

  return (NSError *)WeakRetained;
}

- (void)setExpectedError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_expectedError);
  objc_storeStrong((id *)&self->_fpxOperationService, 0);

  objc_storeStrong(&self->_recoveryBlock, 0);
}

- (void)attemptRecoveryFromError:optionIndex:.cold.1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] Suppression: did not find value in userInfo, or it wasn't an NSNumber", v2, v3, v4, v5, v6);
}

- (void)attemptRecoveryFromError:optionIndex:.cold.2()
{
  OUTLINED_FUNCTION_30();
  _os_log_error_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_ERROR, "[ERROR] Suppression: Expected valid user interaction identifier, if the user was shown the suppression checkbox", v1, 2u);
}

- (void)attemptRecoveryFromError:optionIndex:.cold.3()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] Suppression: Finder signaled FP that user has checked suppression checkbox for predicate", v2, v3, v4, v5, v6);
}

- (void)attemptRecoveryFromError:optionIndex:.cold.4()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] Suppression: was not checked by user", v2, v3, v4, v5, v6);
}

void __65__FPBlockRecoveryAttempter_attemptRecoveryFromError_optionIndex___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] Suppression: Sent the suppression message back to the extension", v2, v3, v4, v5, v6);
}

void __65__FPBlockRecoveryAttempter_attemptRecoveryFromError_optionIndex___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end