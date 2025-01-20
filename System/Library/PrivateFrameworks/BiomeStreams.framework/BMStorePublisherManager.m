@interface BMStorePublisherManager
- (BMStorePublisherManager)initWithStreamIdentifier:(id)a3 streamConfig:(id)a4 accessClient:(id)a5 eventDataClass:(Class)a6 useCase:(id)a7;
- (id)_createStreamReaderForRemoteName:(id)a3 eventDataClass:(Class)a4;
- (id)_publisherForDevice:(id)a3 options:(id)a4;
- (id)_publishersForDevices:(id)a3 includeLocal:(BOOL)a4 options:(id)a5;
- (id)_streamReaderWithRemoteName:(id)a3;
- (id)publisherWithOptions:(id)a3;
- (id)publishersForDevices:(id)a3 includeLocal:(BOOL)a4 options:(id)a5 pipeline:(id)a6;
@end

@implementation BMStorePublisherManager

void __55__BMStorePublisherManager__streamReaderWithRemoteName___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  if (*(void *)(a1 + 32))
  {
    v3 = [v15 remoteDatastores];
    v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

    if (!v4)
    {
      v5 = [*(id *)(a1 + 40) _createStreamReaderForRemoteName:*(void *)(a1 + 32) eventDataClass:*(void *)(*(void *)(a1 + 40) + 32)];
      v6 = [v15 remoteDatastores];
      [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];
    }
    v7 = [v15 remoteDatastores];
    uint64_t v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    v11 = [v15 localDatastore];

    if (!v11)
    {
      v12 = [*(id *)(a1 + 40) _createStreamReaderForRemoteName:0 eventDataClass:*(void *)(*(void *)(a1 + 40) + 32)];
      [v15 setLocalDatastore:v12];
    }
    uint64_t v13 = [v15 localDatastore];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    v7 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

- (id)_createStreamReaderForRemoteName:(id)a3 eventDataClass:(Class)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F50298];
  id v7 = a3;
  id v8 = [v6 alloc];
  streamIdentifier = self->_streamIdentifier;
  v10 = (void *)[(BMStoreConfig *)self->_config copyWithRemoteName:v7];

  v11 = (void *)[v8 initWithStream:streamIdentifier config:v10 eventDataClass:a4 useCase:self->_useCase];

  return v11;
}

- (id)publishersForDevices:(id)a3 includeLocal:(BOOL)a4 options:(id)a5 pipeline:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  v11 = [(BMStorePublisherManager *)self _publishersForDevices:a3 includeLocal:v7 options:a5];
  v12 = v11;
  if (v10)
  {
    uint64_t v13 = objc_msgSend(v11, "_pas_mappedArrayWithTransform:", v10);

    v12 = (void *)v13;
  }
  uint64_t v14 = [[BMPublishers alloc] initWithPublishers:v12];

  return v14;
}

- (id)_publishersForDevices:(id)a3 includeLocal:(BOOL)a4 options:(id)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = -[BMStorePublisherManager _publisherForDevice:options:](self, "_publisherForDevice:options:", *(void *)(*((void *)&v19 + 1) + 8 * i), v9, (void)v19);
        if (v16) {
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  if (v6)
  {
    v17 = [(BMStorePublisherManager *)self _publisherForDevice:0 options:v9];
    if (v17) {
      [v10 addObject:v17];
    }
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedState, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_accessClient, 0);
  objc_storeStrong((id *)&self->_streamIdentifier, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

- (id)publisherWithOptions:(id)a3
{
  return [(BMStorePublisherManager *)self _publisherForDevice:0 options:a3];
}

- (BMStorePublisherManager)initWithStreamIdentifier:(id)a3 streamConfig:(id)a4 accessClient:(id)a5 eventDataClass:(Class)a6 useCase:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)BMStorePublisherManager;
  v16 = [(BMStorePublisherManager *)&v26 init];
  if (v16)
  {
    v17 = [v13 remoteName];

    if (v17)
    {
      v18 = __biome_log_for_category();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[BMStorePublisherManager initWithStreamIdentifier:streamConfig:accessClient:eventDataClass:useCase:](v18);
      }
    }
    objc_storeStrong((id *)&v16->_config, a4);
    uint64_t v19 = [v12 copy];
    streamIdentifier = v16->_streamIdentifier;
    v16->_streamIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v16->_accessClient, a5);
    v16->_eventDataClass = a6;
    objc_storeStrong((id *)&v16->_useCase, a7);
    id v21 = objc_alloc(MEMORY[0x1E4F93B70]);
    long long v22 = objc_opt_new();
    uint64_t v23 = [v21 initWithGuardedData:v22];
    protectedState = v16->_protectedState;
    v16->_protectedState = (_PASLock *)v23;
  }
  return v16;
}

- (id)_publisherForDevice:(id)a3 options:(id)a4
{
  id v6 = a4;
  BOOL v7 = [a3 deviceIdentifier];
  id v8 = [(BMStorePublisherManager *)self _streamReaderWithRemoteName:v7];

  id v9 = [[BPSBiomeStorePublisher alloc] initWithStreamDatastoreReader:v8 streamsAccessClient:self->_accessClient];
  id v10 = [v6 startDate];

  if (v10)
  {
    id v11 = [v6 startDate];
    [v11 timeIntervalSinceReferenceDate];
    id v12 = -[BPSBiomeStorePublisher withStartTime:](v9, "withStartTime:");
  }
  id v13 = [v6 endDate];

  if (v13)
  {
    id v14 = [v6 endDate];
    [v14 timeIntervalSinceReferenceDate];
    id v15 = -[BPSBiomeStorePublisher withEndTime:](v9, "withEndTime:");
  }
  v16 = [v6 indexSearch];

  if (v16)
  {
    v17 = [v6 indexSearch];
    id v18 = [(BPSBiomeStorePublisher *)v9 withIndexSearch:v17];
  }
  if ([v6 maxEvents]) {
    id v19 = -[BPSBiomeStorePublisher withMaxEvents:](v9, "withMaxEvents:", [v6 maxEvents]);
  }
  if ([v6 lastN]) {
    id v20 = -[BPSBiomeStorePublisher withLastEvents:](v9, "withLastEvents:", [v6 lastN]);
  }
  if ([v6 reversed]) {
    id v21 = [(BPSBiomeStorePublisher *)v9 reverse];
  }

  return v9;
}

- (id)_streamReaderWithRemoteName:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  protectedState = self->_protectedState;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__BMStorePublisherManager__streamReaderWithRemoteName___block_invoke;
  v9[3] = &unk_1E55D6970;
  id v6 = v4;
  id v10 = v6;
  id v11 = self;
  id v12 = &v13;
  [(_PASLock *)protectedState runWithLockAcquired:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

- (void)initWithStreamIdentifier:(os_log_t)log streamConfig:accessClient:eventDataClass:useCase:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "Warning: instantiating a BMStorePublisherManager with a config which already specifies a remote", v1, 2u);
}

@end