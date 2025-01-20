@interface BYODMemberEmailAddressViewController
- (BYODMemberEmailAddressViewController)initWithAccount:(id)a3 domain:(id)a4 member:(id)a5;
- (id)_getRemoveSpecifier;
- (id)specifiers;
- (void)_removeMemberAlert;
- (void)_removeMemberRequest;
- (void)_removeMemberTapped:(id)a3;
- (void)_resendInviteRequest;
- (void)_resendInviteTapped:(id)a3;
- (void)_resendMemberInvite;
- (void)viewDidLoad;
@end

@implementation BYODMemberEmailAddressViewController

- (BYODMemberEmailAddressViewController)initWithAccount:(id)a3 domain:(id)a4 member:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BYODMemberEmailAddressViewController;
  v12 = [(BYODMemberEmailAddressViewController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_loggedInUserAccount, a3);
    objc_storeStrong((id *)&v13->_domainResult, a4);
    objc_storeStrong((id *)&v13->_domainMember, a5);
  }

  return v13;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)BYODMemberEmailAddressViewController;
  [(BYODMemberEmailAddressViewController *)&v9 viewDidLoad];
  v3 = [(BYODUser *)self->_domainMember invitationStatus];
  unsigned int v4 = [v3 isEqualToString:@"INVITED"];

  domainMember = self->_domainMember;
  if (v4) {
    [(BYODUser *)domainMember memberIdentifier];
  }
  else {
  v6 = [(BYODUser *)domainMember fullName];
  }
  v7 = [(BYODMemberEmailAddressViewController *)self navigationItem];
  [v7 setTitle:v6];

  v8 = [(BYODMemberEmailAddressViewController *)self navigationItem];
  [v8 setHidesBackButton:0];
}

- (id)specifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v4 = [(BYODUser *)self->_domainMember invitationStatus];
  unsigned int v5 = [v4 isEqualToString:@"INVITED"];

  if (v5)
  {
    v6 = +[PSSpecifier emptyGroupSpecifier];
    [v3 addObject:v6];
    v7 = [(BYODUser *)self->_domainMember memberIdentifier];
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:4 edit:0];

    objc_super v9 = +[BYODContactsManager sharedInstance];
    id v10 = [v9 avatarImageForUser:self->_domainMember];
    [v8 setProperty:v10 forKey:PSIconImageKey];

    id v11 = [(BYODUser *)self->_domainMember invitedOnDate];
    id v12 = [v11 length];

    if (v12)
    {
      v13 = +[NSBundle bundleForClass:objc_opt_class()];
      v14 = [v13 localizedStringForKey:@"BYOD_MEMBER_INVITE_ON_DATE" value:&stru_B9F70 table:@"AccountPreferences"];
      objc_super v15 = [(BYODUser *)self->_domainMember invitedOnDate];
      v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15);

      [v8 setProperty:v16 forKey:PSTableCellSubtitleTextKey];
    }
    [v8 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v3 addObject:v8];
    v17 = +[NSBundle bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"BYOD_MEMBER_RESEND_INVITE_BUTTON" value:&stru_B9F70 table:@"AccountPreferences"];
    v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v19 setButtonAction:"_resendInviteTapped:"];
    [v3 addObject:v19];
  }
  else
  {
    v20 = [(BYODUser *)self->_domainMember emails];
    id v21 = [v20 count];

    if (v21)
    {
      v22 = +[NSBundle bundleForClass:objc_opt_class()];
      v23 = [v22 localizedStringForKey:@"BYOD_MEMBER_EMAIL_ADDRESS_HEADER" value:&stru_B9F70 table:@"AccountPreferences"];
      v24 = +[PSSpecifier groupSpecifierWithID:@"MEMBER_EMAIL_SPECIFIER_GROUP" name:v23];

      [v3 addObject:v24];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v25 = [(BYODUser *)self->_domainMember emails];
      id v26 = [v25 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v38;
        do
        {
          v28 = 0;
          do
          {
            if (*(void *)v38 != v27) {
              objc_enumerationMutation(v25);
            }
            v29 = [*(id *)(*((void *)&v37 + 1) + 8 * (void)v28) email];
            v30 = +[PSSpecifier preferenceSpecifierNamed:v29 target:self set:0 get:0 detail:0 cell:4 edit:0];
            [v3 addObject:v30];

            v28 = (char *)v28 + 1;
          }
          while (v26 != v28);
          id v26 = [v25 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v26);
      }
    }
  }
  v31 = [(BYODMemberEmailAddressViewController *)self _getRemoveSpecifier];
  [v3 addObjectsFromArray:v31];

  id v32 = [v3 copy];
  v33 = (id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v34 = *v33;
  id *v33 = v32;

  id v35 = *v33;
  return v35;
}

- (id)_getRemoveSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v4 = +[PSSpecifier emptyGroupSpecifier];
  [v3 addObject:v4];

  unsigned int v5 = +[PSSpecifier groupSpecifierWithID:@"BYOD_MEMBER_REMOVE_GROUP_ID"];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"BYOD_MEMBER_REMOVE_BUTTON_FOOTER" value:&stru_B9F70 table:@"AccountPreferences"];
  v8 = [(BYODUser *)self->_domainMember fullName];
  objc_super v9 = [(BYODGetDomainResult *)self->_domainResult domain];
  id v10 = [v9 name];
  id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8, v10);

  [v5 setProperty:v11 forKey:PSFooterTextGroupKey];
  [v3 addObject:v5];
  id v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"BYOD_MEMBER_REMOVE_BUTTON" value:&stru_B9F70 table:@"AccountPreferences"];
  v14 = +[PSSpecifier deleteButtonSpecifierWithName:v13 target:self action:"_removeMemberTapped:"];

  [v14 setProperty:&off_C03C0 forKey:PSAlignmentKey];
  [v3 addObject:v14];
  id v15 = [v3 copy];

  return v15;
}

- (void)_removeMemberAlert
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v4 = [v3 localizedStringForKey:@"BYOD_MEMBER_REMOVE_ALERT_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  unsigned int v5 = [(BYODUser *)self->_domainMember fullName];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);

  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"BYOD_MEMBER_REMOVE_ALERT_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
  objc_super v9 = [(BYODUser *)self->_domainMember fullName];
  id v10 = [(BYODGetDomainResult *)self->_domainResult domain];
  id v11 = [v10 name];
  id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9, v11);

  v13 = +[UIAlertController alertControllerWithTitle:v6 message:v12 preferredStyle:1];
  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  id v15 = [v14 localizedStringForKey:@"CANCEL_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  v16 = +[UIAlertAction actionWithTitle:v15 style:0 handler:0];

  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"BYOD_MEMBER_REMOVE_BUTTON" value:&stru_B9F70 table:@"AccountPreferences"];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_58600;
  v20[3] = &unk_B8CA8;
  v20[4] = self;
  v19 = +[UIAlertAction actionWithTitle:v18 style:2 handler:v20];

  [v13 addAction:v16];
  [v13 addAction:v19];
  [v13 setPreferredAction:v19];
  [(BYODMemberEmailAddressViewController *)self presentViewController:v13 animated:1 completion:0];
}

- (void)_resendMemberInvite
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v4 = [v3 localizedStringForKey:@"BYOD_MEMBER_RESEND_INVITE_ALERT_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];

  unsigned int v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"BYOD_MEMBER_RESEND_INVITE_ALERT_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
  v7 = [(BYODUser *)self->_domainMember memberIdentifier];
  v8 = [(BYODGetDomainResult *)self->_domainResult domain];
  objc_super v9 = [v8 name];
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7, v9);

  id v11 = +[UIAlertController alertControllerWithTitle:v4 message:v10 preferredStyle:1];
  id v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"OK" value:&stru_B9F70 table:@"AccountPreferences"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_588F0;
  v15[3] = &unk_B8CA8;
  v15[4] = self;
  v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v15];

  [v11 addAction:v14];
  [(BYODMemberEmailAddressViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)_removeMemberTapped:(id)a3
{
}

- (void)_resendInviteTapped:(id)a3
{
}

- (void)_removeMemberRequest
{
  id v3 = [BYODRemoveMemberRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  unsigned int v5 = [(ACAccount *)loggedInUserAccount accountStore];
  v6 = [(BYODGetDomainResult *)self->_domainResult domain];
  v7 = [v6 name];
  v8 = [(BYODGetDomainResult *)self->_domainResult domain];
  objc_super v9 = [v8 status];
  id v10 = [(BYODRemoveMemberRequest *)v3 initWithAccount:loggedInUserAccount accountStore:v5 domain:v7 domainStatus:v9 domainMember:self->_domainMember];

  spinner = self->_spinner;
  if (!spinner)
  {
    id v12 = [[BYODSpinner alloc] initWithViewController:self];
    v13 = self->_spinner;
    self->_spinner = v12;

    spinner = self->_spinner;
  }
  [(BYODSpinner *)spinner startSpinner];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_58B0C;
  v14[3] = &unk_B9290;
  objc_copyWeak(&v15, &location);
  [(BYODRemoveMemberRequest *)v10 performRequestWithCallback:v14];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_resendInviteRequest
{
  id v3 = [BYODResendMemberInviteRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  unsigned int v5 = [(ACAccount *)loggedInUserAccount accountStore];
  v6 = [(BYODGetDomainResult *)self->_domainResult domain];
  v7 = [v6 name];
  v8 = [(BYODUser *)self->_domainMember invitedEmail];
  objc_super v9 = [(BYODUser *)self->_domainMember invitedPhoneNumber];
  id v10 = [(BYODResendMemberInviteRequest *)v3 initWithAccount:loggedInUserAccount accountStore:v5 domain:v7 email:v8 phone:v9];

  spinner = self->_spinner;
  if (!spinner)
  {
    id v12 = [[BYODSpinner alloc] initWithViewController:self];
    v13 = self->_spinner;
    self->_spinner = v12;

    spinner = self->_spinner;
  }
  [(BYODSpinner *)spinner startSpinner];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_58FB4;
  v14[3] = &unk_B9290;
  objc_copyWeak(&v15, &location);
  [(BYODResendMemberInviteRequest *)v10 performRequestWithCallback:v14];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_domainMember, 0);
  objc_storeStrong((id *)&self->_domainResult, 0);

  objc_storeStrong((id *)&self->_loggedInUserAccount, 0);
}

@end