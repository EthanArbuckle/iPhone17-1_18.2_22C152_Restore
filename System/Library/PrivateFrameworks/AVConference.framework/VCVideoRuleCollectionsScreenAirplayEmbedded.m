@interface VCVideoRuleCollectionsScreenAirplayEmbedded
+ (id)sharedInstance;
- (BOOL)setupH264Rules;
- (BOOL)setupHEVCRules;
- (BOOL)setupRules;
- (VCVideoRuleCollectionsScreenAirplayEmbedded)initWithHardwareSettings:(id)a3;
- (void)initSupportedPayloads;
- (void)selectPreferredRule:(id)a3 screenSize:(CGSize)a4;
- (void)setupH264Rules;
- (void)setupHEVCRules;
@end

@implementation VCVideoRuleCollectionsScreenAirplayEmbedded

+ (id)sharedInstance
{
  if (sharedInstance_token_4 != -1) {
    dispatch_once(&sharedInstance_token_4, &__block_literal_global_87);
  }
  return (id)sharedInstance__videoRulesCollection;
}

VCVideoRuleCollectionsScreenAirplayEmbedded *__61__VCVideoRuleCollectionsScreenAirplayEmbedded_sharedInstance__block_invoke()
{
  result = [[VCVideoRuleCollectionsScreenAirplayEmbedded alloc] initWithHardwareSettings:+[VCHardwareSettingsEmbedded sharedInstance]];
  sharedInstance__videoRulesCollection = (uint64_t)result;
  return result;
}

- (VCVideoRuleCollectionsScreenAirplayEmbedded)initWithHardwareSettings:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCVideoRuleCollectionsScreenAirplayEmbedded;
  v4 = [(VCVideoRuleCollections *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_hardwareSettings = (VCHardwareSettingsEmbeddedProtocol *)a3;
    [(VCVideoRuleCollectionsScreenAirplayEmbedded *)v4 initSupportedPayloads];
    if (![(VCVideoRuleCollectionsScreenAirplayEmbedded *)v5 setupRules]
      || ([(VCHardwareSettingsEmbeddedProtocol *)v5->_hardwareSettings isPixelFormatAvailable] & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoRuleCollectionsScreenAirplayEmbedded initWithHardwareSettings:]();
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
  if ((unint64_t)(v3 - 1) >= 4)
  {
    if (v3 == 6)
    {
      uint64_t v4 = 123;
      goto LABEL_5;
    }
    if (v3 != 8) {
      return;
    }
  }
  [(VCVideoRuleCollections *)self addSupportedPayload:123];
  uint64_t v4 = 100;
LABEL_5:

  [(VCVideoRuleCollections *)self addSupportedPayload:v4];
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
      v23 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded selectPreferredRule:screenSize:]";
      __int16 v24 = 1024;
      int v25 = 302;
      _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Screen rules: Could not find a preferred video rule", (uint8_t *)&v20, 0x1Cu);
    }
  }
}

- (BOOL)setupRules
{
  BOOL v3 = [(VCVideoRuleCollectionsScreenAirplayEmbedded *)self setupH264Rules];
  if (v3)
  {
    LOBYTE(v3) = [(VCVideoRuleCollectionsScreenAirplayEmbedded *)self setupHEVCRules];
  }
  return v3;
}

- (BOOL)setupH264Rules
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ([(VCVideoRuleCollections *)self isPayloadSupported:123])
  {
    double v3 = 0.0;
    if ([(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings deviceClass] == 4)
    {
      double v4 = 0.0;
LABEL_8:
      uint64_t v8 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings videoEncoderType];
      if (v8 != -1)
      {
        uint64_t v9 = v8;
        uint64_t v10 = 0;
        double v11 = 0;
        switch([(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings deviceClass])
        {
          case 1:
            uint64_t v10 = iPhoneWiFiScreenEncodingRules(v9, 123, v4, v3);
            double v16 = iPhoneWiFiScreenDecodingRules(123, v4, v3);
            goto LABEL_30;
          case 2:
            if (v9 == 2)
            {
              unsigned int v17 = v3 == 640.0 && v4 == 1136.0;
              if (v3 == 640.0 && v4 == 1136.0) {
                uint64_t v18 = &g_AirplayWifiEncodingFormat1136x640AVE;
              }
              else {
                uint64_t v18 = 0;
              }
            }
            else
            {
              uint64_t v18 = 0;
              unsigned int v17 = 0;
            }
            uint64_t v10 = videoRulesForFormatList_1((uint64_t)v18, v17, 123);
            BOOL v19 = v4 == 1136.0;
            BOOL v20 = v3 == 640.0;
            if (v20 && v19) {
              double v14 = &g_AirplayWifiDecodingFormat1136x640;
            }
            else {
              double v14 = 0;
            }
            if (v20 && v19) {
              unsigned int v15 = 4;
            }
            else {
              unsigned int v15 = 0;
            }
            goto LABEL_29;
          case 3:
          case 4:
          case 6:
          case 8:
            if (v9 == 1) {
              v12 = &g_AirplayWifiEncodingFormatiPadVXE;
            }
            else {
              v12 = &g_AirplayWifiEncodingFormatiPadAVE;
            }
            if (v9 == 1) {
              unsigned int v13 = 1;
            }
            else {
              unsigned int v13 = 2;
            }
            uint64_t v10 = videoRulesForFormatList_1((uint64_t)v12, v13, 123);
            double v14 = &g_AirplayWifiDecodingFormatiPad;
            unsigned int v15 = 12;
LABEL_29:
            double v16 = videoRulesForFormatList_1((uint64_t)v14, v15, 123);
LABEL_30:
            double v11 = v16;
            if (v10) {
              BOOL v21 = v16 == 0;
            }
            else {
              BOOL v21 = 1;
            }
            if (v21) {
              goto LABEL_36;
            }
            -[VCVideoRuleCollectionsScreenAirplayEmbedded selectPreferredRule:screenSize:](self, "selectPreferredRule:screenSize:", v10, v4, v3);
            -[VCVideoRuleCollectionsScreenAirplayEmbedded selectPreferredRule:screenSize:](self, "selectPreferredRule:screenSize:", v11, v4, v3);
            BOOL v22 = 1;
            [(VCVideoRuleCollections *)self addVideoRules:v10 transportType:1 payload:123 encodingType:1];
            [(VCVideoRuleCollections *)self addVideoRules:v11 transportType:1 payload:123 encodingType:2];
            goto LABEL_35;
          default:
LABEL_36:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v24 = VRTraceErrorLogLevelToCSTR();
              int v25 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                int v28 = 136315650;
                uint64_t v29 = v24;
                __int16 v30 = 2080;
                uint64_t v31 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupH264Rules]";
                __int16 v32 = 1024;
                int v33 = 356;
                _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Screen rules: No suitable rules for this device", (uint8_t *)&v28, 0x1Cu);
              }
            }
            goto LABEL_39;
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoRuleCollectionsScreenAirplayEmbedded setupH264Rules]();
        }
      }
      goto LABEL_52;
    }
    double v4 = 0.0;
    if ([(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings deviceClass] == 6) {
      goto LABEL_8;
    }
    unsigned int v5 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings screenWidth];
    if (v5)
    {
      unsigned int v6 = v5;
      unsigned int v7 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings screenHeight];
      if (v7)
      {
        double v4 = (double)v6;
        double v3 = (double)v7;
        goto LABEL_8;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoRuleCollectionsScreenAirplayEmbedded setupH264Rules]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsScreenAirplayEmbedded setupH264Rules]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    long long v27 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 136315650;
      uint64_t v29 = v26;
      __int16 v30 = 2080;
      uint64_t v31 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupH264Rules]";
      __int16 v32 = 1024;
      int v33 = 321;
      _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Screen rules: no H264 support", (uint8_t *)&v28, 0x1Cu);
    }
  }
LABEL_52:
  double v11 = 0;
  uint64_t v10 = 0;
LABEL_39:
  BOOL v22 = 0;
LABEL_35:

  return v22;
}

- (BOOL)setupHEVCRules
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VCVideoRuleCollections *)self isPayloadSupported:100];
  BOOL v4 = +[VCHardwareSettings isHEVCDecodeSupportedForHardwareSettingsMode:4];
  BOOL v5 = +[VCHardwareSettings isHEVCEncodeSupportedForHardwareSettingsMode:4];
  BOOL v6 = 1;
  if (!v3) {
    return v6;
  }
  BOOL v7 = v5;
  if (!v4 && !v5) {
    return v6;
  }
  double v8 = 0.0;
  if ([(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings deviceClass] == 4)
  {
    double v9 = 0.0;
    goto LABEL_9;
  }
  double v9 = 0.0;
  if ([(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings deviceClass] == 6)
  {
LABEL_9:
    uint64_t v13 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings videoEncoderType];
    if (v13 == -1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]();
        }
      }
    }
    else
    {
      uint64_t v14 = v13;
      switch([(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings deviceClass])
      {
        case 1:
          if (v4)
          {
            unsigned int v17 = iPhoneWiFiScreenDecodingRules(100, v9, v8);
            if (!v17)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v46 = VRTraceErrorLogLevelToCSTR();
                v44 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  int v53 = 136315650;
                  uint64_t v54 = v46;
                  __int16 v55 = 2080;
                  v56 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]";
                  __int16 v57 = 1024;
                  int v58 = 413;
                  v45 = " [%s] %s:%d Airplay Screen rules: No decode rules for this iPhone";
LABEL_106:
                  _os_log_impl(&dword_1E1EA4000, v44, OS_LOG_TYPE_DEFAULT, v45, (uint8_t *)&v53, 0x1Cu);
                }
              }
              goto LABEL_107;
            }
            double v16 = v17;
            [(VCVideoRuleCollections *)self addVideoRules:v17 transportType:1 payload:100 encodingType:2];
            if (!v7)
            {
LABEL_17:
              uint64_t v18 = 0;
              goto LABEL_71;
            }
          }
          else
          {
            double v16 = 0;
            if (!v7) {
              goto LABEL_17;
            }
          }
          __int16 v30 = iPhoneWiFiScreenEncodingRules(v14, 100, v9, v8);
          if (v30)
          {
            uint64_t v18 = v30;
            BOOL v6 = 1;
LABEL_64:
            v36 = self;
            v37 = v18;
            uint64_t v38 = 1;
LABEL_65:
            [(VCVideoRuleCollections *)v36 addVideoRules:v37 transportType:1 payload:100 encodingType:v38];
            goto LABEL_72;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v48 = VRTraceErrorLogLevelToCSTR();
            int v28 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v53 = 136315650;
              uint64_t v54 = v48;
              __int16 v55 = 2080;
              v56 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]";
              __int16 v57 = 1024;
              int v58 = 418;
              uint64_t v29 = " [%s] %s:%d Airplay Screen rules: No encode rules for this iPhone";
LABEL_101:
              _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, v29, (uint8_t *)&v53, 0x1Cu);
            }
          }
LABEL_102:
          uint64_t v18 = 0;
          goto LABEL_109;
        case 2:
          if (!v7)
          {
            uint64_t v18 = 0;
            if (!v4) {
              goto LABEL_70;
            }
LABEL_46:
            BOOL v31 = v9 == 1136.0;
            BOOL v32 = v8 == 640.0;
            if (v32 && v31) {
              int v33 = &g_AirplayWifiDecodingFormat1136x640;
            }
            else {
              int v33 = 0;
            }
            if (v32 && v31) {
              unsigned int v34 = 4;
            }
            else {
              unsigned int v34 = 0;
            }
            v35 = videoRulesForFormatList_1((uint64_t)v33, v34, 100);
            if (v35)
            {
              double v16 = v35;
              BOOL v6 = 1;
              v36 = self;
              v37 = v16;
              uint64_t v38 = 2;
              goto LABEL_65;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v49 = VRTraceErrorLogLevelToCSTR();
              v50 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                int v53 = 136315650;
                uint64_t v54 = v49;
                __int16 v55 = 2080;
                v56 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]";
                __int16 v57 = 1024;
                int v58 = 442;
                _os_log_impl(&dword_1E1EA4000, v50, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Airplay Screen rules: No HEVC decode rules for this iPod", (uint8_t *)&v53, 0x1Cu);
              }
            }
            goto LABEL_108;
          }
          if (v14 == 2)
          {
            unsigned int v19 = v8 == 640.0 && v9 == 1136.0;
            if (v8 == 640.0 && v9 == 1136.0) {
              BOOL v20 = &g_AirplayWifiEncodingFormat1136x640AVE;
            }
            else {
              BOOL v20 = 0;
            }
          }
          else
          {
            BOOL v20 = 0;
            unsigned int v19 = 0;
          }
          v41 = videoRulesForFormatList_1((uint64_t)v20, v19, 100);
          if (v41)
          {
            uint64_t v18 = v41;
            [(VCVideoRuleCollections *)self addVideoRules:v41 transportType:1 payload:100 encodingType:1];
            if (!v4)
            {
LABEL_70:
              double v16 = 0;
LABEL_71:
              BOOL v6 = 1;
              goto LABEL_72;
            }
            goto LABEL_46;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v52 = VRTraceErrorLogLevelToCSTR();
            v44 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v53 = 136315650;
              uint64_t v54 = v52;
              __int16 v55 = 2080;
              v56 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]";
              __int16 v57 = 1024;
              int v58 = 437;
              v45 = " [%s] %s:%d Airplay Screen rules: No HEVC encode rules for this iPod";
              goto LABEL_106;
            }
          }
          break;
        case 3:
        case 8:
          if (v4)
          {
            unsigned int v15 = videoRulesForFormatList_1((uint64_t)&g_AirplayWifiDecodingFormatiPad, 0xCu, 100);
            if (!v15)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v43 = VRTraceErrorLogLevelToCSTR();
                v44 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  int v53 = 136315650;
                  uint64_t v54 = v43;
                  __int16 v55 = 2080;
                  v56 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]";
                  __int16 v57 = 1024;
                  int v58 = 401;
                  v45 = " [%s] %s:%d Airplay Screen rules: No airplay decode rules for this iPad";
                  goto LABEL_106;
                }
              }
              goto LABEL_107;
            }
            double v16 = v15;
            [(VCVideoRuleCollections *)self addVideoRules:v15 transportType:1 payload:100 encodingType:2];
          }
          else
          {
            double v16 = 0;
          }
          BOOL v6 = 1;
          if (!v7) {
            goto LABEL_66;
          }
          if (v14 == 1) {
            uint64_t v24 = &g_AirplayWifiEncodingFormatiPadVXE;
          }
          else {
            uint64_t v24 = &g_AirplayWifiEncodingFormatiPadAVE;
          }
          if (v14 == 1) {
            unsigned int v25 = 1;
          }
          else {
            unsigned int v25 = 2;
          }
          uint64_t v26 = videoRulesForFormatList_1((uint64_t)v24, v25, 100);
          if (v26) {
            goto LABEL_63;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v27 = VRTraceErrorLogLevelToCSTR();
            int v28 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v53 = 136315650;
              uint64_t v54 = v27;
              __int16 v55 = 2080;
              v56 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]";
              __int16 v57 = 1024;
              int v58 = 406;
              uint64_t v29 = " [%s] %s:%d Airplay Screen rules: No encode rules for this iPad";
              goto LABEL_101;
            }
          }
          goto LABEL_102;
        case 4:
          if (v4)
          {
            BOOL v21 = videoRulesForFormatList_1((uint64_t)&g_AirplayWifiDecodingFormatiPad, 0xCu, 100);
            if (!v21)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v47 = VRTraceErrorLogLevelToCSTR();
                v44 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  int v53 = 136315650;
                  uint64_t v54 = v47;
                  __int16 v55 = 2080;
                  v56 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]";
                  __int16 v57 = 1024;
                  int v58 = 425;
                  v45 = " [%s] %s:%d Airplay Screen rules: No decode rules for this apple tv";
                  goto LABEL_106;
                }
              }
              goto LABEL_107;
            }
            double v16 = v21;
            [(VCVideoRuleCollections *)self addVideoRules:v21 transportType:1 payload:100 encodingType:2];
          }
          else
          {
            double v16 = 0;
          }
          BOOL v6 = 1;
          if (!v7)
          {
LABEL_66:
            uint64_t v18 = 0;
            goto LABEL_72;
          }
          if (v14 == 1) {
            v39 = &g_AirplayWifiEncodingFormatiPadVXE;
          }
          else {
            v39 = &g_AirplayWifiEncodingFormatiPadAVE;
          }
          if (v14 == 1) {
            unsigned int v40 = 1;
          }
          else {
            unsigned int v40 = 2;
          }
          uint64_t v26 = videoRulesForFormatList_1((uint64_t)v39, v40, 100);
          if (v26)
          {
LABEL_63:
            uint64_t v18 = v26;
            goto LABEL_64;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v51 = VRTraceErrorLogLevelToCSTR();
            int v28 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v53 = 136315650;
              uint64_t v54 = v51;
              __int16 v55 = 2080;
              v56 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]";
              __int16 v57 = 1024;
              int v58 = 430;
              uint64_t v29 = " [%s] %s:%d Airplay Screen rules: No encode rules for this apple tv";
              goto LABEL_101;
            }
          }
          goto LABEL_102;
        default:
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            return 0;
          }
          uint64_t v22 = VRTraceErrorLogLevelToCSTR();
          v23 = *MEMORY[0x1E4F47A50];
          BOOL v6 = 0;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v53 = 136315650;
            uint64_t v54 = v22;
            __int16 v55 = 2080;
            v56 = "-[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]";
            __int16 v57 = 1024;
            int v58 = 449;
            _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Device has no Airplay Screen rules", (uint8_t *)&v53, 0x1Cu);
            return 0;
          }
          return v6;
      }
    }
    goto LABEL_107;
  }
  unsigned int v10 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings screenWidth];
  if (v10)
  {
    unsigned int v11 = v10;
    unsigned int v12 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings screenHeight];
    if (v12)
    {
      double v9 = (double)v11;
      double v8 = (double)v12;
      goto LABEL_9;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoRuleCollectionsScreenAirplayEmbedded setupHEVCRules]();
    }
  }
LABEL_107:
  uint64_t v18 = 0;
LABEL_108:
  double v16 = 0;
LABEL_109:
  BOOL v6 = 0;
LABEL_72:

  return v6;
}

- (void)initWithHardwareSettings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create H264/HEVC rules for Airplay screen!", v2, v3, v4, v5, v6);
}

- (void)setupH264Rules
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Screen rules: Could not retrieve main screen height", v2, v3, v4, v5, v6);
}

- (void)setupHEVCRules
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Screen rules: Could not retrieve main screen height", v2, v3, v4, v5, v6);
}

@end