@interface LNAutoShortcutsProvider
+ (id)sharedInstance;
- (LNAutoShortcutsProvider)init;
- (LNAutoShortcutsProvider)initWithOptions:(int64_t)a3;
- (id)autoShortcutsForApplicationRecord:(id)a3 localeIdentifier:(id)a4;
- (id)autoShortcutsForLocaleIdentifier:(id)a3 error:(id *)a4;
- (id)propertiesForIdentifiers:(id)a3 error:(id *)a4;
- (void)autoShortcutsForBundleIdentifier:(id)a3 localeIdentifier:(id)a4 completion:(id)a5;
- (void)autoShortcutsForLocaleIdentifier:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)retrieveActionForBundleIdentifier:(id)a3 appShortcutIdentifier:(id)a4 parameterIdentifier:(id)a5 completion:(id)a6;
- (void)retrieveActionForBundleIdentifier:(id)a3 basePhraseTemplate:(id)a4 actionIdentifier:(id)a5 parameterIdentifier:(id)a6 completion:(id)a7;
- (void)retrieveActionForLocalizedPhrase:(id)a3 completion:(id)a4;
@end

@implementation LNAutoShortcutsProvider

- (LNAutoShortcutsProvider)initWithOptions:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)LNAutoShortcutsProvider;
  v4 = [(LNAutoShortcutsProvider *)&v20 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.linkd.registry" options:0];
    connection = v4->_connection;
    v4->_connection = (NSXPCConnection *)v5;

    v7 = LNDaemonRegistryXPCInterface();
    [(NSXPCConnection *)v4->_connection setRemoteObjectInterface:v7];

    [(NSXPCConnection *)v4->_connection resume];
    if ((a3 & 1) == 0)
    {
      v8 = getLNLogCategoryMetadata();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4419000, v8, OS_LOG_TYPE_INFO, "Reading directly from link metadata", buf, 2u);
      }

      v9 = [_TtC12LinkServices25_LNMetadataProviderDirect alloc];
      v10 = v4->_connection;
      id v19 = 0;
      uint64_t v11 = [(_LNMetadataProviderDirect *)v9 initWithConnection:v10 options:a3 error:&v19];
      id v12 = v19;
      directAccess = v4->_directAccess;
      v4->_directAccess = (LNAutoShortcutsProviderInterface *)v11;

      if (!v4->_directAccess)
      {
        v14 = getLNLogCategoryMetadata();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v12;
          _os_log_impl(&dword_1A4419000, v14, OS_LOG_TYPE_ERROR, "Request for read access failed %@", buf, 0xCu);
        }
      }
    }
    v15 = [[_LNAutoShortcutsProviderXPC alloc] initWithConnection:v4->_connection];
    xpcAccess = v4->_xpcAccess;
    v4->_xpcAccess = (LNAutoShortcutsProviderInterface *)v15;

    v17 = v4;
  }

  return v4;
}

- (id)propertiesForIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__5018;
    v32 = __Block_byref_object_dispose__5019;
    id v33 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__5018;
    v26 = __Block_byref_object_dispose__5019;
    id v27 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__LNAutoShortcutsProvider_propertiesForIdentifiers_error___block_invoke;
    aBlock[3] = &unk_1E5B39018;
    objc_super v20 = &v22;
    aBlock[4] = self;
    id v7 = v6;
    id v19 = v7;
    v21 = &v28;
    v8 = _Block_copy(aBlock);
    v9 = _os_activity_create(&dword_1A4419000, "appintents:fetch properties", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__LNAutoShortcutsProvider_propertiesForIdentifiers_error___block_invoke_2;
    block[3] = &unk_1E5B39040;
    block[4] = self;
    v16 = &v22;
    v17 = &v28;
    id v14 = v7;
    v15 = v8;
    os_activity_apply(v9, block);

    v10 = (void *)v23[5];
    if (v10)
    {
      id v11 = v10;
    }
    else if (a4)
    {
      *a4 = (id) v29[5];
    }

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __66__LNAutoShortcutsProvider_autoShortcutsForLocaleIdentifier_error___block_invoke_2(void *a1)
{
  v2 = *(void **)(a1[4] + 16);
  if (v2)
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = *(void *)(a1[8] + 8);
    id obj = *(id *)(v4 + 40);
    uint64_t v5 = [v2 autoShortcutsForLocaleIdentifier:v3 error:&obj];
    objc_storeStrong((id *)(v4 + 40), obj);
    uint64_t v6 = *(void *)(a1[7] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (!*(void *)(*(void *)(a1[7] + 8) + 40)) {
      (*(void (**)(void))(a1[6] + 16))();
    }
  }
  else
  {
    v8 = *(void (**)(void))(a1[6] + 16);
    v8();
  }
}

- (id)autoShortcutsForLocaleIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__5018;
  id v33 = __Block_byref_object_dispose__5019;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5018;
  id v27 = __Block_byref_object_dispose__5019;
  id v28 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__LNAutoShortcutsProvider_autoShortcutsForLocaleIdentifier_error___block_invoke;
  aBlock[3] = &unk_1E5B39018;
  v21 = &v23;
  aBlock[4] = self;
  id v7 = v6;
  id v20 = v7;
  uint64_t v22 = &v29;
  v8 = _Block_copy(aBlock);
  v9 = _os_activity_create(&dword_1A4419000, "appintents:fetch all app shortcuts", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__LNAutoShortcutsProvider_autoShortcutsForLocaleIdentifier_error___block_invoke_2;
  block[3] = &unk_1E5B39040;
  block[4] = self;
  v17 = &v23;
  id v10 = v7;
  v18 = &v29;
  id v15 = v10;
  v16 = v8;
  os_activity_apply(v9, block);

  id v11 = (void *)v24[5];
  if (v11)
  {
    id v12 = v11;
  }
  else if (a4)
  {
    *a4 = (id) v30[5];
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcAccess, 0);
  objc_storeStrong((id *)&self->_directAccess, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __58__LNAutoShortcutsProvider_propertiesForIdentifiers_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 24);
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 propertiesForIdentifiers:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __58__LNAutoShortcutsProvider_propertiesForIdentifiers_error___block_invoke_2(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 16);
  if (v2)
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = *(void *)(a1[8] + 8);
    id obj = *(id *)(v4 + 40);
    uint64_t v5 = [v2 propertiesForIdentifiers:v3 error:&obj];
    objc_storeStrong((id *)(v4 + 40), obj);
    uint64_t v6 = *(void *)(a1[7] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (!*(void *)(*(void *)(a1[7] + 8) + 40)) {
      (*(void (**)(void))(a1[6] + 16))();
    }
  }
  else
  {
    v8 = *(void (**)(void))(a1[6] + 16);
    v8();
  }
}

void __66__LNAutoShortcutsProvider_autoShortcutsForLocaleIdentifier_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 24);
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 autoShortcutsForLocaleIdentifier:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)autoShortcutsForLocaleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_1A4419000, "appintents:fetch all app shortcuts", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__LNAutoShortcutsProvider_autoShortcutsForLocaleIdentifier_completion___block_invoke;
  block[3] = &unk_1E5B3A318;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  os_activity_apply(v8, block);
}

void __71__LNAutoShortcutsProvider_autoShortcutsForLocaleIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__LNAutoShortcutsProvider_autoShortcutsForLocaleIdentifier_completion___block_invoke_2;
    v8[3] = &unk_1E5B38FF0;
    v8[4] = v2;
    id v9 = v4;
    id v10 = *(id *)(a1 + 48);
    [v3 autoShortcutsForLocaleIdentifier:v9 completion:v8];
  }
  else
  {
    uint64_t v5 = *(void **)(v2 + 24);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    [v5 autoShortcutsForLocaleIdentifier:v6 completion:v7];
  }
}

uint64_t __71__LNAutoShortcutsProvider_autoShortcutsForLocaleIdentifier_completion___block_invoke_2(void *a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  else {
    return [*(id *)(a1[4] + 24) autoShortcutsForLocaleIdentifier:a1[5] completion:a1[6]];
  }
}

- (id)autoShortcutsForApplicationRecord:(id)a3 localeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__5018;
  v26[4] = __Block_byref_object_dispose__5019;
  id v27 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__5018;
  uint64_t v24 = __Block_byref_object_dispose__5019;
  id v25 = 0;
  v8 = _os_activity_create(&dword_1A4419000, "appintents:fetch app shortcuts", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__LNAutoShortcutsProvider_autoShortcutsForApplicationRecord_localeIdentifier___block_invoke;
  block[3] = &unk_1E5B38FC8;
  id v15 = v6;
  v16 = self;
  id v17 = v7;
  v18 = v26;
  id v19 = &v20;
  id v9 = v7;
  id v10 = v6;
  os_activity_apply(v8, block);

  id v11 = (void *)v21[5];
  if (!v11) {
    id v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v12 = v11;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(v26, 8);
  return v12;
}

void __78__LNAutoShortcutsProvider_autoShortcutsForApplicationRecord_localeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 16);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78__LNAutoShortcutsProvider_autoShortcutsForApplicationRecord_localeIdentifier___block_invoke_2;
    v13[3] = &unk_1E5B38FA0;
    long long v14 = *(_OWORD *)(a1 + 56);
    [v3 autoShortcutsForBundleIdentifier:v2 localeIdentifier:v4 completion:v13];
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 8);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__LNAutoShortcutsProvider_autoShortcutsForApplicationRecord_localeIdentifier___block_invoke_3;
    v12[3] = &unk_1E5B3A3E8;
    v12[4] = *(void *)(a1 + 56);
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];
    uint64_t v7 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__LNAutoShortcutsProvider_autoShortcutsForApplicationRecord_localeIdentifier___block_invoke_4;
    v10[3] = &unk_1E5B38FA0;
    int8x16_t v11 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
    [v6 autoShortcutsForBundleIdentifier:v2 localeIdentifier:v7 completionHandler:v10];

    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      v8 = getLNLogCategoryGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v9;
        _os_log_impl(&dword_1A4419000, v8, OS_LOG_TYPE_ERROR, "Failed to retrieve app shortucts with error, returning empty array: %@", buf, 0xCu);
      }
    }
  }
}

void __78__LNAutoShortcutsProvider_autoShortcutsForApplicationRecord_localeIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __78__LNAutoShortcutsProvider_autoShortcutsForApplicationRecord_localeIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
}

void __78__LNAutoShortcutsProvider_autoShortcutsForApplicationRecord_localeIdentifier___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)retrieveActionForBundleIdentifier:(id)a3 appShortcutIdentifier:(id)a4 parameterIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v34 = v10;
    __int16 v35 = 2112;
    id v36 = v11;
    __int16 v37 = 2112;
    id v38 = v12;
    _os_log_impl(&dword_1A4419000, v14, OS_LOG_TYPE_DEBUG, "Fetching action for bundleIdentifier: %@ appShortcutIdentifier: %@ parameterIdentifier: %@", buf, 0x20u);
  }

  connection = self->_connection;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __114__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_appShortcutIdentifier_parameterIdentifier_completion___block_invoke;
  v31[3] = &unk_1E5B3A550;
  id v16 = v13;
  id v32 = v16;
  uint64_t v17 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v31];
  v18 = _os_activity_create(&dword_1A4419000, "appintents:retrieve action for appshortcut identifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_appShortcutIdentifier_parameterIdentifier_completion___block_invoke_27;
  block[3] = &unk_1E5B39540;
  id v25 = v17;
  id v26 = v10;
  id v27 = v11;
  id v28 = v12;
  uint64_t v29 = self;
  id v30 = v16;
  id v19 = v16;
  id v20 = v12;
  id v21 = v11;
  id v22 = v10;
  id v23 = v17;
  os_activity_apply(v18, block);
}

void __114__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_appShortcutIdentifier_parameterIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_ERROR, "Got an error from XPCConnection to DaemonRegistryService: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __114__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_appShortcutIdentifier_parameterIdentifier_completion___block_invoke_27(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __114__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_appShortcutIdentifier_parameterIdentifier_completion___block_invoke_2;
  v6[3] = &unk_1E5B38F78;
  int v5 = (void *)a1[9];
  v6[4] = a1[8];
  id v7 = v5;
  [v1 actionForBundleIdentifier:v2 appShortcutIdentifier:v3 parameterIdentifier:v4 completionHandler:v6];
}

uint64_t __114__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_appShortcutIdentifier_parameterIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)retrieveActionForBundleIdentifier:(id)a3 basePhraseTemplate:(id)a4 actionIdentifier:(id)a5 parameterIdentifier:(id)a6 completion:(id)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v39 = v12;
    __int16 v40 = 2112;
    id v41 = v13;
    __int16 v42 = 2112;
    id v43 = v14;
    __int16 v44 = 2112;
    id v45 = v15;
  }

  connection = self->_connection;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __128__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_basePhraseTemplate_actionIdentifier_parameterIdentifier_completion___block_invoke;
  v36[3] = &unk_1E5B3A550;
  id v19 = v16;
  id v37 = v19;
  id v20 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v36];
  id v21 = _os_activity_create(&dword_1A4419000, "appintents:retrieve action for actionId, parameterId", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __128__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_basePhraseTemplate_actionIdentifier_parameterIdentifier_completion___block_invoke_26;
  v28[3] = &unk_1E5B38F50;
  id v29 = v20;
  id v30 = v12;
  id v31 = v13;
  id v32 = v14;
  id v34 = self;
  id v35 = v19;
  id v33 = v15;
  id v22 = v19;
  id v23 = v15;
  id v24 = v14;
  id v25 = v13;
  id v26 = v12;
  id v27 = v20;
  os_activity_apply(v21, v28);
}

void __128__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_basePhraseTemplate_actionIdentifier_parameterIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_ERROR, "Got an error from XPCConnection to DaemonRegistryService: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __128__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_basePhraseTemplate_actionIdentifier_parameterIdentifier_completion___block_invoke_26(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __128__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_basePhraseTemplate_actionIdentifier_parameterIdentifier_completion___block_invoke_2;
  v8[3] = &unk_1E5B38F78;
  id v7 = *(id *)(a1 + 80);
  v8[4] = *(void *)(a1 + 72);
  id v9 = v7;
  [v2 actionForBundleIdentifier:v3 basePhraseTemplate:v4 actionIdentifier:v5 parameterIdentifier:v6 completionHandler:v8];
}

uint64_t __128__LNAutoShortcutsProvider_retrieveActionForBundleIdentifier_basePhraseTemplate_actionIdentifier_parameterIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)retrieveActionForLocalizedPhrase:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = [v6 bundleIdentifier];
    *(_DWORD *)buf = 138412290;
    id v25 = v9;
    _os_log_impl(&dword_1A4419000, v8, OS_LOG_TYPE_DEBUG, "Fetching action for bundleIdentifier: %@", buf, 0xCu);
  }
  connection = self->_connection;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __71__LNAutoShortcutsProvider_retrieveActionForLocalizedPhrase_completion___block_invoke;
  v22[3] = &unk_1E5B3A550;
  id v11 = v7;
  id v23 = v11;
  id v12 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v22];
  id v13 = _os_activity_create(&dword_1A4419000, "appintents:retrieve action for phrase", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__LNAutoShortcutsProvider_retrieveActionForLocalizedPhrase_completion___block_invoke_24;
  block[3] = &unk_1E5B39090;
  id v18 = v6;
  id v19 = v12;
  id v20 = self;
  id v21 = v11;
  id v14 = v11;
  id v15 = v12;
  id v16 = v6;
  os_activity_apply(v13, block);
}

void __71__LNAutoShortcutsProvider_retrieveActionForLocalizedPhrase_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A4419000, v4, OS_LOG_TYPE_ERROR, "Got an error from XPCConnection to DaemonRegistryService: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__LNAutoShortcutsProvider_retrieveActionForLocalizedPhrase_completion___block_invoke_24(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) parameterIdentifier];

  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) bundleIdentifier];
  int v5 = [*(id *)(a1 + 32) basePhraseTemplate];
  if (v2)
  {
    id v6 = [*(id *)(a1 + 32) parameterIdentifier];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__LNAutoShortcutsProvider_retrieveActionForLocalizedPhrase_completion___block_invoke_2;
    v12[3] = &unk_1E5B38F78;
    uint64_t v7 = &v13;
    id v8 = *(id *)(a1 + 56);
    v12[4] = *(void *)(a1 + 48);
    id v13 = v8;
    [v3 actionForBundleIdentifier:v4 basePhraseTemplate:v5 parameterIdentifier:v6 completionHandler:v12];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__LNAutoShortcutsProvider_retrieveActionForLocalizedPhrase_completion___block_invoke_3;
    v10[3] = &unk_1E5B38F78;
    uint64_t v7 = &v11;
    id v9 = *(id *)(a1 + 56);
    void v10[4] = *(void *)(a1 + 48);
    id v11 = v9;
    [v3 actionForBundleIdentifier:v4 basePhraseTemplate:v5 completionHandler:v10];
  }
}

uint64_t __71__LNAutoShortcutsProvider_retrieveActionForLocalizedPhrase_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __71__LNAutoShortcutsProvider_retrieveActionForLocalizedPhrase_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)autoShortcutsForBundleIdentifier:(id)a3 localeIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_1A4419000, "appintents:fetch app shortcuts", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__LNAutoShortcutsProvider_autoShortcutsForBundleIdentifier_localeIdentifier_completion___block_invoke;
  v15[3] = &unk_1E5B39090;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  os_activity_apply(v11, v15);
}

void __88__LNAutoShortcutsProvider_autoShortcutsForBundleIdentifier_localeIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __88__LNAutoShortcutsProvider_autoShortcutsForBundleIdentifier_localeIdentifier_completion___block_invoke_2;
    v13[3] = &unk_1E5B38F28;
    void v13[4] = v2;
    id v14 = v4;
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    [v3 autoShortcutsForBundleIdentifier:v14 localeIdentifier:v5 completion:v13];

    id v6 = v14;
  }
  else
  {
    uint64_t v7 = *(void **)(v2 + 24);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __88__LNAutoShortcutsProvider_autoShortcutsForBundleIdentifier_localeIdentifier_completion___block_invoke_4;
    v11[3] = &unk_1E5B39360;
    id v10 = *(id *)(a1 + 56);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v10;
    [v7 autoShortcutsForBundleIdentifier:v8 localeIdentifier:v9 completion:v11];
    id v6 = v12;
  }
}

void __88__LNAutoShortcutsProvider_autoShortcutsForBundleIdentifier_localeIdentifier_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __88__LNAutoShortcutsProvider_autoShortcutsForBundleIdentifier_localeIdentifier_completion___block_invoke_3;
    v8[3] = &unk_1E5B39360;
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = *(id *)(a1 + 56);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    [v5 autoShortcutsForBundleIdentifier:v4 localeIdentifier:v6 completion:v8];
  }
}

uint64_t __88__LNAutoShortcutsProvider_autoShortcutsForBundleIdentifier_localeIdentifier_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __88__LNAutoShortcutsProvider_autoShortcutsForBundleIdentifier_localeIdentifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dealloc
{
  id v3 = getLNLogCategoryGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4419000, v3, OS_LOG_TYPE_DEBUG, "-dealloc called on LNAutoShortcutsProvider", buf, 2u);
  }

  [(NSXPCConnection *)self->_connection invalidate];
  v4.receiver = self;
  v4.super_class = (Class)LNAutoShortcutsProvider;
  [(LNAutoShortcutsProvider *)&v4 dealloc];
}

- (LNAutoShortcutsProvider)init
{
  return [(LNAutoShortcutsProvider *)self initWithOptions:0];
}

+ (id)sharedInstance
{
  uint64_t v2 = objc_alloc_init(LNAutoShortcutsProvider);
  return v2;
}

@end