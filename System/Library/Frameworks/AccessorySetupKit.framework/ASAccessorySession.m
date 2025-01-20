@interface ASAccessorySession
- (ASAccessorySession)init;
- (BOOL)allowedToActivatePicker:(id)a3;
- (BOOL)disablePickerItemMaxLimit;
- (DASession)daSession;
- (NSArray)accessories;
- (NSString)overrideAppBundleID;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)xpcListenerEndpoint;
- (id)eventHandler;
- (void)_activateWithQueue:(id)a3 eventHandler:(id)a4;
- (void)_applicationWillEnterForegroundNotification;
- (void)_fetchAuthorizedAccesoriesIfNeeded;
- (void)_handleDASessionEventHandler:(id)a3 session:(id)a4;
- (void)_invalidated;
- (void)_notifyAccesoriesChangedIfNeeded:(id)a3 bundleID:(id)a4 eventType:(int64_t)a5;
- (void)_removeAccessory:(id)a3 completionHandler:(id)a4;
- (void)_setupDeviceAccessSession;
- (void)_showPickerForDisplayItems:(id)a3 completionHandler:(id)a4;
- (void)_updateAccessory:(id)a3 settings:(id)a4 completionHandler:(id)a5;
- (void)_validateDisplayItem:(id)a3;
- (void)_validateMigrationDisplayItem:(id)a3;
- (void)activateWithEventHandler:(id)a3;
- (void)activateWithQueue:(id)a3 eventHandler:(id)a4;
- (void)crashIfAccessorySetupBundleInfoKeysInvalid;
- (void)dealloc;
- (void)failAuthorization:(id)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)relayPickerEvent:(id)a3;
- (void)removeAccessory:(id)a3 completionHandler:(id)a4;
- (void)renameAccessory:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)setDaSession:(id)a3;
- (void)setDisablePickerItemMaxLimit:(BOOL)a3;
- (void)setEventHandler:(id)a3;
- (void)setOverrideAppBundleID:(id)a3;
- (void)setXpcListenerEndpoint:(id)a3;
- (void)showPickerForDisplayItems:(id)a3 completionHandler:(id)a4;
- (void)showPickerWithCompletionHandler:(id)a3;
- (void)updateAccessory:(id)a3 settings:(id)a4 completionHandler:(id)a5;
@end

@implementation ASAccessorySession

- (ASAccessorySession)init
{
  v12.receiver = self;
  v12.super_class = (Class)ASAccessorySession;
  v2 = [(ASAccessorySession *)&v12 init];
  v3 = v2;
  if (v2)
  {
    [(ASAccessorySession *)v2 crashIfAccessorySetupBundleInfoKeysInvalid];
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    accessories = v3->_accessories;
    v3->_accessories = (NSMutableDictionary *)v4;

    v6 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v7 = [v6 bundleIdentifier];
    bundleID = v3->_bundleID;
    v3->_bundleID = (NSString *)v7;

    objc_storeStrong((id *)&v3->_dispatchQueue, MEMORY[0x263EF83A0]);
    v3->_tccStateUnkown = 0;
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v3 selector:sel__applicationWillEnterForegroundNotification name:@"UIApplicationWillEnterForegroundNotification" object:0];

    v10 = v3;
  }

  return v3;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateDone)
  {
    uint64_t v4 = (ASAccessorySession *)FatalErrorF();
    [(ASAccessorySession *)v4 activateWithEventHandler:v6];
  }
  else
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self];

    v7.receiver = self;
    v7.super_class = (Class)ASAccessorySession;
    [(ASAccessorySession *)&v7 dealloc];
  }
}

- (void)activateWithEventHandler:(id)a3
{
}

- (void)activateWithQueue:(id)a3 eventHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__ASAccessorySession_activateWithQueue_eventHandler___block_invoke;
    block[3] = &unk_265175190;
    block[4] = self;
    id v13 = v6;
    id v14 = v7;
    id v9 = v7;
    id v10 = v6;
    dispatch_async(dispatchQueue, block);
  }
  else
  {
    uint64_t v11 = FatalErrorF();
    __53__ASAccessorySession_activateWithQueue_eventHandler___block_invoke(v11);
  }
}

uint64_t __53__ASAccessorySession_activateWithQueue_eventHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithQueue:*(void *)(a1 + 40) eventHandler:*(void *)(a1 + 48)];
}

- (void)_activateWithQueue:(id)a3 eventHandler:(id)a4
{
  objc_super v12 = (OS_dispatch_queue *)a3;
  id v7 = a4;
  if (!self->_activateCalled)
  {
    self->_activateCalled = 1;
    overrideAppBundleID = self->_overrideAppBundleID;
    id v9 = overrideAppBundleID;
    if (v9) {
      objc_storeStrong((id *)&self->_bundleID, overrideAppBundleID);
    }

    if (self->_dispatchQueue != v12) {
      objc_storeStrong((id *)&self->_dispatchQueue, a3);
    }
    id v10 = _Block_copy(v7);
    id eventHandler = self->_eventHandler;
    self->_id eventHandler = v10;

    [(ASAccessorySession *)self _setupDeviceAccessSession];
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__ASAccessorySession_invalidate__block_invoke;
  block[3] = &unk_2651751B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__ASAccessorySession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 40))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 40) = 1;
    if (gLogCategory_ASAccessorySession <= 30
      && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = *(void *)(v2 + 32);
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(void *)(v2 + 32) + 64), "invalidate", v4);
    v3 = *(void **)(v2 + 32);
    return [v3 _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    SEL v5 = (void (**)(id, ASAccessoryEvent *))_Block_copy(self->_eventHandler);
    id eventHandler = self->_eventHandler;
    self->_id eventHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_ASAccessorySession <= 30
      && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v4 = [[ASAccessoryEvent alloc] initWithEventType:11];
    v5[2](v5, v4);
  }
}

- (void)_applicationWillEnterForegroundNotification
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__ASAccessorySession__applicationWillEnterForegroundNotification__block_invoke;
  block[3] = &unk_2651751B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __65__ASAccessorySession__applicationWillEnterForegroundNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchAuthorizedAccesoriesIfNeeded];
}

- (void)crashIfAccessorySetupBundleInfoKeysInvalid
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v3 = (__CFString *)xpc_copy_entitlement_for_token();
  if (v3)
  {
LABEL_40:
    if (gLogCategory_ASAccessorySession > 30) {
      goto LABEL_38;
    }
    if (gLogCategory_ASAccessorySession != -1)
    {
LABEL_42:
      LogPrintF();
      goto LABEL_38;
    }
LABEL_48:
    if (!_LogCategory_Initialize()) {
      goto LABEL_38;
    }
    goto LABEL_42;
  }
  uint64_t v4 = [MEMORY[0x263F01890] bundleRecordForCurrentProcess];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    FatalErrorF();
    goto LABEL_44;
  }
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
LABEL_44:
    FatalErrorF();
LABEL_45:
    FatalErrorF();
LABEL_46:
    v27 = v2;
    FatalErrorF();
LABEL_47:
    objc_msgSend(v4, "count", v27);
    FatalErrorF();
    goto LABEL_48;
  }
  id v6 = [MEMORY[0x263F086E0] mainBundle];
  id v7 = [v6 infoDictionary];

  [v7 objectForKeyedSubscript:@"NSAccessorySetupKitSupports"];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (!v8)
  {

    goto LABEL_51;
  }
  uint64_t v9 = v8;
  int v10 = 0;
  int v11 = 0;
  uint64_t v12 = *(void *)v42;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v42 != v12) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      v11 |= [v14 isEqualToString:@"Bluetooth"];
      v10 |= [v14 isEqualToString:@"WiFi"];
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  }
  while (v9);

  if (((v11 | v10) & 1) == 0) {
LABEL_51:
  }
    FatalErrorF();
  if (v11)
  {
    v28 = v7;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v38;
      v3 = @"004C";
      uint64_t v29 = *(void *)v38;
      id v30 = v15;
      do
      {
        uint64_t v19 = 0;
        uint64_t v31 = v17;
        do
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v2 = *(void **)(*((void *)&v37 + 1) + 8 * v19);
          if ([&unk_26F8704D0 containsObject:v2])
          {
            uint64_t v4 = [v15 objectForKeyedSubscript:v2];
            objc_opt_class();
            char v20 = objc_opt_isKindOfClass();

            if ((v20 & 1) == 0) {
              goto LABEL_45;
            }
            uint64_t v4 = [v15 objectForKeyedSubscript:v2];
            if (![v4 count]) {
              goto LABEL_46;
            }
            if ((unint64_t)[v4 count] >= 0x1F5) {
              goto LABEL_47;
            }
            if ([v2 isEqualToString:@"NSAccessorySetupBluetoothCompanyIdentifiers"])
            {
              long long v35 = 0u;
              long long v36 = 0u;
              long long v33 = 0u;
              long long v34 = 0u;
              id v21 = v4;
              uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v45 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v34;
                while (2)
                {
                  for (uint64_t j = 0; j != v23; ++j)
                  {
                    if (*(void *)v34 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    v26 = *(void **)(*((void *)&v33 + 1) + 8 * j);
                    if (![v26 caseInsensitiveCompare:@"4C"]
                      || ![v26 caseInsensitiveCompare:@"004C"])
                    {
                      FatalErrorF();
                      goto LABEL_40;
                    }
                  }
                  uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v45 count:16];
                  if (v23) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v18 = v29;
              id v15 = v30;
            }

            uint64_t v17 = v31;
          }
          ++v19;
        }
        while (v19 != v17);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v17);
    }

    id v7 = v28;
    v3 = 0;
  }

LABEL_38:
}

- (void)_setupDeviceAccessSession
{
  v3 = self->_bundleID;
  id v4 = objc_alloc_init(MEMORY[0x263F397F8]);
  objc_storeStrong((id *)&self->_daSession, v4);
  SEL v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.ask.sessionQueue", v5);

  objc_storeStrong((id *)&self->_sessionQueue, v6);
  [v4 setBundleID:v3];
  [v4 setDeviceFlags:8];
  [v4 setDispatchQueue:v6];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__ASAccessorySession__setupDeviceAccessSession__block_invoke;
  v9[3] = &unk_265175208;
  v9[4] = self;
  v9[5] = v4;
  [v4 setEventHandler:v9];
  id v7 = [(ASAccessorySession *)self xpcListenerEndpoint];

  if (v7)
  {
    uint64_t v8 = [(ASAccessorySession *)self xpcListenerEndpoint];
    [v4 setXpcListenerEndpoint:v8];
  }
  [v4 activate];
}

void __47__ASAccessorySession__setupDeviceAccessSession__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  SEL v5 = *(NSObject **)(v4 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ASAccessorySession__setupDeviceAccessSession__block_invoke_2;
  block[3] = &unk_2651751E0;
  block[4] = v4;
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __47__ASAccessorySession__setupDeviceAccessSession__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDASessionEventHandler:*(void *)(a1 + 40) session:*(void *)(a1 + 48)];
}

- (void)_handleDASessionEventHandler:(id)a3 session:(id)a4
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_bundleID;
  id v9 = v6;
  id v66 = v7;
  if (gLogCategory_ASAccessorySession <= 30
    && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
  {
    id v61 = v9;
    LogPrintF();
  }
  uint64_t v10 = objc_msgSend(v9, "eventType", v61);
  if (v10 > 40)
  {
    if (v10 == 41)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        id v24 = v9;
        v25 = [v24 device];
        v26 = [v25 identifier];
        if (gLogCategory_ASAccessorySession <= 30
          && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        long long v39 = [[ASAccessory alloc] initWithDADevice:v25 bundleID:v8];
        if (gLogCategory_ASAccessorySession <= 30
          && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (v39)
        {
          long long v40 = self;
          objc_sync_enter(v40);
          [(NSMutableDictionary *)v40->_accessories setObject:0 forKeyedSubscript:v26];
          objc_sync_exit(v40);

          long long v41 = [[ASAccessoryEvent alloc] initWithEventType:31];
          [(ASAccessoryEvent *)v41 setAccessory:v39];
          long long v42 = [(ASAccessorySession *)v40 eventHandler];
          ((void (**)(void, ASAccessoryEvent *))v42)[2](v42, v41);
        }
      }
      goto LABEL_77;
    }
    if (v10 != 42)
    {
      if (v10 == 50)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v9;
          if ([v11 devicesMigrated])
          {
            uint64_t v12 = self;
            objc_sync_enter(v12);
            long long v71 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            id v63 = v11;
            id v13 = [v11 devices];
            uint64_t v14 = [v13 countByEnumeratingWithState:&v71 objects:v76 count:16];
            if (v14)
            {
              uint64_t v15 = *(void *)v72;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v72 != v15) {
                    objc_enumerationMutation(v13);
                  }
                  uint64_t v17 = *(void **)(*((void *)&v71 + 1) + 8 * i);
                  uint64_t v18 = [v17 identifier];
                  uint64_t v19 = [[ASAccessory alloc] initWithDADevice:v17 bundleID:v8];
                  if (v19) {
                    [(NSMutableDictionary *)v12->_accessories setObject:v19 forKeyedSubscript:v18];
                  }
                }
                uint64_t v14 = [v13 countByEnumeratingWithState:&v71 objects:v76 count:16];
              }
              while (v14);
            }

            char v20 = [[ASAccessoryEvent alloc] initWithEventType:20];
            id v21 = [(ASAccessorySession *)v12 eventHandler];
            ((void (**)(void, ASAccessoryEvent *))v21)[2](v21, v20);

            objc_sync_exit(v12);
            id v11 = v63;
          }
        }
      }
      goto LABEL_77;
    }
LABEL_60:
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v65 = v9;
      v50 = [v65 device];
      v51 = [v50 identifier];
      v52 = [[ASAccessory alloc] initWithDADevice:v50 bundleID:v8];
      if (gLogCategory_ASAccessorySession <= 30
        && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (v52)
      {
        v53 = [v50 appAccessInfoMap];
        v54 = [v53 objectForKeyedSubscript:v8];
        uint64_t v55 = [v54 state];

        if (v55 >= 11)
        {
          if (gLogCategory_ASAccessorySession <= 30
            && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v56 = self;
          objc_sync_enter(v56);
          v57 = [(NSMutableDictionary *)v56->_accessories objectForKeyedSubscript:v51];

          [(NSMutableDictionary *)v56->_accessories setObject:v52 forKeyedSubscript:v51];
          if (v57) {
            uint64_t v58 = 32;
          }
          else {
            uint64_t v58 = 30;
          }
          objc_sync_exit(v56);

          v59 = [[ASAccessoryEvent alloc] initWithEventType:v58];
          [(ASAccessoryEvent *)v59 setAccessory:v52];
          v60 = [(ASAccessorySession *)v56 eventHandler];
          ((void (**)(void, ASAccessoryEvent *))v60)[2](v60, v59);
        }
      }
    }
    goto LABEL_77;
  }
  if (v10 == 10)
  {
    uint64_t v22 = [v9 error];

    if (v22)
    {
      if (gLogCategory_ASAccessorySession <= 90
        && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v23 = [v9 error];
        v62 = CUPrintNSError();
        LogPrintF();
      }
      long long v38 = [[ASAccessoryEvent alloc] initWithEventType:11];
      v49 = ASErrorF(100, (uint64_t)"Unable to activate session.", v43, v44, v45, v46, v47, v48, (uint64_t)v62);
      [(ASAccessoryEvent *)v38 setError:v49];
    }
    else
    {
      long long v38 = [v66 availableDevices];
      [(ASAccessorySession *)self _notifyAccesoriesChangedIfNeeded:v38 bundleID:v8 eventType:10];
    }

    goto LABEL_60;
  }
  if (v10 != 15)
  {
    if (v10 != 40) {
      goto LABEL_77;
    }
    goto LABEL_60;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = v9;
    if ([v27 devicesMigrated])
    {
      v28 = self;
      objc_sync_enter(v28);
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v64 = v27;
      uint64_t v29 = [v27 devices];
      uint64_t v30 = [v29 countByEnumeratingWithState:&v67 objects:v75 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v68;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v68 != v31) {
              objc_enumerationMutation(v29);
            }
            long long v33 = *(void **)(*((void *)&v67 + 1) + 8 * j);
            long long v34 = [v33 identifier];
            long long v35 = [[ASAccessory alloc] initWithDADevice:v33 bundleID:v8];
            if (v35) {
              [(NSMutableDictionary *)v28->_accessories setObject:v35 forKeyedSubscript:v34];
            }
          }
          uint64_t v30 = [v29 countByEnumeratingWithState:&v67 objects:v75 count:16];
        }
        while (v30);
      }

      long long v36 = [[ASAccessoryEvent alloc] initWithEventType:20];
      long long v37 = [(ASAccessorySession *)v28 eventHandler];
      ((void (**)(void, ASAccessoryEvent *))v37)[2](v37, v36);

      objc_sync_exit(v28);
      id v27 = v64;
    }
  }
LABEL_77:
}

- (OS_dispatch_queue)queue
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_dispatchQueue;
  objc_sync_exit(v2);

  return v3;
}

- (void)relayPickerEvent:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__ASAccessorySession_relayPickerEvent___block_invoke;
  v7[3] = &unk_265175230;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __39__ASAccessorySession_relayPickerEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) eventHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) eventHandler];
    v3[2](v3, *(void *)(a1 + 40));
  }
}

- (void)_fetchAuthorizedAccesoriesIfNeeded
{
  id v3 = self->_bundleID;
  id v4 = self->_daSession;
  SEL v5 = v4;
  if (!self->_activateCalled || (!self->_invalidateCalled ? (BOOL v6 = v4 == 0) : (BOOL v6 = 1), v6))
  {
    if (gLogCategory_ASAccessorySession <= 90
      && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __56__ASAccessorySession__fetchAuthorizedAccesoriesIfNeeded__block_invoke;
    v7[3] = &unk_265175280;
    v7[4] = self;
    void v7[5] = v3;
    [(DASession *)v4 getDevicesWithFlags:8 completionHandler:v7];
  }
}

void __56__ASAccessorySession__fetchAuthorizedAccesoriesIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  id v21 = 0;
  id v7 = v5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__ASAccessorySession__fetchAuthorizedAccesoriesIfNeeded__block_invoke_67;
  aBlock[3] = &unk_265175258;
  uint64_t v19 = v20;
  id v8 = v7;
  id v18 = v8;
  id v9 = (void (**)(void))_Block_copy(aBlock);
  if (!v8 || !v6)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(NSObject **)(v10 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__ASAccessorySession__fetchAuthorizedAccesoriesIfNeeded__block_invoke_2;
    block[3] = &unk_2651751E0;
    block[4] = v10;
    id v12 = v8;
    uint64_t v13 = *(void *)(a1 + 40);
    id v15 = v12;
    uint64_t v16 = v13;
    dispatch_async(v11, block);
  }
  v9[2](v9);

  _Block_object_dispose(v20, 8);
}

void __56__ASAccessorySession__fetchAuthorizedAccesoriesIfNeeded__block_invoke_67(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && gLogCategory_ASAccessorySession <= 90
    && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v1 = CUPrintNSError();
    LogPrintF();
  }
}

uint64_t __56__ASAccessorySession__fetchAuthorizedAccesoriesIfNeeded__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyAccesoriesChangedIfNeeded:*(void *)(a1 + 40) bundleID:*(void *)(a1 + 48) eventType:32];
}

- (void)_notifyAccesoriesChangedIfNeeded:(id)a3 bundleID:(id)a4 eventType:(int64_t)a5
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v54 = self;
  accessories = self->_accessories;
  p_accessories = &self->_accessories;
  uint64_t v58 = accessories;
  v52 = [MEMORY[0x263EFF980] array];
  v51 = [MEMORY[0x263EFF980] array];
  v50 = [MEMORY[0x263EFF980] array];
  id v11 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v77 objects:v84 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v78 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [[ASAccessory alloc] initWithDADevice:*(void *)(*((void *)&v77 + 1) + 8 * i) bundleID:v8];
        id v18 = v17;
        if (v17)
        {
          uint64_t v19 = [(ASAccessory *)v17 identifier];
          [v11 setObject:v18 forKeyedSubscript:v19];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v77 objects:v84 count:16];
    }
    while (v14);
  }

  v74[0] = MEMORY[0x263EF8330];
  v74[1] = 3221225472;
  v74[2] = __74__ASAccessorySession__notifyAccesoriesChangedIfNeeded_bundleID_eventType___block_invoke;
  v74[3] = &unk_2651752A8;
  id v20 = v11;
  id v75 = v20;
  id v21 = v50;
  id v76 = v21;
  [(NSMutableDictionary *)v58 enumerateKeysAndObjectsUsingBlock:v74];
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __74__ASAccessorySession__notifyAccesoriesChangedIfNeeded_bundleID_eventType___block_invoke_2;
  v71[3] = &unk_2651752D0;
  v71[4] = v58;
  id v22 = v52;
  id v72 = v22;
  id v23 = v51;
  id v73 = v23;
  [v20 enumerateKeysAndObjectsUsingBlock:v71];
  id v24 = v54;
  objc_sync_enter(v24);
  objc_storeStrong((id *)p_accessories, v11);
  objc_sync_exit(v24);

  if (a5 == 10)
  {
    v25 = [[ASAccessoryEvent alloc] initWithEventType:10];
    v26 = [(ASAccessorySession *)v24 eventHandler];
    ((void (**)(void, ASAccessoryEvent *))v26)[2](v26, v25);
  }
  else
  {
    uint64_t v55 = v23;
    v57 = v22;
    id v53 = v20;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v27 = v21;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v67 objects:v83 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v68;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v68 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v67 + 1) + 8 * j);
          long long v33 = [[ASAccessoryEvent alloc] initWithEventType:31];
          [(ASAccessoryEvent *)v33 setAccessory:v32];
          long long v34 = [(ASAccessorySession *)v24 eventHandler];
          ((void (**)(void, ASAccessoryEvent *))v34)[2](v34, v33);
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v67 objects:v83 count:16];
      }
      while (v29);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v35 = v57;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v63 objects:v82 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v64;
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v64 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = *(void *)(*((void *)&v63 + 1) + 8 * k);
          long long v41 = [[ASAccessoryEvent alloc] initWithEventType:30];
          [(ASAccessoryEvent *)v41 setAccessory:v40];
          long long v42 = [(ASAccessorySession *)v24 eventHandler];
          ((void (**)(void, ASAccessoryEvent *))v42)[2](v42, v41);
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v63 objects:v82 count:16];
      }
      while (v37);
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v23 = v55;
    v25 = v55;
    uint64_t v43 = [(ASAccessoryEvent *)v25 countByEnumeratingWithState:&v59 objects:v81 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v60;
      do
      {
        for (uint64_t m = 0; m != v44; ++m)
        {
          if (*(void *)v60 != v45) {
            objc_enumerationMutation(v25);
          }
          uint64_t v47 = *(void *)(*((void *)&v59 + 1) + 8 * m);
          uint64_t v48 = [[ASAccessoryEvent alloc] initWithEventType:32];
          [(ASAccessoryEvent *)v48 setAccessory:v47];
          v49 = [(ASAccessorySession *)v24 eventHandler];
          ((void (**)(void, ASAccessoryEvent *))v49)[2](v49, v48);
        }
        uint64_t v44 = [(ASAccessoryEvent *)v25 countByEnumeratingWithState:&v59 objects:v81 count:16];
      }
      while (v44);
      id v20 = v53;
      id v23 = v55;
      id v22 = v57;
    }
    else
    {
      id v20 = v53;
      id v22 = v57;
    }
  }
}

void __74__ASAccessorySession__notifyAccesoriesChangedIfNeeded_bundleID_eventType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];

  if (!v5) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

void __74__ASAccessorySession__notifyAccesoriesChangedIfNeeded_bundleID_eventType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
  id v7 = v6;
  if (!v6)
  {
    uint64_t v10 = *(void **)(a1 + 40);
LABEL_6:
    [v10 addObject:v5];
    goto LABEL_8;
  }
  id v8 = [v6 identifier];
  if ([v8 isEqualToString:v11])
  {
    char v9 = [v7 isEqual:v5];

    if (v9) {
      goto LABEL_8;
    }
    uint64_t v10 = *(void **)(a1 + 48);
    goto LABEL_6;
  }

LABEL_8:
}

- (NSArray)accessories
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableDictionary *)v2->_accessories allValues];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)failAuthorization:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_ASAccessorySession <= 40
    && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__ASAccessorySession_failAuthorization_completionHandler___block_invoke;
  block[3] = &unk_265175190;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __58__ASAccessorySession_failAuthorization_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    if (!*(unsigned char *)(v1 + 40))
    {
      id v3 = +[ASUIClientManager shared];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __58__ASAccessorySession_failAuthorization_completionHandler___block_invoke_2;
      v6[3] = &unk_2651752F8;
      uint64_t v4 = *(void *)(a1 + 40);
      id v7 = *(id *)(a1 + 48);
      [v3 failWithAccessory:v4 completionHandler:v6];

      return;
    }
  }
  else
  {
    FatalErrorF();
  }
  uint64_t v5 = FatalErrorF();
  __58__ASAccessorySession_failAuthorization_completionHandler___block_invoke_2(v5);
}

uint64_t __58__ASAccessorySession_failAuthorization_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeAccessory:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_ASAccessorySession <= 40
    && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ASAccessorySession_removeAccessory_completionHandler___block_invoke;
  block[3] = &unk_265175190;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __56__ASAccessorySession_removeAccessory_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = (unsigned char *)a1[4];
  if (!v2[8])
  {
    FatalErrorF();
    goto LABEL_7;
  }
  if (v2[40])
  {
LABEL_7:
    uint64_t v5 = (ASAccessorySession *)FatalErrorF();
    [(ASAccessorySession *)v5 _removeAccessory:v7 completionHandler:v8];
    return;
  }
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];

  [v2 _removeAccessory:v3 completionHandler:v4];
}

- (void)_removeAccessory:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ASAccessorySession *)self overrideAppBundleID];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v11 = [MEMORY[0x263F086E0] mainBundle];
    id v10 = [v11 bundleIdentifier];
  }
  id v12 = objc_alloc(MEMORY[0x263F397D0]);
  id v13 = [v7 identifier];

  uint64_t v14 = (void *)[v12 initWithBundleIdentifier:v10 deviceIdentifier:v13 state:0];
  uint64_t v15 = [(ASAccessorySession *)self daSession];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __57__ASAccessorySession__removeAccessory_completionHandler___block_invoke;
  v17[3] = &unk_265175348;
  v17[4] = self;
  id v18 = v6;
  id v16 = v6;
  [v15 removeDeviceAccess:v14 completionHandler:v17];
}

void __57__ASAccessorySession__removeAccessory_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__ASAccessorySession__removeAccessory_completionHandler___block_invoke_2;
  v6[3] = &unk_265175320;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __57__ASAccessorySession__removeAccessory_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [v2 code];
    uint64_t v10 = *(void *)(a1 + 40);
    if (v3 == 350006)
    {
      id v11 = "User restricted accessory removal";
      int v12 = 750;
    }
    else
    {
      id v11 = "Unable to remove accessory";
      int v12 = 1;
    }
    ASErrorF(v12, (uint64_t)v11, v4, v5, v6, v7, v8, v9, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v15);
  }
  else
  {
    id v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v13();
  }
}

- (void)renameAccessory:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(ASAccessorySession *)self overrideAppBundleID];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v13 = [MEMORY[0x263F086E0] mainBundle];
    id v12 = [v13 bundleIdentifier];
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__ASAccessorySession_renameAccessory_options_completionHandler___block_invoke;
  block[3] = &unk_265175370;
  block[4] = self;
  id v18 = v8;
  id v20 = v9;
  unint64_t v21 = a4;
  id v19 = v12;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(dispatchQueue, block);
}

void __64__ASAccessorySession_renameAccessory_options_completionHandler___block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  if (!*(unsigned char *)(v1 + 8))
  {
    FatalErrorF();
    goto LABEL_7;
  }
  if (*(unsigned char *)(v1 + 40))
  {
LABEL_7:
    uint64_t v3 = (ASAccessorySession *)FatalErrorF();
    [(ASAccessorySession *)v3 showPickerForDisplayItems:v5 completionHandler:v6];
    return;
  }
  id v7 = +[ASUIClientManager shared];
  [v7 updateWithAccessory:a1[5] options:a1[8] for:a1[6] completionHandler:a1[7]];
}

- (void)showPickerForDisplayItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ASAccessorySession *)self allowedToActivatePicker:v6])
  {
    if (gLogCategory_ASAccessorySession <= 40
      && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__ASAccessorySession_showPickerForDisplayItems_completionHandler___block_invoke;
    block[3] = &unk_265175190;
    block[4] = self;
    id v18 = v6;
    id v19 = v7;
    dispatch_async(dispatchQueue, block);
  }
  else
  {
    uint64_t v14 = ASErrorF(550, (uint64_t)"CBManagers active with global permissions", v8, v9, v10, v11, v12, v13, v16);
    (*((void (**)(id, void *))v7 + 2))(v7, v14);
  }
}

uint64_t __66__ASAccessorySession_showPickerForDisplayItems_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showPickerForDisplayItems:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_showPickerForDisplayItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_activateCalled)
  {
    FatalErrorF();
    goto LABEL_24;
  }
  if (self->_invalidateCalled)
  {
LABEL_24:
    FatalErrorF();
    goto LABEL_25;
  }
  uint64_t v8 = (void (**)(void, void))v7;
  if ((unint64_t)[v6 count] >= 0x1F5 && !self->_disablePickerItemMaxLimit)
  {
LABEL_25:
    uint64_t v30 = (_Unwind_Exception *)FatalErrorF();
    _Block_object_dispose(&v41, 8);
    _Unwind_Resume(v30);
  }
  uint64_t v9 = (void *)xpc_copy_entitlement_for_token();
  if (v9) {
    goto LABEL_6;
  }
  uint64_t v41 = 0;
  long long v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  if (self->_dispatchQueue == (OS_dispatch_queue *)MEMORY[0x263EF83A0])
  {
    id v19 = [MEMORY[0x263F82438] sharedApplication];
    uint64_t v21 = [v19 applicationState];
    v42[3] = v21;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__ASAccessorySession__showPickerForDisplayItems_completionHandler___block_invoke;
    block[3] = &unk_265175398;
    block[4] = &v41;
    id v19 = (void *)MEMORY[0x263EF83A0];
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }

  if (!v42[3])
  {
    _Block_object_dispose(&v41, 8);
LABEL_6:
    uint64_t v41 = 0;
    long long v42 = &v41;
    uint64_t v43 = 0x2020000000;
    LOBYTE(v44) = 0;
    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __67__ASAccessorySession__showPickerForDisplayItems_completionHandler___block_invoke_2;
    v35[3] = &unk_2651753C0;
    v35[5] = &v41;
    v35[6] = &v36;
    v35[4] = self;
    [v6 enumerateObjectsUsingBlock:v35];
    if (*((unsigned char *)v37 + 24))
    {
      uint64_t v10 = self;
      objc_sync_enter(v10);
      uint64_t v11 = [(NSMutableDictionary *)v10->_accessories allValues];
      uint64_t v12 = [v11 count];

      if (v12)
      {
        if (gLogCategory_ASAccessorySession <= 90
          && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        uint64_t v29 = ASErrorF(550, (uint64_t)"Migration not allowed since accessories are already authorized", v13, v14, v15, v16, v17, v18, v31);
        ((void (**)(void, void *))v8)[2](v8, v29);

        objc_sync_exit(v10);
        goto LABEL_21;
      }
      objc_sync_exit(v10);
    }
    sessionQueue = self->_sessionQueue;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __67__ASAccessorySession__showPickerForDisplayItems_completionHandler___block_invoke_3;
    v32[3] = &unk_265175190;
    v32[4] = self;
    id v33 = v6;
    long long v34 = v8;
    dispatch_async(sessionQueue, v32);

LABEL_21:
    _Block_object_dispose(&v36, 8);
    goto LABEL_22;
  }
  uint64_t v28 = ASErrorF(550, (uint64_t)"Application is not in foreground.", v22, v23, v24, v25, v26, v27, v31);
  ((void (**)(void, void *))v8)[2](v8, v28);

LABEL_22:
  _Block_object_dispose(&v41, 8);
}

void __67__ASAccessorySession__showPickerForDisplayItems_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 applicationState];
}

void __67__ASAccessorySession__showPickerForDisplayItems_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (a3 || (isKindOfClass & 1) != 0)
  {
    if (*(unsigned char *)(v6 + 24) && (objc_opt_class(), char v7 = objc_opt_isKindOfClass(), a3) && (v7 & 1) != 0)
    {
      if (gLogCategory_ASAccessorySession <= 40
        && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      objc_opt_class();
      char v8 = objc_opt_isKindOfClass();
      if (a3 || (v8 & 1) == 0) {
        goto LABEL_16;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_16;
  }
  *(unsigned char *)(v6 + 24) = 1;
  if (gLogCategory_ASAccessorySession <= 40
    && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_16:
  [*(id *)(a1 + 32) _validateDisplayItem:v9];
}

void __67__ASAccessorySession__showPickerForDisplayItems_completionHandler___block_invoke_3(void *a1)
{
  id v2 = +[ASUIClientManager shared];
  [v2 activateConnectionWithSession:a1[4] with:a1[5] for:*(void *)(a1[4] + 88) completionHandler:a1[6]];
}

- (void)showPickerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (gLogCategory_ASAccessorySession <= 40
    && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(ASAccessorySession *)self showPickerForDisplayItems:MEMORY[0x263EFFA68] completionHandler:v4];
}

- (void)updateAccessory:(id)a3 settings:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__ASAccessorySession_updateAccessory_settings_completionHandler___block_invoke;
  v15[3] = &unk_2651753E8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

void __65__ASAccessorySession_updateAccessory_settings_completionHandler___block_invoke(void *a1)
{
  id v2 = (unsigned char *)a1[4];
  if (!v2[8])
  {
    FatalErrorF();
    goto LABEL_7;
  }
  if (v2[40])
  {
LABEL_7:
    uint64_t v6 = (ASAccessorySession *)FatalErrorF();
    [(ASAccessorySession *)v6 _updateAccessory:v8 settings:v9 completionHandler:v10];
    return;
  }
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];

  [v2 _updateAccessory:v3 settings:v4 completionHandler:v5];
}

- (void)_updateAccessory:(id)a3 settings:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = self->_daSession;
  uint64_t v11 = (objc_class *)MEMORY[0x263F397E0];
  id v12 = a4;
  id v13 = objc_alloc_init(v11);
  id v14 = [v12 SSID];
  [v13 setSSID:v14];

  uint64_t v15 = [v12 bluetoothTransportBridgingIdentifier];
  [v13 setBridgingIdentifier:v15];

  id v16 = [v12 bluetoothTransportBridgingIdentifier];

  if (v16)
  {
    id v17 = [(DASession *)v10 availableDevices];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __66__ASAccessorySession__updateAccessory_settings_completionHandler___block_invoke;
    v22[3] = &unk_265175410;
    id v23 = v8;
    [v17 enumerateObjectsUsingBlock:v22];
  }
  id v18 = [v8 identifier];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __66__ASAccessorySession__updateAccessory_settings_completionHandler___block_invoke_2;
  v20[3] = &unk_265175348;
  v20[4] = self;
  id v21 = v9;
  id v19 = v9;
  [(DASession *)v10 modifyDeviceWithIdentifier:v18 settings:v13 completionHandler:v20];
}

void __66__ASAccessorySession__updateAccessory_settings_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v6 = [v10 identifier];
  SEL v7 = [*(id *)(a1 + 32) identifier];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    if (([v10 flags] & 0x20) != 0)
    {
      uint64_t v9 = FatalErrorF();
      __66__ASAccessorySession__updateAccessory_settings_completionHandler___block_invoke_2(v9);
      return;
    }
    *a4 = 1;
  }
}

void __66__ASAccessorySession__updateAccessory_settings_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__ASAccessorySession__updateAccessory_settings_completionHandler___block_invoke_3;
  v6[3] = &unk_265175320;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __66__ASAccessorySession__updateAccessory_settings_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    CUPrintNSError();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = ASErrorF(450, (uint64_t)"Unable to update accessory: %@", v2, v3, v4, v5, v6, v7, (uint64_t)v11);
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v8);
  }
  else
  {
    uint64_t v9 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v10 = *(void *)(a1 + 40);
    v9(v10, 0);
  }
}

- (void)_validateDisplayItem:(id)a3
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 productImage];

  if (!v5) {
    goto LABEL_73;
  }
  uint64_t v6 = [v4 descriptor];

  if (!v6)
  {
LABEL_74:
    FatalErrorF();
    goto LABEL_75;
  }
  uint64_t v7 = [v4 name];

  if (!v7)
  {
LABEL_75:
    FatalErrorF();
    goto LABEL_76;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_76:
    [(ASAccessorySession *)self _validateMigrationDisplayItem:v4];
    goto LABEL_71;
  }
  id v8 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v9 = [v8 infoDictionary];

  long long v65 = v9;
  [v9 objectForKeyedSubscript:@"NSAccessorySetupKitSupports"];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v72 objects:v77 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    int v13 = 0;
    LODWORD(self) = 0;
    uint64_t v14 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v73 != v14) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        self = (ASAccessorySession *)([v16 isEqualToString:@"Bluetooth"] | self);
        v13 |= [v16 isEqualToString:@"WiFi"];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v72 objects:v77 count:16];
    }
    while (v12);
  }
  else
  {
    LOBYTE(v13) = 0;
    self = 0;
  }

  id v17 = [v4 descriptor];
  int v18 = [v17 bluetoothCompanyIdentifier];
  BOOL v19 = v18 != 0;
  if (v18)
  {
    if ((self & 1) == 0)
    {
LABEL_89:
      FatalErrorF();
      goto LABEL_90;
    }
    unsigned int v20 = [v17 bluetoothCompanyIdentifier];
    id v21 = objc_msgSend(NSString, "stringWithFormat:", @"%x", objc_msgSend(v17, "bluetoothCompanyIdentifier"));
    uint64_t v22 = [v65 objectForKeyedSubscript:@"NSAccessorySetupBluetoothCompanyIdentifiers"];
    if (!v22)
    {
LABEL_90:
      FatalErrorF();
      goto LABEL_91;
    }
    id v23 = v22;
    if (![v22 count])
    {
LABEL_91:
      FatalErrorF();
      goto LABEL_92;
    }
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __43__ASAccessorySession__validateDisplayItem___block_invoke;
    v70[3] = &__block_descriptor_34_e18__16__0__NSString_8l;
    __int16 v71 = __rev16(v20);
    uint64_t v24 = [v23 cuFilteredArrayUsingBlock:v70];
    if ([v24 count] != 1)
    {
LABEL_93:
      FatalErrorF();
      goto LABEL_94;
    }
  }
  uint64_t v25 = [v17 bluetoothServiceUUID];

  if (v25)
  {
    if ((self & 1) == 0)
    {
LABEL_92:
      FatalErrorF();
      goto LABEL_93;
    }
    uint64_t v26 = [v17 bluetoothServiceUUID];
    uint64_t v25 = [v26 UUIDString];

    uint64_t v27 = [v65 objectForKeyedSubscript:@"NSAccessorySetupBluetoothServices"];
    if (!v27)
    {
LABEL_94:
      FatalErrorF();
      goto LABEL_95;
    }
    uint64_t v28 = v27;
    if (![v27 count])
    {
LABEL_95:
      FatalErrorF();
      goto LABEL_96;
    }
    if (([v28 containsObject:v25] & 1) == 0)
    {
LABEL_96:
      FatalErrorF();
LABEL_97:
      FatalErrorF();
      goto LABEL_98;
    }

    BOOL v19 = 1;
  }
  uint64_t v29 = [v17 bluetoothManufacturerDataBlob];
  if (v29)
  {
  }
  else
  {
    uint64_t v25 = [v17 bluetoothManufacturerDataMask];

    if (!v25) {
      goto LABEL_36;
    }
  }
  if ((self & 1) == 0) {
    goto LABEL_78;
  }
  if (![v17 bluetoothCompanyIdentifier])
  {
LABEL_79:
    FatalErrorF();
LABEL_80:
    FatalErrorF();
    goto LABEL_81;
  }
  uint64_t v30 = [v17 bluetoothManufacturerDataBlob];
  if (!v30
    || (uint64_t v25 = (void *)v30,
        [v17 bluetoothManufacturerDataMask],
        uint64_t v31 = objc_claimAutoreleasedReturnValue(),
        v31,
        v25,
        !v31))
  {
    FatalErrorF();
LABEL_78:
    FatalErrorF();
    goto LABEL_79;
  }
  uint64_t v25 = [v17 bluetoothManufacturerDataBlob];
  if (![v25 length])
  {
LABEL_81:

    goto LABEL_82;
  }
  uint64_t v32 = [v17 bluetoothManufacturerDataMask];
  uint64_t v33 = [v32 length];

  if (!v33)
  {
LABEL_82:
    FatalErrorF();
    goto LABEL_83;
  }
  uint64_t v25 = [v17 bluetoothManufacturerDataBlob];
  uint64_t v34 = [v25 length];
  id v35 = [v17 bluetoothManufacturerDataMask];
  uint64_t v36 = [v35 length];

  if (v34 != v36)
  {
LABEL_83:
    FatalErrorF();
LABEL_84:
    FatalErrorF();
    goto LABEL_85;
  }
LABEL_36:
  uint64_t v37 = [v17 bluetoothServiceDataBlob];
  if (v37)
  {
  }
  else
  {
    uint64_t v25 = [v17 bluetoothServiceDataMask];

    if (!v25) {
      goto LABEL_46;
    }
  }
  if ((self & 1) == 0) {
    goto LABEL_84;
  }
  uint64_t v25 = [v17 bluetoothServiceUUID];

  if (!v25)
  {
LABEL_85:
    FatalErrorF();
    goto LABEL_86;
  }
  uint64_t v38 = [v17 bluetoothServiceDataBlob];
  if (!v38) {
    goto LABEL_80;
  }
  uint64_t v25 = (void *)v38;
  char v39 = [v17 bluetoothServiceDataMask];

  if (!v39) {
    goto LABEL_80;
  }
  uint64_t v25 = [v17 bluetoothServiceDataBlob];
  if (![v25 length])
  {
LABEL_86:

    goto LABEL_87;
  }
  uint64_t v40 = [v17 bluetoothServiceDataMask];
  uint64_t v41 = [v40 length];

  if (!v41)
  {
LABEL_87:
    FatalErrorF();
    goto LABEL_88;
  }
  long long v42 = [v17 bluetoothServiceDataBlob];
  uint64_t v43 = [v42 length];
  uint64_t v44 = [v17 bluetoothServiceDataMask];
  uint64_t v45 = [v44 length];

  if (v43 != v45)
  {
LABEL_88:
    FatalErrorF();
    goto LABEL_89;
  }
LABEL_46:
  uint64_t v46 = [v17 bluetoothNameSubstring];

  if (!v46) {
    goto LABEL_59;
  }
  if ((self & 1) == 0) {
    goto LABEL_97;
  }
  if (!v19)
  {
LABEL_98:
    FatalErrorF();
    goto LABEL_99;
  }
  uint64_t v47 = [v65 objectForKeyedSubscript:@"NSAccessorySetupBluetoothNames"];
  uint64_t v48 = [v17 bluetoothNameSubstring];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v49 = v47;
  uint64_t v50 = [v49 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    self = *(ASAccessorySession **)v67;
LABEL_51:
    uint64_t v52 = 0;
    while (1)
    {
      if (*(ASAccessorySession **)v67 != self) {
        objc_enumerationMutation(v49);
      }
      if ([v48 containsString:*(void *)(*((void *)&v66 + 1) + 8 * v52)]) {
        break;
      }
      if (v51 == ++v52)
      {
        uint64_t v51 = [v49 countByEnumeratingWithState:&v66 objects:v76 count:16];
        if (v51) {
          goto LABEL_51;
        }
        goto LABEL_57;
      }
    }
  }
  else
  {
LABEL_57:

    long long v64 = v48;
    FatalErrorF();
  }

LABEL_59:
  id v53 = objc_msgSend(v17, "SSID", v64);

  if (!v53) {
    goto LABEL_63;
  }
  if ((v13 & 1) == 0)
  {
LABEL_72:
    FatalErrorF();
LABEL_73:
    FatalErrorF();
    goto LABEL_74;
  }
  v54 = [v17 SSID];
  uint64_t v55 = [v54 length];

  if (!v55)
  {
LABEL_99:
    FatalErrorF();
    goto LABEL_100;
  }
  BOOL v19 = 1;
LABEL_63:
  v56 = [v17 SSIDPrefix];

  if (v56)
  {
    if (v13)
    {
      v57 = [v17 SSIDPrefix];
      uint64_t v58 = [v57 length];

      if (v58)
      {
        BOOL v19 = 1;
        goto LABEL_67;
      }
LABEL_100:
      FatalErrorF();
      goto LABEL_101;
    }
    goto LABEL_72;
  }
LABEL_67:
  uint64_t v59 = [v17 SSID];
  if (!v59
    || (long long v60 = (void *)v59,
        [v17 SSIDPrefix],
        long long v61 = objc_claimAutoreleasedReturnValue(),
        v61,
        v60,
        !v61))
  {
    if (v19)
    {

LABEL_71:
      return;
    }
LABEL_101:
    FatalErrorF();
  }
  uint64_t v62 = FatalErrorF();
  __43__ASAccessorySession__validateDisplayItem___block_invoke(v62, v63);
}

id __43__ASAccessorySession__validateDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CUPrintHex();
  if ([v2 caseInsensitiveCompare:v3]) {
    id v4 = 0;
  }
  else {
    id v4 = v2;
  }
  id v5 = v4;

  return v5;
}

- (void)_validateMigrationDisplayItem:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  id v5 = [v4 infoDictionary];

  id v23 = v5;
  [v5 objectForKeyedSubscript:@"NSAccessorySetupKitSupports"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    int v10 = 0;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v6);
        }
        int v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v10 |= [v13 isEqualToString:@"Bluetooth"];
        v9 |= [v13 isEqualToString:@"WiFi"];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }
  else
  {
    LOBYTE(v9) = 0;
    LOBYTE(v10) = 0;
  }

  uint64_t v14 = [v3 peripheralIdentifier];
  if (v14)
  {

    goto LABEL_13;
  }
  uint64_t v15 = [v3 hotspotSSID];

  if (v15)
  {
LABEL_13:
    id v16 = [v3 hotspotSSID];
    id v17 = v16;
    if (((v16 != 0) & v9) == 1)
    {
      int v18 = [v3 hotspotSSID];

      if (v18) {
        goto LABEL_15;
      }
    }
    else
    {

      if (!v17)
      {
LABEL_15:
        id v17 = [v3 peripheralIdentifier];
        if (((v17 != 0) & v10) == 1)
        {
          BOOL v19 = [v3 peripheralIdentifier];

          if (v19)
          {
LABEL_17:

            return;
          }
LABEL_21:
          FatalErrorF();
        }
LABEL_20:

        if (!v17) {
          goto LABEL_17;
        }
        goto LABEL_21;
      }
    }
    FatalErrorF();
    goto LABEL_20;
  }
  unsigned int v20 = (ASAccessorySession *)FatalErrorF();
  [(ASAccessorySession *)v20 allowedToActivatePicker:v22];
}

- (BOOL)allowedToActivatePicker:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F086E0] mainBundle];
  id v6 = [v5 infoDictionary];

  [v6 objectForKeyedSubscript:@"NSAccessorySetupKitSupports"];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v8)
  {

LABEL_36:
    BOOL v22 = 1;
    goto LABEL_37;
  }
  int v9 = 0;
  uint64_t v10 = *(void *)v30;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v30 != v10) {
        objc_enumerationMutation(v7);
      }
      v9 |= [*(id *)(*((void *)&v29 + 1) + 8 * i) isEqualToString:@"Bluetooth"];
    }
    uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  }
  while (v8);

  if ((v9 & 1) == 0) {
    goto LABEL_36;
  }
  uint64_t v12 = self;
  objc_sync_enter(v12);
  int v13 = [(NSMutableDictionary *)v12->_accessories allValues];
  BOOL v14 = [v13 count] == 0;

  if (!v14)
  {
    if (gLogCategory_ASAccessorySession <= 40
      && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_sync_exit(v12);

    goto LABEL_36;
  }
  objc_sync_exit(v12);

  pthread_mutex_lock(&allowedToActivatePicker__gLock);
  if (!allowedToActivatePicker__tccServer)
  {
    uint64_t v15 = tcc_server_create();
    id v16 = (void *)allowedToActivatePicker__tccServer;
    allowedToActivatePicker__tccServer = v15;
  }
  pthread_mutex_unlock(&allowedToActivatePicker__gLock);
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 2;
  id v17 = (void *)tcc_message_options_create();
  tcc_message_options_set_reply_handler_policy();
  tcc_message_options_set_request_prompt_policy();
  int v18 = tcc_credential_singleton_for_self();
  BOOL v19 = tcc_service_singleton_for_CF_name();
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__ASAccessorySession_allowedToActivatePicker___block_invoke;
  aBlock[3] = &unk_265175458;
  void aBlock[4] = &v25;
  unsigned int v20 = _Block_copy(aBlock);
  tcc_server_message_request_authorization();
  unsigned int v21 = *((_DWORD *)v26 + 6);
  if (v21 >= 2)
  {
    if (v21 == 2)
    {
      if (gLogCategory_ASAccessorySession <= 40
        && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v12->_tccStateUnkown = 1;
    }
    goto LABEL_35;
  }
  if (gLogCategory_ASAccessorySession <= 40
    && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (![MEMORY[0x263EFEF38] retrieveCurrentProcessSessionCount])
  {
LABEL_35:

    _Block_object_dispose(&v25, 8);
    goto LABEL_36;
  }
  if (gLogCategory_ASAccessorySession <= 40
    && (gLogCategory_ASAccessorySession != -1 || _LogCategory_Initialize()))
  {
    [MEMORY[0x263EFEF38] retrieveCurrentProcessSessionCount];
    LogPrintF();
  }

  _Block_object_dispose(&v25, 8);
  BOOL v22 = 0;
LABEL_37:

  return v22;
}

uint64_t __46__ASAccessorySession_allowedToActivatePicker___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v3 = result;
    result = tcc_authorization_record_get_authorization_right();
    int v4 = 2 * (result != 2);
    if (!result) {
      int v4 = 1;
    }
    *(_DWORD *)(*(void *)(*(void *)(v3 + 32) + 8) + 24) = v4;
  }
  return result;
}

- (DASession)daSession
{
  return self->_daSession;
}

- (void)setDaSession:(id)a3
{
}

- (OS_xpc_object)xpcListenerEndpoint
{
  return self->_xpcListenerEndpoint;
}

- (void)setXpcListenerEndpoint:(id)a3
{
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (BOOL)disablePickerItemMaxLimit
{
  return self->_disablePickerItemMaxLimit;
}

- (void)setDisablePickerItemMaxLimit:(BOOL)a3
{
  self->_disablePickerItemMaxLimit = a3;
}

- (NSString)overrideAppBundleID
{
  return self->_overrideAppBundleID;
}

- (void)setOverrideAppBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideAppBundleID, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_daSession, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_accessories, 0);
}

@end