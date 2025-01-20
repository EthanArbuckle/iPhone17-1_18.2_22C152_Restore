@interface VCDatagramChannelManager
+ (id)sharedInstance;
- (BOOL)isEmulatedDatagramChannelEnabledViaDefaults;
- (BOOL)setupDatagramChannel:(id)a3 eventHandler:(id)a4 writeCompletionHandler:(id)a5 error:(id *)a6;
- (VCDatagramChannelManager)init;
- (id)addDatagramChannelWithDescriptor:(int)a3 eventHandler:(id)a4 error:(id *)a5;
- (id)addDatagramChannelWithDescriptor:(int)a3 eventHandler:(id)a4 writeCompletionHandler:(id)a5 error:(id *)a6;
- (id)addDatagramChannelWithDestination:(id)a3 eventHandler:(id)a4 dataPath:(int)a5 error:(id *)a6;
- (id)addDatagramChannelWithDestination:(id)a3 eventHandler:(id)a4 error:(id *)a5;
- (id)addDatagramChannelWithDestination:(id)a3 eventHandler:(id)a4 writeCompletionHandler:(id)a5 dataPath:(int)a6 error:(id *)a7;
- (id)datagramChannelWithChannelToken:(unsigned int)a3;
- (id)datagramChannels;
- (id)destinations;
- (id)readHandler;
- (id)setupEmulatedDatagramChannelWithDestination:(id)a3 datagramChannel:(id)a4;
- (void)dealloc;
- (void)executeBlockForIDSDestination:(id)a3 blockToExecute:(id)a4;
- (void)removeDatagramChannel:(id)a3;
- (void)removeDatagramChannels;
- (void)setReadHandler:(id)a3;
@end

@implementation VCDatagramChannelManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_18);
  }
  return (id)sharedInstance_sharedDatagramChannelManager;
}

VCDatagramChannelManager *__42__VCDatagramChannelManager_sharedInstance__block_invoke()
{
  result = objc_alloc_init(VCDatagramChannelManager);
  sharedInstance_sharedDatagramChannelManager = (uint64_t)result;
  return result;
}

- (VCDatagramChannelManager)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCDatagramChannelManager;
  v2 = [(VCDatagramChannelManager *)&v5 init];
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_stateLock, 0);
    ++v3->_nextToken;
    v3->_datagramChannels = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_destinations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  pthread_mutex_destroy(&self->_stateLock);

  v3.receiver = self;
  v3.super_class = (Class)VCDatagramChannelManager;
  [(VCDatagramChannelManager *)&v3 dealloc];
}

- (id)addDatagramChannelWithDescriptor:(int)a3 eventHandler:(id)a4 error:(id *)a5
{
  return [(VCDatagramChannelManager *)self addDatagramChannelWithDescriptor:*(void *)&a3 eventHandler:a4 writeCompletionHandler:0 error:a5];
}

- (id)addDatagramChannelWithDescriptor:(int)a3 eventHandler:(id)a4 writeCompletionHandler:(id)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCDatagramChannelManager addDatagramChannelWithDescriptor:eventHandler:writeCompletionHandler:error:]();
      }
    }
    goto LABEL_12;
  }
  uint64_t v10 = *(void *)&a3;
  pthread_mutex_lock(&self->_stateLock);
  uint64_t nextToken = self->_nextToken;
  self->_uint64_t nextToken = nextToken + 1;
  pthread_mutex_unlock(&self->_stateLock);
  v12 = [[VCDatagramChannelIDS alloc] initWithSocketDescriptor:v10 token:nextToken error:a6];
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        if (a6)
        {
          if (*a6) {
            v18 = (const char *)objc_msgSend((id)objc_msgSend(*a6, "description"), "UTF8String");
          }
          else {
            v18 = "<nil>";
          }
        }
        else
        {
          v18 = "nil";
        }
        int v19 = 136315906;
        uint64_t v20 = v16;
        __int16 v21 = 2080;
        v22 = "-[VCDatagramChannelManager addDatagramChannelWithDescriptor:eventHandler:writeCompletionHandler:error:]";
        __int16 v23 = 1024;
        int v24 = 75;
        __int16 v25 = 2080;
        v26 = v18;
        _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d DatagramChannel creation failed with error %s", (uint8_t *)&v19, 0x26u);
      }
    }
LABEL_12:
    v14 = 0;
    goto LABEL_5;
  }
  v13 = v12;
  pthread_mutex_lock(&self->_stateLock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_datagramChannels, "setObject:forKeyedSubscript:", v13, [NSNumber numberWithUnsignedInt:nextToken]);
  pthread_mutex_unlock(&self->_stateLock);
  if ([(VCDatagramChannelManager *)self setupDatagramChannel:v13 eventHandler:a4 writeCompletionHandler:a5 error:a6])
  {
    v14 = v13;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCDatagramChannelManager addDatagramChannelWithDescriptor:eventHandler:writeCompletionHandler:error:]();
    }
  }
  v14 = 0;
LABEL_6:
  [(VCDatagramChannelManager *)self removeDatagramChannel:v13];
  return v14;
}

- (id)addDatagramChannelWithDestination:(id)a3 eventHandler:(id)a4 error:(id *)a5
{
  return [(VCDatagramChannelManager *)self addDatagramChannelWithDestination:a3 eventHandler:a4 dataPath:0 error:a5];
}

- (id)addDatagramChannelWithDestination:(id)a3 eventHandler:(id)a4 dataPath:(int)a5 error:(id *)a6
{
  return [(VCDatagramChannelManager *)self addDatagramChannelWithDestination:a3 eventHandler:a4 writeCompletionHandler:0 dataPath:*(void *)&a5 error:a6];
}

- (id)addDatagramChannelWithDestination:(id)a3 eventHandler:(id)a4 writeCompletionHandler:(id)a5 dataPath:(int)a6 error:(id *)a7
{
  *(void *)&v32[13] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCDatagramChannelManager addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:]();
      }
    }
    goto LABEL_26;
  }
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCDatagramChannelManager addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:]();
      }
    }
    goto LABEL_26;
  }
  uint64_t v10 = *(void *)&a6;
  pthread_mutex_lock(&self->_stateLock);
  if ([(NSMutableDictionary *)self->_destinations objectForKeyedSubscript:a3])
  {
    uint64_t v13 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_destinations, "objectForKeyedSubscript:", a3), "unsignedIntegerValue");
    v14 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_datagramChannels, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v13]);
    pthread_mutex_unlock(&self->_stateLock);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 136316162;
        uint64_t v26 = v15;
        __int16 v27 = 2080;
        v28 = "-[VCDatagramChannelManager addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:]";
        __int16 v29 = 1024;
        int v30 = 138;
        __int16 v31 = 1024;
        *(_DWORD *)v32 = v13;
        v32[2] = 2080;
        *(void *)&v32[3] = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCDatagramChannelManager: found existing datagram channel with token %d for destination %s", (uint8_t *)&v25, 0x2Cu);
      }
    }
    goto LABEL_11;
  }
  uint64_t nextToken = self->_nextToken;
  self->_uint64_t nextToken = nextToken + 1;
  v18 = [[VCDatagramChannelIDS alloc] initWithDestination:a3 token:nextToken dataPath:v10 error:a7];
  if (!v18)
  {
    pthread_mutex_unlock(&self->_stateLock);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      __int16 v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        if (a7)
        {
          if (*a7) {
            int v24 = (const char *)objc_msgSend((id)objc_msgSend(*a7, "description"), "UTF8String");
          }
          else {
            int v24 = "<nil>";
          }
        }
        else
        {
          int v24 = "nil";
        }
        int v25 = 136315906;
        uint64_t v26 = v22;
        __int16 v27 = 2080;
        v28 = "-[VCDatagramChannelManager addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:]";
        __int16 v29 = 1024;
        int v30 = 121;
        __int16 v31 = 2080;
        *(void *)v32 = v24;
        _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d DatagramChannel creation failed with error %s", (uint8_t *)&v25, 0x26u);
      }
    }
    goto LABEL_26;
  }
  id v19 = [(VCDatagramChannelManager *)self setupEmulatedDatagramChannelWithDestination:a3 datagramChannel:v18];
  if (!v19)
  {
    pthread_mutex_unlock(&self->_stateLock);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCDatagramChannelManager addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:]();
      }
    }
LABEL_26:
    v14 = 0;
    goto LABEL_11;
  }
  id v20 = v19;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_destinations, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedInt:nextToken], a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_datagramChannels, "setObject:forKeyedSubscript:", v20, [NSNumber numberWithUnsignedInt:nextToken]);
  pthread_mutex_unlock(&self->_stateLock);
  if ([(VCDatagramChannelManager *)self setupDatagramChannel:v20 eventHandler:a4 writeCompletionHandler:a5 error:a7])
  {
    v14 = v20;
LABEL_11:
    id v20 = 0;
    goto LABEL_12;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCDatagramChannelManager addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:].cold.4();
    }
  }
  v14 = 0;
LABEL_12:
  [(VCDatagramChannelManager *)self removeDatagramChannel:v20];
  return v14;
}

- (id)setupEmulatedDatagramChannelWithDestination:(id)a3 datagramChannel:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "emulatedNetworkConfigPath"))
  {
    char v7 = objc_msgSend((id)objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "emulatedNetworkConfigPath"), "isEqualToString:", &stru_1F3D3E450);
    if ([a3 hasPrefix:@"loopback:"] && (v7 & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 136315906;
          uint64_t v14 = v8;
          __int16 v15 = 2080;
          uint64_t v16 = "-[VCDatagramChannelManager setupEmulatedDatagramChannelWithDestination:datagramChannel:]";
          __int16 v17 = 1024;
          int v18 = 159;
          __int16 v19 = 2112;
          uint64_t v20 = objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "emulatedNetworkConfigPath");
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Emulated network enabled, emulatedNetworkConfigPath=%@", (uint8_t *)&v13, 0x26u);
        }
      }
      return [[VCDatagramChannelIDSEmulated alloc] initWithIDSDatagramChannel:a4 mode:0];
    }
  }
  else
  {
    [a3 hasPrefix:@"loopback:"];
  }
  if ([(VCDatagramChannelManager *)self isEmulatedDatagramChannelEnabledViaDefaults])
  {
    return [[VCDatagramChannelIDSEmulated alloc] initWithIDSDatagramChannel:a4 mode:0];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      uint64_t v14 = v10;
      __int16 v15 = 2080;
      uint64_t v16 = "-[VCDatagramChannelManager setupEmulatedDatagramChannelWithDestination:datagramChannel:]";
      __int16 v17 = 1024;
      int v18 = 167;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Do not load emulated network", (uint8_t *)&v13, 0x1Cu);
    }
  }
  return a4;
}

- (BOOL)isEmulatedDatagramChannelEnabledViaDefaults
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (void *)VCDefaults_CopyStringValueForKey(@"emulatedNetworkConfigPath");
  objc_super v3 = (void *)VCDefaults_CopyStringValueForKey(@"emulatedNetworkConfigJSONString");
  if (v2 && [v2 length])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      objc_super v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315906;
        uint64_t v11 = v4;
        __int16 v12 = 2080;
        int v13 = "-[VCDatagramChannelManager isEmulatedDatagramChannelEnabledViaDefaults]";
        __int16 v14 = 1024;
        int v15 = 178;
        __int16 v16 = 2112;
        __int16 v17 = v2;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Emulated network enabled via defaults, emulatedNetworkConfigPath=%@", (uint8_t *)&v10, 0x26u);
      }
    }
    objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "setEmulatedNetworkConfigPath:", v2);
    BOOL v6 = 1;
    goto LABEL_15;
  }
  if (!v3 || ![v3 length])
  {
    BOOL v6 = 0;
    if (!v2) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315906;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      int v13 = "-[VCDatagramChannelManager isEmulatedDatagramChannelEnabledViaDefaults]";
      __int16 v14 = 1024;
      int v15 = 182;
      __int16 v16 = 2112;
      __int16 v17 = v3;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Emulated network enabled via defaults, emulatedNetworkConfigJSONString=%@", (uint8_t *)&v10, 0x26u);
    }
  }
  BOOL v6 = 1;
  if (v2) {
LABEL_15:
  }
    CFRelease(v2);
LABEL_16:
  if (v3) {
    CFRelease(v3);
  }
  return v6;
}

- (BOOL)setupDatagramChannel:(id)a3 eventHandler:(id)a4 writeCompletionHandler:(id)a5 error:(id *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v10 = VCDatagramChannelIDS_Token((uint64_t)a3);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    __int16 v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCDatagramChannelManager setupDatagramChannel:eventHandler:writeCompletionHandler:error:]";
      __int16 v19 = 1024;
      int v20 = 198;
      __int16 v21 = 1024;
      int v22 = v10;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCDatagramChannelManager: added datagram channel with token %d", buf, 0x22u);
    }
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__VCDatagramChannelManager_setupDatagramChannel_eventHandler_writeCompletionHandler_error___block_invoke;
  v14[3] = &unk_1E6DB5788;
  v14[4] = self;
  v14[5] = a3;
  [a3 setReadHandler:v14];
  if (a5) {
    [a3 setWriteCompletionHandler:a5];
  }
  [a3 setEventHandler:a4];
  return 1;
}

uint64_t __91__VCDatagramChannelManager_setupDatagramChannel_eventHandler_writeCompletionHandler_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int16 a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 80);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))(result + 16))(result, *(void *)(a1 + 40), a2, a3, a4, a5, a6, a7);
  }
  return result;
}

- (id)datagramChannelWithChannelToken:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_stateLock = &self->_stateLock;
  pthread_mutex_lock(&self->_stateLock);
  BOOL v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_datagramChannels, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v3]);
  pthread_mutex_unlock(p_stateLock);
  return v6;
}

- (void)executeBlockForIDSDestination:(id)a3 blockToExecute:(id)a4
{
  if (a4)
  {
    p_stateLock = &self->_stateLock;
    pthread_mutex_lock(&self->_stateLock);
    uint64_t v8 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_destinations, "objectForKeyedSubscript:", a3), "unsignedIntegerValue");
    id v9 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_datagramChannels, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v8]);
    pthread_mutex_unlock(p_stateLock);
    [v9 lock];
    (*((void (**)(id, id))a4 + 2))(a4, v9);
    [v9 unlock];
  }
}

- (void)removeDatagramChannel:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    p_stateLock = &self->_stateLock;
    pthread_mutex_lock(&self->_stateLock);
    uint64_t v6 = VCDatagramChannelIDS_Token((uint64_t)a3);
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_datagramChannels, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v6]))
    {
      id v7 = a3;
      -[NSMutableDictionary removeObjectForKey:](self->_datagramChannels, "removeObjectForKey:", [NSNumber numberWithUnsignedInt:v6]);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        id v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 136315906;
          uint64_t v14 = v8;
          __int16 v15 = 2080;
          uint64_t v16 = "-[VCDatagramChannelManager removeDatagramChannel:]";
          __int16 v17 = 1024;
          int v18 = 251;
          __int16 v19 = 1024;
          LODWORD(v20) = v6;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCDatagramChannelManager: removed datagram channel with token=%d", (uint8_t *)&v13, 0x22u);
        }
      }
      if ([a3 destination])
      {
        if (-[NSMutableDictionary objectForKeyedSubscript:](self->_destinations, "objectForKeyedSubscript:", [a3 destination]))
        {
          -[NSMutableDictionary removeObjectForKey:](self->_destinations, "removeObjectForKey:", [a3 destination]);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v10 = VRTraceErrorLogLevelToCSTR();
            uint64_t v11 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              if ([a3 destination]) {
                __int16 v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "destination"), "description"), "UTF8String");
              }
              else {
                __int16 v12 = "<nil>";
              }
              int v13 = 136315906;
              uint64_t v14 = v10;
              __int16 v15 = 2080;
              uint64_t v16 = "-[VCDatagramChannelManager removeDatagramChannel:]";
              __int16 v17 = 1024;
              int v18 = 255;
              __int16 v19 = 2080;
              int v20 = v12;
              _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCDatagramChannelManager: removed destination=%s", (uint8_t *)&v13, 0x26u);
            }
          }
        }
      }
      pthread_mutex_unlock(p_stateLock);
      [a3 invalidate];
    }
    else
    {
      pthread_mutex_unlock(p_stateLock);
    }
  }
}

- (void)removeDatagramChannels
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  pthread_mutex_lock(&self->_stateLock);
  datagramChannels = self->_datagramChannels;
  if (datagramChannels)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = (id)[(NSMutableDictionary *)datagramChannels allKeys];
    uint64_t v4 = [obj countByEnumeratingWithState:&v32 objects:v31 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v33 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          if (-[NSMutableDictionary objectForKeyedSubscript:](self->_datagramChannels, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v8]))
          {
            id v9 = (void *)-[NSMutableDictionary objectForKey:](self->_datagramChannels, "objectForKey:", [NSNumber numberWithUnsignedInt:v8]);
            if ([v9 destination])
            {
              if (-[NSMutableDictionary objectForKeyedSubscript:](self->_destinations, "objectForKeyedSubscript:", [v9 destination]))
              {
                -[NSMutableDictionary removeObjectForKey:](self->_destinations, "removeObjectForKey:", [v9 destination]);
                if ((int)VRTraceGetErrorLogLevelForModule() > 6)
                {
                  uint64_t v10 = VRTraceErrorLogLevelToCSTR();
                  uint64_t v11 = *MEMORY[0x1E4F47A50];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                  {
                    if ([v9 destination]) {
                      __int16 v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "destination"), "description"), "UTF8String");
                    }
                    else {
                      __int16 v12 = "<nil>";
                    }
                    *(_DWORD *)buf = 136315906;
                    uint64_t v24 = v10;
                    __int16 v25 = 2080;
                    uint64_t v26 = "-[VCDatagramChannelManager removeDatagramChannels]";
                    __int16 v27 = 1024;
                    int v28 = 282;
                    __int16 v29 = 2080;
                    int v30 = v12;
                    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCDatagramChannelManager: removed destination=%s", buf, 0x26u);
                  }
                }
              }
            }
            [v9 invalidate];
            -[NSMutableDictionary removeObjectForKey:](self->_datagramChannels, "removeObjectForKey:", [NSNumber numberWithUnsignedInt:v8]);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              uint64_t v17 = VRTraceErrorLogLevelToCSTR();
              int v18 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                uint64_t v24 = v17;
                __int16 v25 = 2080;
                uint64_t v26 = "-[VCDatagramChannelManager removeDatagramChannels]";
                __int16 v27 = 1024;
                int v28 = 286;
                __int16 v29 = 1024;
                LODWORD(v30) = v8;
                __int16 v15 = v18;
                uint64_t v16 = " [%s] %s:%d VCDatagramChannelManager: removed datagram channel with token=%d";
                goto LABEL_22;
              }
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v13 = VRTraceErrorLogLevelToCSTR();
            uint64_t v14 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              uint64_t v24 = v13;
              __int16 v25 = 2080;
              uint64_t v26 = "-[VCDatagramChannelManager removeDatagramChannels]";
              __int16 v27 = 1024;
              int v28 = 276;
              __int16 v29 = 1024;
              LODWORD(v30) = v8;
              __int16 v15 = v14;
              uint64_t v16 = " [%s] %s:%d VCDatagramChannelManager: _datagramChannels[@(token=%d)] is nil";
LABEL_22:
              _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0x22u);
              continue;
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v31 count:16];
      }
      while (v5);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    int v20 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v24 = v19;
      __int16 v25 = 2080;
      uint64_t v26 = "-[VCDatagramChannelManager removeDatagramChannels]";
      __int16 v27 = 1024;
      int v28 = 270;
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCDatagramChannelManager: _datagramChannels == nil", buf, 0x1Cu);
    }
  }
  pthread_mutex_unlock(p_stateLock);
}

- (id)datagramChannels
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  datagramChannels = self->_datagramChannels;

  return (id)[v3 initWithDictionary:datagramChannels];
}

- (id)destinations
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  destinations = self->_destinations;

  return (id)[v3 initWithDictionary:destinations];
}

- (id)readHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setReadHandler:(id)a3
{
}

- (void)addDatagramChannelWithDescriptor:eventHandler:writeCompletionHandler:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d eventHandler must not be nil", v2, v3, v4, v5, v6);
}

- (void)addDatagramChannelWithDescriptor:eventHandler:writeCompletionHandler:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d DatagramChannel setup failed", v2, v3, v4, v5, v6);
}

- (void)addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d destination must not be nil", v2, v3, v4, v5, v6);
}

- (void)addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d eventHandler must not be nil", v2, v3, v4, v5, v6);
}

- (void)addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Setup EmulatedDatagramChannel failed", v2, v3, v4, v5, v6);
}

- (void)addDatagramChannelWithDestination:eventHandler:writeCompletionHandler:dataPath:error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d DatagramChannel setup failed", v2, v3, v4, v5, v6);
}

@end