@interface MPConcreteMediaItem
+ (BOOL)supportsSecureCoding;
+ (id)concreteMediaItemWithPersistentID:(unint64_t)a3;
+ (id)concreteMediaItemWithPersistentID:(unint64_t)a3 library:(id)a4;
+ (id)createUncachedConcreteMediaItemWithPersistentID:(unint64_t)a3 library:(id)a4;
- (BOOL)existsInLibrary;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (Class)classForCoder;
- (MPConcreteMediaEntityPropertiesCache)cachedPropertyValues;
- (MPConcreteMediaItem)init;
- (MPConcreteMediaItem)initWithCoder:(id)a3;
- (MPConcreteMediaItem)initWithPersistentID:(unint64_t)a3;
- (MPConcreteMediaItem)initWithPersistentID:(unint64_t)a3 library:(id)a4;
- (id)_initWithPersistentID:(unint64_t)a3 library:(id)a4 propertiesCache:(id)a5;
- (id)_nonBatchableOrCachedValueForProperty:(id)a3 needsFetch:(BOOL *)a4;
- (id)_tokenBinaryIdentifierAsString;
- (id)cachedValueForProperty:(id)a3 isCached:(BOOL *)a4;
- (id)description;
- (id)mediaLibrary;
- (id)valueForProperty:(id)a3;
- (id)valuesForProperties:(id)a3;
- (unint64_t)persistentID;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4;
- (void)incrementPlayCount;
- (void)invalidateCachedProperties;
- (void)setValue:(id)a3 forProperty:(id)a4 withCompletionBlock:(id)a5;
@end

@implementation MPConcreteMediaItem

- (id)valueForProperty:(id)a3
{
  id v4 = a3;
  char v20 = 1;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__21447;
  v18 = __Block_byref_object_dispose__21448;
  id v19 = [(MPConcreteMediaItem *)self _nonBatchableOrCachedValueForProperty:v4 needsFetch:&v20];
  if (v20)
  {
    v5 = [(MPMediaLibrary *)self->_library libraryDataProvider];
    v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    unint64_t v7 = [(MPConcreteMediaItem *)self persistentID];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__MPConcreteMediaItem_valueForProperty___block_invoke;
    v10[3] = &unk_1E57F1358;
    v13 = &v14;
    id v11 = v4;
    v12 = self;
    [v5 loadProperties:v6 ofItemWithIdentifier:v7 completionBlock:v10];

    id v8 = (id)v15[5];
  }
  else
  {
    id v8 = (id)v15[5];
  }
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (id)_nonBatchableOrCachedValueForProperty:(id)a3 needsFetch:(BOOL *)a4
{
  v6 = (__CFString *)a3;
  unint64_t v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  if ([(__CFString *)v6 isEqualToString:@"persistentID"])
  {
    id v8 = [NSNumber numberWithUnsignedLongLong:self->_persistentID];
    goto LABEL_24;
  }
  char v18 = 0;
  v9 = [(MPConcreteMediaEntityPropertiesCache *)self->_propertiesCache valueForProperty:v7 isCached:&v18];
  v10 = v9;
  if (!v18)
  {
    if (v7 == @"artwork"
      || (uint64_t v11 = [(__CFString *)v7 hash], v11 == __MPMediaItemPropertyArtworkHash)
      && [(__CFString *)v7 isEqualToString:@"artwork"])
    {
      v12 = [(MPMediaItem *)self artworkCatalog];
      if (v12)
      {
        v13 = [[MPConcreteMediaItemArtwork alloc] initWithArtworkCatalog:v12];
LABEL_17:
        id v8 = v13;
LABEL_19:

        goto LABEL_23;
      }
    }
    else
    {
      if (v7 != @"playbackStoreID")
      {
        uint64_t v14 = [(__CFString *)v7 hash];
        if (v14 != __MPMediaItemPropertyPlaybackStoreIDHash
          || ![(__CFString *)v7 isEqualToString:@"playbackStoreID"])
        {
          if (a4)
          {
            uint64_t v16 = [(MPMediaLibrary *)self->_library libraryDataProvider];
            *a4 = v16 != 0;
          }
          id v8 = 0;
          goto LABEL_23;
        }
      }
      v15 = [(MPConcreteMediaItem *)self valueForProperty:@"subscriptionStoreItemAdamID"];
      v12 = v15;
      if (v15)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v15, "longLongValue"));
        v13 = (MPConcreteMediaItemArtwork *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    id v8 = 0;
    goto LABEL_19;
  }
  id v8 = v9;
LABEL_23:

LABEL_24:

  return v8;
}

- (unint64_t)persistentID
{
  return self->_persistentID;
}

uint64_t __40__MPConcreteMediaItem_valueForProperty___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 objectForKey:a1[4]];
  uint64_t v4 = *(void *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = a1[4];
  unint64_t v7 = *(void **)(a1[5] + 40);
  uint64_t v8 = *(void *)(*(void *)(a1[6] + 8) + 40);

  return [v7 cacheValue:v8 forProperty:v6 persistValueInBackgroundBlock:0];
}

void __43__MPConcreteMediaItem_valuesForProperties___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 40) cachePropertyValues:v3 forProperties:*(void *)(a1 + 40) persistValueInBackgroundBlock:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v10 = objc_msgSend(v3, "objectForKey:", v9, (void)v11);
        if (v10) {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v10 forKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utilitySerialQueue, 0);
  objc_storeStrong((id *)&self->_propertiesCache, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

- (void)dealloc
{
  id v3 = [(MPMediaLibrary *)self->_library libraryDataProvider];
  id v4 = [v3 entityCache];
  objc_msgSend(v4, "removeEntityWithIdentifier:dataProviderEntityClass:", self->_persistentID, -[MPConcreteMediaEntityPropertiesCache dataProviderEntityClass](self->_propertiesCache, "dataProviderEntityClass"));

  v5.receiver = self;
  v5.super_class = (Class)MPConcreteMediaItem;
  [(MPConcreteMediaItem *)&v5 dealloc];
}

+ (id)concreteMediaItemWithPersistentID:(unint64_t)a3 library:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 libraryDataProvider];
  uint64_t v7 = [v6 entityCache];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__MPConcreteMediaItem_concreteMediaItemWithPersistentID_library___block_invoke;
  v11[3] = &unk_1E57F1328;
  id v12 = v5;
  unint64_t v13 = a3;
  id v8 = v5;
  uint64_t v9 = [v7 itemWithIdentifier:a3 loadEntityBlock:v11];

  return v9;
}

id __65__MPConcreteMediaItem_concreteMediaItemWithPersistentID_library___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[MPConcreteMediaItem alloc] _initWithPersistentID:*(void *)(a1 + 40) library:*(void *)(a1 + 32) propertiesCache:v3];

  return v4;
}

- (id)_initWithPersistentID:(unint64_t)a3 library:(id)a4 propertiesCache:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPConcreteMediaItem;
  long long v11 = [(MPConcreteMediaItem *)&v16 init];
  if (v11)
  {
    id v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.MediaPlayer.MPConcreteMediaItem.utilitySerialQueue", v12);
    utilitySerialQueue = v11->_utilitySerialQueue;
    v11->_utilitySerialQueue = (OS_dispatch_queue *)v13;

    v11->_persistentID = a3;
    objc_storeStrong((id *)&v11->_library, a4);
    objc_storeStrong((id *)&v11->_propertiesCache, a5);
    if (_initWithPersistentID_library_propertiesCache__onceToken != -1) {
      dispatch_once(&_initWithPersistentID_library_propertiesCache__onceToken, &__block_literal_global_21504);
    }
  }

  return v11;
}

- (BOOL)existsInLibrary
{
  return [(MPMediaLibrary *)self->_library itemExistsWithPersistentID:self->_persistentID];
}

- (id)mediaLibrary
{
  return self->_library;
}

- (id)cachedValueForProperty:(id)a3 isCached:(BOOL *)a4
{
  return [(MPConcreteMediaEntityPropertiesCache *)self->_propertiesCache valueForProperty:a3 isCached:a4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

uint64_t __69__MPConcreteMediaItem__initWithPersistentID_library_propertiesCache___block_invoke()
{
  __MPMediaItemPropertyArtworkHash = [@"artwork" hash];
  uint64_t result = [@"playbackStoreID" hash];
  __MPMediaItemPropertyPlaybackStoreIDHash = result;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    objc_msgSend(v4, "encodeInt64:forKey:", -[MPConcreteMediaItem persistentID](self, "persistentID"), @"MPPersistentID");
    [v4 encodeObject:self->_library forKey:@"MPLibrary"];
  }
  else
  {
    unint64_t v5 = [(MPConcreteMediaItem *)self persistentID];
    [v4 encodeValueOfObjCType:"Q" at:&v5];
  }
}

- (id)valuesForProperties:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__21447;
  v29 = __Block_byref_object_dispose__21448;
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        char v20 = 0;
        uint64_t v11 = [(MPConcreteMediaItem *)self _nonBatchableOrCachedValueForProperty:v10 needsFetch:&v20];
        id v12 = (void *)v11;
        if (v20)
        {
          if (!v6)
          {
            uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
          }
          [v6 addObject:v10];
        }
        else if (v11)
        {
          [(id)v26[5] setObject:v11 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v7);
  }

  if ([v6 count])
  {
    dispatch_queue_t v13 = [(MPMediaLibrary *)self->_library libraryDataProvider];
    unint64_t v14 = [(MPConcreteMediaItem *)self persistentID];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __43__MPConcreteMediaItem_valuesForProperties___block_invoke;
    v17[3] = &unk_1E57F1358;
    v17[4] = self;
    id v18 = v6;
    id v19 = &v25;
    [v13 loadProperties:v18 ofItemWithIdentifier:v14 completionBlock:v17];
  }
  id v15 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v15;
}

- (void)incrementPlayCount
{
  library = self->_library;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__MPConcreteMediaItem_incrementPlayCount__block_invoke;
  v3[3] = &unk_1E57F1CF0;
  v3[4] = self;
  [(MPMediaLibrary *)library performTransactionWithBlock:v3];
}

uint64_t __41__MPConcreteMediaItem_incrementPlayCount__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPlayCount:", objc_msgSend(*(id *)(a1 + 32), "playCount") + 1);
  objc_msgSend(*(id *)(a1 + 32), "setPlayCountSinceSync:", objc_msgSend(*(id *)(a1 + 32), "playCountSinceSync") + 1);
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [*(id *)(a1 + 32) setLastPlayedDate:v2];

  return 1;
}

- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __63__MPConcreteMediaItem_enumerateValuesForProperties_usingBlock___block_invoke;
  v28[3] = &unk_1E57F13A8;
  v28[4] = self;
  id v9 = v8;
  id v29 = v9;
  id v10 = v7;
  id v30 = v10;
  v31 = &v32;
  [v6 enumerateObjectsUsingBlock:v28];
  if (!*((unsigned char *)v33 + 24) && [v9 count])
  {
    uint64_t v22 = 0;
    long long v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__21447;
    v26 = __Block_byref_object_dispose__21448;
    id v27 = 0;
    uint64_t v11 = [(MPMediaLibrary *)self->_library libraryDataProvider];
    unint64_t v12 = [(MPConcreteMediaItem *)self persistentID];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63__MPConcreteMediaItem_enumerateValuesForProperties_usingBlock___block_invoke_2;
    v19[3] = &unk_1E57F1358;
    v19[4] = self;
    id v13 = v9;
    id v20 = v13;
    long long v21 = &v22;
    [v11 loadProperties:v13 ofItemWithIdentifier:v12 completionBlock:v19];

    id v14 = (id)v23[5];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__MPConcreteMediaItem_enumerateValuesForProperties_usingBlock___block_invoke_3;
    v16[3] = &unk_1E57F13D0;
    id v18 = v10;
    id v15 = v14;
    id v17 = v15;
    [v13 enumerateObjectsUsingBlock:v16];

    _Block_object_dispose(&v22, 8);
  }

  _Block_object_dispose(&v32, 8);
}

void __63__MPConcreteMediaItem_enumerateValuesForProperties_usingBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  char v8 = 1;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 _nonBatchableOrCachedValueForProperty:v6 needsFetch:&v8];
  if (v8) {
    [*(id *)(a1 + 40) addObject:v6];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *a3;
}

void __63__MPConcreteMediaItem_enumerateValuesForProperties_usingBlock___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1[4] + 40) cachePropertyValues:v3 forProperties:a1[5] persistValueInBackgroundBlock:0];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __63__MPConcreteMediaItem_enumerateValuesForProperties_usingBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 objectForKey:v6];
  (*(void (**)(uint64_t, id, id, uint64_t))(v4 + 16))(v4, v6, v7, a3);
}

- (void)setValue:(id)a3 forProperty:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v11 = [(MPMediaLibrary *)self->_library libraryDataProvider];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    if ([(MPMediaLibrary *)self->_library isDeviceLibrary])
    {
      id v13 = [(MPConcreteMediaItem *)self valueForProperty:v9];
      char v14 = [v13 isEqual:v8];

      if (v14)
      {
        if (v10) {
          v10[2](v10, 1, 0);
        }
        goto LABEL_17;
      }
    }
    unint64_t v15 = [(MPConcreteMediaItem *)self persistentID];
    objc_super v16 = [(MPMediaLibrary *)self->_library libraryDataProvider];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __64__MPConcreteMediaItem_setValue_forProperty_withCompletionBlock___block_invoke;
    v22[3] = &unk_1E57F1380;
    id v17 = v16;
    id v23 = v17;
    unint64_t v25 = v15;
    id v18 = v10;
    id v24 = v18;
    id v19 = (void (**)(void, void, void))MEMORY[0x19971E0F0](v22);
    if (v18 && [(MPMediaLibrary *)self->_library isCurrentThreadInTransaction])
    {
      propertiesCache = self->_propertiesCache;
      if (propertiesCache) {
        [(MPConcreteMediaEntityPropertiesCache *)propertiesCache cacheValue:v8 forProperty:v9 persistValueInBackgroundBlock:0];
      }
    }
    else
    {
      long long v21 = self->_propertiesCache;
      if (v21)
      {
        [(MPConcreteMediaEntityPropertiesCache *)v21 cacheValue:v8 forProperty:v9 persistValueInBackgroundBlock:v19];
LABEL_16:

        goto LABEL_17;
      }
    }
    ((void (**)(void, id, id))v19)[2](v19, v8, v9);
    goto LABEL_16;
  }
  if (v10) {
    v10[2](v10, 0, 0);
  }
LABEL_17:
}

uint64_t __64__MPConcreteMediaItem_setValue_forProperty_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a2 forProperty:a3 ofItemWithIdentifier:*(void *)(a1 + 48) completionBlock:*(void *)(a1 + 40)];
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__MPConcreteMediaItem_setValue_forProperty___block_invoke;
  v11[3] = &unk_1E57F14E8;
  id v9 = v8;
  char v12 = v9;
  id v13 = &v14;
  [(MPConcreteMediaItem *)self setValue:v6 forProperty:v7 withCompletionBlock:v11];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

intptr_t __44__MPConcreteMediaItem_setValue_forProperty___block_invoke(uint64_t a1, char a2)
{
  intptr_t result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return result;
}

- (id)_tokenBinaryIdentifierAsString
{
  v2 = (void *)MEMORY[0x1E4F79B50];
  unint64_t persistentID = self->_persistentID;
  uint64_t v4 = [(MPMediaLibrary *)self->_library ml3Library];
  id v5 = [v4 libraryUID];
  id v6 = [v2 URLForEntityWithPersistentID:persistentID libraryUID:v5];
  id v7 = [v6 absoluteString];

  return v7;
}

- (MPConcreteMediaItem)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPLibrary"];
  if (v5)
  {
    +[MPConcreteMediaItem concreteMediaItemWithPersistentID:library:](MPConcreteMediaItem, "concreteMediaItemWithPersistentID:library:", [v4 decodeInt64ForKey:@"MPPersistentID"], v5);
    id v6 = (MPConcreteMediaItem *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)MPConcreteMediaItem;
  id v3 = [(MPConcreteMediaItem *)&v6 description];
  id v4 = objc_msgSend(v3, "stringByAppendingFormat:", @" %llu", self->_persistentID);

  return v4;
}

- (void)invalidateCachedProperties
{
}

- (MPConcreteMediaEntityPropertiesCache)cachedPropertyValues
{
  return self->_propertiesCache;
}

- (MPConcreteMediaItem)initWithPersistentID:(unint64_t)a3 library:(id)a4
{
  id v5 = +[MPConcreteMediaItem concreteMediaItemWithPersistentID:a3 library:a4];

  return v5;
}

- (MPConcreteMediaItem)initWithPersistentID:(unint64_t)a3
{
  id v4 = +[MPConcreteMediaItem concreteMediaItemWithPersistentID:a3];

  return v4;
}

- (MPConcreteMediaItem)init
{
  return 0;
}

+ (id)createUncachedConcreteMediaItemWithPersistentID:(unint64_t)a3 library:(id)a4
{
  id v5 = a4;
  id v6 = [[MPConcreteMediaItem alloc] _initWithPersistentID:a3 library:v5 propertiesCache:0];

  return v6;
}

+ (id)concreteMediaItemWithPersistentID:(unint64_t)a3
{
  id v4 = +[MPMediaLibrary defaultMediaLibrary];
  id v5 = +[MPConcreteMediaItem concreteMediaItemWithPersistentID:a3 library:v4];

  return v5;
}

@end