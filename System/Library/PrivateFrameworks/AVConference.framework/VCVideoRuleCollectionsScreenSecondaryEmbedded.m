@interface VCVideoRuleCollectionsScreenSecondaryEmbedded
+ (id)sharedInstance;
- (BOOL)setupH264Rules;
- (BOOL)setupHEVCRules;
- (BOOL)setupRules;
- (VCVideoRuleCollectionsScreenSecondaryEmbedded)initWithHardwareSettings:(id)a3;
- (void)initSupportedPayloads;
- (void)selectPreferredRule:(id)a3 screenSize:(CGSize)a4;
- (void)setupH264Rules;
- (void)setupHEVCRules;
@end

@implementation VCVideoRuleCollectionsScreenSecondaryEmbedded

+ (id)sharedInstance
{
  if (sharedInstance_token_6 != -1) {
    dispatch_once(&sharedInstance_token_6, &__block_literal_global_105);
  }
  return (id)sharedInstance__videoRulesCollection_1;
}

VCVideoRuleCollectionsScreenSecondaryEmbedded *__63__VCVideoRuleCollectionsScreenSecondaryEmbedded_sharedInstance__block_invoke()
{
  result = [[VCVideoRuleCollectionsScreenSecondaryEmbedded alloc] initWithHardwareSettings:+[VCHardwareSettingsEmbedded sharedInstance]];
  sharedInstance__videoRulesCollection_1 = (uint64_t)result;
  return result;
}

- (VCVideoRuleCollectionsScreenSecondaryEmbedded)initWithHardwareSettings:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCVideoRuleCollectionsScreenSecondaryEmbedded;
  v4 = [(VCVideoRuleCollections *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_hardwareSettings = (VCHardwareSettingsEmbeddedProtocol *)a3;
    [(VCVideoRuleCollectionsScreenSecondaryEmbedded *)v4 initSupportedPayloads];
    if (![(VCVideoRuleCollectionsScreenSecondaryEmbedded *)v5 setupRules]
      || ([(VCHardwareSettingsEmbeddedProtocol *)v5->_hardwareSettings isPixelFormatAvailable] & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoRuleCollectionsScreenSecondaryEmbedded initWithHardwareSettings:]();
        }
      }

      return 0;
    }
  }
  return v5;
}

- (void)initSupportedPayloads
{
  uint64_t v3 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings deviceClass];
  if (v3 == 8 || v3 == 3)
  {
    [(VCVideoRuleCollections *)self addSupportedPayload:123];
    [(VCVideoRuleCollections *)self addSupportedPayload:100];
  }
}

- (void)selectPreferredRule:(id)a3 screenSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v27 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = 0;
    uint64_t v10 = *(void *)v28;
    double v11 = 1.0;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(a3);
        }
        v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (width == (double)(int)[v13 iWidth])
        {
          double v14 = (double)(int)[v13 iHeight];
          if (height == v14)
          {
            LODWORD(v14) = 1.0;
            v17 = v13;
            goto LABEL_22;
          }
        }
        double v15 = height * (double)(int)[v13 iWidth];
        if (v15 == width * (double)(int)[v13 iHeight]
          && (!v9 || [v9 compare:v13] == -1))
        {
          double v11 = 0.0;
          v9 = v13;
        }
        double v16 = vabdd_f64((float)((float)(int)[v13 iWidth] / (float)(int)objc_msgSend(v13, "iHeight")), width / height);
        if (v16 < v11 || v16 == v11 && (!v9 || [v9 compare:v13] == -1))
        {
          double v11 = v16;
          v9 = v13;
        }
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v27 objects:v26 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    if (v9)
    {
      LODWORD(v14) = 1.0;
      v17 = v9;
LABEL_22:
      [v17 setFPref:v14];
      return;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315650;
      uint64_t v21 = v18;
      __int16 v22 = 2080;
      v23 = "-[VCVideoRuleCollectionsScreenSecondaryEmbedded selectPreferredRule:screenSize:]";
      __int16 v24 = 1024;
      int v25 = 184;
      _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Secondary Screen rules: Could not find a preferred video rule", (uint8_t *)&v20, 0x1Cu);
    }
  }
}

- (BOOL)setupRules
{
  BOOL v3 = [(VCVideoRuleCollectionsScreenSecondaryEmbedded *)self setupH264Rules];
  if (v3)
  {
    LOBYTE(v3) = [(VCVideoRuleCollectionsScreenSecondaryEmbedded *)self setupHEVCRules];
  }
  return v3;
}

- (BOOL)setupH264Rules
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (![(VCVideoRuleCollections *)self isPayloadSupported:123])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 136315650;
        uint64_t v25 = v20;
        __int16 v26 = 2080;
        long long v27 = "-[VCVideoRuleCollectionsScreenSecondaryEmbedded setupH264Rules]";
        __int16 v28 = 1024;
        int v29 = 203;
        _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Secondary Screen rules: no H264 support", (uint8_t *)&v24, 0x1Cu);
      }
    }
    goto LABEL_45;
  }
  unsigned int v3 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings screenWidth];
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsScreenSecondaryEmbedded setupH264Rules]();
      }
    }
    goto LABEL_45;
  }
  unsigned int v4 = v3;
  unsigned int v5 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings screenHeight];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsScreenSecondaryEmbedded setupH264Rules]();
      }
    }
    goto LABEL_45;
  }
  unsigned int v6 = v5;
  if ([(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings videoEncoderType] == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsScreenSecondaryEmbedded setupH264Rules]();
      }
    }
LABEL_45:
    uint64_t v18 = 0;
    double v11 = 0;
    goto LABEL_46;
  }
  double v7 = (double)v4;
  double v8 = (double)v6;
  uint64_t v9 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings deviceClass];
  if (v9 == 8)
  {
    double v11 = videoRulesForFormatList_2((uint64_t)&g_EncodingDecodingFormat_3K_AND_4K, 2u, 123);
    v12 = videoRulesForFormatList_2((uint64_t)&g_EncodingDecodingFormat_3K_AND_4K, 2u, 123);
LABEL_28:
    uint64_t v18 = v12;
    if (v11 && v12)
    {
      -[VCVideoRuleCollectionsScreenSecondaryEmbedded selectPreferredRule:screenSize:](self, "selectPreferredRule:screenSize:", v11, v7, v8);
      -[VCVideoRuleCollectionsScreenSecondaryEmbedded selectPreferredRule:screenSize:](self, "selectPreferredRule:screenSize:", v18, v7, v8);
      BOOL v15 = 1;
      [(VCVideoRuleCollections *)self addVideoRules:v11 transportType:1 payload:123 encodingType:1];
      [(VCVideoRuleCollections *)self addVideoRules:v18 transportType:1 payload:123 encodingType:2];
LABEL_31:

      return v15;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 136315650;
        uint64_t v25 = v22;
        __int16 v26 = 2080;
        long long v27 = "-[VCVideoRuleCollectionsScreenSecondaryEmbedded setupH264Rules]";
        __int16 v28 = 1024;
        int v29 = 229;
        _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Screen rules: No suitable rules for this device", (uint8_t *)&v24, 0x1Cu);
      }
    }
LABEL_46:
    BOOL v15 = 0;
    goto LABEL_31;
  }
  if (v9 == 3)
  {
    if (v4 == 2732 && v6 == 2048)
    {
      uint64_t v10 = &g_EncodingFormatiPadWiFi2732x2048;
    }
    else if (v4 == 2224 && v6 == 1668)
    {
      uint64_t v10 = &g_EncodingFormatiPadWiFi2224x1668;
    }
    else if (v4 == 2388 && v6 == 1668)
    {
      uint64_t v10 = &g_EncodingFormatiPadWiFi2388x1668;
    }
    else
    {
      if ((v4 != 2048 || v6 != 1536) && (int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 136316162;
          uint64_t v25 = v16;
          __int16 v26 = 2080;
          long long v27 = "iPadWiFiScreenEncodingRules";
          __int16 v28 = 1024;
          int v29 = 75;
          __int16 v30 = 2048;
          double v31 = v7;
          __int16 v32 = 2048;
          double v33 = v8;
          _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Resolution(%f x %f)  not supported. Defaulting to 2048x1536", (uint8_t *)&v24, 0x30u);
        }
      }
      uint64_t v10 = &g_EncodingFormatiPadWiFi2048x1536;
    }
    double v11 = videoRulesForFormatList_2((uint64_t)v10, 1u, 123);
    v12 = iPadWiFiScreenDecodingRules(123, v7, v8);
    goto LABEL_28;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
    return 0;
  }
  uint64_t v13 = VRTraceErrorLogLevelToCSTR();
  double v14 = *MEMORY[0x1E4F47A50];
  BOOL v15 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136315650;
    uint64_t v25 = v13;
    __int16 v26 = 2080;
    long long v27 = "-[VCVideoRuleCollectionsScreenSecondaryEmbedded setupH264Rules]";
    __int16 v28 = 1024;
    int v29 = 226;
    _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Device has no Secondary Screen rules", (uint8_t *)&v24, 0x1Cu);
    return 0;
  }
  return v15;
}

- (BOOL)setupHEVCRules
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VCVideoRuleCollections *)self isPayloadSupported:100];
  BOOL v4 = +[VCHardwareSettings isHEVCDecodeSupportedForHardwareSettingsMode:3];
  BOOL v5 = 1;
  if (v3 && v4)
  {
    unsigned int v6 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings screenWidth];
    if (v6)
    {
      unsigned int v7 = v6;
      unsigned int v8 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings screenHeight];
      if (v8)
      {
        unsigned int v9 = v8;
        if ([(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings videoEncoderType] == -1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCVideoRuleCollectionsScreenSecondaryEmbedded setupHEVCRules]();
            }
          }
        }
        else
        {
          double v10 = (double)v7;
          uint64_t v11 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings deviceClass];
          if (v11 == 8)
          {
            v12 = videoRulesForFormatList_2((uint64_t)&g_EncodingDecodingFormat_3K_AND_4K, 2u, 100);
          }
          else
          {
            if (v11 != 3)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v14 = VRTraceErrorLogLevelToCSTR();
                BOOL v15 = *MEMORY[0x1E4F47A50];
                BOOL v5 = 0;
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                  return v5;
                }
                int v19 = 136315650;
                uint64_t v20 = v14;
                __int16 v21 = 2080;
                uint64_t v22 = "-[VCVideoRuleCollectionsScreenSecondaryEmbedded setupHEVCRules]";
                __int16 v23 = 1024;
                int v24 = 277;
                _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Device has no Secondary Screen rules", (uint8_t *)&v19, 0x1Cu);
              }
              return 0;
            }
            v12 = iPadWiFiScreenDecodingRules(100, (double)v7, (double)v9);
          }
          uint64_t v13 = v12;
          if (v12)
          {
            -[VCVideoRuleCollectionsScreenSecondaryEmbedded selectPreferredRule:screenSize:](self, "selectPreferredRule:screenSize:", v12, v10, (double)v9);
            BOOL v5 = 1;
            [(VCVideoRuleCollections *)self addVideoRules:v13 transportType:1 payload:100 encodingType:2];
LABEL_12:

            return v5;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v17 = VRTraceErrorLogLevelToCSTR();
            uint64_t v18 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v19 = 136315650;
              uint64_t v20 = v17;
              __int16 v21 = 2080;
              uint64_t v22 = "-[VCVideoRuleCollectionsScreenSecondaryEmbedded setupHEVCRules]";
              __int16 v23 = 1024;
              int v24 = 280;
              _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Screen rules: No suitable rules for this device", (uint8_t *)&v19, 0x1Cu);
            }
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoRuleCollectionsScreenSecondaryEmbedded setupHEVCRules]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsScreenSecondaryEmbedded setupHEVCRules]();
      }
    }
    uint64_t v13 = 0;
    BOOL v5 = 0;
    goto LABEL_12;
  }
  return v5;
}

- (void)initWithHardwareSettings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create rules for secondary screen!", v2, v3, v4, v5, v6);
}

- (void)setupH264Rules
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Secondary Screen rules: Could not retrieve hardware encoder type", v2, v3, v4, v5, v6);
}

- (void)setupHEVCRules
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Secondary Screen rules: Could not retrieve hardware encoder type", v2, v3, v4, v5, v6);
}

@end