@interface MAMusicHapticsManager
+ (BOOL)musicHapticsEnabled;
+ (MAMusicHapticsManager)sharedManager;
- (AXUIClient)client;
- (BOOL)musicHapticsActive;
- (BOOL)musicHapticsEnabled;
- (BOOL)treatCodesAsAdamIDs;
- (BOOL)userInterfaceClient:(id)a3 messageFromServerForWithIdentifierShouldBeProcessedAsynchronously:(unint64_t)a4;
- (MAMusicHapticsManager)init;
- (NSMutableDictionary)ahapAvailableCache;
- (NSMutableDictionary)ahapAvailableObservers;
- (NSMutableDictionary)appSupportedObservers;
- (NSMutableDictionary)appSupportsCache;
- (NSMutableDictionary)pendingAvailableObservers;
- (NSMutableDictionary)statusObservers;
- (id)_hapticMusicServerClient;
- (id)_serviceName;
- (id)addStatusObserver:(id)a3;
- (id)addStatusObserverBlock:(id)a3;
- (void)_clearAHAPCache;
- (void)appSupportsMusicHaptics:(id)a3 completionHandler:(id)a4;
- (void)checkHapticTrackAvailabilityForMediaMatchingCode:(id)a3 completionHandler:(id)a4;
- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3;
- (void)removeStatusObserver:(id)a3;
- (void)setAhapAvailableCache:(id)a3;
- (void)setAhapAvailableObservers:(id)a3;
- (void)setAppSupportedObservers:(id)a3;
- (void)setAppSupportsCache:(id)a3;
- (void)setClient:(id)a3;
- (void)setMusicHapticsActive:(BOOL)a3;
- (void)setPendingAvailableObservers:(id)a3;
- (void)setStatusObservers:(id)a3;
- (void)setTreatCodesAsAdamIDs:(BOOL)a3;
- (void)userInterfaceClient:(id)a3 processMessageFromServerAsynchronously:(id)a4 withIdentifier:(unint64_t)a5 completion:(id)a6;
@end

@implementation MAMusicHapticsManager

+ (MAMusicHapticsManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedManager_Manager;

  return (MAMusicHapticsManager *)v2;
}

uint64_t __38__MAMusicHapticsManager_sharedManager__block_invoke()
{
  sharedManager_Manager = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (MAMusicHapticsManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)MAMusicHapticsManager;
  v2 = [(MAMusicHapticsManager *)&v13 init];
  v3 = [getAXSettingsClass() sharedInstance];
  v4 = [v3 valueForKey:@"hapticMusicActive"];
  -[MAMusicHapticsManager setMusicHapticsActive:](v2, "setMusicHapticsActive:", [v4 BOOLValue]);

  v5 = [getAXSettingsClass() sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __29__MAMusicHapticsManager_init__block_invoke;
  v11[3] = &unk_1E6223960;
  v6 = v2;
  v12 = v6;
  [v5 registerUpdateBlock:v11 forRetrieveSelector:sel_hapticMusicActive withListener:v6];

  v7 = objc_opt_new();
  [(MAMusicHapticsManager *)v6 setAhapAvailableCache:v7];

  v8 = objc_opt_new();
  [(MAMusicHapticsManager *)v6 setAppSupportsCache:v8];

  v9 = objc_opt_new();
  [(MAMusicHapticsManager *)v6 setPendingAvailableObservers:v9];

  [(MAMusicHapticsManager *)v6 _clearAHAPCache];
  return v6;
}

void __29__MAMusicHapticsManager_init__block_invoke(uint64_t a1)
{
  id v3 = [getAXSettingsClass() sharedInstance];
  v2 = [v3 valueForKey:@"hapticMusicActive"];
  objc_msgSend(*(id *)(a1 + 32), "setMusicHapticsActive:", objc_msgSend(v2, "BOOLValue"));
}

- (BOOL)musicHapticsEnabled
{
  return soft_AXSHapticMusicEnabled() != 0;
}

- (void)_clearAHAPCache
{
  dispatch_time_t v3 = dispatch_time(0, 86400000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__MAMusicHapticsManager__clearAHAPCache__block_invoke;
  block[3] = &unk_1E6223960;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

uint64_t __40__MAMusicHapticsManager__clearAHAPCache__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) ahapAvailableCache];
  [v2 removeAllObjects];

  dispatch_time_t v3 = *(void **)(a1 + 32);

  return [v3 _clearAHAPCache];
}

+ (BOOL)musicHapticsEnabled
{
  return soft_AXSHapticMusicEnabled() != 0;
}

- (id)_serviceName
{
  return @"AXHapticMusicServer";
}

- (id)_hapticMusicServerClient
{
  dispatch_time_t v3 = [(MAMusicHapticsManager *)self client];

  if (!v3)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2050000000;
    v4 = (void *)getAXUIClientClass_softClass;
    uint64_t v20 = getAXUIClientClass_softClass;
    if (!getAXUIClientClass_softClass)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __getAXUIClientClass_block_invoke;
      v16[3] = &unk_1E6223850;
      v16[4] = &v17;
      __getAXUIClientClass_block_invoke((uint64_t)v16);
      v4 = (void *)v18[3];
    }
    v5 = v4;
    _Block_object_dispose(&v17, 8);
    id v6 = [v5 alloc];
    v7 = NSString;
    v8 = [MEMORY[0x1E4F28B50] mainBundle];
    v9 = [v8 bundleIdentifier];
    v10 = [v7 stringWithFormat:@"HapticMusicClientAPI-%@", v9];
    v11 = [(MAMusicHapticsManager *)self _serviceName];
    v12 = (void *)[v6 initWithIdentifier:v10 serviceBundleName:v11];
    [(MAMusicHapticsManager *)self setClient:v12];

    objc_super v13 = [(MAMusicHapticsManager *)self client];
    [v13 setDelegate:self];
  }
  v14 = [(MAMusicHapticsManager *)self client];

  return v14;
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
}

- (void)appSupportsMusicHaptics:(id)a3 completionHandler:(id)a4
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = HMLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[MAMusicHapticsManager appSupportsMusicHaptics:completionHandler:]((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
  }

  if (v7)
  {
    if (v6)
    {
      v15 = [(MAMusicHapticsManager *)self appSupportsCache];
      v16 = [v15 objectForKeyedSubscript:v6];

      if (v16)
      {
        uint64_t v17 = HMLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[MAMusicHapticsManager appSupportsMusicHaptics:completionHandler:]((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);
        }

        v7[2](v7, [v16 BOOLValue]);
      }
      else
      {
        v24 = [(MAMusicHapticsManager *)self appSupportedObservers];

        if (!v24)
        {
          v25 = objc_opt_new();
          [(MAMusicHapticsManager *)self setAppSupportedObservers:v25];
        }
        v26 = [MEMORY[0x1E4F29128] UUID];
        v27 = [v26 UUIDString];

        v28 = objc_opt_new();
        [v28 setObserver:v7];
        v29 = [(MAMusicHapticsManager *)self appSupportedObservers];
        [v29 setObject:v28 forKeyedSubscript:v27];

        v33[0] = @"bundleIdentifier";
        v33[1] = @"uuid";
        v34[0] = v6;
        v34[1] = v27;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
        v31 = [(MAMusicHapticsManager *)self _hapticMusicServerClient];
        v32 = [getAXAccessQueueClass() mainAccessQueue];
        [v31 sendAsynchronousMessage:v30 withIdentifier:5 targetAccessQueue:v32 completion:0];
      }
    }
    else
    {
      v7[2](v7, 0);
    }
  }
}

- (void)checkHapticTrackAvailabilityForMediaMatchingCode:(id)a3 completionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (v7)
  {
    if ([(MAMusicHapticsManager *)self musicHapticsEnabled] && v6)
    {
      v8 = [(MAMusicHapticsManager *)self ahapAvailableObservers];

      if (!v8)
      {
        uint64_t v9 = objc_opt_new();
        [(MAMusicHapticsManager *)self setAhapAvailableObservers:v9];
      }
      uint64_t v10 = HMLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v6;
        _os_log_impl(&dword_1BA6CF000, v10, OS_LOG_TYPE_DEFAULT, "Asking haptic track available: %@", buf, 0xCu);
      }

      uint64_t v11 = [(MAMusicHapticsManager *)self ahapAvailableCache];
      uint64_t v12 = [v11 objectForKeyedSubscript:v6];

      if (v12)
      {
        uint64_t v13 = HMLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v12;
          _os_log_impl(&dword_1BA6CF000, v13, OS_LOG_TYPE_INFO, "Has cached value: %@", buf, 0xCu);
        }

        v7[2](v7, [v12 BOOLValue]);
        goto LABEL_19;
      }
      uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
      v15 = [v14 UUIDString];

      v16 = objc_opt_new();
      [v16 setObserver:v7];
      uint64_t v17 = [(MAMusicHapticsManager *)self pendingAvailableObservers];
      uint64_t v18 = [v17 objectForKeyedSubscript:v6];

      if (v18)
      {
        uint64_t v19 = [(MAMusicHapticsManager *)self pendingAvailableObservers];
        uint64_t v20 = [v19 objectForKeyedSubscript:v6];

        [v20 addObject:v16];
        uint64_t v21 = HMLog();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
LABEL_18:

LABEL_19:
          goto LABEL_20;
        }
        uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
        *(_DWORD *)buf = 138412546;
        id v30 = v6;
        __int16 v31 = 2112;
        v32 = v22;
        _os_log_impl(&dword_1BA6CF000, v21, OS_LOG_TYPE_INFO, "Someone already asking for this code, will wait: %@ [%@]", buf, 0x16u);
      }
      else
      {
        uint64_t v23 = [(MAMusicHapticsManager *)self ahapAvailableObservers];
        [v23 setObject:v16 forKeyedSubscript:v15];

        v28[0] = v6;
        v24 = objc_msgSend(NSNumber, "numberWithBool:", -[MAMusicHapticsManager treatCodesAsAdamIDs](self, "treatCodesAsAdamIDs", @"code", @"treatAsAdamID"));
        v27[2] = @"uuid";
        v28[1] = v24;
        v28[2] = v15;
        uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];

        v25 = objc_opt_new();
        v26 = [(MAMusicHapticsManager *)self pendingAvailableObservers];
        [v26 setObject:v25 forKeyedSubscript:v6];

        uint64_t v21 = [(MAMusicHapticsManager *)self _hapticMusicServerClient];
        uint64_t v22 = [getAXAccessQueueClass() mainAccessQueue];
        [v21 sendAsynchronousMessage:v20 withIdentifier:2 targetAccessQueue:v22 completion:0];
      }

      goto LABEL_18;
    }
    v7[2](v7, 0);
  }
LABEL_20:
}

- (id)addStatusObserverBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__MAMusicHapticsManager_addStatusObserverBlock___block_invoke;
  v8[3] = &unk_1E6223988;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(MAMusicHapticsManager *)self addStatusObserver:v8];

  return v6;
}

uint64_t __48__MAMusicHapticsManager_addStatusObserverBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)addStatusObserver:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && [(MAMusicHapticsManager *)self musicHapticsEnabled])
  {
    id v5 = [(MAMusicHapticsManager *)self statusObservers];

    if (!v5)
    {
      id v6 = objc_opt_new();
      [(MAMusicHapticsManager *)self setStatusObservers:v6];
    }
    v7 = [MEMORY[0x1E4F29128] UUID];
    v8 = [v7 UUIDString];

    id v9 = objc_opt_new();
    [v9 setObserver:v4];
    uint64_t v10 = [(MAMusicHapticsManager *)self statusObservers];
    [v10 setObject:v9 forKeyedSubscript:v8];

    v17[0] = v8;
    v16[0] = @"uuid";
    v16[1] = @"treatAsAdamID";
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[MAMusicHapticsManager treatCodesAsAdamIDs](self, "treatCodesAsAdamIDs"));
    v16[2] = @"register";
    v17[1] = v11;
    v17[2] = MEMORY[0x1E4F1CC38];
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

    uint64_t v13 = [(MAMusicHapticsManager *)self _hapticMusicServerClient];
    uint64_t v14 = [getAXAccessQueueClass() mainAccessQueue];
    [v13 sendAsynchronousMessage:v12 withIdentifier:3 targetAccessQueue:v14 completion:0];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)userInterfaceClient:(id)a3 messageFromServerForWithIdentifierShouldBeProcessedAsynchronously:(unint64_t)a4
{
  return 1;
}

- (void)userInterfaceClient:(id)a3 processMessageFromServerAsynchronously:(id)a4 withIdentifier:(unint64_t)a5 completion:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = HMLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[MAMusicHapticsManager userInterfaceClient:processMessageFromServerAsynchronously:withIdentifier:completion:]((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
  }

  switch(a5)
  {
    case 2uLL:
      uint64_t v18 = [v9 objectForKeyedSubscript:@"uuid"];
      if (v18)
      {
        v26 = [(MAMusicHapticsManager *)self ahapAvailableObservers];
        id v20 = [v26 objectForKeyedSubscript:v18];

        v27 = [v20 observer];

        if (v27)
        {
          v28 = [v9 objectForKeyedSubscript:@"available"];
          v29 = [v9 objectForKeyedSubscript:@"code"];
          objc_opt_class();
          uint64_t v30 = 0;
          if ((objc_opt_isKindOfClass() & 1) != 0 && v29)
          {
            uint64_t v30 = [v28 BOOLValue];
            __int16 v31 = [(MAMusicHapticsManager *)self ahapAvailableCache];
            [v31 setObject:v28 forKeyedSubscript:v29];
          }
          v46 = (void (**)(void, void, void))v28;
          v32 = HMLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v58 = v9;
            _os_log_impl(&dword_1BA6CF000, v32, OS_LOG_TYPE_DEFAULT, "Haptic track available: %@", buf, 0xCu);
          }

          __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke_2(v33, v20, v30);
          v34 = [(MAMusicHapticsManager *)self pendingAvailableObservers];
          v35 = [v34 objectForKeyedSubscript:v29];
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke_338;
          v50[3] = &unk_1E6223A20;
          id v36 = v29;
          id v51 = v36;
          id v52 = &__block_literal_global_334;
          char v53 = v30;
          [v35 enumerateObjectsUsingBlock:v50];

          if (v29)
          {
            v37 = [(MAMusicHapticsManager *)self pendingAvailableObservers];
            [v37 setObject:0 forKeyedSubscript:v36];
          }
          uint64_t v23 = v46;
          goto LABEL_35;
        }
        goto LABEL_36;
      }
      goto LABEL_37;
    case 5uLL:
      uint64_t v18 = [v9 objectForKeyedSubscript:@"uuid"];
      if (v18)
      {
        v38 = [(MAMusicHapticsManager *)self appSupportedObservers];
        id v20 = [v38 objectForKeyedSubscript:v18];

        v39 = [v20 observer];

        if (v39)
        {
          uint64_t v23 = [v9 objectForKeyedSubscript:@"supported"];
          v40 = [v9 objectForKeyedSubscript:@"bundleIdentifier"];
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            uint64_t v41 = [v23 BOOLValue];
            [(MAMusicHapticsManager *)self appSupportsCache];
            v43 = v42 = v23;
            [v43 setObject:v42 forKeyedSubscript:v40];

            uint64_t v23 = v42;
          }
          else
          {
            uint64_t v41 = 0;
          }
          v44 = HMLog();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v58 = v9;
            _os_log_impl(&dword_1BA6CF000, v44, OS_LOG_TYPE_DEFAULT, "App supports: %@", buf, 0xCu);
          }

          if ([MEMORY[0x1E4F29060] isMainThread])
          {
            v45 = [v20 observer];
            v45[2](v45, v41);
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke_343;
            block[3] = &unk_1E62239F8;
            id v48 = v20;
            char v49 = v41;
            dispatch_async(MEMORY[0x1E4F14428], block);
            v45 = (void (**)(void, void))v48;
          }

          goto LABEL_35;
        }
LABEL_36:
      }
LABEL_37:

      break;
    case 3uLL:
      uint64_t v18 = [v9 objectForKeyedSubscript:@"uuid"];
      if (v18)
      {
        uint64_t v19 = [(MAMusicHapticsManager *)self statusObservers];
        id v20 = [v19 objectForKeyedSubscript:v18];

        uint64_t v21 = [v20 observer];

        if (v21)
        {
          uint64_t v22 = HMLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v58 = v9;
            _os_log_impl(&dword_1BA6CF000, v22, OS_LOG_TYPE_DEFAULT, "Status update: %@", buf, 0xCu);
          }

          if ([MEMORY[0x1E4F29060] isMainThread])
          {
            uint64_t v23 = [v20 observer];
            v24 = [v9 objectForKeyedSubscript:@"code"];
            v25 = [v9 objectForKeyedSubscript:@"active"];
            ((void (**)(void, void *, uint64_t))v23)[2](v23, v24, [v25 BOOLValue]);
          }
          else
          {
            v54[0] = MEMORY[0x1E4F143A8];
            v54[1] = 3221225472;
            v54[2] = __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke;
            v54[3] = &unk_1E62239B0;
            id v20 = v20;
            v55 = (void (**)(void, void, void))v20;
            id v56 = v9;
            dispatch_async(MEMORY[0x1E4F14428], v54);

            uint64_t v23 = v55;
          }
LABEL_35:

          goto LABEL_36;
        }
        goto LABEL_36;
      }
      goto LABEL_37;
  }
  (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
}

void __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) observer];
  v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"code"];
  dispatch_time_t v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"active"];
  v4[2](v4, v2, [v3 BOOLValue]);
}

void __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v5 = [v4 observer];
    v5[2](v5, a3);
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke_3;
    v6[3] = &unk_1E62239F8;
    id v7 = v4;
    char v8 = a3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observer];
  v2[2](v2, *(unsigned __int8 *)(a1 + 40));
}

void __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke_338(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = HMLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    char v8 = [NSNumber numberWithUnsignedInteger:a3];
    int v10 = 138412802;
    id v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1BA6CF000, v6, OS_LOG_TYPE_DEFAULT, "Sending haptic track available for pender: %@ %@ [%@]", (uint8_t *)&v10, 0x20u);
  }
  id v9 = [v5 observer];

  if (v9) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __110__MAMusicHapticsManager_userInterfaceClient_processMessageFromServerAsynchronously_withIdentifier_completion___block_invoke_343(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observer];
  v2[2](v2, *(unsigned __int8 *)(a1 + 40));
}

- (void)removeStatusObserver:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(MAMusicHapticsManager *)self statusObservers];
    id v6 = [v5 objectForKeyedSubscript:v4];

    if (v6)
    {
      uint64_t v7 = [(MAMusicHapticsManager *)self _hapticMusicServerClient];
      v11[0] = @"uuid";
      v11[1] = @"register";
      v12[0] = v4;
      v12[1] = MEMORY[0x1E4F1CC28];
      char v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
      id v9 = [getAXAccessQueueClass() mainAccessQueue];
      [v7 sendAsynchronousMessage:v8 withIdentifier:3 targetAccessQueue:v9 completion:0];

      int v10 = [(MAMusicHapticsManager *)self statusObservers];
      [v10 setObject:0 forKeyedSubscript:v4];
    }
  }
}

- (AXUIClient)client
{
  return self->client;
}

- (void)setClient:(id)a3
{
}

- (NSMutableDictionary)statusObservers
{
  return self->statusObservers;
}

- (void)setStatusObservers:(id)a3
{
}

- (NSMutableDictionary)ahapAvailableObservers
{
  return self->ahapAvailableObservers;
}

- (void)setAhapAvailableObservers:(id)a3
{
}

- (BOOL)treatCodesAsAdamIDs
{
  return self->treatCodesAsAdamIDs;
}

- (void)setTreatCodesAsAdamIDs:(BOOL)a3
{
  self->treatCodesAsAdamIDs = a3;
}

- (BOOL)musicHapticsActive
{
  return self->musicHapticsActive;
}

- (void)setMusicHapticsActive:(BOOL)a3
{
  self->musicHapticsActive = a3;
}

- (NSMutableDictionary)ahapAvailableCache
{
  return self->ahapAvailableCache;
}

- (void)setAhapAvailableCache:(id)a3
{
}

- (NSMutableDictionary)appSupportsCache
{
  return self->appSupportsCache;
}

- (void)setAppSupportsCache:(id)a3
{
}

- (NSMutableDictionary)appSupportedObservers
{
  return self->appSupportedObservers;
}

- (void)setAppSupportedObservers:(id)a3
{
}

- (NSMutableDictionary)pendingAvailableObservers
{
  return self->pendingAvailableObservers;
}

- (void)setPendingAvailableObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pendingAvailableObservers, 0);
  objc_storeStrong((id *)&self->appSupportedObservers, 0);
  objc_storeStrong((id *)&self->appSupportsCache, 0);
  objc_storeStrong((id *)&self->ahapAvailableCache, 0);
  objc_storeStrong((id *)&self->ahapAvailableObservers, 0);
  objc_storeStrong((id *)&self->statusObservers, 0);

  objc_storeStrong((id *)&self->client, 0);
}

- (void)appSupportsMusicHaptics:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)appSupportsMusicHaptics:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)userInterfaceClient:(uint64_t)a3 processMessageFromServerAsynchronously:(uint64_t)a4 withIdentifier:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end