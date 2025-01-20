@interface MPCloudController
+ (BOOL)isMediaApplication;
+ (MPCloudController)controllerWithUserIdentity:(id)a3;
+ (MPCloudController)sharedCloudController;
+ (NSMutableDictionary)controllers;
+ (OS_dispatch_queue)globalSerialQueue;
+ (id)_controllerWithUserIdentity:(id)a3 createIfRequired:(BOOL)a4;
+ (void)_postNotificationName:(id)a3 controller:(id)a4;
+ (void)_postNotificationName:(id)a3 controller:(id)a4 userInfo:(id)a5;
+ (void)migrateCellularDataPreferencesIfNeeded;
- (BOOL)_handlesSameAccountAs:(id)a3;
- (BOOL)_isCollaborativePlaylist:(unint64_t)a3;
- (BOOL)_updateSagaEnabled;
- (BOOL)canDefaultMediaLibraryShowCloudContent;
- (BOOL)canSetItemProperty:(id)a3;
- (BOOL)canSetPlaylistProperty:(id)a3;
- (BOOL)canShowCloudDownloadButtons;
- (BOOL)canShowCloudMusic;
- (BOOL)canShowCloudVideo;
- (BOOL)hasCloudLockerAccount;
- (BOOL)hasProperNetworkConditionsToPlayMedia;
- (BOOL)hasProperNetworkConditionsToShowCloudMedia;
- (BOOL)hasPurchaseHistoryAccount;
- (BOOL)hasSetPreferenceForAutomaticDownloads;
- (BOOL)isActive;
- (BOOL)isAutomaticDownloadsEnabled;
- (BOOL)isCellularDataRestrictedForMusic;
- (BOOL)isCellularDataRestrictedForStoreApps;
- (BOOL)isCellularDataRestrictedForVideos;
- (BOOL)isCloudEnabled;
- (BOOL)isCloudEnabledValid;
- (BOOL)isCloudLibraryEnabled;
- (BOOL)isCloudLibraryInitialImport;
- (BOOL)isCloudLibraryUpdateInProgress;
- (BOOL)isEnablingCloudLibraryDestructive;
- (BOOL)isEnhancedAudioAvailable;
- (BOOL)isGeniusEnabled;
- (BOOL)isInitialImport;
- (BOOL)isJaliscoInitialImport;
- (BOOL)isJaliscoUpdateInProgress;
- (BOOL)isUpdateInProgress;
- (BOOL)preferencesChangedNotifyTokenIsValid;
- (BOOL)shouldProhibitMusicActionForCurrentNetworkConditions;
- (BOOL)shouldProhibitStoreAppsActionForCurrentNetworkConditions;
- (BOOL)shouldProhibitVideosActionForCurrentNetworkConditions;
- (ICCloudAvailability)cloudAvailabilityController;
- (ICCloudClient)cloudClient;
- (ICConnectionConfiguration)configuration;
- (ICUserIdentity)userIdentity;
- (MPCloudController)init;
- (MSVDistributedNotificationObserver)addToPlaylistBehaviorChangedObserver;
- (MSVDistributedNotificationObserver)favoriteSongAddToLibraryBehaviorChangedObserver;
- (OS_dispatch_queue)cloudClientCallbackQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)serialQueue;
- (id)_initWithUserIdentity:(id)a3;
- (id)_referralForModelObject:(id)a3;
- (id)description;
- (int)preferencesChangedNotifyToken;
- (int64_t)_icFavoriteEntityTypeFromMPEntityType:(int64_t)a3;
- (int64_t)_storeAdamIDForItemWithSagaID:(unint64_t)a3;
- (int64_t)activeCount;
- (int64_t)cloudAddToPlaylistBehavior;
- (int64_t)favoriteSongAddToLibraryBehavior;
- (os_unfair_lock_s)lock;
- (void)_addItemWithAdamID:(int64_t)a3 toCollaborationWithPersistentID:(int64_t)a4 completionHandler:(id)a5;
- (void)_addItemWithSagaID:(unint64_t)a3 toCollaborationWithPersistentID:(int64_t)a4 completionHandler:(id)a5;
- (void)_becomeActiveAndWaitUntilDone:(BOOL)a3;
- (void)_copyObservationStateFrom:(id)a3;
- (void)_initializeUpdateInProgressState;
- (void)_performBlockOnControllerHandlingTheSameAccount:(id)a3;
- (void)_resignActive;
- (void)_setDateModified:(id)a3 forPlaylistPersistentID:(int64_t)a4;
- (void)activeUserDidChangeNotification:(id)a3;
- (void)addGeniusPlaylistWithPersistentID:(unint64_t)a3 name:(id)a4 seedItemSagaIDs:(id)a5 itemSagaIDs:(id)a6 completionHandler:(id)a7;
- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(unint64_t)a4 completionHandler:(id)a5;
- (void)addStoreItemWithAdamID:(int64_t)a3 completionHandler:(id)a4;
- (void)addStoreItemWithAdamID:(int64_t)a3 referralObject:(id)a4 completionHandler:(id)a5;
- (void)addStoreItemWithAdamID:(int64_t)a3 referralObject:(id)a4 toPlaylistWithPersistentID:(unint64_t)a5 completionHandler:(id)a6;
- (void)addStoreItemWithAdamID:(int64_t)a3 toPlaylistWithPersistentID:(unint64_t)a4 completionHandler:(id)a5;
- (void)addStorePlaylistWithGlobalID:(id)a3 completionHandler:(id)a4;
- (void)becomeActive;
- (void)becomeActiveAndWaitUntilDone:(BOOL)a3;
- (void)beginCollaborationUsingPlaylistWithPersistentID:(int64_t)a3 sharingMode:(int64_t)a4 completion:(id)a5;
- (void)canShowCloudDownloadButtonsDidChangeNotification:(id)a3;
- (void)canShowCloudTracksDidChangeNotification:(id)a3;
- (void)createPlaylistWithPersistentID:(unint64_t)a3 properties:(id)a4 trackList:(id)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)deprioritizeArtworkRequestForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 artworkSourceType:(int64_t)a6;
- (void)disableAutomaticDownloadsWithCompletionHandler:(id)a3;
- (void)disableCloudLibraryWithCompletionHandler:(id)a3;
- (void)disableCloudLibraryWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)editCollaborationWithPersistentID:(int64_t)a3 properties:(id)a4 trackEdits:(id)a5 completion:(id)a6;
- (void)enableAutomaticDownloadsWithCompletionHandler:(id)a3;
- (void)enableCloudLibraryWithOptions:(id)a3 completionHandler:(id)a4;
- (void)enableICMLErrorReasonChange:(id)a3;
- (void)endCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4;
- (void)favoriteAlbumWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6;
- (void)favoriteArtistWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6;
- (void)favoriteEntityWithPersistentID:(int64_t)a3 sagaID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7;
- (void)favoriteEntityWithPersistentID:(int64_t)a3 storeID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7;
- (void)favoritePlaylistWithPersistentID:(int64_t)a3 globalID:(id)a4 time:(id)a5 completionHandler:(id)a6;
- (void)fetchRecommendedContentWithSeedTrackID:(int64_t)a3 seedTrackIDType:(int64_t)a4 count:(unint64_t)a5 completion:(id)a6;
- (void)hasProperNetworkConditionsToShowCloudMediaDidChangeNotification:(id)a3;
- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4;
- (void)isCellularDataRestrictedDidChangeNotification:(id)a3;
- (void)joinCollaborationWithGlobalPlaylistID:(id)a3 invitationURL:(id)a4 completion:(id)a5;
- (void)loadArtworkForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 artworkSourceType:(int64_t)a6 completionHandler:(id)a7;
- (void)loadArtworkInfoForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 artworkSourceType:(int64_t)a6 completionHandler:(id)a7;
- (void)loadCloudMusicLibraryUpdateProgressWithCompletionHandler:(id)a3;
- (void)loadGeniusItemsForSagaID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadJaliscoLibraryUpdateProgressWithCompletionHandler:(id)a3;
- (void)loadLastKnownEnableICMLErrorStatusWithCompletionHander:(id)a3;
- (void)loadUpdateProgressWithCompletionHandler:(id)a3;
- (void)processPendingKeyInvalidations;
- (void)publishPlaylistWithSagaID:(unint64_t)a3 completionHandler:(id)a4;
- (void)removeCollaborators:(id)a3 fromCollaborationWithPersistentID:(int64_t)a4 completion:(id)a5;
- (void)removeItemsWithSagaIDs:(id)a3 completionHandler:(id)a4;
- (void)removePlaylistsWithSagaIDs:(id)a3 completionHandler:(id)a4;
- (void)resetInvitationURLForCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4;
- (void)resignActive;
- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(int64_t)a4 withApproval:(BOOL)a5 completion:(id)a6;
- (void)sdk_addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(unint64_t)a4 completionHandler:(id)a5;
- (void)sdk_addStoreItemWithOpaqueID:(id)a3 completionHandler:(id)a4;
- (void)sdk_addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(unint64_t)a4 completionHandler:(id)a5;
- (void)sdk_createPlaylistWithPersistenID:(unint64_t)a3 properties:(id)a4 tracklist:(id)a5 completionHandler:(id)a6;
- (void)sdk_setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistWithPersistentID:(unint64_t)a5 completionHandler:(id)a6;
- (void)setActiveCount:(int64_t)a3;
- (void)setAlbumArtistProperties:(id)a3 forEntityWithPersistentID:(int64_t)a4 completionHandler:(id)a5;
- (void)setAlbumProperties:(id)a3 forEntityWithPersistentID:(int64_t)a4 cloudLibraryID:(id)a5 completionHandler:(id)a6;
- (void)setCanDefaultMediaLibraryShowCloudContent:(BOOL)a3;
- (void)setCanShowCloudDownloadButtons:(BOOL)a3;
- (void)setCanShowCloudMusic:(BOOL)a3;
- (void)setCanShowCloudVideo:(BOOL)a3;
- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 completionHandler:(id)a4;
- (void)setCloudEnabled:(BOOL)a3;
- (void)setCloudEnabledValid:(BOOL)a3;
- (void)setCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3 completionHandler:(id)a4;
- (void)setCloudLibraryInitialImport:(BOOL)a3;
- (void)setCloudLibraryUpdateInProgress:(BOOL)a3;
- (void)setCloudLockerAccount:(BOOL)a3;
- (void)setCollectionProperties:(id)a3 forCollectionWithPersistentID:(int64_t)a4 groupingType:(int64_t)a5 completionHandler:(id)a6;
- (void)setInitialImport:(BOOL)a3;
- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4;
- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4;
- (void)setJaliscoInitialImport:(BOOL)a3;
- (void)setJaliscoUpdateInProgress:(BOOL)a3;
- (void)setLikedState:(int64_t)a3 forAlbumWithStoreID:(int64_t)a4;
- (void)setLikedState:(int64_t)a3 forAlbumWithStoreID:(int64_t)a4 completion:(id)a5;
- (void)setLikedState:(int64_t)a3 forAlbumWithStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 completion:(id)a7;
- (void)setLikedState:(int64_t)a3 forArtistWithStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 completion:(id)a7;
- (void)setLikedState:(int64_t)a3 forEntityWithStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 completion:(id)a7;
- (void)setLikedState:(int64_t)a3 forEntityWithStoreID:(int64_t)a4 withMediaType:(unint64_t)a5 timeStamp:(id)a6;
- (void)setLikedState:(int64_t)a3 forEntityWithStoreID:(int64_t)a4 withMediaType:(unint64_t)a5 timeStamp:(id)a6 completion:(id)a7;
- (void)setLikedState:(int64_t)a3 forPlaylistWithGlobalID:(id)a4;
- (void)setLikedState:(int64_t)a3 forPlaylistWithGlobalID:(id)a4 completion:(id)a5;
- (void)setLikedState:(int64_t)a3 forPlaylistWithGlobalID:(id)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 completion:(id)a7;
- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistWithPersistentID:(unint64_t)a5 completionHandler:(id)a6;
- (void)setPreferencesChangedNotifyToken:(int)a3;
- (void)setPreferencesChangedNotifyTokenIsValid:(BOOL)a3;
- (void)setPurchaseHistoryAccount:(BOOL)a3;
- (void)setUpdateInProgress:(BOOL)a3;
- (void)updateJaliscoMediaLibraryWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)updateSharingMode:(int64_t)a3 onCollaboratinWithPersistentID:(int64_t)a4 completion:(id)a5;
- (void)updateSubscribedPlaylistWithSagaID:(unint64_t)a3 ignoreMinRefreshInterval:(BOOL)a4 completionHandler:(id)a5;
- (void)uploadArtworkForPlaylist:(id)a3 completionHandler:(id)a4;
- (void)uploadCloudItemProperties;
- (void)uploadCloudPlaylistProperties;
@end

@implementation MPCloudController

- (BOOL)hasProperNetworkConditionsToShowCloudMedia
{
  return [(ICCloudAvailability *)self->_cloudAvailabilityController hasProperNetworkConditionsToShowCloudMedia];
}

- (BOOL)shouldProhibitMusicActionForCurrentNetworkConditions
{
  return [(ICCloudAvailability *)self->_cloudAvailabilityController shouldProhibitMusicActionForCurrentNetworkConditions];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)MPCloudController;
  v3 = [(MPCloudController *)&v7 description];
  if ([MEMORY[0x1E4FB87C0] canAccessAccountStore])
  {
    v4 = [(MPCloudController *)self userIdentity];
    uint64_t v5 = [v3 stringByAppendingFormat:@" [%@]", v4];

    v3 = (void *)v5;
  }

  return v3;
}

- (void)_initializeUpdateInProgressState
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(MPCloudController *)self isCloudEnabled])
  {
    v3 = [(MPCloudController *)self cloudClient];
    v4 = [v3 updateSagaInProgressChangedHandler];

    if (!v4)
    {
      uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v24 = self;
        _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - _initializeUpdateInProgressState - Setting up Saga update progress handler", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __53__MPCloudController__initializeUpdateInProgressState__block_invoke;
      v21[3] = &unk_1E57F5F60;
      objc_copyWeak(&v22, (id *)buf);
      v6 = (void *)MEMORY[0x19971E0F0](v21);
      objc_super v7 = [(MPCloudController *)self cloudClient];
      [v7 loadIsSagaUpdateInProgressWithCompletionHandler:v6];

      v8 = [(MPCloudController *)self cloudClient];
      [v8 setUpdateSagaInProgressChangedHandler:v6];

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
  }
  v9 = [(MPCloudController *)self cloudClient];
  v10 = [v9 updateJaliscoInProgressChangedHandler];
  BOOL v11 = v10 == 0;

  if (v11)
  {
    v12 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = self;
      _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - _initializeUpdateInProgressState - Setting up Jalisco update progress handler", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __53__MPCloudController__initializeUpdateInProgressState__block_invoke_234;
    v19 = &unk_1E57F5F60;
    objc_copyWeak(&v20, (id *)buf);
    v13 = (void *)MEMORY[0x19971E0F0](&v16);
    v14 = [(MPCloudController *)self cloudClient];
    [v14 loadIsJaliscoUpdateInProgressWithCompletionHandler:v13];

    v15 = [(MPCloudController *)self cloudClient];
    [v15 setUpdateJaliscoInProgressChangedHandler:v13];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

- (ICUserIdentity)userIdentity
{
  v2 = [(MPCloudController *)self cloudClient];
  v3 = [v2 configuration];
  v4 = [v3 userIdentity];

  return (ICUserIdentity *)v4;
}

- (ICCloudClient)cloudClient
{
  return self->_cloudClient;
}

- (BOOL)isCloudEnabled
{
  return self->_cloudEnabled;
}

+ (MPCloudController)controllerWithUserIdentity:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543618;
    id v11 = a1;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_INFO, "%{public}@ - Request for a controller with user identity %@", (uint8_t *)&v10, 0x16u);
  }

  v6 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  char v7 = [v6 supportsMultipleITunesAccounts];

  if (v7) {
    +[MPCloudController _controllerWithUserIdentity:v4 createIfRequired:1];
  }
  else {
  v8 = +[MPCloudController sharedCloudController];
  }

  return (MPCloudController *)v8;
}

+ (MPCloudController)sharedCloudController
{
  if (sharedCloudController_onceToken != -1) {
    dispatch_once(&sharedCloudController_onceToken, &__block_literal_global_108_38922);
  }
  v2 = (void *)sharedCloudController___controller;

  return (MPCloudController *)v2;
}

- (BOOL)canShowCloudVideo
{
  return [(ICCloudAvailability *)self->_cloudAvailabilityController canShowCloudVideo];
}

- (BOOL)canShowCloudMusic
{
  return [(ICCloudAvailability *)self->_cloudAvailabilityController canShowCloudMusic];
}

- (void)becomeActive
{
}

- (BOOL)isEnhancedAudioAvailable
{
  return CFPreferencesGetAppBooleanValue(@"EnhancedAudioAvailable", @"com.apple.mobileipod", 0) != 0;
}

void __42__MPCloudController_sharedCloudController__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v0 = [[MPCloudController alloc] _initWithUserIdentity:0];
  v1 = (void *)sharedCloudController___controller;
  sharedCloudController___controller = (uint64_t)v0;

  v2 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138543362;
    uint64_t v4 = sharedCloudController___controller;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - Singleton", (uint8_t *)&v3, 0xCu);
  }
}

- (id)_initWithUserIdentity:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)MPCloudController;
  uint64_t v5 = [(MPCloudController *)&v40 init];
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v42 = v5;
      __int16 v43 = 2112;
      id v44 = v4;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - Creating new controller for user identity %@", buf, 0x16u);
    }

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mediaplayer.MPCloudController.serial.queue", 0);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.mediaplayer.MPCloudController.cloudClient.callback.queue", 0);
    cloudClientCallbackQueue = v5->_cloudClientCallbackQueue;
    v5->_cloudClientCallbackQueue = (OS_dispatch_queue *)v9;

    v5->_lock._os_unfair_lock_opaque = 0;
    if (v4) {
      id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB85F0]) initWithUserIdentity:v4];
    }
    else {
      id v11 = 0;
    }
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB85C8]) initWithConfiguration:v11];
    cloudClient = v5->_cloudClient;
    v5->_cloudClient = (ICCloudClient *)v12;

    if (+[MPCloudController isMediaApplication])
    {
      uint64_t v14 = [MEMORY[0x1E4FB85C0] sharedController];
      cloudAvailabilityController = v5->_cloudAvailabilityController;
      v5->_cloudAvailabilityController = (ICCloudAvailability *)v14;

      uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 addObserver:v5 selector:sel_canShowCloudDownloadButtonsDidChangeNotification_ name:*MEMORY[0x1E4FB83A8] object:0];

      uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v17 addObserver:v5 selector:sel_canShowCloudTracksDidChangeNotification_ name:*MEMORY[0x1E4FB83B0] object:0];

      v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v18 addObserver:v5 selector:sel_isCellularDataRestrictedDidChangeNotification_ name:*MEMORY[0x1E4FB83C0] object:0];

      v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v19 addObserver:v5 selector:sel_hasProperNetworkConditionsToShowCloudMediaDidChangeNotification_ name:*MEMORY[0x1E4FB83B8] object:0];

      id v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v20 addObserver:v5 selector:sel_hasProperNetworkConditionsToShowCloudMediaDidChangeNotification_ name:*MEMORY[0x1E4FB83C8] object:0];

      v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v21 addObserver:v5 selector:sel_enableICMLErrorReasonChange_ name:*MEMORY[0x1E4FB83E0] object:0];
    }
    else
    {
      objc_storeStrong((id *)&v5->_cloudAvailabilityController, v5->_cloudClient);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)__MPCloudControllerReceivedRemoteNotification, (CFStringRef)*MEMORY[0x1E4FB83A8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v23 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v23, v5, (CFNotificationCallback)__MPCloudControllerReceivedRemoteNotification, (CFStringRef)*MEMORY[0x1E4FB83B0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v24 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v24, v5, (CFNotificationCallback)__MPCloudControllerReceivedRemoteNotification, (CFStringRef)*MEMORY[0x1E4FB83C0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v25 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v25, v5, (CFNotificationCallback)__MPCloudControllerReceivedRemoteNotification, (CFStringRef)*MEMORY[0x1E4FB83B8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v26 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v26, v5, (CFNotificationCallback)__MPCloudControllerReceivedRemoteNotification, (CFStringRef)*MEMORY[0x1E4FB83E0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    v27 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v27, v5, (CFNotificationCallback)__MPCloudControllerReceivedRemoteNotification, (CFStringRef)*MEMORY[0x1E4FB83F0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v28 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v28, v5, (CFNotificationCallback)__MPCloudControllerReceivedRemoteNotification, (CFStringRef)*MEMORY[0x1E4FB83F8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v29 = (void *)MEMORY[0x1E4F77988];
    uint64_t v30 = *MEMORY[0x1E4FB83D0];
    v31 = dispatch_get_global_queue(0, 0);
    uint64_t v32 = [v29 observerWithDistributedName:v30 localName:@"MPCloudControllerCloudAddToPlaylistBehaviorDidChangeNotification" queue:v31];
    addToPlaylistBehaviorChangedObserver = v5->_addToPlaylistBehaviorChangedObserver;
    v5->_addToPlaylistBehaviorChangedObserver = (MSVDistributedNotificationObserver *)v32;

    uint64_t v34 = [MEMORY[0x1E4F77988] observerWithDistributedName:*MEMORY[0x1E4FB83D8] localName:@"MPCloudControllerCloudFavoriteSongAddToLibraryBehaviorDidChangeNotification" queue:v31];
    favoriteSongAddToLibraryBehaviorChangedObserver = v5->_favoriteSongAddToLibraryBehaviorChangedObserver;
    v5->_favoriteSongAddToLibraryBehaviorChangedObserver = (MSVDistributedNotificationObserver *)v34;

    if ([MEMORY[0x1E4FB87C0] canAccessAccountStore])
    {
      v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v37 = *MEMORY[0x1E4FB8350];
      v38 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
      [v36 addObserver:v5 selector:sel_activeUserDidChangeNotification_ name:v37 object:v38];
    }
  }

  return v5;
}

+ (BOOL)isMediaApplication
{
  if (isMediaApplication_onceToken != -1) {
    dispatch_once(&isMediaApplication_onceToken, &__block_literal_global_66_38925);
  }
  return isMediaApplication_isMediaApplication;
}

void *__51__MPCloudController__becomeActiveAndWaitUntilDone___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  result = *(void **)(a1 + 32);
  if (!result[7])
  {
    int v3 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v4;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - _becomeActiveAndWaitUntilDone: - Activating", (uint8_t *)&v7, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
    uint64_t v5 = [*(id *)(a1 + 32) cloudClient];
    [v5 becomeActive];

    char v6 = [*(id *)(a1 + 32) _updateSagaEnabled];
    result = *(void **)(a1 + 32);
    if ((v6 & 1) == 0)
    {
      [result _initializeUpdateInProgressState];
      result = *(void **)(a1 + 32);
    }
  }
  ++result[7];
  return result;
}

- (BOOL)isCloudLibraryEnabled
{
  return self->_cloudEnabled;
}

- (BOOL)_updateSagaEnabled
{
  *(void *)&v29[5] = *MEMORY[0x1E4F143B8];
  int v3 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL cloudEnabled = self->_cloudEnabled;
    *(_DWORD *)buf = 138543618;
    v27 = self;
    __int16 v28 = 1024;
    *(_DWORD *)v29 = cloudEnabled;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - _updateSagaEnabled: - loading cloud library enabled state [current cloudEnabled=%{BOOL}u]", buf, 0x12u);
  }

  uint64_t v5 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  char v6 = [(MPCloudController *)self userIdentity];
  id v25 = 0;
  int v7 = [v5 getPropertiesForUserIdentity:v6 error:&v25];
  id v8 = v25;

  if (!v8)
  {
    os_unfair_lock_lock(&self->_lock);
    if (v7) {
      int v12 = [v7 isActiveLocker];
    }
    else {
      int v12 = 0;
    }
    int v13 = self->_cloudEnabled;
    if (v13 == v12)
    {
      uint64_t v14 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = self;
        v15 = "%{public}@ - _updateSagaEnabled: - no change in cloud library enabled state";
        uint64_t v16 = v14;
        uint32_t v17 = 12;
LABEL_19:
        _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      }
    }
    else
    {
      self->_BOOL cloudEnabled = v12;
      BOOL cloudEnabledValid = self->_cloudEnabledValid;
      uint64_t v14 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      BOOL v19 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (cloudEnabledValid)
      {
        if (v19)
        {
          BOOL v20 = self->_cloudEnabled;
          *(_DWORD *)buf = 138543874;
          v27 = self;
          __int16 v28 = 1024;
          *(_DWORD *)v29 = v13;
          v29[2] = 1024;
          *(_DWORD *)&v29[3] = v20;
          _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - _updateSagaEnabled: - Cloud library enabled state did change [%{BOOL}u -> %{BOOL}u] - Posting notifications [MPCloudControllerIsCloudEnabledDidChangeNotification]", buf, 0x18u);
        }

        [(MPCloudController *)self _initializeUpdateInProgressState];
        cloudClientCallbackQueue = self->_cloudClientCallbackQueue;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __39__MPCloudController__updateSagaEnabled__block_invoke;
        v24[3] = &unk_1E57F9EA8;
        v24[4] = self;
        dispatch_async(cloudClientCallbackQueue, v24);
        BOOL v11 = 1;
        goto LABEL_21;
      }
      if (v19)
      {
        BOOL v22 = self->_cloudEnabled;
        *(_DWORD *)buf = 138543618;
        v27 = self;
        __int16 v28 = 1024;
        *(_DWORD *)v29 = v22;
        v15 = "%{public}@ - _updateSagaEnabled: - loaded initial cloud library enabled state [cloudEnabled=%{BOOL}u]";
        uint64_t v16 = v14;
        uint32_t v17 = 18;
        goto LABEL_19;
      }
    }

    BOOL v11 = 0;
LABEL_21:
    self->_BOOL cloudEnabledValid = 1;
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_22;
  }
  uint64_t v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v10 = objc_msgSend(v8, "msv_description");
    *(_DWORD *)buf = 138543618;
    v27 = self;
    __int16 v28 = 2114;
    *(void *)v29 = v10;
    _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_ERROR, "%{public}@ _updateSagaEnabled Failed to load account properties error=%{public}@", buf, 0x16u);
  }
  BOOL v11 = 0;
LABEL_22:

  return v11;
}

void __53__MPCloudController__initializeUpdateInProgressState__block_invoke_2_235(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = *(unsigned char *)(a1 + 40) && (unint64_t)(*(unsigned char *)(a1 + 41) != 0);
    [WeakRetained setJaliscoInitialImport:v4];
    int v5 = [v3 isJaliscoUpdateInProgress];
    int v6 = *(unsigned __int8 *)(a1 + 40);
    if (v6 != v5)
    {
      [v3 setJaliscoUpdateInProgress:v6 != 0];
      int v7 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138543874;
        uint64_t v9 = v3;
        __int16 v10 = 1024;
        int v11 = [v3 isJaliscoUpdateInProgress];
        __int16 v12 = 1024;
        int v13 = [v3 isJaliscoInitialImport];
        _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting JaliscoLibraryUpdateInProgress to %{BOOL}u JaliscoLibraryInitialImport to %{BOOL}u - Posting MPCloudControllerIsUpdateInProgressDidChangeNotification [Jalisco]", (uint8_t *)&v8, 0x18u);
      }

      +[MPCloudController _postNotificationName:@"MPCloudControllerIsUpdateInProgressDidChangeNotification" controller:v3];
    }
  }
}

- (BOOL)isJaliscoUpdateInProgress
{
  return self->_jaliscoUpdateInProgress;
}

- (BOOL)isInitialImport
{
  return self->_cloudLibraryInitialImport || self->_jaliscoInitialImport;
}

- (BOOL)isUpdateInProgress
{
  return self->_cloudLibraryUpdateInProgress || self->_jaliscoUpdateInProgress;
}

- (void)setJaliscoInitialImport:(BOOL)a3
{
  self->_jaliscoInitialImport = a3;
}

- (void)setJaliscoUpdateInProgress:(BOOL)a3
{
  self->_jaliscoUpdateInProgress = a3;
}

- (BOOL)isJaliscoInitialImport
{
  return self->_jaliscoInitialImport;
}

+ (void)_postNotificationName:(id)a3 controller:(id)a4 userInfo:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    __int16 v10 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - Posting notification [%@]", buf, 0x16u);
    }

    int v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:v7 object:v8];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__MPCloudController__postNotificationName_controller_userInfo___block_invoke;
    v13[3] = &unk_1E57F5D80;
    id v14 = v7;
    [v8 _performBlockOnControllerHandlingTheSameAccount:v13];
  }
  else
  {
    __int16 v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:v7 object:0 userInfo:v9];
  }
}

- (void)_performBlockOnControllerHandlingTheSameAccount:(id)a3
{
  id v14 = (void (**)(id, void *))a3;
  BOOL v4 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  int v5 = [v4 supportsMultipleITunesAccounts];

  if (v5)
  {
    int v6 = +[MPCloudController sharedCloudController];
    if (v6 == self)
    {
    }
    else
    {
      id v7 = v6;
      id v8 = +[MPCloudController sharedCloudController];
      BOOL v9 = [(MPCloudController *)self _handlesSameAccountAs:v8];

      if (v9)
      {
        __int16 v10 = +[MPCloudController sharedCloudController];
        if (!v10) {
          goto LABEL_10;
        }
LABEL_9:
        v14[2](v14, v10);

        goto LABEL_10;
      }
    }
    int v11 = +[MPCloudController sharedCloudController];

    if (v11 == self)
    {
      __int16 v12 = +[MPCloudController sharedCloudController];
      int v13 = [v12 userIdentity];
      __int16 v10 = +[MPCloudController _controllerWithUserIdentity:v13 createIfRequired:0];

      if (v10) {
        goto LABEL_9;
      }
    }
  }
LABEL_10:
}

+ (void)_postNotificationName:(id)a3 controller:(id)a4
{
}

- (BOOL)isEnablingCloudLibraryDestructive
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v2 = [(MPCloudController *)self userIdentity];
  uint64_t v3 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v2];

  BOOL v4 = +[MPMediaQuery songsQuery];
  [v4 setMediaLibrary:v3];
  char v17 = 1;
  [v4 setIgnoreSystemFilterPredicates:1];
  int v5 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ED2F8 forProperty:@"purchaseHistoryID" comparisonType:0];
  [v4 addFilterPredicate:v5];

  int v6 = +[MPMediaQuery playlistsQuery];
  id v16 = (void *)v3;
  [v6 setMediaLibrary:v3];
  [v6 setIgnoreSystemFilterPredicates:1];
  id v7 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ED2F8 forProperty:@"distinguishedKind" comparisonType:0];
  v19[0] = v7;
  id v8 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ED310 forProperty:@"distinguishedKind" comparisonType:102];
  v18[0] = v8;
  BOOL v9 = +[MPMediaPropertyPredicate predicateWithValue:&unk_1EE6ED328 forProperty:@"distinguishedKind" comparisonType:104];
  v18[1] = v9;
  __int16 v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  int v11 = +[MPMediaCompoundPredicate predicateMatchingPredicates:v10];
  v19[1] = v11;
  __int16 v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  int v13 = +[MPMediaCompoundPredicate predicateMatchingPredicates:v12];

  [v6 addFilterPredicate:v13];
  id v14 = +[MPMediaPropertyPredicate predicateWithValue:MEMORY[0x1E4F1CC28] forProperty:@"isHidden" comparisonType:0];
  [v6 addFilterPredicate:v14];

  if (([v4 _hasItems] & 1) == 0) {
    char v17 = [v6 _hasCollections];
  }

  return v17;
}

+ (void)migrateCellularDataPreferencesIfNeeded
{
  uint64_t v2 = ICCloudClientMigrateAllowMatchOnCellularToAllowAutoDownloadOnCellular();

  MEMORY[0x1F4177C08](v2);
}

- (void)becomeActiveAndWaitUntilDone:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = +[MPCloudController sharedCloudController];

  if (v5 == self)
  {
    [(MPCloudController *)self _becomeActiveAndWaitUntilDone:v3];
    int v6 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
    int v7 = [v6 supportsMultipleITunesAccounts];

    if (v7)
    {
      id v8 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
      int v9 = [v8 isAudioAccessory];

      if (v9)
      {
        __int16 v10 = +[MPCloudController globalSerialQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __50__MPCloudController_becomeActiveAndWaitUntilDone___block_invoke;
        block[3] = &__block_descriptor_33_e5_v8__0l;
        BOOL v14 = v3;
        dispatch_sync(v10, block);
      }
      else
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __50__MPCloudController_becomeActiveAndWaitUntilDone___block_invoke_3;
        v11[3] = &__block_descriptor_33_e27_v16__0__MPCloudController_8l;
        BOOL v12 = v3;
        [(MPCloudController *)self _performBlockOnControllerHandlingTheSameAccount:v11];
      }
    }
  }
}

- (void)_becomeActiveAndWaitUntilDone:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MPCloudController__becomeActiveAndWaitUntilDone___block_invoke;
  block[3] = &unk_1E57F9EA8;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

void __53__MPCloudController__initializeUpdateInProgressState__block_invoke_234(uint64_t a1, char a2, char a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__MPCloudController__initializeUpdateInProgressState__block_invoke_2_235;
  v5[3] = &unk_1E57F5F38;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  char v7 = a2;
  char v8 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
  objc_destroyWeak(&v6);
}

- (void)processPendingKeyInvalidations
{
  id v2 = [(MPCloudController *)self cloudClient];
  [v2 processPendingKeyInvalidations];
}

void __39__MPCloudController_isMediaApplication__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 bundleIdentifier];

  isMediaApplication_isMediaApplication = [&unk_1EE6EE030 containsObject:v1];
}

- (void)updateJaliscoMediaLibraryWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v13 = a4;
  char v7 = [(MPCloudController *)self cloudClient];

  if (v7)
  {
    uint64_t v8 = 6;
    if (a3 != 1) {
      uint64_t v8 = 0;
    }
    if (a3) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 3;
    }
    if (!v9)
    {
      BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MPCloudController.m", 1366, @"Invalid update reason: %ld", a3);
    }
    __int16 v10 = [(MPCloudController *)self cloudClient];
    [v10 updateJaliscoLibraryWithReason:v9 completionHandler:v13];
  }
  else
  {
    int v11 = v13;
    if (!v13) {
      goto LABEL_13;
    }
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
  int v11 = v13;
LABEL_13:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoriteSongAddToLibraryBehaviorChangedObserver, 0);
  objc_storeStrong((id *)&self->_addToPlaylistBehaviorChangedObserver, 0);
  objc_storeStrong((id *)&self->_cloudClientCallbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cloudAvailabilityController, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_cloudClient, 0);
}

- (void)setCloudEnabledValid:(BOOL)a3
{
  self->_BOOL cloudEnabledValid = a3;
}

- (BOOL)isCloudEnabledValid
{
  return self->_cloudEnabledValid;
}

- (MSVDistributedNotificationObserver)favoriteSongAddToLibraryBehaviorChangedObserver
{
  return self->_favoriteSongAddToLibraryBehaviorChangedObserver;
}

- (MSVDistributedNotificationObserver)addToPlaylistBehaviorChangedObserver
{
  return self->_addToPlaylistBehaviorChangedObserver;
}

- (OS_dispatch_queue)cloudClientCallbackQueue
{
  return self->_cloudClientCallbackQueue;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setPreferencesChangedNotifyTokenIsValid:(BOOL)a3
{
  self->_preferencesChangedNotifyTokenIsValid = a3;
}

- (BOOL)preferencesChangedNotifyTokenIsValid
{
  return self->_preferencesChangedNotifyTokenIsValid;
}

- (void)setPreferencesChangedNotifyToken:(int)a3
{
  self->_preferencesChangedNotifyToken = a3;
}

- (int)preferencesChangedNotifyToken
{
  return self->_preferencesChangedNotifyToken;
}

- (void)setActiveCount:(int64_t)a3
{
  self->_activeCount = a3;
}

- (int64_t)activeCount
{
  return self->_activeCount;
}

- (ICCloudAvailability)cloudAvailabilityController
{
  return self->_cloudAvailabilityController;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setCloudLibraryInitialImport:(BOOL)a3
{
  self->_cloudLibraryInitialImport = a3;
}

- (void)setCloudLibraryUpdateInProgress:(BOOL)a3
{
  self->_cloudLibraryUpdateInProgress = a3;
}

- (void)setInitialImport:(BOOL)a3
{
  self->_initialImport = a3;
}

- (void)setUpdateInProgress:(BOOL)a3
{
  self->_updateInProgress = a3;
}

- (void)setPurchaseHistoryAccount:(BOOL)a3
{
  self->_purchaseHistoryAccount = a3;
}

- (void)setCloudLockerAccount:(BOOL)a3
{
  self->_cloudLockerAccount = a3;
}

- (void)setCloudEnabled:(BOOL)a3
{
  self->_BOOL cloudEnabled = a3;
}

- (void)setCanShowCloudVideo:(BOOL)a3
{
  self->_canShowCloudVideo = a3;
}

- (void)setCanShowCloudMusic:(BOOL)a3
{
  self->_canShowCloudMusic = a3;
}

- (void)setCanDefaultMediaLibraryShowCloudContent:(BOOL)a3
{
  self->_canDefaultMediaLibraryShowCloudContent = a3;
}

- (void)setCanShowCloudDownloadButtons:(BOOL)a3
{
  self->_canShowCloudDownloadButtons = a3;
}

- (int64_t)_storeAdamIDForItemWithSagaID:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v5 = [(MPCloudController *)self userIdentity];
  id v6 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v5];

  char v7 = +[MPMediaQuery songsQuery];
  [v7 setMediaLibrary:v6];
  uint64_t v8 = [NSNumber numberWithUnsignedLongLong:a3];
  uint64_t v9 = +[MPMediaPropertyPredicate predicateWithValue:v8 forProperty:@"storeSagaID"];
  [v7 addFilterPredicate:v9];

  [v7 setIgnoreRestrictionsPredicates:1];
  [v7 setIgnoreSystemFilterPredicates:1];
  __int16 v10 = [v7 items];
  int v11 = [v10 firstObject];

  if (v11)
  {
    BOOL v12 = [v11 valueForProperty:@"subscriptionStoreItemAdamID"];
    int64_t v13 = [v12 longLongValue];

    if (!v13)
    {
      BOOL v14 = [v11 valueForProperty:@"storeItemAdamID"];
      int64_t v13 = [v14 longLongValue];
    }
  }
  else
  {
    v15 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543618;
      id v18 = self;
      __int16 v19 = 2048;
      unint64_t v20 = a3;
      _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - failed to find song with saga ID %lld", (uint8_t *)&v17, 0x16u);
    }

    int64_t v13 = 0;
  }

  return v13;
}

- (BOOL)_isCollaborativePlaylist:(unint64_t)a3
{
  BOOL v4 = [(MPCloudController *)self userIdentity];
  int v5 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v4];

  id v6 = [[MPMediaPlaylist alloc] initWithPersistentID:a3 mediaLibrary:v5];
  char v7 = [(MPMediaPlaylist *)v6 valueForProperty:@"isCollaborative"];
  char v8 = [v7 BOOLValue];

  return v8;
}

- (void)_addItemWithSagaID:(unint64_t)a3 toCollaborationWithPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  __int16 v10 = (void (**)(id, void *))a5;
  int64_t v8 = [(MPCloudController *)self _storeAdamIDForItemWithSagaID:a3];
  if (v8)
  {
    [(MPCloudController *)self _addItemWithAdamID:v8 toCollaborationWithPersistentID:a4 completionHandler:v10];
  }
  else
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPErrorDomain", 4, @"failed to find song with given saga ID");
    v10[2](v10, v9);
  }
}

- (void)_addItemWithAdamID:(int64_t)a3 toCollaborationWithPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x1E4FB85D0];
  __int16 v10 = (void *)[MEMORY[0x1E4FB85D0] newIdentifierString];
  int v11 = (void *)[MEMORY[0x1E4FB85D0] newIdentifierString];
  BOOL v12 = [v9 paramsForAddingTrackWithAdamID:a3 itemUUID:v10 itemPositionUUID:v11 atPosition:2];

  v17[0] = v12;
  int64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__MPCloudController__addItemWithAdamID_toCollaborationWithPersistentID_completionHandler___block_invoke;
  v15[3] = &unk_1E57F90A0;
  id v16 = v8;
  id v14 = v8;
  [(MPCloudController *)self editCollaborationWithPersistentID:a4 properties:MEMORY[0x1E4F1CC08] trackEdits:v13 completion:v15];
}

uint64_t __90__MPCloudController__addItemWithAdamID_toCollaborationWithPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_resignActive
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__MPCloudController__resignActive__block_invoke;
  block[3] = &unk_1E57F9EA8;
  void block[4] = self;
  dispatch_async(serialQueue, block);
}

void __34__MPCloudController__resignActive__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 56);
  BOOL v3 = v2 < 1;
  uint64_t v4 = v2 - 1;
  if (!v3)
  {
    *(void *)(v1 + 56) = v4;
    if (!*(void *)(*(void *)(a1 + 32) + 56))
    {
      id v6 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v15 = v7;
        _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - _resignActive - Resigning", buf, 0xCu);
      }

      id v8 = [*(id *)(a1 + 32) cloudClient];
      [v8 resignActive];

      uint64_t v9 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
      char v10 = [v9 supportsMultipleITunesAccounts];

      if ((v10 & 1) == 0)
      {
        int v11 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
        BOOL v12 = [*(id *)(a1 + 32) userIdentity];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __34__MPCloudController__resignActive__block_invoke_240;
        v13[3] = &unk_1E57F5F88;
        void v13[4] = *(void *)(a1 + 32);
        [v11 getPropertiesForUserIdentity:v12 completionHandler:v13];
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
    }
  }
}

void __34__MPCloudController__resignActive__block_invoke_240(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!a3 && ([a2 isActive] & 1) == 0)
  {
    uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - _resignActive - Removing update handlers on inactive account", (uint8_t *)&v8, 0xCu);
    }

    id v6 = [*(id *)(a1 + 32) cloudClient];
    [v6 setUpdateSagaInProgressChangedHandler:0];

    uint64_t v7 = [*(id *)(a1 + 32) cloudClient];
    [v7 setUpdateJaliscoInProgressChangedHandler:0];
  }
}

- (BOOL)_handlesSameAccountAs:(id)a3
{
  uint64_t v4 = (MPCloudController *)a3;
  uint64_t v5 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  int v6 = [v5 supportsMultipleITunesAccounts];

  char v7 = 0;
  if (self != v4 && v6)
  {
    int v8 = [(MPCloudController *)self userIdentity];
    uint64_t v9 = [v8 accountDSID];
    uint64_t v10 = [(MPCloudController *)v4 userIdentity];
    int v11 = [v10 accountDSID];
    if (v9 == v11) {
      char v7 = 1;
    }
    else {
      char v7 = [v9 isEqual:v11];
    }
  }
  return v7;
}

- (void)_copyObservationStateFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  int v6 = [v5 supportsMultipleITunesAccounts];

  if (v6)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    char v7 = v4[5];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    int v11 = __47__MPCloudController__copyObservationStateFrom___block_invoke;
    BOOL v12 = &unk_1E57F9F20;
    id v14 = &v15;
    int64_t v13 = v4;
    dispatch_sync(v7, &v9);
    if (v16[3])
    {
      unint64_t v8 = 0;
      do
      {
        -[MPCloudController _becomeActiveAndWaitUntilDone:](self, "_becomeActiveAndWaitUntilDone:", 0, v9, v10, v11, v12);
        ++v8;
      }
      while (v8 < v16[3]);
    }

    _Block_object_dispose(&v15, 8);
  }
}

uint64_t __47__MPCloudController__copyObservationStateFrom___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 56);
  return result;
}

- (int64_t)_icFavoriteEntityTypeFromMPEntityType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (void)_setDateModified:(id)a3 forPlaylistPersistentID:(int64_t)a4
{
  id v6 = a3;
  char v7 = [(MPCloudController *)self userIdentity];
  id v9 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v7];

  unint64_t v8 = [[MPMediaPlaylist alloc] initWithPersistentID:a4 mediaLibrary:v9];
  [(MPMediaItemCollection *)v8 setValue:v6 forProperty:@"dateModified"];
}

- (id)_referralForModelObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = v3;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v3 flattenedGenericObject];
    uint64_t v4 = [v5 anyObject];
  }
  id v6 = [v4 identifiers];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v7 = [v6 universalStore];
    unint64_t v8 = [v7 globalPlaylistID];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FB85B8];
      int v11 = [v6 universalStore];
      BOOL v12 = [v11 globalPlaylistID];
      int64_t v13 = [v10 referralWithPlaylistGlobalID:v12];

LABEL_9:
      goto LABEL_11;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [v6 universalStore];
      uint64_t v15 = [v14 adamID];

      if (v15 >= 1)
      {
        uint64_t v16 = (void *)MEMORY[0x1E4FB85B8];
        int v11 = [v6 universalStore];
        int64_t v13 = objc_msgSend(v16, "referralWithAlbumAdamID:", objc_msgSend(v11, "adamID"));
        goto LABEL_9;
      }
    }
  }
  int64_t v13 = 0;
LABEL_11:

  return v13;
}

void __53__MPCloudController__initializeUpdateInProgressState__block_invoke(uint64_t a1, char a2, char a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__MPCloudController__initializeUpdateInProgressState__block_invoke_2;
  v5[3] = &unk_1E57F5F38;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  char v7 = a2;
  char v8 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
  objc_destroyWeak(&v6);
}

void __53__MPCloudController__initializeUpdateInProgressState__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = *(unsigned char *)(a1 + 40) && (unint64_t)(*(unsigned char *)(a1 + 41) != 0);
    [WeakRetained setCloudLibraryInitialImport:v4];
    int v5 = [v3 isCloudLibraryUpdateInProgress];
    int v6 = *(unsigned __int8 *)(a1 + 40);
    if (v6 != v5)
    {
      [v3 setCloudLibraryUpdateInProgress:v6 != 0];
      char v7 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138543874;
        uint64_t v9 = v3;
        __int16 v10 = 1024;
        int v11 = [v3 isCloudLibraryUpdateInProgress];
        __int16 v12 = 1024;
        int v13 = [v3 isCloudLibraryInitialImport];
        _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting CloudLibraryUpdateInProgress to %{BOOL}u CloudLibraryInitialImport to %{BOOL}u - Posting MPCloudControllerIsUpdateInProgressDidChangeNotification [Saga]", (uint8_t *)&v8, 0x18u);
      }

      +[MPCloudController _postNotificationName:@"MPCloudControllerIsUpdateInProgressDidChangeNotification" controller:v3];
    }
  }
}

uint64_t __39__MPCloudController__updateSagaEnabled__block_invoke(uint64_t a1)
{
  +[MPCloudController _postNotificationName:@"MPCloudControllerIsCloudEnabledDidChangeNotification" controller:*(void *)(a1 + 32)];
  uint64_t v2 = *(void *)(a1 + 32);

  return +[MPCloudController _postNotificationName:@"MPCloudControllerIsGeniusEnabledDidChangeNotification" controller:v2];
}

- (void)setLikedState:(int64_t)a3 forArtistWithStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 completion:(id)a7
{
  BOOL v12 = a3 == 3;
  id v13 = a7;
  uint64_t v14 = (void *)MEMORY[0x1E4FB85D8];
  id v15 = a6;
  uint64_t v16 = [v14 sharedCloudContentTasteRequestListener];
  if (a3 == 2) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = 2 * v12;
  }
  uint64_t v18 = [(MPCloudController *)self configuration];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __90__MPCloudController_setLikedState_forArtistWithStoreID_persistentID_timeStamp_completion___block_invoke;
  v20[3] = &unk_1E57F90A0;
  id v21 = v13;
  id v19 = v13;
  [v16 setContentTaste:v17 forArtistStoreID:a4 persistentID:a5 timeStamp:v15 configuration:v18 withCompletionHandler:v20];
}

uint64_t __90__MPCloudController_setLikedState_forArtistWithStoreID_persistentID_timeStamp_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setLikedState:(int64_t)a3 forPlaylistWithGlobalID:(id)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 completion:(id)a7
{
  BOOL v12 = a3 == 3;
  id v13 = a7;
  uint64_t v14 = (void *)MEMORY[0x1E4FB85D8];
  id v15 = a6;
  id v16 = a4;
  uint64_t v17 = [v14 sharedCloudContentTasteRequestListener];
  if (a3 == 2) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = 2 * v12;
  }
  id v19 = [(MPCloudController *)self configuration];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __93__MPCloudController_setLikedState_forPlaylistWithGlobalID_persistentID_timeStamp_completion___block_invoke;
  v21[3] = &unk_1E57F90A0;
  id v22 = v13;
  id v20 = v13;
  [v17 setContentTaste:v18 forPlaylistGlobalID:v16 persistentID:a5 timeStamp:v15 configuration:v19 withCompletionHandler:v21];
}

uint64_t __93__MPCloudController_setLikedState_forPlaylistWithGlobalID_persistentID_timeStamp_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setLikedState:(int64_t)a3 forPlaylistWithGlobalID:(id)a4 completion:(id)a5
{
  int v8 = (void *)MEMORY[0x1E4F1C9C8];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 date];
  [(MPCloudController *)self setLikedState:a3 forPlaylistWithGlobalID:v10 persistentID:0 timeStamp:v11 completion:v9];
}

- (void)setLikedState:(int64_t)a3 forPlaylistWithGlobalID:(id)a4
{
}

- (void)setLikedState:(int64_t)a3 forAlbumWithStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 completion:(id)a7
{
  BOOL v12 = a3 == 3;
  id v13 = a7;
  uint64_t v14 = (void *)MEMORY[0x1E4FB85D8];
  id v15 = a6;
  id v16 = [v14 sharedCloudContentTasteRequestListener];
  if (a3 == 2) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = 2 * v12;
  }
  uint64_t v18 = [(MPCloudController *)self configuration];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __89__MPCloudController_setLikedState_forAlbumWithStoreID_persistentID_timeStamp_completion___block_invoke;
  v20[3] = &unk_1E57F90A0;
  id v21 = v13;
  id v19 = v13;
  [v16 setContentTaste:v17 forAlbumStoreID:a4 persistentID:a5 timeStamp:v15 configuration:v18 withCompletionHandler:v20];
}

uint64_t __89__MPCloudController_setLikedState_forAlbumWithStoreID_persistentID_timeStamp_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setLikedState:(int64_t)a3 forAlbumWithStoreID:(int64_t)a4 completion:(id)a5
{
  int v8 = (void *)MEMORY[0x1E4F1C9C8];
  id v9 = a5;
  id v10 = [v8 date];
  [(MPCloudController *)self setLikedState:a3 forAlbumWithStoreID:a4 persistentID:0 timeStamp:v10 completion:v9];
}

- (void)setLikedState:(int64_t)a3 forAlbumWithStoreID:(int64_t)a4
{
}

- (void)setLikedState:(int64_t)a3 forEntityWithStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 completion:(id)a7
{
  BOOL v12 = a3 == 3;
  id v13 = a7;
  uint64_t v14 = (void *)MEMORY[0x1E4FB85D8];
  id v15 = a6;
  id v16 = [v14 sharedCloudContentTasteRequestListener];
  if (a3 == 2) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = 2 * v12;
  }
  uint64_t v18 = [(MPCloudController *)self configuration];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __90__MPCloudController_setLikedState_forEntityWithStoreID_persistentID_timeStamp_completion___block_invoke;
  v20[3] = &unk_1E57F90A0;
  id v21 = v13;
  id v19 = v13;
  [v16 setContentTaste:v17 forMediaItem:0 storeIdentifier:a4 persistentID:a5 timeStamp:v15 configuration:v18 withCompletionHandler:v20];
}

uint64_t __90__MPCloudController_setLikedState_forEntityWithStoreID_persistentID_timeStamp_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setLikedState:(int64_t)a3 forEntityWithStoreID:(int64_t)a4 withMediaType:(unint64_t)a5 timeStamp:(id)a6 completion:(id)a7
{
  BOOL v11 = a3 == 3;
  id v12 = a7;
  id v13 = (void *)MEMORY[0x1E4FB85D8];
  id v14 = a6;
  id v15 = [v13 sharedCloudContentTasteRequestListener];
  if (a3 == 2) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = 2 * v11;
  }
  uint64_t v17 = [(MPCloudController *)self configuration];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __91__MPCloudController_setLikedState_forEntityWithStoreID_withMediaType_timeStamp_completion___block_invoke;
  void v19[3] = &unk_1E57F90A0;
  id v20 = v12;
  id v18 = v12;
  [v15 setContentTaste:v16 forMediaItem:0 storeIdentifier:a4 configuration:v17 timeStamp:v14 withCompletionHandler:v19];
}

uint64_t __91__MPCloudController_setLikedState_forEntityWithStoreID_withMediaType_timeStamp_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setLikedState:(int64_t)a3 forEntityWithStoreID:(int64_t)a4 withMediaType:(unint64_t)a5 timeStamp:(id)a6
{
}

- (void)fetchRecommendedContentWithSeedTrackID:(int64_t)a3 seedTrackIDType:(int64_t)a4 count:(unint64_t)a5 completion:(id)a6
{
  id v9 = a6;
  if (!v9)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[MPCloudController fetchRecommendedContentWithSeedTrackID:seedTrackIDType:count:completion:]"];
    [v15 handleFailureInFunction:v16, @"MPCloudController.m", 1379, @"Invalid parameter not satisfying: %@", @"completion" file lineNumber description];
  }
  id v10 = objc_alloc(MEMORY[0x1E4FB8758]);
  BOOL v11 = [(MPCloudController *)self userIdentity];
  id v12 = (void *)[v10 initWithIdentity:v11];

  id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB8690]) initWithRequestContext:v12 seedItemID:a3 isLibraryID:a3 == 0 maxResultCount:a5];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __93__MPCloudController_fetchRecommendedContentWithSeedTrackID_seedTrackIDType_count_completion___block_invoke;
  v17[3] = &unk_1E57F5F10;
  id v18 = v9;
  id v14 = v9;
  [v13 performRequestWithResponseHandler:v17];
}

uint64_t __93__MPCloudController_fetchRecommendedContentWithSeedTrackID_seedTrackIDType_count_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v6 = _ML3TrackPropertiesFromMPMediaItemProperties(a3);
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__MPCloudController_setItemProperties_forPurchaseHistoryID___block_invoke;
  v9[3] = &unk_1E57F5DB0;
  v9[4] = self;
  v9[5] = &v10;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
  if (v11[3])
  {
    char v7 = [(MPCloudController *)self cloudClient];
    [v7 setItemProperties:v6 forPurchaseHistoryID:a4];
  }
  else
  {
    char v7 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = [v6 allKeys];
      *(_DWORD *)buf = 138543618;
      id v15 = self;
      __int16 v16 = 2114;
      uint64_t v17 = v8;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "%{public}@ - Skipping all properties for setItemProperties:forPurchaseHistoryID: %{public}@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v10, 8);
}

uint64_t __60__MPCloudController_setItemProperties_forPurchaseHistoryID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) canSetItemProperty:a2];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MPCloudController *)self cloudClient];
  [v8 hideItemsWithPurchaseHistoryIDs:v7 completionHandler:v6];
}

- (void)setCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3 completionHandler:(id)a4
{
  BOOL v6 = a3 == 2;
  id v7 = a4;
  id v8 = [(MPCloudController *)self cloudClient];
  id v10 = v8;
  if (a3 == 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2 * v6;
  }
  [v8 setCloudFavoriteSongAddToLibraryBehavior:v9 completionHandler:v7];
}

- (int64_t)favoriteSongAddToLibraryBehavior
{
  uint64_t v2 = (void *)MEMORY[0x1E4F79AF8];
  id v3 = [(ICCloudClient *)self->_cloudClient configuration];
  BOOL v4 = [v3 userIdentity];
  int v5 = [v2 musicLibraryForUserAccount:v4];
  BOOL v6 = [v5 valueForDatabaseProperty:@"MLCloudAccountFavoriteSongAddToLibraryBehavior"];
  uint64_t v7 = [v6 integerValue];

  if (v7 == 1) {
    return 1;
  }
  else {
    return 2 * (v7 == 2);
  }
}

- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 completionHandler:(id)a4
{
  BOOL v6 = a3 == 2;
  id v7 = a4;
  id v8 = [(MPCloudController *)self cloudClient];
  id v10 = v8;
  if (a3 == 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2 * v6;
  }
  [v8 setCloudAddToPlaylistBehavior:v9 completionHandler:v7];
}

- (int64_t)cloudAddToPlaylistBehavior
{
  uint64_t v2 = (void *)MEMORY[0x1E4F79AF8];
  id v3 = [(ICCloudClient *)self->_cloudClient configuration];
  BOOL v4 = [v3 userIdentity];
  int v5 = [v2 musicLibraryForUserAccount:v4];
  uint64_t v6 = [v5 sagaCloudAddToPlaylistBehavior];

  if (v6 == 1) {
    return 1;
  }
  else {
    return 2 * (v6 == 2);
  }
}

- (void)disableAutomaticDownloadsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCloudController *)self cloudClient];
  [v5 handleAutomaticDownloadPreferenceChangedForMediaKindMusic:0 withCompletionHandler:v4];
}

- (void)enableAutomaticDownloadsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCloudController *)self cloudClient];
  [v5 handleAutomaticDownloadPreferenceChangedForMediaKindMusic:1 withCompletionHandler:v4];
}

- (BOOL)hasSetPreferenceForAutomaticDownloads
{
  uint64_t v2 = [(MPCloudController *)self cloudClient];
  char v3 = [v2 hasSetPreferenceForAutomaticDownloads];

  return v3;
}

- (BOOL)isAutomaticDownloadsEnabled
{
  uint64_t v2 = [(MPCloudController *)self cloudClient];
  char v3 = [v2 isAutomaticDownloadsEnabledForMediaKindMusic];

  return v3;
}

- (void)disableCloudLibraryWithReason:(int64_t)a3 completionHandler:(id)a4
{
  int v4 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    uint64_t v6 = -5;
  }
  else {
    uint64_t v6 = -7;
  }
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543874;
    BOOL v11 = self;
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 1024;
    int v15 = v6;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - reason=%d, disableCloudLibraryReason=%d", (uint8_t *)&v10, 0x18u);
  }

  uint64_t v9 = [(MPCloudController *)self cloudClient];
  [v9 disableCloudLibraryWithReason:v6 completionHandler:v7];
}

- (void)disableCloudLibraryWithCompletionHandler:(id)a3
{
}

- (void)enableCloudLibraryWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 objectForKeyedSubscript:@"MPCloudControllerEnableCloudLibraryOptionStartInitialImport"];
  uint64_t v9 = [v8 BOOLValue];

  int v10 = [v7 objectForKeyedSubscript:@"MPCloudControllerEnableCloudLibraryOptionMergeWithCloudLibrary"];

  LODWORD(v7) = [v10 BOOLValue];
  BOOL v11 = [(MPCloudController *)self cloudClient];
  id v13 = v11;
  if (v7) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  [v11 enableCloudLibraryWithPolicy:v12 startInitialImport:v9 completionHandler:v6];
}

- (void)loadLastKnownEnableICMLErrorStatusWithCompletionHander:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCloudController *)self cloudClient];
  [v5 loadLastKnownEnableICMLErrorStatusWithCompletionHander:v4];
}

- (void)loadJaliscoLibraryUpdateProgressWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCloudController *)self cloudClient];
  [v5 loadJaliscoUpdateProgressWithCompletionHandler:v4];
}

- (void)loadCloudMusicLibraryUpdateProgressWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCloudController *)self cloudClient];
  [v5 loadUpdateProgressWithCompletionHandler:v4];
}

- (void)loadUpdateProgressWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCloudController *)self cloudClient];
  [v5 loadUpdateProgressWithCompletionHandler:v4];
}

- (void)loadGeniusItemsForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(MPCloudController *)self cloudClient];
  [v7 loadGeniusItemsForSagaID:a3 completionHandler:v6];
}

- (BOOL)isCloudLibraryUpdateInProgress
{
  return self->_cloudLibraryUpdateInProgress;
}

- (BOOL)isCloudLibraryInitialImport
{
  return self->_cloudLibraryInitialImport;
}

- (BOOL)isGeniusEnabled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__MPCloudController_isGeniusEnabled__block_invoke;
  v5[3] = &unk_1E57F9F20;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__MPCloudController_isGeniusEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCloudEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isActive
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__MPCloudController_isActive__block_invoke;
  v5[3] = &unk_1E57F9F20;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__MPCloudController_isActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)resignActive
{
  char v3 = +[MPCloudController sharedCloudController];

  if (v3 == self)
  {
    [(MPCloudController *)self _resignActive];
    id v4 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
    int v5 = [v4 supportsMultipleITunesAccounts];

    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
      int v7 = [v6 isAudioAccessory];

      if (v7)
      {
        uint64_t v8 = +[MPCloudController globalSerialQueue];
        dispatch_sync(v8, &__block_literal_global_202_38821);
      }
      else
      {
        [(MPCloudController *)self _performBlockOnControllerHandlingTheSameAccount:&__block_literal_global_206];
      }
    }
  }
}

uint64_t __33__MPCloudController_resignActive__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 _resignActive];
}

void __33__MPCloudController_resignActive__block_invoke()
{
  id v0 = +[MPCloudController controllers];
  [v0 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_204_38824];
}

uint64_t __33__MPCloudController_resignActive__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _resignActive];
}

void __50__MPCloudController_becomeActiveAndWaitUntilDone___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[MPCloudController controllers];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__MPCloudController_becomeActiveAndWaitUntilDone___block_invoke_2;
  v3[3] = &__block_descriptor_33_e44_v32__0__NSString_8__MPCloudController_16_B24l;
  char v4 = *(unsigned char *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __50__MPCloudController_becomeActiveAndWaitUntilDone___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 _becomeActiveAndWaitUntilDone:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __50__MPCloudController_becomeActiveAndWaitUntilDone___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _becomeActiveAndWaitUntilDone:*(unsigned __int8 *)(a1 + 32)];
}

- (void)deprioritizeArtworkRequestForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 artworkSourceType:(int64_t)a6
{
  BOOL v11 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__MPCloudController_deprioritizeArtworkRequestForEntityPersistentID_entityType_artworkType_artworkSourceType___block_invoke;
  block[3] = &unk_1E57F5E38;
  void block[4] = self;
  void block[5] = a4;
  block[6] = a3;
  block[7] = a5;
  block[8] = a6;
  dispatch_async(v11, block);
}

void __110__MPCloudController_deprioritizeArtworkRequestForEntityPersistentID_entityType_artworkType_artworkSourceType___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) cloudClient];

  if (v2)
  {
    char v3 = [*(id *)(a1 + 32) userIdentity];
    id v25 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v3];

    switch(*(void *)(a1 + 40))
    {
      case 0:
        char v4 = [v25 itemWithPersistentID:*(void *)(a1 + 48) verifyExistence:0];
        int v5 = v4;
        uint64_t v6 = *(void *)(a1 + 56);
        if (v6 == 2)
        {
          uint64_t v15 = *(void *)(a1 + 64);
          switch(v15)
          {
            case 600:
              int v10 = [*(id *)(a1 + 32) cloudClient];
              [v10 deprioritizeSubscriptionScreenshotForPersistentID:*(void *)(a1 + 48)];
              goto LABEL_33;
            case 400:
              id v20 = [(MPMediaPlaylist *)v4 valueForProperty:@"purchaseHistoryID"];
              uint64_t v21 = [v20 unsignedLongLongValue];

              if (v21 < 1) {
                goto LABEL_37;
              }
              int v10 = [*(id *)(a1 + 32) cloudClient];
              [v10 deprioritizeScreenshotForPurchaseHistoryID:v21];
              goto LABEL_33;
            case 200:
              uint64_t v16 = [(MPMediaPlaylist *)v4 valueForProperty:@"storeSagaID"];
              uint64_t v17 = [v16 unsignedLongLongValue];

              if (v17 >= 1)
              {
                int v10 = [*(id *)(a1 + 32) cloudClient];
                [v10 deprioritizeScreenshotForSagaID:v17];
                goto LABEL_33;
              }
              break;
          }
        }
        else
        {
          if (v6 != 1) {
            goto LABEL_37;
          }
          uint64_t v7 = *(void *)(a1 + 64);
          switch(v7)
          {
            case 600:
              int v10 = [*(id *)(a1 + 32) cloudClient];
              [v10 deprioritizeSubscriptionItemArtworkForPersistentID:*(void *)(a1 + 48)];
              goto LABEL_33;
            case 400:
              uint64_t v18 = [(MPMediaPlaylist *)v4 valueForProperty:@"purchaseHistoryID"];
              uint64_t v19 = [v18 unsignedLongLongValue];

              if (v19 < 1) {
                goto LABEL_37;
              }
              int v10 = [*(id *)(a1 + 32) cloudClient];
              [v10 deprioritizeItemArtworkForPurchaseHistoryID:v19];
              goto LABEL_33;
            case 200:
              uint64_t v8 = [(MPMediaPlaylist *)v4 valueForProperty:@"storeSagaID"];
              uint64_t v9 = [v8 unsignedLongLongValue];

              if (v9 >= 1)
              {
                int v10 = [*(id *)(a1 + 32) cloudClient];
                [v10 deprioritizeItemArtworkForSagaID:v9];
LABEL_33:

                goto LABEL_34;
              }
              break;
          }
        }
        goto LABEL_37;
      case 1:
        if (*(void *)(a1 + 56) != 5) {
          goto LABEL_38;
        }
        uint64_t v11 = *(void *)(a1 + 64);
        if (v11 == 600)
        {
          int v5 = [*(id *)(a1 + 32) cloudClient];
          [(MPMediaPlaylist *)v5 deprioritizeSubscriptionContainerArtworkForPersistentID:*(void *)(a1 + 48)];
          goto LABEL_34;
        }
        if (v11 != 200) {
          goto LABEL_38;
        }
        int v5 = [[MPMediaPlaylist alloc] initWithPersistentID:*(void *)(a1 + 48) mediaLibrary:v25];
        uint64_t v12 = [(MPMediaPlaylist *)v5 valueForProperty:@"storeCloudID"];
        uint64_t v13 = [v12 unsignedLongLongValue];

        if (v13 >= 1)
        {
          __int16 v14 = [*(id *)(a1 + 32) cloudClient];
          [v14 deprioritizeContainerArtworkForSagaID:v13];

LABEL_34:

          return;
        }
LABEL_37:

LABEL_38:
        break;
      case 2:
        if (*(void *)(a1 + 56) != 4 || *(void *)(a1 + 64) != 500) {
          goto LABEL_38;
        }
        int v5 = [*(id *)(a1 + 32) cloudClient];
        [(MPMediaPlaylist *)v5 deprioritizeArtistHeroImageForPersistentID:*(void *)(a1 + 48)];
        goto LABEL_34;
      case 7:
        if (*(void *)(a1 + 56) != 4 || *(void *)(a1 + 64) != 500) {
          goto LABEL_38;
        }
        int v5 = [*(id *)(a1 + 32) cloudClient];
        [(MPMediaPlaylist *)v5 deprioritizeAlbumArtistHeroImageForPersistentID:*(void *)(a1 + 48)];
        goto LABEL_34;
      default:
        goto LABEL_38;
    }
  }
  id v22 = os_log_create("com.apple.amp.mediaplayer", "Default");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = *(void *)(a1 + 56);
    uint64_t v24 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 134218240;
    uint64_t v27 = v23;
    __int16 v28 = 2048;
    uint64_t v29 = v24;
    _os_log_impl(&dword_1952E8000, v22, OS_LOG_TYPE_DEFAULT, "[CloudPersonalization] Deprioritize artwork request not supported for artworkType=%ld, sourceType=%ld", buf, 0x16u);
  }
}

- (void)loadArtworkInfoForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 artworkSourceType:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a7;
  uint64_t v13 = dispatch_get_global_queue(0, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __117__MPCloudController_loadArtworkInfoForEntityPersistentID_entityType_artworkType_artworkSourceType_completionHandler___block_invoke;
  v15[3] = &unk_1E57F5DE8;
  void v15[4] = self;
  id v16 = v12;
  int64_t v17 = a3;
  int64_t v18 = a4;
  int64_t v19 = a5;
  int64_t v20 = a6;
  id v14 = v12;
  dispatch_async(v13, v15);
}

void __117__MPCloudController_loadArtworkInfoForEntityPersistentID_entityType_artworkType_artworkSourceType_completionHandler___block_invoke(uint64_t a1)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __117__MPCloudController_loadArtworkInfoForEntityPersistentID_entityType_artworkType_artworkSourceType_completionHandler___block_invoke_2;
  v32[3] = &unk_1E57F5E10;
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v34 = *(void *)(a1 + 48);
  id v33 = v2;
  char v3 = (void *)MEMORY[0x19971E0F0](v32);
  char v4 = [*(id *)(a1 + 32) cloudClient];

  if (v4)
  {
    int v5 = [*(id *)(a1 + 32) userIdentity];
    uint64_t v6 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v5];

    uint64_t v7 = *(void *)(a1 + 56);
    if (v7 != 1)
    {
      if (!v7)
      {
        uint64_t v8 = [v6 itemWithPersistentID:*(void *)(a1 + 48) verifyExistence:0];
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)(a1 + 64);
        if (v10 == 2)
        {
          uint64_t v20 = *(void *)(a1 + 72);
          switch(v20)
          {
            case 600:
              id v14 = [*(id *)(a1 + 32) cloudClient];
              [v14 loadScreenshotInfoForSubscriptionPersistentID:*(void *)(a1 + 48) completionHandler:v3];
              goto LABEL_29;
            case 400:
              id v25 = [(MPMediaPlaylist *)v8 valueForProperty:@"purchaseHistoryID"];
              uint64_t v26 = [v25 unsignedLongLongValue];

              if (v26 >= 1)
              {
                id v14 = [*(id *)(a1 + 32) cloudClient];
                [v14 loadScreenshotInfoForPurchaseHistoryID:v26 completionHandler:v3];
                goto LABEL_29;
              }
              break;
            case 200:
              uint64_t v21 = [(MPMediaPlaylist *)v8 valueForProperty:@"storeSagaID"];
              uint64_t v22 = [v21 unsignedLongLongValue];

              if (v22 >= 1)
              {
                id v14 = [*(id *)(a1 + 32) cloudClient];
                [v14 loadScreenshotInfoForSagaID:v22 completionHandler:v3];
                goto LABEL_29;
              }
              break;
          }
        }
        else if (v10 == 1)
        {
          uint64_t v11 = *(void *)(a1 + 72);
          switch(v11)
          {
            case 600:
              id v14 = [*(id *)(a1 + 32) cloudClient];
              [v14 loadArtworkInfoForSubscriptionItemPersistentID:*(void *)(a1 + 48) completionHandler:v3];
              goto LABEL_29;
            case 400:
              uint64_t v23 = [(MPMediaPlaylist *)v8 valueForProperty:@"purchaseHistoryID"];
              uint64_t v24 = [v23 unsignedLongLongValue];

              if (v24 >= 1)
              {
                id v14 = [*(id *)(a1 + 32) cloudClient];
                [v14 loadArtworkInfoForPurchaseHistoryID:v24 completionHandler:v3];
                goto LABEL_29;
              }
              break;
            case 200:
              id v12 = [(MPMediaPlaylist *)v8 valueForProperty:@"storeSagaID"];
              uint64_t v13 = [v12 unsignedLongLongValue];

              if (v13 >= 1)
              {
                id v14 = [*(id *)(a1 + 32) cloudClient];
                [v14 loadArtworkInfoForSagaID:v13 completionHandler:v3];
LABEL_29:

                goto LABEL_30;
              }
              break;
          }
        }
LABEL_31:
        char v19 = 0;
        goto LABEL_32;
      }
LABEL_16:
      char v19 = 0;
      goto LABEL_33;
    }
    uint64_t v15 = *(void *)(a1 + 72);
    if (v15 == 600)
    {
      uint64_t v9 = [*(id *)(a1 + 32) cloudClient];
      [(MPMediaPlaylist *)v9 loadArtworkInfoForSubscriptionContainerPersistentID:*(void *)(a1 + 48) completionHandler:v3];
    }
    else
    {
      if (v15 != 200) {
        goto LABEL_16;
      }
      uint64_t v9 = [[MPMediaPlaylist alloc] initWithPersistentID:*(void *)(a1 + 48) mediaLibrary:v6];
      id v16 = [(MPMediaPlaylist *)v9 valueForProperty:@"storeCloudID"];
      uint64_t v17 = [v16 unsignedLongLongValue];

      if (v17 < 1) {
        goto LABEL_31;
      }
      int64_t v18 = [*(id *)(a1 + 32) cloudClient];
      [v18 loadArtworkInfoForContainerSagaID:v17 completionHandler:v3];
    }
LABEL_30:
    char v19 = 1;
LABEL_32:

LABEL_33:
    if (v19) {
      goto LABEL_36;
    }
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v27 = [NSString stringWithFormat:@"Artwork info loading not supported for artworkType=%ld, sourceType=%ld", *(void *)(a1 + 64), *(void *)(a1 + 72)];
    uint64_t v28 = *(void *)(a1 + 40);
    uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v36[0] = v27;
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    v31 = [v29 errorWithDomain:@"MPCloudControllerErrorDomain" code:1010101 userInfo:v30];
    (*(void (**)(uint64_t, void, void *))(v28 + 16))(v28, 0, v31);
  }
LABEL_36:
}

void __117__MPCloudController_loadArtworkInfoForEntityPersistentID_entityType_artworkType_artworkSourceType_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = objc_alloc_init(MPExportableArtworkProperties);
  if (v3)
  {
    uint64_t v5 = *MEMORY[0x1E4FB8360];
    uint64_t v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FB8360]];
    uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FB8380]];

    if ([v7 length])
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28D90];
      uint64_t v9 = [v7 dataUsingEncoding:4];
      uint64_t v10 = [v8 JSONObjectWithData:v9 options:0 error:0];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25[0] = v10;
        uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
        [(MPExportableArtworkProperties *)v4 setArtworkTemplateItems:v11];
      }
    }
    id v12 = [v3 objectForKeyedSubscript:v5];
    uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4FB8378]];

    if (_NSIsNSString()) {
      [(MPExportableArtworkProperties *)v4 setResolvedURLString:v13];
    }
    id v14 = [(MPExportableArtworkProperties *)v4 artworkTemplateItems];
    if ([v14 count])
    {
      uint64_t v15 = 0;
LABEL_10:

      goto LABEL_14;
    }
    uint64_t v17 = [(MPExportableArtworkProperties *)v4 resolvedURLString];

    if (!v17)
    {
      id v14 = objc_msgSend(NSString, "stringWithFormat:", @"Artwork info loading failed. No artwork URL found in the artwork info dictionary for item with persistent ID %lld", *(void *)(a1 + 40));
      char v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      uint64_t v24 = v14;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      uint64_t v15 = [v19 errorWithDomain:@"MPCloudControllerErrorDomain" code:1010101 userInfo:v20];

      goto LABEL_10;
    }
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Artwork info loading failed. Got no artwork info dictionary for item with persistent ID %lld", *(void *)(a1 + 40));
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    uint64_t v22 = v7;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    uint64_t v15 = [v16 errorWithDomain:@"MPCloudControllerErrorDomain" code:1010101 userInfo:v13];
  }
LABEL_14:

  uint64_t v18 = *(void *)(a1 + 32);
  if (v18) {
    (*(void (**)(uint64_t, MPExportableArtworkProperties *, void *))(v18 + 16))(v18, v4, v15);
  }
}

- (void)loadArtworkForEntityPersistentID:(int64_t)a3 entityType:(int64_t)a4 artworkType:(int64_t)a5 artworkSourceType:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a7;
  uint64_t v13 = dispatch_get_global_queue(0, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __113__MPCloudController_loadArtworkForEntityPersistentID_entityType_artworkType_artworkSourceType_completionHandler___block_invoke;
  v15[3] = &unk_1E57F5DE8;
  void v15[4] = self;
  id v16 = v12;
  int64_t v17 = a4;
  int64_t v18 = a3;
  int64_t v19 = a5;
  int64_t v20 = a6;
  id v14 = v12;
  dispatch_async(v13, v15);
}

void __113__MPCloudController_loadArtworkForEntityPersistentID_entityType_artworkType_artworkSourceType_completionHandler___block_invoke(uint64_t a1)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  uint64_t v32 = __113__MPCloudController_loadArtworkForEntityPersistentID_entityType_artworkType_artworkSourceType_completionHandler___block_invoke_2;
  id v33 = &unk_1E57F90A0;
  id v34 = *(id *)(a1 + 40);
  uint64_t v2 = (void *)MEMORY[0x19971E0F0](&v30);
  id v3 = [*(id *)(a1 + 32) cloudClient];

  if (v3)
  {
    if ([MEMORY[0x1E4FB87C0] canAccessAccountStore])
    {
      char v4 = [*(id *)(a1 + 32) userIdentity];
      uint64_t v5 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v4];
    }
    else
    {
      uint64_t v5 = +[MPMediaLibrary defaultMediaLibrary];
    }
    char v6 = 0;
    switch(*(void *)(a1 + 48))
    {
      case 0:
        uint64_t v7 = [v5 itemWithPersistentID:*(void *)(a1 + 56) verifyExistence:0];
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)(a1 + 64);
        if (v9 == 2)
        {
          uint64_t v18 = *(void *)(a1 + 72);
          switch(v18)
          {
            case 600:
              uint64_t v13 = [*(id *)(a1 + 32) cloudClient];
              [v13 importSubscriptionScreenshotForPersistentID:*(void *)(a1 + 56) completionHandler:v2];
              goto LABEL_38;
            case 400:
              uint64_t v23 = [(MPMediaPlaylist *)v7 valueForProperty:@"purchaseHistoryID"];
              uint64_t v24 = [v23 unsignedLongLongValue];

              if (v24 < 1) {
                break;
              }
              uint64_t v13 = [*(id *)(a1 + 32) cloudClient];
              [v13 importScreenshotForPurchaseHistoryID:v24 completionHandler:v2];
              goto LABEL_38;
            case 200:
              int64_t v19 = [(MPMediaPlaylist *)v7 valueForProperty:@"storeSagaID"];
              uint64_t v20 = [v19 unsignedLongLongValue];

              if (v20 >= 1)
              {
                uint64_t v13 = [*(id *)(a1 + 32) cloudClient];
                [v13 importScreenshotForSagaID:v20 completionHandler:v2];
                goto LABEL_38;
              }
              break;
          }
        }
        else
        {
          if (v9 != 1) {
            goto LABEL_40;
          }
          uint64_t v10 = *(void *)(a1 + 72);
          switch(v10)
          {
            case 600:
              uint64_t v13 = [*(id *)(a1 + 32) cloudClient];
              [v13 importSubscriptionItemArtworkForPersistentID:*(void *)(a1 + 56) completionHandler:v2];
              goto LABEL_38;
            case 400:
              uint64_t v21 = [(MPMediaPlaylist *)v7 valueForProperty:@"purchaseHistoryID"];
              uint64_t v22 = [v21 unsignedLongLongValue];

              if (v22 < 1) {
                break;
              }
              uint64_t v13 = [*(id *)(a1 + 32) cloudClient];
              [v13 importItemArtworkForPurchaseHistoryID:v22 completionHandler:v2];
              goto LABEL_38;
            case 200:
              uint64_t v11 = [(MPMediaPlaylist *)v7 valueForProperty:@"storeSagaID"];
              uint64_t v12 = [v11 unsignedLongLongValue];

              if (v12 >= 1)
              {
                uint64_t v13 = [*(id *)(a1 + 32) cloudClient];
                [v13 importItemArtworkForSagaID:v12 completionHandler:v2];
LABEL_38:

                goto LABEL_39;
              }
              break;
          }
        }
LABEL_40:
        char v6 = 0;
LABEL_41:

LABEL_42:
        if ((v6 & 1) == 0) {
          break;
        }
        goto LABEL_45;
      case 1:
        if (*(void *)(a1 + 64) != 5) {
          goto LABEL_25;
        }
        uint64_t v14 = *(void *)(a1 + 72);
        if (v14 == 600)
        {
          uint64_t v8 = [*(id *)(a1 + 32) cloudClient];
          [(MPMediaPlaylist *)v8 importSubscriptionContainerArtworkForPersistentID:*(void *)(a1 + 56) completionHandler:v2];
        }
        else
        {
          if (v14 != 200)
          {
LABEL_25:
            char v6 = 0;
            goto LABEL_42;
          }
          uint64_t v8 = [[MPMediaPlaylist alloc] initWithPersistentID:*(void *)(a1 + 56) mediaLibrary:v5];
          uint64_t v15 = [(MPMediaPlaylist *)v8 valueForProperty:@"storeCloudID"];
          uint64_t v16 = [v15 unsignedLongLongValue];

          if (v16 < 1) {
            goto LABEL_40;
          }
          int64_t v17 = [*(id *)(a1 + 32) cloudClient];
          [v17 importContainerArtworkForSagaID:v16 completionHandler:v2];
        }
LABEL_39:
        char v6 = 1;
        goto LABEL_41;
      case 2:
        if (*(void *)(a1 + 64) != 4 || *(void *)(a1 + 72) != 500) {
          goto LABEL_25;
        }
        uint64_t v8 = [*(id *)(a1 + 32) cloudClient];
        [(MPMediaPlaylist *)v8 importArtistHeroImageForPersistentID:*(void *)(a1 + 56) completionHandler:v2];
        goto LABEL_39;
      case 7:
        if (*(void *)(a1 + 64) != 4 || *(void *)(a1 + 72) != 500) {
          goto LABEL_25;
        }
        uint64_t v8 = [*(id *)(a1 + 32) cloudClient];
        [(MPMediaPlaylist *)v8 importAlbumArtistHeroImageForPersistentID:*(void *)(a1 + 56) completionHandler:v2];
        goto LABEL_39;
      default:
        goto LABEL_42;
    }
  }
  if (*(void *)(a1 + 40))
  {
    id v25 = [NSString stringWithFormat:@"One-off loading not supported for artworkType=%ld, sourceType=%ld", *(void *)(a1 + 64), *(void *)(a1 + 72), v30, v31, v32, v33];
    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28228];
    v36[0] = v25;
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    uint64_t v29 = [v27 errorWithDomain:@"MPCloudControllerErrorDomain" code:1010101 userInfo:v28];
    (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v29);
  }
LABEL_45:
}

uint64_t __113__MPCloudController_loadArtworkForEntityPersistentID_entityType_artworkType_artworkSourceType_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeItemsWithSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MPCloudController *)self cloudClient];
  [v8 removeItemsWithSagaIDs:v7 completionHandler:v6];
}

- (void)addStorePlaylistWithGlobalID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MPCloudController *)self cloudClient];
  [v8 addStorePlaylistWithGlobalID:v7 completionHandler:v6];
}

- (void)sdk_addStoreItemWithOpaqueID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MPCloudController *)self cloudClient];
  objc_msgSend(v8, "sdk_addStoreItemWithOpaqueID:completionHandler:", v7, v6);
}

- (void)addStoreItemWithAdamID:(int64_t)a3 referralObject:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = [(MPCloudController *)self cloudClient];
  uint64_t v10 = [(MPCloudController *)self _referralForModelObject:v9];

  [v11 addStoreItemWithAdamID:a3 referral:v10 completionHandler:v8];
}

- (void)addStoreItemWithAdamID:(int64_t)a3 completionHandler:(id)a4
{
}

- (void)setAlbumArtistProperties:(id)a3 forEntityWithPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  _ML3CollectionPropertiesFromMPMediaItemColectionProperties(a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [(MPCloudController *)self cloudClient];
  [v9 setAlbumArtistProperties:v10 forAlbumArtistPersistentID:a4 completionHandler:v8];
}

- (void)setAlbumProperties:(id)a3 forEntityWithPersistentID:(int64_t)a4 cloudLibraryID:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  _ML3CollectionPropertiesFromMPMediaItemColectionProperties(a3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [(MPCloudController *)self cloudClient];
  [v10 setAlbumEntityProperties:v11 forAlbumPersistentID:a4 completionHandler:v9];
}

- (void)setCollectionProperties:(id)a3 forCollectionWithPersistentID:(int64_t)a4 groupingType:(int64_t)a5 completionHandler:(id)a6
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = (void (**)(void, void))v11;
  if (a5 == 1)
  {
    uint64_t v13 = _ML3CollectionPropertiesFromMPMediaItemColectionProperties(v10);

    uint64_t v14 = [(MPCloudController *)self cloudClient];
    [v14 setAlbumProperties:v13 forAlbumPersistentID:a4 completionHandler:v12];

    id v10 = (id)v13;
  }
  else if (v11)
  {
    uint64_t v15 = [NSString stringWithFormat:@"Cannot set cloud properties for groupingType=%ld properties=%@", a5, v10];
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28228];
    v20[0] = v15;
    int64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v18 = [v16 errorWithDomain:@"MPCloudControllerErrorDomain" code:1010102 userInfo:v17];
    ((void (**)(void, void *))v12)[2](v12, v18);
  }
}

- (void)uploadCloudItemProperties
{
  id v2 = [(MPCloudController *)self cloudClient];
  [v2 uploadCloudItemProperties];
}

- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = _ML3TrackPropertiesFromMPMediaItemProperties(a3);
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__MPCloudController_setItemProperties_forSagaID___block_invoke;
  v9[3] = &unk_1E57F5DB0;
  v9[4] = self;
  v9[5] = &v10;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
  if (*((unsigned char *)v11 + 24))
  {
    id v7 = [(MPCloudController *)self cloudClient];
    [v7 setItemProperties:v6 forSagaID:a4];
  }
  else
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v6 allKeys];
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = self;
      __int16 v16 = 2112;
      int64_t v17 = v8;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Skipping all properties for setItemProperties:forSagaID: %@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v10, 8);
}

uint64_t __49__MPCloudController_setItemProperties_forSagaID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) canSetItemProperty:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)canSetItemProperty:(id)a3
{
  uint64_t v3 = canSetItemProperty__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&canSetItemProperty__onceToken, &__block_literal_global_169_38852);
  }
  char v5 = [(id)canSetItemProperty____itemProperties containsObject:v4];

  return v5;
}

void __40__MPCloudController_canSetItemProperty___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"daap.incrementplaycount", @"daap.incrementskipcount", @"dmap.itemhidden", *MEMORY[0x1E4F79A20], *MEMORY[0x1E4F79698], *MEMORY[0x1E4F79520], *MEMORY[0x1E4F79530], *MEMORY[0x1E4F79778], *MEMORY[0x1E4F79400], *MEMORY[0x1E4F79788], 0);
  uint64_t v1 = (void *)canSetItemProperty____itemProperties;
  canSetItemProperty____itemProperties = v0;
}

- (void)resetInvitationURLForCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(MPCloudController *)self cloudClient];
  [v7 resetInvitationURLForCollaborationWithPersistentID:a3 completion:v6];
}

- (void)updateSharingMode:(int64_t)a3 onCollaboratinWithPersistentID:(int64_t)a4 completion:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [(MPCloudController *)self cloudClient];
  uint64_t v12 = *MEMORY[0x1E4F791A8];
  uint64_t v10 = [NSNumber numberWithInteger:a3];
  v13[0] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v9 editCollaborationWithPersistentID:a4 properties:v11 trackEdits:MEMORY[0x1E4F1CBF0] completion:v8];
}

- (void)removeCollaborators:(id)a3 fromCollaborationWithPersistentID:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(MPCloudController *)self cloudClient];
  [v10 removeCollaborators:v9 fromCollaborationWithPersistentID:a4 completion:v8];
}

- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(int64_t)a4 withApproval:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = [(MPCloudController *)self cloudClient];
  [v12 respondToPendingCollaborator:v11 onCollaborationWithPersistentID:a4 withApproval:v6 completion:v10];
}

- (void)joinCollaborationWithGlobalPlaylistID:(id)a3 invitationURL:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MPCloudController *)self cloudClient];
  [v11 joinCollaborationWithGlobalPlaylistID:v10 invitationURL:v9 completion:v8];
}

- (void)editCollaborationWithPersistentID:(int64_t)a3 properties:(id)a4 trackEdits:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  _ML3CollectionPropertiesFromMPMediaItemColectionProperties(a4);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [(MPCloudController *)self cloudClient];
  [v12 editCollaborationWithPersistentID:a3 properties:v13 trackEdits:v11 completion:v10];
}

- (void)endCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(MPCloudController *)self cloudClient];
  [v7 endCollaborationWithPersistentID:a3 completion:v6];
}

- (void)beginCollaborationUsingPlaylistWithPersistentID:(int64_t)a3 sharingMode:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [(MPCloudController *)self cloudClient];
  [v9 beginCollaborationUsingPlaylistWithPersistentID:a3 sharingMode:a4 completion:v8];
}

- (void)favoriteEntityWithPersistentID:(int64_t)a3 sagaID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = [(MPCloudController *)self cloudClient];
  objc_msgSend(v14, "favoriteEntityWithPersistentID:sagaID:entityType:time:completionHandler:", a3, a4, -[MPCloudController _icFavoriteEntityTypeFromMPEntityType:](self, "_icFavoriteEntityTypeFromMPEntityType:", a5), v13, v12);
}

- (void)favoriteArtistWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [(MPCloudController *)self cloudClient];
  [v13 favoriteArtistWithPersistentID:a3 cloudLibraryID:v12 time:v11 completionHandler:v10];
}

- (void)favoriteAlbumWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [(MPCloudController *)self cloudClient];
  [v13 favoriteAlbumWithPersistentID:a3 cloudLibraryID:v12 time:v11 completionHandler:v10];
}

- (void)favoritePlaylistWithPersistentID:(int64_t)a3 globalID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [(MPCloudController *)self cloudClient];
  [v13 favoritePlaylistWithPersistentID:a3 globalID:v12 time:v11 completionHandler:v10];
}

- (void)favoriteEntityWithPersistentID:(int64_t)a3 storeID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = [(MPCloudController *)self cloudClient];
  objc_msgSend(v14, "favoriteEntityWithPersistentID:storeID:entityType:time:completionHandler:", a3, a4, -[MPCloudController _icFavoriteEntityTypeFromMPEntityType:](self, "_icFavoriteEntityTypeFromMPEntityType:", a5), v13, v12);
}

- (void)uploadArtworkForPlaylist:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(MPCloudController *)self cloudClient];
  uint64_t v8 = [v7 persistentID];

  [v9 uploadArtworkForPlaylistWithPersistentID:v8 completionHandler:v6];
}

- (void)publishPlaylistWithSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(MPCloudController *)self cloudClient];
  [v7 publishPlaylistWithSagaID:a3 completionHandler:v6];
}

- (void)removePlaylistsWithSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MPCloudController *)self cloudClient];
  [v8 removePlaylistsWithSagaIDs:v7 completionHandler:v6];
}

- (void)uploadCloudPlaylistProperties
{
  id v2 = [(MPCloudController *)self cloudClient];
  [v2 uploadCloudPlaylistProperties];
}

- (void)sdk_addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = a5;
  if ([(MPCloudController *)self _isCollaborativePlaylist:a4])
  {
    [(MPCloudController *)self _addItemWithSagaID:a3 toCollaborationWithPersistentID:a4 completionHandler:v9];
  }
  else
  {
    id v8 = [(MPCloudController *)self cloudClient];
    objc_msgSend(v8, "sdk_addItemWithSagaID:toPlaylistWithPersistentID:completionHandler:", a3, a4, v9);
  }
}

- (void)sdk_addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(MPCloudController *)self _isCollaborativePlaylist:a4])
  {
    uint64_t v10 = objc_msgSend(v8, "msv_unsignedLongLongValue");
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __95__MPCloudController_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke;
    v12[3] = &unk_1E57F90A0;
    id v13 = v9;
    [(MPCloudController *)self _addItemWithAdamID:v10 toCollaborationWithPersistentID:a4 completionHandler:v12];
  }
  else
  {
    id v11 = [(MPCloudController *)self cloudClient];
    objc_msgSend(v11, "sdk_addStoreItemWithOpaqueID:toPlaylistWithPersistentID:completionHandler:", v8, a4, v9);
  }
}

uint64_t __95__MPCloudController_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = a5;
  if ([(MPCloudController *)self _isCollaborativePlaylist:a4])
  {
    [(MPCloudController *)self _addItemWithSagaID:a3 toCollaborationWithPersistentID:a4 completionHandler:v9];
  }
  else
  {
    id v8 = [(MPCloudController *)self cloudClient];
    [v8 addItemWithSagaID:a3 toPlaylistWithPersistentID:a4 completionHandler:v9];
  }
}

- (void)addStoreItemWithAdamID:(int64_t)a3 referralObject:(id)a4 toPlaylistWithPersistentID:(unint64_t)a5 completionHandler:(id)a6
{
  id v13 = a4;
  id v10 = a6;
  if ([(MPCloudController *)self _isCollaborativePlaylist:a5])
  {
    [(MPCloudController *)self _addItemWithAdamID:a3 toCollaborationWithPersistentID:a5 completionHandler:v10];
  }
  else
  {
    id v11 = [(MPCloudController *)self cloudClient];
    id v12 = [(MPCloudController *)self _referralForModelObject:v13];
    [v11 addStoreItemWithAdamID:a3 referral:v12 toPlaylistWithPersistentID:a5 completionHandler:v10];
  }
}

- (void)addStoreItemWithAdamID:(int64_t)a3 toPlaylistWithPersistentID:(unint64_t)a4 completionHandler:(id)a5
{
}

- (void)sdk_setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistWithPersistentID:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  id v13 = [v12 objectForKeyedSubscript:@"dateModified"];
  if (!v13)
  {
    id v13 = [MEMORY[0x1E4F1C9C8] date];
  }
  [(MPCloudController *)self _setDateModified:v13 forPlaylistPersistentID:a5];
  id v14 = _ML3CollectionPropertiesFromMPMediaItemColectionProperties(v12);

  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __103__MPCloudController_sdk_setPlaylistProperties_trackList_forPlaylistWithPersistentID_completionHandler___block_invoke;
  void v19[3] = &unk_1E57F5DB0;
  void v19[4] = self;
  v19[5] = &v20;
  [v14 enumerateKeysAndObjectsUsingBlock:v19];
  if (!*((unsigned char *)v21 + 24))
  {

    uint64_t v15 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = [0 allKeys];
      *(_DWORD *)buf = 138543618;
      id v25 = self;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - Skipping all properties for setPlaylistProperties:trackList:forPlaylist:completionHandler: %@", buf, 0x16u);
    }
    id v14 = 0;
  }
  int64_t v17 = [(MPCloudController *)self cloudClient];
  uint64_t v18 = [v10 ICCloudItemIDList];
  objc_msgSend(v17, "sdk_setPlaylistProperties:trackList:forPlaylistPersistentID:completionHandler:", v14, v18, a5, v11);

  _Block_object_dispose(&v20, 8);
}

uint64_t __103__MPCloudController_sdk_setPlaylistProperties_trackList_forPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) canSetPlaylistProperty:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistWithPersistentID:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  id v13 = [v12 objectForKeyedSubscript:@"dateModified"];
  if (!v13)
  {
    id v13 = [MEMORY[0x1E4F1C9C8] date];
  }
  [(MPCloudController *)self _setDateModified:v13 forPlaylistPersistentID:a5];
  id v14 = _ML3CollectionPropertiesFromMPMediaItemColectionProperties(v12);

  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __99__MPCloudController_setPlaylistProperties_trackList_forPlaylistWithPersistentID_completionHandler___block_invoke;
  void v19[3] = &unk_1E57F5DB0;
  void v19[4] = self;
  v19[5] = &v20;
  [v14 enumerateKeysAndObjectsUsingBlock:v19];
  if (!*((unsigned char *)v21 + 24))
  {

    uint64_t v15 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = [0 allKeys];
      *(_DWORD *)buf = 138543618;
      id v25 = self;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - Skipping all properties for setPlaylistProperties:trackList:forPlaylist:completionHandler: %@", buf, 0x16u);
    }
    id v14 = 0;
  }
  int64_t v17 = [(MPCloudController *)self cloudClient];
  uint64_t v18 = [v10 ICCloudItemIDList];
  [v17 setPlaylistProperties:v14 trackList:v18 forPlaylistPersistentID:a5 completionHandler:v11];

  _Block_object_dispose(&v20, 8);
}

uint64_t __99__MPCloudController_setPlaylistProperties_trackList_forPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) canSetPlaylistProperty:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)canSetPlaylistProperty:(id)a3
{
  uint64_t v3 = canSetPlaylistProperty__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&canSetPlaylistProperty__onceToken, &__block_literal_global_157);
  }
  char v5 = [(id)canSetPlaylistProperty____containerProperties containsObject:v4];

  return v5;
}

void __44__MPCloudController_canSetPlaylistProperty___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"daap.incrementplaycount", @"com.apple.itunes.cloud-artwork-token", *MEMORY[0x1E4F792D0], *MEMORY[0x1E4F791E0], *MEMORY[0x1E4F791D0], *MEMORY[0x1E4F791C0], *MEMORY[0x1E4F792C0], *MEMORY[0x1E4F79170], *MEMORY[0x1E4F79180], *MEMORY[0x1E4F79140], *MEMORY[0x1E4F792E0], *MEMORY[0x1E4F79200], *MEMORY[0x1E4F791F8], *MEMORY[0x1E4F791F0], *MEMORY[0x1E4F791B8], 0);
  uint64_t v1 = (void *)canSetPlaylistProperty____containerProperties;
  canSetPlaylistProperty____containerProperties = v0;
}

- (void)addGeniusPlaylistWithPersistentID:(unint64_t)a3 name:(id)a4 seedItemSagaIDs:(id)a5 itemSagaIDs:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = [(MPCloudController *)self cloudClient];
  [v16 addGeniusPlaylistWithPersistentID:a3 name:v15 seedItemSagaIDs:v14 itemSagaIDs:v13 completionHandler:v12];
}

- (void)sdk_createPlaylistWithPersistenID:(unint64_t)a3 properties:(id)a4 tracklist:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  _ML3CollectionPropertiesFromMPMediaItemColectionProperties(a4);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [(MPCloudController *)self cloudClient];
  id v13 = [v11 ICCloudItemIDList];

  objc_msgSend(v12, "sdk_createPlaylistWithPersistentID:properties:tracklist:completionHandler:", a3, v14, v13, v10);
}

- (void)createPlaylistWithPersistentID:(unint64_t)a3 properties:(id)a4 trackList:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  _ML3CollectionPropertiesFromMPMediaItemColectionProperties(a4);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [(MPCloudController *)self cloudClient];
  id v13 = [v11 ICCloudItemIDList];

  [v12 createPlaylistWithPersistentID:a3 properties:v14 trackList:v13 completionHandler:v10];
}

- (void)updateSubscribedPlaylistWithSagaID:(unint64_t)a3 ignoreMinRefreshInterval:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [(MPCloudController *)self cloudClient];
  id v10 = [NSNumber numberWithUnsignedLongLong:a3];
  v12[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v9 updateSubscribedPlaylistsWithSagaIDs:v11 ignoreMinRefreshInterval:v5 completionHandler:v8];
}

- (BOOL)hasPurchaseHistoryAccount
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  id v4 = [(MPCloudController *)self userIdentity];
  id v11 = 0;
  BOOL v5 = [v3 getPropertiesForUserIdentity:v4 error:&v11];
  id v6 = v11;

  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_msgSend(v6, "msv_description");
      *(_DWORD *)buf = 138543618;
      id v13 = self;
      __int16 v14 = 2114;
      id v15 = v8;
      _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_ERROR, "%{public}@ hasPurchaseHistoryAccount Failed to load account properties error=%{public}@", buf, 0x16u);
    }
  }
  else if (v5)
  {
    char v9 = [v5 isActive];
    goto LABEL_8;
  }
  char v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)hasCloudLockerAccount
{
  return self->_cloudEnabled;
}

- (BOOL)canDefaultMediaLibraryShowCloudContent
{
  uint64_t v3 = +[MPMediaLibrary defaultMediaLibrary];
  uint64_t v4 = [v3 cloudFilteringType];

  if (v4 == 4)
  {
    return [(MPCloudController *)self canShowCloudMusic];
  }
  else
  {
    id v6 = +[MPMediaLibrary defaultMediaLibrary];
    uint64_t v7 = [v6 cloudFilteringType];

    if (v7 == 5)
    {
      return [(MPCloudController *)self canShowCloudVideo];
    }
    else
    {
      return 0;
    }
  }
}

- (BOOL)canShowCloudDownloadButtons
{
  return [(ICCloudAvailability *)self->_cloudAvailabilityController canShowCloudDownloadButtons];
}

- (BOOL)shouldProhibitStoreAppsActionForCurrentNetworkConditions
{
  return [(ICCloudAvailability *)self->_cloudAvailabilityController shouldProhibitStoreAppsActionForCurrentNetworkConditions];
}

- (BOOL)isCellularDataRestrictedForStoreApps
{
  return [(ICCloudAvailability *)self->_cloudAvailabilityController isCellularDataRestrictedForStoreApps];
}

- (BOOL)shouldProhibitVideosActionForCurrentNetworkConditions
{
  return [(ICCloudAvailability *)self->_cloudAvailabilityController shouldProhibitVideosActionForCurrentNetworkConditions];
}

- (BOOL)isCellularDataRestrictedForVideos
{
  return [(ICCloudAvailability *)self->_cloudAvailabilityController isCellularDataRestrictedForVideos];
}

- (BOOL)isCellularDataRestrictedForMusic
{
  return [(ICCloudAvailability *)self->_cloudAvailabilityController isCellularDataRestrictedForMusic];
}

- (BOOL)hasProperNetworkConditionsToPlayMedia
{
  return [(ICCloudAvailability *)self->_cloudAvailabilityController hasProperNetworkConditionsToPlayMedia];
}

- (ICConnectionConfiguration)configuration
{
  id v2 = [(MPCloudController *)self cloudClient];
  uint64_t v3 = [v2 configuration];

  return (ICConnectionConfiguration *)v3;
}

- (void)enableICMLErrorReasonChange:(id)a3
{
}

- (void)activeUserDidChangeNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 name];
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_INFO, "%{public}@ - Received notification [%{public}@]", (uint8_t *)&v7, 0x16u);
  }
  [(MPCloudController *)self _updateSagaEnabled];
}

- (void)isCellularDataRestrictedDidChangeNotification:(id)a3
{
}

- (void)hasProperNetworkConditionsToShowCloudMediaDidChangeNotification:(id)a3
{
}

- (void)canShowCloudTracksDidChangeNotification:(id)a3
{
}

- (void)canShowCloudDownloadButtonsDidChangeNotification:(id)a3
{
}

- (void)dealloc
{
  if (+[MPCloudController isMediaApplication])
  {
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self];
  }
  else
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  }
  v5.receiver = self;
  v5.super_class = (Class)MPCloudController;
  [(MPCloudController *)&v5 dealloc];
}

- (MPCloudController)init
{
  return (MPCloudController *)[(MPCloudController *)self _initWithUserIdentity:0];
}

void __63__MPCloudController__postNotificationName_controller_userInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543618;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - Related controller posting notification [%@]", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:*(void *)(a1 + 32) object:v3];
}

+ (id)_controllerWithUserIdentity:(id)a3 createIfRequired:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  char v9 = [v8 supportsMultipleITunesAccounts];

  if ((v9 & 1) == 0)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:a1 file:@"MPCloudController.m" lineNumber:243 description:@"Attempting to access a method only available for multi user device"];
  }
  uint64_t v10 = [v7 accountDSID];
  if (v10) {
    uint64_t v11 = (__CFString *)v10;
  }
  else {
    uint64_t v11 = @"NoDSID";
  }
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__38914;
  uint64_t v30 = __Block_byref_object_dispose__38915;
  id v31 = 0;
  id v12 = [a1 globalSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MPCloudController__controllerWithUserIdentity_createIfRequired___block_invoke;
  block[3] = &unk_1E57F5D58;
  BOOL v25 = v4;
  id v24 = a1;
  id v13 = v11;
  uint64_t v21 = v13;
  id v14 = v7;
  id v22 = v14;
  char v23 = &v26;
  dispatch_sync(v12, block);

  if (v4)
  {
    id v15 = (void *)v27[5];
    uint64_t v16 = +[MPCloudController sharedCloudController];
    [v15 _copyObservationStateFrom:v16];
  }
  id v17 = (id)v27[5];

  _Block_object_dispose(&v26, 8);

  return v17;
}

void __66__MPCloudController__controllerWithUserIdentity_createIfRequired___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64))
  {
    id v2 = [*(id *)(a1 + 56) controllers];
    id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];

    if (!v3)
    {
      BOOL v4 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 56);
        uint64_t v6 = *(void *)(a1 + 40);
        int v13 = 138543618;
        uint64_t v14 = v5;
        __int16 v15 = 2112;
        uint64_t v16 = v6;
        _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - No pre-existing controller for user identity %@", (uint8_t *)&v13, 0x16u);
      }

      id v7 = [[MPCloudController alloc] _initWithUserIdentity:*(void *)(a1 + 40)];
      id v8 = [*(id *)(a1 + 56) controllers];
      [v8 setObject:v7 forKeyedSubscript:*(void *)(a1 + 32)];
    }
  }
  char v9 = [*(id *)(a1 + 56) controllers];
  uint64_t v10 = [v9 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

+ (NSMutableDictionary)controllers
{
  if (controllers_onceToken_38967 != -1) {
    dispatch_once(&controllers_onceToken_38967, &__block_literal_global_63_38968);
  }
  id v2 = (void *)controllers___controllers_38969;

  return (NSMutableDictionary *)v2;
}

void __32__MPCloudController_controllers__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = (void *)controllers___controllers_38969;
  controllers___controllers_38969 = (uint64_t)v0;
}

+ (OS_dispatch_queue)globalSerialQueue
{
  if (globalSerialQueue_onceToken_38971 != -1) {
    dispatch_once(&globalSerialQueue_onceToken_38971, &__block_literal_global_38972);
  }
  id v2 = (void *)globalSerialQueue___globalSerialQueue_38973;

  return (OS_dispatch_queue *)v2;
}

void __38__MPCloudController_globalSerialQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.mediaplayer.MPCloudController.global.serial.queue", v2);
  uint64_t v1 = (void *)globalSerialQueue___globalSerialQueue_38973;
  globalSerialQueue___globalSerialQueue_38973 = (uint64_t)v0;
}

@end