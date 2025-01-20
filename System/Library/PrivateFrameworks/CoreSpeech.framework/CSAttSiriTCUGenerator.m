@interface CSAttSiriTCUGenerator
- (BOOL)_shouldDropPackage:(id)a3;
- (BOOL)_shouldProcessResultCandidateForTask:(id)a3;
- (BOOL)isMultiUserRequest;
- (BOOL)isSDSDAftmOperational;
- (BOOL)requestInProcess;
- (BOOL)shouldEnforceLastEagerRCSelection;
- (BOOL)shouldRefreshScores;
- (BOOL)trpCandidateDelivered;
- (BOOL)trpDetectDelivered;
- (BOOL)trpDetectSelected;
- (BOOL)useEndpointerSignal;
- (CSAttSiriEndpointerNode)endpointerNode;
- (CSAttSiriTCUCache)tcuCache;
- (CSAttSiriTCUGenerator)init;
- (CSAttSiriTCUGeneratorDelegate)delegate;
- (CSAttSiriUresNode)uresNode;
- (CSEndpointDelayReporter)epdDelayReporter;
- (CSEndpointerMetrics)endpointerMetrics;
- (CSIntuitiveConvRequestHandler)requestHandler;
- (CSTCUPruner)TCUPruner;
- (CSTrpTcuMapper)tcuTrpMapper;
- (NSHashTable)executionStateReceivers;
- (NSHashTable)recognitionTaskCompletionReceivers;
- (NSHashTable)tcuReceivers;
- (NSMutableArray)multiUserTrpIdList;
- (NSMutableDictionary)multiUserTrpCache;
- (NSNumber)requestInvocationType;
- (NSString)firstTRPIdForSegment;
- (NSString)lastTRPIdForSegment;
- (NSString)mhId;
- (NSString)requestId;
- (NSUUID)turnIdentifier;
- (OS_dispatch_queue)queue;
- (id)_generateNewTRPId;
- (id)_generateSingleTCU:(id)a3 withRequestID:(id)a4 uresInvocationType:(id)a5;
- (id)_generateTCUs:(id)a3 withRequestID:(id)a4 uresInvocationType:(id)a5;
- (id)_generateTCUsFromExistingTCUs:(id)a3;
- (int64_t)_getPhraseTypeFromUresInvocationType:(id)a3;
- (int64_t)speechEvent;
- (void)_deliverTCUUpdateForTCUId:(id)a3 withTCUAccepted:(BOOL)a4 forRequestId:(id)a5 isFinal:(BOOL)a6;
- (void)_deliverTRPCandidatePackage:(id)a3;
- (void)_deliverTRPDetected:(id)a3 withTRPId:(id)a4;
- (void)_doTrpTcuMappingWithTrpid:(id)a3 speechPackage:(id)a4 forceTrpSelection:(BOOL)a5;
- (void)_emitSpeechStopDetectedWithTrpId:(id)a3 withHostTime:(unint64_t)a4;
- (void)_emitTRPCreatedEventWithTRPId:(id)a3 withResultCandidateId:(id)a4 withRequestId:(id)a5;
- (void)_emitTRPRequestLinkEventWithTRPId:(id)a3 withRequestId:(id)a4;
- (void)_enforceLastEagerRCSelection;
- (void)_generateTCUCandidateWithRefershedScoresForTrpIdAsync:(id)a3;
- (void)_processMultiUserResultCandidate:(id)a3 withId:(id)a4 isScoreRefreshAllowed:(BOOL)a5;
- (void)_processResultCandidate:(id)a3 withId:(id)a4 uresInvocationType:(id)a5 isScoreRefreshAllowed:(BOOL)a6;
- (void)_reportEndpointMetrics:(id)a3 forTrpId:(id)a4;
- (void)_reset;
- (void)_sendSelectedTrpId:(id)a3 endpointerMetrics:(id)a4;
- (void)_updateRefreshScoresForPackage:(id)a3;
- (void)_updateTcuCache:(id)a3;
- (void)addRecognitionTaskCompletionReceiver:(id)a3;
- (void)addTCUReceiver:(id)a3;
- (void)addTRPCandidateExecutionStateReceiver:(id)a3;
- (void)attSiriNode:(id)a3 didDetectEndpointEventAtTime:(double)a4 eventType:(int64_t)a5 withMetrics:(id)a6 useEndpointerSignal:(BOOL)a7;
- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6;
- (void)attSiriNode:(id)a3 selectedTRPId:(id)a4 withMetrics:(id)a5;
- (void)didCompleteRecognitionTaskWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6;
- (void)didReceiveFinalResultWithRequestId:(id)a3 speechPackage:(id)a4 taskName:(id)a5;
- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 inputOrigin:(id)a5 speechPackage:(id)a6 duration:(double)a7 taskName:(id)a8;
- (void)processReadyForExecutionForRequestId:(id)a3 withTrpId:(id)a4;
- (void)processTCUUpdateMessage:(id)a3;
- (void)registerEndpointerNode:(id)a3;
- (void)registerEndpointerProxy:(id)a3;
- (void)registerUresNode:(id)a3;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setEndpointerMetrics:(id)a3;
- (void)setEpdDelayReporter:(id)a3;
- (void)setExecutionStateReceivers:(id)a3;
- (void)setFirstTRPIdForSegment:(id)a3;
- (void)setIsMultiUserRequest:(BOOL)a3;
- (void)setIsSDSDAftmOperational:(BOOL)a3;
- (void)setLastTRPIdForSegment:(id)a3;
- (void)setMhId:(id)a3;
- (void)setMultiUserTrpCache:(id)a3;
- (void)setMultiUserTrpIdList:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecognitionTaskCompletionReceivers:(id)a3;
- (void)setRequestHandler:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setRequestInProcess:(BOOL)a3;
- (void)setRequestInvocationType:(id)a3;
- (void)setShouldEnforceLastEagerRCSelection:(BOOL)a3;
- (void)setShouldRefreshScores:(BOOL)a3;
- (void)setSpeechEvent:(int64_t)a3;
- (void)setTCUPruner:(id)a3;
- (void)setTcuCache:(id)a3;
- (void)setTcuReceivers:(id)a3;
- (void)setTcuTrpMapper:(id)a3;
- (void)setTrpCandidateDelivered:(BOOL)a3;
- (void)setTrpDetectDelivered:(BOOL)a3;
- (void)setTrpDetectSelected:(BOOL)a3;
- (void)setTurnIdentifier:(id)a3;
- (void)setUseEndpointerSignal:(BOOL)a3;
- (void)startWithRecordContext:(id)a3 withRequestId:(id)a4;
- (void)updateAFTMOperationalStatus:(BOOL)a3 forRequestId:(id)a4;
- (void)updateInvocationType:(id)a3 forRequestId:(id)a4;
@end

@implementation CSAttSiriTCUGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestInvocationType, 0);
  objc_storeStrong((id *)&self->_multiUserTrpCache, 0);
  objc_storeStrong((id *)&self->_multiUserTrpIdList, 0);
  objc_storeStrong((id *)&self->_turnIdentifier, 0);
  objc_storeStrong((id *)&self->_tcuTrpMapper, 0);
  objc_storeStrong((id *)&self->_endpointerMetrics, 0);
  objc_storeStrong((id *)&self->_epdDelayReporter, 0);
  objc_storeStrong((id *)&self->_recognitionTaskCompletionReceivers, 0);
  objc_storeStrong((id *)&self->_executionStateReceivers, 0);
  objc_storeStrong((id *)&self->_tcuReceivers, 0);
  objc_storeStrong((id *)&self->_tcuCache, 0);
  objc_storeStrong((id *)&self->_TCUPruner, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_lastTRPIdForSegment, 0);
  objc_storeStrong((id *)&self->_firstTRPIdForSegment, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_destroyWeak((id *)&self->_endpointerNode);
  objc_destroyWeak((id *)&self->_uresNode);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestHandler, 0);
}

- (void)setRequestInvocationType:(id)a3
{
}

- (NSNumber)requestInvocationType
{
  return self->_requestInvocationType;
}

- (void)setIsMultiUserRequest:(BOOL)a3
{
  self->_isMultiUserRequest = a3;
}

- (BOOL)isMultiUserRequest
{
  return self->_isMultiUserRequest;
}

- (void)setMultiUserTrpCache:(id)a3
{
}

- (NSMutableDictionary)multiUserTrpCache
{
  return self->_multiUserTrpCache;
}

- (void)setMultiUserTrpIdList:(id)a3
{
}

- (NSMutableArray)multiUserTrpIdList
{
  return self->_multiUserTrpIdList;
}

- (void)setTurnIdentifier:(id)a3
{
}

- (NSUUID)turnIdentifier
{
  return self->_turnIdentifier;
}

- (void)setUseEndpointerSignal:(BOOL)a3
{
  self->_useEndpointerSignal = a3;
}

- (BOOL)useEndpointerSignal
{
  return self->_useEndpointerSignal;
}

- (void)setIsSDSDAftmOperational:(BOOL)a3
{
  self->_isSDSDAftmOperational = a3;
}

- (BOOL)isSDSDAftmOperational
{
  return self->_isSDSDAftmOperational;
}

- (void)setTcuTrpMapper:(id)a3
{
}

- (CSTrpTcuMapper)tcuTrpMapper
{
  return self->_tcuTrpMapper;
}

- (void)setShouldEnforceLastEagerRCSelection:(BOOL)a3
{
  self->_shouldEnforceLastEagerRCSelection = a3;
}

- (BOOL)shouldEnforceLastEagerRCSelection
{
  return self->_shouldEnforceLastEagerRCSelection;
}

- (void)setEndpointerMetrics:(id)a3
{
}

- (CSEndpointerMetrics)endpointerMetrics
{
  return self->_endpointerMetrics;
}

- (void)setEpdDelayReporter:(id)a3
{
}

- (CSEndpointDelayReporter)epdDelayReporter
{
  return self->_epdDelayReporter;
}

- (void)setRecognitionTaskCompletionReceivers:(id)a3
{
}

- (NSHashTable)recognitionTaskCompletionReceivers
{
  return self->_recognitionTaskCompletionReceivers;
}

- (void)setExecutionStateReceivers:(id)a3
{
}

- (NSHashTable)executionStateReceivers
{
  return self->_executionStateReceivers;
}

- (void)setTcuReceivers:(id)a3
{
}

- (NSHashTable)tcuReceivers
{
  return self->_tcuReceivers;
}

- (void)setShouldRefreshScores:(BOOL)a3
{
  self->_shouldRefreshScores = a3;
}

- (BOOL)shouldRefreshScores
{
  return self->_shouldRefreshScores;
}

- (void)setTrpDetectDelivered:(BOOL)a3
{
  self->_trpDetectDelivered = a3;
}

- (BOOL)trpDetectDelivered
{
  return self->_trpDetectDelivered;
}

- (void)setTrpDetectSelected:(BOOL)a3
{
  self->_trpDetectSelected = a3;
}

- (BOOL)trpDetectSelected
{
  return self->_trpDetectSelected;
}

- (void)setTrpCandidateDelivered:(BOOL)a3
{
  self->_trpCandidateDelivered = a3;
}

- (BOOL)trpCandidateDelivered
{
  return self->_trpCandidateDelivered;
}

- (void)setRequestInProcess:(BOOL)a3
{
  self->_requestInProcess = a3;
}

- (BOOL)requestInProcess
{
  return self->_requestInProcess;
}

- (void)setTcuCache:(id)a3
{
}

- (CSAttSiriTCUCache)tcuCache
{
  return self->_tcuCache;
}

- (void)setSpeechEvent:(int64_t)a3
{
  self->_speechEvent = a3;
}

- (int64_t)speechEvent
{
  return self->_speechEvent;
}

- (void)setTCUPruner:(id)a3
{
}

- (CSTCUPruner)TCUPruner
{
  return self->_TCUPruner;
}

- (void)setRequestId:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setLastTRPIdForSegment:(id)a3
{
}

- (NSString)lastTRPIdForSegment
{
  return self->_lastTRPIdForSegment;
}

- (void)setFirstTRPIdForSegment:(id)a3
{
}

- (NSString)firstTRPIdForSegment
{
  return self->_firstTRPIdForSegment;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)mhId
{
  return self->_mhId;
}

- (void)registerEndpointerNode:(id)a3
{
}

- (CSAttSiriEndpointerNode)endpointerNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerNode);
  return (CSAttSiriEndpointerNode *)WeakRetained;
}

- (CSAttSiriUresNode)uresNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uresNode);
  return (CSAttSiriUresNode *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSAttSiriTCUGeneratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSAttSiriTCUGeneratorDelegate *)WeakRetained;
}

- (void)setRequestHandler:(id)a3
{
}

- (CSIntuitiveConvRequestHandler)requestHandler
{
  return self->_requestHandler;
}

- (id)_generateTCUsFromExistingTCUs:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v4 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      v7 = "-[CSAttSiriTCUGenerator _generateTCUsFromExistingTCUs:]";
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s new TCU Object is nil!", (uint8_t *)&v6, 0xCu);
    }
  }

  return 0;
}

- (void)_reportEndpointMetrics:(id)a3 forTrpId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v8 = [(CSAttSiriTCUGenerator *)self tcuReceivers];
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (v13 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v13 attSiriNode:self selectedTRPId:v7 withMetrics:v6];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v10);
  }

  if (!self->_isMultiUserRequest)
  {
    v15 = [(CSAttSiriTCUCache *)self->_tcuCache getTCUPackageWithTrpId:v7];
    v20 = [v15 speechPackage];
    goto LABEL_18;
  }
  multiUserTrpCache = self->_multiUserTrpCache;
  if (multiUserTrpCache && self->_requestId)
  {
    v15 = -[NSMutableDictionary objectForKeyedSubscript:](multiUserTrpCache, "objectForKeyedSubscript:");
    v16 = [v15 trpCandidateList];
    v17 = [v16 firstObject];
    v18 = [v17 tcuList];
    v19 = [v18 firstObject];
    v20 = [v19 speechPackage];

LABEL_18:
    v37[0] = @"leadingSilence";
    +[CSAttSiriSpeechPackageHelper getFirstTokenLeadingSilenceFromSpeechPackage:v20];
    v24 = +[NSNumber numberWithDouble:v23 * 1000.0];
    v38[0] = v24;
    v37[1] = @"trailingSilence";
    +[CSAttSiriSpeechPackageHelper getLastTokenTrailingSilenceFromSpeechPackage:v20];
    v26 = +[NSNumber numberWithDouble:v25 * 1000.0];
    v38[1] = v26;
    v37[2] = @"endTime";
    +[CSAttSiriSpeechPackageHelper getLastTokenEndTimeFromSpeechPackage:v20];
    v28 = +[NSNumber numberWithDouble:v27 * 1000.0];
    v38[2] = v28;
    v29 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];

    [(CSEndpointDelayReporter *)self->_epdDelayReporter setStopRecordingHostTime:mach_absolute_time()];
    epdDelayReporter = self->_epdDelayReporter;
    [v6 totalAudioRecorded];
    -[CSEndpointDelayReporter setEndpointTimeInMs:](epdDelayReporter, "setEndpointTimeInMs:");
    -[CSEndpointDelayReporter setEndpointBufferHostTime:](self->_epdDelayReporter, "setEndpointBufferHostTime:", [v6 endpointBufferHostTime]);
    v31 = self->_epdDelayReporter;
    +[CSAttSiriSpeechPackageHelper getLastTokenSilenceStartFromSpeechPackage:v20];
    [(CSEndpointDelayReporter *)v31 setUserSpeakingEndedTimeInMs:v32 * 1000.0];
    [(CSEndpointDelayReporter *)self->_epdDelayReporter setSpeechRecognizedContext:v29 withEndpointerMetrics:v6 withTrpId:v7];
    [(CSEndpointDelayReporter *)self->_epdDelayReporter reportEndpointDelayIfNeed];

    goto LABEL_19;
  }
  v21 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
  {
    requestId = self->_requestId;
    *(_DWORD *)buf = 136315394;
    v40 = "-[CSAttSiriTCUGenerator _reportEndpointMetrics:forTrpId:]";
    __int16 v41 = 2112;
    v42 = requestId;
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s No Valid MultiUser TRPCache found for Multiuser requestId(%@), Bailing out!", buf, 0x16u);
  }
LABEL_19:
}

- (void)_emitSpeechStopDetectedWithTrpId:(id)a3 withHostTime:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001128B0;
  block[3] = &unk_1002532A8;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_emitTRPCreatedEventWithTRPId:(id)a3 withResultCandidateId:(id)a4 withRequestId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315906;
    double v23 = "-[CSAttSiriTCUGenerator _emitTRPCreatedEventWithTRPId:withResultCandidateId:withRequestId:]";
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s emitting SELF logging event TRPCreated with TRPId: %@, resultCandidateId: %@, requestId: %@", (uint8_t *)&v22, 0x2Au);
  }
  id v12 = objc_alloc_init((Class)MHSchemaMHTRPCreated);
  id v13 = objc_alloc((Class)SISchemaUUID);
  id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:v8];
  id v15 = [v13 initWithNSUUID:v14];
  [v12 setTrpId:v15];

  [v12 setResultCandidateId:v9];
  id v16 = objc_alloc_init((Class)MHSchemaMHClientEvent);
  id v17 = objc_alloc_init((Class)MHSchemaMHClientEventMetadata);
  id v18 = objc_alloc((Class)SISchemaUUID);
  id v19 = [objc_alloc((Class)NSUUID) initWithUUIDString:self->_mhId];
  id v20 = [v18 initWithNSUUID:v19];
  [v17 setMhId:v20];

  [v16 setEventMetadata:v17];
  [v16 setTrpCreated:v12];
  v21 = +[AssistantSiriAnalytics sharedStream];
  [v21 emitMessage:v16];
}

- (void)_emitTRPRequestLinkEventWithTRPId:(id)a3 withRequestId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315650;
    id v17 = "-[CSAttSiriTCUGenerator _emitTRPRequestLinkEventWithTRPId:withRequestId:]";
    __int16 v18 = 2112;
    id v19 = v5;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s emitting SELF logging event TRPRequestLink with TRPId: %@, requestId: %@", (uint8_t *)&v16, 0x20u);
  }
  id v8 = objc_alloc_init((Class)SISchemaTRPRequestLink);
  [v8 setSource:2];
  id v9 = objc_alloc((Class)SISchemaUUID);
  id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:v5];
  id v11 = [v9 initWithNSUUID:v10];
  [v8 setTrpId:v11];

  id v12 = objc_alloc((Class)SISchemaUUID);
  id v13 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
  id v14 = [v12 initWithNSUUID:v13];
  [v8 setRequestId:v14];

  id v15 = +[AssistantSiriAnalytics sharedStream];
  [v15 emitMessage:v8];
}

- (void)didCompleteRecognitionTaskWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(CSAttSiriTCUGenerator *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100112FDC;
  block[3] = &unk_100253418;
  id v20 = v10;
  int64_t v21 = a5;
  block[4] = self;
  id v18 = v12;
  id v19 = v11;
  id v14 = v10;
  id v15 = v11;
  id v16 = v12;
  dispatch_async(v13, block);
}

- (void)didReceiveFinalResultWithRequestId:(id)a3 speechPackage:(id)a4 taskName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001132F8;
  v15[3] = &unk_100252E18;
  id v16 = v10;
  id v17 = self;
  id v18 = v9;
  id v19 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)didReceiveResultCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 inputOrigin:(id)a5 speechPackage:(id)a6 duration:(double)a7 taskName:(id)a8
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a8;
  queue = self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001134C4;
  v18[3] = &unk_100252E18;
  id v19 = v13;
  id v20 = self;
  id v21 = v12;
  id v22 = v11;
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  dispatch_async(queue, v18);
}

- (void)attSiriNode:(id)a3 didDetectEndpointEventAtTime:(double)a4 eventType:(int64_t)a5 withMetrics:(id)a6 useEndpointerSignal:(BOOL)a7
{
  id v11 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100113660;
  block[3] = &unk_100252AF8;
  BOOL v18 = a7;
  double v16 = a4;
  block[4] = self;
  id v15 = v11;
  int64_t v17 = a5;
  id v13 = v11;
  dispatch_async(queue, block);
}

- (void)attSiriNode:(id)a3 selectedTRPId:(id)a4 withMetrics:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011399C;
  block[3] = &unk_100253540;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)registerEndpointerProxy:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100113B6C;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6
{
  id v7 = a5;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100113C10;
  v10[3] = &unk_100253B08;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, v10);
}

- (void)_updateRefreshScoresForPackage:(id)a3
{
  id v4 = [a3 tcuList];
  id v5 = [v4 firstObject];
  id v6 = [v5 siriIntendedInfo];

  id v7 = [v6 invocationType];
  if (!v7) {
    goto LABEL_10;
  }
  int64_t speechEvent = self->_speechEvent;

  if (speechEvent == 5) {
    goto LABEL_10;
  }
  id v9 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isSDSDAftmOperational = self->_isSDSDAftmOperational;
    int v14 = 136315394;
    id v15 = "-[CSAttSiriTCUGenerator _updateRefreshScoresForPackage:]";
    __int16 v16 = 1024;
    BOOL v17 = isSDSDAftmOperational;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s isAftmModelOperational:%u", (uint8_t *)&v14, 0x12u);
  }
  BOOL v11 = self->_isSDSDAftmOperational;
  if (v11)
  {
    [v6 aftmScore];
    if (v12 < 0.0)
    {
      id v13 = CSLogCategoryRequest;
      if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315138;
        id v15 = "-[CSAttSiriTCUGenerator _updateRefreshScoresForPackage:]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s AFTM score is nil, needs TCU refresh", (uint8_t *)&v14, 0xCu);
      }
      BOOL v11 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v11 = 0;
  }
LABEL_11:
  self->_shouldRefreshScores = v11;
}

- (void)_generateTCUCandidateWithRefershedScoresForTrpIdAsync:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100113EF0;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (int64_t)_getPhraseTypeFromUresInvocationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToNumber:&off_10025E0F8])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToNumber:&off_10025E110])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_generateSingleTCU:(id)a3 withRequestID:(id)a4 uresInvocationType:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  BOOL v11 = +[NSUUID UUID];
  float v12 = [v11 UUIDString];

  id v13 = v8;
  [v10 utteranceStart];
  double v15 = v14;
  __int16 v16 = [v10 recognition];
  [v16 processedAudioDuration];
  double v18 = v15 + v17;

  id v19 = objc_alloc((Class)sub_100114298());
  int64_t speechEvent = self->_speechEvent;
  int64_t v21 = [(CSAttSiriTCUGenerator *)self _getPhraseTypeFromUresInvocationType:v9];

  id v22 = [v19 initWithTcuId:v12 requestId:v13 tcuState:1 speechEvent:speechEvent voiceTriggerPhraseType:v21 siriIntendedInfo:0 prevTCUIds:v15 startAudioTimeStampInMs:v18 endAudioTimeStampInMs:0 speechPackage:v10];
  double v23 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v27 = "-[CSAttSiriTCUGenerator _generateSingleTCU:withRequestID:uresInvocationType:]";
    __int16 v28 = 2112;
    id v29 = v22;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s newTCUObject :%@", buf, 0x16u);
  }
  if (!v22)
  {
    __int16 v24 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v27 = "-[CSAttSiriTCUGenerator _generateSingleTCU:withRequestID:uresInvocationType:]";
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s Failed to create TCU Object!", buf, 0xCu);
    }
  }

  return v22;
}

- (id)_generateTCUs:(id)a3 withRequestID:(id)a4 uresInvocationType:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  float v12 = +[NSUUID UUID];
  id v13 = [v12 UUIDString];

  id v14 = v8;
  [v10 utteranceStart];
  double v16 = v15;
  double v17 = [v10 recognition];
  [v17 processedAudioDuration];
  double v19 = v16 + v18;

  id v20 = objc_alloc((Class)sub_100114298());
  int64_t speechEvent = self->_speechEvent;
  int64_t v22 = [(CSAttSiriTCUGenerator *)self _getPhraseTypeFromUresInvocationType:v9];

  id v23 = [v20 initWithTcuId:v13 requestId:v14 tcuState:1 speechEvent:speechEvent voiceTriggerPhraseType:v22 siriIntendedInfo:0 prevTCUIds:v16 startAudioTimeStampInMs:v19 endAudioTimeStampInMs:0 speechPackage:v10];
  __int16 v24 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[CSAttSiriTCUGenerator _generateTCUs:withRequestID:uresInvocationType:]";
    __int16 v31 = 2112;
    id v32 = v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s newTCUObject :%@", buf, 0x16u);
  }
  if (v23)
  {
    [v11 addObject:v23];
    id v25 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[CSAttSiriTCUGenerator _generateTCUs:withRequestID:uresInvocationType:]";
      __int16 v31 = 2112;
      id v32 = v11;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s TCUCandidateList :%@", buf, 0x16u);
    }
    id v26 = v11;
  }
  else
  {
    id v27 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[CSAttSiriTCUGenerator _generateTCUs:withRequestID:uresInvocationType:]";
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s Failed to create TCU Object!", buf, 0xCu);
    }
    id v26 = 0;
  }

  return v26;
}

- (id)_generateNewTRPId
{
  v2 = +[NSUUID UUID];
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)_deliverTCUUpdateForTCUId:(id)a3 withTCUAccepted:(BOOL)a4 forRequestId:(id)a5 isFinal:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  float v12 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v25 = "-[CSAttSiriTCUGenerator _deliverTCUUpdateForTCUId:withTCUAccepted:forRequestId:isFinal:]";
    __int16 v26 = 2114;
    id v27 = v11;
    __int16 v28 = 1024;
    BOOL v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Publishing update for requestId: %{public}@ tcuAccepted: %d", buf, 0x1Cu);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = [(CSAttSiriTCUGenerator *)self tcuReceivers];
  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      double v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v17);
        if (objc_opt_respondsToSelector()) {
          [v18 didReceiveTCUUpdateForTCUId:v10 withTCUAccepted:v8 forRequestId:v11 isFinal:v6];
        }
        double v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }
}

- (void)_deliverTRPDetected:(id)a3 withTRPId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v27 = v6;
  if (self->_shouldRefreshScores)
  {
    BOOL v8 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSAttSiriTCUGenerator _deliverTRPDetected:withTRPId:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Trigger new TCU candidate for trpId: %@", buf, 0x16u);
    }
    [(CSAttSiriTCUGenerator *)self _generateTCUCandidateWithRefershedScoresForTrpIdAsync:v7];
    self->_shouldRefreshScores = 0;
  }
  else
  {
    if (v6)
    {
      id v9 = [v6 endpointBufferHostTime];
      [v6 totalAudioRecorded];
      double v11 = v10;
    }
    else
    {
      id v9 = (id)mach_absolute_time();
      float v12 = [(CSAttSiriTCUCache *)self->_tcuCache getTCUPackageWithTrpId:self->_lastTRPIdForSegment];
      [v12 endAudioTimeStampInMs];
      double v14 = v13;
      [v12 startAudioTimeStampInMs];
      double v11 = v14 - v15;
    }
    double v16 = (double)(unint64_t)v9;
    double v17 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[CSAttSiriTCUGenerator _deliverTRPDetected:withTRPId:]";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2048;
      double v38 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s trpDetectGenerationTime:%f totalRecordAudio:%f ", buf, 0x20u);
    }
    uint64_t v32 = 0;
    long long v33 = &v32;
    uint64_t v34 = 0x2050000000;
    double v18 = (void *)qword_1002A3A50;
    uint64_t v35 = qword_1002A3A50;
    if (!qword_1002A3A50)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100114E58;
      double v38 = COERCE_DOUBLE(&unk_100253440);
      v39 = &v32;
      sub_100114E58((uint64_t)buf);
      double v18 = (void *)v33[3];
    }
    long long v19 = v18;
    _Block_object_dispose(&v32, 8);
    id v20 = [[v19 alloc] initWithGeneratedHostTime:(unint64_t)v16 lastTRPCandidateId:v7 trpDetectedAudioTimeStamp:self->_requestId requestId:v11];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v21 = [(CSAttSiriTCUGenerator *)self tcuReceivers];
    id v22 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v29;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(v21);
          }
          id v25 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v25 didGenerateTRPDetector:v20];
          }
        }
        id v22 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v22);
    }

    -[CSAttSiriTCUGenerator _emitSpeechStopDetectedWithTrpId:withHostTime:](self, "_emitSpeechStopDetectedWithTrpId:withHostTime:", v7, [v27 endpointHostTime]);
    self->_trpDetectDelivered = 1;
    if (v27)
    {
      [(CSAttSiriTCUGenerator *)self _reportEndpointMetrics:v27 forTrpId:v7];
    }
    else
    {
      __int16 v26 = CSLogCategoryRequest;
      if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[CSAttSiriTCUGenerator _deliverTRPDetected:withTRPId:]";
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s Not reporting EPD due to nil endpointerMetrics", buf, 0xCu);
      }
    }
  }
}

- (void)_deliverTRPCandidatePackage:(id)a3
{
  id v4 = a3;
  id v5 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    double v18 = "-[CSAttSiriTCUGenerator _deliverTRPCandidatePackage:]";
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s trpCandidateInfo:%@", buf, 0x16u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSAttSiriTCUGenerator *)self tcuReceivers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 didGenerateTRPCandidatePackage:v4];
        }
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  self->_trpCandidateDelivered = 1;
}

- (void)_updateTcuCache:(id)a3
{
  id v4 = a3;
  id v5 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "-[CSAttSiriTCUGenerator _updateTcuCache:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s trpCandidateInfo:%@", buf, 0x16u);
  }
  id v6 = [v4 tcuList];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100115198;
  v7[3] = &unk_100251E28;
  v7[4] = self;
  [v6 enumerateObjectsUsingBlock:v7];
}

- (BOOL)_shouldDropPackage:(id)a3
{
  unsigned int v4 = [a3 isFinal];
  unint64_t v5 = [(CSAttSiriTCUCache *)self->_tcuCache cachedTCUCount];
  id v6 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    BOOL trpDetectDelivered = self->_trpDetectDelivered;
    int v9 = 136315906;
    __int16 v10 = "-[CSAttSiriTCUGenerator _shouldDropPackage:]";
    __int16 v11 = 1024;
    BOOL v12 = trpDetectDelivered;
    __int16 v13 = 1024;
    unsigned int v14 = v4;
    __int16 v15 = 1024;
    BOOL v16 = v5 != 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s trpDetectDelivered:%u isFinalRC:%u anyCachedRC:%u", (uint8_t *)&v9, 0x1Eu);
  }
  BOOL result = self->_trpDetectDelivered;
  if (!self->_trpDetectDelivered && ((v4 ^ 1) & 1) == 0)
  {
    BOOL result = 0;
    if (self->_shouldEnforceLastEagerRCSelection)
    {
      if (v5)
      {
        [(CSAttSiriTCUGenerator *)self _enforceLastEagerRCSelection];
        return 1;
      }
    }
  }
  return result;
}

- (void)_enforceLastEagerRCSelection
{
  id v3 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[CSAttSiriTCUGenerator _enforceLastEagerRCSelection]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Force select last Eager RC", (uint8_t *)&v6, 0xCu);
  }
  unsigned int v4 = [(CSAttSiriTCUCache *)self->_tcuCache getTCUPackageWithTrpId:self->_lastTRPIdForSegment];
  unint64_t v5 = [v4 speechPackage];
  self->_shouldRefreshScores = 0;
  [(CSAttSiriTCUGenerator *)self _doTrpTcuMappingWithTrpid:self->_lastTRPIdForSegment speechPackage:v5 forceTrpSelection:1];
}

- (void)_sendSelectedTrpId:(id)a3 endpointerMetrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    BOOL v12 = "-[CSAttSiriTCUGenerator _sendSelectedTrpId:endpointerMetrics:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "KeyLog - %s Sending selected TRPId %@ to delegates", (uint8_t *)&v11, 0x16u);
    id v8 = CSLogCategoryRequest;
  }
  BOOL trpDetectDelivered = self->_trpDetectDelivered;
  BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (trpDetectDelivered)
  {
    if (v10)
    {
      int v11 = 136315394;
      BOOL v12 = "-[CSAttSiriTCUGenerator _sendSelectedTrpId:endpointerMetrics:]";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Ignore TRP selection for trpId: %@, since TRPDetect is already sent", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    if (v10)
    {
      int v11 = 136315394;
      BOOL v12 = "-[CSAttSiriTCUGenerator _sendSelectedTrpId:endpointerMetrics:]";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Received selected trpId: %@ sending TRPDetect msg", (uint8_t *)&v11, 0x16u);
    }
    [(CSAttSiriTCUGenerator *)self _deliverTRPDetected:v7 withTRPId:v6];
  }
}

- (void)_doTrpTcuMappingWithTrpid:(id)a3 speechPackage:(id)a4 forceTrpSelection:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (self->_useEndpointerSignal)
  {
    BOOL v10 = [(CSTrpTcuMapper *)self->_tcuTrpMapper processTRPWithId:v8 withSpeechPackage:v9 enforceTrpSelection:v5];
    int v11 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      id v14 = "-[CSAttSiriTCUGenerator _doTrpTcuMappingWithTrpid:speechPackage:forceTrpSelection:]";
      __int16 v15 = 2112;
      BOOL v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s matchingEPMetrics:%@", (uint8_t *)&v13, 0x16u);
    }
    if (v10) {
      [(CSAttSiriTCUGenerator *)self _sendSelectedTrpId:v8 endpointerMetrics:v10];
    }
  }
  else
  {
    BOOL v12 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      id v14 = "-[CSAttSiriTCUGenerator _doTrpTcuMappingWithTrpid:speechPackage:forceTrpSelection:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Don't run TCU selection for manual endpointing mode", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_processResultCandidate:(id)a3 withId:(id)a4 uresInvocationType:(id)a5 isScoreRefreshAllowed:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    unsigned int v15 = [v10 isFinal];
    BOOL v16 = [v10 rawRecognition];
    double v17 = [v16 oneBestTranscript];
    *(_DWORD *)buf = 136315906;
    v37 = "-[CSAttSiriTCUGenerator _processResultCandidate:withId:uresInvocationType:isScoreRefreshAllowed:]";
    __int16 v38 = 1024;
    *(_DWORD *)v39 = v15;
    *(_WORD *)&v39[4] = 2112;
    *(void *)&v39[6] = v17;
    *(_WORD *)&v39[14] = 1024;
    *(_DWORD *)&v39[16] = v6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "KeyLog - %s isFinal:%u utterance:%@ isScoreRefreshAllowed:%u", buf, 0x22u);
  }
  if ([(CSAttSiriTCUGenerator *)self _shouldDropPackage:v10])
  {
    double v18 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[CSAttSiriTCUGenerator _processResultCandidate:withId:uresInvocationType:isScoreRefreshAllowed:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s Duplicate package - needs to be dropped", buf, 0xCu);
    }
  }
  else if (v10)
  {
    __int16 v19 = [(CSAttSiriTCUGenerator *)self _generateNewTRPId];
    objc_storeStrong((id *)&self->_lastTRPIdForSegment, v19);
    id v20 = [(CSAttSiriTCUGenerator *)self _generateTCUs:v10 withRequestID:v11 uresInvocationType:v12];
    long long v21 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      lastTRPIdForSegment = self->_lastTRPIdForSegment;
      *(_DWORD *)buf = 136315650;
      v37 = "-[CSAttSiriTCUGenerator _processResultCandidate:withId:uresInvocationType:isScoreRefreshAllowed:]";
      __int16 v38 = 2112;
      *(void *)v39 = lastTRPIdForSegment;
      *(_WORD *)&v39[8] = 2112;
      *(void *)&v39[10] = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s TRPId:%@ TCUPackage:%@", buf, 0x20u);
    }
    id v23 = [objc_alloc((Class)sub_100115BA0()) initWithTrpCandidateId:self->_lastTRPIdForSegment requestId:self->_requestId tcuList:v20];
    __int16 v24 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[CSAttSiriTCUGenerator _processResultCandidate:withId:uresInvocationType:isScoreRefreshAllowed:]";
      __int16 v38 = 2112;
      *(void *)v39 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s TRPCandidateInfo :%@", buf, 0x16u);
    }
    id v25 = [v10 resultCandidateId];
    TCUPruner = self->_TCUPruner;
    long long v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    long long v30 = sub_100115C84;
    long long v31 = &unk_100251E00;
    uint64_t v32 = self;
    id v33 = v11;
    id v34 = v25;
    BOOL v35 = v6;
    [(CSTCUPruner *)TCUPruner processTRPCandidateInfo:v23 requestId:v33 withCompletion:&v28];
    -[CSAttSiriTCUGenerator _doTrpTcuMappingWithTrpid:speechPackage:forceTrpSelection:](self, "_doTrpTcuMappingWithTrpid:speechPackage:forceTrpSelection:", self->_lastTRPIdForSegment, v10, 0, v28, v29, v30, v31, v32);
  }
  else
  {
    id v27 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[CSAttSiriTCUGenerator _processResultCandidate:withId:uresInvocationType:isScoreRefreshAllowed:]";
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s Speech package is nil - bailing out", buf, 0xCu);
    }
  }
}

- (void)_processMultiUserResultCandidate:(id)a3 withId:(id)a4 isScoreRefreshAllowed:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSAttSiriTCUGenerator _processMultiUserResultCandidate:withId:isScoreRefreshAllowed:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s requestId: %@", buf, 0x16u);
  }
  if (v7)
  {
    id v10 = [(CSAttSiriTCUGenerator *)self _generateNewTRPId];
    id v11 = +[NSMutableArray array];
    if (!self->_multiUserTrpCache)
    {
      id v12 = +[NSMutableDictionary dictionary];
      multiUserTrpCache = self->_multiUserTrpCache;
      self->_multiUserTrpCache = v12;
    }
    self->_isMultiUserRequest = 1;
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2020000000;
    char v56 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v63 = sub_10011158C;
    v64 = sub_10011159C;
    id v65 = 0;
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2020000000;
    char v52 = 0;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1001164A4;
    v43[3] = &unk_100251DB0;
    v46 = &v53;
    v47 = buf;
    v43[4] = self;
    v48 = &v49;
    id v14 = v8;
    id v44 = v14;
    id v15 = v11;
    id v45 = v15;
    [v7 enumerateKeysAndObjectsUsingBlock:v43];
    if (*((unsigned char *)v50 + 24))
    {
      BOOL v16 = [(NSMutableArray *)self->_multiUserTrpIdList lastObject];
      double v17 = [(CSTrpTcuMapper *)self->_tcuTrpMapper getMatchingRelaxedEPMetricsForTrp:v16];
      double v18 = CSLogCategoryRequest;
      if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v66 = 136315394;
        *(void *)&v66[4] = "-[CSAttSiriTCUGenerator _processMultiUserResultCandidate:withId:isScoreRefreshAllowed:]";
        *(_WORD *)&v66[12] = 2112;
        *(void *)&v66[14] = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s matchingEPMetrics:%@", v66, 0x16u);
      }
      if (v17) {
        [(CSAttSiriTCUGenerator *)self _sendSelectedTrpId:v16 endpointerMetrics:v17];
      }
    }
    else
    {
      uint64_t v57 = 0;
      v58 = &v57;
      uint64_t v59 = 0x2050000000;
      id v20 = (void *)qword_1002A3A48;
      uint64_t v60 = qword_1002A3A48;
      if (!qword_1002A3A48)
      {
        *(void *)v66 = _NSConcreteStackBlock;
        *(void *)&v66[8] = 3221225472;
        *(void *)&v66[16] = sub_100116894;
        v67 = &unk_100253440;
        v68 = &v57;
        sub_100116894((uint64_t)v66);
        id v20 = (void *)v58[3];
      }
      id v34 = v10;
      long long v21 = v20;
      _Block_object_dispose(&v57, 8);
      id v22 = [v21 alloc];
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_100116904;
      v39[3] = &unk_100251DD8;
      id v33 = v34;
      id v40 = v33;
      id v23 = v14;
      id v41 = v23;
      id v42 = v15;
      id v24 = [v22 initWithBuilder:v39];
      id v25 = v24;
      if (v23 && v24)
      {
        [(NSMutableArray *)self->_multiUserTrpIdList addObject:v33];
        [(NSMutableDictionary *)self->_multiUserTrpCache setValue:v25 forKey:v23];
        id v32 = v8;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        __int16 v26 = [(CSAttSiriTCUGenerator *)self tcuReceivers];
        id v27 = [v26 countByEnumeratingWithState:&v35 objects:v61 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v36;
          do
          {
            for (i = 0; i != v27; i = (char *)i + 1)
            {
              if (*(void *)v36 != v28) {
                objc_enumerationMutation(v26);
              }
              long long v30 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              if (objc_opt_respondsToSelector()) {
                [v30 didGenerateMultiUserTRPCandidatePackage:v25];
              }
            }
            id v27 = [v26 countByEnumeratingWithState:&v35 objects:v61 count:16];
          }
          while (v27);
        }

        id v8 = v32;
        self->_trpCandidateDelivered = 1;
        if (*((unsigned char *)v54 + 24)) {
          [(CSAttSiriTCUGenerator *)self _doTrpTcuMappingWithTrpid:v33 speechPackage:*(void *)(*(void *)&buf[8] + 40) forceTrpSelection:1];
        }
      }
      else
      {
        long long v31 = CSLogCategoryRequest;
        if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v66 = 136315138;
          *(void *)&v66[4] = "-[CSAttSiriTCUGenerator _processMultiUserResultCandidate:withId:isScoreRefreshAllowed:]";
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s multiUserTrpCandidate failed to initialize. Bail out!", v66, 0xCu);
        }
      }

      id v10 = v34;
      BOOL v16 = v40;
    }

    _Block_object_dispose(&v49, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v53, 8);
  }
  else
  {
    __int16 v19 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[CSAttSiriTCUGenerator _processMultiUserResultCandidate:withId:isScoreRefreshAllowed:]";
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Speech package is nil - bailing out", buf, 0xCu);
    }
  }
}

- (BOOL)_shouldProcessResultCandidateForTask:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging] & 1) != 0
    || [v3 isEqualToString:CoreEmbeddedSpeechRecognizerTaskSiriDictation];
  BOOL v5 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[CSAttSiriTCUGenerator _shouldProcessResultCandidateForTask:]";
    __int16 v9 = 1024;
    BOOL v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s generateTcuTrpForResultCandidate:%u", (uint8_t *)&v7, 0x12u);
  }

  return v4;
}

- (void)_reset
{
  id v3 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    __int16 v9 = "-[CSAttSiriTCUGenerator _reset]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v8, 0xCu);
  }
  [(CSAttSiriTCUCache *)self->_tcuCache clearTcuCache];
  firstTRPIdForSegment = self->_firstTRPIdForSegment;
  self->_firstTRPIdForSegment = 0;

  lastTRPIdForSegment = self->_lastTRPIdForSegment;
  self->_lastTRPIdForSegment = 0;

  self->_int64_t speechEvent = 0;
  *(_DWORD *)&self->_requestInProcess = 0;
  endpointerMetrics = self->_endpointerMetrics;
  self->_endpointerMetrics = 0;

  *(_WORD *)&self->_shouldEnforceLastEagerRCSelection = 257;
  self->_useEndpointerSignal = 1;
  turnIdentifier = self->_turnIdentifier;
  self->_turnIdentifier = 0;

  [(NSMutableArray *)self->_multiUserTrpIdList removeAllObjects];
  self->_isMultiUserRequest = 0;
  [(CSTrpTcuMapper *)self->_tcuTrpMapper resetForNewRequest];
}

- (void)processReadyForExecutionForRequestId:(id)a3 withTrpId:(id)a4
{
}

- (void)processTCUUpdateMessage:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100116CD0;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addRecognitionTaskCompletionReceiver:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSAttSiriTCUGenerator *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001170A4;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)addTRPCandidateExecutionStateReceiver:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSAttSiriTCUGenerator *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001171F4;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)addTCUReceiver:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSAttSiriTCUGenerator *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100117344;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  __int16 v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)updateInvocationType:(id)a3 forRequestId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011754C;
  block[3] = &unk_100253540;
  id v12 = v7;
  int v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)updateAFTMOperationalStatus:(BOOL)a3 forRequestId:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100117744;
  block[3] = &unk_1002537C0;
  id v10 = v6;
  id v11 = self;
  BOOL v12 = a3;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)setMhId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100117928;
  v7[3] = &unk_100253B08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)startWithRecordContext:(id)a3 withRequestId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100117A58;
  block[3] = &unk_100253540;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)registerUresNode:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100117C34;
  v7[3] = &unk_100253B08;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)reset
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100117D74;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (CSAttSiriTCUGenerator)init
{
  if (+[CSUtils isMedocFeatureEnabled])
  {
    v29.receiver = self;
    v29.super_class = (Class)CSAttSiriTCUGenerator;
    id v3 = [(CSAttSiriTCUGenerator *)&v29 init];
    if (v3)
    {
      dispatch_queue_t v4 = dispatch_queue_create("CSAttSiriTCUGenerator queue", 0);
      BOOL v5 = (void *)*((void *)v3 + 8);
      *((void *)v3 + 8) = v4;

      v3[8] = 0;
      id v6 = (void *)*((void *)v3 + 9);
      *((void *)v3 + 9) = 0;

      id v7 = (void *)*((void *)v3 + 10);
      *((void *)v3 + 10) = 0;

      *((void *)v3 + 13) = 0;
      id v8 = objc_alloc_init(CSAttSiriTCUCache);
      id v9 = (void *)*((void *)v3 + 14);
      *((void *)v3 + 14) = v8;

      *(_WORD *)(v3 + 9) = 0;
      v3[11] = 0;
      id v10 = objc_alloc_init(CSTCUPruner);
      id v11 = (void *)*((void *)v3 + 12);
      *((void *)v3 + 12) = v10;

      uint64_t v12 = +[NSHashTable weakObjectsHashTable];
      id v13 = (void *)*((void *)v3 + 15);
      *((void *)v3 + 15) = v12;

      uint64_t v14 = +[NSHashTable weakObjectsHashTable];
      id v15 = (void *)*((void *)v3 + 16);
      *((void *)v3 + 16) = v14;

      uint64_t v16 = +[NSHashTable weakObjectsHashTable];
      double v17 = (void *)*((void *)v3 + 17);
      *((void *)v3 + 17) = v16;

      v3[12] = 0;
      double v18 = (void *)*((void *)v3 + 11);
      *((void *)v3 + 11) = 0;

      __int16 v19 = (void *)*((void *)v3 + 19);
      *((void *)v3 + 19) = 0;

      v3[13] = 1;
      id v20 = [[CSTrpTcuMapper alloc] initWithQueue:*((void *)v3 + 8)];
      long long v21 = (void *)*((void *)v3 + 20);
      *((void *)v3 + 20) = v20;

      *((_WORD *)v3 + 7) = 257;
      id v22 = (void *)*((void *)v3 + 21);
      *((void *)v3 + 21) = 0;

      id v23 = objc_alloc_init((Class)NSMutableArray);
      id v24 = (void *)*((void *)v3 + 22);
      *((void *)v3 + 22) = v23;

      v3[16] = 0;
      id v25 = CSLogCategoryRequest;
      if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        long long v31 = "-[CSAttSiriTCUGenerator init]";
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s Created CSAttSiriTCUGenerator node", buf, 0xCu);
      }
    }
    self = v3;
    __int16 v26 = self;
  }
  else
  {
    id v27 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v31 = "-[CSAttSiriTCUGenerator init]";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s Medoc feature flag disabled!", buf, 0xCu);
    }
    __int16 v26 = 0;
  }

  return v26;
}

@end