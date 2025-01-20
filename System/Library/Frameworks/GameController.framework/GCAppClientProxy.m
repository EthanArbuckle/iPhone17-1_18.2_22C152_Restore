@interface GCAppClientProxy
@end

@implementation GCAppClientProxy

void __48___GCAppClientProxy__initWithConnection_server___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  [v1 _invalidate];
}

uint64_t __35___GCAppClientProxy_pingWithReply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __64___GCAppClientProxy_connectToControllerServiceWithClient_reply___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id obj = *(id *)(a1 + 40);
    objc_sync_enter(obj);
    if (!*(void *)(*(void *)(a1 + 40) + 48))
    {
      uint64_t v3 = +[NSMapTable strongToStrongObjectsMapTable];
      uint64_t v4 = *(void *)(a1 + 40);
      v5 = *(void **)(v4 + 64);
      *(void *)(v4 + 64) = v3;

      [*(id *)(*(void *)(a1 + 40) + 8) addObserver:*(void *)(a1 + 40) forKeyPath:@"activeControllerDevices" options:5 context:0];
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 48), *(id *)(a1 + 32));
      *(void *)(*(void *)(a1 + 40) + 56) = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    objc_sync_exit(obj);
  }
  else
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
}

uint64_t __77___GCAppClientProxy_connectToPlayerIndicatorXPCProxyServiceWithClient_reply___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  if (v2) {
    uint64_t v4 = a1[5];
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, v4, 0);
}

uint64_t __67___GCAppClientProxy_connectToLightXPCProxyServiceWithClient_reply___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  if (v2) {
    uint64_t v4 = a1[5];
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, v4, 0);
}

uint64_t __78___GCAppClientProxy_connectToAdaptiveTriggersXPCProxyServiceWithClient_reply___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  if (v2) {
    uint64_t v4 = a1[5];
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, v4, 0);
}

uint64_t __68___GCAppClientProxy_connectToMotionXPCProxyServiceWithClient_reply___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  if (v2) {
    uint64_t v4 = a1[5];
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, v4, 0);
}

uint64_t __69___GCAppClientProxy_connectToBatteryXPCProxyServiceWithClient_reply___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  if (v2) {
    uint64_t v4 = a1[5];
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, v4, 0);
}

uint64_t __70___GCAppClientProxy_connectToSettingsXPCProxyServiceWithClient_reply___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  if (v2) {
    uint64_t v4 = a1[5];
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, v4, 0);
}

uint64_t __72___GCAppClientProxy_connectToGameIntentXPCProxyServiceWithClient_reply___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  if (v2) {
    uint64_t v4 = a1[5];
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, v4, 0);
}

uint64_t __75___GCAppClientProxy_connectToSystemGestureXPCProxyServiceWithClient_reply___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  if (v2) {
    uint64_t v4 = a1[5];
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, v4, 0);
}

uint64_t __72___GCAppClientProxy_connectToPhotoVideoXPCProxyServiceWithClient_reply___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  if (v2) {
    uint64_t v4 = a1[5];
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, v4, 0);
}

void __38___GCAppClientProxy_settingsSuiteName__block_invoke()
{
  uint64_t v0 = [&stru_26D27BBB8 stringByAppendingString:@"com.apple.gamecontroller.settings"];
  id v1 = (void *)settingsSuiteName_suiteName;
  settingsSuiteName_suiteName = v0;
}

void __58___GCAppClientProxy_DeviceClient__addInvalidationHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v3 = WeakRetained;
    objc_sync_enter(v3);
    uint64_t v4 = [v3 invalidationHandlers];
    v5 = (void *)[v4 mutableCopy];

    v6 = (void *)MEMORY[0x223C6E420](*(void *)(a1 + 32));
    [v5 removeObject:v6];

    [v3 setInvalidationHandlers:v5];
    objc_sync_exit(v3);

    id WeakRetained = v7;
  }
}

void __77___GCAppClientProxy_ControllerService__fetchControllerDescriptionsWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  uint64_t v4 = [*(id *)(*(void *)v2 + 64) objectEnumerator];
  v5 = [v4 allObjects];

  objc_sync_exit(v3);
  if (gc_isInternalBuild())
  {
    v6 = getGCLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __77___GCAppClientProxy_ControllerService__fetchControllerDescriptionsWithReply___block_invoke_cold_1(v2, (uint64_t)v5, v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __111___GCAppClientProxy_PlayerIndicatorXPCProxyService__playerIndicatorXPCProxyServiceClientEndpointConnect_reply___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __111___GCAppClientProxy_PlayerIndicatorXPCProxyService__playerIndicatorXPCProxyServiceClientEndpointConnect_reply___block_invoke_2;
  v5[3] = &unk_26D22CA10;
  id v3 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v7 = v2;
  id v8 = *(id *)(a1 + 48);
  id v4 = v2;
  [v6 fetchObjectIdentifierWithReply:v5];
}

void __111___GCAppClientProxy_PlayerIndicatorXPCProxyService__playerIndicatorXPCProxyServiceClientEndpointConnect_reply___block_invoke_2(void *a1, uint64_t a2)
{
  id v3 = [*(id *)(a1[4] + 8) IPCObjectWithIdentifier:a2];
  id v7 = v3;
  if (v3
    && [v3 conformsToProtocol:&unk_26D2AA0B0]
    && [v7 conformsToProtocol:&unk_26D28C480])
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = v7;
    [v6 acceptClient:v4 onConnection:v5 error:0];
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __91___GCAppClientProxy_LightXPCProxyService__lightXPCProxyServiceClientEndpointConnect_reply___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __91___GCAppClientProxy_LightXPCProxyService__lightXPCProxyServiceClientEndpointConnect_reply___block_invoke_2;
  v5[3] = &unk_26D22CA10;
  id v3 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v7 = v2;
  id v8 = *(id *)(a1 + 48);
  id v4 = v2;
  [v6 fetchObjectIdentifierWithReply:v5];
}

void __91___GCAppClientProxy_LightXPCProxyService__lightXPCProxyServiceClientEndpointConnect_reply___block_invoke_2(void *a1, uint64_t a2)
{
  id v3 = [*(id *)(a1[4] + 8) IPCObjectWithIdentifier:a2];
  id v7 = v3;
  if (v3
    && [v3 conformsToProtocol:&unk_26D297750]
    && [v7 conformsToProtocol:&unk_26D28C480])
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = v7;
    [v6 acceptClient:v4 onConnection:v5 error:0];
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __113___GCAppClientProxy_AdaptiveTriggersXPCProxyService__adaptiveTriggersXPCProxyServiceClientEndpointConnect_reply___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __113___GCAppClientProxy_AdaptiveTriggersXPCProxyService__adaptiveTriggersXPCProxyServiceClientEndpointConnect_reply___block_invoke_2;
  v5[3] = &unk_26D22CA10;
  id v3 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v7 = v2;
  id v8 = *(id *)(a1 + 48);
  id v4 = v2;
  [v6 fetchObjectIdentifierWithReply:v5];
}

void __113___GCAppClientProxy_AdaptiveTriggersXPCProxyService__adaptiveTriggersXPCProxyServiceClientEndpointConnect_reply___block_invoke_2(void *a1, uint64_t a2)
{
  id v3 = [*(id *)(a1[4] + 8) IPCObjectWithIdentifier:a2];
  id v7 = v3;
  if (v3
    && [v3 conformsToProtocol:&unk_26D29E210]
    && [v7 conformsToProtocol:&unk_26D28C480])
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = v7;
    [v6 acceptClient:v4 onConnection:v5 error:0];
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __93___GCAppClientProxy_MotionXPCProxyService__motionXPCProxyServiceClientEndpointConnect_reply___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __93___GCAppClientProxy_MotionXPCProxyService__motionXPCProxyServiceClientEndpointConnect_reply___block_invoke_2;
  v5[3] = &unk_26D22CA10;
  id v3 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v7 = v2;
  id v8 = *(id *)(a1 + 48);
  id v4 = v2;
  [v6 fetchObjectIdentifierWithReply:v5];
}

void __93___GCAppClientProxy_MotionXPCProxyService__motionXPCProxyServiceClientEndpointConnect_reply___block_invoke_2(void *a1, uint64_t a2)
{
  id v3 = [*(id *)(a1[4] + 8) IPCObjectWithIdentifier:a2];
  id v7 = v3;
  if (v3
    && [v3 conformsToProtocol:&unk_26D290D50]
    && [v7 conformsToProtocol:&unk_26D28C480])
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = v7;
    [v6 acceptClient:v4 onConnection:v5 error:0];
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __95___GCAppClientProxy_BatteryXPCProxyService__batteryXPCProxyServiceClientEndpointConnect_reply___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __95___GCAppClientProxy_BatteryXPCProxyService__batteryXPCProxyServiceClientEndpointConnect_reply___block_invoke_2;
  v5[3] = &unk_26D22CA10;
  id v3 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v7 = v2;
  id v8 = *(id *)(a1 + 48);
  id v4 = v2;
  [v6 fetchObjectIdentifierWithReply:v5];
}

void __95___GCAppClientProxy_BatteryXPCProxyService__batteryXPCProxyServiceClientEndpointConnect_reply___block_invoke_2(void *a1, uint64_t a2)
{
  id v3 = [*(id *)(a1[4] + 8) IPCObjectWithIdentifier:a2];
  id v7 = v3;
  if (v3
    && [v3 conformsToProtocol:&unk_26D28C4F8]
    && [v7 conformsToProtocol:&unk_26D28C480])
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = v7;
    [v6 acceptClient:v4 onConnection:v5 error:0];
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __101___GCAppClientProxy_GameIntentXPCProxyService__gameIntentXPCProxyServiceClientEndpointConnect_reply___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __101___GCAppClientProxy_GameIntentXPCProxyService__gameIntentXPCProxyServiceClientEndpointConnect_reply___block_invoke_2;
  v5[3] = &unk_26D22CA10;
  id v3 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v7 = v2;
  id v8 = *(id *)(a1 + 48);
  id v4 = v2;
  [v6 fetchObjectIdentifierWithReply:v5];
}

void __101___GCAppClientProxy_GameIntentXPCProxyService__gameIntentXPCProxyServiceClientEndpointConnect_reply___block_invoke_2(void *a1, uint64_t a2)
{
  id v3 = [*(id *)(a1[4] + 8) IPCObjectWithIdentifier:a2];
  id v7 = v3;
  if (v3
    && [v3 conformsToProtocol:&unk_26D293A10]
    && [v7 conformsToProtocol:&unk_26D28C480])
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = v7;
    [v6 acceptClient:v4 onConnection:v5 error:0];
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __107___GCAppClientProxy_SystemGestureXPCProxyService__systemGestureXPCProxyServiceClientEndpointConnect_reply___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __107___GCAppClientProxy_SystemGestureXPCProxyService__systemGestureXPCProxyServiceClientEndpointConnect_reply___block_invoke_2;
  v5[3] = &unk_26D22CA10;
  id v3 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v7 = v2;
  id v8 = *(id *)(a1 + 48);
  id v4 = v2;
  [v6 fetchObjectIdentifierWithReply:v5];
}

void __107___GCAppClientProxy_SystemGestureXPCProxyService__systemGestureXPCProxyServiceClientEndpointConnect_reply___block_invoke_2(void *a1, uint64_t a2)
{
  id v3 = [*(id *)(a1[4] + 8) IPCObjectWithIdentifier:a2];
  id v7 = v3;
  if (v3
    && [v3 conformsToProtocol:&unk_26D29FB80]
    && [v7 conformsToProtocol:&unk_26D28C480])
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = v7;
    [v6 acceptClient:v4 onConnection:v5 error:0];
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __97___GCAppClientProxy_SettingsXPCProxyService__settingsXPCProxyServiceClientEndpointConnect_reply___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __97___GCAppClientProxy_SettingsXPCProxyService__settingsXPCProxyServiceClientEndpointConnect_reply___block_invoke_2;
  v5[3] = &unk_26D22CA10;
  id v3 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v7 = v2;
  id v8 = *(id *)(a1 + 48);
  id v4 = v2;
  [v6 fetchObjectIdentifierWithReply:v5];
}

void __97___GCAppClientProxy_SettingsXPCProxyService__settingsXPCProxyServiceClientEndpointConnect_reply___block_invoke_2(void *a1, uint64_t a2)
{
  id v3 = [*(id *)(a1[4] + 8) IPCObjectWithIdentifier:a2];
  id v7 = v3;
  if (v3
    && [v3 conformsToProtocol:&unk_26D299890]
    && [v7 conformsToProtocol:&unk_26D28C480])
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = v7;
    [v6 acceptClient:v4 onConnection:v5 error:0];
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __77___GCAppClientProxy_ControllerService__fetchControllerDescriptionsWithReply___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = *(void *)(*(void *)a1 + 24);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_19(&dword_220998000, a2, a3, "Sending published controllers to remote %@\n%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

@end