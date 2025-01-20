@interface VCVideoRuleCollectionsCameraMac
+ (id)sharedInstance;
- (BOOL)setUp1080pRules:(int)a3;
- (BOOL)setupH264Rules;
- (BOOL)setupH264WifiRules;
- (BOOL)setupHEVCRules;
- (BOOL)setupRules;
- (BOOL)useSoftFramerateSwitching;
- (VCVideoRuleCollectionsCameraMac)initWithHardwareSettings:(id)a3;
- (double)preferredAspectRatio;
- (void)_addWVGAEncodingRules;
- (void)_removeRulesGreaterThan720p;
- (void)_removeRulesGreaterThanVGA;
- (void)_resetJ92EncodingRulesForCameraIsHD:(BOOL)a3 isWVGA:(BOOL)a4 is1080:(BOOL)a5;
- (void)computeDecodingScore;
- (void)computeEncodingScore;
- (void)dealloc;
- (void)initSupportedPayloads;
- (void)resetEncodingRulesForCameraIsHD:(BOOL)a3 isWVGA:(BOOL)a4 is1080:(BOOL)a5;
- (void)setupH264WifiRules;
- (void)setupHEVCRules;
@end

@implementation VCVideoRuleCollectionsCameraMac

- (VCVideoRuleCollectionsCameraMac)initWithHardwareSettings:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)VCVideoRuleCollectionsCameraMac;
  v4 = [(VCVideoRuleCollections *)&v13 init];
  v5 = v4;
  if (v4)
  {
    v4->_hardwareSettings = (VCHardwareSettingsMacProtocol *)a3;
    [(VCVideoRuleCollectionsCameraMac *)v4 initSupportedPayloads];
    [(VCVideoRuleCollectionsCameraMac *)v5 computeEncodingScore];
    [(VCVideoRuleCollectionsCameraMac *)v5 computeDecodingScore];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = *(_DWORD *)(&v5->super._decodeHighDef + 3);
        int v9 = *(&v5->super.super._encodingType + 1);
        unsigned int encodeScore = v5->_encodeScore;
        int v11 = *(&v5->super.super._encodingType + 2);
        *(_DWORD *)buf = 136316674;
        uint64_t v15 = v6;
        __int16 v16 = 2080;
        v17 = "-[VCVideoRuleCollectionsCameraMac initWithHardwareSettings:]";
        __int16 v18 = 1024;
        int v19 = 31;
        __int16 v20 = 1024;
        int v21 = v8;
        __int16 v22 = 1024;
        int v23 = v9;
        __int16 v24 = 1024;
        unsigned int v25 = encodeScore;
        __int16 v26 = 1024;
        int v27 = v11;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d encode score = %d, encodingHighDef = %d decoding score = %d, decodeHighDef = %d", buf, 0x34u);
      }
    }
    if (![(VCVideoRuleCollectionsCameraMac *)v5 setupRules])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoRuleCollectionsCameraMac initWithHardwareSettings:]();
        }
      }

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = self;
  v2.super_class = (Class)VCVideoRuleCollectionsCameraMac;
  [(VCVideoRuleCollections *)&v2 dealloc];
}

- (void)initSupportedPayloads
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = (void *)[(VCHardwareSettingsMacProtocol *)self->_hardwareSettings supportedVideoPayloads];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        -[VCVideoRuleCollections addSupportedPayload:](self, "addSupportedPayload:", [*(id *)(*((void *)&v9 + 1) + 8 * v7++) unsignedIntValue]);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v5);
  }
}

+ (id)sharedInstance
{
  return 0;
}

- (double)preferredAspectRatio
{
  return 1.77777778;
}

- (void)computeEncodingScore
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [+[VCDefaults sharedInstance] encodingScore];
  if (v3 - 1 > 0x1D)
  {
    *(&self->super.super._encodingType + 1) = [(VCHardwareSettingsMacProtocol *)self->_hardwareSettings canDoHiDefEncoding];
    *(_DWORD *)(&self->super._decodeHighDef + 3) = [(VCHardwareSettingsMacProtocol *)self->_hardwareSettings hardwareScore];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      long long v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = *(_DWORD *)(&self->super._decodeHighDef + 3);
        int v13 = *(&self->super.super._encodingType + 1);
        int v14 = 136316162;
        uint64_t v15 = v10;
        __int16 v16 = 2080;
        v17 = "-[VCVideoRuleCollectionsCameraMac computeEncodingScore]";
        __int16 v18 = 1024;
        int v19 = 75;
        __int16 v20 = 1024;
        int v21 = v12;
        __int16 v22 = 1024;
        int v23 = v13;
        uint64_t v7 = " [%s] %s:%d Setting encode score to %d, _encodeHighDef=%d";
        int v8 = v11;
        uint32_t v9 = 40;
        goto LABEL_8;
      }
    }
  }
  else
  {
    *(_DWORD *)(&self->super._decodeHighDef + 3) = v3;
    *(&self->super.super._encodingType + 1) = v3 > 0x18;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(_DWORD *)(&self->super._decodeHighDef + 3);
        int v14 = 136315906;
        uint64_t v15 = v4;
        __int16 v16 = 2080;
        v17 = "-[VCVideoRuleCollectionsCameraMac computeEncodingScore]";
        __int16 v18 = 1024;
        int v19 = 71;
        __int16 v20 = 1024;
        int v21 = v6;
        uint64_t v7 = " [%s] %s:%d Found default encode score setting, setting encode score to %d";
        int v8 = v5;
        uint32_t v9 = 34;
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, v9);
      }
    }
  }
}

- (void)computeDecodingScore
{
  self->_unsigned int encodeScore = *(_DWORD *)(&self->super._decodeHighDef + 3);
  int v3 = *(&self->super.super._encodingType + 1);
  *(&self->super.super._encodingType + 2) = v3;
  if (v3 || *(_DWORD *)(&self->super._decodeHighDef + 3) >= 0x16u) {
    self->_unsigned int encodeScore = 30;
  }
  if ([+[VCDefaults sharedInstance] canDecodeHD])
  {
    [(VCHardwareSettingsMacProtocol *)self->_hardwareSettings canDoHiDefDecoding];
  }
  *(&self->super.super._encodingType + 2) = self->_encodeScore > 0x19;
}

- (BOOL)setupH264WifiRules
{
  int v3 = [VCVideoRule alloc];
  LODWORD(v4) = 15.0;
  uint64_t v5 = [(VCVideoRule *)v3 initWithFrameWidth:320 frameHeight:240 frameRate:126 payload:v4];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules]();
      }
    }
    goto LABEL_38;
  }
  int v6 = [VCVideoRule alloc];
  LODWORD(v7) = 30.0;
  v49 = [(VCVideoRule *)v6 initWithFrameWidth:320 frameHeight:240 frameRate:126 payload:v7];
  if (!v49)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules]();
      }
    }
LABEL_38:
    BOOL v42 = 0;
    v37 = 0;
    v33 = 0;
    v29 = 0;
    unsigned int v25 = 0;
    v44 = 0;
    v45 = 0;
    int v19 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
LABEL_84:
    v41 = 0;
    v39 = 0;
    goto LABEL_31;
  }
  int v8 = [VCVideoRule alloc];
  LODWORD(v9) = 15.0;
  v48 = [(VCVideoRule *)v8 initWithFrameWidth:480 frameHeight:368 frameRate:126 payload:v9];
  if (!v48)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules]();
      }
    }
    BOOL v42 = 0;
    v37 = 0;
    v33 = 0;
    v29 = 0;
    unsigned int v25 = 0;
    v44 = 0;
    v45 = 0;
    int v19 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    goto LABEL_84;
  }
  uint64_t v10 = [VCVideoRule alloc];
  LODWORD(v11) = 30.0;
  v46 = [(VCVideoRule *)v10 initWithFrameWidth:480 frameHeight:368 frameRate:126 payload:v11];
  if (!v46)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.4();
      }
    }
    BOOL v42 = 0;
    v37 = 0;
    v33 = 0;
    v29 = 0;
    unsigned int v25 = 0;
    v44 = 0;
    v45 = 0;
    int v19 = 0;
    v46 = 0;
    v47 = 0;
    goto LABEL_84;
  }
  int v12 = [VCVideoRule alloc];
  LODWORD(v13) = 15.0;
  v47 = [(VCVideoRule *)v12 initWithFrameWidth:640 frameHeight:480 frameRate:126 payload:v13];
  if (!v47)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.5();
      }
    }
    BOOL v42 = 0;
    v37 = 0;
    v33 = 0;
    v29 = 0;
    unsigned int v25 = 0;
    v44 = 0;
    v45 = 0;
    int v19 = 0;
    v47 = 0;
    goto LABEL_84;
  }
  int v14 = [VCVideoRule alloc];
  LODWORD(v15) = 30.0;
  v45 = [(VCVideoRule *)v14 initWithFrameWidth:640 frameHeight:480 frameRate:126 payload:v15];
  if (!v45)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.6();
      }
    }
    BOOL v42 = 0;
    v37 = 0;
    v33 = 0;
    v29 = 0;
    unsigned int v25 = 0;
    v44 = 0;
    v45 = 0;
    goto LABEL_59;
  }
  __int16 v16 = [VCVideoRule alloc];
  LODWORD(v17) = 15.0;
  uint64_t v18 = [(VCVideoRule *)v16 initWithFrameWidth:848 frameHeight:480 frameRate:126 payload:v17];
  if (!v18)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.7();
      }
    }
    BOOL v42 = 0;
    v37 = 0;
    v33 = 0;
    v29 = 0;
    unsigned int v25 = 0;
    v44 = 0;
LABEL_59:
    int v19 = 0;
    goto LABEL_84;
  }
  int v19 = (void *)v18;
  __int16 v20 = [VCVideoRule alloc];
  LODWORD(v21) = 30.0;
  v44 = [(VCVideoRule *)v20 initWithFrameWidth:848 frameHeight:480 frameRate:126 payload:v21];
  if (!v44)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.8();
      }
    }
    BOOL v42 = 0;
    v37 = 0;
    v33 = 0;
    v29 = 0;
    unsigned int v25 = 0;
    v44 = 0;
    goto LABEL_84;
  }
  __int16 v22 = [VCVideoRule alloc];
  LODWORD(v23) = 15.0;
  uint64_t v24 = [(VCVideoRule *)v22 initWithFrameWidth:1024 frameHeight:768 frameRate:126 payload:v23];
  if (!v24)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules].cold.9();
      }
    }
    BOOL v42 = 0;
    v37 = 0;
    v33 = 0;
    v29 = 0;
    unsigned int v25 = 0;
    goto LABEL_84;
  }
  unsigned int v25 = (void *)v24;
  __int16 v26 = [VCVideoRule alloc];
  LODWORD(v27) = 30.0;
  uint64_t v28 = [(VCVideoRule *)v26 initWithFrameWidth:1024 frameHeight:768 frameRate:126 payload:v27];
  if (!v28)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules]0();
      }
    }
    BOOL v42 = 0;
    v37 = 0;
    v33 = 0;
    v29 = 0;
    goto LABEL_84;
  }
  v29 = (void *)v28;
  v30 = [VCVideoRule alloc];
  LODWORD(v31) = 15.0;
  uint64_t v32 = [(VCVideoRule *)v30 initWithFrameWidth:1280 frameHeight:720 frameRate:126 payload:v31];
  if (!v32)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules]1();
      }
    }
    BOOL v42 = 0;
    v37 = 0;
    v33 = 0;
    goto LABEL_84;
  }
  v33 = (void *)v32;
  v34 = [VCVideoRule alloc];
  LODWORD(v35) = 30.0;
  uint64_t v36 = [(VCVideoRule *)v34 initWithFrameWidth:1280 frameHeight:720 frameRate:126 payload:v35];
  if (!v36)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules]2();
      }
    }
    BOOL v42 = 0;
    v37 = 0;
    goto LABEL_84;
  }
  v37 = (void *)v36;
  uint64_t v38 = objc_opt_new();
  if (!v38)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules]3();
      }
    }
    BOOL v42 = 0;
    goto LABEL_84;
  }
  v39 = (void *)v38;
  uint64_t v40 = objc_opt_new();
  if (v40)
  {
    v41 = (void *)v40;
    [v39 addObject:v5];
    if (*(_DWORD *)(&self->super._decodeHighDef + 3) >= 0xBu)
    {
      [v39 addObject:v49];
      [v39 addObject:v48];
      if (*(_DWORD *)(&self->super._decodeHighDef + 3) >= 0x10u)
      {
        [v39 addObject:v47];
        if (*(_DWORD *)(&self->super._decodeHighDef + 3) >= 0x15u)
        {
          [v39 addObject:v46];
          [v39 addObject:v45];
          if (*(_DWORD *)(&self->super._decodeHighDef + 3) >= 0x1Au)
          {
            [v39 addObject:v25];
            [v39 addObject:v33];
            if (*(_DWORD *)(&self->super._decodeHighDef + 3) >= 0x1Du)
            {
              [v39 addObject:v29];
              [v39 addObject:v37];
            }
          }
        }
      }
    }
    objc_msgSend(v41, "addObject:", v5, v44);
    if (self->_encodeScore >= 0xB)
    {
      [v41 addObject:v49];
      [v41 addObject:v48];
      if (self->_encodeScore >= 0x10)
      {
        [v41 addObject:v47];
        if (self->_encodeScore >= 0x15)
        {
          [v41 addObject:v46];
          [v41 addObject:v45];
          [v41 addObject:v44];
          if (self->_encodeScore >= 0x1A)
          {
            [v41 addObject:v33];
            if (self->_encodeScore >= 0x1D) {
              [v41 addObject:v37];
            }
          }
        }
      }
    }
    if ([(VCVideoRuleCollections *)self isPayloadSupported:126])
    {
      [(VCVideoRuleCollections *)self addVideoRules:v39 transportType:1 payload:126 encodingType:1];
      [(VCVideoRuleCollections *)self addVideoRules:v41 transportType:1 payload:126 encodingType:2];
    }
    BOOL v42 = 1;
    if ([(VCVideoRuleCollections *)self isPayloadSupported:123])
    {
      [(VCVideoRuleCollections *)self addVideoRules:v39 transportType:1 payload:123 encodingType:1];
      [(VCVideoRuleCollections *)self addVideoRules:v41 transportType:1 payload:123 encodingType:2];
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraMac setupH264WifiRules]4();
      }
    }
    BOOL v42 = 0;
    v41 = 0;
  }
LABEL_31:

  return v42;
}

- (BOOL)setupHEVCRules
{
  if ([(VCHardwareSettingsMacProtocol *)self->_hardwareSettings supportHEVC]
    && [(VCHardwareSettingsMacProtocol *)self->_hardwareSettings canDoHEVC]
    && [(VCVideoRuleCollections *)self isPayloadSupported:100])
  {
    int v3 = objc_opt_new();
    double v4 = objc_opt_new();
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = objc_opt_new();
    double v7 = (void *)v6;
    if (v3)
    {
      if (v4)
      {
        if (v5)
        {
          if (v6)
          {
            int v8 = [VCVideoRule alloc];
            LODWORD(v9) = 15.0;
            uint64_t v10 = [(VCVideoRule *)v8 initWithFrameWidth:320 frameHeight:240 frameRate:126 payload:v9];
            if (v10)
            {
              double v11 = (void *)v10;
              int v12 = [VCVideoRule alloc];
              LODWORD(v13) = 15.0;
              uint64_t v14 = [(VCVideoRule *)v12 initWithFrameWidth:480 frameHeight:368 frameRate:126 payload:v13];
              if (v14)
              {
                double v15 = (void *)v14;
                __int16 v16 = [VCVideoRule alloc];
                LODWORD(v17) = 30.0;
                uint64_t v18 = [(VCVideoRule *)v16 initWithFrameWidth:480 frameHeight:368 frameRate:126 payload:v17];
                int v19 = [VCVideoRule alloc];
                LODWORD(v20) = 15.0;
                v73 = [(VCVideoRule *)v19 initWithFrameWidth:480 frameHeight:272 frameRate:100 payload:v20];
                v69 = (void *)v18;
                if (v73)
                {
                  double v21 = [VCVideoRule alloc];
                  LODWORD(v22) = 30.0;
                  uint64_t v68 = [(VCVideoRule *)v21 initWithFrameWidth:480 frameHeight:272 frameRate:100 payload:v22];
                  if (v68)
                  {
                    double v23 = [VCVideoRule alloc];
                    LODWORD(v24) = 30.0;
                    v76 = [(VCVideoRule *)v23 initWithFrameWidth:1024 frameHeight:768 frameRate:100 payload:v24];
                    if (v76)
                    {
                      unsigned int v25 = [VCVideoRule alloc];
                      LODWORD(v26) = 30.0;
                      v77 = [(VCVideoRule *)v25 initWithFrameWidth:1024 frameHeight:576 frameRate:100 payload:v26];
                      if (v77)
                      {
                        double v27 = [VCVideoRule alloc];
                        LODWORD(v28) = 30.0;
                        v75 = [(VCVideoRule *)v27 initWithFrameWidth:1280 frameHeight:720 frameRate:100 payload:v28];
                        if (v75)
                        {
                          v29 = [VCVideoRule alloc];
                          LODWORD(v30) = 1114636288;
                          v74 = [(VCVideoRule *)v29 initWithFrameWidth:1280 frameHeight:720 frameRate:100 payload:v30];
                          if (v74)
                          {
                            [v5 addObject:v11];
                            [v5 addObject:v15];
                            [v5 addObject:v18];
                            [v5 addObject:v76];
                            [v5 addObject:v77];
                            if ([(VCHardwareSettingsMacProtocol *)self->_hardwareSettings vcpSupportsHEVCEncoder])[(VCVideoRuleCollections *)self addVideoRules:v5 transportType:2 payload:100 encodingType:1]; {
                            double v31 = [VCVideoRule alloc];
                            }
                            LODWORD(v32) = 30.0;
                            v72 = [(VCVideoRule *)v31 initWithFrameWidth:480 frameHeight:272 frameRate:100 payload:v32];
                            if (v72)
                            {
                              v70 = v4;
                              v33 = [VCVideoRule alloc];
                              LODWORD(v34) = 30.0;
                              uint64_t v35 = [(VCVideoRule *)v33 initWithFrameWidth:1024 frameHeight:576 frameRate:100 payload:v34];
                              if (v35)
                              {
                                v37 = (void *)v35;
                                v71 = v5;
                                LODWORD(v36) = 1.0;
                                [(VCVideoRule *)v72 setFPref:v36];
                                LODWORD(v38) = 1.0;
                                [v37 setFPref:v38];
                                v39 = v11;
                                [v7 addObject:v11];
                                v67 = v15;
                                [v7 addObject:v15];
                                [v7 addObject:v18];
                                [v7 addObject:v73];
                                [v7 addObject:v72];
                                v66 = v37;
                                [v7 addObject:v37];
                                [(VCVideoRuleCollections *)self addVideoRules:v7 transportType:2 payload:100 encodingType:2];
                                [v3 addObject:v77];
                                [v3 addObject:v76];
                                [v3 addObject:v75];
                                uint64_t v40 = v3;
                                [v3 addObject:v74];
                                if ([+[VCDefaults sharedInstance] forceHWI])
                                {
                                  int v41 = [+[VCDefaults sharedInstance] forceVideoPayload];
                                  double v4 = v70;
                                  BOOL v42 = v71;
                                  v43 = v39;
                                  if (v41 == 100)
                                  {
                                    v64 = [VCVideoRule alloc];
                                    v65 = v7;
                                    uint64_t v44 = [+[VCDefaults sharedInstance] forceEncodeWidth];
                                    uint64_t v45 = [+[VCDefaults sharedInstance] forceEncodeHeight];
                                    *(float *)&double v46 = (float)[+[VCDefaults sharedInstance] forceEncodeFramerate];
                                    int v41 = 100;
                                    uint64_t v47 = v44;
                                    double v4 = v70;
                                    BOOL v42 = v71;
                                    uint64_t v48 = v45;
                                    uint64_t v40 = v3;
                                    v49 = [(VCVideoRule *)v64 initWithFrameWidth:v47 frameHeight:v48 frameRate:100 payload:v46];
                                    [v3 addObject:v49];
                                    [(VCVideoRuleCollections *)self addVideoRules:v3 transportType:1 payload:100 encodingType:1];

                                    double v7 = v65;
                                  }
                                }
                                else
                                {
                                  int v41 = 128;
                                  double v4 = v70;
                                  BOOL v42 = v71;
                                  v43 = v39;
                                }
                                if ([(VCHardwareSettingsMacProtocol *)self->_hardwareSettings vcpSupportsHEVCEncoder])[(VCVideoRuleCollections *)self addVideoRules:v40 transportType:1 payload:100 encodingType:1]; {
                                v52 = v40;
                                }
                                [v4 addObject:v77];
                                [v4 addObject:v75];
                                [v4 addObject:v74];
                                BOOL v53 = [+[VCDefaults sharedInstance] forceHWI];
                                uint64_t v5 = v42;
                                double v11 = v43;
                                if (v41 == 100 && v53)
                                {
                                  v54 = v7;
                                  v55 = [VCVideoRule alloc];
                                  uint64_t v56 = [+[VCDefaults sharedInstance] forceEncodeWidth];
                                  uint64_t v57 = [+[VCDefaults sharedInstance] forceEncodeHeight];
                                  *(float *)&double v58 = (float)[+[VCDefaults sharedInstance] forceEncodeFramerate];
                                  uint64_t v59 = v57;
                                  double v11 = v43;
                                  v60 = [(VCVideoRule *)v55 initWithFrameWidth:v56 frameHeight:v59 frameRate:100 payload:v58];
                                  [v4 addObject:v60];

                                  double v7 = v54;
                                  uint64_t v5 = v71;
                                }
                                BOOL v50 = 1;
                                [(VCVideoRuleCollections *)self addVideoRules:v4 transportType:1 payload:100 encodingType:2];
                                v61 = v67;
                                v62 = (void *)v68;
                                v63 = v66;
                                goto LABEL_32;
                              }
                              v52 = v3;
                              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                              {
                                VRTraceErrorLogLevelToCSTR();
                                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                                  -[VCVideoRuleCollectionsCameraMac setupHEVCRules]4();
                                }
                              }
                              v63 = 0;
                              BOOL v50 = 0;
                              goto LABEL_83;
                            }
                            v52 = v3;
                            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                            {
                              VRTraceErrorLogLevelToCSTR();
                              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                                -[VCVideoRuleCollectionsCameraMac setupHEVCRules]3();
                              }
                            }
                            v63 = 0;
                            v72 = 0;
                          }
                          else
                          {
                            v52 = v3;
                            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                            {
                              VRTraceErrorLogLevelToCSTR();
                              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                                -[VCVideoRuleCollectionsCameraMac setupHEVCRules]2();
                              }
                            }
                            v63 = 0;
                            v72 = 0;
                            v74 = 0;
                          }
                        }
                        else
                        {
                          v52 = v3;
                          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                          {
                            VRTraceErrorLogLevelToCSTR();
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                              -[VCVideoRuleCollectionsCameraMac setupHEVCRules]1();
                            }
                          }
                          v63 = 0;
                          v72 = 0;
                          v74 = 0;
                          v75 = 0;
                        }
                      }
                      else
                      {
                        v52 = v3;
                        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                        {
                          VRTraceErrorLogLevelToCSTR();
                          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                            -[VCVideoRuleCollectionsCameraMac setupHEVCRules]0();
                          }
                        }
                        v63 = 0;
                        v72 = 0;
                        v74 = 0;
                        v75 = 0;
                        v77 = 0;
                      }
                    }
                    else
                    {
                      v52 = v3;
                      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                      {
                        VRTraceErrorLogLevelToCSTR();
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                          -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.9();
                        }
                      }
                      v63 = 0;
                      v72 = 0;
                      v74 = 0;
                      v75 = 0;
                      v77 = 0;
                      v76 = 0;
                    }
                    BOOL v50 = 0;
LABEL_83:
                    v61 = v15;
                    v62 = (void *)v68;
                    goto LABEL_32;
                  }
                  v61 = v15;
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    VRTraceErrorLogLevelToCSTR();
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                      -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.8();
                    }
                  }
                  v63 = 0;
                  v72 = 0;
                  v74 = 0;
                  v75 = 0;
                  v77 = 0;
                  v76 = 0;
                  v62 = 0;
                }
                else
                {
                  v61 = v15;
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    VRTraceErrorLogLevelToCSTR();
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                      -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.7();
                    }
                  }
                  v63 = 0;
                  v72 = 0;
                  v74 = 0;
                  v75 = 0;
                  v77 = 0;
                  v76 = 0;
                  v62 = 0;
                  v73 = 0;
                }
              }
              else
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.6();
                  }
                }
                v63 = 0;
                v72 = 0;
                v74 = 0;
                v75 = 0;
                v77 = 0;
                v76 = 0;
                v62 = 0;
                v73 = 0;
                v69 = 0;
                v61 = 0;
              }
LABEL_49:
              BOOL v50 = 0;
              v52 = v3;
LABEL_32:

              return v50;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.5();
              }
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCVideoRuleCollectionsCameraMac setupHEVCRules].cold.4();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCVideoRuleCollectionsCameraMac setupHEVCRules]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoRuleCollectionsCameraMac setupHEVCRules]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraMac setupHEVCRules]();
      }
    }
    v63 = 0;
    v72 = 0;
    v74 = 0;
    v75 = 0;
    v77 = 0;
    v76 = 0;
    v62 = 0;
    v73 = 0;
    v69 = 0;
    v61 = 0;
    double v11 = 0;
    goto LABEL_49;
  }
  return 1;
}

- (BOOL)setupH264Rules
{
  if ([(VCVideoRuleCollections *)self isPayloadSupported:126]
    || [(VCVideoRuleCollections *)self isPayloadSupported:123])
  {
    BOOL v3 = [(VCVideoRuleCollectionsCameraMac *)self setupH264WifiRules];
    if (v3)
    {
      LOBYTE(v3) = [(VCVideoRuleCollectionsCamera *)self setupH264CellularRules];
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)setUp1080pRules:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((a3 != 100
     || [(VCHardwareSettingsMacProtocol *)self->_hardwareSettings supportHEVC]
     && [(VCHardwareSettingsMacProtocol *)self->_hardwareSettings canDoHEVC])
    && [(VCVideoRuleCollections *)self isPayloadSupported:v3])
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = objc_opt_new();
    double v7 = (void *)v6;
    if (v5)
    {
      if (v6)
      {
        if (v3 == 123) {
          uint64_t v8 = 126;
        }
        else {
          uint64_t v8 = v3;
        }
        double v9 = [VCVideoRule alloc];
        LODWORD(v10) = 30.0;
        uint64_t v11 = [(VCVideoRule *)v9 initWithFrameWidth:1920 frameHeight:1080 frameRate:v8 payload:v10];
        if (v11)
        {
          int v12 = (void *)v11;
          double v13 = [VCVideoRule alloc];
          LODWORD(v14) = 1114636288;
          double v15 = [(VCVideoRule *)v13 initWithFrameWidth:1920 frameHeight:1080 frameRate:v8 payload:v14];
          __int16 v16 = [VCVideoRule alloc];
          LODWORD(v17) = 30.0;
          uint64_t v18 = [(VCVideoRule *)v16 initWithFrameWidth:1664 frameHeight:1248 frameRate:v8 payload:v17];
          if (v18)
          {
            int v19 = (void *)v18;
            double v20 = [VCVideoRule alloc];
            LODWORD(v21) = 1114636288;
            double v22 = [(VCVideoRule *)v20 initWithFrameWidth:1088 frameHeight:1088 frameRate:v8 payload:v21];
            double v23 = [VCVideoRule alloc];
            LODWORD(v24) = 30.0;
            unsigned int v25 = [(VCVideoRule *)v23 initWithFrameWidth:1088 frameHeight:1088 frameRate:v8 payload:v24];
            if (![(VCHardwareSettingsMacProtocol *)self->_hardwareSettings supports1080pEncoding])goto LABEL_17; {
            [v5 addObject:v12];
            }
            [v5 addObject:v19];
            [v5 addObject:v22];
            [v5 addObject:v25];
            uint64_t v26 = v3;
            if (v3 == 100)
            {
              if (![(VCHardwareSettingsMacProtocol *)self->_hardwareSettings vcpSupportsHEVCEncoder])goto LABEL_17; {
              uint64_t v26 = 100;
              }
            }
            [(VCVideoRuleCollections *)self appendVideoRules:v5 transportType:1 payload:v26 encodingType:1];
LABEL_17:
            if ([(VCHardwareSettingsMacProtocol *)self->_hardwareSettings supports1080pDecoding])
            {
              [v7 addObject:v12];
              [v7 addObject:v15];
              if (+[VCHardwareSettings supportsDecodingSquareCameraVideo])
              {
                [v7 addObject:v22];
                [v7 addObject:v25];
              }
              BOOL v27 = 1;
              [(VCVideoRuleCollections *)self appendVideoRules:v7 transportType:1 payload:v3 encodingType:2];
            }
            else
            {
              BOOL v27 = 1;
            }
            goto LABEL_23;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCVideoRuleCollectionsCameraMac setUp1080pRules:].cold.4();
            }
          }
          unsigned int v25 = 0;
          double v22 = 0;
          int v19 = 0;
LABEL_39:
          BOOL v27 = 0;
LABEL_23:

          return v27;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCVideoRuleCollectionsCameraMac setUp1080pRules:]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoRuleCollectionsCameraMac setUp1080pRules:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraMac setUp1080pRules:]();
      }
    }
    unsigned int v25 = 0;
    double v22 = 0;
    int v19 = 0;
    double v15 = 0;
    int v12 = 0;
    goto LABEL_39;
  }
  return 1;
}

- (BOOL)setupRules
{
  BOOL v3 = [(VCVideoRuleCollectionsCameraMac *)self setupH264Rules]
    && [(VCVideoRuleCollectionsCameraMac *)self setupHEVCRules]
    && [(VCVideoRuleCollectionsCameraMac *)self setUp1080pRules:126]
    && [(VCVideoRuleCollectionsCameraMac *)self setUp1080pRules:123]
    && [(VCVideoRuleCollectionsCameraMac *)self setUp1080pRules:100];
  [(VCVideoRuleCollectionsCamera *)self limitVideoRules];
  return v3;
}

- (BOOL)useSoftFramerateSwitching
{
  return [(VCHardwareSettingsMacProtocol *)self->_hardwareSettings useSoftFramerateSwitching];
}

- (void)_addWVGAEncodingRules
{
  BOOL v3 = [VCVideoRule alloc];
  LODWORD(v4) = 15.0;
  uint64_t v5 = [(VCVideoRule *)v3 initWithFrameWidth:848 frameHeight:480 frameRate:126 payload:v4];
  uint64_t v6 = [VCVideoRule alloc];
  LODWORD(v7) = 30.0;
  double v9 = [(VCVideoRule *)v6 initWithFrameWidth:848 frameHeight:480 frameRate:126 payload:v7];
  uint64_t v8 = objc_opt_new();
  [v8 addObject:v5];
  [v8 addObject:v9];
  [(VCVideoRuleCollections *)self appendVideoRules:v8 transportType:1 payload:126 encodingType:1];
  [(VCVideoRuleCollections *)self appendVideoRules:v8 transportType:1 payload:123 encodingType:1];
}

- (void)_removeRulesGreaterThanVGA
{
  [(VCVideoRuleCollections *)self removeVideoRulesWithWidth:1280 height:720 transportType:1 encodingType:1];
  [(VCVideoRuleCollections *)self removeVideoRulesWithWidth:1024 height:768 transportType:1 encodingType:1];
  [(VCVideoRuleCollections *)self removeVideoRulesWithWidth:1920 height:1080 transportType:1 encodingType:1];

  [(VCVideoRuleCollections *)self removeVideoRulesWithWidth:1664 height:1248 transportType:1 encodingType:1];
}

- (void)_removeRulesGreaterThan720p
{
  [(VCVideoRuleCollections *)self removeVideoRulesWithWidth:1920 height:1080 transportType:1 encodingType:1];

  [(VCVideoRuleCollections *)self removeVideoRulesWithWidth:1664 height:1248 transportType:1 encodingType:1];
}

- (void)_resetJ92EncodingRulesForCameraIsHD:(BOOL)a3 isWVGA:(BOOL)a4 is1080:(BOOL)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a4 || a5 || a3)
  {
    if (a3 && !a5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        double v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136315650;
          uint64_t v11 = v8;
          __int16 v12 = 2080;
          double v13 = "-[VCVideoRuleCollectionsCameraMac _resetJ92EncodingRulesForCameraIsHD:isWVGA:is1080:]";
          __int16 v14 = 1024;
          int v15 = 451;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d 720p camera. removing rules greater than 720p", (uint8_t *)&v10, 0x1Cu);
        }
      }
      [(VCVideoRuleCollectionsCameraMac *)self _removeRulesGreaterThan720p];
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      double v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315650;
        uint64_t v11 = v6;
        __int16 v12 = 2080;
        double v13 = "-[VCVideoRuleCollectionsCameraMac _resetJ92EncodingRulesForCameraIsHD:isWVGA:is1080:]";
        __int16 v14 = 1024;
        int v15 = 447;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d built in J92 camera. removing rules greater than VGA. adding WVGA encoding rules", (uint8_t *)&v10, 0x1Cu);
      }
    }
    [(VCVideoRuleCollectionsCameraMac *)self _removeRulesGreaterThanVGA];
    [(VCVideoRuleCollectionsCameraMac *)self _addWVGAEncodingRules];
  }
}

- (void)resetEncodingRulesForCameraIsHD:(BOOL)a3 isWVGA:(BOOL)a4 is1080:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    int v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136316418;
      uint64_t v18 = v9;
      __int16 v19 = 2080;
      double v20 = "-[VCVideoRuleCollectionsCameraMac resetEncodingRulesForCameraIsHD:isWVGA:is1080:]";
      __int16 v21 = 1024;
      int v22 = 458;
      __int16 v23 = 1024;
      BOOL v24 = v7;
      __int16 v25 = 1024;
      BOOL v26 = v6;
      __int16 v27 = 1024;
      BOOL v28 = v5;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d isHD = %d, isWVGA = %d, is1080 = %d", (uint8_t *)&v17, 0x2Eu);
    }
  }
  if (![(VCVideoRuleCollectionsCameraMac *)self setupRules]
    && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoRuleCollectionsCameraMac resetEncodingRulesForCameraIsHD:isWVGA:is1080:]();
    }
  }
  if ([(VCHardwareSettingsMacProtocol *)self->_hardwareSettings isMacBookWVGA])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      __int16 v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315650;
        uint64_t v18 = v11;
        __int16 v19 = 2080;
        double v20 = "-[VCVideoRuleCollectionsCameraMac resetEncodingRulesForCameraIsHD:isWVGA:is1080:]";
        __int16 v21 = 1024;
        int v22 = 464;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d resetting encoding rules for J92", (uint8_t *)&v17, 0x1Cu);
      }
    }
    [(VCVideoRuleCollectionsCameraMac *)self _resetJ92EncodingRulesForCameraIsHD:v7 isWVGA:v6 is1080:v5];
  }
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      __int16 v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315650;
        uint64_t v18 = v13;
        __int16 v19 = 2080;
        double v20 = "-[VCVideoRuleCollectionsCameraMac resetEncodingRulesForCameraIsHD:isWVGA:is1080:]";
        __int16 v21 = 1024;
        int v22 = 468;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d camera does not support 720p. removing rules greater than VGA", (uint8_t *)&v17, 0x1Cu);
      }
    }
    [(VCVideoRuleCollectionsCameraMac *)self _removeRulesGreaterThanVGA];
  }
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315650;
        uint64_t v18 = v15;
        __int16 v19 = 2080;
        double v20 = "-[VCVideoRuleCollectionsCameraMac resetEncodingRulesForCameraIsHD:isWVGA:is1080:]";
        __int16 v21 = 1024;
        int v22 = 473;
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d camera does not support 1080p. removing rules greater than 720p", (uint8_t *)&v17, 0x1Cu);
      }
    }
    [(VCVideoRuleCollectionsCameraMac *)self _removeRulesGreaterThan720p];
  }
  objc_sync_exit(self);
}

- (void)initWithHardwareSettings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create camera rules!", v2, v3, v4, v5, v6);
}

- (void)setupH264WifiRules
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d H264 Wifi rules: failed to allocate video rules array for decoding", v2, v3, v4, v5, v6);
}

- (void)setupHEVCRules
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate HEVC XGA 1024*576 30fps rules", v2, v3, v4, v5, v6);
}

- (void)setUp1080pRules:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate videoRulesWiFiEncoding for HEVC", v2, v3, v4, v5, v6);
}

- (void)setUp1080pRules:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate videoRulesWiFiDecoding for HEVC", v2, v3, v4, v5, v6);
}

- (void)setUp1080pRules:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d H264 Wi-Fi rules: failed to allocate 1920x1080 30 FPS rule", v2, v3, v4, v5, v6);
}

- (void)setUp1080pRules:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d H264 Wi-Fi rules: failed to allocate 1664x1248 30 FPS rule", v2, v3, v4, v5, v6);
}

- (void)resetEncodingRulesForCameraIsHD:isWVGA:is1080:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to Setup Rules", v2, v3, v4, v5, v6);
}

@end