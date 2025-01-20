@interface BMAccountManager
- (BMAccountManager)initWithUseCase:(id)a3;
- (id)_accountIdentifiers;
- (id)accounts;
- (id)deviceIdentifiersForAccount:(id)a3;
- (void)_accountIdentifiers;
@end

@implementation BMAccountManager

- (BMAccountManager)initWithUseCase:(id)a3
{
  v4 = (__CFString *)a3;
  v10.receiver = self;
  v10.super_class = (Class)BMAccountManager;
  v5 = [(BMAccountManager *)&v10 init];
  if (v5)
  {
    v6 = +[BMPaths sharedSyncDirectoryForDomain:0];
    if (+[BMPaths isTestPathOverridden] || @"__na__" == v4)
    {
      uint64_t v7 = +[BMFileManager fileManagerWithDirectAccessToDirectory:v6 cachingOptions:0];
    }
    else
    {
      uint64_t v7 = +[BMFileManager fileManagerWithMediatedAccessToDirectory:v6 useCase:@"__legacy__" domain:0 user:geteuid()];
    }
    fileManager = v5->_fileManager;
    v5->_fileManager = (BMFileManager *)v7;
  }
  return v5;
}

- (id)_accountIdentifiers
{
  p_fileManager = &self->_fileManager;
  fileManager = self->_fileManager;
  v4 = [(BMFileManager *)fileManager directory];
  id v10 = 0;
  v5 = [(BMFileManager *)fileManager contentsOfDirectoryAtPath:v4 error:&v10];
  id v6 = v10;

  uint64_t v7 = objc_msgSend(v5, "_pas_filteredArrayWithTest:", &__block_literal_global_4);

  if (!v7)
  {
    v8 = __biome_log_for_category(11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      [(BMAccountManager *)(id *)p_fileManager _accountIdentifiers];
    }

    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

BOOL __39__BMAccountManager__accountIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[BMAccount verifyFormattedLikeIdentifier:a2];
}

- (id)accounts
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(BMAccountManager *)self _accountIdentifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [[BMAccount alloc] initWithIdentifier:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)deviceIdentifiersForAccount:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33 = objc_opt_new();
  v30 = v4;
  uint64_t v5 = +[BMPaths pathForSharedSyncWithAccount:v4 streamType:2 domain:0];
  uint64_t v6 = self;
  fileManager = self->_fileManager;
  id v39 = 0;
  v8 = [(BMFileManager *)fileManager contentsOfDirectoryAtPath:v5 error:&v39];
  id v9 = v39;
  if (v9)
  {
    id v10 = v9;
    long long v11 = __biome_log_for_category(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(BMAccountManager *)v30 deviceIdentifiersForAccount:v11];
    }
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v8;
  uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v36;
    *(void *)&long long v13 = 138412802;
    long long v29 = v13;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        v18 = objc_msgSend(v5, "stringByAppendingPathComponent:", v17, v29);
        v19 = +[BMStoreDirectory remoteDevices];
        v20 = [v18 stringByAppendingPathComponent:v19];

        v21 = v6->_fileManager;
        id v34 = 0;
        v22 = [(BMFileManager *)v21 contentsOfDirectoryAtPath:v20 error:&v34];
        id v23 = v34;
        if (v23)
        {
          v24 = v23;
          v25 = __biome_log_for_category(0);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v31 = [v30 identifier];
            *(_DWORD *)buf = v29;
            v41 = v31;
            __int16 v42 = 2114;
            uint64_t v43 = v17;
            __int16 v44 = 2112;
            v45 = v24;
            _os_log_error_impl(&dword_1B30A0000, v25, OS_LOG_TYPE_ERROR, "Failed to retrieve device list for account identifier %@ stream %{public}@ with error: %@", buf, 0x20u);
          }
        }
        v26 = objc_msgSend(v22, "_pas_filteredArrayWithTest:", &__block_literal_global_7);
        [v33 addObjectsFromArray:v26];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v14);
  }

  v27 = [v33 allObjects];

  return v27;
}

BOOL __48__BMAccountManager_deviceIdentifiersForAccount___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4 != 0;
}

- (void).cxx_destruct
{
}

- (void)_accountIdentifiers
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = [*a1 directory];
  OUTLINED_FUNCTION_0_3();
  _os_log_fault_impl(&dword_1B30A0000, a3, OS_LOG_TYPE_FAULT, "Failed to enumerate accounts in path: %@ with error: %@", v5, 0x16u);
}

- (void)deviceIdentifiersForAccount:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 identifier];
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_1B30A0000, a3, OS_LOG_TYPE_ERROR, "Failed to retrieve streams list for account identifier %@ with error: %@", v5, 0x16u);
}

@end