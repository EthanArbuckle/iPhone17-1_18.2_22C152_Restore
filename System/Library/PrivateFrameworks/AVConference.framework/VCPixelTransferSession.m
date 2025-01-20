@interface VCPixelTransferSession
- (VCPixelTransferSession)init;
- (void)dealloc;
@end

@implementation VCPixelTransferSession

- (VCPixelTransferSession)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VCPixelTransferSession;
  v2 = [(VCPixelTransferSession *)&v10 init];
  v3 = v2;
  if (v2)
  {
    p_pixelTransferSession = &v2->_pixelTransferSession;
    OSStatus v5 = VTPixelTransferSessionCreate(0, &v2->_pixelTransferSession);
    if (v5 || !*p_pixelTransferSession)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          v9 = *p_pixelTransferSession;
          *(_DWORD *)buf = 136316162;
          uint64_t v12 = v6;
          __int16 v13 = 2080;
          v14 = "-[VCPixelTransferSession init]";
          __int16 v15 = 1024;
          int v16 = 26;
          __int16 v17 = 1024;
          OSStatus v18 = v5;
          __int16 v19 = 2048;
          v20 = v9;
          _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d VTPixelTransferSessionCreate failed %d (%p)", buf, 0x2Cu);
        }
      }

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  VTPixelTransferSessionInvalidate(self->_pixelTransferSession);
  CFRelease(self->_pixelTransferSession);
  v3.receiver = self;
  v3.super_class = (Class)VCPixelTransferSession;
  [(VCPixelTransferSession *)&v3 dealloc];
}

@end