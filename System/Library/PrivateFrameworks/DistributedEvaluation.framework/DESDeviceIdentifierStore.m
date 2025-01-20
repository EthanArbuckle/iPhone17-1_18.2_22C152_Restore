@interface DESDeviceIdentifierStore
- (DESDeviceIdentifierStore)init;
- (DESDeviceIdentifierStore)initWithStoreURL:(id)a3;
- (NSMutableDictionary)deviceIdentifiers;
- (NSURL)storeURL;
- (id)identifierForBundleId:(id)a3;
- (void)_readIdentifierStore;
- (void)_writeIdentifierStore;
- (void)setDeviceIdentifiers:(id)a3;
- (void)setStoreURL:(id)a3;
@end

@implementation DESDeviceIdentifierStore

- (DESDeviceIdentifierStore)init
{
  v3 = DESDeviceIdentifierStoreURL();
  v4 = [(DESDeviceIdentifierStore *)self initWithStoreURL:v3];

  return v4;
}

- (DESDeviceIdentifierStore)initWithStoreURL:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DESDeviceIdentifierStore;
  v6 = [(DESDeviceIdentifierStore *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeURL, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.distributed-evaluation.identifier-store", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = v7->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__DESDeviceIdentifierStore_initWithStoreURL___block_invoke;
    block[3] = &unk_1E63C1938;
    v13 = v7;
    dispatch_async(v10, block);
  }
  return v7;
}

uint64_t __45__DESDeviceIdentifierStore_initWithStoreURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _readIdentifierStore];
}

- (id)identifierForBundleId:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  id v5 = [NSString stringWithFormat:@"dodML_%@_identifier", v4];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__DESDeviceIdentifierStore_identifierForBundleId___block_invoke;
  block[3] = &unk_1E63C1960;
  v22 = &v23;
  void block[4] = self;
  id v7 = v5;
  id v21 = v7;
  dispatch_sync(queue, block);
  dispatch_queue_t v8 = (void *)v24[5];
  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v10 UUIDString];
    v12 = (void *)v24[5];
    v24[5] = v11;

    v13 = self->_queue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__DESDeviceIdentifierStore_identifierForBundleId___block_invoke_2;
    v15[3] = &unk_1E63C1988;
    id v16 = v4;
    v17 = self;
    v19 = &v23;
    id v18 = v7;
    dispatch_async(v13, v15);
    id v9 = (id)v24[5];
  }
  _Block_object_dispose(&v23, 8);

  return v9;
}

uint64_t __50__DESDeviceIdentifierStore_identifierForBundleId___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) objectForKey:a1[5]];

  return MEMORY[0x1F41817F8]();
}

uint64_t __50__DESDeviceIdentifierStore_identifierForBundleId___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1BECCB000, v2, OS_LOG_TYPE_INFO, "Saving new DES identifier for: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 24) setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKey:*(void *)(a1 + 48)];
  return [*(id *)(a1 + 40) _writeIdentifierStore];
}

- (void)_readIdentifierStore
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "Failed to read DES identifier data because %@", (uint8_t *)&v2, 0xCu);
}

- (void)_writeIdentifierStore
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:self->_deviceIdentifiers];
  id v10 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:&v10];
  int v5 = v10;
  uint64_t v6 = v5;
  if (v4)
  {
    storeURL = self->_storeURL;
    id v9 = v5;
    [v4 writeToURL:storeURL options:0x40000000 error:&v9];
    dispatch_queue_t v8 = v6;
    uint64_t v6 = v9;
  }
  else
  {
    dispatch_queue_t v8 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1BECCB000, v8, OS_LOG_TYPE_DEFAULT, "Could not write new DES identifier file because %@", buf, 0xCu);
    }
  }
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (void)setStoreURL:(id)a3
{
}

- (NSMutableDictionary)deviceIdentifiers
{
  return self->_deviceIdentifiers;
}

- (void)setDeviceIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end