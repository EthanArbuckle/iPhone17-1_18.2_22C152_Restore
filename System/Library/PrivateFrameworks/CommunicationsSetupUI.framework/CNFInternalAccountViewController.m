@interface CNFInternalAccountViewController
- (BOOL)isConnectedToDaemon;
- (CNFInternalAccountViewController)initWithAccount:(id)a3;
- (IMAccount)account;
- (id)accountDisplayName:(id)a3;
- (id)accountIsActive:(id)a3;
- (id)accountLogin:(id)a3;
- (id)accountLoginStatus:(id)a3;
- (id)accountType:(id)a3;
- (id)bundle;
- (id)registrationFailureReason:(id)a3;
- (id)registrationStatus:(id)a3;
- (id)specifierForAlias:(id)a3;
- (id)specifiers;
- (id)statusForAlias:(id)a3;
- (void)_handleAccountNotification:(id)a3;
- (void)_startListeningForNotifications;
- (void)_stopListeningForNotifications;
- (void)setAccount:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CNFInternalAccountViewController

- (CNFInternalAccountViewController)initWithAccount:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNFInternalAccountViewController;
  v5 = [(CNFInternalAccountViewController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    [(CNFInternalAccountViewController *)v5 setAccount:v4];
    v7 = [v4 service];
    uint64_t v8 = FTCServiceTypeForService(v7);

    v9 = [[FTRegConnectionHandler alloc] initWithServiceType:v8 name:@"InternalAccountView"];
    connectionHandler = v6->_connectionHandler;
    v6->_connectionHandler = v9;
  }
  return v6;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(CNFInternalAccountViewController *)self loadSpecifiersFromPlistName:@"ConferenceInternalAccountViewSettings" target:self];
    v6 = [v5 specifierForID:@"ALIAS_GROUP"];
    int v7 = 1;
    if ([(CNFInternalAccountViewController *)self isConnectedToDaemon])
    {
      if (v6)
      {
        uint64_t v8 = [v5 indexOfObject:v6];
        if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v9 = v8 + 1;
          v10 = [(CNFInternalAccountViewController *)self account];
          v11 = [v10 aliases];

          v19[0] = MEMORY[0x263EF8330];
          v19[1] = 3221225472;
          v19[2] = __46__CNFInternalAccountViewController_specifiers__block_invoke;
          v19[3] = &unk_2644F0A10;
          v19[4] = self;
          id v20 = v5;
          uint64_t v21 = v9;
          [v11 enumerateObjectsWithOptions:2 usingBlock:v19];

          int v7 = 0;
        }
      }
    }
    if ([(CNFInternalAccountViewController *)self isConnectedToDaemon])
    {
      objc_super v12 = [(CNFInternalAccountViewController *)self account];
      uint64_t v13 = [v12 registrationStatus];

      if (v13 == -1)
      {
        if (!v7)
        {
LABEL_10:
          v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
          *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

          id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
          goto LABEL_11;
        }
LABEL_9:
        [v5 removeObject:v6];
        goto LABEL_10;
      }
    }
    else
    {
      v16 = [v5 specifierForID:@"DISPLAY_NAME_GROUP"];
      v17 = [v5 specifierForID:@"DISPLAY_NAME"];
      [v5 removeObject:v16];
      [v5 removeObject:v17];
    }
    v18 = [v5 specifierForID:@"REGISTRATION_FAILURE_REASON"];
    [v5 removeObject:v18];

    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_11:
  return v4;
}

uint64_t __46__CNFInternalAccountViewController_specifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) specifierForAlias:a2];
  if (v3) {
    [*(id *)(a1 + 40) insertObject:v3 atIndex:*(void *)(a1 + 48)];
  }
  return MEMORY[0x270F9A758]();
}

- (id)bundle
{
  return +[CNFInternalSettingsUtilities currentInternalSettingsBundle];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFInternalAccountViewController;
  [(CNFInternalAccountViewController *)&v4 viewDidAppear:a3];
  [(CNFInternalAccountViewController *)self _startListeningForNotifications];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFInternalAccountViewController;
  [(CNFInternalAccountViewController *)&v4 viewWillDisappear:a3];
  [(CNFInternalAccountViewController *)self _stopListeningForNotifications];
}

- (id)specifierForAlias:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x263F5FC40];
  id v5 = a3;
  v6 = [v4 preferenceSpecifierNamed:v5 target:self set:0 get:sel_statusForAlias_ detail:0 cell:4 edit:0];
  [v6 setProperty:v5 forKey:@"cnf-internal-alias"];

  return v6;
}

- (BOOL)isConnectedToDaemon
{
  return [(FTRegConnectionHandler *)self->_connectionHandler isConnectedToDaemon];
}

- (id)accountLoginStatus:(id)a3
{
  if ([(CNFInternalAccountViewController *)self isConnectedToDaemon])
  {
    objc_super v4 = [(CNFInternalAccountViewController *)self account];
    id v5 = v4;
    if (v4)
    {
      unint64_t v6 = [v4 loginStatus];
      if (v6 > 4) {
        int v7 = @"Unknown";
      }
      else {
        int v7 = off_2644F0DE0[v6];
      }
      v10 = [v5 loginStatusMessage];
      if (v10)
      {
        v11 = [v5 loginStatusMessage];
        if (([v11 isEqualToIgnoringCase:&stru_26D05D4F8] & 1) == 0)
        {
          int v7 = [v5 loginStatusMessage];
        }
      }
    }
    else
    {
      int v7 = @"Account missing";
    }
    uint64_t v9 = v7;

    uint64_t v8 = v9;
  }
  else
  {
    uint64_t v8 = @"Disconnected";
    uint64_t v9 = @"Unavailable";
  }

  return v8;
}

- (id)registrationStatus:(id)a3
{
  if ([(CNFInternalAccountViewController *)self isConnectedToDaemon])
  {
    objc_super v4 = [(CNFInternalAccountViewController *)self account];
    id v5 = v4;
    if (v4)
    {
      CNFRegNonLocStringForRegistrationStatus([v4 registrationStatus]);
      unint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v6 = @"Account missing";
    }
    uint64_t v8 = v6;

    int v7 = v8;
  }
  else
  {
    int v7 = @"Disconnected";
    uint64_t v8 = @"Unavailable";
  }

  return v7;
}

- (id)accountLogin:(id)a3
{
  if ([(CNFInternalAccountViewController *)self isConnectedToDaemon])
  {
    objc_super v4 = [(CNFInternalAccountViewController *)self account];
    id v5 = [v4 login];
  }
  else
  {
    id v5 = @"Disconnected";
  }
  return v5;
}

- (id)accountType:(id)a3
{
  if ([(CNFInternalAccountViewController *)self isConnectedToDaemon])
  {
    objc_super v4 = [(CNFInternalAccountViewController *)self account];
    unint64_t v5 = [v4 accountType];

    if (v5 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown account type (%ld)", v5);
      unint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v6 = off_2644F0E08[v5];
    }
  }
  else
  {
    unint64_t v6 = @"Disconnected";
  }
  return v6;
}

- (id)statusForAlias:(id)a3
{
  id v4 = a3;
  if ([(CNFInternalAccountViewController *)self isConnectedToDaemon])
  {
    unint64_t v5 = [v4 propertyForKey:@"cnf-internal-alias"];
    unint64_t v6 = [(CNFInternalAccountViewController *)self account];
    CNFRegNonLocStringForAliasValidationStatus([v6 validationStatusForAlias:v5]);
    int v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v7 = @"Disconnected";
  }

  return v7;
}

- (id)accountDisplayName:(id)a3
{
  if ([(CNFInternalAccountViewController *)self isConnectedToDaemon])
  {
    id v4 = [(CNFInternalAccountViewController *)self account];
    unint64_t v5 = [v4 displayName];
  }
  else
  {
    unint64_t v5 = @"Disconnected";
  }
  return v5;
}

- (id)registrationFailureReason:(id)a3
{
  if ([(CNFInternalAccountViewController *)self isConnectedToDaemon])
  {
    id v4 = [(CNFInternalAccountViewController *)self account];
    unint64_t v5 = [v4 registrationFailureReason];

    unint64_t v6 = NSString;
    int v7 = CNFRegNonLocStringForRegistrationFailure(v5);
    uint64_t v8 = [v6 stringWithFormat:@"%ld: %@", v5, v7];
  }
  else
  {
    uint64_t v8 = @"Disconnected";
  }
  return v8;
}

- (id)accountIsActive:(id)a3
{
  if ([(CNFInternalAccountViewController *)self isConnectedToDaemon])
  {
    id v4 = [(CNFInternalAccountViewController *)self account];
    int v5 = [v4 isActive];
    unint64_t v6 = @"NO";
    if (v5) {
      unint64_t v6 = @"YES";
    }
    int v7 = v6;
  }
  else
  {
    int v7 = @"Disconnected";
  }
  return v7;
}

- (void)_startListeningForNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__handleDaemonConnected_ name:*MEMORY[0x263F4A498] object:0];
  [v3 addObserver:self selector:sel__handleDaemonDisconnected_ name:*MEMORY[0x263F4A4A0] object:0];
  [v3 addObserver:self selector:sel__handleAccountNotification_ name:*MEMORY[0x263F4A3C8] object:0];
  [v3 addObserver:self selector:sel__handleAccountNotification_ name:*MEMORY[0x263F4A3D0] object:0];
  [v3 addObserver:self selector:sel__handleAccountNotification_ name:*MEMORY[0x263F4A458] object:0];
  [v3 addObserver:self selector:sel__handleAccountNotification_ name:*MEMORY[0x263F4A3A8] object:0];
  [v3 addObserver:self selector:sel__handleAccountNotification_ name:*MEMORY[0x263F4A358] object:0];
  [v3 addObserver:self selector:sel__handleAccountNotification_ name:*MEMORY[0x263F4A3F8] object:0];
  [v3 addObserver:self selector:sel__handleAccountNotification_ name:*MEMORY[0x263F4A408] object:0];
  [v3 addObserver:self selector:sel__handleAccountNotification_ name:*MEMORY[0x263F4A3B8] object:0];
  [v3 addObserver:self selector:sel__handleAccountNotification_ name:*MEMORY[0x263F4A3C0] object:0];
  [v3 addObserver:self selector:sel__handleAccountNotification_ name:*MEMORY[0x263F4A348] object:0];
  [v3 addObserver:self selector:sel__handleAccountNotification_ name:*MEMORY[0x263F4A3D8] object:0];
}

- (void)_stopListeningForNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F4A498] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F4A4A0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F4A3C8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F4A3D0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F4A458] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F4A3A8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F4A358] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F4A3F8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F4A408] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F4A3B8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F4A3C0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F4A348] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F4A3D8] object:0];
}

- (void)_handleAccountNotification:(id)a3
{
  if ([(CNFInternalAccountViewController *)self isConnectedToDaemon])
  {
    [(CNFInternalAccountViewController *)self reloadSpecifiers];
  }
}

- (IMAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionHandler, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end