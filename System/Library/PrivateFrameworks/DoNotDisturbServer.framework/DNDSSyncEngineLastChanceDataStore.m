@interface DNDSSyncEngineLastChanceDataStore
- (DNDSSyncEngineLastChanceDataStore)init;
- (DNDSSyncEngineLastChanceDataStore)initWithURL:(id)a3;
- (NSDictionary)records;
- (id)_decodeRecordFromData:(id)a3;
- (id)_encodedDataFromRecord:(id)a3;
- (id)recordWithID:(id)a3;
- (id)recordsWithZoneID:(id)a3;
- (void)_queue_read;
- (void)_queue_write;
- (void)addRecord:(id)a3;
- (void)purge;
- (void)removeRecordWithID:(id)a3;
- (void)removeRecordsWithZoneID:(id)a3;
@end

@implementation DNDSSyncEngineLastChanceDataStore

- (DNDSSyncEngineLastChanceDataStore)initWithURL:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DNDSSyncEngineLastChanceDataStore;
  v5 = [(DNDSSyncEngineLastChanceDataStore *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.donotdisturb.DNDSSyncEngineLastChanceDataStore.queue", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    v11 = v5->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__DNDSSyncEngineLastChanceDataStore_initWithURL___block_invoke;
    block[3] = &unk_1E6973540;
    v14 = v5;
    dispatch_async(v11, block);
  }
  return v5;
}

uint64_t __49__DNDSSyncEngineLastChanceDataStore_initWithURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_read");
}

- (DNDSSyncEngineLastChanceDataStore)init
{
  return [(DNDSSyncEngineLastChanceDataStore *)self initWithURL:0];
}

- (NSDictionary)records
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__DNDSSyncEngineLastChanceDataStore_records__block_invoke;
  v5[3] = &unk_1E6973518;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

uint64_t __44__DNDSSyncEngineLastChanceDataStore_records__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)recordsWithZoneID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  id v17 = [MEMORY[0x1E4F1CA48] array];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__DNDSSyncEngineLastChanceDataStore_recordsWithZoneID___block_invoke;
  block[3] = &unk_1E6974318;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__DNDSSyncEngineLastChanceDataStore_recordsWithZoneID___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1[4] + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "zoneID", (void)v11);
        int v9 = [v8 isEqual:a1[5]];

        if (v9)
        {
          id v10 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:v7];
          [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v10];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (id)recordWithID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = __Block_byref_object_copy__7;
  uint64_t v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__DNDSSyncEngineLastChanceDataStore_recordWithID___block_invoke;
  block[3] = &unk_1E6974340;
  id v10 = v4;
  long long v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __50__DNDSSyncEngineLastChanceDataStore_recordWithID___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)addRecord:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__DNDSSyncEngineLastChanceDataStore_addRecord___block_invoke;
  v7[3] = &unk_1E69735B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __47__DNDSSyncEngineLastChanceDataStore_addRecord___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v4 = [v2 recordID];
  [v3 setObject:v2 forKeyedSubscript:v4];

  uint64_t v5 = *(void **)(a1 + 32);
  return objc_msgSend(v5, "_queue_write");
}

- (void)removeRecordWithID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__DNDSSyncEngineLastChanceDataStore_removeRecordWithID___block_invoke;
  v7[3] = &unk_1E69735B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __56__DNDSSyncEngineLastChanceDataStore_removeRecordWithID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "_queue_write");
  }
}

- (void)removeRecordsWithZoneID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__DNDSSyncEngineLastChanceDataStore_removeRecordsWithZoneID___block_invoke;
  v7[3] = &unk_1E69735B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __61__DNDSSyncEngineLastChanceDataStore_removeRecordsWithZoneID___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v9 = [v8 zoneID];
        int v10 = [v9 isEqual:*(void *)(a1 + 40)];

        if (v10) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  if ([v2 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v2;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", 0, *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }

    objc_msgSend(*(id *)(a1 + 32), "_queue_write");
  }
}

- (void)purge
{
}

- (void)_queue_read
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  queue_recordsByID = self->_queue_recordsByID;
  self->_queue_recordsByID = v3;

  if (self->_url)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithContentsOfURL:");
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F1C978] array];
    }
    id v8 = v7;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = -[DNDSSyncEngineLastChanceDataStore _decodeRecordFromData:](self, "_decodeRecordFromData:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
          objc_super v15 = self->_queue_recordsByID;
          long long v16 = [v14 recordID];
          [(NSMutableDictionary *)v15 setObject:v14 forKeyedSubscript:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
}

- (void)_queue_write
{
}

- (id)_encodedDataFromRecord:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28DB0];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initRequiringSecureCoding:1];
  [v4 encodeWithCoder:v5];

  uint64_t v6 = [v5 encodedData];

  return v6;
}

- (id)_decodeRecordFromData:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initForReadingFromData:v4 error:0];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithCoder:v5];
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_queue_recordsByID, 0);
}

@end