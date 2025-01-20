@interface CPLExtractedBatch
+ (BOOL)supportsSecureCoding;
- (BOOL)batchCanLowerQuota;
- (BOOL)isFull;
- (CPLChangeBatch)batch;
- (CPLExtractedBatch)init;
- (CPLExtractedBatch)initWithCoder:(id)a3;
- (NSFastEnumeration)uploadIdentifiers;
- (NSString)clientCacheIdentifier;
- (id)uploadIdentifierForChange:(id)a3;
- (unint64_t)effectiveResourceSizeToUploadUsingStorage:(id)a3;
- (unint64_t)resourceSize;
- (void)addChange:(id)a3 fromStorage:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumeratePushContextsWithBlock:(id)a3;
- (void)forceScopeIndexOnAllRecordsTo:(int64_t)a3;
- (void)setClientCacheIdentifier:(id)a3;
- (void)setFull:(BOOL)a3;
@end

@implementation CPLExtractedBatch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientCacheIdentifier, 0);
  objc_storeStrong((id *)&self->_batch, 0);
  objc_storeStrong((id *)&self->_mutableUntrustableScopedIndentifiers, 0);
  objc_storeStrong((id *)&self->_untrustableScopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_mutablePushContexts, 0);
  objc_storeStrong((id *)&self->_pushContexts, 0);
}

- (void)setClientCacheIdentifier:(id)a3
{
}

- (NSString)clientCacheIdentifier
{
  return self->_clientCacheIdentifier;
}

- (BOOL)batchCanLowerQuota
{
  return self->_batchCanLowerQuota;
}

- (void)setFull:(BOOL)a3
{
  self->_full = a3;
}

- (BOOL)isFull
{
  return self->_full;
}

- (unint64_t)resourceSize
{
  return self->_resourceSize;
}

- (CPLChangeBatch)batch
{
  return self->_batch;
}

- (void)enumeratePushContextsWithBlock:(id)a3
{
}

- (void)forceScopeIndexOnAllRecordsTo:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = self->_batch;
  uint64_t v5 = [(CPLChangeBatch *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setScopeIndex:", a3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(CPLChangeBatch *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (unint64_t)effectiveResourceSizeToUploadUsingStorage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_resourceSizeIsCalculated)
  {
    self->_resourceSizeIsCalculated = 1;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = self->_batch;
    uint64_t v6 = [(CPLChangeBatch *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v10, "supportsResources", (void)v13)
            && [v10 hasChangeType:8])
          {
            self->_resourceSize += [v10 effectiveResourceSizeToUploadUsingStorage:v4];
          }
        }
        uint64_t v7 = [(CPLChangeBatch *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  unint64_t resourceSize = self->_resourceSize;

  return resourceSize;
}

- (NSFastEnumeration)uploadIdentifiers
{
  v3 = [CPLMapEnumerator alloc];
  mutablePushContexts = self->_mutablePushContexts;
  if (!mutablePushContexts) {
    mutablePushContexts = (NSMutableDictionary *)self->_pushContexts;
  }
  uint64_t v5 = [(NSMutableDictionary *)mutablePushContexts objectEnumerator];
  uint64_t v6 = [(CPLMapEnumerator *)v3 initWithEnumerator:v5 map:&__block_literal_global_32_21708];

  return (NSFastEnumeration *)v6;
}

uint64_t __38__CPLExtractedBatch_uploadIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uploadIdentifier];
}

- (void)addChange:(id)a3 fromStorage:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  uint64_t v7 = [v22 scopedIdentifier];
  uint64_t v8 = [v22 _pushContext];
  if (v8)
  {
    mutablePushContexts = self->_mutablePushContexts;
    if (!mutablePushContexts)
    {
      pushContexts = self->_pushContexts;
      if (pushContexts)
      {
        long long v11 = (NSMutableDictionary *)[(NSDictionary *)pushContexts mutableCopy];
        long long v12 = self->_mutablePushContexts;
        self->_mutablePushContexts = v11;

        long long v13 = (NSMutableDictionary *)self->_pushContexts;
        self->_pushContexts = 0;
      }
      else
      {
        long long v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v13 = self->_mutablePushContexts;
        self->_mutablePushContexts = v14;
      }

      mutablePushContexts = self->_mutablePushContexts;
    }
    [(NSMutableDictionary *)mutablePushContexts setObject:v8 forKeyedSubscript:v7];
  }
  if ([v22 _shouldNotTrustCloudCache])
  {
    mutableUntrustableScopedIndentifiers = self->_mutableUntrustableScopedIndentifiers;
    if (!mutableUntrustableScopedIndentifiers)
    {
      untrustableScopedIdentifiers = self->_untrustableScopedIdentifiers;
      if (untrustableScopedIdentifiers)
      {
        v17 = (NSMutableSet *)[(NSSet *)untrustableScopedIdentifiers mutableCopy];
        uint64_t v18 = self->_mutableUntrustableScopedIndentifiers;
        self->_mutableUntrustableScopedIndentifiers = v17;

        v19 = (NSMutableSet *)self->_untrustableScopedIdentifiers;
        self->_untrustableScopedIdentifiers = 0;
      }
      else
      {
        v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v19 = self->_mutableUntrustableScopedIndentifiers;
        self->_mutableUntrustableScopedIndentifiers = v20;
      }

      mutableUntrustableScopedIndentifiers = self->_mutableUntrustableScopedIndentifiers;
    }
    [(NSMutableSet *)mutableUntrustableScopedIndentifiers addObject:v7];
  }
  if (self->_batchCanLowerQuota) {
    char v21 = 1;
  }
  else {
    char v21 = [v22 canLowerQuota];
  }
  self->_batchCanLowerQuota = v21;
  if ([v22 supportsResources] && objc_msgSend(v22, "hasChangeType:", 8)) {
    self->_resourceSize += [v22 effectiveResourceSizeToUploadUsingStorage:v6];
  }
  [(CPLChangeBatch *)self->_batch addRecord:v22];
}

- (id)uploadIdentifierForChange:(id)a3
{
  mutablePushContexts = self->_mutablePushContexts;
  if (!mutablePushContexts) {
    mutablePushContexts = (NSMutableDictionary *)self->_pushContexts;
  }
  id v4 = [a3 scopedIdentifier];
  uint64_t v5 = [(NSMutableDictionary *)mutablePushContexts objectForKeyedSubscript:v4];
  id v6 = [v5 uploadIdentifier];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  [v11 encodeObject:self->_batch forKey:@"batch"];
  mutablePushContexts = self->_mutablePushContexts;
  if (mutablePushContexts)
  {
    if (self->_pushContexts)
    {
      if (!_CPLSilentLogging)
      {
        id v6 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          long long v13 = self;
          _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "%@ can't have both mutable and immutable push contexts", buf, 0xCu);
        }
      }
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLExtractedBatch.m"];
      [v7 handleFailureInMethod:a2, self, v8, 79, @"%@ can't have both mutable and immutable push contexts", self object file lineNumber description];
      goto LABEL_16;
    }
  }
  else
  {
    mutablePushContexts = (NSMutableDictionary *)self->_pushContexts;
  }
  [v11 encodeObject:mutablePushContexts forKey:@"pushContexts"];
  mutableUntrustableScopedIndentifiers = self->_mutableUntrustableScopedIndentifiers;
  if (mutableUntrustableScopedIndentifiers)
  {
    if (self->_untrustableScopedIdentifiers)
    {
      if (!_CPLSilentLogging)
      {
        long long v10 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          long long v13 = self;
          _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "%@ can't have both mutable and immutable untrustable identifiers", buf, 0xCu);
        }
      }
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLExtractedBatch.m"];
      [v7 handleFailureInMethod:a2, self, v8, 81, @"%@ can't have both mutable and immutable untrustable identifiers", self object file lineNumber description];
LABEL_16:

      abort();
    }
  }
  else
  {
    mutableUntrustableScopedIndentifiers = (NSMutableSet *)self->_untrustableScopedIdentifiers;
  }
  [v11 encodeObject:mutableUntrustableScopedIndentifiers forKey:@"untrustableIdentifiers"];
  [v11 encodeObject:self->_clientCacheIdentifier forKey:@"clientCacheIdentifier"];
}

- (CPLExtractedBatch)initWithCoder:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CPLExtractedBatch;
  uint64_t v5 = [(CPLExtractedBatch *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batch"];
    batch = v5->_batch;
    v5->_batch = (CPLChangeBatch *)v6;

    if (initWithCoder__onceToken_21739 != -1) {
      dispatch_once(&initWithCoder__onceToken_21739, &__block_literal_global_21740);
    }
    uint64_t v8 = [v4 decodeObjectOfClasses:initWithCoder__pushContextsClasses_21741 forKey:@"pushContexts"];
    pushContexts = v5->_pushContexts;
    v5->_pushContexts = (NSDictionary *)v8;

    if (!v5->_pushContexts)
    {
      uint64_t v10 = +[CPLRecordPushContext pushContextsFromStoredUploadIdentifiersInCoder:v4 key:@"uploadIdentifiers"];
      id v11 = v5->_pushContexts;
      v5->_pushContexts = (NSDictionary *)v10;
    }
    uint64_t v12 = [v4 decodeObjectOfClasses:initWithCoder__untrustableIdentifiersClasses forKey:@"untrustableIdentifiers"];
    untrustableScopedIdentifiers = v5->_untrustableScopedIdentifiers;
    v5->_untrustableScopedIdentifiers = (NSSet *)v12;

    uint64_t v14 = +[CPLScopedIdentifier scopedIdentifiersFromSetOfUnknownIdentifiers:v5->_untrustableScopedIdentifiers];
    long long v15 = v5->_untrustableScopedIdentifiers;
    v5->_untrustableScopedIdentifiers = (NSSet *)v14;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v16 = v5->_batch;
    uint64_t v17 = [(CPLChangeBatch *)v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          char v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v22 = objc_msgSend(v21, "scopedIdentifier", (void)v27);
          id v23 = [(NSDictionary *)v5->_pushContexts objectForKeyedSubscript:v22];
          if (!v23) {
            id v23 = +[CPLRecordPushContext newEmptyPushContext];
          }
          [v21 _setPushContext:v23];
          if ([(NSSet *)v5->_untrustableScopedIdentifiers containsObject:v22]) {
            [v21 _setShouldNotTrustCloudCache:1];
          }
        }
        uint64_t v18 = [(CPLChangeBatch *)v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v18);
    }

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientCacheIdentifier"];
    clientCacheIdentifier = v5->_clientCacheIdentifier;
    v5->_clientCacheIdentifier = (NSString *)v24;
  }
  return v5;
}

uint64_t __35__CPLExtractedBatch_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  id v4 = (void *)initWithCoder__pushContextsClasses_21741;
  initWithCoder__pushContextsClasses_21741 = v3;

  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  uint64_t v9 = initWithCoder__untrustableIdentifiersClasses;
  initWithCoder__untrustableIdentifiersClasses = v8;
  return MEMORY[0x1F41817F8](v8, v9);
}

- (CPLExtractedBatch)init
{
  v6.receiver = self;
  v6.super_class = (Class)CPLExtractedBatch;
  uint64_t v2 = [(CPLExtractedBatch *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(CPLChangeBatch);
    batch = v2->_batch;
    v2->_batch = v3;

    v2->_resourceSizeIsCalculated = 1;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end