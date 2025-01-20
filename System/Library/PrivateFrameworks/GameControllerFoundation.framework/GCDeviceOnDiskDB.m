@interface GCDeviceOnDiskDB
@end

@implementation GCDeviceOnDiskDB

_GCDeviceDBBundle *__37___GCDeviceOnDiskDB_initWithBundles___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _gc_log_devicedb();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __37___GCDeviceOnDiskDB_initWithBundles___block_invoke_cold_2(v2, v3);
  }

  id v8 = 0;
  v4 = [[_GCDeviceDBBundle alloc] initWithBundle:v2 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    v6 = _gc_log_devicedb();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __37___GCDeviceOnDiskDB_initWithBundles___block_invoke_cold_1();
    }
  }

  return v4;
}

void __37___GCDeviceOnDiskDB_initWithBundles___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_20AD04000, v0, v1, "📦 Error loading bundle '%{public}@': %{public}@");
}

void __37___GCDeviceOnDiskDB_initWithBundles___block_invoke_cold_2(void *a1, NSObject *a2)
{
  v4 = [a1 bundleURL];
  id v5 = [v4 path];
  int v6 = 138543618;
  v7 = a1;
  __int16 v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_20AD04000, a2, OS_LOG_TYPE_DEBUG, "Loading bundle '%{public}@' at '%{public}@'...", (uint8_t *)&v6, 0x16u);
}

@end