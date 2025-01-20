@interface ACCCommunicationsFeaturePlugin
- (ACCCommunicationsCenter)commCenter;
- (BOOL)acceptCallWithAction:(int)a3 callUUID:(id)a4;
- (BOOL)currentMuteStatus;
- (BOOL)endAllCalls;
- (BOOL)endCallWithAction:(int)a3 callUUID:(id)a4;
- (BOOL)initiateCallToDestination:(id)a3 withService:(int)a4 addressBookID:(id)a5;
- (BOOL)initiateCallToVoicemail;
- (BOOL)initiateRedial;
- (BOOL)isAirplaneModeEnabled;
- (BOOL)isCellularSupported;
- (BOOL)isEndAndAcceptAvailable;
- (BOOL)isFaceTimeAudioEnabled;
- (BOOL)isFaceTimeVideoEnabled;
- (BOOL)isHoldAndAcceptAvailable;
- (BOOL)isHoldAvailable;
- (BOOL)isInitiateCallAllowed;
- (BOOL)isMergeAvailable;
- (BOOL)isRunning;
- (BOOL)isSwapAvailable;
- (BOOL)isTelephonyEnabled;
- (BOOL)mergeCalls;
- (BOOL)sendDTMF:(int)a3 forCallWithUUID:(id)a4;
- (BOOL)swapCalls;
- (BOOL)updateHoldStatus:(BOOL)a3 forCallWithUUID:(id)a4;
- (BOOL)updateMuteStatus:(BOOL)a3;
- (CHManager)chManager;
- (NSString)description;
- (NSString)pluginName;
- (OS_dispatch_queue)queue;
- (RadiosPreferences)radiosPreferences;
- (VMVoicemailManager)vmManager;
- (id)currentAudioAndVideoCalls;
- (id)currentCallStates;
- (id)currentCarrierName;
- (id)currentCommunicationsStatus;
- (id)currentFavoritesListWithLimit:(unint64_t)a3;
- (id)currentLocalizedCarrierName;
- (id)currentRecentsListWithCoalescing:(BOOL)a3 limit:(unint64_t)a4;
- (int)currentRegistrationStatus;
- (int)currentSignalStrength;
- (unint64_t)currentCallCount;
- (unint64_t)currentUnreadVoicemailCount;
- (void)addNotificationObservers;
- (void)airplaneModeChanged;
- (void)callStateDidChangeForCall:(id)a3;
- (void)callStateDidChangeNotification:(id)a3;
- (void)commStatusDidChangeNotification:(id)a3;
- (void)favoritesListDidChangeNotification:(id)a3;
- (void)initPlugin;
- (void)initiateRedial;
- (void)recentsListDidChangeNotification:(id)a3;
- (void)removeNotificationObservers;
- (void)setChManager:(id)a3;
- (void)setCommCenter:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setRadiosPreferences:(id)a3;
- (void)setVmManager:(id)a3;
- (void)startPlugin;
- (void)stopPlugin;
@end

@implementation ACCCommunicationsFeaturePlugin

- (NSString)pluginName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(ACCCommunicationsFeaturePlugin *)self pluginName];
  uint64_t v5 = obfuscatedPointer((uint64_t)self);
  BOOL v6 = [(ACCCommunicationsFeaturePlugin *)self isRunning];
  v7 = "NO";
  if (v6) {
    v7 = "YES";
  }
  v8 = [v3 stringWithFormat:@"<%@: %p> isRunning: %s", v4, v5, v7];

  return (NSString *)v8;
}

- (void)initPlugin
{
  init_logging();
  [(ACCCommunicationsFeaturePlugin *)self setIsRunning:0];
  id v3 = [(ACCCommunicationsFeaturePlugin *)self pluginName];
  dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
  [(ACCCommunicationsFeaturePlugin *)self setQueue:v4];

  [(ACCCommunicationsFeaturePlugin *)self setCommCenter:0];
  [(ACCCommunicationsFeaturePlugin *)self setVmManager:0];
  [(ACCCommunicationsFeaturePlugin *)self setRadiosPreferences:0];
  [(ACCCommunicationsFeaturePlugin *)self setChManager:0];
}

- (void)startPlugin
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_224EAC000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

- (void)stopPlugin
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    uint8_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint8_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_224EAC000, v5, OS_LOG_TYPE_DEFAULT, "Stopping Communications feature plugin...", v7, 2u);
  }

  BOOL v6 = [(ACCCommunicationsFeaturePlugin *)self commCenter];
  [v6 setCallStateDelegate:0];

  [(ACCCommunicationsFeaturePlugin *)self setCommCenter:0];
  [(ACCCommunicationsFeaturePlugin *)self setVmManager:0];
  [(ACCCommunicationsFeaturePlugin *)self setRadiosPreferences:0];
  [(ACCCommunicationsFeaturePlugin *)self setChManager:0];
  [(ACCCommunicationsFeaturePlugin *)self setIsRunning:0];
}

- (void)addNotificationObservers
{
  BOOL v3 = [(ACCCommunicationsFeaturePlugin *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__ACCCommunicationsFeaturePlugin_addNotificationObservers__block_invoke;
  block[3] = &unk_2647098B0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __58__ACCCommunicationsFeaturePlugin_addNotificationObservers__block_invoke(uint64_t a1)
{
  executeOnMainThreadSync((uint64_t)&__block_literal_global_0);
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    id v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    id v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_224EAC000, v4, OS_LOG_TYPE_INFO, "Adding notification observers...", v23, 2u);
  }

  uint8_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:*(void *)(a1 + 32) selector:sel_callStateDidChangeNotification_ name:*MEMORY[0x263F7E310] object:0];

  BOOL v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:*(void *)(a1 + 32) selector:sel_callStateDidChangeNotification_ name:*MEMORY[0x263F7E328] object:0];

  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:*(void *)(a1 + 32) selector:sel_callStateDidChangeNotification_ name:*MEMORY[0x263F7E2F8] object:0];

  v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:*(void *)(a1 + 32) selector:sel_callStateDidChangeNotification_ name:*MEMORY[0x263F7E318] object:0];

  v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:*(void *)(a1 + 32) selector:sel_callStateDidChangeNotification_ name:*MEMORY[0x263F7E320] object:0];

  CTTelephonyCenterSetDefaultDispatchQueue();
  CTTelephonyCenterGetDefault();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  id v10 = objc_alloc_init(MEMORY[0x263F255D8]);
  [*(id *)(a1 + 32) setRadiosPreferences:v10];

  v11 = *(void **)(a1 + 32);
  v12 = [v11 radiosPreferences];
  [v12 setDelegate:v11];

  CTTelephonyCenterAddObserver();
  v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 addObserver:*(void *)(a1 + 32) selector:sel_commStatusDidChangeNotification_ name:*MEMORY[0x263F7E2E8] object:0];

  v14 = [MEMORY[0x263F3BAD8] sharedInstance];
  [v14 addListenerID:@"com.apple.accessories.features.Communications" forService:2];

  v15 = [MEMORY[0x263F3BAD8] sharedInstance];
  [v15 addListenerID:@"com.apple.accessories.features.Communications" forService:0];

  v16 = [MEMORY[0x263F08A00] defaultCenter];
  [v16 addObserver:*(void *)(a1 + 32) selector:sel_commStatusDidChangeNotification_ name:*MEMORY[0x263F3BAB0] object:0];

  executeOnMainThreadSync((uint64_t)&__block_literal_global_29);
  v17 = [MEMORY[0x263F08A00] defaultCenter];
  [v17 addObserver:*(void *)(a1 + 32) selector:sel_commStatusDidChangeNotification_ name:*MEMORY[0x263F7E2B0] object:0];

  id v18 = objc_alloc_init(MEMORY[0x263F84CE8]);
  [*(id *)(a1 + 32) setVmManager:v18];

  v19 = [MEMORY[0x263F08A00] defaultCenter];
  [v19 addObserver:*(void *)(a1 + 32) selector:sel_commStatusDidChangeNotification_ name:*MEMORY[0x263F84D40] object:0];

  v20 = [MEMORY[0x263F08A00] defaultCenter];
  [v20 addObserver:*(void *)(a1 + 32) selector:sel_commStatusDidChangeNotification_ name:*MEMORY[0x263F7E350] object:0];

  v21 = [MEMORY[0x263F08A00] defaultCenter];
  [v21 addObserver:*(void *)(a1 + 32) selector:sel_recentsListDidChangeNotification_ name:*MEMORY[0x263F30630] object:0];

  v22 = [MEMORY[0x263F08A00] defaultCenter];
  [v22 addObserver:*(void *)(a1 + 32) selector:sel_favoritesListDidChangeNotification_ name:*MEMORY[0x263EFE1A8] object:0];
}

id __58__ACCCommunicationsFeaturePlugin_addNotificationObservers__block_invoke_2()
{
  return (id)[MEMORY[0x263F7E1A0] sharedInstance];
}

id __58__ACCCommunicationsFeaturePlugin_addNotificationObservers__block_invoke_27()
{
  return (id)[MEMORY[0x263F7E188] sharedAudioSystemController];
}

- (void)removeNotificationObservers
{
  id v3 = [(ACCCommunicationsFeaturePlugin *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__ACCCommunicationsFeaturePlugin_removeNotificationObservers__block_invoke;
  block[3] = &unk_2647098B0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __61__ACCCommunicationsFeaturePlugin_removeNotificationObservers__block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    id v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    id v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_224EAC000, v4, OS_LOG_TYPE_INFO, "Removing all notification observers...", v19, 2u);
  }

  uint8_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x263F7E310] object:0];

  BOOL v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x263F7E328] object:0];

  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x263F7E2F8] object:0];

  v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x263F7E318] object:0];

  CTTelephonyCenterSetDefaultDispatchQueue();
  CTTelephonyCenterGetDefault();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  v9 = [*(id *)(a1 + 32) radiosPreferences];
  [v9 setDelegate:0];

  [*(id *)(a1 + 32) setRadiosPreferences:0];
  CTTelephonyCenterRemoveObserver();
  id v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x263F7E2E8] object:0];

  v11 = [MEMORY[0x263F3BAD8] sharedInstance];
  [v11 removeListenerID:@"com.apple.accessories.features.Communications" forService:2];

  v12 = [MEMORY[0x263F3BAD8] sharedInstance];
  [v12 removeListenerID:@"com.apple.accessories.features.Communications" forService:0];

  v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x263F3BAB0] object:0];

  executeOnMainThreadSync((uint64_t)&__block_literal_global_38);
  v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x263F7E2B0] object:0];

  v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x263F84D40] object:0];

  [*(id *)(a1 + 32) setVmManager:0];
  v16 = [MEMORY[0x263F08A00] defaultCenter];
  [v16 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x263F7E350] object:0];

  v17 = [MEMORY[0x263F08A00] defaultCenter];
  [v17 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x263F30630] object:0];

  id v18 = [MEMORY[0x263F08A00] defaultCenter];
  [v18 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x263EFE1A8] object:0];
}

id __61__ACCCommunicationsFeaturePlugin_removeNotificationObservers__block_invoke_36()
{
  return (id)[MEMORY[0x263F7E188] sharedAudioSystemController];
}

- (void)callStateDidChangeForCall:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_224EAC000, v7, OS_LOG_TYPE_DEFAULT, "Sending call state update:\n%@", (uint8_t *)&v9, 0xCu);
  }

  v8 = [(ACCCommunicationsFeaturePlugin *)self commCenter];
  [v8 callStateDidChange:v4];
}

- (void)callStateDidChangeNotification:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v62 = v4;
    _os_log_impl(&dword_224EAC000, v7, OS_LOG_TYPE_INFO, "Notification received:\n%@", buf, 0xCu);
  }

  v8 = [v4 name];
  uint64_t v9 = *MEMORY[0x263F7E310];
  char v10 = [v8 isEqualToString:*MEMORY[0x263F7E310]];
  uint64_t v11 = (void *)MEMORY[0x263F7E2F8];
  if (v10) {
    goto LABEL_16;
  }
  v12 = [v4 name];
  if ([v12 isEqualToString:*MEMORY[0x263F7E328]])
  {
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }
  v13 = [v4 name];
  if ([v13 isEqualToString:*v11])
  {

    goto LABEL_15;
  }
  v37 = [v4 name];
  char v38 = [v37 isEqualToString:*MEMORY[0x263F7E320]];

  if ((v38 & 1) == 0)
  {
    v39 = [v4 name];
    int v40 = [v39 isEqualToString:*MEMORY[0x263F7E318]];

    if (!v40) {
      goto LABEL_67;
    }
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v17 = [(ACCCommunicationsFeaturePlugin *)self currentAudioAndVideoCalls];
    uint64_t v41 = [v17 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      id v49 = v4;
      uint64_t v43 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v53 != v43) {
            objc_enumerationMutation(v17);
          }
          v45 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          if ([v45 status] == 1)
          {
            v46 = _callStateDictionaryForCall(v45);
            v47 = [(ACCCommunicationsFeaturePlugin *)self queue];
            v50[0] = MEMORY[0x263EF8330];
            v50[1] = 3221225472;
            v50[2] = __65__ACCCommunicationsFeaturePlugin_callStateDidChangeNotification___block_invoke_3;
            v50[3] = &unk_2647098D8;
            v50[4] = self;
            id v51 = v46;
            id v48 = v46;
            dispatch_async(v47, v50);
          }
        }
        uint64_t v42 = [v17 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v42);
      id v4 = v49;
    }
    goto LABEL_66;
  }
LABEL_17:
  v14 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v16 = [v4 object];
    v17 = v16;
    if (!v16) {
      goto LABEL_66;
    }
    if ([v16 status] == 3
      || [v17 status] == 4
      || [v17 status] == 6
      || [v17 status] == 1 && (objc_msgSend(v17, "isScreening") & 1) != 0
      || [v17 status] == 1
      && ([v17 isScreening] & 1) == 0
      && [v17 wasScreened])
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v18 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCCommunicationsFeaturePlugin startPlugin]();
        }
        id v18 = MEMORY[0x263EF8438];
        id v19 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[ACCCommunicationsFeaturePlugin callStateDidChangeNotification:].cold.5();
      }

      v20 = [MEMORY[0x263F089F8] notificationWithName:@"CallCountDidChangeNotification" object:0];
      [(ACCCommunicationsFeaturePlugin *)self commStatusDidChangeNotification:v20];
    }
    v21 = [v4 name];
    if ([v21 isEqualToString:v9])
    {
    }
    else
    {
      v22 = [v4 name];
      int v23 = [v22 isEqualToString:*MEMORY[0x263F7E328]];

      if (!v23)
      {
LABEL_48:
        v27 = [v4 name];
        if (![v27 isEqualToString:*v11]
          || [v17 status] == 1)
        {

          goto LABEL_52;
        }
        char v28 = [v17 isScreening];

        if (v28)
        {
LABEL_52:
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v29 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCCommunicationsFeaturePlugin startPlugin]();
            }
            v29 = MEMORY[0x263EF8438];
            id v30 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            -[ACCCommunicationsFeaturePlugin callStateDidChangeNotification:](v4);
          }

          v31 = _callStateDictionaryForCall(v17);
          if (acc_userDefaults_copyIntegerForKey(@"LiveVoicemailFakeRinging")
            && [v17 status] == 1
            && ([v17 isScreening] & 1) == 0
            && [v17 wasScreened])
          {
            v32 = (void *)[v31 mutableCopy];
            [v32 setValue:&unk_26D8475B8 forKey:*MEMORY[0x263F22D18]];
            v33 = [(ACCCommunicationsFeaturePlugin *)self queue];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __65__ACCCommunicationsFeaturePlugin_callStateDidChangeNotification___block_invoke;
            block[3] = &unk_2647098D8;
            block[4] = self;
            id v59 = v32;
            id v34 = v32;
            dispatch_async(v33, block);
          }
          v35 = [(ACCCommunicationsFeaturePlugin *)self queue];
          v56[0] = MEMORY[0x263EF8330];
          v56[1] = 3221225472;
          v56[2] = __65__ACCCommunicationsFeaturePlugin_callStateDidChangeNotification___block_invoke_2;
          v56[3] = &unk_2647098D8;
          v56[4] = self;
          id v57 = v31;
          id v36 = v31;
          dispatch_async(v35, v56);
        }
LABEL_66:

        goto LABEL_67;
      }
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v24 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      v24 = MEMORY[0x263EF8438];
      id v25 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[ACCCommunicationsFeaturePlugin callStateDidChangeNotification:]();
    }

    v26 = [MEMORY[0x263F089F8] notificationWithName:*MEMORY[0x263F7E350] object:0];
    [(ACCCommunicationsFeaturePlugin *)self commStatusDidChangeNotification:v26];

    goto LABEL_48;
  }
LABEL_67:
}

uint64_t __65__ACCCommunicationsFeaturePlugin_callStateDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) callStateDidChangeForCall:*(void *)(a1 + 40)];
}

uint64_t __65__ACCCommunicationsFeaturePlugin_callStateDidChangeNotification___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) callStateDidChangeForCall:*(void *)(a1 + 40)];
}

uint64_t __65__ACCCommunicationsFeaturePlugin_callStateDidChangeNotification___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) callStateDidChangeForCall:*(void *)(a1 + 40)];
}

- (void)commStatusDidChangeNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_224EAC000, v7, OS_LOG_TYPE_INFO, "Notification received:\n%@", buf, 0xCu);
  }

  v8 = [(ACCCommunicationsFeaturePlugin *)self queue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__ACCCommunicationsFeaturePlugin_commStatusDidChangeNotification___block_invoke;
  v10[3] = &unk_2647098D8;
  id v11 = v4;
  v12 = self;
  id v9 = v4;
  dispatch_async(v8, v10);
}

void __66__ACCCommunicationsFeaturePlugin_commStatusDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  BOOL v2 = [MEMORY[0x263EFF9A0] dictionary];
  id v3 = [*(id *)(a1 + 32) name];
  int v4 = [v3 isEqualToString:*MEMORY[0x263F02E40]];

  if (v4 && ([*(id *)(a1 + 40) isAirplaneModeEnabled] & 1) == 0)
  {
    BOOL v5 = [*(id *)(a1 + 32) userInfo];
    id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F02E38]];
    uint64_t v7 = _convertCTGradedSignalToCommSignal(v6);

    v8 = [NSNumber numberWithInt:v7];
    [v2 setObject:v8 forKey:*MEMORY[0x263F22D90]];
  }
  id v9 = [*(id *)(a1 + 32) name];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F02FE8]];

  id v11 = (void *)MEMORY[0x263F22D28];
  if (v10 && ([*(id *)(a1 + 40) isAirplaneModeEnabled] & 1) == 0)
  {
    v12 = [*(id *)(a1 + 32) userInfo];
    v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F02FE0]];
    uint64_t v14 = _convertCTRegStatusToCommRegStatus(v13);

    uint64_t v15 = [NSNumber numberWithInt:v14];
    [v2 setObject:v15 forKey:*MEMORY[0x263F22D88]];

    v16 = [*(id *)(a1 + 40) currentLocalizedCarrierName];
    [v2 setObject:v16 forKey:*v11];
  }
  v17 = [*(id *)(a1 + 32) name];
  int v18 = [v17 isEqualToString:@"AirplaneModeDidChangeNotification"];

  if (v18)
  {
    id v19 = NSNumber;
    v20 = [*(id *)(a1 + 40) radiosPreferences];
    v21 = objc_msgSend(v19, "numberWithBool:", objc_msgSend(v20, "airplaneMode"));
    [v2 setObject:v21 forKey:*MEMORY[0x263F22D20]];

    v22 = [*(id *)(a1 + 40) currentLocalizedCarrierName];
    [v2 setObject:v22 forKey:*v11];

    if ([*(id *)(a1 + 40) isAirplaneModeEnabled])
    {
      [v2 setObject:&unk_26D8475D0 forKey:*MEMORY[0x263F22D90]];
      [v2 setObject:&unk_26D8475E8 forKey:*MEMORY[0x263F22D88]];
    }
    else
    {
      int v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "currentSignalStrength"));
      [v2 setObject:v23 forKey:*MEMORY[0x263F22D90]];

      v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "currentRegistrationStatus"));
      [v2 setObject:v24 forKey:*MEMORY[0x263F22D88]];
    }
  }
  id v25 = [*(id *)(a1 + 32) name];
  int v26 = [v25 isEqualToString:*MEMORY[0x263F02FC0]];

  if (v26)
  {
    v27 = [*(id *)(a1 + 40) currentLocalizedCarrierName];
    [v2 setObject:v27 forKey:*v11];
  }
  char v28 = [*(id *)(a1 + 32) name];
  int v29 = [v28 isEqualToString:*MEMORY[0x263F7E2E8]];

  if (v29)
  {
    id v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x263F7E198], "supportsTelephonyCalls"));
    [v2 setObject:v30 forKey:*MEMORY[0x263F22DA0]];
  }
  v31 = [*(id *)(a1 + 32) name];
  int v32 = [v31 isEqualToString:*MEMORY[0x263F3BAB0]];

  if (v32)
  {
    v33 = [*(id *)(a1 + 32) userInfo];
    id v34 = [v33 objectForKey:*MEMORY[0x263F3BAA8]];
    uint64_t v35 = [v34 BOOLValue];

    id v36 = [*(id *)(a1 + 32) userInfo];
    v37 = [v36 objectForKey:*MEMORY[0x263F3BAB8]];
    uint64_t v38 = [v37 integerValue];

    if (v38 == 2)
    {
      v39 = (void *)MEMORY[0x263F22D48];
    }
    else
    {
      if (v38) {
        goto LABEL_21;
      }
      v39 = (void *)MEMORY[0x263F22D50];
    }
    int v40 = [NSNumber numberWithBool:v35];
    [v2 setObject:v40 forKey:*v39];
  }
LABEL_21:
  uint64_t v41 = [*(id *)(a1 + 32) name];
  int v42 = [v41 isEqualToString:*MEMORY[0x263F7E2B0]];

  if (v42)
  {
    uint64_t v43 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "currentMuteStatus"));
    [v2 setObject:v43 forKey:*MEMORY[0x263F22D78]];
  }
  v44 = [*(id *)(a1 + 32) name];
  int v45 = [v44 isEqualToString:@"CallCountDidChangeNotification"];

  if (v45)
  {
    v46 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "currentCallCount"));
    [v2 setObject:v46 forKey:*MEMORY[0x263F22D38]];
  }
  v47 = [*(id *)(a1 + 32) name];
  int v48 = [v47 isEqualToString:*MEMORY[0x263F84D40]];

  if (v48)
  {
    id v49 = NSNumber;
    v50 = [*(id *)(a1 + 40) vmManager];
    id v51 = objc_msgSend(v49, "numberWithUnsignedChar:", objc_msgSend(v50, "unreadCount"));
    [v2 setObject:v51 forKey:*MEMORY[0x263F22D80]];
  }
  long long v52 = [*(id *)(a1 + 32) name];
  int v53 = [v52 isEqualToString:*MEMORY[0x263F7E350]];

  if (v53)
  {
    long long v54 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isInitiateCallAllowed"));
    [v2 setObject:v54 forKey:*MEMORY[0x263F22D68]];

    long long v55 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isEndAndAcceptAvailable"));
    [v2 setObject:v55 forKey:*MEMORY[0x263F22D40]];

    v56 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isHoldAndAcceptAvailable"));
    [v2 setObject:v56 forKey:*MEMORY[0x263F22D58]];

    id v57 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSwapAvailable"));
    [v2 setObject:v57 forKey:*MEMORY[0x263F22D98]];

    v58 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isMergeAvailable"));
    [v2 setObject:v58 forKey:*MEMORY[0x263F22D70]];

    id v59 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isHoldAvailable"));
    [v2 setObject:v59 forKey:*MEMORY[0x263F22D60]];
  }
  if ([v2 count])
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v60 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      v60 = MEMORY[0x263EF8438];
      id v61 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      int v64 = 138412290;
      v65 = v2;
      _os_log_impl(&dword_224EAC000, v60, OS_LOG_TYPE_DEFAULT, "Sending communications update:\n%@", (uint8_t *)&v64, 0xCu);
    }

    id v62 = [*(id *)(a1 + 40) commCenter];
    uint64_t v63 = (void *)[v2 copy];
    [v62 commStatusDidChange:v63];
  }
}

- (void)recentsListDidChangeNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    uint64_t v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_224EAC000, v7, OS_LOG_TYPE_INFO, "Notification received:\n%@", buf, 0xCu);
  }

  v8 = [(ACCCommunicationsFeaturePlugin *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__ACCCommunicationsFeaturePlugin_recentsListDidChangeNotification___block_invoke;
  block[3] = &unk_2647098B0;
  block[4] = self;
  dispatch_async(v8, block);
}

void __67__ACCCommunicationsFeaturePlugin_recentsListDidChangeNotification___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) commCenter];
  [v1 recentsListDidChange];
}

- (void)favoritesListDidChangeNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    uint64_t v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_224EAC000, v7, OS_LOG_TYPE_INFO, "Notification received:\n%@", buf, 0xCu);
  }

  v8 = [(ACCCommunicationsFeaturePlugin *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__ACCCommunicationsFeaturePlugin_favoritesListDidChangeNotification___block_invoke;
  block[3] = &unk_2647098B0;
  block[4] = self;
  dispatch_async(v8, block);
}

void __69__ACCCommunicationsFeaturePlugin_favoritesListDidChangeNotification___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) commCenter];
  [v1 favoritesListDidChange];
}

- (id)currentCallStates
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(ACCCommunicationsFeaturePlugin *)self currentAudioAndVideoCalls];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = _callStateDictionaryForCall(*(void **)(*((void *)&v12 + 1) + 8 * i));
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  if (v3 && [v3 count]) {
    int v10 = (void *)[v3 copy];
  }
  else {
    int v10 = 0;
  }

  return v10;
}

- (id)currentCommunicationsStatus
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[ACCCommunicationsFeaturePlugin currentSignalStrength](self, "currentSignalStrength"));
  [v3 setObject:v4 forKey:*MEMORY[0x263F22D90]];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", -[ACCCommunicationsFeaturePlugin currentRegistrationStatus](self, "currentRegistrationStatus"));
  [v3 setObject:v5 forKey:*MEMORY[0x263F22D88]];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[ACCCommunicationsFeaturePlugin isAirplaneModeEnabled](self, "isAirplaneModeEnabled"));
  [v3 setObject:v6 forKey:*MEMORY[0x263F22D20]];

  uint64_t v7 = [(ACCCommunicationsFeaturePlugin *)self currentLocalizedCarrierName];
  [v3 setObject:v7 forKey:*MEMORY[0x263F22D28]];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[ACCCommunicationsFeaturePlugin isCellularSupported](self, "isCellularSupported"));
  [v3 setObject:v8 forKey:*MEMORY[0x263F22D30]];

  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ACCCommunicationsFeaturePlugin isTelephonyEnabled](self, "isTelephonyEnabled"));
  [v3 setObject:v9 forKey:*MEMORY[0x263F22DA0]];

  int v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ACCCommunicationsFeaturePlugin isFaceTimeAudioEnabled](self, "isFaceTimeAudioEnabled"));
  [v3 setObject:v10 forKey:*MEMORY[0x263F22D48]];

  id v11 = objc_msgSend(NSNumber, "numberWithBool:", -[ACCCommunicationsFeaturePlugin isFaceTimeVideoEnabled](self, "isFaceTimeVideoEnabled"));
  [v3 setObject:v11 forKey:*MEMORY[0x263F22D50]];

  long long v12 = objc_msgSend(NSNumber, "numberWithBool:", -[ACCCommunicationsFeaturePlugin currentMuteStatus](self, "currentMuteStatus"));
  [v3 setObject:v12 forKey:*MEMORY[0x263F22D78]];

  long long v13 = objc_msgSend(NSNumber, "numberWithChar:", (char)-[ACCCommunicationsFeaturePlugin currentCallCount](self, "currentCallCount"));
  [v3 setObject:v13 forKey:*MEMORY[0x263F22D38]];

  long long v14 = objc_msgSend(NSNumber, "numberWithChar:", (char)-[ACCCommunicationsFeaturePlugin currentUnreadVoicemailCount](self, "currentUnreadVoicemailCount"));
  [v3 setObject:v14 forKey:*MEMORY[0x263F22D80]];

  long long v15 = objc_msgSend(NSNumber, "numberWithBool:", -[ACCCommunicationsFeaturePlugin isInitiateCallAllowed](self, "isInitiateCallAllowed"));
  [v3 setObject:v15 forKey:*MEMORY[0x263F22D68]];

  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[ACCCommunicationsFeaturePlugin isEndAndAcceptAvailable](self, "isEndAndAcceptAvailable"));
  [v3 setObject:v16 forKey:*MEMORY[0x263F22D40]];

  uint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", -[ACCCommunicationsFeaturePlugin isHoldAndAcceptAvailable](self, "isHoldAndAcceptAvailable"));
  [v3 setObject:v17 forKey:*MEMORY[0x263F22D58]];

  int v18 = objc_msgSend(NSNumber, "numberWithBool:", -[ACCCommunicationsFeaturePlugin isSwapAvailable](self, "isSwapAvailable"));
  [v3 setObject:v18 forKey:*MEMORY[0x263F22D98]];

  id v19 = objc_msgSend(NSNumber, "numberWithBool:", -[ACCCommunicationsFeaturePlugin isMergeAvailable](self, "isMergeAvailable"));
  [v3 setObject:v19 forKey:*MEMORY[0x263F22D70]];

  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[ACCCommunicationsFeaturePlugin isHoldAvailable](self, "isHoldAvailable"));
  [v3 setObject:v20 forKey:*MEMORY[0x263F22D60]];

  if (v3 && [v3 count]) {
    v21 = (void *)[v3 copy];
  }
  else {
    v21 = 0;
  }

  return v21;
}

- (void)airplaneModeChanged
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_224EAC000, v0, v1, "Converting delegate callback to NSNotification...", v2, v3, v4, v5, v6);
}

- (int)currentSignalStrength
{
  if ([(ACCCommunicationsFeaturePlugin *)self isAirplaneModeEnabled]) {
    return 0;
  }
  CTIndicatorsGetSignalStrength();
  uint64_t v3 = [NSNumber numberWithInt:0];
  int v2 = _convertCTGradedSignalToCommSignal(v3);

  return v2;
}

- (int)currentRegistrationStatus
{
  if ([(ACCCommunicationsFeaturePlugin *)self isAirplaneModeEnabled]) {
    return 1;
  }
  Status = (void *)CTRegistrationGetStatus();
  return _convertCTRegStatusToCommRegStatus(Status);
}

- (BOOL)isAirplaneModeEnabled
{
  int v2 = [(ACCCommunicationsFeaturePlugin *)self radiosPreferences];
  char v3 = [v2 airplaneMode];

  return v3;
}

- (id)currentCarrierName
{
  int v2 = (void *)CTRegistrationCopyOperatorName();
  return v2;
}

- (id)currentLocalizedCarrierName
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [(ACCCommunicationsFeaturePlugin *)self currentCarrierName];
  unsigned int v4 = [(ACCCommunicationsFeaturePlugin *)self currentRegistrationStatus];
  BOOL v5 = [(ACCCommunicationsFeaturePlugin *)self isAirplaneModeEnabled];
  if (v5)
  {
    uint8_t v6 = acc_strings_bundle();
    uint64_t v7 = v6;
    v8 = @"Airplane Mode";
LABEL_8:
    int v10 = [v6 localizedStringForKey:v8 value:&stru_26D8469B0 table:0];

    goto LABEL_9;
  }
  SIMStatus = (const void *)CTSIMSupportGetSIMStatus();
  if (CFEqual(SIMStatus, (CFTypeRef)*MEMORY[0x263F03078]))
  {
    uint8_t v6 = acc_strings_bundle();
    uint64_t v7 = v6;
    v8 = @"No SIM";
    goto LABEL_8;
  }
  if (v4 <= 6 && ((1 << v4) & 0x4A) != 0)
  {
    uint8_t v6 = acc_strings_bundle();
    uint64_t v7 = v6;
    v8 = @"No Service";
    goto LABEL_8;
  }
  if ((v4 & 0xFFFFFFFD) == 0 || (int v10 = v3, [v3 isEqualToString:&stru_26D8469B0]))
  {
    uint8_t v6 = acc_strings_bundle();
    uint64_t v7 = v6;
    v8 = @"Searching...";
    goto LABEL_8;
  }
LABEL_9:
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    id v11 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    long long v14 = "NO";
    int v15 = 138413058;
    v16 = v10;
    __int16 v17 = 2112;
    if (v5) {
      long long v14 = "YES";
    }
    id v18 = v3;
    __int16 v19 = 1024;
    unsigned int v20 = v4;
    __int16 v21 = 2080;
    v22 = v14;
    _os_log_debug_impl(&dword_224EAC000, v11, OS_LOG_TYPE_DEBUG, "Generated localized carrier name: '%@' (origCarrierName: %@, registrationStatus: %{coreacc:ACCCommunications_CommunicationsUpdate_RegistrationStatus_t}d, airplaneMode: %s)", (uint8_t *)&v15, 0x26u);
  }

  return v10;
}

- (BOOL)isCellularSupported
{
  return MEMORY[0x270F95FB8](@"cellular-data", a2);
}

- (BOOL)isTelephonyEnabled
{
  return [MEMORY[0x263F7E198] supportsTelephonyCalls];
}

- (BOOL)isFaceTimeAudioEnabled
{
  int v2 = [MEMORY[0x263F3BAD8] sharedInstance];
  BOOL v3 = [v2 availabilityForListenerID:@"com.apple.accessories.features.Communications" forService:2] == 1;

  return v3;
}

- (BOOL)isFaceTimeVideoEnabled
{
  int v2 = [MEMORY[0x263F3BAD8] sharedInstance];
  BOOL v3 = [v2 availabilityForListenerID:@"com.apple.accessories.features.Communications" forService:0] == 1;

  return v3;
}

- (BOOL)currentMuteStatus
{
  int v2 = [MEMORY[0x263F7E188] sharedAudioSystemController];
  char v3 = [v2 isUplinkMuted];

  return v3;
}

- (id)currentAudioAndVideoCalls
{
  uint64_t v5 = 0;
  uint8_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  id v9 = __Block_byref_object_dispose_;
  id v10 = (id)MEMORY[0x263EFFA68];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__ACCCommunicationsFeaturePlugin_currentAudioAndVideoCalls__block_invoke;
  v4[3] = &unk_264709900;
  v4[4] = &v5;
  executeOnMainThreadSync((uint64_t)v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __59__ACCCommunicationsFeaturePlugin_currentAudioAndVideoCalls__block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x263F7E1A0] sharedInstance];
  uint64_t v2 = [v5 currentAudioAndVideoCalls];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  unsigned int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)currentCallCount
{
  uint64_t v5 = 0;
  uint8_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__ACCCommunicationsFeaturePlugin_currentCallCount__block_invoke;
  v4[3] = &unk_264709900;
  v4[4] = &v5;
  executeOnMainThreadSync((uint64_t)v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __50__ACCCommunicationsFeaturePlugin_currentCallCount__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v2 = objc_msgSend(MEMORY[0x263F7E1A0], "sharedInstance", 0);
  uint64_t v3 = [v2 currentAudioAndVideoCalls];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if (([*(id *)(*((void *)&v8 + 1) + 8 * v7) isScreening] & 1) == 0) {
          ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (unint64_t)currentUnreadVoicemailCount
{
  return 0;
}

- (BOOL)isInitiateCallAllowed
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__ACCCommunicationsFeaturePlugin_isInitiateCallAllowed__block_invoke;
  v4[3] = &unk_264709928;
  v4[4] = self;
  void v4[5] = &v5;
  executeOnMainThreadSync((uint64_t)v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __55__ACCCommunicationsFeaturePlugin_isInitiateCallAllowed__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) currentCallCount];
  uint64_t v3 = [MEMORY[0x263F7E1A0] sharedInstance];
  uint64_t v4 = [v3 currentCallGroups];
  unint64_t v5 = [v4 count];

  uint64_t v6 = [MEMORY[0x263F7E1A0] sharedInstance];
  int v7 = [v6 isAddCallAllowed];

  if (!v2 || v7) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  if (v5 >= 2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    char v8 = [MEMORY[0x263F7E1A0] sharedInstance];
    long long v9 = [v8 audioOrVideoCallWithStatus:4];
    if (v9)
    {

LABEL_10:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      goto LABEL_11;
    }
    long long v10 = [MEMORY[0x263F7E1A0] sharedInstance];
    long long v11 = [v10 audioOrVideoCallWithStatus:3];

    if (v11) {
      goto LABEL_10;
    }
  }
LABEL_11:
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v12 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    id v12 = MEMORY[0x263EF8438];
    id v13 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    long long v14 = "NO";
    if (v7) {
      int v15 = "YES";
    }
    else {
      int v15 = "NO";
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      long long v14 = "YES";
    }
    int v16 = 134218498;
    uint64_t v17 = v2;
    __int16 v18 = 2080;
    __int16 v19 = v15;
    __int16 v20 = 2080;
    __int16 v21 = v14;
    _os_log_debug_impl(&dword_224EAC000, v12, OS_LOG_TYPE_DEBUG, "currentCallCount: %lu, addCallAllowed: %s, initiateCallAllowed: %s", (uint8_t *)&v16, 0x20u);
  }
}

- (BOOL)isEndAndAcceptAvailable
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  if ([(ACCCommunicationsFeaturePlugin *)self currentCallCount] >= 2)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __57__ACCCommunicationsFeaturePlugin_isEndAndAcceptAvailable__block_invoke;
    v4[3] = &unk_264709900;
    v4[4] = &v5;
    executeOnMainThreadSync((uint64_t)v4);
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __57__ACCCommunicationsFeaturePlugin_isEndAndAcceptAvailable__block_invoke(uint64_t a1)
{
  char v2 = [MEMORY[0x263F7E1A0] sharedInstance];
  id v3 = [v2 audioOrVideoCallWithStatus:4];

  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (BOOL)isHoldAndAcceptAvailable
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v2 = [(ACCCommunicationsFeaturePlugin *)self isEndAndAcceptAvailable];
  *((unsigned char *)v7 + 24) = v2;
  if (v2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __58__ACCCommunicationsFeaturePlugin_isHoldAndAcceptAvailable__block_invoke;
    v5[3] = &unk_264709900;
    v5[4] = &v6;
    executeOnMainThreadSync((uint64_t)v5);
    BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  }
  else
  {
    BOOL v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __58__ACCCommunicationsFeaturePlugin_isHoldAndAcceptAvailable__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F7E1A0] sharedInstance];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 isHoldAndAnswerAllowed];
}

- (BOOL)isSwapAvailable
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__ACCCommunicationsFeaturePlugin_isSwapAvailable__block_invoke;
  v4[3] = &unk_264709900;
  v4[4] = &v5;
  executeOnMainThreadSync((uint64_t)v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __49__ACCCommunicationsFeaturePlugin_isSwapAvailable__block_invoke(uint64_t a1)
{
  char v2 = [MEMORY[0x263F7E1A0] sharedInstance];
  id v10 = [v2 frontmostAudioOrVideoCall];

  if (v10)
  {
    BOOL v3 = [v10 model];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 supportsHolding];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v4 = [MEMORY[0x263F7E1A0] sharedInstance];
    uint64_t v5 = [v4 currentCallGroups];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (unint64_t)[v5 count] > 1;

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      uint64_t v6 = [MEMORY[0x263F7E1A0] sharedInstance];
      uint64_t v7 = [v6 audioOrVideoCallWithStatus:4];
      if (v7)
      {
      }
      else
      {
        char v8 = [MEMORY[0x263F7E1A0] sharedInstance];
        char v9 = [v8 audioOrVideoCallWithStatus:3];

        if (!v9) {
          goto LABEL_9;
        }
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    }
  }
LABEL_9:
}

- (BOOL)isMergeAvailable
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__ACCCommunicationsFeaturePlugin_isMergeAvailable__block_invoke;
  v4[3] = &unk_264709900;
  v4[4] = &v5;
  executeOnMainThreadSync((uint64_t)v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __50__ACCCommunicationsFeaturePlugin_isMergeAvailable__block_invoke(uint64_t a1)
{
  char v2 = [MEMORY[0x263F7E1A0] sharedInstance];
  id v10 = [v2 frontmostAudioOrVideoCall];

  if (v10)
  {
    BOOL v3 = [v10 model];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 supportsGrouping];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v4 = [MEMORY[0x263F7E1A0] sharedInstance];
    uint64_t v5 = [v4 currentCallGroups];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (unint64_t)[v5 count] > 1;

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      uint64_t v6 = [MEMORY[0x263F7E1A0] sharedInstance];
      uint64_t v7 = [v6 audioOrVideoCallWithStatus:4];
      if (v7)
      {
      }
      else
      {
        char v8 = [MEMORY[0x263F7E1A0] sharedInstance];
        char v9 = [v8 audioOrVideoCallWithStatus:3];

        if (!v9) {
          goto LABEL_9;
        }
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    }
  }
LABEL_9:
}

- (BOOL)isHoldAvailable
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__ACCCommunicationsFeaturePlugin_isHoldAvailable__block_invoke;
  v4[3] = &unk_264709900;
  v4[4] = &v5;
  executeOnMainThreadSync((uint64_t)v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __49__ACCCommunicationsFeaturePlugin_isHoldAvailable__block_invoke(uint64_t a1)
{
  char v2 = [MEMORY[0x263F7E1A0] sharedInstance];
  id v12 = [v2 frontmostAudioOrVideoCall];

  BOOL v3 = v12;
  if (v12)
  {
    uint64_t v4 = [v12 model];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 supportsHolding];

    BOOL v3 = v12;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(*(void *)(v5 + 8) + 24))
  {
    uint64_t v6 = [MEMORY[0x263F7E1A0] sharedInstance];
    uint64_t v7 = [v6 audioOrVideoCallWithStatus:2];

    uint64_t v5 = *(void *)(a1 + 32);
    if (v7)
    {
      *(unsigned char *)(*(void *)(v5 + 8) + 24) = 0;
      uint64_t v5 = *(void *)(a1 + 32);
    }
    BOOL v3 = v12;
  }
  if (*(unsigned char *)(*(void *)(v5 + 8) + 24))
  {
    char v8 = [MEMORY[0x263F7E1A0] sharedInstance];
    char v9 = [v8 audioOrVideoCallWithStatus:4];
    if (v9)
    {

      BOOL v3 = v12;
    }
    else
    {
      id v10 = [MEMORY[0x263F7E1A0] sharedInstance];
      long long v11 = [v10 audioOrVideoCallWithStatus:3];

      BOOL v3 = v12;
      if (!v11) {
        goto LABEL_12;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
LABEL_12:
}

- (BOOL)initiateCallToDestination:(id)a3 withService:(int)a4 addressBookID:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = [(ACCCommunicationsFeaturePlugin *)self currentCallCount];
  if ([(ACCCommunicationsFeaturePlugin *)self isInitiateCallAllowed])
  {
    long long v11 = objc_alloc_init(MEMORY[0x263F7E1B0]);
    switch(a4)
    {
      case 3:
        if (!v10)
        {
          id v17 = objc_alloc(MEMORY[0x263F7E230]);
          __int16 v18 = [v11 faceTimeProvider];
          long long v14 = [v17 initWithProvider:v18];

          [v14 setVideo:1];
          if (v9 && [v9 length]) {
            [v14 setContactIdentifier:v9];
          }
          if (gLogObjects && gNumLogObjects >= 1)
          {
            int v16 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCCommunicationsFeaturePlugin startPlugin]();
            }
            int v16 = MEMORY[0x263EF8438];
            id v25 = MEMORY[0x263EF8438];
          }
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_50;
          }
          int v31 = 138477827;
          id v32 = v8;
          uint64_t v22 = "Initiating FaceTime Video call to: %{private}@...";
          goto LABEL_49;
        }
        long long v14 = logObjectForModule();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
LABEL_38:
          char v24 = 0;
LABEL_51:

          goto LABEL_52;
        }
        LOWORD(v31) = 0;
        id v30 = "Cannot add FaceTime Video call if there is already an active call - ignoring request";
        break;
      case 2:
        if (!v10)
        {
          id v19 = objc_alloc(MEMORY[0x263F7E230]);
          __int16 v20 = [v11 faceTimeProvider];
          long long v14 = [v19 initWithProvider:v20];

          [v14 setVideo:0];
          if (v9 && [v9 length]) {
            [v14 setContactIdentifier:v9];
          }
          if (gLogObjects && gNumLogObjects >= 1)
          {
            int v16 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCCommunicationsFeaturePlugin startPlugin]();
            }
            int v16 = MEMORY[0x263EF8438];
            id v26 = MEMORY[0x263EF8438];
          }
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_50;
          }
          int v31 = 138477827;
          id v32 = v8;
          uint64_t v22 = "Initiating FaceTime Audio call to: %{private}@...";
          goto LABEL_49;
        }
        long long v14 = logObjectForModule();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_38;
        }
        LOWORD(v31) = 0;
        id v30 = "Cannot add FaceTime Audio call if there is already an active call - ignoring request";
        break;
      case 1:
        id v12 = objc_alloc(MEMORY[0x263F7E230]);
        id v13 = [v11 telephonyProvider];
        long long v14 = [v12 initWithProvider:v13];

        if (v9 && [v9 length]) {
          [v14 setContactIdentifier:v9];
        }
        int v15 = [MEMORY[0x263F7E248] handleWithDestinationID:v8];
        [v14 setHandle:v15];

        if (gLogObjects && gNumLogObjects >= 1)
        {
          int v16 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCCommunicationsFeaturePlugin startPlugin]();
          }
          int v16 = MEMORY[0x263EF8438];
          id v21 = MEMORY[0x263EF8438];
        }
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_50;
        }
        int v31 = 138477827;
        id v32 = v8;
        uint64_t v22 = "Initiating telephony call to: %{private}@...";
LABEL_49:
        _os_log_impl(&dword_224EAC000, v16, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v31, 0xCu);
LABEL_50:

        v27 = [MEMORY[0x263F01880] defaultWorkspace];
        char v28 = [v14 URL];
        char v24 = [v27 openURL:v28 withOptions:0];

        goto LABEL_51;
      default:
        if (gLogObjects && gNumLogObjects >= 1)
        {
          long long v14 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCCommunicationsFeaturePlugin startPlugin]();
          }
          long long v14 = MEMORY[0x263EF8438];
          id v23 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[ACCCommunicationsFeaturePlugin initiateCallToDestination:withService:addressBookID:]();
        }
        goto LABEL_38;
    }
    _os_log_impl(&dword_224EAC000, v14, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v31, 2u);
    goto LABEL_38;
  }
  long long v11 = logObjectForModule();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_224EAC000, v11, OS_LOG_TYPE_DEFAULT, "Cannot add call - ignoring request", (uint8_t *)&v31, 2u);
  }
  char v24 = 0;
LABEL_52:

  return v24;
}

- (BOOL)initiateCallToVoicemail
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v14 = 0;
    _os_log_impl(&dword_224EAC000, v5, OS_LOG_TYPE_DEFAULT, "Initiating call to voicemail...", v14, 2u);
  }

  if (![(ACCCommunicationsFeaturePlugin *)self isInitiateCallAllowed]) {
    return 0;
  }
  id v6 = objc_alloc_init(MEMORY[0x263F7E1B0]);
  id v7 = objc_alloc(MEMORY[0x263F7E230]);
  id v8 = [v6 voicemailProvider];
  id v9 = (void *)[v7 initWithProvider:v8];

  [v9 setDialType:2];
  unint64_t v10 = [MEMORY[0x263F01880] defaultWorkspace];
  long long v11 = [v9 URL];
  char v12 = [v10 openURL:v11 withOptions:0];

  return v12;
}

- (BOOL)initiateRedial
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224EAC000, v5, OS_LOG_TYPE_DEFAULT, "Initiating redial...", buf, 2u);
  }

  id v6 = [(ACCCommunicationsFeaturePlugin *)self chManager];
  id v7 = [MEMORY[0x263F30598] predicateForCallsWithStatusOriginated:1];
  *(void *)buf = v7;
  id v8 = [MEMORY[0x263F30598] predicateForCallsWithAnyMediaTypes:&unk_26D847648];
  uint64_t v38 = v8;
  id v9 = (void *)MEMORY[0x263F30598];
  uint64_t v10 = *MEMORY[0x263F30620];
  v36[0] = *MEMORY[0x263F30628];
  v36[1] = v10;
  long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
  char v12 = [v9 predicateForCallsWithAnyServiceProviders:v11];
  v39 = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:buf count:3];

  long long v14 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v13];

  int v15 = [v6 callsWithPredicate:v14 limit:1 offset:0 batchSize:0];

  if (![v15 count])
  {
    id v17 = logObjectForModule();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v34 = "No recent calls - ignoring request!";
LABEL_28:
      _os_log_impl(&dword_224EAC000, v17, OS_LOG_TYPE_DEFAULT, v34, buf, 2u);
    }
LABEL_32:
    char v32 = 0;
    goto LABEL_23;
  }
  uint64_t v16 = [v15 objectAtIndex:0];
  if (!v16)
  {
    id v17 = logObjectForModule();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v34 = "Could not find last outgoing call - ignoring request!";
      goto LABEL_28;
    }
    goto LABEL_32;
  }
  id v17 = v16;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    __int16 v18 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    __int16 v18 = MEMORY[0x263EF8438];
    id v19 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    [(ACCCommunicationsFeaturePlugin *)(uint64_t)v17 initiateRedial];
  }

  id v26 = [v17 remoteParticipantHandles];
  uint64_t v27 = [v26 count];

  if (v27 != 1)
  {
    uint64_t v35 = logObjectForModule();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224EAC000, v35, OS_LOG_TYPE_DEFAULT, "Last outgoing call had more than one remote participant - ignoring request", buf, 2u);
    }

    goto LABEL_32;
  }
  id v28 = objc_alloc_init(MEMORY[0x263F7E1B0]);
  int v29 = [v28 dialRequestForRecentCall:v17];
  id v30 = [MEMORY[0x263F01880] defaultWorkspace];
  int v31 = [v29 URL];
  char v32 = [v30 openURL:v31 withOptions:0];

LABEL_23:
  return v32;
}

- (BOOL)acceptCallWithAction:(int)a3 callUUID:(id)a4
{
  id v6 = a4;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  unint64_t v7 = [(ACCCommunicationsFeaturePlugin *)self currentCallCount];
  BOOL v8 = [(ACCCommunicationsFeaturePlugin *)self isEndAndAcceptAvailable];
  BOOL v9 = [(ACCCommunicationsFeaturePlugin *)self isHoldAndAcceptAvailable];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy_;
  int v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke;
  v24[3] = &unk_264709928;
  id v10 = v6;
  id v25 = v10;
  id v26 = &v27;
  executeOnMainThreadSync((uint64_t)v24);
  if (v28[5])
  {
    BOOL v11 = v7 < 2;
    if (v7 >= 2) {
      int v12 = a3;
    }
    else {
      int v12 = 0;
    }
    if (v12) {
      BOOL v11 = 1;
    }
    BOOL v13 = v11 || v9;
    if (v11) {
      int v14 = v12;
    }
    else {
      int v14 = 0;
    }
    if (!v13)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        int v15 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCCommunicationsFeaturePlugin startPlugin]();
        }
        int v15 = MEMORY[0x263EF8438];
        id v16 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224EAC000, v15, OS_LOG_TYPE_INFO, "Cannot hold and accept - ending and accepting instead", buf, 2u);
      }

      int v14 = 1;
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_72;
    v20[3] = &unk_264709950;
    int v21 = v14;
    v20[4] = &v27;
    v20[5] = &v33;
    v20[6] = v7;
    BOOL v22 = v8;
    executeOnMainThreadSync((uint64_t)v20);
  }
  else
  {
    id v19 = logObjectForModule();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224EAC000, v19, OS_LOG_TYPE_DEFAULT, "Couldn't find an incoming call - ignoring request", buf, 2u);
    }
  }
  char v17 = *((unsigned char *)v34 + 24);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

void __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    char v2 = [MEMORY[0x263F7E1A0] sharedInstance];
    uint64_t v3 = [v2 callWithCallUUID:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      goto LABEL_22;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      id v6 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_cold_2();
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 1;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      id v6 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    else
    {
      id v6 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v18 = 0;
      _os_log_impl(&dword_224EAC000, v6, OS_LOG_TYPE_INFO, "No call UUID specified - falling back to incoming call", v18, 2u);
    }
  }

LABEL_22:
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v10 = [MEMORY[0x263F7E1A0] sharedInstance];
    uint64_t v11 = [v10 incomingCall];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      int v14 = [MEMORY[0x263F7E1A0] sharedInstance];
      uint64_t v15 = [v14 incomingVideoCall];
      uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
      char v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;
    }
  }
}

void __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_72(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 56);
  if (v2 != 1)
  {
    if (!v2)
    {
      unint64_t v3 = *(void *)(a1 + 48);
      if (v3 == 2)
      {
        if (gLogObjects) {
          BOOL v4 = gNumLogObjects < 1;
        }
        else {
          BOOL v4 = 1;
        }
        if (v4)
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCCommunicationsFeaturePlugin startPlugin]();
          }
          char v17 = MEMORY[0x263EF8438];
          id v5 = MEMORY[0x263EF8438];
        }
        else
        {
          char v17 = *(id *)gLogObjects;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_224EAC000, v17, OS_LOG_TYPE_DEFAULT, "Holding active and accepting incoming call...", buf, 2u);
        }

        __int16 v18 = [MEMORY[0x263F7E1A0] sharedInstance];
        [v18 holdActiveAndAnswerCall:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
      }
      else if (v3 < 3)
      {
        if (v3 == 1
          && ([MEMORY[0x263F7E1A0] sharedInstance],
              id v19 = objc_claimAutoreleasedReturnValue(),
              [v19 audioOrVideoCallWithStatus:2],
              uint64_t v20 = objc_claimAutoreleasedReturnValue(),
              v20,
              v19,
              v20))
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            int v21 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCCommunicationsFeaturePlugin startPlugin]();
            }
            int v21 = MEMORY[0x263EF8438];
            id v31 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v38 = 0;
            _os_log_impl(&dword_224EAC000, v21, OS_LOG_TYPE_DEFAULT, "Unholding call...", v38, 2u);
          }

          __int16 v18 = [MEMORY[0x263F7E1A0] sharedInstance];
          id v32 = [MEMORY[0x263F7E1A0] sharedInstance];
          uint64_t v33 = [v32 audioOrVideoCallWithStatus:2];
          [v18 unholdCall:v33];
        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            uint64_t v23 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCCommunicationsFeaturePlugin startPlugin]();
            }
            uint64_t v23 = MEMORY[0x263EF8438];
            id v28 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v37 = 0;
            _os_log_impl(&dword_224EAC000, v23, OS_LOG_TYPE_DEFAULT, "Accepting incoming call...", v37, 2u);
          }

          __int16 v18 = [MEMORY[0x263F7E1A0] sharedInstance];
          [v18 answerCall:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
        }
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          uint64_t v11 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCCommunicationsFeaturePlugin startPlugin]();
          }
          uint64_t v11 = MEMORY[0x263EF8438];
          id v27 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v39 = 0;
          _os_log_impl(&dword_224EAC000, v11, OS_LOG_TYPE_DEFAULT, "Ending held, holding active, and answering incoming call...", v39, 2u);
        }

        __int16 v18 = [MEMORY[0x263F7E1A0] sharedInstance];
        [v18 endHeldAndAnswerCall:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
      }
      goto LABEL_91;
    }
    if (gLogObjects) {
      BOOL v9 = gNumLogObjects < 1;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      uint64_t v12 = MEMORY[0x263EF8438];
      id v10 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v12 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_72_cold_1();
    }
LABEL_36:

    return;
  }
  if (!*(unsigned char *)(a1 + 60))
  {
    if (gLogObjects) {
      BOOL v13 = gNumLogObjects < 1;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      BOOL v22 = MEMORY[0x263EF8438];
      id v14 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v22 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v34 = 0;
      _os_log_impl(&dword_224EAC000, v22, OS_LOG_TYPE_DEFAULT, "Ending all calls and hoping we get called back (probably CDMA)...", v34, 2u);
    }

    __int16 v18 = [MEMORY[0x263F7E1A0] sharedInstance];
    [v18 disconnectAllCalls];
    goto LABEL_91;
  }
  unint64_t v6 = *(void *)(a1 + 48);
  if (v6 == 2)
  {
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 1;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      uint64_t v24 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v24 = *(id *)gLogObjects;
    }
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_90;
    }
    __int16 v36 = 0;
    id v25 = "Ending active and accepting incoming call...";
    id v26 = (uint8_t *)&v36;
    goto LABEL_89;
  }
  if (gLogObjects) {
    BOOL v15 = gNumLogObjects <= 0;
  }
  else {
    BOOL v15 = 1;
  }
  int v16 = !v15;
  if (v6 < 3)
  {
    if (v16)
    {
      uint64_t v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      uint64_t v12 = MEMORY[0x263EF8438];
      id v30 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_72_cold_10();
    }
    goto LABEL_36;
  }
  if (v16)
  {
    uint64_t v24 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    uint64_t v24 = MEMORY[0x263EF8438];
    id v29 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v35 = 0;
    id v25 = "Leaving held, ending active, and answering incoming call...";
    id v26 = v35;
LABEL_89:
    _os_log_impl(&dword_224EAC000, v24, OS_LOG_TYPE_DEFAULT, v25, v26, 2u);
  }
LABEL_90:

  __int16 v18 = [MEMORY[0x263F7E1A0] sharedInstance];
  [v18 endActiveAndAnswerCall:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
LABEL_91:

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (BOOL)endCallWithAction:(int)a3 callUUID:(id)a4
{
  id v5 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy_;
  uint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__ACCCommunicationsFeaturePlugin_endCallWithAction_callUUID___block_invoke;
  v13[3] = &unk_264709928;
  id v6 = v5;
  id v14 = v6;
  BOOL v15 = &v16;
  executeOnMainThreadSync((uint64_t)v13);
  if (v17[5])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __61__ACCCommunicationsFeaturePlugin_endCallWithAction_callUUID___block_invoke_73;
    v10[3] = &unk_264709978;
    int v11 = a3;
    void v10[4] = &v16;
    v10[5] = &v22;
    executeOnMainThreadSync((uint64_t)v10);
  }
  else
  {
    BOOL v9 = logObjectForModule();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224EAC000, v9, OS_LOG_TYPE_DEFAULT, "Couldn't find a call to end - ignoring request", buf, 2u);
    }
  }
  char v7 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v7;
}

void __61__ACCCommunicationsFeaturePlugin_endCallWithAction_callUUID___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    unint64_t v3 = [MEMORY[0x263F7E1A0] sharedInstance];
    uint64_t v4 = [v3 callWithCallUUID:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if (gLogObjects) {
      BOOL v7 = gNumLogObjects <= 0;
    }
    else {
      BOOL v7 = 1;
    }
    int v8 = !v7;
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      if (v8)
      {
        BOOL v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCCommunicationsFeaturePlugin startPlugin]();
        }
        BOOL v9 = MEMORY[0x263EF8438];
        id v12 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_cold_2();
      }
      goto LABEL_34;
    }
    if (v8)
    {
      BOOL v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      BOOL v9 = MEMORY[0x263EF8438];
      id v16 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *v2;
      int v22 = 138412290;
      uint64_t v23 = v17;
      BOOL v13 = "Couldn't find call with specified UUID: %@ - falling back to frontmost call";
      id v14 = v9;
      uint32_t v15 = 12;
      goto LABEL_33;
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 1;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      BOOL v9 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v9 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      BOOL v13 = "No call UUID specified - falling back to frontmost call";
      id v14 = v9;
      uint32_t v15 = 2;
LABEL_33:
      _os_log_impl(&dword_224EAC000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v22, v15);
    }
  }
LABEL_34:

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v18 = [MEMORY[0x263F7E1A0] sharedInstance];
    uint64_t v19 = [v18 frontmostAudioOrVideoCall];
    uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
    id v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
}

void __61__ACCCommunicationsFeaturePlugin_endCallWithAction_callUUID___block_invoke_73(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 48))
  {
    if (gLogObjects) {
      BOOL v1 = gNumLogObjects < 1;
    }
    else {
      BOOL v1 = 1;
    }
    if (v1)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      int v8 = MEMORY[0x263EF8438];
      id v2 = MEMORY[0x263EF8438];
    }
    else
    {
      int v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __61__ACCCommunicationsFeaturePlugin_endCallWithAction_callUUID___block_invoke_73_cold_3();
    }
  }
  else
  {
    int v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) status];
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects <= 0;
    }
    else {
      BOOL v5 = 1;
    }
    int v6 = !v5;
    if (v4 == 4)
    {
      if (v6)
      {
        BOOL v7 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCCommunicationsFeaturePlugin startPlugin]();
        }
        BOOL v7 = MEMORY[0x263EF8438];
        id v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224EAC000, v7, OS_LOG_TYPE_DEFAULT, "Declining incoming call...", buf, 2u);
      }

      id v11 = [MEMORY[0x263F7E1A0] sharedInstance];
      [v11 disconnectCall:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) withReason:2];
    }
    else
    {
      if (v6)
      {
        BOOL v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCCommunicationsFeaturePlugin startPlugin]();
        }
        BOOL v9 = MEMORY[0x263EF8438];
        id v12 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl(&dword_224EAC000, v9, OS_LOG_TYPE_DEFAULT, "Ending call and activating held (if any)...", v16, 2u);
      }

      BOOL v13 = [MEMORY[0x263F7E1A0] sharedInstance];
      [v13 disconnectCall:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

      id v11 = [MEMORY[0x263F7E1A0] sharedInstance];
      id v14 = [MEMORY[0x263F7E1A0] sharedInstance];
      uint32_t v15 = [v14 audioOrVideoCallWithStatus:2];
      [v11 unholdCall:v15];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)endAllCalls
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__ACCCommunicationsFeaturePlugin_endAllCalls__block_invoke;
  v4[3] = &unk_264709900;
  v4[4] = &v5;
  executeOnMainThreadSync((uint64_t)v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __45__ACCCommunicationsFeaturePlugin_endAllCalls__block_invoke(uint64_t a1)
{
  char v2 = [MEMORY[0x263F7E1A0] sharedInstance];
  [v2 disconnectAllCalls];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

- (BOOL)swapCalls
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  if ([(ACCCommunicationsFeaturePlugin *)self isSwapAvailable])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __43__ACCCommunicationsFeaturePlugin_swapCalls__block_invoke;
    v8[3] = &unk_264709900;
    v8[4] = &v9;
    executeOnMainThreadSync((uint64_t)v8);
  }
  else
  {
    if (gLogObjects) {
      BOOL v2 = gNumLogObjects < 1;
    }
    else {
      BOOL v2 = 1;
    }
    if (v2)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      int v4 = MEMORY[0x263EF8438];
      id v3 = MEMORY[0x263EF8438];
    }
    else
    {
      int v4 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_224EAC000, v4, OS_LOG_TYPE_DEFAULT, "Swap calls isn't available - ignoring request", v7, 2u);
    }
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __43__ACCCommunicationsFeaturePlugin_swapCalls__block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    int v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    int v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_224EAC000, v4, OS_LOG_TYPE_DEFAULT, "Swapping calls...", v6, 2u);
  }

  char v5 = [MEMORY[0x263F7E1A0] sharedInstance];
  [v5 swapCalls];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

- (BOOL)mergeCalls
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  if ([(ACCCommunicationsFeaturePlugin *)self isMergeAvailable])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __44__ACCCommunicationsFeaturePlugin_mergeCalls__block_invoke;
    v8[3] = &unk_264709900;
    v8[4] = &v9;
    executeOnMainThreadSync((uint64_t)v8);
  }
  else
  {
    if (gLogObjects) {
      BOOL v2 = gNumLogObjects < 1;
    }
    else {
      BOOL v2 = 1;
    }
    if (v2)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      int v4 = MEMORY[0x263EF8438];
      id v3 = MEMORY[0x263EF8438];
    }
    else
    {
      int v4 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_224EAC000, v4, OS_LOG_TYPE_DEFAULT, "Merge calls isn't available - ignoring request", v7, 2u);
    }
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __44__ACCCommunicationsFeaturePlugin_mergeCalls__block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    int v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    int v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_224EAC000, v4, OS_LOG_TYPE_DEFAULT, "Merging calls...", v10, 2u);
  }

  char v5 = [MEMORY[0x263F7E1A0] sharedInstance];
  int v6 = [v5 callWithStatus:2];

  uint64_t v7 = [MEMORY[0x263F7E1A0] sharedInstance];
  char v8 = [v7 callWithStatus:1];

  uint64_t v9 = [MEMORY[0x263F7E1A0] sharedInstance];
  [v9 groupCall:v6 withOtherCall:v8];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

- (BOOL)updateHoldStatus:(BOOL)a3 forCallWithUUID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    uint64_t v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = "NO";
    if (v4) {
      id v10 = "YES";
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_224EAC000, v9, OS_LOG_TYPE_INFO, "Setting hold status to %s...", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  char v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __67__ACCCommunicationsFeaturePlugin_updateHoldStatus_forCallWithUUID___block_invoke;
  v20[3] = &unk_264709928;
  id v11 = v6;
  id v21 = v11;
  p_long long buf = &buf;
  executeOnMainThreadSync((uint64_t)v20);
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    *(void *)id v16 = 0;
    uint64_t v17 = v16;
    uint64_t v18 = 0x2020000000;
    char v19 = -86;
    char v19 = [(ACCCommunicationsFeaturePlugin *)self isHoldAvailable];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __67__ACCCommunicationsFeaturePlugin_updateHoldStatus_forCallWithUUID___block_invoke_74;
    v14[3] = &unk_2647099A0;
    v14[5] = &buf;
    v14[6] = v16;
    v14[4] = self;
    BOOL v15 = v4;
    executeOnMainThreadSync((uint64_t)v14);
    _Block_object_dispose(v16, 8);
  }
  else
  {
    BOOL v13 = logObjectForModule();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_224EAC000, v13, OS_LOG_TYPE_DEFAULT, "Couldn't find an active call - ignoring request", v16, 2u);
    }
  }
  _Block_object_dispose(&buf, 8);

  return 0;
}

void __67__ACCCommunicationsFeaturePlugin_updateHoldStatus_forCallWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  BOOL v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = [MEMORY[0x263F7E1A0] sharedInstance];
    uint64_t v4 = [v3 callWithCallUUID:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if (gLogObjects) {
      BOOL v7 = gNumLogObjects <= 0;
    }
    else {
      BOOL v7 = 1;
    }
    int v8 = !v7;
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      if (v8)
      {
        uint64_t v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCCommunicationsFeaturePlugin startPlugin]();
        }
        uint64_t v9 = MEMORY[0x263EF8438];
        id v12 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_cold_2();
      }
      goto LABEL_34;
    }
    if (v8)
    {
      uint64_t v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      uint64_t v9 = MEMORY[0x263EF8438];
      id v16 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *v2;
      int v22 = 138412290;
      uint64_t v23 = v17;
      BOOL v13 = "Could not find call with specified UUID: %@ - falling back to frontmost call";
      id v14 = v9;
      uint32_t v15 = 12;
      goto LABEL_33;
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 1;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      uint64_t v9 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v9 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      BOOL v13 = "No call UUID specified - falling back to frontmost call";
      id v14 = v9;
      uint32_t v15 = 2;
LABEL_33:
      _os_log_impl(&dword_224EAC000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v22, v15);
    }
  }
LABEL_34:

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v18 = [MEMORY[0x263F7E1A0] sharedInstance];
    uint64_t v19 = [v18 frontmostAudioOrVideoCall];
    uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
    id v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
}

void __67__ACCCommunicationsFeaturePlugin_updateHoldStatus_forCallWithUUID___block_invoke_74(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) status] != 1) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  if ([*(id *)(a1 + 32) isHoldAvailable])
  {
    if (*(unsigned char *)(a1 + 56))
    {
      id v4 = [MEMORY[0x263F7E1A0] sharedInstance];
      [v4 holdCall:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
LABEL_11:

      return;
    }
LABEL_10:
    id v4 = [MEMORY[0x263F7E1A0] sharedInstance];
    [v4 unholdCall:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    goto LABEL_11;
  }
  if (!*(unsigned char *)(a1 + 56)) {
    goto LABEL_10;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    BOOL v2 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    BOOL v2 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_224EAC000, v2, OS_LOG_TYPE_DEFAULT, "Hold isn't available - ignoring message", buf, 2u);
  }
}

- (BOOL)updateMuteStatus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = "NO";
    if (v3) {
      BOOL v7 = "YES";
    }
    *(_DWORD *)long long buf = 136315138;
    uint64_t v17 = v7;
    _os_log_impl(&dword_224EAC000, v6, OS_LOG_TYPE_DEFAULT, "Setting mute status to %s...", buf, 0xCu);
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__ACCCommunicationsFeaturePlugin_updateMuteStatus___block_invoke;
  v10[3] = &unk_2647099C8;
  BOOL v11 = v3;
  void v10[4] = &v12;
  executeOnMainThreadSync((uint64_t)v10);
  char v8 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

void __51__ACCCommunicationsFeaturePlugin_updateMuteStatus___block_invoke(uint64_t a1)
{
  BOOL v2 = [MEMORY[0x263F7E188] sharedAudioSystemController];
  [v2 setUplinkMuted:*(unsigned __int8 *)(a1 + 40)];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

- (BOOL)sendDTMF:(int)a3 forCallWithUUID:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 >= 0xC)
  {
    char v8 = logObjectForModule();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin sendDTMF:forCallWithUUID:](a3, v8);
    }
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy_;
    uint64_t v20 = __Block_byref_object_dispose_;
    id v21 = 0;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__ACCCommunicationsFeaturePlugin_sendDTMF_forCallWithUUID___block_invoke;
    v13[3] = &unk_264709928;
    id v14 = v5;
    char v15 = &v16;
    executeOnMainThreadSync((uint64_t)v13);
    if (v17[5])
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __59__ACCCommunicationsFeaturePlugin_sendDTMF_forCallWithUUID___block_invoke_75;
      v10[3] = &unk_2647099F0;
      void v10[4] = &v16;
      int v11 = a3;
      executeOnMainThreadSync((uint64_t)v10);
    }
    else
    {
      uint64_t v9 = logObjectForModule();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_224EAC000, v9, OS_LOG_TYPE_DEFAULT, "Couldn't find an active call - ignoring request", buf, 2u);
      }
    }
    _Block_object_dispose(&v16, 8);
  }
  return 0;
}

void __59__ACCCommunicationsFeaturePlugin_sendDTMF_forCallWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  BOOL v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    BOOL v3 = [MEMORY[0x263F7E1A0] sharedInstance];
    uint64_t v4 = [v3 callWithCallUUID:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if (gLogObjects) {
      BOOL v7 = gNumLogObjects <= 0;
    }
    else {
      BOOL v7 = 1;
    }
    int v8 = !v7;
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      if (v8)
      {
        uint64_t v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCCommunicationsFeaturePlugin startPlugin]();
        }
        uint64_t v9 = MEMORY[0x263EF8438];
        id v12 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_cold_2();
      }
      goto LABEL_34;
    }
    if (v8)
    {
      uint64_t v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      uint64_t v9 = MEMORY[0x263EF8438];
      id v16 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *v2;
      int v22 = 138412290;
      uint64_t v23 = v17;
      BOOL v13 = "Could not find call with specified UUID: %@ - falling back to frontmost call";
      id v14 = v9;
      uint32_t v15 = 12;
      goto LABEL_33;
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 1;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      uint64_t v9 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v9 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      BOOL v13 = "No call UUID specified - falling back to frontmost call";
      id v14 = v9;
      uint32_t v15 = 2;
LABEL_33:
      _os_log_impl(&dword_224EAC000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v22, v15);
    }
  }
LABEL_34:

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v18 = [MEMORY[0x263F7E1A0] sharedInstance];
    uint64_t v19 = [v18 frontmostCall];
    uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
    id v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
}

void __59__ACCCommunicationsFeaturePlugin_sendDTMF_forCallWithUUID___block_invoke_75(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) shouldPlayDTMFTone])
  {
    uint64_t v2 = *(int *)(a1 + 40);
    if (v2 > 0xB) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = byte_224EBAB60[v2];
    }
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 1;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      uint64_t v9 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v9 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) callUUID];
      v11[0] = 67109378;
      v11[1] = v3;
      __int16 v12 = 2112;
      BOOL v13 = v10;
      _os_log_impl(&dword_224EAC000, v9, OS_LOG_TYPE_DEFAULT, "Playing DTMF Tone: 0x%02X, callUUID: %@", (uint8_t *)v11, 0x12u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) playDTMFToneForKey:v3];
  }
  else
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 1;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCCommunicationsFeaturePlugin startPlugin]();
      }
      int v8 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    else
    {
      int v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl(&dword_224EAC000, v8, OS_LOG_TYPE_DEFAULT, "Playing DTMF tone isn't available - ignoring message", (uint8_t *)v11, 2u);
    }
  }
}

- (id)currentRecentsListWithCoalescing:(BOOL)a3 limit:(unint64_t)a4
{
  BOOL v5 = a3;
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v73 = [MEMORY[0x263EFF980] array];
  if (v5)
  {
    uint64_t v7 = *MEMORY[0x263F30618];
    int v8 = [(ACCCommunicationsFeaturePlugin *)self chManager];
    [v8 setCoalescingStrategy:v7];

    uint64_t v9 = [(ACCCommunicationsFeaturePlugin *)self chManager];
    BOOL v10 = _recentCallsPredicate();
    [v9 coalescedCallsWithPredicate:v10 limit:a4 offset:0 batchSize:0];
  }
  else
  {
    id v11 = [(ACCCommunicationsFeaturePlugin *)self chManager];
    [v11 setCoalescingStrategy:0];

    uint64_t v9 = [(ACCCommunicationsFeaturePlugin *)self chManager];
    BOOL v10 = _recentCallsPredicate();
    [v9 callsWithPredicate:v10 limit:a4 offset:0 batchSize:0];
  __int16 v12 = };

  if (gLogObjects && gNumLogObjects >= 1)
  {
    BOOL v13 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCCommunicationsFeaturePlugin startPlugin]();
    }
    BOOL v13 = MEMORY[0x263EF8438];
    id v14 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = [v12 count];
    id v16 = "NO";
    *(_DWORD *)long long buf = 134218498;
    uint64_t v87 = v15;
    if (v5) {
      id v16 = "YES";
    }
    __int16 v88 = 2080;
    v89 = v16;
    __int16 v90 = 2048;
    unint64_t v91 = a4;
    _os_log_impl(&dword_224EAC000, v13, OS_LOG_TYPE_INFO, "recentCalls.count: %lu (coalesce: %s, limit: %lu)", buf, 0x20u);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = v12;
  uint64_t v74 = [obj countByEnumeratingWithState:&v79 objects:v85 count:16];
  if (v74)
  {
    uint64_t v72 = *(void *)v80;
    uint64_t v71 = *MEMORY[0x263F22DF8];
    uint64_t v70 = *MEMORY[0x263F22DD8];
    uint64_t v69 = *MEMORY[0x263F22DE8];
    uint64_t v68 = *MEMORY[0x263F22DD0];
    uint64_t v67 = *MEMORY[0x263F22E00];
    int v66 = *MEMORY[0x263F30600];
    int v65 = *MEMORY[0x263F30610];
    int v64 = *MEMORY[0x263F30608];
    int v57 = *MEMORY[0x263F305F0];
    int v56 = *MEMORY[0x263F305F8];
    uint64_t v63 = *MEMORY[0x263F22E08];
    int v62 = *MEMORY[0x263F305D8];
    unint64_t v17 = 0x263F08000uLL;
    uint64_t v61 = *MEMORY[0x263F22E10];
    HIDWORD(v55) = *MEMORY[0x263F305C0] | *MEMORY[0x263F305B0];
    LODWORD(v55) = *MEMORY[0x263F305C8] | *MEMORY[0x263F305B8];
    uint64_t v60 = *MEMORY[0x263F22DE0];
    uint64_t v59 = *MEMORY[0x263F22DF0];
    do
    {
      for (uint64_t i = 0; i != v74; ++i)
      {
        if (*(void *)v80 != v72) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        v83[0] = v71;
        uint64_t v20 = objc_msgSend(v19, "callerId", v55);
        id v21 = (void *)v20;
        if (v20) {
          int v22 = (__CFString *)v20;
        }
        else {
          int v22 = &stru_26D8469B0;
        }
        v84[0] = v22;
        v83[1] = v70;
        uint64_t v23 = [v19 callerNameForDisplay];
        uint64_t v24 = removeBidirectionalUnicodeCharacters(v23);
        char v25 = (void *)v24;
        if (v24) {
          id v26 = (__CFString *)v24;
        }
        else {
          id v26 = &stru_26D8469B0;
        }
        v84[1] = v26;
        v83[2] = v69;
        uint64_t v27 = [v19 callerIdSubStringForDisplay];
        uint64_t v28 = (void *)v27;
        if (v27) {
          id v29 = (__CFString *)v27;
        }
        else {
          id v29 = &stru_26D8469B0;
        }
        v84[2] = v29;
        v83[3] = v68;
        uint64_t v30 = [v19 contactIdentifier];
        id v31 = (void *)v30;
        if (v30) {
          id v32 = (__CFString *)v30;
        }
        else {
          id v32 = &stru_26D8469B0;
        }
        v84[3] = v32;
        v83[4] = v67;
        uint64_t v33 = *(void **)(v17 + 2584);
        int v34 = [v19 callType];
        if ((v66 & v34) == 0 && (v65 & v34) == 0 && (v64 & v34) == 0)
        {
          if (v56 == v34) {
            unsigned int v38 = 3;
          }
          else {
            unsigned int v38 = 0;
          }
          if (v57 == v34) {
            uint64_t v37 = 2;
          }
          else {
            uint64_t v37 = v38;
          }
        }
        else
        {
          uint64_t v37 = 1;
        }
        v39 = [v33 numberWithUnsignedInt:v37];
        v84[4] = v39;
        v83[5] = v63;
        uint64_t v40 = *(void **)(v17 + 2584);
        int v41 = [v19 callStatus];
        v77 = v23;
        v78 = v21;
        v75 = v28;
        v76 = v25;
        if ((v62 & v41) != 0)
        {
          uint64_t v42 = 3;
        }
        else if ((HIDWORD(v55) & v41) != 0)
        {
          uint64_t v42 = 1;
        }
        else
        {
          uint64_t v42 = 2 * ((v55 & v41) != 0);
        }
        uint64_t v43 = [v40 numberWithUnsignedInt:v42];
        v84[5] = v43;
        v83[6] = v61;
        v44 = *(void **)(v17 + 2584);
        int v45 = [v19 date];
        [v45 timeIntervalSince1970];
        v47 = [v44 numberWithLongLong:(uint64_t)v46];
        v84[6] = v47;
        v83[7] = v60;
        int v48 = *(void **)(v17 + 2584);
        [v19 duration];
        v50 = [v48 numberWithLong:(uint64_t)v49];
        v84[7] = v50;
        v83[8] = v59;
        unint64_t v51 = v17;
        long long v52 = objc_msgSend(*(id *)(v17 + 2584), "numberWithChar:", (char)objc_msgSend(v19, "numberOfOccurrences"));
        v84[8] = v52;
        int v53 = [NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:9];

        unint64_t v17 = v51;
        [v73 addObject:v53];
      }
      uint64_t v74 = [obj countByEnumeratingWithState:&v79 objects:v85 count:16];
    }
    while (v74);
  }

  return v73;
}

- (id)currentFavoritesListWithLimit:(unint64_t)a3
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  objc_msgSend(MEMORY[0x263EFF980], "array", a3);
  id v67 = (id)objc_claimAutoreleasedReturnValue();
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v3 = [MEMORY[0x263EFEA98] sharedInstance];
  BOOL v4 = [v3 entries];

  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v75 objects:v81 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v76;
    uint64_t v8 = *MEMORY[0x263EFDEF8];
    uint64_t v64 = *MEMORY[0x263EFDF38];
    uint64_t v62 = *MEMORY[0x263EFDEC0];
    uint64_t v63 = *MEMORY[0x263EFDEE8];
    uint64_t v60 = *MEMORY[0x263EFE070];
    uint64_t v61 = *MEMORY[0x263F22DC0];
    uint64_t v55 = *MEMORY[0x263EFDF80];
    uint64_t v59 = *MEMORY[0x263F22DB0];
    uint64_t v58 = *MEMORY[0x263F22DB8];
    uint64_t v57 = *MEMORY[0x263F22DA8];
    uint64_t v56 = *MEMORY[0x263F22DC8];
    uint64_t v65 = *MEMORY[0x263EFDEF8];
    uint64_t v66 = *(void *)v76;
    do
    {
      uint64_t v9 = 0;
      uint64_t v68 = v6;
      do
      {
        if (*(void *)v76 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(*((void *)&v75 + 1) + 8 * v9);
        id v11 = [v10 actionType];
        int v12 = [v11 isEqual:v8];

        if (v12)
        {
          BOOL v13 = [v10 bundleIdentifier];
          char v14 = [v13 isEqual:v63];

          if (v14)
          {
            uint64_t v15 = 1;
            goto LABEL_13;
          }
          uint64_t v15 = 2;
        }
        else
        {
          id v16 = [v10 actionType];
          int v17 = [v16 isEqual:v64];

          if (!v17) {
            goto LABEL_34;
          }
          uint64_t v15 = 3;
        }
        uint64_t v18 = objc_msgSend(v10, "bundleIdentifier", v55);
        int v19 = [v18 isEqual:v62];

        if (!v19) {
          goto LABEL_34;
        }
LABEL_13:

        v79[0] = v61;
        id v20 = v10;
        id v21 = [v20 contactProperty];
        int v22 = [v21 key];
        int v23 = [v22 isEqual:v60];

        uint64_t v24 = [v20 contactProperty];
        char v25 = v24;
        if (v23)
        {
          id v26 = [v24 value];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0) {
            goto LABEL_20;
          }
          uint64_t v28 = [v20 contactProperty];
          id v29 = [v28 value];

          uint64_t v30 = [v29 stringValue];
        }
        else
        {
          id v31 = [v24 key];
          int v32 = [v31 isEqual:v55];

          if (!v32) {
            goto LABEL_20;
          }
          uint64_t v33 = [v20 contactProperty];
          int v34 = [v33 value];
          objc_opt_class();
          char v35 = objc_opt_isKindOfClass();

          if ((v35 & 1) == 0)
          {
LABEL_20:
            __int16 v36 = 0;
            goto LABEL_21;
          }
          id v29 = [v20 contactProperty];
          uint64_t v30 = [v29 value];
        }
        __int16 v36 = (__CFString *)v30;

LABEL_21:
        uint64_t v70 = v36;

        if (v36) {
          uint64_t v37 = v36;
        }
        else {
          uint64_t v37 = &stru_26D8469B0;
        }
        v80[0] = v37;
        v79[1] = v59;
        uint64_t v74 = objc_msgSend(v20, "name", v55);
        uint64_t v38 = removeBidirectionalUnicodeCharacters(v74);
        v39 = (void *)v38;
        if (v38) {
          uint64_t v40 = (__CFString *)v38;
        }
        else {
          uint64_t v40 = &stru_26D8469B0;
        }
        v80[1] = v40;
        v79[2] = v58;
        int v41 = (void *)MEMORY[0x263EFEAD0];
        id v73 = [v20 contactProperty];
        uint64_t v71 = [v73 label];
        uint64_t v72 = [v20 contactProperty];
        uint64_t v42 = [v72 key];
        uint64_t v43 = [v41 localizedDisplayStringForLabel:v71 propertyName:v42];
        uint64_t v44 = _overrideLabelForFaceTime(v43, v15);
        int v45 = (void *)v44;
        if (v44) {
          double v46 = (__CFString *)v44;
        }
        else {
          double v46 = &stru_26D8469B0;
        }
        v80[2] = v46;
        v79[3] = v57;
        v47 = [v20 contactProperty];
        int v48 = [v47 contact];
        uint64_t v49 = [v48 identifier];
        uint64_t v50 = v15;
        unint64_t v51 = (void *)v49;
        if (v49) {
          long long v52 = (__CFString *)v49;
        }
        else {
          long long v52 = &stru_26D8469B0;
        }
        v80[3] = v52;
        v79[4] = v56;
        int v53 = [NSNumber numberWithUnsignedInt:v50];
        v80[4] = v53;
        id v10 = [NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:5];

        [v67 addObject:v10];
        uint64_t v8 = v65;
        uint64_t v7 = v66;
        uint64_t v6 = v68;
LABEL_34:

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
    }
    while (v6);
  }

  return v67;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (ACCCommunicationsCenter)commCenter
{
  return self->_commCenter;
}

- (void)setCommCenter:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (VMVoicemailManager)vmManager
{
  return self->_vmManager;
}

- (void)setVmManager:(id)a3
{
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (void)setRadiosPreferences:(id)a3
{
}

- (CHManager)chManager
{
  return self->_chManager;
}

- (void)setChManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chManager, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_vmManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_commCenter, 0);
}

- (void)callStateDidChangeNotification:(void *)a1 .cold.1(void *a1)
{
  BOOL v1 = [a1 name];
  OUTLINED_FUNCTION_7(&dword_224EAC000, v2, v3, "Calling callStateDidChange (from %@)...", v4, v5, v6, v7, 2u);
}

- (void)callStateDidChangeNotification:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_224EAC000, v0, v1, "Spoofing TUCallModelChangedNotification NSNotification...", v2, v3, v4, v5, v6);
}

- (void)callStateDidChangeNotification:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_224EAC000, v0, v1, "Creating CallCountDidChangeNotification NSNotification...", v2, v3, v4, v5, v6);
}

- (void)initiateCallToDestination:withService:addressBookID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_224EAC000, v0, v1, "Unknown call service - ignoring request", v2, v3, v4, v5, v6);
}

- (void)initiateRedial
{
}

void __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_224EAC000, v0, v1, "Found call with UUID: %@", v2, v3, v4, v5, v6);
}

void __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_72_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_224EAC000, v0, v1, "Unknown accept action - ignoring request", v2, v3, v4, v5, v6);
}

void __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_72_cold_10()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_224EAC000, v0, v1, "Unknown accept call state - ignoring request", v2, v3, v4, v5, v6);
}

void __61__ACCCommunicationsFeaturePlugin_endCallWithAction_callUUID___block_invoke_73_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_224EAC000, v0, v1, "Unknown end action - ignoring request", v2, v3, v4, v5, v6);
}

- (void)sendDTMF:(int)a1 forCallWithUUID:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_224EAC000, a2, OS_LOG_TYPE_ERROR, "Invalid tone: %d", (uint8_t *)v2, 8u);
}

@end