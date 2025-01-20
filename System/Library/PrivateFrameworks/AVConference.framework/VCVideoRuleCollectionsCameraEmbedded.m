@interface VCVideoRuleCollectionsCameraEmbedded
+ (id)sharedInstance;
- (BOOL)isPreferredVideoRule:(id)a3 preferredFormat:(id)a4;
- (BOOL)setupH264Rules;
- (BOOL)setupHEVCRules;
- (BOOL)setupRules;
- (BOOL)setupVideoRulesForPayload:(int)a3 transportType:(unsigned __int8)a4 encodingType:(unsigned __int8)a5 formatList:(_VCVideoFormat *)a6 formatListCount:(unsigned int)a7 preferredFormat:(id)a8 supportsHighDef:(BOOL *)a9;
- (BOOL)supportsHEVCWifiDecoding;
- (BOOL)supportsHEVCWifiEncoding;
- (VCVideoRuleCollectionsCameraEmbedded)initWithHardwareSettings:(id)a3;
- (_VCBitrateConfiguration)bitrateConfiguration;
- (_VCHardwareConfiguration)hardwareConfigurationForPayload:(int)a3 transportType:(unsigned __int8)a4;
- (double)preferredAspectRatio;
- (id)description;
- (void)bitrateConfiguration;
- (void)dealloc;
- (void)initSupportedPayloads;
- (void)setupH264Rules;
- (void)setupHEVCRules;
@end

@implementation VCVideoRuleCollectionsCameraEmbedded

- (double)preferredAspectRatio
{
  +[VCHardwareSettings previewPreferredAspectRatio];
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_token_3 != -1) {
    dispatch_once(&sharedInstance_token_3, &__block_literal_global_70);
  }
  return (id)sharedInstance__videoRulesCollections_0;
}

- (VCVideoRuleCollectionsCameraEmbedded)initWithHardwareSettings:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCVideoRuleCollectionsCameraEmbedded;
  v4 = [(VCVideoRuleCollections *)&v7 init];
  v5 = v4;
  if (v4)
  {
    *(void *)&v4->super._encodeHighDef = a3;
    [(VCVideoRuleCollectionsCameraEmbedded *)v4 initSupportedPayloads];
    if (![(VCVideoRuleCollectionsCameraEmbedded *)v5 setupRules])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoRuleCollectionsCameraEmbedded initWithHardwareSettings:]();
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
  v2.super_class = (Class)VCVideoRuleCollectionsCameraEmbedded;
  [(VCVideoRuleCollections *)&v2 dealloc];
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@: supportHEVC[%d] vcpSupportsHEVCEncoder[%d] screenSize[%dx%d] deviceClass[%ld] VCHardwareVideoEncoderType[%ld] useSoftFramerateSwitching[%d]", NSStringFromClass(v4), objc_msgSend(*(id *)&self->super._encodeHighDef, "supportHEVC"), objc_msgSend(*(id *)&self->super._encodeHighDef, "vcpSupportsHEVCEncoder"), objc_msgSend(*(id *)&self->super._encodeHighDef, "screenWidth"), objc_msgSend(*(id *)&self->super._encodeHighDef, "screenHeight"), objc_msgSend(*(id *)&self->super._encodeHighDef, "deviceClass"), objc_msgSend(*(id *)&self->super._encodeHighDef, "videoEncoderType"), objc_msgSend(*(id *)&self->super._encodeHighDef, "useSoftFramerateSwitching")];
}

- (void)initSupportedPayloads
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = (void *)[*(id *)&self->super._encodeHighDef supportedVideoPayloads];
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

VCVideoRuleCollectionsCameraEmbedded *__54__VCVideoRuleCollectionsCameraEmbedded_sharedInstance__block_invoke()
{
  double result = [[VCVideoRuleCollectionsCameraEmbedded alloc] initWithHardwareSettings:+[VCHardwareSettingsEmbedded sharedInstance]];
  sharedInstance__videoRulesCollections_0 = (uint64_t)result;
  return result;
}

- (_VCHardwareConfiguration)hardwareConfigurationForPayload:(int)a3 transportType:(unsigned __int8)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3 == 100)
  {
    if (a4 == 2)
    {
      unint64_t v5 = [*(id *)&self->super._encodeHighDef deviceClass] - 1;
      if (v5 < 8 && ((0x87u >> v5) & 1) != 0)
      {
        uint64_t v6 = &off_1E6DB88E8;
        goto LABEL_27;
      }
    }
    else if (a4 == 1)
    {
      __int16 v7 = +[GKSConnectivitySettings getAbTestMasterLocalSwitches];
      i = 0;
      long long v9 = (_VCHardwareConfiguration *)&_hardwareConfigHEVCWifiIPad;
      uint64_t v10 = 11;
      switch([*(id *)&self->super._encodeHighDef deviceClass])
      {
        case 1:
          unsigned int v11 = v7 & 0x800;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v12 = VRTraceErrorLogLevelToCSTR();
            uint64_t v13 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v16 = 136315906;
              uint64_t v17 = v12;
              __int16 v18 = 2080;
              v19 = "-[VCVideoRuleCollectionsCameraEmbedded hardwareConfigurationForPayload:transportType:]";
              __int16 v20 = 1024;
              int v21 = 470;
              __int16 v22 = 1024;
              unsigned int v23 = v11 >> 11;
              _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch hevcWifiTiersEnabled %d", (uint8_t *)&v16, 0x22u);
            }
          }
          if (v11) {
            long long v9 = (_VCHardwareConfiguration *)&_hardwareConfigHEVCWifiIPhone;
          }
          else {
            long long v9 = (_VCHardwareConfiguration *)&_hardwareConfigHEVCWifiIPhoneNoEncode;
          }
          uint64_t v10 = 9;
          goto LABEL_28;
        case 2:
          long long v9 = (_VCHardwareConfiguration *)&_hardwareConfigHEVCWifiIPod;
          uint64_t v10 = 2;
          goto LABEL_28;
        case 3:
          goto LABEL_28;
        case 8:
          long long v9 = (_VCHardwareConfiguration *)&_hardwareConfigHEVCWifiWolf;
          uint64_t v10 = 1;
          goto LABEL_28;
        default:
          return i;
      }
      return i;
    }
    return 0;
  }
  if (a3 != 126 && a3 != 123) {
    return 0;
  }
  if (a4 == 2)
  {
    unint64_t v5 = [*(id *)&self->super._encodeHighDef deviceClass] - 1;
    if (v5 < 8 && ((0x87u >> v5) & 1) != 0)
    {
      uint64_t v6 = &off_1E6DB88A8;
      goto LABEL_27;
    }
    return 0;
  }
  if (a4 != 1) {
    return 0;
  }
  unint64_t v5 = [*(id *)&self->super._encodeHighDef deviceClass] - 1;
  if (v5 >= 8 || ((0x87u >> v5) & 1) == 0) {
    return 0;
  }
  uint64_t v6 = &off_1E6DB8868;
LABEL_27:
  long long v9 = (_VCHardwareConfiguration *)v6[v5];
  uint64_t v10 = qword_1E25A1C18[v5];
LABEL_28:
  for (i = v9; ; ++i)
  {
    int64_t var0 = i->var0;
    if (var0 == [*(id *)&self->super._encodeHighDef chipId]) {
      break;
    }
    if (!--v10) {
      return v9;
    }
  }
  if (!i->var2 && !i->var4) {
    return 0;
  }
  return i;
}

- (BOOL)isPreferredVideoRule:(id)a3 preferredFormat:(id)a4
{
  if (a4)
  {
    if ([a3 compare:a4])
    {
      unint64_t v6 = 0;
      BOOL v7 = 1;
      uint64_t v8 = &dword_1E25A1BC4;
      do
      {
        int v9 = *v8;
        if (v9 == [a3 iWidth])
        {
          int v10 = v8[1];
          if (v10 == [a3 iHeight])
          {
            int v11 = v8[2];
            [a3 fRate];
            if (v11 == (int)v12)
            {
              int v13 = *(v8 - 3);
              if (v13 == [a4 iWidth])
              {
                int v14 = *(v8 - 2);
                if (v14 == [a4 iHeight])
                {
                  int v15 = *(v8 - 1);
                  [a4 fRate];
                  if (v15 == (int)v16) {
                    break;
                  }
                }
              }
            }
          }
        }
        BOOL v7 = v6 < 3;
        v8 += 6;
        ++v6;
      }
      while (v6 != 4);
    }
    else
    {
      return 1;
    }
  }
  else
  {
    return 0;
  }
  return v7;
}

- (BOOL)setupVideoRulesForPayload:(int)a3 transportType:(unsigned __int8)a4 encodingType:(unsigned __int8)a5 formatList:(_VCVideoFormat *)a6 formatListCount:(unsigned int)a7 preferredFormat:(id)a8 supportsHighDef:(BOOL *)a9
{
  LODWORD(v10) = a7;
  unsigned int v12 = a5;
  unsigned int v43 = a4;
  uint64_t v13 = *(void *)&a3;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  int v15 = (void *)[MEMORY[0x1E4F1CA48] array];
  BOOL v16 = +[VCHardwareSettings supportsDecodingSquareCameraVideo];
  unsigned int v42 = v12;
  if (v12 == 2 && v16)
  {
    v41 = a6;
    uint64_t v17 = [VCVideoRule alloc];
    LODWORD(v18) = 30.0;
    v19 = [(VCVideoRule *)v17 initWithFrameWidth:1088 frameHeight:1088 frameRate:v13 payload:v18];
    __int16 v20 = [VCVideoRule alloc];
    LODWORD(v21) = 1114636288;
    __int16 v22 = [(VCVideoRule *)v20 initWithFrameWidth:1088 frameHeight:1088 frameRate:v13 payload:v21];
    [a8 setToVideoRule:v19];
    LODWORD(v23) = 1.0;
    [(VCVideoRule *)v19 setFPref:v23];
    [v15 addObject:v19];
    [v15 addObject:v22];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v40 = VRTraceErrorLogLevelToCSTR();
      uint64_t v24 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v45 = v40;
        __int16 v46 = 2080;
        v47 = "-[VCVideoRuleCollectionsCameraEmbedded setupVideoRulesForPayload:transportType:encodingType:formatList:for"
              "matListCount:preferredFormat:supportsHighDef:]";
        __int16 v48 = 1024;
        int v49 = 592;
        _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d supportsDecodingSquareCameraVideo, decode rules added", buf, 0x1Cu);
      }
    }

    a6 = v41;
  }
  if (v10)
  {
    uint64_t v10 = v10;
    p_var2 = &a6->var2;
    do
    {
      v26 = [VCVideoRule alloc];
      *(float *)&double v27 = (float)*p_var2;
      v28 = [(VCVideoRule *)v26 initWithFrameWidth:*(p_var2 - 2) frameHeight:*(p_var2 - 1) frameRate:v13 payload:v27];
      v29 = v28;
      if (a9)
      {
        int v30 = [(VCVideoRule *)v28 iWidth];
        if ([(VCVideoRule *)v29 iHeight] * v30 > 307200) {
          *a9 = 1;
        }
      }
      if ([(VCVideoRuleCollectionsCameraEmbedded *)self isPreferredVideoRule:v29 preferredFormat:a8])
      {
        LODWORD(v31) = 1.0;
        [(VCVideoRule *)v29 setFPref:v31];
      }
      p_var2 += 3;
      [v15 addObject:v29];

      --v10;
    }
    while (v10);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v32 = VRTraceErrorLogLevelToCSTR();
      v33 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v45 = v32;
        __int16 v46 = 2080;
        v47 = "-[VCVideoRuleCollectionsCameraEmbedded setupVideoRulesForPayload:transportType:encodingType:formatList:for"
              "matListCount:preferredFormat:supportsHighDef:]";
        __int16 v48 = 1024;
        int v49 = 613;
        __int16 v50 = 1024;
        int v51 = v13;
        __int16 v52 = 1024;
        unsigned int v53 = v43;
        _os_log_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d formatList size is zero for payload=%d, transfportType=%d", buf, 0x28u);
      }
    }
    if (a9) {
      *a9 = 0;
    }
  }
  [v15 sortUsingSelector:sel_compare_];
  if (v13 == 100)
  {
    if (![(VCVideoRuleCollections *)self isPayloadSupported:100])
    {
LABEL_31:
      LOBYTE(v38) = 1;
      return v38;
    }
    v34 = self;
    v35 = v15;
    uint64_t v36 = v43;
    uint64_t v37 = 100;
LABEL_30:
    [(VCVideoRuleCollections *)v34 addVideoRules:v35 transportType:v36 payload:v37 encodingType:v42];
    goto LABEL_31;
  }
  if (v13 == 126 || v13 == 123)
  {
    if ([(VCVideoRuleCollections *)self isPayloadSupported:126]) {
      [(VCVideoRuleCollections *)self addVideoRules:v15 transportType:v43 payload:126 encodingType:v42];
    }
    if (![(VCVideoRuleCollections *)self isPayloadSupported:123]) {
      goto LABEL_31;
    }
    v34 = self;
    v35 = v15;
    uint64_t v36 = v43;
    uint64_t v37 = 123;
    goto LABEL_30;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v38) {
      return v38;
    }
    -[VCVideoRuleCollectionsCameraEmbedded setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:]();
  }
  LOBYTE(v38) = 0;
  return v38;
}

- (BOOL)setupH264Rules
{
  if (![(VCVideoRuleCollections *)self isPayloadSupported:126]
    && ![(VCVideoRuleCollections *)self isPayloadSupported:123])
  {
    return 1;
  }
  uint64_t v3 = [(VCVideoRuleCollectionsCameraEmbedded *)self hardwareConfigurationForPayload:123 transportType:1];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  unint64_t v5 = [VCVideoRule alloc];
  *(float *)&double v6 = (float)v4->var1.var2;
  uint64_t v7 = [(VCVideoRule *)v5 initWithFrameWidth:v4->var1.var0 frameHeight:v4->var1.var1 frameRate:v6];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraEmbedded setupH264Rules]();
      }
    }
    return 0;
  }
  uint64_t v8 = (void *)v7;
  if (![(VCVideoRuleCollectionsCameraEmbedded *)self setupVideoRulesForPayload:123 transportType:1 encodingType:1 formatList:v4->var3 formatListCount:v4->var2 preferredFormat:0 supportsHighDef:&self->super.super._encodingType + 1])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraEmbedded setupH264Rules].cold.6();
      }
    }
    goto LABEL_27;
  }
  if (![(VCVideoRuleCollectionsCameraEmbedded *)self setupVideoRulesForPayload:123 transportType:1 encodingType:2 formatList:v4->var5 formatListCount:v4->var4 preferredFormat:v8 supportsHighDef:&self->super.super._encodingType + 2])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraEmbedded setupH264Rules].cold.5();
      }
    }
    goto LABEL_27;
  }
  int v9 = [(VCVideoRuleCollectionsCameraEmbedded *)self hardwareConfigurationForPayload:123 transportType:2];
  if (!v9)
  {
LABEL_27:

    return 0;
  }
  uint64_t v10 = v9;
  int v11 = [VCVideoRule alloc];
  *(float *)&double v12 = (float)v10->var1.var2;
  uint64_t v13 = [(VCVideoRule *)v11 initWithFrameWidth:v10->var1.var0 frameHeight:v10->var1.var1 frameRate:v12];
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraEmbedded setupH264Rules]();
      }
    }
    goto LABEL_27;
  }
  int v14 = (void *)v13;
  if (![(VCVideoRuleCollectionsCameraEmbedded *)self setupVideoRulesForPayload:123 transportType:2 encodingType:1 formatList:v10->var3 formatListCount:v10->var2 preferredFormat:0 supportsHighDef:0])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraEmbedded setupH264Rules].cold.4();
      }
    }
    goto LABEL_35;
  }
  if (![(VCVideoRuleCollectionsCameraEmbedded *)self setupVideoRulesForPayload:123 transportType:2 encodingType:2 formatList:v10->var5 formatListCount:v10->var4 preferredFormat:v14 supportsHighDef:0])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraEmbedded setupH264Rules]();
      }
    }
LABEL_35:
    BOOL v15 = 0;
    goto LABEL_12;
  }
  BOOL v15 = 1;
LABEL_12:

  return v15;
}

- (_VCBitrateConfiguration)bitrateConfiguration
{
  p_encodeHighDef = &self->super._encodeHighDef;
  unint64_t v3 = [*(id *)&self->super._encodeHighDef deviceClass] - 1;
  if (v3 < 8 && ((0x87u >> v3) & 1) != 0) {
    return (_VCBitrateConfiguration *)((char *)*(&off_1E6DB8928 + v3) + 48);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    unint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      [(VCVideoRuleCollectionsCameraEmbedded *)v4 bitrateConfiguration];
    }
  }
  return 0;
}

- (BOOL)supportsHEVCWifiDecoding
{
  BOOL v3 = [(VCVideoRuleCollections *)self isPayloadSupported:100];
  if (v3)
  {
    uint64_t v4 = [*(id *)&self->super._encodeHighDef chipId];
    if ((unint64_t)(v4 - 0x8000) > 0x15) {
      LOBYTE(v3) = 0;
    }
    else {
      return (0x23000Bu >> v4) & 1;
    }
  }
  return v3;
}

- (BOOL)supportsHEVCWifiEncoding
{
  BOOL v3 = [(VCVideoRuleCollections *)self isPayloadSupported:100];
  if (v3)
  {
    uint64_t v4 = [*(id *)&self->super._encodeHighDef chipId];
    if ((unint64_t)(v4 - 32784) > 5) {
      LOBYTE(v3) = 0;
    }
    else {
      return (0x23u >> (v4 - 16)) & 1;
    }
  }
  return v3;
}

- (BOOL)setupHEVCRules
{
  if (![(VCVideoRuleCollections *)self isPayloadSupported:100]
    || ![*(id *)&self->super._encodeHighDef supportHEVC])
  {
    return 1;
  }
  BOOL v3 = [(VCVideoRuleCollectionsCameraEmbedded *)self hardwareConfigurationForPayload:100 transportType:2];
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraEmbedded setupHEVCRules]();
      }
    }
    return 1;
  }
  uint64_t v4 = v3;
  unint64_t v5 = [VCVideoRule alloc];
  *(float *)&double v6 = (float)v4->var1.var2;
  uint64_t v7 = [(VCVideoRule *)v5 initWithFrameWidth:v4->var1.var0 frameHeight:v4->var1.var1 frameRate:v6];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraEmbedded setupHEVCRules]();
      }
    }
    goto LABEL_26;
  }
  if (![(VCVideoRuleCollectionsCameraEmbedded *)self setupVideoRulesForPayload:100 transportType:2 encodingType:1 formatList:v4->var3 formatListCount:v4->var2 preferredFormat:0 supportsHighDef:0])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraEmbedded setupHEVCRules].cold.6();
      }
    }
    goto LABEL_26;
  }
  if (![(VCVideoRuleCollectionsCameraEmbedded *)self setupVideoRulesForPayload:100 transportType:2 encodingType:2 formatList:v4->var5 formatListCount:v4->var4 preferredFormat:v7 supportsHighDef:0])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraEmbedded setupHEVCRules].cold.5();
      }
    }
LABEL_26:
    BOOL v22 = 0;
    v19 = 0;
    goto LABEL_11;
  }
  uint64_t v8 = [(VCVideoRuleCollectionsCameraEmbedded *)self hardwareConfigurationForPayload:100 transportType:1];
  if (+[VCHardwareSettings supportsDecodingSquareCameraVideo])
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v10 = [VCVideoRule alloc];
    LODWORD(v11) = 30.0;
    double v12 = [(VCVideoRule *)v10 initWithFrameWidth:1088 frameHeight:1088 frameRate:100 payload:v11];
    uint64_t v13 = [VCVideoRule alloc];
    LODWORD(v14) = 1114636288;
    BOOL v15 = [(VCVideoRule *)v13 initWithFrameWidth:1088 frameHeight:1088 frameRate:100 payload:v14];
    [v9 addObject:v12];
    [v9 addObject:v15];
    [(VCVideoRuleCollections *)self addVideoRules:v9 transportType:1 payload:100 encodingType:2];

    v8->var1.int64_t var0 = [(VCVideoRule *)v12 iWidth];
    v8->var1.var1 = [(VCVideoRule *)v12 iHeight];
    [(VCVideoRule *)v12 fRate];
    v8->var1.var2 = v16;
  }
  uint64_t v17 = [VCVideoRule alloc];
  *(float *)&double v18 = (float)v8->var1.var2;
  v19 = [(VCVideoRule *)v17 initWithFrameWidth:v8->var1.var0 frameHeight:v8->var1.var1 frameRate:v18];
  if (![(VCVideoRuleCollectionsCameraEmbedded *)self setupVideoRulesForPayload:100 transportType:1 encodingType:1 formatList:v8->var3 formatListCount:v8->var2 preferredFormat:0 supportsHighDef:0])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraEmbedded setupHEVCRules].cold.4();
      }
    }
    goto LABEL_33;
  }
  var5 = v8->var5;
  uint64_t var4 = v8->var4;
  BOOL v22 = 1;
  if (![(VCVideoRuleCollectionsCameraEmbedded *)self setupVideoRulesForPayload:100 transportType:1 encodingType:2 formatList:var5 formatListCount:var4 preferredFormat:v19 supportsHighDef:0])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCameraEmbedded setupHEVCRules]();
      }
    }
LABEL_33:
    BOOL v22 = 0;
  }
LABEL_11:

  return v22;
}

- (BOOL)setupRules
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCVideoRuleCollectionsCameraEmbedded setupRules]";
      __int16 v11 = 1024;
      int v12 = 887;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v7, 0x1Cu);
    }
  }
  if ([(VCVideoRuleCollectionsCameraEmbedded *)self setupH264Rules]) {
    BOOL v5 = [(VCVideoRuleCollectionsCameraEmbedded *)self setupHEVCRules];
  }
  else {
    BOOL v5 = 0;
  }
  [(VCVideoRuleCollectionsCamera *)self limitVideoRules];
  return v5;
}

- (void)initWithHardwareSettings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create camera rules!", v2, v3, v4, v5, v6);
}

- (void)setupVideoRulesForPayload:transportType:encodingType:formatList:formatListCount:preferredFormat:supportsHighDef:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "-[VCVideoRuleCollectionsCameraEmbedded setupVideoRulesForPayload:transportType:encodingType:formatList:formatList"
       "Count:preferredFormat:supportsHighDef:]";
  __int16 v6 = 1024;
  int v7 = 637;
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed setupVideoRulesForPayload for unrecognized payload %d!", v3, 0x22u);
}

- (void)setupH264Rules
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup Wifi encoding rules for H264", v2, v3, v4, v5, v6);
}

- (void)bitrateConfiguration
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v5 = [*a2 deviceClass];
  int v6 = 136315906;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  int v9 = "-[VCVideoRuleCollectionsCameraEmbedded bitrateConfiguration]";
  __int16 v10 = 1024;
  int v11 = 751;
  __int16 v12 = 1024;
  int v13 = v5;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Couldn't find configuration for _hardwareSettings.deviceClass = %d", (uint8_t *)&v6, 0x22u);
}

- (void)setupHEVCRules
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup cell encoding rules for HEVC", v2, v3, v4, v5, v6);
}

@end