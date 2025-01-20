@interface GCDeviceConfigurationEvaluator
@end

@implementation GCDeviceConfigurationEvaluator

uint64_t __69___GCDeviceConfigurationEvaluator_viableConfigurations_deviceOwners___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 priority];
  if (v6 <= [v5 priority])
  {
    unint64_t v8 = [v4 priority];
    uint64_t v7 = v8 < [v5 priority];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

void __69___GCDeviceConfigurationEvaluator_viableConfigurations_deviceOwners___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _gc_log_device_configuration();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __69___GCDeviceConfigurationEvaluator_viableConfigurations_deviceOwners___block_invoke_10_cold_1();
  }
}

void __69___GCDeviceConfigurationEvaluator_viableConfigurations_deviceOwners___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  unint64_t v6 = a3;
  uint64_t v7 = _gc_log_device_configuration();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v8 = [*(id *)(a1 + 32) objectForKey:v5];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v10 = @"(NONE)";
    if ((isKindOfClass & 1) == 0) {
      v10 = v6;
    }
    int v11 = 138412546;
    v12 = v8;
    __int16 v13 = 2112;
    v14 = v10;
    _os_log_debug_impl(&dword_20AD04000, v7, OS_LOG_TYPE_DEBUG, "\t%@ -> %@", (uint8_t *)&v11, 0x16u);
  }
}

void __43___GCDeviceConfigurationEvaluator_evaluate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  unint64_t v6 = +[NSNull null];
  int v7 = [v5 isEqual:v6];

  if (v7) {
    [*(id *)(a1 + 32) removeObjectForKey:v8];
  }
}

void __69___GCDeviceConfigurationEvaluator_viableConfigurations_deviceOwners___block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20AD04000, v0, v1, "\t%@", v2);
}

@end