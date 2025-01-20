@interface ACUIAccountViewProvidersManager
+ (ACUIAccountViewProvidersManager)sharedInstance;
- (ACUIAccountViewProvidersManager)init;
- (BOOL)setDelegate:(id)a3 forSignInController:(id)a4 forAccountWithType:(id)a5;
- (Class)controllerClassForCreatingAccountWithType:(id)a3;
- (Class)controllerClassForCreatingRemoteAccountWithType:(id)a3;
- (Class)viewControllerClassForCreatingAccountWithType:(id)a3;
- (Class)viewControllerClassForViewingAccount:(id)a3;
- (id)_accountViewProviderPluginForAccountTypeID:(id)a3;
- (id)_cachedPluginForName:(id)a3;
- (id)_loadAccountViewProviderPluginWithName:(id)a3;
- (id)_remoteAccountViewProviderPluginForAccountTypeID:(id)a3;
- (id)configurationInfoForCreatingAccountWithType:(id)a3;
- (id)configurationInfoForViewingAccount:(id)a3;
- (id)localizedStringForDataclass:(id)a3 withSuffix:(id)a4 forAccount:(id)a5;
@end

@implementation ACUIAccountViewProvidersManager

+ (ACUIAccountViewProvidersManager)sharedInstance
{
  if (!__ACUISharedAccountViewProviderManager)
  {
    v2 = objc_alloc_init(ACUIAccountViewProvidersManager);
    v3 = (void *)__ACUISharedAccountViewProviderManager;
    __ACUISharedAccountViewProviderManager = (uint64_t)v2;
  }
  v4 = (void *)__ACUISharedAccountViewProviderManager;
  return (ACUIAccountViewProvidersManager *)v4;
}

- (ACUIAccountViewProvidersManager)init
{
  v17[15] = *MEMORY[0x1E4F143B8];
  SEL v12 = a2;
  id v13 = 0;
  v11.receiver = self;
  v11.super_class = (Class)ACUIAccountViewProvidersManager;
  id v13 = [(ACUIAccountViewProvidersManager *)&v11 init];
  objc_storeStrong(&v13, v13);
  if (v13)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3 = (void *)*((void *)v13 + 3);
    *((void *)v13 + 3) = v2;

    v16[0] = *MEMORY[0x1E4F17750];
    v17[0] = @"AppleAccountSettings.bundle";
    v16[1] = *MEMORY[0x1E4F17798];
    v17[1] = @"ActiveSyncSettings.bundle";
    v10 = (uint64_t *)MEMORY[0x1E4F177D0];
    v16[2] = *MEMORY[0x1E4F177D0];
    v17[2] = @"ActiveSyncSettings.bundle";
    v16[3] = *MEMORY[0x1E4F177C0];
    v17[3] = @"MailAccountSettings.bundle";
    v16[4] = *MEMORY[0x1E4F17878];
    v17[4] = @"MailAccountSettings.bundle";
    v16[5] = *MEMORY[0x1E4F177F0];
    v17[5] = @"MailAccountSettings.bundle";
    v16[6] = *MEMORY[0x1E4F177F8];
    v17[6] = @"MailAccountSettings.bundle";
    v16[7] = *MEMORY[0x1E4F177E8];
    v17[7] = @"MailAccountSettings.bundle";
    v16[8] = *MEMORY[0x1E4F17830];
    v17[8] = @"MailAccountSettings.bundle";
    v16[9] = *MEMORY[0x1E4F17818];
    v17[9] = @"LDAPSettings.bundle";
    v16[10] = *MEMORY[0x1E4F17770];
    v17[10] = @"DAVSettings.bundle";
    v16[11] = *MEMORY[0x1E4F17778];
    v17[11] = @"DAVSettings.bundle";
    v16[12] = *MEMORY[0x1E4F17858];
    v17[12] = @"SubscribedCalendarSettings.bundle";
    v16[13] = *MEMORY[0x1E4F17740];
    v17[13] = @"MailAccountSettings.bundle";
    v16[14] = *MEMORY[0x1E4F17848];
    v17[14] = @"RemoteManagementAccountSettings.bundle";
    id v4 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:15];
    v5 = (void *)*((void *)v13 + 1);
    *((void *)v13 + 1) = v4;

    uint64_t v14 = *v10;
    v15 = @"MailAccountSettings.bundle";
    id v6 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v7 = (void *)*((void *)v13 + 2);
    *((void *)v13 + 2) = v6;
  }
  v9 = (ACUIAccountViewProvidersManager *)v13;
  objc_storeStrong(&v13, 0);
  return v9;
}

- (Class)viewControllerClassForCreatingAccountWithType:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(ACUIAccountViewProvidersManager *)v7 _accountViewProviderPluginForAccountTypeID:location[0]];
  id v4 = (id)[v5 viewControllerClassForCreatingAccountWithType:location[0]];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return (Class)v4;
}

- (Class)viewControllerClassForViewingAccount:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = v10;
  id v6 = (id)[location[0] accountType];
  id v5 = (id)[v6 identifier];
  id v8 = -[ACUIAccountViewProvidersManager _accountViewProviderPluginForAccountTypeID:](v4, "_accountViewProviderPluginForAccountTypeID:");

  id v7 = (id)[v8 viewControllerClassForViewingAccount:location[0]];
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return (Class)v7;
}

- (Class)controllerClassForCreatingAccountWithType:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = [(ACUIAccountViewProvidersManager *)v8 _accountViewProviderPluginForAccountTypeID:location[0]];
  id v5 = 0;
  if (objc_opt_respondsToSelector()) {
    id v5 = (id)[v6 controllerClassForCreatingAccountWithType:location[0]];
  }
  id v4 = v5;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return (Class)v4;
}

- (Class)controllerClassForCreatingRemoteAccountWithType:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = [(ACUIAccountViewProvidersManager *)v8 _remoteAccountViewProviderPluginForAccountTypeID:location[0]];
  id v5 = 0;
  if (objc_opt_respondsToSelector()) {
    id v5 = (id)[v6 controllerClassForCreatingRemoteAccountWithType:location[0]];
  }
  id v4 = v5;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return (Class)v4;
}

- (id)configurationInfoForCreatingAccountWithType:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(ACUIAccountViewProvidersManager *)v7 _accountViewProviderPluginForAccountTypeID:location[0]];
  id v4 = (id)[v5 configurationInfoForCreatingAccountWithType:location[0]];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)configurationInfoForViewingAccount:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = v10;
  id v6 = (id)[location[0] accountType];
  id v5 = (id)[v6 identifier];
  id v8 = -[ACUIAccountViewProvidersManager _accountViewProviderPluginForAccountTypeID:](v4, "_accountViewProviderPluginForAccountTypeID:");

  id v7 = (id)[v8 configurationInfoForViewingAccount:location[0]];
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)localizedStringForDataclass:(id)a3 withSuffix:(id)a4 forAccount:(id)a5
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  id v15 = 0;
  objc_super v11 = v19;
  id v13 = (id)[v16 accountType];
  id v12 = (id)[v13 identifier];
  id v14 = -[ACUIAccountViewProvidersManager _accountViewProviderPluginForAccountTypeID:](v11, "_accountViewProviderPluginForAccountTypeID:");

  if (objc_opt_respondsToSelector())
  {
    id v5 = (id)[v14 localizedStringForDataclass:location[0] withSuffix:v17 forAccount:v16];
    id v6 = v15;
    id v15 = v5;
  }
  id v8 = v15;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)_accountViewProviderPluginForAccountTypeID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = [(NSDictionary *)v8->_accountTypeToPluginNameMap objectForKey:location[0]];
  if (v6)
  {
    id v9 = [(ACUIAccountViewProvidersManager *)v8 _cachedPluginForName:v6];
  }
  else
  {
    os_log_t oslog = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v10, (uint64_t)"-[ACUIAccountViewProvidersManager _accountViewProviderPluginForAccountTypeID:]", 121, (uint64_t)location[0]);
      _os_log_error_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_ERROR, "%s (%d) \"ACUIAccountViewProvidersManager: somebody requested an account views provider for the unknown type %@!\"", v10, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v9 = 0;
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  v3 = v9;
  return v3;
}

- (id)_remoteAccountViewProviderPluginForAccountTypeID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = [(NSDictionary *)v12->_remoteAccountTypeToPluginNameMapOverride objectForKey:location[0]];
  char v8 = 0;
  if (v6)
  {
    id v3 = v6;
  }
  else
  {
    id v9 = [(NSDictionary *)v12->_accountTypeToPluginNameMap objectForKey:location[0]];
    char v8 = 1;
    id v3 = v9;
  }
  id v10 = v3;
  if (v8) {

  }
  if (v10)
  {
    id v13 = [(ACUIAccountViewProvidersManager *)v12 _cachedPluginForName:v10];
  }
  else
  {
    os_log_t oslog = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v14, (uint64_t)"-[ACUIAccountViewProvidersManager _remoteAccountViewProviderPluginForAccountTypeID:]", 131, (uint64_t)location[0]);
      _os_log_error_impl(&dword_1DDFE5000, oslog, OS_LOG_TYPE_ERROR, "%s (%d) \"ACUIAccountViewProvidersManager: somebody requested a remote account views provider for the unknown type %@!\"", v14, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v13 = 0;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  id v4 = v13;
  return v4;
}

- (id)_cachedPluginForName:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)[(NSMutableDictionary *)v7->_pluginCache objectForKey:location[0]];
  if (!v5)
  {
    id v5 = [(ACUIAccountViewProvidersManager *)v7 _loadAccountViewProviderPluginWithName:location[0]];

    if (v5) {
      [(NSMutableDictionary *)v7->_pluginCache setObject:v5 forKey:location[0]];
    }
  }
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_loadAccountViewProviderPluginWithName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = +[ACUIPluginLoader pluginBundleWithName:location[0]];
  if (v15)
  {
    id v11 = 0;
    Class v10 = (Class)[v15 principalClass];
    if (([(objc_class *)v10 conformsToProtocol:&unk_1F3A1F638] & 1) == 1)
    {
      id v3 = objc_alloc_init(v10);
      id v4 = v11;
      id v11 = v3;
    }
    else if (([(objc_class *)v10 conformsToProtocol:&unk_1F3A1F5D8] & 1) == 1)
    {
      id v9 = objc_alloc_init(v10);
      id v5 = (id)[v9 accountViewsProvider];
      id v6 = v11;
      id v11 = v5;

      objc_storeStrong(&v9, 0);
    }
    id v17 = v11;
    int v12 = 1;
    objc_storeStrong(&v11, 0);
  }
  else
  {
    id v14 = _ACUILogSystem();
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v18, (uint64_t)"-[ACUIAccountViewProvidersManager _loadAccountViewProviderPluginWithName:]", 153, (uint64_t)location[0]);
      _os_log_error_impl(&dword_1DDFE5000, (os_log_t)v14, v13, "%s (%d) \"ACUIAccountViewProvidersManager failed to load the requested plugin with name %@\"", v18, 0x1Cu);
    }
    objc_storeStrong(&v14, 0);
    id v17 = 0;
    int v12 = 1;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  id v7 = v17;
  return v7;
}

- (BOOL)setDelegate:(id)a3 forSignInController:(id)a4 forAccountWithType:(id)a5
{
  os_log_type_t v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v10 = 0;
  objc_storeStrong(&v10, a5);
  id v9 = [(ACUIAccountViewProvidersManager *)v13 _accountViewProviderPluginForAccountTypeID:v10];
  char v8 = [v9 setDelegate:location[0] forSignInController:v11];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (void).cxx_destruct
{
}

@end