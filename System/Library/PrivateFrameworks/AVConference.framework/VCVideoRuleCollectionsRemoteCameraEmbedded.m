@interface VCVideoRuleCollectionsRemoteCameraEmbedded
+ (id)sharedInstance;
- (BOOL)initSupportedPayloads;
- (VCVideoRuleCollectionsRemoteCameraEmbedded)initWithHardwareSettings:(id)a3;
- (void)initSupportedPayloads;
@end

@implementation VCVideoRuleCollectionsRemoteCameraEmbedded

- (VCVideoRuleCollectionsRemoteCameraEmbedded)initWithHardwareSettings:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VCVideoRuleCollectionsRemoteCameraEmbedded;
  v4 = [(VCVideoRuleCollections *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_hardwareSettings = (VCHardwareSettingsEmbeddedProtocol *)a3;
    if (![(VCVideoRuleCollectionsRemoteCameraEmbedded *)v4 initSupportedPayloads]
      || ![(VCVideoRuleCollectionsRemoteCamera *)v5 setupHEVCRules])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoRuleCollectionsRemoteCameraEmbedded initWithHardwareSettings:](v6, v7);
        }
      }

      return 0;
    }
  }
  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_token_0 != -1) {
    dispatch_once(&sharedInstance_token_0, &__block_literal_global_5);
  }
  return (id)sharedInstance__videoRulesCollections;
}

VCVideoRuleCollectionsRemoteCameraEmbedded *__60__VCVideoRuleCollectionsRemoteCameraEmbedded_sharedInstance__block_invoke()
{
  result = [[VCVideoRuleCollectionsRemoteCameraEmbedded alloc] initWithHardwareSettings:+[VCHardwareSettingsEmbedded sharedInstance]];
  sharedInstance__videoRulesCollections = (uint64_t)result;
  return result;
}

- (BOOL)initSupportedPayloads
{
  p_hardwareSettings = &self->_hardwareSettings;
  if ([(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings vcpSupportsHEVCEncoder])[(VCVideoRuleCollections *)self addSupportedPayload:100]; {
  uint64_t v4 = [(NSMutableArray *)self->super.super._supportedPayloads count];
  }
  if (!v4 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      [(VCVideoRuleCollectionsRemoteCameraEmbedded *)v5 initSupportedPayloads];
    }
  }
  return v4 != 0;
}

- (void)initWithHardwareSettings:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VCVideoRuleCollectionsRemoteCameraEmbedded initWithHardwareSettings:]";
  __int16 v6 = 1024;
  int v7 = 23;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create camera rules!", (uint8_t *)&v2, 0x1Cu);
}

- (void)initSupportedPayloads
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [*a2 deviceClass];
  int v7 = [*a2 vcpSupportsHEVCEncoder];
  int v8 = 136316162;
  uint64_t v9 = a1;
  __int16 v10 = 2080;
  v11 = "-[VCVideoRuleCollectionsRemoteCameraEmbedded initSupportedPayloads]";
  __int16 v12 = 1024;
  int v13 = 49;
  __int16 v14 = 2048;
  uint64_t v15 = v6;
  __int16 v16 = 1024;
  int v17 = v7;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Empty suppported payload: device classType=%ld, vcpSupportsHEVCEncoder=%d", (uint8_t *)&v8, 0x2Cu);
}

@end