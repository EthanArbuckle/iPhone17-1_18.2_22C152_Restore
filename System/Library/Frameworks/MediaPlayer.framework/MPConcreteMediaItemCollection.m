@interface MPConcreteMediaItemCollection
+ (BOOL)supportsSecureCoding;
+ (id)createUncachedMediaItemCollectionWithIdentifier:(int64_t)a3 valuesForProperties:(id)a4 itemsQuery:(id)a5 grouping:(int64_t)a6 representativeItemIdentifier:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (MPConcreteMediaEntityPropertiesCache)cachedPropertyValues;
- (MPConcreteMediaItemCollection)initWithCoder:(id)a3;
- (MPConcreteMediaItemCollection)initWithIdentifier:(int64_t)a3 itemsQuery:(id)a4 grouping:(int64_t)a5;
- (MPConcreteMediaItemCollection)initWithIdentifier:(int64_t)a3 valuesForProperties:(id)a4 itemsQuery:(id)a5 grouping:(int64_t)a6 representativeItemIdentifier:(int64_t)a7;
- (MPConcreteMediaItemCollection)initWithMultiverseIdentifier:(id)a3 library:(id)a4;
- (id)_initWithIdentifier:(int64_t)a3 valuesForProperties:(id)a4 itemsQuery:(id)a5 grouping:(int64_t)a6 representativeItemIdentifier:(int64_t)a7 propertiesCache:(id)a8;
- (id)_tokenBinaryIdentifierAsString;
- (id)items;
- (id)itemsQuery;
- (id)mediaLibrary;
- (id)representativeItem;
- (id)valueForProperty:(id)a3;
- (id)valuesForProperties:(id)a3;
- (int64_t)groupingType;
- (unint64_t)count;
- (unint64_t)hash;
- (unint64_t)persistentID;
- (void)_enumerateItemPersistentIDsUsingBlock:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4;
- (void)invalidateCachedProperties;
- (void)setValue:(id)a3 forProperty:(id)a4 withCompletionBlock:(id)a5;
@end

@implementation MPConcreteMediaItemCollection

uint64_t __50__MPConcreteMediaItemCollection_valueForProperty___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 objectForKey:a1[4]];
  uint64_t v4 = *(void *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = a1[4];
  v7 = *(void **)(a1[5] + 104);
  uint64_t v8 = *(void *)(*(void *)(a1[6] + 8) + 40);

  return [v7 cacheValue:v8 forProperty:v6 persistValueInBackgroundBlock:0];
}

- (int64_t)groupingType
{
  return self->_grouping;
}

- (MPConcreteMediaItemCollection)initWithIdentifier:(int64_t)a3 itemsQuery:(id)a4 grouping:(int64_t)a5
{
  return [(MPConcreteMediaItemCollection *)self initWithIdentifier:a3 valuesForProperties:0 itemsQuery:a4 grouping:a5 representativeItemIdentifier:0];
}

- (unint64_t)count
{
  return [(MPMediaQuery *)self->_itemsQuery _countOfItems];
}

- (void)dealloc
{
  uint64_t v3 = [(MPConcreteMediaItemCollection *)self mediaLibrary];
  uint64_t v4 = [v3 libraryDataProvider];
  v5 = [v4 entityCache];
  objc_msgSend(v5, "removeEntityWithIdentifier:dataProviderEntityClass:", self->_identifier, -[MPConcreteMediaEntityPropertiesCache dataProviderEntityClass](self->_propertiesCache, "dataProviderEntityClass"));

  v6.receiver = self;
  v6.super_class = (Class)MPConcreteMediaItemCollection;
  [(MPConcreteMediaItemCollection *)&v6 dealloc];
}

- (id)mediaLibrary
{
  return [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
}

- (id)representativeItem
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  p_representativeItem = &self->_representativeItem;
  representativeItem = self->_representativeItem;
  unint64_t v4 = 0x1E4F1C000;
  if (!representativeItem)
  {
    objc_super v6 = +[MPMediaItemCollection representativePersistentIDPropertyForGroupingType:self->_grouping];
    if (v6)
    {
      v7 = [(MPConcreteMediaItemCollection *)self valueForProperty:v6];
      uint64_t v8 = v7;
      if (v7 && [v7 longLongValue])
      {
        v9 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
        v10 = +[MPConcreteMediaItem concreteMediaItemWithPersistentID:library:](MPConcreteMediaItem, "concreteMediaItemWithPersistentID:library:", [v8 unsignedLongLongValue], v9);
        if ([v10 existsInLibrary]) {
          objc_storeStrong((id *)p_representativeItem, v10);
        }
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    if (!*p_representativeItem)
    {
      [(MPConcreteMediaItemCollection *)self items];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v30;
LABEL_12:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v29 + 1) + 8 * v15);
          v17 = [v16 artwork];

          if (v17) {
            objc_storeStrong((id *)p_representativeItem, v16);
          }
          if ([v16 mediaType] != 2048) {
            break;
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
            if (v13) {
              goto LABEL_12;
            }
            break;
          }
        }
      }

      if (!*p_representativeItem)
      {
        uint64_t v18 = [v11 count];
        if (v18)
        {
          uint64_t v18 = [v11 objectAtIndex:0];
        }
        v19 = *p_representativeItem;
        *p_representativeItem = (MPMediaItem *)v18;
      }
      unint64_t v4 = 0x1E4F1C000uLL;
      if (self->_grouping != 9)
      {
        if (*p_representativeItem)
        {
          v20 = [(MPConcreteMediaItemCollection *)self mediaLibrary];
          int v21 = [v20 writable];

          if (v21)
          {
            v22 = objc_msgSend(NSNumber, "numberWithLongLong:", -[MPMediaEntity persistentID](*p_representativeItem, "persistentID"));
            [(MPConcreteMediaItemCollection *)self setValue:v22 forProperty:v6 withCompletionBlock:0];
          }
        }
      }

      if (!*p_representativeItem)
      {
        uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
        v24 = *p_representativeItem;
        *p_representativeItem = (MPMediaItem *)v23;
      }
    }

    representativeItem = *p_representativeItem;
  }
  v25 = [*(id *)(v4 + 2712) null];
  if ([(MPMediaItem *)representativeItem isEqual:v25]) {
    v26 = 0;
  }
  else {
    v26 = *p_representativeItem;
  }
  v27 = v26;

  return v27;
}

- (MPConcreteMediaItemCollection)initWithIdentifier:(int64_t)a3 valuesForProperties:(id)a4 itemsQuery:(id)a5 grouping:(int64_t)a6 representativeItemIdentifier:(int64_t)a7
{
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = [v13 mediaLibrary];
  uint64_t v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[MPMediaLibrary defaultMediaLibrary];
  }
  v17 = v16;

  uint64_t v18 = [v17 libraryDataProvider];
  v19 = [v18 entityCache];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __121__MPConcreteMediaItemCollection_initWithIdentifier_valuesForProperties_itemsQuery_grouping_representativeItemIdentifier___block_invoke;
  v25[3] = &unk_1E57F1448;
  id v26 = v12;
  v27 = self;
  id v28 = v13;
  int64_t v29 = a3;
  int64_t v30 = a6;
  int64_t v31 = a7;
  id v20 = v13;
  int v21 = self;
  id v22 = v12;
  uint64_t v23 = [v19 collectionWithIdentifier:a3 grouping:a6 loadEntityBlock:v25];

  return v23;
}

id __121__MPConcreteMediaItemCollection_initWithIdentifier_valuesForProperties_itemsQuery_grouping_representativeItemIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  unint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a2;
  objc_super v6 = [v3 allKeys];
  v7 = [v4 setWithArray:v6];
  [v5 cachePropertyValues:v3 forProperties:v7 persistValueInBackgroundBlock:0];

  uint64_t v8 = (void *)[*(id *)(a1 + 40) _initWithIdentifier:*(void *)(a1 + 56) valuesForProperties:*(void *)(a1 + 32) itemsQuery:*(void *)(a1 + 48) grouping:*(void *)(a1 + 64) representativeItemIdentifier:*(void *)(a1 + 72) propertiesCache:v5];

  return v8;
}

- (id)_initWithIdentifier:(int64_t)a3 valuesForProperties:(id)a4 itemsQuery:(id)a5 grouping:(int64_t)a6 representativeItemIdentifier:(int64_t)a7 propertiesCache:(id)a8
{
  id v13 = a5;
  id v14 = a8;
  v24.receiver = self;
  v24.super_class = (Class)MPConcreteMediaItemCollection;
  uint64_t v15 = [(MPMediaItemCollection *)&v24 initWithItems:0];
  id v16 = v15;
  if (v15)
  {
    v15->_identifier = a3;
    uint64_t v17 = [v13 copy];
    itemsQuery = v16->_itemsQuery;
    v16->_itemsQuery = (MPMediaQuery *)v17;

    v16->_grouping = a6;
    objc_storeStrong((id *)&v16->_propertiesCache, a8);
    if (a7)
    {
      v19 = [v13 mediaLibrary];
      uint64_t v20 = +[MPConcreteMediaItem concreteMediaItemWithPersistentID:a7 library:v19];
      representativeItem = v16->_representativeItem;
      v16->_representativeItem = (MPMediaItem *)v20;

      if (![(MPMediaItem *)v16->_representativeItem existsInLibrary])
      {
        id v22 = v16->_representativeItem;
        v16->_representativeItem = 0;
      }
    }
  }

  return v16;
}

- (id)valueForProperty:(id)a3
{
  id v4 = a3;
  id v5 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  objc_super v6 = [v5 libraryDataProvider];

  char v22 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__21447;
  uint64_t v20 = __Block_byref_object_dispose__21448;
  id v21 = [(MPConcreteMediaEntityPropertiesCache *)self->_propertiesCache valueForProperty:v4 isCached:&v22];
  if (!v22 && v6)
  {
    v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    int64_t identifier = self->_identifier;
    int64_t grouping = self->_grouping;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__MPConcreteMediaItemCollection_valueForProperty___block_invoke;
    v12[3] = &unk_1E57F1358;
    uint64_t v15 = &v16;
    id v13 = v4;
    id v14 = self;
    [v6 loadProperties:v7 ofCollectionWithIdentifier:identifier groupingType:grouping completionBlock:v12];
  }
  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)items
{
  return [(MPMediaQuery *)self->_itemsQuery items];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesCache, 0);
  objc_storeStrong((id *)&self->_representativeItem, 0);

  objc_storeStrong((id *)&self->_itemsQuery, 0);
}

- (void)_enumerateItemPersistentIDsUsingBlock:(id)a3
{
}

- (id)itemsQuery
{
  return self->_itemsQuery;
}

- (void)setValue:(id)a3 forProperty:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MPConcreteMediaItemCollection *)self mediaLibrary];
  id v12 = [v11 libraryDataProvider];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__MPConcreteMediaItemCollection_setValue_forProperty_withCompletionBlock___block_invoke;
    v16[3] = &unk_1E57F14C0;
    objc_copyWeak(&v18, &location);
    id v17 = v10;
    id v14 = (void (**)(void, void, void))MEMORY[0x19971E0F0](v16);
    propertiesCache = self->_propertiesCache;
    if (propertiesCache) {
      [(MPConcreteMediaEntityPropertiesCache *)propertiesCache cacheValue:v8 forProperty:v9 persistValueInBackgroundBlock:v14];
    }
    else {
      ((void (**)(void, id, id))v14)[2](v14, v8, v9);
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else if (v10)
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

void __74__MPConcreteMediaItemCollection_setValue_forProperty_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = [WeakRetained persistentID];
    id v9 = [v7 mediaLibrary];
    id v10 = [v9 libraryDataProvider];

    [v10 setValue:v11 forProperty:v5 ofCollectionWithIdentifier:v8 groupingType:v7[11] completionBlock:*(void *)(a1 + 32)];
  }
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__MPConcreteMediaItemCollection_setValue_forProperty___block_invoke;
  v11[3] = &unk_1E57F14E8;
  id v9 = v8;
  id v12 = v9;
  char v13 = &v14;
  [(MPConcreteMediaItemCollection *)self setValue:v6 forProperty:v7 withCompletionBlock:v11];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

intptr_t __54__MPConcreteMediaItemCollection_setValue_forProperty___block_invoke(uint64_t a1, char a2)
{
  intptr_t result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return result;
}

- (id)valuesForProperties:(id)a3
{
  id v4 = a3;
  id v5 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  id v6 = [v5 libraryDataProvider];

  id v7 = (void *)[v4 mutableCopy];
  dispatch_semaphore_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __53__MPConcreteMediaItemCollection_valuesForProperties___block_invoke;
  v24[3] = &unk_1E57F1498;
  v24[4] = self;
  id v9 = v7;
  id v25 = v9;
  id v10 = v8;
  id v26 = v10;
  [v4 enumerateObjectsUsingBlock:v24];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__21447;
  char v22 = __Block_byref_object_dispose__21448;
  id v23 = 0;
  if (v6 && [v9 count])
  {
    int64_t identifier = self->_identifier;
    int64_t grouping = self->_grouping;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__MPConcreteMediaItemCollection_valuesForProperties___block_invoke_2;
    v15[3] = &unk_1E57F1358;
    v15[4] = self;
    id v16 = v9;
    char v17 = &v18;
    [v6 loadProperties:v16 ofCollectionWithIdentifier:identifier groupingType:grouping completionBlock:v15];
  }
  if (v19[5]) {
    objc_msgSend(v10, "addEntriesFromDictionary:");
  }
  id v13 = v10;
  _Block_object_dispose(&v18, 8);

  return v13;
}

void __53__MPConcreteMediaItemCollection_valuesForProperties___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v5 = 0;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 104) valueForProperty:v3 isCached:&v5];
  if (v5)
  {
    [*(id *)(a1 + 40) removeObject:v3];
    if (v4) {
      [*(id *)(a1 + 48) setObject:v4 forKey:v3];
    }
  }
}

void __53__MPConcreteMediaItemCollection_valuesForProperties___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1[4] + 104) cachePropertyValues:v3 forProperties:a1[5] persistValueInBackgroundBlock:0];
  uint64_t v4 = *(void *)(a1[6] + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
  id v9 = [v8 libraryDataProvider];

  id v10 = (void *)[v6 mutableCopy];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__MPConcreteMediaItemCollection_enumerateValuesForProperties_usingBlock___block_invoke;
  v18[3] = &unk_1E57F13A8;
  v18[4] = self;
  id v11 = v10;
  id v19 = v11;
  id v12 = v7;
  id v20 = v12;
  id v21 = &v22;
  [v6 enumerateObjectsUsingBlock:v18];
  if (!*((unsigned char *)v23 + 24))
  {
    int64_t identifier = self->_identifier;
    int64_t grouping = self->_grouping;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73__MPConcreteMediaItemCollection_enumerateValuesForProperties_usingBlock___block_invoke_2;
    v15[3] = &unk_1E57F1470;
    v15[4] = self;
    id v16 = v11;
    id v17 = v12;
    [v9 loadProperties:v16 ofCollectionWithIdentifier:identifier groupingType:grouping completionBlock:v15];
  }
  _Block_object_dispose(&v22, 8);
}

void __73__MPConcreteMediaItemCollection_enumerateValuesForProperties_usingBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  char v7 = 0;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 104) valueForProperty:v5 isCached:&v7];
  if (v7)
  {
    [*(id *)(a1 + 40) removeObject:v5];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
}

void __73__MPConcreteMediaItemCollection_enumerateValuesForProperties_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 104) cachePropertyValues:v3 forProperties:*(void *)(a1 + 40) persistValueInBackgroundBlock:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [v3 objectForKey:*(void *)(*((void *)&v10 + 1) + 8 * v8)];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)_tokenBinaryIdentifierAsString
{
  if ((unint64_t)([(MPConcreteMediaItemCollection *)self groupingType] - 1) > 4)
  {
    id v3 = 0;
  }
  else
  {
    objc_opt_class();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  unint64_t v4 = [(MPConcreteMediaItemCollection *)self persistentID];
  uint64_t v5 = [(MPConcreteMediaItemCollection *)self mediaLibrary];
  uint64_t v6 = [v5 ml3Library];
  uint64_t v7 = [v6 libraryUID];
  uint64_t v8 = [v3 URLForEntityWithPersistentID:v4 libraryUID:v7];
  id v9 = [v8 absoluteString];

  return v9;
}

- (unint64_t)persistentID
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if ([v5 allowsKeyedCoding])
  {
    unint64_t v4 = [(MPMediaQuery *)self->_itemsQuery mediaLibrary];
    [v5 encodeObject:v4 forKey:@"MPLibrary"];

    [v5 encodeObject:self->_itemsQuery forKey:@"MPQuery"];
    [v5 encodeInt64:self->_identifier forKey:@"id"];
    [v5 encodeInteger:self->_grouping forKey:@"group"];
  }
}

- (MPConcreteMediaItemCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPLibrary"];
    if (v5)
    {
      v11.receiver = self;
      v11.super_class = (Class)MPConcreteMediaItemCollection;
      uint64_t v6 = [(MPMediaItemCollection *)&v11 initWithItems:0];
      if (v6)
      {
        uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPQuery"];
        itemsQuery = v6->_itemsQuery;
        v6->_itemsQuery = (MPMediaQuery *)v7;

        v6->_int64_t identifier = [v4 decodeInt64ForKey:@"id"];
        v6->_int64_t grouping = [v4 decodeIntegerForKey:@"group"];
      }
      self = v6;
      id v9 = self;
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)invalidateCachedProperties
{
}

- (MPConcreteMediaEntityPropertiesCache)cachedPropertyValues
{
  return self->_propertiesCache;
}

- (unint64_t)hash
{
  return self->_grouping ^ self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4[9] == self->_identifier && v4[11] == self->_grouping;

  return v5;
}

- (MPConcreteMediaItemCollection)initWithMultiverseIdentifier:(id)a3 library:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v45 = [v6 mediaObjectType];
  unsigned int v47 = v45 - 1;
  if ((v45 - 1) > 7) {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v8 = qword_19568ACB8[(v45 - 1)];
  }
  id v9 = [v6 libraryIdentifiers];
  v48 = self;
  v49 = v6;
  v50 = v7;
  if (v7)
  {
    id v10 = v7;
  }
  else
  {
    id v10 = +[MPMediaLibrary defaultMediaLibrary];
  }
  v51 = v10;
  id v11 = [v10 uniqueIdentifier];
  uint64_t v57 = 0;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (!v13) {
    goto LABEL_21;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v54;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v54 != v15) {
        objc_enumerationMutation(v12);
      }
      id v17 = *(void **)(*((void *)&v53 + 1) + 8 * i);
      uint64_t v18 = [v17 libraryName];
      if (![v18 length])
      {

        continue;
      }
      id v19 = [v17 libraryName];
      if (v19 == v11)
      {
      }
      else
      {
        id v20 = v19;
        char v21 = [v19 isEqual:v11];

        if ((v21 & 1) == 0) {
          continue;
        }
      }
      uint64_t v52 = 0;
      uint64_t v52 = [v17 libraryId];
      if ([v51 collectionExistsContainedWithinPersistentIDs:&v52 count:1 groupingType:v8 existentPID:&v57])
      {
        v27 = v12;
        id v23 = v48;
        uint64_t v22 = v49;
        goto LABEL_27;
      }
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v14) {
      continue;
    }
    break;
  }
LABEL_21:

  uint64_t v22 = v49;
  id v23 = v48;
  if ([v49 hasCloudUniversalLibraryId])
  {
    uint64_t v24 = [v49 cloudUniversalLibraryId];
    uint64_t v25 = [v24 length];

    if (v25)
    {
      id v26 = [v49 cloudUniversalLibraryId];
      v27 = +[MPMediaPropertyPredicate predicateWithValue:v26 forProperty:@"storeCloudAlbumID"];

      id v28 = [MPMediaQuery alloc];
      int64_t v29 = [MEMORY[0x1E4F1CAD0] setWithObject:v27];
      int64_t v30 = [(MPMediaQuery *)v28 initWithFilterPredicates:v29 library:v51];

      [(MPMediaQuery *)v30 setEntityLimit:1];
      [(MPMediaQuery *)v30 setGroupingType:v8];
      int64_t v31 = [(MPMediaQuery *)v30 items];
      long long v32 = [v31 firstObject];

      uint64_t v33 = [v32 albumPersistentID];
      if (v32 && v33)
      {
        uint64_t v57 = v33;

LABEL_27:
LABEL_28:
        if (v47 > 7 || ((0xCFu >> v47) & 1) == 0 || (v35 = *off_1E57F15F8[v47]) == 0)
        {
          uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, v23, @"MPMediaLibraryDataProvider.m", 616, @"No persistent ID property could be found for media object of type %d", v45);

          v35 = 0;
        }
        v36 = [NSNumber numberWithUnsignedLongLong:v57];
        v37 = +[MPMediaPropertyPredicate predicateWithValue:v36 forProperty:v35];

        v38 = [MPMediaQuery alloc];
        v39 = [MEMORY[0x1E4F1CAD0] setWithObject:v37];
        v40 = [(MPMediaQuery *)v38 initWithFilterPredicates:v39];

        [(MPMediaQuery *)v40 setGroupingType:v8];
        id v23 = [(MPConcreteMediaItemCollection *)v23 initWithIdentifier:v57 itemsQuery:v40 grouping:v8];

        v41 = v23;
        goto LABEL_40;
      }
    }
  }
  if ([v49 hasStoreId]
    && [v49 storeId]
    && (objc_msgSend(v51, "collectionExistsWithStoreID:groupingType:existentPID:", objc_msgSend(v49, "storeId"), v8, &v57) & 1) != 0)
  {
    goto LABEL_28;
  }
  if ([v49 hasName])
  {
    v42 = [v49 name];
    char v43 = [v51 collectionExistsWithName:v42 groupingType:v8 existentPID:&v57];

    if (v43) {
      goto LABEL_28;
    }
  }
  v41 = 0;
LABEL_40:

  return v41;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)createUncachedMediaItemCollectionWithIdentifier:(int64_t)a3 valuesForProperties:(id)a4 itemsQuery:(id)a5 grouping:(int64_t)a6 representativeItemIdentifier:(int64_t)a7
{
  id v12 = a5;
  id v13 = a4;
  uint64_t v14 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:a3 valuesForProperties:v13 itemsQuery:v12 grouping:a6 representativeItemIdentifier:a7 propertiesCache:0];

  return v14;
}

@end