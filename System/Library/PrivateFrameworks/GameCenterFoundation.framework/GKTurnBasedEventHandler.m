@interface GKTurnBasedEventHandler
+ (GKTurnBasedEventHandler)sharedTurnBasedEventHandler;
- (BOOL)didBecomeActive;
- (GKTurnBasedEventHandler)init;
- (NSObject)delegate;
- (OS_dispatch_queue)lookForEventQueue;
- (void)callTurnEventForMatch:(id)a3 userTapped:(BOOL)a4;
- (void)lookForEvent;
- (void)setDelegate:(NSObject *)delegate;
- (void)setDidBecomeActive:(BOOL)a3;
- (void)setLookForEventQueue:(id)a3;
@end

@implementation GKTurnBasedEventHandler

+ (GKTurnBasedEventHandler)sharedTurnBasedEventHandler
{
  if (sharedTurnBasedEventHandler_once != -1) {
    dispatch_once(&sharedTurnBasedEventHandler_once, &__block_literal_global_171);
  }
  v2 = (void *)sharedTurnBasedEventHandler_sSharedTurnBasedEventHandler;

  return (GKTurnBasedEventHandler *)v2;
}

uint64_t __54__GKTurnBasedEventHandler_sharedTurnBasedEventHandler__block_invoke()
{
  sharedTurnBasedEventHandler_sSharedTurnBasedEventHandler = objc_alloc_init(GKTurnBasedEventHandler);

  return MEMORY[0x1F41817F8]();
}

- (GKTurnBasedEventHandler)init
{
  v7.receiver = self;
  v7.super_class = (Class)GKTurnBasedEventHandler;
  v2 = [(GKTurnBasedEventHandler *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("GKTurnBasedEventHandler.lookForEventQueue", v3);
    lookForEventQueue = v2->_lookForEventQueue;
    v2->_lookForEventQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)callTurnEventForMatch:(id)a3 userTapped:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v6 = [(GKTurnBasedEventHandler *)self delegate];
  if (v6)
  {
    if (objc_opt_respondsToSelector())
    {
      [v6 handleTurnEventForMatch:v7 didBecomeActive:v4];
    }
    else if (objc_opt_respondsToSelector())
    {
      [v6 handleTurnEventForMatch:v7];
    }
  }
}

- (void)lookForEvent
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke;
  v2[3] = &unk_1E646D7F0;
  v2[4] = self;
  +[GKActivity named:@"lookForEvent" execute:v2];
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(NSObject **)(v3 + 24);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2;
  v6[3] = &unk_1E646EC80;
  v6[4] = v3;
  id v7 = v2;
  id v5 = v2;
  dispatch_async(v4, v6);
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2(uint64_t a1)
{
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedMatch.m", 500, "-[GKTurnBasedEventHandler lookForEvent]_block_invoke_2");
  uint64_t v3 = +[GKDispatchGroup dispatchGroupWithName:v2];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_3;
  v7[3] = &unk_1E646D9A0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  [v6 perform:v7];
  [v6 wait];
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 turnBasedService];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_4;
  v10[3] = &unk_1E6470160;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(void **)(a1 + 48);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  id v14 = v3;
  id v9 = v3;
  [v5 getNextTurnBasedEventWithHandler:v10];
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_4(uint64_t a1, void *a2, void *a3, uint64_t a4, char a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a6;
  if (v13)
  {
    if (!os_log_GKGeneral) {
      id v14 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_4_cold_1();
    }
  }
  v15 = [MEMORY[0x1E4F28C40] defaultCenter];
  v16 = +[GKLocalPlayer localPlayer];
  if (v11)
  {
    if (!os_log_GKGeneral) {
      id v17 = GKOSLoggers();
    }
    v18 = os_log_GKTrace;
    if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2D22000, v18, OS_LOG_TYPE_INFO, "lookForEvent:TBG MatchID Found, attempting to load TBG Match Details", buf, 2u);
    }
    v19 = *(void **)(a1 + 32);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_191;
    v33[3] = &unk_1E6470110;
    v20 = &v34;
    id v34 = v11;
    uint64_t v41 = a4;
    v21 = &v35;
    id v35 = *(id *)(a1 + 32);
    id v36 = v15;
    id v37 = v16;
    char v42 = a5;
    v22 = *(void **)(a1 + 48);
    uint64_t v38 = *(void *)(a1 + 40);
    id v39 = v22;
    id v40 = v12;
    id v23 = v16;
    [v19 perform:v33];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v24 = GKOSLoggers();
    }
    v25 = os_log_GKTrace;
    if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2D22000, v25, OS_LOG_TYPE_INFO, "lookForEvent:Posting Notifiation: GKInternalTurnBasedGameEventNotification", buf, 2u);
    }
    [v15 postNotificationName:@"GKInternalTurnBasedGameEvent" object:0];
    v26 = *(void **)(a1 + 32);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_207;
    v30[3] = &unk_1E646D9A0;
    v20 = &v31;
    v31 = v16;
    v21 = (id *)v32;
    id v27 = *(id *)(a1 + 48);
    uint64_t v28 = *(void *)(a1 + 40);
    v32[0] = v27;
    v32[1] = v28;
    id v29 = v16;
    [v26 perform:v30];
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_191(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_193;
  v9[3] = &unk_1E64700E8;
  uint64_t v18 = *(void *)(a1 + 88);
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 56);
  char v19 = *(unsigned char *)(a1 + 96);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void **)(a1 + 72);
  id v13 = v5;
  uint64_t v14 = v6;
  id v15 = v7;
  id v16 = *(id *)(a1 + 80);
  id v17 = v3;
  id v8 = v3;
  +[GKTurnBasedMatch loadTurnBasedMatchWithDetailsForMatchID:v4 withCompletionHandler:v9];
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_193(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_193_cold_1();
    }
  }
  else
  {
    switch(*(void *)(a1 + 96))
    {
      case 'P':
        if (!os_log_GKGeneral) {
          id v8 = GKOSLoggers();
        }
        id v9 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "lookForEvent:TBG Command: GKPushCommandTurnBasedInvite", buf, 2u);
        }
        id v10 = *(void **)(a1 + 32);
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_194;
        v71[3] = &unk_1E64700C0;
        id v72 = v5;
        id v73 = *(id *)(a1 + 40);
        id v74 = *(id *)(a1 + 48);
        id v11 = *(id *)(a1 + 56);
        char v77 = *(unsigned char *)(a1 + 104);
        uint64_t v12 = *(void *)(a1 + 64);
        id v75 = v11;
        uint64_t v76 = v12;
        [v10 perform:v71];

        id v13 = v72;
        goto LABEL_50;
      case 'Q':
        if (!os_log_GKGeneral) {
          id v14 = GKOSLoggers();
        }
        id v15 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C2D22000, v15, OS_LOG_TYPE_INFO, "lookForEvent:TBG Command: GKPushCommandTurnBasedTurn", buf, 2u);
        }
        goto LABEL_16;
      case 'R':
        if (!os_log_GKGeneral) {
          id v22 = GKOSLoggers();
        }
        id v23 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C2D22000, v23, OS_LOG_TYPE_INFO, "lookForEvent:TBG Command: GKPushCommandTurnBasedComplete", buf, 2u);
        }
        [*(id *)(a1 + 40) postNotificationName:@"GKInternalTurnBasedGameEvent" object:*(void *)(a1 + 48)];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_200;
        v61[3] = &unk_1E646F490;
        id v62 = *(id *)(a1 + 56);
        id v63 = v5;
        id v24 = *(id *)(a1 + 72);
        uint64_t v25 = *(void *)(a1 + 64);
        id v64 = v24;
        uint64_t v65 = v25;
        dispatch_async(MEMORY[0x1E4F14428], v61);

        id v13 = v62;
        goto LABEL_50;
      case 'U':
LABEL_16:
        if (!os_log_GKGeneral) {
          id v16 = GKOSLoggers();
        }
        id v17 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C2D22000, v17, OS_LOG_TYPE_INFO, "lookForEvent:TBG Command: GKPushCommandTurnBasedMatchChanged", buf, 2u);
        }
        goto LABEL_20;
      case 'X':
        if (!os_log_GKGeneral) {
          id v26 = GKOSLoggers();
        }
        id v27 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C2D22000, v27, OS_LOG_TYPE_INFO, "lookForEvent:TBG Command: GKPushCommandExchangeRequested", buf, 2u);
        }
        [*(id *)(a1 + 40) postNotificationName:@"GKInternalTurnBasedGameEvent" object:*(void *)(a1 + 48)];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_203;
        v56[3] = &unk_1E646F490;
        id v57 = v5;
        id v58 = *(id *)(a1 + 80);
        id v28 = *(id *)(a1 + 56);
        uint64_t v29 = *(void *)(a1 + 64);
        id v59 = v28;
        uint64_t v60 = v29;
        dispatch_async(MEMORY[0x1E4F14428], v56);

        id v13 = v57;
        goto LABEL_50;
      case 'Y':
        if (!os_log_GKGeneral) {
          id v30 = GKOSLoggers();
        }
        v31 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C2D22000, v31, OS_LOG_TYPE_INFO, "lookForEvent:TBG Command: GKPushCommandExchangeCompleted", buf, 2u);
        }
        [*(id *)(a1 + 40) postNotificationName:@"GKInternalTurnBasedGameEvent" object:*(void *)(a1 + 48)];
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_204;
        v51[3] = &unk_1E646F490;
        id v52 = v5;
        id v53 = *(id *)(a1 + 80);
        id v32 = *(id *)(a1 + 56);
        uint64_t v33 = *(void *)(a1 + 64);
        id v54 = v32;
        uint64_t v55 = v33;
        dispatch_async(MEMORY[0x1E4F14428], v51);

        id v13 = v52;
        goto LABEL_50;
      case 'Z':
        if (!os_log_GKGeneral) {
          id v34 = GKOSLoggers();
        }
        id v35 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C2D22000, v35, OS_LOG_TYPE_INFO, "lookForEvent:TBG Command: GKPushCommandExchangeCanceled", buf, 2u);
        }
        [*(id *)(a1 + 40) postNotificationName:@"GKInternalTurnBasedGameEvent" object:*(void *)(a1 + 48)];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_205;
        v46[3] = &unk_1E646F490;
        id v47 = v5;
        id v48 = *(id *)(a1 + 80);
        id v36 = *(id *)(a1 + 56);
        uint64_t v37 = *(void *)(a1 + 64);
        id v49 = v36;
        uint64_t v50 = v37;
        dispatch_async(MEMORY[0x1E4F14428], v46);

        id v13 = v47;
        goto LABEL_50;
      case '[':
LABEL_20:
        if (!os_log_GKGeneral) {
          id v18 = GKOSLoggers();
        }
        char v19 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C2D22000, v19, OS_LOG_TYPE_INFO, "lookForEvent:TBG Command: GKPushCommandTurnReminder", buf, 2u);
        }
        [*(id *)(a1 + 40) postNotificationName:@"GKInternalTurnBasedGameEvent" object:*(void *)(a1 + 48)];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_199;
        block[3] = &unk_1E6470070;
        id v67 = *(id *)(a1 + 56);
        id v20 = v5;
        char v70 = *(unsigned char *)(a1 + 104);
        uint64_t v21 = *(void *)(a1 + 64);
        id v68 = v20;
        uint64_t v69 = v21;
        dispatch_async(MEMORY[0x1E4F14428], block);

        id v13 = v67;
        goto LABEL_50;
      case '\\':
        if (!os_log_GKGeneral) {
          id v38 = GKOSLoggers();
        }
        id v39 = os_log_GKTrace;
        if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C2D22000, v39, OS_LOG_TYPE_INFO, "lookForEvent:TBG Command: GKPushCommandExchangeSelected", buf, 2u);
        }
        [*(id *)(a1 + 40) postNotificationName:@"GKInternalTurnBasedGameEvent" object:*(void *)(a1 + 48)];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_206;
        v42[3] = &unk_1E646F558;
        id v43 = *(id *)(a1 + 56);
        id v40 = v5;
        uint64_t v41 = *(void *)(a1 + 64);
        id v44 = v40;
        uint64_t v45 = v41;
        dispatch_async(MEMORY[0x1E4F14428], v42);

        id v13 = v43;
LABEL_50:

        break;
      default:
        break;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_194(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_195;
  v8[3] = &unk_1E6470098;
  uint64_t v4 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  char v14 = *(unsigned char *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 64);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = v3;
  id v7 = v3;
  [v4 acceptInviteWithCompletionHandler:v8];
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_195(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (!a3)
  {
    [*(id *)(a1 + 32) postNotificationName:@"GKInternalTurnBasedGameEvent" object:*(void *)(a1 + 40)];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_3_196;
    v11[3] = &unk_1E6470070;
    id v12 = *(id *)(a1 + 48);
    id v9 = v8;
    char v15 = *(unsigned char *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 56);
    id v13 = v9;
    uint64_t v14 = v10;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v5, v6, v7);
}

uint64_t __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_3_196(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) eventEmitter];
  [v2 player:*(void *)(a1 + 32) receivedTurnEventForMatch:*(void *)(a1 + 40) didBecomeActive:*(unsigned __int8 *)(a1 + 56)];

  [*(id *)(a1 + 48) callTurnEventForMatch:*(void *)(a1 + 40) userTapped:*(unsigned __int8 *)(a1 + 56)];
  id v3 = *(void **)(a1 + 48);

  return [v3 lookForEvent];
}

uint64_t __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_199(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) eventEmitter];
  [v2 player:*(void *)(a1 + 32) receivedTurnEventForMatch:*(void *)(a1 + 40) didBecomeActive:*(unsigned __int8 *)(a1 + 56)];

  [*(id *)(a1 + 48) callTurnEventForMatch:*(void *)(a1 + 40) userTapped:*(unsigned __int8 *)(a1 + 56)];
  id v3 = *(void **)(a1 + 48);

  return [v3 lookForEvent];
}

uint64_t __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_200(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) eventEmitter];
  [v2 player:*(void *)(a1 + 32) matchEnded:*(void *)(a1 + 40)];

  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 48) handleMatchEnded:*(void *)(a1 + 40)];
  }
  id v3 = *(void **)(a1 + 56);

  return [v3 lookForEvent];
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_203(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) exchangeForID:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 48) eventEmitter];
  [v2 player:*(void *)(a1 + 48) receivedExchangeRequest:v3 forMatch:*(void *)(a1 + 32)];

  [*(id *)(a1 + 56) lookForEvent];
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_204(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) exchangeForID:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 48) eventEmitter];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = [v5 replies];
  [v2 player:v3 receivedExchangeReplies:v4 forCompletedExchange:v5 forMatch:*(void *)(a1 + 32)];

  [*(id *)(a1 + 56) lookForEvent];
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_205(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) exchangeForID:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 48) eventEmitter];
  [v2 player:*(void *)(a1 + 48) receivedExchangeCancellation:v3 forMatch:*(void *)(a1 + 32)];

  [*(id *)(a1 + 56) lookForEvent];
}

uint64_t __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_206(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) eventEmitter];
  [v2 player:*(void *)(a1 + 32) receivedTurnEventForMatch:*(void *)(a1 + 40) didBecomeActive:1];

  [*(id *)(a1 + 48) callTurnEventForMatch:*(void *)(a1 + 40) userTapped:1];
  id v3 = *(void **)(a1 + 48);

  return [v3 lookForEvent];
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_207(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 multiplayerService];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_208;
  v9[3] = &unk_1E6470138;
  id v10 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v3;
  id v8 = v3;
  [v5 getPlayersToInviteWithHandlerV2:v9];
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_208(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_208_cold_1();
    }
  }
  id v8 = [v5 _gkPlayersFromInternals];
  if (v8)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_209;
    block[3] = &unk_1E646F558;
    id v10 = *(id *)(a1 + 32);
    id v11 = v8;
    id v12 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
    [*(id *)(a1 + 48) lookForEvent];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_209(id *a1)
{
  id v3 = [a1[4] eventEmitter];
  if ([v3 listenerRegisteredForSelector:sel_player_didRequestMatchWithOtherPlayers_])
  {
    [v3 player:a1[4] didRequestMatchWithOtherPlayers:a1[5]];
  }
  else
  {
    v2 = [a1[5] _gkPlayersIDsFromPlayers];
    [v3 player:a1[4] didRequestMatchWithPlayers:v2];
    if (objc_opt_respondsToSelector()) {
      [a1[6] handleInviteFromGameCenter:v2];
    }
  }
}

- (BOOL)didBecomeActive
{
  return self->_didBecomeActive;
}

- (void)setDidBecomeActive:(BOOL)a3
{
  self->_didBecomeActive = a3;
}

- (NSObject)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(NSObject *)delegate
{
}

- (OS_dispatch_queue)lookForEventQueue
{
  return self->_lookForEventQueue;
}

- (void)setLookForEventQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookForEventQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "lookForEvent:Get Next Turn Based Event Failed.Error: %@", v2, v3, v4, v5, v6);
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_193_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "lookForEvent:Load Turn Based Match with Details failed.Error: %@", v2, v3, v4, v5, v6);
}

void __39__GKTurnBasedEventHandler_lookForEvent__block_invoke_2_208_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1C2D22000, v0, v1, "lookForEvent:Failed to get players to invite.Error: %@", v2, v3, v4, v5, v6);
}

@end