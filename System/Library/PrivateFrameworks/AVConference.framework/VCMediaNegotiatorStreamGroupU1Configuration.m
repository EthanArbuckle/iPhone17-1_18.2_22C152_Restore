@interface VCMediaNegotiatorStreamGroupU1Configuration
+ (BOOL)ssrcForStreamGroup:(unsigned int)a3 localConfig:(id)a4 ssrc:(unsigned int *)a5;
+ (BOOL)updateCommonNegotiatedVideoSettings:(id)a3 localU1Config:(id)a4 remoteU1Config:(id)a5;
+ (BOOL)updateVideoPayloadsAndParametersForU1Config:(id)a3;
+ (id)negotiatedAudioSettingsForGroupID:(unsigned int)a3 localU1Config:(id)a4 remoteU1Config:(id)a5;
+ (id)negotiatedMicrophoneSettingsBetweenLocalU1Config:(id)a3 remoteU1Config:(id)a4;
+ (id)negotiatedScreenSettingsBetweenLocalU1Config:(id)a3 remoteU1Config:(id)a4;
+ (id)negotiatedSystemAudioSettingsBetweenLocalU1Config:(id)a3 remoteU1Config:(id)a4;
+ (id)negotiatedVideoSettingsBetweenLocalU1Config:(id)a3 remoteU1Config:(id)a4 streamGroupID:(unsigned int)a5;
+ (id)negotiatedVideoSettingsForGroupID:(unsigned int)a3 localU1Config:(id)a4 remoteU1Config:(id)a5;
+ (int64_t)negotiateU1CipherSuiteForStreamGroupID:(unsigned int)a3 remoteSupportedCipherSuites:(id)a4;
+ (void)negotiateFeatureStrings:(id)a3 localU1Config:(id)a4 remoteU1Config:(id)a5;
+ (void)updateBodyDataU1Config:(id)a3 bodyDataConfiguration:(id)a4;
+ (void)updateCameraU1Config:(id)a3 cameraConfiguration:(id)a4;
+ (void)updateFaceTextureU1Config:(id)a3 faceTextureConfiguration:(id)a4;
+ (void)updateScreenU1Config:(id)a3 screenConfiguration:(id)a4;
- (BOOL)allowAudioRecording;
- (BOOL)isEqual:(id)a3;
- (NSArray)payloadPreference;
- (NSArray)videoParameterSet;
- (NSArray)videoPayloads;
- (NSDictionary)videoFeatureStrings;
- (NSDictionary)videoFeatureStringsFixedPosition;
- (NSOrderedSet)supportedCipherSuites;
- (NSSet)audioPayloads;
- (VCMediaNegotiatorStreamGroupU1Configuration)init;
- (VCMediaNegotiatorStreamGroupU1Configuration)initWithSSRC:(unsigned int)a3;
- (VCVideoRuleCollections)videoRuleCollections;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initStreamGroupU1ConfigForGroupId:(unsigned int)a3 withLocalConfig:(id)a4;
- (unsigned)screenPixelCount;
- (unsigned)ssrc;
- (unsigned)supportedDirection;
- (void)dealloc;
- (void)setAllowAudioRecording:(BOOL)a3;
- (void)setAudioPayloads:(id)a3;
- (void)setPayloadPreference:(id)a3;
- (void)setScreenPixelCount:(unsigned int)a3;
- (void)setSsrc:(unsigned int)a3;
- (void)setSupportedCipherSuites:(id)a3;
- (void)setSupportedDirection:(unsigned __int8)a3;
- (void)setVideoFeatureStrings:(id)a3;
- (void)setVideoFeatureStringsFixedPosition:(id)a3;
- (void)setVideoParameterSet:(id)a3;
- (void)setVideoPayloads:(id)a3;
- (void)setVideoRuleCollections:(id)a3;
- (void)updateWithAudioConfiguration:(id)a3 mediaType:(unsigned __int8)a4;
@end

@implementation VCMediaNegotiatorStreamGroupU1Configuration

- (VCMediaNegotiatorStreamGroupU1Configuration)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorStreamGroupU1Configuration;
  return [(VCMediaNegotiatorStreamGroupU1Configuration *)&v3 init];
}

- (VCMediaNegotiatorStreamGroupU1Configuration)initWithSSRC:(unsigned int)a3
{
  result = [(VCMediaNegotiatorStreamGroupU1Configuration *)self init];
  if (result) {
    result->_ssrc = a3;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorStreamGroupU1Configuration;
  [(VCMediaNegotiatorStreamGroupU1Configuration *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (!a3)
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || [a3 supportedDirection] != self->_supportedDirection
    || [a3 ssrc] != self->_ssrc
    || self->_allowAudioRecording != [a3 allowAudioRecording]
    || [a3 screenPixelCount] != self->_screenPixelCount)
  {
    goto LABEL_26;
  }
  v5 = (NSSet *)[a3 audioPayloads];
  if (v5 == self->_audioPayloads || (int v6 = -[NSSet isEqual:](v5, "isEqual:")) != 0)
  {
    v7 = (NSOrderedSet *)[a3 supportedCipherSuites];
    if (v7 == self->_supportedCipherSuites || (int v6 = -[NSOrderedSet isEqual:](v7, "isEqual:")) != 0)
    {
      v8 = (NSArray *)[a3 payloadPreference];
      if (v8 == self->_payloadPreference || (int v6 = -[NSArray isEqual:](v8, "isEqual:")) != 0)
      {
        v9 = (NSArray *)[a3 videoPayloads];
        if (v9 == self->_videoPayloads || (int v6 = -[NSArray isEqual:](v9, "isEqual:")) != 0)
        {
          v10 = (NSArray *)[a3 videoParameterSet];
          if (v10 == self->_videoParameterSet || (int v6 = -[NSArray isEqual:](v10, "isEqual:")) != 0)
          {
            v11 = (NSDictionary *)[a3 videoFeatureStrings];
            if (v11 == self->_videoFeatureStrings || (int v6 = -[NSDictionary isEqual:](v11, "isEqual:")) != 0)
            {
              v12 = (NSDictionary *)[a3 videoFeatureStringsFixedPosition];
              if (v12 == self->_videoFeatureStringsFixedPosition
                || (int v6 = -[NSDictionary isEqual:](v12, "isEqual:")) != 0)
              {
                if ([a3 videoRuleCollections])
                {
                  if (objc_msgSend((id)objc_msgSend(a3, "videoRuleCollections"), "isEqual:", self->_videoRuleCollections))
                  {
LABEL_23:
                    LOBYTE(v6) = 1;
                    return v6;
                  }
                }
                else if (!self->_videoRuleCollections)
                {
                  goto LABEL_23;
                }
LABEL_26:
                LOBYTE(v6) = 0;
              }
            }
          }
        }
      }
    }
  }
  return v6;
}

- (void)updateWithAudioConfiguration:(id)a3 mediaType:(unsigned __int8)a4
{
  int v4 = a4;
  self->_allowAudioRecording = [a3 allowAudioRecording];

  self->_audioPayloads = (NSSet *)(id)[a3 audioPayloads];
  v7 = &unk_1F3DC7698;
  if (v4 != 4) {
    v7 = 0;
  }
  if (v4 == 1) {
    v8 = &unk_1F3DC7680;
  }
  else {
    v8 = v7;
  }

  self->_payloadPreference = (NSArray *)v8;
}

+ (void)updateCameraU1Config:(id)a3 cameraConfiguration:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v6 = (void *)[a4 videoRuleCollections];
  [a3 setVideoRuleCollections:v6];
  objc_msgSend(a3, "setVideoFeatureStrings:", objc_msgSend(a4, "videoFeatureStrings"));
  objc_msgSend(a3, "setVideoFeatureStringsFixedPosition:", objc_msgSend(a4, "videoFeatureStringsFixedPosition"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v28 = v7;
      __int16 v29 = 2080;
      v30 = "+[VCMediaNegotiatorStreamGroupU1Configuration updateCameraU1Config:cameraConfiguration:]";
      __int16 v31 = 1024;
      int v32 = 147;
      __int16 v33 = 2112;
      uint64_t v34 = [a4 videoFeatureStrings];
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d u1Config.videoFeatureStrings=%@", buf, 0x26u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [a4 videoFeatureStringsFixedPosition];
      *(_DWORD *)buf = 136315906;
      uint64_t v28 = v9;
      __int16 v29 = 2080;
      v30 = "+[VCMediaNegotiatorStreamGroupU1Configuration updateCameraU1Config:cameraConfiguration:]";
      __int16 v31 = 1024;
      int v32 = 148;
      __int16 v33 = 2112;
      uint64_t v34 = v11;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d u1Config.videoFeatureStringsFixedPosition=%@", buf, 0x26u);
    }
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorStreamGroupU1Configuration updateCameraU1Config:cameraConfiguration:]();
      }
    }
    goto LABEL_26;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorStreamGroupU1Configuration updateCameraU1Config:cameraConfiguration:]();
      }
    }
LABEL_26:
    v14 = 0;
    goto LABEL_19;
  }
  v14 = v13;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v15 = (void *)[v6 supportedPayloads];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [*(id *)(*((void *)&v23 + 1) + 8 * i) unsignedIntValue];
        if (v20 != 126)
        {
          int v21 = v20;
          objc_msgSend(v12, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v20));
          objc_msgSend(v14, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", VCVideoParamaterSets_DefaultSupportedSets(v21)));
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v22 count:16];
    }
    while (v17);
  }
  [a3 setVideoPayloads:v12];
  [a3 setVideoParameterSet:v14];
LABEL_19:
}

+ (BOOL)updateVideoPayloadsAndParametersForU1Config:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorStreamGroupU1Configuration updateVideoPayloadsAndParametersForU1Config:]();
      }
    }
    goto LABEL_18;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorStreamGroupU1Configuration updateVideoPayloadsAndParametersForU1Config:]();
      }
    }
LABEL_18:
    int v6 = 0;
    BOOL v13 = 0;
    goto LABEL_11;
  }
  int v6 = v5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "videoRuleCollections"), "supportedPayloads");
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) unsignedIntValue];
        objc_msgSend(v4, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12));
        objc_msgSend(v6, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", VCVideoParamaterSets_DefaultSupportedSets(v12)));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v9);
  }
  [a3 setVideoPayloads:v4];
  [a3 setVideoParameterSet:v6];
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

+ (void)updateScreenU1Config:(id)a3 screenConfiguration:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [a3 setScreenPixelCount:5603328];
  id v7 = +[VCVideoRuleCollections newU1VideoRuleCollections];
  if (v7)
  {
    [a3 setVideoRuleCollections:v7];
    objc_msgSend(a3, "setVideoFeatureStrings:", objc_msgSend(a4, "videoFeatureStrings"));
    if ([a3 videoFeatureStrings])
    {
      objc_msgSend(a3, "setVideoFeatureStringsFixedPosition:", objc_msgSend(a4, "videoFeatureStringsFixedPosition"));
      if ([a3 videoFeatureStringsFixedPosition])
      {
        if (([a1 updateVideoPayloadsAndParametersForU1Config:a3] & 1) == 0
          && (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            +[VCMediaNegotiatorStreamGroupU1Configuration updateScreenU1Config:screenConfiguration:]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[VCMediaNegotiatorStreamGroupU1Configuration updateScreenU1Config:screenConfiguration:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorStreamGroupU1Configuration updateScreenU1Config:screenConfiguration:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      BOOL v13 = "+[VCMediaNegotiatorStreamGroupU1Configuration updateScreenU1Config:screenConfiguration:]";
      __int16 v14 = 1024;
      int v15 = 193;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating screen settings, as the local device does not support screen", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

+ (void)updateFaceTextureU1Config:(id)a3 faceTextureConfiguration:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a4 videoRuleCollections];
  if (v7)
  {
    [a3 setVideoRuleCollections:v7];
    objc_msgSend(a3, "setVideoFeatureStringsFixedPosition:", objc_msgSend(a4, "videoFeatureStringsFixedPosition"));
    if ([a3 videoFeatureStringsFixedPosition])
    {
      if (([a1 updateVideoPayloadsAndParametersForU1Config:a3] & 1) == 0
        && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[VCMediaNegotiatorStreamGroupU1Configuration updateFaceTextureU1Config:faceTextureConfiguration:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorStreamGroupU1Configuration updateFaceTextureU1Config:faceTextureConfiguration:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      BOOL v13 = "+[VCMediaNegotiatorStreamGroupU1Configuration updateFaceTextureU1Config:faceTextureConfiguration:]";
      __int16 v14 = 1024;
      int v15 = 212;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating face texture settings, as the local device does not support face texture", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

+ (void)updateBodyDataU1Config:(id)a3 bodyDataConfiguration:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a4 videoRuleCollections];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v23 = v15;
        __int16 v24 = 2080;
        long long v25 = "+[VCMediaNegotiatorStreamGroupU1Configuration updateBodyDataU1Config:bodyDataConfiguration:]";
        __int16 v26 = 1024;
        int v27 = 229;
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating body data settings, as the local device does not support body data", buf, 0x1Cu);
      }
    }
    goto LABEL_18;
  }
  int v6 = (void *)v5;
  [a3 setVideoRuleCollections:v5];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorStreamGroupU1Configuration updateBodyDataU1Config:bodyDataConfiguration:]();
      }
    }
LABEL_18:
    uint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v8 = v7;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = (void *)[v6 supportedPayloads];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v18 + 1) + 8 * v13) unsignedIntValue];
        objc_msgSend(v8, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v14));
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v17 count:16];
    }
    while (v11);
  }
  [a3 setVideoPayloads:v8];
LABEL_11:
}

- (id)initStreamGroupU1ConfigForGroupId:(unsigned int)a3 withLocalConfig:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unsigned int v19 = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v21 = v7;
      __int16 v22 = 2080;
      uint64_t v23 = "-[VCMediaNegotiatorStreamGroupU1Configuration initStreamGroupU1ConfigForGroupId:withLocalConfig:]";
      __int16 v24 = 1024;
      int v25 = 253;
      __int16 v26 = 2080;
      int v27 = FourccToCStr(v5);
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Initialize stream group U1 config for groupID=%s", buf, 0x26u);
    }
  }
  if (!+[VCMediaNegotiatorStreamGroupU1Configuration ssrcForStreamGroup:v5 localConfig:a4 ssrc:&v19])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = FourccToCStr(v5);
        *(_DWORD *)buf = 136315906;
        uint64_t v21 = v14;
        __int16 v22 = 2080;
        uint64_t v23 = "-[VCMediaNegotiatorStreamGroupU1Configuration initStreamGroupU1ConfigForGroupId:withLocalConfig:]";
        __int16 v24 = 1024;
        int v25 = 256;
        __int16 v26 = 2080;
        int v27 = v16;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d One to one config not supported for groupID=%s", buf, 0x26u);
      }
    }

    return 0;
  }
  uint64_t v9 = [(VCMediaNegotiatorStreamGroupU1Configuration *)self initWithSSRC:v19];
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      long long v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiatorStreamGroupU1Configuration initStreamGroupU1ConfigForGroupId:withLocalConfig:](v17, v5, v18);
      }
    }
    return 0;
  }
  uint64_t v10 = v9;
  uint64_t v11 = VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID(v5);
  uint64_t v12 = [a4 mediaConfigurationForMediaType:v11];
  if ((int)v5 <= 1835623281)
  {
    switch(v5)
    {
      case 0x62646174:
        +[VCMediaNegotiatorStreamGroupU1Configuration updateBodyDataU1Config:v10 bodyDataConfiguration:v12];
        break;
      case 0x63616D65:
        +[VCMediaNegotiatorStreamGroupU1Configuration updateCameraU1Config:v10 cameraConfiguration:v12];
        break;
      case 0x66747874:
        +[VCMediaNegotiatorStreamGroupU1Configuration updateFaceTextureU1Config:v10 faceTextureConfiguration:v12];
        break;
    }
    goto LABEL_18;
  }
  switch(v5)
  {
    case 0x73797361:
      goto LABEL_14;
    case 0x73637265:
      +[VCMediaNegotiatorStreamGroupU1Configuration updateScreenU1Config:v10 screenConfiguration:v12];
      break;
    case 0x6D696372:
LABEL_14:
      [(VCMediaNegotiatorStreamGroupU1Configuration *)v10 updateWithAudioConfiguration:v12 mediaType:v11];
      break;
  }
LABEL_18:
  v10->_supportedCipherSuites = (NSOrderedSet *)+[VCEncryptionRules supportedCipherSuitesForStreamGroupID:v5 isOneToOne:1];
  v10->_supportedDirection = 3;
  return v10;
}

+ (id)negotiatedAudioSettingsForGroupID:(unsigned int)a3 localU1Config:(id)a4 remoteU1Config:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  if (a3 == 1937339233)
  {
    id v8 = +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedSystemAudioSettingsBetweenLocalU1Config:a4 remoteU1Config:a5];
  }
  else
  {
    if (a3 != 1835623282)
    {
      uint64_t v9 = 0;
      goto LABEL_7;
    }
    id v8 = +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedMicrophoneSettingsBetweenLocalU1Config:a4 remoteU1Config:a5];
  }
  uint64_t v9 = v8;
LABEL_7:
  objc_msgSend(v9, "setCipherSuite:", objc_msgSend(a1, "negotiateU1CipherSuiteForStreamGroupID:remoteSupportedCipherSuites:", v6, objc_msgSend(a5, "supportedCipherSuites")));
  return v9;
}

+ (id)negotiatedSystemAudioSettingsBetweenLocalU1Config:(id)a3 remoteU1Config:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v6 = +[VCHardwareSettings supportsDedicatedSystemAudioStream];
  uint64_t v7 = +[VCAudioRuleCollection getForcedPayload];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315650;
      uint64_t v18 = v8;
      __int16 v19 = 2080;
      long long v20 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiatedSystemAudioSettingsBetweenLocalU1Config:remoteU1Config:]";
      __int16 v21 = 1024;
      int v22 = 303;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stream group found for system audio.", (uint8_t *)&v17, 0x1Cu);
    }
  }
  uint64_t v10 = objc_alloc_init(VCMediaNegotiatorResultsAudio);
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedSystemAudioSettingsBetweenLocalU1Config:remoteU1Config:]();
      }
    }
    goto LABEL_31;
  }
  if ([a4 supportedDirection] == 2) {
    a4 = 0;
  }
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315650;
        uint64_t v18 = v12;
        __int16 v19 = 2080;
        long long v20 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiatedSystemAudioSettingsBetweenLocalU1Config:remoteU1Config:]";
        __int16 v21 = 1024;
        int v22 = 316;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stream group has no remote U1 config for system audio. Check for standalone system audio support.", (uint8_t *)&v17, 0x1Cu);
      }
    }
    if (v6)
    {
      uint64_t v11 = 0;
      goto LABEL_14;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedSystemAudioSettingsBetweenLocalU1Config:remoteU1Config:]();
      }
    }
LABEL_31:

    uint64_t v10 = 0;
    return v10;
  }
  uint64_t v11 = [a4 ssrc];
LABEL_14:
  [(VCMediaNegotiatorResultsAudio *)v10 setRemoteSSRC:v11];
  [(VCMediaNegotiatorResultsAudio *)v10 setAudioUnitModel:65792];
  [(VCMediaNegotiatorResultsAudio *)v10 setUseSBR:1];
  if ([a3 allowAudioRecording]) {
    uint64_t v14 = [a4 allowAudioRecording];
  }
  else {
    uint64_t v14 = 0;
  }
  [(VCMediaNegotiatorResultsAudio *)v10 setAllowRecording:v14];
  [(VCMediaNegotiatorResultsAudio *)v10 setAllowSwitching:v7 == 128];
  if (v7 == 128)
  {
    +[VCMediaNegotiatorBase setupNegotiatedAudioPayloads:negotiatedAudioSettings:primaryPayloadPreference:](VCMediaNegotiatorBase, "setupNegotiatedAudioPayloads:negotiatedAudioSettings:primaryPayloadPreference:", [a4 audioPayloads], v10, objc_msgSend(a3, "payloadPreference"));
    if ([(VCMediaNegotiatorResultsAudio *)v10 primaryPayload] == 128 && v6) {
      +[VCMediaNegotiatorBase setupNegotiatedAudioPayloads:negotiatedAudioSettings:primaryPayloadPreference:](VCMediaNegotiatorBase, "setupNegotiatedAudioPayloads:negotiatedAudioSettings:primaryPayloadPreference:", [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3DC76B0], v10, &unk_1F3DC76C8);
    }
  }
  else
  {
    [(VCMediaNegotiatorResultsAudio *)v10 setPrimaryPayload:v7];
  }
  return v10;
}

+ (int64_t)negotiateU1CipherSuiteForStreamGroupID:(unsigned int)a3 remoteSupportedCipherSuites:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = +[VCEncryptionRules supportedCipherSuitesForStreamGroupID:*(void *)&a3 isOneToOne:1];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([a4 containsObject:v11])
        {
          uint64_t v14 = [v11 integerValue];
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v15 = VRTraceErrorLogLevelToCSTR();
            uint64_t v16 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v18 = 136316418;
              uint64_t v19 = v15;
              __int16 v20 = 2080;
              __int16 v21 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiateU1CipherSuiteForStreamGroupID:remoteSupportedCipherSuites:]";
              __int16 v22 = 1024;
              int v23 = 352;
              __int16 v24 = 2080;
              int v25 = (void *)VCMediaStreamConfig_CipherSuiteDescription(v14);
              __int16 v26 = 2048;
              uint64_t v27 = v14;
              __int16 v28 = 2080;
              __int16 v29 = FourccToCStr(a3);
              _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Negotiating cipherSuite=%s [%ld] for streamGroupID=%s", (uint8_t *)&v18, 0x3Au);
            }
          }
          return v14;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v30 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315906;
      uint64_t v19 = v12;
      __int16 v20 = 2080;
      __int16 v21 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiateU1CipherSuiteForStreamGroupID:remoteSupportedCipherSuites:]";
      __int16 v22 = 1024;
      int v23 = 356;
      __int16 v24 = 2080;
      int v25 = FourccToCStr(a3);
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Falling back to VCMediaStreamCipherSuiteCipherAES128AuthNoneRCCM3 for streamGroupID=%s", (uint8_t *)&v18, 0x26u);
    }
  }
  return 3;
}

+ (id)negotiatedMicrophoneSettingsBetweenLocalU1Config:(id)a3 remoteU1Config:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = +[VCAudioRuleCollection getForcedPayload];
  uint64_t v7 = objc_alloc_init(VCMediaNegotiatorResultsAudio);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedMicrophoneSettingsBetweenLocalU1Config:remoteU1Config:]();
      }
    }
    goto LABEL_17;
  }
  if (!a3 || !a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v13 = 136316162;
        uint64_t v14 = v11;
        __int16 v15 = 2080;
        uint64_t v16 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiatedMicrophoneSettingsBetweenLocalU1Config:remoteU1Config:]";
        __int16 v17 = 1024;
        int v18 = 367;
        __int16 v19 = 1024;
        BOOL v20 = a3 == 0;
        __int16 v21 = 1024;
        BOOL v22 = a4 == 0;
        _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to negotiate microphone settings as either local u1Config isNil=%{BOOL}d or remote u1Config isNil=%{BOOL}d", (uint8_t *)&v13, 0x28u);
      }
    }
LABEL_17:

    uint64_t v7 = 0;
    return v7;
  }
  -[VCMediaNegotiatorResultsAudio setRemoteSSRC:](v7, "setRemoteSSRC:", [a4 ssrc]);
  [(VCMediaNegotiatorResultsAudio *)v7 setAudioUnitModel:65792];
  [(VCMediaNegotiatorResultsAudio *)v7 setUseSBR:1];
  if ([a3 allowAudioRecording]) {
    uint64_t v8 = [a4 allowAudioRecording];
  }
  else {
    uint64_t v8 = 0;
  }
  [(VCMediaNegotiatorResultsAudio *)v7 setAllowRecording:v8];
  [(VCMediaNegotiatorResultsAudio *)v7 setAllowSwitching:v6 == 128];
  if (v6 == 128)
  {
    id v9 = +[VCMediaNegotiatorBase newNegotiatedAudioPayloadsWithLocalPayloads:remotePayloads:](VCMediaNegotiatorBase, "newNegotiatedAudioPayloadsWithLocalPayloads:remotePayloads:", [a3 audioPayloads], objc_msgSend(a4, "audioPayloads"));
    +[VCMediaNegotiatorBase setupNegotiatedAudioPayloads:negotiatedAudioSettings:primaryPayloadPreference:](VCMediaNegotiatorBase, "setupNegotiatedAudioPayloads:negotiatedAudioSettings:primaryPayloadPreference:", v9, v7, [a3 payloadPreference]);
  }
  else
  {
    [(VCMediaNegotiatorResultsAudio *)v7 setPrimaryPayload:v6];
  }
  return v7;
}

+ (id)negotiatedVideoSettingsForGroupID:(unsigned int)a3 localU1Config:(id)a4 remoteU1Config:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  if (a3 == 1935897189) {
    id v8 = +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedScreenSettingsBetweenLocalU1Config:a4 remoteU1Config:a5];
  }
  else {
    id v8 = +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedVideoSettingsBetweenLocalU1Config:a4 remoteU1Config:a5 streamGroupID:*(void *)&a3];
  }
  id v9 = v8;
  objc_msgSend(v8, "setCipherSuite:", objc_msgSend(a1, "negotiateU1CipherSuiteForStreamGroupID:remoteSupportedCipherSuites:", v6, objc_msgSend(a5, "supportedCipherSuites")));
  return v9;
}

+ (id)negotiatedVideoSettingsBetweenLocalU1Config:(id)a3 remoteU1Config:(id)a4 streamGroupID:(unsigned int)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc_init(VCMediaNegotiatorResultsVideo);
  id v9 = v8;
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedVideoSettingsBetweenLocalU1Config:remoteU1Config:streamGroupID:](v11, a5, v12);
      }
    }
    goto LABEL_6;
  }
  [(VCMediaNegotiatorResultsVideo *)v8 setIsSupported:0];
  if (!a3 || !a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        __int16 v15 = FourccToCStr(a5);
        uint64_t v16 = @"NO";
        int v20 = 136316418;
        uint64_t v21 = v13;
        uint64_t v23 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiatedVideoSettingsBetweenLocalU1Config:remoteU1Config:streamGroupID:]";
        __int16 v24 = 1024;
        int v25 = 411;
        if (a3) {
          __int16 v17 = @"NO";
        }
        else {
          __int16 v17 = @"YES";
        }
        __int16 v22 = 2080;
        if (!a4) {
          uint64_t v16 = @"YES";
        }
        __int16 v26 = 2080;
        uint64_t v27 = v15;
        __int16 v28 = 2112;
        __int16 v29 = v17;
        __int16 v30 = 2112;
        long long v31 = v16;
        _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to negotiate streamGroupID=%s settings as either local u1Config isNil=%@ or remote u1Config isNil=%@", (uint8_t *)&v20, 0x3Au);
      }
    }
    goto LABEL_6;
  }
  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "videoRuleCollections"), "rules"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      __int16 v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315906;
        uint64_t v21 = v18;
        __int16 v22 = 2080;
        uint64_t v23 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiatedVideoSettingsBetweenLocalU1Config:remoteU1Config:streamGroupID:]";
        __int16 v24 = 1024;
        int v25 = 412;
        __int16 v26 = 2080;
        uint64_t v27 = FourccToCStr(a5);
        _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating video settings, as the local device does not support streamGroupID=%s", (uint8_t *)&v20, 0x26u);
      }
    }
    goto LABEL_6;
  }
  if (!+[VCMediaNegotiatorStreamGroupU1Configuration updateCommonNegotiatedVideoSettings:v9 localU1Config:a3 remoteU1Config:a4])
  {
LABEL_6:

    id v9 = 0;
  }
  return v9;
}

+ (id)negotiatedScreenSettingsBetweenLocalU1Config:(id)a3 remoteU1Config:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_alloc_init(VCMediaNegotiatorResultsVideo);
  uint64_t v7 = v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedScreenSettingsBetweenLocalU1Config:remoteU1Config:]();
      }
    }
    goto LABEL_10;
  }
  [(VCMediaNegotiatorResultsVideo *)v6 setIsSupported:0];
  if (!a3 || !a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        __int16 v15 = @"NO";
        int v19 = 136316162;
        uint64_t v20 = v13;
        __int16 v21 = 2080;
        __int16 v22 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiatedScreenSettingsBetweenLocalU1Config:remoteU1Config:]";
        if (a3) {
          uint64_t v16 = @"NO";
        }
        else {
          uint64_t v16 = @"YES";
        }
        __int16 v23 = 1024;
        int v24 = 429;
        if (!a4) {
          __int16 v15 = @"YES";
        }
        __int16 v25 = 2112;
        __int16 v26 = v16;
        __int16 v27 = 2112;
        __int16 v28 = v15;
        _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to negotiate screen settings as either local u1Config isNil=%@ or remote u1Config isNil=%@", (uint8_t *)&v19, 0x30u);
      }
    }
    goto LABEL_10;
  }
  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "videoRuleCollections"), "rules"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315650;
        uint64_t v20 = v17;
        __int16 v21 = 2080;
        __int16 v22 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiatedScreenSettingsBetweenLocalU1Config:remoteU1Config:]";
        __int16 v23 = 1024;
        int v24 = 430;
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating screen settings, as the local device does not support screen", (uint8_t *)&v19, 0x1Cu);
      }
    }
    goto LABEL_10;
  }
  +[VideoUtil computeResolutionForMainDisplayWithMaxScreenPixelCount:](VideoUtil, "computeResolutionForMainDisplayWithMaxScreenPixelCount:", [a4 screenPixelCount]);
  if ((int)v8) {
    BOOL v10 = (int)v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorStreamGroupU1Configuration negotiatedScreenSettingsBetweenLocalU1Config:remoteU1Config:]();
      }
    }
    goto LABEL_10;
  }
  double v11 = v9;
  [(VCMediaNegotiatorResultsVideo *)v7 setCustomVideoWidth:v8];
  [(VCMediaNegotiatorResultsVideo *)v7 setCustomVideoHeight:v11];
  [(VCMediaNegotiatorResultsVideo *)v7 setIsRTCPFBEnabled:0];
  [(VCMediaNegotiatorResultsVideo *)v7 addPixelFormatSet:&unk_1F3DC4350];
  if (!+[VCMediaNegotiatorStreamGroupU1Configuration updateCommonNegotiatedVideoSettings:v7 localU1Config:a3 remoteU1Config:a4])
  {
LABEL_10:

    uint64_t v7 = 0;
  }
  return v7;
}

+ (void)negotiateFeatureStrings:(id)a3 localU1Config:(id)a4 remoteU1Config:(id)a5
{
  id v6 = a4;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!_os_feature_enabled_impl()
    || ![v6 videoFeatureStringsFixedPosition]
    || ![a5 videoFeatureStringsFixedPosition])
  {
    objc_msgSend(a3, "setFeatureStrings:", objc_msgSend(a5, "videoFeatureStrings"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      int v24 = *MEMORY[0x1E4F47A50];
      int v22 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v38 = v23;
      __int16 v39 = 2080;
      v40 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiateFeatureStrings:localU1Config:remoteU1Config:]";
      __int16 v41 = 1024;
      int v42 = 478;
      __int16 v43 = 1024;
      int v44 = _os_feature_enabled_impl();
      __int16 v45 = 2112;
      uint64_t v46 = [v6 videoFeatureStringsFixedPosition];
      id v6 = a4;
      __int16 v47 = 2112;
      uint64_t v48 = [a5 videoFeatureStringsFixedPosition];
      _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [FLS] Fallback to legacy. feature flag VideoCodecFeatureBitfield=%d, localFLSFixedPosition=%@, remoteFLSFixedPosition=%@", buf, 0x36u);
    }
    int v22 = 0;
    goto LABEL_30;
  }
  uint64_t v32 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obuint64_t j = (id)[v6 videoFeatureStringsFixedPosition];
  uint64_t v35 = [obj countByEnumeratingWithState:&v57 objects:v56 count:16];
  if (v35)
  {
    uint64_t v8 = *(void *)v58;
    uint64_t v30 = *(void *)v58;
    id v31 = a5;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v58 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend((id)objc_msgSend(v6, "videoFeatureStringsFixedPosition"), "objectForKey:", v10);
        uint64_t v36 = v10;
        uint64_t v12 = objc_msgSend((id)objc_msgSend(a5, "videoFeatureStringsFixedPosition"), "objectForKey:", v10);
        if (v11) {
          BOOL v13 = v12 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13)
        {
          uint64_t v14 = v12;
          id v15 = (id)VCPCreateNegotiatedFLS();
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          uint64_t v16 = [&unk_1F3DC76E0 countByEnumeratingWithState:&v52 objects:v51 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v53;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v53 != v18) {
                  objc_enumerationMutation(&unk_1F3DC76E0);
                }
                id v20 = +[VCVideoFeatureListStringHelper extractKeyAndValueStringFromFeatureString:v14 prefix:*(void *)(*((void *)&v52 + 1) + 8 * j)];
                if (v20)
                {
                  __int16 v21 = (void *)[v15 stringByAppendingFormat:@"%@;", v20];

                  id v15 = v21;
                }
              }
              uint64_t v17 = [&unk_1F3DC76E0 countByEnumeratingWithState:&v52 objects:v51 count:16];
            }
            while (v17);
          }
          [v32 setObject:v15 forKeyedSubscript:v36];

          uint64_t v8 = v30;
          a5 = v31;
          id v6 = a4;
        }
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v57 objects:v56 count:16];
    }
    while (v35);
  }
  [a3 setFeatureStrings:v32];
  int v22 = 1;
LABEL_30:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    __int16 v26 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [a3 featureStrings];
      if (v22)
      {
        uint64_t v28 = [v6 videoFeatureStringsFixedPosition];
        uint64_t v29 = [a5 videoFeatureStringsFixedPosition];
      }
      else
      {
        uint64_t v28 = [v6 videoFeatureStrings];
        uint64_t v29 = [a5 videoFeatureStrings];
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v38 = v25;
      __int16 v39 = 2080;
      v40 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiateFeatureStrings:localU1Config:remoteU1Config:]";
      __int16 v41 = 1024;
      int v42 = 482;
      __int16 v43 = 1024;
      int v44 = v22;
      __int16 v45 = 2112;
      uint64_t v46 = v27;
      __int16 v47 = 2112;
      uint64_t v48 = v28;
      __int16 v49 = 2112;
      uint64_t v50 = v29;
      _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [FLS] useFLSFixedPosition=%d. negotiatedSettings.videoFeatureStrings=%@. Local=%@, Remote=%@", buf, 0x40u);
    }
  }
}

+ (BOOL)updateCommonNegotiatedVideoSettings:(id)a3 localU1Config:(id)a4 remoteU1Config:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a1, "negotiateFeatureStrings:localU1Config:remoteU1Config:");
  objc_msgSend(a3, "setRemoteSSRC:", objc_msgSend(a5, "ssrc"));
  unsigned __int8 v7 = 1;
  [a3 setTilesPerFrame:1];
  [a3 setLtrpEnabled:1];
  uint64_t v8 = (void *)[a5 videoParameterSet];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __112__VCMediaNegotiatorStreamGroupU1Configuration_updateCommonNegotiatedVideoSettings_localU1Config_remoteU1Config___block_invoke;
  v20[3] = &unk_1E6DB6668;
  v20[4] = a5;
  v20[5] = a3;
  id v9 = a3;
  [v8 enumerateObjectsUsingBlock:v20];
  id v10 = a5;
  obuint64_t j = (id)[a5 payloadPreference];
  while (2)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v21, 16, obj);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(obj);
        }
        unsigned int v15 = v7;
        if (+[VCMediaNegotiatorBase selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCollection:remoteVideoRuleCollection:](VCMediaNegotiatorBase, "selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCollection:remoteVideoRuleCollection:", 1, [*(id *)(*((void *)&v22 + 1) + 8 * v14) unsignedIntValue], v7, v9, objc_msgSend(a4, "videoRuleCollections"), objc_msgSend(v10, "videoRuleCollections")))
        {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [obj countByEnumeratingWithState:&v22 objects:v21 count:16];
          if (v12) {
            goto LABEL_4;
          }
          goto LABEL_13;
        }
      }
      ++v7;
      if (v15 < 2) {
        continue;
      }
      BOOL v16 = 1;
      [v9 setIsSupported:1];
    }
    else
    {
LABEL_13:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[VCMediaNegotiatorStreamGroupU1Configuration updateCommonNegotiatedVideoSettings:localU1Config:remoteU1Config:]();
        }
      }
      return 0;
    }
    return v16;
  }
}

uint64_t __112__VCMediaNegotiatorStreamGroupU1Configuration_updateCommonNegotiatedVideoSettings_localU1Config_remoteU1Config___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "videoPayloads"), "objectAtIndex:", a3), "unsignedIntValue");
  id v6 = *(void **)(a1 + 40);

  return [v6 addParameterSet:a2 payload:v5];
}

+ (BOOL)ssrcForStreamGroup:(unsigned int)a3 localConfig:(id)a4 ssrc:(unsigned int *)a5
{
  BOOL result = 0;
  if ((int)a3 > 1835623281)
  {
    if (a3 != 1835623282 && a3 != 1937339233)
    {
      int v6 = 1935897189;
LABEL_8:
      if (a3 != v6) {
        return result;
      }
    }
  }
  else if (a3 != 1650745716 && a3 != 1667329381)
  {
    int v6 = 1718909044;
    goto LABEL_8;
  }
  *a5 = objc_msgSend((id)objc_msgSend(a4, "mediaConfigurationForMediaType:", VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID(a3)), "ssrc");
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 setSupportedDirection:self->_supportedDirection];
    [v5 setSsrc:self->_ssrc];
    [v5 setAllowAudioRecording:self->_allowAudioRecording];
    [v5 setScreenPixelCount:self->_screenPixelCount];
    [v5 setSupportedCipherSuites:self->_supportedCipherSuites];
    [v5 setAudioPayloads:self->_audioPayloads];
    [v5 setPayloadPreference:self->_payloadPreference];
    [v5 setVideoPayloads:self->_videoPayloads];
    [v5 setVideoParameterSet:self->_videoParameterSet];
    [v5 setVideoFeatureStrings:self->_videoFeatureStrings];
    [v5 setVideoFeatureStringsFixedPosition:self->_videoFeatureStringsFixedPosition];
    [v5 setVideoRuleCollections:self->_videoRuleCollections];
  }
  return v5;
}

- (unsigned)supportedDirection
{
  return self->_supportedDirection;
}

- (void)setSupportedDirection:(unsigned __int8)a3
{
  self->_supportedDirection = a3;
}

- (unsigned)ssrc
{
  return self->_ssrc;
}

- (void)setSsrc:(unsigned int)a3
{
  self->_ssrc = a3;
}

- (BOOL)allowAudioRecording
{
  return self->_allowAudioRecording;
}

- (void)setAllowAudioRecording:(BOOL)a3
{
  self->_allowAudioRecording = a3;
}

- (NSSet)audioPayloads
{
  return self->_audioPayloads;
}

- (void)setAudioPayloads:(id)a3
{
}

- (NSOrderedSet)supportedCipherSuites
{
  return self->_supportedCipherSuites;
}

- (void)setSupportedCipherSuites:(id)a3
{
}

- (NSArray)payloadPreference
{
  return self->_payloadPreference;
}

- (void)setPayloadPreference:(id)a3
{
}

- (NSArray)videoPayloads
{
  return self->_videoPayloads;
}

- (void)setVideoPayloads:(id)a3
{
}

- (NSArray)videoParameterSet
{
  return self->_videoParameterSet;
}

- (void)setVideoParameterSet:(id)a3
{
}

- (VCVideoRuleCollections)videoRuleCollections
{
  return self->_videoRuleCollections;
}

- (void)setVideoRuleCollections:(id)a3
{
}

- (NSDictionary)videoFeatureStrings
{
  return self->_videoFeatureStrings;
}

- (void)setVideoFeatureStrings:(id)a3
{
}

- (NSDictionary)videoFeatureStringsFixedPosition
{
  return self->_videoFeatureStringsFixedPosition;
}

- (void)setVideoFeatureStringsFixedPosition:(id)a3
{
}

- (unsigned)screenPixelCount
{
  return self->_screenPixelCount;
}

- (void)setScreenPixelCount:(unsigned int)a3
{
  self->_screenPixelCount = a3;
}

+ (void)updateCameraU1Config:cameraConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate videoPayloads array", v2, v3, v4, v5, v6);
}

+ (void)updateCameraU1Config:cameraConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate videoParameterSet array", v2, v3, v4, v5, v6);
}

+ (void)updateVideoPayloadsAndParametersForU1Config:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate videoPayloads array", v2, v3, v4, v5, v6);
}

+ (void)updateVideoPayloadsAndParametersForU1Config:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate videoParameterSet array", v2, v3, v4, v5, v6);
}

+ (void)updateScreenU1Config:screenConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Screen features not successfully generated", v2, v3, v4, v5, v6);
}

+ (void)updateScreenU1Config:screenConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Screen features with fixed position not successfully generated", v2, v3, v4, v5, v6);
}

+ (void)updateScreenU1Config:screenConfiguration:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, (uint64_t)v0, " [%s] %s:%d Failed to update video payloads and parameters for u1Config=%@", v1);
}

+ (void)updateFaceTextureU1Config:faceTextureConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Face texture features with fixed position not successfully generated", v2, v3, v4, v5, v6);
}

+ (void)updateFaceTextureU1Config:faceTextureConfiguration:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, (uint64_t)v0, " [%s] %s:%d Failed to update video payloads and parameters for u1Config=%@", v1);
}

+ (void)updateBodyDataU1Config:bodyDataConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate videoPayloads array", v2, v3, v4, v5, v6);
}

- (void)initStreamGroupU1ConfigForGroupId:(NSObject *)a3 withLocalConfig:.cold.1(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  FourccToCStr(a2);
  OUTLINED_FUNCTION_7_1();
  uint64_t v8 = "-[VCMediaNegotiatorStreamGroupU1Configuration initStreamGroupU1ConfigForGroupId:withLocalConfig:]";
  __int16 v9 = 1024;
  int v10 = 259;
  __int16 v11 = v4;
  uint64_t v12 = v5;
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, a3, v6, " [%s] %s:%d Failed to init U1 config for groupID=%s", v7);
}

+ (void)negotiatedSystemAudioSettingsBetweenLocalU1Config:remoteU1Config:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize negotiated audio settings", v2, v3, v4, v5, v6);
}

+ (void)negotiatedSystemAudioSettingsBetweenLocalU1Config:remoteU1Config:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stream group has no U1 settings for system audio and does not support standalone system audio", v2, v3, v4, v5, v6);
}

+ (void)negotiatedMicrophoneSettingsBetweenLocalU1Config:remoteU1Config:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize negotiated audio settings", v2, v3, v4, v5, v6);
}

+ (void)negotiatedVideoSettingsBetweenLocalU1Config:(uint64_t)a1 remoteU1Config:(int)a2 streamGroupID:(NSObject *)a3 .cold.1(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  FourccToCStr(a2);
  OUTLINED_FUNCTION_7_1();
  uint64_t v8 = "+[VCMediaNegotiatorStreamGroupU1Configuration negotiatedVideoSettingsBetweenLocalU1Config:remoteU1Config:streamGroupID:]";
  __int16 v9 = 1024;
  int v10 = 409;
  __int16 v11 = v4;
  uint64_t v12 = v5;
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, a3, v6, " [%s] %s:%d Failed to initialize negotiated video settings streamGroupID=%s", v7);
}

+ (void)negotiatedScreenSettingsBetweenLocalU1Config:remoteU1Config:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize negotiated screen settings", v2, v3, v4, v5, v6);
}

+ (void)negotiatedScreenSettingsBetweenLocalU1Config:remoteU1Config:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Screen U1 settings failed to calculate resolution", v2, v3, v4, v5, v6);
}

+ (void)updateCommonNegotiatedVideoSettings:localU1Config:remoteU1Config:.cold.1()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  int v4 = 507;
  __int16 v5 = v0;
  int v6 = 1;
  __int16 v7 = v0;
  int v8 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to find video rule for transportType=%d encodingType=%d", v3, 0x28u);
}

@end