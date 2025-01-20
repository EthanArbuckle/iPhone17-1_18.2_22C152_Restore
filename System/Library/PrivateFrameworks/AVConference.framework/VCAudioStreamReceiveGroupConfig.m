@interface VCAudioStreamReceiveGroupConfig
- (VCAudioStreamGroupCommonConfig)audioStreamGroupConfig;
- (VCAudioStreamReceiveGroupConfig)init;
- (void)dealloc;
- (void)init;
- (void)setAudioStreamGroupConfig:(id)a3;
@end

@implementation VCAudioStreamReceiveGroupConfig

- (VCAudioStreamReceiveGroupConfig)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCAudioStreamReceiveGroupConfig;
  v2 = [(VCMediaStreamGroupConfig *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(VCAudioStreamGroupCommonConfig);
    v2->_audioStreamGroupConfig = v3;
    if (!v3)
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          [(VCAudioStreamReceiveGroupConfig *)v5 init];
        }
      }
      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioStreamReceiveGroupConfig;
  [(VCMediaStreamGroupConfig *)&v3 dealloc];
}

- (VCAudioStreamGroupCommonConfig)audioStreamGroupConfig
{
  return (VCAudioStreamGroupCommonConfig *)objc_getProperty(self, a2, 216, 1);
}

- (void)setAudioStreamGroupConfig:(id)a3
{
}

- (void)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VCAudioStreamReceiveGroupConfig init]";
  __int16 v6 = 1024;
  int v7 = 23;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate _audioStreamGroupConfig", (uint8_t *)&v2, 0x1Cu);
}

@end