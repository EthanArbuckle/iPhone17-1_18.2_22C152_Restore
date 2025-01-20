@interface HSCloudClient
- (BOOL)canShowCloudDownloadButtons;
- (BOOL)canShowCloudMusic;
- (BOOL)canShowCloudVideo;
- (BOOL)hasProperNetworkConditionsToPlayMedia;
- (BOOL)hasProperNetworkConditionsToShowCloudMedia;
- (BOOL)isCellularDataRestrictedForMusic;
- (BOOL)isCellularDataRestrictedForStoreApps;
- (BOOL)isCellularDataRestrictedForVideos;
- (BOOL)isMediaKindDisabledForJaliscoLibrary:(int64_t)a3;
- (BOOL)shouldProhibitMusicActionForCurrentNetworkConditions;
- (BOOL)shouldProhibitStoreAppsActionForCurrentNetworkConditions;
- (BOOL)shouldProhibitVideosActionForCurrentNetworkConditions;
- (HSCloudClient)init;
- (HSCloudClient)initWithConfiguration:(id)a3;
- (id)_ICCloudItemIDListFromHSCloudItemIDList:(id)a3;
- (id)_ICConnectionConfigurationFromHSConnectionConfiguration:(id)a3;
- (id)updateInProgressChangedHandler;
- (id)updateJaliscoInProgressChangedHandler;
- (id)updateSagaInProgressChangedHandler;
- (void)_serverJaliscoUpdateInProgressDidChange;
- (void)_serverSagaUpdateInProgressDidChange;
- (void)addGeniusPlaylistWithPersistentID:(int64_t)a3 name:(id)a4 seedItemSagaIDs:(id)a5 itemSagaIDs:(id)a6 completionHandler:(id)a7;
- (void)addItemWithSagaID:(int64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 completionHandler:(id)a5;
- (void)addStoreItemWithAdamID:(int64_t)a3 completionHandler:(id)a4;
- (void)addStoreItemWithAdamID:(int64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 completionHandler:(id)a5;
- (void)addStorePlaylistWithGlobalID:(id)a3 completionHandler:(id)a4;
- (void)authenticateAndStartInitialImport:(BOOL)a3 completionHandler:(id)a4;
- (void)authenticateWithCompletionHandler:(id)a3;
- (void)becomeActive;
- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)deauthenticateWithCompletionHandler:(id)a3;
- (void)deprioritizeAlbumArtistHeroImageForPersistentID:(int64_t)a3;
- (void)deprioritizeArtistHeroImageForPersistentID:(int64_t)a3;
- (void)deprioritizeContainerArtworkForSagaID:(unint64_t)a3;
- (void)deprioritizeItemArtworkForPurchaseHistoryID:(unint64_t)a3;
- (void)deprioritizeItemArtworkForSagaID:(unint64_t)a3;
- (void)deprioritizeScreenshotForPurchaseHistoryID:(unint64_t)a3;
- (void)deprioritizeScreenshotForSagaID:(unint64_t)a3;
- (void)deprioritizeSubscriptionContainerArtworkForPersistentID:(int64_t)a3;
- (void)deprioritizeSubscriptionItemArtworkForPersistentID:(int64_t)a3;
- (void)deprioritizeSubscriptionScreenshotForPersistentID:(int64_t)a3;
- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4;
- (void)importAlbumArtistHeroImageForPersistentID:(int64_t)a3 completionHandler:(id)a4;
- (void)importArtistHeroImageForPersistentID:(int64_t)a3 completionHandler:(id)a4;
- (void)importContainerArtworkForSagaID:(unint64_t)a3 completionHandler:(id)a4;
- (void)importItemArtworkForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4;
- (void)importItemArtworkForSagaID:(unint64_t)a3 completionHandler:(id)a4;
- (void)importScreenshotForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4;
- (void)importScreenshotForSagaID:(unint64_t)a3 completionHandler:(id)a4;
- (void)importSubscriptionContainerArtworkForPersistentID:(int64_t)a3 completionHandler:(id)a4;
- (void)importSubscriptionItemArtworkForPersistentID:(int64_t)a3 completionHandler:(id)a4;
- (void)importSubscriptionScreenshotForPersistentID:(int64_t)a3 completionHandler:(id)a4;
- (void)isAuthenticatedWithCompletionHandler:(id)a3;
- (void)isAuthenticatedWithQueue:(id)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForContainerSagaID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForContainerSagaIDs:(id)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForSagaID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForSagaIDs:(id)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForSubscriptionContainerPersistentID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForSubscriptionContainerPersistentIDs:(id)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForSubscriptionItemPersistentID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForSubscriptionItemPersistentIDs:(id)a3 completionHandler:(id)a4;
- (void)loadBooksForStoreIDs:(id)a3 withCompletionHandler:(id)a4;
- (void)loadGeniusItemsForSagaID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadIsJaliscoUpdateInProgressWithCompletionHandler:(id)a3;
- (void)loadIsSagaUpdateInProgressWithCompletionHandler:(id)a3;
- (void)loadJaliscoUpdateProgressWithCompletionHandler:(id)a3;
- (void)loadLastKnownEnableICMLErrorStatusWithCompletionHander:(id)a3;
- (void)loadSagaUpdateProgressWithCompletionHandler:(id)a3;
- (void)loadScreenshotInfoForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadScreenshotInfoForPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4;
- (void)loadScreenshotInfoForSagaID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadScreenshotInfoForSagaIDs:(id)a3 completionHandler:(id)a4;
- (void)loadScreenshotInfoForSubscriptionPersistentID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadScreenshotInfoForSubscriptionPersistentIDs:(id)a3 completionHandler:(id)a4;
- (void)loadUpdateProgressWithCompletionHandler:(id)a3;
- (void)publishPlaylistWithSagaID:(int64_t)a3 completionHandler:(id)a4;
- (void)removeItemsWithSagaIDs:(id)a3 completionHandler:(id)a4;
- (void)removeJaliscoLibraryWithCompletionHander:(id)a3;
- (void)removePlaylistsWithSagaIDs:(id)a3 completionHandler:(id)a4;
- (void)resetConfiguration:(id)a3;
- (void)resignActive;
- (void)sdk_addStoreItemWithOpaqueID:(id)a3 completionHandler:(id)a4;
- (void)sdk_addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(int64_t)a4 completionHandler:(id)a5;
- (void)sdk_createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 tracklist:(id)a5 completionHandler:(id)a6;
- (void)setAlbumProperties:(id)a3 forAlbumPersistentID:(int64_t)a4 completionHandler:(id)a5;
- (void)setDaemonConfiguration:(unint64_t)a3;
- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4;
- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4;
- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 completionHandler:(id)a6;
- (void)setPreferredVideoQuality:(int64_t)a3;
- (void)setUpdateInProgressChangedHandler:(id)a3;
- (void)setUpdateJaliscoInProgressChangedHandler:(id)a3;
- (void)setUpdateSagaInProgressChangedHandler:(id)a3;
- (void)updateArtistHeroImages;
- (void)updateJaliscoLibraryWithCompletionHandler:(id)a3;
- (void)updateJaliscoLibraryWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)updateSagaLibraryWithCompletionHandler:(id)a3;
- (void)updateSagaLibraryWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)updateSubscribedPlaylistsWithSagaIDs:(id)a3 ignoreMinRefreshInterval:(BOOL)a4 completionHandler:(id)a5;
- (void)uploadArtworkForPlaylistWithPersistentID:(int64_t)a3 completionHandler:(id)a4;
- (void)uploadCloudItemProperties;
- (void)uploadCloudPlaylistProperties;
@end

@implementation HSCloudClient

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateJaliscoInProgressChangedHandler, 0);
  objc_storeStrong(&self->_updateSagaInProgressChangedHandler, 0);
  objc_storeStrong(&self->_updateInProgressChangedHandler, 0);
  objc_storeStrong((id *)&self->_icCloudClient, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)setUpdateJaliscoInProgressChangedHandler:(id)a3
{
}

- (id)updateJaliscoInProgressChangedHandler
{
  return self->_updateJaliscoInProgressChangedHandler;
}

- (void)setUpdateSagaInProgressChangedHandler:(id)a3
{
}

- (id)updateSagaInProgressChangedHandler
{
  return self->_updateSagaInProgressChangedHandler;
}

- (void)setUpdateInProgressChangedHandler:(id)a3
{
}

- (id)updateInProgressChangedHandler
{
  return self->_updateInProgressChangedHandler;
}

- (id)_ICConnectionConfigurationFromHSConnectionConfiguration:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x263F890E0];
    id v4 = a3;
    id v5 = [v3 alloc];
    v6 = [v4 userIdentity];
    v7 = [v4 userIdentityStore];
    v8 = (void *)[v5 initWithUserIdentity:v6 userIdentityStore:v7];

    v9 = [v4 baseURL];
    [v8 setBaseURL:v9];

    v10 = [v4 libraryBagKey];
    [v8 setLibraryBagKey:v10];

    v11 = [v4 buildIdentifier];
    [v8 setBuildIdentifier:v11];

    v12 = [v4 purchaseClientIdentifier];
    [v8 setPurchaseClientIdentifier:v12];

    objc_msgSend(v8, "setRequestReason:", objc_msgSend(v4, "requestReason"));
    v13 = [v4 familyMemberStoreID];

    [v8 setFamilyMemberStoreID:v13];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_ICCloudItemIDListFromHSCloudItemIDList:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x263F890D0];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __57__HSCloudClient__ICCloudItemIDListFromHSCloudItemIDList___block_invoke;
    v8[3] = &unk_26423A178;
    id v6 = v5;
    id v9 = v6;
    [v4 enumerateCloudItemIDsUsingBlock:v8];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

uint64_t __57__HSCloudClient__ICCloudItemIDListFromHSCloudItemIDList___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addCloudItemID:a2 idType:a3];
}

- (void)_serverJaliscoUpdateInProgressDidChange
{
  uint64_t v3 = [(HSCloudClient *)self updateJaliscoInProgressChangedHandler];
  uint64_t v4 = [(HSCloudClient *)self updateInProgressChangedHandler];
  if (v3 | v4)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __56__HSCloudClient__serverJaliscoUpdateInProgressDidChange__block_invoke;
    v5[3] = &unk_26423A150;
    id v6 = (id)v3;
    id v7 = (id)v4;
    [(HSCloudClient *)self loadIsJaliscoUpdateInProgressWithCompletionHandler:v5];
  }
}

uint64_t __56__HSCloudClient__serverJaliscoUpdateInProgressDidChange__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, a2, a3);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)_serverSagaUpdateInProgressDidChange
{
  uint64_t v3 = [(HSCloudClient *)self updateSagaInProgressChangedHandler];
  uint64_t v4 = [(HSCloudClient *)self updateInProgressChangedHandler];
  if (v3 | v4)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __53__HSCloudClient__serverSagaUpdateInProgressDidChange__block_invoke;
    v5[3] = &unk_26423A150;
    id v6 = (id)v3;
    id v7 = (id)v4;
    [(HSCloudClient *)self loadIsSagaUpdateInProgressWithCompletionHandler:v5];
  }
}

uint64_t __53__HSCloudClient__serverSagaUpdateInProgressDidChange__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, a2, a3);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (BOOL)canShowCloudVideo
{
  return [(ICCloudClient *)self->_icCloudClient canShowCloudVideo];
}

- (BOOL)canShowCloudMusic
{
  return [(ICCloudClient *)self->_icCloudClient canShowCloudMusic];
}

- (BOOL)canShowCloudDownloadButtons
{
  return [(ICCloudClient *)self->_icCloudClient canShowCloudDownloadButtons];
}

- (BOOL)shouldProhibitStoreAppsActionForCurrentNetworkConditions
{
  return [(ICCloudClient *)self->_icCloudClient shouldProhibitStoreAppsActionForCurrentNetworkConditions];
}

- (BOOL)isCellularDataRestrictedForStoreApps
{
  return [(ICCloudClient *)self->_icCloudClient isCellularDataRestrictedForStoreApps];
}

- (BOOL)shouldProhibitVideosActionForCurrentNetworkConditions
{
  return [(ICCloudClient *)self->_icCloudClient shouldProhibitVideosActionForCurrentNetworkConditions];
}

- (BOOL)isCellularDataRestrictedForVideos
{
  return [(ICCloudClient *)self->_icCloudClient isCellularDataRestrictedForVideos];
}

- (BOOL)shouldProhibitMusicActionForCurrentNetworkConditions
{
  return [(ICCloudClient *)self->_icCloudClient shouldProhibitMusicActionForCurrentNetworkConditions];
}

- (BOOL)isCellularDataRestrictedForMusic
{
  return [(ICCloudClient *)self->_icCloudClient isCellularDataRestrictedForMusic];
}

- (BOOL)hasProperNetworkConditionsToShowCloudMedia
{
  return [(ICCloudClient *)self->_icCloudClient hasProperNetworkConditionsToShowCloudMedia];
}

- (BOOL)hasProperNetworkConditionsToPlayMedia
{
  return [(ICCloudClient *)self->_icCloudClient hasProperNetworkConditionsToPlayMedia];
}

- (void)loadBooksForStoreIDs:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__HSCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke;
  v9[3] = &unk_26423A0D8;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient loadBooksForStoreIDs:a3 withCompletionHandler:v9];
}

void __60__HSCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  if (v4)
  {
    id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  }
  else
  {
    id v6 = 0;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
        v13 = objc_alloc_init(HSBook);
        -[HSBook setPurchaseHistoryID:](v13, "setPurchaseHistoryID:", [v12 purchaseHistoryID]);
        -[HSBook setStoreID:](v13, "setStoreID:", [v12 storeID]);
        v14 = [v12 title];
        [(HSBook *)v13 setTitle:v14];

        v15 = [v12 author];
        [(HSBook *)v13 setAuthor:v15];

        v16 = [v12 genre];
        [(HSBook *)v13 setGenre:v16];

        v17 = [v12 datePurchased];
        [(HSBook *)v13 setDatePurchased:v17];

        v18 = [v12 artworkURL];
        [(HSBook *)v13 setArtworkURL:v18];

        v19 = [v12 redownloadParameters];
        [(HSBook *)v13 setRedownloadParameters:v19];

        -[HSBook setVppLicensed:](v13, "setVppLicensed:", [v12 isVPPLicensed]);
        v20 = [v12 vppOrganizationID];
        [(HSBook *)v13 setVppOrganizationID:v20];

        v21 = [v12 vppOrganizationDisplayName];
        [(HSBook *)v13 setVppOrganizationDisplayName:v21];

        [v6 addObject:v13];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  uint64_t v22 = *(void *)(a1 + 32);
  if (v22) {
    (*(void (**)(uint64_t, void *, id))(v22 + 16))(v22, v6, v5);
  }
}

- (void)updateArtistHeroImages
{
}

- (void)setAlbumProperties:(id)a3 forAlbumPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  icCloudClient = self->_icCloudClient;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__HSCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke;
  v11[3] = &unk_264239FC0;
  id v12 = v8;
  id v10 = v8;
  [(ICCloudClient *)icCloudClient setAlbumProperties:a3 forAlbumPersistentID:a4 completionHandler:v11];
}

uint64_t __75__HSCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)uploadCloudPlaylistProperties
{
}

- (void)uploadCloudItemProperties
{
}

- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4
{
}

- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4
{
}

- (void)setPreferredVideoQuality:(int64_t)a3
{
}

- (void)setDaemonConfiguration:(unint64_t)a3
{
}

- (void)resignActive
{
}

- (void)resetConfiguration:(id)a3
{
  self->_configuration = [(HSCloudClient *)self _ICConnectionConfigurationFromHSConnectionConfiguration:a3];
  MEMORY[0x270F9A758]();
}

- (void)loadJaliscoUpdateProgressWithCompletionHandler:(id)a3
{
  id v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__HSCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke;
  v7[3] = &unk_26423A100;
  id v8 = v4;
  id v6 = v4;
  [(ICCloudClient *)icCloudClient loadJaliscoUpdateProgressWithCompletionHandler:v7];
}

uint64_t __64__HSCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadSagaUpdateProgressWithCompletionHandler:(id)a3
{
  id v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__HSCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke;
  v7[3] = &unk_26423A100;
  id v8 = v4;
  id v6 = v4;
  [(ICCloudClient *)icCloudClient loadSagaUpdateProgressWithCompletionHandler:v7];
}

uint64_t __61__HSCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadIsJaliscoUpdateInProgressWithCompletionHandler:(id)a3
{
  id v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__HSCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke;
  v7[3] = &unk_26423A128;
  id v8 = v4;
  id v6 = v4;
  [(ICCloudClient *)icCloudClient loadIsJaliscoUpdateInProgressWithCompletionHandler:v7];
}

uint64_t __68__HSCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadIsSagaUpdateInProgressWithCompletionHandler:(id)a3
{
  id v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__HSCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke;
  v7[3] = &unk_26423A128;
  id v8 = v4;
  id v6 = v4;
  [(ICCloudClient *)icCloudClient loadIsSagaUpdateInProgressWithCompletionHandler:v7];
}

uint64_t __65__HSCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadUpdateProgressWithCompletionHandler:(id)a3
{
  id v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HSCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke;
  v7[3] = &unk_26423A100;
  id v8 = v4;
  id v6 = v4;
  [(ICCloudClient *)icCloudClient loadUpdateProgressWithCompletionHandler:v7];
}

uint64_t __57__HSCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadGeniusItemsForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__HSCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke;
  v9[3] = &unk_26423A0D8;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient loadGeniusItemsForSagaID:a3 completionHandler:v9];
}

uint64_t __60__HSCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadArtworkInfoForSubscriptionContainerPersistentIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __88__HSCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke;
  v9[3] = &unk_26423A0B0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient loadArtworkInfoForSubscriptionContainerPersistentIDs:a3 completionHandler:v9];
}

uint64_t __88__HSCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadArtworkInfoForSubscriptionContainerPersistentID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __87__HSCloudClient_loadArtworkInfoForSubscriptionContainerPersistentID_completionHandler___block_invoke;
  v9[3] = &unk_26423A088;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient loadArtworkInfoForSubscriptionContainerPersistentID:a3 completionHandler:v9];
}

uint64_t __87__HSCloudClient_loadArtworkInfoForSubscriptionContainerPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadScreenshotInfoForSubscriptionPersistentIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82__HSCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke;
  v9[3] = &unk_26423A0B0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient loadScreenshotInfoForSubscriptionPersistentIDs:a3 completionHandler:v9];
}

uint64_t __82__HSCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadScreenshotInfoForSubscriptionPersistentID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__HSCloudClient_loadScreenshotInfoForSubscriptionPersistentID_completionHandler___block_invoke;
  v9[3] = &unk_26423A088;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient loadScreenshotInfoForSubscriptionPersistentID:a3 completionHandler:v9];
}

uint64_t __81__HSCloudClient_loadScreenshotInfoForSubscriptionPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadArtworkInfoForSubscriptionItemPersistentIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __83__HSCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke;
  v9[3] = &unk_26423A0B0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient loadArtworkInfoForSubscriptionItemPersistentIDs:a3 completionHandler:v9];
}

uint64_t __83__HSCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadArtworkInfoForSubscriptionItemPersistentID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82__HSCloudClient_loadArtworkInfoForSubscriptionItemPersistentID_completionHandler___block_invoke;
  v9[3] = &unk_26423A088;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient loadArtworkInfoForSubscriptionItemPersistentID:a3 completionHandler:v9];
}

uint64_t __82__HSCloudClient_loadArtworkInfoForSubscriptionItemPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadScreenshotInfoForSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__HSCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke;
  v9[3] = &unk_26423A0B0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient loadScreenshotInfoForSagaIDs:a3 completionHandler:v9];
}

uint64_t __64__HSCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadScreenshotInfoForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__HSCloudClient_loadScreenshotInfoForSagaID_completionHandler___block_invoke;
  v9[3] = &unk_26423A088;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient loadScreenshotInfoForSagaID:a3 completionHandler:v9];
}

uint64_t __63__HSCloudClient_loadScreenshotInfoForSagaID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadArtworkInfoForContainerSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__HSCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke;
  v9[3] = &unk_26423A0B0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient loadArtworkInfoForContainerSagaIDs:a3 completionHandler:v9];
}

uint64_t __70__HSCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadArtworkInfoForContainerSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__HSCloudClient_loadArtworkInfoForContainerSagaID_completionHandler___block_invoke;
  v9[3] = &unk_26423A088;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient loadArtworkInfoForContainerSagaID:a3 completionHandler:v9];
}

uint64_t __69__HSCloudClient_loadArtworkInfoForContainerSagaID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadArtworkInfoForSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__HSCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke;
  v9[3] = &unk_26423A0B0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient loadArtworkInfoForSagaIDs:a3 completionHandler:v9];
}

uint64_t __61__HSCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadArtworkInfoForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__HSCloudClient_loadArtworkInfoForSagaID_completionHandler___block_invoke;
  v9[3] = &unk_26423A088;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient loadArtworkInfoForSagaID:a3 completionHandler:v9];
}

uint64_t __60__HSCloudClient_loadArtworkInfoForSagaID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadScreenshotInfoForPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__HSCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke;
  v9[3] = &unk_26423A0B0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient loadScreenshotInfoForPurchaseHistoryIDs:a3 completionHandler:v9];
}

uint64_t __75__HSCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadScreenshotInfoForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__HSCloudClient_loadScreenshotInfoForPurchaseHistoryID_completionHandler___block_invoke;
  v9[3] = &unk_26423A088;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient loadScreenshotInfoForPurchaseHistoryID:a3 completionHandler:v9];
}

uint64_t __74__HSCloudClient_loadScreenshotInfoForPurchaseHistoryID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadArtworkInfoForPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__HSCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke;
  v9[3] = &unk_26423A0B0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient loadArtworkInfoForPurchaseHistoryIDs:a3 completionHandler:v9];
}

uint64_t __72__HSCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadArtworkInfoForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__HSCloudClient_loadArtworkInfoForPurchaseHistoryID_completionHandler___block_invoke;
  v9[3] = &unk_26423A088;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient loadArtworkInfoForPurchaseHistoryID:a3 completionHandler:v9];
}

uint64_t __71__HSCloudClient_loadArtworkInfoForPurchaseHistoryID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deprioritizeAlbumArtistHeroImageForPersistentID:(int64_t)a3
{
}

- (void)deprioritizeArtistHeroImageForPersistentID:(int64_t)a3
{
}

- (void)deprioritizeSubscriptionContainerArtworkForPersistentID:(int64_t)a3
{
}

- (void)deprioritizeSubscriptionScreenshotForPersistentID:(int64_t)a3
{
}

- (void)deprioritizeSubscriptionItemArtworkForPersistentID:(int64_t)a3
{
}

- (void)deprioritizeContainerArtworkForSagaID:(unint64_t)a3
{
}

- (void)deprioritizeScreenshotForSagaID:(unint64_t)a3
{
}

- (void)deprioritizeItemArtworkForSagaID:(unint64_t)a3
{
}

- (void)deprioritizeScreenshotForPurchaseHistoryID:(unint64_t)a3
{
}

- (void)deprioritizeItemArtworkForPurchaseHistoryID:(unint64_t)a3
{
}

- (void)importAlbumArtistHeroImageForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__HSCloudClient_importAlbumArtistHeroImageForPersistentID_completionHandler___block_invoke;
  v9[3] = &unk_264239FC0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient importAlbumArtistHeroImageForPersistentID:a3 completionHandler:v9];
}

uint64_t __77__HSCloudClient_importAlbumArtistHeroImageForPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)importArtistHeroImageForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__HSCloudClient_importArtistHeroImageForPersistentID_completionHandler___block_invoke;
  v9[3] = &unk_264239FC0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient importArtistHeroImageForPersistentID:a3 completionHandler:v9];
}

uint64_t __72__HSCloudClient_importArtistHeroImageForPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)importSubscriptionContainerArtworkForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __85__HSCloudClient_importSubscriptionContainerArtworkForPersistentID_completionHandler___block_invoke;
  v9[3] = &unk_264239FC0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient importSubscriptionContainerArtworkForPersistentID:a3 completionHandler:v9];
}

uint64_t __85__HSCloudClient_importSubscriptionContainerArtworkForPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)importSubscriptionScreenshotForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__HSCloudClient_importSubscriptionScreenshotForPersistentID_completionHandler___block_invoke;
  v9[3] = &unk_264239FC0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient importSubscriptionScreenshotForPersistentID:a3 completionHandler:v9];
}

uint64_t __79__HSCloudClient_importSubscriptionScreenshotForPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)importSubscriptionItemArtworkForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__HSCloudClient_importSubscriptionItemArtworkForPersistentID_completionHandler___block_invoke;
  v9[3] = &unk_264239FC0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient importSubscriptionItemArtworkForPersistentID:a3 completionHandler:v9];
}

uint64_t __80__HSCloudClient_importSubscriptionItemArtworkForPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)importContainerArtworkForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__HSCloudClient_importContainerArtworkForSagaID_completionHandler___block_invoke;
  v9[3] = &unk_264239FC0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient importContainerArtworkForSagaID:a3 completionHandler:v9];
}

uint64_t __67__HSCloudClient_importContainerArtworkForSagaID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)importScreenshotForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__HSCloudClient_importScreenshotForSagaID_completionHandler___block_invoke;
  v9[3] = &unk_264239FC0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient importScreenshotForSagaID:a3 completionHandler:v9];
}

uint64_t __61__HSCloudClient_importScreenshotForSagaID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)importItemArtworkForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__HSCloudClient_importItemArtworkForSagaID_completionHandler___block_invoke;
  v9[3] = &unk_264239FC0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient importItemArtworkForSagaID:a3 completionHandler:v9];
}

uint64_t __62__HSCloudClient_importItemArtworkForSagaID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)importScreenshotForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__HSCloudClient_importScreenshotForPurchaseHistoryID_completionHandler___block_invoke;
  v9[3] = &unk_264239FC0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient importScreenshotForPurchaseHistoryID:a3 completionHandler:v9];
}

uint64_t __72__HSCloudClient_importScreenshotForPurchaseHistoryID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)importItemArtworkForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__HSCloudClient_importItemArtworkForPurchaseHistoryID_completionHandler___block_invoke;
  v9[3] = &unk_264239FC0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient importItemArtworkForPurchaseHistoryID:a3 completionHandler:v9];
}

uint64_t __73__HSCloudClient_importItemArtworkForPurchaseHistoryID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)loadLastKnownEnableICMLErrorStatusWithCompletionHander:(id)a3
{
  id v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__HSCloudClient_loadLastKnownEnableICMLErrorStatusWithCompletionHander___block_invoke;
  v7[3] = &unk_26423A060;
  id v8 = v4;
  id v6 = v4;
  [(ICCloudClient *)icCloudClient loadLastKnownEnableICMLErrorStatusWithCompletionHander:v7];
}

uint64_t __72__HSCloudClient_loadLastKnownEnableICMLErrorStatusWithCompletionHander___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)isAuthenticatedWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__HSCloudClient_isAuthenticatedWithQueue_completionHandler___block_invoke;
  v9[3] = &unk_26423A038;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient isAuthenticatedWithQueue:a3 completionHandler:v9];
}

uint64_t __60__HSCloudClient_isAuthenticatedWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)isAuthenticatedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__HSCloudClient_isAuthenticatedWithCompletionHandler___block_invoke;
  v7[3] = &unk_26423A038;
  id v8 = v4;
  id v6 = v4;
  [(ICCloudClient *)icCloudClient isAuthenticatedWithCompletionHandler:v7];
}

uint64_t __54__HSCloudClient_isAuthenticatedWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deauthenticateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__HSCloudClient_deauthenticateWithCompletionHandler___block_invoke;
  v7[3] = &unk_264239FC0;
  id v8 = v4;
  id v6 = v4;
  [(ICCloudClient *)icCloudClient deauthenticateWithCompletionHandler:v7];
}

uint64_t __53__HSCloudClient_deauthenticateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateSagaLibraryWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__HSCloudClient_updateSagaLibraryWithReason_completionHandler___block_invoke;
  v9[3] = &unk_26423A038;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient updateSagaLibraryWithReason:a3 completionHandler:v9];
}

uint64_t __63__HSCloudClient_updateSagaLibraryWithReason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateSagaLibraryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__HSCloudClient_updateSagaLibraryWithCompletionHandler___block_invoke;
  v6[3] = &unk_26423A038;
  id v7 = v4;
  id v5 = v4;
  [(HSCloudClient *)self updateSagaLibraryWithReason:0 completionHandler:v6];
}

uint64_t __56__HSCloudClient_updateSagaLibraryWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateJaliscoLibraryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__HSCloudClient_updateJaliscoLibraryWithCompletionHandler___block_invoke;
  v6[3] = &unk_26423A038;
  id v7 = v4;
  id v5 = v4;
  [(HSCloudClient *)self updateJaliscoLibraryWithReason:0 completionHandler:v6];
}

uint64_t __59__HSCloudClient_updateJaliscoLibraryWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)isMediaKindDisabledForJaliscoLibrary:(int64_t)a3
{
  return [(ICCloudClient *)self->_icCloudClient isMediaKindDisabledForJaliscoLibrary:a3];
}

- (void)removeJaliscoLibraryWithCompletionHander:(id)a3
{
  id v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__HSCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke;
  v7[3] = &unk_264239FC0;
  id v8 = v4;
  id v6 = v4;
  [(ICCloudClient *)icCloudClient removeJaliscoLibraryWithCompletionHander:v7];
}

uint64_t __58__HSCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateJaliscoLibraryWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__HSCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke;
  v9[3] = &unk_26423A038;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient updateJaliscoLibraryWithReason:a3 completionHandler:v9];
}

uint64_t __66__HSCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)becomeActive
{
}

- (void)authenticateAndStartInitialImport:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__HSCloudClient_authenticateAndStartInitialImport_completionHandler___block_invoke;
  v9[3] = &unk_264239FC0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient authenticateAndStartInitialImport:v4 completionHandler:v9];
}

uint64_t __69__HSCloudClient_authenticateAndStartInitialImport_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)authenticateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  icCloudClient = self->_icCloudClient;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__HSCloudClient_authenticateWithCompletionHandler___block_invoke;
  v7[3] = &unk_264239FC0;
  id v8 = v4;
  id v6 = v4;
  [(ICCloudClient *)icCloudClient authenticateWithCompletionHandler:v7];
}

uint64_t __51__HSCloudClient_authenticateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addGeniusPlaylistWithPersistentID:(int64_t)a3 name:(id)a4 seedItemSagaIDs:(id)a5 itemSagaIDs:(id)a6 completionHandler:(id)a7
{
  id v11 = a7;
  icCloudClient = self->_icCloudClient;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __102__HSCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke;
  v14[3] = &unk_264239F98;
  id v15 = v11;
  id v13 = v11;
  [(ICCloudClient *)icCloudClient addGeniusPlaylistWithPersistentID:a3 name:a4 seedItemSagaIDs:a5 itemSagaIDs:a5 completionHandler:v14];
}

uint64_t __102__HSCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__HSCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke;
  v9[3] = &unk_264239FC0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient hideItemsWithPurchaseHistoryIDs:a3 completionHandler:v9];
}

uint64_t __67__HSCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke(uint64_t a1)
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
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__HSCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke;
  v9[3] = &unk_264239FC0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient removeItemsWithSagaIDs:a3 completionHandler:v9];
}

uint64_t __58__HSCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removePlaylistsWithSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__HSCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke;
  v9[3] = &unk_264239FC0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient removePlaylistsWithSagaIDs:a3 completionHandler:v9];
}

uint64_t __62__HSCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addStorePlaylistWithGlobalID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__HSCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke;
  v9[3] = &unk_264239FE8;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient addStorePlaylistWithGlobalID:a3 completionHandler:v9];
}

uint64_t __64__HSCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sdk_addStoreItemWithOpaqueID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__HSCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke;
  v9[3] = &unk_264239FE8;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient sdk_addStoreItemWithOpaqueID:a3 completionHandler:v9];
}

uint64_t __64__HSCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addStoreItemWithAdamID:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__HSCloudClient_addStoreItemWithAdamID_completionHandler___block_invoke;
  v9[3] = &unk_264239FE8;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient addStoreItemWithAdamID:a3 referral:0 completionHandler:v9];
}

uint64_t __58__HSCloudClient_addStoreItemWithAdamID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateSubscribedPlaylistsWithSagaIDs:(id)a3 ignoreMinRefreshInterval:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  icCloudClient = self->_icCloudClient;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __97__HSCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke;
  v11[3] = &unk_264239FC0;
  id v12 = v8;
  id v10 = v8;
  [(ICCloudClient *)icCloudClient updateSubscribedPlaylistsWithSagaIDs:a3 ignoreMinRefreshInterval:v5 completionHandler:v11];
}

uint64_t __97__HSCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)uploadArtworkForPlaylistWithPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__HSCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke;
  v9[3] = &unk_264239FC0;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient uploadArtworkForPlaylistWithPersistentID:a3 completionHandler:v9];
}

uint64_t __76__HSCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)publishPlaylistWithSagaID:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  icCloudClient = self->_icCloudClient;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__HSCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke;
  v9[3] = &unk_26423A010;
  id v10 = v6;
  id v8 = v6;
  [(ICCloudClient *)icCloudClient publishPlaylistWithSagaID:a3 completionHandler:v9];
}

uint64_t __61__HSCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sdk_addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  icCloudClient = self->_icCloudClient;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __91__HSCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke;
  v11[3] = &unk_264239FE8;
  id v12 = v8;
  id v10 = v8;
  [(ICCloudClient *)icCloudClient sdk_addStoreItemWithOpaqueID:a3 toPlaylistWithPersistentID:a4 completionHandler:v11];
}

uint64_t __91__HSCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addItemWithSagaID:(int64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  icCloudClient = self->_icCloudClient;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__HSCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke;
  v11[3] = &unk_264239FC0;
  id v12 = v8;
  id v10 = v8;
  [(ICCloudClient *)icCloudClient addItemWithSagaID:a3 toPlaylistWithPersistentID:a4 completionHandler:v11];
}

uint64_t __80__HSCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addStoreItemWithAdamID:(int64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  icCloudClient = self->_icCloudClient;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __85__HSCloudClient_addStoreItemWithAdamID_toPlaylistWithPersistentID_completionHandler___block_invoke;
  v11[3] = &unk_264239FC0;
  id v12 = v8;
  id v10 = v8;
  [(ICCloudClient *)icCloudClient addStoreItemWithAdamID:a3 referral:0 toPlaylistWithPersistentID:a4 completionHandler:v11];
}

uint64_t __85__HSCloudClient_addStoreItemWithAdamID_toPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  icCloudClient = self->_icCloudClient;
  id v12 = a3;
  id v13 = [(HSCloudClient *)self _ICCloudItemIDListFromHSCloudItemIDList:a4];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __91__HSCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke;
  v15[3] = &unk_264239FC0;
  id v16 = v10;
  id v14 = v10;
  [(ICCloudClient *)icCloudClient setPlaylistProperties:v12 trackList:v13 forPlaylistPersistentID:a5 completionHandler:v15];
}

uint64_t __91__HSCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sdk_createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 tracklist:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  icCloudClient = self->_icCloudClient;
  id v12 = a4;
  id v13 = [(HSCloudClient *)self _ICCloudItemIDListFromHSCloudItemIDList:a5];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __91__HSCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke;
  v15[3] = &unk_264239F98;
  id v16 = v10;
  id v14 = v10;
  [(ICCloudClient *)icCloudClient sdk_createPlaylistWithPersistentID:a3 properties:v12 tracklist:v13 completionHandler:v15];
}

uint64_t __91__HSCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  icCloudClient = self->_icCloudClient;
  id v12 = a4;
  id v13 = [(HSCloudClient *)self _ICCloudItemIDListFromHSCloudItemIDList:a5];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __87__HSCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke;
  v15[3] = &unk_264239F98;
  id v16 = v10;
  id v14 = v10;
  [(ICCloudClient *)icCloudClient createPlaylistWithPersistentID:a3 properties:v12 trackList:v13 completionHandler:v15];
}

uint64_t __87__HSCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.itunescloudd.launched", 0);
  id v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"com.apple.itunescloudd.sagaUpdateInProgressChanged", 0);
  BOOL v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, @"com.apple.itunescloudd.jaliscoUpdateInProgressChanged", 0);
  v6.receiver = self;
  v6.super_class = (Class)HSCloudClient;
  [(HSCloudClient *)&v6 dealloc];
}

- (HSCloudClient)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HSCloudClient;
  BOOL v5 = [(HSCloudClient *)&v14 init];
  objc_super v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(HSCloudClient *)v5 _ICConnectionConfigurationFromHSConnectionConfiguration:v4];
    configuration = v6->_configuration;
    v6->_configuration = (ICConnectionConfiguration *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F890C8]) initWithConfiguration:v6->_configuration];
    icCloudClient = v6->_icCloudClient;
    v6->_icCloudClient = (ICCloudClient *)v9;

    v6->_preferredVideoQuality = -1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_ServerJaliscoUpdateInProgressDidChangeNotification, @"com.apple.itunescloudd.jaliscoUpdateInProgressChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    id v12 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v12, v6, (CFNotificationCallback)_ServerSagaUpdateInProgressDidChangeNotification, @"com.apple.itunescloudd.sagaUpdateInProgressChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v6;
}

- (HSCloudClient)init
{
  return [(HSCloudClient *)self initWithConfiguration:0];
}

@end