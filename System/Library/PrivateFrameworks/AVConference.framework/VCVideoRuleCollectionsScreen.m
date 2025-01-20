@interface VCVideoRuleCollectionsScreen
+ (id)sharedInstance;
+ (void)addRulesForU1ToCollection:(id)a3;
+ (void)updateScreenRuleCollections:(id)a3 size:(CGSize)a4;
- (BOOL)setupH264Rules;
- (BOOL)setupMacDecodingOnlyRules;
- (VCVideoRuleCollectionsScreen)initWithHardwareSettings:(id)a3;
- (id)initForMacDecodingOnly;
- (void)initForMacDecodingOnly;
- (void)initSupportedPayloads;
- (void)selectPreferredRule:(id)a3 screenSize:(CGSize)a4;
- (void)setupH264Rules;
@end

@implementation VCVideoRuleCollectionsScreen

+ (id)sharedInstance
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!sharedInstance__videoRulesCollection_0) {
    sharedInstance__videoRulesCollection_0 = [[VCVideoRuleCollectionsScreen alloc] initWithHardwareSettings:+[VCHardwareSettingsEmbedded sharedInstance]];
  }
  objc_sync_exit(v2);
  return (id)sharedInstance__videoRulesCollection_0;
}

- (VCVideoRuleCollectionsScreen)initWithHardwareSettings:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VCVideoRuleCollectionsScreen;
  v4 = [(VCVideoRuleCollections *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_hardwareSettings = (VCHardwareSettingsEmbeddedProtocol *)a3;
    [(VCVideoRuleCollectionsScreen *)v4 initSupportedPayloads];
    if (([(VCVideoRuleCollections *)v5 isPayloadSupported:126]
       || [(VCVideoRuleCollections *)v5 isPayloadSupported:123])
      && ![(VCVideoRuleCollectionsScreen *)v5 setupH264Rules])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v11 = v6;
          __int16 v12 = 2080;
          v13 = "-[VCVideoRuleCollectionsScreen initWithHardwareSettings:]";
          __int16 v14 = 1024;
          int v15 = 292;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Screen sharing rules: Failed to create H264 rules", buf, 0x1Cu);
        }
      }

      return 0;
    }
  }
  return v5;
}

- (id)initForMacDecodingOnly
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCVideoRuleCollectionsScreen;
  v2 = [(VCVideoRuleCollections *)&v5 init];
  v3 = v2;
  if (v2 && ![(VCVideoRuleCollectionsScreen *)v2 setupMacDecodingOnlyRules])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsScreen initForMacDecodingOnly]();
      }
    }

    return 0;
  }
  return v3;
}

+ (void)updateScreenRuleCollections:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [&unk_1F3DC8790 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (!v7) {
    return;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v19;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(&unk_1F3DC8790);
      }
      uint64_t v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) intValue];
      __int16 v12 = [VCVideoRule alloc];
      *(float *)&double v13 = (float)+[VCHardwareSettings maxFrameRateSupportedScreenShare];
      uint64_t v14 = [(VCVideoRule *)v12 initWithFrameWidth:(int)width frameHeight:(int)height frameRate:v11 payload:v13];
      if (!v14)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            +[VCVideoRuleCollectionsScreen updateScreenRuleCollections:size:]();
          }
        }
        return;
      }
      int v15 = (void *)v14;
      uint64_t v16 = [MEMORY[0x1E4F1CA48] arrayWithObject:v14];
      if (v11 != 100)
      {
        [a3 addVideoRules:v16 transportType:1 payload:v11 encodingType:1];
LABEL_13:
        [a3 addVideoRules:v16 transportType:1 payload:v11 encodingType:2];
        goto LABEL_14;
      }
      if (+[VCHardwareSettings supportsHEVCEncoding]) {
        [a3 addVideoRules:v16 transportType:1 payload:100 encodingType:1];
      }
      if (+[VCHardwareSettings supportsHEVCDecoding]) {
        goto LABEL_13;
      }
LABEL_14:
    }
    uint64_t v8 = [&unk_1F3DC8790 countByEnumeratingWithState:&v18 objects:v17 count:16];
    if (v8) {
      continue;
    }
    break;
  }
}

+ (void)addRulesForU1ToCollection:(id)a3
{
  +[VideoUtil computeResolutionForMainDisplayWithMaxScreenPixelCount:5603328];
  if ((int)v6) {
    BOOL v7 = (int)v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCVideoRuleCollectionsScreen addRulesForU1ToCollection:]();
      }
    }
  }
  else
  {
    objc_msgSend(a1, "updateScreenRuleCollections:size:", a3);
  }
}

- (void)initSupportedPayloads
{
  unint64_t v3 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings deviceClass];
  if (v3 <= 8 && ((1 << v3) & 0x14E) != 0)
  {
    [(VCVideoRuleCollections *)self addSupportedPayload:123];
  }
}

- (void)selectPreferredRule:(id)a3 screenSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v20;
    double v11 = 1.0;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(a3);
        }
        double v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
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
          uint64_t v9 = v13;
        }
        double v16 = vabdd_f64((float)((float)(int)[v13 iWidth] / (float)(int)objc_msgSend(v13, "iHeight")), width / height);
        if (v16 < v11 || v16 == v11 && (!v9 || [v9 compare:v13] == -1))
        {
          uint64_t v9 = v13;
          double v11 = v16;
        }
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v19 objects:v18 count:16];
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
    }
  }
}

- (BOOL)setupH264Rules
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (![(VCVideoRuleCollections *)self isPayloadSupported:123])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v37 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v41 = 136315650;
        uint64_t v42 = v37;
        __int16 v43 = 2080;
        v44 = "-[VCVideoRuleCollectionsScreen setupH264Rules]";
        __int16 v45 = 1024;
        int v46 = 406;
        _os_log_impl(&dword_1E1EA4000, v38, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Screen sharing rules: no H264 support", (uint8_t *)&v41, 0x1Cu);
      }
    }
    goto LABEL_116;
  }
  unsigned int v3 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings screenWidth];
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsScreen setupH264Rules]();
      }
    }
    goto LABEL_116;
  }
  unsigned int v4 = v3;
  unsigned int v5 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings screenHeight];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsScreen setupH264Rules]();
      }
    }
    goto LABEL_116;
  }
  unsigned int v6 = v5;
  uint64_t v7 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings videoEncoderType];
  if (v7 <= 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsScreen setupH264Rules]();
      }
    }
LABEL_116:
    double v15 = 0;
    double v16 = 0;
    v32 = 0;
    double v14 = 0;
    goto LABEL_117;
  }
  uint64_t v8 = v7;
  uint64_t v9 = [(VCHardwareSettingsEmbeddedProtocol *)self->_hardwareSettings deviceClass];
  if ((unint64_t)(v9 - 1) < 2)
  {
    if (v8 == 1)
    {
      int v19 = 1;
      long long v20 = &g_WifiEncodingFormat1136x640VXE;
    }
    else if (v4 == 1136 && v6 == 640)
    {
      int v19 = 1;
      long long v20 = &g_WifiEncodingFormat1136x640AVE;
    }
    else if (v4 == 1334 && v6 == 750)
    {
      int v19 = 2;
      long long v20 = &g_WifiEncodingFormat1334x750AVE;
    }
    else
    {
      long long v20 = &g_WifiEncodingFormat1920x1080AVE;
      if (v4 == 1920 && v6 == 1080)
      {
        int v19 = 3;
      }
      else if (v4 == 2436 && v6 == 1125)
      {
        int v19 = 4;
        long long v20 = &g_WifiEncodingFormat2436x1125AVE;
      }
      else if (v4 == 2688 && v6 == 1242)
      {
        int v19 = 4;
        long long v20 = &g_WifiEncodingFormat2436x1125AVE;
      }
      else if (v4 == 1792 && v6 == 828)
      {
        long long v20 = &g_WifiEncodingFormat2436x1125AVE;
        int v19 = 4;
      }
      else
      {
        int v19 = 3;
      }
    }
    double v14 = newVideoRulesForFormatList((uint64_t)v20, v19);
    if (v4 == 1136 && v6 == 640)
    {
      double v15 = newVideoRulesForFormatList((uint64_t)&g_CellEncodingFormat1136x640, 1);
      double v16 = newVideoRulesForFormatList((uint64_t)&g_WifiDecodingFormat1136x640, 4);
      int v18 = 2;
      v17 = &g_CellDecodingFormat1136x640;
    }
    else if (v4 == 1334 && v6 == 750)
    {
      double v15 = newVideoRulesForFormatList((uint64_t)&g_CellEncodingFormat1334x750, 2);
      double v16 = newVideoRulesForFormatList((uint64_t)&g_WifiDecodingFormat1334x750, 6);
      int v18 = 3;
      v17 = &g_CellDecodingFormat1334x750;
    }
    else
    {
      BOOL v25 = v4 == 1920 && v6 == 1080;
      char v26 = v25;
      v27 = &g_CellEncodingFormat1920x1080;
      if (v25)
      {
        int v28 = 3;
      }
      else if (v4 == 2436 && v6 == 1125)
      {
        int v28 = 4;
        v27 = &g_CellEncodingFormat2436x1125AVE;
      }
      else if (v4 == 2688 && v6 == 1242)
      {
        int v28 = 4;
        v27 = &g_CellEncodingFormat2436x1125AVE;
      }
      else if (v4 == 1792 && v6 == 828)
      {
        v27 = &g_CellEncodingFormat2436x1125AVE;
        int v28 = 4;
      }
      else
      {
        int v28 = 3;
      }
      double v15 = newVideoRulesForFormatList((uint64_t)v27, v28);
      v29 = &g_WifiDecodingFormat1920x1080;
      if (v26)
      {
        int v30 = 8;
      }
      else if (v4 == 2436 && v6 == 1125)
      {
        int v30 = 10;
        v29 = &g_WifiDecodingFormat2436x1125;
      }
      else
      {
        int v30 = 10;
        if (v4 == 2688 && v6 == 1242)
        {
          v29 = &g_WifiDecodingFormat2436x1125;
        }
        else if (v4 == 1792 && v6 == 828)
        {
          v29 = &g_WifiDecodingFormat2436x1125;
          int v30 = 10;
        }
        else
        {
          int v30 = 8;
        }
      }
      double v16 = newVideoRulesForFormatList((uint64_t)v29, v30);
      v17 = &g_CellDecodingFormat1920x1080;
      if (v26)
      {
        int v18 = 4;
      }
      else if (v4 == 2436 && v6 == 1125)
      {
        int v18 = 5;
        v17 = &g_CellDecodingFormat2436x1125;
      }
      else if (v4 == 2688 && v6 == 1242)
      {
        int v18 = 5;
        v17 = &g_CellDecodingFormat2436x1125;
      }
      else if (v4 == 1792 && v6 == 828)
      {
        v17 = &g_CellDecodingFormat2436x1125;
        int v18 = 5;
      }
      else
      {
        int v18 = 4;
      }
    }
    goto LABEL_91;
  }
  if (v9 == 3 || v9 == 8)
  {
    if (v8 == 1) {
      double v11 = &g_WifiEncodingFormatiPadVXE;
    }
    else {
      double v11 = &g_WifiEncodingFormatiPadAVE;
    }
    if (v8 == 1) {
      int v12 = 1;
    }
    else {
      int v12 = 2;
    }
    if (v8 == 1) {
      double v13 = &g_CellEncodingFormatiPadVXE;
    }
    else {
      double v13 = &g_CellEncodingFormatiPadAVE;
    }
    double v14 = newVideoRulesForFormatList((uint64_t)v11, v12);
    double v15 = newVideoRulesForFormatList((uint64_t)v13, v12);
    double v16 = newVideoRulesForFormatList((uint64_t)&g_WifiDecodingFormatiPad, 12);
    v17 = &g_CellDecodingFormatiPad;
    int v18 = 6;
LABEL_91:
    v31 = newVideoRulesForFormatList((uint64_t)v17, v18);
    v32 = v31;
    if (v14) {
      BOOL v33 = v15 == 0;
    }
    else {
      BOOL v33 = 1;
    }
    if (!v33 && v16 != 0 && v31 != 0)
    {
      -[VCVideoRuleCollectionsScreen selectPreferredRule:screenSize:](self, "selectPreferredRule:screenSize:", v14, (double)v4, (double)v6);
      -[VCVideoRuleCollectionsScreen selectPreferredRule:screenSize:](self, "selectPreferredRule:screenSize:", v16, (double)v4, (double)v6);
      -[VCVideoRuleCollectionsScreen selectPreferredRule:screenSize:](self, "selectPreferredRule:screenSize:", v15, (double)v4, (double)v6);
      -[VCVideoRuleCollectionsScreen selectPreferredRule:screenSize:](self, "selectPreferredRule:screenSize:", v32, (double)v4, (double)v6);
      BOOL v24 = 1;
      [(VCVideoRuleCollections *)self addVideoRules:v14 transportType:1 payload:123 encodingType:1];
      [(VCVideoRuleCollections *)self addVideoRules:v16 transportType:1 payload:123 encodingType:2];
      [(VCVideoRuleCollections *)self addVideoRules:v15 transportType:2 payload:123 encodingType:1];
      [(VCVideoRuleCollections *)self addVideoRules:v32 transportType:2 payload:123 encodingType:2];
LABEL_102:

      return v24;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v39 = VRTraceErrorLogLevelToCSTR();
      v40 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v41 = 136315650;
        uint64_t v42 = v39;
        __int16 v43 = 2080;
        v44 = "-[VCVideoRuleCollectionsScreen setupH264Rules]";
        __int16 v45 = 1024;
        int v46 = 436;
        _os_log_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Screen sharing rules: No suitable rules for this device", (uint8_t *)&v41, 0x1Cu);
      }
    }
LABEL_117:
    BOOL v24 = 0;
    goto LABEL_102;
  }
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (ErrorLogLevelForModule < 7) {
    return 0;
  }
  uint64_t v22 = VRTraceErrorLogLevelToCSTR();
  uint64_t v23 = *MEMORY[0x1E4F47A50];
  BOOL v24 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
  {
    int v41 = 136315650;
    uint64_t v42 = v22;
    __int16 v43 = 2080;
    v44 = "-[VCVideoRuleCollectionsScreen setupH264Rules]";
    __int16 v45 = 1024;
    int v46 = 433;
    _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Device has no screen sharing rules", (uint8_t *)&v41, 0x1Cu);
    return 0;
  }
  return v24;
}

- (BOOL)setupMacDecodingOnlyRules
{
  [(VCVideoRuleCollections *)self addSupportedPayload:123];
  unsigned int v3 = newVideoRulesForFormatList((uint64_t)&g_WifiDecodingFormatiPad, 12);
  unsigned int v4 = newVideoRulesForFormatList((uint64_t)&g_CellDecodingFormatiPad, 6);
  unsigned int v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;
  if (!v6)
  {
    [(VCVideoRuleCollections *)self addVideoRules:v3 transportType:1 payload:123 encodingType:2];
    [(VCVideoRuleCollections *)self addVideoRules:v5 transportType:2 payload:123 encodingType:2];
  }

  return v7;
}

- (void)initForMacDecodingOnly
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Screen sharing rules: Failed to create Mac Decoding only rules", v2, v3, v4, v5, v6);
}

+ (void)updateScreenRuleCollections:size:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "+[VCVideoRuleCollectionsScreen updateScreenRuleCollections:size:]";
  __int16 v6 = 1024;
  int v7 = 322;
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate rule for ruleCollections=%@", v3, 0x26u);
}

+ (void)addRulesForU1ToCollection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Screen U1 settings failed to calculate resolution", v2, v3, v4, v5, v6);
}

- (void)setupH264Rules
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Screen sharing rules: Could not retrieve hardware encoder type", v2, v3, v4, v5, v6);
}

@end