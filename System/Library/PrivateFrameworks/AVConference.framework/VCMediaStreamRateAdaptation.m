@interface VCMediaStreamRateAdaptation
+ (unsigned)resolvePolicyForCurrentConnection:(id)a3;
- (AVCRateController)vcrcRateController;
- (BOOL)start;
- (BOOL)stop;
- (BOOL)updateRateControlWithNetworkNotification:(tagVCNWConnectionNotification *)a3;
- (VCMediaStreamRateAdaptation)initWithDelegate:(id)a3 params:(const tagVCMediaStreamRateAdaptationParams *)a4;
- (void)configureRateControllerWithConfig:(const tagVCMediaStreamRateAdaptationConfig *)a3;
- (void)dealloc;
- (void)rateController:(id)a3 targetBitrateDidChange:(unsigned int)a4 rateChangeCounter:(unsigned int)a5;
- (void)start;
@end

@implementation VCMediaStreamRateAdaptation

- (VCMediaStreamRateAdaptation)initWithDelegate:(id)a3 params:(const tagVCMediaStreamRateAdaptationParams *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)VCMediaStreamRateAdaptation;
  v5 = [(VCMediaStreamRateAdaptation *)&v16 init];
  if (v5)
  {
    FigCFWeakReferenceStore();
    v5->_mode = a4->var3;
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v12 = v6;
    long long v13 = v6;
    long long v14 = v6;
    id var0 = a4->var0;
    LOWORD(v12) = 256;
    var2 = a4->var2;
    *((void *)&v12 + 1) = 0;
    *(void *)&long long v13 = var2;
    BYTE8(v13) = 1;
    *(void *)&long long v14 = 0;
    BYTE8(v14) = 0;
    id v15 = [+[VCRateControllerManager sharedInstance](VCRateControllerManager, "sharedInstance") getRateControllerSharingGroupWithConnection:a4->var9 usePolicy:+[VCMediaStreamRateAdaptation resolvePolicyForCurrentConnection:a4->var9]];
    v8 = [[AVCRateController alloc] initWithDelegate:v5 params:&var0];
    v5->_vcrcRateController = v8;
    if (v8)
    {
      [(VCMediaStreamRateAdaptation *)v5 configureRateControllerWithConfig:&a4->var4];
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStreamRateAdaptation initWithDelegate:params:](v9);
        }
      }

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  FigCFWeakReferenceStore();

  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamRateAdaptation;
  [(VCMediaStreamRateAdaptation *)&v3 dealloc];
}

+ (unsigned)resolvePolicyForCurrentConnection:(id)a3
{
  return objc_opt_isKindOfClass() & 1;
}

- (void)configureRateControllerWithConfig:(const tagVCMediaStreamRateAdaptationConfig *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  p_int mode = &self->_mode;
  int mode = self->_mode;
  if (mode == 3)
  {
    unsigned int var2 = a3->var1.var0.var2;
    if (a3->var1.var0.var3 == 2) {
      int v13 = 9;
    }
    else {
      int v13 = 8;
    }
    int v14 = (a3->var1.var0.var3 == 2) << 13;
    if (a3->var1.var1.var4) {
      int v14 = ((a3->var1.var0.var3 == 2) << 13) | 0x10000;
    }
    memset(v28, 170, sizeof(v28));
    vcrcRateController = self->_vcrcRateController;
    v24[1] = 0;
    v24[2] = 0;
    v24[0] = v13;
    uint64_t v25 = *(void *)&a3->var1.var0.var0;
    unsigned int v26 = var2;
    char v27 = 0;
    uint64_t v29 = 0;
    int v30 = v14;
    int v31 = -1431655766;
    v11 = v24;
    goto LABEL_10;
  }
  if (mode == 1)
  {
    unsigned int var1 = a3->var1.var0.var1;
    unsigned int var3 = a3->var1.var0.var3;
    LODWORD(v3) = a3->var1.var0.var0;
    LODWORD(v4) = a3->var1.var0.var2;
    bzero(v24, 0x3F0uLL);
    unsigned int v32 = var1;
    unsigned int v33 = var3;
    double v34 = (double)v3;
    double v35 = (double)v4;
    vcrcRateController = self->_vcrcRateController;
    int v17 = 10;
    uint64_t v18 = 0;
    uint64_t v20 = 0;
    uint64_t v19 = 0;
    int v21 = 0;
    v22 = v24;
    uint64_t v23 = 0;
    v11 = &v17;
LABEL_10:
    [(AVCRateController *)vcrcRateController configure:v11];
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    objc_super v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      [(VCMediaStreamRateAdaptation *)v15 configureRateControllerWithConfig:v16];
    }
  }
}

- (BOOL)start
{
  unint64_t v3 = (VCMediaStreamRateAdaptationDelegate *)MEMORY[0x1E4E56580](&self->_delegateWeak, a2);
  self->_delegate = v3;
  if (v3)
  {
    vcrcRateController = self->_vcrcRateController;
    return [(AVCRateController *)vcrcRateController start];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStreamRateAdaptation start](v6);
      }
    }
    return 0;
  }
}

- (BOOL)stop
{
  delegate = self->_delegate;
  if (delegate)
  {
    CFRelease(delegate);
    self->_delegate = 0;
  }
  vcrcRateController = self->_vcrcRateController;

  return [(AVCRateController *)vcrcRateController stop];
}

- (BOOL)updateRateControlWithNetworkNotification:(tagVCNWConnectionNotification *)a3
{
  return 1;
}

- (void)rateController:(id)a3 targetBitrateDidChange:(unsigned int)a4 rateChangeCounter:(unsigned int)a5
{
  if (self->_vcrcRateController == a3) {
    [(VCMediaStreamRateAdaptationDelegate *)self->_delegate rateAdaptation:self targetBitrateDidChange:*(void *)&a4 rateChangeCounter:*(void *)&a5];
  }
}

- (AVCRateController)vcrcRateController
{
  return self->_vcrcRateController;
}

- (void)initWithDelegate:(uint64_t)a1 params:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 45;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot create rate controller!", (uint8_t *)&v2, 0x1Cu);
}

- (void)configureRateControllerWithConfig:(os_log_t)log .cold.1(uint64_t a1, int *a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = *a2;
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  v7 = "-[VCMediaStreamRateAdaptation configureRateControllerWithConfig:]";
  __int16 v8 = 1024;
  int v9 = 103;
  __int16 v10 = 1024;
  int v11 = v3;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d mode=%d is not supported yet", (uint8_t *)&v4, 0x22u);
}

- (void)start
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 111;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot load and retain delegate successfully!", (uint8_t *)&v2, 0x1Cu);
}

@end