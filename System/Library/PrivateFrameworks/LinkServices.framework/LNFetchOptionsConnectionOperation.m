@interface LNFetchOptionsConnectionOperation
- (LNAction)action;
- (LNActionMetadata)actionMetadata;
- (LNActionParameterMetadata)parameterMetadata;
- (LNDynamicOptionsProviderReference)optionsProviderReference;
- (LNDynamicOptionsResult)result;
- (LNFetchOptionsConnectionOperation)initWithConnectionInterface:(id)a3 action:(id)a4 actionMetadata:(id)a5 parameterMetadata:(id)a6 optionsProviderReference:(id)a7 searchTerm:(id)a8 localeIdentifier:(id)a9 queue:(id)a10 completionHandler:(id)a11;
- (NSString)localeIdentifier;
- (NSString)searchTerm;
- (id)completionHandler;
- (void)finishWithError:(id)a3;
- (void)setAction:(id)a3;
- (void)setActionMetadata:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setOptionsProviderReference:(id)a3;
- (void)setParameterMetadata:(id)a3;
- (void)setResult:(id)a3;
- (void)setSearchTerm:(id)a3;
- (void)start;
@end

@implementation LNFetchOptionsConnectionOperation

os_activity_t __182__LNFetchOptionsConnectionOperation_initWithConnectionInterface_action_actionMetadata_parameterMetadata_optionsProviderReference_searchTerm_localeIdentifier_queue_completionHandler___block_invoke()
{
  os_activity_t v0 = _os_activity_create(&dword_1A4419000, "appintents:fetch options", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v0;
}

- (LNFetchOptionsConnectionOperation)initWithConnectionInterface:(id)a3 action:(id)a4 actionMetadata:(id)a5 parameterMetadata:(id)a6 optionsProviderReference:(id)a7 searchTerm:(id)a8 localeIdentifier:(id)a9 queue:(id)a10 completionHandler:(id)a11
{
  id v17 = a3;
  id v49 = a4;
  id obj = a5;
  id v18 = a5;
  id v43 = a6;
  id v19 = a6;
  id v44 = a7;
  id v48 = a7;
  id v46 = a8;
  id v47 = a8;
  id v45 = a9;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  if (v18)
  {
    if (v19) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v32 = v31 = a2;
    [v32 handleFailureInMethod:v31, self, @"LNFetchOptionsConnectionOperation.m", 38, @"Invalid parameter not satisfying: %@", @"actionMetadata", obj, v43, v44, a9, v46, v47, v48, v49 object file lineNumber description];

    a2 = v31;
    if (v19)
    {
LABEL_3:
      if (v20) {
        goto LABEL_4;
      }
LABEL_12:
      [MEMORY[0x1E4F28B00] currentHandler];
      v36 = v35 = a2;
      [v36 handleFailureInMethod:v35, self, @"LNFetchOptionsConnectionOperation.m", 40, @"Invalid parameter not satisfying: %@", @"localeIdentifier" object file lineNumber description];

      a2 = v35;
      if (v17) {
        goto LABEL_5;
      }
      goto LABEL_13;
    }
  }
  [MEMORY[0x1E4F28B00] currentHandler];
  v34 = v33 = a2;
  [v34 handleFailureInMethod:v33, self, @"LNFetchOptionsConnectionOperation.m", 39, @"Invalid parameter not satisfying: %@", @"parameterMetadata" object file lineNumber description];

  a2 = v33;
  if (!v20) {
    goto LABEL_12;
  }
LABEL_4:
  if (v17) {
    goto LABEL_5;
  }
LABEL_13:
  [MEMORY[0x1E4F28B00] currentHandler];
  v38 = v37 = a2;
  [v38 handleFailureInMethod:v37, self, @"LNFetchOptionsConnectionOperation.m", 41, @"Invalid parameter not satisfying: %@", @"connectionInterface" object file lineNumber description];

  a2 = v37;
LABEL_5:
  v23 = v19;
  if (!v22)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    SEL v40 = a2;
    v41 = v39;
    [v39 handleFailureInMethod:v40, self, @"LNFetchOptionsConnectionOperation.m", 42, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v24 = [MEMORY[0x1E4F29128] UUID];
  v25 = [v18 systemProtocols];
  v51.receiver = self;
  v51.super_class = (Class)LNFetchOptionsConnectionOperation;
  v26 = [(LNRuntimeAssertionsTakingConnectionOperation *)&v51 initWithIdentifier:v24 connectionInterface:v17 systemProtocols:v25 priority:1 queue:v21 activity:&__block_literal_global_11409];

  if (v26)
  {
    objc_storeStrong((id *)&v26->_action, a4);
    objc_storeStrong((id *)&v26->_actionMetadata, obj);
    objc_storeStrong((id *)&v26->_parameterMetadata, v43);
    objc_storeStrong((id *)&v26->_optionsProviderReference, v44);
    objc_storeStrong((id *)&v26->_searchTerm, v46);
    objc_storeStrong((id *)&v26->_localeIdentifier, v45);
    v27 = _Block_copy(v22);
    id completionHandler = v26->_completionHandler;
    v26->_id completionHandler = v27;

    v29 = v26;
  }

  return v26;
}

- (void)start
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)LNFetchOptionsConnectionOperation;
  [(LNConnectionOperation *)&v17 start];
  v3 = getLNLogCategoryConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(LNFetchOptionsConnectionOperation *)self actionMetadata];
    v5 = [v4 identifier];
    v6 = [(LNFetchOptionsConnectionOperation *)self parameterMetadata];
    v7 = [v6 name];
    v8 = [(LNFetchOptionsConnectionOperation *)self searchTerm];
    *(_DWORD *)buf = 138412802;
    id v19 = v5;
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_INFO, "Fetching options for action %@, parameter: %@, searchTerm: %@", buf, 0x20u);
  }
  v9 = [(LNInterfaceConnectionOperation *)self connectionInterface];
  v10 = [(LNFetchOptionsConnectionOperation *)self action];
  v11 = [(LNFetchOptionsConnectionOperation *)self actionMetadata];
  v12 = [(LNFetchOptionsConnectionOperation *)self parameterMetadata];
  v13 = [(LNFetchOptionsConnectionOperation *)self optionsProviderReference];
  v14 = [(LNFetchOptionsConnectionOperation *)self searchTerm];
  v15 = [(LNFetchOptionsConnectionOperation *)self localeIdentifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __42__LNFetchOptionsConnectionOperation_start__block_invoke;
  v16[3] = &unk_1E5B39CB0;
  v16[4] = self;
  [v9 fetchOptionsForAction:v10 actionMetadata:v11 parameterMetadata:v12 optionsProviderReference:v13 searchTerm:v14 localeIdentifier:v15 completionHandler:v16];
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (LNActionParameterMetadata)parameterMetadata
{
  return self->_parameterMetadata;
}

- (LNActionMetadata)actionMetadata
{
  return self->_actionMetadata;
}

- (LNDynamicOptionsProviderReference)optionsProviderReference
{
  return self->_optionsProviderReference;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (LNAction)action
{
  return self->_action;
}

void __42__LNFetchOptionsConnectionOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "activity", 0, 0);
  os_activity_scope_enter(v7, &v8);

  [*(id *)(a1 + 32) setResult:v5];
  [*(id *)(a1 + 32) finishWithError:v6];
  os_activity_scope_leave(&v8);
}

- (void)setResult:(id)a3
{
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(LNFetchOptionsConnectionOperation *)self completionHandler];

  if (v5)
  {
    id v6 = [(LNFetchOptionsConnectionOperation *)self result];
    uint64_t v7 = [(LNConnectionOperation *)self validatingResult:v6 error:v4];

    os_activity_scope_state_s v8 = [(LNFetchOptionsConnectionOperation *)self completionHandler];
    v9 = [(LNFetchOptionsConnectionOperation *)self result];
    ((void (**)(void, void *, uint64_t))v8)[2](v8, v9, v7);

    [(LNFetchOptionsConnectionOperation *)self setCompletionHandler:0];
    id v4 = (id)v7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNFetchOptionsConnectionOperation;
  [(LNConnectionOperation *)&v10 finishWithError:v4];
}

- (LNDynamicOptionsResult)result
{
  return self->_result;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_optionsProviderReference, 0);
  objc_storeStrong((id *)&self->_parameterMetadata, 0);
  objc_storeStrong((id *)&self->_actionMetadata, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (void)setSearchTerm:(id)a3
{
}

- (void)setOptionsProviderReference:(id)a3
{
}

- (void)setParameterMetadata:(id)a3
{
}

- (void)setActionMetadata:(id)a3
{
}

- (void)setAction:(id)a3
{
}

@end