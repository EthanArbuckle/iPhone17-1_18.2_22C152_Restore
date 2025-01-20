@interface DOCUserInterfaceStateStore
+ (DOCUserInterfaceStateStore)sharedStore;
- (DOCUserInterfaceStateStore)init;
- (NSMutableDictionary)uiStateMap;
- (id)_loadUserInterfaceStateFromDefaultsForConfiguration:(id)a3;
- (id)_mostRecentInterfaceStateForConfiguration:(id)a3;
- (id)_sortedInterfaceStateKeys;
- (id)docUserDefaults;
- (id)interfaceStateForConfiguration:(id)a3;
- (void)_pruneOldState;
- (void)_writeMostRecentUserInterfaceStateToDefaultsForConfiguration:(id)a3;
- (void)_writeUserInterfaceStateToDefaultsForConfiguration:(id)a3;
- (void)purgeApplicationStateExcludingIdentifiers:(id)a3 configuration:(id)a4;
- (void)purgeApplicationStateForIdentifiers:(id)a3 configuration:(id)a4;
- (void)purgeStateForConfiguration:(id)a3;
- (void)setUiStateMap:(id)a3;
- (void)updateInterfaceState:(id)a3 forConfiguration:(id)a4;
@end

@implementation DOCUserInterfaceStateStore

+ (DOCUserInterfaceStateStore)sharedStore
{
  if (sharedStore_onceToken != -1) {
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedStore_sharedManager;
  return (DOCUserInterfaceStateStore *)v2;
}

- (id)interfaceStateForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 stateIdentifier];
  v6 = (void *)v5;
  v7 = 0;
  v8 = (NSObject **)MEMORY[0x263F3AC78];
  if (v4 && v5)
  {
    uiStateMap = self->_uiStateMap;
    if (!uiStateMap)
    {
      v10 = [(DOCUserInterfaceStateStore *)self _loadUserInterfaceStateFromDefaultsForConfiguration:v4];
      v11 = self->_uiStateMap;
      self->_uiStateMap = v10;

      uiStateMap = self->_uiStateMap;
    }
    v12 = [v4 stateIdentifier];
    v7 = [(NSMutableDictionary *)uiStateMap objectForKey:v12];

    if (v7)
    {
      v13 = *v8;
      if (!*v8)
      {
        DOCInitLogging();
        v13 = *v8;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[DOCUserInterfaceStateStore interfaceStateForConfiguration:].cold.5(v13);
      }
    }
    else
    {
      v14 = [(DOCUserInterfaceStateStore *)self _mostRecentInterfaceStateForConfiguration:v4];
      v7 = (void *)[v14 copy];

      if (v7)
      {
        [(NSMutableDictionary *)self->_uiStateMap setObject:v7 forKey:v6];
        v15 = *v8;
        if (!*v8)
        {
          DOCInitLogging();
          v15 = *v8;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[DOCUserInterfaceStateStore interfaceStateForConfiguration:].cold.4(v15);
        }
      }
      v16 = *v8;
      if (!*v8)
      {
        DOCInitLogging();
        v16 = *v8;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        -[DOCUserInterfaceStateStore interfaceStateForConfiguration:](v16, v4);
        if (v7) {
          goto LABEL_24;
        }
      }
      else if (v7)
      {
        goto LABEL_24;
      }
      v17 = *v8;
      if (!*v8)
      {
        DOCInitLogging();
        v17 = *v8;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[DOCUserInterfaceStateStore interfaceStateForConfiguration:](v17);
      }
      v7 = [MEMORY[0x263F3ABE0] stateWithDefaultSettingsForConfiguration:v4];
      [(NSMutableDictionary *)self->_uiStateMap setObject:v7 forKey:v6];
    }
  }
LABEL_24:
  v18 = *v8;
  if (!*v8)
  {
    DOCInitLogging();
    v18 = *v8;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[DOCUserInterfaceStateStore interfaceStateForConfiguration:]();
  }

  return v7;
}

- (id)_loadUserInterfaceStateFromDefaultsForConfiguration:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v35 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = [(DOCUserInterfaceStateStore *)self docUserDefaults];
  v36 = v4;
  v6 = objc_msgSend(v5, "doc_roleSpecificKeyForKey:configuration:", @"DOCUserDefaultsSceneState", v4);
  v7 = [v5 objectForKey:v6];
  v8 = (NSObject **)MEMORY[0x263F3AC78];
  if (v7)
  {
    id v9 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v10 = [NSDictionary classForKeyedUnarchiver];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v9, "initWithObjects:", v10, v11, objc_opt_class(), 0);
    id v42 = 0;
    v13 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v12 fromData:v7 error:&v42];
    id v14 = v42;
    v15 = v14;
    if (v13)
    {
      id v29 = v14;
      v30 = v12;
      v31 = v7;
      v32 = v6;
      v33 = v5;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id obj = [v13 allKeys];
      uint64_t v16 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v39 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void *)(*((void *)&v38 + 1) + 8 * i);
            v21 = [v13 objectForKey:v20];
            id v37 = 0;
            v22 = [MEMORY[0x263F3ABE0] unarchivedFromData:v21 configuration:v36 error:&v37];
            id v23 = v37;
            v24 = v8;
            v25 = *v8;
            if (v22)
            {
              if (!v25)
              {
                DOCInitLogging();
                v25 = *v24;
              }
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v44 = "-[DOCUserInterfaceStateStore _loadUserInterfaceStateFromDefaultsForConfiguration:]";
                __int16 v45 = 2112;
                uint64_t v46 = v20;
                __int16 v47 = 2112;
                id v48 = v23;
                _os_log_error_impl(&dword_21361D000, v25, OS_LOG_TYPE_ERROR, "%s: Unarchived state for id: %@ error: %@", buf, 0x20u);
              }
              [v35 setObject:v22 forKey:v20];
            }
            else
            {
              if (!v25)
              {
                DOCInitLogging();
                v25 = *v24;
              }
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v44 = "-[DOCUserInterfaceStateStore _loadUserInterfaceStateFromDefaultsForConfiguration:]";
                __int16 v45 = 2112;
                uint64_t v46 = v20;
                __int16 v47 = 2112;
                id v48 = v23;
                _os_log_error_impl(&dword_21361D000, v25, OS_LOG_TYPE_ERROR, "%s: Unable to unarchive state for id: %@ error: %@", buf, 0x20u);
              }
            }

            v8 = v24;
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
        }
        while (v17);
      }

      v6 = v32;
      uint64_t v5 = v33;
      v12 = v30;
      v7 = v31;
      v15 = v29;
    }
    else
    {
      v26 = *v8;
      if (!*v8)
      {
        DOCInitLogging();
        v26 = *v8;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[DOCUserInterfaceStateStore _loadUserInterfaceStateFromDefaultsForConfiguration:]();
      }
    }
  }
  v27 = *v8;
  if (!*v8)
  {
    DOCInitLogging();
    v27 = *v8;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    -[DOCUserInterfaceStateStore _loadUserInterfaceStateFromDefaultsForConfiguration:](v27, v35);
  }

  return v35;
}

- (void)_pruneOldState
{
  v2 = *(void **)(a1 + 8);
  id v3 = a2;
  [v2 count];
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_2_0(&dword_21361D000, v4, v5, "%s: evaluating %lu keys", v6, v7, v8, v9, 2u);
}

- (void)_writeMostRecentUserInterfaceStateToDefaultsForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DOCUserInterfaceStateStore *)self _sortedInterfaceStateKeys];
  if (![v5 count])
  {
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = [(NSMutableDictionary *)self->_uiStateMap valueForKey:v6];
  uint64_t v8 = (NSObject **)MEMORY[0x263F3AC78];
  uint64_t v9 = *MEMORY[0x263F3AC78];
  if (!*MEMORY[0x263F3AC78])
  {
    DOCInitLogging();
    uint64_t v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    [(DOCUserInterfaceStateStore *)(uint64_t)v6 _writeMostRecentUserInterfaceStateToDefaultsForConfiguration:v7];
  }
  id v14 = 0;
  uint64_t v10 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v14];
  id v11 = v14;
  v12 = v11;
  if (v10)
  {

    uint64_t v6 = (void *)v10;
LABEL_9:
    uint64_t v7 = [(DOCUserInterfaceStateStore *)self docUserDefaults];
    objc_msgSend(v7, "doc_setObject:forRoleKey:configuation:", v6, @"DOCUserDefaultsMostRecentSceneState", v4);
    goto LABEL_15;
  }
  v13 = *v8;
  if (!*v8)
  {
    DOCInitLogging();
    v13 = *v8;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[DOCUserInterfaceStateStore _writeMostRecentUserInterfaceStateToDefaultsForConfiguration:]();
  }

LABEL_15:
}

- (id)docUserDefaults
{
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  id v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x263F3AB08]];
  return v3;
}

- (id)_sortedInterfaceStateKeys
{
  return (id)[(NSMutableDictionary *)self->_uiStateMap keysSortedByValueUsingComparator:&__block_literal_global_18];
}

- (void)_writeUserInterfaceStateToDefaultsForConfiguration:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v22 = a3;
  [(DOCUserInterfaceStateStore *)self _pruneOldState];
  v24 = [MEMORY[0x263EFF9A0] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [(NSMutableDictionary *)self->_uiStateMap allKeys];
  uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
  uint64_t v5 = (NSObject **)MEMORY[0x263F3AC78];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v10 = [(NSMutableDictionary *)self->_uiStateMap valueForKey:v9];
        id v26 = 0;
        id v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v26];
        id v12 = v26;
        v13 = v5;
        id v14 = *v5;
        if (v11)
        {
          if (!v14)
          {
            DOCInitLogging();
            id v14 = *v13;
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v32 = "-[DOCUserInterfaceStateStore _writeUserInterfaceStateToDefaultsForConfiguration:]";
            __int16 v33 = 2112;
            uint64_t v34 = v9;
            _os_log_error_impl(&dword_21361D000, v14, OS_LOG_TYPE_ERROR, "%s: Encoded state to archive for id: %@", buf, 0x16u);
          }
          [v24 setValue:v11 forKey:v9];
        }
        else
        {
          if (!v14)
          {
            DOCInitLogging();
            id v14 = *v13;
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v32 = "-[DOCUserInterfaceStateStore _writeUserInterfaceStateToDefaultsForConfiguration:]";
            __int16 v33 = 2112;
            uint64_t v34 = v9;
            __int16 v35 = 2112;
            id v36 = v12;
            _os_log_error_impl(&dword_21361D000, v14, OS_LOG_TYPE_ERROR, "%s: Unable to archive state for id: %@. Error: %@", buf, 0x20u);
          }
        }

        uint64_t v5 = v13;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v6);
  }

  if (![v24 count])
  {
    uint64_t v17 = 0;
    v15 = 0;
LABEL_26:
    v19 = v22;
    goto LABEL_27;
  }
  id v25 = 0;
  v15 = [MEMORY[0x263F08910] archivedDataWithRootObject:v24 requiringSecureCoding:1 error:&v25];
  id v16 = v25;
  uint64_t v17 = v16;
  if (v15 && !v16) {
    goto LABEL_26;
  }
  uint64_t v18 = *v5;
  if (!*v5)
  {
    DOCInitLogging();
    uint64_t v18 = *v5;
  }
  v19 = v22;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[DOCUserInterfaceStateStore _writeUserInterfaceStateToDefaultsForConfiguration:]();
  }
LABEL_27:
  uint64_t v20 = [(DOCUserInterfaceStateStore *)self docUserDefaults];
  v21 = *v5;
  if (!*v5)
  {
    DOCInitLogging();
    v21 = *v5;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[DOCUserInterfaceStateStore _writeUserInterfaceStateToDefaultsForConfiguration:](v21, v24);
  }
  objc_msgSend(v20, "doc_setObject:forRoleKey:configuation:", v15, @"DOCUserDefaultsSceneState", v19);
}

- (void)_writeMostRecentUserInterfaceStateToDefaultsForConfiguration:(void *)a3 .cold.2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = a2;
  uint64_t v5 = [a3 lastUpdatedDate];
  int v6 = 136315650;
  uint64_t v7 = "-[DOCUserInterfaceStateStore _writeMostRecentUserInterfaceStateToDefaultsForConfiguration:]";
  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_21361D000, v4, OS_LOG_TYPE_ERROR, "%s: writing most recent UI state with state from archive state from id: %@ lastUpdatedDate: %@", (uint8_t *)&v6, 0x20u);
}

- (void)updateInterfaceState:(id)a3 forConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (NSObject **)MEMORY[0x263F3AC78];
  uint64_t v9 = *MEMORY[0x263F3AC78];
  if (!*MEMORY[0x263F3AC78])
  {
    DOCInitLogging();
    uint64_t v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[DOCUserInterfaceStateStore updateInterfaceState:forConfiguration:](v9, v7);
  }
  [v6 bumpLastUpdatedDate];
  [(DOCUserInterfaceStateStore *)self _writeUserInterfaceStateToDefaultsForConfiguration:v7];
  [(DOCUserInterfaceStateStore *)self _writeMostRecentUserInterfaceStateToDefaultsForConfiguration:v7];
}

id __34__DOCUserInterfaceStateStore_init__block_invoke()
{
  return (id)[MEMORY[0x263EFF8F0] currentCalendar];
}

uint64_t __41__DOCUserInterfaceStateStore_sharedStore__block_invoke()
{
  v0 = objc_alloc_init(DOCUserInterfaceStateStore);
  uint64_t v1 = sharedStore_sharedManager;
  sharedStore_sharedManager = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (DOCUserInterfaceStateStore)init
{
  v7.receiver = self;
  v7.super_class = (Class)DOCUserInterfaceStateStore;
  id v2 = [(DOCUserInterfaceStateStore *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    uiStateMap = v2->_uiStateMap;
    v2->_uiStateMap = 0;
  }
  uint64_t v5 = [MEMORY[0x263F3ABA8] shared];
  [v5 performAfterLaunch:&__block_literal_global_3];

  return v3;
}

- (id)_mostRecentInterfaceStateForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DOCUserInterfaceStateStore *)self docUserDefaults];
  id v6 = objc_msgSend(v5, "doc_roleSpecificKeyForKey:configuration:", @"DOCUserDefaultsMostRecentSceneState", v4);
  objc_super v7 = [v5 objectForKey:v6];
  if (v7)
  {
    id v23 = 0;
    uint64_t v8 = [MEMORY[0x263F3ABE0] unarchivedFromData:v7 configuration:v4 error:&v23];
    id v9 = v23;
    uint64_t v10 = (NSObject **)MEMORY[0x263F3AC78];
    id v11 = *MEMORY[0x263F3AC78];
    if (v8)
    {
      if (!v11)
      {
        DOCInitLogging();
        id v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[DOCUserInterfaceStateStore _mostRecentInterfaceStateForConfiguration:](v11);
      }
      id v12 = v8;
    }
    else
    {
      if (!v11)
      {
        DOCInitLogging();
        id v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[DOCUserInterfaceStateStore _mostRecentInterfaceStateForConfiguration:]();
      }
    }
  }
  else
  {
    v13 = (NSObject **)MEMORY[0x263F3AC78];
    id v14 = *MEMORY[0x263F3AC78];
    if (!*MEMORY[0x263F3AC78])
    {
      DOCInitLogging();
      id v14 = *v13;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[DOCUserInterfaceStateStore _mostRecentInterfaceStateForConfiguration:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)purgeStateForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 stateIdentifier];
  if (v5)
  {
    id v6 = (NSObject **)MEMORY[0x263F3AC78];
    objc_super v7 = *MEMORY[0x263F3AC78];
    if (!*MEMORY[0x263F3AC78])
    {
      DOCInitLogging();
      objc_super v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[DOCUserInterfaceStateStore purgeStateForConfiguration:]();
    }
    [(NSMutableDictionary *)self->_uiStateMap removeObjectForKey:v5];
  }
  [(DOCUserInterfaceStateStore *)self _writeUserInterfaceStateToDefaultsForConfiguration:v4];
}

- (void)purgeApplicationStateForIdentifiers:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (NSObject **)MEMORY[0x263F3AC78];
  id v9 = *MEMORY[0x263F3AC78];
  if (!*MEMORY[0x263F3AC78])
  {
    DOCInitLogging();
    id v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[DOCUserInterfaceStateStore purgeApplicationStateForIdentifiers:configuration:]();
  }
  [(NSMutableDictionary *)self->_uiStateMap removeObjectsForKeys:v6];
  [(DOCUserInterfaceStateStore *)self _writeUserInterfaceStateToDefaultsForConfiguration:v7];
}

- (void)purgeApplicationStateExcludingIdentifiers:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (NSObject **)MEMORY[0x263F3AC78];
  id v9 = *MEMORY[0x263F3AC78];
  if (!*MEMORY[0x263F3AC78])
  {
    DOCInitLogging();
    id v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[DOCUserInterfaceStateStore purgeApplicationStateExcludingIdentifiers:configuration:]();
  }
  uint64_t v10 = (void *)MEMORY[0x263EFF9C0];
  id v11 = [(NSMutableDictionary *)self->_uiStateMap allKeys];
  id v12 = [v10 setWithArray:v11];

  v13 = [MEMORY[0x263EFFA08] setWithArray:v6];
  [v12 minusSet:v13];

  id v14 = *v8;
  if (!*v8)
  {
    DOCInitLogging();
    id v14 = *v8;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[DOCUserInterfaceStateStore purgeApplicationStateExcludingIdentifiers:configuration:]();
  }
  uint64_t v15 = [v12 allObjects];
  [(DOCUserInterfaceStateStore *)self purgeApplicationStateForIdentifiers:v15 configuration:v7];
}

uint64_t __55__DOCUserInterfaceStateStore__sortedInterfaceStateKeys__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 lastUpdatedDate];
  id v6 = [v4 lastUpdatedDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSMutableDictionary)uiStateMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUiStateMap:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)interfaceStateForConfiguration:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_5_0();
  _os_log_debug_impl(&dword_21361D000, v0, OS_LOG_TYPE_DEBUG, "%s: interfaceStateForConfiguration: identifier: %@ state: %@", (uint8_t *)v1, 0x20u);
}

- (void)interfaceStateForConfiguration:(void *)a1 .cold.2(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_6() stateIdentifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_21361D000, v4, v5, "%s: No saved state for id: %@ or recently used state. Creating new state", v6, v7, v8, v9, 2u);
}

- (void)interfaceStateForConfiguration:(void *)a1 .cold.3(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 stateIdentifier];
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_9_1(&dword_21361D000, v5, v6, "%s: No saved state for id: %@ grabbing last saved state: %@", v7, v8, v9, v10, 2u);
}

- (void)interfaceStateForConfiguration:(os_log_t)log .cold.4(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[DOCUserInterfaceStateStore interfaceStateForConfiguration:]";
  _os_log_debug_impl(&dword_21361D000, log, OS_LOG_TYPE_DEBUG, "%s: interfaceStateForConfiguration: Falling Back to Most Recent", (uint8_t *)&v1, 0xCu);
}

- (void)interfaceStateForConfiguration:(void *)a1 .cold.5(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_6() stateIdentifier];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_21361D000, v4, v5, "%s: interfaceStateForConfiguration: found state object for stateIdentifier: %@", v6, v7, v8, v9, 2u);
}

- (void)_mostRecentInterfaceStateForConfiguration:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_mostRecentInterfaceStateForConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_21361D000, v0, v1, "%s: Unable to unarchive most recent interface state. Error: %@", v2, v3, v4, v5, 2u);
}

- (void)_mostRecentInterfaceStateForConfiguration:(void *)a1 .cold.3(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_6() lastUpdatedDate];
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_21361D000, v1, OS_LOG_TYPE_ERROR, "%s: unarchived most recent interface state with last updated date of: %@ ", (uint8_t *)v4, 0x16u);
}

- (void)updateInterfaceState:(void *)a1 forConfiguration:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 stateIdentifier];
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_9_1(&dword_21361D000, v5, v6, "%s: Updating interface state for identifier: %@ state: %@", v7, v8, v9, v10, 2u);
}

- (void)purgeStateForConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7_1(&dword_21361D000, v0, v1, "%s: Removing saved state for identifier: %@", v2, v3, v4, v5, 2u);
}

- (void)purgeApplicationStateForIdentifiers:configuration:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7_1(&dword_21361D000, v0, v1, "%s: Removing saved state for identifiers: %@", v2, v3, v4, v5, 2u);
}

- (void)purgeApplicationStateExcludingIdentifiers:configuration:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_21361D000, v0, v1, "%s: Removing saved state for identifiers: %@", v2, v3, v4, v5, 2u);
}

- (void)purgeApplicationStateExcludingIdentifiers:configuration:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_21361D000, v0, v1, "%s: Removing saved state for all identifiers excluding: %@", v2, v3, v4, v5, 2u);
}

- (void)_loadUserInterfaceStateFromDefaultsForConfiguration:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v4 = a1;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_6() allKeys];
  [v5 count];
  uint64_t v6 = [a2 allKeys];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_21361D000, v7, v8, "%s: Decoded saved state for %ld identifiers %@ from defaults", v9, v10, v11, v12, 2u);
}

- (void)_loadUserInterfaceStateFromDefaultsForConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_21361D000, v0, v1, "%s: Unable to unarchive all stored state. Error: %@", v2, v3, v4, v5, 2u);
}

- (void)_writeUserInterfaceStateToDefaultsForConfiguration:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v4 = a1;
  uint64_t v5 = [(id)OUTLINED_FUNCTION_6() allKeys];
  [v5 count];
  uint64_t v6 = [a2 allKeys];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_21361D000, v7, v8, "%s: Writing saved state for %ld identifiers %@", v9, v10, v11, v12, 2u);
}

- (void)_writeUserInterfaceStateToDefaultsForConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_21361D000, v0, v1, "%s: Unable to archive all state. Error: %@", v2, v3, v4, v5, 2u);
}

- (void)_writeMostRecentUserInterfaceStateToDefaultsForConfiguration:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_5_0();
  _os_log_error_impl(&dword_21361D000, v0, OS_LOG_TYPE_ERROR, "%s: Unable to archive state for id: %@. Error: %@", (uint8_t *)v1, 0x20u);
}

@end