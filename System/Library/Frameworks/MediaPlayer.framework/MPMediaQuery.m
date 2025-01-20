@interface MPMediaQuery
+ (BOOL)isFilteringDisabled;
+ (BOOL)supportsSecureCoding;
+ (MPMediaQuery)albumsQuery;
+ (MPMediaQuery)artistsQuery;
+ (MPMediaQuery)audiobooksQuery;
+ (MPMediaQuery)compilationsQuery;
+ (MPMediaQuery)composersQuery;
+ (MPMediaQuery)genresQuery;
+ (MPMediaQuery)playlistsQuery;
+ (MPMediaQuery)podcastsQuery;
+ (MPMediaQuery)songsQuery;
+ (id)ITunesUAudioQuery;
+ (id)ITunesUQuery;
+ (id)activeGeniusPlaylist;
+ (id)albumArtistsQuery;
+ (id)audibleAudiobooksQuery;
+ (id)audioPodcastsQuery;
+ (id)currentDevicePurchasesPlaylist;
+ (id)favoriteSongsPlaylist;
+ (id)geniusMixesQuery;
+ (id)homeVideosQuery;
+ (id)movieRentalsQuery;
+ (id)moviesQuery;
+ (id)musicVideosQuery;
+ (id)playbackHistoryPlaylist;
+ (id)playlistsRecentlyAddedQuery;
+ (id)tvShowsQuery;
+ (id)videoITunesUQuery;
+ (id)videoPodcastsQuery;
+ (id)videosQuery;
+ (void)initFilteringDisabled;
+ (void)initialize;
+ (void)setFilteringDisabled:(BOOL)a3;
- (BOOL)MPSD_hasDownloadableEntities;
- (BOOL)MPSD_hasDownloadingEntities;
- (BOOL)_hasCollections;
- (BOOL)_hasItems;
- (BOOL)_hasStaticEntities;
- (BOOL)_isFilteringDisabled;
- (BOOL)_updatePredicateForProperty:(id)a3 withPropertyPredicate:(id)a4;
- (BOOL)excludesEntitiesWithBlankNames;
- (BOOL)ignoreRestrictionsPredicates;
- (BOOL)ignoreSystemFilterPredicates;
- (BOOL)includeEntitiesWithBlankNames;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaylistItemsQuery;
- (BOOL)shouldIncludeNonLibraryEntities;
- (BOOL)sortItems;
- (BOOL)specifiesPlaylistItems;
- (BOOL)useSections;
- (BOOL)willGroupEntities;
- (MPMediaGrouping)groupingType;
- (MPMediaItemCollection)_representativeCollection;
- (MPMediaItemCollection)collectionByJoiningCollections;
- (MPMediaLibrary)mediaLibrary;
- (MPMediaPlaylist)containingPlaylist;
- (MPMediaQuery)init;
- (MPMediaQuery)initWithCoder:(id)a3;
- (MPMediaQuery)initWithCriteria:(id)a3 library:(id)a4;
- (MPMediaQuery)initWithEntities:(id)a3 entityType:(int64_t)a4;
- (MPMediaQuery)initWithFilterPredicates:(NSSet *)filterPredicates;
- (MPMediaQuery)initWithFilterPredicates:(id)a3 library:(id)a4;
- (MPMediaQuery)initWithProtobufferDecodableObject:(id)a3;
- (MPMediaQuery)initWithProtobufferDecodableObject:(id)a3 library:(id)a4;
- (MPMediaQuerySectionInfo)collectionSectionInfo;
- (MPMediaQuerySectionInfo)itemSectionInfo;
- (NSArray)_orderingProperties;
- (NSArray)collectionPersistentIdentifiers;
- (NSArray)collectionSections;
- (NSArray)collections;
- (NSArray)itemPersistentIdentifiers;
- (NSArray)itemSections;
- (NSArray)items;
- (NSDictionary)_orderingDirectionMappings;
- (NSSet)collectionPropertiesToFetch;
- (NSSet)filterPredicates;
- (NSSet)itemPropertiesToFetch;
- (NSString)description;
- (id)MPSD_mediaQueryForDownloadableEntities;
- (id)MPSD_mediaQueryForDownloadingEntities;
- (id)_valueForAggregateFunction:(id)a3 onProperty:(id)a4 entityType:(int64_t)a5;
- (id)copyByRemovingStaticEntities;
- (id)copyBySanitizingStaticEntities;
- (id)copyWithZone:(_NSZone *)a3;
- (id)criteria;
- (id)predicateForProperty:(id)a3;
- (id)protobufferEncodableObject;
- (id)protobufferEncodableObjectFromLibrary:(id)a3;
- (id)valueForAggregateFunction:(id)a3 onCollectionsForProperty:(id)a4;
- (id)valueForAggregateFunction:(id)a3 onItemsForProperty:(id)a4;
- (int64_t)_representativeCollectionGroupingType;
- (unint64_t)_countOfCollections;
- (unint64_t)_countOfItems;
- (unint64_t)_playlistItemPersistentIDForItemPersistentID:(unint64_t)a3;
- (unint64_t)entityLimit;
- (unint64_t)groupingThreshold;
- (unint64_t)hash;
- (void)_enumerateCollectionPersistentIDsInOrder:(BOOL)a3 usingBlock:(id)a4;
- (void)_enumerateCollectionPersistentIDsUsingBlock:(id)a3;
- (void)_enumerateCollectionsInOrder:(BOOL)a3 usingBlock:(id)a4;
- (void)_enumerateCollectionsUsingBlock:(id)a3;
- (void)_enumerateItemPersistentIDsInOrder:(BOOL)a3 usingBlock:(id)a4;
- (void)_enumerateItemPersistentIDsUsingBlock:(id)a3;
- (void)_enumerateItemsInOrder:(BOOL)a3 usingBlock:(id)a4;
- (void)_enumerateItemsUsingBlock:(id)a3;
- (void)_enumerateUnorderedCollectionPersistentIDsUsingBlock:(id)a3;
- (void)_enumerateUnorderedCollectionsUsingBlock:(id)a3;
- (void)_enumerateUnorderedItemPersistentIDsUsingBlock:(id)a3;
- (void)_enumerateUnorderedItemsUsingBlock:(id)a3;
- (void)_getRepresentativeCollectionGrouping:(int64_t *)a3 propertyPredicate:(id *)a4;
- (void)_setOrderingDirectionMappings:(id)a3;
- (void)_setOrderingProperties:(id)a3;
- (void)addFilterPredicate:(MPMediaPredicate *)predicate;
- (void)encodeWithCoder:(id)a3;
- (void)removeFilterPredicate:(MPMediaPredicate *)predicate;
- (void)removePredicatesForProperty:(id)a3;
- (void)setCollectionPropertiesToFetch:(id)a3;
- (void)setCriteria:(id)a3;
- (void)setEntityLimit:(unint64_t)a3;
- (void)setFilterPredicate:(id)a3 forProperty:(id)a4;
- (void)setFilterPredicates:(NSSet *)filterPredicates;
- (void)setFilterPropertyPredicate:(id)a3;
- (void)setGroupingType:(MPMediaGrouping)groupingType;
- (void)setIgnoreRestrictionsPredicates:(BOOL)a3;
- (void)setIgnoreSystemFilterPredicates:(BOOL)a3;
- (void)setIncludeEntitiesWithBlankNames:(BOOL)a3;
- (void)setItemPropertiesToFetch:(id)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setShouldIncludeNonLibraryEntities:(BOOL)a3;
- (void)setSortItems:(BOOL)a3;
- (void)setStaticEntities:(id)a3 entityType:(int64_t)a4;
- (void)setUseSections:(BOOL)a3;
@end

@implementation MPMediaQuery

uint64_t __35__MPMediaQuery_isFilteringDisabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = __filteringDisabled;
  return result;
}

- (void)setIgnoreRestrictionsPredicates:(BOOL)a3
{
  self->_criteria->_ignoreRestrictionsPredicates = a3;
}

- (void)setEntityLimit:(unint64_t)a3
{
  self->_criteria->_entityLimit = a3;
}

+ (id)movieRentalsQuery
{
  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ECE78 forProperty:@"mediaType"];
  v5 = [v3 setWithObject:v4];
  v6 = [(MPMediaQuery *)v2 initWithFilterPredicates:v5];

  v7 = +[MPMediaPropertyPredicate predicateWithValue:MEMORY[0x1E4F1CC38] forProperty:@"isRental"];
  [(MPMediaQuery *)v6 addFilterPredicate:v7];

  return v6;
}

+ (id)moviesQuery
{
  v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ECE78 forProperty:@"mediaType"];
  uint64_t v5 = MEMORY[0x1E4F1CC28];
  v6 = +[MPMediaPropertyPredicate predicateWithValue:MEMORY[0x1E4F1CC28] forProperty:@"isRental"];
  v7 = +[MPMediaPropertyPredicate predicateWithValue:v5 forProperty:@"isITunesU"];
  v8 = objc_msgSend(v3, "setWithObjects:", v4, v6, v7, 0);
  v9 = [(MPMediaQuery *)v2 initWithFilterPredicates:v8];

  return v9;
}

+ (BOOL)isFilteringDisabled
{
  +[MPMediaQuery initFilteringDisabled];
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MPMediaQuery_isFilteringDisabled__block_invoke;
  block[3] = &unk_1E57FA300;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)__filteringDisabledQueue, block);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)initFilteringDisabled
{
  if (initFilteringDisabled_onceToken != -1) {
    dispatch_once(&initFilteringDisabled_onceToken, &__block_literal_global_12475);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[MPMediaQuery allocWithZone:a3] initWithCriteria:self->_criteria library:self->_mediaLibrary];
  uint64_t v5 = [(NSArray *)self->_staticEntities copy];
  staticEntities = v4->_staticEntities;
  v4->_staticEntities = (NSArray *)v5;

  v4->_staticEntityType = self->_staticEntityType;
  return v4;
}

- (MPMediaQuery)initWithCriteria:(id)a3 library:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(MPMediaQuery *)self initWithFilterPredicates:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mediaLibrary, a4);
    uint64_t v10 = [v6 copy];
    criteria = v9->_criteria;
    v9->_criteria = (MPMediaQueryCriteria *)v10;
  }
  return v9;
}

- (MPMediaQuery)initWithFilterPredicates:(NSSet *)filterPredicates
{
  v4 = filterPredicates;
  v12.receiver = self;
  v12.super_class = (Class)MPMediaQuery;
  uint64_t v5 = [(MPMediaQuery *)&v12 init];
  if (v5)
  {
    uint64_t v6 = +[MPMediaLibrary defaultMediaLibrary];
    mediaLibrary = v5->_mediaLibrary;
    v5->_mediaLibrary = (MPMediaLibrary *)v6;

    v5->_isFilteringDisabled = -1;
    char v8 = objc_alloc_init(MPMediaQueryCriteria);
    v9 = v8;
    if (v4) {
      [(MPMediaQueryCriteria *)v8 setFilterPredicates:v4];
    }
    criteria = v5->_criteria;
    v5->_criteria = v9;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticEntities, 0);
  objc_storeStrong((id *)&self->_criteria, 0);

  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

- (NSArray)collections
{
  staticEntities = self->_staticEntities;
  if (staticEntities && self->_staticEntityType == 1)
  {
    v3 = staticEntities;
  }
  else
  {
    v3 = [(MPMediaLibrary *)self->_mediaLibrary _collectionsForQueryCriteria:self->_criteria];
  }

  return v3;
}

- (MPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (NSArray)items
{
  staticEntities = self->_staticEntities;
  if (staticEntities)
  {
    if (self->_staticEntityType)
    {
      v4 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v5 = self->_staticEntities;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __21__MPMediaQuery_items__block_invoke;
      v9[3] = &unk_1E57EF660;
      uint64_t v6 = v4;
      uint64_t v10 = v6;
      [(NSArray *)v5 enumerateObjectsUsingBlock:v9];

      goto LABEL_7;
    }
    id v7 = staticEntities;
  }
  else
  {
    id v7 = [(MPMediaLibrary *)self->_mediaLibrary _itemsForQueryCriteria:self->_criteria];
  }
  uint64_t v6 = v7;
LABEL_7:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __62__MPMediaQuery__enumerateItemPersistentIDsInOrder_usingBlock___block_invoke()
{
  return 0;
}

+ (void)initialize
{
}

- (MPMediaQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPMediaLibrary"];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  char v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"MPFilterPredicates"];

  uint64_t v10 = [(MPMediaQuery *)self initWithFilterPredicates:v9 library:v5];
  if (v10)
  {
    v10->_criteria->_groupingType = [v4 decodeIntegerForKey:@"MPGroupingType"];
    v10->_criteria->_ignoreSystemFilterPredicates = [v4 decodeBoolForKey:@"MPIgnoreSystemFilterPredicates"];
    v10->_criteria->_ignoreRestrictionsPredicates = [v4 decodeBoolForKey:@"MPIgnoreRestrictionsPredicates"];
    v10->_criteria->_includeNonLibraryEntities = [v4 decodeBoolForKey:@"MPIncludeNonLibraryEntities"];
    v10->_criteria->_includeEntitiesWithBlankNames = [v4 decodeBoolForKey:@"MPIncludeEntitiesWithBlankNames"];
    if ([v4 containsValueForKey:@"MPEntityOrder"])
    {
      v10->_criteria->_entityOrder = [v4 decodeIntegerForKey:@"MPEntityOrder"];
    }
    else
    {
      v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MLEntityOrder"];
      int v12 = [v11 isEqualToString:@"MLEntityOrderSorted"];
      uint64_t v13 = 1;
      if (v12) {
        uint64_t v13 = 2;
      }
      v10->_criteria->_entityOrder = v13;
    }
    v10->_isFilteringDisabled = [v4 decodeBoolForKey:@"MLIsFilteringDisabled"];
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"MPStaticEntities"];
    staticEntities = v10->_staticEntities;
    v10->_staticEntities = (NSArray *)v17;

    v10->_staticEntityType = [v4 decodeIntegerForKey:@"MPStaticEntityType"];
  }

  return v10;
}

- (MPMediaQuery)initWithFilterPredicates:(id)a3 library:(id)a4
{
  id v7 = a4;
  char v8 = [(MPMediaQuery *)self initWithFilterPredicates:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_mediaLibrary, a4);
  }

  return v9;
}

uint64_t __62__MPMediaQuery__enumerateItemPersistentIDsInOrder_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_hasStaticEntities
{
  return self->_staticEntities != 0;
}

- (void)_enumerateItemPersistentIDsUsingBlock:(id)a3
{
}

- (void)_enumerateItemPersistentIDsInOrder:(BOOL)a3 usingBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = self->_mediaLibrary;
  char v8 = [(MPMediaLibrary *)v7 libraryDataProvider];
  criteria = self->_criteria;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__MPMediaQuery__enumerateItemPersistentIDsInOrder_usingBlock___block_invoke_2;
  v11[3] = &unk_1E57EF728;
  id v12 = v6;
  id v10 = v6;
  [v8 enumerateItemIdentifiersForQueryCriteria:criteria ordered:v4 cancelBlock:&__block_literal_global_106 usingBlock:v11];
}

+ (id)favoriteSongsPlaylist
{
  char v2 = +[MPMediaLibrary deviceMediaLibrary];
  v3 = [v2 favoriteSongsPlaylist];

  return v3;
}

- (void)setMediaLibrary:(id)a3
{
  uint64_t v5 = (MPMediaLibrary *)a3;
  mediaLibrary = self->_mediaLibrary;
  p_mediaLibrary = &self->_mediaLibrary;
  if (mediaLibrary != v5)
  {
    char v8 = v5;
    objc_storeStrong((id *)p_mediaLibrary, a3);
    uint64_t v5 = v8;
  }
}

- (unint64_t)_countOfItems
{
  staticEntities = self->_staticEntities;
  if (staticEntities)
  {
    if (self->_staticEntityType)
    {
      uint64_t v9 = 0;
      id v10 = &v9;
      uint64_t v11 = 0x2020000000;
      uint64_t v12 = 0;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __29__MPMediaQuery__countOfItems__block_invoke;
      v8[3] = &unk_1E57EF6B0;
      v8[4] = &v9;
      [(NSArray *)staticEntities enumerateObjectsUsingBlock:v8];
      unint64_t v4 = v10[3];
      _Block_object_dispose(&v9, 8);
      return v4;
    }
    else
    {
      return [(NSArray *)staticEntities count];
    }
  }
  else
  {
    mediaLibrary = self->_mediaLibrary;
    criteria = self->_criteria;
    return [(MPMediaLibrary *)mediaLibrary _countOfItemsForQueryCriteria:criteria];
  }
}

- (unint64_t)_countOfCollections
{
  if (self->_staticEntities && self->_staticEntityType == 1) {
    return [(NSArray *)self->_staticEntities count];
  }
  else {
    return [(MPMediaLibrary *)self->_mediaLibrary _countOfCollectionsForQueryCriteria:self->_criteria];
  }
}

+ (MPMediaQuery)songsQuery
{
  char v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  unint64_t v4 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ECE48 forProperty:@"mediaType"];
  uint64_t v5 = objc_msgSend(v3, "setWithObjects:", v4, 0);
  id v6 = [(MPMediaQuery *)v2 initWithFilterPredicates:v5];

  [(MPMediaQuery *)v6 setSortItems:1];

  return v6;
}

- (void)setSortItems:(BOOL)a3
{
  if (a3) {
    unint64_t v4 = 2;
  }
  else {
    unint64_t v4 = 1;
  }
  criteria = self->_criteria;
  if (criteria->_entityOrder != v4)
  {
    id v6 = (MPMediaQueryCriteria *)[(MPMediaQueryCriteria *)criteria copy];
    id v7 = self->_criteria;
    self->_criteria = v6;

    self->_criteria->_entityOrder = v4;
  }
}

+ (MPMediaQuery)albumsQuery
{
  char v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  unint64_t v4 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ECE48 forProperty:@"mediaType"];
  uint64_t v5 = objc_msgSend(v3, "setWithObjects:", v4, 0);
  id v6 = [(MPMediaQuery *)v2 initWithFilterPredicates:v5];

  [(MPMediaQuery *)v6 setGroupingType:1];

  return v6;
}

uint64_t __37__MPMediaQuery_setFilteringDisabled___block_invoke(uint64_t result)
{
  if (*(unsigned __int8 *)(result + 40) != __filteringDisabled)
  {
    __filteringDisabled = *(unsigned char *)(result + 40);
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

- (void)addFilterPredicate:(MPMediaPredicate *)predicate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = predicate;
  if (v4)
  {
    criteria = self->_criteria;
    filterPredicates = criteria->_filterPredicates;
    id v7 = (MPMediaQueryCriteria *)[(MPMediaQueryCriteria *)criteria copy];
    char v8 = self->_criteria;
    self->_criteria = v7;

    if (filterPredicates)
    {
      [(NSMutableSet *)self->_criteria->_filterPredicates addObject:v4];
    }
    else
    {
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v4, 0);
      uint64_t v11 = self->_criteria;
      uint64_t v12 = v11->_filterPredicates;
      v11->_filterPredicates = (NSMutableSet *)v10;
    }
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = self;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_ERROR, "attempt to *nil* filter predicate to query: %@", buf, 0xCu);
    }
  }
}

- (void)setIgnoreSystemFilterPredicates:(BOOL)a3
{
  self->_criteria->_ignoreSystemFilterPredicates = a3;
}

- (BOOL)_hasItems
{
  staticEntities = self->_staticEntities;
  if (staticEntities)
  {
    if (!self->_staticEntityType) {
      return [(NSArray *)staticEntities count] != 0;
    }
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __25__MPMediaQuery__hasItems__block_invoke;
    v8[3] = &unk_1E57EF6B0;
    v8[4] = &v9;
    [(NSArray *)staticEntities enumerateObjectsUsingBlock:v8];
    BOOL v4 = *((unsigned char *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
    return v4;
  }
  else
  {
    mediaLibrary = self->_mediaLibrary;
    criteria = self->_criteria;
    return [(MPMediaLibrary *)mediaLibrary _hasItemsForQueryCriteria:criteria];
  }
}

+ (id)albumArtistsQuery
{
  char v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v4 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ECE48 forProperty:@"mediaType"];
  uint64_t v5 = [v3 setWithObject:v4];
  id v6 = [(MPMediaQuery *)v2 initWithFilterPredicates:v5];

  [(MPMediaQuery *)v6 setGroupingType:3];

  return v6;
}

+ (MPMediaQuery)playlistsQuery
{
  char v2 = objc_alloc_init(MPMediaQuery);
  [(MPMediaQuery *)v2 setGroupingType:6];

  return v2;
}

+ (MPMediaQuery)audiobooksQuery
{
  char v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v4 = [NSNumber numberWithInteger:4];
  uint64_t v5 = +[MPMediaPropertyPredicate predicateWithValue:v4 forProperty:@"mediaType"];
  id v6 = [v3 setWithObject:v5];
  id v7 = [(MPMediaQuery *)v2 initWithFilterPredicates:v6];

  [(MPMediaQuery *)v7 setGroupingType:1];
  [(MPMediaQuery *)v7 setShouldIncludeNonLibraryEntities:1];

  return v7;
}

- (void)setGroupingType:(MPMediaGrouping)groupingType
{
  criteria = self->_criteria;
  if (criteria->_groupingType != groupingType)
  {
    id v6 = (MPMediaQueryCriteria *)[(MPMediaQueryCriteria *)criteria copy];
    id v7 = self->_criteria;
    self->_criteria = v6;

    self->_criteria->_groupingType = groupingType;
    unint64_t v8 = 1;
    if (groupingType != MPMediaGroupingPlaylist) {
      unint64_t v8 = 2;
    }
    self->_criteria->_entityOrder = v8;
  }
}

- (void)setShouldIncludeNonLibraryEntities:(BOOL)a3
{
  self->_criteria->_includeNonLibraryEntities = a3;
}

- (MPMediaQuery)init
{
  return [(MPMediaQuery *)self initWithFilterPredicates:0];
}

- (BOOL)_hasCollections
{
  staticEntities = self->_staticEntities;
  if (staticEntities && self->_staticEntityType == 1) {
    return [(NSArray *)staticEntities count] != 0;
  }
  mediaLibrary = self->_mediaLibrary;
  criteria = self->_criteria;

  return [(MPMediaLibrary *)mediaLibrary _hasCollectionsForQueryCriteria:criteria];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t groupingType = self->_criteria->_groupingType;
  if (groupingType > 0x16) {
    id v6 = @"(unknown grouping type)";
  }
  else {
    id v6 = off_1E57EF798[groupingType];
  }
  mediaLibrary = self->_mediaLibrary;
  unint64_t v8 = v6;
  uint64_t v9 = v8;
  criteria = self->_criteria;
  filterPredicates = (NSArray *)criteria->_filterPredicates;
  if (!filterPredicates) {
    filterPredicates = self->_staticEntities;
  }
  if (criteria->_ignoreSystemFilterPredicates) {
    char v12 = @"DISABLED";
  }
  else {
    char v12 = @"enabled";
  }
  uint64_t v13 = [v3 stringWithFormat:@"<%@:%p [%@] %@, %@, SystemFilters=%@>", v4, self, mediaLibrary, v8, filterPredicates, v12];

  if ([(NSArray *)self->_criteria->_orderingProperties count])
  {
    v14 = [(NSArray *)self->_criteria->_orderingProperties componentsJoinedByString:@", "];
    uint64_t v15 = [v13 stringByAppendingFormat:@" ordered by %@", v14];

    uint64_t v13 = (void *)v15;
  }

  return (NSString *)v13;
}

void __37__MPMediaQuery_initFilteringDisabled__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("filtering_disabled", 0);
  v1 = (void *)__filteringDisabledQueue;
  __filteringDisabledQueue = (uint64_t)v0;
}

- (void)_getRepresentativeCollectionGrouping:(int64_t *)a3 propertyPredicate:(id *)a4
{
  id v7 = [(MPMediaQuery *)self predicateForProperty:@"albumPID"];
  if (v7)
  {
    int64_t v8 = 1;
  }
  else
  {
    id v7 = [(MPMediaQuery *)self predicateForProperty:@"artistPID"];
    if (v7)
    {
      int64_t v8 = 2;
    }
    else
    {
      id v7 = [(MPMediaQuery *)self predicateForProperty:@"albumArtistPID"];
      if (v7)
      {
        int64_t v8 = 3;
      }
      else
      {
        id v7 = [(MPMediaQuery *)self predicateForProperty:@"composerPID"];
        if (v7)
        {
          int64_t v8 = 4;
        }
        else
        {
          id v7 = [(MPMediaQuery *)self predicateForProperty:@"genrePID"];
          int64_t v8 = 5;
          if (!v7) {
            int64_t v8 = 0;
          }
        }
      }
    }
  }
  if (a3) {
    *a3 = v8;
  }
  if (a4)
  {
    id v9 = v7;
    *a4 = v7;
    id v7 = v9;
  }
}

- (MPMediaItemCollection)_representativeCollection
{
  v3 = [(MPMediaQuery *)self predicateForProperty:@"persistentID"];

  if (v3)
  {
    uint64_t v4 = 0;
    goto LABEL_15;
  }
  uint64_t v5 = [(MPMediaQuery *)self predicateForProperty:@"playlistPersistentID"];
  if (!v5)
  {
    uint64_t v10 = [(MPMediaQuery *)self predicateForProperty:@"cloudPlaylistUniversalLibraryID"];
    if (v10)
    {
      id v6 = (void *)v10;
      uint64_t v11 = (void *)MEMORY[0x1E4F79AB8];
      char v12 = [(MPMediaQuery *)self mediaLibrary];
      uint64_t v13 = [v12 ml3Library];
      v14 = (void *)MEMORY[0x1E4F79AA0];
      uint64_t v15 = (uint64_t *)MEMORY[0x1E4F79190];
    }
    else
    {
      uint64_t v16 = [(MPMediaQuery *)self predicateForProperty:@"cloudGlobalID"];
      if (v16)
      {
        id v6 = (void *)v16;
        uint64_t v11 = (void *)MEMORY[0x1E4F79AB8];
        char v12 = [(MPMediaQuery *)self mediaLibrary];
        uint64_t v13 = [v12 ml3Library];
        v14 = (void *)MEMORY[0x1E4F79AA0];
        uint64_t v15 = (uint64_t *)MEMORY[0x1E4F79150];
      }
      else
      {
        uint64_t v17 = [(MPMediaQuery *)self predicateForProperty:@"name"];
        if (!v17)
        {
          uint64_t v24 = [(MPMediaQuery *)self predicateForProperty:@"storeCloudAlbumID"];
          if (!v24)
          {
            id v36 = 0;
            uint64_t v37 = 0;
            [(MPMediaQuery *)self _getRepresentativeCollectionGrouping:&v37 propertyPredicate:&v36];
            id v32 = v36;
            id v6 = v32;
            if (v32
              && ([v32 value],
                  v33 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v34 = [v33 longLongValue],
                  v33,
                  v34))
            {
              v35 = [MPConcreteMediaItemCollection alloc];
              uint64_t v4 = [(MPConcreteMediaItemCollection *)v35 initWithIdentifier:v34 itemsQuery:self grouping:v37];
            }
            else
            {
              uint64_t v4 = 0;
            }
            goto LABEL_14;
          }
          id v6 = (void *)v24;
          v25 = (void *)MEMORY[0x1E4F79A50];
          v26 = [(MPMediaQuery *)self mediaLibrary];
          v27 = [v26 ml3Library];
          v28 = (void *)MEMORY[0x1E4F79AA0];
          uint64_t v29 = *MEMORY[0x1E4F79040];
          v30 = [v6 value];
          v31 = [v28 predicateWithProperty:v29 equalToValue:v30];
          id v9 = [v25 anyInLibrary:v27 predicate:v31];

          v21 = [(MPMediaQuery *)self mediaLibrary];
          uint64_t v22 = objc_msgSend(v21, "collectionWithPersistentID:groupingType:", objc_msgSend(v9, "persistentID"), 1);
          goto LABEL_12;
        }
        id v6 = (void *)v17;
        uint64_t v11 = (void *)MEMORY[0x1E4F79AB8];
        char v12 = [(MPMediaQuery *)self mediaLibrary];
        uint64_t v13 = [v12 ml3Library];
        v14 = (void *)MEMORY[0x1E4F79AA0];
        uint64_t v15 = (uint64_t *)MEMORY[0x1E4F792D0];
      }
    }
    uint64_t v18 = *v15;
    v19 = [v6 value];
    v20 = [v14 predicateWithProperty:v18 equalToValue:v19];
    id v9 = [v11 anyInLibrary:v13 predicate:v20];

    v21 = [(MPMediaQuery *)self mediaLibrary];
    uint64_t v22 = objc_msgSend(v21, "newPlaylistWithPersistentID:", objc_msgSend(v9, "persistentID"));
LABEL_12:
    uint64_t v4 = (MPConcreteMediaItemCollection *)v22;

    goto LABEL_13;
  }
  id v6 = v5;
  id v7 = [v5 value];
  uint64_t v8 = [v7 unsignedLongLongValue];

  id v9 = [(MPMediaQuery *)self mediaLibrary];
  uint64_t v4 = (MPConcreteMediaItemCollection *)[v9 newPlaylistWithPersistentID:v8];
LABEL_13:

LABEL_14:
LABEL_15:

  return (MPMediaItemCollection *)v4;
}

- (id)predicateForProperty:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(MPMediaQuery *)self filterPredicates];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v9 property];
          int v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (NSSet)filterPredicates
{
  char v2 = (void *)[(NSMutableSet *)self->_criteria->_filterPredicates copy];

  return (NSSet *)v2;
}

- (void)_setOrderingProperties:(id)a3
{
  criteria = self->_criteria;
  if (criteria->_orderingProperties != a3)
  {
    id v5 = a3;
    id v6 = (MPMediaQueryCriteria *)[(MPMediaQueryCriteria *)criteria copy];
    uint64_t v7 = self->_criteria;
    self->_criteria = v6;

    uint64_t v8 = [v5 copy];
    id v9 = self->_criteria;
    orderingProperties = v9->_orderingProperties;
    v9->_orderingProperties = (NSArray *)v8;
  }
}

- (void)_setOrderingDirectionMappings:(id)a3
{
  criteria = self->_criteria;
  if (criteria->_orderingDirectionMappings != a3)
  {
    id v5 = a3;
    id v6 = (MPMediaQueryCriteria *)[(MPMediaQueryCriteria *)criteria copy];
    uint64_t v7 = self->_criteria;
    self->_criteria = v6;

    uint64_t v8 = [v5 copy];
    id v9 = self->_criteria;
    orderingDirectionMappings = v9->_orderingDirectionMappings;
    v9->_orderingDirectionMappings = (NSDictionary *)v8;
  }
}

+ (void)setFilteringDisabled:(BOOL)a3
{
  +[MPMediaQuery initFilteringDisabled];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__MPMediaQuery_setFilteringDisabled___block_invoke;
  v5[3] = &unk_1E57EF688;
  BOOL v6 = a3;
  v5[4] = &v7;
  dispatch_sync((dispatch_queue_t)__filteringDisabledQueue, v5);
  if (*((unsigned char *)v8 + 24))
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"MPMediaLibraryFilteringDidChangeNotification" object:0];
  }
  _Block_object_dispose(&v7, 8);
}

+ (id)tvShowsQuery
{
  char v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [NSNumber numberWithInteger:512];
  id v5 = +[MPMediaPropertyPredicate predicateWithValue:v4 forProperty:@"mediaType"];
  BOOL v6 = [v3 setWithObject:v5];
  uint64_t v7 = [(MPMediaQuery *)v2 initWithFilterPredicates:v6];

  return v7;
}

+ (id)homeVideosQuery
{
  char v2 = [MPMediaQuery alloc];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [NSNumber numberWithInteger:0x2000];
  id v5 = +[MPMediaPropertyPredicate predicateWithValue:v4 forProperty:@"mediaType"];
  BOOL v6 = [v3 setWithObject:v5];
  uint64_t v7 = [(MPMediaQuery *)v2 initWithFilterPredicates:v6];

  return v7;
}

- (void)setCriteria:(id)a3
{
  if (self->_criteria != a3)
  {
    id v4 = (MPMediaQueryCriteria *)[a3 copy];
    criteria = self->_criteria;
    self->_criteria = v4;
  }
}

- (id)criteria
{
  return self->_criteria;
}

- (unint64_t)_playlistItemPersistentIDForItemPersistentID:(unint64_t)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)[(MPMediaQuery *)self copy];
  [v5 setGroupingType:6];
  BOOL v6 = [v5 collections];
  uint64_t v7 = [v6 firstObject];

  if (v7)
  {
    if (([v7 playlistAttributes] & 2) != 0)
    {
      uint64_t v17 = a3 | 0x8000000000000000;
    }
    else
    {
      uint64_t v8 = [(MPMediaQuery *)self mediaLibrary];
      uint64_t v9 = [v8 ml3Library];

      char v10 = (void *)MEMORY[0x1E4F79AC0];
      int v11 = (void *)MEMORY[0x1E4F79A60];
      char v12 = objc_msgSend(MEMORY[0x1E4F79AA0], "predicateWithProperty:equalToInt64:", *MEMORY[0x1E4F79118], objc_msgSend(v7, "persistentID"));
      v19[0] = v12;
      long long v13 = [MEMORY[0x1E4F79AA0] predicateWithProperty:*MEMORY[0x1E4F79120] equalToInt64:a3];
      v19[1] = v13;
      long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
      long long v15 = [v11 predicateMatchingPredicates:v14];
      long long v16 = [v10 anyInLibrary:v9 predicate:v15];

      uint64_t v17 = [v16 persistentID];
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (BOOL)isPlaylistItemsQuery
{
  if ([(MPMediaQuery *)self groupingType]) {
    return 0;
  }
  id v4 = [(MPMediaQuery *)self predicateForProperty:@"playlistPersistentID"];
  if (v4)
  {
    BOOL v3 = 1;
  }
  else
  {
    id v5 = [(MPMediaQuery *)self predicateForProperty:@"name"];
    if (v5)
    {
      BOOL v3 = 1;
    }
    else
    {
      BOOL v6 = [(MPMediaQuery *)self predicateForProperty:@"cloudPlaylistUniversalLibraryID"];
      BOOL v3 = v6 != 0;
    }
  }

  return v3;
}

- (void)setStaticEntities:(id)a3 entityType:(int64_t)a4
{
  if (self->_staticEntities != a3)
  {
    BOOL v6 = (NSArray *)[a3 copy];
    staticEntities = self->_staticEntities;
    self->_staticEntities = v6;

    self->_staticEntityType = a4;
  }
}

- (void)_enumerateCollectionsInOrder:(BOOL)a3 usingBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = self->_mediaLibrary;
  uint64_t v8 = [(MPMediaLibrary *)v7 libraryDataProvider];
  criteria = self->_criteria;
  BOOL v10 = criteria->_groupingType == 6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__MPMediaQuery__enumerateCollectionsInOrder_usingBlock___block_invoke;
  v18[3] = &unk_1E57F1930;
  id v19 = v6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__MPMediaQuery__enumerateCollectionsInOrder_usingBlock___block_invoke_2;
  v13[3] = &unk_1E57EF778;
  BOOL v17 = v10;
  long long v15 = self;
  id v16 = v19;
  long long v14 = v7;
  id v11 = v19;
  char v12 = v7;
  [v8 enumerateCollectionIdentifiersForQueryCriteria:criteria ordered:v4 cancelBlock:v18 usingBlock:v13];
}

uint64_t __56__MPMediaQuery__enumerateCollectionsInOrder_usingBlock___block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = 0;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return v2;
}

void __56__MPMediaQuery__enumerateCollectionsInOrder_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  if (*(unsigned char *)(a1 + 56))
  {
    id v5 = [*(id *)(a1 + 32) playlistWithPersistentID:a2];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v5 = +[MPMediaItem persistentIDPropertyForGroupingType:*(void *)(*(void *)(*(void *)(a1 + 40) + 16) + 24)];
    id v6 = [NSNumber numberWithUnsignedLongLong:a2];
    uint64_t v7 = +[MPMediaPropertyPredicate predicateWithValue:v6 forProperty:v5];

    uint64_t v8 = (void *)[*(id *)(*(void *)(a1 + 40) + 16) copy];
    [v8 addFilterPredicate:v7];
    [v8 setGroupingType:0];
    [v8 setEntityLimit:0];
    uint64_t v9 = [[MPMediaQuery alloc] initWithCriteria:v8 library:*(void *)(*(void *)(a1 + 40) + 8)];
    BOOL v10 = [[MPConcreteMediaItemCollection alloc] initWithIdentifier:a2 valuesForProperties:v11 itemsQuery:v9 grouping:*(void *)(*(void *)(*(void *)(a1 + 40) + 16) + 24) representativeItemIdentifier:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_enumerateCollectionPersistentIDsInOrder:(BOOL)a3 usingBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = self->_mediaLibrary;
  uint64_t v8 = [(MPMediaLibrary *)v7 libraryDataProvider];
  criteria = self->_criteria;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__MPMediaQuery__enumerateCollectionPersistentIDsInOrder_usingBlock___block_invoke_2;
  v11[3] = &unk_1E57EF750;
  id v12 = v6;
  id v10 = v6;
  [v8 enumerateCollectionIdentifiersForQueryCriteria:criteria ordered:v4 cancelBlock:&__block_literal_global_108 usingBlock:v11];
}

uint64_t __68__MPMediaQuery__enumerateCollectionPersistentIDsInOrder_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__MPMediaQuery__enumerateCollectionPersistentIDsInOrder_usingBlock___block_invoke()
{
  return 0;
}

- (void)_enumerateUnorderedCollectionPersistentIDsUsingBlock:(id)a3
{
}

- (void)_enumerateCollectionPersistentIDsUsingBlock:(id)a3
{
}

- (void)_enumerateUnorderedCollectionsUsingBlock:(id)a3
{
}

- (void)_enumerateCollectionsUsingBlock:(id)a3
{
}

- (void)_enumerateItemsInOrder:(BOOL)a3 usingBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = self->_mediaLibrary;
  uint64_t v8 = [(MPMediaLibrary *)v7 libraryDataProvider];
  criteria = self->_criteria;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__MPMediaQuery__enumerateItemsInOrder_usingBlock___block_invoke;
  v15[3] = &unk_1E57F1930;
  id v16 = v6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__MPMediaQuery__enumerateItemsInOrder_usingBlock___block_invoke_2;
  v12[3] = &unk_1E57EF700;
  long long v13 = v7;
  id v14 = v16;
  id v10 = v16;
  id v11 = v7;
  [v8 enumerateItemIdentifiersForQueryCriteria:criteria ordered:v4 cancelBlock:v15 usingBlock:v12];
}

uint64_t __50__MPMediaQuery__enumerateItemsInOrder_usingBlock___block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = 0;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return v2;
}

void __50__MPMediaQuery__enumerateItemsInOrder_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = +[MPConcreteMediaItem concreteMediaItemWithPersistentID:a2 library:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_enumerateUnorderedItemPersistentIDsUsingBlock:(id)a3
{
}

- (void)_enumerateUnorderedItemsUsingBlock:(id)a3
{
}

- (void)_enumerateItemsUsingBlock:(id)a3
{
}

- (BOOL)_isFilteringDisabled
{
  int isFilteringDisabled = self->_isFilteringDisabled;
  if (isFilteringDisabled == -1) {
    return +[MPMediaQuery isFilteringDisabled];
  }
  else {
    return isFilteringDisabled != 0;
  }
}

- (id)valueForAggregateFunction:(id)a3 onCollectionsForProperty:(id)a4
{
  return [(MPMediaQuery *)self _valueForAggregateFunction:a3 onProperty:a4 entityType:1];
}

- (id)valueForAggregateFunction:(id)a3 onItemsForProperty:(id)a4
{
  return [(MPMediaQuery *)self _valueForAggregateFunction:a3 onProperty:a4 entityType:0];
}

- (id)_valueForAggregateFunction:(id)a3 onProperty:(id)a4 entityType:(int64_t)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (_valueForAggregateFunction_onProperty_entityType__onceToken != -1) {
    dispatch_once(&_valueForAggregateFunction_onProperty_entityType__onceToken, &__block_literal_global_97);
  }
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__12362;
  v39 = __Block_byref_object_dispose__12363;
  id v40 = 0;
  if ([(id)__supportedAggregateFunctions containsObject:v8])
  {
    id v10 = self->_staticEntities;
    v27 = v10;
    if (v10)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v32 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = [*(id *)(*((void *)&v31 + 1) + 8 * i) valueForProperty:v9];
            BOOL v17 = (void *)v36[5];
            v36[5] = v16;

            if (objc_opt_respondsToSelector()) {
              v12 += (int)[(id)v36[5] intValue];
            }
          }
          uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
        }
        while (v13);
      }

      uint64_t v18 = [objc_alloc(NSNumber) initWithInteger:v12];
      id v19 = v36[5];
      v36[5] = v18;
    }
    else
    {
      dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __65__MPMediaQuery__valueForAggregateFunction_onProperty_entityType___block_invoke_100;
      v28[3] = &unk_1E57EF6D8;
      v30 = &v35;
      id v19 = v20;
      uint64_t v29 = v19;
      v21 = (void *)MEMORY[0x19971E0F0](v28);
      uint64_t v22 = [(MPMediaLibrary *)self->_mediaLibrary libraryDataProvider];
      v23 = v22;
      criteria = self->_criteria;
      if (a5 == 1) {
        [v22 loadValueForAggregateFunction:v8 onCollectionsForProperty:v9 queryCriteria:criteria completionBlock:v21];
      }
      else {
        [v22 loadValueForAggregateFunction:v8 onItemsForProperty:v9 queryCriteria:criteria completionBlock:v21];
      }
      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  id v25 = (id)v36[5];
  _Block_object_dispose(&v35, 8);

  return v25;
}

void __65__MPMediaQuery__valueForAggregateFunction_onProperty_entityType___block_invoke_100(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __65__MPMediaQuery__valueForAggregateFunction_onProperty_entityType___block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"MAX", @"MIN", @"TOTAL", 0);
  v1 = (void *)__supportedAggregateFunctions;
  __supportedAggregateFunctions = v0;
}

- (NSArray)collectionSections
{
  unsigned __int8 v2 = [(MPMediaQuery *)self collectionSectionInfo];
  id v3 = [v2 sections];

  return (NSArray *)v3;
}

- (NSArray)itemSections
{
  unsigned __int8 v2 = [(MPMediaQuery *)self itemSectionInfo];
  id v3 = [v2 sections];

  return (NSArray *)v3;
}

- (BOOL)willGroupEntities
{
  if ([(MPMediaQuery *)self groupingType]) {
    return 1;
  }
  if (![(MPMediaQuery *)self groupingThreshold]) {
    return 0;
  }
  id v4 = [(MPMediaQuery *)self items];
  unint64_t v5 = [v4 count];
  BOOL v3 = v5 >= [(MPMediaQuery *)self groupingThreshold];

  return v3;
}

- (unint64_t)groupingThreshold
{
  return 0;
}

- (BOOL)specifiesPlaylistItems
{
  return [(MPMediaQueryCriteria *)self->_criteria specifiesPlaylistItems];
}

- (BOOL)excludesEntitiesWithBlankNames
{
  return [(MPMediaQueryCriteria *)self->_criteria excludesEntitiesWithBlankNames];
}

- (BOOL)useSections
{
  return self->_criteria->_useSections;
}

- (void)setUseSections:(BOOL)a3
{
  criteria = self->_criteria;
  if (criteria->_useSections != a3)
  {
    id v6 = (MPMediaQueryCriteria *)[(MPMediaQueryCriteria *)criteria copy];
    uint64_t v7 = self->_criteria;
    self->_criteria = v6;

    self->_criteria->_useSections = a3;
  }
}

- (BOOL)sortItems
{
  return self->_criteria->_entityOrder == 2;
}

- (int64_t)_representativeCollectionGroupingType
{
  int64_t v3 = 0;
  [(MPMediaQuery *)self _getRepresentativeCollectionGrouping:&v3 propertyPredicate:0];
  return v3;
}

- (NSDictionary)_orderingDirectionMappings
{
  return self->_criteria->_orderingDirectionMappings;
}

- (NSArray)_orderingProperties
{
  return self->_criteria->_orderingProperties;
}

- (MPMediaQuerySectionInfo)collectionSectionInfo
{
  unsigned __int8 v2 = [(MPMediaQuery *)self collections];
  int64_t v3 = [v2 sectionInfo];

  return (MPMediaQuerySectionInfo *)v3;
}

- (MPMediaQuerySectionInfo)itemSectionInfo
{
  unsigned __int8 v2 = [(MPMediaQuery *)self items];
  int64_t v3 = [v2 sectionInfo];

  return (MPMediaQuerySectionInfo *)v3;
}

- (NSArray)collectionPersistentIdentifiers
{
  return (NSArray *)[(MPMediaLibrary *)self->_mediaLibrary _collectionPersistentIdentifiersForQueryCriteria:self->_criteria];
}

- (NSArray)itemPersistentIdentifiers
{
  return (NSArray *)[(MPMediaLibrary *)self->_mediaLibrary _itemPersistentIdentifiersForQueryCriteria:self->_criteria];
}

uint64_t __29__MPMediaQuery__countOfItems__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __25__MPMediaQuery__hasItems__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

- (void)setCollectionPropertiesToFetch:(id)a3
{
  criteria = self->_criteria;
  if (criteria->_collectionPropertiesToFetch != a3)
  {
    id v5 = a3;
    id v6 = (MPMediaQueryCriteria *)[(MPMediaQueryCriteria *)criteria copy];
    uint64_t v7 = self->_criteria;
    self->_criteria = v6;

    uint64_t v8 = [v5 copy];
    id v9 = self->_criteria;
    collectionPropertiesToFetch = v9->_collectionPropertiesToFetch;
    v9->_collectionPropertiesToFetch = (NSSet *)v8;
  }
}

- (NSSet)collectionPropertiesToFetch
{
  return self->_criteria->_collectionPropertiesToFetch;
}

- (void)setItemPropertiesToFetch:(id)a3
{
  criteria = self->_criteria;
  if (criteria->_itemPropertiesToFetch != a3)
  {
    id v5 = a3;
    id v6 = (MPMediaQueryCriteria *)[(MPMediaQueryCriteria *)criteria copy];
    uint64_t v7 = self->_criteria;
    self->_criteria = v6;

    uint64_t v8 = [v5 copy];
    id v9 = self->_criteria;
    itemPropertiesToFetch = v9->_itemPropertiesToFetch;
    v9->_itemPropertiesToFetch = (NSSet *)v8;
  }
}

- (NSSet)itemPropertiesToFetch
{
  return self->_criteria->_itemPropertiesToFetch;
}

- (BOOL)ignoreRestrictionsPredicates
{
  return self->_criteria->_ignoreRestrictionsPredicates;
}

- (BOOL)ignoreSystemFilterPredicates
{
  return self->_criteria->_ignoreSystemFilterPredicates;
}

- (void)setIncludeEntitiesWithBlankNames:(BOOL)a3
{
  self->_criteria->_includeEntitiesWithBlankNames = a3;
}

- (BOOL)includeEntitiesWithBlankNames
{
  return self->_criteria->_includeEntitiesWithBlankNames;
}

- (BOOL)shouldIncludeNonLibraryEntities
{
  return self->_criteria->_includeNonLibraryEntities;
}

- (unint64_t)entityLimit
{
  return self->_criteria->_entityLimit;
}

- (MPMediaGrouping)groupingType
{
  return self->_criteria->_groupingType;
}

void __21__MPMediaQuery_items__block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 items];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObjectsFromArray:v3];
    int64_t v3 = v4;
  }
}

- (void)removeFilterPredicate:(MPMediaPredicate *)predicate
{
  id v9 = predicate;
  if (-[NSMutableSet containsObject:](self->_criteria->_filterPredicates, "containsObject:"))
  {
    id v4 = (MPMediaQueryCriteria *)[(MPMediaQueryCriteria *)self->_criteria copy];
    criteria = self->_criteria;
    self->_criteria = v4;

    uint64_t v6 = [(NSMutableSet *)self->_criteria->_filterPredicates count];
    uint64_t v7 = self->_criteria;
    filterPredicates = v7->_filterPredicates;
    if (v6 == 1)
    {
      v7->_filterPredicates = 0;
    }
    else
    {
      [(NSMutableSet *)filterPredicates removeObject:v9];
    }
  }
}

- (void)setFilterPredicates:(NSSet *)filterPredicates
{
  criteria = self->_criteria;
  if ((NSSet *)criteria->_filterPredicates != filterPredicates)
  {
    id v5 = filterPredicates;
    uint64_t v6 = (MPMediaQueryCriteria *)[(MPMediaQueryCriteria *)criteria copy];
    uint64_t v7 = self->_criteria;
    self->_criteria = v6;

    uint64_t v8 = [(NSSet *)v5 mutableCopy];
    id v9 = self->_criteria;
    id v10 = v9->_filterPredicates;
    v9->_filterPredicates = (NSMutableSet *)v8;
  }
}

- (id)protobufferEncodableObjectFromLibrary:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = (MPMediaLibrary *)a3;
  id v5 = objc_alloc_init(MPPMediaQuery);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v6 = self->_criteria->_filterPredicates;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        mediaLibrary = v4;
        if (!v4) {
          mediaLibrary = self->_mediaLibrary;
        }
        uint64_t v12 = [*(id *)(*((void *)&v31 + 1) + 8 * i) protobufferEncodableObjectFromLibrary:mediaLibrary];
        [(MPPMediaQuery *)v5 addFilterPredicates:v12];
      }
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v8);
  }

  unint64_t groupingType = self->_criteria->_groupingType;
  if (groupingType > 0xC) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = dword_19568A0E4[groupingType];
  }
  [(MPPMediaQuery *)v5 setGroupingType:v14];
  [(MPPMediaQuery *)v5 setFilteringDisabled:self->_isFilteringDisabled != 0];
  [(MPPMediaQuery *)v5 setIncludeNonLibraryEntities:self->_criteria->_includeNonLibraryEntities];
  unint64_t entityOrder = self->_criteria->_entityOrder;
  if (entityOrder == 2) {
    unsigned int v16 = 3;
  }
  else {
    unsigned int v16 = 1;
  }
  if (entityOrder == 1) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = v16;
  }
  [(MPPMediaQuery *)v5 setEntityOrder:v17];
  if (self->_staticEntities)
  {
    int64_t staticEntityType = self->_staticEntityType;
    if (staticEntityType) {
      uint64_t v19 = 2 * (staticEntityType == 1);
    }
    else {
      uint64_t v19 = 1;
    }
    [(MPPMediaQuery *)v5 setStaticEntityType:v19];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    dispatch_semaphore_t v20 = self->_staticEntities;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(v20);
          }
          id v25 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "multiverseIdentifier", (void)v27);
          [(MPPMediaQuery *)v5 addStaticEntityIdentifiers:v25];
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v22);
    }
  }

  return v5;
}

- (id)protobufferEncodableObject
{
  return [(MPMediaQuery *)self protobufferEncodableObjectFromLibrary:0];
}

- (MPMediaQuery)initWithProtobufferDecodableObject:(id)a3 library:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"MPMediaQuery.m", 262, @"Cannot decode protobuf object of type %@", objc_opt_class() object file lineNumber description];
  }
  id v9 = v7;
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v9, "filterPredicatesCount"));
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v50 = v9;
  id v11 = [v9 filterPredicates];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v66 != v14) {
          objc_enumerationMutation(v11);
        }
        unsigned int v16 = MPPCreateMediaPredicateFromProtocolPredicateAndLibrary(*(void **)(*((void *)&v65 + 1) + 8 * i), v8);
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v65 objects:v75 count:16];
    }
    while (v13);
  }

  uint64_t v17 = [(MPMediaQuery *)self initWithFilterPredicates:v10];
  uint64_t v18 = v50;
  if (v17)
  {
    int v19 = [v50 groupingType];
    switch(v19)
    {
      case 2:
        uint64_t v20 = 1;
        break;
      case 3:
        uint64_t v20 = 2;
        break;
      case 4:
        uint64_t v20 = 3;
        break;
      case 5:
        uint64_t v20 = 4;
        break;
      case 6:
        uint64_t v20 = 5;
        break;
      case 7:
        uint64_t v20 = 6;
        break;
      case 8:
        uint64_t v20 = 7;
        break;
      default:
        switch(v19)
        {
          case 'd':
            uint64_t v20 = 8;
            break;
          case 'e':
            uint64_t v20 = 9;
            break;
          case 'f':
            uint64_t v20 = 10;
            break;
          case 'g':
            uint64_t v20 = 11;
            break;
          case 'h':
            uint64_t v20 = 12;
            break;
          default:
            uint64_t v20 = 0;
            break;
        }
        break;
    }
    v17->_criteria->_unint64_t groupingType = v20;
    int v21 = [v50 entityOrder];
    uint64_t v22 = 2 * (v21 == 3);
    if (v21 == 2) {
      uint64_t v22 = 1;
    }
    v17->_criteria->_unint64_t entityOrder = v22;
    v17->_criteria->_includeNonLibraryEntities = [v50 includeNonLibraryEntities];
    v17->_int isFilteringDisabled = [v50 filteringDisabled];
    uint64_t v23 = [v50 staticEntityIdentifiersCount];
    if (v23)
    {
      v49 = v17;
      v56 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v23];
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      uint64_t v24 = [v50 staticEntityIdentifiers];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v61 objects:v74 count:16];
      if (!v25) {
        goto LABEL_67;
      }
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v62;
      v52 = v24;
      v53 = v10;
      uint64_t v51 = *(void *)v62;
      while (1)
      {
        uint64_t v28 = 0;
        uint64_t v54 = v26;
        do
        {
          if (*(void *)v62 != v27) {
            objc_enumerationMutation(v24);
          }
          long long v29 = *(void **)(*((void *)&v61 + 1) + 8 * v28);
          if (v8)
          {
            uint64_t v30 = [v8 entityWithMultiverseIdentifier:*(void *)(*((void *)&v61 + 1) + 8 * v28)];
            if (v30)
            {
              long long v31 = v30;
              [(NSArray *)v56 addObject:v30];
              goto LABEL_64;
            }
            long long v32 = os_log_create("com.apple.amp.mediaplayer", "Library");
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              id v71 = v8;
              __int16 v72 = 2114;
              v73 = v29;
              _os_log_impl(&dword_1952E8000, v32, OS_LOG_TYPE_ERROR, "No static entity found for provided library: %{public}@ multiverseID: %{public}@", buf, 0x16u);
            }
          }
          if (![v29 libraryIdentifiersCount]) {
            goto LABEL_62;
          }
          uint64_t v55 = v28;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v33 = [v29 libraryIdentifiers];
          uint64_t v34 = [v33 countByEnumeratingWithState:&v57 objects:v69 count:16];
          if (!v34)
          {

            uint64_t v26 = v54;
            uint64_t v28 = v55;
LABEL_62:
            long long v31 = os_log_create("com.apple.amp.mediaplayer", "Library");
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v71 = v29;
              _os_log_impl(&dword_1952E8000, v31, OS_LOG_TYPE_ERROR, "Unable to find static entity in any library: %{public}@", buf, 0xCu);
            }
LABEL_64:

            goto LABEL_65;
          }
          uint64_t v35 = v34;
          char v36 = 0;
          uint64_t v37 = *(void *)v58;
          do
          {
            for (uint64_t j = 0; j != v35; ++j)
            {
              if (*(void *)v58 != v37) {
                objc_enumerationMutation(v33);
              }
              v39 = *(void **)(*((void *)&v57 + 1) + 8 * j);
              id v40 = v8;
              if ([v39 hasLibraryName])
              {
                v41 = [v39 libraryName];
                uint64_t v42 = +[MPMediaLibrary mediaLibraryWithUniqueIdentifier:v41];

                id v40 = (id)v42;
              }
              v43 = [v40 entityWithMultiverseIdentifier:v29];
              if (v43)
              {
                if (v8)
                {
                  v44 = os_log_create("com.apple.amp.mediaplayer", "Library");
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    id v71 = v40;
                    __int16 v72 = 2114;
                    v73 = v29;
                    _os_log_impl(&dword_1952E8000, v44, OS_LOG_TYPE_DEFAULT, "Static entity recovered from included library: %{public}@ multiverseID: %{public}@", buf, 0x16u);
                  }
                }
                [(NSArray *)v56 addObject:v43];
                char v36 = 1;
              }
              else
              {
                v45 = os_log_create("com.apple.amp.mediaplayer", "Library");
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  id v71 = v40;
                  __int16 v72 = 2114;
                  v73 = v29;
                  _os_log_impl(&dword_1952E8000, v45, OS_LOG_TYPE_ERROR, "No static entity found in library: %{public}@ multiverseID: %{public}@", buf, 0x16u);
                }
              }
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v57 objects:v69 count:16];
          }
          while (v35);

          uint64_t v24 = v52;
          id v10 = v53;
          uint64_t v27 = v51;
          uint64_t v26 = v54;
          uint64_t v28 = v55;
          if ((v36 & 1) == 0) {
            goto LABEL_62;
          }
LABEL_65:
          ++v28;
        }
        while (v28 != v26);
        uint64_t v26 = [v24 countByEnumeratingWithState:&v61 objects:v74 count:16];
        if (!v26)
        {
LABEL_67:

          uint64_t v17 = v49;
          staticEntities = v49->_staticEntities;
          v49->_staticEntities = v56;

          uint64_t v18 = v50;
          v49->_int64_t staticEntityType = [v50 staticEntityType] == 2;
          break;
        }
      }
    }
  }

  return v17;
}

- (MPMediaQuery)initWithProtobufferDecodableObject:(id)a3
{
  return [(MPMediaQuery *)self initWithProtobufferDecodableObject:a3 library:0];
}

- (id)copyBySanitizingStaticEntities
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_staticEntities)
  {
    unsigned __int8 v2 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    int64_t v3 = self->_staticEntities;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (!v4) {
      goto LABEL_15;
    }
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (1)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
        int64_t staticEntityType = self->_staticEntityType;
        id v10 = [v8 mediaLibrary];
        uint64_t v11 = [v8 persistentID];
        if (staticEntityType)
        {
          int v12 = objc_msgSend(v10, "collectionExistsWithPersistentID:groupingType:", v11, objc_msgSend(v8, "groupingType"));

          if (!v12) {
            goto LABEL_10;
          }
LABEL_9:
          [v2 addObject:v8];
          goto LABEL_10;
        }
        char v13 = [v10 itemExistsWithPersistentID:v11];

        if (v13) {
          goto LABEL_9;
        }
LABEL_10:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v14 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v5 = v14;
      if (!v14)
      {
LABEL_15:

        long long v15 = (void *)[(MPMediaQuery *)self copy];
        [v15 setStaticEntities:v2 entityType:self->_staticEntityType];

        return v15;
      }
    }
  }

  return self;
}

- (id)copyByRemovingStaticEntities
{
  if (self->_staticEntities)
  {
    unsigned __int8 v2 = (void *)[(MPMediaQuery *)self copy];
    [v2 setStaticEntities:0 entityType:self->_staticEntityType];
    return v2;
  }
  else
  {
    return self;
  }
}

- (void)encodeWithCoder:(id)a3
{
  mediaLibrary = self->_mediaLibrary;
  id v5 = a3;
  [v5 encodeObject:mediaLibrary forKey:@"MPMediaLibrary"];
  [v5 encodeObject:self->_criteria->_filterPredicates forKey:@"MPFilterPredicates"];
  [v5 encodeInteger:self->_criteria->_groupingType forKey:@"MPGroupingType"];
  [v5 encodeInteger:self->_criteria->_entityOrder forKey:@"MPEntityOrder"];
  [v5 encodeBool:self->_criteria->_ignoreSystemFilterPredicates forKey:@"MPIgnoreSystemFilterPredicates"];
  [v5 encodeBool:self->_criteria->_ignoreRestrictionsPredicates forKey:@"MPIgnoreRestrictionsPredicates"];
  [v5 encodeBool:self->_criteria->_includeNonLibraryEntities forKey:@"MPIncludeNonLibraryEntities"];
  [v5 encodeBool:self->_criteria->_includeEntitiesWithBlankNames forKey:@"MPIncludeEntitiesWithBlankNames"];
  objc_msgSend(v5, "encodeBool:forKey:", -[MPMediaQuery _isFilteringDisabled](self, "_isFilteringDisabled"), @"MLIsFilteringDisabled");
  [v5 encodeObject:self->_staticEntities forKey:@"MPStaticEntities"];
  [v5 encodeInteger:self->_staticEntityType forKey:@"MPStaticEntityType"];
}

- (unint64_t)hash
{
  unint64_t v3 = [(MPMediaQueryCriteria *)self->_criteria hash];
  return [(MPMediaLibrary *)self->_mediaLibrary hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = 0;
  if (v5 == objc_opt_class())
  {
    staticEntities = self->_staticEntities;
    if (staticEntities == (NSArray *)v4[4] || -[NSArray isEqualToArray:](staticEntities, "isEqualToArray:"))
    {
      criteria = self->_criteria;
      if (criteria == (MPMediaQueryCriteria *)v4[2] || -[MPMediaQueryCriteria isEqual:](criteria, "isEqual:"))
      {
        mediaLibrary = self->_mediaLibrary;
        if (mediaLibrary == (MPMediaLibrary *)v4[1] || -[MPMediaLibrary isEqual:](mediaLibrary, "isEqual:")) {
          BOOL v6 = 1;
        }
      }
    }
  }

  return v6;
}

- (MPMediaQuery)initWithEntities:(id)a3 entityType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(MPMediaQuery *)self initWithFilterPredicates:0];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    staticEntities = v7->_staticEntities;
    v7->_staticEntities = (NSArray *)v8;

    v7->_int64_t staticEntityType = a4;
  }

  return v7;
}

+ (id)playlistsRecentlyAddedQuery
{
  v12[2] = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = +[MPMediaQuery playlistsQuery];
  uint64_t v3 = MEMORY[0x1E4F1CC28];
  uint64_t v4 = +[MPMediaPropertyPredicate predicateWithValue:MEMORY[0x1E4F1CC28] forProperty:@"isHidden"];
  [v2 addFilterPredicate:v4];

  uint64_t v5 = +[MPMediaPropertyPredicate predicateWithValue:v3 forProperty:@"isGeniusMix"];
  [v2 addFilterPredicate:v5];

  id v6 = +[MPMediaPropertyPredicate predicateWithValue:v3 forProperty:@"isFolder"];
  [v2 addFilterPredicate:v6];

  v12[0] = @"dateCreated";
  v12[1] = @"name";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [v2 _setOrderingProperties:v7];

  id v10 = @"dateCreated";
  uint64_t v11 = &unk_1EE6ECE90;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v2 _setOrderingDirectionMappings:v8];

  return v2;
}

+ (id)geniusMixesQuery
{
  unsigned __int8 v2 = objc_alloc_init(MPMediaQuery);
  [(MPMediaQuery *)v2 setGroupingType:6];
  uint64_t v3 = [NSNumber numberWithBool:1];
  uint64_t v4 = +[MPMediaPropertyPredicate predicateWithValue:v3 forProperty:@"isHidden"];
  [(MPMediaQuery *)v2 addFilterPredicate:v4];

  uint64_t v5 = [NSNumber numberWithBool:1];
  id v6 = +[MPMediaPropertyPredicate predicateWithValue:v5 forProperty:@"isGeniusMix"];
  [(MPMediaQuery *)v2 addFilterPredicate:v6];

  return v2;
}

+ (id)videoPodcastsQuery
{
  unsigned __int8 v2 = [MPMediaQuery alloc];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = [NSNumber numberWithInteger:1024];
  uint64_t v5 = +[MPMediaPropertyPredicate predicateWithValue:v4 forProperty:@"mediaType"];
  id v6 = [v3 setWithObject:v5];
  uint64_t v7 = [(MPMediaQuery *)v2 initWithFilterPredicates:v6];

  return v7;
}

+ (id)audioPodcastsQuery
{
  unsigned __int8 v2 = [MPMediaQuery alloc];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ECE90 forProperty:@"mediaType"];
  uint64_t v5 = [v3 setWithObject:v4];
  id v6 = [(MPMediaQuery *)v2 initWithFilterPredicates:v5];

  return v6;
}

+ (id)musicVideosQuery
{
  unsigned __int8 v2 = [MPMediaQuery alloc];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ECE60 forProperty:@"mediaType"];
  uint64_t v5 = [v3 setWithObject:v4];
  id v6 = [(MPMediaQuery *)v2 initWithFilterPredicates:v5];

  return v6;
}

+ (id)videosQuery
{
  unsigned __int8 v2 = [MPMediaQuery alloc];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = [NSNumber numberWithInteger:65280];
  uint64_t v5 = +[MPMediaPropertyPredicate predicateWithValue:v4 forProperty:@"mediaType"];
  id v6 = [v3 setWithObject:v5];
  uint64_t v7 = [(MPMediaQuery *)v2 initWithFilterPredicates:v6];

  return v7;
}

+ (MPMediaQuery)genresQuery
{
  unsigned __int8 v2 = [MPMediaQuery alloc];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ECE48 forProperty:@"mediaType"];
  uint64_t v5 = objc_msgSend(v3, "setWithObjects:", v4, 0);
  id v6 = [(MPMediaQuery *)v2 initWithFilterPredicates:v5];

  [(MPMediaQuery *)v6 setGroupingType:5];

  return v6;
}

+ (MPMediaQuery)composersQuery
{
  unsigned __int8 v2 = [MPMediaQuery alloc];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ECE48 forProperty:@"mediaType"];
  uint64_t v5 = objc_msgSend(v3, "setWithObjects:", v4, 0);
  id v6 = [(MPMediaQuery *)v2 initWithFilterPredicates:v5];

  [(MPMediaQuery *)v6 setGroupingType:4];

  return v6;
}

+ (MPMediaQuery)compilationsQuery
{
  unsigned __int8 v2 = [MPMediaQuery alloc];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ECE48 forProperty:@"mediaType"];
  uint64_t v5 = +[MPMediaPropertyPredicate predicateWithValue:MEMORY[0x1E4F1CC38] forProperty:@"isCompilation" comparisonType:109];
  id v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  uint64_t v7 = [(MPMediaQuery *)v2 initWithFilterPredicates:v6];

  [(MPMediaQuery *)v7 setGroupingType:1];

  return v7;
}

+ (id)audibleAudiobooksQuery
{
  unsigned __int8 v2 = [a1 audiobooksQuery];
  uint64_t v3 = [NSNumber numberWithInteger:1];
  uint64_t v4 = +[MPMediaPropertyPredicate predicateWithValue:v3 forProperty:@"isAudible"];
  [v2 addFilterPredicate:v4];

  return v2;
}

+ (id)videoITunesUQuery
{
  unsigned __int8 v2 = [MPMediaQuery alloc];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = [NSNumber numberWithInteger:4096];
  uint64_t v5 = +[MPMediaPropertyPredicate predicateWithValue:v4 forProperty:@"mediaType"];
  id v6 = [v3 setWithObject:v5];
  uint64_t v7 = [(MPMediaQuery *)v2 initWithFilterPredicates:v6];

  [(MPMediaQuery *)v7 setGroupingType:1];

  return v7;
}

+ (id)ITunesUAudioQuery
{
  unsigned __int8 v2 = [MPMediaQuery alloc];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = [NSNumber numberWithInteger:8];
  uint64_t v5 = +[MPMediaPropertyPredicate predicateWithValue:v4 forProperty:@"mediaType"];
  id v6 = [v3 setWithObject:v5];
  uint64_t v7 = [(MPMediaQuery *)v2 initWithFilterPredicates:v6];

  uint64_t v8 = [NSNumber numberWithBool:1];
  id v9 = +[MPMediaPropertyPredicate predicateWithValue:v8 forProperty:@"isITunesU"];
  [(MPMediaQuery *)v7 addFilterPredicate:v9];

  [(MPMediaQuery *)v7 setGroupingType:1];

  return v7;
}

+ (id)ITunesUQuery
{
  unsigned __int8 v2 = [MPMediaQuery alloc];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = +[MPMediaPropertyPredicate predicateWithValue:v4 forProperty:@"isITunesU"];
  id v6 = [v3 setWithObject:v5];
  uint64_t v7 = [(MPMediaQuery *)v2 initWithFilterPredicates:v6];

  [(MPMediaQuery *)v7 setGroupingType:1];

  return v7;
}

+ (MPMediaQuery)podcastsQuery
{
  unsigned __int8 v2 = [MPMediaQuery alloc];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = [NSNumber numberWithInteger:1026];
  uint64_t v5 = +[MPMediaPropertyPredicate predicateWithValue:v4 forProperty:@"mediaType"];
  id v6 = [v3 setWithObject:v5];
  uint64_t v7 = [(MPMediaQuery *)v2 initWithFilterPredicates:v6];

  [(MPMediaQuery *)v7 setGroupingType:7];

  return v7;
}

+ (MPMediaQuery)artistsQuery
{
  unsigned __int8 v2 = [MPMediaQuery alloc];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ECE48 forProperty:@"mediaType"];
  uint64_t v5 = +[MPMediaPropertyPredicate predicateWithValue:MEMORY[0x1E4F1CC28] forProperty:@"isCompilation" comparisonType:109];
  id v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  uint64_t v7 = [(MPMediaQuery *)v2 initWithFilterPredicates:v6];

  [(MPMediaQuery *)v7 setGroupingType:2];

  return v7;
}

- (MPMediaItemCollection)collectionByJoiningCollections
{
  unsigned __int8 v2 = (void *)[(MPMediaQuery *)self copy];
  [v2 setGroupingType:0];
  uint64_t v3 = [[MPMediaItemCollection alloc] initWithItemsQuery:v2];

  return v3;
}

- (BOOL)_updatePredicateForProperty:(id)a3 withPropertyPredicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MPMediaQuery *)self predicateForProperty:v6];
  id v9 = (void *)v8;
  if (!v7)
  {
    if (v8)
    {
      [(MPMediaQuery *)self removePredicatesForProperty:v6];
      goto LABEL_6;
    }
LABEL_7:
    BOOL v10 = 0;
    goto LABEL_8;
  }
  if ([v7 isEqual:v8]) {
    goto LABEL_7;
  }
  [(MPMediaQuery *)self removePredicatesForProperty:v6];
  [(MPMediaQuery *)self addFilterPredicate:v7];
LABEL_6:
  BOOL v10 = 1;
LABEL_8:

  return v10;
}

- (void)setFilterPropertyPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 property];
  [(MPMediaQuery *)self setFilterPredicate:v4 forProperty:v5];
}

- (void)setFilterPredicate:(id)a3 forProperty:(id)a4
{
  id v7 = a3;
  [(MPMediaQuery *)self removePredicatesForProperty:a4];
  id v6 = v7;
  if (v7)
  {
    [(MPMediaQuery *)self addFilterPredicate:v7];
    id v6 = v7;
  }
}

- (void)removePredicatesForProperty:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(MPMediaQuery *)self filterPredicates];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v10 property];
          int v12 = [v11 isEqualToString:v4];

          if (v12) {
            [(MPMediaQuery *)self removeFilterPredicate:v10];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (MPMediaPlaylist)containingPlaylist
{
  unsigned __int8 v2 = [(MPMediaQuery *)self predicateForProperty:@"playlistPersistentID"];
  uint64_t v3 = [v2 value];

  if (v3) {
    id v4 = -[MPMediaPlaylist initWithPersistentID:]([MPMediaPlaylist alloc], "initWithPersistentID:", [v3 unsignedLongLongValue]);
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)playbackHistoryPlaylist
{
  unsigned __int8 v2 = +[MPMediaLibrary deviceMediaLibrary];
  uint64_t v3 = [v2 playbackHistoryPlaylist];

  return v3;
}

+ (id)currentDevicePurchasesPlaylist
{
  unsigned __int8 v2 = +[MPMediaQuery playlistsQuery];
  uint64_t v3 = +[MPMediaPropertyPredicate predicateWithValue:MEMORY[0x1E4F1CC38] forProperty:@"isCurrentDevicePurchasesPlaylist"];
  [v2 addFilterPredicate:v3];

  id v4 = [v2 collections];
  if ([v4 count])
  {
    id v5 = [v4 objectAtIndex:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)activeGeniusPlaylist
{
  unsigned __int8 v2 = +[MPMediaLibrary defaultMediaLibrary];
  char v3 = [v2 isHomeSharingLibrary];

  if (v3)
  {
    id v4 = 0;
    goto LABEL_10;
  }
  id v5 = +[MPMediaQuery playlistsQuery];
  uint64_t v6 = [NSNumber numberWithBool:1];
  uint64_t v7 = +[MPMediaPropertyPredicate predicateWithValue:v6 forProperty:@"isActiveGeniusPlaylist"];
  [v5 addFilterPredicate:v7];

  uint64_t v8 = [v5 collections];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    BOOL v10 = [v5 collections];
    id v4 = [v10 objectAtIndex:0];
  }
  else
  {
    uint64_t v11 = +[MPMediaLibrary defaultMediaLibrary];
    int v12 = [v11 writable];

    if (!v12)
    {
      id v4 = 0;
      goto LABEL_9;
    }
    BOOL v10 = +[MPMediaLibrary defaultMediaLibrary];
    long long v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    long long v14 = [v13 localizedStringForKey:@"DEFAULT_GENIUS_PLAYLIST_NAME" value:&stru_1EE680640 table:@"MediaPlayer"];
    id v4 = [v10 addPlaylistWithName:v14 activeGeniusPlaylist:1];
  }
LABEL_9:

LABEL_10:

  return v4;
}

- (id)MPSD_mediaQueryForDownloadingEntities
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  char v3 = +[MPStoreDownloadManager sharedManager];
  id v4 = [v3 userDownloads];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (([v11 isFinished] & 1) == 0)
        {
          if (!v8) {
            id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          uint64_t v12 = [v11 libraryItemIdentifier];
          if (v12)
          {
            long long v13 = [NSNumber numberWithUnsignedLongLong:v12];
            [v8 addObject:v13];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  uint64_t v14 = [v8 count];
  if (v14)
  {
    uint64_t v15 = v14;
    long long v16 = malloc_type_malloc(8 * v14, 0x100004000313F17uLL);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = v8;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = 0;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v17);
          }
          v16[v20 + j] = [*(id *)(*((void *)&v26 + 1) + 8 * j) longLongValue];
        }
        v20 += j;
        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v19);
    }

    uint64_t v23 = +[MPMediaPersistentIDsPredicate predicateWithPersistentIDs:v16 count:v15 shouldContain:1];
    free(v16);
    uint64_t v24 = (void *)[(MPMediaQuery *)self copy];
    [v24 addFilterPredicate:v23];
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

- (id)MPSD_mediaQueryForDownloadableEntities
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = (void *)[(MPMediaQuery *)self copy];
  char v3 = +[MPStoreDownloadManager sharedManager];
  id v4 = [v3 userDownloads];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (([v11 isFinished] & 1) == 0)
        {
          if (!v8) {
            id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          uint64_t v12 = [v11 libraryItemIdentifier];
          if (v12)
          {
            long long v13 = [NSNumber numberWithUnsignedLongLong:v12];
            [v8 addObject:v13];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  uint64_t v14 = [v8 count];
  if (v14)
  {
    uint64_t v32 = v14;
    long long v33 = v2;
    uint64_t v15 = malloc_type_malloc(8 * v14, 0x100004000313F17uLL);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v16 = v8;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = 0;
      uint64_t v20 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v16);
          }
          v15[v19 + j] = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * j), "longLongValue", v32);
        }
        v19 += j;
        uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v18);
    }

    uint64_t v22 = +[MPMediaPersistentIDsPredicate predicateWithPersistentIDs:v15 count:v32 shouldContain:0];
    free(v15);
    unsigned __int8 v2 = v33;
  }
  else
  {
    uint64_t v22 = 0;
  }
  uint64_t v23 = +[MPMediaPropertyPredicate predicateWithValue:MEMORY[0x1E4F1CC28], @"isLocal", 0, v32 forProperty comparisonType];
  uint64_t v24 = [NSNumber numberWithBool:1];
  uint64_t v25 = +[MPMediaPropertyPredicate predicateWithValue:v24 forProperty:@"isTemporaryCloudDownload" comparisonType:0];

  v42[0] = v23;
  v42[1] = v25;
  long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  long long v27 = +[MPMediaCompoundPredicate predicateMatchingPredicates:v26];
  [v2 addFilterPredicate:v27];

  long long v28 = [NSNumber numberWithBool:1];
  long long v29 = +[MPMediaPropertyPredicate predicateWithValue:v28 forProperty:@"isStoreRedownloadable" comparisonType:0];
  [v2 addFilterPredicate:v29];

  if (v22) {
    [v2 addFilterPredicate:v22];
  }
  id v30 = v2;

  return v30;
}

- (BOOL)MPSD_hasDownloadingEntities
{
  unsigned __int8 v2 = [(MPMediaQuery *)self MPSD_mediaQueryForDownloadingEntities];
  char v3 = [v2 _hasItems];

  return v3;
}

- (BOOL)MPSD_hasDownloadableEntities
{
  unsigned __int8 v2 = [(MPMediaQuery *)self MPSD_mediaQueryForDownloadableEntities];
  char v3 = [v2 _hasItems];

  return v3;
}

@end