@interface EXOSExtensionEnumerator
+ (void)enumerateExtensionsInDirectoryAtURL:(id)a3 block:(id)a4;
- (EXOSExtensionEnumerator)initWithCacheURLs:(id)a3;
- (EXOSExtensionEnumerator)initWithCacheURLs:(id)a3 paths:(id)a4;
- (NSArray)extensionPaths;
- (NSEnumerator)extensionPathsEnumerator;
- (id)nextObject;
@end

@implementation EXOSExtensionEnumerator

+ (void)enumerateExtensionsInDirectoryAtURL:(id)a3 block:(id)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v47[0] = *MEMORY[0x1E4F1C628];
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  v29 = v5;
  v9 = [v8 enumeratorAtURL:v5 includingPropertiesForKeys:v7 options:1 errorHandler:0];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v40;
    uint64_t v30 = *(void *)v40;
    do
    {
      uint64_t v13 = 0;
      uint64_t v31 = v11;
      do
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v39 + 1) + 8 * v13);
        if (objc_msgSend(v14, "_EX_isDirectory")
          && ([v14 pathExtension],
              v15 = objc_claimAutoreleasedReturnValue(),
              uint64_t v16 = [v15 caseInsensitiveCompare:@"appex"],
              v15,
              !v16))
        {
          v6[2](v6, v14);
        }
        else if ((objc_msgSend(v14, "_EX_isDirectory") & 1) == 0)
        {
          [v14 pathExtension];
          v17 = v34 = v14;
          uint64_t v18 = [v17 caseInsensitiveCompare:@"appexlist"];

          if (!v18)
          {
            v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v14];
            v19 = objc_msgSend(v32, "_EX_dictionaryForKey:", @"AppExtensions");
            v20 = [v19 allKeys];

            v21 = _EXRegistrationLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v45 = v20;
              _os_log_debug_impl(&dword_191F29000, v21, OS_LOG_TYPE_DEBUG, "Discovered list of App Extension paths '%{public}@'", buf, 0xCu);
            }

            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            id v22 = v20;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v36;
              do
              {
                for (uint64_t i = 0; i != v24; ++i)
                {
                  if (*(void *)v36 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v27 = *(void *)(*((void *)&v35 + 1) + 8 * i);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v28 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v27 isDirectory:1];
                    v6[2](v6, v28);
                  }
                  else
                  {
                    v28 = _EXRegistrationLog();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      v45 = v34;
                      _os_log_error_impl(&dword_191F29000, v28, OS_LOG_TYPE_ERROR, "unexpected class for entry in %{public}@ extension list.", buf, 0xCu);
                    }
                  }
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
              }
              while (v24);
            }

            uint64_t v12 = v30;
            uint64_t v11 = v31;
          }
        }
        ++v13;
      }
      while (v13 != v11);
      uint64_t v11 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v11);
  }
}

- (EXOSExtensionEnumerator)initWithCacheURLs:(id)a3
{
  return [(EXOSExtensionEnumerator *)self initWithCacheURLs:a3 paths:MEMORY[0x1E4F1CBF0]];
}

- (EXOSExtensionEnumerator)initWithCacheURLs:(id)a3 paths:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)EXOSExtensionEnumerator;
  v8 = [(EXOSExtensionEnumerator *)&v38 init];
  v9 = v8;
  if (v8)
  {
    v29 = v8;
    uint64_t v10 = _EXRegistrationLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[EXOSExtensionEnumerator initWithCacheURLs:paths:]();
    }

    id v30 = v7;
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v7];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v31 = v6;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (objc_msgSend(v17, "_EX_isDirectory"))
          {
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __51__EXOSExtensionEnumerator_initWithCacheURLs_paths___block_invoke;
            v32[3] = &unk_1E573D860;
            id v33 = v11;
            +[EXOSExtensionEnumerator enumerateExtensionsInDirectoryAtURL:v17 block:v32];
            uint64_t v18 = v33;
          }
          else
          {
            uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v17];
            v19 = objc_msgSend(v18, "_EX_objectForKey:ofClass:", @"AppExtensions", objc_opt_class());
            v20 = [v19 allKeys];

            v21 = _EXRegistrationLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              long long v40 = v20;
              _os_log_debug_impl(&dword_191F29000, v21, OS_LOG_TYPE_DEBUG, "Discovered cached App Extension paths '%{public}@'", buf, 0xCu);
            }

            id v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_408];
            uint64_t v23 = [v20 filteredArrayUsingPredicate:v22];

            [v11 addObjectsFromArray:v23];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v14);
    }

    uint64_t v24 = [v11 copy];
    v9 = v29;
    extensionPaths = v29->_extensionPaths;
    v29->_extensionPaths = (NSArray *)v24;

    uint64_t v26 = [(NSArray *)v29->_extensionPaths objectEnumerator];
    extensionPathsEnumerator = v29->_extensionPathsEnumerator;
    v29->_extensionPathsEnumerator = (NSEnumerator *)v26;

    id v7 = v30;
    id v6 = v31;
  }

  return v9;
}

void __51__EXOSExtensionEnumerator_initWithCacheURLs_paths___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _EXRegistrationLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __51__EXOSExtensionEnumerator_initWithCacheURLs_paths___block_invoke_cold_1();
  }

  id v5 = *(void **)(a1 + 32);
  id v6 = [v3 path];
  [v5 addObject:v6];
}

uint64_t __51__EXOSExtensionEnumerator_initWithCacheURLs_paths___block_invoke_405(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (([v2 hasPrefix:@"/System/Library/Frameworks"] & 1) != 0
    || ([v2 hasPrefix:@"/System/Library/PrivateFrameworks"] & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = _EXRegistrationLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v2;
    }

    uint64_t v3 = 0;
  }

  return v3;
}

- (id)nextObject
{
  id v2 = [(NSEnumerator *)self->_extensionPathsEnumerator nextObject];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2 isDirectory:1];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSArray)extensionPaths
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSEnumerator)extensionPathsEnumerator
{
  return (NSEnumerator *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPathsEnumerator, 0);

  objc_storeStrong((id *)&self->_extensionPaths, 0);
}

- (void)initWithCacheURLs:paths:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_191F29000, v0, v1, "Looking for caches at URLs: %{public}@ with know paths: %{public}@");
}

void __51__EXOSExtensionEnumerator_initWithCacheURLs_paths___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_191F29000, v0, v1, "Discovered App Extension at '%{public}@'", v2, v3, v4, v5, v6);
}

@end