@interface LNActionDefaultValueProvider
- (LNActionDefaultValueProvider)initWithActionIdentifier:(id)a3 actionMetadata:(id)a4;
- (LNActionMetadata)actionMetadata;
- (LNFullyQualifiedActionIdentifier)actionIdentifier;
- (id)loadActionMetadataWithRetry:(BOOL)a3 error:(id *)a4;
- (id)loadStaticDefaultValueForBundleIdentifier:(id)a3 error:(id *)a4;
- (void)loadDefaultValuesWithCompletionHandler:(id)a3;
- (void)loadSuggestedFocusActionsWithSuggestionContext:(id)a3 completion:(id)a4;
- (void)setActionMetadata:(id)a3;
@end

@implementation LNActionDefaultValueProvider

BOOL __80__LNActionDefaultValueProvider_loadStaticDefaultValueForBundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dynamicOptionsSupport] == 0;
}

- (id)loadStaticDefaultValueForBundleIdentifier:(id)a3 error:(id *)a4
{
  v4 = [(LNActionDefaultValueProvider *)self loadActionMetadataWithRetry:1 error:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 parameters];
    v7 = objc_msgSend(v6, "if_objectsPassingTest:", &__block_literal_global_12788);

    v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __80__LNActionDefaultValueProvider_loadStaticDefaultValueForBundleIdentifier_error___block_invoke_2;
    v14[3] = &unk_1E5B3A2A0;
    id v15 = v8;
    id v9 = v8;
    [v7 enumerateObjectsUsingBlock:v14];
    v10 = objc_alloc_init(LNConnectionPolicySignals);
    [(LNConnectionPolicySignals *)v10 setShouldExecuteActionOnApplicationBasedOnMetadata:0];
    v11 = +[LNConnectionPolicy policyWithActionMetadata:v5 signals:v10];

    v12 = [v11 actionWithParameters:v9];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)loadActionMetadataWithRetry:(BOOL)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v7 = [(LNActionDefaultValueProvider *)self actionMetadata];

  if (v7)
  {
    id v8 = [(LNActionDefaultValueProvider *)self actionMetadata];
  }
  else
  {
    id v9 = objc_opt_new();
    v10 = [(LNActionDefaultValueProvider *)self actionIdentifier];
    v11 = [v10 bundleIdentifier];
    v12 = [(LNActionDefaultValueProvider *)self actionIdentifier];
    v13 = [v12 actionIdentifier];
    id v28 = 0;
    v14 = [v9 actionForBundleIdentifier:v11 andActionIdentifier:v13 error:&v28];
    id v15 = v28;

    if (v14) {
      goto LABEL_4;
    }
    v17 = getLNLogCategoryMetadata();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = [(LNActionDefaultValueProvider *)self actionIdentifier];
      *(_DWORD *)buf = 138543618;
      v30 = v18;
      __int16 v31 = 2114;
      id v32 = v15;
      _os_log_impl(&dword_1A4419000, v17, OS_LOG_TYPE_ERROR, "Failed to load metadata for actionIdentifier %{public}@: %{public}@", buf, 0x16u);
    }
    if (a4 && v15) {
      *a4 = v15;
    }
    v19 = getLNLogCategoryMetadata();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = [(LNActionDefaultValueProvider *)self actionIdentifier];
      *(_DWORD *)buf = 138543618;
      v30 = v20;
      __int16 v31 = 2114;
      id v32 = v15;
      _os_log_impl(&dword_1A4419000, v19, OS_LOG_TYPE_ERROR, "Failed to load metadata for actionIdentifier %{public}@: %{public}@", buf, 0x16u);
    }
    if (!v15)
    {
LABEL_4:
      [(LNActionDefaultValueProvider *)self setActionMetadata:v14];
      id v8 = v14;
    }
    else if (a3)
    {
      v21 = [(LNActionDefaultValueProvider *)self actionIdentifier];
      v22 = [v21 bundleIdentifier];
      id v27 = 0;
      [v9 registerBundleWithIdentifier:v22 error:&v27];
      id v23 = v27;

      if (v23)
      {
        v24 = getLNLogCategoryMetadata();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = [(LNActionDefaultValueProvider *)self actionIdentifier];
          v26 = [v25 bundleIdentifier];
          *(_DWORD *)buf = 138543618;
          v30 = v26;
          __int16 v31 = 2114;
          id v32 = v23;
          _os_log_impl(&dword_1A4419000, v24, OS_LOG_TYPE_ERROR, "Failed to register %{public}@: %{public}@", buf, 0x16u);
        }
        id v8 = 0;
        *a4 = v23;
      }
      else
      {
        id v8 = [(LNActionDefaultValueProvider *)self loadActionMetadataWithRetry:0 error:a4];
      }
    }
    else
    {
      id v8 = 0;
      *a4 = v15;
    }
  }
  return v8;
}

- (LNActionMetadata)actionMetadata
{
  return self->_actionMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionMetadata, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

void __80__LNActionDefaultValueProvider_loadStaticDefaultValueForBundleIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 typeSpecificMetadata];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F725B8]];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = [v3 valueType];
  id v8 = (void *)v7;
  if (isKindOfClass)
  {
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
    id v14 = v9;

    id v15 = [v14 memberValueType];

    if (v15)
    {
      id v16 = v15;
    }
    else
    {
      id v16 = [v3 valueType];
    }
    v17 = v16;

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __80__LNActionDefaultValueProvider_loadStaticDefaultValueForBundleIdentifier_error___block_invoke_3;
    v22[3] = &unk_1E5B3A278;
    id v23 = v17;
    id v13 = v17;
    v18 = objc_msgSend(v5, "if_map:", v22);
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F72718]) initWithValues:v18 memberValueType:v13];

    goto LABEL_14;
  }
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();

  v11 = 0;
  if ((v10 & 1) == 0 && v5)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F72718]);
    id v13 = [v3 valueType];
    v11 = (void *)[v12 initWithValue:v5 valueType:v13];
LABEL_14:
  }
  id v19 = objc_alloc(MEMORY[0x1E4F726D8]);
  v20 = [v3 name];
  v21 = (void *)[v19 initWithIdentifier:v20 value:v11];

  [*(id *)(a1 + 32) addObject:v21];
}

- (LNActionDefaultValueProvider)initWithActionIdentifier:(id)a3 actionMetadata:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"LNActionDefaultValueProvider.m", 24, @"Invalid parameter not satisfying: %@", @"actionIdentifier" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)LNActionDefaultValueProvider;
  char v10 = [(LNActionDefaultValueProvider *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_actionIdentifier, a3);
    objc_storeStrong((id *)&v11->_actionMetadata, a4);
    id v12 = v11;
  }

  return v11;
}

- (void)setActionMetadata:(id)a3
{
}

- (LNFullyQualifiedActionIdentifier)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)loadSuggestedFocusActionsWithSuggestionContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__LNActionDefaultValueProvider_loadSuggestedFocusActionsWithSuggestionContext_completion___block_invoke;
  block[3] = &unk_1E5B3A318;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __90__LNActionDefaultValueProvider_loadSuggestedFocusActionsWithSuggestionContext_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v12 = 0;
  id v3 = [v2 loadActionMetadataWithRetry:1 error:&v12];
  id v4 = v12;
  if (v3)
  {
    v5 = +[LNConnectionPolicy policyWithActionMetadata:v3];
    id v11 = 0;
    id v6 = [v5 connectionWithError:&v11];
    id v7 = v11;
    if (v7)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __90__LNActionDefaultValueProvider_loadSuggestedFocusActionsWithSuggestionContext_completion___block_invoke_2;
      v9[3] = &unk_1E5B3A2F0;
      uint64_t v8 = *(void *)(a1 + 40);
      id v10 = *(id *)(a1 + 48);
      [v6 fetchSuggestedFocusActionsForActionMetadata:v3 suggestionContext:v8 completionHandler:v9];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __90__LNActionDefaultValueProvider_loadSuggestedFocusActionsWithSuggestionContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadDefaultValuesWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v22 = 0;
  v5 = [(LNActionDefaultValueProvider *)self loadActionMetadataWithRetry:1 error:&v22];
  id v6 = v22;
  if (v5)
  {
    id v7 = [(LNActionDefaultValueProvider *)self actionIdentifier];
    uint64_t v8 = [v7 bundleIdentifier];
    id v21 = 0;
    id v9 = [(LNActionDefaultValueProvider *)self loadStaticDefaultValueForBundleIdentifier:v8 error:&v21];
    id v10 = v21;

    if (v9)
    {
      id v11 = [v5 parameters];
      id v12 = objc_msgSend(v11, "if_objectsPassingTest:", &__block_literal_global_28_12783);
      uint64_t v13 = [v11 count];
      if (v13 == [v12 count])
      {
        v4[2](v4, v9, 0);
      }
      else
      {
        id v14 = objc_alloc_init(LNConnectionPolicySignals);
        [(LNConnectionPolicySignals *)v14 setShouldExecuteActionOnApplicationBasedOnMetadata:0];
        objc_super v15 = +[LNConnectionPolicy policyWithActionMetadata:v5 signals:v14];

        id v20 = 0;
        id v16 = [v15 connectionWithError:&v20];
        id v17 = v20;
        if (v17)
        {
          ((void (**)(id, void *, id))v4)[2](v4, 0, v17);
        }
        else
        {
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __71__LNActionDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_2;
          v18[3] = &unk_1E5B3A2C8;
          id v19 = v4;
          [v16 fetchOptionsDefaultValueForAction:v9 completionHandler:v18];
        }
      }
    }
    else
    {
      ((void (**)(id, void *, id))v4)[2](v4, 0, v10);
    }
  }
  else
  {
    ((void (**)(id, void *, id))v4)[2](v4, 0, v6);
  }
}

uint64_t __71__LNActionDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL __71__LNActionDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dynamicOptionsSupport] == 0;
}

id __80__LNActionDefaultValueProvider_loadStaticDefaultValueForBundleIdentifier_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F72718];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithValue:v4 valueType:*(void *)(a1 + 32)];

  return v5;
}

@end