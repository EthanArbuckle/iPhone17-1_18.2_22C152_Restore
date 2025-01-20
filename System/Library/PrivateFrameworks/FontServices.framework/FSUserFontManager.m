@interface FSUserFontManager
+ ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
+ (double)secondsSinceLastAccessed:(id)a3;
+ (id)_UserFontManagerConnection;
+ (id)directoryNameFromIdentifier:(id)a3;
+ (id)fontProvidersSubscriptionSupportInfoAndFontFamiliesInstalled:(unint64_t *)a3 andRemovedCount:(unint64_t *)a4 andProfileFontsCount:(unint64_t *)a5;
+ (id)identifierFromDirectoryName:(id)a3;
+ (id)knownFontProviders;
+ (id)profileFontsInfo;
+ (id)registeredFamiliesForIdentifier:(id)a3 enabled:(BOOL)a4;
+ (id)registeredFontsForIdentifier:(id)a3 enabled:(BOOL)a4;
+ (id)registeredFontsInfoForIdentifier:(id)a3 enabled:(BOOL)a4 appInfo:(id)a5;
+ (id)resumeSuspendedFontFiles;
+ (id)suspendedFontProviders;
+ (id)userFontsInfo;
+ (id)xpcInterface;
+ (void)_removeAllUserFonts;
+ (void)deleteAppDialogWithIdentifier:(id)a3 completionHandler:(id)a4;
+ (void)enableOrDisablePersistentURLs:(id)a3 enabled:(BOOL)a4;
+ (void)installFonts:(id)a3 forIdentifier:(id)a4 enabled:(BOOL)a5 appInfo:(id)a6 completionHandler:(id)a7;
+ (void)reset;
+ (void)suspendFontProvider:(id)a3;
+ (void)synchronizeFontAssets:(id)a3;
+ (void)synchronizeFontProviders;
+ (void)synchronizeProfileFonts:(id)a3;
+ (void)uninstallFonts:(id)a3 forIdentifier:(id)a4 appInfo:(id)a5 completionHandler:(id)a6;
+ (void)unregisterAndRemoveFontFilesForIdentifier:(id)a3 completionHandler:(id)a4;
+ (void)updateAppInfo:(id)a3 forIdentifier:(id)a4;
@end

@implementation FSUserFontManager

+ (id)xpcInterface
{
  if (xpcInterface_onceToken != -1) {
    dispatch_once(&xpcInterface_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)xpcInterface_xpcInterface;
  return v2;
}

void __33__FSUserFontManager_xpcInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0DA5048];
  v1 = (void *)xpcInterface_xpcInterface;
  xpcInterface_xpcInterface = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, objc_opt_class(), 0);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
  [(id)xpcInterface_xpcInterface setClasses:v16 forSelector:sel_installFonts_forIdentifier_enabled_appInfo_completionHandler_ argumentIndex:0 ofReply:0];
  [(id)xpcInterface_xpcInterface setClasses:v10 forSelector:sel_installFonts_forIdentifier_enabled_appInfo_completionHandler_ argumentIndex:0 ofReply:1];
  [(id)xpcInterface_xpcInterface setClasses:v16 forSelector:sel_installFonts_forIdentifier_enabled_appInfo_completionHandler_ argumentIndex:1 ofReply:1];
  [(id)xpcInterface_xpcInterface setClasses:v16 forSelector:sel_uninstallFonts_forIdentifier_appInfo_completionHandler_ argumentIndex:0 ofReply:0];
  [(id)xpcInterface_xpcInterface setClasses:v10 forSelector:sel_uninstallFonts_forIdentifier_appInfo_completionHandler_ argumentIndex:0 ofReply:1];
  [(id)xpcInterface_xpcInterface setClasses:v16 forSelector:sel_uninstallFonts_forIdentifier_appInfo_completionHandler_ argumentIndex:1 ofReply:1];
  [(id)xpcInterface_xpcInterface setClasses:v16 forSelector:sel_registeredFontsInfoForIdentifier_enabled_appInfo_completionHandler_ argumentIndex:0 ofReply:1];
  [(id)xpcInterface_xpcInterface setClasses:v16 forSelector:sel_enableOrDisablePersistentURLs_enabled_completionHandler_ argumentIndex:0 ofReply:0];
  [(id)xpcInterface_xpcInterface setClasses:v10 forSelector:sel_enableOrDisablePersistentURLs_enabled_completionHandler_ argumentIndex:0 ofReply:1];
  [(id)xpcInterface_xpcInterface setClasses:v15 forSelector:sel_fontProvidersSubscriptionSupportInfo_ argumentIndex:0 ofReply:1];
}

+ (id)_UserFontManagerConnection
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (_UserFontManagerConnection_connection)
  {
    id v3 = (id)_UserFontManagerConnection_connection;
  }
  else
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.FontServices.UserFontManager"];
    uint64_t v5 = (void *)_UserFontManagerConnection_connection;
    _UserFontManagerConnection_connection = v4;

    [(id)_UserFontManagerConnection_connection setInvalidationHandler:&__block_literal_global_194];
    uint64_t v6 = +[FSUserFontManager xpcInterface];
    [(id)_UserFontManagerConnection_connection setRemoteObjectInterface:v6];
    [(id)_UserFontManagerConnection_connection resume];
    id v3 = (id)_UserFontManagerConnection_connection;
  }
  objc_sync_exit(v2);

  return v3;
}

void __47__FSUserFontManager__UserFontManagerConnection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog(@"FSUserFontManager", @"XPC connection for 'com.apple.FontServices.UserFontManager' was invalidated", a3, a4, a5, a6, a7, a8, vars0);
  v8 = (void *)_UserFontManagerConnection_connection;
  _UserFontManagerConnection_connection = 0;
}

+ ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  uint64_t v4 = [(id)objc_opt_class() _UserFontManagerConnection];
  id v8 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_201];

  [v8 ping:&__block_literal_global_206];
  uint64_t v5 = [(id)objc_opt_class() _UserFontManagerConnection];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 auditToken];
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

void __31__FSUserFontManager_auditToken__block_invoke(uint64_t a1, uint64_t a2)
{
}

+ (void)installFonts:(id)a3 forIdentifier:(id)a4 enabled:(BOOL)a5 appInfo:(id)a6 completionHandler:(id)a7
{
  BOOL v8 = a5;
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(id)objc_opt_class() _UserFontManagerConnection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __82__FSUserFontManager_installFonts_forIdentifier_enabled_appInfo_completionHandler___block_invoke;
  v21[3] = &unk_1E60B9DF8;
  id v16 = v11;
  id v22 = v16;
  v17 = [v15 remoteObjectProxyWithErrorHandler:v21];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __82__FSUserFontManager_installFonts_forIdentifier_enabled_appInfo_completionHandler___block_invoke_2;
  v19[3] = &unk_1E60B9ED8;
  id v20 = v16;
  id v18 = v16;
  [v17 installFonts:v14 forIdentifier:v13 enabled:v8 appInfo:v12 completionHandler:v19];
}

uint64_t __82__FSUserFontManager_installFonts_forIdentifier_enabled_appInfo_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(@"FSUserFontManager", @"xpc error: %s - %@", a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager installFonts:forIdentifier:enabled:appInfo:completionHandler:]_block_invoke");
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

uint64_t __82__FSUserFontManager_installFonts_forIdentifier_enabled_appInfo_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)uninstallFonts:(id)a3 forIdentifier:(id)a4 appInfo:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(id)objc_opt_class() _UserFontManagerConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76__FSUserFontManager_uninstallFonts_forIdentifier_appInfo_completionHandler___block_invoke;
  v19[3] = &unk_1E60B9DF8;
  id v14 = v9;
  id v20 = v14;
  v15 = [v13 remoteObjectProxyWithErrorHandler:v19];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__FSUserFontManager_uninstallFonts_forIdentifier_appInfo_completionHandler___block_invoke_2;
  v17[3] = &unk_1E60B9ED8;
  id v18 = v14;
  id v16 = v14;
  [v15 uninstallFonts:v12 forIdentifier:v11 appInfo:v10 completionHandler:v17];
}

uint64_t __76__FSUserFontManager_uninstallFonts_forIdentifier_appInfo_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(@"FSUserFontManager", @"xpc error: %s - %@", a3, a4, a5, a6, a7, a8, (uint64_t)"+[FSUserFontManager uninstallFonts:forIdentifier:appInfo:completionHandler:]_block_invoke");
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

uint64_t __76__FSUserFontManager_uninstallFonts_forIdentifier_appInfo_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)registeredFontsInfoForIdentifier:(id)a3 enabled:(BOOL)a4 appInfo:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = [(id)objc_opt_class() _UserFontManagerConnection];
  id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_209];

  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__FSUserFontManager_registeredFontsInfoForIdentifier_enabled_appInfo___block_invoke_210;
  v13[3] = &unk_1E60B9F00;
  v13[4] = &v14;
  [v10 registeredFontsInfoForIdentifier:v7 enabled:v6 appInfo:v8 completionHandler:v13];
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __70__FSUserFontManager_registeredFontsInfoForIdentifier_enabled_appInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __70__FSUserFontManager_registeredFontsInfoForIdentifier_enabled_appInfo___block_invoke_210(uint64_t a1, void *a2)
{
}

+ (id)registeredFontsForIdentifier:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = [(id)objc_opt_class() _UserFontManagerConnection];
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_213];

  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__FSUserFontManager_registeredFontsForIdentifier_enabled___block_invoke_2;
  v10[3] = &unk_1E60B9F00;
  v10[4] = &v11;
  [v7 registeredFontsForIdentifier:v5 enabled:v4 completionHandler:v10];
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __58__FSUserFontManager_registeredFontsForIdentifier_enabled___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__FSUserFontManager_registeredFontsForIdentifier_enabled___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (id)registeredFamiliesForIdentifier:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = [(id)objc_opt_class() _UserFontManagerConnection];
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_215];

  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__FSUserFontManager_registeredFamiliesForIdentifier_enabled___block_invoke_2;
  v10[3] = &unk_1E60B9F00;
  v10[4] = &v11;
  [v7 registeredFamiliesForIdentifier:v5 enabled:v4 completionHandler:v10];
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __61__FSUserFontManager_registeredFamiliesForIdentifier_enabled___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __61__FSUserFontManager_registeredFamiliesForIdentifier_enabled___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (void)deleteAppDialogWithIdentifier:(id)a3 completionHandler:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_class())
  {
    uint64_t v7 = +[FSUserFontManager registeredFamiliesForIdentifier:v5 enabled:1];
    if (v7) {
      id v8 = (void *)v7;
    }
    else {
      id v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v9 = [[DeleteAppFontsDialogHandler alloc] initWithCompletionHandler:v6];
    id v10 = (void *)_deleteAppFontsDialogHandler;
    _deleteAppFontsDialogHandler = (uint64_t)v9;

    v12[0] = @"registeredFonts";
    v12[1] = @"deleteAppIdentifier";
    v13[0] = v8;
    v13[1] = v5;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    [(id)_deleteAppFontsDialogHandler showDialogWithUserInfo:v11];
  }
}

+ (void)unregisterAndRemoveFontFilesForIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() _UserFontManagerConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__FSUserFontManager_unregisterAndRemoveFontFilesForIdentifier_completionHandler___block_invoke;
  void v13[3] = &unk_1E60B9DF8;
  id v8 = v5;
  id v14 = v8;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__FSUserFontManager_unregisterAndRemoveFontFilesForIdentifier_completionHandler___block_invoke_2;
  v11[3] = &unk_1E60B9DF8;
  id v12 = v8;
  id v10 = v8;
  [v9 unregisterAndRemoveFontFilesForIdentifier:v6 completionHandler:v11];
}

void __81__FSUserFontManager_unregisterAndRemoveFontFilesForIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  FSLog_Debug(@"FSUserFontManager", @"xpc error: %s - %@", v3, v4, v5, v6, v7, v8, (uint64_t)"+[FSUserFontManager unregisterAndRemoveFontFilesForIdentifier:completionHandler:]_block_invoke");
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
  }
}

uint64_t __81__FSUserFontManager_unregisterAndRemoveFontFilesForIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)enableOrDisablePersistentURLs:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [(id)objc_opt_class() _UserFontManagerConnection];
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_224];

  [v7 enableOrDisablePersistentURLs:v5 enabled:v4 completionHandler:&__block_literal_global_226];
}

void __59__FSUserFontManager_enableOrDisablePersistentURLs_enabled___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59__FSUserFontManager_enableOrDisablePersistentURLs_enabled___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2) {
    FSLog_Error(@"FSUserFontManager", @"enableOrDisablePersistentURLs errors - %@", a3, a4, a5, a6, a7, a8, a2);
  }
}

+ (id)userFontsInfo
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  id v2 = [(id)objc_opt_class() _UserFontManagerConnection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_231];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__FSUserFontManager_userFontsInfo__block_invoke_2;
  v6[3] = &unk_1E60BA008;
  v6[4] = &v7;
  [v3 userFontsInfo:v6];
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __34__FSUserFontManager_userFontsInfo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __34__FSUserFontManager_userFontsInfo__block_invoke_2(uint64_t a1, void *a2)
{
}

+ (id)profileFontsInfo
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  id v2 = [(id)objc_opt_class() _UserFontManagerConnection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_234];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__FSUserFontManager_profileFontsInfo__block_invoke_2;
  v6[3] = &unk_1E60BA008;
  v6[4] = &v7;
  [v3 profileFontsInfo:v6];
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __37__FSUserFontManager_profileFontsInfo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __37__FSUserFontManager_profileFontsInfo__block_invoke_2(uint64_t a1, void *a2)
{
}

+ (id)directoryNameFromIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  id v4 = [(id)objc_opt_class() _UserFontManagerConnection];
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_236];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__FSUserFontManager_directoryNameFromIdentifier___block_invoke_2;
  v8[3] = &unk_1E60BA030;
  v8[4] = &v9;
  [v5 directoryNameFromIdentifier:v3 completionHandler:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __49__FSUserFontManager_directoryNameFromIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__FSUserFontManager_directoryNameFromIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (double)secondsSinceLastAccessed:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  id v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  id v4 = [(id)objc_opt_class() _UserFontManagerConnection];
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_239];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__FSUserFontManager_secondsSinceLastAccessed___block_invoke_2;
  v8[3] = &unk_1E60BA058;
  v8[4] = &v9;
  [v5 secondsSinceLastAccessed:v3 completionHandler:v8];
  double v6 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __46__FSUserFontManager_secondsSinceLastAccessed___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t __46__FSUserFontManager_secondsSinceLastAccessed___block_invoke_2(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (id)fontProvidersSubscriptionSupportInfoAndFontFamiliesInstalled:(unint64_t *)a3 andRemovedCount:(unint64_t *)a4 andProfileFontsCount:(unint64_t *)a5
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  uint64_t v8 = [(id)objc_opt_class() _UserFontManagerConnection];
  uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_242];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __119__FSUserFontManager_fontProvidersSubscriptionSupportInfoAndFontFamiliesInstalled_andRemovedCount_andProfileFontsCount___block_invoke_2;
  v12[3] = &unk_1E60BA080;
  v12[4] = &v13;
  v12[5] = a3;
  v12[6] = a4;
  v12[7] = a5;
  [v9 fontProvidersSubscriptionSupportInfo:v12];
  id v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v10;
}

void __119__FSUserFontManager_fontProvidersSubscriptionSupportInfoAndFontFamiliesInstalled_andRemovedCount_andProfileFontsCount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __119__FSUserFontManager_fontProvidersSubscriptionSupportInfoAndFontFamiliesInstalled_andRemovedCount_andProfileFontsCount___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v10 = a2;
  uint64_t v11 = *(void **)(a1 + 48);
  **(void **)(a1 + 40) = a3;
  void *v11 = a4;
  **(void **)(a1 + 56) = a5;
}

+ (id)resumeSuspendedFontFiles
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  id v2 = [(id)objc_opt_class() _UserFontManagerConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_245];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__FSUserFontManager_resumeSuspendedFontFiles__block_invoke_2;
  v6[3] = &unk_1E60BA008;
  v6[4] = &v7;
  [v3 resumeSuspendedFontFiles:v6];
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __45__FSUserFontManager_resumeSuspendedFontFiles__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45__FSUserFontManager_resumeSuspendedFontFiles__block_invoke_2(uint64_t a1, void *a2)
{
}

+ (void)suspendFontProvider:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _UserFontManagerConnection];
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_247];

  [v5 suspendFontProvider:v3 completionHandler:&__block_literal_global_249];
}

void __41__FSUserFontManager_suspendFontProvider___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (id)suspendedFontProviders
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  id v2 = [(id)objc_opt_class() _UserFontManagerConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_251];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__FSUserFontManager_suspendedFontProviders__block_invoke_2;
  v6[3] = &unk_1E60B9F00;
  v6[4] = &v7;
  [v3 suspendedFontProviders:v6];
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __43__FSUserFontManager_suspendedFontProviders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __43__FSUserFontManager_suspendedFontProviders__block_invoke_2(uint64_t a1, void *a2)
{
}

+ (id)knownFontProviders
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  id v2 = [(id)objc_opt_class() _UserFontManagerConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_253];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__FSUserFontManager_knownFontProviders__block_invoke_2;
  v6[3] = &unk_1E60B9F00;
  v6[4] = &v7;
  [v3 knownFontProviders:v6];
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __39__FSUserFontManager_knownFontProviders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__FSUserFontManager_knownFontProviders__block_invoke_2(uint64_t a1, void *a2)
{
}

+ (void)synchronizeFontProviders
{
  id v2 = [(id)objc_opt_class() _UserFontManagerConnection];
  id v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_255];

  [v3 synchronizeFontProviders:&__block_literal_global_258];
}

void __45__FSUserFontManager_synchronizeFontProviders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)updateAppInfo:(id)a3 forIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() _UserFontManagerConnection];
  id v8 = [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_260];

  [v8 updateAppInfo:v6 forIdentifier:v5];
}

void __49__FSUserFontManager_updateAppInfo_forIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (id)identifierFromDirectoryName:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  id v4 = [(id)objc_opt_class() _UserFontManagerConnection];
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_262];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__FSUserFontManager_identifierFromDirectoryName___block_invoke_2;
  v8[3] = &unk_1E60BA030;
  v8[4] = &v9;
  [v5 identifierFromDirectoryName:v3 completionHandler:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __49__FSUserFontManager_identifierFromDirectoryName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__FSUserFontManager_identifierFromDirectoryName___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (void)reset
{
  id v2 = [(id)objc_opt_class() _UserFontManagerConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_264];

  [v3 reset];
}

void __26__FSUserFontManager_reset__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_removeAllUserFonts
{
  id v2 = [(id)objc_opt_class() _UserFontManagerConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_266];

  [v3 _removeAllUserFonts];
}

void __40__FSUserFontManager__removeAllUserFonts__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)synchronizeFontAssets:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _UserFontManagerConnection];
  id v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_268];

  [v5 synchronizeFontAssets:v3];
}

void __43__FSUserFontManager_synchronizeFontAssets___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)synchronizeProfileFonts:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _UserFontManagerConnection];
  id v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_270];

  [v5 synchronizeProfileFonts:v3];
}

void __45__FSUserFontManager_synchronizeProfileFonts___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end