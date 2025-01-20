@interface CSVoiceTriggerFirstPassHearst
- (CSAsset)currentAsset;
- (CSAudioProvider)triggeredAudioProvider;
- (CSAudioStreamHolding)triggeredAudioStreamHolding;
- (CSOtherAppRecordingStateMonitor)otherAppRecordingStateMonitor;
- (CSPhoneCallStateMonitor)phoneCallStateMonitor;
- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor;
- (CSSpeechManager)speechManager;
- (CSVoiceTriggerAirPodWearerDetectionConfig)airpodWearerConfig;
- (CSVoiceTriggerDelegate)delegate;
- (CSVoiceTriggerEnabledMonitor)voiceTriggerEnabledMonitor;
- (CSVoiceTriggerFirstPassHearst)init;
- (CSVoiceTriggerFirstPassHearst)initWithSpeechManager:(id)a3 voiceTriggerEnabledMonitor:(id)a4 siriClientBehaviorMonitor:(id)a5 phoneCallStateMonitor:(id)a6 otherAppRecordingStateMonitor:(id)a7;
- (CSVoiceTriggerUserSelectedPhrase)multiPhraseEnabledStatus;
- (NSArray)phrasesToSkipBoronDecisionMaking;
- (NSMutableDictionary)hearstSecondPassRequests;
- (OS_dispatch_queue)queue;
- (float)minimumPhraseLengthForVADGating;
- (float)remoteMicVADMyriadThreshold;
- (float)remoteMicVADThreshold;
- (unint64_t)phoneCallState;
- (void)CSPhoneCallStateMonitor:(id)a3 didRecievePhoneCallStateChange:(unint64_t)a4;
- (void)_cancelAllAudioStreamHoldings;
- (void)_handleRemoteMicVADEventWithSecondPassRequest:(id)a3;
- (void)_handleRemoteMicVoiceTriggerEvent:(id)a3 secondPassRequest:(id)a4 completion:(id)a5;
- (void)_handleSecondPassResult:(id)a3 secondPassRequest:(id)a4 deviceId:(id)a5 requestOption:(id)a6 error:(id)a7 completion:(id)a8;
- (void)_requestStartAudioStreamWitContext:(id)a3 secondPassRequest:(id)a4 startStreamOption:(id)a5 completion:(id)a6;
- (void)_reset;
- (void)_setAsset:(id)a3;
- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5;
- (void)reset;
- (void)setAirpodWearerConfig:(id)a3;
- (void)setAsset:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHearstSecondPassRequests:(id)a3;
- (void)setMinimumPhraseLengthForVADGating:(float)a3;
- (void)setMultiPhraseEnabledStatus:(id)a3;
- (void)setOtherAppRecordingStateMonitor:(id)a3;
- (void)setPhoneCallState:(unint64_t)a3;
- (void)setPhoneCallStateMonitor:(id)a3;
- (void)setPhrasesToSkipBoronDecisionMaking:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteMicVADMyriadThreshold:(float)a3;
- (void)setRemoteMicVADThreshold:(float)a3;
- (void)setSiriClientBehaviorMonitor:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setTriggeredAudioProvider:(id)a3;
- (void)setTriggeredAudioStreamHolding:(id)a3;
- (void)setVoiceTriggerEnabledMonitor:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)start;
@end

@implementation CSVoiceTriggerFirstPassHearst

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiPhraseEnabledStatus, 0);
  objc_storeStrong((id *)&self->_voiceTriggerEnabledMonitor, 0);
  objc_storeStrong((id *)&self->_siriClientBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_otherAppRecordingStateMonitor, 0);
  objc_storeStrong((id *)&self->_phoneCallStateMonitor, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_triggeredAudioProvider, 0);
  objc_storeStrong((id *)&self->_triggeredAudioStreamHolding, 0);
  objc_storeStrong((id *)&self->_phrasesToSkipBoronDecisionMaking, 0);
  objc_storeStrong((id *)&self->_airpodWearerConfig, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_hearstSecondPassRequests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setMultiPhraseEnabledStatus:(id)a3
{
}

- (CSVoiceTriggerUserSelectedPhrase)multiPhraseEnabledStatus
{
  return self->_multiPhraseEnabledStatus;
}

- (void)setVoiceTriggerEnabledMonitor:(id)a3
{
}

- (CSVoiceTriggerEnabledMonitor)voiceTriggerEnabledMonitor
{
  return self->_voiceTriggerEnabledMonitor;
}

- (void)setSiriClientBehaviorMonitor:(id)a3
{
}

- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor
{
  return self->_siriClientBehaviorMonitor;
}

- (void)setOtherAppRecordingStateMonitor:(id)a3
{
}

- (CSOtherAppRecordingStateMonitor)otherAppRecordingStateMonitor
{
  return self->_otherAppRecordingStateMonitor;
}

- (void)setPhoneCallState:(unint64_t)a3
{
  self->_phoneCallState = a3;
}

- (unint64_t)phoneCallState
{
  return self->_phoneCallState;
}

- (void)setPhoneCallStateMonitor:(id)a3
{
}

- (CSPhoneCallStateMonitor)phoneCallStateMonitor
{
  return self->_phoneCallStateMonitor;
}

- (void)setSpeechManager:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setTriggeredAudioProvider:(id)a3
{
}

- (CSAudioProvider)triggeredAudioProvider
{
  return self->_triggeredAudioProvider;
}

- (void)setTriggeredAudioStreamHolding:(id)a3
{
}

- (CSAudioStreamHolding)triggeredAudioStreamHolding
{
  return self->_triggeredAudioStreamHolding;
}

- (void)setPhrasesToSkipBoronDecisionMaking:(id)a3
{
}

- (NSArray)phrasesToSkipBoronDecisionMaking
{
  return self->_phrasesToSkipBoronDecisionMaking;
}

- (void)setMinimumPhraseLengthForVADGating:(float)a3
{
  self->_minimumPhraseLengthForVADGating = a3;
}

- (float)minimumPhraseLengthForVADGating
{
  return self->_minimumPhraseLengthForVADGating;
}

- (void)setRemoteMicVADMyriadThreshold:(float)a3
{
  self->_remoteMicVADMyriadThreshold = a3;
}

- (float)remoteMicVADMyriadThreshold
{
  return self->_remoteMicVADMyriadThreshold;
}

- (void)setRemoteMicVADThreshold:(float)a3
{
  self->_remoteMicVADThreshold = a3;
}

- (float)remoteMicVADThreshold
{
  return self->_remoteMicVADThreshold;
}

- (void)setAirpodWearerConfig:(id)a3
{
}

- (CSVoiceTriggerAirPodWearerDetectionConfig)airpodWearerConfig
{
  return self->_airpodWearerConfig;
}

- (void)setCurrentAsset:(id)a3
{
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setHearstSecondPassRequests:(id)a3
{
}

- (NSMutableDictionary)hearstSecondPassRequests
{
  return self->_hearstSecondPassRequests;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDelegate:(id)a3
{
}

- (CSVoiceTriggerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSVoiceTriggerDelegate *)WeakRetained;
}

- (void)_cancelAllAudioStreamHoldings
{
  if (self->_triggeredAudioStreamHolding)
  {
    v3 = [(CSVoiceTriggerFirstPassHearst *)self triggeredAudioProvider];
    [v3 cancelAudioStreamHold:self->_triggeredAudioStreamHolding];

    triggeredAudioStreamHolding = self->_triggeredAudioStreamHolding;
    self->_triggeredAudioStreamHolding = 0;

    triggeredAudioProvider = self->_triggeredAudioProvider;
    self->_triggeredAudioProvider = 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = [(NSMutableDictionary *)self->_hearstSecondPassRequests objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) cancelAudioStreamHold];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_requestStartAudioStreamWitContext:(id)a3 secondPassRequest:(id)a4 startStreamOption:(id)a5 completion:(id)a6
{
  id v9 = a4;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1001044A8;
  v29[3] = &unk_100253100;
  id v10 = a6;
  id v30 = v10;
  id v11 = a3;
  long long v12 = objc_retainBlock(v29);
  speechManager = self->_speechManager;
  id v28 = 0;
  long long v14 = [(CSSpeechManager *)speechManager audioProviderWithContext:v11 error:&v28];

  id v15 = v28;
  if (v14)
  {
    [v9 setAudioProvider:v14];
    id v16 = objc_alloc_init((Class)CSAudioStreamRequest);
    [v16 setRequiresHistoricalBuffer:1];
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    id v27 = 0;
    v19 = [v14 audioStreamWithRequest:v16 streamName:v18 error:&v27];
    id v20 = v27;

    if (!v19)
    {
      v21 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        v25 = v21;
        v26 = [v20 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v32 = "-[CSVoiceTriggerFirstPassHearst _requestStartAudioStreamWitContext:secondPassRequest:startStreamOption:completion:]";
        __int16 v33 = 2114;
        v34 = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s Failed to get audio stream : %{public}@", buf, 0x16u);
      }
    }
    ((void (*)(void *, BOOL, id))v12[2])(v12, v19 != 0, v20);
  }
  else
  {
    v22 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      v23 = v22;
      v24 = [v15 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v32 = "-[CSVoiceTriggerFirstPassHearst _requestStartAudioStreamWitContext:secondPassRequest:startStreamOption:completion:]";
      __int16 v33 = 2114;
      v34 = v24;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s Getting audio stream provider has failed : %{public}@", buf, 0x16u);
    }
    ((void (*)(void *, void, id))v12[2])(v12, 0, v15);
  }
}

- (void)_handleSecondPassResult:(id)a3 secondPassRequest:(id)a4 deviceId:(id)a5 requestOption:(id)a6 error:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = (void (**)(id, void, id))a8;
  id v20 = [v14 result];
  v21 = [v14 voiceTriggerEventInfo];
  uint64_t v87 = (uint64_t)v20;
  if (v20 == (id)4)
  {
    if (v19) {
      v19[2](v19, 0, v18);
    }
    goto LABEL_49;
  }
  v85 = v19;
  v22 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    v24 = [v18 localizedDescription];
    *(_DWORD *)buf = 136316162;
    v101 = "-[CSVoiceTriggerFirstPassHearst _handleSecondPassResult:secondPassRequest:deviceId:requestOption:error:completion:]";
    __int16 v102 = 1026;
    *(_DWORD *)v103 = v87;
    *(_WORD *)&v103[4] = 2114;
    *(void *)&v103[6] = v21;
    *(_WORD *)&v103[14] = 2114;
    *(void *)&v103[16] = v16;
    *(_WORD *)&v103[24] = 2114;
    *(void *)&v103[26] = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s Second Pass Result, %{public}d, %{public}@, %{public}@, %{public}@", buf, 0x30u);
  }
  v25 = &off_1001AC000;
  v86 = v18;
  if (v21)
  {
    uint64_t v26 = kVTEITriggeredPh;
    id v27 = [v21 objectForKeyedSubscript:kVTEITriggeredPh];

    if (v27)
    {
      id v83 = v17;
      id v84 = v16;
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      id v28 = self->_phrasesToSkipBoronDecisionMaking;
      id v29 = [(NSArray *)v28 countByEnumeratingWithState:&v96 objects:v108 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v97;
        id v82 = v15;
        while (2)
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v97 != v31) {
              objc_enumerationMutation(v28);
            }
            __int16 v33 = *(void **)(*((void *)&v96 + 1) + 8 * i);
            v34 = objc_msgSend(v21, "objectForKeyedSubscript:", v26, v82);
            LODWORD(v33) = [v33 isEqualToString:v34];

            if (v33)
            {
              v60 = (void *)CSLogCategoryVT;
              if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
              {
                v61 = v60;
                v62 = [v21 objectForKeyedSubscript:v26];
                *(_DWORD *)buf = 136315394;
                v101 = "-[CSVoiceTriggerFirstPassHearst _handleSecondPassResult:secondPassRequest:deviceId:requestOption:"
                       "error:completion:]";
                __int16 v102 = 2112;
                *(void *)v103 = v62;
                _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%s Ignoring boron based decision making as triggered phrase %@", buf, 0x16u);
              }
              id v15 = v82;
              id v17 = v83;
              id v16 = v84;
              goto LABEL_31;
            }
          }
          id v30 = [(NSArray *)v28 countByEnumeratingWithState:&v96 objects:v108 count:16];
          id v15 = v82;
          if (v30) {
            continue;
          }
          break;
        }
      }

      id v17 = v83;
      id v16 = v84;
      v25 = &off_1001AC000;
    }
  }
  v35 = [v21 objectForKeyedSubscript:kVTEItriggerEndSeconds];
  [v35 floatValue];
  float v37 = v36;

  v38 = [v21 objectForKeyedSubscript:kVTEIShadowMicScoreThresholdForVAD];
  [v38 doubleValue];
  uint64_t v40 = v39;

  v41 = [v21 objectForKeyedSubscript:kVTEIShadowMicScore];
  [v41 doubleValue];
  uint64_t v43 = v42;

  v44 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    v45 = v44;
    [v15 remoteMicVADScore];
    double remoteMicVADThreshold = self->_remoteMicVADThreshold;
    double minimumPhraseLengthForVADGating = self->_minimumPhraseLengthForVADGating;
    *(_DWORD *)buf = 136316674;
    v101 = "-[CSVoiceTriggerFirstPassHearst _handleSecondPassResult:secondPassRequest:deviceId:requestOption:error:completion:]";
    __int16 v102 = 2050;
    *(double *)v103 = v48;
    *(_WORD *)&v103[8] = 2050;
    *(double *)&v103[10] = remoteMicVADThreshold;
    *(_WORD *)&v103[18] = 2050;
    *(double *)&v103[20] = v37;
    *(_WORD *)&v103[28] = 2050;
    *(double *)&v103[30] = minimumPhraseLengthForVADGating;
    __int16 v104 = 2050;
    uint64_t v105 = v43;
    __int16 v106 = 2050;
    uint64_t v107 = v40;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%s remoteMicVADScore : %{public}f, remoteMicVADThreshold : %{public}f, triggerEndSeconds : %{public}f, minPhraseLength : %{public}f shadowMicScore: %{public}f shadowMicScoreThreshold: %{public}f", buf, 0x48u);
  }
  v92[0] = _NSConcreteStackBlock;
  v92[1] = *((void *)v25 + 160);
  v92[2] = sub_100104E58;
  v92[3] = &unk_100251AB0;
  uint64_t v94 = v40;
  uint64_t v95 = v43;
  v93 = &stru_100251A88;
  v49 = objc_retainBlock(v92);
  v50 = [v17 rtModelRequestOptions];
  v51 = [v50 accessoryInfo];
  unsigned int v52 = [v51 supportsAlwaysOnAccelerometer];

  id v53 = [v15 remoteMicVADScore];
  if (v52)
  {
    if (!sub_100104F80(v53, v54, self->_remoteMicVADThreshold)) {
      goto LABEL_27;
    }
  }
  else if (!((unsigned int (*)(void *))v49[2])(v49))
  {
    goto LABEL_27;
  }
  if (v87 == 1)
  {
    v55 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      v56 = v55;
      [v15 remoteMicVADScore];
      double v57 = self->_remoteMicVADThreshold;
      double v58 = self->_minimumPhraseLengthForVADGating;
      *(_DWORD *)buf = 136316162;
      v101 = "-[CSVoiceTriggerFirstPassHearst _handleSecondPassResult:secondPassRequest:deviceId:requestOption:error:completion:]";
      __int16 v102 = 2050;
      *(double *)v103 = v59;
      *(_WORD *)&v103[8] = 2050;
      *(double *)&v103[10] = v57;
      *(_WORD *)&v103[18] = 2050;
      *(double *)&v103[20] = v37;
      *(_WORD *)&v103[28] = 2050;
      *(double *)&v103[30] = v58;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%s Trigger is rejected since remoteMicVADScore is %{public}f, remoteMicVADThreshold is %{public}f, triggerEndSeconds is %{public}f, minPhraseLength is %{public}f", buf, 0x34u);
    }
    uint64_t v87 = 9;
  }
LABEL_27:

  id v28 = (NSArray *)v93;
LABEL_31:

  id v63 = [v21 mutableCopy];
  [v15 remoteMicVADScore];
  v64 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v63 setObject:v64 forKey:kVTEIRemoteMicVADScore];

  *(float *)&double v65 = self->_remoteMicVADThreshold;
  v66 = +[NSNumber numberWithFloat:v65];
  [v63 setObject:v66 forKey:kVTEIRemoteMicVADThreshold];

  *(float *)&double v67 = self->_remoteMicVADMyriadThreshold;
  v68 = +[NSNumber numberWithFloat:v67];
  [v63 setObject:v68 forKey:kVTEIRemoteMicVADMyriadThreshold];

  switch(v87)
  {
    case 1:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v70 = objc_opt_respondsToSelector();

      if (v70)
      {
        v71 = objc_loadWeakRetained((id *)&self->_delegate);
        [v71 voiceTriggerDidDetectKeyword:v63 deviceId:v16];
        goto LABEL_42;
      }
      break;
    case 2:
      id v72 = objc_loadWeakRetained((id *)&self->_delegate);
      char v73 = objc_opt_respondsToSelector();

      if (v73)
      {
        v71 = objc_loadWeakRetained((id *)&self->_delegate);
        [v71 voiceTriggerDidRejected:v63 deviceId:v16];
        goto LABEL_42;
      }
      break;
    case 3:
      id v74 = objc_loadWeakRetained((id *)&self->_delegate);
      char v75 = objc_opt_respondsToSelector();

      if (v75)
      {
        v71 = objc_loadWeakRetained((id *)&self->_delegate);
        [v71 voiceTriggerDidDetectNearMiss:v63 deviceId:v16];
        goto LABEL_42;
      }
      break;
    case 9:
      id v78 = objc_loadWeakRetained((id *)&self->_delegate);
      char v79 = objc_opt_respondsToSelector();

      if (v79)
      {
        v71 = objc_loadWeakRetained((id *)&self->_delegate);
        [v71 voiceTriggerDidDetectSpeakerReject:v21];
        goto LABEL_42;
      }
      break;
    default:
      v76 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        v71 = v76;
        v77 = [v86 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v101 = "-[CSVoiceTriggerFirstPassHearst _handleSecondPassResult:secondPassRequest:deviceId:requestOption:error:completion:]";
        __int16 v102 = 2114;
        *(void *)v103 = v77;
        _os_log_error_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "%s VoiceTrigger Second Pass has failed : %{public}@", buf, 0x16u);

LABEL_42:
      }
      break;
  }
  if ([v14 isSecondChanceCandidate]) {
    v80 = [[CSVoiceTriggerSecondChanceContext alloc] initWithWindowStartTime:mach_absolute_time()];
  }
  else {
    v80 = 0;
  }
  v19 = v85;
  [v15 setSecondChanceContext:v80];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100105048;
  block[3] = &unk_1002532A8;
  v90 = self;
  uint64_t v91 = v87;
  id v89 = v15;
  dispatch_async(queue, block);
  if (v85) {
    v85[2](v85, 1, 0);
  }

  id v18 = v86;
LABEL_49:
}

- (void)_handleRemoteMicVoiceTriggerEvent:(id)a3 secondPassRequest:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v34 = a5;
  v35 = +[CSVoiceTriggerFirstPassMetrics CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:](CSVoiceTriggerFirstPassMetrics, "CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:", [v7 hosttime], mach_absolute_time());
  id v9 = [v7 deviceId];
  float v36 = +[CSAudioRecordContext contextForHearstVoiceTriggerWithDeviceId:v9];

  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1001055B0;
  v47[3] = &unk_100253B30;
  v47[4] = self;
  id v10 = v8;
  id v48 = v10;
  [(CSVoiceTriggerFirstPassHearst *)self _requestStartAudioStreamWitContext:v36 secondPassRequest:v10 startStreamOption:0 completion:v47];
  id v11 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = v11;
    long long v13 = [v7 deviceId];
    *(_DWORD *)buf = 136315394;
    v50 = "-[CSVoiceTriggerFirstPassHearst _handleRemoteMicVoiceTriggerEvent:secondPassRequest:completion:]";
    __int16 v51 = 2112;
    unsigned int v52 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  [v10 setIsSecondPassRunning:1];
  objc_initWeak((id *)buf, self);
  id v14 = [CSVoiceTriggerRTModelRequestOptions alloc];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100105718;
  v45[3] = &unk_100251A20;
  v45[4] = self;
  id v15 = v7;
  id v46 = v15;
  id v16 = [(CSVoiceTriggerRTModelRequestOptions *)v14 initWithMutableBuilder:v45];
  id v17 = [v10 secondChanceContext];
  id v18 = [v17 shouldRunAsSecondChance];

  v19 = [CSVoiceTriggerSecondPassRequestOption alloc];
  id v20 = [v15 deviceId];
  v21 = [v10 audioProvider];
  v22 = [v21 UUID];
  v23 = [v15 activationInfo];
  v24 = +[NSUUID UUID];
  v25 = [(CSVoiceTriggerSecondPassRequestOption *)v19 initWithFirstPassSource:3 deviceId:v20 audioProviderUUID:v22 firstPassInfo:v23 rejectionMHUUID:v24 isSecondChanceRun:v18 firstpassMetrics:v35 rtModelRequestOptions:v16];

  if ([(CSVoiceTriggerRTModelRequestOptions *)v16 allowMph])
  {
    uint64_t v26 = [(CSVoiceTriggerRTModelRequestOptions *)v16 accessoryInfo];
    id v27 = [v26 supportsJustSiri];
  }
  else
  {
    id v27 = 0;
  }
  id v28 = [v10 voiceTriggerSecondPass];
  [v28 setSupportsMultiPhraseDetection:v27];

  id v29 = [v10 voiceTriggerSecondPass];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1001058AC;
  v38[3] = &unk_100251A48;
  objc_copyWeak(&v44, (id *)buf);
  id v30 = v10;
  id v39 = v30;
  id v31 = v15;
  id v40 = v31;
  v32 = v25;
  v41 = v32;
  id v33 = v34;
  uint64_t v42 = self;
  id v43 = v33;
  [v29 handleVoiceTriggerSecondPassFrom:v32 completion:v38];

  objc_destroyWeak(&v44);
  objc_destroyWeak((id *)buf);
}

- (void)_handleRemoteMicVADEventWithSecondPassRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    [v4 remoteMicVADScore];
    double remoteMicVADThreshold = self->_remoteMicVADThreshold;
    double remoteMicVADMyriadThreshold = self->_remoteMicVADMyriadThreshold;
    int v17 = 136315906;
    id v18 = "-[CSVoiceTriggerFirstPassHearst _handleRemoteMicVADEventWithSecondPassRequest:]";
    __int16 v19 = 2050;
    double v20 = v9;
    __int16 v21 = 2050;
    double v22 = remoteMicVADThreshold;
    __int16 v23 = 2050;
    double v24 = remoteMicVADMyriadThreshold;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Handle Remote Mic VAD Event : remoteMicVADScore is %{public}f, remoteMicVADThreshold is %{public}f, remoteMicVADMyriadThreshold is %{public}f", (uint8_t *)&v17, 0x2Au);
  }
  [v4 remoteMicVADScore];
  if (v10 >= self->_remoteMicVADMyriadThreshold) {
    +[CSMyriadNotifier notifyInEarMyriadTrigger];
  }
  id v11 = +[CSFPreferences sharedPreferences];
  unsigned int v12 = [v11 shouldOverwriteRemoteVADScore];

  if (v12)
  {
    long long v13 = +[CSFPreferences sharedPreferences];
    [v13 overwritingRemoteVADScore];
    objc_msgSend(v4, "setRemoteMicVADScore:");

    id v14 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      [v4 remoteMicVADScore];
      int v17 = 136315394;
      id v18 = "-[CSVoiceTriggerFirstPassHearst _handleRemoteMicVADEventWithSecondPassRequest:]";
      __int16 v19 = 2050;
      double v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Remote VAD Score overwritten to %{public}f", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100105E24;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSPhoneCallStateMonitor:(id)a3 didRecievePhoneCallStateChange:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100105F4C;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100106018;
  block[3] = &unk_100253280;
  id v14 = self;
  id v15 = v8;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)_setAsset:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    [v5 logAssetVersionForInsight];
    objc_storeStrong((id *)&self->_currentAsset, a3);
    id v7 = +[CSVoiceTriggerSecondPassConfigDecoder decodeConfigFrom:self->_currentAsset forFirstPassSource:3];
    id v8 = [v7 wearerDetectionConfig];
    [v8 threshold];
    self->_double remoteMicVADThreshold = v9;

    id v10 = [v7 wearerDetectionConfig];
    [v10 myriadThreshold];
    self->_double remoteMicVADMyriadThreshold = v11;

    unsigned int v12 = [v7 wearerDetectionConfig];
    [v12 minimumPhraseLength];
    self->_double minimumPhraseLengthForVADGating = v13;

    id v14 = [v7 wearerDetectionConfig];
    id v15 = [v14 phrasesToSkipBoronDecisionMaking];
    phrasesToSkipBoronDecisionMaking = self->_phrasesToSkipBoronDecisionMaking;
    self->_phrasesToSkipBoronDecisionMaking = v15;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    int v17 = [(NSMutableDictionary *)self->_hearstSecondPassRequests objectEnumerator];
    id v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * i) setAsset:v6];
        }
        id v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v19);
    }

    [(CSVoiceTriggerFirstPassHearst *)self _reset];
  }
  else
  {
    double v22 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v29 = "-[CSVoiceTriggerFirstPassHearst _setAsset:]";
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s asset is nil, stop initialization", buf, 0xCu);
    }
  }
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100106C10;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_reset
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMutableDictionary *)self->_hearstSecondPassRequests objectEnumerator];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) reset];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)reset
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100106D80;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100106DFC;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (CSVoiceTriggerFirstPassHearst)init
{
  return [(CSVoiceTriggerFirstPassHearst *)self initWithSpeechManager:0 voiceTriggerEnabledMonitor:0 siriClientBehaviorMonitor:0 phoneCallStateMonitor:0 otherAppRecordingStateMonitor:0];
}

- (CSVoiceTriggerFirstPassHearst)initWithSpeechManager:(id)a3 voiceTriggerEnabledMonitor:(id)a4 siriClientBehaviorMonitor:(id)a5 phoneCallStateMonitor:(id)a6 otherAppRecordingStateMonitor:(id)a7
{
  id v46 = a3;
  id v45 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v49.receiver = self;
  v49.super_class = (Class)CSVoiceTriggerFirstPassHearst;
  float v16 = [(CSVoiceTriggerFirstPassHearst *)&v49 init];
  int v17 = v16;
  if (v16)
  {
    p_speechManager = (void **)&v16->_speechManager;
    objc_storeStrong((id *)&v16->_speechManager, a3);
    if (!v17->_speechManager)
    {
      uint64_t v19 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
      uint64_t v20 = *p_speechManager;
      *p_speechManager = (void *)v19;
    }
    p_voiceTriggerEnabledMonitor = (void **)&v17->_voiceTriggerEnabledMonitor;
    objc_storeStrong((id *)&v17->_voiceTriggerEnabledMonitor, a4);
    if (!v17->_voiceTriggerEnabledMonitor)
    {
      uint64_t v22 = +[CSVoiceTriggerEnabledMonitor sharedInstance];
      long long v23 = *p_voiceTriggerEnabledMonitor;
      *p_voiceTriggerEnabledMonitor = (void *)v22;
    }
    p_siriClientBehaviorMonitor = (void **)&v17->_siriClientBehaviorMonitor;
    objc_storeStrong((id *)&v17->_siriClientBehaviorMonitor, a5);
    if (!v17->_siriClientBehaviorMonitor)
    {
      uint64_t v25 = +[CSSiriClientBehaviorMonitor sharedInstance];
      long long v26 = *p_siriClientBehaviorMonitor;
      *p_siriClientBehaviorMonitor = (void *)v25;
    }
    dispatch_queue_t v27 = dispatch_queue_create("VoiceTriggerFirstPassHearst Queue", 0);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v27;

    id v29 = v17->_queue;
    id v30 = dispatch_get_global_queue(33, 0);
    dispatch_set_target_queue(v29, v30);

    uint64_t v31 = +[NSMutableDictionary dictionary];
    hearstSecondPassRequests = v17->_hearstSecondPassRequests;
    v17->_hearstSecondPassRequests = (NSMutableDictionary *)v31;

    p_phoneCallStateMonitor = (void **)&v17->_phoneCallStateMonitor;
    objc_storeStrong((id *)&v17->_phoneCallStateMonitor, a6);
    phoneCallStateMonitor = v17->_phoneCallStateMonitor;
    if (!phoneCallStateMonitor)
    {
      uint64_t v35 = +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor];
      float v36 = *p_phoneCallStateMonitor;
      *p_phoneCallStateMonitor = (void *)v35;

      phoneCallStateMonitor = *p_phoneCallStateMonitor;
    }
    [phoneCallStateMonitor addObserver:v17];
    float v37 = v17->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010718C;
    block[3] = &unk_100253AE0;
    v38 = v17;
    id v48 = v38;
    dispatch_async(v37, block);
    p_otherAppRecordingStateMonitor = (void **)&v38->_otherAppRecordingStateMonitor;
    objc_storeStrong((id *)&v38->_otherAppRecordingStateMonitor, a7);
    if (!v38->_otherAppRecordingStateMonitor)
    {
      uint64_t v40 = +[CSOtherAppRecordingStateMonitor sharedInstance];
      v41 = *p_otherAppRecordingStateMonitor;
      *p_otherAppRecordingStateMonitor = (void *)v40;
    }
    uint64_t v42 = [[CSVoiceTriggerUserSelectedPhrase alloc] initWithEndpointId:0];
    multiPhraseEnabledStatus = v38->_multiPhraseEnabledStatus;
    v38->_multiPhraseEnabledStatus = v42;
  }
  return v17;
}

@end