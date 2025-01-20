@interface VCWifiAssistManager
+ (id)sharedInstance;
- (BOOL)isAvailable;
- (VCWifiAssistManager)init;
- (id)description;
- (unsigned)wifiAssistState;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)didStartTrackingNOI:(id)a3;
- (void)didStopTrackingNOI:(id)a3;
- (void)init;
- (void)queryBudget;
- (void)queryUserPreference;
- (void)refreshBudget;
- (void)removeDelegate:(id)a3;
@end

@implementation VCWifiAssistManager

- (void)refreshBudget
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VCWifiAssistManager *)self isAvailable];
  [(VCWifiAssistManager *)self queryUserPreference];
  [(VCWifiAssistManager *)self queryBudget];
  BOOL v4 = [(VCWifiAssistManager *)self isAvailable];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v19 = v5;
      __int16 v20 = 2080;
      v21 = "-[VCWifiAssistManager refreshBudget]";
      __int16 v22 = 1024;
      int v23 = 53;
      __int16 v24 = 2112;
      id v25 = [(VCWifiAssistManager *)self description];
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Refresh budget, %@", buf, 0x26u);
    }
  }
  if (v3 != v4)
  {
    v7 = objc_msgSend((id)-[NSMutableSet allObjects](self->_delegates, "allObjects"), "copy");
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          if (v4)
          {
            unsigned __int8 v12 = 0;
          }
          else if (self->_userPrefered)
          {
            unsigned __int8 v12 = 2;
          }
          else
          {
            unsigned __int8 v12 = 1;
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) didChangeWifiAssistAvailable:v4 reason:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
      }
      while (v9);
    }
  }
}

- (VCWifiAssistManager)init
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)VCWifiAssistManager;
  v2 = [(VCWifiAssistManager *)&v17 init];
  BOOL v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_userPrefered = 257;
    [(VCWifiAssistManager *)v2 queryUserPreference];
    BOOL v4 = (NWNetworkOfInterestManager *)objc_alloc_init(MEMORY[0x1E4FA91C8]);
    v3->_manager = v4;
    if (v4)
    {
      [(VCWifiAssistManager *)v3 queryBudget];
      CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
      dispatch_queue_t v6 = dispatch_queue_create_with_target_V2("com.apple.AVConference.vcWifiAssist.serialQueue", 0, CustomRootQueue);
      v3->_serialQueue = (OS_dispatch_queue *)v6;
      [(NWNetworkOfInterestManager *)v3->_manager setQueue:v6];
      [(NWNetworkOfInterestManager *)v3->_manager setDelegate:v3];
      [(NWNetworkOfInterestManager *)v3->_manager trackNOIAnyForInterfaceType:1 options:0];
      uint64_t v7 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:v3];
      uint64_t v8 = [VCDispatchTimer alloc];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __27__VCWifiAssistManager_init__block_invoke;
      v16[3] = &unk_1E6DB3DC8;
      v16[4] = v7;
      v3->_refreshTimer = [(VCDispatchTimer *)v8 initWithIntervalSeconds:1200 callbackBlock:v16 clientQueue:v3->_serialQueue];
      v3->_delegates = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v3->_BOOL respectBudgetStatusEnabled = (+[GKSConnectivitySettings getAbTestMasterLocalSwitches] & 0x400000) != 0;
      if ((int)VRTraceGetErrorLogLevelForModule() > 6)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          BOOL respectBudgetStatusEnabled = v3->_respectBudgetStatusEnabled;
          *(_DWORD *)buf = 136315906;
          uint64_t v19 = v9;
          __int16 v20 = 2080;
          v21 = "-[VCWifiAssistManager init]";
          __int16 v22 = 1024;
          int v23 = 91;
          __int16 v24 = 1024;
          LODWORD(v25) = respectBudgetStatusEnabled;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch wifiAssistBudgetStatusEnabled %d", buf, 0x22u);
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCWifiAssistManager init]();
        }
      }

      BOOL v3 = 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [(VCWifiAssistManager *)v3 description];
        *(_DWORD *)buf = 136315906;
        uint64_t v19 = v12;
        __int16 v20 = 2080;
        v21 = "-[VCWifiAssistManager init]";
        __int16 v22 = 1024;
        int v23 = 94;
        __int16 v24 = 2112;
        uint64_t v25 = v14;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
      }
    }
  }
  return v3;
}

uint64_t __27__VCWifiAssistManager_init__block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) strong];

  return [v1 refreshBudget];
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [(VCDispatchTimer *)self->_refreshTimer stop];

  [(NWNetworkOfInterestManager *)self->_manager setDelegate:0];
  serialQueue = self->_serialQueue;
  if (serialQueue)
  {
    dispatch_release(serialQueue);
    self->_serialQueue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VCWifiAssistManager;
  [(VCWifiAssistManager *)&v4 dealloc];
}

- (void)queryUserPreference
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Can not get value of kCTReliableNetworkFallbackToCellularUserPreferenceKey", v2, v3, v4, v5, v6);
}

- (void)queryBudget
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_respectBudgetStatusEnabled)
  {
    if ([+[VCDefaults sharedInstance] forceWiFiAssistOutOfBudget])
    {
      self->_inBudget = 0;
      return;
    }
    if (self->_wifiNOI)
    {
      v11 = @"com.apple.facetime";
      uint64_t v12 = &unk_1F3DC40F8;
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      manager = self->_manager;
      wifiNOI = self->_wifiNOI;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __34__VCWifiAssistManager_queryBudget__block_invoke;
      v10[3] = &unk_1E6DB6498;
      v10[4] = @"com.apple.facetime";
      v10[5] = self;
      [(NWNetworkOfInterestManager *)manager canUseOnAlternateNOI:wifiNOI appStates:v6 reply:v10];
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v14 = v9;
        __int16 v15 = 2080;
        long long v16 = "-[VCWifiAssistManager queryBudget]";
        __int16 v17 = 1024;
        int v18 = 164;
        uint64_t v5 = " [%s] %s:%d no NOI available, can not query wifi assist budget";
        goto LABEL_12;
      }
    }
  }
  else
  {
    self->_inBudget = 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v14 = v3;
        __int16 v15 = 2080;
        long long v16 = "-[VCWifiAssistManager queryBudget]";
        __int16 v17 = 1024;
        int v18 = 139;
        uint64_t v5 = " [%s] %s:%d Not respecting the budget restrictions as directed by the storebag settings: isInBudget = YES";
LABEL_12:
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0x1Cu);
      }
    }
  }
}

void __34__VCWifiAssistManager_queryBudget__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __34__VCWifiAssistManager_queryBudget__block_invoke_cold_2();
      }
    }
  }
  else if ([a2 count] == 1)
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 9) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *(void *)(a1 + 32)), "BOOLValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(*(void *)(a1 + 40) + 9)) {
          uint64_t v8 = "YES";
        }
        else {
          uint64_t v8 = "NO";
        }
        int v11 = 136315906;
        uint64_t v12 = v6;
        __int16 v13 = 2080;
        uint64_t v14 = "-[VCWifiAssistManager queryBudget]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 159;
        __int16 v17 = 2080;
        int v18 = v8;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d isInBudget = %s", (uint8_t *)&v11, 0x26u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __34__VCWifiAssistManager_queryBudget__block_invoke_cold_1(v9, a2, v10);
    }
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_30);
  }
  return (id)sharedInstance_instance_0;
}

void __37__VCWifiAssistManager_sharedInstance__block_invoke()
{
  if (!sharedInstance_instance_0) {
    sharedInstance_instance_0 = objc_alloc_init(VCWifiAssistManager);
  }
}

- (BOOL)isAvailable
{
  return self->_userPrefered && self->_inBudget;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = "YES";
  if (self->_userPrefered) {
    uint64_t v7 = "YES";
  }
  else {
    uint64_t v7 = "NO";
  }
  if (!self->_inBudget) {
    uint64_t v6 = "NO";
  }
  return (id)[v3 stringWithFormat:@"%@: userPrefered = %s, inBudget = %s", v5, v7, v6];
}

- (void)addDelegate:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__VCWifiAssistManager_addDelegate___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    block[5] = a3;
    dispatch_async(serialQueue, block);
  }
}

void __35__VCWifiAssistManager_addDelegate___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(*(void *)(a1 + 32) + 24) count]) {
    [*(id *)(*(void *)(a1 + 32) + 32) start];
  }
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 24) count];
      int v6 = 136316162;
      uint64_t v7 = v2;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCWifiAssistManager addDelegate:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 199;
      __int16 v12 = 2112;
      uint64_t v13 = v4;
      __int16 v14 = 2048;
      uint64_t v15 = v5;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d delegate %@, _delegates count = %lu after adding", (uint8_t *)&v6, 0x30u);
    }
  }
}

- (void)removeDelegate:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__VCWifiAssistManager_removeDelegate___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    block[5] = a3;
    dispatch_async(serialQueue, block);
  }
}

uint64_t __38__VCWifiAssistManager_removeDelegate___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 24) count];
      int v7 = 136316162;
      uint64_t v8 = v2;
      __int16 v9 = 2080;
      __int16 v10 = "-[VCWifiAssistManager removeDelegate:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 208;
      __int16 v13 = 2112;
      uint64_t v14 = v4;
      __int16 v15 = 2048;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d delegate %@, _delegates count = %lu after removing", (uint8_t *)&v7, 0x30u);
    }
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  if (!result) {
    return [*(id *)(*(void *)(a1 + 32) + 32) stop];
  }
  return result;
}

- (unsigned)wifiAssistState
{
  if (self->_userPrefered) {
    return 2 * !self->_inBudget;
  }
  else {
    return 1;
  }
}

- (void)didStartTrackingNOI:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      __int16 v10 = "-[VCWifiAssistManager didStartTrackingNOI:]";
      __int16 v11 = 1024;
      int v12 = 227;
      __int16 v13 = 2048;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d nouint64_t i = %p", (uint8_t *)&v7, 0x26u);
    }
  }

  self->_wifiNOI = (NWNetworkOfInterest *)a3;
  [(VCWifiAssistManager *)self queryBudget];
}

- (void)didStopTrackingNOI:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      __int16 v10 = "-[VCWifiAssistManager didStopTrackingNOI:]";
      __int16 v11 = 1024;
      int v12 = 234;
      __int16 v13 = 2048;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d nouint64_t i = %p", (uint8_t *)&v7, 0x26u);
    }
  }

  self->_wifiNOI = 0;
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Can not get NWNetworkOfInterestManager", v2, v3, v4, v5, v6);
}

void __34__VCWifiAssistManager_queryBudget__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  int v7 = "-[VCWifiAssistManager queryBudget]_block_invoke";
  __int16 v8 = 1024;
  int v9 = 155;
  __int16 v10 = 2048;
  uint64_t v11 = [a2 count];
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unexpected result count(%lu) of Wifi assist budget query", (uint8_t *)&v4, 0x26u);
}

void __34__VCWifiAssistManager_queryBudget__block_invoke_cold_2()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "-[VCWifiAssistManager queryBudget]_block_invoke";
  __int16 v6 = 1024;
  int v7 = 152;
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Error in canUseOnAlternateNOI: %@", v3, 0x26u);
}

@end