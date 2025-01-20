@interface CSEndpointerProxy
- (BOOL)_updateAccessibleEndpointerThresholdIfNeed;
- (BOOL)accessibleEndpointerEnabled;
- (BOOL)isWatchRTSTriggered;
- (BOOL)recordingDidStop;
- (BOOL)saveSamplesSeenInReset;
- (BOOL)shouldAcceptEagerResultForDurationSync:(double)a3 withEndpointerMetrics:(id)a4;
- (CSAudioRecordContext)recordContext;
- (CSEndpointAnalyzerDelegate)endpointerDelegate;
- (CSEndpointAnalyzerImpl)activeEndpointer;
- (CSEndpointAnalyzerImpl)hybridEndpointer;
- (CSEndpointAnalyzerImpl)nnvadEndpointer;
- (CSEndpointAnalyzerImplDelegate)endpointerImplDelegate;
- (CSEndpointerProxy)init;
- (double)automaticEndpointingSuspensionEndTime;
- (double)delay;
- (double)endWaitTime;
- (double)interspeechWaitTime;
- (double)lastEndOfVoiceActivityTime;
- (double)lastStartOfVoiceActivityTime;
- (double)minimumDurationForEndpointer;
- (double)postVoiceTriggerSilence;
- (double)startWaitTime;
- (id)cachedEndpointerMetrics;
- (id)endpointerModelVersion;
- (id)initForSidekick;
- (int64_t)endpointStyle;
- (int64_t)fetchCurrentEndpointerOperationMode;
- (unint64_t)endPointAnalyzerType;
- (void)_setupNNVADEndpointer;
- (void)endpointer:(id)a3 detectedTwoShotAtTime:(double)a4;
- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5;
- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 endpointerModelType:(int64_t)a6;
- (void)endpointer:(id)a3 didDetectStartpointAtTime:(double)a4;
- (void)endpointer:(id)a3 reportEndpointBufferHostTime:(unint64_t)a4 firstBufferHostTime:(unint64_t)a5;
- (void)logAnchorMachAbsTime:(unint64_t)a3 numSamplesProcessedBeforeAnchorTime:(unint64_t)a4 isAnchorTimeBuffered:(BOOL)a5 audioDeliveryHostTimeDelta:(unint64_t)a6;
- (void)logHybridEndpointFeaturesWithEvent:(id)a3 locale:(id)a4;
- (void)preheat;
- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4;
- (void)processAudioSamplesAsynchronously:(id)a3;
- (void)processFirstAudioPacketTimestamp:(id)a3 firstAudioSampleSensorTimestamp:(unint64_t)a4;
- (void)processOSDFeatures:(id)a3 withFrameDurationMs:(double)a4 withMHID:(id)a5;
- (void)processRCFeatures:(id)a3;
- (void)processTaskString:(id)a3;
- (void)recordingStoppedForReason:(int64_t)a3;
- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 recordOption:(id)a5 voiceTriggerInfo:(id)a6;
- (void)resetForVoiceTriggerTwoShotWithSampleRate:(unint64_t)a3;
- (void)setAccessibleEndpointerEnabled:(BOOL)a3;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setActiveEndpointer:(id)a3;
- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3;
- (void)setEndWaitTime:(double)a3;
- (void)setEndpointerDelegate:(id)a3;
- (void)setEndpointerImplDelegate:(id)a3;
- (void)setEndpointerOperationMode:(int64_t)a3;
- (void)setHybridEndpointer:(id)a3;
- (void)setNnvadEndpointer:(id)a3;
- (void)setRecordContext:(id)a3;
- (void)setRecordingDidStop:(BOOL)a3;
- (void)setRequestMHUUID:(id)a3;
- (void)setStartWaitTime:(double)a3;
- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4;
- (void)shouldAcceptEagerResultForDuration:(double)a3 withEndpointerMetrics:(id)a4 resultsCompletionHandler:(id)a5;
- (void)stopEndpointer;
- (void)updateEndpointerDelayedTrigger:(BOOL)a3;
- (void)updateEndpointerThreshold:(float)a3;
@end

@implementation CSEndpointerProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordContext, 0);
  objc_storeStrong((id *)&self->_nnvadEndpointer, 0);
  objc_storeStrong((id *)&self->_hybridEndpointer, 0);
  objc_destroyWeak((id *)&self->_activeEndpointer);
  objc_destroyWeak((id *)&self->_endpointerImplDelegate);
  objc_destroyWeak((id *)&self->_endpointerDelegate);
}

- (void)setRecordingDidStop:(BOOL)a3
{
  self->_recordingDidStop = a3;
}

- (BOOL)recordingDidStop
{
  return self->_recordingDidStop;
}

- (void)setAccessibleEndpointerEnabled:(BOOL)a3
{
  self->_accessibleEndpointerEnabled = a3;
}

- (BOOL)accessibleEndpointerEnabled
{
  return self->_accessibleEndpointerEnabled;
}

- (void)setRecordContext:(id)a3
{
}

- (CSAudioRecordContext)recordContext
{
  return self->_recordContext;
}

- (void)setNnvadEndpointer:(id)a3
{
}

- (CSEndpointAnalyzerImpl)nnvadEndpointer
{
  return self->_nnvadEndpointer;
}

- (void)setHybridEndpointer:(id)a3
{
}

- (CSEndpointAnalyzerImpl)hybridEndpointer
{
  return self->_hybridEndpointer;
}

- (void)setActiveEndpointer:(id)a3
{
}

- (CSEndpointAnalyzerImpl)activeEndpointer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeEndpointer);
  return (CSEndpointAnalyzerImpl *)WeakRetained;
}

- (void)setEndpointerImplDelegate:(id)a3
{
}

- (CSEndpointAnalyzerImplDelegate)endpointerImplDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerImplDelegate);
  return (CSEndpointAnalyzerImplDelegate *)WeakRetained;
}

- (void)setEndpointerDelegate:(id)a3
{
}

- (CSEndpointAnalyzerDelegate)endpointerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
  return (CSEndpointAnalyzerDelegate *)WeakRetained;
}

- (double)automaticEndpointingSuspensionEndTime
{
  return 0.0;
}

- (double)endWaitTime
{
  return 0.0;
}

- (double)startWaitTime
{
  return 0.0;
}

- (double)lastEndOfVoiceActivityTime
{
  return 0.0;
}

- (BOOL)saveSamplesSeenInReset
{
  return 0;
}

- (double)minimumDurationForEndpointer
{
  return 0.0;
}

- (double)delay
{
  return 0.0;
}

- (double)interspeechWaitTime
{
  return 0.0;
}

- (int64_t)endpointStyle
{
  return 0;
}

- (int64_t)fetchCurrentEndpointerOperationMode
{
  return (int64_t)[(CSEndpointAnalyzerImpl *)self->_hybridEndpointer fetchCurrentEndpointerOperationMode];
}

- (void)setEndpointerOperationMode:(int64_t)a3
{
}

- (void)processFirstAudioPacketTimestamp:(id)a3 firstAudioSampleSensorTimestamp:(unint64_t)a4
{
}

- (void)processOSDFeatures:(id)a3 withFrameDurationMs:(double)a4 withMHID:(id)a5
{
}

- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3
{
}

- (void)setEndWaitTime:(double)a3
{
}

- (void)setStartWaitTime:(double)a3
{
}

- (void)logHybridEndpointFeaturesWithEvent:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  hybridEndpointer = self->_hybridEndpointer;
  if (hybridEndpointer)
  {
    [(CSEndpointAnalyzerImpl *)hybridEndpointer logFeaturesWithEvent:v6 locale:v7];
  }
  else
  {
    v9 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      v11 = "-[CSEndpointerProxy logHybridEndpointFeaturesWithEvent:locale:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s WARN: logEndpointFeatures called when CSHybridEndpointer is not available", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)logAnchorMachAbsTime:(unint64_t)a3 numSamplesProcessedBeforeAnchorTime:(unint64_t)a4 isAnchorTimeBuffered:(BOOL)a5 audioDeliveryHostTimeDelta:(unint64_t)a6
{
}

- (BOOL)shouldAcceptEagerResultForDurationSync:(double)a3 withEndpointerMetrics:(id)a4
{
  return [(CSEndpointAnalyzerImpl *)self->_hybridEndpointer shouldAcceptEagerResultForDurationSync:a4 withEndpointerMetrics:a3];
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 withEndpointerMetrics:(id)a4 resultsCompletionHandler:(id)a5
{
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4
{
}

- (void)updateEndpointerDelayedTrigger:(BOOL)a3
{
}

- (void)updateEndpointerThreshold:(float)a3
{
  if (self->_accessibleEndpointerEnabled)
  {
    v3 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[CSEndpointerProxy updateEndpointerThreshold:]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Skip update endpointer threshold from server for accessible endpointer request", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    hybridEndpointer = self->_hybridEndpointer;
    -[CSEndpointAnalyzerImpl updateEndpointerThreshold:](hybridEndpointer, "updateEndpointerThreshold:");
  }
}

- (id)endpointerModelVersion
{
  hybridEndpointer = self->_hybridEndpointer;
  v4 = CSLogCategoryEP;
  BOOL v5 = os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT);
  if (hybridEndpointer)
  {
    if (v5)
    {
      id v6 = v4;
      id v7 = [(CSEndpointAnalyzerImpl *)hybridEndpointer endpointerModelVersion];
      int v10 = 136315394;
      v11 = "-[CSEndpointerProxy endpointerModelVersion]";
      __int16 v12 = 2114;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Queried endpointerModelVersion: %{public}@", (uint8_t *)&v10, 0x16u);

      hybridEndpointer = self->_hybridEndpointer;
    }
    v8 = [(CSEndpointAnalyzerImpl *)hybridEndpointer endpointerModelVersion];
  }
  else
  {
    if (v5)
    {
      int v10 = 136315138;
      v11 = "-[CSEndpointerProxy endpointerModelVersion]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s WARN: endpointerModelVersion called when CSHybridEndpointer is not available", (uint8_t *)&v10, 0xCu);
    }
    v8 = @"NA";
  }
  return v8;
}

- (void)processTaskString:(id)a3
{
}

- (void)processRCFeatures:(id)a3
{
}

- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4
{
}

- (unint64_t)endPointAnalyzerType
{
  id WeakRetained = (CSEndpointAnalyzerImpl *)objc_loadWeakRetained((id *)&self->_activeEndpointer);
  unint64_t v4 = WeakRetained != self->_nnvadEndpointer;

  return v4;
}

- (double)postVoiceTriggerSilence
{
  hybridEndpointer = self->_hybridEndpointer;
  if (!hybridEndpointer) {
    return 0.0;
  }
  [(CSEndpointAnalyzerImpl *)hybridEndpointer postVoiceTriggerSilence];
  return result;
}

- (void)endpointer:(id)a3 reportEndpointBufferHostTime:(unint64_t)a4 firstBufferHostTime:(unint64_t)a5
{
  id v7 = +[AFAnalytics sharedAnalytics];
  [v7 logEventWithType:4710 machAbsoluteTime:a5 context:0];

  id v8 = +[AFAnalytics sharedAnalytics];
  [v8 logEventWithType:4711 machAbsoluteTime:a4 context:0];
}

- (void)endpointer:(id)a3 detectedTwoShotAtTime:(double)a4
{
  id v6 = a3;
  p_endpointerImplDelegate = &self->_endpointerImplDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_endpointerImplDelegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    int v10 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      v13 = "-[CSEndpointerProxy endpointer:detectedTwoShotAtTime:]";
      __int16 v14 = 2050;
      double v15 = a4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Reported 2-shot at: %{public}f secs", (uint8_t *)&v12, 0x16u);
    }
    id v11 = objc_loadWeakRetained((id *)p_endpointerImplDelegate);
    [v11 endpointer:v6 detectedTwoShotAtTime:a4];
  }
}

- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315138;
    v19 = "-[CSEndpointerProxy endpointer:didDetectHardEndpointAtTime:withMetrics:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v18, 0xCu);
  }
  if (self->_recordingDidStop)
  {
    id v11 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      v19 = "-[CSEndpointerProxy endpointer:didDetectHardEndpointAtTime:withMetrics:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s EP_PROXY::RecordingDidStop: Ignoring didDetectHardEndpointAtTime-reporting", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    kdebug_trace();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      __int16 v14 = (void *)CSLogCategoryEP;
      if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
        double v15 = v14;
        id v16 = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
        int v18 = 136315906;
        v19 = "-[CSEndpointerProxy endpointer:didDetectHardEndpointAtTime:withMetrics:]";
        __int16 v20 = 2114;
        id v21 = v8;
        __int16 v22 = 2050;
        double v23 = a4;
        __int16 v24 = 2114;
        id v25 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Endpointer didDetectDefaultEndpointAtTime:withMetrics: %{public}f, CallingDelegate: %{public}@", (uint8_t *)&v18, 0x2Au);
      }
      id v17 = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
      [v17 endpointer:self didDetectHardEndpointAtTime:v9 withMetrics:a4];
    }
  }
}

- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 endpointerModelType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  int v12 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    id v21 = "-[CSEndpointerProxy endpointer:didDetectHardEndpointAtTime:withMetrics:endpointerModelType:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v20, 0xCu);
  }
  if (self->_recordingDidStop)
  {
    char v13 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315138;
      id v21 = "-[CSEndpointerProxy endpointer:didDetectHardEndpointAtTime:withMetrics:endpointerModelType:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s EP_PROXY::RecordingDidStop: Ignoring didDetectHardpoint-reporting", (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    kdebug_trace();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v16 = (void *)CSLogCategoryEP;
      if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = v16;
        id v18 = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
        int v20 = 136316162;
        id v21 = "-[CSEndpointerProxy endpointer:didDetectHardEndpointAtTime:withMetrics:endpointerModelType:]";
        __int16 v22 = 2114;
        id v23 = v10;
        __int16 v24 = 2050;
        double v25 = a4;
        __int16 v26 = 2114;
        id v27 = v18;
        __int16 v28 = 2048;
        int64_t v29 = a6;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "KeyLog - %s %{public}@: Endpointer didDetectHardEndpointAtTime:withMetrics:endpointerType: %{public}f, CallingDelegate: %{public}@, type %ld", (uint8_t *)&v20, 0x34u);
      }
      id v19 = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
      [v19 endpointer:self didDetectHardEndpointAtTime:v11 withMetrics:a6 endpointerModelType:a4];
    }
  }
}

- (void)endpointer:(id)a3 didDetectStartpointAtTime:(double)a4
{
  id v6 = a3;
  id v7 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    id v11 = "-[CSEndpointerProxy endpointer:didDetectStartpointAtTime:]";
    __int16 v12 = 2114;
    id v13 = v6;
    __int16 v14 = 2050;
    double v15 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s endpointer: %{public}@: didDetectStartpointAtTime: %{public}f", (uint8_t *)&v10, 0x20u);
  }
  if (self->_recordingDidStop)
  {
    id v8 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[CSEndpointerProxy endpointer:didDetectStartpointAtTime:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s EP_PROXY::RecordingDidStop: Ignoring startPoint-reporting", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    kdebug_trace();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
    [WeakRetained endpointer:self didDetectStartpointAtTime:a4];
  }
}

- (void)setRequestMHUUID:(id)a3
{
  p_activeEndpointer = &self->_activeEndpointer;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_activeEndpointer);
  [WeakRetained setMhId:v4];
}

- (double)lastStartOfVoiceActivityTime
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeEndpointer);
  [WeakRetained lastStartOfVoiceActivityTime];
  double v4 = v3;

  return v4;
}

- (void)recordingStoppedForReason:(int64_t)a3
{
  self->_recordingDidStop = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeEndpointer);
  [WeakRetained recordingStoppedForReason:a3];
}

- (void)processAudioSamplesAsynchronously:(id)a3
{
  id v7 = a3;
  uint64_t v4 = qword_1002A38D0;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * qword_1002A38D0, 1) <= 0x888888888888888uLL)
  {
    kdebug_trace();
    uint64_t v4 = qword_1002A38D0;
  }
  qword_1002A38D0 = v4 + 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeEndpointer);
  [WeakRetained processAudioSamplesAsynchronously:v7];

  uint64_t v6 = qword_1002A38D8;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * qword_1002A38D8, 1) <= 0x888888888888888uLL)
  {
    kdebug_trace();
    uint64_t v6 = qword_1002A38D8;
  }
  qword_1002A38D8 = v6 + 1;
}

- (void)preheat
{
  double v3 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "-[CSEndpointerProxy preheat]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s preheat", (uint8_t *)&v4, 0xCu);
  }
  [(CSEndpointAnalyzerImpl *)self->_nnvadEndpointer preheat];
  [(CSEndpointAnalyzerImpl *)self->_hybridEndpointer preheat];
}

- (void)setActiveChannel:(unint64_t)a3
{
  -[CSEndpointAnalyzerImpl setActiveChannel:](self->_nnvadEndpointer, "setActiveChannel:");
  hybridEndpointer = self->_hybridEndpointer;
  [(CSEndpointAnalyzerImpl *)hybridEndpointer setActiveChannel:a3];
}

- (void)resetForVoiceTriggerTwoShotWithSampleRate:(unint64_t)a3
{
  unsigned int v5 = +[CSUtils supportCSTwoShotDecision];
  uint64_t v6 = (void *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    int v8 = 136315650;
    id v9 = "-[CSEndpointerProxy resetForVoiceTriggerTwoShotWithSampleRate:]";
    __int16 v10 = 1026;
    unsigned int v11 = v5;
    __int16 v12 = 1026;
    unsigned int v13 = [(CSEndpointerProxy *)self isWatchRTSTriggered];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s shouldUseCVT2ShotDecision: %{public}d, isWatchRTSTriggered=%{public}d", (uint8_t *)&v8, 0x18u);
  }
  if (self->_nnvadEndpointer)
  {
    kdebug_trace();
    [(CSEndpointAnalyzerImpl *)self->_nnvadEndpointer resetForNewRequestWithSampleRate:a3 recordContext:0 disableRCSelection:0];
    kdebug_trace();
  }
}

- (BOOL)isWatchRTSTriggered
{
  int v3 = CSIsWatch();
  if (v3)
  {
    recordContext = self->_recordContext;
    LOBYTE(v3) = [(CSAudioRecordContext *)recordContext isRTSTriggered];
  }
  return v3;
}

- (void)stopEndpointer
{
  self->_recordingDidStop = 1;
  [(CSEndpointAnalyzerImpl *)self->_hybridEndpointer stopEndpointer];
  [(CSEndpointAnalyzerImpl *)self->_nnvadEndpointer stopEndpointer];
  objc_storeWeak((id *)&self->_activeEndpointer, 0);
}

- (BOOL)_updateAccessibleEndpointerThresholdIfNeed
{
  int v3 = +[AFPreferences sharedPreferences];
  id v4 = [v3 accessibleEndpointerThreshold];

  if (v4 == (id)2)
  {
    CFStringRef v5 = @"accessible-extended";
    goto LABEL_5;
  }
  if (v4 == (id)3)
  {
    CFStringRef v5 = @"accessible-maximum";
LABEL_5:
    [(CSEndpointAnalyzerImpl *)self->_hybridEndpointer processTaskString:v5];
    return 1;
  }
  return 0;
}

- (id)cachedEndpointerMetrics
{
  v2 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315138;
    CFStringRef v5 = "-[CSEndpointerProxy cachedEndpointerMetrics]";
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "%s Not supported in this call flow", (uint8_t *)&v4, 0xCu);
  }
  return 0;
}

- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 recordOption:(id)a5 voiceTriggerInfo:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v12 disableEndpointer])
  {
    __int16 v14 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 136315394;
      __int16 v28 = "-[CSEndpointerProxy resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:]";
      __int16 v29 = 2112;
      id v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Endpointer is disabled in recordOption: %@", (uint8_t *)&v27, 0x16u);
    }
    objc_storeWeak((id *)&self->_activeEndpointer, 0);
    goto LABEL_21;
  }
  self->_recordingDidStop = 0;
  id v15 = [v12 disableRCSelection];
  if (self->_hybridEndpointer)
  {
    kdebug_trace();
    [(CSEndpointAnalyzerImpl *)self->_hybridEndpointer resetForNewRequestWithSampleRate:a3 recordContext:v11 disableRCSelection:v15];
    kdebug_trace();
    unsigned int v16 = [(CSEndpointAnalyzerImpl *)self->_hybridEndpointer canProcessCurrentRequest];
    id v17 = CSLogCategoryEP;
    BOOL v18 = os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        int v27 = 136315138;
        __int16 v28 = "-[CSEndpointerProxy resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:]";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s CSHybridEndpointer canProcessCurrentRequest", (uint8_t *)&v27, 0xCu);
      }
      hybridEndpointer = self->_hybridEndpointer;
      goto LABEL_17;
    }
    if (v18)
    {
      int v27 = 136315138;
      __int16 v28 = "-[CSEndpointerProxy resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s CSHybridEndpointer can NOT ProcessCurrentRequest, fallback to NNVAD", (uint8_t *)&v27, 0xCu);
    }
    if (!self->_nnvadEndpointer) {
      [(CSEndpointerProxy *)self _setupNNVADEndpointer];
    }
    kdebug_trace();
    [(CSEndpointAnalyzerImpl *)self->_nnvadEndpointer resetForNewRequestWithSampleRate:a3 recordContext:v11 disableRCSelection:v15];
  }
  else
  {
    kdebug_trace();
    [(CSEndpointAnalyzerImpl *)self->_nnvadEndpointer resetForNewRequestWithSampleRate:a3 recordContext:v11 disableRCSelection:v15];
  }
  kdebug_trace();
  hybridEndpointer = self->_nnvadEndpointer;
LABEL_17:
  objc_storeWeak((id *)&self->_activeEndpointer, hybridEndpointer);
  p_activeEndpointer = &self->_activeEndpointer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeEndpointer);
  __int16 v22 = [v12 requestMHUUID];
  [WeakRetained setMhId:v22];

  if ([v11 isVoiceTriggered])
  {
    id v23 = objc_loadWeakRetained((id *)&self->_activeEndpointer);
    [v23 handleVoiceTriggerWithActivationInfo:v13];
  }
  self->_accessibleEndpointerEnabled = [(CSEndpointerProxy *)self _updateAccessibleEndpointerThresholdIfNeed];
  objc_storeStrong((id *)&self->_recordContext, a4);
  __int16 v24 = (void *)CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    double v25 = v24;
    id v26 = objc_loadWeakRetained((id *)p_activeEndpointer);
    int v27 = 136315394;
    __int16 v28 = "-[CSEndpointerProxy resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:]";
    __int16 v29 = 2114;
    id v30 = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s _activeEndpointer=%{public}@", (uint8_t *)&v27, 0x16u);
  }
LABEL_21:
}

- (void)_setupNNVADEndpointer
{
  int v3 = objc_alloc_init(CSNNVADEndpointAnalyzer);
  nnvadEndpointer = self->_nnvadEndpointer;
  self->_nnvadEndpointer = (CSEndpointAnalyzerImpl *)v3;

  [(CSEndpointAnalyzerImpl *)self->_nnvadEndpointer setDelegate:self];
  [(CSEndpointAnalyzerImpl *)self->_nnvadEndpointer setImplDelegate:self];
  CFStringRef v5 = +[CSUtils getSiriLanguageWithFallback:0];
  LODWORD(self) = +[CSUtils isNNVADFallbackUnexpectedForLanguageCode:v5];

  if (self)
  {
    id v6 = +[CSDiagnosticReporter sharedInstance];
    [v6 submitEndpointerIssueReport:kCSDiagnosticReporterEndpointerNNVADFallback];
  }
}

- (id)initForSidekick
{
  v6.receiver = self;
  v6.super_class = (Class)CSEndpointerProxy;
  v2 = [(CSEndpointerProxy *)&v6 init];
  if (v2)
  {
    if (+[CSUtils supportHybridEndpointer])
    {
      int v3 = objc_alloc_init(CSHybridEndpointAnalyzer);
      hybridEndpointer = v2->_hybridEndpointer;
      v2->_hybridEndpointer = (CSEndpointAnalyzerImpl *)v3;

      [(CSEndpointAnalyzerImpl *)v2->_hybridEndpointer setDelegate:v2];
      [(CSEndpointAnalyzerImpl *)v2->_hybridEndpointer setImplDelegate:v2];
    }
    if (!v2->_hybridEndpointer)
    {
      [(CSEndpointerProxy *)v2 _setupNNVADEndpointer];
      objc_storeWeak((id *)&v2->_activeEndpointer, v2->_nnvadEndpointer);
    }
  }
  return v2;
}

- (CSEndpointerProxy)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSEndpointerProxy;
  v2 = [(CSEndpointerProxy *)&v8 init];
  if (v2)
  {
    if (+[CSUtils supportHybridEndpointer])
    {
      unsigned int v3 = +[CSUtils isAttentiveSiriEnabled];
      int v4 = &off_10024D1E8;
      if (!v3) {
        int v4 = off_10024D1E0;
      }
      CFStringRef v5 = (CSEndpointAnalyzerImpl *)objc_alloc_init(*v4);
      hybridEndpointer = v2->_hybridEndpointer;
      v2->_hybridEndpointer = v5;

      [(CSEndpointAnalyzerImpl *)v2->_hybridEndpointer setDelegate:v2];
      [(CSEndpointAnalyzerImpl *)v2->_hybridEndpointer setImplDelegate:v2];
    }
    if (!v2->_hybridEndpointer)
    {
      [(CSEndpointerProxy *)v2 _setupNNVADEndpointer];
      objc_storeWeak((id *)&v2->_activeEndpointer, v2->_nnvadEndpointer);
    }
  }
  return v2;
}

@end