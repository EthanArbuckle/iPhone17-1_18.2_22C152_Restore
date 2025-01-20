@interface MSPMapsPaths
+ (id)bookmarksSettingsPath;
+ (id)cacheDirectory;
+ (id)currentMapsApplicationContainerURL;
+ (id)currentMapsGroupContainerURL;
+ (id)directionsCachePath;
+ (id)directionsSettingsPath;
+ (id)failedDirectionsSettingsPath;
+ (id)failedGeoDirectionsSettingsPath;
+ (id)failedGeoSearchesSettingsPath;
+ (id)failedSearchesSettingsPath;
+ (id)favoritesSyncedMarkerFile;
+ (id)geoBookmarksSettingsPath;
+ (id)geoCollectionsSettingsPath;
+ (id)geoHistorySettingsPath;
+ (id)geoPinnedPlacesSettingsPath;
+ (id)groupDirectory;
+ (id)historySettingsPath;
+ (id)historySyncedMarkerFile;
+ (id)mapsApplicationContainerPaths;
+ (id)mapsApplicationContainerPathsWithInvalidationHandler:(id)a3;
+ (id)mapsDirectory;
+ (id)nanoDirectory;
+ (id)nanoHistorySettingsPath;
+ (id)pathsAtLocation:(int64_t)a3;
+ (id)pinsSettingsPath;
+ (id)reportAProblemDirectionsRecordingsPath;
+ (id)reportAProblemSearchRecordingsPath;
+ (id)routingAppLaunchRecordPath;
- (BOOL)_deleteSyncedFileAtPath:(id)a3;
- (BOOL)_shouldSyncMergeAfterCheckingOrCreatingMarkerFileAtPath:(id)a3;
- (BOOL)deleteFavoritesSyncedMarkerFile;
- (BOOL)deleteHistorySyncedMarkerFile;
- (BOOL)shouldSyncMergeFavoritesAfterCheckingOrCreatingMarkerFile;
- (BOOL)shouldSyncMergeHistoryAfterCheckingOrCreatingMarkerFile;
- (MSPMapsPaths)initWithLibraryDirectoryURL:(id)a3 groupLibraryURL:(id)a4 invalidationHandler:(id)a5;
- (NSString)bookmarksSettingsPath;
- (NSString)cacheDirectory;
- (NSString)directionsCachePath;
- (NSString)directionsSettingsPath;
- (NSString)failedDirectionsSettingsPath;
- (NSString)failedGeoDirectionsSettingsPath;
- (NSString)failedGeoSearchesSettingsPath;
- (NSString)failedSearchesSettingsPath;
- (NSString)favoritesSyncedMarkerFile;
- (NSString)geoBookmarksSettingsPath;
- (NSString)geoCollectionsSettingsPath;
- (NSString)geoHistorySettingsPath;
- (NSString)geoPinnedPlacesSettingsPath;
- (NSString)groupDirectory;
- (NSString)historySettingsPath;
- (NSString)historySyncedMarkerFile;
- (NSString)homeDirectory;
- (NSString)mapsDirectory;
- (NSString)nanoDirectory;
- (NSString)nanoHistorySettingsPath;
- (NSString)pinsSettingsPath;
- (NSString)reportAProblemDirectionsRecordingsPath;
- (NSString)reportAProblemNotificationsPath;
- (NSString)reportAProblemSearchRecordingsPath;
- (NSString)routingAppLaunchRecordPath;
- (void)_invalidate;
@end

@implementation MSPMapsPaths

+ (id)mapsApplicationContainerPaths
{
  return (id)[a1 mapsApplicationContainerPathsWithInvalidationHandler:0];
}

+ (id)mapsApplicationContainerPathsWithInvalidationHandler:(id)a3
{
  id v4 = a3;
  v5 = [a1 currentMapsApplicationContainerURL];
  v6 = [a1 currentMapsGroupContainerURL];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MSPMapsPaths_mapsApplicationContainerPathsWithInvalidationHandler___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mapsApplicationContainerPathsWithInvalidationHandler__onceToken == -1)
  {
    if (v5)
    {
LABEL_3:
      v7 = [v5 URLByAppendingPathComponent:@"Library" isDirectory:1];
      v8 = [v6 URLByAppendingPathComponent:@"Library" isDirectory:1];
      v9 = [[MSPMapsPaths alloc] initWithLibraryDirectoryURL:v7 groupLibraryURL:v8 invalidationHandler:v4];

      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&mapsApplicationContainerPathsWithInvalidationHandler__onceToken, block);
    if (v5) {
      goto LABEL_3;
    }
  }
  v9 = 0;
LABEL_6:

  return v9;
}

- (MSPMapsPaths)initWithLibraryDirectoryURL:(id)a3 groupLibraryURL:(id)a4 invalidationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MSPMapsPaths;
  v11 = [(MSPMapsPaths *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    libraryURL = v11->_libraryURL;
    v11->_libraryURL = (NSURL *)v12;

    uint64_t v14 = [v9 copy];
    groupLibraryURL = v11->_groupLibraryURL;
    v11->_groupLibraryURL = (NSURL *)v14;

    uint64_t v16 = [v10 copy];
    id invalidationHandler = v11->_invalidationHandler;
    v11->_id invalidationHandler = (id)v16;

    if (v11->_invalidationHandler)
    {
      v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v18 addObserver:v11 selector:sel__invalidate name:@"MSPMapsPathsAppContainerURLWasInvalidatedNotification" object:0];
    }
  }

  return v11;
}

+ (id)currentMapsApplicationContainerURL
{
  id v2 = objc_alloc(MEMORY[0x1E4F223C8]);
  uint64_t v3 = *MEMORY[0x1E4F64320];
  uint64_t v12 = 0;
  id v4 = (void *)[v2 initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v12];
  v5 = v4;
  v6 = 0;
  if (!v12)
  {
    v6 = [v4 applicationState];

    if (v6)
    {
      v7 = [v5 applicationState];
      if ([v7 isInstalled])
      {
        id v8 = [v5 applicationState];
        if ([v8 isValid])
        {
          id v9 = [v5 applicationState];
          char v10 = [v9 isRestricted];

          if ((v10 & 1) == 0)
          {
            v6 = [v5 dataContainerURL];
            goto LABEL_10;
          }
          goto LABEL_9;
        }
      }
LABEL_9:
      v6 = 0;
    }
  }
LABEL_10:

  return v6;
}

+ (id)currentMapsGroupContainerURL
{
  id v2 = objc_alloc(MEMORY[0x1E4F223C8]);
  uint64_t v3 = *MEMORY[0x1E4F64320];
  uint64_t v13 = 0;
  id v4 = (void *)[v2 initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v13];
  v5 = v4;
  v6 = 0;
  if (!v13)
  {
    v7 = [v4 applicationState];

    if (!v7)
    {
LABEL_6:
      v6 = 0;
      goto LABEL_10;
    }
    id v8 = [v5 applicationState];
    if ([v8 isInstalled])
    {
      id v9 = [v5 applicationState];
      if ([v9 isValid])
      {
        char v10 = [v5 applicationState];
        char v11 = [v10 isRestricted];

        if (v11) {
          goto LABEL_6;
        }
        id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
        v6 = [v8 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];
        goto LABEL_9;
      }
    }
    v6 = 0;
LABEL_9:
  }
LABEL_10:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportAProblemNotificationsPath, 0);
  objc_storeStrong((id *)&self->_historySyncedMarkerFile, 0);
  objc_storeStrong((id *)&self->_favoritesSyncedMarkerFile, 0);
  objc_storeStrong((id *)&self->_reportAProblemSearchRecordingsPath, 0);
  objc_storeStrong((id *)&self->_reportAProblemDirectionsRecordingsPath, 0);
  objc_storeStrong((id *)&self->_pinsSettingsPath, 0);
  objc_storeStrong((id *)&self->_directionsCachePath, 0);
  objc_storeStrong((id *)&self->_routingAppLaunchRecordPath, 0);
  objc_storeStrong((id *)&self->_failedGeoDirectionsSettingsPath, 0);
  objc_storeStrong((id *)&self->_failedDirectionsSettingsPath, 0);
  objc_storeStrong((id *)&self->_failedGeoSearchesSettingsPath, 0);
  objc_storeStrong((id *)&self->_failedSearchesSettingsPath, 0);
  objc_storeStrong((id *)&self->_nanoHistorySettingsPath, 0);
  objc_storeStrong((id *)&self->_geoHistorySettingsPath, 0);
  objc_storeStrong((id *)&self->_historySettingsPath, 0);
  objc_storeStrong((id *)&self->_directionsSettingsPath, 0);
  objc_storeStrong((id *)&self->_geoBookmarksSettingsPath, 0);
  objc_storeStrong((id *)&self->_bookmarksSettingsPath, 0);
  objc_storeStrong((id *)&self->_geoCollectionsSettingsPath, 0);
  objc_storeStrong((id *)&self->_geoPinnedPlacesSettingsPath, 0);
  objc_storeStrong((id *)&self->_nanoDirectory, 0);
  objc_storeStrong((id *)&self->_groupDirectory, 0);
  objc_storeStrong((id *)&self->_cacheDirectory, 0);
  objc_storeStrong((id *)&self->_mapsDirectory, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_groupLibraryURL, 0);

  objc_storeStrong((id *)&self->_libraryURL, 0);
}

- (NSString)groupDirectory
{
  groupDirectory = self->_groupDirectory;
  if (!groupDirectory)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __30__MSPMapsPaths_groupDirectory__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __30__MSPMapsPaths_groupDirectory__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_groupDirectory;
    self->_groupDirectory = v4;

    groupDirectory = self->_groupDirectory;
  }

  return groupDirectory;
}

id __30__MSPMapsPaths_groupDirectory__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(a1 + 32) + 16) URLByDeletingLastPathComponent];
  id v2 = [v1 path];

  return v2;
}

- (NSString)homeDirectory
{
  id v2 = [(NSURL *)self->_libraryURL URLByDeletingLastPathComponent];
  uint64_t v3 = [v2 path];

  return (NSString *)v3;
}

void __69__MSPMapsPaths_mapsApplicationContainerPathsWithInvalidationHandler___block_invoke(uint64_t a1)
{
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterAddObserver(DistributedCenter, *(const void **)(a1 + 32), (CFNotificationCallback)MSPMapsPathsSourceApplicationsChangeCallback, @"com.apple.LaunchServices.applicationRegistered", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v3 = CFNotificationCenterGetDistributedCenter();
  id v4 = *(const void **)(a1 + 32);

  CFNotificationCenterAddObserver(v3, v4, (CFNotificationCallback)MSPMapsPathsSourceApplicationsChangeCallback, @"com.apple.LaunchServices.applicationUnregistered", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

+ (id)pathsAtLocation:(int64_t)a3
{
  if (!a3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __32__MSPMapsPaths_pathsAtLocation___block_invoke_3;
    v7[3] = &__block_descriptor_40_e5_v8__0l;
    v7[4] = a1;
    if (qword_1EB7F4550 == -1)
    {
      uint64_t v3 = &qword_1EB7F4548;
      goto LABEL_10;
    }
    uint64_t v3 = &qword_1EB7F4548;
    v5 = &qword_1EB7F4550;
    v6 = v7;
LABEL_17:
    dispatch_once(v5, v6);
    goto LABEL_10;
  }
  if (a3 == 2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__MSPMapsPaths_pathsAtLocation___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (qword_1EB7F4540 == -1)
    {
      uint64_t v3 = &qword_1EB7F4538;
      goto LABEL_10;
    }
    uint64_t v3 = &qword_1EB7F4538;
    v5 = &qword_1EB7F4540;
    v6 = block;
    goto LABEL_17;
  }
  if (a3 != 1) {
    goto LABEL_11;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__MSPMapsPaths_pathsAtLocation___block_invoke;
  v9[3] = &__block_descriptor_40_e5_v8__0l;
  v9[4] = a1;
  if (qword_1EB7F4530 != -1)
  {
    uint64_t v3 = &_MergedGlobals_39;
    v5 = &qword_1EB7F4530;
    v6 = v9;
    goto LABEL_17;
  }
  uint64_t v3 = &_MergedGlobals_39;
LABEL_10:
  a2 = (SEL)(id)*v3;
LABEL_11:

  return (id)(id)a2;
}

void __32__MSPMapsPaths_pathsAtLocation___block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile/Library"];
  uint64_t v2 = [objc_alloc(*(Class *)(a1 + 32)) initWithLibraryDirectoryURL:v4 groupLibraryURL:0 invalidationHandler:0];
  uint64_t v3 = (void *)_MergedGlobals_39;
  _MergedGlobals_39 = v2;
}

void __32__MSPMapsPaths_pathsAtLocation___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() currentMapsApplicationContainerURL];
  id v7 = [v2 URLByAppendingPathComponent:@"Library" isDirectory:1];

  uint64_t v3 = [(id)objc_opt_class() currentMapsGroupContainerURL];
  id v4 = [v3 URLByAppendingPathComponent:@"Library" isDirectory:1];

  uint64_t v5 = [objc_alloc(*(Class *)(a1 + 32)) initWithLibraryDirectoryURL:v7 groupLibraryURL:v4 invalidationHandler:0];
  v6 = (void *)qword_1EB7F4538;
  qword_1EB7F4538 = v5;
}

void __32__MSPMapsPaths_pathsAtLocation___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v2 URLForDirectory:5 inDomain:1 appropriateForURL:0 create:0 error:0];

  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [v3 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];
  uint64_t v5 = [v4 URLByAppendingPathComponent:@"Library"];

  uint64_t v6 = [objc_alloc(*(Class *)(a1 + 32)) initWithLibraryDirectoryURL:v8 groupLibraryURL:v5 invalidationHandler:0];
  id v7 = (void *)qword_1EB7F4548;
  qword_1EB7F4548 = v6;
}

- (void)_invalidate
{
  id invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2](invalidationHandler, a2);
    id v4 = self->_invalidationHandler;
    self->_id invalidationHandler = 0;
  }
}

+ (id)mapsDirectory
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 mapsDirectory];

  return v3;
}

- (NSString)mapsDirectory
{
  mapsDirectory = self->_mapsDirectory;
  if (!mapsDirectory)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __29__MSPMapsPaths_mapsDirectory__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __29__MSPMapsPaths_mapsDirectory__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_mapsDirectory;
    self->_mapsDirectory = v4;

    mapsDirectory = self->_mapsDirectory;
  }

  return mapsDirectory;
}

id __29__MSPMapsPaths_mapsDirectory__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(a1 + 32) + 8) path];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"Maps"];

  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_msgSend(v3, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v2, 0);

  return v2;
}

+ (id)cacheDirectory
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 cacheDirectory];

  return v3;
}

- (NSString)cacheDirectory
{
  cacheDirectory = self->_cacheDirectory;
  if (!cacheDirectory)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __30__MSPMapsPaths_cacheDirectory__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __30__MSPMapsPaths_cacheDirectory__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_cacheDirectory;
    self->_cacheDirectory = v4;

    cacheDirectory = self->_cacheDirectory;
  }

  return cacheDirectory;
}

id __30__MSPMapsPaths_cacheDirectory__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(a1 + 32) + 8) path];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"Caches"];

  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_msgSend(v3, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v2, 0);

  return v2;
}

+ (id)groupDirectory
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 groupDirectory];

  return v3;
}

+ (id)nanoDirectory
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 nanoDirectory];

  return v3;
}

- (NSString)nanoDirectory
{
  nanoDirectory = self->_nanoDirectory;
  if (!nanoDirectory)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2050000000;
    id v4 = (void *)qword_1EB7F4558;
    uint64_t v15 = qword_1EB7F4558;
    if (!qword_1EB7F4558)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __getNRPairedDeviceRegistryClass_block_invoke;
      v11[3] = &unk_1E617CA58;
      v11[4] = &v12;
      __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v11);
      id v4 = (void *)v13[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v12, 8);
    uint64_t v6 = [v5 sharedInstance];
    id v7 = [v6 pairingStorePath];

    id v8 = [v7 stringByAppendingPathComponent:@"NanoMaps"];

    id v9 = self->_nanoDirectory;
    self->_nanoDirectory = v8;

    nanoDirectory = self->_nanoDirectory;
  }

  return nanoDirectory;
}

+ (id)geoPinnedPlacesSettingsPath
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 geoPinnedPlacesSettingsPath];

  return v3;
}

- (NSString)geoPinnedPlacesSettingsPath
{
  geoPinnedPlacesSettingsPath = self->_geoPinnedPlacesSettingsPath;
  if (!geoPinnedPlacesSettingsPath)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__MSPMapsPaths_geoPinnedPlacesSettingsPath__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __43__MSPMapsPaths_geoPinnedPlacesSettingsPath__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_geoPinnedPlacesSettingsPath;
    self->_geoPinnedPlacesSettingsPath = v4;

    geoPinnedPlacesSettingsPath = self->_geoPinnedPlacesSettingsPath;
  }

  return geoPinnedPlacesSettingsPath;
}

id __43__MSPMapsPaths_geoPinnedPlacesSettingsPath__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mapsDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"GeoPinnedPlaces.plist"];

  return v2;
}

+ (id)geoCollectionsSettingsPath
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 geoCollectionsSettingsPath];

  return v3;
}

- (NSString)geoCollectionsSettingsPath
{
  geoCollectionsSettingsPath = self->_geoCollectionsSettingsPath;
  if (!geoCollectionsSettingsPath)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__MSPMapsPaths_geoCollectionsSettingsPath__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __42__MSPMapsPaths_geoCollectionsSettingsPath__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_geoCollectionsSettingsPath;
    self->_geoCollectionsSettingsPath = v4;

    geoCollectionsSettingsPath = self->_geoCollectionsSettingsPath;
  }

  return geoCollectionsSettingsPath;
}

id __42__MSPMapsPaths_geoCollectionsSettingsPath__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mapsDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"GeoCollections.plist"];

  return v2;
}

+ (id)bookmarksSettingsPath
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 bookmarksSettingsPath];

  return v3;
}

- (NSString)bookmarksSettingsPath
{
  bookmarksSettingsPath = self->_bookmarksSettingsPath;
  if (!bookmarksSettingsPath)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__MSPMapsPaths_bookmarksSettingsPath__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __37__MSPMapsPaths_bookmarksSettingsPath__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_bookmarksSettingsPath;
    self->_bookmarksSettingsPath = v4;

    bookmarksSettingsPath = self->_bookmarksSettingsPath;
  }

  return bookmarksSettingsPath;
}

id __37__MSPMapsPaths_bookmarksSettingsPath__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mapsDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"Bookmarks.plist"];

  return v2;
}

+ (id)geoBookmarksSettingsPath
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 geoBookmarksSettingsPath];

  return v3;
}

- (NSString)geoBookmarksSettingsPath
{
  geoBookmarksSettingsPath = self->_geoBookmarksSettingsPath;
  if (!geoBookmarksSettingsPath)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__MSPMapsPaths_geoBookmarksSettingsPath__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __40__MSPMapsPaths_geoBookmarksSettingsPath__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_geoBookmarksSettingsPath;
    self->_geoBookmarksSettingsPath = v4;

    geoBookmarksSettingsPath = self->_geoBookmarksSettingsPath;
  }

  return geoBookmarksSettingsPath;
}

id __40__MSPMapsPaths_geoBookmarksSettingsPath__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mapsDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"GeoBookmarks.plist"];

  return v2;
}

+ (id)directionsSettingsPath
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 directionsSettingsPath];

  return v3;
}

- (NSString)directionsSettingsPath
{
  directionsSettingsPath = self->_directionsSettingsPath;
  if (!directionsSettingsPath)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__MSPMapsPaths_directionsSettingsPath__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __38__MSPMapsPaths_directionsSettingsPath__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_directionsSettingsPath;
    self->_directionsSettingsPath = v4;

    directionsSettingsPath = self->_directionsSettingsPath;
  }

  return directionsSettingsPath;
}

id __38__MSPMapsPaths_directionsSettingsPath__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mapsDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"Directions.mapsdata"];

  return v2;
}

+ (id)historySettingsPath
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 historySettingsPath];

  return v3;
}

- (NSString)historySettingsPath
{
  historySettingsPath = self->_historySettingsPath;
  if (!historySettingsPath)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35__MSPMapsPaths_historySettingsPath__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __35__MSPMapsPaths_historySettingsPath__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_historySettingsPath;
    self->_historySettingsPath = v4;

    historySettingsPath = self->_historySettingsPath;
  }

  return historySettingsPath;
}

id __35__MSPMapsPaths_historySettingsPath__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mapsDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"History.mapsdata"];

  return v2;
}

+ (id)geoHistorySettingsPath
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 geoHistorySettingsPath];

  return v3;
}

- (NSString)geoHistorySettingsPath
{
  geoHistorySettingsPath = self->_geoHistorySettingsPath;
  if (!geoHistorySettingsPath)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__MSPMapsPaths_geoHistorySettingsPath__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __38__MSPMapsPaths_geoHistorySettingsPath__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_geoHistorySettingsPath;
    self->_geoHistorySettingsPath = v4;

    geoHistorySettingsPath = self->_geoHistorySettingsPath;
  }

  return geoHistorySettingsPath;
}

id __38__MSPMapsPaths_geoHistorySettingsPath__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mapsDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"GeoHistory.mapsdata"];

  return v2;
}

+ (id)nanoHistorySettingsPath
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 nanoHistorySettingsPath];

  return v3;
}

- (NSString)nanoHistorySettingsPath
{
  nanoHistorySettingsPath = self->_nanoHistorySettingsPath;
  if (!nanoHistorySettingsPath)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__MSPMapsPaths_nanoHistorySettingsPath__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __39__MSPMapsPaths_nanoHistorySettingsPath__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_nanoHistorySettingsPath;
    self->_nanoHistorySettingsPath = v4;

    nanoHistorySettingsPath = self->_nanoHistorySettingsPath;
  }

  return nanoHistorySettingsPath;
}

id __39__MSPMapsPaths_nanoHistorySettingsPath__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) nanoDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"GeoHistory.mapsdata"];

  return v2;
}

+ (id)failedSearchesSettingsPath
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 failedSearchesSettingsPath];

  return v3;
}

- (NSString)failedSearchesSettingsPath
{
  failedSearchesSettingsPath = self->_failedSearchesSettingsPath;
  if (!failedSearchesSettingsPath)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__MSPMapsPaths_failedSearchesSettingsPath__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __42__MSPMapsPaths_failedSearchesSettingsPath__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_failedSearchesSettingsPath;
    self->_failedSearchesSettingsPath = v4;

    failedSearchesSettingsPath = self->_failedSearchesSettingsPath;
  }

  return failedSearchesSettingsPath;
}

id __42__MSPMapsPaths_failedSearchesSettingsPath__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mapsDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"FailedSearches.mapsdata"];

  return v2;
}

+ (id)failedGeoSearchesSettingsPath
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 failedGeoSearchesSettingsPath];

  return v3;
}

- (NSString)failedGeoSearchesSettingsPath
{
  failedGeoSearchesSettingsPath = self->_failedGeoSearchesSettingsPath;
  if (!failedGeoSearchesSettingsPath)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__MSPMapsPaths_failedGeoSearchesSettingsPath__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __45__MSPMapsPaths_failedGeoSearchesSettingsPath__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_failedGeoSearchesSettingsPath;
    self->_failedGeoSearchesSettingsPath = v4;

    failedGeoSearchesSettingsPath = self->_failedGeoSearchesSettingsPath;
  }

  return failedGeoSearchesSettingsPath;
}

id __45__MSPMapsPaths_failedGeoSearchesSettingsPath__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mapsDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"MSPFailedSearches.mapsdata"];

  return v2;
}

+ (id)failedDirectionsSettingsPath
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 failedDirectionsSettingsPath];

  return v3;
}

- (NSString)failedDirectionsSettingsPath
{
  failedDirectionsSettingsPath = self->_failedDirectionsSettingsPath;
  if (!failedDirectionsSettingsPath)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__MSPMapsPaths_failedDirectionsSettingsPath__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __44__MSPMapsPaths_failedDirectionsSettingsPath__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_failedDirectionsSettingsPath;
    self->_failedDirectionsSettingsPath = v4;

    failedDirectionsSettingsPath = self->_failedDirectionsSettingsPath;
  }

  return failedDirectionsSettingsPath;
}

id __44__MSPMapsPaths_failedDirectionsSettingsPath__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mapsDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"FailedDirections.mapsdata"];

  return v2;
}

+ (id)failedGeoDirectionsSettingsPath
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 failedGeoDirectionsSettingsPath];

  return v3;
}

- (NSString)failedGeoDirectionsSettingsPath
{
  failedGeoDirectionsSettingsPath = self->_failedGeoDirectionsSettingsPath;
  if (!failedGeoDirectionsSettingsPath)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__MSPMapsPaths_failedGeoDirectionsSettingsPath__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __47__MSPMapsPaths_failedGeoDirectionsSettingsPath__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_failedGeoDirectionsSettingsPath;
    self->_failedGeoDirectionsSettingsPath = v4;

    failedGeoDirectionsSettingsPath = self->_failedGeoDirectionsSettingsPath;
  }

  return failedGeoDirectionsSettingsPath;
}

id __47__MSPMapsPaths_failedGeoDirectionsSettingsPath__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mapsDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"MSPFailedDirections.mapsdata"];

  return v2;
}

+ (id)routingAppLaunchRecordPath
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 routingAppLaunchRecordPath];

  return v3;
}

- (NSString)routingAppLaunchRecordPath
{
  routingAppLaunchRecordPath = self->_routingAppLaunchRecordPath;
  if (!routingAppLaunchRecordPath)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__MSPMapsPaths_routingAppLaunchRecordPath__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __42__MSPMapsPaths_routingAppLaunchRecordPath__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_routingAppLaunchRecordPath;
    self->_routingAppLaunchRecordPath = v4;

    routingAppLaunchRecordPath = self->_routingAppLaunchRecordPath;
  }

  return routingAppLaunchRecordPath;
}

id __42__MSPMapsPaths_routingAppLaunchRecordPath__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mapsDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"RoutingAppLaunches.mapsdata"];

  return v2;
}

+ (id)directionsCachePath
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 directionsCachePath];

  return v3;
}

- (NSString)directionsCachePath
{
  directionsCachePath = self->_directionsCachePath;
  if (!directionsCachePath)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35__MSPMapsPaths_directionsCachePath__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __35__MSPMapsPaths_directionsCachePath__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_directionsCachePath;
    self->_directionsCachePath = v4;

    directionsCachePath = self->_directionsCachePath;
  }

  return directionsCachePath;
}

id __35__MSPMapsPaths_directionsCachePath__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) cacheDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"DirectionsCache.mapsdata"];

  return v2;
}

+ (id)pinsSettingsPath
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 pinsSettingsPath];

  return v3;
}

- (NSString)pinsSettingsPath
{
  pinsSettingsPath = self->_pinsSettingsPath;
  if (!pinsSettingsPath)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __32__MSPMapsPaths_pinsSettingsPath__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __32__MSPMapsPaths_pinsSettingsPath__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_pinsSettingsPath;
    self->_pinsSettingsPath = v4;

    pinsSettingsPath = self->_pinsSettingsPath;
  }

  return pinsSettingsPath;
}

id __32__MSPMapsPaths_pinsSettingsPath__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mapsDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"Pins.mapsdata"];

  return v2;
}

+ (id)reportAProblemDirectionsRecordingsPath
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 reportAProblemDirectionsRecordingsPath];

  return v3;
}

- (NSString)reportAProblemDirectionsRecordingsPath
{
  reportAProblemDirectionsRecordingsPath = self->_reportAProblemDirectionsRecordingsPath;
  if (!reportAProblemDirectionsRecordingsPath)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__MSPMapsPaths_reportAProblemDirectionsRecordingsPath__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __54__MSPMapsPaths_reportAProblemDirectionsRecordingsPath__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_reportAProblemDirectionsRecordingsPath;
    self->_reportAProblemDirectionsRecordingsPath = v4;

    reportAProblemDirectionsRecordingsPath = self->_reportAProblemDirectionsRecordingsPath;
  }

  return reportAProblemDirectionsRecordingsPath;
}

id __54__MSPMapsPaths_reportAProblemDirectionsRecordingsPath__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mapsDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"ReportAProblem"];
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"GraphDirections"];

  return v3;
}

+ (id)reportAProblemSearchRecordingsPath
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 reportAProblemSearchRecordingsPath];

  return v3;
}

- (NSString)reportAProblemSearchRecordingsPath
{
  reportAProblemSearchRecordingsPath = self->_reportAProblemSearchRecordingsPath;
  if (!reportAProblemSearchRecordingsPath)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__MSPMapsPaths_reportAProblemSearchRecordingsPath__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __50__MSPMapsPaths_reportAProblemSearchRecordingsPath__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_reportAProblemSearchRecordingsPath;
    self->_reportAProblemSearchRecordingsPath = v4;

    reportAProblemSearchRecordingsPath = self->_reportAProblemSearchRecordingsPath;
  }

  return reportAProblemSearchRecordingsPath;
}

id __50__MSPMapsPaths_reportAProblemSearchRecordingsPath__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mapsDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"ReportAProblem"];
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"Search"];

  return v3;
}

+ (id)favoritesSyncedMarkerFile
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 favoritesSyncedMarkerFile];

  return v3;
}

- (NSString)favoritesSyncedMarkerFile
{
  favoritesSyncedMarkerFile = self->_favoritesSyncedMarkerFile;
  if (!favoritesSyncedMarkerFile)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__MSPMapsPaths_favoritesSyncedMarkerFile__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __41__MSPMapsPaths_favoritesSyncedMarkerFile__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_favoritesSyncedMarkerFile;
    self->_favoritesSyncedMarkerFile = v4;

    favoritesSyncedMarkerFile = self->_favoritesSyncedMarkerFile;
  }

  return favoritesSyncedMarkerFile;
}

id __41__MSPMapsPaths_favoritesSyncedMarkerFile__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mapsDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"Bookmarks.synced"];

  return v2;
}

+ (id)historySyncedMarkerFile
{
  uint64_t v2 = [a1 pathsAtLocation:0];
  uint64_t v3 = [v2 historySyncedMarkerFile];

  return v3;
}

- (NSString)historySyncedMarkerFile
{
  historySyncedMarkerFile = self->_historySyncedMarkerFile;
  if (!historySyncedMarkerFile)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__MSPMapsPaths_historySyncedMarkerFile__block_invoke;
    v7[3] = &unk_1E617CA30;
    v7[4] = self;
    __39__MSPMapsPaths_historySyncedMarkerFile__block_invoke((uint64_t)v7);
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_historySyncedMarkerFile;
    self->_historySyncedMarkerFile = v4;

    historySyncedMarkerFile = self->_historySyncedMarkerFile;
  }

  return historySyncedMarkerFile;
}

id __39__MSPMapsPaths_historySyncedMarkerFile__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) mapsDirectory];
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"History.synced"];

  return v2;
}

- (BOOL)_shouldSyncMergeAfterCheckingOrCreatingMarkerFileAtPath:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  char v6 = [v5 checkResourceIsReachableAndReturnError:0];
  if ((v6 & 1) == 0)
  {
    id v7 = [v5 path];
    id v8 = [MEMORY[0x1E4F1C9B8] data];
    int v9 = [v4 createFileAtPath:v7 contents:v8 attributes:0];

    char v10 = [v5 path];
    char v11 = MSPExcludePathFromBackup(v10);

    if (!v9 || (v11 & 1) == 0)
    {
      uint64_t v12 = [v5 path];
      [v4 removeItemAtPath:v12 error:0];

      NSLog(&cfstr_CouldnTSetNoBa.isa, v3);
    }
  }

  return v6 ^ 1;
}

- (BOOL)_deleteSyncedFileAtPath:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  char v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];

  if ([v6 checkResourceIsReachableAndReturnError:0])
  {
    id v11 = 0;
    char v7 = [v5 removeItemAtURL:v6 error:&v11];
    id v8 = v11;
    int v9 = v8;
    if (v8) {
      NSLog(&cfstr_ErrorRemovingS.isa, v8);
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)shouldSyncMergeFavoritesAfterCheckingOrCreatingMarkerFile
{
  uint64_t v2 = self;
  id v3 = [(MSPMapsPaths *)self favoritesSyncedMarkerFile];
  LOBYTE(v2) = [(MSPMapsPaths *)v2 _shouldSyncMergeAfterCheckingOrCreatingMarkerFileAtPath:v3];

  return (char)v2;
}

- (BOOL)deleteFavoritesSyncedMarkerFile
{
  uint64_t v2 = self;
  id v3 = [(MSPMapsPaths *)self favoritesSyncedMarkerFile];
  LOBYTE(v2) = [(MSPMapsPaths *)v2 _deleteSyncedFileAtPath:v3];

  return (char)v2;
}

- (BOOL)shouldSyncMergeHistoryAfterCheckingOrCreatingMarkerFile
{
  uint64_t v2 = self;
  id v3 = [(MSPMapsPaths *)self historySyncedMarkerFile];
  LOBYTE(v2) = [(MSPMapsPaths *)v2 _shouldSyncMergeAfterCheckingOrCreatingMarkerFileAtPath:v3];

  return (char)v2;
}

- (BOOL)deleteHistorySyncedMarkerFile
{
  uint64_t v2 = self;
  id v3 = [(MSPMapsPaths *)self historySyncedMarkerFile];
  LOBYTE(v2) = [(MSPMapsPaths *)v2 _deleteSyncedFileAtPath:v3];

  return (char)v2;
}

- (NSString)reportAProblemNotificationsPath
{
  return self->_reportAProblemNotificationsPath;
}

@end