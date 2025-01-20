@interface TPSPhonebookBundleController
- (PSSpecifier)telephoneNumberSpecifier;
- (TPSPhonebookBundleController)initWithParentListController:(id)a3;
- (TPSPhonebookController)phonebookController;
- (id)myNumber:(id)a3;
- (id)specifiers;
- (void)handleTPSPhonebookControllerSubscriptionDidChangeNotification:(id)a3;
@end

@implementation TPSPhonebookBundleController

- (TPSPhonebookBundleController)initWithParentListController:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TPSPhonebookBundleController;
  v3 = [(TPSPhonebookBundleController *)&v10 initWithParentListController:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(TPSPhonebookBundleController *)v3 subscriptionContext];
    if (v5)
    {
      v6 = [[TPSPhonebookController alloc] initWithSubscriptionContext:v5];
      phonebookController = v4->_phonebookController;
      v4->_phonebookController = v6;

      v8 = +[NSNotificationCenter defaultCenter];
      [v8 addObserver:v4 selector:"handleTPSPhonebookControllerSubscriptionDidChangeNotification:" name:TPSPhonebookControllerSubscriptionDidChangeNotification object:v4->_phonebookController];
    }
  }
  return v4;
}

- (id)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    v4 = +[NSMutableArray array];
    v5 = [(TPSPhonebookBundleController *)self telephoneNumberSpecifier];
    v6 = [(TPSPhonebookBundleController *)self phonebookController];
    unsigned __int8 v7 = [v6 isSubscriptionEditable];

    if ((v7 & 1) == 0) {
      [v5 setCellType:4];
    }
    [v4 addObject:v5];
    v8 = (NSArray *)[v4 copy];
    v9 = self->_specifiers;
    self->_specifiers = v8;

    specifiers = self->_specifiers;
  }

  return specifiers;
}

- (PSSpecifier)telephoneNumberSpecifier
{
  telephoneNumberSpecifier = self->_telephoneNumberSpecifier;
  if (!telephoneNumberSpecifier)
  {
    v4 = +[TPSPhonebookStrings localizedStringForKey:@"BUNDLE_CONTROLLER_ROOT_SPECIFIER_TITLE"];
    v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:"myNumber:" detail:objc_opt_class() cell:2 edit:0];
    v6 = self->_telephoneNumberSpecifier;
    self->_telephoneNumberSpecifier = v5;

    [(PSSpecifier *)self->_telephoneNumberSpecifier setIdentifier:@"PHONEBOOK_TELEPHONY_SETTINGS"];
    unsigned __int8 v7 = self->_telephoneNumberSpecifier;
    v8 = [(TPSPhonebookBundleController *)self phonebookController];
    v9 = (objc_class *)objc_opt_class();
    objc_super v10 = NSStringFromClass(v9);
    [(PSSpecifier *)v7 setProperty:v8 forKey:v10];

    telephoneNumberSpecifier = self->_telephoneNumberSpecifier;
  }

  return telephoneNumberSpecifier;
}

- (id)myNumber:(id)a3
{
  v3 = [(TPSPhonebookBundleController *)self phonebookController];
  v4 = [v3 localizedSubscriptionTelephoneNumber];

  return v4;
}

- (void)handleTPSPhonebookControllerSubscriptionDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = TPSPhonebookLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2112;
    id v12 = v4;
    id v6 = v10;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v9, 0x16u);
  }
  unsigned __int8 v7 = [(TPSPhonebookBundleController *)self parentListController];
  v8 = [(TPSPhonebookBundleController *)self telephoneNumberSpecifier];
  [v7 reloadSpecifier:v8];
}

- (TPSPhonebookController)phonebookController
{
  return self->_phonebookController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phonebookController, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);

  objc_storeStrong((id *)&self->_telephoneNumberSpecifier, 0);
}

@end