@interface VCVideoHardwareDumpCollector
- (VCVideoHardwareDumpCollector)init;
- (void)dealloc;
- (void)init;
- (void)invalidate;
@end

@implementation VCVideoHardwareDumpCollector

- (VCVideoHardwareDumpCollector)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VCVideoHardwareDumpCollector;
  v2 = [(VCVideoHardwareDumpCollector *)&v12 init];
  if (!v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoHardwareDumpCollector init]();
      }
    }
    goto LABEL_38;
  }
  CFArrayRef HeadersFromCArray = VCVideoHardwareDumpCollector_CreateHeadersFromCArray((const char **)VCVideoHardwareDumpCollector_EncodingDumpHeaders, 11);
  v2->_txDumpHeaders = HeadersFromCArray;
  if (!HeadersFromCArray)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoHardwareDumpCollector init]();
      }
    }
    goto LABEL_38;
  }
  CFArrayRef v4 = VCVideoHardwareDumpCollector_CreateHeadersFromCArray((const char **)VCVideoHardwareDumpCollector_DecodingDumpHeaders, 6);
  v2->_rxDumpHeaders = v4;
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoHardwareDumpCollector init]();
      }
    }
    goto LABEL_38;
  }
  CFArrayRef v5 = VCVideoHardwareDumpCollector_CreateHeadersFromCArray((const char **)VCVideoHardwareDumpCollector_CaptureDumpHeaders, 2);
  v2->_captureDumpHeaders = v5;
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoHardwareDumpCollector init].cold.4();
      }
    }
    goto LABEL_38;
  }
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v2->_txFrameData = Mutable;
  if (!Mutable)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoHardwareDumpCollector init].cold.5();
      }
    }
    goto LABEL_38;
  }
  CFMutableDictionaryRef v8 = CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v2->_rxFrameData = v8;
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoHardwareDumpCollector init].cold.6();
      }
    }
    goto LABEL_38;
  }
  CFMutableDictionaryRef v9 = CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v2->_captureFrameData = v9;
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoHardwareDumpCollector init].cold.7();
      }
    }
    goto LABEL_38;
  }
  v10 = +[VCVideoHardwareDumpWriter sharedInstance];
  v2->_writer = v10;
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoHardwareDumpCollector init].cold.8();
      }
    }
    goto LABEL_38;
  }
  if (!VCVideoHardwareDumpWriter_RegisterSource((uint64_t)v10, v2))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoHardwareDumpCollector init].cold.9();
      }
    }
LABEL_38:

    return 0;
  }
  return v2;
}

- (void)invalidate
{
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  txDumpHeaders = self->_txDumpHeaders;
  if (txDumpHeaders) {
    CFRelease(txDumpHeaders);
  }
  rxDumpHeaders = self->_rxDumpHeaders;
  if (rxDumpHeaders) {
    CFRelease(rxDumpHeaders);
  }
  captureDumpHeaders = self->_captureDumpHeaders;
  if (captureDumpHeaders) {
    CFRelease(captureDumpHeaders);
  }
  txFrameData = self->_txFrameData;
  if (txFrameData) {
    CFRelease(txFrameData);
  }
  rxFrameData = self->_rxFrameData;
  if (rxFrameData) {
    CFRelease(rxFrameData);
  }
  captureFrameData = self->_captureFrameData;
  if (captureFrameData) {
    CFRelease(captureFrameData);
  }
  v9.receiver = self;
  v9.super_class = (Class)VCVideoHardwareDumpCollector;
  [(VCVideoHardwareDumpCollector *)&v9 dealloc];
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to register with dump writer", v2, v3, v4, v5, v6);
}

@end