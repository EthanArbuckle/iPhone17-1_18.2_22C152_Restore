@interface iCloudMailboxSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (NSArray)specifiers;
- (iCloudMailboxSpecifierProvider)initWithAccountManager:(id)a3;
- (iCloudMailboxSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (void)_mailboxBehaviorWasTapped:(id)a3;
- (void)_presentAdvancedSettings:(int64_t)a3 specifier:(id)a4;
- (void)_smimeWasTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation iCloudMailboxSpecifierProvider

- (iCloudMailboxSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)iCloudMailboxSpecifierProvider;
  v9 = [(iCloudMailboxSpecifierProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_presenter, v8);
  }

  return v10;
}

- (iCloudMailboxSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(iCloudMailboxSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    v4 = [(AIDAAccountManager *)self->_accountManager accounts];
    v5 = [v4 objectForKeyedSubscript:AIDAServiceTypeCloud];

    uint64_t v6 = ACUIAccountKey;
    uint64_t v22 = ACUIAccountKey;
    v23 = v5;
    id v7 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v8 = +[NSMutableDictionary dictionaryWithDictionary:v7];

    if (objc_msgSend(v5, "aa_isAccountClass:", AAAccountClassPrimary))
    {
      v9 = objc_msgSend(v5, "aa_childMailAccount");
      if (v9) {
        [v8 setObject:v9 forKeyedSubscript:v6];
      }
    }
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"MAILBOX_BEHAVIORS" value:&stru_B9F70 table:@"AccountPreferences"];
    objc_super v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:1 edit:0];

    [v12 setIdentifier:@"iCloudMailboxBehaviorID"];
    [v12 setUserInfo:v8];
    [v12 setControllerLoadAction:"_mailboxBehaviorWasTapped:"];
    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"SIGNING_AND_ENCRYPTION" value:&stru_B9F70 table:@"AccountPreferences"];
    v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:1 edit:0];

    [v15 setIdentifier:@"iCloudMailboxSMIMEID"];
    id v16 = [v8 copy];
    [v15 setUserInfo:v16];

    [v15 setControllerLoadAction:"_smimeWasTapped:"];
    v21[0] = v12;
    v21[1] = v15;
    uint64_t v17 = +[NSArray arrayWithObjects:v21 count:2];
    v19 = self->_specifiers;
    p_specifiers = &self->_specifiers;
    *p_specifiers = (NSArray *)v17;

    specifiers = *p_specifiers;
  }

  return specifiers;
}

- (void)_mailboxBehaviorWasTapped:(id)a3
{
}

- (void)_smimeWasTapped:(id)a3
{
}

- (void)_presentAdvancedSettings:(int64_t)a3 specifier:(id)a4
{
  id v17 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  if (WeakRetained)
  {
    id v7 = objc_alloc_init((Class)PSSetupController);
    id v8 = [v17 userInfo];
    id v9 = [v8 mutableCopy];

    v10 = [v9 objectForKey:ACUIAccountKey];
    v11 = +[MFAccount accountWithPersistentAccount:v10];
    [v9 setObject:v11 forKeyedSubscript:@"ExistingMessageAccount"];
    objc_super v12 = (NSMutableDictionary *)objc_opt_new();
    accountValues = self->_accountValues;
    self->_accountValues = v12;

    v14 = (NSMutableDictionary *)objc_opt_new();
    originalAccountValues = self->_originalAccountValues;
    self->_originalAccountValues = v14;

    [v9 setObject:self->_accountValues forKeyedSubscript:@"values"];
    [v9 setObject:self->_originalAccountValues forKeyedSubscript:@"originalValues"];
    [v17 setUserInfo:v9];
    id v16 = [[iCloudMailAdvancedController alloc] initWithPageType:a3];
    [(iCloudMailAdvancedController *)v16 setSpecifier:v17];
    [(iCloudMailAdvancedController *)v16 setParentController:v7];
    [(iCloudMailAdvancedController *)v16 setRootController:v7];
    [v7 showController:v16];
    [v7 setParentController:WeakRetained];
    [v7 setSpecifier:v17];
    [v7 setModalPresentationStyle:2];
    [WeakRetained presentViewController:v7 animated:1 completion:0];
  }
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_originalAccountValues, 0);
  objc_storeStrong((id *)&self->_accountValues, 0);
  objc_destroyWeak((id *)&self->_presenter);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end