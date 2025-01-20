@interface HBXHealthAppPluginFactory
+ (Class)makeDataListDataProviderClassFromPluginName:(id)a3 displayType:(id)a4;
+ (id)_createPluginAddDataViewControllerProvidingFromPluginBundle:(id)a3;
+ (id)_createPluginAppDelegateFromPluginBundle:(id)a3;
+ (id)_createPluginDataListDataProviderProvidingFromPluginBundle:(id)a3;
+ (id)_loadBundleForPluginPath:(id)a3;
+ (id)_loadPluginBundleForDisplayType:(id)a3;
+ (id)_makeDataListViewControllerProvidingForDisplayType:(id)a3;
+ (id)_pluginPathForDisplayType:(id)a3;
+ (id)_pluginsDirectoryPath;
+ (id)makeDataListViewControllerForHealthStore:(id)a3 displayType:(id)a4 predicate:(id)a5;
@end

@implementation HBXHealthAppPluginFactory

+ (id)makeDataListViewControllerForHealthStore:(id)a3 displayType:(id)a4 predicate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[HBXHealthAppPluginFactory _makeDataListViewControllerProvidingForDisplayType:v8];
  v11 = v10;
  if (v10)
  {
    v12 = [v10 makeDataListViewControllerForHealthStore:v7 displayType:v8 predicate:v9];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_makeDataListViewControllerProvidingForDisplayType:(id)a3
{
  v3 = [a1 _loadPluginBundleForDisplayType:a3];
  if (v3)
  {
    v4 = +[HBXHealthAppPluginFactory _createPluginAddDataViewControllerProvidingFromPluginBundle:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_loadPluginBundleForDisplayType:(id)a3
{
  v3 = [a1 _pluginPathForDisplayType:a3];
  if (v3)
  {
    v4 = +[HBXHealthAppPluginFactory _loadBundleForPluginPath:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_pluginPathForDisplayType:(id)a3
{
  uint64_t v4 = [a3 displayTypeIdentifier];
  if (v4 == 273)
  {
    v5 = [a1 _pluginsDirectoryPath];
    v6 = v5;
    id v7 = @"MedicationsHealthAppPlugin.healthplugin";
    goto LABEL_5;
  }
  if (v4 == 257)
  {
    v5 = [a1 _pluginsDirectoryPath];
    v6 = v5;
    id v7 = @"VisionHealthAppPlugin.healthplugin";
LABEL_5:
    id v8 = [v5 stringByAppendingPathComponent:v7];

    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

+ (id)_pluginsDirectoryPath
{
  v2 = +[HBXHealthAppPluginUtilities defaultUtilities];
  v3 = [v2 feedItemPluginsPath];

  return v3;
}

+ (id)_loadBundleForPluginPath:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F086E0] bundleWithPath:v3];
  v5 = v4;
  if (v4)
  {
    id v15 = 0;
    char v6 = [v4 loadAndReturnError:&v15];
    id v7 = v15;
    if (v6)
    {
      id v8 = v5;
    }
    else
    {
      _HKInitializeLogging();
      v10 = (void *)*MEMORY[0x263F09968];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR))
      {
        v12 = v10;
        v13 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v17 = v13;
        __int16 v18 = 2114;
        id v19 = v3;
        __int16 v20 = 2114;
        id v21 = v7;
        id v14 = v13;
        _os_log_error_impl(&dword_2210D2000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load plugin bundle at path %{public}@ with error: %{public}@", buf, 0x20u);
      }
      id v8 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      +[HBXHealthAppPluginFactory _loadBundleForPluginPath:](v9);
    }
    id v8 = 0;
  }

  return v8;
}

+ (id)_createPluginAddDataViewControllerProvidingFromPluginBundle:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = +[HBXHealthAppPluginFactory _createPluginAppDelegateFromPluginBundle:v3];
  v5 = &unk_26D339F30;
  if ([v4 conformsToProtocol:v5])
  {
    id v6 = v4;
  }
  else
  {
    _HKInitializeLogging();
    id v7 = (void *)*MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR))
    {
      id v9 = v7;
      v10 = objc_opt_class();
      id v11 = v10;
      v12 = NSStringFromProtocol((Protocol *)v5);
      v13 = [v3 bundleIdentifier];
      int v14 = 138543874;
      id v15 = v10;
      __int16 v16 = 2114;
      v17 = v12;
      __int16 v18 = 2114;
      id v19 = v13;
      _os_log_error_impl(&dword_2210D2000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Plugin app delegate does not conform to %{public}@: %{public}@", (uint8_t *)&v14, 0x20u);
    }
    id v6 = 0;
  }

  return v6;
}

+ (id)_createPluginAppDelegateFromPluginBundle:(id)a3
{
  id v4 = a3;
  v5 = [v4 infoDictionary];
  id v6 = [v5 objectForKeyedSubscript:@"PluginAppDelegateClass"];

  if (v6)
  {
    id v7 = objc_alloc_init(NSClassFromString(v6));
  }
  else
  {
    _HKInitializeLogging();
    id v8 = (void *)*MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      +[HBXHealthAppPluginFactory _createPluginAppDelegateFromPluginBundle:v4];
    }
    id v7 = 0;
  }

  return v7;
}

+ (Class)makeDataListDataProviderClassFromPluginName:(id)a3 displayType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _pluginsDirectoryPath];
  id v9 = [v8 stringByAppendingPathComponent:v7];

  v10 = [a1 _loadBundleForPluginPath:v9];
  id v11 = +[HBXHealthAppPluginFactory _createPluginDataListDataProviderProvidingFromPluginBundle:v10];
  v12 = [v11 makeDataListDataProviderClassForDisplayType:v6];

  return (Class)v12;
}

+ (id)_createPluginDataListDataProviderProvidingFromPluginBundle:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[HBXHealthAppPluginFactory _createPluginAppDelegateFromPluginBundle:v3];
  v5 = &unk_26D339FE8;
  if ([v4 conformsToProtocol:v5])
  {
    id v6 = v4;
  }
  else
  {
    _HKInitializeLogging();
    id v7 = (void *)*MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR))
    {
      id v9 = v7;
      v10 = objc_opt_class();
      id v11 = v10;
      v12 = NSStringFromProtocol((Protocol *)v5);
      v13 = [v3 bundleIdentifier];
      int v14 = 138543874;
      id v15 = v10;
      __int16 v16 = 2114;
      v17 = v12;
      __int16 v18 = 2114;
      id v19 = v13;
      _os_log_error_impl(&dword_2210D2000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Plugin app delegate does not conform to %{public}@: %{public}@", (uint8_t *)&v14, 0x20u);
    }
    id v6 = 0;
  }

  return v6;
}

+ (void)_loadBundleForPluginPath:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_2210D2000, v3, v4, "%{public}@: Failed to create plugin bundle at path: %{public}@", v5, v6, v7, v8, 2u);
}

+ (void)_createPluginAppDelegateFromPluginBundle:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = (id)objc_opt_class();
  v12 = [a3 bundleIdentifier];
  OUTLINED_FUNCTION_0(&dword_2210D2000, v6, v7, "%{public}@: Plugin does not declare an app delegate in its Info.plist: %{public}@", v8, v9, v10, v11, 2u);
}

@end