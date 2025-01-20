@interface VCNetworkSimulator
+ (id)sharedInstance;
- (VCEmulatedNetwork)network;
- (VCNetworkSimulator)init;
- (id)createDefaultPolicies;
- (id)loadPoliciesFromJson;
- (int)processNetwork;
- (int)waitForCondition:(_opaque_pthread_cond_t *)a3 withTimeout:(double)a4 conditionPredicate:(BOOL *)a5;
- (void)dealloc;
- (void)loadPoliciesFromJson;
- (void)setupNetwork;
- (void)start;
- (void)stop;
@end

@implementation VCNetworkSimulator

- (VCNetworkSimulator)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCNetworkSimulator;
  v2 = [(VCNetworkSimulator *)&v5 init];
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_mutex, 0);
    pthread_cond_init(&v3->_packetPushedCondition, 0);
    pthread_cond_init(&v3->_queueEmptyCondition, 0);
  }
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_10 != -1) {
    dispatch_once(&sharedInstance_onceToken_10, &__block_literal_global_61);
  }
  return (id)sharedInstance_sharedNetworkSimulator;
}

VCNetworkSimulator *__36__VCNetworkSimulator_sharedInstance__block_invoke()
{
  result = objc_alloc_init(VCNetworkSimulator);
  sharedInstance_sharedNetworkSimulator = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  pthread_mutex_destroy(&self->_mutex);
  pthread_cond_destroy(&self->_packetPushedCondition);
  pthread_cond_destroy(&self->_queueEmptyCondition);
  v3.receiver = self;
  v3.super_class = (Class)VCNetworkSimulator;
  [(VCNetworkSimulator *)&v3 dealloc];
}

- (id)createDefaultPolicies
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v16 = @"SingleQueueImpairments";
  v12[0] = @"time";
  v12[1] = @"value";
  v13[0] = &unk_1F3DC7860;
  v13[1] = &unk_1F3DC7878;
  v14 = @"FixedBandwidth";
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v17[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v2 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      v9 = "-[VCNetworkSimulator createDefaultPolicies]";
      __int16 v10 = 1024;
      int v11 = 82;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Using default json policies.", (uint8_t *)&v6, 0x1Cu);
    }
  }
  return v2;
}

- (id)loadPoliciesFromJson
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v20 = 0;
  uint64_t v3 = objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "emulatedNetworkConfigPath");
  unint64_t v4 = (unint64_t)VCDefaults_CopyStringValueForKey(@"emulatedNetworkConfigJSONString");
  if (!(v3 | v4))
  {
    if ((VCNetworkSimulator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCNetworkSimulator loadPoliciesFromJson]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v9 = (__CFString *)[(VCNetworkSimulator *)self performSelector:sel_logPrefix];
      }
      else {
        v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v22 = v11;
          __int16 v23 = 2080;
          v24 = "-[VCNetworkSimulator loadPoliciesFromJson]";
          __int16 v25 = 1024;
          int v26 = 94;
          __int16 v27 = 2112;
          uint64_t v28 = (uint64_t)v9;
          __int16 v29 = 2048;
          v30 = self;
          v13 = " [%s] %s:%d %@(%p) Error loading json config.";
          goto LABEL_33;
        }
      }
    }
LABEL_41:
    id v7 = [(VCNetworkSimulator *)self createDefaultPolicies];
    if (!v4) {
      return v7;
    }
    goto LABEL_11;
  }
  if (v3 && [(id)v3 length])
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3 options:0 error:&v20];
    if (!v5)
    {
      if ((VCNetworkSimulator *)objc_opt_class() != self)
      {
        if (objc_opt_respondsToSelector()) {
          int v6 = (__CFString *)[(VCNetworkSimulator *)self performSelector:sel_logPrefix];
        }
        else {
          int v6 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_41;
        }
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_41;
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v22 = v18;
        __int16 v23 = 2080;
        v24 = "-[VCNetworkSimulator loadPoliciesFromJson]";
        __int16 v25 = 1024;
        int v26 = 98;
        __int16 v27 = 2112;
        uint64_t v28 = (uint64_t)v6;
        __int16 v29 = 2048;
        v30 = self;
        __int16 v31 = 2112;
        uint64_t v32 = v3;
        __int16 v33 = 2112;
        v34 = v20;
        v13 = " [%s] %s:%d %@(%p) Error loading json policies from path=%@ error=%@";
        uint64_t v15 = v19;
        uint32_t v16 = 68;
LABEL_34:
        _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, v13, buf, v16);
        goto LABEL_41;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_41;
      }
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_41;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v22 = v17;
      __int16 v23 = 2080;
      v24 = "-[VCNetworkSimulator loadPoliciesFromJson]";
      __int16 v25 = 1024;
      int v26 = 98;
      __int16 v27 = 2112;
      uint64_t v28 = v3;
      __int16 v29 = 2112;
      v30 = v20;
      v13 = " [%s] %s:%d Error loading json policies from path=%@ error=%@";
LABEL_33:
      uint64_t v15 = v12;
      uint32_t v16 = 48;
      goto LABEL_34;
    }
  }
  else
  {
    uint64_t v5 = [(id)v4 dataUsingEncoding:4];
  }
  id v7 = (id)[MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:0];
  if (!v7)
  {
    if ((VCNetworkSimulator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCNetworkSimulator loadPoliciesFromJson]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v10 = (__CFString *)[(VCNetworkSimulator *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v22 = v14;
          __int16 v23 = 2080;
          v24 = "-[VCNetworkSimulator loadPoliciesFromJson]";
          __int16 v25 = 1024;
          int v26 = 103;
          __int16 v27 = 2112;
          uint64_t v28 = (uint64_t)v10;
          __int16 v29 = 2048;
          v30 = self;
          v13 = " [%s] %s:%d %@(%p) Error serializing json policies.";
          goto LABEL_33;
        }
      }
    }
    goto LABEL_41;
  }
  if (v4) {
LABEL_11:
  }
    CFRelease((CFTypeRef)v4);
  return v7;
}

- (void)setupNetwork
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create VCEmulatedNetwork", v2, v3, v4, v5, v6);
}

uint64_t __34__VCNetworkSimulator_setupNetwork__block_invoke(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 200) = 0;
  pthread_cond_signal((pthread_cond_t *)(*(void *)(a1 + 32) + 104));
  uint64_t v2 = (pthread_mutex_t *)(*(void *)(a1 + 32) + 40);

  return pthread_mutex_unlock(v2);
}

- (void)start
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCRealTimeThread_Initialize for network simulator thread FAILED", v2, v3, v4, v5, v6);
}

- (void)stop
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (self->_isStarted)
  {
    if (self->_thread)
    {
      if ([(VCEmulatedNetwork *)self->_network numberOfPacketsWaitingInOutputQueue])
      {
        [(VCNetworkSimulator *)self waitForCondition:&self->_queueEmptyCondition withTimeout:&self->_isQueueEmpty conditionPredicate:0.01];
      }
      thread = self->_thread;
      if (thread)
      {
        VCRealTimeThread_Stop((uint64_t)thread);
        VCRealTimeThread_Finalize((uint64_t)self->_thread);
        self->_thread = 0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v4 = VRTraceErrorLogLevelToCSTR();
          uint64_t v5 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v7 = 136315650;
            uint64_t v8 = v4;
            __int16 v9 = 2080;
            __int16 v10 = "-[VCNetworkSimulator stop]";
            __int16 v11 = 1024;
            int v12 = 170;
            _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCRealTimeThread_Stop for network simulator", (uint8_t *)&v7, 0x1Cu);
          }
        }
      }
    }
    network = self->_network;
    if (network)
    {

      self->_network = 0;
    }
    self->_isStarted = 0;
  }
  objc_sync_exit(self);
}

- (int)processNetwork
{
  [(VCEmulatedNetwork *)self->_network runUntilTime:micro()];
  while ([(VCEmulatedNetwork *)self->_network numberOfPacketsWaitingInOutputQueue])[(VCEmulatedNetwork *)self->_network copyPacketFromPop];
  pthread_mutex_lock(&self->_mutex);
  self->_isQueueEmpty = 1;
  pthread_cond_signal(&self->_queueEmptyCondition);
  pthread_mutex_unlock(&self->_mutex);

  return [(VCNetworkSimulator *)self waitForCondition:&self->_packetPushedCondition withTimeout:0 conditionPredicate:0.005];
}

- (int)waitForCondition:(_opaque_pthread_cond_t *)a3 withTimeout:(double)a4 conditionPredicate:(BOOL *)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_mutex = &self->_mutex;
  v13.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v13.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutex_lock(&self->_mutex);
  if (a4 <= 0.0)
  {
    int v10 = 60;
  }
  else
  {
    v13.tv_sec = (int)a4;
    v13.tv_nsec = (int)((a4 - (double)(int)a4) * 1000000000.0);
    do
    {
      int v9 = pthread_cond_timedwait_relative_np(a3, p_mutex, &v13);
      int v10 = v9;
      if (!a5) {
        break;
      }
    }
    while (!*a5 && v9 == 0);
  }
  pthread_mutex_unlock(p_mutex);
  return v10;
}

- (VCEmulatedNetwork)network
{
  return self->_network;
}

- (void)loadPoliciesFromJson
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error serializing json policies.", v2, v3, v4, v5, v6);
}

@end