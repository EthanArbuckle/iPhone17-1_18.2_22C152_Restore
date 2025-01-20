@interface IKJSStorage
- (IKAppDataStoring)appStorage;
- (IKJSStorage)initWithAppContext:(id)a3 appStorage:(id)a4;
- (NSMutableDictionary)storageDict;
- (OS_dispatch_queue)storageQueue;
- (id)getItem:(id)a3;
- (id)key:(unint64_t)a3;
- (id)keysAndValues;
- (unint64_t)length;
- (void)_verifyExternalDataStoreForKey:(id)a3;
- (void)clear;
- (void)removeItem:(id)a3;
- (void)setItem:(id)a3 :(id)a4;
- (void)setStorageDict:(id)a3;
- (void)setStorageQueue:(id)a3;
@end

@implementation IKJSStorage

- (IKJSStorage)initWithAppContext:(id)a3 appStorage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)IKJSStorage;
  v8 = [(IKJSObject *)&v20 initWithAppContext:v6];
  v9 = v8;
  if (v8)
  {
    id v10 = objc_storeWeak((id *)&v8->_appStorage, v7);
    v9->_flags.usesExternalDataStore = v7 != 0;

    v9->_flags.externalStorageHasDictionaryRepresentation = objc_opt_respondsToSelector() & 1;
    if (!v9->_flags.usesExternalDataStore)
    {
      v11 = NSString;
      v12 = [v6 app];
      v13 = [v12 appIdentifier];
      id v14 = [v11 stringWithFormat:@"%@_Storage_Queue", v13];
      dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], 0);
      storageQueue = v9->_storageQueue;
      v9->_storageQueue = (OS_dispatch_queue *)v15;

      uint64_t v17 = objc_opt_new();
      storageDict = v9->_storageDict;
      v9->_storageDict = (NSMutableDictionary *)v17;
    }
  }

  return v9;
}

- (unint64_t)length
{
  if (self->_flags.usesExternalDataStore)
  {
    [(IKJSStorage *)self _verifyExternalDataStoreForKey:0];
    v3 = [(IKJSStorage *)self appStorage];
    unint64_t v4 = [v3 count];

    return v4;
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v12 = 0;
    id v6 = [(IKJSStorage *)self storageQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __21__IKJSStorage_length__block_invoke;
    v8[3] = &unk_1E6DE4018;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(v6, v8);

    unint64_t v7 = v10[3];
    _Block_object_dispose(&v9, 8);
    return v7;
  }
}

void __21__IKJSStorage_length__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) storageDict];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (id)key:(unint64_t)a3
{
  if (self->_flags.usesExternalDataStore)
  {
    [(IKJSStorage *)self _verifyExternalDataStoreForKey:0];
    v5 = [(IKJSStorage *)self appStorage];
    id v6 = [v5 keyAtIndex:a3];
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__11;
    id v14 = __Block_byref_object_dispose__11;
    id v15 = 0;
    unint64_t v7 = [(IKJSStorage *)self storageQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __19__IKJSStorage_key___block_invoke;
    block[3] = &unk_1E6DE4040;
    block[5] = &v10;
    block[6] = a3;
    block[4] = self;
    dispatch_sync(v7, block);

    id v6 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  return v6;
}

void __19__IKJSStorage_key___block_invoke(uint64_t a1)
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
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (id)getItem:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_flags.usesExternalDataStore)
  {
    [(IKJSStorage *)self _verifyExternalDataStoreForKey:v4];
    uint64_t v6 = [(IKJSStorage *)self appStorage];
    id v7 = [v6 getDataForKey:v5];
  }
  else
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__11;
    uint64_t v17 = __Block_byref_object_dispose__11;
    id v18 = 0;
    if ([v4 length])
    {
      v8 = [(IKJSStorage *)self storageQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __23__IKJSStorage_getItem___block_invoke;
      block[3] = &unk_1E6DE4068;
      uint64_t v12 = &v13;
      block[4] = self;
      id v11 = v5;
      dispatch_sync(v8, block);
    }
    id v7 = (id)v14[5];
    _Block_object_dispose(&v13, 8);
  }
  return v7;
}

void __23__IKJSStorage_getItem___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) storageDict];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setItem:(id)a3 :(id)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_flags.usesExternalDataStore)
  {
    [(IKJSStorage *)self _verifyExternalDataStoreForKey:v6];
    v8 = [(IKJSStorage *)self appStorage];
    id v9 = [v8 getDataForKey:v6];

    uint64_t v10 = [(IKJSStorage *)self appStorage];
    uint64_t v11 = [v10 setData:v7 forKey:v6];

    if (v11 == 102)
    {
      uint64_t v12 = [(IKJSObject *)self appContext];
      [v12 setException:0 withErrorMessage:@"QuotaExceededError"];
    }
    else
    {
      id v14 = (void *)MEMORY[0x1E4F1CA60];
      v22[0] = @"IKJSStorageKeyKey";
      v22[1] = @"IKJSStorageValueKey";
      v23[0] = v6;
      v23[1] = v7;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
      v16 = [v14 dictionaryWithDictionary:v15];

      if (v9)
      {
        [v16 setObject:v9 forKey:@"IKJSStorageOldValueKey"];
        uint64_t v17 = @"IKJSStorageItemUpdatedNotification";
      }
      else
      {
        uint64_t v17 = @"IKJSStorageItemAddedNotification";
      }
      id v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v18 postNotificationName:v17 object:self userInfo:v16];
    }
  }
  else if ([v6 length] && objc_msgSend(v7, "length"))
  {
    uint64_t v13 = [(IKJSStorage *)self storageQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __24__IKJSStorage_setItem::__block_invoke;
    v19[3] = &unk_1E6DE4090;
    v19[4] = self;
    id v20 = v6;
    id v21 = v7;
    dispatch_async(v13, v19);
  }
}

void __24__IKJSStorage_setItem::__block_invoke(uint64_t a1)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) storageDict];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) storageDict];
  [v4 setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];

  id v5 = (void *)MEMORY[0x1E4F1CA60];
  v11[0] = @"IKJSStorageKeyKey";
  v11[1] = @"IKJSStorageValueKey";
  uint64_t v6 = *(void *)(a1 + 48);
  v12[0] = *(void *)(a1 + 40);
  v12[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v8 = [v5 dictionaryWithDictionary:v7];

  if (v3)
  {
    [v8 setObject:v3 forKey:@"IKJSStorageOldValueKey"];
    id v9 = @"IKJSStorageItemUpdatedNotification";
  }
  else
  {
    id v9 = @"IKJSStorageItemAddedNotification";
  }
  uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:v9 object:*(void *)(a1 + 32) userInfo:v8];
}

- (void)removeItem:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (self->_flags.usesExternalDataStore)
  {
    [(IKJSStorage *)self _verifyExternalDataStoreForKey:v4];
    uint64_t v6 = [(IKJSStorage *)self appStorage];
    [v6 removeDataForKey:v5];

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v12 = @"IKJSStorageKeyKey";
    v13[0] = v5;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    [v7 postNotificationName:@"IKJSStorageItemRemovedNotification" object:self userInfo:v8];
  }
  else if ([v4 length])
  {
    id v9 = [(IKJSStorage *)self storageQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__IKJSStorage_removeItem___block_invoke;
    block[3] = &unk_1E6DE40B8;
    block[4] = self;
    id v11 = v5;
    dispatch_async(v9, block);
  }
}

void __26__IKJSStorage_removeItem___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) storageDict];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) storageDict];
    [v4 removeObjectForKey:*(void *)(a1 + 40)];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v9 = @"IKJSStorageKeyKey";
    v10[0] = v6;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v5 postNotificationName:@"IKJSStorageItemRemovedNotification" object:v7 userInfo:v8];
  }
}

- (void)clear
{
  if (self->_flags.usesExternalDataStore)
  {
    [(IKJSStorage *)self _verifyExternalDataStoreForKey:0];
    uint64_t v3 = [(IKJSStorage *)self appStorage];
    [v3 clear];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"IKJSStorageItemsClearedNotification" object:self];
  }
  else
  {
    id v4 = [(IKJSStorage *)self storageQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __20__IKJSStorage_clear__block_invoke;
    block[3] = &unk_1E6DE3CC0;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

void __20__IKJSStorage_clear__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) storageDict];
  [v2 removeAllObjects];

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"IKJSStorageItemsClearedNotification" object:*(void *)(a1 + 32)];
}

- (id)keysAndValues
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__11;
  uint64_t v15 = __Block_byref_object_dispose__11;
  id v16 = 0;
  if (self->_flags.usesExternalDataStore)
  {
    if (self->_flags.externalStorageHasDictionaryRepresentation)
    {
      id v3 = [(IKJSStorage *)self appStorage];
      id v4 = [v3 dictionaryRepresentation];
      uint64_t v5 = [v4 copy];
      uint64_t v6 = (void *)v12[5];
      v12[5] = v5;
    }
  }
  else
  {
    uint64_t v7 = [(IKJSStorage *)self storageQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __28__IKJSStorage_keysAndValues__block_invoke;
    v10[3] = &unk_1E6DE4018;
    v10[4] = self;
    v10[5] = &v11;
    dispatch_sync(v7, v10);
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __28__IKJSStorage_keysAndValues__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)_verifyExternalDataStoreForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IKJSStorage *)self appStorage];

  if (!v5)
  {
    if (v4)
    {
      uint64_t v6 = [NSString stringWithFormat:@"; lost data for %@", v4];
    }
    else
    {
      uint64_t v6 = &stru_1F3E09950;
    }
    uint64_t v7 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[IKJSStorage _verifyExternalDataStoreForKey:]((uint64_t)v6, v7);
    }
  }
}

- (IKAppDataStoring)appStorage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appStorage);
  return (IKAppDataStoring *)WeakRetained;
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
  objc_destroyWeak((id *)&self->_appStorage);
}

- (void)_verifyExternalDataStoreForKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_ERROR, "Missing app data store%@", (uint8_t *)&v2, 0xCu);
}

@end