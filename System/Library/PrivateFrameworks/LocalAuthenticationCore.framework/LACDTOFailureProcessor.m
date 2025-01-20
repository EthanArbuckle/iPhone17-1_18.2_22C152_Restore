@interface LACDTOFailureProcessor
- (BOOL)_checkErrorRequiresUI:(id)a3;
- (BOOL)canProcessRequest:(id)a3;
- (LACDTOFailureProcessor)initWithReplyQueue:(id)a3 ui:(id)a4;
- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5;
- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
@end

@implementation LACDTOFailureProcessor

- (void).cxx_destruct
{
}

- (LACDTOFailureProcessor)initWithReplyQueue:(id)a3 ui:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)LACDTOFailureProcessor;
  v7 = [(LACDTOFailureProcessor *)&v10 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_ui, a4);
  }

  return v8;
}

- (BOOL)canProcessRequest:(id)a3
{
  id v3 = a3;
  v4 = [v3 options];
  v5 = [NSNumber numberWithInteger:1000];
  id v6 = [v4 objectForKey:v5];
  char v7 = [v6 BOOLValue];

  if (v7)
  {
    char v8 = 0;
  }
  else
  {
    v9 = [v3 options];
    objc_super v10 = [NSNumber numberWithInteger:1039];
    v11 = [v9 objectForKey:v10];
    char v12 = [v11 BOOLValue];

    char v8 = v12 ^ 1;
  }

  return v8;
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = +[LACEvaluationResult resultWithNext:a3];
  (*((void (**)(id, id))a5 + 2))(v7, v8);
}

- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(LACDTOFailureProcessor *)self canProcessRequest:v8]
    && ([v9 error], v11 = objc_claimAutoreleasedReturnValue(), v11, v11)
    && ([v9 error],
        char v12 = objc_claimAutoreleasedReturnValue(),
        BOOL v13 = [(LACDTOFailureProcessor *)self _checkErrorRequiresUI:v12],
        v12,
        v13))
  {
    v14 = LACLogDTO();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_254F14000, v14, OS_LOG_TYPE_DEFAULT, "Failure alert will appear.", buf, 2u);
    }

    ui = self->_ui;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __63__LACDTOFailureProcessor_postProcessRequest_result_completion___block_invoke;
    v16[3] = &unk_2653B57A0;
    id v18 = v10;
    id v17 = v9;
    [(LACUserInterfacePresenting *)ui presentUIForIdentifier:5 request:v8 completion:v16];
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v9);
  }
}

void __63__LACDTOFailureProcessor_postProcessRequest_result_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = LACLogDTO();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_254F14000, v4, OS_LOG_TYPE_DEFAULT, "Failure alert did disappear (err: %@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_checkErrorRequiresUI:(id)a3
{
  id v3 = a3;
  if (v3) {
    BOOL v4 = +[LACError error:v3 hasCode:-1 subcode:32]
  }
      || +[LACError error:v3 hasCode:-8 subcode:15]
      || +[LACError error:v3 hasCode:-8 subcode:29]
      || +[LACError error:v3 hasCode:-8 subcode:4]
      || +[LACError error:v3 hasCode:-8 subcode:-1]
      || +[LACError error:v3 hasCode:-4 subcode:12]
      || +[LACError error:v3 hasCode:-4 subcode:18];
  else {
    BOOL v4 = 0;
  }

  return v4;
}

@end