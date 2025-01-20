@interface GCControllerManagerAppClient
@end

@implementation GCControllerManagerAppClient

uint64_t __37___GCControllerManagerAppClient_init__block_invoke()
{
  uint64_t v0 = objc_opt_class();

  return MEMORY[0x270F2E508](v0);
}

uint64_t __37___GCControllerManagerAppClient_open__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectToDaemon];
}

uint64_t __50___GCControllerManagerAppClient_finalizeRecording__block_invoke(uint64_t a1, int a2)
{
  if (gc_isInternalBuild())
  {
    v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = @"Failed to move";
      if (a2) {
        v6 = @"Successfully moved";
      }
      int v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_INFO, "%@ last recording to desktop", (uint8_t *)&v7, 0xCu);
    }
  }
  return [*(id *)(a1 + 32) invalidate];
}

void __49___GCControllerManagerAppClient__connectToDaemon__block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    v22 = getGCLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_cold_1();
    }
  }
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 248);
  *(void *)(v2 + 248) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 256);
  *(void *)(v4 + 256) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 232);
  *(void *)(v6 + 232) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 240);
  *(void *)(v8 + 240) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 264);
  *(void *)(v10 + 264) = 0;

  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 224);
  *(void *)(v12 + 224) = 0;

  uint64_t v14 = *(void *)(a1 + 32);
  v15 = *(void **)(v14 + 216);
  *(void *)(v14 + 216) = 0;

  uint64_t v16 = *(void *)(a1 + 32);
  v17 = *(void **)(v16 + 200);
  *(void *)(v16 + 200) = 0;

  uint64_t v18 = *(void *)(a1 + 32);
  v19 = *(void **)(v18 + 208);
  *(void *)(v18 + 208) = 0;

  uint64_t v20 = *(void *)(a1 + 32);
  v21 = *(void **)(v20 + 192);
  *(void *)(v20 + 192) = 0;
}

void __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_168(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    v17 = getGCLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_168_cold_1();
    }
  }
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 248);
  *(void *)(v2 + 248) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 256);
  *(void *)(v4 + 256) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 232);
  *(void *)(v6 + 232) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 240);
  *(void *)(v8 + 240) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 264);
  *(void *)(v10 + 264) = 0;

  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 224);
  *(void *)(v12 + 224) = 0;

  uint64_t v14 = *(void *)(a1 + 32);
  v15 = *(void **)(v14 + 216);
  *(void *)(v14 + 216) = 0;

  uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 192) remoteProxy];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_169;
  v18[3] = &unk_26D22A8C0;
  v18[4] = *(void *)(a1 + 32);
  [v16 pingWithReply:v18];
}

void __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_169(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_2;
  block[3] = &unk_26D22A8C0;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

void __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_2(uint64_t a1)
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_3;
  activity_block[3] = &unk_26D22A8C0;
  activity_block[4] = *(void *)(a1 + 32);
  _os_activity_initiate(&dword_220998000, "Resume Connection To Game Controller Daemon", OS_ACTIVITY_FLAG_DETACHED, activity_block);
}

uint64_t __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resumeDaemonConnection];
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(*(void *)(a1 + 32) + 192) remoteProxy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  uint64_t v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2;
  int v7 = &unk_26D22C490;
  uint64_t v8 = v3;
  objc_msgSend(v2, "connectToControllerServiceWithClient:reply:");
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 216), a2);
    [*(id *)(a1 + 32) refreshControllers];
  }
  else if (gc_isInternalBuild())
  {
    uint64_t v8 = getGCLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_cold_1();
    }
  }
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_171(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(*(void *)(a1 + 32) + 192) remoteProxy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_172;
  id v7 = &unk_26D22C4B8;
  uint64_t v8 = v3;
  objc_msgSend(v2, "connectToPlayerIndicatorXPCProxyServiceWithClient:reply:");
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_172(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 224), a2);
  }
  else if (gc_isInternalBuild())
  {
    uint64_t v8 = getGCLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_172_cold_1();
    }
  }
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_174(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(*(void *)(a1 + 32) + 192) remoteProxy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_175;
  id v7 = &unk_26D22C4E0;
  uint64_t v8 = v3;
  objc_msgSend(v2, "connectToLightXPCProxyServiceWithClient:reply:");
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_175(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 232), a2);
  }
  else if (gc_isInternalBuild())
  {
    uint64_t v8 = getGCLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_175_cold_1();
    }
  }
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_177(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(*(void *)(a1 + 32) + 192) remoteProxy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_178;
  id v7 = &unk_26D22C508;
  uint64_t v8 = v3;
  objc_msgSend(v2, "connectToAdaptiveTriggersXPCProxyServiceWithClient:reply:");
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_178(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 240), a2);
  }
  else if (gc_isInternalBuild())
  {
    uint64_t v8 = getGCLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_178_cold_1();
    }
  }
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_180(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(*(void *)(a1 + 32) + 192) remoteProxy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_181;
  id v7 = &unk_26D22C530;
  uint64_t v8 = v3;
  objc_msgSend(v2, "connectToMotionXPCProxyServiceWithClient:reply:");
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_181(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 256), a2);
  }
  else if (gc_isInternalBuild())
  {
    uint64_t v8 = getGCLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_181_cold_1();
    }
  }
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_183(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(*(void *)(a1 + 32) + 192) remoteProxy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_184;
  id v7 = &unk_26D22C558;
  uint64_t v8 = v3;
  objc_msgSend(v2, "connectToBatteryXPCProxyServiceWithClient:reply:");
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_184(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 264), a2);
  }
  else if (gc_isInternalBuild())
  {
    uint64_t v8 = getGCLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_184_cold_1();
    }
  }
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_186(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(*(void *)(a1 + 32) + 192) remoteProxy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_187;
  id v7 = &unk_26D22C580;
  uint64_t v8 = v3;
  objc_msgSend(v2, "connectToSettingsXPCProxyServiceWithClient:reply:");
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_187(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 248), a2);
    [*(id *)(a1 + 32) updateEmulatedControllerEnabled];
  }
  else if (gc_isInternalBuild())
  {
    uint64_t v8 = getGCLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_187_cold_1();
    }
  }
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_189(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(*(void *)(a1 + 32) + 192) remoteProxy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_190;
  id v7 = &unk_26D22C5A8;
  uint64_t v8 = v3;
  objc_msgSend(v2, "connectToPhotoVideoXPCProxyServiceWithClient:reply:");
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_190(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 272), a2);
  }
  else if (gc_isInternalBuild())
  {
    uint64_t v8 = a1;
    v9 = getGCLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(*(void *)(v8 + 32) + 192);
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_INFO, "Could not connect to 'photo/video XPC proxy service' on connection %@: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_192(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(*(void *)(a1 + 32) + 192) remoteProxy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_193;
  id v7 = &unk_26D22C5D0;
  uint64_t v8 = v3;
  objc_msgSend(v2, "connectToGameIntentXPCProxyServiceWithClient:reply:");
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_193(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 280), a2);
  }
  else if (gc_isInternalBuild())
  {
    uint64_t v8 = a1;
    v9 = getGCLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(*(void *)(v8 + 32) + 192);
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_INFO, "Could not connect to 'game intent XPC proxy service' on connection %@: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_195(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(*(void *)(a1 + 32) + 192) remoteProxy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_196;
  id v7 = &unk_26D22C5F8;
  uint64_t v8 = v3;
  objc_msgSend(v2, "connectToSystemGestureXPCProxyServiceWithClient:reply:");
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_196(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 288), a2);
  }
  else if (gc_isInternalBuild())
  {
    uint64_t v8 = a1;
    v9 = getGCLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(*(void *)(v8 + 32) + 192);
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_INFO, "Could not connect to 'system gesture XPC proxy service' on connection %@: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

void __44___GCControllerManagerAppClient_controllers__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(*(void *)(a1 + 40) + 160) allValues];
  [v1 addObjectsFromArray:v2];
}

void __62___GCControllerManagerAppClient__onqueue_unpublishController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateCurrentControllerAndProfileForUnpublishedController:*(void *)(a1 + 40)];
  if (gc_isInternalBuild())
  {
    uint64_t v4 = getGCLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_INFO, "Posting GCControllerDidDisconnectNotification for controller: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  id v2 = +[GCAnalytics instance];
  [v2 unpublishController:*(void *)(a1 + 40)];

  [*(id *)(a1 + 40) setPublished:0];
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"GCControllerDidDisconnectNotification" object:*(void *)(a1 + 40) userInfo:0];
}

void __60___GCControllerManagerAppClient__onqueue_publishController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentController:*(void *)(a1 + 40)];
  if (gc_isInternalBuild())
  {
    uint64_t v4 = getGCLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_INFO, "Posting GCControllerDidConnectNotification for controller: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  id v2 = +[GCAnalytics instance];
  [v2 publishController:*(void *)(a1 + 40)];

  [*(id *)(a1 + 40) setPublished:1];
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"GCControllerDidConnectNotification" object:*(void *)(a1 + 40) userInfo:0];
}

void __64___GCControllerManagerAppClient_updateEmulatedControllerEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gc_isInternalBuild())
  {
    uint64_t v7 = getGCLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v2;
      _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_INFO, "emulatedControllerEnabled is: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  if ([v2 BOOLValue])
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v4 = +[NSUserDefaults standardUserDefaults];
    uint64_t v5 = [v4 valueForKey:@"GCEnableKeyboardMouseController"];
    uint64_t v3 = [v5 intValue];
  }
  int v6 = +[GCKeyboardControllerManager sharedInstance];
  [v6 setEmulatedControllerMapping:v3];
}

uint64_t __51___GCControllerManagerAppClient_onHIDServiceAdded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_refreshPublishedControllers");
}

void __86___GCControllerManagerAppClient_setProperty_forKey_forHIDServiceClientWithRegistryID___block_invoke(uint64_t a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 152);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v16 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
      int v8 = objc_msgSend(v7, "registryID", (void)v15);
      char v9 = [v8 isEqualToNumber:*(void *)(a1 + 40)];

      if (v9) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v25 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v10 = v7;

    if (!v10) {
      return;
    }
    if (gc_isInternalBuild())
    {
      int v11 = getGCLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v12 = *(void *)(a1 + 56);
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        uint64_t v20 = v13;
        __int16 v21 = 2112;
        uint64_t v22 = v12;
        __int16 v23 = 2112;
        uint64_t v24 = v14;
        _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_INFO, "[GCControllerManagerApp] setProperty: %@ forKey: %@ forHIDServiceClientWithRegistryID: %@", buf, 0x20u);
      }
    }
    IOHIDServiceClientSetProperty((IOHIDServiceClientRef)[v10 service], *(CFStringRef *)(a1 + 56), *(CFTypeRef *)(a1 + 48));
  }
  else
  {
LABEL_9:
    id v10 = v2;
  }
}

void __52___GCControllerManagerAppClient_startVideoRecording__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (gc_isInternalBuild())
    {
      uint64_t v4 = getGCLogger();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __52___GCControllerManagerAppClient_startVideoRecording__block_invoke_cold_1();
      }
LABEL_9:
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 272);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __52___GCControllerManagerAppClient_startVideoRecording__block_invoke_223;
    v8[3] = &unk_26D22B9F0;
    v8[4] = v5;
    [v6 onVideoRecordingStart:v8];
    if (gc_isInternalBuild())
    {
      uint64_t v4 = getGCLogger();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_INFO, "Video recording successfully started", v7, 2u);
      }
      goto LABEL_9;
    }
  }
}

void __52___GCControllerManagerAppClient_startVideoRecording__block_invoke_223(uint64_t a1, void *a2)
{
  id v3 = a2;
  int isInternalBuild = gc_isInternalBuild();
  if (!v3)
  {
    if (isInternalBuild)
    {
      int v8 = getGCLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)char v9 = 0;
        _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_INFO, "onVideoRecordingStart sucessfully finished", v9, 2u);
      }
    }
    uint64_t v6 = +[NSDate date];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v5 = *(NSObject **)(v7 + 320);
    *(void *)(v7 + 320) = v6;
    goto LABEL_7;
  }
  if (isInternalBuild)
  {
    uint64_t v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __52___GCControllerManagerAppClient_startVideoRecording__block_invoke_223_cold_1();
    }
LABEL_7:
  }
}

void __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5 || !gc_isInternalBuild())
  {
    if (v6) {
      goto LABEL_4;
    }
LABEL_12:
    uint64_t v7 = -1;
    goto LABEL_13;
  }
  char v9 = getGCLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_cold_2();
  }

  if (!v6) {
    goto LABEL_12;
  }
LABEL_4:
  [v6 UTF8String];
  uint64_t v7 = sandbox_extension_consume();
  if (v7 != -1)
  {
LABEL_13:
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    char v22 = *(unsigned char *)(a1 + 48);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_231;
    v15[3] = &unk_26D22C690;
    uint64_t v20 = v7;
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(a1 + 40);
    id v16 = v10;
    uint64_t v17 = v11;
    v19 = v21;
    id v18 = v12;
    uint64_t v13 = (void *)MEMORY[0x223C6E420](v15);
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v14 = [getRPScreenRecorderClass() sharedRecorder];
      [v14 exportClipToURL:v10 duration:v13 completionHandler:15.0];
    }
    else
    {
      uint64_t v14 = [getRPScreenRecorderClass() sharedRecorder];
      [v14 stopRecordingWithOutputURL:v10 completionHandler:v13];
    }

    _Block_object_dispose(v21, 8);
    goto LABEL_17;
  }
  if (gc_isInternalBuild())
  {
    int v8 = getGCLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_cold_1();
    }
  }
LABEL_17:
}

void __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_231(void *a1, void *a2)
{
  id v3 = a2;
  if (a1[8] != -1) {
    sandbox_extension_release();
  }
  int isInternalBuild = gc_isInternalBuild();
  if (!v3)
  {
    if (isInternalBuild)
    {
      uint64_t v13 = getGCLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = a1[4];
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v14;
        _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_INFO, "Video recording successfully stopped with url: %@", buf, 0xCu);
      }
    }
    id v6 = (void *)a1[4];
    uint64_t v7 = *(void **)(a1[5] + 272);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_232;
    v15[3] = &unk_26D22C668;
    int v8 = v6;
    id v10 = (void *)a1[6];
    uint64_t v9 = a1[7];
    id v16 = v8;
    uint64_t v19 = v9;
    id v11 = v10;
    uint64_t v12 = a1[5];
    id v17 = v11;
    uint64_t v18 = v12;
    [v7 onVideoRecordingStopWithURL:v8 reply:v15];

    id v5 = v16;
    goto LABEL_9;
  }
  if (isInternalBuild)
  {
    id v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_231_cold_1();
    }
LABEL_9:
  }
}

void __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_232(uint64_t a1, void *a2)
{
  id v3 = a2;
  int isInternalBuild = gc_isInternalBuild();
  if (!v3)
  {
    if (isInternalBuild)
    {
      uint64_t v13 = getGCLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        int v15 = 138412290;
        uint64_t v16 = v14;
        _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_INFO, "onVideoRecordingStopWithURL successfully finished with url: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    int v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    id v5 = +[GCAnalytics instance];
    uint64_t v7 = currentProcessBundleIdentifier();
    int v8 = [*(id *)(a1 + 40) detailedProductCategory];
    if (v6)
    {
      [v5 sendRPKitInstantCaptureSavedEventForBundleID:v7 productCategory:v8];
    }
    else
    {
      [*(id *)(*(void *)(a1 + 48) + 320) timeIntervalSinceNow];
      LODWORD(v10) = llround(-v9);
      [v5 sendRPKitManualRecordingSavedEventForBundleID:v7 productCategory:v8 duration:v10];
    }

    goto LABEL_10;
  }
  if (isInternalBuild)
  {
    id v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_232_cold_1();
    }
LABEL_10:
  }
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void **)(v11 + 320);
  *(void *)(v11 + 320) = 0;
}

void __47___GCControllerManagerAppClient_startBuffering__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int isInternalBuild = gc_isInternalBuild();
  if (v3)
  {
    if (isInternalBuild)
    {
      id v5 = getGCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __47___GCControllerManagerAppClient_startBuffering__block_invoke_cold_1();
      }
    }
  }
  else
  {
    if (isInternalBuild)
    {
      double v9 = getGCLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_INFO, "Clip buffering succesfully started", v10, 2u);
      }
    }
    uint64_t v6 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v6 + 314))
    {
      uint64_t v7 = +[GCAnalytics instance];
      int v8 = currentProcessBundleIdentifier();
      [v7 sendRPKitInstantCaptureBufferStartedEventForBundleID:v8];

      uint64_t v6 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v6 + 314) = 1;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 313) = 0;
}

void __46___GCControllerManagerAppClient_stopBuffering__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && gc_isInternalBuild())
  {
    uint64_t v4 = getGCLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __46___GCControllerManagerAppClient_stopBuffering__block_invoke_cold_1();
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 314) = 0;
}

void __69___GCControllerManagerAppClient_onScreenshotTriggeredWithController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (gc_isInternalBuild())
    {
      uint64_t v4 = getGCLogger();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __69___GCControllerManagerAppClient_onScreenshotTriggeredWithController___block_invoke_cold_1();
      }
    }
  }
  else
  {
    id v5 = +[GCAnalytics instance];
    uint64_t v6 = currentProcessBundleIdentifier();
    uint64_t v7 = [*(id *)(a1 + 32) detailedProductCategory];
    [v5 sendRPKitScreenshotSavedEventForBundleID:v6 productCategory:v7];
  }
}

void __71___GCControllerManagerAppClient_ControllerService__publishControllers___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) controllersQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __71___GCControllerManagerAppClient_ControllerService__publishControllers___block_invoke_2;
  v5[3] = &unk_26D22A8E8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_barrier_async(v2, v5);
}

void __71___GCControllerManagerAppClient_ControllerService__publishControllers___block_invoke_2(uint64_t a1)
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v17;
    *(void *)&long long v4 = 138412290;
    long long v14 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v2);
        }
        int v8 = *(void **)(*((void *)&v16 + 1) + 8 * v7);
        double v9 = objc_msgSend(v8, "identifier", v14);
        uint64_t v10 = [*(id *)(*(void *)(a1 + 40) + 176) member:v9];

        if (!v10)
        {
          if (gc_isInternalBuild())
          {
            uint64_t v11 = getGCLogger();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v14;
              uint64_t v21 = v9;
              _os_log_debug_impl(&dword_220998000, v11, OS_LOG_TYPE_DEBUG, "Publish controller: '%@'", buf, 0xCu);
            }
          }
          [*(id *)(*(void *)(a1 + 40) + 176) addObject:v9];
          objc_msgSend(*(id *)(a1 + 40), "_onqueue_addPendingController:", v8);
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v12 = [v2 countByEnumeratingWithState:&v16 objects:v22 count:16];
      uint64_t v5 = v12;
    }
    while (v12);
  }

  uint64_t v13 = [*(id *)(a1 + 40) controllersQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __71___GCControllerManagerAppClient_ControllerService__publishControllers___block_invoke_380;
  block[3] = &unk_26D22A8C0;
  block[4] = *(void *)(a1 + 40);
  dispatch_barrier_async(v13, block);
}

uint64_t __71___GCControllerManagerAppClient_ControllerService__publishControllers___block_invoke_380(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_refreshPublishedControllers");
}

void __88___GCControllerManagerAppClient_ControllerService__unpublishControllersWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) controllersQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __88___GCControllerManagerAppClient_ControllerService__unpublishControllersWithIdentifiers___block_invoke_2;
  v5[3] = &unk_26D22A8E8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_barrier_async(v2, v5);
}

uint64_t __88___GCControllerManagerAppClient_ControllerService__unpublishControllersWithIdentifiers___block_invoke_2(uint64_t a1)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v14;
    *(void *)&long long v4 = 138412290;
    long long v12 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        if (gc_isInternalBuild())
        {
          double v9 = getGCLogger();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v12;
            uint64_t v18 = v8;
            _os_log_debug_impl(&dword_220998000, v9, OS_LOG_TYPE_DEBUG, "Unpublish controller: '%@'", buf, 0xCu);
          }
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 168), "removeObject:", v8, v12, (void)v13);
        [*(id *)(*(void *)(a1 + 40) + 176) removeObject:v8];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v10 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
      uint64_t v5 = v10;
    }
    while (v10);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_onqueue_refreshPublishedControllers");
}

uint64_t __70___GCControllerManagerAppClient_ControllerService__refreshControllers__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 216);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __70___GCControllerManagerAppClient_ControllerService__refreshControllers__block_invoke_2;
  v4[3] = &unk_26D22C6E0;
  v4[4] = v1;
  return [v2 fetchControllerDescriptionsWithReply:v4];
}

void __70___GCControllerManagerAppClient_ControllerService__refreshControllers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = [*(id *)(a1 + 32) controllersQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __70___GCControllerManagerAppClient_ControllerService__refreshControllers__block_invoke_3;
  v7[3] = &unk_26D22A8E8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_barrier_async(v4, v7);
}

void __70___GCControllerManagerAppClient_ControllerService__refreshControllers__block_invoke_3(uint64_t a1)
{
  id v2 = +[NSSet setWithArray:*(void *)(a1 + 32)];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v3 = (void *)[*(id *)(*(void *)(a1 + 40) + 176) copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v33;
    *(void *)&long long v5 = 138412290;
    long long v26 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v32 + 1) + 8 * v8);
        uint64_t v10 = objc_msgSend(v2, "member:", v9, v26);

        if (!v10)
        {
          if (gc_isInternalBuild())
          {
            uint64_t v11 = getGCLogger();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v26;
              v38 = v9;
              _os_log_debug_impl(&dword_220998000, v11, OS_LOG_TYPE_DEBUG, "Unpublish controller: '%@'", buf, 0xCu);
            }
          }
          [*(id *)(*(void *)(a1 + 40) + 168) removeObject:v9];
          [*(id *)(*(void *)(a1 + 40) + 176) removeObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v12 = [v3 countByEnumeratingWithState:&v32 objects:v39 count:16];
      uint64_t v6 = v12;
    }
    while (v12);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v29;
    *(void *)&long long v15 = 138412290;
    long long v27 = v15;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v13);
        }
        long long v19 = *(void **)(*((void *)&v28 + 1) + 8 * v18);
        uint64_t v20 = objc_msgSend(v19, "identifier", v27, (void)v28);
        uint64_t v21 = [*(id *)(*(void *)(a1 + 40) + 176) member:v20];

        int isInternalBuild = gc_isInternalBuild();
        if (v21)
        {
          if (isInternalBuild)
          {
            __int16 v23 = getGCLogger();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v27;
              v38 = v20;
              _os_log_debug_impl(&dword_220998000, v23, OS_LOG_TYPE_DEBUG, "Update controller: '%@'", buf, 0xCu);
            }
          }
        }
        else
        {
          if (isInternalBuild)
          {
            uint64_t v24 = getGCLogger();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v27;
              v38 = v20;
              _os_log_debug_impl(&dword_220998000, v24, OS_LOG_TYPE_DEBUG, "Publish controller: '%@'", buf, 0xCu);
            }
          }
          [*(id *)(*(void *)(a1 + 40) + 176) addObject:v20];
        }
        objc_msgSend(*(id *)(a1 + 40), "_onqueue_addPendingController:", v19);

        ++v18;
      }
      while (v16 != v18);
      uint64_t v25 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
      uint64_t v16 = v25;
    }
    while (v25);
  }

  objc_msgSend(*(id *)(a1 + 40), "_onqueue_refreshPublishedControllers");
}

void __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_220998000, v0, v1, "Game Controller daemon connection invalidated.", v2, v3, v4, v5, v6);
}

void __49___GCControllerManagerAppClient__connectToDaemon__block_invoke_168_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_220998000, v0, v1, "Game Controller daemon connection interrupted.", v2, v3, v4, v5, v6);
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_1(__stack_chk_guard);
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_15(&dword_220998000, v0, v1, "Could not connect to 'controller service' on connection %@: %@");
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_172_cold_1()
{
  OUTLINED_FUNCTION_3_1(__stack_chk_guard);
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_15(&dword_220998000, v0, v1, "Could not connect to 'player indicator XPC proxy service' on connection %@: %@");
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_175_cold_1()
{
  OUTLINED_FUNCTION_3_1(__stack_chk_guard);
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_15(&dword_220998000, v0, v1, "Could not connect to 'light XPC proxy service' on connection %@: %@");
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_178_cold_1()
{
  OUTLINED_FUNCTION_3_1(__stack_chk_guard);
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_15(&dword_220998000, v0, v1, "Could not connect to 'adaptive triggers XPC proxy service' on connection %@: %@");
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_181_cold_1()
{
  OUTLINED_FUNCTION_3_1(__stack_chk_guard);
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_15(&dword_220998000, v0, v1, "Could not connect to 'motion XPC proxy service' on connection %@: %@");
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_184_cold_1()
{
  OUTLINED_FUNCTION_3_1(__stack_chk_guard);
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_15(&dword_220998000, v0, v1, "Could not connect to 'battery XPC proxy service' on connection %@: %@");
}

void __56___GCControllerManagerAppClient__resumeDaemonConnection__block_invoke_2_187_cold_1()
{
  OUTLINED_FUNCTION_3_1(__stack_chk_guard);
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_15(&dword_220998000, v0, v1, "Could not connect to 'settings XPC proxy service' on connection %@: %@");
}

void __52___GCControllerManagerAppClient_startVideoRecording__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_220998000, v0, v1, "Start of video recording session has failed, reason: %@", v2, v3, v4, v5, v6);
}

void __52___GCControllerManagerAppClient_startVideoRecording__block_invoke_223_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_220998000, v0, v1, "onVideoRecordingStart has failed, reason: %@", v2, v3, v4, v5, v6);
}

void __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_15(&dword_220998000, v0, v1, "Cannot consume extension token: %@ for url: %@");
}

void __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_220998000, v0, v1, "Daemon couldn't generate a valid URL", v2, v3, v4, v5, v6);
}

void __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_231_cold_1()
{
  OUTLINED_FUNCTION_3_1(__stack_chk_guard);
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_15(&dword_220998000, v0, v1, "Stop of video recording session with url %@ has failed, reason: %@");
}

void __80___GCControllerManagerAppClient_stopVideoRecordingWithClipBuffering_controller___block_invoke_232_cold_1()
{
  OUTLINED_FUNCTION_3_1(__stack_chk_guard);
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_15(&dword_220998000, v0, v1, "onVideoRecordingStopWithURL: %@ has failed, reason: %@");
}

void __47___GCControllerManagerAppClient_startBuffering__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_220998000, v0, v1, "Clip Buffering start failed with: %@", v2, v3, v4, v5, v6);
}

void __46___GCControllerManagerAppClient_stopBuffering__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_220998000, v0, v1, "Clip buffering stop failed with: %@", v2, v3, v4, v5, v6);
}

void __69___GCControllerManagerAppClient_onScreenshotTriggeredWithController___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_220998000, v0, v1, "Cannot take screenshot: %@", v2, v3, v4, v5, v6);
}

@end