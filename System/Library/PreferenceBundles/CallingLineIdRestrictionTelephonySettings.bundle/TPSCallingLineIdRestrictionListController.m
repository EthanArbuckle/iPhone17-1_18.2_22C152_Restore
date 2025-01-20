@interface TPSCallingLineIdRestrictionListController
- (PSSpecifier)mainSwitchSpecifier;
- (TPSCallingLineIdRestrictionController)callingLineIdRestrictionController;
- (id)mainSwitchOn:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)callingLineIdController:(id)a3 didChangeState:(int64_t)a4 error:(id)a5;
- (void)configureCell:(id)a3;
- (void)configureCell:(id)a3 forSpecifier:(id)a4;
- (void)setMainSwitchOn:(id)a3 specifier:(id)a4;
@end

@implementation TPSCallingLineIdRestrictionListController

- (TPSCallingLineIdRestrictionController)callingLineIdRestrictionController
{
  callingLineIdRestrictionController = self->_callingLineIdRestrictionController;
  if (!callingLineIdRestrictionController)
  {
    v4 = [TPSCallingLineIdRestrictionController alloc];
    v5 = [(TPSCallingLineIdRestrictionListController *)self subscriptionContext];
    v6 = [(TPSCallingLineIdRestrictionController *)v4 initWithSubscriptionContext:v5];
    v7 = self->_callingLineIdRestrictionController;
    self->_callingLineIdRestrictionController = v6;

    [(TPSCallingLineIdRestrictionController *)self->_callingLineIdRestrictionController setDelegate:self];
    callingLineIdRestrictionController = self->_callingLineIdRestrictionController;
  }

  return callingLineIdRestrictionController;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->TPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(TPSCallingLineIdRestrictionListController *)self subscriptionContext];
    if (v5)
    {
      v6 = +[NSMutableArray array];
      v7 = [(TPSCallingLineIdRestrictionListController *)self mainSwitchSpecifier];
      [v6 addObject:v7];

      id v8 = [v6 copy];
      v9 = *(void **)&self->TPSListController_opaque[v3];
      *(void *)&self->TPSListController_opaque[v3] = v8;
    }
    v4 = *(void **)&self->TPSListController_opaque[v3];
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TPSCallingLineIdRestrictionListController;
  v5 = [(TPSCallingLineIdRestrictionListController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  [(TPSCallingLineIdRestrictionListController *)self configureCell:v5];

  return v5;
}

- (PSSpecifier)mainSwitchSpecifier
{
  mainSwitchSpecifier = self->_mainSwitchSpecifier;
  if (!mainSwitchSpecifier)
  {
    v4 = +[TPSCallingLineIdRestrictionStrings localizedStringForKey:@"MAIN_SWITCH_SPECIFIER_TITLE"];
    v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setMainSwitchOn:specifier:" get:"mainSwitchOn:" detail:0 cell:6 edit:0];
    v6 = self->_mainSwitchSpecifier;
    self->_mainSwitchSpecifier = v5;

    mainSwitchSpecifier = self->_mainSwitchSpecifier;
  }

  return mainSwitchSpecifier;
}

- (id)mainSwitchOn:(id)a3
{
  uint64_t v3 = [(TPSCallingLineIdRestrictionListController *)self callingLineIdRestrictionController];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 state] != (char *)&dword_0 + 2);

  return v4;
}

- (void)setMainSwitchOn:(id)a3 specifier:(id)a4
{
  id v12 = a3;
  uint64_t v6 = PSControlKey;
  id v7 = a4;
  id v8 = [v7 propertyForKey:v6];
  objc_msgSend(v8, "setOn:animated:", objc_msgSend(v12, "BOOLValue"), 1);
  v9 = [(TPSCallingLineIdRestrictionListController *)self cachedCellForSpecifier:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 setLoading:1];
  }
  if ([v12 BOOLValue]) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  v11 = [(TPSCallingLineIdRestrictionListController *)self callingLineIdRestrictionController];
  [v11 requestStateChange:v10];
}

- (void)configureCell:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v6;
    v5 = [v4 specifier];
    [(TPSCallingLineIdRestrictionListController *)self configureCell:v4 forSpecifier:v5];
  }
}

- (void)configureCell:(id)a3 forSpecifier:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [v13 specifier];
  id v8 = [(TPSCallingLineIdRestrictionListController *)self mainSwitchSpecifier];

  if (v7 == v8)
  {
    id v9 = v13;
    uint64_t v10 = [(TPSCallingLineIdRestrictionListController *)self callingLineIdRestrictionController];
    objc_msgSend(v9, "setLoading:", objc_msgSend(v10, "state") == 0);

    v11 = [v6 propertyForKey:PSControlKey];
    id v12 = [(TPSCallingLineIdRestrictionListController *)self callingLineIdRestrictionController];
    objc_msgSend(v11, "setEnabled:", objc_msgSend(v12, "isEditable"));
  }
}

- (void)callingLineIdController:(id)a3 didChangeState:(int64_t)a4 error:(id)a5
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainSwitchSpecifier, 0);

  objc_storeStrong((id *)&self->_callingLineIdRestrictionController, 0);
}

@end