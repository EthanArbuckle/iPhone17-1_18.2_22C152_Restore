@interface GKNATObserverInternal
- (BOOL)ensureNatCachePathExists;
- (GKNATObserverInternal)init;
- (GKNATObserverInternal)initWithOptions:(id)a3;
- (id)copyNatTypeCachePlistScheme;
- (id)copyNatTypeCache_OSXGamedScheme;
- (id)delegate;
- (id)lookupCachedNATFlagsForNetwork:(id)a3;
- (id)nameForNetworkWithIPPort:(tagIPPORT *)a3 interfaceName:(id)a4;
- (int)callHTTPTestFromIPPort:(tagIPPORT *)a3 ipv6Prefix:(id *)a4 ToServer:(id)a5 isSSL:(BOOL)a6;
- (int)currentNATType;
- (int)natTypeForCommNATFlags:(unsigned int)a3 isCarrier:(BOOL)a4;
- (tagCommNATInfo)callCommNATTestFromIPPort:(tagIPPORT *)a3 ipv6Prefix:(id *)a4;
- (unsigned)setCommNATFlags:(unsigned int)a3 forInterface:(id)a4 isCached:(BOOL)a5;
- (unsigned)setFlags:(unsigned int)a3 forInterface:(id)a4 isCached:(BOOL)a5 isCachedKey:(id)a6 mask:(unsigned int)a7;
- (unsigned)setSSLFlags:(unsigned int)a3 forInterface:(id)a4 isCached:(BOOL)a5;
- (unsigned)setTCPFlags:(unsigned int)a3 forInterface:(id)a4 isCached:(BOOL)a5;
- (void)HTTPCheckWithIPPort:(tagIPPORT *)a3 ipv6Prefix:(id *)a4 useCache:(BOOL)a5;
- (void)HTTPSCheckWithIPPort:(tagIPPORT *)a3 ipv6Prefix:(id *)a4 useCache:(BOOL)a5;
- (void)NATCheckWithIPPort:(tagIPPORT *)a3 ipv6Prefix:(id *)a4 useCache:(BOOL)a5;
- (void)cacheNATFlags:(id)a3 forNetwork:(id)a4;
- (void)calculateSummmaryNATType:(int *)a3 andCarrierNATType:(int *)a4 andNonCarrierNATType:(int *)a5 copyInterfaceInfoDictionary:(id *)a6;
- (void)clearRetries;
- (void)dealloc;
- (void)registerForNetworkChanges;
- (void)release;
- (void)reportNATType;
- (void)setDelegate:(id)a3;
- (void)shouldTryNATCheck;
- (void)tryNATCheckWithDelay:(double)a3;
- (void)updateNatTypeCache_CachePlistScheme:(id)a3;
- (void)updateNatTypeCache_OSXGamedScheme:(id)a3;
@end

@implementation GKNATObserverInternal

- (GKNATObserverInternal)init
{
  return [(GKNATObserverInternal *)self initWithOptions:0];
}

- (GKNATObserverInternal)initWithOptions:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)GKNATObserverInternal;
  v4 = [(GKNATObserverInternal *)&v16 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create((const char *)objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"com.apple.gamekitservices.GKNATObserver.%p.natCheckQueue", v4), "UTF8String"), 0);
    v4->_natCheckQueue = (OS_dispatch_queue *)v5;
    if (!v5
      || (dispatch_queue_t v6 = dispatch_queue_create((const char *)objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"com.apple.gamekitservices.GKNATObserver.%p.reportNATQueue", v4), "UTF8String"), 0), (v4->_reportNATQueue = (OS_dispatch_queue *)v6) == 0)|| (v7 = dispatch_group_create(), (v4->_natCheckGroup = (OS_dispatch_group *)v7) == 0)|| (v8 = dispatch_semaphore_create(1), (v4->_natCheckNetNameSema = (OS_dispatch_semaphore *)v8) == 0))
    {

      return 0;
    }
    if ([a3 objectForKeyedSubscript:@"nonCarrier"]) {
      v4->_nonCarrierInterfacesOnly = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"nonCarrier"), "BOOLValue");
    }
    if ([a3 objectForKeyedSubscript:@"checkTCPSSL"]) {
      v4->_checkTCPAndSSL = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"checkTCPSSL"), "BOOLValue");
    }
    if ([a3 objectForKeyedSubscript:@"favorNonCar"]) {
      v4->_favorNonCarrier = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"favorNonCar"), "BOOLValue");
    }
    if ([a3 objectForKeyedSubscript:@"carrierType"]) {
      v4->_newCarrierType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"carrierType"), "BOOLValue");
    }
    if ([a3 objectForKeyedSubscript:@"addInRange"]) {
      v4->_addInRangeFlag = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"addInRange"), "BOOLValue");
    }
    if ([a3 objectForKeyedSubscript:@"addCarrier"]) {
      v4->_addCarrierFlag = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"addCarrier"), "BOOLValue");
    }
    if ([a3 objectForKeyedSubscript:@"ignoreCache"]) {
      v4->_ignoreNatTypeCache = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"ignoreCache"), "BOOLValue");
    }
    if ([a3 objectForKeyedSubscript:@"ignoreCarrierBundle"]) {
      v4->_ignoreCarrierBundle = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"ignoreCarrierBundle"), "BOOLValue");
    }
    v4->_interfaceInfoDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_currentNetworkNames = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_lastReportedNATType = -1;
    v4->_xNATCheck = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    v4->_hasNATCheckStarted = 0;
    v4->_hasNATCheckEnded = 0;
    [(GKNATObserverInternal *)v4 registerForNetworkChanges];
    v9 = objc_opt_class();
    objc_sync_enter(v9);
    if (!cachedNATTypeDictionary)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E4F47A50];
        v12 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v18 = v10;
            __int16 v19 = 2080;
            v20 = "-[GKNATObserverInternal initWithOptions:]";
            __int16 v21 = 1024;
            int v22 = 357;
            _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: no NAT cache available, running NAT check", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          -[GKNATObserverInternal initWithOptions:]();
        }
      }
      [(GKNATObserverInternal *)v4 tryNATCheckWithDelay:0.0];
    }
    objc_sync_exit(v9);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v18 = v13;
      __int16 v19 = 2080;
      v20 = "-[GKNATObserverInternal initWithOptions:]";
      __int16 v21 = 1024;
      int v22 = 363;
      __int16 v23 = 2048;
      v24 = v4;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserverInternal(%p) -init", buf, 0x26u);
    }
  }
  return v4;
}

- (void)release
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  sccontext = self->_sccontext;
  objc_sync_enter(sccontext);
  v4.receiver = self;
  v4.super_class = (Class)GKNATObserverInternal;
  [(GKNATObserverInternal *)&v4 release];
  objc_sync_exit(sccontext);
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    objc_super v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      v9 = "-[GKNATObserverInternal dealloc]";
      __int16 v10 = 1024;
      int v11 = 377;
      __int16 v12 = 2048;
      uint64_t v13 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserverInternal(%p) -dealloc", buf, 0x26u);
    }
  }
  VCNAT64ResolverDeregisterAll(self);
  [(GKNATObserver_SCContext *)self->_sccontext setObserver:0];

  [(GKNATObserverInternal *)self setDelegate:0];
  objc_storeWeak(&self->_delegate, 0);

  dispatch_release((dispatch_object_t)self->_natCheckQueue);
  dispatch_release((dispatch_object_t)self->_reportNATQueue);
  dispatch_release((dispatch_object_t)self->_natCheckGroup);
  dispatch_release((dispatch_object_t)self->_natCheckNetNameSema);
  v5.receiver = self;
  v5.super_class = (Class)GKNATObserverInternal;
  [(GKNATObserverInternal *)&v5 dealloc];
}

- (int)natTypeForCommNATFlags:(unsigned int)a3 isCarrier:(BOOL)a4
{
  if (!a3)
  {
    int v4 = 0;
    goto LABEL_26;
  }
  if (a3)
  {
    int v4 = 6;
    if ((a3 & 0x800) != 0) {
      int v5 = 5;
    }
    else {
      int v5 = 4;
    }
    BOOL v6 = (a3 & 0x1000) == 0;
  }
  else
  {
    if (a4 && self->_newCarrierType && !self->_addCarrierFlag)
    {
      int v4 = 128;
      if ((a3 & 0x2000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_19;
    }
    int v4 = 1;
    if ((a3 & 4) != 0) {
      int v5 = 3;
    }
    else {
      int v5 = 2;
    }
    BOOL v6 = (a3 & 2) == 0;
  }
  if (v6) {
    int v4 = v5;
  }
  if ((a3 & 0x2000) != 0)
  {
LABEL_19:
    if (a4 && self->_addCarrierFlag) {
      int v4 = 4;
    }
  }
LABEL_22:
  if ((a3 & 0x10) == 0 || !self->_addInRangeFlag)
  {
LABEL_26:
    int v7 = 0;
    if (!a4) {
      return v4 + v7;
    }
    goto LABEL_27;
  }
  int v7 = 64;
  if (!a4) {
    return v4 + v7;
  }
LABEL_27:
  if (self->_addCarrierFlag)
  {
    v4 += 128;
  }
  else if (self->_newCarrierType)
  {
    int v4 = 128;
  }
  return v4 + v7;
}

- (unsigned)setFlags:(unsigned int)a3 forInterface:(id)a4 isCached:(BOOL)a5 isCachedKey:(id)a6 mask:(unsigned int)a7
{
  BOOL v9 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = (void *)[(NSMutableDictionary *)self->_interfaceInfoDictionary objectForKeyedSubscript:a4];
  if (!v13)
  {
    uint64_t v13 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)self->_interfaceInfoDictionary setObject:v13 forKeyedSubscript:a4];
    uint64_t v14 = NSNumber;
    if ([a4 hasPrefix:@"gk_ci_"]) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = 2;
    }
    objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(v14, "numberWithInt:", v15), @"interfaceType");
  }
  int v16 = objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", @"commnatFlags"), "unsignedLongValue");
  objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v16 & ~a7 | a7 & a3), @"commnatFlags");
  objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v9), a6);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    uint64_t v18 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136316930;
      uint64_t v21 = v17;
      __int16 v22 = 2080;
      __int16 v23 = "-[GKNATObserverInternal setFlags:forInterface:isCached:isCachedKey:mask:]";
      __int16 v24 = 1024;
      int v25 = 467;
      __int16 v26 = 1024;
      unsigned int v27 = a3;
      __int16 v28 = 1024;
      unsigned int v29 = a7;
      __int16 v30 = 1024;
      int v31 = v16;
      __int16 v32 = 1024;
      unsigned int v33 = v16 & ~a7 | a7 & a3;
      __int16 v34 = 1024;
      BOOL v35 = v9;
      _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver setting flags[%08X] mask[%08X] old[%08X]=>result[%08X] (cached:%d)", (uint8_t *)&v20, 0x3Au);
    }
  }
  return v16 & ~a7 | a7 & a3;
}

- (unsigned)setCommNATFlags:(unsigned int)a3 forInterface:(id)a4 isCached:(BOOL)a5
{
  return [(GKNATObserverInternal *)self setFlags:*(void *)&a3 forInterface:a4 isCached:a5 isCachedKey:@"commnatCached" mask:10239];
}

- (unsigned)setTCPFlags:(unsigned int)a3 forInterface:(id)a4 isCached:(BOOL)a5
{
  return [(GKNATObserverInternal *)self setFlags:*(void *)&a3 forInterface:a4 isCached:a5 isCachedKey:@"tcpCached" mask:2048];
}

- (unsigned)setSSLFlags:(unsigned int)a3 forInterface:(id)a4 isCached:(BOOL)a5
{
  return [(GKNATObserverInternal *)self setFlags:*(void *)&a3 forInterface:a4 isCached:a5 isCachedKey:@"sslCached" mask:4096];
}

- (void)calculateSummmaryNATType:(int *)a3 andCarrierNATType:(int *)a4 andNonCarrierNATType:(int *)a5 copyInterfaceInfoDictionary:(id *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obj = self->_interfaceInfoDictionary;
  uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v33 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unsigned int v9 = 0;
    unsigned int v10 = 0;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v14 = [(NSMutableDictionary *)self->_interfaceInfoDictionary objectForKeyedSubscript:v13];
        if (v14)
        {
          uint64_t v15 = (void *)v14;
          int v16 = [v13 hasPrefix:@"gk_ci_"];
          unsigned int v17 = -[GKNATObserverInternal natTypeForCommNATFlags:isCarrier:](self, "natTypeForCommNATFlags:isCarrier:", objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"commnatFlags"), "unsignedLongValue"), objc_msgSend(v13, "hasPrefix:", @"gk_ci_"));
          if (v16) {
            unsigned int v18 = v9;
          }
          else {
            unsigned int v18 = v10;
          }
          unsigned int v19 = v17 - 128;
          if (v17 <= 0x7F) {
            unsigned int v19 = v17;
          }
          if (v18 > 0x7F) {
            v18 -= 128;
          }
          if (v19)
          {
            if (!v18 || v19 != 4 && (v18 != 4 ? (BOOL v20 = v19 >= v18) : (BOOL v20 = 0), !v20))
            {
              if (v16) {
                unsigned int v9 = v17;
              }
              else {
                unsigned int v10 = v17;
              }
            }
          }
        }
      }
      uint64_t v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v33 objects:v32 count:16];
    }
    while (v8);
  }
  else
  {
    unsigned int v9 = 0;
    unsigned int v10 = 0;
  }
  BOOL v22 = !self->_favorNonCarrier || v10 == 0 || v10 == 4;
  int v23 = v10;
  if (v22)
  {
    unsigned int v24 = v9 <= 0x7F ? v9 : v9 - 128;
    unsigned int v25 = v10 <= 0x7F ? v10 : v10 - 128;
    int v23 = v10;
    if (v24)
    {
      if (!v25 || (int v23 = v10, v24 != 4) && (v24 >= v25 ? (v26 = v25 == 4) : (v26 = 1), int v23 = v10, v26)) {
        int v23 = v9;
      }
    }
  }
  if (a3) {
    *a3 = v23;
  }
  if (a4) {
    *a4 = v9;
  }
  if (a5) {
    *a5 = v10;
  }
  if (a6) {
    *a6 = (id)[(NSMutableDictionary *)self->_interfaceInfoDictionary copyGKSDeepMutable];
  }
}

- (int)currentNATType
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_xNATCheck lock];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      interfaceInfoDictionary = self->_interfaceInfoDictionary;
      if (interfaceInfoDictionary) {
        BOOL v6 = (const char *)objc_msgSend((id)-[NSMutableDictionary description](interfaceInfoDictionary, "description"), "UTF8String");
      }
      else {
        BOOL v6 = "<nil>";
      }
      int v8 = 136315906;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      uint64_t v11 = "-[GKNATObserverInternal currentNATType]";
      __int16 v12 = 1024;
      int v13 = 556;
      __int16 v14 = 2080;
      uint64_t v15 = v6;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver _commNATFlagDictionary = %s", (uint8_t *)&v8, 0x26u);
    }
  }
  int v8 = -1431655766;
  [(GKNATObserverInternal *)self calculateSummmaryNATType:&v8 andCarrierNATType:0 andNonCarrierNATType:0 copyInterfaceInfoDictionary:0];
  [(NSRecursiveLock *)self->_xNATCheck unlock];
  return v8;
}

- (void)shouldTryNATCheck
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d GKNATObserver: running NAT check from startConnection", v2, v3, v4, v5, v6);
}

- (void)reportNATType
{
  v3[5] = *MEMORY[0x1E4F143B8];
  reportNATQueue = self->_reportNATQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__GKNATObserverInternal_reportNATType__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(reportNATQueue, v3);
}

void __38__GKNATObserverInternal_reportNATType__block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  unsigned int v32 = -1431655766;
  unsigned int v33 = -1431655766;
  unsigned int v31 = -1431655766;
  id v30 = (id)0xAAAAAAAAAAAAAAAALL;
  uint64_t v2 = (id *)(a1 + 32);
  [*(id *)(*(void *)(a1 + 32) + 24) lock];
  [*v2 calculateSummmaryNATType:&v33 andCarrierNATType:&v32 andNonCarrierNATType:&v31 copyInterfaceInfoDictionary:&v30];
  [*((id *)*v2 + 3) unlock];
  if (![*v2 delegate])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_40;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    int v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_40;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v35 = v12;
    __int16 v36 = 2080;
    uint64_t v37 = "-[GKNATObserverInternal reportNATType]_block_invoke";
    __int16 v38 = 1024;
    int v39 = 640;
    __int16 v40 = 1024;
    *(_DWORD *)v41 = v33;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v32;
    __int16 v42 = 1024;
    unsigned int v43 = v31;
    __int16 v14 = " [%s] %s:%d GKNATObserver cannot report NAT Type %d (%d/%d), delegate is nil!";
LABEL_19:
    _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x2Eu);
    goto LABEL_40;
  }
  [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = [NSNumber numberWithUnsignedInt:v33];
    uint64_t v5 = [NSNumber numberWithUnsignedInt:v32];
    uint64_t v6 = [NSNumber numberWithUnsignedInt:v31];
    uint64_t v7 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"summaryType", v5, @"carrierType", v6, @"nonCarrierType", v30, @"ifDictionary", 0);
    int v8 = objc_opt_class();
    objc_sync_enter(v8);
    uint64_t v9 = (void *)cachedNATTypeDictionary;
    if (*(unsigned char *)(*(void *)(a1 + 32) + 137))
    {
      cachedNATTypeDictionary = v7;

      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v35 = v10;
          __int16 v36 = 2080;
          uint64_t v37 = "-[GKNATObserverInternal reportNATType]_block_invoke";
          __int16 v38 = 1024;
          int v39 = 599;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: updating cache with new NAT dict", buf, 0x1Cu);
        }
      }
    }
    else if (cachedNATTypeDictionary)
    {
      id v20 = (id)cachedNATTypeDictionary;

      unsigned int v33 = objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", @"summaryType"), "unsignedLongValue");
      unsigned int v32 = objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", @"carrierType"), "unsignedLongValue");
      unsigned int v31 = objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", @"nonCarrierType"), "unsignedLongValue");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        BOOL v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v35 = v21;
          __int16 v36 = 2080;
          uint64_t v37 = "-[GKNATObserverInternal reportNATType]_block_invoke";
          __int16 v38 = 1024;
          int v39 = 610;
          _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: using cached NAT dict", buf, 0x1Cu);
        }
      }
      uint64_t v7 = v20;
    }
    objc_sync_exit(v8);
    int v23 = *(_DWORD **)(a1 + 32);
    if (v23[8] == v33 && v23[9] == v32 && v23[10] == v31)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        unsigned int v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          if (v7) {
            BOOL v26 = (const char *)objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
          }
          else {
            BOOL v26 = "<nil>";
          }
          *(_DWORD *)buf = 136315906;
          uint64_t v35 = v24;
          __int16 v36 = 2080;
          uint64_t v37 = "-[GKNATObserverInternal reportNATType]_block_invoke";
          __int16 v38 = 1024;
          int v39 = 624;
          __int16 v40 = 2080;
          *(void *)v41 = v26;
          _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver not reporting NAT Type dictionary [%s] - no change", buf, 0x26u);
        }
      }
    }
    else
    {
      v23[8] = v33;
      *(_DWORD *)(*(void *)(a1 + 32) + 36) = v32;
      *(_DWORD *)(*(void *)(a1 + 32) + 40) = v31;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v27 = VRTraceErrorLogLevelToCSTR();
        __int16 v28 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          if (v7) {
            unsigned int v29 = (const char *)objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
          }
          else {
            unsigned int v29 = "<nil>";
          }
          *(_DWORD *)buf = 136315906;
          uint64_t v35 = v27;
          __int16 v36 = 2080;
          uint64_t v37 = "-[GKNATObserverInternal reportNATType]_block_invoke";
          __int16 v38 = 1024;
          int v39 = 621;
          __int16 v40 = 2080;
          *(void *)v41 = v29;
          _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver reporting NAT Type dictionary [%s]", buf, 0x26u);
        }
      }
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "NATTypeDictionaryUpdated:", v7);
    }

    goto LABEL_40;
  }
  [*(id *)(a1 + 32) delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_40;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    int v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_40;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v35 = v19;
    __int16 v36 = 2080;
    uint64_t v37 = "-[GKNATObserverInternal reportNATType]_block_invoke";
    __int16 v38 = 1024;
    int v39 = 637;
    __int16 v40 = 1024;
    *(_DWORD *)v41 = v33;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v32;
    __int16 v42 = 1024;
    unsigned int v43 = v31;
    __int16 v14 = " [%s] %s:%d GKNATObserver cannot report NAT Type %d (%d/%d), delegate does not respond to callbacks!";
    goto LABEL_19;
  }
  unsigned int v15 = [*(id *)(a1 + 32) currentNATType];
  unsigned int v33 = v15;
  if (*(_DWORD *)(*(void *)(a1 + 32) + 32) != v15)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 32) = v15;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      unsigned int v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v35 = v16;
        __int16 v36 = 2080;
        uint64_t v37 = "-[GKNATObserverInternal reportNATType]_block_invoke";
        __int16 v38 = 1024;
        int v39 = 633;
        __int16 v40 = 1024;
        *(_DWORD *)v41 = v33;
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver reporting NAT Type %d", buf, 0x22u);
      }
    }
    unsigned int v18 = (void *)[*(id *)(a1 + 32) delegate];
    [v18 NATTypeDidChange:v33];
  }
LABEL_40:
}

- (void)setDelegate:(id)a3
{
  objc_sync_enter(self);
  if (!a3 || [(GKNATObserverInternal *)self delegate] != a3)
  {
    objc_storeWeak(&self->_delegate, a3);
    id v5 = [(GKNATObserverInternal *)self delegate];
    dynamicStore = self->_dynamicStore;
    if (v5)
    {
      if (!dynamicStore) {
        [(GKNATObserverInternal *)self registerForNetworkChanges];
      }
      self->_lastReportedNATType = -1;
      [(GKNATObserverInternal *)self reportNATType];
    }
    else if (dynamicStore)
    {
      SCDynamicStoreSetDispatchQueue(dynamicStore, 0);
      uint64_t v7 = self->_dynamicStore;
      if (v7)
      {
        CFRelease(v7);
        self->_dynamicStore = 0;
      }
    }
  }

  objc_sync_exit(self);
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (tagCommNATInfo)callCommNATTestFromIPPort:(tagIPPORT *)a3 ipv6Prefix:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  dwIPuint64_t v4 = InterpretAddressX();
  socklen_t v5 = InterpretAddressX();
  uint64_t v6 = +[GKSConnectivitySettings getIPPortForService:@"gk-commnat-main0-name"];
  if (!v6) {
    uint64_t v6 = +[GKSConnectivitySettings getIPPortForService:@"gk-commnat-main0"];
  }
  uint64_t v7 = +[GKSConnectivitySettings getIPPortForService:@"gk-commnat-main1-name", a4, a3];
  if (!v7) {
    uint64_t v7 = +[GKSConnectivitySettings getIPPortForService:@"gk-commnat-main1"];
  }
  int v8 = +[GKSConnectivitySettings getIPPortForService:@"gk-commnat-cohort-name"];
  if (!v8) {
    int v8 = +[GKSConnectivitySettings getIPPortForService:@"gk-commnat-cohort"];
  }
  objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", @"gk-p2p-nat-type-timeout"), "doubleValue");
  double v10 = v9;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v10 <= 0.0)
  {
    double v10 = 10.0;
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      int v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v35 = v15;
        __int16 v36 = 2080;
        uint64_t v37 = "-[GKNATObserverInternal callCommNATTestFromIPPort:ipv6Prefix:]";
        __int16 v38 = 1024;
        int v39 = 705;
        __int16 v40 = 2048;
        *(void *)v41 = 0x4024000000000000;
        __int16 v14 = " [%s] %s:%d natchecktimeout using default: %lf";
        goto LABEL_14;
      }
    }
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    int v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v35 = v12;
      __int16 v36 = 2080;
      uint64_t v37 = "-[GKNATObserverInternal callCommNATTestFromIPPort:ipv6Prefix:]";
      __int16 v38 = 1024;
      int v39 = 707;
      __int16 v40 = 2048;
      *(double *)v41 = v10;
      __int16 v14 = " [%s] %s:%d natchecktimeout set to %lf from bag";
LABEL_14:
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x26u);
    }
  }
  uint64_t v16 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  unsigned int v17 = (void *)[v16 objectForKey:@"CommNATMainIP"];
  unsigned int v18 = (void *)[v16 objectForKey:@"CommNATMainPort0"];
  uint64_t v19 = (void *)[v16 objectForKey:@"CommNATMainPort1"];
  id v20 = (void *)[v16 objectForKey:@"CommNATCohortIP"];
  uint64_t v21 = (void *)[v16 objectForKey:@"CommNATCohortPort0"];
  if (!v17)
  {
    if (v6)
    {
      dwIPuint64_t v4 = v6->IP.dwIPv4;
      if (!v18) {
        goto LABEL_20;
      }
    }
    else if (!v18)
    {
LABEL_27:
      unsigned __int16 wPort = 16385;
      if (!v19) {
        goto LABEL_28;
      }
LABEL_25:
      unsigned __int16 v23 = [v19 integerValue];
      if (v20) {
        goto LABEL_30;
      }
      goto LABEL_33;
    }
LABEL_24:
    unsigned __int16 wPort = [v18 integerValue];
    if (!v19) {
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  [v17 UTF8String];
  dwIPuint64_t v4 = InterpretAddressX();
  if (v18) {
    goto LABEL_24;
  }
LABEL_20:
  if (!v6) {
    goto LABEL_27;
  }
  unsigned __int16 wPort = v6->wPort;
  if (v19) {
    goto LABEL_25;
  }
LABEL_28:
  if (v7)
  {
    unsigned __int16 v23 = v7->wPort;
    if (v20) {
      goto LABEL_30;
    }
  }
  else
  {
    unsigned __int16 v23 = 16386;
    if (v20)
    {
LABEL_30:
      [v20 UTF8String];
      socklen_t v5 = InterpretAddressX();
      if (!v21) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
  }
LABEL_33:
  if (v8)
  {
    socklen_t v5 = v8->IP.dwIPv4;
    if (!v21) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  if (v21) {
LABEL_37:
  }
    [v21 integerValue];
LABEL_38:
  free(v6);
  free(v7);
  free(v8);
  double v24 = micro();
  unsigned int v25 = (tagCommNATInfo *)CommNAT_Test(v33, 0x4013u, dwIPv4, v10, wPort, v23, v5);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    uint64_t v27 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v25) {
        unsigned int var0 = v25->var0;
      }
      else {
        unsigned int var0 = 0;
      }
      double v29 = micro();
      *(_DWORD *)buf = 136316418;
      uint64_t v35 = v26;
      __int16 v36 = 2080;
      uint64_t v37 = "-[GKNATObserverInternal callCommNATTestFromIPPort:ipv6Prefix:]";
      __int16 v38 = 1024;
      int v39 = 750;
      __int16 v40 = 1024;
      *(_DWORD *)v41 = var0;
      *(_WORD *)&v41[4] = 2048;
      *(double *)&v41[6] = v29 - v24;
      __int16 v42 = 2080;
      unsigned int v43 = v33 + 1;
      _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d commnat_test: [%08X] after %0.6lfs (%s)", buf, 0x36u);
    }
  }
  return v25;
}

- (int)callHTTPTestFromIPPort:(tagIPPORT *)a3 ipv6Prefix:(id *)a4 ToServer:(id)a5 isSSL:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  *(void *)&v9.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v9.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  sockaddr v96 = v9;
  sockaddr v95 = v9;
  sockaddr v94 = v9;
  sockaddr v93 = v9;
  sockaddr v92 = v9;
  sockaddr v91 = v9;
  sockaddr v90 = v9;
  sockaddr v89 = v9;
  unsigned int v76 = -1431655766;
  objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", @"gk-p2p-nat-type-timeout"), "doubleValue");
  double v11 = v10;
  if (v10 <= 0.0)
  {
    double v11 = 10.0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      int v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 821;
        *(_WORD *)&buf[28] = 2048;
        *(void *)&buf[30] = 0x4024000000000000;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d natchecktimeout using default: %lf", buf, 0x26u);
      }
    }
  }
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFURLRef v15 = CFURLCreateWithString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)a5, 0);
  uint64_t v16 = (__CFString *)CFURLCopyHostName(v15);
  [(__CFString *)v16 UTF8String];
  unsigned int v76 = InterpretAddressX();
  SInt32 v17 = CFURLGetPortNumber(v15);
  if (v17 < 1)
  {
    if (v6) {
      unsigned __int16 v18 = 443;
    }
    else {
      unsigned __int16 v18 = 80;
    }
  }
  else
  {
    unsigned __int16 v18 = v17;
    CFStringRef v19 = CFStringCreateWithFormat(v14, 0, @"%@:%u", v16, (unsigned __int16)v17);
    CFRelease(v16);
    uint64_t v16 = (__CFString *)v19;
  }
  BOOL v20 = v6;
  uint64_t v21 = buf;
  memset(buf, 170, sizeof(buf));
  memset(__b, 170, sizeof(__b));
  BOOL v72 = v20;
  if (v20)
  {
    uint64_t v21 = (uint8_t *)&cSSLClientHello;
    uint64_t v22 = 51;
  }
  else
  {
    Request = CFHTTPMessageCreateRequest(v14, @"GET", v15, (CFStringRef)*MEMORY[0x1E4F18F90]);
    CFHTTPMessageSetHeaderFieldValue(Request, @"Host", v16);
    CFDataRef v24 = CFHTTPMessageCopySerializedMessage(Request);
    int Length = CFDataGetLength(v24);
    if (Length >= 1024) {
      uint64_t v22 = 1024;
    }
    else {
      uint64_t v22 = Length;
    }
    CFDataGetBytePtr(v24);
    __memcpy_chk();
    CFRelease(Request);
    CFRelease(v24);
    buf[(int)v22] = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    uint64_t v27 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a5) {
        __int16 v28 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
      }
      else {
        __int16 v28 = "<nil>";
      }
      v97.fds_bits[0] = 136317186;
      *(void *)&v97.fds_bits[1] = v26;
      LOWORD(v97.fds_bits[3]) = 2080;
      *(void *)((char *)&v97.fds_bits[3] + 2) = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
      HIWORD(v97.fds_bits[5]) = 1024;
      v97.fds_bits[6] = 851;
      LOWORD(v97.fds_bits[7]) = 2080;
      *(void *)((char *)&v97.fds_bits[7] + 2) = v28;
      HIWORD(v97.fds_bits[9]) = 1024;
      v97.fds_bits[10] = HIBYTE(v76);
      LOWORD(v97.fds_bits[11]) = 1024;
      *(__int32_t *)((char *)&v97.fds_bits[11] + 2) = BYTE2(v76);
      HIWORD(v97.fds_bits[12]) = 1024;
      v97.fds_bits[13] = BYTE1(v76);
      LOWORD(v97.fds_bits[14]) = 1024;
      *(__int32_t *)((char *)&v97.fds_bits[14] + 2) = v76;
      HIWORD(v97.fds_bits[15]) = 1024;
      v97.fds_bits[16] = v18;
      _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d callHTTPTestFromIPPort: [%s], IP: %u.%u.%u.%u:%u", (uint8_t *)&v97, 0x44u);
    }
  }
  CFRelease(v15);
  CFRelease(v16);
  if (a3->iFlags) {
    int v29 = 30;
  }
  else {
    int v29 = 2;
  }
  int v30 = socket(v29, 1, 6);
  if (v30 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]();
      }
    }
    return 0;
  }
  unsigned int v31 = v30;
  v86.fds_bits[0] = 1;
  setsockopt(v30, 0xFFFF, 4130, &v86, 4u);
  memset(&v97, 0, sizeof(v97));
  FillSockAddrStorage();
  if (bind(v31, (const sockaddr *)&v97, LOBYTE(v97.fds_bits[0])))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]();
      }
    }
LABEL_30:
    close(v31);
    return 0;
  }
  if ((v31 & 0x80000000) != 0) {
    return 0;
  }
  int v32 = fcntl(v31, 3, 0);
  fcntl(v31, 4, v32 | 4u);
  FillSockAddrStorage();
  int v33 = connect(v31, &v89, v89.sa_len);
  if (v33)
  {
    if (v33 == -1 && *__error() != 36)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]();
        }
      }
      goto LABEL_30;
    }
    int v34 = 0;
  }
  else
  {
    int v34 = 1;
  }
  v75.tv_sec = (uint64_t)v11;
  *(&v75.tv_usec + 1) = -1431655766;
  int v37 = 1 << v31;
  v75.tv_usec = (int)((v11 - (double)(uint64_t)v11) * 1000000.0);
  uint64_t v71 = (int)v22;
  __int16 v38 = v21;
  while (1)
  {
    memset(&v97, 0, sizeof(v97));
    memset(&v86, 0, sizeof(v86));
    if (v34 > 1)
    {
      int v41 = __darwin_check_fd_set_overflow(v31, &v97, 0);
      __int16 v40 = &v97.fds_bits[v31 >> 5];
      if (!v41) {
        goto LABEL_48;
      }
LABEL_47:
      *v40 |= v37;
      goto LABEL_48;
    }
    int v39 = __darwin_check_fd_set_overflow(v31, &v86, 0);
    __int16 v40 = &v86.fds_bits[v31 >> 5];
    if (v39) {
      goto LABEL_47;
    }
LABEL_48:
    int v42 = select(v31 + 1, &v97, &v86, 0, &v75);
    if (!v42)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v53 = VRTraceErrorLogLevelToCSTR();
        v54 = *MEMORY[0x1E4F47A50];
        BOOL v55 = v72;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v77 = 136316162;
          uint64_t v78 = v53;
          __int16 v79 = 2080;
          v80 = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
          __int16 v81 = 1024;
          int v82 = 896;
          __int16 v83 = 1024;
          *(_DWORD *)v84 = 896;
          *(_WORD *)&v84[4] = 1024;
          *(_DWORD *)&v84[6] = 10;
          v56 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/GKNATObserve"
                "r.m:%d: callHTTPTestFromIPPort: connect timed out %d";
          goto LABEL_113;
        }
        goto LABEL_83;
      }
      goto LABEL_105;
    }
    if (v42 == -1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_105;
      }
      uint64_t v57 = VRTraceErrorLogLevelToCSTR();
      v54 = *MEMORY[0x1E4F47A50];
      BOOL v55 = v72;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_83;
      }
      int v70 = *__error();
      *(_DWORD *)v77 = 136316162;
      uint64_t v78 = v57;
      __int16 v79 = 2080;
      v80 = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
      __int16 v81 = 1024;
      int v82 = 893;
      __int16 v83 = 1024;
      *(_DWORD *)v84 = 893;
      *(_WORD *)&v84[4] = 1024;
      *(_DWORD *)&v84[6] = v70;
      v56 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/GKNATObserver.m:"
            "%d: callHTTPTestFromIPPort: select failed for connect (%d)";
LABEL_113:
      v62 = v54;
      uint32_t v63 = 40;
LABEL_114:
      _os_log_error_impl(&dword_1E1EA4000, v62, OS_LOG_TYPE_ERROR, v56, v77, v63);
      goto LABEL_83;
    }
    if (!v34)
    {
      socklen_t v73 = 4;
      int v74 = -1431655766;
      getsockopt(v31, 0xFFFF, 4103, &v74, &v73);
      int v43 = v74;
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v43)
      {
        if (ErrorLogLevelForModule < 3)
        {
          int v34 = 5;
        }
        else
        {
          uint64_t v45 = VRTraceErrorLogLevelToCSTR();
          v46 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v77 = 136316162;
            uint64_t v78 = v45;
            __int16 v79 = 2080;
            v80 = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
            __int16 v81 = 1024;
            int v82 = 905;
            __int16 v83 = 1024;
            *(_DWORD *)v84 = 905;
            *(_WORD *)&v84[4] = 1024;
            *(_DWORD *)&v84[6] = v74;
            _os_log_error_impl(&dword_1E1EA4000, v46, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/GKNATObserver.m:%d: callHTTPTestFromIPPort: connect refused (%d)", v77, 0x28u);
          }
          int v34 = 5;
        }
      }
      else if (ErrorLogLevelForModule < 7)
      {
        int v34 = 1;
      }
      else
      {
        uint64_t v47 = v22;
        uint64_t v48 = VRTraceErrorLogLevelToCSTR();
        v49 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v77 = 136315650;
          uint64_t v78 = v48;
          __int16 v79 = 2080;
          v80 = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
          __int16 v81 = 1024;
          int v82 = 908;
          _os_log_impl(&dword_1E1EA4000, v49, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d callHTTPTestFromIPPort: TCP socket connected!", v77, 0x1Cu);
        }
        int v34 = 1;
        uint64_t v22 = v47;
      }
    }
    if (v34 == 2) {
      goto LABEL_69;
    }
    if (v34 == 1) {
      break;
    }
LABEL_76:
    if (v34 == 5) {
      goto LABEL_105;
    }
  }
  if (!__darwin_check_fd_set_overflow(v31, &v86, 0)) {
    goto LABEL_75;
  }
  if ((v86.fds_bits[v31 >> 5] & v37) == 0) {
    goto LABEL_75;
  }
  size_t v50 = (v22 + v21 - v38);
  if ((int)v50 < 1) {
    goto LABEL_75;
  }
  unsigned int v51 = write(v31, v38, v50);
  if ((v51 & 0x80000000) != 0)
  {
    if (*__error() != 35)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v65 = VRTraceErrorLogLevelToCSTR();
        v54 = *MEMORY[0x1E4F47A50];
        BOOL v55 = v72;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v66 = *__error();
          *(_DWORD *)v77 = 136316162;
          uint64_t v78 = v65;
          __int16 v79 = 2080;
          v80 = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
          __int16 v81 = 1024;
          int v82 = 917;
          __int16 v83 = 1024;
          *(_DWORD *)v84 = 917;
          *(_WORD *)&v84[4] = 1024;
          *(_DWORD *)&v84[6] = v66;
          v56 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/GKNATObserve"
                "r.m:%d: callHTTPTestFromIPPort: write failed with error=%d";
          goto LABEL_113;
        }
LABEL_83:
        int v35 = 0;
        goto LABEL_106;
      }
      goto LABEL_105;
    }
LABEL_75:
    int v34 = 1;
    goto LABEL_76;
  }
  v38 += v51;
  if (v38 - v21 != v71) {
    goto LABEL_75;
  }
LABEL_69:
  if (!__darwin_check_fd_set_overflow(v31, &v97, 0) || (v97.fds_bits[v31 >> 5] & v37) == 0)
  {
LABEL_73:
    int v34 = 2;
    goto LABEL_76;
  }
  int v52 = read(v31, __b, 0x400uLL);
  if (v52 < 0)
  {
    if (*__error() != 35)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v58 = VRTraceErrorLogLevelToCSTR();
        v54 = *MEMORY[0x1E4F47A50];
        BOOL v55 = v72;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v59 = *__error();
          *(_DWORD *)v77 = 136316162;
          uint64_t v78 = v58;
          __int16 v79 = 2080;
          v80 = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
          __int16 v81 = 1024;
          int v82 = 933;
          __int16 v83 = 1024;
          *(_DWORD *)v84 = 933;
          *(_WORD *)&v84[4] = 1024;
          *(_DWORD *)&v84[6] = v59;
          v56 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/GKNATObserve"
                "r.m:%d: callHTTPTestFromIPPort: read failed with error=%d";
          goto LABEL_113;
        }
        goto LABEL_83;
      }
LABEL_105:
      int v35 = 0;
      BOOL v55 = v72;
      goto LABEL_106;
    }
    goto LABEL_73;
  }
  if (!v52)
  {
    BOOL v55 = v72;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_83;
    }
    uint64_t v60 = VRTraceErrorLogLevelToCSTR();
    v61 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_83;
    }
    *(_DWORD *)v77 = 136315906;
    uint64_t v78 = v60;
    __int16 v79 = 2080;
    v80 = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
    __int16 v81 = 1024;
    int v82 = 937;
    __int16 v83 = 1024;
    *(_DWORD *)v84 = 937;
    v56 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/GKNATObserver.m:%d"
          ": callHTTPTestFromIPPort: server terminated";
    v62 = v61;
    uint32_t v63 = 34;
    goto LABEL_114;
  }
  BOOL v55 = v72;
  int v35 = v72 || __b[0] == 1347703880 && LOWORD(__b[1]) == 12591;
LABEL_106:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v67 = VRTraceErrorLogLevelToCSTR();
    v68 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v77 = 136316162;
      v69 = "HTTP";
      uint64_t v78 = v67;
      __int16 v79 = 2080;
      if (v55) {
        v69 = "HTTPS";
      }
      v80 = "-[GKNATObserverInternal callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:]";
      __int16 v81 = 1024;
      int v82 = 952;
      __int16 v83 = 2080;
      *(void *)v84 = v69;
      *(_WORD *)&v84[8] = 1024;
      int v85 = v35;
      _os_log_impl(&dword_1E1EA4000, v68, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d callHTTPTestFromIPPort: for %s result %d", v77, 0x2Cu);
    }
  }
  close(v31);
  return v35;
}

- (BOOL)ensureNatCachePathExists
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47A28], "getCachesDirectoryPath"), "UTF8String");
  int Directory = VCDiskUtils_CreateDirectory();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      sockaddr v9 = "-[GKNATObserverInternal ensureNatCachePathExists]";
      __int16 v10 = 1024;
      int v11 = 976;
      __int16 v12 = 1024;
      int v13 = Directory;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver:ensureNatCachePathExists : %d", (uint8_t *)&v6, 0x22u);
    }
  }
  return Directory;
}

- (id)copyNatTypeCachePlistScheme
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47A28], "getCachesDirectoryPath"), "stringByAppendingString:", @"/cache.plist");
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v3];
  if (v4)
  {
    socklen_t v5 = v4;
    id v6 = (id)[v4 objectForKeyedSubscript:@"natTypeCache"];

    return v6;
  }
  else
  {
    BOOL v8 = [(GKNATObserverInternal *)self ensureNatCachePathExists];
    CFPreferencesAppSynchronize(@"com.apple.conference");
    CFPropertyListRef v9 = CFPreferencesCopyAppValue(@"natTypeCache", @"com.apple.conference");
    __int16 v10 = (void *)v9;
    if (v8 && v9)
    {
      CFPreferencesSetAppValue(@"natTypeCache", 0, @"com.apple.conference");
      CFPreferencesAppSynchronize(@"com.apple.conference");
    }
    if (v8) {
      [(GKNATObserverInternal *)self updateNatTypeCache_CachePlistScheme:v10];
    }
    return v10;
  }
}

- (void)updateNatTypeCache_CachePlistScheme:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47A28], "getCachesDirectoryPath"), "stringByAppendingString:", @"/cache.plist");
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfFile:v4];
  if (!v5) {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v6 = v5;
  if (a3)
  {
    [v5 setObject:a3 forKeyedSubscript:@"natTypeCache"];
    id v5 = v6;
  }
  [v5 writeToFile:v4 atomically:1];
}

- (id)copyNatTypeCache_OSXGamedScheme
{
  CFPreferencesAppSynchronize(@"com.apple.gamed");

  return (id)CFPreferencesCopyAppValue(@"natTypeCache", @"com.apple.gamed");
}

- (void)updateNatTypeCache_OSXGamedScheme:(id)a3
{
  CFPreferencesSetAppValue(@"natTypeCache", a3, @"com.apple.gamed");

  CFPreferencesAppSynchronize(@"com.apple.gamed");
}

- (id)lookupCachedNATFlagsForNetwork:(id)a3
{
  id v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = [(GKNATObserverInternal *)self copyNatTypeCache];
    id v3 = (id)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v3), "objectForKey:", @"natFlags");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      id v6 = *MEMORY[0x1E4F47A50];
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136315906;
          uint64_t v10 = v5;
          __int16 v11 = 2080;
          __int16 v12 = "-[GKNATObserverInternal lookupCachedNATFlagsForNetwork:]";
          __int16 v13 = 1024;
          int v14 = 1082;
          __int16 v15 = 2080;
          uint64_t v16 = objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: NAT Cache = %s", (uint8_t *)&v9, 0x26u);
          if (!v4) {
            return v3;
          }
          goto LABEL_9;
        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[GKNATObserverInternal lookupCachedNATFlagsForNetwork:](v5, v4);
        if (!v4) {
          return v3;
        }
        goto LABEL_9;
      }
    }
    if (v4) {
LABEL_9:
    }
      CFRelease(v4);
  }
  return v3;
}

- (void)cacheNATFlags:(id)a3 forNetwork:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      BOOL v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v38 = v7;
        __int16 v39 = 2080;
        __int16 v40 = "-[GKNATObserverInternal cacheNATFlags:forNetwork:]";
        __int16 v41 = 1024;
        int v42 = 1095;
        __int16 v43 = 2080;
        uint64_t v44 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        __int16 v45 = 2080;
        uint64_t v46 = objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: Caching NAT flags [%s] for network \"%s\"...", buf, 0x30u);
      }
    }
    id v9 = [(GKNATObserverInternal *)self copyNatTypeCache];
    if (v9) {
      id v10 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v9];
    }
    else {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    __int16 v11 = v10;
    unsigned int v31 = self;
    if ([v10 objectForKeyedSubscript:a4]) {
      id v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithDictionary:", objc_msgSend(v11, "objectForKeyedSubscript:", a4));
    }
    else {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    __int16 v13 = v12;
    CFTypeRef cf = v9;
    if (a3)
    {
      [v12 setObject:a3 forKeyedSubscript:@"natFlags"];
      objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), @"natFlagsLastUpdated");
    }
    else
    {
      [v12 removeObjectForKey:@"natFlags"];
    }
    [v11 setObject:v13 forKeyedSubscript:a4];
    if ((unint64_t)[v11 count] >= 0x65)
    {
      *(void *)&long long v14 = 136316162;
      long long v29 = v14;
      do
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v32, 16, v29);
        if (!v15) {
          break;
        }
        uint64_t v16 = v15;
        uint64_t v17 = 0;
        unsigned __int16 v18 = 0;
        uint64_t v19 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v34 != v19) {
              objc_enumerationMutation(v11);
            }
            uint64_t v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            uint64_t v22 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", v21), "objectForKey:", @"natFlagsLastUpdated");
            if (!v22)
            {
              uint64_t v17 = v21;
              goto LABEL_29;
            }
            unsigned __int16 v23 = (void *)v22;
            if (!v18 || [v18 earlierDate:v22] == v22)
            {
              uint64_t v17 = v21;
              unsigned __int16 v18 = v23;
            }
          }
          uint64_t v16 = [v11 countByEnumeratingWithState:&v33 objects:v32 count:16];
          if (v16) {
            continue;
          }
          break;
        }
LABEL_29:
        if (!v17) {
          break;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v24 = VRTraceErrorLogLevelToCSTR();
          unsigned int v25 = *MEMORY[0x1E4F47A50];
          uint64_t v26 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v27 = [v17 UTF8String];
              *(_DWORD *)buf = v29;
              uint64_t v38 = v24;
              __int16 v39 = 2080;
              __int16 v40 = "-[GKNATObserverInternal cacheNATFlags:forNetwork:]";
              __int16 v41 = 1024;
              int v42 = 1142;
              __int16 v43 = 2080;
              uint64_t v44 = v27;
              __int16 v45 = 1024;
              LODWORD(v46) = 100;
              _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: Pruning network \"%s\" from NAT flags cache. (GKNATObserverMaxCachedNetworks=%d)", buf, 0x2Cu);
            }
          }
          else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v28 = [v17 UTF8String];
            *(_DWORD *)buf = v29;
            uint64_t v38 = v24;
            __int16 v39 = 2080;
            __int16 v40 = "-[GKNATObserverInternal cacheNATFlags:forNetwork:]";
            __int16 v41 = 1024;
            int v42 = 1142;
            __int16 v43 = 2080;
            uint64_t v44 = v28;
            __int16 v45 = 1024;
            LODWORD(v46) = 100;
            _os_log_debug_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEBUG, " [%s] %s:%d GKNATObserver: Pruning network \"%s\" from NAT flags cache. (GKNATObserverMaxCachedNetworks=%d)", buf, 0x2Cu);
          }
        }
        [v11 removeObjectForKey:v17];
      }
      while ((unint64_t)[v11 count] > 0x64);
    }
    [(GKNATObserverInternal *)v31 updateNatTypeCache:v11];
    if (cf) {
      CFRelease(cf);
    }
  }
}

- (void)NATCheckWithIPPort:(tagIPPORT *)a3 ipv6Prefix:(id *)a4 useCache:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if ((a3->iFlags & 4) != 0) {
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"gk_ci_%s", a3->szIfName);
  }
  else {
    uint64_t v10 = [NSString stringWithUTF8String:a3->szIfName];
  }
  __int16 v11 = (void *)v10;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    __int16 v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v11) {
        long long v14 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
      }
      else {
        long long v14 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v54 = v12;
      __int16 v55 = 2080;
      v56 = "-[GKNATObserverInternal NATCheckWithIPPort:ipv6Prefix:useCache:]";
      __int16 v57 = 1024;
      int v58 = 1169;
      __int16 v59 = 2080;
      double v60 = *(double *)&v14;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: NATCheckWithIPPort starting for %s", buf, 0x26u);
    }
  }
  double v15 = micro();
  if ((a3->iFlags & 4) != 0) {
    uint64_t v16 = @"gk_ci_cache";
  }
  else {
    uint64_t v16 = [(GKNATObserverInternal *)self nameForNetworkWithIPPort:a3 interfaceName:v11];
  }
  double v17 = micro() - v15;
  if (v17 > 0.01 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    uint64_t v19 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v54 = v18;
      __int16 v55 = 2080;
      v56 = "-[GKNATObserverInternal NATCheckWithIPPort:ipv6Prefix:useCache:]";
      __int16 v57 = 1024;
      int v58 = 1175;
      __int16 v59 = 2048;
      double v60 = v17;
      _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: nameForNetworkWithIPPort took %0.lf seconds", buf, 0x26u);
    }
  }
  double v20 = micro();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_natCheckNetNameSema, 0xFFFFFFFFFFFFFFFFLL);
  if (v5)
  {
    if (v16)
    {
      id v52 = v9;
      double v21 = micro();
      id v22 = [(GKNATObserverInternal *)self lookupCachedNATFlagsForNetwork:v16];
      double v23 = micro() - v21;
      if (v23 > 0.01 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        unsigned int v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v54 = v24;
          __int16 v55 = 2080;
          v56 = "-[GKNATObserverInternal NATCheckWithIPPort:ipv6Prefix:useCache:]";
          __int16 v57 = 1024;
          int v58 = 1192;
          __int16 v59 = 2048;
          double v60 = v23;
          _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: cache lookup took %0.lf seconds", buf, 0x26u);
        }
      }
      if (!v22) {
        goto LABEL_34;
      }
      [(NSRecursiveLock *)self->_xNATCheck lock];
      uint64_t v26 = [v22 unsignedLongValue];
      [(GKNATObserverInternal *)self setCommNATFlags:v26 forInterface:v11 isCached:1];
      [(GKNATObserverInternal *)self setTCPFlags:v26 forInterface:v11 isCached:1];
      [(GKNATObserverInternal *)self setSSLFlags:v26 forInterface:v11 isCached:1];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v51 = VRTraceErrorLogLevelToCSTR();
        uint64_t v27 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = objc_msgSend((id)-[__CFString description](v16, "description"), "UTF8String");
          *(_DWORD *)buf = 136316162;
          uint64_t v54 = v51;
          __int16 v55 = 2080;
          v56 = "-[GKNATObserverInternal NATCheckWithIPPort:ipv6Prefix:useCache:]";
          __int16 v57 = 1024;
          int v58 = 1201;
          __int16 v59 = 2080;
          double v60 = *(double *)&v28;
          __int16 v61 = 2048;
          uint64_t v62 = v26;
          _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: Cached NAT flags for network \"%s\": [%08lX]", buf, 0x30u);
        }
      }
      [(NSRecursiveLock *)self->_xNATCheck unlock];
      [(GKNATObserverInternal *)self reportNATType];
      int v29 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentNetworkNames, "objectForKeyedSubscript:", v11), "isEqualToString:", v16);
      if (v26)
      {
LABEL_34:
        id v9 = v52;
      }
      else
      {
        id v9 = v52;
        if (v29)
        {
          dispatch_semaphore_signal((dispatch_semaphore_t)self->_natCheckNetNameSema);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v30 = VRTraceErrorLogLevelToCSTR();
            unsigned int v31 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              if (v11) {
                int v32 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
              }
              else {
                int v32 = "<nil>";
              }
              uint64_t v50 = objc_msgSend((id)-[__CFString description](v16, "description"), "UTF8String");
              *(_DWORD *)buf = 136316162;
              uint64_t v54 = v30;
              __int16 v55 = 2080;
              v56 = "-[GKNATObserverInternal NATCheckWithIPPort:ipv6Prefix:useCache:]";
              __int16 v57 = 1024;
              int v58 = 1209;
              __int16 v59 = 2080;
              double v60 = *(double *)&v32;
              __int16 v61 = 2080;
              uint64_t v62 = v50;
              uint64_t v47 = " [%s] %s:%d GKNATObserver: Network on interface \"%s\" [%s] did not change, skipping...";
              uint64_t v48 = v31;
              uint32_t v49 = 48;
              goto LABEL_55;
            }
          }
          goto LABEL_56;
        }
      }
      [(NSMutableDictionary *)self->_currentNetworkNames setValue:v16 forKey:v11];
    }
    else
    {
      [(NSMutableDictionary *)self->_currentNetworkNames removeObjectForKey:v11];
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_natCheckNetNameSema);
  double v33 = micro() - v20;
  if (v33 > 0.01 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v34 = VRTraceErrorLogLevelToCSTR();
    long long v35 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v54 = v34;
      __int16 v55 = 2080;
      v56 = "-[GKNATObserverInternal NATCheckWithIPPort:ipv6Prefix:useCache:]";
      __int16 v57 = 1024;
      int v58 = 1222;
      __int16 v59 = 2048;
      double v60 = v33;
      _os_log_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: cache lookup semaphore took %0.lf seconds", buf, 0x26u);
    }
  }
  long long v36 = [(GKNATObserverInternal *)self callCommNATTestFromIPPort:a3 ipv6Prefix:a4];
  if (v36) {
    uint64_t var0 = v36->var0;
  }
  else {
    uint64_t var0 = 1;
  }
  free(v36);
  double v38 = micro();
  [(NSRecursiveLock *)self->_xNATCheck lock];
  uint64_t v39 = [(GKNATObserverInternal *)self setCommNATFlags:var0 forInterface:v11 isCached:0];
  [(NSRecursiveLock *)self->_xNATCheck unlock];
  double v40 = micro() - v38;
  if (v40 > 0.01 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v41 = VRTraceErrorLogLevelToCSTR();
    int v42 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v54 = v41;
      __int16 v55 = 2080;
      v56 = "-[GKNATObserverInternal NATCheckWithIPPort:ipv6Prefix:useCache:]";
      __int16 v57 = 1024;
      int v58 = 1235;
      __int16 v59 = 2048;
      double v60 = v40;
      _os_log_impl(&dword_1E1EA4000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: updating NAT flags dictionary took %0.lf seconds", buf, 0x26u);
    }
  }
  [(GKNATObserverInternal *)self reportNATType];
  if (v5)
  {
    if (v16)
    {
      double v43 = micro();
      -[GKNATObserverInternal cacheNATFlags:forNetwork:](self, "cacheNATFlags:forNetwork:", [NSNumber numberWithUnsignedInt:v39], v16);
      double v44 = micro() - v43;
      if (v44 > 0.01 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v45 = VRTraceErrorLogLevelToCSTR();
        uint64_t v46 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v54 = v45;
          __int16 v55 = 2080;
          v56 = "-[GKNATObserverInternal NATCheckWithIPPort:ipv6Prefix:useCache:]";
          __int16 v57 = 1024;
          int v58 = 1245;
          __int16 v59 = 2048;
          double v60 = v44;
          uint64_t v47 = " [%s] %s:%d GKNATObserver: caching took %0.lf seconds";
          uint64_t v48 = v46;
          uint32_t v49 = 38;
LABEL_55:
          _os_log_impl(&dword_1E1EA4000, v48, OS_LOG_TYPE_DEFAULT, v47, buf, v49);
        }
      }
    }
  }
LABEL_56:
}

- (void)HTTPCheckWithIPPort:(tagIPPORT *)a3 ipv6Prefix:(id *)a4 useCache:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if ((a3->iFlags & 4) != 0) {
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"gk_ci_%s", a3->szIfName);
  }
  else {
    uint64_t v10 = [NSString stringWithUTF8String:a3->szIfName];
  }
  uint64_t v11 = v10;
  if ((a3->iFlags & 4) != 0) {
    uint64_t v12 = @"gk_ci_cache";
  }
  else {
    uint64_t v12 = [(GKNATObserverInternal *)self nameForNetworkWithIPPort:a3 interfaceName:v10];
  }
  id v13 = +[GKSConnectivitySettings getAddressForService:@"gk-p2p-tcp-check-url"];
  if (v13)
  {
    uint64_t v14 = ([(GKNATObserverInternal *)self callHTTPTestFromIPPort:a3 ipv6Prefix:a4 ToServer:v13 isSSL:0] != 0) << 11;
    [(NSRecursiveLock *)self->_xNATCheck lock];
    uint64_t v15 = [(GKNATObserverInternal *)self setTCPFlags:v14 forInterface:v11 isCached:0];
    [(NSRecursiveLock *)self->_xNATCheck unlock];
    [(GKNATObserverInternal *)self reportNATType];
    if (v5 && v12) {
      -[GKNATObserverInternal cacheNATFlags:forNetwork:](self, "cacheNATFlags:forNetwork:", [NSNumber numberWithUnsignedInt:v15], v12);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[GKNATObserverInternal HTTPCheckWithIPPort:ipv6Prefix:useCache:]();
    }
  }
}

- (void)HTTPSCheckWithIPPort:(tagIPPORT *)a3 ipv6Prefix:(id *)a4 useCache:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if ((a3->iFlags & 4) != 0) {
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"gk_ci_%s", a3->szIfName);
  }
  else {
    uint64_t v10 = [NSString stringWithUTF8String:a3->szIfName];
  }
  uint64_t v11 = v10;
  if ((a3->iFlags & 4) != 0) {
    uint64_t v12 = @"gk_ci_cache";
  }
  else {
    uint64_t v12 = [(GKNATObserverInternal *)self nameForNetworkWithIPPort:a3 interfaceName:v10];
  }
  id v13 = +[GKSConnectivitySettings getAddressForService:@"gk-p2p-ssl-check-url"];
  if (v13)
  {
    uint64_t v14 = ([(GKNATObserverInternal *)self callHTTPTestFromIPPort:a3 ipv6Prefix:a4 ToServer:v13 isSSL:1] != 0) << 12;
    [(NSRecursiveLock *)self->_xNATCheck lock];
    uint64_t v15 = [(GKNATObserverInternal *)self setSSLFlags:v14 forInterface:v11 isCached:0];
    [(NSRecursiveLock *)self->_xNATCheck unlock];
    [(GKNATObserverInternal *)self reportNATType];
    if (v5 && v12) {
      -[GKNATObserverInternal cacheNATFlags:forNetwork:](self, "cacheNATFlags:forNetwork:", [NSNumber numberWithUnsignedInt:v15], v12);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[GKNATObserverInternal HTTPSCheckWithIPPort:ipv6Prefix:useCache:]();
    }
  }
}

- (void)clearRetries
{
  [(NSRecursiveLock *)self->_xNATCheck lock];
  self->_NATCheckRetryCount = 0;
  xNATCheck = self->_xNATCheck;

  [(NSRecursiveLock *)xNATCheck unlock];
}

- (void)tryNATCheckWithDelay:(double)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self->_hasNATCheckStarted = 1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      uint64_t v14 = "-[GKNATObserverInternal tryNATCheckWithDelay:]";
      __int16 v15 = 1024;
      int v16 = 1332;
      __int16 v17 = 2080;
      Name = sel_getName(a2);
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: %s", buf, 0x26u);
    }
  }
  [(NSRecursiveLock *)self->_xNATCheck lock];
  if (self->_fNATCheckQueued)
  {
    [(NSRecursiveLock *)self->_xNATCheck unlock];
  }
  else
  {
    if (self->_fNATCheckInProgress) {
      double v8 = 0.25;
    }
    else {
      double v8 = 0.0;
    }
    self->_fNATCheckQueued = 1;
    [(NSRecursiveLock *)self->_xNATCheck unlock];
    natCheckQueue = self->_natCheckQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke;
    block[3] = &unk_1E6DB4518;
    block[4] = self;
    *(double *)&block[5] = a3;
    *(double *)&block[6] = v8;
    dispatch_async(natCheckQueue, block);
  }
}

uint64_t __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke(uint64_t a1)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    id v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      uint64_t v87 = v2;
      __int16 v88 = 2080;
      sockaddr v89 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
      __int16 v90 = 1024;
      int v91 = 1345;
      __int16 v92 = 2048;
      *(void *)sockaddr v93 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: start setting up NAT checks (delay: %lf)", buf, 0x26u);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 24) lock];
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 121) = 1;
  [*(id *)(*(void *)(a1 + 32) + 24) unlock];
  usleep(((*(double *)(a1 + 40) + *(double *)(a1 + 48)) * 1000000.0));
  uint64_t v85 = 0;
  [*(id *)(*(void *)(a1 + 32) + 24) lock];
  id v76 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "allKeys"), "mutableCopy");
  [*(id *)(*(void *)(a1 + 32) + 24) unlock];
  int LocalInterfaceListWithOptions = GetLocalInterfaceListWithOptions();
  if (LocalInterfaceListWithOptions >= 1)
  {
    uint64_t v6 = 0;
    int v7 = 0;
    uint64_t v8 = LocalInterfaceListWithOptions;
    uint64_t v9 = 4;
    uint64_t v75 = LocalInterfaceListWithOptions;
    while (1)
    {
      uint64_t v94 = 0;
      uint64_t v95 = 0;
      uint64_t v10 = v85;
      if ((*(unsigned char *)(v85 + v9 - 4) & 1) == 0) {
        goto LABEL_10;
      }
      VCNAT64ResolverRegisterForPrefixUpdate((const char *)(v85 + v9), (uint64_t)NAT64ResolverCallBack, *(void *)(a1 + 32));
      VCNAT64ResolverGetPrefix(v85 + v9, &v94);
      if (VCNAT64ResolverIsNonzeroPrefix(&v94))
      {
        [*(id *)(a1 + 32) delegate];
        if (objc_opt_respondsToSelector()) {
          break;
        }
      }
LABEL_20:
      ++v6;
      v9 += 40;
      if (v8 == v6) {
        goto LABEL_23;
      }
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_152;
    block[3] = &unk_1E6DB3DC8;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(global_queue, block);
    uint64_t v10 = v85;
LABEL_10:
    if (strcmp((const char *)(v10 + v9), "lo0"))
    {
      uint64_t v12 = objc_alloc_init(IPPortWrapper);
      uint64_t v13 = [(IPPortWrapper *)v12 ipport];
      uint64_t v14 = *(void *)(v85 + v9 + 28);
      long long v15 = *(_OWORD *)(v85 + v9 + 12);
      *(_OWORD *)uint64_t v13 = *(_OWORD *)(v85 + v9 - 4);
      *(_OWORD *)(v13 + 16) = v15;
      *(void *)(v13 + 32) = v14;
      int v16 = [[IPv6PrefixWrapper alloc] initWithPrefix:&v94];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        uint64_t v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v87 = v17;
          __int16 v88 = 2080;
          sockaddr v89 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
          __int16 v90 = 1024;
          int v91 = 1393;
          __int16 v92 = 1024;
          *(_DWORD *)sockaddr v93 = v6;
          *(_WORD *)&v93[4] = 1024;
          *(_DWORD *)&v93[6] = v8;
          *(_WORD *)&v93[10] = 2080;
          *(void *)&v93[12] = v9 + v85;
          _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: queued non-carrier NAT check %d@%d, %s", buf, 0x32u);
        }
      }
      int v19 = v7;
      if ((*(unsigned char *)(v85 + v9 - 4) & 4) != 0) {
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"gk_ci_%s", v85 + v9);
      }
      else {
        uint64_t v20 = objc_msgSend(NSString, "stringWithUTF8String:");
      }
      [v76 removeObject:v20];
      uint64_t v21 = *(void *)(a1 + 32);
      id v22 = *(NSObject **)(v21 + 104);
      double v23 = dispatch_get_global_queue(2, 0);
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_156;
      v83[3] = &unk_1E6DB43D8;
      v83[4] = v21;
      v83[5] = v12;
      v83[6] = v16;
      dispatch_group_async(v22, v23, v83);
      uint64_t v24 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v24 + 57))
      {
        unsigned int v25 = *(NSObject **)(v24 + 104);
        v82[0] = MEMORY[0x1E4F143A8];
        v82[1] = 3221225472;
        v82[2] = __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_2;
        v82[3] = &unk_1E6DB43D8;
        v82[4] = v24;
        v82[5] = v12;
        v82[6] = v16;
        dispatch_group_async(v25, v23, v82);
        uint64_t v26 = *(void *)(a1 + 32);
        uint64_t v27 = *(NSObject **)(v26 + 104);
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_3;
        v81[3] = &unk_1E6DB43D8;
        v81[4] = v26;
        v81[5] = v12;
        v81[6] = v16;
        dispatch_group_async(v27, v23, v81);
      }

      int v7 = v19 + 1;
      uint64_t v8 = v75;
    }
    goto LABEL_20;
  }
  int v7 = 0;
LABEL_23:
  FreeLocalInterfaceList();
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 56))
  {
    uint64_t v85 = 0;
    int v30 = GetLocalInterfaceListWithOptions();
    if (v30 < 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v49 = VRTraceErrorLogLevelToCSTR();
        uint64_t v50 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v87 = v49;
          __int16 v88 = 2080;
          sockaddr v89 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke_2";
          __int16 v90 = 1024;
          int v91 = 1491;
          _os_log_impl(&dword_1E1EA4000, v50, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: No usable carrier interfaces found.", buf, 0x1Cu);
        }
      }
      goto LABEL_59;
    }
    LODWORD(v31) = v30;
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 63))
    {
      uint64_t v51 = +[GKSConnectivitySettings getNATTypeFromCarrierBundle];
      if (v51)
      {
        uint64_t v52 = v51;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v53 = VRTraceErrorLogLevelToCSTR();
          uint64_t v54 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v87 = v53;
            __int16 v88 = 2080;
            sockaddr v89 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke_4";
            __int16 v90 = 1024;
            int v91 = 1433;
            __int16 v92 = 1024;
            *(_DWORD *)sockaddr v93 = v52;
            _os_log_impl(&dword_1E1EA4000, v54, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: carrier static NAT type: %08X", buf, 0x22u);
          }
        }
        [*(id *)(*(void *)(a1 + 32) + 24) lock];
        [*(id *)(a1 + 32) setCommNATFlags:v52 forInterface:@"gk_ci_" isCached:0];
        [*(id *)(*(void *)(a1 + 32) + 24) unlock];
        [v76 removeObject:@"gk_ci_"];
        ++v7;
LABEL_59:
        FreeLocalInterfaceList();
        goto LABEL_60;
      }
    }
    uint64_t v32 = 0;
    uint64_t v31 = v31;
    while (1)
    {
      uint64_t v94 = 0;
      uint64_t v95 = 0;
      if ((*(unsigned char *)(v85 + v32) & 1) == 0) {
        goto LABEL_34;
      }
      VCNAT64ResolverRegisterForPrefixUpdate((const char *)(v85 + v32 + 4), (uint64_t)NAT64ResolverCallBack, *(void *)(a1 + 32));
      VCNAT64ResolverGetPrefix(v85 + v32 + 4, &v94);
      if (VCNAT64ResolverIsNonzeroPrefix(&v94))
      {
        [*(id *)(a1 + 32) delegate];
        if (objc_opt_respondsToSelector()) {
          break;
        }
      }
LABEL_45:
      v32 += 40;
      if (!--v31) {
        goto LABEL_59;
      }
    }
    double v33 = dispatch_get_global_queue(0, 0);
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_158;
    v80[3] = &unk_1E6DB3DC8;
    v80[4] = *(void *)(a1 + 32);
    dispatch_async(v33, v80);
LABEL_34:
    uint64_t v34 = objc_alloc_init(IPPortWrapper);
    uint64_t v35 = [(IPPortWrapper *)v34 ipport];
    uint64_t v36 = *(void *)(v85 + v32 + 32);
    long long v37 = *(_OWORD *)(v85 + v32 + 16);
    *(_OWORD *)uint64_t v35 = *(_OWORD *)(v85 + v32);
    *(_OWORD *)(v35 + 16) = v37;
    *(void *)(v35 + 32) = v36;
    double v38 = [[IPv6PrefixWrapper alloc] initWithPrefix:&v94];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v39 = VRTraceErrorLogLevelToCSTR();
      double v40 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v87 = v39;
        __int16 v88 = 2080;
        sockaddr v89 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
        __int16 v90 = 1024;
        int v91 = 1464;
        __int16 v92 = 2080;
        *(void *)sockaddr v93 = v32 + v85 + 4;
        _os_log_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: queued carrier NAT check on %s", buf, 0x26u);
      }
    }
    uint64_t v41 = v85 + v32 + 4;
    if ((*(unsigned char *)(v85 + v32) & 4) != 0) {
      uint64_t v42 = objc_msgSend(NSString, "stringWithFormat:", @"gk_ci_%s", v41);
    }
    else {
      uint64_t v42 = [NSString stringWithUTF8String:v41];
    }
    uint64_t v43 = v42;
    [v76 removeObject:v42];
    uint64_t v44 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v44 + 59) || *(unsigned char *)(v44 + 61) || *(unsigned char *)(v44 + 60))
    {
      uint64_t v45 = *(NSObject **)(v44 + 104);
      uint64_t v46 = dispatch_get_global_queue(2, 0);
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_159;
      v79[3] = &unk_1E6DB43D8;
      v79[4] = v44;
      v79[5] = v34;
      v79[6] = v38;
      dispatch_group_async(v45, v46, v79);
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v47 = VRTraceErrorLogLevelToCSTR();
        uint64_t v48 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v87 = v47;
          __int16 v88 = 2080;
          sockaddr v89 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
          __int16 v90 = 1024;
          int v91 = 1472;
          _os_log_impl(&dword_1E1EA4000, v48, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: empty carrier NAT type set", buf, 0x1Cu);
        }
      }
      [*(id *)(*(void *)(a1 + 32) + 24) lock];
      [*(id *)(a1 + 32) setCommNATFlags:0 forInterface:v43 isCached:0];
      [*(id *)(*(void *)(a1 + 32) + 24) unlock];
    }

    ++v7;
    goto LABEL_45;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v28 = VRTraceErrorLogLevelToCSTR();
    int v29 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v87 = v28;
      __int16 v88 = 2080;
      sockaddr v89 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
      __int16 v90 = 1024;
      int v91 = 1497;
      _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: _nonCarrierInterfacesOnly set, skipping carrier interfaces test", buf, 0x1Cu);
    }
  }
LABEL_60:
  if ([v76 count])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v55 = VRTraceErrorLogLevelToCSTR();
      v56 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v57 = objc_msgSend((id)objc_msgSend(v76, "description"), "UTF8String");
        *(_DWORD *)buf = 136315906;
        uint64_t v87 = v55;
        __int16 v88 = 2080;
        sockaddr v89 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
        __int16 v90 = 1024;
        int v91 = 1502;
        __int16 v92 = 2080;
        *(void *)sockaddr v93 = v57;
        _os_log_impl(&dword_1E1EA4000, v56, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: Removing interfaces from consideration: %s", buf, 0x26u);
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 24) lock];
    [*(id *)(*(void *)(a1 + 32) + 48) removeObjectsForKeys:v76];
    [*(id *)(*(void *)(a1 + 32) + 24) unlock];
  }
  [*(id *)(a1 + 32) reportNATType];
  int v58 = *(id **)(a1 + 32);
  if (v7)
  {
    [v58 clearRetries];
    dispatch_group_wait(*(dispatch_group_t *)(*(void *)(a1 + 32) + 104), 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    [v58[3] lock];
    uint64_t v59 = *(void *)(a1 + 32);
    int v60 = *(_DWORD *)(v59 + 64);
    if (v60 > 2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v62 = VRTraceErrorLogLevelToCSTR();
        uint64_t v63 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v64 = *(_DWORD *)(*(void *)(a1 + 32) + 64);
          *(_DWORD *)buf = 136315906;
          uint64_t v87 = v62;
          __int16 v88 = 2080;
          sockaddr v89 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke_2";
          __int16 v90 = 1024;
          int v91 = 1544;
          __int16 v92 = 1024;
          *(_DWORD *)sockaddr v93 = v64;
          _os_log_impl(&dword_1E1EA4000, v63, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: no usable interfaces (already retried %d times)", buf, 0x22u);
        }
      }
    }
    else
    {
      if (v60) {
        double v61 = *(double *)(v59 + 72) + *(double *)(v59 + 72);
      }
      else {
        double v61 = 0.25;
      }
      *(double *)(v59 + 72) = v61;
      ++*(_DWORD *)(*(void *)(a1 + 32) + 64);
      uint64_t v65 = *(void *)(a1 + 32);
      int v66 = *(_DWORD *)(v65 + 64);
      uint64_t v67 = *(void *)(v65 + 72);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v68 = VRTraceErrorLogLevelToCSTR();
        v69 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v70 = *(_DWORD *)(*(void *)(a1 + 32) + 64);
          *(_DWORD *)buf = 136316162;
          uint64_t v87 = v68;
          __int16 v88 = 2080;
          sockaddr v89 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
          __int16 v90 = 1024;
          int v91 = 1529;
          __int16 v92 = 1024;
          *(_DWORD *)sockaddr v93 = v70;
          *(_WORD *)&v93[4] = 2048;
          *(void *)&v93[6] = v67;
          _os_log_impl(&dword_1E1EA4000, v69, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: no usable interfaces (retry #%d in %0.3lfs)", buf, 0x2Cu);
        }
      }
      uint64_t v71 = dispatch_get_global_queue(0, 0);
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_161;
      v77[3] = &unk_1E6DB3F58;
      v77[5] = v67;
      uint8_t v77[4] = *(void *)(a1 + 32);
      int v78 = v66;
      dispatch_async(v71, v77);
    }
    [*(id *)(*(void *)(a1 + 32) + 24) unlock];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 137) = 1;
  [*(id *)(a1 + 32) reportNATType];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v72 = VRTraceErrorLogLevelToCSTR();
    socklen_t v73 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v87 = v72;
      __int16 v88 = 2080;
      sockaddr v89 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
      __int16 v90 = 1024;
      int v91 = 1552;
      _os_log_impl(&dword_1E1EA4000, v73, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: done waiting for NAT check group", buf, 0x1Cu);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 24) lock];
  *(unsigned char *)(*(void *)(a1 + 32) + 121) = 0;
  return [*(id *)(*(void *)(a1 + 32) + 24) unlock];
}

uint64_t __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_152(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    id v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      uint64_t v8 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 1380;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Trigger interface change directly from non-carrier check", (uint8_t *)&v5, 0x1Cu);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "triggerInterfaceChange");
}

uint64_t __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_156(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) ipport];
  uint64_t v4 = [*(id *)(a1 + 48) ipv6Prefix];
  BOOL v5 = *(unsigned char *)(*(void *)(a1 + 32) + 62) == 0;

  return [v2 NATCheckWithIPPort:v3 ipv6Prefix:v4 useCache:v5];
}

uint64_t __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) ipport];
  uint64_t v4 = [*(id *)(a1 + 48) ipv6Prefix];
  BOOL v5 = *(unsigned char *)(*(void *)(a1 + 32) + 62) == 0;

  return [v2 HTTPCheckWithIPPort:v3 ipv6Prefix:v4 useCache:v5];
}

uint64_t __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) ipport];
  uint64_t v4 = [*(id *)(a1 + 48) ipv6Prefix];
  BOOL v5 = *(unsigned char *)(*(void *)(a1 + 32) + 62) == 0;

  return [v2 HTTPSCheckWithIPPort:v3 ipv6Prefix:v4 useCache:v5];
}

uint64_t __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_158(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      uint64_t v8 = "-[GKNATObserverInternal tryNATCheckWithDelay:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 1456;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Trigger interface change directly from carrier check", (uint8_t *)&v5, 0x1Cu);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "triggerInterfaceChange");
}

uint64_t __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_159(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) ipport];
  uint64_t v4 = [*(id *)(a1 + 48) ipv6Prefix];

  return [v2 NATCheckWithIPPort:v3 ipv6Prefix:v4 useCache:1];
}

uint64_t __46__GKNATObserverInternal_tryNATCheckWithDelay___block_invoke_161(uint64_t a1)
{
  usleep((*(double *)(a1 + 40) * 1000000.0));
  [*(id *)(*(void *)(a1 + 32) + 24) lock];
  int v2 = *(_DWORD *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(v3 + 64);
  uint64_t result = [*(id *)(v3 + 24) unlock];
  if (v2 <= v4)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    return [v6 tryNATCheckWithDelay:0.0];
  }
  return result;
}

- (id)nameForNetworkWithIPPort:(tagIPPORT *)a3 interfaceName:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  CFDictionaryRef v7 = SCDynamicStoreCopyMultiple(self->_dynamicStore, 0, (CFArrayRef)&unk_1F3DC70E0);
  objc_sync_exit(self);
  if (v7)
  {
    uint64_t v8 = (void *)[(__CFDictionary *)v7 allValues];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      int v10 = *MEMORY[0x1E4F47A50];
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v26 = v9;
          __int16 v27 = 2080;
          uint64_t v28 = "-[GKNATObserverInternal nameForNetworkWithIPPort:interfaceName:]";
          __int16 v29 = 1024;
          int v30 = 1577;
          __int16 v31 = 2080;
          uint64_t v32 = objc_msgSend((id)-[__CFDictionary description](v7, "description"), "UTF8String");
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNATObserver: SCDS dictionary: %s", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[GKNATObserverInternal nameForNetworkWithIPPort:interfaceName:](v9, v7);
      }
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v12 = [v8 countByEnumeratingWithState:&v21 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v22;
LABEL_10:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v8);
        }
        long long v15 = *(void **)(*((void *)&v21 + 1) + 8 * v14);
        if (objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"InterfaceName"), "isEqual:", a4)) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v8 countByEnumeratingWithState:&v21 objects:v20 count:16];
          if (v12) {
            goto LABEL_10;
          }
          goto LABEL_16;
        }
      }
      id v16 = (id)[v15 objectForKeyedSubscript:@"NetworkSignature"];
      CFRelease(v7);
      if (v16) {
        return v16;
      }
    }
    else
    {
LABEL_16:
      CFRelease(v7);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    int v19 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v26 = v18;
      __int16 v27 = 2080;
      uint64_t v28 = "-[GKNATObserverInternal nameForNetworkWithIPPort:interfaceName:]";
      __int16 v29 = 1024;
      int v30 = 1575;
      _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Dynamic store is nil", buf, 0x1Cu);
    }
  }
  return (id)[NSString stringWithFormat:@"%u.%u.%u.%u%%%@", HIBYTE(a3->IP.dwIPv4), BYTE2(a3->IP.dwIPv4), BYTE1(a3->IP.dwIPv4), a3->IP.dwIPv4, a4];
}

- (void)registerForNetworkChanges
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d GKNATObserver: SCDynamicStoreSetNotificationKeys failed, we will miss network change notifications!", v2, v3, v4, v5, v6);
}

- (void)initWithOptions:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 357;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d GKNATObserver: no NAT cache available, running NAT check", v1, 0x1Cu);
}

- (void)callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:.cold.1()
{
  __error();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/GKNATObserver.m:%d: createTCPSocket: socket() failed (%d)", v2, v3, v4, v5, v6);
}

- (void)callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:.cold.2()
{
  __error();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/GKNATObserver.m:%d: connectTCPSocket: connect failed (%d)", v2, v3, v4, v5, v6);
}

- (void)callHTTPTestFromIPPort:ipv6Prefix:ToServer:isSSL:.cold.3()
{
  __error();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/GKNATObserver.m:%d: createTCPSocket: bind() failed (%d)", v2, v3, v4, v5, v6);
}

- (void)lookupCachedNATFlagsForNetwork:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d GKNATObserver: NAT Cache = %s", v4, v5, v6, v7, v8);
}

- (void)HTTPCheckWithIPPort:ipv6Prefix:useCache:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No tcp server... aborting", v2, v3, v4, v5, v6);
}

- (void)HTTPSCheckWithIPPort:ipv6Prefix:useCache:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No https server... aborting", v2, v3, v4, v5, v6);
}

- (void)nameForNetworkWithIPPort:(uint64_t)a1 interfaceName:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d GKNATObserver: SCDS dictionary: %s", v4, v5, v6, v7, v8);
}

@end