@interface TPSCallForwardingListController
- (PSSpecifier)conditionalServiceSwitchSpecifier;
- (PSSpecifier)mainSwitchSpecifier;
- (TPSCallForwardingController)callForwardingController;
- (id)conditionalServiceBusyPhoneNumber:(id)a3;
- (id)conditionalServiceSwitchOn:(id)a3;
- (id)conditionalServiceTypeSpecifiers;
- (id)conditionalServiceUnansweredPhoneNumber:(id)a3;
- (id)conditionalServiceUnreachablePhoneNumber:(id)a3;
- (id)mainSwitchOn:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)unconditionalServicePhoneNumber:(id)a3;
- (id)unconditionalServiceTypeSpecifiers;
- (void)callForwardingController:(id)a3 didChangeServiceType:(int64_t)a4;
- (void)callForwardingController:(id)a3 didChangeValue:(id)a4 error:(id)a5;
- (void)configureCell:(id)a3;
- (void)configureCell:(id)a3 forSpecifier:(id)a4;
- (void)setConditionalServiceBusyPhoneNumber:(id)a3 specifier:(id)a4;
- (void)setConditionalServiceSwitchOn:(id)a3 specifier:(id)a4;
- (void)setConditionalServiceUnansweredPhoneNumber:(id)a3 specifier:(id)a4;
- (void)setConditionalServiceUnreachablePhoneNumber:(id)a3 specifier:(id)a4;
- (void)setMainSwitchOn:(id)a3 specifier:(id)a4;
- (void)setUnconditionalServicePhoneNumber:(id)a3 specifier:(id)a4;
@end

@implementation TPSCallForwardingListController

- (TPSCallForwardingController)callForwardingController
{
  callForwardingController = self->_callForwardingController;
  if (!callForwardingController)
  {
    v4 = [TPSCallForwardingController alloc];
    v5 = [(TPSCallForwardingListController *)self subscriptionContext];
    v6 = [(TPSCallForwardingController *)v4 initWithSubscriptionContext:v5];
    v7 = self->_callForwardingController;
    self->_callForwardingController = v6;

    [(TPSCallForwardingController *)self->_callForwardingController setDelegate:self];
    callForwardingController = self->_callForwardingController;
  }

  return callForwardingController;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->TPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(TPSCallForwardingListController *)self subscriptionContext];
    v6 = [(TPSCallForwardingListController *)self callForwardingController];
    if (!v5)
    {
LABEL_14:

      v4 = *(void **)&self->TPSListController_opaque[v3];
      goto LABEL_15;
    }
    v7 = +[NSMutableArray array];
    v8 = [(TPSCallForwardingListController *)self mainSwitchSpecifier];
    [v7 addObject:v8];

    v9 = (char *)[v6 serviceType];
    if (v9 != (unsigned char *)&dword_0 + 1)
    {
      v10 = v9;
      if (([v6 isLoading] & 1) == 0
        && ([v6 isUnloading] & 1) == 0)
      {
        if ([v6 isConditionalServiceAvailable])
        {
          v11 = [(TPSCallForwardingListController *)self conditionalServiceSwitchSpecifier];
          [v7 addObject:v11];
        }
        if (v10 == (unsigned char *)&dword_0 + 2)
        {
          uint64_t v12 = [(TPSCallForwardingListController *)self unconditionalServiceTypeSpecifiers];
          goto LABEL_12;
        }
        if (v10 == (unsigned char *)&dword_0 + 3)
        {
          uint64_t v12 = [(TPSCallForwardingListController *)self conditionalServiceTypeSpecifiers];
LABEL_12:
          v13 = (void *)v12;
          [v7 addObjectsFromArray:v12];
        }
      }
    }
    id v14 = [v7 copy];
    v15 = *(void **)&self->TPSListController_opaque[v3];
    *(void *)&self->TPSListController_opaque[v3] = v14;

    goto LABEL_14;
  }
LABEL_15:

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TPSCallForwardingListController;
  v5 = [(TPSCallForwardingListController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  [(TPSCallForwardingListController *)self configureCell:v5];

  return v5;
}

- (PSSpecifier)mainSwitchSpecifier
{
  mainSwitchSpecifier = self->_mainSwitchSpecifier;
  if (!mainSwitchSpecifier)
  {
    v4 = +[TPSCallForwardingStrings localizedStringForKey:@"MAIN_SWITCH_SPECIFIER_TITLE"];
    v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setMainSwitchOn:specifier:" get:"mainSwitchOn:" detail:0 cell:6 edit:0];
    v6 = self->_mainSwitchSpecifier;
    self->_mainSwitchSpecifier = v5;

    mainSwitchSpecifier = self->_mainSwitchSpecifier;
  }

  return mainSwitchSpecifier;
}

- (PSSpecifier)conditionalServiceSwitchSpecifier
{
  conditionalServiceSwitchSpecifier = self->_conditionalServiceSwitchSpecifier;
  if (!conditionalServiceSwitchSpecifier)
  {
    v4 = +[TPSCallForwardingStrings localizedStringForKey:@"CONDITIONAL_SWITCH_SPECIFIER_TITLE"];
    v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setConditionalServiceSwitchOn:specifier:" get:"conditionalServiceSwitchOn:" detail:0 cell:6 edit:0];
    v6 = self->_conditionalServiceSwitchSpecifier;
    self->_conditionalServiceSwitchSpecifier = v5;

    conditionalServiceSwitchSpecifier = self->_conditionalServiceSwitchSpecifier;
  }

  return conditionalServiceSwitchSpecifier;
}

- (id)conditionalServiceTypeSpecifiers
{
  uint64_t v3 = +[NSMutableArray array];
  v4 = [(TPSCallForwardingListController *)self callForwardingController];
  v5 = +[PSSpecifier emptyGroupSpecifier];
  [v3 addObject:v5];
  v6 = [v4 localizedConditionalBusyTitle];
  uint64_t v7 = objc_opt_class();
  v8 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setConditionalServiceBusyPhoneNumber:specifier:" get:"conditionalServiceBusyPhoneNumber:" detail:v7 cell:2 edit:objc_opt_class()];

  [v3 addObject:v8];
  v9 = [v4 localizedConditionalUnansweredTitle];
  uint64_t v10 = objc_opt_class();
  v11 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:"setConditionalServiceUnansweredPhoneNumber:specifier:" get:"conditionalServiceUnansweredPhoneNumber:" detail:v10 cell:2 edit:objc_opt_class()];

  [v3 addObject:v11];
  uint64_t v12 = [v4 localizedConditionalUnreachableTitle];
  uint64_t v13 = objc_opt_class();
  id v14 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:"setConditionalServiceUnreachablePhoneNumber:specifier:" get:"conditionalServiceUnreachablePhoneNumber:" detail:v13 cell:2 edit:objc_opt_class()];

  [v3 addObject:v14];
  id v15 = [v3 copy];

  return v15;
}

- (id)unconditionalServiceTypeSpecifiers
{
  uint64_t v3 = +[NSMutableArray array];
  v4 = +[PSSpecifier emptyGroupSpecifier];
  [v3 addObject:v4];
  v5 = +[TPSCallForwardingStrings localizedStringForKey:@"UNCONDITIONAL_SERVICE_FORWARD_TO_SPECIFIER_TITLE"];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:"setUnconditionalServicePhoneNumber:specifier:" get:"unconditionalServicePhoneNumber:" detail:v6 cell:2 edit:objc_opt_class()];

  [v3 addObject:v7];
  id v8 = [v3 copy];

  return v8;
}

- (id)mainSwitchOn:(id)a3
{
  uint64_t v3 = [(TPSCallForwardingListController *)self callForwardingController];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 serviceType] != (char *)&dword_0 + 1);

  return v4;
}

- (void)setMainSwitchOn:(id)a3 specifier:(id)a4
{
  id v14 = a3;
  uint64_t v6 = PSControlKey;
  id v7 = a4;
  id v8 = [v7 propertyForKey:v6];
  objc_msgSend(v8, "setOn:animated:", objc_msgSend(v14, "BOOLValue"), 1);
  v9 = [(TPSCallForwardingListController *)self cachedCellForSpecifier:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 setLoading:1];
  }
  unsigned int v10 = [v14 BOOLValue];
  v11 = [(TPSCallForwardingListController *)self callForwardingController];
  uint64_t v12 = v11;
  if (v10) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  [v11 updateServiceType:v13];
}

- (id)conditionalServiceBusyPhoneNumber:(id)a3
{
  uint64_t v3 = [(TPSCallForwardingListController *)self callForwardingController];
  v4 = [v3 conditionalServiceBusyPhoneNumber];

  return v4;
}

- (void)setConditionalServiceBusyPhoneNumber:(id)a3 specifier:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(TPSCallForwardingListController *)self callForwardingController];
  [v7 setConditionalServiceBusyPhoneNumber:v6];

  [(TPSCallForwardingListController *)self reloadSpecifier:v8];
}

- (id)conditionalServiceUnansweredPhoneNumber:(id)a3
{
  uint64_t v3 = [(TPSCallForwardingListController *)self callForwardingController];
  v4 = [v3 conditionalServiceUnansweredPhoneNumber];

  return v4;
}

- (void)setConditionalServiceUnansweredPhoneNumber:(id)a3 specifier:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(TPSCallForwardingListController *)self callForwardingController];
  [v7 setConditionalServiceUnansweredPhoneNumber:v6];

  [(TPSCallForwardingListController *)self reloadSpecifier:v8];
}

- (id)conditionalServiceUnreachablePhoneNumber:(id)a3
{
  uint64_t v3 = [(TPSCallForwardingListController *)self callForwardingController];
  v4 = [v3 conditionalServiceUnreachablePhoneNumber];

  return v4;
}

- (void)setConditionalServiceUnreachablePhoneNumber:(id)a3 specifier:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(TPSCallForwardingListController *)self callForwardingController];
  [v7 setConditionalServiceUnreachablePhoneNumber:v6];

  [(TPSCallForwardingListController *)self reloadSpecifier:v8];
}

- (id)conditionalServiceSwitchOn:(id)a3
{
  uint64_t v3 = [(TPSCallForwardingListController *)self callForwardingController];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 serviceType] == (char *)&dword_0 + 3);

  return v4;
}

- (void)setConditionalServiceSwitchOn:(id)a3 specifier:(id)a4
{
  id v14 = a3;
  uint64_t v6 = PSControlKey;
  id v7 = a4;
  id v8 = [v7 propertyForKey:v6];
  objc_msgSend(v8, "setOn:animated:", objc_msgSend(v14, "BOOLValue"), 1);
  v9 = [(TPSCallForwardingListController *)self cachedCellForSpecifier:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 setLoading:1];
  }
  unsigned int v10 = [v14 BOOLValue];
  v11 = [(TPSCallForwardingListController *)self callForwardingController];
  uint64_t v12 = v11;
  if (v10) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 2;
  }
  [v11 updateServiceType:v13];
}

- (id)unconditionalServicePhoneNumber:(id)a3
{
  uint64_t v3 = [(TPSCallForwardingListController *)self callForwardingController];
  v4 = [v3 unconditionalServicePhoneNumber];

  return v4;
}

- (void)setUnconditionalServicePhoneNumber:(id)a3 specifier:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(TPSCallForwardingListController *)self callForwardingController];
  [v7 setUnconditionalServicePhoneNumber:v6];

  [(TPSCallForwardingListController *)self reloadSpecifier:v8];
}

- (void)configureCell:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v6;
    v5 = [v4 specifier];
    [(TPSCallForwardingListController *)self configureCell:v4 forSpecifier:v5];
  }
}

- (void)configureCell:(id)a3 forSpecifier:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(TPSCallForwardingListController *)self callForwardingController];
  id v8 = [v13 specifier];
  v9 = [(TPSCallForwardingListController *)self mainSwitchSpecifier];

  if (v8 == v9)
  {
    id v10 = v13;
    if ([v7 isLoading]) {
      id v11 = &dword_0 + 1;
    }
    else {
      id v11 = [v7 isUnloading];
    }
    [v10 setLoading:v11];
    uint64_t v12 = [v6 propertyForKey:PSControlKey];
    objc_msgSend(v12, "setEnabled:", objc_msgSend(v7, "serviceType") != 0);
  }
}

- (void)callForwardingController:(id)a3 didChangeServiceType:(int64_t)a4
{
}

- (void)callForwardingController:(id)a3 didChangeValue:(id)a4 error:(id)a5
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_conditionalServiceSwitchSpecifier, 0);

  objc_storeStrong((id *)&self->_callForwardingController, 0);
}

@end