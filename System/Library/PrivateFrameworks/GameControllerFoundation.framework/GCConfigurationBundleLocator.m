@interface GCConfigurationBundleLocator
@end

@implementation GCConfigurationBundleLocator

void __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _os_activity_create(&dword_20AD04000, "[Config Bundle Locator/Source/FS] Did Change", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v3.opaque[0] = 0;
    v3.opaque[1] = 0;
    os_activity_scope_enter(v2, &v3);
    if (-[_GCConfigurationBundleLocator _onqueue_filesystem_updateBundles]((uint64_t)WeakRetained)) {
      -[_GCConfigurationBundleLocator _onqueue_rebuildBundleCollection](WeakRetained);
    }
    os_activity_scope_leave(&v3);
  }
}

void __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke_9(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _os_activity_create(&dword_20AD04000, "[Config Bundle Locator/Source/Asset] Did Change", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v2, &state);
    os_activity_scope_state_s v3 = WeakRetained[3];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke_2;
    block[3] = &unk_26BEC3CA8;
    v5 = WeakRetained;
    dispatch_async_and_wait(v3, block);

    os_activity_scope_leave(&state);
  }
}

void __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke_2(uint64_t a1)
{
  if (-[_GCConfigurationBundleLocator _onqueue_asset_updateBundles](*(void *)(a1 + 32)))
  {
    v2 = *(void **)(a1 + 32);
    -[_GCConfigurationBundleLocator _onqueue_rebuildBundleCollection](v2);
  }
}

void __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke_12(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    os_activity_scope_state_s v3 = WeakRetained[3];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke_2_13;
    block[3] = &unk_26BEC3CA8;
    v5 = WeakRetained;
    dispatch_async_and_wait(v3, block);
  }
}

void __68___GCConfigurationBundleLocator_initWithConfigurationType_provider___block_invoke_2_13(uint64_t a1)
{
  v2 = _os_activity_create(&dword_20AD04000, "[Config Bundle Locator] Refresh Bundles", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v3.opaque[0] = 0;
  v3.opaque[1] = 0;
  os_activity_scope_enter(v2, &v3);
  -[_GCConfigurationBundleLocator _onqueue_loadBundlesIfNeeded](*(void *)(a1 + 32));
  os_activity_scope_leave(&v3);
}

id __45___GCConfigurationBundleLocator_fetchBundles__block_invoke(uint64_t a1, unsigned __int8 *a2)
{
  unsigned __int8 v2 = atomic_load(a2);
  if (v2)
  {
    id v14 = 0;
  }
  else
  {
    v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __45___GCConfigurationBundleLocator_fetchBundles__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(NSObject **)(v12 + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __45___GCConfigurationBundleLocator_fetchBundles__block_invoke_18;
    block[3] = &unk_26BEC3CA8;
    void block[4] = v12;
    dispatch_async_and_wait(v13, block);
    id v14 = *(id *)(*(void *)(a1 + 32) + 32);
  }

  return v14;
}

void __45___GCConfigurationBundleLocator_fetchBundles__block_invoke_18(uint64_t a1)
{
  unsigned __int8 v2 = _os_activity_create(&dword_20AD04000, "[Config Bundle Locator] Fetch Bundles", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v3.opaque[0] = 0;
  v3.opaque[1] = 0;
  os_activity_scope_enter(v2, &v3);
  -[_GCConfigurationBundleLocator _onqueue_loadBundlesIfNeeded](*(void *)(a1 + 32));
  os_activity_scope_leave(&v3);
}

void __65___GCConfigurationBundleLocator__onqueue_rebuildBundleCollection__block_invoke(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"GCConfigurationBundlesDidChangeNotification" object:*(void *)(a1 + 32)];
}

_GCConfigurationBundle *__66___GCConfigurationBundleLocator__onqueue_filesystem_updateBundles__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __66___GCConfigurationBundleLocator__onqueue_filesystem_updateBundles__block_invoke_cold_3(v4, v3);
  }
  uint64_t v5 = [_GCConfigurationBundle alloc];
  uint64_t v6 = [v3 path];
  id v15 = 0;
  uint64_t v7 = [(_GCConfigurationBundle *)v5 initWithPath:v6 error:&v15];
  id v8 = v15;

  if (v7)
  {
    uint64_t v9 = v7;
    goto LABEL_5;
  }
  uint64_t v11 = [v8 domain];
  if ([v11 isEqual:0x26BEDBB40])
  {
    uint64_t v12 = [v8 code];

    if (v12 == 2)
    {
      v13 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __66___GCConfigurationBundleLocator__onqueue_filesystem_updateBundles__block_invoke_cold_1(v13, v3);
      }
      goto LABEL_5;
    }
  }
  else
  {
  }
  id v14 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
    __66___GCConfigurationBundleLocator__onqueue_filesystem_updateBundles__block_invoke_cold_2(v14, v3, (uint64_t)v8);
  }
LABEL_5:

  return v7;
}

_GCConfigurationBundle *__61___GCConfigurationBundleLocator__onqueue_asset_updateBundles__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v19 = 0;
  [v3 getResourceValue:&v19 forKey:@"NSURLAssetKey" error:0];
  id v4 = v19;
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __61___GCConfigurationBundleLocator__onqueue_asset_updateBundles__block_invoke_cold_2(v5, v3);
  }
  uint64_t v6 = [_GCConfigurationBundle alloc];
  uint64_t v7 = [v3 path];
  id v18 = 0;
  id v8 = [(_GCConfigurationBundle *)v6 initWithPath:v7 error:&v18];
  id v9 = v18;

  if (v8)
  {
    uint64_t v10 = v8;
    goto LABEL_5;
  }
  uint64_t v12 = [v9 domain];
  if ([v12 isEqual:0x26BEDBB40])
  {
    uint64_t v13 = [v9 code];

    if (v13 == 2)
    {
      id v14 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __61___GCConfigurationBundleLocator__onqueue_asset_updateBundles__block_invoke_cold_1(v14, v3);
      }
      goto LABEL_5;
    }
  }
  else
  {
  }
  id v15 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    v16 = v15;
    v17 = [v3 lastPathComponent];
    *(_DWORD *)buf = 138543874;
    v21 = v17;
    __int16 v22 = 2112;
    id v23 = v4;
    __int16 v24 = 2114;
    id v25 = v9;
    _os_log_fault_impl(&dword_20AD04000, v16, OS_LOG_TYPE_FAULT, "[Source/Asset] Failed to load bundle '%{public}@' in asset '%@': %{public}@", buf, 0x20u);
  }
LABEL_5:

  return v8;
}

void __45___GCConfigurationBundleLocator_fetchBundles__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66___GCConfigurationBundleLocator__onqueue_filesystem_updateBundles__block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_20AD04000, v3, v5, "[Source/FS] Skipping bundle at '%@'.  Incompatible with host.", v6);
}

void __66___GCConfigurationBundleLocator__onqueue_filesystem_updateBundles__block_invoke_cold_2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a2 path];
  OUTLINED_FUNCTION_0_1();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  _os_log_fault_impl(&dword_20AD04000, v5, OS_LOG_TYPE_FAULT, "[Source/FS] Failed to load bundle at '%@': %{public}@", v7, 0x16u);
}

void __66___GCConfigurationBundleLocator__onqueue_filesystem_updateBundles__block_invoke_cold_3(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0(&dword_20AD04000, v3, v5, "[Source/FS] (Re)Loading bundle at '%@'.", v6);
}

void __61___GCConfigurationBundleLocator__onqueue_asset_updateBundles__block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 lastPathComponent];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_20AD04000, v5, v6, "[Source/Asset] Skipping bundle '%{public}@' in asset '%@'.  Incompatible with host.", v7, v8, v9, v10, v11);
}

void __61___GCConfigurationBundleLocator__onqueue_asset_updateBundles__block_invoke_cold_2(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 lastPathComponent];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_20AD04000, v5, v6, "[Source/Asset] (Re)Loading bundle '%{public}@' in asset '%@'.", v7, v8, v9, v10, v11);
}

@end