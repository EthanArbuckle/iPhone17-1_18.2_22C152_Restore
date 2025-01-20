@interface VCMediaNegotiatorBase
+ (BOOL)featureListStringsRequiredForMediaType:(unsigned __int8)a3;
+ (BOOL)initializeLocalConfiguration:(id)a3 negotiationData:(id)a4 deviceRole:(int)a5 preferredAudioPayload:(int)a6;
+ (BOOL)isAudioStreamGroup:(unsigned int)a3;
+ (BOOL)isU1StreamGroup:(unsigned int)a3;
+ (BOOL)selectBestVideoRuleForTransport:(unsigned __int8)a3 payload:(int)a4 encodingType:(unsigned __int8)a5 videoSettings:(id)a6 localVideoRuleCollection:(id)a7 remoteVideoRuleCollection:(id)a8;
+ (BOOL)v1FeatureListStringsSupportedForMediaType:(unsigned __int8)a3;
+ (id)getPreferredVideoPayloadList:(id)a3 localSupportedPayloads:(id)a4 mediaType:(unsigned __int8)a5;
+ (id)negotiateVideoMaxResolutionWithEncodeRules:(id)a3 decodeRules:(id)a4 isEncoder:(BOOL)a5;
+ (id)newNegotiatedAudioPayloadsWithLocalPayloads:(id)a3 remotePayloads:(id)a4;
+ (id)preferredPayloadsForMediaType:(unsigned __int8)a3;
+ (id)streamGroupIDsWithMediaBlob:(id)a3;
+ (unsigned)featureListStringTypeForMediaType:(unsigned __int8)a3;
+ (void)applyCellularPreferredRule:(id)a3;
+ (void)setupNegotiatedAudioPayloads:(id)a3 negotiatedAudioSettings:(id)a4 primaryPayloadPreference:(id)a5;
- (BOOL)processRemoteNegotiationData:(id)a3;
- (BOOL)setUpU1MediaSettings;
- (NSArray)negotiatedStreamGroups;
- (VCMediaNegotiatorBase)initWithLocalSettings:(id)a3;
- (VCMediaNegotiatorLocalConfiguration)localSettings;
- (VCMediaNegotiatorResults)negotiatedSettings;
- (VCMediaNegotiatorResultsAudio)negotiatedAudioSettings;
- (VCMediaNegotiatorResultsFaceTimeSettings)negotiatedFaceTimeSettings;
- (VCMediaNegotiatorResultsMediaRecorder)negotiatedMediaRecorderSettings;
- (VCMediaNegotiatorResultsVideo)negotiatedScreenSettings;
- (VCMediaNegotiatorResultsVideo)negotiatedVideoSettings;
- (id)negotiatedResultsForGroupID:(unsigned int)a3;
- (id)negotiatedResultsForGroupID:(unsigned int)a3 localU1Config:(id)a4 remoteU1Config:(id)a5;
- (id)negotiatedStreamGroupConfigForGroupID:(unsigned int)a3 negotiatedStreamGroupConfigs:(id)a4;
- (id)negotiationData;
- (unsigned)remoteMaxBandwidthForArbiterMode:(unsigned __int8)a3 connectionType:(int)a4;
- (void)dealloc;
- (void)setUpU1MediaSettings;
@end

@implementation VCMediaNegotiatorBase

- (BOOL)setUpU1MediaSettings
{
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  self->_negotiatedU1MediaSettings = v3;
  if (v3)
  {
    v4 = objc_alloc_init(VCMediaNegotiatorResultsAudio);
    if (v4)
    {
      v5 = v4;
      [(NSMutableDictionary *)self->_negotiatedU1MediaSettings setObject:v4 forKeyedSubscript:&unk_1F3DC2BF8];

      v6 = objc_alloc_init(VCMediaNegotiatorResultsVideo);
      if (v6)
      {
        v7 = v6;
        [(NSMutableDictionary *)self->_negotiatedU1MediaSettings setObject:v6 forKeyedSubscript:&unk_1F3DC2C10];

        v8 = objc_alloc_init(VCMediaNegotiatorResultsVideo);
        if (v8)
        {
          v9 = v8;
          [(NSMutableDictionary *)self->_negotiatedU1MediaSettings setObject:v8 forKeyedSubscript:&unk_1F3DC2C28];

          LOBYTE(v10) = 1;
          return v10;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v10) {
            return v10;
          }
          -[VCMediaNegotiatorBase setUpU1MediaSettings].cold.4();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v10) {
          return v10;
        }
        -[VCMediaNegotiatorBase setUpU1MediaSettings]();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v10) {
        return v10;
      }
      -[VCMediaNegotiatorBase setUpU1MediaSettings]();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v10) {
      return v10;
    }
    -[VCMediaNegotiatorBase setUpU1MediaSettings]();
  }
  LOBYTE(v10) = 0;
  return v10;
}

- (VCMediaNegotiatorBase)initWithLocalSettings:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)VCMediaNegotiatorBase;
  v4 = [(VCMediaNegotiatorBase *)&v16 init];
  if (v4)
  {
    v5 = (VCMediaNegotiatorLocalConfiguration *)a3;
    v4->_localSettings = v5;
    id v6 = [(VCMediaNegotiatorLocalConfiguration *)v5 mediaConfigurationForMediaType:1];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = [(VCMediaNegotiatorLocalConfiguration *)v4->_localSettings preferredAudioCodec];
        int v10 = [v6 allowAudioSwitching];
        *(_DWORD *)buf = 136316162;
        uint64_t v18 = v7;
        __int16 v19 = 2080;
        v20 = "-[VCMediaNegotiatorBase initWithLocalSettings:]";
        __int16 v21 = 1024;
        int v22 = 65;
        __int16 v23 = 1024;
        int v24 = v9;
        __int16 v25 = 1024;
        int v26 = v10;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Local preferredAudioCodec=%u, allowAudioSwitching=%{BOOL}d", buf, 0x28u);
      }
    }
    v11 = objc_alloc_init(VCMediaNegotiatorResults);
    v4->_negotiatedSettings = v11;
    if (v11)
    {
      if ([(VCMediaNegotiatorBase *)v4 setUpU1MediaSettings])
      {
        v12 = objc_alloc_init(VCMediaNegotiatorResultsMediaRecorder);
        v4->_negotiatedMediaRecorderSettings = v12;
        if (v12)
        {
          v13 = objc_alloc_init(VCMediaNegotiatorResultsFaceTimeSettings);
          v4->_negotiatedFaceTimeSettings = v13;
          if (v13)
          {
            v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v4->_negotiatedStreamGroups = v14;
            if (v14) {
              return v4;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCMediaNegotiatorBase initWithLocalSettings:].cold.4();
              }
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCMediaNegotiatorBase initWithLocalSettings:]();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaNegotiatorBase initWithLocalSettings:]();
          }
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiatorBase initWithLocalSettings:]();
      }
    }

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorBase;
  [(VCMediaNegotiatorBase *)&v3 dealloc];
}

- (VCMediaNegotiatorResultsAudio)negotiatedAudioSettings
{
  id v2 = (id)[(NSMutableDictionary *)self->_negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC2BF8];

  return (VCMediaNegotiatorResultsAudio *)v2;
}

- (VCMediaNegotiatorResultsVideo)negotiatedVideoSettings
{
  id v2 = (id)[(NSMutableDictionary *)self->_negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC2C10];

  return (VCMediaNegotiatorResultsVideo *)v2;
}

- (VCMediaNegotiatorResultsVideo)negotiatedScreenSettings
{
  id v2 = (id)[(NSMutableDictionary *)self->_negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC2C28];

  return (VCMediaNegotiatorResultsVideo *)v2;
}

- (id)negotiationData
{
}

- (BOOL)processRemoteNegotiationData:(id)a3
{
}

+ (BOOL)initializeLocalConfiguration:(id)a3 negotiationData:(id)a4 deviceRole:(int)a5 preferredAudioPayload:(int)a6
{
}

+ (id)streamGroupIDsWithMediaBlob:(id)a3
{
}

- (unsigned)remoteMaxBandwidthForArbiterMode:(unsigned __int8)a3 connectionType:(int)a4
{
}

- (id)negotiatedStreamGroupConfigForGroupID:(unsigned int)a3 negotiatedStreamGroupConfigs:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v6 = [a4 countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v27 != v8) {
        objc_enumerationMutation(a4);
      }
      int v10 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
      if ([v10 groupID] == a3) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [a4 countByEnumeratingWithState:&v26 objects:v25 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315906;
        uint64_t v18 = v11;
        __int16 v19 = 2080;
        v20 = "-[VCMediaNegotiatorBase negotiatedStreamGroupConfigForGroupID:negotiatedStreamGroupConfigs:]";
        __int16 v21 = 1024;
        int v22 = 148;
        __int16 v23 = 2080;
        int v24 = FourccToCStr(a3);
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Found one to one stream group for groupID=%s", (uint8_t *)&v17, 0x26u);
      }
    }
    if (v10) {
      return v10;
    }
  }
LABEL_14:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      v15 = FourccToCStr(a3);
      int v17 = 136315906;
      uint64_t v18 = v13;
      __int16 v19 = 2080;
      v20 = "-[VCMediaNegotiatorBase negotiatedStreamGroupConfigForGroupID:negotiatedStreamGroupConfigs:]";
      __int16 v21 = 1024;
      int v22 = 152;
      __int16 v23 = 2080;
      int v24 = v15;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to find one to one stream group for groupID=%s", (uint8_t *)&v17, 0x26u);
    }
  }
  int v10 = 0;
  return v10;
}

- (id)negotiatedResultsForGroupID:(unsigned int)a3
{
  id v3 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_negotiatedU1MediaSettings, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedChar:VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID(a3)]);

  return v3;
}

+ (BOOL)featureListStringsRequiredForMediaType:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v5 = a3 - 2;
  if (a3 - 2) < 5 && ((0x1Bu >> v5)) {
    return (0xFu >> v5) & 1;
  }
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v7) {
        return v7;
      }
      +[VCMediaNegotiatorBase featureListStringsRequiredForMediaType:]();
    }
LABEL_14:
    LOBYTE(v7) = 0;
    return v7;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v6 = (__CFString *)[a1 performSelector:sel_logPrefix];
  }
  else {
    uint64_t v6 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_14;
  }
  uint64_t v8 = VRTraceErrorLogLevelToCSTR();
  uint64_t v9 = *MEMORY[0x1E4F47A50];
  BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v7)
  {
    int v11 = 136316418;
    uint64_t v12 = v8;
    __int16 v13 = 2080;
    v14 = "+[VCMediaNegotiatorBase featureListStringsRequiredForMediaType:]";
    __int16 v15 = 1024;
    int v16 = 179;
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    __int16 v19 = 2048;
    id v20 = a1;
    __int16 v21 = 1024;
    int v22 = v3;
    _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected mediaType=%hhu", (uint8_t *)&v11, 0x36u);
    goto LABEL_14;
  }
  return v7;
}

+ (BOOL)v1FeatureListStringsSupportedForMediaType:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v5 = a3 - 2;
  if (a3 - 2) < 5 && ((0x1Bu >> v5)) {
    return (7u >> v5) & 1;
  }
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v7) {
        return v7;
      }
      +[VCMediaNegotiatorBase v1FeatureListStringsSupportedForMediaType:]();
    }
LABEL_14:
    LOBYTE(v7) = 0;
    return v7;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v6 = (__CFString *)[a1 performSelector:sel_logPrefix];
  }
  else {
    uint64_t v6 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_14;
  }
  uint64_t v8 = VRTraceErrorLogLevelToCSTR();
  uint64_t v9 = *MEMORY[0x1E4F47A50];
  BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v7)
  {
    int v11 = 136316418;
    uint64_t v12 = v8;
    __int16 v13 = 2080;
    v14 = "+[VCMediaNegotiatorBase v1FeatureListStringsSupportedForMediaType:]";
    __int16 v15 = 1024;
    int v16 = 201;
    __int16 v17 = 2112;
    uint64_t v18 = v6;
    __int16 v19 = 2048;
    id v20 = a1;
    __int16 v21 = 1024;
    int v22 = v3;
    _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected mediaType=%hhu", (uint8_t *)&v11, 0x36u);
    goto LABEL_14;
  }
  return v7;
}

+ (unsigned)featureListStringTypeForMediaType:(unsigned __int8)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    int v3 = a3;
    if (a3 == 5)
    {
      LOBYTE(v4) = 7;
    }
    else
    {
      if (a3 != 3)
      {
        if ((id)objc_opt_class() == a1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            int v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v4) {
              return v4;
            }
            +[VCMediaNegotiatorBase featureListStringTypeForMediaType:]();
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v6 = (__CFString *)[a1 performSelector:sel_logPrefix];
          }
          else {
            uint64_t v6 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v7 = VRTraceErrorLogLevelToCSTR();
            uint64_t v8 = *MEMORY[0x1E4F47A50];
            int v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v4) {
              return v4;
            }
            int v10 = 136316418;
            uint64_t v11 = v7;
            __int16 v12 = 2080;
            __int16 v13 = "+[VCMediaNegotiatorBase featureListStringTypeForMediaType:]";
            __int16 v14 = 1024;
            int v15 = 224;
            __int16 v16 = 2112;
            __int16 v17 = v6;
            __int16 v18 = 2048;
            id v19 = a1;
            __int16 v20 = 1024;
            int v21 = v3;
            _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected mediaType=%hhu", (uint8_t *)&v10, 0x36u);
          }
        }
        LOBYTE(v4) = 0;
        return v4;
      }
      LOBYTE(v4) = 6;
    }
  }
  return v4;
}

+ (BOOL)isU1StreamGroup:(unsigned int)a3
{
  BOOL result = 1;
  if ((int)a3 > 1835623281)
  {
    if (a3 != 1835623282 && a3 != 1935897189)
    {
      int v4 = 1937339233;
LABEL_8:
      if (a3 != v4) {
        return 0;
      }
    }
  }
  else if (a3 != 1650745716 && a3 != 1667329381)
  {
    int v4 = 1718909044;
    goto LABEL_8;
  }
  return result;
}

+ (BOOL)isAudioStreamGroup:(unsigned int)a3
{
  BOOL v3 = a3 == 1835623287 || a3 == 1937339233;
  return a3 == 1835623282 || v3;
}

- (id)negotiatedResultsForGroupID:(unsigned int)a3 localU1Config:(id)a4 remoteU1Config:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315906;
      uint64_t v14 = v8;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCMediaNegotiatorBase negotiatedResultsForGroupID:localU1Config:remoteU1Config:]";
      __int16 v17 = 1024;
      int v18 = 293;
      __int16 v19 = 2080;
      __int16 v20 = FourccToCStr(v7);
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Get negotiated results for stream group groupID=%s", (uint8_t *)&v13, 0x26u);
    }
  }
  if ([(id)objc_opt_class() isU1StreamGroup:v7])
  {
    if ([(id)objc_opt_class() isAudioStreamGroup:v7]) {
      return +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedAudioSettingsForGroupID:v7 localU1Config:a4 remoteU1Config:a5];
    }
    else {
      return +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedVideoSettingsForGroupID:v7 localU1Config:a4 remoteU1Config:a5];
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      __int16 v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiatorBase negotiatedResultsForGroupID:localU1Config:remoteU1Config:](v11, v7, v12);
      }
    }
    return 0;
  }
}

+ (id)preferredPayloadsForMediaType:(unsigned __int8)a3
{
  char v3 = a3 - 2;
  if (a3 - 2) < 5 && ((0x1Bu >> v3)) {
    return (id)qword_1E6DB43F8[v3];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      +[VCMediaNegotiatorBase preferredPayloadsForMediaType:]();
    }
  }
  return 0;
}

+ (id)getPreferredVideoPayloadList:(id)a3 localSupportedPayloads:(id)a4 mediaType:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (![+[VCDefaults sharedInstance] forceHWI]) {
    return (id)[a1 preferredPayloadsForMediaType:v5];
  }
  uint64_t v9 = [+[VCDefaults sharedInstance] forceVideoPayload];
  if (v9 == 128)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return (id)[a1 preferredPayloadsForMediaType:v5];
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return (id)[a1 preferredPayloadsForMediaType:v5];
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v26 = v10;
    __int16 v27 = 2080;
    long long v28 = "+[VCMediaNegotiatorBase getPreferredVideoPayloadList:localSupportedPayloads:mediaType:]";
    __int16 v29 = 1024;
    int v30 = 337;
    __int16 v12 = " [%s] %s:%d Video payload OVERRIDE is PL_INVALID! Ignoring ...";
    int v13 = v11;
    uint32_t v14 = 28;
LABEL_19:
    _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    return (id)[a1 preferredPayloadsForMediaType:v5];
  }
  uint64_t v15 = v9;
  if ((objc_msgSend(a3, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v9)) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return (id)[a1 preferredPayloadsForMediaType:v5];
    }
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    uint64_t v22 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return (id)[a1 preferredPayloadsForMediaType:v5];
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v26 = v21;
    __int16 v27 = 2080;
    long long v28 = "+[VCMediaNegotiatorBase getPreferredVideoPayloadList:localSupportedPayloads:mediaType:]";
    __int16 v29 = 1024;
    int v30 = 339;
    __int16 v31 = 1024;
    int v32 = v15;
    __int16 v12 = " [%s] %s:%d Remote client doesn't support video OVERRIDE payload (%d). Ignoring ...";
LABEL_18:
    int v13 = v22;
    uint32_t v14 = 34;
    goto LABEL_19;
  }
  char v16 = objc_msgSend(a4, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v15));
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((v16 & 1) == 0)
  {
    if (ErrorLogLevelForModule < 5) {
      return (id)[a1 preferredPayloadsForMediaType:v5];
    }
    uint64_t v23 = VRTraceErrorLogLevelToCSTR();
    uint64_t v22 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return (id)[a1 preferredPayloadsForMediaType:v5];
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v26 = v23;
    __int16 v27 = 2080;
    long long v28 = "+[VCMediaNegotiatorBase getPreferredVideoPayloadList:localSupportedPayloads:mediaType:]";
    __int16 v29 = 1024;
    int v30 = 341;
    __int16 v31 = 1024;
    int v32 = v15;
    __int16 v12 = " [%s] %s:%d Local client doesn't support video OVERRIDE payload (%d). Ignoring ...";
    goto LABEL_18;
  }
  if (ErrorLogLevelForModule >= 5)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    __int16 v19 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v26 = v18;
      __int16 v27 = 2080;
      long long v28 = "+[VCMediaNegotiatorBase getPreferredVideoPayloadList:localSupportedPayloads:mediaType:]";
      __int16 v29 = 1024;
      int v30 = 343;
      __int16 v31 = 1024;
      int v32 = v15;
      _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Video payload OVERRIDE to %d", buf, 0x22u);
    }
  }
  uint64_t v24 = [NSNumber numberWithInt:v15];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
}

+ (id)negotiateVideoMaxResolutionWithEncodeRules:(id)a3 decodeRules:(id)a4 isEncoder:(BOOL)a5
{
  BOOL v21 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = (id)[a4 reverseObjectEnumerator];
  id result = (id)[obj countByEnumeratingWithState:&v30 objects:v29 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v23 = 0;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v11 = (void *)[a3 reverseObjectEnumerator];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v24 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v26;
LABEL_8:
          uint64_t v15 = 0;
          while (1)
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v11);
            }
            char v16 = *(void **)(*((void *)&v25 + 1) + 8 * v15);
            uint64_t v17 = [v10 compare:v16];
            if (v17 == 1) {
              break;
            }
            if (!v17)
            {
              [v10 fPref];
              if (v21) {
                __int16 v19 = v16;
              }
              else {
                __int16 v19 = v10;
              }
              if (v18 != 1.0)
              {
                __int16 v20 = v23;
                if (!v23) {
                  __int16 v20 = v19;
                }
                uint64_t v23 = v20;
                break;
              }
              return (id)[MEMORY[0x1E4F1CA48] arrayWithObjects:0];
            }
            if (v13 == ++v15)
            {
              uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v24 count:16];
              if (v13) {
                goto LABEL_8;
              }
              break;
            }
          }
        }
      }
      id v7 = (id)[obj countByEnumeratingWithState:&v30 objects:v29 count:16];
    }
    while (v7);
    if (v23) {
      return (id)[MEMORY[0x1E4F1CA48] arrayWithObjects:0];
    }
    else {
      return 0;
    }
  }
  return result;
}

+ (BOOL)selectBestVideoRuleForTransport:(unsigned __int8)a3 payload:(int)a4 encodingType:(unsigned __int8)a5 videoSettings:(id)a6 localVideoRuleCollection:(id)a7 remoteVideoRuleCollection:(id)a8
{
  uint64_t v11 = a5;
  uint64_t v12 = *(void *)&a4;
  uint64_t v13 = a3;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorBase selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCollection:remoteVideoRuleCollection:]();
      }
    }
    goto LABEL_46;
  }
  uint64_t v15 = [a7 getVideoRulesForTransport:v13 payload:v12 encodingType:v11];
  if (!v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v34 = VRTraceErrorLogLevelToCSTR();
      v35 = *MEMORY[0x1E4F47A50];
      BOOL v32 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v47 = v34;
      __int16 v48 = 2080;
      v49 = "+[VCMediaNegotiatorBase selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCol"
            "lection:remoteVideoRuleCollection:]";
      __int16 v50 = 1024;
      int v51 = 392;
      __int16 v52 = 1024;
      int v53 = v12;
      __int16 v54 = 1024;
      int v55 = v13;
      __int16 v56 = 1024;
      int v57 = v11;
      v36 = " [%s] %s:%d No local video rules for payload=%d transport=%d encoding=%d";
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  char v16 = (void *)v15;
  if (v11 == 2) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = 2;
  }
  uint64_t v18 = [a8 getVideoRulesForTransport:v13 payload:v12 encodingType:v17];
  if (!v18)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v37 = VRTraceErrorLogLevelToCSTR();
      v35 = *MEMORY[0x1E4F47A50];
      BOOL v32 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v47 = v37;
      __int16 v48 = 2080;
      v49 = "+[VCMediaNegotiatorBase selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCol"
            "lection:remoteVideoRuleCollection:]";
      __int16 v50 = 1024;
      int v51 = 396;
      __int16 v52 = 1024;
      int v53 = v12;
      __int16 v54 = 1024;
      int v55 = v13;
      __int16 v56 = 1024;
      int v57 = v11;
      v36 = " [%s] %s:%d No remote video rules for payload=%d transport=%d encoding=%d";
      goto LABEL_45;
    }
LABEL_46:
    BOOL v32 = 0;
    goto LABEL_32;
  }
  __int16 v19 = (void *)v18;
  p_info = (__objc2_class_ro **)(VCMediaControlInfo + 32);
  if (v13 == 2)
  {
    if (v11 == 1)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v21 = [v16 countByEnumeratingWithState:&v42 objects:v41 count:16];
      id v22 = v14;
      if (v21)
      {
        uint64_t v23 = v21;
        id v39 = a6;
        uint64_t v40 = v12 | 0x200000000;
        uint64_t v24 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v43 != v24) {
              objc_enumerationMutation(v16);
            }
            uint64_t v26 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            if (objc_msgSend(v19, "containsObject:matchingComparison:", v26, sel_compare_, v39, v40)) {
              [v14 addObject:v26];
            }
          }
          uint64_t v23 = [v16 countByEnumeratingWithState:&v42 objects:v41 count:16];
        }
        while (v23);
        id v22 = v14;
        uint64_t v12 = v40;
        uint64_t v13 = HIDWORD(v40);
        a6 = v39;
      }
    }
    else
    {
      id v22 = (id)v18;
    }
    p_info = VCMediaControlInfo.info;
    +[VCMediaNegotiatorBase applyCellularPreferredRule:v22];
    __int16 v19 = v22;
  }
  if (v11 == 1) {
    long long v27 = v16;
  }
  else {
    long long v27 = v19;
  }
  if (v11 == 1) {
    long long v28 = v19;
  }
  else {
    long long v28 = v16;
  }
  uint64_t v29 = [p_info + 166 negotiateVideoMaxResolutionWithEncodeRules:v27 decodeRules:v28 isEncoder:v11 == 1];
  if (!v29)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v38 = VRTraceErrorLogLevelToCSTR();
      v35 = *MEMORY[0x1E4F47A50];
      BOOL v32 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v47 = v38;
      __int16 v48 = 2080;
      v49 = "+[VCMediaNegotiatorBase selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCol"
            "lection:remoteVideoRuleCollection:]";
      __int16 v50 = 1024;
      int v51 = 413;
      __int16 v52 = 1024;
      int v53 = v12;
      __int16 v54 = 1024;
      int v55 = v13;
      __int16 v56 = 1024;
      int v57 = v11;
      v36 = " [%s] %s:%d No matching remote rules for payload=%d transport=%d encoding=%d";
LABEL_45:
      _os_log_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_DEFAULT, v36, buf, 0x2Eu);
      goto LABEL_46;
    }
    goto LABEL_46;
  }
  [a6 addVideoRules:v29 transportType:v13 payload:v12 encodingType:v11];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    long long v31 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v47 = v30;
      __int16 v48 = 2080;
      v49 = "+[VCMediaNegotiatorBase selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCol"
            "lection:remoteVideoRuleCollection:]";
      __int16 v50 = 1024;
      int v51 = 416;
      __int16 v52 = 1024;
      int v53 = v12;
      __int16 v54 = 1024;
      int v55 = v13;
      __int16 v56 = 1024;
      int v57 = v11;
      _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Negotiated rules added for payloadType=%d, transportType=%d, encodingType=%d", buf, 0x2Eu);
    }
  }
  BOOL v32 = 1;
LABEL_32:

  return v32;
}

+ (void)applyCellularPreferredRule:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v19;
    int v8 = -1;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = 0;
        unsigned int v11 = v8;
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = &dword_1E259BF6C;
        while ([v12 iWidth] != *(v13 - 1)
             || [v12 iHeight] != *v13)
        {
          v13 += 3;
          if (++v10 == 5)
          {
            int v8 = v11;
            goto LABEL_23;
          }
        }
        if (!v6)
        {
          int v8 = v10;
          goto LABEL_22;
        }
        if (v11 == v10)
        {
          [v6 fRate];
          float v16 = v15;
          [v12 fRate];
          if (v16 < *(float *)&v14)
          {
            int v8 = v11;
LABEL_22:
            uint64_t v6 = v12;
            goto LABEL_23;
          }
        }
        if (v10 <= v11) {
          int v8 = v11;
        }
        else {
          int v8 = v10;
        }
        if (v11 < v10) {
          uint64_t v6 = v12;
        }
LABEL_23:
        if (v8 == 4) {
          goto LABEL_26;
        }
      }
      uint64_t v5 = [a3 countByEnumeratingWithState:&v18 objects:v17 count:16];
      if (!v5)
      {
LABEL_26:
        if (v6)
        {
          LODWORD(v14) = 1.0;
          [v6 setFPref:v14];
        }
        return;
      }
    }
  }
}

+ (id)newNegotiatedAudioPayloadsWithLocalPayloads:(id)a3 remotePayloads:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[a3 mutableCopy];
  [v6 intersectSet:a4];
  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
    return v6;
  }
  __str = 0;
  if (v6)
  {
    uint64_t v7 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
    if (a3) {
      goto LABEL_4;
    }
LABEL_7:
    int v8 = "<nil>";
    if (a4) {
      goto LABEL_5;
    }
    goto LABEL_8;
  }
  uint64_t v7 = "<nil>";
  if (!a3) {
    goto LABEL_7;
  }
LABEL_4:
  int v8 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
  if (a4)
  {
LABEL_5:
    uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
    goto LABEL_9;
  }
LABEL_8:
  uint64_t v9 = "<nil>";
LABEL_9:
  asprintf(&__str, "Negotiated payloads=%s, localSupportedPayloads=%s, remoteSupportedPayloads=%s", v7, v8, v9);
  if (__str)
  {
    __lasts = 0;
    uint64_t v10 = strtok_r(__str, "\n", &__lasts);
    unsigned int v11 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v18 = v12;
          __int16 v19 = 2080;
          long long v20 = "+[VCMediaNegotiatorBase newNegotiatedAudioPayloadsWithLocalPayloads:remotePayloads:]";
          __int16 v21 = 1024;
          int v22 = 463;
          __int16 v23 = 2080;
          uint64_t v24 = "";
          __int16 v25 = 2080;
          uint64_t v26 = v10;
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      uint64_t v10 = strtok_r(0, "\n", &__lasts);
    }
    while (v10);
    free(__str);
  }
  return v6;
}

+ (void)setupNegotiatedAudioPayloads:(id)a3 negotiatedAudioSettings:(id)a4 primaryPayloadPreference:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        uint64_t v14 = [v13 unsignedIntValue];
        if (v14 == 20)
        {
          [a4 setRedPayload:20];
          goto LABEL_16;
        }
        uint64_t v15 = v14;
        if (v14 == 13)
        {
          [a4 setDtxPayload:13];
          goto LABEL_16;
        }
        unint64_t v16 = [a5 indexOfObject:v13];
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_11:
          [a4 addSecondaryPayload:v15];
          goto LABEL_16;
        }
        unint64_t v17 = v16;
        if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_15;
        }
        if (v16 < v11)
        {
          objc_msgSend(a4, "addSecondaryPayload:", objc_msgSend(a4, "primaryPayload"));
LABEL_15:
          [a4 setPrimaryPayload:v15];
          unint64_t v11 = v17;
          goto LABEL_16;
        }
        if (v16 > v11) {
          goto LABEL_11;
        }
LABEL_16:
        ++v12;
      }
      while (v9 != v12);
      uint64_t v18 = [a3 countByEnumeratingWithState:&v20 objects:v19 count:16];
      uint64_t v9 = v18;
    }
    while (v18);
  }
}

- (VCMediaNegotiatorLocalConfiguration)localSettings
{
  return self->_localSettings;
}

- (VCMediaNegotiatorResults)negotiatedSettings
{
  return self->_negotiatedSettings;
}

- (VCMediaNegotiatorResultsMediaRecorder)negotiatedMediaRecorderSettings
{
  return self->_negotiatedMediaRecorderSettings;
}

- (VCMediaNegotiatorResultsFaceTimeSettings)negotiatedFaceTimeSettings
{
  return self->_negotiatedFaceTimeSettings;
}

- (NSArray)negotiatedStreamGroups
{
  return &self->_negotiatedStreamGroups->super;
}

- (void)setUpU1MediaSettings
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate negotiation screen results", v2, v3, v4, v5, v6);
}

- (void)initWithLocalSettings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate negotiation results", v2, v3, v4, v5, v6);
}

- (void)initWithLocalSettings:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate negotiation moments results", v2, v3, v4, v5, v6);
}

- (void)initWithLocalSettings:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate FaceTime settings results", v2, v3, v4, v5, v6);
}

- (void)initWithLocalSettings:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the negotiated stream groups array", v2, v3, v4, v5, v6);
}

+ (void)featureListStringsRequiredForMediaType:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCMediaNegotiatorBase featureListStringsRequiredForMediaType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected mediaType=%hhu", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiatorBase featureListStringsRequiredForMediaType:]" >> 16, v4);
}

+ (void)v1FeatureListStringsSupportedForMediaType:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCMediaNegotiatorBase v1FeatureListStringsSupportedForMediaType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected mediaType=%hhu", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiatorBase v1FeatureListStringsSupportedForMediaType:]" >> 16, v4);
}

+ (void)featureListStringTypeForMediaType:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCMediaNegotiatorBase featureListStringTypeForMediaType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected mediaType=%hhu", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiatorBase featureListStringTypeForMediaType:]" >> 16, v4);
}

- (void)negotiatedResultsForGroupID:(uint64_t)a1 localU1Config:(int)a2 remoteU1Config:(NSObject *)a3 .cold.1(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint64_t v7 = "-[VCMediaNegotiatorBase negotiatedResultsForGroupID:localU1Config:remoteU1Config:]";
  __int16 v8 = 1024;
  int v9 = 305;
  __int16 v10 = 2080;
  unint64_t v11 = FourccToCStr(a2);
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to get negotiated results for stream group groupID=%s", (uint8_t *)&v4, 0x26u);
}

+ (void)preferredPayloadsForMediaType:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCMediaNegotiatorBase preferredPayloadsForMediaType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected mediaType=%hhu", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiatorBase preferredPayloadsForMediaType:]" >> 16, v4);
}

+ (void)selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCollection:remoteVideoRuleCollection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate updatedRules array", v2, v3, v4, v5, v6);
}

@end