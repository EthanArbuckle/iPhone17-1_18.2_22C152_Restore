@interface BYODEmailAddressManageViewController
+ (id)log;
- (BOOL)_showCreateEmailButton;
- (BYODEmailAddressManageViewController)initWithAccount:(id)a3 domain:(id)a4;
- (id)_getCreateEmailSpecifier;
- (id)_getInviteSomeoneElseSpecifier;
- (id)_getMemberGroupSpecifier:(id)a3;
- (id)_getMemberListSpecifier;
- (id)_getOwnerEmailLisSpecifier;
- (id)_getOwnerEmailSpecifier;
- (id)_getOwnerSpecifier;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_cancelButtonTapped:(id)a3;
- (void)_createEmailAddressButtonTapped:(id)a3;
- (void)_deleteEmailAlert:(id)a3;
- (void)_deleteEmailFromServer:(id)a3;
- (void)_footerLinkTapped:(id)a3;
- (void)_inviteSomeoneElseTapped:(id)a3;
- (void)_memberInfoWasTapped:(id)a3;
- (void)_postNotificationForDomainData:(id)a3;
- (void)_refreshDomainResultNotification:(id)a3;
- (void)_showErrorAlert;
- (void)chooseContactController:(id)a3 didSelectContact:(id)a4;
- (void)dealloc;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation BYODEmailAddressManageViewController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_48E3C;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7448 != -1) {
    dispatch_once(&qword_D7448, block);
  }
  v2 = (void *)qword_D7440;

  return v2;
}

- (BYODEmailAddressManageViewController)initWithAccount:(id)a3 domain:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BYODEmailAddressManageViewController;
  v9 = [(BYODEmailAddressManageViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_loggedInUserAccount, a3);
    objc_storeStrong((id *)&v10->_domainResult, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)BYODEmailAddressManageViewController;
  [(BYODEmailAddressManageViewController *)&v7 viewDidLoad];
  v3 = [(BYODEmailAddressManageViewController *)self navigationItem];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"BYOD_EMAIL_ADDRESSES_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  [v3 setTitle:v5];

  v6 = [(BYODEmailAddressManageViewController *)self navigationItem];
  [v6 setHidesBackButton:0];
}

- (id)specifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = [(BYODEmailAddressManageViewController *)self _getOwnerEmailLisSpecifier];
  [v3 addObject:v4];

  v5 = [(BYODEmailAddressManageViewController *)self _getOwnerSpecifier];
  [v3 addObjectsFromArray:v5];

  v6 = [(BYODEmailAddressManageViewController *)self _getOwnerEmailSpecifier];
  [v3 addObjectsFromArray:v6];

  if ([(BYODEmailAddressManageViewController *)self _showCreateEmailButton])
  {
    objc_super v7 = [(BYODEmailAddressManageViewController *)self _getCreateEmailSpecifier];
    [v3 addObjectsFromArray:v7];
  }
  if (_os_feature_enabled_impl())
  {
    id v8 = [(BYODGetDomainResult *)self->_domainResult domain];
    if (![v8 isOwner])
    {
LABEL_12:

      goto LABEL_13;
    }
    v9 = [(BYODGetDomainResult *)self->_domainResult domain];
    unsigned int v10 = [v9 isShared];

    if (v10)
    {
      id v8 = [(BYODEmailAddressManageViewController *)self _getMemberListSpecifier];
      if ([v8 count])
      {
        v11 = +[NSBundle bundleForClass:objc_opt_class()];
        objc_super v12 = [v11 localizedStringForKey:@"BYOD_OTHER_MEMBER_EMAIL_ADDRESSES" value:&stru_B9F70 table:@"AccountPreferences"];
      }
      else
      {
        objc_super v12 = &stru_B9F70;
      }
      v13 = [(BYODEmailAddressManageViewController *)self _getMemberGroupSpecifier:v12];
      [v3 addObjectsFromArray:v13];

      [v3 addObjectsFromArray:v8];
      v14 = [(BYODGetDomainResult *)self->_domainResult members];
      id v15 = [v14 count];
      unint64_t v16 = [(BYODGetDomainResult *)self->_domainResult maxMembersPerDomain];

      if ((unint64_t)v15 < v16)
      {
        v17 = [(BYODEmailAddressManageViewController *)self _getInviteSomeoneElseSpecifier];
        [v3 addObjectsFromArray:v17];
      }
      goto LABEL_12;
    }
  }
LABEL_13:
  id v18 = [v3 copy];
  uint64_t v19 = OBJC_IVAR___PSListController__specifiers;
  v20 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v18;

  v21 = +[NSNotificationCenter defaultCenter];
  [v21 removeObserver:self name:@"BYOD_DOMAIN_DATA_REFRESH_NOTIFICATION" object:0];

  v22 = +[NSNotificationCenter defaultCenter];
  [v22 addObserver:self selector:"_refreshDomainResultNotification:" name:@"BYOD_DOMAIN_DATA_REFRESH_NOTIFICATION" object:0];

  id v23 = *(id *)&self->PSListController_opaque[v19];
  return v23;
}

- (id)_getMemberGroupSpecifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = +[PSSpecifier groupSpecifierWithID:@"BYOD_MEMBER_INFO_GROUP" name:v3];
  [v4 addObject:v5];
  id v6 = [v4 copy];

  return v6;
}

- (id)_getMemberListSpecifier
{
  id v25 = objc_alloc_init((Class)NSMutableArray);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [(BYODGetDomainResult *)self->_domainResult members];
  id v3 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v33;
    uint64_t v24 = PSTableCellSubtitleTextKey;
    v22 = v28;
    uint64_t v23 = PSCellClassKey;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v33 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        objc_super v7 = [v6 dsid];
        id v8 = [(BYODGetDomainResult *)self->_domainResult domain];
        v9 = [v8 owner];
        unsigned int v10 = [v9 dsid];
        unsigned __int8 v11 = [v7 isEqualToString:v10];

        if ((v11 & 1) == 0)
        {
          objc_super v12 = [v6 fullName];
          v13 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, 0, 0, 0, 2, 0, v22);

          v14 = [v6 invitationStatus];
          unsigned int v15 = [v14 isEqualToString:@"INVITED"];

          if (v15)
          {
            unint64_t v16 = +[NSBundle bundleForClass:objc_opt_class()];
            v17 = [v16 localizedStringForKey:@"BYOD_MEMBER_PENDING" value:&stru_B9F70 table:@"AccountPreferences"];
            [v13 setProperty:v17 forKey:v24];
          }
          else
          {
            if ([v6 isFamilyMember])
            {
              unint64_t v16 = +[NSBundle bundleForClass:objc_opt_class()];
              [v16 localizedStringForKey:@"BYOD_MEMBER_FAMILY" value:&stru_B9F70 table:@"AccountPreferences"];
            }
            else
            {
              unint64_t v16 = +[NSBundle bundleForClass:objc_opt_class()];
              [v16 localizedStringForKey:@"BYOD_MEMBER_OTHER" value:&stru_B9F70 table:@"AccountPreferences"];
            v17 = };
            [v13 setProperty:v17 forKey:v24];
          }

          id v18 = [v6 memberIdentifier];
          [v13 setIdentifier:v18];

          [v13 setControllerLoadAction:"_memberInfoWasTapped:"];
          [v13 setProperty:objc_opt_class() forKey:v23];
          id location = (id)0xAAAAAAAAAAAAAAAALL;
          objc_initWeak(&location, self);
          uint64_t v19 = +[BYODContactsManager sharedInstance];
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v28[0] = sub_49A00;
          v28[1] = &unk_B92C0;
          objc_copyWeak(&v30, &location);
          id v20 = v13;
          id v29 = v20;
          [v19 fetchAvatarImageForUser:v6 withCompletion:v27];

          [v25 addObject:v20];
          objc_destroyWeak(&v30);
          objc_destroyWeak(&location);
        }
      }
      id v3 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v3);
  }

  return v25;
}

- (id)_getInviteSomeoneElseSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"BYOD_INVITE_SOMEONE_ELSE_BUTTON" value:&stru_B9F70 table:@"AccountPreferences"];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v6 setButtonAction:"_inviteSomeoneElseTapped:"];
  [v3 addObject:v6];
  id v7 = [v3 copy];

  return v7;
}

- (id)_getOwnerEmailLisSpecifier
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"BYOD_MANAGE_EMAIL_ADDRESS_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  v5 = +[PSSpecifier groupSpecifierWithID:@"BYOD_EMAIL_ADDRESS_LIST_GROUP_ID" name:v4];

  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"BYOD_MANAGE_EMAIL_FOOTER_LINK" value:&stru_B9F70 table:@"AccountPreferences"];

  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"BYOD_MANAGE_EMAIL_FOOTER" value:&stru_B9F70 table:@"AccountPreferences"];
  unsigned int v10 = [(BYODGetDomainResult *)self->_domainResult domain];
  unsigned __int8 v11 = [v10 name];
  objc_super v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v11);

  v19.id location = (NSUInteger)[v12 rangeOfString:v7];
  v13 = NSStringFromRange(v19);
  [v5 setProperty:v13 forKey:PSFooterHyperlinkViewLinkRangeKey];

  v14 = (objc_class *)objc_opt_class();
  unsigned int v15 = NSStringFromClass(v14);
  [v5 setProperty:v15 forKey:PSFooterCellClassGroupKey];

  [v5 setProperty:v12 forKey:PSFooterHyperlinkViewTitleKey];
  unint64_t v16 = +[NSValue valueWithNonretainedObject:self];
  [v5 setProperty:v16 forKey:PSFooterHyperlinkViewTargetKey];

  [v5 setProperty:@"_footerLinkTapped:" forKey:PSFooterHyperlinkViewActionKey];

  return v5;
}

- (void)_footerLinkTapped:(id)a3
{
  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  id v3 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=APPLE_ACCOUNT_CONTACT"];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (id)_getOwnerSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[BYODContactsManager sharedInstance];
  v5 = [v4 avatarImageForMeContact];

  if (!v5)
  {
    id v6 = +[BYODContactsManager sharedInstance];
    id v7 = [(ACAccount *)self->_loggedInUserAccount aa_firstName];
    id v8 = [(ACAccount *)self->_loggedInUserAccount aa_lastName];
    v5 = [v6 monogramWithFirstName:v7 andLastName:v8];
  }
  v9 = [(ACAccount *)self->_loggedInUserAccount userFullName];
  unsigned int v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:4 edit:0];

  [v10 setProperty:v5 forKey:PSIconImageKey];
  [v3 addObject:v10];
  id v11 = [v3 copy];

  return v11;
}

- (id)_getOwnerEmailSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(BYODGetDomainResult *)self->_domainResult members];
  id v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v8 = [(ACAccount *)self->_loggedInUserAccount normalizedDSID];
        v9 = [v7 dsid];
        unsigned int v10 = [v8 isEqualToString:v9];

        if (v10)
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v11 = [v7 emails];
          id v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v20;
            do
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v20 != v13) {
                  objc_enumerationMutation(v11);
                }
                unsigned int v15 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)j) email];
                unint64_t v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:4 edit:0];

                [v3 addObject:v16];
              }
              id v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v12);
          }

          goto LABEL_18;
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v3;
}

- (id)_getCreateEmailSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"BYOD_CREATE_EMAIL_ADDRESS_BUTTON" value:&stru_B9F70 table:@"AccountPreferences"];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v6 setButtonAction:"_createEmailAddressButtonTapped:"];
  [v3 addObject:v6];
  id v7 = [v3 copy];

  return v7;
}

- (void)_inviteSomeoneElseTapped:(id)a3
{
  id v4 = [BYODContactPickerController alloc];
  id v15 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v5 = [v15 localizedStringForKey:@"BYOD_CUSTOM_DOMAIN_INVITE_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"BYOD_CUSTOM_DOMAIN_INVITE_SEND_BUTTON" value:&stru_B9F70 table:@"AccountPreferences"];
  id v8 = [(BYODContactPickerController *)v4 initWithNavBarTitle:v5 rightButtonBarText:v7];
  contactController = self->_contactController;
  self->_contactController = v8;

  [(BYODContactPickerController *)self->_contactController setDelegate:self];
  id v10 = objc_alloc((Class)UINavigationController);
  id v11 = [(BYODContactPickerController *)self->_contactController chooseContactViewController];
  id v16 = [v10 initWithRootViewController:v11];

  id v12 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelButtonTapped:"];
  uint64_t v13 = [(BYODContactPickerController *)self->_contactController chooseContactViewController];
  v14 = [v13 navigationItem];
  [v14 setLeftBarButtonItem:v12];

  [(BYODEmailAddressManageViewController *)self presentViewController:v16 animated:1 completion:0];
}

- (void)_cancelButtonTapped:(id)a3
{
}

- (void)_createEmailAddressButtonTapped:(id)a3
{
  id v6 = a3;
  id v4 = [[BYODUpdateEmailViewController alloc] initWithAccount:self->_loggedInUserAccount domain:self->_domainResult addAlias:1];
  [(BYODUpdateEmailViewController *)v4 setCallingSpecifier:v6];
  id v5 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v4];
  [(BYODEmailAddressManageViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_memberInfoWasTapped:(id)a3
{
  id v10 = a3;
  id v4 = [BYODMemberEmailAddressViewController alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  domainResult = self->_domainResult;
  id v7 = [v10 identifier];
  id v8 = [(BYODGetDomainResult *)domainResult getMemberFromIdentifier:v7];
  v9 = [(BYODMemberEmailAddressViewController *)v4 initWithAccount:loggedInUserAccount domain:domainResult member:v8];

  [(BYODEmailAddressManageViewController *)self showViewController:v9 sender:self];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v4 = a4;
  int64_t v5 = [v4 row] && !objc_msgSend(v4, "section");

  return v5;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  if (a4 == 1) {
    [(BYODEmailAddressManageViewController *)self _deleteEmailAlert:v7];
  }
}

- (void)_deleteEmailAlert:(id)a3
{
  id v4 = a3;
  int64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"BYOD_DELETE_CONFIRMATION_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
  id v7 = -[BYODEmailAddressManageViewController specifierAtIndex:](self, "specifierAtIndex:", (char *)[v4 row] + 1);
  id v8 = [v7 name];
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8);

  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"BYOD_DELETE_CONFIRMATION_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  id v12 = +[UIAlertController alertControllerWithTitle:v11 message:v9 preferredStyle:1];

  uint64_t v13 = +[NSBundle bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"CANCEL_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  id v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:0];

  id v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"REMOVE_FROM_TRASH" value:&stru_B9F70 table:@"AccountPreferences"];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_4AEC0;
  v20[3] = &unk_B9310;
  v20[4] = self;
  id v18 = v4;
  id v21 = v18;
  long long v19 = +[UIAlertAction actionWithTitle:v17 style:2 handler:v20];

  [v12 addAction:v15];
  [v12 addAction:v19];
  [v12 setPreferredAction:v19];
  [(BYODEmailAddressManageViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)_deleteEmailFromServer:(id)a3
{
  id v15 = a3;
  v14 = -[BYODEmailAddressManageViewController specifierAtIndex:](self, "specifierAtIndex:", (char *)[v15 row] + 1);
  objc_msgSend(v14, "byod_startSpinner");
  id v4 = [BYODDeleteEmailRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  id v6 = [(ACAccount *)loggedInUserAccount accountStore];
  id v7 = [(BYODGetDomainResult *)self->_domainResult domain];
  id v8 = [v7 name];
  v9 = [v14 name];
  id v10 = +[NSMutableArray arrayWithObject:v9];
  id v11 = [(ACAccount *)self->_loggedInUserAccount normalizedDSID];
  id v12 = [(BYODDeleteEmailRequest *)v4 initWithAccount:loggedInUserAccount accountStore:v6 domain:v8 emailArray:v10 dsid:v11];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_4B140;
  v16[3] = &unk_B9520;
  objc_copyWeak(&v18, &location);
  id v13 = v14;
  id v17 = v13;
  [(BYODDeleteEmailRequest *)v12 performRequestWithCallback:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_refreshDomainResultNotification:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 userInfo];
  id v6 = [v5 valueForKey:@"domainData"];
  objc_storeStrong((id *)&self->_domainResult, v6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4B444;
  v8[3] = &unk_B8E88;
  v8[4] = self;
  id v7 = +[EFScheduler mainThreadScheduler];
  [v7 performBlock:v8];
}

- (void)_postNotificationForDomainData:(id)a3
{
  id v5 = a3;
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setValue:v5 forKey:@"domainData"];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"BYOD_DOMAIN_DATA_REFRESH_NOTIFICATION" object:0 userInfo:v3];
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BYODEmailAddressManageViewController;
  [(BYODEmailAddressManageViewController *)&v4 dealloc];
}

- (void)_showErrorAlert
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"BYOD_GENERIC_ERROR_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
  id v5 = +[UIAlertController alertControllerWithTitle:0 message:v4 preferredStyle:1];

  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"OK" value:&stru_B9F70 table:@"AccountPreferences"];
  id v8 = +[UIAlertAction actionWithTitle:v7 style:1 handler:0];

  [v5 addAction:v8];
  id v12 = self;
  id v9 = v5;
  id v13 = v9;
  id v10 = +[EFScheduler mainThreadScheduler];
  [v10 performBlock:&v11];
}

- (BOOL)_showCreateEmailButton
{
  id v3 = [(BYODGetDomainResult *)self->_domainResult domain];
  objc_super v4 = [v3 reverificationStatus];
  if ([v4 isEqualToString:@"VERIFICATION_IN_PROGRESS"])
  {
  }
  else
  {
    id v5 = [(BYODGetDomainResult *)self->_domainResult domain];
    id v6 = [v5 reverificationStatus];
    unsigned __int8 v7 = [v6 isEqualToString:@"VERIFICATION_FAILED"];

    if ((v7 & 1) == 0)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id obj = [(BYODGetDomainResult *)self->_domainResult members];
      id v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v20;
        while (2)
        {
          id v10 = 0;
          do
          {
            if (*(void *)v20 != v9) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v10);
            id v12 = [(ACAccount *)self->_loggedInUserAccount normalizedDSID];
            id v13 = [v11 dsid];
            unsigned int v14 = [v12 isEqualToString:v13];

            if (v14)
            {
              id v15 = [v11 emails];
              unint64_t v16 = (unint64_t)[v15 count];
              LOBYTE(v16) = v16 < [(BYODGetDomainResult *)self->_domainResult maxEmailsPerUser];

              if (v16)
              {

                return 1;
              }
            }
            id v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          id v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
    }
  }
  return 0;
}

- (void)chooseContactController:(id)a3 didSelectContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 kind] && objc_msgSend(v7, "kind") != (char *)&dword_0 + 1)
  {
    id v17 = +[BYODEmailAddressManageViewController log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_7B5A4(v17);
    }
  }
  else
  {
    if ([v7 kind] == (char *)&dword_0 + 1)
    {
      id v8 = [BYODInviteDomainMember alloc];
      loggedInUserAccount = self->_loggedInUserAccount;
      id v10 = [(ACAccount *)loggedInUserAccount accountStore];
      uint64_t v11 = [(BYODGetDomainResult *)self->_domainResult domain];
      id v12 = [v11 name];
      id v13 = [v7 normalizedAddress];
      unsigned int v14 = [(BYODInviteDomainMember *)v8 initWithAccount:loggedInUserAccount accountStore:v10 domain:v12 email:&stru_B9F70 phone:v13];
    }
    else
    {
      id v15 = [BYODInviteDomainMember alloc];
      unint64_t v16 = self->_loggedInUserAccount;
      id v10 = [(ACAccount *)v16 accountStore];
      uint64_t v11 = [(BYODGetDomainResult *)self->_domainResult domain];
      id v12 = [v11 name];
      id v13 = [v7 address];
      unsigned int v14 = [(BYODInviteDomainMember *)v15 initWithAccount:v16 accountStore:v10 domain:v12 email:v13 phone:&stru_B9F70];
    }
    id v17 = v14;

    spinner = self->_spinner;
    if (!spinner)
    {
      long long v19 = [BYODSpinner alloc];
      long long v20 = [v6 chooseContactViewController];
      long long v21 = [(BYODSpinner *)v19 initWithViewController:v20];
      long long v22 = self->_spinner;
      self->_spinner = v21;

      spinner = self->_spinner;
    }
    [(BYODSpinner *)spinner startSpinner];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_4BDC0;
    v23[3] = &unk_B9520;
    objc_copyWeak(&v25, &location);
    id v24 = v6;
    [v17 performRequestWithCallback:v23];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactController, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_domainResult, 0);

  objc_storeStrong((id *)&self->_loggedInUserAccount, 0);
}

@end