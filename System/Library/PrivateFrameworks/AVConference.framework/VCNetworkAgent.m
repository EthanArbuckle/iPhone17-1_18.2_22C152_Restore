@interface VCNetworkAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
+ (id)sharedInstance;
- (BOOL)addMediaInformationAssertion:(id)a3;
- (BOOL)clearMediaInformationAssertion;
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isSpecificUseOnly;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (NSString)agentDescription;
- (NSUUID)agentUUID;
- (VCNetworkAgent)init;
- (const)textString:(id)a3;
- (id)copyAgentData;
- (int)getNetworkAgentRefCount;
- (unint64_t)textStringLength:(id)a3;
- (void)addAssertion;
- (void)dealloc;
- (void)removeAssertion;
- (void)setActive:(BOOL)a3;
- (void)setAgentDescription:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setKernelActivated:(BOOL)a3;
- (void)setSpecificUseOnly:(BOOL)a3;
- (void)setUserActivated:(BOOL)a3;
- (void)setVoluntary:(BOOL)a3;
@end

@implementation VCNetworkAgent

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_13 != -1) {
    dispatch_once(&sharedInstance_onceToken_13, &__block_literal_global_77);
  }
  return (id)sharedInstance_sharedInstance_0;
}

VCNetworkAgent *__32__VCNetworkAgent_sharedInstance__block_invoke()
{
  result = objc_alloc_init(VCNetworkAgent);
  sharedInstance_sharedInstance_0 = (uint64_t)result;
  return result;
}

- (VCNetworkAgent)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCNetworkAgent;
  v2 = [(VCNetworkAgent *)&v4 init];
  if (v2) {
    v2->agentUUID = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A2CB4344-1CC7-47EF-8D25-FB68B047620F"];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_assertionRefCount >= 1)
  {
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    objc_super v4 = (os_log_t *)MEMORY[0x1E4F47A50];
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v12 = v5;
        __int16 v13 = 2080;
        v14 = "-[VCNetworkAgent dealloc]";
        __int16 v15 = 1024;
        int v16 = 92;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Un-asserting NetworkAgent", buf, 0x1Cu);
      }
    }
    int v7 = [MEMORY[0x1E4F38C00] removeActiveAssertionFromNetworkAgent:self];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v12 = v8;
        __int16 v13 = 2080;
        v14 = "-[VCNetworkAgent dealloc]";
        __int16 v15 = 1024;
        int v16 = 94;
        __int16 v17 = 1024;
        int v18 = v7;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent has been un-asserted, result=%d", buf, 0x22u);
      }
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)VCNetworkAgent;
  [(VCNetworkAgent *)&v10 dealloc];
}

- (void)addAssertion
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (!self->_assertionRefCount)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      objc_super v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315650;
        uint64_t v12 = v3;
        __int16 v13 = 2080;
        v14 = "-[VCNetworkAgent addAssertion]";
        __int16 v15 = 1024;
        int v16 = 107;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Creating an instance of NetworkAgent and asserting it", (uint8_t *)&v11, 0x1Cu);
      }
    }
    int v5 = [MEMORY[0x1E4F38C00] addActiveAssertionToNetworkAgent:self];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      int v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315906;
        uint64_t v12 = v6;
        __int16 v13 = 2080;
        v14 = "-[VCNetworkAgent addAssertion]";
        __int16 v15 = 1024;
        int v16 = 109;
        __int16 v17 = 1024;
        int v18 = v5;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent has been asserted, result=%d", (uint8_t *)&v11, 0x22u);
      }
    }
  }
  ++self->_assertionRefCount;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int assertionRefCount = self->_assertionRefCount;
      int v11 = 136315906;
      uint64_t v12 = v8;
      __int16 v13 = 2080;
      v14 = "-[VCNetworkAgent addAssertion]";
      __int16 v15 = 1024;
      int v16 = 112;
      __int16 v17 = 1024;
      int v18 = assertionRefCount;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent refcount is '%d'", (uint8_t *)&v11, 0x22u);
    }
  }
  objc_sync_exit(self);
}

- (void)removeAssertion
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  int assertionRefCount = self->_assertionRefCount;
  BOOL v4 = __OFSUB__(assertionRefCount, 1);
  int v5 = assertionRefCount - 1;
  if (v5 < 0 == v4)
  {
    self->_int assertionRefCount = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      int v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = self->_assertionRefCount;
        int v14 = 136315906;
        uint64_t v15 = v6;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCNetworkAgent removeAssertion]";
        __int16 v18 = 1024;
        int v19 = 122;
        __int16 v20 = 1024;
        int v21 = v8;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent refcount is '%d'", (uint8_t *)&v14, 0x22u);
      }
    }
    if (!self->_assertionRefCount)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        objc_super v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136315650;
          uint64_t v15 = v9;
          __int16 v16 = 2080;
          __int16 v17 = "-[VCNetworkAgent removeAssertion]";
          __int16 v18 = 1024;
          int v19 = 127;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Un-asserting NetworkAgent", (uint8_t *)&v14, 0x1Cu);
        }
      }
      int v11 = [MEMORY[0x1E4F38C00] removeActiveAssertionFromNetworkAgent:self];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        __int16 v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136315906;
          uint64_t v15 = v12;
          __int16 v16 = 2080;
          __int16 v17 = "-[VCNetworkAgent removeAssertion]";
          __int16 v18 = 1024;
          int v19 = 129;
          __int16 v20 = 1024;
          int v21 = v11;
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent has been un-asserted, result=%d", (uint8_t *)&v14, 0x22u);
        }
      }
    }
  }
  objc_sync_exit(self);
}

- (const)textString:(id)a3
{
  return (const char *)[a3 UTF8String];
}

- (unint64_t)textStringLength:(id)a3
{
  return [a3 lengthOfBytesUsingEncoding:4];
}

- (BOOL)clearMediaInformationAssertion
{
  return 1;
}

- (BOOL)addMediaInformationAssertion:(id)a3
{
  return 1;
}

- (int)getNetworkAgentRefCount
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    BOOL v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int assertionRefCount = self->_assertionRefCount;
      int v8 = 136315906;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      int v11 = "-[VCNetworkAgent getNetworkAgentRefCount]";
      __int16 v12 = 1024;
      int v13 = 259;
      __int16 v14 = 1024;
      int v15 = assertionRefCount;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent refcount is=%d", (uint8_t *)&v8, 0x22u);
    }
  }
  int v6 = self->_assertionRefCount;
  objc_sync_exit(self);
  return v6;
}

+ (id)agentDomain
{
  return @"WiFiManager";
}

+ (id)agentType
{
  return @"CallInProgress";
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

- (id)copyAgentData
{
  return 0;
}

- (NSString)agentDescription
{
  return self->agentDescription;
}

- (void)setAgentDescription:(id)a3
{
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isVoluntary
{
  return self->voluntary;
}

- (void)setVoluntary:(BOOL)a3
{
  self->voluntary = a3;
}

- (BOOL)isSpecificUseOnly
{
  return self->specificUseOnly;
}

- (void)setSpecificUseOnly:(BOOL)a3
{
  self->specificUseOnly = a3;
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
}

@end