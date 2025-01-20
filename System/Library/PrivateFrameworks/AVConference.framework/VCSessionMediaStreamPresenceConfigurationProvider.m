@interface VCSessionMediaStreamPresenceConfigurationProvider
+ (id)bdatGroupDisabled;
+ (id)defaultOneToOneTierTable:(unsigned int)a3 redundancyEnabled:(BOOL)a4;
+ (id)fdatGroupDisabled;
+ (id)foregroundCameraOneToOneTierTable:(unsigned int)a3 redundancyEnabled:(BOOL)a4;
+ (id)ftxtGroupDisabled;
+ (id)oneToOneTierTableForStreamGroupID:(unsigned int)a3 splitType:(unsigned int)a4 redundancyEnabled:(BOOL)a5;
+ (id)publicSessionConfigurationForType:(unsigned int)a3;
+ (id)replaceTag:(id)a3;
+ (id)resourceNameForConfigurationType:(unsigned int)a3;
+ (id)screenGroupDisabled;
+ (id)screenStreamBaseTierFramerate;
+ (id)sessionConfigurationForType:(unsigned int)a3;
+ (id)siriGroupDisabled;
+ (id)sysaGroupDisabled;
+ (unsigned)defaultRemainingBitrateSplit:(unsigned int)a3;
+ (unsigned)foregroundCameraRemainingBitrateSplit:(unsigned int)a3;
+ (unsigned)readUint32WithPList:(id)a3 key:(id)a4 defaultValue:(unsigned int)a5;
+ (unsigned)remainingBitrateSplitQualityIndexForStreamGroup:(unsigned int)a3 splitType:(unsigned int)a4;
+ (unsigned)streamSSRCForStreamGroupID:(unsigned int)a3 streamIndex:(int)a4;
- (BOOL)addPayload:(int)a3 audioStreamConfig:(id)a4 supportedAudioRules:(id)a5;
- (BOOL)checkEncoderSupportForCodecType:(int64_t)a3;
- (BOOL)checkEncoderSupportForConfig:(id)a3;
- (BOOL)setupAudioRedWithPlist:(id)a3 audioStreamConfig:(id)a4 supportedAudioRules:(id)a5;
- (BOOL)setupAudioRulesWithPList:(id)a3 audioStreamConfig:(id)a4 supportedAudioRules:(id)a5;
- (BOOL)setupAudioStreamGroupStreams:(id)a3 streamGroupConfig:(id)a4 supportedAudioRules:(id)a5 streamIDGenerator:(id)a6;
- (BOOL)setupRedFactorsWithPList:(id)a3 audioStreamConfig:(id)a4;
- (BOOL)setupVideoStreamGroupStreams:(id)a3 streamGroupConfig:(id)a4 streamIDGenerator:(id)a5;
- (NSSet)streamGroupConfigurations;
- (NSSet)streamInputConfigurations;
- (VCSessionMediaStreamPresenceConfigurationProvider)initWithConfigurationType:(unsigned int)a3 supportedAudioRules:(id)a4 streamIDGenerator:(id)a5;
- (id)defaultEndToEndStreamGroupConfigurationForStreamGroup:(unsigned int)a3;
- (id)getVideoCodecConfigFromStreamConfigPList:(id)a3;
- (id)newAudioMultiwayConfigWithPList:(id)a3 audioRules:(id)a4 maxIDSStreamIDCount:(unsigned int)a5 streamIDGenerator:(id)a6 ssrc:(unsigned int)a7;
- (id)newAudioStreamGroupStreamConfigWithPList:(id)a3 supportedAudioRules:(id)a4 maxIDSStreamIDCount:(unsigned int)a5 streamIDGenerator:(id)a6 ssrc:(unsigned int)a7 groupID:(unsigned int)a8;
- (id)newDataStreamInputConfigurationWithPList:(id)a3;
- (id)newStreamGroupConfigurationWithPList:(id)a3 supportedAudioRules:(id)a4 streamIDGenerator:(id)a5;
- (id)newStreamGroupConfigurationsWithSupportedAudioRules:(id)a3 streamIDGenerator:(id)a4;
- (id)newStreamGroupToStreamInputsMapping;
- (id)newStreamInputConfigurations;
- (id)newVideoMultiwayConfigWithPList:(id)a3 codecType:(int64_t)a4 streamIDGenerator:(id)a5 ssrc:(unsigned int)a6;
- (id)newVideoStreamGroupStreamConfigWithPList:(id)a3 streamIDGenerator:(id)a4 ssrc:(unsigned int)a5 groupID:(unsigned int)a6 shouldSkip:(BOOL *)a7;
- (id)newVideoStreamInputConfigurationWithPList:(id)a3;
- (int64_t)getVideoCodecFromStreamCodecPList:(id)a3;
- (unsigned)setParentStreamID:(unsigned __int16)a3 videoConfig:(id)a4;
- (void)dealloc;
- (void)newStreamGroupToStreamInputsMapping;
- (void)newStreamInputConfigurations;
- (void)updateStreamConfig:(id)a3 forPayload:(int)a4 networkPayload:(unsigned int)a5 groupID:(unsigned int)a6;
@end

@implementation VCSessionMediaStreamPresenceConfigurationProvider

+ (id)resourceNameForConfigurationType:(unsigned int)a3
{
  v3 = @"session_config_GFT";
  if (a3 != 2) {
    v3 = 0;
  }
  if (a3 == 1) {
    return @"session_config_presence";
  }
  else {
    return v3;
  }
}

+ (id)sessionConfigurationForType:(unsigned int)a3
{
  id v3 = +[VCSessionMediaStreamPresenceConfigurationProvider resourceNameForConfigurationType:](VCSessionMediaStreamPresenceConfigurationProvider, "resourceNameForConfigurationType:");
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionMediaStreamPresenceConfigurationProvider sessionConfigurationForType:]();
      }
    }
    return 0;
  }
  id result = (id)[MEMORY[0x1E4F28B50] plistForClass:objc_opt_class() withPath:v3 defaultOverride:@"sessionConfigPlist"];
  if (!result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionMediaStreamPresenceConfigurationProvider sessionConfigurationForType:]();
      }
    }
    return 0;
  }
  return result;
}

- (VCSessionMediaStreamPresenceConfigurationProvider)initWithConfigurationType:(unsigned int)a3 supportedAudioRules:(id)a4 streamIDGenerator:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VCSessionMediaStreamPresenceConfigurationProvider;
  v8 = [(VCSessionMediaStreamPresenceConfigurationProvider *)&v14 init];
  if (v8)
  {
    v9 = (NSDictionary *)+[VCSessionMediaStreamPresenceConfigurationProvider sessionConfigurationForType:v7];
    v8->_configuration = v9;
    if (v9)
    {
      uint64_t v10 = [(VCSessionMediaStreamPresenceConfigurationProvider *)v8 newStreamInputConfigurations];
      v8->_streamInputConfigurations = (NSSet *)v10;
      if (v10)
      {
        uint64_t v11 = [(VCSessionMediaStreamPresenceConfigurationProvider *)v8 newStreamGroupConfigurationsWithSupportedAudioRules:a4 streamIDGenerator:a5];
        v8->_streamGroupConfigurations = (NSSet *)v11;
        if (v11)
        {
          uint64_t v12 = [(VCSessionMediaStreamPresenceConfigurationProvider *)v8 newStreamGroupToStreamInputsMapping];
          v8->_streamGroupToStreamInputMapping = (NSDictionary *)v12;
          if (v12) {
            return v8;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionMediaStreamPresenceConfigurationProvider initWithConfigurationType:supportedAudioRules:streamIDGenerator:].cold.4();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider initWithConfigurationType:supportedAudioRules:streamIDGenerator:]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider initWithConfigurationType:supportedAudioRules:streamIDGenerator:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider initWithConfigurationType:supportedAudioRules:streamIDGenerator:]();
      }
    }

    return 0;
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionMediaStreamPresenceConfigurationProvider;
  [(VCSessionMediaStreamPresenceConfigurationProvider *)&v3 dealloc];
}

- (id)newStreamGroupToStreamInputsMapping
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    streamGroupConfigurations = self->_streamGroupConfigurations;
    uint64_t v5 = [(NSSet *)streamGroupConfigurations countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(streamGroupConfigurations);
          }
          v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && [v9 objectForKeyedSubscript:@"streamInputID"])
          {
            objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v9, "objectForKeyedSubscript:", @"streamInputID"), objc_msgSend(v9, "objectForKeyedSubscript:", @"streamGroupID"));
          }
        }
        uint64_t v6 = [(NSSet *)streamGroupConfigurations countByEnumeratingWithState:&v15 objects:v14 count:16];
      }
      while (v6);
    }
  }
  else if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupToStreamInputsMapping]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v11 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = v12;
        __int16 v21 = 2080;
        v22 = "-[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupToStreamInputsMapping]";
        __int16 v23 = 1024;
        int v24 = 232;
        __int16 v25 = 2112;
        v26 = v11;
        __int16 v27 = 2048;
        v28 = self;
        _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create stream group mapping dictionary", buf, 0x30u);
      }
    }
  }
  return v3;
}

+ (id)screenStreamBaseTierFramerate
{
  return &unk_1F3DC34C8;
}

+ (id)screenGroupDisabled
{
  v2 = NSNumber;
  uint64_t v3 = +[VCHardwareSettings supportsScreenCapture] ^ 1;

  return (id)[v2 numberWithInt:v3];
}

+ (id)bdatGroupDisabled
{
  BOOL v2 = +[VCHardwareSettings deviceClass] != 8;
  uint64_t v3 = NSNumber;

  return (id)[v3 numberWithBool:v2];
}

+ (id)ftxtGroupDisabled
{
  BOOL v2 = +[VCHardwareSettings deviceClass] != 8;
  uint64_t v3 = NSNumber;

  return (id)[v3 numberWithBool:v2];
}

+ (id)fdatGroupDisabled
{
  BOOL v2 = +[VCHardwareSettings deviceClass] != 8;
  uint64_t v3 = NSNumber;

  return (id)[v3 numberWithBool:v2];
}

+ (id)siriGroupDisabled
{
  uint64_t v2 = +[VCHardwareSettings isSiriVoiceTapSupported] ^ 1;
  uint64_t v3 = NSNumber;

  return (id)[v3 numberWithBool:v2];
}

+ (id)sysaGroupDisabled
{
  uint64_t v2 = +[VCHardwareSettings supportsDedicatedSystemAudioStream] ^ 1;
  uint64_t v3 = NSNumber;

  return (id)[v3 numberWithBool:v2];
}

+ (id)replaceTag:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return a3;
  }
  if ([a3 isEqualToString:@"%FRAMES_PER_SECOND_SCREENSHARE_BASE_TIER%"])
  {
    return +[VCSessionMediaStreamPresenceConfigurationProvider screenStreamBaseTierFramerate];
  }
  if ([a3 isEqualToString:@"%SCRE_GROUP_DISABLED%"])
  {
    return +[VCSessionMediaStreamPresenceConfigurationProvider screenGroupDisabled];
  }
  if ([a3 isEqualToString:@"%SYSA_GROUP_DISABLED%"])
  {
    return +[VCSessionMediaStreamPresenceConfigurationProvider sysaGroupDisabled];
  }
  if ([a3 isEqualToString:@"%FTXT_GROUP_DISABLED%"])
  {
    return +[VCSessionMediaStreamPresenceConfigurationProvider ftxtGroupDisabled];
  }
  if ([a3 isEqualToString:@"%BDAT_GROUP_DISABLED%"])
  {
    return +[VCSessionMediaStreamPresenceConfigurationProvider bdatGroupDisabled];
  }
  if ([a3 isEqualToString:@"%FDAT_GROUP_DISABLED%"])
  {
    return +[VCSessionMediaStreamPresenceConfigurationProvider fdatGroupDisabled];
  }
  if (![a3 isEqualToString:@"%SIRI_GROUP_DISABLED%"]) {
    return a3;
  }

  return +[VCSessionMediaStreamPresenceConfigurationProvider siriGroupDisabled];
}

+ (id)publicSessionConfigurationForType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = (void *)v4;
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      [v5 setObject:v6 forKeyedSubscript:@"streamInputs"];
      id v8 = +[VCSessionMediaStreamPresenceConfigurationProvider sessionConfigurationForType:v3];
      if (v8)
      {
        long long v18 = v7;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id obj = (id)[v8 objectForKeyedSubscript:@"streamInputs"];
        uint64_t v20 = [obj countByEnumeratingWithState:&v22 objects:v21 count:16];
        if (v20)
        {
          uint64_t v19 = *(void *)v23;
          while (2)
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v23 != v19) {
                objc_enumerationMutation(obj);
              }
              uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
              id v11 = +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", [v10 objectForKeyedSubscript:@"ignore"]);
              if (v11)
              {
                uint64_t v12 = v11;
                objc_opt_class();
                if (objc_opt_isKindOfClass() & 1) != 0 && ([v12 BOOLValue]) {
                  continue;
                }
              }
              uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
              if (!v13)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    +[VCSessionMediaStreamPresenceConfigurationProvider publicSessionConfigurationForType:].cold.4();
                  }
                }
                return v16;
              }
              objc_super v14 = (void *)v13;
              if ([v10 objectForKeyedSubscript:@"streamInputID"]) {
                objc_msgSend(v14, "setObject:forKeyedSubscript:", +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", objc_msgSend(v10, "objectForKeyedSubscript:", @"streamInputID")), @"streamInputID");
              }
              if ([v10 objectForKeyedSubscript:@"type"]) {
                objc_msgSend(v14, "setObject:forKeyedSubscript:", +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", objc_msgSend(v10, "objectForKeyedSubscript:", @"type")), @"type");
              }
              if ([v10 objectForKeyedSubscript:@"subtype"]) {
                objc_msgSend(v14, "setObject:forKeyedSubscript:", +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", objc_msgSend(v10, "objectForKeyedSubscript:", @"subtype")), @"subtype");
              }
              if ([v10 objectForKeyedSubscript:@"maxWidth"]) {
                objc_msgSend(v14, "setObject:forKeyedSubscript:", +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", objc_msgSend(v10, "objectForKeyedSubscript:", @"maxWidth")), @"maxWidth");
              }
              if ([v10 objectForKeyedSubscript:@"maxHeight"]) {
                objc_msgSend(v14, "setObject:forKeyedSubscript:", +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", objc_msgSend(v10, "objectForKeyedSubscript:", @"maxHeight")), @"maxHeight");
              }
              if ([v10 objectForKeyedSubscript:@"maxFramerate"]) {
                objc_msgSend(v14, "setObject:forKeyedSubscript:", +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", objc_msgSend(v10, "objectForKeyedSubscript:", @"maxFramerate")), @"maxFramerate");
              }
              [v18 addObject:v14];
            }
            uint64_t v20 = [obj countByEnumeratingWithState:&v22 objects:v21 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[VCSessionMediaStreamPresenceConfigurationProvider publicSessionConfigurationForType:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionMediaStreamPresenceConfigurationProvider publicSessionConfigurationForType:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      +[VCSessionMediaStreamPresenceConfigurationProvider publicSessionConfigurationForType:]();
    }
  }
  return v16;
}

+ (unsigned)streamSSRCForStreamGroupID:(unsigned int)a3 streamIndex:(int)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v6 = +[VCDefaults BOOLeanValueForKey:@"forceFixedSSRCsForWebRTCStreams" defaultValue:0];
  unsigned int result = 0;
  if (v6)
  {
    switch(a3)
    {
      case 0x63616D77u:
        return a4 + 32;
      case 0x73697269u:
        return a4 + 48;
      case 0x6D696377u:
        return a4 + 16;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      unsigned int result = 0;
      if (!v10) {
        return result;
      }
      int v11 = 136315906;
      uint64_t v12 = v8;
      __int16 v13 = 2080;
      objc_super v14 = "+[VCSessionMediaStreamPresenceConfigurationProvider streamSSRCForStreamGroupID:streamIndex:]";
      __int16 v15 = 1024;
      int v16 = 362;
      __int16 v17 = 1024;
      unsigned int v18 = a3;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unknown stream group ID %u. Using random SSRC", (uint8_t *)&v11, 0x22u);
    }
    return 0;
  }
  return result;
}

+ (unsigned)readUint32WithPList:(id)a3 key:(id)a4 defaultValue:(unsigned int)a5
{
  BOOL v6 = (void *)[a3 objectForKeyedSubscript:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return [v6 unsignedIntValue];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionMediaStreamPresenceConfigurationProvider readUint32WithPList:key:defaultValue:]();
      }
    }
    return a5;
  }
}

+ (id)defaultOneToOneTierTable:(unsigned int)a3 redundancyEnabled:(BOOL)a4
{
  if ((int)a3 > 1835623281)
  {
    switch(a3)
    {
      case 0x6D696372u:
        if (+[VCHardwareSettings deviceClass] == 8)
        {
          return (id)VCSessionOneToOneFullMicTierTable();
        }
        else
        {
          return (id)VCSessionOneToOneReducedMicTierTable();
        }
      case 0x73637265u:
        return (id)VCSessionOneToOneScreenTierTable();
      case 0x73797361u:
        return (id)VCSessionOneToOneSystemAudioTierTable();
      default:
        return 0;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x62646174u:
        return (id)VCSessionOneToOneBDATTierTable();
      case 0x63616D65u:
        return (id)VCSessionOneToOneCameraTierTable();
      case 0x66747874u:
        if (a4)
        {
          return (id)VCSessionOneToOneFTXTTierTableWithRedundancy();
        }
        else
        {
          return (id)VCSessionOneToOneFTXTTierTable();
        }
      default:
        return 0;
    }
  }
}

+ (id)foregroundCameraOneToOneTierTable:(unsigned int)a3 redundancyEnabled:(BOOL)a4
{
  if ((int)a3 > 1835623281)
  {
    switch(a3)
    {
      case 0x6D696372u:
        if (+[VCHardwareSettings deviceClass] == 8)
        {
          return (id)VCSessionOneToOneFullMicTierTable();
        }
        else
        {
          return (id)VCSessionOneToOneReducedMicTierTable();
        }
      case 0x73637265u:
        return (id)VCSessionOneToOneScreenTierTableForegroundCamera();
      case 0x73797361u:
        return (id)VCSessionOneToOneSystemAudioTierTable();
      default:
        return 0;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x62646174u:
        return (id)VCSessionOneToOneBDATTierTable();
      case 0x63616D65u:
        return (id)VCSessionOneToOneCameraTierTable();
      case 0x66747874u:
        if (a4)
        {
          return (id)VCSessionOneToOneFTXTTierTableWithRedundancy();
        }
        else
        {
          return (id)VCSessionOneToOneFTXTTierTable();
        }
      default:
        return 0;
    }
  }
}

+ (unsigned)defaultRemainingBitrateSplit:(unsigned int)a3
{
  unsigned int result = 18;
  if ((int)a3 <= 1835623281)
  {
    if ((int)a3 > 1684108336)
    {
      if (a3 - 1684108337 >= 5)
      {
        int v4 = 1717854580;
        goto LABEL_17;
      }
      return 0;
    }
    if (a3 == 1650745716 || a3 == 1667329399) {
      return 0;
    }
    int v4 = 1667330164;
LABEL_17:
    if (a3 != v4) {
      return result;
    }
    return 0;
  }
  if ((int)a3 > 1936290408)
  {
    if (a3 - 1986618417 < 4 || a3 == 1936290409) {
      return 0;
    }
    int v4 = 1937339233;
    goto LABEL_17;
  }
  if (a3 == 1835623282 || a3 == 1835623287) {
    return 0;
  }
  if (a3 == 1935897189) {
    return 82;
  }
  else {
    return 18;
  }
}

+ (unsigned)foregroundCameraRemainingBitrateSplit:(unsigned int)a3
{
  unsigned int result = 30;
  if ((int)a3 <= 1835623281)
  {
    if ((int)a3 > 1684108336)
    {
      if (a3 - 1684108337 >= 5 && a3 != 1717854580)
      {
        BOOL v4 = a3 == 1718909044;
        unsigned int v5 = 18;
        goto LABEL_10;
      }
      return 0;
    }
    if (a3 == 1650745716 || a3 == 1667329399) {
      return 0;
    }
    int v6 = 1667330164;
LABEL_19:
    if (a3 != v6) {
      return result;
    }
    return 0;
  }
  if ((int)a3 > 1936290408)
  {
    if (a3 - 1986618417 < 4 || a3 == 1936290409) {
      return 0;
    }
    int v6 = 1937339233;
    goto LABEL_19;
  }
  if (a3 == 1835623282 || a3 == 1835623287) {
    return 0;
  }
  BOOL v4 = a3 == 1935897189;
  unsigned int v5 = 70;
LABEL_10:
  if (v4) {
    return v5;
  }
  else {
    return 30;
  }
}

+ (id)oneToOneTierTableForStreamGroupID:(unsigned int)a3 splitType:(unsigned int)a4 redundancyEnabled:(BOOL)a5
{
  if (a4 == 1)
  {
    uint64_t v6 = [a1 foregroundCameraOneToOneTierTable:*(void *)&a3 redundancyEnabled:a5];
  }
  else
  {
    if (a4) {
      return 0;
    }
    uint64_t v6 = [a1 defaultOneToOneTierTable:*(void *)&a3 redundancyEnabled:a5];
  }
  uint64_t v7 = (void *)v6;
  if (a3 != 1718909044 || !v6 || !VCDefaults_GetBoolValueForKey(@"enableLowerU1VoltusBitrate", 0)) {
    return v7;
  }
  uint64_t v8 = (void *)[v7 mutableCopy];
  [v8 setObject:&unk_1F3DC34E0 forKeyedSubscript:&unk_1F3DC34F8];

  return v8;
}

+ (unsigned)remainingBitrateSplitQualityIndexForStreamGroup:(unsigned int)a3 splitType:(unsigned int)a4
{
  if (a4 == 1) {
    return [a1 foregroundCameraRemainingBitrateSplit:*(void *)&a3];
  }
  if (a4) {
    return 0;
  }
  return [a1 defaultRemainingBitrateSplit:*(void *)&a3];
}

- (id)defaultEndToEndStreamGroupConfigurationForStreamGroup:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9[2] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v8[0] = @"streamGroupID";
  v8[1] = @"streamGroupMode";
  v9[0] = [NSNumber numberWithUnsignedInt:v3];
  v9[1] = &unk_1F3DC3510;
  uint64_t v6 = objc_msgSend(v5, "initWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
  if (-[NSDictionary objectForKeyedSubscript:](self->_streamGroupToStreamInputMapping, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v3]))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](self->_streamGroupToStreamInputMapping, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3)), @"streamInputID");
  }
  if (v3 == 1718909044 || v3 == 1667329381) {
    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"streamGroupRedundancyControllerEnabled"];
  }
  return v6;
}

- (id)newStreamInputConfigurations
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id obj = [(NSDictionary *)self->_configuration objectForKeyedSubscript:@"streamInputs"];
  __int16 v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(obj, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (!v3) {
    return v17;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v21;
  while (2)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v21 != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      int v18 = 0;
      uint64_t v8 = [v7 objectForKeyedSubscript:@"ignore"];
      if (v8)
      {
        id v9 = +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:v8];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionMediaStreamPresenceConfigurationProvider newStreamInputConfigurations].cold.5();
            }
          }
          goto LABEL_23;
        }
        if ([v9 BOOLValue]) {
          continue;
        }
      }
      if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", [v7 objectForKeyedSubscript:@"type"], &v18))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newStreamInputConfigurations].cold.4();
          }
        }
        goto LABEL_23;
      }
      if (v18 == 1835365473)
      {
        id v10 = [(VCSessionMediaStreamPresenceConfigurationProvider *)self newDataStreamInputConfigurationWithPList:v7];
      }
      else
      {
        if (v18 != 1986618469)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v13 = VRTraceErrorLogLevelToCSTR();
            objc_super v14 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              [(VCSessionMediaStreamPresenceConfigurationProvider *)v13 newStreamInputConfigurations];
            }
          }
          goto LABEL_23;
        }
        id v10 = [(VCSessionMediaStreamPresenceConfigurationProvider *)self newVideoStreamInputConfigurationWithPList:v7];
      }
      int v11 = v10;
      uint64_t v12 = +[VCSessionMediaStreamPresenceConfigurationProvider readUint32WithPList:v7 key:@"maxFramerate" defaultValue:30];
      if (!v12)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newStreamInputConfigurations]();
          }
        }
        goto LABEL_24;
      }
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12), @"framerate");
      if (!v11)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newStreamInputConfigurations]();
          }
        }
LABEL_23:
        int v11 = 0;
LABEL_24:

        return 0;
      }
      [v17 addObject:v11];
    }
    uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v19 count:16];
    if (v4) {
      continue;
    }
    return v17;
  }
}

- (id)newVideoStreamInputConfigurationWithPList:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
  int v11 = @"type";
  v12[0] = &unk_1F3DC3528;
  uint64_t v5 = objc_msgSend(v4, "initWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamInputConfigurationWithPList:]();
      }
    }
    goto LABEL_31;
  }
  unsigned int v10 = 0;
  if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", [a3 objectForKeyedSubscript:@"streamInputID"], &v10))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamInputConfigurationWithPList:].cold.7();
      }
    }
    goto LABEL_31;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v10), @"streamInputID");
  unsigned int v9 = 0;
  if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", [a3 objectForKeyedSubscript:@"subtype"], &v9))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamInputConfigurationWithPList:].cold.6();
      }
    }
    goto LABEL_31;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v9), @"subtype");
  uint64_t v6 = (void *)[a3 objectForKeyedSubscript:@"maxWidth"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamInputConfigurationWithPList:].cold.5();
      }
    }
    goto LABEL_31;
  }
  if (![v6 unsignedIntValue])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamInputConfigurationWithPList:]();
      }
    }
    goto LABEL_31;
  }
  [v5 setObject:v6 forKeyedSubscript:@"width"];
  uint64_t v7 = (void *)[a3 objectForKeyedSubscript:@"maxHeight"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamInputConfigurationWithPList:].cold.4();
      }
    }
    goto LABEL_31;
  }
  if (![v7 unsignedIntValue])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamInputConfigurationWithPList:]();
      }
    }
LABEL_31:

    return 0;
  }
  [v5 setObject:v7 forKeyedSubscript:@"height"];
  return v5;
}

- (id)newDataStreamInputConfigurationWithPList:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
  unsigned int v9 = @"type";
  v10[0] = &unk_1F3DC3540;
  uint64_t v5 = objc_msgSend(v4, "initWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newDataStreamInputConfigurationWithPList:]();
      }
    }
    goto LABEL_15;
  }
  unsigned int v8 = 0;
  if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", [a3 objectForKeyedSubscript:@"streamInputID"], &v8))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newDataStreamInputConfigurationWithPList:]();
      }
    }
    goto LABEL_15;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v8), @"streamInputID");
  unsigned int v7 = 0;
  if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", [a3 objectForKeyedSubscript:@"subtype"], &v7))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newDataStreamInputConfigurationWithPList:]();
      }
    }
LABEL_15:

    return 0;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v7), @"subtype");
  return v5;
}

- (id)newVideoMultiwayConfigWithPList:(id)a3 codecType:(int64_t)a4 streamIDGenerator:(id)a5 ssrc:(unsigned int)a6
{
  unint64_t v6 = *(void *)&a6;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  unsigned int v10 = objc_alloc_init(VCMediaStreamMultiwayConfigVideo);
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:]();
      }
    }
    goto LABEL_107;
  }
  int v11 = (void *)[a3 objectForKeyedSubscript:@"maxNetworkBitrate"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:]0();
      }
    }
    goto LABEL_107;
  }
  -[VCMediaStreamMultiwayConfig setMaxNetworkBitrate:](v10, "setMaxNetworkBitrate:", [v11 unsignedIntValue]);
  if (![(VCMediaStreamMultiwayConfig *)v10 maxNetworkBitrate])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:]();
      }
    }
    goto LABEL_107;
  }
  uint64_t v12 = (void *)[a3 objectForKeyedSubscript:@"maxMediaBitrate"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:]9();
      }
    }
    goto LABEL_107;
  }
  -[VCMediaStreamMultiwayConfig setMaxMediaBitrate:](v10, "setMaxMediaBitrate:", [v12 unsignedIntValue]);
  if (![(VCMediaStreamMultiwayConfig *)v10 maxMediaBitrate])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:]();
      }
    }
    goto LABEL_107;
  }
  uint64_t v13 = [a3 objectForKeyedSubscript:@"repairedMaxNetworkBitrate"];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:]8();
        }
      }
      goto LABEL_107;
    }
    -[VCMediaStreamMultiwayConfig setRepairedMaxNetworkBitrate:](v10, "setRepairedMaxNetworkBitrate:", [v14 unsignedIntValue]);
  }
  uint64_t v15 = [a3 objectForKeyedSubscript:@"repairedFECLevel"];
  if (v15)
  {
    int v16 = (void *)v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:]7();
        }
      }
      goto LABEL_107;
    }
    -[VCMediaStreamMultiwayConfig setRepairedFECLevel:](v10, "setRepairedFECLevel:", [v16 unsignedIntValue]);
  }
  __int16 v17 = (void *)[a3 objectForKeyedSubscript:@"qualityIndex"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:]6();
      }
    }
    goto LABEL_107;
  }
  -[VCMediaStreamMultiwayConfig setQualityIndex:](v10, "setQualityIndex:", [v17 unsignedIntValue]);
  int v18 = (void *)[a3 objectForKeyedSubscript:@"onDemand"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:]5();
      }
    }
    goto LABEL_107;
  }
  -[VCMediaStreamMultiwayConfig setStartOnDemand:](v10, "setStartOnDemand:", VCDefaults_GetBoolValueForKey(@"forceVideoOnDemand", [v18 BOOLValue]));
  uint64_t v19 = [a3 objectForKeyedSubscript:@"isTemporalStream"];
  if (v19)
  {
    long long v20 = (void *)v19;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:]4();
        }
      }
      goto LABEL_107;
    }
    -[VCMediaStreamMultiwayConfigVideo setIsTemporalStream:](v10, "setIsTemporalStream:", [v20 BOOLValue]);
  }
  if (a4 == 300)
  {
    [(VCMediaStreamMultiwayConfigVideo *)v10 setResolution:11];
    [(VCMediaStreamMultiwayConfigVideo *)v10 setFramerate:30];
  }
  else
  {
    id v21 = +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", [a3 objectForKeyedSubscript:@"framesPerSecond"]);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((unint64_t)(a4 - 301) > 1)
    {
      if ((isKindOfClass & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:]3();
          }
        }
        goto LABEL_107;
      }
      -[VCMediaStreamMultiwayConfigVideo setFramerate:](v10, "setFramerate:", [v21 unsignedIntValue]);
      if (![(VCMediaStreamMultiwayConfigVideo *)v10 framerate])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.7();
          }
        }
        goto LABEL_107;
      }
      long long v23 = (void *)[a3 objectForKeyedSubscript:@"width"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:]2();
          }
        }
        goto LABEL_107;
      }
      uint64_t v24 = [v23 unsignedIntValue];
      if (!v24)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.8();
          }
        }
        goto LABEL_107;
      }
      uint64_t v25 = v24;
      uint64_t v26 = (void *)[a3 objectForKeyedSubscript:@"height"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:]1();
          }
        }
        goto LABEL_107;
      }
      uint64_t v27 = [v26 unsignedIntValue];
      if (!v27)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.9();
          }
        }
        goto LABEL_107;
      }
      uint64_t v28 = v27;
      uint64_t v29 = (void *)[a3 objectForKeyedSubscript:@"isVideoResolutionCustom"];
      if (v29 && [v29 BOOLValue])
      {
        [(VCMediaStreamMultiwayConfigVideo *)v10 setResolution:27];
      }
      else
      {
        [(VCMediaStreamMultiwayConfigVideo *)v10 setResolution:+[VideoUtil videoResolutionForWidth:v25 height:v28]];
        if ([(VCMediaStreamMultiwayConfigVideo *)v10 resolution] == 9)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v35 = VRTraceErrorLogLevelToCSTR();
            v36 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              int v37 = 136316162;
              uint64_t v38 = v35;
              __int16 v39 = 2080;
              v40 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:stream"
                    "IDGenerator:ssrc:]";
              __int16 v41 = 1024;
              int v42 = 713;
              __int16 v43 = 1024;
              int v44 = v25;
              __int16 v45 = 1024;
              int v46 = v28;
              _os_log_error_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid resolution: width=%u height=%u", (uint8_t *)&v37, 0x28u);
            }
          }
          goto LABEL_107;
        }
      }
      uint64_t v30 = [a3 objectForKeyedSubscript:@"keyFrameInterval"];
      if (v30)
      {
        v31 = (void *)v30;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:]0();
            }
          }
          goto LABEL_107;
        }
        -[VCMediaStreamMultiwayConfigVideo setKeyFrameInterval:](v10, "setKeyFrameInterval:", [v31 unsignedIntValue]);
      }
    }
    else
    {
      if ((isKindOfClass & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.6();
          }
        }
        goto LABEL_107;
      }
      -[VCMediaStreamMultiwayConfigVideo setFramerate:](v10, "setFramerate:", [v21 unsignedIntValue]);
      if (![(VCMediaStreamMultiwayConfigVideo *)v10 framerate])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.5();
          }
        }
        goto LABEL_107;
      }
      [(VCMediaStreamMultiwayConfigVideo *)v10 setResolution:11];
    }
  }
  if (!v6)
  {
    unint64_t v6 = objc_msgSend(a5, "generateSSRC:streamID:repairStreamID:v2StreamID:", 1, 1, -[VCMediaStreamMultiwayConfig repairedMaxNetworkBitrate](v10, "repairedMaxNetworkBitrate") != 0, 0);
    unint64_t v33 = HIDWORD(v6);
    unint64_t v32 = HIWORD(v6);
    goto LABEL_40;
  }
  if ([(VCMediaStreamMultiwayConfig *)v10 repairedMaxNetworkBitrate])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:].cold.4();
      }
    }
LABEL_107:

    return 0;
  }
  LOWORD(v32) = v6 + 1;
  LOWORD(v33) = v6;
LABEL_40:
  [(VCMediaStreamMultiwayConfig *)v10 setSsrc:v6];
  [(VCMediaStreamMultiwayConfig *)v10 setIdsStreamID:(unsigned __int16)v33];
  [(VCMediaStreamMultiwayConfig *)v10 setNegotiationProtocolMask:2];
  if ([(VCMediaStreamMultiwayConfig *)v10 repairedMaxNetworkBitrate]) {
    [(VCMediaStreamMultiwayConfig *)v10 setRepairedStreamID:(unsigned __int16)v32];
  }
  [(VCMediaStreamMultiwayConfigVideo *)v10 addPayload:+[VCPayloadUtils payloadForCodecType:a4]];
  return v10;
}

- (void)updateStreamConfig:(id)a3 forPayload:(int)a4 networkPayload:(unsigned int)a5 groupID:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v13 = +[VCVideoFeatureListStringHelper newFeatureListStringsDictForGroupID:isOneToOne:](VCVideoFeatureListStringHelper, "newFeatureListStringsDictForGroupID:isOneToOne:", *(void *)&a6, objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "isOneToOne"));
  if (v13)
  {
    [a3 addRxPayloadType:v7 networkPayload:v6];
    objc_msgSend(a3, "addRxCodecFeatureListString:codecType:", objc_msgSend(v13, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v7)), +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", v7));
    [a3 addTxPayloadType:v7 networkPayload:v6];
    objc_msgSend(a3, "addTxCodecFeatureListString:codecType:", objc_msgSend(v13, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v7)), +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", v7));
  }
  else if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider updateStreamConfig:forPayload:networkPayload:groupID:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      unsigned int v10 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      unsigned int v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v15 = v11;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCSessionMediaStreamPresenceConfigurationProvider updateStreamConfig:forPayload:networkPayload:groupID:]";
        __int16 v18 = 1024;
        int v19 = 747;
        __int16 v20 = 2112;
        id v21 = v10;
        __int16 v22 = 2048;
        long long v23 = self;
        _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create featureStrings", buf, 0x30u);
      }
    }
  }
}

- (BOOL)checkEncoderSupportForConfig:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v4 = objc_msgSend((id)objc_msgSend(a3, "payloads"), "allObjects");
  uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v35;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v35 != v7) {
        objc_enumerationMutation(v4);
      }
      unsigned int v9 = *(void **)(*((void *)&v34 + 1) + 8 * v8);
      if (+[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", [v9 intValue]) == 102&& !+[VCHardwareSettings supportsHEVCEncoding](VCHardwareSettings, "supportsHEVCEncoding"))
      {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v34 objects:v33 count:16];
        if (v6) {
          goto LABEL_3;
        }
        return 1;
      }
    }
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return 0;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      id v13 = *MEMORY[0x1E4F47A50];
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v14) {
        return result;
      }
      int v21 = 136315906;
      uint64_t v22 = v12;
      __int16 v23 = 2080;
      uint64_t v24 = "-[VCSessionMediaStreamPresenceConfigurationProvider checkEncoderSupportForConfig:]";
      __int16 v25 = 1024;
      int v26 = 766;
      __int16 v27 = 2048;
      int64_t v28 = +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", [v9 intValue]);
      uint64_t v15 = " [%s] %s:%d Found unsupported codec type=%ld";
      __int16 v16 = v13;
      uint32_t v17 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v11 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return 0;
      }
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      int v19 = *MEMORY[0x1E4F47A50];
      BOOL v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v20) {
        return result;
      }
      int v21 = 136316418;
      uint64_t v22 = v18;
      __int16 v23 = 2080;
      uint64_t v24 = "-[VCSessionMediaStreamPresenceConfigurationProvider checkEncoderSupportForConfig:]";
      __int16 v25 = 1024;
      int v26 = 766;
      __int16 v27 = 2112;
      int64_t v28 = (int64_t)v11;
      __int16 v29 = 2048;
      uint64_t v30 = self;
      __int16 v31 = 2048;
      int64_t v32 = +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", [v9 intValue]);
      uint64_t v15 = " [%s] %s:%d %@(%p) Found unsupported codec type=%ld";
      __int16 v16 = v19;
      uint32_t v17 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v21, v17);
    return 0;
  }
  return 1;
}

- (BOOL)checkEncoderSupportForCodecType:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3 != 102 || +[VCHardwareSettings supportsHEVCEncoding]) {
    return 1;
  }
  if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    id v13 = *MEMORY[0x1E4F47A50];
    BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v14) {
      return result;
    }
    int v15 = 136316418;
    uint64_t v16 = v12;
    __int16 v17 = 2080;
    uint64_t v18 = "-[VCSessionMediaStreamPresenceConfigurationProvider checkEncoderSupportForCodecType:]";
    __int16 v19 = 1024;
    int v20 = 778;
    __int16 v21 = 2112;
    uint64_t v22 = (uint64_t)v5;
    __int16 v23 = 2048;
    uint64_t v24 = self;
    __int16 v25 = 2048;
    uint64_t v26 = 102;
    unsigned int v9 = " [%s] %s:%d %@(%p) Found unsupported codec type=%ld";
    unsigned int v10 = v13;
    uint32_t v11 = 58;
    goto LABEL_14;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v8) {
      return result;
    }
    int v15 = 136315906;
    uint64_t v16 = v6;
    __int16 v17 = 2080;
    uint64_t v18 = "-[VCSessionMediaStreamPresenceConfigurationProvider checkEncoderSupportForCodecType:]";
    __int16 v19 = 1024;
    int v20 = 778;
    __int16 v21 = 2048;
    uint64_t v22 = 102;
    unsigned int v9 = " [%s] %s:%d Found unsupported codec type=%ld";
    unsigned int v10 = v7;
    uint32_t v11 = 38;
LABEL_14:
    _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
  }
  return 0;
}

- (id)getVideoCodecConfigFromStreamConfigPList:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[a3 objectForKeyedSubscript:@"codecs"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecConfigFromStreamConfigPList:]();
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return 0;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    unsigned int v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    int v13 = 136316162;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    uint64_t v16 = "-[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecConfigFromStreamConfigPList:]";
    __int16 v17 = 1024;
    int v18 = 788;
    __int16 v19 = 2112;
    int v20 = v7;
    __int16 v21 = 2048;
    uint64_t v22 = self;
    uint32_t v11 = " [%s] %s:%d %@(%p) Invalid codecs array";
    goto LABEL_25;
  }
  uint64_t v5 = (void *)[v4 objectAtIndexedSubscript:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecConfigFromStreamConfigPList:]();
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      BOOL v8 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return 0;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    unsigned int v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    int v13 = 136316162;
    uint64_t v14 = v12;
    __int16 v15 = 2080;
    uint64_t v16 = "-[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecConfigFromStreamConfigPList:]";
    __int16 v17 = 1024;
    int v18 = 792;
    __int16 v19 = 2112;
    int v20 = v8;
    __int16 v21 = 2048;
    uint64_t v22 = self;
    uint32_t v11 = " [%s] %s:%d %@(%p) Invalid codec config";
LABEL_25:
    _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v13, 0x30u);
    return 0;
  }
  return v5;
}

- (int64_t)getVideoCodecFromStreamCodecPList:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[a3 objectForKeyedSubscript:@"codecType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [v4 intValue];
    int64_t v6 = v5;
    if ((v5 - 100) >= 3 && (v5 - 300) >= 3 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecFromStreamCodecPList:]();
      }
    }
  }
  else
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecFromStreamCodecPList:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v8 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        unsigned int v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v11 = 136316162;
          uint64_t v12 = v9;
          __int16 v13 = 2080;
          uint64_t v14 = "-[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecFromStreamCodecPList:]";
          __int16 v15 = 1024;
          int v16 = 804;
          __int16 v17 = 2112;
          int v18 = v8;
          __int16 v19 = 2048;
          int v20 = self;
          _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid codec type class", (uint8_t *)&v11, 0x30u);
        }
      }
    }
    return 0;
  }
  return v6;
}

- (id)newVideoStreamGroupStreamConfigWithPList:(id)a3 streamIDGenerator:(id)a4 ssrc:(unsigned int)a5 groupID:(unsigned int)a6 shouldSkip:(BOOL *)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  *a7 = 0;
  __int16 v13 = objc_alloc_init(VCSessionParticipantVideoStreamConfig);
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:]();
      }
    }
    goto LABEL_206;
  }
  id v14 = [(VCSessionMediaStreamPresenceConfigurationProvider *)self getVideoCodecConfigFromStreamConfigPList:a3];
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:]();
      }
    }
    goto LABEL_206;
  }
  __int16 v15 = v14;
  int64_t v16 = [(VCSessionMediaStreamPresenceConfigurationProvider *)self getVideoCodecFromStreamCodecPList:v14];
  if (!v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:]();
      }
    }
    goto LABEL_206;
  }
  int64_t v17 = v16;
  if (![(VCSessionMediaStreamPresenceConfigurationProvider *)self checkEncoderSupportForCodecType:v16])
  {
    int v18 = (void *)[a3 objectForKeyedSubscript:@"fallbackStream"];
    if (!v18)
    {
      *a7 = 1;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:]0();
        }
      }
      goto LABEL_206;
    }
    a3 = v18;
    id v19 = [(VCSessionMediaStreamPresenceConfigurationProvider *)self getVideoCodecConfigFromStreamConfigPList:v18];
    if (!v19)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:]1();
        }
      }
      goto LABEL_206;
    }
    __int16 v15 = v19;
    int64_t v17 = [(VCSessionMediaStreamPresenceConfigurationProvider *)self getVideoCodecFromStreamCodecPList:v19];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (!v17)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:]2();
        }
      }
      goto LABEL_206;
    }
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v21 = self;
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      uint64_t v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v101 = v22;
        __int16 v102 = 2080;
        v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGene"
               "rator:ssrc:groupID:shouldSkip:]";
        __int16 v104 = 1024;
        int v105 = 843;
        __int16 v106 = 2048;
        int64_t v107 = v17;
        _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Falling back to stream config with codecType=%ld", buf, 0x26u);
      }
      self = v21;
    }
  }
  uint64_t v24 = [v15 objectForKeyedSubscript:@"encoderUsage"];
  if (v24)
  {
    __int16 v25 = (void *)v24;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:]9();
          }
        }
        goto LABEL_206;
      }
      if (objc_opt_respondsToSelector()) {
        v66 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        v66 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_206;
      }
      uint64_t v83 = VRTraceErrorLogLevelToCSTR();
      v84 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_206;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v101 = v83;
      __int16 v102 = 2080;
      v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenera"
             "tor:ssrc:groupID:shouldSkip:]";
      __int16 v104 = 1024;
      int v105 = 848;
      __int16 v106 = 2112;
      int64_t v107 = (int64_t)v66;
      __int16 v108 = 2048;
      v109 = self;
      v85 = " [%s] %s:%d %@(%p) Invalid encoderUsage class";
LABEL_201:
      v92 = v84;
      uint32_t v93 = 48;
      goto LABEL_202;
    }
    -[VCVideoStreamConfig setEncoderUsage:](v13, "setEncoderUsage:", [v25 unsignedIntValue]);
  }
  uint64_t v26 = (void *)[v15 objectForKeyedSubscript:@"rtpPayload"];
  if (!v26) {
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:]8();
        }
      }
      goto LABEL_206;
    }
    if (objc_opt_respondsToSelector()) {
      v67 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      v67 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_206;
    }
    uint64_t v86 = VRTraceErrorLogLevelToCSTR();
    v84 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_206;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v101 = v86;
    __int16 v102 = 2080;
    v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerato"
           "r:ssrc:groupID:shouldSkip:]";
    __int16 v104 = 1024;
    int v105 = 853;
    __int16 v106 = 2112;
    int64_t v107 = (int64_t)v67;
    __int16 v108 = 2048;
    v109 = self;
    v85 = " [%s] %s:%d %@(%p) Invalid rtp payload";
    goto LABEL_201;
  }
  LODWORD(v26) = [v26 intValue];
LABEL_18:
  uint64_t v27 = [v15 objectForKeyedSubscript:@"profileLevel"];
  if (!v27) {
    goto LABEL_21;
  }
  uint64_t v28 = v27;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:]7();
        }
      }
      goto LABEL_206;
    }
    if (objc_opt_respondsToSelector()) {
      v68 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      v68 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_206;
    }
    uint64_t v87 = VRTraceErrorLogLevelToCSTR();
    v84 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_206;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v101 = v87;
    __int16 v102 = 2080;
    v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerato"
           "r:ssrc:groupID:shouldSkip:]";
    __int16 v104 = 1024;
    int v105 = 858;
    __int16 v106 = 2112;
    int64_t v107 = (int64_t)v68;
    __int16 v108 = 2048;
    v109 = self;
    v85 = " [%s] %s:%d %@(%p) Invalid profile level";
    goto LABEL_201;
  }
  [(VCVideoStreamConfig *)v13 setProfileLevel:v28];
LABEL_21:
  uint64_t v29 = [a3 objectForKeyedSubscript:@"rtpTimestampRate"];
  if (!v29) {
    goto LABEL_24;
  }
  uint64_t v30 = (void *)v29;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:]6();
        }
      }
      goto LABEL_206;
    }
    if (objc_opt_respondsToSelector()) {
      v69 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      v69 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_206;
    }
    uint64_t v88 = VRTraceErrorLogLevelToCSTR();
    v84 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_206;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v101 = v88;
    __int16 v102 = 2080;
    v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerato"
           "r:ssrc:groupID:shouldSkip:]";
    __int16 v104 = 1024;
    int v105 = 863;
    __int16 v106 = 2112;
    int64_t v107 = (int64_t)v69;
    __int16 v108 = 2048;
    v109 = self;
    v85 = " [%s] %s:%d %@(%p) Invalid RTP timestamp rate";
    goto LABEL_201;
  }
  -[VCMediaStreamConfig setRtpTimestampRate:](v13, "setRtpTimestampRate:", [v30 intValue]);
LABEL_24:
  uint64_t v31 = [a3 objectForKeyedSubscript:@"rtcpEnabled"];
  if (!v31) {
    goto LABEL_27;
  }
  int64_t v32 = (void *)v31;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:]5();
        }
      }
      goto LABEL_206;
    }
    if (objc_opt_respondsToSelector()) {
      v70 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      v70 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_206;
    }
    uint64_t v89 = VRTraceErrorLogLevelToCSTR();
    v84 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_206;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v101 = v89;
    __int16 v102 = 2080;
    v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerato"
           "r:ssrc:groupID:shouldSkip:]";
    __int16 v104 = 1024;
    int v105 = 868;
    __int16 v106 = 2112;
    int64_t v107 = (int64_t)v70;
    __int16 v108 = 2048;
    v109 = self;
    v85 = " [%s] %s:%d %@(%p) Invalid RTCP enabled";
    goto LABEL_201;
  }
  -[VCMediaStreamConfig setRtcpEnabled:](v13, "setRtcpEnabled:", [v32 BOOLValue]);
LABEL_27:
  uint64_t v33 = [a3 objectForKeyedSubscript:@"rtcpSendInterval"];
  if (!v33) {
    goto LABEL_30;
  }
  long long v34 = (void *)v33;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:]4();
        }
      }
      goto LABEL_206;
    }
    if (objc_opt_respondsToSelector()) {
      v71 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      v71 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_206;
    }
    uint64_t v90 = VRTraceErrorLogLevelToCSTR();
    v84 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_206;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v101 = v90;
    __int16 v102 = 2080;
    v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerato"
           "r:ssrc:groupID:shouldSkip:]";
    __int16 v104 = 1024;
    int v105 = 873;
    __int16 v106 = 2112;
    int64_t v107 = (int64_t)v71;
    __int16 v108 = 2048;
    v109 = self;
    v85 = " [%s] %s:%d %@(%p) Invalid RTCP send interval";
    goto LABEL_201;
  }
  -[VCMediaStreamConfig setRtcpSendInterval:](v13, "setRtcpSendInterval:", (double)(int)[v34 intValue]);
LABEL_30:
  uint64_t v35 = [a3 objectForKeyedSubscript:@"rtcpTimeOutEnabled"];
  if (!v35) {
    goto LABEL_33;
  }
  long long v36 = (void *)v35;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:]3();
        }
      }
      goto LABEL_206;
    }
    if (objc_opt_respondsToSelector()) {
      v72 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      v72 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_206;
    }
    uint64_t v91 = VRTraceErrorLogLevelToCSTR();
    v84 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_206;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v101 = v91;
    __int16 v102 = 2080;
    v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerato"
           "r:ssrc:groupID:shouldSkip:]";
    __int16 v104 = 1024;
    int v105 = 878;
    __int16 v106 = 2112;
    int64_t v107 = (int64_t)v72;
    __int16 v108 = 2048;
    v109 = self;
    v85 = " [%s] %s:%d %@(%p) Invalid RTCP timeout enabled";
    goto LABEL_201;
  }
  -[VCMediaStreamConfig setRtcpTimeOutEnabled:](v13, "setRtcpTimeOutEnabled:", [v36 BOOLValue]);
LABEL_33:
  v99 = self;
  uint64_t v37 = [a3 objectForKeyedSubscript:@"sframeCipherSuite"];
  if (!v37) {
    goto LABEL_36;
  }
  uint64_t v38 = (void *)v37;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == v99)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:]2();
        }
      }
      goto LABEL_206;
    }
    if (objc_opt_respondsToSelector()) {
      v73 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)v99 performSelector:sel_logPrefix];
    }
    else {
      v73 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v94 = VRTraceErrorLogLevelToCSTR(),
          v95 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_206:
      int v42 = 0;
      v40 = 0;
      goto LABEL_207;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v101 = v94;
    __int16 v102 = 2080;
    v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerato"
           "r:ssrc:groupID:shouldSkip:]";
    __int16 v104 = 1024;
    int v105 = 883;
    __int16 v106 = 2112;
    int64_t v107 = (int64_t)v73;
    __int16 v108 = 2048;
    v109 = v99;
    __int16 v110 = 2112;
    v111 = @"sframeCipherSuite";
    v85 = " [%s] %s:%d %@(%p) Invalid %@ class";
    v92 = v95;
    uint32_t v93 = 58;
LABEL_202:
    _os_log_error_impl(&dword_1E1EA4000, v92, OS_LOG_TYPE_ERROR, v85, buf, v93);
    goto LABEL_206;
  }
  -[VCMediaStreamConfig setSframeCipherSuite:](v13, "setSframeCipherSuite:", [v38 intValue]);
LABEL_36:
  if (![(VCMediaStreamConfig *)v13 sframeCipherSuite])
  {
    [(VCMediaStreamConfig *)v13 setSRTPCipherSuite:3];
    [(VCMediaStreamConfig *)v13 setSRTCPCipherSuite:3];
  }
  uint64_t v39 = [(VCSessionMediaStreamPresenceConfigurationProvider *)v99 newVideoMultiwayConfigWithPList:a3 codecType:v17 streamIDGenerator:a4 ssrc:v9];
  if (!v39)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.4();
      }
    }
    goto LABEL_206;
  }
  v40 = (void *)v39;
  __int16 v41 = objc_alloc_init(VCMediaStreamRateControlConfig);
  if (!v41)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.5();
      }
    }
    int v42 = 0;
    goto LABEL_207;
  }
  int v42 = v41;
  [(VCMediaStreamConfig *)v13 setMultiwayConfig:v40];
  uint64_t v43 = 1;
  [(VCMediaStreamConfig *)v13 setDirection:1];
  -[VCVideoStreamConfig setVideoResolution:](v13, "setVideoResolution:", [v40 resolution]);
  -[VCVideoStreamConfig setFramerate:](v13, "setFramerate:", [v40 framerate]);
  -[VCVideoStreamConfig setKeyFrameInterval:](v13, "setKeyFrameInterval:", [v40 keyFrameInterval]);
  if (v8 != 1935897189) {
    uint64_t v43 = [(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v13 multiwayConfig] isOneToOne];
  }
  [(VCVideoStreamConfig *)v13 setUseInBandFEC:v43];
  if ([(VCVideoStreamConfig *)v13 useInBandFEC])
  {
    -[VCVideoStreamConfig setTxMinBitrate:](v13, "setTxMinBitrate:", [v40 maxNetworkBitrate]);
    unsigned int v44 = [v40 maxNetworkBitrate];
  }
  else
  {
    -[VCVideoStreamConfig setTxMinBitrate:](v13, "setTxMinBitrate:", [v40 maxMediaBitrate]);
    unsigned int v44 = [v40 maxMediaBitrate];
  }
  [(VCVideoStreamConfig *)v13 setTxMaxBitrate:v44];
  -[VCVideoStreamConfig setRxMinBitrate:](v13, "setRxMinBitrate:", [v40 maxNetworkBitrate]);
  -[VCVideoStreamConfig setRxMaxBitrate:](v13, "setRxMaxBitrate:", [v40 maxNetworkBitrate]);
  [(VCVideoStreamConfig *)v13 setType:3];
  -[VCVideoStreamConfig setSourceFramerate:](v13, "setSourceFramerate:", [v40 framerate]);
  [(VCVideoStreamConfig *)v13 setRemoteVideoInitialOrientation:0];
  -[VCMediaStreamConfig setRemoteSSRC:](v13, "setRemoteSSRC:", [a4 generateSSRC]);
  [(VCMediaStreamConfig *)v13 setRateControlConfig:v42];
  -[VCVideoStreamConfig setTemporalScalingEnabled:](v13, "setTemporalScalingEnabled:", [v40 isTemporalStream]);
  if ([(VCVideoStreamConfig *)v13 videoResolution] == 27)
  {
    __int16 v45 = (void *)[a3 objectForKeyedSubscript:@"width"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[VCVideoStreamConfig setCustomWidth:](v13, "setCustomWidth:", (int)[v45 intValue]);
      int v46 = (void *)[a3 objectForKeyedSubscript:@"height"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        -[VCVideoStreamConfig setCustomHeight:](v13, "setCustomHeight:", (int)[v46 intValue]);
        goto LABEL_49;
      }
      if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == v99)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:]0();
          }
        }
        goto LABEL_207;
      }
      if (objc_opt_respondsToSelector()) {
        v75 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)v99 performSelector:sel_logPrefix];
      }
      else {
        v75 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_207;
      }
      uint64_t v98 = VRTraceErrorLogLevelToCSTR();
      v97 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_207;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v101 = v98;
      __int16 v102 = 2080;
      v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenera"
             "tor:ssrc:groupID:shouldSkip:]";
      __int16 v104 = 1024;
      int v105 = 926;
      __int16 v106 = 2112;
      int64_t v107 = (int64_t)v75;
      __int16 v108 = 2048;
      v109 = v99;
      __int16 v110 = 2112;
      v111 = @"height";
      v81 = " [%s] %s:%d %@(%p) Invalid %@ class";
    }
    else
    {
      if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == v99)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:]1();
          }
        }
        goto LABEL_207;
      }
      if (objc_opt_respondsToSelector()) {
        v74 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)v99 performSelector:sel_logPrefix];
      }
      else {
        v74 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_207;
      }
      uint64_t v96 = VRTraceErrorLogLevelToCSTR();
      v97 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_207;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v101 = v96;
      __int16 v102 = 2080;
      v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenera"
             "tor:ssrc:groupID:shouldSkip:]";
      __int16 v104 = 1024;
      int v105 = 922;
      __int16 v106 = 2112;
      int64_t v107 = (int64_t)v74;
      __int16 v108 = 2048;
      v109 = v99;
      __int16 v110 = 2112;
      v111 = @"width";
      v81 = " [%s] %s:%d %@(%p) Invalid %@ class";
    }
    v82 = v97;
    goto LABEL_223;
  }
LABEL_49:
  uint64_t v47 = [a3 objectForKeyedSubscript:@"rtcpPSFBFIREnabled"];
  if (v47)
  {
    v48 = (void *)v47;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.9();
        }
      }
      goto LABEL_207;
    }
    -[VCVideoStreamConfig setRtcpPSFB_FIREnabled:](v13, "setRtcpPSFB_FIREnabled:", [v48 BOOLValue]);
  }
  if (v8 == 1935897189)
  {
    [(VCMediaStreamConfig *)v13 setCaptureSource:1];
    [(VCVideoStreamConfig *)v13 setPixelFormat:875704422];
    unsigned int v49 = [v40 framerate];
    unsigned int v50 = +[VCHardwareSettings maxFrameRateSupportedScreenShare];
    uint64_t v51 = v49 >= v50 ? v50 : v49;
    [(VCVideoStreamConfig *)v13 setFramerate:v51];
    if ([(VCVideoStreamConfig *)v13 videoResolution] == 27)
    {
      v52 = (void *)[a3 objectForKeyedSubscript:@"maxScreenPixels"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.8();
          }
        }
        goto LABEL_207;
      }
      uint64_t v53 = [v52 unsignedIntValue];
      [(VCVideoStreamConfig *)v13 setMaxEncoderPixels:v53];
      +[VideoUtil computeResolutionForMainDisplayWithMaxScreenPixelCount:v53];
      if (!(int)v54 || (double v56 = v55, !(int)v55))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.6();
          }
        }
        goto LABEL_207;
      }
      double v57 = v54;
      BOOL v58 = +[VCHardwareSettings isDisplayPortrait];
      BOOL v59 = v57 > v56;
      if (v58 && v59) {
        double v60 = v56;
      }
      else {
        double v60 = v57;
      }
      if (!v58 || !v59) {
        double v57 = v56;
      }
      [(VCVideoStreamConfig *)v13 setCustomWidth:(unint64_t)v60];
      [(VCVideoStreamConfig *)v13 setCustomHeight:(unint64_t)v57];
    }
  }
  v61 = objc_msgSend((id)objc_msgSend(v40, "payloads"), "allObjects");
  if ([v61 count] != 1)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == v99)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v76 = VRTraceErrorLogLevelToCSTR();
        v77 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:].cold.7(v76, v61, v77);
        }
      }
      goto LABEL_207;
    }
    if (objc_opt_respondsToSelector()) {
      v65 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)v99 performSelector:sel_logPrefix];
    }
    else {
      v65 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v78 = VRTraceErrorLogLevelToCSTR();
      v79 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v80 = [v61 count];
        *(_DWORD *)buf = 136316418;
        uint64_t v101 = v78;
        __int16 v102 = 2080;
        v103 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGene"
               "rator:ssrc:groupID:shouldSkip:]";
        __int16 v104 = 1024;
        int v105 = 958;
        __int16 v106 = 2112;
        int64_t v107 = (int64_t)v65;
        __int16 v108 = 2048;
        v109 = v99;
        __int16 v110 = 2048;
        v111 = (__CFString *)v80;
        v81 = " [%s] %s:%d %@(%p) Invalid payloads, payloadSize: %lu";
        v82 = v79;
LABEL_223:
        _os_log_error_impl(&dword_1E1EA4000, v82, OS_LOG_TYPE_ERROR, v81, buf, 0x3Au);
      }
    }
LABEL_207:

    return 0;
  }
  uint64_t v62 = objc_msgSend((id)objc_msgSend(v61, "objectAtIndexedSubscript:", 0), "unsignedIntValue");
  if (v26) {
    uint64_t v63 = v26;
  }
  else {
    uint64_t v63 = v62;
  }
  [(VCSessionMediaStreamPresenceConfigurationProvider *)v99 updateStreamConfig:v13 forPayload:v62 networkPayload:v63 groupID:v8];
  if (v8 == 1667329399)
  {
    [(VCVideoStreamConfig *)v13 setParameterSets:6];
    [(VCVideoStreamConfig *)v13 setCvoExtensionID:1];
    [(VCVideoStreamConfig *)v13 setResetSendRTPTimestampOnStop:0];
  }
  else
  {
    [(VCVideoStreamConfig *)v13 setParameterSets:VCVideoParamaterSets_DefaultSupportedSets(+[VCPayloadUtils payloadForCodecType:[(VCMediaStreamConfig *)v13 primaryTxCodecType]])];
  }

  return v13;
}

- (unsigned)setParentStreamID:(unsigned __int16)a3 videoConfig:(id)a4
{
  uint64_t v5 = a3;
  int v6 = [a4 isTemporalStream];
  if (v6)
  {
    [a4 setParentStreamID:v5];
    LOWORD(v6) = [a4 idsStreamID];
  }
  return v6;
}

- (BOOL)setupVideoStreamGroupStreams:(id)a3 streamGroupConfig:(id)a4 streamIDGenerator:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    [a4 setObject:v8 forKeyedSubscript:@"streamConfigurations"];

    uint64_t v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"streamGroupID"), "unsignedIntegerValue");
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v11 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v23 = v9;
      unsigned __int16 v24 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(a3);
          }
          int64_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          int64_t v17 = objc_msgSend(v16, "objectForKeyedSubscript:", @"ignore", v23);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || ([v17 BOOLValue] & 1) == 0)
          {
            uint64_t v18 = +[VCSessionMediaStreamPresenceConfigurationProvider streamSSRCForStreamGroupID:v10 streamIndex:v13];
            char v26 = 0;
            id v19 = [(VCSessionMediaStreamPresenceConfigurationProvider *)self newVideoStreamGroupStreamConfigWithPList:v16 streamIDGenerator:a5 ssrc:v18 groupID:v10 shouldSkip:&v26];
            int v20 = v19;
            if (!v26)
            {
              if (!v19)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[VCSessionMediaStreamPresenceConfigurationProvider setupVideoStreamGroupStreams:streamGroupConfig:streamIDGenerator:]();
                  }
                }
                goto LABEL_20;
              }
              unsigned __int16 v24 = -[VCSessionMediaStreamPresenceConfigurationProvider setParentStreamID:videoConfig:](self, "setParentStreamID:videoConfig:", v24, [v19 multiwayConfig]);
              [v23 addObject:v20];
            }

            uint64_t v13 = (v13 + 1);
          }
        }
        uint64_t v12 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    LOBYTE(v21) = 1;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v21) {
        return v21;
      }
      -[VCSessionMediaStreamPresenceConfigurationProvider setupVideoStreamGroupStreams:streamGroupConfig:streamIDGenerator:]();
    }
LABEL_20:
    LOBYTE(v21) = 0;
  }
  return v21;
}

- (BOOL)addPayload:(int)a3 audioStreamConfig:(id)a4 supportedAudioRules:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = (void *)[a5 rules];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        if ([v12 payload] == a3)
        {
          objc_msgSend((id)objc_msgSend(a4, "audioRules"), "addAudioRule:", v12);
          LOBYTE(v8) = 1;
          return v8;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
      uint64_t v9 = v8;
      if (v8) {
        continue;
      }
      break;
    }
  }
  return v8;
}

- (id)newAudioMultiwayConfigWithPList:(id)a3 audioRules:(id)a4 maxIDSStreamIDCount:(unsigned int)a5 streamIDGenerator:(id)a6 ssrc:(unsigned int)a7
{
  unint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a5;
  uint64_t v12 = objc_alloc_init(VCMediaStreamMultiwayConfigAudio);
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:]();
      }
    }
    goto LABEL_49;
  }
  uint64_t v13 = (void *)[a3 objectForKeyedSubscript:@"maxNetworkBitrate"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:]1();
      }
    }
    goto LABEL_49;
  }
  uint64_t v14 = [v13 unsignedIntValue];
  [(VCMediaStreamMultiwayConfig *)v12 setRepairedMaxNetworkBitrate:v14];
  [(VCMediaStreamMultiwayConfig *)v12 setMaxNetworkBitrate:v14];
  if (![(VCMediaStreamMultiwayConfig *)v12 maxNetworkBitrate])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:]();
      }
    }
    goto LABEL_49;
  }
  long long v15 = (void *)[a3 objectForKeyedSubscript:@"packetsPerSecond"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:]0();
      }
    }
    goto LABEL_49;
  }
  *(float *)&double v16 = (float)[v15 unsignedIntValue];
  [(VCMediaStreamMultiwayConfig *)v12 setMaxPacketsPerSecond:v16];
  [(VCMediaStreamMultiwayConfig *)v12 maxPacketsPerSecond];
  if (v17 == 0.0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:]();
      }
    }
    goto LABEL_49;
  }
  long long v18 = (void *)[a3 objectForKeyedSubscript:@"qualityIndex"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:].cold.9();
      }
    }
    goto LABEL_49;
  }
  -[VCMediaStreamMultiwayConfig setQualityIndex:](v12, "setQualityIndex:", [v18 unsignedIntValue]);
  if (![(VCMediaStreamMultiwayConfig *)v12 qualityIndex])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:].cold.4();
      }
    }
    goto LABEL_49;
  }
  uint64_t v19 = (void *)[a3 objectForKeyedSubscript:@"onDemand"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:].cold.8();
      }
    }
    goto LABEL_49;
  }
  -[VCMediaStreamMultiwayConfig setStartOnDemand:](v12, "setStartOnDemand:", VCDefaults_GetBoolValueForKey(@"forceAudioOnDemand", [v19 BOOLValue]));
  int v20 = (void *)[a3 objectForKeyedSubscript:@"bitrateInfo"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:].cold.7();
      }
    }
    goto LABEL_49;
  }
  BOOL v21 = (void *)[v20 objectForKeyedSubscript:@"mediaBitrate"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:].cold.6();
      }
    }
    goto LABEL_49;
  }
  -[VCMediaStreamMultiwayConfig setMaxMediaBitrate:](v12, "setMaxMediaBitrate:", [v21 unsignedIntValue]);
  -[VCMediaStreamMultiwayConfigAudio setPreferredMediaBitrate:](v12, "setPreferredMediaBitrate:", [v21 unsignedIntValue]);
  if (![(VCMediaStreamMultiwayConfig *)v12 maxMediaBitrate])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:].cold.5();
      }
    }
LABEL_49:

    return 0;
  }
  LOWORD(v22) = v7;
  if (!v7)
  {
    unint64_t v7 = [a6 generateSSRC:1 streamID:1 repairStreamID:0 v2StreamID:0];
    unint64_t v22 = HIDWORD(v7);
  }
  [(VCMediaStreamMultiwayConfig *)v12 setSsrc:v7];
  [(VCMediaStreamMultiwayConfig *)v12 setIdsStreamID:(unsigned __int16)v22];
  [(VCMediaStreamMultiwayConfigAudio *)v12 setAudioRules:a4];
  [(VCMediaStreamMultiwayConfig *)v12 setMaxIDSStreamIdCount:v9];
  [(VCMediaStreamMultiwayConfig *)v12 setNegotiationProtocolMask:2];
  return v12;
}

- (BOOL)setupRedFactorsWithPList:(id)a3 audioStreamConfig:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v29 != v9) {
        objc_enumerationMutation(a3);
      }
      uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      objc_msgSend(a4, "addSupportedNumRedundantPayload:", objc_msgSend(v11, "intValue"));
      if (v8 == ++v10)
      {
        uint64_t v8 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v12) {
          return v12;
        }
        -[VCSessionMediaStreamPresenceConfigurationProvider setupRedFactorsWithPList:audioStreamConfig:]();
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v13 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        long long v15 = *MEMORY[0x1E4F47A50];
        BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v12) {
          return v12;
        }
        int v17 = 136316162;
        uint64_t v18 = v14;
        __int16 v19 = 2080;
        int v20 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupRedFactorsWithPList:audioStreamConfig:]";
        __int16 v21 = 1024;
        int v22 = 1102;
        __int16 v23 = 2112;
        unsigned __int16 v24 = v13;
        __int16 v25 = 2048;
        char v26 = self;
        _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid red factir class", (uint8_t *)&v17, 0x30u);
      }
    }
    LOBYTE(v12) = 0;
  }
  else
  {
LABEL_9:
    LOBYTE(v12) = 1;
  }
  return v12;
}

- (BOOL)setupAudioRedWithPlist:(id)a3 audioStreamConfig:(id)a4 supportedAudioRules:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [a3 objectForKeyedSubscript:@"redPayload"];
  if (!v9) {
    goto LABEL_8;
  }
  uint64_t v10 = (void *)v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v10 intValue];
    if (v11 == 128)
    {
      if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v14) {
            return v14;
          }
          -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:]();
        }
        goto LABEL_61;
      }
      if (objc_opt_respondsToSelector()) {
        double v16 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        double v16 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        __int16 v21 = *MEMORY[0x1E4F47A50];
        BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v14) {
          return v14;
        }
        int v28 = 136316162;
        uint64_t v29 = v23;
        __int16 v30 = 2080;
        long long v31 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:]";
        __int16 v32 = 1024;
        int v33 = 1119;
        __int16 v34 = 2112;
        uint64_t v35 = v16;
        __int16 v36 = 2048;
        uint64_t v37 = self;
        int v22 = " [%s] %s:%d %@(%p) Invalid red payload";
        goto LABEL_60;
      }
    }
    else
    {
      uint64_t v12 = v11;
      if ([(VCSessionMediaStreamPresenceConfigurationProvider *)self addPayload:v11 audioStreamConfig:a4 supportedAudioRules:a5])
      {
        [a4 setupRedWithRxPayload:v12 txPayload:v12];
        uint64_t v13 = [a3 objectForKeyedSubscript:@"redFactors"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([(VCSessionMediaStreamPresenceConfigurationProvider *)self setupRedFactorsWithPList:v13 audioStreamConfig:a4])
          {
            objc_msgSend(a4, "setNumRedundantPayloads:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "supportedNumRedundantPayload"), "objectAtIndexedSubscript:", 0), "intValue"));
LABEL_8:
            LOBYTE(v14) = 1;
            return v14;
          }
          if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
              if (!v14) {
                return v14;
              }
              -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:]();
            }
            goto LABEL_61;
          }
          if (objc_opt_respondsToSelector()) {
            __int16 v19 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
          }
          else {
            __int16 v19 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v26 = VRTraceErrorLogLevelToCSTR();
            __int16 v21 = *MEMORY[0x1E4F47A50];
            BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v14) {
              return v14;
            }
            int v28 = 136316162;
            uint64_t v29 = v26;
            __int16 v30 = 2080;
            long long v31 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:]";
            __int16 v32 = 1024;
            int v33 = 1130;
            __int16 v34 = 2112;
            uint64_t v35 = v19;
            __int16 v36 = 2048;
            uint64_t v37 = self;
            int v22 = " [%s] %s:%d %@(%p) Failed to setup red factors";
LABEL_60:
            _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v28, 0x30u);
          }
        }
        else
        {
          if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
              if (!v14) {
                return v14;
              }
              -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:]();
            }
            goto LABEL_61;
          }
          if (objc_opt_respondsToSelector()) {
            uint64_t v18 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
          }
          else {
            uint64_t v18 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v25 = VRTraceErrorLogLevelToCSTR();
            __int16 v21 = *MEMORY[0x1E4F47A50];
            BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v14) {
              return v14;
            }
            int v28 = 136316162;
            uint64_t v29 = v25;
            __int16 v30 = 2080;
            long long v31 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:]";
            __int16 v32 = 1024;
            int v33 = 1127;
            __int16 v34 = 2112;
            uint64_t v35 = v18;
            __int16 v36 = 2048;
            uint64_t v37 = self;
            int v22 = " [%s] %s:%d %@(%p) Invalid red factors class";
            goto LABEL_60;
          }
        }
      }
      else
      {
        if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v14) {
              return v14;
            }
            -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:].cold.4();
          }
          goto LABEL_61;
        }
        if (objc_opt_respondsToSelector()) {
          int v17 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
        }
        else {
          int v17 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v24 = VRTraceErrorLogLevelToCSTR();
          __int16 v21 = *MEMORY[0x1E4F47A50];
          BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v14) {
            return v14;
          }
          int v28 = 136316162;
          uint64_t v29 = v24;
          __int16 v30 = 2080;
          long long v31 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:]";
          __int16 v32 = 1024;
          int v33 = 1122;
          __int16 v34 = 2112;
          uint64_t v35 = v17;
          __int16 v36 = 2048;
          uint64_t v37 = self;
          int v22 = " [%s] %s:%d %@(%p) Failed to add payload";
          goto LABEL_60;
        }
      }
    }
  }
  else
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v14) {
          return v14;
        }
        -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:].cold.5();
      }
      goto LABEL_61;
    }
    if (objc_opt_respondsToSelector()) {
      long long v15 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      long long v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      __int16 v21 = *MEMORY[0x1E4F47A50];
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v14) {
        return v14;
      }
      int v28 = 136316162;
      uint64_t v29 = v20;
      __int16 v30 = 2080;
      long long v31 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:]";
      __int16 v32 = 1024;
      int v33 = 1117;
      __int16 v34 = 2112;
      uint64_t v35 = v15;
      __int16 v36 = 2048;
      uint64_t v37 = self;
      int v22 = " [%s] %s:%d %@(%p) Invalid red payload class";
      goto LABEL_60;
    }
  }
LABEL_61:
  LOBYTE(v14) = 0;
  return v14;
}

- (BOOL)setupAudioRulesWithPList:(id)a3 audioStreamConfig:(id)a4 supportedAudioRules:(id)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)[a3 objectForKeyedSubscript:@"codecs"];
  if (![v8 count])
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v38) {
          return v38;
        }
        -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]();
      }
      goto LABEL_138;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v62 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v62 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_138;
    }
    uint64_t v63 = VRTraceErrorLogLevelToCSTR();
    unsigned int v49 = *MEMORY[0x1E4F47A50];
    BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v38) {
      return v38;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v71 = v63;
    __int16 v72 = 2080;
    v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]";
    __int16 v74 = 1024;
    int v75 = 1147;
    __int16 v76 = 2112;
    v77 = v62;
    __int16 v78 = 2048;
    v79 = self;
    unsigned int v50 = " [%s] %s:%d %@(%p) No payloads listed in config";
    goto LABEL_136;
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  uint64_t v69 = [v8 countByEnumeratingWithState:&v83 objects:v82 count:16];
  if (!v69) {
    goto LABEL_44;
  }
  uint64_t v67 = *(void *)v84;
  id obj = v8;
  v66 = self;
  while (2)
  {
    for (uint64_t i = 0; i != v69; ++i)
    {
      if (*(void *)v84 != v67) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v83 + 1) + 8 * i);
      uint64_t v11 = (void *)[v10 objectForKeyedSubscript:@"codecType"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_138;
          }
          VRTraceErrorLogLevelToCSTR();
          BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (v38)
          {
            -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]0();
            goto LABEL_138;
          }
          return v38;
        }
        if (objc_opt_respondsToSelector()) {
          uint64_t v39 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v39 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_138;
        }
        uint64_t v48 = VRTraceErrorLogLevelToCSTR();
        unsigned int v49 = *MEMORY[0x1E4F47A50];
        BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v38) {
          return v38;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v71 = v48;
        __int16 v72 = 2080;
        v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]";
        __int16 v74 = 1024;
        int v75 = 1156;
        __int16 v76 = 2112;
        v77 = v39;
        __int16 v78 = 2048;
        v79 = self;
        unsigned int v50 = " [%s] %s:%d %@(%p) Invalid codec class";
        goto LABEL_136;
      }
      int v12 = [v11 intValue];
      if (!v12)
      {
        if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_138;
          }
          VRTraceErrorLogLevelToCSTR();
          BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (v38)
          {
            -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]();
            goto LABEL_138;
          }
          return v38;
        }
        if (objc_opt_respondsToSelector()) {
          v40 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
        }
        else {
          v40 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_138;
        }
        uint64_t v51 = VRTraceErrorLogLevelToCSTR();
        unsigned int v49 = *MEMORY[0x1E4F47A50];
        BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v38) {
          return v38;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v71 = v51;
        __int16 v72 = 2080;
        v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]";
        __int16 v74 = 1024;
        int v75 = 1158;
        __int16 v76 = 2112;
        v77 = v40;
        __int16 v78 = 2048;
        v79 = self;
        unsigned int v50 = " [%s] %s:%d %@(%p) Invalid codec";
        goto LABEL_136;
      }
      int v13 = v12;
      uint64_t v14 = [v10 objectForKeyedSubscript:@"codecPreferredMode"];
      if (v14)
      {
        long long v15 = (void *)v14;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
              if (!v38) {
                return v38;
              }
              -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:].cold.9();
            }
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              uint64_t v43 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
            }
            else {
              uint64_t v43 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v57 = VRTraceErrorLogLevelToCSTR();
              unsigned int v49 = *MEMORY[0x1E4F47A50];
              BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
              if (!v38) {
                return v38;
              }
              *(_DWORD *)buf = 136316162;
              uint64_t v71 = v57;
              __int16 v72 = 2080;
              v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:suppo"
                    "rtedAudioRules:]";
              __int16 v74 = 1024;
              int v75 = 1162;
              __int16 v76 = 2112;
              v77 = v43;
              __int16 v78 = 2048;
              v79 = self;
              unsigned int v50 = " [%s] %s:%d %@(%p) Invalid preferred codec mode class";
              goto LABEL_136;
            }
          }
          goto LABEL_138;
        }
        uint64_t v16 = [v15 intValue];
        if (v16 == -1)
        {
          if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
              if (!v38) {
                return v38;
              }
              -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:].cold.8();
            }
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              unsigned int v44 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
            }
            else {
              unsigned int v44 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v58 = VRTraceErrorLogLevelToCSTR();
              unsigned int v49 = *MEMORY[0x1E4F47A50];
              BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
              if (!v38) {
                return v38;
              }
              *(_DWORD *)buf = 136316162;
              uint64_t v71 = v58;
              __int16 v72 = 2080;
              v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:suppo"
                    "rtedAudioRules:]";
              __int16 v74 = 1024;
              int v75 = 1164;
              __int16 v76 = 2112;
              v77 = v44;
              __int16 v78 = 2048;
              v79 = self;
              unsigned int v50 = " [%s] %s:%d %@(%p) Invalid preferred mode";
              goto LABEL_136;
            }
          }
LABEL_138:
          LOBYTE(v38) = 0;
          return v38;
        }
      }
      else
      {
        uint64_t v16 = 0xFFFFFFFFLL;
      }
      uint64_t v17 = [v10 objectForKeyedSubscript:@"rtpPayload"];
      if (v17)
      {
        uint64_t v18 = (void *)v17;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
              if (!v38) {
                return v38;
              }
              -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:].cold.7();
            }
            goto LABEL_138;
          }
          if (objc_opt_respondsToSelector()) {
            __int16 v45 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
          }
          else {
            __int16 v45 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_138;
          }
          uint64_t v59 = VRTraceErrorLogLevelToCSTR();
          unsigned int v49 = *MEMORY[0x1E4F47A50];
          BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v38) {
            return v38;
          }
          *(_DWORD *)buf = 136316162;
          uint64_t v71 = v59;
          __int16 v72 = 2080;
          v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]";
          __int16 v74 = 1024;
          int v75 = 1169;
          __int16 v76 = 2112;
          v77 = v45;
          __int16 v78 = 2048;
          v79 = self;
          unsigned int v50 = " [%s] %s:%d %@(%p) Invalid rtp payload";
          goto LABEL_136;
        }
        uint64_t v19 = [v18 intValue];
      }
      else
      {
        uint64_t v19 = 0xFFFFLL;
      }
      uint64_t v20 = [v10 objectForKeyedSubscript:@"pTime"];
      if (v20)
      {
        __int16 v21 = (void *)v20;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
              if (!v38) {
                return v38;
              }
              -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:].cold.6();
            }
            goto LABEL_138;
          }
          if (objc_opt_respondsToSelector()) {
            int v46 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
          }
          else {
            int v46 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_138;
          }
          uint64_t v60 = VRTraceErrorLogLevelToCSTR();
          unsigned int v49 = *MEMORY[0x1E4F47A50];
          BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v38) {
            return v38;
          }
          *(_DWORD *)buf = 136316162;
          uint64_t v71 = v60;
          __int16 v72 = 2080;
          v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]";
          __int16 v74 = 1024;
          int v75 = 1175;
          __int16 v76 = 2112;
          v77 = v46;
          __int16 v78 = 2048;
          v79 = self;
          unsigned int v50 = " [%s] %s:%d %@(%p) Invalid pTime";
          goto LABEL_136;
        }
        uint64_t v22 = (int)[v21 intValue];
      }
      else
      {
        uint64_t v22 = 20;
      }
      uint64_t v23 = [v10 objectForKeyedSubscript:@"isOpusInBandFecEnabled"];
      if (v23)
      {
        uint64_t v24 = (void *)v23;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v25 = [v24 BOOLValue];
          goto LABEL_26;
        }
        if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v38) {
              return v38;
            }
            -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:].cold.5();
          }
          goto LABEL_138;
        }
        if (objc_opt_respondsToSelector()) {
          uint64_t v47 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v47 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_138;
        }
        uint64_t v61 = VRTraceErrorLogLevelToCSTR();
        unsigned int v49 = *MEMORY[0x1E4F47A50];
        BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v38) {
          return v38;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v71 = v61;
        __int16 v72 = 2080;
        v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]";
        __int16 v74 = 1024;
        int v75 = 1181;
        __int16 v76 = 2112;
        v77 = v47;
        __int16 v78 = 2048;
        v79 = self;
        unsigned int v50 = " [%s] %s:%d %@(%p) Invalid isOpusInBandFecEnabled";
LABEL_136:
        double v55 = v49;
        uint32_t v56 = 48;
LABEL_137:
        _os_log_error_impl(&dword_1E1EA4000, v55, OS_LOG_TYPE_ERROR, v50, buf, v56);
        goto LABEL_138;
      }
      uint64_t v25 = 0;
LABEL_26:
      uint64_t v26 = +[VCPayloadUtils payloadForCodecType:v13];
      if (v26 == 128)
      {
        if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == v66)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_138;
          }
          VRTraceErrorLogLevelToCSTR();
          BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (v38)
          {
            -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]();
            goto LABEL_138;
          }
          return v38;
        }
        if (objc_opt_respondsToSelector()) {
          __int16 v41 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)v66 performSelector:sel_logPrefix];
        }
        else {
          __int16 v41 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_138;
        }
        uint64_t v52 = VRTraceErrorLogLevelToCSTR();
        uint64_t v53 = *MEMORY[0x1E4F47A50];
        BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v38) {
          return v38;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v71 = v52;
        __int16 v72 = 2080;
        v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]";
        __int16 v74 = 1024;
        int v75 = 1186;
        __int16 v76 = 2112;
        v77 = v41;
        __int16 v78 = 2048;
        v79 = v66;
        __int16 v80 = 1024;
        int v81 = v13;
        unsigned int v50 = " [%s] %s:%d %@(%p) Failed retrieve payload for codec type=%d";
        goto LABEL_100;
      }
      uint64_t v27 = v26;
      int v28 = [[VCAudioStreamCodecConfig alloc] initWithCodecType:v13];
      if (!v28)
      {
        if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == v66)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_138;
          }
          VRTraceErrorLogLevelToCSTR();
          BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (v38)
          {
            -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:].cold.4();
            goto LABEL_138;
          }
          return v38;
        }
        if (objc_opt_respondsToSelector()) {
          int v42 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)v66 performSelector:sel_logPrefix];
        }
        else {
          int v42 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_138;
        }
        uint64_t v54 = VRTraceErrorLogLevelToCSTR();
        uint64_t v53 = *MEMORY[0x1E4F47A50];
        BOOL v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v38) {
          return v38;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v71 = v54;
        __int16 v72 = 2080;
        v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]";
        __int16 v74 = 1024;
        int v75 = 1189;
        __int16 v76 = 2112;
        v77 = v42;
        __int16 v78 = 2048;
        v79 = v66;
        __int16 v80 = 1024;
        int v81 = v13;
        unsigned int v50 = " [%s] %s:%d %@(%p) Failed to allocate codec config for type=%d";
LABEL_100:
        double v55 = v53;
        uint32_t v56 = 54;
        goto LABEL_137;
      }
      uint64_t v29 = v28;
      [(VCAudioStreamCodecConfig *)v28 setPreferredMode:v16];
      [(VCAudioStreamCodecConfig *)v29 setNetworkPayload:v19];
      [(VCAudioStreamCodecConfig *)v29 setPTime:v22];
      [(VCAudioStreamCodecConfig *)v29 setIsOpusInBandFecEnabled:v25];
      if ((v27 - 107) <= 4 && ((1 << (v27 - 107)) & 0x13) != 0)
      {
        [(VCAudioStreamCodecConfig *)v29 setDtxEnabled:1];
        [(VCAudioStreamCodecConfig *)v29 setSupportedModes:&unk_1F3DC7200];
      }
      [a4 addCodecConfiguration:v29];

      self = v66;
      if (![(VCSessionMediaStreamPresenceConfigurationProvider *)v66 addPayload:v27 audioStreamConfig:a4 supportedAudioRules:a5])
      {
        if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == v66)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v36 = VRTraceErrorLogLevelToCSTR();
            uint64_t v37 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              uint64_t v71 = v36;
              __int16 v72 = 2080;
              v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:suppo"
                    "rtedAudioRules:]";
              __int16 v74 = 1024;
              int v75 = 1206;
              __int16 v76 = 1024;
              LODWORD(v77) = v27;
              int v33 = v37;
              __int16 v34 = " [%s] %s:%d Failed to add payload=%u";
              uint32_t v35 = 34;
              goto LABEL_41;
            }
          }
        }
        else
        {
          __int16 v30 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            __int16 v30 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)v66 performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v31 = VRTraceErrorLogLevelToCSTR();
            __int16 v32 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316418;
              uint64_t v71 = v31;
              __int16 v72 = 2080;
              v73 = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:suppo"
                    "rtedAudioRules:]";
              __int16 v74 = 1024;
              int v75 = 1206;
              __int16 v76 = 2112;
              v77 = v30;
              __int16 v78 = 2048;
              v79 = v66;
              __int16 v80 = 1024;
              int v81 = v27;
              int v33 = v32;
              __int16 v34 = " [%s] %s:%d %@(%p) Failed to add payload=%u";
              uint32_t v35 = 54;
LABEL_41:
              _os_log_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, v35);
              continue;
            }
          }
        }
      }
    }
    uint64_t v69 = [obj countByEnumeratingWithState:&v83 objects:v82 count:16];
    if (v69) {
      continue;
    }
    break;
  }
LABEL_44:
  LOBYTE(v38) = [(VCSessionMediaStreamPresenceConfigurationProvider *)self setupAudioRedWithPlist:a3 audioStreamConfig:a4 supportedAudioRules:a5];
  return v38;
}

- (id)newAudioStreamGroupStreamConfigWithPList:(id)a3 supportedAudioRules:(id)a4 maxIDSStreamIDCount:(unsigned int)a5 streamIDGenerator:(id)a6 ssrc:(unsigned int)a7 groupID:(unsigned int)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v11 = *(void *)&a5;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  long long v15 = objc_alloc_init(VCSessionParticipantAudioStreamConfig);
  if (!v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]();
      }
    }
    goto LABEL_81;
  }
  uint64_t v16 = objc_alloc_init(VCMediaStreamRateControlConfig);
  if (!v16)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v39 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v39 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v48 = VRTraceErrorLogLevelToCSTR();
        unsigned int v49 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v64 = 136316162;
          uint64_t v65 = v48;
          __int16 v66 = 2080;
          uint64_t v67 = "-[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAu"
                "dioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]";
          __int16 v68 = 1024;
          int v69 = 1232;
          __int16 v70 = 2112;
          uint64_t v71 = v39;
          __int16 v72 = 2048;
          v73 = self;
          _os_log_error_impl(&dword_1E1EA4000, v49, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create rate control config", (uint8_t *)&v64, 0x30u);
        }
      }
    }
LABEL_81:
    uint64_t v19 = 0;
    uint64_t v17 = 0;
LABEL_87:
    __int16 v21 = 0;
    goto LABEL_88;
  }
  uint64_t v17 = v16;
  [(VCMediaStreamConfig *)v15 setRateControlConfig:v16];
  uint64_t v18 = objc_alloc_init(VCAudioRuleCollection);
  if (!v18)
  {
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v40 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        v40 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v50 = VRTraceErrorLogLevelToCSTR();
        uint64_t v51 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v64 = 136316162;
          uint64_t v65 = v50;
          __int16 v66 = 2080;
          uint64_t v67 = "-[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAu"
                "dioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]";
          __int16 v68 = 1024;
          int v69 = 1236;
          __int16 v70 = 2112;
          uint64_t v71 = v40;
          __int16 v72 = 2048;
          v73 = self;
          _os_log_error_impl(&dword_1E1EA4000, v51, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create audio rules collection", (uint8_t *)&v64, 0x30u);
        }
      }
    }
    uint64_t v19 = 0;
    goto LABEL_87;
  }
  uint64_t v19 = v18;
  [(VCSessionParticipantAudioStreamConfig *)v15 setAudioRules:v18];
  if (![(VCSessionMediaStreamPresenceConfigurationProvider *)self setupAudioRulesWithPList:a3 audioStreamConfig:v15 supportedAudioRules:a4])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]2();
      }
    }
    goto LABEL_87;
  }
  id v20 = [(VCSessionMediaStreamPresenceConfigurationProvider *)self newAudioMultiwayConfigWithPList:a3 audioRules:v19 maxIDSStreamIDCount:v11 streamIDGenerator:a6 ssrc:v9];
  if (!v20)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:].cold.4();
      }
    }
    goto LABEL_87;
  }
  __int16 v21 = v20;
  [(VCMediaStreamConfig *)v15 setMultiwayConfig:v20];
  uint64_t v22 = [a3 objectForKeyedSubscript:@"rtpTimestampRate"];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]1();
          }
        }
        goto LABEL_88;
      }
      if (objc_opt_respondsToSelector()) {
        __int16 v41 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v41 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_88;
      }
      uint64_t v52 = VRTraceErrorLogLevelToCSTR();
      uint64_t v53 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_88;
      }
      int v64 = 136316162;
      uint64_t v65 = v52;
      __int16 v66 = 2080;
      uint64_t v67 = "-[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioR"
            "ules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]";
      __int16 v68 = 1024;
      int v69 = 1252;
      __int16 v70 = 2112;
      uint64_t v71 = v41;
      __int16 v72 = 2048;
      v73 = self;
      uint64_t v54 = " [%s] %s:%d %@(%p) Invalid RTP timestamp rate";
      goto LABEL_134;
    }
    -[VCMediaStreamConfig setRtpTimestampRate:](v15, "setRtpTimestampRate:", [v23 intValue]);
  }
  uint64_t v24 = [a3 objectForKeyedSubscript:@"rtcpEnabled"];
  if (v24)
  {
    uint64_t v25 = (void *)v24;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]0();
          }
        }
        goto LABEL_88;
      }
      if (objc_opt_respondsToSelector()) {
        int v42 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        int v42 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_88;
      }
      uint64_t v55 = VRTraceErrorLogLevelToCSTR();
      uint64_t v53 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_88;
      }
      int v64 = 136316162;
      uint64_t v65 = v55;
      __int16 v66 = 2080;
      uint64_t v67 = "-[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioR"
            "ules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]";
      __int16 v68 = 1024;
      int v69 = 1258;
      __int16 v70 = 2112;
      uint64_t v71 = v42;
      __int16 v72 = 2048;
      v73 = self;
      uint64_t v54 = " [%s] %s:%d %@(%p) Invalid RTCP enabled";
      goto LABEL_134;
    }
    -[VCMediaStreamConfig setRtcpEnabled:](v15, "setRtcpEnabled:", [v25 BOOLValue]);
  }
  uint64_t v26 = [a3 objectForKeyedSubscript:@"rtcpSendInterval"];
  if (v26)
  {
    uint64_t v27 = (void *)v26;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:].cold.9();
          }
        }
        goto LABEL_88;
      }
      if (objc_opt_respondsToSelector()) {
        uint64_t v43 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v43 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_88;
      }
      uint64_t v56 = VRTraceErrorLogLevelToCSTR();
      uint64_t v53 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_88;
      }
      int v64 = 136316162;
      uint64_t v65 = v56;
      __int16 v66 = 2080;
      uint64_t v67 = "-[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioR"
            "ules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]";
      __int16 v68 = 1024;
      int v69 = 1264;
      __int16 v70 = 2112;
      uint64_t v71 = v43;
      __int16 v72 = 2048;
      v73 = self;
      uint64_t v54 = " [%s] %s:%d %@(%p) Invalid RTP send interval";
      goto LABEL_134;
    }
    [v27 doubleValue];
    -[VCMediaStreamConfig setRtcpSendInterval:](v15, "setRtcpSendInterval:");
  }
  uint64_t v28 = [a3 objectForKeyedSubscript:@"rtcpTimeOutEnabled"];
  if (v28)
  {
    uint64_t v29 = (void *)v28;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:].cold.8();
          }
        }
        goto LABEL_88;
      }
      if (objc_opt_respondsToSelector()) {
        unsigned int v44 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        unsigned int v44 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_88;
      }
      uint64_t v57 = VRTraceErrorLogLevelToCSTR();
      uint64_t v53 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_88;
      }
      int v64 = 136316162;
      uint64_t v65 = v57;
      __int16 v66 = 2080;
      uint64_t v67 = "-[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioR"
            "ules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]";
      __int16 v68 = 1024;
      int v69 = 1270;
      __int16 v70 = 2112;
      uint64_t v71 = v44;
      __int16 v72 = 2048;
      v73 = self;
      uint64_t v54 = " [%s] %s:%d %@(%p) Invalid RTCP timeout enabled";
      goto LABEL_134;
    }
    -[VCMediaStreamConfig setRtcpTimeOutEnabled:](v15, "setRtcpTimeOutEnabled:", [v29 BOOLValue]);
  }
  uint64_t v30 = [a3 objectForKeyedSubscript:@"bundlingScheme"];
  if (v30)
  {
    uint64_t v31 = (void *)v30;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:].cold.7();
          }
        }
        goto LABEL_88;
      }
      if (objc_opt_respondsToSelector()) {
        __int16 v45 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v45 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_88;
      }
      uint64_t v58 = VRTraceErrorLogLevelToCSTR();
      uint64_t v53 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_88;
      }
      int v64 = 136316162;
      uint64_t v65 = v58;
      __int16 v66 = 2080;
      uint64_t v67 = "-[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioR"
            "ules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]";
      __int16 v68 = 1024;
      int v69 = 1276;
      __int16 v70 = 2112;
      uint64_t v71 = v45;
      __int16 v72 = 2048;
      v73 = self;
      uint64_t v54 = " [%s] %s:%d %@(%p) Invalid bundling scheme";
      goto LABEL_134;
    }
    uint64_t v32 = [v31 intValue];
  }
  else
  {
    uint64_t v32 = 1;
  }
  [(VCAudioStreamConfig *)v15 setBundlingScheme:v32];
  uint64_t v33 = [a3 objectForKeyedSubscript:@"audioChannelCount"];
  if (v33)
  {
    __int16 v34 = (void *)v33;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v35 = [v34 intValue];
      goto LABEL_26;
    }
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:].cold.6();
        }
      }
      goto LABEL_88;
    }
    if (objc_opt_respondsToSelector()) {
      int v46 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      int v46 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_88;
    }
    uint64_t v59 = VRTraceErrorLogLevelToCSTR();
    uint64_t v53 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_88;
    }
    int v64 = 136316162;
    uint64_t v65 = v59;
    __int16 v66 = 2080;
    uint64_t v67 = "-[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRul"
          "es:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]";
    __int16 v68 = 1024;
    int v69 = 1284;
    __int16 v70 = 2112;
    uint64_t v71 = v46;
    __int16 v72 = 2048;
    v73 = self;
    uint64_t v54 = " [%s] %s:%d %@(%p) Invalid number of audio channels";
LABEL_134:
    uint64_t v60 = v53;
    uint32_t v61 = 48;
LABEL_135:
    _os_log_error_impl(&dword_1E1EA4000, v60, OS_LOG_TYPE_ERROR, v54, (uint8_t *)&v64, v61);
    goto LABEL_88;
  }
  uint64_t v35 = 1;
LABEL_26:
  [(VCAudioStreamConfig *)v15 setChannelCount:v35];
  uint64_t v36 = [a3 objectForKeyedSubscript:@"sframeCipherSuite"];
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[VCMediaStreamConfig setSframeCipherSuite:](v15, "setSframeCipherSuite:", [v37 intValue]);
      goto LABEL_29;
    }
    if ((VCSessionMediaStreamPresenceConfigurationProvider *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:].cold.5();
        }
      }
      goto LABEL_88;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v47 = (__CFString *)[(VCSessionMediaStreamPresenceConfigurationProvider *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v47 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v62 = VRTraceErrorLogLevelToCSTR();
      uint64_t v63 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v64 = 136316418;
        uint64_t v65 = v62;
        __int16 v66 = 2080;
        uint64_t v67 = "-[VCSessionMediaStreamPresenceConfigurationProvider newAudioStreamGroupStreamConfigWithPList:supportedAudi"
              "oRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:]";
        __int16 v68 = 1024;
        int v69 = 1292;
        __int16 v70 = 2112;
        uint64_t v71 = v47;
        __int16 v72 = 2048;
        v73 = self;
        __int16 v74 = 2112;
        int v75 = @"sframeCipherSuite";
        uint64_t v54 = " [%s] %s:%d %@(%p) Invalid %@ class";
        uint64_t v60 = v63;
        uint32_t v61 = 58;
        goto LABEL_135;
      }
    }
LABEL_88:

    long long v15 = 0;
    goto LABEL_34;
  }
LABEL_29:
  if (![(VCMediaStreamConfig *)v15 sframeCipherSuite])
  {
    [(VCMediaStreamConfig *)v15 setSRTPCipherSuite:3];
    [(VCMediaStreamConfig *)v15 setSRTCPCipherSuite:3];
  }
  if (a8 == 1936290409) {
    [(VCAudioStreamConfig *)v15 setSupportsAdaptation:1];
  }
  [(VCSessionParticipantAudioStreamConfig *)v15 setAudioRules:v19];
  [(VCMediaStreamConfig *)v15 setDirection:1];
  [(VCMediaStreamConfig *)v15 setJitterBufferMode:1];
LABEL_34:

  return v15;
}

- (BOOL)setupAudioStreamGroupStreams:(id)a3 streamGroupConfig:(id)a4 supportedAudioRules:(id)a5 streamIDGenerator:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    [a4 setObject:v8 forKeyedSubscript:@"streamConfigurations"];

    uint64_t v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"streamGroupID"), "unsignedIntegerValue");
    uint64_t v11 = [a3 count];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v12 = [a3 countByEnumeratingWithState:&v27 objects:v26 count:16];
    if (!v12)
    {
LABEL_13:
      LOBYTE(v21) = 1;
      return v21;
    }
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v28;
LABEL_4:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v28 != v15) {
        objc_enumerationMutation(a3);
      }
      uint64_t v17 = *(void **)(*((void *)&v27 + 1) + 8 * v16);
      uint64_t v18 = (void *)[v17 objectForKeyedSubscript:@"ignore"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ([v18 BOOLValue] & 1) == 0)
      {
        id v19 = [(VCSessionMediaStreamPresenceConfigurationProvider *)self newAudioStreamGroupStreamConfigWithPList:v17 supportedAudioRules:a5 maxIDSStreamIDCount:v11 streamIDGenerator:a6 ssrc:+[VCSessionMediaStreamPresenceConfigurationProvider streamSSRCForStreamGroupID:v10 streamIndex:v14] groupID:v10];
        if (!v19)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_18;
          }
          VRTraceErrorLogLevelToCSTR();
          BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (v21)
          {
            -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioStreamGroupStreams:streamGroupConfig:supportedAudioRules:streamIDGenerator:]();
            goto LABEL_18;
          }
          return v21;
        }
        id v20 = v19;
        uint64_t v14 = (v14 + 1);
        [v9 addObject:v19];

        uint64_t v11 = (v11 - 1);
      }
      if (v13 == ++v16)
      {
        uint64_t v13 = [a3 countByEnumeratingWithState:&v27 objects:v26 count:16];
        if (v13) {
          goto LABEL_4;
        }
        goto LABEL_13;
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v21) {
      return v21;
    }
    -[VCSessionMediaStreamPresenceConfigurationProvider setupAudioStreamGroupStreams:streamGroupConfig:supportedAudioRules:streamIDGenerator:]();
  }
LABEL_18:
  LOBYTE(v21) = 0;
  return v21;
}

- (id)newStreamGroupConfigurationWithPList:(id)a3 supportedAudioRules:(id)a4 streamIDGenerator:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:]();
      }
    }
    goto LABEL_26;
  }
  unsigned int v20 = 0;
  if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", [a3 objectForKeyedSubscript:@"streamGroupID"], &v20))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:].cold.9();
      }
    }
    goto LABEL_26;
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v20), @"streamGroupID");
  if ([a3 objectForKeyedSubscript:@"streamGroupRedundancyController"]) {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"streamGroupRedundancyController"), @"streamGroupRedundancyControllerEnabled");
  }
  if ([a3 objectForKeyedSubscript:@"streamInputID"])
  {
    unsigned int v19 = 0;
    if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", [a3 objectForKeyedSubscript:@"streamInputID"], &v19))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:].cold.8();
        }
      }
      goto LABEL_26;
    }
    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v19), @"streamInputID");
  }
  unsigned int v18 = 0;
  if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", [a3 objectForKeyedSubscript:@"streamGroupMediaType"], &v18))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:].cold.7();
      }
    }
    goto LABEL_26;
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v18), @"streamGroupMediaType");
  if ([a3 objectForKeyedSubscript:@"streamGroupSyncGroupID"])
  {
    unsigned int v19 = 0;
    if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", [a3 objectForKeyedSubscript:@"streamGroupSyncGroupID"], &v19))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:].cold.6();
        }
      }
      goto LABEL_26;
    }
    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v19), @"streamGroupSyncGroupID");
  }
  uint64_t v10 = [a3 objectForKeyedSubscript:@"streams"];
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:]();
      }
    }
    goto LABEL_26;
  }
  uint64_t v11 = v10;
  uint64_t v12 = (void *)[v9 objectForKeyedSubscript:@"streamGroupMediaType"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:].cold.5();
      }
    }
    goto LABEL_26;
  }
  int v13 = [v12 unsignedIntValue];
  if (v13 == 1835365473 || (int v14 = v13, v13 == 1986618469))
  {
    if (![(VCSessionMediaStreamPresenceConfigurationProvider *)self setupVideoStreamGroupStreams:v11 streamGroupConfig:v9 streamIDGenerator:a5])goto LABEL_20; {
  }
    }
  else
  {
    if (v13 != 1936684398)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:](v15, v14, v16);
        }
      }
      goto LABEL_26;
    }
    if (![(VCSessionMediaStreamPresenceConfigurationProvider *)self setupAudioStreamGroupStreams:v11 streamGroupConfig:v9 supportedAudioRules:a4 streamIDGenerator:a5])
    {
LABEL_20:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:].cold.4();
        }
      }
LABEL_26:

      return 0;
    }
  }
  return v9;
}

- (id)newStreamGroupConfigurationsWithSupportedAudioRules:(id)a3 streamIDGenerator:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = [(NSDictionary *)self->_configuration objectForKeyedSubscript:@"streamGroups"];
  uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v5 = v4;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v36 objects:v35 count:16];
  if (!v6) {
    return v24;
  }
  uint64_t v8 = v6;
  uint64_t v9 = *(void *)v37;
  *(void *)&long long v7 = 136315906;
  long long v20 = v7;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v37 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      id v12 = +[VCSessionMediaStreamPresenceConfigurationProvider replaceTag:](VCSessionMediaStreamPresenceConfigurationProvider, "replaceTag:", objc_msgSend(v11, "objectForKeyedSubscript:", @"ignore", v20));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ([v12 BOOLValue] & 1) == 0)
      {
        int v26 = 0;
        if (!+[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", [v11 objectForKeyedSubscript:@"streamGroupID"], &v26))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationsWithSupportedAudioRules:streamIDGenerator:]();
            }
          }
          goto LABEL_30;
        }
        if (objc_msgSend(+[VCHardwareSettings supportedVideoPayloads](VCHardwareSettings, "supportedVideoPayloads"), "count")&& +[VCHardwareSettings isVideoRenderingSupported](VCHardwareSettings, "isVideoRenderingSupported")|| (v13 = objc_msgSend(v11, "objectForKeyedSubscript:", @"streamGroupMediaType"), int v25 = 0, +[VCStringUtils convertString:toFourcc:](VCStringUtils, "convertString:toFourcc:", v13, &v25))&& v25 == 1936684398)
        {
          id v14 = [(VCSessionMediaStreamPresenceConfigurationProvider *)self newStreamGroupConfigurationWithPList:v11 supportedAudioRules:a3 streamIDGenerator:a4];
          if (v14)
          {
            uint64_t v15 = v14;
            [v24 addObject:v14];

            continue;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationsWithSupportedAudioRules:streamIDGenerator:]();
            }
          }
LABEL_30:

          return 0;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v16 = VRTraceErrorLogLevelToCSTR();
          uint64_t v17 = *MEMORY[0x1E4F47A50];
          unsigned int v18 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v20;
              uint64_t v28 = v16;
              __int16 v29 = 2080;
              long long v30 = "-[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationsWithSupportedAudioRu"
                    "les:streamIDGenerator:]";
              __int16 v31 = 1024;
              int v32 = 1445;
              __int16 v33 = 2112;
              uint64_t v34 = v13;
              _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d mediaType=%@", buf, 0x26u);
            }
          }
          else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v20;
            uint64_t v28 = v16;
            __int16 v29 = 2080;
            long long v30 = "-[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationsWithSupportedAudioRule"
                  "s:streamIDGenerator:]";
            __int16 v31 = 1024;
            int v32 = 1445;
            __int16 v33 = 2112;
            uint64_t v34 = v13;
            _os_log_debug_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEBUG, " [%s] %s:%d mediaType=%@", buf, 0x26u);
          }
        }
      }
    }
    uint64_t v8 = [v5 countByEnumeratingWithState:&v36 objects:v35 count:16];
    if (v8) {
      continue;
    }
    return v24;
  }
}

- (NSSet)streamInputConfigurations
{
  return self->_streamInputConfigurations;
}

- (NSSet)streamGroupConfigurations
{
  return self->_streamGroupConfigurations;
}

+ (void)sessionConfigurationForType:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCSessionMediaStreamPresenceConfigurationProvider sessionConfigurationForType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No resource defined for configuration type=%u", v2, *(const char **)v3, (unint64_t)"+[VCSessionMediaStreamPresenceConfigurationProvider sessionConfigurationForType:]" >> 16, v4);
}

+ (void)sessionConfigurationForType:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "+[VCSessionMediaStreamPresenceConfigurationProvider sessionConfigurationForType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, (uint64_t)v0, " [%s] %s:%d Failed to load configuration resource=%@", v1);
}

- (void)initWithConfigurationType:supportedAudioRules:streamIDGenerator:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to load configuration", v2, v3, v4, v5, v6);
}

- (void)initWithConfigurationType:supportedAudioRules:streamIDGenerator:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to load the stream input configurations", v2, v3, v4, v5, v6);
}

- (void)initWithConfigurationType:supportedAudioRules:streamIDGenerator:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to load the stream group configurations", v2, v3, v4, v5, v6);
}

- (void)initWithConfigurationType:supportedAudioRules:streamIDGenerator:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize streamGroupToStreamInputMapping", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupToStreamInputsMapping
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create stream group mapping dictionary", v2, v3, v4, v5, v6);
}

+ (void)publicSessionConfigurationForType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate new plist configuration", v2, v3, v4, v5, v6);
}

+ (void)publicSessionConfigurationForType:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocated stream input array", v2, v3, v4, v5, v6);
}

+ (void)publicSessionConfigurationForType:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCSessionMediaStreamPresenceConfigurationProvider publicSessionConfigurationForType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Configuration is nil for type=%d", v2, *(const char **)v3, (unint64_t)"+[VCSessionMediaStreamPresenceConfigurationProvider publicSessionConfigurationForType:]" >> 16, v4);
}

+ (void)publicSessionConfigurationForType:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocated stream input dictionary", v2, v3, v4, v5, v6);
}

+ (void)readUint32WithPList:key:defaultValue:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "+[VCSessionMediaStreamPresenceConfigurationProvider readUint32WithPList:key:defaultValue:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, (uint64_t)v0, " [%s] %s:%d '%@' is missing in config", v1);
}

- (void)newStreamInputConfigurations
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid type for field=%@", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamInputConfigurationWithPList:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video stream input config", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamInputConfigurationWithPList:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Width is 0!", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamInputConfigurationWithPList:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Height is 0!", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamInputConfigurationWithPList:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamInputConfigurationWithPList:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamInputConfigurationWithPList:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Subtype is not valid", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamInputConfigurationWithPList:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d streamInputID is not valid", v2, v3, v4, v5, v6);
}

- (void)newDataStreamInputConfigurationWithPList:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the data stream input config", v2, v3, v4, v5, v6);
}

- (void)newDataStreamInputConfigurationWithPList:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Subtype is not valid", v2, v3, v4, v5, v6);
}

- (void)newDataStreamInputConfigurationWithPList:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d streamInputID is not valid", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create video multiway config", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Max network bitrate is invalid", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Max media bitrate is invalid", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Using reserved SSRC with un-available repaired stream id", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid framerate", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Frame rate field should be of numeber type", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid framerate", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Video width is invalid", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Height width is invalid", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.10()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.11()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.12()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.13()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Frame rate field should be of numeber type", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.14()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.15()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.16()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.17()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is invalid", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.18()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is invalid", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.19()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
}

- (void)newVideoMultiwayConfigWithPList:codecType:streamIDGenerator:ssrc:.cold.20()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
}

- (void)updateStreamConfig:forPayload:networkPayload:groupID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create featureStrings", v2, v3, v4, v5, v6);
}

- (void)getVideoCodecConfigFromStreamConfigPList:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid codec config", v2, v3, v4, v5, v6);
}

- (void)getVideoCodecConfigFromStreamConfigPList:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid codecs array", v2, v3, v4, v5, v6);
}

- (void)getVideoCodecFromStreamCodecPList:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v4 = "-[VCSessionMediaStreamPresenceConfigurationProvider getVideoCodecFromStreamCodecPList:]";
  OUTLINED_FUNCTION_3();
  int v5 = 808;
  __int16 v6 = 2112;
  long long v7 = @"codecType";
  __int16 v8 = v0;
  int v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d '%@'=%d incorrect codecType in config", v3, 0x2Cu);
}

- (void)getVideoCodecFromStreamCodecPList:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid codec type class", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create video stream config", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to parse codec config", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d 'Invalid codec type", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create video multiway config", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create rate control config", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d streamConfig cannot be generated when encoder resolution is zero", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:(NSObject *)a3 streamIDGenerator:ssrc:groupID:shouldSkip:.cold.7(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [a2 count];
  OUTLINED_FUNCTION_7_1();
  long long v7 = "-[VCSessionMediaStreamPresenceConfigurationProvider newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ss"
       "rc:groupID:shouldSkip:]";
  OUTLINED_FUNCTION_3();
  int v8 = 958;
  __int16 v9 = 2048;
  uint64_t v10 = v4;
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, a3, v5, " [%s] %s:%d Invalid payloads, payloadSize: %lu", v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.10()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid %@ class", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.11()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid %@ class", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.12()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid %@ class", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.13()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid RTCP timeout enabled", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.14()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid RTCP send interval", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.15()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid RTCP enabled", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.16()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid RTP timestamp rate", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.17()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid profile level", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.18()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid rtp payload", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.19()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid encoderUsage class", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.20()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No fallback stream is provided for an unsupported codec type", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.21()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to parse codec config", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupStreamConfigWithPList:streamIDGenerator:ssrc:groupID:shouldSkip:.cold.22()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d 'Invalid codec type", v2, v3, v4, v5, v6);
}

- (void)setupVideoStreamGroupStreams:streamGroupConfig:streamIDGenerator:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video stream configuration array!", v2, v3, v4, v5, v6);
}

- (void)setupVideoStreamGroupStreams:streamGroupConfig:streamIDGenerator:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize the video stream config", v2, v3, v4, v5, v6);
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create video multiway config", v2, v3, v4, v5, v6);
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid max network bitrate", v2, v3, v4, v5, v6);
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid max packets per second", v2, v3, v4, v5, v6);
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid quality index", v2, v3, v4, v5, v6);
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid media bitrate", v2, v3, v4, v5, v6);
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.10()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
}

- (void)newAudioMultiwayConfigWithPList:audioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:.cold.11()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d '%@' is missing in config", v2, v3, v4, v5, v6);
}

- (void)setupRedFactorsWithPList:audioStreamConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid red factir class", v2, v3, v4, v5, v6);
}

- (void)setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid red payload", v2, v3, v4, v5, v6);
}

- (void)setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup red factors", v2, v3, v4, v5, v6);
}

- (void)setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid red factors class", v2, v3, v4, v5, v6);
}

- (void)setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to add payload", v2, v3, v4, v5, v6);
}

- (void)setupAudioRedWithPlist:audioStreamConfig:supportedAudioRules:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid red payload class", v2, v3, v4, v5, v6);
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No payloads listed in config", v2, v3, v4, v5, v6);
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid codec", v2, v3, v4, v5, v6);
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:sup"
                      "portedAudioRules:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed retrieve payload for codec type=%d", v2, *(const char **)v3, (unint64_t)"-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]" >> 16, v4);
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.4()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:sup"
                      "portedAudioRules:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate codec config for type=%d", v2, *(const char **)v3, (unint64_t)"-[VCSessionMediaStreamPresenceConfigurationProvider setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:]" >> 16, v4);
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid isOpusInBandFecEnabled", v2, v3, v4, v5, v6);
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid pTime", v2, v3, v4, v5, v6);
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid rtp payload", v2, v3, v4, v5, v6);
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid preferred mode", v2, v3, v4, v5, v6);
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid preferred codec mode class", v2, v3, v4, v5, v6);
}

- (void)setupAudioRulesWithPList:audioStreamConfig:supportedAudioRules:.cold.10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid codec class", v2, v3, v4, v5, v6);
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create audio stream config", v2, v3, v4, v5, v6);
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create rate control config", v2, v3, v4, v5, v6);
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create audio rules collection", v2, v3, v4, v5, v6);
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create audio multiway config", v2, v3, v4, v5, v6);
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid %@ class", v2, v3, v4, v5, v6);
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid number of audio channels", v2, v3, v4, v5, v6);
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid bundling scheme", v2, v3, v4, v5, v6);
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid RTCP timeout enabled", v2, v3, v4, v5, v6);
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid RTP send interval", v2, v3, v4, v5, v6);
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid RTCP enabled", v2, v3, v4, v5, v6);
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.11()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid RTP timestamp rate", v2, v3, v4, v5, v6);
}

- (void)newAudioStreamGroupStreamConfigWithPList:supportedAudioRules:maxIDSStreamIDCount:streamIDGenerator:ssrc:groupID:.cold.12()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create audio rules", v2, v3, v4, v5, v6);
}

- (void)setupAudioStreamGroupStreams:streamGroupConfig:supportedAudioRules:streamIDGenerator:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the audio stream configuration array!", v2, v3, v4, v5, v6);
}

- (void)setupAudioStreamGroupStreams:streamGroupConfig:supportedAudioRules:streamIDGenerator:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize the audio stream config", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the stream group config dictionary", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No streams specified!", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupConfigurationWithPList:(uint64_t)a1 supportedAudioRules:(int)a2 streamIDGenerator:(NSObject *)a3 .cold.3(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  FourccToCStr(a2);
  OUTLINED_FUNCTION_7_1();
  int v8 = "-[VCSessionMediaStreamPresenceConfigurationProvider newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:]";
  __int16 v9 = 1024;
  int v10 = 1411;
  __int16 v11 = v4;
  uint64_t v12 = v5;
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, a3, v6, " [%s] %s:%d Unsupported media type=%s", v7);
}

- (void)newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup streams", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid media type class", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retrieve syncGroupID for stream group", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retrieve the stream group media type", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retrieve the stream group stream input ID", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupConfigurationWithPList:supportedAudioRules:streamIDGenerator:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retrieve the stream group ID", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupConfigurationsWithSupportedAudioRules:streamIDGenerator:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to load stream input configuration", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupConfigurationsWithSupportedAudioRules:streamIDGenerator:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retrieve the stream group ID", v2, v3, v4, v5, v6);
}

@end