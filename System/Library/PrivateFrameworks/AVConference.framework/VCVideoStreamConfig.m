@interface VCVideoStreamConfig
+ (BOOL)validateClientDictionary:(id)a3;
+ (id)profileLevelStringForId:(unsigned int)a3;
+ (unsigned)profileLevelIdForString:(id)a3;
- (BOOL)applyVideoStreamClientDictionary:(id)a3;
- (BOOL)deferredAssemblyEnabled;
- (BOOL)enableCVO;
- (BOOL)fecEnabled;
- (BOOL)fecGeneratorEnabled;
- (BOOL)forceZeroRegionOfInterestOrigin;
- (BOOL)foveationEnabled;
- (BOOL)isVariableSliceModeEnabled;
- (BOOL)isVideoProtected;
- (BOOL)looseAVSyncEnabled;
- (BOOL)ltrpEnabled;
- (BOOL)resetSendRTPTimestampOnStop;
- (BOOL)rtcpPSFB_FIREnabled;
- (BOOL)rtxEnabled;
- (BOOL)shouldEnableMLEnhance;
- (BOOL)shouldSendBlackFramesOnClearScreen;
- (BOOL)temporalScalingEnabled;
- (BOOL)useInBandFEC;
- (BOOL)useVideoJitterForVideoPlayout;
- (NSDictionary)rxCodecFeatureListStrings;
- (NSDictionary)txCodecFeatureListStrings;
- (NSOrderedSet)txBitrateTiers;
- (NSString)profileLevel;
- (NSString)remoteDeviceName;
- (VCMediaStreamSyncSource)syncSource;
- (VCVideoStreamConfig)init;
- (VCVideoStreamConfig)initWithClientDictionary:(id)a3;
- (double)mediaStallReportRepeatInterval;
- (double)mediaStallTimeout;
- (double)minPlaybackInterval;
- (double)minRenderingDelay;
- (int)encoderUsage;
- (int)encodingMode;
- (int)fecHeaderVersion;
- (int)hdrMode;
- (int)remoteVideoInitialOrientation;
- (int)transportProtocolType;
- (int64_t)captureSourceID;
- (int64_t)type;
- (int64_t)videoResolution;
- (unint64_t)customHeight;
- (unint64_t)customWidth;
- (unint64_t)cvoExtensionID;
- (unint64_t)framerate;
- (unint64_t)keyFrameInterval;
- (unint64_t)maxEncoderPixels;
- (unint64_t)rxMaxBitrate;
- (unint64_t)rxMinBitrate;
- (unint64_t)sourceFramerate;
- (unint64_t)tilesPerFrame;
- (unint64_t)txInitialBitrate;
- (unint64_t)txMaxBitrate;
- (unint64_t)txMinBitrate;
- (unsigned)audioIOSampleRate;
- (unsigned)parameterSets;
- (unsigned)pixelFormat;
- (unsigned)screenDisplayID;
- (unsigned)videoPriorityPointer;
- (void)addRxCodecFeatureListString:(id)a3 codecType:(int64_t)a4;
- (void)addTxBitrateTier:(id)a3;
- (void)addTxCodecFeatureListString:(id)a3 codecType:(int64_t)a4;
- (void)dealloc;
- (void)initializeParameterSets;
- (void)setAudioIOSampleRate:(unsigned int)a3;
- (void)setCaptureSourceID:(int64_t)a3;
- (void)setCustomHeight:(unint64_t)a3;
- (void)setCustomWidth:(unint64_t)a3;
- (void)setCvoExtensionID:(unint64_t)a3;
- (void)setDeferredAssemblyEnabled:(BOOL)a3;
- (void)setEnableCVO:(BOOL)a3;
- (void)setEncoderUsage:(int)a3;
- (void)setEncodingMode:(int)a3;
- (void)setFecEnabled:(BOOL)a3;
- (void)setFecGeneratorEnabled:(BOOL)a3;
- (void)setFecHeaderVersion:(int)a3;
- (void)setForceZeroRegionOfInterestOrigin:(BOOL)a3;
- (void)setFoveationEnabled:(BOOL)a3;
- (void)setFramerate:(unint64_t)a3;
- (void)setHdrMode:(int)a3;
- (void)setIsVariableSliceModeEnabled:(BOOL)a3;
- (void)setIsVideoProtected:(BOOL)a3;
- (void)setKeyFrameInterval:(unint64_t)a3;
- (void)setLooseAVSyncEnabled:(BOOL)a3;
- (void)setLtrpEnabled:(BOOL)a3;
- (void)setMaxEncoderPixels:(unint64_t)a3;
- (void)setMediaStallReportRepeatInterval:(double)a3;
- (void)setMediaStallTimeout:(double)a3;
- (void)setMinPlaybackInterval:(double)a3;
- (void)setMinRenderingDelay:(double)a3;
- (void)setParameterSets:(unsigned int)a3;
- (void)setPixelFormat:(unsigned int)a3;
- (void)setProfileLevel:(id)a3;
- (void)setRemoteDeviceName:(id)a3;
- (void)setRemoteVideoInitialOrientation:(int)a3;
- (void)setResetSendRTPTimestampOnStop:(BOOL)a3;
- (void)setRtcpPSFB_FIREnabled:(BOOL)a3;
- (void)setRtxEnabled:(BOOL)a3;
- (void)setRxMaxBitrate:(unint64_t)a3;
- (void)setRxMinBitrate:(unint64_t)a3;
- (void)setScreenDisplayID:(unsigned int)a3;
- (void)setShouldEnableMLEnhance:(BOOL)a3;
- (void)setShouldSendBlackFramesOnClearScreen:(BOOL)a3;
- (void)setSourceFramerate:(unint64_t)a3;
- (void)setSyncSource:(id)a3;
- (void)setTemporalScalingEnabled:(BOOL)a3;
- (void)setTilesPerFrame:(unint64_t)a3;
- (void)setTransportProtocolType:(int)a3;
- (void)setTxInitialBitrate:(unint64_t)a3;
- (void)setTxMaxBitrate:(unint64_t)a3;
- (void)setTxMinBitrate:(unint64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setUseInBandFEC:(BOOL)a3;
- (void)setUseVideoJitterForVideoPlayout:(BOOL)a3;
- (void)setVideoPriorityPointer:(unsigned __int8 *)a3;
- (void)setVideoResolution:(int64_t)a3;
@end

@implementation VCVideoStreamConfig

- (VCVideoStreamConfig)init
{
  return [(VCVideoStreamConfig *)self initWithClientDictionary:0];
}

- (VCVideoStreamConfig)initWithClientDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VCVideoStreamConfig;
  v4 = -[VCMediaStreamConfig initWithClientDictionary:](&v14, sel_initWithClientDictionary_);
  v5 = v4;
  if (v4)
  {
    v4->_tilesPerFrame = 1;
    v4->_txBitrateTiers = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v5->_rxCodecFeatureListStrings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5->_txCodecFeatureListStrings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5->_mediaStallTimeout = NAN;
    v5->_mediaStallReportRepeatInterval = NAN;
    if (!a3) {
      goto LABEL_15;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      v6 = objc_opt_class()
         ? (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String")
         : "<nil>";
      asprintf(&__str, "%s[%p] %s", v6, v5, (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String"));
      if (__str)
      {
        __lasts = 0;
        v7 = strtok_r(__str, "\n", &__lasts);
        v8 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v9 = VRTraceErrorLogLevelToCSTR();
            v10 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v16 = v9;
              __int16 v17 = 2080;
              v18 = "-[VCVideoStreamConfig initWithClientDictionary:]";
              __int16 v19 = 1024;
              int v20 = 184;
              __int16 v21 = 2080;
              v22 = "-[VCVideoStreamConfig initWithClientDictionary:]";
              __int16 v23 = 2080;
              v24 = v7;
              _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v7 = strtok_r(0, "\n", &__lasts);
        }
        while (v7);
        free(__str);
      }
    }
    if (![(VCVideoStreamConfig *)v5 applyVideoStreamClientDictionary:a3])
    {

      return 0;
    }
    else
    {
LABEL_15:
      v5->_useVideoJitterForVideoPlayout = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:@"vc-video-jitter-buffer-for-video-playout" userDefaultKey:@"UseVideoJitterForVideoPlayoutForFaceTime" featureFlagDomain:"AVConference" featureFlagName:"UseVideoJitterForVideoPlayout"];
      v5->_resetSendRTPTimestampOnStop = 1;
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCVideoStreamConfig;
  [(VCMediaStreamConfig *)&v3 dealloc];
}

+ (BOOL)validateClientDictionary:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRXCodecType"), "integerValue");
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTXCodecType"), "integerValue");
  LOBYTE(v6) = 0;
  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) == 0x64 && (v5 & 0xFFFFFFFFFFFFFFFDLL) == 0x64)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamFramerate"), "integerValue") < 1
      || objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTilesPerFrame"), "integerValue") < 1|| objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamEnableCVO"), "BOOLValue")&& (unint64_t)(objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCVOExtensionID"), "unsignedIntegerValue")- 1) > 0xD)
    {
      goto LABEL_31;
    }
    if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDirection"), "integerValue") == 2)
    {
LABEL_17:
      LOBYTE(v6) = 1;
      return v6;
    }
    int v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamPixelFormat"), "unsignedIntegerValue");
    int v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamHDRMode"), "integerValue");
    if (v7 <= 875836533)
    {
      if (v7 == 875704422 || v7 == 875704438) {
        goto LABEL_16;
      }
      int v9 = 875836518;
    }
    else
    {
      if (v7 > 2016686639)
      {
        if (v7 == 2019963956)
        {
          if ((v8 & 0xFFFFFFFD) == 1) {
            goto LABEL_17;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v6) {
              return v6;
            }
            +[VCVideoStreamConfig validateClientDictionary:].cold.4();
          }
          goto LABEL_31;
        }
        if (v7 == 2016686640)
        {
          if ((v8 - 3) > 0xFFFFFFFD) {
            goto LABEL_17;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v6) {
              return v6;
            }
            +[VCVideoStreamConfig validateClientDictionary:]();
          }
          goto LABEL_31;
        }
        goto LABEL_28;
      }
      if (v7 == 875836534)
      {
LABEL_16:
        if (!v8) {
          goto LABEL_17;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v6) {
            return v6;
          }
          +[VCVideoStreamConfig validateClientDictionary:]();
        }
LABEL_31:
        LOBYTE(v6) = 0;
        return v6;
      }
      int v9 = 1751411059;
    }
    if (v7 == v9) {
      goto LABEL_16;
    }
LABEL_28:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E4F47A50];
      BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      +[VCVideoStreamConfig validateClientDictionary:v11];
    }
    goto LABEL_31;
  }
  return v6;
}

+ (unsigned)profileLevelIdForString:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x1E4F451E8]]) {
    return 4374559;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    unsigned int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    +[VCVideoStreamConfig profileLevelIdForString:]();
  }
  return 0;
}

+ (id)profileLevelStringForId:(unsigned int)a3
{
  if (a3 == 4374559) {
    return (id)*MEMORY[0x1E4F451E8];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      +[VCVideoStreamConfig profileLevelStringForId:]();
    }
  }
  return 0;
}

- (unint64_t)tilesPerFrame
{
  return (int)VCDefaults_GetIntValueForKey(@"tilesPerVideoFrame", LODWORD(self->_tilesPerFrame));
}

- (BOOL)applyVideoStreamClientDictionary:(id)a3
{
  BOOL v5 = +[VCVideoStreamConfig validateClientDictionary:](VCVideoStreamConfig, "validateClientDictionary:");
  if (v5)
  {
    [(NSMutableDictionary *)self->super._rxPayloadMap removeAllObjects];
    [(NSMutableDictionary *)self->super._txPayloadMap removeAllObjects];
    if ([a3 objectForKeyedSubscript:@"vcMediaStreamRxPayloadType"]) {
      -[VCMediaStreamConfig addRxPayloadType:networkPayload:](self, "addRxPayloadType:networkPayload:", +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRXCodecType"), "integerValue")), objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRxPayloadType"), "integerValue"));
    }
    if ([a3 objectForKeyedSubscript:@"vcMediaStreamTxPayloadType"]) {
      -[VCMediaStreamConfig addTxPayloadType:networkPayload:](self, "addTxPayloadType:networkPayload:", +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTXCodecType"), "integerValue")), objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTxPayloadType"), "integerValue"));
    }
    self->_framerate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamFramerate"), "integerValue");
    self->_txMinBitrate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTXMinBitrate"), "integerValue");
    self->_txMaxBitrate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTXMaxBitrate"), "integerValue");
    self->_rxMinBitrate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRXMinBitrate"), "integerValue");
    self->_rxMaxBitrate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRXMaxBitrate"), "integerValue");
    self->_keyFrameInterval = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamKeyFrameInterval"), "integerValue");
    self->_remoteVideoInitialOrientation = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRemoteVideoInitialOrientation"), "integerValue");
    self->_enableCVO = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamEnableCVO"), "BOOLValue");
    self->_cvoExtensionID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCVOExtensionID"), "unsignedIntegerValue");
    self->_isVideoProtected = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamIsVideoProtected"), "BOOLValue");
    self->_videoResolution = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamVideoResolution"), "integerValue");
    self->_type = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamVideoStreamMode"), "integerValue");
    self->_captureSourceID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCaptureSourceID"), "integerValue");
    self->_shouldSendBlackFramesOnClearScreen = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamShouldSendBlackFramesOnClearScreen"), "BOOLValue");
    self->_foveationEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamFoveationEnabled"), "BOOLValue");
    self->_screenDisplayID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDisplayID"), "unsignedIntegerValue");
    self->_tilesPerFrame = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTilesPerFrame"), "unsignedIntegerValue");
    self->_pixelFormat = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamPixelFormat"), "unsignedIntegerValue");
    self->_ltrpEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamIsltrpEnabled"), "BOOLValue");
    if (self->_videoResolution == 27)
    {
      self->_customWidth = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCustomWidth"), "unsignedIntegerValue");
      self->_customHeight = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCustomHeight"), "unsignedIntegerValue");
    }
    self->_hdrMode = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamHDRMode"), "integerValue");
    BOOL v6 = (void *)[a3 objectForKeyedSubscript:@"vcRemoteDeviceName"];
    if (objc_msgSend(v6, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"))) {
      int v7 = 0;
    }
    else {
      int v7 = (NSString *)(id)[a3 objectForKeyedSubscript:@"vcRemoteDeviceName"];
    }
    self->_remoteDeviceName = v7;
    if ([a3 objectForKeyedSubscript:@"vcMediaStreamRxCodecFeatureListString"])
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRXCodecType"), "integerValue");
      uint64_t v9 = [a3 objectForKeyedSubscript:@"vcMediaStreamRxCodecFeatureListString"];
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rxCodecFeatureListStrings, "setObject:forKeyedSubscript:", v9, [NSNumber numberWithInteger:v8]);
    }
    if ([a3 objectForKeyedSubscript:@"vcMediaStreamTxCodecFeatureListString"])
    {
      uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTXCodecType"), "integerValue");
      uint64_t v11 = [a3 objectForKeyedSubscript:@"vcMediaStreamTxCodecFeatureListString"];
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_txCodecFeatureListStrings, "setObject:forKeyedSubscript:", v11, [NSNumber numberWithInteger:v10]);
    }
    v12 = (void *)[a3 objectForKeyedSubscript:@"vcMediaStreamProfileLevel"];
    if (objc_msgSend(v12, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"))) {
      v13 = 0;
    }
    else {
      v13 = (NSString *)(id)[a3 objectForKeyedSubscript:@"vcMediaStreamProfileLevel"];
    }
    self->_profileLevel = v13;
    self->_fecEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamIsFECEnabled"), "BOOLValue");
    self->_rtxEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamIsRTXEnabled"), "BOOLValue");
    self->_transportProtocolType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTransportProtocolType"), "integerValue");
    [(VCVideoStreamConfig *)self initializeParameterSets];
  }
  return v5;
}

- (void)addRxCodecFeatureListString:(id)a3 codecType:(int64_t)a4
{
  rxCodecFeatureListStrings = self->_rxCodecFeatureListStrings;
  uint64_t v6 = [NSNumber numberWithInteger:a4];

  [(NSMutableDictionary *)rxCodecFeatureListStrings setObject:a3 forKeyedSubscript:v6];
}

- (void)addTxCodecFeatureListString:(id)a3 codecType:(int64_t)a4
{
  txCodecFeatureListStrings = self->_txCodecFeatureListStrings;
  uint64_t v6 = [NSNumber numberWithInteger:a4];

  [(NSMutableDictionary *)txCodecFeatureListStrings setObject:a3 forKeyedSubscript:v6];
}

- (void)addTxBitrateTier:(id)a3
{
  if ([a3 unsignedIntegerValue] >= self->_txMinBitrate
    && [a3 unsignedIntegerValue] <= self->_txMaxBitrate)
  {
    [(NSMutableOrderedSet *)self->_txBitrateTiers addObject:a3];
    txBitrateTiers = self->_txBitrateTiers;
    [(NSMutableOrderedSet *)txBitrateTiers sortUsingComparator:&__block_literal_global_68];
  }
}

uint64_t __40__VCVideoStreamConfig_addTxBitrateTier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)initializeParameterSets
{
  self->_parameterSets = VCVideoParameterSets_DefaultSupportedSetsForPayloadAndPixelFormat(+[VCPayloadUtils payloadForCodecType:[(VCMediaStreamConfig *)self primaryTxCodecType]], self->_pixelFormat);
}

- (int64_t)videoResolution
{
  return self->_videoResolution;
}

- (void)setVideoResolution:(int64_t)a3
{
  self->_videoResolution = a3;
}

- (unint64_t)framerate
{
  return self->_framerate;
}

- (void)setFramerate:(unint64_t)a3
{
  self->_framerate = a3;
}

- (unint64_t)txMinBitrate
{
  return self->_txMinBitrate;
}

- (void)setTxMinBitrate:(unint64_t)a3
{
  self->_txMinBitrate = a3;
}

- (unint64_t)txMaxBitrate
{
  return self->_txMaxBitrate;
}

- (void)setTxMaxBitrate:(unint64_t)a3
{
  self->_txMaxBitrate = a3;
}

- (NSOrderedSet)txBitrateTiers
{
  return &self->_txBitrateTiers->super;
}

- (unint64_t)txInitialBitrate
{
  return self->_txInitialBitrate;
}

- (void)setTxInitialBitrate:(unint64_t)a3
{
  self->_txInitialBitrate = a3;
}

- (unint64_t)rxMinBitrate
{
  return self->_rxMinBitrate;
}

- (void)setRxMinBitrate:(unint64_t)a3
{
  self->_rxMinBitrate = a3;
}

- (unint64_t)rxMaxBitrate
{
  return self->_rxMaxBitrate;
}

- (void)setRxMaxBitrate:(unint64_t)a3
{
  self->_rxMaxBitrate = a3;
}

- (NSDictionary)rxCodecFeatureListStrings
{
  return &self->_rxCodecFeatureListStrings->super;
}

- (NSDictionary)txCodecFeatureListStrings
{
  return &self->_txCodecFeatureListStrings->super;
}

- (unint64_t)keyFrameInterval
{
  return self->_keyFrameInterval;
}

- (void)setKeyFrameInterval:(unint64_t)a3
{
  self->_keyFrameInterval = a3;
}

- (int)remoteVideoInitialOrientation
{
  return self->_remoteVideoInitialOrientation;
}

- (void)setRemoteVideoInitialOrientation:(int)a3
{
  self->_remoteVideoInitialOrientation = a3;
}

- (BOOL)enableCVO
{
  return self->_enableCVO;
}

- (void)setEnableCVO:(BOOL)a3
{
  self->_enableCVO = a3;
}

- (unint64_t)cvoExtensionID
{
  return self->_cvoExtensionID;
}

- (void)setCvoExtensionID:(unint64_t)a3
{
  self->_cvoExtensionID = a3;
}

- (BOOL)isVideoProtected
{
  return self->_isVideoProtected;
}

- (void)setIsVideoProtected:(BOOL)a3
{
  self->_isVideoProtected = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unint64_t)sourceFramerate
{
  return self->_sourceFramerate;
}

- (void)setSourceFramerate:(unint64_t)a3
{
  self->_sourceFramerate = a3;
}

- (int)encodingMode
{
  return self->_encodingMode;
}

- (void)setEncodingMode:(int)a3
{
  self->_encodingMode = a3;
}

- (unsigned)videoPriorityPointer
{
  return self->_videoPriorityPointer;
}

- (void)setVideoPriorityPointer:(unsigned __int8 *)a3
{
  self->_videoPriorityPointer = a3;
}

- (int64_t)captureSourceID
{
  return self->_captureSourceID;
}

- (void)setCaptureSourceID:(int64_t)a3
{
  self->_captureSourceID = a3;
}

- (BOOL)shouldSendBlackFramesOnClearScreen
{
  return self->_shouldSendBlackFramesOnClearScreen;
}

- (void)setShouldSendBlackFramesOnClearScreen:(BOOL)a3
{
  self->_shouldSendBlackFramesOnClearScreen = a3;
}

- (BOOL)foveationEnabled
{
  return self->_foveationEnabled;
}

- (void)setFoveationEnabled:(BOOL)a3
{
  self->_foveationEnabled = a3;
}

- (unsigned)screenDisplayID
{
  return self->_screenDisplayID;
}

- (void)setScreenDisplayID:(unsigned int)a3
{
  self->_screenDisplayID = a3;
}

- (unint64_t)customWidth
{
  return self->_customWidth;
}

- (void)setCustomWidth:(unint64_t)a3
{
  self->_customWidth = a3;
}

- (unint64_t)customHeight
{
  return self->_customHeight;
}

- (void)setCustomHeight:(unint64_t)a3
{
  self->_customHeight = a3;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (void)setTilesPerFrame:(unint64_t)a3
{
  self->_tilesPerFrame = a3;
}

- (BOOL)ltrpEnabled
{
  return self->_ltrpEnabled;
}

- (void)setLtrpEnabled:(BOOL)a3
{
  self->_ltrpEnabled = a3;
}

- (int)hdrMode
{
  return self->_hdrMode;
}

- (void)setHdrMode:(int)a3
{
  self->_hdrMode = a3;
}

- (NSString)remoteDeviceName
{
  return self->_remoteDeviceName;
}

- (void)setRemoteDeviceName:(id)a3
{
}

- (NSString)profileLevel
{
  return self->_profileLevel;
}

- (void)setProfileLevel:(id)a3
{
}

- (unsigned)parameterSets
{
  return self->_parameterSets;
}

- (void)setParameterSets:(unsigned int)a3
{
  self->_parameterSets = a3;
}

- (BOOL)temporalScalingEnabled
{
  return self->_temporalScalingEnabled;
}

- (void)setTemporalScalingEnabled:(BOOL)a3
{
  self->_temporalScalingEnabled = a3;
}

- (BOOL)isVariableSliceModeEnabled
{
  return self->_isVariableSliceModeEnabled;
}

- (void)setIsVariableSliceModeEnabled:(BOOL)a3
{
  self->_isVariableSliceModeEnabled = a3;
}

- (BOOL)rtcpPSFB_FIREnabled
{
  return self->_rtcpPSFB_FIREnabled;
}

- (void)setRtcpPSFB_FIREnabled:(BOOL)a3
{
  self->_rtcpPSFB_FIREnabled = a3;
}

- (VCMediaStreamSyncSource)syncSource
{
  return self->_syncSource;
}

- (void)setSyncSource:(id)a3
{
  self->_syncSource = (VCMediaStreamSyncSource *)a3;
}

- (BOOL)resetSendRTPTimestampOnStop
{
  return self->_resetSendRTPTimestampOnStop;
}

- (void)setResetSendRTPTimestampOnStop:(BOOL)a3
{
  self->_resetSendRTPTimestampOnStop = a3;
}

- (int)encoderUsage
{
  return self->_encoderUsage;
}

- (void)setEncoderUsage:(int)a3
{
  self->_encoderUsage = a3;
}

- (BOOL)useInBandFEC
{
  return self->_useInBandFEC;
}

- (void)setUseInBandFEC:(BOOL)a3
{
  self->_useInBandFEC = a3;
}

- (unsigned)audioIOSampleRate
{
  return self->_audioIOSampleRate;
}

- (void)setAudioIOSampleRate:(unsigned int)a3
{
  self->_audioIOSampleRate = a3;
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

- (int)transportProtocolType
{
  return self->_transportProtocolType;
}

- (void)setTransportProtocolType:(int)a3
{
  self->_transportProtocolType = a3;
}

- (double)minPlaybackInterval
{
  return self->_minPlaybackInterval;
}

- (void)setMinPlaybackInterval:(double)a3
{
  self->_minPlaybackInterval = a3;
}

- (double)minRenderingDelay
{
  return self->_minRenderingDelay;
}

- (void)setMinRenderingDelay:(double)a3
{
  self->_minRenderingDelay = a3;
}

- (double)mediaStallTimeout
{
  return self->_mediaStallTimeout;
}

- (void)setMediaStallTimeout:(double)a3
{
  self->_mediaStallTimeout = a3;
}

- (double)mediaStallReportRepeatInterval
{
  return self->_mediaStallReportRepeatInterval;
}

- (void)setMediaStallReportRepeatInterval:(double)a3
{
  self->_mediaStallReportRepeatInterval = a3;
}

- (int)fecHeaderVersion
{
  return self->_fecHeaderVersion;
}

- (void)setFecHeaderVersion:(int)a3
{
  self->_fecHeaderVersion = a3;
}

- (BOOL)fecGeneratorEnabled
{
  return self->_fecGeneratorEnabled;
}

- (void)setFecGeneratorEnabled:(BOOL)a3
{
  self->_fecGeneratorEnabled = a3;
}

- (BOOL)useVideoJitterForVideoPlayout
{
  return self->_useVideoJitterForVideoPlayout;
}

- (void)setUseVideoJitterForVideoPlayout:(BOOL)a3
{
  self->_useVideoJitterForVideoPlayout = a3;
}

- (unint64_t)maxEncoderPixels
{
  return self->_maxEncoderPixels;
}

- (void)setMaxEncoderPixels:(unint64_t)a3
{
  self->_maxEncoderPixels = a3;
}

- (BOOL)forceZeroRegionOfInterestOrigin
{
  return self->_forceZeroRegionOfInterestOrigin;
}

- (void)setForceZeroRegionOfInterestOrigin:(BOOL)a3
{
  self->_forceZeroRegionOfInterestOrigin = a3;
}

- (BOOL)shouldEnableMLEnhance
{
  return self->_shouldEnableMLEnhance;
}

- (void)setShouldEnableMLEnhance:(BOOL)a3
{
  self->_shouldEnableMLEnhance = a3;
}

- (BOOL)deferredAssemblyEnabled
{
  return self->_deferredAssemblyEnabled;
}

- (void)setDeferredAssemblyEnabled:(BOOL)a3
{
  self->_deferredAssemblyEnabled = a3;
}

- (BOOL)looseAVSyncEnabled
{
  return self->_looseAVSyncEnabled;
}

- (void)setLooseAVSyncEnabled:(BOOL)a3
{
  self->_looseAVSyncEnabled = a3;
}

+ (void)validateClientDictionary:(NSObject *)a3 .cold.1(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  int v7 = "+[VCVideoStreamConfig validateClientDictionary:]";
  __int16 v8 = 1024;
  int v9 = 238;
  __int16 v10 = 2080;
  uint64_t v11 = FourccToCStr(a2);
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unexpected pixel format in video configuration. pixelFormat=%s", (uint8_t *)&v4, 0x26u);
}

+ (void)validateClientDictionary:.cold.2()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "+[VCVideoStreamConfig validateClientDictionary:]";
  __int16 v6 = 1024;
  int v7 = 225;
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid HDR mode in video configuration: hdrMode=%d", v3, 0x22u);
}

+ (void)validateClientDictionary:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d HDR mode set for non-HDR pixel format in video configuration", v2, v3, v4, v5, v6);
}

+ (void)validateClientDictionary:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d 444-10 bit can only be used for HDR10/HDR10Reference mode", v2, v3, v4, v5, v6);
}

+ (void)profileLevelIdForString:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unsupported profile level string", v2, v3, v4, v5, v6);
}

+ (void)profileLevelStringForId:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unsupported profile level id", v2, v3, v4, v5, v6);
}

@end