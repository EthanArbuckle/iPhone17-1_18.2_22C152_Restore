@interface VCVideoRuleCollectionsRemoteCameraMac
+ (id)sharedInstance;
- (BOOL)initSupportedPayloads;
- (VCVideoRuleCollectionsRemoteCameraMac)initWithHardwareSettings:(id)a3;
- (void)initSupportedPayloads;
@end

@implementation VCVideoRuleCollectionsRemoteCameraMac

- (VCVideoRuleCollectionsRemoteCameraMac)initWithHardwareSettings:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCVideoRuleCollectionsRemoteCameraMac;
  v4 = [(VCVideoRuleCollections *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_hardwareSettings = (VCHardwareSettingsMacProtocol *)a3;
    if (![(VCVideoRuleCollectionsRemoteCameraMac *)v4 initSupportedPayloads]
      || ![(VCVideoRuleCollectionsRemoteCamera *)v5 setupHEVCRules])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoRuleCollectionsRemoteCameraMac initWithHardwareSettings:](v6);
        }
      }

      return 0;
    }
  }
  return v5;
}

+ (id)sharedInstance
{
  return 0;
}

- (BOOL)initSupportedPayloads
{
  if ([(VCHardwareSettingsMacProtocol *)self->_hardwareSettings canDoHEVC]) {
    [(VCVideoRuleCollections *)self addSupportedPayload:100];
  }
  uint64_t v3 = [(NSMutableArray *)self->super.super._supportedPayloads count];
  if (!v3 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoRuleCollectionsRemoteCameraMac initSupportedPayloads](v4);
    }
  }
  return v3 != 0;
}

- (void)initWithHardwareSettings:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 23;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create camera rules!", (uint8_t *)&v2, 0x1Cu);
}

- (void)initSupportedPayloads
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 47;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d No supportedPayloads for this hardware", (uint8_t *)&v2, 0x1Cu);
}

@end