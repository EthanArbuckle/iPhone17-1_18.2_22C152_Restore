@interface SettingsBaseController
+ (BOOL)shouldOfferHyperionInBuddy;
+ (id)filterAndConfigureSpecifiers:(id)a3 shownFromAccountSettings:(BOOL)a4 cloudPhotosEnabled:(BOOL)a5 cplKeepOriginals:(BOOL)a6 isCPLInExitMode:(BOOL)a7 cplDaysUntilExit:(int64_t)a8 shouldHideCPL:(BOOL)a9 shouldHideTransferBehaviors:(BOOL)a10 cloudPhotosPaused:(BOOL)a11 canEnableSharedStreams:(BOOL)a12 cplStatus:(id)a13 cplActionPerformer:(id)a14 showPhotosDiagnoseButton:(BOOL)a15 showPhotosRebuildButton:(BOOL)a16 accountModificationAllowed:(BOOL)a17 isOLEDDevice:(BOOL)a18 wantsPhotosAppSpecificSettings:(BOOL)a19 isLocationBeingOverridden:(BOOL)a20 currentAuthenticationType:(int64_t)a21 systemPolicyOptions:(unint64_t)a22 bundleIdentifier:(id)a23 transferBehaviorUserPreference:(int64_t)a24 sharedLibraryInvitationSpecifiers:(id)a25 sharedLibrarySettingsSpecifiers:(id)a26 instanceLogInfo:(id)a27;
+ (id)lastCPLSpecifierInSpecifiers:(id)a3 shownFromAccountSettings:(BOOL)a4;
+ (void)setPhotoStreamsEnabledFromAccountSettings:(id)a3;
+ (void)setPhotoStreamsEnabledFromBuddyWorkflow:(id)a3;
- (BOOL)_isAppleInternal;
- (BOOL)_isSettingsPaneInLocation:(int64_t)a3;
- (BOOL)_needsChangeForSpecifiers:(id)a3 shouldShow:(BOOL)a4;
- (BOOL)_photoStreamAssetsWillBeDeletedIfTurnedOff;
- (BOOL)_sharedStreamsAssetsWillBeDeletedIfTurnedOff;
- (BOOL)_shouldHideCPL;
- (BOOL)_shownFromAccountSettings;
- (BOOL)_useInternalDiagnostics;
- (BOOL)_wantsInstalledPhotosAppSpecificOptions;
- (BOOL)shouldDeferPushForSpecifierID:(id)a3;
- (NSString)bundleIdentifier;
- (PHPhotoLibrary)systemPhotoLibrary;
- (SettingsBaseController)init;
- (id)_fetchBlockedMemoryFeatures;
- (id)_fetchDeniedSuggestions;
- (id)_fetchMemoriesWithUserFeedback;
- (id)_iCloudPhotosItems:(id)a3;
- (id)_iCloudPhotosStatus:(id)a3;
- (id)_iCloudPhotosStorage:(id)a3;
- (id)_initializeSpecifiers;
- (id)_nonLocalResourceInfo;
- (id)_personID;
- (id)_previousSpecifierIDForSpecifierID:(id)a3;
- (id)_showSpinnerWithText:(id)a3;
- (id)_viewForSpinnerPresentation;
- (id)alchemizeButtonEnabled:(id)a3;
- (id)cloudPhotosEnabled:(id)a3;
- (id)contentPrivacyEnabled:(id)a3;
- (id)diagnoseServiceConnection;
- (id)featuredContentAllowed:(id)a3;
- (id)highMotionReminderEnabled:(id)a3;
- (id)sharedStreamsEnabled:(id)a3;
- (id)shouldShowPhotoLibraryInSearch:(id)a3;
- (id)specifiers;
- (id)tapToRadarURL;
- (id)videoAutoplayEnabled:(id)a3;
- (int64_t)_daysUntilExit;
- (int64_t)_settingsDebugOverrideLocation;
- (int64_t)transferBehaviorUserPreference;
- (unint64_t)systemPolicyOptions;
- (void)_beginCloudPhotosDisableFlow;
- (void)_cancelDisableCloudPhotos;
- (void)_confirmCloudPhotosDisableWhilePrunedWithNonLocalResourceInfo:(id)a3;
- (void)_confirmCloudPhotosDisableWithNonLocalResourceInfo:(id)a3;
- (void)_confirmCloudPhotosDisableWithSyncInProgress;
- (void)_confirmDeletePrunedResourcesWithNonLocalResourceInfo:(id)a3;
- (void)_confirmWithTitle:(id)a3 message:(id)a4 confirmationButtonTitle:(id)a5 cancelButtonTtle:(id)a6 completion:(id)a7;
- (void)_continueWithoutStoragePurchase:(id)a3;
- (void)_cplStorageCellWasTapped:(id)a3;
- (void)_disableCloudPhotos;
- (void)_emitNavigationEvent;
- (void)_enableCloudPhotosIgnoringStorageLimits:(BOOL)a3;
- (void)_enableCloudPhotosWithExitModeWarningIgnoringStorageLimits:(BOOL)a3;
- (void)_enableKeepOriginalsWithNonLocalResourceInfo:(id)a3;
- (void)_filterAndConfigureSpecifiers:(id *)a3 isAsync:(BOOL *)a4;
- (void)_formatKeepOriginalsAndOptimizeSpecifiers;
- (void)_getPhotosCloudSpaceInBytes;
- (void)_handleDeferredPushIdentifier;
- (void)_hideDisplayedSpinner;
- (void)_initializeCPLStatusProvider;
- (void)_openBackupManagement:(id)a3;
- (void)_openStorageManagement:(id)a3;
- (void)_performICloudPhotosAction:(id)a3;
- (void)_presentAlertExitModeBeforeCPLEnableWithCompletion:(id)a3;
- (void)_privacyButtonPressed:(id)a3;
- (void)_saveUserAccount;
- (void)_setDisplayedSpinner:(id)a3;
- (void)_setSharedStreamsEnabled:(BOOL)a3;
- (void)_setupCPLStatus;
- (void)_setupSharedLibrarySettings;
- (void)_showManageStorage;
- (void)_showSpinnerForDuration:(double)a3 withText:(id)a4;
- (void)_showStorageOptions;
- (void)_updateAccountCloudPhotoFooterTextAnimated:(BOOL)a3;
- (void)_updateCloudPhotoFooterTextAnimated:(BOOL)a3;
- (void)_updateDiagnoseSpecifier;
- (void)_updateKeepOriginals:(BOOL)a3;
- (void)_updateKeepOriginalsFooterTextAnimated:(BOOL)a3;
- (void)_updatePhotosCloudSpace:(id)a3 error:(id)a4;
- (void)_updateSharedLibrarySpecifiersAnimated:(BOOL)a3;
- (void)_updateSpecifiersForCPLEnablementChange;
- (void)_updateStatusActionLabelForSpecifier:(id)a3 reload:(BOOL)a4;
- (void)_updateStatusActionSpecifierVisibility;
- (void)alchemizeButtonEnabledWasToggled:(id)a3 specifier:(id)a4;
- (void)cloudPhotosEnableWasToggled:(id)a3 specifier:(id)a4;
- (void)contentPrivacyEnableWasToggled:(id)a3 specifier:(id)a4;
- (void)diagnosticServiceStateDidChange:(char)a3 outputURL:(id)a4 error:(id)a5;
- (void)featuredContentAllowedWasToggled:(id)a3 specifier:(id)a4;
- (void)generateCPLDiagnose:(id)a3;
- (void)highMotionReminderEnabledWasToggled:(id)a3 specifier:(id)a4;
- (void)keepOriginals:(id)a3;
- (void)manager:(id)a3 didCompleteWithError:(id)a4;
- (void)manager:(id)a3 loadDidFailWithError:(id)a4;
- (void)manager:(id)a3 willPresentViewController:(id)a4;
- (void)managerDidCancel:(id)a3;
- (void)navigationEventParameters:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)optimizeStorage:(id)a3;
- (void)photoLibraryDidBecomeUnavailable:(id)a3;
- (void)reloadSpecifiers;
- (void)resetBlacklistedMemoryFeatures;
- (void)resetPeopleFeedback;
- (void)runPhotosRebuild:(id)a3;
- (void)selectAutomaticTransferBehavior:(id)a3;
- (void)selectKeepOriginalsTransferBehavior:(id)a3;
- (void)setTransferBehaviorUserPreference:(int64_t)a3;
- (void)sharedStreamsSwitchWasToggled:(id)a3 specifier:(id)a4;
- (void)shouldShowPhotoLibraryInSearchWasToggled:(id)a3 specifier:(id)a4;
- (void)statusDidChange:(id)a3;
- (void)updateDiagnoseButtonName:(id)a3 enabled:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SettingsBaseController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2048;
    v11 = self;
    id v6 = v9;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p> View will appear", buf, 0x16u);
  }
  v7.receiver = self;
  v7.super_class = (Class)SettingsBaseController;
  [(SettingsBaseController *)&v7 viewWillAppear:v3];
  if (self->_viewHasAppearedBefore) {
    [(SettingsBaseController *)self reloadSpecifiers];
  }
  else {
    self->_viewHasAppearedBefore = 1;
  }
  if (self->_refreshQuotaStorageOnViewWillAppear && (*((unsigned char *)self + 243) & 2) != 0) {
    [(SettingsBaseController *)self _getPhotosCloudSpaceInBytes];
  }
}

- (void)_updateCloudPhotoFooterTextAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [(SettingsBaseController *)self specifierForID:@"iCloudPhotosTitleGroup"];
  if (v8)
  {
    [(SettingsBaseController *)self beginUpdates];
    BOOL isCPLInExitMode = self->_isCPLInExitMode;
    BOOL cloudPhotosEnabled = self->_cloudPhotosEnabled;
    objc_super v7 = [(SettingsBaseController *)self systemPhotoLibrary];
    sub_6794(v8, isCPLInExitMode, cloudPhotosEnabled, (int)[v7 isKeepOriginalsEnabled], -[SettingsBaseController _daysUntilExit](self, "_daysUntilExit"), (*((unsigned __int8 *)self + 243) >> 1) & 1, self);

    [(SettingsBaseController *)self reloadSpecifier:v8 animated:v3];
    [(SettingsBaseController *)self endUpdates];
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(SettingsBaseController *)self _initializeSpecifiers];
    id v6 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)_initializeSpecifiers
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_BB98;
  v23 = sub_BBA8;
  id v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    id v26 = v4;
    __int16 v27 = 2048;
    v28 = self;
    id v5 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "<%@: %p> Will check if iCPL has exited", buf, 0x16u);
  }
  PLDisableCPLIfExited();
  if (v20[5])
  {
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (id)objc_opt_class();
      id v8 = [(id)v20[5] count];
      *(_DWORD *)buf = 138412802;
      id v26 = v7;
      __int16 v27 = 2048;
      v28 = self;
      __int16 v29 = 2048;
      id v30 = v8;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> Initialized specifiers: %lu", buf, 0x20u);
    }
  }
  else
  {
    id v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      id v26 = v10;
      __int16 v27 = 2048;
      v28 = self;
      id v11 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "<%@: %p> Specifiers are being initialized async - returning the empty array for now", buf, 0x16u);
    }
    v12 = (void *)v20[5];
    v20[5] = (uint64_t)&__NSArray0__struct;

    *((unsigned char *)v16 + 24) = 1;
  }
  id v13 = (id)v20[5];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredPushIdentifier, 0);
  objc_storeStrong((id *)&self->_cplStorageDataController, 0);
  objc_storeStrong((id *)&self->_manageStorageController, 0);
  objc_storeStrong((id *)&self->_cloudStorageString, 0);
  objc_storeStrong((id *)&self->_cplUIStatusProvider, 0);
  objc_storeStrong((id *)&self->_sharedLibrarySettingsController, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_systemPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_cplStatus, 0);
  objc_storeStrong((id *)&self->_offersManager, 0);
  objc_storeStrong((id *)&self->_diagnoseServiceConnection, 0);
  objc_storeStrong((id *)&self->_displayedSpinner, 0);
  objc_storeStrong((id *)&self->_allPhotosSpecifiers, 0);
  objc_storeStrong((id *)&self->_iCloudActionSpecifiers, 0);
  objc_storeStrong((id *)&self->_iCloudStatusExitConditionalSpecifiers, 0);
  objc_storeStrong((id *)&self->_iCloudStatusConditionalSpecifiers, 0);

  objc_storeStrong((id *)&self->_iCloudPhotoLibraryConditionalSpecifiers, 0);
}

- (void)_emitNavigationEvent
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_41B0;
  v2[3] = &unk_28CF0;
  v2[4] = self;
  [(SettingsBaseController *)self navigationEventParameters:v2];
}

- (void)navigationEventParameters:(id)a3
{
  uint64_t v3 = (void (**)(id, void *, void *))a3;
  v4 = SettingsBaseControllerLocalizedStringResource(@"NAVIGATION_COMPONENT_APPS");
  id v7 = v4;
  id v5 = +[NSArray arrayWithObjects:&v7 count:1];

  id v6 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.mobileslideshow"];
  v3[2](v3, v5, v6);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v13 = a3;
  if (off_2F350 != a5)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SettingsBaseController.m" lineNumber:3023 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((*(void *)&v6 & 0x71C02BLL) != 0)
  {
    if (v6) {
      [(SettingsBaseController *)self reloadSpecifierID:@"cloudPhotosStatus" animated:1];
    }
    if ((*(void *)&v6 & 0x700000) != 0) {
      [(SettingsBaseController *)self reloadSpecifierID:@"iCloudPhotosItems" animated:1];
    }
    if ((*(void *)&v6 & 0x1C008) != 0) {
      [(SettingsBaseController *)self _updateSharedLibrarySpecifiersAnimated:1];
    }
    if ((v6 & 0x20) != 0)
    {
      [(SettingsBaseController *)self _updateStatusActionSpecifierVisibility];
      id v9 = [(SettingsBaseController *)self specifierForID:@"iCloudPhotosAction"];
      [(SettingsBaseController *)self _updateStatusActionLabelForSpecifier:v9 reload:1];
    }
    if ((v6 & 2) != 0)
    {
      __int16 v10 = [(SettingsBaseController *)self specifierForID:@"cloudPhotosStatusGroup"];
      id v11 = [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider status];
      sub_458C(v10, v11, self->_cloudPhotosEnabled, self);

      if ((v6 & 0x2000) != 0) {
        [(SettingsBaseController *)self reloadSpecifiers];
      }
    }
  }
}

- (void)_initializeCPLStatusProvider
{
  if (!self->_cplUIStatusProvider)
  {
    uint64_t v3 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Settings: Initializing CPL Status Provider.", v8, 2u);
    }

    v4 = [(SettingsBaseController *)self systemPhotoLibrary];
    id v5 = [objc_alloc((Class)PXPhotoKitCPLActionManager) initWithPhotoLibrary:v4];
    int v6 = (PXCPLUIStatusProvider *)[objc_alloc((Class)PXCPLUIStatusProvider) initWithPhotoLibrary:v4 actionManager:v5 presentationStyle:1];
    cplUIStatusProvider = self->_cplUIStatusProvider;
    self->_cplUIStatusProvider = v6;

    [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider registerChangeObserver:self context:off_2F350];
  }
}

- (void)_performICloudPhotosAction:(id)a3
{
  v4 = [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider status];
  id v5 = [v4 action];
  if (v5)
  {
    uint64_t v6 = [v4 actionConfirmationAlertTitle];
    if (v6
      && (id v7 = (void *)v6,
          [v4 actionConfirmationAlertButtonTitle],
          id v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v8))
    {
      id v9 = +[UIDevice currentDevice];
      __int16 v10 = (char *)[v9 userInterfaceIdiom];

      [v4 actionConfirmationAlertTitle];
      if (v10 == (unsigned char *)&dword_0 + 1) {
        id v11 = {;
      }
        v12 = v11;
        uint64_t v13 = 1;
      }
      else {
        id v11 = {;
      }
        v12 = v11;
        uint64_t v13 = 0;
      }
      uint64_t v17 = +[UIAlertController alertControllerWithTitle:v12 message:0 preferredStyle:v13];

      char v18 = [v4 actionConfirmationAlertButtonTitle];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_4EDC;
      v29[3] = &unk_28CC8;
      id v19 = v4;
      id v30 = v19;
      v31 = v5;
      v20 = +[UIAlertAction actionWithTitle:v18 style:0 handler:v29];
      [v17 addAction:v20];

      uint64_t v21 = +[NSBundle bundleForClass:objc_opt_class()];
      v22 = [v21 localizedStringForKey:@"ICLOUDPHOTOS_CANCEL" value:&stru_29018 table:@"Photos"];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_4FAC;
      v27[3] = &unk_28B20;
      id v23 = v19;
      id v28 = v23;
      id v24 = +[UIAlertAction actionWithTitle:v22 style:1 handler:v27];
      [v17 addAction:v24];

      v25 = PLUserStatusUIGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = [v23 actionTitle];
        *(_DWORD *)buf = 138543362;
        v33 = v26;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "Settings: Presenting alert with action with title: %{public}@", buf, 0xCu);
      }
      [(SettingsBaseController *)self presentViewController:v17 animated:1 completion:0];
    }
    else
    {
      v14 = PLUserStatusUIGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [v4 actionTitle];
        *(_DWORD *)buf = 138543362;
        v33 = v15;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Settings: Performing action with title: %{public}@, no confirmation alert", buf, 0xCu);
      }
      ((void (**)(void, void *))v5)[2](v5, v4);
    }
  }
  else
  {
    v16 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "Settings: User tapped on action button but there is no action", buf, 2u);
    }
  }
}

- (void)_updateStatusActionLabelForSpecifier:(id)a3 reload:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v7 = [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider status];
    id v8 = sub_5144(v7);
    [v6 setName:v8];

    if (v4) {
      [(SettingsBaseController *)self reloadSpecifier:v6 animated:1];
    }
  }
  else
  {
    id v9 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v10 = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Settings: Attempting to update nil specifier: iCPL status action button", v10, 2u);
    }
  }
}

- (void)_updateStatusActionSpecifierVisibility
{
  uint64_t v3 = [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider status];
  BOOL v4 = sub_534C(v3, self->_cloudPhotosEnabled, (*((unsigned __int8 *)self + 243) >> 1) & 1);

  if ([(SettingsBaseController *)self _needsChangeForSpecifiers:self->_iCloudActionSpecifiers shouldShow:v4])
  {
    if (v4)
    {
      id v6 = [(SettingsBaseController *)self specifierForID:@"cloudPhotosStatus"];
      [(SettingsBaseController *)self insertContiguousSpecifiers:self->_iCloudActionSpecifiers afterSpecifier:v6];
    }
    else
    {
      iCloudActionSpecifiers = self->_iCloudActionSpecifiers;
      [(SettingsBaseController *)self removeContiguousSpecifiers:iCloudActionSpecifiers animated:1];
    }
  }
}

- (void)_updatePhotosCloudSpace:(id)a3 error:(id)a4
{
  id v6 = (NSString *)a4;
  id v7 = v6;
  if (!a3 || v6)
  {
    v12 = PLUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412802;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2048;
      v16 = self;
      __int16 v17 = 2112;
      char v18 = v7;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "<%@: %p> Error requesting iCloud Storage info: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    [a3 longLongValue];
    NSLocalizedFileSizeDescription();
    id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412802;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2048;
      v16 = self;
      __int16 v17 = 2112;
      char v18 = v8;
      id v10 = v14;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "<%@: %p> Storage updated to: %@", (uint8_t *)&v13, 0x20u);
    }
    cloudStorageString = self->_cloudStorageString;
    self->_cloudStorageString = v8;

    [(SettingsBaseController *)self reloadSpecifierID:@"iCloudPhotosStorage" animated:1];
  }
}

- (void)_getPhotosCloudSpaceInBytes
{
  if (!self->_cplStorageDataController)
  {
    uint64_t v3 = +[PLAccountStore pl_sharedAccountStore];
    BOOL v4 = [v3 cachedPrimaryAppleAccount];

    id v5 = (ICQCloudStorageDataController *)[objc_alloc((Class)ICQCloudStorageDataController) initWithAccount:v4];
    cplStorageDataController = self->_cplStorageDataController;
    self->_cplStorageDataController = v5;
  }
  objc_initWeak(&location, self);
  [(ICQCloudStorageDataController *)self->_cplStorageDataController setShouldIgnoreCache:1];
  id v7 = self->_cplStorageDataController;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_56E4;
  v8[3] = &unk_28CA0;
  objc_copyWeak(&v9, &location);
  [(ICQCloudStorageDataController *)v7 fetchStorageByApp:@"com.apple.mobileslideshow" completion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_iCloudPhotosStorage:(id)a3
{
  return self->_cloudStorageString;
}

- (id)_iCloudPhotosStatus:(id)a3
{
  uint64_t v3 = [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider status];
  BOOL v4 = [v3 stateDescription];

  if (!v4)
  {
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v4 = [v5 localizedStringForKey:@"SETTINGS_ICLOUDPHOTOS_STATUS_PENDING" value:&stru_29018 table:@"Photos"];
  }

  return v4;
}

- (id)_iCloudPhotosItems:(id)a3
{
  BOOL v4 = [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider status];

  if (v4)
  {
    id v5 = [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider status];
    id v6 = (char *)[v5 numberOfPhotoAssets];
    id v7 = [v5 numberOfVideoAssets];
    uint64_t v8 = (uint64_t)[v5 numberOfOtherAssets];
    if (!self->_hasValidCPLCounts && &v6[(void)v7] == (char *)-v8)
    {
    }
    else
    {
      id v10 = PLLocalizedCountDescription();

      if (v10) {
        goto LABEL_10;
      }
    }
  }
  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v11 localizedStringForKey:@"SETTINGS_ICLOUDPHOTOS_STATUS_PENDING" value:&stru_29018 table:@"Photos"];

LABEL_10:

  return v10;
}

- (BOOL)_wantsInstalledPhotosAppSpecificOptions
{
  unint64_t v3 = [(SettingsBaseController *)self _settingsDebugOverrideLocation];
  if (v3 >= 2) {
    return v3 != 3;
  }

  return [(SettingsBaseController *)self _isSettingsPaneInLocation:1];
}

- (BOOL)_isSettingsPaneInLocation:(int64_t)a3
{
  BOOL v4 = [(SettingsBaseController *)self specifier];
  id v5 = [v4 objectForKeyedSubscript:@"PhotosSettingsLocation"];

  uint64_t v6 = 1;
  if (v5) {
    uint64_t v6 = 2;
  }
  return v6 == a3;
}

- (int64_t)_settingsDebugOverrideLocation
{
  if (![(SettingsBaseController *)self _isAppleInternal]) {
    return 1;
  }
  v2 = +[NSUserDefaults standardUserDefaults];
  unint64_t v3 = [v2 stringForKey:@"OverrideLocationAppOrGeneral"];

  if (v3)
  {
    BOOL v4 = [v3 lowercaseString];
    unsigned __int8 v5 = [v4 isEqualToString:@"app"];

    if (v5)
    {
      int64_t v6 = 2;
    }
    else
    {
      id v7 = [v3 lowercaseString];
      unsigned int v8 = [v7 isEqualToString:@"general"];

      if (v8) {
        int64_t v6 = 3;
      }
      else {
        int64_t v6 = 1;
      }
    }
  }
  else
  {
    int64_t v6 = 1;
  }

  return v6;
}

- (NSString)bundleIdentifier
{
  return 0;
}

- (unint64_t)systemPolicyOptions
{
  return 0;
}

- (void)statusDidChange:(id)a3
{
  id v10 = a3;
  BOOL v4 = [v10 exitDeleteTime];
  int v5 = v4 != 0;

  int isCPLInExitMode = self->_isCPLInExitMode;
  if (isCPLInExitMode != v5)
  {
    self->_int isCPLInExitMode = v5;
    [(MSSSharedLibraryBaseController *)self->_sharedLibrarySettingsController setCloudPhotosInExitMode:v4 != 0];
    [(SettingsBaseController *)self _getPhotosCloudSpaceInBytes];
  }
  id v7 = [v10 cloudAssetCountPerType];
  unsigned int v8 = [v7 allKeys];
  BOOL v9 = [v8 count] != 0;

  if (self->_hasValidCPLCounts != v9)
  {
    self->_hasValidCPLCounts = v9;
    goto LABEL_7;
  }
  if (isCPLInExitMode != v5) {
LABEL_7:
  }
    [(SettingsBaseController *)self reloadSpecifiers];
}

- (void)manager:(id)a3 didCompleteWithError:(id)a4
{
  id v5 = a4;
  int64_t v6 = PLUIGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543874;
    uint64_t v8 = objc_opt_class();
    __int16 v9 = 2048;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "<%{public}@:%p> ICQUICloudStorageOffersManager failed with error: %@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)managerDidCancel:(id)a3
{
  BOOL v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543618;
    uint64_t v6 = objc_opt_class();
    __int16 v7 = 2048;
    uint64_t v8 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> ICQUICloudStorageOffersManager was cancelled by the user", (uint8_t *)&v5, 0x16u);
  }
}

- (void)manager:(id)a3 loadDidFailWithError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = PLUIGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543874;
    uint64_t v8 = objc_opt_class();
    __int16 v9 = 2048;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "<%{public}@:%p> ICQUICloudStorageOffersManager load failed with error: %@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)manager:(id)a3 willPresentViewController:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 navigationItem];
  int v7 = [v6 leftBarButtonItem];

  uint64_t v8 = PULocalizedString();
  [v7 setTitle:v8];

  __int16 v9 = PULocalizedString();
  [v5 setTitle:v9];
  if (self->_requireStorageUpgradeForCPL)
  {
    objc_msgSend(v5, "px_removeFooterToolbar");
  }
  else
  {
    id v10 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    id v11 = objc_alloc((Class)UIBarButtonItem);
    id v12 = PULocalizedString();
    id v13 = [v11 initWithTitle:v12 style:0 target:self action:"_continueWithoutStoragePurchase:"];

    v15[0] = v10;
    v15[1] = v13;
    v15[2] = v10;
    id v14 = +[NSArray arrayWithObjects:v15 count:3];
    objc_msgSend(v5, "px_insertFooterToolbarWithItems:", v14);
  }
}

- (int64_t)_daysUntilExit
{
  v2 = [(CPLStatus *)self->_cplStatus exitDeleteTime];
  if (v2) {
    int64_t v3 = PXCPLNumberOfCalendarDaysUntilDate();
  }
  else {
    int64_t v3 = -1;
  }

  return v3;
}

- (void)_openBackupManagement:(id)a3
{
  int64_t v3 = PLUserStatusUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Will navigate to iCloud Storage Settings", v4, 2u);
  }

  +[PXSystemNavigation navigateToDestination:12 completion:&stru_28C50];
}

- (void)_openStorageManagement:(id)a3
{
  int64_t v3 = PLUserStatusUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Will navigate to iCloud Storage Settings", v4, 2u);
  }

  +[PXSystemNavigation navigateToDestination:5 completion:&stru_28C30];
}

- (void)_privacyButtonPressed:(id)a3
{
  id v4 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.photos"];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (void)_updateKeepOriginalsFooterTextAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SettingsBaseController *)self systemPhotoLibrary];
  sub_6524((int)[v5 isKeepOriginalsEnabled], self->_isCPLInExitMode);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [(SettingsBaseController *)self specifierForID:@"iCloudKeepOriginalsGroup"];
  int v7 = v6;
  if (v6)
  {
    [v6 setProperty:v8 forKey:PSFooterTextGroupKey];
    [(SettingsBaseController *)self reloadSpecifier:v7 animated:v3];
  }
}

- (void)_continueWithoutStoragePurchase:(id)a3
{
  [(ICQUICloudStorageOffersManager *)self->_offersManager cancelLoad];

  [(SettingsBaseController *)self _enableCloudPhotosWithExitModeWarningIgnoringStorageLimits:1];
}

- (void)_updateAccountCloudPhotoFooterTextAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [(SettingsBaseController *)self specifierForID:@"iCloudPhotosAccountTitleGroup"];
  if (v8)
  {
    [(SettingsBaseController *)self beginUpdates];
    BOOL isCPLInExitMode = self->_isCPLInExitMode;
    BOOL cloudPhotosEnabled = self->_cloudPhotosEnabled;
    int v7 = [(SettingsBaseController *)self systemPhotoLibrary];
    sub_6794(v8, isCPLInExitMode, cloudPhotosEnabled, (int)[v7 isKeepOriginalsEnabled], -[SettingsBaseController _daysUntilExit](self, "_daysUntilExit"), (*((unsigned __int8 *)self + 243) >> 1) & 1, self);

    [(SettingsBaseController *)self reloadSpecifier:v8 animated:v3];
    [(SettingsBaseController *)self endUpdates];
  }
}

- (void)_updateSharedLibrarySpecifiersAnimated:(BOOL)a3
{
  [(MSSSharedLibraryBaseController *)self->_sharedLibrarySettingsController setCloudPhotosEnabled:self->_cloudPhotosEnabled];
  [(MSSSharedLibraryBaseController *)self->_sharedLibrarySettingsController setCloudPhotosInExitMode:self->_isCPLInExitMode];
  id v4 = [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider status];
  [(MSSSharedLibraryBaseController *)self->_sharedLibrarySettingsController setCloudPhotosStatus:v4];

  [(SettingsBaseController *)self reloadSpecifiers];
}

- (void)_updateSpecifiersForCPLEnablementChange
{
  if ((*((unsigned char *)self + 243) & 2) != 0)
  {
    [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider unregisterChangeObserver:self context:off_2F350];
    cplUIStatusProvider = self->_cplUIStatusProvider;
    self->_cplUIStatusProvider = 0;

    [(SettingsBaseController *)self _initializeCPLStatusProvider];
  }

  [(SettingsBaseController *)self reloadSpecifiers];
}

- (void)_disableCloudPhotos
{
  BOOL v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = (id)objc_opt_class();
    __int16 v18 = 2048;
    id v19 = self;
    id v4 = v17;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "<%@: %p> Will disable iCPL", buf, 0x16u);
  }
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"ICLOUDPHOTOS_TURN_OFF_SPINNER_TEXT" value:&stru_29018 table:@"Photos"];

  int v7 = [(SettingsBaseController *)self _showSpinnerWithText:v6];
  [(SettingsBaseController *)self _setDisplayedSpinner:v7];
  id v8 = [(SettingsBaseController *)self view];
  __int16 v9 = [v8 window];
  [v9 setUserInteractionEnabled:0];

  dispatch_time_t v10 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6E7C;
  block[3] = &unk_28DA8;
  id v14 = v7;
  __int16 v15 = self;
  id v11 = v7;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_6EF4;
  v12[3] = &unk_28E20;
  v12[4] = self;
  +[PLCloudPhotoLibraryHelper disableCPL:v12];
}

- (void)_showStorageOptions
{
  BOOL v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    uint64_t v9 = objc_opt_class();
    __int16 v10 = 2048;
    id v11 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Will present ICQUICloudStorageOffersManager", (uint8_t *)&v8, 0x16u);
  }

  id v4 = (ICQUICloudStorageOffersManager *)objc_alloc_init((Class)ICQUICloudStorageOffersManager);
  offersManager = self->_offersManager;
  self->_offersManager = v4;

  [(ICQUICloudStorageOffersManager *)self->_offersManager setDelegate:self];
  uint64_t v6 = self->_offersManager;
  int v7 = [(SettingsBaseController *)self navigationController];
  [(ICQUICloudStorageOffersManager *)v6 beginFlowWithNavigationController:v7 modally:1];
}

- (void)_presentAlertExitModeBeforeCPLEnableWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Alert Exit Mode is ON", buf, 2u);
  }

  if ([(SettingsBaseController *)self _daysUntilExit] < 1)
  {
    int v7 = PULocalizedString();
  }
  else
  {
    uint64_t v6 = PULocalizedString();
    int v7 = PFStringWithValidatedFormat();
  }
  int v8 = PULocalizedString();
  uint64_t v9 = PULocalizedString();
  __int16 v10 = PULocalizedString();
  id v11 = PULocalizedString();
  id v12 = +[UIAlertController alertControllerWithTitle:v7 message:v8 preferredStyle:1];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_7588;
  v23[3] = &unk_28B70;
  id v13 = v4;
  id v24 = v13;
  id v14 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v23];
  [v12 addAction:v14];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_7608;
  v21[3] = &unk_28B70;
  id v15 = v13;
  id v22 = v15;
  v16 = +[UIAlertAction actionWithTitle:v9 style:1 handler:v21];
  [v12 addAction:v16];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_7688;
  v19[3] = &unk_28B70;
  id v20 = v15;
  id v17 = v15;
  __int16 v18 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v19];
  [v12 addAction:v18];

  [(SettingsBaseController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)_enableCloudPhotosIgnoringStorageLimits:(BOOL)a3
{
  id v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = (id)objc_opt_class();
    __int16 v16 = 2048;
    id v17 = self;
    id v5 = v15;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "<%@: %p> Handle request to enable iCPL", buf, 0x16u);
  }
  uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
  int v7 = [v6 localizedStringForKey:@"ICLOUDPHOTOS_TURN_ON_SPINNER_TEXT" value:&stru_29018 table:@"Photos"];

  int v8 = [(SettingsBaseController *)self _showSpinnerWithText:v7];
  [(SettingsBaseController *)self _setDisplayedSpinner:v8];
  uint64_t v9 = [(SettingsBaseController *)self view];
  __int16 v10 = [v9 window];
  [v10 setUserInteractionEnabled:0];

  id v11 = +[PLAccountStore pl_sharedAccountStore];
  id v12 = [v11 cachedPrimaryAppleAccount];

  id v13 = v8;
  PLCanEnableCloudPhotoLibraryForAccount();
}

- (void)_enableCloudPhotosWithExitModeWarningIgnoringStorageLimits:(BOOL)a3
{
  if (self->_isCPLInExitMode)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_8384;
    v3[3] = &unk_28B98;
    v3[4] = self;
    BOOL v4 = a3;
    [(SettingsBaseController *)self _presentAlertExitModeBeforeCPLEnableWithCompletion:v3];
  }
  else
  {
    [(SettingsBaseController *)self _enableCloudPhotosIgnoringStorageLimits:a3];
  }
}

- (id)_personID
{
  v2 = +[PLAccountStore pl_sharedAccountStore];
  BOOL v3 = [v2 cachedPrimaryAppleAccount];
  BOOL v4 = objc_msgSend(v3, "aa_personID");

  return v4;
}

- (BOOL)_needsChangeForSpecifiers:(id)a3 shouldShow:(BOOL)a4
{
  uint64_t v6 = [a3 firstObject];
  LOBYTE(self) = [(SettingsBaseController *)self indexOfSpecifier:v6] != (id)0x7FFFFFFFFFFFFFFFLL;

  return self ^ a4;
}

- (id)_previousSpecifierIDForSpecifierID:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (char *)[(NSArray *)self->_allPhotosSpecifiers indexOfSpecifierWithID:v5];
  int v7 = [(SettingsBaseController *)self specifiers];
  while (1)
  {
    int v8 = [(NSArray *)self->_allPhotosSpecifiers objectAtIndex:--v6];
    uint64_t v9 = [v8 identifier];
    __int16 v10 = [v7 specifierForID:v9];

    if (v10) {
      break;
    }
  }
  id v11 = [v10 identifier];

  if (!v11)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SettingsBaseController.m" lineNumber:2280 description:@"Specifier ID doesn't have a previous Photos Specifier"];
  }

  return v11;
}

- (void)_formatKeepOriginalsAndOptimizeSpecifiers
{
  [(SettingsBaseController *)self _updateKeepOriginalsFooterTextAnimated:1];
  iCloudPhotoLibraryConditionalSpecifiers = self->_iCloudPhotoLibraryConditionalSpecifiers;
  id v4 = [(SettingsBaseController *)self systemPhotoLibrary];
  sub_8610(iCloudPhotoLibraryConditionalSpecifiers, (int)[v4 isKeepOriginalsEnabled]);
}

- (void)_confirmWithTitle:(id)a3 message:(id)a4 confirmationButtonTitle:(id)a5 cancelButtonTtle:(id)a6 completion:(id)a7
{
  id v12 = a3;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_88D0;
  v27[3] = &unk_28B70;
  id v13 = a7;
  id v28 = v13;
  id v14 = a5;
  id v15 = a4;
  __int16 v16 = +[UIAlertAction actionWithTitle:a6 style:1 handler:v27];
  id v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  id v24 = sub_88E4;
  v25 = &unk_28B70;
  id v17 = v13;
  id v26 = v17;
  __int16 v18 = +[UIAlertAction actionWithTitle:v14 style:0 handler:&v22];

  id v19 = +[UIDevice currentDevice];
  unint64_t v20 = (unint64_t)[v19 userInterfaceIdiom];

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    uint64_t v21 = +[UIAlertController alertControllerWithTitle:v12 message:v15 preferredStyle:1];
  }
  else
  {
    uint64_t v21 = +[UIAlertController alertControllerWithTitle:v15 message:0 preferredStyle:0];

    [v21 setAccessibilityLabel:v12];
  }
  [v21 addAction:v16];
  [v21 addAction:v18];
  [(SettingsBaseController *)self presentViewController:v21 animated:1 completion:0];
}

- (id)_nonLocalResourceInfo
{
  v2 = +[PLPhotoLibrary systemPhotoLibrary];
  id v3 = +[PLInternalResource bytesNeededToDownloadOriginalResourcesInLibrary:v2];

  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 0;
  id v4 = +[PLPhotoLibrary systemPhotoLibrary];
  +[PLManagedAsset countOfAssetsWithRequiredResourcesNotLocallyAvailableInLibrary:v4 outCount:&v14 photoCount:&v13 videoCount:&v12];

  v15[0] = @"kCPLNonLocalOriginalsFileSizeKey";
  id v5 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)((double)(unint64_t)v3 * 1.1)];
  v16[0] = v5;
  v15[1] = @"kCPLNonLocalOriginalsCountKey";
  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:v14];
  v16[1] = v6;
  v15[2] = @"kCPLNonLocalOriginalsPhotoCountKey";
  int v7 = +[NSNumber numberWithUnsignedInteger:v13];
  v16[2] = v7;
  void v15[3] = @"kCPLNonLocalOriginalsVideoCountKey";
  int v8 = +[NSNumber numberWithUnsignedInteger:v12];
  v16[3] = v8;
  v15[4] = @"kCPLExistNonLocalOriginalsKey";
  uint64_t v9 = +[NSNumber numberWithInt:v14 != 0];
  v16[4] = v9;
  __int16 v10 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];

  return v10;
}

- (void)_showManageStorage
{
}

- (void)_cancelDisableCloudPhotos
{
  self->_BOOL cloudPhotosEnabled = 1;
  [(SettingsBaseController *)self reloadSpecifierID:@"iCloudPhotosSwitch" animated:1];

  [(SettingsBaseController *)self _updateSharedLibrarySpecifiersAnimated:1];
}

- (void)_confirmCloudPhotosDisableWithNonLocalResourceInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"ICLOUDPHOTOS_DISABLE_CANCEL" value:&stru_29018 table:@"Photos"];

  int v7 = +[UIDevice currentDevice];
  uint64_t v8 = [v7 model];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"kCPLNonLocalOriginalsCountKey"];
  id v10 = [v9 integerValue];

  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  if ((uint64_t)v10 < 2)
  {
    id v15 = [@"ICLOUDPHOTOS_DISABLE_DISK_PRESSURE_PRUNED_MESSAGE_SINGULAR_" stringByAppendingString:v8];
    uint64_t v14 = [v11 localizedStringForKey:v15 value:&stru_29018 table:@"Photos"];
  }
  else
  {
    uint64_t v12 = [@"ICLOUDPHOTOS_DISABLE_DISK_PRESSURE_PRUNED_MESSAGE_PLURAL_" stringByAppendingString:v8];
    uint64_t v13 = [v11 localizedStringForKey:v12 value:&stru_29018 table:@"Photos"];

    id v27 = v10;
    uint64_t v14 = PFStringWithValidatedFormat();
    id v11 = (void *)v13;
  }

  id v28 = (void *)v8;
  __int16 v16 = [@"ICLOUDPHOTOS_REMOVE_FROM_DEVICE_" stringByAppendingString:v8];
  id v17 = +[NSBundle bundleForClass:objc_opt_class()];
  __int16 v18 = [v17 localizedStringForKey:v16 value:&stru_29018 table:@"Photos"];

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_8F60;
  v32[3] = &unk_28B20;
  v32[4] = self;
  __int16 v29 = (void *)v6;
  id v19 = +[UIAlertAction actionWithTitle:v6 style:1 handler:v32];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_8F68;
  v30[3] = &unk_289C8;
  v30[4] = self;
  id v20 = v4;
  id v31 = v20;
  uint64_t v21 = +[UIAlertAction actionWithTitle:v18 style:2 handler:v30];
  id v22 = +[UIDevice currentDevice];
  unint64_t v23 = (unint64_t)[v22 userInterfaceIdiom];

  if ((v23 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v24 = +[NSBundle bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"ICLOUDPHOTOS_DISABLE_PROMPT_INSUFFICIENT_SPACE_TITLE" value:&stru_29018 table:@"Photos"];

    id v26 = +[UIAlertController alertControllerWithTitle:v25 message:v14 preferredStyle:1];
  }
  else
  {
    id v26 = +[UIAlertController alertControllerWithTitle:v14 message:0 preferredStyle:0];
  }
  objc_msgSend(v26, "addAction:", v19, v27);
  [v26 addAction:v21];
  [(SettingsBaseController *)self presentViewController:v26 animated:1 completion:0];
}

- (void)_confirmCloudPhotosDisableWithSyncInProgress
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"ICLOUDPHOTOS_DISABLE_SYNCING_TITLE" value:&stru_29018 table:@"Photos"];

  id v5 = +[UIDevice currentDevice];
  uint64_t v6 = [v5 model];
  int v7 = [@"ICLOUDPHOTOS_DISABLE_SYNCING_MESSAGE_" stringByAppendingString:v6];

  uint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:v7 value:&stru_29018 table:@"Photos"];

  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"ICLOUDPHOTOS_DISABLE_SYNCING_STOP" value:&stru_29018 table:@"Photos"];

  uint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"ICLOUDPHOTOS_DISABLE_SYNCING_CONTINUE" value:&stru_29018 table:@"Photos"];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_926C;
  v23[3] = &unk_28B20;
  void v23[4] = self;
  uint64_t v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:v23];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_9274;
  v22[3] = &unk_28B20;
  v22[4] = self;
  id v15 = +[UIAlertAction actionWithTitle:v11 style:2 handler:v22];
  __int16 v16 = +[UIDevice currentDevice];
  unint64_t v17 = (unint64_t)[v16 userInterfaceIdiom];

  if ((v17 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    __int16 v18 = v4;
    id v19 = v9;
    uint64_t v20 = 1;
  }
  else
  {
    __int16 v18 = v9;
    id v19 = 0;
    uint64_t v20 = 0;
  }
  uint64_t v21 = +[UIAlertController alertControllerWithTitle:v18 message:v19 preferredStyle:v20];
  [v21 addAction:v14];
  [v21 addAction:v15];
  [(SettingsBaseController *)self presentViewController:v21 animated:1 completion:0];
}

- (void)_enableKeepOriginalsWithNonLocalResourceInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PLCPLLocalStorageAvailableForResources();
  uint64_t v6 = [v4 objectForKeyedSubscript:@"kCPLNonLocalOriginalsFileSizeKey"];

  int v7 = (char *)[v6 longLongValue];
  uint64_t v8 = &v7[-v5];
  if ((uint64_t)v7 <= v5)
  {
    v32 = [(SettingsBaseController *)self specifierForID:@"iCloudKeepOriginalsOption"];
    [(SettingsBaseController *)self keepOriginals:v32];
  }
  else
  {
    v34 = (void *)MGCopyAnswer();
    uint64_t v9 = [v34 objectForKey:kMGQDiskUsageTotalDataCapacity];
    id v10 = (char *)[v9 longLongValue];

    id v11 = +[PLPhotoLibrary systemPhotoLibrary];
    v33 = [v11 estimatedLibrarySizes];

    uint64_t v12 = [v33 objectForKeyedSubscript:&off_2B708];
    id v13 = [v12 longLongValue];

    uint64_t v14 = &v7[(void)v13];
    id v15 = +[UIDevice currentDevice];
    __int16 v16 = [v15 model];
    if ((uint64_t)v14 <= (uint64_t)v10) {
      unint64_t v17 = @"ICLOUDPHOTOS_DISABLE_PROMPT_INSUFFICIENT_SPACE_MESSAGE_FORMAT_";
    }
    else {
      unint64_t v17 = @"ICLOUDPHOTOS_DISABLE_PROMPT_INSUFFICIENT_SPACE_MESSAGE_IMPOSSIBLE_FORMAT_";
    }
    __int16 v18 = [(__CFString *)v17 stringByAppendingString:v16];

    id v19 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v20 = [v19 localizedStringForKey:@"ICLOUDPHOTOS_DISABLE_PROMPT_INSUFFICIENT_SPACE_TITLE" value:&stru_29018 table:@"Photos"];

    uint64_t v21 = +[NSByteCountFormatter stringFromByteCount:v8 countStyle:0];
    id v22 = +[NSBundle bundleForClass:objc_opt_class()];
    unint64_t v23 = [v22 localizedStringForKey:v18 value:&stru_29018 table:@"Photos"];
    id v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v21);

    v25 = +[NSBundle bundleForClass:objc_opt_class()];
    id v26 = [v25 localizedStringForKey:@"ICLOUDPHOTOS_DISABLE_PROMPT_INSUFFICIENT_SPACE_MANAGE" value:&stru_29018 table:@"Photos"];

    id v27 = +[NSBundle bundleForClass:objc_opt_class()];
    id v28 = [v27 localizedStringForKey:@"ICLOUDPHOTOS_DISABLE_CANCEL" value:&stru_29018 table:@"Photos"];

    __int16 v29 = +[UIAlertController alertControllerWithTitle:v20 message:v24 preferredStyle:1];
    id v30 = +[UIAlertAction actionWithTitle:v28 style:1 handler:0];
    [v29 addAction:v30];

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_966C;
    v35[3] = &unk_28B20;
    v35[4] = self;
    id v31 = +[UIAlertAction actionWithTitle:v26 style:0 handler:v35];
    [v29 addAction:v31];

    [(SettingsBaseController *)self presentViewController:v29 animated:1 completion:0];
  }
  [(SettingsBaseController *)self _cancelDisableCloudPhotos];
}

- (void)_confirmDeletePrunedResourcesWithNonLocalResourceInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v50 = [v5 localizedStringForKey:@"ICLOUDPHOTOS_DISABLE_CANCEL" value:&stru_29018 table:@"Photos"];

  uint64_t v6 = [v4 objectForKeyedSubscript:@"kCPLNonLocalOriginalsCountKey"];
  id v7 = [v6 unsignedIntegerValue];

  uint64_t v8 = [v4 objectForKeyedSubscript:@"kCPLNonLocalOriginalsPhotoCountKey"];
  unsigned int v9 = [v8 BOOLValue];

  id v10 = [v4 objectForKeyedSubscript:@"kCPLNonLocalOriginalsVideoCountKey"];

  unsigned int v11 = [v10 BOOLValue];
  uint64_t v12 = +[UIDevice currentDevice];
  unint64_t v13 = (unint64_t)[v12 userInterfaceIdiom];

  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    CFStringRef v14 = @"ICLOUDPHOTOS_DISABLE_PROMPT_DELETE_LOW_RES_MESSAGE_FORMAT_PHOTOS";
    if (v11) {
      CFStringRef v14 = @"ICLOUDPHOTOS_DISABLE_PROMPT_DELETE_LOW_RES_MESSAGE_FORMAT_PHOTOS_VIDEOS";
    }
    CFStringRef v15 = @"ICLOUDPHOTOS_DISABLE_PROMPT_DELETE_LOW_RES_TITLE_FORMAT_PHOTOS_";
    if (v11) {
      CFStringRef v15 = @"ICLOUDPHOTOS_DISABLE_PROMPT_DELETE_LOW_RES_TITLE_FORMAT_PHOTOS_VIDEOS_";
    }
    if (v9) {
      CFStringRef v16 = v14;
    }
    else {
      CFStringRef v16 = @"ICLOUDPHOTOS_DISABLE_PROMPT_DELETE_LOW_RES_MESSAGE_FORMAT_VIDEOS";
    }
    if (v9) {
      unint64_t v17 = (__CFString *)v15;
    }
    else {
      unint64_t v17 = @"ICLOUDPHOTOS_DISABLE_PROMPT_DELETE_LOW_RES_TITLE_FORMAT_VIDEOS_";
    }
    __int16 v18 = +[UIDevice currentDevice];
    id v19 = [v18 model];
    uint64_t v20 = [(__CFString *)v17 stringByAppendingString:v19];

    uint64_t v21 = +[NSBundle bundleForClass:objc_opt_class()];
    v49 = (void *)v20;
    uint64_t v22 = [v21 localizedStringForKey:v20 value:&stru_29018 table:@"Photos"];

    v48 = (void *)v22;
    unint64_t v23 = PFStringWithValidatedFormat();
    id v24 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(), v7);
    v25 = [v24 localizedStringForKey:v16 value:&stru_29018 table:@"Photos"];

    id v47 = v7;
    id v26 = PFStringWithValidatedFormat();
    id v27 = +[UIDevice currentDevice];
    id v28 = [v27 model];
    __int16 v29 = [@"ICLOUDPHOTOS_REMOVE_FROM_DEVICE_" stringByAppendingString:v28];

    id v30 = +[NSBundle bundleForClass:objc_opt_class()];
    id v31 = [v30 localizedStringForKey:v29 value:&stru_29018 table:@"Photos"];

    v32 = +[UIAlertController alertControllerWithTitle:v23 message:v26 preferredStyle:1];
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_9D0C;
    v54[3] = &unk_28B20;
    v54[4] = self;
    v33 = +[UIAlertAction actionWithTitle:v50 style:1 handler:v54];
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_9D14;
    v53[3] = &unk_28B20;
    v53[4] = self;
    v34 = +[UIAlertAction actionWithTitle:v31 style:2 handler:v53];
    [v32 addAction:v33];
    [v32 addAction:v34];
  }
  else
  {
    CFStringRef v35 = @"ICLOUDPHOTOS_DISABLE_PROMPT_DELETE_LOW_RES_TITLE_FORMAT_PHOTOS_";
    if (v11) {
      CFStringRef v35 = @"ICLOUDPHOTOS_DISABLE_PROMPT_DELETE_LOW_RES_TITLE_FORMAT_PHOTOS_VIDEOS_";
    }
    if (v9) {
      v36 = (__CFString *)v35;
    }
    else {
      v36 = @"ICLOUDPHOTOS_DISABLE_PROMPT_DELETE_LOW_RES_TITLE_FORMAT_VIDEOS_";
    }
    v37 = +[UIDevice currentDevice];
    v38 = [v37 model];
    uint64_t v39 = [(__CFString *)v36 stringByAppendingString:v38];

    v40 = +[NSBundle bundleForClass:objc_opt_class()];
    v49 = (void *)v39;
    uint64_t v41 = [v40 localizedStringForKey:v39 value:&stru_29018 table:@"Photos"];

    v48 = (void *)v41;
    unint64_t v23 = PFStringWithValidatedFormat();
    v42 = +[UIDevice currentDevice];
    v43 = [v42 model];
    v25 = [@"ICLOUDPHOTOS_REMOVE_FROM_DEVICE_" stringByAppendingString:v43];

    v44 = +[NSBundle bundleForClass:objc_opt_class()];
    id v26 = [v44 localizedStringForKey:v25 value:&stru_29018 table:@"Photos"];

    v32 = +[UIAlertController alertControllerWithTitle:v23 message:0 preferredStyle:0];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_9D1C;
    v52[3] = &unk_28B20;
    v52[4] = self;
    v45 = +[UIAlertAction actionWithTitle:v50 style:1 handler:v52];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_9D24;
    v51[3] = &unk_28B20;
    v51[4] = self;
    v46 = +[UIAlertAction actionWithTitle:v26 style:2 handler:v51];
    [v32 addAction:v45];
    [v32 addAction:v46];
  }
  [(SettingsBaseController *)self presentViewController:v32 animated:1 completion:0];
}

- (void)_confirmCloudPhotosDisableWhilePrunedWithNonLocalResourceInfo:(id)a3
{
  id v27 = a3;
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"ICLOUDPHOTOS_DISABLE_CANCEL" value:&stru_29018 table:@"Photos"];

  uint64_t v6 = +[UIDevice currentDevice];
  id v7 = [v6 model];
  uint64_t v8 = [@"ICLOUDPHOTOS_DISABLE_PROMPT_DOWNLOAD_ORIGINALS_" stringByAppendingString:v7];

  unsigned int v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v28 = (void *)v8;
  id v30 = [v9 localizedStringForKey:v8 value:&stru_29018 table:@"Photos"];

  id v10 = +[UIDevice currentDevice];
  unsigned int v11 = [v10 model];
  uint64_t v12 = [@"ICLOUDPHOTOS_REMOVE_FROM_DEVICE_" stringByAppendingString:v11];

  unint64_t v13 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v14 = [v13 localizedStringForKey:v12 value:&stru_29018 table:@"Photos"];

  CFStringRef v15 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v16 = [v15 localizedStringForKey:@"ICLOUDPHOTOS_DISABLE_PROMPT_DOWNLOAD_ORIGINALS_OK" value:&stru_29018 table:@"Photos"];

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_A194;
  v35[3] = &unk_28B20;
  v35[4] = self;
  __int16 v29 = (void *)v5;
  unint64_t v17 = +[UIAlertAction actionWithTitle:v5 style:1 handler:v35];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_A19C;
  v33[3] = &unk_289C8;
  v33[4] = self;
  id v18 = v27;
  id v34 = v18;
  id v19 = +[UIAlertAction actionWithTitle:v14 style:2 handler:v33];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_A1A8;
  v31[3] = &unk_289C8;
  v31[4] = self;
  id v20 = v18;
  id v32 = v20;
  uint64_t v21 = +[UIAlertAction actionWithTitle:v16 style:0 handler:v31];
  uint64_t v22 = +[UIDevice currentDevice];
  unint64_t v23 = (unint64_t)[v22 userInterfaceIdiom];

  if ((v23 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v24 = +[NSBundle bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"ICLOUDPHOTOS_DISABLE_PROMPT_DOWNLOAD_ORIGINALS_TITLE" value:&stru_29018 table:@"Photos"];

    id v26 = +[UIAlertController alertControllerWithTitle:v25 message:v30 preferredStyle:1];
  }
  else
  {
    id v26 = +[UIAlertController alertControllerWithTitle:v30 message:0 preferredStyle:0];
  }
  objc_msgSend(v26, "addAction:", v17, v27);
  [v26 addAction:v19];
  [v26 addAction:v21];
  [(SettingsBaseController *)self presentViewController:v26 animated:1 completion:0];
}

- (void)_beginCloudPhotosDisableFlow
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"ICLOUDPHOTOS_TURN_OFF_SPINNER_TEXT" value:&stru_29018 table:@"Photos"];

  uint64_t v5 = [(SettingsBaseController *)self _showSpinnerWithText:v4];
  [(SettingsBaseController *)self _setDisplayedSpinner:v5];
  uint64_t v6 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A2BC;
  block[3] = &unk_28FE0;
  void block[4] = self;
  dispatch_async(v6, block);
}

- (void)resetPeopleFeedback
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"RESET_PEOPLE_FEEDBACK_CANCEL_ACTION_TITLE" value:&stru_29018 table:@"Photos"];

  uint64_t v5 = +[UIAlertAction actionWithTitle:v4 style:1 handler:0];
  uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"RESET_PEOPLE_FEEDBACK_RESET_ACTION_TITLE" value:&stru_29018 table:@"Photos"];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_A708;
  v16[3] = &unk_28B20;
  v16[4] = self;
  uint64_t v8 = +[UIAlertAction actionWithTitle:v7 style:2 handler:v16];
  unsigned int v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"RESET_PEOPLE_FEEDBACK_RESET_ACTION_DETAILS" value:&stru_29018 table:@"Photos"];

  unsigned int v11 = +[UIDevice currentDevice];
  unint64_t v12 = (unint64_t)[v11 userInterfaceIdiom];

  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    unint64_t v13 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v14 = [v13 localizedStringForKey:@"RESET_PEOPLE_FEEDBACK_RESET_ACTION_ALERT_TITLE" value:&stru_29018 table:@"Photos"];

    CFStringRef v15 = +[UIAlertController alertControllerWithTitle:v14 message:v10 preferredStyle:1];
  }
  else
  {
    CFStringRef v15 = +[UIAlertController alertControllerWithTitle:v10 message:0 preferredStyle:0];
  }
  [v15 addAction:v5];
  [v15 addAction:v8];
  [(SettingsBaseController *)self presentViewController:v15 animated:1 completion:0];
}

- (void)resetBlacklistedMemoryFeatures
{
  objc_initWeak(&location, self);
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"MEMORIES_BLACKLISTED_MEMORIES_CANCEL_ACTION_TITLE" value:&stru_29018 table:@"Photos"];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_ABA8;
  v19[3] = &unk_28AB0;
  objc_copyWeak(&v20, &location);
  uint64_t v5 = +[UIAlertAction actionWithTitle:v4 style:1 handler:v19];
  uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"MEMORIES_BLACKLISTED_MEMORIES_RESET_ACTION_TITLE" value:&stru_29018 table:@"Photos"];
  CFStringRef v16 = (void *)v4;

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_AC38;
  v17[3] = &unk_28AD8;
  objc_copyWeak(&v18, &location);
  v17[4] = self;
  uint64_t v8 = +[UIAlertAction actionWithTitle:v7 style:2 handler:v17];
  unsigned int v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"MEMORIES_BLACKLISTED_MEMORIES_RESET_ACTION_DETAILS" value:&stru_29018 table:@"Photos"];

  unsigned int v11 = +[UIDevice currentDevice];
  unint64_t v12 = (unint64_t)[v11 userInterfaceIdiom];

  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    unint64_t v13 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v14 = [v13 localizedStringForKey:@"MEMORIES_BLACKLISTED_MEMORIES_RESET_ALERT_TITLE" value:&stru_29018 table:@"Photos"];

    CFStringRef v15 = +[UIAlertController alertControllerWithTitle:v14 message:v10 preferredStyle:1];
  }
  else
  {
    CFStringRef v15 = +[UIAlertController alertControllerWithTitle:v10 message:0 preferredStyle:0];
  }
  [v15 addAction:v5];
  [v15 addAction:v8];
  [(SettingsBaseController *)self presentViewController:v15 animated:1 completion:0];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
}

- (id)_fetchDeniedSuggestions
{
  v2 = [(SettingsBaseController *)self systemPhotoLibrary];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 librarySpecificFetchOptions];
    uint64_t v5 = +[PHSuggestion fetchSuggestionsWithState:4 withOptions:v4];
  }
  else
  {
    uint64_t v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "SettingsBaseController: systemPhotoLibrary is nil", v8, 2u);
    }

    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_fetchMemoriesWithUserFeedback
{
  v2 = [(SettingsBaseController *)self systemPhotoLibrary];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 librarySpecificFetchOptions];
    uint64_t v5 = +[PHMemory fetchMemoriesWithUserFeedbackWithOptions:v4];
  }
  else
  {
    uint64_t v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "SettingsBaseController: systemPhotoLibrary is nil", v8, 2u);
    }

    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_fetchBlockedMemoryFeatures
{
  v2 = [(SettingsBaseController *)self systemPhotoLibrary];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 librarySpecificFetchOptions];
    uint64_t v5 = +[PHMemory fetchBlockedMemoriesWithOptions:v4];
  }
  else
  {
    uint64_t v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "SettingsBaseController: systemPhotoLibrary is nil", v8, 2u);
    }

    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_cplStorageCellWasTapped:(id)a3
{
  id v4 = a3;
  manageStorageController = self->_manageStorageController;
  id v12 = v4;
  if (!manageStorageController)
  {
    uint64_t v6 = +[PLAccountStore pl_sharedAccountStore];
    id v7 = [v6 cachedPrimaryAppleAccount];

    id v8 = objc_alloc((Class)ICSManageStorageDrilldownController);
    unsigned int v9 = [(SettingsBaseController *)self navigationController];
    id v10 = (ICSManageStorageDrilldownController *)[v8 initWithAppBundleID:@"com.apple.mobileslideshow" account:v7 navigationController:v9];
    unsigned int v11 = self->_manageStorageController;
    self->_manageStorageController = v10;

    id v4 = v12;
    manageStorageController = self->_manageStorageController;
  }
  [(ICSManageStorageDrilldownController *)manageStorageController beginLoadingForSpecifier:v4];
  self->_refreshQuotaStorageOnViewWillAppear = 1;
}

- (void)_filterAndConfigureSpecifiers:(id *)a3 isAsync:(BOOL *)a4
{
  uint64_t v5 = +[PLAccountStore pl_sharedAccountStore];
  v59 = [v5 cachedPrimaryAppleAccount];

  *((unsigned char *)self + 243) = *((unsigned char *)self + 243) & 0xFE | [v59 isEnabledForDataclass:kAccountDataclassSharedStreams];
  self->_BOOL cloudPhotosEnabled = [v59 isEnabledForDataclass:kAccountDataclassCloudPhotos];
  v61 = [(SettingsBaseController *)self loadSpecifiersFromPlistName:@"Photos" target:self];
  uint64_t v6 = (NSArray *)[v61 copy];
  allPhotosSpecifiers = self->_allPhotosSpecifiers;
  self->_allPhotosSpecifiers = v6;

  if ((*((unsigned char *)self + 243) & 2) != 0)
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"PHOTOS" value:&stru_29018 table:@"Photos"];
  }
  else
  {
    if (![(SettingsBaseController *)self _isSettingsPaneInLocation:2]) {
      goto LABEL_6;
    }
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"PHOTOS_LIBRARY_SETTINGS_TITLE" value:&stru_29018 table:@"Photos"];
  }
  id v10 = (void *)v9;
  [(SettingsBaseController *)self setTitle:v9];

LABEL_6:
  v60 = [v61 specifierForID:@"iCloudPhotosItems"];
  v58 = [v61 specifierForID:@"cloudPhotosStatus"];
  v72[0] = v60;
  v72[1] = v58;
  unsigned int v11 = +[NSArray arrayWithObjects:v72 count:2];
  iCloudStatusConditionalSpecifiers = self->_iCloudStatusConditionalSpecifiers;
  self->_iCloudStatusConditionalSpecifiers = v11;

  v71 = v60;
  unint64_t v13 = +[NSArray arrayWithObjects:&v71 count:1];
  iCloudStatusExitConditionalSpecifiers = self->_iCloudStatusExitConditionalSpecifiers;
  self->_iCloudStatusExitConditionalSpecifiers = v13;

  v57 = [v61 specifierForID:@"iCloudPhotosAction"];
  v70 = v57;
  CFStringRef v15 = +[NSArray arrayWithObjects:&v70 count:1];
  iCloudActionSpecifiers = self->_iCloudActionSpecifiers;
  self->_iCloudActionSpecifiers = v15;

  v69[0] = @"iCloudKeepOriginalsGroup";
  v69[1] = @"iCloudKeepOriginalsOption";
  v69[2] = @"iCloudOptimizeStorageOption";
  unint64_t v17 = +[NSArray arrayWithObjects:v69 count:3];
  objc_msgSend(v61, "mss_specifiersWithIdentifiers:", v17);
  id v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  iCloudPhotoLibraryConditionalSpecifiers = self->_iCloudPhotoLibraryConditionalSpecifiers;
  self->_iCloudPhotoLibraryConditionalSpecifiers = v18;

  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  BOOL v20 = [(SettingsBaseController *)self _useInternalDiagnostics]
     || CFPreferencesGetAppBooleanValue(@"showCloudDiagnoseButton", @"com.apple.mobileslideshow", 0) != 0;
  BOOL v53 = v20;
  BOOL v21 = [(SettingsBaseController *)self _useInternalDiagnostics]
     || CFPreferencesGetAppBooleanValue(@"showPhotosRebuildButton", @"com.apple.mobileslideshow", 0) != 0;
  BOOL v52 = v21;
  uint64_t v22 = [(SettingsBaseController *)self systemPhotoLibrary];
  unsigned int v51 = [v22 isKeepOriginalsEnabled];

  BOOL cloudPhotosEnabled = self->_cloudPhotosEnabled;
  BOOL isCPLInExitMode = self->_isCPLInExitMode;
  unsigned __int8 v50 = [(SettingsBaseController *)self _shouldHideCPL];
  BOOL shouldHideTransferBehaviors = self->_shouldHideTransferBehaviors;
  char v47 = PLCanEnableSharedStreamsForAccount();
  unsigned int v43 = *((unsigned __int8 *)self + 243);
  BOOL accountModificationAllowed = self->_accountModificationAllowed;
  char v45 = PXSupportsImageModulation();
  unsigned __int8 v42 = [(SettingsBaseController *)self _wantsInstalledPhotosAppSpecificOptions];
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"cloudPhotosPaused", @"com.apple.mobileslideshow", 0);
  int64_t v23 = [(SettingsBaseController *)self _settingsDebugOverrideLocation];
  int64_t v40 = [(SettingsBaseController *)self _daysUntilExit];
  int64_t v39 = [(SettingsBaseController *)self transferBehaviorUserPreference];
  [(PXContentPrivacyController *)self->_privacyController updateAuthenticationTypeImmediately];
  id v24 = [(PXContentPrivacyController *)self->_privacyController authenticationType];
  unint64_t v25 = [(SettingsBaseController *)self systemPolicyOptions];
  v56 = [(SettingsBaseController *)self bundleIdentifier];
  id v26 = [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider status];
  id v27 = +[NSString stringWithFormat:@"%@: %p", objc_opt_class(), self];
  objc_initWeak(&location, self);
  [(MSSSharedLibraryBaseController *)self->_sharedLibrarySettingsController setCloudPhotosEnabled:self->_cloudPhotosEnabled];
  [(MSSSharedLibraryBaseController *)self->_sharedLibrarySettingsController setCloudPhotosInExitMode:self->_isCPLInExitMode];
  [(MSSSharedLibraryBaseController *)self->_sharedLibrarySettingsController setCloudPhotosStatus:v26];
  id v28 = objc_opt_class();
  id v29 = objc_loadWeakRetained(&location);
  id v30 = [(MSSSharedLibraryBaseController *)self->_sharedLibrarySettingsController invitationSpecifiers];
  id v31 = [(MSSSharedLibraryBaseController *)self->_sharedLibrarySettingsController settingsSpecifiers];
  BYTE5(v38) = (v23 & 0xFFFFFFFFFFFFFFFELL) == 2;
  BYTE4(v38) = v42;
  BYTE3(v38) = v45;
  BYTE2(v38) = accountModificationAllowed;
  BYTE1(v38) = v52;
  LOBYTE(v38) = v53;
  BYTE3(v37) = v47;
  BYTE2(v37) = AppBooleanValue != 0;
  BYTE1(v37) = shouldHideTransferBehaviors;
  LOBYTE(v37) = v50;
  objc_msgSend(v28, "filterAndConfigureSpecifiers:shownFromAccountSettings:cloudPhotosEnabled:cplKeepOriginals:isCPLInExitMode:cplDaysUntilExit:shouldHideCPL:shouldHideTransferBehaviors:cloudPhotosPaused:canEnableSharedStreams:cplStatus:cplActionPerformer:showPhotosDiagnoseButton:showPhotosRebuildButton:accountModificationAllowed:isOLEDDevice:wantsPhotosAppSpecificSettings:isLocationBeingOverridden:currentAuthenticationType:systemPolicyOptions:bundleIdentifier:transferBehaviorUserPreference:sharedLibraryInvitationSpecifiers:sharedLibrarySettingsSpecifiers:instanceLogInfo:", v61, (v43 >> 1) & 1, cloudPhotosEnabled, v51, isCPLInExitMode, v40, v37, v26, v29, v38, v24, v25, v56,
    v39,
    v30,
    v31,
  id v32 = v27);

  id v33 = v32;
  *a3 = v33;
  if (*a4)
  {
    id v34 = PLUIGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      id v35 = (id)objc_opt_class();
      id v36 = [v33 count];
      *(_DWORD *)buf = 138412802;
      id v64 = v35;
      __int16 v65 = 2048;
      v66 = self;
      __int16 v67 = 2048;
      id v68 = v36;
      _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "<%@: %p> Initialized specifiers async: %lu", buf, 0x20u);
    }
    [(SettingsBaseController *)self setSpecifiers:v33];
  }

  objc_destroyWeak(&location);
}

- (BOOL)_sharedStreamsAssetsWillBeDeletedIfTurnedOff
{
  v2 = +[PLPhotoLibrary systemPhotoLibrary];
  +[PLCloudSharedAlbum allCloudSharedAlbumsInLibrary:v2];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "assetsCount", (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (BOOL)_photoStreamAssetsWillBeDeletedIfTurnedOff
{
  v2 = +[PLPhotoLibrary systemPhotoLibrary];
  [v2 photoStreamAlbums];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isCloudSharedAlbum", (void)v9) & 1) == 0
          && [v7 assetsCount])
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v4;
}

- (void)_showSpinnerForDuration:(double)a3 withText:(id)a4
{
  id v6 = a4;
  id v7 = [(SettingsBaseController *)self view];
  long long v8 = [v7 window];
  [v8 setUserInteractionEnabled:0];

  id v9 = objc_alloc_init((Class)UIProgressHUD);
  [v9 setAutoresizingMask:45];
  [v9 setFontSize:16];
  [v9 setText:v6];

  long long v10 = [(SettingsBaseController *)self _viewForSpinnerPresentation];
  [v9 showInView:v10];
  long long v11 = [(SettingsBaseController *)self view];
  long long v12 = [v11 window];

  [v12 setUserInteractionEnabled:0];
  [(SettingsBaseController *)self _setDisplayedSpinner:v9];
  dispatch_time_t v13 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C0DC;
  block[3] = &unk_28FB8;
  id v17 = v9;
  id v18 = self;
  id v19 = v12;
  id v14 = v12;
  id v15 = v9;
  dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_showSpinnerWithText:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)UIProgressHUD);
  [v5 setAutoresizingMask:45];
  [v5 setFontSize:16];
  [v5 setText:v4];

  id v6 = [(SettingsBaseController *)self _viewForSpinnerPresentation];
  [v5 showInView:v6];

  return v5;
}

- (id)_viewForSpinnerPresentation
{
  id v3 = +[UIDevice currentDevice];
  unint64_t v4 = (unint64_t)[v3 userInterfaceIdiom];

  id v5 = [(SettingsBaseController *)self rootController];
  id v6 = v5;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v7 = [v5 parentViewController];
    long long v8 = [v7 view];
  }
  else
  {
    long long v8 = [v5 view];
  }

  if (!v8)
  {
    id v9 = [(SettingsBaseController *)self parentViewController];
    long long v8 = [v9 view];

    if (!v8)
    {
      long long v10 = PXAssertGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long v12 = 0;
        _os_log_fault_impl(&dword_0, v10, OS_LOG_TYPE_FAULT, "SettingsBaseController: missing view to present legacy UIProgressHUD", v12, 2u);
      }

      long long v8 = 0;
    }
  }

  return v8;
}

- (void)_hideDisplayedSpinner
{
  displayedSpinner = self->_displayedSpinner;
  if (displayedSpinner)
  {
    [(UIProgressHUD *)displayedSpinner hide];
    [(SettingsBaseController *)self _setDisplayedSpinner:0];
    id v5 = [(SettingsBaseController *)self view];
    unint64_t v4 = [v5 window];
    [v4 setUserInteractionEnabled:1];
  }
}

- (void)_setDisplayedSpinner:(id)a3
{
  if (self->_displayedSpinner != a3) {
    objc_storeStrong((id *)&self->_displayedSpinner, a3);
  }

  _objc_release_x1();
}

- (void)_saveUserAccount
{
  id v3 = +[PLAccountStore pl_sharedAccountStore];
  unint64_t v4 = +[PLAccountStore pl_sharedAccountStore];
  id v5 = [v4 cachedPrimaryAppleAccount];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_C4BC;
  v6[3] = &unk_28E20;
  v6[4] = self;
  [v3 saveAccount:v5 withDataclassActions:0 doVerify:0 completion:v6];
}

- (void)_setSharedStreamsEnabled:(BOOL)a3
{
  id v11 = +[PLAccountStore pl_sharedAccountStore];
  id v5 = [v11 cachedPrimaryAppleAccount];
  id v6 = [v5 provisionedDataclasses];
  uint64_t v7 = kAccountDataclassSharedStreams;
  unsigned __int8 v8 = [v6 containsObject:kAccountDataclassSharedStreams];

  *((unsigned char *)self + 243) = *((unsigned char *)self + 243) & 0xFE | a3 & v8;
  id v9 = +[PLAccountStore pl_sharedAccountStore];
  long long v10 = [v9 cachedPrimaryAppleAccount];
  [v10 setEnabled:*((unsigned char *)self + 243) & 1 forDataclass:v7];

  [(SettingsBaseController *)self _saveUserAccount];
}

- (void)alchemizeButtonEnabledWasToggled:(id)a3 specifier:(id)a4
{
  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [a3 unsignedIntValue]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(@"EnableAlchemizeButton", v4, @"com.apple.mobileslideshow");
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
}

- (id)alchemizeButtonEnabled:(id)a3
{
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"EnableAlchemizeButton", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    id v4 = +[NSNumber numberWithBool:AppBooleanValue != 0];
  }
  else
  {
    id v5 = PLPreferencesGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v9 = @"com.apple.mobileslideshow";
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Enable Alchemize button default not set in domain %@. Defaulting toggle to ON", buf, 0xCu);
    }

    id v4 = &__kCFBooleanTrue;
  }

  return v4;
}

- (void)highMotionReminderEnabledWasToggled:(id)a3 specifier:(id)a4
{
  +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 1 - [a3 unsignedIntValue]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(@"com.apple.SpatialMedia.OverrideVideoImmersiveRecommendation", v4, @"Apple Global Domain");
  CFPreferencesAppSynchronize(@"Apple Global Domain");
}

- (id)highMotionReminderEnabled:(id)a3
{
  CFPreferencesAppSynchronize(@"Apple Global Domain");
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"com.apple.SpatialMedia.OverrideVideoImmersiveRecommendation", @"Apple Global Domain", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    id v4 = +[NSNumber numberWithInt:AppBooleanValue == 0];
  }
  else
  {
    id v5 = PLPreferencesGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v9 = @"Apple Global Domain";
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Override Video Immersive Recommendation default not set in domain %@. Defaulting toggle to ON", buf, 0xCu);
    }

    id v4 = &__kCFBooleanTrue;
  }

  return v4;
}

- (void)featuredContentAllowedWasToggled:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];
  PLSetFeaturedContentAllowed();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.PreferenceChanged", 0, 0, 1u);
  id v16 = 0;
  unsigned int v6 = +[PXWidgetTimeline requestForYouWidgetTimelineReloadWithError:&v16];
  id v7 = v16;
  unsigned __int8 v8 = PLUIGetLog();
  CFStringRef v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      long long v10 = "[FeaturedContentAllowedToggled] request to reload widget completed";
      id v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      uint32_t v13 = 2;
LABEL_6:
      _os_log_impl(&dword_0, v11, v12, v10, buf, v13);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v7;
    long long v10 = "[FeaturedContentAllowedToggled] request to reload widget failed: %@";
    id v11 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 12;
    goto LABEL_6;
  }

  id v14 = [(SettingsBaseController *)self systemPhotoLibrary];
  id v15 = [v14 photoAnalysisClient];
  [v15 reloadWallpaperSuggestions:0 reply:&stru_28A38];
}

- (id)featuredContentAllowed:(id)a3
{
  uint64_t v3 = PLIsFeaturedContentAllowed();

  return +[NSNumber numberWithBool:v3];
}

- (void)contentPrivacyEnableWasToggled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v7 propertyForKey:PSKeyNameKey];
  CFStringRef v9 = PLUIGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    long long v10 = objc_opt_class();
    id v11 = v10;
    *(_DWORD *)buf = 138412802;
    id v29 = v10;
    __int16 v30 = 2048;
    id v31 = self;
    __int16 v32 = 1024;
    unsigned int v33 = [v6 BOOLValue];
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "<%@: %p> content privacy setting set to %d", buf, 0x1Cu);
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_D220;
  v26[3] = &unk_289F0;
  id v12 = v8;
  id v27 = v12;
  uint32_t v13 = objc_retainBlock(v26);
  if ([v6 BOOLValue])
  {
    ((void (*)(void *, id))v13[2])(v13, v6);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    id v14 = +[NSBundle bundleForClass:objc_opt_class()];
    id v15 = [v14 localizedStringForKey:@"CONTENT_PRIVACY_DISABLE_TOUCHID_TITLE" value:&stru_29018 table:@"Photos"];

    id v16 = +[NSBundle bundleForClass:objc_opt_class()];
    id v17 = [v16 localizedStringForKey:@"CONTENT_PRIVACY_DISABLE_PASSCODE_TITLE" value:&stru_29018 table:@"Photos"];

    switch((unint64_t)[(PXContentPrivacyController *)self->_privacyController authenticationType])
    {
      case 0uLL:
      case 1uLL:
      case 2uLL:
      case 6uLL:
        id v18 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v19 = [v18 localizedStringForKey:@"CONTENT_PRIVACY_DISABLE_PASSCODE_SUBTITLE_GENERAL" value:&stru_29018 table:@"Photos"];
        goto LABEL_7;
      case 3uLL:
        id v18 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v19 = [v18 localizedStringForKey:@"CONTENT_PRIVACY_DISABLE_PASSCODE_SUBTITLE_TOUCHID" value:&stru_29018 table:@"Photos"];
        goto LABEL_7;
      case 4uLL:
        id v18 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v19 = [v18 localizedStringForKey:@"CONTENT_PRIVACY_DISABLE_PASSCODE_SUBTITLE_FACEID" value:&stru_29018 table:@"Photos"];
        goto LABEL_7;
      case 5uLL:
        id v18 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v19 = [v18 localizedStringForKey:@"CONTENT_PRIVACY_DISABLE_PASSCODE_SUBTITLE_OPTIC" value:&stru_29018 table:@"Photos"];
LABEL_7:
        BOOL v20 = (void *)v19;

        break;
      default:
        BOOL v20 = 0;
        break;
    }
    privacyController = self->_privacyController;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_D280;
    v22[3] = &unk_28A18;
    id v24 = v13;
    objc_copyWeak(&v25, (id *)buf);
    id v23 = v7;
    [(PXContentPrivacyController *)privacyController performUserAuthenticationIfNeededWithTitle:v15 passcodeTitle:v17 passcodeSubtitle:v20 completion:v22];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
}

- (id)contentPrivacyEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyForKey:PSKeyNameKey];
  Boolean keyExistsAndHasValidFormat = 0;
  unint64_t v6 = CFPreferencesGetAppBooleanValue(v5, @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
  {
    id v7 = [v4 propertyForKey:PSDefaultValueKey];
    unint64_t v6 = (unint64_t)[v7 BOOLValue];

    unsigned __int8 v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = (__CFString *)objc_opt_class();
      *(_DWORD *)buf = 138412802;
      id v18 = v9;
      __int16 v19 = 2048;
      BOOL v20 = self;
      __int16 v21 = 1024;
      int v22 = v6;
      long long v10 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "<%@: %p> content privacy setting never set. Defaulting to: %d", buf, 0x1Cu);
    }
  }
  [(PXContentPrivacyController *)self->_privacyController updateAuthenticationTypeImmediately];
  if ([(PXContentPrivacyController *)self->_privacyController authenticationType] == (char *)&dword_0 + 1)
  {
    id v11 = PLContentPrivacyUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = @"NO";
      if (v6) {
        id v12 = @"YES";
      }
      uint32_t v13 = v12;
      *(_DWORD *)buf = 138543362;
      id v18 = v13;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "User has no passcode or biometrics enabled, so forcing the settings switch to NO. Actual pref value is %{public}@", buf, 0xCu);
    }
    unint64_t v6 = 0;
  }
  id v14 = +[NSNumber numberWithBool:v6];

  return v14;
}

- (id)videoAutoplayEnabled:(id)a3
{
  id v4 = [a3 propertyForKey:PSKeyNameKey];
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL IsVideoAutoplayEnabled = CFPreferencesGetAppBooleanValue(v4, @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
  {
    BOOL IsVideoAutoplayEnabled = UIAccessibilityIsVideoAutoplayEnabled();
    unint64_t v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      uint32_t v13 = v7;
      __int16 v14 = 2048;
      id v15 = self;
      __int16 v16 = 1024;
      BOOL v17 = IsVideoAutoplayEnabled;
      id v8 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> video auto-play setting set to %d to honor AX setting", buf, 0x1Cu);
    }
  }
  CFStringRef v9 = +[NSNumber numberWithBool:IsVideoAutoplayEnabled];

  return v9;
}

- (void)setTransferBehaviorUserPreference:(int64_t)a3
{
  CFPreferencesSetAppValue(@"CAMUserPreferenceMediaTransferBehavior", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"), @"com.apple.camera");
  CFPreferencesAppSynchronize(@"com.apple.camera");
  id v5 = [(SettingsBaseController *)self specifiers];
  sub_D70C(v5, a3);

  [(SettingsBaseController *)self reloadSpecifierID:@"TransferGroup"];
}

- (int64_t)transferBehaviorUserPreference
{
  return CFPreferencesGetAppIntegerValue(@"CAMUserPreferenceMediaTransferBehavior", @"com.apple.camera", 0);
}

- (void)selectKeepOriginalsTransferBehavior:(id)a3
{
}

- (void)selectAutomaticTransferBehavior:(id)a3
{
}

- (void)_updateKeepOriginals:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SettingsBaseController *)self systemPhotoLibrary];
  [v5 setKeepOriginalsEnabled:v3];

  [(SettingsBaseController *)self _updateAccountCloudPhotoFooterTextAnimated:1];
  [(SettingsBaseController *)self _updateCloudPhotoFooterTextAnimated:1];
  [(SettingsBaseController *)self beginUpdates];
  [(SettingsBaseController *)self _formatKeepOriginalsAndOptimizeSpecifiers];

  [(SettingsBaseController *)self endUpdates];
}

- (void)optimizeStorage:(id)a3
{
}

- (void)keepOriginals:(id)a3
{
}

- (void)runPhotosRebuild:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyForKey:PSEnabledKey];
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"PHOTOS_REBUILD_ACTION_DETAILS" value:&stru_29018 table:@"Photos"];

    CFStringRef v9 = +[NSBundle bundleForClass:objc_opt_class()];
    long long v10 = [v9 localizedStringForKey:@"PHOTOS_REBUILD_DECLINE_ACTION_TITLE" value:&stru_29018 table:@"Photos"];

    id v11 = +[NSBundle bundleForClass:objc_opt_class()];
    id v12 = [v11 localizedStringForKey:@"PHOTOS_REBUILD_CONFIRM_ACTION_TITLE" value:&stru_29018 table:@"Photos"];

    uint32_t v13 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];
    __int16 v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    id v18 = sub_DAA8;
    __int16 v19 = &unk_289C8;
    id v20 = v4;
    __int16 v21 = self;
    __int16 v14 = +[UIAlertAction actionWithTitle:v12 style:2 handler:&v16];
    id v15 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, 0, 0, v16, v17, v18, v19);
    [v15 addAction:v13];
    [v15 addAction:v14];
    [(SettingsBaseController *)self presentViewController:v15 animated:1 completion:0];
  }
}

- (void)diagnosticServiceStateDidChange:(char)a3 outputURL:(id)a4 error:(id)a5
{
  int v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v6 == 1)
  {
    id v12 = PLUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v16 = 138412546;
      *(void *)&v16[4] = objc_opt_class();
      *(_WORD *)&v16[12] = 2048;
      *(void *)&v16[14] = self;
      id v13 = *(id *)&v16[4];
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "<%@: %p> Diagnose running", v16, 0x16u);
    }
    CFStringRef v11 = @"PHOTOS_DIAGNOSE_RUNNING";
  }
  else if (v6)
  {
    if (v6 == -1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        long long v10 = [v9 localizedFailureReason];
        *(_DWORD *)__int16 v16 = 138543362;
        *(void *)&v16[4] = v10;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error running diagnose: %{public}@", v16, 0xCu);
      }
      CFStringRef v11 = @"PHOTOS_DIAGNOSE_UNAVAILABLE";
    }
    else
    {
      CFStringRef v11 = 0;
    }
  }
  else
  {
    __int16 v14 = PLUIGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v16 = 138412546;
      *(void *)&v16[4] = objc_opt_class();
      *(_WORD *)&v16[12] = 2048;
      *(void *)&v16[14] = self;
      id v15 = *(id *)&v16[4];
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "<%@: %p> Diagnose ready to run", v16, 0x16u);
    }
    CFStringRef v11 = @"PHOTOS_DIAGNOSE_RUN";
  }
  -[SettingsBaseController updateDiagnoseButtonName:enabled:](self, "updateDiagnoseButtonName:enabled:", v11, v6 == 0, *(_OWORD *)v16, *(void *)&v16[16]);
}

- (void)updateDiagnoseButtonName:(id)a3 enabled:(BOOL)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E090;
  block[3] = &unk_289A0;
  BOOL v7 = a4;
  void block[4] = self;
  id v6 = a3;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)generateCPLDiagnose:(id)a3
{
  id v4 = [a3 propertyForKey:PSEnabledKey];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    if ([(SettingsBaseController *)self _useInternalDiagnostics])
    {
      id v9 = +[LSApplicationWorkspace defaultWorkspace];
      id v6 = [(SettingsBaseController *)self tapToRadarURL];
      [v9 openURL:v6 configuration:0 completionHandler:0];
    }
    else
    {
      [(SettingsBaseController *)self updateDiagnoseButtonName:@"PHOTOS_DIAGNOSE_REQUESTING" enabled:0];
      BOOL v7 = [(SettingsBaseController *)self diagnoseServiceConnection];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_E358;
      v11[3] = &unk_288B0;
      v11[4] = self;
      id v8 = [v7 remoteObjectProxyWithErrorHandler:v11];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_E454;
      v10[3] = &unk_28978;
      v10[4] = self;
      [v8 runDiagnoseWithOptions:&off_2B5D8 replyHandler:v10];
    }
  }
}

- (id)diagnoseServiceConnection
{
  p_diagnoseServiceConnection = &self->_diagnoseServiceConnection;
  diagnoseServiceConnection = self->_diagnoseServiceConnection;
  if (!diagnoseServiceConnection)
  {
    id v5 = objc_alloc((Class)NSXPCConnection);
    id v6 = [v5 initWithServiceName:CPLDiagnosticsService];
    BOOL v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CPLDiagnoseServiceProtocol];
    [v6 setRemoteObjectInterface:v7];

    id v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CPLDiagnoseServiceClientProtocol];
    [v6 setExportedInterface:v8];

    [v6 setExportedObject:self];
    objc_initWeak(&location, self);
    __int16 v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    __int16 v16 = sub_E7FC;
    uint64_t v17 = &unk_28E48;
    objc_copyWeak(&v18, &location);
    id v9 = objc_retainBlock(&v14);
    objc_msgSend(v6, "setInterruptionHandler:", v9, v14, v15, v16, v17);
    [v6 setInvalidationHandler:v9];
    [v6 resume];
    objc_storeStrong((id *)p_diagnoseServiceConnection, v6);
    long long v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v11 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      __int16 v21 = v11;
      __int16 v22 = 2048;
      id v23 = self;
      id v12 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "<%@: %p> Diagnose service connected", buf, 0x16u);
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

    diagnoseServiceConnection = *p_diagnoseServiceConnection;
  }

  return diagnoseServiceConnection;
}

- (void)cloudPhotosEnableWasToggled:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [a3 BOOLValue];
  if (self->_cloudPhotosEnabled != v7)
  {
    if (v7)
    {
      id v8 = +[PLPhotoLibrary systemPhotoLibrary];
      id v9 = [v8 iTunesSyncedContentInfo];

      uint64_t v10 = PLITunesSyncedContentInfoAssetCountKey;
      CFStringRef v11 = [v9 objectForKeyedSubscript:PLITunesSyncedContentInfoAssetCountKey];
      id v12 = [v11 integerValue];

      if (v12)
      {
        id v13 = [v9 objectForKeyedSubscript:PLITunesSyncedContentInfoVideoCountKey];
        id v14 = [v13 BOOLValue];

        uint64_t v15 = [v9 objectForKeyedSubscript:PLITunesSyncedContentInfoPhotoCountKey];
        id v16 = [v15 BOOLValue];

        uint64_t v17 = [v9 objectForKeyedSubscript:v10];
        id v18 = [v17 integerValue];

        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_EA78;
        v22[3] = &unk_28FE0;
        void v22[4] = self;
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_EB38;
        v20[3] = &unk_28DA8;
        v20[4] = self;
        id v21 = v6;
        __int16 v19 = +[UIAlertController px_deleteITunesContentAlertWithAssetCount:v18 includesPhotos:v16 includesVideos:v14 actionHandler:v22 cancelHandler:v20];
        [(SettingsBaseController *)self presentViewController:v19 animated:1 completion:0];
      }
      else
      {
        [(SettingsBaseController *)self _enableCloudPhotosWithExitModeWarningIgnoringStorageLimits:0];
      }
    }
    else
    {
      [(SettingsBaseController *)self _beginCloudPhotosDisableFlow];
    }
  }
}

- (id)cloudPhotosEnabled:(id)a3
{
  return +[NSNumber numberWithBool:self->_cloudPhotosEnabled];
}

- (void)shouldShowPhotoLibraryInSearchWasToggled:(id)a3 specifier:(id)a4
{
  id v5 = (void *)CFPreferencesCopyAppValue(@"SBSearchDisabledBundles", @"com.apple.spotlightui");
  value = +[NSMutableArray arrayWithArray:v5];

  unsigned int v6 = [value containsObject:@"com.apple.mobileslideshow"];
  if (a3 && v6)
  {
    [value removeObject:@"com.apple.mobileslideshow"];
  }
  else
  {
    if (a3) {
      int v7 = 1;
    }
    else {
      int v7 = v6;
    }
    if (v7 == 1) {
      [value addObject:@"com.apple.mobileslideshow"];
    }
  }
  CFPreferencesSetAppValue(@"SBSearchDisabledBundles", value, @"com.apple.spotlightui");
  CFPreferencesSynchronize(@"com.apple.spotlightui", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

- (id)shouldShowPhotoLibraryInSearch:(id)a3
{
  CFArrayRef v3 = (const __CFArray *)CFPreferencesCopyAppValue(@"SBSearchDisabledBundles", @"com.apple.spotlightui");
  if (v3)
  {
    CFArrayRef v4 = v3;
    v9.length = CFArrayGetCount(v3);
    v9.id location = 0;
    BOOL v5 = CFArrayContainsValue(v4, v9, @"com.apple.mobileslideshow") == 0;
    CFRelease(v4);
    unsigned int v6 = +[NSNumber numberWithBool:v5];
  }
  else
  {
    unsigned int v6 = &__kCFBooleanFalse;
  }

  return v6;
}

- (void)sharedStreamsSwitchWasToggled:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  if (![a3 BOOLValue])
  {
    CFRange v9 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v10 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"SHAREDSTREAMS_TURN_OFF_CONFIRMATION_TITLE"];
    CFStringRef v11 = [v9 localizedStringForKey:v10 value:&stru_29018 table:@"Photos"];

    id v12 = +[NSBundle bundleForClass:objc_opt_class()];
    id v13 = [v12 localizedStringForKey:@"SHAREDSTREAMS_OK" value:&stru_29018 table:@"Photos"];

    id v14 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v15 = [v14 localizedStringForKey:@"SHAREDSTREAMS_CANCEL" value:&stru_29018 table:@"Photos"];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_F03C;
    v17[3] = &unk_28950;
    v17[4] = self;
    id v18 = v6;
    [(SettingsBaseController *)self _confirmWithTitle:0 message:v11 confirmationButtonTitle:v13 cancelButtonTtle:v15 completion:v17];

LABEL_6:
    goto LABEL_7;
  }
  if ((*((unsigned char *)self + 243) & 2) == 0)
  {
    int v7 = +[PLAccountStore pl_sharedAccountStore];
    id v8 = [v7 cachedPrimaryAppleAccount];

    if (!v8)
    {
      CFStringRef v11 = PLUIGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = (id)objc_opt_class();
        __int16 v21 = 2048;
        __int16 v22 = self;
        id v16 = v20;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "<%@: %p> Can't enable shared streams without an account!", buf, 0x16u);
      }
      goto LABEL_6;
    }
  }
  [(SettingsBaseController *)self _setSharedStreamsEnabled:1];
LABEL_7:
}

- (id)sharedStreamsEnabled:(id)a3
{
  return +[NSNumber numberWithUnsignedInt:*((unsigned char *)self + 243) & 1];
}

- (void)photoLibraryDidBecomeUnavailable:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_F114;
  v5[3] = &unk_28DA8;
  id v6 = a3;
  int v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)_handleDeferredPushIdentifier
{
  if (!self->_deferredPushIdentifier) {
    return;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v4 = v3 - self->_deferredPushTimeIntervalSinceReferenceDate;
  if (v4 <= 3.0)
  {
    uint64_t v10 = [(SettingsBaseController *)self specifiers];
    CFStringRef v11 = [v10 specifierForID:self->_deferredPushIdentifier];

    if (v11)
    {
      id v12 = [v11 propertyForKey:PSEnabledKey];
      unsigned __int8 v13 = [v12 BOOLValue];

      id v14 = PLUIGetLog();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v15)
        {
          id v16 = objc_opt_class();
          deferredPushIdentifier = self->_deferredPushIdentifier;
          int v26 = 138412802;
          id v27 = v16;
          __int16 v28 = 2048;
          id v29 = self;
          __int16 v30 = 2114;
          id v31 = deferredPushIdentifier;
          id v18 = v16;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "<%@: %p> Execute deferred push for specifier: %{public}@", (uint8_t *)&v26, 0x20u);
        }
        __int16 v19 = self->_deferredPushIdentifier;
        self->_deferredPushIdentifier = 0;

        [(SettingsBaseController *)self handlePendingURL];
        goto LABEL_17;
      }
      if (v15)
      {
        id v24 = objc_opt_class();
        id v25 = self->_deferredPushIdentifier;
        int v26 = 138412802;
        id v27 = v24;
        __int16 v28 = 2048;
        id v29 = self;
        __int16 v30 = 2114;
        id v31 = v25;
        id v22 = v24;
        id v23 = "<%@: %p> Keep deferring push for DISABLED specifier: %{public}@";
        goto LABEL_15;
      }
    }
    else
    {
      id v14 = PLUIGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = objc_opt_class();
        __int16 v21 = self->_deferredPushIdentifier;
        int v26 = 138412802;
        id v27 = v20;
        __int16 v28 = 2048;
        id v29 = self;
        __int16 v30 = 2114;
        id v31 = v21;
        id v22 = v20;
        id v23 = "<%@: %p> Keep deferring push for MISSING specifier: %{public}@";
LABEL_15:
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v26, 0x20u);
      }
    }

LABEL_17:
    return;
  }
  BOOL v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    int v7 = self->_deferredPushIdentifier;
    int v26 = 138413058;
    id v27 = v6;
    __int16 v28 = 2048;
    id v29 = self;
    __int16 v30 = 2114;
    id v31 = v7;
    __int16 v32 = 2048;
    double v33 = v4;
    id v8 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p> Deferred push for specifier: %{public}@, TIMED OUT after %.2f s", (uint8_t *)&v26, 0x2Au);
  }
  CFRange v9 = self->_deferredPushIdentifier;
  self->_deferredPushIdentifier = 0;

  self->_deferredPushTimeIntervalSinceReferenceDate = 0.0;
  [(SettingsBaseController *)self clearPendingURL];
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[MSSSharedLibraryBaseController buttonIdentifier];
  if ([v4 isEqualToString:v5])
  {
    id v6 = [(SettingsBaseController *)self specifiers];
    int v7 = [v6 specifierForID:v5];

    id v8 = [v7 propertyForKey:PSEnabledKey];
    unsigned int v9 = [v8 BOOLValue];

    uint64_t v10 = PLUIGetLog();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412802;
        id v21 = (id)objc_opt_class();
        __int16 v22 = 2048;
        id v23 = self;
        __int16 v24 = 2114;
        id v25 = v5;
        id v12 = v21;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "<%@: %p> No need to defer push for specifier: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412802;
        id v21 = (id)objc_opt_class();
        __int16 v22 = 2048;
        id v23 = self;
        __int16 v24 = 2114;
        id v25 = v5;
        id v16 = v21;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "<%@: %p> Schedule deferred push for specifier: %{public}@", buf, 0x20u);
      }
      objc_storeStrong((id *)&self->_deferredPushIdentifier, v5);
      +[NSDate timeIntervalSinceReferenceDate];
      self->_deferredPushTimeIntervalSinceReferenceDate = v17;
    }
    unsigned __int8 v15 = v9 ^ 1;
  }
  else
  {
    unsigned __int8 v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v21 = (id)objc_opt_class();
      __int16 v22 = 2048;
      id v23 = self;
      __int16 v24 = 2114;
      id v25 = v4;
      id v14 = v21;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "<%@: %p> No support for deferring push for specifier: %{public}@", buf, 0x20u);
    }
    v19.receiver = self;
    v19.super_class = (Class)SettingsBaseController;
    unsigned __int8 v15 = [(SettingsBaseController *)&v19 shouldDeferPushForSpecifierID:v4];
  }

  return v15;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSXPCConnection *)self->_diagnoseServiceConnection invalidate];
  diagnoseServiceConnection = self->_diagnoseServiceConnection;
  self->_diagnoseServiceConnection = 0;

  v6.receiver = self;
  v6.super_class = (Class)SettingsBaseController;
  [(SettingsBaseController *)&v6 viewDidDisappear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CPLStatus *)self->_cplStatus setDelegate:0];
  cplStatus = self->_cplStatus;
  self->_cplStatus = 0;

  [(SettingsBaseController *)self _hideDisplayedSpinner];
  v6.receiver = self;
  v6.super_class = (Class)SettingsBaseController;
  [(SettingsBaseController *)&v6 viewWillDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SettingsBaseController;
  [(SettingsBaseController *)&v4 viewDidAppear:a3];
  [(SettingsBaseController *)self _emitNavigationEvent];
}

- (void)_setupSharedLibrarySettings
{
  BOOL v3 = [[MSSSharedLibraryBaseController alloc] initWithSettingsBaseController:self];
  sharedLibrarySettingsController = self->_sharedLibrarySettingsController;
  self->_sharedLibrarySettingsController = v3;

  [(MSSSharedLibraryBaseController *)self->_sharedLibrarySettingsController setCloudPhotosEnabled:self->_cloudPhotosEnabled];
  [(MSSSharedLibraryBaseController *)self->_sharedLibrarySettingsController setCloudPhotosInExitMode:self->_isCPLInExitMode];
  BOOL v5 = [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider status];
  [(MSSSharedLibraryBaseController *)self->_sharedLibrarySettingsController setCloudPhotosStatus:v5];

  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  objc_super v6 = +[PLPhotoLibrary systemPhotoLibrary];
  PLShouldShowSharedLibrarySetting();

  *((unsigned char *)v8 + 24) = *((unsigned char *)v12 + 24) ^ 1;
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

- (void)_setupCPLStatus
{
  id v6 = +[PLPhotoLibraryPathManager systemLibraryPathManager];
  CPLStatusFromPathManager();
  BOOL v3 = (CPLStatus *)objc_claimAutoreleasedReturnValue();
  cplStatus = self->_cplStatus;
  self->_cplStatus = v3;

  [(CPLStatus *)self->_cplStatus setDelegate:self];
  BOOL v5 = [(CPLStatus *)self->_cplStatus exitDeleteTime];
  self->_BOOL isCPLInExitMode = v5 != 0;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SettingsBaseController;
  [(SettingsBaseController *)&v3 viewDidLoad];
  [(SettingsBaseController *)self _updateDiagnoseSpecifier];
  if ((*((unsigned char *)self + 243) & 2) != 0) {
    [(SettingsBaseController *)self _getPhotosCloudSpaceInBytes];
  }
}

- (void)_updateDiagnoseSpecifier
{
  objc_super v3 = [(SettingsBaseController *)self specifierForID:@"photosDiagnose"];
  if (v3)
  {
    if ([(SettingsBaseController *)self _useInternalDiagnostics])
    {
      [(SettingsBaseController *)self updateDiagnoseButtonName:@"PHOTOS_DIAGNOSE_RUN" enabled:1];
    }
    else
    {
      [(SettingsBaseController *)self updateDiagnoseButtonName:@"PHOTOS_DIAGNOSE_CHECKING_STATUS" enabled:0];
      objc_super v4 = [(SettingsBaseController *)self diagnoseServiceConnection];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_FDCC;
      v7[3] = &unk_288B0;
      v7[4] = self;
      BOOL v5 = [v4 remoteObjectProxyWithErrorHandler:v7];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_FDE0;
      v6[3] = &unk_288D8;
      v6[4] = self;
      [v5 checkStateWithReplyHandler:v6];
    }
  }
}

- (void)reloadSpecifiers
{
  objc_super v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2048;
    uint64_t v9 = self;
    id v4 = v7;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "<%@: %p> Reload specifiers", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)SettingsBaseController;
  [(SettingsBaseController *)&v5 reloadSpecifiers];
  [(SettingsBaseController *)self _updateDiagnoseSpecifier];
  [(SettingsBaseController *)self _handleDeferredPushIdentifier];
}

- (BOOL)_shouldHideCPL
{
  objc_super v3 = +[MCProfileConnection sharedConnection];
  id v4 = +[PLAccountStore pl_sharedAccountStore];
  objc_super v5 = [v4 cachedPrimaryAppleAccount];

  if (v5)
  {
    id v6 = [v5 provisionedDataclasses];
    unsigned int v7 = [v6 containsObject:kAccountDataclassCloudPhotos];
  }
  else
  {
    unsigned int v7 = 0;
  }
  unsigned int v8 = [v3 BOOLRestrictionForFeature:MCFeatureCloudPhotoLibraryAllowed];
  if (v8 == 2) {
    int v9 = 1;
  }
  else {
    int v9 = v7 ^ 1;
  }
  char v10 = PLUIGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = v8 == 2;
    id v12 = objc_opt_class();
    int v16 = 138413314;
    CFStringRef v13 = @"Nope.";
    __int16 v18 = 2048;
    double v17 = v12;
    if (v9) {
      CFStringRef v13 = @"Yes!";
    }
    objc_super v19 = self;
    __int16 v20 = 2112;
    CFStringRef v21 = v13;
    __int16 v22 = 1024;
    unsigned int v23 = v7;
    __int16 v24 = 1024;
    BOOL v25 = v11;
    id v14 = v12;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "<%@: %p> Should hide iCPL: %@ (provisioned: %d, restricted: %d)", (uint8_t *)&v16, 0x2Cu);
  }
  return v9;
}

- (id)tapToRadarURL
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 setObject:@"com.apple.PhotoLibraryServices.PhotosDiagnostics" forKeyedSubscript:@"ExtensionIdentifiers"];
  [v2 setObject:@"630529" forKeyedSubscript:@"ComponentID"];
  [v2 setObject:@"Photos (New Bugs)" forKeyedSubscript:@"ComponentName"];
  [v2 setObject:@"iOS" forKeyedSubscript:@"ComponentVersion"];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        char v10 = objc_msgSend(v4, "objectForKeyedSubscript:", v9, (void)v15);
        BOOL v11 = +[NSURLQueryItem queryItemWithName:v9 value:v10];
        [v3 addObject:v11];
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  id v12 = +[NSURLComponents componentsWithString:@"tap-to-radar://new"];
  [v12 setQueryItems:v3];
  CFStringRef v13 = [v12 URL];

  return v13;
}

- (BOOL)_useInternalDiagnostics
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10340;
  block[3] = &unk_28FE0;
  void block[4] = self;
  if (qword_2F6E8 != -1) {
    dispatch_once(&qword_2F6E8, block);
  }
  return byte_2F6E0;
}

- (BOOL)_isAppleInternal
{
  if (qword_2F6D8 != -1) {
    dispatch_once(&qword_2F6D8, &stru_28888);
  }
  return byte_2F6D0;
}

- (BOOL)_shownFromAccountSettings
{
  return 0;
}

- (PHPhotoLibrary)systemPhotoLibrary
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  systemPhotoLibrary = self->_systemPhotoLibrary;
  if (!systemPhotoLibrary)
  {
    id v4 = objc_alloc((Class)PHPhotoLibrary);
    id v5 = +[PHPhotoLibrary systemPhotoLibraryURL];
    id v6 = (PHPhotoLibrary *)[v4 initWithPhotoLibraryURL:v5];
    uint64_t v7 = self->_systemPhotoLibrary;
    self->_systemPhotoLibrary = v6;

    [(PHPhotoLibrary *)self->_systemPhotoLibrary openAndWaitWithUpgrade:0 error:0];
    [(PHPhotoLibrary *)self->_systemPhotoLibrary registerAvailabilityObserver:self];
    systemPhotoLibrary = self->_systemPhotoLibrary;
  }

  return systemPhotoLibrary;
}

- (SettingsBaseController)init
{
  id v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = (id)objc_opt_class();
    __int16 v19 = 2048;
    __int16 v20 = self;
    id v4 = v18;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "<%@: %p> Init", buf, 0x16u);
  }
  v16.receiver = self;
  v16.super_class = (Class)SettingsBaseController;
  id v5 = [(SettingsBaseController *)&v16 init];
  id v6 = v5;
  if (v5)
  {
    unsigned int v7 = [(SettingsBaseController *)v5 _shownFromAccountSettings];
    if (v7) {
      char v8 = 2;
    }
    else {
      char v8 = 0;
    }
    *((unsigned char *)v6 + 243) = *((unsigned char *)v6 + 243) & 0xFD | v8;
    if (v7)
    {
      [(SettingsBaseController *)v6 _initializeCPLStatusProvider];
      cloudStorageString = v6->_cloudStorageString;
      v6->_cloudStorageString = (NSString *)&stru_29018;
    }
    v6->_BOOL shouldHideTransferBehaviors = 0;
    char v10 = +[MCProfileConnection sharedConnection];
    v6->_BOOL accountModificationAllowed = [v10 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed] != 2;

    BOOL v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v6 selector:"_applicationWillResignActive:" name:UIApplicationWillResignActiveNotification object:0];

    id v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v6 selector:"_applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    [(SettingsBaseController *)v6 _initializeCPLStatusProvider];
    CFStringRef v13 = (PXContentPrivacyController *)[objc_alloc((Class)PXContentPrivacyController) initWithLogIdentifier:@"Preferences"];
    privacyController = v6->_privacyController;
    v6->_privacyController = v13;

    [(SettingsBaseController *)v6 _setupCPLStatus];
    [(SettingsBaseController *)v6 _setupSharedLibrarySettings];
  }
  return v6;
}

+ (id)filterAndConfigureSpecifiers:(id)a3 shownFromAccountSettings:(BOOL)a4 cloudPhotosEnabled:(BOOL)a5 cplKeepOriginals:(BOOL)a6 isCPLInExitMode:(BOOL)a7 cplDaysUntilExit:(int64_t)a8 shouldHideCPL:(BOOL)a9 shouldHideTransferBehaviors:(BOOL)a10 cloudPhotosPaused:(BOOL)a11 canEnableSharedStreams:(BOOL)a12 cplStatus:(id)a13 cplActionPerformer:(id)a14 showPhotosDiagnoseButton:(BOOL)a15 showPhotosRebuildButton:(BOOL)a16 accountModificationAllowed:(BOOL)a17 isOLEDDevice:(BOOL)a18 wantsPhotosAppSpecificSettings:(BOOL)a19 isLocationBeingOverridden:(BOOL)a20 currentAuthenticationType:(int64_t)a21 systemPolicyOptions:(unint64_t)a22 bundleIdentifier:(id)a23 transferBehaviorUserPreference:(int64_t)a24 sharedLibraryInvitationSpecifiers:(id)a25 sharedLibrarySettingsSpecifiers:(id)a26 instanceLogInfo:(id)a27
{
  BOOL v202 = a7;
  BOOL v203 = a4;
  BOOL v206 = a6;
  BOOL v207 = a5;
  id v27 = a3;
  id v198 = a13;
  objc_initWeak(&location, a14);
  id v192 = a23;
  id v197 = a25;
  id v205 = a26;
  id v201 = a27;
  __int16 v28 = v27;
  id v29 = [v27 specifierForID:@"photosDiagnose"];
  __int16 v30 = [v27 specifierForID:@"photosRebuild"];
  id v31 = objc_alloc_init((Class)NSMutableArray);
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  if (v29 && !a15)
  {
    __int16 v32 = PLUIGetLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v201;
      _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "<%@> Hiding internal Photos diagnose option", (uint8_t *)buf, 0xCu);
    }

    [v31 addObject:v29];
    __int16 v28 = v27;
  }
  if (v30 && !a16)
  {
    double v33 = PLUIGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v201;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "<%@> Hiding internal Photos rebuild option", (uint8_t *)buf, 0xCu);
    }

    [v31 addObject:v30];
    __int16 v28 = v27;
  }
  if ((unint64_t)[v31 count] >= 2)
  {
    id v34 = [v28 specifierForID:@"photosDiagnoseTitleGroup"];
    if (v34) {
      [v31 addObject:v34];
    }

    __int16 v28 = v27;
  }
  if ([v31 count]) {
    [v28 removeObjectsInArray:v31];
  }

  v209 = [v27 specifierForID:@"iCloudOptimizeStorageOption"];
  id v35 = +[UIDevice currentDevice];
  id v36 = [v35 model];
  v199 = [@"ICLOUDPHOTOS_OPTIMIZE_STORAGE_" stringByAppendingString:v36];

  uint64_t v37 = PULocalizedString();
  [v209 setName:v37];
  v188 = (void *)v37;
  v195 = [v27 specifierForID:@"iCloudKeepOriginalsGroup"];
  uint64_t v38 = sub_6524(v206, v202);
  uint64_t v190 = PSFooterTextGroupKey;
  objc_msgSend(v195, "setProperty:forKey:", v38);
  v186 = (void *)v38;
  v193 = [v27 specifierForID:@"iCloudPhotosTitleGroup"];
  id v39 = objc_loadWeakRetained(&location);
  sub_6794(v193, v202, v207, v206, a8, v203, v39);

  int64_t v40 = [v27 specifierForID:@"VideoAutoplaySwitch"];
  uint64_t v208 = PSAllowMultilineTitleKey;
  objc_msgSend(v40, "setObject:forKeyedSubscript:", &__kCFBooleanTrue);
  v185 = v40;
  uint64_t v41 = [v27 specifierForID:@"VideoAutoloopSwitch"];
  [v41 setObject:&__kCFBooleanTrue forKeyedSubscript:v208];
  v184 = v41;
  unsigned __int8 v42 = [v27 specifierForID:@"ImageModulationSwitch"];
  [v42 setObject:&__kCFBooleanTrue forKeyedSubscript:v208];
  v183 = v42;
  unsigned int v43 = [v27 specifierForID:@"ResetPeopleFeedback"];
  [v43 setObject:&__kCFBooleanTrue forKeyedSubscript:v208];
  v44 = [v27 specifierForID:@"PhotosPrivacyOverview"];
  id v45 = objc_loadWeakRetained(&location);
  id v46 = v44;
  objc_initWeak((id *)buf, v45);
  char v47 = +[OBBundleManager sharedManager];
  v48 = [v47 bundleWithIdentifier:@"com.apple.onboarding.photos"];

  v49 = [v48 privacyFlow];
  unsigned __int8 v50 = [v49 localizedButtonTitle];
  id v51 = [v50 rangeOfString:v50];
  NSUInteger v53 = v52;
  v54 = (objc_class *)objc_opt_class();
  v55 = NSStringFromClass(v54);
  [v46 setProperty:v55 forKey:PSFooterCellClassGroupKey];

  [v46 setProperty:v50 forKey:PSFooterHyperlinkViewTitleKey];
  v239.id location = (NSUInteger)v51;
  v239.length = v53;
  v56 = NSStringFromRange(v239);
  [v46 setProperty:v56 forKey:PSFooterHyperlinkViewLinkRangeKey];

  id WeakRetained = objc_loadWeakRetained((id *)buf);
  v58 = +[NSValue valueWithNonretainedObject:WeakRetained];
  [v46 setProperty:v58 forKey:PSFooterHyperlinkViewTargetKey];

  v59 = NSStringFromSelector("_privacyButtonPressed:");
  [v46 setProperty:v59 forKey:PSFooterHyperlinkViewActionKey];

  objc_destroyWeak((id *)buf);
  v235[0] = @"iCloudKeepOriginalsGroup";
  v235[1] = @"iCloudKeepOriginalsOption";
  v235[2] = @"iCloudOptimizeStorageOption";
  v60 = +[NSArray arrayWithObjects:v235 count:3];
  v200 = objc_msgSend(v27, "mss_specifiersWithIdentifiers:", v60);

  sub_8610(v200, v206);
  v61 = v27;
  if (!v207)
  {
    v62 = PLUIGetLog();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v201;
      _os_log_impl(&dword_0, v62, OS_LOG_TYPE_DEFAULT, "<%@> Hiding iCPL conditional specifiers", (uint8_t *)buf, 0xCu);
    }

    v61 = v27;
    [v27 removeObjectsInArray:v200];
  }
  if (+[MSSCellularDataSettingsController shouldShowCellularDataSettings])
  {
    if (!MGGetBoolAnswer()) {
      goto LABEL_28;
    }
    v63 = [v61 specifierForID:@"CellularDataGroup"];
    id v64 = +[NSBundle bundleForClass:objc_opt_class()];
    __int16 v65 = [v64 localizedStringForKey:@"USE_CELLULAR_DATA_FOOTER_WLAN" value:&stru_29018 table:@"Photos"];

    [v63 setProperty:v65 forKey:v190];
    v66 = [v27 specifierForID:@"CellularDataLinkList"];
    __int16 v67 = +[NSBundle bundleForClass:objc_opt_class()];
    id v68 = [v67 localizedStringForKey:@"USE_CELLULAR_DATA_LABEL_WLAN" value:&stru_29018 table:@"Photos"];

    [v66 setName:v68];
  }
  else
  {
    v63 = objc_msgSend(v61, "mss_specifiersWithIdentifiers:", &off_2B618);
    v69 = PLUIGetLog();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v201;
      _os_log_impl(&dword_0, v69, OS_LOG_TYPE_DEFAULT, "<%@> Hiding cellular specifiers", (uint8_t *)buf, 0xCu);
    }

    [v27 removeObjectsInArray:v63];
  }

  v61 = v27;
LABEL_28:
  if (a10)
  {
    v234[0] = @"TransferGroup";
    v234[1] = @"TransferAutomaticOption";
    v234[2] = @"TransferKeepOriginalsOption";
    v70 = +[NSArray arrayWithObjects:v234 count:3];
    v71 = objc_msgSend(v61, "mss_specifiersWithIdentifiers:", v70);

    v72 = PLUIGetLog();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v201;
      _os_log_impl(&dword_0, v72, OS_LOG_TYPE_DEFAULT, "<%@> Hiding all Transfer behavior specifiers", (uint8_t *)buf, 0xCu);
    }

    [v27 removeObjectsInArray:v71];
    v61 = v27;
  }
  else
  {
    sub_D70C(v61, a24);
  }
  if (a9)
  {
    v233[0] = @"iCloudPhotosTitleGroup";
    v233[1] = @"iCloudPhotosSwitch";
    v233[2] = @"iCloudKeepOriginalsGroup";
    v233[3] = @"iCloudOptimizeStorageOption";
    v233[4] = @"iCloudKeepOriginalsOption";
    v73 = +[NSArray arrayWithObjects:v233 count:5];
    v74 = objc_msgSend(v61, "mss_specifiersWithIdentifiers:", v73);

    v75 = PLUIGetLog();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v201;
      _os_log_impl(&dword_0, v75, OS_LOG_TYPE_DEFAULT, "<%@> Hiding all iCPL specifiers", (uint8_t *)buf, 0xCu);
    }

    [v27 removeObjectsInArray:v74];
    v61 = v27;
  }
  if ([v205 count])
  {
    v76 = [v205 firstObject];
    v77 = [v76 identifier];
    BOOL v78 = [v61 indexOfSpecifierWithID:v77] == (id)0x7FFFFFFFFFFFFFFFLL;

    if (v78)
    {
      v79 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [v197 count]);
      [v27 insertObjects:v197 atIndexes:v79];
      v196 = [v197 lastObject];
      if (a9)
      {
        id v80 = [v205 mutableCopy];
        [v80 addObjectsFromArray:v27];
        id v81 = v80;
        v82 = v27;
        id v27 = v81;
      }
      else
      {
        v232[0] = @"iCloudPhotosTitleGroup";
        v232[1] = @"iCloudPhotosSwitch";
        v232[2] = @"iCloudKeepOriginalsGroup";
        v232[3] = @"iCloudOptimizeStorageOption";
        v232[4] = @"iCloudKeepOriginalsOption";
        v83 = +[NSArray arrayWithObjects:v232 count:5];
        id v81 = [v83 arrayByAddingObjectsFromArray:&off_2B630];

        v84 = objc_msgSend(v27, "mss_specifiersWithIdentifiers:", v81);
        v82 = [v84 lastObject];

        objc_msgSend(v27, "ps_insertObjectsFromArray:afterObject:", v205, v82);
      }
    }
    else
    {
      v196 = 0;
    }
    v61 = v27;
  }
  else
  {
    v196 = 0;
  }
  v210 = v61;
  if (!a12)
  {
    v85 = PLUIGetLog();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v201;
      _os_log_impl(&dword_0, v85, OS_LOG_TYPE_DEFAULT, "<%@> Disabling Shared Albums specifiers", (uint8_t *)buf, 0xCu);
    }

    v86 = [v61 specifierForID:@"SharedStreamsSwitch"];
    [v86 setProperty:kCFBooleanFalse forKey:PSEnabledKey];
  }
  if (!a17)
  {
    objc_msgSend(v61, "mss_specifiersWithIdentifiers:", &off_2B648);
    long long v217 = 0u;
    long long v218 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    id v87 = (id)objc_claimAutoreleasedReturnValue();
    id v88 = [v87 countByEnumeratingWithState:&v215 objects:v231 count:16];
    if (v88)
    {
      uint64_t v89 = *(void *)v216;
      uint64_t v90 = PSEnabledKey;
      do
      {
        for (i = 0; i != v88; i = (char *)i + 1)
        {
          if (*(void *)v216 != v89) {
            objc_enumerationMutation(v87);
          }
          [*(id *)(*((void *)&v215 + 1) + 8 * i) setProperty:kCFBooleanFalse forKey:v90];
        }
        id v88 = [v87 countByEnumeratingWithState:&v215 objects:v231 count:16];
      }
      while (v88);
    }

    v61 = v210;
  }
  if (v203)
  {
    v92 = [v205 arrayByAddingObjectsFromArray:v197];
    id v93 = v61;
    id v94 = v92;
    v95 = PLUIGetLog();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v96 = objc_opt_class();
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v96;
      _os_log_impl(&dword_0, v95, OS_LOG_TYPE_DEFAULT, "<%@> Hiding all non photo stream or iCPL specifiers", (uint8_t *)buf, 0xCu);
    }

    id v97 = objc_alloc_init((Class)NSMutableSet);
    v238[0] = @"iCloudPhotosTitleGroup";
    v238[1] = @"iCloudPhotosSwitch";
    v238[2] = @"iCloudKeepOriginalsGroup";
    v238[3] = @"iCloudOptimizeStorageOption";
    v238[4] = @"iCloudKeepOriginalsOption";
    v98 = +[NSArray arrayWithObjects:v238 count:5];
    [v97 addObjectsFromArray:v98];

    [v97 addObjectsFromArray:&off_2B6D8];
    [v97 addObjectsFromArray:&off_2B6F0];
    long long v226 = 0u;
    long long v227 = 0u;
    long long v224 = 0u;
    long long v225 = 0u;
    id v99 = v94;
    id v100 = [v99 countByEnumeratingWithState:&v224 objects:buf count:16];
    if (v100)
    {
      uint64_t v101 = *(void *)v225;
      do
      {
        for (j = 0; j != v100; j = (char *)j + 1)
        {
          if (*(void *)v225 != v101) {
            objc_enumerationMutation(v99);
          }
          v103 = [*(id *)(*((void *)&v224 + 1) + 8 * (void)j) identifier];
          [v97 addObject:v103];
        }
        id v100 = [v99 countByEnumeratingWithState:&v224 objects:buf count:16];
      }
      while (v100);
    }

    id v104 = [v93 copy];
    long long v222 = 0u;
    long long v223 = 0u;
    long long v220 = 0u;
    long long v221 = 0u;
    id v105 = v104;
    id v106 = [v105 countByEnumeratingWithState:&v220 objects:v236 count:16];
    if (v106)
    {
      uint64_t v107 = *(void *)v221;
      do
      {
        for (k = 0; k != v106; k = (char *)k + 1)
        {
          if (*(void *)v221 != v107) {
            objc_enumerationMutation(v105);
          }
          v109 = *(void **)(*((void *)&v220 + 1) + 8 * (void)k);
          v110 = [v109 identifier];
          unsigned __int8 v111 = [v97 containsObject:v110];

          if ((v111 & 1) == 0) {
            [v93 removeObject:v109];
          }
        }
        id v106 = [v105 countByEnumeratingWithState:&v220 objects:v236 count:16];
      }
      while (v106);
    }

    v61 = v210;
  }
  v112 = [v61 specifierForID:@"FeaturedContentAllowedSwitch"];
  [v112 setObject:&__kCFBooleanTrue forKeyedSubscript:v208];

  if (!v203)
  {
    v113 = objc_msgSend(v210, "mss_specifiersWithIdentifiers:", &off_2B678);
    [v210 removeObjectsInArray:v113];
    goto LABEL_89;
  }
  v113 = [v210 specifierForID:@"iCloudPhotosTitleGroup"];
  [v210 removeObject:v113];
  v114 = objc_msgSend(v210, "mss_specifiersWithIdentifiers:", &off_2B660);
  [v210 removeObjectsInArray:v114];
  v194 = [v210 specifierForID:@"iCloudPhotosAction"];
  v115 = sub_5144(v198);
  [v194 setName:v115];

  if (!sub_534C(v198, v207, 1)) {
    [v210 removeObject:v194];
  }
  v204 = [v210 specifierForID:@"iCloudPhotosItems"];
  uint64_t v116 = [v210 specifierForID:@"cloudPhotosStatus"];
  v230[0] = v204;
  v187 = (void *)v116;
  v230[1] = v116;
  v189 = +[NSArray arrayWithObjects:v230 count:2];
  if (v207)
  {
    if (!v202) {
      goto LABEL_88;
    }
  }
  else
  {
    [v210 removeObjectsInArray:v189];
  }
  [v210 removeObject:v204];
LABEL_88:
  v117 = [v210 specifierForID:@"iCloudPhotosAccountTitleGroup"];
  id v118 = objc_loadWeakRetained(&location);
  sub_6794(v117, v202, v207, v206, a8, 1, v118);

  v119 = [v210 specifierForID:@"cloudPhotosStatusGroup"];
  id v120 = objc_loadWeakRetained(&location);
  sub_458C(v119, v198, v207, v120);

  v121 = [v210 specifierForID:@"iCloudPhotosHeader"];
  [v121 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
  v122 = [v210 specifierForID:@"iCloudPhotosStorage"];
  [v122 setControllerLoadAction:"_cplStorageCellWasTapped:"];
  v123 = [v210 specifierForID:@"iCloudPhotosSwitch"];
  v124 = +[UIDevice currentDevice];
  v125 = [v124 model];
  v126 = [@"ICLOUDPHOTOS_MAINSWITCH_FORMAT_" stringByAppendingString:v125];

  v127 = +[NSBundle bundleForClass:objc_opt_class()];
  v128 = [v127 localizedStringForKey:v126 value:&stru_29018 table:@"Photos"];
  [v123 setName:v128];

LABEL_89:
  if (!a18)
  {
    id v129 = v210;
    v130 = PLUIGetLog();
    if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v131 = objc_opt_class();
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v131;
      _os_log_impl(&dword_0, v130, OS_LOG_TYPE_DEFAULT, "<%@> Hiding image modulation specifiers", (uint8_t *)buf, 0xCu);
    }

    *(void *)&buf[0] = @"ImageModulationGroup";
    *((void *)&buf[0] + 1) = @"ImageModulationSwitch";
    v132 = +[NSArray arrayWithObjects:buf count:2];
    v133 = objc_msgSend(v129, "mss_specifiersWithIdentifiers:", v132);
    [v129 removeObjectsInArray:v133];
  }
  v134 = +[UIDevice currentDevice];
  unint64_t v135 = (unint64_t)[v134 userInterfaceIdiom];

  if ((v135 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v136 = [v210 specifierForID:@"PhotosHiddenAlbumGroup"];
    v137 = +[NSBundle bundleForClass:objc_opt_class()];
    v138 = [v137 localizedStringForKey:@"HIDDEN_ALBUM_GROUP_FOOTER_DESCRIPTION_IPAD" value:&stru_29018 table:@"Photos"];

    [v136 setProperty:v138 forKey:v190];
  }
  v139 = [v210 specifierForID:@"PhotosHiddenAlbumSwitch"];
  [v139 setObject:&__kCFBooleanTrue forKeyedSubscript:v208];
  v140 = +[PXContentPrivacySettings sharedInstance];
  v141 = (char *)[v140 simulationMode];

  if (v141 == (unsigned char *)&dword_0 + 2)
  {
    v142 = objc_msgSend(v210, "mss_specifiersWithIdentifiers:", &off_2B690);
    [v210 removeObjectsInArray:v142];
  }
  else
  {
    v143 = v210;
    switch(a21)
    {
      case 0:
      case 1:
      case 2:
        v144 = PLContentPrivacyUIGetLog();
        if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf[0]) = 134217984;
          *(void *)((char *)buf + 4) = a21;
          _os_log_impl(&dword_0, v144, OS_LOG_TYPE_ERROR, "Settings: currentAuthenticationType is NEITHER Face ID or Touch ID (it's %tu). Falling back to showing 'Passcode' text.", (uint8_t *)buf, 0xCu);
        }

        v145 = +[NSBundle bundleForClass:objc_opt_class()];
        v142 = [v145 localizedStringForKey:@"CONTENT_PRIVACY_SWITCH_PASSCODE" value:&stru_29018 table:@"Photos"];

        v146 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v147 = [v146 localizedStringForKey:@"CONTENT_PRIVACY_GROUP_FOOTER_DESCRIPTION_PASSCODE" value:&stru_29018 table:@"Photos"];
        goto LABEL_106;
      case 3:
        v149 = +[NSBundle bundleForClass:objc_opt_class()];
        v142 = [v149 localizedStringForKey:@"CONTENT_PRIVACY_SWITCH_TOUCHID" value:&stru_29018 table:@"Photos"];

        v146 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v147 = [v146 localizedStringForKey:@"CONTENT_PRIVACY_GROUP_FOOTER_DESCRIPTION_TOUCHID" value:&stru_29018 table:@"Photos"];
        goto LABEL_106;
      case 4:
        v150 = +[NSBundle bundleForClass:objc_opt_class()];
        v142 = [v150 localizedStringForKey:@"CONTENT_PRIVACY_SWITCH_FACEID" value:&stru_29018 table:@"Photos"];

        v146 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v147 = [v146 localizedStringForKey:@"CONTENT_PRIVACY_GROUP_FOOTER_DESCRIPTION_FACEID" value:&stru_29018 table:@"Photos"];
        goto LABEL_106;
      case 5:
        v151 = +[NSBundle bundleForClass:objc_opt_class()];
        v142 = [v151 localizedStringForKey:@"CONTENT_PRIVACY_SWITCH_OPTIC" value:&stru_29018 table:@"Photos"];

        v146 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v147 = [v146 localizedStringForKey:@"CONTENT_PRIVACY_GROUP_FOOTER_DESCRIPTION_OPTIC" value:&stru_29018 table:@"Photos"];
        goto LABEL_106;
      case 6:
        v152 = +[NSBundle bundleForClass:objc_opt_class()];
        v142 = [v152 localizedStringForKey:@"CONTENT_PRIVACY_SWITCH_COMPANION" value:&stru_29018 table:@"Photos"];

        v146 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v147 = [v146 localizedStringForKey:@"CONTENT_PRIVACY_GROUP_FOOTER_DESCRIPTION_COMPANION" value:&stru_29018 table:@"Photos"];
LABEL_106:
        v148 = (void *)v147;

        v143 = v210;
        break;
      default:
        v142 = 0;
        v148 = 0;
        break;
    }
    v153 = [v143 specifierForID:@"PhotosContentPrivacySwitch"];
    [v153 setName:v142];
    [v153 setObject:&__kCFBooleanTrue forKeyedSubscript:v208];
    v154 = [v143 specifierForID:@"PhotosContentPrivacyGroup"];
    [v154 setProperty:v148 forKey:v190];
    if (a21 == 1)
    {
      v155 = PLContentPrivacyUIGetLog();
      if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf[0]) = 134217984;
        *(void *)((char *)buf + 4) = 1;
        _os_log_impl(&dword_0, v155, OS_LOG_TYPE_ERROR, "Settings: currentAuthenticationType is NEITHER Face ID or Touch ID (it's %lu). Setting the privacy switch to OFF, regardless of preference.", (uint8_t *)buf, 0xCu);
      }

      [v153 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
    }
  }
  v156 = [v210 specifierForID:@"iCloudPause"];
  v157 = +[NSBundle bundleForClass:objc_opt_class()];
  v158 = SFLocalizableWAPIStringKeyForKey();
  v159 = [v157 localizedStringForKey:v158 value:&stru_29018 table:@"Photos"];
  [v156 setName:v159];

  if (a22 && a19)
  {
    v160 = v210;
    if (!v192)
    {
      v181 = +[NSAssertionHandler currentHandler];
      v182 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[SettingsBaseController filterAndConfigureSpecifiers:shownFromAccountSettings:cloudPhotosEnabled:cplKeepOriginals:isCPLInExitMode:cplDaysUntilExit:shouldHideCPL:shouldHideTransferBehaviors:cloudPhotosPaused:canEnableSharedStreams:cplStatus:cplActionPerformer:showPhotosDiagnoseButton:showPhotosRebuildButton:accountModificationAllowed:isOLEDDevice:wantsPhotosAppSpecificSettings:isLocationBeingOverridden:currentAuthenticationType:systemPolicyOptions:bundleIdentifier:transferBehaviorUserPreference:sharedLibraryInvitationSpecifiers:sharedLibrarySettingsSpecifiers:instanceLogInfo:]");
      [v181 handleFailureInFunction:v182 file:@"SettingsBaseController.m" lineNumber:1662 description:@"A bundle identifier must be provided by subclass if a system policy option has been provided"];

      v160 = v210;
    }
    id v161 = [objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:v192];
    v162 = [v161 specifiersForPolicyOptions:a22 force:0];
    v163 = v162;
    if (v196)
    {
      objc_msgSend(v160, "ps_insertObjectsFromArray:afterObject:", v162);
    }
    else
    {
      v164 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [v162 count]);
      [v160 insertObjects:v163 atIndexes:v164];
    }
  }
  id v165 = v210;
  v166 = [v165 specifierForID:@"HighMotionReminderEnabledTabTitle"];
  v167 = [v165 specifierForID:@"HighMotionReminderEnabledSwitch"];
  if (v166) {
    [v165 removeObject:v166];
  }
  if (v167) {
    [v165 removeObject:v167];
  }

  id v168 = v165;
  v169 = [v168 specifierForID:@"AlchemizeButtonGroup"];
  v170 = [v168 specifierForID:@"AlchemizeButtonEnabledSwitch"];
  if (v169) {
    [v168 removeObject:v169];
  }
  if (v170) {
    [v168 removeObject:v170];
  }

  if (a19)
  {
    v171 = objc_msgSend(v168, "mss_specifiersWithIdentifiers:", &off_2B6A8);
  }
  else
  {
    v229[0] = @"PhotosHiddenAlbumGroup";
    v229[1] = @"PhotosHiddenAlbumSwitch";
    v229[2] = @"SharedStreamsTitleGroup";
    v229[3] = @"SharedStreamsSwitch";
    v229[4] = @"PhotosContentPrivacyGroup";
    v229[5] = @"PhotosContentPrivacySwitch";
    v229[6] = @"AutoplayGroup";
    v229[7] = @"VideoAutoplaySwitch";
    v229[8] = @"VideoAutoloopSwitch";
    v229[9] = @"ImageModulationGroup";
    v229[10] = @"ImageModulationSwitch";
    v229[11] = @"MemoriesAndRelatedTabTitleGroup";
    v229[12] = @"ResetBlacklistedMemoryFeatures";
    v229[13] = @"ResetPeopleFeedback";
    v229[14] = @"MEMORIES_HOLIDAY_CALENDAR_EVENTS_SWITCH";
    v229[15] = @"FeaturedContentAllowedTabTitle";
    v229[16] = @"FeaturedContentAllowedSwitch";
    v229[17] = @"EnhancedVisualSearchGroup";
    v229[18] = @"VisualSearchSwitch";
    v172 = +[NSArray arrayWithObjects:v229 count:19];
    v171 = objc_msgSend(v168, "mss_specifiersWithIdentifiers:", v172);
  }
  if (!a20)
  {
    v173 = objc_msgSend(v168, "mss_specifiersWithIdentifiers:", &off_2B6C0);
    uint64_t v174 = [v171 arrayByAddingObjectsFromArray:v173];

    v171 = (void *)v174;
  }
  long long v213 = 0u;
  long long v214 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  id v175 = v171;
  id v176 = [v175 countByEnumeratingWithState:&v211 objects:v228 count:16];
  if (v176)
  {
    uint64_t v177 = *(void *)v212;
    do
    {
      for (m = 0; m != v176; m = (char *)m + 1)
      {
        if (*(void *)v212 != v177) {
          objc_enumerationMutation(v175);
        }
        [v168 removeObject:*(void *)(*((void *)&v211 + 1) + 8 * (void)m)];
      }
      id v176 = [v175 countByEnumeratingWithState:&v211 objects:v228 count:16];
    }
    while (v176);
  }

  id v179 = v168;
  objc_destroyWeak(&location);

  return v179;
}

+ (id)lastCPLSpecifierInSpecifiers:(id)a3 shownFromAccountSettings:(BOOL)a4
{
  if (a4)
  {
    id v4 = objc_msgSend(a3, "mss_specifiersWithIdentifiers:", &off_2B600);
    id v5 = [v4 lastObject];
  }
  else
  {
    id v5 = [a3 specifierForID:@"iCloudPhotosSwitch"];
  }

  return v5;
}

+ (BOOL)shouldOfferHyperionInBuddy
{
  return 1;
}

+ (void)setPhotoStreamsEnabledFromBuddyWorkflow:(id)a3
{
  id v3 = [a3 BOOLValue];

  +[PLPhotoLibrary setPhotoStreamEnabled:v3];
}

+ (void)setPhotoStreamsEnabledFromAccountSettings:(id)a3
{
  id v3 = [a3 BOOLValue];

  +[PLPhotoLibrary setPhotoStreamEnabled:v3];
}

@end