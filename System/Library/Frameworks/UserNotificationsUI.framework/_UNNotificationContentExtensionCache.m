@interface _UNNotificationContentExtensionCache
- (NSMutableDictionary)extensions;
- (_UNNotificationContentExtensionCache)init;
- (id)_sourceDictForSource:(id)a3;
- (id)extensionForNotificationSourceIdentifier:(id)a3 categoryIdentifier:(id)a4;
- (void)_addExtension:(id)a3;
- (void)_removeAllExtensions;
- (void)registerExtensions:(id)a3;
- (void)setExtensions:(id)a3;
@end

@implementation _UNNotificationContentExtensionCache

- (_UNNotificationContentExtensionCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionCache;
  v2 = [(_UNNotificationContentExtensionCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    extensions = v2->_extensions;
    v2->_extensions = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)extensionForNotificationSourceIdentifier:(id)a3 categoryIdentifier:(id)a4
{
  v4 = 0;
  if (a3 && a4)
  {
    id v7 = a4;
    id v8 = a3;
    v9 = [(_UNNotificationContentExtensionCache *)self extensions];
    v10 = [v9 objectForKey:v8];

    v11 = [v10 objectForKey:v7];

    if (v11)
    {
      id v15 = 0;
      v4 = [MEMORY[0x263F08800] extensionWithIdentifier:v11 error:&v15];
      id v12 = v15;
      if (v12)
      {
        v13 = UNLogExtensions;
        if (os_log_type_enabled((os_log_t)UNLogExtensions, OS_LOG_TYPE_ERROR)) {
          -[_UNNotificationContentExtensionCache extensionForNotificationSourceIdentifier:categoryIdentifier:]((uint64_t)v11, (uint64_t)v12, v13);
        }
      }
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (void)registerExtensions:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(_UNNotificationContentExtensionCache *)self _removeAllExtensions];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v24;
    v9 = (os_log_t *)&UNLogExtensions;
    *(void *)&long long v6 = 138543874;
    long long v20 = v6;
    v21 = self;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        os_log_t v12 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v12;
          v14 = [v11 identifier];
          id v15 = objc_msgSend(v11, "un_supportedCategoryIdentifiers");
          [v15 componentsJoinedByString:@", "];
          v17 = v16 = v9;
          [v11 attributes];
          v19 = uint64_t v18 = v8;
          *(_DWORD *)buf = v20;
          v28 = v14;
          __int16 v29 = 2114;
          v30 = v17;
          __int16 v31 = 2114;
          v32 = v19;
          _os_log_impl(&dword_222224000, v13, OS_LOG_TYPE_DEFAULT, "Loaded extension %{public}@ for categories [ %{public}@ ] with attributes: %{public}@", buf, 0x20u);

          uint64_t v8 = v18;
          v9 = v16;
          self = v21;
        }
        -[_UNNotificationContentExtensionCache _addExtension:](self, "_addExtension:", v11, v20);
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v7);
  }
}

- (void)_addExtension:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v21 = objc_msgSend(v3, "un_supportedCategoryIdentifiers");
  id v4 = objc_msgSend(v3, "un_allowedSourceIdentifiers");
  uint64_t v5 = v4;
  if (v4)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id obj = v5;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(obj);
          }
          v9 = -[_UNNotificationContentExtensionCache _sourceDictForSource:](self, "_sourceDictForSource:", *(void *)(*((void *)&v26 + 1) + 8 * i), obj);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v10 = v21;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v23;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v23 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * j);
                v16 = [v3 identifier];
                [v9 setObject:v16 forKeyedSubscript:v15];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v12);
          }
        }
        uint64_t v5 = obj;
        uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v17 = (void *)UNLogExtensions;
    if (os_log_type_enabled((os_log_t)UNLogExtensions, OS_LOG_TYPE_ERROR)) {
      -[_UNNotificationContentExtensionCache _addExtension:](v17, v3);
    }
  }
}

- (void)_removeAllExtensions
{
  id v2 = [(_UNNotificationContentExtensionCache *)self extensions];
  [v2 removeAllObjects];
}

- (id)_sourceDictForSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UNNotificationContentExtensionCache *)self extensions];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v4 && !v6)
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = [(_UNNotificationContentExtensionCache *)self extensions];
    [v7 setObject:v6 forKey:v4];
  }

  return v6;
}

- (NSMutableDictionary)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)extensionForNotificationSourceIdentifier:(os_log_t)log categoryIdentifier:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_222224000, log, OS_LOG_TYPE_ERROR, "Loaded extension %{public}@ failed: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)_addExtension:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = a1;
  uint64_t v4 = [a2 identifier];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_222224000, v3, OS_LOG_TYPE_ERROR, "Could not find container bundle id for extension %{public}@", (uint8_t *)&v5, 0xCu);
}

@end