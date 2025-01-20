@interface GCGenericDeviceDriverConfigurationServiceConnection
@end

@implementation GCGenericDeviceDriverConfigurationServiceConnection

void __75___GCGenericDeviceDriverConfigurationServiceConnection_fetchDeviceSnapshot__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __75___GCGenericDeviceDriverConfigurationServiceConnection_fetchDeviceSnapshot__block_invoke_2;
  v5[3] = &unk_26BEC4D20;
  id v6 = a3;
  id v4 = v6;
  [a2 fetchDeviceSnapshotWithReply:v5];
}

uint64_t __75___GCGenericDeviceDriverConfigurationServiceConnection_fetchDeviceSnapshot__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75___GCGenericDeviceDriverConfigurationServiceConnection_applyConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __75___GCGenericDeviceDriverConfigurationServiceConnection_applyConfiguration___block_invoke_2;
  v8[3] = &unk_26BEC4AF0;
  id v9 = v5;
  id v7 = v5;
  [a2 applyConfiguration:v6 withReply:v8];
}

uint64_t __75___GCGenericDeviceDriverConfigurationServiceConnection_applyConfiguration___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end