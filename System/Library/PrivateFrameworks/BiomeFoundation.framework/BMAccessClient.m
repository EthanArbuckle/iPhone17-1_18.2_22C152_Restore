@interface BMAccessClient
- (BMAccessClient)init;
- (BMAccessClient)initWithUseCase:(id)a3;
- (BMAccessClient)initWithUseCase:(id)a3 sandboxExtensionCache:(id)a4 accessTracker:(id)a5;
- (BOOL)_currentProcessIsSandboxed;
- (BOOL)removeResource:(id)a3 error:(id *)a4;
- (id)_newConnectionForDomain:(unint64_t)a3;
- (id)_synchronousRemoteObjectProxyForDomain:(unint64_t)a3 errorHandler:(id)a4;
- (id)requestAccessToResource:(id)a3 mode:(unint64_t)a4 error:(id *)a5;
- (id)requestEndpointForDomain:(unint64_t)a3 error:(id *)a4;
@end

@implementation BMAccessClient

- (id)requestAccessToResource:(id)a3 mode:(unint64_t)a4 error:(id *)a5
{
  v102[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v57 = v6;
  if (v6)
  {
    v7 = v6;
    BOOL v8 = +[BMPaths isTestPathOverridden];
    v61 = v7;
    uint64_t v9 = [v61 type];
    v10 = "BMAccessClient.requestAccessToResource: Unknown";
    switch(v9)
    {
      case 0:
        break;
      case 1:
        v10 = "BMAccessClient.requestAccessToResource: Stream";
        break;
      case 2:
        v10 = "BMAccessClient.requestAccessToResource: View";
        break;
      case 3:
        v10 = "BMAccessClient.requestAccessToResource: Database";
        break;
      case 4:
        v10 = "BMAccessClient.requestAccessToResource: Set";
        break;
      case 5:
        v13 = [v61 name];
        char v14 = [v13 isEqual:@"BMSyncResource"];

        if (v14)
        {
          v10 = "BMAccessClient.requestAccessToResource: Sync";
        }
        else
        {
          v15 = [v61 name];
          char v16 = [v15 isEqual:@"BMSharedSyncResource"];

          if (v16)
          {
            v10 = "BMAccessClient.requestAccessToResource: SharedSync";
          }
          else
          {
            v17 = [v61 name];
            char v18 = [v17 isEqual:@"BMFlexibleStorageResource"];

            if (v18)
            {
              v10 = "BMAccessClient.requestAccessToResource: BFS";
            }
            else
            {
              v19 = [v61 name];
              char v20 = [v19 isEqual:@"BMSetsResource"];

              if (v20)
              {
                v10 = "BMAccessClient.requestAccessToResource: Sets";
              }
              else
              {
                v21 = [v61 name];
                int v22 = [v21 isEqual:@"BMSetsMergeableDeltasResource"];

                if (v22) {
                  v10 = "BMAccessClient.requestAccessToResource: SetsMergeableDeltas";
                }
                else {
                  v10 = "BMAccessClient.requestAccessToResource: Other";
                }
              }
            }
          }
        }
        break;
      default:
        v10 = "BMAccessClient.requestAccessToResource: Unhandled";
        break;
    }
    v23 = _os_activity_create(&dword_1B30A0000, v10, MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v56 = v23;
    os_activity_scope_enter(v23, &state);
    uint64_t v24 = BMServiceDomainForResource(v61);
    v25 = +[BMProcess current];
    char v26 = [v25 processType] == 5 || v8;

    if ((v26 & 1) == 0)
    {
      v27 = +[BMProcess current];
      v58 = +[BMAccessControlPolicy policyForProcess:v27 connectionFlags:0 useCase:self->_useCase];

      if (([(BMAccessDescriptor *)v58 allowsAccessToResource:v61 withMode:a4] & 1) == 0)
      {
        [(BMAccessTracker *)self->_accessTracker logMissingEntitlementsForAccessToResource:v61 domain:v24 withMode:a4 useCase:self->_useCase];
        if (a5)
        {
          v33 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v99 = *MEMORY[0x1E4F28568];
          v100 = @"Not entitled";
          v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
          *a5 = [v33 errorWithDomain:@"BMAccessErrorDomain" code:3 userInfo:v34];
        }
        v12 = 0;
        goto LABEL_60;
      }
    }
    v58 = [[BMAccessDescriptor alloc] initWithDomain:v24 accessMode:a4 resource:v61];
    -[BMAccessAssertionCache assertionForAccessDescriptor:](self->_accessAssertionCache, "assertionForAccessDescriptor:");
    v12 = (_BMAccessAssertionNotApplicable *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
LABEL_60:

      os_activity_scope_leave(&state);
      goto LABEL_61;
    }
    v28 = +[BMProcess current];
    BOOL v29 = [v28 processType] == 2;

    if (v29 || v8)
    {
      v30 = +[BMResourceContainerManager sharedInstance];
      id v89 = 0;
      v31 = [v30 openContainerForResource:v61 mode:a4 error:&v89];
      id v32 = v89;

      if (v31)
      {
        v12 = [[_BMAccessAssertionNotApplicable alloc] initWithDescriptor:v58 container:v31];
      }
      else
      {
        if (a5)
        {
          v47 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v97 = *MEMORY[0x1E4F28568];
          v98 = @"Cannot open container";
          v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
          *a5 = [v47 errorWithDomain:@"BMAccessErrorDomain" code:13 userInfo:v48];
        }
        v12 = 0;
      }

      goto LABEL_60;
    }
    unint64_t v88 = 0;
    uint64_t v82 = 0;
    v83 = &v82;
    uint64_t v84 = 0x3032000000;
    v85 = __Block_byref_object_copy_;
    v86 = __Block_byref_object_dispose_;
    id v87 = 0;
    uint64_t v76 = 0;
    v77 = &v76;
    uint64_t v78 = 0x3032000000;
    v79 = __Block_byref_object_copy_;
    v80 = __Block_byref_object_dispose_;
    id v81 = 0;
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x3032000000;
    v73 = __Block_byref_object_copy_;
    v74 = __Block_byref_object_dispose_;
    id v75 = 0;
    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x3032000000;
    v67 = __Block_byref_object_copy_;
    v68 = __Block_byref_object_dispose_;
    id v69 = 0;
    uint64_t v35 = MEMORY[0x1E4F143A8];
    do
    {
      v63[0] = v35;
      v63[1] = 3221225472;
      v63[2] = __53__BMAccessClient_requestAccessToResource_mode_error___block_invoke;
      v63[3] = &unk_1E6022E50;
      v63[4] = &v64;
      v36 = [(BMAccessClient *)self _synchronousRemoteObjectProxyForDomain:v24 errorHandler:v63];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __53__BMAccessClient_requestAccessToResource_mode_error___block_invoke_96;
      v62[3] = &unk_1E6022E78;
      v62[4] = &v82;
      v62[5] = &v70;
      v62[6] = &v76;
      v62[7] = &v64;
      [v36 requestAccessToResource:v61 withMode:a4 reply:v62];
    }
    while ((BMShouldRetry((void *)v65[5], &v88, 2uLL, 1) & 1) != 0);
    if (![(BMAccessClient *)self _currentProcessIsSandboxed])
    {
      v45 = __biome_log_for_category(6);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B30A0000, v45, OS_LOG_TYPE_INFO, "Process not sandboxed, returning access descriptor with container information but no sandbox extension", buf, 2u);
      }

      v46 = [_BMAccessAssertionNotApplicable alloc];
      v12 = [(_BMAccessAssertionNotApplicable *)v46 initWithDescriptor:v58 container:v83[5]];
      goto LABEL_59;
    }
    v37 = +[BMPaths pathForResource:v61 inContainer:v83[5]];
    v38 = &BMSandboxWriteOperation;
    if ((a4 & 2) == 0) {
      v38 = &BMSandboxReadOperation;
    }
    v39 = *v38;
    v40 = +[BMProcess current];
    int v41 = [v40 canPerformFileOperation:v39 onPath:v37 report:0];

    if (v41)
    {
      v42 = __biome_log_for_category(6);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = BMAccessModePrintableDescription(a4);
        *(_DWORD *)buf = 138412546;
        v92 = v43;
        __int16 v93 = 2112;
        v94 = v37;
        _os_log_impl(&dword_1B30A0000, v42, OS_LOG_TYPE_INFO, "Process already has %@ access to %@", buf, 0x16u);
      }
      v44 = [_BMAccessAssertionNotApplicable alloc];
      v12 = [(_BMAccessAssertionNotApplicable *)v44 initWithDescriptor:v58 container:v83[5]];
    }
    else
    {

      uint64_t v49 = v77[5];
      if (v49)
      {
        v12 = [(BMAccessAssertionCache *)self->_accessAssertionCache createAssertionForAccessDescriptor:v58 extensionToken:v49 container:v83[5] path:v71[5]];
        if (v12)
        {
LABEL_59:
          _Block_object_dispose(&v64, 8);

          _Block_object_dispose(&v70, 8);
          _Block_object_dispose(&v76, 8);

          _Block_object_dispose(&v82, 8);
          goto LABEL_60;
        }
        v37 = __biome_log_for_category(6);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v50 = BMAccessModePrintableDescription(a4);
          uint64_t v51 = v65[5];
          *(_DWORD *)buf = 138543874;
          v92 = v50;
          __int16 v93 = 2114;
          v94 = v61;
          __int16 v95 = 2114;
          uint64_t v96 = v51;
          _os_log_error_impl(&dword_1B30A0000, v37, OS_LOG_TYPE_ERROR, "Failed to create assertion for %{public}@ access to %{public}@ with error %{public}@", buf, 0x20u);
        }
      }
      else
      {
        v37 = __biome_log_for_category(6);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v53 = BMAccessModePrintableDescription(a4);
          uint64_t v54 = v65[5];
          *(_DWORD *)buf = 138543874;
          v92 = v53;
          __int16 v93 = 2114;
          v94 = v61;
          __int16 v95 = 2114;
          uint64_t v96 = v54;
          _os_log_error_impl(&dword_1B30A0000, v37, OS_LOG_TYPE_ERROR, "Failed to acquire extension token for %{public}@ access to %{public}@ with error %{public}@", buf, 0x20u);
        }
      }
      v12 = 0;
    }

    goto LABEL_59;
  }
  if (a5)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v101 = *MEMORY[0x1E4F28568];
    v102[0] = @"nil resource";
    v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:&v101 count:1];
    [v11 errorWithDomain:@"BMAccessErrorDomain" code:12 userInfo:v55];
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_61:

  return v12;
}

- (BMAccessClient)initWithUseCase:(id)a3 sandboxExtensionCache:(id)a4 accessTracker:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BMAccessClient;
  v11 = [(BMAccessClient *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    useCase = v11->_useCase;
    v11->_useCase = (NSString *)v12;

    if (v9)
    {
      char v14 = (BMAccessAssertionCache *)v9;
    }
    else
    {
      char v14 = +[BMAccessAssertionCache sharedCache];
    }
    accessAssertionCache = v11->_accessAssertionCache;
    v11->_accessAssertionCache = v14;

    if (v10)
    {
      char v16 = (BMAccessTracker *)v10;
    }
    else
    {
      char v16 = +[BMAccessTracker sharedInstance];
    }
    accessTracker = v11->_accessTracker;
    v11->_accessTracker = v16;
  }
  return v11;
}

- (id)_synchronousRemoteObjectProxyForDomain:(unint64_t)a3 errorHandler:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *))a4;
  v7 = self->_connectionWrapper;
  if (![(BMXPCConnectionWrapper *)v7 isValid])
  {
    id v8 = [(BMAccessClient *)self _newConnectionForDomain:a3];

    objc_storeStrong((id *)&self->_connectionWrapper, v8);
    v7 = v8;
  }
  if (!v7)
  {
    char v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28[0] = @"Failed to get or create BMXPCConnectionWrapper";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v15 = [v16 errorWithDomain:@"BMAccessErrorDomain" code:0 userInfo:v9];
    v6[2](v6, v15);
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  id v9 = [(BMXPCConnectionWrapper *)v7 connection];
  if (!v9)
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    char v26 = @"Failed to get connection from BMXPCConnectionWrapper";
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    char v18 = [v17 errorWithDomain:@"BMAccessErrorDomain" code:0 userInfo:v15];
    v6[2](v6, v18);

    goto LABEL_10;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __70__BMAccessClient__synchronousRemoteObjectProxyForDomain_errorHandler___block_invoke;
  v20[3] = &unk_1E6022E28;
  v21 = v7;
  id v10 = v6;
  int v22 = v10;
  v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v20];
  if (!v11)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    uint64_t v24 = @"Failed to create remote object proxy";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    char v14 = [v12 errorWithDomain:@"BMAccessErrorDomain" code:0 userInfo:v13];
    v10[2](v10, v14);
  }
  v15 = v21;
LABEL_11:

  return v11;
}

- (id)_newConnectionForDomain:(unint64_t)a3
{
  if (a3 == 1) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = geteuid();
  }
  +[BMAccessConnectionFactory connectionToAccessServerInDomain:a3 user:v5 useCase:self->_useCase];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_currentProcessIsSandboxed
{
  v2 = +[BMProcess current];
  char v3 = [v2 isSandboxed];

  return v3;
}

- (BMAccessClient)init
{
  return [(BMAccessClient *)self initWithUseCase:@"__legacy__" sandboxExtensionCache:0 accessTracker:0];
}

- (BMAccessClient)initWithUseCase:(id)a3
{
  return [(BMAccessClient *)self initWithUseCase:a3 sandboxExtensionCache:0 accessTracker:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessTracker, 0);
  objc_storeStrong((id *)&self->_accessAssertionCache, 0);
  objc_storeStrong((id *)&self->_connectionWrapper, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
}

void __53__BMAccessClient_requestAccessToResource_mode_error___block_invoke_96(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *(void *)(a1[4] + 8);
  char v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v9;
  id v23 = v9;

  uint64_t v15 = *(void *)(a1[5] + 8);
  char v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v10;
  id v17 = v10;

  uint64_t v18 = *(void *)(a1[6] + 8);
  objc_super v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v11;
  id v20 = v11;

  uint64_t v21 = *(void *)(a1[7] + 8);
  int v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v12;
}

void __70__BMAccessClient__synchronousRemoteObjectProxyForDomain_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  char v3 = [v5 domain];
  if (![v3 isEqual:*MEMORY[0x1E4F281F8]])
  {

    goto LABEL_7;
  }
  if ([v5 code] == 4099)
  {
  }
  else
  {
    uint64_t v4 = [v5 code];

    if (v4 != 4097) {
      goto LABEL_7;
    }
  }
  [*(id *)(a1 + 32) invalidate];
LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __53__BMAccessClient_requestAccessToResource_mode_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __biome_log_for_category(6);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__BMAccessClient_requestAccessToResource_mode_error___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
}

- (id)requestEndpointForDomain:(unint64_t)a3 error:(id *)a4
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v11 = _os_activity_create(&dword_1B30A0000, "BMAccessClient.requestEndpointForDomain:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &state);
  unint64_t v26 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  do
  {
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __69__BMAccessClient_ConnectionProxying__requestEndpointForDomain_error___block_invoke;
    v13[3] = &unk_1E6022E50;
    v13[4] = &v14;
    uint64_t v7 = [(BMAccessClient *)self _synchronousRemoteObjectProxyForDomain:a3 errorHandler:v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__BMAccessClient_ConnectionProxying__requestEndpointForDomain_error___block_invoke_121;
    v12[3] = &unk_1E6022EA0;
    v12[4] = &v20;
    v12[5] = &v14;
    [v7 requestBiomeEndpoint:a3 == 1 reply:v12];
  }
  while ((BMShouldRetry((void *)v15[5], &v26, 2uLL, 1) & 1) != 0);
  if (a4) {
    *a4 = (id) v15[5];
  }
  id v8 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);

  return v8;
}

void __69__BMAccessClient_ConnectionProxying__requestEndpointForDomain_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __biome_log_for_category(6);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__BMAccessClient_requestAccessToResource_mode_error___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
}

void __69__BMAccessClient_ConnectionProxying__requestEndpointForDomain_error___block_invoke_121(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)removeResource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v13 = _os_activity_create(&dword_1B30A0000, "BMAccessClient.removeResource:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v13, &state);
  id v6 = v5;
  uint64_t v7 = BMServiceDomainForResource(v5);
  unint64_t v26 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  do
  {
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __50__BMAccessClient_Deletions__removeResource_error___block_invoke;
    v15[3] = &unk_1E6022E50;
    v15[4] = &v16;
    uint64_t v9 = [(BMAccessClient *)self _synchronousRemoteObjectProxyForDomain:v7 errorHandler:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__BMAccessClient_Deletions__removeResource_error___block_invoke_126;
    v14[3] = &unk_1E6022EC8;
    v14[4] = &v22;
    v14[5] = &v16;
    [v9 removeResource:v5 reply:v14];
  }
  while ((BMShouldRetry((void *)v17[5], &v26, 2uLL, 1) & 1) != 0);
  if (a4) {
    *a4 = (id) v17[5];
  }
  char v10 = *((unsigned char *)v23 + 24);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  os_activity_scope_leave(&state);

  return v10;
}

void __50__BMAccessClient_Deletions__removeResource_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __biome_log_for_category(6);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__BMAccessClient_requestAccessToResource_mode_error___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
}

void __50__BMAccessClient_Deletions__removeResource_error___block_invoke_126(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __53__BMAccessClient_requestAccessToResource_mode_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end