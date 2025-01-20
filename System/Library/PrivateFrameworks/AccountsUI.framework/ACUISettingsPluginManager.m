@interface ACUISettingsPluginManager
- (ACUISettingsPluginManager)initWithParentViewController:(id)a3;
- (id)_loadSettingsPluginFromBundleWithName:(id)a3;
- (id)_settingsPluginFromBundleWithName:(id)a3;
- (id)calendarSettingsPlugin;
- (id)contactsSettingsPlugin;
- (id)mailSettingsPlugin;
- (void)parentViewControllerWillDisappear;
@end

@implementation ACUISettingsPluginManager

- (ACUISettingsPluginManager)initWithParentViewController:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)ACUISettingsPluginManager;
  v8 = [(ACUISettingsPluginManager *)&v9 init];
  v11 = v8;
  objc_storeStrong((id *)&v11, v8);
  if (v8)
  {
    objc_storeWeak((id *)&v11->_parentViewController, location[0]);
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pluginCache = v11->_pluginCache;
    v11->_pluginCache = v4;
  }
  v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (void)parentViewControllerWillDisappear
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12[2] = self;
  v12[1] = (id)a2;
  v12[0] = (id)[(NSMutableDictionary *)self->_pluginCache copy];
  memset(__b, 0, sizeof(__b));
  id obj = (id)[v12[0] allKeys];
  uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    uint64_t v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(__b[1] + 8 * v5);
      id location = (id)objc_msgSend(v12[0], "objectForKeyedSubscript:", v11, v6);
      if (objc_opt_respondsToSelector()) {
        [location parentControllerWillDisappear];
      }
      objc_storeStrong(&location, 0);
      ++v5;
      uint64_t v6 = v2;
      if (v3 + 1 >= v2)
      {
        uint64_t v5 = 0;
        uint64_t v6 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  objc_storeStrong(v12, 0);
}

- (id)mailSettingsPlugin
{
  return [(ACUISettingsPluginManager *)self _settingsPluginFromBundleWithName:@"MailAccountSettings.bundle", a2, self];
}

- (id)calendarSettingsPlugin
{
  return [(ACUISettingsPluginManager *)self _settingsPluginFromBundleWithName:@"MobileCalSettings.bundle", a2, self];
}

- (id)contactsSettingsPlugin
{
  return [(ACUISettingsPluginManager *)self _settingsPluginFromBundleWithName:@"ContactsSettings.bundle", a2, self];
}

- (id)_settingsPluginFromBundleWithName:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)[(NSMutableDictionary *)v7->_pluginCache objectForKey:location[0]];
  if (!v5)
  {
    id v5 = [(ACUISettingsPluginManager *)v7 _loadSettingsPluginFromBundleWithName:location[0]];

    if (v5) {
      [(NSMutableDictionary *)v7->_pluginCache setObject:v5 forKey:location[0]];
    }
  }
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_loadSettingsPluginFromBundleWithName:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = +[ACUIPluginLoader pluginBundleWithName:location[0]];
  if (v19)
  {
    id v15 = 0;
    Class v14 = (Class)[v19 principalClass];
    if (([(objc_class *)v14 conformsToProtocol:&unk_1F3A1F578] & 1) == 1)
    {
      id v11 = [v14 alloc];
      id WeakRetained = objc_loadWeakRetained((id *)&v21->_parentViewController);
      uint64_t v3 = objc_msgSend(v11, "initWithParentController:");
      id v4 = v15;
      id v15 = v3;
    }
    else if (([(objc_class *)v14 conformsToProtocol:&unk_1F3A1F5D8] & 1) == 1)
    {
      id v13 = objc_alloc_init(v14);
      id v9 = v13;
      id v10 = objc_loadWeakRetained((id *)&v21->_parentViewController);
      id v5 = (id)objc_msgSend(v9, "settingsPluginWithParent:");
      id v6 = v15;
      id v15 = v5;

      objc_storeStrong(&v13, 0);
    }
    id v22 = v15;
    int v16 = 1;
    objc_storeStrong(&v15, 0);
  }
  else
  {
    id v18 = _ACUILogSystem();
    os_log_type_t v17 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v23, (uint64_t)"-[ACUISettingsPluginManager _loadSettingsPluginFromBundleWithName:]", 70, (uint64_t)location[0]);
      _os_log_error_impl(&dword_1DDFE5000, (os_log_t)v18, v17, "%s (%d) \"ACUISettingsPluginManager failed to load the requested plugin with name %@\"", v23, 0x1Cu);
    }
    objc_storeStrong(&v18, 0);
    id v22 = 0;
    int v16 = 1;
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  v7 = v22;
  return v7;
}

- (void).cxx_destruct
{
}

@end