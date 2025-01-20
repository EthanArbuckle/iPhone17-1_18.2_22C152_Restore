@interface VCCannedAudioInjector
+ (AudioStreamBasicDescription)internalAssetFormatWithFileFormat:(SEL)a3;
+ (BOOL)isAudioAvailable:(id)a3 fileName:(id)a4;
+ (id)defaultAudioFileNameWithFormat:(const AudioStreamBasicDescription *)a3;
+ (id)defaultReaderOutputSettings;
+ (int)setupReader:(id)a3 forAsset:(id)a4 assetAudioFormat:(AudioStreamBasicDescription *)a5 trackOutput:(id *)a6;
- (BOOL)isReadyToInject;
- (BOOL)setupAssetInjectionWithConfig:(id)a3;
- (VCCannedAudioInjector)initWithConfig:(id)a3;
- (id)description;
- (int)allocateSampleBufferWithTrackOutput:(id)a3 assetAudioFormat:(const AudioStreamBasicDescription *)a4 sampleBuffer:(opaqueVCAudioBufferList *)a5;
- (int)loadAudioSamples;
- (int)loadEncodedAudioSamples;
- (int)loadRawAudioSamples;
- (int)loadSamplesFromTrackOutput:(id)a3 audioConverter:(OpaqueAudioConverter *)a4 audioBuffer:(opaqueVCAudioBufferList *)a5;
- (int)processSampleBuffer:(opaqueCMSampleBuffer *)a3 audioConverter:(OpaqueAudioConverter *)a4 audioBuffer:(opaqueVCAudioBufferList *)a5;
- (int)setupAVSyncWithStartHostTime:(double)a3 loopLength:(double)a4;
- (int)setupAudioConverterWithAssetFormat:(const AudioStreamBasicDescription *)a3 audioConverter:(OpaqueAudioConverter *)a4;
- (int)setupSineInjectionWithConfig:(id)a3;
- (unsigned)samplesInLoop;
- (void)cleanupAudioConverterProc;
- (void)completeSetupWithSampleBuffer:(opaqueVCAudioBufferList *)a3;
- (void)dealloc;
- (void)loadEncodedAudioSamples;
- (void)loadRawAudioSamples;
- (void)parseMediaTracksForAsset:(id)a3;
- (void)reportInjectorInitWithPath:(id)a3;
- (void)setAudioConverterProcAudioBufferList:(const AudioBufferList *)a3 blockBuffer:(OpaqueCMBlockBuffer *)a4;
- (void)setIsReadyToInject:(BOOL)a3;
@end

@implementation VCCannedAudioInjector

- (VCCannedAudioInjector)initWithConfig:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)VCCannedAudioInjector;
  v4 = [(VCObject *)&v30 init];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    if ((char *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = v7;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCCannedAudioInjector initWithConfig:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 119;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = a3;
          v9 = " [%s] %s:%d Loading canned audio: config=%@";
          v10 = v8;
          uint32_t v11 = 38;
LABEL_12:
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v6 = (__CFString *)[v4 performSelector:sel_logPrefix];
      }
      else {
        v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          *(void *)&buf[4] = v12;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCCannedAudioInjector initWithConfig:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 119;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v6;
          *(_WORD *)&buf[38] = 2048;
          v32 = v4;
          __int16 v33 = 2112;
          id v34 = a3;
          v9 = " [%s] %s:%d %@(%p) Loading canned audio: config=%@";
          v10 = v13;
          uint32_t v11 = 58;
          goto LABEL_12;
        }
      }
    }
    if ([a3 isValid])
    {
      *((_DWORD *)v4 + 46) = 0;
      v4[188] = [a3 fromBeginning];
      *((void *)v4 + 22) = (id)[a3 path];
      if (a3) {
        [a3 audioFormat];
      }
      else {
        memset(buf, 0, sizeof(buf));
      }
      long long v14 = *(_OWORD *)buf;
      long long v15 = *(_OWORD *)&buf[16];
      *((void *)v4 + 35) = *(void *)&buf[32];
      *(_OWORD *)(v4 + 248) = v14;
      *(_OWORD *)(v4 + 264) = v15;
      *((_DWORD *)v4 + 98) = [a3 loopCount];
      [a3 loopLength];
      *((void *)v4 + 51) = v16;
      *((_DWORD *)v4 + 48) = 0;
      v4[416] = [a3 forceVoiceActive];
      CFTypeRef v17 = (CFTypeRef)[a3 reportingAgent];
      if (v17) {
        CFTypeRef v17 = CFRetain(v17);
      }
      *((void *)v4 + 1) = v17;
      pthread_cond_init((pthread_cond_t *)(v4 + 200), 0);
      objc_msgSend(v4, "reportInjectorInitWithPath:", objc_msgSend(a3, "path"));
      if ([a3 sineWaveFrequencyHz])
      {
        int v18 = [v4 setupSineInjectionWithConfig:a3];
        if (v18 < 0)
        {
          int v19 = v18;
          if ((char *)objc_opt_class() == v4)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCCannedAudioInjector initWithConfig:]();
              }
            }
            goto LABEL_43;
          }
          if (objc_opt_respondsToSelector()) {
            v20 = (__CFString *)[v4 performSelector:sel_logPrefix];
          }
          else {
            v20 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3
            || (uint64_t v28 = VRTraceErrorLogLevelToCSTR(),
                v29 = *MEMORY[0x1E4F47A50],
                !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
          {
LABEL_43:

            v4 = 0;
            goto LABEL_25;
          }
          *(_DWORD *)buf = 136316418;
          *(void *)&buf[4] = v28;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCCannedAudioInjector initWithConfig:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 140;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v20;
          *(_WORD *)&buf[38] = 2048;
          v32 = v4;
          __int16 v33 = 1024;
          LODWORD(v34) = v19;
          v25 = " [%s] %s:%d %@(%p) Failed to setup the injector. result=%x";
          v26 = v29;
          uint32_t v27 = 54;
LABEL_45:
          _os_log_error_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
          goto LABEL_43;
        }
      }
      else
      {
        [v4 setupAssetInjectionWithConfig:a3];
      }
LABEL_25:
      [v5 drain];
      return (VCCannedAudioInjector *)v4;
    }
    if ((char *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCannedAudioInjector initWithConfig:]();
        }
      }
      goto LABEL_43;
    }
    if (objc_opt_respondsToSelector()) {
      v22 = (__CFString *)[v4 performSelector:sel_logPrefix];
    }
    else {
      v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_43;
    }
    uint64_t v23 = VRTraceErrorLogLevelToCSTR();
    v24 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[VCCannedAudioInjector initWithConfig:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 121;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v22;
    *(_WORD *)&buf[38] = 2048;
    v32 = v4;
    v25 = " [%s] %s:%d %@(%p) Config is invalid";
    v26 = v24;
    uint32_t v27 = 48;
    goto LABEL_45;
  }
  return (VCCannedAudioInjector *)v4;
}

- (void)reportInjectorInitWithPath:(id)a3
{
  id v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v6 = v5;
  if (a3)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CB10] URLWithString:a3];
    unint64_t v8 = +[VCFileUtil sizeOfFile:v7];
    +[VCFileUtil contentLengthOfFile:v7];
    double v10 = v9;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v8), @"CAIFS");
    uint32_t v11 = (void *)[NSNumber numberWithDouble:v10 * 1000.0];
  }
  else
  {
    [v5 setObject:&unk_1F3DC5C58 forKeyedSubscript:@"CAIFS"];
    uint32_t v11 = &unk_1F3DC8A80;
  }
  [v6 setObject:v11 forKeyedSubscript:@"CAIFL"];
  [(VCObject *)self reportingAgent];

  reportingGenericEvent();
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((VCCannedAudioInjector *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      id v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v13 = v4;
        __int16 v14 = 2080;
        long long v15 = "-[VCCannedAudioInjector dealloc]";
        __int16 v16 = 1024;
        int v17 = 170;
        v6 = " [%s] %s:%d ";
        uint64_t v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      double v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        long long v15 = "-[VCCannedAudioInjector dealloc]";
        __int16 v16 = 1024;
        int v17 = 170;
        __int16 v18 = 2112;
        int v19 = v3;
        __int16 v20 = 2048;
        v21 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        uint64_t v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  pthread_cond_destroy(&self->_samplesConditional);

  VCAudioBufferList_Destroy((uint64_t *)&self->_sampleBuffer);
  v11.receiver = self;
  v11.super_class = (Class)VCCannedAudioInjector;
  [(VCObject *)&v11 dealloc];
}

- (id)description
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)VCCannedAudioInjector;
  id v4 = [(VCCannedAudioInjector *)&v11 description];
  cannedMoviePath = self->_cannedMoviePath;
  BOOL fromBeginning = self->_fromBeginning;
  [(VCCannedAVSync *)self->_avSync base];
  uint64_t v8 = v7;
  [(VCCannedAVSync *)self->_avSync modulo];
  return (id)[v3 stringWithFormat:@"%@ path=%@, fromBeginning=%d, base=%0.2f, modulo=%0.2f", v4, cannedMoviePath, fromBeginning, v8, v9];
}

- (BOOL)setupAssetInjectionWithConfig:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  int v5 = +[CannedVideoCapture cannedVideoTypeForPath:](CannedVideoCapture, "cannedVideoTypeForPath:", [a3 path]);
  p_assetType = &self->_assetType;
  self->_assetType = v5;
  if ((v5 - 1) >= 2)
  {
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      int v15 = -2142699519;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCannedAudioInjector setupAssetInjectionWithConfig:].cold.4();
        }
      }
      return v15 != 0;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v14 = &stru_1F3D3E450;
    }
    int v15 = -2142699519;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v15 != 0;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    uint64_t v23 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v15 != 0;
    }
    int v24 = *p_assetType;
    int v40 = 136316418;
    uint64_t v41 = v22;
    __int16 v42 = 2080;
    v43 = "-[VCCannedAudioInjector setupAssetInjectionWithConfig:]";
    __int16 v44 = 1024;
    int v45 = 189;
    __int16 v46 = 2112;
    v47 = v14;
    __int16 v48 = 2048;
    v49 = self;
    __int16 v50 = 1024;
    int v51 = v24;
    v25 = " [%s] %s:%d %@(%p) Invalid asset type. assetType=%d";
LABEL_21:
    v26 = v23;
    uint32_t v27 = 54;
LABEL_22:
    _os_log_error_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v40, v27);
    return v15 != 0;
  }
  if (!+[VCCannedAudioInjector isAudioAvailable:fileName:](VCCannedAudioInjector, "isAudioAvailable:fileName:", [a3 path], objc_msgSend(a3, "fileName")))
  {
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      int v15 = -2142699519;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCannedAudioInjector setupAssetInjectionWithConfig:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v32 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
      }
      else {
        v32 = &stru_1F3D3E450;
      }
      int v15 = -2142699519;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v36 = VRTraceErrorLogLevelToCSTR();
        v37 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v40 = 136316162;
          uint64_t v41 = v36;
          __int16 v42 = 2080;
          v43 = "-[VCCannedAudioInjector setupAssetInjectionWithConfig:]";
          __int16 v44 = 1024;
          int v45 = 192;
          __int16 v46 = 2112;
          v47 = v32;
          __int16 v48 = 2048;
          v49 = self;
          v25 = " [%s] %s:%d %@(%p) Audio file not found";
          v26 = v37;
          uint32_t v27 = 48;
          goto LABEL_22;
        }
      }
    }
    return v15 != 0;
  }
  [a3 startHostTime];
  double v8 = v7;
  [a3 loopLength];
  int v10 = [(VCCannedAudioInjector *)self setupAVSyncWithStartHostTime:v8 loopLength:v9];
  if (v10 < 0)
  {
    int v33 = v10;
    int v15 = -2142699519;
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCannedAudioInjector setupAssetInjectionWithConfig:]();
        }
      }
      return v15 != 0;
    }
    if (objc_opt_respondsToSelector()) {
      id v34 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
    }
    else {
      id v34 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v15 != 0;
    }
    uint64_t v38 = VRTraceErrorLogLevelToCSTR();
    uint64_t v23 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v15 != 0;
    }
    int v40 = 136316418;
    uint64_t v41 = v38;
    __int16 v42 = 2080;
    v43 = "-[VCCannedAudioInjector setupAssetInjectionWithConfig:]";
    __int16 v44 = 1024;
    int v45 = 195;
    __int16 v46 = 2112;
    v47 = v34;
    __int16 v48 = 2048;
    v49 = self;
    __int16 v50 = 1024;
    int v51 = v33;
    v25 = " [%s] %s:%d %@(%p) Failed to setup the AV sync. result=%x";
    goto LABEL_21;
  }
  int v11 = [(VCCannedAudioInjector *)self loadAudioSamples];
  uint64_t v12 = (VCCannedAudioInjector *)objc_opt_class();
  if ((v11 & 0x80000000) == 0)
  {
    if (v12 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_28;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      int v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      int v18 = *p_assetType;
      int v40 = 136315906;
      uint64_t v41 = v16;
      __int16 v42 = 2080;
      v43 = "-[VCCannedAudioInjector setupAssetInjectionWithConfig:]";
      __int16 v44 = 1024;
      int v45 = 199;
      __int16 v46 = 1024;
      LODWORD(v47) = v18;
      int v19 = " [%s] %s:%d Canned audio injector loaded successfully. assetType=%d";
      __int16 v20 = v17;
      uint32_t v21 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v13 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_28;
      }
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      int v30 = *p_assetType;
      int v40 = 136316418;
      uint64_t v41 = v28;
      __int16 v42 = 2080;
      v43 = "-[VCCannedAudioInjector setupAssetInjectionWithConfig:]";
      __int16 v44 = 1024;
      int v45 = 199;
      __int16 v46 = 2112;
      v47 = v13;
      __int16 v48 = 2048;
      v49 = self;
      __int16 v50 = 1024;
      int v51 = v30;
      int v19 = " [%s] %s:%d %@(%p) Canned audio injector loaded successfully. assetType=%d";
      __int16 v20 = v29;
      uint32_t v21 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v40, v21);
LABEL_28:
    int v15 = v11;
    return v15 != 0;
  }
  int v15 = -2142699519;
  if (v12 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCannedAudioInjector setupAssetInjectionWithConfig:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v35 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v35 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v39 = VRTraceErrorLogLevelToCSTR();
      uint64_t v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v40 = 136316418;
        uint64_t v41 = v39;
        __int16 v42 = 2080;
        v43 = "-[VCCannedAudioInjector setupAssetInjectionWithConfig:]";
        __int16 v44 = 1024;
        int v45 = 198;
        __int16 v46 = 2112;
        v47 = v35;
        __int16 v48 = 2048;
        v49 = self;
        __int16 v50 = 1024;
        int v51 = v11;
        v25 = " [%s] %s:%d %@(%p) Failed to load the audio samples. result=%x";
        goto LABEL_21;
      }
    }
  }
  return v15 != 0;
}

- (int)loadAudioSamples
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int assetType = self->_assetType;
  if (assetType != 2)
  {
    if (assetType == 1)
    {
      return [(VCCannedAudioInjector *)self loadRawAudioSamples];
    }
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return -2142699505;
      }
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      double v7 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return -2142699505;
      }
      int v8 = self->_assetType;
      int v15 = 136315906;
      uint64_t v16 = v6;
      __int16 v17 = 2080;
      int v18 = "-[VCCannedAudioInjector loadAudioSamples]";
      __int16 v19 = 1024;
      int v20 = 214;
      __int16 v21 = 1024;
      LODWORD(v22) = v8;
      double v9 = " [%s] %s:%d Unknown _assetType=%d";
      int v10 = v7;
      uint32_t v11 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v5 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
      }
      else {
        int v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return -2142699505;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return -2142699505;
      }
      int v14 = self->_assetType;
      int v15 = 136316418;
      uint64_t v16 = v12;
      __int16 v17 = 2080;
      int v18 = "-[VCCannedAudioInjector loadAudioSamples]";
      __int16 v19 = 1024;
      int v20 = 214;
      __int16 v21 = 2112;
      uint64_t v22 = v5;
      __int16 v23 = 2048;
      int v24 = self;
      __int16 v25 = 1024;
      int v26 = v14;
      double v9 = " [%s] %s:%d %@(%p) Unknown _assetType=%d";
      int v10 = v13;
      uint32_t v11 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
    return -2142699505;
  }

  return [(VCCannedAudioInjector *)self loadEncodedAudioSamples];
}

- (int)setupAVSyncWithStartHostTime:(double)a3 loopLength:(double)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a3 >= 0.0)
  {
    avSync = objc_alloc_init(VCCannedAVSync);
    self->_avSync = avSync;
    if (a4 > 0.0)
    {
      [(VCCannedAVSync *)avSync setModulo:a4];
      avSync = self->_avSync;
    }
    [(VCCannedAVSync *)avSync setBase:a3];
    uint64_t v6 = self->_avSync;
  }
  else
  {
    self->_isSharedAVSync = 1;
    uint64_t v6 = (VCCannedAVSync *)+[VCCannedAVSync sharedCannedAVSync];
    self->_avSync = v6;
  }
  [(VCCannedAVSync *)v6 modulo];
  self->_unsigned int samplesInLoop = vcvtad_u64_f64(v9 * self->_outputFormat.mSampleRate);
  if ((VCCannedAudioInjector *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_17;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    unsigned int samplesInLoop = self->_samplesInLoop;
    int v21 = 136316418;
    uint64_t v22 = v11;
    __int16 v23 = 2080;
    int v24 = "-[VCCannedAudioInjector setupAVSyncWithStartHostTime:loopLength:]";
    __int16 v25 = 1024;
    int v26 = 238;
    __int16 v27 = 2112;
    uint64_t v28 = self;
    __int16 v29 = 1024;
    *(_DWORD *)int v30 = samplesInLoop;
    *(_WORD *)&v30[4] = 2048;
    *(double *)&v30[6] = a4;
    int v14 = " [%s] %s:%d injector=%@, _samplesInLoop=%d, loopLength=%f";
    int v15 = v12;
    uint32_t v16 = 54;
    goto LABEL_16;
  }
  if (objc_opt_respondsToSelector()) {
    int v10 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
  }
  else {
    int v10 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    int v18 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v19 = self->_samplesInLoop;
      int v21 = 136316930;
      uint64_t v22 = v17;
      __int16 v23 = 2080;
      int v24 = "-[VCCannedAudioInjector setupAVSyncWithStartHostTime:loopLength:]";
      __int16 v25 = 1024;
      int v26 = 238;
      __int16 v27 = 2112;
      uint64_t v28 = (VCCannedAudioInjector *)v10;
      __int16 v29 = 2048;
      *(void *)int v30 = self;
      *(_WORD *)&v30[8] = 2112;
      *(void *)&v30[10] = self;
      __int16 v31 = 1024;
      unsigned int v32 = v19;
      __int16 v33 = 2048;
      double v34 = a4;
      int v14 = " [%s] %s:%d %@(%p) injector=%@, _samplesInLoop=%d, loopLength=%f";
      int v15 = v18;
      uint32_t v16 = 74;
LABEL_16:
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v21, v16);
    }
  }
LABEL_17:
  if (self->_avSync) {
    return 0;
  }
  else {
    return -2142699517;
  }
}

+ (BOOL)isAudioAvailable:(id)a3 fileName:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v6 = +[CannedVideoCapture cannedVideoTypeForPath:](CannedVideoCapture, "cannedVideoTypeForPath:");
  if (v6 == 1)
  {
    uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", a3, a4];
    v13.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v13.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v20.st_blksize = v13;
    *(timespec *)v20.st_qspare = v13;
    v20.st_birthtimespec = v13;
    *(timespec *)&v20.st_size = v13;
    v20.st_mtimespec = v13;
    v20.st_ctimespec = v13;
    *(timespec *)&v20.st_uid = v13;
    v20.st_atimespec = v13;
    *(timespec *)&v20.st_dev = v13;
    int v14 = stat((const char *)[v12 UTF8String], &v20);

    if (!v14 && (v20.st_mode & 0xF000) == 0x8000) {
      goto LABEL_9;
    }
LABEL_14:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v15) {
        return v15;
      }
      +[VCCannedAudioInjector isAudioAvailable:fileName:]();
    }
    LOBYTE(v15) = 0;
    return v15;
  }
  if (v6 != 2) {
    goto LABEL_14;
  }
  double v7 = (void *)[MEMORY[0x1E4F1CB10] URLWithString:a3];
  id v8 = objc_alloc(MEMORY[0x1E4F166C8]);
  uint64_t v18 = *MEMORY[0x1E4F16148];
  uint64_t v19 = MEMORY[0x1E4F1CC38];
  double v9 = objc_msgSend(v8, "initWithURL:options:", v7, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCCannedAudioInjector isAudioAvailable:fileName:](v16, v7);
      }
    }
    goto LABEL_14;
  }
  int v10 = v9;
  uint64_t v11 = (void *)[v9 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
  if (!v11 || ![v11 count])
  {

    goto LABEL_14;
  }

LABEL_9:
  LOBYTE(v15) = 1;
  return v15;
}

- (void)completeSetupWithSampleBuffer:(opaqueVCAudioBufferList *)a3
{
  p_samplesMutex = &self->_samplesMutex;
  os_unfair_lock_lock(&self->_samplesMutex);
  int v6 = *a3;
  self->_sampleBuffer = *a3;
  self->_audioSampleCount = VCAudioBufferList_GetSampleCount((uint64_t)v6);
  os_unfair_lock_unlock(p_samplesMutex);
  *a3 = 0;
  [(VCCannedAudioInjector *)self setIsReadyToInject:1];
  [(VCObject *)self reportingAgent];

  reportingGenericEvent();
}

- (void)setAudioConverterProcAudioBufferList:(const AudioBufferList *)a3 blockBuffer:(OpaqueCMBlockBuffer *)a4
{
  long long v4 = *(_OWORD *)&a3->mNumberBuffers;
  self->_audioConverterProc.audioBufferList.mBuffers[0].mData = a3->mBuffers[0].mData;
  *(_OWORD *)&self->_audioConverterProc.audioBufferList.mNumberBuffers = v4;
  blockBuffer = self->_audioConverterProc.blockBuffer;
  self->_audioConverterProc.blockBuffer = a4;
  if (a4) {
    CFRetain(a4);
  }
  if (blockBuffer)
  {
    CFRelease(blockBuffer);
  }
}

- (void)cleanupAudioConverterProc
{
  p_audioConverterProc = &self->_audioConverterProc;
  blockBuffer = self->_audioConverterProc.blockBuffer;
  if (blockBuffer)
  {
    CFRelease(blockBuffer);
    p_audioConverterProc->blockBuffer = 0;
  }
  previousBlockBuffer = p_audioConverterProc->previousBlockBuffer;
  if (previousBlockBuffer)
  {
    CFRelease(previousBlockBuffer);
    p_audioConverterProc->previousBlockBuffer = 0;
  }
  p_audioConverterProc->audioBufferList.mBuffers[0].mData = 0;
  p_audioConverterProc->audioBufferList.mBuffers[0].mDataByteSize = 0;
}

+ (AudioStreamBasicDescription)internalAssetFormatWithFileFormat:(SEL)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  UInt32 mChannelsPerFrame = a4->mChannelsPerFrame;
  retstr->mSampleRate = a4->mSampleRate;
  *(void *)&retstr->mFormatID = 0xC6C70636DLL;
  retstr->mBytesPerPacket = 2 * mChannelsPerFrame;
  retstr->mFramesPerPacket = 1;
  retstr->mBytesPerFrame = 2 * mChannelsPerFrame;
  retstr->UInt32 mChannelsPerFrame = mChannelsPerFrame;
  *(void *)&retstr->mBitsPerChannel = 16;
  long long v37 = 0u;
  long long v38 = 0u;
  *(_OWORD *)__str = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  *(_OWORD *)__int16 v31 = 0u;
  long long v32 = 0u;
  if ((id)objc_opt_class() == a2)
  {
    result = (AudioStreamBasicDescription *)VRTraceGetErrorLogLevelForModule();
    if ((int)result >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      result = (AudioStreamBasicDescription *)os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      if (result)
      {
        int v17 = 136316162;
        uint64_t v18 = v10;
        __int16 v19 = 2080;
        stat v20 = "+[VCCannedAudioInjector internalAssetFormatWithFileFormat:]";
        __int16 v21 = 1024;
        int v22 = 331;
        __int16 v23 = 2080;
        int v24 = FormatToCStr((uint64_t)a4, __str, 0x40uLL);
        __int16 v25 = 2080;
        int v26 = FormatToCStr((uint64_t)retstr, v31, 0x40uLL);
        uint64_t v12 = " [%s] %s:%d assetAudioFormat=%s, internalAssetFormat=%s";
        timespec v13 = v11;
        uint32_t v14 = 48;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v8 = (__CFString *)[a2 performSelector:sel_logPrefix];
    }
    else {
      id v8 = &stru_1F3D3E450;
    }
    result = (AudioStreamBasicDescription *)VRTraceGetErrorLogLevelForModule();
    if ((int)result >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      result = (AudioStreamBasicDescription *)os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      if (result)
      {
        int v17 = 136316674;
        uint64_t v18 = v15;
        __int16 v19 = 2080;
        stat v20 = "+[VCCannedAudioInjector internalAssetFormatWithFileFormat:]";
        __int16 v21 = 1024;
        int v22 = 331;
        __int16 v23 = 2112;
        int v24 = (char *)v8;
        __int16 v25 = 2048;
        int v26 = a2;
        __int16 v27 = 2080;
        uint64_t v28 = FormatToCStr((uint64_t)a4, __str, 0x40uLL);
        __int16 v29 = 2080;
        int v30 = FormatToCStr((uint64_t)retstr, v31, 0x40uLL);
        uint64_t v12 = " [%s] %s:%d %@(%p) assetAudioFormat=%s, internalAssetFormat=%s";
        timespec v13 = v16;
        uint32_t v14 = 68;
        goto LABEL_11;
      }
    }
  }
  return result;
}

+ (id)defaultReaderOutputSettings
{
  v6[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F151F0];
  v5[0] = *MEMORY[0x1E4F151E0];
  v5[1] = v2;
  v6[0] = &unk_1F3DC5C70;
  v6[1] = &unk_1F3DC5C88;
  uint64_t v3 = *MEMORY[0x1E4F151F8];
  v5[2] = *MEMORY[0x1E4F15208];
  v5[3] = v3;
  v6[2] = MEMORY[0x1E4F1CC28];
  v6[3] = MEMORY[0x1E4F1CC28];
  v5[4] = *MEMORY[0x1E4F15218];
  v6[4] = MEMORY[0x1E4F1CC28];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
}

+ (int)setupReader:(id)a3 forAsset:(id)a4 assetAudioFormat:(AudioStreamBasicDescription *)a5 trackOutput:(id *)a6
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = [a1 defaultReaderOutputSettings];
  if (!v11)
  {
    if ((id)objc_opt_class() == a1)
    {
      int v21 = -2142699517;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]();
        }
      }
      return v21;
    }
    if (objc_opt_respondsToSelector()) {
      int v26 = (__CFString *)[a1 performSelector:sel_logPrefix];
    }
    else {
      int v26 = &stru_1F3D3E450;
    }
    int v21 = -2142699517;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v21;
    }
    uint64_t v48 = VRTraceErrorLogLevelToCSTR();
    v49 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v21;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = v48;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "+[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 351;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v26;
    *(_WORD *)&buf[38] = 2048;
    id v76 = a1;
    __int16 v31 = " [%s] %s:%d %@(%p) Failed to allocate read settings";
    long long v32 = v49;
    goto LABEL_52;
  }
  uint64_t v12 = (void *)v11;
  timespec v13 = (void *)[a4 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
  uint32_t v14 = v13;
  if (!v13 || ![v13 count])
  {
    if ((id)objc_opt_class() != a1)
    {
      if (objc_opt_respondsToSelector()) {
        int v24 = (__CFString *)[a1 performSelector:sel_logPrefix];
      }
      else {
        int v24 = &stru_1F3D3E450;
      }
      int v21 = -2142699510;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return v21;
      }
      uint64_t v38 = VRTraceErrorLogLevelToCSTR();
      uint64_t v39 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return v21;
      }
      *(_DWORD *)buf = 136316674;
      *(void *)&uint8_t buf[4] = v38;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "+[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 354;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v24;
      *(_WORD *)&buf[38] = 2048;
      id v76 = a1;
      __int16 v77 = 2112;
      id v78 = v14;
      __int16 v79 = 2112;
      id v80 = a4;
      __int16 v31 = " [%s] %s:%d %@(%p) Failed to get audioTracks=%@ from asset=%@";
      long long v32 = v39;
      uint32_t v40 = 68;
LABEL_53:
      _os_log_error_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_ERROR, v31, buf, v40);
      return v21;
    }
    int v21 = -2142699510;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v21;
    }
    uint64_t v29 = VRTraceErrorLogLevelToCSTR();
    int v30 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v21;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = v29;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "+[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 354;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v14;
    *(_WORD *)&buf[38] = 2112;
    id v76 = a4;
    __int16 v31 = " [%s] %s:%d Failed to get audioTracks=%@ from asset=%@";
    long long v32 = v30;
LABEL_52:
    uint32_t v40 = 48;
    goto LABEL_53;
  }
  uint64_t v15 = [v14 objectAtIndex:0];
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    int v17 = (void *)[MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v15 outputSettings:v12];
    if (v17)
    {
      uint64_t v18 = v17;
      [v17 setAlwaysCopiesSampleData:0];
      [a3 setPreparesMediaDataForRealTimeConsumption:1];
      [a3 addOutput:v18];
      __int16 v19 = (void *)[v16 formatDescriptions];
      stat v20 = v19;
      if (v19 && [v19 count])
      {
        +[VCCannedAudioInjector internalAssetFormatWithFileFormat:](VCCannedAudioInjector, "internalAssetFormatWithFileFormat:", CMAudioFormatDescriptionGetStreamBasicDescription((CMAudioFormatDescriptionRef)[v20 objectAtIndex:0]));
        int v21 = 0;
        long long v22 = *(_OWORD *)&buf[16];
        *(_OWORD *)&a5->mSampleRate = *(_OWORD *)buf;
        *(_OWORD *)&a5->mBytesPerPacket = v22;
        *(void *)&a5->mBitsPerChannel = *(void *)&buf[32];
        *a6 = v18;
        return v21;
      }
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          return 0;
        }
        uint64_t v33 = VRTraceErrorLogLevelToCSTR();
        long long v34 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          return 0;
        }
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "+[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 368;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v20;
        *(_WORD *)&buf[38] = 2112;
        id v76 = v16;
        __int16 v77 = 2112;
        id v78 = a4;
        uint64_t v35 = " [%s] %s:%d Failed to retrieve the formatDescriptions=%@ for track=%@ asset=%@";
        long long v36 = v34;
        uint32_t v37 = 58;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          __int16 v25 = (__CFString *)[a1 performSelector:sel_logPrefix];
        }
        else {
          __int16 v25 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          return 0;
        }
        uint64_t v41 = VRTraceErrorLogLevelToCSTR();
        __int16 v42 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          return 0;
        }
        *(_DWORD *)buf = 136316930;
        *(void *)&uint8_t buf[4] = v41;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "+[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 368;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v25;
        *(_WORD *)&buf[38] = 2048;
        id v76 = a1;
        __int16 v77 = 2112;
        id v78 = v20;
        __int16 v79 = 2112;
        id v80 = v16;
        __int16 v81 = 2112;
        id v82 = a4;
        uint64_t v35 = " [%s] %s:%d %@(%p) Failed to retrieve the formatDescriptions=%@ for track=%@ asset=%@";
        long long v36 = v42;
        uint32_t v37 = 78;
      }
      _os_log_error_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_ERROR, v35, buf, v37);
      return 0;
    }
    int v21 = -2142699510;
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        __str = 0;
        int v45 = (const char *)objc_msgSend((id)objc_msgSend(v16, "description"), "UTF8String");
        __int16 v46 = (const char *)objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String");
        v47 = a4 ? (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String") : "<nil>";
        asprintf(&__str, "Instantiation of AVAssetReaderTrackOutput for track=%s with settings=%s failed for asset=%s", v45, v46, v47);
        if (__str)
        {
          __lasts = 0;
          v69 = strtok_r(__str, "\n", &__lasts);
          v70 = (os_log_t *)MEMORY[0x1E4F47A50];
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v71 = VRTraceErrorLogLevelToCSTR();
              v72 = *v70;
              if (os_log_type_enabled(*v70, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                *(void *)&uint8_t buf[4] = v71;
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "+[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 360;
                *(_WORD *)&buf[28] = 2080;
                *(void *)&buf[30] = "";
                *(_WORD *)&buf[38] = 2080;
                id v76 = v69;
                _os_log_error_impl(&dword_1E1EA4000, v72, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            v69 = strtok_r(0, "\n", &__lasts);
          }
          while (v69);
          goto LABEL_93;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v28 = (__CFString *)[a1 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v28 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        __str = 0;
        v53 = (const char *)[(__CFString *)v28 UTF8String];
        v54 = (const char *)objc_msgSend((id)objc_msgSend(v16, "description"), "UTF8String");
        v55 = (const char *)objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String");
        v56 = a4 ? (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String") : "<nil>";
        asprintf(&__str, "%s(%p) Instantiation of AVAssetReaderTrackOutput for track=%s with settings=%s failed for asset=%s", v53, a1, v54, v55, v56);
        if (__str)
        {
          __lasts = 0;
          v61 = strtok_r(__str, "\n", &__lasts);
          v62 = (os_log_t *)MEMORY[0x1E4F47A50];
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v63 = VRTraceErrorLogLevelToCSTR();
              v64 = *v62;
              if (os_log_type_enabled(*v62, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                *(void *)&uint8_t buf[4] = v63;
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "+[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 360;
                *(_WORD *)&buf[28] = 2080;
                *(void *)&buf[30] = "";
                *(_WORD *)&buf[38] = 2080;
                id v76 = v61;
                _os_log_error_impl(&dword_1E1EA4000, v64, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            v61 = strtok_r(0, "\n", &__lasts);
          }
          while (v61);
LABEL_93:
          free(__str);
        }
      }
    }
  }
  else if ((id)objc_opt_class() == a1)
  {
    int v21 = -2142699510;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      __str = 0;
      v43 = (const char *)objc_msgSend((id)objc_msgSend(v14, "description"), "UTF8String");
      __int16 v44 = a4 ? (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "Failed to get audio track from tracks=%s asset=%s", v43, v44);
      if (__str)
      {
        __lasts = 0;
        v65 = strtok_r(__str, "\n", &__lasts);
        v66 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v67 = VRTraceErrorLogLevelToCSTR();
            v68 = *v66;
            if (os_log_type_enabled(*v66, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              *(void *)&uint8_t buf[4] = v67;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "+[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 357;
              *(_WORD *)&buf[28] = 2080;
              *(void *)&buf[30] = "";
              *(_WORD *)&buf[38] = 2080;
              id v76 = v65;
              _os_log_error_impl(&dword_1E1EA4000, v68, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v65 = strtok_r(0, "\n", &__lasts);
        }
        while (v65);
        goto LABEL_93;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v27 = (__CFString *)[a1 performSelector:sel_logPrefix];
    }
    else {
      __int16 v27 = &stru_1F3D3E450;
    }
    int v21 = -2142699510;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      __str = 0;
      __int16 v50 = (const char *)[(__CFString *)v27 UTF8String];
      int v51 = (const char *)objc_msgSend((id)objc_msgSend(v14, "description"), "UTF8String");
      uint64_t v52 = a4 ? (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s(%p) Failed to get audio track from tracks=%s asset=%s", v50, a1, v51, v52);
      if (__str)
      {
        __lasts = 0;
        v57 = strtok_r(__str, "\n", &__lasts);
        v58 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v59 = VRTraceErrorLogLevelToCSTR();
            v60 = *v58;
            if (os_log_type_enabled(*v58, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              *(void *)&uint8_t buf[4] = v59;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "+[VCCannedAudioInjector setupReader:forAsset:assetAudioFormat:trackOutput:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 357;
              *(_WORD *)&buf[28] = 2080;
              *(void *)&buf[30] = "";
              *(_WORD *)&buf[38] = 2080;
              id v76 = v57;
              _os_log_error_impl(&dword_1E1EA4000, v60, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v57 = strtok_r(0, "\n", &__lasts);
        }
        while (v57);
        goto LABEL_93;
      }
    }
  }
  return v21;
}

- (int)setupAudioConverterWithAssetFormat:(const AudioStreamBasicDescription *)a3 audioConverter:(OpaqueAudioConverter *)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  p_outputFormat = &self->_outputFormat;
  long long v8 = *(_OWORD *)&self->_outputFormat.mBytesPerPacket;
  *(_OWORD *)&v42.mSampleRate = *(_OWORD *)&self->_outputFormat.mSampleRate;
  *(_OWORD *)&v42.mBytesPerPacket = v8;
  *(void *)&v42.mBitsPerChannel = *(void *)&self->_outputFormat.mBitsPerChannel;
  OSStatus v9 = AudioConverterNew(a3, &v42, a4);
  if (v9)
  {
    OSStatus v26 = v9;
    int v17 = -2142699505;
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCannedAudioInjector setupAudioConverterWithAssetFormat:audioConverter:]();
        }
      }
      return v17;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v27 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v27 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v17;
    }
    uint64_t v29 = VRTraceErrorLogLevelToCSTR();
    int v30 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v17;
    }
    int inPropertyData = 136316418;
    uint64_t v48 = v29;
    __int16 v49 = 2080;
    __int16 v50 = "-[VCCannedAudioInjector setupAudioConverterWithAssetFormat:audioConverter:]";
    __int16 v51 = 1024;
    int v52 = 385;
    __int16 v53 = 2112;
    *(void *)v54 = v27;
    *(_WORD *)&v54[8] = 2048;
    v55 = self;
    __int16 v56 = 1024;
    *(_DWORD *)v57 = v26;
    __int16 v31 = " [%s] %s:%d %@(%p) Failed to create the audio converter! err=%d";
    long long v32 = v30;
    uint32_t v33 = 54;
LABEL_38:
    _os_log_error_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_ERROR, v31, (uint8_t *)&inPropertyData, v33);
    return v17;
  }
  UInt32 mChannelsPerFrame = p_outputFormat->mChannelsPerFrame;
  if (mChannelsPerFrame == a3->mChannelsPerFrame) {
    goto LABEL_5;
  }
  if (mChannelsPerFrame != 1)
  {
    int v17 = -2142699505;
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return v17;
      }
      uint64_t v34 = VRTraceErrorLogLevelToCSTR();
      uint64_t v35 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return v17;
      }
      UInt32 v36 = a3->mChannelsPerFrame;
      UInt32 v37 = p_outputFormat->mChannelsPerFrame;
      int inPropertyData = 136316162;
      uint64_t v48 = v34;
      __int16 v49 = 2080;
      __int16 v50 = "-[VCCannedAudioInjector setupAudioConverterWithAssetFormat:audioConverter:]";
      __int16 v51 = 1024;
      int v52 = 389;
      __int16 v53 = 1024;
      *(_DWORD *)v54 = v36;
      *(_WORD *)&v54[4] = 1024;
      *(_DWORD *)&v54[6] = v37;
      __int16 v31 = " [%s] %s:%d Unable to map the asset channels=%d to output channels=%d!";
      long long v32 = v35;
      uint32_t v33 = 40;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v28 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v28 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return v17;
      }
      uint64_t v38 = VRTraceErrorLogLevelToCSTR();
      uint64_t v39 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return v17;
      }
      UInt32 v40 = a3->mChannelsPerFrame;
      UInt32 v41 = p_outputFormat->mChannelsPerFrame;
      int inPropertyData = 136316674;
      uint64_t v48 = v38;
      __int16 v49 = 2080;
      __int16 v50 = "-[VCCannedAudioInjector setupAudioConverterWithAssetFormat:audioConverter:]";
      __int16 v51 = 1024;
      int v52 = 389;
      __int16 v53 = 2112;
      *(void *)v54 = v28;
      *(_WORD *)&v54[8] = 2048;
      v55 = self;
      __int16 v56 = 1024;
      *(_DWORD *)v57 = v40;
      *(_WORD *)&v57[4] = 1024;
      *(_DWORD *)&v57[6] = v41;
      __int16 v31 = " [%s] %s:%d %@(%p) Unable to map the asset channels=%d to output channels=%d!";
      long long v32 = v39;
      uint32_t v33 = 60;
    }
    goto LABEL_38;
  }
  int inPropertyData = 1;
  AudioConverterSetProperty(*a4, 0x63686D70u, 4u, &inPropertyData);
LABEL_5:
  p_streamDesc = &self->_audioConverterProc.streamDesc;
  uint64_t v12 = *(void *)&a3->mBitsPerChannel;
  long long v13 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_OWORD *)&self->_audioConverterProc.streamDesc.mSampleRate = *(_OWORD *)&a3->mSampleRate;
  *(_OWORD *)&self->_audioConverterProc.streamDesc.mBytesPerPacket = v13;
  *(void *)&self->_audioConverterProc.streamDesc.mBitsPerChannel = v12;
  *(_OWORD *)__str = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  if ((VCCannedAudioInjector *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    int v17 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = FormatToCStr((uint64_t)p_streamDesc, __str, 0x40uLL);
      int inPropertyData = 136315906;
      uint64_t v48 = v15;
      __int16 v49 = 2080;
      __int16 v50 = "-[VCCannedAudioInjector setupAudioConverterWithAssetFormat:audioConverter:]";
      __int16 v51 = 1024;
      int v52 = 395;
      __int16 v53 = 2080;
      *(void *)v54 = v18;
      __int16 v19 = " [%s] %s:%d streamDescription=%s";
      stat v20 = v16;
      uint32_t v21 = 38;
LABEL_15:
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&inPropertyData, v21);
      return 0;
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint32_t v14 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
    }
    else {
      uint32_t v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    __int16 v23 = *MEMORY[0x1E4F47A50];
    int v17 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v24 = FormatToCStr((uint64_t)&self->_audioConverterProc.streamDesc, __str, 0x40uLL);
      int inPropertyData = 136316418;
      uint64_t v48 = v22;
      __int16 v49 = 2080;
      __int16 v50 = "-[VCCannedAudioInjector setupAudioConverterWithAssetFormat:audioConverter:]";
      __int16 v51 = 1024;
      int v52 = 395;
      __int16 v53 = 2112;
      *(void *)v54 = v14;
      *(_WORD *)&v54[8] = 2048;
      v55 = self;
      __int16 v56 = 2080;
      *(void *)v57 = v24;
      __int16 v19 = " [%s] %s:%d %@(%p) streamDescription=%s";
      stat v20 = v23;
      uint32_t v21 = 58;
      goto LABEL_15;
    }
  }
  return v17;
}

- (int)processSampleBuffer:(opaqueCMSampleBuffer *)a3 audioConverter:(OpaqueAudioConverter *)a4 audioBuffer:(opaqueVCAudioBufferList *)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  CMBlockBufferRef blockBufferOut = 0;
  memset(&bufferListOut, 170, sizeof(bufferListOut));
  OSStatus AudioBufferListWithRetainedBlockBuffer = CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(a3, 0, &bufferListOut, 0x18uLL, 0, 0, 1u, &blockBufferOut);
  if (AudioBufferListWithRetainedBlockBuffer)
  {
    OSStatus v32 = AudioBufferListWithRetainedBlockBuffer;
    int v25 = -2142699510;
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]();
        }
      }
      goto LABEL_28;
    }
    if (objc_opt_respondsToSelector()) {
      uint32_t v33 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
    }
    else {
      uint32_t v33 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_28;
    }
    uint64_t v38 = VRTraceErrorLogLevelToCSTR();
    uint64_t v39 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v47 = v38;
    __int16 v48 = 2080;
    __int16 v49 = "-[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]";
    __int16 v50 = 1024;
    int v51 = 407;
    __int16 v52 = 2112;
    *(void *)__int16 v53 = v33;
    *(_WORD *)&v53[8] = 2048;
    v54 = self;
    __int16 v55 = 1024;
    OSStatus v56 = v32;
    uint64_t v29 = " [%s] %s:%d %@(%p) CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer failed! err=%d";
    int v30 = v39;
    uint32_t v31 = 54;
LABEL_32:
    _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
    goto LABEL_28;
  }
  [(VCCannedAudioInjector *)self setAudioConverterProcAudioBufferList:&bufferListOut blockBuffer:blockBufferOut];
  UInt32 ioPropertyDataSize = 4;
  UInt32 outPropertyData = bufferListOut.mBuffers[0].mDataByteSize;
  OSStatus Property = AudioConverterGetProperty(a4, 0x636F6273u, &ioPropertyDataSize, &outPropertyData);
  if (Property)
  {
    OSStatus v10 = Property;
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v11 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        long long v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v47 = v12;
          __int16 v48 = 2080;
          __int16 v49 = "-[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]";
          __int16 v50 = 1024;
          int v51 = 419;
          __int16 v52 = 2112;
          *(void *)__int16 v53 = v11;
          *(_WORD *)&v53[8] = 2048;
          v54 = self;
          __int16 v55 = 1024;
          OSStatus v56 = v10;
          _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Fetching kAudioConverterPropertyCalculateOutputBufferSize failed with status=%d", buf, 0x36u);
        }
      }
    }
  }
  uint64_t AudioBufferList = VCAudioBufferList_GetAudioBufferList((uint64_t)a5);
  uint64_t v15 = *(void **)(AudioBufferList + 16);
  *(_OWORD *)&outOutputData.uint64_t mNumberBuffers = *(_OWORD *)AudioBufferList;
  outOutputData.mBuffers[0].mData = v15;
  int SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)a5);
  unsigned int SampleCapacity = VCAudioBufferList_GetSampleCapacity((uint64_t)a5);
  UInt32 v18 = outPropertyData;
  UInt32 mBytesPerPacket = self->_outputFormat.mBytesPerPacket;
  int v20 = outPropertyData / mBytesPerPacket;
  UInt32 ioOutputDataPacketSize = outPropertyData / mBytesPerPacket;
  if (outPropertyData / mBytesPerPacket + SampleCount > SampleCapacity)
  {
    unsigned int v34 = SampleCapacity;
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      int v25 = -2142699517;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_28;
      }
      uint64_t v36 = VRTraceErrorLogLevelToCSTR();
      UInt32 v37 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v47 = v36;
      __int16 v48 = 2080;
      __int16 v49 = "-[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]";
      __int16 v50 = 1024;
      int v51 = 427;
      __int16 v52 = 1024;
      *(_DWORD *)__int16 v53 = v34 - SampleCount;
      *(_WORD *)&v53[4] = 1024;
      *(_DWORD *)&v53[6] = v20;
      LOWORD(v54) = 1024;
      *(_DWORD *)((char *)&v54 + 2) = v34;
      uint64_t v29 = " [%s] %s:%d Didn't preallocate enough memory for the asset! remainingSampleCapacity=%u, neededSamples=%u, totalCapacity=%u";
      int v30 = v37;
      uint32_t v31 = 46;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v35 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v35 = &stru_1F3D3E450;
      }
      int v25 = -2142699517;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_28;
      }
      uint64_t v40 = VRTraceErrorLogLevelToCSTR();
      UInt32 v41 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 136316930;
      uint64_t v47 = v40;
      __int16 v48 = 2080;
      __int16 v49 = "-[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]";
      __int16 v50 = 1024;
      int v51 = 427;
      __int16 v52 = 2112;
      *(void *)__int16 v53 = v35;
      *(_WORD *)&v53[8] = 2048;
      v54 = self;
      __int16 v55 = 1024;
      OSStatus v56 = v34 - SampleCount;
      __int16 v57 = 1024;
      int v58 = v20;
      __int16 v59 = 1024;
      unsigned int v60 = v34;
      uint64_t v29 = " [%s] %s:%d %@(%p) Didn't preallocate enough memory for the asset! remainingSampleCapacity=%u, neededSamples"
            "=%u, totalCapacity=%u";
      int v30 = v41;
      uint32_t v31 = 66;
    }
    goto LABEL_32;
  }
  uint64_t mNumberBuffers = outOutputData.mNumberBuffers;
  if (outOutputData.mNumberBuffers)
  {
    uint64_t v22 = mBytesPerPacket * SampleCount;
    p_mData = &outOutputData.mBuffers[0].mData;
    do
    {
      *p_mData = (char *)*p_mData + v22;
      *((_DWORD *)p_mData - 1) = v18;
      p_mData += 2;
      --mNumberBuffers;
    }
    while (mNumberBuffers);
  }
  if (!AudioConverterFillComplexBuffer(a4, (AudioConverterComplexInputDataProc)_VCCannedAudioInjector_AudioConverterInput, &self->_audioConverterProc, &ioOutputDataPacketSize, &outOutputData, 0))
  {
    VCAudioBufferList_SetSampleCount((uint64_t)a5, ioOutputDataPacketSize + SampleCount);
    pthread_cond_signal(&self->_samplesConditional);
    int v25 = 0;
    goto LABEL_28;
  }
  if ((VCCannedAudioInjector *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      int v24 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
    }
    else {
      int v24 = &stru_1F3D3E450;
    }
    int v25 = -2142699510;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_28;
    }
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    __int16 v27 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v47 = v26;
    __int16 v48 = 2080;
    __int16 v49 = "-[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]";
    __int16 v50 = 1024;
    int v51 = 438;
    __int16 v52 = 2112;
    *(void *)__int16 v53 = v24;
    *(_WORD *)&v53[8] = 2048;
    v54 = self;
    uint64_t v29 = " [%s] %s:%d %@(%p) AudioConverterFillComplexBuffer failed!";
    int v30 = v27;
    uint32_t v31 = 48;
    goto LABEL_32;
  }
  int v25 = -2142699510;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]();
    }
  }
LABEL_28:
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  return v25;
}

- (int)loadSamplesFromTrackOutput:(id)a3 audioConverter:(OpaqueAudioConverter *)a4 audioBuffer:(opaqueVCAudioBufferList *)a5
{
  uint64_t v9 = [a3 copyNextSampleBuffer];
  if (v9)
  {
    OSStatus v10 = (const void *)v9;
    do
    {
      int v11 = [(VCCannedAudioInjector *)self processSampleBuffer:v10 audioConverter:a4 audioBuffer:a5];
      CFRelease(v10);
      if (v11 < 0) {
        break;
      }
      OSStatus v10 = (const void *)[a3 copyNextSampleBuffer];
    }
    while (v10);
  }
  else
  {
    int v11 = 0;
  }
  [(VCCannedAudioInjector *)self cleanupAudioConverterProc];
  return v11;
}

- (int)allocateSampleBufferWithTrackOutput:(id)a3 assetAudioFormat:(const AudioStreamBasicDescription *)a4 sampleBuffer:(opaqueVCAudioBufferList *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v22[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22[1] = v7;
  long long v8 = objc_msgSend(a3, "track", v7, 0xAAAAAAAAAAAAAAAALL);
  if (v8) {
    [v8 timeRange];
  }
  else {
    memset(v22, 0, sizeof(v22));
  }
  *(_OWORD *)time = *(_OWORD *)((char *)v22 + 8);
  *(void *)&time[16] = *((void *)&v22[1] + 1);
  double Seconds = CMTimeGetSeconds((CMTime *)time);
  p_outputFormat = &self->_outputFormat;
  int v11 = ((Seconds + 1.0) * self->_outputFormat.mSampleRate);
  if ((VCCannedAudioInjector *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_15;
    }
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint32_t v14 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)time = 136316162;
    *(void *)&time[4] = v13;
    *(_WORD *)&time[12] = 2080;
    *(void *)&time[14] = "-[VCCannedAudioInjector allocateSampleBufferWithTrackOutput:assetAudioFormat:sampleBuffer:]";
    *(_WORD *)&time[22] = 1024;
    *(_DWORD *)&time[24] = 465;
    *(_WORD *)&time[28] = 1024;
    *(_DWORD *)&time[30] = v11;
    *(_WORD *)&time[34] = 2048;
    *(double *)&time[36] = Seconds;
    uint64_t v15 = " [%s] %s:%d Estimated sampleCount=%u, assetTimeSeconds=%f";
    uint64_t v16 = v14;
    uint32_t v17 = 44;
    goto LABEL_14;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v12 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v12 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    __int16 v19 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)time = 136316674;
      *(void *)&time[4] = v18;
      *(_WORD *)&time[12] = 2080;
      *(void *)&time[14] = "-[VCCannedAudioInjector allocateSampleBufferWithTrackOutput:assetAudioFormat:sampleBuffer:]";
      *(_WORD *)&time[22] = 1024;
      *(_DWORD *)&time[24] = 465;
      *(_WORD *)&time[28] = 2112;
      *(void *)&time[30] = v12;
      *(_WORD *)&time[38] = 2048;
      *(void *)&time[40] = self;
      __int16 v24 = 1024;
      int v25 = v11;
      __int16 v26 = 2048;
      double v27 = Seconds;
      uint64_t v15 = " [%s] %s:%d %@(%p) Estimated sampleCount=%u, assetTimeSeconds=%f";
      uint64_t v16 = v19;
      uint32_t v17 = 64;
LABEL_14:
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, time, v17);
    }
  }
LABEL_15:
  long long v20 = *(_OWORD *)&p_outputFormat->mBytesPerPacket;
  *(_OWORD *)time = *(_OWORD *)&p_outputFormat->mSampleRate;
  *(_OWORD *)&time[16] = v20;
  *(void *)&time[32] = *(void *)&p_outputFormat->mBitsPerChannel;
  if (VCAudioBufferList_Allocate((long long *)time, v11, a5)) {
    return 0;
  }
  else {
    return -2142699517;
  }
}

- (void)parseMediaTracksForAsset:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  uint64_t v66 = 0;
  memset(v65, 0, sizeof(v65));
  AudioConverterRef inAudioConverter = 0;
  uint64_t v64 = 0;
  uint64_t v62 = 0;
  if ([a3 statusOfValueForKey:@"tracks" error:0] != 2)
  {
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCannedAudioInjector parseMediaTracksForAsset:].cold.8();
        }
      }
      goto LABEL_26;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v36 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v36 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_26;
    }
    uint64_t v46 = VRTraceErrorLogLevelToCSTR();
    uint64_t v47 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v68 = v46;
    __int16 v69 = 2080;
    v70 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
    __int16 v71 = 1024;
    int v72 = 478;
    __int16 v73 = 2112;
    *(void *)v74 = v36;
    *(_WORD *)&v74[8] = 2048;
    *(void *)v75 = self;
    __int16 v48 = " [%s] %s:%d %@(%p) Audio Track failed to load";
    goto LABEL_118;
  }
  uint64_t v61 = 0;
  uint64_t v5 = [MEMORY[0x1E4F16378] assetReaderWithAsset:a3 error:&v61];
  if (v5) {
    BOOL v6 = v61 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    long long v7 = (void *)v5;
    int v8 = +[VCCannedAudioInjector setupReader:v5 forAsset:a3 assetAudioFormat:v65 trackOutput:&v64];
    if (v8 < 0)
    {
      int v38 = v8;
      if ((VCCannedAudioInjector *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCCannedAudioInjector parseMediaTracksForAsset:]();
          }
        }
        goto LABEL_26;
      }
      if (objc_opt_respondsToSelector()) {
        uint64_t v39 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v39 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_26;
      }
      uint64_t v53 = VRTraceErrorLogLevelToCSTR();
      v54 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v68 = v53;
      __int16 v69 = 2080;
      v70 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
      __int16 v71 = 1024;
      int v72 = 486;
      __int16 v73 = 2112;
      *(void *)v74 = v39;
      *(_WORD *)&v74[8] = 2048;
      *(void *)v75 = self;
      *(_WORD *)&v75[8] = 1024;
      *(_DWORD *)id v76 = v38;
      __int16 v48 = " [%s] %s:%d %@(%p) Failed to setup the reader. result=%x";
    }
    else
    {
      int v9 = [(VCCannedAudioInjector *)self setupAudioConverterWithAssetFormat:v65 audioConverter:&inAudioConverter];
      if ((v9 & 0x80000000) == 0)
      {
        if ([v7 startReading])
        {
          if (([(VCCannedAudioInjector *)self allocateSampleBufferWithTrackOutput:v64 assetAudioFormat:v65 sampleBuffer:&v62] & 0x80000000) == 0)
          {
            [(VCCannedAudioInjector *)self loadSamplesFromTrackOutput:v64 audioConverter:inAudioConverter audioBuffer:v62];
            uint64_t SampleCount = VCAudioBufferList_GetSampleCount(v62);
            unsigned int SampleCapacity = VCAudioBufferList_GetSampleCapacity(v62);
            if ((VCCannedAudioInjector *)objc_opt_class() == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v13 = VRTraceErrorLogLevelToCSTR();
                uint32_t v14 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316418;
                  uint64_t v68 = v13;
                  __int16 v69 = 2080;
                  v70 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
                  __int16 v71 = 1024;
                  int v72 = 502;
                  __int16 v73 = 1024;
                  *(_DWORD *)v74 = SampleCount;
                  *(_WORD *)&v74[4] = 1024;
                  *(_DWORD *)&v74[6] = SampleCapacity;
                  *(_WORD *)v75 = 2048;
                  *(double *)&v75[2] = 1.0 - (double)SampleCount / (double)SampleCapacity;
                  uint64_t v15 = " [%s] %s:%d Used sampleCount=%u, sampleCapacity=%u, overhead=%f";
                  uint64_t v16 = v14;
                  uint32_t v17 = 50;
LABEL_21:
                  _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
                }
              }
            }
            else
            {
              if (objc_opt_respondsToSelector()) {
                uint64_t v12 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
              }
              else {
                uint64_t v12 = &stru_1F3D3E450;
              }
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v18 = VRTraceErrorLogLevelToCSTR();
                __int16 v19 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316930;
                  uint64_t v68 = v18;
                  __int16 v69 = 2080;
                  v70 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
                  __int16 v71 = 1024;
                  int v72 = 502;
                  __int16 v73 = 2112;
                  *(void *)v74 = v12;
                  *(_WORD *)&v74[8] = 2048;
                  *(void *)v75 = self;
                  *(_WORD *)&v75[8] = 1024;
                  *(_DWORD *)id v76 = SampleCount;
                  *(_WORD *)&v76[4] = 1024;
                  *(_DWORD *)&v76[6] = SampleCapacity;
                  __int16 v77 = 2048;
                  double v78 = 1.0 - (double)SampleCount / (double)SampleCapacity;
                  uint64_t v15 = " [%s] %s:%d %@(%p) Used sampleCount=%u, sampleCapacity=%u, overhead=%f";
                  uint64_t v16 = v19;
                  uint32_t v17 = 70;
                  goto LABEL_21;
                }
              }
            }
            if (SampleCount)
            {
              if (self->_loopLength == -1.0)
              {
                [(VCCannedAVSync *)self->_avSync clear];
                [(VCCannedAVSync *)self->_avSync addStreamWithCount:SampleCount rate:self->_outputFormat.mSampleRate];
                self->_unsigned int samplesInLoop = SampleCount;
              }
              [(VCCannedAudioInjector *)self completeSetupWithSampleBuffer:&v62];
            }
            else if ((VCCannedAudioInjector *)objc_opt_class() == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                uint64_t v45 = VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[VCCannedAudioInjector parseMediaTracksForAsset:].cold.6(v45, &v62);
                }
              }
            }
            else
            {
              if (objc_opt_respondsToSelector()) {
                long long v44 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
              }
              else {
                long long v44 = &stru_1F3D3E450;
              }
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                uint64_t v58 = VRTraceErrorLogLevelToCSTR();
                __int16 v59 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                {
                  int v60 = VCAudioBufferList_GetSampleCapacity(v62);
                  *(_DWORD *)buf = 136316674;
                  uint64_t v68 = v58;
                  __int16 v69 = 2080;
                  v70 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
                  __int16 v71 = 1024;
                  int v72 = 503;
                  __int16 v73 = 2112;
                  *(void *)v74 = v44;
                  *(_WORD *)&v74[8] = 2048;
                  *(void *)v75 = self;
                  *(_WORD *)&v75[8] = 1024;
                  *(_DWORD *)id v76 = 0;
                  *(_WORD *)&v76[4] = 1024;
                  *(_DWORD *)&v76[6] = v60;
                  __int16 v48 = " [%s] %s:%d %@(%p) Failed to read samples. sampleCount=%u capacity=%u";
                  int v51 = v59;
                  uint32_t v52 = 60;
                  goto LABEL_123;
                }
              }
            }
            goto LABEL_26;
          }
          if ((VCCannedAudioInjector *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCCannedAudioInjector parseMediaTracksForAsset:].cold.5();
              }
            }
            goto LABEL_26;
          }
          if (objc_opt_respondsToSelector()) {
            v43 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
          }
          else {
            v43 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_26;
          }
          uint64_t v57 = VRTraceErrorLogLevelToCSTR();
          uint64_t v47 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            goto LABEL_26;
          }
          *(_DWORD *)buf = 136316162;
          uint64_t v68 = v57;
          __int16 v69 = 2080;
          v70 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
          __int16 v71 = 1024;
          int v72 = 496;
          __int16 v73 = 2112;
          *(void *)v74 = v43;
          *(_WORD *)&v74[8] = 2048;
          *(void *)v75 = self;
          __int16 v48 = " [%s] %s:%d %@(%p) Failed to allocate the audio buffer.";
        }
        else
        {
          if ((VCCannedAudioInjector *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCCannedAudioInjector parseMediaTracksForAsset:].cold.7();
              }
            }
            goto LABEL_26;
          }
          if (objc_opt_respondsToSelector()) {
            AudioStreamBasicDescription v42 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
          }
          else {
            AudioStreamBasicDescription v42 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_26;
          }
          uint64_t v56 = VRTraceErrorLogLevelToCSTR();
          uint64_t v47 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            goto LABEL_26;
          }
          *(_DWORD *)buf = 136316162;
          uint64_t v68 = v56;
          __int16 v69 = 2080;
          v70 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
          __int16 v71 = 1024;
          int v72 = 493;
          __int16 v73 = 2112;
          *(void *)v74 = v42;
          *(_WORD *)&v74[8] = 2048;
          *(void *)v75 = self;
          __int16 v48 = " [%s] %s:%d %@(%p) assetReader (audio) couldn't start reading.";
        }
LABEL_118:
        int v51 = v47;
        uint32_t v52 = 48;
        goto LABEL_123;
      }
      int v40 = v9;
      if ((VCCannedAudioInjector *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCCannedAudioInjector parseMediaTracksForAsset:].cold.4();
          }
        }
        goto LABEL_26;
      }
      if (objc_opt_respondsToSelector()) {
        UInt32 v41 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
      }
      else {
        UInt32 v41 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_26;
      }
      uint64_t v55 = VRTraceErrorLogLevelToCSTR();
      v54 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v68 = v55;
      __int16 v69 = 2080;
      v70 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
      __int16 v71 = 1024;
      int v72 = 489;
      __int16 v73 = 2112;
      *(void *)v74 = v41;
      *(_WORD *)&v74[8] = 2048;
      *(void *)v75 = self;
      *(_WORD *)&v75[8] = 1024;
      *(_DWORD *)id v76 = v40;
      __int16 v48 = " [%s] %s:%d %@(%p) Failed to setup the audio converter. result=%x";
    }
    int v51 = v54;
    uint32_t v52 = 54;
    goto LABEL_123;
  }
  if ((VCCannedAudioInjector *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCannedAudioInjector parseMediaTracksForAsset:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      UInt32 v37 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
    }
    else {
      UInt32 v37 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v49 = VRTraceErrorLogLevelToCSTR();
      __int16 v50 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v68 = v49;
        __int16 v69 = 2080;
        v70 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
        __int16 v71 = 1024;
        int v72 = 483;
        __int16 v73 = 2112;
        *(void *)v74 = v37;
        *(_WORD *)&v74[8] = 2048;
        *(void *)v75 = self;
        *(_WORD *)&v75[8] = 2112;
        *(void *)id v76 = v61;
        __int16 v48 = " [%s] %s:%d %@(%p) AVAssetReader initialization for audio failed, error=%@";
        int v51 = v50;
        uint32_t v52 = 58;
LABEL_123:
        _os_log_error_impl(&dword_1E1EA4000, v51, OS_LOG_TYPE_ERROR, v48, buf, v52);
      }
    }
  }
LABEL_26:
  BOOL v20 = [(VCCannedAudioInjector *)self isReadyToInject];
  BOOL v21 = v20;
  if (v20) {
    int v22 = 7;
  }
  else {
    int v22 = 3;
  }
  if ((VCCannedAudioInjector *)objc_opt_class() == self)
  {
    if (v22 > (int)VRTraceGetErrorLogLevelForModule()) {
      goto LABEL_46;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    int v25 = *MEMORY[0x1E4F47A50];
    __int16 v26 = *MEMORY[0x1E4F47A50];
    if (v21)
    {
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_46;
      }
      BOOL v27 = [(VCCannedAudioInjector *)self isReadyToInject];
      *(_DWORD *)buf = 136315906;
      uint64_t v68 = v24;
      __int16 v69 = 2080;
      v70 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
      __int16 v71 = 1024;
      int v72 = 514;
      __int16 v73 = 1024;
      *(_DWORD *)v74 = v27;
      uint64_t v28 = " [%s] %s:%d isReadyToInject=%{BOOL}d";
      uint64_t v29 = v25;
      uint32_t v30 = 34;
LABEL_41:
      _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
      goto LABEL_46;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[VCCannedAudioInjector parseMediaTracksForAsset:](v24, self);
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v23 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v23 = &stru_1F3D3E450;
    }
    if (v22 <= (int)VRTraceGetErrorLogLevelForModule())
    {
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      OSStatus v32 = *MEMORY[0x1E4F47A50];
      uint32_t v33 = *MEMORY[0x1E4F47A50];
      if (v21)
      {
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_46;
        }
        BOOL v34 = [(VCCannedAudioInjector *)self isReadyToInject];
        *(_DWORD *)buf = 136316418;
        uint64_t v68 = v31;
        __int16 v69 = 2080;
        v70 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
        __int16 v71 = 1024;
        int v72 = 514;
        __int16 v73 = 2112;
        *(void *)v74 = v23;
        *(_WORD *)&v74[8] = 2048;
        *(void *)v75 = self;
        *(_WORD *)&v75[8] = 1024;
        *(_DWORD *)id v76 = v34;
        uint64_t v28 = " [%s] %s:%d %@(%p) isReadyToInject=%{BOOL}d";
        uint64_t v29 = v32;
        uint32_t v30 = 54;
        goto LABEL_41;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        BOOL v35 = [(VCCannedAudioInjector *)self isReadyToInject];
        *(_DWORD *)buf = 136316418;
        uint64_t v68 = v31;
        __int16 v69 = 2080;
        v70 = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
        __int16 v71 = 1024;
        int v72 = 514;
        __int16 v73 = 2112;
        *(void *)v74 = v23;
        *(_WORD *)&v74[8] = 2048;
        *(void *)v75 = self;
        *(_WORD *)&v75[8] = 1024;
        *(_DWORD *)id v76 = v35;
        _os_log_error_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) isReadyToInject=%{BOOL}d", buf, 0x36u);
      }
    }
  }
LABEL_46:
  if (inAudioConverter) {
    AudioConverterDispose(inAudioConverter);
  }
  if (v62) {
    VCAudioBufferList_Destroy(&v62);
  }
}

- (int)loadEncodedAudioSamples
{
  v27[1] = *MEMORY[0x1E4F143B8];
  p_cannedMoviePath = &self->_cannedMoviePath;
  uint64_t v4 = [MEMORY[0x1E4F1CB10] URLWithString:self->_cannedMoviePath];
  id v5 = objc_alloc(MEMORY[0x1E4F166C8]);
  uint64_t v26 = *MEMORY[0x1E4F16148];
  v27[0] = MEMORY[0x1E4F1CC38];
  id v6 = (id)objc_msgSend(v5, "initWithURL:options:", v4, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1));
  if (v6)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__VCCannedAudioInjector_loadEncodedAudioSamples__block_invoke;
    v13[3] = &unk_1E6DB3E40;
    v13[4] = self;
    v13[5] = v6;
    [v6 loadValuesAsynchronouslyForKeys:&unk_1F3DC7A40 completionHandler:v13];
    return 0;
  }
  else
  {
    int v7 = -2142699469;
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCannedAudioInjector loadEncodedAudioSamples]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v9 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
      }
      else {
        int v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        int v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v12 = *p_cannedMoviePath;
          *(_DWORD *)buf = 136316418;
          uint64_t v15 = v10;
          __int16 v16 = 2080;
          uint32_t v17 = "-[VCCannedAudioInjector loadEncodedAudioSamples]";
          __int16 v18 = 1024;
          int v19 = 527;
          __int16 v20 = 2112;
          BOOL v21 = v9;
          __int16 v22 = 2048;
          __int16 v23 = self;
          __int16 v24 = 2112;
          int v25 = v12;
          _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Initialization of (audio) AVURLAsset for cannedMoviePath=%@ failed", buf, 0x3Au);
        }
      }
    }
  }
  return v7;
}

uint64_t __48__VCCannedAudioInjector_loadEncodedAudioSamples__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [*(id *)(a1 + 32) parseMediaTracksForAsset:*(void *)(a1 + 40)];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = *(_DWORD *)(v5 + 168);
      uint64_t v7 = *(void *)(v5 + 408);
      int v8 = *(_DWORD *)(v5 + 400);
      int v10 = 136316674;
      uint64_t v11 = v3;
      __int16 v12 = 2080;
      uint64_t v13 = "-[VCCannedAudioInjector loadEncodedAudioSamples]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 532;
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      __int16 v18 = 1024;
      int v19 = v6;
      __int16 v20 = 2048;
      uint64_t v21 = v7;
      __int16 v22 = 1024;
      int v23 = v8;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d injector=%@, _audioSampleCount=%d, _loopLength=%f, _samplesInLoop=%d", (uint8_t *)&v10, 0x3Cu);
    }
  }
  return [v2 drain];
}

+ (id)defaultAudioFileNameWithFormat:(const AudioStreamBasicDescription *)a3
{
  if ((a3->mFormatFlags & 1) == 0) {
    return @"1x22050.raw";
  }
  if (a3->mSampleRate == 22050.0) {
    return @"1x22050-flt.raw";
  }
  if (a3->mSampleRate == 24000.0) {
    return @"1x24000-flt.raw";
  }
  return 0;
}

- (int)loadRawAudioSamples
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = 0;
  p_outputFormat = &self->_outputFormat;
  id v4 = +[VCCannedAudioInjector defaultAudioFileNameWithFormat:&self->_outputFormat];
  if (!v4)
  {
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      int v22 = -2142699510;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          -[VCCannedAudioInjector loadRawAudioSamples]();
LABEL_48:
          __int16 v16 = 0;
          uint64_t v5 = 0;
          int v22 = -2142699510;
          goto LABEL_17;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v24 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v24 = &stru_1F3D3E450;
      }
      int v22 = -2142699510;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        uint64_t v29 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = v28;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCCannedAudioInjector loadRawAudioSamples]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 565;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v24;
          *(_WORD *)&buf[38] = 2048;
          int v38 = self;
          _os_log_error_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to retrieve audio file name", buf, 0x30u);
          goto LABEL_48;
        }
      }
    }
LABEL_53:
    __int16 v16 = 0;
    uint64_t v5 = 0;
    goto LABEL_17;
  }
  uint64_t v5 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", self->_cannedMoviePath, v4];
  int v6 = (VCCannedAudioInjector *)objc_opt_class();
  if (!v5)
  {
    if (v6 == self)
    {
      int v22 = -2142699517;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCannedAudioInjector loadRawAudioSamples]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v25 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
      }
      else {
        int v25 = &stru_1F3D3E450;
      }
      int v22 = -2142699517;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v30 = VRTraceErrorLogLevelToCSTR();
        uint64_t v31 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCCannedAudioInjector loadRawAudioSamples]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 568;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v25;
          *(_WORD *)&buf[38] = 2048;
          int v38 = self;
          _os_log_error_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate the asset path", buf, 0x30u);
        }
      }
    }
    goto LABEL_53;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      int v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCCannedAudioInjector loadRawAudioSamples]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 571;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v5;
        int v10 = " [%s] %s:%d reading sample data from assetPath=%@";
        uint64_t v11 = v9;
        uint32_t v12 = 38;
LABEL_13:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      __int16 v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCCannedAudioInjector loadRawAudioSamples]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 571;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v7;
        *(_WORD *)&buf[38] = 2048;
        int v38 = self;
        __int16 v39 = 2112;
        int v40 = v5;
        int v10 = " [%s] %s:%d %@(%p) reading sample data from assetPath=%@";
        uint64_t v11 = v14;
        uint32_t v12 = 58;
        goto LABEL_13;
      }
    }
  }
  int v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithContentsOfFile:v5];
  if (v15)
  {
    __int16 v16 = v15;
    unint64_t v17 = [v15 length];
    unint64_t mBytesPerFrame = self->_outputFormat.mBytesPerFrame;
    long long v19 = *(_OWORD *)&self->_outputFormat.mBytesPerPacket;
    *(_OWORD *)buf = *(_OWORD *)&p_outputFormat->mSampleRate;
    *(_OWORD *)&buf[16] = v19;
    *(void *)&buf[32] = *(void *)&self->_outputFormat.mBitsPerChannel;
    if (VCAudioBufferList_Allocate((long long *)buf, v17 / mBytesPerFrame, &v36))
    {
      uint64_t AudioBufferList = VCAudioBufferList_GetAudioBufferList(v36);
      unint64_t v21 = [v16 length] / (unint64_t)self->_outputFormat.mBytesPerFrame;
      objc_msgSend(v16, "getBytes:length:", *(void *)(AudioBufferList + 16), objc_msgSend(v16, "length"));
      *(_DWORD *)(AudioBufferList + 12) = [v16 length];
      VCAudioBufferList_SetSampleCount(v36, v21);
      [(VCCannedAVSync *)self->_avSync addStreamWithCount:v21 rate:p_outputFormat->mSampleRate];
      [(VCCannedAudioInjector *)self completeSetupWithSampleBuffer:&v36];
      int v22 = 0;
    }
    else
    {
      int v22 = -2142699517;
      if ((VCCannedAudioInjector *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCCannedAudioInjector loadRawAudioSamples].cold.4();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          BOOL v27 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
        }
        else {
          BOOL v27 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v34 = VRTraceErrorLogLevelToCSTR();
          BOOL v35 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            *(void *)&uint8_t buf[4] = v34;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCCannedAudioInjector loadRawAudioSamples]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 576;
            *(_WORD *)&buf[28] = 2112;
            *(void *)&buf[30] = v27;
            *(_WORD *)&buf[38] = 2048;
            int v38 = self;
            _os_log_error_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate the sampleBuffer", buf, 0x30u);
          }
        }
      }
    }
  }
  else
  {
    int v22 = -2142699517;
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCannedAudioInjector loadRawAudioSamples]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v26 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v26 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v32 = VRTraceErrorLogLevelToCSTR();
        uint32_t v33 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = v32;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCCannedAudioInjector loadRawAudioSamples]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 573;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v26;
          *(_WORD *)&buf[38] = 2048;
          int v38 = self;
          _os_log_error_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to load the asset data", buf, 0x30u);
        }
      }
    }
    __int16 v16 = 0;
  }
LABEL_17:
  if (v36) {
    VCAudioBufferList_Destroy(&v36);
  }

  return v22;
}

- (int)setupSineInjectionWithConfig:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v48 = 0;
  p_outputFormat = &self->_outputFormat;
  double mSampleRate = self->_outputFormat.mSampleRate;
  [a3 startHostTime];
  double v8 = v7;
  [a3 loopLength];
  int v10 = [(VCCannedAudioInjector *)self setupAVSyncWithStartHostTime:v8 loopLength:v9];
  if (v10 < 0)
  {
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCannedAudioInjector setupSineInjectionWithConfig:]();
        }
      }
      goto LABEL_20;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v39 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v39 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_20;
    }
    uint64_t v41 = VRTraceErrorLogLevelToCSTR();
    AudioStreamBasicDescription v42 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = v41;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[VCCannedAudioInjector setupSineInjectionWithConfig:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 603;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v39;
    *(_WORD *)&buf[38] = 2048;
    __int16 v50 = self;
    __int16 v51 = 1024;
    int v52 = v10;
    v43 = " [%s] %s:%d %@(%p) Failed to setup the AV sync. result=%x";
    long long v44 = v42;
    uint32_t v45 = 54;
LABEL_41:
    _os_log_error_impl(&dword_1E1EA4000, v44, OS_LOG_TYPE_ERROR, v43, buf, v45);
    goto LABEL_20;
  }
  uint64_t v11 = mSampleRate;
  long long v12 = *(_OWORD *)&p_outputFormat->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&p_outputFormat->mSampleRate;
  *(_OWORD *)&buf[16] = v12;
  *(void *)&buf[32] = *(void *)&p_outputFormat->mBitsPerChannel;
  if ((VCAudioBufferList_Allocate((long long *)buf, mSampleRate, &v48) & 1) == 0)
  {
    int v10 = -2142699517;
    if ((VCCannedAudioInjector *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCannedAudioInjector setupSineInjectionWithConfig:]();
        }
      }
      goto LABEL_20;
    }
    if (objc_opt_respondsToSelector()) {
      int v40 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
    }
    else {
      int v40 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_20;
    }
    uint64_t v46 = VRTraceErrorLogLevelToCSTR();
    uint64_t v47 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = v46;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[VCCannedAudioInjector setupSineInjectionWithConfig:]";
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = 606;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v40;
    *(_WORD *)&buf[38] = 2048;
    __int16 v50 = self;
    v43 = " [%s] %s:%d %@(%p) Failed to allocate the audio buffer.";
    long long v44 = v47;
    uint32_t v45 = 48;
    goto LABEL_41;
  }
  uint64_t AudioBufferList = (_DWORD *)VCAudioBufferList_GetAudioBufferList(v48);
  SampleFormat = (double *)VCAudioBufferList_GetSampleFormat(v48);
  unsigned int Timestamp = VCAudioBufferList_GetTimestamp(v48);
  [a3 sineWaveAmplitude];
  double v17 = v16;
  unsigned int v18 = [a3 sineWaveFrequencyHz];
  if (v11)
  {
    uint64_t v19 = 0;
    double v20 = (double)v18;
    double v21 = *SampleFormat;
    unsigned int v24 = *AudioBufferList;
    int v22 = (uint64_t *)(AudioBufferList + 4);
    uint64_t v23 = v24;
    do
    {
      double v25 = sin((float)((float)Timestamp + (float)v19) * 6.28318531 * v20 / v21);
      if (v23)
      {
        float v26 = v17 * v25;
        uint64_t v27 = v23;
        uint64_t v28 = v22;
        do
        {
          uint64_t v29 = *v28;
          v28 += 2;
          *(float *)(v29 + 4 * v19) = v26;
          --v27;
        }
        while (v27);
      }
      ++v19;
    }
    while (v19 != v11);
  }
  VCAudioBufferList_SetSampleCount(v48, mSampleRate);
  [(VCCannedAudioInjector *)self completeSetupWithSampleBuffer:&v48];
  if ((VCCannedAudioInjector *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      uint64_t v32 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v31;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCCannedAudioInjector setupSineInjectionWithConfig:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 622;
        uint32_t v33 = " [%s] %s:%d Successfully setup sine injection.";
        uint64_t v34 = v32;
        uint32_t v35 = 28;
LABEL_19:
        _os_log_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v30 = (__CFString *)[(VCCannedAudioInjector *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v30 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v36 = VRTraceErrorLogLevelToCSTR();
      UInt32 v37 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCCannedAudioInjector setupSineInjectionWithConfig:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 622;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v30;
        *(_WORD *)&buf[38] = 2048;
        __int16 v50 = self;
        uint32_t v33 = " [%s] %s:%d %@(%p) Successfully setup sine injection.";
        uint64_t v34 = v37;
        uint32_t v35 = 48;
        goto LABEL_19;
      }
    }
  }
LABEL_20:
  VCAudioBufferList_Destroy(&v48);
  return v10;
}

- (unsigned)samplesInLoop
{
  return self->_samplesInLoop;
}

- (BOOL)isReadyToInject
{
  return self->_isReadyToInject;
}

- (void)setIsReadyToInject:(BOOL)a3
{
  self->_isReadyToInject = a3;
}

- (void)initWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCCannedAudioInjector initWithConfig:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup the injector. result=%x", v2, *(const char **)v3, (unint64_t)"-[VCCannedAudioInjector initWithConfig:]" >> 16, v4);
}

- (void)initWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Config is invalid", v2, v3, v4, v5, v6);
}

- (void)setupAssetInjectionWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCCannedAudioInjector setupAssetInjectionWithConfig:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup the AV sync. result=%x", v2, *(const char **)v3, (unint64_t)"-[VCCannedAudioInjector setupAssetInjectionWithConfig:]" >> 16, v4);
}

- (void)setupAssetInjectionWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCCannedAudioInjector setupAssetInjectionWithConfig:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to load the audio samples. result=%x", v2, *(const char **)v3, (unint64_t)"-[VCCannedAudioInjector setupAssetInjectionWithConfig:]" >> 16, v4);
}

- (void)setupAssetInjectionWithConfig:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Audio file not found", v2, v3, v4, v5, v6);
}

- (void)setupAssetInjectionWithConfig:.cold.4()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid asset type. assetType=%d", v2, v3, v4, 189);
}

+ (void)isAudioAvailable:fileName:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d audio is not available", v2, v3, v4, v5, v6);
}

+ (void)isAudioAvailable:(uint64_t)a1 fileName:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  if ([a2 absoluteString]) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "absoluteString"), "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10_12();
  _os_log_error_impl(v3, v4, v5, v6, v7, 0x26u);
}

+ (void)setupReader:forAsset:assetAudioFormat:trackOutput:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate read settings", v2, v3, v4, v5, v6);
}

- (void)setupAudioConverterWithAssetFormat:audioConverter:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCCannedAudioInjector setupAudioConverterWithAssetFormat:audioConverter:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create the audio converter! err=%d", v2, *(const char **)v3, (unint64_t)"-[VCCannedAudioInjector setupAudioConverterWithAssetFormat:audioConverter:]" >> 16, v4);
}

- (void)processSampleBuffer:audioConverter:audioBuffer:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AudioConverterFillComplexBuffer failed!", v2, v3, v4, v5, v6);
}

- (void)processSampleBuffer:audioConverter:audioBuffer:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Fetching kAudioConverterPropertyCalculateOutputBufferSize failed with status=%d", v2, *(const char **)v3, (unint64_t)"-[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]" >> 16, v4);
}

- (void)processSampleBuffer:audioConverter:audioBuffer:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer failed! err=%d", v2, *(const char **)v3, (unint64_t)"-[VCCannedAudioInjector processSampleBuffer:audioConverter:audioBuffer:]" >> 16, v4);
}

- (void)parseMediaTracksForAsset:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  [a2 isReadyToInject];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10_12();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x22u);
}

- (void)parseMediaTracksForAsset:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVAssetReader initialization for audio failed, error=%@");
}

- (void)parseMediaTracksForAsset:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup the reader. result=%x", v2, *(const char **)v3, (unint64_t)"-[VCCannedAudioInjector parseMediaTracksForAsset:]" >> 16, v4);
}

- (void)parseMediaTracksForAsset:.cold.4()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCCannedAudioInjector parseMediaTracksForAsset:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup the audio converter. result=%x", v2, *(const char **)v3, (unint64_t)"-[VCCannedAudioInjector parseMediaTracksForAsset:]" >> 16, v4);
}

- (void)parseMediaTracksForAsset:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the audio buffer.", v2, v3, v4, v5, v6);
}

- (void)parseMediaTracksForAsset:(uint64_t)a1 .cold.6(uint64_t a1, uint64_t *a2)
{
  VCAudioBufferList_GetSampleCapacity(*a2);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10_12();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x28u);
}

- (void)parseMediaTracksForAsset:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d assetReader (audio) couldn't start reading.", v2, v3, v4, v5, v6);
}

- (void)parseMediaTracksForAsset:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Audio Track failed to load", v2, v3, v4, v5, v6);
}

- (void)loadEncodedAudioSamples
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Initialization of (audio) AVURLAsset for cannedMoviePath=%@ failed");
}

- (void)loadRawAudioSamples
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the sampleBuffer", v2, v3, v4, v5, v6);
}

- (void)setupSineInjectionWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCCannedAudioInjector setupSineInjectionWithConfig:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup the AV sync. result=%x", v2, *(const char **)v3, (unint64_t)"-[VCCannedAudioInjector setupSineInjectionWithConfig:]" >> 16, v4);
}

- (void)setupSineInjectionWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the audio buffer.", v2, v3, v4, v5, v6);
}

@end