@interface MPStoreItemMetadataCache
- (MPStoreItemMetadataCache)initWithCacheSize:(int64_t)a3;
- (id)addMetadata:(id)a3 forItemIdentifier:(id)a4;
- (id)metadataForItemIdentifier:(id)a3;
- (id)metadataForItemIdentifier:(id)a3 ignoreExpiration:(BOOL)a4;
- (int64_t)count;
- (void)removeExpiredMetadata;
@end

@implementation MPStoreItemMetadataCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifierToCompositeStoreItemMetadataMapTable, 0);

  objc_storeStrong((id *)&self->_itemIdentifierToCompositeStoreItemMetadataLRUDictionary, 0);
}

- (void)removeExpiredMetadata
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [(MSVLRUDictionary *)self->_itemIdentifierToCompositeStoreItemMetadataLRUDictionary allKeys];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v9 = [(MSVLRUDictionary *)self->_itemIdentifierToCompositeStoreItemMetadataLRUDictionary objectForKey:v8];
        if ([v9 isExpired]) {
          [(MSVLRUDictionary *)self->_itemIdentifierToCompositeStoreItemMetadataLRUDictionary removeObjectForKey:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }
  v10 = self->_itemIdentifierToCompositeStoreItemMetadataMapTable;
  v11 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E10]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, -[NSMapTable count](v10, "count"));
  itemIdentifierToCompositeStoreItemMetadataMapTable = self->_itemIdentifierToCompositeStoreItemMetadataMapTable;
  self->_itemIdentifierToCompositeStoreItemMetadataMapTable = v11;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v13 = v10;
  uint64_t v14 = [(NSMapTable *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * j);
        v19 = -[NSMapTable objectForKey:](v13, "objectForKey:", v18, (void)v20);
        if (([v19 isExpired] & 1) == 0) {
          [(NSMapTable *)self->_itemIdentifierToCompositeStoreItemMetadataMapTable setObject:v19 forKey:v18];
        }
      }
      uint64_t v15 = [(NSMapTable *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }
}

- (id)metadataForItemIdentifier:(id)a3 ignoreExpiration:(BOOL)a4
{
  id v6 = a3;
  v7 = [(MSVLRUDictionary *)self->_itemIdentifierToCompositeStoreItemMetadataLRUDictionary objectForKey:v6];
  uint64_t v8 = v7;
  if (v7 && (a4 || ([v7 isExpired] & 1) == 0))
  {
    id v11 = v8;
  }
  else
  {
    v9 = [(NSMapTable *)self->_itemIdentifierToCompositeStoreItemMetadataMapTable objectForKey:v6];
    v10 = v9;
    if (v9 && (a4 || ([v9 isExpired] & 1) == 0)) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
  }

  return v11;
}

- (id)metadataForItemIdentifier:(id)a3
{
  return [(MPStoreItemMetadataCache *)self metadataForItemIdentifier:a3 ignoreExpiration:0];
}

- (int64_t)count
{
  unint64_t v3 = [(MSVLRUDictionary *)self->_itemIdentifierToCompositeStoreItemMetadataLRUDictionary count];
  int64_t result = [(NSMapTable *)self->_itemIdentifierToCompositeStoreItemMetadataMapTable count];
  if (v3 < result) {
    return v3;
  }
  return result;
}

- (id)addMetadata:(id)a3 forItemIdentifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = [(MPStoreItemMetadataCache *)self metadataForItemIdentifier:v7];
  v10 = v9;
  id v11 = v8;
  if (v9)
  {
    id v11 = v8;
    if (([v9 isExpired] & 1) == 0)
    {
      id v11 = [v10 metadataByAppendingMetadata:v8];
    }
  }
  long long v21 = v8;
  v12 = [v11 childStoreItemMetadatas];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v18 = [v17 cacheableItemIdentifier];
        if ([v18 length]) {
          id v19 = [(MPStoreItemMetadataCache *)self addMetadata:v17 forItemIdentifier:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }
  [(MSVLRUDictionary *)self->_itemIdentifierToCompositeStoreItemMetadataLRUDictionary setObject:v11 forKey:v7];
  [(NSMapTable *)self->_itemIdentifierToCompositeStoreItemMetadataMapTable setObject:v11 forKey:v7];

  return v11;
}

- (MPStoreItemMetadataCache)initWithCacheSize:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MPStoreItemMetadataCache;
  uint64_t v4 = [(MPStoreItemMetadataCache *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F77998]) initWithMaximumCapacity:a3];
    itemIdentifierToCompositeStoreItemMetadataLRUDictionary = v4->_itemIdentifierToCompositeStoreItemMetadataLRUDictionary;
    v4->_itemIdentifierToCompositeStoreItemMetadataLRUDictionary = (MSVLRUDictionary *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:5 capacity:0];
    itemIdentifierToCompositeStoreItemMetadataMapTable = v4->_itemIdentifierToCompositeStoreItemMetadataMapTable;
    v4->_itemIdentifierToCompositeStoreItemMetadataMapTable = (NSMapTable *)v7;
  }
  return v4;
}

@end