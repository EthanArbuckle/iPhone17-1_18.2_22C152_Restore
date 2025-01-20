@interface IKAppDataStorage
- (IKAppDataStorage)initWithFilePath:(id)a3 identifier:(id)a4;
- (NSMutableDictionary)storageDict;
- (NSString)filePath;
- (NSString)identifier;
- (OS_dispatch_queue)storageQueue;
- (id)dictionaryRepresentation;
- (id)getDataForKey:(id)a3;
- (id)keyAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)setData:(id)a3 forKey:(id)a4;
- (void)_saveDict:(id)a3;
- (void)clear;
- (void)removeDataForKey:(id)a3;
- (void)setStorageDict:(id)a3;
- (void)setStorageQueue:(id)a3;
@end

@implementation IKAppDataStorage

- (IKAppDataStorage)initWithFilePath:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (initWithFilePath_identifier__onceToken != -1)
  {
    dispatch_once(&initWithFilePath_identifier__onceToken, &__block_literal_global_2);
    if (v7) {
      goto LABEL_3;
    }
LABEL_14:
    v20 = 0;
    goto LABEL_15;
  }
  if (!v7) {
    goto LABEL_14;
  }
LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)IKAppDataStorage;
  v9 = [(IKAppDataStorage *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a4);
    objc_storeStrong((id *)&v10->_filePath, a3);
    v10->_format = 200;
    uint64_t v11 = objc_opt_new();
    storageDict = v10->_storageDict;
    v10->_storageDict = (NSMutableDictionary *)v11;

    id v13 = [NSString stringWithFormat:@"%@_Storage_Queue", v8];
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
    storageQueue = v10->_storageQueue;
    v10->_storageQueue = (OS_dispatch_queue *)v14;

    v16 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v10->_filePath];
    if (v16)
    {
      id v22 = 0;
      v17 = [MEMORY[0x1E4F28F98] propertyListWithData:v16 options:0 format:&v10->_format error:&v22];
      id v18 = v22;
      if (v17)
      {
        [(NSMutableDictionary *)v10->_storageDict addEntriesFromDictionary:v17];
      }
      else
      {
        v19 = ITMLKitGetLogObject(0);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[IKAppDataStorage initWithFilePath:identifier:]((uint64_t *)&v10->_filePath, (uint64_t)v18, v19);
        }
      }
    }
  }
  self = v10;
  v20 = self;
LABEL_15:

  return v20;
}

uint64_t __48__IKAppDataStorage_initWithFilePath_identifier___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("Storage Write Queue", 0);
  uint64_t v1 = sStorageWriteQueue;
  sStorageWriteQueue = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (unint64_t)count
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(IKAppDataStorage *)self storageQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25__IKAppDataStorage_count__block_invoke;
  v6[3] = &unk_1E6DE4018;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __25__IKAppDataStorage_count__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) storageDict];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (id)keyAtIndex:(unint64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  id v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  v5 = [(IKAppDataStorage *)self storageQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__IKAppDataStorage_keyAtIndex___block_invoke;
  block[3] = &unk_1E6DE4040;
  block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v5, block);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __31__IKAppDataStorage_keyAtIndex___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 48);
  v3 = [*(id *)(a1 + 32) storageDict];
  unint64_t v4 = [v3 count];

  if (v2 < v4)
  {
    id v9 = [*(id *)(a1 + 32) storageDict];
    v5 = [v9 allKeys];
    uint64_t v6 = [v5 objectAtIndex:*(void *)(a1 + 48)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (id)getDataForKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  if ([v4 length])
  {
    v5 = [(IKAppDataStorage *)self storageQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__IKAppDataStorage_getDataForKey___block_invoke;
    block[3] = &unk_1E6DE4068;
    uint64_t v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(v5, block);
  }
  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __34__IKAppDataStorage_getDataForKey___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) storageDict];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)setData:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length] && objc_msgSend(v6, "length"))
  {
    id v8 = [(IKAppDataStorage *)self storageQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__IKAppDataStorage_setData_forKey___block_invoke;
    block[3] = &unk_1E6DE4090;
    block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v8, block);
  }
  return 0;
}

void __35__IKAppDataStorage_setData_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) storageDict];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];

  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = [v3 storageDict];
  id v4 = (void *)[v5 copy];
  [v3 _saveDict:v4];
}

- (void)removeDataForKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(IKAppDataStorage *)self storageQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__IKAppDataStorage_removeDataForKey___block_invoke;
    v6[3] = &unk_1E6DE40B8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __37__IKAppDataStorage_removeDataForKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) storageDict];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) storageDict];
    [v4 removeObjectForKey:*(void *)(a1 + 40)];

    id v5 = *(void **)(a1 + 32);
    id v7 = [v5 storageDict];
    id v6 = (void *)[v7 copy];
    [v5 _saveDict:v6];
  }
}

- (void)clear
{
  uint64_t v3 = [(IKAppDataStorage *)self storageQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__IKAppDataStorage_clear__block_invoke;
  block[3] = &unk_1E6DE3CC0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __25__IKAppDataStorage_clear__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) storageDict];
  [v2 removeAllObjects];

  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = [v3 storageDict];
  id v4 = (void *)[v5 copy];
  [v3 _saveDict:v4];
}

- (id)dictionaryRepresentation
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  id v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  uint64_t v3 = [(IKAppDataStorage *)self storageQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__IKAppDataStorage_dictionaryRepresentation__block_invoke;
  v6[3] = &unk_1E6DE4018;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __44__IKAppDataStorage_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) storageDict];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_saveDict:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = sStorageWriteQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__IKAppDataStorage__saveDict___block_invoke;
  block[3] = &unk_1E6DE40E0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __30__IKAppDataStorage__saveDict___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = WeakRetained[1];
    id v10 = 0;
    id v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:v4 options:0 error:&v10];
    id v6 = v10;
    if (v5)
    {
      uint64_t v7 = [WeakRetained filePath];
      char v8 = [v5 writeToFile:v7 atomically:1];

      if (v8)
      {
LABEL_9:

        goto LABEL_10;
      }
      id v9 = ITMLKitGetLogObject(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __30__IKAppDataStorage__saveDict___block_invoke_cold_2(WeakRetained, v9);
      }
    }
    else
    {
      id v9 = ITMLKitGetLogObject(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __30__IKAppDataStorage__saveDict___block_invoke_cold_1(WeakRetained, (uint64_t)v6, v9);
      }
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (NSString)filePath
{
  return self->_filePath;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSMutableDictionary)storageDict
{
  return self->_storageDict;
}

- (void)setStorageDict:(id)a3
{
}

- (OS_dispatch_queue)storageQueue
{
  return self->_storageQueue;
}

- (void)setStorageQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageQueue, 0);
  objc_storeStrong((id *)&self->_storageDict, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

- (void)initWithFilePath:(os_log_t)log identifier:.cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1E2ACE000, log, OS_LOG_TYPE_ERROR, "Failed to de-serialize merchant storage at path %@. Error: %@", (uint8_t *)&v4, 0x16u);
}

void __30__IKAppDataStorage__saveDict___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 filePath];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1E2ACE000, a3, OS_LOG_TYPE_ERROR, "Could serialize storage for path %@. Error: %@", (uint8_t *)&v6, 0x16u);
}

void __30__IKAppDataStorage__saveDict___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 filePath];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_ERROR, "Could not write storage to path %@.", (uint8_t *)&v4, 0xCu);
}

@end