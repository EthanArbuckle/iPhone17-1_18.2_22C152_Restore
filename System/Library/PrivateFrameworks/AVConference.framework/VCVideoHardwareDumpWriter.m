@interface VCVideoHardwareDumpWriter
+ (id)sharedInstance;
- (VCVideoHardwareDumpWriter)init;
- (void)dealloc;
- (void)init;
@end

@implementation VCVideoHardwareDumpWriter

+ (id)sharedInstance
{
  if (sharedInstance_token != -1) {
    dispatch_once(&sharedInstance_token, &__block_literal_global_3);
  }
  return (id)sharedInstance__vcVideoHardwareDumpWriterSingleton;
}

void __43__VCVideoHardwareDumpWriter_sharedInstance__block_invoke()
{
  if (!sharedInstance__vcVideoHardwareDumpWriterSingleton) {
    sharedInstance__vcVideoHardwareDumpWriterSingleton = objc_alloc_init(VCVideoHardwareDumpWriter);
  }
}

- (VCVideoHardwareDumpWriter)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCVideoHardwareDumpWriter;
  v2 = [(VCVideoHardwareDumpWriter *)&v5 init];
  if (!v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoHardwareDumpWriter init]();
      }
    }
    goto LABEL_12;
  }
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D548]);
  v2->_sources = Mutable;
  if (!Mutable)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoHardwareDumpWriter init]();
      }
    }
    goto LABEL_12;
  }
  if (!VCVideoHardwareDumpWriter_OpenDumpFile((uint64_t)v2))
  {
LABEL_12:

    return 0;
  }
  v2->_registrationLock._os_unfair_lock_opaque = 0;
  return v2;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  sources = self->_sources;
  if (sources) {
    CFRelease(sources);
  }
  VCVideoHardwareDumpWriter_CloseDumpFile((uint64_t)self, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v10.receiver = self;
  v10.super_class = (Class)VCVideoHardwareDumpWriter;
  [(VCVideoHardwareDumpWriter *)&v10 dealloc];
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate writer set", v2, v3, v4, v5, v6);
}

@end