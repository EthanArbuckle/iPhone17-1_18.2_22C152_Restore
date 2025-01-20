@interface SafeDomainsPane
- (PSListController)parentListController;
- (id)_domainsListWithSpecifier:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_setDomainsList:(id)a3 withSpecifier:(id)a4;
- (void)setParentListController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SafeDomainsPane

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SafeDomainsPane;
  [(SafeDomainsPane *)&v5 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"HIGHLIGHT_ADDRESSES_EDIT_TITLE" value:&stru_39200 table:@"Preferences"];
  [(SafeDomainsPane *)self setTitle:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SafeDomainsPane;
  [(SafeDomainsPane *)&v6 viewDidAppear:a3];
  v4 = [(SafeDomainsPane *)self parentController];
  [(SafeDomainsPane *)self setParentListController:v4];

  textField = self->_textField;
  if (textField) {
    [(UITextField *)textField becomeFirstResponder];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SafeDomainsPane;
  [(SafeDomainsPane *)&v6 viewWillDisappear:a3];
  v4 = [(UITextField *)self->_textField delegate];
  [v4 textFieldDidEndEditing:self->_textField];

  objc_super v5 = [(SafeDomainsPane *)self parentListController];
  [v5 reloadSpecifier:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier]];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SafeDomainsPane;
  [(SafeDomainsPane *)&v4 viewDidDisappear:a3];
  [(SafeDomainsPane *)self setParentListController:0];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SafeDomainsPane;
  v8 = [(SafeDomainsPane *)&v15 tableView:v6 cellForRowAtIndexPath:v7];
  v9 = v8;
  if (!self->_textField && [v8 tag] == &dword_8)
  {
    v10 = [v9 textField];
    textField = self->_textField;
    self->_textField = v10;

    [(UITextField *)self->_textField setAutocapitalizationType:0];
    [(UITextField *)self->_textField setAutocorrectionType:1];
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"HIGHLIGHT_ADDRESSES_PLACEHOLDER" value:&stru_39200 table:@"Preferences"];
    [(UITextField *)self->_textField setPlaceholder:v13];

    [(UITextField *)self->_textField setKeyboardType:3];
    [(UITextField *)self->_textField setClearButtonMode:1];
  }

  return v9;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"HIGHLIGHT_ADDRESSES_EDIT_HEADER" value:&stru_39200 table:@"Preferences"];
    id v7 = +[PSSpecifier groupSpecifierWithName:v6];

    v8 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"_setDomainsList:withSpecifier:" get:"_domainsListWithSpecifier:" detail:0 cell:8 edit:0];
    v9 = +[MCProfileConnection sharedConnection];
    unsigned int v10 = [v9 isSettingLockedDownByRestrictions:MCFeatureManagedEmailDomains];

    v11 = +[NSNumber numberWithInt:v10 ^ 1];
    [v8 setProperty:v11 forKey:PSEnabledKey];

    v16[0] = v7;
    v16[1] = v8;
    uint64_t v12 = +[NSArray arrayWithObjects:v16 count:2];
    v13 = (void **)&self->PSListController_opaque[v3];
    v14 = *v13;
    void *v13 = (void *)v12;

    objc_super v4 = *v13;
  }

  return v4;
}

- (id)_domainsListWithSpecifier:(id)a3
{
  uint64_t v3 = +[MCProfileConnection sharedConnection];
  objc_super v4 = [v3 managedEmailDomains];

  if (v4)
  {
    objc_super v5 = [v4 componentsJoinedByString:@", "];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (void)_setDomainsList:(id)a3 withSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 length])
  {
    v16 = [v5 componentsSeparatedByString:@","];
    id v7 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v16;
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v11);
          v13 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
          v14 = [v12 stringByTrimmingCharactersInSet:v13];

          [v7 addObject:v14];
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v7 = 0;
  }
  objc_super v15 = +[MCProfileConnection sharedConnection];
  [v15 setManagedEmailDomains:v7];
}

- (PSListController)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentListController);

  return (PSListController *)WeakRetained;
}

- (void)setParentListController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentListController);

  objc_storeStrong((id *)&self->_textField, 0);
}

@end