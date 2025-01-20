@interface ENUISettingsViewController
- (BOOL)isDataLoaded;
- (BOOL)isExtraLoggingEnabled;
- (BOOL)isWeeklySummaryEnabled;
- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5 withCompletion:(id)a6;
- (BOOL)shouldShowSplashScreen;
- (BOOL)shouldShowTurndownScreen;
- (ENExposureDetectionHistorySession)latestExposureCheckSession;
- (ENExposureNotification)latestNotification;
- (ENStatusChangeObserver)statusChangeObserver;
- (ENUIExposureNotificationsStore)exposureStore;
- (ENUIPresentationController)presentationController;
- (ENUISettingsViewController)init;
- (NSDate)lastExposureCheckTime;
- (NSDate)lastRegionRefreshDate;
- (_TtC28HealthExposureNotificationUI16ENManagerAdapter)adapter;
- (id)_activeRegionSpecifiers;
- (id)_availabilityAlertSpecifiers;
- (id)_deleteExposureDataSpecifiers;
- (id)_exposureNotificationStatusText;
- (id)_featureAvailableSpecifiers;
- (id)_isWeeklySummaryEnabled;
- (id)_latestNotificationSpecifier;
- (id)_loadingSpecifier;
- (id)_loggingProfileSpecifiers;
- (id)_loggingStatusSpecifier;
- (id)_shareDiagnosisSpecifiers;
- (id)_systemFunctionalitySpecifiers;
- (id)_turnOffExposureNotificationSpecifiers;
- (id)_unsupportedRegionSpecifiers;
- (id)_viewExposureInAppSpecifiers;
- (id)_weeklySummarySpecifiers;
- (id)areAvailabilityAlertsEnabled;
- (id)specifierForHealthAgencyModel:(id)a3;
- (id)specifiers;
- (int)notificationToken;
- (int64_t)lastKnownStatus;
- (void)_toggleWeeklySummarySwitch:(id)a3 specifier:(id)a4;
- (void)addFooterText:(id)a3 withLinkText:(id)a4 toGroup:(id)a5 action:(SEL)a6;
- (void)appWillEnterForeground;
- (void)dealloc;
- (void)didConfirmTurnOffExposureNotifications;
- (void)didTapDeleteExposureData:(id)a3;
- (void)didTapLearnMore;
- (void)didTapRegionFAQWebsite;
- (void)didTapRegionWebsite;
- (void)didTapShareDiagnosisLink;
- (void)didTapTurnOffExposureNotifications:(id)a3;
- (void)didTapTurnOnExposureNotifications:(id)a3;
- (void)didTapViewInApp;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)presentOnboardingForPath:(id)a3 fromDeepLink:(BOOL)a4 completion:(id)a5;
- (void)presentPreAuthorizedKeyReleasedThankYouScreen;
- (void)presentUIFlowStack:(id)a3 forRegionModel:(id)a4 onboardingSource:(int64_t)a5 completion:(id)a6;
- (void)presentVerificationFlowForAgencyModel:(id)a3 sessionIdentifier:(id)a4 reportType:(unsigned int)a5 onboardingCompletionHandler:(id)a6 completionHandler:(id)a7;
- (void)refreshRegionsAndReloadSpecifiers;
- (void)setAdapter:(id)a3;
- (void)setExposureStore:(id)a3;
- (void)setIsDataLoaded:(BOOL)a3;
- (void)setIsExtraLoggingEnabled:(BOOL)a3;
- (void)setIsWeeklySummaryEnabled:(BOOL)a3;
- (void)setLastExposureCheckTime:(id)a3;
- (void)setLastKnownStatus:(int64_t)a3;
- (void)setLastRegionRefreshDate:(id)a3;
- (void)setLatestExposureCheckSession:(id)a3;
- (void)setLatestNotification:(id)a3;
- (void)setNotificationToken:(int)a3;
- (void)setNotificationsEnabled:(BOOL)a3;
- (void)setPresentationController:(id)a3;
- (void)setStatusChangeObserver:(id)a3;
- (void)showExposureLoggingController:(id)a3;
- (void)showLatestExposureDetailWithCompletion:(id)a3;
- (void)toggleAvailabilityAlertsSwitch:(id)a3 specifier:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ENUISettingsViewController

- (ENUISettingsViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)ENUISettingsViewController;
  v2 = [(ENUISettingsViewController *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_notificationToken = -1;
    id location = 0;
    objc_initWeak(&location, v2);
    id v4 = &_dispatch_main_q;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_530C;
    v6[3] = &unk_2C870;
    objc_copyWeak(&v7, &location);
    notify_register_dispatch("com.apple.ExposureNotification.trackedAppChanged", &v3->_notificationToken, (dispatch_queue_t)&_dispatch_main_q, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  notify_cancel(self->_notificationToken);
  self->_notificationToken = -1;
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ENUISettingsViewController;
  [(ENUISettingsViewController *)&v4 dealloc];
}

- (_TtC28HealthExposureNotificationUI16ENManagerAdapter)adapter
{
  return (_TtC28HealthExposureNotificationUI16ENManagerAdapter *)+[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
}

- (void)setLatestNotification:(id)a3
{
  v5 = (ENExposureNotification *)a3;
  if (self->_latestNotification != v5)
  {
    objc_storeStrong((id *)&self->_latestNotification, a3);
    uint64_t v6 = [(ENUISettingsViewController *)self specifierForID:@"latest-notification"];
    id v7 = (void *)v6;
    if (v6)
    {
      uint64_t v12 = v6;
      v8 = +[NSArray arrayWithObjects:&v12 count:1];
      objc_super v9 = [(ENUISettingsViewController *)self _latestNotificationSpecifier];
      v11 = v9;
      v10 = +[NSArray arrayWithObjects:&v11 count:1];
      [(ENUISettingsViewController *)self replaceContiguousSpecifiers:v8 withSpecifiers:v10];
    }
  }
}

- (void)viewDidLoad
{
  id location = 0;
  objc_initWeak(&location, self);
  v14.receiver = self;
  v14.super_class = (Class)ENUISettingsViewController;
  [(ENUISettingsViewController *)&v14 viewDidLoad];
  v3 = objc_alloc_init(ENUIExposureNotificationsStore);
  [(ENUISettingsViewController *)self setExposureStore:v3];

  id v4 = objc_alloc_init((Class)ENUIPresentationController);
  [(ENUISettingsViewController *)self setPresentationController:v4];

  id v5 = objc_alloc((Class)ENStatusChangeObserver);
  uint64_t v6 = [(ENUISettingsViewController *)self adapter];
  objc_super v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_56EC;
  uint64_t v12 = &unk_2C780;
  objc_copyWeak(&v13, &location);
  id v7 = [v5 initWithAdapter:v6 didChangeHandler:&v9];
  -[ENUISettingsViewController setStatusChangeObserver:](self, "setStatusChangeObserver:", v7, v9, v10, v11, v12);

  v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"appWillEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ENUISettingsViewController;
  [(ENUISettingsViewController *)&v6 viewWillAppear:a3];
  [(ENUISettingsViewController *)self refreshRegionsAndReloadSpecifiers];
  id v4 = [(ENUISettingsViewController *)self statusChangeObserver];
  [v4 setActive:1];

  id v5 = [(ENUISettingsViewController *)self navigationItem];
  [v5 setBackButtonDisplayMode:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ENUISettingsViewController;
  [(ENUISettingsViewController *)&v8 viewDidDisappear:a3];
  id v4 = [(ENUISettingsViewController *)self table];
  id v5 = [(ENUISettingsViewController *)self table];
  objc_super v6 = [v5 indexPathForSelectedRow];
  [v4 deselectRowAtIndexPath:v6 animated:0];

  id v7 = [(ENUISettingsViewController *)self statusChangeObserver];
  [v7 setActive:0];
}

- (void)refreshRegionsAndReloadSpecifiers
{
  v3 = dispatch_group_create();
  location[0] = 0;
  objc_initWeak(location, self);
  dispatch_group_enter(v3);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_5CE4;
  v31[3] = &unk_2C898;
  objc_copyWeak(&v33, location);
  id v4 = v3;
  v32 = v4;
  +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel refreshRegionsWithCompletion:v31];
  dispatch_group_enter(v4);
  id v5 = [(ENUISettingsViewController *)self adapter];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_5D7C;
  v28[3] = &unk_2C8C0;
  objc_copyWeak(&v30, location);
  objc_super v6 = v4;
  v29 = v6;
  [v5 latestExposureNotification:v28];

  dispatch_group_enter(v6);
  id v7 = [(ENUISettingsViewController *)self exposureStore];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_5DEC;
  v25[3] = &unk_2C8E8;
  objc_copyWeak(&v27, location);
  objc_super v8 = v6;
  v26 = v8;
  [v7 fetchExtraLoggingEnabledWithCompletion:v25];

  dispatch_group_enter(v8);
  objc_super v9 = [(ENUISettingsViewController *)self exposureStore];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_5E90;
  v22[3] = &unk_2C910;
  objc_copyWeak(&v24, location);
  uint64_t v10 = v8;
  v23 = v10;
  [v9 fetchExposureCheckSessionsWithCompletion:v22];

  dispatch_group_enter(v10);
  v11 = [(ENUISettingsViewController *)self exposureStore];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_5F78;
  v19[3] = &unk_2C8E8;
  objc_copyWeak(&v21, location);
  uint64_t v12 = v10;
  v20 = v12;
  [v11 fetchWeeklySummaryEnabledWithCompletion:v19];

  dispatch_group_enter(v12);
  id v13 = [(ENUISettingsViewController *)self adapter];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_601C;
  v17[3] = &unk_2C758;
  objc_super v14 = v12;
  v18 = v14;
  [v13 refreshStatusWithCompletion:v17];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6024;
  block[3] = &unk_2C898;
  objc_copyWeak(&v16, location);
  block[4] = self;
  dispatch_group_notify(v14, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&v33);
  objc_destroyWeak(location);
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  objc_super v8 = [v6 objectForKeyedSubscript:@"path"];
  location[0] = 0;
  objc_initWeak(location, self);
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_6A54;
  v81[3] = &unk_2C978;
  objc_copyWeak(&v82, location);
  objc_super v9 = objc_retainBlock(v81);
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_6AB8;
  v79[3] = &unk_2C978;
  objc_copyWeak(&v80, location);
  uint64_t v10 = objc_retainBlock(v79);
  switch(+[ENUIRouter routeForPath:v8])
  {
    case 0uLL:
      v11 = +[ENUIViewControllerFactory sharedInstance];
      uint64_t v12 = [v11 inflightOnboardingStack];

      if (!v12)
      {
        v35 = [v8 lastPathComponent];
        v36 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 3221225472;
        v69[2] = sub_71D4;
        v69[3] = &unk_2CA18;
        id v16 = v35;
        id v70 = v16;
        v71 = self;
        v72 = v7;
        v73 = v9;
        [v36 fetchAgencyModelForRegionCode:v16 reason:0 completion:v69];

        v17 = v70;
        goto LABEL_27;
      }
      id v13 = ENUILogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1D2BC();
      }
      goto LABEL_19;
    case 1uLL:
      [(ENUISettingsViewController *)self presentOnboardingForPath:v8 fromDeepLink:1 completion:v7];
      goto LABEL_36;
    case 2uLL:
      objc_super v14 = [v8 lastPathComponent];
      v15 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_72DC;
      v64[3] = &unk_2CA18;
      id v16 = v14;
      id v65 = v16;
      v66 = self;
      v67 = v7;
      v68 = v9;
      [v15 fetchAgencyModelForRegionCode:v16 reason:0 completion:v64];

      v17 = v65;
LABEL_27:

      goto LABEL_36;
    case 3uLL:
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_7448;
      v62[3] = &unk_2CA68;
      v62[4] = self;
      v63 = v7;
      +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel refreshRegionsWithCompletion:v62];
      v18 = v63;
      goto LABEL_33;
    case 5uLL:
      v19 = +[ENUIViewControllerFactory sharedInstance];
      v20 = [v19 inflightVerificationStack];

      if (v20)
      {
        id v21 = ENUILogForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Request to present verification stack when there's already one inflight, so we're dismissing the existing one", buf, 2u);
        }

        v22 = +[ENUIViewControllerFactory sharedInstance];
        v23 = [v22 inflightVerificationStack];
        [v23 dismissViewControllerAnimated:1 completion:0];

        id v24 = +[ENUIViewControllerFactory sharedInstance];
        [v24 setInflightVerificationStack:0];
      }
      v46 = [v6 objectForKeyedSubscript:@"sessionIdentifier"];
      v25 = [v6 objectForKeyedSubscript:@"reportType"];
      v44 = v10;
      v45 = v9;
      v43 = v25;
      if ([v25 length] == (char *)&dword_0 + 1)
      {
        id v26 = [v25 integerValue];
        if ((unint64_t)v26 >= 6) {
          int v27 = 0;
        }
        else {
          int v27 = (int)v26;
        }
      }
      else
      {
        int v27 = 0;
      }
      id v30 = [v6 objectForKeyedSubscript:@"region"];
      if (v30)
      {
        v31 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_7734;
        v52[3] = &unk_2CB08;
        v52[4] = self;
        id v53 = v46;
        int v57 = v27;
        id v55 = v45;
        v56 = v7;
        id v54 = v30;
        [v31 getAgencyModelForRegionCode:v54 completion:v52];
        v32 = &v53;
        id v33 = &v55;
        v34 = (id *)&v56;
      }
      else
      {
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_7870;
        v47[3] = &unk_2CB30;
        v47[4] = self;
        id v48 = v46;
        int v51 = v27;
        id v49 = v45;
        v50 = v7;
        +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel refreshRegionsWithCompletion:v47];
        v32 = &v48;
        id v33 = &v49;
        v34 = (id *)&v50;
      }

      uint64_t v10 = v44;
      objc_super v9 = v45;
      goto LABEL_36;
    case 6uLL:
      v28 = +[ENUIViewControllerFactory sharedInstance];
      v29 = [v28 inflightOnboardingStack];

      if (v29)
      {
        id v13 = ENUILogForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Request to present pre-authorization stack when there's already one inflight", buf, 2u);
        }
LABEL_19:

        if (v7) {
          v7[2](v7);
        }
      }
      else
      {
        v37 = +[ENUIViewControllerFactory sharedInstance];
        v38 = [v37 inflightPreAuthorizationStack];

        if (v38)
        {
          v39 = ENUILogForCategory();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "Request to present verification stack when there's already one inflight, so we're dismissing the existing one", buf, 2u);
          }

          v40 = +[ENUIViewControllerFactory sharedInstance];
          v41 = [v40 inflightPreAuthorizationStack];
          [v41 dismissViewControllerAnimated:1 completion:0];

          v42 = +[ENUIViewControllerFactory sharedInstance];
          [v42 setInflightPreAuthorizationStack:0];
        }
        v74[0] = _NSConcreteStackBlock;
        v74[1] = 3221225472;
        v74[2] = sub_6B1C;
        v74[3] = &unk_2C9F0;
        v74[4] = self;
        v76 = v10;
        v77 = v7;
        id v75 = v8;
        +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel refreshRegionsWithCompletion:v74];

        v18 = v76;
LABEL_33:
      }
LABEL_36:

      objc_destroyWeak(&v80);
      objc_destroyWeak(&v82);
      objc_destroyWeak(location);

      return;
    case 7uLL:
      [(ENUISettingsViewController *)self presentPreAuthorizedKeyReleasedThankYouScreen];
      goto LABEL_36;
    case 8uLL:
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_7454;
      v58[3] = &unk_2CAB8;
      v58[4] = self;
      id v59 = v8;
      v60 = v7;
      objc_copyWeak(&v61, location);
      +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel refreshRegionsWithCompletion:v58];
      objc_destroyWeak(&v61);

      goto LABEL_36;
    default:
      goto LABEL_36;
  }
}

- (void)presentPreAuthorizedKeyReleasedThankYouScreen
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_794C;
  v2[3] = &unk_2C758;
  v2[4] = self;
  +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel refreshRegionsWithCompletion:v2];
}

- (void)presentOnboardingForPath:(id)a3 fromDeepLink:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  objc_super v9 = (void (**)(void))a5;
  uint64_t v10 = +[ENUIViewControllerFactory sharedInstance];
  v11 = [v10 inflightOnboardingStack];

  if (v11)
  {
    uint64_t v12 = ENUILogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1D2BC();
    }

    if (v9) {
      v9[2](v9);
    }
  }
  else
  {
    location[0] = 0;
    objc_initWeak(location, self);
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_8064;
    v51[3] = &unk_2C978;
    objc_copyWeak(&v52, location);
    id v13 = objc_retainBlock(v51);
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x3032000000;
    v49[3] = sub_80C8;
    v49[4] = sub_80D8;
    id v50 = 0;
    objc_super v14 = [v8 pathComponents];
    v15 = [v14 firstObject];
    if ([v15 isEqualToString:@"AUTHORIZE"]) {
      uint64_t v16 = 5;
    }
    else {
      uint64_t v16 = 0;
    }

    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_80E0;
    v41[3] = &unk_2CBA8;
    v46 = v49;
    id v17 = v8;
    id v42 = v17;
    v43 = self;
    BOOL v48 = a4;
    uint64_t v47 = v16;
    v18 = v13;
    id v44 = v18;
    v19 = v9;
    id v45 = v19;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_85B8;
    v32[3] = &unk_2CBF8;
    v38 = v49;
    v20 = objc_retainBlock(v41);
    id v35 = v20;
    id v21 = v17;
    id v33 = v21;
    v34 = self;
    BOOL v40 = a4;
    uint64_t v39 = v16;
    v22 = v18;
    id v36 = v22;
    v37 = v19;
    v23 = objc_retainBlock(v32);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_8A40;
    v26[3] = &unk_2CC48;
    id v24 = v14;
    id v27 = v24;
    v28 = self;
    v31 = v49;
    v25 = v23;
    id v30 = v25;
    id v29 = v21;
    +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel refreshRegionsWithCompletion:v26];

    _Block_object_dispose(v49, 8);
    objc_destroyWeak(&v52);
    objc_destroyWeak(location);
  }
}

- (id)specifierForHealthAgencyModel:(id)a3
{
  id v4 = a3;
  id v5 = ENUILogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1D3C8(v4, v5);
  }

  id v6 = [v4 name];
  id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

  id v8 = [v4 region];
  objc_super v9 = [v8 regionCode];
  [v7 setIdentifier:v9];

  [v7 setUserInfo:v4];
  [v7 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
  uint64_t v10 = [v4 name];
  [v7 setObject:v10 forKeyedSubscript:PSTitleKey];

  return v7;
}

- (void)presentVerificationFlowForAgencyModel:(id)a3 sessionIdentifier:(id)a4 reportType:(unsigned int)a5 onboardingCompletionHandler:(id)a6 completionHandler:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = (void (**)(void))a7;
  if (v12)
  {
    if (v13)
    {
      id v16 = [objc_alloc((Class)NSUUID) initWithUUIDString:v13];
      if (v16)
      {
        id v17 = +[ENUIViewControllerFactory sharedInstance];
        v18 = [(ENUISettingsViewController *)self adapter];
        v19 = [v17 createVerificationStackForAgencyModel:v12 exposureManager:v18 sessionIdentifier:v16 reportType:v9 enteredFromMainScreen:1 completion:v14];

        [(ENUISettingsViewController *)self presentUIFlowStack:v19 forRegionModel:v12 onboardingSource:0 completion:v15];
      }
      else
      {
        id v21 = ENUILogForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1D4C4();
        }

        if (v15) {
          v15[2](v15);
        }
      }

      goto LABEL_16;
    }
    v20 = ENUILogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1D490();
    }
  }
  else
  {
    v20 = ENUILogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1D45C();
    }
  }

  if (v15) {
    v15[2](v15);
  }
LABEL_16:
}

- (void)presentUIFlowStack:(id)a3 forRegionModel:(id)a4 onboardingSource:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(void))a6;
  if (v10)
  {
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_90FC;
    v18 = &unk_2C848;
    v19 = self;
    id v20 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v15);
    if (v11 && a5)
    {
      id v13 = [(ENUISettingsViewController *)self adapter];
      id v14 = [v11 region];
      [v13 onboardingDidStartForRegion:v14 source:a5];
    }
    else
    {
      id v13 = ENUILogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1D4F8();
      }
    }
  }
  if (v12) {
    v12[2](v12);
  }
}

- (void)showLatestExposureDetailWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_9210;
  v7[3] = &unk_2CC70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 latestExposureNotification:v7];
}

- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5 withCompletion:(id)a6
{
  return 1;
}

- (id)specifiers
{
  if ([(ENUISettingsViewController *)self isDataLoaded])
  {
    uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
    id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
    if (v4)
    {
      id v5 = v4;
    }
    else
    {
      id v6 = objc_alloc_init((Class)NSMutableArray);
      id v7 = [(ENUISettingsViewController *)self _loggingProfileSpecifiers];
      [v6 addObjectsFromArray:v7];

      if ([(ENUISettingsViewController *)self shouldShowSplashScreen])
      {
        id v8 = [(ENUISettingsViewController *)self _featureAvailableSpecifiers];
        [v6 addObjectsFromArray:v8];

        uint64_t v9 = [(ENUISettingsViewController *)self _availabilityAlertSpecifiers];
      }
      else
      {
        id v10 = [(ENUISettingsViewController *)self _systemFunctionalitySpecifiers];
        [v6 addObjectsFromArray:v10];

        id v11 = [(ENUISettingsViewController *)self _shareDiagnosisSpecifiers];
        [v6 addObjectsFromArray:v11];

        id v12 = [(ENUISettingsViewController *)self _weeklySummarySpecifiers];
        [v6 addObjectsFromArray:v12];

        id v13 = [(ENUISettingsViewController *)self _availabilityAlertSpecifiers];
        [v6 addObjectsFromArray:v13];

        id v14 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];

        if (v14) {
          [(ENUISettingsViewController *)self _turnOffExposureNotificationSpecifiers];
        }
        else {
        uint64_t v9 = [(ENUISettingsViewController *)self _deleteExposureDataSpecifiers];
        }
      }
      v15 = (void *)v9;
      [v6 addObjectsFromArray:v9];

      id v16 = [v6 copy];
      id v17 = *(void **)&self->PSListController_opaque[v3];
      *(void *)&self->PSListController_opaque[v3] = v16;

      id v5 = *(id *)&self->PSListController_opaque[v3];
    }
  }
  else
  {
    id v5 = &__NSArray0__struct;
  }

  return v5;
}

- (BOOL)shouldShowSplashScreen
{
  uint64_t v3 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
  unsigned __int8 v4 = [v3 isExposureLoggingDataPresent];

  if ((v4 & 1) == 0
    && !+[ENUITCCUtilities hasExposureNotificationAppsFromTCC])
  {
    id v6 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
    id v7 = v6;
    if (v6 && [v6 regionVersion] == (char *)&dword_0 + 2)
    {
      BOOL v5 = 0;
LABEL_27:

      return v5;
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel authorizedRegions];
    id v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v23;
LABEL_9:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v22 + 1) + 8 * v12) regionVersion] == (char *)&dword_0 + 2) {
          break;
        }
        if (v10 == (id)++v12)
        {
          id v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
          if (v10) {
            goto LABEL_9;
          }
          goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:

      if (![(ENUISettingsViewController *)self isExtraLoggingEnabled])
      {
        BOOL v5 = 1;
        goto LABEL_27;
      }
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel availableRegions];
      id v13 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (!v13)
      {
        BOOL v5 = 1;
        goto LABEL_26;
      }
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
LABEL_18:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v18 + 1) + 8 * v16) regionVersion] == (char *)&dword_0 + 2) {
          break;
        }
        if (v14 == (id)++v16)
        {
          id v14 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
          BOOL v5 = 1;
          if (v14) {
            goto LABEL_18;
          }
          goto LABEL_26;
        }
      }
    }
    BOOL v5 = 0;
LABEL_26:

    goto LABEL_27;
  }
  return 0;
}

- (BOOL)shouldShowTurndownScreen
{
  v2 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel turndownEntity];

  if (v2)
  {
    id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ExposureNotification"];
    unsigned __int8 v4 = [v3 BOOLForKey:@"showTurndownAlways"];

    if (v4)
    {
      LOBYTE(v2) = 1;
    }
    else
    {
      uint64_t v5 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
      if (v5
        && (id v6 = (void *)v5,
            +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion](_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel, "activeRegion"), id v7 = objc_claimAutoreleasedReturnValue(), v8 = [v7 regionIsPlaceholder], v7, v6, !v8))
      {
        LOBYTE(v2) = 0;
      }
      else
      {
        id v9 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ExposureNotification"];
        id v10 = [v9 objectForKey:@"turndownEntity"];
        LOBYTE(v2) = v10 != 0;
      }
    }
  }
  return (char)v2;
}

- (void)addFooterText:(id)a3 withLinkText:(id)a4 toGroup:(id)a5 action:(SEL)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = (objc_class *)objc_opt_class();
  id v14 = NSStringFromClass(v13);
  [v10 setObject:v14 forKeyedSubscript:PSFooterCellClassGroupKey];

  [v10 setObject:v12 forKeyedSubscript:PSFooterHyperlinkViewTitleKey];
  id v15 = [v12 rangeOfString:v11];
  NSUInteger v17 = v16;

  v22.id location = (NSUInteger)v15;
  v22.length = v17;
  long long v18 = NSStringFromRange(v22);
  [v10 setObject:v18 forKeyedSubscript:PSFooterHyperlinkViewLinkRangeKey];

  long long v19 = +[NSValue valueWithNonretainedObject:self];
  [v10 setObject:v19 forKeyedSubscript:PSFooterHyperlinkViewTargetKey];

  NSStringFromSelector(a6);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [v10 setObject:v20 forKeyedSubscript:PSFooterHyperlinkViewActionKey];
}

- (id)_loadingSpecifier
{
  v2 = +[PSSpecifier preferenceSpecifierNamed:&stru_2D820 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v2 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];

  return v2;
}

- (id)_loggingStatusSpecifier
{
  int64_t v3 = [(ENUISettingsViewController *)self lastKnownStatus];
  unsigned __int8 v4 = ENUILocalizedString();
  uint64_t v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:1 edit:0];

  [v5 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
  v13[0] = @"sectionKey";
  id v6 = ENUILocalizedString();
  BOOL v7 = v3 == 1;
  v14[0] = v6;
  v13[1] = @"titleKey";
  unsigned int v8 = ENUILocalizedString();
  v14[1] = v8;
  v13[2] = @"subtitleKey";
  id v9 = [(ENUISettingsViewController *)self _exposureNotificationStatusText];
  v14[2] = v9;
  v13[3] = @"showTitleIconKey";
  id v10 = +[NSNumber numberWithBool:v7];
  v14[3] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  [v5 setUserInfo:v11];

  [v5 setControllerLoadAction:"showExposureLoggingController:"];

  return v5;
}

- (id)_activeRegionSpecifiers
{
  int64_t v3 = [(ENUISettingsViewController *)self lastKnownStatus];
  unsigned __int8 v4 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
  if (!v4)
  {
    BOOL v16 = v3 != 4;
    id v6 = ENUILocalizedString();
    id v14 = +[PSSpecifier preferenceSpecifierNamed:@"active-region" target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
    [v14 setIdentifier:@"active-region"];
    [v14 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
    [v14 setObject:v6 forKeyedSubscript:PSTitleKey];
    [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:PSValueKey];
    NSUInteger v17 = +[NSNumber numberWithInt:v16];
    [v14 setObject:v17 forKeyedSubscript:PSEnabledKey];

    long long v25 = v14;
    id v15 = &v25;
    uint64_t v18 = 1;
LABEL_8:
    long long v23 = +[NSArray arrayWithObjects:v15 count:v18];

    goto LABEL_9;
  }
  BOOL v5 = v3 != 4;
  id v6 = +[PSSpecifier preferenceSpecifierNamed:@"active-region" target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
  [v6 setIdentifier:@"active-region"];
  [v6 setUserInfo:v4];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = PSCellClassKey;
  [v6 setObject:v7 forKeyedSubscript:PSCellClassKey];
  id v9 = [v4 name];
  [v6 setObject:v9 forKeyedSubscript:PSTitleKey];

  [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:PSValueKey];
  id v10 = +[NSNumber numberWithInt:v5];
  [v6 setObject:v10 forKeyedSubscript:PSEnabledKey];

  id v11 = [v4 regionFAQWebsiteURL];
  id v12 = [v11 absoluteString];
  id v13 = [v12 length];

  if (v13)
  {
    id v14 = +[PSSpecifier preferenceSpecifierNamed:&stru_2D820 target:self set:0 get:0 detail:0 cell:13 edit:0];
    [v14 setIdentifier:@"region-faq"];
    [v14 setObject:objc_opt_class() forKeyedSubscript:v8];
    [v14 setButtonAction:"didTapRegionFAQWebsite"];
    v28[0] = v6;
    v28[1] = v14;
    id v15 = (void **)v28;
LABEL_7:
    uint64_t v18 = 2;
    goto LABEL_8;
  }
  long long v19 = [v4 regionWebsiteURL];
  id v20 = [v19 absoluteString];
  id v21 = [v20 length];

  if (v21)
  {
    NSRange v22 = ENUILocalizedString();
    id v14 = +[PSSpecifier preferenceSpecifierNamed:v22 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v14 setButtonAction:"didTapRegionWebsite"];
    v27[0] = v6;
    v27[1] = v14;
    id v15 = (void **)v27;
    goto LABEL_7;
  }
  id v26 = v6;
  long long v23 = +[NSArray arrayWithObjects:&v26 count:1];
LABEL_9:

  return v23;
}

- (id)_featureAvailableSpecifiers
{
  int64_t v3 = +[PSSpecifier groupSpecifierWithID:@"feature-available"];
  unsigned __int8 v4 = ENUILocalizedString();
  BOOL v5 = ENUILocalizedString();
  id v6 = +[NSString stringWithFormat:@"%@\n\n%@", v5, v4];

  [(ENUISettingsViewController *)self addFooterText:v6 withLinkText:v4 toGroup:v3 action:"didTapLearnMore"];
  uint64_t v7 = ENUILocalizedString();
  uint64_t v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v8 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
  [v8 setButtonAction:"didTapTurnOnExposureNotifications:"];
  id v9 = +[NSNumber numberWithInt:(int *)[(ENUISettingsViewController *)self lastKnownStatus] != &dword_4];
  [v8 setObject:v9 forKeyedSubscript:PSEnabledKey];

  v12[0] = v3;
  v12[1] = v8;
  id v10 = +[NSArray arrayWithObjects:v12 count:2];

  return v10;
}

- (id)_unsupportedRegionSpecifiers
{
  int64_t v3 = ENUILocalizedString();
  unsigned __int8 v4 = ENUILocalizedString();
  BOOL v5 = +[NSString stringWithFormat:@"%@\n\n%@", v3, v4];
  id v6 = +[PSSpecifier emptyGroupSpecifier];
  [v6 setObject:@"EXPOSURE_NOTIFICATIONS_GROUP" forKeyedSubscript:PSIDKey];
  id v7 = [v5 rangeOfString:v4];
  NSUInteger v9 = v8;
  id v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  [v6 setObject:v11 forKeyedSubscript:PSFooterCellClassGroupKey];

  id v12 = +[NSNumber numberWithInt:1];
  [v6 setObject:v12 forKeyedSubscript:PSFooterAlignmentGroupKey];

  id v13 = +[NSNumber numberWithInt:1];
  [v6 setObject:v13 forKeyedSubscript:PSAlignmentKey];

  [v6 setObject:v5 forKeyedSubscript:PSFooterHyperlinkViewTitleKey];
  v21.id location = (NSUInteger)v7;
  v21.length = v9;
  id v14 = NSStringFromRange(v21);
  [v6 setObject:v14 forKeyedSubscript:PSFooterHyperlinkViewLinkRangeKey];

  id v15 = +[NSValue valueWithNonretainedObject:self];
  [v6 setObject:v15 forKeyedSubscript:PSFooterHyperlinkViewTargetKey];

  BOOL v16 = NSStringFromSelector("didTapLearnMore");
  [v6 setObject:v16 forKeyedSubscript:PSFooterHyperlinkViewActionKey];

  [v6 setObject:v5 forKeyedSubscript:PSFooterTextGroupKey];
  long long v19 = v6;
  NSUInteger v17 = +[NSArray arrayWithObjects:&v19 count:1];

  return v17;
}

- (id)_availabilityAlertSpecifiers
{
  int64_t v3 = [(ENUISettingsViewController *)self adapter];
  id v4 = [v3 isAvailabilityAlertsSwitchEnabled];

  BOOL v5 = +[PSSpecifier groupSpecifierWithID:@"notify-when-available"];
  id v6 = ENUILocalizedString();
  [v5 setObject:v6 forKeyedSubscript:PSFooterTextGroupKey];

  id v7 = ENUILocalizedString();
  NSUInteger v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"toggleAvailabilityAlertsSwitch:specifier:" get:"areAvailabilityAlertsEnabled" detail:0 cell:6 edit:0];

  NSUInteger v9 = +[NSNumber numberWithBool:v4];
  [v8 setObject:v9 forKeyedSubscript:PSEnabledKey];

  v12[0] = v5;
  v12[1] = v8;
  id v10 = +[NSArray arrayWithObjects:v12 count:2];

  return v10;
}

- (id)_loggingProfileSpecifiers
{
  if ([(ENUISettingsViewController *)self isExtraLoggingEnabled]
    && +[ENUITCCUtilities isExposureNotificationsEnabledFromTCC])
  {
    v2 = +[PSSpecifier emptyGroupSpecifier];
    [v2 setObject:@"LOGGING_GROUP" forKeyedSubscript:PSIDKey];
    int64_t v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    [v2 setObject:v4 forKeyedSubscript:PSHeaderCellClassGroupKey];

    id v7 = v2;
    BOOL v5 = +[NSArray arrayWithObjects:&v7 count:1];
  }
  else
  {
    BOOL v5 = &__NSArray0__struct;
  }

  return v5;
}

- (id)_latestNotificationSpecifier
{
  int64_t v3 = +[PSSpecifier preferenceSpecifierNamed:&stru_2D820 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
  [v3 setIdentifier:@"latest-notification"];
  [v3 setProperty:objc_opt_class() forKey:PSCellClassKey];
  int64_t v4 = [(ENUISettingsViewController *)self lastKnownStatus];
  latestNotification = self->_latestNotification;
  if (v4 == 1)
  {
    if (!latestNotification)
    {
      id v6 = [(ENUISettingsViewController *)self lastExposureCheckTime];

      if (v6)
      {
        if (qword_34178 != -1) {
          dispatch_once(&qword_34178, &stru_2CDC8);
        }
        id v7 = (id)qword_34170;
        NSUInteger v8 = [(ENUISettingsViewController *)self lastExposureCheckTime];
        NSUInteger v9 = [v7 stringFromDate:v8];

        id v10 = ENUILocalizedString();
        id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v9);
      }
      else
      {
        id v11 = ENUILocalizedString();
      }
      v45[0] = @"sectionKey";
      uint64_t v39 = ENUILocalizedString();
      v46[0] = v39;
      v46[1] = &__kCFBooleanFalse;
      v45[1] = @"notificationAvailable";
      v45[2] = @"status";
      BOOL v40 = +[NSNumber numberWithUnsignedInteger:1];
      v46[2] = v40;
      v45[3] = @"titleKey";
      v41 = ENUILocalizedString();
      v45[4] = @"subtitleKey";
      v46[3] = v41;
      v46[4] = v11;
      id v42 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:5];
      [v3 setUserInfo:v42];

      [v3 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
      goto LABEL_29;
    }
  }
  else if (!latestNotification)
  {
    v49[0] = @"sectionKey";
    v34 = ENUILocalizedString();
    v50[0] = v34;
    v50[1] = &__kCFBooleanFalse;
    v49[1] = @"notificationAvailable";
    v49[2] = @"status";
    id v35 = +[NSNumber numberWithUnsignedInteger:0];
    v50[2] = v35;
    v49[3] = @"titleKey";
    id v36 = ENUILocalizedString();
    v50[3] = v36;
    v49[4] = @"subtitleKey";
    v37 = ENUILocalizedString();
    v50[4] = v37;
    v38 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:5];
    [v3 setUserInfo:v38];

    [v3 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
    goto LABEL_29;
  }
  id v44 = v3;
  id v12 = +[NSCalendar currentCalendar];
  id v13 = [(ENExposureNotification *)self->_latestNotification classification];
  id v14 = [v13 date];

  if (v14)
  {
    id v15 = objc_alloc_init((Class)NSDateIntervalFormatter);
    BOOL v16 = +[NSLocale currentLocale];
    NSUInteger v17 = +[NSDateFormatter dateFormatFromTemplate:@"MMMMd" options:0 locale:v16];
    [v15 setDateTemplate:v17];

    uint64_t v18 = [v12 dateByAddingUnit:16 value:1 toDate:v14 options:0];
    long long v19 = [v12 dateByAddingUnit:128 value:-1 toDate:v18 options:0];

    id v20 = [(ENExposureNotification *)self->_latestNotification notificationDate];
    if (v20 && [v19 compare:v20] == (char *)&dword_0 + 1)
    {
      id v21 = v20;

      long long v19 = v21;
    }
    NSRange v22 = [v15 stringFromDate:v14 toDate:v19];
  }
  else
  {
    id v14 = [(ENExposureNotification *)self->_latestNotification notificationDate];
    id v15 = objc_alloc_init((Class)NSDateFormatter);
    long long v19 = +[NSDate date];
    id v23 = [v12 component:4 fromDate:v14];
    if (v23 == [v12 component:4 fromDate:v19]) {
      CFStringRef v24 = @"MMMMd";
    }
    else {
      CFStringRef v24 = @"yMMMMd";
    }
    [v15 setLocalizedDateFormatFromTemplate:v24];
    NSRange v22 = [v15 stringFromDate:v14];
  }

  if (v22)
  {
    long long v25 = ENUILocalizedString();
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v25, v22);
    id v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v26 = &stru_2D820;
  }
  id v27 = [(ENExposureNotification *)self->_latestNotification localizedSubjectText];
  if ([(ENExposureNotification *)self->_latestNotification revoked]) {
    uint64_t v28 = 1;
  }
  else {
    uint64_t v28 = 2;
  }
  if (![v27 length])
  {
    [(ENExposureNotification *)self->_latestNotification revoked];
    uint64_t v29 = ENUILocalizedString();

    id v27 = (void *)v29;
  }
  v47[0] = @"sectionKey";
  id v30 = ENUILocalizedString();
  v48[0] = v30;
  v48[1] = &__kCFBooleanTrue;
  v47[1] = @"notificationAvailable";
  v47[2] = @"status";
  v31 = +[NSNumber numberWithUnsignedInteger:v28];
  v48[2] = v31;
  v48[3] = v27;
  v47[3] = @"titleKey";
  v47[4] = @"subtitleKey";
  void v47[5] = @"notification";
  v32 = self->_latestNotification;
  v48[4] = v26;
  v48[5] = v32;
  id v33 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:6];
  [v44 setUserInfo:v33];

  int64_t v3 = v44;
  [v44 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];

LABEL_29:

  return v3;
}

- (id)_viewExposureInAppSpecifiers
{
  int64_t v3 = +[PSSpecifier groupSpecifierWithID:@"view-in-app-group"];
  int64_t v4 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
  BOOL v5 = [v4 installedAppName];

  if ([v5 length])
  {
    id v6 = ENUILocalizedString();
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v5);
    [v3 setObject:v7 forKeyedSubscript:PSFooterTextGroupKey];
  }
  NSUInteger v8 = ENUILocalizedString();
  NSUInteger v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
  [v9 setButtonAction:"didTapViewInApp"];
  v12[0] = v3;
  v12[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v12 count:2];

  return v10;
}

- (id)_systemFunctionalitySpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  int64_t v4 = +[PSSpecifier groupSpecifierWithID:@"exposure-system"];
  BOOL v5 = ENUILocalizedString();
  id v6 = ENUILocalizedString();
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v5);
  [(ENUISettingsViewController *)self addFooterText:v7 withLinkText:v5 toGroup:v4 action:"didTapLearnMore"];

  NSUInteger v8 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
  LODWORD(v6) = [v8 isRegionUsingApp];

  if (v6)
  {
    NSUInteger v9 = [(ENUISettingsViewController *)self _viewExposureInAppSpecifiers];
    [v3 addObjectsFromArray:v9];
    uint64_t v10 = (uint64_t)v4;
  }
  else
  {
    uint64_t v10 = [(ENUISettingsViewController *)self _latestNotificationSpecifier];
    [v3 addObject:v4];
    NSUInteger v9 = (void *)v10;
  }
  [v3 addObject:v10];

  id v11 = [(ENUISettingsViewController *)self _loggingStatusSpecifier];
  [v3 addObject:v11];
  id v12 = [(ENUISettingsViewController *)self _activeRegionSpecifiers];
  [v3 addObjectsFromArray:v12];

  return v3;
}

- (id)_exposureNotificationStatusText
{
  [(ENUISettingsViewController *)self lastKnownStatus];
  v2 = ENUILocalizedString();

  return v2;
}

- (id)_shareDiagnosisSpecifiers
{
  id v3 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];

  if (v3)
  {
    int64_t v4 = +[PSSpecifier groupSpecifierWithID:@"share-diagnosis"];
    BOOL v5 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
    unsigned int v6 = [v5 isRegionUsingApp];

    id v7 = ENUILocalizedString();
    if (v6)
    {
      [v4 setObject:v7 forKeyedSubscript:PSFooterTextGroupKey];

      NSUInteger v8 = ENUILocalizedString();
      NSUInteger v9 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
      uint64_t v10 = [v9 installedAppName];
      id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v10);

      id v11 = "didTapViewInApp";
    }
    else
    {
      id v11 = "didTapShareDiagnosisLink";
    }
    id v13 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:13 edit:0];
    [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
    [v13 setButtonAction:v11];
    v15[0] = v4;
    v15[1] = v13;
    id v12 = +[NSArray arrayWithObjects:v15 count:2];
  }
  else
  {
    id v12 = &__NSArray0__struct;
  }

  return v12;
}

- (id)_turnOffExposureNotificationSpecifiers
{
  id v3 = +[PSSpecifier groupSpecifierWithID:@"turn-off-exposure-notifications"];
  int64_t v4 = +[PSSpecifier preferenceSpecifierNamed:&stru_2D820 target:self set:0 get:0 detail:0 cell:13 edit:0];
  BOOL v5 = ENUILocalizedString();
  [v4 setObject:v5 forKeyedSubscript:PSTitleKey];

  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
  [v4 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
  [v4 setButtonAction:"didTapTurnOffExposureNotifications:"];
  v8[0] = v3;
  v8[1] = v4;
  unsigned int v6 = +[NSArray arrayWithObjects:v8 count:2];

  return v6;
}

- (id)_deleteExposureDataSpecifiers
{
  id v3 = +[PSSpecifier groupSpecifierWithID:@"delete-exposure-data"];
  int64_t v4 = +[PSSpecifier preferenceSpecifierNamed:&stru_2D820 target:self set:0 get:0 detail:0 cell:13 edit:0];
  BOOL v5 = ENUILocalizedString();
  [v4 setObject:v5 forKeyedSubscript:PSTitleKey];

  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
  [v4 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
  [v4 setButtonAction:"didTapDeleteExposureData:"];
  v8[0] = v3;
  v8[1] = v4;
  unsigned int v6 = +[NSArray arrayWithObjects:v8 count:2];

  return v6;
}

- (id)_weeklySummarySpecifiers
{
  id v3 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
  int64_t v4 = [v3 installedAppName];

  if (v4)
  {
    BOOL v5 = +[PSSpecifier groupSpecifierWithID:@"weekly-alert-enabled"];
    unsigned int v6 = ENUILocalizedString();
    [v5 setObject:v6 forKeyedSubscript:PSFooterTextGroupKey];

    id v7 = ENUILocalizedString();
    NSUInteger v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"_toggleWeeklySummarySwitch:specifier:" get:"_isWeeklySummaryEnabled" detail:0 cell:6 edit:0];

    v11[0] = v5;
    v11[1] = v8;
    NSUInteger v9 = +[NSArray arrayWithObjects:v11 count:2];
  }
  else
  {
    NSUInteger v9 = &__NSArray0__struct;
  }

  return v9;
}

- (void)showExposureLoggingController:(id)a3
{
  int64_t v4 = [ENUIExposureLoggingViewController alloc];
  BOOL v5 = [(ENUISettingsViewController *)self exposureStore];
  id v7 = [(ENUIExposureLoggingViewController *)v4 initWithStore:v5];

  unsigned int v6 = [(ENUISettingsViewController *)self navigationController];
  [v6 pushViewController:v7 animated:1];
}

- (void)didTapTurnOnExposureNotifications:(id)a3
{
  id v4 = a3;
  if ((char *)[(ENUISettingsViewController *)self lastKnownStatus] == (char *)&dword_0 + 2
    || (char *)[(ENUISettingsViewController *)self lastKnownStatus] == (char *)&dword_4 + 2
    || (int *)[(ENUISettingsViewController *)self lastKnownStatus] == &dword_4)
  {
    BOOL v5 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
    id location = 0;
    objc_initWeak(&location, self);
    unsigned int v6 = +[ENUIViewControllerFactory sharedInstance];
    NSUInteger v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    id v11 = sub_BB28;
    id v12 = &unk_2C978;
    objc_copyWeak(&v13, &location);
    id v7 = [v6 createOnboardingStackForAgencyModel:0 exposureManager:v5 fromAvailabilityAlert:0 fromDeepLink:0 subsequentFlow:0 completion:&v9];

    -[ENUISettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, &stru_2CC90, v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    NSUInteger v8 = ENUILogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_1D560();
    }

    [(ENUISettingsViewController *)self refreshRegionsAndReloadSpecifiers];
  }
}

- (void)didTapTurnOffExposureNotifications:(id)a3
{
  id v4 = a3;
  BOOL v5 = ENUILocalizedString();
  unsigned int v6 = ENUILocalizedString();
  id v7 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:0];

  id location = 0;
  objc_initWeak(&location, self);
  NSUInteger v8 = ENUILocalizedString();
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_BE5C;
  id v15 = &unk_2CCB8;
  objc_copyWeak(&v16, &location);
  NSUInteger v9 = +[UIAlertAction actionWithTitle:v8 style:2 handler:&v12];
  objc_msgSend(v7, "addAction:", v9, v12, v13, v14, v15);

  uint64_t v10 = ENUILocalizedString();
  id v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];
  [v7 addAction:v11];

  [(ENUISettingsViewController *)self presentViewController:v7 animated:1 completion:0];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)didTapDeleteExposureData:(id)a3
{
  id v4 = a3;
  BOOL v5 = ENUILocalizedString();
  unsigned int v6 = ENUILocalizedString();
  id v7 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:0];

  id location = 0;
  objc_initWeak(&location, self);
  NSUInteger v8 = ENUILocalizedString();
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_C084;
  id v15 = &unk_2CCB8;
  objc_copyWeak(&v16, &location);
  NSUInteger v9 = +[UIAlertAction actionWithTitle:v8 style:2 handler:&v12];
  objc_msgSend(v7, "addAction:", v9, v12, v13, v14, v15);

  uint64_t v10 = ENUILocalizedString();
  id v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:0];
  [v7 addAction:v11];

  [(ENUISettingsViewController *)self presentViewController:v7 animated:1 completion:0];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)toggleAvailabilityAlertsSwitch:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v7 = [(ENUISettingsViewController *)self adapter];
  id v6 = [v5 BOOLValue];

  [v7 setAvailabilityAlertsEnabled:v6 completion:&stru_2CCF8];
}

- (id)areAvailabilityAlertsEnabled
{
  id v3 = [(ENUISettingsViewController *)self adapter];
  if ([v3 isAvailabilityAlertsSwitchEnabled])
  {
    id v4 = [(ENUISettingsViewController *)self adapter];
    id v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 areAvailabilityAlertsEnabled]);
  }
  else
  {
    id v5 = +[NSNumber numberWithInt:0];
  }

  return v5;
}

- (void)_toggleWeeklySummarySwitch:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  -[ENUISettingsViewController setIsWeeklySummaryEnabled:](self, "setIsWeeklySummaryEnabled:", [v5 BOOLValue]);
  id v7 = [(ENUISettingsViewController *)self adapter];
  id v6 = [v5 BOOLValue];

  [v7 setWeeklySummaryEnabled:v6 completion:&stru_2CD18];
}

- (id)_isWeeklySummaryEnabled
{
  BOOL v2 = [(ENUISettingsViewController *)self isWeeklySummaryEnabled];

  return +[NSNumber numberWithBool:v2];
}

- (void)didConfirmTurnOffExposureNotifications
{
  id v3 = [(ENUISettingsViewController *)self view];
  [v3 setUserInteractionEnabled:0];

  id location = 0;
  objc_initWeak(&location, self);
  id v4 = [(ENUISettingsViewController *)self adapter];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_C454;
  v5[3] = &unk_2CD40;
  objc_copyWeak(&v6, &location);
  [v4 resetAllDataAndDisableExposureNotifications:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = [(ENUISettingsViewController *)self adapter];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_C5AC;
  v6[3] = &unk_2CD68;
  objc_copyWeak(&v7, &location);
  [v5 setExposureNotificationEnabled:v3 completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)didTapLearnMore
{
  id v3 = objc_alloc((Class)UINavigationController);
  id v4 = objc_opt_new();
  id v5 = [v3 initWithRootViewController:v4];

  [(ENUISettingsViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)didTapViewInApp
{
  uint64_t v3 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
  if (v3) {
    +[_TtC28HealthExposureNotificationUI20AppStoreAssetManager accessAppFor:v3 presentingViewController:self completion:&stru_2CDA8];
  }

  _objc_release_x1();
}

- (void)didTapRegionFAQWebsite
{
  id v7 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
  BOOL v2 = [v7 regionFAQWebsiteURL];
  uint64_t v3 = [v2 absoluteString];
  id v4 = [v3 length];

  if (v4)
  {
    id v5 = +[LSApplicationWorkspace defaultWorkspace];
    id v6 = [v7 regionFAQWebsiteURL];
    [v5 openURL:v6 withOptions:0];
  }
}

- (void)didTapRegionWebsite
{
  id v7 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
  BOOL v2 = [v7 regionWebsiteURL];
  uint64_t v3 = [v2 absoluteString];
  id v4 = [v3 length];

  if (v4)
  {
    id v5 = +[LSApplicationWorkspace defaultWorkspace];
    id v6 = [v7 regionWebsiteURL];
    [v5 openURL:v6 withOptions:0];
  }
}

- (void)didTapShareDiagnosisLink
{
  uint64_t v3 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
  if (v3)
  {
    id v4 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
    id location = 0;
    objc_initWeak(&location, self);
    id v5 = +[ENUIViewControllerFactory sharedInstance];
    id v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    NSUInteger v9 = sub_CA1C;
    uint64_t v10 = &unk_2C978;
    objc_copyWeak(&v11, &location);
    id v6 = [v5 createVerificationStackForAgencyModel:v3 exposureManager:v4 sessionIdentifier:0 reportType:0 enteredFromMainScreen:1 completion:&v7];

    -[ENUISettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0, v7, v8, v9, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    id v4 = ENUILogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1D670();
    }
  }
}

- (void)appWillEnterForeground
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_CB98;
  block[3] = &unk_2C758;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (ENUIExposureNotificationsStore)exposureStore
{
  return self->_exposureStore;
}

- (void)setExposureStore:(id)a3
{
}

- (void)setAdapter:(id)a3
{
}

- (ENUIPresentationController)presentationController
{
  return self->_presentationController;
}

- (void)setPresentationController:(id)a3
{
}

- (ENExposureDetectionHistorySession)latestExposureCheckSession
{
  return self->_latestExposureCheckSession;
}

- (void)setLatestExposureCheckSession:(id)a3
{
}

- (ENExposureNotification)latestNotification
{
  return self->_latestNotification;
}

- (NSDate)lastExposureCheckTime
{
  return self->_lastExposureCheckTime;
}

- (void)setLastExposureCheckTime:(id)a3
{
}

- (ENStatusChangeObserver)statusChangeObserver
{
  return self->_statusChangeObserver;
}

- (void)setStatusChangeObserver:(id)a3
{
}

- (int64_t)lastKnownStatus
{
  return self->_lastKnownStatus;
}

- (void)setLastKnownStatus:(int64_t)a3
{
  self->_lastKnownStatus = a3;
}

- (NSDate)lastRegionRefreshDate
{
  return self->_lastRegionRefreshDate;
}

- (void)setLastRegionRefreshDate:(id)a3
{
}

- (int)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(int)a3
{
  self->_notificationToken = a3;
}

- (BOOL)isDataLoaded
{
  return self->_isDataLoaded;
}

- (void)setIsDataLoaded:(BOOL)a3
{
  self->_isDataLoaded = a3;
}

- (BOOL)isExtraLoggingEnabled
{
  return self->_isExtraLoggingEnabled;
}

- (void)setIsExtraLoggingEnabled:(BOOL)a3
{
  self->_isExtraLoggingEnabled = a3;
}

- (BOOL)isWeeklySummaryEnabled
{
  return self->_isWeeklySummaryEnabled;
}

- (void)setIsWeeklySummaryEnabled:(BOOL)a3
{
  self->_isWeeklySummaryEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRegionRefreshDate, 0);
  objc_storeStrong((id *)&self->_statusChangeObserver, 0);
  objc_storeStrong((id *)&self->_lastExposureCheckTime, 0);
  objc_storeStrong((id *)&self->_latestNotification, 0);
  objc_storeStrong((id *)&self->_latestExposureCheckSession, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
  objc_storeStrong((id *)&self->_adapter, 0);

  objc_storeStrong((id *)&self->_exposureStore, 0);
}

@end