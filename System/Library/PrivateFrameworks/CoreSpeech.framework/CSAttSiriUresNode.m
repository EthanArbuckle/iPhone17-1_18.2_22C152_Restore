@interface CSAttSiriUresNode
+ (float)_extractLrnnScoreForResultCandidate:(id)a3;
- (BOOL)_isSpeechRecognizerTaskSupported:(id)a3;
- (BOOL)_shouldApplyAllowListOverride:(id)a3 withInputOrigin:(id)a4;
- (BOOL)_shouldRunMitigationForContext:(id)a3;
- (BOOL)_shouldRunMitigationForRequestContext:(id)a3 forTask:(id)a4;
- (BOOL)_supportsHybridSDSD;
- (BOOL)getLastMitigationResultForRequestId:(id)a3;
- (BOOL)getMitigationDecisionForRCId:(unint64_t)a3 forRequestId:(id)a4;
- (BOOL)isMedocFeatureEnabled;
- (BOOL)isReady;
- (BOOL)supportsHybridUnderstandingOnDevice;
- (BOOL)supportsUnderstandingOnDevice;
- (CSAsset)prefetchedAsset;
- (CSAttSiriController)attSiriController;
- (CSAttSiriMitigatorDeletgate)mitigatorDelegate;
- (CSAttSiriNLDAClassifierNode)nldaClassifierNode;
- (CSAttSiriOSDNode)osdNode;
- (CSAttSiriSSRNode)ssrNode;
- (CSAttSiriSignalDataAggregatorProtocol)gazeNode;
- (CSAttSiriTCUGenerator)tcuGenerator;
- (CSAttSiriUresNode)init;
- (CSAttSiriUresNode)initWithAttSiriController:(id)a3;
- (CSAttSiriUresNode)initWithSupportsUOD:(BOOL)a3 supportsHybridUOD:(BOOL)a4 isMedocFeatureEnabled:(BOOL)a5;
- (CSOSTransaction)osTransaction;
- (NSArray)allowVocabList;
- (NSArray)requiredNodes;
- (NSArray)supportedInputOrigins;
- (NSHashTable)receivers;
- (NSMutableDictionary)requestIdToFeatsMapping;
- (NSString)configFile;
- (NSString)mhId;
- (OS_dispatch_queue)queue;
- (SLUresMitigator)mitigator;
- (id)_decodeJsonFromFile:(id)a3;
- (id)_getRequestCtxForRequestId:(id)a3;
- (id)constructTCUIntendedInfoForRequestId:(id)a3 withResultCandidate:(id)a4;
- (id)getUresInputFeaturesForRequestId:(id)a3;
- (id)getUresInvocationTypeForRequestId:(id)a3;
- (unint64_t)allowListWordCountThreshold;
- (unint64_t)type;
- (void)_createMitigatorModelWithConfig:(id)a3;
- (void)_createModelAndRunInferenceForRcId:(unint64_t)a3 withRequestContext:(id)a4 withCompletion:(id)a5;
- (void)_fetchMitigationConfigForRecordCtx:(id)a3;
- (void)_holdTransactionForUresProcessing;
- (void)_logFinalMitigationDecisionToSelf:(BOOL)a3 forMhId:(id)a4;
- (void)_logLRNNFailMsgForMhId:(id)a3;
- (void)_logLatticeRNNResults:(id)a3 forMhId:(id)a4;
- (void)_logURESEndMessageWithScore:(float)a3 threshold:(float)a4 spkrIDThreshold:(float)a5 assetVersion:(id)a6 withMhId:(id)a7;
- (void)_logURESFailureMsgInput:(unint64_t)a3 forMhId:(id)a4;
- (void)_logURESResultsForInput:(id)a3 withOutput:(id)a4 forMhId:(id)a5;
- (void)_readAllowListVocabFromFile:(id)a3;
- (void)_releaseUresProcessingTransaction;
- (void)_runLRNNOnlyMitigationForRCId:(unint64_t)a3 speechPackage:(id)a4 requestId:(id)a5 completion:(id)a6;
- (void)_storeMitigationDecision:(BOOL)a3 forRCId:(unint64_t)a4 requestContext:(id)a5;
- (void)_updateInputFeats:(id)a3 forSignalsFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)_updateSupportedInputOrigins;
- (void)addReceiver:(id)a3;
- (void)asrStartedForRequestId:(id)a3 isRecognitionModeClassic:(BOOL)a4;
- (void)attSiriNode:(id)a3 didMitigate:(BOOL)a4 withScore:(float)a5 forRequestId:(id)a6 taskType:(id)a7;
- (void)attSiriNode:(id)a3 didUpdateAttentionState:(unint64_t)a4;
- (void)attSiriNode:(id)a3 didUpdateOSDFeatures:(id)a4 withFrameDurationMs:(double)a5 withMHID:(id)a6;
- (void)attSiriNode:(id)a3 didUpdateWithSpeakerInfo:(id)a4 forReqId:(id)a5;
- (void)didReceiveAsrFeaturesWithWordCount:(unint64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 taskName:(id)a8 processedAudioDurationInMilliseconds:(int64_t)a9 fromServer:(BOOL)a10 acousticEndpointerScore:(double)a11;
- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 inputOrigin:(id)a5 speechPackage:(id)a6 duration:(double)a7 taskName:(id)a8;
- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 speechPackage:(id)a5 duration:(double)a6 metadata:(id)a7 taskName:(id)a8;
- (void)didReceiveTCUUpdateForTCUId:(id)a3 withTCUAccepted:(BOOL)a4 forRequestId:(id)a5 isFinal:(BOOL)a6;
- (void)didStartRecognitionRequest:(id)a3 successfully:(BOOL)a4 isRecognitionModeClassic:(BOOL)a5 error:(id)a6;
- (void)getUresInvocationTypeForRequestId:(id)a3 withCompletion:(id)a4;
- (void)processResultCandidate:(id)a3 forRCId:(unint64_t)a4 forTask:(id)a5 forRequestId:(id)a6 completion:(id)a7;
- (void)registerGazeNode:(id)a3;
- (void)registerNLDAClassifierNode:(id)a3;
- (void)registerOSDNode:(id)a3;
- (void)registerSSRNode:(id)a3;
- (void)registerTCUGenerator:(id)a3;
- (void)removeReceiver:(id)a3;
- (void)setASRModelRootDirectory:(id)a3;
- (void)setAllowListWordCountThreshold:(unint64_t)a3;
- (void)setAllowVocabList:(id)a3;
- (void)setAttSiriController:(id)a3;
- (void)setConfigFile:(id)a3;
- (void)setEndpointerFeatureEoS:(float)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setMhId:(id)a3;
- (void)setMitigator:(id)a3;
- (void)setMitigatorDelegate:(id)a3;
- (void)setOsTransaction:(id)a3;
- (void)setPrefetchedAsset:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
- (void)setRequestIdToFeatsMapping:(id)a3;
- (void)setRequiredNodes:(id)a3;
- (void)setSupportedInputOrigins:(id)a3;
- (void)startUresRequestWithAudioRecordContext:(id)a3 forRequestId:(id)a4 mhId:(id)a5 voiceTriggerInfo:(id)a6;
- (void)stop;
- (void)stopUresProcessingForRequest:(id)a3;
@end

@implementation CSAttSiriUresNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdToFeatsMapping, 0);
  objc_storeStrong((id *)&self->_allowVocabList, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_supportedInputOrigins, 0);
  objc_storeStrong((id *)&self->_configFile, 0);
  objc_storeStrong((id *)&self->_receivers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_mitigator, 0);
  objc_destroyWeak((id *)&self->_tcuGenerator);
  objc_destroyWeak((id *)&self->_mitigatorDelegate);
  objc_destroyWeak((id *)&self->_ssrNode);
  objc_destroyWeak((id *)&self->_nldaClassifierNode);
  objc_destroyWeak((id *)&self->_gazeNode);
  objc_destroyWeak((id *)&self->_osdNode);
  objc_storeStrong((id *)&self->_prefetchedAsset, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_storeStrong((id *)&self->_requiredNodes, 0);
  objc_destroyWeak((id *)&self->_attSiriController);
}

- (BOOL)isMedocFeatureEnabled
{
  return self->_isMedocFeatureEnabled;
}

- (BOOL)supportsHybridUnderstandingOnDevice
{
  return self->_supportsHybridUnderstandingOnDevice;
}

- (BOOL)supportsUnderstandingOnDevice
{
  return self->_supportsUnderstandingOnDevice;
}

- (void)setRequestIdToFeatsMapping:(id)a3
{
}

- (NSMutableDictionary)requestIdToFeatsMapping
{
  return self->_requestIdToFeatsMapping;
}

- (void)setAllowListWordCountThreshold:(unint64_t)a3
{
  self->_allowListWordCountThreshold = a3;
}

- (unint64_t)allowListWordCountThreshold
{
  return self->_allowListWordCountThreshold;
}

- (void)setAllowVocabList:(id)a3
{
}

- (NSArray)allowVocabList
{
  return self->_allowVocabList;
}

- (void)setOsTransaction:(id)a3
{
}

- (CSOSTransaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setSupportedInputOrigins:(id)a3
{
}

- (NSArray)supportedInputOrigins
{
  return self->_supportedInputOrigins;
}

- (void)setConfigFile:(id)a3
{
}

- (NSString)configFile
{
  return self->_configFile;
}

- (void)setReceivers:(id)a3
{
}

- (NSHashTable)receivers
{
  return self->_receivers;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setMitigator:(id)a3
{
}

- (SLUresMitigator)mitigator
{
  return self->_mitigator;
}

- (CSAttSiriTCUGenerator)tcuGenerator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tcuGenerator);
  return (CSAttSiriTCUGenerator *)WeakRetained;
}

- (void)setMitigatorDelegate:(id)a3
{
}

- (CSAttSiriMitigatorDeletgate)mitigatorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mitigatorDelegate);
  return (CSAttSiriMitigatorDeletgate *)WeakRetained;
}

- (CSAttSiriSSRNode)ssrNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ssrNode);
  return (CSAttSiriSSRNode *)WeakRetained;
}

- (CSAttSiriNLDAClassifierNode)nldaClassifierNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nldaClassifierNode);
  return (CSAttSiriNLDAClassifierNode *)WeakRetained;
}

- (CSAttSiriSignalDataAggregatorProtocol)gazeNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gazeNode);
  return (CSAttSiriSignalDataAggregatorProtocol *)WeakRetained;
}

- (CSAttSiriOSDNode)osdNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_osdNode);
  return (CSAttSiriOSDNode *)WeakRetained;
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

- (id)getUresInputFeaturesForRequestId:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_10012C0C8;
  v16 = sub_10012C0D8;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012C0E0;
  block[3] = &unk_1002523B8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)_isSpeechRecognizerTaskSupported:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:CoreEmbeddedSpeechRecognizerTaskBeto];
  }

  return v4;
}

- (void)_readAllowListVocabFromFile:(id)a3
{
  id v4 = a3;
  id v17 = 0;
  v5 = +[NSString stringWithContentsOfFile:v4 encoding:4 error:&v17];
  id v6 = v17;
  id v7 = [v5 lowercaseString];

  v8 = +[NSCharacterSet newlineCharacterSet];
  v9 = [v7 componentsSeparatedByCharactersInSet:v8];

  if (v9)
  {
    uint64_t v10 = +[NSArray array];
    allowVocabList = self->_allowVocabList;
    p_allowVocabList = (id *)&self->_allowVocabList;
    id *p_allowVocabList = (id)v10;

    objc_storeStrong(p_allowVocabList, v9);
    v13 = (void *)CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = *p_allowVocabList;
      v15 = v13;
      id v16 = [v14 count];
      *(_DWORD *)buf = 136315650;
      v19 = "-[CSAttSiriUresNode _readAllowListVocabFromFile:]";
      __int16 v20 = 2114;
      id v21 = v4;
      __int16 v22 = 2048;
      id v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Read SDSD override list from %{public}@ with %lu entries", buf, 0x20u);
    }
  }
}

- (BOOL)_shouldApplyAllowListOverride:(id)a3 withInputOrigin:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToNumber:&off_10025E230])
  {
    if (self->_allowVocabList)
    {
      id v7 = [v6 oneBestTranscript];
      v8 = [v7 lowercaseString];

      v9 = [v6 oneBestTokenList];
      if ((unint64_t)[v9 count] <= self->_allowListWordCountThreshold)
      {
        if ([(NSArray *)self->_allowVocabList containsObject:v8])
        {
          id v14 = CSLogCategorySDSD;
          if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
          {
            int v16 = 136315394;
            id v17 = "-[CSAttSiriUresNode _shouldApplyAllowListOverride:withInputOrigin:]";
            __int16 v18 = 2112;
            v19 = v8;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Found transcript (%@) match in override list, don't mitigate", (uint8_t *)&v16, 0x16u);
          }
          BOOL v13 = 1;
          goto LABEL_17;
        }
      }
      else
      {
        uint64_t v10 = CSLogCategorySDSD;
        if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO))
        {
          int v16 = 136315138;
          id v17 = "-[CSAttSiriUresNode _shouldApplyAllowListOverride:withInputOrigin:]";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Num tokens exceeds threshold, don't apply override", (uint8_t *)&v16, 0xCu);
        }
      }
      BOOL v13 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v11 = CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      id v17 = "-[CSAttSiriUresNode _shouldApplyAllowListOverride:withInputOrigin:]";
      uint64_t v12 = "%s Override vocab list not set";
      goto LABEL_10;
    }
  }
  else
  {
    v11 = CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      id v17 = "-[CSAttSiriUresNode _shouldApplyAllowListOverride:withInputOrigin:]";
      uint64_t v12 = "%s Override not applicable for non-magus inputOrigin";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v16, 0xCu);
    }
  }
  BOOL v13 = 0;
LABEL_18:

  return v13;
}

- (id)_decodeJsonFromFile:(id)a3
{
  id v3 = +[NSData dataWithContentsOfFile:a3];
  if (v3)
  {
    id v10 = 0;
    id v4 = +[NSJSONSerialization JSONObjectWithData:v3 options:0 error:&v10];
    id v5 = v10;
    if (v5)
    {
      id v6 = CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v12 = "-[CSAttSiriUresNode _decodeJsonFromFile:]";
        __int16 v13 = 2112;
        id v14 = v3;
        __int16 v15 = 2114;
        id v16 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s ERR: read metafile %@ failed with %{public}@ - defaulting to NO", buf, 0x20u);
      }
      id v7 = 0;
    }
    else
    {
      id v7 = v4;
    }
  }
  else
  {
    v8 = CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = "-[CSAttSiriUresNode _decodeJsonFromFile:]";
      __int16 v13 = 2112;
      id v14 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s ERR: metaData is nil, defaulting to NO for %@", buf, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

- (void)_updateSupportedInputOrigins
{
  supportedInputOrigins = self->_supportedInputOrigins;
  self->_supportedInputOrigins = 0;

  id v4 = [(CSAttSiriUresNode *)self _decodeJsonFromFile:self->_configFile];
  if (v4)
  {
    id v9 = v4;
    id v5 = [v4 objectForKeyedSubscript:@"supportedInputOrigins"];

    id v4 = v9;
    if (v5)
    {
      id v6 = [v9 objectForKeyedSubscript:@"supportedInputOrigins"];
      id v7 = +[NSArray arrayWithArray:v6];
      v8 = self->_supportedInputOrigins;
      self->_supportedInputOrigins = v7;

      id v4 = v9;
    }
  }
}

- (void)_updateInputFeats:(id)a3 forSignalsFrom:(unint64_t)a4 to:(unint64_t)a5
{
  id v8 = a3;
  p_gazeNode = &self->_gazeNode;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gazeNode);
  if (WeakRetained)
  {
    v11 = WeakRetained;
    p_osdNode = &self->_osdNode;
    id v13 = objc_loadWeakRetained((id *)p_osdNode);

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)p_gazeNode);
      id v15 = [v14 hadSignalsFrom:a4 to:a5];

      [v8 setDidDetectGazeAtOrb:v15];
      id v16 = objc_loadWeakRetained((id *)p_osdNode);
      unsigned int v17 = [v16 hadSignalsFrom:a4 to:a5];

      [v8 setDidDetectVisualActivity:v15];
      __int16 v18 = CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315650;
        __int16 v20 = "-[CSAttSiriUresNode _updateInputFeats:forSignalsFrom:to:]";
        __int16 v21 = 1024;
        int v22 = (int)v15;
        __int16 v23 = 1024;
        unsigned int v24 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s Updated gaze signal to %i and visual speech signal to %i", (uint8_t *)&v19, 0x18u);
      }
    }
  }
}

- (BOOL)_shouldRunMitigationForContext:(id)a3
{
  id v3 = a3;
  BOOL v4 = (CSIsCommunalDevice() & 1) == 0 && !CSIsWatch()
    || ([v3 isUIButtonPress] & 1) == 0
    && ([v3 isHomePressed] & 1) == 0
    && ([v3 isRemoraButtonPress] & 1) == 0
    && ([v3 isHearstDoubleTapTriggered] & 1) == 0;

  return v4;
}

- (void)_releaseUresProcessingTransaction
{
  osTransaction = self->_osTransaction;
  BOOL v4 = CSLogCategorySDSD;
  BOOL v5 = os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO);
  if (osTransaction)
  {
    if (v5)
    {
      int v6 = 136315138;
      id v7 = "-[CSAttSiriUresNode _releaseUresProcessingTransaction]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s OS transaction released after UReS inference", (uint8_t *)&v6, 0xCu);
      osTransaction = self->_osTransaction;
    }
    self->_osTransaction = 0;
  }
  else if (v5)
  {
    int v6 = 136315138;
    id v7 = "-[CSAttSiriUresNode _releaseUresProcessingTransaction]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s osTransaction already released", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_holdTransactionForUresProcessing
{
  if (!self->_osTransaction)
  {
    id v3 = +[NSString stringWithFormat:@"Ures ID - %@", self->_mhId];
    BOOL v4 = (CSOSTransaction *)[objc_alloc((Class)CSOSTransaction) initWithDescription:v3];
    osTransaction = self->_osTransaction;
    self->_osTransaction = v4;
  }
  int v6 = CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[CSAttSiriUresNode _holdTransactionForUresProcessing]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s OS transaction obtained for UReS inference", buf, 0xCu);
  }
}

- (void)didReceiveTCUUpdateForTCUId:(id)a3 withTCUAccepted:(BOOL)a4 forRequestId:(id)a5 isFinal:(BOOL)a6
{
  id v9 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012CCC8;
  block[3] = &unk_1002522D0;
  BOOL v15 = a4;
  BOOL v16 = a6;
  id v13 = v9;
  id v14 = self;
  id v11 = v9;
  dispatch_async(queue, block);
}

- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 speechPackage:(id)a5 duration:(double)a6 metadata:(id)a7 taskName:(id)a8
{
}

- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 inputOrigin:(id)a5 speechPackage:(id)a6 duration:(double)a7 taskName:(id)a8
{
}

- (void)didStartRecognitionRequest:(id)a3 successfully:(BOOL)a4 isRecognitionModeClassic:(BOOL)a5 error:(id)a6
{
  if (a4) {
    [(CSAttSiriUresNode *)self asrStartedForRequestId:a3 isRecognitionModeClassic:a5];
  }
}

- (id)constructTCUIntendedInfoForRequestId:(id)a3 withResultCandidate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[CSUtils isTCUSupported])
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = sub_10012C0C8;
    v34 = sub_10012C0D8;
    id v35 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = sub_10012C0C8;
    v28[4] = sub_10012C0D8;
    id v29 = 0;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10012D158;
    block[3] = &unk_100252280;
    id v9 = v6;
    id v21 = v9;
    int v22 = self;
    id v10 = v7;
    id v23 = v10;
    unsigned int v24 = v28;
    v25 = v27;
    v26 = &v30;
    dispatch_sync(queue, block);
    id v11 = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10012D780;
    v14[3] = &unk_1002522A8;
    __int16 v18 = v28;
    id v15 = v9;
    BOOL v16 = self;
    int v19 = v27;
    id v17 = v10;
    dispatch_async(v11, v14);
    id v12 = (id)v31[5];

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v28, 8);

    _Block_object_dispose(&v30, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)attSiriNode:(id)a3 didUpdateWithSpeakerInfo:(id)a4 forReqId:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012DF00;
  block[3] = &unk_100253540;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(queue, block);
}

- (void)attSiriNode:(id)a3 didUpdateOSDFeatures:(id)a4 withFrameDurationMs:(double)a5 withMHID:(id)a6
{
  id v8 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012E568;
  block[3] = &unk_1002532A8;
  void block[4] = self;
  id v12 = v8;
  double v13 = a5;
  id v10 = v8;
  dispatch_async(queue, block);
}

- (void)attSiriNode:(id)a3 didMitigate:(BOOL)a4 withScore:(float)a5 forRequestId:(id)a6 taskType:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10012E89C;
  v15[3] = &unk_100252258;
  float v19 = a5;
  id v16 = v10;
  id v17 = v11;
  __int16 v18 = self;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)attSiriNode:(id)a3 didUpdateAttentionState:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10012EDDC;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)didReceiveAsrFeaturesWithWordCount:(unint64_t)a3 trailingSilenceDuration:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 taskName:(id)a8 processedAudioDurationInMilliseconds:(int64_t)a9 fromServer:(BOOL)a10 acousticEndpointerScore:(double)a11
{
  *(float *)&a5 = a5;
  -[CSAttSiriUresNode setEndpointerFeatureEoS:](self, "setEndpointerFeatureEoS:", a3, a4, a6, a8, a9, a10, a5, a7, a11);
}

- (void)_createMitigatorModelWithConfig:(id)a3
{
  id v4 = a3;
  if (self->_mitigator)
  {
    BOOL v5 = CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[CSAttSiriUresNode _createMitigatorModelWithConfig:]";
      id v6 = "%s Reusing existing mitigator instance";
      id v7 = v5;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  id v14 = 0;
  id v8 = (SLUresMitigator *)[objc_alloc((Class)SLUresMitigator) initWithConfig:v4 error:&v14];
  id v9 = v14;
  mitigator = self->_mitigator;
  self->_mitigator = v8;

  id v11 = CSLogCategorySDSD;
  if (self->_mitigator && !v9)
  {
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[CSAttSiriUresNode _createMitigatorModelWithConfig:]";
      id v6 = "%s Created URES Mitigator !";
      id v7 = v11;
      goto LABEL_8;
    }
LABEL_9:
    [(CSAttSiriUresNode *)self _holdTransactionForUresProcessing];
    goto LABEL_10;
  }
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
  {
    id v12 = v11;
    id v13 = [v9 localizedDescription];
    *(_DWORD *)buf = 136315394;
    id v16 = "-[CSAttSiriUresNode _createMitigatorModelWithConfig:]";
    __int16 v17 = 2114;
    __int16 v18 = v13;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Unable to create Ures mitigator with err: %{public}@", buf, 0x16u);
  }
LABEL_10:
}

- (void)setEndpointerFeatureEoS:(float)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10012F254;
  v4[3] = &unk_1002533A8;
  v4[4] = self;
  float v5 = a3;
  dispatch_async(queue, v4);
}

- (void)_runLRNNOnlyMitigationForRCId:(unint64_t)a3 speechPackage:(id)a4 requestId:(id)a5 completion:(id)a6
{
  id v10 = (void (**)(id, BOOL))a6;
  requestIdToFeatsMapping = self->_requestIdToFeatsMapping;
  id v12 = a4;
  id v13 = [(NSMutableDictionary *)requestIdToFeatsMapping objectForKeyedSubscript:a5];
  id v14 = [v12 latticeMitigatorResult];
  [v14 score];
  float v16 = v15;
  double v17 = v15;

  __int16 v18 = [v12 latticeMitigatorResult];

  [v18 threshold];
  float v20 = v19;
  double v21 = v19;

  int v22 = CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 136315394;
    id v35 = "-[CSAttSiriUresNode _runLRNNOnlyMitigationForRCId:speechPackage:requestId:completion:]";
    __int16 v36 = 1024;
    LODWORD(v37) = v16 < v20;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s shouldMitigate = %d", (uint8_t *)&v34, 0x12u);
  }
  if (v16 >= v20) {
    id v23 = @"requestNotMitigated";
  }
  else {
    id v23 = @"requestMitigated";
  }
  [(CSAttSiriUresNode *)self _storeMitigationDecision:v16 < v20 forRCId:a3 requestContext:v13];
  unsigned int v24 = [v13 mhId];
  LODWORD(v25) = -1.0;
  *(float *)&double v26 = v16;
  *(float *)&double v27 = v20;
  [(CSAttSiriUresNode *)self _logURESEndMessageWithScore:@"16.1.1" threshold:v24 spkrIDThreshold:v26 assetVersion:v27 withMhId:v25];

  v28 = v23;
  v40[0] = @"score";
  id v29 = +[NSNumber numberWithDouble:v17];
  v41[0] = v29;
  v41[1] = v28;
  v40[1] = @"decision";
  v40[2] = @"decisionValue";
  uint64_t v30 = +[NSNumber numberWithBool:v16 < v20];
  v41[2] = v30;
  v40[3] = @"threshold";
  v31 = +[NSNumber numberWithDouble:v21];
  v40[4] = @"assetVersion";
  v41[3] = v31;
  v41[4] = @"16.1.1";
  uint64_t v32 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:5];

  v33 = CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 136315650;
    id v35 = "-[CSAttSiriUresNode _runLRNNOnlyMitigationForRCId:speechPackage:requestId:completion:]";
    __int16 v36 = 2114;
    v37 = v32;
    __int16 v38 = 2050;
    unint64_t v39 = a3;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s Final mitigation result: %{public}@ for RCId: %{public}lu", (uint8_t *)&v34, 0x20u);
  }
  if (v10) {
    v10[2](v10, v16 < v20);
  }
}

- (void)processResultCandidate:(id)a3 forRCId:(unint64_t)a4 forTask:(id)a5 forRequestId:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  queue = self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10012F8F8;
  v21[3] = &unk_100252230;
  v21[4] = self;
  id v22 = v14;
  id v25 = v15;
  unint64_t v26 = a4;
  id v23 = v13;
  id v24 = v12;
  id v17 = v12;
  id v18 = v13;
  id v19 = v15;
  id v20 = v14;
  dispatch_async(queue, v21);
}

- (BOOL)_supportsHybridSDSD
{
  return !self->_supportsUnderstandingOnDevice && self->_supportsHybridUnderstandingOnDevice;
}

- (BOOL)_shouldRunMitigationForRequestContext:(id)a3 forTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 recordCtx];
  unsigned __int8 v9 = [(CSAttSiriUresNode *)self _shouldRunMitigationForContext:v8];

  if (v9)
  {
    id v10 = [v6 inputFeats];
    id v11 = v10;
    if (v10
      && ([v10 inputOrigin], id v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
    {
      supportedInputOrigins = self->_supportedInputOrigins;
      if (supportedInputOrigins
        && ([v11 inputOrigin],
            id v14 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v15 = [(NSArray *)supportedInputOrigins containsObject:v14],
            v14,
            (v15 & 1) == 0))
      {
        unint64_t v26 = (void *)CSLogCategorySDSD;
        if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
        {
          id v29 = v26;
          uint64_t v30 = [v11 inputOrigin];
          int v31 = 136315394;
          uint64_t v32 = "-[CSAttSiriUresNode _shouldRunMitigationForRequestContext:forTask:]";
          __int16 v33 = 2114;
          id v34 = v30;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s UReS not supported for inputOrigin: %{public}@, abort", (uint8_t *)&v31, 0x16u);
        }
        double v21 = [v6 mhId];
        id v22 = self;
        uint64_t v23 = 1906;
      }
      else
      {
        if ([(CSAttSiriUresNode *)self _isSpeechRecognizerTaskSupported:v7])
        {
          BOOL v16 = 1;
LABEL_14:

          goto LABEL_15;
        }
        id v25 = CSLogCategorySDSD;
        if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
        {
          int v31 = 136315394;
          uint64_t v32 = "-[CSAttSiriUresNode _shouldRunMitigationForRequestContext:forTask:]";
          __int16 v33 = 2114;
          id v34 = v7;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s Recognizer task: %{public}@ isn't support, don't run URES mitigator", (uint8_t *)&v31, 0x16u);
        }
        double v21 = [v6 mhId];
        id v22 = self;
        uint64_t v23 = 1905;
      }
    }
    else
    {
      id v20 = (void *)CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
      {
        double v27 = v20;
        v28 = [v11 inputOrigin];
        int v31 = 136315394;
        uint64_t v32 = "-[CSAttSiriUresNode _shouldRunMitigationForRequestContext:forTask:]";
        __int16 v33 = 2114;
        id v34 = v28;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s Unable to get all required inputs for decision - (inputOrigin: %{public}@), abort", (uint8_t *)&v31, 0x16u);
      }
      double v21 = [v6 mhId];
      id v22 = self;
      uint64_t v23 = 1901;
    }
    [(CSAttSiriUresNode *)v22 _logURESFailureMsgInput:v23 forMhId:v21];

    BOOL v16 = 0;
    goto LABEL_14;
  }
  id v17 = (void *)CSLogCategorySDSD;
  BOOL v16 = 0;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = v17;
    id v19 = [v6 recordCtx];
    int v31 = 136315394;
    uint64_t v32 = "-[CSAttSiriUresNode _shouldRunMitigationForRequestContext:forTask:]";
    __int16 v33 = 2114;
    id v34 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s Mitigation not supported for ctx: %{public}@", (uint8_t *)&v31, 0x16u);

    BOOL v16 = 0;
  }
LABEL_15:

  return v16;
}

- (void)_createModelAndRunInferenceForRcId:(unint64_t)a3 withRequestContext:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(CSAttSiriUresNode *)self _createMitigatorModelWithConfig:self->_configFile];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_10012C0C8;
  v19[4] = sub_10012C0D8;
  id v20 = 0;
  if (self->_mitigator)
  {
    id v10 = CSLogCategorySDSD;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v8 mhId];
      *(_DWORD *)buf = 136315650;
      id v22 = "-[CSAttSiriUresNode _createModelAndRunInferenceForRcId:withRequestContext:withCompletion:]";
      __int16 v23 = 2112;
      id v24 = v11;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s request-MHID:%@ requestCtx:%@", buf, 0x20u);
    }
    mitigator = self->_mitigator;
    id v13 = [v8 inputFeats];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001305B8;
    v14[3] = &unk_100252208;
    id v17 = v19;
    id v16 = v9;
    void v14[4] = self;
    unint64_t v18 = a3;
    id v15 = v8;
    [(SLUresMitigator *)mitigator processInputFeats:v13 completion:v14];
  }
  else
  {
    [(CSAttSiriUresNode *)self _storeMitigationDecision:0 forRCId:a3 requestContext:v8];
    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
  _Block_object_dispose(v19, 8);
}

- (void)_storeMitigationDecision:(BOOL)a3 forRCId:(unint64_t)a4 requestContext:(id)a5
{
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = [v7 mitigationDecisions];
  id v9 = +[NSNumber numberWithUnsignedInteger:a4];
  id v10 = [v8 objectForKey:v9];

  if (v10)
  {
    id v11 = CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      id v16 = "-[CSAttSiriUresNode _storeMitigationDecision:forRCId:requestContext:]";
      __int16 v17 = 2050;
      unint64_t v18 = a4;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Replacing already made decision for RCId: %{public}lu", (uint8_t *)&v15, 0x16u);
    }
  }
  id v12 = [v7 mitigationDecisions];
  id v13 = +[NSNumber numberWithBool:v6];
  id v14 = +[NSNumber numberWithUnsignedInteger:a4];
  [v12 setObject:v13 forKey:v14];

  [v7 setShouldUpdateMitigationResult:1];
}

- (void)_logURESFailureMsgInput:(unint64_t)a3 forMhId:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)SISchemaUUID);
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:v5];

  id v13 = [v6 initWithNSUUID:v7];
  id v8 = objc_alloc_init((Class)MHSchemaMHUnintendedResponseSuppressionFailed);
  [v8 setErrorCode:a3];
  id v9 = objc_alloc_init((Class)MHSchemaMHUnintendedResponseSuppressionEvaluationContext);
  [v9 setFailed:v8];
  id v10 = objc_alloc_init((Class)MHSchemaMHClientEventMetadata);
  [v10 setMhId:v13];
  id v11 = objc_alloc_init((Class)MHSchemaMHClientEvent);
  [v11 setMhId:v13];
  [v11 setEventMetadata:v10];
  [v11 setUnintendedResponseSuppressionExecutionContext:v9];
  id v12 = +[AssistantSiriAnalytics sharedStream];
  [v12 emitMessage:v11];
}

- (void)_logURESResultsForInput:(id)a3 withOutput:(id)a4 forMhId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v45 = self;
    id v11 = objc_alloc((Class)SISchemaUUID);
    id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:v10];
    id v13 = [v11 initWithNSUUID:v12];

    id v14 = objc_alloc_init((Class)MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated);
    int v15 = [v8 acousticFTMScores];
    [v15 floatValue];
    objc_msgSend(v14, "setScore:");

    id v16 = [v8 speechPackage];
    id v17 = [v16 latticeMitigatorResult];

    id v44 = v8;
    if (v17)
    {
      id v17 = objc_alloc_init((Class)MHSchemaMHLatticeFalseTriggerMitigationEnded);
      unint64_t v18 = [v8 speechPackage];
      id v19 = [v18 latticeMitigatorResult];
      [v19 score];
      objc_msgSend(v17, "setScore:");
    }
    id v20 = objc_alloc_init((Class)MHSchemaMHUnintendedResponseSuppressionStarted);
    double v21 = [v9 extractedFeats];
    id v22 = [v21 objectForKeyedSubscript:@"numAsrRecords"];
    objc_msgSend(v20, "setNumAsrRecords:", objc_msgSend(v22, "unsignedIntValue"));

    __int16 v23 = [v9 extractedFeats];
    id v24 = [v23 objectForKeyedSubscript:@"numTokensTopPath"];
    objc_msgSend(v20, "setNumTokensTopPath:", objc_msgSend(v24, "unsignedIntValue"));

    __int16 v25 = [v9 extractedFeats];
    id v26 = [v25 objectForKeyedSubscript:@"trailingSilenceDuration"];
    [v26 floatValue];
    objc_msgSend(v20, "setTrailingSilenceDurationInNs:", +[CSFTimeUtils secondsToNs:](CSFTimeUtils, "secondsToNs:"));

    double v27 = v14;
    [v20 setAftmScore:v14];
    if (v17) {
      [v20 setLrnnScore:v17];
    }
    id v28 = objc_alloc_init((Class)MHSchemaMHUnintendedResponseSuppressionEvaluationContext);
    [v28 setStartedOrChanged:v20];
    id v29 = objc_alloc_init((Class)MHSchemaMHClientEventMetadata);
    [v29 setMhId:v13];
    id v30 = objc_alloc_init((Class)MHSchemaMHClientEvent);
    [v30 setMhId:v13];
    [v30 setEventMetadata:v29];
    [v30 setUnintendedResponseSuppressionExecutionContext:v28];
    +[AssistantSiriAnalytics sharedStream];
    uint64_t v32 = v31 = v13;
    [v32 emitMessage:v30];

    [v9 score];
    int v34 = v33;
    [v9 threshold];
    int v36 = v35;
    [v9 speakerIDThreshold];
    int v38 = v37;
    unint64_t v39 = [v9 assetVersion];
    LODWORD(v40) = v34;
    LODWORD(v41) = v36;
    LODWORD(v42) = v38;
    [(CSAttSiriUresNode *)v45 _logURESEndMessageWithScore:v39 threshold:v10 spkrIDThreshold:v40 assetVersion:v41 withMhId:v42];

    id v8 = v44;
  }
  else
  {
    v43 = CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[CSAttSiriUresNode _logURESResultsForInput:withOutput:forMhId:]";
      _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%s MHID not set, skipping SELF Logging", buf, 0xCu);
    }
  }
}

- (void)_logURESEndMessageWithScore:(float)a3 threshold:(float)a4 spkrIDThreshold:(float)a5 assetVersion:(id)a6 withMhId:(id)a7
{
  id v11 = a6;
  id v12 = a7;
  if (v12)
  {
    id v13 = objc_alloc((Class)SISchemaUUID);
    id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:v12];
    id v15 = [v13 initWithNSUUID:v14];

    id v16 = objc_alloc_init((Class)MHSchemaMHUnintendedResponseSuppressionEnded);
    [v16 setModelVersion:v11];
    *(float *)&double v17 = a3;
    [v16 setScore:v17];
    *(float *)&double v18 = a4;
    [v16 setThreshold:v18];
    *(float *)&double v19 = a5;
    [v16 setSpeakerIDThreshold:v19];
    id v20 = objc_alloc_init((Class)MHSchemaMHUnintendedResponseSuppressionEvaluationContext);
    [v20 setEnded:v16];
    id v21 = objc_alloc_init((Class)MHSchemaMHClientEventMetadata);
    [v21 setMhId:v15];
    id v22 = objc_alloc_init((Class)MHSchemaMHClientEvent);
    [v22 setMhId:v15];
    [v22 setUnintendedResponseSuppressionExecutionContext:v20];
    [v22 setEventMetadata:v21];
    __int16 v23 = +[AssistantSiriAnalytics sharedStream];
    [v23 emitMessage:v22];

    id v24 = CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136315394;
      double v27 = "-[CSAttSiriUresNode _logURESEndMessageWithScore:threshold:spkrIDThreshold:assetVersion:withMhId:]";
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s Submit URES SELF metrics for MH ID: %@", (uint8_t *)&v26, 0x16u);
    }
  }
  else
  {
    __int16 v25 = CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
    {
      int v26 = 136315138;
      double v27 = "-[CSAttSiriUresNode _logURESEndMessageWithScore:threshold:spkrIDThreshold:assetVersion:withMhId:]";
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s MHID not set, skipping SELF Logging", (uint8_t *)&v26, 0xCu);
    }
  }
}

- (void)_logLRNNFailMsgForMhId:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)SISchemaUUID);
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];

  id v11 = [v4 initWithNSUUID:v5];
  id v6 = objc_alloc_init((Class)MHSchemaMHLatticeFalseTriggerMitigationFailed);
  [v6 setErrorCode:1904];
  id v7 = objc_alloc_init((Class)MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext);
  [v7 setFailed:v6];
  id v8 = objc_alloc_init((Class)MHSchemaMHClientEventMetadata);
  [v8 setMhId:v11];
  id v9 = objc_alloc_init((Class)MHSchemaMHClientEvent);
  [v9 setMhId:v11];
  [v9 setEventMetadata:v8];
  [v9 setLatticeFalseTriggerMitigationEvaluationContext:v7];
  id v10 = +[AssistantSiriAnalytics sharedStream];
  [v10 emitMessage:v9];
}

- (void)_logLatticeRNNResults:(id)a3 forMhId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc((Class)SISchemaUUID);
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
    id v9 = [v7 initWithNSUUID:v8];

    id v10 = objc_alloc_init((Class)MHSchemaMHLatticeFalseTriggerMitigationStarted);
    id v11 = [v5 version];
    [v10 setModelVersion:v11];

    id v12 = objc_alloc_init((Class)MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext);
    [v12 setStartedOrChanged:v10];
    id v13 = objc_alloc_init((Class)MHSchemaMHClientEventMetadata);
    [v13 setMhId:v9];
    id v14 = objc_alloc_init((Class)MHSchemaMHClientEvent);
    [v14 setMhId:v9];
    [v14 setEventMetadata:v13];
    [v14 setLatticeFalseTriggerMitigationEvaluationContext:v12];
    id v15 = +[AssistantSiriAnalytics sharedStream];
    [v15 emitMessage:v14];

    id v16 = objc_alloc_init((Class)MHSchemaMHLatticeFalseTriggerMitigationEnded);
    [v5 score];
    objc_msgSend(v16, "setScore:");
    [v5 threshold];
    objc_msgSend(v16, "setThreshold:");
    id v17 = objc_alloc_init((Class)MHSchemaMHLatticeFalseTriggerMitigationEvaluationContext);

    [v17 setEnded:v16];
    id v18 = objc_alloc_init((Class)MHSchemaMHClientEventMetadata);

    [v18 setMhId:v9];
    id v19 = objc_alloc_init((Class)MHSchemaMHClientEvent);

    [v19 setMhId:v9];
    [v19 setEventMetadata:v18];
    [v19 setLatticeFalseTriggerMitigationEvaluationContext:v17];
    id v20 = +[AssistantSiriAnalytics sharedStream];
    [v20 emitMessage:v19];

    id v21 = CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315394;
      id v24 = "-[CSAttSiriUresNode _logLatticeRNNResults:forMhId:]";
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s Submit LRNN SELF metrics for MH ID: %@", (uint8_t *)&v23, 0x16u);
    }
  }
  else
  {
    id v22 = CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136315138;
      id v24 = "-[CSAttSiriUresNode _logLatticeRNNResults:forMhId:]";
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s MHID not set, skipping SELF Logging", (uint8_t *)&v23, 0xCu);
    }
  }
}

- (void)_logFinalMitigationDecisionToSelf:(BOOL)a3 forMhId:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (v5)
  {
    id v6 = objc_alloc_init((Class)MHSchemaMHMitigationDecisionRecommended);
    [v6 setIsMitigationRecommended:v4];
    id v7 = objc_alloc((Class)SISchemaUUID);
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:v5];
    id v9 = [v7 initWithNSUUID:v8];

    id v10 = objc_alloc_init((Class)MHSchemaMHClientEventMetadata);
    [v10 setMhId:v9];
    id v11 = objc_alloc_init((Class)MHSchemaMHClientEvent);
    [v11 setEventMetadata:v10];
    [v11 setFinalMitigationRecommendation:v6];
    id v12 = +[AssistantSiriAnalytics sharedStream];
    [v12 emitMessage:v11];

    id v13 = CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      id v16 = "-[CSAttSiriUresNode _logFinalMitigationDecisionToSelf:forMhId:]";
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Submit Final mitigation decision to SELF metrics for MH ID: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    id v14 = CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      id v16 = "-[CSAttSiriUresNode _logFinalMitigationDecisionToSelf:forMhId:]";
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s MHID not set, skipping SELF Logging", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (BOOL)getMitigationDecisionForRCId:(unint64_t)a3 forRequestId:(id)a4
{
  id v6 = a4;
  uint64_t v26 = 0;
  double v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  id v7 = CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v31 = "-[CSAttSiriUresNode getMitigationDecisionForRCId:forRequestId:]";
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s requestId: %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100131B0C;
  block[3] = &unk_1002521E0;
  void block[4] = self;
  id v9 = v6;
  id v24 = &v26;
  unint64_t v25 = a3;
  id v23 = v9;
  dispatch_sync(queue, block);
  id v10 = self->_queue;
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_100131D6C;
  __int16 v17 = &unk_1002521E0;
  id v18 = self;
  id v11 = v9;
  id v20 = &v26;
  unint64_t v21 = a3;
  id v19 = v11;
  dispatch_async(v10, &v14);
  -[CSAttSiriUresNode stopUresProcessingForRequest:](self, "stopUresProcessingForRequest:", v11, v14, v15, v16, v17, v18);
  BOOL v12 = *((unsigned char *)v27 + 24) != 0;

  _Block_object_dispose(&v26, 8);
  return v12;
}

- (BOOL)getLastMitigationResultForRequestId:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100132124;
  block[3] = &unk_1002523B8;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (void)setASRModelRootDirectory:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100132480;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)stopUresProcessingForRequest:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100132674;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_fetchMitigationConfigForRecordCtx:(id)a3
{
  id v4 = a3;
  prefetchedAsset = self->_prefetchedAsset;
  if (prefetchedAsset)
  {
    id v6 = [(CSAsset *)prefetchedAsset allowKeywordsFile];
    [(CSAttSiriUresNode *)self _readAllowListVocabFromFile:v6];

    id v7 = (NSString *)[(CSAsset *)self->_prefetchedAsset allowListWordCountThreshold];
    self->_allowListWordCountThreshold = (unint64_t)v7;
    id v8 = CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315394;
      id v18 = "-[CSAttSiriUresNode _fetchMitigationConfigForRecordCtx:]";
      __int16 v19 = 2048;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s _allowListWordCountThreshold:%lu", (uint8_t *)&v17, 0x16u);
    }
    id v9 = [(CSAsset *)self->_prefetchedAsset getCategoryKeyWithRecordCtx:v4];
    id v10 = [(CSAsset *)self->_prefetchedAsset mitigationConfigFileForCategory:v9];
    uint64_t v11 = +[NSFileManager defaultManager];
    unsigned int v12 = [v11 fileExistsAtPath:v10];

    if (v12)
    {
      objc_storeStrong((id *)&self->_configFile, v10);
      uint64_t v13 = CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
      {
        configFile = self->_configFile;
        int v17 = 136315394;
        id v18 = "-[CSAttSiriUresNode _fetchMitigationConfigForRecordCtx:]";
        __int16 v19 = 2114;
        id v20 = configFile;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Use config file at : %{public}@", (uint8_t *)&v17, 0x16u);
      }
      [(CSAttSiriUresNode *)self _updateSupportedInputOrigins];
    }
    else
    {
      id v16 = CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315394;
        id v18 = "-[CSAttSiriUresNode _fetchMitigationConfigForRecordCtx:]";
        __int16 v19 = 2114;
        id v20 = (NSString *)v10;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s Mitigation file doesn't exist at %{public}@, don't use Siri Assets for mitigation", (uint8_t *)&v17, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v15 = CSLogCategorySDSD;
    if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      id v18 = "-[CSAttSiriUresNode _fetchMitigationConfigForRecordCtx:]";
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Prefetched asset not set", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)asrStartedForRequestId:(id)a3 isRecognitionModeClassic:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100132ACC;
  block[3] = &unk_1002537C0;
  BOOL v12 = a4;
  id v10 = v6;
  uint64_t v11 = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)startUresRequestWithAudioRecordContext:(id)a3 forRequestId:(id)a4 mhId:(id)a5 voiceTriggerInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100132E8C;
  block[3] = &unk_100252BE8;
  id v20 = v11;
  id v21 = v12;
  id v22 = v10;
  id v23 = v13;
  id v24 = self;
  id v15 = v13;
  id v16 = v10;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(queue, block);
}

- (void)getUresInvocationTypeForRequestId:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100133638;
  block[3] = &unk_100253280;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (id)getUresInvocationTypeForRequestId:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10012C0C8;
  id v16 = sub_10012C0D8;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100133870;
  block[3] = &unk_1002523B8;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_getRequestCtxForRequestId:(id)a3
{
  requestIdToFeatsMapping = self->_requestIdToFeatsMapping;
  if (a3)
  {
    id v4 = -[NSMutableDictionary objectForKeyedSubscript:](requestIdToFeatsMapping, "objectForKeyedSubscript:");
  }
  else
  {
    id v5 = [(NSMutableDictionary *)requestIdToFeatsMapping allValues];
    id v4 = [v5 firstObject];
  }
  return v4;
}

- (void)setPrefetchedAsset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100133A84;
  v7[3] = &unk_100253B08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeReceiver:(id)a3
{
}

- (void)addReceiver:(id)a3
{
  id v4 = a3;
  if (![(NSHashTable *)self->_receivers containsObject:v4])
  {
    if ([v4 conformsToProtocol:&OBJC_PROTOCOL___CSAttSiriUresNodeDelegate])
    {
      [(NSHashTable *)self->_receivers addObject:v4];
    }
    else
    {
      id v5 = CSLogCategorySDSD;
      if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315394;
        id v7 = "-[CSAttSiriUresNode addReceiver:]";
        __int16 v8 = 2112;
        id v9 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Unsupported receiver: %@", (uint8_t *)&v6, 0x16u);
      }
    }
  }
}

- (void)registerTCUGenerator:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100133D04;
  v7[3] = &unk_100253B08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)registerSSRNode:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100133DA8;
  v7[3] = &unk_100253B08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)registerNLDAClassifierNode:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100133E4C;
  v7[3] = &unk_100253B08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)registerGazeNode:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100133EF0;
  v7[3] = &unk_100253B08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)registerOSDNode:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100133F94;
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
  block[2] = sub_100134014;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (CSAttSiriUresNode)initWithSupportsUOD:(BOOL)a3 supportsHybridUOD:(BOOL)a4 isMedocFeatureEnabled:(BOOL)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CSAttSiriUresNode;
  id v8 = [(CSAttSiriUresNode *)&v21 init];
  id v9 = v8;
  if (!v8) {
    return v9;
  }
  v8->_type = 8;
  v8->_supportsUnderstandingOnDevice = v7;
  v8->_supportsHybridUnderstandingOnDevice = v6;
  v8->_isMedocFeatureEnabled = a5;
  if (v7)
  {
    requiredNodes = v8->_requiredNodes;
    id v11 = (NSArray *)&off_10025E808;
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    requiredNodes = v8->_requiredNodes;
    id v11 = (NSArray *)&off_10025E820;
  }
  v8->_requiredNodes = v11;

LABEL_7:
  v9->_isReady = 0;
  uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v13 = dispatch_queue_create("CSAttSiriUresNode queue", v12);
  queue = v9->_queue;
  v9->_queue = (OS_dispatch_queue *)v13;

  uint64_t v15 = +[NSHashTable weakObjectsHashTable];
  receivers = v9->_receivers;
  v9->_receivers = (NSHashTable *)v15;

  uint64_t v17 = +[NSMutableDictionary dictionary];
  requestIdToFeatsMapping = v9->_requestIdToFeatsMapping;
  v9->_requestIdToFeatsMapping = (NSMutableDictionary *)v17;

  __int16 v19 = CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v23 = "-[CSAttSiriUresNode initWithSupportsUOD:supportsHybridUOD:isMedocFeatureEnabled:]";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s Created URES-AS node", buf, 0xCu);
  }
  return v9;
}

- (CSAttSiriUresNode)initWithAttSiriController:(id)a3
{
  id v4 = a3;
  id v5 = [(CSAttSiriUresNode *)self init];
  BOOL v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_attSiriController, v4);
  }

  return v6;
}

- (CSAttSiriUresNode)init
{
  id v3 = +[CSUtils supportsUnderstandingOnDevice];
  id v4 = +[CSUtils supportsHybridUnderstandingOnDevice];
  id v5 = +[CSUtils isMedocFeatureEnabled];
  return [(CSAttSiriUresNode *)self initWithSupportsUOD:v3 supportsHybridUOD:v4 isMedocFeatureEnabled:v5];
}

+ (float)_extractLrnnScoreForResultCandidate:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  float v5 = -1.0;
  if (v3)
  {
    BOOL v6 = [v3 latticeMitigatorResult];

    if (v6)
    {
      BOOL v7 = [v4 latticeMitigatorResult];
      [v7 score];
      float v5 = v8;
    }
  }
  id v9 = CSLogCategorySDSD;
  if (os_log_type_enabled(CSLogCategorySDSD, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    uint64_t v12 = "+[CSAttSiriUresNode _extractLrnnScoreForResultCandidate:]";
    __int16 v13 = 2050;
    double v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Setting lrnn score to %{public}.3f per speech package", (uint8_t *)&v11, 0x16u);
  }

  return v5;
}

@end