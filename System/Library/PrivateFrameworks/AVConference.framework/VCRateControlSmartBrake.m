@interface VCRateControlSmartBrake
- (VCRateControlSmartBrake)init;
- (VCRateControlSmartBrake)initWithCompletionHandler:(id)a3;
- (int)bindInputBuffers;
- (int)bindLSTMBuffers;
- (int)bindOutputBuffers;
- (int)setupModel;
- (int)setupNetAndConfigFromPath:(id)a3;
- (tagVCRateControlSmartBrakeConfig)config;
- (void)bindLSTMBuffers;
- (void)compileModel;
- (void)dealloc;
- (void)init;
- (void)setupModel;
@end

@implementation VCRateControlSmartBrake

- (VCRateControlSmartBrake)init
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCRateControlSmartBrake;
  v2 = [(VCObject *)&v11 init];
  v3 = v2;
  if (!v2
    || [(VCRateControlSmartBrake *)v2 setupModel]
    || [(VCRateControlSmartBrake *)v3 bindInputBuffers]
    || [(VCRateControlSmartBrake *)v3 bindOutputBuffers]
    || [(VCRateControlSmartBrake *)v3 bindLSTMBuffers])
  {
LABEL_18:

    return 0;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v5 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCRateControlSmartBrake.compilationQueue", 0, CustomRootQueue);
  v3->_compilationQueue = (OS_dispatch_queue *)v5;
  if (!v5)
  {
    if ((VCRateControlSmartBrake *)objc_opt_class() == v3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRateControlSmartBrake init]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v6 = (__CFString *)[(VCRateControlSmartBrake *)v3 performSelector:sel_logPrefix];
      }
      else {
        v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v13 = v7;
          __int16 v14 = 2080;
          v15 = "-[VCRateControlSmartBrake init]";
          __int16 v16 = 1024;
          int v17 = 172;
          __int16 v18 = 2112;
          v19 = v6;
          __int16 v20 = 2048;
          v21 = v3;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to initialize asynchronous compilation dispatch queue", buf, 0x30u);
        }
      }
    }
    goto LABEL_18;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__VCRateControlSmartBrake_init__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = v3;
  dispatch_async(v5, block);
  return v3;
}

uint64_t __31__VCRateControlSmartBrake_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) compileModel];
}

- (VCRateControlSmartBrake)initWithCompletionHandler:(id)a3
{
  self->_completionHandler = (id)[a3 copy];

  return [(VCRateControlSmartBrake *)self init];
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  free(self->_dataLSTM);
  compilationQueue = self->_compilationQueue;
  if (compilationQueue) {
    dispatch_release(compilationQueue);
  }

  espresso_plan_destroy();
  espresso_context_destroy();
  v4.receiver = self;
  v4.super_class = (Class)VCRateControlSmartBrake;
  [(VCObject *)&v4 dealloc];
}

- (int)setupModel
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  context = (void *)espresso_create_context();
  self->_context = context;
  if (!context)
  {
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRateControlSmartBrake setupModel]();
        }
      }
      return -1;
    }
    if (objc_opt_respondsToSelector()) {
      v21 = (__CFString *)[(VCRateControlSmartBrake *)self performSelector:sel_logPrefix];
    }
    else {
      v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return -1;
    }
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return -1;
    }
    int v33 = 136316162;
    uint64_t v34 = v25;
    __int16 v35 = 2080;
    v36 = "-[VCRateControlSmartBrake setupModel]";
    __int16 v37 = 1024;
    int v38 = 212;
    __int16 v39 = 2112;
    v40 = v21;
    __int16 v41 = 2048;
    v42 = self;
    v27 = " [%s] %s:%d %@(%p) Unable to initialize espresso context";
    goto LABEL_83;
  }
  plan = (void *)espresso_create_plan();
  self->_plan = plan;
  if (!plan)
  {
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRateControlSmartBrake setupModel]();
        }
      }
      return -1;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v22 = (__CFString *)[(VCRateControlSmartBrake *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return -1;
    }
    uint64_t v28 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return -1;
    }
    int v33 = 136316162;
    uint64_t v34 = v28;
    __int16 v35 = 2080;
    v36 = "-[VCRateControlSmartBrake setupModel]";
    __int16 v37 = 1024;
    int v38 = 214;
    __int16 v39 = 2112;
    v40 = v22;
    __int16 v41 = 2048;
    v42 = self;
    v27 = " [%s] %s:%d %@(%p) Unable to initialize espresso plan";
LABEL_83:
    _os_log_error_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v33, 0x30u);
    return -1;
  }
  uint64_t v5 = (void *)[MEMORY[0x1E4FB0098] clientWithIdentifier:310];
  if (!v5)
  {
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRateControlSmartBrake setupModel].cold.6();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v10 = (__CFString *)[(VCRateControlSmartBrake *)self performSelector:sel_logPrefix];
      }
      else {
        v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v33 = 136316162;
          uint64_t v34 = v12;
          __int16 v35 = 2080;
          v36 = "-[VCRateControlSmartBrake setupModel]";
          __int16 v37 = 1024;
          int v38 = 226;
          __int16 v39 = 2112;
          v40 = v10;
          __int16 v41 = 2048;
          v42 = self;
          _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to load Trial client", (uint8_t *)&v33, 0x30u);
        }
      }
    }
    goto LABEL_27;
  }
  v6 = v5;
  uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "levelForFactor:withNamespaceName:", @"smartBrakeModel", @"AVCONFERENCE_NETWORK_SMART_BRAKE"), "directoryValue"), "path");
  if (!v7)
  {
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRateControlSmartBrake setupModel].cold.7();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        objc_super v11 = (__CFString *)[(VCRateControlSmartBrake *)self performSelector:sel_logPrefix];
      }
      else {
        objc_super v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E4F47A50];
        int v8 = -1;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v33 = 136316418;
          uint64_t v34 = v14;
          __int16 v35 = 2080;
          v36 = "-[VCRateControlSmartBrake setupModel]";
          __int16 v37 = 1024;
          int v38 = 223;
          __int16 v39 = 2112;
          v40 = v11;
          __int16 v41 = 2048;
          v42 = self;
          __int16 v43 = 1024;
          int v44 = -1;
          _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to load Trial client, switch to bundled model instead returnStatus=%d", (uint8_t *)&v33, 0x36u);
        }
        goto LABEL_28;
      }
    }
LABEL_27:
    int v8 = -1;
    goto LABEL_28;
  }
  int v8 = [(VCRateControlSmartBrake *)self setupNetAndConfigFromPath:v7];
  if (!v8)
  {
    LOBYTE(v9) = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "levelForFactor:withNamespaceName:", @"smartBrakeModel", @"AVCONFERENCE_NETWORK_SMART_BRAKE"), "metadata"), "valueForKey:", @"version"), "intValue");
    goto LABEL_39;
  }
LABEL_28:
  if ((VCRateControlSmartBrake *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCRateControlSmartBrake setupModel].cold.5();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v16 = (__CFString *)[(VCRateControlSmartBrake *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v16 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      __int16 v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v33 = 136316418;
        uint64_t v34 = v17;
        __int16 v35 = 2080;
        v36 = "-[VCRateControlSmartBrake setupModel]";
        __int16 v37 = 1024;
        int v38 = 231;
        __int16 v39 = 2112;
        v40 = v16;
        __int16 v41 = 2048;
        v42 = self;
        __int16 v43 = 1024;
        int v44 = v8;
        _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to load Trial model, switch to bundled model instead returnStatus=%d", (uint8_t *)&v33, 0x36u);
      }
    }
  }
  int v9 = [(VCRateControlSmartBrake *)self setupNetAndConfigFromPath:0];
  if (!v9)
  {
LABEL_39:
    self->_config.trialVersion = v9;
    int v19 = espresso_plan_build();
    if (!v19) {
      return v19;
    }
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRateControlSmartBrake setupModel]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v23 = (__CFString *)[(VCRateControlSmartBrake *)self performSelector:sel_logPrefix];
      }
      else {
        v23 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v29 = VRTraceErrorLogLevelToCSTR();
        v30 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v33 = 136316418;
          uint64_t v34 = v29;
          __int16 v35 = 2080;
          v36 = "-[VCRateControlSmartBrake setupModel]";
          __int16 v37 = 1024;
          int v38 = 242;
          __int16 v39 = 2112;
          v40 = v23;
          __int16 v41 = 2048;
          v42 = self;
          __int16 v43 = 1024;
          int v44 = v19;
          v31 = " [%s] %s:%d %@(%p) Unable to build espresso plan, returnStatus=%d";
LABEL_81:
          _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, v31, (uint8_t *)&v33, 0x36u);
          return v19;
        }
      }
    }
    return v19;
  }
  int v19 = v9;
  if ((VCRateControlSmartBrake *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCRateControlSmartBrake setupModel].cold.4();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v24 = (__CFString *)[(VCRateControlSmartBrake *)self performSelector:sel_logPrefix];
    }
    else {
      v24 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v32 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v33 = 136316418;
        uint64_t v34 = v32;
        __int16 v35 = 2080;
        v36 = "-[VCRateControlSmartBrake setupModel]";
        __int16 v37 = 1024;
        int v38 = 234;
        __int16 v39 = 2112;
        v40 = v24;
        __int16 v41 = 2048;
        v42 = self;
        __int16 v43 = 1024;
        int v44 = v19;
        v31 = " [%s] %s:%d %@(%p) Unable to load Bundled model returnStatus=%d";
        goto LABEL_81;
      }
    }
  }
  return v19;
}

- (int)setupNetAndConfigFromPath:(id)a3
{
  id v3 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    id v3 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", @"smartBrakeModel", 0);
  }
  uint64_t v5 = [v3 stringByAppendingPathComponent:@"params.plist"];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v5];
  if (!v6)
  {
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRateControlSmartBrake setupNetAndConfigFromPath:]();
        }
      }
      return -2;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v18 = (__CFString *)[(VCRateControlSmartBrake *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return -2;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return -2;
    }
    int v22 = 136316418;
    uint64_t v23 = v19;
    __int16 v24 = 2080;
    uint64_t v25 = "-[VCRateControlSmartBrake setupNetAndConfigFromPath:]";
    __int16 v26 = 1024;
    int v27 = 258;
    __int16 v28 = 2112;
    uint64_t v29 = v18;
    __int16 v30 = 2048;
    v31 = self;
    __int16 v32 = 2112;
    uint64_t v33 = v5;
    uint64_t v17 = " [%s] %s:%d %@(%p) Unable to load config file from configPath=%@";
    goto LABEL_23;
  }
  uint64_t v7 = v6;
  objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"probabilityThresholdOn"), "floatValue");
  self->_config.thresholdOn = v8;
  objc_msgSend((id)objc_msgSend(v7, "objectForKey:", @"probabilityThresholdOff"), "floatValue");
  self->_config.thresholdOff = v9;
  self->_config.nBandwidthSigmas = (float)(int)objc_msgSend((id)objc_msgSend(v7, "objectForKey:", @"nBandwidthSigmas"), "intValue");

  if (self->_config.thresholdOff == 0.0 || self->_config.thresholdOn == 0.0 || self->_config.nBandwidthSigmas == 0.0)
  {
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRateControlSmartBrake setupNetAndConfigFromPath:]();
        }
      }
      return -2;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v13 = (__CFString *)[(VCRateControlSmartBrake *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return -2;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return -2;
    }
    int v22 = 136316418;
    uint64_t v23 = v14;
    __int16 v24 = 2080;
    uint64_t v25 = "-[VCRateControlSmartBrake setupNetAndConfigFromPath:]";
    __int16 v26 = 1024;
    int v27 = 265;
    __int16 v28 = 2112;
    uint64_t v29 = v13;
    __int16 v30 = 2048;
    v31 = self;
    __int16 v32 = 2112;
    uint64_t v33 = v5;
    uint64_t v17 = " [%s] %s:%d %@(%p) Unable to format model config file from configPath=%@";
LABEL_23:
    _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v22, 0x3Au);
    return -2;
  }
  v10 = (void *)[v3 stringByAppendingPathComponent:@"model.espresso.net"];
  [v10 UTF8String];
  int v11 = espresso_plan_add_network();
  if (v11)
  {
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRateControlSmartBrake setupNetAndConfigFromPath:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v12 = (__CFString *)[(VCRateControlSmartBrake *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v22 = 136316418;
          uint64_t v23 = v20;
          __int16 v24 = 2080;
          uint64_t v25 = "-[VCRateControlSmartBrake setupNetAndConfigFromPath:]";
          __int16 v26 = 1024;
          int v27 = 270;
          __int16 v28 = 2112;
          uint64_t v29 = v12;
          __int16 v30 = 2048;
          v31 = self;
          __int16 v32 = 2112;
          uint64_t v33 = (uint64_t)v10;
          _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to format load espresso net file from netPath=%@", (uint8_t *)&v22, 0x3Au);
        }
      }
    }
  }
  return v11;
}

- (int)bindInputBuffers
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v6 = xmmword_1E259EC90;
  p_inputBuffers = &self->_inputBuffers;
  p_inputTensor = &self->_inputTensor;
  int result = _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&self->_inputBuffers, (__CFString *)"time", (uint64_t)&v6, 2, (uint64_t)&self->_inputTensor);
  if (!result)
  {
    int result = _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&p_inputBuffers->bitrate, (__CFString *)"bitrate", (uint64_t)&v6, 2, (uint64_t)&p_inputTensor->bitrate);
    if (!result)
    {
      int result = _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&p_inputBuffers->RTT, (__CFString *)"RTT", (uint64_t)&v6, 2, (uint64_t)&p_inputTensor->RTT);
      if (!result)
      {
        int result = _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&p_inputBuffers->OWRD, (__CFString *)"OWRD", (uint64_t)&v6, 2, (uint64_t)&p_inputTensor->OWRD);
        if (!result)
        {
          int result = _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&p_inputBuffers->APLR, (__CFString *)"APLR", (uint64_t)&v6, 2, (uint64_t)&p_inputTensor->APLR);
          if (!result) {
            return _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&p_inputBuffers->VPLR, (__CFString *)"VPLR", (uint64_t)&v6, 2, (uint64_t)&p_inputTensor->VPLR);
          }
        }
      }
    }
  }
  return result;
}

- (int)bindOutputBuffers
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v6 = xmmword_1E259EC90;
  p_outputBuffers = &self->_outputBuffers;
  p_outputTensor = &self->_outputTensor;
  int result = _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&self->_outputBuffers, (__CFString *)"networkCongestionProbability", (uint64_t)&v6, 2, (uint64_t)&self->_outputTensor);
  if (!result)
  {
    int result = _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&p_outputBuffers->bandwidth, (__CFString *)"bandwidth", (uint64_t)&v6, 2, (uint64_t)&p_outputTensor->bandwidth);
    if (!result) {
      return _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&p_outputBuffers->bandwidthSigma, (__CFString *)"bandwidthSigma", (uint64_t)&v6, 2, (uint64_t)&p_outputTensor->bandwidthSigma);
    }
  }
  return result;
}

- (int)bindLSTMBuffers
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30[0] = v3;
  v30[1] = v3;
  int blob_dimensions = espresso_network_query_blob_dimensions();
  if (blob_dimensions)
  {
    int v11 = blob_dimensions;
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRateControlSmartBrake bindLSTMBuffers]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v13 = (__CFString *)[(VCRateControlSmartBrake *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v16 = 136316674;
          uint64_t v17 = v14;
          __int16 v18 = 2080;
          uint64_t v19 = "-[VCRateControlSmartBrake bindLSTMBuffers]";
          __int16 v20 = 1024;
          int v21 = 325;
          __int16 v22 = 2112;
          uint64_t v23 = v13;
          __int16 v24 = 2048;
          uint64_t v25 = self;
          __int16 v26 = 2080;
          int v27 = "LSTMStateIn";
          __int16 v28 = 1024;
          int v29 = v11;
          _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to read %s buffer shape, returnStatus=%d", (uint8_t *)&v16, 0x40u);
        }
      }
    }
  }
  else
  {
    uint64_t v5 = *((void *)&v30[0] + 1) * *(void *)&v30[0];
    self->_dataLSTMSize = *((void *)&v30[0] + 1) * *(void *)&v30[0];
    long long v6 = (float *)malloc_type_malloc(4 * v5, 0x100004052888210uLL);
    unint64_t v7 = 0;
    self->_dataLSTM = v6;
    unint64_t v8 = 3;
    do
    {
      uint64_t v9 = *((void *)v30 + v7);
      *((void *)v30 + v7) = *((void *)v30 + v8);
      *((void *)v30 + v8) = v9;
      ++v7;
      --v8;
    }
    while (v7 < v8);
    int v10 = _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&self->_bufferLSTMStateIn, (__CFString *)"LSTMStateIn", (uint64_t)v30, 4, (uint64_t)v6);
    if (!v10) {
      return _VCRateControlSmartBrake_BindEspressoBuffer(self, (uint64_t)&self->_bufferLSTMStateOut, (__CFString *)"LSTMStateOut", (uint64_t)v30, 4, (uint64_t)self->_dataLSTM);
    }
    return v10;
  }
  return v11;
}

- (void)compileModel
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  if (self->_dataLSTMSize)
  {
    unint64_t v3 = 0;
    do
      self->_dataLSTM[v3++] = 0.0;
    while (v3 < self->_dataLSTMSize);
  }
  self->_isStartTimeSet = 0.0;
  if (espresso_plan_execute_sync())
  {
    uint64_t error_info = espresso_plan_get_error_info();
    uint64_t v13 = v12;
    if ((VCRateControlSmartBrake *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_18;
      }
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      __int16 v18 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_DWORD *)uint64_t v25 = 136316418;
      *(void *)&v25[4] = v17;
      *(_WORD *)&v25[12] = 2080;
      *(void *)&v25[14] = "-[VCRateControlSmartBrake compileModel]";
      __int16 v26 = 1024;
      int v27 = 359;
      __int16 v28 = 1024;
      *(_DWORD *)int v29 = error_info;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = HIDWORD(error_info);
      *(_WORD *)__int16 v30 = 2080;
      *(void *)&_OWORD v30[2] = v13;
      uint64_t v19 = " [%s] %s:%d Error while executing neural network at compilation planStatus=%d, returnStatus=%d, description=%s";
      __int16 v20 = v18;
      uint32_t v21 = 50;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v14 = (__CFString *)[(VCRateControlSmartBrake *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_18;
      }
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      uint64_t v23 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_DWORD *)uint64_t v25 = 136316930;
      *(void *)&v25[4] = v22;
      *(_WORD *)&v25[12] = 2080;
      *(void *)&v25[14] = "-[VCRateControlSmartBrake compileModel]";
      __int16 v26 = 1024;
      int v27 = 359;
      __int16 v28 = 2112;
      *(void *)int v29 = v14;
      *(_WORD *)&v29[8] = 2048;
      *(void *)__int16 v30 = self;
      *(_WORD *)&v30[8] = 1024;
      int v31 = error_info;
      __int16 v32 = 1024;
      int v33 = HIDWORD(error_info);
      __int16 v34 = 2080;
      uint64_t v35 = v13;
      uint64_t v19 = " [%s] %s:%d %@(%p) Error while executing neural network at compilation planStatus=%d, returnStatus=%d, description=%s";
      __int16 v20 = v23;
      uint32_t v21 = 70;
    }
    _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, v19, v25, v21);
LABEL_18:
    int v16 = 2;
    goto LABEL_19;
  }
  if (self->_dataLSTMSize)
  {
    unint64_t v15 = 0;
    do
      self->_dataLSTM[v15++] = 0.0;
    while (v15 < self->_dataLSTMSize);
  }
  self->_isStartTimeSet = 0.0;
  int v16 = 1;
LABEL_19:
  self->_compilationStatus = v16;
  id completionHandler = self->_completionHandler;
  if (completionHandler) {
    (*((void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void))completionHandler
  }
     + 2))(completionHandler, v4, v5, v6, v7, v8, v9, v10, *(void *)v25, *(void *)&v25[8]);
  kdebug_trace();
}

- (tagVCRateControlSmartBrakeConfig)config
{
  p_config = &self->_config;
  uint64_t v3 = *(void *)&self->_config.thresholdOn;
  uint64_t v4 = *(void *)&p_config->nBandwidthSigmas;
  result.nBandwidthSigmas = *(float *)&v4;
  result.trialVersion = BYTE4(v4);
  result.thresholdOn = *(float *)&v3;
  result.thresholdOff = *((float *)&v3 + 1);
  return result;
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to initialize asynchronous compilation dispatch queue", v2, v3, v4, v5, v6);
}

- (void)setupModel
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  int v3 = 223;
  __int16 v4 = v0;
  int v5 = -1;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to load Trial client, switch to bundled model instead returnStatus=%d", v2, 0x22u);
}

- (void)setupNetAndConfigFromPath:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to load config file from configPath=%@");
}

- (void)setupNetAndConfigFromPath:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to format model config file from configPath=%@");
}

- (void)setupNetAndConfigFromPath:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to format load espresso net file from netPath=%@");
}

- (void)bindLSTMBuffers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  int v5 = "-[VCRateControlSmartBrake bindLSTMBuffers]";
  __int16 v6 = 1024;
  int v7 = 325;
  __int16 v8 = v0;
  uint64_t v9 = "LSTMStateIn";
  __int16 v10 = 1024;
  int v11 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to read %s buffer shape, returnStatus=%d", v3, 0x2Cu);
}

@end