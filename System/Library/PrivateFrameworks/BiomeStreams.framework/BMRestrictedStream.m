@interface BMRestrictedStream
- (BMRestrictedStream)initWithIdentifier:(id)a3;
- (BMRestrictedStream)initWithIdentifier:(id)a3 eventDataClass:(Class)a4;
- (BMRestrictedStream)initWithIdentifier:(id)a3 segmentSize:(unint64_t)a4;
- (BMRestrictedStream)initWithIdentifier:(id)a3 segmentSize:(unint64_t)a4 pruningPolicy:(id)a5;
- (BMRestrictedStream)initWithIdentifier:(id)a3 segmentSize:(unint64_t)a4 pruningPolicy:(id)a5 eventDataClass:(Class)a6;
- (id)publisherFromStartTime:(double)a3;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6;
- (id)publishersForDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6;
- (id)publishersForRemoteDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6;
- (id)remoteDevices;
- (id)source;
- (void)pruneLocalAndRemoteEventsWithPredicateBlock:(id)a3;
- (void)pruneLocalAndRemoteEventsWithReason:(unint64_t)a3 usingPredicateBlock:(id)a4;
- (void)pruneWithPredicateBlock:(id)a3;
@end

@implementation BMRestrictedStream

- (id)remoteDevices
{
  return [(BMStoreStream *)self->_storeStream remoteDevices];
}

- (id)publishersForRemoteDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6
{
  return [(BMStoreStream *)self->_storeStream publishersForRemoteDevices:a3 startTime:a5 includeLocal:a6 pipeline:a4];
}

- (BMRestrictedStream)initWithIdentifier:(id)a3
{
  return [(BMRestrictedStream *)self initWithIdentifier:a3 eventDataClass:0];
}

- (BMRestrictedStream)initWithIdentifier:(id)a3 eventDataClass:(Class)a4
{
  id v7 = a3;
  if (!v7)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"BMRestrictedStream.m", 40, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v24.receiver = self;
  v24.super_class = (Class)BMRestrictedStream;
  v8 = [(BMRestrictedStream *)&v24 init];
  if (v8)
  {
    int v9 = [v7 isEqualToString:@"Messages.CommunicationSafety.ResultWithoutImage"];
    v10 = BMRootLibraryBridge();
    v11 = v10;
    if (v9)
    {
      v12 = [v10 streamWithIdentifier:@"Messages.CommunicationSafety" error:0];

      v13 = [BMStoreStream alloc];
      v14 = [(__CFString *)v12 configuration];
      v15 = [v14 storeConfig];
      uint64_t v16 = [(BMStoreStream *)v13 initWithStreamIdentifier:@"Messages.CommunicationSafety.ResultWithoutImage" storeConfig:v15 streamType:2 eventDataClass:a4 useCase:*MEMORY[0x1E4F4FAF8]];
      storeStream = v8->_storeStream;
      v8->_storeStream = (BMStoreStream *)v16;
    }
    else
    {
      id v23 = 0;
      v18 = [v10 streamWithIdentifier:v7 error:&v23];
      v12 = (__CFString *)v23;
      uint64_t v19 = [v18 storeStreamWithLegacyClass:a4];
      v20 = v8->_storeStream;
      v8->_storeStream = (BMStoreStream *)v19;

      if (v8->_storeStream)
      {
LABEL_10:

        goto LABEL_11;
      }
      v14 = __biome_log_for_category();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BMRestrictedStream initWithIdentifier:eventDataClass:]((uint64_t)v7, v12, v14);
      }
    }

    goto LABEL_10;
  }
LABEL_11:

  return v8;
}

- (BMRestrictedStream)initWithIdentifier:(id)a3 segmentSize:(unint64_t)a4
{
  return [(BMRestrictedStream *)self initWithIdentifier:a3 segmentSize:a4 pruningPolicy:0];
}

- (BMRestrictedStream)initWithIdentifier:(id)a3 segmentSize:(unint64_t)a4 pruningPolicy:(id)a5
{
  return [(BMRestrictedStream *)self initWithIdentifier:a3 segmentSize:a4 pruningPolicy:a5 eventDataClass:0];
}

- (BMRestrictedStream)initWithIdentifier:(id)a3 segmentSize:(unint64_t)a4 pruningPolicy:(id)a5 eventDataClass:(Class)a6
{
  id v11 = a3;
  id v12 = a5;
  if (v11)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"BMRestrictedStream.m", 75, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"BMRestrictedStream.m", 76, @"Invalid parameter not satisfying: %@", @"segmentSize" object file lineNumber description];

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)BMRestrictedStream;
  v13 = [(BMRestrictedStream *)&v21 init];
  if (v13)
  {
    v14 = (void *)[MEMORY[0x1E4F50278] newRestrictedStreamWithSegmentSize:a4];
    [v14 setPruningPolicy:v12];
    v15 = [[BMStoreStream alloc] initWithRestrictedStreamIdentifier:v11 storeConfig:v14 eventDataClass:a6];
    storeStream = v13->_storeStream;
    v13->_storeStream = v15;

    if (!v13->_storeStream)
    {
      v17 = __biome_log_for_category();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[BMRestrictedStream initWithIdentifier:segmentSize:pruningPolicy:eventDataClass:]((uint64_t)v11, a4, v17);
      }
    }
  }

  return v13;
}

- (id)publisherFromStartTime:(double)a3
{
  return [(BMStoreStream *)self->_storeStream publisherFromStartTime:a3];
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6
{
  return [(BMStoreStream *)self->_storeStream publisherWithStartTime:a3 endTime:a4 maxEvents:a5 lastN:0 reversed:a6];
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7
{
  return [(BMStoreStream *)self->_storeStream publisherWithStartTime:a3 endTime:a4 maxEvents:a5 lastN:a6 reversed:a7];
}

- (id)source
{
  return [(BMStoreStream *)self->_storeStream source];
}

- (void)pruneWithPredicateBlock:(id)a3
{
}

- (void)pruneLocalAndRemoteEventsWithPredicateBlock:(id)a3
{
}

- (void)pruneLocalAndRemoteEventsWithReason:(unint64_t)a3 usingPredicateBlock:(id)a4
{
}

- (id)publishersForDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6
{
  return [(BMStoreStream *)self->_storeStream publishersForDevices:a3 startTime:a5 includeLocal:a6 pipeline:a4];
}

- (void).cxx_destruct
{
}

- (void)initWithIdentifier:(os_log_t)log eventDataClass:.cold.1(uint64_t a1, __CFString *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = &stru_1EDD7E578;
  if (a2) {
    v3 = a2;
  }
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  id v7 = v3;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMRestrictedBaseStream(%@): unable to initialize stream. %@", (uint8_t *)&v4, 0x16u);
}

- (void)initWithIdentifier:(NSObject *)a3 segmentSize:pruningPolicy:eventDataClass:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a2];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  int v9 = v5;
  _os_log_fault_impl(&dword_18E67D000, a3, OS_LOG_TYPE_FAULT, "BMRestrictedBaseStream(%@): unable to initialize stream with segment size %@", (uint8_t *)&v6, 0x16u);
}

@end