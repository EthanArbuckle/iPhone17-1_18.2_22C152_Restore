@interface CSSmartSiriVolume
- (CSAudioStream)audioStream;
- (CSPolicy)enablePolicy;
- (CSSmartSiriVolume)initWithSamplingRate:(float)a3;
- (OS_dispatch_source)listenPollingTimer;
- (float)_combineResultsWithOptimalFromNoise:(float)a3 andOptimalFromLkfs:(float)a4 withUserOffset:(float)a5;
- (float)_convertDB2Mag:(float)a3;
- (float)_deviceSpecificDBToLinearVolumeMappingCSSSVDeviceSimple:(float)a3;
- (float)_deviceSpecificLinearVolumeToDBMappingCSSSVDeviceSimple:(float)a3;
- (float)_estimatedTTSVolume:(float)a3 lowerLimit:(float)a4 upperLimit:(float)a5 TTSmappingInputRangeLow:(float)a6 TTSmappingInputRangeHigh:(float)a7 TTSmappingOutputRangeLow:(float)a8 TTSmappingOutputRangeHigh:(float)a9;
- (float)_getDeviceSimpleOutputLinearVolumeFordBFSValue:(float)a3;
- (float)_getDeviceSimpledBFSForOutputLinearVolume:(float)a3;
- (float)_getDevicedBFSForInputLinearVolume:(float)a3;
- (float)_getFloatBufferData:(id)a3;
- (float)_getMusicVolumeDBCSSSVDeviceDefault:(float)a3;
- (float)_getMusicVolumeDBCSSSVDeviceSimple:(float)a3;
- (float)_getUserOffsetFromMusicVolumeDB:(float)a3;
- (float)_scaleInputWithInRangeOutRange:(float)a3 minIn:(float)a4 maxIn:(float)a5 minOut:(float)a6 maxOut:(float)a7;
- (float)estimateSoundLevelbySoundType:(int64_t)a3;
- (float)estimatedTTSVolumeForNoiseLevelAndLKFS:(float)a3 LKFS:(float)a4;
- (id).cxx_construct;
- (id)getVolumeForTTSType:(unint64_t)a3 withOverrideMediaVolume:(id)a4 WithRequestTime:(unint64_t)a5;
- (int64_t)listenPollingTimerCount;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)CSMediaPlayingMonitor:(id)a3 didReceiveMediaPlayingChanged:(int64_t)a4;
- (void)_pauseSSVProcessing;
- (void)_prepareSoundLevelBufferFromSamples:(unsigned int)a3 soundType:(int64_t)a4;
- (void)_processAudioChunk:(id)a3 soundType:(int64_t)a4;
- (void)_reset;
- (void)_resetStartAnalyzeTime;
- (void)_resumeSSVProcessing;
- (void)_setAsset:(id)a3;
- (void)_setDefaultParameters;
- (void)_setStartAnalyzeTime:(unint64_t)a3;
- (void)_startListenPolling;
- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4;
- (void)_startListenWithCompletion:(id)a3;
- (void)_stopListening;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)didDetectKeywordWithResult:(id)a3;
- (void)didReceiveAlarmChanged:(int64_t)a3;
- (void)didReceiveAlarmVolumeChanged:(float)a3;
- (void)didReceiveMusicVolumeChanged:(float)a3;
- (void)didReceiveTimerChanged:(int64_t)a3;
- (void)fetchInitSystemVolumes;
- (void)initializeAlarmState;
- (void)initializeMediaPlayingState;
- (void)initializeTimerState;
- (void)prepareSoundLevelBufferFromSamples:(id)a3 soundType:(int64_t)a4 firedVoiceTriggerEvent:(BOOL)a5 triggerStartTimeSampleOffset:(unint64_t)a6 triggerEndTimeSampleOffset:(unint64_t)a7;
- (void)reset;
- (void)setAsset:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setEnablePolicy:(id)a3;
- (void)setListenPollingTimer:(id)a3;
- (void)setListenPollingTimerCount:(int64_t)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)startSmartSiriVolume;
@end

@implementation CSSmartSiriVolume

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enablePolicy, 0);
  objc_storeStrong((id *)&self->_listenPollingTimer, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_ssvEnablePolicy, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  begin = self->_floatBuffer.__begin_;
  if (begin)
  {
    self->_floatBuffer.__end_ = begin;
    operator delete(begin);
  }
  sub_1000A0BA8((uint64_t *)&self->_smartSiriVolumeLKFS, 0);
  sub_1000A0BA8((uint64_t *)&self->_smartSiriVolumeNoiseLevel, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setEnablePolicy:(id)a3
{
}

- (CSPolicy)enablePolicy
{
  return self->_enablePolicy;
}

- (void)setListenPollingTimerCount:(int64_t)a3
{
  self->_listenPollingTimerCount = a3;
}

- (int64_t)listenPollingTimerCount
{
  return self->_listenPollingTimerCount;
}

- (void)setListenPollingTimer:(id)a3
{
}

- (OS_dispatch_source)listenPollingTimer
{
  return self->_listenPollingTimer;
}

- (void)setAudioStream:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (id)getVolumeForTTSType:(unint64_t)a3 withOverrideMediaVolume:(id)a4 WithRequestTime:(unint64_t)a5
{
  -[CSSmartSiriVolume estimateSoundLevelbySoundType:](self, "estimateSoundLevelbySoundType:", 0, a4, a5);
  int v7 = v6;
  [(CSSmartSiriVolume *)self estimateSoundLevelbySoundType:1];
  LODWORD(v9) = v8;
  LODWORD(v10) = v7;
  [(CSSmartSiriVolume *)self estimatedTTSVolumeForNoiseLevelAndLKFS:v10 LKFS:v9];
  float v12 = v11;
  v13 = CSLogCategoryASV;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = +[CSVolumeMonitor sharedInstance];
    [v14 musicVolume];
    int v20 = 136315650;
    v21 = "-[CSSmartSiriVolume getVolumeForTTSType:withOverrideMediaVolume:WithRequestTime:]";
    __int16 v22 = 2050;
    double v23 = v12;
    __int16 v24 = 2050;
    double v25 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume: final estimated TTS volume %{public}f with music volume %{public}f", (uint8_t *)&v20, 0x20u);
  }
  v16 = [CSSmartSiriVolumeEstimate alloc];
  *(float *)&double v17 = v12;
  v18 = [(CSSmartSiriVolumeEstimate *)v16 initWithVolumeEstimate:0 debugLogFile:v17];
  return v18;
}

- (float)_getUserOffsetFromMusicVolumeDB:(float)a3
{
  if ((id)+[CSAsset getSSVDeviceType] != (id)2) {
    return a3;
  }
  *(float *)&double v5 = a3;
  [(CSSmartSiriVolume *)self _deviceSpecificDBToLinearVolumeMappingCSSSVDeviceSimple:v5];
  -[CSSmartSiriVolume _getDeviceSimpledBFSForOutputLinearVolume:](self, "_getDeviceSimpledBFSForOutputLinearVolume:");
  return result;
}

- (float)_getMusicVolumeDBCSSSVDeviceDefault:(float)a3
{
  -[CSSmartSiriVolume _scaleInputWithInRangeOutRange:minIn:maxIn:minOut:maxOut:](self, "_scaleInputWithInRangeOutRange:minIn:maxIn:minOut:maxOut:");
  return result;
}

- (float)_getMusicVolumeDBCSSSVDeviceSimple:(float)a3
{
  -[CSSmartSiriVolume _deviceSpecificLinearVolumeToDBMappingCSSSVDeviceSimple:](self, "_deviceSpecificLinearVolumeToDBMappingCSSSVDeviceSimple:");
  return result;
}

- (float)_getDevicedBFSForInputLinearVolume:(float)a3
{
  if ((id)+[CSAsset getSSVDeviceType] == (id)2)
  {
    *(float *)&double v5 = a3;
    [(CSSmartSiriVolume *)self _getMusicVolumeDBCSSSVDeviceSimple:v5];
  }
  else
  {
    *(float *)&double v5 = a3;
    [(CSSmartSiriVolume *)self _getMusicVolumeDBCSSSVDeviceDefault:v5];
  }
  return result;
}

- (float)_convertDB2Mag:(float)a3
{
  return __exp10f(a3 / 20.0);
}

- (void)_setDefaultParameters
{
  *(_OWORD *)&self->_noiseLevelChannelBitset = xmmword_1001AC6D0;
  *(_OWORD *)&self->_energyBufferSize = xmmword_1001AC6E0;
  self->_LKFSUpperPercentile = 95;
  *(_OWORD *)&self->_noiseTimeConstant = xmmword_1001AC6F0;
  *(_OWORD *)&self->_LKFSMicSensitivityOffset = xmmword_1001AC700;
  *(_OWORD *)&self->_noiseTTSMappingOutputRangeHigh = xmmword_1001AC710;
  *(_OWORD *)&self->_LKFSTTSMappingOutputRangeHigh = xmmword_1001AC720;
  *(_OWORD *)&self->_userOffsetOutputRangeHigh = xmmword_1001AC730;
}

- (void)_setStartAnalyzeTime:(unint64_t)a3
{
  if (!self->_isStartSampleCountMarked)
  {
    self->_isStartSampleCountMarked = 1;
    self->_startAnalyzeSampleCount = a3;
    self->_samplesFed = 0;
    v4 = CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      int v6 = "-[CSSmartSiriVolume _setStartAnalyzeTime:]";
      __int16 v7 = 2050;
      unint64_t v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume: set StartAnalyzeSampleCount = %{public}lld", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)_resetStartAnalyzeTime
{
  self->_isStartSampleCountMarked = 0;
  self->_startAnalyzeSampleCount = 0;
  self->_samplesFed = 0;
}

- (float)_getFloatBufferData:(id)a3
{
  id v3 = a3;
  if (+[CSConfig inputRecordingIsFloat])
  {
    v4 = (float *)[v3 bytes];
  }
  else
  {
    id v5 = +[CSFLPCMTypeConverter convertToFloatLPCMBufFromShortLPCMBuf:v3];
    v4 = (float *)[v5 bytes];
  }
  return v4;
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A11BC;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  v4 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v8 = "-[CSSmartSiriVolume CSAudioServerCrashMonitorDidReceiveServerRestart:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s audiomxd/bridgeaudiod recovered from crash", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A13E4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)didReceiveAlarmVolumeChanged:(float)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A14D8;
  v4[3] = &unk_1002533A8;
  v4[4] = self;
  float v5 = a3;
  dispatch_async(queue, v4);
}

- (void)didReceiveMusicVolumeChanged:(float)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A1560;
  v4[3] = &unk_1002533A8;
  v4[4] = self;
  float v5 = a3;
  dispatch_async(queue, v4);
}

- (void)didReceiveTimerChanged:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A1608;
  v4[3] = &unk_100253B58;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)didReceiveAlarmChanged:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A180C;
  v4[3] = &unk_100253B58;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)CSMediaPlayingMonitor:(id)a3 didReceiveMediaPlayingChanged:(int64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A1A10;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (float)_combineResultsWithOptimalFromNoise:(float)a3 andOptimalFromLkfs:(float)a4 withUserOffset:(float)a5
{
  double v9 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315906;
    float v15 = "-[CSSmartSiriVolume _combineResultsWithOptimalFromNoise:andOptimalFromLkfs:withUserOffset:]";
    __int16 v16 = 2050;
    double v17 = a3;
    __int16 v18 = 2050;
    double v19 = a4;
    __int16 v20 = 2050;
    double v21 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume: TTS volume in dB from noise %{public}f, from LKFS %{public}f, with user offset %{public}f", (uint8_t *)&v14, 0x2Au);
  }
  double v10 = +[CSFPreferences sharedPreferences];
  if ([v10 smartSiriVolumeSoftVolumeEnabled])
  {
    BOOL v11 = !self->_shouldPauseLKFSProcess;

    if (!v11)
    {
      float v12 = CSLogCategoryASV;
      if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315138;
        float v15 = "-[CSSmartSiriVolume _combineResultsWithOptimalFromNoise:andOptimalFromLkfs:withUserOffset:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume: soft volume algorithm in use", (uint8_t *)&v14, 0xCu);
      }
      if ((float)(a4 + a5) >= a3) {
        return (float)((float)(a4 + a5) * (float)(1.0 - self->_noiseWeight)) + (float)(self->_noiseWeight * a3);
      }
      return a3;
    }
  }
  else
  {
  }
  if ((float)(a4 + a5) > a3) {
    return a4 + a5;
  }
  return a3;
}

- (float)_estimatedTTSVolume:(float)a3 lowerLimit:(float)a4 upperLimit:(float)a5 TTSmappingInputRangeLow:(float)a6 TTSmappingInputRangeHigh:(float)a7 TTSmappingOutputRangeLow:(float)a8 TTSmappingOutputRangeHigh:(float)a9
{
  if (a3 < a4) {
    return a8;
  }
  if (a3 > a5) {
    return a9;
  }
  -[CSSmartSiriVolume _scaleInputWithInRangeOutRange:minIn:maxIn:minOut:maxOut:](self, "_scaleInputWithInRangeOutRange:minIn:maxIn:minOut:maxOut:");
  *(float *)&double v14 = 1.0 / (float)(expf(-v13) + 1.0);
  LODWORD(v15) = 1.0;
  *(float *)&double v16 = a8;
  *(float *)&double v17 = a9;
  [(CSSmartSiriVolume *)self _scaleInputWithInRangeOutRange:v14 minIn:0.0 maxIn:v15 minOut:v16 maxOut:v17];
  return result;
}

- (float)_scaleInputWithInRangeOutRange:(float)a3 minIn:(float)a4 maxIn:(float)a5 minOut:(float)a6 maxOut:(float)a7
{
  return (float)(a6 - (float)((float)((float)(a6 - a7) / (float)(a4 - a5)) * a4))
       + (float)((float)((float)(a6 - a7) / (float)(a4 - a5)) * a3);
}

- (float)_deviceSpecificLinearVolumeToDBMappingCSSSVDeviceSimple:(float)a3
{
  return fminf(fmaxf((float)(fminf(fmaxf(a3, 0.0), 1.0) / 0.018182) + -55.0, -55.0), 0.0);
}

- (float)_deviceSpecificDBToLinearVolumeMappingCSSSVDeviceSimple:(float)a3
{
  return fminf(fmaxf((float)(fminf(fmaxf(a3, -55.0), 0.0) + 55.0) * 0.018182, 0.0), 1.0);
}

- (float)_getDeviceSimpledBFSForOutputLinearVolume:(float)a3
{
  return fminf(fmaxf((float)(fminf(fmaxf(a3, 0.0), 1.0) / 0.017241) + -58.0, -58.0), 0.0);
}

- (float)_getDeviceSimpleOutputLinearVolumeFordBFSValue:(float)a3
{
  return fminf(fmaxf((float)(fminf(fmaxf(a3, -58.0), 0.0) + 58.0) * 0.017241, 0.0), 1.0);
}

- (float)estimatedTTSVolumeForNoiseLevelAndLKFS:(float)a3 LKFS:(float)a4
{
  uint64_t v14 = 0;
  double v15 = (float *)&v14;
  uint64_t v16 = 0x2020000000;
  int v17 = -998637568;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  int v13 = -1041235968;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  int v11 = -1041235968;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A1FFC;
  block[3] = &unk_100250530;
  float v8 = a3;
  float v9 = a4;
  block[4] = self;
  void block[5] = v10;
  block[6] = v12;
  block[7] = &v14;
  dispatch_sync(queue, block);
  float v5 = v15[6];
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);
  return v5;
}

- (void)didDetectKeywordWithResult:(id)a3
{
  id v4 = a3;
  float v5 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    float v12 = "-[CSSmartSiriVolume didDetectKeywordWithResult:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume received VT event!", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A265C;
  v8[3] = &unk_100253B08;
  id v9 = v4;
  double v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  id v6 = a3;
  id v7 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v11 = "-[CSSmartSiriVolume audioStreamProvider:didStopStreamUnexpectedly:]";
    __int16 v12 = 2050;
    int64_t v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s stream stopped unexpectedly : %{public}ld", buf, 0x16u);
  }
  if (a4 != -11785)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A2D50;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A2E64;
  v8[3] = &unk_100253B08;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)reset
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A3100;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_resumeSSVProcessing
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A3260;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_pauseSSVProcessing
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A33A4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (float)estimateSoundLevelbySoundType:(int64_t)a3
{
  uint64_t v7 = 0;
  float v8 = (float *)&v7;
  uint64_t v9 = 0x2020000000;
  int v10 = -998637568;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A352C;
  block[3] = &unk_100252430;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  float v4 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_processAudioChunk:(id)a3 soundType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = qword_1002A3860;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * qword_1002A3860, 2) <= 0x444444444444444uLL)
  {
    float v8 = CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSSmartSiriVolume _processAudioChunk:soundType:]";
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s SmartSiriVolume heartbeat = %{public}lld", buf, 0x16u);
      uint64_t v7 = qword_1002A3860;
    }
  }
  qword_1002A3860 = v7 + 1;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  int v17 = 0;
  uint64_t v9 = 128;
  if (!a4) {
    uint64_t v9 = 120;
  }
  uint64_t v10 = *(uint64_t *)((char *)&self->super.isa + v9);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000A39DC;
  void v12[3] = &unk_100250508;
  id v11 = v6;
  id v13 = v11;
  uint64_t v14 = self;
  double v15 = buf;
  +[CSUtils iterateBitset:v10 block:v12];
  [(CSSmartSiriVolume *)self _prepareSoundLevelBufferFromSamples:*(unsigned int *)(*(void *)&buf[8] + 24) soundType:a4];

  _Block_object_dispose(buf, 8);
}

- (void)prepareSoundLevelBufferFromSamples:(id)a3 soundType:(int64_t)a4 firedVoiceTriggerEvent:(BOOL)a5 triggerStartTimeSampleOffset:(unint64_t)a6 triggerEndTimeSampleOffset:(unint64_t)a7
{
  id v12 = a3;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000A3B78;
  v15[3] = &unk_1002504E0;
  id v16 = v12;
  int v17 = self;
  BOOL v21 = a5;
  int64_t v18 = a4;
  unint64_t v19 = a6;
  unint64_t v20 = a7;
  id v14 = v12;
  dispatch_async(queue, v15);
}

- (void)_prepareSoundLevelBufferFromSamples:(unsigned int)a3 soundType:(int64_t)a4
{
  if (a4)
  {
    *(float *)&double v4 = self->_musicVolumeDB;
    [(CSSmartSiriVolume *)self _convertDB2Mag:v4];
    sub_1000A3CAC((uint64_t)self->_smartSiriVolumeLKFS.__ptr_.__value_, (uint64_t)self->_floatBuffer.__begin_, a3);
    value = (uint64_t *)self->_smartSiriVolumeLKFS.__ptr_.__value_;
  }
  else
  {
    sub_1000A3CAC((uint64_t)self->_smartSiriVolumeNoiseLevel.__ptr_.__value_, (uint64_t)self->_floatBuffer.__begin_, a3);
    value = (uint64_t *)self->_smartSiriVolumeNoiseLevel.__ptr_.__value_;
  }
  sub_1000A3DC0(value);
  sub_1000A3F74((uint64_t)value, v8);
}

- (void)_reset
{
  p_floatBuffer = (char **)&self->_floatBuffer;
  unsigned int v4 = +[CSUtils getNumElementInBitset:self->_noiseLevelChannelBitset];
  unsigned int v5 = +[CSUtils getNumElementInBitset:self->_LKFSChannelBitset];
  if (v4 <= v5) {
    unsigned int v6 = v5;
  }
  else {
    unsigned int v6 = v4;
  }
  sub_1000A44EC(p_floatBuffer, v6 << 10);
  *(_DWORD *)&self->_shouldPauseSSVProcess = 0;
  self->_mediaIsPlaying = 1;
  self->_processedSampleCount = 0;
  [(CSSmartSiriVolume *)self _resetStartAnalyzeTime];
}

- (void)_setAsset:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    p_currentAsset = &self->_currentAsset;
    objc_storeStrong((id *)&self->_currentAsset, a3);
    self->_noiseLevelChannelBitset = [(CSAsset *)self->_currentAsset SSVNoiseLevelChannelBitset];
    self->_LKFSChannelBitset = [(CSAsset *)self->_currentAsset SSVLKFSChannelBitset];
    self->_energyBufferSize = [(CSAsset *)self->_currentAsset SSVEnergyBufferSize];
    self->_noiseLowerPercentile = [(CSAsset *)self->_currentAsset SSVNoiseLowerPercentile];
    self->_noiseUpperPercentile = [(CSAsset *)self->_currentAsset SSVNoiseUpperPercentile];
    self->_LKFSLowerPercentile = [(CSAsset *)self->_currentAsset SSVLKFSLowerPercentile];
    self->_LKFSUpperPercentile = [(CSAsset *)self->_currentAsset SSVLKFSUpperPercentile];
    [(CSAsset *)self->_currentAsset SSVNoiseTimeConstant];
    self->_noiseTimeConstant = v7;
    [(CSAsset *)self->_currentAsset SSVNoiseMicSensitivityOffset];
    self->_noiseMicSensitivityOffset = v8;
    [(CSAsset *)self->_currentAsset SSVNoiseMicSensitivityOffsetDeviceSimple];
    self->_noiseMicSensitivityOffsetDeviceSimple = v9;
    [(CSAsset *)self->_currentAsset SSVLKFSTimeConstant];
    self->_LKFSTimeConstant = v10;
    [(CSAsset *)self->_currentAsset SSVLKFSMicSensitivityOffset];
    self->_LKFSMicSensitivityOffset = v11;
    [(CSAsset *)self->_currentAsset SSVNoiseTTSMappingInputRangeLow];
    self->_noiseTTSMappingInputRangeLow = v12;
    [(CSAsset *)self->_currentAsset SSVNoiseTTSMappingInputRangeHigh];
    self->_noiseTTSMappingInputRangeHigh = v13;
    [(CSAsset *)self->_currentAsset SSVNoiseTTSMappingOutputRangeLow];
    self->_noiseTTSMappingOutputRangeLow = v14;
    [(CSAsset *)self->_currentAsset SSVNoiseTTSMappingOutputRangeHigh];
    self->_noiseTTSMappingOutputRangeHigh = v15;
    [(CSAsset *)self->_currentAsset SSVLKFSTTSMappingInputRangeLow];
    self->_LKFSTTSMappingInputRangeLow = v16;
    [(CSAsset *)self->_currentAsset SSVLKFSTTSMappingInputRangeHigh];
    self->_LKFSTTSMappingInputRangeHigh = v17;
    [(CSAsset *)self->_currentAsset SSVLKFSTTSMappingOutputRangeLow];
    self->_LKFSTTSMappingOutputRangeLow = v18;
    [(CSAsset *)self->_currentAsset SSVLKFSTTSMappingOutputRangeHigh];
    self->_LKFSTTSMappingOutputRangeHigh = v19;
    [(CSAsset *)self->_currentAsset SSVUserOffsetInputRangeLow];
    self->_userOffsetInputRangeLow = v20;
    [(CSAsset *)self->_currentAsset SSVUserOffsetInputRangeHigh];
    self->_userOffsetInputRangeHigh = v21;
    [(CSAsset *)self->_currentAsset SSVUserOffsetOutputRangeLow];
    self->_userOffsetOutputRangeLow = v22;
    [(CSAsset *)self->_currentAsset SSVUserOffsetOutputRangeHigh];
    self->_userOffsetOutputRangeHigh = v23;
    [(CSAsset *)self->_currentAsset SSVTTSVolumeLowerLimitDB];
    self->_TTSVolumeLowerLimitDB = v24;
    [(CSAsset *)self->_currentAsset SSVTTSVolumeUpperLimitDB];
    self->_TTSVolumeUpperLimitDB = v25;
    [(CSAsset *)self->_currentAsset SSVNoiseWeight];
    self->_noiseWeight = v26;
    v27 = CSLogCategoryASV;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = [(CSAsset *)*p_currentAsset SSVParameterDirectionary];
      int v30 = 136315394;
      v31 = "-[CSSmartSiriVolume _setAsset:]";
      __int16 v32 = 2114;
      v33 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume configure: %{public}@", (uint8_t *)&v30, 0x16u);
    }
  }
  else
  {
    v29 = CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      int v30 = 136315138;
      v31 = "-[CSSmartSiriVolume _setAsset:]";
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s asset is nil, use default parameters(this should not happen).", (uint8_t *)&v30, 0xCu);
    }
  }
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A4968;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)fetchInitSystemVolumes
{
  id v3 = +[CSVolumeMonitor sharedInstance];
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A4A18;
  v6[3] = &unk_100253B08;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(queue, v6);
}

- (void)initializeTimerState
{
  id v3 = +[CSTimerMonitor sharedInstance];
  [v3 initializeTimerState];
  id v4 = (char *)[v3 timerState];
  if ((unint64_t)(v4 - 1) <= 1)
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000A4B24;
    v6[3] = &unk_100253B58;
    v6[4] = self;
    void v6[5] = v4;
    dispatch_async(queue, v6);
  }
}

- (void)initializeAlarmState
{
  id v3 = +[CSAlarmMonitor sharedInstance];
  [v3 initializeAlarmState];
  id v4 = (char *)[v3 alarmState];
  if ((unint64_t)(v4 - 1) <= 1)
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000A4CD0;
    v6[3] = &unk_100253B58;
    v6[4] = self;
    void v6[5] = v4;
    dispatch_async(queue, v6);
  }
}

- (void)initializeMediaPlayingState
{
  id v3 = +[CSMediaPlayingMonitor sharedInstance];
  [v3 addObserver:self];
  [v3 initializeMediaPlayingState];
  id v4 = (char *)[v3 mediaPlayingState];
  if ((unint64_t)(v4 - 1) > 1)
  {
    id v6 = CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      float v9 = "-[CSSmartSiriVolume initializeMediaPlayingState]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume haven't got MediaRemote callback yet, let's assume media is playing.", buf, 0xCu);
    }
  }
  else
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000A4F18;
    v7[3] = &unk_100253B58;
    v7[4] = self;
    void v7[5] = v4;
    dispatch_async(queue, v7);
  }
}

- (void)_stopListening
{
  id v3 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    float v9 = "-[CSSmartSiriVolume _stopListening]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v8, 0xCu);
  }
  id v4 = [(CSSmartSiriVolume *)self audioStream];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    id v7 = CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      float v9 = "-[CSSmartSiriVolume _stopListening]";
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s No audio stream to stop, we shouldn't hit this", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    id v6 = [(CSSmartSiriVolume *)self audioStream];
    [v6 stopAudioStreamWithOption:0 completion:&stru_1002504B8];
  }
}

- (void)_startListenWithCompletion:(id)a3
{
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000A564C;
  v23[3] = &unk_100253100;
  id v4 = a3;
  id v24 = v4;
  BOOL v5 = objc_retainBlock(v23);
  id v6 = +[CSAudioRecordContext contextForBuiltInVoiceTrigger];
  id v7 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
  id v22 = 0;
  int v8 = [v7 audioProviderWithContext:v6 error:&v22];
  id v9 = v22;

  if (v8)
  {
    id v18 = v8;
    float v10 = +[CSAudioStreamRequest defaultRequestWithContext:v6];
    [v10 setRequiresHistoricalBuffer:1];
    float v11 = (objc_class *)objc_opt_class();
    float v12 = NSStringFromClass(v11);
    id v21 = 0;
    float v13 = [v18 audioStreamWithRequest:v10 streamName:v12 error:&v21];
    id v14 = v21;

    if (v13)
    {
      [(CSSmartSiriVolume *)self setAudioStream:v13];
      [v13 setDelegate:self];
      float v15 = +[CSAudioStartStreamOption noAlertOption];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000A56C4;
      v19[3] = &unk_100253150;
      v19[4] = self;
      float v20 = v5;
      [v13 startAudioStreamWithOption:v15 completion:v19];
    }
    else
    {
      float v16 = CSLogCategoryASV;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        float v17 = [v14 description];
        *(_DWORD *)buf = 136315394;
        float v26 = "-[CSSmartSiriVolume _startListenWithCompletion:]";
        __int16 v27 = 2114;
        v28 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Failed in requesting audio stream : %{public}@", buf, 0x16u);
      }
      ((void (*)(void *, void, id))v5[2])(v5, 0, v14);
    }
  }
  else
  {
    ((void (*)(void *, void, id))v5[2])(v5, 0, v9);
  }
}

- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    float v16 = "-[CSSmartSiriVolume _startListenPollingWithInterval:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  int v8 = [(CSSmartSiriVolume *)self audioStream];
  if ([v8 isStreaming])
  {
  }
  else
  {
    id v9 = [(CSSmartSiriVolume *)self enablePolicy];
    unsigned int v10 = [v9 isEnabled];

    if (v10)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000A5B78;
      void v12[3] = &unk_1002530D8;
      void v12[4] = self;
      double v14 = a3;
      id v13 = v6;
      [(CSSmartSiriVolume *)self _startListenWithCompletion:v12];

      goto LABEL_11;
    }
  }
  float v11 = CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    float v16 = "-[CSSmartSiriVolume _startListenPollingWithInterval:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Skip listen polling since audio is streaming / Siri disabled", buf, 0xCu);
  }
  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
LABEL_11:
}

- (void)_startListenPolling
{
  if (self->_isListenPollingStarting)
  {
    v2 = CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v5 = "-[CSSmartSiriVolume _startListenPolling]";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Already started listen polling, skip", buf, 0xCu);
    }
  }
  else
  {
    self->_isListenPollingStarting = 1;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000A5F00;
    v3[3] = &unk_1002531E0;
    v3[4] = self;
    [(CSSmartSiriVolume *)self _startListenPollingWithInterval:v3 completion:1.0];
  }
}

- (void)startSmartSiriVolume
{
  [(CSSmartSiriVolume *)self initializeMediaPlayingState];
  [(CSSmartSiriVolume *)self initializeAlarmState];
  [(CSSmartSiriVolume *)self initializeTimerState];
  [(CSSmartSiriVolume *)self fetchInitSystemVolumes];
  objc_initWeak(&location, self);
  id v3 = +[CSSmartSiriVolumeEnablePolicyFactory smartSiriVolumeEnablePolicy];
  ssvEnablePolicy = self->_ssvEnablePolicy;
  self->_ssvEnablePolicy = v3;

  BOOL v5 = self->_ssvEnablePolicy;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A61C0;
  v16[3] = &unk_100252EE0;
  objc_copyWeak(&v17, &location);
  [(CSPolicy *)v5 setCallback:v16];
  if (([(CSPolicy *)self->_ssvEnablePolicy isEnabled] & 1) == 0) {
    [(CSSmartSiriVolume *)self _pauseSSVProcessing];
  }
  id v6 = +[CSSmartSiriVolumeRunPolicyFactory smartSiriVolumeRunPolicy];
  [(CSSmartSiriVolume *)self setEnablePolicy:v6];

  id v7 = [(CSSmartSiriVolume *)self enablePolicy];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A62E0;
  v14[3] = &unk_100252EE0;
  objc_copyWeak(&v15, &location);
  [v7 setCallback:v14];

  int v8 = [(CSSmartSiriVolume *)self enablePolicy];
  unsigned int v9 = [v8 isEnabled];

  if (v9)
  {
    queue = self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000A6350;
    v13[3] = &unk_100253AE0;
    v13[4] = self;
    dispatch_async(queue, v13);
  }
  float v11 = +[CSAudioServerCrashMonitor sharedInstance];
  [v11 addObserver:self];

  float v12 = +[CSSiriClientBehaviorMonitor sharedInstance];
  [v12 registerObserver:self];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (CSSmartSiriVolume)initWithSamplingRate:(float)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CSSmartSiriVolume;
  id v3 = [(CSSmartSiriVolume *)&v13 init];
  if (v3)
  {
    id v4 = [(id)objc_opt_class() description];
    dispatch_queue_t v5 = dispatch_queue_create((const char *)[v4 UTF8String], 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    [(CSSmartSiriVolume *)v3 _setDefaultParameters];
    float noiseMicSensitivityOffset = v3->_noiseMicSensitivityOffset;
    if ((id)+[CSAsset getSSVDeviceType] == (id)2) {
      float noiseMicSensitivityOffset = v3->_noiseMicSensitivityOffsetDeviceSimple;
    }
    *(float *)&double v8 = (float)((float)(v3->_noiseTTSMappingInputRangeLow + v3->_noiseTTSMappingInputRangeHigh) * 0.5)
                  - noiseMicSensitivityOffset;
    [(CSSmartSiriVolume *)v3 _convertDB2Mag:v8];
    float v10 = v9;
    float v11 = CSLogCategoryASV;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "-[CSSmartSiriVolume initWithSamplingRate:]";
      __int16 v16 = 2050;
      double v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume init value for noise estimation %{public}f", buf, 0x16u);
    }
    operator new();
  }
  return 0;
}

@end