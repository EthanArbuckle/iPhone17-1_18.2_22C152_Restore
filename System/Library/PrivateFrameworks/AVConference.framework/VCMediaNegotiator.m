@interface VCMediaNegotiator
+ (BOOL)addMediaConfigurationsToLocalConfiguration:(id)a3 withBlob:(id)a4;
+ (BOOL)initializeLocalConfiguration:(id)a3 negotiationData:(id)a4 deviceRole:(int)a5 preferredAudioPayload:(int)a6;
+ (BOOL)validateLocalConfiguration:(id)a3;
+ (BOOL)validateMultiwayAudioStreamConfigurations:(id)a3;
+ (BOOL)validateMultiwayVideoStreamConfigurations:(id)a3;
+ (id)localConfigurationWithData:(id)a3 deviceRole:(int)a4 preferredAudioPayload:(int)a5;
+ (id)negotiatedFeaturesStringWithLocalFeaturesString:(id)a3 remoteFeaturesString:(id)a4;
+ (id)negotiationBlobFromData:(id)a3;
+ (id)newCompressedBlob:(id)a3;
+ (id)newDecompressedBlob:(id)a3;
+ (id)streamGroupIDsWithMediaBlob:(id)a3;
+ (unsigned)mappedRemoteQualityIndexForQualityIndex:(unsigned int)a3;
+ (void)dumpBlob:(id)a3 prefix:(id)a4 force:(BOOL)a5;
- (BOOL)addBandwidthSettingsForMediaBlob:(id)a3 arbiterMode:(unsigned __int8)a4 connectionType:(int)a5 maxBitrate:(unsigned int)a6;
- (BOOL)isCaller;
- (BOOL)isCellular16x9Capable;
- (BOOL)isCellular16x9EncodeCapable;
- (BOOL)isNegotiationModeForScreenShare:(int64_t)a3;
- (BOOL)isNegotiationModeValid:(int64_t)a3;
- (BOOL)isVideoStreamSupported:(int)a3;
- (BOOL)negotiateAudioDTXPayload:(id)a3;
- (BOOL)negotiateAudioPrimaryPayload:(id)a3 microphoneConfiguration:(id)a4;
- (BOOL)negotiateAudioREDPayload:(id)a3 microphoneConfiguration:(id)a4;
- (BOOL)negotiateAudioSettings:(id)a3;
- (BOOL)negotiateCaptionsWithCaptionsSettings:(id)a3;
- (BOOL)negotiateFaceTimeSettings:(id)a3;
- (BOOL)negotiateHDRMode:(id)a3 videoResults:(id)a4;
- (BOOL)negotiateMomentsWithMomentsSettings:(id)a3;
- (BOOL)negotiateMultiwayAudioStreams:(id)a3;
- (BOOL)negotiateMultiwayVideoStreams:(id)a3;
- (BOOL)negotiateScreenSettings:(id)a3;
- (BOOL)negotiateVideoSettings:(id)a3;
- (BOOL)processParameterSets:(id)a3 videoResults:(id)a4;
- (BOOL)processPixelFormats:(id)a3 videoResults:(id)a4;
- (BOOL)processRemoteNegotiationData:(id)a3;
- (BOOL)processResponseBlob:(id)a3;
- (BOOL)selectBestScreenRule:(id)a3 preferredPayloadOrder:(id)a4;
- (BOOL)selectBestVideoRuleForTransport:(unsigned __int8)a3 payload:(int)a4 encodingType:(unsigned __int8)a5 localVideoRuleCollection:(id)a6 remoteVideoSettings:(id)a7 negotiatedVideoSettings:(id)a8 isScreen:(BOOL)a9;
- (BOOL)setupAudioWithNegotiatedSettings:(id)a3;
- (BOOL)setupBandwidthSettingsForMediaBlob:(id)a3;
- (BOOL)setupScreenWithNegotiatedSettings:(id)a3;
- (BOOL)setupVideoWithNegotiatedSettings:(id)a3;
- (BOOL)usePreNegotiation;
- (VCMediaNegotiator)initWithLocalSettings:(id)a3;
- (VCMediaNegotiator)initWithMode:(int64_t)a3 localSettings:(id)a4;
- (VCMediaNegotiatorResultsCaptions)negotiatedCaptionsSettings;
- (id)getPreferredScreenPayloadList;
- (id)localeWithMediaBlobLanguage:(int)a3;
- (id)negotiationData;
- (id)newResponseBlob;
- (id)newStreamConfigFromMultiwayAudioStream:(id)a3;
- (id)newStreamConfigFromMultiwayVideoStream:(id)a3;
- (id)newStreamGroupCodecConfigForPayload:(int)a3;
- (id)selectVideoFeatureString:(id)a3 selectedPayload:(int)a4 videoConfiguration:(id)a5;
- (int)mediaBlobLanguageWithLocale:(id)a3;
- (int64_t)negotiationMode;
- (unsigned)remoteMaxBandwidthForArbiterMode:(unsigned __int8)a3 connectionType:(int)a4;
- (void)dealloc;
- (void)negotiateAudioAllowRecording:(id)a3 microphoneConfiguration:(id)a4;
- (void)negotiateAudioSecondaryPayloads:(id)a3 microphoneConfiguration:(id)a4;
- (void)negotiateAudioUseSBR:(id)a3;
- (void)negotiateRTCPFB:(id)a3 negotiatedVideoSettings:(id)a4;
- (void)negotiateTilesPerFrame:(id)a3 negotiatedSettings:(id)a4;
- (void)negotiationData;
- (void)newResponseBlob;
- (void)saveRemoteBandwidthSettingsWithMediaBlob:(id)a3;
- (void)setupCaptionsForMediaBlob:(id)a3;
- (void)setupFaceTimeSettingsForMediaBlob:(id)a3 isResponse:(BOOL)a4;
- (void)setupMomentsForMediaBlob:(id)a3;
- (void)setupMultiwayAudioStreamsForMediaBlob:(id)a3;
- (void)setupMultiwayVideoStreamsForMediaBlob:(id)a3;
@end

@implementation VCMediaNegotiator

- (VCMediaNegotiator)initWithLocalSettings:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaNegotiator;
  v4 = -[VCMediaNegotiatorBase initWithLocalSettings:](&v7, sel_initWithLocalSettings_);
  if (v4)
  {
    if (+[VCMediaNegotiator validateLocalConfiguration:a3])
    {
      v5 = objc_alloc_init(VCMediaNegotiatorResultsCaptions);
      v4->_negotiatedCaptionsSettings = v5;
      if (v5)
      {
        v4->_isCellular16x9Capable = [(VCMediaNegotiator *)v4 isCellular16x9EncodeCapable];
        return v4;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiator initWithLocalSettings:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator initWithLocalSettings:]();
      }
    }

    return 0;
  }
  return v4;
}

- (VCMediaNegotiator)initWithMode:(int64_t)a3 localSettings:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCMediaNegotiator;
  v5 = [(VCMediaNegotiatorBase *)&v8 initWithLocalSettings:a4];
  v6 = v5;
  if (v5)
  {
    v5->_negotiationMode = a3;
    if (![(VCMediaNegotiator *)v5 isNegotiationModeValid:a3])
    {

      return 0;
    }
  }
  return v6;
}

- (BOOL)isCaller
{
  return [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings isCaller];
}

- (BOOL)isCellular16x9EncodeCapable
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 2), "videoRuleCollections");
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v3 = (void *)[v2 supportedPayloads];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v36;
    uint64_t v21 = *(void *)v36;
    v22 = v3;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = objc_msgSend(v2, "getVideoRulesForTransport:payload:encodingType:", 2, objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "unsignedIntValue", v21), 1);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v29 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v31;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v31 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v30 + 1) + 8 * j);
              int v14 = [v13 iWidth];
              if ([v13 iHeight] * v14 == 130560)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v19 = VRTraceErrorLogLevelToCSTR();
                  v20 = *MEMORY[0x1E4F47A50];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v24 = v19;
                    __int16 v25 = 2080;
                    v26 = "-[VCMediaNegotiator isCellular16x9EncodeCapable]";
                    __int16 v27 = 1024;
                    int v28 = 104;
                    _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Capable of streaming 16x9 cellular!", buf, 0x1Cu);
                  }
                }
                return 1;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v29 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
        uint64_t v6 = v21;
        v3 = v22;
      }
      uint64_t v5 = [v22 countByEnumeratingWithState:&v35 objects:v34 count:16];
    }
    while (v5);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E4F47A50];
    BOOL v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v17) {
      return result;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v24 = v15;
    __int16 v25 = 2080;
    v26 = "-[VCMediaNegotiator isCellular16x9EncodeCapable]";
    __int16 v27 = 1024;
    int v28 = 109;
    _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Not capable of streaming 16x9 cellular!", buf, 0x1Cu);
  }
  return 0;
}

- (BOOL)isNegotiationModeValid:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) >= 0xA && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaNegotiator isNegotiationModeValid:]();
    }
  }
  return v3 < 0xA;
}

- (BOOL)isNegotiationModeForScreenShare:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0xA)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v3 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v3) {
        return v3;
      }
      -[VCMediaNegotiator isNegotiationModeForScreenShare:]();
    }
    LOBYTE(v3) = 0;
    return v3;
  }
  return (0x153u >> (a3 - 1)) & 1;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiator;
  [(VCMediaNegotiatorBase *)&v3 dealloc];
}

- (id)negotiationData
{
  objc_super v3 = (__objc2_class_ro **)(VCMediaControlInfo + 32);
  if (![(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings isCaller])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator negotiationData].cold.7();
      }
    }
    goto LABEL_41;
  }
  uint64_t v4 = objc_alloc_init(VCMediaNegotiationBlob);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator negotiationData]();
      }
    }
LABEL_41:
    uint64_t v21 = 0;
    uint64_t v19 = 0;
    long long v31 = 0;
    uint64_t v5 = 0;
LABEL_52:
    long long v30 = 0;
    goto LABEL_34;
  }
  uint64_t v5 = v4;
  [(VCMediaNegotiationBlob *)v4 setBlobVersion:2];
  [(VCMediaNegotiationBlob *)v5 setUserAgent:@"Viceroy 1.7.0/GK"];
  [(VCMediaNegotiationBlob *)v5 setBasebandCodecSampleRate:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings basebandCodecSampleRate]];
  [(VCMediaNegotiationBlob *)v5 setBasebandCodec:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings basebandCodec]];
  [(VCMediaNegotiationBlob *)v5 setNtpTime:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings creationTime]];
  [(VCMediaNegotiationBlob *)v5 setMediaControlInfoVersion:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaControlInfoVersion]];
  if ([(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings accessNetworkType]) {
    [(VCMediaNegotiationBlob *)v5 setAccessNetworkType:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings accessNetworkType]];
  }
  BOOL v6 = self->_negotiationMode != 1;
  [(VCMediaNegotiationBlob *)v5 setAllowDynamicMaxBitrate:v6];
  [(VCMediaNegotiationBlob *)v5 setAllowsContentsChangeWithAspectPreservation:v6];
  if (![(VCMediaNegotiator *)self setupBandwidthSettingsForMediaBlob:v5])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator negotiationData].cold.6();
      }
    }
LABEL_51:
    uint64_t v21 = 0;
    uint64_t v19 = 0;
    long long v31 = 0;
    goto LABEL_52;
  }
  id v7 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaConfigurationForMediaType:1];
  if (v7)
  {
    objc_super v8 = [[VCMediaNegotiationBlobAudioSettings alloc] initWithAudioConfiguration:v7];
    if (v8)
    {
      v47 = v8;
      -[VCMediaNegotiationBlob setAudioSettings:](v5, "setAudioSettings:");
      goto LABEL_10;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator negotiationData].cold.5();
      }
    }
    goto LABEL_51;
  }
  v47 = 0;
LABEL_10:
  id v9 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaConfigurationForMediaType:2];
  uint64_t v10 = [v9 videoRuleCollections];
  p_info = VCMediaControlInfo.info;
  v12 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__currentIndexForLossRate;
  if (v10)
  {
    uint64_t v13 = v10;
    v45 = [VCMediaNegotiationBlobVideoSettings alloc];
    unsigned int v43 = [v9 ssrc];
    BOOL v14 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings allowRTCPFB];
    uint64_t v15 = [v9 videoFeatureStrings];
    BOOL isCellular16x9Capable = self->_isCellular16x9Capable;
    uint64_t v17 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings tilesPerVideoFrame];
    LOBYTE(v33) = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings ltrpEnabled];
    uint64_t v18 = [(VCMediaNegotiationBlobVideoSettings *)v45 initWithSSRC:v43 allowRTCPFB:v14 videoRuleCollections:v13 featureStrings:v15 isCellular16x9Capable:isCellular16x9Capable tilesPerFrame:v17 ltrpEnabled:v33 pixelFormats:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings pixelFormats] hdrModesSupported:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings hdrModesSupported]];
    if (!v18)
    {
      objc_super v3 = (__objc2_class_ro **)(VCMediaControlInfo + 32);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiator negotiationData].cold.4();
        }
      }
      uint64_t v21 = 0;
      uint64_t v19 = 0;
      goto LABEL_61;
    }
    uint64_t v19 = (void *)v18;
    [(VCMediaNegotiationBlob *)v5 setVideoSettings:v18];
    v12 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__currentIndexForLossRate;
    p_info = (__objc2_class_ro **)(VCMediaControlInfo + 32);
  }
  else
  {
    uint64_t v19 = 0;
  }
  id v20 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaConfigurationForMediaType:3];
  uint64_t v21 = (void *)[v20 videoRuleCollections];
  if (v21)
  {
    v46 = v19;
    id v44 = objc_alloc((Class)(p_info + 141));
    unsigned int v42 = [v20 ssrc];
    BOOL v41 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings allowRTCPFB];
    uint64_t v40 = [v20 videoFeatureStrings];
    unsigned int v39 = *((unsigned __int8 *)&self->super.super.isa + v12[471]);
    unsigned int v38 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings customVideoWidth];
    unsigned int v37 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings customVideoHeight];
    unsigned int v36 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings tilesPerVideoFrame];
    BOOL v22 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings ltrpEnabled];
    v23 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings pixelFormats];
    uint64_t v24 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings hdrModesSupported];
    BOOL v25 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings fecEnabled];
    BOOL v26 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings rtxEnabled];
    BOOL v27 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings blackFrameOnClearScreenEnabled];
    BYTE3(v35) = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings foveationIsSupported];
    BYTE2(v35) = v27;
    BYTE1(v35) = v26;
    LOBYTE(v35) = v25;
    LOBYTE(v34) = v22;
    uint64_t v28 = objc_msgSend(v44, "initWithScreenSSRC:allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:customVideoWidth:customVideoHeight:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:fecEnabled:rtxEnabled:blackFrameOnClearScreenEnabled:foveationSupported:", v42, v41, v21, v40, v39, v38, __PAIR64__(v36, v37), v34, v23, v24, v35);
    if (!v28)
    {
      objc_super v3 = (__objc2_class_ro **)(VCMediaControlInfo + 32);
      uint64_t v19 = v46;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiator negotiationData]();
        }
      }
      uint64_t v21 = 0;
      goto LABEL_61;
    }
    uint64_t v21 = (void *)v28;
    [(VCMediaNegotiationBlob *)v5 setScreenSettings:v28];
    objc_super v3 = (__objc2_class_ro **)(VCMediaControlInfo + 32);
    uint64_t v19 = v46;
  }
  else
  {
    objc_super v3 = VCMediaControlInfo.info;
  }
  if ([(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings captionsSenderLanguages]|| [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings captionsReceiverLanguages])
  {
    [(VCMediaNegotiator *)self setupCaptionsForMediaBlob:v5];
  }
  if ([(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaRecorderVideoCodecs]|| [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaRecorderImageTypes])
  {
    [(VCMediaNegotiator *)self setupMomentsForMediaBlob:v5];
  }
  if ([(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings secureMessagingRequired]|| [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings SIPDisabled]|| [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings faceTimeSwitches]|| [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings oneToOneModeSupported]|| [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaControlInfoFECFeedbackVersion]|| [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings linkProbingCapabilityVersion])
  {
    [(VCMediaNegotiator *)self setupFaceTimeSettingsForMediaBlob:v5 isResponse:0];
  }
  [(VCMediaNegotiator *)self setupMultiwayAudioStreamsForMediaBlob:v5];
  [(VCMediaNegotiator *)self setupMultiwayVideoStreamsForMediaBlob:v5];
  v29 = objc_msgSend(v3 + 151, "newCompressedBlob:", -[VCMediaNegotiationBlob data](v5, "data"));
  if (!v29)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator negotiationData]();
      }
    }
LABEL_61:
    long long v30 = 0;
    goto LABEL_33;
  }
  long long v30 = v29;
  -[VCMediaNegotiationBlob printWithTitle:blobSize:logFile:](v5, "printWithTitle:blobSize:logFile:", @"Created invite media blob", [v29 length], -[VCMediaNegotiatorLocalConfiguration callLogFile](self->super._localSettings, "callLogFile"));
LABEL_33:
  long long v31 = v47;
LABEL_34:

  [v3 + 151 dumpBlob:v30 prefix:@"mediablob_invite" force:0];
  return v30;
}

- (BOOL)processRemoteNegotiationData:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  +[VCMediaNegotiator dumpBlob:a3 prefix:@"mediablob_invite_remote" force:0];
  if ([(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings isCaller])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processRemoteNegotiationData:]();
      }
    }
    goto LABEL_37;
  }
  id v5 = +[VCMediaNegotiator newDecompressedBlob:a3];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processRemoteNegotiationData:]();
      }
    }
LABEL_37:
    BOOL v6 = 0;
LABEL_65:
    id v7 = 0;
LABEL_66:
    BOOL v13 = 0;
    goto LABEL_30;
  }
  BOOL v6 = v5;
  id v7 = [[VCMediaNegotiationBlob alloc] initWithData:v5];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processRemoteNegotiationData:]();
      }
    }
    goto LABEL_65;
  }
  -[VCMediaNegotiationBlob printWithTitle:blobSize:logFile:](v7, "printWithTitle:blobSize:logFile:", @"Received invite media blob", [v6 length], -[VCMediaNegotiatorLocalConfiguration callLogFile](self->super._localSettings, "callLogFile"));
  [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setSupportsDynamicMaxBitrate:[(VCMediaNegotiationBlob *)v7 allowDynamicMaxBitrate]];
  [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setRemoteBlobVersion:[(VCMediaNegotiationBlob *)v7 blobVersion]];
  [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setRemoteUserAgent:[(VCMediaNegotiationBlob *)v7 userAgent]];
  [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setRemoteBasebandCodec:[(VCMediaNegotiationBlob *)v7 basebandCodec]];
  [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setRemoteBasebandCodecSampleRate:[(VCMediaNegotiationBlob *)v7 basebandCodecSampleRate]];
  unsigned int v8 = [(VCMediaNegotiationBlob *)v7 mediaControlInfoVersion];
  if (v8 >= 2) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = v8;
  }
  [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setMediaControlInfoVersion:v9];
  [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setControlChannelVersion:1];
  [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setAccessNetworkType:[(VCMediaNegotiationBlob *)v7 accessNetworkType]];
  [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setRemoteBlobCreationTime:[(VCMediaNegotiationBlob *)v7 ntpTime]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [(VCMediaNegotiatorResults *)self->super._negotiatedSettings mediaControlInfoVersion];
      *(_DWORD *)uint64_t v15 = 136315906;
      *(void *)&v15[4] = v10;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCMediaNegotiator processRemoteNegotiationData:]";
      __int16 v18 = 1024;
      int v19 = 302;
      __int16 v20 = 1024;
      BOOL v21 = v12 == 2;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch after negotiation updatedAFRCHeaderEnabled %d", v15, 0x22u);
    }
  }
  -[VCMediaNegotiator saveRemoteBandwidthSettingsWithMediaBlob:](self, "saveRemoteBandwidthSettingsWithMediaBlob:", v7, *(void *)v15);
  if ([(VCMediaNegotiationBlob *)v7 faceTimeSettings]
    && ![(VCMediaNegotiator *)self negotiateFaceTimeSettings:[(VCMediaNegotiationBlob *)v7 faceTimeSettings]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processRemoteNegotiationData:]1();
      }
    }
    goto LABEL_66;
  }
  if (![(VCMediaNegotiationBlob *)v7 hasBlobVersion]
    || ![(VCMediaNegotiationBlob *)v7 blobVersion])
  {
    [(VCMediaNegotiationBlobAudioSettings *)[(VCMediaNegotiationBlob *)v7 audioSettings] setUseSBR:0];
  }
  if ([(VCMediaNegotiationBlob *)v7 audioSettings]
    && ![(VCMediaNegotiator *)self negotiateAudioSettings:[(VCMediaNegotiationBlob *)v7 audioSettings]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processRemoteNegotiationData:]0();
      }
    }
    goto LABEL_66;
  }
  if ([(VCMediaNegotiationBlob *)v7 videoSettings]
    && ![(VCMediaNegotiator *)self negotiateVideoSettings:[(VCMediaNegotiationBlob *)v7 videoSettings]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processRemoteNegotiationData:].cold.9();
      }
    }
    goto LABEL_66;
  }
  if ([(VCMediaNegotiationBlob *)v7 screenSettings]
    && ![(VCMediaNegotiator *)self negotiateScreenSettings:[(VCMediaNegotiationBlob *)v7 screenSettings]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processRemoteNegotiationData:].cold.8();
      }
    }
    goto LABEL_66;
  }
  if ([(VCMediaNegotiationBlob *)v7 captionsSettings]
    && ![(VCMediaNegotiator *)self negotiateCaptionsWithCaptionsSettings:[(VCMediaNegotiationBlob *)v7 captionsSettings]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processRemoteNegotiationData:].cold.7();
      }
    }
    goto LABEL_66;
  }
  if ([(VCMediaNegotiationBlob *)v7 momentsSettings]
    && ![(VCMediaNegotiator *)self negotiateMomentsWithMomentsSettings:[(VCMediaNegotiationBlob *)v7 momentsSettings]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processRemoteNegotiationData:].cold.6();
      }
    }
    goto LABEL_66;
  }
  if ([(NSMutableArray *)[(VCMediaNegotiationBlob *)v7 multiwayAudioStreams] count]
    && ![(VCMediaNegotiator *)self negotiateMultiwayAudioStreams:[(VCMediaNegotiationBlob *)v7 multiwayAudioStreams]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processRemoteNegotiationData:].cold.5();
      }
    }
    goto LABEL_66;
  }
  if ([(NSMutableArray *)[(VCMediaNegotiationBlob *)v7 multiwayVideoStreams] count]
    && ![(VCMediaNegotiator *)self negotiateMultiwayVideoStreams:[(VCMediaNegotiationBlob *)v7 multiwayVideoStreams]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processRemoteNegotiationData:].cold.4();
      }
    }
    goto LABEL_66;
  }
  BOOL v13 = 1;
LABEL_30:

  return v13;
}

+ (id)negotiationBlobFromData:(id)a3
{
  id v3 = +[VCMediaNegotiator newDecompressedBlob:](VCMediaNegotiator, "newDecompressedBlob:");
  uint64_t v4 = [[VCMediaNegotiationBlob alloc] initWithData:v3];

  return v4;
}

+ (id)localConfigurationWithData:(id)a3 deviceRole:(int)a4 preferredAudioPayload:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  unsigned int v8 = objc_alloc_init(VCMediaNegotiatorLocalConfiguration);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiator localConfigurationWithData:deviceRole:preferredAudioPayload:]();
      }
    }
    goto LABEL_11;
  }
  if (!+[VCMediaNegotiator initializeLocalConfiguration:v8 negotiationData:a3 deviceRole:v6 preferredAudioPayload:v5])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiator localConfigurationWithData:deviceRole:preferredAudioPayload:]();
      }
    }
LABEL_11:
    uint64_t v9 = 0;
    goto LABEL_4;
  }
  uint64_t v9 = v8;
LABEL_4:

  return v9;
}

+ (BOOL)addMediaConfigurationsToLocalConfiguration:(id)a3 withBlob:(id)a4
{
  uint64_t v6 = (void *)[a4 videoSettings];
  uint64_t v7 = [a4 screenSettings];
  unsigned int v8 = objc_msgSend((id)objc_msgSend(a4, "audioSettings"), "newMediaNegotiatorAudioConfiguration");
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiator addMediaConfigurationsToLocalConfiguration:withBlob:]();
      }
    }
    goto LABEL_17;
  }
  [a3 setMediaConfiguration:v8 forMediaType:1];
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "videoSettings"), "newCameraConfiguration");
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiator addMediaConfigurationsToLocalConfiguration:withBlob:]();
      }
    }
LABEL_17:
    uint64_t v6 = 0;
LABEL_18:
    uint64_t v11 = 0;
    BOOL v12 = 0;
    goto LABEL_10;
  }
  uint64_t v6 = (void *)v9;
  [a3 setMediaConfiguration:v9 forMediaType:2];
LABEL_5:
  if (!v7)
  {
    uint64_t v11 = 0;
    goto LABEL_9;
  }
  uint64_t v10 = objc_msgSend((id)objc_msgSend(a4, "screenSettings"), "newScreenConfigurationWithCameraConfiguration:", v6);
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiator addMediaConfigurationsToLocalConfiguration:withBlob:]();
      }
    }
    goto LABEL_18;
  }
  uint64_t v11 = (void *)v10;
  [a3 setMediaConfiguration:v10 forMediaType:3];
LABEL_9:
  BOOL v12 = 1;
LABEL_10:

  return v12;
}

+ (BOOL)initializeLocalConfiguration:(id)a3 negotiationData:(id)a4 deviceRole:(int)a5 preferredAudioPayload:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v11 = +[VCMediaNegotiator negotiationBlobFromData:a4];
  if (v11)
  {
    BOOL v12 = v11;
    id v42 = a1;
    uint64_t v13 = [v11 ntpTime];
    [a3 setDeviceRole:v7];
    [a3 setPreferredAudioCodec:v6];
    [a3 setCreationTime:v13];
    objc_msgSend(a3, "setMediaControlInfoVersion:", objc_msgSend(v12, "mediaControlInfoVersion"));
    objc_msgSend(a3, "setAllowRTCPFB:", objc_msgSend((id)objc_msgSend(v12, "videoSettings"), "allowRTCPFB"));
    [a3 setIsCaller:1];
    objc_msgSend(a3, "setAccessNetworkType:", objc_msgSend(v12, "accessNetworkType"));
    objc_msgSend(a3, "setCustomVideoWidth:", objc_msgSend((id)objc_msgSend(v12, "screenSettings"), "customVideoWidth"));
    objc_msgSend(a3, "setCustomVideoHeight:", objc_msgSend((id)objc_msgSend(v12, "screenSettings"), "customVideoHeight"));
    objc_msgSend(a3, "setTilesPerVideoFrame:", objc_msgSend((id)objc_msgSend(v12, "screenSettings"), "tilesPerFrame"));
    objc_msgSend(a3, "setBlackFrameOnClearScreenEnabled:", objc_msgSend((id)objc_msgSend(v12, "screenSettings"), "blackFrameOnClearScreenEnabled"));
    objc_msgSend(a3, "setFoveationIsSupported:", objc_msgSend((id)objc_msgSend(v12, "screenSettings"), "foveationSupported"));
    objc_msgSend(a3, "setBasebandCodec:", objc_msgSend(v12, "basebandCodec"));
    objc_msgSend(a3, "setBasebandCodecSampleRate:", objc_msgSend(v12, "basebandCodecSampleRate"));
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    BOOL v14 = (void *)[v12 multiwayAudioStreams];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v59 objects:v58 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v60;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v60 != v17) {
            objc_enumerationMutation(v14);
          }
          int v19 = (void *)[*(id *)(*((void *)&v59 + 1) + 8 * v18) newMultiwayAudioStream];
          [a3 addMultiwayAudioStream:v19];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v59 objects:v58 count:16];
      }
      while (v16);
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    __int16 v20 = (void *)[v12 multiwayVideoStreams];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v54 objects:v53 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v55;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v55 != v23) {
            objc_enumerationMutation(v20);
          }
          BOOL v25 = (void *)[*(id *)(*((void *)&v54 + 1) + 8 * v24) newMultiwayVideoStream];
          [a3 addMultiwayVideoStream:v25];

          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v54 objects:v53 count:16];
      }
      while (v22);
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    BOOL v26 = objc_msgSend(v12, "bandwidthSettings", a4);
    uint64_t v27 = [v26 countByEnumeratingWithState:&v49 objects:v48 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v50;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v50 != v29) {
            objc_enumerationMutation(v26);
          }
          long long v31 = (void *)[*(id *)(*((void *)&v49 + 1) + 8 * v30) newBandwidthConfigurations];
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          uint64_t v32 = [v31 countByEnumeratingWithState:&v44 objects:v43 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v45;
            do
            {
              uint64_t v35 = 0;
              do
              {
                if (*(void *)v45 != v34) {
                  objc_enumerationMutation(v31);
                }
                [a3 addBandwidthConfiguration:*(void *)(*((void *)&v44 + 1) + 8 * v35++)];
              }
              while (v33 != v35);
              uint64_t v33 = [v31 countByEnumeratingWithState:&v44 objects:v43 count:16];
            }
            while (v33);
          }

          ++v30;
        }
        while (v30 != v28);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v49 objects:v48 count:16];
      }
      while (v28);
    }
    unsigned int v36 = objc_msgSend((id)objc_msgSend(v12, "momentsSettings"), "newVideoCodecSet");
    [a3 setMediaRecorderVideoCodecs:v36];

    unsigned int v37 = objc_msgSend((id)objc_msgSend(v12, "momentsSettings"), "newImageTypeSet");
    [a3 setMediaRecorderImageTypes:v37];

    unsigned int v38 = (void *)[v12 faceTimeSettings];
    objc_msgSend(a3, "setSIPDisabled:", objc_msgSend(v38, "SIPDisabled"));
    objc_msgSend(a3, "setSecureMessagingRequired:", objc_msgSend(v38, "secureMessagingRequired"));
    objc_msgSend(a3, "setFaceTimeSwitches:", objc_msgSend(v38, "switches"));
    objc_msgSend(a3, "setOneToOneModeSupported:", objc_msgSend(v38, "oneToOneModeSupported"));
    objc_msgSend(a3, "setMediaControlInfoFECFeedbackVersion:", objc_msgSend(v38, "mediaControlInfoFECFeedbackVersion"));
    objc_msgSend(a3, "setLinkProbingCapabilityVersion:", objc_msgSend(v38, "linkProbingCapabilityVersion"));
    if ([v42 addMediaConfigurationsToLocalConfiguration:a3 withBlob:v12])
    {
      objc_msgSend(v12, "printWithTitle:blobSize:logFile:", @"Cached invite media blob", objc_msgSend(v41, "length"), objc_msgSend(a3, "callLogFile"));
      LOBYTE(v39) = 1;
      return v39;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v39 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v39) {
        return v39;
      }
      +[VCMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v39 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v39) {
      return v39;
    }
    +[VCMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]();
  }
  LOBYTE(v39) = 0;
  return v39;
}

- (id)newResponseBlob
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  p_info = (__objc2_class_ro **)(VCMediaControlInfo + 32);
  if ([(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings isCaller])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator newResponseBlob]();
      }
    }
    goto LABEL_46;
  }
  uint64_t v4 = objc_alloc_init(VCMediaNegotiationBlob);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator newResponseBlob]();
      }
    }
LABEL_46:
    unsigned int v38 = 0;
    unsigned int v36 = 0;
    BOOL v25 = 0;
    uint64_t v17 = 0;
    uint64_t v10 = 0;
    uint64_t v5 = 0;
    goto LABEL_39;
  }
  uint64_t v5 = v4;
  [(VCMediaNegotiationBlob *)v4 setBlobVersion:2];
  [(VCMediaNegotiationBlob *)v5 setUserAgent:@"Viceroy 1.7.0/GK"];
  [(VCMediaNegotiationBlob *)v5 setBasebandCodecSampleRate:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings basebandCodecSampleRate]];
  [(VCMediaNegotiationBlob *)v5 setBasebandCodec:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings basebandCodec]];
  [(VCMediaNegotiationBlob *)v5 setMediaControlInfoVersion:[(VCMediaNegotiatorResults *)self->super._negotiatedSettings mediaControlInfoVersion]];
  if (self->_negotiationMode == 1)
  {
    [(VCMediaNegotiationBlob *)v5 setAllowDynamicMaxBitrate:0];
    BOOL v6 = 0;
  }
  else
  {
    [(VCMediaNegotiationBlob *)v5 setAllowDynamicMaxBitrate:1];
    BOOL v6 = [(VCMediaNegotiatorResults *)self->super._negotiatedSettings supportsDynamicMaxBitrate];
  }
  [(VCMediaNegotiationBlob *)v5 setAllowsContentsChangeWithAspectPreservation:v6];
  if (![(VCMediaNegotiator *)self setupBandwidthSettingsForMediaBlob:v5])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator newResponseBlob].cold.8();
      }
    }
    goto LABEL_57;
  }
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC5208];
  id v8 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaConfigurationForMediaType:1];
  if (!v7)
  {
    uint64_t v17 = 0;
    uint64_t v10 = 0;
    goto LABEL_23;
  }
  uint64_t v9 = -[VCMediaNegotiatorAudioConfiguration initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:]([VCMediaNegotiatorAudioConfiguration alloc], "initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:", [v7 allowSwitching], objc_msgSend(v7, "allowRecording"), 1, objc_msgSend(v8, "ssrc"), objc_msgSend(v8, "audioUnitNumber"));
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
      unsigned int v38 = 0;
      unsigned int v36 = 0;
      BOOL v25 = 0;
      uint64_t v17 = 0;
      uint64_t v10 = 0;
      goto LABEL_72;
    }
    VRTraceErrorLogLevelToCSTR();
    p_info = (__objc2_class_ro **)(VCMediaControlInfo + 32);
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaNegotiator newResponseBlob].cold.6();
    }
LABEL_57:
    unsigned int v38 = 0;
    unsigned int v36 = 0;
    BOOL v25 = 0;
    uint64_t v17 = 0;
    uint64_t v10 = 0;
    goto LABEL_39;
  }
  uint64_t v10 = v9;
  -[VCMediaNegotiatorAudioConfiguration addAudioPayload:isSecondary:](v9, "addAudioPayload:isSecondary:", [v7 primaryPayload], 0);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v11 = (void *)[v7 secondaryPayloads];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v58 objects:v57 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v59 != v14) {
          objc_enumerationMutation(v11);
        }
        -[VCMediaNegotiatorAudioConfiguration addAudioPayload:isSecondary:](v10, "addAudioPayload:isSecondary:", [*(id *)(*((void *)&v58 + 1) + 8 * i) intValue], 1);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v58 objects:v57 count:16];
    }
    while (v13);
  }
  if ([v7 redPayload] != 128) {
    -[VCMediaNegotiatorAudioConfiguration addAudioPayload:isSecondary:](v10, "addAudioPayload:isSecondary:", [v7 redPayload], 1);
  }
  if ([v7 dtxPayload] != 128) {
    -[VCMediaNegotiatorAudioConfiguration addAudioPayload:isSecondary:](v10, "addAudioPayload:isSecondary:", [v7 dtxPayload], 1);
  }
  uint64_t v16 = [[VCMediaNegotiationBlobAudioSettings alloc] initWithAudioConfiguration:v10];
  if (!v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      p_info = (__objc2_class_ro **)(VCMediaControlInfo + 32);
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator newResponseBlob].cold.7();
      }
      unsigned int v38 = 0;
      unsigned int v36 = 0;
      BOOL v25 = 0;
      uint64_t v17 = 0;
      goto LABEL_39;
    }
    unsigned int v38 = 0;
    unsigned int v36 = 0;
    BOOL v25 = 0;
    uint64_t v17 = 0;
LABEL_72:
    p_info = (__objc2_class_ro **)(VCMediaControlInfo + 32);
    goto LABEL_39;
  }
  uint64_t v17 = v16;
  [(VCMediaNegotiationBlob *)v5 setAudioSettings:v16];
LABEL_23:
  long long v56 = v5;
  uint64_t v18 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC5220];
  id v19 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaConfigurationForMediaType:2];
  long long v55 = v17;
  if ([v18 isSupported])
  {
    v53 = [VCMediaNegotiationBlobVideoSettings alloc];
    unsigned int v51 = [v19 ssrc];
    unsigned int v49 = [v18 isRTCPFBEnabled];
    uint64_t v20 = [v18 videoRuleCollections];
    uint64_t v21 = [v19 videoFeatureStrings];
    BOOL isCellular16x9Capable = self->_isCellular16x9Capable;
    uint64_t v23 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings tilesPerVideoFrame];
    LOBYTE(v40) = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings ltrpEnabled];
    uint64_t v24 = -[VCMediaNegotiationBlobVideoSettings initWithSSRC:allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:](v53, "initWithSSRC:allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:", v51, v49, v20, v21, isCellular16x9Capable, v23, v40, [v18 pixelFormats], objc_msgSend(v18, "hdrModesNegotiated"));
    if (!v24)
    {
      p_info = (__objc2_class_ro **)(VCMediaControlInfo + 32);
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      {
        unsigned int v38 = 0;
        unsigned int v36 = 0;
        BOOL v25 = 0;
      }
      else
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiator newResponseBlob]();
        }
        unsigned int v38 = 0;
        unsigned int v36 = 0;
        BOOL v25 = 0;
      }
      goto LABEL_39;
    }
    BOOL v25 = (void *)v24;
    [(VCMediaNegotiationBlob *)v5 setVideoSettings:v24];
  }
  else
  {
    BOOL v25 = 0;
  }
  BOOL v26 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC5238];
  id v27 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaConfigurationForMediaType:3];
  if (![v26 isSupported])
  {
    unsigned int v36 = 0;
    p_info = VCMediaControlInfo.info;
    goto LABEL_31;
  }
  long long v54 = v25;
  uint64_t v28 = [VCMediaNegotiationBlobVideoSettings alloc];
  unsigned int v52 = [v27 ssrc];
  unsigned int v50 = [v26 isRTCPFBEnabled];
  uint64_t v48 = [v26 videoRuleCollections];
  uint64_t v47 = [v26 featureStrings];
  BOOL v46 = self->_isCellular16x9Capable;
  unsigned int v45 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings customVideoWidth];
  unsigned int v44 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings customVideoHeight];
  unsigned int v43 = [v26 tilesPerFrame];
  char v29 = [v26 ltrpEnabled];
  uint64_t v30 = [v26 pixelFormats];
  uint64_t v31 = [v26 hdrModesNegotiated];
  char v32 = [v26 fecEnabled];
  char v33 = [v26 rtxEnabled];
  char v34 = [v26 blackFrameOnClearScreenEnabled];
  BYTE3(v42) = [v26 foveationIsSupported];
  BYTE2(v42) = v34;
  BYTE1(v42) = v33;
  LOBYTE(v42) = v32;
  LOBYTE(v41) = v29;
  uint64_t v35 = -[VCMediaNegotiationBlobVideoSettings initWithScreenSSRC:allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:customVideoWidth:customVideoHeight:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:fecEnabled:rtxEnabled:blackFrameOnClearScreenEnabled:foveationSupported:](v28, "initWithScreenSSRC:allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:customVideoWidth:customVideoHeight:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:fecEnabled:rtxEnabled:blackFrameOnClearScreenEnabled:foveationSupported:", v52, v50, v48, v47, v46, v45, __PAIR64__(v43, v44), v41, v30, v31, v42);
  uint64_t v5 = v56;
  if (v35)
  {
    unsigned int v36 = (void *)v35;
    [(VCMediaNegotiationBlob *)v56 setScreenSettings:v35];
    p_info = (__objc2_class_ro **)(VCMediaControlInfo + 32);
    BOOL v25 = v54;
    uint64_t v17 = v55;
LABEL_31:
    if (self->_negotiatedCaptionsSettings) {
      [(VCMediaNegotiator *)self setupCaptionsForMediaBlob:v5];
    }
    if (self->super._negotiatedMediaRecorderSettings) {
      [(VCMediaNegotiator *)self setupMomentsForMediaBlob:v5];
    }
    if (self->super._negotiatedFaceTimeSettings) {
      [(VCMediaNegotiator *)self setupFaceTimeSettingsForMediaBlob:v5 isResponse:1];
    }
    unsigned int v37 = objc_msgSend(p_info + 151, "newCompressedBlob:", -[VCMediaNegotiationBlob data](v5, "data"));
    if (v37)
    {
      unsigned int v38 = v37;
      -[VCMediaNegotiationBlob printWithTitle:blobSize:logFile:](v5, "printWithTitle:blobSize:logFile:", @"Created response media blob", [v37 length], -[VCMediaNegotiatorLocalConfiguration callLogFile](self->super._localSettings, "callLogFile"));
      self->_usePreNegotiation = 1;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiator newResponseBlob].cold.5();
        }
      }
      unsigned int v38 = 0;
    }
    goto LABEL_39;
  }
  p_info = (__objc2_class_ro **)(VCMediaControlInfo + 32);
  BOOL v25 = v54;
  uint64_t v17 = v55;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaNegotiator newResponseBlob].cold.4();
    }
  }
  unsigned int v38 = 0;
  unsigned int v36 = 0;
LABEL_39:

  [p_info + 151 dumpBlob:v38 prefix:@"mediablob_response" force:0];
  return v38;
}

- (BOOL)processResponseBlob:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  +[VCMediaNegotiator dumpBlob:a3 prefix:@"mediablob_response_remote" force:0];
  if (![(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings isCaller])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processResponseBlob:]0();
      }
    }
    goto LABEL_30;
  }
  id v5 = +[VCMediaNegotiator newDecompressedBlob:a3];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processResponseBlob:]();
      }
    }
LABEL_30:
    BOOL v6 = 0;
LABEL_53:
    BOOL v11 = 0;
    uint64_t v7 = 0;
    goto LABEL_23;
  }
  BOOL v6 = v5;
  uint64_t v7 = [[VCMediaNegotiationBlob alloc] initWithData:v5];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processResponseBlob:]();
      }
    }
    goto LABEL_53;
  }
  -[VCMediaNegotiationBlob printWithTitle:blobSize:logFile:](v7, "printWithTitle:blobSize:logFile:", @"Received response media blob", [v6 length], -[VCMediaNegotiatorLocalConfiguration callLogFile](self->super._localSettings, "callLogFile"));
  [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setSupportsDynamicMaxBitrate:[(VCMediaNegotiationBlob *)v7 allowDynamicMaxBitrate]];
  [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setRemoteUserAgent:[(VCMediaNegotiationBlob *)v7 userAgent]];
  [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setRemoteBasebandCodec:[(VCMediaNegotiationBlob *)v7 basebandCodec]];
  [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setRemoteBasebandCodecSampleRate:[(VCMediaNegotiationBlob *)v7 basebandCodecSampleRate]];
  [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setAccessNetworkType:[(VCMediaNegotiationBlob *)v7 accessNetworkType]];
  [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setMediaControlInfoVersion:[(VCMediaNegotiationBlob *)v7 mediaControlInfoVersion]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [(VCMediaNegotiatorResults *)self->super._negotiatedSettings mediaControlInfoVersion];
      *(_DWORD *)uint64_t v13 = 136315906;
      *(void *)&v13[4] = v8;
      __int16 v14 = 2080;
      uint64_t v15 = "-[VCMediaNegotiator processResponseBlob:]";
      __int16 v16 = 1024;
      int v17 = 646;
      __int16 v18 = 1024;
      BOOL v19 = v10 == 2;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch after negotiation updatedAFRCHeaderEnabled %d", v13, 0x22u);
    }
  }
  -[VCMediaNegotiator saveRemoteBandwidthSettingsWithMediaBlob:](self, "saveRemoteBandwidthSettingsWithMediaBlob:", v7, *(void *)v13);
  if (![(VCMediaNegotiationBlob *)v7 hasBlobVersion]
    || ![(VCMediaNegotiationBlob *)v7 blobVersion])
  {
    [(VCMediaNegotiationBlobAudioSettings *)[(VCMediaNegotiationBlob *)v7 audioSettings] setUseSBR:0];
  }
  if ([(VCMediaNegotiationBlob *)v7 audioSettings]
    && ![(VCMediaNegotiator *)self setupAudioWithNegotiatedSettings:[(VCMediaNegotiationBlob *)v7 audioSettings]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processResponseBlob:].cold.8();
      }
    }
    goto LABEL_49;
  }
  if ([(VCMediaNegotiationBlob *)v7 videoSettings]
    && ![(VCMediaNegotiator *)self setupVideoWithNegotiatedSettings:[(VCMediaNegotiationBlob *)v7 videoSettings]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processResponseBlob:].cold.7();
      }
    }
    goto LABEL_49;
  }
  if ([(VCMediaNegotiationBlob *)v7 screenSettings]
    && ![(VCMediaNegotiator *)self setupScreenWithNegotiatedSettings:[(VCMediaNegotiationBlob *)v7 screenSettings]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processResponseBlob:].cold.6();
      }
    }
    goto LABEL_49;
  }
  if ([(VCMediaNegotiationBlob *)v7 captionsSettings]
    && ![(VCMediaNegotiator *)self negotiateCaptionsWithCaptionsSettings:[(VCMediaNegotiationBlob *)v7 captionsSettings]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processResponseBlob:].cold.5();
      }
    }
    goto LABEL_49;
  }
  if ([(VCMediaNegotiationBlob *)v7 momentsSettings]
    && ![(VCMediaNegotiator *)self negotiateMomentsWithMomentsSettings:[(VCMediaNegotiationBlob *)v7 momentsSettings]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processResponseBlob:].cold.4();
      }
    }
    goto LABEL_49;
  }
  if ([(VCMediaNegotiationBlob *)v7 faceTimeSettings]
    && ![(VCMediaNegotiator *)self negotiateFaceTimeSettings:[(VCMediaNegotiationBlob *)v7 faceTimeSettings]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator processResponseBlob:]();
      }
    }
LABEL_49:
    BOOL v11 = 0;
    goto LABEL_23;
  }
  BOOL v11 = 1;
  self->_usePreNegotiation = 1;
LABEL_23:

  return v11;
}

- (unsigned)remoteMaxBandwidthForArbiterMode:(unsigned __int8)a3 connectionType:(int)a4
{
  return [(VCMediaNegotiatorResults *)self->super._negotiatedSettings maxBandwidthWithArbiterMode:a3 connectionType:*(void *)&a4];
}

+ (id)negotiatedFeaturesStringWithLocalFeaturesString:(id)a3 remoteFeaturesString:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)[a3 componentsSeparatedByString:@";"];
  BOOL v6 = (void *)[a4 componentsSeparatedByString:@";"];
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiator negotiatedFeaturesStringWithLocalFeaturesString:remoteFeaturesString:]();
      }
    }
    goto LABEL_25;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v9 = [v5 countByEnumeratingWithState:&v28 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v8, "setObject:forKeyedSubscript:", *(void *)(*((void *)&v28 + 1) + 8 * i), objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "componentsSeparatedByString:", @":"), "firstObject"));
      }
      uint64_t v10 = [v5 countByEnumeratingWithState:&v28 objects:v27 count:16];
    }
    while (v10);
  }
  uint64_t v13 = objc_opt_new();
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiator negotiatedFeaturesStringWithLocalFeaturesString:remoteFeaturesString:]();
      }
    }
LABEL_25:
    __int16 v14 = 0;
    BOOL v19 = 0;
    goto LABEL_18;
  }
  __int16 v14 = (void *)v13;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v15 = [v6 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v14, "setObject:forKeyedSubscript:", *(void *)(*((void *)&v23 + 1) + 8 * j), objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "componentsSeparatedByString:", @":"), "firstObject"));
      }
      uint64_t v16 = [v6 countByEnumeratingWithState:&v23 objects:v22 count:16];
    }
    while (v16);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __90__VCMediaNegotiator_negotiatedFeaturesStringWithLocalFeaturesString_remoteFeaturesString___block_invoke;
  v21[3] = &unk_1E6DB8618;
  v21[4] = v8;
  v21[5] = v7;
  [v14 enumerateKeysAndObjectsUsingBlock:v21];
  BOOL v19 = (void *)[v7 componentsJoinedByString:@";"];
LABEL_18:

  return v19;
}

uint64_t __90__VCMediaNegotiator_negotiatedFeaturesStringWithLocalFeaturesString_remoteFeaturesString___block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v5 = result;
    BOOL result = [a2 length];
    if (result)
    {
      BOOL result = [*(id *)(v5 + 32) objectForKeyedSubscript:a2];
      if (result)
      {
        BOOL v6 = *(void **)(v5 + 40);
        return [v6 addObject:a3];
      }
    }
  }
  return result;
}

+ (BOOL)validateMultiwayVideoStreamConfigurations:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v27 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    BOOL v6 = 0;
    uint64_t v7 = *(void *)v28;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v28 != v7) {
        objc_enumerationMutation(a3);
      }
      uint64_t v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
      if ([v9 isSubstream])
      {
        if (!v6)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v11) {
              return v11;
            }
            +[VCMediaNegotiator validateMultiwayVideoStreamConfigurations:]();
          }
LABEL_20:
          LOBYTE(v11) = 0;
          return v11;
        }
        int v10 = [v9 ssrc];
        if (v10 != [v6 ssrc])
        {
          int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
          if (ErrorLogLevelForModule >= 3)
          {
            uint64_t v13 = VRTraceErrorLogLevelToCSTR();
            __int16 v14 = *MEMORY[0x1E4F47A50];
            BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v11) {
              return v11;
            }
            int v16 = 136316162;
            uint64_t v17 = v13;
            __int16 v18 = 2080;
            BOOL v19 = "+[VCMediaNegotiator validateMultiwayVideoStreamConfigurations:]";
            __int16 v20 = 1024;
            int v21 = 750;
            __int16 v22 = 1024;
            int v23 = [v9 ssrc];
            __int16 v24 = 1024;
            int v25 = [v6 ssrc];
            _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d Substream ssrc[%x] doesn't match its corresponding parent stream[%x]", (uint8_t *)&v16, 0x28u);
          }
          goto LABEL_20;
        }
      }
      else
      {
        BOOL v6 = v9;
      }
      if (v5 == ++v8)
      {
        uint64_t v5 = [a3 countByEnumeratingWithState:&v27 objects:v26 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  LOBYTE(v11) = 1;
  return v11;
}

+ (BOOL)validateMultiwayAudioStreamConfigurations:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(a3);
      }
      if ([*(id *)(*((void *)&v11 + 1) + 8 * v7) isSubstream]) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v8) {
        return v8;
      }
      +[VCMediaNegotiator validateMultiwayAudioStreamConfigurations:]();
    }
    LOBYTE(v8) = 0;
  }
  else
  {
LABEL_9:
    LOBYTE(v8) = 1;
  }
  return v8;
}

+ (BOOL)validateLocalConfiguration:(id)a3
{
  BOOL v4 = +[VCMediaNegotiator validateMultiwayVideoStreamConfigurations:](VCMediaNegotiator, "validateMultiwayVideoStreamConfigurations:", [a3 multiwayVideoStreams]);
  if (v4)
  {
    uint64_t v5 = [a3 multiwayAudioStreams];
    LOBYTE(v4) = +[VCMediaNegotiator validateMultiwayAudioStreamConfigurations:v5];
  }
  return v4;
}

+ (void)dumpBlob:(id)a3 prefix:(id)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([+[VCDefaults sharedInstance] dumpMediaBlob]|| v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v8;
        __int16 v13 = 2080;
        long long v14 = "+[VCMediaNegotiator dumpBlob:prefix:force:]";
        __int16 v15 = 1024;
        int v16 = 782;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media blob dump enabled !!", buf, 0x1Cu);
      }
    }
    uint64_t v10 = [a4 UTF8String];
    memset(buf, 170, sizeof(buf));
    __sprintf_chk((char *)buf, 0, 0xCuLL, "%010u", 0);
    long long v11 = VRLogfileAlloc(0, (uint64_t)buf, v10, (uint64_t)".blob", "com.apple.VideoConference.MediaBlob", 9);
    VRLogfileWrite(v11, [a3 bytes], objc_msgSend(a3, "length"));
    VRLogfileFree((uint64_t *)&v11);
  }
}

- (BOOL)addBandwidthSettingsForMediaBlob:(id)a3 arbiterMode:(unsigned __int8)a4 connectionType:(int)a5 maxBitrate:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  int v8 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int v10 = +[VCMediaNegotiationBlobBandwidthSettings bandwidthConfigurationWithArbiterMode:a4 connectionType:*(void *)&a5];
  if (v10)
  {
    int v11 = v10;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v12 = (void *)[a3 bandwidthSettings];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if ([v17 maxBandwidth] == v6)
          {
            if (v11 < 4096) {
              objc_msgSend(v17, "setConfiguration:", objc_msgSend(v17, "configuration") | v11);
            }
            else {
              objc_msgSend(v17, "setConfigurationExtension:", objc_msgSend(v17, "configurationExtension") | v11);
            }
            goto LABEL_22;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v33 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    __int16 v18 = objc_alloc_init(VCMediaNegotiationBlobBandwidthSettings);
    if (!v18)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        int v21 = *MEMORY[0x1E4F47A50];
        int v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v10) {
          return v10;
        }
        int v23 = 136316162;
        uint64_t v24 = v20;
        __int16 v25 = 2080;
        long long v26 = "-[VCMediaNegotiator addBandwidthSettingsForMediaBlob:arbiterMode:connectionType:maxBitrate:]";
        __int16 v27 = 1024;
        int v28 = 819;
        __int16 v29 = 1024;
        int v30 = a5;
        __int16 v31 = 1024;
        int v32 = v8;
        _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create bandwidth setting: connection type=%d, operating mode=%hhu", (uint8_t *)&v23, 0x28u);
      }
      LOBYTE(v10) = 0;
      return v10;
    }
    BOOL v19 = v18;
    [(VCMediaNegotiationBlobBandwidthSettings *)v18 setMaxBandwidth:v6];
    if (v11 < 4096) {
      [(VCMediaNegotiationBlobBandwidthSettings *)v19 setConfiguration:[(VCMediaNegotiationBlobBandwidthSettings *)v19 configuration] | v11];
    }
    else {
      [(VCMediaNegotiationBlobBandwidthSettings *)v19 setConfigurationExtension:[(VCMediaNegotiationBlobBandwidthSettings *)v19 configurationExtension] | v11];
    }
    [a3 addBandwidthSettings:v19];

LABEL_22:
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (BOOL)setupBandwidthSettingsForMediaBlob:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v5 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings bandwidthConfigurations];
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      BOOL v10 = -[VCMediaNegotiator addBandwidthSettingsForMediaBlob:arbiterMode:connectionType:maxBitrate:](self, "addBandwidthSettingsForMediaBlob:arbiterMode:connectionType:maxBitrate:", a3, [*(id *)(*((void *)&v13 + 1) + 8 * v9) mode], objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "connectionType"), objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "maxBandwidth"));
      if (!v10) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v13 objects:v12 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (void)saveRemoteBandwidthSettingsWithMediaBlob:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v4 = (void *)[a3 bandwidthSettings];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)[*(id *)(*((void *)&v11 + 1) + 8 * v8) newBandwidthConfigurations];
        [(VCMediaNegotiatorResults *)self->super._negotiatedSettings addBandwidthConfigurations:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
}

+ (id)newDecompressedBlob:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  [a3 bytes];
  [a3 length];
  if (CompressionUtils_DecompressWithZlib()) {
    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      BOOL v10 = "+[VCMediaNegotiator newDecompressedBlob:]";
      __int16 v11 = 1024;
      int v12 = 859;
      __int16 v13 = 2080;
      long long v14 = "+[VCMediaNegotiator newDecompressedBlob:]";
      __int16 v15 = 1024;
      int v16 = [a3 length];
      __int16 v17 = 1024;
      int v18 = 2500;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media blob size %s: %d -> %d bytes", buf, 0x32u);
    }
  }
  return (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:__b length:2500];
}

+ (id)newCompressedBlob:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  [a3 bytes];
  [a3 length];
  if (CompressionUtils_CompressWithZLib()) {
    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      BOOL v10 = "+[VCMediaNegotiator newCompressedBlob:]";
      __int16 v11 = 1024;
      int v12 = 870;
      __int16 v13 = 2080;
      long long v14 = "+[VCMediaNegotiator newCompressedBlob:]";
      __int16 v15 = 1024;
      int v16 = [a3 length];
      __int16 v17 = 1024;
      int v18 = 2500;
      __int16 v19 = 2048;
      double v20 = (float)((float)2500 / (float)(int)[a3 length]);
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media blob size %s: %d -> %d bytes with ratio %f", buf, 0x3Cu);
    }
  }
  return (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:__b length:2500];
}

- (void)negotiateAudioAllowRecording:(id)a3 microphoneConfiguration:(id)a4
{
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC5208];
  if ([a4 allowAudioRecording]) {
    uint64_t v7 = [a3 allowAudioRecording];
  }
  else {
    uint64_t v7 = 0;
  }

  [v6 setAllowRecording:v7];
}

- (void)negotiateAudioUseSBR:(id)a3
{
  BOOL v4 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC5208];
  uint64_t v5 = [a3 useSBR];

  [v4 setUseSBR:v5];
}

- (BOOL)negotiateAudioPrimaryPayload:(id)a3 microphoneConfiguration:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = +[VCAudioRuleCollection getForcedPayload];
  uint64_t v8 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC5208];
  if (v7 == 128)
  {
    __int16 v9 = (void *)[a4 audioPayloads];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    BOOL v10 = (void *)[a3 audioPayloads];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          int v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v17 = [v16 intValue];
          if (v17 == [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings preferredAudioCodec])
          {
            int v21 = v8;
            uint64_t v22 = v17;
            goto LABEL_19;
          }
          if ([v9 containsObject:v16])
          {
            uint64_t v18 = [&unk_1F3DC78A8 indexOfObject:v16];
            if (v18 < v14) {
              uint64_t v14 = v18;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v8, "setPrimaryPayload:", objc_msgSend((id)objc_msgSend(&unk_1F3DC78A8, "objectAtIndexedSubscript:", v14), "unsignedIntValue"));
      }
    }
    LOBYTE(v19) = [v8 primaryPayload] != 128;
  }
  else
  {
    double v20 = (void *)[a3 audioPayloads];
    int v19 = objc_msgSend(v20, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v7));
    if (v19)
    {
      int v21 = v8;
      uint64_t v22 = v7;
LABEL_19:
      [v21 setPrimaryPayload:v22];
      LOBYTE(v19) = 1;
    }
  }
  return v19;
}

- (BOOL)negotiateAudioDTXPayload:(id)a3
{
  BOOL v4 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC5208];
  if ([v4 primaryPayload] == 13) {
    goto LABEL_9;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "audioPayloads"), "containsObject:", &unk_1F3DC52E0)) {
    [v4 setDtxPayload:13];
  }
  if ([v4 dtxPayload] != 128)
  {
LABEL_9:
    LOBYTE(v5) = 1;
    return v5;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_8;
  }
  VRTraceErrorLogLevelToCSTR();
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v5)
  {
    -[VCMediaNegotiator negotiateAudioDTXPayload:]();
LABEL_8:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)negotiateAudioREDPayload:(id)a3 microphoneConfiguration:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC5208];
  if (objc_msgSend((id)objc_msgSend(a3, "audioPayloads"), "containsObject:", &unk_1F3DC5358)
    && objc_msgSend((id)objc_msgSend(a4, "audioPayloads"), "containsObject:", &unk_1F3DC5358))
  {
    [v6 setRedPayload:20];
  }
  int v7 = [v6 redPayload];
  if (v7 == 128 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    __int16 v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      uint64_t v12 = v8;
      __int16 v13 = 2080;
      uint64_t v14 = "-[VCMediaNegotiator negotiateAudioREDPayload:microphoneConfiguration:]";
      __int16 v15 = 1024;
      int v16 = 947;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RED payload not available!", (uint8_t *)&v11, 0x1Cu);
    }
  }
  return v7 != 128;
}

- (void)negotiateAudioSecondaryPayloads:(id)a3 microphoneConfiguration:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v7 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC5208];
  objc_msgSend(v7, "setAllowSwitching:", objc_msgSend(a4, "allowAudioSwitching"));
  if (+[VCPayloadUtils isUseCaseWatchContinuity:primaryPayload:](VCPayloadUtils, "isUseCaseWatchContinuity:primaryPayload:", -[VCMediaNegotiatorLocalConfiguration deviceRole](self->super._localSettings, "deviceRole"), [v7 primaryPayload]))
  {
    [v7 setAllowSwitching:0];
  }
  if ([v7 allowSwitching])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = (void *)[a3 audioPayloads];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v18 + 1) + 8 * v12) intValue];
          if (v13 != 13 && v13 != 20)
          {
            uint64_t v15 = v13;
            if ([a4 isSecondaryPayload:v13]
              && [a3 isSecondaryPayload:v15])
            {
              [v7 addSecondaryPayload:v15];
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v16 = [v8 countByEnumeratingWithState:&v18 objects:v17 count:16];
        uint64_t v10 = v16;
      }
      while (v16);
    }
    objc_msgSend(v7, "setAllowSwitching:", objc_msgSend((id)objc_msgSend(v7, "secondaryPayloads"), "count") != 0);
  }
}

- (BOOL)negotiateAudioSettings:(id)a3
{
  BOOL v5 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC5208];
  id v6 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaConfigurationForMediaType:1];
  objc_msgSend(v5, "setRemoteSSRC:", objc_msgSend(a3, "rtpSSRC"));
  objc_msgSend(v5, "setAudioUnitModel:", objc_msgSend(a3, "audioUnitModel"));
  int v7 = (void *)[a3 newMediaNegotiatorAudioConfiguration];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator negotiateAudioSettings:]();
      }
    }
    goto LABEL_11;
  }
  [(VCMediaNegotiator *)self negotiateAudioUseSBR:v7];
  [(VCMediaNegotiator *)self negotiateAudioAllowRecording:v7 microphoneConfiguration:v6];
  if (![(VCMediaNegotiator *)self negotiateAudioPrimaryPayload:v7 microphoneConfiguration:v6])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator negotiateAudioSettings:]();
      }
    }
LABEL_11:
    BOOL v8 = 0;
    goto LABEL_4;
  }
  [(VCMediaNegotiator *)self negotiateAudioDTXPayload:v7];
  [(VCMediaNegotiator *)self negotiateAudioREDPayload:v7 microphoneConfiguration:v6];
  [(VCMediaNegotiator *)self negotiateAudioSecondaryPayloads:v7 microphoneConfiguration:v6];
  BOOL v8 = 1;
LABEL_4:

  return v8;
}

- (BOOL)setupAudioWithNegotiatedSettings:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)[a3 newMediaNegotiatorAudioConfiguration];
  if (v4)
  {
    BOOL v5 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC5208];
    objc_msgSend(v5, "setAllowRecording:", objc_msgSend(v4, "allowAudioRecording"));
    objc_msgSend(v5, "setAudioUnitModel:", objc_msgSend(v4, "audioUnitNumber"));
    objc_msgSend(v5, "setRemoteSSRC:", objc_msgSend(v4, "ssrc"));
    objc_msgSend(v5, "setUseSBR:", objc_msgSend(v4, "useSBR"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = (void *)[v4 audioPayloads];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      char v9 = 0;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = [*(id *)(*((void *)&v17 + 1) + 8 * i) intValue];
          if ([v4 isSecondaryPayload:v12])
          {
            if (v12 == 20)
            {
              [v5 setRedPayload:20];
              char v9 = 1;
            }
            else if (v12 == 13)
            {
              [v5 setDtxPayload:13];
            }
            else
            {
              [v5 addSecondaryPayload:v12];
            }
          }
          else
          {
            [v5 setPrimaryPayload:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v16 count:16];
      }
      while (v8);
    }
    else
    {
      char v9 = 0;
    }
    unint64_t v13 = objc_msgSend((id)objc_msgSend(v4, "audioPayloads"), "count");
    unint64_t v14 = 1;
    if (v9) {
      unint64_t v14 = 2;
    }
    [v5 setAllowSwitching:v13 > v14];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaNegotiator setupAudioWithNegotiatedSettings:]();
    }
  }

  return v4 != 0;
}

- (id)selectVideoFeatureString:(id)a3 selectedPayload:(int)a4 videoConfiguration:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(a5, "videoFeatureStrings"), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(void *)&a4)))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = (void *)[a3 videoPayloadCollections];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v15 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v12 payload] == a4)
          {
            id v13 = (id)objc_msgSend((id)objc_msgSend(v12, "featureString"), "copy");
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v15 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    id v13 = 0;
LABEL_12:
    if ([v13 length]) {
      return v13;
    }
    else {
      return 0;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator selectVideoFeatureString:selectedPayload:videoConfiguration:]();
      }
    }
    return 0;
  }
}

- (BOOL)selectBestVideoRuleForTransport:(unsigned __int8)a3 payload:(int)a4 encodingType:(unsigned __int8)a5 localVideoRuleCollection:(id)a6 remoteVideoSettings:(id)a7 negotiatedVideoSettings:(id)a8 isScreen:(BOOL)a9
{
  uint64_t v12 = a5;
  uint64_t v13 = *(void *)&a4;
  uint64_t v14 = a3;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  long long v16 = (void *)[a7 newVideoRuleCollectionsForScreen:a9 isCellular16x9Capable:self->_isCellular16x9Capable isLocalConfig:0];
  if (!v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_36;
    }
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    __int16 v31 = *MEMORY[0x1E4F47A50];
    BOOL v28 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    int v40 = 136316418;
    uint64_t v41 = v30;
    __int16 v42 = 2080;
    unsigned int v43 = "-[VCMediaNegotiator selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVideoS"
          "ettings:negotiatedVideoSettings:isScreen:]";
    __int16 v44 = 1024;
    int v45 = 1077;
    __int16 v46 = 1024;
    int v47 = v13;
    __int16 v48 = 1024;
    int v49 = v14;
    __int16 v50 = 1024;
    int v51 = v12;
    int v32 = " [%s] %s:%d Failed to extract the remote video rules for payload=%d transport=%d encoding=%d";
LABEL_34:
    long long v36 = v31;
    uint32_t v37 = 46;
LABEL_35:
    _os_log_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_DEFAULT, v32, (uint8_t *)&v40, v37);
    goto LABEL_36;
  }
  uint64_t v17 = [a6 getVideoRulesForTransport:v14 payload:v13 encodingType:v12];
  if (!v17)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_36;
    }
    uint64_t v33 = VRTraceErrorLogLevelToCSTR();
    __int16 v31 = *MEMORY[0x1E4F47A50];
    BOOL v28 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    int v40 = 136316418;
    uint64_t v41 = v33;
    __int16 v42 = 2080;
    unsigned int v43 = "-[VCMediaNegotiator selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVideoS"
          "ettings:negotiatedVideoSettings:isScreen:]";
    __int16 v44 = 1024;
    int v45 = 1080;
    __int16 v46 = 1024;
    int v47 = v13;
    __int16 v48 = 1024;
    int v49 = v14;
    __int16 v50 = 1024;
    int v51 = v12;
    int v32 = " [%s] %s:%d No local video rules for payload=%d transport=%d encoding=%d";
    goto LABEL_34;
  }
  uint64_t v18 = v17;
  if (v12 == 2) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = 2;
  }
  uint64_t v20 = [v16 getVideoRulesForTransport:v14 payload:v13 encodingType:v19];
  if (!v20)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_36;
    }
    uint64_t v34 = VRTraceErrorLogLevelToCSTR();
    __int16 v31 = *MEMORY[0x1E4F47A50];
    BOOL v28 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    int v40 = 136316418;
    uint64_t v41 = v34;
    __int16 v42 = 2080;
    unsigned int v43 = "-[VCMediaNegotiator selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVideoS"
          "ettings:negotiatedVideoSettings:isScreen:]";
    __int16 v44 = 1024;
    int v45 = 1083;
    __int16 v46 = 1024;
    int v47 = v13;
    __int16 v48 = 1024;
    int v49 = v14;
    __int16 v50 = 1024;
    int v51 = v12;
    int v32 = " [%s] %s:%d No remote video rules for payload=%d transport=%d encoding=%d";
    goto LABEL_34;
  }
  if (v12 == 1) {
    uint64_t v21 = v18;
  }
  else {
    uint64_t v21 = v20;
  }
  if (v12 == 1) {
    uint64_t v22 = v20;
  }
  else {
    uint64_t v22 = v18;
  }
  id v23 = +[VCMediaNegotiatorBase negotiateVideoMaxResolutionWithEncodeRules:v21 decodeRules:v22 isEncoder:v12 == 1];
  if (!v23)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_36;
    }
    uint64_t v35 = VRTraceErrorLogLevelToCSTR();
    __int16 v31 = *MEMORY[0x1E4F47A50];
    BOOL v28 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    int v40 = 136316418;
    uint64_t v41 = v35;
    __int16 v42 = 2080;
    unsigned int v43 = "-[VCMediaNegotiator selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVideoS"
          "ettings:negotiatedVideoSettings:isScreen:]";
    __int16 v44 = 1024;
    int v45 = 1089;
    __int16 v46 = 1024;
    int v47 = v13;
    __int16 v48 = 1024;
    int v49 = v14;
    __int16 v50 = 1024;
    int v51 = v12;
    int v32 = " [%s] %s:%d No matching remote rules for payload=%d transport=%d encoding=%d";
    goto LABEL_34;
  }
  id v24 = v23;
  long long v25 = (void *)[a8 featureStrings];
  if (!objc_msgSend(v25, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v13)))
  {
    if (a9) {
      uint64_t v26 = 3;
    }
    else {
      uint64_t v26 = 2;
    }
    id v27 = [(VCMediaNegotiator *)self selectVideoFeatureString:a7 selectedPayload:v13 videoConfiguration:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaConfigurationForMediaType:v26]];
    if (v27)
    {
      [a8 addFeatureString:v27 payload:v13];
      goto LABEL_20;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v38 = VRTraceErrorLogLevelToCSTR();
      BOOL v39 = *MEMORY[0x1E4F47A50];
      BOOL v28 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      int v40 = 136315906;
      uint64_t v41 = v38;
      __int16 v42 = 2080;
      unsigned int v43 = "-[VCMediaNegotiator selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVide"
            "oSettings:negotiatedVideoSettings:isScreen:]";
      __int16 v44 = 1024;
      int v45 = 1095;
      __int16 v46 = 1024;
      int v47 = v13;
      int v32 = " [%s] %s:%d Failed to select feature string for payload=%d";
      long long v36 = v39;
      uint32_t v37 = 34;
      goto LABEL_35;
    }
LABEL_36:
    BOOL v28 = 0;
    goto LABEL_21;
  }
LABEL_20:
  [a8 addVideoRules:v24 transportType:v14 payload:v13 encodingType:v12];
  BOOL v28 = 1;
LABEL_21:

  return v28;
}

- (void)negotiateRTCPFB:(id)a3 negotiatedVideoSettings:(id)a4
{
  if ([(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings allowRTCPFB]) {
    uint64_t v6 = [a3 allowRTCPFB];
  }
  else {
    uint64_t v6 = 0;
  }

  [a4 setIsRTCPFBEnabled:v6];
}

- (void)negotiateTilesPerFrame:(id)a3 negotiatedSettings:(id)a4
{
  unsigned int v6 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings tilesPerVideoFrame];
  unsigned int v7 = [a3 tilesPerFrame];
  if (v6 >= v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v6;
  }

  [a4 setTilesPerFrame:v8];
}

- (BOOL)processPixelFormats:(id)a3 videoResults:(id)a4
{
  unsigned int v6 = +[VCMediaNegotiationBlobVideoSettings storePixelFormatsInBitMap:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings pixelFormats]];
  int v7 = [a3 pixelFormats];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    return 1;
  }
  int v9 = v7 & v6;
  if (v9)
  {
    if (v9)
    {
      [a4 addPixelFormatSet:&unk_1F3DC5370];
      if ((v9 & 2) == 0)
      {
LABEL_8:
        if ((v9 & 8) == 0) {
          goto LABEL_9;
        }
        goto LABEL_17;
      }
    }
    else if ((v9 & 2) == 0)
    {
      goto LABEL_8;
    }
    [a4 addPixelFormatSet:&unk_1F3DC5388];
    if ((v9 & 8) == 0)
    {
LABEL_9:
      if ((v9 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
LABEL_17:
    [a4 addPixelFormatSet:&unk_1F3DC53A0];
    if ((v9 & 0x10) == 0)
    {
LABEL_10:
      if ((v9 & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_19;
    }
LABEL_18:
    [a4 addPixelFormatSet:&unk_1F3DC53B8];
    if ((v9 & 4) == 0)
    {
LABEL_11:
      if ((v9 & 0x20) == 0) {
        return 1;
      }
LABEL_12:
      [a4 addPixelFormatSet:&unk_1F3DC53E8];
      return 1;
    }
LABEL_19:
    [a4 addPixelFormatSet:&unk_1F3DC53D0];
    if ((v9 & 0x20) == 0) {
      return 1;
    }
    goto LABEL_12;
  }
  return 0;
}

- (BOOL)negotiateHDRMode:(id)a3 videoResults:(id)a4
{
  unsigned int v6 = +[VCMediaNegotiationBlobVideoSettings hdrModesBitmapWithSupportedModes:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings hdrModesSupported]];
  int v7 = [a3 hdrModesSupported];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    return 1;
  }
  int v9 = v7 & v6;
  if (v9)
  {
    if (v9)
    {
      [a4 addNegotiatedHDRMode:&unk_1F3DC5400];
      if ((v9 & 2) == 0)
      {
LABEL_8:
        if ((v9 & 4) == 0) {
          goto LABEL_9;
        }
        goto LABEL_15;
      }
    }
    else if ((v9 & 2) == 0)
    {
      goto LABEL_8;
    }
    [a4 addNegotiatedHDRMode:&unk_1F3DC5418];
    if ((v9 & 4) == 0)
    {
LABEL_9:
      if ((v9 & 8) == 0) {
        return 1;
      }
LABEL_10:
      [a4 addNegotiatedHDRMode:&unk_1F3DC5448];
      return 1;
    }
LABEL_15:
    [a4 addNegotiatedHDRMode:&unk_1F3DC5430];
    if ((v9 & 8) == 0) {
      return 1;
    }
    goto LABEL_10;
  }
  return 0;
}

- (BOOL)processParameterSets:(id)a3 videoResults:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v5 = (void *)[a3 videoPayloadCollections];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
      if (![v10 parameterSet]) {
        break;
      }
      char v11 = [v10 parameterSet];
      int v12 = [v10 parameterSet] & 4 | v11 & 1;
      uint64_t v13 = v12 | ([v10 parameterSet] & 2);
      if (([v10 parameterSet] & 8) != 0)
      {
        uint64_t v13 = v13 | 8;
      }
      else if (!v13)
      {
        break;
      }
      objc_msgSend(a4, "addParameterSet:payload:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v13), objc_msgSend(v10, "payload"));
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v14) {
        return v14;
      }
      -[VCMediaNegotiator processParameterSets:videoResults:]();
    }
    LOBYTE(v14) = 0;
  }
  else
  {
LABEL_13:
    LOBYTE(v14) = 1;
  }
  return v14;
}

- (BOOL)negotiateVideoSettings:(id)a3
{
  BOOL v4 = self;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC5220];
  int v47 = objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](v4->super._localSettings, "mediaConfigurationForMediaType:", 2), "videoRuleCollections");
  if (objc_msgSend((id)objc_msgSend(v47, "rules"), "count"))
  {
    uint64_t v6 = (void *)[a3 newVideoRuleCollectionsForScreen:0 isCellular16x9Capable:v4->_isCellular16x9Capable isLocalConfig:0];
    uint64_t v7 = v6;
    if (!v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiator negotiateVideoSettings:]();
        }
      }
      goto LABEL_79;
    }
    if (objc_msgSend((id)objc_msgSend(v6, "supportedPayloads"), "count"))
    {
      objc_msgSend(v5, "setRemoteSSRC:", objc_msgSend(a3, "rtpSSRC"));
      if ([(VCMediaNegotiator *)v4 processParameterSets:a3 videoResults:v5])
      {
        [(VCMediaNegotiator *)v4 negotiateRTCPFB:a3 negotiatedVideoSettings:v5];
        [(VCMediaNegotiator *)v4 negotiateTilesPerFrame:a3 negotiatedSettings:v5];
        if ([a3 ltrpEnabled]) {
          uint64_t v8 = [(VCMediaNegotiatorLocalConfiguration *)v4->super._localSettings ltrpEnabled];
        }
        else {
          uint64_t v8 = 0;
        }
        [v5 setLtrpEnabled:v8];
        id v46 = +[VCMediaNegotiatorBase getPreferredVideoPayloadList:localSupportedPayloads:mediaType:](VCMediaNegotiator, "getPreferredVideoPayloadList:localSupportedPayloads:mediaType:", [v7 supportedPayloads], objc_msgSend(v47, "supportedPayloads"), 2);
        if ([v46 count])
        {
          if ([(VCMediaNegotiator *)v4 processPixelFormats:a3 videoResults:v5])
          {
            if ([(VCMediaNegotiator *)v4 negotiateHDRMode:a3 videoResults:v5])
            {
              BOOL v14 = (void *)[a3 newVideoRuleCollectionsForScreen:0 isCellular16x9Capable:v4->_isCellular16x9Capable isLocalConfig:0];
              id v42 = (id)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
              if ([v47 isEncodeSupported]
                && [v14 isDecodeSupported])
              {
                objc_msgSend(v42, "setObject:atIndexedSubscript:", &unk_1F3DC5208, objc_msgSend(v42, "count"));
              }
              if ([v47 isDecodeSupported]
                && [v14 isEncodeSupported])
              {
                objc_msgSend(v42, "setObject:atIndexedSubscript:", &unk_1F3DC5220, objc_msgSend(v42, "count"));
              }

              long long v69 = 0u;
              long long v70 = 0u;
              long long v71 = 0u;
              long long v72 = 0u;
              obuint64_t j = (id)[v47 supportedTransportTypes];
              uint64_t v39 = [obj countByEnumeratingWithState:&v69 objects:v68 count:16];
              if (v39)
              {
                uint64_t v40 = *(void *)v70;
                uint32_t v37 = v7;
                do
                {
                  uint64_t v15 = v4;
                  id v16 = a3;
                  long long v17 = v5;
                  uint64_t v18 = 0;
                  do
                  {
                    if (*(void *)v70 != v40) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v41 = v18;
                    long long v19 = *(void **)(*((void *)&v69 + 1) + 8 * v18);
                    long long v64 = 0u;
                    long long v65 = 0u;
                    long long v66 = 0u;
                    long long v67 = 0u;
                    uint64_t v44 = [v42 countByEnumeratingWithState:&v64 objects:v63 count:16];
                    if (v44)
                    {
                      uint64_t v43 = *(void *)v65;
                      while (2)
                      {
                        for (uint64_t i = 0; i != v44; ++i)
                        {
                          if (*(void *)v65 != v43) {
                            objc_enumerationMutation(v42);
                          }
                          uint64_t v21 = *(void **)(*((void *)&v64 + 1) + 8 * i);
                          long long v59 = 0u;
                          long long v60 = 0u;
                          long long v61 = 0u;
                          long long v62 = 0u;
                          uint64_t v22 = [v46 countByEnumeratingWithState:&v59 objects:v58 count:16];
                          if (v22)
                          {
                            uint64_t v23 = v22;
                            uint64_t v45 = i;
                            uint64_t v24 = *(void *)v60;
                            while (2)
                            {
                              for (uint64_t j = 0; j != v23; ++j)
                              {
                                if (*(void *)v60 != v24) {
                                  objc_enumerationMutation(v46);
                                }
                                LOBYTE(v36) = 0;
                                if (-[VCMediaNegotiator selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVideoSettings:negotiatedVideoSettings:isScreen:](v15, "selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVideoSettings:negotiatedVideoSettings:isScreen:", [v19 unsignedIntValue], objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * j), "unsignedIntValue"), objc_msgSend(v21, "unsignedIntValue"), v47, v16, v17, v36))
                                {
                                  char v26 = 1;
                                  goto LABEL_46;
                                }
                              }
                              uint64_t v23 = [v46 countByEnumeratingWithState:&v59 objects:v58 count:16];
                              if (v23) {
                                continue;
                              }
                              break;
                            }
                            char v26 = 0;
LABEL_46:
                            uint64_t i = v45;
                          }
                          else
                          {
                            char v26 = 0;
                          }
                          if ([+[VCDefaults sharedInstance] forceHWI])
                          {
                            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                            {
                              uint64_t v27 = VRTraceErrorLogLevelToCSTR();
                              BOOL v28 = *MEMORY[0x1E4F47A50];
                              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                              {
                                int v29 = [v19 unsignedIntValue];
                                int v30 = [v21 unsignedIntValue];
                                *(_DWORD *)buf = 136316162;
                                uint64_t v49 = v27;
                                __int16 v50 = 2080;
                                int v51 = "-[VCMediaNegotiator negotiateVideoSettings:]";
                                __int16 v52 = 1024;
                                int v53 = 1278;
                                __int16 v54 = 1024;
                                int v55 = v29;
                                __int16 v56 = 1024;
                                int v57 = v30;
                                _os_log_error_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_ERROR, " [%s] %s:%d forceHWI enabled! No match found when select video rules for transport=%d, encoding=%d", buf, 0x28u);
                              }
                            }
                          }
                          else if ((v26 & 1) == 0)
                          {
                            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                            {
                              uint64_t v31 = VRTraceErrorLogLevelToCSTR();
                              int v32 = *MEMORY[0x1E4F47A50];
                              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                              {
                                int v34 = [v19 unsignedIntValue];
                                int v35 = [v21 unsignedIntValue];
                                *(_DWORD *)buf = 136316162;
                                uint64_t v49 = v31;
                                __int16 v50 = 2080;
                                int v51 = "-[VCMediaNegotiator negotiateVideoSettings:]";
                                __int16 v52 = 1024;
                                int v53 = 1276;
                                __int16 v54 = 1024;
                                int v55 = v34;
                                __int16 v56 = 1024;
                                int v57 = v35;
                                _os_log_error_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to find a video rule for transport=%d encoding=%d", buf, 0x28u);
                              }
                            }
                            BOOL v13 = 1;
                            uint64_t v7 = v37;
                            goto LABEL_62;
                          }
                        }
                        uint64_t v44 = [v42 countByEnumeratingWithState:&v64 objects:v63 count:16];
                        if (v44) {
                          continue;
                        }
                        break;
                      }
                    }
                    uint64_t v18 = v41 + 1;
                  }
                  while (v41 + 1 != v39);
                  uint64_t v7 = v37;
                  BOOL v5 = v17;
                  a3 = v16;
                  BOOL v4 = v15;
                  uint64_t v39 = [obj countByEnumeratingWithState:&v69 objects:v68 count:16];
                }
                while (v39);
              }
              objc_msgSend(v5, "setIsSupported:", objc_msgSend(v42, "count") != 0);
              BOOL v13 = 1;
              goto LABEL_62;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCMediaNegotiator negotiateVideoSettings:]();
              }
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCMediaNegotiator negotiateVideoSettings:].cold.4();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaNegotiator negotiateVideoSettings:]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiator negotiateVideoSettings:].cold.5();
        }
      }
LABEL_79:
      BOOL v13 = 0;
LABEL_62:

      return v13;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      int v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v49 = v11;
        __int16 v50 = 2080;
        int v51 = "-[VCMediaNegotiator negotiateVideoSettings:]";
        __int16 v52 = 1024;
        int v53 = 1224;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating video settings, as the remote device does not support video", buf, 0x1Cu);
      }
    }
    [v5 setIsSupported:0];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v49 = v9;
        __int16 v50 = 2080;
        int v51 = "-[VCMediaNegotiator negotiateVideoSettings:]";
        __int16 v52 = 1024;
        int v53 = 1216;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating video settings, as this device does not support video", buf, 0x1Cu);
      }
    }
    [v5 setIsSupported:0];
  }
  return 1;
}

- (BOOL)setupVideoWithNegotiatedSettings:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)[a3 newVideoRuleCollectionsForScreen:0 isCellular16x9Capable:self->_isCellular16x9Capable isLocalConfig:0];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator setupVideoWithNegotiatedSettings:]();
      }
    }
    goto LABEL_23;
  }
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC5220];
  objc_msgSend(v6, "setRemoteSSRC:", objc_msgSend(a3, "rtpSSRC"));
  objc_msgSend(v6, "setIsRTCPFBEnabled:", objc_msgSend(a3, "allowRTCPFB"));
  objc_msgSend(v6, "setTilesPerFrame:", objc_msgSend(a3, "tilesPerFrame"));
  objc_msgSend(v6, "setLtrpEnabled:", objc_msgSend(a3, "ltrpEnabled"));
  if (![(VCMediaNegotiator *)self processPixelFormats:a3 videoResults:v6])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator setupVideoWithNegotiatedSettings:].cold.4();
      }
    }
    goto LABEL_23;
  }
  if (![(VCMediaNegotiator *)self negotiateHDRMode:a3 videoResults:v6])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator setupVideoWithNegotiatedSettings:]();
      }
    }
LABEL_23:
    uint64_t v7 = 0;
    BOOL v14 = 0;
    goto LABEL_13;
  }
  if ([(VCMediaNegotiator *)self processParameterSets:a3 videoResults:v6])
  {
    uint64_t v7 = (void *)[a3 newVideoRuleCollectionsForScreen:0 isCellular16x9Capable:self->_isCellular16x9Capable isLocalConfig:0];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v8 = (void *)[a3 videoPayloadCollections];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v6, "addFeatureString:payload:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "featureString"), objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "payload"));
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v17 count:16];
      }
      while (v10);
    }
    BOOL v13 = (void *)[v7 rules];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__VCMediaNegotiator_setupVideoWithNegotiatedSettings___block_invoke;
    v16[3] = &unk_1E6DB6628;
    v16[4] = v6;
    [v13 enumerateKeysAndObjectsUsingBlock:v16];
    BOOL v14 = 1;
    [v6 setIsSupported:1];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator setupVideoWithNegotiatedSettings:]();
      }
    }
    uint64_t v7 = 0;
    BOOL v14 = 1;
  }
LABEL_13:

  return v14;
}

uint64_t __54__VCMediaNegotiator_setupVideoWithNegotiatedSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:");
  uint64_t v5 = [a2 transportType];
  uint64_t v6 = [a2 payload];
  if ([a2 encodingType] == 2) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }

  return [v3 addVideoRules:v4 transportType:v5 payload:v6 encodingType:v7];
}

- (id)getPreferredScreenPayloadList
{
  if ([(VCMediaNegotiator *)self isNegotiationModeValid:self->_negotiationMode]) {
    return &unk_1F3DC78C0;
  }
  else {
    return &unk_1F3DC78D8;
  }
}

- (BOOL)negotiateScreenSettings:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC5238];
  uint64_t v43 = objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 3), "videoRuleCollections");
  if (objc_msgSend((id)objc_msgSend(v43, "rules"), "count"))
  {
    uint64_t v44 = self;
    uint64_t v6 = (void *)[a3 newVideoRuleCollectionsForScreen:1 isCellular16x9Capable:self->_isCellular16x9Capable isLocalConfig:0];
    if (!v6)
    {
      int v32 = 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiator negotiateScreenSettings:]();
        }
      }
      BOOL v12 = 0;
      goto LABEL_67;
    }
    int v35 = v6;
    if (objc_msgSend((id)objc_msgSend(v6, "supportedPayloads"), "count"))
    {
      objc_msgSend(v5, "setRemoteSSRC:", objc_msgSend(a3, "rtpSSRC"));
      if ([(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings customVideoHeight]
        || [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings customVideoWidth])
      {
        objc_msgSend(v5, "setCustomVideoWidth:", -[VCMediaNegotiatorLocalConfiguration customVideoWidth](self->super._localSettings, "customVideoWidth"));
        objc_msgSend(v5, "setCustomVideoHeight:", -[VCMediaNegotiatorLocalConfiguration customVideoHeight](self->super._localSettings, "customVideoHeight"));
      }
      if ([(VCMediaNegotiator *)self processParameterSets:a3 videoResults:v5])
      {
        [(VCMediaNegotiator *)self negotiateRTCPFB:a3 negotiatedVideoSettings:v5];
        [(VCMediaNegotiator *)self negotiateTilesPerFrame:a3 negotiatedSettings:v5];
        if ([a3 ltrpEnabled]) {
          BOOL v7 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings ltrpEnabled];
        }
        else {
          BOOL v7 = 0;
        }
        [v5 setLtrpEnabled:v7];
        if ([a3 fecEnabled]) {
          BOOL v13 = [(VCMediaNegotiatorResults *)self->super._negotiatedSettings accessNetworkType] == 2;
        }
        else {
          BOOL v13 = 0;
        }
        [v5 setFecEnabled:v13];
        if ([a3 rtxEnabled]) {
          BOOL v14 = [(VCMediaNegotiatorResults *)self->super._negotiatedSettings accessNetworkType] == 2
        }
             || [(VCMediaNegotiatorResults *)self->super._negotiatedSettings accessNetworkType] == 1;
        else {
          BOOL v14 = 0;
        }
        [v5 setRtxEnabled:v14];
        if ([a3 blackFrameOnClearScreenEnabled]) {
          BOOL v15 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings blackFrameOnClearScreenEnabled];
        }
        else {
          BOOL v15 = 0;
        }
        [v5 setBlackFrameOnClearScreenEnabled:v15];
        if ([a3 foveationSupported])
        {
          id v16 = self;
          BOOL v17 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings foveationIsSupported];
        }
        else
        {
          BOOL v17 = 0;
          id v16 = self;
        }
        [v5 setFoveationIsSupported:v17];
        obuint64_t j = [(VCMediaNegotiator *)v16 getPreferredScreenPayloadList];
        if ([obj count])
        {
          if ([(VCMediaNegotiator *)v16 processPixelFormats:a3 videoResults:v5])
          {
            if ([(VCMediaNegotiator *)v16 negotiateHDRMode:a3 videoResults:v5])
            {
              if ([(VCMediaNegotiator *)v16 isNegotiationModeForScreenShare:v16->_negotiationMode])
              {
                char v39 = [(VCMediaNegotiator *)v16 selectBestScreenRule:a3 preferredPayloadOrder:obj];
              }
              else
              {
                long long v58 = 0u;
                long long v59 = 0u;
                long long v56 = 0u;
                long long v57 = 0u;
                uint64_t v37 = [&unk_1F3DC78F0 countByEnumeratingWithState:&v56 objects:v55 count:16];
                if (v37)
                {
                  char v39 = 0;
                  uint64_t v36 = *(void *)v57;
                  do
                  {
                    uint64_t v18 = 0;
                    do
                    {
                      if (*(void *)v57 != v36) {
                        objc_enumerationMutation(&unk_1F3DC78F0);
                      }
                      uint64_t v38 = v18;
                      long long v19 = *(void **)(*((void *)&v56 + 1) + 8 * v18);
                      long long v51 = 0u;
                      long long v52 = 0u;
                      long long v53 = 0u;
                      long long v54 = 0u;
                      uint64_t v41 = [&unk_1F3DC7908 countByEnumeratingWithState:&v51 objects:v50 count:16];
                      if (v41)
                      {
                        uint64_t v40 = *(void *)v52;
                        do
                        {
                          for (uint64_t i = 0; i != v41; ++i)
                          {
                            if (*(void *)v52 != v40) {
                              objc_enumerationMutation(&unk_1F3DC7908);
                            }
                            long long v21 = *(void **)(*((void *)&v51 + 1) + 8 * i);
                            long long v46 = 0u;
                            long long v47 = 0u;
                            long long v48 = 0u;
                            long long v49 = 0u;
                            uint64_t v22 = [obj countByEnumeratingWithState:&v46 objects:v45 count:16];
                            if (v22)
                            {
                              uint64_t v23 = v22;
                              uint64_t v24 = *(void *)v47;
                              while (2)
                              {
                                for (uint64_t j = 0; j != v23; ++j)
                                {
                                  id v26 = a3;
                                  if (*(void *)v47 != v24) {
                                    objc_enumerationMutation(obj);
                                  }
                                  uint64_t v27 = *(void **)(*((void *)&v46 + 1) + 8 * j);
                                  unsigned __int8 v28 = [v19 unsignedIntValue];
                                  uint64_t v29 = [v27 unsignedIntValue];
                                  unsigned __int8 v30 = [v21 unsignedIntValue];
                                  LOBYTE(v34) = 1;
                                  uint64_t v31 = v28;
                                  a3 = v26;
                                  if ([(VCMediaNegotiator *)v44 selectBestVideoRuleForTransport:v31 payload:v29 encodingType:v30 localVideoRuleCollection:v43 remoteVideoSettings:v26 negotiatedVideoSettings:v5 isScreen:v34])
                                  {
                                    char v39 = 1;
                                    goto LABEL_59;
                                  }
                                }
                                uint64_t v23 = [obj countByEnumeratingWithState:&v46 objects:v45 count:16];
                                if (v23) {
                                  continue;
                                }
                                break;
                              }
                            }
LABEL_59:
                            ;
                          }
                          uint64_t v41 = [&unk_1F3DC7908 countByEnumeratingWithState:&v51 objects:v50 count:16];
                        }
                        while (v41);
                      }
                      uint64_t v18 = v38 + 1;
                    }
                    while (v38 + 1 != v37);
                    uint64_t v37 = [&unk_1F3DC78F0 countByEnumeratingWithState:&v56 objects:v55 count:16];
                  }
                  while (v37);
                }
                else
                {
                  char v39 = 0;
                }
              }
              [v5 setIsSupported:v39 & 1];
              BOOL v12 = 1;
              goto LABEL_66;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCMediaNegotiator negotiateScreenSettings:]();
              }
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCMediaNegotiator negotiateScreenSettings:].cold.4();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaNegotiator negotiateScreenSettings:]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiator negotiateScreenSettings:].cold.5();
        }
      }
      BOOL v12 = 0;
LABEL_66:
      int v32 = v35;
LABEL_67:

      return v12;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v61 = v10;
        __int16 v62 = 2080;
        uint64_t v63 = "-[VCMediaNegotiator negotiateScreenSettings:]";
        __int16 v64 = 1024;
        int v65 = 1359;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating screen video settings, as the remote device does not have a screen.", buf, 0x1Cu);
      }
    }
    [v5 setIsSupported:0];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v61 = v8;
        __int16 v62 = 2080;
        uint64_t v63 = "-[VCMediaNegotiator negotiateScreenSettings:]";
        __int16 v64 = 1024;
        int v65 = 1349;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating screen video settings, as this device does not have a screen.", buf, 0x1Cu);
      }
    }
    [v5 setIsSupported:0];
  }
  return 1;
}

- (BOOL)setupScreenWithNegotiatedSettings:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[a3 newVideoRuleCollectionsForScreen:1 isCellular16x9Capable:self->_isCellular16x9Capable isLocalConfig:0];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator setupScreenWithNegotiatedSettings:]();
      }
    }
    goto LABEL_26;
  }
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC5238];
  objc_msgSend(v6, "setRemoteSSRC:", objc_msgSend(a3, "rtpSSRC"));
  objc_msgSend(v6, "setIsRTCPFBEnabled:", objc_msgSend(a3, "allowRTCPFB"));
  objc_msgSend(v6, "setCustomVideoHeight:", objc_msgSend(a3, "customVideoHeight"));
  objc_msgSend(v6, "setCustomVideoWidth:", objc_msgSend(a3, "customVideoWidth"));
  objc_msgSend(v6, "setTilesPerFrame:", objc_msgSend(a3, "tilesPerFrame"));
  objc_msgSend(v6, "setLtrpEnabled:", objc_msgSend(a3, "ltrpEnabled"));
  objc_msgSend(v6, "setFecEnabled:", objc_msgSend(a3, "fecEnabled"));
  objc_msgSend(v6, "setRtxEnabled:", objc_msgSend(a3, "rtxEnabled"));
  if ([a3 hasBlackFrameOnClearScreenEnabled]) {
    uint64_t v7 = [a3 blackFrameOnClearScreenEnabled];
  }
  else {
    uint64_t v7 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings blackFrameOnClearScreenEnabledDefault];
  }
  [v6 setBlackFrameOnClearScreenEnabled:v7];
  objc_msgSend(v6, "setFoveationIsSupported:", objc_msgSend(a3, "foveationSupported"));
  if (![(VCMediaNegotiator *)self processPixelFormats:a3 videoResults:v6])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator setupScreenWithNegotiatedSettings:].cold.4();
      }
    }
    goto LABEL_26;
  }
  if (![(VCMediaNegotiator *)self negotiateHDRMode:a3 videoResults:v6])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator setupScreenWithNegotiatedSettings:]();
      }
    }
LABEL_26:
    uint64_t v8 = 0;
    BOOL v15 = 0;
    goto LABEL_16;
  }
  if ([(VCMediaNegotiator *)self processParameterSets:a3 videoResults:v6])
  {
    uint64_t v8 = (void *)[a3 newVideoRuleCollectionsForScreen:1 isCellular16x9Capable:self->_isCellular16x9Capable isLocalConfig:0];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = (void *)[a3 videoPayloadCollections];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(v6, "addFeatureString:payload:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "featureString"), objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "payload"));
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v18 count:16];
      }
      while (v11);
    }
    BOOL v14 = (void *)[v8 rules];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __55__VCMediaNegotiator_setupScreenWithNegotiatedSettings___block_invoke;
    v17[3] = &unk_1E6DB6628;
    v17[4] = v6;
    [v14 enumerateKeysAndObjectsUsingBlock:v17];
    BOOL v15 = 1;
    [v6 setIsSupported:1];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator setupScreenWithNegotiatedSettings:]();
      }
    }
    uint64_t v8 = 0;
    BOOL v15 = 1;
  }
LABEL_16:

  return v15;
}

uint64_t __55__VCMediaNegotiator_setupScreenWithNegotiatedSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:");
  uint64_t v5 = [a2 transportType];
  uint64_t v6 = [a2 payload];
  if ([a2 encodingType] == 2) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }

  return [v3 addVideoRules:v4 transportType:v5 payload:v6 encodingType:v7];
}

- (BOOL)selectBestScreenRule:(id)a3 preferredPayloadOrder:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v22 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC5238];
  uint64_t v6 = self;
  id v19 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaConfigurationForMediaType:3];
  uint64_t v7 = [v19 videoRuleCollections];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = a4;
  uint64_t v20 = [a4 countByEnumeratingWithState:&v30 objects:v29 count:16];
  int v8 = 0;
  if (v20)
  {
    uint64_t v18 = *(void *)v31;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v9;
        uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * v9);
        objc_msgSend(v22, "addFeatureString:payload:", +[VCMediaNegotiator negotiatedFeaturesStringWithLocalFeaturesString:remoteFeaturesString:](VCMediaNegotiator, "negotiatedFeaturesStringWithLocalFeaturesString:remoteFeaturesString:", objc_msgSend((id)objc_msgSend(v19, "videoFeatureStrings"), "objectForKeyedSubscript:", v10), -[VCMediaNegotiator selectVideoFeatureString:selectedPayload:videoConfiguration:](v6, "selectVideoFeatureString:selectedPayload:videoConfiguration:", a3, objc_msgSend(v10, "unsignedIntValue"), v19)), objc_msgSend(v10, "unsignedIntValue"));
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v11 = [&unk_1F3DC7920 countByEnumeratingWithState:&v25 objects:v24 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(&unk_1F3DC7920);
              }
              LOBYTE(v16) = 1;
              v8 |= -[VCMediaNegotiator selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVideoSettings:negotiatedVideoSettings:isScreen:](v6, "selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVideoSettings:negotiatedVideoSettings:isScreen:", [&unk_1F3DC5208 unsignedIntValue], objc_msgSend(v10, "unsignedIntValue"), objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "unsignedIntValue"), v7, a3, v22, v16);
            }
            uint64_t v12 = [&unk_1F3DC7920 countByEnumeratingWithState:&v25 objects:v24 count:16];
          }
          while (v12);
        }
        uint64_t v9 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v30 objects:v29 count:16];
    }
    while (v20);
  }
  return v8 & 1;
}

- (void)setupFaceTimeSettingsForMediaBlob:(id)a3 isResponse:(BOOL)a4
{
  BOOL v4 = a4;
  long long v27 = objc_alloc_init(VCMediaNegotiationFaceTimeSettings);
  if (v4)
  {
    p_negotiatedFaceTimeSettings = (id *)&self->super._negotiatedFaceTimeSettings;
    BOOL v8 = [(VCMediaNegotiatorResultsFaceTimeSettings *)self->super._negotiatedFaceTimeSettings SIPDisabled];
    BOOL v9 = v8;
    if (v8) {
      int v10 = 2;
    }
    else {
      int v10 = 0;
    }
    unsigned int v11 = [*p_negotiatedFaceTimeSettings secureMessagingRequired];
    char v12 = v11;
    [(VCMediaNegotiationFaceTimeSettings *)v27 setCapabilities:v10 | v11];
    char v13 = [*p_negotiatedFaceTimeSettings faceTimeSwitches];
    unsigned int v14 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings faceTimeSwitches] & 2 | v13 & 1;
    unsigned int v15 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings faceTimeSwitches] & 4;
    unsigned int v16 = v14 | v15 | [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings faceTimeSwitches] & 8;
    int v17 = [*p_negotiatedFaceTimeSettings faceTimeSwitches] & 0x10;
    unsigned int v18 = v17 | [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings faceTimeSwitches] & 0x20;
    int v22 = v16 | v18 | [*p_negotiatedFaceTimeSettings faceTimeSwitches] & 0x40;
    unsigned int v19 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings faceTimeSwitches] & 0x80;
    int v20 = v19 | [*p_negotiatedFaceTimeSettings faceTimeSwitches] & 0x100;
    int v21 = v20 | [*p_negotiatedFaceTimeSettings faceTimeSwitches] & 0x200;
    -[VCMediaNegotiationFaceTimeSettings setSwitches:](v27, "setSwitches:", v22 | v21 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x400 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x800 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x1000 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x2000 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x4000 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x8000 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x10000 | [*p_negotiatedFaceTimeSettings faceTimeSwitches] & 0x20000 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x40000 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x80000 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x100000 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x200000 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x400000 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x800000 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x1000000 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x2000000 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x4000000 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x8000000 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x10000000 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x20000000 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x40000000);
    LOBYTE(v22) = [*p_negotiatedFaceTimeSettings oneToOneModeSupported];
    if ((v22 & 1) == 0) {
      goto LABEL_12;
    }
LABEL_11:
    [(VCMediaNegotiationFaceTimeSettings *)v27 setOneToOneModeSupported:1];
    goto LABEL_12;
  }
  p_negotiatedFaceTimeSettings = (id *)&self->super._localSettings;
  BOOL v23 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings SIPDisabled];
  BOOL v9 = v23;
  if (v23) {
    int v24 = 2;
  }
  else {
    int v24 = 0;
  }
  unsigned int v25 = [*p_negotiatedFaceTimeSettings secureMessagingRequired];
  char v12 = v25;
  [(VCMediaNegotiationFaceTimeSettings *)v27 setCapabilities:v24 | v25];
  -[VCMediaNegotiationFaceTimeSettings setSwitches:](v27, "setSwitches:", [*p_negotiatedFaceTimeSettings faceTimeSwitches]);
  int v22 = [*p_negotiatedFaceTimeSettings oneToOneModeSupported];
  if (v22) {
    goto LABEL_11;
  }
LABEL_12:
  -[VCMediaNegotiationFaceTimeSettings setMediaControlInfoSubVersion:](v27, "setMediaControlInfoSubVersion:", [*p_negotiatedFaceTimeSettings mediaControlInfoFECFeedbackVersion]);
  [(VCMediaNegotiationFaceTimeSettings *)v27 setLinkProbingCapabilityVersion:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings linkProbingCapabilityVersion]];
  if (v9
    || (v12 & 1) != 0
    || ([(VCMediaNegotiationFaceTimeSettings *)v27 switches] ? (char v26 = 1) : (char v26 = v22),
        (v26 & 1) != 0
     || [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaControlInfoFECFeedbackVersion]|| [(VCMediaNegotiationFaceTimeSettings *)v27 linkProbingCapabilityVersion]))
  {
    [a3 setFaceTimeSettings:v27];
  }
}

- (BOOL)negotiateFaceTimeSettings:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  p_negotiatedFaceTimeSettings = &self->super._negotiatedFaceTimeSettings;
  if ([a3 hasCapabilities])
  {
    -[VCMediaNegotiatorResultsFaceTimeSettings setSIPDisabled:](self->super._negotiatedFaceTimeSettings, "setSIPDisabled:", -[VCMediaNegotiatorLocalConfiguration SIPDisabled](self->super._localSettings, "SIPDisabled") & (([a3 capabilities] & 2) >> 1));
    int v6 = [a3 capabilities];
    uint64_t v7 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings secureMessagingRequired] & v6;
  }
  else
  {
    [(VCMediaNegotiatorResultsFaceTimeSettings *)self->super._negotiatedFaceTimeSettings setSIPDisabled:0];
    uint64_t v7 = 0;
  }
  [(VCMediaNegotiatorResultsFaceTimeSettings *)*p_negotiatedFaceTimeSettings setSecureMessagingRequired:v7];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  BOOL v9 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    unsigned int v11 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = [(VCMediaNegotiatorResultsFaceTimeSettings *)self->super._negotiatedFaceTimeSettings SIPDisabled];
      int v26 = 136315906;
      uint64_t v27 = v10;
      __int16 v28 = 2080;
      uint64_t v29 = "-[VCMediaNegotiator negotiateFaceTimeSettings:]";
      __int16 v30 = 1024;
      int v31 = 1576;
      __int16 v32 = 1024;
      BOOL v33 = v12;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch after negotiation disableSIPEnabled %d", (uint8_t *)&v26, 0x22u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    unsigned int v14 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v15 = [(VCMediaNegotiatorResultsFaceTimeSettings *)self->super._negotiatedFaceTimeSettings secureMessagingRequired];
      int v26 = 136315906;
      uint64_t v27 = v13;
      __int16 v28 = 2080;
      uint64_t v29 = "-[VCMediaNegotiator negotiateFaceTimeSettings:]";
      __int16 v30 = 1024;
      int v31 = 1577;
      __int16 v32 = 1024;
      BOOL v33 = v15;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch after negotiation secureMessagingEnabled %d", (uint8_t *)&v26, 0x22u);
    }
  }
  if ([a3 hasSwitches]) {
    uint64_t v16 = [a3 switches];
  }
  else {
    uint64_t v16 = 0;
  }
  [(VCMediaNegotiatorResultsFaceTimeSettings *)self->super._negotiatedFaceTimeSettings setFaceTimeSwitches:v16];
  -[VCMediaNegotiatorResultsFaceTimeSettings setRemoteFaceTimeSwitchesAvailable:](self->super._negotiatedFaceTimeSettings, "setRemoteFaceTimeSwitchesAvailable:", [a3 hasSwitches]);
  BOOL v17 = [a3 hasOneToOneModeSupported]
     && [a3 oneToOneModeSupported]
     && [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings oneToOneModeSupported];
  [(VCMediaNegotiatorResultsFaceTimeSettings *)self->super._negotiatedFaceTimeSettings setOneToOneModeSupported:v17];
  if ([a3 hasMediaControlInfoSubVersion])
  {
    unsigned int v18 = [a3 mediaControlInfoFECFeedbackVersion];
    unsigned int v19 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaControlInfoFECFeedbackVersion];
    if (v18 >= v19) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = v18;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  [(VCMediaNegotiatorResultsFaceTimeSettings *)self->super._negotiatedFaceTimeSettings setMediaControlInfoFECFeedbackVersion:v20];
  int v21 = [a3 hasLinkProbingCapabilityVersion];
  if (v21) {
    LOBYTE(v21) = [a3 linkProbingCapabilityVersion];
  }
  [(VCMediaNegotiatorResultsFaceTimeSettings *)self->super._negotiatedFaceTimeSettings setRemoteLinkProbingCapabilityVersion:v21];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    BOOL v23 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = [(VCMediaNegotiatorResultsFaceTimeSettings *)self->super._negotiatedFaceTimeSettings mediaControlInfoFECFeedbackVersion];
      int v26 = 136315906;
      uint64_t v27 = v22;
      __int16 v28 = 2080;
      uint64_t v29 = "-[VCMediaNegotiator negotiateFaceTimeSettings:]";
      __int16 v30 = 1024;
      int v31 = 1597;
      __int16 v32 = 1024;
      BOOL v33 = v24;
      _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch after negotiation mediaControlInfoFECFeedbackVersion '%d'", (uint8_t *)&v26, 0x22u);
    }
  }
  return 1;
}

- (void)setupMomentsForMediaBlob:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![+[VCDefaults sharedInstance] momentsUserPreferenceEnabled])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      BOOL v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315650;
        uint64_t v10 = v7;
        __int16 v11 = 2080;
        BOOL v12 = "-[VCMediaNegotiator setupMomentsForMediaBlob:]";
        __int16 v13 = 1024;
        int v14 = 1607;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Moments user preference Not Enabled.", (uint8_t *)&v9, 0x1Cu);
      }
    }
    goto LABEL_11;
  }
  uint64_t v5 = [[VCMediaNegotiationBlobMomentsSettings alloc] initWithVideoCodecs:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaRecorderVideoCodecs] imageTypes:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaRecorderImageTypes] capabilities:[+[VCVideoRuleCollectionsMediaRecorder sharedInstance](VCVideoRuleCollectionsMediaRecorder, "sharedInstance") mediaRecorderCapabilities] multiwayCapabilities:[+[VCVideoRuleCollectionsMediaRecorder sharedInstance] mediaRecorderCapabilities]];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator setupMomentsForMediaBlob:]();
      }
    }
LABEL_11:
    int v6 = 0;
    goto LABEL_4;
  }
  int v6 = v5;
  [a3 setMomentsSettings:v5];
LABEL_4:
}

- (BOOL)negotiateMomentsWithMomentsSettings:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([+[VCDefaults sharedInstance] momentsUserPreferenceEnabled])
  {
    if ([a3 hasSupportedVideoCodecs]
      && ([a3 supportedVideoCodecs] & 2) != 0
      && +[VCHardwareSettings supportsHEVCEncoding])
    {
      uint64_t v5 = 100;
    }
    else
    {
      uint64_t v5 = 123;
    }
    [(VCMediaNegotiatorResultsMediaRecorder *)self->super._negotiatedMediaRecorderSettings setVideoCodec:v5];
    BOOL v6 = [a3 hasSupportedImageTypes]
      && ([a3 supportedImageTypes] & 2) != 0
      && +[VCHardwareSettings supportsHEIFEncoding];
    [(VCMediaNegotiatorResultsMediaRecorder *)self->super._negotiatedMediaRecorderSettings setImageType:v6];
    -[VCMediaNegotiatorResultsMediaRecorder setCapabilities:](self->super._negotiatedMediaRecorderSettings, "setCapabilities:", +[VCMediaNegotiationBlobMomentsSettings avcMomentsCapabilitiesForMultiwayMomentsCapabilities:](VCMediaNegotiationBlobMomentsSettings, "avcMomentsCapabilitiesForMultiwayMomentsCapabilities:", [a3 multiwayCapabilities]));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      __int16 v13 = "-[VCMediaNegotiator negotiateMomentsWithMomentsSettings:]";
      __int16 v14 = 1024;
      int v15 = 1621;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Moments user preference Not Enabled.", (uint8_t *)&v10, 0x1Cu);
    }
  }
  return 1;
}

- (void)setupMultiwayAudioStreamsForMediaBlob:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v4 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings multiwayAudioStreams];
  uint64_t v5 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = [[VCMediaNegotiationBlobMultiwayAudioStream alloc] initWithStreamConfig:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        [a3 addMultiwayAudioStreams:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
}

- (BOOL)negotiateMultiwayAudioStreams:(id)a3
{
  obuint64_t j = (VCMediaNegotiatorStreamGroupConfiguration *)a3;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if ((VCMediaNegotiator *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v48 = v5;
        __int16 v49 = 2080;
        __int16 v50 = "-[VCMediaNegotiator negotiateMultiwayAudioStreams:]";
        __int16 v51 = 1024;
        int v52 = 1655;
        __int16 v53 = 2112;
        id v54 = obj;
        uint64_t v7 = " [%s] %s:%d multiwayAudioStreams=%@";
        uint64_t v8 = v6;
        uint32_t v9 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v4 = (__CFString *)[(VCMediaNegotiator *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      long long v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v48 = v10;
        __int16 v49 = 2080;
        __int16 v50 = "-[VCMediaNegotiator negotiateMultiwayAudioStreams:]";
        __int16 v51 = 1024;
        int v52 = 1655;
        __int16 v53 = 2112;
        id v54 = v4;
        __int16 v55 = 2048;
        long long v56 = self;
        __int16 v57 = 2112;
        long long v58 = obj;
        uint64_t v7 = " [%s] %s:%d %@(%p) multiwayAudioStreams=%@";
        uint64_t v8 = v11;
        uint32_t v9 = 58;
        goto LABEL_11;
      }
    }
  }
  long long v12 = [[VCMediaNegotiatorStreamGroupConfiguration alloc] initWithGroupID:1835623282 mediaType:1936684398 subtype:0 syncGroupID:0];
  if (v12)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v13 = [(VCMediaNegotiatorStreamGroupConfiguration *)obj countByEnumeratingWithState:&v43 objects:v42 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v36 = *(void *)v44;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v44 != v36) {
            objc_enumerationMutation(obj);
          }
          id v16 = -[VCMediaNegotiator newStreamConfigFromMultiwayAudioStream:](self, "newStreamConfigFromMultiwayAudioStream:", *(void *)(*((void *)&v43 + 1) + 8 * i), obj);
          if (!v16)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCMediaNegotiator negotiateMultiwayAudioStreams:]();
              }
            }
            goto LABEL_38;
          }
          BOOL v17 = v16;
          [(VCMediaNegotiatorStreamGroupConfiguration *)v12 addStreamConfig:v16];
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          unsigned int v18 = (void *)[v17 payloads];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v37 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v39;
            while (2)
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v39 != v21) {
                  objc_enumerationMutation(v18);
                }
                if ([*(id *)(*((void *)&v38 + 1) + 8 * j) integerValue] != 20)
                {
                  id v23 = -[VCMediaNegotiator newStreamGroupCodecConfigForPayload:](self, "newStreamGroupCodecConfigForPayload:");
                  if (!v23)
                  {

                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      VRTraceErrorLogLevelToCSTR();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                        -[VCMediaNegotiator negotiateMultiwayAudioStreams:].cold.4();
                      }
                    }
                    goto LABEL_38;
                  }
                  int v24 = v23;
                  [(VCMediaNegotiatorStreamGroupConfiguration *)v12 addCodecConfig:v23];
                  objc_msgSend(v17, "addCodec:", -[VCMediaNegotiatorStreamGroupConfiguration indexOfCodecConfig:](v12, "indexOfCodecConfig:", v24));
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v37 count:16];
              if (v20) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v14 = [(VCMediaNegotiatorStreamGroupConfiguration *)obj countByEnumeratingWithState:&v43 objects:v42 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    if ([(NSOrderedSet *)[(VCMediaNegotiatorStreamGroupConfiguration *)v12 codecConfigs] count])
    {
      [(NSMutableArray *)self->super._negotiatedStreamGroups addObject:v12];
      if ((VCMediaNegotiator *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_47;
        }
        uint64_t v27 = VRTraceErrorLogLevelToCSTR();
        __int16 v28 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_47;
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v48 = v27;
        __int16 v49 = 2080;
        __int16 v50 = "-[VCMediaNegotiator negotiateMultiwayAudioStreams:]";
        __int16 v51 = 1024;
        int v52 = 1681;
        __int16 v53 = 2112;
        id v54 = v12;
        uint64_t v29 = " [%s] %s:%d negotiated audio streamGroupConfig=%@";
        __int16 v30 = v28;
        uint32_t v31 = 38;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          unsigned int v25 = (__CFString *)[(VCMediaNegotiator *)self performSelector:sel_logPrefix];
        }
        else {
          unsigned int v25 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_47;
        }
        uint64_t v32 = VRTraceErrorLogLevelToCSTR();
        BOOL v33 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_47;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v48 = v32;
        __int16 v49 = 2080;
        __int16 v50 = "-[VCMediaNegotiator negotiateMultiwayAudioStreams:]";
        __int16 v51 = 1024;
        int v52 = 1681;
        __int16 v53 = 2112;
        id v54 = v25;
        __int16 v55 = 2048;
        long long v56 = self;
        __int16 v57 = 2112;
        long long v58 = v12;
        uint64_t v29 = " [%s] %s:%d %@(%p) negotiated audio streamGroupConfig=%@";
        __int16 v30 = v33;
        uint32_t v31 = 58;
      }
      _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
LABEL_47:
      BOOL v26 = 1;
      goto LABEL_48;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator negotiateMultiwayAudioStreams:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaNegotiator negotiateMultiwayAudioStreams:]();
    }
  }
LABEL_38:
  BOOL v26 = 0;
LABEL_48:

  return v26;
}

- (void)setupMultiwayVideoStreamsForMediaBlob:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v4 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings multiwayVideoStreams];
  uint64_t v5 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint32_t v9 = [[VCMediaNegotiationBlobMultiwayVideoStream alloc] initWithStreamConfig:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        [a3 addMultiwayVideoStream:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
}

- (BOOL)isVideoStreamSupported:(int)a3
{
  if (a3 == 128) {
    return 0;
  }
  uint64_t v5 = *(void *)&a3;
  id v6 = +[VCHardwareSettings supportedVideoPayloads];
  uint64_t v7 = [NSNumber numberWithUnsignedInt:v5];
  return [v6 containsObject:v7];
}

- (BOOL)negotiateMultiwayVideoStreams:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  if ((VCMediaNegotiator *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v78 = v6;
        __int16 v79 = 2080;
        v80 = "-[VCMediaNegotiator negotiateMultiwayVideoStreams:]";
        __int16 v81 = 1024;
        int v82 = 1709;
        __int16 v83 = 2112;
        id v84 = a3;
        uint64_t v8 = " [%s] %s:%d multiwayVideoStreams=%@";
        uint32_t v9 = v7;
        uint32_t v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCMediaNegotiator *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      long long v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v78 = v11;
        __int16 v79 = 2080;
        v80 = "-[VCMediaNegotiator negotiateMultiwayVideoStreams:]";
        __int16 v81 = 1024;
        int v82 = 1709;
        __int16 v83 = 2112;
        id v84 = v5;
        __int16 v85 = 2048;
        v86 = self;
        __int16 v87 = 2112;
        id v88 = a3;
        uint64_t v8 = " [%s] %s:%d %@(%p) multiwayVideoStreams=%@";
        uint32_t v9 = v12;
        uint32_t v10 = 58;
        goto LABEL_11;
      }
    }
  }
  if (objc_msgSend(+[VCHardwareSettings supportedVideoPayloads](VCHardwareSettings, "supportedVideoPayloads"), "count"))
  {
    obuint64_t j = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    uint64_t v13 = [a3 countByEnumeratingWithState:&v73 objects:v72 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v74;
      id v16 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v74 != v15) {
            objc_enumerationMutation(a3);
          }
          unsigned int v18 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          if ([v18 isSubStream])
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
            {
              uint64_t v19 = VRTraceErrorLogLevelToCSTR();
              uint64_t v20 = *v16;
              if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v78 = v19;
                __int16 v79 = 2080;
                v80 = "-[VCMediaNegotiator negotiateMultiwayVideoStreams:]";
                __int16 v81 = 1024;
                int v82 = 1724;
                _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Error substreams not supported with stream groups", buf, 0x1Cu);
              }
            }
          }
          else
          {
            [obj addObject:v18];
          }
        }
        uint64_t v14 = [a3 countByEnumeratingWithState:&v73 objects:v72 count:16];
      }
      while (v14);
    }
    uint64_t v21 = [[VCMediaNegotiatorStreamGroupConfiguration alloc] initWithGroupID:1667329381 mediaType:1986618469 subtype:875704438 syncGroupID:1835623282];
    if (v21)
    {
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      uint64_t v55 = [obj countByEnumeratingWithState:&v68 objects:v67 count:16];
      if (v55)
      {
        uint64_t v54 = *(void *)v69;
        *(void *)&long long v23 = 136315650;
        long long v53 = v23;
        while (2)
        {
          for (uint64_t j = 0; j != v55; ++j)
          {
            if (*(void *)v69 != v54) {
              objc_enumerationMutation(obj);
            }
            id v25 = -[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:](self, "newStreamConfigFromMultiwayVideoStream:", *(void *)(*((void *)&v68 + 1) + 8 * j), v53);
            if (!v25)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[VCMediaNegotiator negotiateMultiwayVideoStreams:].cold.4();
                }
              }
              goto LABEL_58;
            }
            BOOL v26 = v25;
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            uint64_t v27 = (void *)[v25 payloads];
            uint64_t v28 = [v27 countByEnumeratingWithState:&v63 objects:v62 count:16];
            if (v28)
            {
              uint64_t v29 = v28;
              uint64_t v30 = *(void *)v64;
              while (2)
              {
                for (uint64_t k = 0; k != v29; ++k)
                {
                  if (*(void *)v64 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  id v32 = -[VCMediaNegotiator newStreamGroupCodecConfigForPayload:](self, "newStreamGroupCodecConfigForPayload:", [*(id *)(*((void *)&v63 + 1) + 8 * k) integerValue]);
                  if (!v32)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      uint64_t v39 = VRTraceErrorLogLevelToCSTR();
                      long long v40 = *MEMORY[0x1E4F47A50];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = v53;
                        uint64_t v78 = v39;
                        __int16 v79 = 2080;
                        v80 = "-[VCMediaNegotiator negotiateMultiwayVideoStreams:]";
                        __int16 v81 = 1024;
                        int v82 = 1746;
                        _os_log_error_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate media blob stream group codec config", buf, 0x1Cu);
                      }
                    }
                    goto LABEL_52;
                  }
                  BOOL v33 = v32;
                  [v22 addObject:v32];
                }
                uint64_t v29 = [v27 countByEnumeratingWithState:&v63 objects:v62 count:16];
                if (v29) {
                  continue;
                }
                break;
              }
            }
            if ([v22 count])
            {
              long long v60 = 0u;
              long long v61 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              uint64_t v34 = [v22 countByEnumeratingWithState:&v58 objects:v57 count:16];
              if (v34)
              {
                uint64_t v35 = v34;
                uint64_t v36 = *(void *)v59;
                do
                {
                  for (uint64_t m = 0; m != v35; ++m)
                  {
                    if (*(void *)v59 != v36) {
                      objc_enumerationMutation(v22);
                    }
                    uint64_t v38 = *(void *)(*((void *)&v58 + 1) + 8 * m);
                    [(VCMediaNegotiatorStreamGroupConfiguration *)v21 addCodecConfig:v38];
                    objc_msgSend(v26, "addCodec:", -[VCMediaNegotiatorStreamGroupConfiguration indexOfCodecConfig:](v21, "indexOfCodecConfig:", v38));
                  }
                  uint64_t v35 = [v22 countByEnumeratingWithState:&v58 objects:v57 count:16];
                }
                while (v35);
              }
              [(VCMediaNegotiatorStreamGroupConfiguration *)v21 addStreamConfig:v26];
            }
LABEL_52:
            [v22 removeAllObjects];
          }
          uint64_t v55 = [obj countByEnumeratingWithState:&v68 objects:v67 count:16];
          if (v55) {
            continue;
          }
          break;
        }
      }
LABEL_58:

      if ([(NSOrderedSet *)[(VCMediaNegotiatorStreamGroupConfiguration *)v21 streamConfigs] count])
      {
        if ([(NSOrderedSet *)[(VCMediaNegotiatorStreamGroupConfiguration *)v21 codecConfigs] count])
        {
          [(NSMutableArray *)self->super._negotiatedStreamGroups addObject:v21];
          if ((VCMediaNegotiator *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
              goto LABEL_75;
            }
            uint64_t v45 = VRTraceErrorLogLevelToCSTR();
            long long v46 = *MEMORY[0x1E4F47A50];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_75;
            }
            *(_DWORD *)buf = 136315906;
            uint64_t v78 = v45;
            __int16 v79 = 2080;
            v80 = "-[VCMediaNegotiator negotiateMultiwayVideoStreams:]";
            __int16 v81 = 1024;
            int v82 = 1767;
            __int16 v83 = 2112;
            id v84 = v21;
            long long v47 = " [%s] %s:%d negotiated video streamGroupConfig=%@";
            uint64_t v48 = v46;
            uint32_t v49 = 38;
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              long long v41 = (__CFString *)[(VCMediaNegotiator *)self performSelector:sel_logPrefix];
            }
            else {
              long long v41 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
              goto LABEL_75;
            }
            uint64_t v50 = VRTraceErrorLogLevelToCSTR();
            __int16 v51 = *MEMORY[0x1E4F47A50];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_75;
            }
            *(_DWORD *)buf = 136316418;
            uint64_t v78 = v50;
            __int16 v79 = 2080;
            v80 = "-[VCMediaNegotiator negotiateMultiwayVideoStreams:]";
            __int16 v81 = 1024;
            int v82 = 1767;
            __int16 v83 = 2112;
            id v84 = v41;
            __int16 v85 = 2048;
            v86 = self;
            __int16 v87 = 2112;
            id v88 = v21;
            long long v47 = " [%s] %s:%d %@(%p) negotiated video streamGroupConfig=%@";
            uint64_t v48 = v51;
            uint32_t v49 = 58;
          }
          _os_log_impl(&dword_1E1EA4000, v48, OS_LOG_TYPE_DEFAULT, v47, buf, v49);
LABEL_75:
          BOOL v44 = 1;
LABEL_76:

          return v44;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaNegotiator negotiateMultiwayVideoStreams:]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiator negotiateMultiwayVideoStreams:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator negotiateMultiwayVideoStreams:]();
      }
    }
    BOOL v44 = 0;
    goto LABEL_76;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v42 = VRTraceErrorLogLevelToCSTR();
    long long v43 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v78 = v42;
      __int16 v79 = 2080;
      v80 = "-[VCMediaNegotiator negotiateMultiwayVideoStreams:]";
      __int16 v81 = 1024;
      int v82 = 1716;
      _os_log_impl(&dword_1E1EA4000, v43, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating video streams, as this device is audio only", buf, 0x1Cu);
    }
  }
  return 1;
}

- (id)newStreamGroupCodecConfigForPayload:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v4 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator newStreamGroupCodecConfigForPayload:]();
      }
    }
    goto LABEL_11;
  }
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v4 setCodecType:+[VCPayloadUtils codecTypeForPayload:v3]];
  if (![(VCMediaNegotiatorStreamGroupCodecConfiguration *)v4 codecType])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator newStreamGroupCodecConfigForPayload:]();
      }
    }
LABEL_11:

    return 0;
  }
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v4 setRtpPayload:v3];
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v4 setPTime:20];
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v4 setCipherSuite:3];
  return v4;
}

- (id)newStreamConfigFromMultiwayAudioStream:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v4 = objc_alloc_init(VCMediaNegotiatorStreamGroupStreamConfiguration);
  if (v4)
  {
    uint64_t v5 = (void *)[a3 newMultiwayAudioStream];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v6 = (void *)[v5 supportedAudioPayloads];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          -[VCMediaNegotiatorStreamGroupStreamConfiguration addPayload:](v4, "addPayload:", [*(id *)(*((void *)&v20 + 1) + 8 * i) unsignedIntValue]);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v19 count:16];
      }
      while (v8);
    }

    -[VCMediaNegotiatorStreamGroupStreamConfiguration setSsrc:](v4, "setSsrc:", [a3 ssrc]);
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setStreamID:](v4, "setStreamID:", (unsigned __int16)[a3 streamID]);
    [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v4 setMetadata:0];
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setQualityIndex:](v4, "setQualityIndex:", [a3 qualityIndex]);
    int v11 = [a3 hasMaxNetworkBitrate];
    uint64_t v12 = 0;
    if (v11) {
      uint64_t v12 = objc_msgSend(a3, "maxNetworkBitrate", 0);
    }
    [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v4 setMaxNetworkBitrate:v12];
    if ([a3 hasMaxMediaBitrate]) {
      uint64_t v13 = [a3 maxMediaBitrate];
    }
    else {
      uint64_t v13 = 0;
    }
    [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v4 setMaxMediaBitrate:v13];
    if ([a3 hasMaxPacketsPerSecond])
    {
      [a3 maxPacketsPerSecond];
      uint64_t v15 = v14;
    }
    else
    {
      uint64_t v15 = 0;
    }
    [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v4 setMaxPacketsPerSecond:v15];
    int v16 = [a3 hasRepairedStreamID];
    if (v16) {
      LOWORD(v16) = [a3 repairedStreamID];
    }
    [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v4 setRepairedStreamID:(unsigned __int16)v16];
    if ([a3 hasRepairedMaxNetworkBitrate]) {
      uint64_t v17 = [a3 repairedMaxNetworkBitrate];
    }
    else {
      uint64_t v17 = 0;
    }
    [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v4 setRepairedMaxNetworkBitrate:v17];
    [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v4 setRtpTimestampRate:24000];
    [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v4 setAudioChannelCount:1];
    [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v4 setCoordinateSystem:0];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaNegotiator newStreamConfigFromMultiwayAudioStream:]();
    }
  }
  return v4;
}

+ (unsigned)mappedRemoteQualityIndexForQualityIndex:(unsigned int)a3
{
  if (a3 == 62) {
    return 35;
  }
  else {
    return a3;
  }
}

- (id)newStreamConfigFromMultiwayVideoStream:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_alloc_init(VCMediaNegotiatorStreamGroupStreamConfiguration);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:]();
      }
    }
    goto LABEL_67;
  }
  if ([a3 metadata])
  {
    if ((VCMediaNegotiator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:].cold.5();
        }
      }
      goto LABEL_67;
    }
    if (objc_opt_respondsToSelector()) {
      float v14 = (__CFString *)[(VCMediaNegotiator *)self performSelector:sel_logPrefix];
    }
    else {
      float v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_67;
    }
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    uint64_t v19 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v27 = v18;
    __int16 v28 = 2080;
    uint64_t v29 = "-[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:]";
    __int16 v30 = 1024;
    int v31 = 1850;
    __int16 v32 = 2112;
    BOOL v33 = v14;
    __int16 v34 = 2048;
    uint64_t v35 = self;
    __int16 v36 = 1024;
    int v37 = [a3 metadata];
    long long v20 = " [%s] %s:%d %@(%p) Video stream sub-streams metadata=%d not supported in groups";
    goto LABEL_69;
  }
  if ([a3 metadata] >= 2)
  {
    if ((VCMediaNegotiator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:]();
        }
      }
      goto LABEL_67;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v15 = (__CFString *)[(VCMediaNegotiator *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_67;
    }
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    uint64_t v19 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v27 = v21;
    __int16 v28 = 2080;
    uint64_t v29 = "-[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:]";
    __int16 v30 = 1024;
    int v31 = 1853;
    __int16 v32 = 2112;
    BOOL v33 = v15;
    __int16 v34 = 2048;
    uint64_t v35 = self;
    __int16 v36 = 1024;
    int v37 = [a3 metadata];
    long long v20 = " [%s] %s:%d %@(%p) Unknown metadata flags. metadata=%d not supported in groups";
    goto LABEL_69;
  }
  uint64_t v6 = +[VCMediaNegotiationBlobMultiwayVideoStream payloadForVideoPayload:](VCMediaNegotiationBlobMultiwayVideoStream, "payloadForVideoPayload:", [a3 payload]);
  if (![(VCMediaNegotiator *)self isVideoStreamSupported:v6])
  {
    if ((VCMediaNegotiator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:].cold.4();
        }
      }
      goto LABEL_67;
    }
    if (objc_opt_respondsToSelector()) {
      int v16 = (__CFString *)[(VCMediaNegotiator *)self performSelector:sel_logPrefix];
    }
    else {
      int v16 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_67;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    uint64_t v19 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v27 = v22;
    __int16 v28 = 2080;
    uint64_t v29 = "-[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:]";
    __int16 v30 = 1024;
    int v31 = 1857;
    __int16 v32 = 2112;
    BOOL v33 = v16;
    __int16 v34 = 2048;
    uint64_t v35 = self;
    __int16 v36 = 1024;
    int v37 = v6;
    long long v20 = " [%s] %s:%d %@(%p) Video stream payload=%d is not supported";
    goto LABEL_69;
  }
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v5 addPayload:v6];
  uint64_t v25 = 0;
  if (!+[VCMediaNegotiationBlobMultiwayVideoStream convertVideoFormat:width:height:](VCMediaNegotiationBlobMultiwayVideoStream, "convertVideoFormat:width:height:", [a3 supportedVideoFormats], (char *)&v25 + 4, &v25))
  {
    if ((VCMediaNegotiator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:]();
        }
      }
      goto LABEL_67;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v17 = (__CFString *)[(VCMediaNegotiator *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v23 = VRTraceErrorLogLevelToCSTR(),
          uint64_t v19 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_67:

      return 0;
    }
    int v24 = [a3 supportedVideoFormats];
    *(_DWORD *)buf = 136316418;
    uint64_t v27 = v23;
    __int16 v28 = 2080;
    uint64_t v29 = "-[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:]";
    __int16 v30 = 1024;
    int v31 = 1863;
    __int16 v32 = 2112;
    BOOL v33 = v17;
    __int16 v34 = 2048;
    uint64_t v35 = self;
    __int16 v36 = 1024;
    int v37 = v24;
    long long v20 = " [%s] %s:%d %@(%p) Video stream has an invalid video resolution. supportedVideoFormats %d";
LABEL_69:
    _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0x36u);
    goto LABEL_67;
  }
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setResolution:](v5, "setResolution:", (double)SHIDWORD(v25), (double)(int)v25);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setSsrc:](v5, "setSsrc:", [a3 ssrc]);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setStreamID:](v5, "setStreamID:", (unsigned __int16)[a3 streamID]);
  if ([a3 hasMetadata]) {
    uint64_t v7 = [a3 metadata];
  }
  else {
    uint64_t v7 = 0;
  }
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v5 setMetadata:v7];
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setQualityIndex:](v5, "setQualityIndex:", +[VCMediaNegotiator mappedRemoteQualityIndexForQualityIndex:](VCMediaNegotiator, "mappedRemoteQualityIndexForQualityIndex:", [a3 qualityIndex]));
  if ([a3 hasMaxNetworkBitrate]) {
    uint64_t v8 = [a3 maxNetworkBitrate];
  }
  else {
    uint64_t v8 = 0;
  }
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v5 setMaxNetworkBitrate:v8];
  if ([a3 hasMaxMediaBitrate]) {
    uint64_t v9 = [a3 maxMediaBitrate];
  }
  else {
    uint64_t v9 = 0;
  }
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v5 setMaxMediaBitrate:v9];
  if ([a3 hasMaxPacketsPerSecond]) {
    uint64_t v10 = [a3 maxPacketsPerSecond];
  }
  else {
    uint64_t v10 = 0;
  }
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v5 setMaxPacketsPerSecond:v10];
  int v11 = [a3 hasRepairedStreamID];
  if (v11) {
    LOWORD(v11) = [a3 repairedStreamID];
  }
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v5 setRepairedStreamID:(unsigned __int16)v11];
  if ([a3 hasRepairedMaxNetworkBitrate]) {
    uint64_t v12 = [a3 repairedMaxNetworkBitrate];
  }
  else {
    uint64_t v12 = 0;
  }
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v5 setRepairedMaxNetworkBitrate:v12];
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setFramerate:](v5, "setFramerate:", [a3 frameRate]);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setKeyFrameInterval:](v5, "setKeyFrameInterval:", [a3 keyFrameInterval]);
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v5 setRtpTimestampRate:24000];
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v5 setCoordinateSystem:3];
  return v5;
}

- (int)mediaBlobLanguageWithLocale:(id)a3
{
  uint64_t v3 = (void *)mediaBlobLanguageWithLocale___mapping;
  if (!mediaBlobLanguageWithLocale___mapping)
  {
    uint64_t v3 = &unk_1F3DC8CF0;
    mediaBlobLanguageWithLocale___mapping = (uint64_t)&unk_1F3DC8CF0;
  }
  BOOL v4 = objc_msgSend(v3, "objectForKey:", objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F1C438]));
  if (v4)
  {
    LODWORD(v4) = [v4 intValue];
  }
  return (int)v4;
}

- (id)localeWithMediaBlobLanguage:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v7[2] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)localeWithMediaBlobLanguage___mapping;
  if (!localeWithMediaBlobLanguage___mapping)
  {
    v6[0] = &unk_1F3DC5490;
    v6[1] = &unk_1F3DC54A8;
    v7[0] = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
    v7[1] = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"zh_CN"];
    BOOL v4 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
    localeWithMediaBlobLanguage___mapping = (uint64_t)v4;
  }
  return (id)objc_msgSend(v4, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:", v3));
}

- (void)setupCaptionsForMediaBlob:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 setCanDisplayCaptions:1];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v7 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings captionsSenderLanguages];
    uint64_t v8 = [(NSSet *)v7 countByEnumeratingWithState:&v28 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      LODWORD(v10) = 0;
      uint64_t v11 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          int v14 = [(VCMediaNegotiator *)self mediaBlobLanguageWithLocale:v13];
          if (v13) {
            BOOL v15 = 0;
          }
          else {
            BOOL v15 = v10 == 0;
          }
          if (v15)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
            {
              uint64_t v16 = VRTraceErrorLogLevelToCSTR();
              uint64_t v17 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v18 = objc_msgSend((id)objc_msgSend(0, "objectForKey:", *MEMORY[0x1E4F1C438]), "UTF8String");
                int v19 = 136315906;
                uint64_t v20 = v16;
                __int16 v21 = 2080;
                uint64_t v22 = "-[VCMediaNegotiator setupCaptionsForMediaBlob:]";
                __int16 v23 = 1024;
                int v24 = 1927;
                __int16 v25 = 2080;
                uint64_t v26 = v18;
                _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unsupported captions languages in local langauges: %s.", (uint8_t *)&v19, 0x26u);
              }
            }
            goto LABEL_16;
          }
          uint64_t v10 = v14 | v10;
        }
        uint64_t v9 = [(NSSet *)v7 countByEnumeratingWithState:&v28 objects:v27 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      if (v10) {
        [v6 setSenderLanguages:v10];
      }
    }
    [a3 setCaptionsSettings:v6];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaNegotiator setupCaptionsForMediaBlob:]();
    }
  }
LABEL_16:
}

- (BOOL)negotiateCaptionsWithCaptionsSettings:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  -[VCMediaNegotiatorResultsCaptions setRemoteCanDisplayCaptions:](self->_negotiatedCaptionsSettings, "setRemoteCanDisplayCaptions:", [a3 canDisplayCaptions]);
  [(VCMediaNegotiatorResultsCaptions *)self->_negotiatedCaptionsSettings setLocalLanguages:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings captionsReceiverLanguages]];
  if (![a3 hasSenderLanguages]) {
    return 1;
  }
  uint64_t v5 = objc_opt_new();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = 1;
    do
    {
      uint64_t v8 = v7;
      if (([a3 senderLanguages] & v7) != 0)
      {
        id v9 = [(VCMediaNegotiator *)self localeWithMediaBlobLanguage:v8];
        if (v9) {
          [v6 addObject:v9];
        }
      }
      uint64_t v7 = (2 * v8);
    }
    while ((v8 & 1) != 0);
    if ([v6 count]) {
      [(VCMediaNegotiatorResultsCaptions *)self->_negotiatedCaptionsSettings setRemoteLanguages:v6];
    }

    return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
    return 0;
  }
  uint64_t v11 = VRTraceErrorLogLevelToCSTR();
  uint64_t v12 = *MEMORY[0x1E4F47A50];
  BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v13)
  {
    int v14 = 136315650;
    uint64_t v15 = v11;
    __int16 v16 = 2080;
    uint64_t v17 = "-[VCMediaNegotiator negotiateCaptionsWithCaptionsSettings:]";
    __int16 v18 = 1024;
    int v19 = 1954;
    _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to allcoate remote languages.", (uint8_t *)&v14, 0x1Cu);
    return 0;
  }
  return result;
}

+ (id)streamGroupIDsWithMediaBlob:(id)a3
{
  id v3 = +[VCMediaNegotiator newDecompressedBlob:](VCMediaNegotiator, "newDecompressedBlob:");
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiator streamGroupIDsWithMediaBlob:]();
      }
    }
    goto LABEL_20;
  }
  BOOL v4 = [[VCMediaNegotiationBlob alloc] initWithData:v3];
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiator streamGroupIDsWithMediaBlob:]();
      }
    }
LABEL_20:
    BOOL v4 = 0;
LABEL_21:
    uint64_t v6 = 0;
    goto LABEL_10;
  }
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiator streamGroupIDsWithMediaBlob:]();
      }
    }
    goto LABEL_21;
  }
  uint64_t v6 = (void *)v5;
  if ([(NSMutableArray *)[(VCMediaNegotiationBlob *)v4 multiwayAudioStreams] count]
    || [(VCMediaNegotiationBlob *)v4 hasAudioSettings])
  {
    [v6 addObject:&unk_1F3DC54C0];
  }
  if ([(NSMutableArray *)[(VCMediaNegotiationBlob *)v4 multiwayVideoStreams] count]
    || [(VCMediaNegotiationBlob *)v4 hasVideoSettings])
  {
    [v6 addObject:&unk_1F3DC54D8];
  }
LABEL_10:

  return v6;
}

- (BOOL)usePreNegotiation
{
  return self->_usePreNegotiation;
}

- (VCMediaNegotiatorResultsCaptions)negotiatedCaptionsSettings
{
  return self->_negotiatedCaptionsSettings;
}

- (int64_t)negotiationMode
{
  return self->_negotiationMode;
}

- (BOOL)isCellular16x9Capable
{
  return self->_isCellular16x9Capable;
}

- (void)initWithLocalSettings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate negotiation captions results", v2, v3, v4, v5, v6);
}

- (void)initWithLocalSettings:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid local configuration", v2, v3, v4, v5, v6);
}

- (void)isNegotiationModeValid:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaNegotiator isNegotiationModeValid:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid mediaStreamMode=%d", v2, *(const char **)v3, (unint64_t)"-[VCMediaNegotiator isNegotiationModeValid:]" >> 16, 127);
}

- (void)isNegotiationModeForScreenShare:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaNegotiator isNegotiationModeForScreenShare:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid mediaStreamMode=%d", v2, *(const char **)v3, (unint64_t)"-[VCMediaNegotiator isNegotiationModeForScreenShare:]" >> 16, 146);
}

- (void)negotiationData
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid media negotiator state: The callee tried to create the invite blob", v2, v3, v4, v5, v6);
}

- (void)processRemoteNegotiationData:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid media negotiator state: The caller tried to process the invite blob", v2, v3, v4, v5, v6);
}

- (void)processRemoteNegotiationData:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decompress the media blob", v2, v3, v4, v5, v6);
}

- (void)processRemoteNegotiationData:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decode the media blob", v2, v3, v4, v5, v6);
}

- (void)processRemoteNegotiationData:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate multiway video streams", v2, v3, v4, v5, v6);
}

- (void)processRemoteNegotiationData:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate multiway audio streams", v2, v3, v4, v5, v6);
}

- (void)processRemoteNegotiationData:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate moments settings", v2, v3, v4, v5, v6);
}

- (void)processRemoteNegotiationData:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate captions settings", v2, v3, v4, v5, v6);
}

- (void)processRemoteNegotiationData:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate screen settings", v2, v3, v4, v5, v6);
}

- (void)processRemoteNegotiationData:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate video settings", v2, v3, v4, v5, v6);
}

- (void)processRemoteNegotiationData:.cold.10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate audio settings", v2, v3, v4, v5, v6);
}

- (void)processRemoteNegotiationData:.cold.11()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate FaceTime settings", v2, v3, v4, v5, v6);
}

- (void)processRemoteNegotiationData:.cold.12()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Exception occurred while parsing remote invite blob: %@");
}

+ (void)negotiationBlobFromData:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Exception occurred while blob from data. exception=%@");
}

+ (void)localConfigurationWithData:deviceRole:preferredAudioPayload:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the local configuration", v2, v3, v4, v5, v6);
}

+ (void)localConfigurationWithData:deviceRole:preferredAudioPayload:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to inialize the local configuration", v2, v3, v4, v5, v6);
}

+ (void)addMediaConfigurationsToLocalConfiguration:withBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to generate microphoneConfiguration", v2, v3, v4, v5, v6);
}

+ (void)addMediaConfigurationsToLocalConfiguration:withBlob:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate screenConfiguration", v2, v3, v4, v5, v6);
}

+ (void)addMediaConfigurationsToLocalConfiguration:withBlob:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate cameraConfiguration", v2, v3, v4, v5, v6);
}

+ (void)initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to extract negotiation data", v2, v3, v4, v5, v6);
}

+ (void)initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to apply media configurations", v2, v3, v4, v5, v6);
}

- (void)newResponseBlob
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create bandwidth settings for media blob", v2, v3, v4, v5, v6);
}

- (void)processResponseBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decompress the media blob", v2, v3, v4, v5, v6);
}

- (void)processResponseBlob:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decode the media blob", v2, v3, v4, v5, v6);
}

- (void)processResponseBlob:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiation FaceTime settings", v2, v3, v4, v5, v6);
}

- (void)processResponseBlob:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiation moments settings", v2, v3, v4, v5, v6);
}

- (void)processResponseBlob:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiation captions settings", v2, v3, v4, v5, v6);
}

- (void)processResponseBlob:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to parse screen rules from response blob", v2, v3, v4, v5, v6);
}

- (void)processResponseBlob:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to parse video rules from response blob", v2, v3, v4, v5, v6);
}

- (void)processResponseBlob:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to parse audio rules from response blob", v2, v3, v4, v5, v6);
}

- (void)processResponseBlob:.cold.9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Exception occurred while parsing remote response blob: %@");
}

- (void)processResponseBlob:.cold.10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid media negotiator state: The callee tried to process the response blob", v2, v3, v4, v5, v6);
}

+ (void)negotiatedFeaturesStringWithLocalFeaturesString:remoteFeaturesString:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to allocate dictionary for local feature string", v2, v3, v4, v5, v6);
}

+ (void)negotiatedFeaturesStringWithLocalFeaturesString:remoteFeaturesString:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to allocate dictionary for remote feature string", v2, v3, v4, v5, v6);
}

+ (void)validateMultiwayVideoStreamConfigurations:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  objc_msgSend((id)OUTLINED_FUNCTION_12_6(v0, *MEMORY[0x1E4F143B8]), "ssrc");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Found substream with ssrc[%x] not associated with a parent stream", v3, v4, v5, v6, v7);
}

+ (void)validateMultiwayAudioStreamConfigurations:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unsupported audio substream !!", v2, v3, v4, v5, v6);
}

- (void)negotiateAudioDTXPayload:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d DTX payload not available!", v2, v3, v4, v5, v6);
}

- (void)negotiateAudioSettings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to extract audio rules from media negotiation blob", v2, v3, v4, v5, v6);
}

- (void)negotiateAudioSettings:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiation primary audio payload", v2, v3, v4, v5, v6);
}

- (void)setupAudioWithNegotiatedSettings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to extract audio configuration from media response blob", v2, v3, v4, v5, v6);
}

- (void)selectVideoFeatureString:selectedPayload:videoConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  objc_msgSend((id)OUTLINED_FUNCTION_12_6(v0, *MEMORY[0x1E4F143B8]), "intValue");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to find local video feature list %d", v3, v4, v5, v6, v7);
}

- (void)processParameterSets:videoResults:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  objc_msgSend((id)OUTLINED_FUNCTION_12_6(v0, *MEMORY[0x1E4F143B8]), "payload");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Parameter set is not valid for payload %u", v3, v4, v5, v6, v7);
}

- (void)negotiateVideoSettings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to extract video rules from media negotiation blob", v2, v3, v4, v5, v6);
}

- (void)negotiateVideoSettings:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No available payloads", v2, v3, v4, v5, v6);
}

- (void)negotiateVideoSettings:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate HDR modes correctly", v2, v3, v4, v5, v6);
}

- (void)negotiateVideoSettings:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate and set pixel format set", v2, v3, v4, v5, v6);
}

- (void)negotiateVideoSettings:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to set video parameter set", v2, v3, v4, v5, v6);
}

- (void)setupVideoWithNegotiatedSettings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to extract the video rule collection from response", v2, v3, v4, v5, v6);
}

- (void)setupVideoWithNegotiatedSettings:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to set video parameter set", v2, v3, v4, v5, v6);
}

- (void)setupVideoWithNegotiatedSettings:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate HDR modes correctly", v2, v3, v4, v5, v6);
}

- (void)setupVideoWithNegotiatedSettings:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retrieve negotiated pixel formats", v2, v3, v4, v5, v6);
}

- (void)negotiateScreenSettings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to extract screen rules from media negotiation blob", v2, v3, v4, v5, v6);
}

- (void)negotiateScreenSettings:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No available payloads", v2, v3, v4, v5, v6);
}

- (void)negotiateScreenSettings:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate HDR modes correctly", v2, v3, v4, v5, v6);
}

- (void)negotiateScreenSettings:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate and set pixel format set", v2, v3, v4, v5, v6);
}

- (void)negotiateScreenSettings:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to set screen parameter set", v2, v3, v4, v5, v6);
}

- (void)setupScreenWithNegotiatedSettings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to extract the screen rule collection from response", v2, v3, v4, v5, v6);
}

- (void)setupScreenWithNegotiatedSettings:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to set screen parameter set", v2, v3, v4, v5, v6);
}

- (void)setupScreenWithNegotiatedSettings:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate HDR modes correctly", v2, v3, v4, v5, v6);
}

- (void)setupScreenWithNegotiatedSettings:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retrieve negotiated pixel formats", v2, v3, v4, v5, v6);
}

- (void)setupMomentsForMediaBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate moments settings.", v2, v3, v4, v5, v6);
}

- (void)negotiateMultiwayAudioStreams:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media blob stream group config", v2, v3, v4, v5, v6);
}

- (void)negotiateMultiwayAudioStreams:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No codec configs in stream group", v2, v3, v4, v5, v6);
}

- (void)negotiateMultiwayAudioStreams:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media blob stream group stream config", v2, v3, v4, v5, v6);
}

- (void)negotiateMultiwayAudioStreams:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media blob stream group codec config", v2, v3, v4, v5, v6);
}

- (void)negotiateMultiwayVideoStreams:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media blob stream group config", v2, v3, v4, v5, v6);
}

- (void)negotiateMultiwayVideoStreams:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No streamConfigs in the stream group", v2, v3, v4, v5, v6);
}

- (void)negotiateMultiwayVideoStreams:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No codec configs in stream group", v2, v3, v4, v5, v6);
}

- (void)negotiateMultiwayVideoStreams:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media blob stream group stream config", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupCodecConfigForPayload:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate a codec configuration", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupCodecConfigForPayload:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate a codec configuration", v2, v3, v4, v5, v6);
}

- (void)newStreamConfigFromMultiwayAudioStream:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate a StreamGroup Stream configuration", v2, v3, v4, v5, v6);
}

- (void)newStreamConfigFromMultiwayVideoStream:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate a StreamGroup Stream configuration", v2, v3, v4, v5, v6);
}

- (void)newStreamConfigFromMultiwayVideoStream:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  [v0 metadata];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Unknown metadata flags. metadata=%d not supported in groups", v3, v4, v5, v6, v7);
}

- (void)newStreamConfigFromMultiwayVideoStream:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  objc_msgSend((id)OUTLINED_FUNCTION_12_6(v0, *MEMORY[0x1E4F143B8]), "supportedVideoFormats");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Video stream has an invalid video resolution. supportedVideoFormats %d", v3, v4, v5, v6, v7);
}

- (void)newStreamConfigFromMultiwayVideoStream:.cold.4()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Video stream payload=%d is not supported", v2, *(const char **)v3, (unint64_t)"-[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:]" >> 16, 1857);
}

- (void)newStreamConfigFromMultiwayVideoStream:.cold.5()
{
  OUTLINED_FUNCTION_11_0();
  [v0 metadata];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Video stream sub-streams metadata=%d not supported in groups", v3, v4, v5, v6, v7);
}

- (void)setupCaptionsForMediaBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate captions settings.", v2, v3, v4, v5, v6);
}

+ (void)streamGroupIDsWithMediaBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decompress the blob", v2, v3, v4, v5, v6);
}

+ (void)streamGroupIDsWithMediaBlob:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to unserialize the blob", v2, v3, v4, v5, v6);
}

+ (void)streamGroupIDsWithMediaBlob:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the stream group IDs", v2, v3, v4, v5, v6);
}

+ (void)streamGroupIDsWithMediaBlob:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Exception occurred while blob from data: %@");
}

@end