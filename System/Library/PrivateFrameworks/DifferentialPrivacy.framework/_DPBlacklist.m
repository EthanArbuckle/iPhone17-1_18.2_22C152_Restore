@interface _DPBlacklist
+ (BOOL)blacklistExistsWithKey:(id)a3 inDirectory:(id)a4;
+ (id)blacklistForKey:(id)a3 fromConfigurationsFile:(id)a4;
+ (id)blacklistForKey:(id)a3 systemBlacklistDirectory:(id)a4 runtimeBlacklistDirectory:(id)a5;
+ (id)extractKeyFromFileName:(id)a3;
+ (id)filePathWithKey:(id)a3 inDirectory:(id)a4;
+ (void)initialize;
+ (void)removeBlackListForKey:(id)a3;
+ (void)removeBlackListsForKeys:(id)a3;
+ (void)resetAllBlacklists;
- (NSSet)blacklist;
- (NSString)key;
- (_DPBlacklist)init;
- (_DPBlacklist)initWithKey:(id)a3 fromConfigurationsFile:(id)a4;
- (int64_t)version;
@end

@implementation _DPBlacklist

+ (void)initialize
{
  if (initialize_onceToken_1 != -1) {
    dispatch_once(&initialize_onceToken_1, &__block_literal_global_13);
  }
}

- (_DPBlacklist)init
{
  return 0;
}

- (_DPBlacklist)initWithKey:(id)a3 fromConfigurationsFile:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)_DPBlacklist;
  v9 = [(_DPBlacklist *)&v25 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    v10->_version = -1;
    uint64_t v11 = objc_opt_new();
    blacklist = v10->_blacklist;
    v10->_blacklist = (NSSet *)v11;

    v13 = [(id)objc_opt_class() filePathWithKey:v7 inDirectory:v8];
    v14 = objc_opt_new();
    v15 = [v14 nonEmptyStringsFromFileAtPath:v13];
    if ([v15 count])
    {
      v16 = (void *)MEMORY[0x1E4F28FE8];
      v17 = [v15 objectAtIndexedSubscript:0];
      v18 = [v16 scannerWithString:v17];

      if ([v18 scanInteger:0] && objc_msgSend(v18, "isAtEnd"))
      {
        v19 = [v15 objectAtIndexedSubscript:0];
        v10->_version = (int)[v19 intValue];

        uint64_t v20 = objc_msgSend(v15, "subarrayWithRange:", 1, objc_msgSend(v15, "count") - 1);

        v21 = objc_opt_new();
        [v21 addObjectsFromArray:v20];
        uint64_t v22 = [v21 copy];
        v23 = v10->_blacklist;
        v10->_blacklist = (NSSet *)v22;

        v15 = (void *)v20;
      }
    }
  }

  return v10;
}

+ (id)blacklistForKey:(id)a3 systemBlacklistDirectory:(id)a4 runtimeBlacklistDirectory:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (id)_allBlacklists;
  objc_sync_enter(v11);
  id v12 = [(id)_allBlacklists objectForKeyedSubscript:v8];
  if (!v12)
  {
    v13 = [(id)objc_opt_class() blacklistForKey:v8 fromConfigurationsFile:v10];
    if ([v13 version] < 1)
    {
      v14 = [(id)objc_opt_class() blacklistForKey:v8 fromConfigurationsFile:v9];
      if ([v14 version] >= 1)
      {
        v18 = +[_DPLog framework];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          id v26 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v21 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v24 = [v14 version];
          uint64_t v22 = [v14 blacklist];
          *(_DWORD *)buf = 138413570;
          id v28 = v26;
          __int16 v29 = 2112;
          id v30 = v21;
          __int16 v31 = 2112;
          id v32 = v8;
          __int16 v33 = 2048;
          uint64_t v34 = v24;
          __int16 v35 = 2048;
          uint64_t v36 = [v22 count];
          __int16 v37 = 2112;
          id v38 = v9;
          _os_log_debug_impl(&dword_1DC55E000, v18, OS_LOG_TYPE_DEBUG, "%@, %@: selecting system blacklist with key: %@, version: %li, values count: %li, from directory: %@", buf, 0x3Eu);
        }
      }
      id v12 = v14;
    }
    else
    {
      id v12 = v13;
      v14 = +[_DPLog framework];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = [v12 version];
        v17 = [v12 blacklist];
        *(_DWORD *)buf = 138413570;
        id v28 = v25;
        __int16 v29 = 2112;
        id v30 = v16;
        __int16 v31 = 2112;
        id v32 = v8;
        __int16 v33 = 2048;
        uint64_t v34 = v23;
        __int16 v35 = 2048;
        uint64_t v36 = [v17 count];
        __int16 v37 = 2112;
        id v38 = v10;
        _os_log_debug_impl(&dword_1DC55E000, v14, OS_LOG_TYPE_DEBUG, "%@, %@: selecting runtime blacklist with key: %@, version: %li, values count: %li, from directory: %@", buf, 0x3Eu);
      }
    }

    if (v12) {
      [(id)_allBlacklists setObject:v12 forKeyedSubscript:v8];
    }
  }
  objc_sync_exit(v11);

  return v12;
}

+ (void)resetAllBlacklists
{
  id obj = (id)_allBlacklists;
  objc_sync_enter(obj);
  [(id)_allBlacklists removeAllObjects];
  objc_sync_exit(obj);
}

+ (void)removeBlackListForKey:(id)a3
{
  id v4 = a3;
  id v3 = (id)_allBlacklists;
  objc_sync_enter(v3);
  [(id)_allBlacklists removeObjectForKey:v4];
  objc_sync_exit(v3);
}

+ (void)removeBlackListsForKeys:(id)a3
{
  id v4 = a3;
  id v3 = (id)_allBlacklists;
  objc_sync_enter(v3);
  [(id)_allBlacklists removeObjectsForKeys:v4];
  objc_sync_exit(v3);
}

+ (id)blacklistForKey:(id)a3 fromConfigurationsFile:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[_DPBlacklist alloc] initWithKey:v6 fromConfigurationsFile:v5];

  return v7;
}

+ (id)filePathWithKey:(id)a3 inDirectory:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@/%@%@", a4, a3, @".blacklist"];
}

+ (BOOL)blacklistExistsWithKey:(id)a3 inDirectory:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28CB8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 defaultManager];
  id v9 = [NSString stringWithFormat:@"%@/%@%@", v6, v7, @".blacklist"];

  LOBYTE(v7) = [v8 fileExistsAtPath:v9];
  return (char)v7;
}

+ (id)extractKeyFromFileName:(id)a3
{
  id v3 = a3;
  if ([v3 hasSuffix:@".blacklist"])
  {
    id v4 = [v3 stringByDeletingPathExtension];
  }
  else
  {
    id v4 = &stru_1F3681BE0;
  }

  return v4;
}

- (NSSet)blacklist
{
  return self->_blacklist;
}

- (int64_t)version
{
  return self->_version;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_blacklist, 0);
}

@end