@interface CSMyriadPHash
+ (BOOL)writeHashResultIntoFile:(id)a3;
+ (BOOL)writeHashlessResult:(unint64_t)a3;
+ (NSData)lastHash;
+ (double)signalEstimateWithBuilder:(id)a3;
+ (id)createHashResult:(unsigned __int16)a3 goodness:(unsigned __int8)a4 confidence:(unsigned __int8)a5 absTime:(unint64_t)a6 frac:(unsigned __int8)a7;
+ (id)createRemoraHashResult:(unsigned __int16)a3 goodness:(unsigned __int8)a4 confidence:(unsigned __int8)a5 firstPassTriggerEndTime:(double)a6 frac:(unsigned __int8)a7;
+ (id)createRemoraHashResultFromPHash:(id)a3 firstPassTriggerEndTime:(double)a4;
+ (id)decodeWithMyriadPHash:(id)a3;
+ (id)generateEmptyPHash:(unint64_t)a3 writeFile:(BOOL)a4;
+ (id)overridePHash:(id)a3 withMachTime:(unint64_t)a4;
+ (void)notifyAudioHashNotification;
+ (void)notifyAudioHashlessNotification;
+ (void)notifyHashlessTrigger:(unint64_t)a3;
+ (void)setLastHash:(id)a3;
- (CSMyriadPHash)init;
- (OS_dispatch_queue)queue;
- (double)_signalEstimate:(float *)a3 length:(unint64_t)a4;
- (id)_audioLogDirectory;
- (id)_generateMyriadInfo:(unint64_t)a3 hsStart:(unint64_t)a4 triggerEnd:(unint64_t)a5 writeFile:(BOOL)a6 score:(float)a7 triggerSource:(id)a8 channel:(unint64_t)a9 audioProviderUUID:(id)a10 absoluteTime:(unint64_t)a11;
- (id)cachedHash;
- (id)generatePHashFromExclaveVoiceTriggerInfo:(id)a3 writeFile:(BOOL)a4;
- (id)generatePHashFromVoiceTriggerInfo:(id)a3 writeFile:(BOOL)a4;
- (signed)signalEstimate;
- (unsigned)pHash:(float *)a3 length:(int)a4;
- (unsigned)sigFrac:(double)a3;
- (unsigned)sigNorm:(double)a3;
- (unsigned)signalFractional;
- (void)_copyAudioDataInBuffer:(float *)a3 bufferSize:(unint64_t)a4 copyLength:(unint64_t)a5 fromAudioData:(void *)a6;
- (void)_copyPsdDataInBuffer:(float *)a3 copyLength:(unint64_t)a4 fromAudioData:(void *)a5;
- (void)_surfacePsdWithAudioChunk:(id)a3;
- (void)dealloc;
- (void)setQueue:(id)a3;
- (void)setSignalEstimate:(signed __int16)a3;
- (void)setSignalFractional:(unsigned __int8)a3;
@end

@implementation CSMyriadPHash

- (void).cxx_destruct
{
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setSignalFractional:(unsigned __int8)a3
{
  self->_signalFractional = a3;
}

- (unsigned)signalFractional
{
  return self->_signalFractional;
}

- (void)setSignalEstimate:(signed __int16)a3
{
  self->_signalEstimate = a3;
}

- (signed)signalEstimate
{
  return self->_signalEstimate;
}

- (id)generatePHashFromVoiceTriggerInfo:(id)a3 writeFile:(BOOL)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100054730;
  v20 = sub_100054740;
  id v21 = 0;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100054748;
  v11[3] = &unk_10024F588;
  id v12 = v6;
  v13 = self;
  v14 = &v16;
  BOOL v15 = a4;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (id)generatePHashFromExclaveVoiceTriggerInfo:(id)a3 writeFile:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  double v8 = 0.0;
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v9 = kVTEIExclaveSignalIntensity;
  uint64_t v10 = [v6 objectForKeyedSubscript:kVTEIExclaveSignalIntensity];
  if (!v10) {
    goto LABEL_5;
  }
  v11 = (void *)v10;
  id v12 = [v7 objectForKeyedSubscript:v9];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v14 = [v7 objectForKeyedSubscript:v9];
    [v14 doubleValue];
    double v8 = v15;

    uint64_t v16 = [(CSMyriadPHash *)self sigNorm:v8];
    uint64_t v17 = [(CSMyriadPHash *)self sigFrac:v8];
  }
  else
  {
LABEL_5:
    uint64_t v16 = 0;
    uint64_t v17 = 0;
  }
  uint64_t v18 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 136315906;
    v29 = "-[CSMyriadPHash generatePHashFromExclaveVoiceTriggerInfo:writeFile:]";
    __int16 v30 = 2050;
    double v31 = v8;
    __int16 v32 = 1026;
    int v33 = v16;
    __int16 v34 = 1026;
    int v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s sigsum = %{public}f sigNorm= %{public}d sigFrac= %{public}d", (uint8_t *)&v28, 0x22u);
  }
  id v19 = (id)mach_absolute_time();
  if (v7)
  {
    uint64_t v20 = kVTEItriggerEndMachTime;
    uint64_t v21 = [v7 objectForKeyedSubscript:kVTEItriggerEndMachTime];
    if (v21)
    {
      v22 = (void *)v21;
      v23 = [v7 objectForKeyedSubscript:v20];
      objc_opt_class();
      char v24 = objc_opt_isKindOfClass();

      if (v24)
      {
        v25 = [v7 objectForKeyedSubscript:v20];
        id v19 = [v25 unsignedLongLongValue];
      }
    }
  }
  v26 = +[CSMyriadPHash createHashResult:42545 goodness:v16 confidence:0 absTime:v19 frac:v17];
  if (v4) {
    +[CSMyriadPHash writeHashResultIntoFile:v26];
  }

  return v26;
}

- (id)_audioLogDirectory
{
  v2 = +[NSFileManager defaultManager];
  v3 = +[CSFPreferences sharedPreferences];
  BOOL v4 = [v3 voiceTriggerAudioLogDirectory];

  if ([v2 fileExistsAtPath:v4])
  {
    id v5 = 0;
  }
  else
  {
    id v11 = 0;
    unsigned __int8 v6 = [v2 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v11];
    id v5 = v11;
    if ((v6 & 1) == 0)
    {
      v7 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = v7;
        uint64_t v10 = [v5 localizedDescription];
        *(_DWORD *)buf = 136315650;
        v13 = "-[CSMyriadPHash _audioLogDirectory]";
        __int16 v14 = 2114;
        double v15 = v4;
        __int16 v16 = 2114;
        uint64_t v17 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Couldn't create voice trigger audio logging directory at path %{public}@ %{public}@", buf, 0x20u);
      }
      BOOL v4 = @"/tmp";
    }
  }

  return v4;
}

- (id)_generateMyriadInfo:(unint64_t)a3 hsStart:(unint64_t)a4 triggerEnd:(unint64_t)a5 writeFile:(BOOL)a6 score:(float)a7 triggerSource:(id)a8 channel:(unint64_t)a9 audioProviderUUID:(id)a10 absoluteTime:(unint64_t)a11
{
  BOOL v13 = a6;
  id v17 = a8;
  id v18 = a10;
  if (v17
    && ((unsigned int v19 = [v17 isEqualToString:kVTEIFirstPassTriggeredFromJarvis],
         ([v17 isEqualToString:kVTEIFirstPassTriggeredFromHearstAP] & 1) != 0)
     || ([v17 isEqualToString:kVTEIFirstPassTriggeredFromHearst] | v19) == 1))
  {
    uint64_t v20 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[CSMyriadPHash _generateMyriadInfo:hsStart:triggerEnd:writeFile:score:triggerSource:channel:audioProviderUU"
            "ID:absoluteTime:]";
      __int16 v49 = 2114;
      unint64_t v50 = (unint64_t)v17;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s No posting as trigger source is %{public}@", buf, 0x16u);
    }
    uint64_t v21 = 0;
  }
  else
  {
    BOOL v43 = v13;
    v22 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
    id v44 = v18;
    v23 = [v22 audioProviderWithUUID:v18];

    char v24 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v48 = "-[CSMyriadPHash _generateMyriadInfo:hsStart:triggerEnd:writeFile:score:triggerSource:channel:audioProviderUU"
            "ID:absoluteTime:]";
      __int16 v49 = 2050;
      unint64_t v50 = a3;
      __int16 v51 = 2050;
      unint64_t v52 = a9;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s BTLE AudioPayload ringBuffer startpoint: %{public}lld toEnd, activeChannel: %{public}tu", buf, 0x20u);
    }
    v46 = v23;
    v25 = objc_msgSend(v23, "audioChunkToEndFrom:channelIdx:", a3, a9, a5);
    v26 = [v25 data];
    unint64_t v27 = (unint64_t)[v25 numSamples];
    int v28 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[CSMyriadPHash _generateMyriadInfo:hsStart:triggerEnd:writeFile:score:triggerSource:channel:audioProviderUU"
            "ID:absoluteTime:]";
      __int16 v49 = 2050;
      unint64_t v50 = v27;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s BTLE raw audio size = %{public}ld", buf, 0x16u);
    }
    v29 = malloc_type_malloc(0x4000uLL, 0xA1E2413FuLL);
    bzero(v29, 0x4000uLL);
    if (v27 >= 0x1000) {
      unint64_t v27 = 4096;
    }
    id v30 = v26;
    -[CSMyriadPHash _copyAudioDataInBuffer:bufferSize:copyLength:fromAudioData:](self, "_copyAudioDataInBuffer:bufferSize:copyLength:fromAudioData:", v29, 0x4000, v27, [v30 bytes]);
    uint64_t v31 = [(CSMyriadPHash *)self pHash:v29 length:4096];
    unsigned __int8 v32 = [(CSMyriadPHash *)self signalEstimate];
    uint64_t v33 = [(CSMyriadPHash *)self signalFractional];
    free(v29);
    if (CSIsInternalBuild())
    {
      __int16 v34 = +[NSDate date];
      int v35 = [v46 audioChunkFrom:a4 to:v42 channelIdx:a9];
      [(CSMyriadPHash *)self _surfacePsdWithAudioChunk:v35];
      v36 = +[NSDate date];
      v37 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v38 = v37;
        [v36 timeIntervalSinceDate:v34];
        *(_DWORD *)buf = 136315394;
        v48 = "-[CSMyriadPHash _generateMyriadInfo:hsStart:triggerEnd:writeFile:score:triggerSource:channel:audioProvider"
              "UUID:absoluteTime:]";
        __int16 v49 = 2050;
        unint64_t v50 = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s Surface PSD elapsed time = %{public}lf", buf, 0x16u);
      }
    }
    if (CSIsHorseman()) {
      uint64_t v40 = 0;
    }
    else {
      uint64_t v40 = (int)(float)(a7 * 10.0);
    }
    uint64_t v21 = +[CSMyriadPHash createHashResult:v31 goodness:v32 confidence:v40 absTime:a11 frac:v33];
    if (v43) {
      +[CSMyriadPHash writeHashResultIntoFile:v21];
    }
    +[CSMyriadPHash notifyAudioHashNotification];

    id v18 = v44;
  }

  return v21;
}

- (void)_copyPsdDataInBuffer:(float *)a3 copyLength:(unint64_t)a4 fromAudioData:(void *)a5
{
  if (a4 && a3 && a5)
  {
    if (+[CSConfig inputRecordingIsFloat])
    {
      float __B = 32767.0;
      vDSP_vsmul((const float *)a5, 1, &__B, a3, 1, a4);
    }
    else
    {
      vDSP_vflt16((const __int16 *)a5, 1, a3, 1, a4);
    }
  }
}

- (void)_copyAudioDataInBuffer:(float *)a3 bufferSize:(unint64_t)a4 copyLength:(unint64_t)a5 fromAudioData:(void *)a6
{
  if (a3 && a6)
  {
    if (!a5) {
      goto LABEL_8;
    }
    if (+[CSConfig inputRecordingIsFloat])
    {
      *(_DWORD *)buf = 1191181824;
      float __C = 1.0;
      float __B = -1.0;
      vDSP_vclip((const float *)a6, 1, &__B, &__C, a3, 1, a5);
      vDSP_vsmul(a3, 1, (const float *)buf, a3, 1, a5);
    }
    else
    {
      vDSP_vflt16((const __int16 *)a6, 1, a3, 1, a5);
    }
    if (a5 <= 0xFFF)
    {
LABEL_8:
      uint64_t v9 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        BOOL v13 = "-[CSMyriadPHash _copyAudioDataInBuffer:bufferSize:copyLength:fromAudioData:]";
        __int16 v14 = 2050;
        unint64_t v15 = 4096 - a5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s BTLE padded %{public}ld samples to fill out buffer", buf, 0x16u);
      }
    }
  }
}

- (id)cachedHash
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100054730;
  uint64_t v10 = sub_100054740;
  id v11 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005589C;
  block[3] = &unk_100253440;
  block[4] = &v6;
  dispatch_sync(queue, block);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (unsigned)sigFrac:(double)a3
{
  float v3 = log10(a3) * 10.0 + 0.5;
  return vcvts_n_s32_f32(v3 - (float)(int)v3, 8uLL);
}

- (unsigned)sigNorm:(double)a3
{
  return (int)(log10(a3) * 10.0 + -50.0 + 2.5);
}

- (unsigned)pHash:(float *)a3 length:(int)a4
{
  [(CSMyriadPHash *)self _signalEstimate:a3 length:a4];
  double v6 = v5;
  self->_int signalEstimate = -[CSMyriadPHash sigNorm:](self, "sigNorm:");
  unsigned int v7 = [(CSMyriadPHash *)self sigFrac:v6];
  self->_signalFractional = v7;
  uint64_t v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int signalEstimate = self->_signalEstimate;
    int v11 = 136315906;
    id v12 = "-[CSMyriadPHash pHash:length:]";
    __int16 v13 = 2050;
    double v14 = v6;
    __int16 v15 = 1026;
    int v16 = signalEstimate;
    __int16 v17 = 1026;
    unsigned int v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s sigsum = %{public}f sigNorm= %{public}d sigFrac= %{public}d", (uint8_t *)&v11, 0x22u);
  }
  return -22991;
}

- (void)_surfacePsdWithAudioChunk:(id)a3
{
  id v4 = a3;
  double v5 = [v4 data];
  vDSP_Length v6 = (vDSP_Length)[v4 numSamples];

  if (v6)
  {
    unsigned int v7 = malloc_type_malloc(4 * v6, 0x27FE19A6uLL);
    bzero(v7, 4 * v6);
    -[CSMyriadPHash _copyPsdDataInBuffer:copyLength:fromAudioData:](self, "_copyPsdDataInBuffer:copyLength:fromAudioData:", v7, v6, [v5 bytes]);
    unint64_t v20 = 0xBF7851EC3F800000;
    vDSP_conv((const float *)v7, 1, (const float *)&v20 + 1, -1, (float *)v7, 1, v6 - 1, 2uLL);
    *((float *)v7 + v6 - 1) = *((float *)&v20 + 1) * *((float *)v7 + v6 - 1);
    vDSP_vsq((const float *)v7, 1, (float *)v7, 1, v6);
    float __C = 0.0;
    vDSP_sve((const float *)v7, 1, &__C, v6);
    uint64_t v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = __C;
      float v10 = log10(__C) * 10.0 + -50.0;
      *(_DWORD *)buf = 136315906;
      __int16 v13 = "-[CSMyriadPHash _surfacePsdWithAudioChunk:]";
      __int16 v14 = 1024;
      int v15 = (int)v10;
      __int16 v16 = 2048;
      double v17 = v9;
      __int16 v18 = 2048;
      vDSP_Length v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Surface PSD: PSD Score = %d, PSDSum = %f, PSDLength = %lu", buf, 0x26u);
    }
    free(v7);
  }
}

- (double)_signalEstimate:(float *)a3 length:(unint64_t)a4
{
  float v15 = 0.0;
  vDSP_Length v6 = (float *)sub_100055E94(256, @"windowed array for signal estimation");
  double v7 = 0.0;
  uint64_t v8 = 31;
  do
  {
    vDSP_vmul(a3, 1, self->_snrWindow, 1, v6, 1, 0x100uLL);
    snrSetup = self->_snrSetup;
    float v10 = (float *)sub_100055E94(256, @"complex part zero vec");
    __C.realp = v6;
    __C.imagp = v10;
    vDSP_fft_zip(snrSetup, &__C, 1, 8uLL, 1);
    int v11 = (float *)sub_100055E94(256, @"fft magnitudes array");
    vDSP_zvmags(&__C, 1, v11, 1, 0x100uLL);
    int __B = 256;
    id v12 = (float *)sub_100055E94(256, @"sqrt");
    vvsqrtf(v12, v11, &__B);
    __int16 v13 = (float *)sub_100055E94(256, @"normalized fft magnitudes");
    int __B = 0x40000000;
    vDSP_vsmul(v12, 1, (const float *)&__B, v13, 1, 0x100uLL);
    free(v10);
    free(v11);
    free(v12);
    float v15 = 0.0;
    vDSP_sve(&v13[(float)(300.0 / (float)((float)(*(float *)&dword_1002A3770 * 0.00024414) * 16.0))], 1, &v15, (int)(float)(2700.0 / (float)((float)(*(float *)&dword_1002A3770 * 0.00024414) * 16.0)));
    double v7 = v7 + v15;
    free(v13);
    a3 += 128;
    --v8;
  }
  while (v8);
  free(v6);
  return v7;
}

- (void)dealloc
{
  vDSP_destroy_fftsetup(self->_setup);
  vDSP_destroy_fftsetup(self->_snrSetup);
  hammingWindow = self->_hammingWindow;
  if (hammingWindow)
  {
    free(hammingWindow);
    self->_hammingWindow = 0;
  }
  snrWindow = self->_snrWindow;
  if (snrWindow)
  {
    free(snrWindow);
    self->_snrWindow = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CSMyriadPHash;
  [(CSMyriadPHash *)&v5 dealloc];
}

- (CSMyriadPHash)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSMyriadPHash;
  id v2 = [(CSMyriadPHash *)&v10 init];
  if (v2)
  {
    float v3 = (float *)sub_100055E94(2048, @"HammingWindow");
    *((void *)v2 + 1) = v3;
    vDSP_hamm_window(v3, 0x800uLL, 0);
    *((void *)v2 + 2) = vDSP_create_fftsetup(0xAuLL, 2);
    id v4 = (float *)sub_100055E94(256, @"HammingWindow");
    *((void *)v2 + 3) = v4;
    vDSP_hamm_window(v4, 0x100uLL, 0);
    *((void *)v2 + 4) = vDSP_create_fftsetup(8uLL, 2);
    *((_WORD *)v2 + 21) = 0;
    +[CSConfig inputRecordingSampleRate];
    dword_1002A3770 = v5;
    vDSP_Length v6 = dispatch_get_global_queue(2, 0);
    dispatch_queue_t v7 = dispatch_queue_create("myriad_audio_analysis", 0);
    uint64_t v8 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v7;

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 6), v6);
  }
  return (CSMyriadPHash *)v2;
}

+ (NSData)lastHash
{
  return (NSData *)(id)qword_1002A3778;
}

+ (void)setLastHash:(id)a3
{
  id v3 = [a3 copy];
  id v4 = (void *)qword_1002A3778;
  qword_1002A3778 = (uint64_t)v3;
}

+ (void)notifyAudioHashlessNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.siri.myriad.apayload", 0, 0, 1u);
  id v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "+[CSMyriadPHash notifyAudioHashlessNotification]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Posted siri audio hash notification", (uint8_t *)&v4, 0xCu);
  }
}

+ (void)notifyAudioHashNotification
{
  if (CSIsBridgeOS())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.siri.myriad.apayload", 0, 0, 1u);
    id v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      int v5 = "+[CSMyriadPHash notifyAudioHashNotification]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Posted siri audio hash notification", (uint8_t *)&v4, 0xCu);
    }
  }
}

+ (BOOL)writeHashResultIntoFile:(id)a3
{
  id v3 = a3;
  int v4 = +[CSFPreferences sharedPreferences];
  int v5 = [v4 myriadHashFilePath];

  unsigned __int8 v6 = [v3 writeToFile:v5 atomically:0];
  if ((v6 & 1) == 0)
  {
    dispatch_queue_t v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      objc_super v10 = "+[CSMyriadPHash writeHashResultIntoFile:]";
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s advert data write failed", (uint8_t *)&v9, 0xCu);
    }
  }

  return v6;
}

+ (BOOL)writeHashlessResult:(unint64_t)a3
{
  id v3 = +[CSMyriadPHash createHashResult:0 goodness:0 confidence:0 absTime:a3 frac:0];
  BOOL v4 = +[CSMyriadPHash writeHashResultIntoFile:v3];

  return v4;
}

+ (id)overridePHash:(id)a3 withMachTime:(unint64_t)a4
{
  int v5 = +[CSMyriadPHash decodeWithMyriadPHash:a3];
  unsigned __int8 v6 = +[CSMyriadPHash createHashResult:goodness:confidence:absTime:frac:](CSMyriadPHash, "createHashResult:goodness:confidence:absTime:frac:", (unsigned __int16)[v5 hash], objc_msgSend(v5, "goodness"), objc_msgSend(v5, "confidence"), a4, objc_msgSend(v5, "frac"));

  return v6;
}

+ (id)decodeWithMyriadPHash:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  unsigned __int16 v13 = 0;
  __int16 v12 = 0;
  uint64_t v11 = 0;
  unsigned __int8 v10 = 0;
  if (v3 && [v3 length] == (id)13)
  {
    objc_msgSend(v4, "getBytes:range:", &v13, 0, 2);
    objc_msgSend(v4, "getBytes:range:", (char *)&v12 + 1, 2, 1);
    objc_msgSend(v4, "getBytes:range:", &v12, 3, 1);
    objc_msgSend(v4, "getBytes:range:", &v11, 4, 8);
    objc_msgSend(v4, "getBytes:range:", &v10, 12, 1);
    int v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      float v15 = "+[CSMyriadPHash decodeWithMyriadPHash:]";
      __int16 v16 = 2048;
      unint64_t v17 = v13;
      __int16 v18 = 2048;
      uint64_t v19 = HIBYTE(v12);
      __int16 v20 = 2048;
      uint64_t v21 = v12;
      __int16 v22 = 2048;
      uint64_t v23 = v11;
      __int16 v24 = 2048;
      uint64_t v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Decoded myriadPHash : hash(%lu), goodness(%lu), confidence(%lu), absTime(%llu), frac(%lu)", buf, 0x3Eu);
    }
  }
  else
  {
    unsigned __int8 v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      float v15 = "+[CSMyriadPHash decodeWithMyriadPHash:]";
      __int16 v16 = 2114;
      unint64_t v17 = (unint64_t)v4;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Invalid myriad pHash : %{public}@", buf, 0x16u);
    }
  }
  dispatch_queue_t v7 = [CSMyriadPHashFactors alloc];
  uint64_t v8 = [(CSMyriadPHashFactors *)v7 initWithHash:v13 goodness:HIBYTE(v12) confidence:v12 absTime:v11 frac:v10];

  return v8;
}

+ (id)generateEmptyPHash:(unint64_t)a3 writeFile:(BOOL)a4
{
  BOOL v4 = a4;
  int v5 = +[CSMyriadPHash createHashResult:0 goodness:0 confidence:0 absTime:a3 frac:0];
  if (v4) {
    +[CSMyriadPHash writeHashResultIntoFile:v5];
  }
  return v5;
}

+ (id)createHashResult:(unsigned __int16)a3 goodness:(unsigned __int8)a4 confidence:(unsigned __int8)a5 absTime:(unint64_t)a6 frac:(unsigned __int8)a7
{
  int v7 = a7;
  int v9 = a5;
  int v10 = a4;
  unsigned __int16 v19 = a3;
  unsigned __int8 v18 = a4;
  unsigned __int8 v17 = a5;
  unint64_t v16 = a6;
  unsigned __int8 v15 = a7;
  uint64_t v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v21 = "+[CSMyriadPHash createHashResult:goodness:confidence:absTime:frac:]";
    __int16 v22 = 1024;
    *(_DWORD *)uint64_t v23 = v10;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v9;
    __int16 v24 = 2048;
    unint64_t v25 = a6;
    __int16 v26 = 1024;
    int v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s goodness = %d, confidence = %d absTime = %llu, frac = %d", buf, 0x28u);
  }
  __int16 v12 = +[NSMutableData dataWithCapacity:13];
  [v12 appendBytes:&v19 length:2];
  [v12 appendBytes:&v18 length:1];
  [v12 appendBytes:&v17 length:1];
  [v12 appendBytes:&v16 length:8];
  [v12 appendBytes:&v15 length:1];
  unsigned __int16 v13 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v21 = "+[CSMyriadPHash createHashResult:goodness:confidence:absTime:frac:]";
    __int16 v22 = 2114;
    *(void *)uint64_t v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Advert data: %{public}@", buf, 0x16u);
  }
  return v12;
}

+ (id)createRemoraHashResult:(unsigned __int16)a3 goodness:(unsigned __int8)a4 confidence:(unsigned __int8)a5 firstPassTriggerEndTime:(double)a6 frac:(unsigned __int8)a7
{
  unsigned __int16 v14 = a3;
  unsigned __int8 v13 = a4;
  unsigned __int8 v12 = a5;
  double v11 = a6;
  unsigned __int8 v10 = a7;
  int v7 = +[NSMutableData dataWithCapacity:13];
  [v7 appendBytes:&v14 length:2];
  [v7 appendBytes:&v13 length:1];
  [v7 appendBytes:&v12 length:1];
  [v7 appendBytes:&v11 length:8];
  [v7 appendBytes:&v10 length:1];
  uint64_t v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v16 = "+[CSMyriadPHash createRemoraHashResult:goodness:confidence:firstPassTriggerEndTime:frac:]";
    __int16 v17 = 2114;
    unsigned __int8 v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Advert data: %{public}@", buf, 0x16u);
  }
  return v7;
}

+ (id)createRemoraHashResultFromPHash:(id)a3 firstPassTriggerEndTime:(double)a4
{
  id v5 = a3;
  uint64_t v6 = *(unsigned __int16 *)[v5 bytes];
  id v7 = v5;
  uint64_t v8 = *((unsigned __int8 *)[v7 bytes] + 2);
  id v9 = v7;
  uint64_t v10 = *((unsigned __int8 *)[v9 bytes] + 3);
  id v11 = v9;
  unsigned __int8 v12 = (unsigned __int8 *)[v11 bytes];

  uint64_t v13 = v12[12];
  return +[CSMyriadPHash createRemoraHashResult:v6 goodness:v8 confidence:v10 firstPassTriggerEndTime:v13 frac:a4];
}

+ (void)notifyHashlessTrigger:(unint64_t)a3
{
  id v3 = +[CSMyriadPHash generateEmptyPHash:a3 writeFile:1];
  +[CSMyriadPHash notifyAudioHashlessNotification];
}

+ (double)signalEstimateWithBuilder:(id)a3
{
  id v3 = (*((void (**)(id, uint64_t))a3 + 2))(a3, 4096);
  BOOL v4 = objc_alloc_init(CSMyriadPHash);
  if (v3)
  {
    id v5 = [v3 data];
    id v6 = [v5 length];
    double v7 = -1.0;
    if (v6)
    {
      id v8 = v6;
      if (+[CSUtils supportHomeKitAccessory])
      {
        id v9 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315651;
          unsigned __int8 v18 = "+[CSMyriadPHash(SignalEstimate) signalEstimateWithBuilder:]";
          __int16 v19 = 2049;
          uint64_t v20 = 4096;
          __int16 v21 = 2049;
          id v22 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s BTLE raw audio size = %{private}ld, audio length = %{private}ld", buf, 0x20u);
        }
        if (+[CSConfig inputRecordingIsFloat])
        {
          uint64_t v10 = malloc_type_malloc(0x4000uLL, 0xD30E96FAuLL);
          bzero(v10, 0x4000uLL);
          id v11 = (const float *)[v5 bytes];
          *(_DWORD *)buf = 1191181824;
          float __C = 1.0;
          float __B = -1.0;
          vDSP_vclip(v11, 1, &__B, &__C, (float *)v10, 1, 0x1000uLL);
          vDSP_vsmul((const float *)v10, 1, (const float *)buf, (float *)v10, 1, 0x1000uLL);
          [(CSMyriadPHash *)v4 _signalEstimate:v10 length:v8];
          double v7 = log10(v12) * 10.0;
          free(v10);
        }
        else
        {
          uint64_t v13 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            unsigned __int8 v18 = "+[CSMyriadPHash(SignalEstimate) signalEstimateWithBuilder:]";
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Input recording is not float", buf, 0xCu);
          }
        }
      }
    }
  }
  else
  {
    double v7 = -1.0;
  }

  return v7;
}

@end