@interface DRSCKConfigStore
- (BOOL)isReadOnly;
- (BOOL)resetToDefaultWithErrorOut:(id *)a3;
- (BOOL)saveConfig:(id)a3 errorOut:(id *)a4;
- (DRSCKConfigStore)initWithWorkingDirectory:(id)a3 isReadOnly:(BOOL)a4 errorOut:(id *)a5;
- (NSManagedObjectContext)context;
- (NSPersistentContainer)container;
- (NSString)workingDirectory;
- (id)_currentConfig_ON_MOC_QUEUE:(id *)a3;
- (id)currentConfig:(id *)a3;
@end

@implementation DRSCKConfigStore

- (DRSCKConfigStore)initWithWorkingDirectory:(id)a3 isReadOnly:(BOOL)a4 errorOut:(id *)a5
{
  id v9 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DRSCKConfigStore;
  v10 = [(DRSCKConfigStore *)&v24 init];
  v11 = v10;
  if (!v10) {
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v10->_workingDirectory, a3);
  v11->_isReadOnly = a4;
  v12 = [(DRSCKConfigStore *)v11 workingDirectory];
  id v23 = 0;
  DRSCKConfigPersistentContainer(v12, [(DRSCKConfigStore *)v11 isReadOnly], &v23);
  v13 = (NSPersistentContainer *)objc_claimAutoreleasedReturnValue();
  id v14 = v23;

  if (!v14)
  {
    container = v11->_container;
    v11->_container = v13;
    v18 = v13;

    v19 = [(DRSCKConfigStore *)v11 container];
    uint64_t v20 = [v19 newBackgroundContext];
    context = v11->_context;
    v11->_context = (NSManagedObjectContext *)v20;

LABEL_5:
    v16 = v11;
    goto LABEL_6;
  }
  id v15 = v14;
  *a5 = v15;

  v16 = 0;
LABEL_6:

  return v16;
}

- (id)_currentConfig_ON_MOC_QUEUE:(id *)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v5 = [(DRSCKConfigStore *)self context];
  v6 = +[DRSCKConfigMO fetchRequest];
  id v45 = 0;
  v7 = [v5 executeFetchRequest:v6 error:&v45];
  id v8 = v45;

  if (!v8)
  {
    if ([v7 count])
    {
      if ((unint64_t)[v7 count] < 2)
      {
        v36 = [v7 firstObject];
        objc_super v24 = v36;
        if (v36)
        {
          if (([v36 overridesDefault] & 1) != 0
            || (+[DRSCKConfig defaultConfig],
                v37 = objc_claimAutoreleasedReturnValue(),
                char v38 = [v24 isEqual:v37],
                v37,
                (v38 & 1) != 0))
          {
            id v13 = 0;
            goto LABEL_36;
          }
        }
LABEL_22:
        v25 = DPLogHandle_CKConfig();
        if (os_signpost_enabled(v25))
        {
          v26 = +[DRSCKConfig defaultConfig];
          v27 = [v26 debugDescription];
          *(_DWORD *)buf = 138543362;
          v48 = v27;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PopulatingDefaultConfig", "Populating config entry with default (%{public}@", buf, 0xCu);
        }
        uint64_t v28 = +[DRSCKConfig defaultConfig];
        v29 = [(DRSCKConfigStore *)self context];
        id v30 = (id)objc_msgSend((id)v28, "newConfigMOInContext_ON_MOC_QUEUE:", v29);

        v31 = [(DRSCKConfigStore *)self context];
        id v40 = 0;
        LOBYTE(v28) = [v31 save:&v40];
        id v13 = v40;

        if ((v28 & 1) == 0)
        {
          v32 = DPLogHandle_CoreDataError();
          if (os_signpost_enabled(v32))
          {
            uint64_t v33 = [v13 localizedDescription];
            v34 = (void *)v33;
            v35 = @"Unknown";
            if (v33) {
              v35 = (__CFString *)v33;
            }
            *(_DWORD *)buf = 138543362;
            v48 = v35;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v32, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FailedToSaveCKConfig", "Failed a CK Config managed object due to error: %{public}@", buf, 0xCu);
          }
          if (a3)
          {
            id v13 = v13;
            id v14 = 0;
            *a3 = v13;
          }
          else
          {
            id v14 = 0;
          }
          goto LABEL_38;
        }
        objc_super v24 = v30;
LABEL_36:
        id v30 = v24;
        id v14 = v30;
LABEL_38:

        goto LABEL_39;
      }
      id v15 = DPLogHandle_CKConfigError();
      if (os_signpost_enabled(v15))
      {
        int v16 = [v7 count];
        *(_DWORD *)buf = 67109120;
        LODWORD(v48) = v16;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NonUniqueCKConfig", "Found %u configs. Attempting to delete and recover from state.", buf, 8u);
      }

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v17 = v7;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v42 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            id v23 = [(DRSCKConfigStore *)self context];
            [v23 deleteObject:v22];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v19);
      }
    }
    else
    {
      v17 = DPLogHandle_CKConfig();
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigManagedObjectFetchMiss", "No cached CK Config", buf, 2u);
      }
    }

    objc_super v24 = 0;
    goto LABEL_22;
  }
  id v9 = DPLogHandle_CoreDataError();
  if (os_signpost_enabled(v9))
  {
    uint64_t v10 = [v8 localizedDescription];
    v11 = (void *)v10;
    v12 = @"Unknown";
    if (v10) {
      v12 = (__CFString *)v10;
    }
    *(_DWORD *)buf = 138543362;
    v48 = v12;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKConfigMOFetch", "Failed to fetch a CK Config managed object due to error: %{public}@", buf, 0xCu);
  }
  id v13 = v8;
  id v14 = 0;
LABEL_39:

  return v14;
}

- (BOOL)saveConfig:(id)a3 errorOut:(id *)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v23 = 0;
  objc_super v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  v7 = [(DRSCKConfigStore *)self context];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __40__DRSCKConfigStore_saveConfig_errorOut___block_invoke;
  uint64_t v18 = &unk_263FC9BE0;
  uint64_t v19 = self;
  v21 = &v23;
  uint64_t v22 = &v29;
  id v8 = v6;
  id v20 = v8;
  [v7 performBlockAndWait:&v15];

  if (!*((unsigned char *)v30 + 24))
  {
    id v9 = DPLogHandle_CKConfigError();
    if (os_signpost_enabled(v9))
    {
      uint64_t v10 = objc_msgSend((id)v24[5], "localizedDescription", v15, v16, v17, v18, v19);
      v11 = (void *)v10;
      v12 = @"Unknown";
      if (v10) {
        v12 = (__CFString *)v10;
      }
      *(_DWORD *)buf = 138543362;
      v34 = v12;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SaveConfigFailed", "Failed due to error: %{public}@", buf, 0xCu);
    }
  }
  if (a4) {
    *a4 = (id) v24[5];
  }
  BOOL v13 = *((unsigned char *)v30 + 24) != 0;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v13;
}

void __40__DRSCKConfigStore_saveConfig_errorOut___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v11 = 0;
  v3 = objc_msgSend(v2, "_currentConfig_ON_MOC_QUEUE:", &v11);
  id v4 = v11;
  id v5 = v11;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v4);
  if (v3)
  {
    objc_msgSend(v3, "setContainerEnvironment:", objc_msgSend(*(id *)(a1 + 40), "containerEnvironment"));
    objc_msgSend(v3, "setRapidEnvironment:", objc_msgSend(*(id *)(a1 + 40), "rapidEnvironment"));
    objc_msgSend(v3, "setOverridesDefault:", objc_msgSend(*(id *)(a1 + 40), "overridesDefault"));
    id v6 = [*(id *)(a1 + 32) context];
    id v10 = v5;
    char v7 = [v6 save:&v10];
    id v8 = v10;
    id v9 = v10;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v8);
    id v5 = v9;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (BOOL)resetToDefaultWithErrorOut:(id *)a3
{
  id v5 = +[DRSCKConfig defaultConfig];
  LOBYTE(a3) = [(DRSCKConfigStore *)self saveConfig:v5 errorOut:a3];

  return (char)a3;
}

- (id)currentConfig:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__0;
  uint64_t v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  BOOL v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  id v5 = [(DRSCKConfigStore *)self context];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__DRSCKConfigStore_currentConfig___block_invoke;
  v8[3] = &unk_263FC9C08;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = &v15;
  [v5 performBlockAndWait:v8];

  if (a3) {
    *a3 = (id) v10[5];
  }
  id v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);

  return v6;
}

void __34__DRSCKConfigStore_currentConfig___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  id v9 = 0;
  v3 = objc_msgSend(v2, "_currentConfig_ON_MOC_QUEUE:", &v9);
  id v4 = v9;
  id v5 = v9;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v4);
  if (v3)
  {
    uint64_t v6 = +[DRSCKConfig _configWithConfigMO_ON_MOC_QUEUE:v3];
    uint64_t v7 = *(void *)(a1[6] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (NSString)workingDirectory
{
  return self->_workingDirectory;
}

- (NSPersistentContainer)container
{
  return self->_container;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_container, 0);

  objc_storeStrong((id *)&self->_workingDirectory, 0);
}

@end