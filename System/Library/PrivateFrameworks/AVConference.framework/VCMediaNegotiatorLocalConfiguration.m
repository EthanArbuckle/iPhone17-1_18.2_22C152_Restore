@interface VCMediaNegotiatorLocalConfiguration
- (BOOL)SIPDisabled;
- (BOOL)allowRTCPFB;
- (BOOL)alwaysOnAudRedEnabled;
- (BOOL)alwaysOnAudioRedundancyEnabled;
- (BOOL)blackFrameOnClearScreenEnabled;
- (BOOL)blackFrameOnClearScreenEnabledDefault;
- (BOOL)duplicateImportantPktsEnabled;
- (BOOL)fastMediaDuplicationEnabled;
- (BOOL)fecEnabled;
- (BOOL)foveationIsSupported;
- (BOOL)highFecEnabled;
- (BOOL)iRATRtpEnabled;
- (BOOL)isCaller;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualBandwidthConfigurations:(id)a3;
- (BOOL)isEqualFaceTimeSettings:(id)a3;
- (BOOL)isEqualMediaRecorderImageTypes:(id)a3;
- (BOOL)isEqualMediaRecorderVideoCodecs:(id)a3;
- (BOOL)isEqualMultiwayAudioStreamSet:(id)a3;
- (BOOL)isEqualMultiwayVideoStreamSet:(id)a3;
- (BOOL)isEqualStreamGroupConfigs:(id)a3;
- (BOOL)isOneToOneAuthTagEnabled;
- (BOOL)lowFpsVideoEnabled;
- (BOOL)ltrpEnabled;
- (BOOL)oneToOneModeSupported;
- (BOOL)preWarmCellEnabled;
- (BOOL)rampDownBWDropEnabled;
- (BOOL)rtxEnabled;
- (BOOL)secureMessagingRequired;
- (BOOL)setupBandwidthConfigurationsWithArbiter:(id)a3;
- (BOOL)setupBandwidthExtensionConfiguration:(id)a3;
- (BOOL)vplrFecEnabled;
- (CGSize)aspectRatioLandscape;
- (CGSize)aspectRatioPortrait;
- (CGSize)orientationMismatchAspectRatioLandscape;
- (CGSize)screenSize;
- (NSDictionary)u1StreamConfigurations;
- (NSMutableOrderedSet)multiwayAudioStreams;
- (NSMutableOrderedSet)multiwayVideoStreams;
- (NSSet)bandwidthConfigurations;
- (NSSet)captionsReceiverLanguages;
- (NSSet)captionsSenderLanguages;
- (NSSet)hdrModesSupported;
- (NSSet)mediaRecorderImageTypes;
- (NSSet)mediaRecorderVideoCodecs;
- (NSSet)pixelFormats;
- (NSSet)streamGroupConfigs;
- (NSString)basebandCodec;
- (VCMediaNegotiatorLocalConfiguration)init;
- (VCMediaNegotiatorLocalConfiguration)initWithBitrateArbiter:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mediaConfigurationForMediaType:(unsigned __int8)a3;
- (int)accessNetworkType;
- (int)deviceRole;
- (int)preferredAudioCodec;
- (tagNTP)creationTime;
- (unsigned)basebandCodecSampleRate;
- (unsigned)customVideoHeight;
- (unsigned)customVideoWidth;
- (unsigned)faceTimeSwitches;
- (unsigned)linkProbingCapabilityVersion;
- (unsigned)mediaControlInfoFECFeedbackVersion;
- (unsigned)mediaControlInfoVersion;
- (unsigned)tilesPerVideoFrame;
- (void)addBandwidthConfiguration:(id)a3;
- (void)addMultiwayAudioStream:(id)a3;
- (void)addMultiwayVideoStream:(id)a3;
- (void)addStreamGroupConfig:(id)a3;
- (void)callLogFile;
- (void)dealloc;
- (void)init;
- (void)resetStreamGroups;
- (void)setAccessNetworkType:(int)a3;
- (void)setAllowRTCPFB:(BOOL)a3;
- (void)setAlwaysOnAudRedEnabled:(BOOL)a3;
- (void)setAlwaysOnAudioRedundancyEnabled:(BOOL)a3;
- (void)setBandwidthConfigurations:(id)a3;
- (void)setBasebandCodec:(id)a3;
- (void)setBasebandCodecSampleRate:(unsigned int)a3;
- (void)setBlackFrameOnClearScreenEnabled:(BOOL)a3;
- (void)setBlackFrameOnClearScreenEnabledDefault:(BOOL)a3;
- (void)setCallLogFile:(void *)a3;
- (void)setCaptionsReceiverLanguages:(id)a3;
- (void)setCaptionsSenderLanguages:(id)a3;
- (void)setCreationTime:(tagNTP)a3;
- (void)setCustomVideoHeight:(unsigned int)a3;
- (void)setCustomVideoWidth:(unsigned int)a3;
- (void)setDeviceRole:(int)a3;
- (void)setDuplicateImportantPktsEnabled:(BOOL)a3;
- (void)setFaceTimeSwitches:(unsigned int)a3;
- (void)setFastMediaDuplicationEnabled:(BOOL)a3;
- (void)setFecEnabled:(BOOL)a3;
- (void)setFoveationIsSupported:(BOOL)a3;
- (void)setHdrModesSupported:(id)a3;
- (void)setHighFecEnabled:(BOOL)a3;
- (void)setIRATRtpEnabled:(BOOL)a3;
- (void)setIsCaller:(BOOL)a3;
- (void)setLinkProbingCapabilityVersion:(unsigned __int8)a3;
- (void)setLowFpsVideoEnabled:(BOOL)a3;
- (void)setLtrpEnabled:(BOOL)a3;
- (void)setMediaConfiguration:(id)a3 forMediaType:(unsigned __int8)a4;
- (void)setMediaControlInfoFECFeedbackVersion:(unsigned __int8)a3;
- (void)setMediaControlInfoVersion:(unsigned __int8)a3;
- (void)setMediaRecorderImageTypes:(id)a3;
- (void)setMediaRecorderVideoCodecs:(id)a3;
- (void)setMultiwayAudioStreams:(id)a3;
- (void)setMultiwayVideoStreams:(id)a3;
- (void)setOneToOneAuthTagEnabled:(BOOL)a3;
- (void)setOneToOneModeSupported:(BOOL)a3;
- (void)setPixelFormats:(id)a3;
- (void)setPreWarmCellEnabled:(BOOL)a3;
- (void)setPreferredAudioCodec:(int)a3;
- (void)setRampDownBWDropEnabled:(BOOL)a3;
- (void)setRtxEnabled:(BOOL)a3;
- (void)setSIPDisabled:(BOOL)a3;
- (void)setSecureMessagingRequired:(BOOL)a3;
- (void)setTilesPerVideoFrame:(unsigned int)a3;
- (void)setU1StreamConfigurations:(id)a3;
- (void)setVplrFecEnabled:(BOOL)a3;
@end

@implementation VCMediaNegotiatorLocalConfiguration

- (VCMediaNegotiatorLocalConfiguration)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VCMediaNegotiatorLocalConfiguration;
  v2 = [(VCMediaNegotiatorLocalConfiguration *)&v12 init];
  if (v2)
  {
    double v3 = micro();
    v2->_creationTime.wide = MicroToNTP(v3);
    v2->_tilesPerVideoFrame = 1;
    v2->_ltrpEnabled = 1;
    v2->_accessNetworkType = 0;
    v4 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v2->_multiwayAudioStreams = v4;
    if (v4)
    {
      v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
      v2->_multiwayVideoStreams = v5;
      if (v5)
      {
        v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v2->_bandwidthConfigurations = v6;
        if (v6)
        {
          v7 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
          v2->_pixelFormats = v7;
          if (v7)
          {
            v8 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
            v2->_hdrModesSupported = v8;
            if (v8)
            {
              v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
              v2->_streamGroupConfigs = v9;
              if (v9)
              {
                v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
                v2->_u1StreamConfigurations = v10;
                if (v10)
                {
                  v2->_mediaControlInfoFECFeedbackVersion = 0;
                  v2->_screenSize.width = (double)+[VCHardwareSettings screenWidth];
                  v2->_screenSize.height = (double)+[VCHardwareSettings screenHeight];
                  +[VCVideoFeatureListStringHelper aspectRatioPortrait:&v2->_aspectRatioPortrait landscape:&v2->_aspectRatioLandscape isMismatchedOrientation:0];
                  +[VCVideoFeatureListStringHelper aspectRatioPortrait:0 landscape:&v2->_orientationMismatchAspectRatioLandscape isMismatchedOrientation:1];
                  return v2;
                }
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[VCMediaNegotiatorLocalConfiguration init].cold.7();
                  }
                }
              }
              else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[VCMediaNegotiatorLocalConfiguration init].cold.6();
                }
              }
            }
            else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCMediaNegotiatorLocalConfiguration init].cold.5();
              }
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCMediaNegotiatorLocalConfiguration init].cold.4();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaNegotiatorLocalConfiguration init]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiatorLocalConfiguration init]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiatorLocalConfiguration init]();
      }
    }

    return 0;
  }
  return v2;
}

- (VCMediaNegotiatorLocalConfiguration)initWithBitrateArbiter:(id)a3
{
  v4 = [(VCMediaNegotiatorLocalConfiguration *)self init];
  v5 = v4;
  if (v4
    && ![(VCMediaNegotiatorLocalConfiguration *)v4 setupBandwidthConfigurationsWithArbiter:a3])
  {

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorLocalConfiguration;
  [(VCMediaNegotiatorLocalConfiguration *)&v3 dealloc];
}

- (void)setMediaConfiguration:(id)a3 forMediaType:(unsigned __int8)a4
{
  u1StreamConfigurations = self->_u1StreamConfigurations;
  uint64_t v6 = [NSNumber numberWithUnsignedChar:a4];

  [(NSMutableDictionary *)u1StreamConfigurations setObject:a3 forKeyedSubscript:v6];
}

- (id)mediaConfigurationForMediaType:(unsigned __int8)a3
{
  id v3 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_u1StreamConfigurations, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedChar:a3]);

  return v3;
}

- (BOOL)setupBandwidthConfigurationsWithArbiter:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v19 = [&unk_1F3DC7620 countByEnumeratingWithState:&v38 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v39;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(&unk_1F3DC7620);
        }
        uint64_t v21 = v5;
        uint64_t v6 = [*(id *)(*((void *)&v38 + 1) + 8 * v5) intValue];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v7 = [&unk_1F3DC7638 countByEnumeratingWithState:&v33 objects:v32 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v34;
          while (2)
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v34 != v9) {
                objc_enumerationMutation(&unk_1F3DC7638);
              }
              unsigned __int8 v11 = [*(id *)(*((void *)&v33 + 1) + 8 * i) intValue];
              objc_super v12 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", v11, v6, [a3 maxAllowedBitrateForConnectionType:v6 arbiterMode:v11]);
              if (!v12)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  uint64_t v17 = VRTraceErrorLogLevelToCSTR();
                  v18 = *MEMORY[0x1E4F47A50];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316162;
                    uint64_t v23 = v17;
                    __int16 v24 = 2080;
                    v25 = "-[VCMediaNegotiatorLocalConfiguration setupBandwidthConfigurationsWithArbiter:]";
                    __int16 v26 = 1024;
                    int v27 = 185;
                    __int16 v28 = 1024;
                    int v29 = v11;
                    __int16 v30 = 1024;
                    int v31 = v6;
                    _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate bandwidth configuration for mode=%hhu connectionType:%d", buf, 0x28u);
                  }
                }
                goto LABEL_22;
              }
              uint64_t v13 = v12;
              [(NSMutableSet *)self->_bandwidthConfigurations addObject:v12];
            }
            uint64_t v8 = [&unk_1F3DC7638 countByEnumeratingWithState:&v33 objects:v32 count:16];
            if (v8) {
              continue;
            }
            break;
          }
        }
        v14 = -[VCMediaNegotiatorBandwidthConfiguration initWithConnectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithConnectionType:maxBandwidth:", v6, [a3 maxAllowedBitrateForConnectionType:v6 arbiterMode:2]);
        if (!v14)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCMediaNegotiatorLocalConfiguration setupBandwidthConfigurationsWithArbiter:]();
            }
          }
          goto LABEL_22;
        }
        v15 = v14;
        [(NSMutableSet *)self->_bandwidthConfigurations addObject:v14];

        uint64_t v5 = v21 + 1;
      }
      while (v21 + 1 != v19);
      uint64_t v19 = [&unk_1F3DC7620 countByEnumeratingWithState:&v38 objects:v37 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
  if ([(VCMediaNegotiatorLocalConfiguration *)self setupBandwidthExtensionConfiguration:a3])
  {
    return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaNegotiatorLocalConfiguration setupBandwidthConfigurationsWithArbiter:]();
    }
  }
LABEL_22:
  [(NSMutableSet *)self->_bandwidthConfigurations removeAllObjects];
  return 0;
}

- (BOOL)setupBandwidthExtensionConfiguration:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v24 = [&unk_1F3DC7650 countByEnumeratingWithState:&v43 objects:v42 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v44;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v44 != v25) {
          objc_enumerationMutation(&unk_1F3DC7650);
        }
        uint64_t v26 = v5;
        uint64_t v6 = [*(id *)(*((void *)&v43 + 1) + 8 * v5) intValue];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        uint64_t v7 = [&unk_1F3DC7668 countByEnumeratingWithState:&v38 objects:v37 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v39;
LABEL_8:
          uint64_t v10 = 0;
          while (1)
          {
            if (*(void *)v39 != v9) {
              objc_enumerationMutation(&unk_1F3DC7668);
            }
            unsigned __int8 v11 = [*(id *)(*((void *)&v38 + 1) + 8 * v10) intValue];
            objc_super v12 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", v11, v6, [a3 maxAllowedBitrateForConnectionType:v6 arbiterMode:v11]);
            if (!v12) {
              break;
            }
            uint64_t v13 = v12;
            [(NSMutableSet *)self->_bandwidthConfigurations addObject:v12];

            if (v8 == ++v10)
            {
              uint64_t v8 = [&unk_1F3DC7668 countByEnumeratingWithState:&v38 objects:v37 count:16];
              if (v8) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_23;
          }
          uint64_t v21 = VRTraceErrorLogLevelToCSTR();
          v22 = *MEMORY[0x1E4F47A50];
          BOOL v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (v20)
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v28 = v21;
            __int16 v29 = 2080;
            __int16 v30 = "-[VCMediaNegotiatorLocalConfiguration setupBandwidthExtensionConfiguration:]";
            __int16 v31 = 1024;
            int v32 = 219;
            __int16 v33 = 1024;
            int v34 = v11;
            __int16 v35 = 1024;
            int v36 = v6;
            _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate bandwidth configuration for mode=%hhu connectionType:%d", buf, 0x28u);
            goto LABEL_23;
          }
          return v20;
        }
LABEL_14:
        uint64_t v5 = v26 + 1;
      }
      while (v26 + 1 != v24);
      uint64_t v24 = [&unk_1F3DC7650 countByEnumeratingWithState:&v43 objects:v42 count:16];
      if (v24) {
        continue;
      }
      break;
    }
  }
  v14 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 1, 6, [a3 maxAllowedBitrateForConnectionType:6 arbiterMode:1]);
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v20) {
        return v20;
      }
      -[VCMediaNegotiatorLocalConfiguration setupBandwidthExtensionConfiguration:]();
    }
    goto LABEL_23;
  }
  v15 = v14;
  [(NSMutableSet *)self->_bandwidthConfigurations addObject:v14];

  v16 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 7, 3, [a3 maxAllowedBitrateForConnectionType:3 arbiterMode:7]);
  if (!v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v20) {
        return v20;
      }
      -[VCMediaNegotiatorLocalConfiguration setupBandwidthExtensionConfiguration:]();
    }
    goto LABEL_23;
  }
  uint64_t v17 = v16;
  [(NSMutableSet *)self->_bandwidthConfigurations addObject:v16];

  v18 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 5, 7, [a3 maxAllowedBitrateForConnectionType:7 arbiterMode:5]);
  if (!v18)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v20) {
        return v20;
      }
      -[VCMediaNegotiatorLocalConfiguration setupBandwidthExtensionConfiguration:]();
    }
LABEL_23:
    LOBYTE(v20) = 0;
    return v20;
  }
  uint64_t v19 = v18;
  [(NSMutableSet *)self->_bandwidthConfigurations addObject:v18];

  LOBYTE(v20) = 1;
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = (void *)[(NSMutableDictionary *)self->_u1StreamConfigurations mutableCopyWithZone:a3];
    [v5 setU1StreamConfigurations:v6];

    [v5 setPreferredAudioCodec:self->_preferredAudioCodec];
    [v5 setDeviceRole:self->_deviceRole];
    [v5 setAllowRTCPFB:self->_allowRTCPFB];
    [v5 setIsCaller:self->_isCaller];
    [v5 setBasebandCodec:self->_basebandCodec];
    [v5 setBasebandCodecSampleRate:self->_basebandCodecSampleRate];
    [v5 setBandwidthConfigurations:self->_bandwidthConfigurations];
    [v5 setCaptionsSenderLanguages:self->_captionsSenderLanguages];
    [v5 setCaptionsReceiverLanguages:self->_captionsReceiverLanguages];
    [v5 setCallLogFile:self->_callLogFile];
    [v5 setCreationTime:self->_creationTime.wide];
    [v5 setMediaControlInfoVersion:self->_mediaControlInfoVersion];
    [v5 setMultiwayAudioStreams:self->_multiwayAudioStreams];
    [v5 setMultiwayVideoStreams:self->_multiwayVideoStreams];
    [v5 setMediaRecorderVideoCodecs:self->_mediaRecorderVideoCodecs];
    [v5 setMediaRecorderImageTypes:self->_mediaRecorderImageTypes];
    [v5 setSIPDisabled:self->_SIPDisabled];
    [v5 setSecureMessagingRequired:self->_secureMessagingRequired];
    [v5 setFaceTimeSwitches:self->_faceTimeSwitches];
    [v5 setOneToOneModeSupported:self->_oneToOneModeSupported];
    [v5 setPixelFormats:self->_pixelFormats];
    [v5 setHdrModesSupported:self->_hdrModesSupported];
    [v5 setMediaControlInfoFECFeedbackVersion:self->_mediaControlInfoFECFeedbackVersion];
    [v5 setLinkProbingCapabilityVersion:self->_linkProbingCapabilityVersion];
    [v5 setAccessNetworkType:self->_accessNetworkType];
    [v5 setFecEnabled:self->_fecEnabled];
    [v5 setRtxEnabled:self->_rtxEnabled];
    [v5 setOneToOneAuthTagEnabled:self->_oneToOneAuthTagEnabled];
    [v5 setBlackFrameOnClearScreenEnabled:self->_blackFrameOnClearScreenEnabled];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    streamGroupConfigs = self->_streamGroupConfigs;
    uint64_t v8 = [(NSMutableSet *)streamGroupConfigs countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(streamGroupConfigs);
          }
          [v5 addStreamGroupConfig:*(void *)(*((void *)&v14 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableSet *)streamGroupConfigs countByEnumeratingWithState:&v14 objects:v13 count:16];
      }
      while (v9);
    }
  }
  return v5;
}

- (void)addBandwidthConfiguration:(id)a3
{
}

- (void)addMultiwayAudioStream:(id)a3
{
}

- (void)addMultiwayVideoStream:(id)a3
{
}

- (void)addStreamGroupConfig:(id)a3
{
}

- (void)resetStreamGroups
{
}

- (BOOL)isEqualBandwidthConfigurations:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  bandwidthConfigurations = self->_bandwidthConfigurations;
  uint64_t v5 = [(NSMutableSet *)bandwidthConfigurations countByEnumeratingWithState:&v21 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
LABEL_4:
      if (*(void *)v22 != v7) {
        objc_enumerationMutation(bandwidthConfigurations);
      }
      uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v10 = [a3 countByEnumeratingWithState:&v16 objects:v15 count:16];
      if (!v10) {
        break;
      }
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
LABEL_8:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(a3);
        }
        if ([v9 isEqual:*(void *)(*((void *)&v16 + 1) + 8 * v13)]) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v10 = [a3 countByEnumeratingWithState:&v16 objects:v15 count:16];
          uint64_t v11 = v10;
          if (v10) {
            goto LABEL_8;
          }
          return v10;
        }
      }
      if (++v8 != v6) {
        goto LABEL_4;
      }
      uint64_t v6 = [(NSMutableSet *)bandwidthConfigurations countByEnumeratingWithState:&v21 objects:v20 count:16];
      LOBYTE(v10) = 1;
    }
    while (v6);
  }
  else
  {
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (BOOL)isEqualMultiwayAudioStreamSet:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NSMutableOrderedSet *)self->_multiwayAudioStreams count];
  if (v5 == [a3 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    multiwayAudioStreams = self->_multiwayAudioStreams;
    uint64_t v7 = [(NSMutableOrderedSet *)multiwayAudioStreams countByEnumeratingWithState:&v23 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        uint64_t v10 = 0;
LABEL_5:
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(multiwayAudioStreams);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v12 = [a3 countByEnumeratingWithState:&v18 objects:v17 count:16];
        if (!v12) {
          break;
        }
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
LABEL_9:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(a3);
          }
          if ([v11 isEqual:*(void *)(*((void *)&v18 + 1) + 8 * v15)]) {
            break;
          }
          if (v13 == ++v15)
          {
            uint64_t v12 = [a3 countByEnumeratingWithState:&v18 objects:v17 count:16];
            uint64_t v13 = v12;
            if (v12) {
              goto LABEL_9;
            }
            return v12;
          }
        }
        if (++v10 != v8) {
          goto LABEL_5;
        }
        uint64_t v8 = [(NSMutableOrderedSet *)multiwayAudioStreams countByEnumeratingWithState:&v23 objects:v22 count:16];
        LOBYTE(v12) = 1;
      }
      while (v8);
    }
    else
    {
      LOBYTE(v12) = 1;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (BOOL)isEqualMultiwayVideoStreamSet:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NSMutableOrderedSet *)self->_multiwayVideoStreams count];
  if (v5 == [a3 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    multiwayVideoStreams = self->_multiwayVideoStreams;
    uint64_t v7 = [(NSMutableOrderedSet *)multiwayVideoStreams countByEnumeratingWithState:&v23 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        uint64_t v10 = 0;
LABEL_5:
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(multiwayVideoStreams);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v12 = [a3 countByEnumeratingWithState:&v18 objects:v17 count:16];
        if (!v12) {
          break;
        }
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
LABEL_9:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(a3);
          }
          if ([v11 isEqual:*(void *)(*((void *)&v18 + 1) + 8 * v15)]) {
            break;
          }
          if (v13 == ++v15)
          {
            uint64_t v12 = [a3 countByEnumeratingWithState:&v18 objects:v17 count:16];
            uint64_t v13 = v12;
            if (v12) {
              goto LABEL_9;
            }
            return v12;
          }
        }
        if (++v10 != v8) {
          goto LABEL_5;
        }
        uint64_t v8 = [(NSMutableOrderedSet *)multiwayVideoStreams countByEnumeratingWithState:&v23 objects:v22 count:16];
        LOBYTE(v12) = 1;
      }
      while (v8);
    }
    else
    {
      LOBYTE(v12) = 1;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (BOOL)isEqualStreamGroupConfigs:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NSMutableSet *)self->_streamGroupConfigs count];
  if (v5 == [a3 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    streamGroupConfigs = self->_streamGroupConfigs;
    uint64_t v7 = [(NSMutableSet *)streamGroupConfigs countByEnumeratingWithState:&v23 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        uint64_t v10 = 0;
LABEL_5:
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(streamGroupConfigs);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v12 = [a3 countByEnumeratingWithState:&v18 objects:v17 count:16];
        if (!v12) {
          break;
        }
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
LABEL_9:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(a3);
          }
          if ([v11 isEqual:*(void *)(*((void *)&v18 + 1) + 8 * v15)]) {
            break;
          }
          if (v13 == ++v15)
          {
            uint64_t v12 = [a3 countByEnumeratingWithState:&v18 objects:v17 count:16];
            uint64_t v13 = v12;
            if (v12) {
              goto LABEL_9;
            }
            return v12;
          }
        }
        if (++v10 != v8) {
          goto LABEL_5;
        }
        uint64_t v8 = [(NSMutableSet *)streamGroupConfigs countByEnumeratingWithState:&v23 objects:v22 count:16];
        LOBYTE(v12) = 1;
      }
      while (v8);
    }
    else
    {
      LOBYTE(v12) = 1;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (BOOL)isEqualMediaRecorderImageTypes:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (NSUInteger v5 = [(NSSet *)self->_mediaRecorderImageTypes count],
        v5 == objc_msgSend((id)objc_msgSend(a3, "mediaRecorderImageTypes"), "count")))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = (void *)[a3 mediaRecorderImageTypes];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = [(NSSet *)self->_mediaRecorderImageTypes containsObject:*(void *)(*((void *)&v14 + 1) + 8 * v10)];
        if (!v11) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
          LOBYTE(v11) = 1;
          if (v8) {
            goto LABEL_5;
          }
          return v11;
        }
      }
    }
    else
    {
      LOBYTE(v11) = 1;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (BOOL)isEqualMediaRecorderVideoCodecs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (NSUInteger v5 = [(NSSet *)self->_mediaRecorderVideoCodecs count],
        v5 == objc_msgSend((id)objc_msgSend(a3, "mediaRecorderVideoCodecs"), "count")))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = (void *)[a3 mediaRecorderVideoCodecs];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = [(NSSet *)self->_mediaRecorderVideoCodecs containsObject:*(void *)(*((void *)&v14 + 1) + 8 * v10)];
        if (!v11) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
          LOBYTE(v11) = 1;
          if (v8) {
            goto LABEL_5;
          }
          return v11;
        }
      }
    }
    else
    {
      LOBYTE(v11) = 1;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (BOOL)isEqualFaceTimeSettings:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int SIPDisabled = self->_SIPDisabled;
  if (SIPDisabled != [a3 SIPDisabled]) {
    return 0;
  }
  int secureMessagingRequired = self->_secureMessagingRequired;
  if (secureMessagingRequired != [a3 secureMessagingRequired]) {
    return 0;
  }
  unsigned int faceTimeSwitches = self->_faceTimeSwitches;
  if (faceTimeSwitches != [a3 faceTimeSwitches]) {
    return 0;
  }
  int oneToOneModeSupported = self->_oneToOneModeSupported;
  if (oneToOneModeSupported != [a3 oneToOneModeSupported]) {
    return 0;
  }
  int mediaControlInfoFECFeedbackVersion = self->_mediaControlInfoFECFeedbackVersion;
  if (mediaControlInfoFECFeedbackVersion != [a3 mediaControlInfoFECFeedbackVersion]) {
    return 0;
  }
  int linkProbingCapabilityVersion = self->_linkProbingCapabilityVersion;
  return linkProbingCapabilityVersion == [a3 linkProbingCapabilityVersion];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (!objc_msgSend((id)objc_msgSend(a3, "u1StreamConfigurations"), "isEqual:", self->_u1StreamConfigurations))return 0; {
  if ([a3 preferredAudioCodec] != self->_preferredAudioCodec)
  }
    return 0;
  if ([a3 deviceRole] != self->_deviceRole) {
    return 0;
  }
  if ([a3 creationTime] != self->_creationTime.wide) {
    return 0;
  }
  if ([a3 mediaControlInfoVersion] != self->_mediaControlInfoVersion) {
    return 0;
  }
  if ((NSString *)[a3 basebandCodec] != self->_basebandCodec) {
    return 0;
  }
  if ([a3 basebandCodecSampleRate] != self->_basebandCodecSampleRate) {
    return 0;
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "bandwidthConfigurations"), "count");
  if (v5 != [(NSMutableSet *)self->_bandwidthConfigurations count]
    || self->_allowRTCPFB != [a3 allowRTCPFB]
    || self->_isCaller != [a3 isCaller]
    || [a3 accessNetworkType] != self->_accessNetworkType
    || self->_fecEnabled != [a3 fecEnabled]
    || self->_rtxEnabled != [a3 rtxEnabled]
    || self->_oneToOneAuthTagEnabled != [a3 isOneToOneAuthTagEnabled]
    || self->_blackFrameOnClearScreenEnabled != [a3 blackFrameOnClearScreenEnabled]
    || !-[VCMediaNegotiatorLocalConfiguration isEqualBandwidthConfigurations:](self, "isEqualBandwidthConfigurations:", [a3 bandwidthConfigurations])|| !-[VCMediaNegotiatorLocalConfiguration isEqualMultiwayAudioStreamSet:](self, "isEqualMultiwayAudioStreamSet:", objc_msgSend(a3, "multiwayAudioStreams"))|| !-[VCMediaNegotiatorLocalConfiguration isEqualMultiwayVideoStreamSet:](self, "isEqualMultiwayVideoStreamSet:", objc_msgSend(a3, "multiwayVideoStreams"))|| !-[VCMediaNegotiatorLocalConfiguration isEqualMediaRecorderImageTypes:](self, "isEqualMediaRecorderImageTypes:", a3)|| !-[VCMediaNegotiatorLocalConfiguration isEqualMediaRecorderVideoCodecs:](self, "isEqualMediaRecorderVideoCodecs:", a3)
    || ![(VCMediaNegotiatorLocalConfiguration *)self isEqualFaceTimeSettings:a3])
  {
    return 0;
  }
  uint64_t v6 = [a3 streamGroupConfigs];

  return [(VCMediaNegotiatorLocalConfiguration *)self isEqualStreamGroupConfigs:v6];
}

- (NSDictionary)u1StreamConfigurations
{
  return &self->_u1StreamConfigurations->super;
}

- (void)setU1StreamConfigurations:(id)a3
{
}

- (BOOL)allowRTCPFB
{
  return self->_allowRTCPFB;
}

- (void)setAllowRTCPFB:(BOOL)a3
{
  self->_allowRTCPFB = a3;
}

- (BOOL)isCaller
{
  return self->_isCaller;
}

- (void)setIsCaller:(BOOL)a3
{
  self->_isCaller = a3;
}

- (NSString)basebandCodec
{
  return self->_basebandCodec;
}

- (void)setBasebandCodec:(id)a3
{
}

- (unsigned)basebandCodecSampleRate
{
  return self->_basebandCodecSampleRate;
}

- (void)setBasebandCodecSampleRate:(unsigned int)a3
{
  self->_basebandCodecSampleRate = a3;
}

- (NSSet)bandwidthConfigurations
{
  return &self->_bandwidthConfigurations->super;
}

- (void)setBandwidthConfigurations:(id)a3
{
}

- (NSSet)captionsSenderLanguages
{
  return self->_captionsSenderLanguages;
}

- (void)setCaptionsSenderLanguages:(id)a3
{
}

- (NSSet)captionsReceiverLanguages
{
  return self->_captionsReceiverLanguages;
}

- (void)setCaptionsReceiverLanguages:(id)a3
{
}

- (void)callLogFile
{
  return self->_callLogFile;
}

- (void)setCallLogFile:(void *)a3
{
  self->_callLogFile = a3;
}

- (tagNTP)creationTime
{
  return (tagNTP)self->_creationTime.wide;
}

- (void)setCreationTime:(tagNTP)a3
{
  self->_creationTime = a3;
}

- (unsigned)mediaControlInfoVersion
{
  return self->_mediaControlInfoVersion;
}

- (void)setMediaControlInfoVersion:(unsigned __int8)a3
{
  self->_mediaControlInfoVersion = a3;
}

- (NSMutableOrderedSet)multiwayAudioStreams
{
  return self->_multiwayAudioStreams;
}

- (void)setMultiwayAudioStreams:(id)a3
{
}

- (NSMutableOrderedSet)multiwayVideoStreams
{
  return self->_multiwayVideoStreams;
}

- (void)setMultiwayVideoStreams:(id)a3
{
}

- (NSSet)mediaRecorderImageTypes
{
  return self->_mediaRecorderImageTypes;
}

- (void)setMediaRecorderImageTypes:(id)a3
{
}

- (NSSet)mediaRecorderVideoCodecs
{
  return self->_mediaRecorderVideoCodecs;
}

- (void)setMediaRecorderVideoCodecs:(id)a3
{
}

- (BOOL)SIPDisabled
{
  return self->_SIPDisabled;
}

- (void)setSIPDisabled:(BOOL)a3
{
  self->_int SIPDisabled = a3;
}

- (BOOL)secureMessagingRequired
{
  return self->_secureMessagingRequired;
}

- (void)setSecureMessagingRequired:(BOOL)a3
{
  self->_int secureMessagingRequired = a3;
}

- (unsigned)faceTimeSwitches
{
  return self->_faceTimeSwitches;
}

- (void)setFaceTimeSwitches:(unsigned int)a3
{
  self->_unsigned int faceTimeSwitches = a3;
}

- (unsigned)customVideoWidth
{
  return self->_customVideoWidth;
}

- (void)setCustomVideoWidth:(unsigned int)a3
{
  self->_customVideoWidth = a3;
}

- (unsigned)customVideoHeight
{
  return self->_customVideoHeight;
}

- (void)setCustomVideoHeight:(unsigned int)a3
{
  self->_customVideoHeight = a3;
}

- (unsigned)tilesPerVideoFrame
{
  return self->_tilesPerVideoFrame;
}

- (void)setTilesPerVideoFrame:(unsigned int)a3
{
  self->_tilesPerVideoFrame = a3;
}

- (BOOL)oneToOneModeSupported
{
  return self->_oneToOneModeSupported;
}

- (void)setOneToOneModeSupported:(BOOL)a3
{
  self->_int oneToOneModeSupported = a3;
}

- (BOOL)ltrpEnabled
{
  return self->_ltrpEnabled;
}

- (void)setLtrpEnabled:(BOOL)a3
{
  self->_ltrpEnabled = a3;
}

- (NSSet)pixelFormats
{
  return self->_pixelFormats;
}

- (void)setPixelFormats:(id)a3
{
}

- (NSSet)hdrModesSupported
{
  return self->_hdrModesSupported;
}

- (void)setHdrModesSupported:(id)a3
{
}

- (unsigned)mediaControlInfoFECFeedbackVersion
{
  return self->_mediaControlInfoFECFeedbackVersion;
}

- (void)setMediaControlInfoFECFeedbackVersion:(unsigned __int8)a3
{
  self->_int mediaControlInfoFECFeedbackVersion = a3;
}

- (unsigned)linkProbingCapabilityVersion
{
  return self->_linkProbingCapabilityVersion;
}

- (void)setLinkProbingCapabilityVersion:(unsigned __int8)a3
{
  self->_int linkProbingCapabilityVersion = a3;
}

- (NSSet)streamGroupConfigs
{
  return &self->_streamGroupConfigs->super;
}

- (CGSize)screenSize
{
  double width = self->_screenSize.width;
  double height = self->_screenSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)aspectRatioLandscape
{
  double width = self->_aspectRatioLandscape.width;
  double height = self->_aspectRatioLandscape.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)aspectRatioPortrait
{
  double width = self->_aspectRatioPortrait.width;
  double height = self->_aspectRatioPortrait.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)orientationMismatchAspectRatioLandscape
{
  double width = self->_orientationMismatchAspectRatioLandscape.width;
  double height = self->_orientationMismatchAspectRatioLandscape.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int)accessNetworkType
{
  return self->_accessNetworkType;
}

- (void)setAccessNetworkType:(int)a3
{
  self->_accessNetworkType = a3;
}

- (BOOL)fecEnabled
{
  return self->_fecEnabled;
}

- (void)setFecEnabled:(BOOL)a3
{
  self->_fecEnabled = a3;
}

- (BOOL)rtxEnabled
{
  return self->_rtxEnabled;
}

- (void)setRtxEnabled:(BOOL)a3
{
  self->_rtxEnabled = a3;
}

- (BOOL)isOneToOneAuthTagEnabled
{
  return self->_oneToOneAuthTagEnabled;
}

- (void)setOneToOneAuthTagEnabled:(BOOL)a3
{
  self->_oneToOneAuthTagEnabled = a3;
}

- (BOOL)blackFrameOnClearScreenEnabled
{
  return self->_blackFrameOnClearScreenEnabled;
}

- (void)setBlackFrameOnClearScreenEnabled:(BOOL)a3
{
  self->_blackFrameOnClearScreenEnabled = a3;
}

- (int)preferredAudioCodec
{
  return self->_preferredAudioCodec;
}

- (void)setPreferredAudioCodec:(int)a3
{
  self->_preferredAudioCodec = a3;
}

- (int)deviceRole
{
  return self->_deviceRole;
}

- (void)setDeviceRole:(int)a3
{
  self->_deviceRole = a3;
}

- (BOOL)alwaysOnAudRedEnabled
{
  return self->_alwaysOnAudRedEnabled;
}

- (void)setAlwaysOnAudRedEnabled:(BOOL)a3
{
  self->_alwaysOnAudRedEnabled = a3;
}

- (BOOL)alwaysOnAudioRedundancyEnabled
{
  return self->_alwaysOnAudioRedundancyEnabled;
}

- (void)setAlwaysOnAudioRedundancyEnabled:(BOOL)a3
{
  self->_alwaysOnAudioRedundancyEnabled = a3;
}

- (BOOL)highFecEnabled
{
  return self->_highFecEnabled;
}

- (void)setHighFecEnabled:(BOOL)a3
{
  self->_highFecEnabled = a3;
}

- (BOOL)lowFpsVideoEnabled
{
  return self->_lowFpsVideoEnabled;
}

- (void)setLowFpsVideoEnabled:(BOOL)a3
{
  self->_lowFpsVideoEnabled = a3;
}

- (BOOL)vplrFecEnabled
{
  return self->_vplrFecEnabled;
}

- (void)setVplrFecEnabled:(BOOL)a3
{
  self->_vplrFecEnabled = a3;
}

- (BOOL)rampDownBWDropEnabled
{
  return self->_rampDownBWDropEnabled;
}

- (void)setRampDownBWDropEnabled:(BOOL)a3
{
  self->_rampDownBWDropEnabled = a3;
}

- (BOOL)fastMediaDuplicationEnabled
{
  return self->_fastMediaDuplicationEnabled;
}

- (void)setFastMediaDuplicationEnabled:(BOOL)a3
{
  self->_fastMediaDuplicationEnabled = a3;
}

- (BOOL)iRATRtpEnabled
{
  return self->_iRATRtpEnabled;
}

- (void)setIRATRtpEnabled:(BOOL)a3
{
  self->_iRATRtpEnabled = a3;
}

- (BOOL)preWarmCellEnabled
{
  return self->_preWarmCellEnabled;
}

- (void)setPreWarmCellEnabled:(BOOL)a3
{
  self->_preWarmCellEnabled = a3;
}

- (BOOL)duplicateImportantPktsEnabled
{
  return self->_duplicateImportantPktsEnabled;
}

- (void)setDuplicateImportantPktsEnabled:(BOOL)a3
{
  self->_duplicateImportantPktsEnabled = a3;
}

- (BOOL)blackFrameOnClearScreenEnabledDefault
{
  return self->_blackFrameOnClearScreenEnabledDefault;
}

- (void)setBlackFrameOnClearScreenEnabledDefault:(BOOL)a3
{
  self->_blackFrameOnClearScreenEnabledDefault = a3;
}

- (BOOL)foveationIsSupported
{
  return self->_foveationIsSupported;
}

- (void)setFoveationIsSupported:(BOOL)a3
{
  self->_foveationIsSupported = a3;
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the u1StreamConfigurations dictionary", v2, v3, v4, v5, v6);
}

- (void)setupBandwidthConfigurationsWithArbiter:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate bandwidth extension configuration", v2, v3, v4, v5, v6);
}

- (void)setupBandwidthConfigurationsWithArbiter:.cold.2()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "-[VCMediaNegotiatorLocalConfiguration setupBandwidthConfigurationsWithArbiter:]";
  __int16 v6 = 1024;
  int v7 = 193;
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate default bandwidth configuration for connectionType:%d", v3, 0x22u);
}

- (void)setupBandwidthExtensionConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_12_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate bandwidth configuration for mode:%d connectionType:%d", v2, v3, v4, v5, v6);
}

- (void)setupBandwidthExtensionConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_12_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate bandwidth configuration for mode:%d connectionType:%d", v2, v3, v4, v5, v6);
}

- (void)setupBandwidthExtensionConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate bandwidth configuration for mode:%d connectionType:%d", v2, v3, v4, v5, v6);
}

@end