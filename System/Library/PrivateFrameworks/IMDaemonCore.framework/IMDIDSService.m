@interface IMDIDSService
- (BOOL)canManageRegistration;
- (BOOL)isRegistrationUnmanaged;
- (BOOL)isSubService;
- (Class)accountClass;
- (IMDIDSService)initWithBundle:(id)a3;
- (IMDIDSService)initWithBundle:(id)a3 isMainService:(BOOL)a4;
- (IMDIDSService)initWithBundle:(id)a3 subServiceName:(id)a4;
- (IMDIDSService)mainService;
- (IMDIDSService)subService;
- (NSArray)accountsLoadedFromIdentityServices;
- (NSArray)activeAccountsFromIdentityServices;
- (NSString)subServiceName;
- (id)_serviceDomain;
- (id)accountFromIDSAccountWithUniqueID:(id)a3;
- (id)imdAccountLoginFromIDSAccountWithType:(int)a3 login:(id)a4;
- (id)mockAccountController;
- (id)newAccountWithAccountDefaults:(id)a3 accountID:(id)a4;
- (void)_loadIDSAccountController;
- (void)account:(id)a3 aliasesChanged:(id)a4;
- (void)account:(id)a3 displayNameChanged:(id)a4;
- (void)account:(id)a3 loginChanged:(id)a4;
- (void)account:(id)a3 profileChanged:(id)a4;
- (void)account:(id)a3 registrationStatusInfoChanged:(id)a4;
- (void)account:(id)a3 vettedAliasesChanged:(id)a4;
- (void)accountAdded:(id)a3;
- (void)accountController:(id)a3 accountAdded:(id)a4;
- (void)accountController:(id)a3 accountDisabled:(id)a4;
- (void)accountController:(id)a3 accountEnabled:(id)a4;
- (void)accountController:(id)a3 accountRemoved:(id)a4;
- (void)accountController:(id)a3 accountUpdated:(id)a4;
- (void)accountRemoved:(id)a3;
- (void)dealloc;
- (void)disableAccount:(id)a3;
- (void)enableAccount:(id)a3;
- (void)refreshRegistrationForAccount:(id)a3;
- (void)registrationFailedForAccount:(id)a3 needsDeletion:(id)a4;
- (void)setMainService:(id)a3;
- (void)setMockAccountController:(id)a3;
- (void)setSubService:(id)a3;
- (void)setSubServiceName:(id)a3;
@end

@implementation IMDIDSService

- (void)_loadIDSAccountController
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_accountController)
  {
    v3 = (IDSAccountController *)[objc_alloc(MEMORY[0x1E4F6AAC8]) initWithService:sub_1D98750F0(self)];
    self->_accountController = v3;
    [(IDSAccountController *)v3 addDelegate:self queue:MEMORY[0x1E4F14428]];
    if ([(IMDIDSService *)self canManageRegistration])
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      v4 = (void *)[(IDSAccountController *)self->_accountController accounts];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v5)
      {
        uint64_t v7 = v5;
        uint64_t v8 = *(void *)v15;
        *(void *)&long long v6 = 138412290;
        long long v13 = v6;
        uint64_t v9 = MEMORY[0x1E4F14428];
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v4);
            }
            v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
            v12 = objc_msgSend(MEMORY[0x1E4F6C3B8], "registration", v13);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v13;
              v19 = v11;
              _os_log_debug_impl(&dword_1D967A000, v12, OS_LOG_TYPE_DEBUG, "Adding registration delegate for account %@", buf, 0xCu);
            }
            [v11 addRegistrationDelegate:self queue:v9];
            ++v10;
          }
          while (v7 != v10);
          uint64_t v7 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
        }
        while (v7);
      }
    }
  }
  [[(IMDIDSService *)self subService] _loadIDSAccountController];
}

- (IMDIDSService)initWithBundle:(id)a3
{
  return [(IMDIDSService *)self initWithBundle:a3 isMainService:1];
}

- (IMDIDSService)initWithBundle:(id)a3 subServiceName:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)IMDIDSService;
  long long v6 = -[IMDService initWithBundle:](&v9, sel_initWithBundle_);
  if (v6)
  {
    if ([a4 length])
    {
      uint64_t v7 = [[IMDIDSService alloc] initWithBundle:a3 isMainService:0];
      v6->_subService = v7;
      [(IMDIDSService *)v7 setMainService:v6];
      [(IMDIDSService *)v6->_subService setSubServiceName:a4];
    }
    [(IMDIDSService *)v6 _loadIDSAccountController];
  }
  return v6;
}

- (IMDIDSService)initWithBundle:(id)a3 isMainService:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)IMDIDSService;
  uint64_t v5 = [(IMDService *)&v9 initWithBundle:a3];
  long long v6 = v5;
  if (v5) {
    BOOL v7 = !v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    [(IMDIDSService *)v5 _loadIDSAccountController];
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = (void *)[(IDSAccountController *)self->_accountController accounts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeRegistrationDelegate:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [(IDSAccountController *)self->_accountController removeDelegate:self];

  objc_storeWeak((id *)&self->_mainService, 0);
  v8.receiver = self;
  v8.super_class = (Class)IMDIDSService;
  [(IMDService *)&v8 dealloc];
}

- (Class)accountClass
{
  return (Class)objc_opt_class();
}

- (id)accountFromIDSAccountWithUniqueID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(IMDIDSService *)self _loadIDSAccountController];
  uint64_t v5 = objc_msgSend(+[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController"), "accountsForService:", self);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(v5);
    }
    long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "idsAccount"), "uniqueID"), "isEqualToIgnoringCase:", a3) & 1) != 0)
    {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)_serviceDomain
{
  return (id)[NSString stringWithFormat:@"%@.%@", *MEMORY[0x1E4F6C710], @"ids"];
}

- (IMDIDSService)mainService
{
  p_mainService = &self->_mainService;
  if (objc_loadWeak((id *)&self->_mainService))
  {
    return (IMDIDSService *)objc_loadWeak((id *)p_mainService);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)IMDIDSService;
    return (IMDIDSService *)[(IMDService *)&v5 mainService];
  }
}

- (BOOL)isSubService
{
  return [(IMDIDSService *)self subServiceName] != 0;
}

- (BOOL)isRegistrationUnmanaged
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C360], "sharedInstance"), "isInternalInstall")
    && (IMGetDomainBoolForKey() & 1) != 0)
  {
    return 0;
  }
  uint64_t v4 = [(IMDService *)self serviceProperties];
  id v5 = [(NSDictionary *)v4 objectForKeyedSubscript:*MEMORY[0x1E4F6E250]];

  return [v5 BOOLValue];
}

- (BOOL)canManageRegistration
{
  if ([(IMDIDSService *)self isSubService]) {
    return 0;
  }
  else {
    return ![(IMDIDSService *)self isRegistrationUnmanaged];
  }
}

- (id)imdAccountLoginFromIDSAccountWithType:(int)a3 login:(id)a4
{
  id v5 = (void *)MEMORY[0x1E0169B80](a4, a2);
  uint64_t v6 = v5;
  if (a3)
  {
    if (a3 <= 2)
    {
      if ([v5 length]) {
        return (id)[NSString stringWithFormat:@"E:%@", v6];
      }
      return @"E:";
    }
  }
  else
  {
    if ([v5 length]) {
      return (id)[NSString stringWithFormat:@"P:%@", IMFormatPhoneNumber()];
    }
    return @"P:";
  }
  return v6;
}

- (NSArray)accountsLoadedFromIdentityServices
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(IMDIDSService *)self _loadIDSAccountController];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = (id)[(IDSAccountController *)self->_accountController accounts];
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    uint64_t v7 = *MEMORY[0x1E4F6B758];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = -[IMDIDSService imdAccountLoginFromIDSAccountWithType:login:](self, "imdAccountLoginFromIDSAccountWithType:login:", [v9 accountType], objc_msgSend(v9, "loginID"));
        long long v11 = objc_msgSend((id)objc_msgSend(v9, "accountInfo"), "mutableCopy");
        [v11 setObject:v10 forKey:v7];
        long long v12 = -[IMDIDSAccount initWithAccountID:defaults:service:idsAccount:]([IMDIDSAccount alloc], "initWithAccountID:defaults:service:idsAccount:", [v9 uniqueID], v11, self, v9);
        [v3 addObject:v12];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  long long v13 = [[(IMDIDSService *)self subService] accountsLoadedFromIdentityServices];
  if ([(NSArray *)v13 count]) {
    [v3 addObjectsFromArray:v13];
  }
  return (NSArray *)v3;
}

- (NSArray)activeAccountsFromIdentityServices
{
  id v3 = (NSArray *)objc_msgSend((id)-[IDSAccountController enabledAccounts](self->_accountController, "enabledAccounts"), "allObjects");
  uint64_t v4 = [[(IMDIDSService *)self subService] activeAccountsFromIdentityServices];
  if (![(NSArray *)v4 count]) {
    return v3;
  }

  return [(NSArray *)v3 arrayByAddingObjectsFromArray:v4];
}

- (void)accountAdded:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((IMDIDSService *)[a3 service] != self || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_11:
    v7.receiver = self;
    v7.super_class = (Class)IMDIDSService;
    [(IMDService *)&v7 accountAdded:a3];
    return;
  }
  uint64_t v5 = (void *)[a3 idsAccount];
  if ([(IMDIDSService *)self canManageRegistration]) {
    [v5 addRegistrationDelegate:self queue:MEMORY[0x1E4F14428]];
  }
  if ([v5 accountType] != 2)
  {
    if ([(IMDIDSService *)self canManageRegistration]
      && !-[IDSAccountController accountWithUniqueID:](self->_accountController, "accountWithUniqueID:", [v5 uniqueID]))
    {
      uint64_t v6 = [MEMORY[0x1E4F6C3B8] registration];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v9 = a3;
        __int16 v10 = 2112;
        long long v11 = v5;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "IMDAccount added %@, adding corresponding IDSAccount %@", buf, 0x16u);
      }
      [(IDSAccountController *)self->_accountController addAccount:v5];
    }
    goto LABEL_11;
  }
}

- (void)accountRemoved:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((IMDIDSService *)[a3 service] == self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = (void *)[a3 idsAccount];
      [v5 removeRegistrationDelegate:self];
      if ([v5 accountType] == 2) {
        return;
      }
      if ([(IMDIDSService *)self canManageRegistration])
      {
        uint64_t v6 = [MEMORY[0x1E4F6C3B8] registration];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v9 = a3;
          __int16 v10 = 2112;
          long long v11 = v5;
          _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "IMDAccount removed %@, removing corresponding IDSAccount %@", buf, 0x16u);
        }
        -[IDSAccountController _removeAccount:](self->_accountController, "_removeAccount:", [v5 uniqueID]);
      }
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)IMDIDSService;
  [(IMDService *)&v7 accountRemoved:a3];
}

- (id)newAccountWithAccountDefaults:(id)a3 accountID:(id)a4
{
  objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4F6AAC0]) initWithDictionary:a3 uniqueID:a4 serviceName:sub_1D98750F0(self)];
  uint64_t v8 = [[IMDIDSAccount alloc] initWithAccountID:a4 defaults:a3 service:self idsAccount:v7];

  return v8;
}

- (void)enableAccount:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_activatingAccount && (IMDIDSService *)[a3 service] == self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [a3 idsAccount];
      if ([(IMDIDSService *)self canManageRegistration])
      {
        uint64_t v6 = [MEMORY[0x1E4F6C3B8] registration];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 138412290;
          uint64_t v8 = v5;
          _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "Enabling IDSAccount %@", (uint8_t *)&v7, 0xCu);
        }
        [(IDSAccountController *)self->_accountController enableAccount:v5];
      }
    }
  }
}

- (void)disableAccount:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_deactivatingAccount && (IMDIDSService *)[a3 service] == self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = (void *)[a3 idsAccount];
      if ([v5 accountType] != 2)
      {
        if ([(IMDIDSService *)self canManageRegistration])
        {
          uint64_t v6 = [MEMORY[0x1E4F6C3B8] registration];
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            int v7 = 138412290;
            uint64_t v8 = [v5 uniqueID];
            _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "Disabling IDSAccount %@", (uint8_t *)&v7, 0xCu);
          }
          [(IDSAccountController *)self->_accountController disableAccount:v5];
        }
      }
    }
  }
}

- (void)accountController:(id)a3 accountAdded:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F6C3B8], "registration", a3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = [a4 uniqueID];
    _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "Received account added %@", (uint8_t *)&v8, 0xCu);
  }
  if ([(IMDIDSService *)self canManageRegistration]) {
    [a4 addRegistrationDelegate:self queue:MEMORY[0x1E4F14428]];
  }
  int v7 = -[IMDIDSAccount initWithAccountID:defaults:service:idsAccount:]([IMDIDSAccount alloc], "initWithAccountID:defaults:service:idsAccount:", [a4 uniqueID], objc_msgSend(a4, "accountInfo"), self, a4);
  if (v7) {
    objc_msgSend(+[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController"), "addAccount:", v7);
  }
}

- (void)accountController:(id)a3 accountUpdated:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F6C3B8], "registration", a3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = [a4 uniqueID];
    _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "Received account updates %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = -[IMDIDSService accountFromIDSAccountWithUniqueID:](self, "accountFromIDSAccountWithUniqueID:", [a4 uniqueID]);
  if ([(IMDIDSService *)self canManageRegistration]) {
    objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForListenersSupportingService:](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForListenersSupportingService:", objc_msgSend(v7, "service")), "account:defaultsChanged:", objc_msgSend(v7, "accountID"), objc_msgSend(v7, "accountDefaults"));
  }
  objc_msgSend((id)objc_msgSend(v7, "session"), "accountDefaultsChanged:", 0);
}

- (void)accountController:(id)a3 accountRemoved:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F6C3B8], "registration", a3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    uint64_t v16 = [a4 uniqueID];
    _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "Received accountRemoved %@", (uint8_t *)&v15, 0xCu);
  }
  if ([(IMDIDSService *)self canManageRegistration]) {
    [a4 removeRegistrationDelegate:self];
  }
  uint64_t v7 = objc_msgSend(+[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController"), "accountForIDSAccountUniqueID:", objc_msgSend(a4, "uniqueID"));
  if (v7)
  {
    objc_msgSend(+[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController"), "removeAccount:", v7);
  }
  else
  {
    int v8 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1D9905C6C((uint64_t)a4, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)accountController:(id)a3 accountEnabled:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F6C3B8], "registration", a3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    uint64_t v16 = [a4 uniqueID];
    _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "Received accountEnabled %@", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v7 = objc_msgSend(+[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController"), "accountForIDSAccountUniqueID:", objc_msgSend(a4, "uniqueID"));
  if (v7)
  {
    self->_activatingAccount = 1;
    objc_msgSend(+[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController"), "activateAccount:", objc_msgSend(v7, "accountID"));
    self->_activatingAccount = 0;
  }
  else
  {
    int v8 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1D9905CD8((uint64_t)a4, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)accountController:(id)a3 accountDisabled:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F6C3B8], "registration", a3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    uint64_t v16 = [a4 uniqueID];
    _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "Received accountDisabled %@", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v7 = objc_msgSend(+[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController"), "accountForIDSAccountUniqueID:", objc_msgSend(a4, "uniqueID"));
  if (v7)
  {
    self->_deactivatingAccount = 1;
    objc_msgSend(+[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController"), "deactivateAccount:", objc_msgSend(v7, "accountID"));
    self->_deactivatingAccount = 0;
  }
  else
  {
    int v8 = [MEMORY[0x1E4F6C3B8] registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1D9905D44((uint64_t)a4, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)account:(id)a3 registrationStatusInfoChanged:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = -[IMDIDSService accountFromIDSAccountWithUniqueID:](self, "accountFromIDSAccountWithUniqueID:", a3, a4);
  uint64_t v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = [v4 accountID];
    _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEFAULT, "IMDIDSService received registration status changed: %@ (%@)", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForListenersSupportingService:](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForListenersSupportingService:", objc_msgSend(v4, "service")), "account:defaultsChanged:", objc_msgSend(v4, "accountID"), objc_msgSend(v4, "accountDefaults"));
}

- (void)account:(id)a3 aliasesChanged:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = [(IMDIDSService *)self accountFromIDSAccountWithUniqueID:a3];
  int v6 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412802;
    id v8 = a4;
    __int16 v9 = 2112;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = [v5 accountID];
    _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "IMDIDSService received aliases changed to %@: %@ (%@)", (uint8_t *)&v7, 0x20u);
  }
  objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForListenersSupportingService:](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForListenersSupportingService:", objc_msgSend(v5, "service")), "account:defaultsChanged:", objc_msgSend(v5, "accountID"), objc_msgSend(v5, "accountDefaults"));
}

- (void)account:(id)a3 vettedAliasesChanged:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = -[IMDIDSService accountFromIDSAccountWithUniqueID:](self, "accountFromIDSAccountWithUniqueID:", a3, a4);
  id v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = [v4 accountID];
    _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEFAULT, "IMDIDSService received vetted aliases changed: %@ (%@)", (uint8_t *)&v6, 0x16u);
  }
  -[IMDNicknameController aliasesDidChange:](+[IMDNicknameController sharedInstance](IMDNicknameController, "sharedInstance"), "aliasesDidChange:", [v4 multiplePhoneNumbersTiedToAccount]);
  objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForListenersSupportingService:](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForListenersSupportingService:", objc_msgSend(v4, "service")), "account:defaultsChanged:", objc_msgSend(v4, "accountID"), objc_msgSend(v4, "accountDefaults"));
}

- (void)account:(id)a3 profileChanged:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = [(IMDIDSService *)self accountFromIDSAccountWithUniqueID:a3];
  int v6 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412802;
    id v8 = a4;
    __int16 v9 = 2112;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = [v5 accountID];
    _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "IMDIDSService received profile changed to %@: %@ (%@)", (uint8_t *)&v7, 0x20u);
  }
  objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForListenersSupportingService:](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForListenersSupportingService:", objc_msgSend(v5, "service")), "account:defaultsChanged:", objc_msgSend(v5, "accountID"), objc_msgSend(v5, "accountDefaults"));
}

- (void)account:(id)a3 loginChanged:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = [(IMDIDSService *)self accountFromIDSAccountWithUniqueID:a3];
  int v6 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412802;
    id v8 = a4;
    __int16 v9 = 2112;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = [v5 accountID];
    _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "IMDIDSService received login changed to %@: %@ (%@)", (uint8_t *)&v7, 0x20u);
  }
  objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForListenersSupportingService:](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForListenersSupportingService:", objc_msgSend(v5, "service")), "account:defaultsChanged:", objc_msgSend(v5, "accountID"), objc_msgSend(v5, "accountDefaults"));
}

- (void)account:(id)a3 displayNameChanged:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = [(IMDIDSService *)self accountFromIDSAccountWithUniqueID:a3];
  int v6 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412802;
    id v8 = a4;
    __int16 v9 = 2112;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = [v5 accountID];
    _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, "IMDIDSService received display name changed to %@: %@ (%@)", (uint8_t *)&v7, 0x20u);
  }
  objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForListenersSupportingService:](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForListenersSupportingService:", objc_msgSend(v5, "service")), "account:defaultsChanged:", objc_msgSend(v5, "accountID"), objc_msgSend(v5, "accountDefaults"));
}

- (void)registrationFailedForAccount:(id)a3 needsDeletion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = [(IMDIDSService *)self accountFromIDSAccountWithUniqueID:a3];
  int v6 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = [v5 accountID];
    _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEFAULT, " => Registration failed, deactivating...: %@ (%@)", buf, 0x16u);
  }
  objc_msgSend(+[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController"), "deactivateAccount:", objc_msgSend(v5, "accountID"));
  if ([a4 BOOLValue])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D9876DD0;
    block[3] = &unk_1E6B73178;
    block[4] = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)refreshRegistrationForAccount:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = [(IMDIDSService *)self accountFromIDSAccountWithUniqueID:a3];
  id v4 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412546;
    id v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = [v3 accountID];
    _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_DEFAULT, "IMDIDSService received refresh registration: %@ (%@)", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend((id)objc_msgSend(v3, "session"), "refreshRegistration");
}

- (void)setMockAccountController:(id)a3
{
  self->_accountController = (IDSAccountController *)a3;
}

- (id)mockAccountController
{
  return self->_accountController;
}

- (IMDIDSService)subService
{
  return self->_subService;
}

- (void)setSubService:(id)a3
{
}

- (NSString)subServiceName
{
  return self->_subServiceName;
}

- (void)setSubServiceName:(id)a3
{
}

- (void)setMainService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end