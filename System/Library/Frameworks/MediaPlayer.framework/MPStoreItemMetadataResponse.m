@interface MPStoreItemMetadataResponse
- (BOOL)isExpired;
- (BOOL)isFinalResponse;
- (ICURLAggregatedPerformanceMetrics)performanceMetrics;
- (MPStoreItemMetadataResponse)init;
- (NSArray)cacheMissItemIdentifiers;
- (NSArray)itemIdentifiers;
- (NSArray)lastBatchItemIdentifiers;
- (NSArray)lastBatchStoreItemDictionaries;
- (NSArray)requestItemIdentifiers;
- (NSDate)earliestExpirationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)storeItemMetadataForItemIdentifier:(id)a3;
- (id)storeItemMetadataForItemIdentifier:(id)a3 returningIsFinalMetadata:(BOOL *)a4;
- (void)setCacheMissItemIdentifiers:(id)a3;
- (void)setFinalResponse:(BOOL)a3;
- (void)setLastBatchItemIdentifiers:(id)a3;
- (void)setPerformanceMetrics:(id)a3;
- (void)setRequestItemIdentifiers:(id)a3;
- (void)setStoreItemMetadata:(id)a3 forItemIdentifier:(id)a4;
@end

@implementation MPStoreItemMetadataResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_requestItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_lastBatchItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemIdentifierToStoreItemMetadata, 0);

  objc_storeStrong((id *)&self->_cacheMissItemIdentifiers, 0);
}

- (void)setPerformanceMetrics:(id)a3
{
}

- (ICURLAggregatedPerformanceMetrics)performanceMetrics
{
  return self->_performanceMetrics;
}

- (void)setRequestItemIdentifiers:(id)a3
{
}

- (NSArray)requestItemIdentifiers
{
  return self->_requestItemIdentifiers;
}

- (void)setLastBatchItemIdentifiers:(id)a3
{
}

- (NSArray)lastBatchItemIdentifiers
{
  return self->_lastBatchItemIdentifiers;
}

- (void)setCacheMissItemIdentifiers:(id)a3
{
}

- (void)setFinalResponse:(BOOL)a3
{
  self->_finalResponse = a3;
}

- (BOOL)isFinalResponse
{
  return self->_finalResponse;
}

- (void)setStoreItemMetadata:(id)a3 forItemIdentifier:(id)a4
{
  if (a3)
  {
    if (a4) {
      -[NSMutableDictionary setObject:forKey:](self->_itemIdentifierToStoreItemMetadata, "setObject:forKey:");
    }
  }
}

- (id)storeItemMetadataForItemIdentifier:(id)a3 returningIsFinalMetadata:(BOOL *)a4
{
  if (a3)
  {
    v5 = -[NSMutableDictionary objectForKey:](self->_itemIdentifierToStoreItemMetadata, "objectForKey:", a3, a4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)storeItemMetadataForItemIdentifier:(id)a3
{
  return [(MPStoreItemMetadataResponse *)self storeItemMetadataForItemIdentifier:a3 returningIsFinalMetadata:0];
}

- (BOOL)isExpired
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  itemIdentifierToStoreItemMetadata = self->_itemIdentifierToStoreItemMetadata;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__MPStoreItemMetadataResponse_isExpired__block_invoke;
  v5[3] = &unk_1E57F7978;
  v5[4] = &v6;
  [(NSMutableDictionary *)itemIdentifierToStoreItemMetadata enumerateKeysAndObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__MPStoreItemMetadataResponse_isExpired__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 isExpired];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (NSDate)earliestExpirationDate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__47691;
  v10 = __Block_byref_object_dispose__47692;
  id v11 = 0;
  itemIdentifierToStoreItemMetadata = self->_itemIdentifierToStoreItemMetadata;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__MPStoreItemMetadataResponse_earliestExpirationDate__block_invoke;
  v5[3] = &unk_1E57F7978;
  v5[4] = &v6;
  [(NSMutableDictionary *)itemIdentifierToStoreItemMetadata enumerateKeysAndObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

void __53__MPStoreItemMetadataResponse_earliestExpirationDate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 expirationDate];
  if (v4)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    id v11 = v4;
    if (v6)
    {
      uint64_t v7 = [v6 earlierDate:v4];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      char v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    else
    {
      id v10 = v4;
      char v9 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v10;
    }

    uint64_t v4 = v11;
  }
}

- (NSArray)itemIdentifiers
{
  v2 = [(NSMutableDictionary *)self->_itemIdentifierToStoreItemMetadata allKeys];
  id v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v4 = v2;

  return v4;
}

- (NSArray)cacheMissItemIdentifiers
{
  if (self->_cacheMissItemIdentifiers) {
    return self->_cacheMissItemIdentifiers;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (NSArray)lastBatchStoreItemDictionaries
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v4 = [(MPStoreItemMetadataResponse *)self lastBatchItemIdentifiers];
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(MPStoreItemMetadataResponse *)self lastBatchItemIdentifiers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [(NSMutableDictionary *)self->_itemIdentifierToStoreItemMetadata objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        v12 = [v11 effectiveStorePlatformDictionary];

        if (v12) {
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13 = (void *)[v5 copy];

  return (NSArray *)v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(NSArray *)self->_cacheMissItemIdentifiers copy];
    uint64_t v6 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v5;

    uint64_t v7 = [(NSArray *)self->_requestItemIdentifiers copy];
    uint64_t v8 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v7;

    *(unsigned char *)(v4 + 24) = self->_finalResponse;
    uint64_t v9 = [(NSMutableDictionary *)self->_itemIdentifierToStoreItemMetadata mutableCopy];
    id v10 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v9;

    uint64_t v11 = [(NSArray *)self->_lastBatchItemIdentifiers copy];
    v12 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v11;

    objc_storeStrong((id *)(v4 + 48), self->_performanceMetrics);
  }
  return (id)v4;
}

- (MPStoreItemMetadataResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPStoreItemMetadataResponse;
  v2 = [(MPStoreItemMetadataResponse *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    itemIdentifierToStoreItemMetadata = v2->_itemIdentifierToStoreItemMetadata;
    v2->_itemIdentifierToStoreItemMetadata = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end