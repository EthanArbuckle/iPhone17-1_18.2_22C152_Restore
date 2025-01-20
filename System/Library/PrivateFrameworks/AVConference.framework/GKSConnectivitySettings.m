@interface GKSConnectivitySettings
+ (BOOL)isFeatureDisabledByExceptionKey:(id)a3;
+ (BOOL)isFeatureEnabledForStorebagKey:(id)a3 exceptionKey:(id)a4 userDefaultKey:(__CFString *)a5 featureFlagDomain:(char *)a6 featureFlagName:(char *)a7;
+ (BOOL)isFeatureEnabledForStorebagKey:(id)a3 userDefaultKey:(__CFString *)a4 featureFlagDomain:(char *)a5 featureFlagName:(char *)a6;
+ (BOOL)isFeatureEnabledForStorebagKey:(id)a3 userDefaultKey:(__CFString *)a4 featureFlagDomain:(char *)a5 featureFlagName:(char *)a6 normalizedRandom:(double)a7;
+ (BOOL)supportiRATRecommendation;
+ (BOOL)supportsEVSCodec;
+ (BOOL)supportsHEVCEncoding;
+ (BOOL)supportsRedAudio;
+ (double)getAdaptiveLearningA;
+ (double)getAdaptiveLearningB;
+ (double)getAdjustmentFactorA;
+ (double)getAdjustmentFactorB;
+ (double)getAdjustmentFactorC;
+ (double)getLongTermValueWeightA;
+ (double)getLongTermValueWeightB;
+ (double)getLongTermValueWeightC;
+ (double)getNoRemoteDuplicationThresholdFast;
+ (double)getRemoteMediaStallTimeout;
+ (double)getShortTermValueWeightA;
+ (double)getShortTermValueWeightB;
+ (double)getShortTermValueWeightC;
+ (double)getThresholdForSwitch:(unsigned int)a3;
+ (id)getAddressForService:(id)a3;
+ (id)getAllSettings;
+ (id)getClientOption:(id)a3;
+ (id)getStorebagValueForStorebagKey:(id)a3 userDefaultKey:(__CFString *)a4 defaultValue:(id)a5 isDoubleType:(BOOL)a6;
+ (id)getStorebagValueStorebagKey:(id)a3 defaultValue:(id)a4;
+ (id)getTestGroupPermutations:(unsigned __int8)a3;
+ (id)getVCRCSeverBagConfigWithKey:(id)a3;
+ (id)readStorebagValueForStorebagKey:(id)a3 userDefaultKey:(__CFString *)a4 defaultValue:(id)a5 isDoubleType:(BOOL)a6;
+ (int)getAdaptiveLearningState;
+ (int)getDecryptionMKMRecoveryInterval;
+ (int)getDecryptionTimeoutInterval;
+ (int)getKeepAliveTimeoutFromCarrierBundle;
+ (int)getLongTermHistoryLength;
+ (int)getNATTypeFromCarrierBundle;
+ (int)getNewSessionJoiningInterval;
+ (int)getRateControllerType;
+ (int)getShortTermHistoryLength;
+ (int)getWRMRSSIThresholdValue:(int)a3;
+ (tagIPPORT)getCachedIPPort;
+ (tagIPPORT)getIPPortForService:(id)a3;
+ (unsigned)getAbTestMasterLocalSwitches;
+ (unsigned)getAbTestingState;
+ (void)clearAllSettingsWithRefreshIntervalInSeconds:(int)a3;
+ (void)getAdaptiveLearningState;
+ (void)setAddress:(id)a3 forService:(id)a4;
+ (void)setClientOptions:(id)a3;
+ (void)setServerAddresses:(id)a3;
- (GKSConnectivitySettings)init;
- (void)dealloc;
@end

@implementation GKSConnectivitySettings

+ (id)getAllSettings
{
  pthread_mutex_lock(&g_xGKSConnectivitySettings);
  v2 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:g_Settings];
  pthread_mutex_unlock(&g_xGKSConnectivitySettings);
  return v2;
}

+ (void)setAddress:(id)a3 forService:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316162;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      v12 = "+[GKSConnectivitySettings setAddress:forService:]";
      __int16 v13 = 1024;
      int v14 = 441;
      __int16 v15 = 2112;
      id v16 = a4;
      __int16 v17 = 2112;
      id v18 = a3;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings: %@ => %@", (uint8_t *)&v9, 0x30u);
    }
  }
  pthread_mutex_lock(&g_xGKSConnectivitySettings);
  id v8 = (id)g_Settings;
  if (!g_Settings)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    g_Settings = (uint64_t)v8;
  }
  [v8 setObject:a3 forKeyedSubscript:a4];
  pthread_mutex_unlock(&g_xGKSConnectivitySettings);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"GKSConnSettingsUpdate", 0);
}

+ (id)readStorebagValueForStorebagKey:(id)a3 userDefaultKey:(__CFString *)a4 defaultValue:(id)a5 isDoubleType:(BOOL)a6
{
  return +[GKSConnectivitySettings getStorebagValueForStorebagKey:a3 userDefaultKey:a4 defaultValue:a5 isDoubleType:a6];
}

+ (void)setServerAddresses:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315906;
      uint64_t v12 = v4;
      __int16 v13 = 2080;
      int v14 = "+[GKSConnectivitySettings setServerAddresses:]";
      __int16 v15 = 1024;
      int v16 = 464;
      __int16 v17 = 2112;
      id v18 = a3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings: set server: %@", (uint8_t *)&v11, 0x26u);
    }
  }
  pthread_mutex_lock(&g_xGKSConnectivitySettings);
  if (!g_Settings)
  {
    g_Settings = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int v6 = objc_msgSend((id)(id)CFPreferencesCopyAppValue(@"specialAllocForHeapInspection", @"com.apple.VideoConference"), "BOOLValue");
    g_bSpecialAllocForHeapInspection = v6;
    if (v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        id v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315650;
          uint64_t v12 = v7;
          __int16 v13 = 2080;
          int v14 = "+[GKSConnectivitySettings setServerAddresses:]";
          __int16 v15 = 1024;
          int v16 = 472;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d  **** GKSConnectivitySettings:setServerAddresses: \"Special Allocation For Heap Inspection\" has been enabled.", (uint8_t *)&v11, 0x1Cu);
        }
      }
    }
  }
  uint64_t v9 = g_cacheClearTime;
  if (*(double *)&g_cacheClearTime == 0.0)
  {
    *(double *)&uint64_t v9 = micro();
    g_cacheClearTime = v9;
  }
  if (g_bSpecialAllocForHeapInspection)
  {
    uint64_t v10 = objc_msgSend(a3, "copyGKSDeep", *(double *)&v9);
    [(id)g_Settings addEntriesFromDictionary:v10];
  }
  else
  {
    objc_msgSend((id)g_Settings, "addEntriesFromDictionary:", a3, *(double *)&v9);
  }
  pthread_mutex_unlock(&g_xGKSConnectivitySettings);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"GKSConnSettingsUpdate", 0);
}

+ (void)setClientOptions:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      uint64_t v10 = "+[GKSConnectivitySettings setClientOptions:]";
      __int16 v11 = 1024;
      int v12 = 501;
      __int16 v13 = 2112;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings: set client: %@", (uint8_t *)&v7, 0x26u);
    }
  }
  pthread_mutex_lock(&g_xGKSConnectivitySettings);
  id v6 = (id)g_Settings;
  if (!g_Settings)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    g_Settings = (uint64_t)v6;
  }
  [v6 addEntriesFromDictionary:a3];
  pthread_mutex_unlock(&g_xGKSConnectivitySettings);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"GKSConnSettingsUpdate", 0);
}

+ (id)getClientOption:(id)a3
{
  pthread_mutex_lock(&g_xGKSConnectivitySettings);
  id v4 = (id)[(id)g_Settings objectForKeyedSubscript:a3];
  if (!v4)
  {
    if ([a3 compare:@"staticnattypefromcarrierbundle"])
    {
      if ([a3 compare:@"keepalivetimeoutfromcarrierbundle"])
      {
        id v4 = 0;
        goto LABEL_8;
      }
      v5 = NSNumber;
      uint64_t v6 = +[GKSConnectivitySettings getKeepAliveTimeoutFromCarrierBundle];
    }
    else
    {
      v5 = NSNumber;
      uint64_t v6 = +[GKSConnectivitySettings getNATTypeFromCarrierBundle];
    }
    id v4 = (id)[v5 numberWithInt:v6];
    [(id)g_Settings setObject:v4 forKeyedSubscript:a3];
  }
LABEL_8:
  pthread_mutex_unlock(&g_xGKSConnectivitySettings);
  return v4;
}

+ (id)getAddressForService:(id)a3
{
  pthread_mutex_lock(&g_xGKSConnectivitySettings);
  id v4 = (id)[(id)g_Settings objectForKeyedSubscript:a3];
  pthread_mutex_unlock(&g_xGKSConnectivitySettings);
  return v4;
}

+ (tagIPPORT)getCachedIPPort
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (tagIPPORT *)malloc_type_calloc(1uLL, 0x28uLL, 0x100004053E81896uLL);
  if (!v2) {
    return v2;
  }
  pthread_mutex_lock(&g_xGKSConnectivitySettings);
  if (g_cachedCommNATServer)
  {
    if (*(unsigned char *)g_cachedCommNATServer)
    {
      if (*(void *)(g_cachedCommNATServer + 20) != *MEMORY[0x1E4F148B8]
        || *(void *)(g_cachedCommNATServer + 28) != *(void *)(MEMORY[0x1E4F148B8] + 8))
      {
        goto LABEL_5;
      }
    }
    else if (*(_DWORD *)(g_cachedCommNATServer + 20))
    {
LABEL_5:
      long long v3 = *(_OWORD *)g_cachedCommNATServer;
      long long v4 = *(_OWORD *)(g_cachedCommNATServer + 16);
      *(void *)&v2->IP.abIPv6[12] = *(void *)(g_cachedCommNATServer + 32);
      *(_OWORD *)&v2->iFlags = v3;
      *(_OWORD *)&v2->szIfName[12] = v4;
      pthread_mutex_unlock(&g_xGKSConnectivitySettings);
LABEL_15:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          dwIPlong long v4 = v2->IP.dwIPv4;
          int wPort = v2->wPort;
          int v16 = 136316162;
          uint64_t v17 = v9;
          __int16 v18 = 2080;
          uint64_t v19 = "+[GKSConnectivitySettings getCachedIPPort]";
          __int16 v20 = 1024;
          int v21 = 574;
          __int16 v22 = 1024;
          unsigned int v23 = dwIPv4;
          __int16 v24 = 1024;
          int v25 = wPort;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings getCachedIPPort: %08X:%u", (uint8_t *)&v16, 0x28u);
        }
      }
      return v2;
    }
  }
  pthread_mutex_unlock(&g_xGKSConnectivitySettings);
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_async(global_queue, &__block_literal_global_6);
  free(v2);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315650;
      uint64_t v17 = v7;
      __int16 v18 = 2080;
      uint64_t v19 = "+[GKSConnectivitySettings getCachedIPPort]";
      __int16 v20 = 1024;
      int v21 = 565;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings: prepare to enter getIPPortForService", (uint8_t *)&v16, 0x1Cu);
    }
  }
  v2 = +[GKSConnectivitySettings getIPPortForService:@"gk-commnat-main0"];
  if (v2) {
    goto LABEL_15;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    id v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315650;
      uint64_t v17 = v13;
      __int16 v18 = 2080;
      uint64_t v19 = "+[GKSConnectivitySettings getCachedIPPort]";
      __int16 v20 = 1024;
      int v21 = 576;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings getCachedIPPort failed", (uint8_t *)&v16, 0x1Cu);
    }
  }
  return 0;
}

void __42__GKSConnectivitySettings_getCachedIPPort__block_invoke()
{
  v0 = +[GKSConnectivitySettings getIPPortForService:@"gk-commnat-main0-name"];
  if (v0)
  {
    free(v0);
  }
}

+ (tagIPPORT)getIPPortForService:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  v5 = (tagIPPORT *)malloc_type_calloc(1uLL, 0x28uLL, 0x100004053E81896uLL);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_43;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    int v21 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_43;
    }
    if (a3) {
      __int16 v22 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    }
    else {
      __int16 v22 = "<nil>";
    }
    *(_DWORD *)v36 = 136315906;
    *(void *)&v36[4] = v20;
    *(_WORD *)&v36[12] = 2080;
    *(void *)&v36[14] = "+[GKSConnectivitySettings getIPPortForService:]";
    *(_WORD *)&v36[22] = 1024;
    LODWORD(v37) = 587;
    WORD2(v37) = 2080;
    *(void *)((char *)&v37 + 6) = v22;
    v32 = " [%s] %s:%d GKSConnSettings getIPPortForService: %s == 00";
LABEL_42:
    _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v32, v36, 0x26u);
    goto LABEL_43;
  }
  uint64_t v6 = v5;
  pthread_mutex_lock(&g_xGKSConnectivitySettings);
  id v7 = (id)[(id)g_Settings objectForKeyedSubscript:a3];
  pthread_mutex_unlock(&g_xGKSConnectivitySettings);
  if (!v7)
  {
    free(v6);
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_43;
    }
    uint64_t v23 = VRTraceErrorLogLevelToCSTR();
    int v21 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_43;
    }
    if (a3) {
      __int16 v24 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    }
    else {
      __int16 v24 = "<nil>";
    }
    *(_DWORD *)v36 = 136315906;
    *(void *)&v36[4] = v23;
    *(_WORD *)&v36[12] = 2080;
    *(void *)&v36[14] = "+[GKSConnectivitySettings getIPPortForService:]";
    *(_WORD *)&v36[22] = 1024;
    LODWORD(v37) = 597;
    WORD2(v37) = 2080;
    *(void *)((char *)&v37 + 6) = v24;
    v32 = " [%s] %s:%d GKSConnSettings getIPPortForService: %s == nil";
    goto LABEL_42;
  }
  uint64_t v8 = strdup((const char *)[v7 UTF8String]);

  if (v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v36 = 136315906;
        *(void *)&v36[4] = v9;
        *(_WORD *)&v36[12] = 2080;
        *(void *)&v36[14] = "+[GKSConnectivitySettings getIPPortForService:]";
        *(_WORD *)&v36[22] = 1024;
        LODWORD(v37) = 604;
        WORD2(v37) = 2080;
        *(void *)((char *)&v37 + 6) = v8;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings getIPPortForService: GKS setting for get SNATMAP IP: %s", v36, 0x26u);
      }
    }
    __int16 v11 = strchr(v8, 58);
    if (!v11) {
      goto LABEL_30;
    }
    *__int16 v11 = 0;
    int v12 = v11 + 1;
    atoi(v11 + 1);
    if (MakeIPPORTWithHostnameIPv4Only())
    {
      if ([a3 isEqualToString:@"gk-commnat-main0-name"])
      {
        pthread_mutex_lock(&g_xGKSConnectivitySettings);
        uint64_t v13 = (void *)g_cachedCommNATServer;
        if (g_cachedCommNATServer
          || (uint64_t v13 = malloc_type_calloc(1uLL, 0x28uLL, 0x100004053E81896uLL), (g_cachedCommNATServer = (uint64_t)v13) != 0))
        {
          long long v14 = *(_OWORD *)&v6->iFlags;
          long long v15 = *(_OWORD *)&v6->szIfName[12];
          v13[4] = *(void *)&v6->IP.abIPv6[12];
          *(_OWORD *)uint64_t v13 = v14;
          *((_OWORD *)v13 + 1) = v15;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v16 = VRTraceErrorLogLevelToCSTR();
            uint64_t v17 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              dwIPid v4 = v6->IP.dwIPv4;
              int wPort = v6->wPort;
              *(_DWORD *)v36 = 136316162;
              *(void *)&v36[4] = v16;
              *(_WORD *)&v36[12] = 2080;
              *(void *)&v36[14] = "+[GKSConnectivitySettings getIPPortForService:]";
              *(_WORD *)&v36[22] = 1024;
              LODWORD(v37) = 631;
              WORD2(v37) = 1024;
              *(_DWORD *)((char *)&v37 + 6) = dwIPv4;
              WORD5(v37) = 1024;
              HIDWORD(v37) = wPort;
              _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings getIPPortForService: cached %08X:%u", v36, 0x28u);
            }
          }
        }
        pthread_mutex_unlock(&g_xGKSConnectivitySettings);
      }
      goto LABEL_30;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v36 = 136315906;
        *(void *)&v36[4] = v25;
        *(_WORD *)&v36[12] = 2080;
        *(void *)&v36[14] = "+[GKSConnectivitySettings getIPPortForService:]";
        *(_WORD *)&v36[22] = 1024;
        LODWORD(v37) = 609;
        WORD2(v37) = 2080;
        *(void *)((char *)&v37 + 6) = v8;
        _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings getIPPortForService: %s failed to resolve", v36, 0x26u);
      }
    }
    in_addr_t v27 = inet_addr(v8);
    uint64_t v28 = strtol(v12, 0, 10);
    if (v27 != -1 && v28)
    {
      v6->IP.dwIPid v4 = bswap32(v27);
      v6->int wPort = v28;
LABEL_30:
      free(v8);
      goto LABEL_31;
    }
    free(v6);
    free(v8);
LABEL_43:
    uint64_t v6 = 0;
    goto LABEL_44;
  }
LABEL_31:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v29 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        v31 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        v31 = "<nil>";
      }
      unsigned int v33 = v6->IP.dwIPv4;
      int v34 = v6->wPort;
      *(_DWORD *)v36 = 136316418;
      *(void *)&v36[4] = v29;
      *(_WORD *)&v36[12] = 2080;
      *(void *)&v36[14] = "+[GKSConnectivitySettings getIPPortForService:]";
      *(_WORD *)&v36[22] = 1024;
      LODWORD(v37) = 638;
      WORD2(v37) = 2080;
      *(void *)((char *)&v37 + 6) = v31;
      HIWORD(v37) = 1024;
      unsigned int v38 = v33;
      __int16 v39 = 1024;
      int v40 = v34;
      _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKSConnSettings getIPPortForService: %s == %08X:%u", v36, 0x32u);
    }
  }
LABEL_44:
  objc_msgSend(v4, "drain", *(_OWORD *)v36, *(void *)&v36[16], v37);
  return v6;
}

+ (void)clearAllSettingsWithRefreshIntervalInSeconds:(int)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v4 = micro();
  double v5 = (double)a3;
  double v6 = *(double *)&g_cacheClearTime + (double)a3;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4 <= v6)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      __int16 v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136316418;
        uint64_t v13 = v10;
        __int16 v14 = 2080;
        long long v15 = "+[GKSConnectivitySettings clearAllSettingsWithRefreshIntervalInSeconds:]";
        __int16 v16 = 1024;
        int v17 = 660;
        __int16 v18 = 1024;
        int v19 = (int)(*(double *)&g_cacheClearTime + v5 - v4);
        __int16 v20 = 2048;
        uint64_t v21 = g_cacheClearTime;
        __int16 v22 = 2048;
        double v23 = v4;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Not yet to clear the locally cached serverbag settings. Still %d seconds left [cacheClearTime: %f, now %f]", (uint8_t *)&v12, 0x36u);
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136316418;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        long long v15 = "+[GKSConnectivitySettings clearAllSettingsWithRefreshIntervalInSeconds:]";
        __int16 v16 = 1024;
        int v17 = 654;
        __int16 v18 = 1024;
        int v19 = a3;
        __int16 v20 = 2048;
        uint64_t v21 = g_cacheClearTime;
        __int16 v22 = 2048;
        double v23 = v4;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Clear the locally cached serverbag settings with interval %d seconds [cacheClearTime: %f, now %f]", (uint8_t *)&v12, 0x36u);
      }
    }
    pthread_mutex_lock(&g_xGKSConnectivitySettings);
    [(id)g_Settings removeAllObjects];
    g_cacheClearTime = *(void *)&v4;
    pthread_mutex_unlock(&g_xGKSConnectivitySettings);
  }
}

+ (int)getNATTypeFromCarrierBundle
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  if (!VCCarrierBundle_QueryCarrierBundleValueForKey(@"StaticNATType", &v8))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      double v6 = *MEMORY[0x1E4F47A50];
      int v2 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return v2;
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      int v12 = "+[GKSConnectivitySettings getNATTypeFromCarrierBundle]";
      __int16 v13 = 1024;
      int v14 = 678;
      __int16 v15 = 1024;
      int v16 = 0;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No key 'StaticNATType' in carrier bundle: using default (0x%08x)", buf, 0x22u);
    }
    return 0;
  }
  int v2 = [v8 intValue];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    double v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v3;
      __int16 v11 = 2080;
      int v12 = "+[GKSConnectivitySettings getNATTypeFromCarrierBundle]";
      __int16 v13 = 1024;
      int v14 = 676;
      __int16 v15 = 1024;
      int v16 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Read key 'StaticNATType' from carrier bundle: 0x%08x", buf, 0x22u);
    }
  }
  return v2;
}

+ (int)getKeepAliveTimeoutFromCarrierBundle
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  if (VCCarrierBundle_QueryCarrierBundleValueForKey(@"ConnectivityKeepAliveTimeout", &v10))
  {
    int v2 = [v10 intValue];
    if (v2 <= 5) {
      unsigned int v3 = 5;
    }
    else {
      unsigned int v3 = v2;
    }
    if (v3 >= 0x78) {
      int v4 = 120;
    }
    else {
      int v4 = v3;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      double v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v12 = v5;
        __int16 v13 = 2080;
        int v14 = "+[GKSConnectivitySettings getKeepAliveTimeoutFromCarrierBundle]";
        __int16 v15 = 1024;
        int v16 = 700;
        __int16 v17 = 1024;
        int v18 = v4;
        id v7 = " [%s] %s:%d Read key 'ConnectivityKeepAliveTimeout' from carrier bundle: %d";
LABEL_14:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 0x22u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 30;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    double v6 = *MEMORY[0x1E4F47A50];
    int v4 = 30;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v8;
      __int16 v13 = 2080;
      int v14 = "+[GKSConnectivitySettings getKeepAliveTimeoutFromCarrierBundle]";
      __int16 v15 = 1024;
      int v16 = 702;
      __int16 v17 = 1024;
      int v18 = 30;
      id v7 = " [%s] %s:%d No key 'ConnectivityKeepAliveTimeout' in carrier bundle: using default (%d)";
      goto LABEL_14;
    }
  }
  return v4;
}

+ (BOOL)supportsHEVCEncoding
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKey:", @"vc-enable-hevc-v2");
  if (!v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      char v4 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return v4;
      }
      int v10 = 136315906;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      __int16 v13 = "+[GKSConnectivitySettings supportsHEVCEncoding]";
      __int16 v14 = 1024;
      int v15 = 720;
      __int16 v16 = 2080;
      uint64_t v17 = [@"vc-enable-hevc-v2" UTF8String];
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s is not present!", (uint8_t *)&v10, 0x26u);
    }
    return 0;
  }
  unsigned int v3 = v2;
  char v4 = [v2 BOOLValue];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    double v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315906;
      uint64_t v11 = v5;
      __int16 v12 = 2080;
      __int16 v13 = "+[GKSConnectivitySettings supportsHEVCEncoding]";
      __int16 v14 = 1024;
      int v15 = 718;
      __int16 v16 = 2080;
      uint64_t v17 = objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d value %s", (uint8_t *)&v10, 0x26u);
    }
  }
  return v4;
}

+ (BOOL)supportsEVSCodec
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKey:", @"vc-enable-evs-audio-codec");
  if (v2)
  {
    unsigned int v3 = v2;
    char v4 = [v2 BOOLValue];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      double v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315906;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings supportsEVSCodec]";
        __int16 v14 = 1024;
        int v15 = 737;
        __int16 v16 = 2080;
        uint64_t v17 = objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d value %s", (uint8_t *)&v10, 0x26u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315906;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings supportsEVSCodec]";
        __int16 v14 = 1024;
        int v15 = 739;
        __int16 v16 = 2080;
        uint64_t v17 = [@"vc-enable-evs-audio-codec" UTF8String];
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s is not present!", (uint8_t *)&v10, 0x26u);
      }
    }
    return 1;
  }
  return v4;
}

+ (BOOL)supportsRedAudio
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKey:", @"vc-enable-red-audio");
  if (v2)
  {
    unsigned int v3 = v2;
    char v4 = [v2 BOOLValue];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      double v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315906;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings supportsRedAudio]";
        __int16 v14 = 1024;
        int v15 = 756;
        __int16 v16 = 2080;
        uint64_t v17 = objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d value %s", (uint8_t *)&v10, 0x26u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315906;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings supportsRedAudio]";
        __int16 v14 = 1024;
        int v15 = 758;
        __int16 v16 = 2080;
        uint64_t v17 = [@"vc-enable-red-audio" UTF8String];
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s is not present!", (uint8_t *)&v10, 0x26u);
      }
    }
    return 1;
  }
  return v4;
}

+ (BOOL)supportiRATRecommendation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-enable-irat-recommendation");
  if (v2)
  {
    int v3 = [v2 BOOLValue];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double v6 = "NOT ";
        int v10 = 136315906;
        if (v3) {
          double v6 = "";
        }
        uint64_t v11 = v4;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings supportiRATRecommendation]";
        __int16 v14 = 1024;
        int v15 = 773;
        __int16 v16 = 2080;
        uint64_t v17 = (uint64_t)v6;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d storebag shows we do %s support iRAT recommendation", (uint8_t *)&v10, 0x26u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315906;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings supportiRATRecommendation]";
        __int16 v14 = 1024;
        int v15 = 775;
        __int16 v16 = 2080;
        uint64_t v17 = [@"vc-enable-irat-recommendation" UTF8String];
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d storebag does not have %s, enable iRAT recommendation support by default", (uint8_t *)&v10, 0x26u);
      }
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

+ (int)getRateControllerType
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-rate-controller-type");
  if (v2)
  {
    int v3 = [v2 intValue];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315906;
        uint64_t v10 = v4;
        __int16 v11 = 2080;
        __int16 v12 = "+[GKSConnectivitySettings getRateControllerType]";
        __int16 v13 = 1024;
        int v14 = 789;
        __int16 v15 = 1024;
        LODWORD(v16) = v3;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d storebag shows we should use rate controller type %d", (uint8_t *)&v9, 0x22u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315906;
        uint64_t v10 = v6;
        __int16 v11 = 2080;
        __int16 v12 = "+[GKSConnectivitySettings getRateControllerType]";
        __int16 v13 = 1024;
        int v14 = 791;
        __int16 v15 = 2080;
        uint64_t v16 = [@"vc-rate-controller-type" UTF8String];
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d storebag does not have %s, select both rate controller type by default", (uint8_t *)&v9, 0x26u);
      }
    }
    return 1;
  }
  return v3;
}

+ (int)getDecryptionTimeoutInterval
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-decryption-timeout-interval");
  if (v2)
  {
    int v3 = [v2 intValue];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136316162;
        uint64_t v10 = v4;
        __int16 v11 = 2080;
        __int16 v12 = "+[GKSConnectivitySettings getDecryptionTimeoutInterval]";
        __int16 v13 = 1024;
        int v14 = 805;
        __int16 v15 = 2112;
        uint64_t v16 = @"vc-decryption-timeout-interval";
        __int16 v17 = 1024;
        int v18 = v3;
        uint64_t v6 = " [%s] %s:%d storebag value for '%@' is '%d'";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x2Cu);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 30;
    }
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    int v3 = 30;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316162;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      __int16 v12 = "+[GKSConnectivitySettings getDecryptionTimeoutInterval]";
      __int16 v13 = 1024;
      int v14 = 807;
      __int16 v15 = 2112;
      uint64_t v16 = @"vc-decryption-timeout-interval";
      __int16 v17 = 1024;
      int v18 = 30;
      uint64_t v6 = " [%s] %s:%d storebag does not have '%@', default value '%d' selected";
      goto LABEL_8;
    }
  }
  return v3;
}

+ (int)getDecryptionMKMRecoveryInterval
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-decryption-mkm-recovery-interval");
  if (v2)
  {
    int v3 = [v2 intValue];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136316162;
        uint64_t v10 = v4;
        __int16 v11 = 2080;
        __int16 v12 = "+[GKSConnectivitySettings getDecryptionMKMRecoveryInterval]";
        __int16 v13 = 1024;
        int v14 = 821;
        __int16 v15 = 2112;
        uint64_t v16 = @"vc-decryption-mkm-recovery-interval";
        __int16 v17 = 1024;
        int v18 = v3;
        uint64_t v6 = " [%s] %s:%d storebag value for '%@' is '%d'";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x2Cu);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 10;
    }
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    int v3 = 10;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316162;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      __int16 v12 = "+[GKSConnectivitySettings getDecryptionMKMRecoveryInterval]";
      __int16 v13 = 1024;
      int v14 = 823;
      __int16 v15 = 2112;
      uint64_t v16 = @"vc-decryption-mkm-recovery-interval";
      __int16 v17 = 1024;
      int v18 = 10;
      uint64_t v6 = " [%s] %s:%d storebag does not have '%@', default value '%d' selected";
      goto LABEL_8;
    }
  }
  return v3;
}

+ (int)getNewSessionJoiningInterval
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-new-session-joining-interval");
  if (v2)
  {
    int v3 = [v2 intValue];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136316162;
        uint64_t v10 = v4;
        __int16 v11 = 2080;
        __int16 v12 = "+[GKSConnectivitySettings getNewSessionJoiningInterval]";
        __int16 v13 = 1024;
        int v14 = 837;
        __int16 v15 = 2112;
        uint64_t v16 = @"vc-new-session-joining-interval";
        __int16 v17 = 1024;
        int v18 = v3;
        uint64_t v6 = " [%s] %s:%d storebag value for '%@' is '%d'";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x2Cu);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 120;
    }
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    int v3 = 120;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316162;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      __int16 v12 = "+[GKSConnectivitySettings getNewSessionJoiningInterval]";
      __int16 v13 = 1024;
      int v14 = 839;
      __int16 v15 = 2112;
      uint64_t v16 = @"vc-new-session-joining-interval";
      __int16 v17 = 1024;
      int v18 = 120;
      uint64_t v6 = " [%s] %s:%d storebag does not have %@, default value '%d' selected";
      goto LABEL_8;
    }
  }
  return v3;
}

+ (int)getAdaptiveLearningState
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = 0;
  int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"useAdaptiveLearningForFaceTime", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    int v3 = AppIntegerValue;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v21 = v4;
          __int16 v22 = 2080;
          double v23 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
          __int16 v24 = 1024;
          int v25 = 856;
          __int16 v26 = 2080;
          in_addr_t v27 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
          __int16 v28 = 1024;
          LODWORD(v29) = v3;
          uint64_t v7 = " [%s] %s:%d %s: Read key 'useAdaptiveLearningForFaceTime' from user defaults: %d";
          uint64_t v8 = v5;
          uint32_t v9 = 44;
LABEL_18:
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        +[GKSConnectivitySettings getAdaptiveLearningState]();
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      __int16 v11 = *MEMORY[0x1E4F47A50];
      __int16 v12 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v21 = v10;
          __int16 v22 = 2080;
          double v23 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
          __int16 v24 = 1024;
          int v25 = 858;
          __int16 v26 = 2080;
          in_addr_t v27 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: No key 'useAdaptiveLearningForFaceTime' in user defaults. Trying to find it in the storebag", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        +[GKSConnectivitySettings getAdaptiveLearningState]();
      }
    }
    __int16 v13 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-adaptive-learning-enabled");
    if (!v13)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        __int16 v17 = *MEMORY[0x1E4F47A50];
        int v3 = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return v3;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v21 = v16;
        __int16 v22 = 2080;
        double v23 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
        __int16 v24 = 1024;
        int v25 = 864;
        __int16 v26 = 2080;
        in_addr_t v27 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
        __int16 v28 = 2112;
        uint64_t v29 = @"vc-adaptive-learning-enabled";
        __int16 v30 = 1024;
        int v31 = 0;
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: storebag does not have %@, using defaul value %D", buf, 0x36u);
      }
      return 0;
    }
    int v3 = [v13 intValue];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      __int16 v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v21 = v14;
        __int16 v22 = 2080;
        double v23 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
        __int16 v24 = 1024;
        int v25 = 862;
        __int16 v26 = 2080;
        in_addr_t v27 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
        __int16 v28 = 2112;
        uint64_t v29 = @"vc-adaptive-learning-enabled";
        __int16 v30 = 1024;
        int v31 = v3;
        uint64_t v7 = " [%s] %s:%d %s: found storebag value '%@'=%d";
        uint64_t v8 = v15;
        uint32_t v9 = 54;
        goto LABEL_18;
      }
    }
  }
  return v3;
}

+ (int)getShortTermHistoryLength
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-short-term-history-length");
  if (v2)
  {
    int v3 = [v2 intValue];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136316418;
        uint64_t v10 = v4;
        __int16 v11 = 2080;
        __int16 v12 = "+[GKSConnectivitySettings getShortTermHistoryLength]";
        __int16 v13 = 1024;
        int v14 = 881;
        __int16 v15 = 2080;
        uint64_t v16 = "+[GKSConnectivitySettings getShortTermHistoryLength]";
        __int16 v17 = 2112;
        int v18 = @"vc-short-term-history-length";
        __int16 v19 = 1024;
        int v20 = v3;
        uint64_t v6 = " [%s] %s:%d %s: found storebag value '%@'=%d";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x36u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 5;
    }
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    int v3 = 5;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316418;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      __int16 v12 = "+[GKSConnectivitySettings getShortTermHistoryLength]";
      __int16 v13 = 1024;
      int v14 = 883;
      __int16 v15 = 2080;
      uint64_t v16 = "+[GKSConnectivitySettings getShortTermHistoryLength]";
      __int16 v17 = 2112;
      int v18 = @"vc-short-term-history-length";
      __int16 v19 = 1024;
      int v20 = 5;
      uint64_t v6 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %d";
      goto LABEL_8;
    }
  }
  return v3;
}

+ (int)getLongTermHistoryLength
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-long-term-history-length");
  if (v2)
  {
    int v3 = [v2 intValue];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136316418;
        uint64_t v10 = v4;
        __int16 v11 = 2080;
        __int16 v12 = "+[GKSConnectivitySettings getLongTermHistoryLength]";
        __int16 v13 = 1024;
        int v14 = 899;
        __int16 v15 = 2080;
        uint64_t v16 = "+[GKSConnectivitySettings getLongTermHistoryLength]";
        __int16 v17 = 2112;
        int v18 = @"vc-long-term-history-length";
        __int16 v19 = 1024;
        int v20 = v3;
        uint64_t v6 = " [%s] %s:%d %s: found storebag value '%@'=%d";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x36u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 30;
    }
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    int v3 = 30;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316418;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      __int16 v12 = "+[GKSConnectivitySettings getLongTermHistoryLength]";
      __int16 v13 = 1024;
      int v14 = 901;
      __int16 v15 = 2080;
      uint64_t v16 = "+[GKSConnectivitySettings getLongTermHistoryLength]";
      __int16 v17 = 2112;
      int v18 = @"vc-long-term-history-length";
      __int16 v19 = 1024;
      int v20 = 30;
      uint64_t v6 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %d";
      goto LABEL_8;
    }
  }
  return v3;
}

+ (double)getAdaptiveLearningA
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-adaptive-learning-A");
  if (v2)
  {
    [v2 doubleValue];
    double v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getAdaptiveLearningA]";
        __int16 v14 = 1024;
        int v15 = 917;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getAdaptiveLearningA]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-adaptive-learning-A";
        __int16 v20 = 2048;
        uint64_t v21 = *(void *)&v4;
        uint64_t v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    double v4 = 0.4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v8;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getAdaptiveLearningA]";
        __int16 v14 = 1024;
        int v15 = 919;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getAdaptiveLearningA]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-adaptive-learning-A";
        __int16 v20 = 2048;
        uint64_t v21 = 0x3FD999999999999ALL;
        uint64_t v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getAdjustmentFactorA
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-adjustment-factor-A");
  if (v2)
  {
    [v2 doubleValue];
    double v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getAdjustmentFactorA]";
        __int16 v14 = 1024;
        int v15 = 935;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getAdjustmentFactorA]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-adjustment-factor-A";
        __int16 v20 = 2048;
        uint64_t v21 = *(void *)&v4;
        uint64_t v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    double v4 = 0.25;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v8;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getAdjustmentFactorA]";
        __int16 v14 = 1024;
        int v15 = 937;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getAdjustmentFactorA]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-adjustment-factor-A";
        __int16 v20 = 2048;
        uint64_t v21 = 0x3FD0000000000000;
        uint64_t v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getShortTermValueWeightA
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-short-term-value-weight-A");
  if (v2)
  {
    [v2 doubleValue];
    double v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getShortTermValueWeightA]";
        __int16 v14 = 1024;
        int v15 = 953;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getShortTermValueWeightA]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-short-term-value-weight-A";
        __int16 v20 = 2048;
        uint64_t v21 = *(void *)&v4;
        uint64_t v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    double v4 = 0.4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v8;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getShortTermValueWeightA]";
        __int16 v14 = 1024;
        int v15 = 955;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getShortTermValueWeightA]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-short-term-value-weight-A";
        __int16 v20 = 2048;
        uint64_t v21 = 0x3FD999999999999ALL;
        uint64_t v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getLongTermValueWeightA
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-long-term-value-weight-A");
  if (v2)
  {
    [v2 doubleValue];
    double v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getLongTermValueWeightA]";
        __int16 v14 = 1024;
        int v15 = 971;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getLongTermValueWeightA]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-long-term-value-weight-A";
        __int16 v20 = 2048;
        uint64_t v21 = *(void *)&v4;
        uint64_t v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    double v4 = 0.1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v8;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getLongTermValueWeightA]";
        __int16 v14 = 1024;
        int v15 = 973;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getLongTermValueWeightA]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-long-term-value-weight-A";
        __int16 v20 = 2048;
        uint64_t v21 = 0x3FB999999999999ALL;
        uint64_t v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getAdaptiveLearningB
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-adaptive-learning-B");
  if (v2)
  {
    [v2 doubleValue];
    double v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getAdaptiveLearningB]";
        __int16 v14 = 1024;
        int v15 = 989;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getAdaptiveLearningB]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-adaptive-learning-B";
        __int16 v20 = 2048;
        uint64_t v21 = *(void *)&v4;
        uint64_t v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    double v4 = 0.4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v8;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getAdaptiveLearningB]";
        __int16 v14 = 1024;
        int v15 = 991;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getAdaptiveLearningB]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-adaptive-learning-B";
        __int16 v20 = 2048;
        uint64_t v21 = 0x3FD999999999999ALL;
        uint64_t v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getAdjustmentFactorB
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-adjustment-factor-B");
  if (v2)
  {
    [v2 doubleValue];
    double v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getAdjustmentFactorB]";
        __int16 v14 = 1024;
        int v15 = 1007;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getAdjustmentFactorB]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-adjustment-factor-B";
        __int16 v20 = 2048;
        uint64_t v21 = *(void *)&v4;
        uint64_t v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    double v4 = 0.25;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v8;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getAdjustmentFactorB]";
        __int16 v14 = 1024;
        int v15 = 1009;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getAdjustmentFactorB]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-adjustment-factor-B";
        __int16 v20 = 2048;
        uint64_t v21 = 0x3FD0000000000000;
        uint64_t v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getShortTermValueWeightB
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-short-term-value-weight-B");
  if (v2)
  {
    [v2 doubleValue];
    double v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getShortTermValueWeightB]";
        __int16 v14 = 1024;
        int v15 = 1025;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getShortTermValueWeightB]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-short-term-value-weight-B";
        __int16 v20 = 2048;
        uint64_t v21 = *(void *)&v4;
        uint64_t v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    double v4 = 0.5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v8;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getShortTermValueWeightB]";
        __int16 v14 = 1024;
        int v15 = 1027;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getShortTermValueWeightB]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-short-term-value-weight-B";
        __int16 v20 = 2048;
        uint64_t v21 = 0x3FE0000000000000;
        uint64_t v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getLongTermValueWeightB
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-long-term-value-weight-B");
  if (v2)
  {
    [v2 doubleValue];
    double v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getLongTermValueWeightB]";
        __int16 v14 = 1024;
        int v15 = 1043;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getLongTermValueWeightB]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-long-term-value-weight-B";
        __int16 v20 = 2048;
        uint64_t v21 = *(void *)&v4;
        uint64_t v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    double v4 = 0.2;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v8;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getLongTermValueWeightB]";
        __int16 v14 = 1024;
        int v15 = 1045;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getLongTermValueWeightB]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-long-term-value-weight-B";
        __int16 v20 = 2048;
        uint64_t v21 = 0x3FC999999999999ALL;
        uint64_t v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getAdjustmentFactorC
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-adjustment-factor-C");
  if (v2)
  {
    [v2 doubleValue];
    double v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getAdjustmentFactorC]";
        __int16 v14 = 1024;
        int v15 = 1061;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getAdjustmentFactorC]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-adjustment-factor-C";
        __int16 v20 = 2048;
        uint64_t v21 = *(void *)&v4;
        uint64_t v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    double v4 = 0.25;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v8;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getAdjustmentFactorC]";
        __int16 v14 = 1024;
        int v15 = 1063;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getAdjustmentFactorC]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-adjustment-factor-C";
        __int16 v20 = 2048;
        uint64_t v21 = 0x3FD0000000000000;
        uint64_t v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getShortTermValueWeightC
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-short-term-value-weight-C");
  if (v2)
  {
    [v2 doubleValue];
    double v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getShortTermValueWeightC]";
        __int16 v14 = 1024;
        int v15 = 1079;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getShortTermValueWeightC]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-short-term-value-weight-C";
        __int16 v20 = 2048;
        uint64_t v21 = *(void *)&v4;
        uint64_t v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    double v4 = 0.4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v8;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getShortTermValueWeightC]";
        __int16 v14 = 1024;
        int v15 = 1081;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getShortTermValueWeightC]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-short-term-value-weight-C";
        __int16 v20 = 2048;
        uint64_t v21 = 0x3FD999999999999ALL;
        uint64_t v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (double)getLongTermValueWeightC
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-long-term-value-weight-C");
  if (v2)
  {
    [v2 doubleValue];
    double v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getLongTermValueWeightC]";
        __int16 v14 = 1024;
        int v15 = 1097;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getLongTermValueWeightC]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-long-term-value-weight-C";
        __int16 v20 = 2048;
        uint64_t v21 = *(void *)&v4;
        uint64_t v7 = " [%s] %s:%d %s: found storebag value '%@'=%f";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x3Au);
      }
    }
  }
  else
  {
    double v4 = 0.1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316418;
        uint64_t v11 = v8;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getLongTermValueWeightC]";
        __int16 v14 = 1024;
        int v15 = 1099;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getLongTermValueWeightC]";
        __int16 v18 = 2112;
        __int16 v19 = @"vc-long-term-value-weight-C";
        __int16 v20 = 2048;
        uint64_t v21 = 0x3FB999999999999ALL;
        uint64_t v7 = " [%s] %s:%d %s: storebag does not have %@, using defaul value %f";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (int)getWRMRSSIThresholdValue:(int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v4 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-wrm-rssi-threshold-distribution");
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = (void *)[v4 componentsSeparatedByString:@","];
    if ([v6 count]) {
      a3 = objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v6, "count"))), "intValue");
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316418;
        uint64_t v14 = v7;
        __int16 v15 = 2080;
        __int16 v16 = "+[GKSConnectivitySettings getWRMRSSIThresholdValue:]";
        __int16 v17 = 1024;
        int v18 = 1117;
        __int16 v19 = 2112;
        __int16 v20 = @"vc-wrm-rssi-threshold-distribution";
        __int16 v21 = 2112;
        *(void *)uint64_t v22 = v5;
        *(_WORD *)&v22[8] = 1024;
        *(_DWORD *)&v22[10] = a3;
        int v9 = " [%s] %s:%d Found storebag value '%@'=%@, using threshold value %d";
LABEL_12:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, 0x36u);
      }
    }
  }
  else
  {
    int v10 = (void *)[@"-80,-80,-80,-80,-80,-80,-80,-83,-85,-87" componentsSeparatedByString:@","];
    if ([v10 count]) {
      a3 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v10, "count"))), "intValue");
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316418;
        uint64_t v14 = v11;
        __int16 v15 = 2080;
        __int16 v16 = "+[GKSConnectivitySettings getWRMRSSIThresholdValue:]";
        __int16 v17 = 1024;
        int v18 = 1123;
        __int16 v19 = 2112;
        __int16 v20 = @"vc-wrm-rssi-threshold-distribution";
        __int16 v21 = 1024;
        *(_DWORD *)uint64_t v22 = a3;
        *(_WORD *)&v22[4] = 2112;
        *(void *)&v22[6] = v10;
        int v9 = " [%s] %s:%d Storebag does not have %@, using threshold value %d from default distribution %@";
        goto LABEL_12;
      }
    }
  }
  return a3;
}

+ (double)getThresholdForSwitch:(unsigned int)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  double v3 = NAN;
  double v4 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
  if ((int)a3 < 0x10000)
  {
    if ((int)a3 <= 255)
    {
      if ((int)a3 <= 15)
      {
        uint64_t v5 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
        switch(a3)
        {
          case 1u:
            uint64_t v5 = @"preferRelayOverP2PThreshold";
            double v4 = @"vc-prefer-relay-over-p2p-threshold";
            double v3 = 0.1;
            break;
          case 2u:
            double v3 = 1.0;
            uint64_t v5 = @"alwaysOnAudioRedundancyEnableThreshold";
            double v4 = @"vc-always-on-audio-redundancy-enable-threshold";
            break;
          case 4u:
            double v3 = 0.0;
            uint64_t v5 = @"highFecEnableThreshold";
            double v4 = @"vc-high-fec-enable-threshold";
            break;
          case 8u:
            double v3 = 1.0;
            uint64_t v5 = @"lowFpsVideoEnableThreshold";
            double v4 = @"vc-low-fps-video-enable-threshold";
            break;
          default:
            goto LABEL_138;
        }
        goto LABEL_138;
      }
      int v18 = @"fastMediaDuplicationEnableThreshold";
      double v6 = 1.0;
      __int16 v19 = @"vc-fast-media-duplication-enable-threshold";
      unsigned int v38 = @"iRATRtpEnableThreshold";
      __int16 v39 = @"vc-iRAT-rtp-enable-threshold";
      if (a3 == 128)
      {
        double v10 = 1.0;
      }
      else
      {
        __int16 v39 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
        unsigned int v38 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
        double v10 = NAN;
      }
      if (a3 != 64)
      {
        __int16 v19 = v39;
        int v18 = v38;
      }
      uint64_t v22 = @"vplrFecEnableThreshold";
      uint64_t v23 = @"vc-vplr-fec-enable-threshold";
      if (a3 == 64) {
        double v10 = 1.0;
      }
      int v40 = @"UseVideoJitterForVideoPlayoutForFaceTime";
      uint64_t v41 = @"vc-ab-testing-use-video-jitter-for-video-playout";
      double v42 = 0.0;
      if (a3 != 32)
      {
        uint64_t v41 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
        int v40 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
        double v42 = NAN;
      }
      if (a3 != 16)
      {
        uint64_t v23 = v41;
        uint64_t v22 = v40;
        double v6 = v42;
      }
      BOOL v17 = (int)a3 <= 63;
      goto LABEL_65;
    }
    double v6 = 1.0;
    if ((int)a3 <= 4095)
    {
      int v18 = @"allowBurstyLossRampDownEnableThreshold";
      __int16 v19 = @"vc-allow-bursty-loss-ramp-down-enable-threshold";
      __int16 v20 = @"hevcWifiTiersEnableThreshold";
      __int16 v21 = @"vc-hevc-wifi-tiers-enable-threshold";
      if (a3 == 2048)
      {
        double v10 = 1.0;
      }
      else
      {
        __int16 v21 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
        __int16 v20 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
        double v10 = NAN;
      }
      if (a3 == 1024)
      {
        double v10 = 1.0;
      }
      else
      {
        __int16 v19 = v21;
        int v18 = v20;
      }
      uint64_t v22 = @"preWarmCellEnableThreshold";
      uint64_t v23 = @"vc-pre-warm-cell-enable-threshold";
      __int16 v24 = @"duplicateImportantPktsEnableThreshold";
      int v25 = @"vc-duplicate-important-pkts-enable-threshold";
      if (a3 == 512)
      {
        double v26 = 1.0;
      }
      else
      {
        int v25 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
        __int16 v24 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
        double v26 = NAN;
      }
      if (a3 != 256)
      {
        uint64_t v23 = v25;
        uint64_t v22 = v24;
        double v6 = v26;
      }
      BOOL v17 = (int)a3 <= 1023;
LABEL_65:
      if (v17) {
        double v4 = v23;
      }
      else {
        double v4 = v19;
      }
      if (v17) {
        uint64_t v5 = v22;
      }
      else {
        uint64_t v5 = v18;
      }
LABEL_71:
      if (v17) {
        double v3 = v6;
      }
      else {
        double v3 = v10;
      }
      goto LABEL_138;
    }
    in_addr_t v27 = @"wifiLowTierRedundancyEnableThreshold";
    __int16 v28 = @"vc-wifi-low-tier-redundancy-enable-threshold";
    v43 = @"cellularLowTierRedundancyEnableThreshold";
    v44 = @"vc-cellular-low-tier-redundancy-enable-threshold";
    if (a3 == 0x8000)
    {
      double v31 = 1.0;
    }
    else
    {
      v44 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
      v43 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
      double v31 = NAN;
    }
    if (a3 == 0x4000)
    {
      double v31 = 1.0;
    }
    else
    {
      __int16 v28 = v44;
      in_addr_t v27 = v43;
    }
    uint64_t v32 = @"viewpointCorrectionEnableThreshold";
    unsigned int v33 = @"vc-viewpoint-correction-enable-threshold";
    v45 = @"heifHevcLivePhotosEnableThreshold";
    v46 = @"vc-heif-hevc-live-photos-enable-threshold";
    if (a3 == 0x2000)
    {
      double v47 = 1.0;
    }
    else
    {
      v46 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
      v45 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
      double v47 = NAN;
    }
    if (a3 != 4096)
    {
      unsigned int v33 = v46;
      uint64_t v32 = v45;
      double v6 = v47;
    }
    BOOL v37 = (int)a3 < 0x4000;
    goto LABEL_86;
  }
  if ((int)a3 < 0x800000)
  {
    double v6 = 1.0;
    if ((int)a3 >= 0x80000)
    {
      in_addr_t v27 = @"wifiAssistDuplicationEnableThreshold";
      __int16 v28 = @"vc-wifi-assist-duplication-enable-threshold";
      uint64_t v29 = @"wifiAssistBudgetStatusEnableThreshold";
      __int16 v30 = @"vc-wifi-assist-budget-status-enable-threshold";
      if (a3 == 0x400000)
      {
        double v31 = 1.0;
      }
      else
      {
        __int16 v30 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
        uint64_t v29 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
        double v31 = NAN;
      }
      if (a3 == 0x200000)
      {
        double v31 = 1.0;
      }
      else
      {
        __int16 v28 = v30;
        in_addr_t v27 = v29;
      }
      uint64_t v32 = @"secureMessagingEnableThreshold";
      unsigned int v33 = @"vc-secure-messaging-enable-threshold";
      int v34 = @"disableSIPEnableThreshold";
      v35 = @"vc-disable-SIP-enable-threshold";
      if (a3 == 0x100000)
      {
        double v36 = 1.0;
      }
      else
      {
        v35 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
        int v34 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
        double v36 = NAN;
      }
      if (a3 != 0x80000)
      {
        unsigned int v33 = v35;
        uint64_t v32 = v34;
        double v6 = v36;
      }
      BOOL v37 = (int)a3 < 0x200000;
LABEL_86:
      if (v37) {
        double v4 = v33;
      }
      else {
        double v4 = v28;
      }
      if (v37) {
        uint64_t v5 = v32;
      }
      else {
        uint64_t v5 = v27;
      }
      if (v37) {
        double v3 = v6;
      }
      else {
        double v3 = v31;
      }
      goto LABEL_138;
    }
    v60 = @"fecHeaderV1EnableThreshold";
    v61 = @"vc-fec-header-v1-enable-threshold";
    v62 = @"updatedAFRCHeaderEnableThreshold";
    v63 = @"vc-updated-AFRC-header-enable-threshold";
    if (a3 == 0x40000)
    {
      double v64 = 1.0;
    }
    else
    {
      v63 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
      v62 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
      double v64 = NAN;
    }
    if (a3 == 0x20000)
    {
      double v64 = 1.0;
    }
    else
    {
      v61 = v63;
      v60 = v62;
    }
    if (a3 == 0x10000) {
      double v4 = @"vc-iRAT-metrics-enable-threshold";
    }
    else {
      double v4 = v61;
    }
    if (a3 == 0x10000) {
      uint64_t v5 = @"iRATMetricsEnableThreshold";
    }
    else {
      uint64_t v5 = v60;
    }
    if (a3 == 0x10000) {
      double v3 = 1.0;
    }
    else {
      double v3 = v64;
    }
  }
  else
  {
    if ((int)a3 <= 0x7FFFFFF)
    {
      double v6 = 1.0;
      uint64_t v7 = @"duplicationEnhancementEnableThreshold";
      uint64_t v8 = @"videoJBEnableThreshold";
      int v9 = @"vc-video-jb-enable-threshold-v2";
      double v10 = 0.0;
      if (a3 != 0x4000000)
      {
        int v9 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
        uint64_t v8 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
        double v10 = NAN;
      }
      if (a3 == 0x2000000) {
        uint64_t v11 = @"vc-duplication-enhancement-enable-threshold";
      }
      else {
        uint64_t v11 = v9;
      }
      if (a3 == 0x2000000) {
        double v10 = 1.0;
      }
      else {
        uint64_t v7 = v8;
      }
      __int16 v12 = @"wifiAssistStatusBarEnableThreshold";
      int v13 = @"vc-wifi-assist-status-bar-enable-threshold";
      uint64_t v14 = @"lowNetworkModeEnableThreshold";
      __int16 v15 = @"vc-low-network-mode-enable-threshold";
      if (a3 == 0x1000000)
      {
        double v16 = 1.0;
      }
      else
      {
        __int16 v15 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
        uint64_t v14 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
        double v16 = NAN;
      }
      if (a3 != 0x800000)
      {
        int v13 = v15;
        __int16 v12 = v14;
        double v6 = v16;
      }
      BOOL v17 = (int)a3 <= 0x1FFFFFF;
      if ((int)a3 <= 0x1FFFFFF) {
        double v4 = v13;
      }
      else {
        double v4 = v11;
      }
      if ((int)a3 <= 0x1FFFFFF) {
        uint64_t v5 = v12;
      }
      else {
        uint64_t v5 = v7;
      }
      goto LABEL_71;
    }
    double v48 = 0.0;
    v49 = @"mediaDrivenDuplicationEnableThreshold";
    v50 = @"useRTTForFIRThrottling";
    v51 = @"vc-ab-testing-use-rtt-for-fir-throttling";
    if (a3 == 0x40000000)
    {
      double v52 = 0.0;
    }
    else
    {
      v51 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
      v50 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
      double v52 = NAN;
    }
    if (a3 == 0x20000000) {
      v53 = @"vc-media-driven-duplication-enable-threshold";
    }
    else {
      v53 = v51;
    }
    if (a3 != 0x20000000)
    {
      v49 = v50;
      double v48 = v52;
    }
    v54 = @"iRATDuplicationEnableThreshold";
    v55 = @"wrmRSSIThresholdEnableThreshold";
    v56 = @"vc-wrm-rssi-threshold-enable-threshold";
    double v57 = 1.0;
    if (a3 == 0x10000000)
    {
      double v58 = 1.0;
    }
    else
    {
      v56 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
      v55 = (__CFString *)0xAAAAAAAAAAAAAAAALL;
      double v58 = NAN;
    }
    if (a3 == 0x8000000) {
      v59 = @"vc-iRAT-duplication-enable-threshold";
    }
    else {
      v59 = v56;
    }
    if (a3 != 0x8000000)
    {
      v54 = v55;
      double v57 = v58;
    }
    if ((int)a3 <= 0x1FFFFFFF) {
      double v4 = v59;
    }
    else {
      double v4 = v53;
    }
    if ((int)a3 <= 0x1FFFFFFF) {
      uint64_t v5 = v54;
    }
    else {
      uint64_t v5 = v49;
    }
    if ((int)a3 <= 0x1FFFFFFF) {
      double v3 = v57;
    }
    else {
      double v3 = v48;
    }
  }
LABEL_138:
  v65 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", v4);
  if (v65)
  {
    v66 = v65;
    [v65 doubleValue];
    +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", v5);
    double v68 = v67;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v69 = VRTraceErrorLogLevelToCSTR();
      v70 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        [v66 doubleValue];
        int v79 = 136316418;
        uint64_t v80 = v69;
        __int16 v81 = 2080;
        v82 = "+[GKSConnectivitySettings getThresholdForSwitch:]";
        __int16 v83 = 1024;
        int v84 = 1297;
        __int16 v85 = 2112;
        v86 = v4;
        __int16 v87 = 2048;
        double v88 = v71;
        __int16 v89 = 2048;
        double v90 = v68;
        v72 = " [%s] %s:%d Found storebag value '%@'=%f, using %f";
        v73 = v70;
        uint32_t v74 = 58;
LABEL_145:
        _os_log_impl(&dword_1E1EA4000, v73, OS_LOG_TYPE_DEFAULT, v72, (uint8_t *)&v79, v74);
      }
    }
  }
  else
  {
    +[VCDefaults getDoubleValueForKey:v5 defaultValue:v3];
    double v68 = v75;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v76 = VRTraceErrorLogLevelToCSTR();
      v77 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v79 = 136316162;
        uint64_t v80 = v76;
        __int16 v81 = 2080;
        v82 = "+[GKSConnectivitySettings getThresholdForSwitch:]";
        __int16 v83 = 1024;
        int v84 = 1300;
        __int16 v85 = 2112;
        v86 = v4;
        __int16 v87 = 2048;
        double v88 = v68;
        v72 = " [%s] %s:%d Storebag does not have %@, using default value %f";
        v73 = v77;
        uint32_t v74 = 48;
        goto LABEL_145;
      }
    }
  }
  return v68;
}

+ (unsigned)getAbTestMasterLocalSwitches
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-ab-test-master-local-switches");
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316162;
        uint64_t v11 = v4;
        __int16 v12 = 2080;
        int v13 = "+[GKSConnectivitySettings getAbTestMasterLocalSwitches]";
        __int16 v14 = 1024;
        int v15 = 1313;
        __int16 v16 = 2112;
        BOOL v17 = @"vc-ab-test-master-local-switches";
        __int16 v18 = 2112;
        __int16 v19 = v2;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Found storebag value '%@'=%@", (uint8_t *)&v10, 0x30u);
      }
    }
    return [v2 unsignedIntValue];
  }
  else
  {
    unsigned int v6 = 201326554;
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316162;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        int v13 = "+[GKSConnectivitySettings getAbTestMasterLocalSwitches]";
        __int16 v14 = 1024;
        int v15 = 1316;
        __int16 v16 = 2112;
        BOOL v17 = @"vc-ab-test-master-local-switches";
        __int16 v18 = 1024;
        LODWORD(v19) = 201326554;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Storebag does not have %@, using default value %d", (uint8_t *)&v10, 0x2Cu);
      }
    }
  }
  return v6;
}

+ (unsigned)getAbTestingState
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-ab-testing-state");
  if (v2)
  {
    double v3 = (void *)v2;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316162;
        uint64_t v11 = v4;
        __int16 v12 = 2080;
        int v13 = "+[GKSConnectivitySettings getAbTestingState]";
        __int16 v14 = 1024;
        int v15 = 1326;
        __int16 v16 = 2112;
        BOOL v17 = @"vc-ab-testing-state";
        __int16 v18 = 2112;
        __int16 v19 = v3;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Found storebag value '%@'=%@", (uint8_t *)&v10, 0x30u);
      }
    }
    return [v3 unsignedIntValue];
  }
  else
  {
    unsigned __int8 IntValueForKey = VCDefaults_GetIntValueForKey(@"abTestingState", 0);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316162;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        int v13 = "+[GKSConnectivitySettings getAbTestingState]";
        __int16 v14 = 1024;
        int v15 = 1330;
        __int16 v16 = 2112;
        BOOL v17 = @"vc-ab-testing-state";
        __int16 v18 = 1024;
        LODWORD(v19) = IntValueForKey;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Storebag does not have %@, using default value %d", (uint8_t *)&v10, 0x2Cu);
      }
    }
  }
  return IntValueForKey;
}

+ (id)getTestGroupPermutations:(unsigned __int8)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3 > 4u) {
    return &stru_1F3D3E450;
  }
  double v3 = off_1E6DB4D38[(char)a3];
  uint64_t v4 = off_1E6DB4D60[(char)a3];
  uint64_t v5 = (__CFString *)objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", v3);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v5)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136316162;
        uint64_t v13 = v7;
        __int16 v14 = 2080;
        int v15 = "+[GKSConnectivitySettings getTestGroupPermutations:]";
        __int16 v16 = 1024;
        int v17 = 1366;
        __int16 v18 = 2112;
        __int16 v19 = v3;
        __int16 v20 = 2112;
        __int16 v21 = v5;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Found storebag value '%@'=%@", (uint8_t *)&v12, 0x30u);
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      int v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136316162;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        int v15 = "+[GKSConnectivitySettings getTestGroupPermutations:]";
        __int16 v16 = 1024;
        int v17 = 1369;
        __int16 v18 = 2112;
        __int16 v19 = v3;
        __int16 v20 = 2112;
        __int16 v21 = v4;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Storebag does not have %@, using default value %@", (uint8_t *)&v12, 0x30u);
      }
    }
    return v4;
  }
  return v5;
}

+ (double)getRemoteMediaStallTimeout
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [+[VCDefaults sharedInstance] remoteMediaStallTimeout];
  double v3 = v2;
  uint64_t v4 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-remote-media-stall-timeout");
  if (v4)
  {
    [v4 doubleValue];
    double v3 = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136316162;
        uint64_t v12 = v6;
        __int16 v13 = 2080;
        __int16 v14 = "+[GKSConnectivitySettings getRemoteMediaStallTimeout]";
        __int16 v15 = 1024;
        int v16 = 1382;
        __int16 v17 = 2112;
        __int16 v18 = @"vc-remote-media-stall-timeout";
        __int16 v19 = 2112;
        uint64_t v20 = [NSNumber numberWithDouble:v3];
        uint64_t v8 = " [%s] %s:%d storebag value for '%@' is '%@'";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0x30u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136316162;
      uint64_t v12 = v9;
      __int16 v13 = 2080;
      __int16 v14 = "+[GKSConnectivitySettings getRemoteMediaStallTimeout]";
      __int16 v15 = 1024;
      int v16 = 1384;
      __int16 v17 = 2112;
      __int16 v18 = @"vc-remote-media-stall-timeout";
      __int16 v19 = 2112;
      uint64_t v20 = [NSNumber numberWithDouble:v3];
      uint64_t v8 = " [%s] %s:%d storebag does not have '%@', default value '%@' selected";
      goto LABEL_8;
    }
  }
  return v3;
}

+ (double)getNoRemoteDuplicationThresholdFast
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v2 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", @"vc-no-remote-duplication-threshold-fast");
  if (v2)
  {
    [v2 doubleValue];
    double v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316162;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getNoRemoteDuplicationThresholdFast]";
        __int16 v14 = 1024;
        int v15 = 1398;
        __int16 v16 = 2112;
        __int16 v17 = @"vc-no-remote-duplication-threshold-fast";
        __int16 v18 = 2112;
        uint64_t v19 = [NSNumber numberWithDouble:v4];
        uint64_t v7 = " [%s] %s:%d storebag value for '%@' is '%@'";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x30u);
      }
    }
  }
  else
  {
    double v4 = 4.0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316162;
        uint64_t v11 = v8;
        __int16 v12 = 2080;
        __int16 v13 = "+[GKSConnectivitySettings getNoRemoteDuplicationThresholdFast]";
        __int16 v14 = 1024;
        int v15 = 1400;
        __int16 v16 = 2112;
        __int16 v17 = @"vc-no-remote-duplication-threshold-fast";
        __int16 v18 = 2112;
        uint64_t v19 = [NSNumber numberWithDouble:4.0];
        uint64_t v7 = " [%s] %s:%d storebag does not have '%@', default value '%@' selected";
        goto LABEL_8;
      }
    }
  }
  return v4;
}

+ (id)getVCRCSeverBagConfigWithKey:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v4 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", a3);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136316162;
        uint64_t v15 = v6;
        __int16 v16 = 2080;
        __int16 v17 = "+[GKSConnectivitySettings getVCRCSeverBagConfigWithKey:]";
        __int16 v18 = 1024;
        int v19 = 1411;
        __int16 v20 = 2112;
        id v21 = a3;
        __int16 v22 = 2112;
        uint64_t v23 = v4;
        uint64_t v8 = " [%s] %s:%d storebag map value for '%@' is '%@'";
        uint64_t v9 = v7;
        uint32_t v10 = 48;
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, v10);
      }
    }
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    __int16 v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315906;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      __int16 v17 = "+[GKSConnectivitySettings getVCRCSeverBagConfigWithKey:]";
      __int16 v18 = 1024;
      int v19 = 1413;
      __int16 v20 = 2112;
      id v21 = a3;
      uint64_t v8 = " [%s] %s:%d storebag does not have '%@'";
      uint64_t v9 = v12;
      uint32_t v10 = 38;
      goto LABEL_8;
    }
  }
  return v4;
}

+ (id)getStorebagValueForStorebagKey:(id)a3 userDefaultKey:(__CFString *)a4 defaultValue:(id)a5 isDoubleType:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint32_t v10 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", a3);
  uint64_t v11 = v10;
  if (v10) {
    a5 = v10;
  }
  if (a4)
  {
    __int16 v12 = NSNumber;
    if (v6)
    {
      [a5 doubleValue];
      +[VCDefaults getDoubleValueForKey:defaultValue:](VCDefaults, "getDoubleValueForKey:defaultValue:", a4);
      __int16 v13 = objc_msgSend(v12, "numberWithDouble:");
    }
    else
    {
      __int16 v13 = objc_msgSend(NSNumber, "numberWithLong:", +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", a4, (int)objc_msgSend(a5, "intValue")));
    }
    a5 = v13;
  }
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v11)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136316418;
        uint64_t v24 = v15;
        __int16 v25 = 2080;
        double v26 = "+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:]";
        __int16 v27 = 1024;
        int v28 = 1435;
        __int16 v29 = 2112;
        id v30 = a3;
        __int16 v31 = 2112;
        id v32 = v11;
        __int16 v33 = 2112;
        id v34 = a5;
        __int16 v17 = " [%s] %s:%d Found storebag value '%@'=%@, using %@";
        __int16 v18 = v16;
        uint32_t v19 = 58;
LABEL_15:
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v23, v19);
      }
    }
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    id v21 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136316162;
      uint64_t v24 = v20;
      __int16 v25 = 2080;
      double v26 = "+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:]";
      __int16 v27 = 1024;
      int v28 = 1437;
      __int16 v29 = 2112;
      id v30 = a3;
      __int16 v31 = 2112;
      id v32 = a5;
      __int16 v17 = " [%s] %s:%d Storebag does not have %@, using %@";
      __int16 v18 = v21;
      uint32_t v19 = 48;
      goto LABEL_15;
    }
  }
  return a5;
}

+ (BOOL)isFeatureEnabledForStorebagKey:(id)a3 userDefaultKey:(__CFString *)a4 featureFlagDomain:(char *)a5 featureFlagName:(char *)a6
{
  double v11 = (double)arc4random() / 4294967300.0;

  return [a1 isFeatureEnabledForStorebagKey:a3 userDefaultKey:a4 featureFlagDomain:a5 featureFlagName:a6 normalizedRandom:v11];
}

+ (BOOL)isFeatureDisabledByExceptionKey:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  double v4 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", a3);
  if (v4)
  {
    uint64_t v5 = v4;
    BOOL v6 = (void *)[v4 componentsSeparatedByString:@","];
    uint64_t v7 = (void *)MGGetStringAnswer();
    uint64_t v8 = v7;
    if (v7)
    {
      if (([v7 isEqualToString:&stru_1F3D3E450] & 1) == 0)
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v9 = [v6 countByEnumeratingWithState:&v32 objects:v31 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v33;
          while (2)
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v33 != v11) {
                objc_enumerationMutation(v6);
              }
              if ([*(id *)(*((void *)&v32 + 1) + 8 * i) isEqualToString:v8])
              {
                if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                {
                  BOOL v13 = 1;
                }
                else
                {
                  uint64_t v15 = VRTraceErrorLogLevelToCSTR();
                  __int16 v16 = *MEMORY[0x1E4F47A50];
                  BOOL v13 = 1;
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                  {
                    int v17 = 136316674;
                    uint64_t v18 = v15;
                    __int16 v19 = 2080;
                    uint64_t v20 = "+[GKSConnectivitySettings isFeatureDisabledByExceptionKey:]";
                    __int16 v21 = 1024;
                    int v22 = 1464;
                    __int16 v23 = 2112;
                    id v24 = a3;
                    __int16 v25 = 2112;
                    double v26 = v5;
                    __int16 v27 = 2112;
                    int v28 = v8;
                    __int16 v29 = 1024;
                    int v30 = 1;
                    _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Found storebag exception value '%@'=%@, deviceCode=%@ isDisabled=%d", (uint8_t *)&v17, 0x40u);
                  }
                }
                goto LABEL_13;
              }
            }
            uint64_t v10 = [v6 countByEnumeratingWithState:&v32 objects:v31 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

+ (BOOL)isFeatureEnabledForStorebagKey:(id)a3 exceptionKey:(id)a4 userDefaultKey:(__CFString *)a5 featureFlagDomain:(char *)a6 featureFlagName:(char *)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  unsigned int v13 = arc4random();
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(a5, @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  uint64_t v15 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", a3);
  if (keyExistsAndHasValidFormat)
  {
    LOBYTE(v13) = AppBooleanValue != 0;
    return v13;
  }
  __int16 v16 = (void *)v15;
  if ([a1 isFeatureDisabledByExceptionKey:a4])
  {
    LOBYTE(v13) = 0;
    return v13;
  }
  if (v16)
  {
    double v17 = (double)v13 / 4294967300.0;
    [v16 doubleValue];
    double v19 = v18;
    LOBYTE(v13) = v17 < v18;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      __int16 v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v29 = v20;
        __int16 v30 = 2080;
        __int16 v31 = "+[GKSConnectivitySettings isFeatureEnabledForStorebagKey:exceptionKey:userDefaultKey:featureFlagDomain:featureFlagName:]";
        __int16 v32 = 1024;
        int v33 = 1489;
        __int16 v34 = 2112;
        id v35 = a3;
        __int16 v36 = 2112;
        BOOL v37 = (char *)v16;
        __int16 v38 = 1024;
        *(_DWORD *)__int16 v39 = v17 < v19;
        *(_WORD *)&v39[4] = 2048;
        *(double *)&v39[6] = v17;
        int v22 = " [%s] %s:%d Found storebag value '%@'=%@, result=%d, normalizedRandom=%1.4f";
        __int16 v23 = v21;
LABEL_10:
        _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, 0x40u);
      }
    }
  }
  else
  {
    unsigned int v13 = _os_feature_enabled_impl();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      __int16 v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v29 = v24;
        __int16 v30 = 2080;
        __int16 v31 = "+[GKSConnectivitySettings isFeatureEnabledForStorebagKey:exceptionKey:userDefaultKey:featureFlagDomain:featureFlagName:]";
        __int16 v32 = 1024;
        int v33 = 1492;
        __int16 v34 = 2112;
        id v35 = a3;
        __int16 v36 = 2080;
        BOOL v37 = a6;
        __int16 v38 = 2080;
        *(void *)__int16 v39 = a7;
        *(_WORD *)&v39[8] = 1024;
        *(_DWORD *)&v39[10] = v13;
        int v22 = " [%s] %s:%d Storebag does not have %@, using feature flag domain=%s name=%s value=%d";
        __int16 v23 = v25;
        goto LABEL_10;
      }
    }
  }
  return v13;
}

+ (BOOL)isFeatureEnabledForStorebagKey:(id)a3 userDefaultKey:(__CFString *)a4 featureFlagDomain:(char *)a5 featureFlagName:(char *)a6 normalizedRandom:(double)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(a4, @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  uint64_t v12 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", a3);
  if (keyExistsAndHasValidFormat) {
    return AppBooleanValue == 1;
  }
  int v14 = (void *)v12;
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  if (v14)
  {
    [v14 doubleValue];
    double v16 = v15;
    BOOL v13 = v15 > a7;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      double v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v26 = v17;
        __int16 v27 = 2080;
        int v28 = "+[GKSConnectivitySettings isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:"
              "normalizedRandom:]";
        __int16 v29 = 1024;
        int v30 = 1513;
        __int16 v31 = 2112;
        id v32 = a3;
        __int16 v33 = 2112;
        __int16 v34 = (char *)v14;
        __int16 v35 = 1024;
        *(_DWORD *)__int16 v36 = v16 > a7;
        *(_WORD *)&v36[4] = 2048;
        *(double *)&v36[6] = a7;
        double v19 = " [%s] %s:%d Found storebag value '%@'=%@, result=%d, normalizedRandom=%1.4f";
        uint64_t v20 = v18;
LABEL_12:
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, 0x40u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 1;
    }
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    int v22 = *MEMORY[0x1E4F47A50];
    BOOL v13 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v26 = v21;
      __int16 v27 = 2080;
      int v28 = "+[GKSConnectivitySettings isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:no"
            "rmalizedRandom:]";
      __int16 v29 = 1024;
      int v30 = 1515;
      __int16 v31 = 2112;
      id v32 = a3;
      __int16 v33 = 2080;
      __int16 v34 = a5;
      __int16 v35 = 2080;
      *(void *)__int16 v36 = a6;
      *(_WORD *)&v36[8] = 1024;
      *(_DWORD *)&v36[10] = 1;
      double v19 = " [%s] %s:%d Storebag does not have %@, using feature flag domain=%s name=%s value=%d";
      uint64_t v20 = v22;
      goto LABEL_12;
    }
  }
  return v13;
}

+ (id)getStorebagValueStorebagKey:(id)a3 defaultValue:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend(+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings"), "objectForKeyedSubscript:", a3);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v6)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316162;
        uint64_t v14 = v8;
        __int16 v15 = 2080;
        double v16 = "+[GKSConnectivitySettings getStorebagValueStorebagKey:defaultValue:]";
        __int16 v17 = 1024;
        int v18 = 1527;
        __int16 v19 = 2112;
        id v20 = a3;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Found storebag value '%@'=%@", (uint8_t *)&v13, 0x30u);
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316162;
        uint64_t v14 = v10;
        __int16 v15 = 2080;
        double v16 = "+[GKSConnectivitySettings getStorebagValueStorebagKey:defaultValue:]";
        __int16 v17 = 1024;
        int v18 = 1530;
        __int16 v19 = 2112;
        id v20 = a3;
        __int16 v21 = 2112;
        id v22 = a4;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Storebag does not have %@, using %@", (uint8_t *)&v13, 0x30u);
      }
    }
    return a4;
  }
  return v6;
}

- (GKSConnectivitySettings)init
{
  return 0;
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = self;
  v2.super_class = (Class)GKSConnectivitySettings;
  [(GKSConnectivitySettings *)&v2 dealloc];
}

+ (void)getAdaptiveLearningState
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  double v4 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
  __int16 v5 = 1024;
  int v6 = 856;
  __int16 v7 = v0;
  uint64_t v8 = "+[GKSConnectivitySettings getAdaptiveLearningState]";
  __int16 v9 = 1024;
  int v10 = v1;
  _os_log_debug_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %s: Read key 'useAdaptiveLearningForFaceTime' from user defaults: %d", v3, 0x2Cu);
}

@end