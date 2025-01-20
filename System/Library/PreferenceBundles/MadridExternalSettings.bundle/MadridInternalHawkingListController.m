@interface MadridInternalHawkingListController
- (BOOL)_handleIsPersonal:(id)a3;
- (BOOL)_handleIsSetAsChina:(id)a3;
- (id)_getExternalChinaHandles;
- (id)getChinaToChinaEnabled:(id)a3;
- (id)getHandleIsChina:(id)a3;
- (id)hawkingEnabled:(id)a3;
- (id)specifiers;
- (void)_removeHandleAsChina:(id)a3;
- (void)_setHandleAsChina:(id)a3;
- (void)addNewHandle:(id)a3;
- (void)removedSpecifier:(id)a3;
- (void)setChinaToChinaEnabled:(id)a3 specifier:(id)a4;
- (void)setHandleAsChina:(id)a3 specifier:(id)a4;
- (void)setHawkingEnabled:(id)a3 specifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation MadridInternalHawkingListController

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MadridInternalHawkingListController;
  [(MadridInternalHawkingListController *)&v3 viewDidAppear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MadridInternalHawkingListController;
  [(MadridInternalHawkingListController *)&v3 viewDidDisappear:a3];
}

- (id)specifiers
{
  objc_super v3 = *(void **)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v39 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = +[PSSpecifier groupSpecifierWithID:@"1"];
    [v4 addObject:v5];
    uint64_t v6 = +[PSSpecifier preferenceSpecifierNamed:@"Hawking Filtering" target:self set:"setHawkingEnabled:specifier:" get:"hawkingEnabled:" detail:0 cell:6 edit:0];
    uint64_t v7 = +[PSSpecifier preferenceSpecifierNamed:@"China to China Filtering" target:self set:"setChinaToChinaEnabled:specifier:" get:"getChinaToChinaEnabled:" detail:0 cell:6 edit:0];
    uint64_t v8 = PSFooterTextGroupKey;
    v38 = v5;
    [v5 setProperty:@"Enable/Disable Hawking Filtering. Be sure to enable \"Filter Unknown Senders\" in Messages Settings." forKey:PSFooterTextGroupKey];
    v37 = (void *)v6;
    [v4 addObject:v6];
    v36 = (void *)v7;
    [v4 addObject:v7];
    v9 = +[PSSpecifier groupSpecifierWithID:@"2"];
    uint64_t v33 = v8;
    [v9 setProperty:@"Select personal handles to treat as China phone numbers" forKey:v8];
    v35 = v9;
    [v4 addObject:v9];
    v10 = +[IMAccountController sharedInstance];
    v11 = +[IMServiceImpl iMessageService];
    v12 = [v10 activeAccountsForService:v11];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v12;
    id v13 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v46;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v46 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = [*(id *)(*((void *)&v45 + 1) + 8 * i) loginIMHandle];
          v18 = [v17 ID];

          v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:"setHandleAsChina:specifier:" get:"getHandleIsChina:" detail:0 cell:6 edit:0];
          [v19 setIdentifier:v18];
          [v4 addObject:v19];
        }
        id v14 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v14);
    }

    v20 = +[PSSpecifier groupSpecifierWithID:@"3"];
    [v20 setProperty:@"Add/Delete external handles to treat as China phone numbers" forKey:v33];
    v34 = v20;
    [v4 addObject:v20];
    [(MadridInternalHawkingListController *)self _getExternalChinaHandles];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v21 = long long v44 = 0u;
    id v22 = [v21 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v42;
      uint64_t v25 = PSDeletionActionKey;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v42 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v27 = *(void *)(*((void *)&v41 + 1) + 8 * (void)j);
          v28 = +[PSSpecifier preferenceSpecifierNamed:v27 target:self set:0 get:0 detail:0 cell:4 edit:0];
          [v28 setIdentifier:v27];
          v29 = NSStringFromSelector("removedSpecifier:");
          [v28 setProperty:v29 forKey:v25];

          [v4 addObject:v28];
        }
        id v23 = [v21 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v23);
    }
    v30 = +[PSSpecifier preferenceSpecifierNamed:@"Add New..." target:self set:0 get:0 detail:0 cell:13 edit:0];
    [v30 setButtonAction:"addNewHandle:"];
    [v4 addObject:v30];
    v31 = *(void **)&self->PSEditableListController_opaque[v39];
    *(void *)&self->PSEditableListController_opaque[v39] = v4;

    objc_super v3 = *(void **)&self->PSEditableListController_opaque[v39];
  }

  return v3;
}

- (void)setHawkingEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[IMDefaults sharedInstance];
  id v5 = [v4 BOOLValue];

  [v6 setBool:v5 forDomain:@"com.apple.messages" forKey:@"applyInternationalSpamFilter"];
}

- (id)hawkingEnabled:(id)a3
{
  objc_super v3 = +[IMDefaults sharedInstance];
  id v4 = [v3 getBoolFromDomain:@"com.apple.messages" forKey:@"applyInternationalSpamFilter"];

  return +[NSNumber numberWithBool:v4];
}

- (void)setChinaToChinaEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[IMDefaults sharedInstance];
  id v5 = [v4 BOOLValue];

  [v6 setBool:v5 forDomain:@"com.apple.messages" forKey:@"applyChineseSpamFilter"];
}

- (id)getChinaToChinaEnabled:(id)a3
{
  objc_super v3 = +[IMDefaults sharedInstance];
  id v4 = [v3 getBoolFromDomain:@"com.apple.messages" forKey:@"applyChineseSpamFilter"];

  return +[NSNumber numberWithBool:v4];
}

- (void)setHandleAsChina:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  LODWORD(a3) = [a3 BOOLValue];
  id v7 = [v6 identifier];

  if (a3) {
    [(MadridInternalHawkingListController *)self _setHandleAsChina:v7];
  }
  else {
    [(MadridInternalHawkingListController *)self _removeHandleAsChina:v7];
  }
}

- (id)getHandleIsChina:(id)a3
{
  id v4 = [a3 identifier];
  BOOL v5 = [(MadridInternalHawkingListController *)self _handleIsSetAsChina:v4];

  id v6 = +[NSNumber numberWithBool:v5];

  return v6;
}

- (void)removedSpecifier:(id)a3
{
  id v4 = [a3 identifier];
  [(MadridInternalHawkingListController *)self _removeHandleAsChina:v4];
}

- (void)addNewHandle:(id)a3
{
  id v4 = +[UIAlertController alertControllerWithTitle:@"Enter Handle" message:@"Added handles will be treated as China phone numbers when sending and receiving messages" preferredStyle:1];
  BOOL v5 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:0];
  [v4 addAction:v5];
  [v4 addTextFieldWithConfigurationHandler:&stru_C4C0];
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_7A90;
  v11 = &unk_C4E8;
  id v12 = v4;
  id v13 = self;
  id v6 = v4;
  id v7 = +[UIAlertAction actionWithTitle:@"Done" style:0 handler:&v8];
  objc_msgSend(v6, "addAction:", v7, v8, v9, v10, v11);
  [(MadridInternalHawkingListController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)_setHandleAsChina:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDefaults sharedInstance];
  id v11 = [v4 getValueFromDomain:@"com.apple.messages" forKey:@"mapReceivingIDForSpamFilter"];

  BOOL v5 = +[IMDefaults sharedInstance];
  id v6 = [v5 getValueFromDomain:@"com.apple.messages" forKey:@"mapSendingIDForSpamFilter"];

  id v7 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v11];
  id v8 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v6];
  [v8 setValue:@"+861234567890" forKey:v3];
  [v7 setValue:@"+861234567890" forKey:v3];

  uint64_t v9 = +[IMDefaults sharedInstance];
  [v9 setValue:v8 forDomain:@"com.apple.messages" forKey:@"mapSendingIDForSpamFilter"];

  v10 = +[IMDefaults sharedInstance];
  [v10 setValue:v7 forDomain:@"com.apple.messages" forKey:@"mapReceivingIDForSpamFilter"];
}

- (void)_removeHandleAsChina:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDefaults sharedInstance];
  id v11 = [v4 getValueFromDomain:@"com.apple.messages" forKey:@"mapReceivingIDForSpamFilter"];

  BOOL v5 = +[IMDefaults sharedInstance];
  id v6 = [v5 getValueFromDomain:@"com.apple.messages" forKey:@"mapSendingIDForSpamFilter"];

  id v7 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v11];
  id v8 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v6];
  [v8 removeObjectForKey:v3];
  [v7 removeObjectForKey:v3];

  uint64_t v9 = +[IMDefaults sharedInstance];
  [v9 setValue:v8 forDomain:@"com.apple.messages" forKey:@"mapSendingIDForSpamFilter"];

  v10 = +[IMDefaults sharedInstance];
  [v10 setValue:v7 forDomain:@"com.apple.messages" forKey:@"mapReceivingIDForSpamFilter"];
}

- (BOOL)_handleIsSetAsChina:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDefaults sharedInstance];
  BOOL v5 = [v4 getValueFromDomain:@"com.apple.messages" forKey:@"mapReceivingIDForSpamFilter"];

  id v6 = +[IMDefaults sharedInstance];
  id v7 = [v6 getValueFromDomain:@"com.apple.messages" forKey:@"mapSendingIDForSpamFilter"];

  id v8 = [v7 allKeys];
  if ([v8 containsObject:v3])
  {
    uint64_t v9 = [v5 allKeys];
    unsigned __int8 v10 = [v9 containsObject:v3];
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (id)_getExternalChinaHandles
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[IMDefaults sharedInstance];
  BOOL v5 = [v4 getValueFromDomain:@"com.apple.messages" forKey:@"mapReceivingIDForSpamFilter"];

  id v6 = +[IMDefaults sharedInstance];
  id v7 = [v6 getValueFromDomain:@"com.apple.messages" forKey:@"mapSendingIDForSpamFilter"];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v18 = v5;
  id v8 = [v5 allKeys];
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v14 = [v7 allKeys];
        if ([v14 containsObject:v13])
        {
          unsigned __int8 v15 = [(MadridInternalHawkingListController *)self _handleIsPersonal:v13];

          if ((v15 & 1) == 0) {
            [v3 addObject:v13];
          }
        }
        else
        {
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  id v16 = [objc_alloc((Class)NSArray) initWithArray:v3];

  return v16;
}

- (BOOL)_handleIsPersonal:(id)a3
{
  id v3 = a3;
  id v4 = +[IMAccountController sharedInstance];
  BOOL v5 = +[IMServiceImpl iMessageService];
  id v6 = [v4 activeAccountsForService:v5];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "loginIMHandle", (void)v16);
        id v14 = [v13 ID];
        v10 |= [v14 isEqualToString:v3];
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10 & 1;
}

@end