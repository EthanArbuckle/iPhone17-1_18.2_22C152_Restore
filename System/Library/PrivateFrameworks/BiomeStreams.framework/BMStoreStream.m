@interface BMStoreStream
+ (id)_libraryStreamWithIdentifier:(id)a3 eventDataClass:(Class)a4;
- (BMStoreConfig)storeConfig;
- (BMStoreStream)initWithPrivateStreamIdentifier:(id)a3 storeConfig:(id)a4;
- (BMStoreStream)initWithPrivateStreamIdentifier:(id)a3 storeConfig:(id)a4 eventDataClass:(Class)a5;
- (BMStoreStream)initWithPublicStream:(int64_t)a3;
- (BMStoreStream)initWithRestrictedStreamIdentifier:(id)a3;
- (BMStoreStream)initWithRestrictedStreamIdentifier:(id)a3 eventDataClass:(Class)a4;
- (BMStoreStream)initWithRestrictedStreamIdentifier:(id)a3 protectionClass:(unint64_t)a4;
- (BMStoreStream)initWithRestrictedStreamIdentifier:(id)a3 storeConfig:(id)a4;
- (BMStoreStream)initWithStreamIdentifier:(id)a3 storeConfig:(id)a4;
- (BMStoreStream)initWithStreamIdentifier:(id)a3 storeConfig:(id)a4 streamType:(unint64_t)a5;
- (BMStoreStream)initWithStreamIdentifier:(id)a3 storeConfig:(id)a4 streamType:(unint64_t)a5 eventDataClass:(Class)a6 useCase:(id)a7;
- (BOOL)deleteStoreEvent:(id)a3;
- (BOOL)pruneEventsOfRemote:(id)a3 withReason:(unint64_t)a4 policyID:(id)a5 error:(id *)a6 predicateBlock:(id)a7;
- (BOOL)pruneEventsWithError:(id *)a3 predicateBlock:(id)a4;
- (NSString)identifier;
- (NSString)useCase;
- (id)_computeSource;
- (id)_initWithRestrictedStreamIdentifier:(id)a3 storeConfig:(id)a4 eventDataClass:(Class)a5;
- (id)_prunerForRemote:(id)a3;
- (id)_publisherForDevice:(id)a3 options:(id)a4;
- (id)_publisherWithOptions:(id)a3;
- (id)_publishersForDevices:(id)a3 includeLocal:(BOOL)a4 options:(id)a5;
- (id)pruner;
- (id)publisher;
- (id)publisherForDevice:(id)a3 withUseCase:(id)a4;
- (id)publisherForDevice:(id)a3 withUseCase:(id)a4 options:(id)a5;
- (id)publisherFromStartTime:(double)a3;
- (id)publisherWithOptions:(id)a3;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6;
- (id)publisherWithStartTime:(id)a3 withEndTime:(id)a4 withMaxEvents:(id)a5 reversed:(BOOL)a6;
- (id)publishersForDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6;
- (id)publishersForDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10;
- (id)publishersForDevices:(id)a3 withUseCase:(id)a4 startTime:(double)a5 includeLocal:(BOOL)a6 pipeline:(id)a7;
- (id)publishersForDevices:(id)a3 withUseCase:(id)a4 startTime:(id)a5 endTime:(id)a6 maxEvents:(id)a7 lastN:(id)a8 reversed:(BOOL)a9 includeLocal:(BOOL)a10 pipeline:(id)a11;
- (id)publishersForRemoteDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6;
- (id)publishersForRemoteDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10;
- (id)remoteDevices;
- (id)remoteDevicesForAccount:(id)a3 error:(id *)a4;
- (id)remoteDevicesWithError:(id *)a3;
- (id)source;
- (id)tombstoneConfig;
- (id)tombstonePruner;
- (id)validator;
- (void)_pruneWithStoreConfig:(id)a3 expirationAge:(double)a4 block:(id)a5;
- (void)pruneEventsOfRemote:(id)a3 withReason:(unint64_t)a4 policyID:(id)a5 usingPredicateBlock:(id)a6;
- (void)pruneExpiredEventsWithBlock:(id)a3;
- (void)pruneLocalAndRemoteEventsWithPredicateBlock:(id)a3;
- (void)pruneLocalAndRemoteEventsWithReason:(unint64_t)a3 usingPredicateBlock:(id)a4;
- (void)pruneStreamByPruningPolicyMaxStreamSize;
- (void)pruneStreamBySize:(unint64_t)a3;
- (void)pruneTombstonesByAge:(double)a3;
- (void)pruneWithPredicateBlock:(id)a3;
- (void)pruneWithReason:(unint64_t)a3 usingPredicateBlock:(id)a4;
@end

@implementation BMStoreStream

- (id)publishersForRemoteDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  v11 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_9);
  v12 = [(BMStoreStream *)self publishersForDevices:v11 startTime:v6 includeLocal:v10 pipeline:a4];

  return v12;
}

- (id)publishersForDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  if (a4 == 0.0)
  {
    v12 = 0;
  }
  else
  {
    v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a4];
  }
  v13 = [[BMPublisherOptions alloc] initWithStartDate:v12 endDate:0 maxEvents:0 lastN:0 reversed:0];
  v14 = [(BMStorePublisherManager *)self->_publisherManager publishersForDevices:v10 includeLocal:v7 options:v13 pipeline:v11];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_pruningDelegate, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_accessClient, 0);
  objc_storeStrong((id *)&self->_tombstonePruner, 0);
  objc_storeStrong((id *)&self->_pruner, 0);
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_storeConfig, 0);
  objc_storeStrong((id *)&self->_streamIdentifier, 0);

  objc_storeStrong((id *)&self->_publisherManager, 0);
}

- (id)publisherFromStartTime:(double)a3
{
  v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  v5 = [[BMPublisherOptions alloc] initWithStartDate:v4 endDate:0 maxEvents:0 lastN:0 reversed:0];
  BOOL v6 = [(BMStorePublisherManager *)self->_publisherManager publisherWithOptions:v5];

  return v6;
}

- (id)_publisherWithOptions:(id)a3
{
  return [(BMStorePublisherManager *)self->_publisherManager publisherWithOptions:a3];
}

- (BMStoreStream)initWithStreamIdentifier:(id)a3 storeConfig:(id)a4 streamType:(unint64_t)a5 eventDataClass:(Class)a6 useCase:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v41.receiver = self;
  v41.super_class = (Class)BMStoreStream;
  v16 = [(BMStoreStream *)&v41 init];
  v17 = v16;
  if (!v16) {
    goto LABEL_17;
  }
  v16->_lock._os_unfair_lock_opaque = 0;
  objc_storeStrong((id *)&v16->_streamIdentifier, a3);
  p_storeConfig = (id *)&v17->_storeConfig;
  objc_storeStrong((id *)&v17->_storeConfig, a4);
  objc_storeStrong((id *)&v17->_useCase, a7);
  if ([v13 hasSuffix:@":subscriptions"])
  {
    uint64_t v19 = [*p_storeConfig subscriptionsConfig];
  }
  else
  {
    if (![v13 hasSuffix:@":tombstones"]) {
      goto LABEL_7;
    }
    uint64_t v19 = [*p_storeConfig tombstonesConfig];
  }
  id v20 = *p_storeConfig;
  id *p_storeConfig = (id)v19;

LABEL_7:
  Class v21 = a6;
  unint64_t v22 = a5;
  v23 = [v14 datastorePath];
  v24 = [v13 componentsSeparatedByString:@":"];
  v25 = [v24 firstObject];
  v40 = [v23 stringByAppendingPathComponent:v25];

  if ([v14 isManaged]
    && ([MEMORY[0x1E4F4FB80] current],
        v26 = objc_claimAutoreleasedReturnValue(),
        char v27 = objc_msgSend(v26, "reliesOnDirectAccessForDomain:", objc_msgSend(*p_storeConfig, "domain")),
        v26,
        (v27 & 1) == 0))
  {
    uint64_t v28 = objc_msgSend(MEMORY[0x1E4F4FB68], "fileManagerWithMediatedAccessToDirectory:useCase:domain:user:", v40, v15, objc_msgSend(v14, "domain"), objc_msgSend(v14, "uid"));
  }
  else
  {
    uint64_t v28 = [MEMORY[0x1E4F4FB68] fileManagerWithDirectAccessToDirectory:v40 cachingOptions:3];
  }
  fileManager = v17->_fileManager;
  v17->_fileManager = (BMFileManager *)v28;

  if (v14)
  {
    v30 = [v14 pruningPolicy];

    if (!v30)
    {
      v31 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:52428800 maxStreamSize:2419200.0];
      [v14 setPruningPolicy:v31];
    }
  }
  v17->_streamType = v22;
  v32 = [BMStorePublisherManager alloc];
  v33 = [v13 componentsSeparatedByString:@":"];
  v34 = [v33 firstObject];
  uint64_t v35 = [(BMStorePublisherManager *)v32 initWithStreamIdentifier:v34 streamConfig:v17->_storeConfig accessClient:v17->_accessClient eventDataClass:v21 useCase:v15];
  publisherManager = v17->_publisherManager;
  v17->_publisherManager = (BMStorePublisherManager *)v35;

  v17->_eventDataClass = v21;
  if ([(BMStoreConfig *)v17->_storeConfig isManaged])
  {
    v37 = [[BMStoreStreamPruningBridge alloc] initWithStreamIdentifier:v17->_streamIdentifier domain:[(BMStoreConfig *)v17->_storeConfig domain]];
    pruningDelegate = v17->_pruningDelegate;
    v17->_pruningDelegate = (BMStreamDatastorePruningDelegate *)v37;
  }
LABEL_17:

  return v17;
}

- (NSString)useCase
{
  return self->_useCase;
}

- (BMStoreStream)initWithPrivateStreamIdentifier:(id)a3 storeConfig:(id)a4
{
  return [(BMStoreStream *)self initWithPrivateStreamIdentifier:a3 storeConfig:a4 eventDataClass:0];
}

- (id)source
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  source = self->_source;
  if (!source)
  {
    v5 = [(NSString *)self->_streamIdentifier componentsSeparatedByString:@":"];
    BOOL v6 = [v5 firstObject];

    BOOL v7 = [[BMStoreSource alloc] initWithIdentifier:v6 storeConfig:self->_storeConfig accessClient:self->_accessClient eventDataClass:self->_eventDataClass];
    v8 = self->_source;
    self->_source = v7;

    source = self->_source;
  }
  v9 = source;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)remoteDevices
{
  if (([(BMStoreConfig *)self->_storeConfig storeLocationOption] & 4) != 0)
  {
    BOOL v7 = 0;
  }
  else
  {
    v3 = [(BMStoreConfig *)self->_storeConfig datastorePath];
    v4 = [v3 stringByAppendingPathComponent:self->_streamIdentifier];
    v5 = [MEMORY[0x1E4F4FBA0] remoteDevices];
    BOOL v6 = [v4 stringByAppendingPathComponent:v5];

    BOOL v7 = [(BMFileManager *)self->_fileManager contentsOfDirectoryAtPath:v6 error:0];
  }

  return v7;
}

- (BOOL)pruneEventsOfRemote:(id)a3 withReason:(unint64_t)a4 policyID:(id)a5 error:(id *)a6 predicateBlock:(id)a7
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  if (v12) {
    [(BMStoreStream *)self _prunerForRemote:v12];
  }
  else {
  id v15 = [(BMStoreStream *)self pruner];
  }
  int v16 = [v15 isDataAccessible];
  if (v16)
  {
    [v15 eventsFrom:a4 to:v13 reason:v14 policyID:0.0 shouldDeleteUsingBlock:CFAbsoluteTimeGetCurrent()];
    if ([(BMStoreConfig *)self->_storeConfig isManaged])
    {
      v17 = [BMComputeSourceClient alloc];
      streamIdentifier = self->_streamIdentifier;
      uint64_t v19 = [(BMStoreConfig *)self->_storeConfig domain];
      id v20 = [(BMComputeSourceClient *)v17 initWithStreamIdentifier:streamIdentifier domain:v19 useCase:*MEMORY[0x1E4F4FB10]];
      Class v21 = [(BMStoreConfig *)self->_storeConfig account];
      if (v12)
      {
        [(BMComputeSourceClient *)v20 eventsPrunedForAccount:v21 remoteName:v12 reason:a4];
      }
      else
      {
        v24 = [(BMStoreConfig *)self->_storeConfig remoteName];
        [(BMComputeSourceClient *)v20 eventsPrunedForAccount:v21 remoteName:v24 reason:a4];
      }
    }
  }
  else if (a6)
  {
    unint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27[0] = @"Pruner does not have access to data due to lock state";
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    *a6 = [v22 errorWithDomain:@"com.apple.biome.BiomeStreams" code:2 userInfo:v23];
  }
  return v16;
}

- (id)pruner
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  pruner = self->_pruner;
  if (!pruner)
  {
    v5 = (BMStreamDatastorePruner *)[objc_alloc(MEMORY[0x1E4F50290]) initWithStream:self->_streamIdentifier config:self->_storeConfig eventDataClass:self->_eventDataClass];
    BOOL v6 = self->_pruner;
    self->_pruner = v5;

    [(BMStreamDatastorePruner *)self->_pruner setDelegate:self->_pruningDelegate];
    pruner = self->_pruner;
  }
  BOOL v7 = pruner;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (BMStoreStream)initWithPrivateStreamIdentifier:(id)a3 storeConfig:(id)a4 eventDataClass:(Class)a5
{
  return [(BMStoreStream *)self initWithStreamIdentifier:a3 storeConfig:a4 streamType:3 eventDataClass:a5 useCase:*MEMORY[0x1E4F4FAF8]];
}

- (BOOL)pruneEventsWithError:(id *)a3 predicateBlock:(id)a4
{
  return [(BMStoreStream *)self pruneEventsOfRemote:0 withReason:0 policyID:0 error:a3 predicateBlock:a4];
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    int v16 = (void *)MEMORY[0x1E4F1C9C8];
    [v12 doubleValue];
    v17 = objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
    if (v13)
    {
LABEL_3:
      v18 = (void *)MEMORY[0x1E4F1C9C8];
      [v13 doubleValue];
      uint64_t v19 = objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
      goto LABEL_6;
    }
  }
  else
  {
    v17 = 0;
    if (v13) {
      goto LABEL_3;
    }
  }
  uint64_t v19 = 0;
LABEL_6:
  id v20 = -[BMPublisherOptions initWithStartDate:endDate:maxEvents:lastN:reversed:]([BMPublisherOptions alloc], "initWithStartDate:endDate:maxEvents:lastN:reversed:", v17, v19, [v14 unsignedLongLongValue], objc_msgSend(v15, "unsignedLongLongValue"), v7);
  Class v21 = [(BMStorePublisherManager *)self->_publisherManager publisherWithOptions:v20];

  return v21;
}

- (id)publisherWithOptions:(id)a3
{
  return [(BMStorePublisherManager *)self->_publisherManager publisherWithOptions:a3];
}

+ (id)_libraryStreamWithIdentifier:(id)a3 eventDataClass:(Class)a4
{
  v5 = (void *)MEMORY[0x1E4F4FBA8];
  id v6 = a3;
  uint64_t v7 = [v5 libraryPathForStreamIdentifier:v6];
  v8 = (void *)v7;
  if (v7) {
    v9 = (void *)v7;
  }
  else {
    v9 = v6;
  }
  id v10 = v9;

  uint64_t v11 = [MEMORY[0x1E4F4FBA8] legacyClassForLibraryStream:v10];
  id v12 = BiomeLibraryNodeBridge();
  uint64_t v18 = 0;
  id v13 = [v12 streamWithIdentifier:v10 error:&v18];

  uint64_t v14 = v18;
  id v15 = 0;
  if (!v14)
  {
    if (v11) {
      Class v16 = (Class)v11;
    }
    else {
      Class v16 = a4;
    }
    id v15 = [v13 storeStreamWithLegacyClass:v16];
  }

  return v15;
}

- (BMStoreStream)initWithPublicStream:(int64_t)a3
{
  int v3 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F4FB88], "streamIdentifierForStream:");
  if (!v5)
  {
    id v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BMStoreStream initWithPublicStream:](v3, v10);
    }
    goto LABEL_10;
  }
  uint64_t v6 = [MEMORY[0x1E4F4FBA8] legacyClassForLibraryStream:v5];
  if (!v6)
  {
    id v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BMStoreStream initWithPublicStream:]((uint64_t)v5, v10);
    }
LABEL_10:
    uint64_t v11 = 0;
    goto LABEL_11;
  }
  uint64_t v7 = v6;
  v8 = BiomeLibraryNodeBridge();
  id v13 = 0;
  v9 = [v8 streamWithIdentifier:v5 error:&v13];
  id v10 = v13;

  uint64_t v11 = 0;
  if (!v10)
  {
    uint64_t v11 = [(id)objc_opt_class() _libraryStreamWithIdentifier:v5 eventDataClass:v7];
  }

LABEL_11:
  return v11;
}

- (BMStoreStream)initWithStreamIdentifier:(id)a3 storeConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F4FB88] streamForStreamIdentifier:v6];
  if (v8)
  {
    v9 = [(BMStoreStream *)self initWithPublicStream:v8];
  }
  else
  {
    uint64_t v10 = [v7 streamType];
    v9 = [(BMStoreStream *)self initWithStreamIdentifier:v6 storeConfig:v7 streamType:v10 eventDataClass:0 useCase:*MEMORY[0x1E4F4FAF8]];
  }
  uint64_t v11 = v9;

  return v11;
}

- (BMStoreStream)initWithStreamIdentifier:(id)a3 storeConfig:(id)a4 streamType:(unint64_t)a5
{
  return [(BMStoreStream *)self initWithStreamIdentifier:a3 storeConfig:a4 streamType:a5 eventDataClass:0 useCase:*MEMORY[0x1E4F4FAF8]];
}

- (BMStoreStream)initWithRestrictedStreamIdentifier:(id)a3
{
  return (BMStoreStream *)[(BMStoreStream *)self _initWithRestrictedStreamIdentifier:a3 storeConfig:0 eventDataClass:0];
}

- (BMStoreStream)initWithRestrictedStreamIdentifier:(id)a3 protectionClass:(unint64_t)a4
{
  id v6 = (void *)MEMORY[0x1E4F50278];
  id v7 = a3;
  uint64_t v8 = (void *)[v6 newRestrictedStreamDefaultConfigurationWithProtectionClass:a4];
  v9 = [(BMStoreStream *)self _initWithRestrictedStreamIdentifier:v7 storeConfig:v8 eventDataClass:0];

  return v9;
}

- (BMStoreStream)initWithRestrictedStreamIdentifier:(id)a3 storeConfig:(id)a4
{
  return (BMStoreStream *)[(BMStoreStream *)self _initWithRestrictedStreamIdentifier:a3 storeConfig:a4 eventDataClass:0];
}

- (BMStoreStream)initWithRestrictedStreamIdentifier:(id)a3 eventDataClass:(Class)a4
{
  return (BMStoreStream *)[(BMStoreStream *)self _initWithRestrictedStreamIdentifier:a3 storeConfig:0 eventDataClass:a4];
}

- (id)_initWithRestrictedStreamIdentifier:(id)a3 storeConfig:(id)a4 eventDataClass:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  if (([MEMORY[0x1E4F4FB78] isTestPathOverridden] & 1) != 0 || (objc_msgSend(v9, "isManaged") & 1) == 0)
  {
    if (!v9) {
      id v9 = (id)[MEMORY[0x1E4F50278] newRestrictedStreamDefaultConfiguration];
    }
    uint64_t v11 = [BMStoreStream alloc];
    uint64_t v10 = [(BMStoreStream *)v11 initWithStreamIdentifier:v8 storeConfig:v9 streamType:2 eventDataClass:a5 useCase:*MEMORY[0x1E4F4FAF8]];
  }
  else
  {
    uint64_t v10 = [(id)objc_opt_class() _libraryStreamWithIdentifier:v8 eventDataClass:a5];
  }
  id v12 = (void *)v10;

  return v12;
}

- (NSString)identifier
{
  return self->_streamIdentifier;
}

- (id)tombstoneConfig
{
  v2 = (void *)[(BMStoreConfig *)self->_storeConfig copy];
  objc_msgSend(v2, "setStoreLocationOption:", objc_msgSend(v2, "storeLocationOption") | 2);

  return v2;
}

- (id)publisherWithStartTime:(id)a3 withEndTime:(id)a4 withMaxEvents:(id)a5 reversed:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    id v13 = (void *)MEMORY[0x1E4F1C9C8];
    [v10 doubleValue];
    uint64_t v14 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
    if (v11)
    {
LABEL_3:
      id v15 = (void *)MEMORY[0x1E4F1C9C8];
      [v11 doubleValue];
      Class v16 = objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if (v11) {
      goto LABEL_3;
    }
  }
  Class v16 = 0;
LABEL_6:
  v17 = -[BMPublisherOptions initWithStartDate:endDate:maxEvents:lastN:reversed:]([BMPublisherOptions alloc], "initWithStartDate:endDate:maxEvents:lastN:reversed:", v14, v16, [v12 unsignedLongLongValue], 0, v6);
  uint64_t v18 = [(BMStorePublisherManager *)self->_publisherManager publisherWithOptions:v17];

  return v18;
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    id v13 = (void *)MEMORY[0x1E4F1C9C8];
    [v10 doubleValue];
    uint64_t v14 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
    if (v11)
    {
LABEL_3:
      id v15 = (void *)MEMORY[0x1E4F1C9C8];
      [v11 doubleValue];
      Class v16 = objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if (v11) {
      goto LABEL_3;
    }
  }
  Class v16 = 0;
LABEL_6:
  v17 = -[BMPublisherOptions initWithStartDate:endDate:maxEvents:lastN:reversed:]([BMPublisherOptions alloc], "initWithStartDate:endDate:maxEvents:lastN:reversed:", v14, v16, [v12 unsignedLongLongValue], 0, v6);
  uint64_t v18 = [(BMStorePublisherManager *)self->_publisherManager publisherWithOptions:v17];

  return v18;
}

- (id)publisher
{
  int v3 = objc_opt_new();
  v4 = [(BMStorePublisherManager *)self->_publisherManager publisherWithOptions:v3];

  return v4;
}

- (id)remoteDevicesWithError:(id *)a3
{
  v4 = objc_opt_new();
  v5 = [v4 remoteDevicesWithError:a3];

  return v5;
}

- (id)remoteDevicesForAccount:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v6 = objc_opt_new();
  id v7 = [v6 remoteDevicesForAccount:v5 error:a4];

  return v7;
}

- (id)publishersForDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10
{
  BOOL v28 = a8;
  char v27 = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a10;
  if (v15)
  {
    id v20 = (void *)MEMORY[0x1E4F1C9C8];
    [v15 doubleValue];
    Class v21 = objc_msgSend(v20, "dateWithTimeIntervalSinceReferenceDate:");
    if (v16)
    {
LABEL_3:
      unint64_t v22 = (void *)MEMORY[0x1E4F1C9C8];
      objc_msgSend(v16, "doubleValue", v27);
      v23 = objc_msgSend(v22, "dateWithTimeIntervalSinceReferenceDate:");
      goto LABEL_6;
    }
  }
  else
  {
    Class v21 = 0;
    if (v16) {
      goto LABEL_3;
    }
  }
  v23 = 0;
LABEL_6:
  v24 = -[BMPublisherOptions initWithStartDate:endDate:maxEvents:lastN:reversed:]([BMPublisherOptions alloc], "initWithStartDate:endDate:maxEvents:lastN:reversed:", v21, v23, [v17 unsignedLongLongValue], objc_msgSend(v18, "unsignedLongLongValue"), v28);
  v25 = [(BMStorePublisherManager *)v27->_publisherManager publishersForDevices:v14 includeLocal:a9 options:v24 pipeline:v19];

  return v25;
}

id __76__BMStoreStream_publishersForRemoteDevices_startTime_includeLocal_pipeline___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F504E8];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithDeviceIdentifier:v3 idsDeviceIdentifier:0 name:0 model:0 platform:0];

  return v4;
}

- (id)publishersForRemoteDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10
{
  BOOL v10 = a8;
  id v17 = a10;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  unint64_t v22 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_23);
  LOBYTE(v25) = a9;
  v23 = [(BMStoreStream *)self publishersForDevices:v22 startTime:v21 endTime:v20 maxEvents:v19 lastN:v18 reversed:v10 includeLocal:v25 pipeline:v17];

  return v23;
}

id __109__BMStoreStream_publishersForRemoteDevices_startTime_endTime_maxEvents_lastN_reversed_includeLocal_pipeline___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F504E8];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithDeviceIdentifier:v3 idsDeviceIdentifier:0 name:0 model:0 platform:0];

  return v4;
}

- (id)publisherForDevice:(id)a3 withUseCase:(id)a4
{
  useCase = self->_useCase;
  id v8 = a3;
  if (([(NSString *)useCase isEqual:a4] & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BMStoreStream.m", 435, @"Invalid parameter not satisfying: %@", @"[_useCase isEqual:useCase]" object file lineNumber description];
  }
  id v9 = objc_opt_new();
  BOOL v10 = [(BMStorePublisherManager *)self->_publisherManager publisherForDevice:v8 options:v9];

  return v10;
}

- (id)publisherForDevice:(id)a3 withUseCase:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (([(NSString *)self->_useCase isEqual:a4] & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BMStoreStream.m", 445, @"Invalid parameter not satisfying: %@", @"[_useCase isEqual:useCase]" object file lineNumber description];
  }
  id v11 = [(BMStorePublisherManager *)self->_publisherManager publisherForDevice:v9 options:v10];

  return v11;
}

- (id)publishersForDevices:(id)a3 withUseCase:(id)a4 startTime:(id)a5 endTime:(id)a6 maxEvents:(id)a7 lastN:(id)a8 reversed:(BOOL)a9 includeLocal:(BOOL)a10 pipeline:(id)a11
{
  id v17 = a5;
  id v18 = a6;
  v36 = self;
  useCase = self->_useCase;
  id v20 = a11;
  id v21 = a8;
  id v22 = a7;
  id v23 = a3;
  if (([(NSString *)useCase isEqual:a4] & 1) == 0)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, v36, @"BMStoreStream.m", 460, @"Invalid parameter not satisfying: %@", @"[_useCase isEqual:useCase]" object file lineNumber description];
  }
  if (v17)
  {
    v24 = (void *)MEMORY[0x1E4F1C9C8];
    [v17 doubleValue];
    uint64_t v25 = objc_msgSend(v24, "dateWithTimeIntervalSinceReferenceDate:");
    if (v18)
    {
LABEL_5:
      uint64_t v26 = (void *)MEMORY[0x1E4F1C9C8];
      [v18 doubleValue];
      char v27 = objc_msgSend(v26, "dateWithTimeIntervalSinceReferenceDate:");
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if (v18) {
      goto LABEL_5;
    }
  }
  char v27 = 0;
LABEL_8:
  BOOL v28 = [BMPublisherOptions alloc];
  uint64_t v29 = [v22 unsignedLongLongValue];

  uint64_t v30 = [v21 unsignedLongLongValue];
  v31 = [(BMPublisherOptions *)v28 initWithStartDate:v25 endDate:v27 maxEvents:v29 lastN:v30 reversed:a9];
  v32 = [(BMStorePublisherManager *)v36->_publisherManager publishersForDevices:v23 includeLocal:a10 options:v31 pipeline:v20];

  return v32;
}

- (id)publishersForDevices:(id)a3 withUseCase:(id)a4 startTime:(double)a5 includeLocal:(BOOL)a6 pipeline:(id)a7
{
  BOOL v7 = a6;
  useCase = self->_useCase;
  id v14 = a7;
  id v15 = a3;
  if (([(NSString *)useCase isEqual:a4] & 1) == 0)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"BMStoreStream.m", 478, @"Invalid parameter not satisfying: %@", @"[_useCase isEqual:useCase]" object file lineNumber description];
  }
  if (a5 == 0.0)
  {
    id v16 = 0;
  }
  else
  {
    id v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a5];
  }
  id v17 = [[BMPublisherOptions alloc] initWithStartDate:v16 endDate:0 maxEvents:0 lastN:0 reversed:0];
  id v18 = [(BMStorePublisherManager *)self->_publisherManager publishersForDevices:v15 includeLocal:v7 options:v17 pipeline:v14];

  return v18;
}

- (id)_computeSource
{
  v2 = [(BMStoreStream *)self source];
  id v3 = [v2 computeSource];

  return v3;
}

- (id)validator
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  validator = self->_validator;
  if (!validator)
  {
    id v5 = [[BMStoreValidator alloc] initWithIdentifier:self->_streamIdentifier storeConfig:self->_storeConfig];
    BOOL v6 = self->_validator;
    self->_validator = v5;

    validator = self->_validator;
  }
  BOOL v7 = validator;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)_prunerForRemote:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"BMStoreStream.m", 538, @"Invalid parameter not satisfying: %@", @"remote" object file lineNumber description];
  }
  BOOL v6 = (void *)[(BMStoreConfig *)self->_storeConfig copyWithRemoteName:v5];
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F50290]) initWithStream:self->_streamIdentifier config:v6 eventDataClass:self->_eventDataClass];
  [v7 setDelegate:self->_pruningDelegate];

  return v7;
}

- (id)tombstonePruner
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  tombstonePruner = self->_tombstonePruner;
  if (!tombstonePruner)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F50290]);
    streamIdentifier = self->_streamIdentifier;
    BOOL v7 = [(BMStoreStream *)self tombstoneConfig];
    id v8 = (BMStreamDatastorePruner *)[v5 initWithStream:streamIdentifier config:v7 eventDataClass:objc_opt_class()];
    id v9 = self->_tombstonePruner;
    self->_tombstonePruner = v8;

    tombstonePruner = self->_tombstonePruner;
  }
  id v10 = tombstonePruner;
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (void)pruneTombstonesByAge:(double)a3
{
  CFAbsoluteTime v4 = CFAbsoluteTimeGetCurrent() - a3;
  id v5 = [(BMStoreStream *)self tombstonePruner];
  [v5 removeEventsFrom:1 to:&__block_literal_global_43 reason:0.0 usingBlock:v4];
}

- (void)pruneWithPredicateBlock:(id)a3
{
}

- (void)pruneWithReason:(unint64_t)a3 usingPredicateBlock:(id)a4
{
  [(BMStoreStream *)self pruneEventsOfRemote:0 withReason:a3 policyID:0 error:0 predicateBlock:a4];

  [(BMStoreStream *)self pruneTombstonesByAge:691200.0];
}

- (void)pruneEventsOfRemote:(id)a3 withReason:(unint64_t)a4 policyID:(id)a5 usingPredicateBlock:(id)a6
{
}

- (void)_pruneWithStoreConfig:(id)a3 expirationAge:(double)a4 block:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  double Current = CFAbsoluteTimeGetCurrent();
  if ([v14 isEqual:self->_storeConfig])
  {
    uint64_t v10 = [(BMStoreStream *)self pruner];
LABEL_5:
    id v13 = (void *)v10;
    goto LABEL_7;
  }
  id v11 = [(BMStoreStream *)self tombstoneConfig];
  int v12 = [v14 isEqual:v11];

  if (v12)
  {
    uint64_t v10 = [(BMStoreStream *)self tombstonePruner];
    goto LABEL_5;
  }
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F50290]) initWithStream:self->_streamIdentifier config:v14 eventDataClass:self->_eventDataClass];
  [v13 setDelegate:self->_pruningDelegate];
LABEL_7:
  [v13 removeEventsFrom:1 to:v8 reason:0.0 usingBlock:Current - a4];

  [(BMStoreStream *)self pruneTombstonesByAge:691200.0];
}

- (void)pruneExpiredEventsWithBlock:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(BMStoreConfig *)self->_storeConfig pruningPolicy];
  [v5 maxAge];
  if (v6 == 0.0)
  {

    double v9 = 2419200.0;
  }
  else
  {
    BOOL v7 = [(BMStoreConfig *)self->_storeConfig pruningPolicy];
    [v7 maxAge];
    double v9 = v8;

    if (v9 <= 0.0)
    {
      uint64_t v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        [(BMStoreStream *)(uint64_t)self pruneExpiredEventsWithBlock:v9];
      }
      goto LABEL_23;
    }
  }
  if (([(NSString *)self->_streamIdentifier isEqual:@"GenerativeExperiences.TransparencyLog"] & 1) != 0
    || [(NSString *)self->_streamIdentifier isEqual:@"PrivateCloudCompute.RequestLog"])
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.AppleIntelligenceReport"];
    uint64_t v12 = [v11 valueForKey:@"reportDuration"];
    id v13 = (void *)v12;
    id v14 = &unk_1EDDD76A8;
    if (v12) {
      id v14 = (void *)v12;
    }
    id v15 = v14;

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    double v17 = 0.0;
    if (isKindOfClass) {
      objc_msgSend(v15, "doubleValue", 0.0);
    }
    if (v17 >= v9) {
      double v17 = v9;
    }
    double v9 = fmax(v17, 0.0);
  }
  id v18 = (void *)MEMORY[0x192FB0D60]();
  [(BMStoreStream *)self _pruneWithStoreConfig:self->_storeConfig expirationAge:v4 block:v9];
  id v19 = (void *)MEMORY[0x192FB0D60]();
  [(BMStoreStream *)self remoteDevices];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v31;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v30 + 1) + 8 * v24);
        uint64_t v26 = (void *)MEMORY[0x192FB0D60](v21);
        char v27 = (void *)-[BMStoreConfig copyWithRemoteName:](self->_storeConfig, "copyWithRemoteName:", v25, (void)v30);
        [(BMStoreStream *)self _pruneWithStoreConfig:v27 expirationAge:v4 block:v9];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v22 = v21;
    }
    while (v21);
  }

  uint64_t v10 = [(BMStoreStream *)self _computeSource];
  BOOL v28 = [(BMStoreConfig *)self->_storeConfig account];
  uint64_t v29 = [(BMStoreConfig *)self->_storeConfig remoteName];
  [v10 eventsPrunedForAccount:v28 remoteName:v29 reason:1];

LABEL_23:
}

- (void)pruneStreamByPruningPolicyMaxStreamSize
{
  id v3 = [(BMStoreConfig *)self->_storeConfig pruningPolicy];
  uint64_t v4 = [v3 maxStreamSize];

  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 52428800;
  }

  [(BMStoreStream *)self pruneStreamBySize:v5];
}

- (void)pruneStreamBySize:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a3) {
    unint64_t v4 = a3;
  }
  else {
    unint64_t v4 = 52428800;
  }
  uint64_t v5 = (void *)MEMORY[0x192FB0D60](self, a2);
  double v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F50288]), "initWithStream:permission:config:includeTombstones:", self->_streamIdentifier, 2, self->_storeConfig, -[BMStoreConfig isManaged](self->_storeConfig, "isManaged"));
  [v6 setDelegate:self->_pruningDelegate];
  [v6 pruneStreamToMaxStreamSizeInBytes:v4];
  id v7 = objc_alloc(MEMORY[0x1E4F50288]);
  streamIdentifier = self->_streamIdentifier;
  double v9 = [(BMStoreStream *)self tombstoneConfig];
  uint64_t v10 = (void *)[v7 initWithStream:streamIdentifier permission:2 config:v9 includeTombstones:0];

  [v10 pruneStreamToMaxStreamSizeInBytes:v4];
  context = (void *)MEMORY[0x192FB0D60]();
  [(BMStoreStream *)self remoteDevices];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v16 = (void *)MEMORY[0x192FB0D60]();
        double v17 = (void *)[(BMStoreConfig *)self->_storeConfig copyWithRemoteName:v15];
        id v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F50288]), "initWithStream:permission:config:includeTombstones:", self->_streamIdentifier, 2, v17, -[BMStoreConfig isManaged](self->_storeConfig, "isManaged"));
        [v18 pruneStreamToMaxStreamSizeInBytes:v4];
        id v19 = (void *)[v17 copy];
        objc_msgSend(v19, "setStoreLocationOption:", objc_msgSend(v19, "storeLocationOption") | 2);
        id v20 = (void *)[objc_alloc(MEMORY[0x1E4F50288]) initWithStream:self->_streamIdentifier permission:2 config:v19 includeTombstones:0];

        [v20 pruneStreamToMaxStreamSizeInBytes:v4];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  uint64_t v21 = [(BMStoreStream *)self _computeSource];
  uint64_t v22 = [(BMStoreConfig *)self->_storeConfig account];
  uint64_t v23 = [(BMStoreConfig *)self->_storeConfig remoteName];
  [v21 eventsPrunedForAccount:v22 remoteName:v23 reason:1];
}

- (void)pruneLocalAndRemoteEventsWithPredicateBlock:(id)a3
{
}

- (void)pruneLocalAndRemoteEventsWithReason:(unint64_t)a3 usingPredicateBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x192FB0D60]();
  [(BMStoreStream *)self pruneWithReason:a3 usingPredicateBlock:v6];
  context = (void *)MEMORY[0x192FB0D60]();
  [(BMStoreStream *)self remoteDevices];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
        uint64_t v13 = (void *)MEMORY[0x192FB0D60]();
        id v14 = (void *)[(BMStoreConfig *)self->_storeConfig copyWithRemoteName:v12];
        uint64_t v15 = [[BMStoreStream alloc] initWithStreamIdentifier:self->_streamIdentifier storeConfig:v14 streamType:[(BMStoreConfig *)self->_storeConfig streamType]];
        [(BMStoreStream *)v15 pruneWithReason:a3 usingPredicateBlock:v6];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

- (BOOL)deleteStoreEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bookmark];
  if (v5)
  {
    id v6 = [v4 metadata];
    id v7 = [v6 remoteStreamName];

    if (v7)
    {
      uint64_t v8 = [v4 metadata];
      uint64_t v9 = [v8 remoteStreamName];
      uint64_t v10 = [(BMStoreStream *)self _prunerForRemote:v9];
    }
    else
    {
      uint64_t v10 = [(BMStoreStream *)self pruner];
    }
    int v12 = [v10 deleteEventAtBookmark:v5 outTombstoneBookmark:0];
    if (v12)
    {
      uint64_t v13 = [(BMStoreStream *)self _computeSource];
      id v14 = [(BMStoreConfig *)self->_storeConfig account];
      uint64_t v15 = [(BMStoreConfig *)self->_storeConfig remoteName];
      [v13 eventsPrunedForAccount:v14 remoteName:v15 reason:2];
    }
  }
  else
  {
    uint64_t v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      [(BMStoreStream *)(uint64_t)self deleteStoreEvent:v11];
    }

    LOBYTE(v12) = 0;
  }

  return v12;
}

- (id)_publishersForDevices:(id)a3 includeLocal:(BOOL)a4 options:(id)a5
{
  return [(BMStorePublisherManager *)self->_publisherManager publishersForDevices:a3 includeLocal:a4 options:a5 pipeline:0];
}

- (id)_publisherForDevice:(id)a3 options:(id)a4
{
  return [(BMStorePublisherManager *)self->_publisherManager publisherForDevice:a3 options:a4];
}

- (BMStoreConfig)storeConfig
{
  return self->_storeConfig;
}

- (void)initWithPublicStream:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "Unrecognized stream: %d", (uint8_t *)v2, 8u);
}

- (void)initWithPublicStream:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "Failed to determine legacy class for public stream: %@", (uint8_t *)&v2, 0xCu);
}

- (void)pruneExpiredEventsWithBlock:(double)a3 .cold.1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  double v7 = a3;
  _os_log_debug_impl(&dword_18E67D000, a2, OS_LOG_TYPE_DEBUG, "Skipping prune for stream %{public}@ with max age: %f ", (uint8_t *)&v4, 0x16u);
}

- (void)deleteStoreEvent:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 24);
  [a2 timestamp];
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_18E67D000, a3, OS_LOG_TYPE_DEBUG, "Skipping deleteStoreEvent for stream %{public}@ with event timestamp: %f since bookmark could not be initialized", (uint8_t *)&v6, 0x16u);
}

@end