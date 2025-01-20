@interface VCVideoRuleCollectionsScreenAirplayMac
+ (id)sharedInstance;
- (BOOL)setupH264Rules;
- (BOOL)setupHEVCRules;
- (BOOL)setupRules;
- (VCVideoRuleCollectionsScreenAirplayMac)initWithHardwareSettings:(id)a3;
- (void)initSupportedPayloads;
@end

@implementation VCVideoRuleCollectionsScreenAirplayMac

+ (id)sharedInstance
{
  return 0;
}

- (VCVideoRuleCollectionsScreenAirplayMac)initWithHardwareSettings:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VCVideoRuleCollectionsScreenAirplayMac;
  v4 = [(VCVideoRuleCollections *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_hardwareSettings = (VCHardwareSettingsMacProtocol *)a3;
    [(VCVideoRuleCollectionsScreenAirplayMac *)v4 initSupportedPayloads];
    if (![(VCVideoRuleCollectionsScreenAirplayMac *)v5 setupRules]
      || ([(VCHardwareSettingsMacProtocol *)v5->_hardwareSettings isPixelFormatAvailable] & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoRuleCollectionsScreenAirplayMac initWithHardwareSettings:](v6, v7);
        }
      }

      return 0;
    }
  }
  return v5;
}

- (void)initSupportedPayloads
{
  [(VCVideoRuleCollections *)self addSupportedPayload:123];
  if ([(VCHardwareSettingsMacProtocol *)self->_hardwareSettings canDoHEVC])
  {
    [(VCVideoRuleCollections *)self addSupportedPayload:100];
  }
}

- (BOOL)setupRules
{
  BOOL v3 = [(VCVideoRuleCollectionsScreenAirplayMac *)self setupH264Rules];
  if (v3)
  {
    LOBYTE(v3) = [(VCVideoRuleCollectionsScreenAirplayMac *)self setupHEVCRules];
  }
  return v3;
}

- (BOOL)setupH264Rules
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(VCVideoRuleCollections *)self addSupportedPayload:123];
  BOOL v3 = videoRulesForFormatList((uint64_t)&g_EncodingFormatMacWiFiAirplay, 123);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    objc_super v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v12 = 136315650;
    uint64_t v13 = v8;
    __int16 v14 = 2080;
    v15 = "-[VCVideoRuleCollectionsScreenAirplayMac setupH264Rules]";
    __int16 v16 = 1024;
    int v17 = 142;
    uint64_t v10 = " [%s] %s:%d Airplay Screen rules: No suitable H264 encode rules for this mac";
    goto LABEL_11;
  }
  v4 = videoRulesForFormatList((uint64_t)&g_DecodingFormatMacWiFiAirplay, 123);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    objc_super v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v12 = 136315650;
    uint64_t v13 = v11;
    __int16 v14 = 2080;
    v15 = "-[VCVideoRuleCollectionsScreenAirplayMac setupH264Rules]";
    __int16 v16 = 1024;
    int v17 = 145;
    uint64_t v10 = " [%s] %s:%d Airplay Screen rules: No suitable H264 decode rules for this mac";
LABEL_11:
    _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0x1Cu);
LABEL_12:
    v5 = 0;
    BOOL v6 = 0;
    goto LABEL_4;
  }
  v5 = v4;
  BOOL v6 = 1;
  [(VCVideoRuleCollections *)self addVideoRules:v3 transportType:1 payload:123 encodingType:1];
  [(VCVideoRuleCollections *)self addVideoRules:v5 transportType:1 payload:123 encodingType:2];
LABEL_4:

  return v6;
}

- (BOOL)setupHEVCRules
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VCVideoRuleCollections *)self isPayloadSupported:100];
  BOOL v4 = +[VCHardwareSettings isHEVCDecodeSupportedForHardwareSettingsMode:4];
  BOOL v5 = +[VCHardwareSettings isHEVCEncodeSupportedForHardwareSettingsMode:4];
  BOOL v6 = 1;
  if (v3 && (v4 || v5))
  {
    if (v5)
    {
      v7 = videoRulesForFormatList((uint64_t)&g_EncodingFormatMacWiFiAirplay, 100);
      if (!v7)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          uint64_t v13 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v16 = 136315650;
            uint64_t v17 = v12;
            __int16 v18 = 2080;
            v19 = "-[VCVideoRuleCollectionsScreenAirplayMac setupHEVCRules]";
            __int16 v20 = 1024;
            int v21 = 171;
            _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Airplay Screen rules: No suitable hevc encode rules for this mac", (uint8_t *)&v16, 0x1Cu);
          }
        }
        objc_super v9 = 0;
        uint64_t v8 = 0;
        goto LABEL_20;
      }
      uint64_t v8 = v7;
      [(VCVideoRuleCollections *)self addVideoRules:v7 transportType:1 payload:100 encodingType:1];
      if (!v4)
      {
LABEL_6:
        objc_super v9 = 0;
LABEL_10:

        return v6;
      }
    }
    else
    {
      uint64_t v8 = 0;
      if (!v4) {
        goto LABEL_6;
      }
    }
    uint64_t v10 = videoRulesForFormatList((uint64_t)&g_DecodingFormatMacWiFiAirplay, 100);
    if (v10)
    {
      objc_super v9 = v10;
      [(VCVideoRuleCollections *)self addVideoRules:v10 transportType:1 payload:100 encodingType:2];
      goto LABEL_10;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315650;
        uint64_t v17 = v14;
        __int16 v18 = 2080;
        v19 = "-[VCVideoRuleCollectionsScreenAirplayMac setupHEVCRules]";
        __int16 v20 = 1024;
        int v21 = 176;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Airplay Screen rules: No suitable hevc decode rules for this mac", (uint8_t *)&v16, 0x1Cu);
      }
    }
    objc_super v9 = 0;
LABEL_20:
    BOOL v6 = 0;
    goto LABEL_10;
  }
  return v6;
}

- (void)initWithHardwareSettings:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  BOOL v5 = "-[VCVideoRuleCollectionsScreenAirplayMac initWithHardwareSettings:]";
  __int16 v6 = 1024;
  int v7 = 110;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create Airplay screen rules!", (uint8_t *)&v2, 0x1Cu);
}

@end