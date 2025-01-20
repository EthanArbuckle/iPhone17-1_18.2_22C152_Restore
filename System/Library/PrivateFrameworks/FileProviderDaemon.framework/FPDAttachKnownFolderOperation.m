@interface FPDAttachKnownFolderOperation
- (FPDAttachKnownFolderOperation)initWithKnownFolderURLs:(id)a3 onlyForDomain:(id)a4 server:(id)a5 options:(unint64_t)a6 request:(id)a7;
- (FPDAttachKnownFolderOperation)initWithKnownFolders:(unint64_t)a3 onlyForDomain:(id)a4 server:(id)a5 options:(unint64_t)a6 request:(id)a7;
- (id)resolveKnownFolderURLsWithError:(id *)a3;
- (void)main;
- (void)notifyUserForDomain:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation FPDAttachKnownFolderOperation

- (FPDAttachKnownFolderOperation)initWithKnownFolderURLs:(id)a3 onlyForDomain:(id)a4 server:(id)a5 options:(unint64_t)a6 request:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)FPDAttachKnownFolderOperation;
  v17 = [(FPOperation *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_knownFolders = 0;
    objc_storeStrong((id *)&v17->_knownFolderPhysicalURLs, a3);
    objc_storeStrong((id *)&v18->_onlyForDomain, a4);
    objc_storeStrong((id *)&v18->_server, a5);
    v18->_options = a6;
    objc_storeStrong((id *)&v18->_request, a7);
  }

  return v18;
}

- (FPDAttachKnownFolderOperation)initWithKnownFolders:(unint64_t)a3 onlyForDomain:(id)a4 server:(id)a5 options:(unint64_t)a6 request:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)FPDAttachKnownFolderOperation;
  id v16 = [(FPOperation *)&v20 init];
  v17 = v16;
  if (v16)
  {
    v16->_knownFolders = a3;
    knownFolderPhysicalURLs = v16->_knownFolderPhysicalURLs;
    v16->_knownFolderPhysicalURLs = 0;

    objc_storeStrong((id *)&v17->_onlyForDomain, a4);
    objc_storeStrong((id *)&v17->_server, a5);
    v17->_options = a6;
    objc_storeStrong((id *)&v17->_request, a7);
  }

  return v17;
}

- (void)notifyUserForDomain:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  unint64_t options = self->_options;
  v9 = fp_current_or_default_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if ((options & 2) != 0)
  {
    if (v10) {
      -[FPDAttachKnownFolderOperation notifyUserForDomain:withCompletionHandler:].cold.4();
    }

    if (os_variant_has_internal_content())
    {
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.fileproviderd"];
      v12 = [v11 stringForKey:@"forceAttachPromptResult"];
      if ([v12 isEqualToString:@"approve"])
      {
        id v13 = fp_current_or_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[FPDAttachKnownFolderOperation notifyUserForDomain:withCompletionHandler:]();
        }

        id v14 = [MEMORY[0x1E4F1C9C8] now];
        [v14 timeIntervalSince1970];
        objc_msgSend(v11, "setDouble:forKey:", @"forceAttachPromptLastInterception");

        v7[2](v7, 0);
        goto LABEL_21;
      }
      if ([v12 isEqualToString:@"decline"])
      {
        id v15 = fp_current_or_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[FPDAttachKnownFolderOperation notifyUserForDomain:withCompletionHandler:]();
        }

        id v16 = [MEMORY[0x1E4F1C9C8] now];
        [v16 timeIntervalSince1970];
        objc_msgSend(v11, "setDouble:forKey:", @"forceAttachPromptLastInterception");

        v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
        ((void (**)(id, void *))v7)[2](v7, v17);
        goto LABEL_20;
      }
    }
    v18 = [v6 provider];
    v11 = [v18 providerDomainForDomain:v6];

    v19 = [v6 provider];
    objc_msgSend(v11, "setShouldHideDomainDisplayName:", objc_msgSend(v19, "shouldHideDomainDisplayName"));

    v12 = (void *)[(id)objc_opt_new() initWithProviderDomain:v11];
    if ([v12 presentAlertWithUserAprovalToContinue])
    {
      v7[2](v7, 0);
LABEL_21:

      goto LABEL_22;
    }
    v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    ((void (**)(id, void *))v7)[2](v7, v17);
LABEL_20:

    goto LABEL_21;
  }
  if (v10) {
    -[FPDAttachKnownFolderOperation notifyUserForDomain:withCompletionHandler:]();
  }

  v7[2](v7, 0);
LABEL_22:
}

- (id)resolveKnownFolderURLsWithError:(id *)a3
{
  knownFolderPhysicalURLs = self->_knownFolderPhysicalURLs;
  if (knownFolderPhysicalURLs)
  {
    v4 = knownFolderPhysicalURLs;
    goto LABEL_14;
  }
  v7 = objc_opt_new();
  unint64_t knownFolders = self->_knownFolders;
  if (knownFolders)
  {
    uint64_t v9 = +[FPDKnownFolderArbiter desktopURL];
    if (!v9) {
      goto LABEL_10;
    }
    BOOL v10 = (void *)v9;
    [v7 addObject:v9];

    unint64_t knownFolders = self->_knownFolders;
  }
  if ((knownFolders & 2) != 0)
  {
    uint64_t v11 = +[FPDKnownFolderArbiter documentsURL];
    if (v11)
    {
      v12 = (void *)v11;
      [v7 addObject:v11];

      goto LABEL_9;
    }
LABEL_10:
    if (a3)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:0];
      v4 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    goto LABEL_13;
  }
LABEL_9:
  v4 = v7;
LABEL_13:

LABEL_14:
  return v4;
}

- (void)main
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v32 = 0;
  v3 = [(FPDAttachKnownFolderOperation *)self resolveKnownFolderURLsWithError:&v32];
  id v4 = v32;
  v5 = v4;
  if (v3)
  {
    id v22 = v4;
    v25 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v23 = v3;
    id obj = v3;
    uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      v8 = 0;
      uint64_t v9 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v12 = [(FPDServer *)self->_server extensionManager];
          id v13 = [v12 domainForURL:v11 reason:0];

          if (v13)
          {
            if (!v8)
            {
              id v14 = [(FPDServer *)self->_server extensionManager];
              id v15 = [v13 providerDomainID];
              v8 = [v14 domainWithID:v15 reason:0];
            }
            if (!self->_onlyForDomain
              || ([v13 providerDomainID],
                  id v16 = objc_claimAutoreleasedReturnValue(),
                  [(FPDDomain *)self->_onlyForDomain providerDomainID],
                  v17 = objc_claimAutoreleasedReturnValue(),
                  int v18 = [v16 isEqualToString:v17],
                  v17,
                  v16,
                  v18))
            {
              v19 = [v13 providerDomainID];
              objc_super v20 = [v25 objectForKeyedSubscript:v19];

              if (!v20)
              {
                objc_super v20 = objc_opt_new();
                v21 = [v13 providerDomainID];
                [v25 setObject:v20 forKeyedSubscript:v21];
              }
              [v20 addObject:v11];
            }
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

    if ([v25 count])
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __37__FPDAttachKnownFolderOperation_main__block_invoke;
      v26[3] = &unk_1E6A73C80;
      v26[4] = self;
      id v27 = v25;
      [(FPDAttachKnownFolderOperation *)self notifyUserForDomain:v8 withCompletionHandler:v26];
    }
    else
    {
      [(FPOperation *)self finishWithResult:0 error:0];
    }
    v5 = v22;
    v3 = v23;
  }
  else
  {
    [(FPOperation *)self finishWithResult:0 error:v4];
  }
}

void __37__FPDAttachKnownFolderOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    id v4 = dispatch_group_create();
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__16;
    v40 = __Block_byref_object_dispose__16;
    id v41 = 0;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = *(id *)(a1 + 40);
    uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    id v3 = 0;
    if (!v5) {
      goto LABEL_16;
    }
    uint64_t v6 = *(void *)v33;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v31 = 0;
        uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 328) extensionManager];
        BOOL v10 = [v9 domainWithID:v8 reason:&v31];

        if (v10)
        {
          uint64_t v11 = [v10 defaultBackend];
          char v12 = objc_opt_respondsToSelector();

          if (v12)
          {
            dispatch_group_enter(v4);
            id v13 = [v10 defaultBackend];
            id v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
            uint64_t v15 = *(void *)(a1 + 32);
            uint64_t v16 = *(void *)(v15 + 336);
            uint64_t v17 = *(void *)(v15 + 344);
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __37__FPDAttachKnownFolderOperation_main__block_invoke_37;
            v28[3] = &unk_1E6A75ED0;
            long long v29 = v4;
            long long v30 = &v36;
            uint64_t v18 = v17;
            id v3 = 0;
            [v13 attachKnownFolders:v14 options:v16 request:v18 completionHandler:v28];

            v19 = v29;
            goto LABEL_14;
          }
          v19 = v4;
          objc_sync_enter(v19);
          uint64_t v23 = FPNotSupportedError();
          v24 = (void *)v37[5];
          v37[5] = v23;
        }
        else
        {
          v19 = v4;
          objc_sync_enter(v19);
          objc_super v20 = objc_msgSend(v8, "fp_toProviderID");
          uint64_t v21 = FPProviderNotFoundError();
          id v22 = (void *)v37[5];
          v37[5] = v21;
        }
        objc_sync_exit(v19);
LABEL_14:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
      if (!v5)
      {
LABEL_16:

        v25 = [*(id *)(a1 + 32) callbackQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __37__FPDAttachKnownFolderOperation_main__block_invoke_2;
        block[3] = &unk_1E6A74870;
        block[4] = *(void *)(a1 + 32);
        block[5] = &v36;
        dispatch_group_notify(v4, v25, block);

        _Block_object_dispose(&v36, 8);
        goto LABEL_17;
      }
    }
  }
  [*(id *)(a1 + 32) completedWithResult:0 error:v3];
LABEL_17:
}

void __37__FPDAttachKnownFolderOperation_main__block_invoke_37(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    id v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    objc_sync_exit(v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __37__FPDAttachKnownFolderOperation_main__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_onlyForDomain, 0);
  objc_storeStrong((id *)&self->_knownFolderPhysicalURLs, 0);
}

- (void)notifyUserForDomain:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] 🖥️  not presenting UI for attaching folders", v2, v3, v4, v5, v6);
}

- (void)notifyUserForDomain:withCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] 🖥️  forcing approval of attach", v2, v3, v4, v5, v6);
}

- (void)notifyUserForDomain:withCompletionHandler:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] 🖥️  forcing decline of attach", v2, v3, v4, v5, v6);
}

- (void)notifyUserForDomain:withCompletionHandler:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] 🖥️  asking the user whether we should reattach", v2, v3, v4, v5, v6);
}

@end