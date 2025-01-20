@interface BYODDomainDetailViewController
+ (id)log;
- (ACAccount)loggedInUserAccount;
- (BOOL)_doesMemberBelongToDomain:(id)a3;
- (BOOL)_isRowEditableAtIndexPath:(id)a3;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BYODDomainDetailViewController)initWithAccount:(id)a3 domain:(id)a4 domainState:(id)a5;
- (NSArray)dnsRecords;
- (PSSpecifier)finishSetupSpecifier;
- (PSSpecifier)viewInstructionSpecifier;
- (id)_addDomainMemberSpecifier;
- (id)_addExistingAddressButtonSpecifierForMember:(id)a3;
- (id)_catchAllEmailAddressSpecifier:(id)a3;
- (id)_catchAllEmailEnabledForSpecifier:(id)a3;
- (id)_domainEmailDetailSpecifierTitle;
- (id)_domainNameSpecifier;
- (id)_domainReverify;
- (id)_existingEmailAddress;
- (id)_finishSetupDomainSpecifier;
- (id)_getEmailList;
- (id)_getMemberEmailGroupID:(int64_t)a3;
- (id)_leaveDomainSpecifier;
- (id)_manageEmailAddressSpecifier;
- (id)_memberDetailSpecifiersByIdentifier:(id)a3 withFullName:(id)a4;
- (id)_resendVerificationSpecifier;
- (id)_specifierForRowIndex:(int64_t)a3;
- (id)_stopUsingDomainSpecifier;
- (id)_viewSetupInstructionSpecifier;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_getMemberTypeByDsid:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_addContentViewToOBController:(id)a3;
- (void)_addExistingAddressButtonTapped:(id)a3;
- (void)_deleteEmailFromServerForUser:(id)a3 specifier:(id)a4;
- (void)_domainStoppedNotification:(id)a3;
- (void)_editButtonTapped:(id)a3;
- (void)_fetchAvailableSendFrom;
- (void)_finishSetupDomainTapped:(id)a3;
- (void)_getMemberPhoto;
- (void)_leaveDomainTapped:(id)a3;
- (void)_loadDnsRecords:(id)a3;
- (void)_loadDomainDetails;
- (void)_mailSettingsTapped:(id)a3;
- (void)_manageEmailWasTapped:(id)a3;
- (void)_obContinueTapped:(id)a3;
- (void)_okButtonTapped:(id)a3;
- (void)_refreshDomainResultNotification:(id)a3;
- (void)_removeDomainMember:(id)a3;
- (void)_resendVerificationEmailButtonTapped:(id)a3;
- (void)_reverifyDomainButtonTapped:(id)a3;
- (void)_setBYODCatchAllEmailEnabled:(id)a3 specifier:(id)a4;
- (void)_shouldRemoveDomainMember:(id)a3 completion:(id)a4;
- (void)_showDomainConnectSignInAlert;
- (void)_showEmailSelectWelcomeScreen;
- (void)_showIntroScreen;
- (void)_stopUsingDomain:(id)a3;
- (void)_triggerManualDomainSetupFlow;
- (void)_viewInstructionSpecifierWasTapped:(id)a3;
- (void)dealloc;
- (void)reloadSpecifiers;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)setDnsRecords:(id)a3;
- (void)setFinishSetupSpecifier:(id)a3;
- (void)setLoggedInUserAccount:(id)a3;
- (void)setViewInstructionSpecifier:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation BYODDomainDetailViewController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_34228;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7408 != -1) {
    dispatch_once(&qword_D7408, block);
  }
  v2 = (void *)qword_D7400;

  return v2;
}

- (BYODDomainDetailViewController)initWithAccount:(id)a3 domain:(id)a4 domainState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)BYODDomainDetailViewController;
  v12 = [(BYODDomainDetailViewController *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_loggedInUserAccount, a3);
    objc_storeStrong((id *)&_domainResult, a4);
    id v14 = objc_alloc_init((Class)NSMutableArray);
    v15 = (void *)_memberLastEmailSpecifier;
    _memberLastEmailSpecifier = (uint64_t)v14;

    v16 = [v10 domain];
    unsigned int v17 = [v16 withFamily];

    if (v17)
    {
      id v18 = objc_alloc_init((Class)FAFetchFamilyCircleRequest);
      v19 = (void *)_byodFamilyRequest;
      _byodFamilyRequest = (uint64_t)v18;

      [(id)_byodFamilyRequest setCachePolicy:1];
    }
    objc_storeStrong((id *)&v13->_domainState, a5);
  }

  return v13;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)BYODDomainDetailViewController;
  [(BYODDomainDetailViewController *)&v12 viewDidLoad];
  v3 = [(BYODDomainDetailViewController *)self table];
  [v3 setAllowsSelectionDuringEditing:1];

  v4 = [(BYODDomainDetailViewController *)self navigationItem];
  v5 = [(id)_domainResult domain];
  v6 = [v5 name];
  [v4 setTitle:v6];

  domainState = self->_domainState;
  if (domainState && [(NSString *)domainState isEqualToString:@"manageEmail"])
  {
    v8 = self->_domainState;
    self->_domainState = 0;

    id v9 = [(BYODDomainDetailViewController *)self specifierForID:@"BYOD_MANAGE_EMAIL_SPECIFIER_ID"];
    [(BYODDomainDetailViewController *)self _manageEmailWasTapped:v9];
  }
  id v10 = [(id)_domainResult domain];
  unsigned int v11 = [v10 withFamily];

  if (v11) {
    [(BYODDomainDetailViewController *)self _getMemberPhoto];
  }
}

- (id)specifiers
{
  id v55 = objc_alloc_init((Class)NSMutableArray);
  v6 = [(id)_domainResult domain];
  v7 = [v6 status];

  v8 = [(id)_domainResult domain];
  v54 = [v8 verificationStatus];

  id v9 = [(id)_domainResult domain];
  v53 = [v9 reverificationStatus];

  id v10 = [(id)_domainResult domain];
  if (([v10 withEmailAddress] & 1) == 0
    && ([v7 isEqualToString:@"COMPLETE"] & 1) == 0)
  {
    unsigned int v11 = [v53 isEqualToString:@"NOT_STARTED"];

    if (!v11) {
      goto LABEL_10;
    }
    id v10 = +[PSSpecifier groupSpecifierWithID:@"BYOD_DOMAIN_GROUP_TITLE_ID"];
    if (([v54 isEqualToString:@"IN_PROGRESS"] & 1) != 0
      || [v7 isEqualToString:@"IN_PROGRESS"])
    {
      objc_super v12 = +[NSBundle bundleForClass:objc_opt_class()];
      id v13 = [v12 localizedStringForKey:@"BYOD_DOMAIN_VERIFICATION_TITLE_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
    }
    else
    {
      objc_super v12 = +[NSBundle bundleForClass:objc_opt_class()];
      id v13 = [v12 localizedStringForKey:@"DOMAIN_MANUAL_SETUP_STEPS_PAGE_HEADER" value:&stru_B9F70 table:@"AccountPreferences"];
    }

    [v10 setProperty:v13 forKey:PSFooterTextGroupKey];
    [v55 addObject:v10];
  }
LABEL_10:
  if ([v7 isEqualToString:@"COMPLETE"])
  {
    id v14 = [(BYODDomainDetailViewController *)self _domainNameSpecifier];
    [v55 addObjectsFromArray:v14];
  }
  v15 = [(id)_domainResult domain];
  if ([v15 withEmailAddress])
  {
    unsigned __int8 v16 = [v7 isEqualToString:@"COMPLETE"];

    if (v16) {
      goto LABEL_16;
    }
    v15 = [(BYODDomainDetailViewController *)self _domainEmailDetailSpecifierTitle];
    [v55 addObjectsFromArray:v15];
  }

LABEL_16:
  unsigned int v17 = [(id)_domainResult domain];
  if ([v17 isDomainConnect])
  {
LABEL_31:

    goto LABEL_32;
  }
  id v18 = [(id)_domainResult domain];
  v19 = [v18 reverificationStatus];
  uint64_t v2 = (uint64_t)[v19 isEqualToString:@"NOT_STARTED"];
  if ((v2 & 1) == 0)
  {
    v3 = [(id)_domainResult domain];
    v4 = [v3 reverificationStatus];
    if (![v4 isEqualToString:@"VERIFICATION_SUCCESS"])
    {
LABEL_26:

LABEL_27:
      goto LABEL_31;
    }
  }
  if (![v54 isEqualToString:@"NOT_STARTED"]
    || [v7 isEqualToString:@"COMPLETE"])
  {
    if ([v54 isEqualToString:@"FAILED"])
    {
      unsigned int v20 = [v7 isEqualToString:@"FAILED"];
      if (v2) {
        goto LABEL_23;
      }
      goto LABEL_29;
    }
    if (v2) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  unsigned int v20 = 1;
  if (v2)
  {
LABEL_23:

    if (!v20) {
      goto LABEL_32;
    }
    goto LABEL_30;
  }
LABEL_29:

  if (v20)
  {
LABEL_30:
    unsigned int v17 = [(BYODDomainDetailViewController *)self _viewSetupInstructionSpecifier];
    [v55 addObjectsFromArray:v17];
    goto LABEL_31;
  }
LABEL_32:
  if ([v7 isEqualToString:@"COMPLETE"]
    && (([v53 isEqualToString:@"VERIFICATION_IN_PROGRESS"] & 1) != 0
     || [v53 isEqualToString:@"VERIFICATION_FAILED"]))
  {
    objc_super v21 = [(BYODDomainDetailViewController *)self _domainReverify];
    [v55 addObjectsFromArray:v21];
  }
  v22 = [(id)_domainResult domain];
  v23 = [v22 reverificationStatus];
  unsigned __int8 v24 = [v23 isEqualToString:@"NOT_STARTED"];
  if ((v24 & 1) == 0)
  {
    v52 = [(id)_domainResult domain];
    v3 = [v52 reverificationStatus];
    if (![v3 isEqualToString:@"VERIFICATION_SUCCESS"])
    {

LABEL_58:
      goto LABEL_59;
    }
  }
  if ([v54 isEqualToString:@"NOT_STARTED"]
    && ![v7 isEqualToString:@"COMPLETE"]
    || [v54 isEqualToString:@"FAILED"]
    && ([v7 isEqualToString:@"FAILED"] & 1) != 0)
  {
    goto LABEL_45;
  }
  unsigned int v25 = [v54 isEqualToString:@"IN_PROGRESS"];
  if (v25)
  {
    uint64_t v2 = [(id)_domainResult domain];
    if ([(id)v2 withEmailAddress])
    {

LABEL_45:
      if ((v24 & 1) == 0)
      {
      }
LABEL_57:
      v22 = [(BYODDomainDetailViewController *)self _finishSetupDomainSpecifier];
      [v55 addObjectsFromArray:v22];
      goto LABEL_58;
    }
  }
  if (![v7 isEqualToString:@"DEFAULT_EMAIL_NOT_SELECTED"])
  {
    unsigned __int8 v27 = 0;
    if ((v25 & 1) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
  v26 = [(id)_domainResult domain];
  unsigned __int8 v27 = [v26 withEmailAddress];

  if (v25) {
LABEL_53:
  }

LABEL_54:
  if ((v24 & 1) == 0)
  {
  }
  if (v27) {
    goto LABEL_57;
  }
LABEL_59:
  if ([v7 isEqualToString:@"COMPLETE"])
  {
    v28 = [(BYODDomainDetailViewController *)self _manageEmailAddressSpecifier];
    [v55 addObjectsFromArray:v28];
  }
  if ([v7 isEqualToString:@"COMPLETE"])
  {
    if (_os_feature_enabled_impl())
    {
      v29 = [(id)_domainResult domain];
      unsigned int v30 = [v29 isOwner];

      if (v30)
      {
        v31 = [(id)_domainResult domain];
        v32 = [(BYODDomainDetailViewController *)self _catchAllEmailAddressSpecifier:v31];
        [v55 addObjectsFromArray:v32];
      }
    }
  }
  v33 = [(id)_domainResult domain];
  if (![v33 withEmailAddress]) {
    goto LABEL_68;
  }
  unsigned __int8 v34 = [v7 isEqualToString:@"COMPLETE"];

  if ((v34 & 1) == 0)
  {
    v33 = [(BYODDomainDetailViewController *)self _existingEmailAddress];
    [v55 addObjectsFromArray:v33];
LABEL_68:
  }
  v35 = [(id)_domainResult domain];
  if ([v35 withEmailAddress]
    && ([v7 isEqualToString:@"COMPLETE"] & 1) == 0)
  {
    unsigned int v36 = [(id)_domainResult hasUnverifiedEmail];

    if (!v36) {
      goto LABEL_74;
    }
    v35 = [(BYODDomainDetailViewController *)self _resendVerificationSpecifier];
    [v55 addObjectsFromArray:v35];
  }

LABEL_74:
  if ([v7 isEqualToString:@"COMPLETE"])
  {
    v37 = [(id)_domainResult domain];
    unsigned int v38 = [v37 isOwner];

    if (v38) {
      [(BYODDomainDetailViewController *)self _stopUsingDomainSpecifier];
    }
    else {
    v39 = [(BYODDomainDetailViewController *)self _leaveDomainSpecifier];
    }
    [v55 addObjectsFromArray:v39];
  }
  if ([v7 isEqualToString:@"COMPLETE"])
  {
    v40 = [(id)_domainResult domain];
    v41 = [v40 introScreenIndicator];
    unsigned int v42 = [v41 isEqualToString:@"NOT_SEEN"];

    if (v42) {
      [(BYODDomainDetailViewController *)self _showIntroScreen];
    }
  }
  v43 = +[NSNotificationCenter defaultCenter];
  [v43 removeObserver:self name:@"BYOD_DOMAIN_DATA_REFRESH_NOTIFICATION" object:0];

  v44 = +[NSNotificationCenter defaultCenter];
  [v44 addObserver:self selector:"_refreshDomainResultNotification:" name:@"BYOD_DOMAIN_DATA_REFRESH_NOTIFICATION" object:0];

  id v45 = [v55 copy];
  uint64_t v46 = OBJC_IVAR___PSListController__specifiers;
  v47 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v45;

  v48 = +[BYODDomainDetailViewController log];
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v49 = *(void *)&self->PSListController_opaque[v46];
    *(_DWORD *)buf = 138412290;
    uint64_t v57 = v49;
    _os_log_impl(&dword_0, v48, OS_LOG_TYPE_DEFAULT, "BYODDomainDetailViewController specifiers: returning %@ ", buf, 0xCu);
  }

  id v50 = *(id *)&self->PSListController_opaque[v46];
  return v50;
}

- (void)reloadSpecifiers
{
  v5.receiver = self;
  v5.super_class = (Class)BYODDomainDetailViewController;
  [(BYODDomainDetailViewController *)&v5 reloadSpecifiers];
  v3 = [(id)_domainResult domain];
  unsigned int v4 = [v3 withFamily];

  if (v4) {
    [(BYODDomainDetailViewController *)self _getMemberPhoto];
  }
}

- (id)_domainReverify
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v28 = +[PSSpecifier groupSpecifierWithID:@"BYOD_REVERIFY_DOMAIN"];
  [v3 addObject:v28];
  unsigned int v4 = [(id)_domainResult domain];
  unsigned int v5 = [v4 isOwner];

  if (v5)
  {
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"BYOD_DOMAIN_REVERIFY_TITLE_OWNER" value:&stru_B9F70 table:@"AccountPreferences"];
  }
  else
  {
    v8 = [(id)_domainResult domain];
    v6 = [v8 owner];

    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"BYOD_DOMAIN_REVERIFY_TITLE_MEMBER" value:&stru_B9F70 table:@"AccountPreferences"];
    unsigned int v11 = [v6 firstName];
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11);
  }
  objc_super v12 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v12 setIdentifier:@"reVerifySpecifierTitleID"];
  [v12 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v3 addObject:v12];
  id v13 = [(id)_domainResult domain];
  unsigned int v14 = [v13 isOwner];

  if (v14)
  {
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned __int8 v16 = [v15 localizedStringForKey:@"BYOD_REVERIFY_BUTTON" value:&stru_B9F70 table:@"AccountPreferences"];
    unsigned int v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v17 setButtonAction:"_reverifyDomainButtonTapped:"];
    id v18 = [(id)_domainResult domain];
    v19 = [v18 reverificationStatus];
    if ([v19 isEqualToString:@"VERIFICATION_IN_PROGRESS"])
    {

LABEL_7:
      unsigned int v20 = &__kCFBooleanFalse;
LABEL_13:
      [v17 setProperty:v20 forKey:PSEnabledKey];
      [v3 addObject:v17];

      goto LABEL_14;
    }
    objc_super v21 = [(id)_domainResult domain];
    v22 = [v21 reverificationStatus];
    if ([v22 isEqualToString:@"VERIFICATION_FAILED"])
    {
      v23 = [(id)_domainResult domain];
      unsigned __int8 v24 = [v23 verificationStatus];
      unsigned __int8 v27 = [v24 isEqualToString:@"IN_PROGRESS"];

      if (v27) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    unsigned int v20 = &__kCFBooleanTrue;
    goto LABEL_13;
  }
LABEL_14:
  id v25 = [v3 copy];

  return v25;
}

- (id)_resendVerificationSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v4 = +[PSSpecifier groupSpecifierWithID:@"BYOD_RESEND_VERIFICATION_EMAIL"];
  unsigned int v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"BYOD_RESEND_EMAIL_VERIFICATION_FOOTER" value:&stru_B9F70 table:@"AccountPreferences"];
  [v4 setProperty:v6 forKey:PSFooterTextGroupKey];

  [v3 addObject:v4];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"BYOD_RESEND_EMAIL_VERIFICATION_BUTTON_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v9 setButtonAction:"_resendVerificationEmailButtonTapped:"];
  [v9 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  [v3 addObject:v9];
  id v10 = [v3 copy];

  return v10;
}

- (id)_addDomainMemberSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  unsigned int v4 = [(id)_domainResult members];
  id v5 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v30;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v9 = [v8 memberIdentifier];
        int64_t v10 = [(BYODDomainDetailViewController *)self _getMemberTypeByDsid:v9];

        if (!v10)
        {
          unsigned int v11 = [v8 memberIdentifier];
          objc_super v12 = [v8 fullName];
          id v13 = [(BYODDomainDetailViewController *)self _memberDetailSpecifiersByIdentifier:v11 withFullName:v12];
          [v3 addObjectsFromArray:v13];

          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unsigned int v14 = objc_msgSend((id)_domainResult, "members", 0);
  id v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v26;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
        v19 = [v18 memberIdentifier];
        int64_t v20 = [(BYODDomainDetailViewController *)self _getMemberTypeByDsid:v19];

        if (v20)
        {
          objc_super v21 = [v18 memberIdentifier];
          v22 = [v18 fullName];
          v23 = [(BYODDomainDetailViewController *)self _memberDetailSpecifiersByIdentifier:v21 withFullName:v22];
          [v3 addObjectsFromArray:v23];
        }
      }
      id v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v15);
  }

  return v3;
}

- (void)_getMemberPhoto
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = [(id)_domainResult members];
  id v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v5);
        id location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, self);
        v7 = +[BYODContactsManager sharedInstance];
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_35D98;
        v9[3] = &unk_B92C0;
        objc_copyWeak(&v10, &location);
        v9[4] = v6;
        [v7 fetchAvatarImageForUser:v6 withCompletion:v9];

        objc_destroyWeak(&v10);
        objc_destroyWeak(&location);
        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
}

- (id)_existingEmailAddress
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v4 = [(id)_domainResult domain];
  unsigned int v5 = [v4 withFamily];

  if (v5)
  {
    uint64_t v6 = [(BYODDomainDetailViewController *)self _addDomainMemberSpecifier];
    [v3 addObjectsFromArray:v6];
  }
  else
  {
    uint64_t v6 = [(ACAccount *)self->_loggedInUserAccount normalizedDSID];
    v7 = [(ACAccount *)self->_loggedInUserAccount userFullName];
    v8 = [(BYODDomainDetailViewController *)self _memberDetailSpecifiersByIdentifier:v6 withFullName:v7];
    [v3 addObjectsFromArray:v8];
  }
  id v9 = [v3 copy];

  return v9;
}

- (int64_t)_getMemberTypeByDsid:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)_domainResult domain];
  unsigned int v5 = [v4 owner];
  uint64_t v6 = [v5 dsid];
  unsigned __int8 v7 = [v3 isEqualToString:v6];

  if (v7)
  {
    int64_t v8 = 0;
  }
  else
  {
    id v9 = [(id)_domainResult members];
    id v10 = +[NSPredicate predicateWithFormat:@"dsid MATCHES %@", v3];
    unsigned int v11 = [v9 filteredArrayUsingPredicate:v10];

    if ([v11 count])
    {
      long long v12 = [v11 firstObject];
      unsigned int v13 = [v12 isFamilyMember];

      if (v13) {
        int64_t v8 = 1;
      }
      else {
        int64_t v8 = 2;
      }
    }
    else
    {
      int64_t v8 = 2;
    }
  }
  return v8;
}

- (id)_memberDetailSpecifiersByIdentifier:(id)a3 withFullName:(id)a4
{
  id v5 = a3;
  id v45 = a4;
  uint64_t v46 = v5;
  id v51 = objc_alloc_init((Class)NSMutableArray);
  id obj = +[PSSpecifier groupSpecifierWithID:v5];
  [obj setButtonAction:"_editButtonTapped:"];
  [obj setTarget:self];
  [v51 addObject:obj];
  v47 = +[PSSpecifier preferenceSpecifierNamed:v45 target:self set:0 get:0 detail:0 cell:4 edit:0];
  [v47 setProperty:v5 forKey:@"MEMBER_DSID"];
  uint64_t v6 = +[NSString stringWithFormat:@"MEMBER_%@", v5];
  [v47 setIdentifier:v6];

  unsigned __int8 v7 = [(id)_domainResult domain];
  LOBYTE(v5) = [v7 withFamily];

  if ((v5 & 1) == 0)
  {
    int64_t v8 = +[BYODContactsManager sharedInstance];
    id v9 = [v8 avatarImageForMeContact];

    if (!v9)
    {
      id v10 = +[BYODContactsManager sharedInstance];
      unsigned int v11 = [(ACAccount *)self->_loggedInUserAccount aa_firstName];
      long long v12 = [(ACAccount *)self->_loggedInUserAccount aa_lastName];
      id v9 = [v10 monogramWithFirstName:v11 andLastName:v12];
    }
    [v47 setProperty:v9 forKey:PSIconImageKey];
  }
  int64_t v13 = [(BYODDomainDetailViewController *)self _getMemberTypeByDsid:v46];
  if (v13)
  {
    if (v13 == 1)
    {
      long long v14 = +[NSBundle bundleForClass:objc_opt_class()];
      long long v15 = [v14 localizedStringForKey:@"BYOD_FAMILY_MEMBER_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
      [v47 setProperty:v15 forKey:PSTableCellSubtitleTextKey];
    }
    else
    {
      if (v13 != 2) {
        goto LABEL_14;
      }
      long long v14 = +[NSBundle bundleForClass:objc_opt_class()];
      long long v15 = [v14 localizedStringForKey:@"BYOD_INVITE_NON_MEMBER_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
      [v47 setProperty:v15 forKey:PSTableCellSubtitleTextKey];
    }

    [v47 setProperty:&__kCFBooleanTrue forKey:@"editableSpecifier"];
  }
  else
  {
    uint64_t v16 = (objc_class *)objc_opt_class();
    unsigned int v17 = NSStringFromClass(v16);
    [obj setProperty:v17 forKey:PSHeaderCellClassGroupKey];

    id v18 = +[NSBundle bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"BYOD_EXISTING_EMAIL_ADDRESSES" value:&stru_B9F70 table:@"AccountPreferences"];
    [obj setProperty:v19 forKey:@"headerTitle"];

    int64_t v20 = +[NSBundle bundleForClass:objc_opt_class()];
    objc_super v21 = [v20 localizedStringForKey:@"BYOD_DOMAIN_OWNER_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
    [v47 setProperty:v21 forKey:PSTableCellSubtitleTextKey];

    [v47 setProperty:&__kCFBooleanFalse forKey:@"editableSpecifier"];
    if (isEditing) {
      [obj setProperty:@"YES" forKey:@"tableEditing"];
    }
    objc_storeStrong((id *)&_emailDetailGroupSpecifierHeader, obj);
  }
LABEL_14:
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = PSCellClassKey;
  [v47 setProperty:v22 forKey:PSCellClassKey];
  [v51 addObject:v47];
  id v24 = v47;
  [(id)_domainResult getMemberFromIdentifier:v46];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  uint64_t v49 = v53 = 0u;
  id v48 = [v49 emails];
  id v25 = [v48 countByEnumeratingWithState:&v52 objects:v56 count:16];
  long long v26 = v24;
  v43 = v24;
  if (v25)
  {
    uint64_t v27 = *(void *)v53;
    uint64_t v28 = PSTableCellSubtitleTextKey;
    long long v26 = v24;
    do
    {
      long long v29 = 0;
      long long v30 = v26;
      do
      {
        if (*(void *)v53 != v27) {
          objc_enumerationMutation(v48);
        }
        long long v31 = *(void **)(*((void *)&v52 + 1) + 8 * (void)v29);
        long long v32 = [v31 email];
        long long v26 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v32, self, 0, 0, 0, 4, 0, v43);

        v33 = [v31 status];
        LODWORD(v32) = [v33 isEqualToString:@"VERIFIED"];

        unsigned __int8 v34 = +[NSBundle bundleForClass:objc_opt_class()];
        if (v32) {
          [v34 localizedStringForKey:@"BYOD_EMAIL_VERIFIED_STATUS_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
        }
        else {
        v35 = [v34 localizedStringForKey:@"BYOD_EMAIL_PENDING_STATUS_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
        }
        [v26 setProperty:v35 forKey:v28];

        [v26 setProperty:objc_opt_class() forKey:v23];
        unsigned int v36 = [v49 memberIdentifier];
        [v26 setProperty:v36 forKey:@"MEMBER_DSID"];

        [v26 setProperty:&__kCFBooleanTrue forKey:@"editableSpecifier"];
        [v51 addObject:v26];

        long long v29 = (char *)v29 + 1;
        long long v30 = v26;
      }
      while (v25 != v29);
      id v25 = [v48 countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v25);
  }

  [(id)_memberLastEmailSpecifier addObject:v26];
  if (isEditing)
  {
    v37 = [v49 emails];
    id v38 = [v37 count];
    LODWORD(v38) = v38 < [(id)_domainResult maxEmailsPerUser];

    if (v38)
    {
      v39 = [v49 memberIdentifier];
      v40 = [(BYODDomainDetailViewController *)self _addExistingAddressButtonSpecifierForMember:v39];

      [v51 addObject:v40];
    }
  }
  id v41 = [v51 copy];

  return v41;
}

- (id)_domainEmailDetailSpecifierTitle
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  id v3 = +[PSSpecifier groupSpecifierWithID:@"BYOD_EMAIL_DETAIL_TITLE_GROUP_ID"];
  if ([(id)_domainResult hasUnverifiedEmail])
  {
    uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"BYOD_UNVERIFIED_EMAILS_SPECIFIER_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
LABEL_9:
    long long v14 = (void *)v5;
    goto LABEL_10;
  }
  uint64_t v6 = [(id)_domainResult domain];
  unsigned __int8 v7 = [v6 verificationStatus];
  unsigned int v8 = [v7 isEqualToString:@"NOT_STARTED"];

  if (v8)
  {
    uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"BYOD_VERIFIED_EMAILS_DOMAIN_NOT_VERIFIED_SPECIFIER_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
    goto LABEL_9;
  }
  id v9 = [(id)_domainResult domain];
  id v10 = [v9 verificationStatus];
  if ([v10 isEqualToString:@"IN_PROGRESS"])
  {

LABEL_8:
    uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"BYOD_DOMAIN_VERIFICATION_TITLE_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
    goto LABEL_9;
  }
  unsigned int v11 = [(id)_domainResult domain];
  long long v12 = [v11 verificationStatus];
  unsigned int v13 = [v12 isEqualToString:@"FAILED"];

  if (v13) {
    goto LABEL_8;
  }
  uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v17 = [v4 localizedStringForKey:@"BYOD_VERIFIED_EMAILS_DOMAIN_VERIFIED_SPECIFIER_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  id v18 = [(id)_domainResult domain];
  v19 = [v18 name];
  long long v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v19);

LABEL_10:
  [v3 setProperty:v14 forKey:PSFooterTextGroupKey];
  [v2 addObject:v3];
  id v15 = [v2 copy];

  return v15;
}

- (id)_viewSetupInstructionSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v4 = [(id)_domainResult domain];
  unsigned __int8 v5 = [v4 isDomainConnect];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = +[PSSpecifier groupSpecifierWithID:@"BYOD_DOMAIN_VIEW_INSTRUCTION_GROUP_SPECIFIER"];
    unsigned __int8 v7 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v8 = [v7 localizedStringForKey:@"DOMAIN_MANUAL_SETUP_VIEW_INSTRUCTION_FOOTER" value:&stru_B9F70 table:@"AccountPreferences"];
    [v6 setProperty:v8 forKey:PSFooterTextGroupKey];

    [v3 addObject:v6];
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"DOMAIN_MANUAL_SETUP_VIEW_INSTRUCTION_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
    unsigned int v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:1 edit:0];

    [v11 setIdentifier:@"BYOD_DOMAIN_VIEW_INSTRUCTION_SPECIFIER_ID"];
    [v11 setControllerLoadAction:"_viewInstructionSpecifierWasTapped:"];
    [v11 setProperty:objc_opt_class() forKey:PSCellClassKey];
    if ([(id)_domainResult hasUnverifiedEmail])
    {
      long long v12 = +[NSNumber numberWithBool:0];
      [v11 setProperty:v12 forKey:PSEnabledKey];
    }
    else
    {
      long long v12 = +[NSNumberFormatter localizedStringFromNumber:&off_C0378 numberStyle:0];
      [v11 setProperty:v12 forKey:PSBadgeNumberKey];
    }

    [v3 addObject:v11];
    [(BYODDomainDetailViewController *)self setViewInstructionSpecifier:v11];
  }
  id v13 = [v3 copy];

  return v13;
}

- (void)_loadDnsRecords:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(BYODDomainDetailViewController *)self dnsRecords];
  id v6 = [v5 count];

  if (v6)
  {
    unsigned __int8 v7 = [BYODDomainSetupInstructionViewController alloc];
    unsigned int v8 = [(BYODDomainDetailViewController *)self dnsRecords];
    id v9 = [(BYODDomainSetupInstructionViewController *)v7 initWithDnsRecords:v8];

    id v10 = v9;
    int64_t v20 = v10;
    unsigned int v11 = +[EFScheduler mainThreadScheduler];
    [v11 performBlock:&v19];
  }
  else
  {
    objc_msgSend(v4, "byod_startSpinner");
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    long long v12 = +[BYODDomainDetailViewController log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "load DNS records", buf, 2u);
    }

    id v13 = [BYODGetDnsRecordsRequest alloc];
    loggedInUserAccount = self->_loggedInUserAccount;
    id v15 = [(ACAccount *)loggedInUserAccount accountStore];
    uint64_t v16 = [(id)_domainResult domain];
    unsigned int v17 = [v16 name];
    id v18 = [(BYODGetDnsRecordsRequest *)v13 initWithAccount:loggedInUserAccount accountStore:v15 domain:v17];

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_37530;
    v21[3] = &unk_B92E8;
    objc_copyWeak(&v23, &location);
    id v22 = v4;
    [(BYODGetDnsRecordsRequest *)v18 performRequestWithCallback:v21];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

- (id)_finishSetupDomainSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = &ACUIDescriptionFromEmailAddress_ptr;
  long long v29 = +[PSSpecifier groupSpecifierWithID:@"BYOD_FINISH_SETUP_GROUP_ID"];
  if ([(id)_domainResult hasUnverifiedEmail])
  {
    unsigned __int8 v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"BYOD_FINISH_SETUP_FOOTER" value:&stru_B9F70 table:@"AccountPreferences"];
    [v29 setProperty:v6 forKey:PSFooterTextGroupKey];
LABEL_3:

LABEL_4:
    goto LABEL_5;
  }
  id v13 = [(id)_domainResult domain];
  long long v14 = [v13 verificationStatus];
  unsigned int v15 = [v14 isEqualToString:@"NOT_STARTED"];

  if (v15)
  {
    uint64_t v16 = [(id)_domainResult domain];
    unsigned int v17 = [v16 isDomainConnect];

    unsigned __int8 v5 = +[NSBundle bundleForClass:objc_opt_class()];
    if (v17) {
      [v5 localizedStringForKey:@"BYOD_FINISH_SETUP_DOMAIN_VERIFICATION_NOT_STARTED_FOOTER" value:&stru_B9F70 table:@"AccountPreferences"];
    }
    else {
    id v6 = [v5 localizedStringForKey:@"DOMAIN_MANUAL_SETUP_FINISH_SETUP_FOOTER" value:&stru_B9F70 table:@"AccountPreferences"];
    }
    [v29 setProperty:v6 forKey:PSFooterTextGroupKey];
    goto LABEL_3;
  }
  id v18 = [(id)_domainResult domain];
  uint64_t v19 = [v18 status];
  unsigned int v20 = [v19 isEqualToString:@"FAILED"];

  if (v20)
  {
    objc_super v21 = +[NSBundle bundleForClass:objc_opt_class()];
    id v22 = [v21 localizedStringForKey:@"BYOD_FINISH_SETUP_DOMAIN_VERIFICATION_FAILED_FOOTER" value:&stru_B9F70 table:@"AccountPreferences"];
    id v23 = [(id)_domainResult domain];
    id v24 = [v23 name];
    unsigned __int8 v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v24);

    [v29 setProperty:v5 forKey:PSFooterTextGroupKey];
    id v4 = &ACUIDescriptionFromEmailAddress_ptr;
    goto LABEL_4;
  }
LABEL_5:
  [v3 addObject:v29];
  unsigned __int8 v7 = v4[286];
  unsigned int v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"BYOD_FINISH_SETUP_SPECIFIER" value:&stru_B9F70 table:@"AccountPreferences"];
  id v10 = [v7 preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v10 setButtonAction:"_finishSetupDomainTapped:"];
  if (([(id)_domainResult hasUnverifiedEmail] & 1) == 0)
  {
    unsigned int v11 = [(id)_domainResult domain];
    long long v12 = [v11 verificationStatus];
    if ([v12 isEqualToString:@"IN_PROGRESS"])
    {
    }
    else
    {
      id v25 = [(id)_domainResult domain];
      unsigned __int8 v26 = [v25 isDomainConnect];

      if (v26) {
        goto LABEL_16;
      }
    }
  }
  [v10 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
LABEL_16:
  [v10 setIdentifier:@"FINISH_DOMAIN_SETUP_SPECIFIER_ID"];
  [(BYODDomainDetailViewController *)self setFinishSetupSpecifier:v10];
  [v3 addObject:v10];
  id v27 = [v3 copy];

  return v27;
}

- (id)_domainNameSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[PSSpecifier groupSpecifierWithID:@"BYOD_DOMAIN_NAME_SPECIFIER_ID"];
  unsigned __int8 v5 = [(id)_domainResult domain];
  unsigned int v6 = [v5 isOwner];

  if (v6)
  {
    unsigned __int8 v7 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v8 = [v7 localizedStringForKey:@"BYOD_DOMAIN_NAME_INFO_TITLE_ADD" value:&stru_B9F70 table:@"AccountPreferences"];

    id v9 = [(id)_domainResult domain];
    unsigned int v10 = [v9 isDomainPurchased];

    if (v10)
    {
      unsigned int v11 = +[NSBundle bundleForClass:objc_opt_class()];
      v35 = v4;
      long long v12 = [v11 localizedStringForKey:@"BYOD_DOMAIN_NAME_INFO_TITLE_PURCHASE" value:&stru_B9F70 table:@"AccountPreferences"];
      id v13 = [(id)_domainResult domain];
      long long v14 = [v13 domainPurchaseProviderName];
      uint64_t v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v14);

      unsigned int v8 = (void *)v15;
      id v4 = v35;
    }
    [v4 setProperty:v8 forKey:PSFooterTextGroupKey];
  }
  else
  {
    unsigned int v8 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v16 = [v8 localizedStringForKey:@"BYOD_DOMAIN_NAME_INFO_TITLE_MEMBER" value:&stru_B9F70 table:@"AccountPreferences"];
    [v4 setProperty:v16 forKey:PSFooterTextGroupKey];
  }
  [v3 addObject:v4];
  unsigned int v17 = [(id)_domainResult domain];
  id v18 = [v17 name];
  uint64_t v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:0 cell:4 edit:0];

  unsigned int v20 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v21 = [v20 localizedStringForKey:@"BYOD_DOMAIN_NAME_INFO_SUBTITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  [v19 setProperty:v21 forKey:PSTableCellSubtitleTextKey];

  [v19 setProperty:objc_opt_class() forKey:PSCellClassKey];
  id v22 = [(id)_domainResult domain];
  id v23 = [v22 name];
  [v19 setIdentifier:v23];

  id v24 = +[NSBundle bundleForClass:objc_opt_class()];
  id v25 = +[UIImage imageNamed:@"CustomDomainRowIconL.png" inBundle:v24];

  [v19 setProperty:v25 forKey:PSIconImageKey];
  PSTextViewInsets();
  double v27 = v26;
  double v29 = v28;
  [v25 size];
  double v31 = v29 + v27 + v30;
  *(float *)&double v31 = v31;
  long long v32 = +[NSNumber numberWithFloat:v31];
  [v19 setProperty:v32 forKey:PSTableCellHeightKey];
  [v3 addObject:v19];
  id v33 = [v3 copy];

  return v33;
}

- (id)_manageEmailAddressSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[PSSpecifier groupSpecifierWithID:@"BYOD_MANAGE_DOMAIN_GROUP"];
  unsigned __int8 v5 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v6 = [v5 localizedStringForKey:@"BYOD_MANAGE_DOMAIN_EMAIL_FOOTER" value:&stru_B9F70 table:@"AccountPreferences"];
  [v4 setProperty:v6 forKey:PSFooterTextGroupKey];

  [v3 addObject:v4];
  unsigned __int8 v7 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v8 = [v7 localizedStringForKey:@"BYOD_MANAGE_DOMAIN_EMAIL_SPECIFIER_NAME" value:&stru_B9F70 table:@"AccountPreferences"];
  id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:2 edit:0];

  [v9 setIdentifier:@"BYOD_MANAGE_EMAIL_SPECIFIER_ID"];
  [v9 setControllerLoadAction:"_manageEmailWasTapped:"];
  [v3 addObject:v9];
  id v10 = [v3 copy];

  return v10;
}

- (id)_catchAllEmailAddressSpecifier:(id)a3
{
  id v24 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  unsigned __int8 v5 = +[PSSpecifier groupSpecifierWithID:@"BYOD_CATCH_ALL_GROUP_ID"];
  unsigned int v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v23 = self;
  unsigned __int8 v7 = [v6 localizedStringForKey:@"BYOD_CATCH_ALL_EMAIL_FOOTER_LEARN_MORE" value:&stru_B9F70 table:@"AccountPreferences"];

  unsigned int v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"BYOD_CATCH_ALL_EMAIL_FOOTER" value:&stru_B9F70 table:@"AccountPreferences"];
  id v10 = [v24 name];
  unsigned int v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10);
  long long v12 = +[NSString stringWithFormat:@"%@ %@", v11, v7];

  id v13 = (objc_class *)objc_opt_class();
  long long v14 = NSStringFromClass(v13);
  [v5 setProperty:v14 forKey:PSFooterCellClassGroupKey];

  [v5 setProperty:v12 forKey:PSFooterHyperlinkViewTitleKey];
  v26.id location = (NSUInteger)[v12 rangeOfString:v7];
  uint64_t v15 = NSStringFromRange(v26);
  [v5 setProperty:v15 forKey:PSFooterHyperlinkViewLinkRangeKey];

  uint64_t v16 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v17 = [v16 localizedStringForKey:@"BYOD_CATCH_ALL_EMAIL_FOOTER_LEARN_MORE_LINK" value:&stru_B9F70 table:@"AccountPreferences"];
  [v5 setProperty:v17 forKey:PSFooterHyperlinkViewURLKey];

  [v4 addObject:v5];
  id v18 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v19 = [v18 localizedStringForKey:@"BYOD_CATCH_ALL_EMAIL_SPECIFIER_NAME" value:&stru_B9F70 table:@"AccountPreferences"];
  unsigned int v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:v23 set:"_setBYODCatchAllEmailEnabled:specifier:" get:"_catchAllEmailEnabledForSpecifier:" detail:0 cell:6 edit:0];

  [v4 addObject:v20];
  id v21 = [v4 copy];

  return v21;
}

- (id)_leaveDomainSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v16 = +[PSSpecifier emptyGroupSpecifier];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v5 = [v4 localizedStringForKey:@"BYOD_MEMBER_LEAVE_DOMAIN_FOOTER_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  unsigned int v6 = [(id)_domainResult domain];
  unsigned __int8 v7 = [v6 name];
  unsigned int v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v7);

  [v16 setProperty:v8 forKey:PSFooterTextGroupKey];
  [v3 addObject:v16];
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"BYOD_MEMBER_LEAVE_DOMAIN_BUTTON_NAME" value:&stru_B9F70 table:@"AccountPreferences"];
  unsigned int v11 = +[PSSpecifier deleteButtonSpecifierWithName:v10 target:self action:"_leaveDomainTapped:"];

  [v11 setProperty:&off_C0378 forKey:PSAlignmentKey];
  [v3 addObject:v11];
  long long v12 = +[NSNotificationCenter defaultCenter];
  [v12 removeObserver:self name:@"STOP_DOMAIN_NOTIFICATION" object:0];

  id v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"_domainStoppedNotification:" name:@"STOP_DOMAIN_NOTIFICATION" object:0];

  id v14 = [v3 copy];

  return v14;
}

- (id)_stopUsingDomainSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v16 = +[PSSpecifier groupSpecifierWithID:@"BYOD_STOP_USING_DOMAIN_GROUP"];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v5 = [v4 localizedStringForKey:@"BYOD_STOP_USING_DOMAIN_FOOTER" value:&stru_B9F70 table:@"AccountPreferences"];
  unsigned int v6 = [(id)_domainResult domain];
  unsigned __int8 v7 = [v6 name];
  unsigned int v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v7);

  [v16 setProperty:v8 forKey:PSFooterTextGroupKey];
  [v3 addObject:v16];
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"BYOD_STOP_USING_DOMAIN_BUTTON" value:&stru_B9F70 table:@"AccountPreferences"];
  unsigned int v11 = +[PSSpecifier deleteButtonSpecifierWithName:v10 target:self action:"_stopUsingDomain:"];

  [v11 setProperty:&off_C0378 forKey:PSAlignmentKey];
  [v3 addObject:v11];
  long long v12 = +[NSNotificationCenter defaultCenter];
  [v12 removeObserver:self name:@"STOP_DOMAIN_NOTIFICATION" object:0];

  id v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"_domainStoppedNotification:" name:@"STOP_DOMAIN_NOTIFICATION" object:0];

  id v14 = [v3 copy];

  return v14;
}

- (id)_addExistingAddressButtonSpecifierForMember:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v6 = [v5 localizedStringForKey:@"BYOD_ADD_EXISTING_ADDRESS_BUTTON" value:&stru_B9F70 table:@"AccountPreferences"];
  unsigned __int8 v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v7 setIdentifier:@"ADD_EXISTING_ADDRESS_SPECIFIER_ID"];
  [v7 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  [v7 setButtonAction:"_addExistingAddressButtonTapped:"];
  [v7 setProperty:v4 forKey:@"MEMBER_DSID"];
  [v7 setProperty:&__kCFBooleanFalse forKey:@"editableSpecifier"];

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)BYODDomainDetailViewController;
  id v4 = [(BYODDomainDetailViewController *)&v11 tableView:a3 cellForRowAtIndexPath:a4];
  unsigned __int8 v5 = [v4 specifier];
  unsigned int v6 = [v5 identifier];
  unsigned int v7 = [v6 isEqualToString:@"reVerifySpecifierTitleID"];

  if (v7)
  {
    unsigned int v8 = [v4 titleLabel];
    id v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    [v8 setFont:v9];
  }

  return v4;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return [(BYODDomainDetailViewController *)self _isRowEditableAtIndexPath:a4];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return [(BYODDomainDetailViewController *)self _isRowEditableAtIndexPath:a4];
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  unsigned int v8 = v7;
  if (a4 == 1)
  {
    if ([v7 row])
    {
      id v9 = [(BYODDomainDetailViewController *)self _specifierForRowIndex:[(BYODDomainDetailViewController *)self indexForIndexPath:v8]];
      id v10 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v11 = [v10 localizedStringForKey:@"BYOD_DELETE_CONFIRMATION_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
      long long v12 = +[NSBundle bundleForClass:objc_opt_class()];
      id v13 = [v12 localizedStringForKey:@"BYOD_DELETE_CONFIRMATION_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
      id v14 = +[UIAlertController alertControllerWithTitle:v11 message:v13 preferredStyle:1];

      uint64_t v15 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v16 = [v15 localizedStringForKey:@"CANCEL_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
      unsigned int v17 = +[UIAlertAction actionWithTitle:v16 style:1 handler:0];

      id v18 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v19 = [v18 localizedStringForKey:@"REMOVE_FROM_TRASH" value:&stru_B9F70 table:@"AccountPreferences"];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_39764;
      v26[3] = &unk_B9310;
      id v20 = v9;
      id v27 = v20;
      double v28 = self;
      id v21 = +[UIAlertAction actionWithTitle:v19 style:2 handler:v26];

      [v14 addAction:v17];
      [v14 addAction:v21];
      [v14 setPreferredAction:v21];
      [(BYODDomainDetailViewController *)self presentViewController:v14 animated:1 completion:0];
    }
    else
    {
      id v20 = [(BYODDomainDetailViewController *)self specifierAtIndex:[(BYODDomainDetailViewController *)self indexForIndexPath:v8]];
      id v22 = (void *)_domainResult;
      id v23 = [v20 propertyForKey:@"MEMBER_DSID"];
      id v24 = [v22 getMemberFromIdentifier:v23];

      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_396F8;
      v29[3] = &unk_B9100;
      objc_copyWeak(&v31, &location);
      id v14 = v24;
      id v30 = v14;
      id v25 = objc_retainBlock(v29);
      [(BYODDomainDetailViewController *)self _shouldRemoveDomainMember:v14 completion:v25];

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
  }
}

- (id)_specifierForRowIndex:(int64_t)a3
{
  uint64_t v5 = OBJC_IVAR___PSListController__specifiers;
  if ((unint64_t)[*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] count] <= a3)
  {
    unsigned int v6 = 0;
  }
  else
  {
    unsigned int v6 = [*(id *)&self->PSListController_opaque[v5] objectAtIndex:a3];
  }

  return v6;
}

- (void)_showEmailSelectWelcomeScreen
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v21 = +[UIImage imageNamed:@"CustomDomainIcon.png" inBundle:v3];

  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"BYOD_DOMAIN_READY_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
  unsigned int v6 = [(id)_domainResult domain];
  id v7 = [v6 name];
  unsigned int v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v7);

  id v9 = objc_alloc((Class)OBWelcomeController);
  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v11 = [v10 localizedStringForKey:@"BYOD_DOMAIN_READY_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  id v12 = [v9 initWithTitle:v11 detailText:v8 icon:v21 contentLayout:2];
  id v13 = (void *)_welcomeController;
  _welcomeController = (uint64_t)v12;

  [(id)_welcomeController setModalPresentationStyle:2];
  id v14 = +[OBBoldTrayButton boldButton];
  uint64_t v15 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v16 = [v15 localizedStringForKey:@"CONTINUE_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  [v14 setTitle:v16 forState:0];

  [v14 addTarget:self action:"_obContinueTapped:" forEvents:64];
  unsigned int v17 = [(id)_welcomeController buttonTray];
  [v17 addButton:v14];

  id v18 = [BYODSelectDefaultEmailNavController alloc];
  uint64_t v19 = [(BYODSelectDefaultEmailNavController *)v18 initWithRootViewController:_welcomeController];
  id v20 = (void *)_selectDefaultEmailNavController;
  _selectDefaultEmailNavController = (uint64_t)v19;

  [(id)_selectDefaultEmailNavController setByodDelegate:self];
  [(BYODDomainDetailViewController *)self presentViewController:_selectDefaultEmailNavController animated:1 completion:0];
}

- (void)_manageEmailWasTapped:(id)a3
{
  id v4 = [BYODEmailAddressManageViewController alloc];
  uint64_t v5 = [(BYODEmailAddressManageViewController *)v4 initWithAccount:self->_loggedInUserAccount domain:_domainResult];
  -[BYODDomainDetailViewController showViewController:sender:](self, "showViewController:sender:");
}

- (void)_leaveDomainTapped:(id)a3
{
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"BYOD_MEMBER_LEAVE_DOMAIN_ALERT_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  unsigned int v6 = [(id)_domainResult domain];
  id v7 = [v6 name];
  unsigned int v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v7);

  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"BYOD_MEMBER_LEAVE_DOMAIN_ALERT_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
  objc_super v11 = [(id)_domainResult domain];
  id v12 = [v11 name];
  id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v12);

  id v14 = +[UIAlertController alertControllerWithTitle:v8 message:v13 preferredStyle:1];
  uint64_t v15 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v16 = [v15 localizedStringForKey:@"CANCEL_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  unsigned int v17 = +[UIAlertAction actionWithTitle:v16 style:1 handler:0];

  id v18 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v19 = [v18 localizedStringForKey:@"BYOD_MEMBER_LEAVE_DOMAIN_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_3A014;
  v21[3] = &unk_B8CA8;
  void v21[4] = self;
  id v20 = +[UIAlertAction actionWithTitle:v19 style:2 handler:v21];

  [v14 addAction:v17];
  [v14 addAction:v20];
  [v14 setPreferredAction:v20];
  [(BYODDomainDetailViewController *)self presentViewController:v14 animated:1 completion:0];
}

- (void)_stopUsingDomain:(id)a3
{
  id v4 = [BYODStopUsingDomainViewController alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  unsigned int v6 = [(id)_domainResult domain];
  unsigned int v8 = [(BYODStopUsingDomainViewController *)v4 initWithAccount:loggedInUserAccount domain:v6];

  id v7 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v8];
  [(BYODDomainDetailViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)_viewInstructionSpecifierWasTapped:(id)a3
{
}

- (void)_finishSetupDomainTapped:(id)a3
{
  id v4 = objc_msgSend((id)_domainResult, "domain", a3);
  uint64_t v5 = [v4 verificationStatus];
  if ([v5 isEqualToString:@"NOT_STARTED"])
  {

LABEL_4:
    id v9 = [(id)_domainResult domain];
    unsigned int v10 = [v9 isDomainConnect];

    if (v10)
    {
      objc_super v11 = [(id)_domainResult domain];
      id v12 = [v11 dnsProviderName];

      if ([(BYODConfirmFinishSetupViewController *)v12 length])
      {
        id v13 = +[NSBundle bundleForClass:objc_opt_class()];
        id v14 = [v13 localizedStringForKey:@"BYOD_FINISH_SETUP_DOMAIN_ALERT_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
        uint64_t v37 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v12);

        uint64_t v15 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v16 = [v15 localizedStringForKey:@"BYOD_FINISH_SETUP_DOMAIN_ALERT_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
        unsigned int v17 = [(id)_domainResult domain];
        id v18 = [v17 name];
        uint64_t v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v18, v12);

        id v20 = +[UIAlertController alertControllerWithTitle:v37 message:v19 preferredStyle:1];
        id v21 = +[NSBundle bundleForClass:objc_opt_class()];
        id v22 = [v21 localizedStringForKey:@"CANCEL_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
        id v23 = +[UIAlertAction actionWithTitle:v22 style:1 handler:0];

        *(void *)id location = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)location, self);
        id v24 = +[NSBundle bundleForClass:objc_opt_class()];
        id v25 = [v24 localizedStringForKey:@"CONTINUE_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_3AB38;
        v39[3] = &unk_B8FE8;
        objc_copyWeak(&v40, (id *)location);
        NSRange v26 = +[UIAlertAction actionWithTitle:v25 style:0 handler:v39];

        [v20 addAction:v23];
        [v20 addAction:v26];
        [v20 setPreferredAction:v26];
        [(BYODDomainDetailViewController *)self presentViewController:v20 animated:1 completion:0];

        objc_destroyWeak(&v40);
        objc_destroyWeak((id *)location);

        id v27 = v37;
      }
      else
      {
        id v27 = +[BYODDomainDetailViewController log];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v36 = objc_msgSend((id)_domainResult, "ef_publicDescription");
          *(_DWORD *)id location = 138412290;
          *(void *)&location[4] = v36;
          _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "dns provider name not present. domainInfo %@", location, 0xCu);
        }
      }
    }
    else
    {
      double v28 = [BYODConfirmFinishSetupViewController alloc];
      double v29 = [(id)_domainResult domain];
      id v30 = [v29 name];
      id v12 = [(BYODConfirmFinishSetupViewController *)v28 initWithDomainName:v30 acAccount:self->_loggedInUserAccount];

      id v31 = [(id)_domainResult domain];
      if ([v31 withEmailAddress])
      {
        unsigned int v32 = [(id)_domainResult hasEmails];

        if (v32) {
          [(BYODConfirmFinishSetupViewController *)v12 setShowDefaultEmailSelect:1];
        }
      }
      else
      {
      }
      [(BYODConfirmFinishSetupViewController *)v12 setModalPresentationStyle:2];
      id v33 = [[BYODSelectDefaultEmailNavController alloc] initWithRootViewController:v12];
      unsigned __int8 v34 = (void *)_selectDefaultEmailNavController;
      _selectDefaultEmailNavController = (uint64_t)v33;

      [(id)_selectDefaultEmailNavController setByodDelegate:self];
      [(id)_selectDefaultEmailNavController setModalInPresentation:1];
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_3AD40;
      v38[3] = &unk_B8E88;
      v38[4] = self;
      v35 = +[EFScheduler mainThreadScheduler];
      [v35 performBlock:v38];
    }
    return;
  }
  unsigned int v6 = [(id)_domainResult domain];
  id v7 = [v6 verificationStatus];
  unsigned int v8 = [v7 isEqualToString:@"FAILED"];

  if (v8) {
    goto LABEL_4;
  }

  [(BYODDomainDetailViewController *)self _fetchAvailableSendFrom];
}

- (void)_obContinueTapped:(id)a3
{
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v15 = +[UIImage imageNamed:@"CustomDomainIcon.png" inBundle:v4];

  uint64_t v5 = [BYODSelectEmailTableViewController alloc];
  unsigned int v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"BYOD_CHOOSE_DEFAULT_EMAIL_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  unsigned int v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"BYOD_CHOOSE_DEFAULT_EMAIL_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
  loggedInUserAccount = self->_loggedInUserAccount;
  uint64_t v11 = _emailList;
  id v12 = [(id)_domainResult domain];
  id v13 = [v12 name];
  id v14 = [(BYODSelectEmailTableViewController *)v5 initWithTitle:v7 detailText:v9 icon:v15 adoptTableViewScrollView:1 userAccount:loggedInUserAccount emailListResponse:v11 domainName:v13];

  [(id)_selectDefaultEmailNavController pushViewController:v14 animated:1];
}

- (void)_editButtonTapped:(id)a3
{
  id v4 = +[BYODDomainDetailViewController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "editing email address", buf, 2u);
  }

  isEditing ^= 1u;
  uint64_t v5 = [(BYODDomainDetailViewController *)self table];
  [v5 setEditing:isEditing animated:1];

  unsigned __int8 v34 = [(id)_emailDetailGroupSpecifierHeader propertyForKey:@"headerView"];
  [v34 toggleDoneButton:isEditing];
  if (isEditing)
  {
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_3B4FC;
    v49[3] = &unk_B9358;
    v49[4] = self;
    unsigned int v6 = objc_retainBlock(v49);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v7 = [(id)_domainResult members];
    id obj = v7;
    id v8 = [v7 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v46;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v46 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          id v12 = [v11 dsid];
          id v13 = [(id)_domainResult domain];
          id v14 = [v13 owner];
          id v15 = [v14 dsid];
          unsigned int v16 = [v12 isEqualToString:v15];

          if (v16) {
            ((void (*)(void *, void *))v6[2])(v6, v11);
          }
        }
        id v7 = obj;
        id v8 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v8);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    unsigned int v17 = [(id)_domainResult members];
    id obja = v17;
    id v18 = [v17 countByEnumeratingWithState:&v41 objects:v52 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v42;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v42 != v19) {
            objc_enumerationMutation(obja);
          }
          id v21 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
          id v22 = [v21 dsid];
          id v23 = [(id)_domainResult domain];
          id v24 = [v23 owner];
          id v25 = [v24 dsid];
          unsigned __int8 v26 = [v22 isEqualToString:v25];

          if ((v26 & 1) == 0) {
            ((void (*)(void *, void *))v6[2])(v6, v21);
          }
        }
        unsigned int v17 = obja;
        id v18 = [obja countByEnumeratingWithState:&v41 objects:v52 count:16];
      }
      while (v18);
    }
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v27 = *(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
    id v28 = [v27 countByEnumeratingWithState:&v37 objects:v51 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v38;
      do
      {
        for (k = 0; k != v28; k = (char *)k + 1)
        {
          if (*(void *)v38 != v29) {
            objc_enumerationMutation(v27);
          }
          id v31 = *(void **)(*((void *)&v37 + 1) + 8 * (void)k);
          unsigned int v32 = [v31 identifier];
          unsigned int v33 = [v32 containsString:@"ADD_EXISTING_ADDRESS_SPECIFIER_ID"];

          if (v33) {
            [(BYODDomainDetailViewController *)self removeSpecifier:v31 animated:1];
          }
        }
        id v28 = [v27 countByEnumeratingWithState:&v37 objects:v51 count:16];
      }
      while (v28);
    }
  }
}

- (void)_addExistingAddressButtonTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[BYODDomainDetailViewController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "adding email address", v9, 2u);
  }

  unsigned int v6 = [BYODUpdateEmailViewController alloc];
  id v7 = [(BYODUpdateEmailViewController *)v6 initWithAccount:self->_loggedInUserAccount domain:_domainResult addAlias:0];
  [(BYODUpdateEmailViewController *)v7 setCallingSpecifier:v4];
  id v8 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v7];
  [(BYODDomainDetailViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)_resendVerificationEmailButtonTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)_byodSpinner;
  if (!_byodSpinner)
  {
    unsigned int v6 = [[BYODSpinner alloc] initWithViewController:self];
    id v7 = (void *)_byodSpinner;
    _byodSpinner = (uint64_t)v6;

    uint64_t v5 = (void *)_byodSpinner;
  }
  [v5 startSpinner];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v8 = +[BYODDomainDetailViewController log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "user tapped resend verification email", buf, 2u);
  }

  uint64_t v9 = [BYODResendVerificationEmailRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  uint64_t v11 = [(ACAccount *)loggedInUserAccount accountStore];
  id v12 = [(id)_domainResult domain];
  id v13 = [v12 name];
  id v14 = [(BYODResendVerificationEmailRequest *)v9 initWithAccount:loggedInUserAccount accountStore:v11 domain:v13];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_3B984;
  v15[3] = &unk_B9178;
  objc_copyWeak(&v16, &location);
  [(BYODResendVerificationEmailRequest *)v14 performRequestWithCallback:v15];
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

- (void)_reverifyDomainButtonTapped:(id)a3
{
  id v4 = objc_msgSend((id)_domainResult, "domain", a3);
  unsigned int v5 = [v4 isDomainConnect];

  if (v5)
  {
    [(BYODDomainDetailViewController *)self _showDomainConnectSignInAlert];
  }
  else
  {
    [(BYODDomainDetailViewController *)self _triggerManualDomainSetupFlow];
  }
}

- (void)_triggerManualDomainSetupFlow
{
  if (_os_feature_enabled_impl())
  {
    id v3 = [BYODDomainManualSetupViewController alloc];
    id v4 = [(id)_domainResult domain];
    unsigned int v5 = [v4 name];
    unsigned int v6 = [(BYODDomainDetailViewController *)self loggedInUserAccount];
    id v7 = [(BYODDomainManualSetupViewController *)v3 initWithDomainName:v5 acAccount:v6 showRedBadge:0];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_3BFCC;
    v11[3] = &unk_B9010;
    v11[4] = self;
    id v8 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v7];
    id v12 = v8;
    uint64_t v9 = +[EFScheduler mainThreadScheduler];
    [v9 performBlock:v11];
  }
  else
  {
    id v7 = +[BYODDomainDetailViewController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v10 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Mail.CustomEmailDomainManualSetupFlow feature is unavailable", v10, 2u);
    }
  }
}

- (void)_showDomainConnectSignInAlert
{
  id v3 = [(id)_domainResult domain];
  id v4 = [v3 domainConnectServerUrl];

  if ([v4 length])
  {
    id v23 = [objc_alloc((Class)NSURL) initWithString:v4];
    unsigned int v5 = [(id)_domainResult domain];
    unsigned __int8 v26 = [v5 dnsProviderName];

    unsigned int v6 = [(id)_domainResult domain];
    id v25 = [v6 name];

    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"BYOD_FINISH_SETUP_DOMAIN_ALERT_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
    id v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v26);

    uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v10 = [v9 localizedStringForKey:@"BYOD_FINISH_SETUP_DOMAIN_ALERT_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
    uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v25, v26);

    id v12 = +[UIAlertController alertControllerWithTitle:v24 message:v11 preferredStyle:1];
    id v13 = +[NSBundle bundleForClass:objc_opt_class()];
    id v14 = [v13 localizedStringForKey:@"CANCEL_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
    id v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:0];

    id v16 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v17 = [v16 localizedStringForKey:@"CONTINUE_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_3C5B0;
    v29[3] = &unk_B9310;
    id v18 = v23;
    id v30 = v18;
    id v31 = self;
    uint64_t v19 = +[UIAlertAction actionWithTitle:v17 style:0 handler:v29];

    [v12 addAction:v15];
    [v12 addAction:v19];
    [v12 setPreferredAction:v19];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_3C640;
    v27[3] = &unk_B9010;
    v27[4] = self;
    id v20 = v12;
    id v28 = v20;
    id v21 = +[EFScheduler mainThreadScheduler];
    [v21 performBlock:v27];
  }
  else
  {
    id v18 = +[BYODDomainDetailViewController log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = objc_msgSend((id)_domainResult, "ef_publicDescription");
      *(_DWORD *)buf = 138412290;
      unsigned int v33 = v22;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Domain connect URL not present. domain info %@", buf, 0xCu);
    }
  }
}

- (id)_catchAllEmailEnabledForSpecifier:(id)a3
{
  id v3 = objc_msgSend((id)_domainResult, "domain", a3);
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 catchAllEnabled]);

  return v4;
}

- (void)_setBYODCatchAllEmailEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODDomainDetailViewController log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v24 = [v6 BOOLValue];
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "catch all switch toggled: %{BOOL}d", buf, 8u);
  }

  if ([v6 BOOLValue])
  {
    uint64_t v9 = [BYODEnableCatchAllEmailRequest alloc];
    loggedInUserAccount = self->_loggedInUserAccount;
    uint64_t v11 = [(ACAccount *)loggedInUserAccount accountStore];
    id v12 = [(id)_domainResult domain];
    id v13 = [v12 name];
    id v14 = [(BYODEnableCatchAllEmailRequest *)v9 initWithAccount:loggedInUserAccount accountStore:v11 domain:v13];

    id v15 = v22;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_3CA3C;
    v22[3] = &unk_B93A0;
    v22[4] = self;
    v22[5] = v7;
    v22[6] = v6;
    [(BYODEnableCatchAllEmailRequest *)v14 performRequestWithCallback:v22];
  }
  else
  {
    id v16 = [BYODDisableCatchAllEmailRequest alloc];
    unsigned int v17 = self->_loggedInUserAccount;
    id v18 = [(ACAccount *)v17 accountStore];
    uint64_t v19 = [(id)_domainResult domain];
    id v20 = [v19 name];
    id v14 = [(BYODDisableCatchAllEmailRequest *)v16 initWithAccount:v17 accountStore:v18 domain:v20];

    id v15 = v21;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_3CB9C;
    v21[3] = &unk_B93A0;
    void v21[4] = self;
    void v21[5] = v7;
    v21[6] = v6;
    [(BYODEnableCatchAllEmailRequest *)v14 performRequestWithCallback:v21];
  }
}

- (void)_loadDomainDetails
{
  id v3 = [BYODGetDomainRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  unsigned int v5 = [(ACAccount *)loggedInUserAccount accountStore];
  id v6 = [(id)_domainResult domain];
  id v7 = [v6 name];
  id v8 = [(BYODGetDomainRequest *)v3 initWithAccount:loggedInUserAccount accountStore:v5 domain:v7];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_3CE30;
  v9[3] = &unk_B9060;
  v9[4] = self;
  [(BYODGetDomainRequest *)v8 performRequestWithCallback:v9];
}

- (void)_fetchAvailableSendFrom
{
  if (!_byodSpinner)
  {
    id v3 = [[BYODSpinner alloc] initWithViewController:self];
    id v4 = (void *)_byodSpinner;
    _byodSpinner = (uint64_t)v3;
  }
  unsigned int v5 = +[EFScheduler mainThreadScheduler];
  [v5 performBlock:&stru_B93C0];

  id v6 = [BYODListEmailRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  id v8 = [(ACAccount *)loggedInUserAccount accountStore];
  uint64_t v9 = [(BYODListEmailRequest *)v6 initWithAccount:loggedInUserAccount accountStore:v8];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_3D0DC;
  v10[3] = &unk_B9408;
  v10[4] = self;
  [(BYODListEmailRequest *)v9 performRequestWithCallback:v10];
}

- (void)_deleteEmailFromServerForUser:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_3D568;
  v27[3] = &unk_B8E88;
  id v7 = a4;
  id v28 = v7;
  id v21 = v6;
  id v22 = v7;
  id v8 = +[EFScheduler mainThreadScheduler];
  [v8 performBlock:v27];

  uint64_t v9 = [BYODDeleteEmailRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  id v20 = [(ACAccount *)loggedInUserAccount accountStore];
  uint64_t v11 = [(id)_domainResult domain];
  id v12 = [v11 name];
  id v13 = [v7 name];
  id v14 = +[NSMutableArray arrayWithObject:v13];
  id v15 = [v6 dsid];
  id v16 = [v6 invitedEmail];
  unsigned int v17 = [v6 invitedPhoneNumber];
  id v18 = [(BYODDeleteEmailRequest *)v9 initWithAccount:loggedInUserAccount accountStore:v20 domain:v12 emailArray:v14 dsid:v15 invitedEmail:v16 invitedPhone:v17];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_3D570;
  v23[3] = &unk_B9430;
  id v19 = v22;
  id v24 = v19;
  objc_copyWeak(&v25, &location);
  [(BYODDeleteEmailRequest *)v18 performRequestWithCallback:v23];
  objc_destroyWeak(&v25);

  objc_destroyWeak(&location);
}

- (id)_getMemberEmailGroupID:(int64_t)a3
{
  return +[NSString stringWithFormat:@"%@-%ld", @"memberEmailDetailGroup", a3];
}

- (BOOL)_isRowEditableAtIndexPath:(id)a3
{
  id v3 = [(BYODDomainDetailViewController *)self specifierAtIndexPath:a3];
  id v4 = [v3 propertyForKey:@"editableSpecifier"];
  unsigned int v5 = [v4 isEqual:&__kCFBooleanTrue];

  if (!v5) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  id v6 = [v3 propertyForKey:@"cellObject"];
  id v7 = [v6 textField];
  id v8 = [v7 text];
  id v9 = [v8 length];

  if (v9) {
LABEL_4:
  }
    BOOL v10 = 1;
  else {
LABEL_5:
  }
    BOOL v10 = 0;

  return v10;
}

- (void)_shouldRemoveDomainMember:(id)a3 completion:(id)a4
{
  id v25 = a3;
  id v26 = a4;
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"BYOD_ADD_DOMAIN_DELETE_MEMBER_CONFIRMATION_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  id v8 = [v25 fullName];
  uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);

  id v24 = (void *)v9;
  BOOL v10 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 localizedStringForKey:@"BYOD_ADD_DOMAIN_DELETE_MEMBER_CONFIRMATION_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
  id v12 = [(id)_domainResult domain];
  id v13 = [v12 name];
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v13);
  id v15 = self;

  id v16 = +[UIAlertController alertControllerWithTitle:v9 message:v14 preferredStyle:1];
  unsigned int v17 = +[NSBundle bundleForClass:objc_opt_class()];
  id v18 = [v17 localizedStringForKey:@"CANCEL_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  id v19 = +[UIAlertAction actionWithTitle:v18 style:1 handler:0];

  id v20 = +[NSBundle bundleForClass:objc_opt_class()];
  id v21 = [v20 localizedStringForKey:@"REMOVE_FROM_TRASH" value:&stru_B9F70 table:@"AccountPreferences"];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_3DCD4;
  v27[3] = &unk_B8CD0;
  id v22 = v26;
  id v28 = v22;
  id v23 = +[UIAlertAction actionWithTitle:v21 style:2 handler:v27];

  [v16 addAction:v19];
  [v16 addAction:v23];
  [v16 setPreferredAction:v23];
  [(BYODDomainDetailViewController *)v15 presentViewController:v16 animated:1 completion:0];
}

- (void)_removeDomainMember:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [BYODRemoveMemberRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  id v7 = [(ACAccount *)loggedInUserAccount accountStore];
  id v8 = [(id)_domainResult domain];
  uint64_t v9 = [v8 name];
  BOOL v10 = [(id)_domainResult domain];
  uint64_t v11 = [v10 status];
  id v12 = [(BYODRemoveMemberRequest *)v5 initWithAccount:loggedInUserAccount accountStore:v7 domain:v9 domainStatus:v11 domainMember:v4];

  id v13 = (void *)_byodSpinner;
  if (!_byodSpinner)
  {
    id v14 = [[BYODSpinner alloc] initWithViewController:self];
    id v15 = (void *)_byodSpinner;
    _byodSpinner = (uint64_t)v14;

    id v13 = (void *)_byodSpinner;
  }
  [v13 startSpinner];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_3DF00;
  v16[3] = &unk_B9290;
  objc_copyWeak(&v17, &location);
  [(BYODRemoveMemberRequest *)v12 performRequestWithCallback:v16];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)safariViewControllerDidFinish:(id)a3
{
  id v4 = +[BYODDomainDetailViewController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "safari window dismissed", v5, 2u);
  }

  [(BYODDomainDetailViewController *)self _loadDomainDetails];
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BYODDomainDetailViewController;
  [(BYODDomainDetailViewController *)&v4 dealloc];
}

- (void)_domainStoppedNotification:(id)a3
{
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"BYOD_REFRESH_NOTIFICATION" object:0 userInfo:0];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_3E28C;
  v6[3] = &unk_B8E88;
  v6[4] = self;
  unsigned int v5 = +[EFScheduler mainThreadScheduler];
  [v5 performBlock:v6];
}

- (void)_refreshDomainResultNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 userInfo];
  id v6 = [v5 valueForKey:@"domainData"];
  objc_storeStrong((id *)&_domainResult, v6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_3E40C;
  v8[3] = &unk_B8E88;
  v8[4] = self;
  id v7 = +[EFScheduler mainThreadScheduler];
  [v7 performBlock:v8];
}

- (void)_showIntroScreen
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v23 = +[UIImage imageNamed:@"CustomDomainIcon.png" inBundle:v3];

  id v4 = (void *)_domainResult;
  unsigned int v5 = [(ACAccount *)self->_loggedInUserAccount normalizedDSID];
  unsigned int v6 = [v4 hasEmailsForDsid:v5];

  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  if (v6)
  {
    id v8 = [v7 localizedStringForKey:@"BYOD_INTRO_TITLE_EMAIL" value:&stru_B9F70 table:@"AccountPreferences"];

    uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v10 = [v9 localizedStringForKey:@"BYOD_INTRO_MESSAGE_EMAIL" value:&stru_B9F70 table:@"AccountPreferences"];
    uint64_t v11 = [(BYODDomainDetailViewController *)self _getEmailList];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11);
  }
  else
  {
    id v8 = [v7 localizedStringForKey:@"BYOD_INTRO_TITLE_NO_EMAIL" value:&stru_B9F70 table:@"AccountPreferences"];

    uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v10 = [v9 localizedStringForKey:@"BYOD_INTRO_MESSAGE_NO_EMAIL" value:&stru_B9F70 table:@"AccountPreferences"];
    uint64_t v11 = [(id)_domainResult domain];
    id v13 = [v11 name];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v13);
  }
  id v14 = [objc_alloc((Class)OBWelcomeController) initWithTitle:v8 detailText:v12 icon:v23 contentLayout:2];
  if (v6) {
    [(BYODDomainDetailViewController *)self _addContentViewToOBController:v14];
  }
  [v14 setModalPresentationStyle:2];
  id v15 = +[OBBoldTrayButton boldButton];
  id v16 = +[NSBundle bundleForClass:objc_opt_class()];
  id v17 = [v16 localizedStringForKey:@"OK" value:&stru_B9F70 table:@"AccountPreferences"];
  [v15 setTitle:v17 forState:0];

  [v15 addTarget:self action:"_okButtonTapped:" forEvents:64];
  id v18 = [v14 buttonTray];
  [v18 addButton:v15];

  if (v6)
  {
    id v19 = +[OBLinkTrayButton linkButton];
    id v20 = +[NSBundle bundleForClass:objc_opt_class()];
    id v21 = [v20 localizedStringForKey:@"BYOD_MAIL_SETTINGS_LINK" value:&stru_B9F70 table:@"AccountPreferences"];
    [v19 setTitle:v21 forState:0];

    [v19 addTarget:self action:"_mailSettingsTapped:" forEvents:64];
    id v22 = [v14 buttonTray];
    [v22 addButton:v19];
  }
  [(BYODDomainDetailViewController *)self presentViewController:v14 animated:1 completion:0];
}

- (void)_mailSettingsTapped:(id)a3
{
  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  id v3 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Mail"];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (void)_okButtonTapped:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [BYODUpdateIntroFlagRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  id v7 = [(ACAccount *)loggedInUserAccount accountStore];
  id v8 = [(id)_domainResult domain];
  uint64_t v9 = [v8 name];
  BOOL v10 = [(BYODUpdateIntroFlagRequest *)v5 initWithAccount:loggedInUserAccount accountStore:v7 domain:v9];

  id v11 = v4;
  [v11 showsBusyIndicator];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_3EB58;
  v13[3] = &unk_B9478;
  v13[4] = self;
  id v12 = v11;
  id v14 = v12;
  [(BYODUpdateIntroFlagRequest *)v10 performRequestWithCallback:v13];
}

- (void)_addContentViewToOBController:(id)a3
{
  id v30 = a3;
  id v3 = objc_alloc_init((Class)UILabel);
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v5 = [v4 localizedStringForKey:@"BYOD_INTRO_SUB_MESSAGE_EMAIL" value:&stru_B9F70 table:@"AccountPreferences"];
  [v3 setText:v5];

  [v3 setLineBreakMode:0];
  [v3 setNumberOfLines:0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 sizeToFit];
  [v3 setTextAlignment:1];
  id v6 = objc_alloc_init((Class)UIView);
  [v6 addSubview:v3];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = [v30 contentView];
  [v7 addSubview:v6];

  uint64_t v29 = [v6 topAnchor];
  id v25 = [v30 contentView];
  id v24 = [v25 topAnchor];
  id v23 = objc_msgSend(v29, "constraintEqualToAnchor:");
  v31[0] = v23;
  id v28 = [v6 trailingAnchor];
  id v22 = [v30 contentView];
  id v21 = [v22 trailingAnchor];
  id v20 = objc_msgSend(v28, "constraintEqualToAnchor:");
  v31[1] = v20;
  id v27 = [v6 leadingAnchor];
  id v19 = [v30 contentView];
  id v18 = [v19 leadingAnchor];
  id v17 = objc_msgSend(v27, "constraintEqualToAnchor:");
  v31[2] = v17;
  id v26 = [v3 topAnchor];
  id v16 = [v6 topAnchor];
  id v15 = objc_msgSend(v26, "constraintEqualToAnchor:");
  v31[3] = v15;
  id v8 = [v3 trailingAnchor];
  uint64_t v9 = [v6 trailingAnchor];
  BOOL v10 = [v8 constraintEqualToAnchor:v9];
  v31[4] = v10;
  id v11 = [v3 leadingAnchor];
  id v12 = [v6 leadingAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12];
  v31[5] = v13;
  id v14 = +[NSArray arrayWithObjects:v31 count:6];
  +[NSLayoutConstraint activateConstraints:v14];
}

- (id)_getEmailList
{
  id v2 = (void *)_domainResult;
  id v3 = [(ACAccount *)self->_loggedInUserAccount normalizedDSID];
  id v4 = [v2 getMemberFromDSID:v3];

  unsigned __int8 v34 = v4;
  if (!v4 || ([v4 emails], unsigned int v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    id v15 = &stru_B9F70;
    goto LABEL_22;
  }
  id v6 = [v4 emails];
  id v7 = (char *)[v6 count];

  if (v7 == (unsigned char *)&dword_0 + 1)
  {
    id v8 = [v4 emails];
    uint64_t v9 = [v8 objectAtIndexedSubscript:0];

    BOOL v10 = +[NSBundle bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"BYOD_INTRO_MESSAGE_EMAIL_DOUBLE_QUOTES" value:&stru_B9F70 table:@"AccountPreferences"];
    id v12 = [v9 email];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);
    id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    id v14 = &stru_B9F70;
    goto LABEL_23;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v16 = [v4 emails];
  id obj = v16;
  id v17 = (char *)[v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v17)
  {
    id v15 = &stru_B9F70;
    goto LABEL_21;
  }
  id v15 = &stru_B9F70;
  uint64_t v18 = 1;
  uint64_t v19 = *(void *)v36;
  do
  {
    id v20 = 0;
    unsigned int v32 = &v17[v18];
    do
    {
      if (*(void *)v36 != v19) {
        objc_enumerationMutation(obj);
      }
      id v21 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v20);
      id v22 = [v34 emails];
      BOOL v23 = &v20[v18] == [v22 count];

      if (v23)
      {
        id v24 = +[NSBundle bundleForClass:objc_opt_class()];
        id v25 = [v24 localizedStringForKey:@"BYOD_INTRO_MESSAGE_EMAIL_LIST" value:&stru_B9F70 table:@"AccountPreferences"];
        id v26 = [v21 email];
        uint64_t v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v15, v26);
      }
      else
      {
        id v28 = [v34 emails];
        BOOL v29 = &v20[v18] == (char *)[v28 count] - 1;

        if (v29)
        {
          id v24 = [v21 email];
          id v25 = +[NSString stringWithFormat:@"\"%@\"", v24];
          [(__CFString *)v15 stringByAppendingString:v25];
          id v26 = v15;
          id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        id v24 = [v21 email];
        id v25 = +[NSBundle bundleForClass:objc_opt_class()];
        id v26 = [v25 localizedStringForKey:@"BYOD_INTRO_MESSAGE_EMAIL_LIST_COMMA" value:&stru_B9F70 table:@"AccountPreferences"];
        uint64_t v30 = +[NSString stringWithFormat:@"\"%@\"%@ ", v24, v26];
        uint64_t v27 = [(__CFString *)v15 stringByAppendingString:v30];

        id v15 = (__CFString *)v30;
      }

      id v15 = (__CFString *)v27;
LABEL_17:

      ++v20;
    }
    while (v17 != v20);
    id v16 = obj;
    id v17 = (char *)[obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    uint64_t v18 = (uint64_t)v32;
  }
  while (v17);
LABEL_21:

LABEL_22:
  id v13 = v15;
  id v14 = v13;
LABEL_23:

  return v13;
}

- (BOOL)_doesMemberBelongToDomain:(id)a3
{
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend((id)_domainResult, "members", 0);
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) memberIdentifier];
        unsigned __int8 v9 = [v8 isEqualToString:v3];

        if (v9)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

- (ACAccount)loggedInUserAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLoggedInUserAccount:(id)a3
{
}

- (PSSpecifier)viewInstructionSpecifier
{
  return self->_viewInstructionSpecifier;
}

- (void)setViewInstructionSpecifier:(id)a3
{
}

- (PSSpecifier)finishSetupSpecifier
{
  return self->_finishSetupSpecifier;
}

- (void)setFinishSetupSpecifier:(id)a3
{
}

- (NSArray)dnsRecords
{
  return self->_dnsRecords;
}

- (void)setDnsRecords:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnsRecords, 0);
  objc_storeStrong((id *)&self->_finishSetupSpecifier, 0);
  objc_storeStrong((id *)&self->_viewInstructionSpecifier, 0);
  objc_storeStrong((id *)&self->_loggedInUserAccount, 0);

  objc_storeStrong((id *)&self->_domainState, 0);
}

@end