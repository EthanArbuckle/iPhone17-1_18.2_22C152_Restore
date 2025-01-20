@interface BMContentStream
- (BMContentStream)init;
- (BMContentStream)initWithStreamIdentifier:(id)a3;
- (BMContentStream)initWithStreamIdentifier:(id)a3 eventClass:(Class)a4;
- (BOOL)pruneEventsWithError:(id *)a3 predicateBlock:(id)a4;
- (NSString)identifier;
- (id)publisher;
- (id)publisherFromStartTime:(double)a3;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6;
- (id)source;
- (void)pruneWithPredicateBlock:(id)a3;
@end

@implementation BMContentStream

- (BMContentStream)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"Must override method %@ in a subclass", v4 format];

  __break(1u);
  return result;
}

- (NSString)identifier
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"Must override method %@ in a subclass", v4 format];

  __break(1u);
  return result;
}

- (BMContentStream)initWithStreamIdentifier:(id)a3
{
  return [(BMContentStream *)self initWithStreamIdentifier:a3 eventClass:0];
}

- (BMContentStream)initWithStreamIdentifier:(id)a3 eventClass:(Class)a4
{
  id v7 = a3;
  if (!v7)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"BMContentStream.m", 47, @"Invalid parameter not satisfying: %@", @"streamIdentifier" object file lineNumber description];
  }
  if (([v7 hasPrefix:@"ProactiveHarvesting."] & 1) == 0)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"BMContentStream.m", 48, @"Invalid parameter not satisfying: %@", @"[streamIdentifier hasPrefix:@\"ProactiveHarvesting.\"]" object file lineNumber description];
  }
  v24.receiver = self;
  v24.super_class = (Class)BMContentStream;
  v8 = [(BMContentStream *)&v24 init];
  if (!v8) {
    goto LABEL_11;
  }
  v9 = BMRootLibraryBridge();
  id v23 = 0;
  v10 = [v9 streamWithIdentifier:v7 error:&v23];
  id v11 = v23;
  uint64_t v12 = [v10 storeStreamWithLegacyClass:a4];
  storeStream = v8->_storeStream;
  v8->_storeStream = (BMStoreStream *)v12;

  if (!v11)
  {
    v16 = [BMContentSource alloc];
    v17 = [(BMStoreStream *)v8->_storeStream storeConfig];
    uint64_t v18 = [(BMStoreSource *)v16 initWithIdentifier:v7 storeConfig:v17];
    contentSource = v8->_contentSource;
    v8->_contentSource = (BMContentSource *)v18;

LABEL_11:
    v15 = v8;
    goto LABEL_12;
  }
  v14 = __biome_log_for_category();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
    -[BMContentStream initWithStreamIdentifier:eventClass:]((uint64_t)v7, v14);
  }

  v15 = 0;
LABEL_12:

  return v15;
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

- (id)publisher
{
  uint64_t v3 = [BMDSLStreamPublisher alloc];
  v4 = [(BMContentStream *)self identifier];
  v5 = [(BMDSLStreamPublisher *)v3 initWithIdentifier:v4 streamType:2];

  return v5;
}

- (void)pruneWithPredicateBlock:(id)a3
{
}

- (BOOL)pruneEventsWithError:(id *)a3 predicateBlock:(id)a4
{
  return [(BMStoreStream *)self->_storeStream pruneEventsWithError:a3 predicateBlock:a4];
}

- (id)source
{
  return self->_contentSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentSource, 0);

  objc_storeStrong((id *)&self->_storeStream, 0);
}

- (void)initWithStreamIdentifier:(uint64_t)a1 eventClass:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "Failed to find content stream with identifier %@", (uint8_t *)&v2, 0xCu);
}

@end