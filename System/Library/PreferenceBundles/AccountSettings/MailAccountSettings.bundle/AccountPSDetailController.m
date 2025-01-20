@interface AccountPSDetailController
+ (id)log;
- (BOOL)_addAccount:(id)a3;
- (BOOL)_bypassAccountValidation;
- (BOOL)_hasEnoughInformationForEasySetup;
- (BOOL)_hasICloudMailAccount;
- (BOOL)_setupDeliveryAccountForValidatedAccount:(id)a3;
- (BOOL)_shouldHideEnableAndDelete;
- (BOOL)_showBackButton;
- (BOOL)haveEnoughValues;
- (BOOL)shouldDisplayNextButtonForChosenType;
- (BOOL)validateEmailAddress:(id)a3;
- (BYODListDomain)domainList;
- (Class)accountClass;
- (MatterhornUpsellManager)upsellManager;
- (id)_createDeliveryAccountWithUIValues;
- (id)_customDomainSpecifier;
- (id)_defaultAlias;
- (id)_descriptionFromEmailAddress:(id)a3;
- (id)_getMailSpecifier;
- (id)_incomingAccountPropertyForKey:(id)a3;
- (id)_isAliasEnabledForSpecifier:(id)a3;
- (id)_isMailEnabled:(id)a3;
- (id)_mailSwitchSpecifier;
- (id)_outgoingAccountPropertyForKey:(id)a3;
- (id)_setOfKeysForAlteredValuesInDictionary:(id)a3 originalDictionary:(id)a4;
- (id)_tobleroneMailSwitchSpecifier;
- (id)accountPropertyForKey:(id)a3 withSpecifier:(id)a4;
- (id)accountPropertyWithSpecifier:(id)a3;
- (id)addAccountFromCurrentSettings;
- (id)addAlternateEmailAccountFromCurrentSettings;
- (id)chosenType;
- (id)chosenType:(id)a3;
- (id)easySetupNote;
- (id)emailAliasDisplayStringWithSpecifier:(id)a3;
- (id)emailAliasListController:(id)a3 accountTypeForSpecifier:(id)a4;
- (id)emailAliasListController:(id)a3 defaultEmailAliasForSpecifier:(id)a4;
- (id)emailAliasListController:(id)a3 emailAliasListForSpecifier:(id)a4;
- (id)existingAccount;
- (id)existingAccountSpecifiers;
- (id)getSMTPDisplayName:(id)a3;
- (id)newAccount;
- (id)outgoingHostName:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int)copyAccountsForEmailAddress:(id)a3 incomingAccount:(id *)a4 deliveryAccount:(id *)a5 easySetupNotes:(id *)a6;
- (int64_t)validateEasySetupAccounts;
- (void)_copyUIInformationIntoDeliveryAccount:(id)a3;
- (void)_copyUIInformationIntoIncomingAccount:(id)a3;
- (void)_enableAlias:(id)a3 forSpecifier:(id)a4;
- (void)_finishedEasySetup;
- (void)_getAccountInfoForEmailAddress:(id)a3;
- (void)_hideAccountValidationProgressUIWithPrompt:(id)a3;
- (void)_mailAccountNameChanged;
- (void)_setDefaultAlias:(id)a3 forSpecifier:(id)a4;
- (void)_setIncomingAccountProperty:(id)a3 forKey:(id)a4;
- (void)_setIncomingAccountProperty:(id)a3 forKey:(id)a4 specifier:(id)a5;
- (void)_setMailEnabled:(id)a3 forSpecifier:(id)a4;
- (void)_setOutgoingAccountProperty:(id)a3 forKey:(id)a4;
- (void)_setOutgoingAccountProperty:(id)a3 forKey:(id)a4 specifier:(id)a5;
- (void)_showFailedAddressAlertWithTitle:(id)a3 body:(id)a4;
- (void)_stopShowingEasySetup;
- (void)_takeOutgoingAccountPropertiesFromAccount:(id)a3;
- (void)_tryEasySetupForEmailAddress:(id)a3;
- (void)_tryUpdatingDescriptionFromValue:(id)a3 forKey:(id)a4;
- (void)cancelAccountsCreation;
- (void)cancelButtonTapped:(id)a3;
- (void)confirmAccountDeletion;
- (void)createAccounts;
- (void)createAccountsAnyways;
- (void)dealloc;
- (void)deleteAccount;
- (void)didBeginEditingDeliveryAccount;
- (void)didEndEditingOnReturn:(id)a3;
- (void)didFinishEditingDeliveryAccount;
- (void)didFinishSaveAccountAnywaysSheetWithResult:(BOOL)a3;
- (void)doneButtonTapped:(id)a3;
- (void)emailAliasListController:(id)a3 setEmailAliasList:(id)a4 defaultEmailAlias:(id)a5 forSpecifier:(id)a6;
- (void)finishedSetupWithAccount:(id)a3;
- (void)handleInvalidAccount:(id)a3;
- (void)handleSSLAlertForAccount:(id)a3 accountValidator:(id)a4 attemptWithoutSSL:(BOOL)a5;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)handleValidAccount:(id)a3;
- (void)icloudMailCreationNeedsViewUpdate:(id)a3 withAccount:(id)a4;
- (void)loadEmailAliasListController:(id)a3;
- (void)processValidationResult:(int64_t)a3;
- (void)propertyValueChanged:(id)a3;
- (void)reallyDeleteAccount;
- (void)resetTargetsForSpecifiers:(id)a3;
- (void)saveAndDismiss;
- (void)segmentChanged:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAccountProperty:(id)a3 forKey:(id)a4 withSpecifier:(id)a5;
- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4;
- (void)setCandidateIncomingAccount:(id)a3;
- (void)setChosenType:(id)a3;
- (void)setChosenType:(id)a3 withSpecifier:(id)a4;
- (void)setDomainList:(id)a3;
- (void)setExistingAccount:(id)a3;
- (void)setOutgoingHostName:(id)a3 withSpecifier:(id)a4;
- (void)setUpsellManager:(id)a3;
- (void)showEasySetupNoteWithAccount:(id)a3;
- (void)showExistingAccountError;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateDoneButton;
- (void)validateForExistingAccount;
- (void)validateForNewAccount;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AccountPSDetailController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_113A8;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7358 != -1) {
    dispatch_once(&qword_D7358, block);
  }
  v2 = (void *)qword_D7350;

  return v2;
}

- (id)chosenType
{
  return self->_chosenType;
}

- (void)setChosenType:(id)a3
{
}

- (id)newAccount
{
  return self->super._account;
}

- (void)createAccounts
{
  [(AccountPSDetailController *)self doneButtonTapped:0];
  while ((*((unsigned char *)&self->super + 232) & 1) != 0)
  {
    v4 = +[NSRunLoop currentRunLoop];

    if (!v4)
    {
      v7 = +[NSAssertionHandler currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"AccountPSDetailController.m" lineNumber:166 description:@"No run loop"];
    }
    v5 = +[NSRunLoop currentRunLoop];
    v6 = +[NSDate dateWithTimeIntervalSinceNow:0.3];
    [v5 runUntilDate:v6];
  }
}

- (void)createAccountsAnyways
{
  [(AccountPSDetailController *)self doneButtonTapped:0];
  while (!self->super._account)
  {
    if ((*((unsigned char *)&self->super + 232) & 2) == 0) {
      break;
    }
    v4 = +[NSRunLoop currentRunLoop];

    if (!v4)
    {
      v7 = +[NSAssertionHandler currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"AccountPSDetailController.m" lineNumber:179 description:@"No run loop"];
    }
    v5 = +[NSRunLoop currentRunLoop];
    v6 = +[NSDate dateWithTimeIntervalSinceNow:0.3];
    [v5 runUntilDate:v6];
  }
}

- (void)cancelAccountsCreation
{
}

- (id)existingAccount
{
  return self->super._account;
}

- (void)setExistingAccount:(id)a3
{
}

- (void)setAccount:(id)a3
{
}

- (void)setCandidateIncomingAccount:(id)a3
{
}

- (void)confirmAccountDeletion
{
  v3 = [(AccountPSDetailControllerBase *)self account];
  v4 = [v3 persistentAccount];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_11808;
  v5[3] = &unk_B8E38;
  v5[4] = self;
  [(AccountPSDetailController *)self showConfirmationForDeletingAccount:v4 completion:v5];
}

- (void)deleteAccount
{
}

- (void)_setMailEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  v6 = +[AccountPSDetailController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "user changed mail dataclass flag to %@", buf, 0xCu);
  }

  v7 = [(AccountPSDetailController *)self existingAccount];

  if (v7)
  {
    v8 = [(AccountPSDetailController *)self existingAccount];
    v9 = [v8 parentAccount];

    id v10 = [v5 BOOLValue];
    [v9 setEnabled:v10 forDataclass:ACAccountDataclassMail];
    v11 = +[ACAccountStore defaultStore];
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_11B34;
    v25 = &unk_B8E60;
    v12 = v9;
    v26 = v12;
    [v11 saveVerifiedAccount:v12 withCompletionHandler:&v22];
    v13 = +[EFScheduler mainThreadScheduler];
    [v13 performBlock:&v21];
  }
  else
  {
    appleAccount = self->_appleAccount;
    if (appleAccount)
    {
      v12 = appleAccount;
      icloudMailCreator = self->_icloudMailCreator;
      if (!icloudMailCreator)
      {
        v16 = [ICloudMailCreator alloc];
        v17 = self->_appleAccount;
        v18 = [(ACAccount *)v17 accountStore];
        v19 = [(ICloudMailCreator *)v16 initWithViewController:self appleAccount:v17 accountStore:v18];
        v20 = self->_icloudMailCreator;
        self->_icloudMailCreator = v19;

        [(ICloudMailCreator *)self->_icloudMailCreator setDelegate:self];
        icloudMailCreator = self->_icloudMailCreator;
      }
      [(ICloudMailCreator *)icloudMailCreator showAlertForMailSetup];
    }
    else
    {
      v12 = 0;
    }
  }
}

- (id)_isMailEnabled:(id)a3
{
  v4 = [(AccountPSDetailController *)self existingAccount];

  if (v4)
  {
    id v5 = [(AccountPSDetailController *)self existingAccount];
    v6 = [v5 parentAccount];
  }
  else
  {
    appleAccount = self->_appleAccount;
    if (appleAccount) {
      v6 = appleAccount;
    }
    else {
      v6 = 0;
    }
  }
  v8 = +[NSNumber numberWithBool:[(ACAccount *)v6 isEnabledForDataclass:ACAccountDataclassMail]];

  return v8;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[AccountPSDetailController log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "handleURL with dicttionary: %@.", buf, 0xCu);
  }

  v9 = [v6 objectForKey:@"domain"];
  if (v9)
  {
    id v10 = [v6 objectForKey:@"domainState"];
    byodSpecifierProviderAdapter = self->_byodSpecifierProviderAdapter;
    if (!byodSpecifierProviderAdapter)
    {
      v12 = [[BYODSpecifierProviderAdapter alloc] initWithAccountManager:self->_accountManager presenter:self];
      p_byodSpecifierProviderAdapter = &self->_byodSpecifierProviderAdapter;
      v14 = *p_byodSpecifierProviderAdapter;
      *p_byodSpecifierProviderAdapter = v12;

      byodSpecifierProviderAdapter = *p_byodSpecifierProviderAdapter;
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_11F50;
    v16[3] = &unk_B8EB0;
    id v17 = v7;
    [(BYODSpecifierProviderAdapter *)byodSpecifierProviderAdapter loadDomain:v9 withState:v10 completion:v16];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)AccountPSDetailController;
    [(AccountPSDetailController *)&v15 handleURL:v6 withCompletion:v7];
  }
}

- (id)existingAccountSpecifiers
{
  v3 = [(AccountPSDetailController *)self existingAccount];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  id v6 = [v5 valueForKey:@"hideMailDataclass"];

  if (!v6)
  {
    if ([v3 mailDataClassSwitch])
    {
      id v7 = [(AccountPSDetailController *)self _getMailSpecifier];
      [v4 addObjectsFromArray:v7];
    }
    if ([v3 hasCustomDomain])
    {
      v8 = [(AccountPSDetailController *)self _customDomainSpecifier];
      [v4 addObjectsFromArray:v8];
    }
  }
  v9 = [v3 detailedSpecifiers];
  [v4 addObjectsFromArray:v9];

  id v10 = [v4 specifierForID:@"EXISTING_ACCOUNT_EMAIL"];
  id v11 = [v4 indexOfObject:v10];

  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = [v3 isManaged];
    if (!v12
      || ([v3 emailAddressStrings],
          v13 = objc_claimAutoreleasedReturnValue(),
          id v14 = [v13 count],
          v13,
          (unint64_t)v14 >= 2))
    {
      objc_super v15 = +[NSBundle bundleForClass:objc_opt_class()];
      v16 = [v15 localizedStringForKey:@"EMAIL_ADDRESS" value:&stru_B9F70 table:@"AccountPreferences"];
      id v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:0 get:"emailAliasDisplayStringWithSpecifier:" detail:0 cell:2 edit:0];

      [v17 setControllerLoadAction:"loadEmailAliasListController:"];
      [v17 setProperty:&__kCFBooleanTrue forKey:@"LeftAlignLinkListDetailText"];
      [v17 setProperty:MailAccountEmailAddresses forKey:PSKeyNameKey];
      v25[0] = @"AccountPreferenceRequired";
      v25[1] = @"AccountPreferenceRequired";
      v26[0] = &__kCFBooleanTrue;
      v26[1] = &__kCFBooleanFalse;
      v25[2] = @"DisableEmailAliasListEditing";
      v18 = +[NSNumber numberWithBool:v12];
      v25[3] = @"disableForModificationRestrictions";
      v26[2] = v18;
      v26[3] = &__kCFBooleanTrue;
      id v19 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
      [v17 setUserInfo:v19];

      [v4 replaceObjectAtIndex:v11 withObject:v17];
    }
  }
  if ([(AccountPSDetailController *)self _shouldHideEnableAndDelete])
  {
    v20 = [v4 specifierForID:@"MailAccountIsActive"];
    uint64_t v21 = (char *)[v4 indexOfObject:v20];

    if (v21 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      [v4 removeObjectAtIndex:v21];
      [v4 removeObjectAtIndex:v21 - 1];
    }
    v22 = [v4 specifierForID:@"DELETE_ACCOUNT"];
    id v23 = [v4 indexOfObject:v22];

    if (v23 != (id)0x7FFFFFFFFFFFFFFFLL) {
      [v4 removeObjectAtIndex:v23];
    }
  }

  return v4;
}

- (id)_getMailSpecifier
{
  if (+[AAUIFeatureFlags isTobleroneEnabled]) {
    [(AccountPSDetailController *)self _tobleroneMailSwitchSpecifier];
  }
  else {
  v3 = [(AccountPSDetailController *)self _mailSwitchSpecifier];
  }

  return v3;
}

- (id)_tobleroneMailSwitchSpecifier
{
  id v27 = objc_alloc_init((Class)NSMutableArray);
  v25 = +[PSSpecifier groupSpecifierWithID:@"MAIL_DATACLASS_SWITCH_GROUP_SPECIFIER"];
  [v27 addObject:v25];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v26 = +[UIImage imageNamed:@"mailSettingsIcon.png" inBundle:v3];

  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"MAIL_CARD_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:-1 edit:0];

  [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"MAIL_CARD_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  [v6 setProperty:v8 forKey:PSTitleKey];

  id v9 = objc_alloc_init((Class)AADeviceInfo);
  id v10 = [v9 deviceClass];
  id v11 = [v10 uppercaseString];

  id v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [@"MAIL_CARD_SUBTEXT_" stringByAppendingString:v11];
  id v14 = [v12 localizedStringForKey:v13 value:&stru_B9F70 table:@"AccountPreferences"];

  [v6 setProperty:v14 forKey:PSTableCellSubtitleTextKey];
  objc_super v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"MAIL_DATACLASS_SWITCH_KB_LINK" value:&stru_B9F70 table:@"AccountPreferences"];
  [v6 setProperty:v16 forKey:@"AAUIDataclassAttributedLink"];

  id v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"LEARN_MORE_ELLIPSIS" value:&stru_B9F70 table:@"AccountPreferences"];
  [v6 setProperty:v18 forKey:@"AAUIDataclassAttributedLinkText"];

  [v6 setProperty:&off_C0330 forKey:PSAlignmentKey];
  uint64_t v19 = PSIconImageKey;
  [v6 setProperty:v26 forKey:PSIconImageKey];
  [v27 addObject:v6];
  v20 = +[PSSpecifier acui_specifierForDataclass:ACAccountDataclassMail account:self->_appleAccount target:self set:"_setMailEnabled:forSpecifier:" get:"_isMailEnabled:"];
  [v20 removePropertyForKey:v19];
  uint64_t v21 = +[NSBundle bundleForClass:objc_opt_class()];
  v22 = [@"MAIL_DATACLASS_SWITCH_TEXT_" stringByAppendingString:v11];
  id v23 = [v21 localizedStringForKey:v22 value:&stru_B9F70 table:@"AccountPreferences"];

  [v20 setName:v23];
  [v27 addObject:v20];

  return v27;
}

- (id)_customDomainSpecifier
{
  byodSpecifierProviderAdapter = self->_byodSpecifierProviderAdapter;
  if (!byodSpecifierProviderAdapter)
  {
    id v4 = [[BYODSpecifierProviderAdapter alloc] initWithAccountManager:self->_accountManager presenter:self];
    id v5 = self->_byodSpecifierProviderAdapter;
    self->_byodSpecifierProviderAdapter = v4;

    byodSpecifierProviderAdapter = self->_byodSpecifierProviderAdapter;
  }

  return [(BYODSpecifierProviderAdapter *)byodSpecifierProviderAdapter specifiers];
}

- (id)_mailSwitchSpecifier
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"LEARN_MORE_PERIOD" value:&stru_B9F70 table:@"AccountPreferences"];

  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"MAIL_DATACLASS_SWITCH_FOOTER" value:&stru_B9F70 table:@"AccountPreferences"];
  v8 = +[NSString stringWithFormat:@"%@ %@", v7, v5];

  id v9 = +[PSSpecifier groupSpecifierWithID:@"MAIL_DATACLASS_SWITCH_GROUP_SPECIFIER"];
  id v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  [v9 setProperty:v11 forKey:PSFooterCellClassGroupKey];

  [v9 setProperty:v8 forKey:PSFooterHyperlinkViewTitleKey];
  v20.location = (NSUInteger)[v8 rangeOfString:v5];
  id v12 = NSStringFromRange(v20);
  [v9 setProperty:v12 forKey:PSFooterHyperlinkViewLinkRangeKey];

  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"MAIL_DATACLASS_SWITCH_KB_LINK" value:&stru_B9F70 table:@"AccountPreferences"];
  [v9 setProperty:v14 forKey:PSFooterHyperlinkViewURLKey];

  [v3 addObject:v9];
  objc_super v15 = +[PSSpecifier acui_specifierForDataclass:ACAccountDataclassMail account:self->_appleAccount target:self set:"_setMailEnabled:forSpecifier:" get:"_isMailEnabled:"];
  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  id v17 = [v16 localizedStringForKey:@"ICLOUD_MAIL_LABEL" value:&stru_B9F70 table:@"AccountPreferences"];
  [v15 setName:v17];

  [v3 addObject:v15];

  return v3;
}

- (id)specifiers
{
  uint64_t v70 = OBJC_IVAR___PSListController__specifiers;
  p_cache = (void **)(&OBJC_METACLASS___AccountLinkButtonView + 16);
  if (*(void *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__specifiers]) {
    goto LABEL_56;
  }
  uint64_t v3 = OBJC_IVAR___PSViewController__specifier;
  v67 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  id obj = [v67 objectForKey:ACUIAccountKey];
  if (!self->_accountManager)
  {
    id v4 = [*(id *)&self->super.ACUIViewController_opaque[v3] propertyForKey:@"icloudAccountManager"];
    accountManager = self->_accountManager;
    self->_accountManager = v4;
  }
  if (obj)
  {
    id v6 = +[AccountPSDetailController log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "account from specifier is not nil", buf, 2u);
    }

    uint64_t v7 = +[MFAccount accountWithPersistentAccount:obj];
    if (v7)
    {
      if (_os_feature_enabled_impl()) {
        objc_storeStrong((id *)&self->_mailAccount, obj);
      }
      v68 = (void *)v7;
      goto LABEL_22;
    }
  }
  objc_storeStrong((id *)&self->_appleAccount, obj);
  v8 = +[AccountPSDetailController log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "account from specifier is nil. Will show create email flow when dataclass enabled", buf, 2u);
  }

  if (_os_feature_enabled_impl())
  {
    uint64_t v9 = objc_msgSend(obj, "aa_childMailAccount");

    id v10 = (id)v9;
  }
  else
  {
    id v10 = obj;
  }
  id obj = v10;
  uint64_t v11 = +[MFAccount accountWithPersistentAccount:](MFAccount, "accountWithPersistentAccount:");
  id v12 = +[AccountPSDetailController log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v85 = v11;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "retrying if account is available %@", buf, 0xCu);
  }

  if (v11)
  {
    v68 = (void *)v11;
LABEL_22:
    objc_super v15 = [(AccountPSDetailControllerBase *)self account];
    BOOL v16 = v15 == 0;

    if (v16) {
      [(AccountPSDetailController *)self setAccount:v68];
    }
    uint64_t v17 = [(AccountPSDetailController *)self existingAccountSpecifiers];
    goto LABEL_25;
  }
  v13 = [(AccountPSDetailControllerBase *)self account];
  BOOL v14 = v13 == 0;

  if (!v14)
  {
    v68 = 0;
    goto LABEL_22;
  }
  if ((*((unsigned char *)self + 392) & 2) != 0)
  {
    id v54 = objc_alloc((Class)NSArray);
    v18 = [(AccountPSDetailController *)self easySetupNote];
    v55 = +[PSSpecifier groupSpecifierWithName:v18];
    id v56 = objc_msgSend(v54, "initWithObjects:", v55, 0);
    v57 = *(void **)&self->super.ACUIViewController_opaque[v70];
    *(void *)&self->super.ACUIViewController_opaque[v70] = v56;

LABEL_80:
    v68 = 0;
    goto LABEL_26;
  }
  if ((_os_feature_enabled_impl() & 1) != 0 || !self->_appleAccount)
  {
    v58 = [v67 objectForKey:@"specifierAccount"];
    v18 = v58;
    if (v58)
    {
      v59 = NSClassFromString(v58);
    }
    else
    {
      v59 = [v67 objectForKey:@"class"];
    }
    v60 = [v67 objectForKey:@"RegionalDisplayName"];
    v61 = [v67 objectForKey:@"PlaceholderAddress"];
    if (v59)
    {
      uint64_t v62 = [v59 firstSetupSpecifiers];
    }
    else
    {
      if ((*((unsigned char *)self + 392) & 4) != 0)
      {
        char v65 = *((unsigned char *)self + 392);
      }
      else
      {
        v63 = [v67 objectForKey:@"AccountTypes"];
        easySetupAccountTypes = self->_easySetupAccountTypes;
        self->_easySetupAccountTypes = v63;

        char v65 = *((unsigned char *)self + 392) | 1;
        *((unsigned char *)self + 392) = v65;
      }
      if (v65)
      {
        uint64_t v62 = +[MailAccount easySetupSpecifiersWithPlaceholderAddress:v61 accountName:v60];
      }
      else
      {
        if (!self->_chosenType) {
          objc_storeStrong((id *)&self->_chosenType, self->_imapAccountClassString);
        }
        uint64_t v62 = +[MailAccount firstSetupSpecifiers];
      }
    }
    v66 = *(void **)&self->super.ACUIViewController_opaque[v70];
    *(void *)&self->super.ACUIViewController_opaque[v70] = v62;

    goto LABEL_80;
  }
  uint64_t v17 = [(AccountPSDetailController *)self _getMailSpecifier];
  v68 = 0;
LABEL_25:
  v18 = *(void **)&self->super.ACUIViewController_opaque[v70];
  *(void *)&self->super.ACUIViewController_opaque[v70] = v17;
LABEL_26:

  [(AccountPSDetailController *)self resetTargetsForSpecifiers:*(void *)&self->super.ACUIViewController_opaque[v70]];
  [(AccountPSDetailController *)self updateDoneButton];
  if ([(MFAccount *)self->super._account isManaged])
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v72 = *(id *)&self->super.ACUIViewController_opaque[v70];
    id v19 = [v72 countByEnumeratingWithState:&v78 objects:v83 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v79;
      uint64_t v21 = PSEnabledKey;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v79 != v20) {
            objc_enumerationMutation(v72);
          }
          id v23 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          v24 = [v23 userInfo];
          v25 = [v24 objectForKey:@"disableForManagedAccounts"];
          unsigned int v26 = [v25 BOOLValue];

          if (v26) {
            [v23 setProperty:kCFBooleanFalse forKey:v21];
          }
        }
        id v19 = [v72 countByEnumeratingWithState:&v78 objects:v83 count:16];
      }
      while (v19);
    }
  }
  id v27 = +[MCProfileConnection sharedConnection];
  BOOL v28 = [v27 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed] == 2;

  if (v28)
  {
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v73 = *(id *)&self->super.ACUIViewController_opaque[v70];
    id v29 = [v73 countByEnumeratingWithState:&v74 objects:v82 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v75;
      uint64_t v31 = PSEnabledKey;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v75 != v30) {
            objc_enumerationMutation(v73);
          }
          v33 = *(void **)(*((void *)&v74 + 1) + 8 * (void)j);
          v34 = [v33 userInfo];
          v35 = [v34 objectForKeyedSubscript:@"disableForModificationRestrictions"];
          unsigned int v36 = [v35 BOOLValue];

          if (v36) {
            [v33 setProperty:kCFBooleanFalse forKey:v31];
          }
        }
        id v29 = [v73 countByEnumeratingWithState:&v74 objects:v82 count:16];
      }
      while (v29);
    }
  }
  v37 = [(AccountPSDetailControllerBase *)self account];

  if (v37)
  {
    v38 = +[AccountPSDetailController log];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
      sub_7B498(v38);
    }

    v39 = self;
    if (!self->super._accountValues)
    {
      v40 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      accountValues = self->super._accountValues;
      self->super._accountValues = v40;

      v42 = [(AccountPSDetailControllerBase *)self account];
      uint64_t v43 = *(void *)&self->super.ACUIViewController_opaque[v70];
      v44 = [(AccountPSDetailControllerBase *)self accountValues];
      [v42 copyAccountPropertiesForSpecifiers:v43 intoDictionary:v44];

      v39 = self;
    }
    if (!v39->super._originalAccountValues)
    {
      v45 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      originalAccountValues = self->super._originalAccountValues;
      self->super._originalAccountValues = v45;

      v47 = [(AccountPSDetailControllerBase *)self account];
      uint64_t v48 = *(void *)&self->super.ACUIViewController_opaque[v70];
      v49 = [(AccountPSDetailControllerBase *)self originalAccountValues];
      [v47 copyAccountPropertiesForSpecifiers:v48 intoDictionary:v49];
    }
  }

  p_cache = &OBJC_METACLASS___AccountLinkButtonView.cache;
LABEL_56:
  v50 = [p_cache + 23 log];
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v51 = *(void *)&self->super.ACUIViewController_opaque[v70];
    *(_DWORD *)buf = 138412290;
    uint64_t v85 = v51;
    _os_log_impl(&dword_0, v50, OS_LOG_TYPE_DEFAULT, "AccountPSDetailController specifiers: returning %@", buf, 0xCu);
  }

  v52 = *(void **)&self->super.ACUIViewController_opaque[v70];

  return v52;
}

- (void)resetTargetsForSpecifiers:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "identifier", (void)v11);
        unsigned __int8 v10 = [v9 isEqualToString:@"BYOD_SETTING_SPECIFIER_ID"];

        if ((v10 & 1) == 0) {
          [v8 setTarget:self];
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)AccountPSDetailController;
  [(AccountPSDetailControllerBase *)&v30 viewDidLoad];
  uint64_t v3 = *(void **)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSViewController__specifier];
  if (!v3) {
    sub_7B4DC();
  }
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKey:@"chosenType"];
  if (v5) {
    objc_storeStrong((id *)&self->_chosenType, v5);
  }
  uint64_t v6 = [v4 objectForKey:@"outgoingValues"];

  if (v6)
  {
    uint64_t v7 = (NSMutableDictionary *)[v6 mutableCopy];
    outgoingAccountValues = self->_outgoingAccountValues;
    self->_outgoingAccountValues = v7;
  }
  if (!self->_popAccountClassString)
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    unsigned __int8 v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    popAccountClassString = self->_popAccountClassString;
    self->_popAccountClassString = v10;
  }
  if (!self->_imapAccountClassString)
  {
    long long v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    long long v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    imapAccountClassString = self->_imapAccountClassString;
    self->_imapAccountClassString = v13;
  }
  objc_super v15 = (void *)MFMailAccountUsername;
  BOOL v16 = [v4 objectForKey:MFMailAccountUsername];

  if (v16) {
    [(AccountPSDetailController *)self setIncomingAccountProperty:v16 forKey:v15];
  }
  if (*((unsigned char *)self + 392))
  {
    uint64_t v17 = [v4 objectForKey:@"RegionalDisplayName"];
    v18 = v17;
    if (!v17)
    {
      objc_super v15 = +[NSBundle bundleForClass:objc_opt_class()];
      v18 = [v15 localizedStringForKey:@"NEW_ACCOUNT" value:&stru_B9F70 table:@"AccountPreferences"];
    }
    id v19 = [(AccountPSDetailController *)self navigationItem];
    [v19 setTitle:v18];

    if (!v17)
    {
    }
  }
  if (self->super._initialTitle)
  {
    uint64_t v20 = [(AccountPSDetailController *)self navigationItem];
    uint64_t v21 = [v20 title];
    initialTitle = self->super._initialTitle;
    self->super._initialTitle = v21;
  }
  id v23 = [(AccountPSDetailController *)self specifierForID:MailAccountPassword];
  passwordSpecifier = self->_passwordSpecifier;
  self->_passwordSpecifier = v23;

  if ([(AccountPSDetailController *)self _showBackButton])
  {
    v25 = [(AccountPSDetailController *)self navigationItem];
    [v25 setHidesBackButton:0];

    unsigned int v26 = [v4 valueForKey:@"hideMailDataclass"];

    if (!v26)
    {
      id v27 = [(AccountPSDetailController *)self navigationItem];
      [v27 setLeftBarButtonItem:0];
    }
  }
  [(AccountPSDetailController *)self updateDoneButton];
  if ((_os_feature_enabled_impl() & 1) != 0
    || !self->_appleAccount
    || [(AccountPSDetailController *)self _hasICloudMailAccount])
  {
    BOOL v28 = [(AccountPSDetailController *)self navigationItem];
    id v29 = [v28 rightBarButtonItem];
    [v29 setHidden:0];
  }
  else
  {
    BOOL v28 = [(AccountPSDetailController *)self navigationItem];
    id v29 = [v28 rightBarButtonItem];
    [v29 setHidden:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(AccountPSDetailController *)self shouldSelectResponderOnAppearance];
  v19.receiver = self;
  v19.super_class = (Class)AccountPSDetailController;
  [(AccountPSDetailController *)&v19 viewWillAppear:v3];
  if (v5)
  {
    uint64_t v6 = [(AccountPSDetailController *)self findFirstVisibleResponder];
    uint64_t v7 = [(AccountPSDetailController *)self table];
    v8 = [v7 indexPathForCell:v6];

    uint64_t v9 = (char *)[(AccountPSDetailController *)self indexForIndexPath:v8];
    unsigned __int8 v10 = [(AccountPSDetailController *)self specifierAtIndex:v9];
    if (v10)
    {
      uint64_t v11 = PSDefaultValueKey;
      long long v12 = v9 + 1;
      while (1)
      {
        long long v13 = [v10 propertyForKey:v11];
        id v14 = [v13 length];

        if (!v14) {
          break;
        }
        uint64_t v15 = [(AccountPSDetailController *)self specifierAtIndex:v12];

        ++v12;
        unsigned __int8 v10 = (void *)v15;
        if (!v15) {
          goto LABEL_8;
        }
      }
      BOOL v16 = [(AccountPSDetailController *)self indexPathForSpecifier:v10];
      uint64_t v17 = [(AccountPSDetailController *)self table];
      v18 = [v17 cellForRowAtIndexPath:v16];
      [v18 becomeFirstResponder];
    }
LABEL_8:
  }
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(UISegmentedControl *)self->_accountTypeSegmentedControl removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  editableSuffixes = self->_editableSuffixes;
  if (editableSuffixes) {
    CFRelease(editableSuffixes);
  }
  v5.receiver = self;
  v5.super_class = (Class)AccountPSDetailController;
  [(AccountPSDetailControllerBase *)&v5 dealloc];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AccountPSDetailController *)self indexForIndexPath:v7];
  uint64_t v9 = [(AccountPSDetailController *)self specifierAtIndex:v8];
  v27.receiver = self;
  v27.super_class = (Class)AccountPSDetailController;
  unsigned __int8 v10 = [(AccountPSDetailController *)&v27 tableView:v6 cellForRowAtIndexPath:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v10 textField];
    if (v11)
    {
      long long v12 = +[NSNotificationCenter defaultCenter];
      [v12 removeObserver:self name:0 object:v11];

      long long v13 = +[NSNotificationCenter defaultCenter];
      [v13 addObserver:self selector:"propertyValueChanged:" name:UITextFieldTextDidChangeNotification object:v11];

      id v14 = [v9 propertyForKey:PSKeyNameKey];
      unsigned int v15 = [v14 isEqualToString:MFMailAccountUsername];

      if (v15) {
        objc_storeStrong((id *)&self->_usernameField, v11);
      }
      BOOL v16 = [v9 userInfo];
      uint64_t v17 = [v16 objectForKey:ACUIAccountKey];

      if (!v17)
      {
        v18 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
        objc_super v19 = [v18 userInfo];
        uint64_t v20 = [v19 objectForKey:@"UserEditableSuffix"];

        if ([v20 length])
        {
          editableSuffixes = self->_editableSuffixes;
          if (!editableSuffixes)
          {
            editableSuffixes = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
            self->_editableSuffixes = editableSuffixes;
          }
          if (!CFDictionaryGetValue(editableSuffixes, v11))
          {
            v22 = [[EditableSuffixData alloc] initWithSuffixString:v20];
            CFDictionaryAddValue(self->_editableSuffixes, v11, v22);
          }
        }
      }
      [(UISegmentedControl *)v11 addTarget:self action:"didEndEditingOnReturn:" forControlEvents:0x80000];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v10 control];
      if (self->_accountTypeSegmentedControl != v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)&self->_accountTypeSegmentedControl, v11);
          [(UISegmentedControl *)self->_accountTypeSegmentedControl addTarget:self action:"segmentChanged:" forControlEvents:4096];
        }
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_21;
      }
      uint64_t v11 = [(AccountPSDetailController *)self specifierAtIndex:[(AccountPSDetailController *)self indexForIndexPath:v7]];
      id v23 = [(UISegmentedControl *)v11 identifier];
      unsigned int v24 = [v23 isEqualToString:@"BYOD_SETTING_SPECIFIER_ID"];

      if (v24)
      {
        v25 = [v10 titleLabel];
        [v25 setAdjustsFontSizeToFitWidth:1];
      }
    }
  }

LABEL_21:

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AccountPSDetailController *)self specifierAtIndex:[(AccountPSDetailController *)self indexForIndexPath:v7]];
  uint64_t v9 = *(void *)&v8[OBJC_IVAR___PSSpecifier_detailControllerClass];
  if (v9 == objc_opt_class())
  {
    unsigned __int8 v10 = [v8 userInfo];
    id v11 = [v10 mutableCopy];

    [v11 setValue:self->super._accountValues forKey:@"values"];
    [v11 setValue:self->super._originalAccountValues forKey:@"originalValues"];
    [v8 setUserInfo:v11];
  }
  v12.receiver = self;
  v12.super_class = (Class)AccountPSDetailController;
  [(AccountPSDetailController *)&v12 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (void)doneButtonTapped:(id)a3
{
  id v4 = a3;
  [(AccountPSDetailController *)self setTaskCompletionAssertionEnabled:1];
  objc_super v5 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
  [v5 resignFirstResponder];

  unsigned __int8 v6 = [(AccountPSDetailController *)self _bypassAccountValidation];
  if ((*((unsigned char *)self + 392) & 2) != 0)
  {
    *((unsigned char *)self + 392) &= ~2u;
    if (self->_easySetupResult == 1) {
      char v10 = 1;
    }
    else {
      char v10 = v6;
    }
    if ((v10 & 1) != 0 || !self->_easySetupAccount)
    {
      [(AccountPSDetailController *)self _hideAccountValidationProgressUIWithPrompt:self->super._initialTitle];
    }
    else if (![(AccountPSDetailController *)self validateEasySetupAccounts])
    {
      [(AccountPSDetailController *)self showExistingAccountError];
    }
  }
  else
  {
    if (self->_outgoingAccountValuesAfterFailedValidation)
    {
      id v7 = -[AccountPSDetailControllerBase setOfKeysForAlteredValuesInDictionary:originalDictionary:](self, "setOfKeysForAlteredValuesInDictionary:originalDictionary:", self->_outgoingAccountValues);
      id v8 = [(id)objc_opt_class() propertiesWhichRequireValidation];
      unsigned int v9 = [v8 intersectsSet:v7];

      if (v9) {
        *((unsigned char *)&self->super + 232) &= ~2u;
      }
    }
    v11.receiver = self;
    v11.super_class = (Class)AccountPSDetailController;
    [(AccountPSDetailControllerBase *)&v11 doneButtonTapped:v4];
  }
}

- (void)cancelButtonTapped:(id)a3
{
  id v5 = a3;
  if (self->super._account)
  {
    id v4 = [(AccountPSDetailControllerBase *)self fixAccountInputValues:self->super._originalAccountValues];
    [(MFAccount *)self->super._account setAccountPropertiesWithDictionary:v4];
  }
  [(AccountPSDetailController *)self setAccount:0];
  [(AccountPSDetailController *)self dismissAnimated:1];
}

- (void)loadEmailAliasListController:(id)a3
{
  id v4 = a3;
  emailAliasListController = self->_emailAliasListController;
  id v11 = v4;
  if (!emailAliasListController)
  {
    unsigned __int8 v6 = objc_alloc_init(EmailAliasListController);
    id v7 = self->_emailAliasListController;
    self->_emailAliasListController = v6;

    [(EmailAliasListController *)self->_emailAliasListController setDataSource:self];
    emailAliasListController = self->_emailAliasListController;
    id v4 = v11;
  }
  [(EmailAliasListController *)emailAliasListController setSpecifier:v4];
  id v8 = [v11 userInfo];
  unsigned int v9 = [v8 objectForKey:@"DisableEmailAliasListEditing"];
  -[EmailAliasListController setDisableEmailAliasListChanges:](self->_emailAliasListController, "setDisableEmailAliasListChanges:", [v9 BOOLValue]);

  char v10 = [(AccountPSDetailController *)self navigationController];
  [v10 pushViewController:self->_emailAliasListController animated:1];
}

- (id)emailAliasDisplayStringWithSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AccountPSDetailController *)self accountPropertyForKey:MFAliasDefaultKey withSpecifier:v4];
  if (![v5 length])
  {
    unsigned __int8 v6 = [(AccountPSDetailController *)self accountPropertyForKey:MailAccountEmailAddresses withSpecifier:v4];
    id v7 = [v6 componentsSeparatedByString:@", "];

    if ([v7 count])
    {
      uint64_t v8 = [v7 objectAtIndex:0];

      id v5 = (void *)v8;
    }
  }

  return v5;
}

- (id)emailAliasListController:(id)a3 emailAliasListForSpecifier:(id)a4
{
  id v4 = [(AccountPSDetailController *)self accountPropertyForKey:MailAccountEmailAddresses withSpecifier:a4];
  id v5 = [v4 componentsSeparatedByString:@", "];

  return v5;
}

- (id)emailAliasListController:(id)a3 defaultEmailAliasForSpecifier:(id)a4
{
  id v4 = [(AccountPSDetailController *)self accountPropertyForKey:MFAliasDefaultKey withSpecifier:a4];

  return v4;
}

- (id)emailAliasListController:(id)a3 accountTypeForSpecifier:(id)a4
{
  id v4 = [(objc_class *)[(AccountPSDetailController *)self accountClass] displayedAccountTypeString];

  return v4;
}

- (void)emailAliasListController:(id)a3 setEmailAliasList:(id)a4 defaultEmailAlias:(id)a5 forSpecifier:(id)a6
{
  id v12 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = [v12 componentsJoinedByString:@", "];
  [(AccountPSDetailController *)self setAccountProperty:v11 forKey:MailAccountEmailAddresses withSpecifier:v10];

  [(AccountPSDetailController *)self setAccountProperty:v9 forKey:MFAliasDefaultKey withSpecifier:v10];
  [(AccountPSDetailController *)self reloadSpecifier:v10];
}

- (void)saveAndDismiss
{
  BOOL v3 = [(MFAccount *)self->super._account persistentAccount];
  id v4 = [v3 accountStore];

  if (v4)
  {
    [(MFAccount *)self->super._account savePersistentAccount];
    [(MFAccount *)self->super._account pushUpdateForAliasData];
  }
  [(AccountPSDetailController *)self finishedSetupWithAccount:self->super._account];

  [(AccountPSDetailController *)self reloadParentSpecifier];
}

- (BOOL)haveEnoughValues
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v19 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__specifiers] count];
  if (!v19) {
    return 0;
  }
  uint64_t v17 = PSKeyNameKey;
  uint64_t v18 = v3;
  unint64_t v4 = 1;
  do
  {
    id v5 = [*(id *)&self->super.ACUIViewController_opaque[v3] objectAtIndex:v4 - 1];
    unsigned __int8 v6 = [v5 userInfo];
    id v7 = [v5 properties];
    uint64_t v8 = [v6 objectForKey:@"AccountPreferenceRequired"];

    if (v8)
    {
      id v9 = [(AccountPSDetailController *)self cachedCellForSpecifier:v5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [v9 textField];
        id v11 = [v10 text];

        char v12 = [v11 length] != 0;
      }
      else
      {
        id v11 = [v6 objectForKey:@"outgoing_key"];
        if (v11)
        {
          long long v13 = [(NSMutableDictionary *)self->_outgoingAccountValues objectForKey:v11];
        }
        else
        {
          accountValues = self->super._accountValues;
          unsigned int v15 = [v7 objectForKey:v17];
          long long v13 = [(NSMutableDictionary *)accountValues objectForKey:v15];
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([v13 isEqualToString:&stru_B9F70] & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v13 count])
        {

          long long v13 = 0;
        }
        char v12 = v13 != 0;

        uint64_t v3 = v18;
      }
    }
    else
    {
      char v12 = 1;
    }

    if (v4 >= (unint64_t)v19) {
      break;
    }
    ++v4;
  }
  while ((v12 & 1) != 0);
  return v12;
}

- (void)processValidationResult:(int64_t)a3
{
  if (a3 != 2 && a3 != 4)
  {
    *((unsigned char *)&self->super + 232) &= ~1u;
    [(AccountPSDetailControllerBase *)self setViewsEnabled:1];
    [(AccountPSDetailController *)self updateDoneButton];
    if (!a3)
    {
      [(AccountPSDetailController *)self showExistingAccountError];
    }
  }
}

- (void)validateForExistingAccount
{
  uint64_t v3 = MailAccountEmailAddresses;
  unint64_t v4 = [(AccountPSDetailController *)self specifierForID:MailAccountEmailAddresses];

  id v7 = [(NSMutableDictionary *)self->super._accountValues objectForKey:v3];
  if (!v4)
  {
    if (![(objc_class *)[(AccountPSDetailController *)self accountClass] usernameIsEmailAddress])
    {
LABEL_5:
      unsigned __int8 v6 = [(AccountPSDetailControllerBase *)self fixAccountInputValues:self->super._accountValues];
      [(MFAccount *)self->super._account setAccountPropertiesWithDictionary:v6];
      [(AccountPSDetailController *)self processValidationResult:[(AccountPSDetailControllerBase *)self validateAccount]];

      goto LABEL_7;
    }
    uint64_t v5 = [(NSMutableDictionary *)self->super._accountValues objectForKey:MFMailAccountUsername];

    id v7 = (id)v5;
  }
  if ([(AccountPSDetailController *)self validateEmailAddress:v7]) {
    goto LABEL_5;
  }
  *((unsigned char *)&self->super + 232) &= ~1u;
LABEL_7:
}

- (void)validateForNewAccount
{
  uint64_t v3 = MailAccountEmailAddresses;
  unint64_t v4 = [(AccountPSDetailController *)self specifierForID:MailAccountEmailAddresses];

  uint64_t v5 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  aClassName = [v5 objectForKey:@"specifierAccount"];

  unsigned __int8 v6 = [(NSMutableDictionary *)self->super._accountValues objectForKey:v3];
  uint64_t v7 = MFMailAccountUsername;
  uint64_t v8 = [(NSMutableDictionary *)self->super._accountValues objectForKey:MFMailAccountUsername];
  id v9 = [objc_alloc((Class)ECEmailAddress) initWithString:v8];

  if (v4)
  {
    unsigned int v10 = 0;
  }
  else
  {
    unsigned int v11 = [(objc_class *)[(AccountPSDetailController *)self accountClass] usernameIsEmailAddress];
    if (v9) {
      int v12 = 1;
    }
    else {
      int v12 = v11;
    }
    if (v12 != 1)
    {
      unsigned int v10 = 0;
      goto LABEL_13;
    }
    uint64_t v13 = [(NSMutableDictionary *)self->super._accountValues objectForKey:v7];

    if (aClassName) {
      unsigned int v10 = [NSClassFromString(aClassName) getConfigurationFromServerForEmail:v13];
    }
    else {
      unsigned int v10 = 0;
    }
    unsigned __int8 v6 = (void *)v13;
  }
  if (![(AccountPSDetailController *)self validateEmailAddress:v6])
  {
    *((unsigned char *)&self->super + 232) &= ~1u;
    goto LABEL_33;
  }
LABEL_13:
  if (*((unsigned char *)self + 392))
  {
    uint64_t v17 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v18 = [v17 localizedStringForKey:@"LOOKING_UP_ACCOUNT_INFO" value:&stru_B9F70 table:@"AccountPreferences"];
    [(AccountPSDetailController *)self startValidationWithPrompt:v18];

    BOOL v16 = &selRef__tryEasySetupForEmailAddress_;
    goto LABEL_19;
  }
  if (([(objc_class *)[(AccountPSDetailController *)self accountClass] getConfigurationFromServerForEmail:v6] | v10) != 1|| (*((unsigned char *)self + 392) & 4) != 0)
  {
    uint64_t v20 = [(AccountPSDetailController *)self accountClass];
    uint64_t v21 = [(NSMutableDictionary *)self->super._accountValues valueForKey:v7];

    if (!v21)
    {
      v22 = [(UITextField *)self->_usernameField text];
      [(AccountPSDetailController *)self _setIncomingAccountProperty:v22 forKey:v7];
    }
    id v23 = [(AccountPSDetailControllerBase *)self fixAccountInputValues:self->super._accountValues];
    unsigned int v24 = [(AccountPSDetailControllerBase *)self existingAccountForAccountValues:v23];
    v25 = v24;
    if (v24 && !self->super._account)
    {
      objc_super v27 = v24;
      int64_t v19 = 0;
      existingIncomingAccount = self->_existingIncomingAccount;
      self->_existingIncomingAccount = v27;
    }
    else
    {
      if (!self->super._accountValues)
      {
        int64_t v19 = 1;
LABEL_31:

        goto LABEL_32;
      }
      existingIncomingAccount = (MailAccount *)[(objc_class *)v20 newAccountWithDictionary:v23];
      if (existingIncomingAccount) {
        int64_t v19 = [(AccountPSDetailControllerBase *)self validateAccount:existingIncomingAccount withFallbacks:1];
      }
      else {
        int64_t v19 = 1;
      }
    }

    goto LABEL_31;
  }
  id v14 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v15 = [v14 localizedStringForKey:@"LOOKING_UP_ACCOUNT_INFO" value:&stru_B9F70 table:@"AccountPreferences"];
  [(AccountPSDetailController *)self startValidationWithPrompt:v15];

  [(NSMutableDictionary *)self->super._accountValues setObject:v6 forKey:v3];
  BOOL v16 = &selRef__getAccountInfoForEmailAddress_;
LABEL_19:
  +[NSThread detachNewThreadSelector:*v16 toTarget:self withObject:v6];
  int64_t v19 = 2;
LABEL_32:
  [(AccountPSDetailController *)self updateDoneButton];
  [(AccountPSDetailController *)self processValidationResult:v19];
LABEL_33:
}

- (void)handleValidAccount:(id)a3
{
  id v10 = a3;
  if ((*((unsigned char *)self + 392) & 8) != 0)
  {
    [(AccountPSDetailController *)self setAccount:self->_candidateIncomingAccount];
    *((unsigned char *)&self->super + 232) &= ~1u;
    [(MailAccount *)self->_candidateIncomingAccount setDeliveryAccount:v10];
    [(AccountPSDetailController *)self _addAccount:self->_candidateIncomingAccount];
    uint64_t v5 = self->_candidateIncomingAccount;
    [(AccountPSDetailController *)self setCandidateIncomingAccount:0];
    +[DeliveryAccount addDeliveryAccount:v10];
    [v10 savePersistentAccount];
    if (v5)
    {
LABEL_15:
      [(AccountPSDetailController *)self setAccount:v5];
      [(AccountPSDetailController *)self stopValidationWithPrompt:self->super._initialTitle showButtons:0];
      [(AccountPSDetailController *)self setCellsChecked:1];
      uint64_t v8 = +[MFInvocationQueue sharedInvocationQueue];
      id v9 = +[MFMonitoredInvocation mf_invocationWithSelector:"updateEmailAliases" target:v5];
      [v8 addInvocation:v9];

      [(AccountPSDetailController *)self performSelector:"saveAndDismiss" withObject:0 afterDelay:1.0];
    }
  }
  else
  {
    *((unsigned char *)self + 392) |= 8u;
    if (self->_usingAlternateEmailAccount)
    {
      [(AccountPSDetailController *)self setCandidateIncomingAccount:v10];
      unint64_t v4 = [(AccountPSDetailControllerBase *)self accountValidator];
      objc_msgSend(v4, "validateAccount:useSSL:", self->_alternateEmailDeliveryAccount, -[DeliveryAccount usesSSL](self->_alternateEmailDeliveryAccount, "usesSSL"));

      uint64_t v5 = 0;
      goto LABEL_16;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v10 deliveryAccount], (unsigned __int8 v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v7 = v10;
      if (self->super._account)
      {
        [(AccountPSDetailController *)self setAccount:v7];
        [v7 savePersistentAccount];
      }
      else
      {
        [(AccountPSDetailController *)self _addAccount:v7];
        [(AccountPSDetailController *)self setAccount:v7];
      }
    }
    else if ([(AccountPSDetailController *)self _setupDeliveryAccountForValidatedAccount:v10])
    {
      id v7 = v10;
      unsigned __int8 v6 = 0;
    }
    else
    {
      unsigned __int8 v6 = 0;
      id v7 = 0;
    }

    uint64_t v5 = (MailAccount *)v7;
    if (v7) {
      goto LABEL_15;
    }
  }
LABEL_16:
}

- (void)handleInvalidAccount:(id)a3
{
  id v7 = a3;
  outgoingAccountValues = self->_outgoingAccountValues;
  if (outgoingAccountValues)
  {
    uint64_t v5 = (NSMutableDictionary *)[(NSMutableDictionary *)outgoingAccountValues copy];
    outgoingAccountValuesAfterFailedValidation = self->_outgoingAccountValuesAfterFailedValidation;
    self->_outgoingAccountValuesAfterFailedValidation = v5;
  }
  [(AccountPSDetailController *)self _hideAccountValidationProgressUIWithPrompt:self->super._initialTitle];
  [(AccountPSDetailController *)self setTaskCompletionAssertionEnabled:0];
}

- (BOOL)_showBackButton
{
  v2 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  uint64_t v3 = [v2 objectForKey:@"MailDetailViewWithBackKey"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_hideAccountValidationProgressUIWithPrompt:(id)a3
{
  id v6 = a3;
  if ((*((unsigned char *)self + 392) & 1) != 0 && !self->_easySetupAccountTypes) {
    [(AccountPSDetailController *)self _stopShowingEasySetup];
  }
  *((unsigned char *)self + 392) &= ~8u;
  *((unsigned char *)&self->super + 232) &= ~1u;
  [(AccountPSDetailControllerBase *)self setViewsEnabled:1];
  if ([v6 length] && self->_easySetupResult == 1)
  {
    BOOL v4 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"UNSUPPORTED_MAIL_SERVICE_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
    [(AccountPSDetailController *)self _showFailedAddressAlertWithTitle:v5 body:0];

    self->_easySetupResult = 0;
  }
  [(AccountPSDetailController *)self stopValidationWithPrompt:v6 showButtons:1];
  [(AccountPSDetailController *)self updateDoneButton];
}

- (void)_showFailedAddressAlertWithTitle:(id)a3 body:(id)a4
{
  uint64_t v5 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"OK" value:&stru_B9F70 table:@"AccountPreferences"];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_15EB4;
  v9[3] = &unk_B8CA8;
  v9[4] = self;
  uint64_t v8 = +[UIAlertAction actionWithTitle:v7 style:1 handler:v9];
  [v5 addAction:v8];

  [(AccountPSDetailController *)self presentViewController:v5 animated:1 completion:0];
  [(AccountPSDetailController *)self setTaskCompletionAssertionEnabled:0];
}

- (void)updateDoneButton
{
  uint64_t v3 = [(AccountPSDetailController *)self existingAccount];
  if (!v3) {
    goto LABEL_20;
  }
  id v12 = (id)v3;
  unsigned __int8 v4 = [(AccountPSDetailController *)self _shouldHideEnableAndDelete];

  if (v4) {
    goto LABEL_20;
  }
  uint64_t v5 = [(NSMutableDictionary *)self->super._accountValues objectForKey:@"MailAccountIsActive"];
  if (v5 && (v13 = v5, unsigned __int8 v6 = [v5 BOOLValue], v13, (v6 & 1) == 0))
  {
    BOOL v7 = 1;
  }
  else
  {
LABEL_20:
    if ([(AccountPSDetailController *)self haveEnoughValues]) {
      BOOL v7 = (*((unsigned char *)&self->super + 232) & 1) == 0;
    }
    else {
      BOOL v7 = 0;
    }
  }
  id v14 = [(AccountPSDetailController *)self navigationItem];
  uint64_t v8 = [v14 rightBarButtonItem];
  [v8 setEnabled:v7];

  if (!self->super._account)
  {
    if ([(AccountPSDetailController *)self shouldDisplayNextButtonForChosenType])
    {
      id v15 = +[NSBundle bundleForClass:objc_opt_class()];
      id v9 = [v15 localizedStringForKey:@"NEXT" value:&stru_B9F70 table:@"AccountPreferences"];
      id v10 = [(AccountPSDetailController *)self navigationItem];
      unsigned int v11 = [v10 rightBarButtonItem];
      [v11 setTitle:v9];
    }
    else
    {
      if (self->super._account) {
        return;
      }
      id v15 = +[NSBundle bundleForClass:objc_opt_class()];
      id v9 = [v15 localizedStringForKey:@"SAVE" value:&stru_B9F70 table:@"AccountPreferences"];
      id v10 = [(AccountPSDetailController *)self navigationItem];
      unsigned int v11 = [v10 rightBarButtonItem];
      [v11 setTitle:v9];
    }
  }
}

- (void)segmentChanged:(id)a3
{
  if (self->_accountTypeSegmentedControl == a3) {
    *((unsigned char *)&self->super + 232) &= ~2u;
  }
  [(AccountPSDetailController *)self updateDoneButton];
}

- (void)propertyValueChanged:(id)a3
{
  key = [a3 object];
  unsigned __int8 v4 = [(UITextField *)key text];
  uint64_t v5 = (char *)[v4 length];
  editableSuffixes = self->_editableSuffixes;
  if (!editableSuffixes)
  {
    uint64_t v8 = 0;
    goto LABEL_14;
  }
  BOOL v7 = CFDictionaryGetValue(editableSuffixes, key);
  uint64_t v8 = v7;
  if (!v7) {
    goto LABEL_14;
  }
  if (v5 == (unsigned char *)&dword_0 + 1
    && ![v7 fieldContentsLastLength]
    && [v4 rangeOfString:@"@"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (![(UITextField *)key hasMarkedText])
    {
      uint64_t v18 = [v8 suffixString];
      int64_t v19 = +[NSString stringWithFormat:@"%@%@", v4, v18];
      [(UITextField *)key setText:v19];

      -[UITextField setCursorPosition:](key, "setCursorPosition:", [v4 length]);
      uint64_t v5 = (unsigned char *)(&dword_0 + 1);
      goto LABEL_13;
    }
    id v9 = [(UITextField *)key _fieldEditor];
    id v10 = [v8 suffixString];
    [(UITextField *)key setText:v10];

    [(UITextField *)key setCursorPosition:0];
    objc_msgSend(v9, "setMarkedText:selectedRange:", v4, 0, 0);
    uint64_t v5 = (unsigned char *)(&dword_0 + 1);
    [(UITextField *)key setCursorPosition:1];
  }
  else
  {
    id v9 = [v8 suffixString];
    if ([v4 isEqualToString:v9])
    {
      id v11 = [v8 fieldContentsLastLength];

      if (v11)
      {
        [(UITextField *)key setText:&stru_B9F70];
        uint64_t v5 = 0;
      }
      goto LABEL_13;
    }
  }

LABEL_13:
  [v8 setFieldContentsLastLength:v5];
LABEL_14:
  id v12 = [(AccountPSDetailControllerBase *)self account];
  if (v12)
  {
    id v13 = [(AccountPSDetailControllerBase *)self account];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      usernameField = self->_usernameField;

      if (key == usernameField)
      {
        uint64_t v15 = MailAccountPassword;
        BOOL v16 = [(NSMutableDictionary *)self->super._accountValues objectForKey:MailAccountPassword];
        unsigned int v17 = [v16 isEqualToString:@"********"];

        if (v17)
        {
          [(NSMutableDictionary *)self->super._accountValues removeObjectForKey:v15];
          [(AccountPSDetailController *)self reloadSpecifier:self->_passwordSpecifier];
        }
      }
    }
    else
    {
    }
  }
  [(AccountPSDetailController *)self updateDoneButton];
}

- (void)didEndEditingOnReturn:(id)a3
{
  if (!self->super._account
    && [(AccountPSDetailController *)self haveEnoughValues]
    && (*((unsigned char *)&self->super + 232) & 1) == 0)
  {
    [(AccountPSDetailController *)self doneButtonTapped:0];
  }
}

- (BOOL)_shouldHideEnableAndDelete
{
  v2 = [(AccountPSDetailController *)self specifier];
  uint64_t v3 = [v2 userInfo];
  unsigned __int8 v4 = [v3 objectForKey:ACUIAlreadyShowedEnableAndDeleteKey];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (void)didBeginEditingDeliveryAccount
{
  self->_deliveryAccountIsBeingEdited = 1;
}

- (void)didFinishEditingDeliveryAccount
{
  self->_deliveryAccountIsBeingEdited = 0;
}

- (void)showExistingAccountError
{
  uint64_t v21 = [(MailAccount *)self->_existingIncomingAccount accountPropertyForKey:MFMailAccountDescription];
  v22 = [(objc_class *)[(AccountPSDetailController *)self accountClass] displayedAccountTypeString];
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"ALREADY_EXISTING_ACCOUNT_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];

  uint64_t v20 = (void *)v4;
  unsigned __int8 v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v21);
  if ([(MailAccount *)self->_existingIncomingAccount isActive])
  {
    unsigned __int8 v6 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v7 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ALREADY_EXISTING_ACCOUNT_DESC"];
    uint64_t v8 = [v6 localizedStringForKey:v7 value:&stru_B9F70 table:@"AccountPreferences"];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v22);

    id v10 = +[UIAlertController alertControllerWithTitle:v5 message:v9 preferredStyle:1];
    id v11 = +[NSBundle bundleForClass:objc_opt_class()];
    id v12 = [v11 localizedStringForKey:@"OK" value:&stru_B9F70 table:@"AccountPreferences"];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_16D6C;
    v23[3] = &unk_B8CA8;
    v23[4] = self;
    id v13 = +[UIAlertAction actionWithTitle:v12 style:1 handler:v23];
    [v10 addAction:v13];
  }
  else
  {
    id v14 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v15 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ACTIVATE_EXISTING_ACCOUNT_DESC"];
    BOOL v16 = [v14 localizedStringForKey:v15 value:&stru_B9F70 table:@"AccountPreferences"];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v22);

    id v10 = +[UIAlertController alertControllerWithTitle:v5 message:v9 preferredStyle:1];
    unsigned int v17 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v18 = [v17 localizedStringForKey:@"SETTINGS" value:&stru_B9F70 table:@"AccountPreferences"];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_16CB0;
    v25[3] = &unk_B8CA8;
    void v25[4] = self;
    int64_t v19 = +[UIAlertAction actionWithTitle:v18 style:0 handler:v25];
    [v10 addAction:v19];

    id v11 = +[NSBundle bundleForClass:objc_opt_class()];
    id v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_B9F70 table:@"AccountPreferences"];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_16D54;
    v24[3] = &unk_B8CA8;
    v24[4] = self;
    id v13 = +[UIAlertAction actionWithTitle:v12 style:1 handler:v24];
    [v10 addAction:v13];
  }

  [(AccountPSDetailController *)self presentViewController:v10 animated:1 completion:0];
  [(AccountPSDetailController *)self setTaskCompletionAssertionEnabled:0];
}

- (void)didFinishSaveAccountAnywaysSheetWithResult:(BOOL)a3
{
  if (a3)
  {
    if (self->super._account)
    {
      id v4 = 0;
      [(AccountPSDetailController *)self saveAndDismiss];
    }
    else
    {
      if (self->_usingAlternateEmailAccount) {
        [(AccountPSDetailController *)self addAlternateEmailAccountFromCurrentSettings];
      }
      else {
      id v4 = [(AccountPSDetailController *)self addAccountFromCurrentSettings];
      }
      -[AccountPSDetailController setAccount:](self, "setAccount:");
      [(AccountPSDetailController *)self finishedSetupWithAccount:v4];
    }
  }
}

- (void)handleSSLAlertForAccount:(id)a3 accountValidator:(id)a4 attemptWithoutSSL:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (NSMutableDictionary *)[(NSMutableDictionary *)self->_outgoingAccountValues copy];
  outgoingAccountValuesAfterFailedValidation = self->_outgoingAccountValuesAfterFailedValidation;
  self->_outgoingAccountValuesAfterFailedValidation = v10;

  self->_shouldUseSSL = !v5;
  v12.receiver = self;
  v12.super_class = (Class)AccountPSDetailController;
  [(AccountPSDetailControllerBase *)&v12 handleSSLAlertForAccount:v8 accountValidator:v9 attemptWithoutSSL:v5];
}

- (int)copyAccountsForEmailAddress:(id)a3 incomingAccount:(id *)a4 deliveryAccount:(id *)a5 easySetupNotes:(id *)a6
{
  id v7 = a3;
  id v8 = [objc_alloc((Class)ECEmailAddress) initWithString:v7];
  id v9 = [v8 domain];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = self->_easySetupAccountTypes;
  id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) objectForKey:@"DomainNames"];
        if (([v14 containsObject:v9] & 1) != 0
          && AccountConfigurationServiceCopyAccountsForEmailAddressUsingAccountInfo() == 2)
        {

          uint64_t v15 = v7;
          int v16 = 2;
          goto LABEL_16;
        }
      }
      uint64_t v15 = v7;
      id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v15 = v7;
  }
  int v16 = AccountConfigurationServiceCopyAccountsForEmailAddress();
LABEL_16:

  return v16;
}

- (void)_tryEasySetupForEmailAddress:(id)a3
{
  id v4 = a3;
  +[NSDate timeIntervalSinceReferenceDate];
  double v7 = v6;
  easySetupAccount = self->_easySetupAccount;
  self->_easySetupAccount = 0;

  easySetupDeliveryAccount = self->_easySetupDeliveryAccount;
  self->_easySetupDeliveryAccount = 0;

  easySetupNotes = self->_easySetupNotes;
  self->_easySetupNotes = 0;

  id v13 = 0;
  id obj = 0;
  id v12 = 0;
  self->_easySetupResult = [(AccountPSDetailController *)self copyAccountsForEmailAddress:v4 incomingAccount:&obj deliveryAccount:&v13 easySetupNotes:&v12];
  objc_storeStrong((id *)&self->_easySetupAccount, obj);
  objc_storeStrong((id *)&self->_easySetupDeliveryAccount, v13);
  objc_storeStrong((id *)&self->_easySetupNotes, v12);
  [(AccountPSDetailController *)self _copyUIInformationIntoIncomingAccount:self->_easySetupAccount];
  [(AccountPSDetailController *)self _copyUIInformationIntoDeliveryAccount:self->_easySetupDeliveryAccount];
  +[NSDate timeIntervalSinceReferenceDate];
  +[NSThread sleepForTimeInterval:v7 - v11 + 1.0];
  [(AccountPSDetailController *)self performSelectorOnMainThread:"_finishedEasySetup" withObject:0 waitUntilDone:0];
}

- (BOOL)_hasEnoughInformationForEasySetup
{
  unsigned int v3 = [(MailAccount *)self->_easySetupAccount hasEnoughInformationForEasySetup];
  if (v3)
  {
    easySetupDeliveryAccount = self->_easySetupDeliveryAccount;
    LOBYTE(v3) = [easySetupDeliveryAccount hasEnoughInformationForEasySetup];
  }
  return v3;
}

- (void)_takeOutgoingAccountPropertiesFromAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    id v12 = v4;
    double v6 = [v4 hostname];
    [(AccountPSDetailController *)self _setOutgoingAccountProperty:v6 forKey:MailAccountHostname];

    double v7 = [v12 username];
    [(AccountPSDetailController *)self _setOutgoingAccountProperty:v7 forKey:MFMailAccountUsername];

    id v8 = [v12 password];
    [(AccountPSDetailController *)self _setOutgoingAccountProperty:v8 forKey:MailAccountPassword];

    unsigned int v9 = [v12 usesSSL];
    BOOL v5 = v12;
    if (v9)
    {
      outgoingAccountValues = self->_outgoingAccountValues;
      double v11 = +[NSNumber numberWithInt:1];
      [(NSMutableDictionary *)outgoingAccountValues setObject:v11 forKey:MailAccountSSLEnabled];

      BOOL v5 = v12;
    }
  }
}

- (void)_finishedEasySetup
{
  int easySetupResult = self->_easySetupResult;
  BOOL v4 = easySetupResult == 2 && self->_easySetupAccount && self->_easySetupDeliveryAccount != 0;
  unsigned __int8 v5 = [(AccountPSDetailController *)self _bypassAccountValidation];
  double v6 = [(AccountPSDetailController *)self easySetupNote];
  id v7 = [v6 length];

  char v8 = easySetupResult == 1 || v4;
  if ((v8 & 1) == 0 && !v7) {
    goto LABEL_10;
  }
  [(MailAccount *)self->_easySetupAccount setPreferredAuthScheme:0];
  if (v7)
  {
    [(AccountPSDetailController *)self showEasySetupNoteWithAccount:self->_easySetupAccount];
    goto LABEL_13;
  }
  char v9 = easySetupResult == 1 ? 1 : v5;
  if ((v9 & 1) != 0
    || ![(AccountPSDetailController *)self _hasEnoughInformationForEasySetup])
  {
LABEL_10:
    [(AccountPSDetailController *)self _hideAccountValidationProgressUIWithPrompt:self->super._initialTitle];
LABEL_13:
    *((unsigned char *)&self->super + 232) &= ~1u;
    return;
  }
  [(AccountPSDetailController *)self _takeOutgoingAccountPropertiesFromAccount:self->_easySetupDeliveryAccount];
  easySetupAccount = self->_easySetupAccount;

  [(AccountPSDetailControllerBase *)self validateAccount:easySetupAccount withFallbacks:0];
}

- (void)_stopShowingEasySetup
{
  if (*((unsigned char *)self + 392))
  {
    *((unsigned char *)self + 392) &= ~1u;
    if (self->_easySetupAccount)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&self->_chosenType, self->_popAccountClassString);
      }
      unsigned int v3 = [(MailAccount *)self->_easySetupAccount hostname];
      [(AccountPSDetailController *)self _setIncomingAccountProperty:v3 forKey:MailAccountHostname];

      BOOL v4 = [(MailAccount *)self->_easySetupAccount username];
      [(AccountPSDetailController *)self _setIncomingAccountProperty:v4 forKey:MFMailAccountUsername];

      if ([(MailAccount *)self->_easySetupAccount usesSSL])
      {
        accountValues = self->super._accountValues;
        double v6 = +[NSNumber numberWithInt:1];
        [(NSMutableDictionary *)accountValues setObject:v6 forKey:MailAccountSSLEnabled];
      }
    }
    [(AccountPSDetailController *)self _takeOutgoingAccountPropertiesFromAccount:self->_easySetupDeliveryAccount];
    *((unsigned char *)self + 392) |= 4u;
    [(AccountPSDetailController *)self reloadSpecifiers];
    easySetupAccount = self->_easySetupAccount;
    self->_easySetupAccount = 0;

    easySetupDeliveryAccount = self->_easySetupDeliveryAccount;
    self->_easySetupDeliveryAccount = 0;
  }
}

- (void)showEasySetupNoteWithAccount:(id)a3
{
  [(AccountPSDetailController *)self stopValidationWithPrompt:0 showButtons:1];
  *((unsigned char *)self + 392) |= 2u;
  [(AccountPSDetailController *)self reloadSpecifiers];
  BOOL v4 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v5 = [v4 localizedStringForKey:@"ACCOUNT_INFO_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  double v6 = [(AccountPSDetailController *)self navigationItem];
  [v6 setTitle:v5];

  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  char v8 = [v7 localizedStringForKey:@"NEXT" value:&stru_B9F70 table:@"AccountPreferences"];
  char v9 = [(AccountPSDetailController *)self navigationItem];
  id v10 = [v9 rightBarButtonItem];
  [v10 setTitle:v8];

  double v11 = [(AccountPSDetailController *)self navigationItem];
  id v12 = [v11 rightBarButtonItem];
  [v12 setEnabled:1];

  [(AccountPSDetailControllerBase *)self setViewsEnabled:1];
}

- (void)finishedSetupWithAccount:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(AccountPSDetailController *)self parentController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(AccountPSDetailController *)self parentController];
    id v7 = [v8 persistentAccount];
    [v6 controller:self didFinishSettingUpAccount:v7];
  }
  else
  {
    [(AccountPSDetailController *)self dismissAnimated:1];
  }
  *((unsigned char *)&self->super + 232) &= ~1u;
  [(AccountPSDetailController *)self setTaskCompletionAssertionEnabled:0];
}

- (void)setChosenType:(id)a3 withSpecifier:(id)a4
{
  id v9 = a3;
  unsigned int v5 = [v9 isEqualToString:@"POP"];
  double v6 = &OBJC_IVAR___AccountPSDetailController__imapAccountClassString;
  if (v5) {
    double v6 = &OBJC_IVAR___AccountPSDetailController__popAccountClassString;
  }
  id v7 = *(void **)&self->super.ACUIViewController_opaque[*v6];
  id v8 = v7;
  if (([v8 isEqualToString:self->_chosenType] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_chosenType, v7);
    [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSViewController__specifier] setUserInfo:0];
  }
}

- (id)chosenType:(id)a3
{
  if ([(NSString *)self->_chosenType isEqualToString:self->_popAccountClassString]) {
    return @"POP";
  }
  else {
    return @"IMAP";
  }
}

- (BOOL)shouldDisplayNextButtonForChosenType
{
  if (self->_chosenType) {
    return ![(NSString *)self->_chosenType isEqualToString:self->_popAccountClassString];
  }
  else {
    return 1;
  }
}

- (id)_descriptionFromEmailAddress:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  double v6 = [v5 objectForKey:@"RegionalDisplayName"];

  if (!v6)
  {
    if (![(AccountPSDetailController *)self accountClass]
      || (id v7 = [(AccountPSDetailController *)self accountClass], v7 == (objc_class *)objc_opt_class())
      || (id v8 = [(AccountPSDetailController *)self accountClass], v8 == (objc_class *)objc_opt_class()))
    {
      uint64_t v9 = ACUIDescriptionFromEmailAddress();
    }
    else
    {
      uint64_t v9 = [(objc_class *)[(AccountPSDetailController *)self accountClass] displayedAccountTypeString];
    }
    double v6 = (void *)v9;
  }
  id v10 = [(AccountPSDetailController *)self accountStore];
  unsigned int v11 = [v10 hasAccountWithDescription:v6];

  if (v11)
  {
    id v12 = v4;

    double v6 = v12;
  }

  return v6;
}

- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v6 properties];
  id v8 = [v7 objectForKey:PSKeyNameKey];
  [(AccountPSDetailController *)self setAccountProperty:v9 forKey:v8 withSpecifier:v6];
}

- (void)setAccountProperty:(id)a3 forKey:(id)a4 withSpecifier:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 userInfo];
  unsigned int v11 = [v10 objectForKey:@"values"];
  if (v11)
  {
    id v12 = [v9 values];
    id v13 = [v12 indexOfObject:v16];
    if (v13 != (id)0x7FFFFFFFFFFFFFFFLL && v13 < [v11 count])
    {
      uint64_t v14 = [v11 objectAtIndex:v13];

      id v16 = (id)v14;
    }
  }
  if (v8)
  {
    [(AccountPSDetailController *)self _setIncomingAccountProperty:v16 forKey:v8 specifier:v9];
  }
  else
  {
    uint64_t v15 = [v10 objectForKey:@"outgoing_key"];
    if (v15)
    {
      id v8 = (id)v15;
      -[AccountPSDetailController _setOutgoingAccountProperty:forKey:specifier:](self, "_setOutgoingAccountProperty:forKey:specifier:", v16);
    }
    else
    {
      id v8 = 0;
    }
  }
  [(AccountPSDetailController *)self updateDoneButton];
}

- (void)_setIncomingAccountProperty:(id)a3 forKey:(id)a4
{
}

- (void)_setIncomingAccountProperty:(id)a3 forKey:(id)a4 specifier:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  if (([v7 isEqualToString:MailAccountEmailAddresses] & 1) != 0
    || [v7 isEqualToString:MFMailAccountUsername])
  {
    [(AccountPSDetailController *)self _tryUpdatingDescriptionFromValue:v11 forKey:v7];
  }
  accountValues = self->super._accountValues;
  if (v11)
  {
    if (!accountValues)
    {
      id v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v10 = self->super._accountValues;
      self->super._accountValues = v9;

      accountValues = self->super._accountValues;
    }
    [(NSMutableDictionary *)accountValues setObject:v11 forKey:v7];
  }
  else
  {
    [(NSMutableDictionary *)accountValues removeObjectForKey:v7];
  }
}

- (void)setOutgoingHostName:(id)a3 withSpecifier:(id)a4
{
  id v12 = a3;
  unsigned int v5 = (char *)[v12 rangeOfString:@":" options:4];
  id v7 = v5;
  if (v5 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [v12 substringFromIndex:&v5[v6]];
    id v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 intValue]);
    uint64_t v10 = [v12 substringToIndex:v7];

    id v12 = (id)v10;
  }
  id v11 = [v8 stringValue];
  [(AccountPSDetailController *)self _setOutgoingAccountProperty:v11 forKey:MailAccountPortNumber];

  [(AccountPSDetailController *)self _setOutgoingAccountProperty:v12 forKey:MailAccountHostname];
  [(AccountPSDetailController *)self updateDoneButton];
}

- (id)outgoingHostName:(id)a3
{
  id v4 = [(AccountPSDetailController *)self _outgoingAccountPropertyForKey:MailAccountHostname];
  unsigned int v5 = [(AccountPSDetailController *)self _outgoingAccountPropertyForKey:MailAccountPortNumber];
  if ([v5 intValue])
  {
    uint64_t v6 = +[NSString stringWithFormat:@"%@:%@", v4, v5];

    id v4 = (void *)v6;
  }

  return v4;
}

- (void)_mailAccountNameChanged
{
  id v5 = [(AccountPSDetailController *)self rootController];
  unsigned int v3 = [v5 topViewController];

  if (v3 == self)
  {
    id v6 = [(AccountPSDetailController *)self navigationItem];
    id v4 = [(MFAccount *)self->super._account displayName];
    [v6 setTitle:v4];
  }
}

- (void)_tryUpdatingDescriptionFromValue:(id)a3 forKey:(id)a4
{
  id v20 = a4;
  long long v19 = [(AccountPSDetailController *)self _descriptionFromEmailAddress:a3];
  uint64_t v6 = MFMailAccountDescription;
  id v7 = [(AccountPSDetailController *)self _incomingAccountPropertyForKey:MFMailAccountDescription];
  id v8 = [(AccountPSDetailController *)self _incomingAccountPropertyForKey:v20];
  id v9 = [(AccountPSDetailController *)self _descriptionFromEmailAddress:v8];

  if (![v7 length] || objc_msgSend(v7, "isEqualToString:", v9))
  {
    [(AccountPSDetailController *)self _setIncomingAccountProperty:v19 forKey:v6];
    uint64_t v10 = OBJC_IVAR___PSListController__specifiers;
    id v11 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__specifiers] count];
    if (v11)
    {
      uint64_t v12 = 0;
      uint64_t v13 = PSKeyNameKey;
      while (1)
      {
        uint64_t v14 = [*(id *)&self->super.ACUIViewController_opaque[v10] objectAtIndex:v12];
        uint64_t v15 = [v14 propertyForKey:v13];

        if ([v15 isEqualToString:v6]) {
          break;
        }

        if (v11 == (id)++v12) {
          goto LABEL_9;
        }
      }
      id v16 = [(AccountPSDetailController *)self table];
      unsigned int v17 = [(AccountPSDetailController *)self indexPathForIndex:v12];
      long long v18 = [v16 cellForRowAtIndexPath:v17];

      [v18 setValue:v19];
    }
  }
LABEL_9:
}

- (void)_setOutgoingAccountProperty:(id)a3 forKey:(id)a4
{
}

- (void)_setOutgoingAccountProperty:(id)a3 forKey:(id)a4 specifier:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  account = self->super._account;
  if (account)
  {
    id v11 = [(MFAccount *)account deliveryAccount];
    if (!v11)
    {
      uint64_t v12 = [(id)objc_opt_class() accountPropertiesValueForKey:v8 value:v17];

      uint64_t v13 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v12, v8, 0);
      id v11 = +[SMTPAccount newAccountWithDictionary:v13];
      +[DeliveryAccount addDeliveryAccount:v11];

      id v17 = (id)v12;
    }
    if ([v8 isEqual:MFMailAccountUsername]) {
      objc_msgSend(v11, "setShouldUseAuthentication:", objc_msgSend(v17, "length") != 0);
    }
    [v11 savePersistentAccount];
    [(MFAccount *)self->super._account setDeliveryAccount:v11];
    [(MFAccount *)self->super._account savePersistentAccount];
  }
  else
  {
    outgoingAccountValues = self->_outgoingAccountValues;
    if (v17)
    {
      if (!outgoingAccountValues)
      {
        uint64_t v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v16 = self->_outgoingAccountValues;
        self->_outgoingAccountValues = v15;

        outgoingAccountValues = self->_outgoingAccountValues;
      }
      [(NSMutableDictionary *)outgoingAccountValues setObject:v17 forKey:v8];
    }
    else
    {
      [(NSMutableDictionary *)outgoingAccountValues removeObjectForKey:v8];
      id v17 = 0;
    }
  }
}

- (id)accountPropertyWithSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 properties];
  uint64_t v6 = [v5 objectForKey:PSKeyNameKey];
  id v7 = [(AccountPSDetailController *)self accountPropertyForKey:v6 withSpecifier:v4];

  return v7;
}

- (id)accountPropertyForKey:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 userInfo];
  id v9 = v8;
  if (v6)
  {
    uint64_t v10 = [(AccountPSDetailController *)self _incomingAccountPropertyForKey:v6];
    if (v10) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v11 = [v8 objectForKey:@"outgoing_key"];
    if (v11)
    {
      uint64_t v10 = [(AccountPSDetailController *)self _outgoingAccountPropertyForKey:v11];
      id v6 = (id)v11;
      if (v10) {
        goto LABEL_9;
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  uint64_t v10 = [v7 propertyForKey:PSDefaultValueKey];
LABEL_9:
  uint64_t v12 = [v9 objectForKey:@"values"];
  if (v12)
  {
    uint64_t v13 = [v7 values];
    id v14 = [v12 indexOfObject:v10];
    if (v14 != (id)0x7FFFFFFFFFFFFFFFLL && v14 < [v13 count])
    {
      uint64_t v15 = [v13 objectAtIndex:v14];

      uint64_t v10 = (void *)v15;
    }
  }

  return v10;
}

- (id)_outgoingAccountPropertyForKey:(id)a3
{
  id v4 = a3;
  account = self->super._account;
  if (account)
  {
    id v6 = [(MFAccount *)account deliveryAccount];
    id v7 = [v6 valueInAccountPropertiesForKey:v4];
  }
  else
  {
    outgoingAccountValues = self->_outgoingAccountValues;
    if (outgoingAccountValues)
    {
      id v7 = [(NSMutableDictionary *)outgoingAccountValues objectForKey:v4];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (id)_incomingAccountPropertyForKey:(id)a3
{
  unsigned int v3 = [(NSMutableDictionary *)self->super._accountValues objectForKey:a3];

  return v3;
}

- (Class)accountClass
{
  if (self->super._account) {
    goto LABEL_2;
  }
  id v4 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  id v3 = [v4 objectForKey:@"class"];

  if (!v3)
  {
    chosenType = self->_chosenType;
    if (chosenType)
    {
      [(NSString *)chosenType isEqualToString:self->_popAccountClassString];
LABEL_2:
      id v3 = (id)objc_opt_class();
      goto LABEL_4;
    }
    id v3 = 0;
  }
LABEL_4:

  return (Class)v3;
}

- (id)getSMTPDisplayName:(id)a3
{
  id v4 = [(MFAccount *)self->super._account deliveryAccount];
  id v5 = [v4 displayHostname];
  if (!v5)
  {
    id v5 = [v4 hostname];
  }
  if (![v4 isActive]
    || [(MFAccount *)self->super._account isPrimaryDeliveryAccountDisabled])
  {
    id v6 = [(MFAccount *)self->super._account deliveryAccountAlternates];
    if ([v6 count])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = v6;
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v21;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v21 != v9) {
              objc_enumerationMutation(v7);
            }
            uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            uint64_t v12 = objc_msgSend(v11, "hostname", (void)v20);
            id v13 = [v12 length];

            if (v13)
            {
              uint64_t v14 = [v11 hostname];

              id v5 = (__CFString *)v14;
              goto LABEL_16;
            }
          }
          id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
    else
    {
      uint64_t v15 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v16 = [v15 localizedStringForKey:@"NO_SMTP_SERVER" value:&stru_B9F70 table:@"AccountPreferences"];

      id v5 = (__CFString *)v16;
    }
  }
  if (v5) {
    id v17 = v5;
  }
  else {
    id v17 = &stru_B9F70;
  }
  long long v18 = v17;

  return v18;
}

- (void)_setDefaultAlias:(id)a3 forSpecifier:(id)a4
{
  id v23 = a3;
  id v20 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = *(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    id v7 = 0;
    uint64_t v8 = *(void *)v25;
    uint64_t v9 = PSKeyNameKey;
    uint64_t v10 = PSEnabledKey;
    uint64_t v21 = MFAliasPreferenceNameKey;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "propertyForKey:", v9, v20);
        unsigned int v14 = [v13 isEqualToString:v23];

        if (v14)
        {
          uint64_t v15 = [v12 userInfo];
          uint64_t v16 = [v15 valueForKey:v21];

          id v17 = +[NSNumber numberWithBool:0];
          [v12 setProperty:v17 forKey:v10];

          long long v18 = +[NSNumber numberWithBool:1];
          [(AccountPSDetailController *)self _enableAlias:v18 forSpecifier:v12];

          id v7 = (void *)v16;
        }
        else
        {
          long long v19 = +[NSNumber numberWithBool:1];
          [v12 setProperty:v19 forKey:v10];
        }
        [(AccountPSDetailController *)self reloadSpecifier:v12];
      }
      id v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);

    if (v7) {
      [(MFAccount *)self->super._account setDefaultEmailAddress:v7];
    }
  }
  else
  {

    id v7 = 0;
  }
}

- (id)_defaultAlias
{
  id v3 = objc_alloc((Class)ECEmailAddress);
  id v4 = [(MFAccount *)self->super._account defaultEmailAddress];
  id v5 = [v3 initWithString:v4];
  id v6 = [v5 simpleAddress];

  return v6;
}

- (void)_enableAlias:(id)a3 forSpecifier:(id)a4
{
  id v8 = a3;
  id v6 = [a4 userInfo];
  id v7 = [v6 objectForKey:MFAliasPreferenceNameKey];

  -[MFAccount setEnabled:forEmailAddress:](self->super._account, "setEnabled:forEmailAddress:", [v8 BOOLValue], v7);
}

- (id)_isAliasEnabledForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MFAccount *)self->super._account emailAddressesAndAliases];
  id v6 = [v4 userInfo];
  id v7 = [v6 objectForKey:MFAliasPreferenceNameKey];

  id v8 = [v5 objectForKey:v7];

  return v8;
}

- (BOOL)_hasICloudMailAccount
{
  appleAccount = self->_appleAccount;
  if (appleAccount) {
    LOBYTE(appleAccount) = [(ACAccount *)appleAccount isEnabledForDataclass:ACAccountDataclassMail];
  }
  return (char)appleAccount;
}

- (BOOL)_addAccount:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() supportedDataclasses];
  id v5 = [v4 count];

  if ((unint64_t)v5 < 2)
  {
    id v6 = [v3 defaultPath];
    [v3 setPath:v6];

    id v7 = [v3 persistentAccount];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = objc_msgSend(v7, "provisionedDataclasses", 0);
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          [v7 setEnabled:1 forDataclass:*(void *)(*((void *)&v13 + 1) + 8 * (void)v11)];
          uint64_t v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    [v3 savePersistentAccount];
  }

  return (unint64_t)v5 < 2;
}

- (void)reallyDeleteAccount
{
  id v3 = [(AccountPSDetailControllerBase *)self account];
  [v3 removePersistentAccount];

  [(AccountPSDetailController *)self removeParentSpecifier];

  [(AccountPSDetailController *)self dismissAnimated:1];
}

- (int64_t)validateEasySetupAccounts
{
  easySetupAccount = self->_easySetupAccount;
  if (!easySetupAccount)
  {
    uint64_t v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"AccountPSDetailController.m" lineNumber:1734 description:@"Expected a valid easy setup account"];

    easySetupAccount = self->_easySetupAccount;
  }
  id v4 = [(MailAccount *)easySetupAccount hostname];
  id v5 = [(MailAccount *)self->_easySetupAccount username];
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = +[MailAccount existingAccountWithType:v7 hostname:v4 username:v5];
  if (v8)
  {
    objc_storeStrong((id *)&self->_existingIncomingAccount, v8);
    int64_t v9 = 0;
  }
  else
  {
    int64_t v9 = [(AccountPSDetailControllerBase *)self validateAccount:self->_easySetupAccount withFallbacks:0];
  }

  return v9;
}

- (void)_copyUIInformationIntoIncomingAccount:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    id v4 = [(AccountPSDetailController *)self _incomingAccountPropertyForKey:MailAccountFullUserName];
    [v11 setFullUserName:v4];

    id v5 = [(AccountPSDetailController *)self _incomingAccountPropertyForKey:MailAccountEmailAddresses];
    [v11 setEmailAddresses:v5];

    id v6 = [(AccountPSDetailController *)self _incomingAccountPropertyForKey:MailAccountPassword];
    [v11 setPassword:v6];

    id v7 = [(AccountPSDetailController *)self _incomingAccountPropertyForKey:MFMailAccountDescription];
    [v11 setDisplayName:v7];

    id v8 = [*(id *)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
    int64_t v9 = [v8 objectForKey:@"RegionalDisplayName"];
    [v11 setAccountProperty:v9 forKey:@"RegionalDisplayName"];

    uint64_t v10 = [v8 objectForKey:@"PlaceholderAddress"];
    [v11 setAccountProperty:v10 forKey:@"PlaceholderAddress"];
  }
}

- (void)_copyUIInformationIntoDeliveryAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    id v5 = [(AccountPSDetailController *)self _incomingAccountPropertyForKey:MailAccountPassword];
    [v6 setPassword:v5];

    id v4 = v6;
  }
}

- (BOOL)_bypassAccountValidation
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"EasySetupBypassValidation"];

  return v3;
}

- (id)addAccountFromCurrentSettings
{
  unsigned __int8 v3 = [(AccountPSDetailControllerBase *)self fixAccountInputValues:self->super._accountValues];
  if (self->_alternateEmailIncomingAccount) {
    id v4 = (objc_class *)objc_opt_class();
  }
  else {
    id v4 = [(AccountPSDetailController *)self accountClass];
  }
  id v5 = v4;
  id v6 = [(objc_class *)v4 newAccountWithDictionary:v3];
  if ((*((unsigned char *)self + 392) & 4) != 0 && !self->_shouldUseSSL)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v7 = MailAccountSSLEnabledIsEditable;
    id v8 = [(objc_class *)v5 predefinedValueForKey:MailAccountSSLEnabledIsEditable];
    if (v8)
    {
      int64_t v9 = [(objc_class *)v5 predefinedValueForKey:v7];
      if ([v9 BOOLValue])
      {
        id v10 = &dword_0 + 1;
      }
      else
      {
        id v11 = [(objc_class *)v5 predefinedValueForKey:MailAccountSSLEnabled];
        id v10 = [v11 BOOLValue];
      }
    }
    else
    {
      id v10 = &dword_0 + 1;
    }

    [v6 setUsesSSL:v10];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = [v6 deliveryAccount];
    if (v12) {
      goto LABEL_23;
    }
  }
  if (!self->_outgoingAccountValues)
  {
    uint64_t v12 = 0;
LABEL_23:
    [(AccountPSDetailController *)self _addAccount:v6];
    goto LABEL_24;
  }
  long long v13 = objc_opt_class();
  long long v14 = [(id)objc_opt_class() normalizeAccountProperties:self->_outgoingAccountValues withAccountClass:v13];
  long long v15 = [v14 objectForKey:MFMailAccountUsername];

  if (v15) {
    [v14 setObject:@"YES" forKey:DeliveryAccountShouldUseAuthentication];
  }
  id v16 = [v13 newAccountWithDictionary:v14];
  id v17 = v16;
  if ((*((unsigned char *)self + 392) & 4) == 0 || self->_shouldUseSSL) {
    [v16 setUsesSSL:v10];
  }
  [v6 setDeliveryAccount:v17];
  [(AccountPSDetailController *)self _addAccount:v6];
  +[DeliveryAccount addDeliveryAccount:v17];
  [v17 savePersistentAccount];

  uint64_t v12 = 0;
LABEL_24:

  return v6;
}

- (void)_getAccountInfoForEmailAddress:(id)a3
{
  id v4 = a3;
  id v7 = 0;
  id obj = 0;
  id v6 = 0;
  if ([(AccountPSDetailController *)self copyAccountsForEmailAddress:v4 incomingAccount:&obj deliveryAccount:&v7 easySetupNotes:&v6] == 2)
  {
    [(AccountPSDetailController *)self _copyUIInformationIntoIncomingAccount:obj];
    [(AccountPSDetailController *)self _copyUIInformationIntoDeliveryAccount:v7];
    objc_storeStrong((id *)&self->_alternateEmailIncomingAccount, obj);
    objc_storeStrong((id *)&self->_alternateEmailDeliveryAccount, v7);
    self->_usingAlternateEmailAccount = 1;
    [(AccountPSDetailControllerBase *)self validateAccount:obj withFallbacks:1];
  }
}

- (id)addAlternateEmailAccountFromCurrentSettings
{
  if (self->_alternateEmailDeliveryAccount) {
    -[MailAccount setDeliveryAccount:](self->_alternateEmailIncomingAccount, "setDeliveryAccount:");
  }
  [(AccountPSDetailController *)self _addAccount:self->_alternateEmailIncomingAccount];
  if (self->_alternateEmailDeliveryAccount)
  {
    +[DeliveryAccount addDeliveryAccount:](DeliveryAccount, "addDeliveryAccount:");
    [self->_alternateEmailDeliveryAccount savePersistentAccount];
  }
  alternateEmailIncomingAccount = self->_alternateEmailIncomingAccount;

  return alternateEmailIncomingAccount;
}

- (id)_createDeliveryAccountWithUIValues
{
  unsigned __int8 v3 = objc_opt_class();
  id v4 = [(id)objc_opt_class() normalizeAccountProperties:self->_outgoingAccountValues withAccountClass:v3];
  id v5 = [v4 objectForKey:MFMailAccountUsername];

  if (v5) {
    [v4 setObject:@"YES" forKey:DeliveryAccountShouldUseAuthentication];
  }
  id v6 = [v3 newAccountWithDictionary:v4];

  return v6;
}

- (BOOL)_setupDeliveryAccountForValidatedAccount:(id)a3
{
  id v4 = a3;
  +[DeliveryAccount reloadDeliveryAccounts];
  id v5 = [(NSMutableDictionary *)self->_outgoingAccountValues objectForKey:MailAccountHostname];
  id v6 = [(NSMutableDictionary *)self->_outgoingAccountValues objectForKey:MFMailAccountUsername];
  id v7 = +[DeliveryAccount existingAccountWithHostname:v5 username:v6];
  id v8 = v7;
  if (!v7 || ![v7 usesSSL])
  {
    if (self->_easySetupDeliveryAccount)
    {
      if (self->_easySetupAccountTypes)
      {
        objc_msgSend(v4, "setDeliveryAccount:");
        [(AccountPSDetailController *)self _addAccount:v4];
        +[DeliveryAccount addDeliveryAccount:self->_easySetupDeliveryAccount];
        [self->_easySetupDeliveryAccount savePersistentAccount];
        goto LABEL_8;
      }
    }
    else if (!self->_outgoingAccountValues)
    {
      if ((*((unsigned char *)self + 392) & 1) == 0) {
        goto LABEL_4;
      }
      [(AccountPSDetailController *)self _hideAccountValidationProgressUIWithPrompt:self->super._initialTitle];
LABEL_16:
      BOOL v9 = 0;
      goto LABEL_17;
    }
    [(AccountPSDetailController *)self setCandidateIncomingAccount:v4];
    id v10 = self->_easySetupDeliveryAccount;
    if (v10
      || ([(AccountPSDetailController *)self _createDeliveryAccountWithUIValues],
          (id v10 = (DeliveryAccount *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v11 = [(DeliveryAccount *)v10 defaultConnectionSettings];
      originalConnectionSettings = self->super._originalConnectionSettings;
      self->super._originalConnectionSettings = v11;

      easySetupDeliveryAccount = self->_easySetupDeliveryAccount;
      if (easySetupDeliveryAccount) {
        id v14 = [easySetupDeliveryAccount usesSSL];
      }
      else {
        id v14 = &dword_0 + 1;
      }
      long long v15 = [(AccountPSDetailControllerBase *)self accountValidator];
      [v15 validateAccount:v10 useSSL:v14];
    }
    goto LABEL_16;
  }
  [v4 setDeliveryAccount:v8];
LABEL_4:
  [(AccountPSDetailController *)self _addAccount:v4];
LABEL_8:
  BOOL v9 = 1;
LABEL_17:

  return v9;
}

- (BOOL)validateEmailAddress:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)ECEmailAddress) initWithString:v4];

  if (!v5)
  {
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"INVALID_EMAIL_ADDRESS_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v9 = [v8 localizedStringForKey:@"INVALID_EMAIL_ADDRESS_BODY" value:&stru_B9F70 table:@"AccountPreferences"];
    [(AccountPSDetailController *)self _showFailedAddressAlertWithTitle:v7 body:v9];

    id v10 = [(AccountPSDetailController *)self specifierForID:MailAccountEmailAddresses];
    id v11 = [v10 propertyForKey:PSTableCellKey];
    uint64_t v12 = *(void **)&self->super.ACUIViewController_opaque[OBJC_IVAR___PSListController__table];
    long long v13 = [v12 indexPathForCell:v11];
    [v12 scrollToRowAtIndexPath:v13 atScrollPosition:2 animated:1];

    [(AccountPSDetailControllerBase *)self setViewsEnabled:1];
  }

  return v5 != 0;
}

- (id)easySetupNote
{
  CFLocaleRef v3 = CFLocaleCopyCurrent();
  uint64_t v4 = [(__CFString *)(id)CFLocaleGetIdentifier(v3) lowercaseString];
  if (v4) {
    id v5 = (__CFString *)v4;
  }
  else {
    id v5 = @"en_us";
  }
  CFRelease(v3);
  id v6 = [(NSDictionary *)self->_easySetupNotes objectForKey:v5];
  if (![v6 length])
  {
    id v7 = [(__CFString *)v5 rangeOfString:@"_"];
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = [(__CFString *)v5 substringToIndex:v7];
      if (v8)
      {
        uint64_t v9 = [(NSDictionary *)self->_easySetupNotes objectForKey:v8];
      }
      else
      {
        uint64_t v9 = 0;
      }

      id v6 = (void *)v9;
    }
  }

  return v6;
}

- (id)_setOfKeysForAlteredValuesInDictionary:(id)a3 originalDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v29 = objc_alloc_init((Class)NSMutableSet);
  id v7 = objc_alloc((Class)NSSet);
  id v8 = [v5 allKeys];
  id v27 = [v7 initWithArray:v8];

  id v9 = objc_alloc((Class)NSMutableSet);
  id v10 = [v6 allKeys];
  id v11 = [v9 initWithArray:v10];

  BOOL v28 = v11;
  [v11 intersectSet:v27];
  id v12 = objc_alloc((Class)NSMutableSet);
  long long v13 = [v6 allKeys];
  id v14 = [v12 initWithArray:v13];

  long long v26 = v14;
  [v14 unionSet:v27];
  [v14 minusSet:v28];
  long long v15 = [v14 allObjects];
  [v29 addObjectsFromArray:v15];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = [v28 allObjects];
  id v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v31;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v21 = [v5 objectForKey:v20];

        if (v21)
        {
          long long v22 = [v6 objectForKey:v20];
          id v23 = [v5 objectForKey:v20];
          unsigned __int8 v24 = [v22 isEqual:v23];

          if ((v24 & 1) == 0) {
            [v29 addObject:v20];
          }
        }
      }
      id v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v17);
  }

  return v29;
}

- (void)icloudMailCreationNeedsViewUpdate:(id)a3 withAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self)
  {
    id v9 = objc_msgSend(v7, "aa_childMailAccount");
    if (v9)
    {
      id v10 = +[AccountPSDetailController log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v9;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "child mail account configured in delegate %@", (uint8_t *)&v15, 0xCu);
      }

      id v11 = +[MFAccount accountWithPersistentAccount:v9];
      if (v11)
      {
        id v12 = +[AccountPSDetailController log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138412290;
          id v16 = v11;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "mf mail account configured in delegate %@", (uint8_t *)&v15, 0xCu);
        }

        [(AccountPSDetailController *)self setAccount:v11];
      }
      else
      {
        long long v13 = +[AccountPSDetailController log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "mf mail account not configured in delegate", (uint8_t *)&v15, 2u);
        }
      }
    }
    else
    {
      id v11 = +[AccountPSDetailController log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "child mail account not configured in delegate.", (uint8_t *)&v15, 2u);
      }
    }

    [(AccountPSDetailController *)self reloadSpecifiers];
    id v14 = +[AccountPSDetailController log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "specifier reloaded after mail create", (uint8_t *)&v15, 2u);
    }
  }
  else
  {
    id v9 = +[AccountPSDetailController log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "No self. cannot update view for mail account create", (uint8_t *)&v15, 2u);
    }
  }
}

- (BYODListDomain)domainList
{
  return self->_domainList;
}

- (void)setDomainList:(id)a3
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
  objc_storeStrong((id *)&self->_domainList, 0);
  objc_storeStrong((id *)&self->mailDataclassSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_byodSpecifierProviderAdapter, 0);
  objc_storeStrong((id *)&self->_icloudMailCreator, 0);
  objc_storeStrong((id *)&self->_emailAliasListController, 0);
  objc_storeStrong((id *)&self->_mailAccount, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_imapAccountClassString, 0);
  objc_storeStrong((id *)&self->_popAccountClassString, 0);
  objc_storeStrong((id *)&self->_usernameField, 0);
  objc_storeStrong((id *)&self->_passwordSpecifier, 0);
  objc_storeStrong((id *)&self->_accountTypeSegmentedControl, 0);
  objc_storeStrong((id *)&self->_easySetupAccountTypes, 0);
  objc_storeStrong((id *)&self->_easySetupNotes, 0);
  objc_storeStrong((id *)&self->_easySetupDeliveryAccount, 0);
  objc_storeStrong((id *)&self->_easySetupAccount, 0);
  objc_storeStrong((id *)&self->_existingIncomingAccount, 0);
  objc_storeStrong((id *)&self->_alternateEmailDeliveryAccount, 0);
  objc_storeStrong((id *)&self->_alternateEmailIncomingAccount, 0);
  objc_storeStrong((id *)&self->_chosenType, 0);
  objc_storeStrong((id *)&self->_candidateIncomingAccount, 0);
  objc_storeStrong((id *)&self->_outgoingAccountValuesAfterFailedValidation, 0);

  objc_storeStrong((id *)&self->_outgoingAccountValues, 0);
}

@end