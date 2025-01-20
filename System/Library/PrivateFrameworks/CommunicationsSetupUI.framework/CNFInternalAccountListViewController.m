@interface CNFInternalAccountListViewController
- (CNFInternalAccountListViewController)initWithServiceType:(int64_t)a3;
- (IMServiceImpl)service;
- (id)accountNameForSpecifier:(id)a3;
- (id)specifiers;
- (void)_handleAccountNotification:(id)a3;
- (void)_startListeningForNotifications;
- (void)_stopListeningForNotifications;
- (void)accountTappedWithSpecifier:(id)a3;
- (void)setService:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CNFInternalAccountListViewController

- (CNFInternalAccountListViewController)initWithServiceType:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CNFInternalAccountListViewController;
  v4 = [(CNFInternalAccountListViewController *)&v12 init];
  if (v4)
  {
    v5 = FTCServiceNameForServiceType();
    uint64_t v6 = [MEMORY[0x263F4A610] serviceWithInternalName:v5];
    if (!v6)
    {

      v10 = 0;
      goto LABEL_6;
    }
    v7 = (void *)v6;
    [(CNFInternalAccountListViewController *)v4 setService:v6];
    v8 = [[FTRegConnectionHandler alloc] initWithServiceType:a3 name:@"InternalAccountList"];
    connectionHandler = v4->_connectionHandler;
    v4->_connectionHandler = v8;
  }
  v10 = v4;
LABEL_6:

  return v10;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFInternalAccountListViewController;
  [(CNFInternalAccountListViewController *)&v4 viewDidAppear:a3];
  [(CNFInternalAccountListViewController *)self _startListeningForNotifications];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFInternalAccountListViewController;
  [(CNFInternalAccountListViewController *)&v4 viewWillDisappear:a3];
  [(CNFInternalAccountListViewController *)self _stopListeningForNotifications];
}

- (id)specifiers
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    unint64_t v6 = 0x263F5F000uLL;
    v7 = [MEMORY[0x263F5FC40] groupSpecifierWithName:@"Accounts"];
    [v5 addObject:v7];
    if ([(FTRegConnectionHandler *)self->_connectionHandler isConnectedToDaemon])
    {
      v25 = v7;
      uint64_t v26 = v3;
      v28 = v5;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v8 = [MEMORY[0x263F4A520] sharedInstance];
      v9 = [(CNFInternalAccountListViewController *)self service];
      v10 = [v8 accountsForService:v9];

      id obj = v10;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v30;
        uint64_t v14 = *MEMORY[0x263F600A8];
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v30 != v13) {
              objc_enumerationMutation(obj);
            }
            v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            v17 = [v16 login];
            v18 = v17;
            if (!v17 || ![(__CFString *)v17 length])
            {

              v18 = @"Unnamed";
            }
            unint64_t v19 = v6;
            v20 = [*(id *)(v6 + 3136) preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:0 cell:2 edit:0];
            v21 = v20;
            if (v20)
            {
              [v20 setProperty:v16 forKey:@"cnf-internal-account"];
              [v21 setButtonAction:sel_accountTappedWithSpecifier_];
              [v21 setProperty:MEMORY[0x263EFFA88] forKey:v14];
              [v28 addObject:v21];
            }

            unint64_t v6 = v19;
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v12);
      }

      v7 = v25;
      uint64_t v3 = v26;
      id v5 = v28;
    }
    else
    {
      v22 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Disconnected" target:self set:0 get:0 detail:0 cell:2 edit:0];
      [v5 addObject:v22];
    }
    v23 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)accountNameForSpecifier:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"cnf-internal-account"];
  objc_super v4 = [v3 login];
  id v5 = v4;
  if (!v4 || ![(__CFString *)v4 length])
  {

    id v5 = @"Unnamed";
  }

  return v5;
}

- (void)accountTappedWithSpecifier:(id)a3
{
  id v7 = a3;
  objc_super v4 = [v7 propertyForKey:@"cnf-internal-account"];
  if (v4)
  {
    id v5 = [[CNFInternalAccountViewController alloc] initWithAccount:v4];
    [(CNFInternalAccountViewController *)v5 setSpecifier:v7];
    unint64_t v6 = [(CNFInternalAccountListViewController *)self rootController];
    [(CNFInternalAccountViewController *)v5 setRootController:v6];

    [(CNFInternalAccountListViewController *)self showController:v5 animate:1];
  }
}

- (void)_startListeningForNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__handleDaemonConnected_ name:*MEMORY[0x263F4A498] object:0];
  [v3 addObserver:self selector:sel__handleDaemonDisconnected_ name:*MEMORY[0x263F4A4A0] object:0];
  [v3 addObserver:self selector:sel__handleAccountNotification_ name:*MEMORY[0x263F4A3C8] object:0];
  [v3 addObserver:self selector:sel__handleAccountNotification_ name:*MEMORY[0x263F4A3D0] object:0];
}

- (void)_stopListeningForNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F4A498] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F4A4A0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F4A3C8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F4A3D0] object:0];
}

- (void)_handleAccountNotification:(id)a3
{
  if ([(FTRegConnectionHandler *)self->_connectionHandler isConnectedToDaemon])
  {
    [(CNFInternalAccountListViewController *)self reloadSpecifiers];
  }
}

- (IMServiceImpl)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionHandler, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end