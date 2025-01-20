@interface CalMockPreferenceStore
+ (id)decodeKeysDictionary:(id)a3;
+ (id)encodeKeysDictionary:(id)a3;
+ (id)inMemoryStore;
+ (id)preferencesStoreForPath:(id)a3;
+ (id)storagePathForDirectory:(id)a3;
- (BOOL)_getValue:(id *)a3 forDomain:(id)a4 key:(id)a5;
- (BOOL)getBoolean:(BOOL *)a3 forDomain:(id)a4 key:(id)a5;
- (BOOL)getInteger:(int64_t *)a3 forDomain:(id)a4 key:(id)a5;
- (BOOL)getValue:(id *)a3 forDomain:(id)a4 key:(id)a5;
- (CalMockPreferenceStore)init;
- (CalMockPreferenceStore)initWithPath:(id)a3;
- (void)_setValue:(id)a3 forDomain:(id)a4 key:(id)a5;
- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5;
@end

@implementation CalMockPreferenceStore

- (CalMockPreferenceStore)init
{
  v9.receiver = self;
  v9.super_class = (Class)CalMockPreferenceStore;
  v2 = [(CalMockPreferenceStore *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    keys = v3->_keys;
    v3->_keys = (NSMutableDictionary *)v4;

    uint64_t v6 = objc_opt_new();
    values = v3->_values;
    v3->_values = (NSMutableDictionary *)v6;
  }
  return v3;
}

- (CalMockPreferenceStore)initWithPath:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CalMockPreferenceStore;
  v5 = [(CalMockPreferenceStore *)&v20 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = +[CalMockPreferenceStore storagePathForDirectory:v4];
    objc_storeStrong((id *)&v6->_path, v7);
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v7];
    objc_super v9 = [v8 objectForKeyedSubscript:@"keys"];
    uint64_t v10 = +[CalMockPreferenceStore decodeKeysDictionary:v9];
    keys = v6->_keys;
    v6->_keys = (NSMutableDictionary *)v10;

    v12 = [v8 objectForKeyedSubscript:@"values"];
    uint64_t v13 = [v12 mutableCopy];
    values = v6->_values;
    v6->_values = (NSMutableDictionary *)v13;

    if (!v6->_keys)
    {
      uint64_t v15 = objc_opt_new();
      v16 = v6->_keys;
      v6->_keys = (NSMutableDictionary *)v15;
    }
    if (!v6->_values)
    {
      uint64_t v17 = objc_opt_new();
      v18 = v6->_values;
      v6->_values = (NSMutableDictionary *)v17;
    }
  }

  return v6;
}

+ (id)preferencesStoreForPath:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&preferencesStoreForPath__globalLock);
  id v4 = (void *)preferencesStoreForPath__preferencesByPath;
  if (!preferencesStoreForPath__preferencesByPath)
  {
    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    uint64_t v6 = (void *)preferencesStoreForPath__preferencesByPath;
    preferencesStoreForPath__preferencesByPath = v5;

    id v4 = (void *)preferencesStoreForPath__preferencesByPath;
  }
  v7 = [v4 objectForKey:v3];
  if (!v7)
  {
    v7 = [[CalMockPreferenceStore alloc] initWithPath:v3];
    [(id)preferencesStoreForPath__preferencesByPath setObject:v7 forKey:v3];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&preferencesStoreForPath__globalLock);

  return v7;
}

+ (id)inMemoryStore
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)storagePathForDirectory:(id)a3
{
  return (id)[a3 stringByAppendingPathComponent:@"CalPreferences.plist"];
}

- (BOOL)getBoolean:(BOOL *)a3 forDomain:(id)a4 key:(id)a5
{
  id v10 = 0;
  BOOL v6 = [(CalMockPreferenceStore *)self getValue:&v10 forDomain:a4 key:a5];
  id v7 = v10;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    *a3 = [v7 BOOLValue];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)getInteger:(int64_t *)a3 forDomain:(id)a4 key:(id)a5
{
  id v10 = 0;
  BOOL v6 = [(CalMockPreferenceStore *)self getValue:&v10 forDomain:a4 key:a5];
  id v7 = v10;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    *a3 = [v7 integerValue];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)getValue:(id *)a3 forDomain:(id)a4 key:(id)a5
{
  p_lock = &self->_lock;
  id v9 = a5;
  id v10 = a4;
  os_unfair_lock_lock(p_lock);
  LOBYTE(a3) = [(CalMockPreferenceStore *)self _getValue:a3 forDomain:v10 key:v9];

  os_unfair_lock_unlock(p_lock);
  return (char)a3;
}

- (BOOL)_getValue:(id *)a3 forDomain:(id)a4 key:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  BOOL v11 = 0;
  if (v8 && v9)
  {
    v12 = [(NSMutableDictionary *)self->_keys objectForKeyedSubscript:v8];
    uint64_t v13 = v12;
    if (v12 && [v12 containsObject:v10])
    {
      if (a3)
      {
        v14 = [(NSMutableDictionary *)self->_values objectForKeyedSubscript:v8];
        *a3 = [v14 objectForKeyedSubscript:v10];
      }
      BOOL v11 = 1;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  return v11;
}

- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5
{
  p_lock = &self->_lock;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  os_unfair_lock_lock(p_lock);
  [(CalMockPreferenceStore *)self _setValue:v11 forDomain:v10 key:v9];

  os_unfair_lock_unlock(p_lock);
}

- (void)_setValue:(id)a3 forDomain:(id)a4 key:(id)a5
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v9 && v10)
  {
    v12 = [(NSMutableDictionary *)self->_keys objectForKeyedSubscript:v9];
    if (!v12)
    {
      v12 = objc_opt_new();
      [(NSMutableDictionary *)self->_keys setObject:v12 forKeyedSubscript:v9];
    }
    [v12 addObject:v11];
    uint64_t v13 = [(NSMutableDictionary *)self->_values objectForKeyedSubscript:v9];
    if (!v13)
    {
      uint64_t v13 = objc_opt_new();
      [(NSMutableDictionary *)self->_values setObject:v13 forKeyedSubscript:v9];
    }
    [v13 setObject:v8 forKeyedSubscript:v11];
    if (self->_path)
    {
      v21[0] = @"keys";
      v14 = +[CalMockPreferenceStore encodeKeysDictionary:self->_keys];
      v21[1] = @"values";
      v22[0] = v14;
      v22[1] = self->_values;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

      v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_path];
      id v20 = 0;
      char v17 = [v15 writeToURL:v16 error:&v20];
      id v18 = v20;

      if ((v17 & 1) == 0)
      {
        v19 = +[CalPreferences log];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[CalMockPreferenceStore _setValue:forDomain:key:]((uint64_t)v18, v19);
        }
      }
    }
  }
}

+ (id)encodeKeysDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v14);
        v12 = [v11 allObjects];
        [v4 setObject:v12 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)decodeKeysDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_alloc(MEMORY[0x1E4F1CA80]);
        v12 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v15);
        uint64_t v13 = (void *)[v11 initWithArray:v12];
        [v4 setObject:v13 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_values, 0);

  objc_storeStrong((id *)&self->_keys, 0);
}

- (void)_setValue:(uint64_t)a1 forDomain:(NSObject *)a2 key:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "Couldn't save preferences: %@", (uint8_t *)&v2, 0xCu);
}

@end