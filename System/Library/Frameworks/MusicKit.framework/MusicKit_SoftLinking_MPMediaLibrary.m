@interface MusicKit_SoftLinking_MPMediaLibrary
+ (MusicKit_SoftLinking_MPMediaLibrary)deviceLibrary;
+ (NSArray)sharedLibraries;
+ (NSString)availableMediaLibrariesDidChangeNotificationName;
+ (NSString)libraryConnectionProgressDidChangeNotificationName;
+ (NSString)libraryDidChangeNotificationName;
+ (NSString)libraryDynamicPropertiesDidChangeNotificationName;
+ (NSString)libraryStatusDidChangeNotificationName;
+ (void)_handleAvailableLibrariesDidChangeNotification:(id)a3;
+ (void)beginDiscoveringMediaLibraries;
+ (void)endDiscoveringMediaLibraries;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHomeSharingLibrary;
- (MPMediaLibrary)_underlyingMediaLibrary;
- (NSString)name;
- (NSString)uniqueIdentifier;
- (float)connectionProgress;
- (id)_initWithUnderlyingMediaLibrary:(id)a3;
- (int64_t)downloadSizeForModelObject:(id)a3 includingNonLibraryContent:(BOOL)a4;
- (int64_t)status;
- (unint64_t)hash;
- (void)_handleLibraryConnectionProgressDidChangeNotification:(id)a3;
- (void)_handleLibraryDidChangeNotification:(id)a3;
- (void)_handleLibraryDynamicPropertiesDidChangeNotification:(id)a3;
- (void)_handleLibraryStatusDidChangeNotification:(id)a3;
- (void)beginGeneratingLibraryChangeNotifications;
- (void)connectWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)disconnect;
- (void)endGeneratingLibraryChangeNotifications;
- (void)performOperation:(id)a3;
- (void)sdk_addItemToLibraryWithStoreID:(id)a3 completionHandler:(id)a4;
- (void)setUserRating:(double)a3 forItemWithPersistentID:(id)a4;
@end

@implementation MusicKit_SoftLinking_MPMediaLibrary

+ (NSString)libraryDynamicPropertiesDidChangeNotificationName
{
  return (NSString *)@"MusicKit_SoftLinking_MPMediaLibraryDynamicPropertiesDidChangeNotification";
}

+ (NSString)libraryDidChangeNotificationName
{
  return (NSString *)@"MusicKit_SoftLinking_MPMediaLibraryDidChangeNotification";
}

+ (MusicKit_SoftLinking_MPMediaLibrary)deviceLibrary
{
  if (deviceLibrary_sOnceToken[0] != -1) {
    dispatch_once(deviceLibrary_sOnceToken, &__block_literal_global_5);
  }
  v2 = (void *)deviceLibrary_sDeviceMediaLibrary;

  return (MusicKit_SoftLinking_MPMediaLibrary *)v2;
}

- (void)_handleLibraryDidChangeNotification:(id)a3
{
  v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  v6 = [v5 userInfo];

  [v7 postNotificationName:@"MusicKit_SoftLinking_MPMediaLibraryDidChangeNotification" object:self userInfo:v6];
}

- (id)_initWithUnderlyingMediaLibrary:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MusicKit_SoftLinking_MPMediaLibrary;
  v6 = [(MusicKit_SoftLinking_MPMediaLibrary *)&v16 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingMediaLibrary, a3);
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    v9 = getMPMediaLibraryDidChangeNotification();
    [v8 addObserver:v7 selector:sel__handleLibraryDidChangeNotification_ name:v9 object:v7->_underlyingMediaLibrary];

    v10 = getMPMediaLibraryDynamicPropertiesDidChangeNotification();
    [v8 addObserver:v7 selector:sel__handleLibraryDynamicPropertiesDidChangeNotification_ name:v10 object:v7->_underlyingMediaLibrary];

    v11 = getMPMediaLibraryConnectionProgressDidChange();
    [v8 addObserver:v7 selector:sel__handleLibraryConnectionProgressDidChangeNotification_ name:v11 object:v7->_underlyingMediaLibrary];

    v12 = getMPMediaLibraryStatusDidChangeNotification();
    [v8 addObserver:v7 selector:sel__handleLibraryStatusDidChangeNotification_ name:v12 object:v7->_underlyingMediaLibrary];

    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v13;

    [(NSOperationQueue *)v7->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v7->_operationQueue setName:@"com.apple.MusicKit.Library.operationQueue"];
    [(NSOperationQueue *)v7->_operationQueue setQualityOfService:25];
  }
  return v7;
}

- (void)beginGeneratingLibraryChangeNotifications
{
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  v4 = getMPMediaLibraryDidChangeNotification();
  [v3 removeObserver:self name:v4 object:self->_underlyingMediaLibrary];

  id v5 = getMPMediaLibraryDynamicPropertiesDidChangeNotification();
  [v3 removeObserver:self name:v5 object:self->_underlyingMediaLibrary];

  v6 = getMPMediaLibraryConnectionProgressDidChange();
  [v3 removeObserver:self name:v6 object:self->_underlyingMediaLibrary];

  id v7 = getMPMediaLibraryStatusDidChangeNotification();
  [v3 removeObserver:self name:v7 object:self->_underlyingMediaLibrary];

  v8.receiver = self;
  v8.super_class = (Class)MusicKit_SoftLinking_MPMediaLibrary;
  [(MusicKit_SoftLinking_MPMediaLibrary *)&v8 dealloc];
}

- (MPMediaLibrary)_underlyingMediaLibrary
{
  return self->_underlyingMediaLibrary;
}

- (NSString)uniqueIdentifier
{
  return (NSString *)[(MPMediaLibrary *)self->_underlyingMediaLibrary uniqueIdentifier];
}

- (NSString)name
{
  return (NSString *)[(MPMediaLibrary *)self->_underlyingMediaLibrary name];
}

- (void)endGeneratingLibraryChangeNotifications
{
}

- (void)performOperation:(id)a3
{
}

- (void)sdk_addItemToLibraryWithStoreID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  underlyingMediaLibrary = self->_underlyingMediaLibrary;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __89__MusicKit_SoftLinking_MPMediaLibrary_sdk_addItemToLibraryWithStoreID_completionHandler___block_invoke;
  v9[3] = &unk_264440128;
  id v10 = v6;
  id v8 = v6;
  [(MPMediaLibrary *)underlyingMediaLibrary addItemWithProductID:a3 completionHandler:v9];
}

- (int64_t)downloadSizeForModelObject:(id)a3 includingNonLibraryContent:(BOOL)a4
{
  BOOL v67 = a4;
  v77[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 _underlyingModelObject];
  id v7 = [v6 identifiers];
  id v8 = [v7 modelKind];
  v9 = [v8 identityKind];
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2050000000;
  id v10 = (void *)getMPModelAlbumKindClass_softClass;
  uint64_t v76 = getMPModelAlbumKindClass_softClass;
  if (!getMPModelAlbumKindClass_softClass)
  {
    uint64_t v68 = MEMORY[0x263EF8330];
    uint64_t v69 = 3221225472;
    v70 = __getMPModelAlbumKindClass_block_invoke;
    v71 = &unk_26443F950;
    v72 = &v73;
    __getMPModelAlbumKindClass_block_invoke((uint64_t)&v68);
    id v10 = (void *)v74[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v73, 8);
  v12 = [v11 identityKind];
  int v13 = [v9 isEqual:v12];

  if (v13)
  {
    id MPMediaPropertyPredicateClass = getMPMediaPropertyPredicateClass();
    v15 = NSNumber;
    objc_super v16 = [v7 library];
    v17 = objc_msgSend(v15, "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
    uint64_t v73 = 0;
    v74 = &v73;
    uint64_t v75 = 0x2020000000;
    v18 = (void *)getMPMediaItemPropertyAlbumPersistentIDSymbolLoc_ptr;
    uint64_t v76 = getMPMediaItemPropertyAlbumPersistentIDSymbolLoc_ptr;
    if (!getMPMediaItemPropertyAlbumPersistentIDSymbolLoc_ptr)
    {
      uint64_t v68 = MEMORY[0x263EF8330];
      uint64_t v69 = 3221225472;
      v70 = __getMPMediaItemPropertyAlbumPersistentIDSymbolLoc_block_invoke;
      v71 = &unk_26443F950;
      v72 = &v73;
      v19 = (void *)MediaPlayerLibrary_7();
      v20 = dlsym(v19, "MPMediaItemPropertyAlbumPersistentID");
      *(void *)(v72[1] + 24) = v20;
      getMPMediaItemPropertyAlbumPersistentIDSymbolLoc_ptr = *(void *)(v72[1] + 24);
      v18 = (void *)v74[3];
    }
    _Block_object_dispose(&v73, 8);
    if (!v18)
    {
LABEL_32:
      +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
      __break(1u);
    }
    v21 = [MPMediaPropertyPredicateClass predicateWithValue:v17 forProperty:*v18];

    uint64_t v73 = 0;
    v74 = &v73;
    uint64_t v75 = 0x2050000000;
    v22 = (void *)getMPMediaQueryClass_softClass;
    uint64_t v76 = getMPMediaQueryClass_softClass;
    if (!getMPMediaQueryClass_softClass)
    {
      uint64_t v68 = MEMORY[0x263EF8330];
      uint64_t v69 = 3221225472;
      v70 = __getMPMediaQueryClass_block_invoke;
      v71 = &unk_26443F950;
      v72 = &v73;
      __getMPMediaQueryClass_block_invoke((uint64_t)&v68);
      v22 = (void *)v74[3];
    }
    v23 = v22;
    _Block_object_dispose(&v73, 8);
    id v24 = [v23 alloc];
    v25 = [MEMORY[0x263EFFA08] setWithObject:v21];
    uint64_t v26 = [v24 initWithFilterPredicates:v25];
  }
  else
  {
    v27 = [v7 modelKind];
    v28 = [v27 identityKind];
    uint64_t v73 = 0;
    v74 = &v73;
    uint64_t v75 = 0x2050000000;
    v29 = (void *)getMPModelPlaylistKindClass_softClass_0;
    uint64_t v76 = getMPModelPlaylistKindClass_softClass_0;
    if (!getMPModelPlaylistKindClass_softClass_0)
    {
      uint64_t v68 = MEMORY[0x263EF8330];
      uint64_t v69 = 3221225472;
      v70 = __getMPModelPlaylistKindClass_block_invoke_0;
      v71 = &unk_26443F950;
      v72 = &v73;
      __getMPModelPlaylistKindClass_block_invoke_0((uint64_t)&v68);
      v29 = (void *)v74[3];
    }
    id v30 = v29;
    _Block_object_dispose(&v73, 8);
    v31 = [v30 identityKind];
    int v32 = [v28 isEqual:v31];

    if (!v32)
    {
      int64_t v65 = 0;
      goto LABEL_31;
    }
    v33 = [getMPMediaLibraryClass() defaultMediaLibrary];
    v34 = [v7 library];
    v21 = objc_msgSend(v33, "playlistWithPersistentID:", objc_msgSend(v34, "persistentID"));

    v25 = [v21 itemsQuery];
    uint64_t v26 = [v25 copy];
  }
  v35 = (void *)v26;

  [v35 setMediaLibrary:self->_underlyingMediaLibrary];
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2050000000;
  v36 = (void *)getMPMediaCompoundAllPredicateClass_softClass;
  uint64_t v76 = getMPMediaCompoundAllPredicateClass_softClass;
  if (!getMPMediaCompoundAllPredicateClass_softClass)
  {
    uint64_t v68 = MEMORY[0x263EF8330];
    uint64_t v69 = 3221225472;
    v70 = __getMPMediaCompoundAllPredicateClass_block_invoke;
    v71 = &unk_26443F950;
    v72 = &v73;
    __getMPMediaCompoundAllPredicateClass_block_invoke((uint64_t)&v68);
    v36 = (void *)v74[3];
  }
  id v37 = v36;
  _Block_object_dispose(&v73, 8);
  id v38 = getMPMediaPropertyPredicateClass();
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  v39 = (id *)getMPMediaEntityPropertyKeepLocalSymbolLoc_ptr;
  uint64_t v76 = getMPMediaEntityPropertyKeepLocalSymbolLoc_ptr;
  if (!getMPMediaEntityPropertyKeepLocalSymbolLoc_ptr)
  {
    uint64_t v68 = MEMORY[0x263EF8330];
    uint64_t v69 = 3221225472;
    v70 = __getMPMediaEntityPropertyKeepLocalSymbolLoc_block_invoke;
    v71 = &unk_26443F950;
    v72 = &v73;
    v40 = (void *)MediaPlayerLibrary_7();
    v41 = dlsym(v40, "MPMediaEntityPropertyKeepLocal");
    *(void *)(v72[1] + 24) = v41;
    getMPMediaEntityPropertyKeepLocalSymbolLoc_ptr = *(void *)(v72[1] + 24);
    v39 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v39) {
    goto LABEL_32;
  }
  id v42 = *v39;
  v43 = [v38 predicateWithValue:&unk_26CDC51D8 forProperty:v42 comparisonType:100];
  v77[0] = v43;
  id v44 = getMPMediaPropertyPredicateClass();
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  v45 = (id *)getMPMediaEntityPropertyKeepLocalStatusSymbolLoc_ptr;
  uint64_t v76 = getMPMediaEntityPropertyKeepLocalStatusSymbolLoc_ptr;
  if (!getMPMediaEntityPropertyKeepLocalStatusSymbolLoc_ptr)
  {
    uint64_t v68 = MEMORY[0x263EF8330];
    uint64_t v69 = 3221225472;
    v70 = __getMPMediaEntityPropertyKeepLocalStatusSymbolLoc_block_invoke;
    v71 = &unk_26443F950;
    v72 = &v73;
    v46 = (void *)MediaPlayerLibrary_7();
    v47 = dlsym(v46, "MPMediaEntityPropertyKeepLocalStatus");
    *(void *)(v72[1] + 24) = v47;
    getMPMediaEntityPropertyKeepLocalStatusSymbolLoc_ptr = *(void *)(v72[1] + 24);
    v45 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v45) {
    goto LABEL_32;
  }
  id v48 = *v45;
  v49 = [v44 predicateWithValue:&unk_26CDC51F0 forProperty:v48 comparisonType:100];
  v77[1] = v49;
  v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:2];
  v51 = [v37 predicateMatchingPredicates:v50];

  v52 = (void *)[v35 copy];
  [v52 addFilterPredicate:v51];
  if (v67) {
    [v52 setShouldIncludeNonLibraryEntities:1];
  }
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  v53 = (id *)getMPMediaQueryAggregateFunctionTotalSymbolLoc_ptr;
  uint64_t v76 = getMPMediaQueryAggregateFunctionTotalSymbolLoc_ptr;
  if (!getMPMediaQueryAggregateFunctionTotalSymbolLoc_ptr)
  {
    uint64_t v68 = MEMORY[0x263EF8330];
    uint64_t v69 = 3221225472;
    v70 = __getMPMediaQueryAggregateFunctionTotalSymbolLoc_block_invoke;
    v71 = &unk_26443F950;
    v72 = &v73;
    v54 = (void *)MediaPlayerLibrary_7();
    v55 = dlsym(v54, "MPMediaQueryAggregateFunctionTotal");
    *(void *)(v72[1] + 24) = v55;
    getMPMediaQueryAggregateFunctionTotalSymbolLoc_ptr = *(void *)(v72[1] + 24);
    v53 = (id *)v74[3];
  }
  _Block_object_dispose(&v73, 8);
  if (!v53) {
    goto LABEL_32;
  }
  id v56 = *v53;
  v57 = getMPMediaItemPropertyFileSize();
  v58 = [v52 valueForAggregateFunction:v56 onItemsForProperty:v57];

  uint64_t v59 = [v58 longLongValue];
  id v60 = getMPMediaPropertyPredicateClass();
  v61 = getMPMediaItemPropertyFileSize();
  v62 = [v60 predicateWithValue:&unk_26CDC5208 forProperty:v61];

  v63 = (void *)[v35 copy];
  [v63 addFilterPredicate:v62];
  if (v67) {
    [v63 setShouldIncludeNonLibraryEntities:1];
  }
  uint64_t v64 = [v63 _countOfItems];

  int64_t v65 = v59 + 7000000 * v64;
LABEL_31:

  return v65;
}

- (void)setUserRating:(double)a3 forItemWithPersistentID:(id)a4
{
  id v6 = a4;
  id v7 = -[MPMediaLibrary itemWithPersistentID:](self->_underlyingMediaLibrary, "itemWithPersistentID:", [v6 integerValue]);
  id v8 = [NSNumber numberWithDouble:a3 * 5.0];
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  v9 = (void *)getMPMediaItemPropertyRatingSymbolLoc_ptr;
  uint64_t v15 = getMPMediaItemPropertyRatingSymbolLoc_ptr;
  if (!getMPMediaItemPropertyRatingSymbolLoc_ptr)
  {
    id v10 = (void *)MediaPlayerLibrary_7();
    v13[3] = (uint64_t)dlsym(v10, "MPMediaItemPropertyRating");
    getMPMediaItemPropertyRatingSymbolLoc_ptr = v13[3];
    v9 = (void *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v9)
  {
    id v11 = (_Unwind_Exception *)+[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:]();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v11);
  }
  [v7 setValue:v8 forProperty:*v9];
}

+ (void)beginDiscoveringMediaLibraries
{
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  v3 = getMPMediaLibraryAvailableMediaLibrariesDidChangeNotification();
  [v4 addObserver:a1 selector:sel__handleAvailableLibrariesDidChangeNotification_ name:v3 object:0];

  [getMPMediaLibraryClass() beginDiscoveringMediaLibraries];
}

+ (void)endDiscoveringMediaLibraries
{
  [getMPMediaLibraryClass() endDiscoveringMediaLibraries];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  v3 = getMPMediaLibraryAvailableMediaLibrariesDidChangeNotification();
  [v4 removeObserver:a1 name:v3 object:0];
}

+ (NSArray)sharedLibraries
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = objc_msgSend(getMPMediaLibraryClass(), "sharedMediaLibraries", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)[objc_alloc((Class)a1) _initWithUnderlyingMediaLibrary:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = (void *)[v3 copy];

  return (NSArray *)v10;
}

- (int64_t)status
{
  int64_t result = [(MPMediaLibrary *)self->_underlyingMediaLibrary status];
  if ((unint64_t)(result - 1) >= 3) {
    return 0;
  }
  return result;
}

- (float)connectionProgress
{
  [(MPMediaLibrary *)self->_underlyingMediaLibrary connectionProgress];
  return result;
}

- (BOOL)isHomeSharingLibrary
{
  return [(MPMediaLibrary *)self->_underlyingMediaLibrary isHomeSharingLibrary];
}

- (void)connectWithCompletionHandler:(id)a3
{
}

- (void)disconnect
{
}

+ (NSString)availableMediaLibrariesDidChangeNotificationName
{
  return (NSString *)@"MusicKit_SoftLinking_MPMediaLibraryAvailableMediaLibrariesDidChangeNotification";
}

+ (NSString)libraryConnectionProgressDidChangeNotificationName
{
  return (NSString *)@"MusicKit_SoftLinking_MPMediaLibraryConnectionProgressDidChangeNotification";
}

+ (NSString)libraryStatusDidChangeNotificationName
{
  return (NSString *)@"MusicKit_SoftLinking_MPMediaLibraryStatusDidChangeNotification";
}

- (void)_handleLibraryDynamicPropertiesDidChangeNotification:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  uint64_t v6 = [v5 userInfo];

  [v7 postNotificationName:@"MusicKit_SoftLinking_MPMediaLibraryDynamicPropertiesDidChangeNotification" object:self userInfo:v6];
}

+ (void)_handleAvailableLibrariesDidChangeNotification:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08A00];
  id v4 = a3;
  id v6 = [v3 defaultCenter];
  id v5 = [v4 userInfo];

  [v6 postNotificationName:@"MusicKit_SoftLinking_MPMediaLibraryAvailableMediaLibrariesDidChangeNotification" object:0 userInfo:v5];
}

- (void)_handleLibraryConnectionProgressDidChangeNotification:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  id v6 = [v5 userInfo];

  [v7 postNotificationName:@"MusicKit_SoftLinking_MPMediaLibraryConnectionProgressDidChangeNotification" object:self userInfo:v6];
}

- (void)_handleLibraryStatusDidChangeNotification:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  id v6 = [v5 userInfo];

  [v7 postNotificationName:@"MusicKit_SoftLinking_MPMediaLibraryStatusDidChangeNotification" object:self userInfo:v6];
}

- (unint64_t)hash
{
  return [(MPMediaLibrary *)self->_underlyingMediaLibrary hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MusicKit_SoftLinking_MPMediaLibrary *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      underlyingMediaLibrary = self->_underlyingMediaLibrary;
      id v6 = [(MusicKit_SoftLinking_MPMediaLibrary *)v4 _underlyingMediaLibrary];
      char v7 = [(MPMediaLibrary *)underlyingMediaLibrary isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_underlyingMediaLibrary, 0);
}

@end