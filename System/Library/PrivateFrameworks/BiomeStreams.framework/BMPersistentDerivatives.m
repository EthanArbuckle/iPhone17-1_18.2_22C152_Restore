@interface BMPersistentDerivatives
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BMPersistentDerivatives)initWithUpstream:(id)a3 derivativeDatabaseURL:(id)a4 derivedTableName:(id)a5;
- (BMSQLStoreManager)manager;
- (BOOL)canStoreInternalStateInBookmark;
- (BPSPublisher)upstream;
- (NSString)streamName;
- (NSString)tableName;
- (NSURL)url;
- (id)bookmarkableUpstreams;
- (id)nextEvent;
- (id)startWithSubscriber:(id)a3;
- (id)upstreamPublishers;
- (void)reset;
- (void)setManager:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BMPersistentDerivatives

- (BMPersistentDerivatives)initWithUpstream:(id)a3 derivativeDatabaseURL:(id)a4 derivedTableName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BMPersistentDerivatives;
  v12 = [(BMPersistentDerivatives *)&v22 init];
  uint64_t v13 = (uint64_t)v12;
  if (!v12) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v12->_upstream, a3);
  objc_storeStrong((id *)(v13 + 8), a4);
  objc_storeStrong((id *)(v13 + 16), a5);
  v14 = [(id)v13 upstream];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v16 = [(id)v13 upstream];
    uint64_t v17 = [v16 streamId];
    v18 = *(void **)(v13 + 24);
    *(void *)(v13 + 24) = v17;

LABEL_4:
    v19 = (BMPersistentDerivatives *)(id)v13;
    goto LABEL_8;
  }
  v20 = __biome_log_for_category();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    -[BMPersistentDerivatives initWithUpstream:derivativeDatabaseURL:derivedTableName:](v13, v20);
  }

  v19 = 0;
LABEL_8:

  return v19;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BMPersistentDerivatives subscribe:]((uint64_t)self, v5);
  }

  id v6 = objc_alloc(MEMORY[0x1E4F4FA88]);
  v7 = [(BMPersistentDerivatives *)self url];
  v8 = (void *)[v6 initWithURL:v7];

  id v9 = [(BMPersistentDerivatives *)self tableName];
  id v10 = [(BMPersistentDerivatives *)self streamName];
  [v8 addManagedTable:v9 derivedFromStream:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F50210]);
  v12 = [(BMPersistentDerivatives *)self upstream];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __37__BMPersistentDerivatives_subscribe___block_invoke;
  v15[3] = &unk_1E55D7900;
  id v16 = v8;
  id v13 = v8;
  v14 = (void *)[v11 initWithUpstream:v12 receiveSubscription:0 receiveOutput:v15 receiveCompletion:0 receiveCancel:0 receiveRequest:0];
  [v14 subscribe:v4];
}

uint64_t __37__BMPersistentDerivatives_subscribe___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) beginManagedSessionWithEvent:a2];
}

- (id)upstreamPublishers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BMPersistentDerivatives *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)startWithSubscriber:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F4FA88];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [(BMPersistentDerivatives *)self url];
  v8 = (void *)[v6 initWithURL:v7];
  [(BMPersistentDerivatives *)self setManager:v8];

  id v9 = [(BMPersistentDerivatives *)self manager];
  id v10 = [(BMPersistentDerivatives *)self tableName];
  id v11 = [(BMPersistentDerivatives *)self streamName];
  [v9 addManagedTable:v10 derivedFromStream:v11];

  v14.receiver = self;
  v14.super_class = (Class)BMPersistentDerivatives;
  v12 = [(BMPersistentDerivatives *)&v14 startWithSubscriber:v5];

  return v12;
}

- (id)nextEvent
{
  v3 = [(BMPersistentDerivatives *)self upstream];
  id v4 = [v3 nextEvent];

  if (v4)
  {
    id v5 = [(BMPersistentDerivatives *)self manager];
    [v5 beginManagedSessionWithEvent:v4];
  }

  return v4;
}

- (void)reset
{
  [(BMPersistentDerivatives *)self setManager:0];
  v3.receiver = self;
  v3.super_class = (Class)BMPersistentDerivatives;
  [(BMPersistentDerivatives *)&v3 reset];
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = [BMPersistentDerivatives alloc];
  id v9 = [v7 firstObject];

  id v10 = [v6 url];
  id v11 = [v6 tableName];
  v12 = [(BMPersistentDerivatives *)v8 initWithUpstream:v9 derivativeDatabaseURL:v10 derivedTableName:v11];

  return v12;
}

- (id)bookmarkableUpstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BMPersistentDerivatives *)self upstream];
  v5[0] = v2;
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)streamName
{
  return self->_streamName;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (BMSQLStoreManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
  objc_storeStrong((id *)&self->_tableName, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithUpstream:(uint64_t)a1 derivativeDatabaseURL:(NSObject *)a2 derivedTableName:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@ requires a BPSBiomeStorePublisher upstream.", (uint8_t *)&v5, 0xCu);
}

- (void)subscribe:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_debug_impl(&dword_18E67D000, a2, OS_LOG_TYPE_DEBUG, "%@ - subscribe", (uint8_t *)&v5, 0xCu);
}

@end