@interface MPMediaLibraryDataProviderML3
+ (NSArray)onDiskProviders;
+ (id)_unadjustedValueForItemDateWithDefaultValue:(id)a3;
+ (id)_unadjustedValueForItemPropertyRatingWithDefaultValue:(id)a3;
+ (id)_unadjustedValueForItemPropertyVolumeAdjustmentWithDefaultValue:(id)a3;
+ (id)_unadjustedValueForItemPropertyVolumeNormalizationWithDefaultValue:(id)a3;
+ (id)_unadjustedValueForItemTimeWithDefaultValue:(id)a3;
+ (id)_unadjustedValueForMPProperty:(id)a3 withDefaultValue:(id)a4;
+ (id)uniqueIdentifierForLibrary:(id)a3;
- (BOOL)_dataProviderSupportsEntityChangeTracking;
- (BOOL)_removeEntitiesWithIdentifiers:(int64_t *)a3 count:(unint64_t)a4 entityClass:(Class)a5;
- (BOOL)collectionExistsContainedWithinPersistentIDs:(const unint64_t *)a3 count:(unint64_t)a4 groupingType:(int64_t)a5 existentPID:(unint64_t *)a6;
- (BOOL)collectionExistsContainedWithinSyncIDs:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5;
- (BOOL)collectionExistsWithCloudLibraryID:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5;
- (BOOL)collectionExistsWithCloudUniversalLibraryID:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5;
- (BOOL)collectionExistsWithName:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5;
- (BOOL)collectionExistsWithPersistentID:(unint64_t)a3 groupingType:(int64_t)a4;
- (BOOL)collectionExistsWithSagaID:(int64_t)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5;
- (BOOL)collectionExistsWithStoreID:(int64_t)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5;
- (BOOL)deleteDatabaseProperty:(id)a3;
- (BOOL)deleteItemsWithIdentifiers:(int64_t *)a3 count:(unint64_t)a4;
- (BOOL)hasGeniusMixes;
- (BOOL)hasMediaOfType:(unint64_t)a3;
- (BOOL)hasUbiquitousBookmarkableItems;
- (BOOL)importOriginalArtworkFromImageData:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unint64_t)a7;
- (BOOL)isCurrentThreadInTransaction;
- (BOOL)itemExistsWithPersistentID:(unint64_t)a3;
- (BOOL)performTransactionWithBlock:(id)a3;
- (BOOL)playlistExistsWithPersistentID:(unint64_t)a3;
- (BOOL)removeItemsWithIdentifiers:(int64_t *)a3 count:(unint64_t)a4;
- (BOOL)removePlaylistWithIdentifier:(int64_t)a3;
- (BOOL)setValue:(id)a3 forDatabaseProperty:(id)a4;
- (BOOL)writable;
- (ICUserIdentity)userIdentity;
- (ML3MusicLibrary)library;
- (MPArtworkDataSource)artworkDataSource;
- (MPMediaEntityCache)entityCache;
- (MPMediaLibrary)mediaLibrary;
- (MPMediaLibraryDataProviderML3)initWithLibrary:(id)a3;
- (NSArray)localizedSectionIndexTitles;
- (NSArray)preferredAudioLanguages;
- (NSArray)preferredSubtitleLanguages;
- (NSString)accountDSID;
- (NSString)databasePath;
- (NSString)description;
- (NSString)name;
- (NSString)syncValidity;
- (NSString)uniqueIdentifier;
- (id)ML3SystemFilterPredicatesWithGroupingType:(int64_t)a3 cloudTrackFilteringType:(int64_t)a4 subscriptionFilteringOptions:(int64_t)a5 additionalFilterPredicates:(id)a6;
- (id)_adjustedItemDateOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedItemNonnullDateOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedItemPropertyAssetURLOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedItemPropertyBookletsOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedItemPropertyChapterArtworkTimesOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedItemPropertyChaptersOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedItemPropertyContentRatingOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedItemPropertyEQPresetOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedItemPropertyEpisodeNumberOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedItemPropertyFilePathOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedItemPropertyMovieInfoOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedItemPropertyRatingOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedItemPropertySeasonNameOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedItemPropertySeasonNumberOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedItemPropertyVerifiedIntegrityOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedItemPropertyVolumeAdjustmentOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedItemPropertyVolumeNormalizationOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedItemTimeOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedPlaylistPropertySeedItemsOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_adjustedPropertyMediaTypeOfEntity:(id)a3 withDefaultValue:(id)a4;
- (id)_storePlatformRequestContext;
- (id)_userSocialProfileID;
- (id)adjustedValueForMPProperty:(id)a3 ofEntity:(id)a4 withDefaultValue:(id)a5;
- (id)collectionResultSetForQueryCriteria:(id)a3;
- (id)itemResultSetForQueryCriteria:(id)a3;
- (id)lastModifiedDate;
- (id)localizedSectionHeaderForSectionIndex:(unint64_t)a3;
- (id)multiverseIdentifierForCollectionWithPersistentID:(int64_t)a3 groupingType:(int64_t)a4;
- (id)multiverseIdentifierForTrackWithPersistentID:(int64_t)a3;
- (id)systemFilterPredicatesWithGroupingType:(int64_t)a3 cloudTrackFilteringType:(int64_t)a4 subscriptionFilteringOptions:(int64_t)a5;
- (id)valueForDatabaseProperty:(id)a3;
- (int64_t)addPlaylistWithValuesForProperties:(id)a3;
- (int64_t)addPlaylistWithValuesForProperties:(id)a3 trackList:(id)a4 playlistEntryProperties:(id)a5;
- (int64_t)favoriteSongsPlaylistPersistentID;
- (int64_t)itemPersistentIDForStoreID:(int64_t)a3;
- (int64_t)photosMemoriesPlaylistPersistentID;
- (int64_t)playbackHistoryPlaylistPersistentID;
- (int64_t)playlistGeneration;
- (int64_t)sdk_addPlaylistWithValuesForProperties:(id)a3;
- (unint64_t)currentEntityRevision;
- (unint64_t)syncGenerationID;
- (void)_addGlobalPlaylistsToLibraryDatabase:(id)a3 asLibraryOwned:(BOOL)a4 completion:(id)a5;
- (void)_coalesceEvents;
- (void)_displayValuesDidChange:(id)a3;
- (void)_dynamicPropertiesDidChange:(id)a3;
- (void)_importStoreAlbumArtistElements:(id)a3 withReferralObject:(id)a4 withCompletion:(id)a5;
- (void)_importStoreItemElements:(id)a3 withReferralObject:(id)a4 addTracksToDeviceLibraryOnly:(BOOL)a5 andAddTracksToCloudLibrary:(BOOL)a6 usingCloudAdamID:(int64_t)a7 withCompletion:(id)a8;
- (void)_invalidatePersistentKeysForIdentifiers:(int64_t *)a3 count:(unint64_t)a4;
- (void)_invisiblePropertiesDidChange:(id)a3;
- (void)_libraryCloudLibraryAvailabilityDidChange:(id)a3;
- (void)_libraryContentsDidChange:(id)a3;
- (void)_libraryEntitiesAddedOrRemoved:(id)a3;
- (void)_libraryPathDidChange:(id)a3;
- (void)_libraryUIDDidChange:(id)a3;
- (void)_loadProperties:(id)a3 ofEntityWithIdentifier:(int64_t)a4 ML3EntityClass:(Class)a5 completionBlock:(id)a6;
- (void)_loadValueForAggregateFunction:(id)a3 entityClass:(Class)a4 property:(id)a5 query:(id)a6 completionBlock:(id)a7;
- (void)_postEvents;
- (void)_syncGenerationDidChange:(id)a3;
- (void)_updateArtworkDataSourceMediaLibraryUniqueIdentifier;
- (void)addGlobalPlaylistWithID:(id)a3 andAddToCloudLibrary:(BOOL)a4 completion:(id)a5;
- (void)addItemWithIdentifier:(int64_t)a3 toPlaylistWithIdentifier:(int64_t)a4 completionBlock:(id)a5;
- (void)addItemsWithIdentifiers:(id)a3 andEntryProperties:(id)a4 toPlaylistWithIdentifier:(int64_t)a5 completionBlock:(id)a6;
- (void)addItemsWithIdentifiers:(id)a3 toPlaylistWithIdentifier:(int64_t)a4 completionBlock:(id)a5;
- (void)addNonLibraryOwnedPlaylistsWithGlobalIDs:(id)a3 completion:(id)a4;
- (void)addPlaylistStoreItemsForLookupItems:(id)a3 withCompletion:(id)a4;
- (void)addToLocalDeviceLibraryGlobalPlaylistWithID:(id)a3 completion:(id)a4;
- (void)addTracksToMyLibrary:(id)a3;
- (void)clearLocationPropertiesOfItemWithIdentifier:(int64_t)a3;
- (void)dealloc;
- (void)enumerateCollectionIdentifiersForQueryCriteria:(id)a3 ordered:(BOOL)a4 cancelBlock:(id)a5 usingBlock:(id)a6;
- (void)enumerateEntityChangesAfterSyncAnchor:(id)a3 maximumRevisionType:(int64_t)a4 inUsersLibrary:(BOOL)a5 itemBlock:(id)a6 collectionBlock:(id)a7;
- (void)enumerateItemIdentifiersForQueryCriteria:(id)a3 ordered:(BOOL)a4 cancelBlock:(id)a5 usingBlock:(id)a6;
- (void)importArtworkTokenForEntityPersistentID:(unint64_t)a3 entityType:(int64_t)a4 artworkToken:(id)a5 artworkType:(int64_t)a6 sourceType:(int64_t)a7;
- (void)loadProperties:(id)a3 ofCollectionWithIdentifier:(int64_t)a4 groupingType:(int64_t)a5 completionBlock:(id)a6;
- (void)loadProperties:(id)a3 ofItemWithIdentifier:(int64_t)a4 completionBlock:(id)a5;
- (void)loadQueryCriteria:(id)a3 countOfCollectionsWithCompletionBlock:(id)a4;
- (void)loadQueryCriteria:(id)a3 countOfItemsWithCompletionBlock:(id)a4;
- (void)loadQueryCriteria:(id)a3 hasCollectionsWithCompletionBlock:(id)a4;
- (void)loadQueryCriteria:(id)a3 hasItemsWithCompletionBlock:(id)a4;
- (void)loadValueForAggregateFunction:(id)a3 onCollectionsForProperty:(id)a4 queryCriteria:(id)a5 completionBlock:(id)a6;
- (void)loadValueForAggregateFunction:(id)a3 onItemsForProperty:(id)a4 queryCriteria:(id)a5 completionBlock:(id)a6;
- (void)moveItemFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 inPlaylistWithIdentifier:(int64_t)a5 completionBlock:(id)a6;
- (void)performBackgroundTaskWithBlock:(id)a3;
- (void)performReadTransactionWithBlock:(id)a3;
- (void)performStoreAlbumArtistLibraryImport:(id)a3 withCompletion:(id)a4;
- (void)performStoreItemLibraryImport:(id)a3 withCompletion:(id)a4;
- (void)populateLocationPropertiesOfItemWithIdentifier:(int64_t)a3 withPath:(id)a4 assetProtectionType:(int64_t)a5;
- (void)populateLocationPropertiesOfItemWithIdentifier:(int64_t)a3 withPath:(id)a4 assetProtectionType:(int64_t)a5 completionBlock:(id)a6;
- (void)removeAllItemsInPlaylistWithIdentifier:(int64_t)a3;
- (void)removeArtworkForEntityPersistentID:(unint64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6;
- (void)removeFirstItemFromPlaylistWithIdentifier:(int64_t)a3;
- (void)removeItemsAtIndexes:(id)a3 inPlaylistWithIdentifier:(int64_t)a4 completionBlock:(id)a5;
- (void)sdk_addItemWithOpaqueID:(id)a3 withCompletion:(id)a4;
- (void)sdk_addItemWithOpaqueIdentifier:(id)a3 toPlaylistWithIdentifier:(int64_t)a4 completionBlock:(id)a5;
- (void)sdk_addItemWithSagaIdentifier:(int64_t)a3 toPlaylistWithIdentifier:(int64_t)a4 completionBlock:(id)a5;
- (void)setItemsWithIdentifiers:(id)a3 andEntryProperties:(id)a4 forPlaylistWithIdentifier:(int64_t)a5 completionBlock:(id)a6;
- (void)setItemsWithIdentifiers:(id)a3 forPlaylistWithIdentifier:(int64_t)a4 completionBlock:(id)a5;
- (void)setLibrary:(id)a3;
- (void)setLibraryContainerFilterPredicatesWithCloudFilteringType:(int64_t)a3 additionalFilterPredicates:(id)a4;
- (void)setLibraryEntityFilterPredicatesWithCloudFilteringType:(int64_t)a3 additionalFilterPredicates:(id)a4;
- (void)setLibraryPublicContainerFilterPredicatesWithCloudFilteringType:(int64_t)a3 additionalFilterPredicates:(id)a4;
- (void)setLibraryPublicEntityFilterPredicatesWithCloudFilteringType:(int64_t)a3 additionalFilterPredicates:(id)a4;
- (void)setMediaLibrary:(id)a3;
- (void)setReactionText:(id)a3 onEntryAtPosition:(unint64_t)a4 inPlaylistWithIdentifier:(int64_t)a5 completion:(id)a6;
- (void)setUserIdentity:(id)a3;
- (void)setValue:(id)a3 forProperty:(id)a4 ofCollectionWithIdentifier:(int64_t)a5 groupingType:(int64_t)a6 completionBlock:(id)a7;
- (void)setValue:(id)a3 forProperty:(id)a4 ofItemWithIdentifier:(int64_t)a5 completionBlock:(id)a6;
- (void)setValue:(id)a3 forProperty:(id)a4 ofPlaylistWithIdentifier:(int64_t)a5 completionBlock:(id)a6;
- (void)setValues:(id)a3 forProperties:(id)a4 forItemPersistentIDs:(id)a5;
- (void)setValuesForProperties:(id)a3 trackList:(id)a4 andEntryProperties:(id)a5 ofPlaylistWithIdentifier:(int64_t)a6 completionBlock:(id)a7;
@end

@implementation MPMediaLibraryDataProviderML3

- (void)loadProperties:(id)a3 ofItemWithIdentifier:(int64_t)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(MPMediaLibraryDataProviderML3 *)self _loadProperties:v9 ofEntityWithIdentifier:a4 ML3EntityClass:objc_opt_class() completionBlock:v8];
}

- (void)_loadProperties:(id)a3 ofEntityWithIdentifier:(int64_t)a4 ML3EntityClass:(Class)a5 completionBlock:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = (void (**)(id, void))a6;
  uint64_t v12 = [v10 count];
  if (v12)
  {
    uint64_t v13 = v12;
    int64_t v35 = a4;
    v36 = self;
    v40 = v11;
    v39 = (void *)MEMORY[0x19971DE60]();
    v38 = &v34;
    v14 = (char *)&v34 - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v14, 8 * v13);
    uint64_t v37 = 8 * v13;
    bzero(v14, 8 * v13);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v43 = 0u;
    long long v42 = 0u;
    id v41 = v10;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v15);
          }
          v21 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          v22 = [(objc_class *)a5 propertyForMPMediaEntityProperty:v21];
          if (v22)
          {
            objc_storeStrong((id *)&v14[8 * v18], v21);
            objc_storeStrong((id *)&v14[8 * v18++], v22);
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v17);
    }
    else
    {
      uint64_t v18 = 0;
    }

    v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v18];
    if (v18)
    {
      uint64_t v34 = (uint64_t)&v34;
      v24 = (uint64_t *)((char *)&v34 - ((8 * v18 + 15) & 0xFFFFFFFFFFFFFFF0));
      bzero(v24, 8 * v18);
      v25 = v36;
      v26 = (void *)[(objc_class *)a5 newWithPersistentID:v35 inLibrary:v36->_library];
      [v26 getValues:v24 forProperties:v14 count:v18];
      v27 = v14;
      do
      {
        uint64_t v29 = *(void *)v27;
        v27 += 8;
        uint64_t v28 = v29;
        uint64_t v30 = *v24++;
        v31 = [(MPMediaLibraryDataProviderML3 *)v25 adjustedValueForMPProperty:v28 ofEntity:v26 withDefaultValue:v30];
        [v23 setValue:v31 forKey:v28];

        --v18;
      }
      while (v18);
    }
    v11 = v40;
    ((void (**)(id, void *))v40)[2](v40, v23);

    uint64_t v32 = v37;
    uint64_t v33 = v37;
    do
    {

      v33 -= 8;
    }
    while (v33);
    id v10 = v41;
    do
    {

      v32 -= 8;
    }
    while (v32);
  }
  else
  {
    v11[2](v11, MEMORY[0x1E4F1CC08]);
  }
}

- (id)adjustedValueForMPProperty:(id)a3 ofEntity:(id)a4 withDefaultValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (adjustedValueForMPProperty_ofEntity_withDefaultValue__onceToken != -1) {
    dispatch_once(&adjustedValueForMPProperty_ofEntity_withDefaultValue__onceToken, &__block_literal_global_271);
  }
  v11 = (const char *)NSMapGet((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, v8);
  if (v11)
  {
    objc_msgSend(self, v11, v9, v10);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = v10;
  }
  uint64_t v13 = v12;

  return v13;
}

- (id)_adjustedPropertyMediaTypeOfEntity:(id)a3 withDefaultValue:(id)a4
{
  v4 = NSNumber;
  uint64_t v5 = MPMediaTypeForMLMediaType(objc_msgSend(a4, "integerValue", a3));

  return (id)[v4 numberWithUnsignedInteger:v5];
}

- (id)_adjustedItemNonnullDateOfEntity:(id)a3 withDefaultValue:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  objc_msgSend(a4, "doubleValue", a3);

  return (id)objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
}

- (void)setLibraryPublicEntityFilterPredicatesWithCloudFilteringType:(int64_t)a3 additionalFilterPredicates:(id)a4
{
  id v5 = [(MPMediaLibraryDataProviderML3 *)self ML3SystemFilterPredicatesWithGroupingType:0 cloudTrackFilteringType:a3 subscriptionFilteringOptions:1 additionalFilterPredicates:a4];
  [(ML3MusicLibrary *)self->_library setLibraryPublicEntityFilterPredicates:v5];
}

- (void)setLibraryEntityFilterPredicatesWithCloudFilteringType:(int64_t)a3 additionalFilterPredicates:(id)a4
{
  id v5 = [(MPMediaLibraryDataProviderML3 *)self ML3SystemFilterPredicatesWithGroupingType:0 cloudTrackFilteringType:a3 subscriptionFilteringOptions:0 additionalFilterPredicates:a4];
  [(ML3MusicLibrary *)self->_library setLibraryEntityFilterPredicates:v5];
}

- (void)setLibraryContainerFilterPredicatesWithCloudFilteringType:(int64_t)a3 additionalFilterPredicates:(id)a4
{
  id v5 = [(MPMediaLibraryDataProviderML3 *)self ML3SystemFilterPredicatesWithGroupingType:6 cloudTrackFilteringType:a3 subscriptionFilteringOptions:0 additionalFilterPredicates:a4];
  [(ML3MusicLibrary *)self->_library setLibraryContainerFilterPredicates:v5];
}

- (MPMediaLibraryDataProviderML3)initWithLibrary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MPMediaLibraryDataProviderML3;
  v6 = [(MPMediaLibraryDataProviderML3 *)&v24 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_library, a3);
    id v8 = [[MPMediaEntityCache alloc] initWithMediaLibraryDataProvider:v7];
    entityCache = v7->_entityCache;
    v7->_entityCache = v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.MPMediaLibraryDataProviderML3.backgroundTask", 0);
    backgroundTaskQueue = v7->_backgroundTaskQueue;
    v7->_backgroundTaskQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.MPMediaLibraryDataProviderML3.cloudUpdateQueue", 0);
    cloudUpdateQueue = v7->_cloudUpdateQueue;
    v7->_cloudUpdateQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.MPMediaLibraryDataProviderML3.entitiesAddedOrRemovedNotificationQueue", 0);
    entitiesAddedOrRemovedNotificationQueue = v7->_entitiesAddedOrRemovedNotificationQueue;
    v7->_entitiesAddedOrRemovedNotificationQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = objc_alloc_init(MPMediaLibraryArtworkDataSource);
    objc_storeStrong((id *)&v7->_artworkDataSource, v16);
    uint64_t v17 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    setValuesWidthLimitedQueue = v7->_setValuesWidthLimitedQueue;
    v7->_setValuesWidthLimitedQueue = v17;

    [(NSOperationQueue *)v7->_setValuesWidthLimitedQueue setMaxConcurrentOperationCount:5];
    if (v7->_library)
    {
      uint64_t v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v19 addObserver:v7 selector:sel__libraryContentsDidChange_ name:*MEMORY[0x1E4F79378] object:v7->_library];
      [v19 addObserver:v7 selector:sel__libraryEntitiesAddedOrRemoved_ name:*MEMORY[0x1E4F79388] object:v7->_library];
      [v19 addObserver:v7 selector:sel__dynamicPropertiesDidChange_ name:*MEMORY[0x1E4F79398] object:v7->_library];
      [v19 addObserver:v7 selector:sel__invisiblePropertiesDidChange_ name:*MEMORY[0x1E4F79390] object:v7->_library];
      [v19 addObserver:v7 selector:sel__displayValuesDidChange_ name:*MEMORY[0x1E4F79380] object:v7->_library];
      [v19 addObserver:v7 selector:sel__syncGenerationDidChange_ name:*MEMORY[0x1E4F793A8] object:v7->_library];
      [v19 addObserver:v7 selector:sel__libraryUIDDidChange_ name:*MEMORY[0x1E4F793B0] object:v7->_library];
      [v19 addObserver:v7 selector:sel__libraryCloudLibraryAvailabilityDidChange_ name:*MEMORY[0x1E4F79370] object:v7->_library];
      [v19 addObserver:v7 selector:sel__libraryPathDidChange_ name:*MEMORY[0x1E4F793A0] object:v7->_library];
    }
    v20 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      library = v7->_library;
      v22 = [(ML3MusicLibrary *)library debugDescription];
      *(_DWORD *)buf = 134218498;
      v26 = v7;
      __int16 v27 = 2048;
      uint64_t v28 = library;
      __int16 v29 = 2114;
      uint64_t v30 = v22;
      _os_log_impl(&dword_1952E8000, v20, OS_LOG_TYPE_DEFAULT, "DataProvider %p init with MusicLibrary=%p (description=%{public}@)", buf, 0x20u);
    }
    [(MPMediaLibraryDataProviderML3 *)v7 _updateArtworkDataSourceMediaLibraryUniqueIdentifier];
  }
  return v7;
}

- (void)_updateArtworkDataSourceMediaLibraryUniqueIdentifier
{
  id v5 = [(MPMediaLibraryDataProviderML3 *)self artworkDataSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(MPMediaLibraryDataProviderML3 *)self artworkDataSource];
    v4 = [(id)objc_opt_class() uniqueIdentifierForLibrary:self->_library];
    [v3 setMediaLibraryUniqueIdentifier:v4];
  }
}

+ (id)uniqueIdentifierForLibrary:(id)a3
{
  v3 = [a3 libraryUID];
  v4 = v3;
  if (!v3) {
    v3 = @"device";
  }
  id v5 = v3;

  return v5;
}

- (void)setLibraryPublicContainerFilterPredicatesWithCloudFilteringType:(int64_t)a3 additionalFilterPredicates:(id)a4
{
  id v5 = [(MPMediaLibraryDataProviderML3 *)self ML3SystemFilterPredicatesWithGroupingType:6 cloudTrackFilteringType:a3 subscriptionFilteringOptions:1 additionalFilterPredicates:a4];
  [(ML3MusicLibrary *)self->_library setLibraryPublicContainerFilterPredicates:v5];
}

- (id)ML3SystemFilterPredicatesWithGroupingType:(int64_t)a3 cloudTrackFilteringType:(int64_t)a4 subscriptionFilteringOptions:(int64_t)a5 additionalFilterPredicates:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  if (objc_opt_respondsToSelector())
  {
    id v11 = [(MPMediaLibraryDataProviderML3 *)self systemFilterPredicatesWithGroupingType:a3 cloudTrackFilteringType:a4 subscriptionFilteringOptions:a5];
    if (![v10 count]) {
      goto LABEL_8;
    }
    if (v11)
    {
      uint64_t v12 = [v11 arrayByAddingObjectsFromArray:v10];

      id v11 = (id)v12;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if ([v10 count])
  {
LABEL_6:
    id v11 = v10;
    goto LABEL_8;
  }
  id v11 = 0;
LABEL_8:
  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v24 + 1) + 8 * v18);
        if (a3 == 6) {
          [v19 ML3PredicateForContainer];
        }
        else {
        v20 = objc_msgSend(v19, "ML3PredicateForTrack", (void)v24);
        }
        if (v20) {
          [v13 addObject:v20];
        }

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }

  if ([v13 count]) {
    v21 = v13;
  }
  else {
    v21 = 0;
  }
  id v22 = v21;

  return v22;
}

- (NSString)uniqueIdentifier
{
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    v4 = [(ML3MusicLibrary *)self->_library libraryUID];
    id v5 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v4;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  if (uniqueIdentifier) {
    v6 = (__CFString *)uniqueIdentifier;
  }
  else {
    v6 = @"device";
  }

  return (NSString *)v6;
}

- (id)systemFilterPredicatesWithGroupingType:(int64_t)a3 cloudTrackFilteringType:(int64_t)a4 subscriptionFilteringOptions:(int64_t)a5
{
  int v38 = a5;
  id v8 = objc_opt_new();
  id v41 = +[MPMediaPropertyPredicate predicateWithValue:MEMORY[0x1E4F1CC38] forProperty:@"hasNonPurgeableAsset" comparisonType:109];
  v40 = +[MPMediaPropertyPredicate predicateWithValue:MEMORY[0x1E4F1CC38] forProperty:@"isPlayable" comparisonType:109];
  if (a4 <= 2 && +[MPMediaQuery isFilteringDisabled])
  {
    int v37 = 1;
    int v9 = 1;
  }
  else
  {
    id v10 = [(MPMediaLibraryDataProviderML3 *)self userIdentity];
    id v11 = +[MPCloudController controllerWithUserIdentity:v10];
    int v37 = [v11 canShowCloudMusic];

    uint64_t v12 = [(MPMediaLibraryDataProviderML3 *)self userIdentity];
    uint64_t v13 = +[MPCloudController controllerWithUserIdentity:v12];
    int v9 = [v13 canShowCloudVideo];

    if (a4 >= 6)
    {
      id v14 = [(MPMediaLibraryDataProviderML3 *)self userIdentity];
      uint64_t v15 = +[MPCloudController controllerWithUserIdentity:v14];
      int v16 = [v15 hasProperNetworkConditionsToPlayMedia];

      goto LABEL_7;
    }
  }
  int v16 = 1;
LABEL_7:
  if ([(ML3MusicLibrary *)self->_library sagaOnDiskDatabaseRevision] < 1)
  {
    int v19 = 0;
    uint64_t v17 = 0;
    v39 = 0;
  }
  else
  {
    uint64_t v17 = +[MPMediaPropertyPredicate predicateWithValue:MEMORY[0x1E4F1CC38] forProperty:@"isMatchAudio" comparisonType:109];
    uint64_t v18 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ED0B8 forProperty:@"mediaType"];
    v39 = +[MPMediaConditionalPredicate predicateWithConditionPredicate:v18 thenPredicate:v17 elsePredicate:0];

    int v19 = 1;
  }
  BOOL v20 = +[MPMediaQuery isFilteringDisabled];
  if (a3 == 6)
  {
    if (((v38 | v20) & 1) == 0)
    {
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        v21 = +[MPMediaPropertyPredicate predicateWithValue:MEMORY[0x1E4F1CC38] forProperty:@"hasItems" comparisonType:109];
        [v8 addObject:v21];
      }
      id v22 = +[MPMediaPropertyPredicate predicateWithValue:MEMORY[0x1E4F1CC28] forProperty:@"isHidden" comparisonType:109];
      [v8 addObject:v22];
    }
  }
  else
  {
    if (v20)
    {
      switch(a4)
      {
        case 0:
          if (v19) {
            goto LABEL_22;
          }
          goto LABEL_23;
        case 2:
          goto LABEL_35;
        case 3:
          if ((v9 | v37))
          {
            if (v37)
            {
              if ((v9 & 1) == 0)
              {
                uint64_t v29 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ED0E8 forProperty:@"mediaType"];
                uint64_t v30 = +[MPMediaConditionalPredicate predicateWithConditionPredicate:v29 thenPredicate:v41 elsePredicate:0];
                [v8 addObject:v30];
              }
            }
            else
            {
              uint64_t v34 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ED0D0 forProperty:@"mediaType"];
              int64_t v35 = +[MPMediaConditionalPredicate predicateWithConditionPredicate:v34 thenPredicate:v41 elsePredicate:0];
              [v8 addObject:v35];
            }
          }
          else
          {
            [v8 addObject:v41];
          }
          if (v19) {
            goto LABEL_22;
          }
          goto LABEL_23;
        case 4:
          if ((v37 & 1) == 0) {
            goto LABEL_35;
          }
          if (v19) {
            goto LABEL_33;
          }
          goto LABEL_23;
        case 5:
          if ((v9 & 1) == 0) {
            goto LABEL_35;
          }
          goto LABEL_23;
        case 6:
          id v31 = v41;
          if (((v9 | v37) & v16) != 1) {
            goto LABEL_54;
          }
          if (v37)
          {
            if (v9) {
              goto LABEL_55;
            }
            uint64_t v32 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ED0E8 forProperty:@"mediaType"];
            uint64_t v33 = +[MPMediaConditionalPredicate predicateWithConditionPredicate:v32 thenPredicate:v41 elsePredicate:0];
          }
          else
          {
            uint64_t v32 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ED0D0 forProperty:@"mediaType"];
            uint64_t v33 = +[MPMediaConditionalPredicate predicateWithConditionPredicate:v32 thenPredicate:v41 elsePredicate:0];
          }
          v36 = (void *)v33;
          [v8 addObject:v33];

          id v31 = v40;
LABEL_54:
          [v8 addObject:v31];
LABEL_55:
          if (v19) {
            goto LABEL_22;
          }
          goto LABEL_23;
        case 7:
          if ((v37 & v16 & 1) == 0) {
            goto LABEL_35;
          }
          [v8 addObject:v40];
          if (v19) {
LABEL_33:
          }
            [v8 addObject:v17];
          goto LABEL_23;
        case 8:
          if (v9 & v16) {
            [v8 addObject:v40];
          }
          else {
LABEL_35:
          }
            [v8 addObject:v41];
          goto LABEL_23;
        default:
          goto LABEL_23;
      }
    }
    v23 = +[MPMediaPropertyPredicate predicateWithValue:MEMORY[0x1E4F1CC28] forProperty:@"isRental"];
    [v8 addObject:v23];

    long long v24 = v41;
    if (((a4 != 2) & v37) != 0) {
      long long v24 = v40;
    }
    id v25 = v24;
    [v8 addObject:v25];

    if ((v19 & (v25 != v41)) == 1) {
LABEL_22:
    }
      [v8 addObject:v39];
  }
LABEL_23:
  if ([v8 count]) {
    long long v26 = v8;
  }
  else {
    long long v26 = 0;
  }
  id v27 = v26;

  return v27;
}

- (ICUserIdentity)userIdentity
{
  userIdentity = self->_userIdentity;
  if (userIdentity)
  {
    v3 = userIdentity;
  }
  else
  {
    v3 = [MEMORY[0x1E4FB87B8] activeAccount];
  }

  return v3;
}

- (MPMediaEntityCache)entityCache
{
  return self->_entityCache;
}

- (BOOL)itemExistsWithPersistentID:(unint64_t)a3
{
  return [MEMORY[0x1E4F79B50] trackWithPersistentID:a3 visibleInLibrary:self->_library];
}

- (void)loadProperties:(id)a3 ofCollectionWithIdentifier:(int64_t)a4 groupingType:(int64_t)a5 completionBlock:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  id v11 = ML3CollectionEntityClassForGroupingType();
  if (v11 == (id)objc_opt_class())
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = ML3CollectionEntityClassForMPMediaItemCollectionProperty(*(void **)(*((void *)&v18 + 1) + 8 * i));
          if (v17 != v11)
          {
            id v11 = v17;
            goto LABEL_12;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  -[MPMediaLibraryDataProviderML3 _loadProperties:ofEntityWithIdentifier:ML3EntityClass:completionBlock:](self, "_loadProperties:ofEntityWithIdentifier:ML3EntityClass:completionBlock:", v9, a4, v11, v10, (void)v18);
}

- (MPArtworkDataSource)artworkDataSource
{
  return self->_artworkDataSource;
}

- (ML3MusicLibrary)library
{
  return self->_library;
}

- (NSString)syncValidity
{
  return (NSString *)[(ML3MusicLibrary *)self->_library libraryUID];
}

- (id)_adjustedItemTimeOfEntity:(id)a3 withDefaultValue:(id)a4
{
  v4 = NSNumber;
  double v5 = (double)objc_msgSend(a4, "unsignedIntValue", a3) / 1000.0;

  return (id)[v4 numberWithDouble:v5];
}

- (id)collectionResultSetForQueryCriteria:(id)a3
{
  v3 = [a3 ML3CollectionsQueryInLibrary:self->_library];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F79B28]) initWithQuery:v3];

  return v4;
}

- (id)itemResultSetForQueryCriteria:(id)a3
{
  v3 = [a3 ML3ItemsQueryInLibrary:self->_library];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F79B28]) initWithQuery:v3];

  return v4;
}

- (void)setUserIdentity:(id)a3
{
  v4 = (ICUserIdentity *)a3;
  userIdentity = self->_userIdentity;
  id v10 = v4;
  if (userIdentity != v4)
  {
    v6 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
    char v7 = [(ICUserIdentity *)userIdentity isEqualToIdentity:v10 inStore:v6];

    if ((v7 & 1) == 0)
    {
      id v8 = (ICUserIdentity *)[(ICUserIdentity *)v10 copy];
      id v9 = self->_userIdentity;
      self->_userIdentity = v8;
    }
  }
}

- (void)setMediaLibrary:(id)a3
{
}

uint64_t __105__MPMediaLibraryDataProviderML3_enumerateItemIdentifiersForQueryCriteria_ordered_cancelBlock_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadQueryCriteria:(id)a3 hasItemsWithCompletionBlock:(id)a4
{
  library = self->_library;
  id v7 = a4;
  id v8 = [a3 ML3ItemsQueryInLibrary:library];
  (*((void (**)(id, uint64_t))a4 + 2))(v7, [v8 hasEntities]);
}

- (void)loadQueryCriteria:(id)a3 countOfCollectionsWithCompletionBlock:(id)a4
{
  library = self->_library;
  id v7 = a4;
  id v8 = [a3 ML3CollectionsQueryInLibrary:library];
  (*((void (**)(id, uint64_t))a4 + 2))(v7, [v8 countOfEntities]);
}

- (void)loadQueryCriteria:(id)a3 countOfItemsWithCompletionBlock:(id)a4
{
  library = self->_library;
  id v7 = a4;
  id v8 = [a3 ML3ItemsQueryInLibrary:library];
  (*((void (**)(id, uint64_t))a4 + 2))(v7, [v8 countOfEntities]);
}

- (void)loadQueryCriteria:(id)a3 hasCollectionsWithCompletionBlock:(id)a4
{
  library = self->_library;
  id v7 = a4;
  id v8 = [a3 ML3CollectionsQueryInLibrary:library];
  (*((void (**)(id, uint64_t))a4 + 2))(v7, [v8 hasEntities]);
}

- (void)enumerateItemIdentifiersForQueryCriteria:(id)a3 ordered:(BOOL)a4 cancelBlock:(id)a5 usingBlock:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  library = self->_library;
  id v12 = a5;
  uint64_t v13 = [a3 ML3ItemsQueryInLibrary:library];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __105__MPMediaLibraryDataProviderML3_enumerateItemIdentifiersForQueryCriteria_ordered_cancelBlock_usingBlock___block_invoke;
  v15[3] = &unk_1E57F18B8;
  id v16 = v10;
  id v14 = v10;
  [v13 enumeratePersistentIDsAndProperties:0 ordered:v7 cancelBlock:v12 usingBlock:v15];
}

- (int64_t)favoriteSongsPlaylistPersistentID
{
  v2 = [(ML3MusicLibrary *)self->_library currentDeviceFavoriteSongsPlaylist];
  v3 = v2;
  if (v2) {
    int64_t v4 = [v2 persistentID];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (NSString)databasePath
{
  return (NSString *)[(ML3MusicLibrary *)self->_library databasePath];
}

- (id)valueForDatabaseProperty:(id)a3
{
  return (id)[(ML3MusicLibrary *)self->_library valueForDatabaseProperty:a3];
}

- (unint64_t)currentEntityRevision
{
  return [(ML3MusicLibrary *)self->_library currentRevision];
}

- (void)enumerateEntityChangesAfterSyncAnchor:(id)a3 maximumRevisionType:(int64_t)a4 inUsersLibrary:(BOOL)a5 itemBlock:(id)a6 collectionBlock:(id)a7
{
  BOOL v8 = a5;
  v23[12] = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = [a3 longLongValue];
  v23[0] = [MEMORY[0x1E4F79AB8] revisionTrackingCode];
  v23[1] = 6;
  v23[2] = [MEMORY[0x1E4F79A70] revisionTrackingCode];
  v23[3] = 2;
  v23[4] = [MEMORY[0x1E4F79A50] revisionTrackingCode];
  v23[5] = 1;
  v23[6] = [MEMORY[0x1E4F79AA8] revisionTrackingCode];
  v23[7] = 4;
  v23[8] = [MEMORY[0x1E4F79AE0] revisionTrackingCode];
  v23[9] = 5;
  v23[10] = [MEMORY[0x1E4F79A58] revisionTrackingCode];
  v23[11] = 3;
  library = self->_library;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __132__MPMediaLibraryDataProviderML3_enumerateEntityChangesAfterSyncAnchor_maximumRevisionType_inUsersLibrary_itemBlock_collectionBlock___block_invoke;
  v18[3] = &unk_1E57F1D18;
  uint64_t v21 = 6;
  id v22 = v23;
  id v19 = v12;
  id v20 = v13;
  id v16 = v13;
  id v17 = v12;
  [(ML3MusicLibrary *)library enumeratePersistentIDsAfterRevision:v14 revisionTrackingCode:0x7FFFFFFFFFFFFFFFLL maximumRevisionType:a4 forMediaTypes:0 inUsersLibrary:v8 usingBlock:v18];
}

void __86__MPMediaLibraryDataProviderML3_adjustedValueForMPProperty_ofEntity_withDefaultValue___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:258 capacity:31];
  v1 = (void *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap;
  adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap = v0;

  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"assetURL", sel__adjustedItemPropertyAssetURLOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"bookmarkTime", sel__adjustedItemTimeOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"chapterArtworkTimes", sel__adjustedItemPropertyChapterArtworkTimesOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"chapters", sel__adjustedItemPropertyChaptersOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"contentRating", sel__adjustedItemPropertyContentRatingOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"dateAccessed", sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"dateAdded", sel__adjustedItemNonnullDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"episodeNumber", sel__adjustedItemPropertyEpisodeNumberOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"eqPreset", sel__adjustedItemPropertyEQPresetOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"filePath", sel__adjustedItemPropertyFilePathOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"lastPlayedDate", sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"lastSkippedDate", sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"mediaType", sel__adjustedPropertyMediaTypeOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"movieInfo", sel__adjustedItemPropertyMovieInfoOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"playbackDuration", sel__adjustedItemTimeOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"rating", sel__adjustedItemPropertyRatingOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"releaseDate", sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"seasonName", sel__adjustedItemPropertySeasonNameOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"seasonNumber", sel__adjustedItemPropertySeasonNumberOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"startTime", sel__adjustedItemTimeOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"stopTime", sel__adjustedItemTimeOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"storeDatePurchased", sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"verifiedIntegrity", sel__adjustedItemPropertyVerifiedIntegrityOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"volumeAdjustment", sel__adjustedItemPropertyVolumeAdjustmentOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"volumeNormalization", sel__adjustedItemPropertyVolumeNormalizationOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"dateCreated", sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"dateModified", sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"datePlayed", sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"datePlayedLocal", sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"seedItems", sel__adjustedPlaylistPropertySeedItemsOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"dateDownloaded", sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"booklets", sel__adjustedItemPropertyBookletsOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"albumDatePlayedLocal", sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"likedStateChangedDate", sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"albumArtistDateFavorited", sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"likedStateChangedDate", sel__adjustedItemDateOfEntity_withDefaultValue_);
  NSMapInsert((NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap, @"artistLikedStateChangedDate", sel__adjustedItemDateOfEntity_withDefaultValue_);
  v2 = (NSMapTable *)adjustedValueForMPProperty_ofEntity_withDefaultValue____adjustmentMap;

  NSMapInsert(v2, @"albumArtistDateFavorited", sel__adjustedItemDateOfEntity_withDefaultValue_);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mediaLibrary);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_artworkDataSource, 0);
  objc_storeStrong((id *)&self->_entityCache, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_entitiesAddedOrRemovedCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_entitiesAddedOrRemovedNotificationQueue, 0);
  objc_storeStrong((id *)&self->_setValuesWidthLimitedQueue, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudUpdateQueue, 0);

  objc_storeStrong((id *)&self->_backgroundTaskQueue, 0);
}

- (MPMediaLibrary)mediaLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaLibrary);

  return (MPMediaLibrary *)WeakRetained;
}

- (id)_userSocialProfileID
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  int64_t v4 = [(MPMediaLibraryDataProviderML3 *)self userIdentity];
  id v25 = 0;
  id v5 = [v3 DSIDForUserIdentity:v4 outError:&v25];
  id v6 = v25;

  if (v5)
  {
    BOOL v7 = [MEMORY[0x1E4FB8650] shared];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    BOOL v8 = [v7 allUserStates];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v14 = [v13 dsid];
          if (v5 == v14)
          {

LABEL_17:
            long long v18 = [v13 music];
            id v19 = [v18 userProfile];
            id v17 = [v19 socialProfileID];

            goto LABEL_18;
          }
          uint64_t v15 = v14;
          int v16 = [v5 isEqual:v14];

          if (v16) {
            goto LABEL_17;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
        id v17 = 0;
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v17 = 0;
    }
LABEL_18:
  }
  else
  {
    BOOL v7 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v6;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "Can't get user social profile ID because DSID = nil. err = %{public}@", buf, 0xCu);
    }
    id v17 = 0;
  }

  return v17;
}

- (BOOL)_removeEntitiesWithIdentifiers:(int64_t *)a3 count:(unint64_t)a4 entityClass:(Class)a5
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__MPMediaLibraryDataProviderML3__removeEntitiesWithIdentifiers_count_entityClass___block_invoke;
  v8[3] = &unk_1E57F1D68;
  v8[6] = a5;
  v8[7] = a4;
  v8[8] = a3;
  v8[4] = self;
  v8[5] = &v9;
  [(MPMediaLibraryDataProviderML3 *)self performTransactionWithBlock:v8];
  if (*((unsigned char *)v10 + 24))
  {
    +[MPMediaLibrary reloadLibraryDataProvider:self];
    BOOL v6 = *((unsigned char *)v10 + 24) != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __82__MPMediaLibraryDataProviderML3__removeEntitiesWithIdentifiers_count_entityClass___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == objc_opt_class())
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    if (*(void *)(a1 + 56))
    {
      unint64_t v4 = 0;
      do
      {
        id v5 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a1 + 64) + 8 * v4)];
        [v3 addObject:v5];

        ++v4;
      }
      while (*(void *)(a1 + 56) > v4);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [MEMORY[0x1E4F79B50] unlinkRedownloadableAssetsFromLibrary:*(void *)(*(void *)(a1 + 32) + 88) persistentIDs:v3];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 48) deleteFromLibrary:*(void *)(*(void *)(a1 + 32) + 88) deletionType:1 persistentIDs:*(void *)(a1 + 64) count:*(void *)(a1 + 56)];
  }
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)_loadValueForAggregateFunction:(id)a3 entityClass:(Class)a4 property:(id)a5 query:(id)a6 completionBlock:(id)a7
{
  id v18 = a5;
  char v12 = (void (**)(id, void *))a7;
  id v13 = a6;
  id v14 = a3;
  uint64_t v15 = [(objc_class *)a4 propertyForMPMediaEntityProperty:v18];
  int v16 = [v13 valueForAggregateFunction:v14 onEntitiesForProperty:v15];

  if (v16)
  {
    id v17 = [(MPMediaLibraryDataProviderML3 *)self adjustedValueForMPProperty:v18 ofEntity:0 withDefaultValue:v16];
  }
  else
  {
    id v17 = 0;
  }
  v12[2](v12, v17);
}

- (void)_libraryCloudLibraryAvailabilityDidChange:(id)a3
{
  v3 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "Received cloud library availability did change notification", v5, 2u);
  }

  unint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"MPMediaLibraryCloudLibraryAvailabilityDidChangeNotification" object:0];
}

- (void)_libraryUIDDidChange:(id)a3
{
}

- (void)_syncGenerationDidChange:(id)a3
{
}

- (void)_displayValuesDidChange:(id)a3
{
}

- (void)_invisiblePropertiesDidChange:(id)a3
{
  uint64_t refreshState = self->_refreshState;
  if (refreshState <= 1) {
    uint64_t refreshState = 1;
  }
  self->_uint64_t refreshState = refreshState;
  [(MPMediaLibraryDataProviderML3 *)self _coalesceEvents];
}

- (void)_dynamicPropertiesDidChange:(id)a3
{
  uint64_t refreshState = self->_refreshState;
  if (refreshState <= 2) {
    uint64_t refreshState = 2;
  }
  self->_uint64_t refreshState = refreshState;
  [(MPMediaLibraryDataProviderML3 *)self _coalesceEvents];
}

- (void)_libraryEntitiesAddedOrRemoved:(id)a3
{
  entitiesAddedOrRemovedNotificationQueue = self->_entitiesAddedOrRemovedNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MPMediaLibraryDataProviderML3__libraryEntitiesAddedOrRemoved___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_sync(entitiesAddedOrRemovedNotificationQueue, block);
}

void __64__MPMediaLibraryDataProviderML3__libraryEntitiesAddedOrRemoved___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 80);
  v3 = os_log_create("com.apple.amp.mediaplayer", "Library");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "Postponing MPMediaLibraryEntitiesAddedOrRemovedNotification timer due to continued notifications", buf, 2u);
    }

    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 80);
    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "Created timer to coalesce MPMediaLibraryEntitiesAddedOrRemovedNotification", buf, 2u);
    }

    dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 72));
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 80);
    *(void *)(v8 + 80) = v7;

    uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 80);
    dispatch_time_t v11 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(NSObject **)(v12 + 80);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __64__MPMediaLibraryDataProviderML3__libraryEntitiesAddedOrRemoved___block_invoke_330;
    handler[3] = &unk_1E57F9EA8;
    handler[4] = v12;
    dispatch_source_set_event_handler(v13, handler);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 80));
  }
}

void __64__MPMediaLibraryDataProviderML3__libraryEntitiesAddedOrRemoved___block_invoke_330(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "Posting MPMediaLibraryEntitiesAddedOrRemovedNotification", v5, 2u);
  }

  +[MPMediaLibrary postEntitiesAddedOrRemovedNotificationForLibraryDataProvider:*(void *)(a1 + 32)];
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 80));
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = 0;
}

- (void)_libraryPathDidChange:(id)a3
{
  uniqueIdentifier = self->_uniqueIdentifier;
  self->_uniqueIdentifier = 0;

  +[MPMediaLibrary libraryPathDidChangeForDataProvider:self];

  [(MPMediaLibraryDataProviderML3 *)self _updateArtworkDataSourceMediaLibraryUniqueIdentifier];
}

- (void)_libraryContentsDidChange:(id)a3
{
  self->_uint64_t refreshState = 3;
  BOOL v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"isSourceExternal"];

  if (v5 && ([v5 BOOLValue] & 1) == 0) {
    [(MPMediaLibraryDataProviderML3 *)self _postEvents];
  }
  else {
    [(MPMediaLibraryDataProviderML3 *)self _coalesceEvents];
  }
}

- (BOOL)_dataProviderSupportsEntityChangeTracking
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(MPMediaLibraryDataProviderML3 *)self supportsEntityChangeTrackingForMediaEntityType:0 collectionGroupingType:0 dataProviderClass:0];
}

- (void)_postEvents
{
  backgroundTaskQueue = self->_backgroundTaskQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MPMediaLibraryDataProviderML3__postEvents__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(backgroundTaskQueue, block);
}

void *__44__MPMediaLibraryDataProviderML3__postEvents__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  result = *(void **)(a1 + 32);
  uint64_t v3 = result[6];
  switch(v3)
  {
    case 1:
      result[6] = 0;
      uint64_t v5 = *(void *)(a1 + 32);
      return (void *)+[MPMediaLibrary reloadInvisiblePropertiesForLibraryDataProvider:v5];
    case 2:
      if ([result _dataProviderSupportsEntityChangeTracking]) {
        [*(id *)(a1 + 32) updateEntitesToCurrentRevision];
      }
      *(void *)(*(void *)(a1 + 32) + 48) = 0;
      uint64_t v6 = *(void *)(a1 + 32);
      return (void *)+[MPMediaLibrary reloadDynamicPropertiesForLibraryDataProvider:v6];
    case 3:
      if ([result _dataProviderSupportsEntityChangeTracking]) {
        [*(id *)(a1 + 32) updateEntitesToCurrentRevision];
      }
      *(void *)(*(void *)(a1 + 32) + 48) = 0;
      uint64_t v4 = *(void *)(a1 + 32);
      return (void *)+[MPMediaLibrary reloadLibraryDataProvider:v4];
  }
  return result;
}

- (void)_coalesceEvents
{
  if (!self->_hasScheduledEventPosting)
  {
    [(MPMediaLibraryDataProviderML3 *)self performSelector:sel__postEvents withObject:0 afterDelay:0.75];
    self->_hasScheduledEventPosting = 1;
  }
}

- (id)_adjustedItemPropertyVerifiedIntegrityOfEntity:(id)a3 withDefaultValue:(id)a4
{
  return a4;
}

- (id)_adjustedItemPropertyAssetURLOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 pathExtension];
  dispatch_source_t v7 = [v5 valueForProperty:*MEMORY[0x1E4F799A8]];
  uint64_t v8 = [v7 integerValue];

  if (v8
    || ([v5 valueForProperty:*MEMORY[0x1E4F79790]],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 length],
        v10,
        !v11))
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v12 = [v5 persistentID];
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CB10], "msv_urlForMediaAssetWithPersistentID:pathExtension:", v12, v6);
  }

  return v9;
}

- (id)_adjustedItemPropertyEQPresetOfEntity:(id)a3 withDefaultValue:(id)a4
{
  uint64_t v4 = objc_msgSend(a4, "integerValue", a3);
  if (v4 <= 99) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4 - 99;
  }
  uint64_t v6 = NSNumber;

  return (id)[v6 numberWithInteger:v5];
}

- (id)_adjustedItemPropertyContentRatingOfEntity:(id)a3 withDefaultValue:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 componentsSeparatedByString:@"|"];
    uint64_t v6 = [v5 count];
    if (v6)
    {
      unint64_t v7 = v6;
      uint64_t v8 = [v5 objectAtIndex:0];
      if (v7 == 1)
      {
        uint64_t v9 = &stru_1EE680640;
        uint64_t v10 = &stru_1EE680640;
        uint64_t v11 = &stru_1EE680640;
      }
      else
      {
        uint64_t v11 = [v5 objectAtIndex:1];
        if (v7 < 3)
        {
          uint64_t v9 = &stru_1EE680640;
          uint64_t v10 = &stru_1EE680640;
        }
        else
        {
          uint64_t v10 = [v5 objectAtIndex:2];
          if (v7 == 3)
          {
            uint64_t v9 = &stru_1EE680640;
          }
          else
          {
            uint64_t v9 = [v5 objectAtIndex:3];
          }
        }
      }
    }
    else
    {
      uint64_t v9 = &stru_1EE680640;
      uint64_t v10 = &stru_1EE680640;
      uint64_t v11 = &stru_1EE680640;
      uint64_t v8 = &stru_1EE680640;
    }
    id v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v8, @"ratingProvider", v11, @"localizedRating", v10, @"ratingLevel", v9, @"localizedReason", 0);
  }
  else
  {
    uint64_t v12 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_ERROR, "Unexpected content rating format: %@", buf, 0xCu);
    }

    id v13 = 0;
  }

  return v13;
}

- (id)_adjustedItemPropertyChaptersOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  unint64_t v7 = [v5 chapterTOC];
  unsigned int v8 = [v7 countOfChapters];
  uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __MPMediaChaptersFromML3Entity_block_invoke;
  v28[3] = &unk_1E57F1D90;
  id v10 = v7;
  id v29 = v10;
  uint64_t v30 = v6;
  id v31 = v5;
  id v11 = v9;
  id v32 = v11;
  id v12 = v5;
  id v13 = v6;
  id v14 = (void (**)(void, void, void, void))MEMORY[0x19971E0F0](v28);
  v14[2](v14, 0, 5, 0);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __MPMediaChaptersFromML3Entity_block_invoke_2;
  v26[3] = &unk_1E57F1DB8;
  id v15 = v10;
  id v27 = v15;
  ((void (**)(void, uint64_t, uint64_t, void *))v14)[2](v14, 1, 1, v26);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __MPMediaChaptersFromML3Entity_block_invoke_3;
  v24[3] = &unk_1E57F1DB8;
  id v16 = v15;
  id v25 = v16;
  ((void (**)(void, uint64_t, uint64_t, void *))v14)[2](v14, 3, 2, v24);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __MPMediaChaptersFromML3Entity_block_invoke_4;
  v22[3] = &unk_1E57F1DB8;
  id v23 = v16;
  uint64_t v17 = (void (*)(void, uint64_t, uint64_t, void *))v14[2];
  id v18 = v16;
  v17(v14, 4, 3, v22);
  ((void (**)(void, uint64_t, uint64_t, void *))v14)[2](v14, 2, 4, &__block_literal_global_693_22093);
  [v11 sortUsingSelector:sel__sortByChapterIndex_];
  id v19 = v23;
  id v20 = v11;

  return v20;
}

- (id)_adjustedItemPropertySeasonNameOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 integerValue] < 1)
  {
    unsigned int v8 = &stru_1EE680640;
  }
  else
  {
    id v5 = NSString;
    uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    unint64_t v7 = [v6 localizedStringForKey:@"SEASON_DISPLAY_FORMAT_%@" value:&stru_1EE680640 table:@"MediaPlayer"];
    objc_msgSend(v5, "localizedStringWithFormat:", v7, v4);
    unsigned int v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_adjustedItemPropertySeasonNumberOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 integerValue] < 1) {
    id v5 = 0;
  }
  else {
    id v5 = v4;
  }

  return v5;
}

- (id)_adjustedItemPropertyChapterArtworkTimesOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v4 = [a3 chapterTOC];
  unsigned int v5 = [v4 countOfGroupsForProperty:4];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
  if (v5)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = [v4 chapterIndexForGroupIndex:v7 groupingProperty:4];
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithDouble:", (double)objc_msgSend(v4, "timeLocationInMSOfChapterAtIndex:", v8) / 1000.0);
      [v6 addObject:v9];

      uint64_t v7 = (v7 + 1);
    }
    while (v5 != v7);
  }
  id v10 = v6;

  return v10;
}

- (id)_adjustedItemPropertyEpisodeNumberOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v4 = a3;
  unsigned int v5 = [v4 valueForProperty:*MEMORY[0x1E4F79A18]];
  uint64_t v6 = v5;
  if (!v5 || ![v5 integerValue])
  {
    uint64_t v7 = [v4 valueForProperty:*MEMORY[0x1E4F79568]];

    uint64_t v6 = (void *)v7;
  }

  return v6;
}

- (id)_adjustedItemPropertyMovieInfoOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 length])
  {
    unsigned int v5 = (void *)MEMORY[0x1E4F28F98];
    uint64_t v6 = [v4 dataUsingEncoding:4];
    uint64_t v7 = [v5 propertyListWithData:v6 options:0 format:0 error:0];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v7;
}

- (id)_adjustedItemPropertyFilePathOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v4 = a4;
  if ((unint64_t)[v4 length] < 2)
  {
    uint64_t v7 = 0;
  }
  else
  {
    unsigned int v5 = NSString;
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", CPSharedResourcesDirectory(), @"Media", v4, 0);
    uint64_t v7 = [v5 pathWithComponents:v6];
  }

  return v7;
}

- (id)_adjustedItemPropertyBookletsOfEntity:(id)a3 withDefaultValue:(id)a4
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__22113;
  id v25 = __Block_byref_object_dispose__22114;
  id v26 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = (void *)MEMORY[0x1E4F79AA0];
  uint64_t v9 = [v6 persistentID];
  id v10 = [v8 predicateWithProperty:*MEMORY[0x1E4F790B8] equalToInt64:v9];
  uint64_t v11 = *MEMORY[0x1E4F790C0];
  v27[0] = *MEMORY[0x1E4F790D0];
  v27[1] = v11;
  uint64_t v12 = *MEMORY[0x1E4F790B0];
  v27[2] = *MEMORY[0x1E4F790C8];
  v27[3] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  id v14 = [MEMORY[0x1E4F79A98] queryWithLibrary:self->_library predicate:v10];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__MPMediaLibraryDataProviderML3__adjustedItemPropertyBookletsOfEntity_withDefaultValue___block_invoke;
  v18[3] = &unk_1E57F1D40;
  id v15 = v6;
  id v19 = v15;
  id v20 = &v21;
  [v14 enumeratePersistentIDsAndProperties:v13 usingBlock:v18];

  id v16 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v16;
}

void __88__MPMediaLibraryDataProviderML3__adjustedItemPropertyBookletsOfEntity_withDefaultValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v5 = objc_alloc_init(MPMediaBooklet);
  -[MPMediaBooklet setItemPersistentID:](v5, "setItemPersistentID:", [*(id *)(a1 + 32) persistentID]);
  -[MPMediaBooklet setStoreItemID:](v5, "setStoreItemID:", [*(id *)a3 longLongValue]);
  [(MPMediaBooklet *)v5 setName:*(void *)(a3 + 8)];
  [(MPMediaBooklet *)v5 setRedownloadParams:*(void *)(a3 + 16)];
  -[MPMediaBooklet setFileSize:](v5, "setFileSize:", [*(id *)(a3 + 24) longLongValue]);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
}

- (id)_adjustedItemDateOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v4 = a4;
  if ([v4 longLongValue])
  {
    unsigned int v5 = (void *)MEMORY[0x1E4F1C9C8];
    [v4 doubleValue];
    id v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_adjustedItemPropertyRatingOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v4 = NSNumber;
  objc_msgSend(a4, "floatValue", a3);
  double v6 = v5 / 20.0;

  return (id)[v4 numberWithDouble:v6];
}

- (id)_adjustedItemPropertyVolumeAdjustmentOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v4 = NSNumber;
  *(float *)&double v5 = (float)((float)((float)(unint64_t)(objc_msgSend(a4, "integerValue", a3) + 1000) / 2000.0) * 2.0)
                + 0.0;
  if (*(float *)&v5 < 0.0) {
    *(float *)&double v5 = 0.0;
  }
  if (*(float *)&v5 > 2.0) {
    *(float *)&double v5 = 2.0;
  }

  return (id)[v4 numberWithFloat:v5];
}

- (id)_adjustedItemPropertyVolumeNormalizationOfEntity:(id)a3 withDefaultValue:(id)a4
{
  id v4 = NSNumber;
  unint64_t v5 = objc_msgSend(a4, "integerValue", a3);
  double v6 = 1.0;
  if (v5 && v5 != 0xFFFF)
  {
    float v7 = sqrt(1000.0 / (float)v5);
    double v6 = v7;
  }
  if (v6 < 0.251188643) {
    double v6 = 0.251188636;
  }
  if (v6 > 3.98107171) {
    double v6 = 3.98107171;
  }
  double v8 = floor(log10(v6) * 20.0 + 0.5);
  *(float *)&double v8 = v8;

  return (id)[v4 numberWithFloat:v8];
}

- (id)_adjustedPlaylistPropertySeedItemsOfEntity:(id)a3 withDefaultValue:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v8[0] = a4;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a4;
    double v6 = [v4 arrayWithObjects:v8 count:1];
  }
  else
  {
    double v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (void)performBackgroundTaskWithBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (performBackgroundTaskWithBlock____once != -1) {
    dispatch_once(&performBackgroundTaskWithBlock____once, &__block_literal_global_223_22120);
  }
  if (performBackgroundTaskWithBlock____appRunsContinously)
  {
    v4[2](v4);
  }
  else
  {
    backgroundTaskQueue = self->_backgroundTaskQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__MPMediaLibraryDataProviderML3_performBackgroundTaskWithBlock___block_invoke_2;
    block[3] = &unk_1E57F9EA8;
    block[4] = self;
    dispatch_sync(backgroundTaskQueue, block);
    v4[2](v4);
    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    float v7 = self->_backgroundTaskQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __64__MPMediaLibraryDataProviderML3_performBackgroundTaskWithBlock___block_invoke_235;
    v8[3] = &unk_1E57F9EA8;
    v8[4] = self;
    dispatch_after(v6, v7, v8);
  }
}

void __64__MPMediaLibraryDataProviderML3_performBackgroundTaskWithBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 32);
  if (!v2)
  {
    id v4 = MPSharedBackgroundTaskProvider();
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__MPMediaLibraryDataProviderML3_performBackgroundTaskWithBlock___block_invoke_3;
    v7[3] = &unk_1E57F9EA8;
    v7[4] = *(void *)(a1 + 32);
    *(void *)(*(void *)(a1 + 32) + 24) = [v4 beginTaskWithExpirationHandler:v7];

    id v5 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 134218498;
      uint64_t v9 = v6;
      __int16 v10 = 2082;
      uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/MediaPlayer/MediaPlayer/Core/MusicLibrary Support/_ios_tvos_watchos/MP"
            "MediaLibraryDataProviderML3.m";
      __int16 v12 = 1024;
      int v13 = 2804;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "BackgroundTask: Took assertion (%lli) at %{public}s:%d", buf, 0x1Cu);
    }

    uint64_t v1 = *(void *)(a1 + 32);
    uint64_t v2 = *(void *)(v1 + 32);
  }
  *(void *)(v1 + 32) = v2 + 1;
}

void __64__MPMediaLibraryDataProviderML3_performBackgroundTaskWithBlock___block_invoke_235(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 32);
  if (v2)
  {
    *(void *)(v1 + 32) = v2 - 1;
    uint64_t v4 = *(void *)(a1 + 32);
    if (!*(void *)(v4 + 32))
    {
      uint64_t v5 = *MEMORY[0x1E4F778E0];
      if (*(void *)(v4 + 24) != *MEMORY[0x1E4F778E0])
      {
        uint64_t v6 = MPSharedBackgroundTaskProvider();
        [v6 endTask:*(void *)(*(void *)(a1 + 32) + 24)];

        float v7 = os_log_create("com.apple.amp.mediaplayer", "Playback");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 24);
          int v9 = 134218498;
          uint64_t v10 = v8;
          __int16 v11 = 2082;
          __int16 v12 = "/Library/Caches/com.apple.xbs/Sources/MediaPlayer/MediaPlayer/Core/MusicLibrary Support/_ios_tvos_watcho"
                "s/MPMediaLibraryDataProviderML3.m";
          __int16 v13 = 1024;
          int v14 = 2819;
          _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "BackgroundTask: End assertion (%lli) at %{public}s:%d", (uint8_t *)&v9, 0x1Cu);
        }

        *(void *)(*(void *)(a1 + 32) + 24) = v5;
      }
    }
  }
}

void __64__MPMediaLibraryDataProviderML3_performBackgroundTaskWithBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MPSharedBackgroundTaskProvider();
  [v2 endTask:*(void *)(*(void *)(a1 + 32) + 24)];

  uint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 24);
    int v5 = 134218498;
    uint64_t v6 = v4;
    __int16 v7 = 2082;
    uint64_t v8 = "/Library/Caches/com.apple.xbs/Sources/MediaPlayer/MediaPlayer/Core/MusicLibrary Support/_ios_tvos_watchos/MPMed"
         "iaLibraryDataProviderML3.m";
    __int16 v9 = 1024;
    int v10 = 2800;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "BackgroundTask: End assertion (%lli) at %{public}s:%d", (uint8_t *)&v5, 0x1Cu);
  }

  *(void *)(*(void *)(a1 + 32) + 24) = *MEMORY[0x1E4F778E0];
  *(void *)(*(void *)(a1 + 32) + 32) = 0;
}

void __64__MPMediaLibraryDataProviderML3_performBackgroundTaskWithBlock___block_invoke()
{
  MainBundle = CFBundleGetMainBundle();
  if (MainBundle)
  {
    uint64_t v1 = CFBundleGetValueForInfoDictionaryKey(MainBundle, @"UIBackgroundModes");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v2 = [v1 containsObject:@"continuous"];
    }
    else {
      char v2 = 0;
    }
    performBackgroundTaskWithBlock____appRunsContinously = v2;
  }
  if (!performBackgroundTaskWithBlock____appRunsContinously)
  {
    id v4 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v3 = [v4 processName];
    performBackgroundTaskWithBlock____appRunsContinously = [v3 isEqualToString:@"iapd"];
  }
}

- (void)clearLocationPropertiesOfItemWithIdentifier:(int64_t)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F79B50];
  library = self->_library;
  int v5 = [NSNumber numberWithLongLong:a3];
  v7[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 clearLocationFromLibrary:library persistentIDs:v6 disableKeepLocal:0];
}

- (void)populateLocationPropertiesOfItemWithIdentifier:(int64_t)a3 withPath:(id)a4 assetProtectionType:(int64_t)a5 completionBlock:(id)a6
{
  __int16 v9 = (void *)MEMORY[0x1E4F79B50];
  library = self->_library;
  id v11 = a6;
  id v12 = a4;
  id v13 = (id)[v9 newWithPersistentID:a3 inLibrary:library];
  [v13 populateLocationPropertiesWithPath:v12 protectionType:a5 completionBlock:v11];
}

- (void)populateLocationPropertiesOfItemWithIdentifier:(int64_t)a3 withPath:(id)a4 assetProtectionType:(int64_t)a5
{
  __int16 v7 = (void *)MEMORY[0x1E4F79B50];
  library = self->_library;
  id v9 = a4;
  id v10 = (id)[v7 newWithPersistentID:a3 inLibrary:library];
  [v10 populateLocationPropertiesWithPath:v9 protectionType:a5];
}

void __132__MPMediaLibraryDataProviderML3_enumerateEntityChangesAfterSyncAnchor_maximumRevisionType_inUsersLibrary_itemBlock_collectionBlock___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9 = (void *)MEMORY[0x19971DE60]();
  id v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", a3);
  if ([MEMORY[0x1E4F79B50] revisionTrackingCode] == a6)
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  else
  {
    uint64_t v11 = a1[6];
    if (v11)
    {
      uint64_t v12 = 0;
      id v13 = (uint64_t *)a1[7];
      while (1)
      {
        uint64_t v14 = *v13;
        v13 += 2;
        if (v14 == a6) {
          break;
        }
        if (v11 == ++v12) {
          goto LABEL_9;
        }
      }
      (*(void (**)(void))(a1[5] + 16))();
    }
  }
LABEL_9:
}

- (NSArray)preferredSubtitleLanguages
{
  return (NSArray *)[(ML3MusicLibrary *)self->_library preferredSubtitleTracks];
}

- (NSArray)preferredAudioLanguages
{
  return (NSArray *)[(ML3MusicLibrary *)self->_library preferredAudioTracks];
}

- (void)setReactionText:(id)a3 onEntryAtPosition:(unint64_t)a4 inPlaylistWithIdentifier:(int64_t)a5 completion:(id)a6
{
  id v10 = (void (**)(id, uint64_t, id))a6;
  id v11 = a3;
  uint64_t v12 = [(MPMediaLibraryDataProviderML3 *)self _userSocialProfileID];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F79AB8]) initWithPersistentID:a5 inLibrary:self->_library];
  id v16 = 0;
  uint64_t v14 = [v13 setItemReactionText:v11 onEntryAtPosition:a4 forUserIdentifier:v12 previousReactionText:&v16];

  id v15 = v16;
  if (v10) {
    v10[2](v10, v14, v15);
  }
}

- (void)moveItemFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 inPlaylistWithIdentifier:(int64_t)a5 completionBlock:(id)a6
{
  id v10 = (void (**)(id, void))a6;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v11 = (void *)[MEMORY[0x1E4F79AB8] newWithPersistentID:a5 inLibrary:self->_library];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__MPMediaLibraryDataProviderML3_moveItemFromIndex_toIndex_inPlaylistWithIdentifier_completionBlock___block_invoke;
  v13[3] = &unk_1E57F1B60;
  id v12 = v11;
  id v14 = v12;
  id v15 = &v18;
  unint64_t v16 = a3;
  unint64_t v17 = a4;
  [(MPMediaLibraryDataProviderML3 *)self performTransactionWithBlock:v13];
  if (v10) {
    v10[2](v10, *((unsigned __int8 *)v19 + 24));
  }

  _Block_object_dispose(&v18, 8);
}

uint64_t __100__MPMediaLibraryDataProviderML3_moveItemFromIndex_toIndex_inPlaylistWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) valueForProperty:*MEMORY[0x1E4F79208]];
  if (([v2 BOOLValue] & 1) == 0)
  {
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v3 = *MEMORY[0x1E4F792F8];
  id v4 = [*(id *)(a1 + 32) valueForProperty:*MEMORY[0x1E4F792F8]];
  int v5 = [v4 intValue];

  if (v5 != 1)
  {
    char v2 = [MEMORY[0x1E4F79B50] containerQueryWithContainer:*(void *)(a1 + 32)];
    uint64_t v6 = [v2 countOfEntities];
    if (v6)
    {
      __int16 v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __100__MPMediaLibraryDataProviderML3_moveItemFromIndex_toIndex_inPlaylistWithIdentifier_completionBlock___block_invoke_2;
      v12[3] = &unk_1E57F19F8;
      id v13 = v7;
      id v8 = v7;
      [v2 enumeratePersistentIDsUsingBlock:v12];
      [*(id *)(a1 + 32) setTracksWithPersistentIDs:v8 notify:0];
      id v9 = *(void **)(a1 + 32);
      id v10 = [NSNumber numberWithInt:1];
      [v9 setValue:v10 forProperty:v3];
    }
    goto LABEL_5;
  }
LABEL_6:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) moveTrackFromIndex:*(void *)(a1 + 48) toIndex:*(void *)(a1 + 56)];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __100__MPMediaLibraryDataProviderML3_moveItemFromIndex_toIndex_inPlaylistWithIdentifier_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];
}

- (void)removeFirstItemFromPlaylistWithIdentifier:(int64_t)a3
{
  id v4 = (void *)[MEMORY[0x1E4F79AB8] newWithPersistentID:a3 inLibrary:self->_library];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__MPMediaLibraryDataProviderML3_removeFirstItemFromPlaylistWithIdentifier___block_invoke;
  v6[3] = &unk_1E57F1CF0;
  id v7 = v4;
  id v5 = v4;
  [(MPMediaLibraryDataProviderML3 *)self performTransactionWithBlock:v6];
}

uint64_t __75__MPMediaLibraryDataProviderML3_removeFirstItemFromPlaylistWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFirstTrack];
}

- (void)removeAllItemsInPlaylistWithIdentifier:(int64_t)a3
{
  id v4 = (void *)[MEMORY[0x1E4F79AB8] newWithPersistentID:a3 inLibrary:self->_library];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__MPMediaLibraryDataProviderML3_removeAllItemsInPlaylistWithIdentifier___block_invoke;
  v6[3] = &unk_1E57F1CF0;
  id v7 = v4;
  id v5 = v4;
  [(MPMediaLibraryDataProviderML3 *)self performTransactionWithBlock:v6];
}

uint64_t __72__MPMediaLibraryDataProviderML3_removeAllItemsInPlaylistWithIdentifier___block_invoke(uint64_t a1)
{
  return 1;
}

- (void)sdk_addItemWithSagaIdentifier:(int64_t)a3 toPlaylistWithIdentifier:(int64_t)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = [(MPMediaLibraryDataProviderML3 *)self userIdentity];
  id v10 = +[MPCloudController controllerWithUserIdentity:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __104__MPMediaLibraryDataProviderML3_sdk_addItemWithSagaIdentifier_toPlaylistWithIdentifier_completionBlock___block_invoke;
  v12[3] = &unk_1E57F90A0;
  id v13 = v8;
  id v11 = v8;
  objc_msgSend(v10, "sdk_addItemWithSagaID:toPlaylistWithPersistentID:completionHandler:", a3, a4, v12);
}

uint64_t __104__MPMediaLibraryDataProviderML3_sdk_addItemWithSagaIdentifier_toPlaylistWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeItemsAtIndexes:(id)a3 inPlaylistWithIdentifier:(int64_t)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)[MEMORY[0x1E4F79AB8] newWithPersistentID:a4 inLibrary:self->_library];
  id v11 = dispatch_get_global_queue(0, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__MPMediaLibraryDataProviderML3_removeItemsAtIndexes_inPlaylistWithIdentifier_completionBlock___block_invoke;
  v15[3] = &unk_1E57F4E70;
  void v15[4] = self;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __95__MPMediaLibraryDataProviderML3_removeItemsAtIndexes_inPlaylistWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __95__MPMediaLibraryDataProviderML3_removeItemsAtIndexes_inPlaylistWithIdentifier_completionBlock___block_invoke_2;
  v4[3] = &unk_1E57F1C78;
  id v7 = &v8;
  char v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v2 performTransactionWithBlock:v4];
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *((unsigned __int8 *)v9 + 24));
  }

  _Block_object_dispose(&v8, 8);
}

uint64_t __95__MPMediaLibraryDataProviderML3_removeItemsAtIndexes_inPlaylistWithIdentifier_completionBlock___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) removeTracksAtIndexes:*(void *)(a1 + 40) notify:1];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (void)sdk_addItemWithOpaqueIdentifier:(id)a3 toPlaylistWithIdentifier:(int64_t)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(MPMediaLibraryDataProviderML3 *)self userIdentity];
  char v11 = +[MPCloudController controllerWithUserIdentity:v10];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __106__MPMediaLibraryDataProviderML3_sdk_addItemWithOpaqueIdentifier_toPlaylistWithIdentifier_completionBlock___block_invoke;
  v13[3] = &unk_1E57F1CC8;
  void v13[4] = self;
  id v14 = v8;
  int64_t v15 = a4;
  id v12 = v8;
  objc_msgSend(v11, "sdk_addStoreItemWithOpaqueID:toPlaylistWithPersistentID:completionHandler:", v9, a4, v13);
}

void __106__MPMediaLibraryDataProviderML3_sdk_addItemWithOpaqueIdentifier_toPlaylistWithIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a3);
    id v19 = v5;
    id v7 = [v5 allValues];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
          id v14 = [*(id *)(a1 + 32) mediaLibrary];
          int64_t v15 = [v14 playlistWithPersistentID:*(void *)(a1 + 48)];

          id v16 = [v15 itemsQuery];
          id v17 = +[MPMediaPropertyPredicate predicateWithValue:v13 forProperty:@"storeSagaID"];
          [v16 addFilterPredicate:v17];
          id v18 = [v16 items];
          [v8 addObjectsFromArray:v18];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    MPFetchArtworkForAddedMediaItems(v8);
    id v5 = v19;
  }
}

- (void)addItemsWithIdentifiers:(id)a3 andEntryProperties:(id)a4 toPlaylistWithIdentifier:(int64_t)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = (void *)[MEMORY[0x1E4F79AB8] newWithPersistentID:a5 inLibrary:self->_library];
  id v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __117__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_andEntryProperties_toPlaylistWithIdentifier_completionBlock___block_invoke;
  v38[3] = &unk_1E57F1BD8;
  id v15 = v14;
  id v39 = v15;
  [v11 enumerateKeysAndObjectsUsingBlock:v38];
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  id v16 = [v13 valueForProperty:*MEMORY[0x1E4F79228]];
  LODWORD(a6) = [v16 BOOLValue];

  if (a6)
  {
    id v28 = v10;
    id v17 = [MEMORY[0x1E4FB8650] shared];
    id v18 = [v17 activeUserState];
    id v19 = [v18 music];
    uint64_t v20 = [v19 userProfile];
    long long v21 = [v20 socialProfileID];

    id v10 = v28;
  }
  else
  {
    long long v21 = 0;
  }
  long long v22 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __117__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_andEntryProperties_toPlaylistWithIdentifier_completionBlock___block_invoke_3;
  block[3] = &unk_1E57F1C28;
  id v34 = v12;
  int64_t v35 = v36;
  block[4] = self;
  id v30 = v13;
  id v31 = v10;
  id v32 = v15;
  id v33 = v21;
  id v23 = v12;
  id v24 = v21;
  id v25 = v15;
  id v26 = v10;
  id v27 = v13;
  dispatch_async(v22, block);

  _Block_object_dispose(v36, 8);
}

void __117__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_andEntryProperties_toPlaylistWithIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __117__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_andEntryProperties_toPlaylistWithIdentifier_completionBlock___block_invoke_2;
  v10[3] = &unk_1E57F5410;
  id v11 = v8;
  id v9 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];

  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
}

void __117__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_andEntryProperties_toPlaylistWithIdentifier_completionBlock___block_invoke_3(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __117__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_andEntryProperties_toPlaylistWithIdentifier_completionBlock___block_invoke_4;
  v4[3] = &unk_1E57F1C00;
  uint64_t v9 = *(void *)(a1 + 80);
  char v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  [v2 performTransactionWithBlock:v4];
  uint64_t v3 = *(void *)(a1 + 72);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24));
  }
}

uint64_t __117__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_andEntryProperties_toPlaylistWithIdentifier_completionBlock___block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) appendTracksWithPersistentIDs:*(void *)(a1 + 40) andEntryProperties:*(void *)(a1 + 48) withAttributionIdentifier:*(void *)(a1 + 56) notify:1];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
}

void __117__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_andEntryProperties_toPlaylistWithIdentifier_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F79AC0];
  id v6 = a3;
  id v7 = [v5 propertyForMPMediaEntityProperty:a2];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

- (void)addItemsWithIdentifiers:(id)a3 toPlaylistWithIdentifier:(int64_t)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)[MEMORY[0x1E4F79AB8] newWithPersistentID:a4 inLibrary:self->_library];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  id v11 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_toPlaylistWithIdentifier_completionBlock___block_invoke;
  block[3] = &unk_1E57F1CA0;
  id v18 = v9;
  id v19 = v20;
  block[4] = self;
  id v16 = v10;
  id v17 = v8;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, block);

  _Block_object_dispose(v20, 8);
}

void __98__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_toPlaylistWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __98__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_toPlaylistWithIdentifier_completionBlock___block_invoke_2;
  v4[3] = &unk_1E57F1C78;
  uint64_t v7 = *(void *)(a1 + 64);
  char v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v2 performTransactionWithBlock:v4];
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
  }
}

uint64_t __98__MPMediaLibraryDataProviderML3_addItemsWithIdentifiers_toPlaylistWithIdentifier_completionBlock___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) appendTracksWithPersistentIDs:*(void *)(a1 + 40) notify:1];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (void)addItemWithIdentifier:(int64_t)a3 toPlaylistWithIdentifier:(int64_t)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = (void *)[MEMORY[0x1E4F79AB8] newWithPersistentID:a4 inLibrary:self->_library];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  id v10 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__MPMediaLibraryDataProviderML3_addItemWithIdentifier_toPlaylistWithIdentifier_completionBlock___block_invoke;
  block[3] = &unk_1E57F1C50;
  block[4] = self;
  id v14 = v9;
  id v16 = v18;
  int64_t v17 = a3;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, block);

  _Block_object_dispose(v18, 8);
}

void __96__MPMediaLibraryDataProviderML3_addItemWithIdentifier_toPlaylistWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__MPMediaLibraryDataProviderML3_addItemWithIdentifier_toPlaylistWithIdentifier_completionBlock___block_invoke_2;
  v6[3] = &unk_1E57F1B38;
  uint64_t v8 = *(void *)(a1 + 56);
  char v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  id v7 = v3;
  uint64_t v9 = v4;
  [v2 performTransactionWithBlock:v6];
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  }
}

uint64_t __96__MPMediaLibraryDataProviderML3_addItemWithIdentifier_toPlaylistWithIdentifier_completionBlock___block_invoke_2(void *a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  char v2 = (void *)a1[4];
  id v3 = [NSNumber numberWithLongLong:a1[6]];
  v6[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v2 appendTracksWithPersistentIDs:v4 notify:1];

  return *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);
}

- (void)setItemsWithIdentifiers:(id)a3 andEntryProperties:(id)a4 forPlaylistWithIdentifier:(int64_t)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)[MEMORY[0x1E4F79AB8] newWithPersistentID:a5 inLibrary:self->_library];
  id v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __118__MPMediaLibraryDataProviderML3_setItemsWithIdentifiers_andEntryProperties_forPlaylistWithIdentifier_completionBlock___block_invoke;
  v38[3] = &unk_1E57F1BD8;
  id v15 = v14;
  id v39 = v15;
  [v11 enumerateKeysAndObjectsUsingBlock:v38];
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  id v16 = [v13 valueForProperty:*MEMORY[0x1E4F79228]];
  LODWORD(a6) = [v16 BOOLValue];

  if (a6)
  {
    id v28 = v10;
    int64_t v17 = [MEMORY[0x1E4FB8650] shared];
    id v18 = [v17 activeUserState];
    char v19 = [v18 music];
    uint64_t v20 = [v19 userProfile];
    char v21 = [v20 socialProfileID];

    id v10 = v28;
  }
  else
  {
    char v21 = 0;
  }
  long long v22 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __118__MPMediaLibraryDataProviderML3_setItemsWithIdentifiers_andEntryProperties_forPlaylistWithIdentifier_completionBlock___block_invoke_3;
  block[3] = &unk_1E57F1C28;
  id v34 = v12;
  int64_t v35 = v36;
  block[4] = self;
  id v30 = v13;
  id v31 = v10;
  id v32 = v15;
  id v33 = v21;
  id v23 = v12;
  id v24 = v21;
  id v25 = v15;
  id v26 = v10;
  id v27 = v13;
  dispatch_async(v22, block);

  _Block_object_dispose(v36, 8);
}

void __118__MPMediaLibraryDataProviderML3_setItemsWithIdentifiers_andEntryProperties_forPlaylistWithIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __118__MPMediaLibraryDataProviderML3_setItemsWithIdentifiers_andEntryProperties_forPlaylistWithIdentifier_completionBlock___block_invoke_2;
  v10[3] = &unk_1E57F5410;
  id v11 = v8;
  id v9 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];

  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v7];
}

void __118__MPMediaLibraryDataProviderML3_setItemsWithIdentifiers_andEntryProperties_forPlaylistWithIdentifier_completionBlock___block_invoke_3(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __118__MPMediaLibraryDataProviderML3_setItemsWithIdentifiers_andEntryProperties_forPlaylistWithIdentifier_completionBlock___block_invoke_4;
  v4[3] = &unk_1E57F1C00;
  uint64_t v9 = *(void *)(a1 + 80);
  char v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  [v2 performTransactionWithBlock:v4];
  uint64_t v3 = *(void *)(a1 + 72);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24));
  }
}

uint64_t __118__MPMediaLibraryDataProviderML3_setItemsWithIdentifiers_andEntryProperties_forPlaylistWithIdentifier_completionBlock___block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) setTracksWithPersistentIDs:*(void *)(a1 + 40) andEntryProperties:*(void *)(a1 + 48) withAttributionIdentifier:*(void *)(a1 + 56) notify:1];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
}

void __118__MPMediaLibraryDataProviderML3_setItemsWithIdentifiers_andEntryProperties_forPlaylistWithIdentifier_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F79AC0];
  id v6 = a3;
  id v7 = [v5 propertyForMPMediaEntityProperty:a2];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

- (void)setItemsWithIdentifiers:(id)a3 forPlaylistWithIdentifier:(int64_t)a4 completionBlock:(id)a5
{
}

- (void)_invalidatePersistentKeysForIdentifiers:(int64_t *)a3 count:(unint64_t)a4
{
  v54[3] = *MEMORY[0x1E4F143B8];
  uint64_t v44 = 0;
  long long v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  if (a4)
  {
    unint64_t v5 = a4;
    uint64_t v31 = *MEMORY[0x1E4F795B8];
    uint64_t v34 = *MEMORY[0x1E4F79708];
    uint64_t v35 = *MEMORY[0x1E4F797A8];
    *(void *)&long long v4 = 138543618;
    long long v28 = v4;
    do
    {
      id v8 = (void *)*a3++;
      id v7 = v8;
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F79B50]) initWithPersistentID:v8 inLibrary:self->_library];
      v54[0] = v35;
      v54[1] = v31;
      v54[2] = v34;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];
      id v11 = [v9 getValuesForProperties:v10];
      id v12 = [v11 objectForKeyedSubscript:v35];
      int v13 = [v12 integerValue];

      id v14 = [v11 objectForKeyedSubscript:v34];
      int v15 = [v14 BOOLValue];

      if (v13 == 4) {
        int v16 = v15;
      }
      else {
        int v16 = 0;
      }
      if (v16 == 1)
      {
        id v33 = [MEMORY[0x1E4F28CB8] defaultManager];
        int64_t v17 = [v11 objectForKeyedSubscript:v31];
        if ([v17 length])
        {
          id v18 = [(ML3MusicLibrary *)self->_library libraryContainerPathByAppendingPathComponent:v17];
        }
        else
        {
          id v18 = 0;
        }
        char v43 = 0;
        int v19 = objc_msgSend(v33, "fileExistsAtPath:isDirectory:", v18, &v43, v28);
        if (v43) {
          int v20 = v19;
        }
        else {
          int v20 = 0;
        }
        if (v20 == 1)
        {
          char v21 = os_log_create("com.apple.amp.mediaplayer", "Library");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v49 = self;
            __int16 v50 = 2048;
            v51 = v7;
            __int16 v52 = 2114;
            v53 = v18;
            _os_log_impl(&dword_1952E8000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Looking for offline keys for track with persistentID %lld, in path '%{public}@", buf, 0x20u);
          }

          id v30 = [MEMORY[0x1E4FB85F8] pendingInvalidationKeyStorePath];
          if (([v33 fileExistsAtPath:v30] & 1) == 0)
          {
            id v42 = 0;
            [v33 createDirectoryAtPath:v30 withIntermediateDirectories:1 attributes:0 error:&v42];
            id v22 = v42;
            if (v22)
            {
              log = os_log_create("com.apple.amp.mediaplayer", "Library");
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                id v23 = objc_msgSend(v22, "msv_description");
                *(_DWORD *)buf = v28;
                v49 = self;
                __int16 v50 = 2114;
                v51 = v23;
                _os_log_impl(&dword_1952E8000, log, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create key purgatory directory error=%{public}@", buf, 0x16u);
              }
            }
          }
          id v24 = (void *)[objc_alloc(MEMORY[0x1E4FB8620]) initWithPath:v30];
          id v25 = (void *)[objc_alloc(MEMORY[0x1E4FB8620]) initWithPath:v18];
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __79__MPMediaLibraryDataProviderML3__invalidatePersistentKeysForIdentifiers_count___block_invoke;
          v37[3] = &unk_1E57F1BB0;
          id v26 = v24;
          id v38 = v26;
          id v39 = self;
          v40 = &v44;
          id v41 = v7;
          [v25 enumerateKeyEntriesUsingBlock:v37];
        }
      }

      --v5;
    }
    while (v5);
    if (*((unsigned char *)v45 + 24))
    {
      id v27 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __79__MPMediaLibraryDataProviderML3__invalidatePersistentKeysForIdentifiers_count___block_invoke_203;
      block[3] = &unk_1E57F9EA8;
      block[4] = self;
      dispatch_async(v27, block);
    }
  }
  _Block_object_dispose(&v44, 8);
}

void __79__MPMediaLibraryDataProviderML3__invalidatePersistentKeysForIdentifiers_count___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v4 = [*(id *)(a1 + 32) saveKeyEntry:v3];
  unint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Library");
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = [v3 identifier];
      uint64_t v9 = *(void *)(a1 + 56);
      id v10 = objc_msgSend(v4, "msv_description");
      int v13 = 138544130;
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      int v16 = v8;
      __int16 v17 = 2048;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      int v20 = v10;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Moving key '%{public}@' for pid %lld to invalidate error=%{public}@", (uint8_t *)&v13, 0x2Au);

LABEL_6:
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    id v8 = [v3 identifier];
    uint64_t v12 = *(void *)(a1 + 56);
    int v13 = 138543874;
    uint64_t v14 = v11;
    __int16 v15 = 2114;
    int v16 = v8;
    __int16 v17 = 2048;
    uint64_t v18 = v12;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Moving key '%{public}@' for pid %lld to invalidate", (uint8_t *)&v13, 0x20u);
    goto LABEL_6;
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

void __79__MPMediaLibraryDataProviderML3__invalidatePersistentKeysForIdentifiers_count___block_invoke_203(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userIdentity];
  uint64_t v1 = +[MPCloudController controllerWithUserIdentity:v2];
  [v1 processPendingKeyInvalidations];
}

- (BOOL)removeItemsWithIdentifiers:(int64_t *)a3 count:(unint64_t)a4
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __66__MPMediaLibraryDataProviderML3_removeItemsWithIdentifiers_count___block_invoke;
  v7[3] = &unk_1E57F1B88;
  v7[6] = a3;
  v7[7] = a4;
  char v8 = 1;
  v7[4] = self;
  void v7[5] = &v9;
  [(MPMediaLibraryDataProviderML3 *)self performTransactionWithBlock:v7];
  if (*((unsigned char *)v10 + 24))
  {
    +[MPMediaLibrary reloadLibraryDataProvider:self];
    BOOL v5 = *((unsigned char *)v10 + 24) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __66__MPMediaLibraryDataProviderML3_removeItemsWithIdentifiers_count___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidatePersistentKeysForIdentifiers:*(void *)(a1 + 48) count:*(void *)(a1 + 56)];
  if (*(unsigned char *)(a1 + 64))
  {
    id v2 = [MEMORY[0x1E4F1CA48] array];
    if (*(void *)(a1 + 56))
    {
      unint64_t v3 = 0;
      do
      {
        long long v4 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a1 + 48) + 8 * v3)];
        [v2 addObject:v4];

        ++v3;
      }
      while (*(void *)(a1 + 56) > v3);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [MEMORY[0x1E4F79B50] unlinkRedownloadableAssetsFromLibrary:*(void *)(*(void *)(a1 + 32) + 88) persistentIDs:v2];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [MEMORY[0x1E4F79B50] removeFromMyLibrary:*(void *)(*(void *)(a1 + 32) + 88) deletionType:1 persistentIDs:*(void *)(a1 + 48) count:*(void *)(a1 + 56)];
  }
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (BOOL)deleteItemsWithIdentifiers:(int64_t *)a3 count:(unint64_t)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __66__MPMediaLibraryDataProviderML3_deleteItemsWithIdentifiers_count___block_invoke;
  v7[3] = &unk_1E57F1B60;
  v7[6] = a3;
  v7[7] = a4;
  v7[4] = self;
  void v7[5] = &v8;
  [(MPMediaLibraryDataProviderML3 *)self performTransactionWithBlock:v7];
  if (*((unsigned char *)v9 + 24))
  {
    +[MPMediaLibrary reloadLibraryDataProvider:self];
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __66__MPMediaLibraryDataProviderML3_deleteItemsWithIdentifiers_count___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [MEMORY[0x1E4F79B50] removeFromMyLibrary:*(void *)(*(void *)(a1 + 32) + 88) deletionType:1 persistentIDs:*(void *)(a1 + 48) count:*(void *)(a1 + 56)];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (BOOL)removePlaylistWithIdentifier:(int64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __62__MPMediaLibraryDataProviderML3_removePlaylistWithIdentifier___block_invoke;
  v6[3] = &unk_1E57F1B38;
  void v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  [(MPMediaLibraryDataProviderML3 *)self performTransactionWithBlock:v6];
  if (*((unsigned char *)v8 + 24))
  {
    +[MPMediaLibrary reloadLibraryDataProvider:self];
    BOOL v4 = *((unsigned char *)v8 + 24) != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __62__MPMediaLibraryDataProviderML3_removePlaylistWithIdentifier___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [MEMORY[0x1E4F79AB8] deleteFromLibrary:*(void *)(*(void *)(a1 + 32) + 88) deletionType:1 persistentIDs:a1 + 48 count:1];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (int64_t)sdk_addPlaylistWithValuesForProperties:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  int v16 = __Block_byref_object_copy__22113;
  __int16 v17 = __Block_byref_object_dispose__22114;
  id v18 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__MPMediaLibraryDataProviderML3_sdk_addPlaylistWithValuesForProperties___block_invoke;
  v9[3] = &unk_1E57F1C78;
  id v5 = v4;
  char v11 = self;
  char v12 = &v13;
  id v10 = v5;
  [(MPMediaLibraryDataProviderML3 *)self performTransactionWithBlock:v9];
  id v6 = (void *)v14[5];
  if (v6) {
    int64_t v7 = [v6 persistentID];
  }
  else {
    int64_t v7 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v7;
}

BOOL __72__MPMediaLibraryDataProviderML3_sdk_addPlaylistWithValuesForProperties___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v3 = [*(id *)(a1 + 32) objectForKey:@"name"];
  if (v3) {
    [v2 setObject:v3 forKey:*MEMORY[0x1E4F792D0]];
  }
  id v4 = [*(id *)(a1 + 32) objectForKey:@"externalVendorDisplayName"];
  if (v4) {
    [v2 setObject:v4 forKey:*MEMORY[0x1E4F791F8]];
  }
  id v5 = [*(id *)(a1 + 32) objectForKey:@"descriptionInfo"];
  if ([v5 length]) {
    [v2 setObject:v5 forKey:*MEMORY[0x1E4F791E0]];
  }
  id v6 = [*(id *)(a1 + 32) objectForKey:@"externalVendorContainerTag"];
  if (v6) {
    [v2 setObject:v6 forKey:*MEMORY[0x1E4F791F0]];
  }
  uint64_t v7 = [MEMORY[0x1E4F79AB8] newWithDictionary:v2 inLibrary:*(void *)(*(void *)(a1 + 40) + 88)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  BOOL v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  return v10;
}

- (int64_t)addPlaylistWithValuesForProperties:(id)a3 trackList:(id)a4 playlistEntryProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__22113;
  id v27 = __Block_byref_object_dispose__22114;
  id v28 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __102__MPMediaLibraryDataProviderML3_addPlaylistWithValuesForProperties_trackList_playlistEntryProperties___block_invoke;
  v17[3] = &unk_1E57F1C00;
  id v11 = v8;
  id v22 = &v23;
  id v18 = v11;
  __int16 v19 = self;
  id v12 = v9;
  id v20 = v12;
  id v13 = v10;
  id v21 = v13;
  [(MPMediaLibraryDataProviderML3 *)self performTransactionWithBlock:v17];
  if (v24[5]
    && (+[MPMediaLibrary reloadLibraryDataProvider:self],
        (uint64_t v14 = (void *)v24[5]) != 0))
  {
    int64_t v15 = [v14 persistentID];
  }
  else
  {
    int64_t v15 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v15;
}

BOOL __102__MPMediaLibraryDataProviderML3_addPlaylistWithValuesForProperties_trackList_playlistEntryProperties___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) objectForKey:@"isActiveGeniusPlaylist"];
  int v3 = [v2 BOOLValue];

  if (!v3) {
    goto LABEL_4;
  }
  id v4 = (void *)MEMORY[0x1E4F79AB8];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 88);
  id v6 = [MEMORY[0x1E4F79AA0] predicateWithProperty:*MEMORY[0x1E4F79218] equalToInt64:1];
  uint64_t v7 = [v4 anyInLibrary:v5 predicate:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
    return 0;
  }
LABEL_4:
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        id v18 = [MEMORY[0x1E4F79AB8] propertyForMPMediaEntityProperty:v17];
        if (v18)
        {
          __int16 v19 = [*(id *)(a1 + 32) objectForKey:v17];
          [v11 setValue:v19 forKey:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v14);
  }

  id v20 = [NSNumber numberWithInt:1];
  [v11 setValue:v20 forKey:*MEMORY[0x1E4F79298]];

  id v21 = [NSNumber numberWithInt:0];
  [v11 setValue:v21 forKey:*MEMORY[0x1E4F792A0]];

  id v22 = [*(id *)(a1 + 32) objectForKey:@"isActiveGeniusPlaylist"];
  int v23 = [v22 BOOLValue];

  if (v23)
  {
    id v24 = [NSNumber numberWithInt:1];
    [v11 setValue:v24 forKey:*MEMORY[0x1E4F79270]];
  }
  uint64_t v25 = [NSNumber numberWithInt:0];
  [v11 setValue:v25 forKey:*MEMORY[0x1E4F79260]];

  id v26 = [NSNumber numberWithInt:0];
  [v11 setValue:v26 forKey:*MEMORY[0x1E4F792E0]];

  uint64_t v27 = [MEMORY[0x1E4F79AB8] newWithDictionary:v11 inLibrary:*(void *)(*(void *)(a1 + 40) + 88)];
  uint64_t v28 = *(void *)(*(void *)(a1 + 64) + 8);
  id v29 = *(void **)(v28 + 40);
  *(void *)(v28 + 40) = v27;

  id v30 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v30)
  {
    uint64_t v31 = *(void *)(a1 + 48);
    if (v31)
    {
      [v30 setTracksWithPersistentIDs:v31 andEntryProperties:*(void *)(a1 + 56) withAttributionIdentifier:0 notify:0];
      BOOL v10 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != 0;
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (int64_t)addPlaylistWithValuesForProperties:(id)a3
{
  return [(MPMediaLibraryDataProviderML3 *)self addPlaylistWithValuesForProperties:a3 trackList:0 playlistEntryProperties:0];
}

- (int64_t)photosMemoriesPlaylistPersistentID
{
  id v2 = [(ML3MusicLibrary *)self->_library currentDevicePhotosMemoriesPlaylist];
  int v3 = v2;
  if (v2) {
    int64_t v4 = [v2 persistentID];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)playbackHistoryPlaylistPersistentID
{
  id v2 = [(ML3MusicLibrary *)self->_library currentDevicePlaybackHistoryPlaylist];
  int v3 = v2;
  if (v2) {
    int64_t v4 = [v2 persistentID];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)setValuesForProperties:(id)a3 trackList:(id)a4 andEntryProperties:(id)a5 ofPlaylistWithIdentifier:(int64_t)a6 completionBlock:(id)a7
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v30 = a4;
  id v31 = a5;
  id v32 = a7;
  uint64_t v38 = [MEMORY[0x1E4F1CA60] dictionary];
  char v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v42, "count"));
  long long v35 = [MEMORY[0x1E4F1C9C8] date];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v56 = 0u;
  long long v55 = 0u;
  id obj = [v42 allKeys];
  uint64_t v10 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v10)
  {
    v40 = 0;
    uint64_t v11 = *(void *)v56;
    uint64_t v12 = *MEMORY[0x1E4F79330];
    uint64_t v39 = *MEMORY[0x1E4F792C0];
    uint64_t v34 = *MEMORY[0x1E4F792C8];
    uint64_t v36 = *MEMORY[0x1E4F79348];
    uint64_t v37 = *MEMORY[0x1E4F79340];
    uint64_t v33 = *MEMORY[0x1E4F79680];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v56 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        uint64_t v15 = [MEMORY[0x1E4F79AB8] propertyForMPMediaEntityProperty:v14];
        if (v15)
        {
          int v16 = [v42 objectForKey:v14];
          if ([v15 isEqualToString:v12])
          {
            if ([v16 integerValue] == -1)
            {

              int v16 = &unk_1EE6ED058;
            }
            if (![v16 integerValue] || objc_msgSend(v16, "integerValue") == -2)
            {
              [v43 setValue:&unk_1EE6ED058 forKey:v37];
              [v43 setValue:&unk_1EE6ED0A0 forKey:v36];
            }
            if ([v16 integerValue])
            {
              if ([v16 integerValue] == -2)
              {
                uint64_t v17 = [MEMORY[0x1E4F79AA0] predicateWithProperty:v33 value:&unk_1EE6ED058 comparison:1];

                [v38 setObject:&unk_1EE6ED088 forKey:v12];
                v40 = (void *)v17;
              }
              else if ([v16 integerValue] >= 1)
              {
                id v18 = (void *)MEMORY[0x1E4F79A68];
                __int16 v19 = [MEMORY[0x1E4F79AA0] predicateWithProperty:v12 equalToInteger:-1];
                v62[0] = v19;
                id v20 = [MEMORY[0x1E4F79AA0] predicateWithProperty:v12 equalToInteger:-2];
                v62[1] = v20;
                id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
                uint64_t v22 = [v18 predicateMatchingPredicates:v21];

                [v38 setObject:&unk_1EE6ED058 forKey:v12];
                v40 = (void *)v22;
              }
            }
            else
            {
              [v38 setObject:&unk_1EE6ED070 forKey:v12];
            }
          }
          else if ([v15 isEqualToString:v39])
          {
            [v43 setValue:v35 forKey:v34];
          }
          [v43 setValue:v16 forKey:v15];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v10);
  }
  else
  {
    v40 = 0;
  }

  if ([v43 count])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v60 = 0x2020000000;
    char v61 = 1;
    int v23 = (void *)[MEMORY[0x1E4F79AB8] newWithPersistentID:a6 inLibrary:self->_library];
    setValuesWidthLimitedQueue = self->_setValuesWidthLimitedQueue;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __126__MPMediaLibraryDataProviderML3_setValuesForProperties_trackList_andEntryProperties_ofPlaylistWithIdentifier_completionBlock___block_invoke;
    v44[3] = &unk_1E57F1B10;
    v44[4] = self;
    p_long long buf = &buf;
    id v25 = v23;
    id v45 = v25;
    id v46 = v43;
    id v47 = v30;
    id v48 = v31;
    id v49 = v38;
    id v50 = v40;
    int64_t v54 = a6;
    id v52 = v32;
    id v51 = v42;
    [(NSOperationQueue *)setValuesWidthLimitedQueue addOperationWithBlock:v44];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v26 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v42;
      _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_DEFAULT, "Failed to map any playlist properties from %{public}@", (uint8_t *)&buf, 0xCu);
    }

    if (v32)
    {
      uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPErrorDomain", 0, @"Failed to map provided properties in setValuesForProperties");
      (*((void (**)(id, void, void *))v32 + 2))(v32, 0, v27);
    }
  }
}

void __126__MPMediaLibraryDataProviderML3_setValuesForProperties_trackList_andEntryProperties_ofPlaylistWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 88);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __126__MPMediaLibraryDataProviderML3_setValuesForProperties_trackList_andEntryProperties_ofPlaylistWithIdentifier_completionBlock___block_invoke_2;
  v15[3] = &unk_1E57F1AC0;
  uint64_t v23 = *(void *)(a1 + 104);
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 64);
  id v20 = *(id *)(a1 + 72);
  id v3 = *(id *)(a1 + 80);
  uint64_t v24 = *(void *)(a1 + 112);
  uint64_t v4 = *(void *)(a1 + 32);
  id v21 = v3;
  uint64_t v22 = v4;
  [v2 performDatabaseTransactionWithBlock:v15];
  uint64_t v5 = *(void *)(a1 + 96);
  if (v5) {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 104) + 8) + 24), 0);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 16);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __126__MPMediaLibraryDataProviderML3_setValuesForProperties_trackList_andEntryProperties_ofPlaylistWithIdentifier_completionBlock___block_invoke_195;
  v10[3] = &unk_1E57F1AE8;
  void v10[4] = v6;
  id v11 = *(id *)(a1 + 88);
  id v12 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 112);
  id v13 = v8;
  uint64_t v14 = v9;
  dispatch_async(v7, v10);
}

uint64_t __126__MPMediaLibraryDataProviderML3_setValuesForProperties_trackList_andEntryProperties_ofPlaylistWithIdentifier_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) allValues];
  uint64_t v6 = [*(id *)(a1 + 40) allKeys];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [v4 setValues:v5 forProperties:v6 usingConnection:v3];

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    uint64_t v10 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v26 = v20;
      _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "Failed to update properties for container %{public}@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    [*(id *)(a1 + 32) setTracksWithPersistentIDs:v7 andEntryProperties:*(void *)(a1 + 56) withAttributionIdentifier:0 notify:0];
  }
  if ([*(id *)(a1 + 64) count])
  {
    id v8 = objc_opt_new();
    uint64_t v9 = [MEMORY[0x1E4F79B50] containerQueryWithContainer:*(void *)(a1 + 32) predicate:*(void *)(a1 + 72)];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __126__MPMediaLibraryDataProviderML3_setValuesForProperties_trackList_andEntryProperties_ofPlaylistWithIdentifier_completionBlock___block_invoke_194;
    v23[3] = &unk_1E57F19F8;
    uint64_t v10 = v8;
    uint64_t v24 = v10;
    [v9 enumeratePersistentIDsUsingBlock:v23];
    id v11 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v10 count];
      uint64_t v13 = *(void *)(a1 + 96);
      uint64_t v14 = *(void *)(a1 + 64);
      *(_DWORD *)long long buf = 134218498;
      uint64_t v26 = v12;
      __int16 v27 = 2048;
      uint64_t v28 = v13;
      __int16 v29 = 2114;
      uint64_t v30 = v14;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEFAULT, "Adjusting track properties for %lu tracks in playlist:%lld: %{public}@", buf, 0x20u);
    }

    uint64_t v15 = (void *)MEMORY[0x1E4F79B50];
    id v16 = [*(id *)(a1 + 64) allValues];
    id v17 = [*(id *)(a1 + 64) allKeys];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [v15 setValues:v16 forProperties:v17 forEntityPersistentIDs:v10 inLibrary:*(void *)(*(void *)(a1 + 80) + 88) usingConnection:v3];

    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
    {
      id v18 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 96);
        *(_DWORD *)long long buf = 134217984;
        uint64_t v26 = v19;
        _os_log_impl(&dword_1952E8000, v18, OS_LOG_TYPE_ERROR, "Failed to update track properties for playlist:%lld", buf, 0xCu);
      }
    }
LABEL_14:
  }
  uint64_t v21 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);

  return v21;
}

void __126__MPMediaLibraryDataProviderML3_setValuesForProperties_trackList_andEntryProperties_ofPlaylistWithIdentifier_completionBlock___block_invoke_195(uint64_t a1)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  if (MPML3LookupItemAdvertisementType_block_invoke_onceToken != -1) {
    dispatch_once(&MPML3LookupItemAdvertisementType_block_invoke_onceToken, &__block_literal_global_198_22171);
  }
  uint64_t v1 = [*(id *)(a1 + 32) userIdentity];
  id v2 = +[MPCloudController controllerWithUserIdentity:v1];

  int v3 = [v2 isCloudEnabled];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v4 = [*(id *)(a1 + 40) allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v70 objects:v86 count:16];
  v53 = v2;
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v71;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v71 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([(id)MPML3LookupItemAdvertisementType_block_invoke___cloudPropertiesToAggregate containsObject:*(void *)(*((void *)&v70 + 1) + 8 * i)])
        {
          int v9 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v70 objects:v86 count:16];
      if (v6) {
        continue;
      }
      break;
    }
    int v9 = 0;
  }
  else
  {
    int v9 = 0;
  }
LABEL_14:

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v10 = [*(id *)(a1 + 40) allKeys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v66 objects:v85 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v67;
    while (2)
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v67 != v12) {
          objc_enumerationMutation(v10);
        }
        if ([(id)MPML3LookupItemAdvertisementType_block_invoke___cloudPropertiesToUpload containsObject:*(void *)(*((void *)&v66 + 1) + 8 * j)])
        {
          LODWORD(v11) = 1;
          goto LABEL_24;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v66 objects:v85 count:16];
      if (v11) {
        continue;
      }
      break;
    }
LABEL_24:
    id v2 = v53;
  }

  if ((v3 & (v9 | v11)) == 1)
  {
    if (v9) {
      [v2 uploadCloudPlaylistProperties];
    }
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v14 = [*(id *)(a1 + 40) allKeys];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v62 objects:v84 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      unint64_t v17 = 0x1E4F79000uLL;
      p_opt_inst_meths = &OBJC_PROTOCOL___SSPurchaseManagerDelegate.opt_inst_meths;
      uint64_t v61 = *(void *)v63;
      uint64_t v59 = *MEMORY[0x1E4F79320];
      uint64_t v57 = *MEMORY[0x1E4F79150];
      uint64_t v56 = *MEMORY[0x1E4F792C0];
      uint64_t v54 = *MEMORY[0x1E4F792C8];
      long long v55 = v14;
      do
      {
        uint64_t v19 = 0;
        uint64_t v58 = v16;
        do
        {
          if (*(void *)v63 != v61) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void **)(*((void *)&v62 + 1) + 8 * v19);
          uint64_t v21 = [*(id *)(v17 + 2744) propertyForMPMediaEntityProperty:v20];
          if (!v21)
          {
            id v25 = os_log_create("com.apple.amp.mediaplayer", "Library");
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              goto LABEL_66;
            }
            *(_DWORD *)long long buf = 138543362;
            *(void *)v81 = v20;
            uint64_t v36 = v25;
            uint64_t v37 = "Property %{public}@ is invalid and will not be propagated";
LABEL_47:
            _os_log_impl(&dword_1952E8000, v36, OS_LOG_TYPE_ERROR, v37, buf, 0xCu);
            goto LABEL_66;
          }
          if (([(__objc2_meth_list *)p_opt_inst_meths[104] containsObject:v20] & 1) == 0)
          {
            id v25 = os_log_create("com.apple.amp.mediaplayer", "Library");
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              goto LABEL_66;
            }
            *(_DWORD *)long long buf = 138543362;
            *(void *)v81 = v20;
            uint64_t v36 = v25;
            uint64_t v37 = "Property %{public}@ is not a valid property to upload and will not be propagated";
            goto LABEL_47;
          }
          unint64_t v22 = v17;
          uint64_t v23 = [*(id *)(a1 + 48) valueForProperty:v59];
          uint64_t v24 = [v23 unsignedLongLongValue];

          id v25 = [*(id *)(a1 + 48) valueForProperty:v57];
          uint64_t v26 = os_log_create("com.apple.amp.mediaplayer", "Library");
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138544130;
            *(void *)v81 = v21;
            *(_WORD *)&v81[8] = 2048;
            *(void *)&v81[10] = v24;
            *(_WORD *)&v81[18] = 2114;
            *(void *)&v81[20] = v25;
            __int16 v82 = 1024;
            int v83 = 1;
            _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_DEFAULT, "Uploading property=%{public}@ for playlist sagaID=%lld, containerGlobalID=%{public}@ isCloudLibraryEnabled=%{BOOL}u", buf, 0x26u);
          }

          if ([v21 isEqualToString:v56])
          {
            __int16 v27 = [*(id *)(a1 + 56) valueForKey:v21];
            uint64_t v28 = [v27 integerValue];

            uint64_t v29 = [*(id *)(a1 + 56) valueForKey:v54];
            uint64_t v30 = (void *)v29;
            if (v28 && v29)
            {
              if ([v20 isEqualToString:@"_playlistLikedState"])
              {
                if (v24)
                {
                  v78[0] = @"_playlistLikedState";
                  uint64_t v31 = [NSNumber numberWithInteger:v28];
                  v78[1] = @"likedStateChangedDate";
                  v79[0] = v31;
                  v79[1] = v30;
                  id v32 = (void *)MEMORY[0x1E4F1C9E8];
                  uint64_t v33 = (void **)v79;
                  uint64_t v34 = (void **)v78;
                  uint64_t v35 = 2;
                  goto LABEL_61;
                }
                if (v25)
                {
                  unint64_t v17 = v22;
                  if (v28 == 2) {
                    [v2 favoritePlaylistWithPersistentID:*(void *)(a1 + 64) globalID:v25 time:v30 completionHandler:0];
                  }
                  else {
                    [v2 setLikedState:v28 forPlaylistWithGlobalID:v25 persistentID:*(void *)(a1 + 64) timeStamp:v30 completion:0];
                  }
                }
                else
                {
                  id v48 = os_log_create("com.apple.amp.mediaplayer", "Library");
                  unint64_t v17 = v22;
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v49 = *(void *)(a1 + 64);
                    *(_DWORD *)long long buf = 67109634;
                    *(_DWORD *)v81 = v28;
                    *(_WORD *)&v81[4] = 2114;
                    *(void *)&v81[6] = v30;
                    *(_WORD *)&v81[14] = 2048;
                    *(void *)&v81[16] = v49;
                    _os_log_impl(&dword_1952E8000, v48, OS_LOG_TYPE_ERROR, "Not propagating favorite state change for playlist (likedState=%d, timeStamp=%{public}@) with persistentID=%lld as it's missing store identifiers", buf, 0x1Cu);
                  }
                }
LABEL_63:
                uint64_t v16 = v58;
LABEL_64:

                uint64_t v14 = v55;
                goto LABEL_65;
              }
              if ([v20 isEqualToString:@"likedState"])
              {
                if (v24)
                {
                  v76 = v20;
                  uint64_t v31 = [NSNumber numberWithInteger:v28];
                  v77 = v31;
                  id v32 = (void *)MEMORY[0x1E4F1C9E8];
                  uint64_t v33 = &v77;
                  uint64_t v34 = &v76;
                  uint64_t v35 = 1;
LABEL_61:
                  id v47 = [v32 dictionaryWithObjects:v33 forKeys:v34 count:v35];
                  [v2 setPlaylistProperties:v47 trackList:0 forPlaylistWithPersistentID:*(void *)(a1 + 64) completionHandler:0];
                }
                else
                {
                  if (!v25)
                  {
                    id v50 = os_log_create("com.apple.amp.mediaplayer", "Library");
                    unint64_t v17 = v22;
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v51 = *(void *)(a1 + 48);
                      *(_DWORD *)long long buf = 138543362;
                      *(void *)v81 = v51;
                      _os_log_impl(&dword_1952E8000, v50, OS_LOG_TYPE_ERROR, "Not propagating favorite state change for %{public}@ as store identifiers are missing", buf, 0xCu);
                    }

                    goto LABEL_63;
                  }
                  [v2 setLikedState:v28 forPlaylistWithGlobalID:v25];
                }
              }
            }
            else
            {
              uint64_t v44 = os_log_create("com.apple.amp.mediaplayer", "Library");
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                uint64_t v45 = *(void *)(a1 + 64);
                *(_DWORD *)long long buf = 67109634;
                *(_DWORD *)v81 = v28;
                *(_WORD *)&v81[4] = 2114;
                *(void *)&v81[6] = v30;
                *(_WORD *)&v81[14] = 2048;
                *(void *)&v81[16] = v45;
                _os_log_impl(&dword_1952E8000, v44, OS_LOG_TYPE_ERROR, "Not propagating favorite state change for playlist (likedState=%d, timeStamp=%{public}@) with persistentID=%lld as the request is not valid", buf, 0x1Cu);
              }
            }
            unint64_t v17 = v22;
            goto LABEL_63;
          }
          if (v24)
          {
            uint64_t v30 = [*(id *)(a1 + 56) objectForKey:v21];
            if ([v20 isEqualToString:@"parentPersistentID"])
            {
              unint64_t v17 = v22;
              if ([v30 longLongValue])
              {
                uint64_t v38 = *(void **)(v22 + 2744);
                uint64_t v39 = [v30 longLongValue];
                v40 = [*(id *)(a1 + 32) library];
                uint64_t v41 = v39;
                unint64_t v17 = v22;
                id v42 = (void *)[v38 newWithPersistentID:v41 inLibrary:v40];

                uint64_t v43 = [v42 valueForProperty:v59];

                uint64_t v30 = (void *)v43;
                id v2 = v53;
              }
            }
            else
            {
              unint64_t v17 = v22;
            }
            uint64_t v16 = v58;
            v74 = v20;
            v75 = v30;
            id v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
            [v2 setPlaylistProperties:v46 trackList:0 forPlaylistWithPersistentID:*(void *)(a1 + 64) completionHandler:0];

            goto LABEL_64;
          }
          unint64_t v17 = v22;
          uint64_t v16 = v58;
LABEL_65:
          p_opt_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___SSPurchaseManagerDelegate + 40);
LABEL_66:

          ++v19;
        }
        while (v16 != v19);
        uint64_t v52 = [v14 countByEnumeratingWithState:&v62 objects:v84 count:16];
        uint64_t v16 = v52;
      }
      while (v52);
    }
  }
  else
  {
    uint64_t v14 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109632;
      *(_DWORD *)v81 = v3;
      *(_WORD *)&v81[4] = 1024;
      *(_DWORD *)&v81[6] = v11;
      *(_WORD *)&v81[10] = 1024;
      *(_DWORD *)&v81[12] = v9;
      _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_ERROR, "Not propagating change(s) - cloudLibraryEnabled=%{BOOL}u, hasCloudPropertyToUpdate=%{BOOL}u, hasCloudPropertyToAggregate=%{BOOL}u", buf, 0x14u);
    }
  }
}

void __126__MPMediaLibraryDataProviderML3_setValuesForProperties_trackList_andEntryProperties_ofPlaylistWithIdentifier_completionBlock___block_invoke_2_196()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"likedState", @"_playlistLikedState", @"parentPersistentID", 0);
  uint64_t v1 = (void *)MPML3LookupItemAdvertisementType_block_invoke___cloudPropertiesToUpload;
  MPML3LookupItemAdvertisementType_block_invoke___cloudPropertiesToUpload = v0;

  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"playCountSinceSync", @"datePlayed", 0);
  int v3 = (void *)MPML3LookupItemAdvertisementType_block_invoke___cloudPropertiesToAggregate;
  MPML3LookupItemAdvertisementType_block_invoke___cloudPropertiesToAggregate = v2;
}

void __126__MPMediaLibraryDataProviderML3_setValuesForProperties_trackList_andEntryProperties_ofPlaylistWithIdentifier_completionBlock___block_invoke_194(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];
}

- (void)setValue:(id)a3 forProperty:(id)a4 ofPlaylistWithIdentifier:(int64_t)a5 completionBlock:(id)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10)
  {
    id v13 = v10;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v14 = v13;
  id v16 = v11;
  v17[0] = v13;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  [(MPMediaLibraryDataProviderML3 *)self setValuesForProperties:v15 trackList:0 andEntryProperties:0 ofPlaylistWithIdentifier:a5 completionBlock:v12];
}

- (void)setValue:(id)a3 forProperty:(id)a4 ofCollectionWithIdentifier:(int64_t)a5 groupingType:(int64_t)a6 completionBlock:(id)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = ML3CollectionEntityClassForGroupingType();
  id v16 = [v15 propertyForMPMediaEntityProperty:v13];
  if (v16
    || v15 == (id)objc_opt_class()
    && (id v15 = ML3CollectionEntityClassForMPMediaItemCollectionProperty(v13),
        [v15 propertyForMPMediaEntityProperty:v13],
        (id v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v26 = v13;
    if (v12)
    {
      unint64_t v17 = v14;
      id v18 = v12;
    }
    else
    {
      id v18 = [MEMORY[0x1E4F1CA98] null];
      unint64_t v17 = v14;
    }
    uint64_t v20 = (void *)[v15 newWithPersistentID:a5 inLibrary:self->_library];
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v41[3] = 0;
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v43 = __Block_byref_object_copy__22113;
    uint64_t v44 = __Block_byref_object_dispose__22114;
    id v45 = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    char v40 = 1;
    id v21 = v12;
    if (setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock__onceToken != -1) {
      dispatch_once(&setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock__onceToken, &__block_literal_global_22190);
    }
    setValuesWidthLimitedQueue = self->_setValuesWidthLimitedQueue;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_2;
    v27[3] = &unk_1E57F1A98;
    v27[4] = self;
    id v23 = v18;
    id v28 = v23;
    id v24 = v16;
    id v36 = v15;
    int64_t v37 = a5;
    id v29 = v24;
    uint64_t v33 = v39;
    id v25 = v20;
    id v30 = v25;
    uint64_t v34 = v41;
    uint64_t v35 = buf;
    id v14 = v17;
    id v32 = v17;
    id v13 = v26;
    id v31 = v26;
    int64_t v38 = a6;
    [(NSOperationQueue *)setValuesWidthLimitedQueue addOperationWithBlock:v27];

    id v12 = v21;
    _Block_object_dispose(v39, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v41, 8);
  }
  else
  {
    uint64_t v19 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412802;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a6;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v43 = (uint64_t (*)(uint64_t, uint64_t))v13;
      _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_ERROR, "entityClass %@ (groupingType = %ld) has no ML3Property for MPProperty %@", buf, 0x20u);
    }

    if (v14) {
      (*((void (**)(id, void, void))v14 + 2))(v14, 0, 0);
    }
  }
}

void __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 88);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_3;
  v21[3] = &unk_1E57F1A48;
  id v22 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 112);
  uint64_t v28 = *(void *)(a1 + 104);
  uint64_t v29 = v4;
  uint64_t v5 = *(void *)(a1 + 32);
  id v23 = v3;
  uint64_t v24 = v5;
  uint64_t v26 = *(void *)(a1 + 80);
  id v25 = *(id *)(a1 + 56);
  long long v27 = *(_OWORD *)(a1 + 88);
  [v2 performDatabaseTransactionWithBlock:v21];
  uint64_t v6 = *(void *)(a1 + 72);
  if (v6) {
    (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), 0);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_188;
  block[3] = &unk_1E57F1A70;
  block[4] = v7;
  id v13 = *(id *)(a1 + 64);
  id v14 = *(id *)(a1 + 48);
  long long v17 = *(_OWORD *)(a1 + 88);
  uint64_t v9 = *(void *)(a1 + 112);
  uint64_t v18 = *(void *)(a1 + 104);
  uint64_t v19 = v9;
  id v15 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 120);
  id v16 = v10;
  uint64_t v20 = v11;
  dispatch_async(v8, block);
}

BOOL __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  v117[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *MEMORY[0x1E4F79330];
  if (![*(id *)(a1 + 40) isEqualToString:*MEMORY[0x1E4F79330]])
  {
    if ([*(id *)(a1 + 40) isEqualToString:@"liked_state"])
    {
      uint64_t v26 = *(void *)(a1 + 88);
      if (v26 == objc_opt_class())
      {
        uint64_t v29 = (id *)MEMORY[0x1E4F792C8];
      }
      else
      {
        uint64_t v27 = *(void *)(a1 + 88);
        if (v27 == objc_opt_class())
        {
          uint64_t v29 = (id *)MEMORY[0x1E4F79058];
        }
        else
        {
          uint64_t v28 = *(void *)(a1 + 88);
          if (v28 != objc_opt_class()) {
            goto LABEL_36;
          }
          uint64_t v29 = (id *)MEMORY[0x1E4F79000];
        }
      }
      id v78 = *v29;
      if (v78)
      {
        uint64_t v6 = v78;
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v4 integerValue];
        uint64_t v79 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v80 = *(void *)(*(void *)(a1 + 80) + 8);
        v81 = *(void **)(v80 + 40);
        *(void *)(v80 + 40) = v79;

        v74 = *(void **)(a1 + 56);
        uint64_t v82 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        v99[0] = v4;
        v99[1] = v82;
        long long v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:2];
        v98[0] = *(void *)(a1 + 40);
        v98[1] = v6;
        v75 = (void *)MEMORY[0x1E4F1C978];
        v76 = v98;
        uint64_t v77 = 2;
LABEL_35:
        int v83 = [v75 arrayWithObjects:v76 count:v77];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v74 setValues:v70 forProperties:v83 usingConnection:v3];

LABEL_37:
        BOOL v73 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != 0;
        goto LABEL_38;
      }
    }
LABEL_36:
    v84 = *(void **)(a1 + 56);
    id v97 = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
    uint64_t v96 = *(void *)(a1 + 40);
    long long v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v96 count:1];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v84 setValues:v6 forProperties:v70 usingConnection:v3];
    goto LABEL_37;
  }
  if ([v4 integerValue] == -1)
  {

    id v4 = &unk_1EE6ED058;
  }
  id v4 = v4;
  uint64_t v6 = v4;
  if (![v4 integerValue])
  {

    uint64_t v6 = &unk_1EE6ED070;
  }
  if ([v6 integerValue] == -1)
  {
    id v30 = (void *)MEMORY[0x1E4F79AA0];
    id v31 = [*(id *)(a1 + 88) trackForeignPersistentID];
    uint64_t v32 = [v30 predicateWithProperty:v31 equalToInt64:*(void *)(a1 + 96)];

    v89 = (void *)v32;
    uint64_t v33 = [MEMORY[0x1E4F79B50] queryWithLibrary:*(void *)(*(void *)(a1 + 48) + 88) predicate:v32 orderingTerms:0 usingSections:0];
    uint64_t v34 = objc_opt_new();
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_169;
    v94[3] = &unk_1E57F19F8;
    id v35 = v34;
    id v95 = v35;
    [v33 enumeratePersistentIDsUsingBlock:v94];
    id v36 = (void *)MEMORY[0x1E4F79B50];
    v117[0] = v6;
    int64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:1];
    uint64_t v116 = v5;
    int64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v36 setValues:v37 forProperties:v38 forEntityPersistentIDs:v35 inLibrary:*(void *)(*(void *)(a1 + 48) + 88) usingConnection:v3];

    uint64_t v39 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = [v35 count];
      int v41 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      uint64_t v42 = *(void *)(a1 + 96);
      *(_DWORD *)long long buf = 134218496;
      uint64_t v111 = v40;
      __int16 v112 = 1024;
      int v113 = v41;
      __int16 v114 = 2048;
      uint64_t v115 = v42;
      _os_log_impl(&dword_1952E8000, v39, OS_LOG_TYPE_DEFAULT, "Disabled keep_local on %lu tracks with status:%d for collection:%lld", buf, 0x1Cu);
    }

    int v43 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (v43) {
      goto LABEL_25;
    }
  }
  else
  {
    if ([v6 integerValue] == -2)
    {
      uint64_t v7 = [MEMORY[0x1E4F79AA0] predicateWithProperty:*MEMORY[0x1E4F79680] value:&unk_1EE6ED058 comparison:1];
      id v8 = (void *)MEMORY[0x1E4F79A60];
      uint64_t v9 = (void *)MEMORY[0x1E4F79AA0];
      id v10 = [*(id *)(a1 + 88) trackForeignPersistentID];
      uint64_t v11 = [v9 predicateWithProperty:v10 equalToInt64:*(void *)(a1 + 96)];
      v109[0] = v11;
      v109[1] = v7;
      v88 = (void *)v7;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:2];
      id v12 = v87 = v3;
      uint64_t v13 = [v8 predicateMatchingPredicates:v12];

      v86 = (void *)v13;
      id v14 = [MEMORY[0x1E4F79B50] queryWithLibrary:*(void *)(*(void *)(a1 + 48) + 88) predicate:v13 orderingTerms:0 usingSections:0];
      id v15 = objc_opt_new();
      uint64_t v108 = *MEMORY[0x1E4F79480];
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v108 count:1];
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_170;
      v92[3] = &unk_1E57F1A20;
      id v17 = v15;
      id v93 = v17;
      [v14 enumeratePersistentIDsAndProperties:v16 usingBlock:v92];

      uint64_t v18 = (void *)MEMORY[0x1E4F79B50];
      uint64_t v107 = v5;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
      uint64_t v20 = v18;
      id v3 = v87;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v20 setValues:&unk_1EE6ED748 forProperties:v19 forEntityPersistentIDs:v17 inLibrary:*(void *)(*(void *)(a1 + 48) + 88) usingConnection:v87];

      id v21 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = [v17 count];
        int v23 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        uint64_t v24 = *(void *)(a1 + 96);
        *(_DWORD *)long long buf = 134218496;
        uint64_t v111 = v22;
        __int16 v112 = 1024;
        int v113 = v23;
        __int16 v114 = 2048;
        uint64_t v115 = v24;
        _os_log_impl(&dword_1952E8000, v21, OS_LOG_TYPE_DEFAULT, "Cancelled keep_local on %lu tracks with status:%d for collection: %lld", buf, 0x1Cu);
      }

      int v25 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    }
    else
    {
      if ([v6 integerValue] < 1) {
        goto LABEL_25;
      }
      uint64_t v44 = (void *)MEMORY[0x1E4F79A68];
      id v45 = [MEMORY[0x1E4F79AA0] predicateWithProperty:v5 equalToInteger:-1];
      v106[0] = v45;
      uint64_t v46 = [MEMORY[0x1E4F79AA0] predicateWithProperty:v5 equalToInteger:-2];
      v106[1] = v46;
      id v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:2];
      uint64_t v48 = [v44 predicateMatchingPredicates:v47];

      uint64_t v49 = (void *)MEMORY[0x1E4F79A60];
      id v50 = (void *)MEMORY[0x1E4F79AA0];
      uint64_t v51 = [*(id *)(a1 + 88) trackForeignPersistentID];
      uint64_t v52 = [v50 predicateWithProperty:v51 equalToInt64:*(void *)(a1 + 96)];
      v105[0] = v52;
      v105[1] = v48;
      v88 = (void *)v48;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:2];
      uint64_t v54 = v53 = v3;
      long long v55 = [v49 predicateMatchingPredicates:v54];

      uint64_t v56 = [MEMORY[0x1E4F79B50] queryWithLibrary:*(void *)(*(void *)(a1 + 48) + 88) predicate:v55 orderingTerms:0 usingSections:0];
      uint64_t v57 = objc_opt_new();
      v90[0] = MEMORY[0x1E4F143A8];
      v90[1] = 3221225472;
      v90[2] = __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_177;
      v90[3] = &unk_1E57F19F8;
      id v58 = v57;
      id v91 = v58;
      [v56 enumeratePersistentIDsUsingBlock:v90];
      uint64_t v59 = (void *)MEMORY[0x1E4F79B50];
      uint64_t v104 = v5;
      uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v104 count:1];
      uint64_t v61 = v59;
      id v3 = v53;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v61 setValues:&unk_1EE6ED760 forProperties:v60 forEntityPersistentIDs:v58 inLibrary:*(void *)(*(void *)(a1 + 48) + 88) usingConnection:v53];

      long long v62 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v63 = [v58 count];
        int v64 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        uint64_t v65 = *(void *)(a1 + 96);
        *(_DWORD *)long long buf = 134218496;
        uint64_t v111 = v63;
        __int16 v112 = 1024;
        int v113 = v64;
        __int16 v114 = 2048;
        uint64_t v115 = v65;
        _os_log_impl(&dword_1952E8000, v62, OS_LOG_TYPE_DEFAULT, "Cleared keep_local on %lu tracks with status:%d for collection:%lld", buf, 0x1Cu);
      }

      int v25 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    }

    if (v25)
    {
LABEL_25:
      if (![v4 integerValue] || objc_msgSend(v4, "integerValue") == -2)
      {
        long long v66 = *(void **)(a1 + 56);
        v103[0] = v4;
        v103[1] = &unk_1EE6ED058;
        v103[2] = &unk_1EE6ED0A0;
        long long v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:3];
        uint64_t v68 = *MEMORY[0x1E4F79340];
        v102[0] = *(void *)(a1 + 40);
        v102[1] = v68;
        v102[2] = *MEMORY[0x1E4F79348];
        long long v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:3];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v66 setValues:v67 forProperties:v69 usingConnection:v3];

        long long v70 = os_log_create("com.apple.amp.mediaplayer", "Library");
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v71 = *(void *)(a1 + 96);
          int v72 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
          *(_DWORD *)long long buf = 134218240;
          uint64_t v111 = v71;
          __int16 v112 = 1024;
          int v113 = v72;
          _os_log_impl(&dword_1952E8000, v70, OS_LOG_TYPE_DEFAULT, "Cleared keep_local_status for collection %lld with status:%d", buf, 0x12u);
        }
        goto LABEL_37;
      }
      v74 = *(void **)(a1 + 56);
      id v101 = v4;
      long long v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
      uint64_t v100 = *(void *)(a1 + 40);
      v75 = (void *)MEMORY[0x1E4F1C978];
      v76 = &v100;
      uint64_t v77 = 1;
      goto LABEL_35;
    }
  }

  BOOL v73 = 0;
LABEL_38:

  return v73;
}

void __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_188(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) userIdentity];
  id v3 = +[MPCloudController controllerWithUserIdentity:v2];

  int v4 = [v3 isCloudLibraryEnabled];
  if (![(id)setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock____cloudPropertiesToUpload containsObject:*(void *)(a1 + 40)]|| !objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", @"liked_state"))
  {
    goto LABEL_64;
  }
  uint64_t v5 = *(void *)(a1 + 88);
  if (v5 != objc_opt_class())
  {
    uint64_t v6 = *(void *)(a1 + 88);
    if (v6 == objc_opt_class())
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
        && *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
      {
        if ([*(id *)(a1 + 40) isEqualToString:@"_albumLikedState"])
        {
          uint64_t v7 = [*(id *)(a1 + 56) valueForProperty:*MEMORY[0x1E4F79040]];
          id v8 = [*(id *)(a1 + 56) valueForProperty:*MEMORY[0x1E4F79080]];
          uint64_t v9 = [v8 longLongValue];

          id v10 = _MPLogCategoryLibrary();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v11 = *(void *)(a1 + 40);
            *(_DWORD *)long long buf = 138544130;
            *(void *)uint64_t v68 = v11;
            *(_WORD *)&v68[8] = 2114;
            *(void *)&v68[10] = v7;
            *(_WORD *)&v68[18] = 2048;
            *(void *)&v68[20] = v9;
            __int16 v69 = 1024;
            int v70 = v4;
            _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "Uploading property=%{public}@ for albumCloudID=%{public}@, storeID=%lld isCloudLibraryEnabled=%{BOOL}u", buf, 0x26u);
          }

          if (v4)
          {
            if ([v7 length])
            {
              uint64_t v12 = *(void *)(a1 + 64);
              v63[0] = *(void *)(a1 + 40);
              v63[1] = @"albumLikedStateChangedDate";
              uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
              v64[0] = v12;
              v64[1] = v13;
              v63[2] = @"albumCloudLibraryID";
              v64[2] = v7;
              id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:3];
              [v3 setAlbumProperties:v14 forEntityWithPersistentID:*(void *)(a1 + 96) cloudLibraryID:v7 completionHandler:0];
LABEL_62:

              goto LABEL_63;
            }
            if (v9)
            {
              uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
              uint64_t v36 = *(void *)(a1 + 96);
              uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
              if (v35 == 2)
              {
                int64_t v38 = v3;
                uint64_t v39 = *(void *)(a1 + 96);
                uint64_t v40 = v9;
                uint64_t v41 = 3;
                goto LABEL_49;
              }
              goto LABEL_37;
            }
            id v14 = _MPLogCategoryLibrary();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              goto LABEL_62;
            }
            uint64_t v58 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
            uint64_t v59 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
            uint64_t v60 = *(void *)(a1 + 96);
            *(_DWORD *)long long buf = 67109634;
            *(_DWORD *)uint64_t v68 = v58;
            *(_WORD *)&v68[4] = 2114;
            *(void *)&v68[6] = v59;
            *(_WORD *)&v68[14] = 2048;
            *(void *)&v68[16] = v60;
            uint64_t v46 = "Not propagating favorite state change for album (likedState=%d, timeStamp=%{public}@) with persistentI"
                  "D=%lld as it's missing store identifiers";
          }
          else
          {
            if (v9 || [v7 length])
            {
              uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
              uint64_t v36 = *(void *)(a1 + 96);
              uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
LABEL_37:
              [v3 setLikedState:v35 forAlbumWithStoreID:v9 persistentID:v36 timeStamp:v34 completion:0];
              goto LABEL_63;
            }
            id v14 = _MPLogCategoryLibrary();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              goto LABEL_62;
            }
            uint64_t v55 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
            uint64_t v56 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
            uint64_t v57 = *(void *)(a1 + 96);
            *(_DWORD *)long long buf = 67109634;
            *(_DWORD *)uint64_t v68 = v55;
            *(_WORD *)&v68[4] = 2114;
            *(void *)&v68[6] = v56;
            *(_WORD *)&v68[14] = 2048;
            *(void *)&v68[16] = v57;
            uint64_t v46 = "Not propagating favorite state change for album (likedState=%d, timeStamp=%{public}@) with persistentI"
                  "D=%lld as cloudLibrary is not enabled and it's missing store identifiers";
          }
          goto LABEL_60;
        }
        if ([*(id *)(a1 + 40) isEqualToString:@"albumLikedState"])
        {
          if (![v3 isCloudEnabled])
          {
            uint64_t v7 = ML3CollectionStoreIDPropertyForGroupingType(*(void *)(a1 + 104));
            uint64_t v42 = [*(id *)(a1 + 56) valueForProperty:v7];
            uint64_t v43 = [v42 unsignedLongLongValue];

            if (v43 && *(void *)(a1 + 104) == 1)
            {
              [v3 setLikedState:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) forAlbumWithStoreID:v43];
              goto LABEL_63;
            }
            id v14 = _MPLogCategoryLibrary();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              goto LABEL_62;
            }
            uint64_t v44 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
            uint64_t v45 = *(void *)(a1 + 56);
            *(_DWORD *)long long buf = 67109378;
            *(_DWORD *)uint64_t v68 = v44;
            *(_WORD *)&v68[4] = 2114;
            *(void *)&v68[6] = v45;
            uint64_t v46 = "Not propagating liked state=%d for album=%{public}@";
            id v47 = v14;
            uint32_t v48 = 18;
LABEL_61:
            _os_log_impl(&dword_1952E8000, v47, OS_LOG_TYPE_ERROR, v46, buf, v48);
            goto LABEL_62;
          }
          uint64_t v31 = *(void *)(a1 + 64);
          uint64_t v61 = *(void *)(a1 + 40);
          uint64_t v62 = v31;
          uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
          [v3 setCollectionProperties:v7 forCollectionWithPersistentID:*(void *)(a1 + 96) groupingType:*(void *)(a1 + 104) completionHandler:0];
LABEL_63:

          goto LABEL_64;
        }
        uint64_t v7 = _MPLogCategoryLibrary();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_63;
        }
        uint64_t v37 = *(void *)(a1 + 56);
        *(_DWORD *)long long buf = 138543362;
        *(void *)uint64_t v68 = v37;
        uint64_t v24 = "Not propagating favorite state change for %{public}@ as cloud library is not enabled";
        uint64_t v28 = v7;
        os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
        uint32_t v30 = 12;
LABEL_26:
        _os_log_impl(&dword_1952E8000, v28, v29, v24, buf, v30);
        goto LABEL_63;
      }
      uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_63;
      }
      uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      uint64_t v27 = *(void *)(a1 + 96);
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)uint64_t v68 = v25;
      *(_WORD *)&v68[4] = 2114;
      *(void *)&v68[6] = v26;
      *(_WORD *)&v68[14] = 2048;
      *(void *)&v68[16] = v27;
      uint64_t v24 = "Not propagating favorite state change for album (likedState=%d, timeStamp=%{public}@) with persistentID=%lld"
            " as the request is not valid";
LABEL_25:
      uint64_t v28 = v7;
      os_log_type_t v29 = OS_LOG_TYPE_ERROR;
      uint32_t v30 = 28;
      goto LABEL_26;
    }
    goto LABEL_64;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
    || !*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_63;
    }
    uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    uint64_t v23 = *(void *)(a1 + 96);
    *(_DWORD *)long long buf = 67109634;
    *(_DWORD *)uint64_t v68 = v21;
    *(_WORD *)&v68[4] = 2114;
    *(void *)&v68[6] = v22;
    *(_WORD *)&v68[14] = 2048;
    *(void *)&v68[16] = v23;
    uint64_t v24 = "Not propagating favorite state change for album artist (likedState=%d, timeStamp=%{public}@) with persistentID"
          "=%lld as the request is not valid";
    goto LABEL_25;
  }
  if ([*(id *)(a1 + 40) isEqualToString:@"_albumArtistLikedState"])
  {
    uint64_t v7 = [*(id *)(a1 + 56) valueForProperty:*MEMORY[0x1E4F78FF0]];
    id v15 = [*(id *)(a1 + 56) valueForProperty:*MEMORY[0x1E4F79018]];
    uint64_t v16 = [v15 longLongValue];

    id v17 = _MPLogCategoryLibrary();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138544130;
      *(void *)uint64_t v68 = v18;
      *(_WORD *)&v68[8] = 2114;
      *(void *)&v68[10] = v7;
      *(_WORD *)&v68[18] = 2048;
      *(void *)&v68[20] = v16;
      __int16 v69 = 1024;
      int v70 = v4;
      _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_DEFAULT, "Uploading property=%{public}@ for artistCloudID=%{public}@, storeID=%lld isCloudLibraryEnabled=%{BOOL}u", buf, 0x26u);
    }

    if (v4)
    {
      if ([v7 length])
      {
        uint64_t v19 = *(void *)(a1 + 64);
        v65[0] = *(void *)(a1 + 40);
        v65[1] = @"albumArtistDateFavorited";
        uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        v66[0] = v19;
        v66[1] = v20;
        v65[2] = @"albumArtistCloudUniversalLibraryID";
        v66[2] = v7;
        id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:3];
        [v3 setAlbumArtistProperties:v14 forEntityWithPersistentID:*(void *)(a1 + 96) completionHandler:0];
        goto LABEL_62;
      }
      if (v16)
      {
        uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        uint64_t v33 = *(void *)(a1 + 96);
        uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        if (v32 == 2)
        {
          int64_t v38 = v3;
          uint64_t v39 = *(void *)(a1 + 96);
          uint64_t v40 = v16;
          uint64_t v41 = 2;
LABEL_49:
          [v38 favoriteEntityWithPersistentID:v39 storeID:v40 entityType:v41 time:v34 completionHandler:0];
          goto LABEL_63;
        }
        goto LABEL_33;
      }
      id v14 = _MPLogCategoryLibrary();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_62;
      }
      uint64_t v52 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      uint64_t v53 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      uint64_t v54 = *(void *)(a1 + 96);
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)uint64_t v68 = v52;
      *(_WORD *)&v68[4] = 2114;
      *(void *)&v68[6] = v53;
      *(_WORD *)&v68[14] = 2048;
      *(void *)&v68[16] = v54;
      uint64_t v46 = "Not propagating favorite state change for album artist (likedState=%d, timeStamp=%{public}@) with persistent"
            "ID=%lld as it's missing store identifiers";
    }
    else
    {
      if (v16 || [v7 length])
      {
        uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        uint64_t v33 = *(void *)(a1 + 96);
        uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
LABEL_33:
        [v3 setLikedState:v32 forArtistWithStoreID:v16 persistentID:v33 timeStamp:v34 completion:0];
        goto LABEL_63;
      }
      id v14 = _MPLogCategoryLibrary();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_62;
      }
      uint64_t v49 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      uint64_t v50 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      uint64_t v51 = *(void *)(a1 + 96);
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)uint64_t v68 = v49;
      *(_WORD *)&v68[4] = 2114;
      *(void *)&v68[6] = v50;
      *(_WORD *)&v68[14] = 2048;
      *(void *)&v68[16] = v51;
      uint64_t v46 = "Not propagating favorite state change for album artist (likedState=%d, timeStamp=%{public}@) with persistent"
            "ID=%lld as cloudLibrary is not enabled and it's missing store identifiers";
    }
LABEL_60:
    id v47 = v14;
    uint32_t v48 = 28;
    goto LABEL_61;
  }
LABEL_64:
}

void __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_169(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];
}

void __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_170(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];
}

void __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke_177(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];
}

void __110__MPMediaLibraryDataProviderML3_setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"albumLikedState", @"_albumLikedState", @"albumArtistFavoriteState", @"_albumArtistLikedState", 0);
  uint64_t v1 = (void *)setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock____cloudPropertiesToUpload;
  setValue_forProperty_ofCollectionWithIdentifier_groupingType_completionBlock____cloudPropertiesToUpload = v0;
}

- (void)setValues:(id)a3 forProperties:(id)a4 forItemPersistentIDs:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 count] && objc_msgSend(v11, "count"))
  {
    SEL v24 = a2;
    uint64_t v25 = v11;
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    if ([v10 count])
    {
      unint64_t v14 = 0;
      do
      {
        id v15 = [v10 objectAtIndexedSubscript:v14];
        uint64_t v16 = [v9 objectAtIndexedSubscript:v14];
        id v17 = [MEMORY[0x1E4F79B50] propertyForMPMediaEntityProperty:v15];
        if (!v17)
        {
          uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
          [v19 handleFailureInMethod:v24, self, @"MPMediaLibraryDataProviderML3.m", 1497, @"No ML3Property for MPProperty: %@", v15 object file lineNumber description];
        }
        [v12 addObject:v17];
        uint64_t v18 = [(id)objc_opt_class() _unadjustedValueForMPProperty:v15 withDefaultValue:v16];
        if (!v18)
        {
          uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
        }
        [v13 addObject:v18];

        ++v14;
      }
      while (v14 < [v10 count]);
    }
    setValuesWidthLimitedQueue = self->_setValuesWidthLimitedQueue;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __78__MPMediaLibraryDataProviderML3_setValues_forProperties_forItemPersistentIDs___block_invoke;
    v28[3] = &unk_1E57F62E8;
    void v28[4] = self;
    id v29 = v13;
    id v30 = v12;
    id v11 = v25;
    id v31 = v25;
    id v21 = v12;
    id v22 = v13;
    [(NSOperationQueue *)setValuesWidthLimitedQueue addOperationWithBlock:v28];
    cloudUpdateQueue = self->_cloudUpdateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__MPMediaLibraryDataProviderML3_setValues_forProperties_forItemPersistentIDs___block_invoke_3;
    block[3] = &unk_1E57F9F98;
    block[4] = self;
    id v27 = v10;
    dispatch_async(cloudUpdateQueue, block);
  }
}

void __78__MPMediaLibraryDataProviderML3_setValues_forProperties_forItemPersistentIDs___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 88);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__MPMediaLibraryDataProviderML3_setValues_forProperties_forItemPersistentIDs___block_invoke_2;
  v5[3] = &unk_1E57F19D0;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v4;
  [v2 performDatabaseTransactionWithBlock:v5];
}

void __78__MPMediaLibraryDataProviderML3_setValues_forProperties_forItemPersistentIDs___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userIdentity];
  id v6 = +[MPCloudController controllerWithUserIdentity:v2];

  if ([v6 isCloudEnabled])
  {
    id v3 = MPTrackCloudPropertiesToAggregate();
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
    int v5 = [v3 intersectsSet:v4];

    if (v5) {
      [v6 uploadCloudItemProperties];
    }
  }
}

uint64_t __78__MPMediaLibraryDataProviderML3_setValues_forProperties_forItemPersistentIDs___block_invoke_2(void *a1, uint64_t a2)
{
  return [MEMORY[0x1E4F79B50] setValues:a1[4] forProperties:a1[5] forEntityPersistentIDs:a1[6] inLibrary:*(void *)(a1[7] + 88) usingConnection:a2];
}

- (void)setValue:(id)a3 forProperty:(id)a4 ofItemWithIdentifier:(int64_t)a5 completionBlock:(id)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v10 = a4;
  id v41 = a6;
  id v11 = [MEMORY[0x1E4F79B50] propertyForMPMediaEntityProperty:v10];
  if (v11)
  {
    uint64_t v12 = [(MPMediaLibraryDataProviderML3 *)self userIdentity];
    uint64_t v36 = +[MPCloudController controllerWithUserIdentity:v12];

    uint64_t v13 = (void *)[MEMORY[0x1E4F79B50] newWithPersistentID:a5 inLibrary:self->_library];
    int v14 = [v36 isCloudEnabled];
    uint64_t v60 = 0;
    uint64_t v61 = &v60;
    uint64_t v62 = 0x2020000000;
    uint64_t v63 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v71 = 0x3032000000;
    int v72 = __Block_byref_object_copy__22113;
    BOOL v73 = __Block_byref_object_dispose__22114;
    id v74 = 0;
    uint64_t v56 = 0;
    uint64_t v57 = &v56;
    uint64_t v58 = 0x2020000000;
    char v59 = 0;
    uint64_t v15 = [(id)objc_opt_class() _unadjustedValueForMPProperty:v10 withDefaultValue:v39];
    uint64_t v16 = (void *)MEMORY[0x1E4F1CA48];
    id v17 = (void *)v15;
    int64_t v38 = (void *)v15;
    if (!v15)
    {
      id v17 = [MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v40 = [v16 arrayWithObject:v17];
    if (!v38) {

    }
    uint64_t v18 = [MEMORY[0x1E4F1CA48] arrayWithObject:v11];
    uint64_t v37 = v18;
    if ([v11 isEqualToString:*MEMORY[0x1E4F79778]])
    {
      uint64_t v19 = [v38 integerValue];
      v61[3] = v19;
      [v40 addObject:MEMORY[0x1E4F1CC38]];
      [v18 addObject:*MEMORY[0x1E4F79780]];
      uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
      id v21 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v20;

      [v40 addObject:*(void *)(*((void *)&buf + 1) + 40)];
      id v22 = v18;
      [v18 addObject:*MEMORY[0x1E4F79788]];
      *((unsigned char *)v57 + 24) = 1;
      if (v14)
      {
        if ([v10 isEqualToString:@"_itemLikedState"])
        {
          if (v61[3] == 2)
          {
            dispatch_queue_t queue = (dispatch_queue_t)*MEMORY[0x1E4F796F8];
            uint64_t v23 = objc_msgSend(v13, "valueForProperty:");
            BOOL v24 = [v23 intValue] == 0;

            id v22 = v37;
            if (v24
              && (!_os_feature_enabled_impl() || [v36 favoriteSongAddToLibraryBehavior] != 2))
            {
              [v40 addObject:&unk_1EE6ED040];
              [v37 addObject:queue];
              [v40 addObject:*(void *)(*((void *)&buf + 1) + 40)];
              [v37 addObject:*MEMORY[0x1E4F79510]];
            }
          }
        }
      }
      uint64_t v26 = os_log_create("com.apple.amp.mediaplayer", "Library_Oversize");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v64 = 138543874;
        uint64_t v65 = v40;
        __int16 v66 = 2114;
        long long v67 = v22;
        __int16 v68 = 2048;
        int64_t v69 = a5;
        _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_DEFAULT, "Setting values=%{public}@ for properties=%{public}@, trackPid=%lld", v64, 0x20u);
      }

      uint64_t v18 = v37;
    }
    [v13 setValues:v40 forProperties:v18 async:1 withCompletionBlock:v41];
    if (MPTrackCloudPropertiesToUpload_onceToken != -1) {
      dispatch_once(&MPTrackCloudPropertiesToUpload_onceToken, &__block_literal_global_702);
    }
    id v27 = (id)MPTrackCloudPropertiesToUpload___trackPropertiesToUpload;
    uint64_t v28 = MPTrackCloudPropertiesToAggregate();
    queuea = self->_cloudUpdateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__MPMediaLibraryDataProviderML3_setValue_forProperty_ofItemWithIdentifier_completionBlock___block_invoke;
    block[3] = &unk_1E57F19A8;
    char v55 = v14;
    id v43 = v28;
    id v44 = v10;
    id v45 = v36;
    id v46 = v27;
    id v47 = v13;
    uint64_t v51 = &v60;
    p_long long buf = &buf;
    id v48 = v38;
    uint64_t v53 = &v56;
    int64_t v54 = a5;
    id v49 = v11;
    uint64_t v50 = self;
    id v29 = v38;
    id v30 = v13;
    id v31 = v27;
    id v32 = v36;
    id v33 = v28;
    dispatch_async(queuea, block);

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v60, 8);
  }
  else
  {
    uint64_t v25 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_1952E8000, v25, OS_LOG_TYPE_ERROR, "Could not find track property for property=%{public}@", (uint8_t *)&buf, 0xCu);
    }

    if (v41) {
      (*((void (**)(id, void, void))v41 + 2))(v41, 0, 0);
    }
  }
}

void __91__MPMediaLibraryDataProviderML3_setValue_forProperty_ofItemWithIdentifier_completionBlock___block_invoke(uint64_t a1)
{
  v59[2] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 128) && [*(id *)(a1 + 32) containsObject:*(void *)(a1 + 40)]) {
    [*(id *)(a1 + 48) uploadCloudItemProperties];
  }
  if ([*(id *)(a1 + 56) containsObject:*(void *)(a1 + 40)])
  {
    if ([*(id *)(a1 + 40) isEqualToString:@"_itemLikedState"])
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)
        && *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40))
      {
        uint64_t v2 = [*(id *)(a1 + 64) valueForProperty:*MEMORY[0x1E4F799C0]];
        uint64_t v3 = [v2 unsignedLongLongValue];

        uint64_t v4 = [*(id *)(a1 + 64) valueForProperty:*MEMORY[0x1E4F79978]];
        uint64_t v5 = [v4 unsignedLongLongValue];

        if (!v5)
        {
          id v6 = [*(id *)(a1 + 64) valueForProperty:*MEMORY[0x1E4F799D8]];
          uint64_t v5 = [v6 unsignedLongLongValue];
        }
        if (*(unsigned char *)(a1 + 128))
        {
          if (v3)
          {
            id v7 = *(void **)(a1 + 48);
            uint64_t v8 = *(void *)(a1 + 72);
            v58[0] = *(void *)(a1 + 40);
            v58[1] = @"likedStateChangedDate";
            uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
            v59[0] = v8;
            v59[1] = v9;
            id v10 = (void *)MEMORY[0x1E4F1C9E8];
            id v11 = v59;
            uint64_t v12 = v58;
            goto LABEL_29;
          }
          if (v5)
          {
            uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
            uint64_t v34 = *(void **)(a1 + 48);
            uint64_t v36 = *(void *)(a1 + 120);
            uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
            if (v35 == 2)
            {
              [v34 favoriteEntityWithPersistentID:*(void *)(a1 + 120) storeID:v5 entityType:0 time:v37 completionHandler:0];
              goto LABEL_40;
            }
            goto LABEL_46;
          }
          int v14 = _MPLogCategoryLibrary();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            uint64_t v44 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
            uint64_t v45 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
            uint64_t v46 = *(void *)(a1 + 120);
            *(_DWORD *)long long buf = 67109632;
            *(_DWORD *)id v49 = v44;
            *(_WORD *)&v49[4] = 2048;
            *(void *)&v49[6] = v45;
            *(_WORD *)&v49[14] = 2048;
            *(void *)&v49[16] = v46;
            uint64_t v18 = "Not propagating favorite state change for track (likedState=%d, timeStamp=%p) with persistentID=%lld a"
                  "s it's missing store identifiers";
            goto LABEL_17;
          }
LABEL_18:

          goto LABEL_40;
        }
        if (v5 | v3)
        {
          uint64_t v34 = *(void **)(a1 + 48);
          uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
          uint64_t v36 = *(void *)(a1 + 120);
          uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
LABEL_46:
          [v34 setLikedState:v35 forEntityWithStoreID:v5 persistentID:v36 timeStamp:v37 completion:0];
          goto LABEL_40;
        }
        int v14 = _MPLogCategoryLibrary();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_18;
        }
        uint64_t v41 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
        uint64_t v42 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
        uint64_t v43 = *(void *)(a1 + 120);
        *(_DWORD *)long long buf = 67109634;
        *(_DWORD *)id v49 = v41;
        *(_WORD *)&v49[4] = 2114;
        *(void *)&v49[6] = v42;
        *(_WORD *)&v49[14] = 2048;
        *(void *)&v49[16] = v43;
        uint64_t v18 = "Not propagating favorite state change for track (likedState=%d, timeStamp=%{public}@) with persistentID=%l"
              "ld as cloudLibrary is not enabled and it's missing store identifiers";
      }
      else
      {
        int v14 = os_log_create("com.apple.amp.mediaplayer", "Library");
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_18;
        }
        uint64_t v15 = *(void *)(a1 + 120);
        uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
        uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
        *(_DWORD *)long long buf = 134218498;
        *(void *)id v49 = v15;
        *(_WORD *)&v49[8] = 1024;
        *(_DWORD *)&v49[10] = v16;
        *(_WORD *)&v49[14] = 2114;
        *(void *)&v49[16] = v17;
        uint64_t v18 = "Not propagating favorite state change for trackPID=%lld as the request is not valid (likedState=%d, timeStamp=%{public}@";
      }
LABEL_17:
      _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_ERROR, v18, buf, 0x1Cu);
      goto LABEL_18;
    }
    if (*(unsigned char *)(a1 + 128))
    {
      uint64_t v13 = [*(id *)(a1 + 64) valueForProperty:*MEMORY[0x1E4F799C0]];
      uint64_t v3 = [v13 unsignedLongLongValue];
    }
    else
    {
      uint64_t v3 = 0;
    }
    uint64_t v19 = [*(id *)(a1 + 64) valueForProperty:*MEMORY[0x1E4F79978]];
    uint64_t v20 = [v19 unsignedLongLongValue];

    if (v20)
    {
      if (!v3) {
        goto LABEL_30;
      }
    }
    else
    {
      id v21 = [*(id *)(a1 + 64) valueForProperty:*MEMORY[0x1E4F799D8]];
      uint64_t v20 = [v21 unsignedLongLongValue];

      if (!v3) {
        goto LABEL_30;
      }
    }
    uint64_t v22 = *(void *)(a1 + 72);
    if (v22)
    {
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24))
      {
        id v7 = *(void **)(a1 + 48);
        uint64_t v54 = *(void *)(a1 + 40);
        uint64_t v55 = v22;
        id v10 = (void *)MEMORY[0x1E4F1C9E8];
        id v11 = &v55;
        uint64_t v12 = &v54;
        uint64_t v27 = 1;
        goto LABEL_38;
      }
      uint64_t v23 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) timeIntervalSince1970];
        *(_DWORD *)long long buf = 134217984;
        *(void *)id v49 = (uint64_t)v24;
        _os_log_impl(&dword_1952E8000, v23, OS_LOG_TYPE_DEFAULT, "setting time stamp for content taste change=%lld", buf, 0xCu);
      }

      id v7 = *(void **)(a1 + 48);
      uint64_t v25 = *(void *)(a1 + 72);
      v56[0] = *(void *)(a1 + 40);
      v56[1] = @"likedStateChangedDate";
      uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
      v57[0] = v25;
      v57[1] = v26;
      id v10 = (void *)MEMORY[0x1E4F1C9E8];
      id v11 = v57;
      uint64_t v12 = v56;
LABEL_29:
      uint64_t v27 = 2;
LABEL_38:
      id v30 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:v27];
      [v7 setItemProperties:v30 forSagaID:v3];
LABEL_39:

      goto LABEL_40;
    }
LABEL_30:
    if (v20 && [*(id *)(a1 + 40) isEqualToString:@"likedState"])
    {
      uint64_t v28 = [*(id *)(a1 + 64) valueForProperty:*MEMORY[0x1E4F797A8]];
      uint64_t v29 = MPMediaTypeForMLMediaType([v28 unsignedIntegerValue]);

      [*(id *)(a1 + 48) setLikedState:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) forEntityWithStoreID:v20 withMediaType:v29 timeStamp:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
      goto LABEL_40;
    }
    id v30 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = *(void *)(a1 + 120);
      uint64_t v33 = *(void *)(a1 + 72);
      uint64_t v32 = *(void *)(a1 + 80);
      *(_DWORD *)long long buf = 138544386;
      *(void *)id v49 = v32;
      *(_WORD *)&v49[8] = 2048;
      *(void *)&v49[10] = v31;
      *(_WORD *)&v49[18] = 2048;
      *(void *)&v49[20] = v3;
      __int16 v50 = 2048;
      uint64_t v51 = v20;
      __int16 v52 = 2048;
      uint64_t v53 = v33;
      _os_log_impl(&dword_1952E8000, v30, OS_LOG_TYPE_DEFAULT, "Not propagating change for property %{public}@, trackPID=%lld, sagaID=%lld, storeID=%lld, id=%p", buf, 0x34u);
    }
    goto LABEL_39;
  }
LABEL_40:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24))
  {
    uint64_t v38 = *(void *)(a1 + 88);
    id v39 = *(void **)(v38 + 88);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __91__MPMediaLibraryDataProviderML3_setValue_forProperty_ofItemWithIdentifier_completionBlock___block_invoke_157;
    v47[3] = &unk_1E57F1980;
    uint64_t v40 = *(void *)(a1 + 104);
    v47[4] = v38;
    v47[5] = v40;
    [v39 databaseConnectionAllowingWrites:1 withBlock:v47];
  }
}

void __91__MPMediaLibraryDataProviderML3_setValue_forProperty_ofItemWithIdentifier_completionBlock___block_invoke_157(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [MEMORY[0x1E4F79AB8] currentDeviceFavoritesPlaylistInLibrary:*(void *)(*(void *)(a1 + 32) + 88) usingConnection:a2];
  if (v3)
  {
    id v4 = v3;
    [v3 setValue:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forProperty:*MEMORY[0x1E4F791C8]];
    uint64_t v3 = v4;
  }
}

- (BOOL)isCurrentThreadInTransaction
{
  return [(ML3MusicLibrary *)self->_library isCurrentThreadInTransaction];
}

- (void)performReadTransactionWithBlock:(id)a3
{
  id v4 = a3;
  library = self->_library;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __65__MPMediaLibraryDataProviderML3_performReadTransactionWithBlock___block_invoke;
  v7[3] = &unk_1E57F1958;
  id v8 = v4;
  id v6 = v4;
  [(ML3MusicLibrary *)library databaseConnectionAllowingWrites:0 withBlock:v7];
}

void __65__MPMediaLibraryDataProviderML3_performReadTransactionWithBlock___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__MPMediaLibraryDataProviderML3_performReadTransactionWithBlock___block_invoke_2;
  v3[3] = &unk_1E57F1930;
  id v4 = *(id *)(a1 + 32);
  [a2 performTransactionWithBlock:v3];
}

uint64_t __65__MPMediaLibraryDataProviderML3_performReadTransactionWithBlock___block_invoke_2(uint64_t a1)
{
  return 1;
}

- (BOOL)performTransactionWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  library = self->_library;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __61__MPMediaLibraryDataProviderML3_performTransactionWithBlock___block_invoke;
  v8[3] = &unk_1E57F1908;
  id v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [(ML3MusicLibrary *)library performDatabaseTransactionWithBlock:v8];
  LOBYTE(library) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)library;
}

uint64_t __61__MPMediaLibraryDataProviderML3_performTransactionWithBlock___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)loadValueForAggregateFunction:(id)a3 onCollectionsForProperty:(id)a4 queryCriteria:(id)a5 completionBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = ML3CollectionEntityClassForMPMediaItemCollectionProperty(v12);
  id v15 = [v11 ML3CollectionsQueryInLibrary:self->_library];

  [(MPMediaLibraryDataProviderML3 *)self _loadValueForAggregateFunction:v13 entityClass:v14 property:v12 query:v15 completionBlock:v10];
}

- (void)loadValueForAggregateFunction:(id)a3 onItemsForProperty:(id)a4 queryCriteria:(id)a5 completionBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = objc_opt_class();
  id v15 = [v11 ML3ItemsQueryInLibrary:self->_library];

  [(MPMediaLibraryDataProviderML3 *)self _loadValueForAggregateFunction:v13 entityClass:v14 property:v12 query:v15 completionBlock:v10];
}

- (void)enumerateCollectionIdentifiersForQueryCriteria:(id)a3 ordered:(BOOL)a4 cancelBlock:(id)a5 usingBlock:(id)a6
{
  BOOL v28 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v29 = a5;
  id v26 = a6;
  uint64_t v27 = self;
  id v10 = [v9 ML3CollectionsQueryInLibrary:self->_library];
  id v30 = v9;
  id v11 = [v9 collectionPropertiesToFetch];
  uint64_t v12 = [v11 count];
  id v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v12];
  uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v12];
  id v15 = (void *)[v10 entityClass];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v22 = [v15 propertyForMPMediaEntityProperty:v21];
        if (v22)
        {
          [v13 addObject:v22];
          [v14 addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v18);
  }

  size_t v23 = [v14 count];
  double v24 = malloc_type_calloc(v23, 8uLL, 0x80040B8603338uLL);
  objc_msgSend(v14, "getObjects:range:", v24, 0, v23);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __111__MPMediaLibraryDataProviderML3_enumerateCollectionIdentifiersForQueryCriteria_ordered_cancelBlock_usingBlock___block_invoke;
  v31[3] = &unk_1E57F18E0;
  size_t v33 = v23;
  uint64_t v34 = v24;
  v31[4] = v27;
  id v32 = v26;
  id v25 = v26;
  [v10 enumeratePersistentIDsAndProperties:v13 ordered:v28 cancelBlock:v29 usingBlock:v31];
  free(v24);
}

void __111__MPMediaLibraryDataProviderML3_enumerateCollectionIdentifiersForQueryCriteria_ordered_cancelBlock_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x19971DE60]();
  if (*(void *)(a1 + 48))
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:*(void *)(a1 + 48)];
    if (*(void *)(a1 + 48))
    {
      unint64_t v7 = 0;
      do
      {
        id v8 = [*(id *)(a1 + 32) adjustedValueForMPProperty:*(void *)(*(void *)(a1 + 56) + 8 * v7) ofEntity:0 withDefaultValue:*(void *)(a3 + 8 * v7)];
        [v6 setValue:v8 forKey:*(void *)(*(void *)(a1 + 56) + 8 * v7)];

        ++v7;
      }
      while (v7 < *(void *)(a1 + 48));
    }
  }
  else
  {
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_addGlobalPlaylistsToLibraryDatabase:(id)a3 asLibraryOwned:(BOOL)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "Fetching global playlists with IDs %{public}@...", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000;
  double v24 = __Block_byref_object_copy__22113;
  id v25 = __Block_byref_object_dispose__22114;
  id v26 = [MEMORY[0x1E4F1CA60] dictionary];
  id v11 = objc_alloc_init(MEMORY[0x1E4FB8750]);
  uint64_t v12 = [(MPMediaLibraryDataProviderML3 *)self _storePlatformRequestContext];
  [v11 setRequestContext:v12];

  [v11 setPersonalizationStyle:0];
  [v11 setKeyProfile:*MEMORY[0x1E4FB84F8]];
  [v11 setItemIdentifiers:v8];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__MPMediaLibraryDataProviderML3__addGlobalPlaylistsToLibraryDatabase_asLibraryOwned_completion___block_invoke;
  v16[3] = &unk_1E57F1890;
  id v13 = v8;
  BOOL v21 = a4;
  id v17 = v13;
  uint64_t v18 = self;
  p_long long buf = &buf;
  id v14 = v9;
  id v19 = v14;
  id v15 = (id)[v11 performWithResponseHandler:v16];

  _Block_object_dispose(&buf, 8);
}

void __96__MPMediaLibraryDataProviderML3__addGlobalPlaylistsToLibraryDatabase_asLibraryOwned_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = v6;
  uint64_t v44 = v5;
  if (v5 && !v6)
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v41 = [MEMORY[0x1E4F1CA48] array];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v42 = a1;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v49 objects:v59 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v50 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          id v15 = [v44 itemForIdentifier:v14];
          id v16 = os_log_create("com.apple.amp.mediaplayer", "Library");
          id v17 = v16;
          if (v15)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138543362;
              uint64_t v58 = v14;
              _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_DEFAULT, "Found playlist data for %{public}@", buf, 0xCu);
            }

            [v8 addObject:v15];
            if (*(unsigned char *)(a1 + 64)) {
              [v41 addObject:v15];
            }
          }
          else
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138543362;
              uint64_t v58 = v14;
              _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_ERROR, "Did not find playlist data for %{public}@", buf, 0xCu);
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v49 objects:v59 count:16];
      }
      while (v11);
    }

    id v18 = v8;
    if ([v8 count])
    {
      id v19 = (void *)[objc_alloc(MEMORY[0x1E4F79B40]) initWithLookupItems:v8];
      if (*(unsigned char *)(a1 + 64)) {
        uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F79B48]) initWithLookupItems:v41];
      }
      else {
        uint64_t v20 = 0;
      }
      id v32 = [*(id *)(v42 + 40) library];
      uint64_t v31 = [v32 databasePath];

      id v33 = objc_alloc(MEMORY[0x1E4F79B00]);
      uint64_t v34 = [v20 trackData];
      long long v35 = [v19 playlistsData];
      long long v36 = (void *)[v33 initWithLibraryPath:v31 trackData:v34 playlistData:v35];

      [v36 setTracksAreLibraryOwnedContent:0];
      [v36 setPlaylistsAreLibraryOwnedContent:*(unsigned __int8 *)(v42 + 64)];
      [v36 setPendingMatch:0];
      long long v37 = [MEMORY[0x1E4F79B60] sharedMediaLibraryService];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __96__MPMediaLibraryDataProviderML3__addGlobalPlaylistsToLibraryDatabase_asLibraryOwned_completion___block_invoke_139;
      v45[3] = &unk_1E57F1868;
      id v38 = *(id *)(v42 + 32);
      uint64_t v39 = *(void *)(v42 + 40);
      id v46 = v38;
      uint64_t v47 = v39;
      long long v43 = *(_OWORD *)(v42 + 48);
      id v40 = (id)v43;
      long long v48 = v43;
      [v37 performImport:v36 fromSource:6 withProgressBlock:0 completionHandler:v45];

      unint64_t v7 = 0;
    }
    else
    {
      uint64_t v27 = *(void *)(a1 + 48);
      unint64_t v7 = 0;
      if (!v27)
      {
LABEL_33:

        goto LABEL_34;
      }
      uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      id v29 = (void *)MEMORY[0x1E4F28C58];
      id v30 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v30);
      uint64_t v55 = *MEMORY[0x1E4F28568];
      uint64_t v56 = @"items not found";
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      uint64_t v31 = [v29 errorWithDomain:v19 code:-1 userInfo:v20];
      (*(void (**)(uint64_t, uint64_t, void *))(v27 + 16))(v27, v28, v31);
    }

    goto LABEL_33;
  }
  if (v6)
  {
    BOOL v21 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v58 = v7;
      _os_log_impl(&dword_1952E8000, v21, OS_LOG_TYPE_ERROR, "Error fetching playlist data. %{public}@", buf, 0xCu);
    }

    id v18 = v7;
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = (objc_class *)objc_opt_class();
    double v24 = NSStringFromClass(v23);
    uint64_t v53 = *MEMORY[0x1E4F28568];
    uint64_t v54 = @"item not found";
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    id v18 = [v22 errorWithDomain:v24 code:-1 userInfo:v25];
  }
  uint64_t v26 = *(void *)(a1 + 48);
  if (v26) {
    (*(void (**)(uint64_t, void, id))(v26 + 16))(v26, 0, v18);
  }
LABEL_34:
}

void __96__MPMediaLibraryDataProviderML3__addGlobalPlaylistsToLibraryDatabase_asLibraryOwned_completion___block_invoke_139(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (a2)
  {
    if (v8)
    {
      uint64_t v10 = MSVPropertyListDataClasses();
      uint64_t v11 = MSVUnarchivedObjectOfClasses();
    }
    else
    {
      uint64_t v11 = 0;
    }
    id v30 = v9;
    id v31 = v7;
    id v13 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v38 = v11;
      _os_log_impl(&dword_1952E8000, v13, OS_LOG_TYPE_DEFAULT, "Successfully imported playlist data. Imported tracks: %@", buf, 0xCu);
    }
    id v29 = v11;

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v34;
      uint64_t v17 = *MEMORY[0x1E4F79150];
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v20 = (void *)MEMORY[0x1E4F79AB8];
          BOOL v21 = [*(id *)(a1 + 40) library];
          uint64_t v22 = [MEMORY[0x1E4F79AA0] predicateWithProperty:v17 equalToValue:v19];
          uint64_t v23 = [v20 queryWithLibrary:v21 predicate:v22 options:1];

          uint64_t v24 = [v23 anyEntityPersistentID];
          id v25 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          uint64_t v26 = [NSNumber numberWithLongLong:v24];
          [v25 setObject:v26 forKey:v19];

          uint64_t v27 = os_log_create("com.apple.amp.mediaplayer", "Library");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 134218242;
            uint64_t v38 = v24;
            __int16 v39 = 2114;
            uint64_t v40 = v19;
            _os_log_impl(&dword_1952E8000, v27, OS_LOG_TYPE_DEFAULT, "found container_pid:%lld for global playlistid:%{public}@", buf, 0x16u);
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v15);
    }

    id v9 = v30;
    id v7 = v31;
    uint64_t v12 = v29;
  }
  else
  {
    uint64_t v12 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_ERROR, "Error importing playlist data.", buf, 2u);
    }
  }

  uint64_t v28 = *(void *)(a1 + 48);
  if (v28) {
    (*(void (**)(uint64_t, void, id))(v28 + 16))(v28, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v7);
  }
}

- (void)addNonLibraryOwnedPlaylistsWithGlobalIDs:(id)a3 completion:(id)a4
{
}

- (void)addToLocalDeviceLibraryGlobalPlaylistWithID:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "import global playlist with id %@ to local device library", buf, 0xCu);
  }

  id v13 = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__MPMediaLibraryDataProviderML3_addToLocalDeviceLibraryGlobalPlaylistWithID_completion___block_invoke;
  v11[3] = &unk_1E57F8B98;
  id v12 = v7;
  id v10 = v7;
  [(MPMediaLibraryDataProviderML3 *)self _addGlobalPlaylistsToLibraryDatabase:v9 asLibraryOwned:1 completion:v11];
}

uint64_t __88__MPMediaLibraryDataProviderML3_addToLocalDeviceLibraryGlobalPlaylistWithID_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addGlobalPlaylistWithID:(id)a3 andAddToCloudLibrary:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __89__MPMediaLibraryDataProviderML3_addGlobalPlaylistWithID_andAddToCloudLibrary_completion___block_invoke;
  v26[3] = &unk_1E57F90A0;
  id v27 = v9;
  id v10 = v9;
  uint64_t v11 = (void *)MEMORY[0x19971E0F0](v26);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __89__MPMediaLibraryDataProviderML3_addGlobalPlaylistWithID_andAddToCloudLibrary_completion___block_invoke_2;
  BOOL v21 = &unk_1E57F1840;
  BOOL v25 = v6;
  uint64_t v22 = self;
  id v12 = v8;
  id v23 = v12;
  id v24 = v11;
  id v13 = v11;
  uint64_t v14 = (void *)MEMORY[0x19971E0F0](&v18);
  id v15 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = "no";
    if (v6) {
      uint64_t v16 = "yes";
    }
    *(_DWORD *)long long buf = 138412546;
    id v30 = v12;
    __int16 v31 = 2080;
    id v32 = v16;
    _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_DEFAULT, "import global playlist with id %@ - add to cloud library: %s...", buf, 0x16u);
  }

  id v28 = v12;
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v28, 1, v18, v19, v20, v21, v22);
  [(MPMediaLibraryDataProviderML3 *)self _addGlobalPlaylistsToLibraryDatabase:v17 asLibraryOwned:1 completion:v14];
}

uint64_t __89__MPMediaLibraryDataProviderML3_addGlobalPlaylistWithID_andAddToCloudLibrary_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __89__MPMediaLibraryDataProviderML3_addGlobalPlaylistWithID_andAddToCloudLibrary_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = [*(id *)(a1 + 32) userIdentity];
    uint64_t v3 = +[MPCloudController controllerWithUserIdentity:v2];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __89__MPMediaLibraryDataProviderML3_addGlobalPlaylistWithID_andAddToCloudLibrary_completion___block_invoke_3;
    v6[3] = &unk_1E57F8B98;
    uint64_t v4 = *(void *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    [v3 addStorePlaylistWithGlobalID:v4 completionHandler:v6];
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

void __89__MPMediaLibraryDataProviderML3_addGlobalPlaylistWithID_andAddToCloudLibrary_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplayer", "Library");
  BOOL v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      id v12 = v4;
      id v7 = "Failed to add global playlist to cloud library. %{public}@";
      id v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 12;
LABEL_6:
      _os_log_impl(&dword_1952E8000, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    id v7 = "Successfully added playlist to cloud library.";
    id v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v4);
}

- (void)removeArtworkForEntityPersistentID:(unint64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6
{
  library = self->_library;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __102__MPMediaLibraryDataProviderML3_removeArtworkForEntityPersistentID_entityType_artworkType_sourceType___block_invoke;
  v7[3] = &unk_1E57F1818;
  void v7[4] = self;
  void v7[5] = a3;
  v7[6] = a4;
  v7[7] = a5;
  void v7[8] = a6;
  [(ML3MusicLibrary *)library databaseConnectionAllowingWrites:1 withBlock:v7];
}

void __102__MPMediaLibraryDataProviderML3_removeArtworkForEntityPersistentID_entityType_artworkType_sourceType___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 88);
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  uint64_t v7 = a1[8];
  id v8 = a2;
  [v4 removeArtworkTokenForEntityPersistentID:v3 entityType:v5 artworkType:v6 sourceType:v7 usingConnection:v8];
  [*(id *)(a1[4] + 88) updateBestArtworkTokenForEntityPersistentID:a1[5] entityType:a1[6] artworkType:a1[7] retrievalTime:0 preserveExistingAvailableToken:v8 usingConnection:0.0];
}

- (BOOL)importOriginalArtworkFromImageData:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unint64_t)a7
{
  unsigned int v7 = a7;
  id v12 = a4;
  id v13 = a3;
  LOBYTE(v7) = [(ML3MusicLibrary *)self->_library importOriginalArtworkFromImageData:v13 withArtworkToken:v12 artworkType:a5 sourceType:a6 mediaType:MLMediaTypeForMPMediaType(v7)];

  return v7;
}

- (void)importArtworkTokenForEntityPersistentID:(unint64_t)a3 entityType:(int64_t)a4 artworkToken:(id)a5 artworkType:(int64_t)a6 sourceType:(int64_t)a7
{
  id v12 = a5;
  [(ML3MusicLibrary *)self->_library importArtworkTokenForEntityPersistentID:a3 entityType:a4 artworkToken:v12 artworkType:a6 sourceType:a7];
}

- (void)_importStoreAlbumArtistElements:(id)a3 withReferralObject:(id)a4 withCompletion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  os_log_type_t v9 = os_log_create("com.apple.amp.mediaplayer", "Library_Oversize");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    uint64_t v25 = [v7 count];
    __int16 v26 = 2114;
    id v27 = v7;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "Adding %llu store album artists to device only library %{public}@", buf, 0x16u);
  }

  uint32_t v10 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "Parsing album artist data...", buf, 2u);
  }

  int v11 = [[MPStoreItemImportAlbumArtistData alloc] initWithAlbumArtistImportElements:v7];
  id v12 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [(ML3StoreItemAlbumArtistData *)v11 albumArtistCount];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v25 = v13;
    _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEFAULT, "Importing %lu album artists...", buf, 0xCu);
  }

  uint64_t v14 = [(MPMediaLibraryDataProviderML3 *)self library];
  id v15 = [v14 databasePath];

  id v16 = objc_alloc(MEMORY[0x1E4F79B00]);
  uint64_t v17 = [(ML3StoreItemAlbumArtistData *)v11 albumArtistData];
  uint64_t v18 = MSVTCCIdentityForCurrentProcess();
  uint64_t v19 = (void *)[v16 initWithLibraryPath:v15 trackData:0 playlistData:0 albumArtistData:v17 albumData:0 clientIdentity:v18];

  uint64_t v20 = [MEMORY[0x1E4F79B60] sharedMediaLibraryService];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __99__MPMediaLibraryDataProviderML3__importStoreAlbumArtistElements_withReferralObject_withCompletion___block_invoke;
  v22[3] = &unk_1E57F17C8;
  id v23 = v8;
  id v21 = v8;
  [v20 performImport:v19 fromSource:6 withProgressBlock:0 completionHandler:v22];
}

void __99__MPMediaLibraryDataProviderML3__importStoreAlbumArtistElements_withReferralObject_withCompletion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    os_log_type_t v9 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "Successfully imported artist data.", (uint8_t *)&v14, 2u);
    }
  }
  if (v8)
  {
    uint32_t v10 = MSVPropertyListDataClasses();
    int v11 = MSVUnarchivedObjectOfClasses();
  }
  else
  {
    int v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v12 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = v11;
    _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEFAULT, "Importing album artists pids=%{public}@", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v11, v7);
  }
}

- (void)_importStoreItemElements:(id)a3 withReferralObject:(id)a4 addTracksToDeviceLibraryOnly:(BOOL)a5 andAddTracksToCloudLibrary:(BOOL)a6 usingCloudAdamID:(int64_t)a7 withCompletion:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  uint64_t v16 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218754;
    uint64_t v36 = [v13 count];
    __int16 v37 = 1024;
    BOOL v38 = v9;
    __int16 v39 = 1024;
    BOOL v40 = v10;
    __int16 v41 = 2114;
    id v42 = v13;
    _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_DEFAULT, "Adding %llu store items to library (add to cloud library: %{BOOL}u, local library:%{BOOL}u): %{public}@", buf, 0x22u);
  }

  uint64_t v17 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_DEFAULT, "Parsing track data...", buf, 2u);
  }

  uint64_t v18 = [[MPStoreItemImportTrackData alloc] initWithImportElements:v13];
  uint64_t v19 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = [(ML3StoreItemTrackData *)v18 trackCount];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v36 = v20;
    _os_log_impl(&dword_1952E8000, v19, OS_LOG_TYPE_DEFAULT, "Importing %lu tracks...", buf, 0xCu);
  }

  id v21 = [(MPMediaLibraryDataProviderML3 *)self library];
  uint64_t v22 = [v21 databasePath];

  id v23 = objc_alloc(MEMORY[0x1E4F79B00]);
  id v24 = [(ML3StoreItemTrackData *)v18 trackData];
  uint64_t v25 = (void *)[v23 initWithLibraryPath:v22 trackData:v24 playlistData:0];

  [v25 setTracksAreLibraryOwnedContent:v10 | v9];
  [v25 setPendingMatch:v10 | v9];
  __int16 v26 = [MEMORY[0x1E4F79B60] sharedMediaLibraryService];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __165__MPMediaLibraryDataProviderML3__importStoreItemElements_withReferralObject_addTracksToDeviceLibraryOnly_andAddTracksToCloudLibrary_usingCloudAdamID_withCompletion___block_invoke;
  v30[3] = &unk_1E57F17F0;
  BOOL v34 = v9;
  v30[4] = self;
  id v31 = v14;
  id v32 = v15;
  int64_t v33 = a7;
  id v27 = v15;
  id v28 = v14;
  [v26 performImport:v25 fromSource:6 withProgressBlock:0 completionHandler:v30];
}

void __165__MPMediaLibraryDataProviderML3__importStoreItemElements_withReferralObject_addTracksToDeviceLibraryOnly_andAddTracksToCloudLibrary_usingCloudAdamID_withCompletion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = os_log_create("com.apple.amp.mediaplayer", "Library");
  BOOL v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "Successfully imported track data.", buf, 2u);
    }

    if (v8)
    {
      int v11 = MSVPropertyListDataClasses();
      id v12 = MSVUnarchivedObjectOfClasses();
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F1CBF0];
    }
    if (*(unsigned char *)(a1 + 64))
    {
      id v14 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = *(void **)(a1 + 56);
        *(_DWORD *)long long buf = 134217984;
        id v25 = v15;
        _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_DEFAULT, "Adding %lld to cloud library...", buf, 0xCu);
      }

      uint64_t v16 = [*(id *)(a1 + 32) userIdentity];
      uint64_t v17 = +[MPCloudController controllerWithUserIdentity:v16];
      uint64_t v18 = *(void *)(a1 + 40);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __165__MPMediaLibraryDataProviderML3__importStoreItemElements_withReferralObject_addTracksToDeviceLibraryOnly_andAddTracksToCloudLibrary_usingCloudAdamID_withCompletion___block_invoke_133;
      v21[3] = &unk_1E57F1750;
      uint64_t v19 = *(void *)(a1 + 56);
      id v23 = *(id *)(a1 + 48);
      id v22 = v12;
      [v17 addStoreItemWithAdamID:v19 referralObject:v18 completionHandler:v21];
    }
    else
    {
      uint64_t v20 = *(void *)(a1 + 48);
      if (v20) {
        (*(void (**)(uint64_t, void *, void))(v20 + 16))(v20, v12, 0);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v25 = v7;
      _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_ERROR, "Failed to import track data. %{public}@", buf, 0xCu);
    }

    uint64_t v13 = *(void *)(a1 + 48);
    if (v13) {
      (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v7);
    }
  }
}

void __165__MPMediaLibraryDataProviderML3__importStoreItemElements_withReferralObject_addTracksToDeviceLibraryOnly_andAddTracksToCloudLibrary_usingCloudAdamID_withCompletion___block_invoke_133(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_ERROR, "Error adding track(s) to cloud library. %{public}@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      BOOL v10 = *(void (**)(void))(v9 + 16);
LABEL_10:
      v10();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "Successfully added track(s) to cloud library.", (uint8_t *)&v12, 2u);
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      BOOL v10 = *(void (**)(void))(v11 + 16);
      goto LABEL_10;
    }
  }
}

- (void)addPlaylistStoreItemsForLookupItems:(id)a3 withCompletion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "Parsing track data...", buf, 2u);
  }

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F79B48]) initWithLookupItems:v7];
  BOOL v10 = [(MPMediaLibraryDataProviderML3 *)self userIdentity];
  uint64_t v11 = +[MPCloudController controllerWithUserIdentity:v10];
  uint64_t v12 = [v11 cloudAddToPlaylistBehavior];

  id v13 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v9 trackCount];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v26 = v14;
    _os_log_impl(&dword_1952E8000, v13, OS_LOG_TYPE_DEFAULT, "Importing %lu tracks...", buf, 0xCu);
  }
  BOOL v15 = v12 != 2;

  uint64_t v16 = [(MPMediaLibraryDataProviderML3 *)self library];
  uint64_t v17 = [v16 databasePath];

  id v18 = objc_alloc(MEMORY[0x1E4F79B00]);
  uint64_t v19 = [v9 trackData];
  uint64_t v20 = (void *)[v18 initWithLibraryPath:v17 trackData:v19 playlistData:0];

  [v20 setTracksAreLibraryOwnedContent:v15];
  [v20 setPendingMatch:v15];
  id v21 = [MEMORY[0x1E4F79B60] sharedMediaLibraryService];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __84__MPMediaLibraryDataProviderML3_addPlaylistStoreItemsForLookupItems_withCompletion___block_invoke;
  v23[3] = &unk_1E57F17C8;
  id v24 = v6;
  id v22 = v6;
  [v21 performImport:v20 fromSource:6 withProgressBlock:0 completionHandler:v23];
}

void __84__MPMediaLibraryDataProviderML3_addPlaylistStoreItemsForLookupItems_withCompletion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "Library");
  BOOL v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "Successfully imported track data.", (uint8_t *)&v15, 2u);
    }

    uint64_t v11 = MSVPropertyListDataClasses();
    uint64_t v12 = MSVUnarchivedObjectOfClasses();

    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v12, 0);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543362;
      id v16 = v7;
      _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_ERROR, "Failed to import track data. %{public}@", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      (*(void (**)(uint64_t, void, id))(v14 + 16))(v14, 0, v7);
    }
  }
}

- (void)performStoreAlbumArtistLibraryImport:(id)a3 withCompletion:(id)a4
{
  v42[0] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v28 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v5 importElements];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v13 = [v12 storeItem];

        if (v13)
        {
          [v6 addObject:v12];
        }
        else
        {
          uint64_t quot = [v12 storeItemID];
          uint64_t v15 = quot;
          id v16 = (char *)v42 + 1;
          do
          {
            lldiv_t v17 = lldiv(quot, 10);
            uint64_t quot = v17.quot;
            if (v17.rem >= 0) {
              LOBYTE(v18) = v17.rem;
            }
            else {
              uint64_t v18 = -v17.rem;
            }
            *(v16 - 2) = v18 + 48;
            uint64_t v19 = (const UInt8 *)(v16 - 2);
            --v16;
          }
          while (v17.quot);
          if (v15 < 0)
          {
            *(v16 - 2) = 45;
            uint64_t v19 = (const UInt8 *)(v16 - 2);
          }
          uint64_t v20 = (__CFString *)CFStringCreateWithBytes(0, v19, (char *)v42 - (char *)v19, 0x8000100u, 0);
          [v29 addObject:v20];
        }
        id v21 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "storeItemID"));
        [v7 setObject:v12 forKey:v21];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v9);
  }
  if ([v29 count])
  {
    id v22 = objc_alloc_init(MEMORY[0x1E4FB8750]);
    id v23 = [(MPMediaLibraryDataProviderML3 *)self _storePlatformRequestContext];
    [v22 setRequestContext:v23];

    [v22 setItemIdentifiers:v29];
    [v22 setPersonalizationStyle:0];
    [v22 setKeyProfile:*MEMORY[0x1E4FB84F8]];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __85__MPMediaLibraryDataProviderML3_performStoreAlbumArtistLibraryImport_withCompletion___block_invoke;
    v31[3] = &unk_1E57F17A0;
    id v24 = v28;
    id v36 = v28;
    id v32 = v7;
    id v33 = v6;
    BOOL v34 = self;
    id v25 = v5;
    id v35 = v5;
    id v26 = (id)[v22 performWithResponseHandler:v31];
  }
  else
  {
    id v25 = v5;
    id v22 = [v5 referralObject];
    id v24 = v28;
    [(MPMediaLibraryDataProviderML3 *)self _importStoreAlbumArtistElements:v6 withReferralObject:v22 withCompletion:v28];
  }
}

void __85__MPMediaLibraryDataProviderML3_performStoreAlbumArtistLibraryImport_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v31 = v6;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "Error fetching store content for item add. %{public}@", buf, 0xCu);
    }

    uint64_t v8 = *(void *)(a1 + 64);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
    }
  }
  else
  {
    [v5 allItems];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v14 = *(void **)(a1 + 32);
          uint64_t v15 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v13, "storeAdamID"));
          id v16 = [v14 objectForKey:v15];
          lldiv_t v17 = [v16 additionalTrackMetadata];

          uint64_t v18 = [MPStoreItemLibraryImportLookupElement alloc];
          uint64_t v19 = [v13 metadataDictionary];
          uint64_t v20 = [(MPStoreItemLibraryImportLookupElement *)v18 initWithLookupDictionary:v19 additionalTrackMetadata:v17];

          [*(id *)(a1 + 40) addObject:v20];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }
    uint64_t v22 = *(void *)(a1 + 40);
    id v21 = *(void **)(a1 + 48);
    id v23 = [*(id *)(a1 + 56) referralObject];
    [v21 _importStoreAlbumArtistElements:v22 withReferralObject:v23 withCompletion:*(void *)(a1 + 64)];

    id v6 = 0;
  }
}

- (void)performStoreItemLibraryImport:(id)a3 withCompletion:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v38 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v39 = v5;
  uint64_t v9 = [v5 importElements];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v52 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v15 = [v14 storeItem];

        if (v15)
        {
          [v6 addObject:v14];
        }
        else
        {
          id v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v14, "storeItemID"));
          [v7 addObject:v16];
        }
        lldiv_t v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v14, "storeItemID"));
        [v8 setObject:v14 forKey:v17];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v11);
  }
  uint64_t v18 = [v7 count];
  if (v18)
  {
    uint64_t v19 = v18;
    if (v18 == 1)
    {
      uint64_t v20 = [v7 firstObject];
      uint64_t v36 = [v20 longLongValue];
    }
    else
    {
      uint64_t v36 = 0;
    }
    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v19];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v27 = v7;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v48 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * j), "stringValue", v36);
          [v22 addObject:v32];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v29);
    }

    id v33 = objc_alloc_init(MEMORY[0x1E4FB8750]);
    BOOL v34 = [(MPMediaLibraryDataProviderML3 *)self _storePlatformRequestContext];
    [v33 setRequestContext:v34];

    [v33 setItemIdentifiers:v22];
    [v33 setPersonalizationStyle:0];
    [v33 setKeyProfile:*MEMORY[0x1E4FB84F8]];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __78__MPMediaLibraryDataProviderML3_performStoreItemLibraryImport_withCompletion___block_invoke;
    v40[3] = &unk_1E57F1778;
    long long v26 = v38;
    id v45 = v38;
    id v41 = v8;
    id v42 = v6;
    uint64_t v43 = self;
    id v21 = v39;
    id v44 = v39;
    uint64_t v46 = v36;
    id v35 = (id)[v33 performWithResponseHandler:v40];
  }
  else
  {
    id v21 = v39;
    uint64_t v22 = [v39 referralObject];
    uint64_t v23 = [v39 addToDeviceLibraryOnly];
    uint64_t v24 = [v39 addToCloudLibrary];
    uint64_t v25 = v23;
    long long v26 = v38;
    [(MPMediaLibraryDataProviderML3 *)self _importStoreItemElements:v6 withReferralObject:v22 addTracksToDeviceLibraryOnly:v25 andAddTracksToCloudLibrary:v24 usingCloudAdamID:0 withCompletion:v38];
  }
}

void __78__MPMediaLibraryDataProviderML3_performStoreItemLibraryImport_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v31 = v6;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "Error fetching store content for item add. %{public}@", buf, 0xCu);
    }

    uint64_t v8 = *(void *)(a1 + 64);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
    }
  }
  else
  {
    [v5 allItems];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v14 = *(void **)(a1 + 32);
          uint64_t v15 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v13, "storeAdamID"));
          id v16 = [v14 objectForKey:v15];
          lldiv_t v17 = [v16 additionalTrackMetadata];

          uint64_t v18 = [MPStoreItemLibraryImportLookupElement alloc];
          uint64_t v19 = [v13 metadataDictionary];
          uint64_t v20 = [(MPStoreItemLibraryImportLookupElement *)v18 initWithLookupDictionary:v19 additionalTrackMetadata:v17];

          [*(id *)(a1 + 40) addObject:v20];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }
    uint64_t v22 = *(void *)(a1 + 40);
    id v21 = *(void **)(a1 + 48);
    uint64_t v23 = [*(id *)(a1 + 56) referralObject];
    objc_msgSend(v21, "_importStoreItemElements:withReferralObject:addTracksToDeviceLibraryOnly:andAddTracksToCloudLibrary:usingCloudAdamID:withCompletion:", v22, v23, objc_msgSend(*(id *)(a1 + 56), "addToDeviceLibraryOnly"), objc_msgSend(*(id *)(a1 + 56), "addToCloudLibrary"), *(void *)(a1 + 72), *(void *)(a1 + 64));

    id v6 = 0;
  }
}

- (id)_storePlatformRequestContext
{
  id v3 = objc_alloc(MEMORY[0x1E4FB8758]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __61__MPMediaLibraryDataProviderML3__storePlatformRequestContext__block_invoke;
  v6[3] = &unk_1E57F7888;
  void v6[4] = self;
  id v4 = (void *)[v3 initWithBlock:v6];

  return v4;
}

void __61__MPMediaLibraryDataProviderML3__storePlatformRequestContext__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 userIdentity];
  [v3 setIdentity:v4];

  id v5 = [MEMORY[0x1E4FB85B0] defaultInfo];
  id v14 = (id)[v5 mutableCopy];

  id v6 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  int v7 = [v6 isWatch];
  uint64_t v8 = @"Music";
  if (v7) {
    uint64_t v8 = @"NanoMusic";
  }
  uint64_t v9 = v8;

  uint64_t v10 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  int v11 = [v10 isWatch];
  uint64_t v12 = @"3.1";
  if (v11) {
    uint64_t v12 = @"2";
  }
  uint64_t v13 = v12;

  [v14 setClientIdentifier:v9];
  [v14 setClientVersion:v13];

  [v3 setClientInfo:v14];
}

- (void)sdk_addItemWithOpaqueID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(MPMediaLibraryDataProviderML3 *)self userIdentity];
  uint64_t v9 = +[MPCloudController controllerWithUserIdentity:v8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__MPMediaLibraryDataProviderML3_sdk_addItemWithOpaqueID_withCompletion___block_invoke;
  v11[3] = &unk_1E57F1750;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  objc_msgSend(v9, "sdk_addStoreItemWithOpaqueID:completionHandler:", v7, v11);
}

void __72__MPMediaLibraryDataProviderML3_sdk_addItemWithOpaqueID_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    if (v6)
    {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
    }
    else
    {
      id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v29 = v5;
      uint64_t v8 = [v5 allValues];
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v31 = [*(id *)(a1 + 32) mediaLibrary];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id obj = v8;
      uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v38 != v12) {
              objc_enumerationMutation(obj);
            }
            id v14 = +[MPMediaPropertyPredicate predicateWithValue:*(void *)(*((void *)&v37 + 1) + 8 * i) forProperty:@"storeSagaID"];
            uint64_t v15 = +[MPMediaQuery songsQuery];
            [v15 setMediaLibrary:v31];
            [v15 addFilterPredicate:v14];
            id v16 = [v15 items];
            [v9 addObjectsFromArray:v16];
            [v32 addObjectsFromArray:v16];
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v11);
      }

      lldiv_t v17 = v9;
      if (![v9 count] && objc_msgSend(obj, "count"))
      {
        uint64_t v18 = [obj firstObject];
        uint64_t v19 = +[MPMediaPropertyPredicate predicateWithValue:v18 forProperty:@"storeCloudID"];
        uint64_t v20 = +[MPMediaQuery playlistsQuery];
        [v20 setMediaLibrary:v31];
        long long v28 = (void *)v19;
        [v20 addFilterPredicate:v19];
        id v21 = [v20 collections];
        [v17 addObjectsFromArray:v21];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v22 = v21;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v34;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v34 != v25) {
                objc_enumerationMutation(v22);
              }
              long long v27 = [*(id *)(*((void *)&v33 + 1) + 8 * j) items];
              [v32 addObjectsFromArray:v27];
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v24);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      MPFetchArtworkForAddedMediaItems(v32);

      id v6 = 0;
      id v5 = v29;
    }
  }
}

- (void)addTracksToMyLibrary:(id)a3
{
  id v4 = [a3 valueForKey:@"persistentID"];
  library = self->_library;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __54__MPMediaLibraryDataProviderML3_addTracksToMyLibrary___block_invoke;
  v7[3] = &unk_1E57F1728;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(ML3MusicLibrary *)library performDatabaseTransactionWithBlock:v7];
}

uint64_t __54__MPMediaLibraryDataProviderML3_addTracksToMyLibrary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F79B50];
  uint64_t v9 = *MEMORY[0x1E4F796F8];
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a2;
  id v6 = [v4 arrayWithObjects:&v9 count:1];
  uint64_t v7 = objc_msgSend(v3, "setValues:forProperties:forEntityPersistentIDs:inLibrary:usingConnection:", &unk_1EE6ED730, v6, *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 88), v5, v9, v10);

  return v7;
}

- (id)multiverseIdentifierForCollectionWithPersistentID:(int64_t)a3 groupingType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 5)
  {
    id v5 = 0;
  }
  else
  {
    id v4 = (void *)[objc_alloc(**((Class **)&unk_1E57FA588 + a4 - 1)) initWithPersistentID:a3 inLibrary:self->_library];
    id v5 = [v4 multiverseIdentifier];
  }

  return v5;
}

- (id)multiverseIdentifierForTrackWithPersistentID:(int64_t)a3
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F79B50]) initWithPersistentID:a3 inLibrary:self->_library];
  id v4 = [v3 multiverseIdentifier];

  return v4;
}

- (BOOL)deleteDatabaseProperty:(id)a3
{
  return [(ML3MusicLibrary *)self->_library deleteDatabaseProperty:a3];
}

- (BOOL)setValue:(id)a3 forDatabaseProperty:(id)a4
{
  return [(ML3MusicLibrary *)self->_library setValue:a3 forDatabaseProperty:a4];
}

- (NSArray)localizedSectionIndexTitles
{
  return (NSArray *)[(ML3MusicLibrary *)self->_library localizedSectionIndexTitles];
}

- (id)localizedSectionHeaderForSectionIndex:(unint64_t)a3
{
  return (id)[(ML3MusicLibrary *)self->_library localizedSectionHeaderForSectionIndex:a3];
}

- (BOOL)collectionExistsContainedWithinSyncIDs:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  id v8 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  if (a4 == 1)
  {
    uint64_t v10 = (id *)MEMORY[0x1E4F79088];
    goto LABEL_5;
  }
  id v9 = 0;
  if (a4 == 6)
  {
    uint64_t v10 = (id *)MEMORY[0x1E4F79328];
LABEL_5:
    id v9 = *v10;
  }
  if (v8 && [v8 count])
  {
    id v11 = MPML3CollectionClassFromGroupingType(a4);
    uint64_t v12 = [MEMORY[0x1E4F79AD0] predicateWithProperty:v9 values:v8];
    uint64_t v13 = [v11 queryWithLibrary:self->_library predicate:v12];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __97__MPMediaLibraryDataProviderML3_collectionExistsContainedWithinSyncIDs_groupingType_existentPID___block_invoke;
    v17[3] = &unk_1E57F1700;
    void v17[4] = &v22;
    v17[5] = &v18;
    [v13 enumeratePersistentIDsUsingBlock:v17];
  }
  int v14 = *((unsigned __int8 *)v23 + 24);
  if (a5 && *((unsigned char *)v23 + 24)) {
    *a5 = v19[3];
  }
  BOOL v15 = v14 != 0;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v15;
}

uint64_t __97__MPMediaLibraryDataProviderML3_collectionExistsContainedWithinSyncIDs_groupingType_existentPID___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

- (BOOL)collectionExistsWithCloudUniversalLibraryID:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  id v8 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v16 = 0;
  lldiv_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  if ((unint64_t)a4 > 6 || ((0x4Bu >> a4) & 1) == 0)
  {
    id v9 = 0;
LABEL_4:
    BOOL v10 = 0;
    goto LABEL_5;
  }
  id v9 = **((id **)&unk_1E57F1EE0 + a4);
  if (!v9) {
    goto LABEL_4;
  }
  id v12 = MPML3CollectionClassFromGroupingType(a4);
  uint64_t v13 = [MEMORY[0x1E4F79AA0] predicateWithProperty:v9 value:v8 comparison:1];
  int v14 = [v12 queryWithLibrary:self->_library predicate:v13];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __102__MPMediaLibraryDataProviderML3_collectionExistsWithCloudUniversalLibraryID_groupingType_existentPID___block_invoke;
  v15[3] = &unk_1E57F1700;
  void v15[4] = &v20;
  void v15[5] = &v16;
  [v14 enumeratePersistentIDsUsingBlock:v15];

  BOOL v10 = *((unsigned char *)v21 + 24) != 0;
  if (a5 && *((unsigned char *)v21 + 24)) {
    *a5 = v17[3];
  }
LABEL_5:

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

uint64_t __102__MPMediaLibraryDataProviderML3_collectionExistsWithCloudUniversalLibraryID_groupingType_existentPID___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

- (BOOL)collectionExistsWithCloudLibraryID:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  id v8 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  if (a4 == 1)
  {
    id v9 = (id *)MEMORY[0x1E4F79040];
  }
  else
  {
    if (a4 != 3)
    {
      id v10 = 0;
      goto LABEL_10;
    }
    id v9 = (id *)MEMORY[0x1E4F78FF0];
  }
  id v10 = *v9;
  if (!v10)
  {
LABEL_10:
    BOOL v14 = 0;
    goto LABEL_11;
  }
  id v11 = MPML3CollectionClassFromGroupingType(a4);
  id v12 = [MEMORY[0x1E4F79AA0] predicateWithProperty:v10 value:v8 comparison:1];
  uint64_t v13 = [v11 queryWithLibrary:self->_library predicate:v12];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__MPMediaLibraryDataProviderML3_collectionExistsWithCloudLibraryID_groupingType_existentPID___block_invoke;
  v16[3] = &unk_1E57F1700;
  void v16[4] = &v21;
  v16[5] = &v17;
  [v13 enumeratePersistentIDsUsingBlock:v16];

  BOOL v14 = *((unsigned char *)v22 + 24) != 0;
  if (a5 && *((unsigned char *)v22 + 24)) {
    *a5 = v18[3];
  }
LABEL_11:

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v14;
}

uint64_t __93__MPMediaLibraryDataProviderML3_collectionExistsWithCloudLibraryID_groupingType_existentPID___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

- (BOOL)collectionExistsWithSagaID:(int64_t)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  if (a4)
  {
    if (a4 != 6)
    {
      id v10 = 0;
      goto LABEL_10;
    }
    id v9 = (id *)MEMORY[0x1E4F79320];
  }
  else
  {
    id v9 = (id *)MEMORY[0x1E4F799C0];
  }
  id v10 = *v9;
  if (!v10)
  {
LABEL_10:
    BOOL v14 = 0;
    goto LABEL_11;
  }
  id v11 = MPML3CollectionClassFromGroupingType(a4);
  id v12 = [MEMORY[0x1E4F79AA0] predicateWithProperty:v10 equalToInt64:a3];
  uint64_t v13 = [v11 queryWithLibrary:self->_library predicate:v12];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__MPMediaLibraryDataProviderML3_collectionExistsWithSagaID_groupingType_existentPID___block_invoke;
  v16[3] = &unk_1E57F1700;
  void v16[4] = &v21;
  v16[5] = &v17;
  [v13 enumeratePersistentIDsUsingBlock:v16];

  BOOL v14 = *((unsigned char *)v22 + 24) != 0;
  if (a5 && *((unsigned char *)v22 + 24)) {
    *a5 = v18[3];
  }
LABEL_11:

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v14;
}

uint64_t __85__MPMediaLibraryDataProviderML3_collectionExistsWithSagaID_groupingType_existentPID___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

- (BOOL)collectionExistsWithStoreID:(int64_t)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  if ((unint64_t)a4 > 5)
  {
    id v9 = 0;
    goto LABEL_7;
  }
  id v9 = **((id **)&unk_1E57F1EB0 + a4);
  if (!v9)
  {
LABEL_7:
    BOOL v13 = 0;
    goto LABEL_8;
  }
  id v10 = MPML3CollectionClassFromGroupingType(a4);
  id v11 = [MEMORY[0x1E4F79AA0] predicateWithProperty:v9 equalToInt64:a3];
  id v12 = [v10 queryWithLibrary:self->_library predicate:v11];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__MPMediaLibraryDataProviderML3_collectionExistsWithStoreID_groupingType_existentPID___block_invoke;
  v15[3] = &unk_1E57F1700;
  void v15[4] = &v20;
  void v15[5] = &v16;
  [v12 enumeratePersistentIDsUsingBlock:v15];

  BOOL v13 = *((unsigned char *)v21 + 24) != 0;
  if (a5 && *((unsigned char *)v21 + 24)) {
    *a5 = v17[3];
  }
LABEL_8:

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v13;
}

uint64_t __86__MPMediaLibraryDataProviderML3_collectionExistsWithStoreID_groupingType_existentPID___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

- (BOOL)collectionExistsWithName:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  id v8 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  if (v8)
  {
    id v9 = MPML3CollectionClassFromGroupingType(a4);
    if ((unint64_t)a4 > 7) {
      id v10 = 0;
    }
    else {
      id v10 = **((id **)&unk_1E57F1E70 + a4);
    }
    id v12 = [MEMORY[0x1E4F79AA0] predicateWithProperty:v10 value:v8 comparison:1];
    BOOL v13 = [v9 queryWithLibrary:self->_library predicate:v12];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __83__MPMediaLibraryDataProviderML3_collectionExistsWithName_groupingType_existentPID___block_invoke;
    v15[3] = &unk_1E57F1700;
    void v15[4] = &v20;
    void v15[5] = &v16;
    [v13 enumeratePersistentIDsUsingBlock:v15];

    BOOL v11 = *((unsigned char *)v21 + 24) != 0;
    if (a5 && *((unsigned char *)v21 + 24))
    {
      *a5 = v17[3];
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v11;
}

uint64_t __83__MPMediaLibraryDataProviderML3_collectionExistsWithName_groupingType_existentPID___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

- (BOOL)collectionExistsContainedWithinPersistentIDs:(const unint64_t *)a3 count:(unint64_t)a4 groupingType:(int64_t)a5 existentPID:(unint64_t *)a6
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  if (a3)
  {
    id v10 = MPML3CollectionClassFromGroupingType(a5);
    BOOL v11 = [MEMORY[0x1E4F79B18] predicateWithPersistentIDs:a3 count:a4 shouldContain:1];
    id v12 = [v10 queryWithLibrary:self->_library predicate:v11];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __109__MPMediaLibraryDataProviderML3_collectionExistsContainedWithinPersistentIDs_count_groupingType_existentPID___block_invoke;
    v15[3] = &unk_1E57F1700;
    void v15[4] = &v20;
    void v15[5] = &v16;
    [v12 enumeratePersistentIDsUsingBlock:v15];

    BOOL v13 = *((unsigned char *)v21 + 24) != 0;
    if (a6 && *((unsigned char *)v21 + 24))
    {
      *a6 = v17[3];
      BOOL v13 = 1;
    }
  }
  else
  {
    BOOL v13 = 0;
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v13;
}

uint64_t __109__MPMediaLibraryDataProviderML3_collectionExistsContainedWithinPersistentIDs_count_groupingType_existentPID___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

- (BOOL)collectionExistsWithPersistentID:(unint64_t)a3 groupingType:(int64_t)a4
{
  id v6 = MPML3CollectionClassFromGroupingType(a4);
  if (v6)
  {
    uint64_t v7 = (void *)[v6 newWithPersistentID:a3 inLibrary:self->_library];
    char v8 = [v7 existsInLibrary];

    LOBYTE(v6) = v8;
  }
  return (char)v6;
}

- (BOOL)playlistExistsWithPersistentID:(unint64_t)a3
{
  id v3 = (void *)[MEMORY[0x1E4F79AB8] newWithPersistentID:a3 inLibrary:self->_library];
  char v4 = [v3 existsInLibrary];

  return v4;
}

- (int64_t)itemPersistentIDForStoreID:(int64_t)a3
{
  char v4 = [MEMORY[0x1E4F79AA0] predicateWithProperty:*MEMORY[0x1E4F79978] equalToInt64:a3];
  id v5 = [MEMORY[0x1E4F79B50] anyInLibrary:self->_library predicate:v4];
  int64_t v6 = [v5 persistentID];

  return v6;
}

- (BOOL)hasUbiquitousBookmarkableItems
{
  id v3 = [MEMORY[0x1E4F79AA0] predicateWithProperty:*MEMORY[0x1E4F797E8] equalToInteger:1];
  char v4 = (void *)MEMORY[0x1E4F79A60];
  id v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v3, 0);
  int64_t v6 = [v4 predicateMatchingPredicates:v5];

  uint64_t v7 = [MEMORY[0x1E4F79B50] anyInLibrary:self->_library predicate:v6];
  LOBYTE(self) = v7 != 0;

  return (char)self;
}

- (BOOL)hasGeniusMixes
{
  id v3 = [MEMORY[0x1E4F79AA0] predicateWithProperty:*MEMORY[0x1E4F79260] equalToInteger:1];
  char v4 = [MEMORY[0x1E4F79AA0] predicateWithProperty:*MEMORY[0x1E4F79258] equalToInteger:1];
  id v5 = (void *)MEMORY[0x1E4F79A60];
  int64_t v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v3, v4, 0);
  uint64_t v7 = [v5 predicateMatchingPredicates:v6];

  char v8 = [MEMORY[0x1E4F79AB8] anyInLibrary:self->_library predicate:v7];
  LOBYTE(self) = v8 != 0;

  return (char)self;
}

- (BOOL)hasMediaOfType:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__MPMediaLibraryDataProviderML3_hasMediaOfType___block_invoke;
  v5[3] = &unk_1E57FA120;
  v5[5] = &v6;
  v5[6] = a3;
  void v5[4] = self;
  [(MPMediaLibraryDataProviderML3 *)self performBackgroundTaskWithBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__MPMediaLibraryDataProviderML3_hasMediaOfType___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__MPMediaLibraryDataProviderML3_hasMediaOfType___block_invoke_2;
  v2[3] = &unk_1E57F16D8;
  uint64_t v4 = *(void *)(a1 + 48);
  long long v3 = *(_OWORD *)(a1 + 32);
  return [*(id *)(v3 + 88) databaseConnectionAllowingWrites:0 withBlock:v2];
}

void __48__MPMediaLibraryDataProviderML3_hasMediaOfType___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  long long v3 = [*(id *)(a1 + 32) mediaLibrary];
  uint64_t v4 = [MPMediaQuery alloc];
  id v5 = v4;
  if (v2 == -1)
  {
    id v10 = [(MPMediaQuery *)v4 initWithFilterPredicates:0 library:v3];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    uint64_t v8 = +[MPMediaPropertyPredicate predicateWithValue:v7 forProperty:@"mediaType"];
    char v9 = [v6 setWithObject:v8];
    id v10 = [(MPMediaQuery *)v5 initWithFilterPredicates:v9 library:v3];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [(MPMediaQuery *)v10 _hasItems];
}

- (BOOL)writable
{
  return 1;
}

- (int64_t)playlistGeneration
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  library = self->_library;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__MPMediaLibraryDataProviderML3_playlistGeneration__block_invoke;
  v5[3] = &unk_1E57F16B0;
  void v5[4] = &v6;
  [(ML3MusicLibrary *)library databaseConnectionAllowingWrites:0 withBlock:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __51__MPMediaLibraryDataProviderML3_playlistGeneration__block_invoke(uint64_t a1, void *a2)
{
  [a2 executeQuery:@"SELECT revision FROM entity_revision WHERE class = 1 ORDER BY revision DESC LIMIT 1;"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 int64ValueForFirstRowAndColumn];
}

- (unint64_t)syncGenerationID
{
  return [(ML3MusicLibrary *)self->_library syncGenerationID];
}

- (id)lastModifiedDate
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__22113;
  uint64_t v22 = __Block_byref_object_dispose__22114;
  id v23 = 0;
  library = self->_library;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __49__MPMediaLibraryDataProviderML3_lastModifiedDate__block_invoke;
  v17[3] = &unk_1E57F16B0;
  void v17[4] = &v18;
  [(ML3MusicLibrary *)library databaseConnectionAllowingWrites:0 withBlock:v17];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)v19[5];
  id v5 = 0;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(v3, "attributesOfItemAtPath:error:", *(void *)(*((void *)&v13 + 1) + 8 * i), 0, (void)v13);
        id v10 = [v9 fileModificationDate];

        if (!v5 || [v10 compare:v5] == 1)
        {
          id v11 = v10;

          id v5 = v11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v24 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(&v18, 8);

  return v5;
}

void __49__MPMediaLibraryDataProviderML3_lastModifiedDate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 _databaseFilePaths];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (NSString)accountDSID
{
  uint64_t v3 = [(ML3MusicLibrary *)self->_library sagaAccountID];
  if (!v3)
  {
    uint64_t v3 = [(ML3MusicLibrary *)self->_library jaliscoAccountID];
  }
  uint64_t v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (NSString)name
{
  uint64_t v2 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  uint64_t v3 = [v2 name];

  return (NSString *)v3;
}

- (void)setLibrary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = (ML3MusicLibrary *)a3;
  uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(ML3MusicLibrary *)v5 debugDescription];
    *(_DWORD *)long long buf = 134218498;
    long long v26 = self;
    __int16 v27 = 2048;
    long long v28 = v5;
    __int16 v29 = 2114;
    uint64_t v30 = v7;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "DataProvider %p setting MusicLibrary to %p (description=%{public}@)", buf, 0x20u);
  }
  if (!v5)
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    uint64_t v19 = (void *)MEMORY[0x1E4F77950];
    uint64_t v18 = *MEMORY[0x1E4F778C8];
    v23[0] = self;
    v22[0] = @"dataProvider";
    v22[1] = @"dataProvider description";
    uint64_t v9 = [(MPMediaLibraryDataProviderML3 *)self description];
    v23[1] = v9;
    v22[2] = @"currentMusicLibrary description";
    library = self->_library;
    if (library)
    {
      id v11 = [(ML3MusicLibrary *)self->_library debugDescription];
      id v12 = self->_library;
    }
    else
    {
      id v12 = 0;
      id v11 = @"nil";
    }
    v22[3] = @"currentMusicLibrary";
    if (!v12) {
      id v12 = (ML3MusicLibrary *)@"nil";
    }
    v23[2] = v11;
    v23[3] = v12;
    long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
    char v24 = v13;
    long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __44__MPMediaLibraryDataProviderML3_setLibrary___block_invoke;
    void v20[3] = &unk_1E57F9EA8;
    dispatch_semaphore_t v21 = v8;
    long long v15 = v8;
    [v19 snapshotWithDomain:v18 type:@"Bug" subType:@"Invalid MusicLibrary" context:@"ML3MusicLibrary is null" triggerThresholdValues:0 events:v14 completion:v20];

    if (library) {
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  if (self->_library != v5)
  {
    long long v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 removeObserver:self name:0 object:self->_library];
    objc_storeStrong((id *)&self->_library, a3);
    uniqueIdentifier = self->_uniqueIdentifier;
    self->_uniqueIdentifier = 0;

    [(MPMediaLibraryDataProviderML3 *)self _updateArtworkDataSourceMediaLibraryUniqueIdentifier];
    if (v5)
    {
      [v16 addObserver:self selector:sel__libraryContentsDidChange_ name:*MEMORY[0x1E4F79378] object:v5];
      [v16 addObserver:self selector:sel__dynamicPropertiesDidChange_ name:*MEMORY[0x1E4F79398] object:v5];
      [v16 addObserver:self selector:sel__invisiblePropertiesDidChange_ name:*MEMORY[0x1E4F79390] object:v5];
    }
  }
}

intptr_t __44__MPMediaLibraryDataProviderML3_setLibrary___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(MPMediaLibraryDataProviderML3 *)self library];
  id v5 = [(MPMediaLibraryDataProviderML3 *)self library];
  uint64_t v6 = [v5 debugDescription];
  uint64_t v7 = [v3 stringWithFormat:@"<DataProvider: %p> MusicLibrary=%p, description=%@", self, v4, v6];

  return (NSString *)v7;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__postEvents object:0];
  v4.receiver = self;
  v4.super_class = (Class)MPMediaLibraryDataProviderML3;
  [(MPMediaLibraryDataProviderML3 *)&v4 dealloc];
}

+ (id)_unadjustedValueForMPProperty:(id)a3 withDefaultValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_unadjustedValueForMPProperty_withDefaultValue__onceToken != -1) {
    dispatch_once(&_unadjustedValueForMPProperty_withDefaultValue__onceToken, &__block_literal_global_314);
  }
  dispatch_semaphore_t v8 = (const char *)NSMapGet((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, v6);
  if (v8)
  {
    objc_msgSend(a1, v8, v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v7;
  }
  id v10 = v9;

  return v10;
}

void __80__MPMediaLibraryDataProviderML3__unadjustedValueForMPProperty_withDefaultValue___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:258 capacity:13];
  uint64_t v1 = (void *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap;
  _unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap = v0;

  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"bookmarkTime", sel__unadjustedValueForItemTimeWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"dateAccessed", sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"dateAdded", sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"lastPlayedDate", sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"lastSkippedDate", sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"playbackDuration", sel__unadjustedValueForItemTimeWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"rating", sel__unadjustedValueForItemPropertyRatingWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"releaseDate", sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"startTime", sel__unadjustedValueForItemTimeWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"stopTime", sel__unadjustedValueForItemTimeWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"storeDatePurchased", sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"volumeAdjustment", sel__unadjustedValueForItemPropertyVolumeAdjustmentWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"volumeNormalization", sel__unadjustedValueForItemPropertyVolumeNormalizationWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"dateCreated", sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"dateModified", sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"datePlayed", sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"datePlayedLocal", sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"dateDownloaded", sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"albumDatePlayedLocal", sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"likedStateChangedDate", sel__unadjustedValueForItemDateWithDefaultValue_);
  NSMapInsert((NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap, @"likedStateChangedDate", sel__unadjustedValueForItemDateWithDefaultValue_);
  uint64_t v2 = (NSMapTable *)_unadjustedValueForMPProperty_withDefaultValue____unadjustmentMap;

  NSMapInsert(v2, @"albumArtistDateFavorited", sel__unadjustedValueForItemDateWithDefaultValue_);
}

+ (id)_unadjustedValueForItemDateWithDefaultValue:(id)a3
{
  uint64_t v3 = NSNumber;
  [a3 timeIntervalSinceReferenceDate];

  return (id)objc_msgSend(v3, "numberWithDouble:");
}

+ (id)_unadjustedValueForItemTimeWithDefaultValue:(id)a3
{
  uint64_t v3 = NSNumber;
  [a3 doubleValue];
  double v5 = v4 * 1000.0;

  return (id)[v3 numberWithDouble:v5];
}

+ (id)_unadjustedValueForItemPropertyRatingWithDefaultValue:(id)a3
{
  uint64_t v3 = NSNumber;
  [a3 floatValue];
  double v5 = v4 * 20.0;

  return (id)[v3 numberWithDouble:v5];
}

+ (id)_unadjustedValueForItemPropertyVolumeAdjustmentWithDefaultValue:(id)a3
{
  uint64_t v3 = NSNumber;
  [a3 floatValue];
  if ((unint64_t)(float)((float)((float)(v4 * 2000.0) * 0.5) + 1.8447e19) < 0xFFFFFFFFFFFFFC18) {
    uint64_t v5 = -1000;
  }
  else {
    uint64_t v5 = 1000;
  }

  return (id)[v3 numberWithUnsignedInteger:v5];
}

+ (id)_unadjustedValueForItemPropertyVolumeNormalizationWithDefaultValue:(id)a3
{
  uint64_t v3 = NSNumber;
  [a3 floatValue];
  float v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = [NSString stringWithUTF8String:"NSUInteger MPITScaledVolumeNormalization(float)"];
  [v4 handleFailureInFunction:v5 file:@"MPMediaLibraryDataProviderML3.m" lineNumber:3455 description:@"MPITScaledVolumeNormalization is Unimplemented"];

  return (id)[v3 numberWithUnsignedInteger:0];
}

+ (NSArray)onDiskProviders
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F79AF8], "allLibraries", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_semaphore_t v8 = [[MPMediaLibraryDataProviderML3 alloc] initWithLibrary:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  id v9 = (void *)[v2 copy];

  return (NSArray *)v9;
}

@end