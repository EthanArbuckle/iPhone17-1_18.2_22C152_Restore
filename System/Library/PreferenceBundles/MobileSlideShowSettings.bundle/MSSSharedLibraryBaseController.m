@interface MSSSharedLibraryBaseController
+ (NSString)buttonIdentifier;
+ (void)initialize;
- (BOOL)canEnableSharedLibrary;
- (BOOL)cloudPhotosEnabled;
- (BOOL)cloudPhotosInExitMode;
- (MSSSharedLibraryBaseController)init;
- (MSSSharedLibraryBaseController)initWithSettingsBaseController:(id)a3;
- (NSArray)invitationSpecifiers;
- (NSArray)settingsSpecifiers;
- (PXCPLUIStatus)cloudPhotosStatus;
- (PXSharedLibraryStatusProvider)statusProvider;
- (SettingsBaseController)settingsBaseController;
- (id)_sharedLibraryButtonSubtitle;
- (id)_sharedLibraryButtonTitle;
- (void)_popToSettingsBaseControllerIfNeeded;
- (void)_updateSharedLibrarySpecifiers;
- (void)didTapLearnMoreLink:(id)a3;
- (void)didTapSharedLibraryButton:(id)a3;
- (void)didTapSharedLibraryInvitation:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setCanEnableSharedLibrary:(BOOL)a3;
- (void)setCloudPhotosEnabled:(BOOL)a3;
- (void)setCloudPhotosInExitMode:(BOOL)a3;
- (void)setCloudPhotosStatus:(id)a3;
- (void)setSettingsBaseController:(id)a3;
@end

@implementation MSSSharedLibraryBaseController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_destroyWeak((id *)&self->_settingsBaseController);
  objc_storeStrong((id *)&self->_cloudPhotosStatus, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_learnMoreTitle, 0);
  objc_storeStrong((id *)&self->_settingsSpecifiers, 0);

  objc_storeStrong((id *)&self->_invitationSpecifiers, 0);
}

- (PXSharedLibraryStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (void)setSettingsBaseController:(id)a3
{
}

- (SettingsBaseController)settingsBaseController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsBaseController);

  return (SettingsBaseController *)WeakRetained;
}

- (PXCPLUIStatus)cloudPhotosStatus
{
  return self->_cloudPhotosStatus;
}

- (void)setCloudPhotosInExitMode:(BOOL)a3
{
  self->_cloudPhotosInExitMode = a3;
}

- (BOOL)cloudPhotosInExitMode
{
  return self->_cloudPhotosInExitMode;
}

- (BOOL)cloudPhotosEnabled
{
  return self->_cloudPhotosEnabled;
}

- (BOOL)canEnableSharedLibrary
{
  return self->_canEnableSharedLibrary;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if (off_2F478 == a5)
  {
    [(MSSSharedLibraryBaseController *)self _updateSharedLibrarySpecifiers];
    [(MSSSharedLibraryBaseController *)self _popToSettingsBaseControllerIfNeeded];
  }
}

- (void)didTapLearnMoreLink:(id)a3
{
  if (self->_learnMoreURL)
  {
    v4 = +[LSApplicationWorkspace defaultWorkspace];
    learnMoreURL = self->_learnMoreURL;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_12C04;
    v6[3] = &unk_28DF8;
    v6[4] = self;
    [v4 openURL:learnMoreURL configuration:0 completionHandler:v6];
  }
}

- (void)didTapSharedLibraryButton:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsBaseController);
  v5 = [WeakRetained navigationController];
  v6 = +[PXViewControllerPresenter defaultPresenterWithViewController:v5];

  v7 = +[APApplication applicationWithBundleIdentifier:@"com.apple.mobileslideshow"];
  v8 = +[APGuard sharedGuard];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_12DE4;
  v10[3] = &unk_28DD0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 authenticateForSubject:v7 completion:v10];
}

- (void)didTapSharedLibraryInvitation:(id)a3
{
  id v8 = [(MSSSharedLibraryBaseController *)self statusProvider];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsBaseController);
  v5 = [WeakRetained navigationController];
  v6 = +[PXViewControllerPresenter defaultPresenterWithViewController:v5];

  v7 = [v8 invitation];
  PXSharedLibraryViewInvitation();
}

- (void)setCloudPhotosStatus:(id)a3
{
  id v8 = (NSArray *)a3;
  v5 = self->_cloudPhotosStatus;
  settingsSpecifiers = v8;
  if (v5 != (PXCPLUIStatus *)v8)
  {
    unsigned __int8 v7 = [(PXCPLUIStatus *)v5 isEqual:v8];

    if (v7) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_cloudPhotosStatus, a3);
    settingsSpecifiers = self->_settingsSpecifiers;
    self->_settingsSpecifiers = 0;
  }

LABEL_5:
}

- (void)setCloudPhotosEnabled:(BOOL)a3
{
  if (self->_cloudPhotosEnabled != a3)
  {
    self->_cloudPhotosEnabled = a3;
    self->_settingsSpecifiers = 0;
    _objc_release_x1();
  }
}

- (void)setCanEnableSharedLibrary:(BOOL)a3
{
  if (self->_canEnableSharedLibrary != a3)
  {
    self->_canEnableSharedLibrary = a3;
    self->_settingsSpecifiers = 0;
    _objc_release_x1();
  }
}

- (NSArray)settingsSpecifiers
{
  unsigned int v3 = [(MSSSharedLibraryBaseController *)self canEnableSharedLibrary];
  settingsSpecifiers = self->_settingsSpecifiers;
  if (settingsSpecifiers) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    v32 = PXLocalizedSharedLibraryString();
    v6 = +[PSSpecifier groupSpecifierWithID:name:](PSSpecifier, "groupSpecifierWithID:name:", @"SharedLibrarySettingsGroup");
    unsigned __int8 v7 = [(MSSSharedLibraryBaseController *)self _sharedLibraryButtonTitle];
    id v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:"_sharedLibraryButtonSubtitle" detail:0 cell:2 edit:0];

    [v8 setIdentifier:@"SharedLibrarySettingsButton"];
    id v9 = +[UIImage px_imageNamed:@"SharedLibrary-28-Rounded"];
    [v8 setObject:v9 forKeyedSubscript:PSIconImageKey];

    [v8 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
    [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
    v10 = [(MSSSharedLibraryBaseController *)self cloudPhotosStatus];
    if ([(MSSSharedLibraryBaseController *)self cloudPhotosEnabled]) {
      unsigned int v11 = [v10 hasCompletedInitialSync];
    }
    else {
      unsigned int v11 = 0;
    }
    if ([(MSSSharedLibraryBaseController *)self cloudPhotosEnabled]
      && ([v10 hasCompletedInitialSync] & 1) == 0)
    {
      int v30 = 1;
      unsigned int v31 = [v10 isPaused] ^ 1;
    }
    else
    {
      int v30 = 0;
      unsigned int v31 = 1;
    }
    unsigned int v12 = [v10 inResetSync];
    unsigned int v13 = [v10 isRestoringLibrary];
    unsigned int v14 = [(MSSSharedLibraryBaseController *)self cloudPhotosInExitMode];
    v15 = [(MSSSharedLibraryBaseController *)self statusProvider];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_13688;
    v33[3] = &unk_28D80;
    id v16 = v8;
    id v34 = v16;
    char v35 = v11;
    char v36 = v12;
    char v37 = v13;
    char v38 = v14;
    v17 = objc_retainBlock(v33);
    if (PXSharedLibraryShouldDisplaySettings()
      && ((v11 ^ 1 | v12 | v13 | v14) != 1 || PXSharedLibraryLocalModeFeatureEnabled()))
    {
      [v16 setDetailControllerClass:objc_opt_class()];
      ((void (*)(void *, uint64_t))v17[2])(v17, 1);
LABEL_28:
      v39[0] = v6;
      v39[1] = v16;
      v22 = +[NSArray arrayWithObjects:v39 count:2];
      v23 = self->_settingsSpecifiers;
      self->_settingsSpecifiers = v22;

      goto LABEL_29;
    }
    if ([v15 hasPreview])
    {
      [v16 setDetailControllerClass:objc_opt_class()];
      uint64_t CanSetupSharedLibraryOrPreview = PXSharedLibraryCanSetupSharedLibraryOrPreview();
      ((void (*)(void *, uint64_t))v17[2])(v17, CanSetupSharedLibraryOrPreview);
      goto LABEL_28;
    }
    [v16 setControllerLoadAction:"didTapSharedLibraryButton:"];
    uint64_t v19 = PXSharedLibraryCanSetupSharedLibraryOrPreview();
    ((void (*)(void *, uint64_t))v17[2])(v17, v19);
    if (v13
      || ((![(MSSSharedLibraryBaseController *)self cloudPhotosEnabled] | v31) & 1) == 0
      || [(MSSSharedLibraryBaseController *)self cloudPhotosEnabled] && v30 | v12
      || ([(MSSSharedLibraryBaseController *)self cloudPhotosEnabled] & v14) == 1)
    {
      uint64_t v20 = PXLocalizedSharedLibraryString();
    }
    else
    {
      if ([(MSSSharedLibraryBaseController *)self cloudPhotosEnabled])
      {
        v26 = [v15 exiting];

        if (!v26)
        {
          if (!self->_learnMoreTitle || !self->_learnMoreURL) {
            goto LABEL_28;
          }
          v27 = PXSharedLibrarySettingsDescription();
          v21 = +[NSString stringWithFormat:@"%@ %@", v27, self->_learnMoreTitle];

          learnMoreTitle = self->_learnMoreTitle;
          v29 = NSStringFromSelector("didTapLearnMoreLink:");
          SettingsBaseConfigureSpecifierFooterWithHyperlink(v6, v21, learnMoreTitle, v29, self);

          goto LABEL_27;
        }
      }
      uint64_t v20 = PXSharedLibrarySettingsDescription();
    }
    v21 = (void *)v20;
    [v6 setObject:v20 forKeyedSubscript:PSFooterTextGroupKey];
LABEL_27:

    goto LABEL_28;
  }
  if (!settingsSpecifiers) {
    self->_settingsSpecifiers = (NSArray *)&__NSArray0__struct;
  }
LABEL_29:
  v24 = self->_settingsSpecifiers;

  return v24;
}

- (NSArray)invitationSpecifiers
{
  invitationSpecifiers = self->_invitationSpecifiers;
  if (!invitationSpecifiers)
  {
    v4 = [(MSSSharedLibraryBaseController *)self statusProvider];
    if (PXSharedLibraryShouldDisplayInvitation())
    {
      BOOL v5 = +[PSSpecifier groupSpecifierWithID:@"SharedLibrarySettingsGroup"];
      v6 = +[PSSpecifier preferenceSpecifierNamed:&stru_29018 target:self set:0 get:0 detail:0 cell:2 edit:0];
      [v6 setControllerLoadAction:"didTapSharedLibraryInvitation:"];
      [v6 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
      unsigned __int8 v7 = [v4 invitation];
      id v8 = [v7 owner];
      [v6 setUserInfo:v8];

      v13[0] = v5;
      v13[1] = v6;
      id v9 = +[NSArray arrayWithObjects:v13 count:2];
      v10 = self->_invitationSpecifiers;
      self->_invitationSpecifiers = v9;
    }
    else
    {
      unsigned int v11 = self->_invitationSpecifiers;
      self->_invitationSpecifiers = (NSArray *)&__NSArray0__struct;
    }
    invitationSpecifiers = self->_invitationSpecifiers;
  }

  return invitationSpecifiers;
}

- (MSSSharedLibraryBaseController)initWithSettingsBaseController:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MSSSharedLibraryBaseController;
  BOOL v5 = [(MSSSharedLibraryBaseController *)&v18 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_settingsBaseController, v4);
    id v8 = [v4 systemPhotoLibrary];
    uint64_t v9 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v8];
    statusProvider = v6->_statusProvider;
    v6->_statusProvider = (PXSharedLibraryStatusProvider *)v9;

    [(PXSharedLibraryStatusProvider *)v6->_statusProvider registerChangeObserver:v6 context:off_2F478];
    unsigned int v11 = PXSharedLibraryLearnMoreString();
    id v12 = [v11 length];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_13A5C;
    v15[3] = &unk_28D58;
    id v16 = v6;
    id v17 = v11;
    id v13 = v11;
    objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", NSLinkAttributeName, 0, v12, 0, v15);
  }
  return v6;
}

- (MSSSharedLibraryBaseController)init
{
  id v4 = +[NSAssertionHandler currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MSSSharedLibraryBaseController.m", 142, @"%s is not available as initializer", "-[MSSSharedLibraryBaseController init]");

  abort();
}

- (id)_sharedLibraryButtonSubtitle
{
  unsigned int v3 = [(MSSSharedLibraryBaseController *)self statusProvider];
  id v4 = [v3 exiting];
  if (v4)
  {

LABEL_6:
    v6 = &stru_29018;
    goto LABEL_7;
  }
  if (![(MSSSharedLibraryBaseController *)self cloudPhotosEnabled]) {
    goto LABEL_6;
  }
  if ([v3 hasSharedLibrary])
  {
    BOOL v5 = [v3 sharedLibrary];
    PXSharedLibrarySettingsSubtitle();
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    [v3 hasPreview];
    PXLocalizedSharedLibraryString();
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:

  return v6;
}

- (id)_sharedLibraryButtonTitle
{
  v2 = [(MSSSharedLibraryBaseController *)self statusProvider];
  unsigned int v3 = [v2 exiting];

  if (v3) {
    [v3 isOwned];
  }
  id v4 = PXLocalizedSharedLibraryString();

  return v4;
}

- (void)_popToSettingsBaseControllerIfNeeded
{
  unsigned int v3 = [(MSSSharedLibraryBaseController *)self statusProvider];
  id v4 = [v3 exiting];

  if (v4)
  {
    BOOL v5 = [(MSSSharedLibraryBaseController *)self settingsBaseController];
    v6 = [v5 navigationController];
    id v7 = [v6 viewControllers];
    unsigned int v8 = [v7 containsObject:v5];

    if (v8)
    {
      uint64_t v9 = PLSharedLibraryGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v23 = 138543362;
        uint64_t v24 = objc_opt_class();
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEBUG, "%{public}@: _popToSettingsBaseControllerIfNeeded: Use settingsBaseController", (uint8_t *)&v23, 0xCu);
      }

      v10 = v5;
    }
    else
    {
      unsigned int v11 = [v6 viewControllers];
      id v12 = [v5 parentViewController];
      unsigned int v13 = [v11 containsObject:v12];

      unsigned int v14 = PLSharedLibraryGetLog();
      v15 = v14;
      if (!v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v23 = 138543362;
          uint64_t v24 = objc_opt_class();
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "%{public}@: Need to pop to base controller but didn't find it or its parent in the nav stack", (uint8_t *)&v23, 0xCu);
        }

        id v16 = 0;
LABEL_16:
        id v17 = [v6 topViewController];

        if (v17 == v16)
        {
          uint64_t v19 = PLSharedLibraryGetLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v22 = objc_opt_class();
            int v23 = 138543362;
            uint64_t v24 = v22;
            v21 = "%{public}@: Requested to pop to settingsControllerInNavigation, but base controller is already on top "
                  "of the nav stack.";
            goto LABEL_21;
          }
        }
        else
        {
          id v18 = [v6 popToViewController:v16 animated:1];
          uint64_t v19 = PLSharedLibraryGetLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = objc_opt_class();
            int v23 = 138543362;
            uint64_t v24 = v20;
            v21 = "%{public}@: Did pop to base controller";
LABEL_21:
            _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v23, 0xCu);
          }
        }

        goto LABEL_23;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int v23 = 138543362;
        uint64_t v24 = objc_opt_class();
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEBUG, "%{public}@: _popToSettingsBaseControllerIfNeeded: Use settingsBaseController's parent", (uint8_t *)&v23, 0xCu);
      }

      v10 = [v5 parentViewController];
    }
    id v16 = v10;
    goto LABEL_16;
  }
  BOOL v5 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 138543362;
    uint64_t v24 = objc_opt_class();
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%{public}@: No need to pop to settingsControllerInNavigation, library not exiting", (uint8_t *)&v23, 0xCu);
  }
LABEL_23:
}

- (void)_updateSharedLibrarySpecifiers
{
  invitationSpecifiers = self->_invitationSpecifiers;
  self->_invitationSpecifiers = 0;

  settingsSpecifiers = self->_settingsSpecifiers;
  self->_settingsSpecifiers = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsBaseController);
  [WeakRetained reloadSpecifiers];
}

+ (void)initialize
{
  if (qword_2F6F0 != -1) {
    dispatch_once(&qword_2F6F0, &stru_28D30);
  }
}

+ (NSString)buttonIdentifier
{
  return (NSString *)@"SharedLibrarySettingsButton";
}

@end