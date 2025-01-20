@interface AKAppleIDRecoveryController
- (NSArray)supportedRecoverySteps;
- (id)_nextStepForResponse:(id)a3;
- (void)_beginAccountRecoveryWithModel:(id)a3 completion:(id)a4;
- (void)_logResponse:(id)a3;
- (void)_processNextStep:(id)a3 response:(id)a4 model:(id)a5 completion:(id)a6;
- (void)_processResponse:(id)a3 model:(id)a4 withCompletion:(id)a5;
- (void)setSupportedRecoverySteps:(id)a3;
@end

@implementation AKAppleIDRecoveryController

- (void)_beginAccountRecoveryWithModel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 configuration];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 request];
    v11 = (void *)[v10 mutableCopy];

    [v11 setHTTPMethod:@"GET"];
    v12 = [v6 cliUtilities];
    [v12 signXMLRequest:v11];

    v13 = [v9 resourceLoadDelegate];
    [v13 signRequest:v11];

    v14 = [v6 cliUtilities];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__AKAppleIDRecoveryController__beginAccountRecoveryWithModel_completion___block_invoke;
    v16[3] = &unk_1E575F9D0;
    v16[4] = self;
    id v17 = v6;
    id v18 = v7;
    [v14 beginDataTaskWithRequest:v11 completionHandler:v16];

LABEL_7:
    goto LABEL_8;
  }
  v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[AKAppleIDRecoveryController _beginAccountRecoveryWithModel:completion:](v15);
  }

  if (v7)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v11);
    goto LABEL_7;
  }
LABEL_8:
}

void __73__AKAppleIDRecoveryController__beginAccountRecoveryWithModel_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[AKAccountRecoveryResponse alloc] initWithData:v6 httpResponse:v5];

  [*(id *)(a1 + 32) _processResponse:v7 model:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

- (void)_processResponse:(id)a3 model:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(AKAppleIDRecoveryController *)self _logResponse:v8];
  v11 = [(AKAppleIDRecoveryController *)self _nextStepForResponse:v8];
  if (v11)
  {
    [(AKAppleIDRecoveryController *)self _processNextStep:v11 response:v8 model:v9 completion:v10];
  }
  else
  {
    v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDRecoveryController _processResponse:model:withCompletion:](v12);
    }

    if (v10)
    {
      v13 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
      (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v13);
    }
  }
}

- (id)_nextStepForResponse:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = self->_supportedRecoverySteps;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v9 canProcessResponse:v4])
        {
          id v10 = (objc_class *)objc_opt_class();
          v11 = NSStringFromClass(v10);
          AKPrintLine(@"Found matching recovery step: %@", v12, v13, v14, v15, v16, v17, v18, (uint64_t)v11);

          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_processNextStep:(id)a3 response:(id)a4 model:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  uint64_t v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v14);
  AKPrintLine(@"Begin account recovery step: %@", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v15);

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __74__AKAppleIDRecoveryController__processNextStep_response_model_completion___block_invoke;
  v26[3] = &unk_1E575F9F8;
  id v27 = v10;
  v28 = self;
  id v29 = v11;
  id v30 = v12;
  id v23 = v11;
  id v24 = v10;
  id v25 = v12;
  [v24 processResponse:v13 model:v23 withCompletion:v26];
}

void __74__AKAppleIDRecoveryController__processNextStep_response_model_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v36 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    uint64_t v14 = *(void *)(a1 + 56);
    if (!v14) {
      goto LABEL_9;
    }
    uint64_t v15 = *(void (**)(void))(v14 + 16);
    goto LABEL_8;
  }
  uint64_t v16 = (objc_class *)objc_opt_class();
  uint64_t v17 = NSStringFromClass(v16);
  AKPrintLine(@"Finished account recovery step: %@", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v17);

  if (a2)
  {
    id v25 = [[AKAccountRecoveryResponse alloc] initWithData:v36 httpResponse:v11];
    [*(id *)(a1 + 40) _processResponse:v25 model:*(void *)(a1 + 48) withCompletion:*(void *)(a1 + 56)];

    goto LABEL_9;
  }
  v26 = (objc_class *)objc_opt_class();
  id v27 = NSStringFromClass(v26);
  AKPrintLine(@"Finished recovery flow for - %@", v28, v29, v30, v31, v32, v33, v34, (uint64_t)v27);

  uint64_t v35 = *(void *)(a1 + 56);
  if (v35)
  {
    uint64_t v15 = *(void (**)(void))(v35 + 16);
LABEL_8:
    v15();
  }
LABEL_9:
}

- (void)_logResponse:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [v5 data];
  id v8 = (void *)[v6 initWithData:v7 encoding:4];

  id v9 = NSString;
  id v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  id v12 = [v5 httpResponse];

  id v13 = [v12 allHeaderFields];
  uint64_t v14 = [v9 stringWithFormat:@"<%@: %p {\n\theaderFields: %@, \n\tdata: %@, \n}>", v11, self, v13, v8];

  uint64_t v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDRecoveryController _logResponse:]((uint64_t)v14, v15);
  }
}

- (NSArray)supportedRecoverySteps
{
  return self->_supportedRecoverySteps;
}

- (void)setSupportedRecoverySteps:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_beginAccountRecoveryWithModel:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "requestConfiguration is nil", v1, 2u);
}

- (void)_processResponse:(os_log_t)log model:withCompletion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "No matching recovery step found", v1, 2u);
}

- (void)_logResponse:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_193494000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

@end