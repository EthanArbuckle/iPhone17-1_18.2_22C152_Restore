@interface FTRegAccountMonitor
- (BOOL)_shouldHandleAccountNofication:(id)a3;
- (FTRegAccountMonitor)initWithServiceType:(int64_t)a3;
- (IMServiceImpl)service;
- (NSArray)activeAccounts;
- (id)_activeAccounts;
- (id)logName;
- (int64_t)serviceType;
- (void)_handleAccountNotification:(id)a3;
- (void)_handleDaemonConnected:(id)a3;
- (void)_startListeningForNotifications;
- (void)_stopListeningForNotifications;
- (void)_updateAccountState:(BOOL)a3;
- (void)dealloc;
- (void)setService:(id)a3;
- (void)setServiceType:(int64_t)a3;
@end

@implementation FTRegAccountMonitor

- (FTRegAccountMonitor)initWithServiceType:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)FTRegAccountMonitor;
  v4 = [(FTRegAccountMonitor *)&v12 init];
  if (v4)
  {
    v5 = FTCServiceNameForServiceType();
    v6 = [MEMORY[0x263F4A610] serviceWithInternalName:v5];
    if (!v6)
    {

      v10 = 0;
      goto LABEL_11;
    }
    [(FTRegAccountMonitor *)v4 setServiceType:a3];
    [(FTRegAccountMonitor *)v4 setService:v6];
    v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Creating monitor with service: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    v8 = [[FTRegConnectionHandler alloc] initWithServiceType:a3 name:@"AccountMonitor"];
    connectionHandler = v4->_connectionHandler;
    v4->_connectionHandler = v8;

    [(FTRegAccountMonitor *)v4 _startListeningForNotifications];
    [(FTRegAccountMonitor *)v4 _updateAccountState:0];
  }
  v10 = v4;
LABEL_11:

  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FTRegAccountMonitor;
  [(FTRegAccountMonitor *)&v4 dealloc];
}

- (id)logName
{
  v2 = NSString;
  v3 = [(FTRegAccountMonitor *)self service];
  objc_super v4 = [v3 name];
  v5 = [v2 stringWithFormat:@"AccountMonitor[%@]", v4];

  return v5;
}

- (id)_activeAccounts
{
  v3 = [MEMORY[0x263F4A520] sharedInstance];
  objc_super v4 = [(FTRegAccountMonitor *)self service];
  v5 = [v3 activeAccountsForService:v4];
  v6 = (void *)[v5 copy];

  v7 = [v6 indexesOfObjectsPassingTest:&__block_literal_global_14];
  v8 = [v6 objectsAtIndexes:v7];
  v9 = (void *)[v8 copy];

  return v9;
}

uint64_t __38__FTRegAccountMonitor__activeAccounts__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if ([v2 CNFRegSignInComplete]
    && ([v2 accountType] != 1 || objc_msgSend(v2, "profileValidationStatus") == 3))
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v3 = objc_msgSend(v2, "aliases", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          if ([v2 validationStatusForAlias:*(void *)(*((void *)&v8 + 1) + 8 * i)] == 3)
          {
            uint64_t v4 = 1;
            goto LABEL_15;
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_updateAccountState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Updating account state", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  CNFRegLogIndent();
  if ([(FTRegConnectionHandler *)self->_connectionHandler isConnectedToDaemon])
  {
    v6 = [(FTRegAccountMonitor *)self _activeAccounts];
    uint64_t v7 = [v6 count];
    if (v7 == [(NSArray *)self->_accounts count])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v8 = self->_accounts;
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v9)
      {
        int v10 = 0;
        uint64_t v11 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v21 != v11) {
              objc_enumerationMutation(v8);
            }
            v10 |= [v6 containsObject:*(void *)(*((void *)&v20 + 1) + 8 * i)] ^ 1;
          }
          uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
        }
        while (v9);

        if (v10) {
          goto LABEL_16;
        }
      }
      else
      {
      }
      v19 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED18000, v19, OS_LOG_TYPE_DEFAULT, "No change in accounts", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
      goto LABEL_36;
    }
LABEL_16:
    uint64_t v13 = (NSArray *)[v6 copy];
    accounts = self->_accounts;
    self->_accounts = v13;

    uint64_t v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = @"NO";
      if (v3) {
        v16 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v25 = v16;
      _os_log_impl(&dword_21ED18000, v15, OS_LOG_TYPE_DEFAULT, "Accounts changed, posting: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    if (v3)
    {
      v17 = [MEMORY[0x263F08A00] defaultCenter];
      [v17 postNotificationName:@"FTRegActiveAccountsChangedNotification" object:self userInfo:0];
    }
LABEL_36:

    goto LABEL_37;
  }
  v18 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v18, OS_LOG_TYPE_DEFAULT, "Not updating because we aren't connected", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
LABEL_37:
  CNFRegLogOutdent();
}

- (BOOL)_shouldHandleAccountNofication:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = [a3 object];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v5 = [v4 service];
    v6 = [(FTRegAccountMonitor *)self service];
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_startListeningForNotifications
{
  if ((*(unsigned char *)&self->_monitorFlags & 1) == 0)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__handleDaemonConnected_ name:*MEMORY[0x263F4A498] object:0];
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
    *(unsigned char *)&self->_monitorFlags |= 1u;
  }
}

- (void)_stopListeningForNotifications
{
  if (*(unsigned char *)&self->_monitorFlags)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x263F4A498] object:0];
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
    *(unsigned char *)&self->_monitorFlags &= ~1u;
  }
}

- (void)_handleAccountNotification:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(FTRegAccountMonitor *)self _shouldHandleAccountNofication:v4])
  {
    uint64_t v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [v4 name];
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Updating account due to notification: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      BOOL v7 = [v4 name];
      IMLogString();
    }
    CNFRegLogIndent();
    [(FTRegAccountMonitor *)self _updateAccountState:1];
    CNFRegLogOutdent();
  }
}

- (void)_handleDaemonConnected:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Connected to daemon", v6, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  [(FTRegAccountMonitor *)self _updateAccountState:1];
}

- (IMServiceImpl)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (NSArray)activeAccounts
{
  return self->_accounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionHandler, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end