@interface GCGenericDeviceDBServiceConnection
@end

@implementation GCGenericDeviceDBServiceConnection

void __57___GCGenericDeviceDBServiceConnection_hasModelForDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __57___GCGenericDeviceDBServiceConnection_hasModelForDevice___block_invoke_2;
  v8[3] = &unk_26BEC4AF0;
  id v9 = v5;
  id v7 = v5;
  [a2 hasModelForDevice:v6 reply:v8];
}

void __57___GCGenericDeviceDBServiceConnection_hasModelForDevice___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[NSNumber numberWithBool:a2];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, 0);
}

void __62___GCGenericDeviceDBServiceConnection_preparedModelForDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __62___GCGenericDeviceDBServiceConnection_preparedModelForDevice___block_invoke_2;
  v8[3] = &unk_26BEC4B40;
  id v9 = v5;
  id v7 = v5;
  [a2 preparedModelForDevice:v6 reply:v8];
}

uint64_t __62___GCGenericDeviceDBServiceConnection_preparedModelForDevice___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end