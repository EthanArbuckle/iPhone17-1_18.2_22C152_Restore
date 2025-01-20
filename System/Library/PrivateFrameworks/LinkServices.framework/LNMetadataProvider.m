@interface LNMetadataProvider
- (BOOL)registerBundleWithIdentifier:(id)a3 error:(id *)a4;
- (LNMetadataProvider)init;
- (LNMetadataProvider)initWithOptions:(int64_t)a3;
- (NSXPCConnection)connection;
- (id)actionForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5;
- (id)actionIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)actionsAndSystemProtocolDefaultsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)actionsConformingToSystemProtocol:(id)a3 withParametersOfTypes:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6;
- (id)actionsConformingToSystemProtocols:(id)a3 logicalType:(unint64_t)a4 bundleIdentifier:(id)a5 error:(id *)a6;
- (id)actionsForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5;
- (id)actionsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)actionsWithError:(id *)a3;
- (id)actionsWithFullyQualifiedIdentifiers:(id)a3 error:(id *)a4;
- (id)appShortcutsProviderMangledTypeNameForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)bundleRegistrationsWithError:(id *)a3;
- (id)bundlesWithError:(id *)a3;
- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)entitiesWithError:(id *)a3;
- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)enumsWithError:(id *)a3;
- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)getInterfaceWithSource:(uint64_t)a1;
- (id)getXPCProvider;
- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5;
- (id)queriesWithError:(id *)a3;
- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)registerBundleWithIdentifier:(id)a3 force:(BOOL)a4 reply:(id)a5;
- (void)resetWithReply:(id)a3;
- (void)scanBundlesWithReply:(id)a3;
- (void)unregisterBundleWithIdentifier:(id)a3 reply:(id)a4;
@end

@implementation LNMetadataProvider

- (LNMetadataProvider)init
{
  return [(LNMetadataProvider *)self initWithOptions:0];
}

- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2228;
  v28 = __Block_byref_object_dispose__2229;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2228;
  v22 = __Block_byref_object_dispose__2229;
  id v23 = 0;
  v7 = _os_activity_create(&dword_1A4419000, "appintents:fetch entities for bundle", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__LNMetadataProvider_entitiesForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E5B39018;
  v16 = &v18;
  v14[4] = self;
  id v8 = v6;
  id v15 = v8;
  v17 = &v24;
  os_activity_apply(v7, v14);

  v9 = (void *)v19[5];
  if (v9)
  {
    id v10 = v9;
  }
  else if (a4)
  {
    v12 = (void *)v25[5];
    if (v12)
    {
      *a4 = v12;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v13 = objc_claimAutoreleasedReturnValue();
      *a4 = v13;
    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v9;
}

- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2228;
  v33 = __Block_byref_object_dispose__2229;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__2228;
  v27 = __Block_byref_object_dispose__2229;
  id v28 = 0;
  id v10 = _os_activity_create(&dword_1A4419000, "appintents:fetch queries for bundle", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__LNMetadataProvider_queriesForBundleIdentifier_ofType_error___block_invoke;
  block[3] = &unk_1E5B38FC8;
  v21 = &v23;
  block[4] = self;
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  v22 = &v29;
  os_activity_apply(v10, block);

  id v13 = (void *)v24[5];
  if (v13)
  {
    id v14 = v13;
  }
  else if (a5)
  {
    v16 = (void *)v30[5];
    if (v16)
    {
      *a5 = v16;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v17 = objc_claimAutoreleasedReturnValue();
      *a5 = v17;
    }
  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v13;
}

- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2228;
  id v28 = __Block_byref_object_dispose__2229;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2228;
  v22 = __Block_byref_object_dispose__2229;
  id v23 = 0;
  v7 = _os_activity_create(&dword_1A4419000, "appintents:fetch enums for bundle", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__LNMetadataProvider_enumsForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E5B39018;
  v16 = &v18;
  v14[4] = self;
  id v8 = v6;
  id v15 = v8;
  id v17 = &v24;
  os_activity_apply(v7, v14);

  id v9 = (void *)v19[5];
  if (v9)
  {
    id v10 = v9;
  }
  else if (a4)
  {
    id v12 = (void *)v25[5];
    if (v12)
    {
      *a4 = v12;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v13 = objc_claimAutoreleasedReturnValue();
      *a4 = v13;
    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v9;
}

void __74__LNMetadataProvider_actionForBundleIdentifier_andActionIdentifier_error___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 0);
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 actionForBundleIdentifier:v3 andActionIdentifier:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[7] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __53__LNMetadataProvider_enumsForBundleIdentifier_error___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 enumsForBundleIdentifier:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __65__LNMetadataProvider_actionsWithFullyQualifiedIdentifiers_error___block_invoke(uint64_t *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], a1[8]);
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 actionsWithFullyQualifiedIdentifiers:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = getLNLogCategoryMetadata();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = a1[5];
    uint64_t v10 = *(void *)(*(void *)(a1[6] + 8) + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    _os_log_impl(&dword_1A4419000, v8, OS_LOG_TYPE_INFO, "Client requested %@, got %@", buf, 0x16u);
  }
}

void __56__LNMetadataProvider_entitiesForBundleIdentifier_error___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 entitiesForBundleIdentifier:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __62__LNMetadataProvider_queriesForBundleIdentifier_ofType_error___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 queriesForBundleIdentifier:v3 ofType:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[7] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)getInterfaceWithSource:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __45__LNMetadataProvider_getInterfaceWithSource___block_invoke;
    v18[3] = &unk_1E5B3A0B0;
    v18[4] = a1;
    uint64_t v5 = (void (**)(void))_Block_copy(v18);
    if (a2 == 1)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      if (!v7)
      {
        uint64_t v10 = [_TtC12LinkServices25_LNMetadataProviderDirect alloc];
        uint64_t v11 = *(void *)(a1 + 40);
        uint64_t v12 = *(void *)(a1 + 16);
        id v19 = 0;
        uint64_t v13 = [(_LNMetadataProviderDirect *)v10 initWithConnection:v11 options:v12 error:&v19];
        id v14 = v19;
        uint64_t v15 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v13;

        if (v14)
        {
          uint64_t v16 = getLNLogCategoryMetadata();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v21 = v14;
            _os_log_impl(&dword_1A4419000, v16, OS_LOG_TYPE_ERROR, "Request for read access failed, falling back to XPC: %@", buf, 0xCu);
          }

          -[LNMetadataProvider getXPCProvider](a1);
          id v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v17 = *(id *)(a1 + 32);
        }
        v2 = v17;

        goto LABEL_12;
      }
    }
    else
    {
      if (a2)
      {
LABEL_12:
        v5[2](v5);

        goto LABEL_13;
      }
      if (!*(void *)(a1 + 32))
      {
        -[LNMetadataProvider getXPCProvider](a1);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      uint64_t v6 = getLNLogCategoryMetadata();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4419000, v6, OS_LOG_TYPE_INFO, "XPC provider requested, but there is already direct provider available", buf, 2u);
      }

      uint64_t v7 = *(void **)(a1 + 32);
    }
    id v8 = v7;
LABEL_11:
    v2 = v8;
    goto LABEL_12;
  }
  v2 = 0;
LABEL_13:
  return v2;
}

void __45__LNMetadataProvider_getInterfaceWithSource___block_invoke(uint64_t a1)
{
}

- (id)getXPCProvider
{
  v1 = *(void **)(a1 + 24);
  if (!v1)
  {
    uint64_t v3 = [[_LNMetadataProviderXPC alloc] initWithConnection:*(void *)(a1 + 40)];
    uint64_t v4 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v3;

    v1 = *(void **)(a1 + 24);
  }
  id v5 = v1;
  return v5;
}

- (id)actionsWithFullyQualifiedIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__2228;
  v30 = __Block_byref_object_dispose__2229;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__2228;
  uint64_t v24 = __Block_byref_object_dispose__2229;
  id v25 = 0;
  BOOL v7 = [v6 count] != 1;
  id v8 = _os_activity_create(&dword_1A4419000, "appintents:fetch fully qualified actions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__LNMetadataProvider_actionsWithFullyQualifiedIdentifiers_error___block_invoke;
  block[3] = &unk_1E5B38978;
  id v17 = &v20;
  block[4] = self;
  BOOL v19 = v7;
  id v9 = v6;
  id v16 = v9;
  uint64_t v18 = &v26;
  os_activity_apply(v8, block);

  uint64_t v10 = (void *)v21[5];
  if (v10)
  {
    id v11 = v10;
  }
  else if (a4)
  {
    uint64_t v13 = (void *)v27[5];
    if (v13)
    {
      *a4 = v13;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v14 = objc_claimAutoreleasedReturnValue();
      *a4 = v14;
    }
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v10;
}

- (LNMetadataProvider)initWithOptions:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)LNMetadataProvider;
  uint64_t v4 = [(LNMetadataProvider *)&v11 init];
  id v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_options = a3;
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.linkd.registry" options:0];
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v6;

    id v8 = LNDaemonRegistryXPCInterface();
    [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v8];

    [(NSXPCConnection *)v5->_connection resume];
    id v9 = v5;
  }

  return v5;
}

- (id)actionForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2228;
  id v34 = __Block_byref_object_dispose__2229;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2228;
  uint64_t v28 = __Block_byref_object_dispose__2229;
  id v29 = 0;
  uint64_t v10 = _os_activity_create(&dword_1A4419000, "appintents:fetch action for bundle", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__LNMetadataProvider_actionForBundleIdentifier_andActionIdentifier_error___block_invoke;
  block[3] = &unk_1E5B38FC8;
  uint64_t v22 = &v24;
  block[4] = self;
  id v11 = v8;
  id v20 = v11;
  id v12 = v9;
  id v21 = v12;
  id v23 = &v30;
  os_activity_apply(v10, block);

  uint64_t v13 = (void *)v25[5];
  if (v13)
  {
    id v14 = v13;
  }
  else
  {
    if (!v31[5])
    {
      id v16 = getLNLogCategoryMetadata();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v37 = v11;
        __int16 v38 = 2114;
        id v39 = v12;
        _os_log_impl(&dword_1A4419000, v16, OS_LOG_TYPE_DEFAULT, "Metadata not found for %{public}@:%{public}@", buf, 0x16u);
      }
    }
    if (a5)
    {
      id v17 = (void *)v31[5];
      if (v17)
      {
        *a5 = v17;
      }
      else
      {
        NSErrorFromMetadataProviderError(9004);
        id v18 = objc_claimAutoreleasedReturnValue();
        *a5 = v18;
      }
    }
  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_directProvider, 0);
  objc_storeStrong((id *)&self->_xpcProvider, 0);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2228;
  uint64_t v28 = __Block_byref_object_dispose__2229;
  id v29 = 0;
  uint64_t v18 = 0;
  BOOL v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__2228;
  uint64_t v22 = __Block_byref_object_dispose__2229;
  id v23 = 0;
  BOOL v7 = _os_activity_create(&dword_1A4419000, "appintents:fetch example phrases for bundle", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__LNMetadataProvider_examplePhrasesForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E5B39018;
  id v16 = &v18;
  v14[4] = self;
  id v8 = v6;
  id v15 = v8;
  id v17 = &v24;
  os_activity_apply(v7, v14);

  id v9 = (void *)v19[5];
  if (v9)
  {
    id v10 = v9;
  }
  else if (a4)
  {
    id v12 = (void *)v25[5];
    if (v12)
    {
      *a4 = v12;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v13 = objc_claimAutoreleasedReturnValue();
      *a4 = v13;
    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v9;
}

void __62__LNMetadataProvider_examplePhrasesForBundleIdentifier_error___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 examplePhrasesForBundleIdentifier:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)unregisterBundleWithIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A4419000, "appintents:unregister bundle", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__LNMetadataProvider_unregisterBundleWithIdentifier_reply___block_invoke;
  block[3] = &unk_1E5B3A318;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  os_activity_apply(v8, block);
}

void __59__LNMetadataProvider_unregisterBundleWithIdentifier_reply___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__LNMetadataProvider_unregisterBundleWithIdentifier_reply___block_invoke_2;
  v4[3] = &unk_1E5B3A550;
  id v5 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 unregisterBundleWithIdentifier:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

uint64_t __59__LNMetadataProvider_unregisterBundleWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)scanBundlesWithReply:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A4419000, "appintents:scan bundles", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__LNMetadataProvider_scanBundlesWithReply___block_invoke;
  v7[3] = &unk_1E5B395F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

void __43__LNMetadataProvider_scanBundlesWithReply___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__LNMetadataProvider_scanBundlesWithReply___block_invoke_2;
  v4[3] = &unk_1E5B3A550;
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 scanBundlesWithReply:*(void *)(a1 + 40)];
}

uint64_t __43__LNMetadataProvider_scanBundlesWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetWithReply:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A4419000, "appintents:reset metadata", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__LNMetadataProvider_resetWithReply___block_invoke;
  v7[3] = &unk_1E5B395F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

void __37__LNMetadataProvider_resetWithReply___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__LNMetadataProvider_resetWithReply___block_invoke_2;
  v4[3] = &unk_1E5B3A550;
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 resetWithReply:*(void *)(a1 + 40)];
}

uint64_t __37__LNMetadataProvider_resetWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerBundleWithIdentifier:(id)a3 force:(BOOL)a4 reply:(id)a5
{
  id v9 = 0;
  id v7 = (void (**)(id, id))a5;
  [(LNMetadataProvider *)self registerBundleWithIdentifier:a3 error:&v9];
  id v8 = v9;
  v7[2](v7, v8);
}

- (BOOL)registerBundleWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__2228;
  id v17 = __Block_byref_object_dispose__2229;
  id v18 = 0;
  id v7 = _os_activity_create(&dword_1A4419000, "appintents:register bundle", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__LNMetadataProvider_registerBundleWithIdentifier_error___block_invoke;
  block[3] = &unk_1E5B398B8;
  block[4] = self;
  id v11 = v6;
  id v12 = &v13;
  id v8 = v6;
  os_activity_apply(v7, block);

  *a4 = (id) v14[5];
  LOBYTE(a4) = v14[5] == 0;
  _Block_object_dispose(&v13, 8);

  return (char)a4;
}

void __57__LNMetadataProvider_registerBundleWithIdentifier_error___block_invoke(void *a1)
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2228;
  id v11 = __Block_byref_object_dispose__2229;
  id v12 = 0;
  v2 = *(void **)(a1[4] + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__LNMetadataProvider_registerBundleWithIdentifier_error___block_invoke_2;
  v6[3] = &unk_1E5B3A3E8;
  v6[4] = &v7;
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v6];
  uint64_t v4 = a1[5];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__LNMetadataProvider_registerBundleWithIdentifier_error___block_invoke_3;
  v5[3] = &unk_1E5B3A3E8;
  v5[4] = &v7;
  [v3 registerBundleWithIdentifier:v4 force:1 reply:v5];

  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), (id)v8[5]);
  _Block_object_dispose(&v7, 8);
}

void __57__LNMetadataProvider_registerBundleWithIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
}

void __57__LNMetadataProvider_registerBundleWithIdentifier_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)appShortcutsProviderMangledTypeNameForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__2228;
  uint64_t v26 = __Block_byref_object_dispose__2229;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  BOOL v19 = __Block_byref_object_copy__2228;
  uint64_t v20 = __Block_byref_object_dispose__2229;
  id v21 = 0;
  uint64_t v7 = _os_activity_create(&dword_1A4419000, "appintents:fetch app shortcuts provider mangled type name", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__LNMetadataProvider_appShortcutsProviderMangledTypeNameForBundleIdentifier_error___block_invoke;
  v12[3] = &unk_1E5B39018;
  id v14 = &v16;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  uint64_t v15 = &v22;
  os_activity_apply(v7, v12);

  if (a4)
  {
    uint64_t v9 = (void *)v23[5];
    if (v9) {
      *a4 = v9;
    }
  }
  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v10;
}

void __83__LNMetadataProvider_appShortcutsProviderMangledTypeNameForBundleIdentifier_error___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 appShortcutsProviderMangledTypeNameForBundleIdentifier:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__2228;
  uint64_t v24 = __Block_byref_object_dispose__2229;
  id v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v7 = _os_activity_create(&dword_1A4419000, "appintents:fetch metadata version", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__LNMetadataProvider_metadataVersionForBundleIdentifier_error___block_invoke;
  v12[3] = &unk_1E5B39018;
  id v14 = &v16;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  uint64_t v15 = &v20;
  os_activity_apply(v7, v12);

  if (a4)
  {
    uint64_t v9 = (void *)v21[5];
    if (v9) {
      *a4 = v9;
    }
  }
  int64_t v10 = v17[3];
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __63__LNMetadataProvider_metadataVersionForBundleIdentifier_error___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 0);
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 metadataVersionForBundleIdentifier:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(void *)(*(void *)(a1[6] + 8) + 24) = v5;
}

- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__2228;
  uint64_t v28 = __Block_byref_object_dispose__2229;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__2228;
  uint64_t v22 = __Block_byref_object_dispose__2229;
  id v23 = 0;
  uint64_t v7 = _os_activity_create(&dword_1A4419000, "appintents:fetch action identifiers for bundle", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__LNMetadataProvider_entityIdentifiersForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E5B39018;
  uint64_t v16 = &v18;
  v14[4] = self;
  id v8 = v6;
  id v15 = v8;
  id v17 = &v24;
  os_activity_apply(v7, v14);

  uint64_t v9 = (void *)v19[5];
  if (v9)
  {
    id v10 = v9;
  }
  else if (a4)
  {
    id v12 = (void *)v25[5];
    if (v12)
    {
      *a4 = v12;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v13 = objc_claimAutoreleasedReturnValue();
      *a4 = v13;
    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v9;
}

void __65__LNMetadataProvider_entityIdentifiersForBundleIdentifier_error___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 entityIdentifiersForBundleIdentifier:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)entitiesWithError:(id *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__2228;
  uint64_t v22 = __Block_byref_object_dispose__2229;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2228;
  uint64_t v16 = __Block_byref_object_dispose__2229;
  id v17 = 0;
  uint64_t v5 = _os_activity_create(&dword_1A4419000, "appintents:fetch entites", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__LNMetadataProvider_entitiesWithError___block_invoke;
  block[3] = &unk_1E5B38900;
  block[4] = self;
  void block[5] = &v12;
  block[6] = &v18;
  os_activity_apply(v5, block);

  uint64_t v6 = (void *)v13[5];
  if (v6)
  {
    id v7 = v6;
  }
  else if (a3)
  {
    uint64_t v9 = (void *)v19[5];
    if (v9)
    {
      *a3 = v9;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v10 = objc_claimAutoreleasedReturnValue();
      *a3 = v10;
    }
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v6;
}

void __40__LNMetadataProvider_entitiesWithError___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 entitiesWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)enumsWithError:(id *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__2228;
  uint64_t v22 = __Block_byref_object_dispose__2229;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2228;
  uint64_t v16 = __Block_byref_object_dispose__2229;
  id v17 = 0;
  uint64_t v5 = _os_activity_create(&dword_1A4419000, "appintents:fetch enums", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__LNMetadataProvider_enumsWithError___block_invoke;
  block[3] = &unk_1E5B38900;
  block[4] = self;
  void block[5] = &v12;
  block[6] = &v18;
  os_activity_apply(v5, block);

  uint64_t v6 = (void *)v13[5];
  if (v6)
  {
    id v7 = v6;
  }
  else if (a3)
  {
    uint64_t v9 = (void *)v19[5];
    if (v9)
    {
      *a3 = v9;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v10 = objc_claimAutoreleasedReturnValue();
      *a3 = v10;
    }
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v6;
}

void __37__LNMetadataProvider_enumsWithError___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 enumsWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)queriesWithError:(id *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__2228;
  uint64_t v22 = __Block_byref_object_dispose__2229;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2228;
  uint64_t v16 = __Block_byref_object_dispose__2229;
  id v17 = 0;
  uint64_t v5 = _os_activity_create(&dword_1A4419000, "appintents:fetch queries", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__LNMetadataProvider_queriesWithError___block_invoke;
  block[3] = &unk_1E5B38900;
  block[4] = self;
  void block[5] = &v12;
  block[6] = &v18;
  os_activity_apply(v5, block);

  uint64_t v6 = (void *)v13[5];
  if (v6)
  {
    id v7 = v6;
  }
  else if (a3)
  {
    uint64_t v9 = (void *)v19[5];
    if (v9)
    {
      *a3 = v9;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v10 = objc_claimAutoreleasedReturnValue();
      *a3 = v10;
    }
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v6;
}

void __39__LNMetadataProvider_queriesWithError___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 queriesWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)bundleRegistrationsWithError:(id *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__2228;
  uint64_t v22 = __Block_byref_object_dispose__2229;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2228;
  uint64_t v16 = __Block_byref_object_dispose__2229;
  id v17 = 0;
  uint64_t v5 = _os_activity_create(&dword_1A4419000, "appintents:fetch bundle registrations", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__LNMetadataProvider_bundleRegistrationsWithError___block_invoke;
  block[3] = &unk_1E5B38900;
  block[4] = self;
  void block[5] = &v12;
  block[6] = &v18;
  os_activity_apply(v5, block);

  uint64_t v6 = (void *)v13[5];
  if (v6)
  {
    id v7 = v6;
  }
  else if (a3)
  {
    uint64_t v9 = (void *)v19[5];
    if (v9)
    {
      *a3 = v9;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v10 = objc_claimAutoreleasedReturnValue();
      *a3 = v10;
    }
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v6;
}

void __51__LNMetadataProvider_bundleRegistrationsWithError___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 0);
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 bundleRegistrationsWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)bundlesWithError:(id *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__2228;
  uint64_t v22 = __Block_byref_object_dispose__2229;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2228;
  uint64_t v16 = __Block_byref_object_dispose__2229;
  id v17 = 0;
  uint64_t v5 = _os_activity_create(&dword_1A4419000, "appintents:fetch bundles", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__LNMetadataProvider_bundlesWithError___block_invoke;
  block[3] = &unk_1E5B38900;
  block[4] = self;
  void block[5] = &v12;
  block[6] = &v18;
  os_activity_apply(v5, block);

  uint64_t v6 = (void *)v13[5];
  if (v6)
  {
    id v7 = v6;
  }
  else if (a3)
  {
    uint64_t v9 = (void *)v19[5];
    if (v9)
    {
      *a3 = v9;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v10 = objc_claimAutoreleasedReturnValue();
      *a3 = v10;
    }
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v6;
}

void __39__LNMetadataProvider_bundlesWithError___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 bundlesWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)actionsForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2228;
  id v34 = __Block_byref_object_dispose__2229;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__2228;
  uint64_t v28 = __Block_byref_object_dispose__2229;
  id v29 = 0;
  id v10 = _os_activity_create(&dword_1A4419000, "appintents:fetch actions for bundle and action", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__LNMetadataProvider_actionsForBundleIdentifier_andActionIdentifier_error___block_invoke;
  block[3] = &unk_1E5B38FC8;
  uint64_t v22 = &v24;
  block[4] = self;
  id v11 = v8;
  id v20 = v11;
  id v12 = v9;
  id v21 = v12;
  id v23 = &v30;
  os_activity_apply(v10, block);

  id v13 = (void *)v25[5];
  if (v13)
  {
    if (![v13 count])
    {
      uint64_t v14 = getLNLogCategoryMetadata();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v37 = v11;
        __int16 v38 = 2114;
        id v39 = v12;
        _os_log_impl(&dword_1A4419000, v14, OS_LOG_TYPE_DEFAULT, "Metadata not found for %{public}@:%{public}@", buf, 0x16u);
      }
    }
    id v15 = (id)v25[5];
  }
  else
  {
    if (a5)
    {
      uint64_t v16 = (void *)v31[5];
      if (v16)
      {
        id v15 = 0;
        *a5 = v16;
        goto LABEL_12;
      }
      NSErrorFromMetadataProviderError(9004);
      id v17 = objc_claimAutoreleasedReturnValue();
      *a5 = v17;
    }
    id v15 = 0;
  }
LABEL_12:
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v15;
}

void __75__LNMetadataProvider_actionsForBundleIdentifier_andActionIdentifier_error___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 0);
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 actionsForBundleIdentifier:v3 andActionIdentifier:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[7] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)actionIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__2228;
  uint64_t v28 = __Block_byref_object_dispose__2229;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__2228;
  uint64_t v22 = __Block_byref_object_dispose__2229;
  id v23 = 0;
  uint64_t v7 = _os_activity_create(&dword_1A4419000, "appintents:fetch action identifiers for bundle", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__LNMetadataProvider_actionIdentifiersForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E5B39018;
  uint64_t v16 = &v18;
  v14[4] = self;
  id v8 = v6;
  id v15 = v8;
  id v17 = &v24;
  os_activity_apply(v7, v14);

  id v9 = (void *)v19[5];
  if (v9)
  {
    id v10 = v9;
  }
  else if (a4)
  {
    id v12 = (void *)v25[5];
    if (v12)
    {
      *a4 = v12;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v13 = objc_claimAutoreleasedReturnValue();
      *a4 = v13;
    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v9;
}

void __65__LNMetadataProvider_actionIdentifiersForBundleIdentifier_error___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 actionIdentifiersForBundleIdentifier:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)actionsForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__2228;
  uint64_t v28 = __Block_byref_object_dispose__2229;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__2228;
  uint64_t v22 = __Block_byref_object_dispose__2229;
  id v23 = 0;
  uint64_t v7 = _os_activity_create(&dword_1A4419000, "appintents:fetch actions for bundle", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__LNMetadataProvider_actionsForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E5B39018;
  uint64_t v16 = &v18;
  v14[4] = self;
  id v8 = v6;
  id v15 = v8;
  id v17 = &v24;
  os_activity_apply(v7, v14);

  id v9 = (void *)v19[5];
  if (v9)
  {
    id v10 = v9;
  }
  else if (a4)
  {
    id v12 = (void *)v25[5];
    if (v12)
    {
      *a4 = v12;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v13 = objc_claimAutoreleasedReturnValue();
      *a4 = v13;
    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v9;
}

void __55__LNMetadataProvider_actionsForBundleIdentifier_error___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 actionsForBundleIdentifier:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)actionsConformingToSystemProtocol:(id)a3 withParametersOfTypes:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__2228;
  __int16 v38 = __Block_byref_object_dispose__2229;
  id v39 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__2228;
  uint64_t v32 = __Block_byref_object_dispose__2229;
  id v33 = 0;
  id v13 = _os_activity_create(&dword_1A4419000, "appintents:fetch actions by protocol and parameters", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __101__LNMetadataProvider_actionsConformingToSystemProtocol_withParametersOfTypes_bundleIdentifier_error___block_invoke;
  v22[3] = &unk_1E5B38950;
  uint64_t v26 = &v28;
  v22[4] = self;
  id v14 = v10;
  id v23 = v14;
  id v15 = v11;
  id v24 = v15;
  id v16 = v12;
  id v25 = v16;
  id v27 = &v34;
  os_activity_apply(v13, v22);

  id v17 = (void *)v29[5];
  if (v17)
  {
    id v18 = v17;
  }
  else if (a6)
  {
    uint64_t v20 = (void *)v35[5];
    if (v20)
    {
      *a6 = v20;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v21 = objc_claimAutoreleasedReturnValue();
      *a6 = v21;
    }
  }
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v17;
}

void __101__LNMetadataProvider_actionsConformingToSystemProtocol_withParametersOfTypes_bundleIdentifier_error___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v2 actionsConformingToSystemProtocol:v3 withParametersOfTypes:v4 bundleIdentifier:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(a1[8] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)actionsAndSystemProtocolDefaultsForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__2228;
  uint64_t v28 = __Block_byref_object_dispose__2229;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__2228;
  uint64_t v22 = __Block_byref_object_dispose__2229;
  id v23 = 0;
  uint64_t v7 = _os_activity_create(&dword_1A4419000, "appintents:fetch actions defaults", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__LNMetadataProvider_actionsAndSystemProtocolDefaultsForBundleIdentifier_error___block_invoke;
  v14[3] = &unk_1E5B39018;
  id v16 = &v18;
  v14[4] = self;
  id v8 = v6;
  id v15 = v8;
  id v17 = &v24;
  os_activity_apply(v7, v14);

  id v9 = (void *)v19[5];
  if (v9)
  {
    id v10 = v9;
  }
  else if (a4)
  {
    id v12 = (void *)v25[5];
    if (v12)
    {
      *a4 = v12;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v13 = objc_claimAutoreleasedReturnValue();
      *a4 = v13;
    }
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v9;
}

void __80__LNMetadataProvider_actionsAndSystemProtocolDefaultsForBundleIdentifier_error___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 actionsAndSystemProtocolDefaultsForBundleIdentifier:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)actionsConformingToSystemProtocols:(id)a3 logicalType:(unint64_t)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__2228;
  uint64_t v36 = __Block_byref_object_dispose__2229;
  id v37 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__2228;
  uint64_t v30 = __Block_byref_object_dispose__2229;
  id v31 = 0;
  id v12 = _os_activity_create(&dword_1A4419000, "appintents:fetch actions by protocol", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __92__LNMetadataProvider_actionsConformingToSystemProtocols_logicalType_bundleIdentifier_error___block_invoke;
  v20[3] = &unk_1E5B38928;
  id v23 = &v26;
  v20[4] = self;
  id v13 = v10;
  id v21 = v13;
  unint64_t v25 = a4;
  id v14 = v11;
  id v22 = v14;
  uint64_t v24 = &v32;
  os_activity_apply(v12, v20);

  id v15 = (void *)v27[5];
  if (v15)
  {
    id v16 = v15;
  }
  else if (a6)
  {
    uint64_t v18 = (void *)v33[5];
    if (v18)
    {
      *a6 = v18;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v19 = objc_claimAutoreleasedReturnValue();
      *a6 = v19;
    }
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v15;
}

void __92__LNMetadataProvider_actionsConformingToSystemProtocols_logicalType_bundleIdentifier_error___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[9];
  uint64_t v6 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v2 actionsConformingToSystemProtocols:v3 logicalType:v5 bundleIdentifier:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(a1[7] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)actionsWithError:(id *)a3
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__2228;
  id v22 = __Block_byref_object_dispose__2229;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2228;
  id v16 = __Block_byref_object_dispose__2229;
  id v17 = 0;
  uint64_t v5 = _os_activity_create(&dword_1A4419000, "appintents:fetch actions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__LNMetadataProvider_actionsWithError___block_invoke;
  block[3] = &unk_1E5B38900;
  block[4] = self;
  void block[5] = &v18;
  block[6] = &v12;
  os_activity_apply(v5, block);

  uint64_t v6 = (void *)v19[5];
  if (v6)
  {
    id v7 = v6;
  }
  else if (a3)
  {
    id v9 = (void *)v13[5];
    if (v9)
    {
      *a3 = v9;
    }
    else
    {
      NSErrorFromMetadataProviderError(9004);
      id v10 = objc_claimAutoreleasedReturnValue();
      *a3 = v10;
    }
  }
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v6;
}

void __39__LNMetadataProvider_actionsWithError___block_invoke(uint64_t *a1)
{
  v2 = -[LNMetadataProvider getInterfaceWithSource:](a1[4], 1);
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 actionsWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)LNMetadataProvider;
  [(LNMetadataProvider *)&v3 dealloc];
}

@end