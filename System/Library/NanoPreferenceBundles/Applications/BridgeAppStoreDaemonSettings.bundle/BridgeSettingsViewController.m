@interface BridgeSettingsViewController
- (BridgeSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_automaticDownloadsEnabled;
- (id)_automaticUpdatesEnabled;
- (id)specifiers;
- (void)_automaticDownloadsChanged:(id)a3;
- (void)_automaticUpdatesChanged:(id)a3;
- (void)_reloadForExternalChange;
- (void)accountPageViewController:(id)a3 financeInterruptionResolved:(BOOL)a4;
- (void)accountPageViewControllerDidFinish:(id)a3;
- (void)actionTapped:(id)a3;
- (void)dealloc;
- (void)loadView;
@end

@implementation BridgeSettingsViewController

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)BridgeSettingsViewController;
  [(BridgeSettingsViewController *)&v4 loadView];
  v3 = ASDLocalizedString(@"SETTINGS_TITLE");
  [(BridgeSettingsViewController *)self setTitle:v3];
}

- (BridgeSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BridgeSettingsViewController;
  v8 = [(BridgeSettingsViewController *)&v18 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v8 selector:"_reloadForExternalChange" name:@"WatchSettingsManagerSettingsChangedExternallyNotification" object:0];

    v10 = (AMSDeviceMessenger *)objc_alloc_init((Class)AMSDeviceMessenger);
    bridgeMessenger = v8->_bridgeMessenger;
    v8->_bridgeMessenger = v10;

    objc_initWeak(&location, v8);
    id v12 = objc_alloc_init((Class)AMSDeviceMessengerFilter);
    [v12 setDeviceType:1];
    v13 = v8->_bridgeMessenger;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_5BF0;
    v15[3] = &unk_C498;
    objc_copyWeak(&v16, &location);
    [(AMSDeviceMessenger *)v13 addUpdateHandlerForType:1 filter:v12 handler:v15];
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }

  return v8;
}

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v51 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = +[PSSpecifier groupSpecifierWithName:0];
    id v6 = ASDLocalizedString(@"AUTO_DOWNLOADS_EXPLANATION");
    uint64_t v7 = PSFooterTextGroupKey;
    [v5 setProperty:v6 forKey:PSFooterTextGroupKey];

    v50 = v5;
    [v4 addObject:v5];
    v8 = ASDLocalizedString(@"AUTO_DOWNLOADS");
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"_automaticDownloadsChanged:" get:"_automaticDownloadsEnabled" detail:0 cell:6 edit:0];

    [v9 setIdentifier:@"automaticDownloadSpecifier"];
    v49 = v9;
    [v4 addObject:v9];
    v10 = objc_opt_new();
    v11 = +[MCProfileConnection sharedConnection];
    uint64_t v12 = MCFeatureAppInstallationAllowed;
    v13 = sub_7A70();
    LODWORD(v12) = [v11 effectiveBoolValueForWatchSetting:v12 pairedDevice:v13];

    if (v12 != 2)
    {
      v14 = +[PSSpecifier groupSpecifierWithName:0];
      v15 = ASDLocalizedString(@"AUTO_UPDATES_EXPLANATION");
      [v14 setProperty:v15 forKey:v7];

      [v10 addObject:v14];
      id v16 = ASDLocalizedString(@"AUTO_UPDATES");
      v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:"_automaticUpdatesChanged:" get:"_automaticUpdatesEnabled" detail:0 cell:6 edit:0];

      [v10 addObject:v17];
    }

    if ([v10 count]) {
      [v4 addObjectsFromArray:v10];
    }
    v60 = objc_opt_new();
    id v18 = objc_alloc_init((Class)AMSDeviceMessengerFilter);
    [v18 setDeviceType:1];
    v48 = v18;
    v19 = [(AMSDeviceMessenger *)self->_bridgeMessenger dialogsWithFilter:v18];
    id v70 = 0;
    v20 = [v19 resultWithError:&v70];
    id v21 = v70;

    if (v21)
    {
      v22 = ASDLogHandleForCategory(14);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v46 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v73 = v46;
        __int16 v74 = 2114;
        id v75 = v21;
        _os_log_error_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "[%{public}@]: Error fetching the bridge dialogs: %{public}@", buf, 0x16u);
      }
    }
    v47 = v21;
    v61 = self;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = v20;
    v23 = v60;
    id v55 = [obj countByEnumeratingWithState:&v66 objects:buf count:16];
    if (v55)
    {
      uint64_t v54 = *(void *)v67;
      uint64_t v53 = PSCellClassKey;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v67 != v54) {
            objc_enumerationMutation(obj);
          }
          uint64_t v58 = v24;
          v25 = *(void **)(*((void *)&v66 + 1) + 8 * v24);
          v26 = [v25 identifier];
          uint64_t v27 = +[PSSpecifier groupSpecifierWithID:v26];

          v57 = (void *)v27;
          [v23 addObject:v27];
          v28 = +[PSSpecifier preferenceSpecifierNamed:&stru_CA38 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
          v29 = [v25 identifier];
          v30 = +[NSString stringWithFormat:@"%@-titleCell", v29];
          [v28 setIdentifier:v30];

          [v28 setProperty:objc_opt_class() forKey:v53];
          [v28 setProperty:v25 forKey:@"repairDialog"];
          v56 = v28;
          [v23 addObject:v28];
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v59 = [v25 buttonActions];
          id v31 = [v59 countByEnumeratingWithState:&v62 objects:v71 count:16];
          if (v31)
          {
            id v32 = v31;
            uint64_t v33 = *(void *)v63;
            do
            {
              for (i = 0; i != v32; i = (char *)i + 1)
              {
                if (*(void *)v63 != v33) {
                  objc_enumerationMutation(v59);
                }
                v35 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                v36 = [v35 title];
                v37 = [v25 identifier];
                unsigned int v38 = [v37 isEqualToString:@"ASDAuthenticateActiveAccount"];

                if (v38)
                {
                  if ([v35 style] == (char *)&dword_0 + 2) {
                    v39 = @"CANCEL";
                  }
                  else {
                    v39 = @"PROMPT_FOR_ACCOUNT_SIGN_IN";
                  }
                  uint64_t v40 = ASDLocalizedString(v39);

                  v36 = (void *)v40;
                }
                v41 = +[PSSpecifier preferenceSpecifierNamed:v36 target:v61 set:0 get:0 detail:0 cell:13 edit:0];
                v42 = [v35 identifier];
                [v41 setIdentifier:v42];

                [v41 setProperty:v35 forKey:@"repairAction"];
                [v41 setProperty:v25 forKey:@"repairDialog"];
                [v41 setButtonAction:"actionTapped:"];
                v23 = v60;
                [v60 addObject:v41];
              }
              id v32 = [v59 countByEnumeratingWithState:&v62 objects:v71 count:16];
            }
            while (v32);
          }

          uint64_t v24 = v58 + 1;
        }
        while ((id)(v58 + 1) != v55);
        id v55 = [obj countByEnumeratingWithState:&v66 objects:buf count:16];
      }
      while (v55);
    }

    if ([v23 count]) {
      [v4 addObjectsFromArray:v23];
    }
    id v43 = [v4 copy];
    v44 = *(void **)&v61->PSListController_opaque[v51];
    *(void *)&v61->PSListController_opaque[v51] = v43;

    v3 = *(void **)&v61->PSListController_opaque[v51];
  }

  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BridgeSettingsViewController;
  [(BridgeSettingsViewController *)&v4 dealloc];
}

- (void)accountPageViewControllerDidFinish:(id)a3
{
}

- (void)accountPageViewController:(id)a3 financeInterruptionResolved:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = ASDLogHandleForCategory(14);
  v8 = v7;
  if (!v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      uint64_t v13 = objc_opt_class();
      _os_log_error_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "[%{public}@]: account view controller not resolved", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    uint64_t v13 = objc_opt_class();
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: account view controller resolved", (uint8_t *)&v12, 0xCu);
  }

  activeDialogRequest = self->_activeDialogRequest;
  if (!activeDialogRequest)
  {
    v8 = ASDLogHandleForCategory(14);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_error_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "[%{public}@]: account view controller resolved but there was no active dialog request", (uint8_t *)&v12, 0xCu);
    }
LABEL_11:

    goto LABEL_12;
  }
  sub_65BC((id *)self, activeDialogRequest);
LABEL_12:
  v10 = self->_activeDialogRequest;
  self->_activeDialogRequest = 0;

  [(BridgeSettingsViewController *)self accountPageViewControllerDidFinish:v6];
}

- (void)actionTapped:(id)a3
{
  id v37 = a3;
  unsigned int v38 = [v37 propertyForKey:@"repairAction"];
  v36 = [v37 propertyForKey:@"repairDialog"];
  v3 = v36;
  if (!v38) {
    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_41;
  }
  if (!v36) {
    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_41;
  }
  if ([v38 style] == (char *)&dword_0 + 2)
  {
    sub_65BC((id *)self, v36);
    goto LABEL_41;
  }
  BOOL v4 = [v38 deepLink];

  if (!v4)
  {
    v23 = [v36 identifier];
    unsigned int v24 = [v23 isEqualToString:@"ASDAuthenticateActiveAccount"];

    if (v24)
    {
      objc_initWeak(from, self);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_71B4;
      v41[3] = &unk_C4E8;
      objc_copyWeak(&v43, from);
      id v42 = v36;
      sub_720C((uint64_t)self, v41);

      objc_destroyWeak(&v43);
      objc_destroyWeak(from);
    }
    else
    {
      uint64_t v27 = ASDLogHandleForCategory(14);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(from[0]) = 138543362;
        *(id *)((char *)from + 4) = (id)objc_opt_class();
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Action tapped for dialog but there is no deep link and it isn't the cancel button", (uint8_t *)from, 0xCu);
      }
    }
    goto LABEL_40;
  }
  objc_initWeak(&location, self);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v45 = sub_6E78;
  uint64_t v46 = &unk_C4C0;
  objc_copyWeak(&v49, &location);
  id v5 = v38;
  id v47 = v5;
  id v48 = v36;
  id v34 = v5;
  id v32 = v44;
  if (!self) {
    goto LABEL_39;
  }
  id v6 = [v34 deepLink];
  uint64_t v33 = +[NSURLComponents componentsWithURL:v6 resolvingAgainstBaseURL:0];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v7 = [v33 queryItems];
  id v8 = [v7 countByEnumeratingWithState:&v51 objects:from count:16];
  if (!v8)
  {

    v9 = 0;
    v39 = 0;
    uint64_t v40 = 0;
    goto LABEL_30;
  }
  v39 = 0;
  uint64_t v40 = 0;
  v9 = 0;
  uint64_t v10 = *(void *)v52;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v52 != v10) {
        objc_enumerationMutation(v7);
      }
      int v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
      uint64_t v13 = [v12 name];
      unsigned int v14 = [v13 isEqualToString:@"dsid"];

      if (v14)
      {
        v15 = [v12 value];
        uint64_t v16 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v15 longLongValue]);

        v9 = (void *)v16;
      }
      else
      {
        v17 = [v12 name];
        unsigned int v18 = [v17 isEqualToString:@"username"];

        if (v18)
        {
          [v12 value];
          uint64_t v40 = v15 = v40;
        }
        else
        {
          v19 = [v12 name];
          unsigned int v20 = [v19 isEqualToString:@"accountType"];

          if (!v20) {
            continue;
          }
          [v12 value];
          v39 = v15 = v39;
        }
      }
    }
    id v8 = [v7 countByEnumeratingWithState:&v51 objects:from count:16];
  }
  while (v8);

  if (v9 && v40)
  {
    id v21 = +[ACAccountStore ams_sharedAccountStoreForMediaType:v39];
    v22 = objc_msgSend(v21, "ams_accountWithAltDSID:DSID:username:accountTypeIdentifier:", 0, v9, 0, v39);
    if (v22)
    {
      v45((uint64_t)v32, 1);
    }
    else
    {
      id v28 = objc_alloc_init((Class)AMSAuthenticateOptions);
      [v28 setCanMakeAccountActive:0];
      [v28 setIgnoreAccountConversion:1];
      id v29 = [objc_alloc((Class)AMSAuthenticateRequest) initWithDSID:v9 altDSID:0 username:v40 options:v28];
      id v30 = [objc_alloc((Class)sub_7AF8()) initWithRequest:v29 presentingViewController:self];
      sub_7BDC((uint64_t)self);
      id v31 = [v30 performAuthentication];
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v56 = sub_7E60;
      v57 = &unk_C538;
      uint64_t v58 = self;
      id v59 = v32;
      [v31 addFinishBlock:&buf];
    }
    goto LABEL_38;
  }
LABEL_30:
  v25 = ASDLogHandleForCategory(14);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = objc_opt_class();
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v26;
    _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Unable to locate account on dialog action URL", (uint8_t *)&buf, 0xCu);
  }

  v45((uint64_t)v32, 1);
LABEL_38:

LABEL_39:
  objc_destroyWeak(&v49);
  objc_destroyWeak(&location);
LABEL_40:
  v3 = v36;
LABEL_41:
}

- (id)_automaticDownloadsEnabled
{
  v2 = sub_418C();
  v3 = sub_466C(v2, @"AutoDownloadsEnabled", &__kCFBooleanFalse);

  return v3;
}

- (void)_automaticDownloadsChanged:(id)a3
{
  id v3 = a3;
  sub_418C();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_47EC((uint64_t)v4, v3, @"AutoDownloadsEnabled");
}

- (id)_automaticUpdatesEnabled
{
  v2 = sub_418C();
  id v3 = sub_466C(v2, @"AutoUpdatesEnabled", &__kCFBooleanTrue);

  return v3;
}

- (void)_automaticUpdatesChanged:(id)a3
{
  id v3 = a3;
  sub_418C();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_47EC((uint64_t)v4, v3, @"AutoUpdatesEnabled");
}

- (void)_reloadForExternalChange
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_81B8;
  block[3] = &unk_C5B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousButtonItem, 0);
  objc_storeStrong((id *)&self->_bridgeMessenger, 0);

  objc_storeStrong((id *)&self->_activeDialogRequest, 0);
}

@end