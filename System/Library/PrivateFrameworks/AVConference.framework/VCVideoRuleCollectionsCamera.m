@interface VCVideoRuleCollectionsCamera
+ (id)sharedInstance;
- (BOOL)getBestFrameWidth:(int *)a3 frameHeight:(int *)a4 frameRate:(float *)a5;
- (BOOL)isHiDefCapable;
- (BOOL)setupH264CellularRules;
- (BOOL)useSoftFramerateSwitching;
- (_VCBitrateConfiguration)bitrateConfiguration;
- (double)preferredAspectRatio;
- (id)bestVideoRuleForEncodingType:(unsigned __int8)a3 aspectRatio:(double)a4;
- (id)bestVideoRuleForEncodingType:(unsigned __int8)a3 aspectRatio:(double)a4 payload:(int)a5;
- (void)limitVideoRules;
- (void)setupH264CellularRules;
@end

@implementation VCVideoRuleCollectionsCamera

- (BOOL)getBestFrameWidth:(int *)a3 frameHeight:(int *)a4 frameRate:(float *)a5
{
  *(void *)&v38[7] = *MEMORY[0x1E4F143B8];
  if (*a4)
  {
    double v9 = (double)*a3 / (double)*a4;
  }
  else
  {
    [(VCVideoRuleCollectionsCamera *)self preferredAspectRatio];
    double v9 = v10;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E4F47A50];
    v13 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = *a3;
        int v15 = *a4;
        int v27 = 136316418;
        uint64_t v28 = v11;
        __int16 v29 = 2080;
        v30 = "-[VCVideoRuleCollectionsCamera getBestFrameWidth:frameHeight:frameRate:]";
        __int16 v31 = 1024;
        int v32 = 166;
        __int16 v33 = 1024;
        int v34 = v14;
        __int16 v35 = 1024;
        int v36 = v15;
        __int16 v37 = 2048;
        *(double *)v38 = v9;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d frameWidth=%d, frameHeight=%d, aspectRatio=%f", (uint8_t *)&v27, 0x32u);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v25 = *a3;
      int v26 = *a4;
      int v27 = 136316418;
      uint64_t v28 = v11;
      __int16 v29 = 2080;
      v30 = "-[VCVideoRuleCollectionsCamera getBestFrameWidth:frameHeight:frameRate:]";
      __int16 v31 = 1024;
      int v32 = 166;
      __int16 v33 = 1024;
      int v34 = v25;
      __int16 v35 = 1024;
      int v36 = v26;
      __int16 v37 = 2048;
      *(double *)v38 = v9;
      _os_log_debug_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEBUG, " [%s] %s:%d frameWidth=%d, frameHeight=%d, aspectRatio=%f", (uint8_t *)&v27, 0x32u);
    }
  }
  id v16 = [(VCVideoRuleCollectionsCamera *)self bestVideoRuleForEncodingType:1 aspectRatio:v9];
  v17 = v16;
  if (v16)
  {
    if (a3) {
      *a3 = [v16 iWidth];
    }
    *a4 = [v17 iHeight];
    if (a5)
    {
      [v17 fRate];
      *(_DWORD *)a5 = v18;
      if (a3)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v19 = VRTraceErrorLogLevelToCSTR();
          v20 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v21 = *a3;
            int v22 = *a4;
            int v23 = (int)*a5;
            int v27 = 136316674;
            uint64_t v28 = v19;
            __int16 v29 = 2080;
            v30 = "-[VCVideoRuleCollectionsCamera getBestFrameWidth:frameHeight:frameRate:]";
            __int16 v31 = 1024;
            int v32 = 182;
            __int16 v33 = 1024;
            int v34 = v21;
            __int16 v35 = 1024;
            int v36 = v22;
            __int16 v37 = 1024;
            *(_DWORD *)v38 = v23;
            v38[2] = 2048;
            *(double *)&v38[3] = v9;
            _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %dx%d@%dfps, aspectRatio=%f", (uint8_t *)&v27, 0x38u);
          }
        }
      }
    }
  }
  return v17 != 0;
}

- (id)bestVideoRuleForEncodingType:(unsigned __int8)a3 aspectRatio:(double)a4
{
  uint64_t v5 = a3;
  id v7 = -[VCVideoRuleCollectionsCamera bestVideoRuleForEncodingType:aspectRatio:payload:](self, "bestVideoRuleForEncodingType:aspectRatio:payload:", a3, 123);
  id v8 = [(VCVideoRuleCollectionsCamera *)self bestVideoRuleForEncodingType:v5 aspectRatio:100 payload:a4];
  if (a4 != -1.0 && v7 == 0 && v8 == 0)
  {
    id v7 = -[VCVideoRuleCollectionsCamera bestVideoRuleForEncodingType:aspectRatio:payload:](self, "bestVideoRuleForEncodingType:aspectRatio:payload:", v5, 123);
    id v8 = [(VCVideoRuleCollectionsCamera *)self bestVideoRuleForEncodingType:v5 aspectRatio:100 payload:-1.0];
  }
  uint64_t v11 = v8;
  if (!v8) {
    return v7;
  }
  int v12 = [v8 iWidth];
  signed int v13 = [v11 iHeight] * v12;
  int v14 = [v7 iWidth];
  if (v13 < (int)([v7 iHeight] * v14)) {
    return v7;
  }
  [v11 fRate];
  float v16 = v15;
  [v7 fRate];
  if (v16 < v17) {
    return v7;
  }
  return v11;
}

- (id)bestVideoRuleForEncodingType:(unsigned __int8)a3 aspectRatio:(double)a4 payload:(int)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = objc_msgSend(-[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](self, "getVideoRulesForTransport:payload:encodingType:", 1, *(void *)&a5, a3), "reverseObjectEnumerator");
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v33 != v10) {
        objc_enumerationMutation(v7);
      }
      int v12 = *(void **)(*((void *)&v32 + 1) + 8 * v11);
      if (a4 == -1.0
        || vabdd_f64((double)(int)[*(id *)(*((void *)&v32 + 1) + 8 * v11) iWidth]/ (double)(int)objc_msgSend(v12, "iHeight"), a4) < 0.00000011920929)
      {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v31 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_16;
      }
    }
    if (!v12) {
      goto LABEL_16;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      int v14 = *MEMORY[0x1E4F47A50];
      float v15 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 136316418;
          uint64_t v20 = v13;
          __int16 v21 = 2080;
          int v22 = "-[VCVideoRuleCollectionsCamera bestVideoRuleForEncodingType:aspectRatio:payload:]";
          __int16 v23 = 1024;
          int v24 = 127;
          __int16 v25 = 2080;
          double v26 = COERCE_DOUBLE(objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String"));
          __int16 v27 = 2048;
          double v28 = a4;
          __int16 v29 = 1024;
          int v30 = a5;
          _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Best video settings %s for aspect ratio=%g payload=%d", (uint8_t *)&v19, 0x36u);
        }
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 136316418;
        uint64_t v20 = v13;
        __int16 v21 = 2080;
        int v22 = "-[VCVideoRuleCollectionsCamera bestVideoRuleForEncodingType:aspectRatio:payload:]";
        __int16 v23 = 1024;
        int v24 = 127;
        __int16 v25 = 2080;
        double v26 = COERCE_DOUBLE(objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String"));
        __int16 v27 = 2048;
        double v28 = a4;
        __int16 v29 = 1024;
        int v30 = a5;
        _os_log_debug_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Best video settings %s for aspect ratio=%g payload=%d", (uint8_t *)&v19, 0x36u);
      }
    }
  }
  else
  {
LABEL_16:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      float v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136316162;
        uint64_t v20 = v16;
        __int16 v21 = 2080;
        int v22 = "-[VCVideoRuleCollectionsCamera bestVideoRuleForEncodingType:aspectRatio:payload:]";
        __int16 v23 = 1024;
        int v24 = 125;
        __int16 v25 = 2048;
        double v26 = a4;
        __int16 v27 = 1024;
        LODWORD(v28) = a5;
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d not able to find for aspect ratio=%g payload=%d", (uint8_t *)&v19, 0x2Cu);
      }
    }
    return 0;
  }
  return v12;
}

+ (id)sharedInstance
{
  return +[VCVideoRuleCollectionsCameraEmbedded sharedInstance];
}

- (double)preferredAspectRatio
{
  return -1.0;
}

- (BOOL)setupH264CellularRules
{
  if (![(VCVideoRuleCollections *)self isPayloadSupported:126]
    && ![(VCVideoRuleCollections *)self isPayloadSupported:123])
  {
    return 1;
  }
  v3 = objc_opt_new();
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      v6 = [VCVideoRule alloc];
      LODWORD(v7) = 15.0;
      uint64_t v8 = [(VCVideoRule *)v6 initWithFrameWidth:320 frameHeight:240 frameRate:126 payload:v7];
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        uint64_t v10 = [VCVideoRule alloc];
        LODWORD(v11) = 15.0;
        uint64_t v12 = [(VCVideoRule *)v10 initWithFrameWidth:480 frameHeight:368 frameRate:126 payload:v11];
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          int v14 = [VCVideoRule alloc];
          LODWORD(v15) = 15.0;
          uint64_t v16 = [(VCVideoRule *)v14 initWithFrameWidth:480 frameHeight:272 frameRate:126 payload:v15];
          float v17 = [VCVideoRule alloc];
          LODWORD(v18) = 15.0;
          uint64_t v19 = [(VCVideoRule *)v17 initWithFrameWidth:1024 frameHeight:576 frameRate:126 payload:v18];
          if (v19)
          {
            uint64_t v20 = (void *)v19;
            __int16 v21 = [VCVideoRule alloc];
            LODWORD(v22) = 15.0;
            uint64_t v23 = [(VCVideoRule *)v21 initWithFrameWidth:896 frameHeight:672 frameRate:126 payload:v22];
            if (v23)
            {
              int v24 = (void *)v23;
              [v3 addObject:v9];
              [v3 addObject:v13];
              [v3 addObject:v16];
              [v3 addObject:v20];
              [v3 addObject:v24];
              [v5 addObject:v9];
              [v5 addObject:v13];
              [v5 addObject:v16];
              [v5 addObject:v20];
              if ([(VCVideoRuleCollections *)self isPayloadSupported:126])
              {
                [(VCVideoRuleCollections *)self addVideoRules:v3 transportType:2 payload:126 encodingType:1];
                [(VCVideoRuleCollections *)self addVideoRules:v5 transportType:2 payload:126 encodingType:2];
              }
              BOOL v25 = 1;
              if ([(VCVideoRuleCollections *)self isPayloadSupported:123])
              {
                [(VCVideoRuleCollections *)self addVideoRules:v3 transportType:2 payload:123 encodingType:1];
                [(VCVideoRuleCollections *)self addVideoRules:v5 transportType:2 payload:123 encodingType:2];
              }
            }
            else
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[VCVideoRuleCollectionsCamera setupH264CellularRules].cold.6();
                }
              }
              int v24 = 0;
              BOOL v25 = 0;
            }
          }
          else
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCVideoRuleCollectionsCamera setupH264CellularRules].cold.5();
              }
            }
            int v24 = 0;
            BOOL v25 = 0;
            uint64_t v20 = 0;
          }
        }
        else
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCVideoRuleCollectionsCamera setupH264CellularRules].cold.4();
            }
          }
          int v24 = 0;
          BOOL v25 = 0;
          uint64_t v20 = 0;
          uint64_t v16 = 0;
          uint64_t v13 = 0;
        }
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCVideoRuleCollectionsCamera setupH264CellularRules]();
          }
        }
        int v24 = 0;
        BOOL v25 = 0;
        uint64_t v20 = 0;
        uint64_t v16 = 0;
        uint64_t v13 = 0;
        uint64_t v9 = 0;
      }
      goto LABEL_13;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoRuleCollectionsCamera setupH264CellularRules]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoRuleCollectionsCamera setupH264CellularRules]();
    }
  }
  int v24 = 0;
  BOOL v25 = 0;
  uint64_t v20 = 0;
  uint64_t v16 = 0;
  uint64_t v13 = 0;
  uint64_t v9 = 0;
  uint64_t v5 = 0;
LABEL_13:

  return v25;
}

- (BOOL)isHiDefCapable
{
  return *(&self->super._encodingType + 1) || *(&self->super._encodingType + 2) != 0;
}

- (BOOL)useSoftFramerateSwitching
{
  return 0;
}

- (_VCBitrateConfiguration)bitrateConfiguration
{
  return 0;
}

- (void)limitVideoRules
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([+[VCDefaults sharedInstance] forceDisableVideoRuleWiFi1080])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v20 = v3;
        __int16 v21 = 2080;
        double v22 = "-[VCVideoRuleCollectionsCamera limitVideoRules]";
        __int16 v23 = 1024;
        int v24 = 197;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sVCDefaults forceDisableVideoRuleWiFi1080 is set", buf, 0x1Cu);
      }
    }
    [(VCVideoRuleCollections *)self limitVideoRulesToMaxWidth:1280 maxHeight:720 transportType:1];
  }
  if ([+[VCDefaults sharedInstance] forceDisableVideoRuleCell720])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v20 = v5;
        __int16 v21 = 2080;
        double v22 = "-[VCVideoRuleCollectionsCamera limitVideoRules]";
        __int16 v23 = 1024;
        int v24 = 201;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sVCDefaults forceDisableVideoRuleCell720 is set", buf, 0x1Cu);
      }
    }
    [(VCVideoRuleCollections *)self limitVideoRulesToMaxWidth:480 maxHeight:272 transportType:2];
  }
  unsigned int v7 = +[VCHardwareSettings maxOneToOneFramerateSupported];
  unsigned int v8 = +[VCHardwareSettings maxMultiwayFramerateSupported];
  if (v7 <= v8) {
    unsigned int v9 = v8;
  }
  else {
    unsigned int v9 = v7;
  }
  if (v9 <= 0x3B)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v10 = [&unk_1F3DC7968 countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(&unk_1F3DC7968);
          }
          -[VCVideoRuleCollections removeVideoRulesWithFrameRate:transportType:](self, "removeVideoRulesWithFrameRate:transportType:", 60, [*(id *)(*((void *)&v15 + 1) + 8 * i) unsignedIntValue]);
        }
        uint64_t v11 = [&unk_1F3DC7968 countByEnumeratingWithState:&v15 objects:v14 count:16];
      }
      while (v11);
    }
  }
}

- (void)setupH264CellularRules
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate 896x672 rule for H264 cellular", v2, v3, v4, v5, v6);
}

@end