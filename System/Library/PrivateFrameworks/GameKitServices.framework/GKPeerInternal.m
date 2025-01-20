@interface GKPeerInternal
+ (void)freeLookupList:(_DNSServiceRef_t *)a3 andAddrList:(id *)a4 andInterfaceList:(unsigned int *)a5 count:(int)a6;
- (BOOL)containsLookupService:(_DNSServiceRef_t *)a3;
- (BOOL)isBusy;
- (BOOL)moreResolvesComing;
- (BOOL)needsToTimeout;
- (BOOL)tryDetruncateDisplayName:(id)a3;
- (GKPeerInternal)initWithPID:(unsigned int)a3 displayName:(id)a4 serviceName:(id)a5;
- (GKSessionInternal)session;
- (NSString)displayName;
- (NSString)serviceName;
- (_DNSServiceRef_t)resolveService;
- (_DNSServiceRef_t)txtRecordService;
- (double)connectTimeout;
- (int)serviceCount;
- (int)usableAddrs;
- (unsigned)pid;
- (unsigned)servicePort;
- (void)addLookup:(_DNSServiceRef_t *)a3;
- (void)cleanupForGKTable:(id)a3;
- (void)clearResolving;
- (void)copyLookupList:(_DNSServiceRef_t *)a3 count:(int *)a4;
- (void)dealloc;
- (void)removeAndReturnLookupList:(_DNSServiceRef_t *)a3 andAddrList:(id *)a4 andInterfaceList:(unsigned int *)a5 count:(int *)a6;
- (void)setAddr:(const sockaddr_in *)a3 interface:(unsigned int)a4 forLookupService:(_DNSServiceRef_t *)a5;
- (void)setBusy:(BOOL)a3;
- (void)setConnectTimeout:(double)a3;
- (void)setMoreResolvesComing:(BOOL)a3;
- (void)setNeedsToTimeout:(BOOL)a3;
- (void)setResolveService:(_DNSServiceRef_t *)a3;
- (void)setServiceCount:(int)a3;
- (void)setServicePort:(unsigned int)a3;
- (void)setSession:(id)a3;
- (void)setTxtRecordService:(_DNSServiceRef_t *)a3;
- (void)stopResolving;
- (void)stopTXTRecordMonitoring;
@end

@implementation GKPeerInternal

- (GKPeerInternal)initWithPID:(unsigned int)a3 displayName:(id)a4 serviceName:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)GKPeerInternal;
  v8 = [(GKPeerInternal *)&v10 init];
  if (v8)
  {
    v8->_serviceName = (NSString *)a5;
    v8->_displayName = (NSString *)a4;
    v8->_pid = a3;
    v8->_isBusy = 0;
    v8->_resolveService = 0;
    v8->_serviceCount = 1;
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int pid = self->_pid;
      *(_DWORD *)buf = 136316162;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      objc_super v10 = "-[GKPeerInternal dealloc]";
      __int16 v11 = 1024;
      int v12 = 4530;
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 1024;
      unsigned int v16 = pid;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d * GKPeer[%p] %d dealloc", buf, 0x2Cu);
    }
  }
  [(GKPeerInternal *)self stopResolving];

  +[GKPeerInternal freeLookupList:self->_lookupServiceList andAddrList:self->_addrList andInterfaceList:self->_interfaceList count:self->_lookupServiceCount];
  v6.receiver = self;
  v6.super_class = (Class)GKPeerInternal;
  [(GKPeerInternal *)&v6 dealloc];
}

- (void)setServiceCount:(int)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    objc_super v6 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int pid = self->_pid;
      int serviceCount = self->_serviceCount;
      int v9 = 136316674;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      int v12 = "-[GKPeerInternal setServiceCount:]";
      __int16 v13 = 1024;
      int v14 = 4540;
      __int16 v15 = 2048;
      unsigned int v16 = self;
      __int16 v17 = 1024;
      unsigned int v18 = pid;
      __int16 v19 = 1024;
      int v20 = serviceCount;
      __int16 v21 = 1024;
      int v22 = a3;
      _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKPeer[%p] %d service count old=%d new=%d", (uint8_t *)&v9, 0x38u);
    }
  }
  self->_int serviceCount = a3;
}

- (int)serviceCount
{
  return self->_serviceCount;
}

- (BOOL)tryDetruncateDisplayName:(id)a3
{
  unint64_t v5 = [a3 length];
  if (v5 <= [(NSString *)self->_displayName length])
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    BOOL v6 = -[NSString isEqualToString:](self->_displayName, "isEqualToString:", objc_msgSend(a3, "substringToIndex:", -[NSString length](self->_displayName, "length")));
    if (v6)
    {

      self->_displayName = (NSString *)a3;
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (void)addLookup:(_DNSServiceRef_t *)a3
{
  lookupServiceList = self->_lookupServiceList;
  if (lookupServiceList)
  {
    int lookupServiceCount = self->_lookupServiceCount;
    int lookupServiceSize = self->_lookupServiceSize;
    p_int lookupServiceCount = &self->_lookupServiceCount;
    if (lookupServiceCount != lookupServiceSize)
    {
LABEL_11:
      *p_int lookupServiceCount = lookupServiceCount + 1;
      lookupServiceList[lookupServiceCount] = a3;
      return;
    }
    int v9 = (_DNSServiceRef_t **)malloc_type_realloc(lookupServiceList, 8 * (lookupServiceSize + 16), 0x2004093837F09uLL);
    if (v9)
    {
      uint64_t v10 = self->_lookupServiceSize + 16;
      self->_int lookupServiceSize = v10;
      self->_lookupServiceList = v9;
      __int16 v11 = (id *)malloc_type_calloc(v10, 8uLL, 0x80040B8603338uLL);
      if (v11)
      {
        int v12 = v11;
        addrList = self->_addrList;
        memcpy(v11, addrList, 8 * self->_lookupServiceSize - 128);
        self->_addrList = v12;
        free(addrList);
        int v14 = malloc_type_calloc(self->_lookupServiceSize, 4uLL, 0x100004052888210uLL);
        if (v14)
        {
          __int16 v15 = v14;
          interfaceList = self->_interfaceList;
          memset(interfaceList, 255, 4 * self->_lookupServiceSize);
          memcpy(v15, interfaceList, 4 * self->_lookupServiceSize - 64);
          self->_interfaceList = (unsigned int *)v15;
          free(interfaceList);
          lookupServiceList = self->_lookupServiceList;
          int lookupServiceCount = self->_lookupServiceCount;
          goto LABEL_11;
        }
      }
    }
    +[GKPeerInternal freeLookupList:self->_lookupServiceList andAddrList:self->_addrList andInterfaceList:self->_interfaceList count:self->_lookupServiceCount];
    goto LABEL_14;
  }
  __int16 v17 = (_DNSServiceRef_t **)malloc_type_malloc(0x80uLL, 0x2004093837F09uLL);
  self->_lookupServiceList = v17;
  if (!v17) {
    return;
  }
  unsigned int v18 = (id *)malloc_type_calloc(0x10uLL, 8uLL, 0x80040B8603338uLL);
  self->_addrList = v18;
  if (!v18)
  {
    free(self->_lookupServiceList);
LABEL_14:
    self->_lookupServiceList = 0;
    return;
  }
  __int16 v19 = (unsigned int *)malloc_type_calloc(0x10uLL, 4uLL, 0x100004052888210uLL);
  self->_interfaceList = v19;
  if (v19)
  {
    int lookupServiceCount = 0;
    *(void *)&long long v20 = -1;
    *((void *)&v20 + 1) = -1;
    *((_OWORD *)v19 + 2) = v20;
    *((_OWORD *)v19 + 3) = v20;
    *(_OWORD *)__int16 v19 = v20;
    *((_OWORD *)v19 + 1) = v20;
    self->_int lookupServiceSize = 16;
    lookupServiceList = self->_lookupServiceList;
    p_int lookupServiceCount = &self->_lookupServiceCount;
    goto LABEL_11;
  }
  free(self->_lookupServiceList);
  self->_lookupServiceList = 0;
  free(self->_addrList);
  self->_addrList = 0;
}

+ (void)freeLookupList:(_DNSServiceRef_t *)a3 andAddrList:(id *)a4 andInterfaceList:(unsigned int *)a5 count:(int)a6
{
  if (a3 && a4 && a6 >= 1)
  {
    uint64_t v9 = a6;
    uint64_t v10 = a4;
    do
    {
      __int16 v11 = *v10++;

      --v9;
    }
    while (v9);
  }
  free(a3);
  free(a4);
  free(a5);
}

- (void)removeAndReturnLookupList:(_DNSServiceRef_t *)a3 andAddrList:(id *)a4 andInterfaceList:(unsigned int *)a5 count:(int *)a6
{
  lookupServiceList = self->_lookupServiceList;
  if (lookupServiceList)
  {
    *a6 = self->_lookupServiceCount;
    *a3 = lookupServiceList;
    *a4 = self->_addrList;
    *a5 = self->_interfaceList;
    self->_addrList = 0;
    self->_interfaceList = 0;
    self->_lookupServiceList = 0;
    *(void *)&self->_int lookupServiceCount = 0;
  }
  else
  {
    *a6 = 0;
    *a3 = 0;
    *a4 = 0;
    *a5 = 0;
  }
}

- (BOOL)containsLookupService:(_DNSServiceRef_t *)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    BOOL v6 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int pid = self->_pid;
      uint64_t v8 = "yes";
      int lookupServiceCount = self->_lookupServiceCount;
      if (!self->_lookupServiceList) {
        uint64_t v8 = "no";
      }
      int v16 = 136316418;
      uint64_t v17 = v5;
      __int16 v18 = 2080;
      __int16 v19 = "-[GKPeerInternal containsLookupService:]";
      __int16 v20 = 1024;
      int v21 = 4657;
      __int16 v22 = 1024;
      unsigned int v23 = pid;
      __int16 v24 = 2080;
      v25 = v8;
      __int16 v26 = 1024;
      int v27 = lookupServiceCount;
      _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer %d checking lookup service (%s) containing %d", (uint8_t *)&v16, 0x32u);
    }
  }
  lookupServiceList = self->_lookupServiceList;
  if (!lookupServiceList) {
    return 0;
  }
  uint64_t v11 = self->_lookupServiceCount;
  if ((int)v11 < 1) {
    return 0;
  }
  uint64_t v12 = v11 - 1;
  do
  {
    __int16 v13 = *lookupServiceList++;
    BOOL result = v13 == a3;
  }
  while (v13 != a3 && v12-- != 0);
  return result;
}

- (void)setAddr:(const sockaddr_in *)a3 interface:(unsigned int)a4 forLookupService:(_DNSServiceRef_t *)a5
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  if (!self->_lookupServiceList) {
    return;
  }
  int lookupServiceCount = self->_lookupServiceCount;
  if (lookupServiceCount < 1) {
    return;
  }
  uint64_t v7 = 0;
  while (self->_lookupServiceList[v7] != a5)
  {
LABEL_26:
    if (++v7 >= lookupServiceCount) {
      return;
    }
  }
  sockaddr_in v65 = *a3;
  v65.sin_port = bswap32(LOWORD(self->_servicePort)) >> 16;
  if (lookupServiceCount < 1)
  {
LABEL_23:
    id v20 = self->_addrList[v7];
    if (v20) {

    }
    self->_addrList[v7] = (id)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v65 length:16];
    self->_interfaceList[v7] = a4;
    int lookupServiceCount = self->_lookupServiceCount;
    goto LABEL_26;
  }
  uint64_t v8 = 0;
  while (1)
  {
    id v9 = self->_addrList[v8];
    if (!v9)
    {
      uint64_t v11 = 0;
      unsigned int v14 = 0;
      unsigned int v12 = bswap32(v65.sin_addr.s_addr);
LABEL_12:
      char v13 = 1;
      goto LABEL_13;
    }
    uint64_t v10 = [v9 bytes];
    uint64_t v11 = v10;
    unsigned int v12 = bswap32(v65.sin_addr.s_addr);
    if (!v10)
    {
      unsigned int v14 = 0;
      goto LABEL_12;
    }
    char v13 = 0;
    unsigned int v14 = bswap32(*(_DWORD *)(v10 + 4));
LABEL_13:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      int v16 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (v13) {
          unsigned int v17 = 0;
        }
        else {
          unsigned int v17 = bswap32(*(unsigned __int16 *)(v11 + 2)) >> 16;
        }
        unsigned int pid = self->_pid;
        __int16 v19 = self->_lookupServiceList[v7];
        *(_DWORD *)buf = 136318978;
        uint64_t v34 = v15;
        __int16 v35 = 2080;
        v36 = "-[GKPeerInternal setAddr:interface:forLookupService:]";
        __int16 v37 = 1024;
        int v38 = 4684;
        __int16 v39 = 1024;
        unsigned int v40 = pid;
        __int16 v41 = 1024;
        unsigned int v42 = HIBYTE(v12);
        __int16 v43 = 1024;
        int v44 = BYTE2(v12);
        __int16 v45 = 1024;
        int v46 = BYTE1(v12);
        __int16 v47 = 1024;
        int v48 = v12;
        __int16 v49 = 1024;
        unsigned int v50 = bswap32(v65.sin_port) >> 16;
        __int16 v51 = 1024;
        int v52 = (int)a5;
        __int16 v53 = 1024;
        unsigned int v54 = HIBYTE(v14);
        __int16 v55 = 1024;
        int v56 = BYTE2(v14);
        __int16 v57 = 1024;
        int v58 = BYTE1(v14);
        __int16 v59 = 1024;
        int v60 = v14;
        __int16 v61 = 1024;
        unsigned int v62 = v17;
        __int16 v63 = 1024;
        int v64 = (int)v19;
        _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer %d setAddr %u.%u.%u.%u:%u for service %08X compared to %u.%u.%u.%u:%u of service %08X", buf, 0x6Au);
      }
    }
    if ((v13 & 1) == 0 && *(unsigned __int16 *)(v11 + 2) == v65.sin_port && *(_DWORD *)(v11 + 4) == v65.sin_addr.s_addr) {
      break;
    }
    if (++v8 >= self->_lookupServiceCount) {
      goto LABEL_23;
    }
  }
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v7 == v8)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      unsigned int v23 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v34 = v22;
        __int16 v35 = 2080;
        v36 = "-[GKPeerInternal setAddr:interface:forLookupService:]";
        __int16 v37 = 1024;
        int v38 = 4690;
        __int16 v24 = " [%s] %s:%d  - already set to same IP";
        v25 = v23;
        uint32_t v26 = 28;
        goto LABEL_35;
      }
    }
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v27 = VRTraceErrorLogLevelToCSTR();
    uint64_t v28 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      v29 = self->_lookupServiceList[v8];
      *(_DWORD *)buf = 136315906;
      uint64_t v34 = v27;
      __int16 v35 = 2080;
      v36 = "-[GKPeerInternal setAddr:interface:forLookupService:]";
      __int16 v37 = 1024;
      int v38 = 4692;
      __int16 v39 = 1024;
      unsigned int v40 = v29;
      __int16 v24 = " [%s] %s:%d  - was set in a previous GetAddrInfo service: %08X (double resolve?)";
      v25 = v28;
      uint32_t v26 = 34;
LABEL_35:
      _os_log_impl(&dword_221563000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    }
  }
}

- (void)copyLookupList:(_DNSServiceRef_t *)a3 count:(int *)a4
{
  lookupServiceList = self->_lookupServiceList;
  if (lookupServiceList)
  {
    uint64_t v8 = (_DNSServiceRef_t **)malloc_type_malloc(8 * self->_lookupServiceCount, 0x2004093837F09uLL);
    *a3 = v8;
    memcpy(v8, self->_lookupServiceList, 8 * self->_lookupServiceCount);
    LODWORD(lookupServiceList) = self->_lookupServiceCount;
  }
  else
  {
    *a3 = 0;
  }
  *a4 = (int)lookupServiceList;
}

- (int)usableAddrs
{
  if (!self->_lookupServiceList) {
    return 0;
  }
  uint64_t lookupServiceCount = self->_lookupServiceCount;
  if ((int)lookupServiceCount < 1) {
    return 0;
  }
  int result = 0;
  addrList = self->_addrList;
  do
  {
    if (*addrList++) {
      ++result;
    }
    --lookupServiceCount;
  }
  while (lookupServiceCount);
  return result;
}

- (void)stopResolving
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  [(GKSessionInternal *)self->_session lock];
  if (![(GKSessionInternal *)self->_session isShuttingDown])
  {
    lookupServiceList = self->_lookupServiceList;
    if (lookupServiceList)
    {
      if (self->_lookupServiceCount < 1)
      {
        LODWORD(v8) = 0;
      }
      else
      {
        uint64_t v8 = 0;
        id v9 = (os_log_t *)MEMORY[0x263F21098];
        *(void *)&long long v3 = 136316418;
        long long v30 = v3;
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v10 = VRTraceErrorLogLevelToCSTR();
            uint64_t v11 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int pid = self->_pid;
              char v13 = self->_lookupServiceList[v8];
              *(_DWORD *)buf = v30;
              *(void *)&uint8_t buf[4] = v10;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "-[GKPeerInternal stopResolving]";
              *(_WORD *)&buf[22] = 1024;
              LODWORD(v32) = 4744;
              WORD2(v32) = 2048;
              *(void *)((char *)&v32 + 6) = self;
              HIWORD(v32) = 1024;
              LODWORD(v33) = pid;
              WORD2(v33) = 1024;
              *(_DWORD *)((char *)&v33 + 6) = v13;
              _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKPeer[%p] %d dealloc lookupService: %08X", buf, 0x32u);
            }
          }
          unsigned int v14 = self->_lookupServiceList[v8];
          if (v14) {
            DNSServiceRefDeallocate(v14);
          }
          ++v8;
        }
        while (v8 < self->_lookupServiceCount);
        lookupServiceList = self->_lookupServiceList;
      }
      free(lookupServiceList);
      p_resolveService = &self->_resolveService;
      resolveService = self->_resolveService;
      self->_lookupServiceList = 0;
      self->_uint64_t lookupServiceCount = 0;
      if (resolveService) {
        goto LABEL_20;
      }
      if (v8)
      {
LABEL_24:
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_32;
        }
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        uint64_t v22 = *MEMORY[0x263F21098];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_32;
        }
        unsigned int v23 = self->_pid;
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[GKPeerInternal stopResolving]";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v32) = 4761;
        WORD2(v32) = 2048;
        *(void *)((char *)&v32 + 6) = self;
        HIWORD(v32) = 1024;
        LODWORD(v33) = v23;
        WORD2(v33) = 1024;
        *(_DWORD *)((char *)&v33 + 6) = v8;
        __int16 v24 = " [%s] %s:%d * GKPeer[%p] %d Stopped resolving: %d";
        v25 = v22;
        uint32_t v26 = 50;
        goto LABEL_31;
      }
    }
    else
    {
      p_resolveService = &self->_resolveService;
      if (self->_resolveService)
      {
        LODWORD(v8) = 0;
LABEL_20:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v17 = VRTraceErrorLogLevelToCSTR();
          __int16 v18 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v19 = self->_pid;
            id v20 = self->_resolveService;
            *(_DWORD *)buf = 136316418;
            *(void *)&uint8_t buf[4] = v17;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[GKPeerInternal stopResolving]";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v32) = 4755;
            WORD2(v32) = 2048;
            *(void *)((char *)&v32 + 6) = self;
            HIWORD(v32) = 1024;
            LODWORD(v33) = v19;
            WORD2(v33) = 1024;
            *(_DWORD *)((char *)&v33 + 6) = v20;
            _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKPeer[%p] %d dealloc resolveService: %08X", buf, 0x32u);
          }
        }
        DNSServiceRefDeallocate(*p_resolveService);
        *p_resolveService = 0;
        LODWORD(v8) = v8 + 1;
        goto LABEL_24;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_32;
    }
    uint64_t v27 = VRTraceErrorLogLevelToCSTR();
    uint64_t v28 = *MEMORY[0x263F21098];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    unsigned int v29 = self->_pid;
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = v27;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[GKPeerInternal stopResolving]";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v32) = 4763;
    WORD2(v32) = 2048;
    *(void *)((char *)&v32 + 6) = self;
    HIWORD(v32) = 1024;
    LODWORD(v33) = v29;
    __int16 v24 = " [%s] %s:%d * GKPeer[%p] %d Nothing to stop resolving";
    v25 = v28;
    uint32_t v26 = 44;
LABEL_31:
    _os_log_impl(&dword_221563000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    goto LABEL_32;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = self->_pid;
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v4;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[GKPeerInternal stopResolving]";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v32) = 4734;
      WORD2(v32) = 2048;
      *(void *)((char *)&v32 + 6) = self;
      HIWORD(v32) = 1024;
      LODWORD(v33) = v6;
      _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKPeer[%p] %d avoiding overrelease", buf, 0x2Cu);
    }
  }
  [(GKPeerInternal *)self clearResolving];
LABEL_32:
  [(GKSessionInternal *)self->_session unlock];
}

- (void)clearResolving
{
  lookupServiceList = self->_lookupServiceList;
  if (lookupServiceList)
  {
    free(lookupServiceList);
    self->_lookupServiceList = 0;
    self->_uint64_t lookupServiceCount = 0;
  }
  if (self->_resolveService) {
    self->_resolveService = 0;
  }
}

- (void)stopTXTRecordMonitoring
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(GKSessionInternal *)self->_session lock];
  if (![(GKSessionInternal *)self->_session isShuttingDown])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int pid = self->_pid;
        txtRecordService = self->_txtRecordService;
        int v7 = 136316418;
        uint64_t v8 = v3;
        __int16 v9 = 2080;
        uint64_t v10 = "-[GKPeerInternal stopTXTRecordMonitoring]";
        __int16 v11 = 1024;
        int v12 = 4783;
        __int16 v13 = 2048;
        unsigned int v14 = self;
        __int16 v15 = 1024;
        unsigned int v16 = pid;
        __int16 v17 = 1024;
        int v18 = (int)txtRecordService;
        _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKPeer[%p] %d => calling DNSServiceRefDeallocate(_txtRecordService) (%08X)", (uint8_t *)&v7, 0x32u);
      }
    }
    DNSServiceRefDeallocate(self->_txtRecordService);
    self->_txtRecordService = 0;
  }
  [(GKSessionInternal *)self->_session unlock];
}

- (void)cleanupForGKTable:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    unsigned int v6 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int pid = self->_pid;
      int v11 = 136316418;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      unsigned int v14 = "-[GKPeerInternal cleanupForGKTable:]";
      __int16 v15 = 1024;
      int v16 = 4791;
      __int16 v17 = 2048;
      int v18 = self;
      __int16 v19 = 1024;
      unsigned int v20 = pid;
      __int16 v21 = 2048;
      id v22 = a3;
      _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKPeer[%p] %d cleanup for table[%p]", (uint8_t *)&v11, 0x36u);
    }
  }
  [(GKPeerInternal *)self stopResolving];
  [(GKSessionInternal *)self->_session lock];
  if (![(GKSessionInternal *)self->_session isShuttingDown])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      __int16 v9 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        txtRecordService = self->_txtRecordService;
        int v11 = 136315906;
        uint64_t v12 = v8;
        __int16 v13 = 2080;
        unsigned int v14 = "-[GKPeerInternal cleanupForGKTable:]";
        __int16 v15 = 1024;
        int v16 = 4795;
        __int16 v17 = 1024;
        LODWORD(v18) = txtRecordService;
        _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_txtRecordService) (%08X)", (uint8_t *)&v11, 0x22u);
      }
    }
    DNSServiceRefDeallocate(self->_txtRecordService);
    self->_txtRecordService = 0;
  }
  [(GKSessionInternal *)self->_session unlock];
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unsigned)pid
{
  return self->_pid;
}

- (BOOL)isBusy
{
  return self->_isBusy;
}

- (void)setBusy:(BOOL)a3
{
  self->_isBusy = a3;
}

- (_DNSServiceRef_t)resolveService
{
  return self->_resolveService;
}

- (void)setResolveService:(_DNSServiceRef_t *)a3
{
  self->_resolveService = a3;
}

- (_DNSServiceRef_t)txtRecordService
{
  return self->_txtRecordService;
}

- (void)setTxtRecordService:(_DNSServiceRef_t *)a3
{
  self->_txtRecordService = a3;
}

- (unsigned)servicePort
{
  return self->_servicePort;
}

- (void)setServicePort:(unsigned int)a3
{
  self->_servicePort = a3;
}

- (BOOL)moreResolvesComing
{
  return self->_moreResolvesComing;
}

- (void)setMoreResolvesComing:(BOOL)a3
{
  self->_moreResolvesComing = a3;
}

- (GKSessionInternal)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (double)connectTimeout
{
  return self->_connectTimeout;
}

- (void)setConnectTimeout:(double)a3
{
  self->_connectTimeout = a3;
}

- (BOOL)needsToTimeout
{
  return self->_needsToTimeout;
}

- (void)setNeedsToTimeout:(BOOL)a3
{
  self->_needsToTimeout = a3;
}

@end