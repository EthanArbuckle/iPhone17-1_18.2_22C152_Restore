@interface CSNNVADEndpointAnalyzer
+ (id)timeStampString;
- (AVAudioFormat)currentRequestAudioFormat;
- (BOOL)_shouldEnterTwoShotAtAudioTimeInSecs:(double)a3;
- (BOOL)canProcessCurrentRequest;
- (BOOL)didEnterTwoshot;
- (BOOL)finishedSkippingSamplesForVT;
- (BOOL)hasReportedFirstAudioSampleSensorTimestamp;
- (BOOL)isAnchorTimeBuffered;
- (BOOL)isRequestTimeout;
- (BOOL)saveSamplesSeenInReset;
- (BOOL)shouldDetectTwoShot;
- (CSAudioFileWriter)audioFileWriter;
- (CSEndpointAnalyzerDelegate)delegate;
- (CSEndpointAnalyzerImplDelegate)implDelegate;
- (CSNNVADEndpointAnalyzer)init;
- (NSString)mhId;
- (OS_dispatch_queue)queue;
- (SNAudioStreamAnalyzer)snAudioStreamAnalyzer;
- (double)_effectiveAudioTimeInSecsForSNObservation:(id)a3;
- (double)_trailingSilenceDurationAtEndpoint;
- (double)automaticEndpointingSuspensionEndTime;
- (double)delay;
- (double)endWaitTime;
- (double)firstAudioSampleSensorTimestamp;
- (double)interspeechWaitTime;
- (double)lastEndOfVoiceActivityTime;
- (double)lastStartOfVoiceActivityTime;
- (double)minimumDurationForEndpointer;
- (double)nnvadAudioOriginInMs;
- (double)startWaitTime;
- (double)vtEndInSecs;
- (double)vtExtraAudioAtStartInMs;
- (id)_pcmBufferForAudioChunk:(id)a3;
- (int64_t)endpointStyle;
- (int64_t)firstSampleId;
- (unint64_t)activeChannel;
- (unint64_t)anchorMachAbsTime;
- (unint64_t)currentRequestSampleRate;
- (unint64_t)framePosition;
- (unint64_t)nnvadState;
- (unint64_t)numSamplesProcessedBeforeAnchorTime;
- (unint64_t)numSamplesReceived;
- (unint64_t)numSamplesSkippedForVT;
- (unint64_t)vtEndInSampleCount;
- (void)_checkSNObservationForEndpoint:(id)a3;
- (void)_checkSNObservationForStartpoint:(id)a3;
- (void)_emitEndpointDetectedEventWithEndpointTime:(double)a3 endpointBufferHostTime:(unint64_t)a4;
- (void)_reportAudioFirstBufferInfoIfNecessary;
- (void)_reportEndpointAtTsInSecs:(double)a3;
- (void)_reportStartpointAtTsInSecs:(double)a3;
- (void)_reportTwoShotAtTsInSecs:(double)a3;
- (void)handleVoiceTriggerWithActivationInfo:(id)a3;
- (void)preheat;
- (void)processAudioSamplesAsynchronously:(id)a3;
- (void)recordingStoppedForReason:(int64_t)a3;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)request:(id)a3 didProduceResult:(id)a4;
- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 disableRCSelection:(BOOL)a5;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setAnchorMachAbsTime:(unint64_t)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3;
- (void)setCurrentRequestAudioFormat:(id)a3;
- (void)setCurrentRequestSampleRate:(unint64_t)a3;
- (void)setDelay:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDidEnterTwoshot:(BOOL)a3;
- (void)setEndWaitTime:(double)a3;
- (void)setEndpointStyle:(int64_t)a3;
- (void)setFinishedSkippingSamplesForVT:(BOOL)a3;
- (void)setFirstAudioSampleSensorTimestamp:(double)a3;
- (void)setFirstSampleId:(int64_t)a3;
- (void)setFramePosition:(unint64_t)a3;
- (void)setHasReportedFirstAudioSampleSensorTimestamp:(BOOL)a3;
- (void)setImplDelegate:(id)a3;
- (void)setInterspeechWaitTime:(double)a3;
- (void)setIsAnchorTimeBuffered:(BOOL)a3;
- (void)setIsRequestTimeout:(BOOL)a3;
- (void)setMhId:(id)a3;
- (void)setMinimumDurationForEndpointer:(double)a3;
- (void)setNnvadAudioOriginInMs:(double)a3;
- (void)setNnvadState:(unint64_t)a3;
- (void)setNumSamplesProcessedBeforeAnchorTime:(unint64_t)a3;
- (void)setNumSamplesReceived:(unint64_t)a3;
- (void)setNumSamplesSkippedForVT:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setSaveSamplesSeenInReset:(BOOL)a3;
- (void)setShouldDetectTwoShot:(BOOL)a3;
- (void)setSnAudioStreamAnalyzer:(id)a3;
- (void)setStartWaitTime:(double)a3;
- (void)setVtEndInSampleCount:(unint64_t)a3;
- (void)setVtEndInSecs:(double)a3;
- (void)setVtExtraAudioAtStartInMs:(double)a3;
- (void)stopEndpointer;
@end

@implementation CSNNVADEndpointAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentRequestAudioFormat, 0);
  objc_storeStrong((id *)&self->_snAudioStreamAnalyzer, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_destroyWeak((id *)&self->_implDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setFinishedSkippingSamplesForVT:(BOOL)a3
{
  self->_finishedSkippingSamplesForVT = a3;
}

- (BOOL)finishedSkippingSamplesForVT
{
  return self->_finishedSkippingSamplesForVT;
}

- (void)setNumSamplesSkippedForVT:(unint64_t)a3
{
  self->_numSamplesSkippedForVT = a3;
}

- (unint64_t)numSamplesSkippedForVT
{
  return self->_numSamplesSkippedForVT;
}

- (void)setFirstSampleId:(int64_t)a3
{
  self->_firstSampleId = a3;
}

- (int64_t)firstSampleId
{
  return self->_firstSampleId;
}

- (void)setHasReportedFirstAudioSampleSensorTimestamp:(BOOL)a3
{
  self->_hasReportedFirstAudioSampleSensorTimestamp = a3;
}

- (BOOL)hasReportedFirstAudioSampleSensorTimestamp
{
  return self->_hasReportedFirstAudioSampleSensorTimestamp;
}

- (void)setFirstAudioSampleSensorTimestamp:(double)a3
{
  self->_firstAudioSampleSensorTimestamp = a3;
}

- (double)firstAudioSampleSensorTimestamp
{
  return self->_firstAudioSampleSensorTimestamp;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (CSAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDidEnterTwoshot:(BOOL)a3
{
  self->_didEnterTwoshot = a3;
}

- (BOOL)didEnterTwoshot
{
  return self->_didEnterTwoshot;
}

- (void)setShouldDetectTwoShot:(BOOL)a3
{
  self->_shouldDetectTwoShot = a3;
}

- (BOOL)shouldDetectTwoShot
{
  return self->_shouldDetectTwoShot;
}

- (void)setNnvadAudioOriginInMs:(double)a3
{
  self->_nnvadAudioOriginInMs = a3;
}

- (double)nnvadAudioOriginInMs
{
  return self->_nnvadAudioOriginInMs;
}

- (void)setVtExtraAudioAtStartInMs:(double)a3
{
  self->_vtExtraAudioAtStartInMs = a3;
}

- (double)vtExtraAudioAtStartInMs
{
  return self->_vtExtraAudioAtStartInMs;
}

- (void)setVtEndInSampleCount:(unint64_t)a3
{
  self->_vtEndInSampleCount = a3;
}

- (unint64_t)vtEndInSampleCount
{
  return self->_vtEndInSampleCount;
}

- (void)setVtEndInSecs:(double)a3
{
  self->_vtEndInSecs = a3;
}

- (double)vtEndInSecs
{
  return self->_vtEndInSecs;
}

- (void)setCurrentRequestAudioFormat:(id)a3
{
}

- (AVAudioFormat)currentRequestAudioFormat
{
  return self->_currentRequestAudioFormat;
}

- (void)setCurrentRequestSampleRate:(unint64_t)a3
{
  self->_currentRequestSampleRate = a3;
}

- (unint64_t)currentRequestSampleRate
{
  return self->_currentRequestSampleRate;
}

- (void)setIsRequestTimeout:(BOOL)a3
{
  self->_isRequestTimeout = a3;
}

- (BOOL)isRequestTimeout
{
  return self->_isRequestTimeout;
}

- (void)setIsAnchorTimeBuffered:(BOOL)a3
{
  self->_isAnchorTimeBuffered = a3;
}

- (BOOL)isAnchorTimeBuffered
{
  return self->_isAnchorTimeBuffered;
}

- (void)setAnchorMachAbsTime:(unint64_t)a3
{
  self->_anchorMachAbsTime = a3;
}

- (unint64_t)anchorMachAbsTime
{
  return self->_anchorMachAbsTime;
}

- (void)setNumSamplesProcessedBeforeAnchorTime:(unint64_t)a3
{
  self->_numSamplesProcessedBeforeAnchorTime = a3;
}

- (unint64_t)numSamplesProcessedBeforeAnchorTime
{
  return self->_numSamplesProcessedBeforeAnchorTime;
}

- (void)setNumSamplesReceived:(unint64_t)a3
{
  self->_numSamplesReceived = a3;
}

- (unint64_t)numSamplesReceived
{
  return self->_numSamplesReceived;
}

- (void)setNnvadState:(unint64_t)a3
{
  self->_nnvadState = a3;
}

- (unint64_t)nnvadState
{
  return self->_nnvadState;
}

- (void)setFramePosition:(unint64_t)a3
{
  self->_framePosition = a3;
}

- (unint64_t)framePosition
{
  return self->_framePosition;
}

- (void)setSnAudioStreamAnalyzer:(id)a3
{
}

- (SNAudioStreamAnalyzer)snAudioStreamAnalyzer
{
  return self->_snAudioStreamAnalyzer;
}

- (double)lastStartOfVoiceActivityTime
{
  return self->_lastStartOfVoiceActivityTime;
}

- (double)lastEndOfVoiceActivityTime
{
  return self->_lastEndOfVoiceActivityTime;
}

- (void)setSaveSamplesSeenInReset:(BOOL)a3
{
  self->_saveSamplesSeenInReset = a3;
}

- (BOOL)saveSamplesSeenInReset
{
  return self->_saveSamplesSeenInReset;
}

- (void)setMinimumDurationForEndpointer:(double)a3
{
  self->_minimumDurationForEndpointer = a3;
}

- (double)minimumDurationForEndpointer
{
  return self->_minimumDurationForEndpointer;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setInterspeechWaitTime:(double)a3
{
  self->_interspeechWaitTime = a3;
}

- (double)interspeechWaitTime
{
  return self->_interspeechWaitTime;
}

- (void)setEndpointStyle:(int64_t)a3
{
  self->_endpointStyle = a3;
}

- (int64_t)endpointStyle
{
  return self->_endpointStyle;
}

- (NSString)mhId
{
  return self->_mhId;
}

- (double)automaticEndpointingSuspensionEndTime
{
  return self->_automaticEndpointingSuspensionEndTime;
}

- (double)endWaitTime
{
  return self->_endWaitTime;
}

- (double)startWaitTime
{
  return self->_startWaitTime;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setImplDelegate:(id)a3
{
}

- (CSEndpointAnalyzerImplDelegate)implDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_implDelegate);
  return (CSEndpointAnalyzerImplDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSEndpointAnalyzerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSEndpointAnalyzerDelegate *)WeakRetained;
}

- (void)preheat
{
  v2 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[CSNNVADEndpointAnalyzer preheat]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s No Preheat required", (uint8_t *)&v3, 0xCu);
  }
}

- (void)setEndWaitTime:(double)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000692CC;
  v4[3] = &unk_100253B58;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)setStartWaitTime:(double)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100069354;
  v4[3] = &unk_100253B58;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000693DC;
  v4[3] = &unk_100253B58;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (double)_trailingSilenceDurationAtEndpoint
{
  id v2 = [objc_alloc((Class)SNDetectSpeechUtteranceRequest) initWithRequestType:0];
  [v2 decisionDelay];
  double v4 = v3;

  return v4;
}

- (BOOL)canProcessCurrentRequest
{
  return 1;
}

- (void)_reportTwoShotAtTsInSecs:(double)a3
{
  self->_didEnterTwoshot = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_implDelegate);
  [WeakRetained endpointer:self detectedTwoShotAtTime:a3];
}

- (void)_reportStartpointAtTsInSecs:(double)a3
{
  self->_nnvadState = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained endpointer:self didDetectStartpointAtTime:a3];
}

- (void)_emitEndpointDetectedEventWithEndpointTime:(double)a3 endpointBufferHostTime:(unint64_t)a4
{
  if (self->_mhId)
  {
    id v7 = objc_alloc_init((Class)MHSchemaMHEndpointDetected);
    [v7 setEndpointerType:2];
    *(float *)&double v8 = a3;
    objc_msgSend(v7, "setEndpointAudioDurationInNs:", +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:", v8));
    objc_msgSend(v7, "setFirstBufferTimeInNs:", +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", (unint64_t)self->_firstAudioSampleSensorTimestamp));
    objc_msgSend(v7, "setEndpointedBufferTimeInNs:", +[CSFTimeUtils hostTimeToNs:](CSFTimeUtils, "hostTimeToNs:", a4));
    [v7 setDerivedBufferTimeFromHistoricalAudio:self->_isAnchorTimeBuffered];
    id v9 = objc_alloc_init((Class)MHSchemaMHEndpointerTimeoutMetadata);
    [v9 setIsTimeout:self->_isRequestTimeout];
    [v7 setTimeoutMetadata:v9];
    v10 = +[CSEndpointLoggingHelper getMHClientEventByMhUUID:self->_mhId];
    [v10 setEndpointDetected:v7];
    v11 = +[AssistantSiriAnalytics sharedStream];
    [v11 emitMessage:v10];

    v12 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      mhId = self->_mhId;
      int v15 = 136315394;
      v16 = "-[CSNNVADEndpointAnalyzer _emitEndpointDetectedEventWithEndpointTime:endpointBufferHostTime:]";
      __int16 v17 = 2112;
      v18 = mhId;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Submit MHEndpointDetectedEvent to SELF for MH ID: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    v14 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      v16 = "-[CSNNVADEndpointAnalyzer _emitEndpointDetectedEventWithEndpointTime:endpointBufferHostTime:]";
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s MHID not set, skipping SELF Logging", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)setMhId:(id)a3
{
}

- (void)_reportEndpointAtTsInSecs:(double)a3
{
  self->_nnvadState = 2;
  double v5 = self->_vtExtraAudioAtStartInMs / 1000.0 + a3;
  +[CSConfig inputRecordingSampleRate];
  unint64_t v7 = (unint64_t)(v5 * v6);
  unint64_t numSamplesProcessedBeforeAnchorTime = self->_numSamplesProcessedBeforeAnchorTime;
  unint64_t anchorMachAbsTime = self->_anchorMachAbsTime;
  +[CSConfig inputRecordingSampleRate];
  id v10 = +[CSFTimeUtils hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:](CSFTimeUtils, "hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:", v7, anchorMachAbsTime, numSamplesProcessedBeforeAnchorTime);
  v11 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isAnchorTimeBuffered = self->_isAnchorTimeBuffered;
    int v22 = 136315650;
    v23 = "-[CSNNVADEndpointAnalyzer _reportEndpointAtTsInSecs:]";
    __int16 v24 = 2050;
    id v25 = v10;
    __int16 v26 = 1026;
    BOOL v27 = isAnchorTimeBuffered;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s endpointedBuffer.hostTime=%{public}llu, isAnchorTimeBuffered=%{public}d", (uint8_t *)&v22, 0x1Cu);
  }
  v13 = [CSEndpointerMetrics alloc];
  [(CSNNVADEndpointAnalyzer *)self _trailingSilenceDurationAtEndpoint];
  int v15 = [(CSEndpointerMetrics *)v13 initWithTotalAudioRecorded:v10 endpointBufferHostTime:0 featuresAtEndpoint:0 endpointerType:0 asrFeatureLatencyDistribution:0 additionalMetrics:0 trailingSilenceDurationAtEndpoint:a3 * 1000.0 requestId:v14];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained endpointer:self didDetectHardEndpointAtTime:v15 withMetrics:a3];

  id v17 = objc_loadWeakRetained((id *)&self->_implDelegate);
  if (v17)
  {
    v18 = v17;
    id v19 = objc_loadWeakRetained((id *)&self->_implDelegate);
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      id v21 = objc_loadWeakRetained((id *)&self->_implDelegate);
      [v21 endpointer:self reportEndpointBufferHostTime:v10 firstBufferHostTime:(unint64_t)self->_firstAudioSampleSensorTimestamp];

      self->_hasReportedFirstAudioSampleSensorTimestamp = 1;
    }
  }
  [(CSNNVADEndpointAnalyzer *)self _emitEndpointDetectedEventWithEndpointTime:v10 endpointBufferHostTime:a3];
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    id v9 = "-[CSNNVADEndpointAnalyzer request:didFailWithError:]";
    __int16 v10 = 2114;
    id v11 = v5;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s request: %{public}@, returnedError: %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (self->_nnvadState == 2)
  {
    id v9 = CSLogCategoryEP;
    if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v15 = "-[CSNNVADEndpointAnalyzer request:didProduceResult:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Processing finished. Not scheduling", buf, 0xCu);
    }
  }
  else
  {
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100069BA0;
    v11[3] = &unk_100253B08;
    id v12 = v7;
    id v13 = self;
    dispatch_async(queue, v11);
  }
}

- (void)_checkSNObservationForEndpoint:(id)a3
{
  id v4 = a3;
  if (([v4 detected] & 1) == 0)
  {
    [(CSNNVADEndpointAnalyzer *)self _effectiveAudioTimeInSecsForSNObservation:v4];
    double v6 = v5;
    double automaticEndpointingSuspensionEndTime = self->_automaticEndpointingSuspensionEndTime;
    if (v5 <= automaticEndpointingSuspensionEndTime)
    {
      int v8 = CSLogCategoryEP;
      if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315650;
        __int16 v10 = "-[CSNNVADEndpointAnalyzer _checkSNObservationForEndpoint:]";
        __int16 v11 = 2050;
        double v12 = v6;
        __int16 v13 = 2050;
        double v14 = automaticEndpointingSuspensionEndTime;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Postponing endpt as Endpoint(%{public}f) < _automaticEndpointingSuspensionEndTime(%{public}f)", (uint8_t *)&v9, 0x20u);
      }
    }
    else
    {
      [(CSNNVADEndpointAnalyzer *)self _reportEndpointAtTsInSecs:v5];
    }
  }
}

- (void)_checkSNObservationForStartpoint:(id)a3
{
  id v4 = a3;
  [(CSNNVADEndpointAnalyzer *)self _effectiveAudioTimeInSecsForSNObservation:v4];
  double v6 = v5;
  unsigned int v7 = [v4 detected];

  if (v7)
  {
    [(CSNNVADEndpointAnalyzer *)self _reportStartpointAtTsInSecs:v6];
  }
  else if ([(CSNNVADEndpointAnalyzer *)self _shouldEnterTwoShotAtAudioTimeInSecs:v6])
  {
    [(CSNNVADEndpointAnalyzer *)self _reportTwoShotAtTsInSecs:v6];
  }
  else
  {
    double startWaitTime = self->_startWaitTime;
    if (v6 > startWaitTime)
    {
      int v9 = CSLogCategoryEP;
      if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315650;
        __int16 v11 = "-[CSNNVADEndpointAnalyzer _checkSNObservationForStartpoint:]";
        __int16 v12 = 2050;
        double v13 = v6;
        __int16 v14 = 2050;
        double v15 = startWaitTime;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s No Startpt detected even after %{public}f secs. startWaitTime=%{public}f secs", (uint8_t *)&v10, 0x20u);
      }
      self->_isRequestTimeout = 1;
      [(CSNNVADEndpointAnalyzer *)self _reportEndpointAtTsInSecs:v6];
    }
  }
}

- (double)_effectiveAudioTimeInSecsForSNObservation:(id)a3
{
  if (a3)
  {
    [a3 timeRange];
    double v4 = (double)v6;
  }
  else
  {
    double v4 = 0.0;
  }
  return self->_vtEndInSecs + v4 / (double)self->_currentRequestSampleRate;
}

- (BOOL)_shouldEnterTwoShotAtAudioTimeInSecs:(double)a3
{
  if (!self->_shouldDetectTwoShot) {
    return 0;
  }
  if (self->_didEnterTwoshot) {
    return 0;
  }
  double vtEndInSecs = self->_vtEndInSecs;
  double v6 = a3 - vtEndInSecs;
  if (a3 - vtEndInSecs <= 0.55) {
    return 0;
  }
  unsigned int v7 = CSLogCategoryEP;
  BOOL v8 = 1;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEBUG))
  {
    double endWaitTime = self->_endWaitTime;
    int v11 = 136316674;
    __int16 v12 = "-[CSNNVADEndpointAnalyzer _shouldEnterTwoShotAtAudioTimeInSecs:]";
    __int16 v13 = 2050;
    double v14 = a3;
    __int16 v15 = 2050;
    double v16 = vtEndInSecs;
    __int16 v17 = 2050;
    double v18 = endWaitTime;
    __int16 v19 = 2050;
    double v20 = v6;
    __int16 v21 = 2050;
    uint64_t v22 = 0x3FE199999999999ALL;
    __int16 v23 = 1026;
    int v24 = 1;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s CSEndpointerProxy: ep-time: %{public}f, triggerEnd: %{public}f, nnvadEndWaitTime: %{public}f, delta: %{public}f, legacyTwoShotThreshold: %{public}f, enterTwoShot: %{public}d", (uint8_t *)&v11, 0x44u);
  }
  return v8;
}

- (void)_reportAudioFirstBufferInfoIfNecessary
{
  if (!self->_hasReportedFirstAudioSampleSensorTimestamp && self->_firstAudioSampleSensorTimestamp != 0.0)
  {
    double v3 = +[AFAnalytics sharedAnalytics];
    [v3 logEventWithType:4710 machAbsoluteTime:(unint64_t)self->_firstAudioSampleSensorTimestamp context:0];

    self->_hasReportedFirstAudioSampleSensorTimestamp = 1;
  }
}

- (void)recordingStoppedForReason:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006A1E0;
  v4[3] = &unk_100253B58;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)stopEndpointer
{
  double v3 = CSLogCategoryEP;
  if (os_log_type_enabled(CSLogCategoryEP, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v7 = "-[CSNNVADEndpointAnalyzer stopEndpointer]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  self->_nnvadState = 2;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006A3D4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)processAudioSamplesAsynchronously:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006A4BC;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_pcmBufferForAudioChunk:(id)a3
{
  unint64_t activeChannel = self->_activeChannel;
  id v5 = a3;
  id v6 = [v5 dataForChannel:activeChannel];
  id v7 = [v5 numSamples];
  id v8 = [objc_alloc((Class)AVAudioPCMBuffer) initWithPCMFormat:self->_currentRequestAudioFormat frameCapacity:v7];
  [v8 setFrameLength:v7];
  int v9 = (void *)*((void *)[v8 mutableAudioBufferList] + 2);
  id v10 = v6;
  id v11 = [v10 bytes];
  id v12 = [v5 numSamples];
  id v13 = [v5 sampleByteDepth];

  memcpy(v9, v11, (void)v13 * (void)v12);
  return v8;
}

- (void)handleVoiceTriggerWithActivationInfo:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006AA00;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async_and_wait(queue, v7);
}

- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 disableRCSelection:(BOOL)a5
{
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006ACBC;
  block[3] = &unk_1002532A8;
  id v12 = self;
  unint64_t v13 = a3;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (CSNNVADEndpointAnalyzer)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSNNVADEndpointAnalyzer;
  id v2 = [(CSNNVADEndpointAnalyzer *)&v7 init];
  if (v2)
  {
    +[CSConfig inputRecordingSampleRate];
    v2->_currentRequestSampleRate = (unint64_t)v3;
    v2->_firstAudioSampleSensorTimestamp = 0.0;
    v2->_firstSampleId = -1;
    uint64_t v4 = +[CSUtils getSerialQueueWithQOS:33 name:@"com.apple.corespeech.nnvad" fixedPriority:kCSDefaultSerialQueueFixedPriority];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)timeStampString
{
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  float v3 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyyMMdd-HHmmss"];
  uint64_t v4 = +[NSDate date];
  id v5 = [v2 stringFromDate:v4];

  return v5;
}

@end