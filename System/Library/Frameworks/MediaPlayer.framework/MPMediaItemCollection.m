@interface MPMediaItemCollection
+ (BOOL)supportsSecureCoding;
+ (MPMediaItemCollection)collectionWithItems:(NSArray *)items;
+ (id)artworkCatalogCachePropertiesForGroupingType:(int64_t)a3;
+ (id)representativePersistentIDPropertyForGroupingType:(int64_t)a3;
+ (id)sortTitlePropertyForGroupingType:(int64_t)a3;
+ (id)titlePropertyForGroupingType:(int64_t)a3;
- (BOOL)MPSD_hasDownloadingItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (MPMediaItem)representativeItem;
- (MPMediaItemCollection)init;
- (MPMediaItemCollection)initWithCoder:(id)a3;
- (MPMediaItemCollection)initWithItems:(NSArray *)items;
- (MPMediaItemCollection)initWithItemsQuery:(id)a3;
- (MPMediaItemCollection)initWithMultiverseIdentifier:(id)a3 library:(id)a4;
- (MPMediaType)mediaTypes;
- (NSArray)items;
- (NSUInteger)count;
- (id)_artworkCatalogRepresentativeItem;
- (id)albumArtistArtworkCatalog;
- (id)artistArtworkCatalog;
- (id)artworkCatalog;
- (id)itemsQuery;
- (id)multiverseIdentifier;
- (int64_t)groupingType;
- (unint64_t)hash;
- (void)_enumerateItemPersistentIDsUsingBlock:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setValue:(id)a3 forProperty:(id)a4 withCompletionBlock:(id)a5;
- (void)setValuesForProperties:(id)a3 trackList:(id)a4 withCompletionBlock:(id)a5;
@end

@implementation MPMediaItemCollection

- (MPMediaItemCollection)initWithItems:(NSArray *)items
{
  v4 = items;
  v11.receiver = self;
  v11.super_class = (Class)MPMediaItemCollection;
  v5 = [(MPMediaItemCollection *)&v11 init];
  if (v5)
  {
    v5->_itemsCount = [(NSArray *)v4 count];
    uint64_t v6 = [(NSArray *)v4 copy];
    v7 = v5->_items;
    v5->_items = (NSArray *)v6;

    uint64_t v8 = [(NSArray *)v5->_items firstObject];
    representativeItem = v5->_representativeItem;
    v5->_representativeItem = (MPMediaItem *)v8;
  }
  return v5;
}

+ (id)representativePersistentIDPropertyForGroupingType:(int64_t)a3
{
  if (representativePersistentIDPropertyForGroupingType__once != -1) {
    dispatch_once(&representativePersistentIDPropertyForGroupingType__once, &__block_literal_global_216_17019);
  }
  CFDictionaryRef v4 = (const __CFDictionary *)representativePersistentIDPropertyForGroupingType__groupingTypeToRepresentativePersistentIDProperty;

  return (id)CFDictionaryGetValue(v4, (const void *)a3);
}

- (MPMediaType)mediaTypes
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(MPMediaItemCollection *)self items];
  CFDictionaryRef v4 = v3;
  if (!self->_initializedContainedMediaTypes && [v3 count])
  {
    self->_MPMediaType containedMediaTypes = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) valueForProperty:@"mediaType"];
          self->_containedMediaTypes |= [v10 unsignedIntegerValue];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    self->_initializedContainedMediaTypes = 1;
  }
  MPMediaType containedMediaTypes = self->_containedMediaTypes;

  return containedMediaTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representativeItem, 0);
  objc_storeStrong((id *)&self->_itemsQuery, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

- (void)_enumerateItemPersistentIDsUsingBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v4 = (void (**)(id, uint64_t, unsigned char *))a3;
  char v15 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_items;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v12 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "persistentID", (void)v11);
      if (v10) {
        v4[2](v4, v10, &v15);
      }
      if (v15) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)setValuesForProperties:(id)a3 trackList:(id)a4 withCompletionBlock:(id)a5
{
  id v9 = a5;
  uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"MPMediaItemCollection.m" lineNumber:408 description:@"subclass must implement"];

  uint64_t v8 = v9;
  if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    uint64_t v8 = v9;
  }
}

- (void)setValue:(id)a3 forProperty:(id)a4 withCompletionBlock:(id)a5
{
  id v9 = a5;
  uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"MPMediaItemCollection.m" lineNumber:403 description:@"subclass must implement"];

  uint64_t v8 = v9;
  if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    uint64_t v8 = v9;
  }
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"MPMediaItemCollection.m" lineNumber:398 description:@"subclass must implement"];

  return 0;
}

- (id)multiverseIdentifier
{
  v3 = [(MPMediaEntity *)self mediaLibrary];
  CFDictionaryRef v4 = objc_msgSend(v3, "multiverseIdentifierForCollectionWithPersistentID:groupingType:", -[MPMediaEntity persistentID](self, "persistentID"), -[MPMediaItemCollection groupingType](self, "groupingType"));

  return v4;
}

- (int64_t)groupingType
{
  return 0;
}

- (NSUInteger)count
{
  return self->_itemsCount;
}

- (MPMediaItem)representativeItem
{
  return self->_representativeItem;
}

- (NSArray)items
{
  return self->_items;
}

- (id)itemsQuery
{
  return self->_itemsQuery;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (([v6 allowsKeyedCoding] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MPMediaItemCollection.m" lineNumber:195 description:@"only keyed coding is supported"];
  }
  [v6 encodeInteger:self->_itemsCount forKey:@"MPItemsCount"];
  [v6 encodeObject:self->_representativeItem forKey:@"MPRepresentativeItem"];
  [v6 encodeInteger:self->_containedMediaTypes forKey:@"MPContainedMediaTypes"];
  [v6 encodeBool:self->_initializedContainedMediaTypes forKey:@"MPInitializedContainedMediaTypes"];
  [v6 encodeObject:self->_items forKey:@"MPItems"];
  [v6 encodeObject:self->_itemsQuery forKey:@"MPMediaItemsQuery"];
}

- (MPMediaItemCollection)initWithCoder:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"MPMediaItemCollection.m" lineNumber:164 description:@"only keyed coding is supported"];
  }
  id v6 = MSVPropertyListDataClasses();
  uint64_t v7 = [v6 setByAddingObject:objc_opt_class()];
  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"MPItems"];

  id v9 = [(MPMediaItemCollection *)self initWithItems:v8];
  if (v9)
  {
    v9->_itemsCount = [v5 decodeIntegerForKey:@"MPItemsCount"];
    uint64_t v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"MPRepresentativeItem"];
    representativeItem = v9->_representativeItem;
    v9->_representativeItem = (MPMediaItem *)v10;

    v9->_MPMediaType containedMediaTypes = [v5 decodeIntegerForKey:@"MPContainedMediaTypes"];
    v9->_initializedContainedMediaTypes = [v5 decodeBoolForKey:@"MPInitializedContainedMediaTypes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v12 = v9->_items;
      uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v23;
        while (2)
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_15;
            }
            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
LABEL_15:
      items = v9->_items;
      v9->_items = 0;
    }
    uint64_t v18 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"MPMediaItemsQuery"];
    itemsQuery = v9->_itemsQuery;
    v9->_itemsQuery = (MPMediaQuery *)v18;
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CFDictionaryRef v4 = (MPMediaItemCollection *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (-[NSArray count](self->_items, "count") || [v5[5] count])
      {
        unsigned __int8 v6 = [(NSArray *)self->_items isEqual:v5[5]];
      }
      else
      {
        v9.receiver = self;
        v9.super_class = (Class)MPMediaItemCollection;
        unsigned __int8 v6 = [(MPMediaEntity *)&v9 isEqual:v5];
      }
      BOOL v7 = v6;
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)MPMediaItemCollection;
  unint64_t v3 = [(MPMediaEntity *)&v5 hash];
  return [(NSArray *)self->_items hash] ^ v3;
}

- (MPMediaItemCollection)init
{
  [MEMORY[0x1E4F1CA00] raise:@"MPMediaItemCollectionInitException", @"-init is not supported, use -initWithItems:" format];

  return [(MPMediaItemCollection *)self initWithItemsQuery:0];
}

- (MPMediaItemCollection)initWithMultiverseIdentifier:(id)a3 library:(id)a4
{
  unsigned __int8 v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"MPMediaItemCollection.m" lineNumber:138 description:@"subclass must implement"];

  return [(MPMediaItemCollection *)self initWithItemsQuery:0];
}

- (MPMediaItemCollection)initWithItemsQuery:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 items];
  unsigned __int8 v6 = [(MPMediaItemCollection *)self initWithItems:v5];
  if (v6)
  {
    uint64_t v7 = [v4 copy];
    itemsQuery = v6->_itemsQuery;
    v6->_itemsQuery = (MPMediaQuery *)v7;
  }
  return v6;
}

CFDictionaryRef __75__MPMediaItemCollection_representativePersistentIDPropertyForGroupingType___block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v10 = xmmword_19568ABF8;
  long long v11 = unk_19568AC08;
  long long v12 = xmmword_19568AC18;
  long long v6 = xmmword_19568ABB8;
  long long v7 = unk_19568ABC8;
  long long v8 = xmmword_19568ABD8;
  long long v9 = unk_19568ABE8;
  *(_OWORD *)keys = xmmword_19568AB78;
  long long v3 = unk_19568AB88;
  long long v4 = xmmword_19568AB98;
  long long v5 = unk_19568ABA8;
  v1[0] = @"persistentID";
  v1[1] = @"persistentID";
  v1[2] = @"albumRepresentativeItemPersistentID";
  v1[3] = @"albumRepresentativeItemPersistentID";
  v1[4] = @"albumRepresentativeItemPersistentID";
  v1[5] = @"albumRepresentativeItemPersistentID";
  v1[6] = @"artistRepresentativeItemPersistentID";
  v1[7] = @"albumArtistRepresentativeItemPersistentID";
  v1[8] = @"albumArtistRepresentativeItemPersistentID";
  v1[9] = @"albumArtistRepresentativeItemPersistentID";
  v1[10] = @"composerRepresentativeItemPersistentID";
  v1[11] = @"composerRepresentativeItemPersistentID";
  v1[12] = @"composerRepresentativeItemPersistentID";
  v1[13] = @"genreRepresentativeItemPersistentID";
  v1[14] = @"genreRepresentativeItemPersistentID";
  v1[15] = @"genreRepresentativeItemPersistentID";
  v1[16] = @"albumRepresentativeItemPersistentID";
  v1[17] = @"artistRepresentativeItemPersistentID";
  v1[18] = @"albumRepresentativeItemPersistentID";
  v1[19] = @"albumRepresentativeItemPersistentID";
  v1[20] = @"albumRepresentativeItemPersistentID";
  v1[21] = @"albumRepresentativeItemPersistentID";
  CFDictionaryRef result = CFDictionaryCreate(0, (const void **)keys, v1, 22, 0, 0);
  representativePersistentIDPropertyForGroupingType__groupingTypeToRepresentativePersistentIDProperty = (uint64_t)result;
  return result;
}

+ (id)sortTitlePropertyForGroupingType:(int64_t)a3
{
  if (sortTitlePropertyForGroupingType__once != -1) {
    dispatch_once(&sortTitlePropertyForGroupingType__once, &__block_literal_global_213);
  }
  CFDictionaryRef v4 = (const __CFDictionary *)sortTitlePropertyForGroupingType__groupingTypeToSortTitleProperty;

  return (id)CFDictionaryGetValue(v4, (const void *)a3);
}

CFDictionaryRef __58__MPMediaItemCollection_sortTitlePropertyForGroupingType___block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  long long v4 = xmmword_19568AB38;
  long long v5 = unk_19568AB48;
  long long v6 = xmmword_19568AB58;
  long long v7 = unk_19568AB68;
  *(_OWORD *)keys = xmmword_19568AB18;
  long long v3 = unk_19568AB28;
  v1[2] = xmmword_1E57F0A28;
  v1[3] = *(_OWORD *)&off_1E57F0A38;
  v1[4] = xmmword_1E57F0A48;
  v1[5] = *(_OWORD *)off_1E57F0A58;
  v1[0] = xmmword_1E57F0A08;
  v1[1] = *(_OWORD *)&off_1E57F0A18;
  CFDictionaryRef result = CFDictionaryCreate(0, (const void **)keys, (const void **)v1, 12, 0, 0);
  sortTitlePropertyForGroupingType__groupingTypeToSortTitleProperty = (uint64_t)result;
  return result;
}

+ (id)titlePropertyForGroupingType:(int64_t)a3
{
  if (titlePropertyForGroupingType__once != -1) {
    dispatch_once(&titlePropertyForGroupingType__once, &__block_literal_global_17021);
  }
  CFDictionaryRef v4 = (const __CFDictionary *)titlePropertyForGroupingType__groupingTypeToTitleProperty;

  return (id)CFDictionaryGetValue(v4, (const void *)a3);
}

CFDictionaryRef __54__MPMediaItemCollection_titlePropertyForGroupingType___block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  keys[4] = xmmword_19568AAD0;
  keys[5] = unk_19568AAE0;
  keys[6] = xmmword_19568AAF0;
  keys[7] = unk_19568AB00;
  keys[0] = xmmword_19568AA90;
  keys[1] = unk_19568AAA0;
  keys[2] = xmmword_19568AAB0;
  keys[3] = unk_19568AAC0;
  uint64_t v3 = 10;
  values[0] = @"albumName";
  values[1] = @"albumArtistName";
  values[2] = @"albumArtistName";
  values[3] = @"albumArtistName";
  values[4] = @"albumName";
  values[5] = @"albumName";
  values[6] = @"albumName";
  values[7] = @"artistName";
  values[8] = @"composerName";
  values[9] = @"composerName";
  values[10] = @"composerName";
  values[11] = @"genreName";
  values[12] = @"genreName";
  values[13] = @"genreName";
  values[14] = @"name";
  values[15] = @"albumName";
  values[16] = @"albumName";
  CFDictionaryRef result = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 17, 0, 0);
  titlePropertyForGroupingType__groupingTypeToTitleProperty = (uint64_t)result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MPMediaItemCollection)collectionWithItems:(NSArray *)items
{
  uint64_t v3 = items;
  uint64_t v4 = [[MPMediaItemCollection alloc] initWithItems:v3];

  return v4;
}

- (id)_artworkCatalogRepresentativeItem
{
  uint64_t v3 = +[MPMediaItemCollection representativePersistentIDPropertyForGroupingType:[(MPMediaItemCollection *)self groupingType]];
  if (v3)
  {
    uint64_t v4 = [(MPMediaEntity *)self valueForProperty:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [v4 longLongValue];
  if (!v5
    || (uint64_t v6 = v5,
        [(MPMediaEntity *)self mediaLibrary],
        long long v7 = objc_claimAutoreleasedReturnValue(),
        [v7 itemWithPersistentID:v6 verifyExistence:0],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    uint64_t v8 = [(MPMediaItemCollection *)self representativeItem];
  }

  return v8;
}

- (id)artistArtworkCatalog
{
  if ([(MPMediaItemCollection *)self groupingType] == 2)
  {
    uint64_t v3 = [(MPMediaItemCollection *)self _artworkCatalogRepresentativeItem];
    uint64_t v4 = [MPMediaLibraryArtworkRequest alloc];
    uint64_t v5 = [(MPMediaEntity *)self mediaLibrary];
    uint64_t v6 = -[MPMediaLibraryArtworkRequest initWithLibrary:identifier:entityType:artworkType:](v4, "initWithLibrary:identifier:entityType:artworkType:", v5, [v3 artistPersistentID], 2, 4);

    long long v7 = [MPArtworkCatalog alloc];
    uint64_t v8 = [(MPMediaEntity *)self mediaLibrary];
    long long v9 = [v8 artworkDataSource];
    long long v10 = [(MPArtworkCatalog *)v7 initWithToken:v6 dataSource:v9];

    long long v11 = [(MPMediaEntity *)self mediaLibrary];
    long long v12 = [v11 artworkDataSource];
    LODWORD(v9) = [v12 areRepresentationsAvailableForCatalog:v10];

    if (v9) {
      uint64_t v13 = v10;
    }
    else {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)albumArtistArtworkCatalog
{
  if ([(MPMediaItemCollection *)self groupingType] == 3)
  {
    uint64_t v3 = [(MPMediaItemCollection *)self _artworkCatalogRepresentativeItem];
    uint64_t v4 = [MPMediaLibraryArtworkRequest alloc];
    uint64_t v5 = [(MPMediaEntity *)self mediaLibrary];
    uint64_t v6 = -[MPMediaLibraryArtworkRequest initWithLibrary:identifier:entityType:artworkType:](v4, "initWithLibrary:identifier:entityType:artworkType:", v5, [v3 albumArtistPersistentID], 7, 4);

    long long v7 = [MPArtworkCatalog alloc];
    uint64_t v8 = [(MPMediaEntity *)self mediaLibrary];
    long long v9 = [v8 artworkDataSource];
    long long v10 = [(MPArtworkCatalog *)v7 initWithToken:v6 dataSource:v9];

    long long v11 = [(MPMediaEntity *)self mediaLibrary];
    long long v12 = [v11 artworkDataSource];
    LODWORD(v9) = [v12 areRepresentationsAvailableForCatalog:v10];

    if (v9) {
      uint64_t v13 = v10;
    }
    else {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)artworkCatalog
{
  int64_t v3 = [(MPMediaItemCollection *)self groupingType];
  if (v3 == 2)
  {
    uint64_t v4 = [(MPMediaItemCollection *)self artistArtworkCatalog];
LABEL_5:
    uint64_t v5 = (void *)v4;
    if (v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v3 == 3)
  {
    uint64_t v4 = [(MPMediaItemCollection *)self albumArtistArtworkCatalog];
    goto LABEL_5;
  }
LABEL_6:
  uint64_t v6 = [(MPMediaItemCollection *)self _artworkCatalogRepresentativeItem];
  long long v7 = [(id)objc_opt_class() artworkCatalogCacheProperties];
  id v8 = (id)[v6 valuesForProperties:v7];

  uint64_t v5 = [v6 artworkCatalog];

LABEL_7:

  return v5;
}

+ (id)artworkCatalogCachePropertiesForGroupingType:(int64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v5 = +[MPMediaItemCollection representativePersistentIDPropertyForGroupingType:a3];
  if (v5) {
    [v4 addObject:v5];
  }

  return v4;
}

- (BOOL)MPSD_hasDownloadingItem
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(MPMediaItemCollection *)self itemsQuery];
  id v4 = v3;
  if (v3)
  {
    char v5 = objc_msgSend(v3, "MPSD_hasDownloadingEntities");
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [(MPMediaItemCollection *)self items];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "MPSD_isDownloadInProgress"))
          {

            char v5 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    char v5 = 0;
  }
LABEL_13:

  return v5;
}

@end