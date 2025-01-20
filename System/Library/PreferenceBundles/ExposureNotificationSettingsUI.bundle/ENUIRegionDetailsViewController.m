@interface ENUIRegionDetailsViewController
- (BOOL)_preAuthorizationFlag;
- (BOOL)_travelStatusFlag;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)didRefreshModelSinceLoading;
- (BOOL)didRequestRegionRemoval;
- (BOOL)isActiveRegion;
- (BOOL)isDataLoaded;
- (BOOL)isDaysUntilPreAuthExpiresValid;
- (BOOL)isRegionUsingApp;
- (BOOL)isShareAnalyticsRestricted;
- (ENUIRegionDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel)model;
- (id)_applessSpecifiers;
- (id)_headerSpecifiers;
- (id)_installedAppSpecifiers;
- (id)_preAuthorizationSpecifiers;
- (id)isKeyReleasePreAuthorized;
- (id)isShareTravelStatusEnabled;
- (id)readPreferenceValue:(id)a3;
- (id)shareAnalyticsEnabled;
- (id)shouldShareExposureInformation;
- (id)specifiers;
- (int64_t)_daysUntilPreAuthExpires;
- (int64_t)lastKnownStatus;
- (void)_refreshRegionAndReloadSpecifiers;
- (void)addFooterText:(id)a3 withLinkText:(id)a4 toGroup:(id)a5 action:(SEL)a6;
- (void)didConfirmRemoveRegion;
- (void)didTapAccessAppButton;
- (void)didTapDone;
- (void)didTapLearnMore;
- (void)didTapOpenExposureNotification;
- (void)didTapOpenWebsiteButton;
- (void)didTapRemoveRegion;
- (void)didTapSetActiveRegion;
- (void)didTapSetUpRegion;
- (void)didTapShareDiagnosisButton;
- (void)didToggleShareTravelStatus:(id)a3 specifier:(id)a4;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)refreshSwitchStates;
- (void)setDidRefreshModelSinceLoading:(BOOL)a3;
- (void)setDidRequestRegionRemoval:(BOOL)a3;
- (void)setIsDataLoaded:(BOOL)a3;
- (void)setLastKnownStatus:(int64_t)a3;
- (void)setModel:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)set_daysUntilPreAuthExpires:(int64_t)a3;
- (void)set_preAuthorizationFlag:(BOOL)a3;
- (void)set_travelStatusFlag:(BOOL)a3;
- (void)showController:(id)a3;
- (void)showController:(id)a3 animate:(BOOL)a4;
- (void)togglePreAuthorizationSwitch:(id)a3 specifier:(id)a4;
- (void)toggleShareAnalytics:(id)a3 specifier:(id)a4;
- (void)toggleShareExposureInformationSwitch:(id)a3 specifier:(id)a4;
- (void)viewDidLoad;
@end

@implementation ENUIRegionDetailsViewController

- (ENUIRegionDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ENUIRegionDetailsViewController;
  v4 = [(ENUIRegionDetailsViewController *)&v8 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    [(ENUIRegionDetailsViewController *)v4 setDidRequestRegionRemoval:0];
    v6 = v5;
  }

  return v5;
}

- (void)viewDidLoad
{
  v3 = [(ENUIRegionDetailsViewController *)self specifier];
  v4 = [v3 userInfo];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v6 = [(ENUIRegionDetailsViewController *)self specifier];
  v7 = [v6 userInfo];
  if (isKindOfClass)
  {
    [(ENUIRegionDetailsViewController *)self setModel:v7];

    [(ENUIRegionDetailsViewController *)self setDidRefreshModelSinceLoading:0];
  }
  else
  {
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();

    if (v8)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_13D08;
      v18[3] = &unk_2C758;
      v18[4] = self;
      +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel refreshRegionsWithCompletion:v18];
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)ENUIRegionDetailsViewController;
  [(ENUIRegionDetailsViewController *)&v17 viewDidLoad];
  v9 = [(ENUIRegionDetailsViewController *)self table];
  [v9 contentInset];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v16 = [(ENUIRegionDetailsViewController *)self table];
  objc_msgSend(v16, "setContentInset:", -36.0, v11, v13, v15);

  [(ENUIRegionDetailsViewController *)self refreshSwitchStates];
}

- (void)_refreshRegionAndReloadSpecifiers
{
  id location = 0;
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_13EE0;
  v2[3] = &unk_2CA90;
  objc_copyWeak(&v3, &location);
  +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel refreshRegionsWithCompletion:v2];
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)refreshSwitchStates
{
  id v3 = [(ENUIRegionDetailsViewController *)self model];

  if (v3)
  {
    v4 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    v6 = [(ENUIRegionDetailsViewController *)self model];
    v7 = [v6 region];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_14138;
    v19[3] = &unk_2C730;
    v19[4] = self;
    char v8 = v5;
    v20 = v8;
    [v4 isTravelStatusEnabledForRegion:v7 completion:v19];

    dispatch_group_enter(v8);
    v9 = [(ENUIRegionDetailsViewController *)self model];
    double v10 = [v9 region];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_14178;
    v16[3] = &unk_2D0F8;
    v16[4] = self;
    objc_super v17 = v8;
    id v11 = v4;
    id v18 = v11;
    double v12 = v8;
    [v11 isKeyReleasePreAuthorizedForRegion:v10 completion:v16];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_14524;
    block[3] = &unk_2C848;
    block[4] = self;
    id v15 = v11;
    id v13 = v11;
    dispatch_group_notify(v12, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (BOOL)isActiveRegion
{
  id v3 = +[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel activeRegion];
  if (([v3 regionIsPlaceholder] & 1) == 0)
  {
    v4 = [(ENUIRegionDetailsViewController *)self model];
    unsigned __int8 v5 = [v4 regionIsPlaceholder];

    if ((v5 & 1) == 0)
    {
      v6 = [v3 region];
      v7 = [(ENUIRegionDetailsViewController *)self model];
      char v8 = [v7 region];
      unsigned __int8 v10 = [v6 isEqual:v8];
      goto LABEL_7;
    }
  }
  v6 = [v3 appBundleId];
  if (v6)
  {
    v7 = [v3 appBundleId];
    char v8 = [(ENUIRegionDetailsViewController *)self model];
    v9 = [v8 appBundleId];
    unsigned __int8 v10 = [v7 isEqualToString:v9];

LABEL_7:
    goto LABEL_8;
  }
  unsigned __int8 v10 = 0;
LABEL_8:

  return v10;
}

- (void)addFooterText:(id)a3 withLinkText:(id)a4 toGroup:(id)a5 action:(SEL)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = (objc_class *)objc_opt_class();
  double v14 = NSStringFromClass(v13);
  [v10 setObject:v14 forKeyedSubscript:PSFooterCellClassGroupKey];

  [v10 setObject:v12 forKeyedSubscript:PSFooterHyperlinkViewTitleKey];
  id v15 = [v12 rangeOfString:v11];
  NSUInteger v17 = v16;

  v22.id location = (NSUInteger)v15;
  v22.length = v17;
  id v18 = NSStringFromRange(v22);
  [v10 setObject:v18 forKeyedSubscript:PSFooterHyperlinkViewLinkRangeKey];

  v19 = +[NSValue valueWithNonretainedObject:self];
  [v10 setObject:v19 forKeyedSubscript:PSFooterHyperlinkViewTargetKey];

  NSStringFromSelector(a6);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [v10 setObject:v20 forKeyedSubscript:PSFooterHyperlinkViewActionKey];
}

- (id)specifiers
{
  uint64_t v3 = [(ENUIRegionDetailsViewController *)self model];
  if (v3
    && (v4 = (void *)v3, unsigned int v5 = [(ENUIRegionDetailsViewController *)self isDataLoaded],
                         v4,
                         v5))
  {
    uint64_t v6 = OBJC_IVAR___PSListController__specifiers;
    v7 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      id v10 = objc_alloc_init((Class)NSMutableArray);
      id v11 = [(ENUIRegionDetailsViewController *)self _headerSpecifiers];
      [v10 addObjectsFromArray:v11];

      id v12 = [(ENUIRegionDetailsViewController *)self model];
      unsigned int v13 = [v12 isRegionUsingApp];

      if (v13) {
        [(ENUIRegionDetailsViewController *)self _installedAppSpecifiers];
      }
      else {
      double v14 = [(ENUIRegionDetailsViewController *)self _applessSpecifiers];
      }
      [v10 addObjectsFromArray:v14];

      id v15 = [v10 copy];
      NSUInteger v16 = *(void **)&self->PSListController_opaque[v6];
      *(void *)&self->PSListController_opaque[v6] = v15;

      id v8 = *(id *)&self->PSListController_opaque[v6];
    }
  }
  else
  {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

- (id)_headerSpecifiers
{
  uint64_t v3 = +[PSSpecifier groupSpecifierWithID:@"details-header-group"];
  v4 = +[PSSpecifier preferenceSpecifierNamed:&stru_2D820 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  unsigned int v5 = [(ENUIRegionDetailsViewController *)self model];
  [v4 setUserInfo:v5];

  [v4 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
  uint64_t v6 = PSEnabledKey;
  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:PSEnabledKey];
  v25[0] = v3;
  v25[1] = v4;
  v7 = +[NSArray arrayWithObjects:v25 count:2];
  id v8 = [v7 mutableCopy];

  v9 = +[PSSpecifier preferenceSpecifierNamed:&stru_2D820 target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v9 setObject:@"set-active-region" forKeyedSubscript:PSIDKey];
  if ((int *)[(ENUIRegionDetailsViewController *)self lastKnownStatus] == &dword_4)
  {
    id v10 = ENUILocalizedString();
    [v9 setName:v10];

    [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:v6];
    [v8 addObject:v9];
    id v11 = ENUILocalizedString();
    [v3 setObject:v11 forKeyedSubscript:PSFooterTextGroupKey];

    goto LABEL_10;
  }
  if ([(ENUIRegionDetailsViewController *)self isActiveRegion])
  {
    id v12 = ENUILocalizedString();
    [v9 setName:v12];

    [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:v6];
    [v8 addObject:v9];
LABEL_9:
    v19 = ENUILocalizedString();
    id v20 = [(ENUIRegionDetailsViewController *)self model];
    v21 = [v20 name];
    NSRange v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v21);
    [v3 setObject:v22 forKeyedSubscript:PSFooterTextGroupKey];

    goto LABEL_10;
  }
  unsigned int v13 = [(ENUIRegionDetailsViewController *)self model];
  if ([v13 isAuthorized])
  {

LABEL_8:
    NSUInteger v16 = ENUILocalizedString();
    [v9 setName:v16];

    NSUInteger v17 = [(ENUIRegionDetailsViewController *)self model];
    id v18 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v17 regionIsPlaceholder] ^ 1);
    [v9 setObject:v18 forKeyedSubscript:v6];

    [v9 setButtonAction:"didTapSetActiveRegion"];
    [v8 addObject:v9];
    goto LABEL_9;
  }
  double v14 = [(ENUIRegionDetailsViewController *)self model];
  unsigned int v15 = [v14 isRegionUsingApp];

  if (v15) {
    goto LABEL_8;
  }
  v24 = ENUILocalizedString();
  [v9 setName:v24];

  [v9 setButtonAction:"didTapSetUpRegion"];
  [v8 addObject:v9];
LABEL_10:

  return v8;
}

- (id)_preAuthorizationSpecifiers
{
  uint64_t v3 = objc_opt_new();
  v4 = +[PSSpecifier groupSpecifierWithID:@"preauthorization-info-group"];
  if ([(ENUIRegionDetailsViewController *)self _preAuthorizationFlag]
    && [(ENUIRegionDetailsViewController *)self isDaysUntilPreAuthExpiresValid])
  {
    unsigned int v5 = ENUILocalizedString();
    uint64_t v6 = [(ENUIRegionDetailsViewController *)self model];
    v7 = [v6 name];
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v7, [(ENUIRegionDetailsViewController *)self _daysUntilPreAuthExpires]);
  }
  else
  {
    id v8 = ENUILocalizedString();
  }
  [v4 setObject:v8 forKeyedSubscript:PSFooterTextGroupKey];
  v9 = ENUILocalizedString();
  id v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:"togglePreAuthorizationSwitch:specifier:" get:"isKeyReleasePreAuthorized" detail:0 cell:6 edit:0];

  [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
  id v11 = +[NSNumber numberWithBool:[(ENUIRegionDetailsViewController *)self _preAuthorizationFlag]];
  [v10 setObject:v11 forKeyedSubscript:PSEnabledKey];

  v14[0] = v4;
  v14[1] = v10;
  id v12 = +[NSArray arrayWithObjects:v14 count:2];
  [v3 addObjectsFromArray:v12];

  return v3;
}

- (id)_installedAppSpecifiers
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = +[PSSpecifier groupSpecifierWithID:@"access-app-group"];
  uint64_t v5 = ENUILocalizedString();
  uint64_t v6 = [(ENUIRegionDetailsViewController *)self model];
  v7 = [v6 name];
  v33 = (void *)v5;
  uint64_t v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v7);

  v32 = (void *)v8;
  v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v9 setButtonAction:"didTapAccessAppButton"];
  uint64_t v10 = PSAllowMultilineTitleKey;
  [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
  v34 = (void *)v4;
  v37[0] = v4;
  v37[1] = v9;
  id v11 = +[NSArray arrayWithObjects:v37 count:2];
  [v3 addObjectsFromArray:v11];

  v31 = [(ENUIRegionDetailsViewController *)self _preAuthorizationSpecifiers];
  objc_msgSend(v3, "addObjectsFromArray:");
  id v12 = +[PSSpecifier groupSpecifierWithID:@"share-exposure-info-group"];
  uint64_t v13 = ENUILocalizedString();
  double v14 = [(ENUIRegionDetailsViewController *)self model];
  uint64_t v15 = [v14 installedAppName];
  v30 = (void *)v13;
  NSUInteger v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v15);
  uint64_t v17 = PSFooterTextGroupKey;
  [v12 setObject:v16 forKeyedSubscript:PSFooterTextGroupKey];

  id v18 = ENUILocalizedString();
  v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:"toggleShareExposureInformationSwitch:specifier:" get:"shouldShareExposureInformation" detail:0 cell:6 edit:0];

  [v19 setObject:&__kCFBooleanTrue forKeyedSubscript:v10];
  v36[0] = v12;
  v36[1] = v19;
  id v20 = +[NSArray arrayWithObjects:v36 count:2];
  [v3 addObjectsFromArray:v20];

  v21 = [(ENUIRegionDetailsViewController *)self model];
  LOBYTE(v15) = [v21 regionIsPlaceholder];

  if ((v15 & 1) == 0)
  {
    NSRange v22 = +[PSSpecifier groupSpecifierWithID:@"travel-status-group"];
    v23 = ENUILocalizedString();
    [v22 setObject:v23 forKeyedSubscript:v17];

    v24 = ENUILocalizedString();
    v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:self set:"didToggleShareTravelStatus:specifier:" get:"isShareTravelStatusEnabled" detail:0 cell:6 edit:0];

    v26 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[CLLocationManager locationServicesEnabled]);
    [v25 setObject:v26 forKeyedSubscript:PSEnabledKey];

    [v25 setObject:&__kCFBooleanTrue forKeyedSubscript:v10];
    v35[0] = v22;
    v35[1] = v25;
    v27 = +[NSArray arrayWithObjects:v35 count:2];
    [v3 addObjectsFromArray:v27];
  }
  id v28 = [v3 copy];

  return v28;
}

- (id)_applessSpecifiers
{
  uint64_t v3 = objc_opt_new();
  if ((char *)[(ENUIRegionDetailsViewController *)self lastKnownStatus] != (char *)&dword_0 + 2
    && (int *)[(ENUIRegionDetailsViewController *)self lastKnownStatus] != &dword_4
    && (char *)[(ENUIRegionDetailsViewController *)self lastKnownStatus] != (char *)&dword_4 + 2)
  {
    uint64_t v4 = +[PSSpecifier groupSpecifierWithID:@"share-diagnosis"];
    uint64_t v5 = ENUILocalizedString();
    uint64_t v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v6 setButtonAction:"didTapShareDiagnosisButton"];
    [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
    v58[0] = v4;
    v58[1] = v6;
    v7 = +[NSArray arrayWithObjects:v58 count:2];
    [v3 addObjectsFromArray:v7];
  }
  v55 = [(ENUIRegionDetailsViewController *)self _preAuthorizationSpecifiers];
  objc_msgSend(v3, "addObjectsFromArray:");
  uint64_t v8 = [(ENUIRegionDetailsViewController *)self model];
  if ([v8 isAuthorized])
  {
    v9 = [(ENUIRegionDetailsViewController *)self model];
    uint64_t v10 = [v9 legalese];
    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  id v12 = [(ENUIRegionDetailsViewController *)self model];
  uint64_t v13 = [v12 regionWebsiteURL];
  double v14 = [v13 absoluteString];
  id v15 = [v14 length];

  if (!v11 && !v15)
  {
    if (!v11) {
      goto LABEL_11;
    }
LABEL_21:
    v38 = objc_opt_new();
    [v38 setDateStyle:1];
    v39 = +[NSLocale currentLocale];
    [v38 setLocale:v39];

    v40 = [(ENUIRegionDetailsViewController *)self model];
    v41 = [v40 consentStatus];
    v42 = [v41 dateConsented];
    v43 = [v38 stringFromDate:v42];

    v44 = +[PSSpecifier preferenceSpecifierNamed:&stru_2D820 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
    [v44 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
    v45 = ENUILocalizedString();
    [v44 setObject:v45 forKeyedSubscript:PSTitleKey];

    [v44 setObject:v43 forKeyedSubscript:PSValueKey];
    v46 = [(ENUIRegionDetailsViewController *)self model];
    [v44 setUserInfo:v46];

    [v3 addObject:v44];
    if (!v15) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v37 = +[PSSpecifier groupSpecifierWithID:@"legalese-and-website-group"];
  [v3 addObject:v37];

  if (v11) {
    goto LABEL_21;
  }
LABEL_11:
  if (v15)
  {
LABEL_12:
    NSUInteger v16 = ENUILocalizedString();
    uint64_t v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v17 setButtonAction:"didTapOpenWebsiteButton"];
    [v3 addObject:v17];
  }
LABEL_13:
  unsigned int v18 = [(ENUIRegionDetailsViewController *)self isShareAnalyticsRestricted];
  v19 = [(ENUIRegionDetailsViewController *)self model];
  unsigned __int8 v20 = [v19 wantsAnalytics];

  v21 = &CFBundleGetIdentifier_ptr;
  if ((v20 & 1) != 0 || v18)
  {
    v54 = +[PSSpecifier groupSpecifierWithID:@"share-analytics"];
    NSRange v22 = ENUILocalizedString();
    v23 = +[PSSpecifier preferenceSpecifierNamed:v22 target:self set:"toggleShareAnalytics:specifier:" get:"shareAnalyticsEnabled" detail:0 cell:6 edit:0];

    v24 = +[NSNumber numberWithInt:v18 ^ 1];
    [v23 setObject:v24 forKeyedSubscript:PSEnabledKey];

    uint64_t v25 = PSAllowMultilineTitleKey;
    [v23 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
    v26 = @"REGION_DETAIL_SHARE_ANALYTICS_FOOTER_%@";
    if (v18) {
      v26 = @"REGION_DETAIL_SHARE_ANALYTICS_RESTRICTED_FOOTER_%@";
    }
    v27 = v26;
    id v28 = ENUILocalizedString();
    v29 = ENUILocalizedString();

    v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v28);
    [(ENUIRegionDetailsViewController *)self addFooterText:v30 withLinkText:v28 toGroup:v54 action:"didTapLearnMore"];

    v31 = ENUILocalizedString();
    v32 = +[PSSpecifier preferenceSpecifierNamed:v31 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

    [v32 setObject:&__kCFBooleanTrue forKeyedSubscript:v25];
    v33 = [(ENUIRegionDetailsViewController *)self model];
    [v32 setUserInfo:v33];

    v57[0] = v54;
    v57[1] = v23;
    v57[2] = v32;
    v34 = +[NSArray arrayWithObjects:v57 count:3];
    [v3 addObjectsFromArray:v34];

    v21 = &CFBundleGetIdentifier_ptr;
  }
  v35 = [(ENUIRegionDetailsViewController *)self model];
  if ([v35 isAuthorized]) {
    uint64_t v36 = [(ENUIRegionDetailsViewController *)self didRequestRegionRemoval] ^ 1;
  }
  else {
    uint64_t v36 = 0;
  }

  v47 = +[PSSpecifier preferenceSpecifierNamed:&stru_2D820 target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v47 setObject:objc_opt_class() forKeyedSubscript:PSCellClassKey];
  v48 = ENUILocalizedString();
  [v47 setObject:v48 forKeyedSubscript:PSTitleKey];

  v49 = [v21[124] numberWithBool:v36];
  [v47 setObject:v49 forKeyedSubscript:PSEnabledKey];

  [v47 setButtonAction:"didTapRemoveRegion"];
  v50 = +[PSSpecifier groupSpecifierWithID:@"remove-region-group"];
  v56[0] = v50;
  v56[1] = v47;
  v51 = +[NSArray arrayWithObjects:v56 count:2];
  [v3 addObjectsFromArray:v51];

  id v52 = [v3 copy];

  return v52;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  uint64_t v5 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController];
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained handleURL:v7 withCompletion:v6];
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  uint64_t v5 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController];
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained setPreferenceValue:v7 specifier:v6];
}

- (id)readPreferenceValue:(id)a3
{
  uint64_t v3 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained readPreferenceValue:v4];

  return v6;
}

- (void)showController:(id)a3
{
  uint64_t v3 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained showController:v4];
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained showController:v6 animate:v4];
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (void)didTapAccessAppButton
{
  id v3 = [(ENUIRegionDetailsViewController *)self model];
  +[_TtC28HealthExposureNotificationUI20AppStoreAssetManager accessAppFor:v3 presentingViewController:self completion:&stru_2D118];
}

- (void)didTapOpenWebsiteButton
{
  id v5 = +[LSApplicationWorkspace defaultWorkspace];
  id v3 = [(ENUIRegionDetailsViewController *)self model];
  BOOL v4 = [v3 regionWebsiteURL];
  [v5 openURL:v4 withOptions:0];
}

- (void)didTapSetActiveRegion
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = [(ENUIRegionDetailsViewController *)self model];
  unsigned int v4 = [v3 regionIsPlaceholder];

  id v5 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
  id v6 = [(ENUIRegionDetailsViewController *)self model];
  if (v4)
  {
    id v7 = [v6 appBundleId];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_16138;
    v11[3] = &unk_2CD40;
    uint64_t v8 = &v12;
    objc_copyWeak(&v12, &location);
    [v5 setActivePhaseOneAppWithBundleIdentifier:v7 completion:v11];
  }
  else
  {
    id v7 = [v6 region];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_16178;
    v9[3] = &unk_2CD40;
    uint64_t v8 = &v10;
    objc_copyWeak(&v10, &location);
    [v5 setActiveRegion:v7 completion:v9];
  }

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (void)didTapSetUpRegion
{
  id v3 = [(ENUIRegionDetailsViewController *)self model];
  unsigned int v4 = [v3 regionIsPlaceholder];

  if (v4)
  {
    [(ENUIRegionDetailsViewController *)self _refreshRegionAndReloadSpecifiers];
  }
  else
  {
    id v5 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
    id location = 0;
    objc_initWeak(&location, self);
    id v6 = +[ENUIViewControllerFactory sharedInstance];
    id v7 = [(ENUIRegionDetailsViewController *)self model];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_163A4;
    v10[3] = &unk_2C978;
    objc_copyWeak(&v11, &location);
    uint64_t v8 = [v6 createOnboardingStackForAgencyModel:v7 exposureManager:v5 fromAvailabilityAlert:0 fromDeepLink:0 subsequentFlow:0 completion:v10];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_164D0;
    v9[3] = &unk_2C758;
    void v9[4] = self;
    [(ENUIRegionDetailsViewController *)self presentViewController:v8 animated:1 completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)didTapRemoveRegion
{
  uint64_t v3 = [(ENUIRegionDetailsViewController *)self model];
  if (v3)
  {
    unsigned int v4 = (void *)v3;
    id v5 = [(ENUIRegionDetailsViewController *)self model];
    unsigned __int8 v6 = [v5 isRegionUsingApp];

    if ((v6 & 1) == 0)
    {
      id v7 = ENUILocalizedString();
      uint64_t v8 = [(ENUIRegionDetailsViewController *)self model];
      v9 = [v8 name];
      id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9);

      id v11 = ENUILocalizedString();
      id v12 = ENUILocalizedString();
      uint64_t v13 = +[UIAlertController alertControllerWithTitle:v12 message:v10 preferredStyle:0];

      id location = 0;
      objc_initWeak(&location, self);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_167A4;
      v17[3] = &unk_2CCB8;
      objc_copyWeak(&v18, &location);
      double v14 = +[UIAlertAction actionWithTitle:v11 style:2 handler:v17];
      [v13 addAction:v14];

      id v15 = ENUILocalizedString();
      NSUInteger v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:0];
      [v13 addAction:v16];

      [(ENUIRegionDetailsViewController *)self presentViewController:v13 animated:1 completion:0];
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

- (void)didConfirmRemoveRegion
{
  uint64_t v3 = [(ENUIRegionDetailsViewController *)self model];

  if (v3)
  {
    [(ENUIRegionDetailsViewController *)self setDidRequestRegionRemoval:1];
    id location = 0;
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    void v14[2] = sub_169C8;
    v14[3] = &unk_2CA90;
    objc_copyWeak(&v15, &location);
    unsigned int v4 = objc_retainBlock(v14);
    id v5 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
    unsigned __int8 v6 = [(ENUIRegionDetailsViewController *)self model];
    id v7 = [v6 region];
    uint64_t v8 = [(ENUIRegionDetailsViewController *)self model];
    v9 = [v8 consentStatus];
    id v10 = [v9 versionConsented];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_16ABC;
    v12[3] = &unk_2D010;
    id v11 = v4;
    id v13 = v11;
    [v5 setUserConsent:1 region:v7 text:0 version:v10 completion:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)didToggleShareTravelStatus:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  unsigned __int8 v6 = [(ENUIRegionDetailsViewController *)self model];

  if (v6)
  {
    -[ENUIRegionDetailsViewController set_travelStatusFlag:](self, "set_travelStatusFlag:", [v5 BOOLValue]);
    id v7 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
    id v8 = [v5 BOOLValue];
    v9 = [(ENUIRegionDetailsViewController *)self model];
    id v10 = [v9 region];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_16C70;
    v11[3] = &unk_2CF48;
    void v11[4] = self;
    [v7 setTravelStatusEnabled:v8 region:v10 completion:v11];
  }
}

- (id)isShareTravelStatusEnabled
{
  BOOL v2 = [(ENUIRegionDetailsViewController *)self _travelStatusFlag];

  return +[NSNumber numberWithBool:v2];
}

- (void)toggleShareExposureInformationSwitch:(id)a3 specifier:(id)a4
{
  id v10 = a3;
  id v5 = [(ENUIRegionDetailsViewController *)self model];
  unsigned __int8 v6 = [v5 appBundleId];

  if (v6)
  {
    id v7 = [v10 BOOLValue];
    id v8 = [(ENUIRegionDetailsViewController *)self model];
    v9 = [v8 appBundleId];
    +[ENUITCCUtilities setExposureNotificationEnabled:v7 forBundleIdentifier:v9];

    [(ENUIRegionDetailsViewController *)self refreshSwitchStates];
  }
}

- (id)isKeyReleasePreAuthorized
{
  BOOL v2 = [(ENUIRegionDetailsViewController *)self _preAuthorizationFlag];

  return +[NSNumber numberWithBool:v2];
}

- (BOOL)isDaysUntilPreAuthExpiresValid
{
  return [(ENUIRegionDetailsViewController *)self _daysUntilPreAuthExpires] >= 1
      && [(ENUIRegionDetailsViewController *)self _daysUntilPreAuthExpires] < 6;
}

- (void)togglePreAuthorizationSwitch:(id)a3 specifier:(id)a4
{
  if (a3)
  {
    -[ENUIRegionDetailsViewController set_preAuthorizationFlag:](self, "set_preAuthorizationFlag:", [a3 BOOLValue]);
    id v5 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
    unsigned __int8 v6 = [(ENUIRegionDetailsViewController *)self model];
    id v7 = [v6 region];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_16F28;
    v9[3] = &unk_2CF48;
    void v9[4] = self;
    [v5 setPreAuthorizeDiagnosisKeysEnabled:0 forRegion:v7 completion:v9];
  }
  else
  {
    id v8 = ENUILogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1DD2C(v8);
    }

    [(ENUIRegionDetailsViewController *)self refreshSwitchStates];
  }
}

- (id)shouldShareExposureInformation
{
  uint64_t v3 = [(ENUIRegionDetailsViewController *)self model];
  unsigned int v4 = [v3 appBundleId];

  if (v4)
  {
    id v5 = [(ENUIRegionDetailsViewController *)self model];
    unsigned __int8 v6 = [v5 appBundleId];
    id v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[ENUITCCUtilities isExposureNotificationEnabledForBundleIdentifier:v6]);
  }
  else
  {
    id v7 = &__kCFBooleanFalse;
  }

  return v7;
}

- (void)didTapShareDiagnosisButton
{
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v3 = +[ENUIViewControllerFactory sharedInstance];
  unsigned int v4 = [(ENUIRegionDetailsViewController *)self model];
  id v5 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_171C8;
  id v11 = &unk_2C978;
  objc_copyWeak(&v12, &location);
  unsigned __int8 v6 = [v3 createVerificationStackForAgencyModel:v4 exposureManager:v5 sessionIdentifier:0 reportType:0 enteredFromMainScreen:0 completion:&v8];

  id v7 = [(ENUIRegionDetailsViewController *)self navigationController];
  [v7 presentViewController:v6 animated:1 completion:0];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)didTapOpenExposureNotification
{
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  BOOL v2 = +[NSURL URLWithString:@"prefs:root=EXPOSURE_NOTIFICATION"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (id)shareAnalyticsEnabled
{
  BOOL v2 = [(ENUIRegionDetailsViewController *)self model];
  BOOL v3 = [v2 analyticsConsentStatus] == (char *)&dword_0 + 2;

  return +[NSNumber numberWithBool:v3];
}

- (BOOL)isShareAnalyticsRestricted
{
  BOOL v2 = [(ENUIRegionDetailsViewController *)self model];
  BOOL v3 = [v2 analyticsConsentStatus] == &dword_4;

  return v3;
}

- (void)toggleShareAnalytics:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  if ([v5 BOOLValue])
  {
    unsigned __int8 v6 = +[ENUIViewControllerFactory sharedInstance];
    id v7 = [(ENUIRegionDetailsViewController *)self model];
    id v8 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1753C;
    v17[3] = &unk_2D168;
    void v17[4] = self;
    uint64_t v9 = [v6 createAnalyticsConsentStackForAgencyModel:v7 exposureManager:v8 completion:v17];

    id v10 = [(ENUIRegionDetailsViewController *)self navigationController];
    [v10 presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    id v11 = [(ENUIRegionDetailsViewController *)self model];
    [v11 setAnalyticsConsentStatus:1];

    uint64_t v9 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
    id v12 = [v5 BOOLValue];
    id v10 = [(ENUIRegionDetailsViewController *)self model];
    id v13 = [v10 region];
    double v14 = [(ENUIRegionDetailsViewController *)self model];
    id v15 = [v14 consentVersion];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_175AC;
    v16[3] = &unk_2CF48;
    v16[4] = self;
    [v9 setShareAnalyticsEnabled:v12 region:v13 version:v15 completion:v16];
  }
}

- (void)didTapLearnMore
{
  id v10 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.contacttracing"];
  BOOL v3 = [v10 splashController];
  [v3 setModalPresentationStyle:2];

  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"didTapDone"];
  id v5 = [v10 splashController];
  unsigned __int8 v6 = [v5 navigationItem];
  [v6 setRightBarButtonItem:v4];

  id v7 = objc_alloc((Class)UINavigationController);
  id v8 = [v10 splashController];
  id v9 = [v7 initWithRootViewController:v8];

  [(ENUIRegionDetailsViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)didTapDone
{
}

- (BOOL)_travelStatusFlag
{
  return self->__travelStatusFlag;
}

- (void)set_travelStatusFlag:(BOOL)a3
{
  self->__travelStatusFlag = a3;
}

- (BOOL)_preAuthorizationFlag
{
  return self->__preAuthorizationFlag;
}

- (void)set_preAuthorizationFlag:(BOOL)a3
{
  self->__preAuthorizationFlag = a3;
}

- (int64_t)_daysUntilPreAuthExpires
{
  return self->__daysUntilPreAuthExpires;
}

- (void)set_daysUntilPreAuthExpires:(int64_t)a3
{
  self->__daysUntilPreAuthExpires = a3;
}

- (BOOL)didRefreshModelSinceLoading
{
  return self->_didRefreshModelSinceLoading;
}

- (void)setDidRefreshModelSinceLoading:(BOOL)a3
{
  self->_didRefreshModelSinceLoading = a3;
}

- (BOOL)didRequestRegionRemoval
{
  return self->_didRequestRegionRemoval;
}

- (void)setDidRequestRegionRemoval:(BOOL)a3
{
  self->_didRequestRegionRemoval = a3;
}

- (_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
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

- (BOOL)isDataLoaded
{
  return self->_isDataLoaded;
}

- (void)setIsDataLoaded:(BOOL)a3
{
  self->_isDataLoaded = a3;
}

- (BOOL)isRegionUsingApp
{
  return self->_isRegionUsingApp;
}

- (void).cxx_destruct
{
}

@end