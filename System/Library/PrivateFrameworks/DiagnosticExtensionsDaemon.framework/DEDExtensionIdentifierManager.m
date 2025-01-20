@interface DEDExtensionIdentifierManager
+ (BOOL)supportsSecureCoding;
+ (id)archivedClasses;
+ (id)log;
- (BOOL)isKnownIdentifier:(id)a3;
- (DEDExtensionIdentifierManager)init;
- (DEDExtensionIdentifierManager)initWithCoder:(id)a3;
- (DEDExtensionIdentifierManager)initWithExtensionIdentifiers:(id)a3;
- (DEDExtensionIdentifierManager)initWithJSONString:(id)a3;
- (NSMutableDictionary)identifierTable;
- (id)JSONRepresentation;
- (id)allIdentifiers;
- (id)identifierForExtensionIdentifier:(id)a3;
- (id)knownIdentifiersForExtensionIdentifier:(id)a3;
- (void)JSONRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)revokeIdentifier:(id)a3;
- (void)setIdentifierTable:(id)a3;
@end

@implementation DEDExtensionIdentifierManager

- (id)JSONRepresentation
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF9A0]);
  v4 = [(DEDExtensionIdentifierManager *)self identifierTable];
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v28 = self;
  v6 = [(DEDExtensionIdentifierManager *)self identifierTable];
  v7 = [v6 allKeys];

  obuint64_t j = v7;
  uint64_t v29 = [v7 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v29)
  {
    uint64_t v27 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v10 = [(DEDExtensionIdentifierManager *)v28 identifierTable];
        v11 = [v10 objectForKeyedSubscript:v9];

        uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v32 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v31 + 1) + 8 * j);
              v17 = [v5 objectForKeyedSubscript:v9];
              if (!v17) {
                v17 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
              }
              v18 = [v16 stringValue];
              [v17 addObject:v18];

              [v5 setObject:v17 forKeyedSubscript:v9];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
          }
          while (v13);
        }
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v29);
  }

  v39 = @"identifierTable";
  v40 = v5;
  v19 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  id v30 = 0;
  v20 = [MEMORY[0x263F08900] dataWithJSONObject:v19 options:2 error:&v30];
  id v21 = v30;
  v22 = v21;
  if (!v20 || v21)
  {
    v24 = +[DEDExtensionIdentifierManager log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      [(DEDExtensionIdentifierManager *)v22 JSONRepresentation];
    }

    v23 = &stru_26D197018;
  }
  else
  {
    v23 = (__CFString *)[[NSString alloc] initWithData:v20 encoding:4];
  }

  return v23;
}

- (DEDExtensionIdentifierManager)initWithJSONString:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)DEDExtensionIdentifierManager;
  v5 = [(DEDExtensionIdentifierManager *)&v46 init];
  v6 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  [(DEDExtensionIdentifierManager *)v5 setIdentifierTable:v6];

  v7 = (void *)MEMORY[0x263F08900];
  uint64_t v29 = v4;
  v8 = [v4 dataUsingEncoding:4];
  id v45 = 0;
  uint64_t v9 = [v7 JSONObjectWithData:v8 options:0 error:&v45];
  id v10 = v45;

  id v30 = v9;
  if (!v9 || v10)
  {
    v11 = +[DEDExtensionIdentifierManager log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(DEDExtensionIdentifierManager *)v10 initWithJSONString:v11];
    }
  }
  else
  {
    v11 = [v9 objectForKeyedSubscript:@"identifierTable"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      obuint64_t j = [v11 allKeys];
      uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v42;
        long long v32 = v11;
        uint64_t v31 = *(void *)v42;
        do
        {
          uint64_t v15 = 0;
          uint64_t v33 = v13;
          do
          {
            if (*(void *)v42 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void *)(*((void *)&v41 + 1) + 8 * v15);
            v17 = [v11 objectForKeyedSubscript:v16];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v39 = 0u;
              long long v40 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              v18 = v17;
              uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v48 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                long long v35 = v17;
                uint64_t v36 = v15;
                uint64_t v21 = *(void *)v38;
                do
                {
                  for (uint64_t i = 0; i != v20; ++i)
                  {
                    if (*(void *)v38 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    v23 = [[DEDExtensionIdentifier alloc] initWithString:*(void *)(*((void *)&v37 + 1) + 8 * i)];
                    v24 = [(DEDExtensionIdentifierManager *)v5 identifierTable];
                    v25 = [v24 objectForKeyedSubscript:v16];

                    if (v25)
                    {
                      [v25 arrayByAddingObject:v23];
                    }
                    else
                    {
                      v47 = v23;
                      [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
                    v26 = };
                    uint64_t v27 = [(DEDExtensionIdentifierManager *)v5 identifierTable];
                    [v27 setObject:v26 forKeyedSubscript:v16];
                  }
                  uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v48 count:16];
                }
                while (v20);
                v11 = v32;
                id v10 = 0;
                uint64_t v14 = v31;
                uint64_t v13 = v33;
                v17 = v35;
                uint64_t v15 = v36;
              }
            }
            else
            {
              v18 = +[DEDExtensionIdentifierManager log];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446466;
                v50 = "-[DEDExtensionIdentifierManager initWithJSONString:]";
                __int16 v51 = 2114;
                uint64_t v52 = v16;
                _os_log_error_impl(&dword_21FE04000, v18, OS_LOG_TYPE_ERROR, "Error in [%{public}s]. could not find array for key [%{public}@]", buf, 0x16u);
              }
            }

            ++v15;
          }
          while (v15 != v13);
          uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
        }
        while (v13);
      }
    }
    else
    {
      obuint64_t j = +[DEDExtensionIdentifierManager log];
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
        -[DEDExtensionIdentifierManager initWithJSONString:](obj);
      }
    }
  }
  return v5;
}

- (DEDExtensionIdentifierManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)DEDExtensionIdentifierManager;
  v2 = [(DEDExtensionIdentifierManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    identifierTable = v2->_identifierTable;
    v2->_identifierTable = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)reset
{
  uint64_t v3 = +[DEDExtensionIdentifierManager log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21FE04000, v3, OS_LOG_TYPE_DEFAULT, "resetting", v5, 2u);
  }

  id v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  [(DEDExtensionIdentifierManager *)self setIdentifierTable:v4];
}

- (DEDExtensionIdentifierManager)initWithExtensionIdentifiers:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DEDExtensionIdentifierManager;
  v5 = [(DEDExtensionIdentifierManager *)&v26 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    identifierTable = v5->_identifierTable;
    v5->_identifierTable = (NSMutableDictionary *)v6;

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v21 = v4;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
          uint64_t v14 = [(DEDExtensionIdentifierManager *)v5 identifierTable];
          uint64_t v15 = [v13 extensionIdentifier];
          uint64_t v16 = [v14 objectForKey:v15];
          v17 = (void *)[v16 mutableCopy];

          if (!v17)
          {
            v17 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
          }
          [v17 addObject:v13];
          v18 = [(DEDExtensionIdentifierManager *)v5 identifierTable];
          uint64_t v19 = [v13 extensionIdentifier];
          [v18 setObject:v17 forKey:v19];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v10);
    }

    id v4 = v21;
  }

  return v5;
}

- (id)identifierForExtensionIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(DEDExtensionIdentifierManager *)self identifierTable];
  objc_sync_enter(v5);
  uint64_t v6 = [(DEDExtensionIdentifierManager *)self identifierTable];
  v7 = [v6 objectForKey:v4];
  id v8 = (void *)[v7 mutableCopy];

  if (!v8)
  {
    id v8 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  }
  uint64_t v9 = [v8 lastObject];
  uint64_t v10 = v9;
  if (v9) {
    uint64_t v11 = [v9 invocationNumber] + 1;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = [[DEDExtensionIdentifier alloc] initWithExtensionIdentifier:v4 invocationNumber:v11];
  [v8 addObject:v12];
  uint64_t v13 = [(DEDExtensionIdentifierManager *)self identifierTable];
  [v13 setObject:v8 forKey:v4];

  objc_sync_exit(v5);
  return v12;
}

- (id)knownIdentifiersForExtensionIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(DEDExtensionIdentifierManager *)self identifierTable];
  objc_sync_enter(v5);
  uint64_t v6 = [(DEDExtensionIdentifierManager *)self identifierTable];
  v7 = [v6 objectForKey:v4];

  if (v7) {
    id v8 = (void *)[v7 copy];
  }
  else {
    id v8 = 0;
  }

  objc_sync_exit(v5);
  return v8;
}

- (void)revokeIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(DEDExtensionIdentifierManager *)self identifierTable];
  objc_sync_enter(v5);
  uint64_t v6 = [(DEDExtensionIdentifierManager *)self identifierTable];
  v7 = [v4 extensionIdentifier];
  id v8 = [v6 objectForKey:v7];
  uint64_t v9 = (void *)[v8 mutableCopy];

  [v9 removeObject:v4];
  if (v9)
  {
    uint64_t v10 = [(DEDExtensionIdentifierManager *)self identifierTable];
    uint64_t v11 = [v4 extensionIdentifier];
    [v10 setObject:v9 forKey:v11];
  }
  else
  {
    uint64_t v12 = +[DEDExtensionIdentifierManager log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v4 extensionIdentifier];
      int v14 = 138543362;
      uint64_t v15 = v13;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_INFO, "no identifier table found for DE identifier [%{public}@]", (uint8_t *)&v14, 0xCu);
    }
  }

  objc_sync_exit(v5);
}

- (id)allIdentifiers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:5];
  id v4 = [(DEDExtensionIdentifierManager *)self identifierTable];
  objc_sync_enter(v4);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(DEDExtensionIdentifierManager *)self identifierTable];
  uint64_t v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        [v3 addObjectsFromArray:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v4);
  return v3;
}

- (BOOL)isKnownIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(DEDExtensionIdentifierManager *)self identifierTable];
  objc_sync_enter(v5);
  uint64_t v6 = [(DEDExtensionIdentifierManager *)self identifierTable];
  uint64_t v7 = [v4 extensionIdentifier];
  uint64_t v8 = [(id)v6 objectForKey:v7];

  if (v8) {
    LOBYTE(v6) = [v8 containsObject:v4];
  }

  objc_sync_exit(v5);
  return (v8 != 0) & v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDExtensionIdentifierManager *)self identifierTable];
  [v4 encodeObject:v5 forKey:@"identifierTable"];
}

- (DEDExtensionIdentifierManager)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DEDExtensionIdentifierManager;
  id v5 = [(DEDExtensionIdentifierManager *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() archivedClasses];
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"identifierTable"];
    identifierTable = v5->_identifierTable;
    v5->_identifierTable = (NSMutableDictionary *)v7;

    uint64_t v9 = v5->_identifierTable;
    if (v9)
    {
      uint64_t v10 = v9;
    }
    else
    {
      uint64_t v10 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    }
    long long v11 = v5->_identifierTable;
    v5->_identifierTable = v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)archivedClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
}

+ (id)log
{
  if (log_onceToken_1 != -1) {
    dispatch_once(&log_onceToken_1, &__block_literal_global_13);
  }
  v2 = (void *)log_log_1;
  return v2;
}

void __36__DEDExtensionIdentifierManager_log__block_invoke()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "ded-identifier-manager");
  v1 = (void *)log_log_1;
  log_log_1 = (uint64_t)v0;
}

- (NSMutableDictionary)identifierTable
{
  return self->_identifierTable;
}

- (void)setIdentifierTable:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)JSONRepresentation
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 debugDescription];
  v4[0] = 136446466;
  OUTLINED_FUNCTION_1_2();
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "Error in [%{public}s] [%{public}@]", (uint8_t *)v4, 0x16u);
}

- (void)initWithJSONString:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 debugDescription];
  v7[0] = 136446722;
  OUTLINED_FUNCTION_1_2();
  __int16 v8 = v6;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_21FE04000, a3, OS_LOG_TYPE_ERROR, "Error in [%{public}s] [%{public}@] from JSON [%{public}@]", (uint8_t *)v7, 0x20u);
}

- (void)initWithJSONString:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136446466;
  id v2 = "-[DEDExtensionIdentifierManager initWithJSONString:]";
  __int16 v3 = 2114;
  uint64_t v4 = @"identifierTable";
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "Error in [%{public}s]. did not find [%{public}@]", (uint8_t *)&v1, 0x16u);
}

@end