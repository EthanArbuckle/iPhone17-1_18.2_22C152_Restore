@interface PhotosCustomNotificationsController
- (PHPhotoLibrary)systemPhotoLibrary;
- (id)memoriesNotificationEnabledForSpecifier:(id)a3;
- (id)sharedAlbumsNotificationEnabledForSpecifier:(id)a3;
- (id)sharedLibraryDeletionNotificationsNotificationEnabledForSpecifier:(id)a3;
- (id)sharedLibrarySuggestionsNotificationEnabledForSpecifier:(id)a3;
- (id)sharingSuggestionsNotificationEnabledForSpecifier:(id)a3;
- (id)specifiers;
- (void)photoLibraryDidBecomeUnavailable:(id)a3;
- (void)setMemoriesNotificationEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setSharedAlbumsNotificationEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setSharedLibraryDeletionNotificationsNotificationEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setSharedLibrarySuggestionsNotificationEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setSharingSuggestionsNotificationEnabled:(id)a3 forSpecifier:(id)a4;
@end

@implementation PhotosCustomNotificationsController

- (void).cxx_destruct
{
}

- (void)photoLibraryDidBecomeUnavailable:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [v6 unregisterAvailabilityObserver:v4];
  systemPhotoLibrary = v4->_systemPhotoLibrary;
  v4->_systemPhotoLibrary = 0;

  objc_sync_exit(v4);
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = objc_opt_new();
    id v6 = +[PSSpecifier groupSpecifierWithID:@"PhotosGroup" name:0];
    [v5 addObject:v6];

    v7 = PLLocalizedFrameworkString();
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"setMemoriesNotificationEnabled:forSpecifier:" get:"memoriesNotificationEnabledForSpecifier:" detail:0 cell:6 edit:0];

    uint64_t v9 = PSAllowMultilineTitleKey;
    [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
    v10 = PLLocalizedFrameworkString();
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"setSharedAlbumsNotificationEnabled:forSpecifier:" get:"sharedAlbumsNotificationEnabledForSpecifier:" detail:0 cell:6 edit:0];

    [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:v9];
    v27[0] = v8;
    v27[1] = v11;
    v12 = +[NSArray arrayWithObjects:v27 count:2];
    [v5 addObjectsFromArray:v12];

    v13 = [(PhotosCustomNotificationsController *)self systemPhotoLibrary];
    v14 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v13];

    if (PXSharedLibraryShouldDisplaySettings())
    {
      PLLocalizedFrameworkString();
      v15 = v25 = v5;
      v16 = +[PSSpecifier groupSpecifierWithID:@"SharedLibraryGroup" name:v15];

      objc_msgSend(v16, "setObject:forKeyedSubscript:");
      v17 = PLLocalizedFrameworkString();
      v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:"setSharedLibrarySuggestionsNotificationEnabled:forSpecifier:" get:"sharedLibrarySuggestionsNotificationEnabledForSpecifier:" detail:0 cell:6 edit:0];

      [v18 setObject:&__kCFBooleanTrue forKeyedSubscript:v9];
      v19 = PLLocalizedFrameworkString();
      v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:"setSharedLibraryDeletionNotificationsNotificationEnabled:forSpecifier:" get:"sharedLibraryDeletionNotificationsNotificationEnabledForSpecifier:" detail:0 cell:6 edit:0];

      [v20 setObject:&__kCFBooleanTrue forKeyedSubscript:v9];
      v26[0] = v16;
      v26[1] = v18;
      v26[2] = v20;
      v21 = +[NSArray arrayWithObjects:v26 count:3];
      [v25 addObjectsFromArray:v21];

      v5 = v25;
    }
    id v22 = [v5 copy];
    v23 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v22;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)setSharedLibraryDeletionNotificationsNotificationEnabled:(id)a3 forSpecifier:(id)a4
{
  uint64_t v4 = kNotificationEnablementKeySharedLibraryDeletionNotifications;
  id v5 = [a3 BOOLValue];

  _PLSetNotificationTypeEnabledForKey(v4, v5);
}

- (id)sharedLibraryDeletionNotificationsNotificationEnabledForSpecifier:(id)a3
{
  uint64_t v3 = PLIsNotificationTypeEnabledForKey();

  return +[NSNumber numberWithBool:v3];
}

- (void)setSharedLibrarySuggestionsNotificationEnabled:(id)a3 forSpecifier:(id)a4
{
  uint64_t v4 = kNotificationEnablementKeySharedLibrarySuggestions;
  id v5 = [a3 BOOLValue];

  _PLSetNotificationTypeEnabledForKey(v4, v5);
}

- (id)sharedLibrarySuggestionsNotificationEnabledForSpecifier:(id)a3
{
  uint64_t v3 = PLIsNotificationTypeEnabledForKey();

  return +[NSNumber numberWithBool:v3];
}

- (void)setSharingSuggestionsNotificationEnabled:(id)a3 forSpecifier:(id)a4
{
  uint64_t v4 = kNotificationEnablementKeySharingSuggestions;
  id v5 = [a3 BOOLValue];

  _PLSetNotificationTypeEnabledForKey(v4, v5);
}

- (id)sharingSuggestionsNotificationEnabledForSpecifier:(id)a3
{
  uint64_t v3 = PLIsNotificationTypeEnabledForKey();

  return +[NSNumber numberWithBool:v3];
}

- (void)setSharedAlbumsNotificationEnabled:(id)a3 forSpecifier:(id)a4
{
  uint64_t v4 = kNotificationEnablementKeySharedAlbums;
  id v5 = [a3 BOOLValue];

  _PLSetNotificationTypeEnabledForKey(v4, v5);
}

- (id)sharedAlbumsNotificationEnabledForSpecifier:(id)a3
{
  uint64_t v3 = PLIsNotificationTypeEnabledForKey();

  return +[NSNumber numberWithBool:v3];
}

- (void)setMemoriesNotificationEnabled:(id)a3 forSpecifier:(id)a4
{
  uint64_t v4 = kNotificationEnablementKeyMemories;
  id v5 = [a3 BOOLValue];

  _PLSetNotificationTypeEnabledForKey(v4, v5);
}

- (id)memoriesNotificationEnabledForSpecifier:(id)a3
{
  uint64_t v3 = PLIsNotificationTypeEnabledForKey();

  return +[NSNumber numberWithBool:v3];
}

- (PHPhotoLibrary)systemPhotoLibrary
{
  v2 = self;
  objc_sync_enter(v2);
  systemPhotoLibrary = v2->_systemPhotoLibrary;
  if (!systemPhotoLibrary)
  {
    id v4 = objc_alloc((Class)PHPhotoLibrary);
    id v5 = +[PHPhotoLibrary systemPhotoLibraryURL];
    id v6 = (PHPhotoLibrary *)[v4 initWithPhotoLibraryURL:v5];
    v7 = v2->_systemPhotoLibrary;
    v2->_systemPhotoLibrary = v6;

    v8 = v2->_systemPhotoLibrary;
    id v18 = 0;
    LODWORD(v4) = [(PHPhotoLibrary *)v8 openAndWaitWithUpgrade:0 error:&v18];
    id v9 = v18;
    v10 = v9;
    if (v4)
    {
      [(PHPhotoLibrary *)v2->_systemPhotoLibrary registerAvailabilityObserver:v2];
LABEL_11:

      systemPhotoLibrary = v2->_systemPhotoLibrary;
      goto LABEL_12;
    }
    if (v9)
    {
      v11 = PLUIGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v10;
        v12 = "Failed to open system photo library with error: %@";
        v13 = v11;
        uint32_t v14 = 12;
LABEL_9:
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      }
    }
    else
    {
      v11 = PLUIGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v12 = "Failed to open system photo library";
        v13 = v11;
        uint32_t v14 = 2;
        goto LABEL_9;
      }
    }

    v15 = v2->_systemPhotoLibrary;
    v2->_systemPhotoLibrary = 0;

    goto LABEL_11;
  }
LABEL_12:
  v16 = systemPhotoLibrary;
  objc_sync_exit(v2);

  return v16;
}

@end