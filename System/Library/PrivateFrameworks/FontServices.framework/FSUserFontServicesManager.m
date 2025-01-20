@interface FSUserFontServicesManager
+ (id)_UserFontServicesConnection;
+ (void)GSFontEnableOrDisablePersistentURLs:(id)a3 forProfileFonts:(BOOL)a4 enabled:(BOOL)a5 suspend:(BOOL)a6 withReply:(id)a7;
+ (void)GSFontRegisterPersistentURLs:(id)a3 enabled:(BOOL)a4 forProfileFonts:(BOOL)a5 withReply:(id)a6;
+ (void)GSFontUnregisterPersistentURLs:(id)a3 forProfileFonts:(BOOL)a4 withReply:(id)a5;
@end

@implementation FSUserFontServicesManager

+ (id)_UserFontServicesConnection
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (_UserFontServicesConnection_connection)
  {
    id v3 = (id)_UserFontServicesConnection_connection;
  }
  else
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.FontServices.UserFontServices"];
    v5 = (void *)_UserFontServicesConnection_connection;
    _UserFontServicesConnection_connection = v4;

    [(id)_UserFontServicesConnection_connection setInvalidationHandler:&__block_literal_global_8];
    v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0DA50A8];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    [v6 setClasses:v9 forSelector:sel_GSFontRegisterPersistentURLs_enabled_forProfileFonts_withReply_ argumentIndex:0 ofReply:0];
    [v6 setClasses:v9 forSelector:sel_GSFontUnregisterPersistentURLs_forProfileFonts_withReply_ argumentIndex:0 ofReply:0];
    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v18, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0);
    [v6 setClasses:v15 forSelector:sel_GSFontRegisterPersistentURLs_enabled_forProfileFonts_withReply_ argumentIndex:0 ofReply:1];
    [v6 setClasses:v15 forSelector:sel_GSFontUnregisterPersistentURLs_forProfileFonts_withReply_ argumentIndex:0 ofReply:1];
    [v6 setClasses:v9 forSelector:sel_GSFontEnableOrDisablePersistentURLs_forProfileFonts_enabled_suspend_withReply_ argumentIndex:0 ofReply:0];
    [v6 setClasses:v9 forSelector:sel_GSFontEnableOrDisablePersistentURLs_forProfileFonts_enabled_suspend_withReply_ argumentIndex:0 ofReply:1];
    id v16 = v6;
    [(id)_UserFontServicesConnection_connection setRemoteObjectInterface:v16];
    [(id)_UserFontServicesConnection_connection resume];
    id v3 = (id)_UserFontServicesConnection_connection;
  }
  objc_sync_exit(v2);

  return v3;
}

void __56__FSUserFontServicesManager__UserFontServicesConnection__block_invoke()
{
  NSLog(&cfstr_Fsuserfontmana_24.isa);
  v0 = (void *)_UserFontServicesConnection_connection;
  _UserFontServicesConnection_connection = 0;
}

+ (void)GSFontRegisterPersistentURLs:(id)a3 enabled:(BOOL)a4 forProfileFonts:(BOOL)a5 withReply:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = a3;
  uint64_t v11 = [(id)objc_opt_class() _UserFontServicesConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__FSUserFontServicesManager_GSFontRegisterPersistentURLs_enabled_forProfileFonts_withReply___block_invoke;
  v14[3] = &unk_1E60B9DF8;
  id v15 = v9;
  id v12 = v9;
  uint64_t v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v14];

  [v13 GSFontRegisterPersistentURLs:v10 enabled:v7 forProfileFonts:v6 withReply:v12];
}

uint64_t __92__FSUserFontServicesManager_GSFontRegisterPersistentURLs_enabled_forProfileFonts_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)GSFontUnregisterPersistentURLs:(id)a3 forProfileFonts:(BOOL)a4 withReply:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = [(id)objc_opt_class() _UserFontServicesConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__FSUserFontServicesManager_GSFontUnregisterPersistentURLs_forProfileFonts_withReply___block_invoke;
  v12[3] = &unk_1E60B9DF8;
  id v13 = v7;
  id v10 = v7;
  uint64_t v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v12];

  [v11 GSFontUnregisterPersistentURLs:v8 forProfileFonts:v5 withReply:v10];
}

uint64_t __86__FSUserFontServicesManager_GSFontUnregisterPersistentURLs_forProfileFonts_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)GSFontEnableOrDisablePersistentURLs:(id)a3 forProfileFonts:(BOOL)a4 enabled:(BOOL)a5 suspend:(BOOL)a6 withReply:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = a7;
  id v13 = [(id)objc_opt_class() _UserFontServicesConnection];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __107__FSUserFontServicesManager_GSFontEnableOrDisablePersistentURLs_forProfileFonts_enabled_suspend_withReply___block_invoke;
  v20 = &unk_1E60BA0F8;
  id v21 = v11;
  id v22 = v12;
  id v14 = v11;
  id v15 = v12;
  id v16 = [v13 synchronousRemoteObjectProxyWithErrorHandler:&v17];

  objc_msgSend(v16, "GSFontEnableOrDisablePersistentURLs:forProfileFonts:enabled:suspend:withReply:", v14, v10, v9, v8, v15, v17, v18, v19, v20);
}

uint64_t __107__FSUserFontServicesManager_GSFontEnableOrDisablePersistentURLs_forProfileFonts_enabled_suspend_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end