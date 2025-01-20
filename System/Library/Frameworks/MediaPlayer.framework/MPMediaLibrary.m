@interface MPMediaLibrary
+ (BOOL)isLibraryServerDisabled;
+ (BOOL)supportsSecureCoding;
+ (MPMediaLibrary)defaultMediaLibrary;
+ (MPMediaLibrary)mediaLibraryWithUniqueIdentifier:(id)a3;
+ (MPMediaLibrary)mediaLibraryWithUniqueIdentifier:(id)a3 allowsLoadingFromDisk:(BOOL)a4;
+ (MPMediaLibraryAuthorizationStatus)authorizationStatus;
+ (id)_deviceMediaLibraryWithUserIdentity:(id)a3 createIfRequired:(BOOL)a4;
+ (id)_libraryDataProviders;
+ (id)_libraryForDataProvider:(id)a3;
+ (id)_mediaLibraries;
+ (id)_mediaLibraryWithUniqueIdentifier:(id)a3 userDSID:(id)a4;
+ (id)_sharedCloudServiceStatusMonitor;
+ (id)deviceMediaLibrary;
+ (id)deviceMediaLibraryWithUserIdentity:(id)a3;
+ (id)libraryDataProviders;
+ (id)mediaLibraries;
+ (id)sharedMediaLibraries;
+ (int64_t)_mediaLibraryAuthorizationStatusFromCloudServiceAuthorizationStatus:(int64_t)a3;
+ (void)_endDiscoveringMediaLibrariesIfAllowed;
+ (void)_postNotificationName:(id)a3 library:(id)a4;
+ (void)_postNotificationName:(id)a3 library:(id)a4 userInfo:(id)a5;
+ (void)addLibraryDataProvider:(id)a3;
+ (void)beginDiscoveringMediaLibraries;
+ (void)endDiscoveringMediaLibraries;
+ (void)initialize;
+ (void)libraryPathDidChangeForDataProvider:(id)a3;
+ (void)logDatabaseAccess;
+ (void)postEntitiesAddedOrRemovedNotificationForLibraryDataProvider:(id)a3;
+ (void)reloadDisplayValuesForLibraryDataProvider:(id)a3;
+ (void)reloadDynamicPropertiesForLibraryDataProvider:(id)a3;
+ (void)reloadInvisiblePropertiesForLibraryDataProvider:(id)a3;
+ (void)reloadLibraryDataProvider:(id)a3;
+ (void)removeLibraryDataProvider:(id)a3 removalReason:(int64_t)a4;
+ (void)requestAuthorization:(void *)completionHandler;
+ (void)setDefaultMediaLibrary:(id)a3;
+ (void)setGlobalPrivacyClientWithAuditToken:(id *)a3;
+ (void)syncGenerationDidChangeForLibraryDataProvider:(id)a3;
+ (void)uniqueIdentifierDidChangeForLibraryDataProvider:(id)a3;
- (BOOL)_checkHasContent:(BOOL *)a3 determined:(BOOL *)a4 mediaType:(unint64_t)a5 queryHasEntitiesBlock:(id)a6;
- (BOOL)_checkHasContent:(BOOL *)a3 determined:(BOOL *)a4 queryHasEntitiesBlock:(id)a5;
- (BOOL)_handlesSameAccountAs:(id)a3;
- (BOOL)_hasCollectionsForQueryCriteria:(id)a3;
- (BOOL)_hasItemsForQueryCriteria:(id)a3;
- (BOOL)collectionExistsContainedWithinPersistentIDs:(const unint64_t *)a3 count:(unint64_t)a4 groupingType:(int64_t)a5 existentPID:(unint64_t *)a6;
- (BOOL)collectionExistsContainedWithinSyncIDs:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5;
- (BOOL)collectionExistsWithCloudLibraryID:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5;
- (BOOL)collectionExistsWithCloudUniversalLibraryID:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5;
- (BOOL)collectionExistsWithName:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5;
- (BOOL)collectionExistsWithPersistentID:(unint64_t)a3 groupingType:(int64_t)a4;
- (BOOL)collectionExistsWithSagaID:(int64_t)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5;
- (BOOL)collectionExistsWithStoreID:(int64_t)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5;
- (BOOL)deleteDatabaseProperty:(id)a3;
- (BOOL)deleteItems:(id)a3;
- (BOOL)hasAddedToLibraryAppleMusicContent;
- (BOOL)hasAudibleAudioBooks;
- (BOOL)hasAudioITunesUContent;
- (BOOL)hasAudiobooks;
- (BOOL)hasCompilations;
- (BOOL)hasComposers;
- (BOOL)hasGeniusMixes;
- (BOOL)hasHomeVideos;
- (BOOL)hasITunesUContent;
- (BOOL)hasMedia;
- (BOOL)hasMediaOfType:(unint64_t)a3;
- (BOOL)hasMovieRentals;
- (BOOL)hasMovies;
- (BOOL)hasMusicVideos;
- (BOOL)hasPlaylists;
- (BOOL)hasPodcasts;
- (BOOL)hasSongs;
- (BOOL)hasTVShows;
- (BOOL)hasUbiquitousBookmarkableItems;
- (BOOL)hasUserPlaylists;
- (BOOL)hasUserPlaylistsContainingAppleMusicContent;
- (BOOL)hasVideoITunesUContent;
- (BOOL)hasVideoPodcasts;
- (BOOL)hasVideos;
- (BOOL)importOriginalArtworkFromImageData:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unint64_t)a7;
- (BOOL)isCurrentThreadInTransaction;
- (BOOL)isDeviceLibrary;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGeniusEnabled;
- (BOOL)isHomeSharingLibrary;
- (BOOL)isValidAssetURL:(id)a3;
- (BOOL)itemExistsInDatabaseWithPersistentID:(unint64_t)a3;
- (BOOL)itemExistsWithPersistentID:(unint64_t)a3;
- (BOOL)performTransactionWithBlock:(id)a3;
- (BOOL)playlistExistsWithPersistentID:(unint64_t)a3;
- (BOOL)removeItems:(id)a3;
- (BOOL)removePlaylist:(id)a3;
- (BOOL)requiresAuthentication;
- (BOOL)setValue:(id)a3 forDatabaseProperty:(id)a4;
- (BOOL)writable;
- (ICUserIdentity)userIdentity;
- (ML3MusicLibrary)ml3Library;
- (MPMediaLibrary)init;
- (MPMediaLibrary)initWithClientIdentity:(id)a3 userIdentity:(id)a4;
- (MPMediaLibrary)initWithCoder:(id)a3;
- (MPMediaLibrary)initWithDatabasePath:(id)a3;
- (MSVSQLDatabase)msvDatabase;
- (NSDate)lastModifiedDate;
- (NSDate)sagaLastItemPlayDataUploadDate;
- (NSDate)sagaLastLibraryUpdateTime;
- (NSDate)sagaLastPlaylistPlayDataUploadDate;
- (NSDate)sagaLastSubscribedContainersUpdateTime;
- (NSNumber)sagaAccountID;
- (NSString)_syncValidity;
- (NSString)description;
- (NSString)storefrontIdentifier;
- (NSURL)protectedContentSupportStorageURL;
- (_MPActiveUserChangeMonitor)activeUserChangeMonitor;
- (float)connectionProgress;
- (id)URLForHomeSharingRequest:(id)a3;
- (id)_MLCoreStorage;
- (id)_addPlaylistWithName:(id)a3 activeGeniusPlaylist:(BOOL)a4 externalVendorIdentifier:(id)a5 properties:(id)a6 trackList:(id)a7 playlistEntryProperties:(id)a8;
- (id)_addPlaylistWithName:(id)a3 externalVendorIdentifier:(id)a4;
- (id)_collectionPersistentIdentifiersForQueryCriteria:(id)a3;
- (id)_collectionsForQueryCriteria:(id)a3;
- (id)_dataProviderDescription;
- (id)_getCachedValueForQueryCritiera:(id)a3 valueCriteriaCache:(id)a4 entitiesForCriteriaCache:(id)a5 didLoadBlocksByQueryCriteria:(id)a6 valueLoadedFromEntitiesArrayBlock:(id)a7 loadValueFromDataProviderBlock:(id)a8;
- (id)_initWithLibraryDataProvider:(id)a3;
- (id)_initWithUserIdentity:(id)a3;
- (id)_itemPersistentIdentifiersForQueryCriteria:(id)a3;
- (id)_itemsForQueryCriteria:(id)a3;
- (id)addPlaylistWithName:(id)a3;
- (id)addPlaylistWithName:(id)a3 activeGeniusPlaylist:(BOOL)a4;
- (id)addPlaylistWithName:(id)a3 properties:(id)a4 trackList:(id)a5 playlistEntryProperties:(id)a6;
- (id)additionalLibraryFilterPredicates;
- (id)artworkDataSource;
- (id)collectionWithPersistentID:(unint64_t)a3 groupingType:(int64_t)a4;
- (id)collectionWithPersistentID:(unint64_t)a3 groupingType:(int64_t)a4 verifyExistence:(BOOL)a5;
- (id)connectionAssertionWithIdentifier:(id)a3;
- (id)databasePath;
- (id)decodeItemWithCoder:(id)a3;
- (id)entityCache;
- (id)entityWithLibraryURL:(id)a3;
- (id)entityWithMultiverseIdentifier:(id)a3;
- (id)entityWithPersistentID:(int64_t)a3 entityType:(int64_t)a4;
- (id)entityWithSpotlightIdentifier:(id)a3;
- (id)errorResolverForItem:(id)a3;
- (id)favoriteSongsPlaylist;
- (id)itLibrary;
- (id)itemWithPersistentID:(unint64_t)a3;
- (id)itemWithPersistentID:(unint64_t)a3 verifyExistence:(BOOL)a4;
- (id)itemWithStoreID:(unint64_t)a3;
- (id)libraryDataProvider;
- (id)localizedSectionHeaderForSectionIndex:(unint64_t)a3;
- (id)localizedSectionIndexTitles;
- (id)multiverseIdentifierForCollectionWithPersistentID:(int64_t)a3 groupingType:(int64_t)a4;
- (id)multiverseIdentifierForTrackWithPersistentID:(int64_t)a3;
- (id)name;
- (id)newPlaylistWithPersistentID:(unint64_t)a3;
- (id)pathForAssetURL:(id)a3;
- (id)photosMemoriesPlaylist;
- (id)playbackHistoryPlaylist;
- (id)playlistWithPersistentID:(unint64_t)a3;
- (id)preferredAudioLanguages;
- (id)preferredSubtitleLanguages;
- (id)securityScopedFileURLForAssetURL:(id)a3;
- (id)syncValidity;
- (id)uniqueIdentifier;
- (id)valueForDatabaseProperty:(id)a3;
- (int64_t)cloudFilteringType;
- (int64_t)libraryChangeObservers;
- (int64_t)playlistGeneration;
- (int64_t)removalReason;
- (int64_t)sagaDatabaseUserVersion;
- (int64_t)sagaOnDiskDatabaseRevision;
- (int64_t)status;
- (os_unfair_lock_s)_MLCoreStorageLock;
- (os_unfair_lock_s)_MLCoreStorageLockPointer;
- (shared_ptr<mlcore::DeviceLibrary>)_MediaLibrary_coreLibrary;
- (unint64_t)_countOfCollectionsForQueryCriteria:(id)a3;
- (unint64_t)_countOfItemsForQueryCriteria:(id)a3;
- (unint64_t)currentEntityRevision;
- (unint64_t)filterAvailableContentGroups:(unint64_t)a3 withOptions:(unint64_t)a4;
- (unint64_t)hash;
- (unint64_t)syncGenerationID;
- (unint64_t)syncPlaylistId;
- (unint64_t)usageForSyncedMediaOfType:(unint64_t)a3;
- (unsigned)homeSharingDatabaseID;
- (void)_activeUserDidChangeNotification:(id)a3;
- (void)_clearCachedContentDataAndResultSets:(BOOL)a3;
- (void)_clearCachedEntitiesIncludingResultSets:(BOOL)a3;
- (void)_clearCountCriteriaCaches;
- (void)_clearPendingDisconnection;
- (void)_didReceiveMemoryWarning:(id)a3;
- (void)_disconnect;
- (void)_displayValuesDidChangeNotification:(id)a3;
- (void)_performBlockOnLibraryHandlingTheSameAccount:(id)a3;
- (void)_reloadLibraryForContentsChangeWithNotificationInfo:(id)a3;
- (void)_reloadLibraryForDynamicPropertyChangeWithNotificationInfo:(id)a3;
- (void)_reloadLibraryForInvisiblePropertyChangeWithNotificationInfo:(id)a3;
- (void)_reloadLibraryForPathChange;
- (void)_reloadLibraryForRestrictionsChange;
- (void)_removeConnectionAssertion:(id)a3;
- (void)_scheduleLibraryChangeNotificationPostingBlock:(id)a3;
- (void)_setLibraryFilterPredicates;
- (void)_setMLCoreStorage:(id)a3;
- (void)_setupNotifications;
- (void)_tearDownNotifications;
- (void)_updateDeviceLibrary:(shared_ptr<mlcore:(void *)a4 :(unint64_t)a5 DeviceLibrary>)a3 expectedEntityCountForEntityClass:count:;
- (void)activeUserChangeDidFinish;
- (void)addGlobalPlaylistWithID:(id)a3 andAddToCloudLibrary:(BOOL)a4 completion:(id)a5;
- (void)addItemWithProductID:(NSString *)productID completionHandler:(void *)completionHandler;
- (void)addLibraryFilterPredicate:(id)a3;
- (void)addNonLibraryOwnedPlaylistWithGlobalID:(id)a3 completion:(id)a4;
- (void)addNonLibraryOwnedPlaylistsWithGlobalIDs:(id)a3 completion:(id)a4;
- (void)addPlaylistStoreItemsWithMetadata:(id)a3 completion:(id)a4;
- (void)addStoreItem:(int64_t)a3 andAddTracksToCloudLibrary:(BOOL)a4 withCompletion:(id)a5;
- (void)addStoreItemIDs:(id)a3 andAddTracksToCloudLibrary:(BOOL)a4 withCompletion:(id)a5;
- (void)addStoreItemIDs:(id)a3 referralObject:(id)a4 andAddTracksToCloudLibrary:(BOOL)a5 withCompletion:(id)a6;
- (void)addToLocalDeviceLibraryGlobalPlaylistWithID:(id)a3 completion:(id)a4;
- (void)addTracksToMyLibrary:(id)a3;
- (void)beginGeneratingLibraryChangeNotifications;
- (void)clearLocationPropertiesOfItem:(id)a3;
- (void)clearSagaCloudAccountID;
- (void)clearSagaLastItemPlayDataUploadDate;
- (void)clearSagaLastPlaylistPlayDataUploadDate;
- (void)connectWithAuthenticationData:(id)a3 completionBlock:(id)a4;
- (void)connectWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)disconnect;
- (void)downloadAsset:(id)a3 completionHandler:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)endGeneratingLibraryChangeNotifications;
- (void)enumerateEntityChangesAfterSyncAnchor:(id)a3 maximumRevisionType:(int64_t)a4 inUsersLibrary:(BOOL)a5 usingBlock:(id)a6;
- (void)enumerateEntityChangesAfterSyncAnchor:(id)a3 maximumRevisionType:(int64_t)a4 usingBlock:(id)a5;
- (void)enumerateEntityChangesAfterSyncAnchor:(id)a3 usingBlock:(id)a4;
- (void)geniusItemsForSeedItem:(id)a3 completion:(id)a4;
- (void)getPlaylistWithUUID:(NSUUID *)uuid creationMetadata:(MPMediaPlaylistCreationMetadata *)creationMetadata completionHandler:(void *)completionHandler;
- (void)importArtworkTokenForEntityPersistentID:(unint64_t)a3 entityType:(int64_t)a4 artworkToken:(id)a5 artworkType:(int64_t)a6 sourceType:(int64_t)a7;
- (void)logDatabaseAccess;
- (void)performReadTransactionWithBlock:(id)a3;
- (void)performStoreAlbumArtistLibraryImport:(id)a3 withCompletion:(id)a4;
- (void)performStoreItemLibraryImport:(id)a3 withCompletion:(id)a4;
- (void)populateLocationPropertiesOfItem:(id)a3 withPath:(id)a4 assetProtectionType:(int64_t)a5;
- (void)populateLocationPropertiesOfItem:(id)a3 withPath:(id)a4 assetProtectionType:(int64_t)a5 completionBlock:(id)a6;
- (void)removeArtworkForEntityPersistentID:(unint64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6;
- (void)removeLibraryFilterPredicate:(id)a3;
- (void)setActiveUserChangeMonitor:(id)a3;
- (void)setClientIdentity:(id)a3;
- (void)setCloudFilteringType:(int64_t)a3;
- (void)setRemovalReason:(int64_t)a3;
- (void)setSagaAccountID:(id)a3;
- (void)setSagaDatabaseUserVersion:(int64_t)a3;
- (void)setSagaLastItemPlayDataUploadDate:(id)a3;
- (void)setSagaLastLibraryUpdateTime:(id)a3;
- (void)setSagaLastPlaylistPlayDataUploadDate:(id)a3;
- (void)setSagaLastSubscribedContainersUpdateTime:(id)a3;
- (void)setSagaOnDiskDatabaseRevision:(int64_t)a3;
- (void)setStorefrontIdentifier:(id)a3;
- (void)setSyncPlaylistId:(unint64_t)a3;
- (void)setValues:(id)a3 forProperties:(id)a4 forItemPersistentIDs:(id)a5;
@end

@implementation MPMediaLibrary

- (void)_setLibraryFilterPredicates
{
  if (+[MPMediaLibrary authorizationStatus] == MPMediaLibraryAuthorizationStatusAuthorized)
  {
    id v17 = [(MPMediaLibrary *)self additionalLibraryFilterPredicates];
    int64_t v3 = [(MPMediaLibrary *)self cloudFilteringType];
    v4 = [(MPMediaLibrary *)self libraryDataProvider];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      v6 = [(MPMediaLibrary *)self libraryDataProvider];
      [v6 setLibraryEntityFilterPredicatesWithCloudFilteringType:v3 additionalFilterPredicates:v17];
    }
    v7 = [(MPMediaLibrary *)self libraryDataProvider];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [(MPMediaLibrary *)self libraryDataProvider];
      [v9 setLibraryContainerFilterPredicatesWithCloudFilteringType:v3 additionalFilterPredicates:v17];
    }
    v10 = [(MPMediaLibrary *)self libraryDataProvider];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      v12 = [(MPMediaLibrary *)self libraryDataProvider];
      [v12 setLibraryPublicEntityFilterPredicatesWithCloudFilteringType:v3 additionalFilterPredicates:v17];
    }
    v13 = [(MPMediaLibrary *)self libraryDataProvider];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      v15 = [(MPMediaLibrary *)self libraryDataProvider];
      [v15 setLibraryPublicContainerFilterPredicatesWithCloudFilteringType:v3 additionalFilterPredicates:v17];
    }
  }
  else
  {
    v16 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_ERROR, "Not authorized, skipping filter predicate application", buf, 2u);
    }
  }
}

- (id)libraryDataProvider
{
  return self->_libraryDataProvider;
}

+ (MPMediaLibraryAuthorizationStatus)authorizationStatus
{
  int64_t v3 = [a1 _sharedCloudServiceStatusMonitor];
  uint64_t v4 = [v3 authorizationStatusForScopes:2];

  return [a1 _mediaLibraryAuthorizationStatusFromCloudServiceAuthorizationStatus:v4];
}

+ (id)_sharedCloudServiceStatusMonitor
{
  if (_sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitorOnceToken != -1) {
    dispatch_once(&_sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitorOnceToken, &__block_literal_global_181);
  }
  v2 = (void *)_sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitor;

  return v2;
}

+ (int64_t)_mediaLibraryAuthorizationStatusFromCloudServiceAuthorizationStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (int64_t)cloudFilteringType
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MPMediaLibrary_cloudFilteringType__block_invoke;
  block[3] = &unk_1E57FA300;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)__serialAccessQueue, block);
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)additionalLibraryFilterPredicates
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__15308;
  v10 = __Block_byref_object_dispose__15309;
  id v11 = 0;
  additionalLibraryFilterPredicatesAccessQueue = self->_additionalLibraryFilterPredicatesAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__MPMediaLibrary_additionalLibraryFilterPredicates__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(additionalLibraryFilterPredicatesAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__MPMediaLibrary_defaultMediaLibrary__block_invoke(uint64_t a1)
{
  if (__defaultMediaLibraryOverride) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), (id)__defaultMediaLibraryOverride);
  }
}

uint64_t __41__MPMediaLibrary__itemsForQueryCriteria___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 48) setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKey:a1[5]];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)deviceMediaLibraryWithUserIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  char v6 = [v5 supportsMultipleITunesAccounts];

  if (v6)
  {
    if (v4)
    {
      uint64_t v7 = +[MPMediaLibrary _deviceMediaLibraryWithUserIdentity:v4 createIfRequired:1];
      goto LABEL_7;
    }
    uint64_t v8 = (__objc2_class *)a1;
  }
  else
  {
    uint64_t v8 = MPMediaLibrary;
  }
  uint64_t v7 = [(__objc2_class *)v8 deviceMediaLibrary];
LABEL_7:
  v9 = (void *)v7;

  return v9;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = [(MPMediaLibrary *)self uniqueIdentifier];
  uint64_t v5 = [(MPMediaLibrary *)self userIdentity];
  char v6 = [(MPMediaLibrary *)self libraryDataProvider];
  uint64_t v7 = [v3 stringWithFormat:@"<MPMediaLibrary: %p> uniqueID=%@ [%@] dataProvider: %p", self, v4, v5, v6];

  return (NSString *)v7;
}

- (id)uniqueIdentifier
{
  return (id)[(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider uniqueIdentifier];
}

- (ICUserIdentity)userIdentity
{
  userIdentity = self->_userIdentity;
  if (userIdentity)
  {
    id v3 = userIdentity;
  }
  else
  {
    id v3 = [MEMORY[0x1E4FB87B8] activeAccount];
  }

  return v3;
}

+ (MPMediaLibrary)defaultMediaLibrary
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__15308;
  v12 = __Block_byref_object_dispose__15309;
  id v13 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__MPMediaLibrary_defaultMediaLibrary__block_invoke;
  block[3] = &unk_1E57FA300;
  block[4] = &v8;
  dispatch_sync((dispatch_queue_t)__defaultMediaLibraryQueue, block);
  id v3 = (void *)v9[5];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [a1 deviceMediaLibrary];
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v8, 8);

  return (MPMediaLibrary *)v5;
}

+ (id)deviceMediaLibrary
{
  if (deviceMediaLibrary_onceToken != -1) {
    dispatch_once(&deviceMediaLibrary_onceToken, &__block_literal_global_68);
  }
  int64_t v2 = (void *)deviceMediaLibrary___mediaLibrary;

  return v2;
}

- (BOOL)itemExistsWithPersistentID:(unint64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    libraryDataProvider = self->_libraryDataProvider;
    return [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider itemExistsWithPersistentID:a3];
  }
  else
  {
    uint64_t v7 = objc_alloc_init(MPMediaQuery);
    [(MPMediaQuery *)v7 setMediaLibrary:self];
    uint64_t v8 = [NSNumber numberWithUnsignedLongLong:a3];
    v9 = +[MPMediaPropertyPredicate predicateWithValue:v8 forProperty:@"persistentID"];
    [(MPMediaQuery *)v7 addFilterPredicate:v9];

    LOBYTE(v8) = [(MPMediaQuery *)v7 _hasItems];
    return (char)v8;
  }
}

- (id)_collectionsForQueryCriteria:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__15308;
  v31 = __Block_byref_object_dispose__15309;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__15308;
  v25 = __Block_byref_object_dispose__15309;
  id v26 = 0;
  entityCacheQueue = self->_entityCacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MPMediaLibrary__collectionsForQueryCriteria___block_invoke;
  block[3] = &unk_1E57F2870;
  v19 = &v27;
  block[4] = self;
  id v6 = v4;
  id v18 = v6;
  v20 = &v21;
  dispatch_sync(entityCacheQueue, block);
  uint64_t v7 = (void *)v22[5];
  if (v7)
  {
    [v7 updateToLibraryCurrentRevision];
    uint64_t v8 = [MPMediaEntityResultSetArray alloc];
    uint64_t v9 = [(MPMediaEntityResultSetArray *)v8 initWithResultSet:v22[5] queryCriteria:v6 entityType:1 library:self];
    uint64_t v10 = (void *)v28[5];
    v28[5] = v9;

    id v11 = self->_entityCacheQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__MPMediaLibrary__collectionsForQueryCriteria___block_invoke_2;
    v14[3] = &unk_1E57F9F48;
    v14[4] = self;
    v16 = &v27;
    id v15 = v6;
    dispatch_sync(v11, v14);
  }
  id v12 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v12;
}

- (id)_itemsForQueryCriteria:(id)a3
{
  id v5 = a3;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__15308;
  v34 = __Block_byref_object_dispose__15309;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__15308;
  v28 = __Block_byref_object_dispose__15309;
  id v29 = 0;
  entityCacheQueue = self->_entityCacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MPMediaLibrary__itemsForQueryCriteria___block_invoke;
  block[3] = &unk_1E57F2870;
  v22 = &v30;
  block[4] = self;
  id v7 = v5;
  id v21 = v7;
  uint64_t v23 = &v24;
  dispatch_sync(entityCacheQueue, block);
  uint64_t v8 = v25;
  if (v31[5] && v25[5])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"MPMediaLibrary.m" lineNumber:2070 description:@"only one of item/itemsResultSet should be set"];

    uint64_t v8 = v25;
  }
  uint64_t v9 = (void *)v8[5];
  if (v9)
  {
    [v9 updateToLibraryCurrentRevision];
    uint64_t v10 = [MPMediaEntityResultSetArray alloc];
    uint64_t v11 = [(MPMediaEntityResultSetArray *)v10 initWithResultSet:v25[5] queryCriteria:v7 entityType:0 library:self];
    id v12 = (void *)v31[5];
    v31[5] = v11;

    id v13 = self->_entityCacheQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __41__MPMediaLibrary__itemsForQueryCriteria___block_invoke_2;
    v17[3] = &unk_1E57F9F48;
    v17[4] = self;
    v19 = &v30;
    id v18 = v7;
    dispatch_sync(v13, v17);
  }
  id v14 = (id)v31[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v14;
}

- (id)artworkDataSource
{
  int64_t v2 = [(MPMediaLibrary *)self libraryDataProvider];
  id v3 = [v2 artworkDataSource];

  return v3;
}

- (id)itemWithPersistentID:(unint64_t)a3 verifyExistence:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = +[MPConcreteMediaItem concreteMediaItemWithPersistentID:a3 library:self];
  id v6 = v5;
  if (v4 && ([v5 existsInLibrary] & 1) == 0)
  {

    id v6 = 0;
  }

  return v6;
}

uint64_t __36__MPMediaLibrary_cloudFilteringType__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = __cloudFilteringType;
  return result;
}

uint64_t __44__MPMediaLibrary_addLibraryFilterPredicate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadLibraryForRestrictionsChange];
}

uint64_t __47__MPMediaLibrary__collectionsForQueryCriteria___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 80) setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKey:a1[5]];
}

uint64_t __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (NSString)_syncValidity
{
  return (NSString *)[(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider syncValidity];
}

- (BOOL)isHomeSharingLibrary
{
  return objc_opt_isKindOfClass() & 1;
}

void __47__MPMediaLibrary__collectionsForQueryCriteria___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1[4] + 104) objectForKey:a1[5]];
    uint64_t v6 = *(void *)(a1[7] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (!*(void *)(*(void *)(a1[7] + 8) + 40))
    {
      uint64_t v8 = [*(id *)(a1[4] + 16) collectionResultSetForQueryCriteria:a1[5]];
      uint64_t v9 = *(void *)(a1[7] + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      if (*(void *)(*(void *)(a1[7] + 8) + 40))
      {
        uint64_t v11 = *(void **)(a1[4] + 104);
        objc_msgSend(v11, "setObject:forKey:");
      }
    }
  }
}

void __41__MPMediaLibrary__itemsForQueryCriteria___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 48) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1[4] + 72) objectForKey:a1[5]];
    uint64_t v6 = *(void *)(a1[7] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (!*(void *)(*(void *)(a1[7] + 8) + 40))
    {
      uint64_t v8 = [*(id *)(a1[4] + 16) itemResultSetForQueryCriteria:a1[5]];
      uint64_t v9 = *(void *)(a1[7] + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      if (*(void *)(*(void *)(a1[7] + 8) + 40))
      {
        uint64_t v11 = *(void **)(a1[4] + 72);
        objc_msgSend(v11, "setObject:forKey:");
      }
    }
  }
}

- (void)enumerateEntityChangesAfterSyncAnchor:(id)a3 usingBlock:(id)a4
{
}

- (void)enumerateEntityChangesAfterSyncAnchor:(id)a3 maximumRevisionType:(int64_t)a4 usingBlock:(id)a5
{
}

void __51__MPMediaLibrary_additionalLibraryFilterPredicates__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 144) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSURL)protectedContentSupportStorageURL
{
  uint64_t v3 = [(MPMediaLibrary *)self libraryDataProvider];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(MPMediaLibrary *)self libraryDataProvider];
    uint64_t v6 = [v5 protectedContentSupportStorageURL];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSURL *)v6;
}

void __48__MPMediaLibrary__countOfItemsForQueryCriteria___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 48) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __36__MPMediaLibrary_deviceMediaLibrary__block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v0 = [[MPMediaLibrary alloc] _initWithUserIdentity:0];
  v1 = (void *)deviceMediaLibrary___mediaLibrary;
  deviceMediaLibrary___mediaLibrary = (uint64_t)v0;

  uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    uint64_t v9 = deviceMediaLibrary___mediaLibrary;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - Singleton", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v3 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  int v4 = [v3 isAppleTV];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:deviceMediaLibrary___mediaLibrary selector:sel__activeUserDidChangeNotification_ name:*MEMORY[0x1E4FB8350] object:0];

    uint64_t v6 = [_MPActiveUserChangeMonitor alloc];
    id v7 = [(_MPActiveUserChangeMonitor *)v6 initWithDelegate:deviceMediaLibrary___mediaLibrary];
    [(id)deviceMediaLibrary___mediaLibrary setActiveUserChangeMonitor:v7];
  }
}

- (MPMediaLibrary)initWithClientIdentity:(id)a3 userIdentity:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v53.receiver = self;
  v53.super_class = (Class)MPMediaLibrary;
  int v8 = [(MPMediaLibrary *)&v53 init];
  if (v8)
  {
    MPMediaLibraryAuthorizationStatus v9 = +[MPMediaLibrary authorizationStatus];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __54__MPMediaLibrary_initWithClientIdentity_userIdentity___block_invoke;
    v49[3] = &unk_1E57FA038;
    uint64_t v10 = v8;
    v50 = v10;
    id v51 = v6;
    id v52 = v7;
    uint64_t v11 = MEMORY[0x19971E0F0](v49);
    id v12 = (void *)v11;
    if (v9)
    {
      if (v9 == MPMediaLibraryAuthorizationStatusAuthorized)
      {
        (*(void (**)(uint64_t))(v11 + 16))(v11);
      }
      else
      {
        id v15 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = [NSString stringWithUTF8String:"-[MPMediaLibrary initWithClientIdentity:userIdentity:]"];
          *(_DWORD *)buf = 138543362;
          v55 = v16;
          _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_ERROR, "%{public}@: app not authorized for access", buf, 0xCu);
        }
      }
    }
    else
    {
      id v13 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary_Oversize");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)buf = 138543362;
        v55 = v14;
        _os_log_impl(&dword_1952E8000, v13, OS_LOG_TYPE_DEFAULT, "MPMediaLibraryAuthorizationStatus has not been determined, %{public}@", buf, 0xCu);
      }
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __54__MPMediaLibrary_initWithClientIdentity_userIdentity___block_invoke_142;
      v46[3] = &unk_1E57F0480;
      id v48 = v12;
      v47 = v10;
      +[MPMediaLibrary requestAuthorization:v46];
    }
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.mediaplayer.MPMediaLibrary", 0);
    entityCacheQueue = v10->_entityCacheQueue;
    v10->_entityCacheQueue = (OS_dispatch_queue *)v17;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.mediaplayer.MPMediaLibrary.connectionAssertions", 0);
    connectionAssertionsQueue = v10->_connectionAssertionsQueue;
    v10->_connectionAssertionsQueue = (OS_dispatch_queue *)v19;

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.mediaplayer.MPMediaLibrary.additionalLibraryFilterPredicatesAccessQueue", 0);
    additionalLibraryFilterPredicatesAccessQueue = v10->_additionalLibraryFilterPredicatesAccessQueue;
    v10->_additionalLibraryFilterPredicatesAccessQueue = (OS_dispatch_queue *)v21;

    uint64_t v23 = objc_alloc_init(QueryCriteriaResultsCache);
    itemsForCriteriaCache = v10->_itemsForCriteriaCache;
    v10->_itemsForCriteriaCache = v23;

    v25 = objc_alloc_init(QueryCriteriaResultsCache);
    itemResultSetsForCriteriaCache = v10->_itemResultSetsForCriteriaCache;
    v10->_itemResultSetsForCriteriaCache = v25;

    uint64_t v27 = objc_alloc_init(QueryCriteriaResultsCache);
    collectionsForCriteriaCache = v10->_collectionsForCriteriaCache;
    v10->_collectionsForCriteriaCache = v27;

    id v29 = objc_alloc_init(QueryCriteriaResultsCache);
    collectionsResultSetsForCriteriaCache = v10->_collectionsResultSetsForCriteriaCache;
    v10->_collectionsResultSetsForCriteriaCache = v29;

    v31 = objc_alloc_init(QueryCriteriaResultsCache);
    hasItemsForCriteriaCache = v10->_hasItemsForCriteriaCache;
    v10->_hasItemsForCriteriaCache = v31;

    v33 = objc_alloc_init(QueryCriteriaResultsCache);
    hasCollectionsForCriteriaCache = v10->_hasCollectionsForCriteriaCache;
    v10->_hasCollectionsForCriteriaCache = v33;

    id v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    hasItemsDidLoadForCriteria = v10->_hasItemsDidLoadForCriteria;
    v10->_hasItemsDidLoadForCriteria = v35;

    v37 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    hasCollectionsDidLoadForCriteria = v10->_hasCollectionsDidLoadForCriteria;
    v10->_hasCollectionsDidLoadForCriteria = v37;

    v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    countOfCollectionsDidLoadForCriteria = v10->_countOfCollectionsDidLoadForCriteria;
    v10->_countOfCollectionsDidLoadForCriteria = v39;

    v41 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    countOfItemsDidLoadForCriteria = v10->_countOfItemsDidLoadForCriteria;
    v10->_countOfItemsDidLoadForCriteria = v41;

    v10->_connectionProgress = -1.0;
    uint64_t v43 = dispatch_get_global_queue(2, 0);
    fixedQueue = v10->_fixedQueue;
    v10->_fixedQueue = (OS_dispatch_queue *)v43;

    v10->__MLCoreStorageLock._os_unfair_lock_opaque = 0;
    v10->__MLCoreStorageLockPointer = &v10->__MLCoreStorageLock;
    [(MPMediaLibrary *)v10 _setupNotifications];
    [(MPMediaLibrary *)v10 _setLibraryFilterPredicates];
  }
  return v8;
}

void __54__MPMediaLibrary_initWithClientIdentity_userIdentity___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = [[MPMediaLibraryPrivacyContext alloc] initWithClientIdentity:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v2 = +[MPMediaLibraryPrivacyContext contextForDefaultClient];
  }
  uint64_t v3 = v2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), v2);

  uint64_t v4 = [*(id *)(a1 + 48) copy];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v4;

  id v7 = [MEMORY[0x1E4F79AF8] musicLibraryForUserAccount:*(void *)(*(void *)(a1 + 32) + 248)];
  int v8 = [[MPMediaLibraryDataProviderSystemML3 alloc] initWithLibrary:v7];
  [(MPMediaLibraryDataProviderML3 *)v8 setMediaLibrary:*(void *)(a1 + 32)];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v8);
  if ([*(id *)(*(void *)(a1 + 32) + 16) conformsToProtocol:&unk_1EE6F1530]) {
    [*(id *)(*(void *)(a1 + 32) + 16) setUserIdentity:*(void *)(*(void *)(a1 + 32) + 248)];
  }
  MPMediaLibraryAuthorizationStatus v9 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(v10 + 248);
    int v12 = 138543618;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - New library created for user identity: %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)_setupNotifications
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_initWeak(location, self);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __37__MPMediaLibrary__setupNotifications__block_invoke;
  v29[3] = &unk_1E57F06A0;
  objc_copyWeak(&v30, location);
  uint64_t v5 = [v3 addObserverForName:@"MPCloudControllerCanShowCloudTracksDidChangeNotification" object:0 queue:0 usingBlock:v29];
  [(NSArray *)v4 addObject:v5];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __37__MPMediaLibrary__setupNotifications__block_invoke_2;
  v27[3] = &unk_1E57F06A0;
  objc_copyWeak(&v28, location);
  id v6 = [v3 addObserverForName:@"MPMediaLibraryDisplayValuesDidChangeNotification" object:self queue:0 usingBlock:v27];
  [(NSArray *)v4 addObject:v6];

  id v7 = MPUIApplication();
  uint64_t v8 = *MEMORY[0x1E4FB2650];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __37__MPMediaLibrary__setupNotifications__block_invoke_3;
  v25[3] = &unk_1E57F06A0;
  objc_copyWeak(&v26, location);
  MPMediaLibraryAuthorizationStatus v9 = [v3 addObserverForName:v8 object:v7 queue:0 usingBlock:v25];
  [(NSArray *)v4 addObject:v9];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __37__MPMediaLibrary__setupNotifications__block_invoke_4;
  v23[3] = &unk_1E57F06A0;
  objc_copyWeak(&v24, location);
  uint64_t v10 = [v3 addObserverForName:@"MPMediaLibraryFilteringDidChangeNotification" object:0 queue:0 usingBlock:v23];
  [(NSArray *)v4 addObject:v10];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __37__MPMediaLibrary__setupNotifications__block_invoke_5;
  v21[3] = &unk_1E57F06A0;
  objc_copyWeak(&v22, location);
  uint64_t v11 = [v3 addObserverForName:@"MPMediaLibraryCloudLibraryAvailabilityDidChangeNotification" object:0 queue:0 usingBlock:v21];
  [(NSArray *)v4 addObject:v11];

  uint64_t v12 = *MEMORY[0x1E4F73EC0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __37__MPMediaLibrary__setupNotifications__block_invoke_6;
  v19[3] = &unk_1E57F06A0;
  objc_copyWeak(&v20, location);
  uint64_t v13 = [v3 addObserverForName:v12 object:0 queue:0 usingBlock:v19];
  [(NSArray *)v4 addObject:v13];

  uint64_t v14 = *MEMORY[0x1E4F793A0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __37__MPMediaLibrary__setupNotifications__block_invoke_7;
  v17[3] = &unk_1E57F06A0;
  objc_copyWeak(&v18, location);
  uint64_t v15 = [v3 addObserverForName:v14 object:0 queue:0 usingBlock:v17];
  [(NSArray *)v4 addObject:v15];

  notificationObservers = self->_notificationObservers;
  self->_notificationObservers = v4;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(location);
}

- (id)_initWithUserIdentity:(id)a3
{
  return [(MPMediaLibrary *)self initWithClientIdentity:0 userIdentity:a3];
}

uint64_t __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  uint64_t v2 = [*(id *)(a1 + 56) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(a1 + 56);

  return [v5 removeAllObjects];
}

void __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_6(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_3;
  v5[3] = &unk_1E57F0568;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 48);
  v5[4] = *(void *)(a1 + 40);
  id v6 = v4;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 56);
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v5);
}

void __44__MPMediaLibrary__hasItemsForQueryCriteria___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__MPMediaLibrary__hasItemsForQueryCriteria___block_invoke_4;
  v8[3] = &unk_1E57F0600;
  id v9 = v5;
  id v7 = v5;
  [v6 loadQueryCriteria:a2 hasItemsWithCompletionBlock:v8];
}

void __54__MPMediaLibrary__countOfCollectionsForQueryCriteria___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__MPMediaLibrary__countOfCollectionsForQueryCriteria___block_invoke_4;
  v8[3] = &unk_1E57F0650;
  id v9 = v5;
  id v7 = v5;
  [v6 loadQueryCriteria:a2 countOfCollectionsWithCompletionBlock:v8];
}

void __54__MPMediaLibrary__countOfCollectionsForQueryCriteria___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [NSNumber numberWithUnsignedInteger:a2];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

void __48__MPMediaLibrary__countOfItemsForQueryCriteria___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__MPMediaLibrary__countOfItemsForQueryCriteria___block_invoke_4;
  v8[3] = &unk_1E57F0650;
  id v9 = v5;
  id v7 = v5;
  [v6 loadQueryCriteria:a2 countOfItemsWithCompletionBlock:v8];
}

void __48__MPMediaLibrary__countOfItemsForQueryCriteria___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [NSNumber numberWithUnsignedInteger:a2];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

void __50__MPMediaLibrary__hasCollectionsForQueryCriteria___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__MPMediaLibrary__hasCollectionsForQueryCriteria___block_invoke_4;
  v8[3] = &unk_1E57F0600;
  id v9 = v5;
  id v7 = v5;
  [v6 loadQueryCriteria:a2 hasCollectionsWithCompletionBlock:v8];
}

void __50__MPMediaLibrary__hasCollectionsForQueryCriteria___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [NSNumber numberWithBool:a2];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

void __44__MPMediaLibrary__hasItemsForQueryCriteria___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [NSNumber numberWithBool:a2];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

void __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v3 = [NSNumber numberWithInteger:0];
  }
  uint64_t v16 = 0;
  dispatch_queue_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  dispatch_queue_t v19 = __Block_byref_object_copy__15308;
  id v20 = __Block_byref_object_dispose__15309;
  id v21 = 0;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_4;
  block[3] = &unk_1E57F0DE0;
  id v11 = *(id *)(a1 + 40);
  id v5 = v3;
  id v12 = v5;
  id v13 = *(id *)(a1 + 48);
  uint64_t v15 = &v16;
  id v14 = *(id *)(a1 + 56);
  dispatch_sync(v4, block);
  id v6 = (void *)v17[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_5;
  v8[3] = &unk_1E57F0540;
  id v7 = v5;
  id v9 = v7;
  [v6 enumerateObjectsUsingBlock:v8];

  _Block_object_dispose(&v16, 8);
}

void __44__MPMediaLibrary__hasItemsForQueryCriteria___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 48) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)beginGeneratingLibraryChangeNotifications
{
  uint64_t v3 = +[MPMediaLibrary deviceMediaLibrary];

  if (v3 == self) {
    ++self->_libraryChangeObservers;
  }
}

- (id)connectionAssertionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [[MPMediaLibraryConnectionAssertion alloc] _initWithMediaLibrary:self identifier:v4];

  connectionAssertionsQueue = self->_connectionAssertionsQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__MPMediaLibrary_connectionAssertionWithIdentifier___block_invoke;
  v11[3] = &unk_1E57F9F98;
  v11[4] = self;
  id v7 = v5;
  id v12 = v7;
  dispatch_sync(connectionAssertionsQueue, v11);
  id v8 = v12;
  id v9 = v7;

  return v9;
}

+ (void)beginDiscoveringMediaLibraries
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (!__numberOfHomeSharingObservers++)
    {
      +[MPHomeSharingML3DataProvider beginScanningForLibraries];
    }
  }
  else
  {
    uint64_t v3 = MEMORY[0x1E4F14428];
    dispatch_async(v3, &__block_literal_global_178);
  }
}

- (void)setCloudFilteringType:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = +[MPMediaLibrary deviceMediaLibrary];

  if (v5 == self)
  {
    uint64_t v18 = 0;
    dispatch_queue_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__MPMediaLibrary_setCloudFilteringType___block_invoke;
    block[3] = &unk_1E57F0678;
    void block[4] = &v18;
    void block[5] = a3;
    dispatch_sync((dispatch_queue_t)__serialAccessQueue, block);
    if (*((unsigned char *)v19 + 24))
    {
      id v6 = +[MPMediaLibrary _mediaLibraries];
      id v7 = (void *)[v6 copy];

      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v22 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * i) _reloadLibraryForRestrictionsChange];
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v22 count:16];
        }
        while (v9);
      }
    }
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v12 = +[MPMediaLibrary deviceMediaLibrary];
    [v12 setCloudFilteringType:a3];
  }
}

void __37__MPMediaLibrary__setupNotifications__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadLibraryForRestrictionsChange];
}

- (void)addLibraryFilterPredicate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    additionalLibraryFilterPredicatesAccessQueue = self->_additionalLibraryFilterPredicatesAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__MPMediaLibrary_addLibraryFilterPredicate___block_invoke;
    block[3] = &unk_1E57F9F98;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(additionalLibraryFilterPredicatesAccessQueue, block);
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      [(MPMediaLibrary *)self _reloadLibraryForRestrictionsChange];
    }
    else
    {
      id v7 = dispatch_get_global_queue(0, 0);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __44__MPMediaLibrary_addLibraryFilterPredicate___block_invoke_2;
      v8[3] = &unk_1E57F9EA8;
      void v8[4] = self;
      dispatch_async(v7, v8);
    }
  }
}

- (void)_reloadLibraryForRestrictionsChange
{
  [(MPMediaLibrary *)self _setLibraryFilterPredicates];
  [(MPMediaLibrary *)self _clearCachedContentDataAndResultSets:1];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__MPMediaLibrary__reloadLibraryForRestrictionsChange__block_invoke;
  v3[3] = &unk_1E57F9EA8;
  v3[4] = self;
  [(MPMediaLibrary *)self _scheduleLibraryChangeNotificationPostingBlock:v3];
}

- (void)_scheduleLibraryChangeNotificationPostingBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if ([(MPMediaLibrary *)self libraryChangeObservers] >= 1) {
      v4[2](v4);
    }
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65__MPMediaLibrary__scheduleLibraryChangeNotificationPostingBlock___block_invoke;
    v5[3] = &unk_1E57F9140;
    v5[4] = self;
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

- (void)_clearCachedEntitiesIncludingResultSets:(BOOL)a3
{
  entityCacheQueue = self->_entityCacheQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__MPMediaLibrary__clearCachedEntitiesIncludingResultSets___block_invoke;
  v4[3] = &unk_1E57F9E08;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(entityCacheQueue, v4);
}

- (void)_clearCachedContentDataAndResultSets:(BOOL)a3
{
  *((unsigned char *)self + 192) &= 0xAAu;
  *((unsigned char *)self + 193) &= 0xAAu;
  self->_determinedHasVideos = 0;
  self->_determinedHasMusicVideos = 0;
  self->_determinedHasAudibleAudioBooks = 0;
  self->_determinedHasMovies = 0;
  self->_determinedHasCompilations = 0;
  self->_determinedHasITunesU = 0;
  self->_determinedHasVideoITunesU = 0;
  self->_determinedHasMovieRentals = 0;
  self->_determinedHasTVShows = 0;
  self->_determinedHasHomeVideos = 0;
  self->_determinedHasVideoPodcasts = 0;
  [(MPMediaLibrary *)self _clearCachedEntitiesIncludingResultSets:a3];
}

uint64_t __65__MPMediaLibrary__scheduleLibraryChangeNotificationPostingBlock___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) libraryChangeObservers];
  if (result >= 1)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (int64_t)libraryChangeObservers
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[MPMediaLibrary deviceMediaLibrary];

  if (v3 == self) {
    return self->_libraryChangeObservers;
  }
  id v4 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    uint64_t v9 = self;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - Notifications - Reading libraryChangeObservers from deviceMediaLibrary", (uint8_t *)&v8, 0xCu);
  }

  BOOL v5 = +[MPMediaLibrary deviceMediaLibrary];
  int64_t v6 = [v5 libraryChangeObservers];

  return v6;
}

uint64_t __58__MPMediaLibrary__clearCachedEntitiesIncludingResultSets___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 88) removeAllObjects];
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 104);
    return [v3 removeAllObjects];
  }
  return result;
}

uint64_t __53__MPMediaLibrary__reloadLibraryForRestrictionsChange__block_invoke(uint64_t a1)
{
  +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryDidChangeNotification" library:*(void *)(a1 + 32) userInfo:0];
  uint64_t v2 = *(void *)(a1 + 32);

  return +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryRestrictionsDidChangeNotification" library:v2 userInfo:0];
}

+ (void)_postNotificationName:(id)a3 library:(id)a4 userInfo:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    uint64_t v10 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - Posting notification [%@]", buf, 0x16u);
    }

    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:v7 object:v8 userInfo:v9];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__MPMediaLibrary__postNotificationName_library_userInfo___block_invoke;
    v13[3] = &unk_1E57F04A8;
    id v14 = v7;
    id v15 = v9;
    [v8 _performBlockOnLibraryHandlingTheSameAccount:v13];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:v7 object:0 userInfo:v9];
  }
}

- (void)_performBlockOnLibraryHandlingTheSameAccount:(id)a3
{
  id v14 = (void (**)(id, void *))a3;
  id v4 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  int v5 = [v4 supportsMultipleITunesAccounts];

  if (v5)
  {
    int64_t v6 = +[MPMediaLibrary deviceMediaLibrary];
    if (v6 == self)
    {
    }
    else
    {
      id v7 = v6;
      id v8 = +[MPMediaLibrary deviceMediaLibrary];
      BOOL v9 = [(MPMediaLibrary *)self _handlesSameAccountAs:v8];

      if (v9)
      {
        uint64_t v10 = +[MPMediaLibrary deviceMediaLibrary];
        if (!v10) {
          goto LABEL_10;
        }
LABEL_9:
        v14[2](v14, v10);

        goto LABEL_10;
      }
    }
    id v11 = +[MPMediaLibrary deviceMediaLibrary];

    if (v11 == self)
    {
      id v12 = +[MPMediaLibrary deviceMediaLibrary];
      long long v13 = [v12 userIdentity];
      uint64_t v10 = +[MPMediaLibrary _deviceMediaLibraryWithUserIdentity:v13 createIfRequired:0];

      if (v10) {
        goto LABEL_9;
      }
    }
  }
LABEL_10:
}

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_15484);
  }
}

- (id)favoriteSongsPlaylist
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = (void *)[(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider favoriteSongsPlaylistPersistentID];
    if (v3)
    {
      uint64_t v3 = [(MPMediaLibrary *)self playlistWithPersistentID:v3];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (shared_ptr<mlcore::DeviceLibrary>)_MediaLibrary_coreLibrary
{
  v126 = v2;
  uint64_t v241 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  os_unfair_lock_lock([(MPMediaLibrary *)v3 _MLCoreStorageLockPointer]);
  v127 = v3;
  id v4 = [(MPMediaLibrary *)v3 _MLCoreStorage];
  if (!v4)
  {
    v124 = [(MPMediaLibrary *)v3 databasePath];
    v117 = [(__CFString *)v124 lastPathComponent];
    int v5 = (char *)[(__CFString *)v117 UTF8String];
    if (!v5)
    {
      dispatch_semaphore_t v137 = dispatch_semaphore_create(0);
      uint64_t v6 = [(MPMediaLibrary *)v127 _dataProviderDescription];
      id v7 = (void *)v6;
      id v8 = (void *)MEMORY[0x1E4F77950];
      v219[0] = @"MPMediaLibrary";
      v219[1] = @"databasePath";
      BOOL v9 = @"nil";
      uint64_t v10 = v124;
      if (!v124) {
        uint64_t v10 = @"nil";
      }
      v220[0] = v127;
      v220[1] = v10;
      v219[2] = @"databaseNameString";
      v219[3] = @"dataProviderDescription";
      if (v117) {
        id v11 = v117;
      }
      else {
        id v11 = @"nil";
      }
      if (v6) {
        BOOL v9 = (__CFString *)v6;
      }
      v220[2] = v11;
      v220[3] = v9;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v220 forKeys:v219 count:4];
      v221 = v12;
      long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v221 count:1];
      uint64_t v14 = *MEMORY[0x1E4F778C8];
      v172[0] = MEMORY[0x1E4F143A8];
      v172[1] = 3221225472;
      v172[2] = __61__MPMediaLibrary_MediaLibraryCore___MediaLibrary_coreLibrary__block_invoke;
      v172[3] = &unk_1E57F9EA8;
      id v15 = v137;
      v173 = v15;
      [v8 snapshotWithDomain:v14 type:@"Bug" subType:@"Invalid Database Path" context:@"databaseNameStringPtr is null" triggerThresholdValues:0 events:v13 completion:v172];

      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    }
    std::string::basic_string[abi:ne180100]<0>(&__s, v5);
    id v119 = [(__CFString *)v124 stringByDeletingLastPathComponent];
    uint64_t v16 = [v119 fileSystemRepresentation];
    if (v16) {
      id v17 = (char *)v16;
    }
    else {
      id v17 = "";
    }
    std::string::basic_string[abi:ne180100]<0>(v169, v17);
    __int16 v18 = NSString;
    uint64_t v19 = MSVSystemRootDirectory();
    uint64_t v20 = (void *)v19;
    char v21 = @"/";
    if (v19) {
      char v21 = (__CFString *)v19;
    }
    v218[0] = v21;
    v218[1] = @"System";
    v218[2] = @"Library";
    v218[3] = @"PrivateFrameworks";
    v218[4] = @"MediaLibraryCore.framework";
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v218 count:5];
    uint64_t v23 = [v18 pathWithComponents:v22];

    id v120 = v23;
    uint64_t v24 = [v120 fileSystemRepresentation];
    if (v24) {
      v25 = (char *)v24;
    }
    else {
      v25 = "";
    }
    std::string::basic_string[abi:ne180100]<0>(v167, v25);
    NSTemporaryDirectory();
    id v121 = objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v121 fileSystemRepresentation];
    if (v26) {
      uint64_t v27 = (char *)v26;
    }
    else {
      uint64_t v27 = "";
    }
    std::string::basic_string[abi:ne180100]<0>(v165, v27);
    MEMORY[0x19971BCA0](&v228, v169);
    MEMORY[0x19971BCA0](&__p, v165);
    MEMORY[0x19971BCA0](v222, v167);
    std::string::basic_string[abi:ne180100]<0>(&v234, "en");
    v151 = 0;
    v152 = 0;
    v153 = 0;
    v209 = &v151;
    LOBYTE(v210) = 0;
    id v28 = (std::string *)operator new(0x18uLL);
    id v29 = v28;
    v151 = v28;
    v152 = v28;
    v153 = v28 + 1;
    v176[0] = v28;
    *(void *)&long long v201 = v28;
    p_std::__split_buffer<std::string>::pointer begin = &v153;
    v231 = (std::__shared_weak_count *)&v201;
    v232 = v176;
    char v233 = 0;
    if (SHIBYTE(v235) < 0)
    {
      std::string::__init_copy_ctor_external(v28, (const std::string::value_type *)v234, *((std::string::size_type *)&v234 + 1));
      id v29 = (std::string *)v176[0];
    }
    else
    {
      *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v234;
      v28->__r_.__value_.__r.__words[2] = v235;
    }
    id v30 = v29 + 1;
    v176[0] = v30;
    char v233 = 1;
    std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&p_begin);
    v152 = v30;
    MEMORY[0x19971BC00](&v160, &v228, &__p, v222, &v151);
    p_std::__split_buffer<std::string>::pointer begin = &v151;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    if (SHIBYTE(v235) < 0) {
      operator delete((void *)v234);
    }
    v222[0].__first_ = (std::__split_buffer<std::string>::pointer)(MEMORY[0x1E4F76A80] + 16);
    p_std::__split_buffer<std::string>::pointer begin = &v222[0].__begin_;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    __p = (void *)(MEMORY[0x1E4F76A80] + 16);
    p_std::__split_buffer<std::string>::pointer begin = (std::__split_buffer<std::string>::pointer *)&v224;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    uint64_t v228 = MEMORY[0x1E4F76A80] + 16;
    p_std::__split_buffer<std::string>::pointer begin = (std::__split_buffer<std::string>::pointer *)&v229;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    v31 = [MEMORY[0x1E4F79AF0] sharedResourceManager];
    v125 = [v31 resources];

    v115 = [v125 sectionsInfo];
    v114 = [v115 objectForKey:@"SectionHeaders"];
    v122 = [v115 objectForKey:@"LocalizedSectionHeaders"];
    v116 = [v115 objectForKey:@"SectionIndices"];
    v123 = [v115 objectForKey:@"LocalizedSectionIndices"];
    uint64_t v32 = [v115 objectForKey:@"NameTransform"];
    *(void *)&long long v234 = 0;
    *((void *)&v234 + 1) = &v234;
    uint64_t v235 = 0x5812000000;
    v236 = __Block_byref_object_copy__10142;
    memset(v238, 0, sizeof(v238));
    v237 = __Block_byref_object_dispose__10143;
    uint64_t v239 = 0;
    int v240 = 1065353216;
    v217[0] = MEMORY[0x1E4F143A8];
    v217[1] = 3221225472;
    v217[2] = ___ZL26_MPMLCopyLanguageResourcesv_block_invoke;
    v217[3] = &unk_1E57EF210;
    v217[4] = &v234;
    [v122 enumerateKeysAndObjectsUsingBlock:v217];
    v209 = 0;
    v210 = &v209;
    uint64_t v211 = 0x5812000000;
    v212 = __Block_byref_object_copy__10142;
    memset(v214, 0, sizeof(v214));
    v213 = __Block_byref_object_dispose__10143;
    uint64_t v215 = 0;
    int v216 = 1065353216;
    v208[0] = MEMORY[0x1E4F143A8];
    v208[1] = 3221225472;
    v208[2] = ___ZL26_MPMLCopyLanguageResourcesv_block_invoke_2;
    v208[3] = &unk_1E57EF210;
    v208[4] = &v209;
    [v123 enumerateKeysAndObjectsUsingBlock:v208];
    id v118 = (id)v32;
    v206 = 0;
    v205 = 0;
    unint64_t v207 = 0;
    long long v201 = 0u;
    long long v202 = 0u;
    long long v203 = 0u;
    long long v204 = 0u;
    obuint64_t j = v114;
    uint64_t v130 = [obj countByEnumeratingWithState:&v201 objects:&p_begin count:16];
    if (v130)
    {
      uint64_t v129 = *(void *)v202;
      do
      {
        id v138 = 0;
        do
        {
          if (*(void *)v202 != v129) {
            objc_enumerationMutation(obj);
          }
          v33 = *(void **)(*((void *)&v201 + 1) + 8 * (void)v138);
          id v133 = [v33 objectForKey:@"FirstCharacterAfterLanguage"];
          std::string::basic_string[abi:ne180100]<0>(v222, (char *)[v133 UTF8String]);
          mediaplatform::UTF8ToUTF16String();
          if (SHIBYTE(v224) < 0)
          {
            unsigned int v132 = *(_DWORD *)__p;
            operator delete(__p);
          }
          else
          {
            unsigned int v132 = __p;
          }
          if (SHIBYTE(v222[0].__end_) < 0) {
            operator delete(v222[0].__first_);
          }
          id v135 = [v33 objectForKey:@"LastCharacter"];
          std::string::basic_string[abi:ne180100]<0>(v222, (char *)[v135 UTF8String]);
          mediaplatform::UTF8ToUTF16String();
          if (SHIBYTE(v224) < 0)
          {
            unsigned int v131 = *(_DWORD *)__p;
            operator delete(__p);
          }
          else
          {
            unsigned int v131 = __p;
          }
          if (SHIBYTE(v222[0].__end_) < 0) {
            operator delete(v222[0].__first_);
          }
          v34 = [v33 objectForKey:@"Headers"];
          memset(v222, 0, 24);
          long long v197 = 0u;
          long long v198 = 0u;
          long long v199 = 0u;
          long long v200 = 0u;
          id v35 = v34;
          uint64_t v36 = [v35 countByEnumeratingWithState:&v197 objects:&v228 count:16];
          if (v36)
          {
            uint64_t v37 = *(void *)v198;
            do
            {
              for (uint64_t i = 0; i != v36; ++i)
              {
                if (*(void *)v198 != v37) {
                  objc_enumerationMutation(v35);
                }
                std::string::basic_string[abi:ne180100]<0>(v176, (char *)[*(id *)(*((void *)&v197 + 1) + 8 * i) UTF8String]);
                std::__split_buffer<std::string>::pointer begin = v222[0].__begin_;
                if (v222[0].__begin_ >= v222[0].__end_)
                {
                  unint64_t v41 = 0xAAAAAAAAAAAAAAABLL * (((char *)v222[0].__begin_ - (char *)v222[0].__first_) >> 3);
                  unint64_t v42 = v41 + 1;
                  if (v41 + 1 > 0xAAAAAAAAAAAAAAALL) {
                    std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
                  }
                  if (0x5555555555555556 * (((char *)v222[0].__end_ - (char *)v222[0].__first_) >> 3) > v42) {
                    unint64_t v42 = 0x5555555555555556 * (((char *)v222[0].__end_ - (char *)v222[0].__first_) >> 3);
                  }
                  if (0xAAAAAAAAAAAAAAABLL * (((char *)v222[0].__end_ - (char *)v222[0].__first_) >> 3) >= 0x555555555555555) {
                    unint64_t v43 = 0xAAAAAAAAAAAAAAALL;
                  }
                  else {
                    unint64_t v43 = v42;
                  }
                  *(void *)&long long v226 = &v222[0].__end_;
                  if (v43) {
                    unint64_t v43 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v43);
                  }
                  else {
                    uint64_t v44 = 0;
                  }
                  unint64_t v45 = v43 + 24 * v41;
                  __p = (void *)v43;
                  *(void *)&long long v224 = v45;
                  unint64_t v225 = v43 + 24 * v44;
                  long long v46 = *(_OWORD *)v176;
                  *(void *)(v45 + 16) = v177;
                  *(_OWORD *)unint64_t v45 = v46;
                  std::string::size_type v177 = 0;
                  v176[1] = 0;
                  v176[0] = 0;
                  *((void *)&v224 + 1) = v45 + 24;
                  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)v222, (std::__split_buffer<std::string> *)&__p);
                  v47 = v222[0].__begin_;
                  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&__p);
                  v222[0].__begin_ = v47;
                  if (SHIBYTE(v177) < 0) {
                    operator delete(v176[0]);
                  }
                }
                else
                {
                  long long v40 = *(_OWORD *)v176;
                  v222[0].__begin_->__r_.__value_.__r.__words[2] = v177;
                  *(_OWORD *)&begin->__r_.__value_.__l.__data_ = v40;
                  v222[0].__begin_ = begin + 1;
                }
              }
              uint64_t v36 = [v35 countByEnumeratingWithState:&v197 objects:&v228 count:16];
            }
            while (v36);
          }

          MEMORY[0x19971C560](&__p, v132, v131, v222, *((void *)&v234 + 1) + 48);
          id v48 = (char *)v206;
          if ((unint64_t)v206 < v207)
          {
            *(void *)v206 = __p;
            *((void *)v48 + 1) = 0;
            *((void *)v48 + 3) = 0;
            *((void *)v48 + 4) = 0;
            *((void *)v48 + 2) = 0;
            *(_OWORD *)(v48 + 8) = v224;
            *((void *)v48 + 3) = v225;
            long long v224 = 0uLL;
            unint64_t v225 = 0;
            *((void *)v48 + 5) = 0;
            *((void *)v48 + 6) = 0;
            *((_OWORD *)v48 + 2) = v226;
            *((void *)v48 + 6) = v227;
            long long v226 = 0uLL;
            uint64_t v227 = 0;
            v49 = v48 + 56;
            goto LABEL_79;
          }
          v50 = v205;
          uint64_t v51 = 0x6DB6DB6DB6DB6DB7 * (((unsigned char *)v206 - v205) >> 3);
          unint64_t v52 = v51 + 1;
          if ((unint64_t)(v51 + 1) > 0x492492492492492) {
            std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
          }
          if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v207 - (void)v205) >> 3) > v52) {
            unint64_t v52 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v207 - (void)v205) >> 3);
          }
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v207 - (void)v205) >> 3)) >= 0x249249249249249) {
            unint64_t v53 = 0x492492492492492;
          }
          else {
            unint64_t v53 = v52;
          }
          if (v53 > 0x492492492492492) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v54 = (char *)operator new(56 * v53);
          unint64_t v55 = v225;
          uint64_t v56 = &v54[56 * v51];
          *(void *)uint64_t v56 = __p;
          *(_OWORD *)(v56 + 8) = v224;
          *((void *)v56 + 3) = v55;
          unint64_t v225 = 0;
          long long v224 = 0uLL;
          *((_OWORD *)v56 + 2) = v226;
          *((void *)v56 + 6) = v227;
          uint64_t v227 = 0;
          v49 = v56 + 56;
          long long v226 = 0uLL;
          if (v48 == v50)
          {
            v205 = v56;
            v206 = v56 + 56;
            unint64_t v207 = (unint64_t)&v54[56 * v53];
            if (v48) {
              goto LABEL_78;
            }
          }
          else
          {
            uint64_t v57 = 0;
            do
            {
              v58 = &v56[v57];
              v59 = &v48[v57];
              *((void *)v58 - 7) = *(void *)&v48[v57 - 56];
              *((void *)v58 - 6) = 0;
              *((void *)v58 - 5) = 0;
              *((void *)v58 - 4) = 0;
              *((_OWORD *)v58 - 3) = *(_OWORD *)&v48[v57 - 48];
              *((void *)v58 - 4) = *(void *)&v48[v57 - 32];
              *((void *)v59 - 6) = 0;
              *((void *)v59 - 5) = 0;
              *((void *)v59 - 4) = 0;
              *((void *)v58 - 3) = 0;
              *((void *)v58 - 2) = 0;
              *((void *)v58 - 1) = 0;
              *(_OWORD *)(v58 - 24) = *(_OWORD *)&v48[v57 - 24];
              *((void *)v58 - 1) = *(void *)&v48[v57 - 8];
              *((void *)v59 - 3) = 0;
              *((void *)v59 - 2) = 0;
              *((void *)v59 - 1) = 0;
              v57 -= 56;
            }
            while (&v48[v57] != v50);
            v60 = v205;
            id v48 = (char *)v206;
            v205 = &v56[v57];
            v206 = v56 + 56;
            unint64_t v207 = (unint64_t)&v54[56 * v53];
            if (v48 != v60)
            {
              do
              {
                v176[0] = v48 - 24;
                std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v176);
                v176[0] = v48 - 48;
                std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v176);
                v48 -= 56;
              }
              while (v48 != v60);
              id v48 = v60;
            }
            if (v48) {
LABEL_78:
            }
              operator delete(v48);
          }
LABEL_79:
          v206 = v49;
          v176[0] = &v226;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v176);
          v176[0] = &v224;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v176);
          __p = v222;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

          id v138 = (char *)v138 + 1;
        }
        while (v138 != (id)v130);
        uint64_t v61 = [obj countByEnumeratingWithState:&v201 objects:&p_begin count:16];
        uint64_t v130 = v61;
      }
      while (v61);
    }

    memset(&v196, 0, sizeof(v196));
    long long v192 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    long long v195 = 0u;
    id v139 = v116;
    uint64_t v62 = [v139 countByEnumeratingWithState:&v192 objects:&__p count:16];
    if (v62)
    {
      uint64_t v63 = *(void *)v193;
      do
      {
        for (uint64_t j = 0; j != v62; ++j)
        {
          if (*(void *)v193 != v63) {
            objc_enumerationMutation(v139);
          }
          std::string::basic_string[abi:ne180100]<0>(v176, (char *)[*(id *)(*((void *)&v192 + 1) + 8 * j) UTF8String]);
          std::vector<std::string>::pointer end = v196.__end_;
          if (v196.__end_ >= v196.__end_cap_.__value_)
          {
            unint64_t v67 = 0xAAAAAAAAAAAAAAABLL * (((char *)v196.__end_ - (char *)v196.__begin_) >> 3);
            unint64_t v68 = v67 + 1;
            if (v67 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556 * (((char *)v196.__end_cap_.__value_ - (char *)v196.__begin_) >> 3) > v68) {
              unint64_t v68 = 0x5555555555555556 * (((char *)v196.__end_cap_.__value_ - (char *)v196.__begin_) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v196.__end_cap_.__value_ - (char *)v196.__begin_) >> 3) >= 0x555555555555555) {
              unint64_t v69 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v69 = v68;
            }
            v222[0].__end_cap_.__value_ = (std::allocator<std::string> *)&v196.__end_cap_;
            if (v69) {
              unint64_t v69 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v69);
            }
            else {
              uint64_t v70 = 0;
            }
            v71 = (std::string *)(v69 + 24 * v67);
            v222[0].__first_ = (std::__split_buffer<std::string>::pointer)v69;
            v222[0].__begin_ = v71;
            v222[0].__end_cap_.__value_ = (std::string *)(v69 + 24 * v70);
            long long v72 = *(_OWORD *)v176;
            v71->__r_.__value_.__r.__words[2] = v177;
            *(_OWORD *)&v71->__r_.__value_.__l.__data_ = v72;
            std::string::size_type v177 = 0;
            v176[1] = 0;
            v176[0] = 0;
            v222[0].__end_ = v71 + 1;
            std::vector<std::string>::__swap_out_circular_buffer(&v196, v222);
            v73 = v196.__end_;
            std::__split_buffer<std::string>::~__split_buffer(v222);
            v196.__end_ = v73;
            if (SHIBYTE(v177) < 0) {
              operator delete(v176[0]);
            }
          }
          else
          {
            long long v66 = *(_OWORD *)v176;
            v196.__end_->__r_.__value_.__r.__words[2] = v177;
            *(_OWORD *)&end->__r_.__value_.__l.__data_ = v66;
            v196.__end_ = end + 1;
          }
        }
        uint64_t v62 = [v139 countByEnumeratingWithState:&v192 objects:&__p count:16];
      }
      while (v62);
    }

    if (v118) {
      v74 = (char *)[v118 UTF8String];
    }
    else {
      v74 = "";
    }
    std::string::basic_string[abi:ne180100]<0>(v190, v74);
    v75 = [v125 sortingDetails];
    v76 = [v75 objectForKey:@"InsignificantSortPrefixes"];
    v188 = 0;
    v187 = 0;
    v189 = 0;
    long long v183 = 0u;
    long long v184 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    id v136 = v76;
    uint64_t v77 = [v136 countByEnumeratingWithState:&v183 objects:v222 count:16];
    v134 = v75;
    if (v77)
    {
      uint64_t v78 = *(void *)v184;
      do
      {
        for (uint64_t k = 0; k != v77; ++k)
        {
          if (*(void *)v184 != v78) {
            objc_enumerationMutation(v136);
          }
          std::string::basic_string[abi:ne180100]<0>(v181, (char *)[*(id *)(*((void *)&v183 + 1) + 8 * k) UTF8String]);
          mediaplatform::StringToUCharString();
          v80 = (void **)v188;
          if (v188 >= v189)
          {
            v82 = (void **)v187;
            unint64_t v83 = 0xAAAAAAAAAAAAAAABLL * ((v188 - (unsigned char *)v187) >> 3);
            unint64_t v84 = v83 + 1;
            if (v83 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556 * ((v189 - (unsigned char *)v187) >> 3) > v84) {
              unint64_t v84 = 0x5555555555555556 * ((v189 - (unsigned char *)v187) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v189 - (unsigned char *)v187) >> 3) >= 0x555555555555555) {
              unint64_t v85 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v85 = v84;
            }
            if (v85)
            {
              if (v85 > 0xAAAAAAAAAAAAAAALL) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              v86 = (char *)operator new(24 * v85);
            }
            else
            {
              v86 = 0;
            }
            v87 = &v86[24 * v83];
            *(_OWORD *)v87 = *(_OWORD *)v176;
            *((void *)v87 + 2) = v177;
            std::string::size_type v177 = 0;
            v176[0] = 0;
            v176[1] = 0;
            v88 = v87 + 24;
            if (v80 == v82)
            {
              v187 = v87;
              v188 = v87 + 24;
              v189 = &v86[24 * v85];
            }
            else
            {
              do
              {
                long long v89 = *(_OWORD *)(v80 - 3);
                *((void *)v87 - 1) = *(v80 - 1);
                *(_OWORD *)(v87 - 24) = v89;
                v87 -= 24;
                *(v80 - 2) = 0;
                *(v80 - 1) = 0;
                *(v80 - 3) = 0;
                v80 -= 3;
              }
              while (v80 != v82);
              v80 = (void **)v187;
              v90 = (void **)v188;
              v187 = v87;
              v188 = v88;
              v189 = &v86[24 * v85];
              while (v90 != v80)
              {
                if (*((char *)v90 - 1) < 0) {
                  operator delete(*(v90 - 3));
                }
                v90 -= 3;
              }
            }
            if (v80) {
              operator delete(v80);
            }
            v188 = v88;
            v75 = v134;
            if (SHIBYTE(v177) < 0) {
              operator delete(v176[0]);
            }
          }
          else
          {
            long long v81 = *(_OWORD *)v176;
            *((void *)v188 + 2) = v177;
            *(_OWORD *)v80 = v81;
            std::string::size_type v177 = 0;
            v176[1] = 0;
            v176[0] = 0;
            v188 = (char *)(v80 + 3);
          }
          if (v182 < 0) {
            operator delete(v181[0]);
          }
        }
        uint64_t v77 = [v136 countByEnumeratingWithState:&v183 objects:v222 count:16];
      }
      while (v77);
    }

    MEMORY[0x19971C470](v176, &v205, &v196, v210 + 6, v190);
    mlcore::LocalizedSortingDetails::LocalizedSortingDetails();
    id v91 = [v125 canonicalLanguageIdentifier];
    std::string::basic_string[abi:ne180100]<0>(v174, (char *)[v91 UTF8String]);

    MEMORY[0x19971C110](&v151, v176, v181, v174);
    if (v175 < 0) {
      operator delete(v174[0]);
    }
    v174[0] = v181;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);
    if (v180 < 0) {
      operator delete(v179);
    }
    v181[0] = &v178;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v181);
    v181[0] = v176;
    std::vector<mlcore::LocalizedSectionHeader>::__destroy_vector::operator()[abi:ne180100]((void ***)v181);
    v176[0] = &v187;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v176);

    if (v191 < 0) {
      operator delete(v190[0]);
    }
    v176[0] = &v196;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v176);
    v176[0] = &v205;
    std::vector<mlcore::LocalizedSectionHeader>::__destroy_vector::operator()[abi:ne180100]((void ***)v176);
    _Block_object_dispose(&v209, 8);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)&v214[8]);
    _Block_object_dispose(&v234, 8);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)&v238[8]);

    id v4 = objc_alloc_init(_MPMediaLibraryMLCoreStorage);
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v148, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
    }
    else {
      std::string v148 = __s;
    }
    mlcore::Library::createLibrary();
    v149 = (void **)p_begin;
    v150 = v231;
    if (v231) {
      atomic_fetch_add_explicit(&v231->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(_MPMediaLibraryMLCoreStorage *)v4 set_MediaLibrary_coreLibrary:&v149];
    if (v150) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v150);
    }
    if (v231) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v231);
    }
    if (SHIBYTE(v148.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v148.__r_.__value_.__l.__data_);
    }
    id v92 = [(MPMediaLibrary *)v127 uniqueIdentifier];
    if (v4)
    {
      id v92 = (id)[(_MPMediaLibraryMLCoreStorage *)v4 _MediaLibrary_coreLibrary];
    }
    else
    {
      uint64_t v146 = 0;
      v147 = 0;
    }
    uint64_t v93 = MEMORY[0x19971D490](v92);
    id v94 = +[MPMediaQuery songsQuery];
    v95 = v127;
    [v94 setMediaLibrary:v95];
    uint64_t v96 = [v94 _countOfItems];

    [(MPMediaLibrary *)v95 _updateDeviceLibrary:&v146 expectedEntityCountForEntityClass:v93 count:v96];
    v97 = v147;
    if (v147) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v147);
    }
    if (v4)
    {
      v97 = (std::__shared_weak_count *)[(_MPMediaLibraryMLCoreStorage *)v4 _MediaLibrary_coreLibrary];
    }
    else
    {
      uint64_t v144 = 0;
      v145 = 0;
    }
    uint64_t v98 = MEMORY[0x19971D500](v97);
    id v99 = +[MPMediaQuery albumsQuery];
    v100 = v95;
    [v99 setMediaLibrary:v100];
    uint64_t v101 = [v99 _countOfCollections];

    [(MPMediaLibrary *)v100 _updateDeviceLibrary:&v144 expectedEntityCountForEntityClass:v98 count:v101];
    v102 = v145;
    if (v145) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v145);
    }
    if (v4)
    {
      v102 = (std::__shared_weak_count *)[(_MPMediaLibraryMLCoreStorage *)v4 _MediaLibrary_coreLibrary];
    }
    else
    {
      uint64_t v142 = 0;
      v143 = 0;
    }
    uint64_t v103 = MEMORY[0x19971D560](v102);
    id v104 = +[MPMediaQuery albumArtistsQuery];
    v105 = v100;
    [v104 setMediaLibrary:v105];
    uint64_t v106 = [v104 _countOfCollections];

    [(MPMediaLibrary *)v105 _updateDeviceLibrary:&v142 expectedEntityCountForEntityClass:v103 count:v106];
    v107 = v143;
    if (v143) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v143);
    }
    if (v4)
    {
      v107 = (std::__shared_weak_count *)[(_MPMediaLibraryMLCoreStorage *)v4 _MediaLibrary_coreLibrary];
    }
    else
    {
      uint64_t v140 = 0;
      v141 = 0;
    }
    uint64_t v108 = MEMORY[0x19971D610](v107);
    id v109 = +[MPMediaQuery playlistsQuery];
    v110 = v105;
    [v109 setMediaLibrary:v110];
    uint64_t v111 = [v109 _countOfCollections];

    [(MPMediaLibrary *)v110 _updateDeviceLibrary:&v140 expectedEntityCountForEntityClass:v108 count:v111];
    if (v141) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v141);
    }
    [(MPMediaLibrary *)v110 _setMLCoreStorage:v4];
    if (v159 < 0) {
      operator delete(v158);
    }
    p_std::__split_buffer<std::string>::pointer begin = (std::__split_buffer<std::string>::pointer *)&v157;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    if (v156 < 0) {
      operator delete(v155);
    }
    p_std::__split_buffer<std::string>::pointer begin = (std::__split_buffer<std::string>::pointer *)&v154;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    p_std::__split_buffer<std::string>::pointer begin = &v151;
    std::vector<mlcore::LocalizedSectionHeader>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    p_std::__split_buffer<std::string>::pointer begin = (std::__split_buffer<std::string>::pointer *)&v164;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    v162[3] = MEMORY[0x1E4F76A80] + 16;
    p_std::__split_buffer<std::string>::pointer begin = (std::__split_buffer<std::string>::pointer *)&v163;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    v161[3] = MEMORY[0x1E4F76A80] + 16;
    p_std::__split_buffer<std::string>::pointer begin = (std::__split_buffer<std::string>::pointer *)v162;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    uint64_t v160 = MEMORY[0x1E4F76A80] + 16;
    p_std::__split_buffer<std::string>::pointer begin = (std::__split_buffer<std::string>::pointer *)v161;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_begin);
    if (v166 < 0) {
      operator delete(v165[0]);
    }

    if (v168 < 0) {
      operator delete(v167[0]);
    }

    if (v170 < 0) {
      operator delete(v169[0]);
    }

    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__s.__r_.__value_.__l.__data_);
    }
  }
  os_unfair_lock_unlock([(MPMediaLibrary *)v127 _MLCoreStorageLockPointer]);
  if (v4)
  {
    [(_MPMediaLibraryMLCoreStorage *)v4 _MediaLibrary_coreLibrary];
  }
  else
  {
    void *v126 = 0;
    v126[1] = 0;
  }

  result.__cntrl_ = v113;
  result.__ptr_ = v112;
  return result;
}

- (os_unfair_lock_s)_MLCoreStorageLockPointer
{
  return self->__MLCoreStorageLockPointer;
}

- (id)_MLCoreStorage
{
  return self->__MLCoreStorage;
}

- (unint64_t)_countOfItemsForQueryCriteria:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (self->_libraryDataProvider)
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__15308;
    uint64_t v23 = __Block_byref_object_dispose__15309;
    id v24 = 0;
    entityCacheQueue = self->_entityCacheQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__MPMediaLibrary__countOfItemsForQueryCriteria___block_invoke;
    block[3] = &unk_1E57F9F48;
    __int16 v18 = &v19;
    void block[4] = self;
    id v7 = v4;
    id v17 = v7;
    dispatch_sync(entityCacheQueue, block);
    id v8 = (void *)v20[5];
    if (v8)
    {
      unint64_t v9 = [v8 count];
    }
    else
    {
      countOfItemsForCriteriaCache = self->_countOfItemsForCriteriaCache;
      itemsForCriteriaCache = self->_itemsForCriteriaCache;
      countOfItemsDidLoadForCriteria = self->_countOfItemsDidLoadForCriteria;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __48__MPMediaLibrary__countOfItemsForQueryCriteria___block_invoke_3;
      v15[3] = &unk_1E57F0628;
      v15[4] = self;
      long long v13 = [(MPMediaLibrary *)self _getCachedValueForQueryCritiera:v7 valueCriteriaCache:countOfItemsForCriteriaCache entitiesForCriteriaCache:itemsForCriteriaCache didLoadBlocksByQueryCriteria:countOfItemsDidLoadForCriteria valueLoadedFromEntitiesArrayBlock:&__block_literal_global_358 loadValueFromDataProviderBlock:v15];
      unint64_t v9 = [v13 integerValue];
    }
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (void)_updateDeviceLibrary:(shared_ptr<mlcore:(void *)a4 :(unint64_t)a5 DeviceLibrary>)a3 expectedEntityCountForEntityClass:count:
{
  cntrl = a3.__cntrl_;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v8 = log2((double)(unint64_t)a4);
  unint64_t v9 = (unint64_t)exp2(ceil(v8));
  uint64_t v10 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(MPMediaLibrary *)self uniqueIdentifier];
    id v12 = NSString;
    (*(void (**)(void **__return_ptr, __shared_weak_count *))(*(void *)cntrl + 56))(__p, cntrl);
    if (v16 >= 0) {
      long long v13 = __p;
    }
    else {
      long long v13 = (void **)__p[0];
    }
    uint64_t v14 = [v12 stringWithUTF8String:v13];
    *(_DWORD *)buf = 138544130;
    __int16 v18 = v11;
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    __int16 v21 = 2048;
    id v22 = a4;
    __int16 v23 = 2048;
    unint64_t v24 = v9;
    _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "[MPMLC:%{public}@] _MediaLibrary_coreLibrary | setting expected count [init] entity=%@ count=%ld roundedCount=%ld", buf, 0x2Au);

    if (v16 < 0) {
      operator delete(__p[0]);
    }
  }
  mlcore::DeviceLibrary::setExpectedEntityQuerySize();
}

- (unint64_t)_countOfCollectionsForQueryCriteria:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (self->_libraryDataProvider)
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__15308;
    __int16 v23 = __Block_byref_object_dispose__15309;
    id v24 = 0;
    entityCacheQueue = self->_entityCacheQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__MPMediaLibrary__countOfCollectionsForQueryCriteria___block_invoke;
    block[3] = &unk_1E57F9F48;
    __int16 v18 = &v19;
    void block[4] = self;
    id v7 = v4;
    id v17 = v7;
    dispatch_sync(entityCacheQueue, block);
    double v8 = (void *)v20[5];
    if (v8)
    {
      unint64_t v9 = [v8 count];
    }
    else
    {
      countOfCollectionsForCriteriaCache = self->_countOfCollectionsForCriteriaCache;
      collectionsForCriteriaCache = self->_collectionsForCriteriaCache;
      countOfCollectionsDidLoadForCriteria = self->_countOfCollectionsDidLoadForCriteria;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __54__MPMediaLibrary__countOfCollectionsForQueryCriteria___block_invoke_3;
      v15[3] = &unk_1E57F0628;
      v15[4] = self;
      long long v13 = [(MPMediaLibrary *)self _getCachedValueForQueryCritiera:v7 valueCriteriaCache:countOfCollectionsForCriteriaCache entitiesForCriteriaCache:collectionsForCriteriaCache didLoadBlocksByQueryCriteria:countOfCollectionsDidLoadForCriteria valueLoadedFromEntitiesArrayBlock:&__block_literal_global_361 loadValueFromDataProviderBlock:v15];
      unint64_t v9 = [v13 integerValue];
    }
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)_hasItemsForQueryCriteria:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (self->_libraryDataProvider)
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__15308;
    __int16 v23 = __Block_byref_object_dispose__15309;
    id v24 = 0;
    entityCacheQueue = self->_entityCacheQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__MPMediaLibrary__hasItemsForQueryCriteria___block_invoke;
    block[3] = &unk_1E57F9F48;
    __int16 v18 = &v19;
    void block[4] = self;
    id v7 = v4;
    id v17 = v7;
    dispatch_sync(entityCacheQueue, block);
    double v8 = (void *)v20[5];
    if (v8)
    {
      char v9 = [v8 count] != 0;
    }
    else
    {
      itemsForCriteriaCache = self->_itemsForCriteriaCache;
      hasItemsForCriteriaCache = self->_hasItemsForCriteriaCache;
      hasItemsDidLoadForCriteria = self->_hasItemsDidLoadForCriteria;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __44__MPMediaLibrary__hasItemsForQueryCriteria___block_invoke_3;
      v15[3] = &unk_1E57F0628;
      v15[4] = self;
      long long v13 = [(MPMediaLibrary *)self _getCachedValueForQueryCritiera:v7 valueCriteriaCache:hasItemsForCriteriaCache entitiesForCriteriaCache:itemsForCriteriaCache didLoadBlocksByQueryCriteria:hasItemsDidLoadForCriteria valueLoadedFromEntitiesArrayBlock:&__block_literal_global_353 loadValueFromDataProviderBlock:v15];
      char v9 = [v13 BOOLValue];
    }
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)_getCachedValueForQueryCritiera:(id)a3 valueCriteriaCache:(id)a4 entitiesForCriteriaCache:(id)a5 didLoadBlocksByQueryCriteria:(id)a6 valueLoadedFromEntitiesArrayBlock:(id)a7 loadValueFromDataProviderBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__15308;
  v60 = __Block_byref_object_dispose__15309;
  id v61 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x3032000000;
  unint64_t v53 = __Block_byref_object_copy__15308;
  v54 = __Block_byref_object_dispose__15309;
  id v55 = 0;
  uint64_t v44 = 0;
  unint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__347;
  id v48 = __Block_byref_object_dispose__348;
  id v49 = 0;
  entityCacheQueue = self->_entityCacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke;
  block[3] = &unk_1E57F05B8;
  unint64_t v41 = &v56;
  id v21 = v15;
  id v34 = v21;
  id v22 = v14;
  id v35 = v22;
  id v23 = v16;
  id v36 = v23;
  id v24 = v18;
  id v39 = v24;
  id v25 = v17;
  id v37 = v25;
  unint64_t v42 = &v44;
  id v26 = v19;
  id v40 = v26;
  v38 = self;
  unint64_t v43 = &v50;
  dispatch_sync(entityCacheQueue, block);
  if (v45[5])
  {
    qos_class_t v27 = qos_class_self();
    dispatch_block_t v28 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v27, 0, (dispatch_block_t)v45[5]);
    id v29 = (void *)v45[5];
    v45[5] = (uint64_t)v28;

    dispatch_async((dispatch_queue_t)self->_fixedQueue, (dispatch_block_t)v45[5]);
  }
  id v30 = v51[5];
  if (v30) {
    dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v31 = (id)v57[5];

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);

  return v31;
}

- (ML3MusicLibrary)ml3Library
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider library];
  }
  else
  {
    uint64_t v3 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider library];

    uint64_t v3 = (void *)v4;
  }

  return (ML3MusicLibrary *)v3;
}

- (id)databasePath
{
  return (id)[(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider databasePath];
}

- (void)_setMLCoreStorage:(id)a3
{
}

- (void)endGeneratingLibraryChangeNotifications
{
  uint64_t v3 = +[MPMediaLibrary deviceMediaLibrary];

  if (v3 == self)
  {
    int64_t libraryChangeObservers = self->_libraryChangeObservers;
    BOOL v5 = libraryChangeObservers < 1;
    int64_t v6 = libraryChangeObservers - 1;
    if (!v5) {
      self->_int64_t libraryChangeObservers = v6;
    }
  }
}

void __54__MPMediaLibrary__countOfCollectionsForQueryCriteria___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)valueForDatabaseProperty:(id)a3
{
  return (id)[(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider valueForDatabaseProperty:a3];
}

- (BOOL)_hasCollectionsForQueryCriteria:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_libraryDataProvider)
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__15308;
    id v23 = __Block_byref_object_dispose__15309;
    id v24 = 0;
    entityCacheQueue = self->_entityCacheQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__MPMediaLibrary__hasCollectionsForQueryCriteria___block_invoke;
    block[3] = &unk_1E57F9F48;
    id v18 = &v19;
    void block[4] = self;
    id v7 = v4;
    id v17 = v7;
    dispatch_sync(entityCacheQueue, block);
    double v8 = (void *)v20[5];
    if (v8)
    {
      char v9 = [v8 count] != 0;
    }
    else
    {
      collectionsForCriteriaCache = self->_collectionsForCriteriaCache;
      hasCollectionsForCriteriaCache = self->_hasCollectionsForCriteriaCache;
      hasCollectionsDidLoadForCriteria = self->_hasCollectionsDidLoadForCriteria;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __50__MPMediaLibrary__hasCollectionsForQueryCriteria___block_invoke_3;
      v15[3] = &unk_1E57F0628;
      v15[4] = self;
      long long v13 = [(MPMediaLibrary *)self _getCachedValueForQueryCritiera:v7 valueCriteriaCache:hasCollectionsForCriteriaCache entitiesForCriteriaCache:collectionsForCriteriaCache didLoadBlocksByQueryCriteria:hasCollectionsDidLoadForCriteria valueLoadedFromEntitiesArrayBlock:&__block_literal_global_356 loadValueFromDataProviderBlock:v15];
      char v9 = [v13 BOOLValue];
    }
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

uint64_t __44__MPMediaLibrary_addLibraryFilterPredicate___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 144) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 144);
    if (!v3)
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      uint64_t v5 = *(void *)(a1 + 32);
      int64_t v6 = *(void **)(v5 + 144);
      *(void *)(v5 + 144) = v4;

      uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 144);
    }
    uint64_t v7 = *(void *)(a1 + 40);
    return [v3 addObject:v7];
  }
  return result;
}

uint64_t __40__MPMediaLibrary_setCloudFilteringType___block_invoke(uint64_t result)
{
  if (*(void *)(result + 40) != __cloudFilteringType)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    __cloudFilteringType = *(void *)(result + 40);
  }
  return result;
}

void __50__MPMediaLibrary__sharedCloudServiceStatusMonitor__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FB85E8]);
  v1 = (void *)_sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitor;
  _sharedCloudServiceStatusMonitor_sSharedCloudServiceStatusMonitor = (uint64_t)v0;
}

- (void)enumerateEntityChangesAfterSyncAnchor:(id)a3 maximumRevisionType:(int64_t)a4 inUsersLibrary:(BOOL)a5 usingBlock:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  libraryDataProvider = self->_libraryDataProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __135__MPMediaLibrary_MPMediaLibrarySyncAnchorSupport__enumerateEntityChangesAfterSyncAnchor_maximumRevisionType_inUsersLibrary_usingBlock___block_invoke;
  v15[3] = &unk_1E57F07B0;
  v15[4] = self;
  id v16 = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __135__MPMediaLibrary_MPMediaLibrarySyncAnchorSupport__enumerateEntityChangesAfterSyncAnchor_maximumRevisionType_inUsersLibrary_usingBlock___block_invoke_2;
  v13[3] = &unk_1E57F07D8;
  void v13[4] = self;
  id v14 = v16;
  id v12 = v16;
  [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider enumerateEntityChangesAfterSyncAnchor:a3 maximumRevisionType:a4 inUsersLibrary:v6 itemBlock:v15 collectionBlock:v13];
}

- (unint64_t)hash
{
  uint64_t v2 = [(MPMediaLibrary *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (void)logDatabaseAccess
{
  os_unfair_lock_lock((os_unfair_lock_t)&__privacyContextLock);
  if (__privacyContextOverride)
  {
    id v2 = (id)__privacyContextOverride;
  }
  else
  {
    id v2 = +[MPMediaLibraryPrivacyContext sharedContextForCurrentProcess];
  }
  id v3 = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)&__privacyContextLock);
  [v3 logPrivacyAccess];
}

void __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 88) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 48) objectForKey:*(void *)(a1 + 40)];
    if (v5)
    {
      BOOL v6 = (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      uint64_t v7 = [v6 copy];
      uint64_t v8 = *(void *)(*(void *)(a1 + 88) + 8);
      char v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      if (!v10)
      {
        uint64_t v11 = [objc_alloc(NSNumber) initWithInteger:0];
        uint64_t v12 = *(void *)(*(void *)(a1 + 88) + 8);
        long long v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      }
      [*(id *)(a1 + 32) setObject:v10 forKey:*(void *)(a1 + 40)];
    }
    else
    {
      id v14 = [*(id *)(a1 + 56) objectForKey:*(void *)(a1 + 40)];
      if (![v14 count])
      {
        if (!v14) {
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [*(id *)(a1 + 56) setObject:v14 forKey:*(void *)(a1 + 40)];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_2;
        v26[3] = &unk_1E57F8550;
        id v31 = *(id *)(a1 + 80);
        id v15 = *(id *)(a1 + 40);
        uint64_t v16 = *(void *)(a1 + 64);
        id v27 = v15;
        uint64_t v28 = v16;
        id v29 = *(id *)(a1 + 32);
        id v14 = v14;
        id v30 = v14;
        uint64_t v17 = [v26 copy];
        uint64_t v18 = *(void *)(*(void *)(a1 + 96) + 8);
        uint64_t v19 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = v17;
      }
      dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
      uint64_t v21 = *(void *)(*(void *)(a1 + 104) + 8);
      id v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __188__MPMediaLibrary__getCachedValueForQueryCritiera_valueCriteriaCache_entitiesForCriteriaCache_didLoadBlocksByQueryCriteria_valueLoadedFromEntitiesArrayBlock_loadValueFromDataProviderBlock___block_invoke_6;
      v25[3] = &unk_1E57F0590;
      uint64_t v23 = *(void *)(a1 + 104);
      void v25[4] = *(void *)(a1 + 88);
      v25[5] = v23;
      id v24 = (void *)[v25 copy];
      [v14 addObject:v24];
    }
  }
}

+ (id)sharedMediaLibraries
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 mediaLibraries];
  uint64_t v3 = [v2 allObjects];
  uint64_t v4 = (void *)[v3 mutableCopy];

  [v4 sortUsingComparator:&__block_literal_global_382];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = objc_msgSend(v4, "copy", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 isDeviceLibrary]) {
          [v4 removeObjectIdenticalTo:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (int64_t)status
{
  if ([(MPMediaLibrary *)self isDeviceLibrary]) {
    return 2;
  }
  float connectionProgress = self->_connectionProgress;
  if (connectionProgress < 0.0) {
    return 0;
  }
  if (connectionProgress < 1.0) {
    return 1;
  }
  return 2;
}

void __52__MPMediaLibrary_connectionAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 160))
  {
    uint64_t v2 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 160);
    *(void *)(v3 + 160) = v2;
  }
  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(a1 + 40);
    int v13 = 134218242;
    uint64_t v14 = v6;
    __int16 v15 = 2114;
    uint64_t v16 = v7;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "%p Taking connection assertion: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  [*(id *)(*(void *)(a1 + 32) + 160) addPointer:*(void *)(a1 + 40)];
  if ([*(id *)(*(void *)(a1 + 32) + 160) count] == 1
    && ([*(id *)(a1 + 32) isDeviceLibrary] & 1) == 0)
  {
    uint64_t v8 = SBSSpringBoardServerPort();
    MEMORY[0x19971B990](v8, *(void *)(a1 + 32) + 231, *(void *)(a1 + 32) + 232);
    uint64_t v9 = SBSSpringBoardServerPort();
    MEMORY[0x19971B9C0](v9, 1, 1);
  }
  uint64_t v10 = os_log_create("com.apple.amp.mediaplayer", "Library_Oversize");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    long long v12 = [*(id *)(v11 + 160) allObjects];
    int v13 = 134218242;
    uint64_t v14 = v11;
    __int16 v15 = 2114;
    uint64_t v16 = v12;
    _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "%p Active assertions: %{public}@", (uint8_t *)&v13, 0x16u);
  }
}

- (BOOL)isDeviceLibrary
{
  uint64_t v3 = +[MPMediaLibrary deviceMediaLibrary];
  BOOL v4 = [(MPMediaLibrary *)self isEqual:v3];

  if (v4) {
    return 1;
  }
  uint64_t v6 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  int v7 = [v6 supportsMultipleITunesAccounts];

  if (!v7) {
    return 0;
  }
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__MPMediaLibrary_isDeviceLibrary__block_invoke;
  v9[3] = &unk_1E57F9F20;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync((dispatch_queue_t)__defaultMediaLibraryQueue, v9);
  BOOL v5 = *((unsigned char *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = [(MPMediaLibrary *)self uniqueIdentifier];
    uint64_t v6 = [v4 uniqueIdentifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)mediaLibraries
{
  uint64_t v2 = [a1 _mediaLibraries];
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

- (MPMediaLibrary)initWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MPMediaLibrary.m" lineNumber:530 description:@"only keyed coding is supported"];
  }
  uint64_t v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"MPLibraryDataProviderUID"];
  char v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"MPUserDSID"];

  uint64_t v8 = [(id)objc_opt_class() _mediaLibraryWithUniqueIdentifier:v6 userDSID:v7];

  return v8;
}

- (void)dealloc
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  [(MPMediaLibrary *)self _tearDownNotifications];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_countOfItemsForCriteriaCache)
  {
    objc_msgSend(v3, "addObject:");
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    [v4 addObject:v5];
  }
  if (self->_countOfCollectionsForCriteriaCache)
  {
    objc_msgSend(v4, "addObject:");
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
    [v4 addObject:v6];
  }
  if (self->_itemsForCriteriaCache)
  {
    objc_msgSend(v4, "addObject:");
  }
  else
  {
    char v7 = [MEMORY[0x1E4F1CA98] null];
    [v4 addObject:v7];
  }
  if (self->_itemResultSetsForCriteriaCache)
  {
    objc_msgSend(v4, "addObject:");
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
    [v4 addObject:v8];
  }
  if (self->_collectionsForCriteriaCache)
  {
    objc_msgSend(v4, "addObject:");
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
    [v4 addObject:v9];
  }
  if (self->_collectionsResultSetsForCriteriaCache)
  {
    objc_msgSend(v4, "addObject:");
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
    [v4 addObject:v10];
  }
  if (self->_hasItemsForCriteriaCache)
  {
    objc_msgSend(v4, "addObject:");
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
    [v4 addObject:v11];
  }
  if (self->_hasCollectionsForCriteriaCache)
  {
    objc_msgSend(v4, "addObject:");
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
    [v4 addObject:v12];
  }
  countOfItemsForCriteriaCache = self->_countOfItemsForCriteriaCache;
  self->_countOfItemsForCriteriaCache = 0;

  countOfCollectionsForCriteriaCache = self->_countOfCollectionsForCriteriaCache;
  self->_countOfCollectionsForCriteriaCache = 0;

  itemsForCriteriaCache = self->_itemsForCriteriaCache;
  self->_itemsForCriteriaCache = 0;

  itemResultSetsForCriteriaCache = self->_itemResultSetsForCriteriaCache;
  self->_itemResultSetsForCriteriaCache = 0;

  collectionsForCriteriaCache = self->_collectionsForCriteriaCache;
  self->_collectionsForCriteriaCache = 0;

  collectionsResultSetsForCriteriaCache = self->_collectionsResultSetsForCriteriaCache;
  self->_collectionsResultSetsForCriteriaCache = 0;

  hasItemsForCriteriaCache = self->_hasItemsForCriteriaCache;
  self->_hasItemsForCriteriaCache = 0;

  hasCollectionsForCriteriaCache = self->_hasCollectionsForCriteriaCache;
  self->_hasCollectionsForCriteriaCache = 0;

  uint64_t v21 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__MPMediaLibrary_dealloc__block_invoke;
  block[3] = &unk_1E57F9EA8;
  id v25 = v4;
  id v22 = v4;
  dispatch_async(v21, block);

  v23.receiver = self;
  v23.super_class = (Class)MPMediaLibrary;
  [(MPMediaLibrary *)&v23 dealloc];
}

- (void)_tearDownNotifications
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_notificationObservers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_msgSend(v3, "removeObserver:", *(void *)(*((void *)&v10 + 1) + 8 * v8++), (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  notificationObservers = self->_notificationObservers;
  self->_notificationObservers = 0;
}

+ (id)_mediaLibraryWithUniqueIdentifier:(id)a3 userDSID:(id)a4
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = a4;
  id v90 = v5;
  if ([v5 length] || -[NSObject length](v6, "length"))
  {
    uint64_t v7 = ICCreateLoggableValueForDSIDString();
    uint64_t v8 = [(id)objc_opt_class() _mediaLibraries];
    uint64_t v9 = (void *)[v8 copy];

    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v106 objects:v119 count:16];
    long long v12 = v5;
    obuint64_t j = v10;
    if (v11)
    {
      uint64_t v13 = v11;
      uint64_t v14 = *(void *)v107;
LABEL_5:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v107 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v106 + 1) + 8 * v15);
        id v17 = [v16 uniqueIdentifier];
        if (v17 == v90) {
          break;
        }
        uint64_t v18 = v17;
        int v19 = [v17 isEqual:v90];

        if (v19) {
          goto LABEL_45;
        }
        dispatch_semaphore_t v20 = [v16 userIdentity];
        uint64_t v21 = [v20 accountDSID];
        if (v21 == v6)
        {

LABEL_52:
          unint64_t v69 = os_log_create("com.apple.amp.mediaplayer", "Library");
          if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v114 = v16;
            _os_log_impl(&dword_1952E8000, v69, OS_LOG_TYPE_INFO, "[LIB] _mediaLibraryWithUniqueIdentifier:userDSID | found in-memory library [DSID match] library=%{public}@", buf, 0xCu);
          }

          uint64_t v16 = v16;
          uint64_t v62 = obj;
LABEL_60:
          long long v72 = v62;
          goto LABEL_86;
        }
        id v22 = v21;
        char v23 = [v21 isEqual:v6];

        if (v23) {
          goto LABEL_52;
        }
        if (v13 == ++v15)
        {
          long long v10 = obj;
          uint64_t v13 = [obj countByEnumeratingWithState:&v106 objects:v119 count:16];
          if (v13) {
            goto LABEL_5;
          }
          goto LABEL_14;
        }
      }

LABEL_45:
      v60 = [v16 userIdentity];
      id v61 = [v60 accountDSID];

      uint64_t v62 = obj;
      if (v6)
      {
        uint64_t v63 = v61;
        if (v63 == v6)
        {
        }
        else
        {
          v64 = v63;
          char v65 = [v63 isEqual:v6];

          if ((v65 & 1) == 0)
          {
            long long v66 = ICCreateLoggableValueForDSIDString();
            unint64_t v67 = os_log_create("com.apple.amp.mediaplayer", "Library");
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v114 = v7;
              __int16 v115 = 2114;
              v116 = v66;
              __int16 v117 = 2114;
              id v118 = v16;
              _os_log_impl(&dword_1952E8000, v67, OS_LOG_TYPE_DEFAULT, "[LIB] _mediaLibraryWithUniqueIdentifier:userDSID | found in-memory library [databaseID match, DSID mismatch] dsid=%{public}@ libraryDSID=%{public}@ library=%{public}@", buf, 0x20u);
            }

            unint64_t v68 = v16;
LABEL_59:

            goto LABEL_60;
          }
        }
      }
      uint64_t v70 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v114 = v16;
        _os_log_impl(&dword_1952E8000, v70, OS_LOG_TYPE_INFO, "[LIB] _mediaLibraryWithUniqueIdentifier:userDSID | found in-memory library [databaseID match] library=%{public}@", buf, 0xCu);
      }

      v71 = v16;
      goto LABEL_59;
    }
LABEL_14:
    v88 = v7;

    +[MPMediaLibraryDataProviderML3 onDiskProviders];
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v89 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = [v89 countByEnumeratingWithState:&v102 objects:v112 count:16];
    id v91 = v6;
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v103;
LABEL_16:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v103 != v26) {
          objc_enumerationMutation(v89);
        }
        uint64_t v28 = *(void **)(*((void *)&v102 + 1) + 8 * v27);
        id v29 = [v28 accountDSID];
        id v30 = [v28 uniqueIdentifier];
        if (v30 == v90) {
          break;
        }
        id v31 = v30;
        int v32 = [v30 isEqual:v90];

        if (v32) {
          goto LABEL_64;
        }
        v33 = v29;
        if (v33 == v91)
        {

          os_log_t v34 = v91;
LABEL_74:
          uint64_t v16 = [[MPMediaLibrary alloc] _initWithLibraryDataProvider:v28];
          v82 = (void *)MEMORY[0x1E4FB87B8];
          unint64_t v83 = objc_msgSend(NSNumber, "numberWithLongLong:", -[NSObject longLongValue](v91, "longLongValue"));
          v75 = [v82 specificAccountWithDSID:v83];

          uint64_t v84 = [v75 copy];
          unint64_t v85 = (void *)v16[31];
          v16[31] = v84;

          uint64_t v62 = obj;
          long long v72 = v89;
          if ([v28 conformsToProtocol:&unk_1EE6F1530]) {
            [v28 setUserIdentity:v75];
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v28 setMediaLibrary:v16];
          }
          v80 = os_log_create("com.apple.amp.mediaplayer", "Library");
          uint64_t v6 = v91;
          if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v114 = v16;
            v86 = "[LIB] _mediaLibraryWithUniqueIdentifier:userDSID | found on-disk library [DSID match] library=%{public}@";
            goto LABEL_83;
          }
          goto LABEL_84;
        }
        os_log_t v34 = v33;
        int v35 = [v33 isEqual:v91];

        if (v35) {
          goto LABEL_74;
        }

        if (v25 == ++v27)
        {
          uint64_t v25 = [v89 countByEnumeratingWithState:&v102 objects:v112 count:16];
          long long v10 = obj;
          if (v25) {
            goto LABEL_16;
          }
          goto LABEL_25;
        }
      }

LABEL_64:
      uint64_t v16 = [[MPMediaLibrary alloc] _initWithLibraryDataProvider:v28];
      v73 = (void *)MEMORY[0x1E4FB87B8];
      v74 = objc_msgSend(NSNumber, "numberWithLongLong:", -[NSObject longLongValue](v91, "longLongValue"));
      v75 = [v73 specificAccountWithDSID:v74];

      uint64_t v76 = [v75 copy];
      uint64_t v77 = (void *)v16[31];
      v16[31] = v76;

      uint64_t v62 = obj;
      long long v72 = v89;
      if ([v28 conformsToProtocol:&unk_1EE6F1530]) {
        [v28 setUserIdentity:v75];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v28 setMediaLibrary:v16];
      }
      uint64_t v78 = v29;
      os_log_t v34 = v78;
      uint64_t v6 = v91;
      if (v78 == v91)
      {
      }
      else
      {
        char v79 = [v78 isEqual:v91];

        if ((v79 & 1) == 0)
        {
          v80 = ICCreateLoggableValueForDSIDString();
          long long v81 = os_log_create("com.apple.amp.mediaplayer", "Library");
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v114 = v7;
            __int16 v115 = 2114;
            v116 = v80;
            __int16 v117 = 2114;
            id v118 = v16;
            _os_log_impl(&dword_1952E8000, v81, OS_LOG_TYPE_DEFAULT, "[LIB] _mediaLibraryWithUniqueIdentifier:userDSID | found on-disk library [databaseID match, DSID mismatch] dsid=%{public}@ libraryDSID=%{public}@ library=%{public}@", buf, 0x20u);
          }

          uint64_t v6 = v91;
          goto LABEL_84;
        }
      }
      v80 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v114 = v16;
        v86 = "[LIB] _mediaLibraryWithUniqueIdentifier:userDSID | found on-disk library [databaseID match] library=%{public}@";
LABEL_83:
        _os_log_impl(&dword_1952E8000, v80, OS_LOG_TYPE_INFO, v86, buf, 0xCu);
      }
LABEL_84:

      id v36 = v72;
      goto LABEL_85;
    }
LABEL_25:

    id v36 = [MEMORY[0x1E4F1CA48] array];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    uint64_t v93 = v10;
    uint64_t v37 = [v93 countByEnumeratingWithState:&v98 objects:v111 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v99;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v99 != v39) {
            objc_enumerationMutation(v93);
          }
          unint64_t v41 = *(void **)(*((void *)&v98 + 1) + 8 * i);
          unint64_t v42 = [v41 userIdentity];
          unint64_t v43 = [v42 accountDSID];
          uint64_t v44 = ICCreateLoggableValueForDSIDString();

          unint64_t v45 = NSString;
          uint64_t v46 = [v41 uniqueIdentifier];
          v47 = [v45 stringWithFormat:@"<MPMediaLibrary [memory] uid=%@ dsid=%@>", v46, v44];

          [v36 addObject:v47];
        }
        uint64_t v38 = [v93 countByEnumeratingWithState:&v98 objects:v111 count:16];
      }
      while (v38);
    }

    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v48 = v89;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v94 objects:v110 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v95;
      do
      {
        for (uint64_t j = 0; j != v50; ++j)
        {
          if (*(void *)v95 != v51) {
            objc_enumerationMutation(v48);
          }
          unint64_t v53 = *(void **)(*((void *)&v94 + 1) + 8 * j);
          v54 = [v53 accountDSID];
          id v55 = ICCreateLoggableValueForDSIDString();

          uint64_t v56 = NSString;
          uint64_t v57 = [v53 uniqueIdentifier];
          uint64_t v58 = [v56 stringWithFormat:@"<MPMediaLibrary [disk] uid=%@ dsid=%@>", v57, v55];

          [v36 addObject:v58];
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v94 objects:v110 count:16];
      }
      while (v50);
    }

    os_log_t v34 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v7 = v88;
      v114 = v88;
      __int16 v115 = 2114;
      v116 = v36;
      _os_log_impl(&dword_1952E8000, v34, OS_LOG_TYPE_ERROR, "[LIB] _mediaLibraryWithUniqueIdentifier:userDSID | returning nil [failed to find match] dsid=%{public}@ considerations=%{public}@", buf, 0x16u);
      uint64_t v16 = 0;
      long long v12 = v90;
      uint64_t v6 = v91;
    }
    else
    {
      uint64_t v16 = 0;
      long long v12 = v90;
      uint64_t v6 = v91;
      uint64_t v7 = v88;
    }
    uint64_t v62 = obj;
    long long v72 = v89;
LABEL_85:

LABEL_86:
  }
  else
  {
    v59 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v59, OS_LOG_TYPE_INFO, "[LIB] _mediaLibraryWithUniqueIdentifier:userDSID | returning defaultMediaLibrary [UID/DSID both nil]", buf, 2u);
    }

    uint64_t v16 = +[MPMediaLibrary defaultMediaLibrary];
    long long v12 = v5;
  }

  return v16;
}

+ (id)_mediaLibraries
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MPMediaLibrary__mediaLibraries__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (_mediaLibraries_onceToken != -1) {
    dispatch_once(&_mediaLibraries_onceToken, block);
  }
  uint64_t v2 = (void *)_mediaLibraries____mediaLibraries;

  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  if (([v11 allowsKeyedCoding] & 1) == 0)
  {
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MPMediaLibrary.m" lineNumber:520 description:@"only keyed coding is supported"];
  }
  id v5 = [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider uniqueIdentifier];
  [v11 encodeObject:v5 forKey:@"MPLibraryDataProviderUID"];

  uint64_t v6 = [(MPMediaLibrary *)self userIdentity];
  uint64_t v7 = [v6 accountDSID];

  if (v7)
  {
    uint64_t v8 = [(MPMediaLibrary *)self userIdentity];
    uint64_t v9 = [v8 accountDSID];
    [v11 encodeObject:v9 forKey:@"MPUserDSID"];
  }
}

void __28__MPMediaLibrary_initialize__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("default_media_library", 0);
  v1 = (void *)__defaultMediaLibraryQueue;
  __defaultMediaLibraryQueue = (uint64_t)v0;

  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.MPMediaLibrary.global.serial.queue", v2);
  id v4 = (void *)__serialAccessQueue;
  __serialAccessQueue = (uint64_t)v3;

  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = (void *)__userMediaLibraries;
  __userMediaLibraries = v5;
}

void __33__MPMediaLibrary__mediaLibraries__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = [*(id *)(a1 + 32) deviceMediaLibrary];
  uint64_t v2 = [v1 setWithObject:v4];
  dispatch_queue_t v3 = (void *)_mediaLibraries____mediaLibraries;
  _mediaLibraries____mediaLibraries = v2;
}

void __50__MPMediaLibrary__hasCollectionsForQueryCriteria___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)currentEntityRevision
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0xFFFFFFFFLL;
  }
  libraryDataProvider = self->_libraryDataProvider;

  return [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider currentEntityRevision];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeUserChangeMonitor, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong(&self->__MLCoreStorage, 0);
  objc_storeStrong((id *)&self->_connectionAssertionsQueue, 0);
  objc_storeStrong((id *)&self->_connectionAssertions, 0);
  objc_storeStrong((id *)&self->_additionalLibraryFilterPredicatesAccessQueue, 0);
  objc_storeStrong((id *)&self->_additionalLibraryFilterPredicates, 0);
  objc_storeStrong((id *)&self->_countOfItemsDidLoadForCriteria, 0);
  objc_storeStrong((id *)&self->_countOfCollectionsDidLoadForCriteria, 0);
  objc_storeStrong((id *)&self->_hasCollectionsDidLoadForCriteria, 0);
  objc_storeStrong((id *)&self->_hasItemsDidLoadForCriteria, 0);
  objc_storeStrong((id *)&self->_collectionsResultSetsForCriteriaCache, 0);
  objc_storeStrong((id *)&self->_countOfCollectionsForCriteriaCache, 0);
  objc_storeStrong((id *)&self->_hasCollectionsForCriteriaCache, 0);
  objc_storeStrong((id *)&self->_collectionsForCriteriaCache, 0);
  objc_storeStrong((id *)&self->_itemResultSetsForCriteriaCache, 0);
  objc_storeStrong((id *)&self->_countOfItemsForCriteriaCache, 0);
  objc_storeStrong((id *)&self->_hasItemsForCriteriaCache, 0);
  objc_storeStrong((id *)&self->_itemsForCriteriaCache, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);
  objc_storeStrong((id *)&self->_fixedQueue, 0);
  objc_storeStrong((id *)&self->_entityCacheQueue, 0);
  objc_storeStrong((id *)&self->_libraryDataProvider, 0);

  objc_storeStrong((id *)&self->_privacyContext, 0);
}

intptr_t __61__MPMediaLibrary_MediaLibraryCore___MediaLibrary_coreLibrary__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setActiveUserChangeMonitor:(id)a3
{
}

- (_MPActiveUserChangeMonitor)activeUserChangeMonitor
{
  return self->_activeUserChangeMonitor;
}

- (os_unfair_lock_s)_MLCoreStorageLock
{
  return self->__MLCoreStorageLock;
}

- (void)addNonLibraryOwnedPlaylistsWithGlobalIDs:(id)a3 completion:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__MPMediaLibrary_addNonLibraryOwnedPlaylistsWithGlobalIDs_completion___block_invoke;
    v13[3] = &unk_1E57F0788;
    objc_copyWeak(&v16, &location);
    id v8 = v6;
    id v14 = v8;
    id v15 = v7;
    uint64_t v9 = (void *)MEMORY[0x19971E0F0](v13);
    [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider addNonLibraryOwnedPlaylistsWithGlobalIDs:v8 completion:v9];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    long long v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28228];
    v19[0] = @"unimplemented";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    long long v12 = [v10 errorWithDomain:@"MPMediaLibraryErrorDomain" code:-1 userInfo:v11];

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

void __70__MPMediaLibrary_addNonLibraryOwnedPlaylistsWithGlobalIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
  uint64_t v9 = v8;
  if (v6)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    int v17 = 138543362;
    uint64_t v18 = v10;
    id v11 = "Imported %{public}@ playlists";
    long long v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    uint32_t v14 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v15 = *(void *)(a1 + 32);
    int v17 = 138543618;
    uint64_t v18 = v15;
    __int16 v19 = 2114;
    uint64_t v20 = 0;
    id v11 = "Failed to import %{public}@ playlists with error: %{public}@";
    long long v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    uint32_t v14 = 22;
  }
  _os_log_impl(&dword_1952E8000, v12, v13, v11, (uint8_t *)&v17, v14);
LABEL_7:

  [WeakRetained _clearCachedEntitiesIncludingResultSets:1];
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, id, id))(v16 + 16))(v16, v5, v6);
  }
}

- (void)addNonLibraryOwnedPlaylistWithGlobalID:(id)a3 completion:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    int v17 = __68__MPMediaLibrary_addNonLibraryOwnedPlaylistWithGlobalID_completion___block_invoke;
    uint64_t v18 = &unk_1E57F0788;
    objc_copyWeak(&v21, &location);
    id v20 = v7;
    id v8 = v6;
    id v19 = v8;
    uint64_t v9 = (void *)MEMORY[0x19971E0F0](&v15);
    libraryDataProvider = self->_libraryDataProvider;
    v25[0] = v8;
    id v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v25, 1, v15, v16, v17, v18);
    [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider addNonLibraryOwnedPlaylistsWithGlobalIDs:v11 completion:v9];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    long long v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    uint64_t v24 = @"unimplemented";
    os_log_type_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint32_t v14 = [v12 errorWithDomain:@"MPMediaLibraryErrorDomain" code:-1 userInfo:v13];

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);
  }
}

void __68__MPMediaLibrary_addNonLibraryOwnedPlaylistWithGlobalID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _clearCachedEntitiesIncludingResultSets:1];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    if (v5)
    {
      id v8 = 0;
    }
    else
    {
      uint64_t v9 = [v11 objectForKey:*(void *)(a1 + 32)];
      uint64_t v10 = [v9 longLongValue];

      id v8 = [WeakRetained playlistWithPersistentID:v10];
      uint64_t v7 = *(void *)(a1 + 40);
    }
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)addToLocalDeviceLibraryGlobalPlaylistWithID:(id)a3 completion:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    libraryDataProvider = self->_libraryDataProvider;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __73__MPMediaLibrary_addToLocalDeviceLibraryGlobalPlaylistWithID_completion___block_invoke;
    v12[3] = &unk_1E57F0760;
    objc_copyWeak(&v14, &location);
    id v13 = v7;
    [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider addToLocalDeviceLibraryGlobalPlaylistWithID:v6 completion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"unimplemented";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v11 = [v9 errorWithDomain:@"MPMediaLibraryErrorDomain" code:-1 userInfo:v10];

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __73__MPMediaLibrary_addToLocalDeviceLibraryGlobalPlaylistWithID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _clearCachedEntitiesIncludingResultSets:1];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)addGlobalPlaylistWithID:(id)a3 andAddToCloudLibrary:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    libraryDataProvider = self->_libraryDataProvider;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__MPMediaLibrary_addGlobalPlaylistWithID_andAddToCloudLibrary_completion___block_invoke;
    v14[3] = &unk_1E57F8430;
    objc_copyWeak(&v16, &location);
    id v15 = v9;
    [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider addGlobalPlaylistWithID:v8 andAddToCloudLibrary:v6 completion:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"unimplemented";
    long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v13 = [v11 errorWithDomain:@"MPMediaLibraryErrorDomain" code:-1 userInfo:v12];

    (*((void (**)(id, void *))v9 + 2))(v9, v13);
  }
}

void __74__MPMediaLibrary_addGlobalPlaylistWithID_andAddToCloudLibrary_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _clearCachedEntitiesIncludingResultSets:1];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)removeArtworkForEntityPersistentID:(unint64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6
{
  if (objc_opt_respondsToSelector())
  {
    libraryDataProvider = self->_libraryDataProvider;
    [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider removeArtworkForEntityPersistentID:a3 entityType:a4 artworkType:a5 sourceType:a6];
  }
}

- (BOOL)importOriginalArtworkFromImageData:(id)a3 withArtworkToken:(id)a4 artworkType:(int64_t)a5 sourceType:(int64_t)a6 mediaType:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  if (objc_opt_respondsToSelector()) {
    char v14 = [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider importOriginalArtworkFromImageData:v12 withArtworkToken:v13 artworkType:a5 sourceType:a6 mediaType:a7];
  }
  else {
    char v14 = 0;
  }

  return v14;
}

- (void)importArtworkTokenForEntityPersistentID:(unint64_t)a3 entityType:(int64_t)a4 artworkToken:(id)a5 artworkType:(int64_t)a6 sourceType:(int64_t)a7
{
  id v12 = a5;
  if (objc_opt_respondsToSelector()) {
    [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider importArtworkTokenForEntityPersistentID:a3 entityType:a4 artworkToken:v12 artworkType:a6 sourceType:a7];
  }
}

- (void)addTracksToMyLibrary:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider addTracksToMyLibrary:v4];
  }
}

- (void)addPlaylistStoreItemsWithMetadata:(id)a3 completion:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  os_log_t v34 = v6;
  if ([v6 count])
  {
    v33 = v7;
    if (objc_opt_respondsToSelector())
    {
      val = self;
      uint64_t v8 = [v6 count];
      uint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
      int v35 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v54 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v45;
        uint64_t v36 = *MEMORY[0x1E4F1C3C8];
        uint64_t v13 = *MEMORY[0x1E4F28568];
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v45 != v12) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            id v16 = [v15 storeID];
            if (v16)
            {
              uint64_t v17 = [v9 indexOfObject:v16];
              if (v17 == 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v18 = [v15 effectiveStorePlatformDictionary];
                id v19 = (void *)[objc_alloc(MEMORY[0x1E4FB8748]) initWithMetadataDictionary:v18];
                if (v19)
                {
                  [v9 addObject:v16];
                  [v35 addObject:v19];
                  uint64_t v20 = [v9 count];

                  uint64_t v17 = v20 - 1;
                }
                else
                {
                  uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v50 = v13;
                  uint64_t v51 = @"One or more store item metadata instances failed to be converted into SSLookupItems.";
                  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
                  uint64_t v23 = [v24 errorWithDomain:v36 code:-1 userInfo:v25];

                  if (v23)
                  {

LABEL_28:
                    if (v33) {
                      v33[2]();
                    }
                    goto LABEL_30;
                  }
                  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
                }
              }
              uint64_t v26 = [NSNumber numberWithUnsignedInteger:v17];
              [v37 addObject:v26];
            }
            else
            {
              id v21 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v52 = v13;
              unint64_t v53 = @"One or more store item metadata instances didn't have a valid storeID.";
              id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
              uint64_t v23 = [v21 errorWithDomain:v36 code:-1 userInfo:v22];

              if (v23) {
                goto LABEL_28;
              }
            }
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v54 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      objc_initWeak(&location, val);
      libraryDataProvider = val->_libraryDataProvider;
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __63__MPMediaLibrary_addPlaylistStoreItemsWithMetadata_completion___block_invoke;
      v38[3] = &unk_1E57F0738;
      unint64_t v41 = v33;
      objc_copyWeak(&v42, &location);
      id v39 = v37;
      id v40 = v35;
      [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider addPlaylistStoreItemsForLookupItems:v40 withCompletion:v38];

      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
      uint64_t v23 = 0;
LABEL_30:

      goto LABEL_31;
    }
    if (v7)
    {
      id v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v48 = *MEMORY[0x1E4F28568];
      uint64_t v49 = @"unimplemented";
      id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      id v31 = [v29 errorWithDomain:@"MPMediaLibraryErrorDomain" code:-1 userInfo:v30];

      ((void (*)(void (**)(void), void, void *))v33[2])(v33, 0, v31);
LABEL_31:
      uint64_t v7 = v33;
    }
  }
  else if (v7)
  {
    if (v6) {
      uint64_t v28 = MEMORY[0x1E4F1CBF0];
    }
    else {
      uint64_t v28 = 0;
    }
    ((void (*)(void (**)(void), uint64_t, void))v7[2])(v7, v28, 0);
  }
}

void __63__MPMediaLibrary_addPlaylistStoreItemsWithMetadata_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    if (v6)
    {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
    }
    else
    {
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      id v10 = WeakRetained;
      if (WeakRetained)
      {
        id v11 = WeakRetained;
      }
      else
      {
        id v11 = +[MPMediaLibrary deviceMediaLibrary];
      }
      uint64_t v12 = v11;

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v13 = v5;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v38;
LABEL_9:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend(v12, "itemWithPersistentID:verifyExistence:", objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v17), "unsignedLongLongValue"), 0);
          if (!v18) {
            break;
          }
          id v19 = (void *)v18;
          [v8 addObject:v18];

          if (v15 == ++v17)
          {
            uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v44 count:16];
            if (v15) {
              goto LABEL_9;
            }
            goto LABEL_15;
          }
        }

        uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = *MEMORY[0x1E4F1C3C8];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        unint64_t v43 = @"One or more persistentID failed to be converted into MPMediaItem.";
        id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        uint64_t v23 = [v20 errorWithDomain:v21 code:-1 userInfo:v22];

        uint64_t v8 = 0;
        id v24 = 0;
        if (v23) {
          goto LABEL_29;
        }
      }
      else
      {
LABEL_15:
      }
      unint64_t v25 = [*(id *)(a1 + 32) count];
      if (v25 <= [*(id *)(a1 + 40) count])
      {
        uint64_t v23 = 0;
        id v24 = v8;
      }
      else
      {
        id v32 = v5;
        id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v26 = *(id *)(a1 + 32);
        uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v34 != v29) {
                objc_enumerationMutation(v26);
              }
              id v31 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "unsignedIntegerValue"));
              if (v31) {
                [v24 addObject:v31];
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v28);
        }

        uint64_t v23 = 0;
        id v5 = v32;
      }
LABEL_29:
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void)getPlaylistWithUUID:(NSUUID *)uuid creationMetadata:(MPMediaPlaylistCreationMetadata *)creationMetadata completionHandler:(void *)completionHandler
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = uuid;
  id v9 = creationMetadata;
  id v10 = completionHandler;
  id v11 = [(NSUUID *)v8 UUIDString];
  if ([v11 length])
  {
    uint64_t v12 = +[MPMediaPropertyPredicate predicateWithValue:v11 forProperty:@"externalVendorContainerTag"];
    id v13 = +[MPMediaQuery playlistsQuery];
    [v13 setMediaLibrary:self];
    [v13 addFilterPredicate:v12];
    uint64_t v14 = [v13 collections];
    uint64_t v15 = [v14 firstObject];
    if (v15)
    {
      if (v10) {
        v10[2](v10, v15, 0);
      }
      goto LABEL_46;
    }
    id v22 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
    uint64_t v23 = v22;
    if (v9)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_1952E8000, v23, OS_LOG_TYPE_DEFAULT, "Creating playlist for %{public}@", (uint8_t *)&buf, 0xCu);
      }

      if (+[MPMediaLibrary authorizationStatus] == MPMediaLibraryAuthorizationStatusAuthorized)
      {
        long long v46 = [(MPMediaLibrary *)self libraryDataProvider];
        if (objc_opt_respondsToSelector())
        {
          id v47 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          uint64_t v45 = [(MPMediaPlaylistCreationMetadata *)v9 name];
          if (v45) {
            [v47 setObject:v45 forKey:@"name"];
          }
          long long v44 = [(MPMediaPlaylistCreationMetadata *)v9 authorDisplayName];
          if (v44) {
            [v47 setObject:v44 forKey:@"externalVendorDisplayName"];
          }
          unint64_t v43 = [(MPMediaPlaylistCreationMetadata *)v9 descriptionText];
          if (v43) {
            [v47 setObject:v43 forKey:@"descriptionInfo"];
          }
          unint64_t v41 = [MEMORY[0x1E4F28B50] mainBundle];
          uint64_t v42 = [v41 bundleIdentifier];
          if (v42) {
            [v47 setObject:v42 forKey:@"externalVendorIdentifier"];
          }
          [v47 setObject:MEMORY[0x1E4F1CC38] forKey:@"isExternalVendorPlaylist"];
          [v47 setObject:v11 forKey:@"externalVendorContainerTag"];
          uint64_t v24 = objc_msgSend(v46, "sdk_addPlaylistWithValuesForProperties:", v47);
          if (v24
            && (long long v40 = [[MPMediaPlaylist alloc] initWithPersistentID:v24]) != 0)
          {
            uint64_t v55 = 0;
            uint64_t v56 = &v55;
            uint64_t v57 = 0x2050000000;
            unint64_t v25 = (void *)getSKCloudServiceControllerClass_softClass;
            uint64_t v58 = getSKCloudServiceControllerClass_softClass;
            if (!getSKCloudServiceControllerClass_softClass)
            {
              *(void *)&long long buf = MEMORY[0x1E4F143A8];
              *((void *)&buf + 1) = 3221225472;
              unint64_t v68 = __getSKCloudServiceControllerClass_block_invoke;
              unint64_t v69 = &unk_1E57FA300;
              uint64_t v70 = &v55;
              __getSKCloudServiceControllerClass_block_invoke((uint64_t)&buf);
              unint64_t v25 = (void *)v56[3];
            }
            id v26 = v25;
            _Block_object_dispose(&v55, 8);
            id v39 = objc_alloc_init(v26);
            v49[0] = MEMORY[0x1E4F143A8];
            v49[1] = 3221225472;
            v49[2] = __73__MPMediaLibrary_getPlaylistWithUUID_creationMetadata_completionHandler___block_invoke;
            v49[3] = &unk_1E57F0710;
            uint64_t v15 = v40;
            uint64_t v50 = v15;
            uint64_t v51 = self;
            uint64_t v54 = v24;
            id v52 = v11;
            unint64_t v53 = v10;
            [v39 requestCapabilitiesWithCompletionHandler:v49];
          }
          else
          {
            if (v10) {
              v10[2](v10, 0, 0);
            }
            uint64_t v15 = 0;
          }
        }
        else
        {
          long long v36 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v46;
            _os_log_impl(&dword_1952E8000, v36, OS_LOG_TYPE_ERROR, "dataProvider: %{public}@ does not allow creating a playlist using the SDK", (uint8_t *)&buf, 0xCu);
          }

          if (!v10)
          {
            uint64_t v15 = 0;
            goto LABEL_45;
          }
          uint64_t v59 = *MEMORY[0x1E4F28568];
          long long v37 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
          long long v38 = [v37 localizedStringForKey:@"UNKNOWN_ERROR" value:&stru_1EE680640 table:@"MediaPlayer"];
          v60 = v38;
          id v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];

          uint64_t v45 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:0 userInfo:v47];
          ((void (**)(void *, id, void *))v10)[2](v10, 0, v45);
          uint64_t v15 = 0;
        }

LABEL_45:
        goto LABEL_46;
      }
      id v31 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1952E8000, v31, OS_LOG_TYPE_ERROR, "Create playlist failed, not authorized", (uint8_t *)&buf, 2u);
      }

      if (v10)
      {
        uint64_t v61 = *MEMORY[0x1E4F28568];
        id v32 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
        long long v33 = [v32 localizedStringForKey:@"PERMISSION_DENIED" value:&stru_1EE680640 table:@"MediaPlayer"];
        uint64_t v62 = v33;
        long long v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];

        long long v35 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:1 userInfo:v34];
        ((void (**)(void *, id, void *))v10)[2](v10, 0, v35);
      }
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_1952E8000, v23, OS_LOG_TYPE_ERROR, "Could not find playlist for %{public}@ and no creation metadata was provided", (uint8_t *)&buf, 0xCu);
      }

      if (v10)
      {
        uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v63 = *MEMORY[0x1E4F28568];
        uint64_t v48 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
        uint64_t v28 = [v48 localizedStringForKey:@"NOT_FOUND" value:&stru_1EE680640 table:@"MediaPlayer"];
        v64 = v28;
        uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        id v30 = [v27 errorWithDomain:@"MPErrorDomain" code:4 userInfo:v29];

        ((void (**)(void *, id, void *))v10)[2](v10, 0, v30);
      }
    }
    uint64_t v15 = 0;
LABEL_46:

    goto LABEL_47;
  }
  uint64_t v16 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = [NSString stringWithUTF8String:"-[MPMediaLibrary getPlaylistWithUUID:creationMetadata:completionHandler:]"];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Could not determine UUID string", (uint8_t *)&buf, 0xCu);
  }
  if (v10)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v65 = *MEMORY[0x1E4F28568];
    id v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    uint64_t v20 = [v19 localizedStringForKey:@"NOT_FOUND" value:&stru_1EE680640 table:@"MediaPlayer"];
    long long v66 = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    uint64_t v12 = [v18 errorWithDomain:@"MPErrorDomain" code:4 userInfo:v21];

    ((void (**)(void *, id, void *))v10)[2](v10, 0, v12);
LABEL_47:
  }
}

void __73__MPMediaLibrary_getPlaylistWithUUID_creationMetadata_completionHandler___block_invoke(uint64_t a1, __int16 a2, void *a3)
{
  v16[6] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 0x100) != 0)
  {
    v16[0] = @"name";
    v16[1] = @"dateCreated";
    v16[2] = @"descriptionInfo";
    v16[3] = @"externalVendorDisplayName";
    v16[4] = @"externalVendorContainerTag";
    v16[5] = @"externalVendorIdentifier";
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:6];
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    id v9 = [v7 valuesForProperties:v8];

    id v10 = [*(id *)(a1 + 40) userIdentity];
    id v11 = +[MPCloudController controllerWithUserIdentity:v10];
    uint64_t v12 = *(void *)(a1 + 64);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __73__MPMediaLibrary_getPlaylistWithUUID_creationMetadata_completionHandler___block_invoke_2;
    v14[3] = &unk_1E57F4208;
    id v15 = *(id *)(a1 + 48);
    objc_msgSend(v11, "sdk_createPlaylistWithPersistenID:properties:tracklist:completionHandler:", v12, v9, 0, v14);
  }
  uint64_t v13 = *(void *)(a1 + 56);
  if (v13) {
    (*(void (**)(uint64_t, void, void))(v13 + 16))(v13, *(void *)(a1 + 32), 0);
  }
}

void __73__MPMediaLibrary_getPlaylistWithUUID_creationMetadata_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543618;
      uint64_t v8 = v6;
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_ERROR, "Cloud createPlaylist for %{public}@ failed: %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)performStoreAlbumArtistLibraryImport:(id)a3 withCompletion:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    libraryDataProvider = self->_libraryDataProvider;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__MPMediaLibrary_performStoreAlbumArtistLibraryImport_withCompletion___block_invoke;
    v12[3] = &unk_1E57F06E8;
    objc_copyWeak(&v14, &location);
    id v13 = v7;
    [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider performStoreAlbumArtistLibraryImport:v6 withCompletion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    __int16 v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"unimplemented";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v11 = [v9 errorWithDomain:@"MPMediaLibraryErrorDomain" code:-1 userInfo:v10];

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __70__MPMediaLibrary_performStoreAlbumArtistLibraryImport_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _clearCachedEntitiesIncludingResultSets:1];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)performStoreItemLibraryImport:(id)a3 withCompletion:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    libraryDataProvider = self->_libraryDataProvider;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__MPMediaLibrary_performStoreItemLibraryImport_withCompletion___block_invoke;
    v12[3] = &unk_1E57F06E8;
    objc_copyWeak(&v14, &location);
    id v13 = v7;
    [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider performStoreItemLibraryImport:v6 withCompletion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    __int16 v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"unimplemented";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v11 = [v9 errorWithDomain:@"MPMediaLibraryErrorDomain" code:-1 userInfo:v10];

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __63__MPMediaLibrary_performStoreItemLibraryImport_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _clearCachedEntitiesIncludingResultSets:1];
  if (*(void *)(a1 + 32))
  {
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = objc_msgSend(WeakRetained, "itemWithPersistentID:verifyExistence:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13), "unsignedLongLongValue", (void)v15), 0);
          [v8 addObject:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)addStoreItemIDs:(id)a3 referralObject:(id)a4 andAddTracksToCloudLibrary:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v19 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = -[MPStoreItemLibraryImportElement initWithStoreItemID:additionalTrackMetadata:]([MPStoreItemLibraryImportElement alloc], "initWithStoreItemID:additionalTrackMetadata:", [*(id *)(*((void *)&v21 + 1) + 8 * v16) longLongValue], 0);
        [v11 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  long long v18 = [[MPStoreItemLibraryImport alloc] initWithImportElements:v11 referralObject:v9 usingCloudLibraryDestination:v19];
  [(MPMediaLibrary *)self performStoreItemLibraryImport:v18 withCompletion:v10];
}

- (void)addStoreItemIDs:(id)a3 andAddTracksToCloudLibrary:(BOOL)a4 withCompletion:(id)a5
{
}

- (void)addStoreItem:(int64_t)a3 andAddTracksToCloudLibrary:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v8 = NSNumber;
  id v9 = a5;
  id v10 = [v8 numberWithLongLong:a3];
  v12[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [(MPMediaLibrary *)self addStoreItemIDs:v11 andAddTracksToCloudLibrary:v5 withCompletion:v9];
}

- (id)_initWithLibraryDataProvider:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MPMediaLibrary;
  id v6 = [(MPMediaLibrary *)&v21 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryDataProvider, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mediaplayer.MPMediaLibraryRemote", 0);
    entityCacheQueue = v7->_entityCacheQueue;
    v7->_entityCacheQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mediaplayer.MPMediaLibrary.connectionAssertions", 0);
    connectionAssertionsQueue = v7->_connectionAssertionsQueue;
    v7->_connectionAssertionsQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = dispatch_get_global_queue(2, 0);
    fixedQueue = v7->_fixedQueue;
    v7->_fixedQueue = (OS_dispatch_queue *)v12;

    v7->__MLCoreStorageLock._os_unfair_lock_opaque = 0;
    v7->__MLCoreStorageLockPointer = &v7->__MLCoreStorageLock;
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.mediaplayer.MPMediaLibrary.additionalLibraryFilterPredicatesAccessQueue", 0);
    additionalLibraryFilterPredicatesAccessQueue = v7->_additionalLibraryFilterPredicatesAccessQueue;
    v7->_additionalLibraryFilterPredicatesAccessQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = objc_alloc_init(QueryCriteriaResultsCache);
    itemsForCriteriaCache = v7->_itemsForCriteriaCache;
    v7->_itemsForCriteriaCache = v16;

    long long v18 = objc_alloc_init(QueryCriteriaResultsCache);
    collectionsForCriteriaCache = v7->_collectionsForCriteriaCache;
    v7->_collectionsForCriteriaCache = v18;

    v7->_float connectionProgress = -1.0;
  }

  return v7;
}

- (MSVSQLDatabase)msvDatabase
{
  uint64_t v2 = [(MPMediaLibrary *)self databasePath];
  if ([v2 length])
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2];
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F779F0]) initWithURL:v3 error:0];
  }
  else
  {
    id v4 = 0;
  }

  return (MSVSQLDatabase *)v4;
}

void __37__MPMediaLibrary__setupNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _canShowCloudTracksDidChangeNotification:v3];
}

void __37__MPMediaLibrary__setupNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _displayValuesDidChangeNotification:v3];
}

void __37__MPMediaLibrary__setupNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _didReceiveMemoryWarning:v3];
}

void __37__MPMediaLibrary__setupNotifications__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadLibraryForRestrictionsChange];
}

void __37__MPMediaLibrary__setupNotifications__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadLibraryForRestrictionsChange];
}

void __37__MPMediaLibrary__setupNotifications__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)[v2 _MLCoreStorageLockPointer]);
    [v2 _setMLCoreStorage:0];
    os_unfair_lock_unlock((os_unfair_lock_t)[v2 _MLCoreStorageLockPointer]);
    id WeakRetained = v3;
  }
}

- (void)_disconnect
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(NSPointerArray *)self->_connectionAssertions compact];
  id v3 = [(NSPointerArray *)self->_connectionAssertions allObjects];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = os_log_create("com.apple.amp.mediaplayer", "Library_Oversize");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(NSPointerArray *)self->_connectionAssertions allObjects];
      int v7 = 138412546;
      dispatch_queue_t v8 = self;
      __int16 v9 = 2114;
      dispatch_queue_t v10 = v6;
      _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "%@ Deferring disconnect due to active assertions: %{public}@", (uint8_t *)&v7, 0x16u);
    }
    self->_disconnectAfterReleasingAssertions = 1;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider disconnect];
    }
    [(MPMediaLibrary *)self _clearCachedEntitiesIncludingResultSets:0];
    self->_float connectionProgress = -1.0;
  }
}

- (void)_removeConnectionAssertion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "%p Releasing connection assertion: %{public}@", buf, 0x16u);
  }

  connectionAssertionsQueue = self->_connectionAssertionsQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__MPMediaLibrary__removeConnectionAssertion___block_invoke;
  v8[3] = &unk_1E57F9F98;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(connectionAssertionsQueue, v8);
}

void __45__MPMediaLibrary__removeConnectionAssertion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 160) count])
  {
    uint64_t v2 = 0;
    while ([*(id *)(*(void *)(a1 + 32) + 160) pointerAtIndex:v2] != *(void *)(a1 + 40))
    {
      if (++v2 >= (unint64_t)[*(id *)(*(void *)(a1 + 32) + 160) count]) {
        goto LABEL_8;
      }
    }
    if (v2 != 0x7FFFFFFFFFFFFFFFLL) {
      [*(id *)(*(void *)(a1 + 32) + 160) removePointerAtIndex:v2];
    }
  }
LABEL_8:
  [*(id *)(*(void *)(a1 + 32) + 160) compact];
  id v3 = os_log_create("com.apple.amp.mediaplayer", "Library_Oversize");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(v4 + 160) allObjects];
    int v12 = 134218242;
    uint64_t v13 = v4;
    __int16 v14 = 2114;
    uint64_t v15 = v5;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "%p Active assertions: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id v6 = [*(id *)(*(void *)(a1 + 32) + 160) allObjects];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    if (([*(id *)(a1 + 32) isDeviceLibrary] & 1) == 0)
    {
      uint64_t v8 = SBSSpringBoardServerPort();
      MEMORY[0x19971B9C0](v8, *(unsigned __int8 *)(*(void *)(a1 + 32) + 231), *(unsigned __int8 *)(*(void *)(a1 + 32) + 232));
    }
    uint64_t v9 = *(void *)(a1 + 32);
    dispatch_queue_t v10 = *(void **)(v9 + 160);
    *(void *)(v9 + 160) = 0;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (!*(void *)(v11 + 160))
  {
    if (*(unsigned char *)(v11 + 176))
    {
      [(id)v11 _disconnect];
      dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_373);
    }
  }
}

uint64_t __45__MPMediaLibrary__removeConnectionAssertion___block_invoke_371()
{
  return +[MPMediaLibrary _endDiscoveringMediaLibrariesIfAllowed];
}

- (void)_clearPendingDisconnection
{
  connectionAssertionsQueue = self->_connectionAssertionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MPMediaLibrary__clearPendingDisconnection__block_invoke;
  block[3] = &unk_1E57F9EA8;
  void block[4] = self;
  dispatch_sync(connectionAssertionsQueue, block);
}

uint64_t __44__MPMediaLibrary__clearPendingDisconnection__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 176) = 0;
  return result;
}

- (id)_collectionPersistentIdentifiersForQueryCriteria:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__15308;
  unint64_t v25 = __Block_byref_object_dispose__15309;
  id v26 = 0;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  entityCacheQueue = self->_entityCacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MPMediaLibrary__collectionPersistentIdentifiersForQueryCriteria___block_invoke;
  block[3] = &unk_1E57F2870;
  uint64_t v15 = &v17;
  void block[4] = self;
  id v6 = v4;
  id v14 = v6;
  uint64_t v16 = &v21;
  dispatch_sync(entityCacheQueue, block);
  if (*((unsigned char *)v18 + 24)) {
    [(id)v22[5] updateToLibraryCurrentRevision];
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v22[5], "count"));
  uint64_t v8 = (void *)v22[5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__MPMediaLibrary__collectionPersistentIdentifiersForQueryCriteria___block_invoke_2;
  v11[3] = &unk_1E57F19F8;
  id v9 = v7;
  id v12 = v9;
  [v8 enumeratePersistentIDsUsingBlock:v11];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __67__MPMediaLibrary__collectionPersistentIdentifiersForQueryCriteria___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 80) objectForKey:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 == 0;

  uint64_t v3 = [*(id *)(a1[4] + 104) objectForKey:a1[5]];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    uint64_t v6 = [*(id *)(a1[4] + 16) collectionResultSetForQueryCriteria:a1[5]];
    uint64_t v7 = *(void *)(a1[7] + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (*(void *)(*(void *)(a1[7] + 8) + 40))
    {
      id v9 = *(void **)(a1[4] + 104);
      objc_msgSend(v9, "setObject:forKey:");
    }
  }
}

void __67__MPMediaLibrary__collectionPersistentIdentifiersForQueryCriteria___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];
}

- (id)_itemPersistentIdentifiersForQueryCriteria:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__15308;
  unint64_t v25 = __Block_byref_object_dispose__15309;
  id v26 = 0;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  entityCacheQueue = self->_entityCacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MPMediaLibrary__itemPersistentIdentifiersForQueryCriteria___block_invoke;
  block[3] = &unk_1E57F2870;
  uint64_t v15 = &v17;
  void block[4] = self;
  id v6 = v4;
  id v14 = v6;
  uint64_t v16 = &v21;
  dispatch_sync(entityCacheQueue, block);
  if (*((unsigned char *)v18 + 24)) {
    [(id)v22[5] updateToLibraryCurrentRevision];
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v22[5], "count"));
  uint64_t v8 = (void *)v22[5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__MPMediaLibrary__itemPersistentIdentifiersForQueryCriteria___block_invoke_2;
  v11[3] = &unk_1E57F19F8;
  id v9 = v7;
  id v12 = v9;
  [v8 enumeratePersistentIDsUsingBlock:v11];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __61__MPMediaLibrary__itemPersistentIdentifiersForQueryCriteria___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 48) objectForKey:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 == 0;

  uint64_t v3 = [*(id *)(a1[4] + 72) objectForKey:a1[5]];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    uint64_t v6 = [*(id *)(a1[4] + 16) itemResultSetForQueryCriteria:a1[5]];
    uint64_t v7 = *(void *)(a1[7] + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (*(void *)(*(void *)(a1[7] + 8) + 40))
    {
      id v9 = *(void **)(a1[4] + 72);
      objc_msgSend(v9, "setObject:forKey:");
    }
  }
}

void __61__MPMediaLibrary__itemPersistentIdentifiersForQueryCriteria___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];
}

uint64_t __54__MPMediaLibrary__countOfCollectionsForQueryCriteria___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 count];

  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __48__MPMediaLibrary__countOfItemsForQueryCriteria___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 count];

  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __50__MPMediaLibrary__hasCollectionsForQueryCriteria___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 MPIsEmpty] ^ 1;

  return [v2 numberWithBool:v3];
}

uint64_t __44__MPMediaLibrary__hasItemsForQueryCriteria___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 MPIsEmpty] ^ 1;

  return [v2 numberWithBool:v3];
}

- (BOOL)collectionExistsContainedWithinSyncIDs:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  return [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider collectionExistsContainedWithinSyncIDs:a3 groupingType:a4 existentPID:a5];
}

- (BOOL)collectionExistsWithCloudUniversalLibraryID:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  return [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider collectionExistsWithCloudUniversalLibraryID:a3 groupingType:a4 existentPID:a5];
}

- (BOOL)collectionExistsWithCloudLibraryID:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  return [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider collectionExistsWithCloudLibraryID:a3 groupingType:a4 existentPID:a5];
}

- (BOOL)collectionExistsWithSagaID:(int64_t)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  return [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider collectionExistsWithSagaID:a3 groupingType:a4 existentPID:a5];
}

- (BOOL)collectionExistsWithStoreID:(int64_t)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  return [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider collectionExistsWithStoreID:a3 groupingType:a4 existentPID:a5];
}

- (BOOL)collectionExistsWithName:(id)a3 groupingType:(int64_t)a4 existentPID:(unint64_t *)a5
{
  return [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider collectionExistsWithName:a3 groupingType:a4 existentPID:a5];
}

- (BOOL)collectionExistsContainedWithinPersistentIDs:(const unint64_t *)a3 count:(unint64_t)a4 groupingType:(int64_t)a5 existentPID:(unint64_t *)a6
{
  return [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider collectionExistsContainedWithinPersistentIDs:a3 count:a4 groupingType:a5 existentPID:a6];
}

- (BOOL)_handlesSameAccountAs:(id)a3
{
  uint64_t v4 = (MPMediaLibrary *)a3;
  id v5 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  int v6 = [v5 supportsMultipleITunesAccounts];

  char v7 = 0;
  if (self != v4 && v6)
  {
    uint64_t v8 = [(MPMediaLibrary *)self userIdentity];
    id v9 = [v8 accountDSID];
    dispatch_queue_t v10 = [(MPMediaLibrary *)v4 userIdentity];
    uint64_t v11 = [v10 accountDSID];
    if (v9 == v11) {
      char v7 = 1;
    }
    else {
      char v7 = [v9 isEqual:v11];
    }
  }
  return v7;
}

- (void)activeUserChangeDidFinish
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = self;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - Active user change completed - Firing notifications for path change", (uint8_t *)&v4, 0xCu);
  }

  [(MPMediaLibrary *)self _reloadLibraryForPathChange];
}

- (id)securityScopedFileURLForAssetURL:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "msv_mediaAssetPersistentID");
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = objc_alloc(MEMORY[0x1E4F79AF8]);
    uint64_t v8 = [(MPMediaLibrary *)self databasePath];
    id v9 = (void *)[v7 initWithPath:v8];

    dispatch_queue_t v10 = [v9 securityScopedFileURLForItemPID:v6];
  }
  else
  {
    uint64_t v11 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138478083;
      id v14 = self;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_ERROR, "%{private}@ sandboxedFileURLForAssetURL - Invalid assetURL %{public}@", (uint8_t *)&v13, 0x16u);
    }

    dispatch_queue_t v10 = 0;
  }

  return v10;
}

- (id)pathForAssetURL:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "msv_mediaAssetPersistentID");
  if (v4)
  {
    uint64_t v5 = [(MPMediaLibrary *)self itemWithPersistentID:v4];
    uint64_t v6 = [v5 valueForProperty:@"filePath"];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)isValidAssetURL:(id)a3
{
  return objc_msgSend(a3, "msv_isValidMediaAssetURL");
}

- (void)downloadAsset:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    id v6 = a4;
    objc_msgSend(v5, "msv_errorWithDomain:code:debugDescription:", @"MPErrorDomain", -10101, @"downloadAsset is not available");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a4 + 2))(v6, v7);
  }
}

- (id)entityWithPersistentID:(int64_t)a3 entityType:(int64_t)a4
{
  uint64_t v4 = 0;
  if (a3)
  {
    switch(a4)
    {
      case 0:
        uint64_t v5 = -[MPMediaLibrary itemWithPersistentID:verifyExistence:](self, "itemWithPersistentID:verifyExistence:");
        goto LABEL_6;
      case 1:
        uint64_t v5 = -[MPMediaLibrary playlistWithPersistentID:](self, "playlistWithPersistentID:");
        goto LABEL_6;
      case 2:
      case 3:
      case 4:
      case 5:
      case 7:
        uint64_t v5 = -[MPMediaLibrary collectionWithPersistentID:groupingType:verifyExistence:](self, "collectionWithPersistentID:groupingType:verifyExistence:");
LABEL_6:
        uint64_t v4 = (void *)v5;
        break;
      default:
        break;
    }
  }

  return v4;
}

- (id)entityWithSpotlightIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
    id v6 = [(MPMediaLibrary *)self entityWithLibraryURL:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)entityWithLibraryURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MPMediaLibrary *)self libraryDataProvider];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    dispatch_queue_t v10 = 0;
    goto LABEL_22;
  }
  id v6 = (void *)MEMORY[0x1E4F79AD8];
  id v7 = [v5 library];
  uint64_t v8 = [v6 entityFromURL:v4 inLibrary:v7];

  if (!v8) {
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = -[MPMediaLibrary playlistWithPersistentID:](self, "playlistWithPersistentID:", [v8 persistentID]);
      goto LABEL_19;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v8 persistentID];
      id v12 = self;
      uint64_t v13 = 1;
LABEL_18:
      uint64_t v9 = [(MPMediaLibrary *)v12 collectionWithPersistentID:v11 groupingType:v13 verifyExistence:0];
      goto LABEL_19;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v8 persistentID];
      id v12 = self;
      uint64_t v13 = 2;
      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v8 persistentID];
      id v12 = self;
      uint64_t v13 = 3;
      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v8 persistentID];
      id v12 = self;
      uint64_t v13 = 4;
      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v8 persistentID];
      id v12 = self;
      uint64_t v13 = 5;
      goto LABEL_18;
    }
LABEL_20:
    dispatch_queue_t v10 = 0;
    goto LABEL_21;
  }
  uint64_t v9 = -[MPMediaLibrary itemWithPersistentID:verifyExistence:](self, "itemWithPersistentID:verifyExistence:", [v8 persistentID], 0);
LABEL_19:
  dispatch_queue_t v10 = (void *)v9;
LABEL_21:

LABEL_22:

  return v10;
}

- (id)entityWithMultiverseIdentifier:(id)a3
{
  id v4 = a3;
  [v4 mediaObjectType];
  uint64_t v5 = (objc_class *)objc_opt_class();
  if (v5) {
    id v6 = (void *)[[v5 alloc] initWithMultiverseIdentifier:v4 library:self];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)multiverseIdentifierForCollectionWithPersistentID:(int64_t)a3 groupingType:(int64_t)a4
{
  return (id)[(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider multiverseIdentifierForCollectionWithPersistentID:a3 groupingType:a4];
}

- (id)multiverseIdentifierForTrackWithPersistentID:(int64_t)a3
{
  return (id)[(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider multiverseIdentifierForTrackWithPersistentID:a3];
}

- (BOOL)deleteDatabaseProperty:(id)a3
{
  return [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider deleteDatabaseProperty:a3];
}

- (BOOL)setValue:(id)a3 forDatabaseProperty:(id)a4
{
  return [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider setValue:a3 forDatabaseProperty:a4];
}

- (id)entityCache
{
  return (id)[(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider entityCache];
}

- (id)syncValidity
{
  return (id)[(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider syncValidity];
}

- (float)connectionProgress
{
  return self->_connectionProgress;
}

- (BOOL)isCurrentThreadInTransaction
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  libraryDataProvider = self->_libraryDataProvider;

  return [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider isCurrentThreadInTransaction];
}

- (void)performReadTransactionWithBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (objc_opt_respondsToSelector()) {
    [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider performReadTransactionWithBlock:v4];
  }
  else {
    v4[2]();
  }
}

- (BOOL)performTransactionWithBlock:(id)a3
{
  id v4 = (uint64_t (**)(void))a3;
  if (objc_opt_respondsToSelector()) {
    char v5 = [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider performTransactionWithBlock:v4];
  }
  else {
    char v5 = v4[2](v4);
  }
  BOOL v6 = v5;

  return v6;
}

- (void)connectWithAuthenticationData:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__MPMediaLibrary_connectWithAuthenticationData_completionBlock___block_invoke;
  v7[3] = &unk_1E57F90A0;
  id v8 = v5;
  id v6 = v5;
  [(MPMediaLibrary *)self connectWithCompletionHandler:v7];
}

uint64_t __64__MPMediaLibrary_connectWithAuthenticationData_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  }
  return result;
}

- (BOOL)requiresAuthentication
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  libraryDataProvider = self->_libraryDataProvider;

  return [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider requiresAuthentication];
}

- (id)preferredSubtitleLanguages
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider preferredSubtitleLanguages];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)preferredAudioLanguages
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider preferredAudioLanguages];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)isGeniusEnabled
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  libraryDataProvider = self->_libraryDataProvider;

  return [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider isGeniusEnabled];
}

- (void)geniusItemsForSeedItem:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider geniusItemsForSeedItem:v7 completion:v6];
  }
}

- (void)setValues:(id)a3 forProperties:(id)a4 forItemPersistentIDs:(id)a5
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [v13 count];
    if (v11 != [v9 count])
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPMediaLibrary.m", 1699, @"values/properties must have the same count (%lu != %lu)", objc_msgSend(v13, "count"), objc_msgSend(v9, "count"));
    }
    [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider setValues:v13 forProperties:v9 forItemPersistentIDs:v10];
  }
}

- (void)clearLocationPropertiesOfItem:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    -[MPMediaLibraryDataProviderPrivate clearLocationPropertiesOfItemWithIdentifier:](self->_libraryDataProvider, "clearLocationPropertiesOfItemWithIdentifier:", [v4 persistentID]);
  }
}

- (void)populateLocationPropertiesOfItem:(id)a3 withPath:(id)a4 assetProtectionType:(int64_t)a5 completionBlock:(id)a6
{
  id v12 = a3;
  id v10 = a4;
  id v11 = a6;
  if (objc_opt_respondsToSelector())
  {
    -[MPMediaLibraryDataProviderPrivate populateLocationPropertiesOfItemWithIdentifier:withPath:assetProtectionType:completionBlock:](self->_libraryDataProvider, "populateLocationPropertiesOfItemWithIdentifier:withPath:assetProtectionType:completionBlock:", [v12 persistentID], v10, a5, v11);
  }
  else if (v11)
  {
    (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
  }
}

- (void)populateLocationPropertiesOfItem:(id)a3 withPath:(id)a4 assetProtectionType:(int64_t)a5
{
  id v9 = a3;
  id v8 = a4;
  if (objc_opt_respondsToSelector()) {
    -[MPMediaLibraryDataProviderPrivate populateLocationPropertiesOfItemWithIdentifier:withPath:assetProtectionType:](self->_libraryDataProvider, "populateLocationPropertiesOfItemWithIdentifier:withPath:assetProtectionType:", [v9 persistentID], v8, a5);
  }
}

- (BOOL)removePlaylist:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    char v5 = -[MPMediaLibraryDataProviderPrivate removePlaylistWithIdentifier:](self->_libraryDataProvider, "removePlaylistWithIdentifier:", [v4 persistentID]);
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)removeItems:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v4 count];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = malloc_type_malloc(8 * v5, 0x100004000313F17uLL);
      for (uint64_t i = 0; i != v6; ++i)
      {
        id v9 = [v4 objectAtIndex:i];
        v7[i] = [v9 persistentID];
      }
      char v10 = [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider removeItemsWithIdentifiers:v7 count:v6];
      free(v7);
    }
    else
    {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)deleteItems:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v4 count];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = malloc_type_malloc(8 * v5, 0x100004000313F17uLL);
      for (uint64_t i = 0; i != v6; ++i)
      {
        id v9 = [v4 objectAtIndex:i];
        v7[i] = [v9 persistentID];
      }
      char v10 = [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider deleteItemsWithIdentifiers:v7 count:v6];
      free(v7);
    }
    else
    {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)URLForHomeSharingRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider URLForItemDataRequest:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (unsigned)homeSharingDatabaseID
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  libraryDataProvider = self->_libraryDataProvider;

  return [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider databaseID];
}

- (unint64_t)syncPlaylistId
{
  uint64_t v2 = [(MPMediaLibrary *)self valueForDatabaseProperty:@"MLSyncPlaylistId"];
  unint64_t v3 = [v2 longLongValue];

  return v3;
}

- (void)setSyncPlaylistId:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [(MPMediaLibrary *)self setValue:v4 forDatabaseProperty:@"MLSyncPlaylistId"];
}

- (id)_addPlaylistWithName:(id)a3 activeGeniusPlaylist:(BOOL)a4 externalVendorIdentifier:(id)a5 properties:(id)a6 trackList:(id)a7 playlistEntryProperties:(id)a8
{
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v16) {
    id v19 = (id)[v16 mutableCopy];
  }
  else {
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  char v20 = v19;
  if (v14) {
    [v19 setObject:v14 forKey:@"name"];
  }
  uint64_t v21 = [NSNumber numberWithBool:v12];
  [v20 setObject:v21 forKey:@"isActiveGeniusPlaylist"];

  if (v15) {
    [v20 setObject:v15 forKey:@"externalVendorIdentifier"];
  }
  if (objc_opt_respondsToSelector())
  {
    long long v22 = [(MPMediaLibrary *)self playlistWithPersistentID:[(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider addPlaylistWithValuesForProperties:v20 trackList:v17 playlistEntryProperties:v18]];
  }
  else if (objc_opt_respondsToSelector())
  {
    long long v22 = [(MPMediaLibrary *)self playlistWithPersistentID:[(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider addPlaylistWithValuesForProperties:v20]];
    if (v22 && [v17 count])
    {
      dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __130__MPMediaLibrary__addPlaylistWithName_activeGeniusPlaylist_externalVendorIdentifier_properties_trackList_playlistEntryProperties___block_invoke;
      v26[3] = &unk_1E57F9B98;
      dispatch_semaphore_t v27 = v23;
      long long v24 = v23;
      [v22 replaceItemsWithPersistentIDs:v17 completion:v26];
      dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    long long v22 = 0;
  }

  return v22;
}

intptr_t __130__MPMediaLibrary__addPlaylistWithName_activeGeniusPlaylist_externalVendorIdentifier_properties_trackList_playlistEntryProperties___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_addPlaylistWithName:(id)a3 externalVendorIdentifier:(id)a4
{
  return [(MPMediaLibrary *)self _addPlaylistWithName:a3 activeGeniusPlaylist:0 externalVendorIdentifier:a4 properties:0 trackList:0 playlistEntryProperties:0];
}

- (id)addPlaylistWithName:(id)a3 properties:(id)a4 trackList:(id)a5 playlistEntryProperties:(id)a6
{
  return [(MPMediaLibrary *)self _addPlaylistWithName:a3 activeGeniusPlaylist:0 externalVendorIdentifier:0 properties:a4 trackList:a5 playlistEntryProperties:a6];
}

- (id)addPlaylistWithName:(id)a3 activeGeniusPlaylist:(BOOL)a4
{
  return [(MPMediaLibrary *)self _addPlaylistWithName:a3 activeGeniusPlaylist:a4 externalVendorIdentifier:0 properties:0 trackList:0 playlistEntryProperties:0];
}

- (id)addPlaylistWithName:(id)a3
{
  return [(MPMediaLibrary *)self _addPlaylistWithName:a3 activeGeniusPlaylist:0 externalVendorIdentifier:0 properties:0 trackList:0 playlistEntryProperties:0];
}

- (id)playlistWithPersistentID:(unint64_t)a3
{
  id v3 = [(MPMediaLibrary *)self newPlaylistWithPersistentID:a3];

  return v3;
}

- (id)photosMemoriesPlaylist
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)[(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider photosMemoriesPlaylistPersistentID];
    if (v3)
    {
      id v3 = [(MPMediaLibrary *)self playlistWithPersistentID:v3];
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)playbackHistoryPlaylist
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)[(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider playbackHistoryPlaylistPersistentID];
    if (v3)
    {
      id v3 = [(MPMediaLibrary *)self playlistWithPersistentID:v3];
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)localizedSectionIndexTitles
{
  return (id)[(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider localizedSectionIndexTitles];
}

- (id)localizedSectionHeaderForSectionIndex:(unint64_t)a3
{
  return (id)[(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider localizedSectionHeaderForSectionIndex:a3];
}

- (id)newPlaylistWithPersistentID:(unint64_t)a3
{
  id v4 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:a3];
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v4, @"playlistPersistentID", 0);
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v7 = +[MPMediaPropertyPredicate predicateWithValue:v4 forProperty:@"playlistPersistentID"];
  id v8 = objc_msgSend(v6, "initWithObjects:", v7, 0);

  id v9 = objc_alloc_init(MPMediaQueryCriteria);
  [(MPMediaQueryCriteria *)v9 setFilterPredicates:v8];
  char v10 = [[MPMediaQuery alloc] initWithCriteria:v9 library:self];
  id v11 = [[MPConcreteMediaPlaylist alloc] initWithProperties:v5 itemsQuery:v10];

  return v11;
}

- (id)decodeItemWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [[MPConcreteMediaItem alloc] initWithCoder:v3];

  return v4;
}

- (id)itemWithStoreID:(unint64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = (void *)[(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider itemPersistentIDForStoreID:a3];
    if (v5)
    {
      uint64_t v5 = [(MPMediaLibrary *)self itemWithPersistentID:v5 verifyExistence:0];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)itemWithPersistentID:(unint64_t)a3
{
  return [(MPMediaLibrary *)self itemWithPersistentID:a3 verifyExistence:1];
}

- (id)collectionWithPersistentID:(unint64_t)a3 groupingType:(int64_t)a4 verifyExistence:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = [MPMediaQuery alloc];
  char v10 = (void *)MEMORY[0x1E4F1CAD0];
  id v11 = [NSNumber numberWithUnsignedLongLong:a3];
  BOOL v12 = +[MPMediaItem persistentIDPropertyForGroupingType:a4];
  id v13 = +[MPMediaPropertyPredicate predicateWithValue:v11 forProperty:v12];
  id v14 = [v10 setWithObject:v13];
  id v15 = [(MPMediaQuery *)v9 initWithFilterPredicates:v14];

  [(MPMediaQuery *)v15 setMediaLibrary:self];
  id v16 = [[MPConcreteMediaItemCollection alloc] initWithIdentifier:a3 itemsQuery:v15 grouping:a4];
  if (v5
    && ![(MPMediaLibrary *)self collectionExistsWithPersistentID:a3 groupingType:a4])
  {

    id v16 = 0;
  }

  return v16;
}

- (id)collectionWithPersistentID:(unint64_t)a3 groupingType:(int64_t)a4
{
  return [(MPMediaLibrary *)self collectionWithPersistentID:a3 groupingType:a4 verifyExistence:1];
}

- (BOOL)collectionExistsWithPersistentID:(unint64_t)a3 groupingType:(int64_t)a4
{
  return [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider collectionExistsWithPersistentID:a3 groupingType:a4];
}

- (BOOL)playlistExistsWithPersistentID:(unint64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    libraryDataProvider = self->_libraryDataProvider;
    return [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider playlistExistsWithPersistentID:a3];
  }
  else
  {
    id v7 = objc_alloc_init(MPMediaQuery);
    [(MPMediaQuery *)v7 setMediaLibrary:self];
    id v8 = [NSNumber numberWithUnsignedLongLong:a3];
    id v9 = +[MPMediaPropertyPredicate predicateWithValue:v8 forProperty:@"playlistPersistentID"];
    [(MPMediaQuery *)v7 addFilterPredicate:v9];

    LOBYTE(v8) = [(MPMediaQuery *)v7 _hasCollections];
    return (char)v8;
  }
}

- (BOOL)itemExistsInDatabaseWithPersistentID:(unint64_t)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider itemExistsWithPersistentID:a3] & 1) != 0)
  {
    return 1;
  }
  id v6 = objc_alloc_init(MPMediaQuery);
  [(MPMediaQuery *)v6 setMediaLibrary:self];
  id v7 = [NSNumber numberWithUnsignedLongLong:a3];
  id v8 = +[MPMediaPropertyPredicate predicateWithValue:v7 forProperty:@"persistentID"];
  [(MPMediaQuery *)v6 addFilterPredicate:v8];

  [(MPMediaQuery *)v6 setShouldIncludeNonLibraryEntities:1];
  LOBYTE(v7) = [(MPMediaQuery *)v6 _hasItems];

  return (char)v7;
}

- (BOOL)hasUserPlaylistsContainingAppleMusicContent
{
  uint64_t v2 = [(MPMediaLibrary *)self libraryDataProvider];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 library];
    char v4 = [v3 hasUserPlaylistsContainingAppleMusicContent];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)hasAddedToLibraryAppleMusicContent
{
  uint64_t v2 = [(MPMediaLibrary *)self libraryDataProvider];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 library];
    char v4 = [v3 hasAddedToLibraryAppleMusicContent];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)hasUserPlaylists
{
  uint64_t v2 = [(MPMediaLibrary *)self libraryDataProvider];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 library];
    char v4 = [v3 hasUserPlaylists];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)hasVideoPodcasts
{
  return [(MPMediaLibrary *)self _checkHasContent:&self->_hasVideoPodcasts determined:&self->_determinedHasVideoPodcasts mediaType:1024 queryHasEntitiesBlock:&__block_literal_global_269];
}

uint64_t __34__MPMediaLibrary_hasVideoPodcasts__block_invoke()
{
  dispatch_queue_t v0 = +[MPMediaQuery videoPodcastsQuery];
  uint64_t v1 = [v0 _hasCollections];

  return v1;
}

- (BOOL)hasHomeVideos
{
  return [(MPMediaLibrary *)self _checkHasContent:&self->_hasHomeVideos determined:&self->_determinedHasHomeVideos mediaType:0x2000 queryHasEntitiesBlock:&__block_literal_global_267];
}

uint64_t __31__MPMediaLibrary_hasHomeVideos__block_invoke()
{
  dispatch_queue_t v0 = +[MPMediaQuery homeVideosQuery];
  uint64_t v1 = [v0 _hasCollections];

  return v1;
}

- (BOOL)hasTVShows
{
  return [(MPMediaLibrary *)self _checkHasContent:&self->_hasTVShows determined:&self->_determinedHasTVShows mediaType:512 queryHasEntitiesBlock:&__block_literal_global_265];
}

uint64_t __28__MPMediaLibrary_hasTVShows__block_invoke()
{
  dispatch_queue_t v0 = +[MPMediaQuery tvShowsQuery];
  uint64_t v1 = [v0 _hasCollections];

  return v1;
}

- (BOOL)hasMovieRentals
{
  return [(MPMediaLibrary *)self _checkHasContent:&self->_hasMovieRentals determined:&self->_determinedHasMovieRentals queryHasEntitiesBlock:&__block_literal_global_263];
}

uint64_t __33__MPMediaLibrary_hasMovieRentals__block_invoke()
{
  dispatch_queue_t v0 = +[MPMediaQuery movieRentalsQuery];
  uint64_t v1 = [v0 _hasItems];

  return v1;
}

- (BOOL)hasVideoITunesUContent
{
  return [(MPMediaLibrary *)self _checkHasContent:&self->_hasVideoITunesU determined:&self->_determinedHasVideoITunesU mediaType:4096 queryHasEntitiesBlock:&__block_literal_global_261];
}

uint64_t __40__MPMediaLibrary_hasVideoITunesUContent__block_invoke()
{
  dispatch_queue_t v0 = +[MPMediaQuery videoITunesUQuery];
  uint64_t v1 = [v0 _hasCollections];

  return v1;
}

- (BOOL)hasAudioITunesUContent
{
  return [(MPMediaLibrary *)self _checkHasContent:&self->_hasITunesU determined:&self->_determinedHasITunesU mediaType:8 queryHasEntitiesBlock:&__block_literal_global_259];
}

uint64_t __40__MPMediaLibrary_hasAudioITunesUContent__block_invoke()
{
  dispatch_queue_t v0 = +[MPMediaQuery ITunesUAudioQuery];
  uint64_t v1 = [v0 _hasCollections];

  return v1;
}

- (BOOL)hasITunesUContent
{
  return [(MPMediaLibrary *)self _checkHasContent:&self->_hasITunesU determined:&self->_determinedHasITunesU mediaType:4104 queryHasEntitiesBlock:&__block_literal_global_257];
}

uint64_t __35__MPMediaLibrary_hasITunesUContent__block_invoke()
{
  dispatch_queue_t v0 = +[MPMediaQuery ITunesUQuery];
  uint64_t v1 = [v0 _hasCollections];

  return v1;
}

- (BOOL)hasCompilations
{
  return [(MPMediaLibrary *)self _checkHasContent:&self->_hasCompilations determined:&self->_determinedHasCompilations queryHasEntitiesBlock:&__block_literal_global_255];
}

uint64_t __33__MPMediaLibrary_hasCompilations__block_invoke()
{
  dispatch_queue_t v0 = +[MPMediaQuery compilationsQuery];
  uint64_t v1 = [v0 _hasCollections];

  return v1;
}

- (BOOL)hasMovies
{
  return [(MPMediaLibrary *)self _checkHasContent:&self->_hasMovies determined:&self->_determinedHasMovies mediaType:256 queryHasEntitiesBlock:&__block_literal_global_253];
}

uint64_t __27__MPMediaLibrary_hasMovies__block_invoke()
{
  dispatch_queue_t v0 = +[MPMediaQuery moviesQuery];
  uint64_t v1 = [v0 _hasItems];

  return v1;
}

- (BOOL)hasAudibleAudioBooks
{
  return [(MPMediaLibrary *)self _checkHasContent:&self->_hasAudibleAudioBooks determined:&self->_determinedHasAudibleAudioBooks queryHasEntitiesBlock:&__block_literal_global_251];
}

uint64_t __38__MPMediaLibrary_hasAudibleAudioBooks__block_invoke()
{
  dispatch_queue_t v0 = +[MPMediaQuery audibleAudiobooksQuery];
  uint64_t v1 = [v0 _hasCollections];

  return v1;
}

- (BOOL)hasMusicVideos
{
  return [(MPMediaLibrary *)self _checkHasContent:&self->_hasMusicVideos determined:&self->_determinedHasMusicVideos mediaType:2048 queryHasEntitiesBlock:&__block_literal_global_249];
}

uint64_t __32__MPMediaLibrary_hasMusicVideos__block_invoke()
{
  dispatch_queue_t v0 = +[MPMediaQuery musicVideosQuery];
  uint64_t v1 = [v0 _hasItems];

  return v1;
}

- (BOOL)hasVideos
{
  return [(MPMediaLibrary *)self _checkHasContent:&self->_hasVideos determined:&self->_determinedHasVideos mediaType:65280 queryHasEntitiesBlock:&__block_literal_global_247];
}

uint64_t __27__MPMediaLibrary_hasVideos__block_invoke()
{
  dispatch_queue_t v0 = +[MPMediaQuery videosQuery];
  uint64_t v1 = [v0 _hasItems];

  return v1;
}

- (BOOL)_checkHasContent:(BOOL *)a3 determined:(BOOL *)a4 mediaType:(unint64_t)a5 queryHasEntitiesBlock:(id)a6
{
  BOOL result = *a3;
  if (!*a4)
  {
    BOOL result = (*((uint64_t (**)(id, SEL))a6 + 2))(a6, a2);
    *a3 = result;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_checkHasContent:(BOOL *)a3 determined:(BOOL *)a4 queryHasEntitiesBlock:(id)a5
{
  BOOL result = *a3;
  if (!*a4)
  {
    BOOL result = (*((uint64_t (**)(id, SEL))a5 + 2))(a5, a2);
    *a3 = result;
    *a4 = 1;
  }
  return result;
}

- (BOOL)hasAudiobooks
{
  unsigned int v2 = *((unsigned __int8 *)self + 193);
  if ((v2 & 0x40) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      if ([(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider hasMediaOfType:4])int v4 = -128; {
      else
      }
        int v4 = 0;
      unsigned int v5 = v4 & 0xFFFFFF80 | *((unsigned char *)self + 193) & 0x7F;
    }
    else
    {
      id v6 = +[MPMediaQuery audiobooksQuery];
      if ([v6 _hasCollections]) {
        char v7 = 0x80;
      }
      else {
        char v7 = 0;
      }
      *((unsigned char *)self + 193) = v7 & 0x80 | *((unsigned char *)self + 193) & 0x7F;

      unsigned int v5 = *((unsigned __int8 *)self + 193);
    }
    unsigned int v2 = v5 | 0x40;
    *((unsigned char *)self + 193) = v2;
  }
  return (v2 >> 7) & 1;
}

- (BOOL)hasComposers
{
  unsigned int v2 = *((unsigned __int8 *)self + 193);
  if ((v2 & 1) == 0)
  {
    int v4 = +[MPMediaQuery composersQuery];
    if ([v4 _hasCollections]) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 193) = *((unsigned char *)self + 193) & 0xFD | v5;

    unsigned int v2 = *((unsigned __int8 *)self + 193) | 1;
    *((unsigned char *)self + 193) |= 1u;
  }
  return (v2 >> 1) & 1;
}

- (BOOL)hasUbiquitousBookmarkableItems
{
  unsigned int v2 = *((unsigned __int8 *)self + 193);
  if ((v2 & 0x10) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      if ([(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider hasUbiquitousBookmarkableItems])int v4 = 32; {
      else
      }
        int v4 = 0;
      int v5 = *((unsigned char *)self + 193) & 0xDF | v4;
    }
    else
    {
      int v5 = *((unsigned char *)self + 193) & 0xDF;
    }
    unsigned int v2 = v5 | 0x10;
    *((unsigned char *)self + 193) = v2;
  }
  return (v2 >> 5) & 1;
}

- (BOOL)hasPodcasts
{
  unsigned int v2 = *((unsigned __int8 *)self + 193);
  if ((v2 & 4) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      if ([(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider hasMediaOfType:1026])int v4 = 8; {
      else
      }
        int v4 = 0;
      int v5 = *((unsigned char *)self + 193) & 0xF7 | v4;
    }
    else
    {
      id v6 = +[MPMediaQuery podcastsQuery];
      if ([v6 _hasCollections]) {
        char v7 = 8;
      }
      else {
        char v7 = 0;
      }
      *((unsigned char *)self + 193) = *((unsigned char *)self + 193) & 0xF7 | v7;

      int v5 = *((unsigned __int8 *)self + 193);
    }
    unsigned int v2 = v5 | 4;
    *((unsigned char *)self + 193) = v2;
  }
  return (v2 >> 3) & 1;
}

- (BOOL)hasSongs
{
  unsigned int v2 = *((unsigned __int8 *)self + 192);
  if ((v2 & 4) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      if ([(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider hasMediaOfType:1])int v4 = 8; {
      else
      }
        int v4 = 0;
      int v5 = *((unsigned char *)self + 192) & 0xF7 | v4;
    }
    else
    {
      id v6 = +[MPMediaQuery songsQuery];
      if ([v6 _hasItems]) {
        char v7 = 8;
      }
      else {
        char v7 = 0;
      }
      *((unsigned char *)self + 192) = *((unsigned char *)self + 192) & 0xF7 | v7;

      int v5 = *((unsigned __int8 *)self + 192);
    }
    unsigned int v2 = v5 | 4;
    *((unsigned char *)self + 192) = v2;
  }
  return (v2 >> 3) & 1;
}

- (BOOL)hasPlaylists
{
  unsigned int v2 = *((unsigned __int8 *)self + 192);
  if ((v2 & 0x40) == 0)
  {
    int v4 = +[MPMediaQuery playlistsQuery];
    if ([v4 _hasCollections]) {
      char v5 = 0x80;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 192) = v5 & 0x80 | *((unsigned char *)self + 192) & 0x7F;

    unsigned int v2 = *((unsigned __int8 *)self + 192) | 0x40;
    *((unsigned char *)self + 192) |= 0x40u;
  }
  return v2 >> 7;
}

- (BOOL)hasGeniusMixes
{
  unsigned int v2 = *((unsigned __int8 *)self + 192);
  if ((v2 & 0x10) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      if ([(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider hasGeniusMixes])int v4 = 32; {
      else
      }
        int v4 = 0;
      int v5 = *((unsigned char *)self + 192) & 0xDF | v4;
    }
    else
    {
      int v5 = *((unsigned char *)self + 192) & 0xDF;
    }
    unsigned int v2 = v5 | 0x10;
    *((unsigned char *)self + 192) = v2;
  }
  return (v2 >> 5) & 1;
}

- (BOOL)hasMedia
{
  unsigned int v2 = *((unsigned __int8 *)self + 192);
  if ((v2 & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      if ([(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider hasMediaOfType:-1])int v4 = 2; {
      else
      }
        int v4 = 0;
      int v5 = *((unsigned char *)self + 192) & 0xFD | v4;
    }
    else
    {
      id v6 = objc_alloc_init(MPMediaQuery);
      if ([(MPMediaQuery *)v6 _hasItems]) {
        char v7 = 2;
      }
      else {
        char v7 = 0;
      }
      *((unsigned char *)self + 192) = *((unsigned char *)self + 192) & 0xFD | v7;

      int v5 = *((unsigned __int8 *)self + 192);
    }
    unsigned int v2 = v5 | 1;
    *((unsigned char *)self + 192) = v2;
  }
  return (v2 >> 1) & 1;
}

- (BOOL)hasMediaOfType:(unint64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    int v5 = [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider hasMediaOfType:a3];
    char v6 = *((unsigned char *)self + 192);
    if (v5 | ((v6 & 2) >> 1)) {
      char v7 = 2;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 192) = v7 | v6 & 0xFD;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)usageForSyncedMediaOfType:(unint64_t)a3
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  unsigned int v4 = MLMediaTypeForMPMediaType(a3);
  int v5 = (void *)MEMORY[0x1E4F79B08];
  char v6 = [MEMORY[0x1E4F79A90] predicateWithProperty:*MEMORY[0x1E4F797A8] mask:v4 value:0];
  char v7 = [v5 predicateWithPredicate:v6];

  id v8 = [MEMORY[0x1E4F79AA0] predicateWithProperty:*MEMORY[0x1E4F79480] value:&unk_1EE6ECF68 comparison:4];
  id v9 = (void *)MEMORY[0x1E4F79A60];
  v17[0] = v7;
  v17[1] = v8;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v11 = [v9 predicateMatchingPredicates:v10];

  BOOL v12 = [(MPMediaLibrary *)self ml3Library];
  if (v12)
  {
    id v13 = [MEMORY[0x1E4F79B50] queryWithLibrary:v12 predicate:v11];
    id v14 = [v13 valueForAggregateFunction:*MEMORY[0x1E4F793B8] onEntitiesForProperty:*MEMORY[0x1E4F79A00]];
    unint64_t v15 = [v14 unsignedLongLongValue];
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

- (void)setRemovalReason:(int64_t)a3
{
  self->_removalReason = a3;
}

- (int64_t)removalReason
{
  return self->_removalReason;
}

- (id)name
{
  return (id)[(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider name];
}

- (void)removeLibraryFilterPredicate:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    additionalLibraryFilterPredicatesAccessQueue = self->_additionalLibraryFilterPredicatesAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__MPMediaLibrary_removeLibraryFilterPredicate___block_invoke;
    block[3] = &unk_1E57F9F98;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(additionalLibraryFilterPredicatesAccessQueue, block);
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      [(MPMediaLibrary *)self _reloadLibraryForRestrictionsChange];
    }
    else
    {
      char v7 = dispatch_get_global_queue(0, 0);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __47__MPMediaLibrary_removeLibraryFilterPredicate___block_invoke_2;
      v8[3] = &unk_1E57F9EA8;
      void v8[4] = self;
      dispatch_async(v7, v8);
    }
  }
}

void __47__MPMediaLibrary_removeLibraryFilterPredicate___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 144) containsObject:*(void *)(a1 + 40)])
  {
    [*(id *)(*(void *)(a1 + 32) + 144) removeObject:*(void *)(a1 + 40)];
    if (![*(id *)(*(void *)(a1 + 32) + 144) count])
    {
      uint64_t v2 = *(void *)(a1 + 32);
      id v3 = *(void **)(v2 + 144);
      *(void *)(v2 + 144) = 0;
    }
  }
}

uint64_t __47__MPMediaLibrary_removeLibraryFilterPredicate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadLibraryForRestrictionsChange];
}

- (void)setClientIdentity:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__privacyContextLock);
  int v5 = [[MPMediaLibraryPrivacyContext alloc] initWithClientIdentity:v4];
  privacyContext = self->_privacyContext;
  self->_privacyContext = v5;

  os_unfair_lock_unlock((os_unfair_lock_t)&__privacyContextLock);
  char v7 = (void *)MEMORY[0x1E4F79AF8];
  id v8 = [(MPMediaLibrary *)self userIdentity];
  id v9 = [v7 musicLibraryForUserAccount:v8];

  [v9 setClientIdentity:v4];
}

- (void)logDatabaseAccess
{
  os_unfair_lock_lock((os_unfair_lock_t)&__privacyContextLock);
  privacyContext = (MPMediaLibraryPrivacyContext *)__privacyContextOverride;
  if (!__privacyContextOverride) {
    privacyContext = self->_privacyContext;
  }
  id v4 = privacyContext;
  os_unfair_lock_unlock((os_unfair_lock_t)&__privacyContextLock);
  [(MPMediaLibraryPrivacyContext *)v4 logPrivacyAccess];
}

- (BOOL)writable
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  libraryDataProvider = self->_libraryDataProvider;

  return [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider writable];
}

uint64_t __33__MPMediaLibrary_isDeviceLibrary__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __33__MPMediaLibrary_isDeviceLibrary__block_invoke_2;
  v2[3] = &unk_1E57F04F8;
  long long v3 = *(_OWORD *)(a1 + 32);
  return [(id)__userMediaLibraries enumerateKeysAndObjectsUsingBlock:v2];
}

uint64_t __33__MPMediaLibrary_isDeviceLibrary__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isEqual:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (int64_t)playlistGeneration
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return -1;
  }
  libraryDataProvider = self->_libraryDataProvider;

  return [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider playlistGeneration];
}

- (unint64_t)syncGenerationID
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0xFFFFFFFFLL;
  }
  libraryDataProvider = self->_libraryDataProvider;

  return [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider syncGenerationID];
}

- (void)addItemWithProductID:(NSString *)productID completionHandler:(void *)completionHandler
{
  v22[1] = *MEMORY[0x1E4F143B8];
  char v6 = productID;
  char v7 = completionHandler;
  if (+[MPMediaLibrary authorizationStatus] == MPMediaLibraryAuthorizationStatusAuthorized)
  {
    if (objc_opt_respondsToSelector())
    {
      libraryDataProvider = self->_libraryDataProvider;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      void v17[2] = __57__MPMediaLibrary_addItemWithProductID_completionHandler___block_invoke;
      void v17[3] = &unk_1E57F5F10;
      id v18 = v7;
      [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider sdk_addItemWithOpaqueID:v6 withCompletion:v17];
      id v9 = v18;
LABEL_9:

      goto LABEL_10;
    }
    if (v7)
    {
      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      id v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      BOOL v12 = [v11 localizedStringForKey:@"UNKNOWN_ERROR" value:&stru_1EE680640 table:@"MediaPlayer"];
      char v20 = v12;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      id v14 = v16;
      uint64_t v15 = 0;
      goto LABEL_8;
    }
  }
  else if (v7)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    id v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    BOOL v12 = [v11 localizedStringForKey:@"PERMISSION_DENIED" value:&stru_1EE680640 table:@"MediaPlayer"];
    v22[0] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    id v14 = v10;
    uint64_t v15 = 1;
LABEL_8:
    id v9 = [v14 errorWithDomain:@"MPErrorDomain" code:v15 userInfo:v13];

    (*((void (**)(void *, void, void *))v7 + 2))(v7, 0, v9);
    goto LABEL_9;
  }
LABEL_10:
}

void __57__MPMediaLibrary_addItemWithProductID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v6)
  {
    if (!v7) {
      goto LABEL_17;
    }
    id v8 = [v6 domain];
    if ([v8 isEqualToString:*MEMORY[0x1E4FB8410]])
    {
      uint64_t v9 = [v6 code];

      if (v9 == -7602)
      {
        id v10 = (void *)MEMORY[0x1E4F28C58];
        v23[0] = *MEMORY[0x1E4F28568];
        id v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
        BOOL v12 = [v11 localizedStringForKey:@"CAPABILITY_MISSING" value:&stru_1EE680640 table:@"MediaPlayer"];
        v23[1] = *MEMORY[0x1E4F28A50];
        v24[0] = v12;
        v24[1] = v6;
        id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
        id v14 = v10;
        uint64_t v15 = 2;
        goto LABEL_12;
      }
    }
    else
    {
    }
    id v16 = [v6 domain];
    char v17 = [v16 isEqualToString:@"MPErrorDomain"];

    if (v17)
    {
      id v18 = 0;
LABEL_13:
      if (v18) {
        id v20 = v18;
      }
      else {
        id v20 = v6;
      }
      (*(void (**)(void, void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, v20);

      goto LABEL_17;
    }
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    v21[0] = *MEMORY[0x1E4F28568];
    id v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    BOOL v12 = [v11 localizedStringForKey:@"UNKNOWN_ERROR" value:&stru_1EE680640 table:@"MediaPlayer"];
    v21[1] = *MEMORY[0x1E4F28A50];
    v22[0] = v12;
    v22[1] = v6;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    id v14 = v19;
    uint64_t v15 = 0;
LABEL_12:
    id v18 = [v14 errorWithDomain:@"MPErrorDomain" code:v15 userInfo:v13];

    goto LABEL_13;
  }
  if (v7) {
    (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v5, 0);
  }
LABEL_17:
}

- (NSDate)lastModifiedDate
{
  if (objc_opt_respondsToSelector()) {
    [(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider lastModifiedDate];
  }
  else {
  long long v3 = [MEMORY[0x1E4F1C9C8] date];
  }

  return (NSDate *)v3;
}

- (void)disconnect
{
  connectionAssertionsQueue = self->_connectionAssertionsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__MPMediaLibrary_disconnect__block_invoke;
  block[3] = &unk_1E57F9EA8;
  void block[4] = self;
  dispatch_sync(connectionAssertionsQueue, block);
}

uint64_t __28__MPMediaLibrary_disconnect__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _disconnect];
}

- (void)connectWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (float connectionProgress = self->_connectionProgress, connectionProgress < 1.0))
  {
    if (connectionProgress >= 0.0 && connectionProgress < 1.0)
    {
      if (v4)
      {
        id v8 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Connection already in progress" forKey:*MEMORY[0x1E4F28568]];
        id v10 = [v8 errorWithDomain:@"MPMediaLibraryErrorDomain" code:0 userInfo:v9];
        v4[2](v4, v10);
      }
    }
    else
    {
      self->_disconnectAfterReleasingAssertions = 0;
      libraryDataProvider = self->_libraryDataProvider;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __47__MPMediaLibrary_connectWithCompletionHandler___block_invoke;
      v12[3] = &unk_1E57F4F80;
      void v12[4] = self;
      id v13 = v4;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __47__MPMediaLibrary_connectWithCompletionHandler___block_invoke_2;
      v11[3] = &unk_1E57F9B48;
      void v11[4] = self;
      [(MPMediaLibraryDataProviderPrivate *)libraryDataProvider connectWithAuthenticationData:0 completionBlock:v12 progressHandler:v11];
      self->_float connectionProgress = 0.0;
      +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryStatusDidChangeNotification" library:self];
    }
  }
  else if (v4)
  {
    v4[2](v4, 0);
  }
}

void __47__MPMediaLibrary_connectWithCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v10 = a3;
  float v5 = -1.0;
  if (a2) {
    float v5 = 1.0;
  }
  *(float *)(*(void *)(a1 + 32) + 180) = v5;
  +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryStatusDidChangeNotification" library:*(void *)(a1 + 32)];
  id v6 = v10;
  if (!v10 && (a2 & 1) == 0)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Unable to connect" forKey:*MEMORY[0x1E4F28568]];
    uint64_t v11 = [v7 errorWithDomain:@"MPMediaLibraryErrorDomain" code:0 userInfo:v8];

    id v6 = (void *)v11;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    BOOL v12 = v6;
    (*(void (**)(void))(v9 + 16))();
    id v6 = v12;
  }
}

void __47__MPMediaLibrary_connectWithCompletionHandler___block_invoke_2(uint64_t a1, float a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__MPMediaLibrary_connectWithCompletionHandler___block_invoke_3;
  v2[3] = &unk_1E57F9C60;
  void v2[4] = *(void *)(a1 + 32);
  float v3 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __47__MPMediaLibrary_connectWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  float v2 = *(float *)(v1 + 180);
  if (v2 < *(float *)(a1 + 40)) {
    float v2 = *(float *)(a1 + 40);
  }
  *(float *)(v1 + 180) = v2;
  return +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryConnectionProgressDidChange" library:*(void *)(a1 + 32)];
}

- (void)_displayValuesDidChangeNotification:(id)a3
{
  if (!+[MPMediaQuery isFilteringDisabled])
  {
    +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryDidChangeNotification" library:self];
  }
}

- (void)_didReceiveMemoryWarning:(id)a3
{
}

- (void)_activeUserDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v6 = [(MPMediaLibrary *)self activeUserChangeMonitor];
  float v5 = [v4 name];

  [v6 ingestNotificationName:v5];
}

- (void)_reloadLibraryForPathChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__MPMediaLibrary__reloadLibraryForPathChange__block_invoke;
  v2[3] = &unk_1E57F9EA8;
  void v2[4] = self;
  [(MPMediaLibrary *)self _scheduleLibraryChangeNotificationPostingBlock:v2];
}

uint64_t __45__MPMediaLibrary__reloadLibraryForPathChange__block_invoke(uint64_t a1)
{
  +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryPathDidChangeNotification" library:*(void *)(a1 + 32)];
  uint64_t v2 = *(void *)(a1 + 32);

  return +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryDidChangeNotification" library:v2];
}

- (void)_reloadLibraryForInvisiblePropertyChangeWithNotificationInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__MPMediaLibrary__reloadLibraryForInvisiblePropertyChangeWithNotificationInfo___block_invoke;
  v6[3] = &unk_1E57F9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MPMediaLibrary *)self _scheduleLibraryChangeNotificationPostingBlock:v6];
}

uint64_t __79__MPMediaLibrary__reloadLibraryForInvisiblePropertyChangeWithNotificationInfo___block_invoke(uint64_t a1)
{
  return +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryInvisiblePropertiesDidChangeNotification" library:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (void)_reloadLibraryForDynamicPropertyChangeWithNotificationInfo:(id)a3
{
  id v4 = a3;
  [(MPMediaLibrary *)self _clearCachedEntitiesIncludingResultSets:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__MPMediaLibrary__reloadLibraryForDynamicPropertyChangeWithNotificationInfo___block_invoke;
  v6[3] = &unk_1E57F9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MPMediaLibrary *)self _scheduleLibraryChangeNotificationPostingBlock:v6];
}

uint64_t __77__MPMediaLibrary__reloadLibraryForDynamicPropertyChangeWithNotificationInfo___block_invoke(uint64_t a1)
{
  return +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryDynamicPropertiesDidChangeNotification" library:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (void)_reloadLibraryForContentsChangeWithNotificationInfo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  [(MPMediaLibrary *)self _clearCachedContentDataAndResultSets:objc_opt_isKindOfClass() & 1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__MPMediaLibrary__reloadLibraryForContentsChangeWithNotificationInfo___block_invoke;
  v6[3] = &unk_1E57F9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MPMediaLibrary *)self _scheduleLibraryChangeNotificationPostingBlock:v6];
}

uint64_t __70__MPMediaLibrary__reloadLibraryForContentsChangeWithNotificationInfo___block_invoke(uint64_t a1)
{
  return +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryDidChangeNotification" library:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (id)_dataProviderDescription
{
  return (id)[(MPMediaLibraryDataProviderPrivate *)self->_libraryDataProvider description];
}

- (void)_clearCountCriteriaCaches
{
  entityCacheQueue = self->_entityCacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MPMediaLibrary__clearCountCriteriaCaches__block_invoke;
  block[3] = &unk_1E57F9EA8;
  void block[4] = self;
  dispatch_async(entityCacheQueue, block);
}

uint64_t __43__MPMediaLibrary__clearCountCriteriaCaches__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 96);

  return [v2 removeAllObjects];
}

void __54__MPMediaLibrary_initWithClientIdentity_userIdentity___block_invoke_142(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2 == 3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    float v3 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__MPMediaLibrary_initWithClientIdentity_userIdentity___block_invoke_2;
    v6[3] = &unk_1E57F9EA8;
    id v7 = v3;
    [v7 _scheduleLibraryChangeNotificationPostingBlock:v6];
    id v4 = v7;
  }
  else
  {
    id v4 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [NSString stringWithUTF8String:"-[MPMediaLibrary initWithClientIdentity:userIdentity:]_block_invoke"];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_ERROR, "%{public}@: app not authorized for access", buf, 0xCu);
    }
  }
}

uint64_t __54__MPMediaLibrary_initWithClientIdentity_userIdentity___block_invoke_2(uint64_t a1)
{
  return +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryDidChangeNotification" library:*(void *)(a1 + 32) userInfo:0];
}

- (MPMediaLibrary)initWithDatabasePath:(id)a3
{
  id v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F79AF8]) initWithPath:v5 isUnitTesting:1];
  if ([v6 validateDatabase])
  {
    id v7 = [[MPMediaLibraryDataProviderML3 alloc] initWithLibrary:v6];
    [(MPMediaLibraryDataProviderML3 *)v7 setMediaLibrary:self];
    id v8 = (MPMediaLibrary *)[(MPMediaLibrary *)self _initWithLibraryDataProvider:v7];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"MPMediaLibrary.m", 369, @"Failed to validate database at path %@", v5 object file lineNumber description];

    id v8 = [(MPMediaLibrary *)self init];
  }

  return v8;
}

- (MPMediaLibrary)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  float v3 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - New library init called", (uint8_t *)&v5, 0xCu);
  }

  return (MPMediaLibrary *)[(MPMediaLibrary *)self _initWithUserIdentity:0];
}

- (id)itLibrary
{
  uint64_t v2 = [(MPMediaLibrary *)self libraryDataProvider];
  float v3 = [v2 itLibrary];

  return v3;
}

+ (void)libraryPathDidChangeForDataProvider:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uniqueIdentifier];
    int v11 = 138412290;
    BOOL v12 = v6;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "Reloading data provider for significant change %@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v7 = [a1 _libraryForDataProvider:v4];
  id v8 = [v7 activeUserChangeMonitor];

  if (v8)
  {
    uint64_t v9 = [v7 activeUserChangeMonitor];
    [v9 ingestNotificationName:@"MPMediaLibraryPathDidChangeNotification"];

    uint64_t v10 = [v7 activeUserChangeMonitor];
    [v10 ingestNotificationName:@"MPMediaLibraryDidChangeNotification"];
  }
  else
  {
    [v7 _reloadLibraryForPathChange];
  }
}

+ (void)uniqueIdentifierDidChangeForLibraryDataProvider:(id)a3
{
  id v3 = [a1 _libraryForDataProvider:a3];
  +[MPMediaLibrary _postNotificationName:@"_MPMediaLibraryAvailableMediaLibrariesDidChangePrivateNotification" library:v3];
  +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryAvailableMediaLibrariesDidChangeNotification" library:v3];
}

+ (void)syncGenerationDidChangeForLibraryDataProvider:(id)a3
{
  id v3 = [a1 _libraryForDataProvider:a3];
  +[MPMediaLibrary _postNotificationName:@"MPMediaLibrarySyncGenerationDidChangeNotification" library:v3];
}

+ (void)reloadDisplayValuesForLibraryDataProvider:(id)a3
{
  id v3 = [a1 _libraryForDataProvider:a3];
  +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryDisplayValuesWillChangeNotification" library:v3];
  +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryDisplayValuesDidChangeNotification" library:v3];
}

+ (void)reloadInvisiblePropertiesForLibraryDataProvider:(id)a3
{
  id v3 = [a1 _libraryForDataProvider:a3];
  [v3 _reloadLibraryForInvisiblePropertyChangeWithNotificationInfo:0];
}

+ (void)reloadDynamicPropertiesForLibraryDataProvider:(id)a3
{
  id v3 = [a1 _libraryForDataProvider:a3];
  [v3 _reloadLibraryForDynamicPropertyChangeWithNotificationInfo:0];
}

+ (void)postEntitiesAddedOrRemovedNotificationForLibraryDataProvider:(id)a3
{
  id v3 = [a1 _libraryForDataProvider:a3];
  +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryEntitiesAddedOrRemovedNotification" library:v3];
}

+ (void)reloadLibraryDataProvider:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uniqueIdentifier];
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "Reloading data provider %@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = [a1 _libraryForDataProvider:v4];
  [v7 _reloadLibraryForContentsChangeWithNotificationInfo:0];
}

+ (void)removeLibraryDataProvider:(id)a3 removalReason:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v6 uniqueIdentifier];
    int v13 = 138412290;
    id v14 = v8;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "Removing data provider %@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v9 = [a1 _libraryForDataProvider:v6];
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 setRemovalReason:a4];
    [v10 endGeneratingLibraryChangeNotifications];
    [v10 _clearCachedEntitiesIncludingResultSets:1];
    [v10 _clearCountCriteriaCaches];
    int v11 = [a1 _mediaLibraries];
    [v11 removeObject:v10];

    BOOL v12 = [a1 _libraryDataProviders];
    [v12 removeObject:v6];

    +[MPMediaLibrary _postNotificationName:@"_MPMediaLibraryAvailableMediaLibrariesDidChangePrivateNotification" library:0];
    +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryAvailableMediaLibrariesDidChangeNotification" library:0];
  }
}

+ (void)addLibraryDataProvider:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uniqueIdentifier];
    int v10 = 138412290;
    int v11 = v6;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "Adding data provider %@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v7 = [a1 _libraryDataProviders];
  [v7 addObject:v4];

  id v8 = [[MPMediaLibrary alloc] _initWithLibraryDataProvider:v4];
  [v8 beginGeneratingLibraryChangeNotifications];
  uint64_t v9 = [a1 _mediaLibraries];
  [v9 addObject:v8];

  +[MPMediaLibrary _postNotificationName:@"_MPMediaLibraryAvailableMediaLibrariesDidChangePrivateNotification" library:0];
  +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryAvailableMediaLibrariesDidChangeNotification" library:0];
}

+ (id)libraryDataProviders
{
  uint64_t v2 = [a1 _libraryDataProviders];
  id v3 = (void *)[v2 copy];

  return v3;
}

+ (id)_libraryDataProviders
{
  uint64_t v2 = (void *)_libraryDataProviders___libraryDataProviders;
  if (!_libraryDataProviders___libraryDataProviders)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v4 = (void *)_libraryDataProviders___libraryDataProviders;
    _libraryDataProviders___libraryDataProviders = (uint64_t)v3;

    uint64_t v2 = (void *)_libraryDataProviders___libraryDataProviders;
  }

  return v2;
}

+ (id)_libraryForDataProvider:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [a1 _mediaLibraries];
  id v6 = (void *)[v5 copy];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  id v8 = (id)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        int v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "libraryDataProvider", (void)v14);
        id v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

+ (MPMediaLibrary)mediaLibraryWithUniqueIdentifier:(id)a3 allowsLoadingFromDisk:(BOOL)a4
{
  if (a4) {
    [a1 _mediaLibraryWithUniqueIdentifier:a3 userDSID:0];
  }
  else {
  id v4 = [a1 mediaLibraryWithUniqueIdentifier:a3];
  }

  return (MPMediaLibrary *)v4;
}

+ (MPMediaLibrary)mediaLibraryWithUniqueIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [a1 _mediaLibraries];
  id v6 = (void *)[v5 copy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "uniqueIdentifier", (void)v15);
        char v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (MPMediaLibrary *)v8;
}

uint64_t __38__MPMediaLibrary_sharedMediaLibraries__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 libraryDataProvider];
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();

  id v8 = [v5 libraryDataProvider];
  objc_opt_class();
  int v9 = objc_opt_isKindOfClass();

  if ((isKindOfClass ^ v9))
  {
    if (isKindOfClass) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = 1;
    }
  }
  else
  {
    int v11 = [v4 name];
    id v12 = [v5 name];
    uint64_t v10 = [v11 localizedCaseInsensitiveCompare:v12];
  }
  return v10;
}

+ (void)_endDiscoveringMediaLibrariesIfAllowed
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!__numberOfHomeSharingObservers)
  {
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 1;
    [a1 mediaLibraries];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v17 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v10;
LABEL_4:
      uint64_t v5 = 0;
      while (1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v9 + 1) + 8 * v5);
        if (([v6 isDeviceLibrary] & 1) == 0)
        {
          id v7 = v6[21];
          v8[0] = MEMORY[0x1E4F143A8];
          v8[1] = 3221225472;
          v8[2] = __56__MPMediaLibrary__endDiscoveringMediaLibrariesIfAllowed__block_invoke;
          v8[3] = &unk_1E57F9F20;
          void v8[4] = v6;
          void v8[5] = &v13;
          dispatch_sync(v7, v8);
          if (!*((unsigned char *)v14 + 24)) {
            break;
          }
        }
        if (v3 == ++v5)
        {
          uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v17 count:16];
          if (v3) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    if (*((unsigned char *)v14 + 24)) {
      +[MPHomeSharingML3DataProvider endScanningForLibraries];
    }

    _Block_object_dispose(&v13, 8);
  }
}

void __56__MPMediaLibrary__endDiscoveringMediaLibrariesIfAllowed__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 160) allObjects];
  uint64_t v3 = [v2 count];

  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

+ (BOOL)isLibraryServerDisabled
{
  return 1;
}

+ (void)setGlobalPrivacyClientWithAuditToken:(id *)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&__privacyContextLock);
  uint64_t v4 = [MPMediaLibraryPrivacyContext alloc];
  long long v5 = *(_OWORD *)&a3->var0[4];
  long long v10 = *(_OWORD *)a3->var0;
  long long v11 = v5;
  uint64_t v6 = [(MPMediaLibraryPrivacyContext *)v4 initWithAuditToken:&v10];
  id v7 = (void *)__privacyContextOverride;
  __privacyContextOverride = v6;

  os_unfair_lock_unlock((os_unfair_lock_t)&__privacyContextLock);
  long long v8 = *(_OWORD *)&a3->var0[4];
  long long v10 = *(_OWORD *)a3->var0;
  long long v11 = v8;
  +[MPMediaLibraryPrivacyContext setDefaultClientWithAuditToken:&v10];
  long long v9 = *(_OWORD *)&a3->var0[4];
  long long v10 = *(_OWORD *)a3->var0;
  long long v11 = v9;
  [MEMORY[0x1E4F79AF8] setGlobalPrivacyContextWithAuditToken:&v10];
}

+ (void)requestAuthorization:(void *)completionHandler
{
  uint64_t v4 = completionHandler;
  long long v5 = [a1 _sharedCloudServiceStatusMonitor];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__MPMediaLibrary_requestAuthorization___block_invoke;
  v7[3] = &unk_1E57F04D0;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  [v5 requestAuthorizationForScopes:2 completionHandler:v7];
}

uint64_t __39__MPMediaLibrary_requestAuthorization___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32))
  {
    uint64_t v2 = result;
    [*(id *)(result + 40) _mediaLibraryAuthorizationStatusFromCloudServiceAuthorizationStatus:a2];
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(v2 + 32) + 16);
    return v3();
  }
  return result;
}

+ (void)endDiscoveringMediaLibraries
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__MPMediaLibrary_endDiscoveringMediaLibraries__block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a1;
  uint64_t v2 = (void (**)(void))MEMORY[0x19971E0F0](v3, a2);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v2[2](v2);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v2);
  }
}

uint64_t __46__MPMediaLibrary_endDiscoveringMediaLibraries__block_invoke(uint64_t a1)
{
  if (__numberOfHomeSharingObservers >= 1) {
    --__numberOfHomeSharingObservers;
  }
  return [*(id *)(a1 + 32) _endDiscoveringMediaLibrariesIfAllowed];
}

uint64_t __48__MPMediaLibrary_beginDiscoveringMediaLibraries__block_invoke()
{
  if (!__numberOfHomeSharingObservers++) {
    return +[MPHomeSharingML3DataProvider beginScanningForLibraries];
  }
  return result;
}

void __57__MPMediaLibrary__postNotificationName_library_userInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543618;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - Related library posting notification [%@]", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:*(void *)(a1 + 32) object:v3 userInfo:*(void *)(a1 + 40)];
}

+ (void)_postNotificationName:(id)a3 library:(id)a4
{
}

+ (id)_deviceMediaLibraryWithUserIdentity:(id)a3 createIfRequired:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  char v9 = [v8 supportsMultipleITunesAccounts];

  if ((v9 & 1) == 0)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:a1 file:@"MPMediaLibrary.m" lineNumber:326 description:@"Attempting to access a method only available for tv and audio accessory device"];
  }
  uint64_t v10 = [v7 accountDSID];
  uint64_t v11 = @"NoDSID";
  if (v10) {
    uint64_t v11 = (__CFString *)v10;
  }
  uint64_t v26 = 0;
  dispatch_semaphore_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__15308;
  id v30 = __Block_byref_object_dispose__15309;
  id v31 = 0;
  long long v12 = __defaultMediaLibraryQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MPMediaLibrary__deviceMediaLibraryWithUserIdentity_createIfRequired___block_invoke;
  block[3] = &unk_1E57F5D58;
  BOOL v25 = v4;
  uint64_t v13 = v11;
  uint64_t v21 = v13;
  id v24 = a1;
  id v14 = v7;
  id v22 = v14;
  dispatch_semaphore_t v23 = &v26;
  dispatch_sync(v12, block);
  uint64_t v15 = v27;
  if (v4 && v27[5])
  {
    char v16 = [a1 _mediaLibraries];
    [v16 addObject:v27[5]];

    uint64_t v15 = v27;
  }
  id v17 = (id)v15[5];

  _Block_object_dispose(&v26, 8);

  return v17;
}

void __71__MPMediaLibrary__deviceMediaLibraryWithUserIdentity_createIfRequired___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = [(id)__userMediaLibraries objectForKeyedSubscript:*(void *)(a1 + 32)];

    if (!v2)
    {
      id v3 = (void *)MEMORY[0x19971DE60]();
      BOOL v4 = os_log_create("com.apple.amp.mediaplayer", "Library");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 56);
        uint64_t v6 = *(void *)(a1 + 40);
        int v11 = 138543618;
        uint64_t v12 = v5;
        __int16 v13 = 2112;
        uint64_t v14 = v6;
        _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - No pre-existing library for user identity: %@", (uint8_t *)&v11, 0x16u);
      }

      id v7 = [[MPMediaLibrary alloc] _initWithUserIdentity:*(void *)(a1 + 40)];
      [(id)__userMediaLibraries setObject:v7 forKeyedSubscript:*(void *)(a1 + 32)];
    }
  }
  uint64_t v8 = [(id)__userMediaLibraries objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

+ (void)setDefaultMediaLibrary:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[MPMediaLibrary deviceMediaLibrary];
  int v5 = [v3 isEqual:v4];

  if (v5)
  {

    id v3 = 0;
  }
  if ((id)__defaultMediaLibraryOverride != v3)
  {
    [(id)__defaultMediaLibraryOverride _clearCachedEntitiesIncludingResultSets:1];
    [(id)__defaultMediaLibraryOverride _clearCountCriteriaCaches];
    [(id)__defaultMediaLibraryOverride endGeneratingLibraryChangeNotifications];
    [(id)__defaultMediaLibraryOverride disconnect];
    uint64_t v6 = __defaultMediaLibraryQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__MPMediaLibrary_setDefaultMediaLibrary___block_invoke;
    block[3] = &unk_1E57F9EA8;
    id v7 = v3;
    id v9 = v7;
    dispatch_sync(v6, block);
    [(id)__defaultMediaLibraryOverride beginGeneratingLibraryChangeNotifications];
    [(id)__defaultMediaLibraryOverride _clearPendingDisconnection];
    +[MPMediaLibrary _postNotificationName:@"MPMediaLibraryDefaultMediaLibraryDidChangeNotification" library:0];
    [v7 _reloadLibraryForContentsChangeWithNotificationInfo:0];
  }
}

void __41__MPMediaLibrary_setDefaultMediaLibrary___block_invoke(uint64_t a1)
{
}

void __135__MPMediaLibrary_MPMediaLibrarySyncAnchorSupport__enumerateEntityChangesAfterSyncAnchor_maximumRevisionType_inUsersLibrary_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v11 = a3;
  id v7 = (void *)MEMORY[0x19971DE60]();
  uint64_t v8 = *(void *)(a1 + 32);
  if (a4) {
    +[MPConcreteMediaItem createUncachedConcreteMediaItemWithPersistentID:a2 library:v8];
  }
  else {
  id v9 = +[MPConcreteMediaItem concreteMediaItemWithPersistentID:a2 library:v8];
  }
  uint64_t v10 = [[_MPMediaLibraryEntityChange alloc] initWithEntity:v9 anchor:v11 deletionType:a4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __135__MPMediaLibrary_MPMediaLibrarySyncAnchorSupport__enumerateEntityChangesAfterSyncAnchor_maximumRevisionType_inUsersLibrary_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v18 = a4;
  id v9 = (void *)MEMORY[0x19971DE60]();
  if (a3 == 6)
  {
    uint64_t v10 = (MPConcreteMediaItemCollection *)[*(id *)(a1 + 32) newPlaylistWithPersistentID:a2];
  }
  else
  {
    id v11 = +[MPMediaItem persistentIDPropertyForGroupingType:a3];
    uint64_t v12 = [NSNumber numberWithUnsignedLongLong:a2];
    __int16 v13 = +[MPMediaPropertyPredicate predicateWithValue:v12 forProperty:v11];

    uint64_t v14 = objc_alloc_init(MPMediaQueryCriteria);
    [(MPMediaQueryCriteria *)v14 addFilterPredicate:v13];
    uint64_t v15 = [[MPMediaQuery alloc] initWithCriteria:v14 library:*(void *)(a1 + 32)];
    if (a5)
    {
      char v16 = +[MPConcreteMediaItemCollection createUncachedMediaItemCollectionWithIdentifier:a2 valuesForProperties:0 itemsQuery:v15 grouping:a3 representativeItemIdentifier:0];
    }
    else
    {
      char v16 = [[MPConcreteMediaItemCollection alloc] initWithIdentifier:a2 valuesForProperties:0 itemsQuery:v15 grouping:a3 representativeItemIdentifier:0];
    }
    uint64_t v10 = v16;
  }
  id v17 = [[_MPMediaLibraryEntityChange alloc] initWithEntity:v10 anchor:v18 deletionType:a5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)errorResolverForItem:(id)a3
{
  id v4 = a3;
  int v5 = [(MPMediaLibrary *)self libraryDataProvider];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MPMediaLibrary *)self libraryDataProvider];
    uint64_t v8 = [v7 errorResolverForItem:v4];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)clearSagaLastPlaylistPlayDataUploadDate
{
  id v2 = [(MPMediaLibrary *)self ml3Library];
  [v2 clearSagaLastPlaylistPlayDataUploadDate];
}

- (void)clearSagaLastItemPlayDataUploadDate
{
  id v2 = [(MPMediaLibrary *)self ml3Library];
  [v2 clearSagaLastItemPlayDataUploadDate];
}

- (void)clearSagaCloudAccountID
{
  id v2 = [(MPMediaLibrary *)self ml3Library];
  [v2 clearSagaCloudAccountID];
}

- (void)setSagaLastSubscribedContainersUpdateTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPMediaLibrary *)self ml3Library];
  [v5 setSagaLastSubscribedContainersUpdateTime:v4];
}

- (NSDate)sagaLastSubscribedContainersUpdateTime
{
  id v2 = [(MPMediaLibrary *)self ml3Library];
  id v3 = [v2 sagaLastSubscribedContainersUpdateTime];

  return (NSDate *)v3;
}

- (void)setSagaLastLibraryUpdateTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPMediaLibrary *)self ml3Library];
  [v5 setSagaLastLibraryUpdateTime:v4];
}

- (NSDate)sagaLastLibraryUpdateTime
{
  id v2 = [(MPMediaLibrary *)self ml3Library];
  id v3 = [v2 sagaLastLibraryUpdateTime];

  return (NSDate *)v3;
}

- (void)setSagaOnDiskDatabaseRevision:(int64_t)a3
{
  id v4 = [(MPMediaLibrary *)self ml3Library];
  [v4 setSagaOnDiskDatabaseRevision:a3];
}

- (int64_t)sagaOnDiskDatabaseRevision
{
  id v2 = [(MPMediaLibrary *)self ml3Library];
  int64_t v3 = [v2 sagaOnDiskDatabaseRevision];

  return v3;
}

- (void)setStorefrontIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MPMediaLibrary *)self ml3Library];
  [v5 setStorefrontIdentifier:v4];
}

- (NSString)storefrontIdentifier
{
  id v2 = [(MPMediaLibrary *)self ml3Library];
  int64_t v3 = [v2 storefrontIdentifier];

  return (NSString *)v3;
}

- (void)setSagaDatabaseUserVersion:(int64_t)a3
{
  id v4 = [(MPMediaLibrary *)self ml3Library];
  [v4 setSagaDatabaseUserVersion:a3];
}

- (int64_t)sagaDatabaseUserVersion
{
  id v2 = [(MPMediaLibrary *)self ml3Library];
  int64_t v3 = [v2 sagaDatabaseUserVersion];

  return v3;
}

- (void)setSagaLastPlaylistPlayDataUploadDate:(id)a3
{
  id v4 = a3;
  id v5 = [(MPMediaLibrary *)self ml3Library];
  [v5 setSagaLastPlaylistPlayDataUploadDate:v4];
}

- (NSDate)sagaLastPlaylistPlayDataUploadDate
{
  id v2 = [(MPMediaLibrary *)self ml3Library];
  int64_t v3 = [v2 sagaLastPlaylistPlayDataUploadDate];

  return (NSDate *)v3;
}

- (void)setSagaLastItemPlayDataUploadDate:(id)a3
{
  id v4 = a3;
  id v5 = [(MPMediaLibrary *)self ml3Library];
  [v5 setSagaLastItemPlayDataUploadDate:v4];
}

- (NSDate)sagaLastItemPlayDataUploadDate
{
  id v2 = [(MPMediaLibrary *)self ml3Library];
  int64_t v3 = [v2 sagaLastItemPlayDataUploadDate];

  return (NSDate *)v3;
}

- (void)setSagaAccountID:(id)a3
{
  id v4 = a3;
  id v5 = [(MPMediaLibrary *)self ml3Library];
  [v5 setSagaAccountID:v4];
}

- (NSNumber)sagaAccountID
{
  id v2 = [(MPMediaLibrary *)self ml3Library];
  int64_t v3 = [v2 sagaAccountID];

  return (NSNumber *)v3;
}

- (unint64_t)filterAvailableContentGroups:(unint64_t)a3 withOptions:(unint64_t)a4
{
  __int16 v5 = a3;
  v49[3] = *MEMORY[0x1E4F143B8];
  id v7 = +[MPModelSong kindWithVariants:3];
  uint64_t v8 = +[MPModelAlbum kindWithSongKind:v7];
  if (CFPreferencesGetAppBooleanValue(@"showAllTVShows", @"com.apple.Music", 0)) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 2;
  }
  id v47 = +[MPModelTVEpisode kindWithVariants:v9];
  if (CFPreferencesGetAppBooleanValue(@"showAllTVShows", @"com.apple.Music", 0)) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 2;
  }
  uint64_t v11 = +[MPModelMovie kindWithVariants:v10];
  unint64_t v12 = 0;
  if (v5)
  {
    __int16 v13 = [[MPMediaLibraryView alloc] initWithLibrary:self filteringOptions:a4];
    unint64_t v12 = [(MPMediaLibraryView *)v13 hasEntitiesForModelKind:v8];
  }
  long long v46 = (void *)v11;
  if ((v5 & 2) != 0)
  {
    uint64_t v28 = [[MPMediaLibraryView alloc] initWithLibrary:self filteringOptions:a4];
    uint64_t v29 = +[MPModelArtist kindWithAlbumKind:v8];
    BOOL v30 = [(MPMediaLibraryView *)v28 hasEntitiesForModelKind:v29];

    if (v30) {
      v12 |= 2uLL;
    }

    if ((v5 & 4) == 0)
    {
LABEL_11:
      if ((v5 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_38;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_11;
  }
  id v31 = [[MPMediaLibraryView alloc] initWithLibrary:self filteringOptions:a4];
  id v32 = +[MPModelAlbum kindWithVariants:2 songKind:v7];
  BOOL v33 = [(MPMediaLibraryView *)v31 hasEntitiesForModelKind:v32];

  if (v33) {
    v12 |= 4uLL;
  }

  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_38:
  long long v34 = [[MPMediaLibraryView alloc] initWithLibrary:self filteringOptions:a4];
  long long v35 = +[MPModelComposer kindWithAlbumKind:v8];
  BOOL v36 = [(MPMediaLibraryView *)v34 hasEntitiesForModelKind:v35];

  if (v36) {
    v12 |= 8uLL;
  }

  if ((v5 & 0x10) == 0)
  {
LABEL_13:
    if ((v5 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
LABEL_41:
  long long v37 = [[MPMediaLibraryView alloc] initWithLibrary:self filteringOptions:a4];
  long long v38 = +[MPModelGenre kindWithAlbumKind:v8];
  BOOL v39 = [(MPMediaLibraryView *)v37 hasEntitiesForModelKind:v38];

  if (v39) {
    v12 |= 0x10uLL;
  }

  if ((v5 & 0x20) != 0)
  {
LABEL_14:
    uint64_t v14 = [[MPMediaLibraryView alloc] initWithLibrary:self filteringOptions:a4];
    uint64_t v15 = +[MPModelSong kindWithVariants:2];
    BOOL v16 = [(MPMediaLibraryView *)v14 hasEntitiesForModelKind:v15];

    if (v16) {
      v12 |= 0x20uLL;
    }
  }
LABEL_17:
  if ((v5 & 0x40) != 0)
  {
    long long v40 = [[MPMediaLibraryView alloc] initWithLibrary:self filteringOptions:a4];
    v49[0] = v7;
    v49[1] = v47;
    unint64_t v41 = +[MPModelMovie kindWithVariants:2];
    v49[2] = v41;
    uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
    unint64_t v43 = +[MPModelPlaylistEntry kindWithKinds:v42];

    long long v44 = +[MPModelPlaylist kindWithPlaylistEntryKind:v43 options:0];
    LODWORD(v41) = [(MPMediaLibraryView *)v40 hasEntitiesForModelKind:v44];

    if (v41) {
      v12 |= 0x40uLL;
    }

    if ((v5 & 0x80) == 0)
    {
LABEL_19:
      if ((v5 & 0x100) == 0) {
        goto LABEL_23;
      }
      goto LABEL_20;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_19;
  }
  uint64_t v45 = [[MPMediaLibraryView alloc] initWithLibrary:self filteringOptions:a4];
  if ([(MPMediaLibraryView *)v45 hasEntitiesForModelKind:v7]) {
    v12 |= 0x80uLL;
  }

  if ((v5 & 0x100) != 0)
  {
LABEL_20:
    id v17 = [[MPMediaLibraryView alloc] initWithLibrary:self filteringOptions:a4];
    id v18 = +[MPModelTVSeason kindWithEpisodeKind:v47];
    uint64_t v19 = +[MPModelTVShow kindWithSeasonKind:v18];
    BOOL v20 = [(MPMediaLibraryView *)v17 hasEntitiesForModelKind:v19];

    if (v20) {
      v12 |= 0x100uLL;
    }
  }
LABEL_23:
  if ((v5 & 0x200) != 0)
  {
    uint64_t v21 = [[MPMediaLibraryView alloc] initWithLibrary:self filteringOptions:a4];
    if ([(MPMediaLibraryView *)v21 hasEntitiesForModelKind:v46]) {
      v12 |= 0x200uLL;
    }
  }
  if ((v5 & 0x400) != 0)
  {
    id v22 = [[MPMediaLibraryView alloc] initWithLibrary:self filteringOptions:a4];
    uint64_t v48 = v7;
    dispatch_semaphore_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
    id v24 = +[MPModelPlaylistEntry kindWithKinds:v23];

    BOOL v25 = +[MPModelPlaylist kindWithVariants:64 playlistEntryKind:v24 options:0];
    BOOL v26 = [(MPMediaLibraryView *)v22 hasEntitiesForModelKind:v25];

    if (v26) {
      v12 |= 0x400uLL;
    }
  }
  return v12;
}

@end