@interface CalendarSendReceiveController
- (ACAccount)icloudAccount;
- (CalendarSendReceiveController)initWithEmailData:(id)a3 userAccount:(id)a4;
- (NSMutableArray)emailList;
- (NSString)selectedSendFromAddress;
- (id)_getEmail:(id)a3;
- (id)_receiveEmailSpecifiers;
- (id)_sendEmailSpecifiers;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_didSelectEmailForSend:(id)a3;
- (void)_didSelectOptionForReceive:(id)a3 withOption:(id)a4;
- (void)_updateSettingsForEmail:(id)a3;
- (void)setEmailList:(id)a3;
- (void)setIcloudAccount:(id)a3;
- (void)setSelectedSendFromAddress:(id)a3;
- (void)viewDidLoad;
@end

@implementation CalendarSendReceiveController

- (CalendarSendReceiveController)initWithEmailData:(id)a3 userAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CalendarSendReceiveController;
  v8 = [(CalendarSendReceiveController *)&v12 init];
  if (v8)
  {
    v9 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v6];
    emailList = v8->_emailList;
    v8->_emailList = v9;

    objc_storeStrong((id *)&v8->_icloudAccount, a4);
  }

  return v8;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)CalendarSendReceiveController;
  [(CalendarSendReceiveController *)&v6 viewDidLoad];
  v3 = [(CalendarSendReceiveController *)self navigationItem];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"CALENDAR_SEND_RECEIVE_LABEL" value:&stru_10750 table:@"calendarSettings"];
  [v3 setTitle:v5];
}

- (id)specifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = [(CalendarSendReceiveController *)self _sendEmailSpecifiers];
  [v3 addObjectsFromArray:v4];

  v5 = [(CalendarSendReceiveController *)self _receiveEmailSpecifiers];
  [v3 addObjectsFromArray:v5];

  id v6 = [v3 copy];
  uint64_t v7 = OBJC_IVAR___PSListController__specifiers;
  v8 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v6;

  id v9 = *(id *)&self->PSListController_opaque[v7];
  return v9;
}

- (id)_sendEmailSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"CALENDAR_SENDING_ADDRESS_TITLE" value:&stru_10750 table:@"calendarSettings"];
  id v6 = +[PSSpecifier groupSpecifierWithID:@"CALENDAR_SENDING_ADDRESS_TITLE" name:v5];

  uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"CALENDAR_SENDING_ADDRESS_FOOTER" value:&stru_10750 table:@"calendarSettings"];
  [v6 setProperty:v8 forKey:PSFooterTextGroupKey];

  [v3 addObject:v6];
  if ((unint64_t)[(NSMutableArray *)self->_emailList count] < 2)
  {
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"CALENDAR_SEND_FROM_LABEL" value:&stru_10750 table:@"calendarSettings"];
    id v9 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:"_getEmail:" detail:0 cell:4 edit:0];
  }
  else
  {
    id v9 = +[PSSpecifier preferenceSpecifierNamed:&stru_10750 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [v9 setProperty:objc_opt_class() forKey:PSCellClassKey];
  }
  [v9 setIdentifier:@"SEND_FROM_SPECIFIER_ID"];
  [v9 setProperty:&__kCFBooleanTrue forKey:PSPrioritizeValueTextDisplayKey];
  [v3 addObject:v9];

  return v3;
}

- (id)_receiveEmailSpecifiers
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"CALENDAR_RECEIVING_ADDRESS_TITLE" value:&stru_10750 table:@"calendarSettings"];
  v5 = +[PSSpecifier groupSpecifierWithID:@"CALENDAR_RECEIVING_ADDRESS_GROUP_ID" name:v4];

  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"CALENDAR_LEARN_MORE_PERIOD" value:&stru_10750 table:@"calendarSettings"];

  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"CALENDAR_RECEIVING_ADDRESS_FOOTER" value:&stru_10750 table:@"calendarSettings"];
  v10 = +[NSString stringWithFormat:@"%@ %@", v9, v7];

  v11 = (objc_class *)objc_opt_class();
  objc_super v12 = NSStringFromClass(v11);
  [v5 setProperty:v12 forKey:PSFooterCellClassGroupKey];

  [v5 setProperty:v10 forKey:PSFooterHyperlinkViewTitleKey];
  v29 = (void *)v7;
  v37.location = (NSUInteger)[v10 rangeOfString:v7];
  v13 = NSStringFromRange(v37);
  [v5 setProperty:v13 forKey:PSFooterHyperlinkViewLinkRangeKey];

  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"CALENDAR_RECEIVE_ADDRESS_KB_LINK" value:&stru_10750 table:@"calendarSettings"];
  [v5 setProperty:v15 forKey:PSFooterHyperlinkViewURLKey];

  v28 = v10;
  [v5 setProperty:v10 forKey:PSFooterTextGroupKey];
  v16 = v2;
  [v2 addObject:v5];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obj = self->_emailList;
  id v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v32;
    uint64_t v20 = PSCellClassKey;
    uint64_t v21 = PSPrioritizeValueTextDisplayKey;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v24 = +[PSSpecifier preferenceSpecifierNamed:&stru_10750 target:self set:0 get:0 detail:0 cell:-1 edit:0];
        v25 = [v23 address];
        [v24 setIdentifier:v25];

        [v24 setProperty:objc_opt_class() forKey:v20];
        [v24 setProperty:&__kCFBooleanTrue forKey:v21];
        [v16 addObject:v24];
      }
      id v18 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v18);
  }

  return v16;
}

- (id)_getEmail:(id)a3
{
  if ([(NSMutableArray *)self->_emailList count])
  {
    v4 = [(NSMutableArray *)self->_emailList objectAtIndexedSubscript:0];
    v5 = [v4 address];
  }
  else
  {
    v5 = &stru_10750;
  }

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v59.receiver = self;
  v59.super_class = (Class)CalendarSendReceiveController;
  id v38 = a3;
  id v39 = a4;
  -[CalendarSendReceiveController tableView:cellForRowAtIndexPath:](&v59, "tableView:cellForRowAtIndexPath:", v38);
  id v40 = (id)objc_claimAutoreleasedReturnValue();
  v41 = [v40 specifier];
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [v41 identifier];
  unsigned int v7 = [v6 isEqualToString:@"SEND_FROM_SPECIFIER_ID"];

  if (!v7)
  {
    id v15 = objc_alloc_init((Class)NSMutableArray);

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    obj = self->_emailList;
    id v16 = [(NSMutableArray *)obj countByEnumeratingWithState:&v48 objects:v61 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v49;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v49 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          uint64_t v20 = [v19 address];
          uint64_t v21 = [v41 identifier];
          unsigned int v22 = [v20 isEqualToString:v21];

          if (v22)
          {
            objc_initWeak(&location, self);
            v23 = +[NSBundle bundleForClass:objc_opt_class()];
            v24 = [v23 localizedStringForKey:@"CALENDAR_RECEIVE_ADDRESS_NOTIFICATION_OPTION" value:&stru_10750 table:@"calendarSettings"];
            v46[0] = _NSConcreteStackBlock;
            v46[1] = 3221225472;
            v46[2] = sub_8D2C;
            v46[3] = &unk_10598;
            objc_copyWeak(&v47, &location);
            v46[4] = v19;
            v25 = +[UIAction actionWithTitle:v24 image:0 identifier:0 handler:v46];

            v26 = +[NSBundle bundleForClass:objc_opt_class()];
            v27 = [v26 localizedStringForKey:@"CALENDAR_RECEIVE_ADDRESS_EMAIL_OPTION" value:&stru_10750 table:@"calendarSettings"];
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472;
            v44[2] = sub_8D84;
            v44[3] = &unk_10598;
            objc_copyWeak(&v45, &location);
            v44[4] = v19;
            v28 = +[UIAction actionWithTitle:v27 image:0 identifier:0 handler:v44];

            v29 = [v19 receive];
            unsigned __int8 v30 = [v29 isEqualToString:@"PUSH"];

            long long v31 = v25;
            if ((v30 & 1) != 0
              || ([v19 receive],
                  long long v32 = objc_claimAutoreleasedReturnValue(),
                  unsigned int v33 = [v32 isEqualToString:@"EMAIL"],
                  v32,
                  long long v31 = v28,
                  v33))
            {
              [v31 setState:1];
            }
            v60[0] = v25;
            v60[1] = v28;
            long long v34 = +[NSArray arrayWithObjects:v60 count:2];
            [v15 addObjectsFromArray:v34];

            objc_destroyWeak(&v45);
            objc_destroyWeak(&v47);
            objc_destroyWeak(&location);
            goto LABEL_26;
          }
        }
        id v16 = [(NSMutableArray *)obj countByEnumeratingWithState:&v48 objects:v61 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    goto LABEL_26;
  }
  if ((unint64_t)[(NSMutableArray *)self->_emailList count] >= 2)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    obj = self->_emailList;
    id v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v55 objects:v62 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v56;
      do
      {
        for (j = 0; j != v8; j = (char *)j + 1)
        {
          if (*(void *)v56 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v55 + 1) + 8 * (void)j);
          objc_initWeak(&location, self);
          objc_super v12 = [v11 address];
          v13 = [v11 address];
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472;
          v52[2] = sub_8CDC;
          v52[3] = &unk_10598;
          objc_copyWeak(&v53, &location);
          v52[4] = v11;
          v14 = +[UIAction actionWithTitle:v12 image:0 identifier:v13 handler:v52];

          if ([v11 send]) {
            [v14 setState:1];
          }
          [v5 addObject:v14];

          objc_destroyWeak(&v53);
          objc_destroyWeak(&location);
        }
        id v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v55 objects:v62 count:16];
      }
      while (v8);
    }
    id v15 = v5;
LABEL_26:

    id v35 = v40;
    v36 = +[UIMenu menuWithChildren:v15];
    [v35 setPopupMenu:v36];

    goto LABEL_28;
  }
  id v15 = v5;
LABEL_28:

  return v40;
}

- (void)_didSelectEmailForSend:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = self->_emailList;
  id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v11 = [CalInviteEmail alloc];
        objc_super v12 = [v10 toDictionary];
        v13 = [(CalInviteEmail *)v11 initWithDictionary:v12];

        v14 = [(CalInviteEmail *)v13 address];
        id v15 = [v4 address];
        id v16 = [v14 isEqualToString:v15];

        [(CalInviteEmail *)v13 setSend:v16];
        [v5 addObject:v13];
      }
      id v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v7);
  }

  uint64_t v17 = _CalLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v4 address];
    *(_DWORD *)buf = 138412290;
    v25 = v18;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "selected address for send receive is %@", buf, 0xCu);
  }
  [(CalendarSendReceiveController *)self _updateSettingsForEmail:v5];
}

- (void)_didSelectOptionForReceive:(id)a3 withOption:(id)a4
{
  id v6 = a3;
  id v22 = a4;
  id v7 = _CalLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 address];
    *(_DWORD *)buf = 138412546;
    id v30 = v22;
    __int16 v31 = 2112;
    long long v32 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "selected option %@ for receive address %@", buf, 0x16u);
  }
  id v9 = objc_alloc_init((Class)NSMutableArray);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v21 = self;
  obj = self->_emailList;
  id v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v13);
        id v15 = [CalInviteEmail alloc];
        id v16 = [v14 toDictionary];
        uint64_t v17 = [(CalInviteEmail *)v15 initWithDictionary:v16];

        id v18 = [(CalInviteEmail *)v17 address];
        uint64_t v19 = [v6 address];
        unsigned int v20 = [v18 isEqualToString:v19];

        if (v20) {
          [(CalInviteEmail *)v17 setReceive:v22];
        }
        [v9 addObject:v17];

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  [(CalendarSendReceiveController *)v21 _updateSettingsForEmail:v9];
}

- (void)_updateSettingsForEmail:(id)a3
{
  id v4 = a3;
  id v5 = [CalendarUpdateSettingsRequest alloc];
  icloudAccount = self->_icloudAccount;
  id v7 = [(ACAccount *)icloudAccount accountStore];
  uint64_t v8 = [(CalendarUpdateSettingsRequest *)v5 initWithAccount:icloudAccount accountStore:v7 emailList:v4];

  id v9 = [[CalendarSpinner alloc] initWithViewController:self];
  spinner = self->_spinner;
  self->_spinner = v9;

  [(CalendarSpinner *)self->_spinner startSpinner];
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_93C0;
  v12[3] = &unk_105C0;
  objc_copyWeak(&v14, &location);
  v12[4] = self;
  id v11 = v4;
  id v13 = v11;
  [(CalendarUpdateSettingsRequest *)v8 performRequestWithCallback:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (ACAccount)icloudAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 192, 1);
}

- (void)setIcloudAccount:(id)a3
{
}

- (NSMutableArray)emailList
{
  return self->_emailList;
}

- (void)setEmailList:(id)a3
{
}

- (NSString)selectedSendFromAddress
{
  return self->_selectedSendFromAddress;
}

- (void)setSelectedSendFromAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedSendFromAddress, 0);
  objc_storeStrong((id *)&self->_emailList, 0);
  objc_storeStrong((id *)&self->_icloudAccount, 0);

  objc_storeStrong((id *)&self->_spinner, 0);
}

@end