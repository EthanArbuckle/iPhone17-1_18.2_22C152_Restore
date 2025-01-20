@interface VCMediaNegotiatorV2
+ (BOOL)addFeatureListStringsToStreamGroupConfig:(id)a3 fromStreamGroupBlob:(id)a4;
+ (BOOL)addV1FeatureListStringsToStreamGroupConfig:(id)a3 mediaType:(unsigned __int8)a4;
+ (BOOL)addV2FeatureListStringsToStreamGroupConfig:(id)a3 fromStreamGroupBlob:(id)a4;
+ (BOOL)initializeLocalConfiguration:(id)a3 negotiationData:(id)a4 deviceRole:(int)a5 preferredAudioPayload:(int)a6;
+ (BOOL)updateCameraU1Config:(id)a3 forNegotiationBlob:(id)a4 localSupportedVideoPayloads:(id)a5 u1AuthTagEnabled:(BOOL)a6;
+ (BOOL)updateStreamGroupU1Config:(id)a3 forGroupId:(unsigned int)a4 withNegotiationBlob:(id)a5 streamGroupBlob:(id)a6 localSupportedVideoPayloads:(id)a7 u1AuthTagEnabled:(BOOL)a8;
+ (BOOL)updateVideoU1ConfigWithStreamGroupConfig:(id)a3 forNegotiationBlob:(id)a4 streamGroupBlob:(id)a5 localSupportedVideoPayloads:(id)a6 u1AuthTagEnabled:(BOOL)a7;
+ (CGSize)resolutionForStreamGroupConfig:(id)a3;
+ (float)frameRateForMediaType:(unsigned __int8)a3;
+ (id)featureStringWithMediaBlob:(id)a3;
+ (id)newCompressedBlob:(id)a3;
+ (id)newDecompressedBlob:(id)a3;
+ (id)newUnserializedMediaBlob:(id)a3;
+ (id)streamGroupIDsWithMediaBlob:(id)a3;
+ (id)u1RemoteSupportedCipherSuitesForBlob:(id)a3 mediaType:(unsigned __int8)a4 u1AuthTagEnabled:(BOOL)a5;
+ (int)filteredCipherSuitesFromNegotiatedCipherSuites:(int)a3 u1AuthTagEnabled:(BOOL)a4;
+ (unsigned)capabilitiesWithMomentSettings:(id)a3;
+ (void)dumpRemoteNegotiationData:(id)a3 forceFileDump:(BOOL)a4;
- (BOOL)appendBandwidthSettingsToMediaBlob:(id)a3;
- (BOOL)appendCameraOneToOneSettingsToMediaBlob:(id)a3;
- (BOOL)appendCodecFeaturesToMediaBlob:(id)a3;
- (BOOL)appendGeneralInfoToMediaBlob:(id)a3;
- (BOOL)appendMicrophoneOneToOneSettingsToMediaBlob:(id)a3;
- (BOOL)appendMomentsSettingsToMediaBlob:(id)a3;
- (BOOL)appendStreamGroupsToMediaBlob:(id)a3;
- (BOOL)mediaBlobHasFLSPerCodec:(id)a3;
- (BOOL)negotiateStreamGroupConfig:(id)a3 remoteInviteBlob:(id)a4;
- (BOOL)negotiateU1SettingsForStreamGroup:(id)a3;
- (BOOL)processRemoteNegotiationData:(id)a3;
- (BOOL)selectBestDecodeVideoRuleForTransport:(unsigned __int8)a3 payload:(int)a4 localVideoRuleCollection:(id)a5 remoteVideoRuleCollection:(id)a6;
- (BOOL)setupNegotiatedMomentsResultsWithRemoteMediaBlob:(id)a3;
- (BOOL)setupNegotiatedResultsWithRemoteMediaBlob:(id)a3;
- (BOOL)setupNegotiatedVideoSettingsWithRemoteMediaBlob:(id)a3;
- (BOOL)setupStreamGroupsWithRemoteMediaBlob:(id)a3;
- (id)negotiationData;
- (unsigned)remoteMaxBandwidthForArbiterMode:(unsigned __int8)a3 connectionType:(int)a4;
- (void)negotiationData;
- (void)setUpNegotiatedSystemAudioResultsWithRemoteMediaBlob:(id)a3;
- (void)setupNegotiatedAudioResultsWithRemoteMediaBlob:(id)a3;
- (void)setupNegotiatedFaceTimeSettingsWithRemoteMediaBlob:(id)a3;
@end

@implementation VCMediaNegotiatorV2

- (id)negotiationData
{
  v3 = objc_alloc_init(VCMediaNegotiationBlobV2);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiatorV2 negotiationData]();
      }
    }
    goto LABEL_20;
  }
  if (![(VCMediaNegotiatorV2 *)self appendGeneralInfoToMediaBlob:v3]
    || ![(VCMediaNegotiatorV2 *)self appendBandwidthSettingsToMediaBlob:v3]
    || ![(VCMediaNegotiatorV2 *)self appendCodecFeaturesToMediaBlob:v3]
    || ![(VCMediaNegotiatorV2 *)self appendMicrophoneOneToOneSettingsToMediaBlob:v3]|| ![(VCMediaNegotiatorV2 *)self appendCameraOneToOneSettingsToMediaBlob:v3]|| ![(VCMediaNegotiatorV2 *)self appendMomentsSettingsToMediaBlob:v3]|| ![(VCMediaNegotiatorV2 *)self appendStreamGroupsToMediaBlob:v3])
  {
LABEL_20:
    id v4 = 0;
    goto LABEL_16;
  }
  if (VCDefaults_GetBoolValueForKey(@"mediaNegotiatorV2CompressionEnabled", 0))
  {
    id v4 = +[VCMediaNegotiatorV2 newCompressedBlob:[(VCMediaNegotiationBlobV2 *)v3 data]];
    if (!v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiatorV2 negotiationData]();
        }
      }
      goto LABEL_20;
    }
  }
  else
  {
    id v4 = (id)objc_msgSend((id)-[VCMediaNegotiationBlobV2 data](v3, "data"), "copy");
  }
  [(VCMediaNegotiationBlobV2 *)v3 printWithTitle:@"Created invite media blob (version 2)" logFile:0];
LABEL_16:

  return v4;
}

+ (id)newCompressedBlob:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v9 = [a3 length];
  id v4 = malloc_type_calloc(1uLL, v9, 0x739AACE0uLL);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorV2 newCompressedBlob:]();
      }
    }
    goto LABEL_3;
  }
  [a3 bytes];
  [a3 length];
  if (CompressionUtils_CompressWithZLib())
  {
LABEL_3:
    v5 = 0;
    goto LABEL_8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      v13 = "+[VCMediaNegotiatorV2 newCompressedBlob:]";
      __int16 v14 = 1024;
      int v15 = 87;
      __int16 v16 = 1024;
      int v17 = [a3 length];
      __int16 v18 = 1024;
      int v19 = v9;
      __int16 v20 = 2048;
      double v21 = (float)((float)v9 / (float)(int)[a3 length]);
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media blob v2 size=%d -> %d bytes with ratio %f", buf, 0x32u);
    }
  }
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v4 length:v9];
LABEL_8:
  free(v4);
  return v5;
}

+ (id)newDecompressedBlob:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v9 = (int)((double)(int)[a3 length] * 1.5);
  id v4 = malloc_type_calloc(1uLL, v9, 0x3B10B78FuLL);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorV2 newDecompressedBlob:]();
      }
    }
    goto LABEL_3;
  }
  [a3 bytes];
  [a3 length];
  if (CompressionUtils_DecompressWithZlib())
  {
LABEL_3:
    v5 = 0;
    goto LABEL_8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      v13 = "+[VCMediaNegotiatorV2 newDecompressedBlob:]";
      __int16 v14 = 1024;
      int v15 = 101;
      __int16 v16 = 1024;
      int v17 = [a3 length];
      __int16 v18 = 1024;
      int v19 = v9;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media blob size=%d -> %d bytes", buf, 0x28u);
    }
  }
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v4 length:v9];
LABEL_8:
  free(v4);
  return v5;
}

+ (id)newUnserializedMediaBlob:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    if (!VCDefaults_GetBoolValueForKey(@"mediaNegotiatorV2CompressionEnabled", 0)) {
      return [[VCMediaNegotiationBlobV2 alloc] initWithData:v3];
    }
    id v3 = +[VCMediaNegotiatorV2 newDecompressedBlob:v3];
    if (v3) {
      return [[VCMediaNegotiationBlobV2 alloc] initWithData:v3];
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorV2 newUnserializedMediaBlob:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      +[VCMediaNegotiatorV2 newUnserializedMediaBlob:]();
    }
  }
  return 0;
}

- (BOOL)processRemoteNegotiationData:(id)a3
{
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiatorV2 processRemoteNegotiationData:]();
      }
    }
    goto LABEL_14;
  }
  +[VCMediaNegotiatorV2 dumpRemoteNegotiationData:a3 forceFileDump:0];
  id v5 = +[VCMediaNegotiatorV2 newUnserializedMediaBlob:a3];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiatorV2 processRemoteNegotiationData:]();
      }
    }
LABEL_14:
    BOOL v7 = 0;
    uint64_t v6 = 0;
    goto LABEL_7;
  }
  uint64_t v6 = v5;
  [v5 printWithTitle:@"Received invite media blob (version 2)" logFile:0];
  if (![(VCMediaNegotiatorV2 *)self setupNegotiatedResultsWithRemoteMediaBlob:v6])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiatorV2 processRemoteNegotiationData:].cold.5();
      }
    }
    goto LABEL_24;
  }
  [(VCMediaNegotiatorV2 *)self setupNegotiatedFaceTimeSettingsWithRemoteMediaBlob:v6];
  if (![(VCMediaNegotiatorV2 *)self setupNegotiatedMomentsResultsWithRemoteMediaBlob:v6])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiatorV2 processRemoteNegotiationData:].cold.4();
      }
    }
    goto LABEL_24;
  }
  if (![(VCMediaNegotiatorV2 *)self setupStreamGroupsWithRemoteMediaBlob:v6])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiatorV2 processRemoteNegotiationData:]();
      }
    }
LABEL_24:
    BOOL v7 = 0;
    goto LABEL_7;
  }
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

+ (BOOL)initializeLocalConfiguration:(id)a3 negotiationData:(id)a4 deviceRole:(int)a5 preferredAudioPayload:(int)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [[VCMediaNegotiationBlobV2 alloc] initWithData:a4];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorV2 initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]();
      }
    }
    BOOL v27 = 0;
    goto LABEL_36;
  }
  [a3 resetStreamGroups];
  [a3 setOneToOneAuthTagEnabled:1];
  v8 = (void *)[a3 mediaConfigurationForMediaType:1];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v31 = v7;
  obuint64_t j = [(VCMediaNegotiationBlobV2 *)v7 streamGroups];
  uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v38 count:16];
  if (!v9) {
    goto LABEL_18;
  }
  uint64_t v10 = v9;
  char v30 = 0;
  uint64_t v11 = *(void *)v40;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v40 != v11) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      id v32 = 0;
      if (([v13 getStreamGroupConfig:&v32] & 0x80000000) != 0 || !v32)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            +[VCMediaNegotiatorV2 initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]();
          }
        }
        goto LABEL_34;
      }
      objc_msgSend(a3, "addStreamGroupConfig:");
      __int16 v14 = (void *)[a3 mediaConfigurationForMediaType:2];
      +[VCMediaNegotiatorV2 updateStreamGroupU1Config:forGroupId:withNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:](VCMediaNegotiatorV2, "updateStreamGroupU1Config:forGroupId:withNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:", v32, [v32 groupID], v31, v13, objc_msgSend((id)objc_msgSend(v14, "videoRuleCollections"), "supportedPayloads"), objc_msgSend(a3, "isOneToOneAuthTagEnabled"));
      if ([v32 groupID] == 1937339233 && objc_msgSend(v32, "u1Config"))
      {
        int v15 = [VCMediaNegotiatorAudioConfiguration alloc];
        uint64_t v16 = [v8 allowAudioSwitching];
        uint64_t v17 = [v8 allowAudioRecording];
        uint64_t v18 = [v8 useSBR];
        int v19 = -[VCMediaNegotiatorAudioConfiguration initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:](v15, "initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:", v16, v17, v18, objc_msgSend((id)objc_msgSend(v32, "u1Config"), "ssrc"), objc_msgSend(v8, "audioUnitNumber"));
        if (v19)
        {
          uint64_t v20 = v19;
          [(VCMediaNegotiatorAudioConfiguration *)v19 addAudioPayload:101 isSecondary:0];
          [a3 setMediaConfiguration:v20 forMediaType:4];

          continue;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            +[VCMediaNegotiatorV2 initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]();
          }
        }
LABEL_34:
        BOOL v27 = 0;
        goto LABEL_35;
      }
      if ([v32 groupID] == 1935897189) {
        v30 |= [v32 u1Config] != 0;
      }
    }
    uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v38 count:16];
    if (v10) {
      continue;
    }
    break;
  }
  if ((v30 & 1) == 0)
  {
LABEL_18:
    [a3 setMediaConfiguration:0 forMediaType:4];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    double v21 = (void *)[a3 streamGroupConfigs];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v33 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v35 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          if ([v26 groupID] == 1937339233) {
            [v26 setU1Config:0];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v33 count:16];
      }
      while (v23);
    }
  }
  BOOL v27 = 1;
  [a3 setOneToOneModeSupported:1];
LABEL_35:
  BOOL v7 = v31;
LABEL_36:

  return v27;
}

- (unsigned)remoteMaxBandwidthForArbiterMode:(unsigned __int8)a3 connectionType:(int)a4
{
  int v5 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = [(VCMediaNegotiatorResults *)self->super._negotiatedSettings bandwidthConfigurations];
  uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v27 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unsigned int v9 = 0;
    uint64_t v10 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v6);
        }
        __int16 v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v12 connectionType] == a4)
        {
          if ([v12 mode] == v5)
          {
            unsigned int v9 = [v12 maxBandwidth];
            if (v9) {
              return v9;
            }
            goto LABEL_15;
          }
          if ([v12 isDefaultMode]) {
            unsigned int v9 = [v12 maxBandwidth];
          }
        }
      }
      uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v27 objects:v26 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    if (v9) {
      return v9;
    }
  }
LABEL_15:
  if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
    return 0;
  }
  uint64_t v13 = VRTraceErrorLogLevelToCSTR();
  __int16 v14 = *MEMORY[0x1E4F47A50];
  unsigned int v9 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136316162;
    uint64_t v17 = v13;
    __int16 v18 = 2080;
    int v19 = "-[VCMediaNegotiatorV2 remoteMaxBandwidthForArbiterMode:connectionType:]";
    __int16 v20 = 1024;
    int v21 = 232;
    __int16 v22 = 1024;
    int v23 = v5;
    __int16 v24 = 1024;
    int v25 = a4;
    _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Max bandwidth not found for operatingMode=%hhu connectionType=%d", (uint8_t *)&v16, 0x28u);
    return 0;
  }
  return v9;
}

- (BOOL)appendGeneralInfoToMediaBlob:(id)a3
{
  id v4 = -[VCMediaNegotiationBlobV2GeneralInfo initWithCreationTime:screenResolution:abSwitches:]([VCMediaNegotiationBlobV2GeneralInfo alloc], "initWithCreationTime:screenResolution:abSwitches:", [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings creationTime], [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings faceTimeSwitches], (double)+[VCHardwareSettings screenWidth](VCHardwareSettings, "screenWidth"), (double)+[VCHardwareSettings screenHeight](VCHardwareSettings, "screenHeight"));
  if (v4)
  {
    [a3 setGeneralInfo:v4];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaNegotiatorV2 appendGeneralInfoToMediaBlob:]();
    }
  }
  return v4 != 0;
}

- (BOOL)appendBandwidthSettingsToMediaBlob:(id)a3
{
  id v4 = [[VCMediaNegotiationBlobV2BandwidthSettings alloc] initWithBandwidthConfigurations:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings bandwidthConfigurations]];
  int v5 = v4;
  if (v4)
  {
    if (![(VCMediaNegotiationBlobV2BandwidthSettings *)v4 isDefaultSettings]) {
      [a3 setBandwidthSettings:v5];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaNegotiatorV2 appendBandwidthSettingsToMediaBlob:]();
    }
  }

  return v5 != 0;
}

- (BOOL)appendCodecFeaturesToMediaBlob:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    unsigned int v5 = +[VCModeSpecificHardwareSettings encoderUsageTypeWithHardwareSettingsMode:1];
    int v6 = VCPCodecCopyProperties();
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v6)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiatorV2 appendCodecFeaturesToMediaBlob:]();
        }
      }
    }
    else if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      unsigned int v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        int v15 = "-[VCMediaNegotiatorV2 appendCodecFeaturesToMediaBlob:]";
        __int16 v16 = 1024;
        int v17 = 278;
        __int16 v18 = 2112;
        uint64_t v19 = 0;
        __int16 v20 = 1024;
        unsigned int v21 = v5;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [FLS] kVCPCodecProperty_FeatureBitField=%@ for encoderUsage=%d", buf, 0x2Cu);
      }
    }
  }
  uint64_t v10 = -[VCMediaNegotiationBlobV2CodecFeatures initWithAllowAudioRecording:videoFeatures:]([VCMediaNegotiationBlobV2CodecFeatures alloc], "initWithAllowAudioRecording:videoFeatures:", objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 1), "allowAudioRecording"), 0);
  if (v10)
  {
    [a3 setCodecSupport:v10];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaNegotiatorV2 appendCodecFeaturesToMediaBlob:]();
    }
  }

  return v10 != 0;
}

- (BOOL)appendMicrophoneOneToOneSettingsToMediaBlob:(id)a3
{
  if (![(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings oneToOneModeSupported])
  {
    uint64_t v7 = 0;
    goto LABEL_4;
  }
  id v5 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaConfigurationForMediaType:1];
  int v6 = -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 initWithSSRC:audioPayloads:u1AuthTagEnabled:]([VCMediaNegotiationBlobV2MicrophoneSettingsU1 alloc], "initWithSSRC:audioPayloads:u1AuthTagEnabled:", [v5 ssrc], objc_msgSend(v5, "audioPayloads"), -[VCMediaNegotiatorLocalConfiguration isOneToOneAuthTagEnabled](self->super._localSettings, "isOneToOneAuthTagEnabled"));
  if (v6)
  {
    uint64_t v7 = v6;
    [a3 setMicrophoneU1:v6];
LABEL_4:
    BOOL v8 = 1;
    goto LABEL_5;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaNegotiatorV2 appendMicrophoneOneToOneSettingsToMediaBlob:]();
    }
  }
  uint64_t v7 = 0;
  BOOL v8 = 0;
LABEL_5:

  return v8;
}

- (BOOL)appendCameraOneToOneSettingsToMediaBlob:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (![(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings oneToOneModeSupported])
  {
    long long v27 = 0;
    goto LABEL_8;
  }
  id v5 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaConfigurationForMediaType:2];
  int v6 = objc_msgSend((id)objc_msgSend(v5, "videoRuleCollections"), "videoRulesCollectionsByRemovingPayload:andPayload:removeCellular:", 126, 128, 1);
  if (objc_msgSend((id)objc_msgSend(v6, "supportedPayloads"), "count"))
  {
    uint64_t v7 = [v5 videoFeatureStringsFixedPosition];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      unsigned int v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 136315906;
        uint64_t v33 = v8;
        __int16 v34 = 2080;
        long long v35 = "-[VCMediaNegotiatorV2 appendCameraOneToOneSettingsToMediaBlob:]";
        __int16 v36 = 1024;
        int v37 = 328;
        __int16 v38 = 2112;
        uint64_t v39 = v7;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoFeatureStringsFixedPosition=%@", (uint8_t *)&v32, 0x26u);
      }
    }
    uint64_t v10 = [VCMediaNegotiationBlobV2CameraSettingsU1 alloc];
    uint64_t v11 = [v5 ssrc];
    [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings screenSize];
    double v13 = v12;
    double v15 = v14;
    [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings aspectRatioPortrait];
    double v17 = v16;
    double v19 = v18;
    [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings aspectRatioLandscape];
    double v21 = v20;
    double v23 = v22;
    [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings orientationMismatchAspectRatioLandscape];
    uint64_t v26 = -[VCMediaNegotiationBlobV2CameraSettingsU1 initWithSSRC:videoRuleCollections:screenSize:aspectRatioPortrait:aspectRatioLandscape:orientationMismatchAspectRatioLandscape:featureListStrings:u1AuthTagEnabled:](v10, "initWithSSRC:videoRuleCollections:screenSize:aspectRatioPortrait:aspectRatioLandscape:orientationMismatchAspectRatioLandscape:featureListStrings:u1AuthTagEnabled:", v11, v6, v7, [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings isOneToOneAuthTagEnabled], v13, v15, v17, v19, v21, v23, v24, v25);
    if (!v26)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiatorV2 appendCameraOneToOneSettingsToMediaBlob:]();
        }
      }
      long long v27 = 0;
      BOOL v28 = 0;
      goto LABEL_9;
    }
    long long v27 = (void *)v26;
    [a3 setCameraU1:v26];
LABEL_8:
    BOOL v28 = 1;
LABEL_9:

    return v28;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v29 = VRTraceErrorLogLevelToCSTR();
    long long v30 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 136315650;
      uint64_t v33 = v29;
      __int16 v34 = 2080;
      long long v35 = "-[VCMediaNegotiatorV2 appendCameraOneToOneSettingsToMediaBlob:]";
      __int16 v36 = 1024;
      int v37 = 324;
      _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No supported payloads for the device", (uint8_t *)&v32, 0x1Cu);
    }
  }
  return 1;
}

- (BOOL)appendMomentsSettingsToMediaBlob:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![+[VCDefaults sharedInstance] momentsUserPreferenceEnabled])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315650;
        uint64_t v12 = v9;
        __int16 v13 = 2080;
        double v14 = "-[VCMediaNegotiatorV2 appendMomentsSettingsToMediaBlob:]";
        __int16 v15 = 1024;
        int v16 = 350;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Moments user preference not enabled.", (uint8_t *)&v11, 0x1Cu);
      }
    }
    goto LABEL_11;
  }
  if (![(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaRecorderVideoCodecs]&& ![(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaRecorderImageTypes])
  {
LABEL_11:
    int v6 = 0;
    goto LABEL_6;
  }
  id v5 = [[VCMediaNegotiationBlobV2MomentsSettings alloc] initWithVideoCodecs:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaRecorderVideoCodecs] imageTypes:[(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaRecorderImageTypes] capabilitiesOneToOne:[+[VCVideoRuleCollectionsMediaRecorder sharedInstance](VCVideoRuleCollectionsMediaRecorder, "sharedInstance") mediaRecorderCapabilities] capabilitiesMultiway:[+[VCVideoRuleCollectionsMediaRecorder sharedInstance] mediaRecorderCapabilities]];
  if (v5)
  {
    int v6 = v5;
    [a3 setMomentsSettings:v5];
LABEL_6:
    BOOL v7 = 1;
    goto LABEL_7;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaNegotiatorV2 appendMomentsSettingsToMediaBlob:]();
    }
  }
  int v6 = 0;
  BOOL v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)appendStreamGroupsToMediaBlob:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings streamGroupConfigs];
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = [[VCMediaNegotiationBlobV2StreamGroup alloc] initWithStreamGroupConfig:*(void *)(*((void *)&v14 + 1) + 8 * v8)];
      if (!v9) {
        break;
      }
      uint64_t v10 = v9;
      [a3 addStreamGroups:v9];

      if (v6 == ++v8)
      {
        uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v14 objects:v13 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v11) {
        return v11;
      }
      -[VCMediaNegotiatorV2 appendStreamGroupsToMediaBlob:]();
    }
    LOBYTE(v11) = 0;
  }
  else
  {
LABEL_9:
    LOBYTE(v11) = 1;
  }
  return v11;
}

+ (void)dumpRemoteNegotiationData:(id)a3 forceFileDump:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([+[VCDefaults sharedInstance] dumpMediaBlob]|| v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v6;
        __int16 v10 = 2080;
        BOOL v11 = "+[VCMediaNegotiatorV2 dumpRemoteNegotiationData:forceFileDump:]";
        __int16 v12 = 1024;
        int v13 = 383;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media blob dump enabled !!", buf, 0x1Cu);
      }
    }
    memset(buf, 170, sizeof(buf));
    __sprintf_chk((char *)buf, 0, 0xCuLL, "%010u", 0);
    uint64_t v8 = VRLogfileAlloc(0, (uint64_t)buf, (uint64_t)"mediablob_invite_remote", (uint64_t)".blob", "com.apple.VideoConference.MediaBlob", 9);
    VRLogfileWrite(v8, [a3 bytes], objc_msgSend(a3, "length"));
    VRLogfileFree((uint64_t *)&v8);
  }
}

- (BOOL)setupNegotiatedResultsWithRemoteMediaBlob:(id)a3
{
  if ([a3 bandwidthSettings]) {
    uint64_t v5 = (VCMediaNegotiationBlobV2BandwidthSettings *)(id)[a3 bandwidthSettings];
  }
  else {
    uint64_t v5 = objc_alloc_init(VCMediaNegotiationBlobV2BandwidthSettings);
  }
  uint64_t v6 = v5;
  if (v5)
  {
    [(VCMediaNegotiatorResults *)self->super._negotiatedSettings addBandwidthConfigurations:[(VCMediaNegotiationBlobV2BandwidthSettings *)v5 bandwidthConfigurations]];

    [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setMediaControlInfoVersion:2];
    [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setRemoteBlobVersion:2];
    [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setControlChannelVersion:2];
    [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setSupportsDynamicMaxBitrate:1];
    -[VCMediaNegotiatorResults setRemoteBlobCreationTime:](self->super._negotiatedSettings, "setRemoteBlobCreationTime:", objc_msgSend((id)objc_msgSend(a3, "generalInfo"), "creationTime"));
    [(VCMediaNegotiatorResults *)self->super._negotiatedSettings setAccessNetworkType:2];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaNegotiatorV2 setupNegotiatedResultsWithRemoteMediaBlob:]();
    }
  }
  return v6 != 0;
}

- (void)setupNegotiatedAudioResultsWithRemoteMediaBlob:(id)a3
{
  uint64_t v5 = +[VCAudioRuleCollection getForcedPayload];
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC2A18];
  id v7 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings mediaConfigurationForMediaType:1];
  objc_msgSend(v6, "setRemoteSSRC:", objc_msgSend((id)objc_msgSend(a3, "microphoneU1"), "rtpSSRC"));
  [v6 setAudioUnitModel:65792];
  [v6 setUseSBR:1];
  if ([v7 allowAudioRecording]) {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "codecSupport"), "allowAudioRecording");
  }
  else {
    uint64_t v8 = 0;
  }
  [v6 setAllowRecording:v8];
  [v6 setAllowSwitching:v5 == 128];
  if (v5 == 128)
  {
    id v9 = +[VCMediaNegotiatorBase newNegotiatedAudioPayloadsWithLocalPayloads:remotePayloads:](VCMediaNegotiatorBase, "newNegotiatedAudioPayloadsWithLocalPayloads:remotePayloads:", [v7 audioPayloads], objc_msgSend((id)objc_msgSend(a3, "microphoneU1"), "audioPayloads"));
    +[VCMediaNegotiatorBase setupNegotiatedAudioPayloads:v9 negotiatedAudioSettings:v6 primaryPayloadPreference:&unk_1F3DC7008];
  }
  else
  {
    [v6 setPrimaryPayload:v5];
  }
}

- (void)setUpNegotiatedSystemAudioResultsWithRemoteMediaBlob:(id)a3
{
  uint64_t v5 = objc_msgSend(-[VCMediaNegotiatorBase negotiatedStreamGroupConfigForGroupID:negotiatedStreamGroupConfigs:](self, "negotiatedStreamGroupConfigForGroupID:negotiatedStreamGroupConfigs:", 1937339233, -[NSSet allObjects](-[VCMediaNegotiatorLocalConfiguration streamGroupConfigs](-[VCMediaNegotiatorBase localSettings](self, "localSettings"), "streamGroupConfigs"), "allObjects")), "u1Config");
  id v7 = objc_alloc_init(VCMediaNegotiatorStreamGroupU1Configuration);
  -[VCMediaNegotiatorStreamGroupU1Configuration setSupportedCipherSuites:](v7, "setSupportedCipherSuites:", +[VCMediaNegotiationBlobV2SettingsU1 mediaStreamCipherSuitesFromNegotiationCipherSuites:](VCMediaNegotiationBlobV2SettingsU1, "mediaStreamCipherSuitesFromNegotiationCipherSuites:", +[VCMediaNegotiatorV2 filteredCipherSuitesFromNegotiatedCipherSuites:u1AuthTagEnabled:](VCMediaNegotiatorV2, "filteredCipherSuitesFromNegotiatedCipherSuites:u1AuthTagEnabled:", objc_msgSend((id)objc_msgSend(a3, "microphoneU1"), "cipherSuites"), -[VCMediaNegotiatorLocalConfiguration isOneToOneAuthTagEnabled](self->super._localSettings, "isOneToOneAuthTagEnabled"))));
  [(VCMediaNegotiatorStreamGroupU1Configuration *)v7 setSupportedDirection:2];
  id v6 = [(VCMediaNegotiatorBase *)self negotiatedResultsForGroupID:1937339233 localU1Config:v5 remoteU1Config:v7];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._negotiatedU1MediaSettings, "setObject:forKeyedSubscript:", v6, [NSNumber numberWithUnsignedChar:VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID(1937339233)]);
}

- (BOOL)selectBestDecodeVideoRuleForTransport:(unsigned __int8)a3 payload:(int)a4 localVideoRuleCollection:(id)a5 remoteVideoRuleCollection:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = [a5 getVideoRulesForTransport:a3 payload:*(void *)&a4 encodingType:2];
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      double v21 = *MEMORY[0x1E4F47A50];
      BOOL v22 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v13) = 0;
      if (!v22) {
        return v13;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v33 = v20;
      __int16 v34 = 2080;
      long long v35 = "-[VCMediaNegotiatorV2 selectBestDecodeVideoRuleForTransport:payload:localVideoRuleCollection:remoteVideoRuleCollection:]";
      __int16 v36 = 1024;
      int v37 = 460;
      __int16 v38 = 1024;
      int v39 = v7;
      __int16 v40 = 1024;
      int v41 = v8;
      __int16 v42 = 1024;
      int v43 = 2;
      double v23 = " [%s] %s:%d No local video rules for payload=%d transport=%d encoding=%d";
      goto LABEL_21;
    }
LABEL_22:
    LOBYTE(v13) = 0;
    return v13;
  }
  BOOL v11 = (void *)v10;
  __int16 v12 = (void *)[a6 getVideoRulesForTransport:1 payload:v7 encodingType:2];
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      double v21 = *MEMORY[0x1E4F47A50];
      BOOL v25 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v13) = 0;
      if (!v25) {
        return v13;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v33 = v24;
      __int16 v34 = 2080;
      long long v35 = "-[VCMediaNegotiatorV2 selectBestDecodeVideoRuleForTransport:payload:localVideoRuleCollection:remoteVideoRuleCollection:]";
      __int16 v36 = 1024;
      int v37 = 464;
      __int16 v38 = 1024;
      int v39 = v7;
      __int16 v40 = 1024;
      int v41 = v8;
      __int16 v42 = 1024;
      int v43 = 2;
      double v23 = " [%s] %s:%d No remote video rules for payload=%d transport=%d encoding=%d";
LABEL_21:
      _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0x2Eu);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  uint64_t v13 = [v12 count];
  if (v13)
  {
    uint64_t v14 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC2A90];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v27 count:16];
    if (v13)
    {
      uint64_t v15 = v13;
      uint64_t v16 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v11);
          }
          uint64_t v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          [v18 fPref];
          if (v19 == 1.0)
          {
            objc_msgSend(v14, "addVideoRules:transportType:payload:encodingType:", objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", v18), v8, v7, 2);
            LOBYTE(v13) = 1;
            return v13;
          }
        }
        uint64_t v15 = [v11 countByEnumeratingWithState:&v28 objects:v27 count:16];
        LOBYTE(v13) = 0;
        if (v15) {
          continue;
        }
        break;
      }
    }
  }
  return v13;
}

+ (id)featureStringWithMediaBlob:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([a3 hasCameraU1])
  {
    double v13 = NAN;
    double v14 = NAN;
    double v11 = NAN;
    double v12 = NAN;
    double v9 = NAN;
    double v10 = NAN;
    double v7 = NAN;
    double v8 = NAN;
    BOOL v4 = (void *)[a3 cameraU1];
    objc_msgSend((id)objc_msgSend(a3, "generalInfo"), "screenResolution");
    objc_msgSend(v4, "aspectRatioPortrait:aspectRatioLandscape:orientationMismatchAspectRatioLandscape:orientationMismatchAspectRatioPortrait:screenSize:", &v13, &v11, &v9, &v7);
    return +[VCVideoFeatureListStringHelper deriveAspectRatioFLSWithPortraitRatio:landscapeRatio:expectedPortraitRatio:expectedLandscapeRatio:](VCVideoFeatureListStringHelper, "deriveAspectRatioFLSWithPortraitRatio:landscapeRatio:expectedPortraitRatio:expectedLandscapeRatio:", v13, v14, v11, v12, v7, v8, v9, v10);
  }
  else
  {
    id v6 = +[VCVideoFeatureListStringHelper newEmptyFeatureString];
    return v6;
  }
}

- (BOOL)setupNegotiatedVideoSettingsWithRemoteMediaBlob:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->super._negotiatedU1MediaSettings objectForKeyedSubscript:&unk_1F3DC2A90];
  [v5 setIsSupported:0];
  id v6 = objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 2), "videoRuleCollections");
  if (!objc_msgSend((id)objc_msgSend(v6, "rules"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 1;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    double v23 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 1;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v39 = v22;
    __int16 v40 = 2080;
    int v41 = "-[VCMediaNegotiatorV2 setupNegotiatedVideoSettingsWithRemoteMediaBlob:]";
    __int16 v42 = 1024;
    int v43 = 513;
    uint64_t v24 = " [%s] %s:%d Skipping negotiating video settings, as this device does not support video";
    goto LABEL_39;
  }
  if (([a3 hasCameraU1] & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 1;
    }
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    double v23 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 1;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v39 = v25;
    __int16 v40 = 2080;
    int v41 = "-[VCMediaNegotiatorV2 setupNegotiatedVideoSettingsWithRemoteMediaBlob:]";
    __int16 v42 = 1024;
    int v43 = 514;
    uint64_t v24 = " [%s] %s:%d Skipping negotiating video settings, as the remote device does not support video";
    goto LABEL_39;
  }
  double v7 = objc_msgSend((id)objc_msgSend(a3, "cameraU1"), "videoRuleCollections");
  if (!objc_msgSend((id)objc_msgSend(v7, "rules"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 1;
    }
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    double v23 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 1;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v39 = v26;
    __int16 v40 = 2080;
    int v41 = "-[VCMediaNegotiatorV2 setupNegotiatedVideoSettingsWithRemoteMediaBlob:]";
    __int16 v42 = 1024;
    int v43 = 516;
    uint64_t v24 = " [%s] %s:%d Skipping negotiating video settings, as the remote device does not support video";
LABEL_39:
    _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0x1Cu);
    return 1;
  }
  id v8 = +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:aspectRatioFLS:version:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringWithType:aspectRatioFLS:version:", 1, +[VCMediaNegotiatorV2 featureStringWithMediaBlob:a3], 1);
  [v5 setFeatureStrings:v8];

  if (![v5 featureStrings])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiatorV2 setupNegotiatedVideoSettingsWithRemoteMediaBlob:]();
      }
    }
    return 0;
  }
  obuint64_t j = +[VCMediaNegotiatorBase getPreferredVideoPayloadList:localSupportedPayloads:mediaType:](VCMediaNegotiatorV2, "getPreferredVideoPayloadList:localSupportedPayloads:mediaType:", [v7 supportedPayloads], objc_msgSend(v6, "supportedPayloads"), 2);
  if (![obj count])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiatorV2 setupNegotiatedVideoSettingsWithRemoteMediaBlob:]();
      }
    }
    return 0;
  }
  objc_msgSend(v5, "setRemoteSSRC:", objc_msgSend((id)objc_msgSend(a3, "cameraU1"), "rtpSSRC"));
  [v5 setIsRTCPFBEnabled:0];
  [v5 setTilesPerFrame:1];
  [v5 setLtrpEnabled:1];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  double v9 = objc_msgSend((id)objc_msgSend(a3, "cameraU1"), "payloads");
  uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v5, "addParameterSet:payload:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "videoParameterSupport")), objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "payload"));
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v33 count:16];
    }
    while (v11);
  }
  unsigned __int8 v14 = 1;
  while (2)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v15 = [obj countByEnumeratingWithState:&v29 objects:v28 count:16];
    if (!v15)
    {
LABEL_25:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiatorV2 setupNegotiatedVideoSettingsWithRemoteMediaBlob:]();
        }
      }
      return 0;
    }
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
LABEL_16:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v30 != v17) {
        objc_enumerationMutation(obj);
      }
      unsigned int v19 = v14;
      if (+[VCMediaNegotiatorBase selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCollection:remoteVideoRuleCollection:](VCMediaNegotiatorV2, "selectBestVideoRuleForTransport:payload:encodingType:videoSettings:localVideoRuleCollection:remoteVideoRuleCollection:", 1, [*(id *)(*((void *)&v29 + 1) + 8 * v18) unsignedIntValue], v14, v5, v6, v7))
      {
        break;
      }
      if (v16 == ++v18)
      {
        uint64_t v16 = [obj countByEnumeratingWithState:&v29 objects:v28 count:16];
        if (v16) {
          goto LABEL_16;
        }
        goto LABEL_25;
      }
    }
    ++v14;
    if (v19 < 2) {
      continue;
    }
    break;
  }
  BOOL v20 = 1;
  [v5 setIsSupported:1];
  return v20;
}

+ (unsigned)capabilitiesWithMomentSettings:(id)a3
{
  char v4 = [a3 capabilitiesMultiway];
  uint64_t v5 = (void *)[a3 videoCodecs];
  if ((v4 & 2) != 0) {
    unsigned int v6 = 2 * ([v5 count] != 0);
  }
  else {
    unsigned int v6 = 0;
  }
  if ((v4 & 3) != 0)
  {
    double v7 = (void *)[a3 imageTypes];
    v6 |= [v7 count] != 0;
    if ([v7 containsObject:&unk_1F3DC2AA8]) {
      v6 |= 4u;
    }
  }
  return v6;
}

- (BOOL)setupNegotiatedMomentsResultsWithRemoteMediaBlob:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (([a3 hasMomentsSettings] & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 1;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 1;
    }
    int v21 = 136315650;
    uint64_t v22 = v11;
    __int16 v23 = 2080;
    uint64_t v24 = "-[VCMediaNegotiatorV2 setupNegotiatedMomentsResultsWithRemoteMediaBlob:]";
    __int16 v25 = 1024;
    int v26 = 575;
    double v13 = " [%s] %s:%d Moments not supported";
LABEL_22:
    _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v21, 0x1Cu);
    return 1;
  }
  if (![+[VCDefaults sharedInstance] momentsUserPreferenceEnabled])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      return 1;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 1;
    }
    int v21 = 136315650;
    uint64_t v22 = v14;
    __int16 v23 = 2080;
    uint64_t v24 = "-[VCMediaNegotiatorV2 setupNegotiatedMomentsResultsWithRemoteMediaBlob:]";
    __int16 v25 = 1024;
    int v26 = 576;
    double v13 = " [%s] %s:%d Moments user preference Not Enabled.";
    goto LABEL_22;
  }
  uint64_t v5 = (void *)[a3 momentsSettings];
  unsigned int v6 = (void *)[v5 videoCodecs];
  if ([v6 containsObject:&unk_1F3DC2AC0]
    && +[VCHardwareSettings supportsHEVCEncoding])
  {
    uint64_t v7 = 100;
LABEL_8:
    [(VCMediaNegotiatorResultsMediaRecorder *)self->super._negotiatedMediaRecorderSettings setVideoCodec:v7];
    id v8 = (void *)[v5 imageTypes];
    if ([v8 containsObject:&unk_1F3DC2AA8]
      && +[VCHardwareSettings supportsHEIFEncoding])
    {
      uint64_t v9 = 1;
LABEL_13:
      [(VCMediaNegotiatorResultsMediaRecorder *)self->super._negotiatedMediaRecorderSettings setImageType:v9];
      [(VCMediaNegotiatorResultsMediaRecorder *)self->super._negotiatedMediaRecorderSettings setCapabilities:+[VCMediaNegotiatorV2 capabilitiesWithMomentSettings:v5]];
      return 1;
    }
    if ([v8 containsObject:&unk_1F3DC2AF0])
    {
      uint64_t v9 = 0;
      goto LABEL_13;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      BOOL v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (v20)
      {
        int v21 = 136315906;
        uint64_t v22 = v19;
        __int16 v23 = 2080;
        uint64_t v24 = "-[VCMediaNegotiatorV2 setupNegotiatedMomentsResultsWithRemoteMediaBlob:]";
        __int16 v25 = 1024;
        int v26 = 593;
        __int16 v27 = 2112;
        long long v28 = v8;
        uint64_t v18 = " [%s] %s:%d No supported moments image types. imageTypes=%@";
        goto LABEL_29;
      }
      return result;
    }
    return 0;
  }
  if ([v6 containsObject:&unk_1F3DC2AD8])
  {
    uint64_t v7 = 123;
    goto LABEL_8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
    return 0;
  }
  uint64_t v15 = VRTraceErrorLogLevelToCSTR();
  uint64_t v16 = *MEMORY[0x1E4F47A50];
  BOOL v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v17)
  {
    int v21 = 136315906;
    uint64_t v22 = v15;
    __int16 v23 = 2080;
    uint64_t v24 = "-[VCMediaNegotiatorV2 setupNegotiatedMomentsResultsWithRemoteMediaBlob:]";
    __int16 v25 = 1024;
    int v26 = 584;
    __int16 v27 = 2112;
    long long v28 = v6;
    uint64_t v18 = " [%s] %s:%d No supported moments payload. videoCodecs=%@";
LABEL_29:
    _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v21, 0x26u);
    return 0;
  }
  return result;
}

- (BOOL)mediaBlobHasFLSPerCodec:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  LODWORD(v4) = [a3 hasCameraU1];
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "cameraU1"), "payloads");
    uint64_t v4 = [v5 countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v11 + 1) + 8 * i) hasEncodeDecodeFeatures])
          {
            LOBYTE(v4) = 1;
            return v4;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v10 count:16];
        LOBYTE(v4) = 0;
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  return v4;
}

- (BOOL)negotiateStreamGroupConfig:(id)a3 remoteInviteBlob:(id)a4
{
  uint64_t v5 = self;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  if ([a3 mediaType] != 1835365473
    && [a3 mediaType] != 1986618469
    && [a3 mediaType] != 1936684398)
  {
    if ((VCMediaNegotiatorV2 *)objc_opt_class() != v5)
    {
      if (objc_opt_respondsToSelector()) {
        v62 = (__CFString *)[(VCMediaNegotiatorV2 *)v5 performSelector:sel_logPrefix];
      }
      else {
        v62 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_79;
      }
      uint64_t v65 = VRTraceErrorLogLevelToCSTR();
      v56 = *MEMORY[0x1E4F47A50];
      BOOL v66 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v45) = 0;
      if (!v66) {
        return v45;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v91 = v65;
      __int16 v92 = 2080;
      v93 = "-[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]";
      __int16 v94 = 1024;
      int v95 = 621;
      __int16 v96 = 2112;
      v97 = (char *)v62;
      __int16 v98 = 2048;
      v99 = self;
      __int16 v100 = 2080;
      v101 = FourccToCStr([a3 mediaType]);
      __int16 v102 = 2080;
      v103 = FourccToCStr([a3 groupID]);
      v52 = " [%s] %s:%d %@(%p) Unsupported media type (%s). Ignoring streamGroup groupID=%s";
LABEL_77:
      v53 = v56;
      uint32_t v54 = 68;
      goto LABEL_78;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_79;
    }
    uint64_t v63 = VRTraceErrorLogLevelToCSTR();
    v48 = *MEMORY[0x1E4F47A50];
    BOOL v64 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    LOBYTE(v45) = 0;
    if (!v64) {
      return v45;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v91 = v63;
    __int16 v92 = 2080;
    v93 = "-[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]";
    __int16 v94 = 1024;
    int v95 = 621;
    __int16 v96 = 2080;
    v97 = FourccToCStr([a3 mediaType]);
    __int16 v98 = 2080;
    v99 = FourccToCStr([a3 groupID]);
    v52 = " [%s] %s:%d Unsupported media type (%s). Ignoring streamGroup groupID=%s";
LABEL_72:
    v53 = v48;
    uint32_t v54 = 48;
LABEL_78:
    _os_log_impl(&dword_1E1EA4000, v53, OS_LOG_TYPE_DEFAULT, v52, buf, v54);
    goto LABEL_79;
  }
  if (!objc_msgSend(+[VCHardwareSettings supportedVideoPayloads](VCHardwareSettings, "supportedVideoPayloads"), "count")&& objc_msgSend(a3, "mediaType") == 1986618469)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v60 = VRTraceErrorLogLevelToCSTR();
      v61 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v91 = v60;
        __int16 v92 = 2080;
        v93 = "-[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]";
        __int16 v94 = 1024;
        int v95 = 624;
        __int16 v96 = 2080;
        v97 = FourccToCStr([a3 groupID]);
        _os_log_impl(&dword_1E1EA4000, v61, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating streamGroup=%s, as this device is audio only", buf, 0x26u);
      }
    }
    LOBYTE(v45) = 1;
    return v45;
  }
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  obuint64_t j = (id)[a3 streamConfigs];
  uint64_t v6 = [obj countByEnumeratingWithState:&v86 objects:v85 count:16];
  if (!v6) {
    goto LABEL_59;
  }
  uint64_t v8 = v6;
  int v9 = 0;
  uint64_t v10 = &selRef_isInputAvailable;
  uint64_t v74 = *(void *)v87;
  *(void *)&long long v7 = 136315906;
  long long v68 = v7;
LABEL_8:
  uint64_t v11 = 0;
  int v12 = v9;
  v70 = v10[417];
  int v69 = v9 + v8;
  uint64_t v73 = v8;
  while (1)
  {
    if (*(void *)v87 != v74) {
      objc_enumerationMutation(obj);
    }
    long long v13 = *(void **)(*((void *)&v86 + 1) + 8 * v11);
    if (!objc_msgSend((id)objc_msgSend(v13, "codecs", v68), "count")
      && !objc_msgSend((id)objc_msgSend(v13, "payloads"), "count"))
    {
      if ((VCMediaNegotiatorV2 *)objc_opt_class() != v5)
      {
        if (objc_opt_respondsToSelector()) {
          v46 = (__CFString *)[(VCMediaNegotiatorV2 *)v5 performSelector:v70];
        }
        else {
          v46 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_79;
        }
        uint64_t v55 = VRTraceErrorLogLevelToCSTR();
        v56 = *MEMORY[0x1E4F47A50];
        BOOL v57 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
        LOBYTE(v45) = 0;
        if (!v57) {
          return v45;
        }
        v58 = FourccToCStr([a3 mediaType]);
        v59 = FourccToCStr([a3 mediaSubtype]);
        *(_DWORD *)buf = 136316674;
        uint64_t v91 = v55;
        __int16 v92 = 2080;
        v93 = "-[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]";
        __int16 v94 = 1024;
        int v95 = 627;
        __int16 v96 = 2112;
        v97 = (char *)v46;
        __int16 v98 = 2048;
        v99 = v5;
        __int16 v100 = 2080;
        v101 = v58;
        __int16 v102 = 2080;
        v103 = v59;
        v52 = " [%s] %s:%d %@(%p) Missing codecs or payloads for mediaType=%s mediaSubtype=%s";
        goto LABEL_77;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      {
LABEL_79:
        LOBYTE(v45) = 0;
        return v45;
      }
      uint64_t v47 = VRTraceErrorLogLevelToCSTR();
      v48 = *MEMORY[0x1E4F47A50];
      BOOL v49 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v45) = 0;
      if (!v49) {
        return v45;
      }
      v50 = FourccToCStr([a3 mediaType]);
      v51 = FourccToCStr([a3 mediaSubtype]);
      *(_DWORD *)buf = 136316162;
      uint64_t v91 = v47;
      __int16 v92 = 2080;
      v93 = "-[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]";
      __int16 v94 = 1024;
      int v95 = 627;
      __int16 v96 = 2080;
      v97 = v50;
      __int16 v98 = 2080;
      v99 = v51;
      v52 = " [%s] %s:%d Missing codecs or payloads for mediaType=%s mediaSubtype=%s";
      goto LABEL_72;
    }
    if (!+[VCHardwareSettings supportsHEVCDecoding])
    {
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v14 = (void *)[v13 codecs];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v81 objects:v80 count:16];
      if (!v15) {
        goto LABEL_34;
      }
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v82 != v17) {
            objc_enumerationMutation(v14);
          }
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "codecConfigs"), "objectAtIndex:", objc_msgSend(*(id *)(*((void *)&v81 + 1) + 8 * i), "integerValue")), "codecType") == 102)
          {
            uint64_t v5 = self;
            if ((VCMediaNegotiatorV2 *)objc_opt_class() == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
              {
                uint64_t v26 = VRTraceErrorLogLevelToCSTR();
                __int16 v27 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  long long v28 = FourccToCStr([a3 groupID]);
                  *(_DWORD *)buf = v68;
                  uint64_t v91 = v26;
                  __int16 v92 = 2080;
                  v93 = "-[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]";
                  __int16 v94 = 1024;
                  int v95 = 633;
                  __int16 v96 = 2080;
                  v97 = v28;
                  __int16 v23 = v27;
                  uint64_t v24 = " [%s] %s:%d HEVC codec not supported, removing all higher quality streams from streamGroup=%s";
                  uint32_t v25 = 38;
LABEL_32:
                  _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, v25);
                }
              }
            }
            else
            {
              uint64_t v19 = &stru_1F3D3E450;
              if (objc_opt_respondsToSelector()) {
                uint64_t v19 = (__CFString *)[(VCMediaNegotiatorV2 *)self performSelector:v70];
              }
              if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
              {
                uint64_t v20 = VRTraceErrorLogLevelToCSTR();
                int v21 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v22 = FourccToCStr([a3 groupID]);
                  *(_DWORD *)buf = 136316418;
                  uint64_t v91 = v20;
                  __int16 v92 = 2080;
                  v93 = "-[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]";
                  __int16 v94 = 1024;
                  int v95 = 633;
                  __int16 v96 = 2112;
                  v97 = (char *)v19;
                  __int16 v98 = 2048;
                  v99 = self;
                  __int16 v100 = 2080;
                  v101 = v22;
                  __int16 v23 = v21;
                  uint64_t v24 = " [%s] %s:%d %@(%p) HEVC codec not supported, removing all higher quality streams from streamGroup=%s";
                  uint32_t v25 = 58;
                  goto LABEL_32;
                }
              }
            }
            uint64_t v8 = v73;
            if (v12 == -1) {
              goto LABEL_34;
            }
LABEL_58:
            objc_msgSend(a3, "removeStreamConfigs:", v12, objc_msgSend((id)objc_msgSend(a3, "streamConfigs"), "count") - v12);
LABEL_59:
            if (objc_msgSend((id)objc_msgSend(a3, "streamConfigs"), "count")) {
              [(NSMutableArray *)v5->super._negotiatedStreamGroups addObject:a3];
            }
            LOBYTE(v45) = objc_msgSend((id)objc_msgSend(a3, "streamConfigs"), "count") != 0;
            return v45;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v81 objects:v80 count:16];
        uint64_t v5 = self;
        uint64_t v8 = v73;
      }
      while (v16);
LABEL_34:
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      uint64_t v29 = (void *)[v13 payloads];
      uint64_t v30 = [v29 countByEnumeratingWithState:&v76 objects:v75 count:16];
      if (v30) {
        break;
      }
    }
LABEL_55:
    ++v12;
    if (++v11 == v8)
    {
      uint64_t v8 = [obj countByEnumeratingWithState:&v86 objects:v85 count:16];
      int v9 = v69;
      uint64_t v10 = &selRef_isInputAvailable;
      if (!v8) {
        goto LABEL_59;
      }
      goto LABEL_8;
    }
  }
  uint64_t v31 = v30;
  uint64_t v32 = *(void *)v77;
LABEL_36:
  uint64_t v33 = 0;
  while (1)
  {
    if (*(void *)v77 != v32) {
      objc_enumerationMutation(v29);
    }
    int v34 = +[VCMediaNegotiationBlobV2VideoPayload rtpPayloadWithPayload:](VCMediaNegotiationBlobV2VideoPayload, "rtpPayloadWithPayload:", [*(id *)(*((void *)&v76 + 1) + 8 * v33) intValue]);
    if (v34 == 100)
    {
      uint64_t v5 = self;
      if ((VCMediaNegotiatorV2 *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v42 = VRTraceErrorLogLevelToCSTR();
          int v43 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v44 = FourccToCStr([a3 groupID]);
            *(_DWORD *)buf = v68;
            uint64_t v91 = v42;
            __int16 v92 = 2080;
            v93 = "-[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]";
            __int16 v94 = 1024;
            int v95 = 645;
            __int16 v96 = 2080;
            v97 = v44;
            uint64_t v39 = v43;
            __int16 v40 = " [%s] %s:%d HEVC payload not supported, removing all higher quality streams from streamGroup=%s";
            uint32_t v41 = 38;
            goto LABEL_53;
          }
        }
      }
      else
      {
        long long v35 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          long long v35 = (__CFString *)[(VCMediaNegotiatorV2 *)self performSelector:v70];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v36 = VRTraceErrorLogLevelToCSTR();
          long long v37 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            __int16 v38 = FourccToCStr([a3 groupID]);
            *(_DWORD *)buf = 136316418;
            uint64_t v91 = v36;
            __int16 v92 = 2080;
            v93 = "-[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]";
            __int16 v94 = 1024;
            int v95 = 645;
            __int16 v96 = 2112;
            v97 = (char *)v35;
            __int16 v98 = 2048;
            v99 = self;
            __int16 v100 = 2080;
            v101 = v38;
            uint64_t v39 = v37;
            __int16 v40 = " [%s] %s:%d %@(%p) HEVC payload not supported, removing all higher quality streams from streamGroup=%s";
            uint32_t v41 = 58;
LABEL_53:
            _os_log_impl(&dword_1E1EA4000, v39, OS_LOG_TYPE_DEFAULT, v40, buf, v41);
          }
        }
      }
      uint64_t v8 = v73;
      if (v12 != -1) {
        goto LABEL_58;
      }
      goto LABEL_55;
    }
    if (v34 == 128) {
      break;
    }
    if (v31 == ++v33)
    {
      uint64_t v31 = [v29 countByEnumeratingWithState:&v76 objects:v75 count:16];
      uint64_t v5 = self;
      if (v31) {
        goto LABEL_36;
      }
      goto LABEL_55;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_79;
  }
  VRTraceErrorLogLevelToCSTR();
  BOOL v45 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v45)
  {
    -[VCMediaNegotiatorV2 negotiateStreamGroupConfig:remoteInviteBlob:]();
    goto LABEL_79;
  }
  return v45;
}

- (BOOL)setupStreamGroupsWithRemoteMediaBlob:(id)a3
{
  id v3 = a3;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(a3, "streamGroups"), "count"))
  {
    uint64_t v41 = objc_msgSend((id)objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 2), "videoRuleCollections"), "supportedPayloads");
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v5 = (void *)[v3 streamGroups];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v53 objects:v52 count:16];
    if (v6)
    {
      uint64_t v42 = self;
      uint64_t v40 = 0;
      char v39 = 0;
      BOOL v8 = 0;
      uint64_t v9 = *(void *)v54;
      *(void *)&long long v7 = 136315906;
      long long v38 = v7;
      id v10 = v3;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v54 != v9) {
          objc_enumerationMutation(v5);
        }
        int v12 = *(void **)(*((void *)&v53 + 1) + 8 * v11);
        id v43 = 0;
        int v13 = objc_msgSend(v12, "getStreamGroupConfig:", &v43, v38);
        if (v43) {
          BOOL v14 = 0;
        }
        else {
          BOOL v14 = v13 == -2142961648;
        }
        if (v14)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v25 = VRTraceErrorLogLevelToCSTR();
            uint64_t v26 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              uint64_t v45 = v25;
              __int16 v46 = 2080;
              uint64_t v47 = "-[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:]";
              __int16 v48 = 1024;
              int v49 = 679;
              _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping unknown stream group", buf, 0x1Cu);
            }
            id v3 = v10;
          }
        }
        else
        {
          if (!v43)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:]();
              }
            }
LABEL_68:
            self = v42;
            if (v8) {
              return 1;
            }
            goto LABEL_69;
          }
          if (+[VCHardwareSettings deviceClass] == 8
            || [v43 groupID] != 1650745716
            && [v43 groupID] != 1717854580
            && [v43 groupID] != 1718909044)
          {
            BOOL v15 = [(VCMediaNegotiatorV2 *)v42 negotiateStreamGroupConfig:v43 remoteInviteBlob:v3];
            int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
            if (!v15)
            {
              if (ErrorLogLevelForModule >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:]();
                }
              }
              goto LABEL_68;
            }
            if (ErrorLogLevelForModule >= 7)
            {
              uint64_t v17 = VRTraceErrorLogLevelToCSTR();
              uint64_t v18 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v19 = FourccToCStr([v43 groupID]);
                *(_DWORD *)buf = v38;
                uint64_t v45 = v17;
                __int16 v46 = 2080;
                uint64_t v47 = "-[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:]";
                __int16 v48 = 1024;
                int v49 = 691;
                __int16 v50 = 2080;
                v51 = v19;
                _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setup U1 config for stream group for groupID=%s", buf, 0x26u);
              }
            }
            id v20 = v43;
            uint64_t v21 = [v43 groupID];
            uint64_t v22 = [(VCMediaNegotiatorLocalConfiguration *)v42->super._localSettings isOneToOneAuthTagEnabled];
            id v23 = v20;
            id v3 = v10;
            +[VCMediaNegotiatorV2 updateStreamGroupU1Config:v23 forGroupId:v21 withNegotiationBlob:v10 streamGroupBlob:v12 localSupportedVideoPayloads:v41 u1AuthTagEnabled:v22];
            BOOL v24 = [(VCMediaNegotiatorV2 *)v42 negotiateU1SettingsForStreamGroup:v43];
            if ([v43 groupID] == 1667329381 && v24)
            {
              BOOL v8 = 0;
              LOBYTE(v40) = 1;
            }
            else if ([v43 groupID] == 1835623282 && v24)
            {
              BOOL v8 = 0;
              char v39 = 1;
            }
            else
            {
              int v28 = [v43 groupID];
              BOOL v8 = v28 != 1937339233 && v24;
              if (v28 == 1937339233 && v24) {
                int v29 = 1;
              }
              else {
                int v29 = HIDWORD(v40);
              }
              HIDWORD(v40) = v29;
            }
          }
        }
        if (v6 == ++v11)
        {
          uint64_t v6 = [v5 countByEnumeratingWithState:&v53 objects:v52 count:16];
          if (v6) {
            goto LABEL_4;
          }
          char v30 = v40;
          if ((v40 & 0x100000000) == 0)
          {
            LOBYTE(v6) = v39;
            self = v42;
            goto LABEL_46;
          }
          self = v42;
          if ((v39 & 1) == 0) {
            goto LABEL_50;
          }
          goto LABEL_54;
        }
      }
    }
    char v30 = 0;
  }
  else
  {
    char v30 = 0;
    LOBYTE(v6) = 0;
  }
LABEL_46:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v31 = VRTraceErrorLogLevelToCSTR();
    uint64_t v32 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v45 = v31;
      __int16 v46 = 2080;
      uint64_t v47 = "-[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:]";
      __int16 v48 = 1024;
      int v49 = 716;
      _os_log_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote end does not support system audio settings, update system audio settings", buf, 0x1Cu);
    }
  }
  [(VCMediaNegotiatorV2 *)self setUpNegotiatedSystemAudioResultsWithRemoteMediaBlob:v3];
  if ((v6 & 1) == 0)
  {
LABEL_50:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v33 = VRTraceErrorLogLevelToCSTR();
      int v34 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v45 = v33;
        __int16 v46 = 2080;
        uint64_t v47 = "-[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:]";
        __int16 v48 = 1024;
        int v49 = 721;
        _os_log_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Negotiate for audio settings using microphoneU1", buf, 0x1Cu);
      }
    }
    [(VCMediaNegotiatorV2 *)self setupNegotiatedAudioResultsWithRemoteMediaBlob:v3];
  }
LABEL_54:
  if (v30) {
    return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v35 = VRTraceErrorLogLevelToCSTR();
    uint64_t v36 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v45 = v35;
      __int16 v46 = 2080;
      uint64_t v47 = "-[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:]";
      __int16 v48 = 1024;
      int v49 = 726;
      _os_log_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Negotiate for video settings using cameraU1", buf, 0x1Cu);
    }
  }
  if ([(VCMediaNegotiatorV2 *)self setupNegotiatedVideoSettingsWithRemoteMediaBlob:v3])
  {
    return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:]();
    }
  }
LABEL_69:
  [(NSMutableArray *)self->super._negotiatedStreamGroups removeAllObjects];
  return 0;
}

- (BOOL)negotiateU1SettingsForStreamGroup:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 groupID];
  int v6 = [(id)objc_opt_class() isU1StreamGroup:v5];
  if (v6)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v7 = [(VCMediaNegotiatorLocalConfiguration *)self->super._localSettings streamGroupConfigs];
    uint64_t v8 = [(NSSet *)v7 countByEnumeratingWithState:&v20 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
        if ([v12 groupID] == v5) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [(NSSet *)v7 countByEnumeratingWithState:&v20 objects:v19 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      int v12 = 0;
    }
    id v13 = -[VCMediaNegotiatorBase negotiatedResultsForGroupID:localU1Config:remoteU1Config:](self, "negotiatedResultsForGroupID:localU1Config:remoteU1Config:", v5, [v12 u1Config], objc_msgSend(a3, "u1Config"));
    id v14 = v13;
    BOOL v15 = v5 == 1667329381 || v5 == 1835623282;
    if (!v15 || v13)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._negotiatedU1MediaSettings, "setObject:forKeyedSubscript:", v13, [NSNumber numberWithUnsignedChar:VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID(v5)]);
      if (v14)
      {
        LOBYTE(v6) = 1;
        return v6;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_20;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint64_t v17 = *MEMORY[0x1E4F47A50];
    int v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (v6)
    {
      [(VCMediaNegotiatorV2 *)v16 negotiateU1SettingsForStreamGroup:v17];
LABEL_20:
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (void)setupNegotiatedFaceTimeSettingsWithRemoteMediaBlob:(id)a3
{
  -[VCMediaNegotiatorResultsFaceTimeSettings setOneToOneModeSupported:](self->super._negotiatedFaceTimeSettings, "setOneToOneModeSupported:", [a3 hasMicrophoneU1]);
  [(VCMediaNegotiatorResultsFaceTimeSettings *)self->super._negotiatedFaceTimeSettings setSecureMessagingRequired:0];
  [(VCMediaNegotiatorResultsFaceTimeSettings *)self->super._negotiatedFaceTimeSettings setSIPDisabled:0];
  -[VCMediaNegotiatorResultsFaceTimeSettings setFaceTimeSwitches:](self->super._negotiatedFaceTimeSettings, "setFaceTimeSwitches:", objc_msgSend((id)objc_msgSend(a3, "generalInfo"), "abSwitches"));
  [(VCMediaNegotiatorResultsFaceTimeSettings *)self->super._negotiatedFaceTimeSettings setRemoteFaceTimeSwitchesAvailable:[(VCMediaNegotiatorResultsFaceTimeSettings *)self->super._negotiatedFaceTimeSettings faceTimeSwitches] != 0];
  [(VCMediaNegotiatorResultsFaceTimeSettings *)self->super._negotiatedFaceTimeSettings setMediaControlInfoFECFeedbackVersion:0];
  negotiatedFaceTimeSettings = self->super._negotiatedFaceTimeSettings;

  [(VCMediaNegotiatorResultsFaceTimeSettings *)negotiatedFaceTimeSettings setRemoteLinkProbingCapabilityVersion:0];
}

+ (id)streamGroupIDsWithMediaBlob:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA80] set];
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorV2 streamGroupIDsWithMediaBlob:]();
      }
    }
    goto LABEL_21;
  }
  id v5 = +[VCMediaNegotiatorV2 newUnserializedMediaBlob:a3];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorV2 streamGroupIDsWithMediaBlob:]();
      }
    }
LABEL_21:
    int v6 = 0;
    goto LABEL_14;
  }
  int v6 = v5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v7 = (void *)[v5 streamGroups];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = +[VCMediaNegotiationBlobV2StreamGroup streamGroupIDFromStreamGroup:](VCMediaNegotiationBlobV2StreamGroup, "streamGroupIDFromStreamGroup:", [*(id *)(*((void *)&v15 + 1) + 8 * i) streamGroup]);
        objc_msgSend(v4, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v9);
  }
  if ([v6 hasMicrophoneU1]) {
    [v4 addObject:&unk_1F3DC2B08];
  }
  if ([v6 hasCameraU1]) {
    [v4 addObject:&unk_1F3DC2B20];
  }
LABEL_14:

  return v4;
}

+ (int)filteredCipherSuitesFromNegotiatedCipherSuites:(int)a3 u1AuthTagEnabled:(BOOL)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a4 || (VCFeatureFlagManager_U1AuthTagEnabled() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      int v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315906;
        uint64_t v9 = v5;
        __int16 v10 = 2080;
        uint64_t v11 = "+[VCMediaNegotiatorV2 filteredCipherSuitesFromNegotiatedCipherSuites:u1AuthTagEnabled:]";
        __int16 v12 = 1024;
        int v13 = 813;
        __int16 v14 = 2112;
        id v15 = +[VCMediaNegotiationBlobV2SettingsU1 appendCipherSuiteFlags:toDescription:](VCMediaNegotiationBlobV2SettingsU1, "appendCipherSuiteFlags:toDescription:", v4, [MEMORY[0x1E4F28E78] string]);
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Pruning negotiatedCipherSuites=%@ down to CipherAES128AuthNoneRCCM3 because U1AuthTag is NOT enabled", (uint8_t *)&v8, 0x26u);
      }
    }
    LODWORD(v4) = 1;
  }
  return v4;
}

+ (BOOL)updateStreamGroupU1Config:(id)a3 forGroupId:(unsigned int)a4 withNegotiationBlob:(id)a5 streamGroupBlob:(id)a6 localSupportedVideoPayloads:(id)a7 u1AuthTagEnabled:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315906;
      uint64_t v21 = v15;
      __int16 v22 = 2080;
      long long v23 = "+[VCMediaNegotiatorV2 updateStreamGroupU1Config:forGroupId:withNegotiationBlob:streamGroupBlob:localSupporte"
            "dVideoPayloads:u1AuthTagEnabled:]";
      __int16 v24 = 1024;
      int v25 = 830;
      __int16 v26 = 2080;
      __int16 v27 = FourccToCStr(a4);
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Update stream group U1 config for groupID=%s", (uint8_t *)&v20, 0x26u);
    }
  }
  long long v17 = (void *)[a3 u1Config];
  BOOL result = 0;
  if ((int)a4 > 1835623281)
  {
    switch(a4)
    {
      case 0x73797361u:
        objc_msgSend(v17, "setAllowAudioRecording:", objc_msgSend((id)objc_msgSend(a5, "codecSupport"), "allowAudioRecording"));
        objc_msgSend(v17, "setAudioPayloads:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", &unk_1F3DC7038));
        uint64_t v19 = &unk_1F3DC7050;
        break;
      case 0x73637265u:
        return +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:a3 forNegotiationBlob:a5 streamGroupBlob:a6 localSupportedVideoPayloads:a7 u1AuthTagEnabled:v8];
      case 0x6D696372u:
        objc_msgSend(v17, "setAllowAudioRecording:", objc_msgSend((id)objc_msgSend(a5, "codecSupport"), "allowAudioRecording"));
        objc_msgSend(v17, "setAudioPayloads:", objc_msgSend((id)objc_msgSend(a5, "microphoneU1"), "audioPayloads"));
        uint64_t v19 = &unk_1F3DC7020;
        break;
      default:
        return result;
    }
    [v17 setPayloadPreference:v19];
    objc_msgSend(v17, "setSupportedCipherSuites:", +[VCMediaNegotiationBlobV2SettingsU1 mediaStreamCipherSuitesFromNegotiationCipherSuites:](VCMediaNegotiationBlobV2SettingsU1, "mediaStreamCipherSuitesFromNegotiationCipherSuites:", objc_msgSend(a1, "filteredCipherSuitesFromNegotiatedCipherSuites:u1AuthTagEnabled:", objc_msgSend((id)objc_msgSend(a5, "microphoneU1"), "cipherSuites"), v8)));
    return 1;
  }
  switch(a4)
  {
    case 0x62646174u:
      return +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:a3 forNegotiationBlob:a5 streamGroupBlob:a6 localSupportedVideoPayloads:a7 u1AuthTagEnabled:v8];
    case 0x63616D65u:
      return +[VCMediaNegotiatorV2 updateCameraU1Config:v17 forNegotiationBlob:a5 localSupportedVideoPayloads:a7 u1AuthTagEnabled:v8];
    case 0x66747874u:
      return +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:a3 forNegotiationBlob:a5 streamGroupBlob:a6 localSupportedVideoPayloads:a7 u1AuthTagEnabled:v8];
  }
  return result;
}

+ (BOOL)updateCameraU1Config:(id)a3 forNegotiationBlob:(id)a4 localSupportedVideoPayloads:(id)a5 u1AuthTagEnabled:(BOOL)a6
{
  uint64_t v6 = a6;
  id v9 = a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a3, "setVideoRuleCollections:", objc_msgSend((id)objc_msgSend(a4, "cameraU1"), "videoRuleCollections"));
  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "videoRuleCollections"), "rules"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      uint64_t v28 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v41 = v27;
        __int16 v42 = 2080;
        id v43 = "+[VCMediaNegotiatorV2 updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:]";
        __int16 v44 = 1024;
        int v45 = 861;
        _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating video settings, as the remote device does not support video", buf, 0x1Cu);
      }
    }
    goto LABEL_29;
  }
  objc_msgSend(v9, "setPayloadPreference:", +[VCMediaNegotiatorBase getPreferredVideoPayloadList:localSupportedPayloads:mediaType:](VCMediaNegotiatorV2, "getPreferredVideoPayloadList:localSupportedPayloads:mediaType:", objc_msgSend((id)objc_msgSend(v9, "videoRuleCollections"), "supportedPayloads"), a5, 2));
  if (!objc_msgSend((id)objc_msgSend(v9, "payloadPreference"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorV2 updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:]();
      }
    }
    goto LABEL_29;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorV2 updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:]();
      }
    }
LABEL_29:
    __int16 v14 = 0;
    __int16 v12 = 0;
LABEL_34:
    BOOL v25 = 0;
    goto LABEL_19;
  }
  __int16 v12 = v11;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorV2 updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:]();
      }
    }
    __int16 v14 = 0;
    goto LABEL_34;
  }
  __int16 v14 = v13;
  id v33 = a1;
  id v15 = +[VCMediaNegotiatorV2 featureStringWithMediaBlob:a4];
  id v16 = +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:1 aspectRatioFLS:v15 version:1];
  [v9 setVideoFeatureStrings:v16];

  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v32 = a4;
  long long v17 = objc_msgSend((id)objc_msgSend(a4, "cameraU1"), "payloads");
  uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    id v29 = v15;
    unsigned int v30 = v6;
    uint64_t v31 = v9;
    int v20 = v14;
    char v21 = 0;
    uint64_t v22 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v17);
        }
        __int16 v24 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        objc_msgSend(v12, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v24, "payload", v29)));
        objc_msgSend(v20, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v24, "parameterSet")));
        if ([v24 hasEncodeDecodeFeatures])
        {
          [v24 encodeDecodeFeatures];
          objc_msgSend(v34, "setObject:forKeyedSubscript:", (id)VCPCreateDecompressedFLS(), objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v24, "payload")));
          char v21 = 1;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v35 count:16];
    }
    while (v19);
    __int16 v14 = v20;
    id v9 = v31;
    uint64_t v6 = v30;
    if (v21)
    {
      objc_msgSend(v31, "setVideoFeatureStringsFixedPosition:", +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithVCP:aspectRatioFLS:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringWithVCP:aspectRatioFLS:", v34, v29));
    }
  }
  if (![v9 videoFeatureStrings] && !objc_msgSend(v9, "videoFeatureStringsFixedPosition"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorV2 updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:].cold.4();
      }
    }
    goto LABEL_34;
  }
  objc_msgSend(v9, "setSupportedCipherSuites:", +[VCMediaNegotiationBlobV2SettingsU1 mediaStreamCipherSuitesFromNegotiationCipherSuites:](VCMediaNegotiationBlobV2SettingsU1, "mediaStreamCipherSuitesFromNegotiationCipherSuites:", objc_msgSend(v33, "filteredCipherSuitesFromNegotiatedCipherSuites:u1AuthTagEnabled:", objc_msgSend((id)objc_msgSend(v32, "cameraU1"), "cipherSuites"), v6)));
  [v9 setVideoPayloads:v12];
  [v9 setVideoParameterSet:v14];
  BOOL v25 = 1;
LABEL_19:

  return v25;
}

+ (CGSize)resolutionForStreamGroupConfig:(id)a3
{
  int v4 = VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID([a3 groupID]);
  switch(v4)
  {
    case 6:
      double v7 = 480.0;
      double v8 = 480.0;
      break;
    case 5:
      double v8 = 768.0;
      double v7 = 256.0;
      break;
    case 3:
      uint64_t v5 = (void *)[a3 u1Config];
      [v5 setScreenPixelCount:5603328];
      uint64_t v6 = [v5 screenPixelCount];
      +[VideoUtil computeResolutionForMainDisplayWithMaxScreenPixelCount:v6];
      break;
    default:
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      double v7 = 0.0;
      double v8 = 0.0;
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        double v7 = 0.0;
        double v8 = 0.0;
        if (v10)
        {
          +[VCMediaNegotiatorV2 resolutionForStreamGroupConfig:]();
          double v7 = 0.0;
          double v8 = 0.0;
        }
      }
      break;
  }
  result.height = v8;
  result.width = v7;
  return result;
}

+ (BOOL)addV1FeatureListStringsToStreamGroupConfig:(id)a3 mediaType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = (void *)[a3 u1Config];
  if (!+[VCMediaNegotiatorBase v1FeatureListStringsSupportedForMediaType:v4])return 1; {
  BOOL v6 = 1;
  }
  id v7 = +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:aspectRatioFLS:version:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringWithType:aspectRatioFLS:version:", +[VCMediaNegotiatorBase featureListStringTypeForMediaType:v4], 0, 1);
  [v5 setVideoFeatureStrings:v7];

  if (![v5 videoFeatureStrings])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorV2 addV1FeatureListStringsToStreamGroupConfig:mediaType:]();
      }
    }
    return 0;
  }
  return v6;
}

+ (BOOL)addV2FeatureListStringsToStreamGroupConfig:(id)a3 fromStreamGroupBlob:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[a3 u1Config];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = objc_msgSend((id)objc_msgSend(a4, "settingsU1"), "encodeDecodeFeatures");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v12 encodeDecodeFeatures];
        id v13 = (void *)VCPCreateDecompressedFLS();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v12, "rtpPayload")));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v16 count:16];
    }
    while (v9);
  }
  if ([v7 count]
    && ([v5 setVideoFeatureStringsFixedPosition:v6],
        ![v5 videoFeatureStringsFixedPosition]))
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v14) {
        return v14;
      }
      +[VCMediaNegotiatorV2 addV2FeatureListStringsToStreamGroupConfig:fromStreamGroupBlob:]();
    }
    LOBYTE(v14) = 0;
  }
  else
  {

    LOBYTE(v14) = 1;
  }
  return v14;
}

+ (BOOL)addFeatureListStringsToStreamGroupConfig:(id)a3 fromStreamGroupBlob:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID([a3 groupID]);
  if (!+[VCMediaNegotiatorBase featureListStringsRequiredForMediaType:v7])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315906;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        id v15 = "+[VCMediaNegotiatorV2 addFeatureListStringsToStreamGroupConfig:fromStreamGroupBlob:]";
        __int16 v16 = 1024;
        int v17 = 986;
        __int16 v18 = 1024;
        int v19 = v7;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping FLS string add for mediaType=%hhu because it isn't needed", (uint8_t *)&v12, 0x22u);
      }
    }
    goto LABEL_10;
  }
  if (([a1 addV1FeatureListStringsToStreamGroupConfig:a3 mediaType:v7] & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v8) {
        return v8;
      }
      +[VCMediaNegotiatorV2 addFeatureListStringsToStreamGroupConfig:fromStreamGroupBlob:]();
    }
    goto LABEL_15;
  }
  if ([a1 addV2FeatureListStringsToStreamGroupConfig:a3 fromStreamGroupBlob:a4])
  {
LABEL_10:
    LOBYTE(v8) = 1;
    return v8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v8) {
      return v8;
    }
    +[VCMediaNegotiatorV2 addFeatureListStringsToStreamGroupConfig:fromStreamGroupBlob:]();
  }
LABEL_15:
  LOBYTE(v8) = 0;
  return v8;
}

+ (float)frameRateForMediaType:(unsigned __int8)a3
{
  float v3 = 30.0;
  if ((a3 - 5) >= 2)
  {
    if (a3 == 3)
    {
      return (float)+[VCHardwareSettings maxFrameRateSupportedScreenShare];
    }
    else
    {
      float v3 = 0.0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[VCMediaNegotiatorV2 frameRateForMediaType:]();
        }
      }
    }
  }
  return v3;
}

+ (id)u1RemoteSupportedCipherSuitesForBlob:(id)a3 mediaType:(unsigned __int8)a4 u1AuthTagEnabled:(BOOL)a5
{
  if (a4 <= 6u)
  {
    BOOL v5 = a5;
    if (((1 << a4) & 0x6C) != 0)
    {
      uint64_t v7 = (void *)[a3 cameraU1];
LABEL_6:
      uint64_t v8 = objc_msgSend(a1, "filteredCipherSuitesFromNegotiatedCipherSuites:u1AuthTagEnabled:", objc_msgSend(v7, "cipherSuites"), v5);
      return +[VCMediaNegotiationBlobV2SettingsU1 mediaStreamCipherSuitesFromNegotiationCipherSuites:v8];
    }
    if (((1 << a4) & 0x12) != 0)
    {
      uint64_t v7 = (void *)[a3 microphoneU1];
      goto LABEL_6;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      +[VCMediaNegotiatorV2 u1RemoteSupportedCipherSuitesForBlob:mediaType:u1AuthTagEnabled:]();
    }
  }
  return 0;
}

+ (BOOL)updateVideoU1ConfigWithStreamGroupConfig:(id)a3 forNegotiationBlob:(id)a4 streamGroupBlob:(id)a5 localSupportedVideoPayloads:(id)a6 u1AuthTagEnabled:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID([a3 groupID]);
  __int16 v14 = (void *)[v11 u1Config];
  [a1 resolutionForStreamGroupConfig:v11];
  double v16 = v15;
  double v18 = v17;
  [a1 frameRateForMediaType:v13];
  if ((int)v16) {
    BOOL v20 = (int)v18 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:]();
      }
    }
    goto LABEL_35;
  }
  int v21 = v19;
  id v61 = a5;
  id v57 = a4;
  BOOL v58 = v7;
  uint64_t v22 = objc_alloc_init(VCVideoRuleCollections);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  obuint64_t j = (id)[v11 streamConfigs];
  id v66 = v11;
  uint64_t v63 = [obj countByEnumeratingWithState:&v86 objects:v85 count:16];
  unsigned int v60 = v13;
  id v59 = a1;
  if (v63)
  {
    uint64_t v64 = *(void *)v87;
    id v55 = a6;
    long long v56 = v14;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v87 != v64) {
          objc_enumerationMutation(obj);
        }
        uint64_t v65 = v23;
        __int16 v24 = *(void **)(*((void *)&v86 + 1) + 8 * v23);
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        BOOL v25 = objc_msgSend(v24, "codecs", v55, v56);
        uint64_t v26 = [v25 countByEnumeratingWithState:&v81 objects:v80 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v82;
          while (2)
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v82 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "codecConfigs"), "objectAtIndex:", objc_msgSend(*(id *)(*((void *)&v81 + 1) + 8 * i), "integerValue")), "rtpPayload");
              if (v30 == 128)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:].cold.7();
                  }
                }
                goto LABEL_35;
              }
              uint64_t v31 = v30;
              id v32 = [VCVideoRule alloc];
              LODWORD(v33) = v21;
              id v34 = [(VCVideoRule *)v32 initWithFrameWidth:(int)v16 frameHeight:(int)v18 frameRate:v31 payload:v33];
              uint64_t v35 = [MEMORY[0x1E4F1CA48] arrayWithObject:v34];
              [(VCVideoRuleCollections *)v22 addVideoRules:v35 transportType:1 payload:v31 encodingType:1];
              uint64_t v36 = v35;
              id v11 = v66;
              [(VCVideoRuleCollections *)v22 addVideoRules:v36 transportType:1 payload:v31 encodingType:2];
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v81 objects:v80 count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }
        uint64_t v23 = v65 + 1;
      }
      while (v65 + 1 != v63);
      uint64_t v13 = v60;
      a6 = v55;
      __int16 v14 = v56;
      a1 = v59;
      uint64_t v63 = [obj countByEnumeratingWithState:&v86 objects:v85 count:16];
    }
    while (v63);
  }
  if (v13 == 3
    && +[VCHardwareSettings supportsHEVCEncoding])
  {
    long long v37 = [VCVideoRule alloc];
    *(float *)&double v38 = (float)+[VCHardwareSettings maxFrameRateSupportedScreenShare];
    long long v39 = [(VCVideoRule *)v37 initWithFrameWidth:(int)v16 frameHeight:(int)v18 frameRate:100 payload:v38];
    -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](v22, "addVideoRules:transportType:payload:encodingType:", [MEMORY[0x1E4F1CA48] arrayWithObject:v39], 1, 100, 2);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v40 = VRTraceErrorLogLevelToCSTR();
      uint64_t v41 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v73 = v40;
        __int16 v74 = 2080;
        v75 = "+[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSup"
              "portedVideoPayloads:u1AuthTagEnabled:]";
        __int16 v76 = 1024;
        int v77 = 1069;
        _os_log_impl(&dword_1E1EA4000, v41, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Adding HEVC decode video rule for kTransportTypeWifi explicitly for screen stream group", buf, 0x1Cu);
      }
    }
  }
  [v14 setVideoRuleCollections:v22];

  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "videoRuleCollections"), "rules"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v53 = VRTraceErrorLogLevelToCSTR();
      long long v54 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v73 = v53;
        __int16 v74 = 2080;
        v75 = "+[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSup"
              "portedVideoPayloads:u1AuthTagEnabled:]";
        __int16 v76 = 1024;
        int v77 = 1074;
        __int16 v78 = 1024;
        int v79 = v13;
        _os_log_impl(&dword_1E1EA4000, v54, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating settings, as the local device does not support mediaType=%hhu", buf, 0x22u);
      }
    }
    id v44 = 0;
    id v43 = 0;
LABEL_48:
    BOOL v45 = 1;
    goto LABEL_49;
  }
  if (([a1 addFeatureListStringsToStreamGroupConfig:v66 fromStreamGroupBlob:v61] & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:].cold.6();
      }
    }
    goto LABEL_35;
  }
  objc_msgSend(v14, "setPayloadPreference:", +[VCMediaNegotiatorBase getPreferredVideoPayloadList:localSupportedPayloads:mediaType:](VCMediaNegotiatorV2, "getPreferredVideoPayloadList:localSupportedPayloads:mediaType:", objc_msgSend((id)objc_msgSend(v14, "videoRuleCollections"), "supportedPayloads"), a6, v13));
  if (!objc_msgSend((id)objc_msgSend(v14, "payloadPreference"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:]();
      }
    }
    goto LABEL_35;
  }
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v42)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:]();
      }
    }
LABEL_35:
    id v44 = 0;
    id v43 = 0;
    goto LABEL_36;
  }
  id v43 = v42;
  if (v13 == 6)
  {
    id v44 = 0;
LABEL_38:
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    uint64_t v46 = objc_msgSend((id)objc_msgSend(v14, "videoRuleCollections"), "supportedPayloads");
    uint64_t v47 = [v46 countByEnumeratingWithState:&v68 objects:v67 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v69;
      while (2)
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v69 != v49) {
            objc_enumerationMutation(v46);
          }
          v51 = *(void **)(*((void *)&v68 + 1) + 8 * j);
          if ([v51 unsignedIntValue] == 128)
          {

            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:].cold.4();
              }
            }
            goto LABEL_36;
          }
          [v43 addObject:v51];
          objc_msgSend(v44, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", VCVideoParamaterSets_DefaultSupportedSets(objc_msgSend(v51, "unsignedIntValue"))));
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v68 objects:v67 count:16];
        if (v48) {
          continue;
        }
        break;
      }
    }
    objc_msgSend(v14, "setSupportedCipherSuites:", objc_msgSend(v59, "u1RemoteSupportedCipherSuitesForBlob:mediaType:u1AuthTagEnabled:", v57, v60, v58));
    [v14 setVideoPayloads:v43];
    if ([v44 count]) {
      [v14 setVideoParameterSet:v44];
    }
    goto LABEL_48;
  }
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v44) {
    goto LABEL_38;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      +[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:].cold.5();
    }
  }
  id v44 = 0;
LABEL_36:
  BOOL v45 = 0;
LABEL_49:

  return v45;
}

- (void)negotiationData
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to compress the media blob", v2, v3, v4, v5, v6);
}

+ (void)newCompressedBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate memory for v2 blob", v2, v3, v4, v5, v6);
}

+ (void)newDecompressedBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate memory for v2 blob", v2, v3, v4, v5, v6);
}

+ (void)newUnserializedMediaBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Compressed media blob is nil", v2, v3, v4, v5, v6);
}

+ (void)newUnserializedMediaBlob:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decompress the media blob v2", v2, v3, v4, v5, v6);
}

+ (void)newUnserializedMediaBlob:.cold.3()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "+[VCMediaNegotiatorV2 newUnserializedMediaBlob:]";
  OUTLINED_FUNCTION_3();
  int v4 = 128;
  __int16 v5 = 2112;
  uint64_t v6 = v0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Exception occurred while parsing remote invite blob: %@", v2, 0x26u);
}

- (void)processRemoteNegotiationData:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Remote invite blob is nil", v2, v3, v4, v5, v6);
}

- (void)processRemoteNegotiationData:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to deserialize the remote invite blob", v2, v3, v4, v5, v6);
}

- (void)processRemoteNegotiationData:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to generated negotiated stream groups", v2, v3, v4, v5, v6);
}

- (void)processRemoteNegotiationData:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to generated negotiated moments results", v2, v3, v4, v5, v6);
}

- (void)processRemoteNegotiationData:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to generated negotiated results", v2, v3, v4, v5, v6);
}

+ (void)initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to parse the negotiation data", v2, v3, v4, v5, v6);
}

+ (void)initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCMediaNegotiatorV2 initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retrieve stream group. status=%x", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiatorV2 initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:]" >> 16, v4);
}

+ (void)initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate system audio configuration", v2, v3, v4, v5, v6);
}

- (void)appendGeneralInfoToMediaBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media blob (v2) general info", v2, v3, v4, v5, v6);
}

- (void)appendBandwidthSettingsToMediaBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media blob (v2) banwidth settings", v2, v3, v4, v5, v6);
}

- (void)appendCodecFeaturesToMediaBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media blob (v2) codec features", v2, v3, v4, v5, v6);
}

- (void)appendCodecFeaturesToMediaBlob:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaNegotiatorV2 appendCodecFeaturesToMediaBlob:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate memory to get VCP Codec properties. encoderUsage=%d", v2, *(const char **)v3, (unint64_t)"-[VCMediaNegotiatorV2 appendCodecFeaturesToMediaBlob:]" >> 16, v4);
}

- (void)appendMicrophoneOneToOneSettingsToMediaBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media blob (v2) microphone U+1 settings", v2, v3, v4, v5, v6);
}

- (void)appendCameraOneToOneSettingsToMediaBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media blob (v2) camera U+1 settings", v2, v3, v4, v5, v6);
}

- (void)appendMomentsSettingsToMediaBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media blob (v2) moments settings", v2, v3, v4, v5, v6);
}

- (void)appendStreamGroupsToMediaBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media blob (v2) stream group", v2, v3, v4, v5, v6);
}

- (void)setupNegotiatedResultsWithRemoteMediaBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retrive the bandwdith settings", v2, v3, v4, v5, v6);
}

- (void)setupNegotiatedVideoSettingsWithRemoteMediaBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Video features not successfully negotiated", v2, v3, v4, v5, v6);
}

- (void)setupNegotiatedVideoSettingsWithRemoteMediaBlob:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No available payloads", v2, v3, v4, v5, v6);
}

- (void)setupNegotiatedVideoSettingsWithRemoteMediaBlob:.cold.3()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v4 = "-[VCMediaNegotiatorV2 setupNegotiatedVideoSettingsWithRemoteMediaBlob:]";
  OUTLINED_FUNCTION_3();
  int v5 = 545;
  __int16 v6 = v0;
  int v7 = 1;
  __int16 v8 = v0;
  int v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to find video rule for transportType=%d encodingType=%d", v3, 0x28u);
}

- (void)negotiateStreamGroupConfig:remoteInviteBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid payload in streamconfig", v2, v3, v4, v5, v6);
}

- (void)setupStreamGroupsWithRemoteMediaBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to generated negotiated video results", v2, v3, v4, v5, v6);
}

- (void)setupStreamGroupsWithRemoteMediaBlob:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retrieve stream group. result=%x", v2, *(const char **)v3, (unint64_t)"-[VCMediaNegotiatorV2 setupStreamGroupsWithRemoteMediaBlob:]" >> 16, v4);
}

- (void)setupStreamGroupsWithRemoteMediaBlob:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate stream groups", v2, v3, v4, v5, v6);
}

- (void)negotiateU1SettingsForStreamGroup:(NSObject *)a3 .cold.1(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  FourccToCStr(a2);
  int v7 = 136315906;
  uint64_t v8 = a1;
  __int16 v9 = 2080;
  OUTLINED_FUNCTION_8();
  int v10 = 759;
  __int16 v11 = v5;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to negotiate stream group config for groupID=%s", (uint8_t *)&v7, 0x26u);
}

+ (void)streamGroupIDsWithMediaBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate stream group set", v2, v3, v4, v5, v6);
}

+ (void)streamGroupIDsWithMediaBlob:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to unserialize the blob", v2, v3, v4, v5, v6);
}

+ (void)updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No available payloads", v2, v3, v4, v5, v6);
}

+ (void)updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate videoPayloads array", v2, v3, v4, v5, v6);
}

+ (void)updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate videoParameterSet array", v2, v3, v4, v5, v6);
}

+ (void)updateCameraU1Config:forNegotiationBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Video features are not successfully updated", v2, v3, v4, v5, v6);
}

+ (void)resolutionForStreamGroupConfig:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCMediaNegotiatorV2 resolutionForStreamGroupConfig:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected mediaType=%hhu", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiatorV2 resolutionForStreamGroupConfig:]" >> 16, v4);
}

+ (void)addV1FeatureListStringsToStreamGroupConfig:mediaType:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Features not successfully negotiated for mediaType=%hhu", v2, v3, v4, v5);
}

+ (void)addV2FeatureListStringsToStreamGroupConfig:fromStreamGroupBlob:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Screen features V2 not successfully negotiated", v2, v3, v4, v5, v6);
}

+ (void)addFeatureListStringsToStreamGroupConfig:fromStreamGroupBlob:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to add V2 feature list strings to streamGroupConfig for mediaType=%hhu", v2, v3, v4, v5);
}

+ (void)addFeatureListStringsToStreamGroupConfig:fromStreamGroupBlob:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to add V1 feature list strings to streamGroupConfig for mediaType=%hhu", v2, v3, v4, v5);
}

+ (void)frameRateForMediaType:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCMediaNegotiatorV2 frameRateForMediaType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected mediaType=%hhu", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiatorV2 frameRateForMediaType:]" >> 16, v4);
}

+ (void)u1RemoteSupportedCipherSuitesForBlob:mediaType:u1AuthTagEnabled:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCMediaNegotiatorV2 u1RemoteSupportedCipherSuitesForBlob:mediaType:u1AuthTagEnabled:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected mediaType=%hhu", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiatorV2 u1RemoteSupportedCipherSuitesForBlob:mediaType:u1AuthTagEnabled:]" >> 16, v4);
}

+ (void)updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d mediaType=%hhu U1 settings failed to calculate resolution", v2, v3, v4, v5);
}

+ (void)updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No available payloads", v2, v3, v4, v5, v6);
}

+ (void)updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate videoPayloads array", v2, v3, v4, v5, v6);
}

+ (void)updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid payload in streamconfig", v2, v3, v4, v5, v6);
}

+ (void)updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate videoParameterSet array", v2, v3, v4, v5, v6);
}

+ (void)updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.6()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:"
                      "localSupportedVideoPayloads:u1AuthTagEnabled:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to add featureListStrings for mediaType=%hhu", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiatorV2 updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:]" >> 16, v4);
}

+ (void)updateVideoU1ConfigWithStreamGroupConfig:forNegotiationBlob:streamGroupBlob:localSupportedVideoPayloads:u1AuthTagEnabled:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid payload in streamconfig", v2, v3, v4, v5, v6);
}

@end