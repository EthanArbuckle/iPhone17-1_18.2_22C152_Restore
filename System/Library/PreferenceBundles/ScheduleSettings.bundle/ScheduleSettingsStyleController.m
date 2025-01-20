@interface ScheduleSettingsStyleController
- (BOOL)shouldShowMailboxes;
- (id)notAvailableText;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_accountsChanged;
- (void)_reloadFoldersAndSpecifiers;
- (void)_reloadFoldersAndSpecifiersForced:(BOOL)a3;
- (void)dealloc;
- (void)listItemSelected:(id)a3;
- (void)reloadFolders;
- (void)setPushStateForMailbox:(id)a3 state:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ScheduleSettingsStyleController

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)ScheduleSettingsStyleController;
  [(PSListItemsController *)&v3 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_isExchangeAccount)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_DAFoldersThatExternalClientsCareAboutChanged, @"ASAccountFoldersThatExternalClientsCareAboutExternallyChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)_DAFolderHierarchyChanged, @"ASAccountFolderHierarchyExternallyChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel__accountsChanged name:*MEMORY[0x263EFAE28] object:0];
  v8.receiver = self;
  v8.super_class = (Class)ScheduleSettingsStyleController;
  [(PSListItemsController *)&v8 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  if (self->_isExchangeAccount)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"ASAccountFoldersThatExternalClientsCareAboutExternallyChangedNotification", 0);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v6, self, @"ASAccountFolderHierarchyExternallyChangedNotification", 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)ScheduleSettingsStyleController;
  [(PSListItemsController *)&v7 viewWillDisappear:v3];
}

- (id)specifiers
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v2 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v2)
  {
    uint64_t v31 = (int)*MEMORY[0x263F5FDB8];
    v41.receiver = self;
    v41.super_class = (Class)ScheduleSettingsStyleController;
    v2 = objc_msgSend(-[PSListItemsController specifiers](&v41, sel_specifiers), "mutableCopy");
    v4 = objc_msgSend((id)-[ScheduleSettingsStyleController specifier](self, "specifier"), "userInfo");

    v5 = (ACAccount *)(id)[v4 objectForKey:@"ScheduleSettingsAccountKey"];
    self->_account = v5;
    v6 = [(ACAccountType *)[(ACAccount *)v5 accountType] identifier];
    self->_isExchangeAccount = [(NSString *)v6 isEqualToString:*MEMORY[0x263EFAEB0]];

    self->_mailAccountUniqueId = 0;
    uint64_t v7 = [v4 objectForKey:@"ScheduleSettingsAccountUniqueIdentifierKey"];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    objc_super v8 = (void *)[MEMORY[0x263F553B0] mailAccounts];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v13, "uniqueIdForPersistentConnection"), "isEqualToString:", v7))
          {
            self->_mailAccountUniqueId = (NSString *)(id)[v13 uniqueID];
            self->_supportsUserPushedMailboxes = [v13 supportsUserPushedMailboxes];
            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_12:
    v14 = (void *)[v2 objectAtIndex:0];
    objc_msgSend(v14, "setName:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"SELECT_SCHEDULE", &stru_26DDE6728, @"ScheduleSettings"));
    id v15 = [(ScheduleSettingsStyleController *)self notAvailableText];
    if (v15)
    {
      v16 = v15;
      [v14 setProperty:v15 forKey:*MEMORY[0x263F600F8]];
      if ([v16 _isNaturallyRTL]) {
        uint64_t v17 = 2;
      }
      else {
        uint64_t v17 = 0;
      }
      uint64_t v18 = [NSNumber numberWithInt:v17];
      [v14 setProperty:v18 forKey:*MEMORY[0x263F600B8]];
      uint64_t v19 = [NSNumber numberWithInt:v17];
      [v14 setProperty:v19 forKey:*MEMORY[0x263F5FEF0]];
    }
    v32 = self;
    if ([(ScheduleSettingsStyleController *)self shouldShowMailboxes])
    {
      mailboxInfos = self->_mailboxInfos;
      if (!mailboxInfos)
      {
        [(ScheduleSettingsStyleController *)self reloadFolders];
        mailboxInfos = self->_mailboxInfos;
      }
      if ([(NSArray *)mailboxInfos count])
      {
        objc_msgSend(v2, "addObject:", objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithName:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"PUSHED_MAILBOXES", &stru_26DDE6728, @"ScheduleSettings")));
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v21 = self->_mailboxInfos;
        uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v34;
          uint64_t v25 = *MEMORY[0x263F53670];
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v34 != v24) {
                objc_enumerationMutation(v21);
              }
              v27 = *(void **)(*((void *)&v33 + 1) + 8 * j);
              uint64_t v28 = [v27 objectForKey:v25];
              v29 = (void *)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:v28 target:0 set:0 get:0 detail:0 cell:13 edit:0];
              [v29 setProperty:v27 forKey:@"mailbox"];
              [v2 addObject:v29];
            }
            uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v33 objects:v42 count:16];
          }
          while (v23);
        }
      }
    }

    *(Class *)((char *)&v32->super.super.super.super.super.super.isa + v31) = (Class)v2;
  }
  return v2;
}

- (void)reloadFolders
{
  v8[5] = *MEMORY[0x263EF8340];

  self->_mailboxInfos = 0;
  self->_monitored = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v3 = *MEMORY[0x263F53688];
  v8[0] = *MEMORY[0x263F53670];
  v8[1] = v3;
  uint64_t v4 = *MEMORY[0x263F53680];
  v8[2] = *MEMORY[0x263F53678];
  v8[3] = v4;
  v8[4] = *MEMORY[0x263F53690];
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:5];
  mailAccountUniqueId = self->_mailAccountUniqueId;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__ScheduleSettingsStyleController_reloadFolders__block_invoke;
  v7[3] = &unk_26486FF68;
  v7[4] = self;
  [MEMORY[0x263F53698] mailboxListingForAccountWithUniqueIdentifier:mailAccountUniqueId keys:v5 completionBlock:v7];
}

uint64_t __48__ScheduleSettingsStyleController_reloadFolders__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  *(void *)(*(void *)(a1 + 32) + 1432) = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1432);
  uint64_t result = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v11;
    uint64_t v7 = *MEMORY[0x263F53680];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_msgSend((id)objc_msgSend(v9, "objectForKey:", v7), "BOOLValue")) {
          [*(id *)(*(void *)(a1 + 32) + 1440) addObject:v9];
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t result = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)shouldShowMailboxes
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)-[ScheduleSettingsStyleController specifier](self, "specifier"), "userInfo"), "objectForKey:", @"ScheduleSettingsAccountUniqueIdentifierKey");
  return ![*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE78]) styleForAccount:self->_account uniqueIdentifier:v3]&& self->_supportsUserPushedMailboxes;
}

- (id)notAvailableText
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)-[ScheduleSettingsStyleController specifier](self, "specifier"), "userInfo"), "objectForKey:", @"ScheduleSettingsAccountUniqueIdentifierKey");
  int v4 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE78]) styleForAccount:self->_account uniqueIdentifier:v3];
  if (v4)
  {
    if (v4 != 2) {
      return 0;
    }
    uint64_t v5 = @"WHEN_FETCH_NOT_AVAILABLE";
  }
  else
  {
    uint64_t v5 = @"WHEN_PUSH_NOT_AVAILABLE";
  }
  uint64_t v6 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return (id)[v6 localizedStringForKey:v5 value:&stru_26DDE6728 table:@"ScheduleSettings"];
}

- (void)listItemSelected:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ScheduleSettingsStyleController;
  [(PSListItemsController *)&v4 listItemSelected:a3];
  objc_msgSend((id)-[ScheduleSettingsStyleController table](self, "table"), "noteNumberOfRowsChanged");
  [(ScheduleSettingsStyleController *)self reloadSpecifiers];
}

- (void)setPushStateForMailbox:(id)a3 state:(BOOL)a4
{
  BOOL v4 = a4;
  self->_ignoringNotifications = 1;
  uint64_t v6 = [a3 objectForKey:*MEMORY[0x263F53690]];
  [MEMORY[0x263F53698] setPushStateForMailboxWithPath:v6 account:self->_mailAccountUniqueId pushState:v4 error:0];
  dispatch_time_t v7 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__ScheduleSettingsStyleController_setPushStateForMailbox_state___block_invoke;
  block[3] = &unk_26486FF20;
  block[4] = self;
  dispatch_after(v7, MEMORY[0x263EF83A0], block);
}

uint64_t __64__ScheduleSettingsStyleController_setPushStateForMailbox_state___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1450) = 0;
  return result;
}

- (void)_reloadFoldersAndSpecifiersForced:(BOOL)a3
{
  if (!self->_ignoringNotifications)
  {
    if ([MEMORY[0x263F553B0] accountWithUniqueId:self->_mailAccountUniqueId])
    {
      uint64_t v6 = self->_monitored;
      [(ScheduleSettingsStyleController *)self reloadFolders];
      if (a3 || ([(NSMutableSet *)self->_monitored isEqualToSet:v6] & 1) == 0) {
        [(ScheduleSettingsStyleController *)self reloadSpecifiers];
      }
    }
    else
    {
      uint64_t v5 = (void *)[(ScheduleSettingsStyleController *)self navigationController];
      [v5 popViewControllerAnimated:1];
    }
  }
}

- (void)_reloadFoldersAndSpecifiers
{
}

- (void)_accountsChanged
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__reloadFoldersAndSpecifiers object:0];

  [(ScheduleSettingsStyleController *)self performSelector:sel__reloadFoldersAndSpecifiers withObject:0 afterDelay:0.1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7 = [(ScheduleSettingsStyleController *)self indexForIndexPath:a4];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]), "objectAtIndex:", v7), "propertyForKey:", @"mailbox");
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    long long v10 = (PushedMailboxTableCell *)[a3 dequeueReusableCellWithIdentifier:@"PushedMailboxTableCell"];
    if (!v10) {
      long long v10 = [[PushedMailboxTableCell alloc] initWithStyle:0 reuseIdentifier:@"PushedMailboxTableCell"];
    }
    uint64_t v11 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", *MEMORY[0x263F53688]), "integerValue");
    [(PushedMailboxTableCell *)v10 setType:(int)v11];
    -[PushedMailboxTableCell setLevel:](v10, "setLevel:", objc_msgSend((id)objc_msgSend(v9, "objectForKey:", *MEMORY[0x263F53678]), "intValue"));
    -[PushedMailboxTableCell setMailboxName:](v10, "setMailboxName:", [v9 objectForKey:*MEMORY[0x263F53670]]);
    [(PushedMailboxTableCell *)v10 setEnabled:v11 << 32 != 0x700000000];
    [(PushedMailboxTableCell *)v10 setChecked:[(NSMutableSet *)self->_monitored containsObject:v9]];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ScheduleSettingsStyleController;
    return [(PSListItemsController *)&v13 tableView:a3 cellForRowAtIndexPath:a4];
  }
  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7 = [(ScheduleSettingsStyleController *)self indexForIndexPath:a4];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]), "objectAtIndex:", v7), "propertyForKey:", @"mailbox");
  if (v8)
  {
    uint64_t v9 = v8;
    long long v10 = (void *)[a3 cellForRowAtIndexPath:a4];
    [a3 deselectRowAtIndexPath:a4 animated:1];
    uint64_t v11 = [v10 isChecked] ^ 1;
    [v10 setChecked:v11];
    monitored = self->_monitored;
    if (v11) {
      [(NSMutableSet *)monitored addObject:v9];
    }
    else {
      [(NSMutableSet *)monitored removeObject:v9];
    }
    [(ScheduleSettingsStyleController *)self setPushStateForMailbox:v9 state:v11];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ScheduleSettingsStyleController;
    [(PSListItemsController *)&v13 tableView:a3 didSelectRowAtIndexPath:a4];
  }
}

@end