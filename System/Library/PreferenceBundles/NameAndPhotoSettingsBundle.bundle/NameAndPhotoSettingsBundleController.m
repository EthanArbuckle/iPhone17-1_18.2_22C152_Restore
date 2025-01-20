@interface NameAndPhotoSettingsBundleController
- (CNSharedProfileOnboardingController)onboardingController;
- (PSSpecifier)groupSpecifier;
- (PSSpecifier)mainSpecifier;
- (id)sharedNameAndPhotoAudience:(id)a3;
- (id)sharedNameAndPhotoSharingFooterText;
- (id)specifiersWithSpecifier:(id)a3;
- (void)onboardingControllerDidDismissSettings:(id)a3;
- (void)reloadSpecifiers;
- (void)setGroupSpecifier:(id)a3;
- (void)setMainSpecifier:(id)a3;
- (void)setOnboardingController:(id)a3;
- (void)showSharedNameAndPhotoSettings;
@end

@implementation NameAndPhotoSettingsBundleController

- (id)specifiersWithSpecifier:(id)a3
{
  v4 = +[NSMutableArray array];
  v5 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:0 edit:0];
  [v5 setIdentifier:@"SHARED_NAME_AND_PHOTO_SETTINGS_GROUP"];
  v6 = [(NameAndPhotoSettingsBundleController *)self sharedNameAndPhotoSharingFooterText];
  [v5 setProperty:v6 forKey:PSFooterTextGroupKey];

  groupSpecifier = self->_groupSpecifier;
  self->_groupSpecifier = (PSSpecifier *)v5;
  id v8 = v5;

  [v4 addObject:v8];
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"NAME_AND_PHOTO_SHARING_TITLE" value:&stru_4148 table:@"NameAndPhotoSettings"];
  v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:"sharedNameAndPhotoAudience:" detail:0 cell:2 edit:0];

  [v11 setButtonAction:"showSharedNameAndPhotoSettings"];
  [v11 setIdentifier:@"SHARED_NAME_AND_PHOTO_SETTINGS"];
  v12 = +[NSNumber numberWithBool:1];
  [v11 setProperty:v12 forKey:PSEnabledKey];

  mainSpecifier = self->_mainSpecifier;
  self->_mainSpecifier = (PSSpecifier *)v11;
  id v14 = v11;

  [v4 addObject:v14];

  return v4;
}

- (void)reloadSpecifiers
{
  v3 = [(NameAndPhotoSettingsBundleController *)self groupSpecifier];
  v4 = [(NameAndPhotoSettingsBundleController *)self sharedNameAndPhotoSharingFooterText];
  [v3 setProperty:v4 forKey:PSFooterTextGroupKey];

  v5 = (id *)&self->PSBundleController_opaque[OBJC_IVAR___PSBundleController__parent];
  id WeakRetained = objc_loadWeakRetained(v5);
  v7 = [(NameAndPhotoSettingsBundleController *)self groupSpecifier];
  [WeakRetained reloadSpecifier:v7 animated:0];

  id v9 = objc_loadWeakRetained(v5);
  id v8 = [(NameAndPhotoSettingsBundleController *)self mainSpecifier];
  [v9 reloadSpecifier:v8 animated:0];
}

- (void)showSharedNameAndPhotoSettings
{
  id v5 = objc_alloc_init((Class)CNContactStore);
  id v3 = [objc_alloc((Class)CNSharedProfileOnboardingController) initWithContactStore:v5];
  [v3 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSBundleController_opaque[OBJC_IVAR___PSBundleController__parent]);
  [v3 startOnboardingOrEditForMode:1 fromViewController:WeakRetained];

  [(NameAndPhotoSettingsBundleController *)self setOnboardingController:v3];
}

- (id)sharedNameAndPhotoSharingFooterText
{
  v2 = +[CNEnvironment currentEnvironment];
  id v3 = [v2 nicknameProvider];
  unsigned __int8 v4 = [v3 isNicknameSharingEnabled];

  if ((v4 & 1) == 0)
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = v8;
    CFStringRef v10 = @"NAME_AND_PHOTO_SHARING_NOT_SHARING_FOOTER";
    goto LABEL_7;
  }
  id v5 = +[CNEnvironment currentEnvironment];
  v6 = [v5 nicknameProvider];
  v7 = (char *)[v6 sharingAudience];

  if (v7 == (unsigned char *)&dword_0 + 1)
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = v8;
    CFStringRef v10 = @"NAME_AND_PHOTO_SHARING_CONTACTS_ONLY_FOOTER";
    goto LABEL_7;
  }
  if (v7 == (unsigned char *)&dword_0 + 2)
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = v8;
    CFStringRef v10 = @"NAME_AND_PHOTO_SHARING_ALWAYS_ASK_FOOTER";
LABEL_7:
    v11 = [v8 localizedStringForKey:v10 value:&stru_4148 table:@"NameAndPhotoSettings"];

    goto LABEL_8;
  }
  v11 = &stru_4148;
LABEL_8:

  return v11;
}

- (id)sharedNameAndPhotoAudience:(id)a3
{
  id v3 = +[CNEnvironment currentEnvironment];
  unsigned __int8 v4 = [v3 nicknameProvider];
  unsigned __int8 v5 = [v4 isNicknameSharingEnabled];

  if ((v5 & 1) == 0)
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v10 = v9;
    CFStringRef v11 = @"NAME_AND_PHOTO_SHARING_OFF";
    goto LABEL_9;
  }
  v6 = +[CNEnvironment currentEnvironment];
  v7 = [v6 nicknameProvider];
  id v8 = (char *)[v7 sharingAudience];

  if (v8 == (unsigned char *)&dword_0 + 2)
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v10 = v9;
    CFStringRef v11 = @"SHARING_AUDIENCE_ALWAYS_ASK";
    goto LABEL_9;
  }
  if (v8 == (unsigned char *)&dword_0 + 1)
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v10 = v9;
    CFStringRef v11 = @"SHARING_AUDIENCE_CONTACTS_ONLY";
    goto LABEL_9;
  }
  if (!v8)
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    CFStringRef v10 = v9;
    CFStringRef v11 = @"SHARING_AUDIENCE_EVERYONE";
LABEL_9:
    v12 = [v9 localizedStringForKey:v11 value:&stru_4148 table:@"NameAndPhotoSettings"];

    goto LABEL_10;
  }
  v12 = 0;
LABEL_10:

  return v12;
}

- (void)onboardingControllerDidDismissSettings:(id)a3
{
  [(NameAndPhotoSettingsBundleController *)self setOnboardingController:0];

  [(NameAndPhotoSettingsBundleController *)self reloadSpecifiers];
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (PSSpecifier)mainSpecifier
{
  return self->_mainSpecifier;
}

- (void)setMainSpecifier:(id)a3
{
}

- (CNSharedProfileOnboardingController)onboardingController
{
  return self->_onboardingController;
}

- (void)setOnboardingController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_storeStrong((id *)&self->_mainSpecifier, 0);

  objc_storeStrong((id *)&self->_groupSpecifier, 0);
}

@end