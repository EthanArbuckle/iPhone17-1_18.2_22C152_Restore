@interface VCVideoRuleCollectionsScreenSecondaryMac
+ (id)sharedInstance;
- (BOOL)setupH264Rules;
- (BOOL)setupHEVCRules;
- (BOOL)setupRules;
- (VCVideoRuleCollectionsScreenSecondaryMac)initWithHardwareSettings:(id)a3;
- (void)initSupportedPayloads;
@end

@implementation VCVideoRuleCollectionsScreenSecondaryMac

+ (id)sharedInstance
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  objc_sync_exit(v2);
  return 0;
}

- (VCVideoRuleCollectionsScreenSecondaryMac)initWithHardwareSettings:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VCVideoRuleCollectionsScreenSecondaryMac;
  v4 = [(VCVideoRuleCollections *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_hardwareSettings = (VCHardwareSettingsMacProtocol *)a3;
    [(VCVideoRuleCollectionsScreenSecondaryMac *)v4 initSupportedPayloads];
    if (![(VCVideoRuleCollectionsScreenSecondaryMac *)v5 setupRules]
      || ([(VCHardwareSettingsMacProtocol *)v5->_hardwareSettings isPixelFormatAvailable] & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoRuleCollectionsScreenSecondaryMac initWithHardwareSettings:](v6, v7);
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
  BOOL v3 = [(VCVideoRuleCollectionsScreenSecondaryMac *)self setupH264Rules];
  if (v3)
  {
    LOBYTE(v3) = [(VCVideoRuleCollectionsScreenSecondaryMac *)self setupHEVCRules];
  }
  return v3;
}

- (BOOL)setupH264Rules
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(VCVideoRuleCollections *)self addSupportedPayload:123];
  BOOL v3 = videoRulesForFormatList_0((uint64_t)&g_EncodingFormatMacWiFi, 123);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E4F47A50];
      BOOL v5 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_4;
      }
      int v11 = 136315650;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      v14 = "-[VCVideoRuleCollectionsScreenSecondaryMac setupH264Rules]";
      __int16 v15 = 1024;
      int v16 = 117;
      objc_super v9 = " [%s] %s:%d Screen rules: No suitable rules for this device";
      goto LABEL_11;
    }
LABEL_12:
    BOOL v5 = 0;
    goto LABEL_4;
  }
  [(VCVideoRuleCollections *)self addVideoRules:v3 transportType:1 payload:123 encodingType:1];
  v4 = videoRulesForFormatList_0((uint64_t)&g_DecodingFormatMacWiFi, 123);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E4F47A50];
      BOOL v5 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_4;
      }
      int v11 = 136315650;
      uint64_t v12 = v10;
      __int16 v13 = 2080;
      v14 = "-[VCVideoRuleCollectionsScreenSecondaryMac setupH264Rules]";
      __int16 v15 = 1024;
      int v16 = 121;
      objc_super v9 = " [%s] %s:%d Screen rules: No suitable decode rules for this device";
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0x1Cu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  BOOL v5 = 1;
  [(VCVideoRuleCollections *)self addVideoRules:v4 transportType:1 payload:123 encodingType:2];
LABEL_4:

  return v5;
}

- (BOOL)setupHEVCRules
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VCVideoRuleCollections *)self isPayloadSupported:100];
  BOOL v4 = +[VCHardwareSettings isHEVCEncodeSupportedForHardwareSettingsMode:3];
  BOOL v5 = 1;
  if (v3 && v4)
  {
    uint64_t v6 = videoRulesForFormatList_0((uint64_t)&g_EncodingFormatMacWiFi, 100);
    if (v6)
    {
      [(VCVideoRuleCollections *)self addVideoRules:v6 transportType:1 payload:100 encodingType:1];
      uint64_t v7 = videoRulesForFormatList_0((uint64_t)&g_DecodingFormatMacWiFi, 100);
      if (v7)
      {
        v8 = v7;
        [(VCVideoRuleCollections *)self addVideoRules:v7 transportType:1 payload:100 encodingType:2];
LABEL_6:

        return v5;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (uint64_t v13 = VRTraceErrorLogLevelToCSTR(),
            int v11 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_15:
        v8 = 0;
        BOOL v5 = 0;
        goto LABEL_6;
      }
      int v14 = 136315650;
      uint64_t v15 = v13;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCVideoRuleCollectionsScreenSecondaryMac setupHEVCRules]";
      __int16 v18 = 1024;
      int v19 = 146;
      uint64_t v12 = " [%s] %s:%d Screen rules: No suitable decode rules for this device";
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_15;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      int v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      int v14 = 136315650;
      uint64_t v15 = v10;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCVideoRuleCollectionsScreenSecondaryMac setupHEVCRules]";
      __int16 v18 = 1024;
      int v19 = 142;
      uint64_t v12 = " [%s] %s:%d Screen rules: No suitable rules for this device";
    }
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0x1Cu);
    goto LABEL_15;
  }
  return v5;
}

- (void)initWithHardwareSettings:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  BOOL v5 = "-[VCVideoRuleCollectionsScreenSecondaryMac initWithHardwareSettings:]";
  __int16 v6 = 1024;
  int v7 = 86;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create screen secondary rules!", (uint8_t *)&v2, 0x1Cu);
}

@end