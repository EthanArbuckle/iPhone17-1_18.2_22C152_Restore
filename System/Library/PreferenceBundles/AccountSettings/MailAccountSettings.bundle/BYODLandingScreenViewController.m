@interface BYODLandingScreenViewController
+ (id)log;
- (ACAccount)loggedInUserAccount;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BYODLandingScreenViewController)initWithDomainList:(id)a3 acAccount:(id)a4;
- (BYODLandingScreenViewController)initWithDomainListAndTargetDomain:(id)a3 acAccount:(id)a4 targetDomain:(id)a5 domainState:(id)a6;
- (MatterhornUpsellManager)upsellManager;
- (id)_addNewDomainSpecifier;
- (id)_domainSpecifiers;
- (id)_showMatterhornSubsctiptionState;
- (id)specifiers;
- (id)valueForSpecifier:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_domainSpecifierWasTapped:(id)a3;
- (void)_editButtonTapped:(id)a3;
- (void)_fetchFamilyDetails:(id)a3;
- (void)_listDomain;
- (void)_openSubscribeLearnMore:(id)a3;
- (void)_refreshByodState:(id)a3;
- (void)_removeDomain:(id)a3 selectedSpecifier:(id)a4;
- (void)_showAddNewDomain:(id)a3;
- (void)_showBuyNewDomain:(id)a3;
- (void)_triggerManualDomainSetupFlow:(id)a3 showRedBadge:(BOOL)a4;
- (void)_triggerMatterhornSubscription:(id)a3;
- (void)dealloc;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)setLoggedInUserAccount:(id)a3;
- (void)setUpsellManager:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation BYODLandingScreenViewController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_51BEC;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7488 != -1) {
    dispatch_once(&qword_D7488, block);
  }
  v2 = (void *)qword_D7480;

  return v2;
}

- (BYODLandingScreenViewController)initWithDomainList:(id)a3 acAccount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BYODLandingScreenViewController;
  v9 = [(BYODLandingScreenViewController *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_loggedInUserAccount, a4);
    objc_storeStrong((id *)&v10->_domainList, a3);
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 removeObserver:v10 name:@"BYOD_REFRESH_NOTIFICATION" object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v10 selector:"_refreshByodState:" name:@"BYOD_REFRESH_NOTIFICATION" object:0];

    v10->_isEditing = 0;
    v13 = (FAFetchFamilyCircleRequest *)objc_alloc_init((Class)FAFetchFamilyCircleRequest);
    familyRequest = v10->_familyRequest;
    v10->_familyRequest = v13;

    [(FAFetchFamilyCircleRequest *)v10->_familyRequest setCachePolicy:1];
  }

  return v10;
}

- (BYODLandingScreenViewController)initWithDomainListAndTargetDomain:(id)a3 acAccount:(id)a4 targetDomain:(id)a5 domainState:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v13 = [(BYODLandingScreenViewController *)self initWithDomainList:a3 acAccount:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_targetDomain, a5);
    objc_storeStrong((id *)&v14->_domainState, a6);
  }

  return v14;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)BYODLandingScreenViewController;
  [(BYODLandingScreenViewController *)&v12 viewDidLoad];
  v3 = [(BYODLandingScreenViewController *)self navigationItem];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"BYOD_LANDING_SCREEN_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  [v3 setTitle:v5];

  v6 = [(BYODLandingScreenViewController *)self navigationItem];
  [v6 setHidesBackButton:0];

  if (self->_targetDomain)
  {
    id v7 = +[BYODLandingScreenViewController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      targetDomain = self->_targetDomain;
      *(_DWORD *)buf = 138412290;
      v14 = targetDomain;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Loading target domain: %@", buf, 0xCu);
    }

    v9 = [(BYODLandingScreenViewController *)self specifierForID:self->_targetDomain];
    if (v9)
    {
      [(BYODLandingScreenViewController *)self _domainSpecifierWasTapped:v9];
    }
    else
    {
      v10 = +[BYODLandingScreenViewController log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = self->_targetDomain;
        *(_DWORD *)buf = 138412290;
        v14 = v11;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Specifier not found for ID:%@.", buf, 0xCu);
      }
    }
  }
}

- (id)specifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = +[PSSpecifier groupSpecifierWithID:@"BYOD_LANDING_SPECIFIER_TITLE"];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"BYOD_LANDING_SCREEN_HEADER" value:&stru_B9F70 table:@"AccountPreferences"];
  [v4 setProperty:v6 forKey:PSFooterTextGroupKey];

  [v3 addObject:v4];
  if ([(BYODListDomain *)self->_domainList iCloudPlusSubscriptionExpired])
  {
    id v7 = [(BYODLandingScreenViewController *)self _showMatterhornSubsctiptionState];
    [v3 addObjectsFromArray:v7];
  }
  id v8 = [(BYODListDomain *)self->_domainList domains];
  id v9 = [v8 count];

  if (v9)
  {
    v10 = [(BYODLandingScreenViewController *)self _domainSpecifiers];
    [v3 addObjectsFromArray:v10];
  }
  else
  {
    id v11 = [(BYODLandingScreenViewController *)self table];
    unsigned int v12 = [v11 isEditing];

    if (!v12) {
      goto LABEL_8;
    }
    self->_isEditing = 0;
    v10 = [(BYODLandingScreenViewController *)self table];
    [v10 setEditing:self->_isEditing animated:1];
  }

LABEL_8:
  v13 = [(BYODListDomain *)self->_domainList domains];
  id v14 = [v13 count];
  unint64_t v15 = [(BYODListDomain *)self->_domainList maxDomainsAllowed];

  if ((unint64_t)v14 < v15)
  {
    objc_super v16 = [(BYODLandingScreenViewController *)self _addNewDomainSpecifier];
    [v3 addObjectsFromArray:v16];
  }
  uint64_t v17 = OBJC_IVAR___PSListController__specifiers;
  v18 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v19 = v3;

  id v20 = *(id *)&self->PSListController_opaque[v17];
  return v20;
}

- (id)_domainSpecifiers
{
  id v45 = objc_alloc_init((Class)NSMutableArray);
  v2 = +[PSSpecifier groupSpecifierWithID:@"BYOD_LANDING_SPECIFIER_DOMAIN_LIST_GROUP"];
  domainListGroupSpecifer = self->_domainListGroupSpecifer;
  self->_domainListGroupSpecifer = v2;

  v4 = self->_domainListGroupSpecifer;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [(PSSpecifier *)v4 setProperty:v6 forKey:PSHeaderCellClassGroupKey];

  id v7 = self->_domainListGroupSpecifer;
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"BYOD_LANDING_SCREEN_DOMAIN_LIST_HEADER" value:&stru_B9F70 table:@"AccountPreferences"];
  [(PSSpecifier *)v7 setProperty:v9 forKey:@"headerTitle"];

  if (self->_isEditing) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  [(PSSpecifier *)self->_domainListGroupSpecifer setProperty:v10 forKey:@"tableEditing"];
  -[PSSpecifier setTarget:](self->_domainListGroupSpecifer, "setTarget:");
  [(PSSpecifier *)self->_domainListGroupSpecifer setButtonAction:"_editButtonTapped:"];
  [v45 addObject:self->_domainListGroupSpecifer];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = [(BYODListDomain *)self->_domainList domains];
  id v11 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v11)
  {
    uint64_t v43 = PSCellClassKey;
    uint64_t v44 = *(void *)v48;
    uint64_t v42 = PSTitleKey;
    uint64_t v41 = PSTableCellSubtitleTextKey;
    uint64_t v39 = PSBadgeNumberKey;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v48 != v44) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v14 = [v13 name];
        unint64_t v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:2 edit:0];

        [v15 setProperty:&__kCFBooleanTrue forKey:@"isRowEditable"];
        [v15 setControllerLoadAction:"_domainSpecifierWasTapped:"];
        [v15 setProperty:objc_opt_class() forKey:v43];
        objc_super v16 = [v13 name];
        [v15 setProperty:v16 forKey:v42];

        uint64_t v17 = [v13 name];
        [v15 setIdentifier:v17];

        v18 = [v13 status];
        unsigned int v19 = [v18 isEqualToString:@"IN_PROGRESS"];

        if (!v19)
        {
          if (![v13 isShared])
          {
            if ([v13 isDomainModeSet])
            {
              v25 = +[NSBundle bundleForClass:objc_opt_class()];
              v21 = [v25 localizedStringForKey:@"BYOD_DOMAIN_NEXT_STEP_CREATE_CUSTOM_EMAIL_ADDRESS" value:&stru_B9F70 table:@"AccountPreferences"];

              [v15 setProperty:v21 forKey:v41];
            }
            else
            {
              if ([v13 isDomainModeSet]) {
                goto LABEL_31;
              }
              v21 = [v13 status];
              if ([v21 isEqualToString:@"COMPLETE"])
              {
                unsigned int v28 = [v13 isDomainPurchased];

                if (!v28) {
                  goto LABEL_31;
                }
                v29 = +[NSBundle bundleForClass:objc_opt_class()];
                v21 = [v29 localizedStringForKey:@"BYOD_DOMAIN_NEXT_STEP_SELECT_DOMAIN_SHARING_OPTIONS" value:&stru_B9F70 table:@"AccountPreferences"];

                [v15 setProperty:v21 forKey:v41];
              }
            }
            goto LABEL_30;
          }
          if ([v13 isOwner])
          {
            v22 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v23 = [v22 localizedStringForKey:@"BYOD_DOMAIN_SHARED_BY_ME" value:&stru_B9F70 table:@"AccountPreferences"];
            goto LABEL_21;
          }
          v26 = [v13 invitationStatus];
          unsigned int v27 = [v26 isEqualToString:@"INVITED"];

          if (v27)
          {
            v22 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v23 = [v22 localizedStringForKey:@"BYOD_MEMBER_PENDING_INVITE_DOMAIN_SUBTEXT" value:&stru_B9F70 table:@"AccountPreferences"];
LABEL_21:
            v21 = (void *)v23;
          }
          else
          {
            v22 = +[NSBundle bundleForClass:objc_opt_class()];
            v35 = [v22 localizedStringForKey:@"BYOD_DOMAIN_SHARED_BY_OWNER" value:&stru_B9F70 table:@"AccountPreferences"];
            v36 = [v13 owner];
            v37 = [v36 firstName];
            v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v35, v37);
          }
          [v15 setProperty:v21 forKey:v41];
          goto LABEL_30;
        }
        if ([v13 isDomainPurchased])
        {
          id v20 = +[NSBundle bundleForClass:objc_opt_class()];
          v21 = [v20 localizedStringForKey:@"BYOD_DOMAIN_VERIFICATION_IN_PROGRESS" value:&stru_B9F70 table:@"AccountPreferences"];

          [v15 setCellType:-1];
          [v15 setControllerLoadAction:0];
          [v15 setProperty:v21 forKey:v41];
        }
        else
        {
          v24 = [v13 verificationStatus];
          if ([v24 isEqualToString:@"NOT_STARTED"])
          {
          }
          else
          {
            v30 = [v13 verificationStatus];
            unsigned int v31 = [v30 isEqualToString:@"IN_PROGRESS"];

            if (!v31) {
              goto LABEL_31;
            }
          }
          v32 = +[NSNumberFormatter localizedStringFromNumber:&off_C03A8 numberStyle:0];
          [v15 setProperty:v32 forKey:v39];

          v21 = +[NSBundle bundleForClass:objc_opt_class()];
          v33 = [v21 localizedStringForKey:@"BYOD_DOMAIN_NEXT_STEP_VERIFY_EMAIL%1$ld" value:&stru_B9F70 table:@"AccountPreferences"];
          v34 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v33, [v13 pendingVerifyEmailCount]);
          [v15 setProperty:v34 forKey:v41];
        }
LABEL_30:

LABEL_31:
        [v45 addObject:v15];
      }
      id v11 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v11);
  }

  return v45;
}

- (id)_showMatterhornSubsctiptionState
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = +[PSSpecifier emptyGroupSpecifier];
  [v3 addObject:v4];

  v5 = +[PSSpecifier preferenceSpecifierNamed:&stru_B9F70 target:self set:0 get:0 detail:0 cell:4 edit:0];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"BYOD_MATTERHORN_UNSUBSCRIBE_INFO" value:&stru_B9F70 table:@"AccountPreferences"];
  id v8 = [(BYODListDomain *)self->_domainList iCloudPlusSubscriptionEndTimestamp];
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);

  [v5 setProperty:v9 forKey:PSTableCellSubtitleTextKey];
  [v5 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v3 addObject:v5];
  CFStringRef v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"BYOD_MATTERHORN_SUBSCRIBE_BUTTON" value:&stru_B9F70 table:@"AccountPreferences"];
  unsigned int v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v12 setButtonAction:"_triggerMatterhornSubscription:"];
  [v3 addObject:v12];
  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"BYOD_MATTERHORN_SUBSCRIBE_LEARN_MORE" value:&stru_B9F70 table:@"AccountPreferences"];
  unint64_t v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v15 setButtonAction:"_openSubscribeLearnMore:"];
  [v3 addObject:v15];

  return v3;
}

- (void)_domainSpecifierWasTapped:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "byod_startSpinner");
  v5 = [BYODGetDomainRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  id v7 = [(ACAccount *)loggedInUserAccount accountStore];
  id v8 = [v4 propertyForKey:@"label"];
  id v9 = [(BYODGetDomainRequest *)v5 initWithAccount:loggedInUserAccount accountStore:v7 domain:v8];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_53204;
  v11[3] = &unk_B9520;
  objc_copyWeak(&v13, &location);
  id v10 = v4;
  id v12 = v10;
  [(BYODGetDomainRequest *)v9 performRequestWithCallback:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_fetchFamilyDetails:(id)a3
{
  id v4 = a3;
  familyRequest = self->_familyRequest;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_544B8;
  v7[3] = &unk_B95C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(FAFetchFamilyCircleRequest *)familyRequest startRequestWithCompletionHandler:v7];
}

- (void)_triggerManualDomainSetupFlow:(id)a3 showRedBadge:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (_os_feature_enabled_impl())
  {
    id v7 = [BYODDomainManualSetupViewController alloc];
    id v8 = [v6 name];
    id v9 = [(BYODLandingScreenViewController *)self loggedInUserAccount];
    id v10 = [(BYODDomainManualSetupViewController *)v7 initWithDomainName:v8 acAccount:v9 showRedBadge:v4];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_549E0;
    v14[3] = &unk_B9010;
    v14[4] = self;
    id v11 = v10;
    unint64_t v15 = v11;
    id v12 = +[EFScheduler mainThreadScheduler];
    [v12 performBlock:v14];
  }
  else
  {
    id v11 = +[BYODLandingScreenViewController log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Mail.CustomEmailDomainManualSetupFlow feature is unavailable", v13, 2u);
    }
  }
}

- (id)_addNewDomainSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  BOOL v4 = +[PSSpecifier groupSpecifierWithID:@"BYOD_LANDING_SPECIFIER_ADD_NEW_DOMAIN_GROUP"];
  [v3 addObject:v4];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"BYOD_LANDING_SCREEN_ADD_DOMAIN_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:4 edit:0];

  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"BYOD_LANDING_SCREEN_ADD_DOMAIN_SUBTITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  [v7 setProperty:v9 forKey:PSTableCellSubtitleTextKey];

  [v7 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v7 setIdentifier:@"BYOD_LANDING_SCREEN_ADD_DOMAIN_SUBTITLE_ID"];
  [v3 addObject:v7];
  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"BYOD_LANDING_SCREEN_ADD_DOMAIN_OWNED_BUTTON_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  id v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v12 setButtonAction:"_showAddNewDomain:"];
  [v12 setIdentifier:@"BYOD_ADD_NEW_DOMAIN_BUTTON_SPECIFIER"];
  [v3 addObject:v12];
  if (_os_feature_enabled_impl()
    && [(BYODListDomain *)self->_domainList enablePurchaseDomain])
  {
    id v13 = +[NSBundle bundleForClass:objc_opt_class()];
    id v14 = [v13 localizedStringForKey:@"BYOD_LANDING_SCREEN_ADD_DOMAIN_BUY_BUTTON_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
    unint64_t v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v15 setButtonAction:"_showBuyNewDomain:"];
    [v15 setIdentifier:@"BYOD_BUY_NEW_DOMAIN_BUTTON_SPECIFIER"];
    [v3 addObject:v15];
  }

  return v3;
}

- (void)_showBuyNewDomain:(id)a3
{
  BOOL v4 = [[BYODSpinner alloc] initWithViewController:self];
  spinner = self->_spinner;
  self->_spinner = v4;

  [(BYODSpinner *)self->_spinner startSpinner];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v6 = [BYODDomainPurchaseEligibilityRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  id v8 = [(ACAccount *)loggedInUserAccount accountStore];
  id v9 = [(BYODDomainPurchaseEligibilityRequest *)v6 initWithAccount:loggedInUserAccount accountStore:v8];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_54F9C;
  v10[3] = &unk_B9150;
  objc_copyWeak(&v11, &location);
  [(BYODDomainPurchaseEligibilityRequest *)v9 performRequestWithCallback:v10];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)_showAddNewDomain:(id)a3
{
  id v6 = [[BYODChooseYouOrFamilyViewController alloc] initWithACAccount:self->_loggedInUserAccount domainPurchase:0 domainName:0];
  id v4 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v6];
  [v4 setModalPresentationStyle:1];
  [v4 setModalInPresentation:1];
  v5 = [(BYODLandingScreenViewController *)self parentViewController];
  [v5 presentViewController:v4 animated:1 completion:0];
}

- (id)valueForSpecifier:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:PSValueKey];

  return v3;
}

- (void)_refreshByodState:(id)a3
{
  id v4 = [BYODListDomainRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  id v6 = [(ACAccount *)loggedInUserAccount accountStore];
  id v7 = [(BYODListDomainRequest *)v4 initWithAccount:loggedInUserAccount accountStore:v6];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_554A0;
  v8[3] = &unk_B95E8;
  objc_copyWeak(&v9, &location);
  [(BYODListDomainRequest *)v7 performRequestWithCallback:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BYODLandingScreenViewController;
  [(BYODLandingScreenViewController *)&v4 dealloc];
}

- (void)_editButtonTapped:(id)a3
{
  self->_isEditing ^= 1u;
  id v4 = [(BYODLandingScreenViewController *)self table];
  [v4 setEditing:self->_isEditing animated:1];

  id v5 = [(PSSpecifier *)self->_domainListGroupSpecifer propertyForKey:@"headerView"];
  [v5 toggleDoneButton:self->_isEditing];
}

- (void)safariViewControllerDidFinish:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"BYOD_REFRESH_NOTIFICATION" object:0 userInfo:0];

  [(BYODLandingScreenViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(BYODLandingScreenViewController *)self specifierAtIndexPath:a4];
  id v8 = [v7 propertyForKey:@"isRowEditable"];
  unsigned int v9 = [v8 BOOLValue];

  int64_t v10 = [v6 isEditing] & v9;
  return v10;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v4 = [(BYODLandingScreenViewController *)self specifierAtIndexPath:a4];
  id v5 = [v4 propertyForKey:@"isRowEditable"];
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  if (a4 == 1)
  {
    id v8 = [(BYODLandingScreenViewController *)self specifierAtIndexPath:v7];
    unsigned int v9 = [v8 propertyForKey:PSTitleKey];
    int64_t v10 = [(BYODListDomain *)self->_domainList domainFromDomainName:v9];
    id v11 = v10;
    if (v10)
    {
      if ([v10 isOwner])
      {
        id v12 = [v11 status];
        unsigned int v13 = [v12 isEqualToString:@"COMPLETE"];

        if (v13)
        {
          id v14 = [[BYODStopUsingDomainViewController alloc] initWithAccount:self->_loggedInUserAccount domain:v11];
          id v15 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v14];
          objc_super v16 = +[NSNotificationCenter defaultCenter];
          [v16 removeObserver:self name:@"STOP_DOMAIN_NOTIFICATION" object:0];

          uint64_t v17 = +[NSNotificationCenter defaultCenter];
          [v17 addObserver:self selector:"_refreshByodState:" name:@"STOP_DOMAIN_NOTIFICATION" object:0];

          [(BYODLandingScreenViewController *)self presentViewController:v15 animated:1 completion:0];
        }
        else
        {
          [(BYODLandingScreenViewController *)self _removeDomain:v11 selectedSpecifier:v8];
        }
      }
      else
      {
        v34 = v9;
        v18 = +[NSBundle bundleForClass:objc_opt_class()];
        unsigned int v19 = [v18 localizedStringForKey:@"BYOD_MEMBER_LEAVE_DOMAIN_ALERT_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
        id v20 = [v11 name];
        v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v20);

        v22 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v23 = [v22 localizedStringForKey:@"BYOD_MEMBER_LEAVE_DOMAIN_ALERT_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
        v24 = [v11 name];
        uint64_t v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v24);

        v33 = (void *)v25;
        v26 = +[UIAlertController alertControllerWithTitle:v21 message:v25 preferredStyle:1];
        unsigned int v27 = +[NSBundle bundleForClass:objc_opt_class()];
        unsigned int v28 = [v27 localizedStringForKey:@"CANCEL_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
        v29 = +[UIAlertAction actionWithTitle:v28 style:1 handler:0];

        v30 = +[NSBundle bundleForClass:objc_opt_class()];
        unsigned int v31 = [v30 localizedStringForKey:@"BYOD_MEMBER_LEAVE_DOMAIN_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_55EC0;
        v35[3] = &unk_B8ED8;
        v35[4] = self;
        id v36 = v11;
        id v37 = v8;
        v32 = +[UIAlertAction actionWithTitle:v31 style:2 handler:v35];

        [v26 addAction:v29];
        [v26 addAction:v32];
        [v26 setPreferredAction:v32];
        [(BYODLandingScreenViewController *)self presentViewController:v26 animated:1 completion:0];

        unsigned int v9 = v34;
      }
    }
  }
}

- (void)_removeDomain:(id)a3 selectedSpecifier:(id)a4
{
  id v6 = a3;
  id v21 = a4;
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v22 = [v7 localizedStringForKey:@"BYOD_REMOVE_DOMAIN_ALERT_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];

  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v9 = [v8 localizedStringForKey:@"BYOD_REMOVE_DOMAIN_ALERT_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
  int64_t v10 = [v6 name];
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10);

  id v12 = +[UIAlertController alertControllerWithTitle:v22 message:v11 preferredStyle:1];
  unsigned int v13 = +[NSBundle bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"CANCEL_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  id v15 = +[UIAlertAction actionWithTitle:v14 style:0 handler:0];

  objc_super v16 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v17 = [v16 localizedStringForKey:@"BYOD_REMOVE_DOMAIN_BUTTON_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_56564;
  v23[3] = &unk_B8ED8;
  id v18 = v21;
  id v24 = v18;
  uint64_t v25 = self;
  id v19 = v6;
  id v26 = v19;
  id v20 = +[UIAlertAction actionWithTitle:v17 style:2 handler:v23];

  [v12 addAction:v15];
  [v12 addAction:v20];
  [v12 setPreferredAction:v20];
  [(BYODLandingScreenViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)_triggerMatterhornSubscription:(id)a3
{
  id v4 = objc_alloc_init(MatterhornUpsellManager);
  upsellManager = self->_upsellManager;
  self->_upsellManager = v4;

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v6 = [(BYODLandingScreenViewController *)self upsellManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_569F4;
  v7[3] = &unk_B9610;
  objc_copyWeak(&v8, &location);
  [v6 matterhornUpsell:@"settingsCustomDomain" forFeatureId:@"mail.custom-domains.transfer" withCompletion:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_listDomain
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = [BYODListDomainRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  id v5 = [(ACAccount *)loggedInUserAccount accountStore];
  id v6 = [(BYODListDomainRequest *)v3 initWithAccount:loggedInUserAccount accountStore:v5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_56C30;
  v7[3] = &unk_B95E8;
  objc_copyWeak(&v8, &location);
  [(BYODListDomainRequest *)v6 performRequestWithCallback:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

- (void)_openSubscribeLearnMore:(id)a3
{
  id v6 = +[UIApplication sharedApplication];
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"BYOD_MATTERHORN_SUBSCRIBE_LEARN_MORE_LINK" value:&stru_B9F70 table:@"AccountPreferences"];
  id v5 = +[NSURL URLWithString:v4];
  [v6 openURL:v5 withCompletionHandler:0];
}

- (ACAccount)loggedInUserAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 256, 1);
}

- (void)setLoggedInUserAccount:(id)a3
{
}

- (MatterhornUpsellManager)upsellManager
{
  return self->_upsellManager;
}

- (void)setUpsellManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upsellManager, 0);
  objc_storeStrong((id *)&self->_loggedInUserAccount, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_domainState, 0);
  objc_storeStrong((id *)&self->_domainListGroupSpecifer, 0);
  objc_storeStrong((id *)&self->_targetDomain, 0);
  objc_storeStrong((id *)&self->_domainList, 0);
  objc_storeStrong((id *)&self->_familyCircle, 0);

  objc_storeStrong((id *)&self->_familyRequest, 0);
}

@end