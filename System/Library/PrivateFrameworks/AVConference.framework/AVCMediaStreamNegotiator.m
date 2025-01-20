@interface AVCMediaStreamNegotiator
+ (int64_t)clientAccessNetworkType:(int)a3;
+ (int64_t)clientCodecTypeWithCodecType:(int64_t)a3;
- (AVCMediaStreamNegotiator)initWithMode:(int64_t)a3 error:(id *)a4;
- (AVCMediaStreamNegotiator)initWithMode:(int64_t)a3 options:(id)a4 error:(id *)a5;
- (AVCMediaStreamNegotiator)initWithOffer:(id)a3 error:(id *)a4;
- (AVCMediaStreamNegotiator)initWithOffer:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)addLocalCallInfoBlobToOutgoingDictionary:(id)a3;
- (BOOL)createAnswer;
- (BOOL)createOffer;
- (BOOL)initNegotiatorLocalConfiguration:(id *)a3 options:(id)a4;
- (BOOL)processAnswerWithError:(id *)a3 errorReason:(id *)a4;
- (BOOL)processAnswererInitOptions:(id)a3 errorReason:(id *)a4;
- (BOOL)processOfferWithError:(id *)a3 errorReason:(id *)a4;
- (BOOL)setAnswer:(id)a3 withError:(id *)a4;
- (BOOL)setupAudioStreamConfiguration:(id)a3 errorReason:(id *)a4;
- (BOOL)setupVideoStreamConfiguration:(id)a3 errorReason:(id *)a4;
- (NSData)answer;
- (NSData)offer;
- (id)generateMediaStreamConfigurationWithError:(id *)a3;
- (id)generateMediaStreamInitOptionsWithError:(id *)a3;
- (id)supportedPixelFormats;
- (unsigned)pickBestPixelFormatFromSet:(id)a3;
- (unsigned)pickBestPixelFormatFromSet:(id)a3 preferenceList:(unsigned int *)a4 count:(int)a5 acceptDefault:(BOOL)a6;
- (void)addHDRModeSpecificSettings:(id)a3;
- (void)createAnswer;
- (void)createOffer;
- (void)dealloc;
- (void)pickBestHDRMode:(id)a3;
- (void)processOffererInitOptions:(id)a3 errorReason:(id *)a4;
@end

@implementation AVCMediaStreamNegotiator

+ (int64_t)clientCodecTypeWithCodecType:(int64_t)a3
{
  return a3 == 102;
}

+ (int64_t)clientAccessNetworkType:(int)a3
{
  if (a3 == 1) {
    return 1;
  }
  if (a3 == 2) {
    return 2;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      +[AVCMediaStreamNegotiator(utils) clientAccessNetworkType:]();
    }
  }
  return 0;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)AVCMediaStreamNegotiator;
  [(AVCMediaStreamNegotiator *)&v3 dealloc];
}

- (BOOL)initNegotiatorLocalConfiguration:(id *)a3 options:(id)a4
{
  [(AVCMediaStreamNegotiator *)self refreshLoggingParameters];
  v7 = [[VCBitrateArbiter alloc] initWithDeviceRole:0 callLogFile:0];
  if (!v7)
  {
    v10 = 0;
    v12 = 0;
    v8 = 0;
    BOOL v22 = 0;
    self->_errorDetailCode = 7;
    v24 = @"Failed to create bitRateArbiter";
LABEL_35:
    *a3 = v24;
    goto LABEL_19;
  }
  v8 = [[VCMediaNegotiatorLocalConfiguration alloc] initWithBitrateArbiter:v7];
  if (!v8)
  {
    v10 = 0;
    v12 = 0;
    BOOL v22 = 0;
    self->_errorDetailCode = 7;
    v24 = @"Failed to create local config object";
    goto LABEL_35;
  }
  v9 = (AVCMediaStreamNegotiatorSettings *)+[AVCMediaStreamNegotiatorSettings negotiatorSettingsForMode:self->_mediaStreamMode deviceRole:self->_deviceRole options:a4 errorString:a3];
  self->_negotiatorSettings = v9;
  if (!v9)
  {
    v10 = 0;
    v12 = 0;
    BOOL v22 = 0;
    self->_errorDetailCode = 7;
    goto LABEL_19;
  }
  v10 = [(AVCMediaStreamNegotiatorSettings *)v9 featureListString];
  if (!v10)
  {
    v12 = 0;
    BOOL v22 = 0;
    self->_errorDetailCode = 3;
    v24 = @"Failed to create local feature string for media negotiator";
    goto LABEL_35;
  }
  v11 = objc_alloc_init(VCMediaNegotiatorVideoConfiguration);
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMediaStreamNegotiator initNegotiatorLocalConfiguration:options:]();
      }
    }
    v10 = 0;
    v12 = 0;
    goto LABEL_33;
  }
  v12 = v11;
  if ([(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings videoRuleCollections]) {
    uint64_t v13 = [(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings localSSRC];
  }
  else {
    uint64_t v13 = 0;
  }
  [(VCMediaNegotiatorCommonConfiguration *)v12 setSsrc:v13];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setMediaConfiguration:[(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings audioConfiguration] forMediaType:1];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setPreferredAudioCodec:[(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings preferredAudioCodec]];
  [(VCMediaNegotiatorVideoConfiguration *)v12 setVideoRuleCollections:[(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings videoRuleCollections]];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setAccessNetworkType:[(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings accessNetworkType]];
  [(VCMediaNegotiatorVideoConfiguration *)v12 setVideoFeatureStrings:v10];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setAllowRTCPFB:0];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setIsCaller:self->_deviceRole == 1];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setCallLogFile:0];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setBasebandCodec:0];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setBasebandCodecSampleRate:0];
  int64_t videoHeight = self->_videoHeight;
  int64_t videoWidth = self->_videoWidth;
  if ([(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings shouldApply16AlignedAdjustment])
  {
    +[VideoUtil compute16AlignedResolutionForNativeWidth:LODWORD(self->_videoWidth) nativeHeight:LODWORD(self->_videoHeight) maxScreenPixelCount:5603328 maxScreenEncodingSizeSupported:5603328];
    double v18 = v17;
  }
  else
  {
    double v16 = (double)videoWidth;
    double v18 = (double)videoHeight;
  }
  [(VCMediaNegotiatorLocalConfiguration *)v8 setCustomVideoWidth:LODWORD(self->_dpiFactor) * (uint64_t)v16];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setCustomVideoHeight:LODWORD(self->_dpiFactor) * (uint64_t)v18];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setTilesPerVideoFrame:[(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings tilesPerFrame]];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setLtrpEnabled:1];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setPixelFormats:[(AVCMediaStreamNegotiator *)self supportedPixelFormats]];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setFecEnabled:[(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings accessNetworkType] == 2];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setRtxEnabled:0];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setBlackFrameOnClearScreenEnabledDefault:[(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings blackFrameOnClearScreenEnabledDefault]];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setBlackFrameOnClearScreenEnabled:[(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings blackFrameOnClearScreenEnabled]];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setFoveationIsSupported:[(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings foveationIsSupported]];
  [(AVCMediaStreamNegotiator *)self addHDRModeSpecificSettings:v8];
  if (![(VCMediaNegotiatorLocalConfiguration *)v8 pixelFormats])
  {
    v10 = 0;
    BOOL v22 = 0;
    self->_errorDetailCode = 7;
    v24 = @"Failed to obtain pixelFormat set";
    goto LABEL_35;
  }
  uint64_t v19 = [(VCMediaNegotiatorVideoConfiguration *)v12 copy];
  if (!v19)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMediaStreamNegotiator initNegotiatorLocalConfiguration:options:]();
      }
    }
    v10 = 0;
LABEL_33:
    BOOL v22 = 0;
    goto LABEL_19;
  }
  v10 = (NSDictionary *)v19;
  if ([(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings screenRuleCollections]) {
    uint64_t v20 = [(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings localSSRC];
  }
  else {
    uint64_t v20 = 0;
  }
  [(NSDictionary *)v10 setSsrc:v20];
  [(NSDictionary *)v10 setVideoRuleCollections:[(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings screenRuleCollections]];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setMediaConfiguration:v12 forMediaType:2];
  [(VCMediaNegotiatorLocalConfiguration *)v8 setMediaConfiguration:v10 forMediaType:3];
  v21 = [[VCMediaNegotiator alloc] initWithMode:self->_mediaStreamMode localSettings:v8];
  self->_mediaNegotiator = v21;
  if (!v21)
  {
    BOOL v22 = 0;
    self->_errorDetailCode = 2;
    v24 = @"Failed to create VCMediaNegotiator";
    goto LABEL_35;
  }
  BOOL v22 = 1;
LABEL_19:

  return v22;
}

- (id)supportedPixelFormats
{
  v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettings *)v2 pixelFormatCollections];
}

- (void)addHDRModeSpecificSettings:(id)a3
{
  v5 = [(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings hdrModePixelFormats];
  if (v5) {
    objc_msgSend(a3, "setPixelFormats:", objc_msgSend((id)objc_msgSend(a3, "pixelFormats"), "setByAddingObjectsFromArray:", v5));
  }
  if ([(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings hdrModesSupported])
  {
    v6 = [(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings hdrModesSupported];
    [a3 setHdrModesSupported:v6];
  }
}

- (AVCMediaStreamNegotiator)initWithMode:(int64_t)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *a5;
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = v9;
      __int16 v19 = 2080;
      uint64_t v20 = "-[AVCMediaStreamNegotiator initWithMode:options:error:]";
      __int16 v21 = 1024;
      int v22 = 227;
      __int16 v23 = 2048;
      int64_t v24 = a3;
      __int16 v25 = 2112;
      id v26 = v11;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d mode=%ld, error=%@", buf, 0x30u);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)AVCMediaStreamNegotiator;
  v12 = [(AVCMediaStreamNegotiator *)&v17 init];
  uint64_t v13 = v12;
  if (v12)
  {
    *(void *)buf = 0;
    v12->_deviceRole = 1;
    v12->_mediaStreamMode = a3;
    *(_OWORD *)&v12->_videoHDRMode = 0u;
    *(_OWORD *)&v12->_mediaStreamAccessNetworkType = 0u;
    if (a4) {
      [(AVCMediaStreamNegotiator *)v12 processOffererInitOptions:a4 errorReason:buf];
    }
    if ([(AVCMediaStreamNegotiator *)v13 initNegotiatorLocalConfiguration:buf options:a4])
    {
      v14 = (NSData *)[(VCMediaNegotiator *)v13->_mediaNegotiator negotiationData];
      v13->_mediaBlobCompressed = v14;
      if (v14)
      {
        if ([(AVCMediaStreamNegotiator *)v13 createOffer]) {
          return v13;
        }
        *(void *)buf = @"Failed to create offerer dictionary with media blob";
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if (VRTraceIsOSFaultDisabled())
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[AVCMediaStreamNegotiator initWithMode:options:error:]();
            }
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
          {
            -[AVCMediaStreamNegotiator initWithMode:options:error:].cold.4();
          }
        }
      }
      else
      {
        *(void *)buf = @"Failed to create the offerer media blob";
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if (VRTraceIsOSFaultDisabled())
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[AVCMediaStreamNegotiator initWithMode:options:error:]();
            }
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
          {
            -[AVCMediaStreamNegotiator initWithMode:options:error:]();
          }
        }
      }
      uint64_t errorDetailCode = 3;
    }
    else
    {
      uint64_t errorDetailCode = v13->_errorDetailCode;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCMediaStreamNegotiator initWithMode:options:error:].cold.5();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[AVCMediaStreamNegotiator initWithMode:options:error:].cold.6();
        }
      }
    }
    if (a5 && !*a5) {
      +[GKVoiceChatError getNSError:a5 code:32032 detailedCode:errorDetailCode filePath:0 description:0 reason:*(void *)buf];
    }

    return 0;
  }
  return v13;
}

- (AVCMediaStreamNegotiator)initWithMode:(int64_t)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *a4;
      int v11 = 136316162;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      v14 = "-[AVCMediaStreamNegotiator initWithMode:error:]";
      __int16 v15 = 1024;
      int v16 = 270;
      __int16 v17 = 2048;
      int64_t v18 = a3;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d mode=%ld, error=%@", (uint8_t *)&v11, 0x30u);
    }
  }
  return [(AVCMediaStreamNegotiator *)self initWithMode:a3 options:0 error:a4];
}

- (void)processOffererInitOptions:(id)a3 errorReason:(id *)a4
{
  if (objc_msgSend(a3, "objectForKey:", @"AVCMediaStreamNegotiatorHDRMode", a4)) {
    self->_videoHDRMode = (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AVCMediaStreamNegotiatorHDRMode"), "intValue");
  }
  if ([a3 objectForKey:@"AVCMediaStreamNegotiatorTransportType"]) {
    self->_mediaStreamTransportType = (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AVCMediaStreamNegotiatorTransportType"), "intValue");
  }
  if ([a3 objectForKey:@"AVCMediaStreamNegotiatorTransportProtocolType"]) {
    self->_mediaStreamTransportProtocolType = (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AVCMediaStreamNegotiatorTransportProtocolType"), "intValue");
  }
}

- (BOOL)createOffer
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!v5)
  {
    if ((AVCMediaStreamNegotiator *)objc_opt_class() == self) {
      -[AVCMediaStreamNegotiator createOffer]((uint64_t)&v19);
    }
    -[AVCMediaStreamNegotiator createOffer]();
    goto LABEL_19;
  }
  v2 = v5;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFUUIDRef v3 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (!v3)
  {
    if ((AVCMediaStreamNegotiator *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        int v11 = (__CFString *)[(AVCMediaStreamNegotiator *)self performSelector:sel_logPrefix];
      }
      else {
        int v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_39;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      __int16 v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      int v19 = 136316162;
      uint64_t v20 = v14;
      __int16 v21 = 2080;
      int v22 = "-[AVCMediaStreamNegotiator createOffer]";
      __int16 v23 = 1024;
      int v24 = 297;
      __int16 v25 = 2112;
      id v26 = v11;
      __int16 v27 = 2048;
      v28 = self;
      int v16 = " [%s] %s:%d %@(%p) uuid generation failed";
      goto LABEL_41;
    }
LABEL_19:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMediaStreamNegotiator createOffer]();
      }
    }
    goto LABEL_39;
  }
  uint64_t v7 = (__CFString *)CFUUIDCreateString(v6, v3);
  self->_dataSessionID = &v7->isa;
  if (!v7)
  {
    if ((AVCMediaStreamNegotiator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCMediaStreamNegotiator createOffer].cold.4();
        }
      }
      goto LABEL_39;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v12 = (__CFString *)[(AVCMediaStreamNegotiator *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v12 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_39;
    }
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    __int16 v15 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    int v19 = 136316162;
    uint64_t v20 = v17;
    __int16 v21 = 2080;
    int v22 = "-[AVCMediaStreamNegotiator createOffer]";
    __int16 v23 = 1024;
    int v24 = 300;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2048;
    v28 = self;
    int v16 = " [%s] %s:%d %@(%p) could not generate dataSessionID";
    goto LABEL_41;
  }
  [v2 setObject:v7 forKeyedSubscript:@"avcMediaStreamOptionCallID"];
  [v2 setObject:self->_mediaBlobCompressed forKeyedSubscript:@"avcMediaStreamNegotiatorMediaBlob"];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", self->_mediaStreamMode), @"avcMediaStreamNegotiatorMode");
  if (![(AVCMediaStreamNegotiator *)self addLocalCallInfoBlobToOutgoingDictionary:v2])
  {
    if ((AVCMediaStreamNegotiator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCMediaStreamNegotiator createOffer].cold.5();
        }
      }
      goto LABEL_39;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = (__CFString *)[(AVCMediaStreamNegotiator *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v18 = VRTraceErrorLogLevelToCSTR(),
          __int16 v15 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_39:
      BOOL v9 = 0;
      goto LABEL_6;
    }
    int v19 = 136316162;
    uint64_t v20 = v18;
    __int16 v21 = 2080;
    int v22 = "-[AVCMediaStreamNegotiator createOffer]";
    __int16 v23 = 1024;
    int v24 = 306;
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 2048;
    v28 = self;
    int v16 = " [%s] %s:%d %@(%p) could not generate callInfoBlob on offerer";
LABEL_41:
    _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v19, 0x30u);
    goto LABEL_39;
  }
  v8 = (NSData *)(id)[MEMORY[0x1E4F28F98] dataWithPropertyList:v2 format:200 options:0 error:0];
  self->_offer = v8;
  BOOL v9 = v8 != 0;
LABEL_6:
  CFRelease(v3);

  return v9;
}

- (BOOL)processOfferWithError:(id *)a3 errorReason:(id *)a4
{
  CFAllocatorRef v6 = (NSData *)[MEMORY[0x1E4F28F98] propertyListWithData:self->_offer options:0 format:0 error:a3];
  if (!v6)
  {
    self->_uint64_t errorDetailCode = 4;
    v8 = @"Failed to deserialize media blob on answerer";
LABEL_8:
    *a4 = v8;
    return (char)v6;
  }
  uint64_t v7 = v6;
  self->_mediaStreamMode = (int)objc_msgSend((id)-[NSData objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", @"avcMediaStreamNegotiatorMode"), "intValue");
  self->_dataSessionID = (NSString *)(id)[(NSData *)v7 objectForKeyedSubscript:@"avcMediaStreamOptionCallID"];
  CFAllocatorRef v6 = (NSData *)(id)[(NSData *)v7 objectForKeyedSubscript:@"avcMediaStreamNegotiatorMediaBlob"];
  self->_mediaBlobCompressed = v6;
  if (!v6)
  {
    self->_uint64_t errorDetailCode = 4;
    v8 = @"Failed to extract incoming media blob on answerer";
    goto LABEL_8;
  }
  if ([(NSData *)v7 objectForKey:@"avcMediaStreamOptionRemoteEndpointInfo"]) {
    self->_remoteCallInfoBlob = (NSData *)(id)[(NSData *)v7 objectForKeyedSubscript:@"avcMediaStreamOptionRemoteEndpointInfo"];
  }
  LOBYTE(v6) = 1;
  return (char)v6;
}

- (BOOL)processAnswererInitOptions:(id)a3 errorReason:(id *)a4
{
  self->_dpiFactor = 1;
  if ([a3 objectForKey:@"AVCMediaStreamNegotiatorVideoWidth"])
  {
    uint64_t v7 = (void *)[a3 objectForKeyedSubscript:@"AVCMediaStreamNegotiatorVideoWidth"];
    if (!v7)
    {
      self->_uint64_t errorDetailCode = 7;
      v8 = @"cannot get video width from Init options";
      goto LABEL_20;
    }
    self->_int64_t videoWidth = (int)[v7 intValue];
  }
  if ([a3 objectForKey:@"AVCMediaStreamNegotiatorVideoHeight"])
  {
    uint64_t v7 = (void *)[a3 objectForKeyedSubscript:@"AVCMediaStreamNegotiatorVideoHeight"];
    if (!v7)
    {
      self->_uint64_t errorDetailCode = 7;
      v8 = @"cannot get video height from Init options";
      goto LABEL_20;
    }
    self->_int64_t videoHeight = (int)[v7 intValue];
  }
  if ([a3 objectForKey:@"AVCMediaStreamNegotiatorVideoResolution"])
  {
    uint64_t v7 = (void *)[a3 objectForKeyedSubscript:@"AVCMediaStreamNegotiatorVideoResolution"];
    if (v7)
    {
      self->_dpiFactor = (int)[v7 intValue];
      goto LABEL_10;
    }
    self->_uint64_t errorDetailCode = 7;
    v8 = @"cannot get DPI scaling facfor from Init options";
LABEL_20:
    *a4 = v8;
    return (char)v7;
  }
LABEL_10:
  if ([a3 objectForKey:@"AVCMediaStreamNegotiatorHDRMode"]) {
    self->_videoHDRMode = (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AVCMediaStreamNegotiatorHDRMode"), "intValue");
  }
  if ([a3 objectForKey:@"AVCMediaStreamNegotiatorTransportType"]) {
    self->_mediaStreamTransportType = (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AVCMediaStreamNegotiatorTransportType"), "intValue");
  }
  if ([a3 objectForKey:@"AVCMediaStreamNegotiatorTransportProtocolType"]) {
    self->_mediaStreamTransportProtocolType = (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AVCMediaStreamNegotiatorTransportProtocolType"), "intValue");
  }
  LOBYTE(v7) = 1;
  return (char)v7;
}

- (AVCMediaStreamNegotiator)initWithOffer:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *a4;
      int v11 = 136316162;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      uint64_t v14 = "-[AVCMediaStreamNegotiator initWithOffer:error:]";
      __int16 v15 = 1024;
      int v16 = 381;
      __int16 v17 = 2112;
      id v18 = a3;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d offer=%@, error=%@", (uint8_t *)&v11, 0x30u);
    }
  }
  return [(AVCMediaStreamNegotiator *)self initWithOffer:a3 options:0 error:a4];
}

- (AVCMediaStreamNegotiator)initWithOffer:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
    goto LABEL_17;
  }
  __str = 0;
  if (a3)
  {
    id v9 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    if (a4)
    {
LABEL_4:
      v10 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      goto LABEL_7;
    }
  }
  else
  {
    id v9 = "<nil>";
    if (a4) {
      goto LABEL_4;
    }
  }
  v10 = "<nil>";
LABEL_7:
  if (*a5) {
    int v11 = (const char *)objc_msgSend((id)objc_msgSend(*a5, "description"), "UTF8String");
  }
  else {
    int v11 = "<nil>";
  }
  asprintf(&__str, "offer=%s, options=%s, error=%s", v9, v10, v11);
  if (__str)
  {
    uint64_t v21 = self;
    int v22 = a5;
    __lasts = 0;
    uint64_t v12 = strtok_r(__str, "\n", &__lasts);
    __int16 v13 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        __int16 v15 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = v14;
          __int16 v27 = 2080;
          v28 = "-[AVCMediaStreamNegotiator initWithOffer:options:error:]";
          __int16 v29 = 1024;
          int v30 = 386;
          __int16 v31 = 2080;
          v32 = "";
          __int16 v33 = 2080;
          v34 = v12;
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      uint64_t v12 = strtok_r(0, "\n", &__lasts);
    }
    while (v12);
    free(__str);
    a5 = v22;
    self = v21;
  }
LABEL_17:
  v23.receiver = self;
  v23.super_class = (Class)AVCMediaStreamNegotiator;
  int v16 = [(AVCMediaStreamNegotiator *)&v23 init];
  __int16 v17 = v16;
  if (v16)
  {
    *(void *)buf = 0;
    v16->_mediaStreamTransportType = 0;
    v16->_mediaStreamAccessNetworkType = 0;
    v16->_videoHDRMode = 0;
    v16->_deviceRole = 2;
    v16->_offer = (NSData *)a3;
    if ([(AVCMediaStreamNegotiator *)v17 processOfferWithError:a5 errorReason:buf])
    {
      if (a4
        && ![(AVCMediaStreamNegotiator *)v17 processAnswererInitOptions:a4 errorReason:buf])
      {
        uint64_t errorDetailCode = v17->_errorDetailCode;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if (VRTraceIsOSFaultDisabled())
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[AVCMediaStreamNegotiator initWithOffer:options:error:].cold.9();
            }
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
          {
            -[AVCMediaStreamNegotiator initWithOffer:options:error:]0();
          }
        }
      }
      else if ([(AVCMediaStreamNegotiator *)v17 initNegotiatorLocalConfiguration:buf options:a4])
      {
        if ([(VCMediaNegotiator *)v17->_mediaNegotiator processRemoteNegotiationData:v17->_mediaBlobCompressed])
        {
          uint64_t v18 = [(VCMediaNegotiator *)v17->_mediaNegotiator newResponseBlob];
          v17->_mediaBlobNegotiated = (NSData *)v18;
          if (v18)
          {
            if ([(AVCMediaStreamNegotiator *)v17 createAnswer]) {
              return v17;
            }
            *(void *)buf = @"Failed to create answer dictionary on answerer";
            if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
            {
              VRTraceErrorLogLevelToCSTR();
              if (VRTraceIsOSFaultDisabled())
              {
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[AVCMediaStreamNegotiator initWithOffer:options:error:]();
                }
              }
              else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
              {
                -[AVCMediaStreamNegotiator initWithOffer:options:error:].cold.4();
              }
            }
            uint64_t errorDetailCode = 7;
          }
          else
          {
            *(void *)buf = @"Failed to create the response media blob on answerer";
            if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
            {
              VRTraceErrorLogLevelToCSTR();
              if (VRTraceIsOSFaultDisabled())
              {
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[AVCMediaStreamNegotiator initWithOffer:options:error:]();
                }
              }
              else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
              {
                -[AVCMediaStreamNegotiator initWithOffer:options:error:]();
              }
            }
            uint64_t errorDetailCode = 3;
          }
        }
        else
        {
          *(void *)buf = @"Failed to process incoming blob on answerer";
          if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
          {
            VRTraceErrorLogLevelToCSTR();
            if (VRTraceIsOSFaultDisabled())
            {
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[AVCMediaStreamNegotiator initWithOffer:options:error:].cold.5();
              }
            }
            else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
            {
              -[AVCMediaStreamNegotiator initWithOffer:options:error:].cold.6();
            }
          }
          uint64_t errorDetailCode = 4;
        }
      }
      else
      {
        uint64_t errorDetailCode = v17->_errorDetailCode;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if (VRTraceIsOSFaultDisabled())
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[AVCMediaStreamNegotiator initWithOffer:options:error:].cold.7();
            }
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
          {
            -[AVCMediaStreamNegotiator initWithOffer:options:error:].cold.8();
          }
        }
      }
    }
    else
    {
      uint64_t errorDetailCode = v17->_errorDetailCode;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCMediaStreamNegotiator initWithOffer:options:error:]1();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[AVCMediaStreamNegotiator initWithOffer:options:error:]2();
        }
      }
    }
    if (a5 && !*a5) {
      +[GKVoiceChatError getNSError:a5 code:32033 detailedCode:errorDetailCode filePath:0 description:0 reason:*(void *)buf];
    }

    return 0;
  }
  return v17;
}

- (BOOL)createAnswer
{
  if (!self->_remoteCallInfoBlob)
  {
    uint64_t v4 = 0;
    self->_answer = self->_mediaBlobNegotiated;
    BOOL v6 = 1;
    goto LABEL_6;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMediaStreamNegotiator createAnswer]();
      }
    }
    uint64_t v4 = 0;
    goto LABEL_14;
  }
  uint64_t v4 = v3;
  [v3 setObject:self->_mediaBlobNegotiated forKeyedSubscript:@"avcMediaStreamNegotiatorMediaBlob"];
  if (![(AVCMediaStreamNegotiator *)self addLocalCallInfoBlobToOutgoingDictionary:v4])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMediaStreamNegotiator createAnswer]();
      }
    }
LABEL_14:
    BOOL v6 = 0;
    goto LABEL_6;
  }
  id v5 = (NSData *)(id)[MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:0];
  self->_answer = v5;
  BOOL v6 = v5 != 0;
LABEL_6:

  return v6;
}

- (BOOL)processAnswerWithError:(id *)a3 errorReason:(id *)a4
{
  BOOL v6 = (void *)[MEMORY[0x1E4F28F98] propertyListWithData:self->_answer options:0 format:0 error:a3];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = (NSData *)(id)[v6 objectForKeyedSubscript:@"avcMediaStreamNegotiatorMediaBlob"];
    self->_mediaBlobNegotiated = v8;
    if (!v8)
    {
      self->_uint64_t errorDetailCode = 4;
      *a4 = @"Failed to extract negotiated media blob on offerer";
      return (char)v8;
    }
    if ([v7 objectForKey:@"avcMediaStreamOptionRemoteEndpointInfo"]) {
      self->_remoteCallInfoBlob = (NSData *)(id)[v7 objectForKeyedSubscript:@"avcMediaStreamOptionRemoteEndpointInfo"];
    }
  }
  else
  {
    self->_mediaBlobNegotiated = self->_answer;
  }
  LOBYTE(v8) = 1;
  return (char)v8;
}

- (BOOL)setAnswer:(id)a3 withError:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *a4;
      *(_DWORD *)uint64_t v12 = 136316162;
      *(void *)&v12[4] = v7;
      __int16 v13 = 2080;
      uint64_t v14 = "-[AVCMediaStreamNegotiator setAnswer:withError:]";
      __int16 v15 = 1024;
      int v16 = 483;
      __int16 v17 = 2112;
      id v18 = a3;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d answer=%@, error=%@", v12, 0x30u);
    }
  }
  *(void *)uint64_t v12 = 0;
  if (self->_deviceRole == 2)
  {
    *(void *)uint64_t v12 = @"Can't set answer blob on answerer";
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCMediaStreamNegotiator setAnswer:withError:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[AVCMediaStreamNegotiator setAnswer:withError:]();
      }
    }
    int64_t errorDetailCode = 1;
  }
  else if (a3)
  {

    self->_answer = (NSData *)a3;
    if ([(AVCMediaStreamNegotiator *)self processAnswerWithError:a4 errorReason:v12])
    {
      return 1;
    }
    int64_t errorDetailCode = self->_errorDetailCode;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCMediaStreamNegotiator setAnswer:withError:].cold.5();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[AVCMediaStreamNegotiator setAnswer:withError:].cold.6();
      }
    }
  }
  else
  {
    *(void *)uint64_t v12 = @"Empty answer blob cannot be set on offerer";
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCMediaStreamNegotiator setAnswer:withError:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[AVCMediaStreamNegotiator setAnswer:withError:].cold.4();
      }
    }
    int64_t errorDetailCode = 6;
  }
  if (a4)
  {
    if (!*a4) {
      +[GKVoiceChatError getNSError:a4 code:32034 detailedCode:errorDetailCode filePath:0 description:0 reason:*(void *)v12];
    }
  }
  return 0;
}

- (BOOL)setupAudioStreamConfiguration:(id)a3 errorReason:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  int64_t v6 = +[AVCAudioStreamConfig clientCodecTypeWithCodecType:](AVCAudioStreamConfig, "clientCodecTypeWithCodecType:", +[VCPayloadUtils codecTypeForPayload:[(VCMediaNegotiatorResultsAudio *)[(VCMediaNegotiatorBase *)self->_mediaNegotiator negotiatedAudioSettings] primaryPayload]]);
  objc_msgSend(a3, "setRemoteSSRC:", -[VCMediaNegotiatorResultsAudio remoteSSRC](-[VCMediaNegotiatorBase negotiatedAudioSettings](self->_mediaNegotiator, "negotiatedAudioSettings"), "remoteSSRC"));
  objc_msgSend(a3, "setTxPayloadType:", -[VCMediaNegotiatorResultsAudio primaryPayload](-[VCMediaNegotiatorBase negotiatedAudioSettings](self->_mediaNegotiator, "negotiatedAudioSettings"), "primaryPayload"));
  objc_msgSend(a3, "setRxPayloadType:", objc_msgSend(a3, "txPayloadType"));
  objc_msgSend((id)objc_msgSend(a3, "audio"), "setCodecType:", v6);
  objc_msgSend((id)objc_msgSend(a3, "audio"), "setAudioStreamMode:", -[AVCMediaStreamNegotiatorSettings audioStreamMode](self->_negotiatorSettings, "audioStreamMode"));
  objc_msgSend((id)objc_msgSend(a3, "audio"), "setChannelCount:", -[AVCMediaStreamNegotiatorSettings audioChannelCount](self->_negotiatorSettings, "audioChannelCount"));
  objc_msgSend((id)objc_msgSend(a3, "audio"), "setPtime:", -[AVCMediaStreamNegotiatorSettings ptime](self->_negotiatorSettings, "ptime"));
  objc_msgSend((id)objc_msgSend(a3, "audio"), "setPreferredMediaBitRate:", -[AVCMediaStreamNegotiatorSettings preferredMediaBitRate](self->_negotiatorSettings, "preferredMediaBitRate"));
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "audio"), "remoteDeviceInfo");
  if (self->_remoteCallInfoBlob)
  {
    v8 = [[VCCallInfoBlob alloc] initWithData:self->_remoteCallInfoBlob];
    if ([(VCCallInfoBlob *)v8 audioDeviceUID])
    {
      objc_msgSend(v7, "setDeviceUID:", -[VCCallInfoBlob audioDeviceUID](v8, "audioDeviceUID"));
      objc_msgSend(v7, "setDeviceName:", -[VCCallInfoBlob deviceName](v8, "deviceName"));
      objc_msgSend(v7, "setModelUID:", -[VCCallInfoBlob deviceType](v8, "deviceType"));
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t mediaStreamMode = self->_mediaStreamMode;
      *(_DWORD *)buf = 136318466;
      uint64_t v14 = v9;
      __int16 v15 = 2080;
      int v16 = "-[AVCMediaStreamNegotiator setupAudioStreamConfiguration:errorReason:]";
      __int16 v17 = 1024;
      int v18 = 541;
      __int16 v19 = 1024;
      int v20 = mediaStreamMode;
      __int16 v21 = 1024;
      int v22 = objc_msgSend((id)objc_msgSend(a3, "audio"), "audioStreamMode");
      __int16 v23 = 1024;
      int v24 = objc_msgSend((id)objc_msgSend(a3, "audio"), "codecType");
      __int16 v25 = 1024;
      int v26 = objc_msgSend((id)objc_msgSend(a3, "audio"), "ptime");
      __int16 v27 = 1024;
      int v28 = [a3 txPayloadType];
      __int16 v29 = 1024;
      int v30 = [a3 rxPayloadType];
      __int16 v31 = 1024;
      int v32 = [a3 jitterBufferMode];
      __int16 v33 = 1024;
      int v34 = objc_msgSend((id)objc_msgSend(a3, "audio"), "channelCount");
      __int16 v35 = 2112;
      uint64_t v36 = [v7 deviceUID];
      __int16 v37 = 2112;
      uint64_t v38 = [v7 deviceName];
      __int16 v39 = 2112;
      uint64_t v40 = [v7 modelUID];
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Negotiated values: mediaStreamMode=%u, audioStreamMode=%u, codecType=%u, pTime=%u, txPayloadType=%u, rxPayloadType=%u, jitterBufferMode=%u, channelCount=%u, deviceUID=%@, deviceName=%@, modelUID=%@", buf, 0x6Au);
    }
  }
  return 1;
}

- (BOOL)setupVideoStreamConfiguration:(id)a3 errorReason:(id *)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(VCMediaNegotiatorBase *)self->_mediaNegotiator localSettings];
  uint64_t v8 = [(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings connectionType];
  unsigned int v9 = objc_msgSend(-[NSSet anyObject](-[NSSet filteredSetUsingPredicate:](-[VCMediaNegotiatorLocalConfiguration bandwidthConfigurations](v7, "bandwidthConfigurations"), "filteredSetUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"connectionType = %d AND mode = %d", v8, VCBitrateArbiter_ModeFromOperatingMode(-[AVCMediaStreamNegotiatorSettings operatingMode](self->_negotiatorSettings, "operatingMode")))), "anyObject"), "maxBandwidth");
  unsigned int v10 = [(VCMediaNegotiator *)self->_mediaNegotiator remoteMaxBandwidthForArbiterMode:VCBitrateArbiter_ModeFromOperatingMode([(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings operatingMode]) connectionType:v8];
  if (v9 >= v10) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  int64_t v12 = [(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings captureSource];
  mediaNegotiator = self->_mediaNegotiator;
  if (v12 == 1) {
    uint64_t v14 = [(VCMediaNegotiatorBase *)mediaNegotiator negotiatedScreenSettings];
  }
  else {
    uint64_t v14 = [(VCMediaNegotiatorBase *)mediaNegotiator negotiatedVideoSettings];
  }
  __int16 v15 = v14;
  if (v14)
  {
    if ([(VCMediaNegotiatorResultsVideo *)v14 videoRuleCollections]
      && [(VCVideoRuleCollections *)[(VCMediaNegotiatorResultsVideo *)v15 videoRuleCollections] supportedPayloads])
    {
      uint64_t v40 = a4;
      uint64_t v41 = self;
      long long v79 = 0u;
      long long v80 = 0u;
      if ([a3 direction] == 1) {
        unsigned __int8 v16 = 1;
      }
      else {
        unsigned __int8 v16 = 2;
      }
      long long v81 = 0uLL;
      long long v82 = 0uLL;
      __int16 v17 = [(VCVideoRuleCollections *)[(VCMediaNegotiatorResultsVideo *)v15 videoRuleCollections] supportedPayloads];
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v79 objects:v78 count:16];
      if (!v18) {
        goto LABEL_23;
      }
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v80;
LABEL_15:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v80 != v20) {
          objc_enumerationMutation(v17);
        }
        int v22 = *(void **)(*((void *)&v79 + 1) + 8 * v21);
        if (-[NSMutableArray containsObject:](-[VCVideoRuleCollections supportedPayloads](-[VCMediaNegotiatorResultsVideo videoRuleCollections](v15, "videoRuleCollections"), "supportedPayloads"), "containsObject:", &unk_1F3DC5CA0)&& -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](-[VCMediaNegotiatorResultsVideo videoRuleCollections](v15, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", 1, [&unk_1F3DC5CA0 unsignedIntValue], v16))
        {
          int v22 = &unk_1F3DC5CA0;
          goto LABEL_30;
        }
        if (-[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](-[VCMediaNegotiatorResultsVideo videoRuleCollections](v15, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", 1, [v22 unsignedIntValue], v16))
        {
          break;
        }
        if (v19 == ++v21)
        {
          uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v79 objects:v78 count:16];
          if (v19) {
            goto LABEL_15;
          }
LABEL_23:
          v41->_int64_t errorDetailCode = 5;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
          {
            VRTraceErrorLogLevelToCSTR();
            a4 = v40;
            if (VRTraceIsOSFaultDisabled())
            {
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:].cold.5();
              }
            }
            else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
            {
              -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:].cold.6();
            }
            BOOL v35 = 0;
            uint64_t v38 = @"No valid payload found in the negotiated settings";
            goto LABEL_61;
          }
          BOOL v35 = 0;
          uint64_t v38 = @"No valid payload found in the negotiated settings";
LABEL_60:
          a4 = v40;
          goto LABEL_61;
        }
      }
      if (!v22) {
        goto LABEL_23;
      }
LABEL_30:
      __int16 v23 = objc_msgSend(-[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](-[VCMediaNegotiatorResultsVideo videoRuleCollections](v15, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", 1, objc_msgSend(v22, "intValue"), v16), "objectAtIndex:", 0);
      if (v23)
      {
        int v24 = v23;
        uint64_t v25 = [v23 iPayload];
        int64_t v26 = +[AVCMediaStreamNegotiator clientCodecTypeWithCodecType:](AVCMediaStreamNegotiator, "clientCodecTypeWithCodecType:", +[VCPayloadUtils codecTypeForPayload:v25]);
        objc_msgSend(a3, "setRemoteSSRC:", -[VCMediaNegotiatorResultsVideo remoteSSRC](v15, "remoteSSRC"));
        [a3 setTxPayloadType:v25];
        objc_msgSend(a3, "setRxPayloadType:", objc_msgSend(a3, "txPayloadType"));
        if ([(NSSet *)[(VCMediaNegotiatorResultsVideo *)v15 hdrModesNegotiated] count]) {
          [(AVCMediaStreamNegotiator *)v41 pickBestHDRMode:[(VCMediaNegotiatorResultsVideo *)v15 hdrModesNegotiated]];
        }
        if ([a3 direction] == 1 || objc_msgSend(a3, "direction") == 3)
        {
          uint64_t v27 = [(AVCMediaStreamNegotiator *)v41 pickBestPixelFormatFromSet:[(VCMediaNegotiatorResultsVideo *)v15 pixelFormats]];
          if (!v27)
          {
            v41->_int64_t errorDetailCode = 5;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
            {
              VRTraceErrorLogLevelToCSTR();
              if (VRTraceIsOSFaultDisabled())
              {
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:].cold.9();
                }
              }
              else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
              {
                -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:]0();
              }
            }
            BOOL v35 = 0;
            uint64_t v38 = @"No valid pixel format found in the negotiated screen settings";
            goto LABEL_60;
          }
          objc_msgSend((id)objc_msgSend(a3, "video"), "setPixelFormat:", v27);
        }
        if (v41->_mediaStreamTransportType == 2 && v41->_videoHDRMode == 3)
        {
          unint64_t v28 = 80000000;
        }
        else if ([(VCMediaNegotiatorResultsVideo *)v15 foveationIsSupported])
        {
          unint64_t v28 = 60000000;
        }
        else
        {
          unint64_t v28 = v11;
        }
        if (!v41->_mediaStreamTransportProtocolType) {
          v41->_mediaStreamTransportProtocolType = 1;
        }
        objc_msgSend((id)objc_msgSend(a3, "video"), "setHdrMode:", v41->_videoHDRMode);
        __int16 v29 = [(VCMediaNegotiatorResultsVideo *)v15 featureStrings];
        objc_msgSend((id)objc_msgSend(a3, "video"), "setTxCodecFeatureListString:", -[NSDictionary objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v25)));
        int v30 = [(VCMediaNegotiatorResultsVideo *)v15 featureStrings];
        objc_msgSend((id)objc_msgSend(a3, "video"), "setRxCodecFeatureListString:", -[NSDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v25)));
        objc_msgSend((id)objc_msgSend(a3, "video"), "setVideoStreamMode:", -[AVCMediaStreamNegotiatorSettings videoStreamMode](v41->_negotiatorSettings, "videoStreamMode"));
        [v24 fRate];
        objc_msgSend((id)objc_msgSend(a3, "video"), "setFramerate:", (unint64_t)v31);
        if ([(VCMediaNegotiatorResultsVideo *)v15 customVideoWidth]) {
          unsigned int v32 = [(VCMediaNegotiatorResultsVideo *)v15 customVideoWidth];
        }
        else {
          unsigned int v32 = [v24 iWidth];
        }
        objc_msgSend((id)objc_msgSend(a3, "video"), "setCustomWidth:", v32);
        if ([(VCMediaNegotiatorResultsVideo *)v15 customVideoHeight]) {
          unsigned int v33 = [(VCMediaNegotiatorResultsVideo *)v15 customVideoHeight];
        }
        else {
          unsigned int v33 = [v24 iHeight];
        }
        objc_msgSend((id)objc_msgSend(a3, "video"), "setCustomHeight:", v33);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setTilesPerFrame:", -[VCMediaNegotiatorResultsVideo tilesPerFrame](v15, "tilesPerFrame"));
        objc_msgSend((id)objc_msgSend(a3, "video"), "setLtrpEnabled:", -[VCMediaNegotiatorResultsVideo ltrpEnabled](v15, "ltrpEnabled"));
        objc_msgSend((id)objc_msgSend(a3, "video"), "setFecEnabled:", -[VCMediaNegotiatorResultsVideo fecEnabled](v15, "fecEnabled"));
        objc_msgSend((id)objc_msgSend(a3, "video"), "setRtxEnabled:", -[VCMediaNegotiatorResultsVideo rtxEnabled](v15, "rtxEnabled"));
        objc_msgSend((id)objc_msgSend(a3, "video"), "setTxCodecType:", v26);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setRxCodecType:", v26);
        uint64_t v34 = v28;
        if ([(AVCMediaStreamNegotiatorSettings *)v41->_negotiatorSettings maxBandwidth] < v28) {
          uint64_t v34 = [(AVCMediaStreamNegotiatorSettings *)v41->_negotiatorSettings maxBandwidth];
        }
        objc_msgSend((id)objc_msgSend(a3, "video"), "setTxMaxBitrate:", v34);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setTxMinBitrate:", -[AVCMediaStreamNegotiatorSettings minBandwidth](v41->_negotiatorSettings, "minBandwidth"));
        if ([(AVCMediaStreamNegotiatorSettings *)v41->_negotiatorSettings maxBandwidth] < v28) {
          unint64_t v28 = [(AVCMediaStreamNegotiatorSettings *)v41->_negotiatorSettings maxBandwidth];
        }
        objc_msgSend((id)objc_msgSend(a3, "video"), "setRxMaxBitrate:", v28);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setRxMinBitrate:", -[AVCMediaStreamNegotiatorSettings minBandwidth](v41->_negotiatorSettings, "minBandwidth"));
        BOOL v35 = 1;
        [a3 setRateAdaptationEnabled:1];
        objc_msgSend((id)objc_msgSend(a3, "video"), "setEnableCVO:", 0);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setCvoExtensionID:", 0);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setCaptureSource:", -[AVCMediaStreamNegotiatorSettings captureSource](v41->_negotiatorSettings, "captureSource"));
        objc_msgSend((id)objc_msgSend(a3, "video"), "setKeyFrameInterval:", 0);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setIsVideoProtected:", 0);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setVideoResolution:", 12);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setRemoteVideoInitialOrientation:", 3);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setTransportProtocolType:", v41->_mediaStreamTransportProtocolType);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setShouldSendBlackFramesOnClearScreen:", -[VCMediaNegotiatorResultsVideo blackFrameOnClearScreenEnabled](v15, "blackFrameOnClearScreenEnabled"));
        objc_msgSend((id)objc_msgSend(a3, "video"), "setFoveationEnabled:", -[VCMediaNegotiatorResultsVideo foveationIsSupported](v15, "foveationIsSupported"));
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7
          && (uint64_t v36 = VRTraceErrorLogLevelToCSTR(),
              __int16 v37 = *MEMORY[0x1E4F47A50],
              os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
        {
          *(_DWORD *)buf = 136319490;
          uint64_t v43 = v36;
          __int16 v44 = 2080;
          v45 = "-[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:]";
          __int16 v46 = 1024;
          int v47 = 646;
          __int16 v48 = 2048;
          uint64_t v49 = objc_msgSend((id)objc_msgSend(a3, "video"), "tilesPerFrame");
          __int16 v50 = 1024;
          int v51 = objc_msgSend((id)objc_msgSend(a3, "video"), "isLTRPEnabled");
          __int16 v52 = 1024;
          int v53 = objc_msgSend((id)objc_msgSend(a3, "video"), "isFECEnabled");
          __int16 v54 = 1024;
          int v55 = objc_msgSend((id)objc_msgSend(a3, "video"), "isRTXEnabled");
          __int16 v56 = 1024;
          int v57 = objc_msgSend((id)objc_msgSend(a3, "video"), "shouldSendBlackFramesOnClearScreen");
          __int16 v58 = 1024;
          int v59 = objc_msgSend((id)objc_msgSend(a3, "video"), "transportProtocolType");
          __int16 v60 = 1024;
          int v61 = [a3 accessNetworkType];
          __int16 v62 = 2048;
          uint64_t v63 = objc_msgSend((id)objc_msgSend(a3, "video"), "customWidth");
          __int16 v64 = 2048;
          uint64_t v65 = objc_msgSend((id)objc_msgSend(a3, "video"), "customHeight");
          __int16 v66 = 2048;
          uint64_t v67 = [a3 txPayloadType];
          __int16 v68 = 2048;
          uint64_t v69 = objc_msgSend((id)objc_msgSend(a3, "video"), "hdrMode");
          __int16 v70 = 2048;
          uint64_t v71 = objc_msgSend((id)objc_msgSend(a3, "video"), "framerate");
          __int16 v72 = 2048;
          uint64_t v73 = objc_msgSend((id)objc_msgSend(a3, "video"), "txMaxBitrate");
          __int16 v74 = 2080;
          uint64_t v75 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "video"), "txCodecFeatureListString"), "UTF8String");
          __int16 v76 = 1024;
          int v77 = objc_msgSend((id)objc_msgSend(a3, "video"), "isFoveationEnabled");
          _os_log_impl(&dword_1E1EA4000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Negotiated values: tilesPerFrame=%lu, ltrpEnabled=%i, fecEnabled=%i, rtxEnabled=%i, shouldSendBlackFramesOnClearScreen=%i,  transportProtocolType=%u, accessNetworkType=%u, videoWidth=%lu, videoHeight=%lu, payloadType=%lu, videoHDRMode = %lu, frameRate=%lu, maxTxBitRate=%lu, FLS=%s, foveation=%d", buf, 0x96u);
          uint64_t v38 = 0;
          BOOL v35 = 1;
        }
        else
        {
          uint64_t v38 = 0;
        }
        goto LABEL_60;
      }
      v41->_int64_t errorDetailCode = 5;
      a4 = v40;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:].cold.7();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:].cold.8();
        }
      }
      BOOL v35 = 0;
      uint64_t v38 = @"No valid video rules found found in the negotiated screen settings";
    }
    else
    {
      self->_int64_t errorDetailCode = 5;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:]();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:].cold.4();
        }
      }
      BOOL v35 = 0;
      uint64_t v38 = @"RuleCollection not correct in negotiated settings";
    }
  }
  else
  {
    self->_int64_t errorDetailCode = 5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:]();
      }
    }
    BOOL v35 = 0;
    uint64_t v38 = @"Settings not found in negotiated settings";
  }
LABEL_61:
  if (a4) {
    *a4 = v38;
  }
  return v35;
}

- (id)generateMediaStreamConfigurationWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *a3;
      *(_DWORD *)__int16 v13 = 136315906;
      *(void *)&v13[4] = v5;
      __int16 v14 = 2080;
      __int16 v15 = "-[AVCMediaStreamNegotiator generateMediaStreamConfigurationWithError:]";
      __int16 v16 = 1024;
      int v17 = 656;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d error=%@", v13, 0x26u);
    }
  }
  *(void *)__int16 v13 = 0;
  uint64_t v8 = objc_alloc_init(AVCMediaStreamConfig);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        -[AVCMediaStreamNegotiator generateMediaStreamConfigurationWithError:]();
        if (a3) {
          goto LABEL_38;
        }
        return 0;
      }
    }
LABEL_37:
    if (a3) {
      goto LABEL_38;
    }
    return 0;
  }
  unsigned int v9 = v8;
  mediaNegotiator = self->_mediaNegotiator;
  if (self->_deviceRole == 1)
  {
    if (![(VCMediaNegotiator *)mediaNegotiator processResponseBlob:self->_mediaBlobNegotiated])
    {
      *(void *)__int16 v13 = @"Failed to process the response blob on the offerer";
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            -[AVCMediaStreamNegotiator generateMediaStreamConfigurationWithError:].cold.4();
            if (!a3) {
              return 0;
            }
            goto LABEL_38;
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[AVCMediaStreamNegotiator generateMediaStreamConfigurationWithError:].cold.5();
          if (!a3) {
            return 0;
          }
          goto LABEL_38;
        }
      }
      goto LABEL_37;
    }
    self->_mediaStreamAccessNetworkType = [(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings accessNetworkType];
  }
  else if ([(VCMediaNegotiatorResults *)[(VCMediaNegotiatorBase *)mediaNegotiator negotiatedSettings] accessNetworkType])
  {
    int64_t v11 = +[AVCMediaStreamNegotiator clientAccessNetworkType:[(VCMediaNegotiatorResults *)[(VCMediaNegotiatorBase *)self->_mediaNegotiator negotiatedSettings] accessNetworkType]];
    self->_mediaStreamAccessNetworkType = v11;
    [(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings setAccessNetworkType:v11];
  }
  [(AVCMediaStreamConfig *)v9 setDirection:[(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings mediaStreamDirection]];
  [(AVCMediaStreamConfig *)v9 setLocalSSRC:[(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings localSSRC]];
  [(AVCMediaStreamConfig *)v9 setAccessNetworkType:self->_mediaStreamAccessNetworkType];
  [(AVCMediaStreamConfig *)v9 setRtpTimeOutEnabled:0];
  [(AVCMediaStreamConfig *)v9 setRtpTimeOutInterval:0.0];
  [(AVCMediaStreamConfig *)v9 setRtcpEnabled:1];
  [(AVCMediaStreamConfig *)v9 setRtcpTimeOutEnabled:[(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings rtcpTimeOutEnabled]];
  [(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings rtcpTimeOutInterval];
  -[AVCMediaStreamConfig setRtcpTimeOutInterval:](v9, "setRtcpTimeOutInterval:");
  [(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings rtcpSendInterval];
  -[AVCMediaStreamConfig setRtcpSendInterval:](v9, "setRtcpSendInterval:");
  if (([(AVCMediaStreamConfig *)v9 direction] == 2
     || [(AVCMediaStreamConfig *)v9 direction] == 3)
    && [(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings shouldSetJitterBufferMode])
  {
    [(AVCMediaStreamConfig *)v9 setJitterBufferMode:[(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings jitterBufferMode]];
  }
  if ([(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings audioConfiguration])
  {
    if (![(AVCMediaStreamNegotiator *)self setupAudioStreamConfiguration:v9 errorReason:v13])
    {
LABEL_23:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            -[AVCMediaStreamNegotiator generateMediaStreamConfigurationWithError:]();
            if (!a3) {
              return 0;
            }
LABEL_38:
            if (!*a3) {
              +[GKVoiceChatError getNSError:a3 code:32035 detailedCode:self->_errorDetailCode filePath:0 description:0 reason:*(void *)v13];
            }
            return 0;
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[AVCMediaStreamNegotiator generateMediaStreamConfigurationWithError:]();
          if (!a3) {
            return 0;
          }
          goto LABEL_38;
        }
      }
      goto LABEL_37;
    }
  }
  else if (![(AVCMediaStreamNegotiator *)self setupVideoStreamConfiguration:v9 errorReason:v13])
  {
    goto LABEL_23;
  }
  return v9;
}

- (BOOL)addLocalCallInfoBlobToOutgoingDictionary:(id)a3
{
  v28[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_alloc_init(VCCallInfoBlob);
  int64_t v6 = v5;
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMediaStreamNegotiator addLocalCallInfoBlobToOutgoingDictionary:]();
      }
    }
    goto LABEL_22;
  }
  [(VCCallInfoBlob *)v5 setCallID:0];
  [(VCCallInfoBlob *)v6 setClientVersion:+[VCCallInfo getVCCurrentVersion]];
  memset(v28, 170, 20);
  VCGetDeviceModelString((char *)v28, 0x14uLL);
  uint64_t v7 = [[NSString alloc] initWithCString:v28 encoding:1];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMediaStreamNegotiator addLocalCallInfoBlobToOutgoingDictionary:]();
      }
    }
LABEL_22:
    int64_t v12 = 0;
    unsigned int v10 = 0;
    uint64_t v8 = 0;
LABEL_31:
    BOOL v17 = 0;
    goto LABEL_15;
  }
  uint64_t v8 = (void *)v7;
  [(VCCallInfoBlob *)v6 setDeviceType:v7];
  memset(v27, 170, 20);
  VCGetSystemBuildVersionString((char *)v27, 20);
  uint64_t v9 = [[NSString alloc] initWithCString:v27 encoding:1];
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMediaStreamNegotiator addLocalCallInfoBlobToOutgoingDictionary:]();
      }
    }
    int64_t v12 = 0;
    unsigned int v10 = 0;
    goto LABEL_31;
  }
  unsigned int v10 = (void *)v9;
  [(VCCallInfoBlob *)v6 setOsVersion:v9];
  uint64_t v11 = [[NSString alloc] initWithCString:"2090.17.2" encoding:1];
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCMediaStreamNegotiator addLocalCallInfoBlobToOutgoingDictionary:].cold.4();
      }
    }
    int64_t v12 = 0;
    goto LABEL_31;
  }
  int64_t v12 = (void *)v11;
  [(VCCallInfoBlob *)v6 setFrameworkVersion:v11];
  if ([(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings audioDeviceUID])
  {
    [(VCCallInfoBlob *)v6 setAudioDeviceUID:[(AVCMediaStreamNegotiatorSettings *)self->_negotiatorSettings audioDeviceUID]];
    __int16 v13 = VCCopyDeviceName();
    [(VCCallInfoBlob *)v6 setDeviceName:v13];
    if (v13) {
      CFRelease(v13);
    }
  }
  objc_msgSend(a3, "setObject:forKeyedSubscript:", -[VCCallInfoBlob data](v6, "data"), @"avcMediaStreamOptionRemoteEndpointInfo");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    __int16 v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend((id)-[VCCallInfoBlob formattedText](v6, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", @"\n", @", "))
      {
        __int16 v16 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[VCCallInfoBlob formattedText](v6, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", @"\n", @", "), "description"), "UTF8String");
      }
      else
      {
        __int16 v16 = "<nil>";
      }
      int v19 = 136315906;
      uint64_t v20 = v14;
      __int16 v21 = 2080;
      int v22 = "-[AVCMediaStreamNegotiator addLocalCallInfoBlobToOutgoingDictionary:]";
      __int16 v23 = 1024;
      int v24 = 754;
      __int16 v25 = 2080;
      int64_t v26 = v16;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Local callInfoBlob = %s", (uint8_t *)&v19, 0x26u);
    }
  }
  BOOL v17 = 1;
LABEL_15:

  return v17;
}

- (id)generateMediaStreamInitOptionsWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *a3;
      int v12 = 136315906;
      uint64_t v13 = v5;
      __int16 v14 = 2080;
      __int16 v15 = "-[AVCMediaStreamNegotiator generateMediaStreamInitOptionsWithError:]";
      __int16 v16 = 1024;
      int v17 = 766;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d error=%@", (uint8_t *)&v12, 0x26u);
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 setObject:self->_dataSessionID forKey:@"avcMediaStreamOptionCallID"];
    remoteCallInfoBlob = self->_remoteCallInfoBlob;
    if (remoteCallInfoBlob) {
      [v9 setObject:remoteCallInfoBlob forKey:@"avcMediaStreamOptionRemoteEndpointInfo"];
    }
    return v9;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 2) {
    goto LABEL_14;
  }
  VRTraceErrorLogLevelToCSTR();
  if (VRTraceIsOSFaultDisabled())
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      -[AVCMediaStreamNegotiator generateMediaStreamInitOptionsWithError:]();
      if (!a3) {
        return v9;
      }
      goto LABEL_15;
    }
LABEL_14:
    if (!a3) {
      return v9;
    }
    goto LABEL_15;
  }
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT)) {
    goto LABEL_14;
  }
  -[AVCMediaStreamNegotiator generateMediaStreamInitOptionsWithError:]();
  if (!a3) {
    return v9;
  }
LABEL_15:
  if (!*a3) {
    +[GKVoiceChatError getNSError:a3 code:32036 detailedCode:5 filePath:0 description:0 reason:@"failed to create mediastream init options dictionary"];
  }
  return v9;
}

- (unsigned)pickBestPixelFormatFromSet:(id)a3
{
  uint64_t v3 = 1;
  uint64_t v4 = &AVCPixelFormatPreferenceListCoreDeviceSDR;
  uint64_t v5 = 1;
  switch(self->_mediaStreamMode)
  {
    case 1:
    case 7:
    case 9:
      unint64_t videoHDRMode = self->_videoHDRMode;
      id v7 = &AVCPixelFormatPreferenceListDefault;
      if (videoHDRMode == 3)
      {
        id v7 = &AVCPixelFormatPreferenceListIPadCompanionHDR;
        unsigned int v8 = 3;
      }
      else
      {
        unsigned int v8 = 1;
      }
      if (videoHDRMode) {
        uint64_t v4 = v7;
      }
      else {
        uint64_t v4 = &AVCPixelFormatPreferenceListIPadCompanion;
      }
      if (videoHDRMode) {
        uint64_t v3 = v8;
      }
      else {
        uint64_t v3 = 2;
      }
      uint64_t v5 = 1;
      break;
    case 2:
      uint64_t v5 = 0;
      unint64_t v10 = self->_videoHDRMode;
      if (v10) {
        uint64_t v4 = &AVCPixelFormatPreferenceListAirPlayMirroringHDR;
      }
      else {
        uint64_t v4 = &AVCPixelFormatPreferenceListAirPlayMirroringNoHDR;
      }
      if (v10) {
        uint64_t v3 = 2;
      }
      else {
        uint64_t v3 = 1;
      }
      break;
    case 3:
      if (self->_videoHDRMode) {
        uint64_t v4 = &AVCPixelFormatPreferenceListRemoteCameraHDR;
      }
      else {
        uint64_t v4 = &AVCPixelFormatPreferenceListRemoteCameraSDR;
      }
      break;
    case 5:
      return [(AVCMediaStreamNegotiator *)self pickBestPixelFormatFromSet:a3 preferenceList:v4 count:v3 acceptDefault:v5];
    default:
      uint64_t v3 = 1;
      uint64_t v4 = &AVCPixelFormatPreferenceListDefault;
      uint64_t v5 = 1;
      break;
  }
  return [(AVCMediaStreamNegotiator *)self pickBestPixelFormatFromSet:a3 preferenceList:v4 count:v3 acceptDefault:v5];
}

- (unsigned)pickBestPixelFormatFromSet:(id)a3 preferenceList:(unsigned int *)a4 count:(int)a5 acceptDefault:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v9 = a5 - 1;
  if (a5 < 1)
  {
LABEL_5:
    unsigned int v14 = 0;
LABEL_7:
    if (v6) {
      unsigned int v14 = a4[v9];
    }
    goto LABEL_9;
  }
  uint64_t v11 = a5;
  int v12 = a4;
  while (1)
  {
    uint64_t v13 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*v12];
    if ([a3 containsObject:v13]) {
      break;
    }

    ++v12;
    if (!--v11) {
      goto LABEL_5;
    }
  }
  unsigned int v14 = *v12;

  if (!v14) {
    goto LABEL_7;
  }
LABEL_9:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    __int16 v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = FourccToCStr(v14);
      int64_t mediaStreamMode = self->_mediaStreamMode;
      unint64_t videoHDRMode = self->_videoHDRMode;
      int v21 = 136316418;
      uint64_t v22 = v15;
      __int16 v23 = 2080;
      int v24 = "-[AVCMediaStreamNegotiator pickBestPixelFormatFromSet:preferenceList:count:acceptDefault:]";
      __int16 v25 = 1024;
      int v26 = 848;
      __int16 v27 = 2080;
      unint64_t v28 = v17;
      __int16 v29 = 2048;
      int64_t v30 = mediaStreamMode;
      __int16 v31 = 2048;
      unint64_t v32 = videoHDRMode;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Negotiated pixelFormat=%s for mediaStreamMode=%lu in videoHDRMode=%lu", (uint8_t *)&v21, 0x3Au);
    }
  }
  return v14;
}

- (void)pickBestHDRMode:(id)a3
{
  int64_t mediaStreamMode = self->_mediaStreamMode;
  if (mediaStreamMode != 7)
  {
    if (mediaStreamMode == 3)
    {
      if ([a3 containsObject:&unk_1F3DC5CE8])
      {
        unint64_t v6 = 1;
        goto LABEL_8;
      }
      goto LABEL_10;
    }
    if (mediaStreamMode != 1) {
      return;
    }
  }
  if ([a3 containsObject:&unk_1F3DC5CB8])
  {
    unint64_t v6 = 3;
LABEL_8:
    self->_unint64_t videoHDRMode = v6;
    return;
  }
  if ([a3 containsObject:&unk_1F3DC5CD0])
  {
LABEL_10:
    self->_unint64_t videoHDRMode = 0;
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[AVCMediaStreamNegotiator pickBestHDRMode:]();
    }
  }
}

- (NSData)offer
{
  return self->_offer;
}

- (NSData)answer
{
  return self->_answer;
}

- (void)initNegotiatorLocalConfiguration:options:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate cameraConfiguration", v2, v3, v4, v5, v6);
}

- (void)initNegotiatorLocalConfiguration:options:.cold.2()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[AVCMediaStreamNegotiator initNegotiatorLocalConfiguration:options:]";
  __int16 v4 = 1024;
  int v5 = 189;
  __int16 v6 = 2112;
  uint64_t v7 = v0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to copy cameraConfiguration=%@", v2, 0x26u);
}

- (void)initWithMode:options:error:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)initWithMode:options:error:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)initWithMode:options:error:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)initWithMode:options:error:.cold.4()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)initWithMode:options:error:.cold.5()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)initWithMode:options:error:.cold.6()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)createOffer
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not generate callInfoBlob on offerer", v2, v3, v4, v5, v6);
}

- (void)initWithOffer:options:error:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)initWithOffer:options:error:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)initWithOffer:options:error:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)initWithOffer:options:error:.cold.4()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)initWithOffer:options:error:.cold.5()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)initWithOffer:options:error:.cold.6()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)initWithOffer:options:error:.cold.7()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)initWithOffer:options:error:.cold.8()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)initWithOffer:options:error:.cold.9()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)initWithOffer:options:error:.cold.10()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)initWithOffer:options:error:.cold.11()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)initWithOffer:options:error:.cold.12()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)createAnswer
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to add VCCallInfo dictionary on answerer", v2, v3, v4, v5, v6);
}

- (void)setAnswer:withError:.cold.1()
{
  OUTLINED_FUNCTION_37_0();
  [@"Can't set answer blob on answerer" UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
}

- (void)setAnswer:withError:.cold.2()
{
  OUTLINED_FUNCTION_37_0();
  [@"Can't set answer blob on answerer" UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
}

- (void)setAnswer:withError:.cold.3()
{
  OUTLINED_FUNCTION_37_0();
  [@"Empty answer blob cannot be set on offerer" UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
}

- (void)setAnswer:withError:.cold.4()
{
  OUTLINED_FUNCTION_37_0();
  [@"Empty answer blob cannot be set on offerer" UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
}

- (void)setAnswer:withError:.cold.5()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)setAnswer:withError:.cold.6()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.1()
{
  OUTLINED_FUNCTION_37_0();
  [@"Settings not found in negotiated settings" UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.2()
{
  OUTLINED_FUNCTION_37_0();
  [@"Settings not found in negotiated settings" UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.3()
{
  OUTLINED_FUNCTION_37_0();
  [@"RuleCollection not correct in negotiated settings" UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.4()
{
  OUTLINED_FUNCTION_37_0();
  [@"RuleCollection not correct in negotiated settings" UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.5()
{
  OUTLINED_FUNCTION_37_0();
  [@"No valid payload found in the negotiated settings" UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.6()
{
  OUTLINED_FUNCTION_37_0();
  [@"No valid payload found in the negotiated settings" UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.7()
{
  OUTLINED_FUNCTION_37_0();
  [@"No valid video rules found found in the negotiated screen settings" UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.8()
{
  OUTLINED_FUNCTION_37_0();
  [@"No valid video rules found found in the negotiated screen settings" UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.9()
{
  OUTLINED_FUNCTION_37_0();
  [@"No valid pixel format found in the negotiated screen settings" UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.10()
{
  OUTLINED_FUNCTION_37_0();
  [@"No valid pixel format found in the negotiated screen settings" UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
}

- (void)generateMediaStreamConfigurationWithError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media stream config object", v2, v3, v4, v5, v6);
}

- (void)generateMediaStreamConfigurationWithError:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)generateMediaStreamConfigurationWithError:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_11(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
}

- (void)generateMediaStreamConfigurationWithError:.cold.4()
{
  OUTLINED_FUNCTION_37_0();
  [@"Failed to process the response blob on the offerer" UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
}

- (void)generateMediaStreamConfigurationWithError:.cold.5()
{
  OUTLINED_FUNCTION_37_0();
  [@"Failed to process the response blob on the offerer" UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
}

- (void)addLocalCallInfoBlobToOutgoingDictionary:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate callInfo blob object", v2, v3, v4, v5, v6);
}

- (void)addLocalCallInfoBlobToOutgoingDictionary:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create deviceType string for VCCallInfo blob", v2, v3, v4, v5, v6);
}

- (void)addLocalCallInfoBlobToOutgoingDictionary:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to osVersion string for VCCallInfo blob", v2, v3, v4, v5, v6);
}

- (void)addLocalCallInfoBlobToOutgoingDictionary:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to frameworkVersionString string for VCCallInfo blob", v2, v3, v4, v5, v6);
}

- (void)generateMediaStreamInitOptionsWithError:.cold.1()
{
  OUTLINED_FUNCTION_37_0();
  [@"failed to create mediastream init options dictionary" UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
}

- (void)generateMediaStreamInitOptionsWithError:.cold.2()
{
  OUTLINED_FUNCTION_37_0();
  [@"failed to create mediastream init options dictionary" UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
}

- (void)pickBestHDRMode:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Negotiation of hdr modes is incorrect", v2, v3, v4, v5, v6);
}

@end