@interface VCVideoRuleCollectionsRemoteCamera
+ (id)sharedInstance;
+ (unsigned)tilesPerFrame;
- (BOOL)setupHEVCRules;
- (void)setupHEVCRules;
@end

@implementation VCVideoRuleCollectionsRemoteCamera

- (BOOL)setupHEVCRules
{
  if (![(VCVideoRuleCollections *)self isPayloadSupported:100])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsRemoteCamera setupHEVCRules]();
      }
    }
    return 0;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsRemoteCamera setupHEVCRules]();
      }
    }
    return 0;
  }
  v4 = v3;
  v5 = [VCVideoRule alloc];
  LODWORD(v6) = 1114636288;
  uint64_t v7 = [(VCVideoRule *)v5 initWithFrameWidth:1920 frameHeight:1440 frameRate:100 payload:v6];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsRemoteCamera setupHEVCRules]();
      }
    }
    return 0;
  }
  v8 = (void *)v7;
  [v4 addObject:v7];

  BOOL v9 = 1;
  [(VCVideoRuleCollections *)self addVideoRules:v4 transportType:1 payload:100 encodingType:1];
  [(VCVideoRuleCollections *)self addVideoRules:v4 transportType:1 payload:100 encodingType:2];
  return v9;
}

+ (id)sharedInstance
{
  return +[VCVideoRuleCollectionsRemoteCameraEmbedded sharedInstance];
}

+ (unsigned)tilesPerFrame
{
  return +[VCHardwareSettings tilesPerVideoFrameForHardwareSettingsMode:5];
}

- (void)setupHEVCRules
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 26;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d NO HEVC payloades", v1, 0x1Cu);
}

@end