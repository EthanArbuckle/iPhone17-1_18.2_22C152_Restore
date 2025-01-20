@interface CSAttSiriSSRNode
- (BOOL)isReady;
- (BOOL)shouldCleanupVoiceProfile;
- (CSAsset)asset;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAttSiriSSRNode)init;
- (CSAttSiriSSRNode)initWithAttSiriController:(id)a3;
- (CSAttSiriSSRNode)initWithDownloadMonitor:(id)a3 assetHandler:(id)a4;
- (CSAudioFileWriter)leadingUtteranceLogger;
- (CSAudioRecordContext)audioRecordContext;
- (CSConnectionListener)localSRBridgeListener;
- (CSConnectionListener)ssrListener;
- (CSSpeakerRecognitionAssetDownloadMonitor)downloadMonitor;
- (CSVoiceTriggerAssetHandler)assetHandler;
- (NSArray)requiredNodes;
- (NSArray)ssrAssets;
- (NSDictionary)speakerRecognitionScores;
- (NSDictionary)voiceTriggerEventInfo;
- (NSHashTable)receivers;
- (NSSet)sharedUserIdsSet;
- (NSString)leadingUtteranceAudioFile;
- (NSString)mhId;
- (NSString)requestId;
- (OS_dispatch_queue)queue;
- (SSRSpeakerRecognitionController)ssrController;
- (SSRVoiceProfile)ccProfile;
- (SSRVoiceProfileManager)voiceProfileManager;
- (id)_mapScoresToSharedSiriId:(id)a3;
- (id)_processSpeakerRecognitionResult:(id)a3;
- (id)filteredVoiceProfileArray:(id)a3;
- (id)getLeadingUtteranceLogger;
- (id)getSharedUserIdWithHighestVoiceIdScore:(id)a3;
- (unint64_t)type;
- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)CSSpeakerRecognitionAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4 assetProviderType:(unint64_t)a5;
- (void)_logSpeakerFalseTriggerMitigationScore:(id)a3 withSpeakerMatchScore:(float)a4 withSpeakerScoreThreshold:(float)a5 withAudioDuration:(double)a6 withSuccess:(BOOL)a7;
- (void)_refreshSpeakerRecognitionAssets;
- (void)_reportNoAudioProcessed;
- (void)_setupLeadingUtteranceLogger;
- (void)_setupSSRControllerWithAudioContext:(id)a3 withVoiceTriggerEventInfo:(id)a4;
- (void)_setupSpeakerRecognitionForFollowUp:(id)a3 withVoiceTriggerInfo:(id)a4;
- (void)_setupSpeakerRecognitionForProfiles:(id)a3 WithVTEventInfo:(id)a4 WithLocale:(id)a5;
- (void)_setupWithDownloadMonitor:(id)a3 assetHandler:(id)a4;
- (void)_stopProcessing;
- (void)addReceiver:(id)a3;
- (void)attSiriAudioSrcNodeDidStop:(id)a3;
- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4;
- (void)cacheSharedUserInfos:(id)a3;
- (void)handleSiriSessionEnd;
- (void)logSpeakerFalseTriggerMitigationScore:(float)a3 withAudioDuration:(double)a4;
- (void)removeReceiver:(id)a3;
- (void)resetForNewRequestWithRecordContext:(id)a3 voiceTriggerInfo:(id)a4 withReqId:(id)a5;
- (void)setAsset:(id)a3;
- (void)setAssetHandler:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setCcProfile:(id)a3;
- (void)setDownloadMonitor:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setLeadingUtteranceAudioFile:(id)a3;
- (void)setLeadingUtteranceLogger:(id)a3;
- (void)setLocalSRBridgeListener:(id)a3;
- (void)setMhId:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setSharedUserIdsSet:(id)a3;
- (void)setShouldCleanupVoiceProfile:(BOOL)a3;
- (void)setSpeakerRecognitionScores:(id)a3;
- (void)setSsrAssets:(id)a3;
- (void)setSsrController:(id)a3;
- (void)setSsrListener:(id)a3;
- (void)setUpSpeakerProfileForFlexibleFollowup;
- (void)setVoiceProfileManager:(id)a3;
- (void)setVoiceTriggerEventInfo:(id)a3;
- (void)speakerRecognitionController:(id)a3 hasSpeakerInfo:(id)a4;
- (void)speakerRecognitionFinishedProcessing:(id)a3 withFinalSpeakerInfo:(id)a4;
- (void)startXPCConnection;
- (void)stop;
@end

@implementation CSAttSiriSSRNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetHandler, 0);
  objc_storeStrong((id *)&self->_downloadMonitor, 0);
  objc_storeStrong((id *)&self->_receivers, 0);
  objc_storeStrong((id *)&self->_speakerRecognitionScores, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, 0);
  objc_storeStrong((id *)&self->_audioRecordContext, 0);
  objc_storeStrong((id *)&self->_sharedUserIdsSet, 0);
  objc_storeStrong((id *)&self->_ssrAssets, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_leadingUtteranceLogger, 0);
  objc_storeStrong((id *)&self->_leadingUtteranceAudioFile, 0);
  objc_storeStrong((id *)&self->_ccProfile, 0);
  objc_storeStrong((id *)&self->_voiceProfileManager, 0);
  objc_storeStrong((id *)&self->_ssrController, 0);
  objc_storeStrong((id *)&self->_localSRBridgeListener, 0);
  objc_storeStrong((id *)&self->_ssrListener, 0);
  objc_storeStrong((id *)&self->_prefetchedAsset, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_storeStrong((id *)&self->_requiredNodes, 0);
  objc_destroyWeak((id *)&self->_attSiriController);
}

- (void)setAssetHandler:(id)a3
{
}

- (CSVoiceTriggerAssetHandler)assetHandler
{
  return self->_assetHandler;
}

- (void)setDownloadMonitor:(id)a3
{
}

- (CSSpeakerRecognitionAssetDownloadMonitor)downloadMonitor
{
  return self->_downloadMonitor;
}

- (void)setReceivers:(id)a3
{
}

- (NSHashTable)receivers
{
  return self->_receivers;
}

- (void)setSpeakerRecognitionScores:(id)a3
{
}

- (NSDictionary)speakerRecognitionScores
{
  return self->_speakerRecognitionScores;
}

- (void)setRequestId:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setVoiceTriggerEventInfo:(id)a3
{
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (void)setAudioRecordContext:(id)a3
{
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (void)setSharedUserIdsSet:(id)a3
{
}

- (NSSet)sharedUserIdsSet
{
  return self->_sharedUserIdsSet;
}

- (void)setSsrAssets:(id)a3
{
}

- (NSArray)ssrAssets
{
  return self->_ssrAssets;
}

- (void)setAsset:(id)a3
{
}

- (CSAsset)asset
{
  return self->_asset;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setLeadingUtteranceLogger:(id)a3
{
}

- (CSAudioFileWriter)leadingUtteranceLogger
{
  return self->_leadingUtteranceLogger;
}

- (void)setLeadingUtteranceAudioFile:(id)a3
{
}

- (NSString)leadingUtteranceAudioFile
{
  return self->_leadingUtteranceAudioFile;
}

- (void)setCcProfile:(id)a3
{
}

- (SSRVoiceProfile)ccProfile
{
  return self->_ccProfile;
}

- (void)setVoiceProfileManager:(id)a3
{
}

- (SSRVoiceProfileManager)voiceProfileManager
{
  return self->_voiceProfileManager;
}

- (void)setSsrController:(id)a3
{
}

- (SSRSpeakerRecognitionController)ssrController
{
  return self->_ssrController;
}

- (void)setShouldCleanupVoiceProfile:(BOOL)a3
{
  self->_shouldCleanupVoiceProfile = a3;
}

- (BOOL)shouldCleanupVoiceProfile
{
  return self->_shouldCleanupVoiceProfile;
}

- (void)setLocalSRBridgeListener:(id)a3
{
}

- (CSConnectionListener)localSRBridgeListener
{
  return self->_localSRBridgeListener;
}

- (void)setSsrListener:(id)a3
{
}

- (CSConnectionListener)ssrListener
{
  return self->_ssrListener;
}

- (CSAsset)prefetchedAsset
{
  return self->_prefetchedAsset;
}

- (void)setMhId:(id)a3
{
}

- (NSString)mhId
{
  return self->_mhId;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setRequiredNodes:(id)a3
{
}

- (NSArray)requiredNodes
{
  return self->_requiredNodes;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setAttSiriController:(id)a3
{
}

- (CSAttSiriController)attSiriController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attSiriController);
  return (CSAttSiriController *)WeakRetained;
}

- (id)getLeadingUtteranceLogger
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10002D4C8;
  v10 = sub_10002D4D8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002D4E0;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_logSpeakerFalseTriggerMitigationScore:(id)a3 withSpeakerMatchScore:(float)a4 withSpeakerScoreThreshold:(float)a5 withAudioDuration:(double)a6 withSuccess:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  if (self->_mhId)
  {
    id v13 = objc_alloc((Class)SISchemaUUID);
    id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:self->_mhId];
    id v15 = [v13 initWithNSUUID:v14];

    id v16 = objc_alloc_init((Class)MHSchemaMHSpeakerFalseTriggerMitigated);
    [v16 setModelVersion:v12];
    *(float *)&double v17 = a4;
    [v16 setSpeakerMatchScore:v17];
    *(float *)&double v18 = a5;
    [v16 setThresholdScore:v18];
    [v16 setProcessedAudioDurationInNs:a6];
    if (v7) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = 1954;
    }
    [v16 setErrorCode:v19];
    id v20 = objc_alloc_init((Class)MHSchemaMHClientEventMetadata);
    [v20 setMhId:v15];
    id v21 = objc_alloc_init((Class)MHSchemaMHClientEvent);
    [v21 setMhId:v15];
    [v21 setEventMetadata:v20];
    [v21 setSpeakerFalseTriggerMitigated:v16];
    v22 = +[AssistantSiriAnalytics sharedStream];
    [v22 emitMessage:v21];

    v23 = CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_INFO))
    {
      mhId = self->_mhId;
      int v26 = 136315906;
      v27 = "-[CSAttSiriSSRNode _logSpeakerFalseTriggerMitigationScore:withSpeakerMatchScore:withSpeakerScoreThreshold:wi"
            "thAudioDuration:withSuccess:]";
      __int16 v28 = 2112;
      v29 = mhId;
      __int16 v30 = 2048;
      double v31 = a4;
      __int16 v32 = 2048;
      double v33 = a6;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s Submit Speaker False Trigger Mitigation score msg to SELF metrics for MH ID: %@, speakerMatchScore: %f, audioProcessDuration: %f", (uint8_t *)&v26, 0x2Au);
    }
  }
  else
  {
    v25 = CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_ERROR))
    {
      int v26 = 136315138;
      v27 = "-[CSAttSiriSSRNode _logSpeakerFalseTriggerMitigationScore:withSpeakerMatchScore:withSpeakerScoreThreshold:wi"
            "thAudioDuration:withSuccess:]";
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s MHID not set, skipping SELF Logging", (uint8_t *)&v26, 0xCu);
    }
  }
}

- (void)logSpeakerFalseTriggerMitigationScore:(float)a3 withAudioDuration:(double)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D7F4;
  block[3] = &unk_100251E68;
  block[4] = self;
  float v6 = a3;
  *(double *)&block[5] = a4;
  dispatch_async(queue, block);
}

- (void)attSiriAudioSrcNodeLPCMRecordBufferAvailable:(id)a3 audioChunk:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002D8F8;
  v8[3] = &unk_100253B08;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)attSiriAudioSrcNodeDidStop:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DA50;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)speakerRecognitionFinishedProcessing:(id)a3 withFinalSpeakerInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DBCC;
  block[3] = &unk_100253540;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5 = a4;
  id v6 = CSLogCategorySpkrId;
  if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[CSAttSiriSSRNode CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s _currentLanguageCode changed: %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E1A8;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)speakerRecognitionController:(id)a3 hasSpeakerInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002E370;
    block[3] = &unk_100253540;
    block[4] = self;
    id v13 = v6;
    id v14 = v8;
    dispatch_async(queue, block);
  }
  else
  {
    if (!v6 && (id v10 = CSLogCategorySpkrId, os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[CSAttSiriSSRNode speakerRecognitionController:hasSpeakerInfo:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s spkrRecognizer is nil!", buf, 0xCu);
      if (v8) {
        goto LABEL_9;
      }
    }
    else if (v8)
    {
      goto LABEL_9;
    }
    __int16 v11 = CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[CSAttSiriSSRNode speakerRecognitionController:hasSpeakerInfo:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s speakerInfo is nil!", buf, 0xCu);
    }
  }
LABEL_9:
}

- (void)CSSpeakerRecognitionAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4 assetProviderType:(unint64_t)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EA20;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)startXPCConnection
{
  v2 = CSLogCategorySpkrId;
  if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[CSAttSiriSSRNode startXPCConnection]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s XPC connection with client established", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_reportNoAudioProcessed
{
  if (CSIsHorseman())
  {
    speakerRecognitionScores = self->_speakerRecognitionScores;
    if (!speakerRecognitionScores
      || (-[NSDictionary objectForKeyedSubscript:](speakerRecognitionScores, "objectForKeyedSubscript:", kSSRSpeakerRecognitionAudioProcessedDurationKey), v4 = objc_claimAutoreleasedReturnValue(), unsigned int v5 = [v4 intValue], v4, !v5))
    {
      id v6 = CSLogCategorySpkrId;
      if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315394;
        id v9 = "-[CSAttSiriSSRNode _reportNoAudioProcessed]";
        __int16 v10 = 1024;
        int v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Reporting no audio processed for speaker recognition: %ims", (uint8_t *)&v8, 0x12u);
      }
      id v7 = +[CSDiagnosticReporter sharedInstance];
      [v7 submitVoiceIdIssueReport:kCSDiagnosticReporterVoiceIdNoAudioProcessed];
    }
  }
}

- (void)_stopProcessing
{
  [(SSRSpeakerRecognitionController *)self->_ssrController endAudio];
  [(CSAudioFileWriter *)self->_leadingUtteranceLogger endAudio];
  leadingUtteranceLogger = self->_leadingUtteranceLogger;
  if (!leadingUtteranceLogger)
  {
LABEL_17:
    if (self->_shouldCleanupVoiceProfile)
    {
      v25 = CSLogCategorySpkrId;
      if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v40 = "-[CSAttSiriSSRNode _stopProcessing]";
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s trigger VoiceProfileCleanup", buf, 0xCu);
      }
      self->_shouldCleanupVoiceProfile = 0;
      int v26 = +[SSRVoiceProfileManager sharedInstance];
      [v26 triggerVoiceProfileCleanupWithCompletion:&stru_10024EB78];
    }
    [(CSAttSiriSSRNode *)self _reportNoAudioProcessed];
    return;
  }
  self->_leadingUtteranceLogger = 0;

  voiceProfileManager = self->_voiceProfileManager;
  unsigned int v5 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
  id v6 = (SSRVoiceProfile *)[(SSRVoiceProfileManager *)voiceProfileManager newVoiceProfileWithLocale:v5 withAppDomain:SSRSpeakerRecognitionSiriCCAppDomain];
  ccProfile = self->_ccProfile;
  self->_ccProfile = v6;

  int v8 = self->_ccProfile;
  if (v8)
  {
    asset = self->_asset;
    if (asset)
    {
      v37[0] = SSRVoiceRetrainingVoiceProfileKey;
      v37[1] = SSRVoiceRetrainingPayloadProfileKey;
      v38[0] = v8;
      v38[1] = &__kCFBooleanTrue;
      v37[2] = SSRVoiceRetrainingAssetKey;
      v38[2] = asset;
      __int16 v10 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
      id v35 = 0;
      id v11 = [objc_alloc((Class)SSRVoiceProfileRetrainingContext) initWithVoiceRetrainingContext:v10 error:&v35];
      id v12 = (CSAsset *)v35;
      if (v12)
      {
        id v13 = v12;
        id v14 = (void *)CSLogCategorySpkrId;
        if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_ERROR))
        {
          v27 = self->_ccProfile;
          __int16 v28 = v14;
          v29 = [(SSRVoiceProfile *)v27 profileID];
          *(_DWORD *)buf = 136315650;
          v40 = "-[CSAttSiriSSRNode _stopProcessing]";
          __int16 v41 = 2114;
          v42 = v29;
          __int16 v43 = 2114;
          v44 = v13;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s ERR: Failed to init retrainCtxt for profileID %{public}@ with error %{public}@", buf, 0x20u);
        }
        return;
      }
      double v17 = (void *)CSLogCategorySpkrId;
      if (self->_leadingUtteranceAudioFile)
      {
        if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
        {
          double v18 = self->_ccProfile;
          uint64_t v19 = v17;
          id v20 = [(SSRVoiceProfile *)v18 profileID];
          *(_DWORD *)buf = 136315394;
          v40 = "-[CSAttSiriSSRNode _stopProcessing]";
          __int16 v41 = 2114;
          v42 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s Creating Continuous Conversation voice profile %{public}@", buf, 0x16u);
        }
        objc_initWeak((id *)buf, self);
        id v21 = self->_voiceProfileManager;
        v22 = +[NSURL fileURLWithPath:self->_leadingUtteranceAudioFile];
        v36 = v22;
        v23 = +[NSArray arrayWithObjects:&v36 count:1];
        v24 = self->_ccProfile;
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10002F1CC;
        v33[3] = &unk_1002531B8;
        objc_copyWeak(&v34, (id *)buf);
        [(SSRVoiceProfileManager *)v21 addUtterances:v23 toProfile:v24 withContext:v11 withCompletion:v33];

        objc_destroyWeak(&v34);
        objc_destroyWeak((id *)buf);
      }
      else if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_ERROR))
      {
        __int16 v30 = self->_ccProfile;
        double v31 = v17;
        __int16 v32 = [(SSRVoiceProfile *)v30 profileID];
        *(_DWORD *)buf = 136315394;
        v40 = "-[CSAttSiriSSRNode _stopProcessing]";
        __int16 v41 = 2114;
        v42 = v32;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s ERR: Failed to add utterance to profileID %{public}@ because the audio file couldn't be found", buf, 0x16u);
      }
      goto LABEL_17;
    }
  }
  id v15 = CSLogCategorySpkrId;
  if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_ERROR))
  {
    id v16 = self->_asset;
    *(_DWORD *)buf = 136315650;
    v40 = "-[CSAttSiriSSRNode _stopProcessing]";
    __int16 v41 = 2114;
    v42 = v8;
    __int16 v43 = 2114;
    v44 = v16;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s ERR: Failed to retrain voice profile %{public}@ with asset %{public}@", buf, 0x20u);
  }
}

- (id)_mapScoresToSharedSiriId:(id)a3
{
  id v4 = a3;
  if ([v4 count]) {
    uint64_t v5 = (uint64_t)[v4 count];
  }
  else {
    uint64_t v5 = 1;
  }
  v45 = +[NSMutableDictionary dictionaryWithCapacity:v5];
  id v6 = +[CSFPreferences sharedPreferences];
  v44 = [v6 readSpeakerIdScoreOverrrideConfig];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v49 objects:v61 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v50;
    *(void *)&long long v9 = 136315650;
    long long v43 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        id v14 = objc_msgSend(v7, "objectForKeyedSubscript:", v13, v43);
        [v14 floatValue];
        float v16 = v15;

        if (v16 <= 1.0) {
          float v17 = v16;
        }
        else {
          float v17 = 1.0;
        }
        if (v17 < 0.0) {
          float v17 = 0.0;
        }
        id v18 = (id)(int)vcvtpd_s64_f64(v17 * 100.0);
        uint64_t v19 = [(SSRVoiceProfileManager *)self->_voiceProfileManager voiceProfileForId:v13];
        id v20 = v19;
        if (v19)
        {
          id v21 = [v19 siriProfileId];

          if (v21)
          {
            if (CSIsInternalBuild())
            {
              if (v44)
              {
                v22 = [v20 siriProfileId];
                v23 = [v44 objectForKey:v22];

                if (v23)
                {
                  v24 = [v20 siriProfileId];
                  v25 = [v44 objectForKey:v24];

                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v18 = [v25 integerValue];
                    int v26 = (void *)CSLogCategorySpkrId;
                    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
                    {
                      v27 = v26;
                      __int16 v28 = [v20 siriProfileId];
                      *(_DWORD *)buf = v43;
                      v56 = "-[CSAttSiriSSRNode _mapScoresToSharedSiriId:]";
                      __int16 v57 = 2112;
                      v58 = v25;
                      __int16 v59 = 2112;
                      v60 = v28;
                      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s Overriding score to %@ for profile %@", buf, 0x20u);
                    }
                  }
                }
              }
            }
            v29 = +[NSNumber numberWithInteger:v18];
            __int16 v30 = [v20 siriProfileId];
            [v45 setObject:v29 forKey:v30];

            goto LABEL_31;
          }
          id v34 = CSLogCategorySpkrId;
          if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v56 = "-[CSAttSiriSSRNode _mapScoresToSharedSiriId:]";
            __int16 v57 = 2112;
            v58 = v13;
            __int16 v32 = v34;
            double v33 = "%s Siri Profile ID for profileID %@ not found";
            goto LABEL_28;
          }
        }
        else
        {
          double v31 = CSLogCategorySpkrId;
          if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v56 = "-[CSAttSiriSSRNode _mapScoresToSharedSiriId:]";
            __int16 v57 = 2112;
            v58 = v13;
            __int16 v32 = v31;
            double v33 = "%s Voice Profile for profileID %@ not found";
LABEL_28:
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 0x16u);
          }
        }
        if (CSIsTV()) {
          goto LABEL_32;
        }
        v29 = +[NSNumber numberWithInteger:v18];
        [v45 setObject:v29 forKey:v13];
LABEL_31:

LABEL_32:
      }
      id v10 = [v7 countByEnumeratingWithState:&v49 objects:v61 count:16];
    }
    while (v10);
  }

  id v35 = objc_alloc_init((Class)NSMutableDictionary);
  id v36 = objc_alloc_init((Class)NSMutableDictionary);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10002F9D4;
  v46[3] = &unk_10024EB58;
  v46[4] = self;
  id v37 = v35;
  id v47 = v37;
  id v38 = v36;
  id v48 = v38;
  [v45 enumerateKeysAndObjectsUsingBlock:v46];
  if ([v38 count])
  {
    v39 = +[AFAnalytics sharedAnalytics];
    v53[0] = @"valid_scores";
    v53[1] = @"invalid_scores";
    v54[0] = v37;
    v54[1] = v38;
    v40 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
    [v39 logEventWithType:6115 context:v40];
  }
  id v41 = [v37 copy];

  return v41;
}

- (id)_processSpeakerRecognitionResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  uint64_t v6 = kSSRSpeakerRecognitionKnownUserScoresKey;
  id v7 = [v4 objectForKeyedSubscript:kSSRSpeakerRecognitionKnownUserScoresKey];

  id v8 = [(CSAttSiriSSRNode *)self _mapScoresToSharedSiriId:v7];

  if (v8 && [v8 count])
  {
    long long v9 = CSPreMyriadVoiceTriggerMetaData;
    id v10 = +[CSUserIdentityClassifier pickTopScoringProfileIdFromScores:v8];
    if (v10)
    {
      [v5 setObject:v10 forKeyedSubscript:@"userClassified"];
    }
    else
    {
      id v13 = CSLogCategorySpkrId;
      if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_ERROR))
      {
        int v35 = 136315394;
        id v36 = "-[CSAttSiriSSRNode _processSpeakerRecognitionResult:]";
        __int16 v37 = 2114;
        *(void *)id v38 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s ERR: Failed to get classified user from %{public}@", (uint8_t *)&v35, 0x16u);
      }
    }
    uint64_t v14 = kVTEITriggeredPhId;
    float v15 = [(NSDictionary *)self->_voiceTriggerEventInfo objectForKey:kVTEITriggeredPhId];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v16 = [(NSDictionary *)self->_voiceTriggerEventInfo objectForKey:v14];
      id v17 = [v16 integerValue];

      long long v9 = CSPreMyriadVoiceTriggerMetaData;
    }
    else
    {
      id v17 = 0;
    }

    id v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [&v9[11] classifyUserIdentityFor:v10 withScores:v8 withAsset:self->_asset withPhId:v17]);
    [v5 setObject:v18 forKeyedSubscript:@"userIdentityClassification"];

    [v5 setObject:v8 forKeyedSubscript:v6];
    uint64_t v19 = +[NSNumber numberWithInteger:[(CSAsset *)self->_asset multiUserLowScoreThresholdForPhId:v17]];
    [v5 setObject:v19 forKeyedSubscript:kSSRSpeakerRecognitionLowScoreThresholdKey];

    id v20 = +[NSNumber numberWithInteger:[(CSAsset *)self->_asset multiUserHighScoreThresholdForPhId:v17]];
    [v5 setObject:v20 forKeyedSubscript:kSSRSpeakerRecognitionHighScoreThresholdKey];

    id v21 = +[NSNumber numberWithInteger:[(CSAsset *)self->_asset multiUserConfidentScoreThresholdForPhId:v17]];
    [v5 setObject:v21 forKeyedSubscript:kSSRSpeakerRecognitionConfidentScoreThresholdKey];

    v22 = +[NSNumber numberWithInteger:[(CSAsset *)self->_asset multiUserDeltaScoreThresholdForPhId:v17]];
    [v5 setObject:v22 forKeyedSubscript:kSSRSpeakerRecognitionDeltaScoreThresholdKey];

    v23 = (void *)CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = kSSRSpeakerRecognitionSegmentCounterKey;
      v25 = v23;
      int v26 = [v5 objectForKeyedSubscript:v24];
      unsigned int v27 = [v26 intValue];
      __int16 v28 = [v5 objectForKeyedSubscript:kSSRSpeakerRecognitionSegmentStartTimeKey];
      [v28 floatValue];
      double v30 = v29;
      double v31 = [v5 objectForKeyedSubscript:kSSRSpeakerRecognitionAudioProcessedDurationKey];
      unsigned int v32 = [v31 intValue];
      double v33 = [v5 objectForKeyedSubscript:v6];
      int v35 = 136316162;
      id v36 = "-[CSAttSiriSSRNode _processSpeakerRecognitionResult:]";
      __int16 v37 = 1026;
      *(_DWORD *)id v38 = v27;
      *(_WORD *)&v38[4] = 2050;
      *(double *)&v38[6] = v30;
      __int16 v39 = 1024;
      unsigned int v40 = v32;
      __int16 v41 = 2114;
      v42 = v33;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s mappedSpeakerIdInfo for {%{public}d, %{public}.2fsec %dms} - %{public}@", (uint8_t *)&v35, 0x2Cu);
    }
    id v12 = v5;
  }
  else
  {
    uint64_t v11 = CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = 136315138;
      id v36 = "-[CSAttSiriSSRNode _processSpeakerRecognitionResult:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Nil mappedSpeakerIdInfo since mappedScores is not valid, no score will be sent out", (uint8_t *)&v35, 0xCu);
    }
    id v12 = 0;
  }

  return v12;
}

- (void)_refreshSpeakerRecognitionAssets
{
  if ((CSIsIOS() & 1) != 0 || CSIsAppleSiliconMac())
  {
    assetHandler = self->_assetHandler;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003020C;
    v17[3] = &unk_100252DF0;
    v17[4] = self;
    [(CSVoiceTriggerAssetHandler *)assetHandler getVoiceTriggerAssetWithEndpointId:0 completion:v17];
    return;
  }
  if ((CSIsCommunalDevice() & 1) != 0
    || (+[CSFPreferences sharedPreferences],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 isFlexibleFollowupsSupported],
        v4,
        v5))
  {
    uint64_t v6 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
    if (CSIsCommunalDevice())
    {
      id v7 = +[SSRAssetManager sharedManager];
      id v8 = [v7 allInstalledSpeakerRecognitionAssetsForLanguage:v6];
      ssrAssets = self->_ssrAssets;
      self->_ssrAssets = v8;

      id v10 = CSLogCategorySpkrId;
      if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = self->_ssrAssets;
        *(_DWORD *)buf = 136315394;
        uint64_t v19 = "-[CSAttSiriSSRNode _refreshSpeakerRecognitionAssets]";
        __int16 v20 = 2114;
        id v21 = v11;
        id v12 = "%s Initialized SSRNode with SpeakerRecognition assets %{public}@";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0x16u);
      }
    }
    else
    {
      id v13 = +[CSAssetManager sharedManager];
      uint64_t v14 = [v13 allInstalledAssetsOfType:0 language:v6];
      float v15 = self->_ssrAssets;
      self->_ssrAssets = v14;

      id v10 = CSLogCategorySpkrId;
      if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
      {
        float v16 = self->_ssrAssets;
        *(_DWORD *)buf = 136315394;
        uint64_t v19 = "-[CSAttSiriSSRNode _refreshSpeakerRecognitionAssets]";
        __int16 v20 = 2114;
        id v21 = v16;
        id v12 = "%s Initialized SSRNode with VoiceTrigger assets %{public}@";
        goto LABEL_11;
      }
    }
  }
}

- (void)_setupSpeakerRecognitionForProfiles:(id)a3 WithVTEventInfo:(id)a4 WithLocale:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [(CSAudioRecordContext *)self->_audioRecordContext isBuiltInVoiceTriggered];
  float v12 = 4.0;
  if (v11)
  {
    if (v9)
    {
      id v13 = [v9 objectForKeyedSubscript:kVTEItriggerEndSeconds];
      [v13 floatValue];
      float v12 = v14 + 4.0;
    }
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 1;
  }
  float v16 = (void *)CSLogCategorySpkrId;
  if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
  {
    if (v11) {
      CFStringRef v17 = @"VT";
    }
    else {
      CFStringRef v17 = @"BP";
    }
    id v18 = v16;
    *(_DWORD *)buf = 136316162;
    __int16 v41 = "-[CSAttSiriSSRNode _setupSpeakerRecognitionForProfiles:WithVTEventInfo:WithLocale:]";
    __int16 v42 = 2114;
    CFStringRef v43 = v17;
    __int16 v44 = 2114;
    id v45 = v10;
    __int16 v46 = 2050;
    id v47 = [v8 count];
    __int16 v48 = 2050;
    double v49 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s Setting up SSR controller with {%{public}@, %{public}@, %{public}ldusers, %{public}fsecs}", buf, 0x34u);
  }
  if (SSRShouldUseTDTIWithAsset()) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = (uint64_t)[(CSAudioRecordContext *)self->_audioRecordContext isContinuousConversation];
  }
  v38[0] = SSRSpeakerRecognitionStyleKey;
  __int16 v20 = +[NSNumber numberWithUnsignedInteger:v15];
  v39[0] = v20;
  v39[1] = v10;
  v38[1] = SSRSpeakerRecognitionLocaleKey;
  v38[2] = SSRSpeakerRecognitionUsePayloadProfileKey;
  id v21 = +[NSNumber numberWithBool:v19];
  v39[2] = v21;
  v39[3] = v8;
  void v38[3] = SSRSpeakerRecognitionProfileArrayKey;
  v38[4] = SSRSpeakerRecognitionVTEventInfoKey;
  v23 = &__NSDictionary0__struct;
  if (v9) {
    v23 = v9;
  }
  v39[4] = v23;
  v38[5] = SSRSpeakerRecognitionMaxAudioDurationSecs;
  *(float *)&double v22 = v12;
  uint64_t v24 = +[NSNumber numberWithFloat:v22];
  v39[5] = v24;
  v39[6] = &__kCFBooleanFalse;
  v38[6] = SSRSpeakerRecognitionOSTransactionRequired;
  v38[7] = SSRSpeakerRecognitionAssetArrayKey;
  v39[7] = self->_ssrAssets;
  v25 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:8];

  id v37 = 0;
  id v26 = [objc_alloc((Class)SSRSpeakerRecognitionContext) initWithVoiceRecognitionContext:v25 error:&v37];
  id v27 = v37;
  id v28 = v27;
  if (!v26 || v27)
  {
    int v35 = (void *)CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_ERROR))
    {
      unsigned int v32 = v35;
      double v33 = [v28 localizedDescription];
      *(_DWORD *)buf = 136315394;
      __int16 v41 = "-[CSAttSiriSSRNode _setupSpeakerRecognitionForProfiles:WithVTEventInfo:WithLocale:]";
      __int16 v42 = 2112;
      CFStringRef v43 = v33;
      id v34 = "%s ERR: Failed to create SSR context with error %@";
      goto LABEL_26;
    }
LABEL_23:

    goto LABEL_24;
  }
  id v36 = 0;
  float v29 = (SSRSpeakerRecognitionController *)[objc_alloc((Class)SSRSpeakerRecognitionController) initWithContext:v26 withDelegate:self error:&v36];
  id v28 = v36;
  ssrController = self->_ssrController;
  self->_ssrController = v29;

  if (!self->_ssrController || v28)
  {
    double v31 = (void *)CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_ERROR))
    {
      unsigned int v32 = v31;
      double v33 = [v28 localizedDescription];
      *(_DWORD *)buf = 136315394;
      __int16 v41 = "-[CSAttSiriSSRNode _setupSpeakerRecognitionForProfiles:WithVTEventInfo:WithLocale:]";
      __int16 v42 = 2112;
      CFStringRef v43 = v33;
      id v34 = "%s ERR: Failed to create SSR controller with error %@";
LABEL_26:
      _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, v34, buf, 0x16u);

      goto LABEL_23;
    }
    goto LABEL_23;
  }
LABEL_24:
}

- (void)_setupLeadingUtteranceLogger
{
  ccProfile = self->_ccProfile;
  if (ccProfile)
  {
    id v4 = CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      double v30 = "-[CSAttSiriSSRNode _setupLeadingUtteranceLogger]";
      __int16 v31 = 2114;
      unsigned int v32 = ccProfile;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s magus voice profile - %{public}@", buf, 0x16u);
    }
  }
  voiceProfileManager = self->_voiceProfileManager;
  if (!voiceProfileManager || !self->_asset)
  {
    uint64_t v6 = +[SSRVoiceProfileManager sharedInstance];
    id v7 = self->_voiceProfileManager;
    self->_voiceProfileManager = v6;

    id v8 = [(NSArray *)self->_ssrAssets firstObject];
    asset = self->_asset;
    self->_asset = v8;

    id v10 = (void *)CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = self->_asset;
      float v12 = v10;
      id v13 = [(CSAsset *)v11 configVersion];
      *(_DWORD *)buf = 136315394;
      double v30 = "-[CSAttSiriSSRNode _setupLeadingUtteranceLogger]";
      __int16 v31 = 2114;
      unsigned int v32 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Asset Vers: %{public}@", buf, 0x16u);
    }
    voiceProfileManager = self->_voiceProfileManager;
  }
  uint64_t v14 = SSRSpeakerRecognitionSiriCCAppDomain;
  [(SSRVoiceProfileManager *)voiceProfileManager deleteAllVoiceProfilesForAppDomain:SSRSpeakerRecognitionSiriCCAppDomain];
  uint64_t v15 = [(SSRVoiceProfileManager *)self->_voiceProfileManager getCacheDirectoryForAppDomain:v14];
  float v16 = +[NSUUID UUID];
  CFStringRef v17 = [v16 UUIDString];
  id v18 = [v15 stringByAppendingPathComponent:v17];
  uint64_t v19 = [v18 stringByAppendingPathExtension:@"wav"];
  leadingUtteranceAudioFile = self->_leadingUtteranceAudioFile;
  self->_leadingUtteranceAudioFile = v19;

  id v21 = objc_alloc((Class)CSPlainAudioFileWriter);
  double v22 = +[NSURL URLWithString:self->_leadingUtteranceAudioFile];
  +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD];
  +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD];
  v23 = (CSAudioFileWriter *)[v21 initWithURL:v22 inputFormat:v28 outputFormat:&v27];
  leadingUtteranceLogger = self->_leadingUtteranceLogger;
  self->_leadingUtteranceLogger = v23;

  v25 = CSLogCategorySpkrId;
  if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = self->_leadingUtteranceAudioFile;
    *(_DWORD *)buf = 136315394;
    double v30 = "-[CSAttSiriSSRNode _setupLeadingUtteranceLogger]";
    __int16 v31 = 2114;
    unsigned int v32 = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s Recording leading utterance - %{public}@", buf, 0x16u);
  }
}

- (void)_setupSpeakerRecognitionForFollowUp:(id)a3 withVoiceTriggerInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SSRVoiceProfileManager *)self->_voiceProfileManager provisionedVoiceProfilesForAppDomain:SSRSpeakerRecognitionSiriCCAppDomain withLocale:v6];
  id v9 = v8;
  if (v8 && [v8 count])
  {
    [(CSAttSiriSSRNode *)self _setupSpeakerRecognitionForProfiles:v9 WithVTEventInfo:v7 WithLocale:v6];
  }
  else
  {
    id v10 = CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      float v12 = "-[CSAttSiriSSRNode _setupSpeakerRecognitionForFollowUp:withVoiceTriggerInfo:]";
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Voice Profiles not present for Continuous Conversation for %{public}@ - Bailing out", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)_setupSSRControllerWithAudioContext:(id)a3 withVoiceTriggerEventInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((CSIsCommunalDevice() & 1) != 0
    || ([v6 isContinuousConversation] & 1) != 0
    || [v6 isBuiltInVoiceTriggered])
  {
    id v8 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
    ssrAssets = self->_ssrAssets;
    if (ssrAssets)
    {
      id v10 = [(NSArray *)ssrAssets firstObject];
      asset = self->_asset;
      self->_asset = v10;

      float v12 = (void *)CSLogCategorySpkrId;
      if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = self->_asset;
        id v14 = v12;
        uint64_t v15 = [(CSAsset *)v13 configVersion];
        int v27 = 136315394;
        id v28 = "-[CSAttSiriSSRNode _setupSSRControllerWithAudioContext:withVoiceTriggerEventInfo:]";
        __int16 v29 = 2114;
        double v30 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Asset Vers: %{public}@", (uint8_t *)&v27, 0x16u);
      }
      unsigned int v16 = [v6 isContinuousConversation];
      CFStringRef v17 = +[SSRVoiceProfileManager sharedInstance];
      voiceProfileManager = self->_voiceProfileManager;
      self->_voiceProfileManager = v17;

      if ((CSIsCommunalDevice() & 1) != 0
        || ((CSIsIOS() & 1) != 0 || CSIsAppleSiliconMac())
        && (([v6 isBuiltInVoiceTriggered] & 1) != 0
         || [v6 isDarwinVoiceTriggered]))
      {
        uint64_t v19 = [(SSRVoiceProfileManager *)self->_voiceProfileManager provisionedVoiceProfilesForAppDomain:SSRSpeakerRecognitionSiriAppDomain withLocale:v8];
        __int16 v20 = v19;
        if (v19 && [v19 count])
        {
          if (CSIsCommunalDevice())
          {
            uint64_t v21 = [(CSAttSiriSSRNode *)self filteredVoiceProfileArray:v20];

            __int16 v20 = (void *)v21;
          }
          if (CSIsInternalBuild())
          {
            double v22 = [(SSRVoiceProfileManager *)self->_voiceProfileManager provisionedVoiceProfilesForAppDomain:SSRSpeakerRecognitionSiriDebugAppDomain withLocale:v8];
            if (v22)
            {
              uint64_t v23 = [v20 arrayByAddingObjectsFromArray:v22];

              __int16 v20 = (void *)v23;
            }
          }
          [(CSAttSiriSSRNode *)self _setupSpeakerRecognitionForProfiles:v20 WithVTEventInfo:v7 WithLocale:v8];
        }
        else
        {
          v25 = CSLogCategorySpkrId;
          if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
          {
            int v27 = 136315394;
            id v28 = "-[CSAttSiriSSRNode _setupSSRControllerWithAudioContext:withVoiceTriggerEventInfo:]";
            __int16 v29 = 2114;
            double v30 = v8;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s Voice Profiles not present for %{public}@ - Bailing out", (uint8_t *)&v27, 0x16u);
          }
        }
      }
      else
      {
        id v26 = CSLogCategorySpkrId;
        if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 136315394;
          id v28 = "-[CSAttSiriSSRNode _setupSSRControllerWithAudioContext:withVoiceTriggerEventInfo:]";
          __int16 v29 = 1024;
          LODWORD(v30) = v16;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s isCurReqTriggerFreeFollowOn:%u", (uint8_t *)&v27, 0x12u);
        }
        if (v16) {
          [(CSAttSiriSSRNode *)self _setupSpeakerRecognitionForFollowUp:v8 withVoiceTriggerInfo:v7];
        }
      }
    }
    else
    {
      uint64_t v24 = CSLogCategorySpkrId;
      if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 136315394;
        id v28 = "-[CSAttSiriSSRNode _setupSSRControllerWithAudioContext:withVoiceTriggerEventInfo:]";
        __int16 v29 = 2114;
        double v30 = v8;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s SSR Assets is nil for %{public}@ - Bailing out", (uint8_t *)&v27, 0x16u);
      }
    }
  }
}

- (void)handleSiriSessionEnd
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000310D4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setUpSpeakerProfileForFlexibleFollowup
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000312F4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)getSharedUserIdWithHighestVoiceIdScore:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4 && [v4 count])
  {
    if ([v5 count] == (id)1)
    {
      id v6 = [v5 firstObject];
    }
    else
    {
      uint64_t v12 = 0;
      __int16 v13 = &v12;
      uint64_t v14 = 0x3032000000;
      uint64_t v15 = sub_10002D4C8;
      unsigned int v16 = sub_10002D4D8;
      id v17 = 0;
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000314FC;
      block[3] = &unk_1002523B8;
      block[4] = self;
      id v10 = v5;
      int v11 = &v12;
      dispatch_async_and_wait(queue, block);
      id v6 = (id)v13[5];

      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)cacheSharedUserInfos:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100031740;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)filteredVoiceProfileArray:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    unsigned int v5 = +[NSPredicate predicateWithBlock:&stru_10024EB10];
    id v6 = [v4 filteredArrayUsingPredicate:v5];

    id v7 = [v6 count];
    id v8 = [v4 count];

    self->_shouldCleanupVoiceProfile = v7 < v8;
    id v9 = CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[CSAttSiriSSRNode filteredVoiceProfileArray:]";
      __int16 v13 = 2048;
      BOOL v14 = v7 < v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s _shouldCleanupVoiceProfile: %lu", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)setPrefetchedAsset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000319FC;
  v7[3] = &unk_100253B08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100031BA8;
  v7[3] = &unk_100253B08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addReceiver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100031C94;
  v7[3] = &unk_100253B08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)stop
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031E60;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)resetForNewRequestWithRecordContext:(id)a3 voiceTriggerInfo:(id)a4 withReqId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003200C;
  v15[3] = &unk_100252E18;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)_setupWithDownloadMonitor:(id)a3 assetHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (CSSpeakerRecognitionAssetDownloadMonitor *)v6;
  }
  else
  {
    id v8 = +[CSSpeakerRecognitionAssetDownloadMonitor sharedInstance];
  }
  downloadMonitor = self->_downloadMonitor;
  self->_downloadMonitor = v8;

  if (v7)
  {
    id v10 = (CSVoiceTriggerAssetHandler *)v7;
  }
  else
  {
    id v10 = +[CSVoiceTriggerAssetHandler sharedHandler];
  }
  assetHandler = self->_assetHandler;
  self->_assetHandler = v10;

  requiredNodes = self->_requiredNodes;
  self->_type = 10;
  self->_requiredNodes = (NSArray *)&off_10025E718;

  id v13 = +[NSHashTable weakObjectsHashTable];
  receivers = self->_receivers;
  self->_receivers = v13;

  self->_isReady = 0;
  uint64_t v15 = [(id)objc_opt_class() description];
  id v16 = +[CSUtils getSerialQueueWithQOS:33 name:v15 fixedPriority:kCSDefaultSerialQueueFixedPriority];
  queue = self->_queue;
  self->_queue = v16;

  [(CSSpeakerRecognitionAssetDownloadMonitor *)self->_downloadMonitor addObserver:self];
  id v18 = +[CSLanguageCodeUpdateMonitor sharedInstance];
  [v18 addObserver:self];

  uint64_t v19 = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032244;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(v19, block);
}

- (CSAttSiriSSRNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CSAttSiriSSRNode *)self init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (CSAttSiriSSRNode)initWithDownloadMonitor:(id)a3 assetHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CSAttSiriSSRNode;
  id v8 = [(CSAttSiriSSRNode *)&v11 init];
  id v9 = v8;
  if (v8) {
    [(CSAttSiriSSRNode *)v8 _setupWithDownloadMonitor:v6 assetHandler:v7];
  }

  return v9;
}

- (CSAttSiriSSRNode)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSAttSiriSSRNode;
  v2 = [(CSAttSiriSSRNode *)&v6 init];
  if (v2)
  {
    int v3 = +[CSSpeakerRecognitionAssetDownloadMonitor sharedInstance];
    id v4 = +[CSVoiceTriggerAssetHandler sharedHandler];
    [(CSAttSiriSSRNode *)v2 _setupWithDownloadMonitor:v3 assetHandler:v4];
  }
  return v2;
}

@end