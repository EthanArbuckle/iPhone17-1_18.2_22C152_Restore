@interface BMStreamDatastore
- (BMFrameStore)currentFrameStore;
- (BMPruningPolicy)pruningPolicy;
- (BMSegmentManager)segmentManager;
- (BMStoreConfig)config;
- (BMStreamDatastore)initWithStream:(id)a3 permission:(unint64_t)a4 config:(id)a5;
- (BMStreamDatastore)initWithStream:(id)a3 permission:(unint64_t)a4 config:(id)a5 includeTombstones:(BOOL)a6;
- (BMStreamDatastore)initWithStream:(id)a3 permission:(unint64_t)a4 config:(id)a5 includeTombstones:(BOOL)a6 eventDataClass:(Class)a7 useCase:(id)a8;
- (BMStreamDatastore)initWithStream:(id)a3 streamPath:(id)a4 permission:(unint64_t)a5 config:(id)a6;
- (BMStreamDatastore)initWithStream:(id)a3 streamPath:(id)a4 permission:(unint64_t)a5 config:(id)a6 eventDataClass:(Class)a7 useCase:(id)a8;
- (BMStreamDatastore)initWithStream:(id)a3 streamPath:(id)a4 permission:(unint64_t)a5 config:(id)a6 includeTombstones:(BOOL)a7 eventDataClass:(Class)a8 useCase:(id)a9;
- (BMStreamDatastorePruningDelegate)delegate;
- (BMStreamMetadata)metadata;
- (BOOL)deleteEventAtBookmark:(id)a3 outTombstoneBookmark:(id *)a4;
- (BOOL)includeTombstones;
- (BOOL)isDataAccessible;
- (BOOL)isSubscriptionStore;
- (BOOL)isTombstoneStore;
- (BOOL)saveMetadata:(id)a3;
- (BOOL)updateMetadata:(Class)a3;
- (BOOL)updateMetadata:(Class)a3 pruningPolicy:(id)a4;
- (BOOL)updatePruningPolicy:(id)a3;
- (BOOL)verifyStreamHealthFrom:(double)a3 to:(double)a4 error:(id *)a5;
- (BOOL)verifyStreamHealthFromV1:(double)a3 to:(double)a4 frameStore:(id)a5 error:(id *)a6;
- (BOOL)verifyStreamHealthFromV2:(double)a3 to:(double)a4 frameStore:(id)a5 error:(id *)a6;
- (BOOL)writeEventBytes:(const void *)a3 length:(unint64_t)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6;
- (BOOL)writeEventBytes:(const void *)a3 length:(unint64_t)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6 outBookmark:(id *)a7;
- (BOOL)writeEventData:(id)a3 dataVersion:(unsigned int)a4 timestamp:(double)a5;
- (BOOL)writeEventData:(id)a3 dataVersion:(unsigned int)a4 timestamp:(double)a5 outBookmark:(id *)a6;
- (BOOL)writeEventWithEventBody:(id)a3;
- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4;
- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4 outBookmark:(id *)a5;
- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4 outEventSize:(unint64_t *)a5;
- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4 outEventSize:(unint64_t *)a5 outBookmark:(id *)a6;
- (Class)eventBodyClass;
- (NSString)segmentDirectory;
- (NSString)streamId;
- (NSString)streamPath;
- (double)timestampFromSegmentName:(id)a3;
- (id)_bookmarkWithSegmentName:(id)a3 offset:(unint64_t)a4 datastoreVersion:(unsigned int)a5;
- (id)fetchEventsFrom:(double)a3 to:(double)a4;
- (id)fetchEventsFrom:(double)a3 to:(double)a4 options:(unint64_t)a5;
- (id)initForPruningWithStream:(id)a3 config:(id)a4 includeTombstones:(BOOL)a5;
- (id)initForReadingWithStream:(id)a3 config:(id)a4 includeTombstones:(BOOL)a5;
- (id)initForWritingWithStream:(id)a3 config:(id)a4 includeTombstones:(BOOL)a5;
- (id)loadMetadata;
- (id)metadataPath;
- (id)newEnumeratorFromBookmark:(id)a3;
- (id)newEnumeratorFromBookmark:(id)a3 options:(unint64_t)a4;
- (id)newEnumeratorFromBookmark:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)newEnumeratorFromBookmarkEnumerator:(id)a3 error:(id *)a4;
- (id)newEnumeratorFromStartTime:(double)a3;
- (id)newEnumeratorFromStartTime:(double)a3 endTime:(double)a4 maxEvents:(unint64_t)a5 lastN:(unint64_t)a6 options:(unint64_t)a7;
- (id)newEnumeratorFromStartTime:(double)a3 endTime:(double)a4 maxEvents:(unint64_t)a5 options:(unint64_t)a6;
- (id)newEnumeratorFromStartTime:(double)a3 endTime:(double)a4 options:(unint64_t)a5;
- (id)newEnumeratorFromStartTime:(double)a3 options:(unint64_t)a4;
- (id)newTombstoneEnumeratorFromBookmark:(id)a3;
- (id)newTombstoneEnumeratorFromStartTime:(double)a3;
- (id)segmentContainingTimestamp:(double)a3;
- (id)segmentNames;
- (id)segmentWithFilename:(id)a3 error:(id *)a4;
- (id)tombstoneStore;
- (int)frameCountInStreamDataStoreFromSegmentsContainingTime:(double)a3 to:(double)a4;
- (int)frameCountInStreamDataStoreFromTime:(double)a3 to:(double)a4;
- (int64_t)cachingOptionsForFileHandleWithAttributes:(id)a3;
- (unint64_t)maxFileSize;
- (unint64_t)permission;
- (void)_removeEventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 policyID:(id)a6 pruneFutureEvents:(BOOL)a7 shouldDeleteUsingBlock:(id)a8;
- (void)didMarkFrameAsRemovedWithSegmentName:(id)a3 frame:(id)a4 reason:(unint64_t)a5 policyID:(id)a6 outTombstoneBookmark:(id *)a7;
- (void)enumerateEventsFrom:(double)a3 to:(double)a4 options:(unint64_t)a5 usingBlock:(id)a6;
- (void)eventBodyClass;
- (void)eventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 shouldDeleteUsingBlock:(id)a6;
- (void)fetchEventFromFrameStore:(id)a3 atOffset:(unint64_t)a4 withOptions:(unint64_t)a5 callback:(id)a6;
- (void)loadMetadata;
- (void)pruneStreamToMaxSegmentAge:(double)a3;
- (void)pruneStreamToMaxStreamSizeInBytes:(unint64_t)a3;
- (void)removeEventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 policyID:(id)a6 shouldDeleteUsingBlock:(id)a7;
- (void)removeEventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 pruneFutureEvents:(BOOL)a6 shouldDeleteUsingBlock:(id)a7;
- (void)removeEventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 pruneFutureEvents:(BOOL)a6 usingBlock:(id)a7;
- (void)segmentManager:(id)a3 willDeleteSegmentName:(id)a4 frameStore:(id)a5;
- (void)setDelegate:(id)a3;
- (void)syncMappedFiles;
- (void)writeTombstoneEventWithSegmentName:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 eventTimestamp:(double)a6 reason:(unint64_t)a7 policyID:(id)a8;
- (void)writeTombstoneEventWithSegmentName:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 eventTimestamp:(double)a6 reason:(unint64_t)a7 policyID:(id)a8 outTombstoneBookmark:(id *)a9;
@end

@implementation BMStreamDatastore

- (id)newEnumeratorFromBookmark:(id)a3 options:(unint64_t)a4
{
  return [(BMStreamDatastore *)self newEnumeratorFromBookmark:a3 options:a4 error:0];
}

- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4 outEventSize:(unint64_t *)a5
{
  return [(BMStreamDatastore *)self writeEventWithEventBody:a3 timestamp:a5 outEventSize:0 outBookmark:a4];
}

- (int64_t)cachingOptionsForFileHandleWithAttributes:(id)a3
{
  id v3 = a3;
  v4 = [v3 filename];
  v5 = [MEMORY[0x1E4F4FBA0] localDevice];
  if ([v4 isEqual:v5]) {
    goto LABEL_6;
  }
  v6 = [MEMORY[0x1E4F4FBA0] remoteDevices];
  if ([v4 isEqual:v6])
  {
LABEL_5:

LABEL_6:
    int64_t v8 = 1;
    goto LABEL_7;
  }
  v7 = [MEMORY[0x1E4F4FBA0] lock];
  if ([v4 isEqual:v7])
  {

    goto LABEL_5;
  }
  v10 = [MEMORY[0x1E4F4FBA0] tmp];
  char v11 = [v4 isEqual:v10];

  if (v11)
  {
    int64_t v8 = 1;
    goto LABEL_8;
  }
  v12 = [MEMORY[0x1E4F4FBA0] metadata];
  char v13 = [v4 isEqual:v12];

  if (v13)
  {
    int64_t v8 = 0;
    goto LABEL_8;
  }
  v14 = [v3 path];
  v5 = [v14 componentsSeparatedByString:@"/"];

  if ((unint64_t)[v5 count] < 2)
  {
    int64_t v8 = 2;
  }
  else
  {
    v15 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v5, "count") - 2);
    v16 = [MEMORY[0x1E4F4FBA0] remoteDevices];
    int v17 = [v15 isEqual:v16];

    if (v17) {
      int64_t v8 = 1;
    }
    else {
      int64_t v8 = 2;
    }
  }
LABEL_7:

LABEL_8:
  return v8;
}

void __76__BMStreamDatastore_fetchEventFromFrameStore_atOffset_withOptions_callback___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)newEnumeratorFromBookmark:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v15 = 0;
  v9 = [[BMStoreEnumerator alloc] initWithStreamDatastore:self bookmark:v8 options:a4 error:&v15];
  id v10 = v15;
  char v11 = v10;
  if (a5 && v10) {
    *a5 = v10;
  }
  if (!v9)
  {
    v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      streamId = self->_streamId;
      *(_DWORD *)buf = 138412802;
      int v17 = streamId;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      v21 = v11;
      _os_log_error_impl(&dword_1AD076000, v12, OS_LOG_TYPE_ERROR, "Failed to create enumerator with bookmark for stream: %@ %@ error: %@", buf, 0x20u);
    }
  }
  return v9;
}

- (void)fetchEventFromFrameStore:(id)a3 atOffset:(unint64_t)a4 withOptions:(unint64_t)a5 callback:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v12 = (void (**)(id, void, void *))a6;
  if (!v12)
  {
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"BMStreamDatastore.m", 888, @"Invalid parameter not satisfying: %@", @"callback" object file lineNumber description];
  }
  if (!v11)
  {
    id v11 = [(BMSegmentManager *)self->_segmentManager segmentAfterFrameStore:0 direction:(a5 >> 3) & 1];
  }
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  if (v11)
  {
    if (!v20[5])
    {
      while (1)
      {
        pruningPolicy = self->_pruningPolicy;
        if (pruningPolicy)
        {
          objc_msgSend(v11, "setFilterByAgeOnRead:", -[BMPruningPolicy filterByAgeOnRead](pruningPolicy, "filterByAgeOnRead"));
          objc_msgSend(v11, "setPruneOnAccess:", -[BMPruningPolicy pruneOnAccess](self->_pruningPolicy, "pruneOnAccess"));
          [(BMPruningPolicy *)self->_pruningPolicy maxAge];
          objc_msgSend(v11, "setMaxAge:");
        }
        if (![(BMSegmentManager *)self->_segmentManager isDataAccessible]) {
          break;
        }
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __76__BMStreamDatastore_fetchEventFromFrameStore_atOffset_withOptions_callback___block_invoke;
        v18[3] = &unk_1E5E787E8;
        v18[4] = &v19;
        [v11 enumerateWithOptions:a5 fromOffset:a4 usingBlock:v18];
        if (v20[5])
        {
          v14 = v11;
        }
        else
        {
          v14 = [(BMSegmentManager *)self->_segmentManager segmentAfterFrameStore:v11 direction:(a5 >> 3) & 1];
          if (!v14)
          {
            id v15 = __biome_log_for_category();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
              -[BMStreamDatastore fetchEventFromFrameStore:atOffset:withOptions:callback:]();
            }
            goto LABEL_21;
          }

          a4 = 0xFFFFFFFFLL;
          id v11 = v14;
        }
        if (v20[5]) {
          goto LABEL_23;
        }
      }
      id v15 = __biome_log_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        streamPath = self->_streamPath;
        *(_DWORD *)buf = 138543362;
        v26 = streamPath;
        _os_log_impl(&dword_1AD076000, v15, OS_LOG_TYPE_INFO, "Segment is no longer accessible: %{public}@", buf, 0xCu);
      }
LABEL_21:
    }
    v14 = v11;
  }
  else
  {
    v14 = 0;
  }
LABEL_23:
  v12[2](v12, v20[5], v14);
  _Block_object_dispose(&v19, 8);
}

- (BOOL)isDataAccessible
{
  return [(BMSegmentManager *)self->_segmentManager isDataAccessible];
}

- (BMStreamMetadata)metadata
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(BMStreamDatastore *)self loadMetadata];
  metadata = self->_metadata;
  self->_metadata = v4;

  v6 = self->_metadata;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)loadMetadata
{
  os_unfair_lock_assert_owner(&self->_lock);
  Class eventDataClass = self->_eventDataClass;
  if (self->_biomeLibrary)
  {
    if (!eventDataClass)
    {
      v4 = [MEMORY[0x1E4F4FBA8] legacyClassNameForLibraryStream:self->_streamId];
      v5 = v4;
      if (v4)
      {
        v6 = NSClassFromString(v4);
        self->_Class eventDataClass = v6;
        if (!v6) {
          goto LABEL_17;
        }
      }
      else if (!self->_eventDataClass)
      {
LABEL_17:
        __int16 v20 = __biome_log_for_category();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          [(BMStreamDatastore *)(uint64_t)&self->_streamId loadMetadata];
        }
      }
      if (!self->_pruningPolicy)
      {
        uint64_t v27 = __biome_log_for_category();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
          [(BMStreamDatastore *)(uint64_t)&self->_streamId loadMetadata];
        }
      }
    }
LABEL_25:
    v34 = [BMStreamMetadata alloc];
    streamId = self->_streamId;
    Class v36 = self->_eventDataClass;
    v37 = [(BMStoreConfig *)self->_config account];
    v38 = [(BMStoreConfig *)self->_config remoteName];
    uint64_t v19 = [(BMStreamMetadata *)v34 initWithStreamId:streamId eventType:v36 account:v37 remoteStreamName:v38 pruningPolicy:self->_pruningPolicy];

    goto LABEL_38;
  }
  if (eventDataClass && self->_pruningPolicy) {
    goto LABEL_25;
  }
  v7 = [(BMStreamDatastore *)self metadataPath];
  fileManager = self->_fileManager;
  id v46 = 0;
  v9 = [(BMFileManager *)fileManager fileHandleForFileAtPath:v7 flags:0x20000000 protection:3 error:&v46];
  id v10 = v46;
  id v11 = v10;
  if (v9)
  {
    id v45 = v10;
    v12 = [v9 readDataWithError:&v45];
    id v13 = v45;

    if (v12)
    {
      v14 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
      id v15 = v14;
      if (self->_eventDataClass)
      {
        uint64_t v16 = -[NSObject setByAddingObject:](v14, "setByAddingObject:");

        id v15 = v16;
      }
      id v44 = v13;
      int v17 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v15 fromData:v12 error:&v44];
      id v11 = v44;

      if (v11)
      {
        __int16 v18 = __biome_log_for_category();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[BMStreamDatastore loadMetadata]();
        }

        uint64_t v19 = 0;
      }
      else
      {
        v41 = [(BMStoreConfig *)self->_config remoteName];
        [v17 setRemoteStreamName:v41];

        v42 = [(BMStoreConfig *)self->_config account];
        [v17 setAccount:v42];

        uint64_t v19 = v17;
      }
    }
    else
    {
      id v15 = __biome_log_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        [(BMStreamDatastore *)(uint64_t)v13 loadMetadata];
      }
      uint64_t v19 = 0;
      id v11 = v13;
    }
  }
  else
  {
    v39 = [(BMSegmentManager *)self->_segmentManager segmentNames];
    uint64_t v40 = [v39 count];

    if (!v40)
    {
      uint64_t v19 = 0;
      goto LABEL_37;
    }
    v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(BMStreamDatastore *)(uint64_t)v11 loadMetadata];
    }
    uint64_t v19 = 0;
  }

LABEL_37:
LABEL_38:
  return v19;
}

- (NSString)streamId
{
  return self->_streamId;
}

- (BOOL)isSubscriptionStore
{
  return ((unint64_t)[(BMStoreConfig *)self->_config storeLocationOption] >> 2) & 1;
}

- (BOOL)isTombstoneStore
{
  return ((unint64_t)[(BMStoreConfig *)self->_config storeLocationOption] >> 1) & 1;
}

- (BMStoreConfig)config
{
  return self->_config;
}

- (NSString)segmentDirectory
{
  return self->_segmentDirectory;
}

- (id)segmentWithFilename:(id)a3 error:(id *)a4
{
  return [(BMSegmentManager *)self->_segmentManager segmentWithFilename:a3 error:a4];
}

- (id)metadataPath
{
  streamPath = self->_streamPath;
  id v3 = [MEMORY[0x1E4F4FBA0] metadata];
  v4 = [(NSString *)streamPath stringByAppendingPathComponent:v3];

  return v4;
}

- (BMStreamDatastore)initWithStream:(id)a3 permission:(unint64_t)a4 config:(id)a5 includeTombstones:(BOOL)a6 eventDataClass:(Class)a7 useCase:(id)a8
{
  return [(BMStreamDatastore *)self initWithStream:a3 streamPath:0 permission:a4 config:a5 includeTombstones:a6 eventDataClass:a7 useCase:a8];
}

- (BMStreamDatastore)initWithStream:(id)a3 streamPath:(id)a4 permission:(unint64_t)a5 config:(id)a6 includeTombstones:(BOOL)a7 eventDataClass:(Class)a8 useCase:(id)a9
{
  int v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a9;
  if (v10)
  {
    if (([(objc_class *)a8 isEqual:objc_opt_class()] & 1) != 0
      || ([v15 hasPrefix:@"_DKEvent."] & 1) != 0)
    {
      LOBYTE(v10) = 0;
    }
    else if (a5 == 2 {
           && ([v17 streamType] == 1
    }
            || [v17 streamType] == 2
            || [v17 streamType] == 4))
    {
      uint64_t v22 = __softlink__BiomeLibraryAndInternalLibraryNode();
      uint64_t v23 = [v22 streamWithIdentifier:v15 error:0];

      if (v23)
      {
        uint64_t v24 = [v23 valueForKeyPath:@"configuration.enableTombstoneSubstream"];
        LOBYTE(v10) = [v24 BOOLValue];
      }
      else
      {
        LOBYTE(v10) = 1;
      }
    }
    else
    {
      LOBYTE(v10) = 1;
    }
  }
  uint64_t v19 = [(BMStreamDatastore *)self initWithStream:v15 streamPath:v16 permission:a5 config:v17 eventDataClass:a8 useCase:v18];
  __int16 v20 = v19;
  if (v19) {
    v19->_includeTombstones = v10;
  }

  return v20;
}

- (BMStreamDatastore)initWithStream:(id)a3 streamPath:(id)a4 permission:(unint64_t)a5 config:(id)a6 eventDataClass:(Class)a7 useCase:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  v45.receiver = self;
  v45.super_class = (Class)BMStreamDatastore;
  id v18 = [(BMStreamDatastore *)&v45 init];
  uint64_t v19 = v18;
  if (v18)
  {
    v18->_lock._os_unfair_lock_opaque = 0;
    if ([v14 hasSuffix:@":tombstones"])
    {
      __int16 v20 = [v14 componentsSeparatedByString:@":"];
      uint64_t v21 = [v20 firstObject];

      uint64_t v22 = [v16 tombstonesConfig];
    }
    else
    {
      if (![v14 hasSuffix:@":subscriptions"])
      {
        if (!v16) {
          goto LABEL_10;
        }
        goto LABEL_6;
      }
      uint64_t v23 = [v14 componentsSeparatedByString:@":"];
      uint64_t v21 = [v23 firstObject];

      uint64_t v22 = [v16 subscriptionsConfig];
    }
    uint64_t v24 = (void *)v22;
    id v14 = (id)v21;

    id v16 = v24;
    if (!v24)
    {
LABEL_10:
      id v16 = +[BMStoreConfig newStreamDefaultConfigurationForPublicStream:0];
      if (!v15) {
        goto LABEL_11;
      }
      goto LABEL_12;
    }
LABEL_6:
    if (!v15)
    {
LABEL_11:
      uint64_t v25 = [v16 datastorePath];
      id v15 = [v25 stringByAppendingPathComponent:v14];

      if (!v15)
      {
        v43 = 0;
        goto LABEL_24;
      }
    }
LABEL_12:
    if ([v16 isManaged]
      && ([MEMORY[0x1E4F4FB80] current],
          uint64_t v26 = objc_claimAutoreleasedReturnValue(),
          char v27 = objc_msgSend(v26, "reliesOnDirectAccessForDomain:", objc_msgSend(v16, "domain")),
          v26,
          (v27 & 1) == 0))
    {
      uint64_t v28 = objc_msgSend(MEMORY[0x1E4F4FB68], "fileManagerWithMediatedAccessToDirectory:useCase:domain:user:", v15, v17, objc_msgSend(v16, "domain"), objc_msgSend(v16, "uid"));
    }
    else
    {
      uint64_t v28 = [MEMORY[0x1E4F4FB68] fileManagerWithDirectAccessToDirectory:v15 cachingOptions:3];
    }
    fileManager = v19->_fileManager;
    v19->_fileManager = (BMFileManager *)v28;

    [(BMFileManager *)v19->_fileManager setDelegate:v19];
    uint64_t v30 = [v16 resolvedPathWithStreamIdentifier:v14];
    segmentDirectory = v19->_segmentDirectory;
    v19->_segmentDirectory = (NSString *)v30;

    objc_storeStrong((id *)&v19->_config, v16);
    v19->_biomeLibrary = 0;
    if ([(BMStoreConfig *)v19->_config isManaged])
    {
      uint64_t v32 = __softlink__BiomeLibraryAndInternalLibraryNode();
      uint64_t v33 = [v32 streamWithIdentifier:v14 error:0];

      if (v33) {
        v19->_biomeLibrary = 1;
      }
    }
    v34 = [[BMSegmentManager alloc] initWithDirectory:v19->_segmentDirectory fileManager:v19->_fileManager permission:a5 config:v16];
    segmentManager = v19->_segmentManager;
    v19->_segmentManager = v34;

    [(BMSegmentManager *)v19->_segmentManager setDelegate:v19];
    uint64_t v36 = [v14 copy];
    streamId = v19->_streamId;
    v19->_streamId = (NSString *)v36;

    objc_storeStrong((id *)&v19->_streamPath, v15);
    v19->_permission = a5;
    unint64_t v38 = [v16 segmentSize];
    NSUInteger v39 = NSPageSize();
    if (v39 > v38) {
      uint64_t v40 = 1;
    }
    else {
      uint64_t v40 = v38 / v39;
    }
    v19->_maxFileSize = NSPageSize() * v40;
    uint64_t v41 = [v16 pruningPolicy];
    pruningPolicy = v19->_pruningPolicy;
    v19->_pruningPolicy = (BMPruningPolicy *)v41;

    v19->_Class eventDataClass = a7;
    objc_storeStrong((id *)&v19->_useCase, a8);
  }
  v43 = v19;

LABEL_24:
  return v43;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentManager, 0);
  objc_storeStrong((id *)&self->_segmentDirectory, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_streamId, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_tombstoneStore, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_pruningPolicy, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_streamPath, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

- (BOOL)writeEventWithEventBody:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(BMStreamDatastore *)self writeEventWithEventBody:v4 timestamp:0 outEventSize:0 outBookmark:CFAbsoluteTimeGetCurrent()];

  return (char)self;
}

- (void)removeEventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 policyID:(id)a6 shouldDeleteUsingBlock:(id)a7
{
}

- (void)_removeEventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 policyID:(id)a6 pruneFutureEvents:(BOOL)a7 shouldDeleteUsingBlock:(id)a8
{
  BOOL v9 = a7;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v14 = a6;
  id v15 = a8;
  if ([(BMStreamDatastore *)self isDataAccessible])
  {
    id v16 = [(BMStreamDatastore *)self delegate];
    id v17 = objc_opt_new();
    [v17 timeIntervalSince1970];
    if (v9 && v18 < 604800.0)
    {
      uint64_t v19 = __biome_log_for_category();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[BMStreamDatastore _removeEventsFrom:to:reason:policyID:pruneFutureEvents:shouldDeleteUsingBlock:]();
      }

      BOOL v9 = 0;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__0;
    v56 = __Block_byref_object_dispose__0;
    id v57 = (id)objc_opt_new();
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x2020000000;
    char v51 = 0;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    if (v9) {
      double v21 = -1.0;
    }
    else {
      double v21 = a4;
    }
    [(BMSegmentManager *)self->_segmentManager refreshSegmentsList];
    if ([(BMStreamDatastore *)self isTombstoneStore]
      || [(BMStreamDatastore *)self isSubscriptionStore])
    {
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v22 = [(BMStreamDatastore *)self metadata];
    }
    segmentManager = self->_segmentManager;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __99__BMStreamDatastore__removeEventsFrom_to_reason_policyID_pruneFutureEvents_shouldDeleteUsingBlock___block_invoke;
    v36[3] = &unk_1E5E78918;
    double v43 = a3;
    v36[4] = self;
    p_long long buf = &buf;
    id v26 = v22;
    id v37 = v26;
    BOOL v47 = v9;
    CFAbsoluteTime v44 = Current;
    id v40 = v15;
    uint64_t v23 = v16;
    unint64_t v38 = v23;
    unint64_t v45 = a5;
    id v39 = v14;
    v42 = &v48;
    double v46 = a4;
    [(BMSegmentManager *)segmentManager enumerateSegmentsFrom:v36 to:a3 withBlock:v21];
    if (*((unsigned char *)v49 + 24))
    {
      char v27 = __biome_log_for_category();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[BMStreamDatastore _removeEventsFrom:to:reason:policyID:pruneFutureEvents:shouldDeleteUsingBlock:]();
      }
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v28 = *(id *)(*((void *)&buf + 1) + 40);
    uint64_t v29 = [v28 countByEnumeratingWithState:&v32 objects:v52 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v33;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v33 != v30) {
            objc_enumerationMutation(v28);
          }
          -[BMSegmentManager removeSegmentNamed:](self->_segmentManager, "removeSegmentNamed:", *(void *)(*((void *)&v32 + 1) + 8 * v31++), (void)v32);
        }
        while (v29 != v31);
        uint64_t v29 = [v28 countByEnumeratingWithState:&v32 objects:v52 count:16];
      }
      while (v29);
    }

    [(BMSegmentManager *)self->_segmentManager refreshSegmentsList];
    if (objc_opt_respondsToSelector()) {
      [v23 didPruneEvents];
    }

    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v23 = __biome_log_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = [(BMStreamDatastore *)self streamId];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v24;
      _os_log_impl(&dword_1AD076000, v23, OS_LOG_TYPE_INFO, "Pruner does not have access to stream due to lock state for stream %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
}

- (BOOL)updateMetadata:(Class)a3 pruningPolicy:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v6 = (BMPruningPolicy *)a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_biomeLibrary
    && ![(BMStreamDatastore *)self isTombstoneStore]
    && ![(BMStreamDatastore *)self isSubscriptionStore])
  {
    p_metadata = (id *)&self->_metadata;
    metadata = self->_metadata;
    if (!metadata)
    {
      uint64_t v12 = [(BMStreamDatastore *)self loadMetadata];
      id v13 = *p_metadata;
      id *p_metadata = (id)v12;

      metadata = (BMStreamMetadata *)*p_metadata;
    }
    if ([(BMStreamMetadata *)metadata eventDataClass]
      && (-[objc_class isEqual:](a3, "isEqual:", [*p_metadata eventDataClass]) & 1) == 0)
    {
      uint64_t v19 = __biome_log_for_category();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[BMStreamDatastore updateMetadata:pruningPolicy:]((uint64_t)a3, [*p_metadata eventDataClass], v22, v19);
      }
    }
    else
    {
      id v14 = [BMStreamMetadata alloc];
      streamId = self->_streamId;
      id v16 = [(BMStoreConfig *)self->_config account];
      id v17 = [(BMStoreConfig *)self->_config remoteName];
      pruningPolicy = v6;
      if (!v6) {
        pruningPolicy = self->_pruningPolicy;
      }
      uint64_t v19 = [(BMStreamMetadata *)v14 initWithStreamId:streamId eventType:a3 account:v16 remoteStreamName:v17 pruningPolicy:pruningPolicy];

      if (([*p_metadata isEqual:v19] & 1) != 0
        || (objc_storeStrong((id *)&self->_metadata, v19),
            [(BMStreamDatastore *)self saveMetadata:self->_metadata]))
      {
        BOOL v8 = 1;
LABEL_21:

        goto LABEL_5;
      }
      __int16 v20 = __biome_log_for_category();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        double v21 = [(BMStreamDatastore *)self streamId];
        -[BMStreamDatastore updateMetadata:pruningPolicy:](v21, v22, v20);
      }
    }
    BOOL v8 = 0;
    goto LABEL_21;
  }
  BOOL v8 = 1;
LABEL_5:
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)newEnumeratorFromStartTime:(double)a3 endTime:(double)a4 maxEvents:(unint64_t)a5 lastN:(unint64_t)a6 options:(unint64_t)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = [BMStoreEnumerator alloc];
  if (!self->_permission)
  {
    if ([(BMPruningPolicy *)self->_pruningPolicy pruneOnAccess])
    {
      if ([(BMPruningPolicy *)self->_pruningPolicy filterByAgeOnRead])
      {
        [(BMPruningPolicy *)self->_pruningPolicy maxAge];
        if (v14 > 0.0)
        {
          double Current = CFAbsoluteTimeGetCurrent();
          [(BMPruningPolicy *)self->_pruningPolicy maxAge];
          double v17 = Current - v16;
          double v18 = 0.0;
          if ((a7 & 8) == 0) {
            double v18 = v17;
          }
          if (v17 > a3) {
            a3 = v18;
          }
        }
      }
    }
  }
  if (!a6) {
    a5 = 0;
  }
  uint64_t v19 = v13;
  __int16 v20 = [(BMStoreEnumerator *)v19 initWithStreamDatastore:self startTime:a5 endTime:a6 maxEvents:a7 lastN:[(BMStreamDatastore *)self eventBodyClass] options:a3 dataType:a4];

  if (!v20)
  {
    double v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      streamId = self->_streamId;
      int v24 = 138413058;
      uint64_t v25 = streamId;
      __int16 v26 = 2048;
      double v27 = a3;
      __int16 v28 = 2048;
      double v29 = a4;
      __int16 v30 = 2048;
      unint64_t v31 = a7;
      _os_log_error_impl(&dword_1AD076000, v21, OS_LOG_TYPE_ERROR, "Failed to create enumerator for stream: %@ startTime: %f endTime: %f, options: %lu", (uint8_t *)&v24, 0x2Au);
    }
  }
  return v20;
}

- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4 outEventSize:(unint64_t *)a5 outBookmark:(id *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (!v10)
  {
    uint64_t v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      id v13 = "Attempt to write nil event";
      goto LABEL_12;
    }
LABEL_13:
    BOOL v16 = 0;
    goto LABEL_26;
  }
  if ([(BMStreamDatastore *)self isTombstoneStore])
  {
    uint64_t v11 = objc_opt_class();
    if (v11 != objc_opt_class())
    {
      uint64_t v12 = __biome_log_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        id v13 = "Attempt to write non-tombstone to tombstone store";
LABEL_12:
        _os_log_impl(&dword_1AD076000, v12, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v21, 2u);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else
  {
    BOOL v14 = [(BMStreamDatastore *)self isSubscriptionStore];
    id v15 = (objc_class *)objc_opt_class();
    if (v14)
    {
      if (v15 != (objc_class *)objc_opt_class())
      {
        uint64_t v12 = __biome_log_for_category();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v21) = 0;
          id v13 = "Attempt to write non-subscription to subscription store";
          goto LABEL_12;
        }
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v12 = NSStringFromClass(v15);
      if ([(BMStreamDatastore *)self eventBodyClass])
      {
        if (([(objc_class *)[(BMStreamDatastore *)self eventBodyClass] isEqual:objc_opt_class()] & 1) == 0)
        {
          double v17 = __biome_log_for_category();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
            -[BMStreamDatastore writeEventWithEventBody:timestamp:outEventSize:outBookmark:]((uint64_t)v12, self, v17);
          }

          goto LABEL_13;
        }
      }
      else
      {
        double v18 = __biome_log_for_category();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v21 = 138543362;
          uint64_t v22 = v12;
          _os_log_impl(&dword_1AD076000, v18, OS_LOG_TYPE_INFO, "Data type will be set to %{public}@", (uint8_t *)&v21, 0xCu);
        }
      }
      [(BMStreamDatastore *)self updateMetadata:objc_opt_class()];
    }
  }
  uint64_t v19 = [v10 serialize];
  uint64_t v12 = v19;
  if (a5) {
    *a5 = [v19 length];
  }
  BOOL v16 = -[BMStreamDatastore writeEventData:dataVersion:timestamp:outBookmark:](self, "writeEventData:dataVersion:timestamp:outBookmark:", v12, [v10 dataVersion], a6, a4);
LABEL_26:

  return v16;
}

- (Class)eventBodyClass
{
  if ([(BMStreamDatastore *)self isTombstoneStore]
    || [(BMStreamDatastore *)self isSubscriptionStore])
  {
    objc_opt_class();
    id v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    Class eventDataClass = self->_eventDataClass;
    if (!eventDataClass)
    {
      v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(BMStreamDatastore *)(uint64_t)self eventBodyClass];
      }

      v6 = [(BMStreamDatastore *)self metadata];
      self->_Class eventDataClass = (Class)[v6 eventDataClass];

      Class eventDataClass = self->_eventDataClass;
    }
    id v3 = eventDataClass;
  }
  return v3;
}

- (BOOL)writeEventData:(id)a3 dataVersion:(unsigned int)a4 timestamp:(double)a5 outBookmark:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  uint64_t v11 = v10;
  if (v10)
  {
    BOOL v12 = -[BMStreamDatastore writeEventBytes:length:dataVersion:timestamp:outBookmark:](self, "writeEventBytes:length:dataVersion:timestamp:outBookmark:", [v10 bytes], objc_msgSend(v10, "length"), v8, a6, a5);
  }
  else
  {
    id v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BMStreamDatastore writeEventData:dataVersion:timestamp:outBookmark:]();
    }

    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)writeEventBytes:(const void *)a3 length:(unint64_t)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6 outBookmark:(id *)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  BOOL v12 = [(BMStreamDatastore *)self currentFrameStore];
  if ([v12 start]) {
    [(BMStreamDatastore *)self currentFrameStore];
  }
  else {
  id v13 = [(BMSegmentManager *)self->_segmentManager lastFrameStoreOrCreateWithTimestamp:a6];
  }

  if (v13)
  {
    uint64_t v46 = 0;
    BOOL v14 = [v13 segmentName];
    if ([(BMStreamDatastore *)self isDataAccessible])
    {
      double v43 = a7;
      unsigned int v15 = [v13 writeFrameForBytes:a3 length:a4 dataVersion:a5 timestamp:&v46 outOffset:a6];
      if (v15 != 2)
      {
        unsigned int v21 = v15;
        uint64_t v20 = (uint64_t)v14;
LABEL_23:
        if (v21)
        {
          uint64_t v25 = __biome_log_for_category();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            uint64_t v41 = [(BMStreamDatastore *)self streamPath];
            v42 = NSStringFromBMFrameWriteStatus(v21);
            *(_DWORD *)long long buf = 138413058;
            *(void *)&uint8_t buf[4] = v41;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = a4;
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)uint64_t v48 = a5;
            *(_WORD *)&v48[4] = 2114;
            *(void *)&v48[6] = v42;
            _os_log_error_impl(&dword_1AD076000, v25, OS_LOG_TYPE_ERROR, "Failed to write frame for: %@, length: %zu dataVersion: %u writeStatus: %{public}@", buf, 0x26u);
          }
          BOOL v23 = 0;
        }
        else
        {
          streamId = self->_streamId;
          if (!streamId) {
            goto LABEL_31;
          }
          if (![(NSString *)streamId length]) {
            goto LABEL_31;
          }
          uint64_t v27 = [v13 segmentName];
          if (!v27
            || (__int16 v28 = (void *)v27,
                [v13 segmentName],
                double v29 = objc_claimAutoreleasedReturnValue(),
                uint64_t v30 = [v29 length],
                v29,
                v28,
                !v30))
          {
LABEL_31:
            unint64_t v31 = __biome_log_for_category();
            *(void *)long long buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000;
            v48[0] = 16;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __78__BMStreamDatastore_writeEventBytes_length_dataVersion_timestamp_outBookmark___block_invoke;
            block[3] = &unk_1E5E78708;
            block[4] = buf;
            if (writeEventBytes_length_dataVersion_timestamp_outBookmark__onceToken != -1) {
              dispatch_once(&writeEventBytes_length_dataVersion_timestamp_outBookmark__onceToken, block);
            }
            os_log_type_t v32 = *(unsigned char *)(*(void *)&buf[8] + 24);
            _Block_object_dispose(buf, 8);
            if (os_log_type_enabled(v31, v32))
            {
              long long v33 = self->_streamId;
              uint64_t v34 = [(NSString *)v33 length];
              long long v35 = [v13 segmentName];
              uint64_t v36 = [v13 segmentName];
              uint64_t v37 = [v36 length];
              *(_DWORD *)long long buf = 138413570;
              *(void *)&uint8_t buf[4] = v33;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v34;
              *(_WORD *)&buf[22] = 2112;
              *(void *)uint64_t v48 = v35;
              *(_WORD *)&v48[8] = 2048;
              *(void *)&v48[10] = v37;
              __int16 v49 = 2112;
              uint64_t v50 = v13;
              __int16 v51 = 2112;
              uint64_t v52 = v20;
              _os_log_impl(&dword_1AD076000, v31, v32, "Calling _bookmarkWithSegmentName(streamId=%@ (len=%lu), segmentName=%@ (len=%lu)) frameStore=%@, segment before write=%@", buf, 0x3Eu);
            }
          }
          if (v43)
          {
            unint64_t v38 = [v13 segmentName];
            id *v43 = [(BMStreamDatastore *)self _bookmarkWithSegmentName:v38 offset:v46 datastoreVersion:[v13 datastoreVersion]];
          }
          BOOL v23 = 1;
        }
        BOOL v14 = (void *)v20;
        goto LABEL_46;
      }
      unsigned int v16 = 0;
      double v17 = v13;
      while (1)
      {
        double v18 = (void *)MEMORY[0x1AD11E210]();
        uint64_t v19 = __biome_log_for_category();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 134217984;
          *(void *)&uint8_t buf[4] = a4;
          _os_log_impl(&dword_1AD076000, v19, OS_LOG_TYPE_INFO, "Not enough free space to write event of size %zu. Attempting to create new segment", buf, 0xCu);
        }

        id v13 = [(BMSegmentManager *)self->_segmentManager segmentAfterFrameStore:v17 orCreateSegmentWithTimestamp:a6];

        if (!v13) {
          break;
        }
        if (![(BMStreamDatastore *)self isDataAccessible])
        {
          id v39 = __biome_log_for_category();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            -[BMStreamDatastore writeEventBytes:length:dataVersion:timestamp:outBookmark:](self);
          }
          goto LABEL_44;
        }
        uint64_t v20 = [v13 segmentName];

        unsigned int v21 = [v13 writeFrameForBytes:a3 length:a4 dataVersion:a5 timestamp:&v46 outOffset:a6];
        if (v21 == 2)
        {
          double v17 = v13;
          BOOL v14 = (void *)v20;
          if (v16++ < 9) {
            continue;
          }
        }
        goto LABEL_23;
      }
      id v39 = __biome_log_for_category();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[BMStreamDatastore writeEventBytes:length:dataVersion:timestamp:outBookmark:](self);
      }
LABEL_44:
    }
    else
    {
      int v24 = __biome_log_for_category();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[BMStreamDatastore writeEventBytes:length:dataVersion:timestamp:outBookmark:](self);
      }
    }
    BOOL v23 = 0;
LABEL_46:

    goto LABEL_47;
  }
  id v13 = __biome_log_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[BMStreamDatastore writeEventBytes:length:dataVersion:timestamp:outBookmark:](self);
  }
  BOOL v23 = 0;
LABEL_47:

  return v23;
}

- (BMFrameStore)currentFrameStore
{
  return [(BMSegmentManager *)self->_segmentManager currentFrameStore];
}

- (BOOL)updateMetadata:(Class)a3
{
  if (self->_biomeLibrary
    || [(BMStreamDatastore *)self isTombstoneStore]
    || [(BMStreamDatastore *)self isSubscriptionStore])
  {
    return 1;
  }
  return [(BMStreamDatastore *)self updateMetadata:a3 pruningPolicy:0];
}

- (id)segmentContainingTimestamp:(double)a3
{
  return [(BMSegmentManager *)self->_segmentManager segmentContainingTimestamp:a3];
}

- (void)eventBodyClass
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 112);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1AD076000, a2, OS_LOG_TYPE_ERROR, "Data type not yet set for stream %{public}@, please switch to APIs that take eventDataClass as a parameter.", (uint8_t *)&v3, 0xCu);
}

- (BMStreamDatastorePruningDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BMStreamDatastorePruningDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BMStreamDatastore)initWithStream:(id)a3 permission:(unint64_t)a4 config:(id)a5
{
  return [(BMStreamDatastore *)self initWithStream:a3 streamPath:0 permission:a4 config:a5 eventDataClass:0 useCase:*MEMORY[0x1E4F4FAF8]];
}

- (BMStreamDatastore)initWithStream:(id)a3 streamPath:(id)a4 permission:(unint64_t)a5 config:(id)a6
{
  return [(BMStreamDatastore *)self initWithStream:a3 streamPath:a4 permission:a5 config:a6 eventDataClass:0 useCase:*MEMORY[0x1E4F4FAF8]];
}

- (id)segmentNames
{
  return [(BMSegmentManager *)self->_segmentManager segmentNames];
}

- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4
{
  return [(BMStreamDatastore *)self writeEventWithEventBody:a3 timestamp:0 outBookmark:a4];
}

- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4 outBookmark:(id *)a5
{
  return [(BMStreamDatastore *)self writeEventWithEventBody:a3 timestamp:0 outEventSize:a5 outBookmark:a4];
}

- (id)fetchEventsFrom:(double)a3 to:(double)a4
{
  return [(BMStreamDatastore *)self fetchEventsFrom:0 to:a3 options:a4];
}

- (id)fetchEventsFrom:(double)a3 to:(double)a4 options:(unint64_t)a5
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  unsigned int v15 = __Block_byref_object_copy__0;
  unsigned int v16 = __Block_byref_object_dispose__0;
  id v17 = (id)objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__BMStreamDatastore_fetchEventsFrom_to_options___block_invoke;
  v11[3] = &unk_1E5E788A0;
  v11[4] = &v12;
  [(BMStreamDatastore *)self enumerateEventsFrom:a5 to:v11 options:a3 usingBlock:a4];
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __48__BMStreamDatastore_fetchEventsFrom_to_options___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
  }
  return 1;
}

- (void)removeEventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 pruneFutureEvents:(BOOL)a6 usingBlock:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__BMStreamDatastore_removeEventsFrom_to_reason_pruneFutureEvents_usingBlock___block_invoke;
  v14[3] = &unk_1E5E788C8;
  id v15 = v12;
  id v13 = v12;
  [(BMStreamDatastore *)self removeEventsFrom:a5 to:v7 reason:v14 pruneFutureEvents:a3 shouldDeleteUsingBlock:a4];
}

uint64_t __77__BMStreamDatastore_removeEventsFrom_to_reason_pruneFutureEvents_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  [a2 timestamp];
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a3);
  return 1;
}

- (void)removeEventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 pruneFutureEvents:(BOOL)a6 shouldDeleteUsingBlock:(id)a7
{
}

void __99__BMStreamDatastore__removeEventsFrom_to_reason_policyID_pruneFutureEvents_shouldDeleteUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (v7)
  {
    uint64_t v49 = 0;
    uint64_t v50 = &v49;
    uint64_t v51 = 0x2020000000;
    int v52 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = &v45;
    uint64_t v47 = 0x2020000000;
    int v48 = 0;
    uint64_t v39 = 0;
    id v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__0;
    double v43 = __Block_byref_object_dispose__0;
    id v44 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __99__BMStreamDatastore__removeEventsFrom_to_reason_policyID_pruneFutureEvents_shouldDeleteUsingBlock___block_invoke_2;
    v22[3] = &unk_1E5E788F0;
    v22[4] = *(void *)(a1 + 32);
    uint64_t v33 = a4;
    id v9 = v7;
    id v23 = v9;
    id v24 = *(id *)(a1 + 40);
    double v29 = &v49;
    char v38 = *(unsigned char *)(a1 + 120);
    uint64_t v34 = *(void *)(a1 + 96);
    id v28 = *(id *)(a1 + 64);
    id v25 = *(id *)(a1 + 48);
    uint64_t v30 = &v45;
    unint64_t v31 = &v39;
    id v10 = v8;
    uint64_t v11 = *(void *)(a1 + 104);
    id v26 = v10;
    uint64_t v35 = v11;
    id v12 = *(id *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 80);
    id v27 = v12;
    uint64_t v32 = v13;
    uint64_t v14 = *(void *)(a1 + 112);
    uint64_t v36 = *(void *)(a1 + 88);
    uint64_t v37 = v14;
    [v9 enumerateFromOffset:0 withCallback:v22];
    if (*((_DWORD *)v50 + 6) == *((_DWORD *)v46 + 6)
      && ([*(id *)(*(void *)(a1 + 32) + 136) lastSegmentName],
          id v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v15 isEqual:v10],
          v15,
          (v16 & 1) == 0))
    {
      uint64_t v20 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      unsigned int v21 = [v9 segmentName];
      [v20 addObject:v21];
    }
    else if (v40[5] && [v9 datastoreVersion] == 10)
    {
      [v9 updateHighestDeletedFrameV2:v40[5] addToDeletedFrameCount:*((unsigned int *)v46 + 6)];
    }

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v49, 8);
  }
  else
  {
    +[BMSegmentManager timestampFromSegmentName:v8];
    if (v17 >= *(double *)(a1 + 88))
    {
      double v18 = [*(id *)(*(void *)(a1 + 32) + 136) lastSegmentName];
      char v19 = [v18 isEqual:v8];

      if ((v19 & 1) == 0) {
        [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v8];
      }
    }
  }
}

void __99__BMStreamDatastore__removeEventsFrom_to_reason_policyID_pruneFutureEvents_shouldDeleteUsingBlock___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if ([*(id *)(a1 + 32) isDataAccessible])
  {
    id v7 = [BMStoreEvent alloc];
    id v8 = [*(id *)(a1 + 40) segmentName];
    id v9 = [(BMStoreEvent *)v7 initWithFrame:v6 segmentName:v8 error:1 eventCategory:0 metadata:*(void *)(a1 + 48) dataType:0];

    [v6 creationTimestamp];
    double v11 = v10;
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    if (*(unsigned char *)(a1 + 160)
      && v10 > *(double *)(a1 + 128)
      && (*(unsigned int (**)(void))(*(void *)(a1 + 80) + 16))())
    {
      if (objc_opt_respondsToSelector()) {
        [*(id *)(a1 + 56) willPruneEvent:v9];
      }
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
      [*(id *)(a1 + 40) markFrameAsRemoved:v6];
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), a2);
      if (([*(id *)(a1 + 32) isTombstoneStore] & 1) == 0
        && ([*(id *)(a1 + 32) isSubscriptionStore] & 1) == 0)
      {
        [*(id *)(a1 + 32) didMarkFrameAsRemovedWithSegmentName:*(void *)(a1 + 64) frame:v6 reason:*(void *)(a1 + 136) policyID:*(void *)(a1 + 72) outTombstoneBookmark:0];
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 1;
    }
    else if (v11 >= *(double *)(a1 + 144) {
           && v11 <= *(double *)(a1 + 152)
    }
           && (*(unsigned int (**)(void))(*(void *)(a1 + 80) + 16))())
    {
      if (objc_opt_respondsToSelector()) {
        [*(id *)(a1 + 56) willPruneEvent:v9];
      }
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
      [*(id *)(a1 + 40) markFrameAsRemoved:v6];
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), a2);
      if (([*(id *)(a1 + 32) isTombstoneStore] & 1) == 0
        && ([*(id *)(a1 + 32) isSubscriptionStore] & 1) == 0)
      {
        [*(id *)(a1 + 32) didMarkFrameAsRemovedWithSegmentName:*(void *)(a1 + 64) frame:v6 reason:*(void *)(a1 + 136) policyID:*(void *)(a1 + 72) outTombstoneBookmark:0];
      }
    }
    else if (v11 > *(double *)(a1 + 152) && !*(unsigned char *)(a1 + 160))
    {
      *a3 = 1;
LABEL_27:
      **(unsigned char **)(a1 + 120) = 1;
LABEL_28:

      goto LABEL_29;
    }
    if (!*a3) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  id v12 = __biome_log_for_category();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [*(id *)(a1 + 32) streamId];
    int v14 = 138543362;
    id v15 = v13;
    _os_log_impl(&dword_1AD076000, v12, OS_LOG_TYPE_INFO, "Pruner does not have access to stream due to lock state for stream %{public}@", (uint8_t *)&v14, 0xCu);
  }
  *a3 = 1;
  **(unsigned char **)(a1 + 120) = 1;
LABEL_29:
}

- (void)eventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 shouldDeleteUsingBlock:(id)a6
{
}

- (void)syncMappedFiles
{
  id v2 = [(BMStreamDatastore *)self currentFrameStore];
  [v2 sync];
}

- (id)newEnumeratorFromStartTime:(double)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v5 timeIntervalSinceReferenceDate];
  id v7 = [(BMStreamDatastore *)self newEnumeratorFromStartTime:-1 endTime:-1 maxEvents:0 lastN:a3 options:v6];

  return v7;
}

- (id)newEnumeratorFromStartTime:(double)a3 options:(unint64_t)a4
{
  id v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v7 timeIntervalSinceReferenceDate];
  id v9 = [(BMStreamDatastore *)self newEnumeratorFromStartTime:-1 endTime:-1 maxEvents:a4 lastN:a3 options:v8];

  return v9;
}

- (id)newEnumeratorFromStartTime:(double)a3 endTime:(double)a4 options:(unint64_t)a5
{
  return [(BMStreamDatastore *)self newEnumeratorFromStartTime:-1 endTime:-1 maxEvents:a5 lastN:a3 options:a4];
}

- (id)newEnumeratorFromStartTime:(double)a3 endTime:(double)a4 maxEvents:(unint64_t)a5 options:(unint64_t)a6
{
  return [(BMStreamDatastore *)self newEnumeratorFromStartTime:a5 endTime:-1 maxEvents:a6 lastN:a3 options:a4];
}

- (id)newEnumeratorFromBookmark:(id)a3
{
  return [(BMStreamDatastore *)self newEnumeratorFromBookmark:a3 options:0];
}

- (double)timestampFromSegmentName:(id)a3
{
  +[BMSegmentManager timestampFromSegmentName:a3];
  return result;
}

- (id)newEnumeratorFromBookmarkEnumerator:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v12 = 0;
  id v7 = [[BMStoreEnumerator alloc] initWithStreamDatastore:self bookmarkEnumerator:v6 error:&v12];
  id v8 = v12;
  if (!v7)
  {
    id v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      streamId = self->_streamId;
      *(_DWORD *)long long buf = 138412802;
      id v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = streamId;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_error_impl(&dword_1AD076000, v9, OS_LOG_TYPE_ERROR, "Failed to create enumerator with bookmarkEnumerator: %@ for stream: %@ error: %@", buf, 0x20u);
    }
  }
  if (a4) {
    *a4 = v8;
  }

  return v7;
}

- (BOOL)deleteEventAtBookmark:(id)a3 outTombstoneBookmark:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(BMStreamDatastore *)self isDataAccessible])
  {
    id v26 = 0;
    id v7 = [[BMStoreEnumerator alloc] initWithStreamDatastore:self bookmark:v6 options:3 error:&v26];
    id v8 = v26;
    if (v8)
    {
      BOOL v9 = BMStorageErrorGetErrno() == 2;
      double v10 = __biome_log_for_category();
      double v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          streamId = self->_streamId;
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = streamId;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v6;
          _os_log_impl(&dword_1AD076000, v11, OS_LOG_TYPE_INFO, "Unable to delete event at bookmark because segment has already been deleted: %@ %@", buf, 0x16u);
        }

        if (a4) {
          *a4 = 0;
        }
        BOOL v13 = 1;
      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = self->_streamId;
          *(_DWORD *)long long buf = 138412802;
          *(void *)&uint8_t buf[4] = v16;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v6;
          *(_WORD *)&buf[22] = 2112;
          id v28 = (uint64_t (*)(uint64_t, uint64_t))v8;
          _os_log_error_impl(&dword_1AD076000, v11, OS_LOG_TYPE_ERROR, "Failed to create enumerator for deleting event: %@ %@ error: %@", buf, 0x20u);
        }

        BOOL v13 = 0;
        if (a4) {
          *a4 = 0;
        }
      }
    }
    else
    {
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      id v28 = __Block_byref_object_copy__0;
      double v29 = __Block_byref_object_dispose__0;
      id v30 = 0;
      uint64_t v22 = 0;
      id v23 = &v22;
      uint64_t v24 = 0x2020000000;
      char v25 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __64__BMStreamDatastore_deleteEventAtBookmark_outTombstoneBookmark___block_invoke;
      v17[3] = &unk_1E5E78940;
      id v18 = v6;
      uint64_t v19 = self;
      uint64_t v20 = &v22;
      unsigned int v21 = buf;
      [(BMStoreEnumerator *)v7 nextEventWithContext:v17];
      if (a4) {
        *a4 = *(id *)(*(void *)&buf[8] + 40);
      }
      BOOL v13 = *((unsigned char *)v23 + 24) != 0;

      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    id v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v14 = [(BMStreamDatastore *)self streamId];
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl(&dword_1AD076000, v8, OS_LOG_TYPE_INFO, "Pruner does not have access to stream due to lock state for stream %{public}@", buf, 0xCu);
    }
    BOOL v13 = 0;
  }

  return v13;
}

void __64__BMStreamDatastore_deleteEventAtBookmark_outTombstoneBookmark___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 frame];
    int v8 = [v6 datastoreVersion];
    uint64_t v9 = [v7 framePtr];
    if (v8 == 9) {
      unint64_t v10 = bm_frame_header_statusV1((unint64_t *)v9) >> 32;
    }
    else {
      LODWORD(v10) = *(_DWORD *)(v9 + 4);
    }
    if ((v10 & 0xFFFFFFFE) == 2)
    {
      BOOL v13 = __biome_log_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v26 = v14;
        __int16 v27 = 1024;
        int v28 = v10;
        _os_log_impl(&dword_1AD076000, v13, OS_LOG_TYPE_DEFAULT, "deleteEventAtBookmark: event at bookmark %@ already in deleted state %u", buf, 0x12u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      __int16 v15 = [v5 frame];
      [v6 markFrameAsRemoved:v15];

      if ([v6 datastoreVersion] == 10)
      {
        uint64_t v16 = [v5 frame];
        [v6 updateHighestDeletedFrameV2:v16 addToDeletedFrameCount:1];
      }
      if (([*(id *)(a1 + 40) isTombstoneStore] & 1) != 0
        || ([*(id *)(a1 + 40) isSubscriptionStore] & 1) != 0)
      {
        id v17 = 0;
      }
      else
      {
        id v18 = *(void **)(a1 + 40);
        uint64_t v19 = [v6 segmentName];
        uint64_t v20 = [v5 frame];
        id v24 = 0;
        [v18 didMarkFrameAsRemovedWithSegmentName:v19 frame:v20 reason:2 policyID:0 outTombstoneBookmark:&v24];
        id v17 = v24;
      }
      uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v17;
      id v23 = v17;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  else
  {
    double v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v26 = v12;
      _os_log_impl(&dword_1AD076000, v11, OS_LOG_TYPE_DEFAULT, "deleteEventAtBookmark: couldn't find event with bookmark %@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)enumerateEventsFrom:(double)a3 to:(double)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  uint64_t v19 = (unsigned int (**)(id, void *))a6;
  if (a3 <= a4)
  {
    if ((a5 & 8) != 0) {
      double v11 = a3;
    }
    else {
      double v11 = a4;
    }
    if ((a5 & 8) != 0) {
      double v12 = a4;
    }
    else {
      double v12 = a3;
    }
    id v13 = [(BMStreamDatastore *)self newEnumeratorFromStartTime:a5 endTime:v12 options:v11];
    uint64_t v14 = [v13 nextEvent];
    if (v14)
    {
      __int16 v15 = (void *)v14;
      do
      {
        [v15 timestamp];
        if ((a5 & 8) != 0)
        {
          if (v16 < a3) {
            break;
          }
        }
        else if (v16 > a4)
        {
          break;
        }
        if (!v19[2](v19, v15)) {
          break;
        }
        uint64_t v17 = [v13 nextEvent];

        __int16 v15 = (void *)v17;
      }
      while (v17);
    }
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"BMStreamDatastore.m", 729, @"Invalid parameter not satisfying: %@", @"start <= end" object file lineNumber description];
  }
}

- (BOOL)writeEventData:(id)a3 dataVersion:(unsigned int)a4 timestamp:(double)a5
{
  return [(BMStreamDatastore *)self writeEventData:a3 dataVersion:*(void *)&a4 timestamp:0 outBookmark:a5];
}

- (BOOL)writeEventBytes:(const void *)a3 length:(unint64_t)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6
{
  return [(BMStreamDatastore *)self writeEventBytes:a3 length:a4 dataVersion:*(void *)&a5 timestamp:0 outBookmark:a6];
}

- (id)_bookmarkWithSegmentName:(id)a3 offset:(unint64_t)a4 datastoreVersion:(unsigned int)a5
{
  if (a5 == 9) {
    unint64_t v6 = a4 - 56;
  }
  else {
    unint64_t v6 = a4;
  }
  id v7 = a3;
  int v8 = [[BMStoreBookmark alloc] initWithStream:self->_streamId segment:v7 iterationStartTime:v6 offset:CFAbsoluteTimeGetCurrent()];

  return v8;
}

uint64_t __78__BMStreamDatastore_writeEventBytes_length_dataVersion_timestamp_outBookmark___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (BOOL)saveMetadata:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_biomeLibrary)
  {
    unint64_t v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      streamId = self->_streamId;
      *(_DWORD *)long long buf = 138543362;
      uint64_t v20 = streamId;
      _os_log_impl(&dword_1AD076000, v6, OS_LOG_TYPE_DEFAULT, "-[BMStreamDatastore saveMetadata:] called for stream %{public}@", buf, 0xCu);
    }

    if ([(BMStreamDatastore *)self isTombstoneStore])
    {
      int v8 = __biome_log_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BMStreamDatastore saveMetadata:]();
      }
      goto LABEL_11;
    }
    if ([(BMStreamDatastore *)self isSubscriptionStore])
    {
      int v8 = __biome_log_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BMStreamDatastore saveMetadata:]();
      }
      goto LABEL_11;
    }
    id v18 = 0;
    int v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v18];
    uint64_t v9 = v18;
    if (v9)
    {
      unint64_t v10 = v9;
      double v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[BMStreamDatastore saveMetadata:].cold.5();
      }
    }
    else if (v8)
    {
      fileManager = self->_fileManager;
      uint64_t v14 = [(BMStreamDatastore *)self metadataPath];
      id v17 = 0;
      int v15 = [(BMFileManager *)fileManager replaceFileAtPath:v14 withData:v8 protection:4 error:&v17];
      unint64_t v10 = v17;

      if (v15 && !v10)
      {
LABEL_11:
        BOOL v5 = 1;
LABEL_17:

        goto LABEL_18;
      }
      double v16 = __biome_log_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        [(BMStreamDatastore *)self saveMetadata:v16];
      }
    }
    else
    {
      unint64_t v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BMStreamDatastore saveMetadata:]();
      }
    }

    BOOL v5 = 0;
    goto LABEL_17;
  }
  BOOL v5 = 1;
LABEL_18:

  return v5;
}

- (void)pruneStreamToMaxStreamSizeInBytes:(unint64_t)a3
{
}

- (void)pruneStreamToMaxSegmentAge:(double)a3
{
}

- (void)segmentManager:(id)a3 willDeleteSegmentName:(id)a4 frameStore:(id)a5
{
  id v6 = a5;
  id v7 = [(BMStreamDatastore *)self delegate];
  if (v7
    && ![(BMStreamDatastore *)self isTombstoneStore]
    && ![(BMStreamDatastore *)self isSubscriptionStore])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__BMStreamDatastore_segmentManager_willDeleteSegmentName_frameStore___block_invoke;
    v9[3] = &unk_1E5E78968;
    id v10 = v6;
    double v11 = self;
    id v8 = v7;
    id v12 = v8;
    [v10 enumerateFromOffset:0 withCallback:v9];
    if (objc_opt_respondsToSelector()) {
      [v8 didPruneEvents];
    }
  }
}

void __69__BMStreamDatastore_segmentManager_willDeleteSegmentName_frameStore___block_invoke(id *a1, void *a2)
{
  id v9 = a2;
  int v3 = [BMStoreEvent alloc];
  id v4 = [a1[4] segmentName];
  BOOL v5 = [a1[5] metadata];
  id v6 = [(BMStoreEvent *)v3 initWithFrame:v9 segmentName:v4 error:1 eventCategory:0 metadata:v5 dataType:0];

  if (objc_opt_respondsToSelector()) {
    [a1[6] willPruneEvent:v6];
  }
  id v7 = a1[5];
  id v8 = [a1[4] segmentName];
  [v9 creationTimestamp];
  objc_msgSend(v7, "writeTombstoneEventWithSegmentName:offset:length:eventTimestamp:reason:policyID:", v8, 0, 0, 1, 0);
}

- (BMStreamDatastore)initWithStream:(id)a3 permission:(unint64_t)a4 config:(id)a5 includeTombstones:(BOOL)a6
{
  return [(BMStreamDatastore *)self initWithStream:a3 permission:a4 config:a5 includeTombstones:a6 eventDataClass:0 useCase:*MEMORY[0x1E4F4FAF8]];
}

- (id)initForReadingWithStream:(id)a3 config:(id)a4 includeTombstones:(BOOL)a5
{
  return [(BMStreamDatastore *)self initWithStream:a3 permission:0 config:a4 includeTombstones:a5];
}

- (id)initForWritingWithStream:(id)a3 config:(id)a4 includeTombstones:(BOOL)a5
{
  return [(BMStreamDatastore *)self initWithStream:a3 permission:1 config:a4 includeTombstones:a5];
}

- (id)initForPruningWithStream:(id)a3 config:(id)a4 includeTombstones:(BOOL)a5
{
  return [(BMStreamDatastore *)self initWithStream:a3 permission:2 config:a4 includeTombstones:a5];
}

- (void)didMarkFrameAsRemovedWithSegmentName:(id)a3 frame:(id)a4 reason:(unint64_t)a5 policyID:(id)a6 outTombstoneBookmark:(id *)a7
{
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v13 offset];
  id v19 = [v13 data];
  uint64_t v16 = [v19 length];
  [v13 creationTimestamp];
  double v18 = v17;

  [(BMStreamDatastore *)self writeTombstoneEventWithSegmentName:v14 offset:v15 length:v16 eventTimestamp:a5 reason:v12 policyID:a7 outTombstoneBookmark:v18];
}

- (BOOL)updatePruningPolicy:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(BMStreamDatastore *)self updateMetadata:[(BMStreamDatastore *)self eventBodyClass] pruningPolicy:v4];

  return (char)self;
}

- (id)tombstoneStore
{
  tombstoneStore = self->_tombstoneStore;
  if (!tombstoneStore)
  {
    id v4 = [(BMStreamDatastore *)self config];
    BOOL v5 = [v4 tombstonesConfig];

    BOOL v6 = [(BMStreamDatastore *)self permission] == 2;
    id v7 = [BMStreamDatastore alloc];
    id v8 = [(BMStreamDatastore *)self streamId];
    id v9 = [(BMStreamDatastore *)self streamPath];
    id v10 = [(BMStreamDatastore *)v7 initWithStream:v8 streamPath:v9 permission:v6 config:v5 includeTombstones:0 eventDataClass:objc_opt_class() useCase:self->_useCase];
    double v11 = self->_tombstoneStore;
    self->_tombstoneStore = v10;

    tombstoneStore = self->_tombstoneStore;
  }
  return tombstoneStore;
}

- (id)newTombstoneEnumeratorFromStartTime:(double)a3
{
  id v4 = [(BMStreamDatastore *)self tombstoneStore];
  BOOL v5 = (void *)[v4 newEnumeratorFromStartTime:a3];

  return v5;
}

- (id)newTombstoneEnumeratorFromBookmark:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BMStreamDatastore *)self tombstoneStore];
  BOOL v6 = (void *)[v5 newEnumeratorFromBookmark:v4];

  return v6;
}

- (void)writeTombstoneEventWithSegmentName:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 eventTimestamp:(double)a6 reason:(unint64_t)a7 policyID:(id)a8
{
}

- (void)writeTombstoneEventWithSegmentName:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 eventTimestamp:(double)a6 reason:(unint64_t)a7 policyID:(id)a8 outTombstoneBookmark:(id *)a9
{
  if (self->_includeTombstones)
  {
    id v16 = a8;
    id v17 = a3;
    double Current = CFAbsoluteTimeGetCurrent();
    id v19 = [[BMTombstoneEvent alloc] initWithSegmentName:v17 offset:a4 length:a5 eventTimestamp:a7 reason:v16 policyID:a6];

    uint64_t v20 = [(BMStreamDatastore *)self tombstoneStore];
    LODWORD(a9) = [v20 writeEventWithEventBody:v19 timestamp:0 outEventSize:a9 outBookmark:Current];

    if (a9)
    {
      uint64_t v21 = [(BMStreamDatastore *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v22 = [(BMStoreConfig *)self->_config account];
        id v23 = [(BMStoreConfig *)self->_config remoteName];
        [v21 didWriteTombstone:v19 timestamp:v22 account:v23 remoteName:Current];
      }
    }
    else
    {
      id v24 = __biome_log_for_category();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[BMStreamDatastore writeTombstoneEventWithSegmentName:offset:length:eventTimestamp:reason:policyID:outTombstoneBookmark:]();
      }
    }
  }
}

- (int)frameCountInStreamDataStoreFromSegmentsContainingTime:(double)a3 to:(double)a4
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  BOOL v6 = [(BMStreamDatastore *)self segmentManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__BMStreamDatastore_frameCountInStreamDataStoreFromSegmentsContainingTime_to___block_invoke;
  v8[3] = &unk_1E5E78990;
  v8[4] = &v9;
  [v6 enumerateSegmentsFrom:v8 to:a3 withBlock:a4];

  LODWORD(v6) = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return (int)v6;
}

uint64_t __78__BMStreamDatastore_frameCountInStreamDataStoreFromSegmentsContainingTime_to___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 frameCount];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (int)frameCountInStreamDataStoreFromTime:(double)a3 to:(double)a4
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  BOOL v6 = [(BMStreamDatastore *)self segmentManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__BMStreamDatastore_frameCountInStreamDataStoreFromTime_to___block_invoke;
  v8[3] = &unk_1E5E789B8;
  v8[4] = &v9;
  *(double *)&void v8[5] = a3;
  *(double *)&v8[6] = a4;
  [v6 enumerateSegmentsFrom:v8 to:a3 withBlock:a4];

  LODWORD(v6) = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return (int)v6;
}

uint64_t __60__BMStreamDatastore_frameCountInStreamDataStoreFromTime_to___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 frameCountFromStartTime:*(double *)(a1 + 40) endTime:*(double *)(a1 + 48)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (BOOL)includeTombstones
{
  return self->_includeTombstones;
}

- (unint64_t)permission
{
  return self->_permission;
}

- (unint64_t)maxFileSize
{
  return self->_maxFileSize;
}

- (NSString)streamPath
{
  return self->_streamPath;
}

- (BMPruningPolicy)pruningPolicy
{
  return self->_pruningPolicy;
}

- (BMSegmentManager)segmentManager
{
  return self->_segmentManager;
}

- (BOOL)verifyStreamHealthFrom:(double)a3 to:(double)a4 error:(id *)a5
{
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__1;
  v20[4] = __Block_byref_object_dispose__1;
  id v21 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__1;
  double v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  uint64_t v9 = [(BMStreamDatastore *)self segmentManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__BMStreamDatastore_HealthCheck__verifyStreamHealthFrom_to_error___block_invoke;
  v13[3] = &unk_1E5E78A20;
  v13[4] = self;
  v13[5] = &v22;
  *(double *)&v13[8] = a3;
  *(double *)&v13[9] = a4;
  v13[6] = &v14;
  v13[7] = v20;
  [v9 enumerateSegmentsFrom:v13 to:a3 withBlock:a4];

  if (a5)
  {
    id v10 = (void *)v15[5];
    if (v10) {
      *a5 = v10;
    }
  }
  char v11 = *((unsigned char *)v23 + 24);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);
  return v11;
}

void __66__BMStreamDatastore_HealthCheck__verifyStreamHealthFrom_to_error___block_invoke(double *a1, void *a2, void *a3, unsigned char *a4)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!v7) {
    goto LABEL_10;
  }
  if ([v7 datastoreVersion] == 9)
  {
    uint64_t v9 = (void *)*((void *)a1 + 4);
    double v10 = a1[8];
    double v11 = a1[9];
    uint64_t v12 = *(void *)(*((void *)a1 + 6) + 8);
    uint64_t v14 = *(void **)(v12 + 40);
    id v13 = (id *)(v12 + 40);
    uint64_t v31 = v14;
    char v15 = [v9 verifyStreamHealthFromV1:v7 to:&v31 frameStore:v10 error:v11];
    id v16 = v31;
LABEL_6:
    objc_storeStrong(v13, v16);
    *(unsigned char *)(*(void *)(*((void *)a1 + 5) + 8) + 24) = v15;
    goto LABEL_8;
  }
  if ([v7 datastoreVersion] == 10)
  {
    id v17 = (void *)*((void *)a1 + 4);
    double v18 = a1[8];
    double v19 = a1[9];
    uint64_t v20 = *(void *)(*((void *)a1 + 6) + 8);
    id v21 = *(void **)(v20 + 40);
    id v13 = (id *)(v20 + 40);
    id obj = v21;
    char v15 = [v17 verifyStreamHealthFromV2:v7 to:&obj frameStore:v18 error:v19];
    id v16 = obj;
    goto LABEL_6;
  }
  id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v32 = *MEMORY[0x1E4F28568];
  id v23 = [NSString alloc];
  uint64_t v24 = [MEMORY[0x1E4F4FB78] privacyPathname:*(void *)(*(void *)(*((void *)a1 + 7) + 8) + 40)];
  char v25 = (void *)[v23 initWithFormat:@"streamHealth failed: %@ for segment: %@, Framestore version not recognized: %d", @"BMStreamHealthErrorUnrecognizedDatastoreVersion", v24, objc_msgSend(v7, "datastoreVersion")];
  v33[0] = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
  uint64_t v27 = [v22 initWithDomain:@"BiomeStreamHealth" code:10 userInfo:v26];
  uint64_t v28 = *(void *)(*((void *)a1 + 6) + 8);
  uint64_t v29 = *(void **)(v28 + 40);
  *(void *)(v28 + 40) = v27;

  *(unsigned char *)(*(void *)(*((void *)a1 + 5) + 8) + 24) = 0;
LABEL_8:
  if (!*(unsigned char *)(*(void *)(*((void *)a1 + 5) + 8) + 24)) {
    *a4 = 1;
  }
LABEL_10:
}

- (BOOL)verifyStreamHealthFromV1:(double)a3 to:(double)a4 frameStore:(id)a5 error:(id *)a6
{
  v90[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = [v7 segmentPath];
  unsigned int v9 = [v7 bytesUsed];
  if ([v7 frameStoreSize] < (unint64_t)v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v89 = *MEMORY[0x1E4F28568];
    id v11 = [NSString alloc];
    uint64_t v12 = [MEMORY[0x1E4F4FB78] privacyPathname:v8];
    id v13 = (void *)[v11 initWithFormat:@"streamHealth failed: %@ for segment: %@, bytesUsed: %d, frameStoreSize:%zu", @"BMStreamHealthErrorBytesUsedBeyondFrameStoreSize", v12, objc_msgSend(v7, "bytesUsed"), objc_msgSend(v7, "frameStoreSize")];
    v90[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:&v89 count:1];
    char v15 = v10;
    uint64_t v16 = 5;
LABEL_33:
    id v22 = (void *)[v15 initWithDomain:@"BiomeStreamHealth" code:v16 userInfo:v14];
    goto LABEL_34;
  }
  uint64_t v17 = [v7 start];
  if (*(_DWORD *)(v17 - 4) != *(_DWORD *)"SEGB")
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v87 = *MEMORY[0x1E4F28568];
    id v19 = [NSString alloc];
    uint64_t v12 = [MEMORY[0x1E4F4FB78] privacyPathname:v8];
    id v13 = (void *)[v19 initWithFormat:@"streamHealth failed: %@ for segment: %@", @"BMStreamHealthErrorSegmentMagicMismatch", v12];
    v88 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
    char v15 = v18;
    uint64_t v16 = 7;
    goto LABEL_33;
  }
  int v20 = *(_DWORD *)(v17 - 40);
  if (v20 != [v7 datastoreVersion])
  {
    id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v85 = *MEMORY[0x1E4F28568];
    id v43 = [NSString alloc];
    uint64_t v12 = [MEMORY[0x1E4F4FB78] privacyPathname:v8];
    id v13 = (void *)[v43 initWithFormat:@"streamHealth failed: %@ for segment: %@", @"BMStreamHealthErrorDatastoreVersionMismatch", v12];
    v86 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
    char v15 = v42;
    uint64_t v16 = 8;
    goto LABEL_33;
  }
  int v21 = [v7 bytesUsed];
  id v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = (v21 - 56);
  unsigned int v25 = v21 - 64;
  uint64_t v69 = *MEMORY[0x1E4F28568];
  v70 = a6;
  while (1)
  {
    if ((v23 & 7) != 0)
    {
      id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v83 = v69;
      id v46 = [NSString alloc];
      uint64_t v12 = [MEMORY[0x1E4F4FB78] privacyPathname:v8];
      id v13 = (void *)[v46 initWithFormat:@"streamHealth failed: %@ for segment: %@, offset: %d", @"BMStreamHealthErrorNotAligned", v12, v23];
      v84 = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
      uint64_t v47 = v45;
      uint64_t v48 = 1;
LABEL_43:
      uint64_t v56 = [v47 initWithDomain:@"BiomeStreamHealth" code:v48 userInfo:v14];

      id v22 = (void *)v56;
      goto LABEL_34;
    }
    uint64_t v26 = v8;
    uint64_t v27 = (unint64_t *)([v7 start] + v23);
    unint64_t v28 = bm_frame_header_statusV1(v27);
    unint64_t v29 = v23 + (unint64_t)v28 + 31;
    if ([v7 frameStoreSize] <= v29)
    {
      id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v81 = v69;
      id v50 = [NSString alloc];
      id v8 = v26;
      uint64_t v12 = [MEMORY[0x1E4F4FB78] privacyPathname:v26];
      id v13 = (void *)[v50 initWithFormat:@"streamHealth failed: %@ for segment: %@, offset: %d frameStoreSize: %zu", @"BMStreamHealthErrorLengthBeyondFrameSize", v12, v23, objc_msgSend(v7, "frameStoreSize")];
      v82 = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      uint64_t v47 = v49;
      uint64_t v48 = 2;
      goto LABEL_43;
    }
    if (v29 >= v24)
    {
      id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v79 = v69;
      id v52 = [NSString alloc];
      id v8 = v26;
      uint64_t v12 = [MEMORY[0x1E4F4FB78] privacyPathname:v26];
      id v13 = (void *)[v52 initWithFormat:@"streamHealth failed: %@ for segment: %@, offset: %d frameSize: %u, bytesUsedByFrames: %d", @"BMStreamHealthErrorLengthBeyondBytesUsed", v12, v23, v28, v24];
      v80 = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
      uint64_t v47 = v51;
      uint64_t v48 = 3;
      goto LABEL_43;
    }
    if (HIDWORD(v28) == 3) {
      break;
    }
    if (HIDWORD(v28) == 1)
    {
      id v30 = (Bytef *)bm_frame_bytesV1((uint64_t)v27);
      uLong Checksum = bm_generateChecksum(v30, v28);
      uint64_t v32 = *(unsigned int *)(bm_frame_header_infoV1((uint64_t)v27) + 16);
      if (Checksum != v32)
      {
        id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v77 = v69;
        id v58 = [NSString alloc];
        v59 = v26;
        uint64_t v12 = [MEMORY[0x1E4F4FB78] privacyPathname:v26];
        uint64_t v65 = v32;
        id v8 = v59;
        id v13 = (void *)[v58 initWithFormat:@"streamHealth failed: %@ for segment: %@, calculated crc: %d frame crc: %d offset: %d", @"BMStreamHealthErrorCheckSumMismatch", v12, Checksum, v65, v23];
        v78 = v13;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
        v60 = v57;
        uint64_t v61 = 4;
        goto LABEL_45;
      }
LABEL_20:
      BOOL v37 = 1;
      a6 = v70;
      goto LABEL_25;
    }
    BOOL v37 = 1;
LABEL_24:
    if (HIDWORD(v28) >= 5)
    {
      id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v71 = v69;
      id v54 = [NSString alloc];
      v55 = v26;
      uint64_t v12 = [MEMORY[0x1E4F4FB78] privacyPathname:v26];
      id v8 = v55;
      id v13 = (void *)[v54 initWithFormat:@"streamHealth failed: %@ for segment: %@, frame state:%d", @"BMStreamHealthErrorUnrecognizedState", v12, HIDWORD(v28)];
      v72 = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
      uint64_t v47 = v53;
      uint64_t v48 = 6;
      goto LABEL_43;
    }
LABEL_25:
    uint64_t v23 = v23 + ((v28 + 7) & 0xFFFFFFF8) + 32;
    id v8 = v26;
    if (v23 > v25) {
      uint64_t v24 = [v7 bytesUsed] - 56;
    }
    unsigned int v25 = v24 - 8;
    if (v23 > (int)v24 - 8 || !v37) {
      goto LABEL_35;
    }
  }
  uint64_t v33 = *(unsigned int *)(bm_frame_header_infoV1((uint64_t)v27) + 16);
  if (!v33)
  {
    uint64_t v34 = (unsigned __int8 *)bm_frame_bytesV1((uint64_t)v27);
    if ((int)v28 < 1) {
      goto LABEL_20;
    }
    uint64_t v35 = v28;
    while (!*v34++)
    {
      if (!--v35)
      {
        BOOL v37 = 1;
        goto LABEL_23;
      }
    }
    id v66 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v73 = v69;
    id v38 = [NSString alloc];
    v68 = [MEMORY[0x1E4F4FB78] privacyPathname:v26];
    uint64_t v39 = (void *)[v38 initWithFormat:@"streamHealth failed: %@ for segment: %@, deleted frame data is not zero, offset: %d", @"BMStreamHealthErrorDeletedFrameDataNotZero", v68, v23];
    v74 = v39;
    id v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
    uint64_t v67 = [v66 initWithDomain:@"BiomeStreamHealth" code:12 userInfo:v40];

    BOOL v37 = 0;
    id v22 = (void *)v67;
LABEL_23:
    a6 = v70;
    goto LABEL_24;
  }
  id v62 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v75 = v69;
  id v63 = [NSString alloc];
  id v8 = v26;
  uint64_t v12 = [MEMORY[0x1E4F4FB78] privacyPathname:v26];
  id v13 = (void *)[v63 initWithFormat:@"streamHealth failed: %@ for segment: %@, crc for deleted frame not zero: %#010X offset: %d", @"BMStreamHealthErrorDeletedFrameCheckSumNotZero", v12, v33, v23];
  v76 = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
  v60 = v62;
  uint64_t v61 = 11;
LABEL_45:
  uint64_t v64 = [v60 initWithDomain:@"BiomeStreamHealth" code:v61 userInfo:v14];

  id v22 = (void *)v64;
  a6 = v70;
LABEL_34:

  BOOL v37 = 0;
LABEL_35:
  if (a6 && v22) {
    *a6 = v22;
  }

  return v37;
}

- (BOOL)verifyStreamHealthFromV2:(double)a3 to:(double)a4 frameStore:(id)a5 error:(id *)a6
{
  v80[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = [v7 segmentPath];
  unsigned int v9 = [v7 bytesUsed];
  if ([v7 frameStoreSize] < (unint64_t)v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v79 = *MEMORY[0x1E4F28568];
    id v11 = [NSString alloc];
    uint64_t v12 = [MEMORY[0x1E4F4FB78] privacyPathname:v8];
    id v13 = (void *)[v11 initWithFormat:@"streamHealth failed: %@ for segment: %@, bytesUsed: %d, frameStoreSize:%zu", @"BMStreamHealthErrorBytesUsedBeyondFrameStoreSize", v12, objc_msgSend(v7, "bytesUsed"), objc_msgSend(v7, "frameStoreSize")];
    v80[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:&v79 count:1];
    char v15 = v10;
    uint64_t v16 = 5;
LABEL_25:
    id v24 = (id)[v15 initWithDomain:@"BiomeStreamHealth" code:v16 userInfo:v14];
    goto LABEL_26;
  }
  uint64_t v17 = [v7 start];
  if (*(_DWORD *)(v17 - 32) != *(_DWORD *)"SEGB")
  {
    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v77 = *MEMORY[0x1E4F28568];
    id v19 = [NSString alloc];
    uint64_t v12 = [MEMORY[0x1E4F4FB78] privacyPathname:v8];
    id v13 = (void *)[v19 initWithFormat:@"streamHealth failed: %@ for segment: %@", @"BMStreamHealthErrorSegmentMagicMismatch", v12];
    v78 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
    char v15 = v18;
    uint64_t v16 = 7;
    goto LABEL_25;
  }
  int v20 = *(_DWORD *)(v17 - 16);
  if (v20 != [v7 datastoreVersion])
  {
    id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v75 = *MEMORY[0x1E4F28568];
    id v45 = [NSString alloc];
    uint64_t v12 = [MEMORY[0x1E4F4FB78] privacyPathname:v8];
    id v13 = (void *)[v45 initWithFormat:@"streamHealth failed: %@ for segment: %@", @"BMStreamHealthErrorDatastoreVersionMismatch", v12];
    v76 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
    char v15 = v44;
    uint64_t v16 = 8;
    goto LABEL_25;
  }
  int v21 = [v7 bytesUsed];
  int v22 = [v7 atomicReadTotalFramesV2];
  if (v22 < 1)
  {
    id v24 = 0;
    char v27 = 1;
    goto LABEL_30;
  }
  int v23 = v22;
  id v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = (v21 - 16 * v22 - 32);
  uint64_t v62 = *MEMORY[0x1E4F28568];
  char v27 = 1;
  while (1)
  {
    unint64_t v28 = (_DWORD *)[v7 offsetTablePtrFromFrameNumberV2:v25];
    if (!v28)
    {
      id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v73 = v62;
      id v48 = [NSString alloc];
      uint64_t v12 = [MEMORY[0x1E4F4FB78] privacyPathname:v8];
      id v13 = (void *)[v48 initWithFormat:@"streamHealth failed: %@ for segment: %@ frame: %d", @"BMStreamHealthErrorBadFrameNumber", v12, v25];
      v74 = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
      uint64_t v56 = v47;
      uint64_t v57 = 13;
      goto LABEL_36;
    }
    unint64_t v29 = v28;
    if (v27)
    {
      if (v26 < ((*v28 + 3) & 0xFFFFFFFC))
      {
        id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v71 = v62;
        id v50 = [NSString alloc];
        uint64_t v12 = [MEMORY[0x1E4F4FB78] privacyPathname:v8];
        id v13 = (void *)[v50 initWithFormat:@"streamHealth failed: %@ for segment: %@ frame: %d", @"BMStreamHealthErrorBadOffsetToByteAfterFrame", v12, v25];
        v72 = v13;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
        uint64_t v56 = v49;
        uint64_t v57 = 9;
        goto LABEL_36;
      }
      if (v28[1] >= 5u)
      {
        id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v69 = v62;
        id v52 = [NSString alloc];
        uint64_t v12 = [MEMORY[0x1E4F4FB78] privacyPathname:v8];
        id v13 = (void *)[v52 initWithFormat:@"streamHealth failed: %@ for segment: %@, frame state:%d frame: %d", @"BMStreamHealthErrorUnrecognizedState", v12, v29[1], v25];
        v70 = v13;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
        uint64_t v56 = v51;
        uint64_t v57 = 6;
        goto LABEL_36;
      }
    }
    uint64_t v30 = [v7 start];
    uint64_t v31 = (unsigned int *)(v30 + [v7 frameOffsetFromOffsetTableV2:v29]);
    int v32 = v29[1];
    if (v32 == 3) {
      break;
    }
    if (v32 == 1)
    {
      uint64_t v33 = (Bytef *)bm_frame_bytesV2((uint64_t)v31);
      uLong Checksum = bm_generateChecksum(v33, [v7 sizeOfFrameV2:v25] - 8);
      if (Checksum != *v31)
      {
        uLong v53 = Checksum;
        id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v67 = v62;
        id v55 = [NSString alloc];
        uint64_t v12 = [MEMORY[0x1E4F4FB78] privacyPathname:v8];
        id v13 = (void *)[v55 initWithFormat:@"streamHealth failed: %@ for segment: %@, calculated crc: %d frame crc: %d frame: %d", @"BMStreamHealthErrorCheckSumMismatch", v12, v53, *v31, v25];
        v68 = v13;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
        uint64_t v56 = v54;
        uint64_t v57 = 4;
        goto LABEL_36;
      }
    }
LABEL_22:
    uint64_t v25 = (v25 + 1);
    if (v25 == v23) {
      goto LABEL_27;
    }
  }
  if (!*v31)
  {
    uint64_t v35 = (unsigned __int8 *)bm_frame_bytesV2((uint64_t)v31);
    unint64_t v36 = ([v7 sizeOfFrameV2:v25] - 5) & 0xFFFFFFFFFFFFFFFCLL;
    if (v36)
    {
      while (!*v35++)
      {
        if (!--v36) {
          goto LABEL_22;
        }
      }
      id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v63 = v62;
      id v39 = [NSString alloc];
      uint64_t v61 = [MEMORY[0x1E4F4FB78] privacyPathname:v8];
      id v40 = (void *)[v39 initWithFormat:@"streamHealth failed: %@ for segment: %@, deleted frame data is not zero, frame: %d", @"BMStreamHealthErrorDeletedFrameDataNotZero", v61, v25];
      uint64_t v64 = v40;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      v42 = uint64_t v41 = v26;
      uint64_t v43 = [v38 initWithDomain:@"BiomeStreamHealth" code:12 userInfo:v42];

      uint64_t v26 = v41;
      char v27 = 0;
      id v24 = (id)v43;
    }
    goto LABEL_22;
  }
  id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v65 = v62;
  id v59 = [NSString alloc];
  uint64_t v12 = [MEMORY[0x1E4F4FB78] privacyPathname:v8];
  id v13 = (void *)[v59 initWithFormat:@"streamHealth failed: %@ for segment: %@, crc for deleted frame not zero: %#010X frame: %d", @"BMStreamHealthErrorDeletedFrameCheckSumNotZero", v12, *v31, v25];
  id v66 = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
  uint64_t v56 = v58;
  uint64_t v57 = 11;
LABEL_36:
  uint64_t v60 = [v56 initWithDomain:@"BiomeStreamHealth" code:v57 userInfo:v14];

  id v24 = (id)v60;
LABEL_26:

  char v27 = 0;
LABEL_27:
  if (a6 && v24)
  {
    id v24 = v24;
    *a6 = v24;
  }
LABEL_30:

  return v27 & 1;
}

- (void)writeEventWithEventBody:(NSObject *)a3 timestamp:outEventSize:outBookmark:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v6 = [a2 streamId];
  int v7 = 138412802;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  id v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = [a2 eventBodyClass];
  _os_log_fault_impl(&dword_1AD076000, a3, OS_LOG_TYPE_FAULT, "Incoming event is of type: %@, while stream - %@ only accepts events of type: %@", (uint8_t *)&v7, 0x20u);
}

- (void)_removeEventsFrom:to:reason:policyID:pruneFutureEvents:shouldDeleteUsingBlock:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0(&dword_1AD076000, v0, v1, "Stream has event with a timestamp in the future", v2, v3, v4, v5, v6);
}

- (void)_removeEventsFrom:to:reason:policyID:pruneFutureEvents:shouldDeleteUsingBlock:.cold.2()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0(&dword_1AD076000, v0, v1, "Should hold off on pruning future events because time looks like it needs an NTP server sync", v2, v3, v4, v5, v6);
}

- (void)writeEventData:dataVersion:timestamp:outBookmark:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_1AD076000, v0, v1, "Fail to write event due to nil event data", v2, v3, v4, v5, v6);
}

- (void)writeEventBytes:(void *)a1 length:dataVersion:timestamp:outBookmark:.cold.1(void *a1)
{
  uint64_t v1 = [a1 streamPath];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2(&dword_1AD076000, v2, v3, "Failed to assign a frameStore for: %{public}@", v4, v5, v6, v7, v8);
}

- (void)writeEventBytes:(void *)a1 length:dataVersion:timestamp:outBookmark:.cold.2(void *a1)
{
  uint64_t v1 = [a1 streamPath];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2(&dword_1AD076000, v2, v3, "Failed to open new segment for: %{public}@", v4, v5, v6, v7, v8);
}

- (void)writeEventBytes:(void *)a1 length:dataVersion:timestamp:outBookmark:.cold.3(void *a1)
{
  uint64_t v1 = [a1 streamPath];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2(&dword_1AD076000, v2, v3, "Failed to write event, segment is not accessible: %{public}@", v4, v5, v6, v7, v8);
}

- (void)fetchEventFromFrameStore:atOffset:withOptions:callback:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  _os_log_debug_impl(&dword_1AD076000, v0, OS_LOG_TYPE_DEBUG, "No more events and on last segment", v1, 2u);
}

- (void)updateMetadata:(os_log_t)log pruningPolicy:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1AD076000, log, OS_LOG_TYPE_FAULT, "updateMetadata: unable to update metadata file for %@", buf, 0xCu);
}

- (void)updateMetadata:(uint8_t *)buf pruningPolicy:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1AD076000, log, OS_LOG_TYPE_FAULT, "updateMetadata: eventBodyClass (%@) does not match existing class metadata (%@)", buf, 0x16u);
}

- (void)loadMetadata
{
}

- (void)saveMetadata:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_1AD076000, v0, v1, "Tombstone variant of BMStreamDatastore does not support saving metadata", v2, v3, v4, v5, v6);
}

- (void)saveMetadata:.cold.2()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_1AD076000, v0, v1, "Subscription variant of BMStreamDatastore does not support saving metadata", v2, v3, v4, v5, v6);
}

- (void)saveMetadata:.cold.3()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_1AD076000, v0, v1, "archivedDataWithRootObject returned nil", v2, v3, v4, v5, v6);
}

- (void)saveMetadata:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [a1 metadataPath];
  objc_claimAutoreleasedReturnValue();
  uint8_t v6 = objc_msgSend((id)OUTLINED_FUNCTION_7_1(), "privacyPathname:");
  OUTLINED_FUNCTION_6_0();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_fault_impl(&dword_1AD076000, a3, OS_LOG_TYPE_FAULT, "unable to write metadata to file: %{public}@ Err: %@", v7, 0x16u);
}

- (void)saveMetadata:.cold.5()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_1(&dword_1AD076000, v0, v1, "Unable to encode metadata. Err: %@", v2, v3, v4, v5, v6);
}

- (void)writeTombstoneEventWithSegmentName:offset:length:eventTimestamp:reason:policyID:outTombstoneBookmark:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0(&dword_1AD076000, v0, v1, "Failed to write tombstone", v2, v3, v4, v5, v6);
}

@end