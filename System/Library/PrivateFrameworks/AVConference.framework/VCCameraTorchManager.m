@interface VCCameraTorchManager
- (BOOL)openTorchDevice;
- (VCCameraTorchManager)init;
- (void)closeTorchDevice;
- (void)dealloc;
- (void)openTorchDevice;
- (void)turnTorch:(BOOL)a3;
- (void)turnTorchOff;
- (void)turnTorchOn;
@end

@implementation VCCameraTorchManager

- (VCCameraTorchManager)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)VCCameraTorchManager;
  v2 = [(VCCameraTorchManager *)&v6 init];
  if (v2)
  {
    if ([MEMORY[0x1E4F16518] hasFlashlight])
    {
      v2->_flashlight = (AVFlashlight *)objc_alloc_init(MEMORY[0x1E4F16518]);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v8 = v3;
        __int16 v9 = 2080;
        v10 = "-[VCCameraTorchManager init]";
        __int16 v11 = 1024;
        int v12 = 23;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVFlashlight is not available", buf, 0x1Cu);
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCCameraTorchManager;
  [(VCCameraTorchManager *)&v3 dealloc];
}

- (BOOL)openTorchDevice
{
  v7[1] = *MEMORY[0x1E4F143B8];
  flashlight = self->_flashlight;
  if (!flashlight) {
    return 0;
  }
  v7[0] = 0;
  char v3 = [(AVFlashlight *)flashlight turnPowerOnWithError:v7];
  if ((v3 & 1) == 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      [(VCCameraTorchManager *)v4 openTorchDevice];
    }
  }
  return v3;
}

- (void)closeTorchDevice
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_flashlight)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315650;
        uint64_t v6 = v3;
        __int16 v7 = 2080;
        uint64_t v8 = "-[VCCameraTorchManager closeTorchDevice]";
        __int16 v9 = 1024;
        int v10 = 51;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v5, 0x1Cu);
      }
    }
    [(AVFlashlight *)self->_flashlight turnPowerOff];
  }
}

- (void)turnTorchOn
{
}

- (void)turnTorchOff
{
}

- (void)turnTorch:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  flashlight = self->_flashlight;
  if (flashlight)
  {
    uint64_t v12 = 0;
    if (a3) {
      float v4 = 1.0;
    }
    else {
      float v4 = 0.0;
    }
    int v5 = [(AVFlashlight *)flashlight setFlashlightLevel:&v12 withError:COERCE_DOUBLE((unint64_t)LODWORD(v4))];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v5)
    {
      if (ErrorLogLevelForModule >= 8)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        __int16 v9 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v14 = v7;
            __int16 v15 = 2080;
            v16 = "-[VCCameraTorchManager turnTorch:]";
            __int16 v17 = 1024;
            int v18 = 70;
            __int16 v19 = 2048;
            double v20 = v4;
            _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVFlashlight setFlashlightLevel:%f", buf, 0x26u);
          }
        }
        else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          [(VCCameraTorchManager *)v7 turnTorch:v4];
        }
      }
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v14 = v10;
        __int16 v15 = 2080;
        v16 = "-[VCCameraTorchManager turnTorch:]";
        __int16 v17 = 1024;
        int v18 = 72;
        __int16 v19 = 2048;
        double v20 = v4;
        __int16 v21 = 2112;
        uint64_t v22 = v12;
        _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVFlashlight setFlashlightLevel:%f failed: %@", buf, 0x30u);
      }
    }
  }
}

- (void)openTorchDevice
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint64_t v7 = "-[VCCameraTorchManager openTorchDevice]";
  __int16 v8 = 1024;
  int v9 = 41;
  __int16 v10 = 2112;
  uint64_t v11 = v3;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVFlashlight failed to turn on: %@", (uint8_t *)&v4, 0x26u);
}

- (void)turnTorch:(float)a3 .cold.1(uint64_t a1, NSObject *a2, float a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  __int16 v6 = "-[VCCameraTorchManager turnTorch:]";
  __int16 v7 = 1024;
  int v8 = 70;
  __int16 v9 = 2048;
  double v10 = a3;
  _os_log_debug_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_DEBUG, " [%s] %s:%d AVFlashlight setFlashlightLevel:%f", (uint8_t *)&v3, 0x26u);
}

@end