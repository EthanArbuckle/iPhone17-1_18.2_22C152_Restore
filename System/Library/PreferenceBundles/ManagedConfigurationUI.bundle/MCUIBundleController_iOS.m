@interface MCUIBundleController_iOS
- (BOOL)isOnsiteProfileInstallation;
- (MCUIBundleController_iOS)initWithParentListController:(id)a3 properties:(id)a4;
- (id)_createOnsiteProfileInstallationSpecifier;
- (id)specifiersWithSpecifier:(id)a3;
- (void)_presentInstallProfileVC;
- (void)setIsOnsiteProfileInstallation:(BOOL)a3;
@end

@implementation MCUIBundleController_iOS

- (MCUIBundleController_iOS)initWithParentListController:(id)a3 properties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 objectForKeyedSubscript:PSIDKey];
  unsigned int v9 = [v8 isEqualToString:kMCSettingsURLOnsiteProfileInstallationComponent];

  if (v9)
  {
    v10 = objc_opt_new();
    v15.receiver = self;
    v15.super_class = (Class)MCUIBundleController_iOS;
    v11 = [(MCUIBundleController_iOS *)&v15 initWithParentListController:v6 dataManager:v10];

    if (v11) {
      v11->_isOnsiteProfileInstallation = 1;
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)MCUIBundleController_iOS;
    v11 = [(MCUIBundleController_iOS *)&v14 initWithParentListController:v6 properties:v7];
  }
  v12 = v11;

  return v12;
}

- (id)specifiersWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [(MCUIBundleController_iOS *)self dataManager];
  unsigned __int8 v6 = [v5 isDeviceManagementHidden];

  if (v6)
  {
    id v7 = 0;
  }
  else if ([(MCUIBundleController_iOS *)self isOnsiteProfileInstallation])
  {
    v8 = [(MCUIBundleController_iOS *)self _createOnsiteProfileInstallationSpecifier];
    v11 = v8;
    id v7 = +[NSArray arrayWithObjects:&v11 count:1];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MCUIBundleController_iOS;
    id v7 = [(MCUIBundleController_iOS *)&v10 specifiersWithSpecifier:v4];
  }

  return v7;
}

- (id)_createOnsiteProfileInstallationSpecifier
{
  v2 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v2 setButtonAction:"_presentInstallProfileVC"];
  [v2 setProperty:kMCSettingsURLOnsiteProfileInstallationComponent forKey:PSIDKey];
  [v2 setProperty:&__kCFBooleanTrue forKey:@"invisible"];

  return v2;
}

- (void)_presentInstallProfileVC
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->MCUIBundleController_opaque[OBJC_IVAR___PSBundleController__parent]);

  if (WeakRetained)
  {
    id v4 = +[MCProfileConnection sharedConnection];
    v5 = objc_msgSend(v4, "peekProfileDataFromPurgatoryForDeviceType:", +[MCProfile thisDeviceType](MCProfile, "thisDeviceType"));

    if (v5)
    {
      id v17 = 0;
      unsigned __int8 v6 = +[MCProfile profileWithData:v5 outError:&v17];
      id v7 = v17;
      if (v7)
      {
        NSLog(@"MCUI iOS bundle controller failed to deserialize profile");
      }
      else
      {
        id v8 = objc_alloc((Class)MCProfileTitlePageViewController);
        id v9 = [objc_alloc((Class)MCProfileTitlePageViewModel) initWithProfile:v6 profileData:v5];
        id v10 = [v8 initWithViewModel:v9];

        id v11 = [objc_alloc((Class)MCUIDismissalAwareNavigationController) initWithRootViewController:v10];
        v12 = +[UIDevice currentDevice];
        unsigned int v13 = objc_msgSend(v12, "sf_isiPad");

        if (v13) {
          [v11 setModalPresentationStyle:2];
        }
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_36E8;
        block[3] = &unk_4148;
        block[4] = self;
        id v16 = v11;
        id v14 = v11;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
}

- (BOOL)isOnsiteProfileInstallation
{
  return self->_isOnsiteProfileInstallation;
}

- (void)setIsOnsiteProfileInstallation:(BOOL)a3
{
  self->_isOnsiteProfileInstallation = a3;
}

@end