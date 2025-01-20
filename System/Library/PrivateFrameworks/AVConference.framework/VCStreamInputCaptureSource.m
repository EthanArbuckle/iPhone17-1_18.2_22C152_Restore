@interface VCStreamInputCaptureSource
+ (BOOL)readIntegerFromConfig:(id)a3 key:(id)a4 value:(int64_t *)a5;
+ (BOOL)readUint32FromConfig:(id)a3 key:(id)a4 value:(unsigned int *)a5;
- (BOOL)allSinksSuspended;
- (BOOL)isEqual:(id)a3;
- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5;
- (BOOL)setupDataFormatWithConfiguration:(id)a3;
- (BOOL)setupFormatWithConfiguration:(id)a3;
- (BOOL)setupVideoFormatWithConfiguration:(id)a3;
- (VCStreamInputCaptureSource)initWithCaptureSourceID:(int)a3 configuration:(id)a4;
- (id)copyOnVideoFrameBlock;
- (int)captureSourceID;
- (int)getCaptureFrameRateForSource:(int)a3;
- (int64_t)streamInputID;
- (opaqueCMFormatDescription)formatDescription;
- (unsigned)addSink:(id)a3;
- (unsigned)frameRate;
- (unsigned)removeSink:(id)a3;
- (void)dealloc;
- (void)didResumeVideoSink:(id)a3;
- (void)didSuspendVideoSink:(id)a3;
- (void)loadCannedVideoReplay;
- (void)onCaptureScreenFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 orientation:(int)a5;
- (void)setCaptureSourceID:(int)a3;
- (void)setDelegate:(id)a3;
@end

@implementation VCStreamInputCaptureSource

- (VCStreamInputCaptureSource)initWithCaptureSourceID:(int)a3 configuration:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCStreamInputCaptureSource;
  v12[0] = _VCStreamInputCaptureSource_OnCaptureVideoFrame;
  v6 = [(VCVideoCapture *)&v11 initWithCaptureServer:0 protocolFunctions:v12];
  v7 = v6;
  if (!v6) {
    return v7;
  }
  pthread_mutex_init(&v6->_sinkMutex, 0);
  if (a3 <= 9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamInputCaptureSource initWithCaptureSourceID:configuration:]();
      }
    }
    goto LABEL_21;
  }
  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7->_videoSinkState = v8;
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamInputCaptureSource initWithCaptureSourceID:configuration:]();
      }
    }
    goto LABEL_21;
  }
  int64_t v10 = 0;
  if (!+[VCStreamInputCaptureSource readIntegerFromConfig:a4 key:@"streamInputID" value:&v10])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamInputCaptureSource initWithCaptureSourceID:configuration:].cold.4();
      }
    }
    goto LABEL_21;
  }
  v7->_streamInputID = v10;
  v7->_captureSourceID = a3;
  [(VCStreamInputCaptureSource *)v7 setupFormatWithConfiguration:a4];
  if (!v7->_formatDescription)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamInputCaptureSource initWithCaptureSourceID:configuration:]();
      }
    }
LABEL_21:

    return 0;
  }
  if (VRTraceIsInternalOSInstalled()) {
    [(VCStreamInputCaptureSource *)v7 loadCannedVideoReplay];
  }
  return v7;
}

- (void)loadCannedVideoReplay
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (CMFormatDescriptionGetMediaType(self->_formatDescription) != 1986618469)
  {
    v5 = 0;
    goto LABEL_16;
  }
  CFStringRef v3 = (const __CFString *)[NSString stringWithFormat:@"%@_%s", @"cannedReplay", FourccToCStr(self->_streamInputID)];
  v4 = (__CFString *)VCDefaults_CopyStringValueForKey(v3);
  v5 = v4;
  if (v4 && [(__CFString *)v4 length])
  {
    unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(self->_formatDescription);
    int v28 = 0;
    v27 = _VCStreamInputCaptureSource_OnCaptureVideoFrame;
    LOBYTE(v26) = 0;
    v7 = [[CannedVideoCapture alloc] initWithCaptureServer:self protocolFunctions:&v27 width:Dimensions height:HIDWORD(Dimensions) frameRate:self->_frameRate videoSourceToken:0 video:v5 isCamera:v26 error:&v28];
    self->_cannedVideoCapture = (VCVideoSource *)v7;
    if (!v7)
    {
      if ((VCStreamInputCaptureSource *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_16;
        }
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        unsigned int frameRate = self->_frameRate;
        *(_DWORD *)buf = 136316930;
        uint64_t v30 = v17;
        __int16 v31 = 2080;
        v32 = "-[VCStreamInputCaptureSource loadCannedVideoReplay]";
        __int16 v33 = 1024;
        int v34 = 110;
        __int16 v35 = 2112;
        v36 = v5;
        __int16 v37 = 1024;
        *(_DWORD *)v38 = Dimensions;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = HIDWORD(Dimensions);
        LOWORD(v39) = 1024;
        *(_DWORD *)((char *)&v39 + 2) = frameRate;
        HIWORD(v39) = 1024;
        *(_DWORD *)v40 = v28;
        v20 = " [%s] %s:%d Failed to load file at path=%@, width=%d height=%d frameRate=%u error=0x%x";
        v21 = v18;
        uint32_t v22 = 62;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v16 = (__CFString *)[(VCStreamInputCaptureSource *)self performSelector:sel_logPrefix];
        }
        else {
          v16 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_16;
        }
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        unsigned int v25 = self->_frameRate;
        *(_DWORD *)buf = 136317442;
        uint64_t v30 = v23;
        __int16 v31 = 2080;
        v32 = "-[VCStreamInputCaptureSource loadCannedVideoReplay]";
        __int16 v33 = 1024;
        int v34 = 110;
        __int16 v35 = 2112;
        v36 = v16;
        __int16 v37 = 2048;
        *(void *)v38 = self;
        *(_WORD *)&v38[8] = 2112;
        v39 = v5;
        *(_WORD *)v40 = 1024;
        *(_DWORD *)&v40[2] = Dimensions;
        __int16 v41 = 1024;
        int32_t v42 = HIDWORD(Dimensions);
        __int16 v43 = 1024;
        unsigned int v44 = v25;
        __int16 v45 = 1024;
        int v46 = v28;
        v20 = " [%s] %s:%d %@(%p) Failed to load file at path=%@, width=%d height=%d frameRate=%u error=0x%x";
        v21 = v24;
        uint32_t v22 = 82;
      }
      _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);
      goto LABEL_16;
    }
    *(unint64_t *)&self->_cannedVideoWidth = Dimensions;
    if ((VCStreamInputCaptureSource *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        int64_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v30 = v9;
          __int16 v31 = 2080;
          v32 = "-[VCStreamInputCaptureSource loadCannedVideoReplay]";
          __int16 v33 = 1024;
          int v34 = 113;
          __int16 v35 = 2112;
          v36 = v5;
          objc_super v11 = " [%s] %s:%d Successfully loaded file at path=%@";
          v12 = v10;
          uint32_t v13 = 38;
LABEL_15:
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v8 = (__CFString *)[(VCStreamInputCaptureSource *)self performSelector:sel_logPrefix];
      }
      else {
        v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v30 = v14;
          __int16 v31 = 2080;
          v32 = "-[VCStreamInputCaptureSource loadCannedVideoReplay]";
          __int16 v33 = 1024;
          int v34 = 113;
          __int16 v35 = 2112;
          v36 = v8;
          __int16 v37 = 2048;
          *(void *)v38 = self;
          *(_WORD *)&v38[8] = 2112;
          v39 = v5;
          objc_super v11 = " [%s] %s:%d %@(%p) Successfully loaded file at path=%@";
          v12 = v15;
          uint32_t v13 = 58;
          goto LABEL_15;
        }
      }
    }
  }
LABEL_16:
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  pthread_mutex_destroy(&self->_sinkMutex);
  formatDescription = self->_formatDescription;
  if (formatDescription) {
    CFRelease(formatDescription);
  }
  objc_storeWeak(&self->_delegate, 0);

  v4.receiver = self;
  v4.super_class = (Class)VCStreamInputCaptureSource;
  [(VCVideoCapture *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  int captureSourceID = self->_captureSourceID;
  return captureSourceID == [a3 captureSourceID]
      && CMFormatDescriptionEqual(self->_formatDescription, (CMFormatDescriptionRef)[a3 formatDescription]) != 0;
}

+ (BOOL)readIntegerFromConfig:(id)a3 key:(id)a4 value:(int64_t *)a5
{
  uint64_t v8 = [a3 objectForKeyedSubscript:a4];
  if (a4 && a3 && a5)
  {
    uint64_t v9 = (void *)v8;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *a5 = [v9 integerValue];
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
        +[VCStreamInputCaptureSource readIntegerFromConfig:key:value:]();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v10) {
        return v10;
      }
      +[VCStreamInputCaptureSource readIntegerFromConfig:key:value:]();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v10) {
      return v10;
    }
    +[VCStreamInputCaptureSource readIntegerFromConfig:key:value:]();
  }
  LOBYTE(v10) = 0;
  return v10;
}

+ (BOOL)readUint32FromConfig:(id)a3 key:(id)a4 value:(unsigned int *)a5
{
  uint64_t v8 = [a3 objectForKeyedSubscript:a4];
  if (a4 && a3 && a5)
  {
    uint64_t v9 = (void *)v8;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *a5 = [v9 unsignedIntValue];
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
        +[VCStreamInputCaptureSource readUint32FromConfig:key:value:]();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v10) {
        return v10;
      }
      +[VCStreamInputCaptureSource readUint32FromConfig:key:value:]();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v10) {
      return v10;
    }
    +[VCStreamInputCaptureSource readUint32FromConfig:key:value:]();
  }
  LOBYTE(v10) = 0;
  return v10;
}

- (BOOL)setupFormatWithConfiguration:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_unsigned int frameRate = &self->_frameRate;
  if (!+[VCStreamInputCaptureSource readUint32FromConfig:a3 key:@"framerate" value:&self->_frameRate])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      -[VCStreamInputCaptureSource setupFormatWithConfiguration:].cold.4();
    }
    goto LABEL_25;
  }
  if (!*p_frameRate)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      objc_super v11 = *MEMORY[0x1E4F47A50];
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      [(VCStreamInputCaptureSource *)v10 setupFormatWithConfiguration:v11];
    }
    goto LABEL_25;
  }
  v6 = (const void *)[a3 objectForKeyedSubscript:@"formatDescription"];
  if (v6)
  {
    v7 = v6;
    CFTypeID v8 = CFGetTypeID(v6);
    if (v8 == CMFormatDescriptionGetTypeID())
    {
      self->_formatDescription = (opaqueCMFormatDescription *)CFRetain(v7);
LABEL_6:
      LOBYTE(v9) = 1;
      return v9;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      -[VCStreamInputCaptureSource setupFormatWithConfiguration:]();
    }
    goto LABEL_25;
  }
  int v13 = 0;
  if (!+[VCStreamInputCaptureSource readUint32FromConfig:a3 key:@"type" value:&v13])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      -[VCStreamInputCaptureSource setupFormatWithConfiguration:]();
    }
LABEL_25:
    LOBYTE(v9) = 0;
    return v9;
  }
  if (v13 == 1835365473)
  {
    LOBYTE(v9) = [(VCStreamInputCaptureSource *)self setupDataFormatWithConfiguration:a3];
  }
  else
  {
    if (v13 != 1986618469) {
      goto LABEL_6;
    }
    LOBYTE(v9) = [(VCStreamInputCaptureSource *)self setupVideoFormatWithConfiguration:a3];
  }
  return v9;
}

- (BOOL)setupVideoFormatWithConfiguration:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  CMVideoCodecType v9 = 0;
  if (+[VCStreamInputCaptureSource readUint32FromConfig:a3 key:@"subtype" value:&v9])
  {
    int32_t v8 = 0;
    if (+[VCStreamInputCaptureSource readUint32FromConfig:a3 key:@"width" value:&v8])
    {
      int32_t height = 0;
      if (+[VCStreamInputCaptureSource readUint32FromConfig:a3 key:@"height" value:&height])
      {
        LOBYTE(v5) = CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v9, v8, height, 0, &self->_formatDescription) == 0;
        return v5;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v5) {
          return v5;
        }
        -[VCStreamInputCaptureSource setupVideoFormatWithConfiguration:]();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v5) {
        return v5;
      }
      -[VCStreamInputCaptureSource setupVideoFormatWithConfiguration:]();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v5) {
      return v5;
    }
    -[VCStreamInputCaptureSource setupVideoFormatWithConfiguration:]();
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (BOOL)setupDataFormatWithConfiguration:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  FourCharCode mediaSubType = 0;
  if (+[VCStreamInputCaptureSource readUint32FromConfig:a3 key:@"subtype" value:&mediaSubType])
  {
    LOBYTE(v4) = CMFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x6D657461u, mediaSubType, 0, &self->_formatDescription) == 0;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v4) {
        return v4;
      }
      -[VCStreamInputCaptureSource setupDataFormatWithConfiguration:]();
    }
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)setDelegate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_sinkMutex = &self->_sinkMutex;
  pthread_mutex_lock(&self->_sinkMutex);
  id Weak = objc_loadWeak(&self->_delegate);
  if (Weak == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v18 = v14;
        __int16 v19 = 2080;
        v20 = "-[VCStreamInputCaptureSource setDelegate:]";
        __int16 v21 = 1024;
        int v22 = 235;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Registering the same delegate twice!", buf, 0x1Cu);
      }
    }
    pthread_mutex_unlock(p_sinkMutex);
    goto LABEL_23;
  }
  uint64_t v7 = Weak;
  v16.receiver = self;
  v16.super_class = (Class)VCStreamInputCaptureSource;
  unsigned int v8 = [(VCVideoCapture *)&v16 sinkCount];
  unsigned int v9 = v8;
  if (a3) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  objc_storeWeak(&self->_delegate, a3);
  BOOL v12 = [(VCStreamInputCaptureSource *)self allSinksSuspended];
  pthread_mutex_unlock(p_sinkMutex);
  if (v7) {
    BOOL v13 = v9 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
    [v7 didStopStreamInputCaptureSource];
    if ((v11 & 1) == 0)
    {
LABEL_17:
      if (v12) {
        goto LABEL_18;
      }
      goto LABEL_23;
    }
  }
  [a3 didStartStreamInputCaptureSource];
  if (v12)
  {
LABEL_18:
    [a3 didSuspendStreamInputCaptureSource];
    return;
  }
LABEL_23:
  [a3 didResumeStreamInputCaptureSource];
}

- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a4;
  VCVideoCapture_DistributeVideoFrame((uint64_t)self, (uint64_t)a3, (long long *)&v6.var0, (uint64_t)a5);
  return 1;
}

- (id)copyOnVideoFrameBlock
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__VCStreamInputCaptureSource_copyOnVideoFrameBlock__block_invoke;
  v3[3] = &unk_1E6DB7C50;
  v3[4] = self;
  return _Block_copy(v3);
}

uint64_t __51__VCStreamInputCaptureSource_copyOnVideoFrameBlock__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)a3;
  uint64_t v7 = *(void *)(a3 + 16);
  VCVideoCapture_DistributeVideoFrame(v4, a2, &v6, a4);
  return 1;
}

- (unsigned)addSink:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_sinkMutex = &self->_sinkMutex;
  pthread_mutex_lock(&self->_sinkMutex);
  unsigned int v6 = [(VCVideoCapture *)self sinkCount];
  v12.receiver = self;
  v12.super_class = (Class)VCStreamInputCaptureSource;
  unsigned int v7 = [(VCVideoCapture *)&v12 addSink:a3];
  uint64_t v8 = (void *)MEMORY[0x1E4E56580](&self->_delegate);
  pthread_mutex_unlock(p_sinkMutex);
  if (v7 == 1 && v6 == 0)
  {
    cannedVideoCapture = self->_cannedVideoCapture;
    if (!cannedVideoCapture)
    {
      [v8 didStartStreamInputCaptureSource];
      if (!v8) {
        return v7;
      }
      goto LABEL_9;
    }
    [(VCVideoSource *)cannedVideoCapture setWidth:self->_cannedVideoWidth height:self->_cannedVideoHeight frameRate:self->_frameRate];
    [(VCVideoSource *)self->_cannedVideoCapture startPreview];
  }
  if (v8) {
LABEL_9:
  }
    CFRelease(v8);
  return v7;
}

- (unsigned)removeSink:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_sinkMutex = &self->_sinkMutex;
  pthread_mutex_lock(&self->_sinkMutex);
  unsigned int v6 = [(VCVideoCapture *)self sinkCount];
  v12.receiver = self;
  v12.super_class = (Class)VCStreamInputCaptureSource;
  unsigned int v7 = [(VCVideoCapture *)&v12 removeSink:a3];
  uint64_t v8 = (void *)MEMORY[0x1E4E56580](&self->_delegate);
  pthread_mutex_unlock(p_sinkMutex);
  if (v7) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v6 == 0;
  }
  if (!v9)
  {
    cannedVideoCapture = self->_cannedVideoCapture;
    if (!cannedVideoCapture)
    {
      [v8 didStopStreamInputCaptureSource];
      if (!v8) {
        return v7;
      }
      goto LABEL_8;
    }
    [(VCVideoSource *)cannedVideoCapture stop:1];
  }
  if (v8) {
LABEL_8:
  }
    CFRelease(v8);
  return v7;
}

- (BOOL)allSinksSuspended
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = (void *)[(NSMutableDictionary *)self->_videoSinkState allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * v6) unsignedCharValue] != 1) {
          return 0;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (void)didSuspendVideoSink:(id)a3
{
  p_sinkMutex = &self->_sinkMutex;
  pthread_mutex_lock(&self->_sinkMutex);
  uint64_t v6 = (void *)MEMORY[0x1E4E56580](&self->_delegate);
  BOOL v7 = [(VCStreamInputCaptureSource *)self allSinksSuspended];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_videoSinkState, "setObject:forKeyedSubscript:", &unk_1F3DC6A20, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "hash")));
  if (v7)
  {
    pthread_mutex_unlock(p_sinkMutex);
  }
  else
  {
    BOOL v8 = [(VCStreamInputCaptureSource *)self allSinksSuspended];
    pthread_mutex_unlock(p_sinkMutex);
    if (v8) {
      [v6 didSuspendStreamInputCaptureSource];
    }
  }
  if (v6)
  {
    CFRelease(v6);
  }
}

- (void)didResumeVideoSink:(id)a3
{
  p_sinkMutex = &self->_sinkMutex;
  pthread_mutex_lock(&self->_sinkMutex);
  uint64_t v6 = (void *)MEMORY[0x1E4E56580](&self->_delegate);
  BOOL v7 = [(VCStreamInputCaptureSource *)self allSinksSuspended];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_videoSinkState, "setObject:forKeyedSubscript:", &unk_1F3DC6A38, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "hash")));
  if (!v7)
  {
    pthread_mutex_unlock(p_sinkMutex);
    if (!v6) {
      return;
    }
    goto LABEL_5;
  }
  BOOL v8 = [(VCStreamInputCaptureSource *)self allSinksSuspended];
  pthread_mutex_unlock(p_sinkMutex);
  if (!v8) {
    [v6 didResumeStreamInputCaptureSource];
  }
  if (v6)
  {
LABEL_5:
    CFRelease(v6);
  }
}

- (void)onCaptureScreenFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 orientation:(int)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  v6[1] = 0;
  int v7 = 0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a4;
  VCVideoCapture_DistributeVideoFrame((uint64_t)self, (uint64_t)a3, (long long *)&v5.var0, (uint64_t)v6);
}

- (int)getCaptureFrameRateForSource:(int)a3
{
  if (self->_captureSourceID == a3) {
    return self->_frameRate;
  }
  else {
    return 0;
  }
}

- (int64_t)streamInputID
{
  return self->_streamInputID;
}

- (int)captureSourceID
{
  return self->_captureSourceID;
}

- (void)setCaptureSourceID:(int)a3
{
  self->_int captureSourceID = a3;
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_formatDescription;
}

- (unsigned)frameRate
{
  return self->_frameRate;
}

- (void)initWithCaptureSourceID:configuration:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid captureSourceID=%d", v2, v3, v4, 63);
}

- (void)initWithCaptureSourceID:configuration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the video sink state dictionary", v2, v3, v4, v5, v6);
}

- (void)initWithCaptureSourceID:configuration:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create the format description", v2, v3, v4, v5, v6);
}

- (void)initWithCaptureSourceID:configuration:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to read key=%@", v2, v3, v4, v5, v6);
}

+ (void)readIntegerFromConfig:key:value:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid parameter", v2, v3, v4, v5, v6);
}

+ (void)readIntegerFromConfig:key:value:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Missing key=%@ in config");
}

+ (void)readIntegerFromConfig:key:value:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected class for key=%@");
}

+ (void)readUint32FromConfig:key:value:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid parameter", v2, v3, v4, v5, v6);
}

+ (void)readUint32FromConfig:key:value:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Missing key=%@ in config");
}

+ (void)readUint32FromConfig:key:value:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected class for key=%@");
}

- (void)setupFormatWithConfiguration:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = "-[VCStreamInputCaptureSource setupFormatWithConfiguration:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, a2, a3, " [%s] %s:%d Invalid framerate=%u", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCStreamInputCaptureSource setupFormatWithConfiguration:]" >> 16, 166);
}

- (void)setupFormatWithConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to read key=%@", v2, v3, v4, v5, v6);
}

- (void)setupFormatWithConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  LODWORD(v5) = 171;
  WORD2(v5) = 2048;
  HIWORD(v5) = v0;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Incorrect format type typeId=%lu", v2, v3, v4, v5);
}

- (void)setupFormatWithConfiguration:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to read key=%@", v2, v3, v4, v5, v6);
}

- (void)setupVideoFormatWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to read key=%@", v2, v3, v4, v5, v6);
}

- (void)setupVideoFormatWithConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to read key=%@", v2, v3, v4, v5, v6);
}

- (void)setupVideoFormatWithConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to read key=%@", v2, v3, v4, v5, v6);
}

- (void)setupDataFormatWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_6_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to read key=%@", v2, v3, v4, v5, v6);
}

@end