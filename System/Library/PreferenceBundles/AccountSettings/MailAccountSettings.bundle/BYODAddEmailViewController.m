@interface BYODAddEmailViewController
+ (id)log;
- (BOOL)_hasMultipleEmailAddress;
- (BOOL)_insertEmailSpecifierAfter:(id)a3;
- (BOOL)_isRowEditableAtIndexPath:(id)a3;
- (BOOL)shouldShowCancel;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BYODAddEmailViewController)initWithACAccount:(id)a3 familyFlow:(BOOL)a4 familyCircle:(id)a5 domainName:(id)a6 domainResult:(id)a7;
- (id)_getDomainMemberFromIdentifier:(id)a3;
- (id)_getEmailAddressListSpecifier;
- (id)_getEmailAddressSpecifier;
- (id)_getMemberSpecifiers;
- (id)_getSpecifierGroupWithMember:(id)a3;
- (id)_getUserFullName;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)valueForSpecifier:(id)a3;
- (int64_t)_emailCount;
- (int64_t)_getMemberTypeByDsid:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_addDomainMemberWithContact:(id)a3 withController:(id)a4;
- (void)_addEmailAddressRow:(id)a3;
- (void)_addEmailForFamily;
- (void)_cancelButtonTapped:(id)a3;
- (void)_didTapAddAPersonButton:(id)a3;
- (void)_didTapCancelButton:(id)a3;
- (void)_didTapEditButton:(id)a3;
- (void)_getMemberPhotos;
- (void)_getPhotoForMember:(id)a3;
- (void)_populatMemberEmailList;
- (void)_populateDomainMembersFromDomainResult:(id)a3;
- (void)_populateDomainMembersFromFamily:(id)a3;
- (void)_removeDomainMember:(id)a3 memberSpecifier:(id)a4 completion:(id)a5;
- (void)_shouldRemoveDomainMember:(id)a3 completion:(id)a4;
- (void)_shouldRemoveEmailAddress:(id)a3 completion:(id)a4;
- (void)_showEmailConfirmation:(id)a3;
- (void)_showErrorAlert;
- (void)_showVerifyEmailConfirmation:(id)a3;
- (void)chooseContactController:(id)a3 didSelectContact:(id)a4;
- (void)reloadSpecifiers;
- (void)setShouldShowCancel:(BOOL)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation BYODAddEmailViewController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_23E84;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7378 != -1) {
    dispatch_once(&qword_D7378, block);
  }
  v2 = (void *)qword_D7370;

  return v2;
}

- (BYODAddEmailViewController)initWithACAccount:(id)a3 familyFlow:(BOOL)a4 familyCircle:(id)a5 domainName:(id)a6 domainResult:(id)a7
{
  id v33 = a3;
  id v34 = a5;
  id v35 = a6;
  id v13 = a7;
  v36.receiver = self;
  v36.super_class = (Class)BYODAddEmailViewController;
  v14 = [(BYODAddEmailViewController *)&v36 init];
  v15 = v14;
  if (v14)
  {
    p_loggedInUserAccount = (id *)&v14->_loggedInUserAccount;
    objc_storeStrong((id *)&v14->_loggedInUserAccount, a3);
    v15->_isFamilyFlow = a4;
    objc_storeStrong((id *)&v15->_domainName, a6);
    dispatch_group_t v17 = dispatch_group_create();
    requestGroup = v15->_requestGroup;
    v15->_requestGroup = (OS_dispatch_group *)v17;

    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    memberEmailDictionary = v15->_memberEmailDictionary;
    v15->_memberEmailDictionary = v19;

    if (v15->_isFamilyFlow)
    {
      objc_storeStrong((id *)&v15->_familyCircle, a5);
      [(BYODAddEmailViewController *)v15 _populateDomainMembersFromDomainResult:v13];
    }
    else
    {
      v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      domainMembers = v15->_domainMembers;
      v15->_domainMembers = v21;

      v23 = [BYODUser alloc];
      v37[0] = @"dsid";
      v32 = [*p_loggedInUserAccount normalizedDSID];
      v38[0] = v32;
      v37[1] = @"firstName";
      v24 = objc_msgSend(*p_loggedInUserAccount, "aa_firstName");
      v38[1] = v24;
      v37[2] = @"lastName";
      v25 = objc_msgSend(*p_loggedInUserAccount, "aa_lastName");
      v38[2] = v25;
      v37[3] = @"fullName";
      v26 = [*p_loggedInUserAccount userFullName];
      v38[3] = v26;
      v27 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];
      v28 = [(BYODUser *)v23 initWithDictionary:v27];

      [(NSMutableArray *)v15->_domainMembers addObject:v28];
    }
    objc_storeStrong((id *)&v15->_domainResult, a7);
    v15->_isEditing = 0;
    v29 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    addEmailButtonSpecifiers = v15->_addEmailButtonSpecifiers;
    v15->_addEmailButtonSpecifiers = v29;
  }
  return v15;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)BYODAddEmailViewController;
  [(BYODAddEmailViewController *)&v14 viewDidLoad];
  v3 = [(BYODAddEmailViewController *)self navigationItem];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"BYOD_ADD_DOMAIN_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  [v3 setTitle:v5];

  v6 = [(BYODAddEmailViewController *)self navigationItem];
  [v6 setHidesBackButton:0];

  v7 = [(BYODAddEmailViewController *)self navigationItem];
  id v8 = objc_alloc((Class)UIBarButtonItem);
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"CONTINUE_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  id v11 = [v8 initWithTitle:v10 style:0 target:self action:"_showEmailConfirmation:"];
  [v7 setRightBarButtonItem:v11];

  if (self->_isFamilyFlow) {
    [(BYODAddEmailViewController *)self _getMemberPhotos];
  }
  if ([(BYODAddEmailViewController *)self shouldShowCancel])
  {
    v12 = [(BYODAddEmailViewController *)self navigationItem];
    id v13 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelButtonTapped:"];
    [v12 setLeftBarButtonItem:v13];
  }
}

- (void)_cancelButtonTapped:(id)a3
{
}

- (void)_showEmailConfirmation:(id)a3
{
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"CONFIRM_EMAIL_MESSAGE%1$ld" value:&stru_B9F70 table:@"AccountPreferences"];
  v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, [(BYODAddEmailViewController *)self _emailCount]);

  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"CONFIRM_EMAIL_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  v9 = +[UIAlertController alertControllerWithTitle:v8 message:v6 preferredStyle:1];

  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"CANCEL_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  v12 = +[UIAlertAction actionWithTitle:v11 style:1 handler:0];

  id v13 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v14 = [v13 localizedStringForKey:@"CONFIRM_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_247FC;
  v16[3] = &unk_B8CA8;
  v16[4] = self;
  v15 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v16];

  [v9 addAction:v12];
  [v9 addAction:v15];
  [v9 setPreferredAction:v15];
  [(BYODAddEmailViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)_showVerifyEmailConfirmation:(id)a3
{
  id v4 = a3;
  if (self->_isFamilyFlow)
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"VERIFY_EMAIL_MESSAGE_FAMILY" value:&stru_B9F70 table:@"AccountPreferences"];
  }
  else
  {
    if ([(BYODAddEmailViewController *)self _hasMultipleEmailAddress])
    {
      v5 = +[NSBundle bundleForClass:objc_opt_class()];
      [v5 localizedStringForKey:@"VERIFY_EMAIL_MESSAGE_MULTIPLE_ADDRESS" value:&stru_B9F70 table:@"AccountPreferences"];
    }
    else
    {
      v5 = +[NSBundle bundleForClass:objc_opt_class()];
      [v5 localizedStringForKey:@"VERIFY_EMAIL_MESSAGE_SINGLE_ADDRESS" value:&stru_B9F70 table:@"AccountPreferences"];
    uint64_t v6 = };
  }
  v7 = (void *)v6;

  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"VERIFY_EMAIL_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  v10 = +[UIAlertController alertControllerWithTitle:v9 message:v7 preferredStyle:1];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"OK_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  objc_super v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_24B60;
  dispatch_group_t v17 = &unk_B8FE8;
  objc_copyWeak(&v18, &location);
  id v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:&v14];

  objc_msgSend(v10, "addAction:", v13, v14, v15, v16, v17);
  [(BYODAddEmailViewController *)self presentViewController:v10 animated:1 completion:0];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (id)specifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[PSSpecifier groupSpecifierWithID:@"INFO_HEADER_SPECIFIER"];
  if (self->_isFamilyFlow)
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    [v5 localizedStringForKey:@"BYOD_ADD_DOMAIN_BODY_YOU_AND_OTHERS" value:&stru_B9F70 table:@"AccountPreferences"];
  }
  else
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    [v5 localizedStringForKey:@"BYOD_ADD_DOMAIN_BODY_ONLY_YOU" value:&stru_B9F70 table:@"AccountPreferences"];
  uint64_t v6 = };
  [v4 setProperty:v6 forKey:PSFooterTextGroupKey];

  [v4 setProperty:@"0" forKey:@"GROUP_INDEX"];
  [v3 addObject:v4];
  v7 = +[PSSpecifier emptyGroupSpecifier];
  [v3 addObject:v7];

  if (_os_feature_enabled_impl())
  {
    if (self->_isFamilyFlow)
    {
      id v8 = [(NSMutableArray *)self->_domainMembers count];
      if (v8 < (id)[(BYODGetDomainResult *)self->_domainResult maxMembersPerDomain])
      {
        v9 = +[NSBundle bundleForClass:objc_opt_class()];
        v10 = [v9 localizedStringForKey:@"BYOD_ADD_DOMAIN_ADD_PEOPLE_BUTTON_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
        id v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:13 edit:0];

        [v11 setButtonAction:"_didTapAddAPersonButton:"];
        [v11 setProperty:&__kCFBooleanFalse forKey:@"editableSpecifier"];
        [v3 addObject:v11];
      }
    }
  }
  v12 = [(BYODAddEmailViewController *)self _getEmailAddressListSpecifier];
  [v3 addObjectsFromArray:v12];

  id v13 = [v3 copy];
  uint64_t v14 = OBJC_IVAR___PSListController__specifiers;
  uint64_t v15 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v13;

  id v16 = [objc_alloc((Class)PSSpecifierGroupIndex) initWithSpecifiers:*(void *)&self->PSListController_opaque[v14]];
  dispatch_group_t v17 = (void *)_specifierGroupIndex;
  _specifierGroupIndex = (uint64_t)v16;

  id v18 = *(id *)&self->PSListController_opaque[v14];
  return v18;
}

- (void)reloadSpecifiers
{
  v3.receiver = self;
  v3.super_class = (Class)BYODAddEmailViewController;
  [(BYODAddEmailViewController *)&v3 reloadSpecifiers];
  if (self->_isFamilyFlow) {
    [(BYODAddEmailViewController *)self _getMemberPhotos];
  }
}

- (id)_getEmailAddressListSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if (self->_isFamilyFlow)
  {
    id v4 = [(BYODAddEmailViewController *)self _getMemberSpecifiers];
    [v3 addObjectsFromArray:v4];
  }
  else
  {
    v5 = [(ACAccount *)self->_loggedInUserAccount normalizedDSID];
    id v4 = +[PSSpecifier groupSpecifierWithID:v5];

    uint64_t v6 = [(ACAccount *)self->_loggedInUserAccount normalizedDSID];
    [v4 setProperty:v6 forKey:@"MEMBER_DSID"];

    [v4 setButtonAction:"_didTapEditButton:"];
    v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    [v4 setProperty:v8 forKey:PSHeaderCellClassGroupKey];

    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"BYOD_ADD_DOMAIN_EMAIL_ADDRESSES_HEADER" value:&stru_B9F70 table:@"AccountPreferences"];
    [v4 setProperty:v10 forKey:@"headerTitle"];

    if (self->_isEditing) {
      [v4 setProperty:@"YES" forKey:@"tableEditing"];
    }
    objc_storeStrong((id *)&self->_ownerGroupSpecifier, v4);
    [v3 addObject:v4];
    id v11 = +[BYODContactsManager sharedInstance];
    v12 = [v11 avatarImageForMeContact];

    if (!v12)
    {
      v27 = +[BYODContactsManager sharedInstance];
      v26 = [(BYODGetDomainResult *)self->_domainResult domain];
      v25 = [v26 owner];
      id v13 = [v25 firstName];
      uint64_t v14 = [(BYODGetDomainResult *)self->_domainResult domain];
      uint64_t v15 = [v14 owner];
      id v16 = [v15 lastName];
      v12 = [v27 monogramWithFirstName:v13 andLastName:v16];
    }
    dispatch_group_t v17 = [(ACAccount *)self->_loggedInUserAccount userFullName];
    id v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:0 get:"valueForSpecifier:" detail:0 cell:4 edit:0];

    v19 = +[NSBundle bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"BYOD_DOMAIN_OWNER_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
    [v18 setProperty:v20 forKey:PSValueKey];

    [v18 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v18 setProperty:v12 forKey:PSIconImageKey];
    v21 = [(ACAccount *)self->_loggedInUserAccount normalizedDSID];
    v22 = +[NSString stringWithFormat:@"MEMBER_%@", v21];
    [v18 setIdentifier:v22];

    [v18 setProperty:&__kCFBooleanFalse forKey:@"editableSpecifier"];
    [v3 addObject:v18];
    v23 = [(BYODAddEmailViewController *)self _getEmailAddressSpecifier];
    [v3 addObject:v23];
  }

  return v3;
}

- (id)_getMemberSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = self->_domainMembers;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v26;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v9 = [v8 dsid];
        int64_t v10 = [(BYODAddEmailViewController *)self _getMemberTypeByDsid:v9];

        if (!v10)
        {
          id v11 = [(BYODAddEmailViewController *)self _getSpecifierGroupWithMember:v8];
          [v3 addObjectsFromArray:v11];
        }
      }
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = self->_domainMembers;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v22;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
        dispatch_group_t v17 = objc_msgSend(v16, "dsid", (void)v21);
        int64_t v18 = [(BYODAddEmailViewController *)self _getMemberTypeByDsid:v17];

        if (v18)
        {
          v19 = [(BYODAddEmailViewController *)self _getSpecifierGroupWithMember:v16];
          [v3 addObjectsFromArray:v19];
        }
      }
      id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v13);
  }

  return v3;
}

- (id)_getSpecifierGroupWithMember:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v6 = [v4 memberIdentifier];
  v7 = +[PSSpecifier groupSpecifierWithID:v6];

  [v7 setButtonAction:"_didTapEditButton:"];
  [v5 addObject:v7];
  id v8 = [v4 fullName];
  v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:"valueForSpecifier:" detail:0 cell:4 edit:0];

  int64_t v10 = [v4 dsid];
  int64_t v11 = [(BYODAddEmailViewController *)self _getMemberTypeByDsid:v10];

  if (v11 == 1)
  {
    id v16 = +[NSBundle bundleForClass:objc_opt_class()];
    dispatch_group_t v17 = [v16 localizedStringForKey:@"BYOD_FAMILY_MEMBER_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
    [v9 setProperty:v17 forKey:PSTableCellSubtitleTextKey];
    int64_t v18 = &__kCFBooleanTrue;
LABEL_7:

    goto LABEL_9;
  }
  if (!v11)
  {
    v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v7 setProperty:v13 forKey:PSHeaderCellClassGroupKey];

    uint64_t v14 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v15 = [v14 localizedStringForKey:@"BYOD_ADD_DOMAIN_EMAIL_ADDRESSES_HEADER" value:&stru_B9F70 table:@"AccountPreferences"];
    [v7 setProperty:v15 forKey:@"headerTitle"];

    if (self->_isEditing) {
      [v7 setProperty:@"YES" forKey:@"tableEditing"];
    }
    objc_storeStrong((id *)&self->_ownerGroupSpecifier, v7);
    id v16 = +[NSBundle bundleForClass:objc_opt_class()];
    dispatch_group_t v17 = [v16 localizedStringForKey:@"BYOD_DOMAIN_OWNER_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
    [v9 setProperty:v17 forKey:PSTableCellSubtitleTextKey];
    int64_t v18 = &__kCFBooleanFalse;
    goto LABEL_7;
  }
  int64_t v18 = &__kCFBooleanTrue;
LABEL_9:
  [v9 setProperty:v18 forKey:@"editableSpecifier"];
  [v9 setProperty:objc_opt_class() forKey:PSCellClassKey];
  v19 = [v4 memberIdentifier];
  [v9 setProperty:v19 forKey:@"MEMBER_DSID"];

  v20 = [v4 memberIdentifier];
  long long v21 = +[NSString stringWithFormat:@"MEMBER_%@", v20];
  [v9 setIdentifier:v21];

  [v5 addObject:v9];
  long long v22 = [(BYODAddEmailViewController *)self _getEmailAddressSpecifier];
  [v5 addObject:v22];

  return v5;
}

- (void)_getMemberPhotos
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = self->_domainMembers;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v22;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v8 = [v7 dsid];
        int64_t v9 = [(BYODAddEmailViewController *)self _getMemberTypeByDsid:v8];

        if (!v9) {
          [(BYODAddEmailViewController *)self _getPhotoForMember:v7];
        }
      }
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int64_t v10 = self->_domainMembers;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * (void)j);
        uint64_t v15 = objc_msgSend(v14, "dsid", (void)v17);
        int64_t v16 = [(BYODAddEmailViewController *)self _getMemberTypeByDsid:v15];

        if (v16) {
          [(BYODAddEmailViewController *)self _getPhotoForMember:v14];
        }
      }
      id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v11);
  }
}

- (void)_getPhotoForMember:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[BYODContactsManager sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_26054;
  v7[3] = &unk_B9038;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 fetchAvatarImageForUser:v6 withCompletion:v7];
}

- (id)_getUserFullName
{
  return [(ACAccount *)self->_loggedInUserAccount userFullName];
}

- (id)_getEmailAddressSpecifier
{
  v2 = +[PSTextFieldSpecifier preferenceSpecifierNamed:&stru_B9F70 target:self set:"_setEmailAddress:withSpecifier:" get:0 detail:0 cell:8 edit:0];
  [v2 setKeyboardType:0 autoCaps:0 autoCorrection:1];
  [v2 setProperty:&__kCFBooleanTrue forKey:@"editableSpecifier"];

  return v2;
}

- (void)_addEmailAddressRow:(id)a3
{
}

- (id)valueForSpecifier:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:PSValueKey];

  return v3;
}

- (void)_populatMemberEmailList
{
  id v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  memberEmailDictionary = self->_memberEmailDictionary;
  self->_memberEmailDictionary = v3;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = self;
  id obj = *(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v20 = *(void *)v23;
    uint64_t v19 = PSTableCellKey;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v8 = [v7 propertyForKey:v19];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int64_t v9 = [v8 textField];
          int64_t v10 = [v9 text];
          BOOL v11 = [v10 length] == 0;

          if (!v11)
          {
            uint64_t v12 = [(BYODAddEmailViewController *)v21 getGroupSpecifierForSpecifier:v7];
            id v13 = [v12 identifier];
            id v14 = [(NSMutableDictionary *)v21->_memberEmailDictionary valueForKey:v13];
            if (!v14) {
              id v14 = objc_alloc_init((Class)NSMutableArray);
            }
            uint64_t v15 = [v9 text];
            if (([v15 containsString:@"@"] & 1) == 0)
            {
              int64_t v16 = [v9 text];
              uint64_t v17 = +[NSString stringWithFormat:@"%@@%@", v16, v21->_domainName];

              uint64_t v15 = (void *)v17;
            }
            [v14 addObject:v15];
            [(NSMutableDictionary *)v21->_memberEmailDictionary setValue:v14 forKey:v13];
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }
}

- (int64_t)_getMemberTypeByDsid:(id)a3
{
  id v4 = a3;
  id v5 = [(ACAccount *)self->_loggedInUserAccount normalizedDSID];
  if ([v4 isEqualToString:v5])
  {
    int64_t v6 = 0;
  }
  else
  {
    v7 = [(FAFamilyCircle *)self->_familyCircle members];
    id v8 = [v7 valueForKey:@"dsid"];
    int64_t v9 = [v8 valueForKey:@"stringValue"];

    if ([v9 containsObject:v4]) {
      int64_t v6 = 1;
    }
    else {
      int64_t v6 = 2;
    }
  }
  return v6;
}

- (void)_didTapAddAPersonButton:(id)a3
{
  id v4 = +[BYODAddEmailViewController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v18 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "did tap Add A Person button", v18, 2u);
  }

  id v5 = [BYODContactPickerController alloc];
  int64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"BYOD_CUSTOM_DOMAIN_INVITE_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  int64_t v9 = [v8 localizedStringForKey:@"BYOD_CUSTOM_DOMAIN_INVITE_SEND_BUTTON" value:&stru_B9F70 table:@"AccountPreferences"];
  int64_t v10 = [(BYODContactPickerController *)v5 initWithNavBarTitle:v7 rightButtonBarText:v9];
  contactController = self->_contactController;
  self->_contactController = v10;

  [(BYODContactPickerController *)self->_contactController setDelegate:self];
  id v12 = objc_alloc((Class)UINavigationController);
  id v13 = [(BYODContactPickerController *)self->_contactController chooseContactViewController];
  id v14 = [v12 initWithRootViewController:v13];

  id v15 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_didTapCancelButton:"];
  int64_t v16 = [(BYODContactPickerController *)self->_contactController chooseContactViewController];
  uint64_t v17 = [v16 navigationItem];
  [v17 setLeftBarButtonItem:v15];

  [(BYODAddEmailViewController *)self presentViewController:v14 animated:1 completion:0];
}

- (void)_didTapCancelButton:(id)a3
{
}

- (void)_didTapEditButton:(id)a3
{
  self->_isEditing ^= 1u;
  id v4 = [(BYODAddEmailViewController *)self table];
  [v4 setEditing:self->_isEditing animated:1];

  id v5 = [(PSSpecifier *)self->_ownerGroupSpecifier propertyForKey:@"headerView"];
  [v5 toggleDoneButton:self->_isEditing];
}

- (void)_addEmailForFamily
{
  if (self->_spinner)
  {
    id v3 = [[BYODSpinner alloc] initWithViewController:self];
    spinner = self->_spinner;
    self->_spinner = v3;

    id v5 = self->_spinner;
  }
  else
  {
    id v5 = 0;
  }
  [(BYODSpinner *)v5 startSpinner];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = self;
  id obj = [(NSMutableDictionary *)self->_memberEmailDictionary allKeys];
  id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v20 = *(void *)v26;
    do
    {
      id v21 = v6;
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        long long v22 = [(BYODAddEmailViewController *)v23 _getDomainMemberFromIdentifier:v8];
        int64_t v9 = [BYODAddEmailRequest alloc];
        loggedInUserAccount = v23->_loggedInUserAccount;
        BOOL v11 = [(ACAccount *)loggedInUserAccount accountStore];
        domainName = v23->_domainName;
        id v13 = [(NSMutableDictionary *)v23->_memberEmailDictionary valueForKey:v8];
        id v14 = [v13 copy];
        id v15 = [v22 dsid];
        int64_t v16 = [v22 invitedEmail];
        uint64_t v17 = [v22 invitedPhoneNumber];
        long long v18 = [(BYODAddEmailRequest *)v9 initWithAccount:loggedInUserAccount accountStore:v11 domain:domainName emailArray:v14 dsid:v15 withEmail:v16 withPhone:v17];

        dispatch_group_enter((dispatch_group_t)v23->_requestGroup);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_26DB4;
        v24[3] = &unk_B9060;
        v24[4] = v23;
        [(BYODAddEmailRequest *)v18 performRequestWithCallback:v24];
      }
      id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }
}

- (id)_getDomainMemberFromIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_domainMembers;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        int64_t v10 = objc_msgSend(v9, "memberIdentifier", (void)v13);
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_addDomainMemberWithContact:(id)a3 withController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 kind] == (char *)&dword_0 + 1)
  {
    uint64_t v8 = [BYODAddMemberRequest alloc];
    loggedInUserAccount = self->_loggedInUserAccount;
    int64_t v10 = [(ACAccount *)loggedInUserAccount accountStore];
    unsigned __int8 v11 = [(BYODGetDomainResult *)self->_domainResult domain];
    id v12 = [v11 name];
    long long v13 = [v6 normalizedAddress];
    long long v14 = [(BYODAddMemberRequest *)v8 initWithAccount:loggedInUserAccount accountStore:v10 domain:v12 email:&stru_B9F70 phone:v13];
  }
  else
  {
    long long v15 = [BYODAddMemberRequest alloc];
    long long v16 = self->_loggedInUserAccount;
    int64_t v10 = [(ACAccount *)v16 accountStore];
    unsigned __int8 v11 = [(BYODGetDomainResult *)self->_domainResult domain];
    id v12 = [v11 name];
    long long v13 = [v6 address];
    long long v14 = [(BYODAddMemberRequest *)v15 initWithAccount:v16 accountStore:v10 domain:v12 email:v13 phone:&stru_B9F70];
  }
  uint64_t v17 = v14;

  long long v18 = [[BYODSpinner alloc] initWithViewController:v7];
  spinner = self->_spinner;
  self->_spinner = v18;

  [(BYODSpinner *)self->_spinner startSpinner];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_27248;
  v22[3] = &unk_B90B0;
  objc_copyWeak(&v25, &location);
  id v20 = v7;
  id v23 = v20;
  id v21 = v6;
  id v24 = v21;
  [(BYODAddMemberRequest *)v17 performRequestWithCallback:v22];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)_removeDomainMember:(id)a3 memberSpecifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = [BYODRemoveMemberRequest alloc];
  loggedInUserAccount = self->_loggedInUserAccount;
  long long v13 = [(ACAccount *)loggedInUserAccount accountStore];
  domainName = self->_domainName;
  long long v15 = [(BYODGetDomainResult *)self->_domainResult domain];
  long long v16 = [v15 status];
  uint64_t v17 = [(BYODRemoveMemberRequest *)v11 initWithAccount:loggedInUserAccount accountStore:v13 domain:domainName domainStatus:v16 domainMember:v8];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_277D4;
  v20[3] = &unk_B90D8;
  objc_copyWeak(&v23, &location);
  id v18 = v9;
  id v21 = v18;
  id v19 = v10;
  id v22 = v19;
  [(BYODRemoveMemberRequest *)v17 performRequestWithCallback:v20];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return [(BYODAddEmailViewController *)self _insertEmailSpecifierAfter:a3];
}

- (BOOL)_insertEmailSpecifierAfter:(id)a3
{
  id v19 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = *(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v22;
    uint64_t v6 = PSTableCellKey;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v9 = [v8 propertyForKey:v6];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = [v9 textField];
          if ([v19 isEqual:v10])
          {
            unsigned __int8 v11 = [v19 text];
            BOOL v12 = [v11 length] == 0;

            if (!v12)
            {
              long long v13 = [(BYODAddEmailViewController *)self getGroupSpecifierForSpecifier:v8];
              uint64_t v20 = 0;
              if (v13)
              {
                [(BYODAddEmailViewController *)self getGroup:&v20 row:0 ofSpecifier:v13];
                long long v14 = [(BYODAddEmailViewController *)self specifiersInGroup:v20];
                long long v15 = (char *)[v14 count];
                if (v15 - 2 < (char *)[(BYODGetDomainResult *)self->_domainResult maxEmailsPerUser])
                {
                  long long v16 = [(BYODAddEmailViewController *)self _getEmailAddressSpecifier];
                  [(BYODAddEmailViewController *)self insertSpecifier:v16 atEndOfGroup:v20];
                }
              }

              goto LABEL_18;
            }
          }
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return 1;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return [(BYODAddEmailViewController *)self _isRowEditableAtIndexPath:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)BYODAddEmailViewController;
  uint64_t v5 = [(BYODAddEmailViewController *)&v13 tableView:a3 cellForRowAtIndexPath:a4];
  uint64_t v6 = [v5 detailTextLabel];
  [v6 setNumberOfLines:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v5 textField];
    if (v7)
    {
      id v8 = +[NSBundle bundleForClass:objc_opt_class()];
      id v9 = [v8 localizedStringForKey:@"BYOD_UPDATE_EMAIL_TEXT_PLACEHOLDER" value:&stru_B9F70 table:@"AccountPreferences"];
      [v7 setPlaceholder:v9];

      id v10 = +[NSString stringWithFormat:@"%@%@", @"@", self->_domainName];
      unsigned __int8 v11 = +[UIColor secondaryLabelColor];
      [v7 _setSuffix:v10 withColor:v11];

      [v7 setDelegate:self];
    }
  }

  return v5;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(BYODAddEmailViewController *)self _isRowEditableAtIndexPath:v5])
  {
    uint64_t v6 = [(BYODAddEmailViewController *)self table];
    unsigned int v7 = [v6 isEditing];

    int64_t v8 = v7;
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v31 = a3;
  id v8 = a5;
  if (a4 == 1)
  {
    id v30 = v8;
    if ([v8 row])
    {
      v35.receiver = self;
      v35.super_class = (Class)BYODAddEmailViewController;
      id v9 = [(BYODAddEmailViewController *)&v35 tableView:v31 cellForRowAtIndexPath:v30];
      id v10 = [v9 textField];
      v29 = [v10 text];

      unsigned __int8 v11 = [v9 specifier];
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_28720;
      v32[3] = &unk_B9100;
      objc_copyWeak(&v34, &location);
      id v12 = v11;
      id v33 = v12;
      objc_super v13 = objc_retainBlock(v32);
      long long v14 = +[NSString stringWithFormat:@"%@@%@", v29, self->_domainName];
      [(BYODAddEmailViewController *)self _shouldRemoveEmailAddress:v14 completion:v13];

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }
    else
    {
      long long v27 = [(BYODAddEmailViewController *)self specifierAtIndexPath:v30];
      v29 = [v27 propertyForKey:@"MEMBER_DSID"];
      long long v28 = [(BYODAddEmailViewController *)self _getDomainMemberFromIdentifier:v29];
      long long v26 = -[BYODAddEmailViewController specifiersInGroup:](self, "specifiersInGroup:", [v30 section]);
      id v15 = objc_alloc_init((Class)NSMutableArray);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v16 = v26;
      id v17 = [v16 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v46;
        do
        {
          id v19 = 0;
          do
          {
            if (*(void *)v46 != v18) {
              objc_enumerationMutation(v16);
            }
            uint64_t v20 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v19);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v21 = [v20 propertyForKey:@"cellObject"];
              [v15 addObject:v21];
            }
            id v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          id v17 = [v16 countByEnumeratingWithState:&v45 objects:v49 count:16];
        }
        while (v17);
      }

      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_284F4;
      v41[3] = &unk_B9100;
      objc_copyWeak(&v43, &location);
      id v22 = v16;
      id v42 = v22;
      long long v23 = objc_retainBlock(v41);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_28624;
      v36[3] = &unk_B9128;
      objc_copyWeak(&v40, &location);
      id v9 = v27;
      id v37 = v9;
      id v12 = v28;
      id v38 = v12;
      id v39 = v23;
      long long v24 = v23;
      id v25 = objc_retainBlock(v36);
      [(BYODAddEmailViewController *)self _shouldRemoveDomainMember:v12 completion:v25];

      objc_destroyWeak(&v40);
      objc_destroyWeak(&v43);
      objc_destroyWeak(&location);
    }
    id v8 = v30;
  }
}

- (void)_shouldRemoveDomainMember:(id)a3 completion:(id)a4
{
  id v23 = a3;
  id v24 = a4;
  uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v7 = [v6 localizedStringForKey:@"BYOD_ADD_DOMAIN_DELETE_MEMBER_CONFIRMATION_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  id v8 = [v23 fullName];
  uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);

  id v22 = (void *)v9;
  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v11 = [v10 localizedStringForKey:@"BYOD_ADD_DOMAIN_DELETE_MEMBER_CONFIRMATION_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
  id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, self->_domainName);
  objc_super v13 = self;

  long long v14 = +[UIAlertController alertControllerWithTitle:v9 message:v12 preferredStyle:1];
  id v15 = +[NSBundle bundleForClass:objc_opt_class()];
  id v16 = [v15 localizedStringForKey:@"CANCEL_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  id v17 = +[UIAlertAction actionWithTitle:v16 style:1 handler:0];

  uint64_t v18 = +[NSBundle bundleForClass:objc_opt_class()];
  id v19 = [v18 localizedStringForKey:@"REMOVE_FROM_TRASH" value:&stru_B9F70 table:@"AccountPreferences"];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_28C34;
  v25[3] = &unk_B8CD0;
  id v20 = v24;
  id v26 = v20;
  long long v21 = +[UIAlertAction actionWithTitle:v19 style:2 handler:v25];

  [v14 addAction:v17];
  [v14 addAction:v21];
  [v14 setPreferredAction:v21];
  [(BYODAddEmailViewController *)v13 presentViewController:v14 animated:1 completion:0];
}

- (void)_shouldRemoveEmailAddress:(id)a3 completion:(id)a4
{
  id v20 = a3;
  id v21 = a4;
  uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"BYOD_ADD_DOMAIN_DELETE_ADDRESS_CONFIRMATION_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];

  id v19 = (void *)v7;
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"BYOD_ADD_DOMAIN_DELETE_ADDRESS_CONFIRMATION_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v20);

  unsigned __int8 v11 = +[UIAlertController alertControllerWithTitle:v7 message:v10 preferredStyle:1];
  id v12 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v13 = [v12 localizedStringForKey:@"CANCEL_TEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  long long v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:0];

  id v15 = +[NSBundle bundleForClass:objc_opt_class()];
  id v16 = [v15 localizedStringForKey:@"REMOVE_FROM_TRASH" value:&stru_B9F70 table:@"AccountPreferences"];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_28FD4;
  v22[3] = &unk_B8CD0;
  id v17 = v21;
  id v23 = v17;
  uint64_t v18 = +[UIAlertAction actionWithTitle:v16 style:2 handler:v22];

  [v11 addAction:v14];
  [v11 addAction:v18];
  [v11 setPreferredAction:v18];
  [(BYODAddEmailViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (BOOL)_hasMultipleEmailAddress
{
  return [(BYODAddEmailViewController *)self _emailCount] > 1;
}

- (int64_t)_emailCount
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = *(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  int64_t v2 = 0;
  id v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
    uint64_t v5 = PSTableCellKey;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v6) propertyForKey:v5];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = [v7 textField];
          uint64_t v9 = [v8 text];
          BOOL v10 = [v9 length] != 0;

          v2 += v10;
        }

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v3 != v6);
      id v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }

  return v2;
}

- (void)_showErrorAlert
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"BYOD_GENERIC_ERROR_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
  uint64_t v5 = +[UIAlertController alertControllerWithTitle:0 message:v4 preferredStyle:1];

  uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"OK" value:&stru_B9F70 table:@"AccountPreferences"];
  id v8 = +[UIAlertAction actionWithTitle:v7 style:1 handler:0];

  [v5 addAction:v8];
  id v12 = self;
  id v9 = v5;
  id v13 = v9;
  BOOL v10 = +[EFScheduler mainThreadScheduler];
  [v10 performBlock:&v11];
}

- (void)_populateDomainMembersFromDomainResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  domainMembers = self->_domainMembers;
  self->_domainMembers = v5;

  uint64_t v7 = self->_domainMembers;
  id v8 = [v4 getDomainOwnerMember];
  [(NSMutableArray *)v7 addObject:v8];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = [v4 members];
  id v19 = self;
  id obj = v9;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v14 = [v13 dsid];
        long long v15 = [v4 domain];
        long long v16 = [v15 owner];
        id v17 = [v16 dsid];
        unsigned __int8 v18 = [v14 isEqualToString:v17];

        if ((v18 & 1) == 0) {
          [(NSMutableArray *)v19->_domainMembers addObject:v13];
        }
      }
      id v9 = obj;
      id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
}

- (void)_populateDomainMembersFromFamily:(id)a3
{
  id v21 = a3;
  id v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  domainMembers = self->_domainMembers;
  self->_domainMembers = v4;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [v21 members];
  id v6 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v6)
  {
    uint64_t v23 = *(void *)v25;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v9 = [(ACAccount *)self->_loggedInUserAccount normalizedDSID];
        id v10 = [v8 dsid];
        uint64_t v11 = +[NSString stringWithFormat:@"%@", v10];
        unsigned int v12 = [v9 isEqualToString:v11];

        if (v12)
        {
          id v13 = [BYODUser alloc];
          v28[0] = @"dsid";
          long long v14 = [v8 dsid];
          long long v15 = +[NSString stringWithFormat:@"%@", v14];
          v29[0] = v15;
          v28[1] = @"firstName";
          long long v16 = [v8 firstName];
          v29[1] = v16;
          v28[2] = @"lastName";
          id v17 = [v8 lastName];
          v29[2] = v17;
          v28[3] = @"fullName";
          unsigned __int8 v18 = [v8 fullName];
          v29[3] = v18;
          id v19 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4];
          id v20 = [(BYODUser *)v13 initWithDictionary:v19];

          [(NSMutableArray *)self->_domainMembers addObject:v20];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v6);
  }
}

- (BOOL)_isRowEditableAtIndexPath:(id)a3
{
  id v3 = [(BYODAddEmailViewController *)self specifierAtIndexPath:a3];
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
  uint64_t v7 = [v6 textField];
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

- (void)chooseContactController:(id)a3 didSelectContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 kind] && objc_msgSend(v7, "kind") != (char *)&dword_0 + 1)
  {
    id v9 = +[BYODAddEmailViewController log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_7B5A4(v9);
    }
  }
  else
  {
    id v8 = [v6 chooseContactViewController];
    [(BYODAddEmailViewController *)self _addDomainMemberWithContact:v7 withController:v8];
  }
}

- (BOOL)shouldShowCancel
{
  return self->_shouldShowCancel;
}

- (void)setShouldShowCancel:(BOOL)a3
{
  self->_shouldShowCancel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addEmailButtonSpecifiers, 0);
  objc_storeStrong((id *)&self->_ownerGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_contactController, 0);
  objc_storeStrong((id *)&self->_loggedInUserAccount, 0);
  objc_storeStrong((id *)&self->_domainResult, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_requestGroup, 0);
  objc_storeStrong((id *)&self->_memberEmailDictionary, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_familyCircle, 0);

  objc_storeStrong((id *)&self->_domainMembers, 0);
}

@end