@interface BMStreamBase
+ (BOOL)_atLeastOneSegmentFileInDirectory:(id)a3 fileManager:(id)a4;
- (BMSQLSchema)schema;
- (BMStoreStream)storeStream;
- (BMStreamBase)initWithIdentifier:(id)a3 schema:(id)a4 configuration:(id)a5;
- (BMStreamConfiguration)configuration;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (id)DSLPublisher;
- (id)DSLPublisherWithUseCase:(id)a3;
- (id)_storeStreamForAccount:(id)a3 useCase:(id)a4;
- (id)_storeStreamForUseCase:(id)a3;
- (id)description;
- (id)pruner;
- (id)prunerForDevice:(id)a3;
- (id)publisher;
- (id)publisherForAccount:(id)a3 device:(id)a4 withUseCase:(id)a5;
- (id)publisherForAccount:(id)a3 device:(id)a4 withUseCase:(id)a5 options:(id)a6;
- (id)publisherForDevice:(id)a3 withUseCase:(id)a4;
- (id)publisherForDevice:(id)a3 withUseCase:(id)a4 options:(id)a5;
- (id)publisherWithOptions:(id)a3;
- (id)publisherWithUseCase:(id)a3;
- (id)publisherWithUseCase:(id)a3 options:(id)a4;
- (id)publishersForAccounts:(id)a3 deviceTypes:(unint64_t)a4 includeLocal:(BOOL)a5 options:(id)a6 useCase:(id)a7 pipeline:(id)a8;
- (id)publishersForDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6;
- (id)publishersForDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10;
- (id)publishersForDevices:(id)a3 withUseCase:(id)a4 startTime:(double)a5 includeLocal:(BOOL)a6 pipeline:(id)a7;
- (id)publishersForDevices:(id)a3 withUseCase:(id)a4 startTime:(id)a5 endTime:(id)a6 maxEvents:(id)a7 lastN:(id)a8 reversed:(BOOL)a9 includeLocal:(BOOL)a10 pipeline:(id)a11;
- (id)publishersForRemoteDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6;
- (id)publishersForRemoteDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10;
- (id)remoteDevices;
- (id)remoteDevicesForAccount:(id)a3 error:(id *)a4;
- (id)remoteDevicesWithError:(id *)a3;
- (id)sharedDeviceAccountsWithError:(id *)a3;
- (id)sharedDeviceAccountsWithUseCase:(id)a3;
- (id)source;
- (id)storeStreamWithLegacyClass:(Class)a3;
- (id)subscriptionDSLPublisher;
- (id)subscriptionDSLPublisherWithUseCase:(id)a3;
- (id)subscriptionPruner;
- (id)subscriptionPublisherWithOptions:(id)a3;
- (id)subscriptionPublisherWithUseCase:(id)a3 options:(id)a4;
- (id)subscriptionSource;
- (id)subscriptionStoreStreamForUseCase:(id)a3;
- (id)tombstoneDSLPublisherWithUseCase:(id)a3;
- (id)tombstonePublisherWithUseCase:(id)a3 account:(id)a4 device:(id)a5 options:(id)a6;
- (id)tombstonePublisherWithUseCase:(id)a3 device:(id)a4 options:(id)a5;
- (id)tombstonePublisherWithUseCase:(id)a3 options:(id)a4;
- (id)tombstoneStoreStreamForUseCase:(id)a3;
- (id)tombstoneStoreStreamForUseCase:(id)a3 account:(id)a4;
- (void)_executePruningPolicyOnSubscriptionSubstream;
- (void)_pruneDisabledSubstreams;
- (void)_pruneEmptyRemotesNotRecentlyModified;
- (void)executePruningPolicyForAccount:(id)a3;
@end

@implementation BMStreamBase

- (BMSQLSchema)schema
{
  return self->_schema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_storeStream, 0);
}

- (BMStreamBase)initWithIdentifier:(id)a3 schema:(id)a4 configuration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BMStreamBase;
  v11 = [(BMStreamBase *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    uint64_t v13 = [v8 copy];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    objc_storeStrong((id *)&v12->_schema, a4);
    objc_storeStrong((id *)&v12->_configuration, a5);
  }

  return v12;
}

- (id)publisherWithOptions:(id)a3
{
  return [(BMStreamBase *)self publisherWithUseCase:*MEMORY[0x1E4F4FAF8] options:a3];
}

- (BMStreamConfiguration)configuration
{
  return self->_configuration;
}

- (id)publisherWithUseCase:(id)a3 options:(id)a4
{
  id v6 = a4;
  v7 = [(BMStreamBase *)self _storeStreamForUseCase:a3];
  id v8 = [v7 _publisherWithOptions:v6];

  return v8;
}

- (id)_storeStreamForUseCase:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  storeStream = self->_storeStream;
  if (!storeStream)
  {
LABEL_4:
    v11 = [BMStoreStream alloc];
    id v8 = [(BMStreamConfiguration *)self->_configuration streamIdentifier];
    v12 = [(BMStreamConfiguration *)self->_configuration storeConfig];
    uint64_t v13 = [(BMStoreStream *)v11 initWithStreamIdentifier:v8 storeConfig:v12 streamType:2 eventDataClass:[(BMStreamConfiguration *)self->_configuration eventClass] useCase:v4];
    v14 = self->_storeStream;
    self->_storeStream = v13;

    goto LABEL_5;
  }
  id v7 = [(BMStoreStream *)storeStream useCase];
  id v8 = v4;
  if (v7 != v4)
  {
    id v9 = [(BMStoreStream *)self->_storeStream useCase];
    char v10 = [v9 isEqualToString:v4];

    if (v10) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_5:

LABEL_6:
  v15 = self->_storeStream;
  os_unfair_lock_unlock(p_lock);

  return v15;
}

- (id)publisher
{
  return [(BMStreamBase *)self publisherWithUseCase:*MEMORY[0x1E4F4FAF8] options:0];
}

- (id)source
{
  v2 = [(BMStreamBase *)self _storeStreamForUseCase:*MEMORY[0x1E4F4FB20]];
  v3 = [v2 source];

  return v3;
}

- (id)storeStreamWithLegacyClass:(Class)a3
{
  v5 = [BMStoreStream alloc];
  id v6 = [(BMStreamConfiguration *)self->_configuration streamIdentifier];
  id v7 = [(BMStreamConfiguration *)self->_configuration storeConfig];
  id v8 = [(BMStoreStream *)v5 initWithStreamIdentifier:v6 storeConfig:v7 streamType:2 eventDataClass:a3 useCase:*MEMORY[0x1E4F4FAF8]];

  return v8;
}

- (id)tombstoneStoreStreamForUseCase:(id)a3
{
  id v4 = a3;
  v5 = [(BMStreamBase *)self configuration];
  int v6 = [v5 enableTombstoneSubstream];

  if (v6)
  {
    id v7 = [(BMStreamBase *)self identifier];
    id v8 = [v7 stringByAppendingString:@":tombstones"];

    id v9 = [BMStoreStream alloc];
    char v10 = [(BMStreamBase *)self configuration];
    v11 = [v10 storeConfig];
    v12 = [v11 tombstonesConfig];
    uint64_t v13 = [(BMStoreStream *)v9 initWithStreamIdentifier:v8 storeConfig:v12 streamType:2 eventDataClass:objc_opt_class() useCase:v4];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)tombstoneStoreStreamForUseCase:(id)a3 account:(id)a4
{
  return 0;
}

- (id)tombstonePublisherWithUseCase:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BMStreamBase *)self configuration];
  int v9 = [v8 enableTombstoneSubstream];

  if (v9)
  {
    char v10 = [(BMStreamBase *)self tombstoneStoreStreamForUseCase:v6];
    v11 = [v10 _publisherWithOptions:v7];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)tombstonePublisherWithUseCase:(id)a3 device:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(BMStreamBase *)self configuration];
  int v12 = [v11 enableTombstoneSubstream];

  if (v12)
  {
    uint64_t v13 = [(BMStreamBase *)self tombstoneStoreStreamForUseCase:v8];
    v14 = [v13 _publisherForDevice:v9 options:v10];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)tombstonePublisherWithUseCase:(id)a3 account:(id)a4 device:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(BMStreamBase *)self configuration];
  int v15 = [v14 enableTombstoneSubstream];

  if (v15)
  {
    objc_super v16 = [(BMStreamBase *)self tombstoneStoreStreamForUseCase:v10 account:v11];
    v17 = [v16 _publisherForDevice:v12 options:v13];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)tombstoneDSLPublisherWithUseCase:(id)a3
{
  id v4 = a3;
  v5 = [(BMStreamBase *)self configuration];
  int v6 = [v5 enableTombstoneSubstream];

  if (v6)
  {
    id v7 = [(BMStreamBase *)self identifier];
    id v8 = [v7 stringByAppendingString:@":tombstones"];

    id v9 = [[BMDSLStreamPublisher alloc] initWithIdentifier:v8 streamType:2 useCase:v4 eventDataClass:objc_opt_class()];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BMStoreStream)storeStream
{
  return (BMStoreStream *)[(BMStreamBase *)self _storeStreamForUseCase:*MEMORY[0x1E4F4FAF8]];
}

- (id)_storeStreamForAccount:(id)a3 useCase:(id)a4
{
  return 0;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<BMStream identifier:%@>", self->_identifier];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(BMStreamBase *)self identifier];
    id v7 = [v5 identifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)publisherWithUseCase:(id)a3
{
  return [(BMStreamBase *)self publisherWithUseCase:a3 options:0];
}

- (id)DSLPublisher
{
  return [(BMStreamBase *)self DSLPublisherWithUseCase:*MEMORY[0x1E4F4FAF8]];
}

- (id)DSLPublisherWithUseCase:(id)a3
{
  id v4 = a3;
  id v5 = [BMDSLStreamPublisher alloc];
  int v6 = [(BMStreamBase *)self identifier];
  id v7 = [(BMDSLStreamPublisher *)v5 initWithIdentifier:v6 streamType:2 useCase:v4 eventDataClass:[(BMStreamConfiguration *)self->_configuration eventClass]];

  return v7;
}

- (id)pruner
{
  v2 = [(BMStreamBase *)self _storeStreamForUseCase:*MEMORY[0x1E4F4FB10]];
  v3 = [[BMPruner alloc] initWithStoreStream:v2 remote:0];

  return v3;
}

- (id)prunerForDevice:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F4FB10];
  id v5 = a3;
  int v6 = [(BMStreamBase *)self _storeStreamForUseCase:v4];
  id v7 = [BMPruner alloc];
  char v8 = [v5 deviceIdentifier];

  id v9 = [(BMPruner *)v7 initWithStoreStream:v6 remote:v8];

  return v9;
}

- (id)publishersForDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6
{
  BOOL v6 = a5;
  uint64_t v10 = *MEMORY[0x1E4F4FAF8];
  id v11 = a6;
  id v12 = a3;
  id v13 = [(BMStreamBase *)self _storeStreamForUseCase:v10];
  v14 = [v13 publishersForDevices:v12 startTime:v6 includeLocal:v11 pipeline:a4];

  return v14;
}

- (id)publishersForDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10
{
  BOOL v10 = a8;
  uint64_t v17 = *MEMORY[0x1E4F4FAF8];
  id v18 = a10;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = [(BMStreamBase *)self _storeStreamForUseCase:v17];
  LOBYTE(v27) = a9;
  v25 = [v24 publishersForDevices:v23 startTime:v22 endTime:v21 maxEvents:v20 lastN:v19 reversed:v10 includeLocal:v27 pipeline:v18];

  return v25;
}

- (id)publishersForDevices:(id)a3 withUseCase:(id)a4 startTime:(double)a5 includeLocal:(BOOL)a6 pipeline:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a3;
  v14 = [(BMStreamBase *)self _storeStreamForUseCase:a4];
  int v15 = [v14 publishersForDevices:v13 startTime:v7 includeLocal:v12 pipeline:a5];

  return v15;
}

- (id)publishersForDevices:(id)a3 withUseCase:(id)a4 startTime:(id)a5 endTime:(id)a6 maxEvents:(id)a7 lastN:(id)a8 reversed:(BOOL)a9 includeLocal:(BOOL)a10 pipeline:(id)a11
{
  id v18 = a11;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a3;
  v24 = [(BMStreamBase *)self _storeStreamForUseCase:a4];
  LOBYTE(v27) = a10;
  v25 = [v24 publishersForDevices:v23 startTime:v22 endTime:v21 maxEvents:v20 lastN:v19 reversed:a9 includeLocal:v27 pipeline:v18];

  return v25;
}

- (id)publisherForDevice:(id)a3 withUseCase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [(BMStreamBase *)self _storeStreamForUseCase:v6];
  id v9 = [v8 publisherForDevice:v7 withUseCase:v6];

  return v9;
}

- (id)publisherForDevice:(id)a3 withUseCase:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(BMStreamBase *)self _storeStreamForUseCase:v9];
  id v12 = [v11 publisherForDevice:v10 withUseCase:v9 options:v8];

  return v12;
}

- (id)remoteDevicesWithError:(id *)a3
{
  uint64_t v4 = [(BMStreamBase *)self _storeStreamForUseCase:*MEMORY[0x1E4F4FAF8]];
  id v5 = [v4 remoteDevicesWithError:a3];

  return v5;
}

- (id)remoteDevicesForAccount:(id)a3 error:(id *)a4
{
  uint64_t v6 = *MEMORY[0x1E4F4FAF8];
  id v7 = a3;
  id v8 = [(BMStreamBase *)self _storeStreamForUseCase:v6];
  id v9 = [v8 remoteDevicesForAccount:v7 error:a4];

  return v9;
}

- (id)publishersForRemoteDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10
{
  id v17 = a10;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_5);
  BYTE1(v25) = a9;
  LOBYTE(v25) = a8;
  id v23 = -[BMStreamBase publishersForDevices:withUseCase:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:](self, "publishersForDevices:withUseCase:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:", v22, *MEMORY[0x1E4F4FAF8], v21, v20, v19, v18, v25, v17);

  return v23;
}

id __108__BMStreamBase_publishersForRemoteDevices_startTime_endTime_maxEvents_lastN_reversed_includeLocal_pipeline___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F504E8];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithDeviceIdentifier:v3 idsDeviceIdentifier:0 name:0 model:0 platform:0];

  return v4;
}

- (id)publishersForRemoteDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_63);
  id v12 = [(BMStreamBase *)self publishersForDevices:v11 withUseCase:*MEMORY[0x1E4F4FAF8] startTime:v6 includeLocal:v10 pipeline:a4];

  return v12;
}

id __75__BMStreamBase_publishersForRemoteDevices_startTime_includeLocal_pipeline___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F504E8];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithDeviceIdentifier:v3 idsDeviceIdentifier:0 name:0 model:0 platform:0];

  return v4;
}

- (id)remoteDevices
{
  v2 = [(BMStreamBase *)self remoteDevicesWithError:0];
  id v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_66);

  return v3;
}

uint64_t __29__BMStreamBase_remoteDevices__block_invoke(uint64_t a1, void *a2)
{
  return [a2 deviceIdentifier];
}

- (id)sharedDeviceAccountsWithUseCase:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F4FB48];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithUseCase:v4];

  if (v5)
  {
    BOOL v6 = [v5 accounts];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)sharedDeviceAccountsWithError:(id *)a3
{
  return [(BMStreamBase *)self sharedDeviceAccountsWithUseCase:*MEMORY[0x1E4F4FAF8]];
}

- (id)publishersForAccounts:(id)a3 deviceTypes:(unint64_t)a4 includeLocal:(BOOL)a5 options:(id)a6 useCase:(id)a7 pipeline:(id)a8
{
  BOOL v31 = a5;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v34 = a6;
  id v12 = a7;
  id v13 = (void (**)(id, void))a8;
  v33 = v12;
  v32 = (void *)[objc_alloc(MEMORY[0x1E4F4FB48]) initWithUseCase:v12];
  if (v32)
  {
    v14 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v27 = v11;
    obuint64_t j = v11;
    uint64_t v35 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v35)
    {
      uint64_t v29 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v44 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          v38 = objc_msgSend(v32, "deviceIdentifiersForAccount:", v16, v27);
          uint64_t v17 = objc_msgSend(v38, "_pas_mappedArrayWithTransform:", &__block_literal_global_70);
          v36 = [(BMStreamBase *)self _storeStreamForAccount:v16 useCase:v33];
          v37 = (void *)v17;
          id v18 = [v36 _publishersForDevices:v17 includeLocal:v31 options:v34];
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id v19 = [v18 publishers];
          uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v40;
            do
            {
              for (uint64_t j = 0; j != v21; ++j)
              {
                if (*(void *)v40 != v22) {
                  objc_enumerationMutation(v19);
                }
                v24 = v13[2](v13, *(void *)(*((void *)&v39 + 1) + 8 * j));
                [v14 addObject:v24];
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }
            while (v21);
          }
        }
        uint64_t v35 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v35);
    }

    uint64_t v25 = [[BMSharedPublishers alloc] initWithPublishers:v14];
    id v11 = v27;
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

id __88__BMStreamBase_publishersForAccounts_deviceTypes_includeLocal_options_useCase_pipeline___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F504E8];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithDeviceIdentifier:v3 idsDeviceIdentifier:0 name:0 model:0 platform:0];

  return v4;
}

- (id)publisherForAccount:(id)a3 device:(id)a4 withUseCase:(id)a5
{
  id v8 = a4;
  id v9 = [(BMStreamBase *)self _storeStreamForAccount:a3 useCase:a5];
  id v10 = objc_opt_new();
  id v11 = [v9 _publisherForDevice:v8 options:v10];

  return v11;
}

- (id)publisherForAccount:(id)a3 device:(id)a4 withUseCase:(id)a5 options:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = [(BMStreamBase *)self _storeStreamForAccount:a3 useCase:a5];
  id v13 = [v12 _publisherForDevice:v11 options:v10];

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)executePruningPolicyForAccount:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = [(BMStreamBase *)self _storeStreamForUseCase:*MEMORY[0x1E4F4FB08]];
  BOOL v6 = [v5 storeConfig];
  id v7 = [v6 pruningPolicy];

  if (!v7)
  {
    id v8 = __biome_log_for_category();
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x2020000000;
    char v16 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__BMStreamBase_PeriodicMaintenance__executePruningPolicyForAccount___block_invoke;
    block[3] = &unk_1E55D6DA8;
    block[4] = &buf;
    if (executePruningPolicyForAccount__onceToken != -1) {
      dispatch_once(&executePruningPolicyForAccount__onceToken, block);
    }
    os_log_type_t v9 = *(unsigned char *)(*((void *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = [(BMStreamBase *)self identifier];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_18E67D000, v8, v9, "Tried to prune stream with no pruning policy: %@", (uint8_t *)&buf, 0xCu);
    }
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:2419200.0];
  }
  uint64_t v11 = [v7 maxStreamSize];
  if (v11 != *MEMORY[0x1E4F50260]) {
    objc_msgSend(v5, "pruneStreamBySize:", objc_msgSend(v7, "maxStreamSize"));
  }
  [v7 maxAge];
  if (v12 != *MEMORY[0x1E4F50250]) {
    [v5 pruneExpiredEventsWithBlock:&__block_literal_global_8];
  }
  if (!a3) {
    [(BMStreamBase *)self _executePruningPolicyOnSubscriptionSubstream];
  }
  [(BMStreamBase *)self _pruneEmptyRemotesNotRecentlyModified];
  [(BMStreamBase *)self _pruneDisabledSubstreams];
}

uint64_t __68__BMStreamBase_PeriodicMaintenance__executePruningPolicyForAccount___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)_executePruningPolicyOnSubscriptionSubstream
{
  id v3 = [(BMStreamBase *)self configuration];
  int v4 = [v3 enableSubscriptionSubstream];

  if (v4)
  {
    id v5 = [(BMStreamBase *)self configuration];
    BOOL v6 = [v5 storeConfig];
    id v7 = [v6 subscriptionsConfig];
    id v8 = [v7 pruningPolicy];

    os_log_type_t v9 = [(BMStreamBase *)self subscriptionStoreStreamForUseCase:*MEMORY[0x1E4F4FB10]];
    objc_msgSend(v9, "pruneStreamBySize:", objc_msgSend(v8, "maxStreamSize"));
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke;
    aBlock[3] = &unk_1E55D70F0;
    CFAbsoluteTime v27 = Current;
    id v26 = v8;
    id v11 = v8;
    double v12 = _Block_copy(aBlock);
    uint64_t v13 = *MEMORY[0x1E4F4FB08];
    v14 = objc_opt_new();
    uint64_t v15 = [(BMStreamBase *)self subscriptionPublisherWithUseCase:v13 options:v14];

    char v16 = +[BMPairedEventSession sessionPublisherWithStreamPublisher:v15 startingBlock:&__block_literal_global_8 sessionKeyBlock:&__block_literal_global_11 options:4];
    uint64_t v17 = [(BMStreamBase *)self subscriptionPruner];
    id v23 = v12;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke_4;
    v24[3] = &unk_1E55D7158;
    v24[4] = self;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke_14;
    v21[3] = &unk_1E55D7180;
    id v22 = v17;
    id v18 = v17;
    id v19 = v12;
    id v20 = (id)[v16 sinkWithCompletion:v24 receiveInput:v21];
  }
}

BOOL __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 40);
  [a2 timestamp];
  double v5 = v3 - v4;
  [*(id *)(a1 + 32) maxAge];
  return v5 > v6;
}

uint64_t __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  uint64_t v3 = [v2 starting];

  return v3;
}

id __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke_3(uint64_t a1, void *a2)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 eventBody];
  double v4 = [v3 client];
  v9[0] = v4;
  double v5 = [v2 eventBody];

  double v6 = [v5 identifier];
  v9[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];

  return v7;
}

void __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 error];
  if (v3)
  {
    double v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke_4_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

void __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke_14(uint64_t a1, void *a2)
{
  id v15 = a2;
  uint64_t v3 = [v15 endEvent];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    double v5 = [v15 endEvent];
    LODWORD(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    if (!v4) {
      goto LABEL_10;
    }
    double v6 = [v15 startEvent];

    if (v6)
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = [v15 startEvent];
      [v7 deleteStoreEvent:v8];
    }
    os_log_type_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v15 endEvent];
    goto LABEL_9;
  }
  id v11 = [v15 startEvent];

  if (v11)
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = [v15 startEvent];
    LODWORD(v12) = (*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v13);

    if (v12)
    {
      os_log_type_t v9 = *(void **)(a1 + 32);
      uint64_t v10 = [v15 startEvent];
LABEL_9:
      v14 = (void *)v10;
      [v9 deleteStoreEvent:v10];
    }
  }
LABEL_10:
}

+ (BOOL)_atLeastOneSegmentFileInDirectory:(id)a3 fileManager:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v15 = 0;
  uint64_t v4 = [a4 contentsOfDirectoryAtPath:a3 error:&v15];
  id v5 = v15;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (_PASIsAllDigits())
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_pruneEmptyRemotesNotRecentlyModified
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMStreamBase *)self configuration];
  uint64_t v4 = [v3 storeConfig];
  id v5 = [v4 datastorePath];
  id v6 = [(BMStreamBase *)self identifier];
  uint64_t v7 = [v5 stringByAppendingPathComponent:v6];

  CFAbsoluteTime v27 = (void *)v7;
  uint64_t v8 = [MEMORY[0x1E4F4FB68] fileManagerWithDirectAccessToDirectory:v7 cachingOptions:0];
  os_log_type_t v9 = [MEMORY[0x1E4F4FBA0] remoteDevices];
  id v35 = 0;
  uint64_t v10 = [v8 contentsOfDirectoryAtPath:v9 error:&v35];
  id v11 = v35;

  long long v12 = objc_opt_new();
  [v12 timeIntervalSince1970];
  double v14 = v13;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v10;
  uint64_t v15 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v20 = NSString;
        uint64_t v21 = [MEMORY[0x1E4F4FBA0] remoteDevices];
        v38[0] = v21;
        v38[1] = v19;
        id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
        id v23 = [v20 pathWithComponents:v22];

        if (([(id)objc_opt_class() _atLeastOneSegmentFileInDirectory:v23 fileManager:v8] & 1) == 0)
        {
          id v30 = v11;
          unint64_t v24 = [v8 modificationTimeOfFileAtPath:v23 error:&v30];
          id v25 = v30;

          id v11 = v25;
          if (v25) {
            goto LABEL_8;
          }
          if (v24 >= (unint64_t)(v14 + -259200.0))
          {
            id v11 = 0;
            goto LABEL_15;
          }
          id v29 = 0;
          [v8 removeDirectoryAtPath:v23 error:&v29];
          id v11 = v29;
          if (v11)
          {
LABEL_8:
            id v26 = __biome_log_for_category();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              [(BMStreamBase(PeriodicMaintenance) *)&v36 _pruneEmptyRemotesNotRecentlyModified];
            }
          }
        }
LABEL_15:
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v16);
  }
}

- (void)_pruneDisabledSubstreams
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(BMStreamBase *)self configuration];
  char v5 = [v4 enableSubscriptionSubstream];

  if ((v5 & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F4FBA0] subscriptions];
    [v3 addObject:v6];
  }
  uint64_t v7 = [(BMStreamBase *)self configuration];
  char v8 = [v7 enableTombstoneSubstream];

  if ((v8 & 1) == 0)
  {
    os_log_type_t v9 = [MEMORY[0x1E4F4FBA0] localDevice];
    uint64_t v10 = [MEMORY[0x1E4F4FBA0] tombstones];
    id v11 = [v9 stringByAppendingPathComponent:v10];
    [v3 addObject:v11];
  }
  if ([v3 count])
  {
    long long v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_18E67D000, v12, OS_LOG_TYPE_INFO, "Pruning disabled substreams", (uint8_t *)&buf, 2u);
    }

    double v13 = [(BMStreamBase *)self configuration];
    double v14 = [v13 storeConfig];
    uint64_t v15 = [v14 datastorePath];
    uint64_t v16 = [(BMStreamBase *)self identifier];
    uint64_t v17 = [v15 stringByAppendingPathComponent:v16];

    id v18 = [MEMORY[0x1E4F4FB68] fileManagerWithDirectAccessToDirectory:v17 cachingOptions:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v28 = v17;
    uint64_t v19 = [v17 stringsByAppendingPaths:v3];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v31;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v30 + 1) + 8 * v23);
          id v29 = 0;
          char v25 = [v18 removeDirectoryAtPath:v24 error:&v29];
          id v26 = v29;
          if ((v25 & 1) == 0)
          {
            CFAbsoluteTime v27 = __biome_log_for_category();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              [(BMStreamBase(PeriodicMaintenance) *)&buf _pruneDisabledSubstreams];
            }
          }
          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v21);
    }
  }
}

- (id)subscriptionStoreStreamForUseCase:(id)a3
{
  id v4 = a3;
  char v5 = [(BMStreamBase *)self configuration];
  int v6 = [v5 enableSubscriptionSubstream];

  if (v6)
  {
    uint64_t v7 = [(BMStreamBase *)self identifier];
    char v8 = [v7 stringByAppendingString:@":subscriptions"];

    os_log_type_t v9 = [BMStoreStream alloc];
    uint64_t v10 = [(BMStreamBase *)self configuration];
    id v11 = [v10 storeConfig];
    long long v12 = [v11 subscriptionsConfig];
    double v13 = [(BMStoreStream *)v9 initWithStreamIdentifier:v8 storeConfig:v12 streamType:2 eventDataClass:objc_opt_class() useCase:v4];
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

- (id)subscriptionSource
{
  uint64_t v3 = [(BMStreamBase *)self configuration];
  int v4 = [v3 enableSubscriptionSubstream];

  if (v4)
  {
    char v5 = [(BMStreamBase *)self subscriptionStoreStreamForUseCase:*MEMORY[0x1E4F4FB20]];
    int v6 = [v5 source];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)subscriptionPruner
{
  uint64_t v3 = [(BMStreamBase *)self configuration];
  int v4 = [v3 enableSubscriptionSubstream];

  if (v4)
  {
    char v5 = [(BMStreamBase *)self subscriptionStoreStreamForUseCase:*MEMORY[0x1E4F4FB10]];
    int v6 = [[BMPruner alloc] initWithStoreStream:v5 remote:0];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)subscriptionPublisherWithUseCase:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(BMStreamBase *)self configuration];
  int v9 = [v8 enableSubscriptionSubstream];

  if (v9)
  {
    uint64_t v10 = [(BMStreamBase *)self subscriptionStoreStreamForUseCase:v6];
    id v11 = [v10 _publisherWithOptions:v7];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)subscriptionDSLPublisher
{
  return [(BMStreamBase *)self subscriptionDSLPublisherWithUseCase:*MEMORY[0x1E4F4FAF8]];
}

- (id)subscriptionDSLPublisherWithUseCase:(id)a3
{
  id v4 = a3;
  char v5 = [(BMStreamBase *)self configuration];
  int v6 = [v5 enableSubscriptionSubstream];

  if (v6)
  {
    id v7 = [(BMStreamBase *)self identifier];
    char v8 = [v7 stringByAppendingString:@":subscriptions"];

    int v9 = [[BMDSLStreamPublisher alloc] initWithIdentifier:v8 streamType:2 useCase:v4 eventDataClass:objc_opt_class()];
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (id)subscriptionPublisherWithOptions:(id)a3
{
  return [(BMStreamBase *)self subscriptionPublisherWithUseCase:*MEMORY[0x1E4F4FAF8] options:a3];
}

void __81__BMStreamBase_PeriodicMaintenance___executePruningPolicyOnSubscriptionSubstream__block_invoke_4_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v5 = [*(id *)(a1 + 32) configuration];
  int v6 = [v5 streamIdentifier];
  int v7 = 138543618;
  char v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_fault_impl(&dword_18E67D000, a3, OS_LOG_TYPE_FAULT, "Failed to prune %{public}@:subscriptions with error %{public}@", (uint8_t *)&v7, 0x16u);
}

@end