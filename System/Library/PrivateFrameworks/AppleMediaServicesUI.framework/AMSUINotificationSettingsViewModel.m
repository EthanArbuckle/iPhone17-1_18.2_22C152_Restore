@interface AMSUINotificationSettingsViewModel
- (AMSUINotificationSettingsViewModelDelegate)delegate;
- (BOOL)showAllowNotificationsButton;
- (NSArray)sections;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)notificationInAppSettingsTableViewCellDidToggleValue:(id)a3 forItem:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSections:(id)a3;
- (void)setShowAllowNotificationsButton:(BOOL)a3;
@end

@implementation AMSUINotificationSettingsViewModel

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v4 = [(AMSUINotificationSettingsViewModel *)self sections];
  uint64_t v5 = [v4 count];
  int64_t v6 = v5 + [(AMSUINotificationSettingsViewModel *)self showAllowNotificationsButton];

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 || ![(AMSUINotificationSettingsViewModel *)self showAllowNotificationsButton])
  {
    v8 = [(AMSUINotificationSettingsViewModel *)self sections];
    unint64_t v9 = [v8 count];
    unint64_t v10 = a4 - [(AMSUINotificationSettingsViewModel *)self showAllowNotificationsButton];

    if (v9 <= v10)
    {
      int64_t v7 = 0;
    }
    else
    {
      v11 = [(AMSUINotificationSettingsViewModel *)self sections];
      v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", a4 - -[AMSUINotificationSettingsViewModel showAllowNotificationsButton](self, "showAllowNotificationsButton"));
      v13 = [v12 items];
      int64_t v7 = [v13 count];
    }
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section]
    || ![(AMSUINotificationSettingsViewModel *)self showAllowNotificationsButton])
  {
    v8 = [v6 dequeueReusableCellWithIdentifier:@"kAMSUINotificationInAppSettingsCellIdentifier" forIndexPath:v7];
    v13 = [(AMSUINotificationSettingsViewModel *)self sections];
    v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")- -[AMSUINotificationSettingsViewModel showAllowNotificationsButton](self, "showAllowNotificationsButton"));

    v15 = [v14 items];
    v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

    [v8 setDelegate:self];
    [v8 setItem:v16];
  }
  else
  {
    v8 = [v6 dequeueReusableCellWithIdentifier:@"kAMSUINotificationInAppSettingsButtonCellIdentifier" forIndexPath:v7];
    unint64_t v9 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
    if (v10 == 1) {
      v12 = @"NOTIFICATIONS_SETTINGS_ALLOW_NOTIFICATIONS_IPAD";
    }
    else {
      v12 = @"NOTIFICATIONS_SETTINGS_ALLOW_NOTIFICATIONS_IPHONE";
    }
    v18 = AMSUILocalizedStringFromBundle(v12, 0, v11);
    v19 = [v8 textLabel];
    [v19 setText:v18];

    v20 = [MEMORY[0x263F825C8] systemBlueColor];
    v21 = [v8 textLabel];
    [v21 setTextColor:v20];

    v22 = [v8 textLabel];
    [v22 setNumberOfLines:0];

    v14 = [v8 textLabel];
    [v14 setLineBreakMode:0];
  }

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ((a4 || ![(AMSUINotificationSettingsViewModel *)self showAllowNotificationsButton])
    && (unint64_t v7 = a4
           - [(AMSUINotificationSettingsViewModel *)self showAllowNotificationsButton],
        [(AMSUINotificationSettingsViewModel *)self sections],
        v8 = objc_claimAutoreleasedReturnValue(),
        unint64_t v9 = [v8 count],
        v8,
        v7 <= v9))
  {
    v11 = [(AMSUINotificationSettingsViewModel *)self sections];
    v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", a4 - -[AMSUINotificationSettingsViewModel showAllowNotificationsButton](self, "showAllowNotificationsButton"));

    uint64_t v10 = [v12 title];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 || ![(AMSUINotificationSettingsViewModel *)self showAllowNotificationsButton])
  {
    unint64_t v11 = a4 - [(AMSUINotificationSettingsViewModel *)self showAllowNotificationsButton];
    v12 = [(AMSUINotificationSettingsViewModel *)self sections];
    unint64_t v13 = [v12 count];

    if (v11 > v13)
    {
      v14 = 0;
      goto LABEL_11;
    }
    v15 = [(AMSUINotificationSettingsViewModel *)self sections];
    unint64_t v9 = objc_msgSend(v15, "objectAtIndexedSubscript:", a4 - -[AMSUINotificationSettingsViewModel showAllowNotificationsButton](self, "showAllowNotificationsButton"));

    uint64_t v16 = [v9 footer];
  }
  else
  {
    unint64_t v7 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    unint64_t v9 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
    if (v8 == 1) {
      uint64_t v10 = @"NOTIFICATIONS_SETTINGS_ALLOW_NOTIFICATIONS_FOOTER_APPSTORE_IPAD";
    }
    else {
      uint64_t v10 = @"NOTIFICATIONS_SETTINGS_ALLOW_NOTIFICATIONS_FOOTER_APPSTORE_IPHONE";
    }
    uint64_t v16 = AMSUILocalizedStringFromBundle(v10, 0, v9);
  }
  v14 = (void *)v16;

LABEL_11:
  return v14;
}

- (void)notificationInAppSettingsTableViewCellDidToggleValue:(id)a3 forItem:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  unint64_t v7 = [(AMSUINotificationSettingsViewModel *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    unint64_t v9 = [(AMSUINotificationSettingsViewModel *)self delegate];
    [v9 viewModel:self didReceiveValueChange:v10 forItem:v6];
  }
}

- (AMSUINotificationSettingsViewModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUINotificationSettingsViewModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (BOOL)showAllowNotificationsButton
{
  return self->_showAllowNotificationsButton;
}

- (void)setShowAllowNotificationsButton:(BOOL)a3
{
  self->_showAllowNotificationsButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end