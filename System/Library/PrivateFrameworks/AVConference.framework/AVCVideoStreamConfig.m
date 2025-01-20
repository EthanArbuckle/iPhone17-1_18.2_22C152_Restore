@interface AVCVideoStreamConfig
+ (BOOL)isPixelFormatValid:(unsigned int)a3 hdrMode:(unint64_t)a4;
+ (int)videoCaptureSourceFromClientCaptureSource:(int64_t)a3;
+ (int64_t)clientCodecTypeWithCodecType:(int64_t)a3;
+ (int64_t)clientVideoCaptureSourceFromCaptureSource:(int)a3;
+ (int64_t)clientVideoResolutionFromResolution:(int64_t)a3;
+ (int64_t)clientVideoStreamModeFromVideoStreamType:(int64_t)a3;
+ (int64_t)codecTypeWithClientCodecType:(int64_t)a3;
+ (int64_t)videoResolutionFromClientResolution:(int64_t)a3;
+ (int64_t)videoStreamTypeFromClientVideoStreamMode:(int64_t)a3;
- (AVCVideoStreamConfig)init;
- (BOOL)enableCVO;
- (BOOL)isFECEnabled;
- (BOOL)isFoveationEnabled;
- (BOOL)isLTRPEnabled;
- (BOOL)isLatencySensitiveModeEnabled;
- (BOOL)isRTXEnabled;
- (BOOL)isValidForDirection:(int64_t)a3;
- (BOOL)isVideoProtected;
- (BOOL)shouldSendBlackFramesOnClearScreen;
- (NSString)profileLevel;
- (NSString)remoteDeviceName;
- (NSString)rxCodecFeatureListString;
- (NSString)txCodecFeatureListString;
- (id)dictionary;
- (int)remoteVideoInitialOrientation;
- (int64_t)captureSource;
- (int64_t)captureSourceID;
- (int64_t)rxCodecType;
- (int64_t)synchronizationSourceStreamToken;
- (int64_t)transportProtocolType;
- (int64_t)txCodecType;
- (int64_t)videoResolution;
- (int64_t)videoStreamMode;
- (unint64_t)customHeight;
- (unint64_t)customWidth;
- (unint64_t)cvoExtensionID;
- (unint64_t)framerate;
- (unint64_t)hdrMode;
- (unint64_t)keyFrameInterval;
- (unint64_t)rxMaxBitrate;
- (unint64_t)rxMinBitrate;
- (unint64_t)screenDisplayID;
- (unint64_t)tilesPerFrame;
- (unint64_t)txMaxBitrate;
- (unint64_t)txMinBitrate;
- (unsigned)pixelFormat;
- (void)dealloc;
- (void)setCaptureSource:(int64_t)a3;
- (void)setCaptureSourceID:(int64_t)a3;
- (void)setCustomHeight:(unint64_t)a3;
- (void)setCustomWidth:(unint64_t)a3;
- (void)setCvoExtensionID:(unint64_t)a3;
- (void)setEnableCVO:(BOOL)a3;
- (void)setFecEnabled:(BOOL)a3;
- (void)setFoveationEnabled:(BOOL)a3;
- (void)setFramerate:(unint64_t)a3;
- (void)setHdrMode:(unint64_t)a3;
- (void)setIsVideoProtected:(BOOL)a3;
- (void)setKeyFrameInterval:(unint64_t)a3;
- (void)setLatencySensitiveModeEnabled:(BOOL)a3;
- (void)setLtrpEnabled:(BOOL)a3;
- (void)setPixelFormat:(unsigned int)a3;
- (void)setProfileLevel:(id)a3;
- (void)setRemoteDeviceName:(id)a3;
- (void)setRemoteVideoInitialOrientation:(int)a3;
- (void)setRtxEnabled:(BOOL)a3;
- (void)setRxCodecFeatureListString:(id)a3;
- (void)setRxCodecType:(int64_t)a3;
- (void)setRxMaxBitrate:(unint64_t)a3;
- (void)setRxMinBitrate:(unint64_t)a3;
- (void)setScreenDisplayID:(unint64_t)a3;
- (void)setShouldSendBlackFramesOnClearScreen:(BOOL)a3;
- (void)setSynchronizationSourceStreamToken:(int64_t)a3;
- (void)setTilesPerFrame:(unint64_t)a3;
- (void)setTransportProtocolType:(int64_t)a3;
- (void)setTxCodecFeatureListString:(id)a3;
- (void)setTxCodecType:(int64_t)a3;
- (void)setTxMaxBitrate:(unint64_t)a3;
- (void)setTxMinBitrate:(unint64_t)a3;
- (void)setUpWithDictionary:(id)a3;
- (void)setVideoResolution:(int64_t)a3;
- (void)setVideoStreamMode:(int64_t)a3;
@end

@implementation AVCVideoStreamConfig

- (AVCVideoStreamConfig)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)AVCVideoStreamConfig;
  v2 = [(AVCVideoStreamConfig *)&v4 init];
  if (v2)
  {
    v2->_txCodecFeatureListString = (NSString *)objc_opt_new();
    v2->_rxCodecFeatureListString = (NSString *)objc_opt_new();
    v2->_tilesPerFrame = 1;
    v2->_pixelFormat = 875704438;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)AVCVideoStreamConfig;
  [(AVCVideoStreamConfig *)&v3 dealloc];
}

- (BOOL)isValidForDirection:(int64_t)a3
{
  if ([(AVCVideoStreamConfig *)self txCodecType]) {
    BOOL v5 = [(AVCVideoStreamConfig *)self txCodecType] != 1;
  }
  else {
    BOOL v5 = 0;
  }
  if ([(AVCVideoStreamConfig *)self rxCodecType]) {
    BOOL v6 = [(AVCVideoStreamConfig *)self rxCodecType] != 1;
  }
  else {
    BOOL v6 = 0;
  }
  if (a3 == 2)
  {
    if (v5 || v6) {
      goto LABEL_17;
    }
  }
  else if (!+[AVCVideoStreamConfig isPixelFormatValid:[(AVCVideoStreamConfig *)self pixelFormat] hdrMode:[(AVCVideoStreamConfig *)self hdrMode]]|| v5|| v6)
  {
    goto LABEL_17;
  }
  unint64_t v7 = [(AVCVideoStreamConfig *)self framerate];
  if (!v7) {
    return v7;
  }
  unint64_t v7 = [(AVCVideoStreamConfig *)self tilesPerFrame];
  if (!v7) {
    return v7;
  }
  if ([(AVCVideoStreamConfig *)self tilesPerFrame] > 8)
  {
LABEL_17:
    LOBYTE(v7) = 0;
    return v7;
  }
  if ([(AVCVideoStreamConfig *)self enableCVO])
  {
    unint64_t v7 = [(AVCVideoStreamConfig *)self cvoExtensionID];
    if (v7) {
      LOBYTE(v7) = [(AVCVideoStreamConfig *)self cvoExtensionID] < 0xF;
    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

+ (int64_t)codecTypeWithClientCodecType:(int64_t)a3
{
  int64_t v3 = 102;
  if (a3 != 1) {
    int64_t v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return 100;
  }
}

+ (int64_t)clientCodecTypeWithCodecType:(int64_t)a3
{
  return a3 == 102;
}

+ (int64_t)videoResolutionFromClientResolution:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xC) {
    return 7;
  }
  else {
    return qword_1E25A35B0[a3 - 1];
  }
}

+ (int64_t)clientVideoResolutionFromResolution:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) > 0x15) {
    return 0;
  }
  else {
    return qword_1E25A3618[a3 - 6];
  }
}

+ (int64_t)clientVideoCaptureSourceFromCaptureSource:(int)a3
{
  if ((a3 - 1) > 5) {
    return 2;
  }
  else {
    return qword_1E25A36C8[a3 - 1];
  }
}

+ (int)videoCaptureSourceFromClientCaptureSource:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return dword_1E25A3750[a3];
  }
}

+ (int64_t)clientVideoStreamModeFromVideoStreamType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 0;
  }
  else {
    return qword_1E25A36F8[a3 - 1];
  }
}

+ (int64_t)videoStreamTypeFromClientVideoStreamMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 0;
  }
  else {
    return qword_1E25A3728[a3 - 1];
  }
}

- (void)setUpWithDictionary:(id)a3
{
  self->_txCodecType = +[AVCVideoStreamConfig clientCodecTypeWithCodecType:](AVCVideoStreamConfig, "clientCodecTypeWithCodecType:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTXCodecType"), "integerValue"));
  self->_rxCodecType = +[AVCVideoStreamConfig clientCodecTypeWithCodecType:](AVCVideoStreamConfig, "clientCodecTypeWithCodecType:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRXCodecType"), "integerValue"));
  self->_videoResolution = +[AVCVideoStreamConfig clientVideoResolutionFromResolution:](AVCVideoStreamConfig, "clientVideoResolutionFromResolution:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamVideoResolution"), "integerValue"));
  self->_synchronizationSourceStreamToken = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamSyncStreamToken"), "integerValue");
  self->_framerate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamFramerate"), "integerValue");
  self->_txMaxBitrate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTXMaxBitrate"), "integerValue");
  self->_txMinBitrate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTXMinBitrate"), "integerValue");
  self->_rxMaxBitrate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRXMaxBitrate"), "integerValue");
  self->_rxMinBitrate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRXMinBitrate"), "integerValue");
  self->_txCodecFeatureListString = (NSString *)(id)[a3 objectForKeyedSubscript:@"vcMediaStreamTxCodecFeatureListString"];
  self->_rxCodecFeatureListString = (NSString *)(id)[a3 objectForKeyedSubscript:@"vcMediaStreamRxCodecFeatureListString"];
  self->_keyFrameInterval = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamKeyFrameInterval"), "integerValue");
  self->_remoteVideoInitialOrientation = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRemoteVideoInitialOrientation"), "integerValue");
  self->_enableCVO = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamEnableCVO"), "BOOLValue");
  self->_cvoExtensionID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCVOExtensionID"), "unsignedIntegerValue");
  self->_isVideoProtected = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamIsVideoProtected"), "BOOLValue");
  self->_videoStreamMode = +[AVCVideoStreamConfig clientVideoStreamModeFromVideoStreamType:](AVCVideoStreamConfig, "clientVideoStreamModeFromVideoStreamType:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamVideoStreamMode"), "integerValue"));
  self->_captureSource = +[AVCVideoStreamConfig clientVideoCaptureSourceFromCaptureSource:](AVCVideoStreamConfig, "clientVideoCaptureSourceFromCaptureSource:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCaptureSource"), "integerValue"));
  self->_captureSourceID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCaptureSourceID"), "integerValue");
  self->_screenDisplayID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDisplayID"), "unsignedIntegerValue");
  self->_tilesPerFrame = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTilesPerFrame"), "integerValue");
  self->_pixelFormat = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamPixelFormat"), "unsignedIntegerValue");
  self->_ltrpEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamIsltrpEnabled"), "BOOLValue");
  if (self->_videoResolution == 12)
  {
    self->_customWidth = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCustomWidth"), "integerValue");
    self->_customHeight = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCustomHeight"), "integerValue");
  }
  self->_hdrMode = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamHDRMode"), "integerValue");
  BOOL v5 = (void *)[a3 objectForKeyedSubscript:@"vcRemoteDeviceName"];
  if (objc_msgSend(v5, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"))) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = (NSString *)(id)[a3 objectForKeyedSubscript:@"vcRemoteDeviceName"];
  }
  self->_remoteDeviceName = v6;
  self->_latencySensitiveModeEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamLatencySensitiveMode"), "BOOLValue");
  unint64_t v7 = (void *)[a3 objectForKeyedSubscript:@"vcMediaStreamProfileLevel"];
  if (objc_msgSend(v7, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"))) {
    v8 = 0;
  }
  else {
    v8 = (NSString *)(id)[a3 objectForKeyedSubscript:@"vcMediaStreamProfileLevel"];
  }
  self->_profileLevel = v8;
  self->_fecEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamIsFECEnabled"), "BOOLValue");
  self->_rtxEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamIsRTXEnabled"), "BOOLValue");
  self->_transportProtocolType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTransportProtocolType"), "integerValue");
  self->_shouldSendBlackFramesOnClearScreen = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamShouldSendBlackFramesOnClearScreen"), "BOOLValue");
  self->_foveationEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamFoveationEnabled"), "BOOLValue");
}

- (id)dictionary
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (+[VCDefaults BOOLeanValueForKey:@"force444" defaultValue:0])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v39 = v3;
        __int16 v40 = 2080;
        v41 = "-[AVCVideoStreamConfig dictionary]";
        __int16 v42 = 1024;
        int v43 = 1318;
        __int16 v44 = 2112;
        v45 = @"force444";
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@ set. Setting _pixelFormat to 444f", buf, 0x26u);
      }
    }
    unsigned int v5 = 875836518;
  }
  else if (+[VCDefaults BOOLeanValueForKey:@"force444-10bit" defaultValue:0])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      unint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v39 = v6;
        __int16 v40 = 2080;
        v41 = "-[AVCVideoStreamConfig dictionary]";
        __int16 v42 = 1024;
        int v43 = 1321;
        __int16 v44 = 2112;
        v45 = @"force444-10bit";
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%@] set. Setting _pixelFormat to 444f 10-bit", buf, 0x26u);
      }
    }
    unsigned int v5 = 2019963956;
  }
  else
  {
    if (!+[VCDefaults BOOLeanValueForKey:@"force420" defaultValue:0])goto LABEL_17; {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    }
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v39 = v8;
        __int16 v40 = 2080;
        v41 = "-[AVCVideoStreamConfig dictionary]";
        __int16 v42 = 1024;
        int v43 = 1324;
        __int16 v44 = 2112;
        v45 = @"force420";
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@ set. Setting _pixelFormat to 420f", buf, 0x26u);
      }
    }
    unsigned int v5 = 875704422;
  }
  self->_pixelFormat = v5;
LABEL_17:
  v14[0] = objc_msgSend(NSNumber, "numberWithInteger:", +[AVCVideoStreamConfig codecTypeWithClientCodecType:](AVCVideoStreamConfig, "codecTypeWithClientCodecType:", self->_txCodecType, @"vcMediaStreamTXCodecType"));
  v13[1] = @"vcMediaStreamRXCodecType";
  v14[1] = objc_msgSend(NSNumber, "numberWithInteger:", +[AVCVideoStreamConfig codecTypeWithClientCodecType:](AVCVideoStreamConfig, "codecTypeWithClientCodecType:", self->_rxCodecType));
  v13[2] = @"vcMediaStreamVideoResolution";
  v14[2] = objc_msgSend(NSNumber, "numberWithInteger:", +[AVCVideoStreamConfig videoResolutionFromClientResolution:](AVCVideoStreamConfig, "videoResolutionFromClientResolution:", self->_videoResolution));
  v13[3] = @"vcMediaStreamSyncStreamToken";
  v14[3] = [NSNumber numberWithInteger:self->_synchronizationSourceStreamToken];
  v13[4] = @"vcMediaStreamFramerate";
  v14[4] = [NSNumber numberWithUnsignedInteger:self->_framerate];
  v13[5] = @"vcMediaStreamTXMaxBitrate";
  v14[5] = [NSNumber numberWithUnsignedInteger:self->_txMaxBitrate];
  v13[6] = @"vcMediaStreamTXMinBitrate";
  v14[6] = [NSNumber numberWithUnsignedInteger:self->_txMinBitrate];
  v13[7] = @"vcMediaStreamRXMaxBitrate";
  v14[7] = [NSNumber numberWithUnsignedInteger:self->_rxMaxBitrate];
  v13[8] = @"vcMediaStreamRXMinBitrate";
  v14[8] = [NSNumber numberWithUnsignedInteger:self->_rxMinBitrate];
  v13[9] = @"vcMediaStreamTxCodecFeatureListString";
  v13[10] = @"vcMediaStreamRxCodecFeatureListString";
  long long v15 = *(_OWORD *)&self->_txCodecFeatureListString;
  v13[11] = @"vcMediaStreamKeyFrameInterval";
  uint64_t v16 = [NSNumber numberWithUnsignedInteger:self->_keyFrameInterval];
  v13[12] = @"vcMediaStreamRemoteVideoInitialOrientation";
  uint64_t v17 = [NSNumber numberWithUnsignedInt:self->_remoteVideoInitialOrientation];
  v13[13] = @"vcMediaStreamEnableCVO";
  uint64_t v18 = [NSNumber numberWithBool:self->_enableCVO];
  v13[14] = @"vcMediaStreamCVOExtensionID";
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:self->_cvoExtensionID];
  v13[15] = @"vcMediaStreamIsVideoProtected";
  uint64_t v20 = [NSNumber numberWithBool:self->_isVideoProtected];
  v13[16] = @"vcMediaStreamVideoStreamMode";
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithInteger:", +[AVCVideoStreamConfig videoStreamTypeFromClientVideoStreamMode:](AVCVideoStreamConfig, "videoStreamTypeFromClientVideoStreamMode:", self->_videoStreamMode));
  v13[17] = @"vcMediaStreamCaptureSource";
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[AVCVideoStreamConfig videoCaptureSourceFromClientCaptureSource:](AVCVideoStreamConfig, "videoCaptureSourceFromClientCaptureSource:", self->_captureSource));
  v13[18] = @"vcMediaStreamCaptureSourceID";
  uint64_t v23 = [NSNumber numberWithInteger:self->_captureSourceID];
  v13[19] = @"vcMediaStreamDisplayID";
  uint64_t v24 = [NSNumber numberWithUnsignedInteger:self->_screenDisplayID];
  v13[20] = @"vcMediaStreamCustomWidth";
  uint64_t v25 = [NSNumber numberWithUnsignedInteger:self->_customWidth];
  v13[21] = @"vcMediaStreamCustomHeight";
  uint64_t v26 = [NSNumber numberWithUnsignedInteger:self->_customHeight];
  v13[22] = @"vcMediaStreamTilesPerFrame";
  uint64_t v27 = [NSNumber numberWithUnsignedInteger:self->_tilesPerFrame];
  v13[23] = @"vcMediaStreamPixelFormat";
  uint64_t v28 = [NSNumber numberWithUnsignedInt:self->_pixelFormat];
  v13[24] = @"vcMediaStreamIsltrpEnabled";
  uint64_t v29 = [NSNumber numberWithBool:self->_ltrpEnabled];
  v13[25] = @"vcMediaStreamHDRMode";
  uint64_t v30 = [NSNumber numberWithUnsignedInteger:self->_hdrMode];
  v13[26] = @"vcRemoteDeviceName";
  remoteDeviceName = self->_remoteDeviceName;
  if (!remoteDeviceName) {
    remoteDeviceName = (NSString *)[MEMORY[0x1E4F1CA98] null];
  }
  v31 = remoteDeviceName;
  v13[27] = @"vcMediaStreamProfileLevel";
  profileLevel = self->_profileLevel;
  if (!profileLevel) {
    profileLevel = (NSString *)[MEMORY[0x1E4F1CA98] null];
  }
  v32 = profileLevel;
  v13[28] = @"vcMediaStreamIsFECEnabled";
  uint64_t v33 = [NSNumber numberWithBool:self->_fecEnabled];
  v13[29] = @"vcMediaStreamIsRTXEnabled";
  uint64_t v34 = [NSNumber numberWithBool:self->_rtxEnabled];
  v13[30] = @"vcMediaStreamTransportProtocolType";
  uint64_t v35 = [NSNumber numberWithInteger:self->_transportProtocolType];
  v13[31] = @"vcMediaStreamShouldSendBlackFramesOnClearScreen";
  uint64_t v36 = [NSNumber numberWithBool:self->_shouldSendBlackFramesOnClearScreen];
  v13[32] = @"vcMediaStreamFoveationEnabled";
  uint64_t v37 = [NSNumber numberWithBool:self->_foveationEnabled];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:33];
}

+ (BOOL)isPixelFormatValid:(unsigned int)a3 hdrMode:(unint64_t)a4
{
  if ((int)a3 <= 875836533)
  {
    if (a3 == 875704422 || a3 == 875704438) {
      goto LABEL_9;
    }
    int v4 = 875836518;
  }
  else
  {
    if ((int)a3 > 2016686639)
    {
      if (a3 == 2016686640)
      {
        LOBYTE(v6) = a4 - 1 < 2;
        return v6;
      }
      if (a3 == 2019963956)
      {
        BOOL v5 = (a4 & 0xFFFFFFFFFFFFFFFDLL) == 1;
LABEL_10:
        LOBYTE(v6) = v5;
        return v6;
      }
      goto LABEL_17;
    }
    if (a3 == 875836534)
    {
LABEL_9:
      BOOL v5 = a4 == 0;
      goto LABEL_10;
    }
    int v4 = 1751411059;
  }
  if (a3 == v4) {
    goto LABEL_9;
  }
LABEL_17:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v6) {
      return v6;
    }
    +[AVCVideoStreamConfig isPixelFormatValid:hdrMode:]();
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (int64_t)txCodecType
{
  return self->_txCodecType;
}

- (void)setTxCodecType:(int64_t)a3
{
  self->_txCodecType = a3;
}

- (int64_t)rxCodecType
{
  return self->_rxCodecType;
}

- (void)setRxCodecType:(int64_t)a3
{
  self->_rxCodecType = a3;
}

- (int64_t)videoResolution
{
  return self->_videoResolution;
}

- (void)setVideoResolution:(int64_t)a3
{
  self->_videoResolution = a3;
}

- (int64_t)synchronizationSourceStreamToken
{
  return self->_synchronizationSourceStreamToken;
}

- (void)setSynchronizationSourceStreamToken:(int64_t)a3
{
  self->_synchronizationSourceStreamToken = a3;
}

- (unint64_t)framerate
{
  return self->_framerate;
}

- (void)setFramerate:(unint64_t)a3
{
  self->_framerate = a3;
}

- (unint64_t)txMaxBitrate
{
  return self->_txMaxBitrate;
}

- (void)setTxMaxBitrate:(unint64_t)a3
{
  self->_txMaxBitrate = a3;
}

- (unint64_t)txMinBitrate
{
  return self->_txMinBitrate;
}

- (void)setTxMinBitrate:(unint64_t)a3
{
  self->_txMinBitrate = a3;
}

- (unint64_t)rxMaxBitrate
{
  return self->_rxMaxBitrate;
}

- (void)setRxMaxBitrate:(unint64_t)a3
{
  self->_rxMaxBitrate = a3;
}

- (unint64_t)rxMinBitrate
{
  return self->_rxMinBitrate;
}

- (void)setRxMinBitrate:(unint64_t)a3
{
  self->_rxMinBitrate = a3;
}

- (NSString)txCodecFeatureListString
{
  return self->_txCodecFeatureListString;
}

- (void)setTxCodecFeatureListString:(id)a3
{
}

- (NSString)rxCodecFeatureListString
{
  return self->_rxCodecFeatureListString;
}

- (void)setRxCodecFeatureListString:(id)a3
{
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

- (int64_t)videoStreamMode
{
  return self->_videoStreamMode;
}

- (void)setVideoStreamMode:(int64_t)a3
{
  self->_videoStreamMode = a3;
}

- (int64_t)captureSource
{
  return self->_captureSource;
}

- (void)setCaptureSource:(int64_t)a3
{
  self->_captureSource = a3;
}

- (int64_t)captureSourceID
{
  return self->_captureSourceID;
}

- (void)setCaptureSourceID:(int64_t)a3
{
  self->_captureSourceID = a3;
}

- (unint64_t)screenDisplayID
{
  return self->_screenDisplayID;
}

- (void)setScreenDisplayID:(unint64_t)a3
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

- (unint64_t)tilesPerFrame
{
  return self->_tilesPerFrame;
}

- (void)setTilesPerFrame:(unint64_t)a3
{
  self->_tilesPerFrame = a3;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (BOOL)isLTRPEnabled
{
  return self->_ltrpEnabled;
}

- (void)setLtrpEnabled:(BOOL)a3
{
  self->_ltrpEnabled = a3;
}

- (unint64_t)hdrMode
{
  return self->_hdrMode;
}

- (void)setHdrMode:(unint64_t)a3
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

- (BOOL)isLatencySensitiveModeEnabled
{
  return self->_latencySensitiveModeEnabled;
}

- (void)setLatencySensitiveModeEnabled:(BOOL)a3
{
  self->_latencySensitiveModeEnabled = a3;
}

- (NSString)profileLevel
{
  return self->_profileLevel;
}

- (void)setProfileLevel:(id)a3
{
}

- (BOOL)isFECEnabled
{
  return self->_fecEnabled;
}

- (void)setFecEnabled:(BOOL)a3
{
  self->_fecEnabled = a3;
}

- (BOOL)isRTXEnabled
{
  return self->_rtxEnabled;
}

- (void)setRtxEnabled:(BOOL)a3
{
  self->_rtxEnabled = a3;
}

- (int64_t)transportProtocolType
{
  return self->_transportProtocolType;
}

- (void)setTransportProtocolType:(int64_t)a3
{
  self->_transportProtocolType = a3;
}

- (BOOL)shouldSendBlackFramesOnClearScreen
{
  return self->_shouldSendBlackFramesOnClearScreen;
}

- (void)setShouldSendBlackFramesOnClearScreen:(BOOL)a3
{
  self->_shouldSendBlackFramesOnClearScreen = a3;
}

- (BOOL)isFoveationEnabled
{
  return self->_foveationEnabled;
}

- (void)setFoveationEnabled:(BOOL)a3
{
  self->_foveationEnabled = a3;
}

+ (void)isPixelFormatValid:hdrMode:.cold.1()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  int v4 = 1380;
  __int16 v5 = v0;
  int v6 = 1380;
  __int16 v7 = v0;
  int v8 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/AVCMediaStreamConfig.m:%d: Unexpected pixel format type: %d", v3, 0x28u);
}

@end