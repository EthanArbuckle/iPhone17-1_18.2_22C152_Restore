@interface ClarityUIAppSetupCoordinator
+ (id)sharedInstance;
- (BOOL)_bundleIdentifierProvidesOwnSettings:(id)a3;
- (BOOL)bundleIdentifierHasClaritySettings:(id)a3;
- (BOOL)bundleIdentifierHasClaritySettings:(id)a3 includingSystem:(BOOL)a4;
- (ClarityUIAppSetupCoordinator)init;
- (NSMutableDictionary)applicationIdentifiersToDataSources;
- (id)_dataSourceForBundleIdentifier:(id)a3;
- (id)_detailTextForApplicationIdentifier:(id)a3;
- (id)_displayNameForApplicationIdentifier:(id)a3;
- (id)_iconForApplicationIdentifier:(id)a3;
- (id)clarityBundleNameForBundleIdentifier:(id)a3;
- (id)createPrivacyDisclosureControllerForBundleIdentifier:(id)a3;
- (id)createSettingsControllerForBundleIdentifier:(id)a3;
- (id)createSetupControllerForBundleIdentifier:(id)a3;
- (id)createSetupNavigationControllerForBundleIdentifier:(id)a3;
- (void)setApplicationIdentifiersToDataSources:(id)a3;
@end

@implementation ClarityUIAppSetupCoordinator

- (ClarityUIAppSetupCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)ClarityUIAppSetupCoordinator;
  v2 = [(ClarityUIAppSetupCoordinator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    applicationIdentifiersToDataSources = v2->_applicationIdentifiersToDataSources;
    v2->_applicationIdentifiersToDataSources = (NSMutableDictionary *)v3;

    v2->_applicationIdentifiersToDataSourcesLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_59);
  }
  v2 = (void *)sharedInstance_SharedSettings;

  return v2;
}

void __46__ClarityUIAppSetupCoordinator_sharedInstance__block_invoke(id a1)
{
  v1 = objc_alloc_init(ClarityUIAppSetupCoordinator);
  uint64_t v2 = sharedInstance_SharedSettings;
  sharedInstance_SharedSettings = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

- (id)createPrivacyDisclosureControllerForBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [ClarityUIAppPrivacyDisclosureController alloc];
  objc_super v6 = [(ClarityUIAppSetupCoordinator *)self _displayNameForApplicationIdentifier:v4];
  v7 = [(ClarityUIAppSetupCoordinator *)self _iconForApplicationIdentifier:v4];
  v8 = [(ClarityUIAppPrivacyDisclosureController *)v5 initWithApplicationTitle:v6 icon:v7 bundleIdentifier:v4];

  return v8;
}

- (id)createSetupNavigationControllerForBundleIdentifier:(id)a3
{
  uint64_t v3 = [(ClarityUIAppSetupCoordinator *)self createSetupControllerForBundleIdentifier:a3];
  if (v3)
  {
    id v4 = [[ClarityAppSetupNavigationController alloc] initWithSetupController:v3];
    [(ClarityAppSetupNavigationController *)v4 setModalPresentationStyle:5];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)createSetupControllerForBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(ClarityUIAppSetupCoordinator *)self _displayNameForApplicationIdentifier:v4];
  objc_super v6 = [(ClarityUIAppSetupCoordinator *)self _iconForApplicationIdentifier:v4];
  v7 = [(ClarityUIAppSetupCoordinator *)self _detailTextForApplicationIdentifier:v4];
  if ([(ClarityUIAppSetupCoordinator *)self _bundleIdentifierProvidesOwnSettings:v4])
  {
    v8 = [(ClarityUIAppSetupCoordinator *)self clarityBundleNameForBundleIdentifier:v4];
    v9 = PSBundlePathForPreferenceBundle();
    v10 = SFRuntimeAbsoluteFilePathForPath();
    v11 = +[NSBundle bundleWithPath:v10];

    id v12 = objc_alloc_init((Class)[v11 principalClass]);
    if (v12)
    {
      v13 = [[ClarityUIAppSetupController alloc] initWithTitle:v5 detailText:v7 icon:v6 controller:v12 identifier:v4];
    }
    else
    {
      v15 = CLFLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ClarityUIAppSetupCoordinator createSetupControllerForBundleIdentifier:]();
      }

      v13 = 0;
    }
  }
  else
  {
    v14 = [(ClarityUIAppSetupCoordinator *)self _dataSourceForBundleIdentifier:v4];
    id v12 = v14;
    if (v14)
    {
      if ([v14 hasClaritySettings])
      {
        v13 = [[ClarityUIAppSetupController alloc] initWithTitle:v5 detailText:v7 icon:v6 dataSource:v12];
        goto LABEL_15;
      }
    }
    else
    {
      v16 = CLFLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[ClarityUIAppSetupCoordinator createSetupControllerForBundleIdentifier:]();
      }
    }
    v13 = 0;
  }
LABEL_15:

  return v13;
}

- (id)createSettingsControllerForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([(ClarityUIAppSetupCoordinator *)self _bundleIdentifierProvidesOwnSettings:v4])
  {
    v5 = 0;
    goto LABEL_11;
  }
  objc_super v6 = [(ClarityUIAppSetupCoordinator *)self _dataSourceForBundleIdentifier:v4];
  v7 = v6;
  if (!v6)
  {
    v8 = CLFLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ClarityUIAppSetupCoordinator createSetupControllerForBundleIdentifier:]();
    }

    goto LABEL_9;
  }
  if (![v6 hasClaritySettings])
  {
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  v5 = [[ClarityUISettingsListController alloc] initWithDataSource:v7];
LABEL_10:

LABEL_11:

  return v5;
}

- (BOOL)bundleIdentifierHasClaritySettings:(id)a3
{
  return [(ClarityUIAppSetupCoordinator *)self bundleIdentifierHasClaritySettings:a3 includingSystem:1];
}

- (BOOL)bundleIdentifierHasClaritySettings:(id)a3 includingSystem:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(ClarityUIAppSetupCoordinator *)self _bundleIdentifierProvidesOwnSettings:v6])
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    v8 = [(ClarityUIAppSetupCoordinator *)self _dataSourceForBundleIdentifier:v6];
    v9 = v8;
    if (v8)
    {
      unsigned __int8 v7 = [v8 hasClaritySettingsIncludingSystem:v4];
    }
    else
    {
      v10 = CLFLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ClarityUIAppSetupCoordinator createSetupControllerForBundleIdentifier:]();
      }

      unsigned __int8 v7 = 0;
    }
  }
  return v7;
}

- (id)_displayNameForApplicationIdentifier:(id)a3
{
  return ClarityUIDisplayNameForApp(a3);
}

- (id)_iconForApplicationIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[UIScreen mainScreen];
  [v4 scale];
  v5 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v3, 2);

  return v5;
}

- (id)_detailTextForApplicationIdentifier:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:AX_MobilePhoneBundleName] & 1) != 0
    || [v4 isEqualToString:AX_FaceTimeBundleName]
    || [v4 isEqualToString:AX_MobileSMSBundleName])
  {
    v5 = AXLocStringKeyForModel();
    id v6 = settingsLocString(v5, @"ClarityUISettings");
    goto LABEL_4;
  }
  if (![v4 isEqualToString:AX_ClarityCameraBundleName])
  {
    if ([v4 isEqualToString:AX_ClarityPhotosBundleName])
    {
      v8 = @"CONFIGURE_SETTINGS_FOR_PHOTOS";
      goto LABEL_15;
    }
    if ([v4 isEqualToString:AX_MusicBundleName])
    {
      v8 = @"CONFIGURE_SETTINGS_FOR_MUSIC";
      goto LABEL_15;
    }
    v5 = [(ClarityUIAppSetupCoordinator *)self _displayNameForApplicationIdentifier:v4];
    v9 = settingsLocString(@"CONFIGURE_SETTINGS_FOR_APP", @"ClarityUISettings");
    id v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v5);

LABEL_4:
    goto LABEL_5;
  }
  v8 = @"CONFIGURE_SETTINGS_FOR_CAMERA";
LABEL_15:
  id v6 = settingsLocString(v8, @"ClarityUISettings");
LABEL_5:

  return v6;
}

- (BOOL)_bundleIdentifierProvidesOwnSettings:(id)a3
{
  uint64_t v3 = _bundleIdentifierProvidesOwnSettings__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_bundleIdentifierProvidesOwnSettings__onceToken, &__block_literal_global_300_0);
  }
  unsigned __int8 v5 = [(id)_bundleIdentifierProvidesOwnSettings__bundleIdentifiers containsObject:v4];

  return v5;
}

void __69__ClarityUIAppSetupCoordinator__bundleIdentifierProvidesOwnSettings___block_invoke(id a1)
{
  id v1 = objc_alloc((Class)NSSet);
  v5[0] = AX_MobilePhoneBundleName;
  v5[1] = AX_FaceTimeBundleName;
  v5[2] = AX_MusicBundleName;
  v5[3] = AX_MobileSMSBundleName;
  v5[4] = AX_ClarityCameraBundleName;
  v5[5] = AX_ClarityPhotosBundleName;
  uint64_t v2 = +[NSArray arrayWithObjects:v5 count:6];
  id v3 = [v1 initWithArray:v2];
  id v4 = (void *)_bundleIdentifierProvidesOwnSettings__bundleIdentifiers;
  _bundleIdentifierProvidesOwnSettings__bundleIdentifiers = (uint64_t)v3;
}

- (id)clarityBundleNameForBundleIdentifier:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 isEqualToString:AX_MobilePhoneBundleName];
  unsigned __int8 v5 = [v3 isEqualToString:AX_FaceTimeBundleName];
  id v6 = (id *)&CLFPhoneSettingsBundleName;
  if (v4 & 1) != 0 || (v5) {
    goto LABEL_11;
  }
  if ([v3 isEqualToString:AX_MusicBundleName])
  {
    id v6 = (id *)&CLFMusicSettingsBundleName;
LABEL_11:
    id v7 = *v6;
    goto LABEL_12;
  }
  if ([v3 isEqualToString:AX_MobileSMSBundleName])
  {
    id v6 = (id *)&CLFMessagesSettingsBundleName;
    goto LABEL_11;
  }
  if ([v3 isEqualToString:AX_ClarityCameraBundleName])
  {
    id v6 = (id *)&CLFCameraSettingsBundleName;
    goto LABEL_11;
  }
  if ([v3 isEqualToString:AX_ClarityPhotosBundleName])
  {
    id v6 = (id *)&CLFPhotosSettingsBundleName;
    goto LABEL_11;
  }
  id v7 = 0;
LABEL_12:

  return v7;
}

- (id)_dataSourceForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([(ClarityUIAppSetupCoordinator *)self _bundleIdentifierProvidesOwnSettings:v4])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    p_applicationIdentifiersToDataSourcesLock = &self->_applicationIdentifiersToDataSourcesLock;
    os_unfair_lock_lock(&self->_applicationIdentifiersToDataSourcesLock);
    id v7 = [(ClarityUIAppSetupCoordinator *)self applicationIdentifiersToDataSources];
    unsigned __int8 v5 = [v7 objectForKey:v4];

    os_unfair_lock_unlock(&self->_applicationIdentifiersToDataSourcesLock);
    if (!v5)
    {
      unsigned __int8 v5 = [[ClarityUISettingsDataSource alloc] initWithBundleIdentifier:v4];
      os_unfair_lock_lock(&self->_applicationIdentifiersToDataSourcesLock);
      v8 = [(ClarityUIAppSetupCoordinator *)self applicationIdentifiersToDataSources];
      [v8 setObject:v5 forKey:v4];

      os_unfair_lock_unlock(p_applicationIdentifiersToDataSourcesLock);
    }
  }

  return v5;
}

- (NSMutableDictionary)applicationIdentifiersToDataSources
{
  return self->_applicationIdentifiersToDataSources;
}

- (void)setApplicationIdentifiersToDataSources:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)createSetupControllerForBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_2(&dword_0, v0, v1, "Unable to load bundle for bundle ID: %@.", v2, v3, v4, v5, v6);
}

- (void)createSetupControllerForBundleIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_2(&dword_0, v0, v1, "No datasource exists for bundle identifier: %@", v2, v3, v4, v5, v6);
}

@end