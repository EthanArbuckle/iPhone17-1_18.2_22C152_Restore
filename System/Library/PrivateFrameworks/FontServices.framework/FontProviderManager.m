@interface FontProviderManager
+ (id)registeredFontsInfo:(BOOL)a3;
+ (id)sharedManager;
+ (void)registerFonts:(id)a3 enabled:(BOOL)a4 completionHandler:(id)a5;
+ (void)unregisterFonts:(id)a3 completionHandler:(id)a4;
+ (void)updateAppInfo;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (FontProviderManager)init;
- (NSDictionary)appSubscriptionIndo;
- (NSXPCConnection)connection;
- (id)appSubscriotionInfo;
- (id)normalizeURLs:(id)a3 addSandboxExtension:(BOOL)a4;
- (id)registeredFontsInfo:(BOOL)a3;
- (void)_registerFonts:(id)a3 enabled:(BOOL)a4 completionHandler:(id)a5;
- (void)_unregisterFonts:(id)a3 completionHandler:(id)a4;
- (void)_updateAppInfo;
- (void)ping;
- (void)setAppSubscriptionIndo:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation FontProviderManager

- (FontProviderManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)FontProviderManager;
  v2 = [(FontProviderManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(FontProviderManager *)v2 appSubscriotionInfo];
    appSubscriptionIndo = v3->_appSubscriptionIndo;
    v3->_appSubscriptionIndo = (NSDictionary *)v4;
  }
  return v3;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_4);
  }
  v2 = (void *)sharedManager_manager;
  return v2;
}

uint64_t __36__FontProviderManager_sharedManager__block_invoke()
{
  GSFontInitialize();
  sharedManager_manager = objc_alloc_init(FontProviderManager);
  return MEMORY[0x1F41817F8]();
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  [(FontProviderManager *)self ping];
  id v7 = +[FontProviderManager sharedManager];
  uint64_t v4 = [v7 connection];
  v5 = v4;
  if (v4)
  {
    [v4 auditToken];
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (NSXPCConnection)connection
{
  v2 = self;
  objc_sync_enter(v2);
  connection = v2->_connection;
  if (connection)
  {
    uint64_t v4 = connection;
  }
  else
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.FontServices.FontProviderLoader"];
    v6 = v2->_connection;
    v2->_connection = (NSXPCConnection *)v5;

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __33__FontProviderManager_connection__block_invoke;
    v19[3] = &unk_1E60B9B08;
    v19[4] = v2;
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:v19];
    id v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0DA4FE8];
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
    [v7 setClasses:v17 forSelector:sel_registerFonts_enabled_sceneID_appInfo_completionHandler_ argumentIndex:0 ofReply:0];
    [v7 setClasses:v10 forSelector:sel_registerFonts_enabled_sceneID_appInfo_completionHandler_ argumentIndex:0 ofReply:1];
    [v7 setClasses:v17 forSelector:sel_registerFonts_enabled_sceneID_appInfo_completionHandler_ argumentIndex:1 ofReply:1];
    [v7 setClasses:v17 forSelector:sel_unregisterFonts_appInfo_completionHandler_ argumentIndex:0 ofReply:0];
    [v7 setClasses:v10 forSelector:sel_unregisterFonts_appInfo_completionHandler_ argumentIndex:0 ofReply:1];
    [v7 setClasses:v17 forSelector:sel_unregisterFonts_appInfo_completionHandler_ argumentIndex:1 ofReply:1];
    [v7 setClasses:v17 forSelector:sel_registeredFontsInfo_appInfo_completionHandler_ argumentIndex:0 ofReply:1];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v7];
    [(NSXPCConnection *)v2->_connection resume];
    uint64_t v4 = v2->_connection;
  }
  objc_sync_exit(v2);

  return v4;
}

void __33__FontProviderManager_connection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FSLog_Debug(@"FontProvider", @"XPC connection for 'com.apple.FontServices.FontProviderLoader' was invalidated", a3, a4, a5, a6, a7, a8, v11);
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 8);
  *(void *)(v9 + 8) = 0;
}

- (id)normalizeURLs:(id)a3 addSandboxExtension:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  BOOL v7 = v4;
  if (v4) {
    [(FontProviderManager *)self auditToken];
  }
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v14 = [v13 objectForKey:@"NSCTFontFileURLAttribute"];
        if (v14)
        {
          uint64_t v15 = (void *)v14;
          uint64_t v16 = (void *)[v13 mutableCopy];
          v17 = [v15 absoluteURL];
          v18 = [v17 URLByStandardizingPath];

          [v16 setObject:v18 forKey:@"NSCTFontFileURLAttribute"];
          if (v7)
          {
            id v19 = [v18 path];
            uint64_t v20 = [v19 UTF8String];

            uint64_t v25 = v20;
            if (sandbox_check_by_audit_token())
            {
              v21 = (const char *)sandbox_extension_issue_file_to_process();
              if (v21)
              {
                uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", v21, strlen(v21) + 1, 1, v20);
                if (v22)
                {
                  v23 = (void *)v22;
                  [v16 setValue:v22 forKey:@"sandbox"];
                }
              }
            }
          }
          objc_msgSend(v8, "addObject:", v16, v25);
        }
        else
        {
          [v8 addObject:v13];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }

  return v8;
}

+ (void)registerFonts:(id)a3 enabled:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v7 = a5;
  +[FontProviderManager updateAppInfo];
  if ([v9 count])
  {
    v8 = +[FontProviderManager sharedManager];
    [v8 _registerFonts:v9 enabled:v6 completionHandler:v7];
  }
  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0], 0);
  }
}

- (void)_registerFonts:(id)a3 enabled:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(FontProviderManager *)self connection];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __64__FontProviderManager__registerFonts_enabled_completionHandler___block_invoke;
  v23[3] = &unk_1E60B9DF8;
  id v11 = v9;
  id v24 = v11;
  uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:v23];

  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x2050000000;
  uint64_t v13 = (void *)getUIWindowClass_softClass_0;
  uint64_t v29 = getUIWindowClass_softClass_0;
  if (!getUIWindowClass_softClass_0)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __getUIWindowClass_block_invoke_0;
    v25[3] = &unk_1E60B9D98;
    v25[4] = &v26;
    __getUIWindowClass_block_invoke_0((uint64_t)v25);
    uint64_t v13 = (void *)v27[3];
  }
  id v14 = v13;
  _Block_object_dispose(&v26, 8);
  uint64_t v15 = [v14 _applicationKeyWindow];
  uint64_t v16 = [v15 windowScene];
  v17 = [v16 _sceneIdentifier];

  NSLog(&cfstr_FontproviderGo.isa, v17);
  v18 = [(FontProviderManager *)self normalizeURLs:v8 addSandboxExtension:1];
  appSubscriptionIndo = self->_appSubscriptionIndo;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__FontProviderManager__registerFonts_enabled_completionHandler___block_invoke_2;
  v21[3] = &unk_1E60B9ED8;
  id v22 = v11;
  id v20 = v11;
  [v12 registerFonts:v18 enabled:v6 sceneID:v17 appInfo:appSubscriptionIndo completionHandler:v21];
}

void __64__FontProviderManager__registerFonts_enabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v6[0] = a2;
    v3 = (void *)MEMORY[0x1E4F1C978];
    id v4 = a2;
    uint64_t v5 = [v3 arrayWithObjects:v6 count:1];
    (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v5, 0);
  }
}

void __64__FontProviderManager__registerFonts_enabled_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.FontServices.FontProviderDidChange", 0, 0, 0);
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

+ (void)unregisterFonts:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  +[FontProviderManager updateAppInfo];
  if ([v7 count])
  {
    BOOL v6 = +[FontProviderManager sharedManager];
    [v6 _unregisterFonts:v7 completionHandler:v5];
  }
  else if (v5)
  {
    (*((void (**)(id, void, void))v5 + 2))(v5, MEMORY[0x1E4F1CBF0], 0);
  }
}

- (void)_unregisterFonts:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[FontProviderManager sharedManager];
  id v9 = [v8 connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__FontProviderManager__unregisterFonts_completionHandler___block_invoke;
  v17[3] = &unk_1E60B9DF8;
  id v10 = v6;
  id v18 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v17];

  uint64_t v12 = [(FontProviderManager *)self normalizeURLs:v7 addSandboxExtension:0];

  appSubscriptionIndo = self->_appSubscriptionIndo;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__FontProviderManager__unregisterFonts_completionHandler___block_invoke_2;
  v15[3] = &unk_1E60B9ED8;
  id v16 = v10;
  id v14 = v10;
  [v11 unregisterFonts:v12 appInfo:appSubscriptionIndo completionHandler:v15];
}

void __58__FontProviderManager__unregisterFonts_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v6[0] = a2;
    v3 = (void *)MEMORY[0x1E4F1C978];
    id v4 = a2;
    id v5 = [v3 arrayWithObjects:v6 count:1];
    (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v5, 0);
  }
}

void __58__FontProviderManager__unregisterFonts_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.FontServices.FontProviderDidChange", 0, 0, 0);
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

+ (id)registeredFontsInfo:(BOOL)a3
{
  BOOL v3 = a3;
  +[FontProviderManager updateAppInfo];
  id v4 = +[FontProviderManager sharedManager];
  id v5 = [v4 registeredFontsInfo:v3];

  return v5;
}

- (id)registeredFontsInfo:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FontProviderManager *)self connection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_43];

  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  uint64_t v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  appSubscriptionIndo = self->_appSubscriptionIndo;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__FontProviderManager_registeredFontsInfo___block_invoke_47;
  v10[3] = &unk_1E60B9F00;
  v10[4] = &v11;
  [v6 registeredFontsInfo:v3 appInfo:appSubscriptionIndo completionHandler:v10];
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __43__FontProviderManager_registeredFontsInfo___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __43__FontProviderManager_registeredFontsInfo___block_invoke_47(uint64_t a1, void *a2)
{
}

- (void)ping
{
  uint64_t v2 = [(FontProviderManager *)self connection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_50];

  [v3 ping:&__block_literal_global_52];
}

void __27__FontProviderManager_ping__block_invoke(uint64_t a1, uint64_t a2)
{
}

+ (void)updateAppInfo
{
  if (updateAppInfo_onceToken != -1) {
    dispatch_once(&updateAppInfo_onceToken, &__block_literal_global_54);
  }
}

void __36__FontProviderManager_updateAppInfo__block_invoke()
{
  id v0 = +[FontProviderManager sharedManager];
  [v0 _updateAppInfo];
}

- (void)_updateAppInfo
{
  id v3 = [(FontProviderManager *)self connection];
  id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_56];

  [v4 updateAppInfo:self->_appSubscriptionIndo];
}

void __37__FontProviderManager__updateAppInfo__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)appSubscriotionInfo
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 infoDictionary];

  id v4 = objc_opt_new();
  id v5 = [v3 objectForKey:@"FontProviderSubscriptionSupportInfo"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v40 = v4;
      uint64_t v6 = [v5 objectForKey:@"url"];
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        int v7 = 0;
      }
      else
      {
        NSLog(&cfstr_FontproviderSu.isa);
        int v7 = 1;
      }
      v42 = [v5 objectForKey:@"scheme"];
      if (!v42 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        NSLog(&cfstr_FontproviderSu_0.isa);
        int v7 = 1;
      }
      v43 = (void *)v6;
      v41 = v3;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      uint64_t v8 = [&unk_1F0DA1E88 countByEnumeratingWithState:&v52 objects:v58 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v53 != v10) {
              objc_enumerationMutation(&unk_1F0DA1E88);
            }
            uint64_t v12 = *(void *)(*((void *)&v52 + 1) + 8 * i);
            uint64_t v13 = [v5 objectForKey:v12];
            if (!v13)
            {
              uint64_t v15 = @"FontProvider subscription support: \"%@\" is missing";
LABEL_19:
              NSLog(&v15->isa, v12);
              int v7 = 1;
              goto LABEL_20;
            }
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
            uint64_t v15 = @"FontProvider subscription support: \"%@\" should be number";
            if ((isKindOfClass & 1) == 0) {
              goto LABEL_19;
            }
LABEL_20:
          }
          uint64_t v9 = [&unk_1F0DA1E88 countByEnumeratingWithState:&v52 objects:v58 count:16];
        }
        while (v9);
      }
      id v16 = [v5 objectForKey:@"test"];
      if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        NSLog(&cfstr_FontproviderSu_2.isa, @"test");
        id v3 = v41;
        v17 = v43;
      }
      else
      {
        v17 = v43;
        if (v43) {
          BOOL v18 = v42 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        int v19 = v18;
        id v3 = v41;
        if (((v19 | v7) & 1) == 0)
        {
          v39 = v16;
          [v41 objectForKey:*MEMORY[0x1E4F1CCB8]];
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v20 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v57 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v49;
            uint64_t v24 = *MEMORY[0x1E4F1CCA8];
            uint64_t v25 = *MEMORY[0x1E4F1CCB0];
            while (2)
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v49 != v23) {
                  objc_enumerationMutation(v20);
                }
                long long v27 = *(void **)(*((void *)&v48 + 1) + 8 * j);
                uint64_t v28 = [v27 objectForKey:v24];
                if ([v43 isEqualToString:v28])
                {
                  uint64_t v29 = [v27 objectForKey:v25];
                  char v30 = [v29 containsObject:v42];

                  if (v30)
                  {

                    v31 = objc_opt_new();
                    long long v44 = 0u;
                    long long v45 = 0u;
                    long long v46 = 0u;
                    long long v47 = 0u;
                    uint64_t v32 = [&unk_1F0DA1EA0 countByEnumeratingWithState:&v44 objects:v56 count:16];
                    id v3 = v41;
                    if (v32)
                    {
                      uint64_t v33 = v32;
                      uint64_t v34 = *(void *)v45;
                      do
                      {
                        for (uint64_t k = 0; k != v33; ++k)
                        {
                          if (*(void *)v45 != v34) {
                            objc_enumerationMutation(&unk_1F0DA1EA0);
                          }
                          uint64_t v36 = *(void *)(*((void *)&v44 + 1) + 8 * k);
                          v37 = [v5 objectForKey:v36];
                          if (v37) {
                            [v31 setObject:v37 forKey:v36];
                          }
                        }
                        uint64_t v33 = [&unk_1F0DA1EA0 countByEnumeratingWithState:&v44 objects:v56 count:16];
                      }
                      while (v33);
                    }
                    [v40 setObject:v31 forKey:@"FontProviderSubscriptionSupportInfo"];

                    v17 = v43;
                    goto LABEL_52;
                  }
                }
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v48 objects:v57 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }

          v17 = v43;
          NSLog(&cfstr_FontproviderSu_3.isa, v43, v42);
          id v3 = v41;
LABEL_52:

          id v16 = v39;
        }
      }

      id v4 = v40;
    }
  }

  return v4;
}

- (void)setConnection:(id)a3
{
}

- (NSDictionary)appSubscriptionIndo
{
  return self->_appSubscriptionIndo;
}

- (void)setAppSubscriptionIndo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSubscriptionIndo, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end