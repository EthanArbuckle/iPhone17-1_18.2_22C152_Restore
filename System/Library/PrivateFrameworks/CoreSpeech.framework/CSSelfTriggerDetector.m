@interface CSSelfTriggerDetector
+ selfTriggerAudioLogDirectory;
+ selfTriggerAudioLoggingFilePath;
+ (id)timeStampString;
- (BOOL)_isTelephonyTapAvailable;
- (BOOL)_shouldAddPowerLogs;
- (BOOL)_shouldReuseBuiltInAudioProvider;
- (BOOL)hasPendingNearMiss;
- (BOOL)isKeywordAnalyzerCorrupted;
- (BOOL)isListenPollingStarting;
- (BOOL)isSiriClientListening;
- (BOOL)selfTriggerEnabled;
- (CSAsset)currentAsset;
- (CSAudioStream)audioStream;
- (CSAudioStreamProviding)audioTapProvider;
- (CSAudioTimeConverter)audioTimeConverter;
- (CSContinuousVoiceTriggerConfig)selfTriggerConfig;
- (CSKeywordAnalyzerNDAPI)keywordAnalyzer;
- (CSOSTransaction)modelLoadTransaction;
- (CSPlainAudioFileWriter)audioFileWriter;
- (CSSelfTriggerDetector)initWithTargetQueue:(id)a3 audioTapProvider:(id)a4 audioSourceType:(unint64_t)a5;
- (CSSpeechManager)speechManager;
- (NSHashTable)observers;
- (NSString)audioProviderUUID;
- (OS_dispatch_queue)queue;
- (unint64_t)_getPlaybackRouteType;
- (unint64_t)audioSourceType;
- (unint64_t)currentState;
- (unint64_t)mode;
- (unint64_t)nearMissCandidateDetectedSamples;
- (unint64_t)nearMissDelayTimeoutInSamples;
- (unint64_t)numAnalyzedSamples;
- (unint64_t)outputAudioChannel;
- (unint64_t)state;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)CSPhoneCallStateMonitor:(id)a3 didRecievePhoneCallStateChange:(unint64_t)a4;
- (void)_addPowerLogsIfSupported:(unint64_t)a3;
- (void)_hardStopAndRestartAudioQueueIfNeeded;
- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5;
- (void)_loadCurrentAssetToAnalyzer;
- (void)_reset;
- (void)_setAsset:(id)a3;
- (void)_startListenPolling;
- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4;
- (void)_startListenWithCompletion:(id)a3;
- (void)_stopAudioFileWriter;
- (void)_stopListeningWithCompletion:(id)a3;
- (void)_transitCurrentStateTo:(unint64_t)a3;
- (void)_unloadCurrentAssetToAnalyzer;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)registerObserver:(id)a3;
- (void)reset;
- (void)setAsset:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setAudioProviderUUID:(id)a3;
- (void)setAudioSourceType:(unint64_t)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioTapProvider:(id)a3;
- (void)setAudioTimeConverter:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setHasPendingNearMiss:(BOOL)a3;
- (void)setIsKeywordAnalyzerCorrupted:(BOOL)a3;
- (void)setIsListenPollingStarting:(BOOL)a3;
- (void)setIsSiriClientListening:(BOOL)a3;
- (void)setKeywordAnalyzer:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setModelLoadTransaction:(id)a3;
- (void)setNearMissCandidateDetectedSamples:(unint64_t)a3;
- (void)setNearMissDelayTimeoutInSamples:(unint64_t)a3;
- (void)setNumAnalyzedSamples:(unint64_t)a3;
- (void)setObservers:(id)a3;
- (void)setOutputAudioChannel:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setSelfTriggerConfig:(id)a3;
- (void)setSelfTriggerEnabled:(BOOL)a3;
- (void)setSpeechManager:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5;
- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5;
- (void)start;
- (void)startAnalyze;
- (void)stopAnalyzeWithCompletion:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSSelfTriggerDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_modelLoadTransaction, 0);
  objc_destroyWeak((id *)&self->_audioTapProvider);
  objc_storeStrong((id *)&self->_selfTriggerConfig, 0);
  objc_storeStrong((id *)&self->_audioTimeConverter, 0);
  objc_storeStrong((id *)&self->_audioProviderUUID, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_keywordAnalyzer, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_destroyWeak((id *)&self->_speechManager);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setAudioFileWriter:(id)a3
{
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setNumAnalyzedSamples:(unint64_t)a3
{
  self->_numAnalyzedSamples = a3;
}

- (unint64_t)numAnalyzedSamples
{
  return self->_numAnalyzedSamples;
}

- (void)setHasPendingNearMiss:(BOOL)a3
{
  self->_hasPendingNearMiss = a3;
}

- (BOOL)hasPendingNearMiss
{
  return self->_hasPendingNearMiss;
}

- (void)setNearMissCandidateDetectedSamples:(unint64_t)a3
{
  self->_nearMissCandidateDetectedSamples = a3;
}

- (unint64_t)nearMissCandidateDetectedSamples
{
  return self->_nearMissCandidateDetectedSamples;
}

- (void)setNearMissDelayTimeoutInSamples:(unint64_t)a3
{
  self->_nearMissDelayTimeoutInSamples = a3;
}

- (unint64_t)nearMissDelayTimeoutInSamples
{
  return self->_nearMissDelayTimeoutInSamples;
}

- (void)setModelLoadTransaction:(id)a3
{
}

- (CSOSTransaction)modelLoadTransaction
{
  return self->_modelLoadTransaction;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setAudioSourceType:(unint64_t)a3
{
  self->_audioSourceType = a3;
}

- (unint64_t)audioSourceType
{
  return self->_audioSourceType;
}

- (void)setAudioTapProvider:(id)a3
{
}

- (CSAudioStreamProviding)audioTapProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioTapProvider);
  return (CSAudioStreamProviding *)WeakRetained;
}

- (void)setSelfTriggerConfig:(id)a3
{
}

- (CSContinuousVoiceTriggerConfig)selfTriggerConfig
{
  return self->_selfTriggerConfig;
}

- (void)setAudioTimeConverter:(id)a3
{
}

- (CSAudioTimeConverter)audioTimeConverter
{
  return self->_audioTimeConverter;
}

- (void)setAudioProviderUUID:(id)a3
{
}

- (NSString)audioProviderUUID
{
  return self->_audioProviderUUID;
}

- (void)setIsListenPollingStarting:(BOOL)a3
{
  self->_isListenPollingStarting = a3;
}

- (BOOL)isListenPollingStarting
{
  return self->_isListenPollingStarting;
}

- (void)setSelfTriggerEnabled:(BOOL)a3
{
  self->_selfTriggerEnabled = a3;
}

- (BOOL)selfTriggerEnabled
{
  return self->_selfTriggerEnabled;
}

- (void)setIsSiriClientListening:(BOOL)a3
{
  self->_isSiriClientListening = a3;
}

- (BOOL)isSiriClientListening
{
  return self->_isSiriClientListening;
}

- (void)setAudioStream:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setOutputAudioChannel:(unint64_t)a3
{
  self->_outputAudioChannel = a3;
}

- (unint64_t)outputAudioChannel
{
  return self->_outputAudioChannel;
}

- (void)setIsKeywordAnalyzerCorrupted:(BOOL)a3
{
  self->_isKeywordAnalyzerCorrupted = a3;
}

- (BOOL)isKeywordAnalyzerCorrupted
{
  return self->_isKeywordAnalyzerCorrupted;
}

- (void)setKeywordAnalyzer:(id)a3
{
}

- (CSKeywordAnalyzerNDAPI)keywordAnalyzer
{
  return self->_keywordAnalyzer;
}

- (void)setCurrentAsset:(id)a3
{
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setSpeechManager:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_speechManager);
  return (CSSpeechManager *)WeakRetained;
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_stopAudioFileWriter
{
  audioFileWriter = self->_audioFileWriter;
  if (audioFileWriter)
  {
    [(CSPlainAudioFileWriter *)audioFileWriter endAudio];
    v4 = self->_audioFileWriter;
    self->_audioFileWriter = 0;
  }
}

- (void)_addPowerLogsIfSupported:(unint64_t)a3
{
  if ([(CSSelfTriggerDetector *)self _shouldAddPowerLogs] && self->_state != a3)
  {
    if (a3)
    {
      if (a3 != 1) {
        return;
      }
      unint64_t v5 = [(CSSelfTriggerDetector *)self _getPlaybackRouteType];
      v6 = +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor];
      if ([v6 phoneCallState] == (id)3)
      {
        BOOL v7 = 1;
      }
      else
      {
        v9 = +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor];
        BOOL v7 = [v9 phoneCallState] == (id)4;
      }
      id v11 = +[CSPowerLogger sharedPowerLogger];
      unint64_t audioSourceType = self->_audioSourceType;
      v8 = +[NSDate date];
      [v8 timeIntervalSince1970];
      objc_msgSend(v11, "powerLogSelfTriggerSuppressionStartWithSpeakerType:withAudioSource:atTime:isPhoneCall:", v5, audioSourceType, v7);
    }
    else
    {
      id v11 = +[CSPowerLogger sharedPowerLogger];
      v8 = +[NSDate date];
      [v8 timeIntervalSince1970];
      objc_msgSend(v11, "powerLogSelfTriggerSuppressionStopAtTime:");
    }
  }
}

- (BOOL)_shouldAddPowerLogs
{
  return CSIsIOS() && !+[CSUtils isDarwinOS];
}

- (void)_transitCurrentStateTo:(unint64_t)a3
{
  unint64_t v5 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t state = self->_state;
    unint64_t audioSourceType = self->_audioSourceType;
    int v8 = 136315906;
    v9 = "-[CSSelfTriggerDetector _transitCurrentStateTo:]";
    __int16 v10 = 2048;
    unint64_t v11 = state;
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    __int16 v14 = 2048;
    unint64_t v15 = audioSourceType;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s From state : %lu to state : %lu , audioSourceType : %lu", (uint8_t *)&v8, 0x2Au);
  }
  [(CSSelfTriggerDetector *)self _addPowerLogsIfSupported:a3];
  self->_unint64_t state = a3;
}

- (void)_hardStopAndRestartAudioQueueIfNeeded
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001A238;
  v2[3] = &unk_1002531E0;
  v2[4] = self;
  [(CSSelfTriggerDetector *)self _stopListeningWithCompletion:v2];
}

- (void)CSPhoneCallStateMonitor:(id)a3 didRecievePhoneCallStateChange:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001A30C;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A534;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A664;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A790;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  if (a5)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A8C0;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  id v7 = a4;
  [v7 bestScore];
  float v9 = v8;
  unint64_t v10 = qword_1002A35B8;
  if (!(v10 % +[CSUtils loggingHeartbeatRate]))
  {
    unint64_t v11 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isSiriClientListening) {
        CFStringRef v12 = @"YES";
      }
      else {
        CFStringRef v12 = @"NO";
      }
      unint64_t audioSourceType = self->_audioSourceType;
      selfTriggerConfig = self->_selfTriggerConfig;
      unint64_t v15 = v11;
      [(CSContinuousVoiceTriggerConfig *)selfTriggerConfig threshold];
      *(_DWORD *)buf = 136316418;
      v98 = "-[CSSelfTriggerDetector _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
      __int16 v99 = 2050;
      double v100 = v9;
      __int16 v101 = 2050;
      double v102 = *(double *)&a5;
      __int16 v103 = 2114;
      CFStringRef v104 = v12;
      __int16 v105 = 2050;
      unint64_t v106 = audioSourceType;
      __int16 v107 = 2048;
      double v108 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Output NDAPI self trigger best score = %{public}f for channel = %{public}tu, client listening ? %{public}@, audioSourceType %{public}lu, threshold = %f", buf, 0x3Eu);
    }
  }
  ++qword_1002A35B8;
  if (!self->_isSiriClientListening)
  {
    [(CSContinuousVoiceTriggerConfig *)self->_selfTriggerConfig threshold];
    if (v9 >= v17)
    {
      v39 = [v7 bestStart];
      v40 = [v7 bestEnd];
      v41 = [v7 samplesAtFire];
      +[CSConfig inputRecordingSampleRate];
      double v43 = (float)((float)(unint64_t)(v40 - v39) / v42);
      +[CSConfig inputRecordingSampleRate];
      double v45 = (float)((float)(unint64_t)(v41 - v39) / v44);
      id v46 = [(CSAudioTimeConverter *)self->_audioTimeConverter hostTimeFromSampleCount:v39];
      id v47 = [(CSAudioTimeConverter *)self->_audioTimeConverter hostTimeFromSampleCount:v40];
      double v23 = +[NSMutableDictionary dictionary];
      v48 = [(CSAsset *)self->_currentAsset configVersion];

      if (v48)
      {
        v49 = [(CSAsset *)self->_currentAsset configVersion];
        [*(id *)&v23 setObject:v49 forKey:kVTEIconfigVersion];
      }
      v50 = +[NSNumber numberWithUnsignedInteger:v39];
      [*(id *)&v23 setObject:v50 forKey:kVTEItriggerStartSampleCount];

      v51 = +[NSNumber numberWithUnsignedInteger:v40];
      [*(id *)&v23 setObject:v51 forKey:kVTEItriggerEndSampleCount];

      v52 = +[NSNumber numberWithUnsignedInteger:v41];
      [*(id *)&v23 setObject:v52 forKey:kVTEItriggerFireSampleCount];

      [*(id *)&v23 setObject:&off_10025E3F8 forKey:kVTEItriggerStartSeconds];
      v53 = +[NSNumber numberWithDouble:v43];
      [*(id *)&v23 setObject:v53 forKey:kVTEItriggerEndSeconds];

      v54 = +[NSNumber numberWithDouble:v45];
      [*(id *)&v23 setObject:v54 forKey:kVTEItriggerFireSeconds];

      *(float *)&double v55 = v9;
      v56 = +[NSNumber numberWithFloat:v55];
      [*(id *)&v23 setObject:v56 forKey:kVTEItriggerScore];

      [(CSContinuousVoiceTriggerConfig *)self->_selfTriggerConfig threshold];
      v57 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [*(id *)&v23 setObject:v57 forKey:kVTEIthreshold];

      v58 = +[NSNumber numberWithUnsignedLongLong:v46];
      [*(id *)&v23 setObject:v58 forKey:kVTEItriggerStartMachTime];

      v59 = +[NSNumber numberWithUnsignedLongLong:v47];
      [*(id *)&v23 setObject:v59 forKey:kVTEItriggerEndMachTime];

      v60 = +[NSNumber numberWithUnsignedInteger:a5];
      [*(id *)&v23 setObject:v60 forKey:kVTEIactiveChannel];

      v61 = [(CSSelfTriggerDetector *)self audioProviderUUID];

      if (v61)
      {
        v62 = [(CSSelfTriggerDetector *)self audioProviderUUID];
        [*(id *)&v23 setObject:v62 forKey:kVTEIAudioProviderUUID];
      }
      v63 = [(CSSelfTriggerDetector *)self audioTapProvider];

      if (v63) {
        [*(id *)&v23 setObject:&off_10025D780 forKey:kVTEIAudioProviderType];
      }
      v64 = CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        double v65 = *(double *)&self->_audioSourceType;
        *(_DWORD *)buf = 136315650;
        v98 = "-[CSSelfTriggerDetector _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v99 = 2050;
        double v100 = v65;
        __int16 v101 = 2114;
        double v102 = v23;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%s Notifying self trigger detected with audioSourceType %{public}lu : %{public}@", buf, 0x20u);
      }
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      v66 = self->_observers;
      id v67 = [(NSHashTable *)v66 countByEnumeratingWithState:&v91 objects:v96 count:16];
      if (v67)
      {
        id v68 = v67;
        uint64_t v69 = *(void *)v92;
        do
        {
          for (i = 0; i != v68; i = (char *)i + 1)
          {
            if (*(void *)v92 != v69) {
              objc_enumerationMutation(v66);
            }
            v71 = *(void **)(*((void *)&v91 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v71 selfTriggerDetector:self didDetectSelfTrigger:*(void *)&v23];
            }
          }
          id v68 = [(NSHashTable *)v66 countByEnumeratingWithState:&v91 objects:v96 count:16];
        }
        while (v68);
      }

      if ([(CSSelfTriggerDetector *)self _shouldAddPowerLogs])
      {
        unint64_t v72 = [(CSSelfTriggerDetector *)self _getPlaybackRouteType];
        v73 = +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor];
        if ([v73 phoneCallState] == (id)3)
        {
          BOOL v74 = 1;
        }
        else
        {
          v75 = +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor];
          BOOL v74 = [v75 phoneCallState] == (id)4;
        }
        v76 = +[CSPowerLogger sharedPowerLogger];
        unint64_t v77 = self->_audioSourceType;
        v78 = +[NSDate date];
        [v78 timeIntervalSince1970];
        objc_msgSend(v76, "powerLogSelfTriggerSuppressionDetectedWithSpeakerType:withAudioSource:atTime:isPhoneCall:", v72, v77, v74);
      }
      goto LABEL_52;
    }
    [(CSContinuousVoiceTriggerConfig *)self->_selfTriggerConfig loggingThreshold];
    if (v9 >= v18)
    {
      if (!self->_hasPendingNearMiss)
      {
        self->_hasPendingNearMiss = 1;
        double v79 = *(double *)&self->_numAnalyzedSamples;
        *(double *)&self->_unint64_t nearMissCandidateDetectedSamples = v79;
        v80 = CSLogContextFacilityCoreSpeech;
        if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_53;
        }
        unint64_t nearMissDelayTimeoutInSamples = self->_nearMissDelayTimeoutInSamples;
        *(_DWORD *)buf = 136315650;
        v98 = "-[CSSelfTriggerDetector _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v99 = 2050;
        double v100 = v79;
        __int16 v101 = 2050;
        double v102 = *(double *)&nearMissDelayTimeoutInSamples;
        v82 = "%s Detected near miss candidate at %{public}tu, let's wait %{public}tu samples to log";
        v83 = v80;
        os_log_type_t v84 = OS_LOG_TYPE_DEFAULT;
        uint32_t v85 = 32;
LABEL_59:
        _os_log_impl((void *)&_mh_execute_header, v83, v84, v82, buf, v85);
        goto LABEL_53;
      }
      unint64_t v20 = self->_nearMissDelayTimeoutInSamples;
      unint64_t nearMissCandidateDetectedSamples = self->_nearMissCandidateDetectedSamples;
      double v21 = *(double *)&self->_numAnalyzedSamples;
      if (v20 + nearMissCandidateDetectedSamples < *(void *)&v21)
      {
        v22 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v98 = "-[CSSelfTriggerDetector _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
          __int16 v99 = 2048;
          double v100 = v21;
          __int16 v101 = 2048;
          double v102 = v9;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s SelfTrigger detected near miss at %lu samples with score %.3f", buf, 0x20u);
        }
        double v23 = +[NSMutableDictionary dictionary];
        unint64_t v24 = (unint64_t)[v7 bestStart];
        float v25 = (float)(unint64_t)[v7 samplesAtFire];
        +[CSConfig inputRecordingSampleRate];
        if ((float)(v26 + v26) <= v25)
        {
          float v27 = (float)(unint64_t)[v7 samplesAtFire];
          +[CSConfig inputRecordingSampleRate];
          unint64_t v24 = (unint64_t)(float)(v27 + (float)(v28 * -2.0));
        }
        v29 = +[NSNumber numberWithUnsignedInteger:v24];
        [*(id *)&v23 setObject:v29 forKey:kVTEItriggerStartSampleCount];

        v30 = [(CSSelfTriggerDetector *)self audioProviderUUID];

        if (v30)
        {
          v31 = [(CSSelfTriggerDetector *)self audioProviderUUID];
          [*(id *)&v23 setObject:v31 forKey:kVTEIAudioProviderUUID];
        }
        v32 = [(CSSelfTriggerDetector *)self audioTapProvider];

        if (v32) {
          [*(id *)&v23 setObject:&off_10025D780 forKey:kVTEIAudioProviderType];
        }
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        v33 = self->_observers;
        id v34 = [(NSHashTable *)v33 countByEnumeratingWithState:&v87 objects:v95 count:16];
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = *(void *)v88;
          do
          {
            for (j = 0; j != v35; j = (char *)j + 1)
            {
              if (*(void *)v88 != v36) {
                objc_enumerationMutation(v33);
              }
              v38 = *(void **)(*((void *)&v87 + 1) + 8 * (void)j);
              if (objc_opt_respondsToSelector()) {
                objc_msgSend(v38, "selfTriggerDetector:didDetectNearMiss:", self, *(void *)&v23, (void)v87);
              }
            }
            id v35 = [(NSHashTable *)v33 countByEnumeratingWithState:&v87 objects:v95 count:16];
          }
          while (v35);
        }

LABEL_52:
        [(CSSelfTriggerDetector *)self _reset];

        goto LABEL_53;
      }
      if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * qword_1002A35B8, 1) <= 0x1999999999999999uLL)
      {
        v86 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v98 = "-[CSSelfTriggerDetector _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
          __int16 v99 = 2050;
          *(void *)&double v100 = *(void *)&v21 - nearMissCandidateDetectedSamples + v20;
          v82 = "%s Waiting for logging near miss until timeout %{public}lu samples";
          v83 = v86;
          os_log_type_t v84 = OS_LOG_TYPE_INFO;
          uint32_t v85 = 22;
          goto LABEL_59;
        }
      }
    }
  }
LABEL_53:
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001B470;
  v8[3] = &unk_100253B08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  v6 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v10 = "-[CSSelfTriggerDetector audioStreamProvider:didStopStreamUnexpectedly:]";
    __int16 v11 = 2050;
    int64_t v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s stream stopped unexpectedly : %{public}ld", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001B8A0;
  v8[3] = &unk_100253B58;
  v8[4] = self;
  void v8[5] = a4;
  dispatch_async(queue, v8);
}

- (unint64_t)_getPlaybackRouteType
{
  v2 = +[CSBuiltinSpeakerStateMonitor sharedInstance];
  id v3 = [v2 currentBuiltinSpeakerState];

  if (v3 == (id)1) {
    return 1;
  }
  id v5 = +[CSBluetoothSpeakerStateMonitor sharedInstance];
  unsigned int v6 = [v5 isActive];

  if (v6) {
    return 2;
  }
  else {
    return 0;
  }
}

- (BOOL)_isTelephonyTapAvailable
{
  if (!+[CSUtils supportTelephonyAudioTap]) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioTapProvider);
  BOOL v4 = WeakRetained != 0;

  return v4;
}

- (BOOL)_shouldReuseBuiltInAudioProvider
{
  return CSIsOSX() ^ 1;
}

- (void)_stopListeningWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSSelfTriggerDetector *)self audioStream];
  if (v5
    && (unsigned int v6 = (void *)v5,
        [(CSSelfTriggerDetector *)self audioStream],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 isStreaming],
        v7,
        v6,
        v8))
  {
    [(CSSelfTriggerDetector *)self _transitCurrentStateTo:3];
    id v9 = [(CSSelfTriggerDetector *)self audioStream];
    unint64_t v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    int64_t v12 = sub_10001BB34;
    unint64_t v13 = &unk_100253150;
    __int16 v14 = self;
    id v15 = v4;
    [v9 stopAudioStreamWithOption:0 completion:&v10];
  }
  else
  {
    [(CSSelfTriggerDetector *)self _unloadCurrentAssetToAnalyzer];
    [(CSSelfTriggerDetector *)self _transitCurrentStateTo:0];
    if (v4) {
      (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
    }
  }
  [(CSSelfTriggerDetector *)self _stopAudioFileWriter];
}

- (void)stopAnalyzeWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001BDB8;
  v7[3] = &unk_1002535D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_startListenWithCompletion:(id)a3
{
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10001C33C;
  v42[3] = &unk_100253100;
  id v4 = a3;
  id v43 = v4;
  uint64_t v5 = objc_retainBlock(v42);
  id v6 = +[CSAudioRecordContext contextForBuiltInVoiceTrigger];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioTapProvider);
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v9 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v45 = "-[CSSelfTriggerDetector _startListenWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Using audio tapping provider for self-trigger", buf, 0xCu);
    }
    goto LABEL_6;
  }
  if ([(CSSelfTriggerDetector *)self _shouldReuseBuiltInAudioProvider])
  {
    unint64_t v10 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
    id v8 = [v10 audioProviderWithStreamID:1];

    if (v8)
    {
LABEL_6:
      id v37 = 0;
      goto LABEL_7;
    }
  }
  id v34 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
  id v41 = 0;
  id v8 = [v34 audioProviderWithContext:v6 error:&v41];
  id v33 = v41;

  if (!v8)
  {
    ((void (*)(void *, void, id))v5[2])(v5, 0, v33);
    goto LABEL_18;
  }
  id v37 = v33;
LABEL_7:
  uint64_t v11 = [v8 UUID];
  id v12 = [v11 copy];
  [(CSSelfTriggerDetector *)self setAudioProviderUUID:v12];

  unint64_t v13 = (CSAudioTimeConverter *)objc_alloc_init((Class)CSAudioTimeConverter);
  audioTimeConverter = self->_audioTimeConverter;
  self->_audioTimeConverter = v13;

  id v15 = objc_alloc_init((Class)CSAudioStreamRequest);
  float v16 = +[CSFPreferences sharedPreferences];
  unsigned int v17 = [v16 fileLoggingIsEnabled];

  if (v17) {
    [v15 setRequiresHistoricalBuffer:1];
  }
  float v18 = (objc_class *)objc_opt_class();
  v19 = NSStringFromClass(v18);
  id v40 = 0;
  unint64_t v20 = [v8 audioStreamWithRequest:v15 streamName:v19 error:&v40];
  id v21 = v40;

  if (v20)
  {
    id v35 = v6;
    id v36 = v4;
    [(CSSelfTriggerDetector *)self setAudioStream:v20];
    [v20 setDelegate:self];
    uint64_t v22 = mach_absolute_time();
    LODWORD(v23) = 2.0;
    uint64_t v24 = v22 - (void)+[CSFTimeUtils secondsToHostTime:v23];
    id v25 = objc_alloc_init((Class)CSAudioStartStreamOption);
    [v25 setRequestHistoricalAudioDataWithHostTime:1];
    [v25 setStartRecordingHostTime:v24];
    [v25 setSkipAlertBehavior:1];
    if (self->_mode == 1) {
      [v25 setRequestTelephonyDownlinkAudioTap:1];
    }
    [(CSSelfTriggerDetector *)self _loadCurrentAssetToAnalyzer];
    [(CSSelfTriggerDetector *)self _reset];
    [(CSSelfTriggerDetector *)self _transitCurrentStateTo:1];
    float v26 = +[CSFPreferences sharedPreferences];
    unsigned int v27 = [v26 isSelfTriggerFileLoggingEnabled];

    if (v27)
    {
      float v28 = +[CSSelfTriggerDetector selfTriggerAudioLoggingFilePath];
      id v29 = objc_alloc((Class)CSPlainAudioFileWriter);
      v30 = +[NSURL URLWithString:v28];
      v31 = (CSPlainAudioFileWriter *)[v29 initWithURL:v30];
      audioFileWriter = self->_audioFileWriter;
      self->_audioFileWriter = v31;
    }
    else
    {
      float v28 = self->_audioFileWriter;
      self->_audioFileWriter = 0;
    }
    id v4 = v36;
    id v33 = v37;

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10001C354;
    v38[3] = &unk_100253150;
    v38[4] = self;
    v39 = v5;
    [v20 startAudioStreamWithOption:v25 completion:v38];

    id v6 = v35;
  }
  else
  {
    ((void (*)(void *, void, id))v5[2])(v5, 0, v21);
    id v33 = v37;
  }

LABEL_18:
}

- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[CSSelfTriggerDetector _startListenPollingWithInterval:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  id v8 = [(CSSelfTriggerDetector *)self audioStream];
  if ([v8 isStreaming])
  {
  }
  else
  {
    selfTriggerEnabled = self->_selfTriggerEnabled;

    if (selfTriggerEnabled)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10001C710;
      v11[3] = &unk_1002530D8;
      v11[4] = self;
      double v13 = a3;
      id v12 = v6;
      [(CSSelfTriggerDetector *)self _startListenWithCompletion:v11];

      goto LABEL_11;
    }
  }
  unint64_t v10 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[CSSelfTriggerDetector _startListenPollingWithInterval:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Skip listen polling since audio is streaming / selfTrigger disabled", buf, 0xCu);
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
    v2 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v5 = "-[CSSelfTriggerDetector _startListenPolling]";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Already started listen polling, skip", buf, 0xCu);
    }
  }
  else
  {
    self->_isListenPollingStarting = 1;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001CA58;
    v3[3] = &unk_1002531E0;
    v3[4] = self;
    [(CSSelfTriggerDetector *)self _startListenPollingWithInterval:v3 completion:1.0];
  }
}

- (void)startAnalyze
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CAD8;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_unloadCurrentAssetToAnalyzer
{
  keywordAnalyzer = self->_keywordAnalyzer;
  self->_keywordAnalyzer = 0;

  modelLoadTransaction = self->_modelLoadTransaction;
  self->_modelLoadTransaction = 0;
}

- (void)_loadCurrentAssetToAnalyzer
{
  if (!self->_modelLoadTransaction)
  {
    id v3 = (CSOSTransaction *)[objc_alloc((Class)CSOSTransaction) initWithDescription:@"Transaction for STS model loading"];
    modelLoadTransaction = self->_modelLoadTransaction;
    self->_modelLoadTransaction = v3;
  }
  id v13 = [(CSAsset *)self->_currentAsset resourcePath];
  uint64_t v5 = [(CSContinuousVoiceTriggerConfig *)self->_selfTriggerConfig configPathNDAPI];
  id v6 = (CSKeywordAnalyzerNDAPI *)[objc_alloc((Class)CSKeywordAnalyzerNDAPI) initWithConfigPath:v5 resourcePath:v13];
  keywordAnalyzer = self->_keywordAnalyzer;
  self->_keywordAnalyzer = v6;

  self->_isKeywordAnalyzerCorrupted = self->_keywordAnalyzer == 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioTapProvider);
  if (WeakRetained && (unint64_t audioSourceType = self->_audioSourceType, WeakRetained, audioSourceType == 1))
  {
    unint64_t v10 = self->_keywordAnalyzer;
    id v11 = 0;
  }
  else
  {
    id v12 = self->_keywordAnalyzer;
    id v11 = +[CSConfig channelForOutputReference];
    unint64_t v10 = v12;
  }
  [(CSKeywordAnalyzerNDAPI *)v10 setActiveChannel:v11];
}

- (void)_setAsset:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_currentAsset, a3);
    id v6 = +[CSContinuousVoiceTriggerConfigDecoder decodeConfigFrom:self->_currentAsset];
    selfTriggerConfig = self->_selfTriggerConfig;
    self->_selfTriggerConfig = v6;

    if (self->_keywordAnalyzer || self->_isKeywordAnalyzerCorrupted) {
      [(CSSelfTriggerDetector *)self _loadCurrentAssetToAnalyzer];
    }
    [(CSSelfTriggerDetector *)self _reset];
  }
  else
  {
    id v8 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      unint64_t v10 = "-[CSSelfTriggerDetector _setAsset:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s asset is nil, stop initialization", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001CDFC;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001CEA0;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (unint64_t)currentState
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001CF58;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D004;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_reset
{
  self->_hasPendingNearMiss = 0;
  self->_unint64_t nearMissCandidateDetectedSamples = 0;
  self->_numAnalyzedSamples = 0;
}

- (void)reset
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D0B4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D130;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (CSSelfTriggerDetector)initWithTargetQueue:(id)a3 audioTapProvider:(id)a4 audioSourceType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CSSelfTriggerDetector;
  id v10 = [(CSSelfTriggerDetector *)&v19 init];
  if (v10)
  {
    dispatch_queue_t v11 = dispatch_queue_create("CSSelfVoiceTriggerDetector Queue", 0);
    id v12 = (void *)*((void *)v10 + 2);
    *((void *)v10 + 2) = v11;

    dispatch_set_target_queue(*((dispatch_object_t *)v10 + 2), v8);
    uint64_t v13 = +[NSHashTable weakObjectsHashTable];
    __int16 v14 = (void *)*((void *)v10 + 3);
    *((void *)v10 + 3) = v13;

    objc_storeWeak((id *)v10 + 12, v9);
    *((void *)v10 + 13) = a5;
    *((void *)v10 + 15) = 0;
    id v15 = (void *)*((void *)v10 + 6);
    *((void *)v10 + 6) = 0;

    *((unsigned char *)v10 + 8) = 0;
    +[CSConfig inputRecordingSampleRate];
    *((unsigned char *)v10 + 12) = 0;
    *((void *)v10 + 18) = 0;
    *((void *)v10 + 19) = 0;
    *((void *)v10 + 17) = (unint64_t)(float)(v16 * 0.5);
  }
  unsigned int v17 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v21 = "-[CSSelfTriggerDetector initWithTargetQueue:audioTapProvider:audioSourceType:]";
    __int16 v22 = 2048;
    unint64_t v23 = a5;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s Creating SelfTriggerDetector with audioSourceType(%lu)", buf, 0x16u);
  }

  return (CSSelfTriggerDetector *)v10;
}

+ (id)timeStampString
{
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  unint64_t v3 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyyMMdd-HHmmss"];
  id v4 = +[NSDate date];
  id v5 = [v2 stringFromDate:v4];

  return v5;
}

+ selfTriggerAudioLogDirectory
{
  void *v2;
  void *v3;
  __CFString *v4;
  id v5;
  unsigned __int8 v6;
  void *v7;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t vars8;

  id v2 = +[NSFileManager defaultManager];
  unint64_t v3 = +[CSFPreferences sharedPreferences];
  id v4 = [v3 voiceTriggerAudioLogDirectory];

  if ([v2 fileExistsAtPath:v4])
  {
    id v5 = 0;
  }
  else
  {
    dispatch_queue_t v11 = 0;
    id v6 = [v2 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v11];
    id v5 = v11;
    if ((v6 & 1) == 0)
    {
      id v7 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        id v9 = v7;
        id v10 = [v5 localizedDescription];
        *(_DWORD *)buf = 136315650;
        uint64_t v13 = "+[CSSelfTriggerDetector selfTriggerAudioLogDirectory]";
        __int16 v14 = 2114;
        id v15 = v4;
        float v16 = 2114;
        unsigned int v17 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Couldn't create self-trigger audio logging directory at path %{public}@ %{public}@", buf, 0x20u);
      }
      id v4 = @"/tmp";
    }
  }

  return v4;
}

+ selfTriggerAudioLoggingFilePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  id v2 = +[CSSelfTriggerDetector selfTriggerAudioLogDirectory];
  unint64_t v3 = +[CSSelfTriggerDetector timeStampString];
  id v4 = +[NSString stringWithFormat:@"%@%@.wav", v3, @"-selfTrigger"];

  id v5 = [v2 stringByAppendingPathComponent:v4];

  return v5;
}

@end