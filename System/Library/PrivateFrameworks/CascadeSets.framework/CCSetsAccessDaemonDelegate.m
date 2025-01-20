@interface CCSetsAccessDaemonDelegate
- (BOOL)handlesDirectoryCreationForResource:(id)a3 inContainer:(id)a4;
- (BOOL)handlesDirectoryRemovalForResource:(id)a3 inContainer:(id)a4;
- (BOOL)prepareContainer:(id)a3;
- (BOOL)prepareResource:(id)a3 withMode:(unint64_t)a4 inContainer:(id)a5;
- (BOOL)teardownResource:(id)a3 inContainer:(id)a4;
- (CCSetsAccessDaemonDelegate)init;
- (id)_loadOrCreateContainerInfo:(id)a3;
- (id)_resetSetsDirectory:(id)a3;
- (id)currentSchemaVersion;
@end

@implementation CCSetsAccessDaemonDelegate

- (BOOL)prepareResource:(id)a3 withMode:(unint64_t)a4 inContainer:(id)a5
{
  char v6 = a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    v21 = BMAccessModePrintableDescription();
    *(_DWORD *)buf = 138413058;
    v24 = v20;
    __int16 v25 = 2114;
    id v26 = v8;
    __int16 v27 = 2114;
    v28 = v21;
    __int16 v29 = 2114;
    id v30 = v9;
    _os_log_debug_impl(&dword_249B92000, v10, OS_LOG_TYPE_DEBUG, "%@ preparing resource %{public}@ for mode %{public}@ with container %{public}@", buf, 0x2Au);
  }
  if ((v6 & 2) != 0)
  {
    if ([(CCSetsAccessDaemonDelegate *)self prepareContainer:v9])
    {
      v12 = +[CCDataResource dataResourceFromSpecifier:v8 inContainer:v9];
      v13 = [[CCDataResourceWriter alloc] initWithDataResource:v12 accessAssertion:0];
      localDeviceId = self->_localDeviceId;
      id v22 = 0;
      char v11 = [(CCDataResourceWriter *)v13 initializeDatabaseWithLocalDeviceIdentifier:localDeviceId error:&v22];
      id v15 = v22;
      if (v15) {
        char v11 = 0;
      }
      v16 = __biome_log_for_category();
      v17 = v16;
      if (v11)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[CCSetsAccessDaemonDelegate prepareResource:withMode:inContainer:]();
        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        -[CCSetsAccessDaemonDelegate prepareResource:withMode:inContainer:]();
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (BOOL)prepareContainer:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v4 = (__CFString *)a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_preparedContainers objectForKey:v4];
  if (!v5)
  {
    id v8 = NSURL;
    id v9 = [MEMORY[0x263F29E70] setsDirectoryInContainer:v4];
    v10 = [v8 fileURLWithPath:v9 isDirectory:1];

    id v23 = 0;
    char v11 = CCGetOrCreateDirectoryURL(v10, &v23);
    v12 = (__CFString *)v23;

    if (v11)
    {
      char v6 = [(CCSetsAccessDaemonDelegate *)self _loadOrCreateContainerInfo:v10];
      v13 = [v6 objectForKey:@"schemaVersion"];
      v14 = [(CCSetsAccessDaemonDelegate *)self currentSchemaVersion];
      char v15 = [v14 isEqual:v13];

      if (v15) {
        goto LABEL_23;
      }
      v16 = __biome_log_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = @"empty";
        *(_DWORD *)buf = 138412802;
        __int16 v25 = (__CFString *)&unk_26FDCD598;
        __int16 v26 = 2112;
        if (v13) {
          v17 = (__CFString *)v13;
        }
        __int16 v27 = v17;
        __int16 v28 = 2112;
        __int16 v29 = v4;
        _os_log_impl(&dword_249B92000, v16, OS_LOG_TYPE_DEFAULT, "Current schema (expected: %@) not initialized yet (found: %@) container: %@", buf, 0x20u);
      }

      uint64_t v18 = [(CCSetsAccessDaemonDelegate *)self _resetSetsDirectory:v10];

      char v6 = (void *)v18;
      if (v18)
      {
LABEL_23:
        if (!self->_localDeviceId)
        {
          v19 = [v6 objectForKey:@"localDeviceId"];
          localDeviceId = self->_localDeviceId;
          self->_localDeviceId = v19;
        }
        v21 = __biome_log_for_category();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v25 = v4;
          _os_log_impl(&dword_249B92000, v21, OS_LOG_TYPE_DEFAULT, "Prepared container: %@", buf, 0xCu);
        }

        [(NSMutableDictionary *)self->_preparedContainers setObject:v6 forKey:v4];
        BOOL v7 = 1;
        goto LABEL_19;
      }
    }
    else
    {
      v13 = __biome_log_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        __int16 v25 = v10;
        __int16 v26 = 2112;
        __int16 v27 = v4;
        __int16 v28 = 2112;
        __int16 v29 = v12;
        _os_log_error_impl(&dword_249B92000, v13, OS_LOG_TYPE_ERROR, "Failed to resolve / create sets directory (%@) in container: %@ error: %@", buf, 0x20u);
      }
      char v6 = 0;
    }
    BOOL v7 = 0;
LABEL_19:

    goto LABEL_20;
  }
  char v6 = (void *)v5;
  BOOL v7 = 1;
LABEL_20:

  return v7;
}

- (BOOL)handlesDirectoryCreationForResource:(id)a3 inContainer:(id)a4
{
  return 1;
}

- (CCSetsAccessDaemonDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)CCSetsAccessDaemonDelegate;
  v2 = [(CCSetsAccessDaemonDelegate *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    preparedContainers = v2->_preparedContainers;
    v2->_preparedContainers = v3;
  }
  return v2;
}

- (BOOL)handlesDirectoryRemovalForResource:(id)a3 inContainer:(id)a4
{
  return 1;
}

- (BOOL)teardownResource:(id)a3 inContainer:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138412802;
    v20 = v17;
    __int16 v21 = 2114;
    id v22 = v6;
    __int16 v23 = 2114;
    id v24 = v7;
    _os_log_debug_impl(&dword_249B92000, v8, OS_LOG_TYPE_DEBUG, "%@ tearing down resource %{public}@ with container %{public}@", buf, 0x20u);
  }
  if ([(CCSetsAccessDaemonDelegate *)self prepareContainer:v7])
  {
    id v9 = +[CCDataResource dataResourceFromSpecifier:v6 inContainer:v7];
    v10 = [[CCDataResourceWriter alloc] initWithDataResource:v9 accessAssertion:0];
    id v18 = 0;
    BOOL v11 = [(CCDataResourceWriter *)v10 removeResource:&v18];
    id v12 = v18;
    if (v12) {
      BOOL v11 = 0;
    }
    v13 = __biome_log_for_category();
    v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[CCSetsAccessDaemonDelegate teardownResource:inContainer:]();
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[CCSetsAccessDaemonDelegate teardownResource:inContainer:]();
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)_loadOrCreateContainerInfo:(id)a3
{
  id v3 = a3;
  id v8 = 0;
  v4 = [[CCDictionaryLog alloc] initWithFilename:@"info" protectionClass:4 directory:v3 readOnly:0 create:1 error:&v8];

  id v5 = v8;
  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CCSetsAccessDaemonDelegate _loadOrCreateContainerInfo:]();
    }
  }

  return v4;
}

- (id)_resetSetsDirectory:(id)a3
{
  v35[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v4;
    _os_log_impl(&dword_249B92000, v5, OS_LOG_TYPE_DEFAULT, "Clearing sets directory: %@", buf, 0xCu);
  }

  id v27 = 0;
  char v6 = CCRemoveItemIfExistsAtURL(v4, &v27);
  id v7 = v27;
  id v8 = v7;
  if (v6)
  {
    id v26 = v7;
    id v9 = CCGetOrCreateDirectoryURL(v4, &v26);
    id v10 = v26;

    if (v9)
    {
      BOOL v11 = [(CCSetsAccessDaemonDelegate *)self _loadOrCreateContainerInfo:v4];
      if (!self->_localDeviceId)
      {
        id v12 = [MEMORY[0x263F08C38] UUID];
        v13 = [v12 UUIDString];
        localDeviceId = self->_localDeviceId;
        self->_localDeviceId = v13;
      }
      char v15 = [(CCSetsAccessDaemonDelegate *)self currentSchemaVersion];
      v16 = self->_localDeviceId;
      v35[0] = v15;
      v35[1] = v16;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
      v34[0] = @"schemaVersion";
      v34[1] = @"localDeviceId";
      id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
      id v25 = v10;
      char v19 = [v11 writeUpdatedObjects:v17 forKeys:v18 error:&v25];
      id v8 = v25;

      v20 = __biome_log_for_category();
      __int16 v21 = v20;
      if (v19)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = self->_localDeviceId;
          *(_DWORD *)buf = 138412802;
          id v29 = v4;
          __int16 v30 = 2112;
          uint64_t v31 = v15;
          __int16 v32 = 2112;
          v33 = v22;
          _os_log_impl(&dword_249B92000, v21, OS_LOG_TYPE_DEFAULT, "Sets directory (%@) initialized with schema version: %@ localDeviceId: %@", buf, 0x20u);
        }

        __int16 v23 = v11;
      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[CCSetsAccessDaemonDelegate _resetSetsDirectory:]();
        }

        __int16 v23 = 0;
      }
    }
    else
    {
      BOOL v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CCSetsAccessDaemonDelegate _resetSetsDirectory:]();
      }
      __int16 v23 = 0;
      id v8 = v10;
    }
  }
  else
  {
    BOOL v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CCSetsAccessDaemonDelegate _resetSetsDirectory:]();
    }
    __int16 v23 = 0;
  }

  return v23;
}

- (id)currentSchemaVersion
{
  return &unk_26FDCD598;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceId, 0);

  objc_storeStrong((id *)&self->_preparedContainers, 0);
}

- (void)prepareResource:withMode:inContainer:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_249B92000, v0, OS_LOG_TYPE_DEBUG, "Prepared resource: %@", v1, 0xCu);
}

- (void)prepareResource:withMode:inContainer:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_249B92000, v0, v1, "Could not prepare resource: %@ error: %@");
}

- (void)teardownResource:inContainer:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_249B92000, v0, OS_LOG_TYPE_DEBUG, "Removed resource: %@", v1, 0xCu);
}

- (void)teardownResource:inContainer:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_249B92000, v0, v1, "Could not remove resource: %@ error: %@");
}

- (void)_loadOrCreateContainerInfo:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Failed to load container info: %@", v2, v3, v4, v5, v6);
}

- (void)_resetSetsDirectory:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Failed to create sets directory: %@", v2, v3, v4, v5, v6);
}

- (void)_resetSetsDirectory:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Failed to record schema version and localDeviceId: %@", v2, v3, v4, v5, v6);
}

- (void)_resetSetsDirectory:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Failed to remove sets directory: %@", v2, v3, v4, v5, v6);
}

@end