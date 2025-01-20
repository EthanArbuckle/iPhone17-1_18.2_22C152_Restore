@interface MCDependencyReader
+ (id)sharedReader;
+ (id)systemStoragePath;
+ (id)userStoragePath;
+ (void)setSystemStoragePath:(id)a3 userStoragePath:(id)a4;
- (MCDependencyReader)init;
- (NSMutableDictionary)memberQueueSystemDomainsDict;
- (NSMutableDictionary)memberQueueUserDomainsDict;
- (OS_dispatch_queue)memberQueue;
- (id)_init;
- (id)dependentsOfParent:(id)a3 inDomain:(id)a4;
- (id)dependentsOfParent:(id)a3 inSystemDomain:(id)a4;
- (id)dependentsOfParent:(id)a3 inUserDomain:(id)a4;
- (id)memberQueueDependentsOfParent:(id)a3 inDomain:(id)a4;
- (id)memberQueueDependentsOfParent:(id)a3 inSystemDomain:(id)a4;
- (id)memberQueueDependentsOfParent:(id)a3 inUserDomain:(id)a4;
- (id)memberQueueParentsInDomain:(id)a3;
- (id)memberQueueParentsInSystemDomain:(id)a3;
- (id)memberQueueParentsInUserDomain:(id)a3;
- (id)parentsInDomain:(id)a3;
- (id)parentsInSystemDomain:(id)a3;
- (id)parentsInUserDomain:(id)a3;
- (id)systemDomainsDict;
- (id)userDomainsDict;
- (void)invalidateCache;
- (void)memberQueueRereadDomainsDict;
- (void)memberQueueRereadSystemDomainsDict;
- (void)memberQueueRereadUserDomainsDict;
- (void)setMemberQueue:(id)a3;
- (void)setMemberQueueSystemDomainsDict:(id)a3;
- (void)setMemberQueueUserDomainsDict:(id)a3;
@end

@implementation MCDependencyReader

+ (id)systemStoragePath
{
  if (systemStoragePathOverride)
  {
    id v2 = (id)systemStoragePathOverride;
  }
  else
  {
    MCSystemDependencyFilePath();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (id)userStoragePath
{
  if (userStoragePathOverride)
  {
    id v2 = (id)userStoragePathOverride;
  }
  else
  {
    MCUserDependencyFilePath();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (void)setSystemStoragePath:(id)a3 userStoragePath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 copy];
  v7 = (void *)systemStoragePathOverride;
  systemStoragePathOverride = v6;

  uint64_t v8 = [v5 copy];
  v9 = (void *)userStoragePathOverride;
  userStoragePathOverride = v8;
}

+ (id)sharedReader
{
  if (sharedReader_onceToken != -1) {
    dispatch_once(&sharedReader_onceToken, &__block_literal_global_9);
  }
  id v2 = (void *)sharedReader_obj;
  return v2;
}

void __34__MCDependencyReader_sharedReader__block_invoke()
{
  v0 = NSClassFromString(&cfstr_Mcdependencyma.isa);
  if (v0)
  {
    sharedReader_obj = [[v0 alloc] _init];
    MEMORY[0x1F41817F8]();
  }
  else
  {
    int out_token = 0;
    v1 = (const char *)[@"com.apple.managedconfiguration.dependencydidchange" UTF8String];
    id v2 = dispatch_get_global_queue(0, 0);
    LODWORD(v1) = notify_register_dispatch(v1, &out_token, v2, &__block_literal_global_4);

    if (v1)
    {
      v3 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_1A13F0000, v3, OS_LOG_TYPE_ERROR, "Could not set up listener for dependency invalidation notifications", v6, 2u);
      }
    }
    id v4 = [[MCDependencyReader alloc] _init];
    id v5 = (void *)sharedReader_obj;
    sharedReader_obj = (uint64_t)v4;
  }
}

void __34__MCDependencyReader_sharedReader__block_invoke_2()
{
  id v0 = +[MCDependencyReader sharedReader];
  [v0 invalidateCache];
}

- (MCDependencyReader)init
{
  return 0;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)MCDependencyReader;
  id v2 = [(MCDependencyReader *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MCDependencyManager member queue", 0);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (id)systemDomainsDict
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  dispatch_queue_t v3 = [(MCDependencyReader *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__MCDependencyReader_systemDomainsDict__block_invoke;
  v6[3] = &unk_1E5A65D90;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __39__MCDependencyReader_systemDomainsDict__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) memberQueueSystemDomainsDict];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)userDomainsDict
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  uint64_t v3 = [(MCDependencyReader *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__MCDependencyReader_userDomainsDict__block_invoke;
  v6[3] = &unk_1E5A65D90;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __37__MCDependencyReader_userDomainsDict__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) memberQueueUserDomainsDict];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSMutableDictionary)memberQueueSystemDomainsDict
{
  memberQueueSystemDomainsDict = self->_memberQueueSystemDomainsDict;
  if (!memberQueueSystemDomainsDict)
  {
    [(MCDependencyReader *)self memberQueueRereadSystemDomainsDict];
    memberQueueSystemDomainsDict = self->_memberQueueSystemDomainsDict;
  }
  return memberQueueSystemDomainsDict;
}

- (NSMutableDictionary)memberQueueUserDomainsDict
{
  memberQueueUserDomainsDict = self->_memberQueueUserDomainsDict;
  if (!memberQueueUserDomainsDict)
  {
    [(MCDependencyReader *)self memberQueueRereadUserDomainsDict];
    memberQueueUserDomainsDict = self->_memberQueueUserDomainsDict;
  }
  return memberQueueUserDomainsDict;
}

- (id)memberQueueParentsInDomain:(id)a3
{
  id v4 = a3;
  id v5 = [(MCDependencyReader *)self memberQueueSystemDomainsDict];
  objc_super v6 = [v5 objectForKeyedSubscript:v4];
  uint64_t v7 = [v6 allKeys];

  uint64_t v8 = [(MCDependencyReader *)self memberQueueUserDomainsDict];
  uint64_t v9 = [v8 objectForKeyedSubscript:v4];

  uint64_t v10 = [v9 allKeys];

  if (v7 | v10)
  {
    v11 = [MEMORY[0x1E4F1CA48] array];
    id v12 = v11;
    if (v7) {
      [v11 addObjectsFromArray:v7];
    }
    if (v10) {
      [v12 addObjectsFromArray:v10];
    }
  }
  else
  {
    id v12 = 0;
  }
  v13 = (void *)[v12 copy];

  return v13;
}

- (id)memberQueueParentsInSystemDomain:(id)a3
{
  id v4 = a3;
  id v5 = [(MCDependencyReader *)self memberQueueSystemDomainsDict];
  objc_super v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 allKeys];

  return v7;
}

- (id)memberQueueParentsInUserDomain:(id)a3
{
  id v4 = a3;
  id v5 = [(MCDependencyReader *)self memberQueueUserDomainsDict];
  objc_super v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 allKeys];

  return v7;
}

- (id)memberQueueDependentsOfParent:(id)a3 inDomain:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(MCDependencyReader *)self memberQueueDependentsOfParent:v7 inSystemDomain:v6];
  uint64_t v9 = [(MCDependencyReader *)self memberQueueDependentsOfParent:v7 inUserDomain:v6];

  if (v8 | v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    v11 = v10;
    if (v8) {
      [v10 addObjectsFromArray:v8];
    }
    if (v9) {
      [v11 addObjectsFromArray:v9];
    }
  }
  else
  {
    v11 = 0;
  }
  id v12 = (void *)[v11 copy];

  return v12;
}

- (id)memberQueueDependentsOfParent:(id)a3 inSystemDomain:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(MCDependencyReader *)self memberQueueSystemDomainsDict];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  v11 = (void *)[v10 copy];
  return v11;
}

- (id)memberQueueDependentsOfParent:(id)a3 inUserDomain:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(MCDependencyReader *)self memberQueueUserDomainsDict];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  v11 = (void *)[v10 copy];
  return v11;
}

- (id)parentsInDomain:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  id v5 = [(MCDependencyReader *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MCDependencyReader_parentsInDomain___block_invoke;
  block[3] = &unk_1E5A679B8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __38__MCDependencyReader_parentsInDomain___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) memberQueueParentsInDomain:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (id)dependentsOfParent:(id)a3 inDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  uint64_t v8 = [(MCDependencyReader *)self memberQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__MCDependencyReader_dependentsOfParent_inDomain___block_invoke;
  v13[3] = &unk_1E5A679E0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

uint64_t __50__MCDependencyReader_dependentsOfParent_inDomain___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) memberQueueDependentsOfParent:*(void *)(a1 + 40) inDomain:*(void *)(a1 + 48)];
  return MEMORY[0x1F41817F8]();
}

- (id)parentsInSystemDomain:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  id v5 = [(MCDependencyReader *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MCDependencyReader_parentsInSystemDomain___block_invoke;
  block[3] = &unk_1E5A679B8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __44__MCDependencyReader_parentsInSystemDomain___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) memberQueueParentsInSystemDomain:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (id)parentsInUserDomain:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  id v5 = [(MCDependencyReader *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MCDependencyReader_parentsInUserDomain___block_invoke;
  block[3] = &unk_1E5A679B8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __42__MCDependencyReader_parentsInUserDomain___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) memberQueueParentsInUserDomain:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (id)dependentsOfParent:(id)a3 inSystemDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  uint64_t v8 = [(MCDependencyReader *)self memberQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__MCDependencyReader_dependentsOfParent_inSystemDomain___block_invoke;
  v13[3] = &unk_1E5A679E0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

uint64_t __56__MCDependencyReader_dependentsOfParent_inSystemDomain___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) memberQueueDependentsOfParent:*(void *)(a1 + 40) inSystemDomain:*(void *)(a1 + 48)];
  return MEMORY[0x1F41817F8]();
}

- (id)dependentsOfParent:(id)a3 inUserDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  uint64_t v8 = [(MCDependencyReader *)self memberQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__MCDependencyReader_dependentsOfParent_inUserDomain___block_invoke;
  v13[3] = &unk_1E5A679E0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

uint64_t __54__MCDependencyReader_dependentsOfParent_inUserDomain___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) memberQueueDependentsOfParent:*(void *)(a1 + 40) inUserDomain:*(void *)(a1 + 48)];
  return MEMORY[0x1F41817F8]();
}

- (void)memberQueueRereadDomainsDict
{
  [(MCDependencyReader *)self memberQueueRereadSystemDomainsDict];
  [(MCDependencyReader *)self memberQueueRereadUserDomainsDict];
}

- (void)memberQueueRereadSystemDomainsDict
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = +[MCDependencyReader systemStoragePath];
  int v5 = [v3 fileExistsAtPath:v4];

  getpid();
  id v6 = +[MCDependencyReader systemStoragePath];
  uint64_t v18 = [v6 fileSystemRepresentation];
  int v7 = sandbox_check();

  if (v5 && v7)
  {
    uint64_t v8 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Cannot access system dependency file due to sandboxing.", buf, 2u);
    }
    memberQueueSystemDomainsDict = self->_memberQueueSystemDomainsDict;
    self->_memberQueueSystemDomainsDict = 0;
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F28F98];
    id v11 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v12 = +[MCDependencyReader systemStoragePath];
    v13 = [v11 dataWithContentsOfFile:v12];
    memberQueueSystemDomainsDict = [v10 MCSafePropertyListWithData:v13 options:0 format:0 error:0];

    if (memberQueueSystemDomainsDict && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v14 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1A13F0000, v14, OS_LOG_TYPE_DEBUG, "Reading system dependency information from file.", v20, 2u);
      }
      id v15 = (NSMutableDictionary *)[memberQueueSystemDomainsDict MCMutableDeepCopy];
    }
    else
    {
      v16 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1A13F0000, v16, OS_LOG_TYPE_INFO, "No system dependency information found. Creating an empty dictionary.", v21, 2u);
      }
      id v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    uint64_t v17 = self->_memberQueueSystemDomainsDict;
    self->_memberQueueSystemDomainsDict = v15;
  }
}

- (void)memberQueueRereadUserDomainsDict
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = +[MCDependencyReader userStoragePath];
  int v5 = [v3 fileExistsAtPath:v4];

  getpid();
  id v6 = +[MCDependencyReader userStoragePath];
  uint64_t v18 = [v6 fileSystemRepresentation];
  int v7 = sandbox_check();

  if (v5 && v7)
  {
    uint64_t v8 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_ERROR, "Cannot access user dependency file due to sandboxing.", buf, 2u);
    }
    memberQueueUserDomainsDict = self->_memberQueueUserDomainsDict;
    self->_memberQueueUserDomainsDict = 0;
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F28F98];
    id v11 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v12 = +[MCDependencyReader userStoragePath];
    v13 = [v11 dataWithContentsOfFile:v12];
    memberQueueUserDomainsDict = [v10 MCSafePropertyListWithData:v13 options:0 format:0 error:0];

    if (memberQueueUserDomainsDict && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v14 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1A13F0000, v14, OS_LOG_TYPE_DEBUG, "Reading user dependency information from file.", v20, 2u);
      }
      id v15 = (NSMutableDictionary *)[memberQueueUserDomainsDict MCMutableDeepCopy];
    }
    else
    {
      v16 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1A13F0000, v16, OS_LOG_TYPE_INFO, "No user dependency information found. Creating an empty dictionary.", v21, 2u);
      }
      id v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    uint64_t v17 = self->_memberQueueUserDomainsDict;
    self->_memberQueueUserDomainsDict = v15;
  }
}

- (void)invalidateCache
{
  uint64_t v3 = [(MCDependencyReader *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__MCDependencyReader_invalidateCache__block_invoke;
  block[3] = &unk_1E5A65CB0;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __37__MCDependencyReader_invalidateCache__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMemberQueueSystemDomainsDict:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setMemberQueueUserDomainsDict:0];
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
}

- (void)setMemberQueueSystemDomainsDict:(id)a3
{
}

- (void)setMemberQueueUserDomainsDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueueUserDomainsDict, 0);
  objc_storeStrong((id *)&self->_memberQueueSystemDomainsDict, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
}

@end