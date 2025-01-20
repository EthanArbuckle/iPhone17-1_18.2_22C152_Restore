@interface BMSimpleKeyValueStorage
- (BMFileManager)fileManager;
- (BMSimpleKeyValueStorage)initWithURL:(id)a3;
- (NSURL)url;
- (OS_dispatch_queue)queue;
- (id)_fetchValueForKey:(id)a3;
- (id)fetchValueForKey:(id)a3;
- (id)readDictionary;
- (void)_deleteValueForKey:(id)a3;
- (void)_insertValue:(id)a3 forKey:(id)a4;
- (void)deleteValueForKey:(id)a3;
- (void)insertValue:(id)a3 forKey:(id)a4;
- (void)readDictionary;
- (void)storeDictionary:(id)a3;
@end

@implementation BMSimpleKeyValueStorage

- (BMSimpleKeyValueStorage)initWithURL:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BMSimpleKeyValueStorage;
  v6 = [(BMSimpleKeyValueStorage *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.biome.kvstorage", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    uint64_t v17 = 0;
    v10 = [v5 path];
    v11 = [v10 stringByDeletingLastPathComponent];

    if ([MEMORY[0x1E4F4FB78] pathIsManaged:v11 domain:&v17]
      && ([MEMORY[0x1E4F4FB80] current],
          v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 reliesOnDirectAccessForDomain:v17],
          v12,
          !v13))
    {
      uint64_t v14 = [MEMORY[0x1E4F4FB68] fileManagerWithMediatedAccessToDirectory:v11 useCase:*MEMORY[0x1E4F4FAF8] domain:v17 user:geteuid()];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F4FB68] fileManagerWithDirectAccessToDirectory:v11 cachingOptions:0];
    }
    fileManager = v7->_fileManager;
    v7->_fileManager = (BMFileManager *)v14;
  }
  return v7;
}

- (void)insertValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = [(BMSimpleKeyValueStorage *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__BMSimpleKeyValueStorage_insertValue_forKey___block_invoke;
  block[3] = &unk_1E55D6878;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(v8, block);
}

uint64_t __46__BMSimpleKeyValueStorage_insertValue_forKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _insertValue:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (void)_insertValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BMSimpleKeyValueStorage *)self readDictionary];
  [v8 setValue:v7 forKey:v6];

  [(BMSimpleKeyValueStorage *)self storeDictionary:v8];
}

- (id)fetchValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v5 = [(BMSimpleKeyValueStorage *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__BMSimpleKeyValueStorage_fetchValueForKey___block_invoke;
  block[3] = &unk_1E55D68A0;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __44__BMSimpleKeyValueStorage_fetchValueForKey___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _fetchValueForKey:*(void *)(a1 + 40)];

  return MEMORY[0x1F41817F8]();
}

- (id)_fetchValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(BMSimpleKeyValueStorage *)self readDictionary];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)deleteValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(BMSimpleKeyValueStorage *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__BMSimpleKeyValueStorage_deleteValueForKey___block_invoke;
  v7[3] = &unk_1E55D68C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __45__BMSimpleKeyValueStorage_deleteValueForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteValueForKey:*(void *)(a1 + 40)];
}

- (void)_deleteValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(BMSimpleKeyValueStorage *)self readDictionary];
  [v5 removeObjectForKey:v4];

  [(BMSimpleKeyValueStorage *)self storeDictionary:v5];
}

- (id)readDictionary
{
  fileManager = self->_fileManager;
  p_url = &self->_url;
  id v4 = [(NSURL *)self->_url path];
  id v16 = 0;
  id v5 = [(BMFileManager *)fileManager dataWithContentsOfFileAtPath:v4 error:&v16];
  id v6 = v16;

  if (!v6)
  {
    id v9 = (void *)MEMORY[0x1E4F28DC0];
    id v10 = objc_msgSend(MEMORY[0x1E4F28B90], "bm_allowedClassesForSecureCodingBMBookmark");
    id v15 = 0;
    v11 = [v9 unarchivedObjectOfClasses:v10 fromData:v5 error:&v15];
    id v6 = v15;

    if (v6)
    {
      uint64_t v12 = __biome_log_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[BMSimpleKeyValueStorage readDictionary](p_url);
      }
    }
    else
    {
      if (!v11) {
        goto LABEL_9;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v11;
        goto LABEL_10;
      }
      uint64_t v12 = __biome_log_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(BMSimpleKeyValueStorage *)(uint64_t)v11 readDictionary];
      }
    }

LABEL_9:
    id v13 = (id)objc_opt_new();
LABEL_10:
    id v8 = v13;

    goto LABEL_11;
  }
  id v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[BMSimpleKeyValueStorage readDictionary](p_url);
  }

  id v8 = objc_opt_new();
LABEL_11:

  return v8;
}

- (void)storeDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v15 = 0;
  id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v15];
  id v6 = v15;
  if (v6)
  {
    id v7 = v6;
    id v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [MEMORY[0x1E4F4FB78] privacyURLToString:self->_url];
      *(_DWORD *)buf = 138412802;
      id v17 = v4;
      __int16 v18 = 2114;
      v19 = v9;
      __int16 v20 = 2112;
      id v21 = v7;
      id v10 = "Failed to archive dictionary:%@ at path:%{public}@ error:%@";
LABEL_7:
      _os_log_error_impl(&dword_18E67D000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x20u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  fileManager = self->_fileManager;
  uint64_t v12 = [(NSURL *)self->_url path];
  id v14 = 0;
  int v13 = [(BMFileManager *)fileManager replaceFileAtPath:v12 withData:v5 protection:0xFFFFFFFFLL error:&v14];
  id v7 = v14;

  if (v13)
  {
    id v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [MEMORY[0x1E4F4FB78] privacyURLToString:self->_url];
      *(_DWORD *)buf = 138412802;
      id v17 = v4;
      __int16 v18 = 2114;
      v19 = v9;
      __int16 v20 = 2112;
      id v21 = v7;
      id v10 = "Failed to store dictionary:%@ at path:%{public}@ error:%@";
      goto LABEL_7;
    }
LABEL_8:
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSURL)url
{
  return self->_url;
}

- (BMFileManager)fileManager
{
  return self->_fileManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)readDictionary
{
  v1 = [MEMORY[0x1E4F4FB78] privacyURLToString:*a1];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_18E67D000, v2, v3, "Failed to read data from path:%{public}@ error:%@", v4, v5, v6, v7, v8);
}

@end