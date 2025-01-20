@interface BMDKEventStream
+ (id)streamNameFromDKStreamName:(id)a3;
- (BMDKEventStream)init;
- (BMDKEventStream)initWithDKStreamIdentifier:(id)a3;
- (BMDKEventStream)initWithStreamIdentifier:(id)a3 contentProtection:(unint64_t)a4 pruningPolicy:(id)a5 domain:(unint64_t)a6;
- (BOOL)pruneEventsWithError:(id *)a3 predicateBlock:(id)a4;
- (NSString)identifier;
- (id)publisher;
- (id)publisherFromStartTime:(double)a3;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6;
- (id)source;
- (void)deleteLocalAndRemoteEventsWithPredicateBlock:(id)a3;
- (void)deleteLocalAndRemoteEventsWithReason:(unint64_t)a3 usingPredicateBlock:(id)a4;
- (void)pruneWithPredicateBlock:(id)a3;
@end

@implementation BMDKEventStream

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7
{
  return [(BMStoreStream *)self->_storeStream publisherWithStartTime:a3 endTime:a4 maxEvents:a5 lastN:a6 reversed:a7];
}

- (BOOL)pruneEventsWithError:(id *)a3 predicateBlock:(id)a4
{
  return [(BMStoreStream *)self->_storeStream pruneEventsWithError:a3 predicateBlock:a4];
}

- (BMDKEventStream)initWithDKStreamIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v5 = (void *)get_CDEventStreamsClass_softClass;
  uint64_t v19 = get_CDEventStreamsClass_softClass;
  if (!get_CDEventStreamsClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __get_CDEventStreamsClass_block_invoke;
    v21 = &unk_1E55D6DA8;
    v22 = &v16;
    __get_CDEventStreamsClass_block_invoke((uint64_t)buf);
    v5 = (void *)v17[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v16, 8);
  v7 = objc_msgSend(v6, "eventStreamPropertiesForKBName:", v4, v16);
  id v8 = objc_alloc(MEMORY[0x1E4F50268]);
  [v7 timeToLive];
  v9 = objc_msgSend(v8, "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 0, 0, 52428800);
  v10 = +[BMDKEventStream streamNameFromDKStreamName:v4];
  uint64_t v11 = BMServiceDomainForStream();
  v12 = __biome_log_for_category();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = BMStringForServiceDomain();
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_18E67D000, v12, OS_LOG_TYPE_INFO, "Initializing BMDKEventStream %{public}@ with domain %{public}@", buf, 0x16u);
  }
  v14 = [(BMDKEventStream *)self initWithStreamIdentifier:v10 contentProtection:3 pruningPolicy:v9 domain:v11];

  return v14;
}

+ (id)streamNameFromDKStreamName:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 componentsSeparatedByString:@"/"];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", objc_msgSend(v3, "length"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 length])
        {
          uint64_t v12 = [v5 length];
          uint64_t v13 = upperCaseInitialCharacter(v11);
          v14 = (void *)v13;
          if (v12) {
            [v5 appendFormat:@".%@", v13];
          }
          else {
            [v5 appendString:v13];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v15 = [@"_DKEvent." stringByAppendingString:v5];

  return v15;
}

- (BMDKEventStream)initWithStreamIdentifier:(id)a3 contentProtection:(unint64_t)a4 pruningPolicy:(id)a5 domain:(unint64_t)a6
{
  id v12 = a3;
  id v13 = a5;
  if (!v12)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"BMDKEventStream.m", 110, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)BMDKEventStream;
  v14 = [(BMDKEventStream *)&v22 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    uint64_t v16 = (void *)[MEMORY[0x1E4F50278] newRestrictedStreamWithSegmentSize:0x100000 protectionClass:a4 domain:a6];
    [v16 setPruningPolicy:v13];
    long long v17 = [BMStoreStream alloc];
    uint64_t v18 = [(BMStoreStream *)v17 initWithStreamIdentifier:v12 storeConfig:v16 streamType:2 eventDataClass:objc_opt_class() useCase:*MEMORY[0x1E4F4FAE8]];
    storeStream = v15->_storeStream;
    v15->_storeStream = (BMStoreStream *)v18;
  }
  return v15;
}

- (id)source
{
  return [(BMStoreStream *)self->_storeStream source];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_storeStream, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BMDKEventStream)init
{
  result = (BMDKEventStream *)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Must use designated initializer for BMDKEventStream"];
  __break(1u);
  return result;
}

- (id)publisherFromStartTime:(double)a3
{
  return [(BMStoreStream *)self->_storeStream publisherFromStartTime:a3];
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6
{
  return [(BMStoreStream *)self->_storeStream publisherWithStartTime:a3 endTime:a4 maxEvents:a5 lastN:0 reversed:a6];
}

- (id)publisher
{
  id v3 = [BMDSLStreamPublisher alloc];
  id v4 = [(BMDKEventStream *)self identifier];
  v5 = [(BMDSLStreamPublisher *)v3 initWithIdentifier:v4 streamType:2];

  return v5;
}

- (void)pruneWithPredicateBlock:(id)a3
{
}

- (void)deleteLocalAndRemoteEventsWithPredicateBlock:(id)a3
{
}

- (void)deleteLocalAndRemoteEventsWithReason:(unint64_t)a3 usingPredicateBlock:(id)a4
{
}

@end