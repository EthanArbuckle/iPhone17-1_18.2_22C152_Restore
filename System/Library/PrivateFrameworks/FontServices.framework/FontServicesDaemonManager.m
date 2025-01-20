@interface FontServicesDaemonManager
+ (id)sharedManager;
- (NSXPCConnection)connection;
- (void)accessFontAsset:(id)a3;
- (void)checkin:(id)a3 reply:(id)a4;
- (void)checkinForFontPicker:(id)a3;
- (void)checkinForWebKitProcess:(id)a3 reply:(id)a4;
- (void)fontAddedInfo:(id)a3 addedURLStrings:(id)a4 removedURLStrings:(id)a5;
- (void)fontChanged:(id)a3 reply:(id)a4;
- (void)requestFonts:(id)a3 forClient:(id)a4;
- (void)requestFonts:(id)a3 reply:(id)a4;
- (void)resetIssuedFontsFor:(id)a3;
- (void)resumeAndShowAlertForSuspendedFontProviders;
- (void)scheduleFontFilesDeletion:(id)a3;
- (void)setConnection:(id)a3;
- (void)synchronizeFontAssets:(id)a3 reply:(id)a4;
- (void)updatingUserFonts:(id)a3;
@end

@implementation FontServicesDaemonManager

uint64_t __43__FontServicesDaemonManager_checkin_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __39__FontServicesDaemonManager_connection__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t __43__FontServicesDaemonManager_checkin_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Error(@"ServicesDaemonManager", @"xpc error: %s - %@", a3, a4, a5, a6, a7, a8, (uint64_t)"-[FontServicesDaemonManager checkin:reply:]_block_invoke");
  v9 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v9();
}

uint64_t __42__FontServicesDaemonManager_sharedManager__block_invoke()
{
  sharedManager_sSharedInstance = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedManager_sSharedInstance;
  return v2;
}

- (void)checkin:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(FontServicesDaemonManager *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __43__FontServicesDaemonManager_checkin_reply___block_invoke;
  v14[3] = &unk_1E60B9DF8;
  id v9 = v6;
  id v15 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v14];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__FontServicesDaemonManager_checkin_reply___block_invoke_2;
  v12[3] = &unk_1E60B9E20;
  id v13 = v9;
  id v11 = v9;
  [v10 checkin:v7 reply:v12];
}

- (NSXPCConnection)connection
{
  v2 = self;
  objc_sync_enter(v2);
  connection = v2->_connection;
  if (!connection)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.fontservicesd" options:0];
    v5 = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0DA4F88];
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    id v13 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
    [v6 setClasses:v13 forSelector:sel_checkin_reply_ argumentIndex:0 ofReply:1];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v6];
    v14 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0DA2E80];
    [(NSXPCConnection *)v2->_connection setExportedInterface:v14];
    [(NSXPCConnection *)v2->_connection setExportedObject:v2];
    [(NSXPCConnection *)v2->_connection setInterruptionHandler:&__block_literal_global_80];
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:&__block_literal_global_85];
    [(NSXPCConnection *)v2->_connection resume];

    connection = v2->_connection;
  }
  id v15 = connection;
  objc_sync_exit(v2);

  return v15;
}

- (void)fontAddedInfo:(id)a3 addedURLStrings:(id)a4 removedURLStrings:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v16 = a3;
  uint64_t v9 = [v8 count];
  [v7 count];
  FSLog_Debug(@"ServicesDaemonManager", @"font change notification - add: %d, remove:%d", v10, v11, v12, v13, v14, v15, v9);
  GSFontChangeNotificationHandler();
}

- (void)checkinForFontPicker:(id)a3
{
  id v4 = a3;
  v5 = [(FontServicesDaemonManager *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__FontServicesDaemonManager_checkinForFontPicker___block_invoke;
  v11[3] = &unk_1E60B9DF8;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__FontServicesDaemonManager_checkinForFontPicker___block_invoke_2;
  v9[3] = &unk_1E60B9E20;
  id v10 = v6;
  id v8 = v6;
  [v7 checkinForFontPicker:v9];
}

uint64_t __50__FontServicesDaemonManager_checkinForFontPicker___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(@"ServicesDaemonManager", @"xpc error: %s - %@", a3, a4, a5, a6, a7, a8, (uint64_t)"-[FontServicesDaemonManager checkinForFontPicker:]_block_invoke");
  uint64_t v9 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v9();
}

uint64_t __50__FontServicesDaemonManager_checkinForFontPicker___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestFonts:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FontServicesDaemonManager *)self connection];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __48__FontServicesDaemonManager_requestFonts_reply___block_invoke;
  v25[3] = &unk_1E60B9DF8;
  id v9 = v7;
  id v26 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v25];

  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  uint64_t v11 = (void *)getUIWindowClass_softClass;
  uint64_t v31 = getUIWindowClass_softClass;
  if (!getUIWindowClass_softClass)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __getUIWindowClass_block_invoke;
    v27[3] = &unk_1E60B9D98;
    v27[4] = &v28;
    __getUIWindowClass_block_invoke((uint64_t)v27);
    uint64_t v11 = (void *)v29[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v28, 8);
  uint64_t v13 = [v12 _applicationKeyWindow];
  uint64_t v14 = [v13 windowScene];
  uint64_t v15 = [v14 _sceneIdentifier];

  FSLog_Debug(@"ServicesDaemonManager", @"got sceneID: %@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __48__FontServicesDaemonManager_requestFonts_reply___block_invoke_2;
  v23[3] = &unk_1E60B9E20;
  id v24 = v9;
  id v22 = v9;
  [v10 requestFonts:v6 sceneID:v15 reply:v23];
}

uint64_t __48__FontServicesDaemonManager_requestFonts_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(@"ServicesDaemonManager", @"xpc error: %s - %@", a3, a4, a5, a6, a7, a8, (uint64_t)"-[FontServicesDaemonManager requestFonts:reply:]_block_invoke");
  id v9 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v9();
}

uint64_t __48__FontServicesDaemonManager_requestFonts_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestFonts:(id)a3 forClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FontServicesDaemonManager *)self connection];
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_11];

  [v9 requestFonts:v7 forClient:v6 reply:&__block_literal_global_14];
}

void __52__FontServicesDaemonManager_requestFonts_forClient___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fontChanged:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FontServicesDaemonManager *)self connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_16];

  [v9 fontChanged:v7 reply:v6];
}

void __47__FontServicesDaemonManager_fontChanged_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)resumeAndShowAlertForSuspendedFontProviders
{
  v2 = [(FontServicesDaemonManager *)self connection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_18];

  [v3 resumeAndShowAlertForSuspendedFontProviders:&__block_literal_global_20];
}

void __72__FontServicesDaemonManager_resumeAndShowAlertForSuspendedFontProviders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updatingUserFonts:(id)a3
{
  id v4 = a3;
  v5 = [(FontServicesDaemonManager *)self connection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_22];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__FontServicesDaemonManager_updatingUserFonts___block_invoke_2;
  v8[3] = &unk_1E60B9E68;
  id v9 = v4;
  id v7 = v4;
  [v6 updatingUserFonts:v8];
}

void __47__FontServicesDaemonManager_updatingUserFonts___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t __47__FontServicesDaemonManager_updatingUserFonts___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetIssuedFontsFor:(id)a3
{
  id v4 = a3;
  v5 = [(FontServicesDaemonManager *)self connection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_24];

  [v6 resetIssuedFontsFor:v4 reply:&__block_literal_global_26];
}

void __49__FontServicesDaemonManager_resetIssuedFontsFor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)checkinForWebKitProcess:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FontServicesDaemonManager *)self connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_28];

  [v9 checkinForWebKitProcess:v7 reply:v6];
}

void __59__FontServicesDaemonManager_checkinForWebKitProcess_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)synchronizeFontAssets:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FontServicesDaemonManager *)self connection];
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_30];

  [v9 synchronizeFontAssets:v7 reply:v6];
}

void __57__FontServicesDaemonManager_synchronizeFontAssets_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)accessFontAsset:(id)a3
{
  id v4 = a3;
  v5 = [(FontServicesDaemonManager *)self connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_32];

  [v6 accessFontAsset:v4];
}

void __45__FontServicesDaemonManager_accessFontAsset___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)scheduleFontFilesDeletion:(id)a3
{
  id v4 = a3;
  v5 = [(FontServicesDaemonManager *)self connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_34];

  [v6 scheduleFontFilesDeletion:v4];
}

void __55__FontServicesDaemonManager_scheduleFontFilesDeletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__FontServicesDaemonManager_connection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end